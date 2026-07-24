({}).idle = 0

local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.tipPosY = -25
	var_0_0.tipFontSize = -4
else
	var_0_0.tipPosY = 0
	var_0_0.tipFontSize = 0
end

function createGeneralSelector(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5)
	local var_1_0 = {}
	local var_1_1 = false

	if not arg_1_5 or string.len(arg_1_5) == 0 then
		var_1_1 = true
	end

	var_1_0.checked = var_1_1

	local var_1_2 = CCSprite:createWithSpriteFrameName("general_background.png")

	var_1_2:setPosition(arg_1_1)
	arg_1_0:addChild(var_1_2)

	local var_1_3 = CCSprite:createWithSpriteFrameName("general_background_light.png")

	var_1_3:setPosition(ccp(var_1_2:getContentSize().width * 0.5, var_1_2:getContentSize().height * 0.5))
	var_1_3:setVisible(var_1_0.checked)
	var_1_2:addChild(var_1_3)

	local var_1_4 = CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", arg_1_3))

	var_1_4:setPosition(ccp(var_1_2:getContentSize().width * 0.5, var_1_2:getContentSize().height * 0.5))
	var_1_2:addChild(var_1_4)

	local var_1_5 = CCSprite:createWithSpriteFrameName("tujin_check.png")

	var_1_5:setPosition(ccp(5 + var_1_5:getContentSize().width * 0.5, 5 + var_1_5:getContentSize().height * 0.5))
	var_1_2:addChild(var_1_5)

	local var_1_6 = CCSprite:createWithSpriteFrameName("tujin_ok.png")

	var_1_6:setPosition(ccp(var_1_5:getContentSize().width * 0.5, var_1_5:getContentSize().height * 0.5))
	var_1_6:setVisible(var_1_0.checked)
	var_1_5:addChild(var_1_6)

	if arg_1_5 then
		local var_1_7 = CCStrokeLabelTTF:create(arg_1_5, "Thonburi", 20 + var_0_0.tipFontSize)

		var_1_7:setColor(ccc3(253, 98, 98))
		var_1_7:setPosition(ccp(var_1_2:getContentSize().width * 0.5, var_1_7:getContentSize().height * 0.5 + 5 + var_0_0.tipPosY))
		var_1_2:addChild(var_1_7)

		if conf.language == "vie" then
			var_1_7:setDimensions(CCSizeMake(90, 0))
		end
	end

	local function var_1_8()
		var_1_3:setVisible(var_1_0.checked)
		var_1_6:setVisible(var_1_0.checked)
	end

	function var_1_0.ifClick(arg_3_0, arg_3_1, arg_3_2)
		if var_1_1 and tool.checkIfTouch(var_1_2, arg_3_1, arg_3_2) then
			arg_3_0:check()

			return true
		end

		return false
	end

	function var_1_0.check(arg_4_0)
		if arg_4_0.checked then
			arg_4_0.checked = false
		else
			arg_4_0.checked = true
		end

		var_1_8()
	end

	function var_1_0.getChecked(arg_5_0)
		return arg_5_0.checked
	end

	function var_1_0.getGenrealId(arg_6_0)
		return arg_1_2
	end

	return var_1_0
end

return {
	create = function(arg_7_0, arg_7_1)
		local var_7_0 = {}

		var_7_0.isCheck = true

		local var_7_1 = require("res/layout/battle/generalSelector")

		var_7_0.view = {}

		uiutil.initWidgets(var_7_0.view, var_7_1)

		local function var_7_2()
			var_7_0.isCheck = not var_7_0.isCheck

			var_7_0.view.widgets.generalButton:setHighlighted(var_7_0.isCheck)
			var_7_0:updateState()
		end

		function var_7_0.updateState(arg_9_0)
			arg_9_0.view.widgets.checkSprite:setVisible(arg_9_0.isCheck)
		end

		function var_7_0.init(arg_10_0, arg_10_1)
			if arg_10_1 then
				var_7_0.general = arg_10_1

				local var_10_0 = CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", arg_10_1.gPic))

				arg_10_0.view.widgets.generalPicNode:addChild(var_10_0)
				var_7_0.view.widgets.generalButton:setHighlighted(var_7_0.isCheck)
				arg_10_0.view.widgets.generalButton:addHandleOfControlEvent(var_7_2, CCControlEventTouchUpInside)
				arg_10_0.view.widgets.nameLabel:setString(arg_10_1.gName)
				var_7_0:updateState()
			end
		end

		function var_7_0.setPosition(arg_11_0, arg_11_1)
			var_7_0.view.widgets.generalSelector:setPosition(arg_11_1)
		end

		if arg_7_1 then
			arg_7_1:addChild(var_7_0.view.widgets.generalSelector)
		end

		return var_7_0
	end
}
