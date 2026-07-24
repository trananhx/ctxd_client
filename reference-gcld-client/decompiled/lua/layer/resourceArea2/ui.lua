tool.requireRes("resourceArea2")
require("lua/layer/task/ui")
require("lua/layer/playerInfo/ui")
require("lua/layer/menu/ui")
require("lua/common/tool")

local var_0_0 = require("res/native/offset").get("layer.resource2")
local var_0_1 = {
	[3] = 3,
	[247] = 10032,
	[116] = 55,
	[51] = 10035,
	[216] = 216
}

resourceAreaUI = {}

local var_0_2 = resourceAreaControl
local var_0_3 = resourceAreaConstant

resourceAreaUI.uiTable = nil
resourceAreaUI.batchNode = {}

function resourceAreaUI.playerBuildingAnim(arg_1_0, arg_1_1)
	local var_1_0 = CCSprite:create()

	var_1_0:setPosition(ccp(arg_1_0:getContentSize().width / 2, arg_1_0:getContentSize().height / 2))

	local var_1_1 = tolua.cast(arg_1_0:getChildByTag(var_0_3.BUILDING_LV_TAG), "CCSprite")

	if var_1_1 then
		var_1_1:setVisible(false)
	end

	local var_1_2 = CCArray:create()

	for iter_1_0 = 1, arg_1_1 do
		local var_1_3 = tool.spriteFrameByName(string.format("d%04.f.png", iter_1_0))

		var_1_2:addObject(var_1_3)
	end

	local var_1_4 = CCAnimation:createWithSpriteFrames(var_1_2, 0.03)
	local var_1_5 = CCAnimate:create(var_1_4)
	local var_1_6 = CCRepeatForever:create(var_1_5)

	var_1_0:runAction(var_1_6)
	arg_1_0:addChild(var_1_0, 1)
	amgr.playEffect(enumAudioFile.ui_minju_shengji)
end

function resourceAreaUI.playerJinguangAnim(arg_2_0, arg_2_1)
	local var_2_0 = smgr.getLayer("resourceAreaLayer")
	local var_2_1 = CCSprite:create()
	local var_2_2 = CCArray:create()

	for iter_2_0 = 1, arg_2_1 do
		local var_2_3 = string.format("建造完成发光-12%04.f.png", iter_2_0)
		local var_2_4 = tool.spriteFrameByName(string.format("建造完成发光-12%04.f.png", iter_2_0))

		var_2_2:addObject(var_2_4)
	end

	local var_2_5 = CCAnimation:createWithSpriteFrames(var_2_2, 0.05)
	local var_2_6 = CCAnimate:create(var_2_5)
	local var_2_7 = CCCallFuncN:create(function(arg_3_0)
		local var_3_0 = tolua.cast(arg_3_0, "CCSprite")

		var_2_0:removeChild(var_3_0, true)
	end)
	local var_2_8 = CCArray:create()

	var_2_8:addObject(var_2_6)
	var_2_8:addObject(var_2_7)

	local var_2_9 = CCSequence:create(var_2_8)

	var_2_1:setPosition(ccp(arg_2_0:getPositionX(), arg_2_0:getPositionY() + 60))
	var_2_0:addChild(var_2_1, 101)
	var_2_1:runAction(var_2_9)
end

function resourceAreaUI.taskFinishAnim(arg_4_0, arg_4_1)
	local var_4_0 = smgr.getLayer("resourceAreaLayer")

	local function var_4_1(arg_5_0)
		tolua.cast(arg_5_0, "CCNode"):removeFromParentAndCleanup(true)
	end

	local var_4_2 = CCCallFuncN:create(var_4_1)

	local function var_4_3()
		local var_6_0 = CCArray:create()

		for iter_6_0 = 30001, 30024 do
			local var_6_1 = string.format("sl_%d.png", iter_6_0)
			local var_6_2 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_6_1)

			var_6_0:addObject(var_6_2)
		end

		local var_6_3 = CCAnimation:createWithSpriteFrames(var_6_0, 0.05)
		local var_6_4 = CCAnimate:create(var_6_3)
		local var_6_5 = CCArray:create()

		var_6_5:addObject(var_6_4)
		var_6_5:addObject(var_4_2)

		local var_6_6 = CCSprite:createWithSpriteFrameName("sl_30001.png")
		local var_6_7 = tolua.cast(var_4_0:getChildByTag(var_0_3.OUTPUTSPRITE_TAG), "CCSprite")

		var_6_6:setPosition(ccp(var_6_7:getPositionX(), var_6_7:getPositionY()))

		local var_6_8 = tolua.cast(var_4_0:getChildByTag(var_0_3.OUTPUTVALUE_TAG), "CCLabelAtlas"):getContentSize().width
		local var_6_9 = var_6_7:getContentSize().width / var_6_6:getContentSize().width

		var_6_6:setScaleX(var_6_9)
		var_4_0:addChild(var_6_6, 102)
		var_6_6:runAction(CCSequence:create(var_6_5))
	end

	if arg_4_1 and arg_4_1 > 0 then
		local var_4_4 = CCArray:create()

		for iter_4_0 = 10001, 10017 do
			local var_4_5 = string.format("itemlight-%d.png", iter_4_0)
			local var_4_6 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_4_5)

			var_4_4:addObject(var_4_6)
		end

		local var_4_7 = CCAnimation:createWithSpriteFrames(var_4_4, 0.05)
		local var_4_8 = CCAnimate:create(var_4_7)
		local var_4_9 = CCRepeatForever:create(var_4_8)
		local var_4_10 = CCMoveTo:create(0.8, myccp(839, 53))
		local var_4_11 = CCMoveTo:create(0.8, myccp(839, 53))
		local var_4_12 = CCCallFuncN:create(var_4_3)
		local var_4_13 = CCArray:create()

		var_4_13:addObject(var_4_10)
		var_4_13:addObject(var_4_2)
		var_4_13:addObject(var_4_12)

		local var_4_14 = CCArray:create()

		var_4_14:addObject(var_4_11)
		var_4_14:addObject(var_4_2)

		local var_4_15 = CCSprite:create()

		var_4_15:setPosition(arg_4_0:getPosition())
		var_4_15:runAction(var_4_9)

		local var_4_16 = CCSprite:createWithTexture(resourceAreaUI.batchNode.resIcon:getTexture())

		var_4_16:setPosition(arg_4_0:getPosition())
		var_4_15:runAction(CCSequence:create(var_4_13))
		var_4_16:runAction(CCSequence:create(var_4_14))
		var_4_0:addChild(var_4_15, 111)
		var_4_0:addChild(var_4_16, 111)
	end

	if tonumber(var_0_2.flyExp) > 0 then
		local var_4_17 = globalAction_gotSingleResource(6, var_0_2.flyExp)

		var_4_17:setPosition(ccp(arg_4_0:getPositionX(), arg_4_0:getPositionY() + 60))
		var_4_0:addChild(var_4_17, 111)

		local var_4_18 = CCMoveTo:create(0.8, myccp(30, 30))
		local var_4_19 = CCArray:create()

		var_4_19:addObject(var_4_18)
		var_4_19:addObject(var_4_2)
		var_4_17:runAction(CCSequence:create(var_4_19))
	end
end

function resourceAreaUI.initBatchNode()
	resourceAreaUI.batchNode.resIcon = nil

	if var_0_3.RESOURCE_AREA_TYPE == 1 then
		resourceAreaUI.batchNode.resIcon = CCSpriteBatchNode:create("res/ui/task/get_icon_silver.png")
	elseif var_0_3.RESOURCE_AREA_TYPE == 2 then
		resourceAreaUI.batchNode.resIcon = CCSpriteBatchNode:create("res/ui/task/get_icon_wood.png")
	elseif var_0_3.RESOURCE_AREA_TYPE == 3 then
		resourceAreaUI.batchNode.resIcon = CCSpriteBatchNode:create("res/ui/task/get_icon_food.png")
	elseif var_0_3.RESOURCE_AREA_TYPE == 4 then
		resourceAreaUI.batchNode.resIcon = CCSpriteBatchNode:create("res/ui/task/get_icon_iron.png")
	elseif var_0_3.RESOURCE_AREA_TYPE == 5 then
		resourceAreaUI.batchNode.resIcon = CCSpriteBatchNode:create("res/ui/task/get_icon_soldier.png")
	end

	resourceAreaUI.batchNode.expIcon = CCSpriteBatchNode:create("res/ui/task/get_icon_exp.png")

	local var_7_0 = smgr.getLayer("resourceAreaLayer")

	var_7_0:addChild(resourceAreaUI.batchNode.resIcon, 112)
	var_7_0:addChild(resourceAreaUI.batchNode.expIcon, 112)
end

function resourceAreaUI.updateConstruction()
	return
end

function resourceAreaUI.forceExpandTaskBoard(arg_9_0)
	var_0_2.forceExpandTaskBoard = arg_9_0
end

function resourceAreaUI.updateFuncionItem()
	if smgr.getLayer("resourceAreaLayer") then
		-- block empty
	end
end

