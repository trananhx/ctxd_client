conveneControl = {}

local var_0_0 = conveneControl

var_0_0.militaryTable = {}

local function var_0_1(arg_1_0)
	require("lua/common/msgTransform")

	arg_1_0 = msgTransform.simpleGeneral2Assemble(arg_1_0, var_0_0.cityId)

	if arg_1_0.action.state ~= 1 then
		local var_1_0 = smgr.getLayer("ConveneLayer")

		if var_1_0 then
			var_1_0:removeFromParentAndCleanup(true)
			smgr.unregisterLayer("ConveneLayer")

			worldControl.lock = false
		end

		messageBox.alert(languge.get(10003), arg_1_0.action.data.msg)

		return
	end

	local var_1_1 = 1

	for iter_1_0, iter_1_1 in pairs(arg_1_0.action.data.gIds) do
		var_0_0.militaryTable[var_1_1] = {}
		var_0_0.militaryTable[var_1_1].check = true
		var_0_0.militaryTable[var_1_1].info = iter_1_1

		ConveneLayer["general_" .. var_1_1]:setVisible(true)
		ConveneLayer["generalHighlight_" .. var_1_1]:setVisible(true)
		ConveneLayer["generalGou_" .. var_1_1]:setVisible(true)

		local var_1_2 = CCSprite:create("res/ui/common/generalPic/generalPic_" .. iter_1_1.gPic .. ".jpg"):displayFrame()

		ConveneLayer["generalHead_" .. var_1_1]:setDisplayFrame(var_1_2)

		var_1_1 = var_1_1 + 1
	end
end

function var_0_0.getAssembleGeneral()
	cmgr.sendRequest(var_0_1, actions.generalSimpleInfo)
end

local function var_0_2(arg_3_0, arg_3_1)
	if var_0_0.militaryTable then
		for iter_3_0, iter_3_1 in pairs(var_0_0.militaryTable) do
			if ConveneLayer["general_" .. iter_3_0]:isVisible() and tool.checkIfTouch(ConveneLayer["general_" .. iter_3_0], arg_3_0, arg_3_1) then
				var_0_0.militaryTable[iter_3_0].check = not var_0_0.militaryTable[iter_3_0].check

				ConveneLayer["generalHighlight_" .. iter_3_0]:setVisible(var_0_0.militaryTable[iter_3_0].check)
				ConveneLayer["generalGou_" .. iter_3_0]:setVisible(var_0_0.militaryTable[iter_3_0].check)
			end
		end
	end
end

local function var_0_3(arg_4_0)
	local var_4_0 = smgr.getLayer("ConveneLayer")

	if var_4_0 then
		var_4_0:removeFromParentAndCleanup(true)
		smgr.unregisterLayer("ConveneLayer")

		worldControl.lock = false
	end

	local var_4_1 = smgr.getLayer("pushLayer")
	local var_4_2 = CCStrokeLabelTTF:create(language.get(200501), "Thonburi", 30)

	var_4_2:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
	var_4_1:addChild(var_4_2)

	local var_4_3 = CCArray:create()
	local var_4_4 = CCMoveBy:create(1, ccp(0, 100))
	local var_4_5 = CCFadeOut:create(0.3)

	var_4_3:addObject(var_4_4)
	var_4_3:addObject(var_4_5)
	var_4_3:addObject(CCCallFuncN:create(function()
		var_4_2:removeFromParentAndCleanup(true)
	end))
	var_4_2:runAction(CCSequence:create(var_4_3))
end

function var_0_0.conveneButtonOnClick()
	local var_6_0 = ""
	local var_6_1 = true

	if var_0_0.militaryTable then
		for iter_6_0, iter_6_1 in pairs(var_0_0.militaryTable) do
			if var_0_0.militaryTable[iter_6_0].check then
				if var_6_1 then
					var_6_1 = false
				else
					var_6_0 = var_6_0 .. "#"
				end

				var_6_0 = var_6_0 .. iter_6_1.info.gId
			end
		end
	end

	cmgr.sendRequest(var_0_3, actions.assembleBattleAll, var_6_0, var_0_0.cityId)
	amgr.playEffect(enumAudioFile.wujiang_zunming)
end

local function var_0_4()
	eventManager.registerEvent("conveneOnTap", var_0_2)
end

local function var_0_5()
	eventManager.unregisterEvent("conveneOnTap", var_0_2)
end

function var_0_0.eventHandler(arg_9_0)
	if arg_9_0 == "enter" then
		var_0_4()
	elseif arg_9_0 == "exit" then
		var_0_5()
	end
end

return var_0_0
