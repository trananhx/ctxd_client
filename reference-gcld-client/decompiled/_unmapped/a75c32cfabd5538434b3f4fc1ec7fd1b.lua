equipmentKaiguangControl = {}

local var_0_0 = equipmentKaiguangControl
local var_0_1

function handlerGetKaiguangInfoAction(arg_1_0)
	if arg_1_0.action.data then
		equipmentKaiguangUI.setKaiguangInfo(arg_1_0.action.data)
	end
end

function var_0_0.openKaiguang()
	cmgr.sendRequest(handlerGetKaiguangInfoAction, actions.getLightInfo)
end

function var_0_0.bugXilianPoint()
	local function var_3_0(arg_4_0)
		var_0_0.openKaiguang()
	end

	cmgr.sendRequest(var_3_0, actions.buyPoint)
end

function var_0_0.openLightTaozhuang()
	local function var_5_0(arg_6_0)
		needShowKaiguangAnimationTaozhuang = true

		var_0_0.openKaiguang()
	end

	cmgr.sendRequest(var_5_0, actions.openLight, equipmentKaiguangUI.getCurrentItem())
end

function var_0_0.taozhuangSublimate()
	local function var_7_0(arg_8_0)
		smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
		equipmentKaiguangUI.showKaiguangAnimation(1)
	end

	cmgr.sendRequest(var_7_0, actions.sublimate)
end

function var_0_0.showTips(arg_9_0, arg_9_1)
	require("res/lang_zh_cn")

	local var_9_0

	for iter_9_0, iter_9_1 in ipairs(arg_9_1.finalSuits) do
		if iter_9_1.suitId == arg_9_0 then
			var_9_0 = iter_9_1

			break
		end
	end

	local var_9_1 = require("res/layout/general/equipTips")
	local var_9_2 = {}
	local var_9_3 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_9_3:registerScriptTouchHandler(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == CCTOUCHBEGAN then
			return true
		elseif arg_10_0 == CCTOUCHMOVED then
			return true
		elseif arg_10_0 == CCTOUCHENDED then
			pcall(var_9_3.removeFromParentAndCleanup, var_9_3, true)

			return true
		end
	end, false, true)
	var_9_3:setTouchEnabled(true)

	local var_9_4 = CCScale9Sprite:createWithSpriteFrameName("bigPanel.png")

	var_9_4:setPreferredSize(CCSizeMake(500, 550))
	var_9_4:setPosition(ccp(600, 280))
	var_9_3:addChild(var_9_4, 0)
	uiutil.initUIComponent(nil, var_9_2, var_9_1.JiSuitEquipTips)
	var_9_2.suitNameLabel:setString(var_9_0.itemName)
	var_9_2.suitIntroLabel1:setString(language.get(30304))
	var_9_2.equipLabel1:setString(language.get(30103, var_9_0.att, var_9_0.def, var_9_0.blood))
	var_9_2.suitIntroLabel2:setString(language.get(30305))
	var_9_2.equipLabel2:setString(language.get(30103, var_9_0.sublimatedAtt, var_9_0.sublimatedDef, var_9_0.sublimatedBlood))
	var_9_2.suitIntroLabel3:setString(language.get(30306))
	var_9_2.equipLabel3:setString(language.get(30308, var_9_0.skillName1, var_9_0.lightAddedNum1, var_9_0.skillName2, var_9_0.lightAddedNum2))
	var_9_2.suitIntroLabel4:setString(language.get(30303))
	var_9_2.equipLabel41:setString(language.get(30315, var_9_0.subEquips[1].equipName, var_9_0.subEquips[1].skillName, var_9_0.subEquips[1].skillLv))
	var_9_2.equipLabel42:setString(language.get(30315, var_9_0.subEquips[2].equipName, var_9_0.subEquips[2].skillName, var_9_0.subEquips[2].skillLv))
	var_9_2.equipLabel43:setString(language.get(30315, var_9_0.subEquips[3].equipName, var_9_0.subEquips[3].skillName, var_9_0.subEquips[3].skillLv))
	var_9_2.equipLabel44:setString(language.get(30315, var_9_0.subEquips[4].equipName, var_9_0.subEquips[4].skillName, var_9_0.subEquips[4].skillLv))
	var_9_2.equipLabel45:setString(language.get(30315, var_9_0.subEquips[5].equipName, var_9_0.subEquips[5].skillName, var_9_0.subEquips[5].skillLv))
	var_9_2.equipLabel46:setString(language.get(30315, var_9_0.subEquips[6].equipName, var_9_0.subEquips[6].skillName, var_9_0.subEquips[6].skillLv))
	var_9_2.suitIntroLabel5:setString(language.get(30301))
	var_9_2.equipLabel5:setString(var_9_0.realIntro)
	var_9_3:addChild(var_9_2.tipPanel)
	smgr.rootLayer:addChild(var_9_3, 60000)
end

function var_0_0.showJiEquipTips(arg_11_0, arg_11_1)
	local function var_11_0(arg_12_0)
		log.info("@@ \xCF\xD4ʾ\xBC\xAB\xCC\xD7װ\xCA\xF4\xD0\xD4aaa@ ")
		equipmentKaiguangUI.setPageData(arg_12_0.action.data)
		var_0_0.showTips(arg_11_0, arg_12_0.action.data)
	end

	if arg_11_1 == nil then
		cmgr.sendRequest(var_11_0, actions.getLightInfo)
	else
		log.info("@@ \xCF\xD4ʾ\xBC\xAB\xCC\xD7װ\xCA\xF4\xD0\xD4b@")
		var_0_0.showTips(arg_11_0, arg_11_1)
	end
end

function var_0_0.onEnter()
	return
end

function var_0_0.onExit()
	return
end