function resourceAreaUI.updateAutoUpdateMenu()
	resourceAreaUI.uiTable.autoUpgradeMenu:setVisible(user.getFunc(21))
	resourceAreaUI.uiTable.goldHammerMenu:setVisible(user.getFunc(56))

	if guide.constant.other[1] == true then
		guide.control.loadGuide(5, 1)
	end
end

function resourceAreaUI.action_flyAutoUpgradeMenu()
	local var_12_0, var_12_1 = resourceAreaUI.uiTable.autoUpgradeMenu:getPosition()

	resourceAreaUI.uiTable.autoUpgradeMenu:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
	resourceAreaUI.uiTable.autoUpgradeMenu:setVisible(true)

	local var_12_2 = CCDelayTime:create(0.5)
	local var_12_3 = CCMoveTo:create(0.5, ccp(var_12_0, var_12_1))
	local var_12_4 = CCCallFuncN:create(resourceAreaUI.updateAutoUpdateMenu)
	local var_12_5 = CCArray:create()

	var_12_5:addObject(var_12_2)
	var_12_5:addObject(var_12_3)
	var_12_5:addObject(var_12_4)

	local var_12_6 = CCSequence:create(var_12_5)

	resourceAreaUI.uiTable.autoUpgradeMenu:runAction(var_12_6)
end

function resourceAreaUI.action_flyConstructionTeam(arg_13_0)
	log.info("action_flyConstructionTeam:", arg_13_0)

	local var_13_0 = smgr.getLayer("resourceAreaLayer")
	local var_13_1 = tolua.cast(var_13_0:getChildByTag(var_0_3.CHUIZI_TAG + arg_13_0), "CCSprite")

	if var_13_1 == nil then
		var_13_1 = CCSprite:create("res/ui/resourceArea2/resou_gra_cz.png")

		local var_13_2 = visibleSize.width - 30 + (1 - arg_13_0) * 35
		local var_13_3 = visibleSize.height - 190

		var_13_1:setPosition(ccp(var_13_2, var_13_3))
		var_13_0:addChild(var_13_1, 111, var_0_3.CHUIZI_TAG + arg_13_0)
	end

	local var_13_4, var_13_5 = var_13_1:getPosition()

	var_13_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
	var_13_1:setVisible(true)

	local var_13_6 = CCDelayTime:create(0.5)
	local var_13_7 = CCMoveTo:create(1, ccp(var_13_4, var_13_5))
	local var_13_8 = CCCallFuncN:create(function()
		var_13_1:removeAllChildrenWithCleanup(true)
	end)
	local var_13_9 = CCArray:create()

	var_13_9:addObject(var_13_6)
	var_13_9:addObject(var_13_7)
	var_13_9:addObject(var_13_8)

	local var_13_10 = CCSequence:create(var_13_9)
	local var_13_11 = CCArray:create()

	for iter_13_0 = 10001, 10017 do
		local var_13_12 = string.format("itemlight-%d.png", iter_13_0)
		local var_13_13 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_13_12)

		var_13_11:addObject(var_13_13)
	end

	local var_13_14 = CCAnimation:createWithSpriteFrames(var_13_11, 0.05)
	local var_13_15 = CCAnimate:create(var_13_14)
	local var_13_16 = CCRepeatForever:create(var_13_15)
	local var_13_17 = CCSprite:create()

	var_13_17:setPosition(ccp(var_13_1:getContentSize().width / 2, var_13_1:getContentSize().height / 2))
	var_13_17:runAction(var_13_16)
	var_13_1:addChild(var_13_17, -1)
	var_13_1:runAction(var_13_10)
end

function resourceAreaUI.initBasicUI()
	local var_15_0 = smgr.getLayer("resourceAreaLayer")

	resourceAreaUI.uiTable = autoUI.initUI(var_15_0, getResourceUiData())

	resourceAreaUI.uiTable.autoUpgradeMenu:setVisible(user.getFunc(21))
	resourceAreaUI.uiTable.autoUpgradeItem:registerScriptTapHandler(var_0_2.autoUpgradeSelected)
	resourceAreaUI.uiTable.goldHammerItem:registerScriptTapHandler(var_0_2.goldHammerSelected)
	resourceAreaUI.uiTable.goldHammerMenu:setVisible(user.getFunc(56))
	resourceAreaUI.uiTable.slavesGoldItem:registerScriptTapHandler(var_0_2.goldBuySlave)
	autoUI.createUI(var_15_0, getResourceUiData()["bgSprite_" .. var_0_3.RESOURCE_AREA_TYPE], {})

	local var_15_1 = autoUI.createUI(var_15_0, getResourceUiData()["resourceIcon_" .. var_0_3.RESOURCE_AREA_TYPE], resourceAreaUI.uiTable)

	resourceAreaUI.uiTable.resourceIcon = var_15_1

	autoUI.createUI(var_15_0, getResourceUiData()["remouldIcon_" .. var_0_3.RESOURCE_AREA_TYPE], resourceAreaUI.uiTable)

	if var_0_3.RESOURCE_AREA_TYPE == 2 then
		autoUI.createUI(var_15_0, getResourceUiData().remouldIcon_2_2, resourceAreaUI.uiTable)
		autoUI.createUI(var_15_0, getResourceUiData().remouldIcon_2_3, resourceAreaUI.uiTable)
		autoUI.createUI(var_15_0, getResourceUiData().remouldIcon_2_4, resourceAreaUI.uiTable)
	elseif var_0_3.RESOURCE_AREA_TYPE == 3 then
		autoUI.createUI(var_15_0, getResourceUiData().remouldIcon_3_2, resourceAreaUI.uiTable)
	end

	local var_15_2 = CCLabelAtlas:create(var_0_2.totalOutput, "res/ui/common/number/resou_up_numb.png", 20, 22, 48)

	var_15_2:setAnchorPoint(ccp(1, 0.5))
	var_15_2:setPosition(ccp(resourceAreaUI.uiTable.outputSprite:getPositionX() + 50, resourceAreaUI.uiTable.outputSprite:getPositionY()))
	var_15_0:addChild(var_15_2, 101, var_0_3.OUTPUTVALUE_TAG)

	resourceAreaUI.uiTable.outputValueLabel = var_15_2

	if var_0_3.RESOURCE_AREA_TYPE == 5 then
		resourceAreaUI.uiTable.outputUnitName:setDisplayFrame(CCSprite:create("res/ui/resourceArea2/minute.png"):displayFrame())
	end

	var_0_2.goldHammer_flash = true

	resourceAreaUI.add_mazeiAndTufei()
end

function resourceAreaUI.add_mazeiAndTufei()
	if var_0_3.RESOURCE_AREA_TYPE == 1 then
		resourceAreaUI.add_mazei()
	elseif var_0_3.RESOURCE_AREA_TYPE == 2 and var_0_2.hasBandit == 2 then
		resourceAreaUI.add_tufei2()
	elseif var_0_3.RESOURCE_AREA_TYPE == 2 and var_0_2.hasBandit == 3 then
		resourceAreaUI.add_tufei1()
	end
end

function resourceAreaUI.add_mazei()
	if user.curMainTask and user.curMainTask.taskId == 5 and user.curMainTask.state == 1 and resourceAreaUI.uiTable.icon_mazei == nil then
		local var_17_0 = CCSprite:create("res/ui/resourceArea2/mazei_bg.png")
		local var_17_1 = 369 + (visibleSize.width - 960) / 2
		local var_17_2 = 451 + (visibleSize.height - 640) / 2

		var_17_0:setPosition(ccp(var_17_1, var_17_2))

		local var_17_3 = CCSprite:create("res/ui/resourceArea2/mazei.png")
		local var_17_4 = CCSprite:create("res/ui/resourceArea2/mazei.png")
		local var_17_5 = CCMenuItemSprite:create(var_17_3, var_17_4)

		var_17_5:registerScriptTapHandler(resourceAreaUI.click_shaMazei)
		var_17_5:setPosition(ccp(49, 49))

		local var_17_6 = CCMenu:create()

		var_17_6:setPosition(ccp(0, 0))
		var_17_6:addChild(var_17_5, 1)
		var_17_0:addChild(var_17_6, 1)
		smgr.getLayer("resourceAreaLayer"):addChild(var_17_0, 100033)

		resourceAreaUI.uiTable.icon_mazei = var_17_0
	end
end

function resourceAreaUI.click_shaMazei()
	smgr.getLayer("resourceAreaLayer"):removeChild(resourceAreaUI.uiTable.icon_mazei, true)

	resourceAreaUI.uiTable.icon_mazei = nil

	local var_18_0 = {
		{
			generalPic = "cunmin",
			quality = 1,
			generalId = 0,
			state = 1,
			index = 1,
			generalLv = 10,
			generalName = language.get(170008)
		}
	}
	local var_18_1 = {
		{
			generalPic = "shanzei",
			quality = 1,
			generalId = 0,
			state = 1,
			index = 1,
			generalLv = 10,
			generalName = language.get(170009)
		}
	}

	bmgr.playBattle(var_18_0, var_18_1)
	cmgr.sendRequest(nil, actions.killBandit, 8)
end

