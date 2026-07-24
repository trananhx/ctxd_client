#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Tra textId -> chuoi tieng Viet tu bang ban dia hoa da decompile.
Usage:  python resolve.py 190083 190089 490727 ...
Duong dan bang ngon ngu tinh tuong doi theo vi tri script (portable, chay tren may khac).
"""
import sys, os, re

HERE = os.path.dirname(os.path.abspath(__file__))
LANG = os.path.join(HERE, "..", "decompiled", "res", "lang_zh_cn.lua")

def main():
    if not os.path.isfile(LANG):
        print(f"Khong tim thay bang ngon ngu: {LANG}", file=sys.stderr)
        sys.exit(1)
    try:
        sys.stdout.reconfigure(encoding="utf-8")
    except Exception:
        pass
    text = open(LANG, encoding="utf-8", errors="replace").read()
    if len(sys.argv) < 2:
        print("Usage: python resolve.py <textId> [<textId> ...]")
        sys.exit(0)
    for a in sys.argv[1:]:
        m = re.search(r'\[' + re.escape(a) + r'\]\s*=\s*"([^"]*)"', text)
        print(f"{a} = {m.group(1) if m else '(khong tim thay)'}")

if __name__ == "__main__":
    main()
