local var_0_0 = require("lua/common/CCBNode")
local var_0_1 = class("AutoBattle", function()
	return createBaseLayer()
end)

var_0_1.STATE = {}
var_0_1.STATE.BEFORE_BATTLE = 1
var_0_1.STATE.IN_BATTLE = 2
var_0_1.STATE.AFTER_BATTLE = 3

local var_0_2 = {}

if conf.language == "kr" then
	var_0_2.tokenLabelX = 80
else
	var_0_2.tokenLabelX = 0
end

function var_0_1.ctor(arg_2_0, arg_2_1)
	local var_2_0 = var_0_0:create(arg_2_0)

	arg_2_0.cityId = arg_2_1.cityId
	arg_2_0.anim = arg_2_1.anim
	arg_2_0.state = arg_2_1.state
	arg_2_0.response = arg_2_1.response
	arg_2_0.cityIsOurs = arg_2_1.cityIsOurs
	arg_2_0.reportCache = {}

	arg_2_0:setTouchEnabled(true)
	arg_2_0:registerScriptTouchHandler(handler(arg_2_0, arg_2_0.onTouch), false, true)
	arg_2_0:getAutoBattleSimpleInfo()
	arg_2_0:setVisible(false)

	if arg_2_0.anim then
		arg_2_0.background:setScale(0)
		arg_2_0.background:setPosition(ccp(0, visibleSize.height / 2))

		local var_2_1 = CCScaleTo:create(1, 1)
		local var_2_2 = CCMoveTo:create(1, ccp(visibleSize.width / 2, visibleSize.height / 2))

		arg_2_0.background:runAction(var_2_1)
		arg_2_0.background:runAction(var_2_2)
	end

	local var_2_3 = smgr.getLayer("topLayer")

	var_2_3:removeAllChildrenWithCleanup(true)
	var_2_3:addChild(arg_2_0)
	arg_2_0.lostLabel:setString(language.get(420005, 5))
	arg_2_0.expLabel:setString(language.get(420005, 5))
	arg_2_0.tokenLabel:setString(language.get(420004))
	arg_2_0.tokenLabel:setPosition(ccp(arg_2_0.tokenLabel:getPositionX() + var_0_2.tokenLabelX, arg_2_0.tokenLabel:getPositionY()))

	if conf.language == "vie" or conf.language == "tha" then
		arg_2_0.reportNode:setPosition(ccp(arg_2_0.reportNode:getPositionX() - 30, arg_2_0.reportNode:getPositionY()))
		arg_2_0.leftButton:setTitleTTFForState(20, CCControlStateNormal)
		arg_2_0.leftButton:setTitleTTFForState(20, CCControlStateHighlighted)
		arg_2_0.leftButton:setTitleTTFForState(20, CCControlStateDisabled)
		arg_2_0.leftButton:setTitleTTFForState(20, CCControlStateSelected)
		arg_2_0.rightButton:setTitleTTFForState(20, CCControlStateNormal)
		arg_2_0.rightButton:setTitleTTFForState(20, CCControlStateHighlighted)
		arg_2_0.rightButton:setTitleTTFForState(20, CCControlStateDisabled)
		arg_2_0.rightButton:setTitleTTFForState(20, CCControlStateSelected)
		arg_2_0.tokenLabel:setColor(ccc3(255, 255, 255))
	end

	if conf.language == "vie" then
		arg_2_0.tokenCheckBox:setPosition(ccp(arg_2_0.tokenCheckBox:getPositionX() - 140, arg_2_0.tokenCheckBox:getPositionY()))
	elseif conf.language == "tha" then
		arg_2_0.tokenCheckBox:setPosition(ccp(arg_2_0.tokenCheckBox:getPositionX() - 40, arg_2_0.tokenCheckBox:getPositionY()))
	end
end