function resourceAreaUI.add_tufei1()
	if user.curMainTask.taskId == 12 and user.curMainTask.state == 1 and resourceAreaUI.uiTable.icon_tufei == nil then
		local var_19_0 = CCSprite:create("res/ui/resourceArea2/mazei_bg.png")
		local var_19_1 = 488 + (visibleSize.width - 960) / 2
		local var_19_2 = 525 + (visibleSize.height - 640) / 2

		var_19_0:setPosition(ccp(var_19_1, var_19_2))

		local var_19_3 = CCSprite:create("res/ui/resourceArea2/mazei.png")
		local var_19_4 = CCSprite:create("res/ui/resourceArea2/mazei.png")
		local var_19_5 = CCMenuItemSprite:create(var_19_3, var_19_4)

		var_19_5:registerScriptTapHandler(resourceAreaUI.click_shaTufei1)
		var_19_5:setPosition(ccp(49, 49))

		local var_19_6 = CCMenu:create()

		var_19_6:setPosition(ccp(0, 0))
		var_19_6:addChild(var_19_5, 1)
		var_19_0:addChild(var_19_6, 1)
		smgr.getLayer("resourceAreaLayer"):addChild(var_19_0, 100033)

		resourceAreaUI.uiTable.icon_tufei = var_19_0
	end
end

function resourceAreaUI.click_shaTufei1()
	smgr.getLayer("resourceAreaLayer"):removeChild(resourceAreaUI.uiTable.icon_tufei, true)

	resourceAreaUI.uiTable.icon_tufei = nil

	local var_20_0 = {
		{
			generalPic = "cunmin",
			quality = 1,
			generalId = 0,
			state = 1,
			index = 1,
			generalLv = 10,
			generalName = language.get(170010)
		}
	}
	local var_20_1 = {
		{
			generalPic = "shanzei",
			quality = 1,
			generalId = 0,
			state = 1,
			index = 1,
			generalLv = 10,
			generalName = language.get(170009)
		}
	}

	bmgr.playBattle(var_20_0, var_20_1)

	if guide.constant.other[3] == true then
		guide.constant.other[3] = false

		guide.ui.setVisible(false)
	end

	cmgr.sendRequest(nil, actions.killBandit, 17)
	roleDialogue.control.loadSpeak(161)

	var_0_2.hasBandit = 2
end

function resourceAreaUI.add_tufei2()
	if user.curMainTask.taskId == 12 and user.curMainTask.state == 1 and resourceAreaUI.uiTable.icon_tufei == nil then
		local var_21_0 = CCSprite:create("res/ui/resourceArea2/mazei_bg.png")
		local var_21_1 = 606 + (visibleSize.width - 960) / 2
		local var_21_2 = 466 + (visibleSize.height - 640) / 2

		var_21_0:setPosition(ccp(var_21_1, var_21_2))

		local var_21_3 = CCSprite:create("res/ui/resourceArea2/mazei.png")
		local var_21_4 = CCSprite:create("res/ui/resourceArea2/mazei.png")
		local var_21_5 = CCMenuItemSprite:create(var_21_3, var_21_4)

		var_21_5:registerScriptTapHandler(resourceAreaUI.click_shaTufei2)
		var_21_5:setPosition(ccp(49, 49))

		local var_21_6 = CCMenu:create()

		var_21_6:setPosition(ccp(0, 0))
		var_21_6:addChild(var_21_5, 1)
		var_21_0:addChild(var_21_6, 1)
		smgr.getLayer("resourceAreaLayer"):addChild(var_21_0, 100033)

		resourceAreaUI.uiTable.icon_tufei = var_21_0
	end
end

function resourceAreaUI.click_shaTufei2()
	smgr.getLayer("resourceAreaLayer"):removeChild(resourceAreaUI.uiTable.icon_tufei, true)

	resourceAreaUI.uiTable.icon_tufei = nil

	local var_22_0 = {
		{
			generalPic = "cunmin",
			quality = 1,
			generalId = 0,
			state = 1,
			index = 1,
			generalLv = 10,
			generalName = language.get(170010)
		}
	}
	local var_22_1 = {
		{
			generalPic = "shanzei",
			quality = 1,
			generalId = 0,
			state = 1,
			index = 1,
			generalLv = 10,
			generalName = language.get(170009)
		}
	}

	bmgr.playBattle(var_22_0, var_22_1)
	cmgr.sendRequest(nil, actions.killBandit, 18)
end

function resourceAreaUI.getBuildingFeat()
	var_0_2.getBuildingFeat()
end

function resourceAreaUI.update_buildingFeat(arg_24_0)
	if tolua.isnull(resourceAreaUI.uiTable.buildingFeatCount) then
		return
	end

	if arg_24_0 and arg_24_0 > 0 then
		resourceAreaUI.uiTable.buildingFeatCount:setString(arg_24_0)
		resourceAreaUI.uiTable.buildingFeatItem:selected()
	else
		resourceAreaUI.uiTable.buildingFeatCount:setString("")
		resourceAreaUI.uiTable.buildingFeatItem:unselected()
	end
end

function resourceAreaUI.update_goldCount(arg_25_0)
	if smgr.nextSceneTag == SCENE_RES_JUMING or smgr.nextSceneTag == SCENE_RES_MUCHANG or smgr.nextSceneTag == SCENE_RES_BINGYING or smgr.nextSceneTag == SCENE_RES_NONGTIAN or smgr.nextSceneTag == SCENE_RES_BINGTIE then
		if tonumber(arg_25_0) > 0 then
			resourceAreaUI.uiTable.goldHammerCount:setString(tostring(arg_25_0))
			resourceAreaUI.uiTable.goldHammerCount:setVisible(true)
		else
			resourceAreaUI.uiTable.goldHammerCount:setVisible(false)
		end
	end
end

function resourceAreaUI.showLuomuReward(arg_26_0, arg_26_1)
	local function var_26_0(arg_27_0, arg_27_1)
		local var_27_0 = CCDelayTime:create(arg_27_1)
		local var_27_1 = CCCallFuncN:create(function()
			arg_27_0:setVisible(true)
		end)
		local var_27_2 = CCMoveBy:create(0.3, ccp(0, 30))
		local var_27_3 = CCDelayTime:create(0.5)
		local var_27_4 = CCFadeOut:create(0.5)
		local var_27_5 = CCCallFuncN:create(function(arg_29_0)
			arg_27_0:removeFromParentAndCleanup(true)
		end)
		local var_27_6 = CCArray:create()

		var_27_6:addObject(var_27_0)
		var_27_6:addObject(var_27_1)
		var_27_6:addObject(var_27_2)
		var_27_6:addObject(var_27_3)
		var_27_6:addObject(var_27_4)
		var_27_6:addObject(var_27_5)

		local var_27_7 = CCSequence:create(var_27_6)

		arg_27_0:runAction(var_27_7)
	end

	local var_26_1 = smgr.getLayer("resourceAreaLayer")
	local var_26_2

	if arg_26_1.lumberYardReform then
		if arg_26_1.lumberYardReform.effectType == 1 then
			var_26_2 = CCSprite:create("res/ui/resourceArea2/wood_gaizao/mcgz_word_sczc.png")
		elseif arg_26_1.lumberYardReform.effectType == 2 then
			var_26_2 = CCSprite:create("res/ui/resourceArea2/wood_gaizao/mcgz_word_gjjh.png")
		elseif arg_26_1.lumberYardReform.effectType == 3 then
			var_26_2 = CCSprite:create("res/ui/resourceArea2/wood_gaizao/mcgz_word_sckc.png")
		end
	elseif arg_26_1.farmReform then
		if arg_26_1.farmReform.effectType == 1 then
			var_26_2 = CCSprite:create("res/ui/resourceArea2/food_gaizao/ntgz_word_qsclzj.png")
		elseif arg_26_1.farmReform.effectType == 2 then
			var_26_2 = CCSprite:create("res/ui/resourceArea2/wood_gaizao/mcgz_word_gjjh.png")
		elseif arg_26_1.farmReform.effectType == 3 then
			var_26_2 = CCSprite:create("res/ui/resourceArea2/food_gaizao/mcgz_word_sckc.png")
		end
	end

	if var_26_2 then
		var_26_2:setPosition(ccp(arg_26_0:getPositionX(), arg_26_0:getPositionY()))
		var_26_1:addChild(var_26_2, 1000)
		var_26_0(var_26_2, 0.3)
	end

	for iter_26_0 = 1, 4 do
		local var_26_3 = CCSprite:create("res/ui/resourceArea2/wood_gaizao/mcgz_word_tsxgjs.png")

		var_26_3:setScale(0.7)

		if iter_26_0 == 1 then
			var_26_3:setPosition(ccp(arg_26_0:getPositionX() - 118, arg_26_0:getPositionY() - 59))
		elseif iter_26_0 == 2 then
			var_26_3:setPosition(ccp(arg_26_0:getPositionX() + 118, arg_26_0:getPositionY() + 59))
		elseif iter_26_0 == 3 then
			var_26_3:setPosition(ccp(arg_26_0:getPositionX() - 118, arg_26_0:getPositionY() + 59))
		else
			var_26_3:setPosition(ccp(arg_26_0:getPositionX() + 118, arg_26_0:getPositionY() - 59))
		end

		var_26_3:setVisible(false)
		var_26_1:addChild(var_26_3, 1000)
		var_26_0(var_26_3, 1)
	end
