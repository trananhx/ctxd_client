local var_0_0 = 9

CCNumberSprite = {}

function CCNumberSprite.create(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	local var_1_0 = {
		sprites = {},
		singleNumberWidth = arg_1_4,
		alignment = arg_1_3,
		numberNameFormatInCache = arg_1_1
	}

	var_1_0.content_width = 0

	local var_1_1 = CCNode:create()

	var_1_0.node = var_1_1

	for iter_1_0 = 1, var_0_0 do
		local var_1_2 = tool.spriteByName(string.format(arg_1_1, 0))

		var_1_1:addChild(var_1_2)

		var_1_0.sprites[iter_1_0] = var_1_2
	end

	CCNumberSprite:setValue(var_1_0, arg_1_2)

	return var_1_1, var_1_0
end

function CCNumberSprite.setValue(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0, var_2_1 = (function(arg_3_0)
		local var_3_0 = 1
		local var_3_1 = {}

		for iter_3_0 = 1, var_0_0 do
			var_3_1[iter_3_0] = math.mod(arg_3_0, 10)
			arg_3_0 = math.floor(arg_3_0 / 10)

			if arg_3_0 > 0 then
				var_3_0 = var_3_0 + 1
			end
		end

		return var_3_0, var_3_1
	end)(arg_2_2)
	local var_2_2 = 0

	if arg_2_1.alignment == 0 then
		var_2_2 = var_2_0 - 1
	else
		var_2_2 = arg_2_1.alignment == 2 and 0 or (var_2_0 - 1) / 2
	end

	if arg_2_1.singleNumberWidth == nil then
		arg_2_1.singleNumberWidth = arg_2_1.sprites[1]:getContentSize().width
	end

	arg_2_1.content_width = var_2_0 * arg_2_1.singleNumberWidth

	for iter_2_0 = 1, var_0_0 do
		if iter_2_0 <= var_2_0 then
			arg_2_1.sprites[iter_2_0]:setPosition(ccp((var_2_2 - iter_2_0 + 1) * arg_2_1.singleNumberWidth, 0))
			arg_2_1.sprites[iter_2_0]:setDisplayFrame(tool.spriteFrameByName(string.format(arg_2_1.numberNameFormatInCache, var_2_1[iter_2_0])))
			arg_2_1.sprites[iter_2_0]:setVisible(true)
		else
			arg_2_1.sprites[iter_2_0]:setVisible(false)
		end
	end
end
