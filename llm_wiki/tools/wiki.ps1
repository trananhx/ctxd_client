param(
    [Parameter(Position = 0)]
    [string]$Command,

    [Parameter(Position = 1, ValueFromRemainingArguments = $true)]
    [string[]]$Rest
)

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $PSCommandPath)
$Wiki = Join-Path $Root "wiki"

function Get-MarkdownFiles {
    if (-not (Test-Path -LiteralPath $Wiki)) { return @() }
    return @(Get-ChildItem -LiteralPath $Wiki -Recurse -Filter "*.md" -File)
}

function Get-RelativePath {
    param([string]$Path)
    $basePath = [System.IO.Path]::GetFullPath($Root)
    if (-not $basePath.EndsWith([System.IO.Path]::DirectorySeparatorChar)) {
        $basePath += [System.IO.Path]::DirectorySeparatorChar
    }
    $baseUri = [Uri]$basePath
    $targetUri = [Uri][System.IO.Path]::GetFullPath($Path)
    return [Uri]::UnescapeDataString($baseUri.MakeRelativeUri($targetUri).ToString()).Replace("\", "/")
}

function Invoke-Stats {
    $pages = @(Get-MarkdownFiles)
    $raw = @(Get-ChildItem -LiteralPath (Join-Path $Root "raw/sources") -Recurse -File -ErrorAction SilentlyContinue)
    Write-Output "root: $Root"
    Write-Output "wiki pages: $($pages.Count)"
    Write-Output "raw sources: $($raw.Count)"
}

function Invoke-Search {
    $query = ($Rest -join " ").Trim()
    if ([string]::IsNullOrWhiteSpace($query)) {
        throw "Usage: .\tools\wiki.ps1 search <query>"
    }
    $files = @(Get-MarkdownFiles)
    if ($files.Count -eq 0) {
        Write-Output "No wiki pages found."
        return
    }
    Select-String -LiteralPath $files.FullName -Pattern $query -SimpleMatch -CaseSensitive:$false |
        Select-Object -First 30 |
        ForEach-Object {
            "{0}:{1}: {2}" -f (Get-RelativePath $_.Path), $_.LineNumber, $_.Line.Trim()
        }
}

function Invoke-Lint {
    $files = @(Get-MarkdownFiles)
    $targets = @{}
    foreach ($file in $files) {
        $rel = Get-RelativePath $file.FullName
        if ($rel.StartsWith("wiki/")) { $rel = $rel.Substring(5) }
        $withoutExt = if ($rel.EndsWith(".md")) { $rel.Substring(0, $rel.Length - 3) } else { $rel }
        $targets[$file.BaseName.ToLowerInvariant()] = $true
        $targets[$withoutExt.ToLowerInvariant()] = $true
    }

    $broken = 0
    foreach ($file in $files) {
        $text = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
        foreach ($match in [regex]::Matches($text, "\[\[([^\]\|#]+)")) {
            $target = $match.Groups[1].Value.Trim().ToLowerInvariant()
            if (-not $targets.ContainsKey($target)) {
                $broken++
                "{0}: broken wikilink [[{1}]]" -f (Get-RelativePath $file.FullName), $match.Groups[1].Value
            }
        }
        if ($file.Name -notin @("index.md", "log.md", "claims.md", "contradictions.md", "open-questions.md", "glossary.md") -and -not $text.StartsWith("---")) {
            "{0}: missing frontmatter" -f (Get-RelativePath $file.FullName)
        }
    }
    if ($broken -eq 0) {
        Write-Output "No broken wikilinks found."
    }
}

switch ($Command) {
    "stats" { Invoke-Stats }
    "search" { Invoke-Search }
    "lint" { Invoke-Lint }
    default {
        Write-Output "Usage: .\tools\wiki.ps1 stats|search|lint"
    }
}