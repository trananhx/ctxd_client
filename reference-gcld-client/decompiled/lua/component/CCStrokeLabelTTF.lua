LABEL_DIRECTION_HORIZONTAL = 1
LABEL_DIRECTION_VERTICAL = 2
CCStrokeLabelTTF = {}

function CCStrokeLabelTTF.create(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5, arg_1_6)
	arg_1_1 = arg_1_1 or ""

	function math.round(arg_2_0)
		return math.floor(arg_2_0 + 0.5)
	end

	local function var_1_0(arg_3_0, arg_3_1, arg_3_2)
		arg_3_0:setPosition(arg_3_1, arg_3_2)
	end

	local var_1_1 = arg_1_5 or ccc3(0, 0, 0)
	local var_1_2 = arg_1_4 or 1
	local var_1_3 = CCNode:create()

	var_1_3.shadow1 = CCLabelTTF:create(arg_1_1, arg_1_2, arg_1_3)

	var_1_3.shadow1:setColor(var_1_1)
	var_1_0(var_1_3.shadow1, var_1_2, 0)

	var_1_3.shadow2 = CCLabelTTF:create(arg_1_1, arg_1_2, arg_1_3)

	var_1_3.shadow2:setColor(var_1_1)
	var_1_0(var_1_3.shadow2, -var_1_2, 0)

	var_1_3.shadow3 = CCLabelTTF:create(arg_1_1, arg_1_2, arg_1_3)

	var_1_3.shadow3:setColor(var_1_1)
	var_1_0(var_1_3.shadow3, 0, var_1_2)

	var_1_3.shadow4 = CCLabelTTF:create(arg_1_1, arg_1_2, arg_1_3)

	var_1_3.shadow4:setColor(var_1_1)
	var_1_0(var_1_3.shadow4, 0, -var_1_2)
	var_1_3:addChild(var_1_3.shadow1)
	var_1_3:addChild(var_1_3.shadow2)
	var_1_3:addChild(var_1_3.shadow3)
	var_1_3:addChild(var_1_3.shadow4)

	var_1_3.label = CCLabelTTF:create(arg_1_1, arg_1_2, arg_1_3)

	var_1_0(var_1_3.label, 0, 0)
	var_1_3:addChild(var_1_3.label)

	local var_1_4 = var_1_3.label:getContentSize().width
	local var_1_5 = var_1_3.label:getContentSize().height

	arg_1_6 = arg_1_6 or LABEL_DIRECTION_HORIZONTAL

	if arg_1_6 == LABEL_DIRECTION_VERTICAL then
		local var_1_6 = string.len(arg_1_1) / 3
		local var_1_7 = var_1_4 / var_1_6
		local var_1_8 = var_1_5 * var_1_6

		var_1_3.label:setDimensions(CCSizeMake(var_1_7, var_1_8))
		var_1_3.shadow1:setDimensions(CCSizeMake(var_1_7, var_1_8))
		var_1_3.shadow2:setDimensions(CCSizeMake(var_1_7, var_1_8))
		var_1_3.shadow3:setDimensions(CCSizeMake(var_1_7, var_1_8))
		var_1_3.shadow4:setDimensions(CCSizeMake(var_1_7, var_1_8))
	end

	function var_1_3.setString(arg_4_0, arg_4_1)
		var_1_3.shadow1:setString(arg_4_1)
		var_1_3.shadow2:setString(arg_4_1)
		var_1_3.shadow3:setString(arg_4_1)
		var_1_3.shadow4:setString(arg_4_1)
		var_1_3.label:setString(arg_4_1)
	end

	function var_1_3.getString(arg_5_0)
		return var_1_3.label:getString()
	end

	function var_1_3.realign(arg_6_0, arg_6_1, arg_6_2)
		var_1_3:setPosition(arg_6_1, arg_6_2)
	end

	function var_1_3.getContentSize(arg_7_0)
		return var_1_3.label:getContentSize()
	end

	function var_1_3.setColor(arg_8_0, ...)
		var_1_3.label:setColor(...)
	end

	function var_1_3.setDimensions(arg_9_0, arg_9_1)
		var_1_3.label:setDimensions(arg_9_1)
		var_1_3.shadow1:setDimensions(arg_9_1)
		var_1_3.shadow2:setDimensions(arg_9_1)
		var_1_3.shadow3:setDimensions(arg_9_1)
		var_1_3.shadow4:setDimensions(arg_9_1)
	end

	function var_1_3.setShadowColor(arg_10_0, ...)
		var_1_3.shadow1:setColor(...)
		var_1_3.shadow2:setColor(...)
		var_1_3.shadow3:setColor(...)
		var_1_3.shadow4:setColor(...)
	end

	function var_1_3.setOpacity(arg_11_0, arg_11_1)
		var_1_3.label:setOpacity(arg_11_1)
		var_1_3.shadow1:setOpacity(arg_11_1)
		var_1_3.shadow2:setOpacity(arg_11_1)
		var_1_3.shadow3:setOpacity(arg_11_1)
		var_1_3.shadow4:setOpacity(arg_11_1)
	end

	function var_1_3.setHorizontalAlignment(arg_12_0, arg_12_1)
		var_1_3.label:setHorizontalAlignment(arg_12_1)
		var_1_3.shadow1:setHorizontalAlignment(arg_12_1)
		var_1_3.shadow2:setHorizontalAlignment(arg_12_1)
		var_1_3.shadow3:setHorizontalAlignment(arg_12_1)
		var_1_3.shadow4:setHorizontalAlignment(arg_12_1)
	end

	function var_1_3.setVerticalAlignment(arg_13_0, arg_13_1)
		var_1_3.label:setVerticalAlignment(arg_13_1)
		var_1_3.shadow1:setVerticalAlignment(arg_13_1)
		var_1_3.shadow2:setVerticalAlignment(arg_13_1)
		var_1_3.shadow3:setVerticalAlignment(arg_13_1)
		var_1_3.shadow4:setVerticalAlignment(arg_13_1)
	end

	function var_1_3.setDimensions(arg_14_0, arg_14_1)
		var_1_3.label:setDimensions(arg_14_1)
		var_1_3.shadow1:setDimensions(arg_14_1)
		var_1_3.shadow2:setDimensions(arg_14_1)
		var_1_3.shadow3:setDimensions(arg_14_1)
		var_1_3.shadow4:setDimensions(arg_14_1)
	end

	function var_1_3.runActionCopy(arg_15_0, arg_15_1)
		var_1_3.label:runAction(tolua.cast(arg_15_1:copy(), "CCAction"))
		var_1_3.shadow1:runAction(tolua.cast(arg_15_1:copy(), "CCAction"))
		var_1_3.shadow2:runAction(tolua.cast(arg_15_1:copy(), "CCAction"))
		var_1_3.shadow3:runAction(tolua.cast(arg_15_1:copy(), "CCAction"))
		var_1_3.shadow4:runAction(tolua.cast(arg_15_1:copy(), "CCAction"))
		var_1_3:runAction(tolua.cast(arg_15_1:copy(), "CCAction"))
	end

	function var_1_3.setAnchorPoint(arg_16_0, arg_16_1)
		var_1_3.label:setAnchorPoint(arg_16_1)
		var_1_3.shadow1:setAnchorPoint(arg_16_1)
		var_1_3.shadow2:setAnchorPoint(arg_16_1)
		var_1_3.shadow3:setAnchorPoint(arg_16_1)
		var_1_3.shadow4:setAnchorPoint(arg_16_1)
	end

	return var_1_3
end
