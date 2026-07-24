module(..., package.seeall)

entity = {
	nbsp = " ",
	quot = "\"",
	gt = ">",
	lt = "<",
	amp = "&"
}

setmetatable(entity, {
	__index = function(arg_1_0, arg_1_1)
		return "&" .. arg_1_1 .. ";"
	end
})

block = {
	"address",
	"blockquote",
	"center",
	"dir",
	"div",
	"dl",
	"fieldset",
	"form",
	"h1",
	"h2",
	"h3",
	"h4",
	"h5",
	"h6",
	"hr",
	"isindex",
	"menu",
	"noframes",
	"ol",
	"p",
	"pre",
	"table",
	"ul"
}
inline = {
	"a",
	"abbr",
	"acronym",
	"applet",
	"b",
	"basefont",
	"bdo",
	"big",
	"br",
	"button",
	"cite",
	"code",
	"dfn",
	"em",
	"font",
	"i",
	"iframe",
	"img",
	"input",
	"kbd",
	"label",
	"map",
	"object",
	"q",
	"s",
	"samp",
	"select",
	"small",
	"span",
	"strike",
	"strong",
	"sub",
	"sup",
	"textarea",
	"tt",
	"u",
	"var"
}
tags = {
	a = {
		empty = false
	},
	abbr = {
		empty = false
	},
	acronym = {
		empty = false
	},
	address = {
		empty = false
	},
	applet = {
		empty = false
	},
	area = {
		empty = true
	},
	b = {
		empty = false
	},
	base = {
		empty = true
	},
	basefont = {
		empty = true
	},
	bdo = {
		empty = false
	},
	big = {
		empty = false
	},
	blockquote = {
		empty = false
	},
	body = {
		empty = false
	},
	br = {
		empty = true
	},
	button = {
		empty = false
	},
	caption = {
		empty = false
	},
	center = {
		empty = false
	},
	cite = {
		empty = false
	},
	code = {
		empty = false
	},
	col = {
		empty = true
	},
	colgroup = {
		optional_end = true,
		empty = false,
		child = {
			"col"
		}
	},
	dd = {
		empty = false
	},
	del = {
		empty = false
	},
	dfn = {
		empty = false
	},
	dir = {
		empty = false
	},
	div = {
		empty = false
	},
	dl = {
		empty = false
	},
	dt = {
		optional_end = true,
		empty = false,
		child = {
			inline,
			"del",
			"ins",
			"noscript",
			"script"
		}
	},
	em = {
		empty = false
	},
	fieldset = {
		empty = false
	},
	font = {
		empty = false
	},
	form = {
		empty = false
	},
	frame = {
		empty = true
	},
	frameset = {
		empty = false
	},
	h1 = {
		empty = false
	},
	h2 = {
		empty = false
	},
	h3 = {
		empty = false
	},
	h4 = {
		empty = false
	},
	h5 = {
		empty = false
	},
	h6 = {
		empty = false
	},
	head = {
		empty = false
	},
	hr = {
		empty = true
	},
	html = {
		empty = false
	},
	i = {
		empty = false
	},
	iframe = {
		empty = false
	},
	img = {
		empty = true
	},
	input = {
		empty = true
	},
	ins = {
		empty = false
	},
	isindex = {
		empty = true
	},
	kbd = {
		empty = false
	},
	label = {
		empty = false
	},
	legend = {
		empty = false
	},
	li = {
		optional_end = true,
		empty = false,
		child = {
			inline,
			block,
			"del",
			"ins",
			"noscript",
			"script"
		}
	},
	link = {
		empty = true
	},
	map = {
		empty = false
	},
	menu = {
		empty = false
	},
	meta = {
		empty = true
	},
	noframes = {
		empty = false
	},
	noscript = {
		empty = false
	},
	object = {
		empty = false
	},
	ol = {
		empty = false
	},
	optgroup = {
		empty = false
	},
	option = {
		optional_end = true,
		empty = false,
		child = {}
	},
	p = {
		optional_end = true,
		empty = false,
		child = {
			inline,
			"del",
			"ins",
			"noscript",
			"script"
		}
	},
	param = {
		empty = true
	},
	pre = {
		empty = false
	},
	q = {
		empty = false
	},
	s = {
		empty = false
	},
	samp = {
		empty = false
	},
	script = {
		empty = false
	},
	select = {
		empty = false
	},
	small = {
		empty = false
	},
	span = {
		empty = false
	},
	strike = {
		empty = false
	},
	strong = {
		empty = false
	},
	style = {
		empty = false
	},
	sub = {
		empty = false
	},
	sup = {
		empty = false
	},
	table = {
		empty = false
	},
	tbody = {
		empty = false
	},
	td = {
		optional_end = true,
		empty = false,
		child = {
			inline,
			block,
			"del",
			"ins",
			"noscript",
			"script"
		}
	},
	textarea = {
		empty = false
	},
	tfoot = {
		optional_end = true,
		empty = false,
		child = {
			"tr"
		}
	},
	th = {
		optional_end = true,
		empty = false,
		child = {
			inline,
			block,
			"del",
			"ins",
			"noscript",
			"script"
		}
	},
	thead = {
		optional_end = true,
		empty = false,
		child = {
			"tr"
		}
	},
	title = {
		empty = false
	},
	tr = {
		optional_end = true,
		empty = false,
		child = {
			"td",
			"th"
		}
	},
	tt = {
		empty = false
	},
	u = {
		empty = false
	},
	ul = {
		empty = false
	},
	var = {
		empty = false
	}
}

