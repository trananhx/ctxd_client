require("CCBReaderLoad")

local var_0_0 = class("CCButton", function()
	return CCNode:create()
end)

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_1.text = arg_2_1.text or ""
	arg_2_1.fontSize = arg_2_1.fontSize or 26
	arg_2_1.fontName = arg_2_1.fontName or "Thonburi"
	arg_2_1.strokeSize = arg_2_1.strokeSize or 1
	arg_2_1.strokeColor = arg_2_1.strokeColor or ccc3(0, 0, 0)
	arg_2_1.direction = arg_2_1.direction or LABEL_DIRECTION_HORIZONTAL
	arg_2_0.label = CCLabelTTF:create(arg_2_1.text, arg_2_1.fontName, arg_2_1.fontSize)
	arg_2_0.node = arg_2_1.node

	arg_2_0.node:setTitleLabel(arg_2_0.label)

	local var_2_0 = CCScale9Sprite:create()
	local var_2_1 = CCScale9Sprite:create()
	local var_2_2 = CCScale9Sprite:create()

	var_2_0:addChild(arg_2_1.normal)
	var_2_1:addChild(arg_2_1.highlight)
	var_2_2:addChild(arg_2_1.disable)
	arg_2_0.node:setBackgroundSpriteForState(var_2_0, CCControlStateNormal)
	arg_2_0.node:setBackgroundSpriteForState(var_2_1, CCControlStateHighlighted)
	arg_2_0.node:setBackgroundSpriteForState(var_2_2, CCControlStateDisabled)
	arg_2_0:addChild(arg_2_0.node)
end

function var_0_0.getRootNode(arg_3_0)
	return arg_3_0.node
end

return var_0_0