function var_0_1.init(arg_3_0)
	local function var_3_0(arg_4_0, arg_4_1)
		arg_4_0:setTitleForState(CCString:create(arg_4_1), CCControlStateNormal)
		arg_4_0:setTitleForState(CCString:create(arg_4_1), CCControlStateHighlighted)
		arg_4_0:setTitleForState(CCString:create(arg_4_1), CCControlStateDisabled)
		arg_4_0:setTitleForState(CCString:create(arg_4_1), CCControlStateSelected)
	end

	arg_3_0.generalInfoTable = {}

	local var_3_1 = 0

	for iter_3_0 = 1, 4 do
		local var_3_2 = arg_3_0.generalMilitary[iter_3_0]

		if var_3_2 == nil then
			arg_3_0["generalBg" .. iter_3_0]:setVisible(false)
		else
			arg_3_0.generalInfoTable[iter_3_0] = {}
			arg_3_0.generalInfoTable[iter_3_0].gid = var_3_2.generalId
			arg_3_0.generalInfoTable[iter_3_0].check = true

			arg_3_0["generalBg" .. iter_3_0]:setVisible(true)
			arg_3_0["generalHead" .. iter_3_0]:setDisplayFrame(CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", var_3_2.pic)):displayFrame())

			var_3_1 = var_3_1 + 1
		end
	end

	if arg_3_0.state == var_0_1.STATE.BEFORE_BATTLE then
		arg_3_0.leftButton:setVisible(false)
		arg_3_0.rightButton:setVisible(false)
		arg_3_0.fightButton:setVisible(true)
		var_3_0(arg_3_0.fightButton, language.get(421014))

		local var_3_3 = CCStrokeLabelTTF:create(language.get(421015), "Thonburi", 32)

		if arg_3_0.cityIsOurs then
			var_3_3:setString(language.get(421018))
		end

		local var_3_4 = CCStrokeLabelTTF:create(worldConstant.BUILDING_INFO["world_building_" .. arg_3_0.cityId].name, "Thonburi", 32)

		var_3_4:setColor(ccc3(0, 255, 0))

		local var_3_5 = CCSprite:create("res/ui/task/get_icon_food.png")

		arg_3_0.consumeLabel = CCStrokeLabelTTF:create("-50000", "Thonburi", 32)

		arg_3_0.consumeLabel:setColor(ccc3(255, 0, 0))

		if conf.language == "vie" or conf.language == "tha" then
			arg_3_0.richNode = createRichNode2({
				var_3_3,
				var_3_4,
				var_3_5,
				arg_3_0.consumeLabel
			}, nil, nil, 350)

			arg_3_0.richNode:setPosition(arg_3_0.background:getContentSize().width / 2 - 200, arg_3_0.background:getContentSize().height - 40 + 15)
		else
			arg_3_0.richNode = createRichNode({
				var_3_3,
				var_3_4,
				var_3_5,
				arg_3_0.consumeLabel
			})

			arg_3_0.richNode:setPosition(arg_3_0.background:getContentSize().width / 2 - 200, arg_3_0.background:getContentSize().height - 40)
		end

		arg_3_0.background:addChild(arg_3_0.richNode)

		local var_3_6 = arg_3_0.totalFood - (4 - var_3_1) * arg_3_0.eachReduce

		arg_3_0.lostLabel:setString("0")
		arg_3_0.expLabel:setString("0")
		arg_3_0.consumeLabel:setString(string.format("-%s", var_3_6))
		arg_3_0.haojiao:setVisible(false)

		arg_3_0.mode = false

		arg_3_0.closeButton:setVisible(true)
		arg_3_0.closeButton:setEnabled(true)
	elseif arg_3_0.state == var_0_1.STATE.IN_BATTLE then
		if arg_3_0.isShownText ~= true then
			arg_3_0:showReport({
				{
					text = language.get(421013),
					color = colorQuality[3]
				}
			})

			arg_3_0.isShownText = true
		end

		arg_3_0.leftButton:setVisible(true)
		arg_3_0.rightButton:setVisible(true)
		arg_3_0.fightButton:setVisible(false)
		var_3_0(arg_3_0.leftButton, language.get(420001))
		var_3_0(arg_3_0.rightButton, language.get(420002))

		if arg_3_0.richNode then
			arg_3_0.richNode:removeFromParentAndCleanup(true)

			arg_3_0.richNode = nil
		end

		arg_3_0.mode = arg_3_0.autoBattleData.autoMode == 1

		if arg_3_0.mode == true then
			arg_3_0.tokenCheckBox:setNormalImage(CCSprite:createWithSpriteFrameName("btn_check_1_a.png"))

			arg_3_0.mode = false
		else
			arg_3_0.tokenCheckBox:setNormalImage(CCSprite:createWithSpriteFrameName("btn_check_1_on.png"))

			arg_3_0.mode = true
		end

		local var_3_7 = arg_3_0.autoBattleData.lost

		if var_3_7 > 10000 then
			var_3_7 = language.get(420005, tool.toint(var_3_7 / 10000))
		else
			var_3_7 = tostring(var_3_7)
		end

		local var_3_8 = arg_3_0.autoBattleData.exp

		if var_3_8 > 10000 then
			var_3_8 = language.get(420005, tool.toint(var_3_8 / 10000))
		else
			var_3_8 = tostring(var_3_8)
		end

		arg_3_0.lostLabel:setString(var_3_7)
		arg_3_0.expLabel:setString(var_3_8)

		local var_3_9 = createTimerLabel(arg_3_0.autoBattleData.cd, "@M:@S", "Thonburi", 22, nil, nil, nil, ccc3(255, 0, 0))

		arg_3_0.timeLabel = var_3_9

		var_3_9:setPosition(31.5, 12)
		arg_3_0.haojiao:removeAllChildrenWithCleanup(true)
		arg_3_0.haojiao:addChild(var_3_9)
		arg_3_0.haojiao:setVisible(true)

		for iter_3_1, iter_3_2 in pairs(arg_3_0.generalInfoTable) do
			iter_3_2.check = false

			if arg_3_0.autoBattleData.gIds == nil then
				iter_3_2.check = true
			else
				for iter_3_3, iter_3_4 in pairs(tool.split(arg_3_0.autoBattleData.gIds, "#")) do
					if iter_3_2.gid == tonumber(iter_3_4) then
						iter_3_2.check = true
					end
				end
			end

			arg_3_0["generalGou" .. iter_3_1]:setVisible(iter_3_2.check)
		end

		arg_3_0.closeButton:setVisible(false)
		arg_3_0.closeButton:setEnabled(false)
	elseif arg_3_0.state == var_0_1.STATE.AFTER_BATTLE then
		arg_3_0.fightButton:setVisible(false)
		arg_3_0.leftButton:setVisible(true)
		arg_3_0.rightButton:setVisible(true)
		arg_3_0.rightButton:setEnabled(false)

		local var_3_10 = arg_3_0.autoBattleData.lost

		if var_3_10 > 10000 then
			var_3_10 = language.get(420005, tool.toint(var_3_10 / 10000))
		else
			var_3_10 = tostring(var_3_10)
		end

		local var_3_11 = arg_3_0.autoBattleData.exp

		if var_3_11 > 10000 then
			var_3_11 = language.get(420005, tool.toint(var_3_11 / 10000))
		else
			var_3_11 = tostring(var_3_11)
		end

		arg_3_0.lostLabel:setString(var_3_10)
		arg_3_0.expLabel:setString(var_3_11)
		var_3_0(arg_3_0.leftButton, language.get(420003))
		var_3_0(arg_3_0.rightButton, language.get(420002))

		if arg_3_0.autoBattleData.result == 1 or arg_3_0.autoBattleData.result == 2 or arg_3_0.autoBattleData.result == 6 then
			arg_3_0.endXuezhan:setVisible(true)
			arg_3_0.endJianshou:setVisible(false)
		else
			arg_3_0.endXuezhan:setVisible(false)
			arg_3_0.endJianshou:setVisible(true)
		end

		eventManager.dispatchEvent("autoBattle", {
			stop = true
		})
		eventManager.dispatchEvent("autoBattleCityEffect")
		arg_3_0.closeButton:setVisible(false)
		arg_3_0.closeButton:setEnabled(false)
	end

	arg_3_0:setVisible(true)

	arg_3_0.response = nil
end

function var_0_1.getAutoBattleSimpleInfo(arg_5_0)
	local function var_5_0(arg_6_0)
		arg_5_0.totalFood = arg_6_0.action.data.totalFood
		arg_5_0.eachReduce = arg_6_0.action.data.eachReduce

		if arg_5_0.state == var_0_1.STATE.BEFORE_BATTLE then
			arg_5_0:getSimpleGeneralInfo()
		elseif arg_5_0.state == var_0_1.STATE.IN_BATTLE then
			arg_5_0:getAutoBattleDetail()
		elseif arg_5_0.state == var_0_1.STATE.AFTER_BATTLE then
			arg_5_0:getAutoBattleDetail()

			user.autoBattleCityId = nil
		end
	end

	cmgr.sendRequest(var_5_0, actions.getAutoBattleSimpleInfo)
end

function var_0_1.handlerGetSimpleGeneralInfo(arg_7_0, arg_7_1)
	arg_7_0.generalMilitary = arg_7_1.action.data.military

	if arg_7_0.state ~= var_0_1.STATE.BEFORE_BATTLE and arg_7_0.autoBattleData == nil then
		arg_7_0:getAutoBattleDetail()
	else
		arg_7_0:init()
	end
end

function var_0_1.getSimpleGeneralInfo(arg_8_0)
	cmgr.sendRequest(handler(arg_8_0, arg_8_0.handlerGetSimpleGeneralInfo), actions.generalSimpleInfo)
end

function var_0_1.handlerGetAutoBattleDetail(arg_9_0, arg_9_1)
	arg_9_0.autoBattleData = arg_9_1.action.data

	if arg_9_0.autoBattleData.autoBattle then
		arg_9_0.autoBattleData = arg_9_0.autoBattleData.autoBattle
	end

	user.autoMode = arg_9_0.autoBattleData.autoMode

	if arg_9_0.autoBattleData.result == nil then
		arg_9_0.state = var_0_1.STATE.IN_BATTLE

		if arg_9_0.cityId ~= nil then
			user.autoBattleCityId = arg_9_0.cityId
		end
	else
		arg_9_0.state = var_0_1.STATE.AFTER_BATTLE
		user.autoBattleCityId = nil
	end

	if arg_9_0.generalMilitary == nil then
		arg_9_0:getSimpleGeneralInfo()
	else
		arg_9_0:init()
	end

	if arg_9_0.cityId then
		eventManager.dispatchEvent("autoBattleCityEffect", arg_9_0.cityId)
	end
end

function var_0_1.handlerChangeAutoBattleMode(arg_10_0, arg_10_1)
	arg_10_0:getAutoBattleDetail()
end

function var_0_1.getAutoBattleDetail(arg_11_0)
	if arg_11_0.response then
		arg_11_0:handlerGetAutoBattleDetail(arg_11_0.response)
	else
		cmgr.sendRequest(handler(arg_11_0, arg_11_0.handlerGetAutoBattleDetail), actions.getAutoBattleDetail)
	end
end

function var_0_1.changeAutoBattleMode(arg_12_0)
	local var_12_0 = arg_12_0.mode and 2 or 1

	cmgr.sendRequest(handler(arg_12_0, arg_12_0.handlerChangeAutoBattleMode), actions.changeAutoBattleMode, var_12_0)
end

function var_0_1.handlerStartAutoBattle(arg_13_0, arg_13_1)
	arg_13_0:changeAutoBattleMode()
end

function var_0_1.handlerStopAutoBattle(arg_14_0, arg_14_1)
	arg_14_0.state = var_0_1.STATE.AFTER_BATTLE

	arg_14_0:removeFromParentAndCleanup(true)
	eventManager.dispatchEvent("autoBattle", {
		stop = true
	})
end

function var_0_1.stopAutoBattle(arg_15_0)
	messageBox.confirm(language.get(421012), function()
		cmgr.sendRequest(handler(arg_15_0, arg_15_0.handlerStopAutoBattle), actions.stopAutoBattle)
	end)
end

function var_0_1.startAutoBattle(arg_17_0)
	local var_17_0 = ""

	for iter_17_0, iter_17_1 in pairs(arg_17_0.generalInfoTable) do
		if iter_17_1.check then
			var_17_0 = var_17_0 .. iter_17_1.gid .. "#"
		end
	end

	if var_17_0 ~= "" then
		cmgr.sendRequest(handler(arg_17_0, arg_17_0.handlerStartAutoBattle), actions.startAutoBattle, arg_17_0.cityId, var_17_0)
	end
end

function var_0_1.handlerPushCities(arg_18_0, arg_18_1)
	if arg_18_1.action.data.attmov then
		local var_18_0 = arg_18_1.action.data.attmov
		local var_18_1 = {}
		local var_18_2 = eventManager.dispatchEvent("getGeneralName", var_18_0.generalId)
		local var_18_3 = var_18_0.orgCity or ""
		local var_18_4 = var_18_0.curCity or ""
		local var_18_5 = ""
		local var_18_6 = ""

		if var_18_3 ~= "" then
			var_18_5 = language.get(420007)
		end

		if var_18_4 ~= "" then
			var_18_6 = language.get(420008)
		end

		var_18_1[#var_18_1 + 1] = {
			text = var_18_2,
			color = colorQuality[6]
		}
		var_18_1[#var_18_1 + 1] = {
			text = var_18_5,
			color = colorQuality[3]
		}
		var_18_1[#var_18_1 + 1] = {
			text = var_18_3,
			color = colorQuality[3]
		}
		var_18_1[#var_18_1 + 1] = {
			text = var_18_6,
			color = colorQuality[3]
		}
		var_18_1[#var_18_1 + 1] = {
			text = var_18_4,
			color = colorQuality[3]
		}

		table.insert(arg_18_0.reportCache, 1, var_18_1)
	end
end

function var_0_1.handlerPushGeneral(arg_19_0, arg_19_1)
	if arg_19_1.action.data.general and arg_19_1.action.data.general.military and arg_19_1.action.data.general.military[1] and arg_19_1.action.data.general.military[1].kill then
		local var_19_0 = arg_19_1.action.data.general.military[1]
		local var_19_1 = {}
		local var_19_2 = eventManager.dispatchEvent("getGeneralName", var_19_0.generalId)
		local var_19_3 = language.get(420009)
		local var_19_4 = var_19_0.vsPname or ""
		local var_19_5 = var_19_0.vsGname or ""
		local var_19_6 = var_19_0.kill
		local var_19_7 = language.get(420010)

		var_19_1[#var_19_1 + 1] = {
			text = var_19_2,
			color = colorQuality[6]
		}
		var_19_1[#var_19_1 + 1] = {
			text = var_19_3,
			color = colorQuality[3]
		}
		var_19_1[#var_19_1 + 1] = {
			text = var_19_4,
			color = colorQuality[3]
		}
		var_19_1[#var_19_1 + 1] = {
			text = var_19_5,
			color = colorQuality[3]
		}
		var_19_1[#var_19_1 + 1] = {
			text = var_19_6,
			color = colorQuality[5]
		}
		var_19_1[#var_19_1 + 1] = {
			text = var_19_7,
			color = colorQuality[3]
		}

		table.insert(arg_19_0.reportCache, 1, var_19_1)
	end
end

function var_0_1.showReport(arg_20_0, arg_20_1)
	local var_20_0 = {}

	if conf.language == "vie" or conf.language == "tha" then
		var_20_0.fontSize = -6
	else
		var_20_0.fontSize = 0
	end

	arg_20_0.reportNode:removeAllChildrenWithCleanup(true)

	local var_20_1 = {}

	for iter_20_0, iter_20_1 in pairs(arg_20_1) do
		local var_20_2 = CCStrokeLabelTTF:create(iter_20_1.text, "Thonburi", 24 + var_20_0.fontSize)

		var_20_2:setColor(iter_20_1.color)

		var_20_1[#var_20_1 + 1] = var_20_2
	end

	arg_20_0.reportNode:addChild(createRichNode(var_20_1))
end

function var_0_1.update(arg_21_0, arg_21_1)
	if arg_21_0.autoBattleData == nil then
		return
	end

	if arg_21_0.autoBattleData.result == nil then
		arg_21_0.refreshCount = arg_21_0.refreshCount or 0
		arg_21_0.refreshCount = arg_21_0.refreshCount + arg_21_1

		if #arg_21_0.reportCache > 0 then
			local var_21_0 = arg_21_0.reportCache[#arg_21_0.reportCache]

			arg_21_0:showReport(var_21_0)
			table.remove(arg_21_0.reportCache, #arg_21_0.reportCache)
		end

		if arg_21_0.refreshCount > 10 then
			arg_21_0.refreshCount = 0

			arg_21_0:getAutoBattleDetail()
		end
	end
end

function var_0_1.minimize(arg_22_0)
	local var_22_0 = CCScaleTo:create(1, 0)
	local var_22_1 = CCMoveTo:create(1, ccp(0, visibleSize.height / 2))

	arg_22_0.background:runAction(var_22_0)
	arg_22_0.background:runAction(CCSequence:createWithTwoActions(var_22_1, CCCallFunc:create(function()
		arg_22_0:removeFromParentAndCleanup(true)
	end)))
end

function var_0_1.onLeftButtonClick(arg_24_0)
	if arg_24_0.state == var_0_1.STATE.IN_BATTLE then
		arg_24_0:stopAutoBattle()
	elseif arg_24_0.state == var_0_1.STATE.AFTER_BATTLE then
		arg_24_0:removeFromParentAndCleanup(true)
	end
end

function var_0_1.onRightButtonClick(arg_25_0)
	if arg_25_0.state == var_0_1.STATE.IN_BATTLE then
		arg_25_0:minimize()
		eventManager.dispatchEvent("autoBattle", {
			min = true,
			time = arg_25_0.timeLabel:getTime()
		})
	end
end

function var_0_1.onFightButtonClick(arg_26_0)
	arg_26_0:startAutoBattle()
end

function var_0_1.onTokenCheckBoxClick(arg_27_0)
	local function var_27_0()
		log.info("success changeMode")

		if arg_27_0.mode == true then
			arg_27_0.tokenCheckBox:setNormalImage(CCSprite:createWithSpriteFrameName("btn_check_1_a.png"))

			arg_27_0.mode = false
		else
			arg_27_0.tokenCheckBox:setNormalImage(CCSprite:createWithSpriteFrameName("btn_check_1_on.png"))

			arg_27_0.mode = true
		end
	end

	if arg_27_0.state == var_0_1.STATE.IN_BATTLE then
		if arg_27_0.mode == true then
			cmgr.sendRequest(var_27_0, actions.changeAutoBattleMode, 1)
		else
			cmgr.sendRequest(var_27_0, actions.changeAutoBattleMode, 2)
		end
	elseif arg_27_0.mode == true then
		arg_27_0.tokenCheckBox:setNormalImage(CCSprite:createWithSpriteFrameName("btn_check_1_a.png"))

		arg_27_0.mode = false
	else
		arg_27_0.tokenCheckBox:setNormalImage(CCSprite:createWithSpriteFrameName("btn_check_1_on.png"))

		arg_27_0.mode = true
	end
end

function var_0_1.onCloseButtonClick(arg_29_0)
	arg_29_0:removeFromParentAndCleanup(true)
end

function var_0_1.changeAutoBattleGeneral(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_1 and language.get(421016, arg_30_0.eachReduce) or language.get(421017)

	messageBox.confirm(var_30_0, function()
		arg_30_0:startAutoBattle()
	end)
end

function var_0_1.onTouch(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
	if arg_32_1 == CCTOUCHENDED then
		if arg_32_0.state == var_0_1.STATE.BEFORE_BATTLE then
			local var_32_0 = 0

			for iter_32_0, iter_32_1 in pairs(arg_32_0.generalInfoTable) do
				if tool.checkIfTouch(arg_32_0["generalBg" .. iter_32_0], arg_32_2, arg_32_3) then
					if iter_32_1.check == true then
						iter_32_1.check = false
					else
						iter_32_1.check = true
					end

					arg_32_0["generalGou" .. iter_32_0]:setVisible(iter_32_1.check)
				end

				if iter_32_1.check == true then
					var_32_0 = var_32_0 + 1
				end
			end

			local var_32_1 = arg_32_0.totalFood - (4 - var_32_0) * arg_32_0.eachReduce

			arg_32_0.consumeLabel:setString(string.format("-%s", var_32_1))
		elseif arg_32_0.state == var_0_1.STATE.IN_BATTLE then
			for iter_32_2, iter_32_3 in pairs(arg_32_0.generalInfoTable) do
				if tool.checkIfTouch(arg_32_0["generalBg" .. iter_32_2], arg_32_2, arg_32_3) then
					if iter_32_3.check == true then
						iter_32_3.check = false
					else
						iter_32_3.check = true
					end

					arg_32_0:changeAutoBattleGeneral(iter_32_3.check)

					return
				end
			end
		end
	end

	return true
end

function var_0_1.onEnter(arg_33_0)
	arg_33_0.pushCitiesRef = handler(arg_33_0, arg_33_0.handlerPushCities)
	arg_33_0.pushGeneralRef = handler(arg_33_0, arg_33_0.handlerPushGeneral)
	arg_33_0.updateSchedulerEntryRef = handler(arg_33_0, arg_33_0.update)

	cmgr.registerResponseHandler(actions.pushCities, arg_33_0.pushCitiesRef)
	cmgr.registerResponseHandler(actions.pusGeneral, arg_33_0.pushGeneralRef)

	if arg_33_0.updateSchedulerEntry == nil then
		arg_33_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(arg_33_0.updateSchedulerEntryRef, 0.5, false)
	end
end

function var_0_1.onExit(arg_34_0)
	cmgr.unregisterResponseHandler(actions.pushCities, arg_34_0.pushCitiesRef)
	cmgr.unregisterResponseHandler(actions.pusGeneral, arg_34_0.pushGeneralRef)

	if arg_34_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_34_0.updateSchedulerEntry)

		arg_34_0.updateSchedulerEntry = nil
	end
end

return var_0_1
