function createRichNode(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = CCNode:create()

	arg_1_1 = arg_1_1 or 0
	arg_1_2 = arg_1_2 or "center"

	local var_1_1 = 0

	for iter_1_0, iter_1_1 in pairs(arg_1_0) do
		var_1_1 = var_1_1 + iter_1_1:getContentSize().width
	end

	local var_1_2 = 0 - var_1_1 * arg_1_1
	local var_1_3 = 0

	for iter_1_2, iter_1_3 in pairs(arg_1_0) do
		local var_1_4 = iter_1_3:getContentSize().width
		local var_1_5 = iter_1_3:getContentSize().height
		local var_1_6 = 0

		if arg_1_2 == "center" then
			var_1_6 = 0
		elseif arg_1_2 == "top" then
			var_1_6 = -var_1_5 * 0.5
		elseif arg_1_2 == "bottom" then
			var_1_6 = var_1_5 * 0.5
		end

		iter_1_3:setPosition(ccp(var_1_4 * 0.5 + var_1_2, var_1_6))
		var_1_0:addChild(iter_1_3)

		var_1_2 = var_1_2 + var_1_4
	end

	return var_1_0
end

function createRichNode2(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = CCNode:create()

	arg_2_1 = arg_2_1 or 0
	arg_2_2 = arg_2_2 or "center"

	local var_2_1 = 0

	for iter_2_0, iter_2_1 in pairs(arg_2_0) do
		var_2_1 = var_2_1 + iter_2_1:getContentSize().width
	end

	local var_2_2 = var_2_1 * arg_2_1
	local var_2_3 = 0
	local var_2_4 = 0
	local var_2_5 = 0 - var_2_2
	local var_2_6 = 0

	for iter_2_2, iter_2_3 in pairs(arg_2_0) do
		local var_2_7 = iter_2_3:getContentSize().width
		local var_2_8 = iter_2_3:getContentSize().height

		if var_2_4 < var_2_8 then
			var_2_4 = var_2_8
		end

		if arg_2_3 <= var_2_3 then
			var_2_5 = 0 - var_2_2
			var_2_6 = var_2_6 - var_2_4
			var_2_3 = 0
			var_2_4 = 0
		end

		iter_2_3:setPosition(ccp(var_2_7 * 0.5 + var_2_5, var_2_6))
		var_2_0:addChild(iter_2_3)

		var_2_5 = var_2_5 + var_2_7
		var_2_3 = var_2_3 + var_2_7
	end

	return var_2_0
end

function createMultiLineRichNode(arg_3_0, arg_3_1)
	arg_3_1 = arg_3_1 or {}
	arg_3_1.width = arg_3_1.width or 871
	arg_3_1.height = arg_3_1.rowheight or 35
	arg_3_1.hSpace = arg_3_1.hSpace or 0

	local var_3_0 = CCNode:create()
	local var_3_1 = 0
	local var_3_2 = 0
	local var_3_3 = arg_3_1.height

	local function var_3_4(arg_4_0)
		if not arg_4_0 then
			return
		end

		local var_4_0 = arg_4_0:getContentSize().width

		if var_4_0 > arg_3_1.width then
			log.error("@@ 多行富文本，单个node的宽度超过行宽，不能处理")

			return
		end

		if var_3_2 + var_4_0 > arg_3_1.width then
			var_3_3 = var_3_3 + arg_3_1.height
			var_3_1 = var_3_1 - arg_3_1.height
			var_3_2 = 0
		end

		arg_4_0:setAnchorPoint(ccp(0.5, 0.5))
		arg_4_0:setPosition(ccp(var_3_2 + var_4_0 * 0.5, var_3_1 - arg_3_1.height * 0.5))
		var_3_0:addChild(arg_4_0)

		var_3_2 = var_3_2 + var_4_0 + arg_3_1.hSpace
	end

	for iter_3_0, iter_3_1 in pairs(arg_3_0) do
		local var_3_5 = iter_3_1:getContentSize().width
		local var_3_6 = iter_3_1:getContentSize().height

		if tolua.type(iter_3_1) ~= "CCLabelTTF" then
			if iter_3_1.stype == "br" then
				var_3_3 = var_3_3 + arg_3_1.height
				var_3_2 = 0
				var_3_1 = var_3_1 - arg_3_1.height
			else
				var_3_4(iter_3_1)
			end
		else
			local var_3_7 = iter_3_1:getTexture()
			local var_3_8 = iter_3_1:getFontSize()
			local var_3_9 = iter_3_1:getFontName()
			local var_3_10 = iter_3_1:getColor()
			local var_3_11 = iter_3_1:getString()

			for iter_3_2 in string.gfind(var_3_11, "([%z\x01-\x7F\xC2-\xF4][\x80-\xBF]*)") do
				local var_3_12 = iter_3_2:byte(1)

				if var_3_12 ~= 9 and (var_3_12 ~= 224 or platform.platform ~= kTargetAndroid) then
					local var_3_13 = CCLabelTTF:create(iter_3_2, var_3_9, var_3_8)

					var_3_13:setColor(var_3_10)
					var_3_4(var_3_13)
				end
			end
		end
	end

	var_3_0:setContentSize(CCSizeMake(arg_3_1.width, var_3_3))

	return var_3_0
end

function createMultiLineRichNode2(arg_5_0, arg_5_1)
	arg_5_1 = arg_5_1 or {}
	arg_5_1.width = arg_5_1.width or 871
	arg_5_1.height = arg_5_1.rowheight or 35
	arg_5_1.maxHeight = arg_5_1.height
	arg_5_1.offsetY = arg_5_1.height
	arg_5_1.hSpace = arg_5_1.hSpace or 0

	local var_5_0 = CCNode:create()
	local var_5_1 = 0
	local var_5_2 = 0
	local var_5_3 = arg_5_1.height

	local function var_5_4(arg_6_0)
		if not arg_6_0 then
			return
		end

		local var_6_0 = tolua.type(arg_6_0)
		local var_6_1 = arg_6_0:getContentSize().width
		local var_6_2 = arg_6_0:getContentSize().height

		if var_6_1 > arg_5_1.width then
			if var_6_0 == "CCLabelTTF" then
				arg_6_0:setDimensions(CCSizeMake(arg_5_1.width, 0))
				arg_6_0:setHorizontalAlignment(kCCTextAlignmentLeft)

				var_6_1 = arg_6_0:getContentSize().width
				var_6_2 = arg_6_0:getContentSize().height
			else
				log.error("@@ 多行富文本，单个node的宽度超过行宽，不能处理")

				return
			end
		end

		arg_5_1.maxHeight = math.max(arg_5_1.maxHeight, var_6_2)

		if var_5_1 + var_6_1 > arg_5_1.width then
			var_5_3 = var_5_3 + arg_5_1.maxHeight
			var_5_2 = var_5_2 - arg_5_1.offsetY
			var_5_1 = 0

			arg_6_0:setPosition(ccp(var_5_1 + var_6_1 * 0.5, var_5_2 - arg_5_1.maxHeight * 0.5))

			arg_5_1.offsetY = arg_5_1.maxHeight
			arg_5_1.maxHeight = arg_5_1.height
		else
			arg_6_0:setPosition(ccp(var_5_1 + var_6_1 * 0.5, var_5_2 - arg_5_1.height * 0.5))
		end

		arg_6_0:setAnchorPoint(ccp(0.5, 0.5))
		var_5_0:addChild(arg_6_0)

		var_5_1 = var_5_1 + var_6_1 + arg_5_1.hSpace
	end

	for iter_5_0, iter_5_1 in pairs(arg_5_0) do
		if tolua.type(iter_5_1) == "CCLabelTTF" then
			local var_5_5 = iter_5_1:getString()
			local var_5_6 = string.gsub(var_5_5, "\n", "")
			local var_5_7 = iter_5_1:getFontSize()
			local var_5_8 = iter_5_1:getFontName()
			local var_5_9 = iter_5_1:getColor()

			if string.find(var_5_6, "：") == 1 then
				local var_5_10 = CCLabelTTF:create("：", var_5_8, var_5_7)

				var_5_10:setColor(var_5_9)
				var_5_4(var_5_10)

				local var_5_11 = CCLabelTTF:create(string.sub(var_5_6, 4, string.len(var_5_6)), var_5_8, var_5_7)

				var_5_11:setColor(var_5_9)
				var_5_4(var_5_11)
			else
				label = CCLabelTTF:create(var_5_6, var_5_8, var_5_7)

				label:setColor(var_5_9)
				var_5_4(label)
			end
		else
			var_5_4(iter_5_1)
		end
	end

	log.info("nodeHeight:  " .. var_5_3)
	var_5_0:setContentSize(CCSizeMake(arg_5_1.width, var_5_3))

	return var_5_0
end