end

function resourceAreaUI.initGameUI()
	local var_30_0 = smgr.getLayer("resourceAreaLayer")

	if var_0_2.ifStartAutoUp and var_0_2.autoTimes > 0 then
		resourceAreaUI.uiTable.autoTimesLabel:setString(tostring(var_0_2.autoTimes))
		resourceAreaUI.uiTable.autoTimesLabel:setVisible(true)
	else
		resourceAreaUI.uiTable.autoTimesLabel:setVisible(false)
	end

	if var_0_2.freeConsNum > 0 then
		resourceAreaUI.uiTable.goldHammerCount:setString(tostring(var_0_2.freeConsNum))
		resourceAreaUI.uiTable.goldHammerCount:setVisible(true)
	else
		resourceAreaUI.uiTable.goldHammerCount:setVisible(false)
	end

	local var_30_1 = autoUI.createUI(var_30_0, getResourceUiData()["additionMode_" .. var_0_2.additionMode], var_0_2.needRefreshObject)

	resourceAreaUI.uiTable.additionMode = var_30_1

	local var_30_2, var_30_3 = var_30_1:getPosition()

	if menuUI.ui.isOpen == true then
		resourceAreaUI.uiTable.additionMode:setPosition(ccp(var_30_2 + 300, var_30_3))
	end

	if var_0_2.canSetMode then
		local var_30_4 = CCArray:create()

		var_30_4:addObject(CCScaleTo:create(0.5, 1.3))
		var_30_4:addObject(CCScaleTo:create(0.5, 1))
		resourceAreaUI.uiTable.additionMode:runAction(CCRepeatForever:create(tolua.cast(CCSequence:create(var_30_4), "CCActionInterval")))
	end

	clockReward.ui.table = autoUI.initUI(layer, getClockRewardData())

	resourceAreaUI.uiTable.outputValueLabel:setString(var_0_2.totalOutput)
	resourceAreaUI.uiTable.slaveNum:setString(language.get(490903, var_0_2.slaveNum or 0))

	local var_30_5 = #var_0_3["BUILDING_POSITION_" .. var_0_3.RESOURCE_AREA_TYPE]

	if var_0_2.progress then
		resourceAreaUI.uiTable.rmProgressText:setString(var_0_2.progress .. "/" .. var_30_5)
		resourceAreaUI.uiTable.rmProgress:setPercentage(var_0_2.progress / var_30_5 * 100)
	end

	if var_0_2.displayIron == 0 and var_0_3.RESOURCE_AREA_TYPE == 4 then
		resourceAreaUI.uiTable.outputValueLabel:setString(math.floor(var_0_2.totalGemOutPut / 4))
		resourceAreaUI.uiTable.resourceIcon:setDisplayFrame(CCSprite:create("res/ui/task/get_icon_gem.png"):displayFrame())
	elseif var_0_2.silkOutput > 0 then
		resourceAreaUI.uiTable.outputValueLabel:setString(math.floor(var_0_2.silkOutput))
		resourceAreaUI.uiTable.resourceIcon:setDisplayFrame(CCSprite:create("res/ui/task/get_icon_silk.png"):displayFrame())
	end

	if var_0_2.lumberYardReform and var_0_2.lumberYardReform.allOver == 1 and var_0_2.lumberYardReform.buffLeftTime > 0 then
		resourceAreaUI.uiTable.luomuBuffIcon2:setVisible(true)

		local var_30_6 = createTimerLabel(var_0_2.lumberYardReform.buffLeftTime, "@H:@M:@S", "Thonburi", 18, nil, nil, nil, ccc3(255, 0, 0))

		var_30_6:setPosition(ccp(resourceAreaUI.uiTable.luomuBuffIcon2:getPositionX(), resourceAreaUI.uiTable.luomuBuffIcon2:getPositionY() - 40))
		var_30_0:addChild(var_30_6, 1000)
	end

	if var_0_2.lumberYardReformPlus then
		if var_0_2.lumberYardReformPlus.inReform == true then
			resourceAreaUI.uiTable.qingcheIcon4:setVisible(true)
		elseif var_0_2.lumberYardReformPlus.allOver == 1 then
			resourceAreaUI.uiTable.qingcheIcon3:setVisible(true)
		end
	end

	if var_0_2.farmReform and var_0_2.farmReform.allOver == 1 and var_0_2.farmReform.buffLeftTime > 0 then
		resourceAreaUI.uiTable.majunBuffIcon:setVisible(true)

		local var_30_7 = createTimerLabel(var_0_2.farmReform.buffLeftTime, "@H:@M:@S", "Thonburi", 18, nil, nil, nil, ccc3(255, 0, 0))

		var_30_7:setPosition(ccp(resourceAreaUI.uiTable.majunBuffIcon:getPositionX(), resourceAreaUI.uiTable.majunBuffIcon:getPositionY() - 40))
		var_30_0:addChild(var_30_7, 1000)
	end

	if var_0_2.luban then
		resourceAreaUI.uiTable.remouldIcon:setVisible(true)

		if var_0_2.luban == 1 then
			resourceAreaUI.uiTable.slaves:setVisible(true)
			resourceAreaUI.uiTable.slavesGold:setVisible(true)
			resourceAreaUI.uiTable.slavesGoldInfo:setVisible(true)
			resourceAreaUI.uiTable.remouldProgeress:setVisible(true)
			resourceAreaUI.uiTable.slavesGoldItem:setEnabled(var_0_2.buyGrabState == 1)
			resourceAreaUI.uiTable.slaveGoldPrice:setString(var_0_2.buyGrabCost)
		else
			resourceAreaUI.uiTable.slaves:setVisible(false)
			resourceAreaUI.uiTable.slavesGold:setVisible(false)
			resourceAreaUI.uiTable.slavesGoldInfo:setVisible(false)
			resourceAreaUI.uiTable.remouldProgeress:setVisible(false)
		end
	end

	log.info(var_0_2.reformComplete)
	resourceAreaUI.uiTable.btnRemouldFunc:setEnabled(var_0_2.reformComplete == 1)

	local var_30_8 = 0
	local var_30_9 = 0
	local var_30_10 = 0
	local var_30_11 = 0

	for iter_30_0, iter_30_1 in pairs(var_0_2.buildingTable) do
		local var_30_12 = "building_" .. var_0_3.RESOURCE_AREA_TYPE .. "_" .. iter_30_1.pos
		local var_30_13 = getResourceUiData()[var_30_12]

		var_30_13.tag = var_0_3.FIELD_TAG + iter_30_1.id

		autoUI.createUI(var_30_0, var_30_13, var_0_2.needRefreshObject)

		local var_30_14 = var_0_2.needRefreshObject[var_30_12]
		local var_30_15 = var_30_14:getContentSize().width
		local var_30_16 = var_30_14:getContentSize().height
		local var_30_17

		if iter_30_1.canChanged or iter_30_1.needSlaveNum and iter_30_1.isUpgrading ~= 1 then
			local var_30_18 = CCScale9Sprite:create("res/ui/resourceArea2/zcgz_btn_round.png")
			local var_30_19 = CCControlButton:create(var_30_18)

			var_30_19:setAdjustBackgroundImage(false)
			var_30_19:setZoomOnTouchDown(false)
			var_30_19:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/resourceArea2/zcgz_btn_round_c.png"), CCControlStateHighlighted)

			local var_30_20 = CCProgressTimer:create(CCSprite:create("res/ui/resourceArea2/zcgz_area_gzhc_mj1.png"))

			var_30_20:setReverseProgress(true)
			var_30_20:setType(kCCProgressTimerTypeRadial)
			var_30_20:setPercentage(0)
			var_30_20:setPosition(ccp(var_30_19:getContentSize().width / 2, var_30_19:getContentSize().height / 2))
			var_30_19:addChild(var_30_20)

			local var_30_21 = CCSprite:create("res/ui/resourceArea2/resou_gra_cz_g.png")

			var_30_21:setPosition(ccp(var_30_19:getContentSize().width / 2, var_30_19:getContentSize().height / 2))
			var_30_21:setScale(0.8)
			var_30_19:addChild(var_30_21)

			local var_30_22 = CCSprite:create("res/ui/resourceArea2/zcgz_zyq.png")

			var_30_22:setPosition(ccp(var_30_19:getContentSize().width / 2, -10))

			local var_30_23

			if iter_30_1.canChanged then
				var_30_23 = CCLabelTTF:create(language.get(490945), "Thonburi", 20)

				var_30_23:setColor(colorTips.green)
			else
				var_30_23 = CCLabelTTF:create(language.get(490903, iter_30_1.needSlaveNum), "Thonburi", 20 + (var_0_0.slaveNumFntSize or 0))

				if var_0_2.slaveNum >= iter_30_1.needSlaveNum then
					var_30_23:setColor(colorTips.green)
				else
					var_30_23:setColor(colorTips.red)
				end
			end

			var_30_23:setPosition(ccp(var_30_22:getContentSize().width / 2, var_30_22:getContentSize().height / 2))
			var_30_22:addChild(var_30_23)
			var_30_19:addChild(var_30_22)
			var_30_19:addHandleOfControlEvent(function(...)
				if iter_30_1.canChanged then
					cmgr.sendRequest(function(arg_32_0)
						if arg_32_0.action.data.slaveNum then
							resourceAreaUI.uiTable.slaveNum:setString(language.get(490903, arg_32_0.action.data.slaveNum))
						end

						var_30_21:runAction(CCRepeatForever:create(CCSequence:createWithTwoActions(CCRotateTo:create(0.1, 10), CCRotateTo:create(0.1, -10))))
						var_30_20:runAction(CCSequence:createWithTwoActions(CCProgressTo:create(1, 100), CCCallFuncN:create(function(...)
							var_0_2.getBuildingInfo()

							if arg_32_0.action.data.reformAll == 1 then
								if var_0_3.RESOURCE_AREA_TYPE == 1 then
									roleDialogue.control.loadSpeak(1919)
								elseif var_0_3.RESOURCE_AREA_TYPE == 2 then
									roleDialogue.control.loadSpeak(1920)
								elseif var_0_3.RESOURCE_AREA_TYPE == 3 then
									roleDialogue.control.loadSpeak(1921)
								elseif var_0_3.RESOURCE_AREA_TYPE == 4 then
									roleDialogue.control.loadSpeak(1922)
								elseif var_0_3.RESOURCE_AREA_TYPE == 5 then
									roleDialogue.control.loadSpeak(1923)
								elseif var_0_3.RESOURCE_AREA_TYPE == 6 then
									-- block empty
								end
							end
						end)))
					end, actions.changeBuilding, iter_30_1.id)
				else
					cmgr.sendRequest(function(arg_34_0)
						if arg_34_0.action.data.slaveNum then
							resourceAreaUI.uiTable.slaveNum:setString(language.get(490903, arg_34_0.action.data.slaveNum))
						end

						var_30_21:runAction(CCRepeatForever:create(CCSequence:createWithTwoActions(CCRotateTo:create(0.1, 10), CCRotateTo:create(0.1, -10))))
						var_30_20:runAction(CCSequence:createWithTwoActions(CCProgressTo:create(1, 100), CCCallFuncN:create(function(...)
							var_0_2.getBuildingInfo()

							if arg_34_0.action.data.reformAll == 1 then
								if var_0_3.RESOURCE_AREA_TYPE == 1 then
									roleDialogue.control.loadSpeak(1919)
								elseif var_0_3.RESOURCE_AREA_TYPE == 2 then
									roleDialogue.control.loadSpeak(1920)
								elseif var_0_3.RESOURCE_AREA_TYPE == 3 then
									roleDialogue.control.loadSpeak(1921)
								elseif var_0_3.RESOURCE_AREA_TYPE == 4 then
									roleDialogue.control.loadSpeak(1922)
								elseif var_0_3.RESOURCE_AREA_TYPE == 5 then
									roleDialogue.control.loadSpeak(1923)
								elseif var_0_3.RESOURCE_AREA_TYPE == 6 then
									-- block empty
								end
							end
						end)))
					end, actions.reformBuilding, iter_30_1.id)
				end
			end, CCControlEventTouchUpInside)
			var_30_19:setPosition(ccp(var_30_14:getPositionX(), var_30_14:getPositionY()))
			var_30_0:addChild(var_30_19, 103)

			var_0_2.needRefreshObject[#var_0_2.needRefreshObject + 1] = var_30_19
		end

		if iter_30_1.harvest == 1 then
			local var_30_24 = CCScale9Sprite:create("res/ui/resourceArea2/zcgz_zyq_qs.png")
			local var_30_25 = CCControlButton:create(var_30_24)

			var_30_25:setAdjustBackgroundImage(false)
			var_30_25:setZoomOnTouchDown(false)
			var_30_25:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/resourceArea2/zcgz_zyq_qs_c.png"), CCControlStateHighlighted)
			var_30_25:addHandleOfControlEvent(function(...)
				cmgr.sendRequest(function(arg_37_0)
					var_0_2.getBuildingInfo()

					if arg_37_0.action.data.food then
						globalAction_gotResource({
							{
								id = 3,
								value = arg_37_0.action.data.food
							}
						})
					end
				end, actions.foodHarvest, iter_30_1.id)
			end, CCControlEventTouchUpInside)
			var_30_25:setPosition(ccp(var_30_14:getPositionX(), var_30_14:getPositionY()))
			var_30_0:addChild(var_30_25, 103)

			var_0_2.needRefreshObject[#var_0_2.needRefreshObject + 1] = var_30_25
		end

		if iter_30_1.lumberYardReform and iter_30_1.lumberYardReform.hasReward then
			local var_30_26 = CCScale9Sprite:create("res/ui/resourceArea2/wood_gaizao/mcgz_btn_gjcl.png")
			local var_30_27 = CCControlButton:create(var_30_26)

			var_30_27:setAdjustBackgroundImage(false)
			var_30_27:setZoomOnTouchDown(false)
			var_30_27:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/resourceArea2/wood_gaizao/mcgz_btn_gjcl_c.png"), CCControlStateHighlighted)
			var_30_27:addHandleOfControlEvent(function(...)
				cmgr.sendRequest(function(arg_39_0)
					var_0_2.getBuildingInfo()

					if arg_39_0.action.data.first == 1 then
						roleDialogue.control.loadSpeak(2200)
						roleDialogue.control.loadSpeak(2210)
						roleDialogue.control.loadSpeak(2220)
					end

					if arg_39_0.action.data.rewards then
						globalAction_gotResource({
							{
								id = 55,
								value = arg_39_0.action.data.rewards[1].value
							}
						})
					end

					resourceAreaUI.showLuomuReward(var_30_14, iter_30_1)
				end, actions.receiveReformRewards, iter_30_1.id)
			end, CCControlEventTouchUpInside)
			var_30_27:setPosition(ccp(var_30_14:getPositionX(), var_30_14:getPositionY()))
			var_30_0:addChild(var_30_27, 103)

			var_0_2.needRefreshObject[#var_0_2.needRefreshObject + 1] = var_30_27
		end

		if iter_30_1.farmReform and iter_30_1.farmReform.hasReward then
			local var_30_28 = CCScale9Sprite:create("res/ui/resourceArea2/food_gaizao/ntgz_icon_gjcl.png")
			local var_30_29 = CCControlButton:create(var_30_28)

			var_30_29:setAdjustBackgroundImage(false)
			var_30_29:setZoomOnTouchDown(false)
			var_30_29:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/resourceArea2/food_gaizao/ntgz_icon_gjcl_c.png"), CCControlStateHighlighted)
			var_30_29:addHandleOfControlEvent(function(...)
				cmgr.sendRequest(function(arg_41_0)
					var_0_2.getBuildingInfo()

					if arg_41_0.action.data.first == 1 then
						roleDialogue.control.loadSpeak(2410)
						roleDialogue.control.loadSpeak(2420)
					end

					if arg_41_0.action.data.rewards then
						globalAction_gotResource({
							{
								id = 3,
								value = arg_41_0.action.data.rewards[1].value
							}
						})
					end

					resourceAreaUI.showLuomuReward(var_30_14, iter_30_1)
				end, actions.receiveFRRewards, iter_30_1.id)
			end, CCControlEventTouchUpInside)
			var_30_29:setPosition(ccp(var_30_14:getPositionX(), var_30_14:getPositionY()))
			var_30_0:addChild(var_30_29, 103)

			var_0_2.needRefreshObject[#var_0_2.needRefreshObject + 1] = var_30_29
		end

		if iter_30_1.mohistBuilding and iter_30_1.mohistBuilding.haveReward then
			local var_30_30 = CCScale9Sprite:create("res/ui/resourceArea2/mojia_gaizao/zcgz2_btn_" .. iter_30_1.mohistBuilding.rewardType .. ".png")
			local var_30_31 = CCControlButton:create(var_30_30)

			var_30_31:setAdjustBackgroundImage(false)
			var_30_31:setZoomOnTouchDown(false)
			var_30_31:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/resourceArea2/mojia_gaizao/zcgz2_btn_" .. iter_30_1.mohistBuilding.rewardType .. "_c.png"), CCControlStateHighlighted)
			var_30_31:addHandleOfControlEvent(function(...)
				cmgr.sendRequest(function(arg_43_0)
					var_0_2.getBuildingInfo()

					local var_43_0 = arg_43_0.action.data

					if var_43_0.rewards then
						local var_43_1 = var_43_0.rewards
						local var_43_2 = {}

						for iter_43_0 = 1, #var_43_1 do
							local var_43_3 = var_43_1[iter_43_0]
							local var_43_4 = {
								id = var_0_1[var_43_3.type],
								value = var_43_3.num
							}

							table.insert(var_43_2, var_43_4)
						end

						globalAction_gotResource(var_43_2)
					end
				end, actions.mohistRecvStarReward, iter_30_1.id)
			end, CCControlEventTouchUpInside)
			var_30_31:setPosition(ccp(var_30_14:getPositionX(), var_30_14:getPositionY()))
			var_30_0:addChild(var_30_31, 103)

			var_0_2.needRefreshObject[#var_0_2.needRefreshObject + 1] = var_30_31
		end

		if iter_30_1.resType == 1 or channelMgr.currentChannel == channels.wp8WPStore then
			if iter_30_1.upgradeEnable then
				var_30_17 = CCSprite:create("res/ui/resourceArea2/resou_tit_grade_bg.png")

				if iter_30_1.status == 1 then
					var_30_17 = CCSprite:create("res/ui/resourceArea2/zcgz_area_digit_bg.png")
				end
			else
				var_30_17 = CCSprite:create("res/ui/resourceArea2/resou_tit_grade_full.png")

				if iter_30_1.status == 1 then
					var_30_17 = CCSprite:create("res/ui/resourceArea2/zcgz_area_digit_bg.png")
				end
			end
		elseif iter_30_1.resType == 2 then
			if iter_30_1.upgradeEnable then
				var_30_17 = CCSprite:create("res/ui/resourceArea2/resou_tit_bg.png")

				if iter_30_1.status == 1 then
					var_30_17 = CCSprite:create("res/ui/resourceArea2/zcgz_area_digit_bg1.png")
				end
			else
				var_30_17 = CCSprite:create("res/ui/resourceArea2/resou_tit_full.png")

				if iter_30_1.status == 1 then
					var_30_17 = CCSprite:create("res/ui/resourceArea2/zcgz_area_digit_bg1.png")
				end
			end
		end

		if iter_30_1.lumberYardReform and iter_30_1.lumberYardReform.alreadyReform == 1 then
			var_30_8 = var_30_8 + 1
			var_30_17 = CCSprite:create("res/ui/resourceArea2/wood_gaizao/mcgz_zyq_lv_bg.png")

			if iter_30_1.resType == 2 and iter_30_1.status == 1 then
				var_30_17 = CCSprite:create("res/ui/resourceArea2/wood_gaizao/mcgz_zyq_lv_bg2.png")
			end
		end

		if iter_30_1.lumberYardReformPlus and iter_30_1.lumberYardReformPlus.canReform then
			if iter_30_1.lumberYardReformPlus.star > 0 then
				var_30_9 = var_30_9 + 1
			end

			local var_30_32 = CCSprite:create("res/ui/resourceArea2/wood_gaizao2/mczgz_star_bg.png")

			for iter_30_2 = 1, 3 do
				local var_30_33

				if iter_30_2 > iter_30_1.lumberYardReformPlus.star then
					var_30_33 = CCSprite:create("res/ui/resourceArea2/wood_gaizao2/mczgz_star_g.png")
				else
					var_30_33 = CCSprite:create("res/ui/resourceArea2/wood_gaizao2/mczgz_star.png")
				end

				var_30_32:addChild(var_30_33)
				var_30_33:setPosition(ccp(22.5 * iter_30_2, 14))
			end

			var_30_17:addChild(var_30_32)
			var_30_32:setPosition(ccp(48, 43))
		end

		if iter_30_1.farmReform and iter_30_1.farmReform.alreadyReform == 1 then
			var_30_10 = var_30_10 + 1
			var_30_17 = CCSprite:create("res/ui/resourceArea2/wood_gaizao/mcgz_zyq_lv_bg.png")

			if iter_30_1.resType == 2 and iter_30_1.status == 1 then
				var_30_17 = CCSprite:create("res/ui/resourceArea2/wood_gaizao/mcgz_zyq_lv_bg2.png")
			end
		end

		if iter_30_1.mohistBuilding then
			if iter_30_1.mohistBuilding.star > 0 then
				var_30_11 = var_30_11 + 1
			end

			local var_30_34 = CCSprite:create("res/ui/resourceArea2/wood_gaizao2/mczgz_star_bg.png")

			for iter_30_3 = 1, 3 do
				local var_30_35

				if iter_30_3 > iter_30_1.mohistBuilding.star then
					var_30_35 = CCSprite:create("res/ui/resourceArea2/wood_gaizao2/mczgz_star_g.png")
				else
					var_30_35 = CCSprite:create("res/ui/resourceArea2/wood_gaizao2/mczgz_star.png")
				end

				var_30_34:addChild(var_30_35)
				var_30_35:setPosition(ccp(22.5 * iter_30_3, 14))
			end

			var_30_17:addChild(var_30_34)
			var_30_34:setPosition(ccp(48, 43))
		end

		var_30_17:setPosition(ccp(var_30_15 * 0.5, var_30_16 * 0.2))
		var_30_14:addChild(var_30_17, 2, var_0_3.BUILDING_LV_TAG)

		local var_30_36 = var_30_17:getContentSize().width
		local var_30_37 = var_30_17:getContentSize().height
		local var_30_38 = CCLabelTTF:create(tostring(iter_30_1.lv), "Thonburi", 14)

		if iter_30_1.outputSilk and iter_30_1.outputSilk > 0 then
			var_30_38 = CCStrokeLabelTTF:create(tostring(iter_30_1.lv), "Thonburi", 16, 1, ccc3(0, 0, 0))

			var_30_38:setColor(ccc3(255, 0, 255))
		elseif iter_30_1.lv == user.player.playerLv then
			var_30_38:setColor(ccc3(255, 255, 255))
		else
			var_30_38:setColor(ccc3(0, 0, 0))
		end

		if iter_30_1.lumberYardReform and iter_30_1.lumberYardReform.alreadyReform == 1 then
			if iter_30_1.outputSilk and iter_30_1.outputSilk > 0 then
				var_30_38 = CCStrokeLabelTTF:create("MAX", "Thonburi", 16, 1, ccc3(0, 0, 0))

				var_30_38:setColor(ccc3(255, 0, 255))
			else
				var_30_38 = CCLabelTTF:create("MAX", "Thonburi", 14)

				var_30_38:setColor(ccc3(0, 0, 0))
			end
		end

		if iter_30_1.mohistBuilding then
			var_30_38 = CCLabelTTF:create("MAX", "Thonburi", 14)

			var_30_38:setColor(ccc3(0, 0, 0))
		end

		if iter_30_1.hasEvent and var_0_2.upgradingBuildingTable.upgradingBuildingId and not var_0_2.upgradingBuildingTable.upgradingBuildingId[iter_30_1.id] then
			-- block empty
		end

		if var_0_2.buildingTable[iter_30_0].isNew == true then
			var_0_2.buildingTable[iter_30_0].isNew = false

			resourceAreaUI.playerJinguangAnim(var_30_14, 35)
		end

		if iter_30_1.resType == 1 or channelMgr.currentChannel == channels.wp8WPStore then
			var_30_38:setPosition(ccp(var_30_36 * 0.5, var_30_37 * 0.5))
		elseif iter_30_1.resType == 2 then
			var_30_38:setPosition(ccp(var_30_36 * 0.2, var_30_37 * 0.5))
		end

		var_30_17:addChild(var_30_38)

		if iter_30_1.resType == 2 then
			local var_30_39 = iter_30_1.name
			local var_30_40 = CCLabelTTF:create(var_30_39, "Thonburi", 14)

			var_30_40:setPosition(ccp(var_30_36 * 0.7, var_30_37 * 0.5))
			var_30_17:addChild(var_30_40)
		end

		local var_30_41 = iter_30_1.id

		if var_0_2.upgradingBuildingTable.upgradingBuildingId and var_0_2.upgradingBuildingTable.upgradingBuildingId[var_30_41] then
			if var_0_2.upgradingBuildingTable.upgradingBuildingId[var_30_41].cd then
				local var_30_42 = tolua.cast(var_30_0:getChildByTag(iter_30_1.id + var_0_3.FIELD_TAG), "CCSprite")
				local var_30_43 = var_0_2.upgradingBuildingTable.upgradingBuildingId[var_30_41].cd / 1000
				local var_30_44 = string.format("%.f", var_30_43 + 0.5)
				local var_30_45 = os.date("%M:%S", var_30_44)

				if tonumber(var_30_44) >= 3600 then
					local var_30_46 = math.floor(tonumber(var_30_44) / 3600)

					var_30_45 = string.format("%02d:%s", var_30_46, var_30_45)
				end

				local var_30_47 = CCLabelTTF:create(var_30_45, "Thonburi", 20)
				local var_30_48 = ccp(var_30_13.x, var_30_13.y)

				var_30_47:setPosition(ccp(var_30_48.x, var_30_48.y - 50))
				var_30_0:addChild(var_30_47, 105, var_0_3.UPGRADETIMELABEL_TAG)

				var_0_2.needRefreshObject[#var_0_2.needRefreshObject + 1] = var_30_47

				local var_30_49 = table.getn(var_0_2.upgradeCdTable)

				var_0_2.upgradeCdTable[var_30_49 + 1] = {}
				var_0_2.upgradeCdTable[var_30_49 + 1].value = var_30_44
				var_0_2.upgradeCdTable[var_30_49 + 1].tag = var_0_3.UPGRADETIMELABEL_TAG
				var_0_2.upgradeCdTable[var_30_49 + 1].buildingId = var_30_41

				local var_30_50 = var_0_2.getWorkId(1, var_30_41)

				log.debug("getworkId2: ", var_30_50)

				var_0_2.upgradeCdTable[var_30_49 + 1].workId = var_30_50
				var_0_3.UPGRADETIMELABEL_TAG = var_0_3.UPGRADETIMELABEL_TAG + 1

				resourceAreaUI.playerBuildingAnim(var_30_14, 32)
			end

			log.debug("k s3: ", var_0_2.upgradingBuildingTable.upgradingBuildingId[var_30_41].speedUpNum)

			if var_0_2.upgradingBuildingTable.upgradingBuildingId[var_30_41].speedUpNum == 1 then
				local var_30_51 = CCSprite:create("res/ui/resourceArea2/btn_buil_rise_big_bg.png")
				local var_30_52 = CCSprite:create("res/ui/resourceArea2/btn_buil_rise_big.png")

				var_30_52:setPosition(ccp(var_30_51:getContentSize().width / 2, var_30_51:getContentSize().height / 2))
				var_30_51:addChild(var_30_52)

				local var_30_53 = CCSprite:create("res/ui/resourceArea2/btn_buil_rise_big_bg.png")
				local var_30_54 = CCSprite:create("res/ui/resourceArea2/btn_buil_rise_big_lig.png")

				var_30_54:setPosition(ccp(var_30_53:getContentSize().width / 2, var_30_53:getContentSize().height / 2))

				local var_30_55 = CCSprite:create("res/ui/resourceArea2/btn_buil_rise_big.png")

				var_30_55:setPosition(ccp(var_30_53:getContentSize().width / 2, var_30_53:getContentSize().height / 2))
				var_30_53:addChild(var_30_54)
				var_30_53:addChild(var_30_55)

				local var_30_56 = CCMenuItemSprite:create(var_30_51, var_30_53)

				var_30_56:setTag(var_0_3.JIASU_TAG + iter_30_1.id)
				var_30_56:registerScriptTapHandler(var_0_2.jiasuSelected)

				local var_30_57 = CCMenu:createWithItem(var_30_56)

				var_30_57:setPosition(ccp(var_30_14:getPositionX(), var_30_14:getPositionY() + 20))
				var_30_0:addChild(var_30_57, 102, iter_30_1.id + var_0_3.JIASU_TAG + var_0_3.JIASUMENU_PLUS_TAG)

				var_0_2.needRefreshObject[#var_0_2.needRefreshObject + 1] = var_30_57
			end
		end

		local var_30_58 = 0

		if iter_30_1.lumberYardReform and iter_30_1.lumberYardReform.reformCD then
			var_30_8 = var_30_8 + 1
			var_30_58 = iter_30_1.lumberYardReform.reformCD
		end

		if iter_30_1.lumberYardReformPlus and iter_30_1.lumberYardReformPlus.reformCD then
			var_30_9 = var_30_9 + 1
			var_30_58 = iter_30_1.lumberYardReformPlus.reformCD
		end

		if iter_30_1.farmReform and iter_30_1.farmReform.reformCD then
			var_30_10 = var_30_10 + 1
			var_30_58 = iter_30_1.farmReform.reformCD
		end

		if iter_30_1.mohistBuilding and iter_30_1.mohistBuilding.reformCD then
			var_30_11 = var_30_11 + 1
			var_30_58 = iter_30_1.mohistBuilding.reformCD
		end

		if var_30_58 > 0 then
			local var_30_59 = tolua.cast(var_30_0:getChildByTag(iter_30_1.id + var_0_3.FIELD_TAG), "CCSprite")
			local var_30_60 = var_30_58 / 1000
			local var_30_61 = string.format("%.f", var_30_60 + 0.5)
			local var_30_62 = os.date("%M:%S", var_30_61)

			if tonumber(var_30_61) >= 3600 then
				local var_30_63 = math.floor(tonumber(var_30_61) / 3600)

				var_30_62 = string.format("%02d:%s", var_30_63, var_30_62)
			end

			local var_30_64 = CCLabelTTF:create(var_30_62, "Thonburi", 20)
			local var_30_65 = ccp(var_30_13.x, var_30_13.y)

			var_30_64:setPosition(ccp(var_30_65.x, var_30_65.y - 50))
			var_30_0:addChild(var_30_64, 105, var_0_3.UPGRADETIMELABEL_TAG)

			var_0_2.needRefreshObject[#var_0_2.needRefreshObject + 1] = var_30_64

			local var_30_66 = table.getn(var_0_2.upgradeCdTable)

			var_0_2.upgradeCdTable[var_30_66 + 1] = {}
			var_0_2.upgradeCdTable[var_30_66 + 1].value = var_30_61
			var_0_2.upgradeCdTable[var_30_66 + 1].tag = var_0_3.UPGRADETIMELABEL_TAG
			var_0_2.upgradeCdTable[var_30_66 + 1].buildingId = var_30_41
			var_0_3.UPGRADETIMELABEL_TAG = var_0_3.UPGRADETIMELABEL_TAG + 1

			resourceAreaUI.playerBuildingAnim(var_30_14, 32)
		end

		var_30_14:setVisible(true)
	end

	if var_0_2.lumberYardReform and var_0_2.lumberYardReform.inReform and var_30_8 == 0 then
		log.info("螺母后裔：一个都没有改造过")
		roleDialogue.control.loadSpeak(2190)

		if var_0_2.lumberYardReform.drawingNum == 0 then
			local function var_30_67(arg_44_0)
				var_0_2.getBuildingInfo()
			end

			cmgr.sendRequest(var_30_67, actions.reformPrepare)
		end
	end

	if var_0_2.lumberYardReformPlus and var_0_2.lumberYardReformPlus.inReform and var_30_9 == 0 then
		log.info("周公改造：一个都没有改造过")
		roleDialogue.control.loadSpeak(2260)

		if var_0_2.lumberYardReformPlus.drawingNumPlus == 0 then
			local function var_30_68(arg_45_0)
				var_0_2.getBuildingInfo()
			end

			cmgr.sendRequest(var_30_68, actions.reformPlusPrepare)
		end
	end

	if var_0_2.farmReform and var_0_2.farmReform.inReform and var_30_10 == 0 then
		log.info("马钧农田改造：一个都没有改造过")
		roleDialogue.control.loadSpeak(2400)

		if var_0_2.farmReform.drawingNum == 0 then
			local function var_30_69(arg_46_0)
				var_0_2.getBuildingInfo()
			end

			cmgr.sendRequest(var_30_69, actions.reformFarmPrepare)
		end
	end

	for iter_30_4, iter_30_5 in pairs(var_0_2.buildingDeveloperTable) do
		local var_30_70 = "building_" .. var_0_3.RESOURCE_AREA_TYPE .. "_" .. iter_30_5.pos
		local var_30_71 = getResourceUiData()[var_30_70]

		var_30_71.tag = var_0_3.FIELD_TAG + iter_30_5.id

		if iter_30_5.type == 1 and iter_30_5.copper ~= nil and iter_30_5.copper > 0 then
			autoUI.createUI(var_30_0, var_30_71, var_0_2.needRefreshObject)

			local var_30_72 = var_0_2.needRefreshObject[var_30_70]
			local var_30_73 = CCArray:create()

			for iter_30_6 = 1, 19 do
				local var_30_74 = CCSprite:create("res/ui/resourceArea2/develop/" .. string.format("develop%04d.png", iter_30_6))

				var_30_73:addObject(var_30_74:displayFrame())
			end

			local var_30_75 = CCAnimation:createWithSpriteFrames(var_30_73, 0.1)
			local var_30_76 = CCAnimate:create(var_30_75)
			local var_30_77 = CCArray:create()

			var_30_77:addObject(var_30_76)

			local var_30_78 = CCSequence:create(var_30_77)
			local var_30_79 = CCRepeatForever:create(tolua.cast(var_30_78, "CCActionInterval"))

			var_30_72:runAction(var_30_79)
		elseif iter_30_5.type == 2 then
			autoUI.createUI(var_30_0, var_30_71, var_0_2.needRefreshObject)

			local var_30_80 = var_0_2.needRefreshObject[var_30_70]
			local var_30_81 = CCSprite:create("res/ui/resourceArea2/tuzhi.png")

			var_30_80:setDisplayFrame(var_30_81:displayFrame())
		elseif iter_30_5.type == 3 then
			autoUI.createUI(var_30_0, var_30_71, var_0_2.needRefreshObject)

			local var_30_82 = var_0_2.needRefreshObject[var_30_70]
			local var_30_83 = CCArray:create()

			for iter_30_7 = 1, 19 do
				local var_30_84 = CCSprite:create("res/ui/resourceArea2/develop_draw/" .. string.format("develop_draw%04d.png", iter_30_7))

				var_30_83:addObject(var_30_84:displayFrame())
			end

			local var_30_85 = CCAnimation:createWithSpriteFrames(var_30_83, 0.1)
			local var_30_86 = CCAnimate:create(var_30_85)
			local var_30_87 = CCArray:create()

			var_30_87:addObject(var_30_86)

			local var_30_88 = CCSequence:create(var_30_87)
			local var_30_89 = CCRepeatForever:create(tolua.cast(var_30_88, "CCActionInterval"))

			var_30_82:runAction(var_30_89)
		elseif iter_30_5.type == 4 then
			autoUI.createUI(var_30_0, var_30_71, var_0_2.needRefreshObject)

			local var_30_90 = var_0_2.needRefreshObject[var_30_70]

			resourceAreaUI.playerBuildingAnim(var_30_90, 32)

			local var_30_91 = CCSprite:create("res/ui/resourceArea2/btn_buil_rise_big_bg.png")
			local var_30_92 = CCSprite:create("res/ui/resourceArea2/btn_buil_rise_big.png")

			var_30_92:setPosition(ccp(var_30_91:getContentSize().width / 2, var_30_91:getContentSize().height / 2))
			var_30_91:addChild(var_30_92)

			local var_30_93 = CCSprite:create("res/ui/resourceArea2/btn_buil_rise_big_bg.png")
			local var_30_94 = CCSprite:create("res/ui/resourceArea2/btn_buil_rise_big_lig.png")

			var_30_94:setPosition(ccp(var_30_93:getContentSize().width / 2, var_30_93:getContentSize().height / 2))

			local var_30_95 = CCSprite:create("res/ui/resourceArea2/btn_buil_rise_big.png")

			var_30_95:setPosition(ccp(var_30_93:getContentSize().width / 2, var_30_93:getContentSize().height / 2))
			var_30_93:addChild(var_30_94)
			var_30_93:addChild(var_30_95)

			local var_30_96 = CCMenuItemSprite:create(var_30_91, var_30_93)

			var_30_96:setTag(var_0_3.JIASU_TAG + iter_30_5.id)
			var_30_96:registerScriptTapHandler(var_0_2.jiasuBuildingSelected)

			local var_30_97 = CCMenu:createWithItem(var_30_96)

			var_30_97:setPosition(ccp(var_30_90:getPositionX(), var_30_90:getPositionY() + 20))

			local var_30_98 = smgr.getLayer("resourceAreaLayer")

			var_30_98:addChild(var_30_97, 102, iter_30_5.id + var_0_3.JIASU_TAG + var_0_3.JIASUMENU_PLUS_TAG)

			local function var_30_99()
				var_30_98:removeChild(timerLayer, true)
				var_0_2.getBuildingInfo()
			end

			local var_30_100 = math.floor(iter_30_5.cd)
			local var_30_101

			if var_30_100 > 3600000 then
				var_30_101 = createTimerLabel(var_30_100, "@H:@M:@S", "", 20, var_30_99)
			else
				var_30_101 = createTimerLabel(var_30_100, "@M:@S", "", 20, var_30_99)
			end

			var_30_101:setPosition(ccp(var_30_90:getPositionX(), var_30_90:getPositionY() - 30))
			var_30_98:addChild(var_30_101, 10000, var_0_3.BUILDING_DEVELOPER_TAG_1 + iter_30_5.id)

			local var_30_102 = 100 * iter_30_5.cd / iter_30_5.totalCd
		end
	end

	resourceAreaUI.updateConstruction()
	resourceAreaUI.updateFuncionItem()

	if var_0_2.forceExpandTaskBoard then
		eventManager.dispatchEvent("forceExpandTaskBoard", true)

		var_0_2.forceExpandTaskBoard = false
	end

	resourceAreaUI.uiTable.autoUpgradeMenu:setVisible(true)
	resourceAreaUI.uiTable.goldHammerMenu:setVisible(true)
end

function resourceAreaUI.addTips(arg_48_0)
	log.info("should show tips ")

	local var_48_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_48_0:registerScriptTouchHandler(function(arg_49_0, arg_49_1, arg_49_2)
		if arg_49_0 == CCTOUCHBEGAN then
			return true
		elseif arg_49_0 == CCTOUCHMOVED then
			return true
		elseif arg_49_0 == CCTOUCHENDED then
			pcall(var_48_0.removeFromParentAndCleanup, var_48_0, true)

			return true
		end
	end, false, true)
	var_48_0:setTouchEnabled(true)
	smgr.getLayer("resourceAreaLayer"):addChild(var_48_0, 60000)

	local var_48_1 = 0
	local var_48_2 = 0
	local var_48_3 = 490909 + (var_0_3.RESOURCE_AREA_TYPE - 1) * 2
	local var_48_4 = 490910 + (var_0_3.RESOURCE_AREA_TYPE - 1) * 2
	local var_48_5 = ""

	if arg_48_0 then
		if arg_48_0 == "zhifang" then
			var_48_3 = "223320_luomu"
			var_48_4 = "223321_luomu"
		elseif arg_48_0 == "qingche" then
			var_48_3 = "223508_zhougong"
			var_48_4 = "223509_zhougong"

			if var_0_2.lumberYardReformPlus.silkReducePercent then
				var_48_5 = tostring(var_0_2.lumberYardReformPlus.silkReducePercent * 100)
			end

			if var_0_2.lumberYardReformPlus.allOver == 1 then
				var_48_5 = 20
			end
		elseif arg_48_0 == "fengshou" then
			var_48_3 = "224410_majun"
			var_48_4 = "224411_majun"
		end
	end

	local var_48_6 = {
		name = "tipFrame",
		type = "sprite9",
		visible = true,
		pic = {
			frame = true,
			path = "common_tip_frame_small.png"
		},
		anchorPoint = ccp(1, 1),
		middleRect = CCRectMake(24, 24, 1, 1),
		preferedSize = CCSizeMake(160, 140),
		children = {
			{
				fontSize = 20,
				height = 0,
				name = "tipTitle",
				type = "label",
				style = "label_warlock",
				width = 260,
				anchorPoint = ccp(0, 0),
				halign = kCCTextAlignmentLeft,
				color = colorQuality[6],
				text = language.get(var_48_3)
			},
			{
				fontSize = 20,
				height = 0,
				name = "tipMsg",
				type = "label",
				style = "label_warlock",
				width = 260,
				anchorPoint = ccp(0, 0),
				halign = kCCTextAlignmentLeft,
				color = color_whi,
				text = language.get(var_48_4, var_48_5)
			}
		}
	}
	local var_48_7 = {}

	uiutil.initWidgets(var_48_7, var_48_6)
	var_48_0:addChild(var_48_7.widgets.tipFrame)

	local var_48_8, var_48_9 = tool.getPositionInScreen(resourceAreaUI.uiTable.btnRemouldFunc)
	local var_48_10 = var_48_8 + 20
	local var_48_11 = var_48_9 - 20
	local var_48_12 = var_48_7.widgets.tipMsg:getContentSize().width
	local var_48_13 = var_48_7.widgets.tipMsg:getContentSize().height + var_48_7.widgets.tipTitle:getContentSize().height

	var_48_7.widgets.tipFrame:setPreferredSize(CCSizeMake(var_48_12 + 30, var_48_13 + 30))
	var_48_7.widgets.tipFrame:setPosition(ccp(var_48_10, var_48_11))
	var_48_7.widgets.tipMsg:setPosition(ccp(15, 15))
	var_48_7.widgets.tipTitle:setPosition(ccp(15, 15 + var_48_7.widgets.tipMsg:getContentSize().height))
	var_48_7.widgets.tipFrame:setVisible(true)
end

function resourceAreaUI.show(arg_50_0)
	rmgr.loadResource("res/anim/resourceAnim/buildingManAnim.plist")
	rmgr.loadResource("res/anim/resourceAnim/jinguangAnim.plist")
	rmgr.loadResource("res/anim/resourceAnim/resoLight.plist")
	rmgr.loadResource("res/anim/resourceAnim/itemLight.plist")
	rmgr.loadResource("res/ui/resourceArea2/buildingAreaBingtie.plist")
	rmgr.loadResource("res/ui/resourceArea2/buildingAreaBingyin.plist")
	rmgr.loadResource("res/ui/resourceArea2/buildingAreaLiangshi.plist")
	rmgr.loadResource("res/ui/resourceArea2/buildingAreaMingju.plist")
	rmgr.loadResource("res/ui/resourceArea2/buildingAreaMuchang.plist")
	rmgr.loadResource("res/ui/resourceArea2/resourceAcceModel.plist")

	var_0_3.RESOURCE_AREA_TYPE = arg_50_0

	CCTextureCache:sharedTextureCache():removeUnusedTextures()

	local var_50_0 = createBaseLayer()

	smgr.registerLayer(var_50_0, "resourceAreaLayer")
	resourceAreaUI.initBatchNode()
	resourceAreaUI.initBasicUI()
	var_50_0:setTouchEnabled(true)
	var_50_0:registerScriptTouchHandler(var_0_2.onTouch)

	var_50_0.onEnter = var_0_2.onEnter
	var_50_0.onExit = var_0_2.onExit

	var_0_2.getBuildingInfo()
	require("lua/guide/control")

	guide.uiElementsTable[1001] = resourceAreaUI.uiTable.autoUpgradeItem
	guide.uiElementsTable[1022] = resourceAreaUI.uiTable.goldHammerItem

	return var_50_0
end

return resourceAreaUI