setmetatable(tags, {
	__index = function(arg_2_0, arg_2_1)
		return {
			empty = false
		}
	end
})

function newbuf()
	return {
		_buf = {},
		clear = function(arg_4_0)
			arg_4_0._buf = {}

			return arg_4_0
		end,
		content = function(arg_5_0)
			return table.concat(arg_5_0._buf)
		end,
		append = function(arg_6_0, arg_6_1)
			arg_6_0._buf[#arg_6_0._buf + 1] = arg_6_1

			return arg_6_0
		end,
		set = function(arg_7_0, arg_7_1)
			arg_7_0._buf = {
				arg_7_1
			}

			return arg_7_0
		end
	}
end

function unescape(arg_8_0)
	function entity2string(arg_9_0)
		return entity[arg_9_0]
	end

	return arg_8_0.gsub(arg_8_0, "&(#?%w+);", entity2string)
end

function makeiter(arg_10_0)
	local var_10_0 = coroutine.create(arg_10_0)

	return function()
		local var_11_0, var_11_1 = coroutine.resume(var_10_0)

		return var_11_1
	end
end

function Tag(arg_12_0)
	return string.find(arg_12_0, "^</") and {
		type = "End",
		value = arg_12_0
	} or {
		type = "Start",
		value = arg_12_0
	}
end

function Text(arg_13_0)
	local var_13_0 = unescape(arg_13_0)

	return {
		type = "Text",
		value = var_13_0
	}
end

function text(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0:read(1)

	if var_14_0 == "<" then
		if arg_14_1:content() ~= "" then
			coroutine.yield(Text(arg_14_1:content()))
		end

		arg_14_1:set(var_14_0)

		return tag(arg_14_0, arg_14_1)
	elseif var_14_0 then
		arg_14_1:append(var_14_0)

		return text(arg_14_0, arg_14_1)
	elseif arg_14_1:content() ~= "" then
		coroutine.yield(Text(arg_14_1:content()))
	end
end

function tag(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0:read(1)

	if var_15_0 == ">" then
		coroutine.yield(Tag(arg_15_1:append(var_15_0):content()))
		arg_15_1:clear()

		return text(arg_15_0, arg_15_1)
	elseif var_15_0 then
		arg_15_1:append(var_15_0)

		return tag(arg_15_0, arg_15_1)
	elseif arg_15_1:content() ~= "" then
		coroutine.yield(Tag(arg_15_1:content()))
	end
end

function parse_starttag(arg_16_0)
	local var_16_0 = string.match(arg_16_0, "<%s*(%w+)")
	local var_16_1 = {
		_attr = {},
		_tag = var_16_0
	}

	for iter_16_0, iter_16_1, iter_16_2 in string.gmatch(arg_16_0, "(%w+)%s*=%s*([\"'])(.-)%2", i) do
		local var_16_2 = unescape(iter_16_2)

		var_16_1._attr[iter_16_0] = var_16_2
	end

	return var_16_1
end

function parse_endtag(arg_17_0)
	return (string.match(arg_17_0, "<%s*/%s*(%w+)"))
end

function rfind(arg_18_0, arg_18_1)
	for iter_18_0 = #arg_18_0, 1, -1 do
		if arg_18_1(arg_18_0[iter_18_0]) then
			return iter_18_0, arg_18_0[iter_18_0]
		end
	end
end

function flatten(arg_19_0, arg_19_1)
	arg_19_1 = arg_19_1 or {}

	for iter_19_0, iter_19_1 in ipairs(arg_19_0) do
		if type(iter_19_1) == "table" then
			flatten(iter_19_1, arg_19_1)
		else
			arg_19_1[#arg_19_1 + 1] = iter_19_1
		end
	end

	return arg_19_1
end

function optional_end_p(arg_20_0)
	if tags[arg_20_0._tag].optional_end then
		return true
	else
		return false
	end
end

function valid_child_p(arg_21_0, arg_21_1)
	local var_21_0 = tags[arg_21_1._tag].child

	if not var_21_0 then
		return true
	end

	for iter_21_0, iter_21_1 in ipairs(flatten(var_21_0)) do
		if iter_21_1 == arg_21_0._tag then
			return true
		end
	end

	return false
end

function parse(arg_22_0)
	local var_22_0 = {
		_tag = "#document",
		_attr = {}
	}
	local var_22_1 = {
		var_22_0
	}

	for iter_22_0 in makeiter(function()
		return text(arg_22_0, newbuf())
	end) do
		if iter_22_0.type == "Start" then
			local var_22_2 = parse_starttag(iter_22_0.value)
			local var_22_3 = var_22_1[#var_22_1]

			while var_22_3._tag ~= "#document" and optional_end_p(var_22_3) and not valid_child_p(var_22_2, var_22_3) do
				var_22_1[#var_22_1] = nil
				var_22_3 = var_22_1[#var_22_1]
			end

			var_22_3[#var_22_3 + 1] = var_22_2

			if not tags[var_22_2._tag].empty then
				var_22_1[#var_22_1 + 1] = var_22_2
			end
		elseif iter_22_0.type == "End" then
			local var_22_4 = parse_endtag(iter_22_0.value)
			local var_22_5 = rfind(var_22_1, function(arg_24_0)
				if arg_24_0._tag == var_22_4 then
					return true
				else
					return false
				end
			end)

			if var_22_5 then
				for iter_22_1 = #var_22_1, var_22_5, -1 do
					table.remove(var_22_1, iter_22_1)
				end
			end
		else
			local var_22_6 = var_22_1[#var_22_1]

			var_22_6[#var_22_6 + 1] = iter_22_0.value
		end
	end

	return var_22_0
end

function parsestr(arg_25_0)
	local var_25_0 = {
		_pos = 1,
		_content = arg_25_0,
		read = function(arg_26_0, arg_26_1)
			if arg_26_0._pos > string.len(arg_26_0._content) then
				return
			end

			local var_26_0 = string.sub(arg_26_0._content, arg_26_0._pos, arg_26_0._pos + arg_26_1 - 1)

			arg_26_0._pos = arg_26_0._pos + arg_26_1

			return var_26_0
		end
	}

	return parse(var_25_0)
end
