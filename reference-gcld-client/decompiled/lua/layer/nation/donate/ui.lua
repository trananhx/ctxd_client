local var_0_0 = class("donateTab", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0)
	rmgr.loadTable({
		"res/ui/nation/donate.plist"
	})

	arg_2_0.uidata = require("lua/layer/nation/donate/uidata").new()
	arg_2_0.control = require("lua/layer/nation/donate/control").new(arg_2_0)
	arg_2_0.onEnter = arg_2_0.control.onEnter
	arg_2_0.onExit = arg_2_0.control.onExit

	arg_2_0.control:getInvestInfo()
end

function var_0_0.init(arg_3_0)
	if arg_3_0.uiTable and arg_3_0.uiTable.background then
		arg_3_0.uiTable.background:removeFromParentAndCleanup(true)
	end

	arg_3_0.uiTable = autoUI.initUI(arg_3_0, arg_3_0.uidata:getData())

	arg_3_0.uiTable.donateEventPic:setDisplayFrame(CCSpriteFrame:create("res/ui/nation/" .. arg_3_0.control.data.pic .. ".jpg", CCRectMake(0, 0, 909, 289)))
	arg_3_0.uiTable.donateProgress:setPercentage(arg_3_0.control.data.percentage)
	arg_3_0.uiTable.donateProgressLabel:setString(arg_3_0.control.data.percentage .. "%")
	arg_3_0.uiTable.donateTarget:setString(arg_3_0.control.data.goal)
	arg_3_0.uiTable.donateNow:setString(arg_3_0.control.data.curNum)
	arg_3_0.uiTable.donateTicketNum:setString("×" .. arg_3_0.control.data.couponNum)

	if arg_3_0.control.data.percentage < 100 then
		arg_3_0.uiTable.donateTicket:setVisible(true)
		arg_3_0.uiTable.donateSilver:setVisible(true)

		if arg_3_0.control.data.cd < 600000 then
			arg_3_0.uiTable.donateButton:setVisible(true)
			arg_3_0.uiTable.donateCdRecover:setVisible(false)
		else
			arg_3_0.uiTable.donateButton:setVisible(false)
			arg_3_0.uiTable.donateCdRecover:setVisible(true)
		end

		arg_3_0.uiTable.donateButton:registerScriptTapHandler(function()
			arg_3_0.control:investCopper()
		end)
		arg_3_0.uiTable.donateCdRecover:registerScriptTapHandler(function()
			arg_3_0.control:cdRecover()
		end)

		local var_3_0 = createTimerLabel(arg_3_0.control.data.cd, "CD:@M:@S", "Thonburi", 22)

		var_3_0:setPosition(ccp(813, 80))
		arg_3_0.uiTable.background:addChild(var_3_0)
	else
		local function var_3_1()
			local var_6_0 = smgr.getLayer("pushLayer")
			local var_6_1 = CCSprite:createWithSpriteFrameName("invest_new.png")

			var_6_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
			var_6_0:addChild(var_6_1, 100)

			local var_6_2 = CCArray:create()
			local var_6_3 = CCMoveBy:create(1, ccp(0, 100))
			local var_6_4 = CCFadeOut:create(0.3)

			var_6_2:addObject(var_6_3)
			var_6_2:addObject(var_6_4)
			var_6_2:addObject(CCCallFuncN:create(function()
				var_6_1:removeFromParentAndCleanup(true)
			end))
			var_6_1:runAction(CCSequence:create(var_6_2))
			arg_3_0.control:getInvestInfo()
		end

		local var_3_2 = createTimerLabel(arg_3_0.control.data.nextTime, language.get(94002) .. ":@M:@S", "Thonburi", 22, var_3_1)

		var_3_2:setPosition(ccp(674, 116))
		arg_3_0.uiTable.background:addChild(var_3_2)
	end
end

return var_0_0
