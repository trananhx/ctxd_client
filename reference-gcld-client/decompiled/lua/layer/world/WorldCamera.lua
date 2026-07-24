local var_0_0 = {}

var_0_0.EDGE = 500
var_0_0.IS_INCISION = false
var_0_0.touchPoint = nil
var_0_0.visibleRect = nil
var_0_0.cityTable = {}
var_0_0.surroundTable = {}
var_0_0.worldFireTable = {}
var_0_0.cityWindowTable = {}
var_0_0.boxTable = {}
var_0_0.chainTable = {}
var_0_0.lockCityTable = {}
var_0_0.lockCityData = require("lua/layer/world/lockCity/lockCity")
var_0_0.worldBuildData = require("lua/layer/world/worldBuild/worldBuild")
var_0_0.canLockCities = {}
var_0_0.markLockCities = {}
var_0_0.lockUI = {}
var_0_0.lockCityEffect = {}
var_0_0.animEffect = {}
var_0_0.huizhanUI = nil
var_0_0.canTouchCity = true
var_0_0.lockCityNum = 2
var_0_0.TEXTURE_TABLE = {
	"res/ui/world/worldBuilding.plist",
	"res/ui/world/specialNpc/specialNpcPic.plist",
	"res/ui/world/worldTower.plist",
	"res/ui/world/thumbnail.plist",
	"res/ui/world/rankHour.plist",
	"res/ui/world/cityWindow.plist",
	"res/ui/world/convene.plist",
	"res/ui/world/generalMove.plist",
	"res/ui/world/generalMove_fast.plist"
}
var_0_0.nodeTable = {}

function var_0_0.addNode(arg_1_0)
	arg_1_0.batch = arg_1_0.batch or false

	if arg_1_0.node then
		arg_1_0.pos = arg_1_0.pos or ccp(arg_1_0.node:getPositionX(), arg_1_0.node:getPositionY())
		arg_1_0.size = arg_1_0.size or CCSizeMake(arg_1_0.node:getContentSize().width, arg_1_0.node:getContentSize().height)

		arg_1_0.node:setPosition(arg_1_0.pos)

		var_0_0.nodeTable[arg_1_0.name] = {
			visible = false,
			node = arg_1_0.node,
			name = arg_1_0.name,
			pos = arg_1_0.pos,
			size = arg_1_0.size
		}

		if var_0_0.IS_INCISION then
			arg_1_0.node:setVisible(false)
		else
			arg_1_0.node:setVisible(true)
		end

		if arg_1_0.batch == true then
			var_0_0.worldBuildingBatchNode:addChild(arg_1_0.node)
		else
			var_0_0.worldLayer:addChild(arg_1_0.node, 0)
		end
	else
		var_0_0.nodeTable[arg_1_0.name] = {
			visible = false,
			name = arg_1_0.name,
			pos = arg_1_0.pos,
			size = arg_1_0.size,
			nodeName = arg_1_0.nodeName
		}

		if var_0_0.IS_INCISION == false then
			if string.find(arg_1_0.nodeName, "frame:") ~= nil then
				arg_1_0.node = CCSprite:createWithSpriteFrameName(string.sub(arg_1_0.nodeName, 7))
			else
				arg_1_0.node = CCSprite:create(arg_1_0.nodeName)
			end

			arg_1_0.node:setPosition(arg_1_0.pos)
			arg_1_0.node:setContentSize(arg_1_0.size)

			if arg_1_0.batch == true then
				var_0_0.worldBuildingBatchNode:addChild(arg_1_0.node)
			else
				var_0_0.worldLayer:addChild(arg_1_0.node)
			end
		end
	end
end

local function var_0_1()
	local var_2_0 = "world_building_"

	for iter_2_0, iter_2_1 in pairs(worldConstant.BUILDING_INFO) do
		local var_2_1 = string.sub(iter_2_0, #var_2_0 + 1, -1)
		local var_2_2 = CCSprite:createWithSpriteFrameName(iter_2_1.model)

		var_0_0.cityTable["world_building_" .. var_2_1] = var_0_0.cityTable["world_building_" .. var_2_1] or {}
		var_0_0.cityTable["world_building_" .. var_2_1].sprite = var_2_2

		local var_2_3 = var_2_2:getContentSize()
		local var_2_4 = iter_2_1.x + var_2_3.width / 2
		local var_2_5 = var_0_0.height - iter_2_1.y - var_2_3.height / 2

		var_2_2:setPosition(ccp(var_2_4, var_2_5))
		var_0_0.worldBuildingBatchNode:addChild(var_2_2, 110)

		local var_2_6 = CCSprite:createWithSpriteFrameName("cc_view_bg.png")

		var_2_6:setPosition(ccp(var_2_4, var_2_5 - 50))
		var_0_0.worldBuildingBatchNode:addChild(var_2_6, 111)

		local var_2_7 = CCSprite:createWithSpriteFrameName("cc_" .. var_2_1 .. ".png")

		var_2_7:setPosition(ccp(var_2_4, var_2_5 - 50))

		if conf.language == "vie" then
			if var_2_7:getContentSize().width >= var_2_6:getContentSize().width then
				var_2_7:setAnchorPoint(ccp(0, 0.5))
				var_2_7:setPosition(ccp(var_2_6:getPositionX() - var_2_6:getContentSize().width / 2, var_2_5 - 50))
			else
				var_2_7:setPosition(ccp(var_2_6:getPositionX(), var_2_5 - 50))
			end
		end

		var_0_0.worldBuildingBatchNode:addChild(var_2_7, 112)
	end

	if user.getFunc(34) then
		var_0_0.mineSprite = CCSprite:create("res/ui/ironMine/build_sjbt.png")

		local var_2_8 = CCSprite:create("res/ui/ironMine/build_sjbt_lig.png")

		var_2_8:setPosition(ccp(69, 59))
		var_0_0.mineSprite:addChild(var_2_8, -1)

		local var_2_9 = CCFadeIn:create(0.5)
		local var_2_10 = var_2_9:reverse()
		local var_2_11 = CCSequence:createWithTwoActions(var_2_9, var_2_10)

		var_2_8:runAction(CCRepeatForever:create(var_2_11))
		log.info("user.player.forceId", user.player.forceId)

		local var_2_12
		local var_2_13
		local var_2_14

		if user.player.forceId == 1 then
			var_2_13, var_2_14 = var_0_0.cityTable.world_building_123.sprite:getPosition()
			var_2_12 = ccp(250, 280)
		elseif user.player.forceId == 2 then
			var_2_13, var_2_14 = var_0_0.cityTable.world_building_19.sprite:getPosition()
			var_2_12 = ccp(220, -230)
		elseif user.player.forceId == 3 then
			var_2_13, var_2_14 = var_0_0.cityTable.world_building_207.sprite:getPosition()
			var_2_12 = ccp(-310, -340)
		end

		var_0_0.mineSprite:setPosition(ccp(var_2_13 + var_2_12.x, var_2_14 + var_2_12.y))
		var_0_0.worldLayer:addChild(var_0_0.mineSprite, 106)
	end
end

function var_0_0.addCity(arg_3_0)
	local var_3_0 = tonumber(arg_3_0[1])
	local var_3_1 = worldConstant.BUILDING_INFO["world_building_" .. arg_3_0[1]]
	local var_3_2 = var_0_0.cityTable["world_building_" .. arg_3_0[1]].sprite:getContentSize()
	local var_3_3 = var_3_1.x + var_3_2.width / 2
	local var_3_4 = var_0_0.height - var_3_1.y - var_3_2.height / 2

	var_0_0.cityTable["world_building_" .. arg_3_0[1]] = var_0_0.cityTable["world_building_" .. arg_3_0[1]] or {}
	var_0_0.cityTable["world_building_" .. arg_3_0[1]].info = var_3_1
	var_0_0.cityTable["world_building_" .. arg_3_0[1]].prop = arg_3_0

	if tonumber(arg_3_0[4]) > 0 or tonumber(arg_3_0[17]) > 0 then
		eventManager.dispatchEvent("setSurround", arg_3_0[1], arg_3_0[4], arg_3_0[17])
	end

	if tonumber(arg_3_0[3]) == 1 then
		eventManager.dispatchEvent("setWorldFire", arg_3_0[1], arg_3_0[3])
	end

	if worldControl.hzLv and worldControl.hzCityId and var_3_0 == worldControl.hzCityId then
		log.info("@@ 会战城市  ", var_3_0)
		eventManager.dispatchEvent("showWorldHuizhanState", var_3_0)
		eventManager.dispatchEvent("showWorldHuizhanForce", var_3_0)
	end

	if worldControl.ysCityId and var_3_0 == worldControl.ysCityId and tonumber(arg_3_0[2]) == 106 then
		require("lua/layer/world/yuanshaoEvent")
		yuanshaoEvent.addYuanshao(var_0_0.yuanshaoNode, var_3_3, var_3_4)
	end

	if worldControl.phase and worldControl.phase == 1 then
		require("lua/layer/world/yuanshaoEvent")

		if tonumber(arg_3_0[2]) == 104 and var_3_0 == worldControl.hjCenterCity then
			yuanshaoEvent.addZhangjiaoZhengxing(var_0_0.yuanshaoNode, var_3_3, var_3_4, var_3_0)
			yuanshaoEvent.zhangjiaoInfo(var_0_0.yuanshaoNode, var_3_3, var_3_4, worldControl.phase, worldControl.hjCountDown, var_3_0)
		end
	elseif worldControl.phase and worldControl.phase == 2 then
		require("lua/layer/world/yuanshaoEvent")

		if tonumber(arg_3_0[2]) == 104 and var_3_0 == worldControl.hjCenterCity then
			yuanshaoEvent.zhangjiaoInfo(var_0_0.yuanshaoNode, var_3_3, var_3_4, worldControl.phase, worldControl.hjCountDown, var_3_0)
		end

		for iter_3_0 = 1, #worldControl.hjRemainCities do
			if tonumber(arg_3_0[2]) == 104 and var_3_0 == worldControl.hjRemainCities[iter_3_0].cityId then
				yuanshaoEvent.addZhangjiaoZhengxing(var_0_0.yuanshaoNode, var_3_3, var_3_4, var_3_0)
			end
		end
	end

	if worldControl.sdManzuAttachedTaskInfo and tonumber(arg_3_0[2]) == 107 then
		eventManager.dispatchEvent("setManzuTaskStone", var_3_0)
	end

	local var_3_5

	if tonumber(arg_3_0[2]) == 1 then
		var_3_5 = "flag_wei.png"
	elseif tonumber(arg_3_0[2]) == 2 then
		var_3_5 = "flag_shu.png"
	elseif tonumber(arg_3_0[2]) == 3 then
		var_3_5 = "flag_wu.png"
	elseif tonumber(arg_3_0[2]) == 106 then
		var_3_5 = "flag_yuan.png"
	elseif tonumber(arg_3_0[2]) == 104 then
		var_3_5 = "flag_yuan.png"
	elseif tonumber(arg_3_0[2]) == 1001 then
		var_3_5 = "flag_yuan.png"
	elseif tonumber(arg_3_0[2]) > 100 then
		var_3_5 = "flag_mz.png"
	end

	if worldControl.top3Nations and worldControl.top3Nations[tonumber(arg_3_0[2])] and worldControl.top3Nations[tonumber(arg_3_0[2])] == 1 then
		var_3_5 = tonumber(arg_3_0[2]) == 1 and "landq.png" or tonumber(arg_3_0[2]) == 2 and "hongdq.png" or "ldq.png"
	end

	local var_3_6

	if var_3_5 then
		var_3_6 = CCSprite:createWithSpriteFrameName(var_3_5)

		var_3_6:setPosition(ccp(var_3_3 - 50, var_3_4 - 50))

		if conf.language == "vie" then
			var_3_6:setPosition(ccp(var_3_3 - 60, var_3_4 - 50))
		end

		var_0_0.worldBuildingBatchNode:addChild(var_3_6, 112)
	end

	var_0_0.cityTable["world_building_" .. arg_3_0[1]].flagSprite = var_3_6

	if tonumber(arg_3_0[15]) == 1 then
		local var_3_7 = CCSprite:createWithSpriteFrameName("worldDaojian.png")

		var_3_7:setPosition(ccp(var_3_3, var_3_4))

		var_0_0.cityTable["world_building_" .. arg_3_0[1]].attackSprite = var_3_7

		var_0_0.worldBuildingBatchNode:addChild(var_3_7, 113)
	end

	if worldConstant.FROG_CITY["frogCity_" .. arg_3_0[1]] then
		if tonumber(arg_3_0[6]) == 0 then
			local var_3_8 = CCSprite:createWithSpriteFrameName("worldForg.png")

			var_0_0.cityTable["world_building_" .. arg_3_0[1]].fogSprite = var_3_8

			var_3_8:setPosition(ccp(var_3_3, var_3_4))
			var_0_0.worldBuildingBatchNode:addChild(var_3_8, 113)

			if worldControl.mistVersion ~= nil then
				var_3_8:setOpacity(204)
			end
		end

		if tonumber(arg_3_0[7]) == 1 then
			local var_3_9 = CCSprite:createWithSpriteFrameName("worldDaojian.png")

			var_0_0.cityTable["world_building_" .. arg_3_0[1]].attackSprite = var_3_9

			var_3_9:setPosition(ccp(var_3_3, var_3_4))
			var_0_0.worldBuildingBatchNode:addChild(var_3_9, 114)

			local var_3_10 = CCSprite:createWithSpriteFrameName("worldForgReward" .. arg_3_0[8] .. ".png")

			var_3_10:setPosition(ccp(var_3_9:getContentSize().width / 2 - 60, var_3_9:getContentSize().height * 1.1))
			var_3_9:addChild(var_3_10)

			local var_3_11 = CCSprite:createWithSpriteFrameName("worldForgXuetiaodi.png")

			var_0_0.cityTable["world_building_" .. arg_3_0[1]].progressBg = var_3_11

			var_3_11:setPosition(ccp(var_3_3 + 15, var_3_4 + var_3_9:getContentSize().height * 0.6))
			var_0_0.worldLayer:addChild(var_3_11, 105)

			local var_3_12 = CCProgressTimer:create(CCSprite:createWithSpriteFrameName("worldForgXuetiao.png"))

			var_3_12:setPosition(ccp(var_3_11:getContentSize().width / 2, var_3_11:getContentSize().height / 2))
			var_3_11:addChild(var_3_12)
			var_3_12:setType(kCCProgressTimerTypeBar)
			var_3_12:setMidpoint(ccp(0, 0))
			var_3_12:setBarChangeRate(ccp(1, 0))
			var_3_12:setPercentage(1 * arg_3_0[12] / arg_3_0[13] * 100)
		end
	end
end

function var_0_0.addTower(arg_4_0)
	local var_4_0 = arg_4_0.cityId
	local var_4_1 = arg_4_0.towerForceId
	local var_4_2 = arg_4_0.id
	local var_4_3 = 1

	if arg_4_0.durability / arg_4_0.maxDurability < 0.26 then
		var_4_3 = 0
	end

	local var_4_4 = 0

	var_0_0.worldTowerBatchNode:removeChildByTag(var_4_0, true)
	var_0_0.towerBloodNode:removeChildByTag(var_4_0, true)

	local var_4_5 = worldConstant.BUILDING_INFO["world_building_" .. var_4_0]
	local var_4_6 = var_4_5.model == "worldBuildingGuanqia1.png" and 1 or 0
	local var_4_7 = CCSprite:createWithSpriteFrameName(var_4_2 .. var_4_1 .. var_4_3 .. var_4_6 .. ".png")
	local var_4_8 = CCSprite:createWithSpriteFrameName("cfjt_di.png")

	var_4_8:setScale(0.7)

	local var_4_9
	local var_4_10
	local var_4_11

	if var_4_3 == 1 then
		var_4_9 = CCSprite:createWithSpriteFrameName("cfjt_jdt_di.png")
		var_4_10 = CCSprite:createWithSpriteFrameName("cfjt_jdt.png")

		var_4_10:setTextureRect(CCRectMake(127, 1019, 114 * (arg_4_0.durability / arg_4_0.maxDurability) + 1, 26))
		var_4_10:setAnchorPoint(ccp(0, 0))
		var_4_10:setPosition(ccp(4, -1.5))

		var_4_11 = CCSprite:createWithSpriteFrameName("cfjt_nj.png")
	else
		var_4_9 = CCSprite:createWithSpriteFrameName("cfjt_jdt_dih.png")
		var_4_10 = CCSprite:createWithSpriteFrameName("cfjt_jdth.png")

		var_4_10:setTextureRect(CCRectMake(231, 1034, 14, 114 * (arg_4_0.durability / arg_4_0.maxDurability) + 1))
		var_4_10:setRotation(-90)
		var_4_10:setAnchorPoint(ccp(0, 1))
		var_4_10:setPosition(ccp(-4, 3))

		var_4_11 = CCSprite:createWithSpriteFrameName("cfjt_nj1.png")
	end

	var_4_9:setPosition(ccp(170, 19.5))
	var_4_9:setScale(1.1)
	var_4_8:addChild(var_4_9)
	var_4_9:addChild(var_4_10)
	var_4_11:setPosition(ccp(-23, 9.5))
	var_4_11:setScale(0.8)
	var_4_9:addChild(var_4_11, 10)

	local var_4_12 = -30

	var_4_8:setPosition(ccp(var_4_7:getContentSize().width / 2, var_4_7:getContentSize().height / 2 + var_4_12))
	var_4_7:addChild(var_4_8)

	local var_4_13 = var_4_5.x
	local var_4_14 = var_0_0.height - var_4_5.y
	local var_4_15 = worldConstant.TOWER_POS.default.x
	local var_4_16 = worldConstant.TOWER_POS.default.y

	if worldConstant.TOWER_POS[var_4_5.model] ~= nil then
		var_4_15, var_4_16 = worldConstant.TOWER_POS[var_4_5.model].x, worldConstant.TOWER_POS[var_4_5.model].y
	end

	var_4_7:setPosition(ccp(var_4_13 + var_4_15, var_4_14 + var_4_16))

	local var_4_17 = CCLabelTTF:create(arg_4_0.durability .. "/" .. arg_4_0.maxDurability, "Thonburi", 12)

	var_4_17:setPosition(ccp(var_4_13 + 10 + var_4_15, var_4_14 + 1 + var_4_12 + var_4_16))
	var_0_0.worldTowerBatchNode:addChild(var_4_7, 110, var_4_0)
	var_0_0.towerBloodNode:addChild(var_4_17, 0, var_4_0)
end

function var_0_0.addSpecialNpc(arg_5_0)
	log.info("@@@@ addSpecialNpc")

	for iter_5_0, iter_5_1 in pairs(arg_5_0) do
		if iter_5_1.value > 0 then
			local var_5_0 = var_0_0.cityTable["world_building_" .. iter_5_1.cityId]
			local var_5_1 = var_5_0.prop
			local var_5_2 = var_5_0.sprite
			local var_5_3 = var_5_2:getContentSize()
			local var_5_4, var_5_5 = var_5_2:getPosition()
			local var_5_6 = CCSprite:createWithSpriteFrameName("sjsw_word_bg.png")
			local var_5_7 = CCSprite:createWithSpriteFrameName(string.format("sjsw_word_%s.png", iter_5_1.armyPic))

			var_5_6:setPosition(ccp(var_5_4, var_5_5))
			var_5_7:setPosition(ccp(var_5_4, var_5_5))
			var_0_0.specialNpcBatchNode:addChild(var_5_6, 0, iter_5_1.cityId)
			var_0_0.specialNpcBatchNode:addChild(var_5_7, 1, 100000 + iter_5_1.cityId)

			var_5_0.haveSpecialNpc = true
		end
	end
end

function var_0_0.addFrontCity(arg_6_0)
	log.info("@@@@ addFrontCity")

	for iter_6_0, iter_6_1 in pairs(arg_6_0) do
		local var_6_0 = var_0_0.cityTable["world_building_" .. iter_6_1]

		if var_6_0 and not var_6_0.haveFrontCity then
			local var_6_1, var_6_2 = var_6_0.sprite:getPosition()
			local var_6_3 = CCSprite:create("res/ui/world/qianx.png")

			var_6_3:setPosition(ccp(var_6_1 + 20, var_6_2))
			var_0_0.frontCityBatchNode:addChild(var_6_3, 0, iter_6_1)

			var_6_0.haveFrontCity = true
		end
	end
end

function var_0_0.setFarm(arg_7_0)
	log.info("@@@@ setFarm")

	local var_7_0 = {
		254,
		253,
		206
	}
	local var_7_1 = var_0_0.cityTable["world_building_" .. var_7_0[user.player.forceId]]

	if not var_7_1.farmEffect then
		return
	end

	var_7_1.farmEffect:removeAllChildrenWithCleanup(true)

	if arg_7_0 == 0 then
		var_7_1.farmBtnBg:setVisible(false)
		var_7_1.farmBtn:setVisible(false)
	else
		var_7_1.farmBtnBg:setVisible(true)
		var_7_1.farmBtn:setVisible(true)

		if arg_7_0 == 1 then
			-- block empty
		elseif arg_7_0 == 2 then
			local var_7_2 = rmgr.getAnimation("farmAddFoodEffect")
			local var_7_3 = CCAnimation:createWithSpriteFrames(var_7_2, 0.1)
			local var_7_4 = CCAnimate:create(var_7_3)
			local var_7_5 = CCRepeatForever:create(var_7_4)
			local var_7_6 = CCSprite:create()

			var_7_1.farmEffect:addChild(var_7_6)
			var_7_6:runAction(var_7_5)
		elseif arg_7_0 == 3 then
			local var_7_7 = rmgr.getAnimation("farmAddExpEffect")
			local var_7_8 = CCAnimation:createWithSpriteFrames(var_7_7, 0.1)
			local var_7_9 = CCAnimate:create(var_7_8)
			local var_7_10 = CCRepeatForever:create(var_7_9)
			local var_7_11 = CCSprite:create()

			var_7_1.farmEffect:addChild(var_7_11)
			var_7_11:runAction(var_7_10)
		end
	end
end

function var_0_0.addWishTree(arg_8_0)
	local var_8_0 = {
		ccp(3666, 3255),
		ccp(564, 1580),
		ccp(4738, 468)
	}
	local var_8_1 = CCNode:create()

	var_8_1:setPosition(var_8_0[user.player.forceId])
	var_0_0.worldLayer:addChild(var_8_1, 104)

	local var_8_2 = CCMenu:create()

	var_8_1:addChild(var_8_2)
	var_8_2:setPosition(ccp(0, 0))

	local var_8_3 = CCSprite:createWithSpriteFrameName("btn_close_a.png")
	local var_8_4 = CCSprite:createWithSpriteFrameName("btn_close_c.png")
	local var_8_5 = CCMenuItemSprite:create(var_8_3, var_8_4)

	var_8_5:setScaleX(2.5)
	var_8_5:setScaleY(3)
	var_8_5:setOpacity(0)
	var_8_2:addChild(var_8_5)
	var_8_5:registerScriptTapHandler(function()
		log.info("btn_wishTree")

		if user.activity.haveWishActivity then
			activityUI.show(activityConstant.TYPES.ACTIVITY_WISH.tag)
		else
			var_8_1:removeFromParentAndCleanup(true)
		end
	end)

	local var_8_6 = CCSprite:create("res/ui/world/xiaoshu.png")

	var_8_1:addChild(var_8_6)

	local var_8_7 = CCSprite:create("res/ui/world/xiaoshu1.png")

	var_8_6:addChild(var_8_7, -1)
	var_8_7:setPosition(ccp(110, 75.5))

	local var_8_8 = CCArray:create()

	var_8_8:addObject(CCFadeIn:create(0.5))
	var_8_8:addObject(CCFadeOut:create(0.5))

	local var_8_9 = CCSequence:create(var_8_8)

	var_8_7:runAction(CCRepeatForever:create(var_8_9))

	local var_8_10 = {}

	for iter_8_0 = 1, #arg_8_0 do
		local var_8_11 = arg_8_0[iter_8_0].content
		local var_8_12 = ""

		for iter_8_1 in string.gmatch(var_8_11, ">([^<]+)") do
			var_8_12 = var_8_12 .. " " .. iter_8_1
		end

		table.insert(var_8_10, var_8_12)
	end

	local var_8_13 = CCScale9Sprite:createWithSpriteFrameName("common_tip_frame_small.png")

	var_8_1:addChild(var_8_13)
	var_8_13:setAnchorPoint(ccp(0.5, 0))
	var_8_13:setPosition(ccp(30, 5))
	var_8_13:setPreferredSize(CCSizeMake(250, 100))

	for iter_8_2 = 1, #arg_8_0 do
		log.info("zhu@@@", var_8_10[iter_8_2])

		local var_8_14 = CCLabelTTF:create(var_8_10[iter_8_2], "Thonburi", 20)

		var_8_14:setAnchorPoint(ccp(0, 1))
		var_8_14:setDimensions(CCSizeMake(230, 0))
		var_8_14:setHorizontalAlignment(kCCTextAlignmentLeft)

		if iter_8_2 == 1 then
			var_8_14:setPosition(ccp(10, 90))
		else
			var_8_14:setPosition(ccp(10, 50))
			var_8_14:setVisible(false)
		end

		var_8_13:addChild(var_8_14)

		local var_8_15 = CCArray:create()

		if iter_8_2 ~= 1 then
			var_8_15:addObject(CCDelayTime:create(3.5 + 4 * (iter_8_2 - 2)))
			var_8_15:addObject(CCCallFuncN:create(function()
				var_8_14:setVisible(true)
			end))
			var_8_15:addObject(CCSpawn:createWithTwoActions(CCFadeIn:create(0.5), CCMoveBy:create(0.5, ccp(0, 40))))
		end

		var_8_15:addObject(CCDelayTime:create(3))

		if iter_8_2 == #var_8_10 then
			var_8_15:addObject(CCCallFuncN:create(function()
				var_8_13:removeFromParentAndCleanup(true)
			end))
		else
			var_8_15:addObject(CCSpawn:createWithTwoActions(CCFadeOut:create(0.5), CCMoveBy:create(0.5, ccp(0, 40))))
		end

		local var_8_16 = CCSequence:create(var_8_15)

		var_8_14:runAction(var_8_16)
	end
end

function var_0_0.addBox(arg_12_0)
	for iter_12_0 = 2, #arg_12_0 do
		if tonumber(string.sub(arg_12_0, iter_12_0, iter_12_0)) == 1 then
			local var_12_0 = worldConstant.BOX["box_" .. iter_12_0 - 1]
			local var_12_1 = CCSprite:createWithSpriteFrameName("kaobaoxing0001.png")

			var_12_1:setPosition(ccp(var_12_0.x, var_0_0.height - var_12_0.y))
			var_0_0.worldBuildingBatchNode:addChild(var_12_1, 112)

			var_0_0.boxTable["box_" .. iter_12_0 - 1] = var_12_1
		end
	end
end

local function var_0_2(arg_13_0)
	local var_13_0 = ccp(var_0_0.worldLayer:getPosition())

	return CCRect:new(arg_13_0.origin.x + var_13_0.x, arg_13_0.origin.y + var_13_0.y, arg_13_0.size.width, arg_13_0.size.height):intersectsRect(var_0_0.visibleRect)
end

function var_0_0.showVisibleNode()
	if var_0_0.IS_INCISION == false then
		return
	end

	for iter_14_0, iter_14_1 in pairs(var_0_0.nodeTable) do
		if iter_14_1.node ~= nil then
			local var_14_0 = iter_14_1.node
			local var_14_1 = var_14_0:boundingBox()

			if var_0_2(var_14_1, var_0_0.visibleRect) then
				var_14_0:setVisible(true)
			else
				var_14_0:setVisible(false)
			end
		else
			local var_14_2 = CCRect:new(iter_14_1.pos.x - iter_14_1.size.width / 2, iter_14_1.pos.y - iter_14_1.size.height / 2, iter_14_1.size.width, iter_14_1.size.height)

			if var_0_2(var_14_2, var_0_0.visibleRect) then
				if string.find(iter_14_1.nodeName, "frame:") ~= nil then
					iter_14_1.node = CCSprite:createWithSpriteFrameName(string.sub(iter_14_1.nodeName, 7))
				else
					iter_14_1.node = CCSprite:create(iter_14_1.nodeName)
				end

				iter_14_1.node:setPosition(iter_14_1.pos)
				iter_14_1.node:setContentSize(iter_14_1.size)

				if iter_14_1.batch == true then
					var_0_0.worldBuildingBatchNode:addChild(iter_14_1.node)
				else
					var_0_0.worldLayer:addChild(iter_14_1.node)
				end
			end
		end
	end
end

function var_0_0.onTap(arg_15_0, arg_15_1)
	if worldUI.fog then
		worldUI.hideFog()

		return
	end

	if user.getFunc(34) and var_0_0.mineSprite and not tolua.isnull(var_0_0.mineSprite) and tool.checkIfTouch(var_0_0.mineSprite, arg_15_0, arg_15_1) then
		smgr.changeScene(SCENE_IRONMINE)

		return
	end

	for iter_15_0, iter_15_1 in pairs(var_0_0.cityTable) do
		local var_15_0 = iter_15_1.sprite

		if tool.checkIfTouch(var_15_0, arg_15_0, arg_15_1) then
			if tonumber(iter_15_1.prop[14]) == 1 then
				if tonumber(iter_15_1.prop[7]) == 1 then
					log.info("迷雾战斗" .. iter_15_1.prop[1])

					local var_15_1 = iter_15_1.prop[1]

					bmgr.tryEnterBattle(battleType.BATTLE_CITY_NPC, {
						reserve = 1,
						targetId = var_15_1
					})
				end
			else
				if worldUI.warOptionTable and not worldUI.warOptionTable.isClosed then
					log.info("city touched at : ", iter_15_1.prop[1])
					worldUI.warOptionTable.doWarAction(iter_15_1.prop[1])
					log.info("worldUI.warOptionTable: ", worldUI.warOptionTable)

					return
				end

				local var_15_2 = eventManager.dispatchEvent("cityWindowIsTouchOn", arg_15_0, arg_15_1)

				log.info("isTouchOn:%s", var_15_2)

				if not var_15_2 and not var_0_0.cityWindowTable["id" .. iter_15_1.prop[1]] then
					var_0_0.cityWindowTable = {}

					eventManager.dispatchEvent("normalCityClick", iter_15_1.prop[1])

					var_0_0.cityWindowTable["id" .. iter_15_1.prop[1]] = true
				end
			end
		end
	end
end

local function var_0_3(arg_16_0, arg_16_1)
	local var_16_0 = -arg_16_0 + visibleSize.width / 2
	local var_16_1 = -arg_16_1 + visibleSize.height / 2

	var_0_0.scrollLayer:setContentOffset(ccp(var_16_0, var_16_1), false)
	worldUI.loadMapWithPosition(var_0_0.scrollLayer:getContentOffset().x, var_0_0.scrollLayer:getContentOffset().y)
end

local function var_0_4(arg_17_0)
	local var_17_0 = arg_17_0.x
	local var_17_1 = arg_17_0.y

	var_0_0.scrollLayer:setContentOffset(arg_17_0)
	worldUI.loadMapWithPosition(var_0_0.scrollLayer:getContentOffset().x, var_0_0.scrollLayer:getContentOffset().y)
end

local function var_0_5(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	if not var_0_0.cityTable then
		return
	end

	if arg_18_1 ~= false then
		arg_18_1 = true
	end

	local var_18_0 = var_0_0.cityTable["world_building_" .. arg_18_0].info
	local var_18_1 = var_0_0.cityTable["world_building_" .. arg_18_0].sprite
	local var_18_2 = var_18_1:getContentSize()

	if arg_18_1 then
		local var_18_3 = CCSprite:create("res/ui/guide/jiantou-xia.png")
		local var_18_4, var_18_5 = var_18_1:getPosition()

		var_18_3:setPosition(ccp(var_18_4, var_18_5 + 80))
		var_0_0.worldLayer:addChild(var_18_3, 130)

		local var_18_6

		if (user.curMainTask.taskId == 90 or user.curMainTask.taskId == 91) and user.curMainTask.state == 1 then
			var_18_6 = CCScale9Sprite:createWithSpriteFrameName("common_tip_frame_small.png")

			var_18_6:setAnchorPoint(ccp(0, 0.5))
			var_18_6:setPreferredSize(CCSizeMake(120, 60))
			var_18_6:setPosition(ccp(var_18_4 + 30, var_18_5 + 100))
			var_0_0.worldLayer:addChild(var_18_6, 130)

			local var_18_7 = CCLabelTTF:create("", "Thonburi", 22)

			var_18_7:setPosition(ccp(60, 30))
			var_18_6:addChild(var_18_7)

			if user.curMainTask.taskId == 90 then
				var_18_7:setString(language.get(200126))
			else
				var_18_7:setString(language.get(200127))
			end
		end

		local var_18_8 = CCJumpBy:create(1, ccp(0, 0), 40, 1)

		var_18_3:runAction(CCRepeatForever:create(var_18_8))

		local var_18_9 = CCSequence:createWithTwoActions(CCDelayTime:create(3), CCCallFuncN:create(function()
			var_18_3:removeFromParentAndCleanup(true)

			if var_18_6 then
				var_18_6:removeFromParentAndCleanup(true)
			end
		end))

		var_18_3:runAction(var_18_9)
	end

	if var_18_0 and var_18_0.x and var_18_0.y then
		local var_18_10 = var_18_0.x + var_18_2.width / 2
		local var_18_11 = var_0_0.height - var_18_0.y - var_18_2.height / 2

		var_0_3(var_18_10, var_18_11)
	end
end

local function var_0_6(arg_20_0)
	if not var_0_0.cityTable then
		return
	end

	if arg_20_0.yuanshaoCityId then
		local var_20_0 = var_0_0.cityTable["world_building_" .. arg_20_0.yuanshaoCityId]
		local var_20_1 = var_20_0.sprite
		local var_20_2 = var_20_0.info
		local var_20_3 = var_20_0.prop
		local var_20_4 = var_20_0.flagSprite
		local var_20_5 = var_20_1:getContentSize()
		local var_20_6 = var_20_2.x + var_20_5.width / 2
		local var_20_7 = var_0_0.height - var_20_2.y - var_20_5.height / 2

		var_20_3[2] = "106"

		if var_20_4 == nil then
			var_20_4 = CCSprite:createWithSpriteFrameName("flag_yuan.png")

			var_20_4:setPosition(ccp(var_20_6 - 50, var_20_7 - 50))
			var_0_0.worldBuildingBatchNode:addChild(var_20_4, 111)
		else
			local var_20_8 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("flag_yuan.png")

			pcall(var_20_4.setDisplayFrame, var_20_4, var_20_8)
		end

		require("lua/layer/world/yuanshaoEvent")
		yuanshaoEvent.addYuanshao(var_0_0.yuanshaoNode, var_20_6, var_20_7)
		eventManager.dispatchEvent("setThumbnailPointBelong", arg_20_0.yuanshaoCityId, "106")

		return
	end

	if arg_20_0.hjcity then
		if arg_20_0.phase == 1 then
			if arg_20_0.hjcity then
				local var_20_9 = var_0_0.cityTable["world_building_" .. arg_20_0.hjcity]
				local var_20_10 = var_20_9.sprite
				local var_20_11 = var_20_9.info
				local var_20_12 = var_20_9.prop
				local var_20_13 = var_20_9.flagSprite
				local var_20_14 = var_20_10:getContentSize()
				local var_20_15 = var_20_11.x + var_20_14.width / 2
				local var_20_16 = var_0_0.height - var_20_11.y - var_20_14.height / 2

				require("lua/layer/world/yuanshaoEvent")
				yuanshaoEvent.addZhangjiaoZhengxing(var_0_0.yuanshaoNode, var_20_15, var_20_16, arg_20_0.hjcity)
				yuanshaoEvent.zhangjiaoInfo(var_0_0.yuanshaoNode, var_20_15, var_20_16, arg_20_0.phase, arg_20_0.hjCountDown, arg_20_0.hjcity)
			end

			for iter_20_0 = 1, #arg_20_0.hjRemainCities do
				local var_20_17 = var_0_0.cityTable["world_building_" .. arg_20_0.hjRemainCities[iter_20_0].cityId]
				local var_20_18 = var_20_17.sprite
				local var_20_19 = var_20_17.info
				local var_20_20 = var_20_17.prop
				local var_20_21 = var_20_17.flagSprite
				local var_20_22 = var_20_18:getContentSize()
				local var_20_23 = var_20_19.x + var_20_22.width / 2
				local var_20_24 = var_0_0.height - var_20_19.y - var_20_22.height / 2

				var_20_20[2] = "104"

				if var_20_21 == nil then
					var_20_21 = CCSprite:createWithSpriteFrameName("flag_yuan.png")

					var_20_21:setPosition(ccp(var_20_23 - 50, var_20_24 - 50))
					var_0_0.worldBuildingBatchNode:addChild(var_20_21, 111)
				else
					local var_20_25 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("flag_yuan.png")

					pcall(var_20_21.setDisplayFrame, var_20_21, var_20_25)
				end

				eventManager.dispatchEvent("setThumbnailPointBelong", arg_20_0.hjRemainCities[iter_20_0].cityId, "104")
			end
		elseif arg_20_0.phase == 2 then
			for iter_20_1 = 1, #arg_20_0.hjRemainCities do
				local var_20_26 = var_0_0.cityTable["world_building_" .. arg_20_0.hjRemainCities[iter_20_1].cityId]
				local var_20_27 = var_20_26.sprite
				local var_20_28 = var_20_26.info
				local var_20_29 = var_20_26.prop
				local var_20_30 = var_20_26.flagSprite
				local var_20_31 = var_20_27:getContentSize()
				local var_20_32 = var_20_28.x + var_20_31.width / 2
				local var_20_33 = var_0_0.height - var_20_28.y - var_20_31.height / 2

				yuanshaoEvent.addZhangjiaoZhengxing(var_0_0.yuanshaoNode, var_20_32, var_20_33, arg_20_0.hjcity)

				if arg_20_0.hjcity == arg_20_0.hjRemainCities[iter_20_1].cityId then
					yuanshaoEvent.zhangjiaoInfo(var_0_0.yuanshaoNode, var_20_32, var_20_33, arg_20_0.phase, arg_20_0.hjCountDown, arg_20_0.hjcity)
				end

				eventManager.dispatchEvent("setThumbnailPointBelong", arg_20_0.hjRemainCities[iter_20_1].cityId, "104")
			end
		else
			yuanshaoEvent.removeZhangjiao(var_0_0.yuanshaoNode)
		end

		return
	end

	local var_20_34 = var_0_0.cityTable["world_building_" .. arg_20_0.id]
	local var_20_35 = var_20_34.sprite
	local var_20_36 = var_20_34.info

	if var_20_36 == nil then
		return
	end

	local var_20_37 = var_20_34.prop
	local var_20_38 = var_20_34.flagSprite
	local var_20_39 = var_20_35:getContentSize()
	local var_20_40 = var_20_36.x + var_20_39.width / 2
	local var_20_41 = var_0_0.height - var_20_36.y - var_20_39.height / 2

	if smgr.currentSceneTag == SCENE_WORLD and worldUI.warOptionTable and not worldUI.warOptionTable.isClosed and tonumber(worldUI.warOptionTable.cityId) == tonumber(arg_20_0.id) then
		log.info(" worldUI.warOptionTable.cityId: ", worldUI.warOptionTable.cityId, "city.id: ", arg_20_0.id)
		worldUI.warOptionTable.optionClosed()
	end

	if arg_20_0.belong then
		if arg_20_0.belong and var_20_37[2] and tonumber(var_20_37[2]) ~= tonumber(arg_20_0.belong) and worldUI.nationTaskTable["idx_" .. arg_20_0.id] then
			log.info("current - city.belong: ", arg_20_0.belong)
			log.info("previous - cityProp[2]: ", var_20_37[2])
			pcall(worldUI.nationTaskTable["idx_" .. arg_20_0.id].removeFromParentAndCleanup, worldUI.nationTaskTable["idx_" .. arg_20_0.id], true)

			worldUI.nationTaskTable["idx_" .. arg_20_0.id] = nil
			user.noticeList.attTokenNum = 0

			eventManager.dispatchEvent("JoinzhiyuanToken")
		end

		if arg_20_0.belong and var_20_37[2] and tonumber(var_20_37[2]) ~= tonumber(arg_20_0.belong) then
			user.feuds = user.feuds or {}

			local var_20_42 = user.feuds[tonumber(arg_20_0.id)]

			if var_20_42 and var_20_42[0] and var_20_42[0].forceId ~= tonumber(arg_20_0.belong) then
				worldUI.removeBtnFeud(tonumber(arg_20_0.id))
			end

			if arg_20_0.belong == user.player.forceId then
				if worldUI.expandStateTable then
					local var_20_43 = worldUI.expandStateTable["world_building_" .. arg_20_0.id]

					if var_20_43 then
						pcall(var_20_43.removeFromParentAndCleanup, var_20_43, true)
					end
				end
			elseif worldUI.expandStateTable then
				local var_20_44 = worldConstant.BUILDING_INFO["world_building_" .. arg_20_0.id]
				local var_20_45 = stringSplit(var_20_44.point, ",")
				local var_20_46 = CCSprite:create("res/ui/world/speicalCity/xkjtt_world_numb_di.png")
				local var_20_47 = CCSprite:create("res/ui/world/speicalCity/xkjtt_world_numb_0" .. var_20_45[user.player.forceId] .. ".png")

				var_20_47:setPosition(ccp(19, 20))
				var_20_46:addChild(var_20_47)
				var_20_46:setPosition(ccp(var_20_40 - 80, var_20_41 - 48))
				var_0_0.worldLayer:addChild(var_20_46, 110)

				worldUI.expandStateTable["world_building_" .. arg_20_0.id] = var_20_46
			end
		end

		var_20_37[2] = arg_20_0.belong

		local var_20_48

		if tonumber(arg_20_0.belong) == 1 then
			var_20_48 = "flag_wei.png"
		elseif tonumber(arg_20_0.belong) == 2 then
			var_20_48 = "flag_shu.png"
		elseif tonumber(arg_20_0.belong) == 3 then
			var_20_48 = "flag_wu.png"
		elseif tonumber(arg_20_0.belong) == 106 then
			var_20_48 = "flag_yuan.png"
		elseif tonumber(arg_20_0.belong) == 104 then
			var_20_48 = "flag_yuan.png"
		elseif tonumber(arg_20_0.belong) == 1001 then
			var_20_48 = "flag_yuan.png"
		elseif tonumber(arg_20_0.belong) > 100 then
			var_20_48 = "flag_mz.png"
		end

		if worldControl.top3Nations and worldControl.top3Nations[tonumber(var_20_37[2])] and worldControl.top3Nations[tonumber(var_20_37[2])] == 1 then
			var_20_48 = tonumber(var_20_37[2]) == 1 and "landq.png" or tonumber(var_20_37[2]) == 2 and "hongdq.png" or "ldq.png"
		end

		if worldControl.ysCityId and tonumber(arg_20_0.belong) ~= 106 and arg_20_0.id == worldControl.ysCityId then
			yuanshaoEvent.removeYuanshao(var_0_0.yuanshaoNode)
		end

		if worldControl.hjCenterCity and tonumber(arg_20_0.belong) ~= 104 then
			yuanshaoEvent.removeZhangjiaoByTag(var_0_0.yuanshaoNode, arg_20_0.id)
		end

		if worldControl.manzuStoneCity and worldControl.manzuStoneCity[arg_20_0.id] and tonumber(arg_20_0.belong) ~= 107 then
			local var_20_49 = var_0_0.cityTable["world_building_" .. arg_20_0.id]

			if var_20_49.manzuStoneNode then
				var_20_49.manzuStoneNode:removeFromParentAndCleanup(true)

				var_20_49.manzuStoneNode = nil
				worldControl.manzuStoneCity[arg_20_0.id] = nil
			end
		end

		if var_20_38 == nil then
			if var_20_48 ~= nil then
				var_20_38 = CCSprite:createWithSpriteFrameName(var_20_48)

				var_20_38:setPosition(ccp(var_20_40 - 50, var_20_41 - 50))
				var_0_0.worldBuildingBatchNode:addChild(var_20_38, 111)
			end
		else
			local var_20_50 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_20_48)

			pcall(var_20_38.setDisplayFrame, var_20_38, var_20_50)
		end

		eventManager.dispatchEvent("setThumbnailPointBelong", arg_20_0.id, arg_20_0.belong)
	end

	if arg_20_0.belong and arg_20_0.state ~= 1 and var_20_34.haveSpecialNpc then
		var_0_0.specialNpcBatchNode:removeChildByTag(arg_20_0.id, true)
		var_0_0.specialNpcBatchNode:removeChildByTag(100000 + arg_20_0.id, true)

		var_20_34.haveSpecialNpc = nil
	end

	if arg_20_0.belong and arg_20_0.state ~= 1 and var_20_34.haveFrontCity then
		var_0_0.frontCityBatchNode:removeChildByTag(arg_20_0.id, true)

		var_20_34.haveFrontCity = nil
	end

	if arg_20_0.state then
		var_20_37[3] = arg_20_0.state

		eventManager.dispatchEvent("setWorldFire", arg_20_0.id, arg_20_0.state)
		eventManager.dispatchEvent("setThumbnailFire", arg_20_0.id, arg_20_0.state)
	end

	if arg_20_0.nameId or arg_20_0.slam then
		if arg_20_0.nameId then
			var_20_37[4] = arg_20_0.nameId
		end

		if arg_20_0.slam then
			if type(arg_20_0.slam) == "table" and #arg_20_0.slam > 0 then
				arg_20_0.slam = 1
			end

			var_20_37[17] = arg_20_0.slam
		end

		eventManager.dispatchEvent("setSurround", arg_20_0.id, arg_20_0.nameId, arg_20_0.slam)
	end

	if arg_20_0.attCity then
		var_20_37[15] = arg_20_0.attCity

		eventManager.dispatchEvent("setAttSprite", arg_20_0.id, arg_20_0.attCity)
	end

	var_0_0.cityTable["world_building_" .. arg_20_0.id].sprite = var_20_35
	var_0_0.cityTable["world_building_" .. arg_20_0.id].flagSprite = var_20_38
	var_0_0.cityTable["world_building_" .. arg_20_0.id].prop = var_20_37
end

local function var_0_7(arg_21_0, arg_21_1)
	log.debug("city[%s] world fire:%s", arg_21_0, arg_21_1)

	local var_21_0 = var_0_0.cityTable["world_building_" .. arg_21_0]

	if not var_21_0 then
		return
	end

	local var_21_1 = var_0_0.worldFireTable["cityId_" .. arg_21_0]

	if tonumber(arg_21_1) == 1 then
		if var_21_1 then
			pcall(var_21_1.sprite.removeFromParentAndCleanup, var_21_1.sprite, true)
		end

		var_21_1 = {}

		local var_21_2 = CCSprite:createWithSpriteFrameName("worldFire_00000.png")
		local var_21_3, var_21_4 = var_21_0.sprite:getPosition()

		var_21_2:setPosition(ccp(var_21_3, var_21_4 + 40))

		local var_21_5 = CCArray:create()

		for iter_21_0 = 0, 4 do
			var_21_5:addObject(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("worldFire_0000" .. iter_21_0 .. ".png"))
		end

		local var_21_6 = CCAnimation:createWithSpriteFrames(var_21_5, 0.1)
		local var_21_7 = CCAnimate:create(var_21_6)
		local var_21_8 = CCRepeatForever:create(var_21_7)
		local var_21_9 = CCRepeatForever:create(var_21_8)

		var_21_2:runAction(var_21_9)

		var_21_1.sprite = var_21_2

		var_0_0.worldBuildingBatchNode:addChild(var_21_2, 112)

		var_0_0.worldFireTable["cityId_" .. arg_21_0] = var_21_1
	else
		if var_21_1 then
			pcall(var_21_1.sprite.removeFromParentAndCleanup, var_21_1.sprite, true)
		end

		local var_21_10 = {}
	end
end

local function var_0_8(arg_22_0)
	local var_22_0 = var_0_0.cityTable["world_building_" .. arg_22_0]

	if not var_22_0 then
		return
	end

	local var_22_1 = var_0_0.animEffect["cityId_" .. arg_22_0]

	if worldControl.hzLv and worldControl.hzLv > 0 then
		log.info("@@ 会战效果 ")

		if var_22_1 then
			pcall(var_22_1.sprite.removeFromParentAndCleanup, var_22_1.sprite, true)
		end

		local var_22_2 = {}
		local var_22_3 = rmgr.getAnimation("huizhan_lv_" .. worldControl.hzLv)

		if var_22_3 then
			local var_22_4 = CCAnimation:createWithSpriteFrames(var_22_3, 0.1)
			local var_22_5 = CCAnimate:create(var_22_4)
			local var_22_6 = CCRepeatForever:create(var_22_5)
			local var_22_7 = CCSprite:create()
			local var_22_8, var_22_9 = var_22_0.sprite:getPosition()

			var_22_7:setPosition(ccp(var_22_8, var_22_9 + 40))
			var_22_7:runAction(var_22_6)

			var_22_2.sprite = var_22_7

			var_0_0.effectLayer:addChild(var_22_7, 112)

			var_0_0.animEffect["cityId_" .. arg_22_0] = var_22_2
		end
	end
end

local function var_0_9(arg_23_0)
	local var_23_0 = var_0_0.cityTable["world_building_" .. arg_23_0]

	if not var_23_0 then
		return
	end

	if not var_0_0.huizhanUI then
		var_0_0.huizhanUI = require("lua/layer/nation/huizhan/HuizhanForceInWorld").new({
			hzAttForce = worldControl.hzAttForce,
			hzDefForce = worldControl.hzDefForce,
			hzAttForceId1 = worldControl.hzAttForceId1,
			hzAttForceId2 = worldControl.hzAttForceId2,
			hzDefForceId = worldControl.hzDefForceId,
			hzLvName = worldControl.hzLvName
		})

		local var_23_1, var_23_2 = var_23_0.sprite:getPosition()

		var_0_0.huizhanUI:setPosition(ccp(var_23_1, var_23_2 + 40))
		var_0_0.uiLayer:addChild(var_0_0.huizhanUI)
	end
end

local function var_0_10(arg_24_0)
	return
end

local function var_0_11(arg_25_0)
	if arg_25_0.attForceNum and arg_25_0.defForceNum and var_0_0.huizhanUI then
		var_0_0.huizhanUI:update({
			hzAttForce = arg_25_0.attForceNum,
			hzDefForce = arg_25_0.defForceNum
		})
	end

	if arg_25_0.state then
		var_0_10(arg_25_0)
	end
end

local function var_0_12(arg_26_0, arg_26_1, arg_26_2)
	log.info("city[%s] surround state:%s, %s", arg_26_0, arg_26_1, arg_26_2)

	local var_26_0 = var_0_0.cityTable["world_building_" .. arg_26_0]

	if not var_26_0 then
		return
	end

	local var_26_1 = var_0_0.surroundTable["cityId_" .. arg_26_0]

	if var_26_1 then
		var_26_1.sprite:removeFromParentAndCleanup(true)

		var_0_0.surroundTable["cityId_" .. arg_26_0] = nil
	end

	if tonumber(arg_26_1) ~= 0 or tonumber(arg_26_2) ~= 0 then
		local var_26_2 = {}

		var_0_0.surroundTable["cityId_" .. arg_26_0] = var_26_2

		local var_26_3
		local var_26_4, var_26_5 = var_26_0.sprite:getPosition()

		if tonumber(arg_26_2) ~= 0 then
			var_26_3 = "bwqh_word_fs.png"
			var_26_5 = var_26_5 + 60
		end

		if tonumber(arg_26_1) ~= 0 then
			var_26_3 = "world_city_surround.png"
		end

		local var_26_6 = CCSprite:createWithSpriteFrameName(var_26_3)

		var_26_2.sprite = var_26_6

		var_26_6:setPosition(var_26_4, var_26_5)
		var_0_0.worldBuildingBatchNode:addChild(var_26_6, 112)
	end
end

local function var_0_13(arg_27_0, arg_27_1)
	local var_27_0 = var_0_0.cityTable["world_building_" .. arg_27_0]

	if var_27_0.attackSprite and not tolua.isnull(var_27_0.attackSprite) then
		var_27_0.attackSprite:removeFromParentAndCleanup(true)

		var_27_0.attackSprite = nil
	end

	if tonumber(arg_27_1) == 1 then
		local var_27_1 = CCSprite:createWithSpriteFrameName("worldDaojian.png")

		var_27_1:setPosition(ccp(var_27_0.sprite:getPosition()))

		var_0_0.cityTable["world_building_" .. arg_27_0].attackSprite = var_27_1

		var_0_0.worldBuildingBatchNode:addChild(var_27_1, 113)
	end
end

local function var_0_14(arg_28_0, arg_28_1, arg_28_2)
	arg_28_2 = arg_28_2 or 3500

	local var_28_0 = var_0_0.boxTable["box_" .. arg_28_0]

	if var_28_0 then
		local var_28_1 = CCArray:create()

		for iter_28_0 = 1, 14 do
			local var_28_2 = string.format("kaobaoxing00%02.f.png", iter_28_0)

			var_28_1:addObject(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_28_2))
		end

		local var_28_3 = CCAnimation:createWithSpriteFrames(var_28_1, 0.1)
		local var_28_4 = CCAnimate:create(var_28_3)
		local var_28_5 = CCArray:create()

		var_28_5:addObject(CCDelayTime:create(arg_28_2 / 2 / 1000))
		var_28_5:addObject(var_28_4)
		var_28_5:addObject(CCCallFuncN:create(function()
			pcall(var_28_0.removeFromParentAndCleanup, var_28_0, true)

			var_0_0.boxTable["box_" .. arg_28_0] = nil
		end))

		local var_28_6 = CCSequence:create(var_28_5)

		var_28_0:runAction(var_28_6)

		local var_28_7 = CCStrokeLabelTTF:create("", "Thonburi", 20)

		var_28_7:setColor(ccc3(133, 190, 109))

		if arg_28_1[1].type == 1 then
			var_28_7:setString(language.get(200005, arg_28_1[1].num))
		elseif arg_28_1[1].type == 2 then
			var_28_7:setString(language.get(200006, arg_28_1[1].num))
		elseif arg_28_1[1].type == 3 then
			var_28_7:setString(language.get(200007, arg_28_1[1].num))
		elseif arg_28_1[1].type == 4 then
			var_28_7:setString(language.get(200008, arg_28_1[1].num))
		elseif arg_28_1[1].type == 19 then
			var_28_7:setString(language.get(200009, arg_28_1[1].num))
		elseif arg_28_1[1].type == 31 then
			var_28_7:setString("+" .. arg_28_1[1].equipName)
		end

		var_28_7:setPosition(ccp(var_28_0:getPosition()))
		var_0_0.worldLayer:addChild(var_28_7, 106)

		local var_28_8 = CCArray:create()

		var_28_8:addObject(CCHide:create())
		var_28_8:addObject(CCDelayTime:create(arg_28_2 / 2 / 1000))
		var_28_8:addObject(CCShow:create())
		var_28_8:addObject(CCMoveBy:create(1, ccp(0, 30)))
		var_28_8:addObject(CCCallFuncN:create(function()
			pcall(var_28_7.removeFromParentAndCleanup, var_28_7, true)
		end))
		var_28_7:runAction(CCSequence:create(var_28_8))
	end
end

local function var_0_15(arg_31_0, arg_31_1)
	if arg_31_0 then
		var_0_0.cityWindowTable["id" .. arg_31_1] = true
	else
		var_0_0.cityWindowTable["id" .. arg_31_1] = nil
	end
end

local function var_0_16(arg_32_0)
	log.info("zhu@@@setManzuTaskStone", arg_32_0)

	local var_32_0 = var_0_0.cityTable["world_building_" .. arg_32_0]

	if var_32_0.manzuStoneNode then
		return
	end

	local var_32_1, var_32_2 = var_32_0.sprite:getPosition()
	local var_32_3 = CCNode:create()

	var_0_0.worldLayer:addChild(var_32_3, 104)
	var_32_3:setPosition(ccp(var_32_1, var_32_2))

	local var_32_4 = CCSprite:create("res/ui/world/manzu/zymz_slysbd_bg.png")
	local var_32_5 = CCSprite:create("res/ui/world/manzu/zymz_slysbd.png")
	local var_32_6 = CCSprite:create("res/ui/world/manzu/zymz_sl_bg.png")
	local var_32_7 = CCSprite:create("res/ui/world/manzu/zymz_sl.png")

	var_32_4:setPosition(ccp(0, 80))
	var_32_5:setAnchorPoint(ccp(0, 0.5))
	var_32_5:setPosition(ccp(-80 + var_32_6:getContentSize().width / 2 + 4, 80))
	var_32_6:setPosition(ccp(-80, 80))
	var_32_7:setPosition(ccp(-77, 80))
	var_32_3:addChild(var_32_4)
	var_32_3:addChild(var_32_5)
	var_32_3:addChild(var_32_6)
	var_32_3:addChild(var_32_7)

	var_32_0.manzuStoneNode = var_32_3
	worldControl.manzuStoneCity = worldControl.manzuStoneCity or {}
	worldControl.manzuStoneCity[arg_32_0] = true
end

local var_0_17 = {
	[148] = 68,
	[68] = 68,
	[93] = 52,
	[179] = 178,
	[52] = 52,
	[178] = 178
}
local var_0_18 = {
	[178] = {
		mapP = ccp(4033, 2099),
		linP = ccp(4048, 2065)
	},
	[179] = {
		mapP = ccp(4033, 2099),
		linP = ccp(4048, 2065)
	},
	[52] = {
		mapP = ccp(2085, 2273),
		linP = ccp(2087, 2256)
	},
	[93] = {
		mapP = ccp(2085, 2273),
		linP = ccp(2087, 2256)
	},
	[68] = {
		mapP = ccp(2487, 900),
		linP = ccp(2530, 1025)
	},
	[148] = {
		mapP = ccp(2487, 900),
		linP = ccp(2530, 1025)
	}
}

local function var_0_19(arg_33_0)
	if var_0_17 and worldControl.changeMapDatas and worldControl.changeMapDatas[var_0_17[arg_33_0.cityId]] then
		worldControl.changeMapDatas[var_0_17[arg_33_0.cityId]]:removeFromParentAndCleanup(true)

		worldControl.changeMapDatas[var_0_17[arg_33_0.cityId]] = nil
	end
end

local function var_0_20(arg_34_0)
	var_0_19(arg_34_0)

	local var_34_0 = var_0_0.cityTable["world_building_" .. arg_34_0.cityId]
	local var_34_1 = CCSprite:create("res/tiledmap/gjgs_map_" .. var_0_17[arg_34_0.cityId] .. ".jpg")

	var_34_1:setPosition(var_0_18[arg_34_0.cityId].mapP)
	var_0_0.worldLayer:addChild(var_34_1, 102)

	worldControl.changeMapDatas = worldControl.changeMapDatas or {}
	worldControl.changeMapDatas[var_0_17[arg_34_0.cityId]] = var_34_1
end

local function var_0_21(arg_35_0)
	if worldControl.mapsLineData and worldControl.mapsLineData[var_0_17[arg_35_0]] then
		worldControl.mapsLineData[var_0_17[arg_35_0]]:removeFromParentAndCleanup(true)

		worldControl.mapsLineData[var_0_17[arg_35_0]] = nil
	end
end

function var_0_0.showRoadLine(arg_36_0)
	var_0_21(arg_36_0)

	local var_36_0 = CCSprite:create("res/tiledmap/gjgs_line_" .. var_0_17[arg_36_0] .. ".png")

	var_36_0:setPosition(var_0_18[arg_36_0].linP)
	var_0_0.worldLayer:addChild(var_36_0, 105)

	worldControl.mapsLineData = worldControl.mapsLineData or {}
	worldControl.mapsLineData[var_0_17[arg_36_0]] = var_36_0

	local var_36_1 = CCArray:create()

	var_36_1:addObject(CCDelayTime:create(3))
	var_36_1:addObject(CCCallFunc:create(function()
		var_0_21(arg_36_0)
	end))

	local var_36_2 = CCSequence:create(var_36_1)

	var_36_0:runAction(var_36_2)
end

function var_0_0.updateBuildRoads(arg_38_0)
	arg_38_0.cityId = arg_38_0.cityId or arg_38_0.start

	var_0_0.removeBuildRoads(arg_38_0)

	local var_38_0 = var_0_0.cityTable["world_building_" .. arg_38_0.cityId]
	local var_38_1, var_38_2 = var_38_0.sprite:getPosition()
	local var_38_3 = CCNode:create()

	var_0_0.worldLayer:addChild(var_38_3, 110)
	var_38_3:setPosition(ccp(var_38_1, var_38_2 + 100))

	local var_38_4 = {}

	uiutil.initWidgets(var_38_4, var_0_0.worldBuildData.buildLayout)
	var_38_3:addChild(var_38_4.widgets.buildNode)
	var_38_4.widgets.flagIcon:setDisplayFrame(CCSprite:create("res/ui/world/worldBuild/gjgs_world_flag_" .. arg_38_0.forceId .. ".png"):displayFrame())
	var_38_4.widgets.forceIcon:setDisplayFrame(CCSprite:create("res/ui/world/worldBuild/gjgs_world_word_" .. arg_38_0.forceId .. ".png"):displayFrame())

	if arg_38_0.state == 0 then
		var_38_4.widgets.title:setDisplayFrame(CCSprite:create("res/ui/world/worldBuild/gjgs_world_word_gsjxz.png"):displayFrame())
	else
		var_38_4.widgets.title:setDisplayFrame(CCSprite:create("res/ui/world/worldBuild/gjgs_world_word_shandao.png"):displayFrame())
	end

	var_38_4.widgets.infoLb:setString(language.get(216304, arg_38_0.startName, arg_38_0.endName))

	local var_38_5 = CCArray:create()

	var_38_5:addObject(CCCallFunc:create(function()
		arg_38_0.leftTime = arg_38_0.leftTime - 500

		if arg_38_0.leftTime <= 0 then
			var_38_4.widgets.timeLb:stopAllActions()
		elseif arg_38_0.state == 0 then
			var_38_4.widgets.timeLb:setString(language.get(216318, tool.getFormatTime(arg_38_0.leftTime)))
		else
			var_38_4.widgets.timeLb:setString(language.get(216303, tool.getFormatTime(arg_38_0.leftTime)))
		end
	end))
	var_38_5:addObject(CCDelayTime:create(0.5))

	local var_38_6 = CCSequence:create(var_38_5)

	var_38_4.widgets.timeLb:runAction(CCRepeatForever:create(var_38_6))

	var_38_0.buildRoadsNode = var_38_3
	worldControl.buildRoadsCity = worldControl.buildRoadsCity or {}
	worldControl.buildRoadsCity[arg_38_0.cityId] = true

	if arg_38_0.state and arg_38_0.state == 1 then
		var_0_20(arg_38_0)
	end
end

function var_0_0.removeBuildRoads(arg_40_0)
	arg_40_0.cityId = arg_40_0.cityId or arg_40_0.start

	if worldControl.buildRoadsCity and worldControl.buildRoadsCity[arg_40_0.cityId] then
		local var_40_0 = var_0_0.cityTable["world_building_" .. arg_40_0.cityId]

		if var_40_0 and var_40_0.buildRoadsNode then
			var_40_0.buildRoadsNode:removeFromParentAndCleanup(true)

			var_40_0.buildRoadsNode = nil
			worldControl.buildRoadsCity[arg_40_0.cityId] = nil
		end
	end

	var_0_19(arg_40_0)
end

function var_0_0.updateCloseRoads(arg_41_0)
	var_0_0.removeCloseRoads(arg_41_0)

	local var_41_0 = var_0_0.cityTable["world_building_" .. arg_41_0.cityId]
	local var_41_1, var_41_2 = var_41_0.sprite:getPosition()
	local var_41_3 = CCNode:create()

	var_0_0.worldLayer:addChild(var_41_3, 110)
	var_41_3:setPosition(ccp(var_41_1, var_41_2 + 100))

	local var_41_4 = {}

	uiutil.initWidgets(var_41_4, var_0_0.worldBuildData.buildLayout)
	var_41_3:addChild(var_41_4.widgets.buildNode)
	var_41_4.widgets.flagIcon:setDisplayFrame(CCSprite:create("res/ui/world/worldBuild/gjgs_world_flag_" .. arg_41_0.forceId .. ".png"):displayFrame())
	var_41_4.widgets.forceIcon:setDisplayFrame(CCSprite:create("res/ui/world/worldBuild/gjgs_world_word_" .. arg_41_0.forceId .. ".png"):displayFrame())

	if arg_41_0.state == 0 then
		var_41_4.widgets.infoLb:setString(language.get(216301, arg_41_0.cityName))
		var_41_4.widgets.title:setDisplayFrame(CCSprite:create("res/ui/world/worldBuild/gjgs_world_word_gsjxz.png"):displayFrame())
	else
		var_41_4.widgets.closeIcon:setVisible(true)
		var_41_4.widgets.title:setDisplayFrame(CCSprite:create("res/ui/world/worldBuild/gjgs_world_word_biguan.png"):displayFrame())
		var_41_4.widgets.infoLb:setString(language.get(216327, arg_41_0.cityName))
	end

	local var_41_5 = CCArray:create()

	var_41_5:addObject(CCCallFunc:create(function()
		arg_41_0.leftTime = arg_41_0.leftTime - 500

		if arg_41_0.leftTime <= 0 then
			var_41_4.widgets.timeLb:stopAllActions()
		elseif arg_41_0.state == 0 then
			var_41_4.widgets.timeLb:setString(language.get(216302, tool.getFormatTime(arg_41_0.leftTime)))
		else
			var_41_4.widgets.timeLb:setString(language.get(216303, tool.getFormatTime(arg_41_0.leftTime)))
		end
	end))
	var_41_5:addObject(CCDelayTime:create(0.5))

	local var_41_6 = CCSequence:create(var_41_5)

	var_41_4.widgets.timeLb:runAction(CCRepeatForever:create(var_41_6))

	var_41_0.closeRoadsNode = var_41_3
	worldControl.closeRoadsCity = worldControl.closeRoadsCity or {}
	worldControl.closeRoadsCity[arg_41_0.cityId] = true
end

function var_0_0.removeCloseRoads(arg_43_0)
	if worldControl.closeRoadsCity and worldControl.closeRoadsCity[arg_43_0.cityId] then
		local var_43_0 = var_0_0.cityTable["world_building_" .. arg_43_0.cityId]

		if var_43_0 and var_43_0.closeRoadsNode then
			var_43_0.closeRoadsNode:removeFromParentAndCleanup(true)

			var_43_0.closeRoadsNode = nil
			worldControl.closeRoadsCity[arg_43_0.cityId] = nil
		end
	end
end

function var_0_0.showEffect(arg_44_0, arg_44_1, arg_44_2)
	var_0_0.effectTag = var_0_0.effectTag or 1

	local var_44_0 = var_0_0.effectTag

	var_0_0.effectTag = var_0_0.effectTag + 1

	local function var_44_1()
		tool.safeRemoveChildByTag(arg_44_0, var_44_0)
	end

	if arg_44_1 == nil then
		return
	end

	local var_44_2
	local var_44_3 = arg_44_1
	local var_44_4 = CCMoveBy:create(0.7, ccp(0, 30))
	local var_44_5 = CCCallFuncN:create(var_44_1)
	local var_44_6 = CCArray:create()

	var_44_6:addObject(var_44_4)
	var_44_6:addObject(var_44_5)

	local var_44_7 = CCSequence:create(var_44_6)

	var_44_3:runAction(var_44_7)
	var_44_3:setPosition(arg_44_2)
	arg_44_0:addChild(var_44_3, 0, var_44_0)
end

function var_0_0.updateMonster(arg_46_0, arg_46_1)
	if arg_46_0 and arg_46_0.monsters and arg_46_0.taskState and arg_46_0.taskState == 0 then
		rmgr.loadResource("res/ui/activity/beast/beastPic.plist")

		local function var_46_0(arg_47_0)
			if arg_47_0 > math.floor(arg_47_0) then
				if arg_47_0 < 10 then
					arg_47_0 = string.format("%.1f", arg_47_0)
				else
					arg_47_0 = math.floor(arg_47_0)
				end
			end

			return arg_47_0
		end

		for iter_46_0, iter_46_1 in ipairs(arg_46_0.monsters) do
			local var_46_1 = var_0_0.cityTable["world_building_" .. iter_46_1.cityId]

			if not var_46_1.monsterNode then
				local var_46_2, var_46_3 = var_46_1.sprite:getPosition()
				local var_46_4 = CCNode:create()

				var_0_0.worldLayer:addChild(var_46_4, 110)
				var_46_4:setPosition(ccp(var_46_2, var_46_3 + 100))

				if tostring(os.date("%H", arg_46_0.nowDate / 1000)) == "20" then
					local var_46_5 = rmgr.getArmy("def", "58_1").idle
					local var_46_6 = CCAnimation:createWithSpriteFrames(var_46_5, 0.1)
					local var_46_7 = CCAnimate:create(var_46_6)
					local var_46_8 = CCSprite:createWithSpriteFrame(tolua.cast(var_46_5:objectAtIndex(0), "CCSpriteFrame"))

					var_46_8:setScale(0.8)
					var_46_8:setAnchorPoint(ccp(0.5, 0.5))
					var_46_8:setPosition(-70, -40)
					var_46_8:runAction(CCRepeatForever:create(var_46_7))
					var_46_4:addChild(var_46_8)
				end

				local var_46_9 = rmgr.getArmy("def", 58).idle
				local var_46_10 = CCAnimation:createWithSpriteFrames(var_46_9, 0.1)
				local var_46_11 = CCAnimate:create(var_46_10)
				local var_46_12 = CCSprite:createWithSpriteFrame(tolua.cast(var_46_9:objectAtIndex(0), "CCSpriteFrame"))

				var_46_12:setScale(0.8)
				var_46_12:setAnchorPoint(ccp(0.5, 0.5))
				var_46_12:setPosition(50, -40)
				var_46_12:runAction(CCRepeatForever:create(var_46_11))
				var_46_4:addChild(var_46_12)

				local var_46_13 = CCProgressTimer:create(CCSprite:createWithSpriteFrameName("ns_pb.png"))

				var_46_4:addChild(var_46_13)

				var_46_4.prog = var_46_13
				var_46_4.currentHp = iter_46_1.hp

				var_46_13:setType(kCCProgressTimerTypeBar)
				var_46_13:setMidpoint(ccp(0, 0.5))
				var_46_13:setBarChangeRate(ccp(1, 0))
				var_46_13:setPercentage(100 * iter_46_1.hp / iter_46_1.maxHp)
				var_46_13:setPosition(ccp(20, 40))

				local var_46_14 = CCSprite:createWithSpriteFrameName("ns_pb_bg.png")

				var_46_14:setAnchorPoint(ccp(0, 0))
				var_46_13:addChild(var_46_14, -1)

				local var_46_15 = CCLabelTTF:create(language.get(75021, var_46_0(iter_46_1.hp / 10000)), "Thonburi", 20)

				var_46_15:setPosition(ccp(97, 11.5))

				var_46_4.hpLb = var_46_15

				var_46_13:addChild(var_46_15)

				var_46_1.monsterNode = var_46_4
				worldControl.monsterCity = worldControl.monsterCity or {}
				worldControl.monsterCity[iter_46_1.cityId] = var_46_1
			else
				for iter_46_2, iter_46_3 in ipairs(arg_46_0.monsters) do
					local var_46_16 = var_0_0.cityTable["world_building_" .. iter_46_3.cityId]

					if var_46_16.monsterNode then
						local var_46_17 = 0

						if var_46_16.monsterNode.currentHp then
							var_46_17 = var_46_16.monsterNode.currentHp - iter_46_3.hp
							var_46_16.monsterNode.currentHp = iter_46_3.hp
						end

						if var_46_16.monsterNode.prog then
							var_46_16.monsterNode.prog:setPercentage(100 * iter_46_3.hp / iter_46_3.maxHp)
						end

						if var_46_16.monsterNode.hpLb then
							var_46_16.monsterNode.hpLb:setString(language.get(75021, var_46_0(iter_46_3.hp / 10000)))
						end

						if var_46_17 > 0 then
							local var_46_18 = CCLabelAtlas:create(string.format("%s", var_46_17), "res/ui/common/number/blood_ded_numb.png", 17, 22, 48)

							var_46_18:setAnchorPoint(ccp(0.5, 0.5))

							local var_46_19 = CCSprite:createWithSpriteFrameName("blood_ded_subt.png")

							hpNode = createRichNode({
								var_46_19,
								var_46_18
							}, 0.5)

							var_0_0.showEffect(var_46_16.monsterNode.prog, hpNode, ccp(97, 20))
						end
					end

					if iter_46_3.hp == 0 and var_46_16.monsterNode then
						var_46_16.monsterNode:removeFromParentAndCleanup(true)

						var_46_16.monsterNode = nil
						worldControl.monsterCity[iter_46_3.cityId] = nil
					end
				end
			end
		end
	elseif worldControl.monsterCity then
		for iter_46_4, iter_46_5 in pairs(worldControl.monsterCity) do
			if iter_46_5 and iter_46_5.monsterNode then
				iter_46_5.monsterNode:removeFromParentAndCleanup(true)

				iter_46_5.monsterNode = nil
				worldControl.monsterCity[iter_46_4] = nil
			end
		end
	end
end

function var_0_0.removeMonster()
	if worldControl.monsterCity then
		for iter_48_0, iter_48_1 in pairs(worldControl.monsterCity) do
			if iter_48_1 and iter_48_1.monsterNode then
				iter_48_1.monsterNode:removeFromParentAndCleanup(true)

				iter_48_1.monsterNode = nil
				worldControl.monsterCity[iter_48_0] = nil
			end
		end
	end
end

local function var_0_22(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
	if var_0_0.lockIconTipView and var_0_0.lockIconTipView.widgets and var_0_0.lockIconTipView.widgets.tipFrame then
		var_0_0.lockIconTipView.widgets.tipFrame:removeFromParentAndCleanup(true)

		var_0_0.lockIconTipView.widgets.tipFrame = nil
	end

	if arg_49_0 then
		local var_49_0 = 330
		local var_49_1 = -140

		if var_0_0.lockIconTipView == nil then
			var_0_0.lockIconTipView = {}
		end

		uiutil.initWidgets(var_0_0.lockIconTipView, var_0_0.lockCityData.layout_tipFrame)
		var_0_0.lockIconTipView.widgets.tipFrame:setAnchorPoint(ccp(1, 0))
		arg_49_1:addChild(var_0_0.lockIconTipView.widgets.tipFrame)

		if arg_49_3 then
			var_49_0 = var_49_0 + arg_49_3.x
			var_49_1 = var_49_1 + arg_49_3.y
		end

		var_0_0.lockIconTipView.widgets.tipMsg:setString(arg_49_2)

		local var_49_2 = var_0_0.lockIconTipView.widgets.tipMsg:getContentSize().width
		local var_49_3 = var_0_0.lockIconTipView.widgets.tipMsg:getContentSize().height

		var_0_0.lockIconTipView.widgets.tipFrame:setPreferredSize(CCSizeMake(var_49_2 + 30, var_49_3 + 30))
		var_0_0.lockIconTipView.widgets.tipFrame:setPosition(ccp(var_49_0, var_49_1))
		var_0_0.lockIconTipView.widgets.tipMsg:setPosition(ccp(15, 15))
		var_0_0.lockIconTipView.widgets.tipFrame:setVisible(true)
	end
end

local function var_0_23(arg_50_0)
	if var_0_0.lockCityTable[arg_50_0] == nil then
		var_0_0.lockCityTable[arg_50_0] = {}

		local var_50_0, var_50_1 = var_0_0.cityTable["world_building_" .. arg_50_0].sprite:getPosition()

		uiutil.initWidgets(var_0_0.lockCityTable[arg_50_0], var_0_0.lockCityData.lockIconLayout)
		var_0_0.lockCityTable[arg_50_0].widgets.lockIconNode:setPosition(ccp(var_50_0 - 75, var_50_1 - 85))
		var_0_0.worldLayer:addChild(var_0_0.lockCityTable[arg_50_0].widgets.lockIconNode, 105)

		local function var_50_2(...)
			var_0_22(false)
		end

		local function var_50_3(...)
			var_0_22(true, var_0_0.lockCityTable[arg_50_0].widgets.lockIconBtn, language.get(214501))
		end

		var_0_0.lockCityTable[arg_50_0].widgets.lockIconBtn:addHandleOfControlEvent(var_50_3, CCControlEventTouchDown)
		var_0_0.lockCityTable[arg_50_0].widgets.lockIconBtn:addHandleOfControlEvent(var_50_2, CCControlEventTouchUpInside)
		var_0_0.lockCityTable[arg_50_0].widgets.lockIconBtn:addHandleOfControlEvent(var_50_2, CCControlEventTouchUpOutside)
	end
end

local function var_0_24(arg_53_0)
	if var_0_0.lockCityTable[arg_53_0] then
		if var_0_0.lockCityTable[arg_53_0].widgets.lockIconNode then
			pcall(var_0_0.lockCityTable[arg_53_0].widgets.lockIconNode.removeFromParentAndCleanup, var_0_0.lockCityTable[arg_53_0].widgets.lockIconNode, true)
		end

		var_0_0.lockCityTable[arg_53_0] = nil
	end
end

local function var_0_25(arg_54_0)
	local var_54_0 = {}
	local var_54_1 = 0

	for iter_54_0, iter_54_1 in pairs(worldControl.lockInfo) do
		var_54_1 = var_54_1 + 1

		if iter_54_1 <= 0 then
			var_0_24(iter_54_0)
			table.insert(var_54_0, var_54_1)
		else
			var_0_23(iter_54_0)
		end
	end

	for iter_54_2, iter_54_3 in pairs(var_54_0) do
		table.remove(worldControl.lockInfo, iter_54_3)
	end
end

local function var_0_26(arg_55_0)
	if not arg_55_0 or tolua.isnull(arg_55_0) then
		return
	end

	local var_55_0 = CCArray:create()

	var_55_0:addObject(CCMoveBy:create(0.1, ccp(0, -5)))
	var_55_0:addObject(CCMoveBy:create(0.2, ccp(0, 10)))
	var_55_0:addObject(CCMoveBy:create(0.1, ccp(0, -5)))
	var_55_0:addObject(CCMoveBy:create(0.1, ccp(0, -5)))
	var_55_0:addObject(CCMoveBy:create(0.2, ccp(0, 10)))
	var_55_0:addObject(CCMoveBy:create(0.1, ccp(0, -5)))
	var_55_0:addObject(CCMoveBy:create(0.1, ccp(0, -5)))
	var_55_0:addObject(CCMoveBy:create(0.2, ccp(0, 10)))
	var_55_0:addObject(CCMoveBy:create(0.1, ccp(0, -5)))
	var_55_0:addObject(CCDelayTime:create(1))

	local var_55_1 = CCSequence:create(var_55_0)

	arg_55_0:stopAllActions()
	arg_55_0:runAction(CCRepeatForever:create(var_55_1))
end

function var_0_0.clearAllCanLockCities()
	if var_0_0.canLockCities then
		for iter_56_0, iter_56_1 in pairs(var_0_0.canLockCities) do
			pcall(iter_56_1.removeFromParentAndCleanup, iter_56_1, true)
		end

		var_0_0.canLockCities = {}
	end
end

function var_0_0.markLockCity(arg_57_0)
	local var_57_0 = var_0_0.markLockCities[arg_57_0]

	if var_57_0 then
		pcall(var_57_0.removeFromParentAndCleanup, var_57_0, true)

		var_0_0.markLockCities[arg_57_0] = nil
		var_0_0.lockCityNum = var_0_0.lockCityNum + 1
	elseif var_0_0.lockCityNum > 0 then
		local var_57_1, var_57_2 = var_0_0.cityTable["world_building_" .. arg_57_0].sprite:getPosition()
		local var_57_3 = CCSprite:create("res/ui/world/autoBattle/zdgz_city_xz.png")

		var_57_3:setPosition(ccp(var_57_1, var_57_2))
		var_0_0.worldLayer:addChild(var_57_3, 105)

		var_0_0.markLockCities[arg_57_0] = var_57_3
		var_0_0.lockCityNum = var_0_0.lockCityNum - 1
	end

	if var_0_0.lockUI and var_0_0.lockUI.widgets and var_0_0.lockUI.widgets.cityNum then
		var_0_0.lockUI.widgets.cityNum:setString(var_0_0.lockCityNum)
	end
end

function var_0_0.clearAllMarkLockCities()
	if var_0_0.markLockCities then
		for iter_58_0, iter_58_1 in pairs(var_0_0.markLockCities) do
			pcall(iter_58_1.removeFromParentAndCleanup, iter_58_1, true)
		end

		var_0_0.markLockCities = {}
	end
end

function var_0_0.addCanLockCities(arg_59_0)
	local var_59_0 = var_0_0.cityTable["world_building_" .. arg_59_0]
	local var_59_1, var_59_2 = var_59_0.sprite:getPosition()
	local var_59_3 = CCControlButton:create(CCScale9Sprite:create("res/default.png"))

	var_59_3:setAdjustBackgroundImage(false)
	var_59_3:setBackgroundSpriteForState(CCScale9Sprite:create("res/default.png"), CCControlStateHighlighted)
	var_59_3:setPreferredSize(var_59_0.sprite:getContentSize())
	var_59_3:setZoomOnTouchDown(false)

	local function var_59_4(...)
		var_0_0.markLockCity(arg_59_0)
	end

	var_59_3:addHandleOfControlEvent(var_59_4, CCControlEventTouchUpInside)

	local var_59_5 = CCSprite:create("res/ui/world/cityLock/ccls_word_kls.png")
	local var_59_6 = CCSprite:create("res/ui/world/cityLock/ccls_arrow.png")

	var_59_6:setPosition(ccp(47, -20))
	var_59_5:addChild(var_59_6)
	var_59_5:setPosition(ccp(var_59_0.sprite:getContentSize().width * 0.5, 180))
	var_59_3:addChild(var_59_5)
	var_59_3:setPosition(ccp(var_59_1, var_59_2))
	var_0_0.worldLayer:addChild(var_59_3, 999)
	var_0_26(var_59_3)
	table.insert(var_0_0.canLockCities, var_59_3)

	var_0_0.canTouchCity = false
end

function var_0_0.clearLockSelectUI(arg_61_0)
	var_0_0.lockCityNum = 2

	if not arg_61_0 then
		var_0_0.hideLockUI()
	end

	var_0_0.clearAllMarkLockCities()
	var_0_0.clearAllCanLockCities()

	var_0_0.canTouchCity = true
	var_0_0.lockUI = {}
end

function var_0_0.showLockUI()
	local var_62_0 = smgr.getLayer("topLayer")

	uiutil.initWidgets(var_0_0.lockUI, var_0_0.lockCityData.lockUILayout)
	var_62_0:addChild(var_0_0.lockUI.widgets.lockUINode)

	function var_0_0.lockUI.widgets.lockUINode.onExit(arg_63_0)
		var_0_0.clearLockSelectUI(true)
	end

	initScriptEventNode(var_0_0.lockUI.widgets.lockUINode)

	local function var_62_1(...)
		var_0_0.clearLockSelectUI()
	end

	var_0_0.lockUI.widgets.back:addHandleOfControlEvent(var_62_1, CCControlEventTouchUpInside)

	local function var_62_2(...)
		if var_0_0.lockCityNum < 2 then
			local var_65_0 = ""

			for iter_65_0, iter_65_1 in pairs(var_0_0.markLockCities) do
				if iter_65_0 then
					var_65_0 = iter_65_0 .. "," .. var_65_0
				end
			end

			worldControl.chainableCities(worldControl.lockFromCityId, var_65_0)
		else
			smgr.showTipText(language.get(214410))
		end
	end

	var_0_0.lockUI.widgets.fadongBtn:addHandleOfControlEvent(var_62_2, CCControlEventTouchUpInside)
end

function var_0_0.hideLockUI()
	if var_0_0.lockUI and var_0_0.lockUI.widgets and var_0_0.lockUI.widgets.lockUINode then
		pcall(var_0_0.lockUI.widgets.lockUINode.removeFromParentAndCleanup, var_0_0.lockUI.widgets.lockUINode, true)
	end
end

local function var_0_27(arg_67_0, arg_67_1)
	if var_0_0.lockCityTable[arg_67_0] == nil then
		var_0_0.lockCityTable[arg_67_0] = {}

		local var_67_0, var_67_1 = var_0_0.cityTable["world_building_" .. arg_67_0].sprite:getPosition()

		uiutil.initWidgets(var_0_0.lockCityTable[arg_67_0], var_0_0.lockCityData.lockIconLayout)
		var_0_0.lockCityTable[arg_67_0].widgets.lockInfoLb:setVisible(false)
		var_0_0.lockCityTable[arg_67_0].widgets.lockIconNode:setPosition(ccp(var_67_0 - 75, var_67_1 - 85))
		var_0_0.worldLayer:addChild(var_0_0.lockCityTable[arg_67_0].widgets.lockIconNode, 105)

		local function var_67_2()
			var_0_24(arg_67_0)
		end

		if arg_67_1 > 0 then
			timerLayer = createTimerLabel(arg_67_1, "@H:@M:@S", "Thonburi-Bold", 24, var_67_2, nil, nil, colorTips.red)

			timerLayer:setPosition(ccp(80, 0))
			var_0_0.lockCityTable[arg_67_0].widgets.lockIconNode:addChild(timerLayer)
		end
	end
end

function var_0_0.cityLockUpdate(arg_69_0)
	log.info("======================lockCityInfo  icon==========================")
	showTable(arg_69_0)

	for iter_69_0, iter_69_1 in pairs(arg_69_0) do
		if iter_69_1.cd > 0 then
			for iter_69_2, iter_69_3 in pairs(iter_69_1.toCityIdList) do
				var_0_27(iter_69_3, iter_69_1.cd)
			end
		end

		if iter_69_1.path then
			local var_69_0 = stringSplit(iter_69_1.path, ";")
			local var_69_1

			for iter_69_4, iter_69_5 in pairs(var_69_0) do
				local var_69_2 = stringSplit(iter_69_5, ",")

				var_0_0.drawLock(var_69_2[1], var_69_2[2])
			end
		end
	end
end

function var_0_0.drawLock(arg_70_0, arg_70_1)
	log.info("@@@@@@@@@@@@@@@@@@@@", arg_70_0, arg_70_1)

	local var_70_0 = require("lua/layer/world/cubePoly")
	local var_70_1 = require("lua/layer/world/tracePoints")
	local var_70_2 = var_70_0.curve(tonumber(arg_70_0), tonumber(arg_70_1))
	local var_70_3 = {}
	local var_70_4 = var_70_1.elapse(tonumber(arg_70_0), tonumber(arg_70_1))

	var_70_3.count = var_70_4.count + 1

	for iter_70_0 = 1, var_70_4.count do
		if iter_70_0 < var_70_4.count then
			local var_70_5 = var_70_4.time[iter_70_0]
			local var_70_6, var_70_7 = var_70_0.position(var_70_2, tonumber(arg_70_0), tonumber(arg_70_1), var_70_5)
			local var_70_8 = var_70_4.time[iter_70_0 + 1]
			local var_70_9, var_70_10 = var_70_0.position(var_70_2, tonumber(arg_70_0), tonumber(arg_70_1), var_70_8)
			local var_70_11 = tool.getAngle(ccp(var_70_6, var_70_7), ccp(var_70_9, var_70_10))

			if iter_70_0 % 2 == 0 then
				local var_70_12 = CCSprite:createWithSpriteFrameName("lock11.png")

				var_70_12:setPosition(ccp(var_70_6, var_70_7))
				var_70_12:setScale(1.5)
				var_70_12:setRotation(var_70_11)
				var_0_0.worldBuildingBatchNode:addChild(var_70_12, 111)

				if not var_0_0.lockCityEffect[arg_70_0 .. "_" .. arg_70_1] then
					var_0_0.lockCityEffect[arg_70_0 .. "_" .. arg_70_1] = {}
				end

				table.insert(var_0_0.lockCityEffect[arg_70_0 .. "_" .. arg_70_1], var_70_12)
			else
				local var_70_13 = CCSprite:createWithSpriteFrameName("lock21.png")

				var_70_13:setPosition(ccp(var_70_6, var_70_7))
				var_70_13:setScale(1.5)
				var_70_13:setRotation(var_70_11)
				var_0_0.worldBuildingBatchNode:addChild(var_70_13, 110)

				if not var_0_0.lockCityEffect[arg_70_0 .. "_" .. arg_70_1] then
					var_0_0.lockCityEffect[arg_70_0 .. "_" .. arg_70_1] = {}
				end

				table.insert(var_0_0.lockCityEffect[arg_70_0 .. "_" .. arg_70_1], var_70_13)
			end
		end
	end
end

function var_0_0.clearLock(arg_71_0, arg_71_1)
	log.info("clearLock@@@@@@@", arg_71_0, arg_71_1)

	local var_71_0 = var_0_0.lockCityEffect[arg_71_0 .. "_" .. arg_71_1] or var_0_0.lockCityEffect[arg_71_1 .. "_" .. arg_71_0]

	if var_71_0 then
		for iter_71_0, iter_71_1 in pairs(var_71_0) do
			if iter_71_1 then
				pcall(iter_71_1.removeFromParentAndCleanup, iter_71_1, true)

				var_0_0.lockCityEffect[arg_71_0 .. "_" .. arg_71_1] = nil
			end
		end
	end
end

function var_0_0.lockCityInfo(arg_72_0)
	showTable(arg_72_0)

	if arg_72_0.state == 2 then
		for iter_72_0, iter_72_1 in pairs(arg_72_0.toCityIdList) do
			var_0_24(iter_72_1)
		end

		if arg_72_0.path then
			local var_72_0 = stringSplit(arg_72_0.path, ";")
			local var_72_1

			for iter_72_2, iter_72_3 in pairs(var_72_0) do
				local var_72_2 = stringSplit(iter_72_3, ",")

				var_0_0.clearLock(var_72_2[1], var_72_2[2])
			end
		end
	else
		for iter_72_4, iter_72_5 in pairs(arg_72_0.toCityIdList) do
			var_0_27(iter_72_5, arg_72_0.cd)
		end

		if arg_72_0.path then
			local var_72_3 = stringSplit(arg_72_0.path, ";")
			local var_72_4

			for iter_72_6, iter_72_7 in pairs(var_72_3) do
				local var_72_5 = stringSplit(iter_72_7, ",")

				var_0_0.drawLock(var_72_5[1], var_72_5[2])
			end
		end
	end

	if smgr.currentSceneTag == SCENE_WORLD and arg_72_0.state == 1 then
		if arg_72_0.forceId == user.player.forceId then
			notice.control.lockNotice(1)
		else
			notice.control.lockNotice(3)
		end
	end
end

local function var_0_28()
	log.debug("world base layer onEnter")
	eventManager.registerEvent("moveWorldMapTo", var_0_3)
	eventManager.registerEvent("moveToCity", var_0_5)
	eventManager.registerEvent("changeCityState", var_0_6)
	eventManager.registerEvent("setSurround", var_0_12)
	eventManager.registerEvent("setWorldFire", var_0_7)
	eventManager.registerEvent("worldSetOffet", var_0_4)
	eventManager.registerEvent("openBox", var_0_14)
	eventManager.registerEvent("setAttSprite", var_0_13)
	eventManager.registerEvent("hideWorldElement", var_0_15)
	eventManager.registerEvent("setManzuTaskStone", var_0_16)
	eventManager.registerEvent("showWorldHuizhanState", var_0_8)
	eventManager.registerEvent("showWorldHuizhanForce", var_0_9)
	eventManager.registerEvent("changeHuizhanState", var_0_11)
	eventManager.registerEvent("addFrontCity", var_0_0.addFrontCity)
	eventManager.registerEvent("setFarm", var_0_0.setFarm)
	eventManager.registerEvent("showCityLockIcon", var_0_25)
end

local function var_0_29()
	log.debug("world base layer onExit")
	eventManager.unregisterEvent("moveWorldMapTo", var_0_3)
	eventManager.unregisterEvent("moveToCity", var_0_5)
	eventManager.unregisterEvent("changeCityState", var_0_6)
	eventManager.unregisterEvent("setSurround", var_0_12)
	eventManager.unregisterEvent("setWorldFire", var_0_7)
	eventManager.unregisterEvent("worldSetOffet", var_0_4)
	eventManager.unregisterEvent("openBox", var_0_14)
	eventManager.unregisterEvent("setAttSprite", var_0_13)
	eventManager.unregisterEvent("hideWorldElement", var_0_15)
	eventManager.unregisterEvent("setManzuTaskStone", var_0_16)
	eventManager.unregisterEvent("showWorldHuizhanState", var_0_8)
	eventManager.unregisterEvent("showWorldHuizhanForce", var_0_9)
	eventManager.unregisterEvent("changeHuizhanState", var_0_11)
	eventManager.unregisterEvent("addFrontCity", var_0_0.addFrontCity)
	eventManager.unregisterEvent("setFarm", var_0_0.setFarm)
	eventManager.unregisterEvent("showCityLockIcon", var_0_25)

	var_0_0.cityTable = {}
	var_0_0.surroundTable = {}
	var_0_0.worldFireTable = {}
	var_0_0.cityWindowTable = {}
	var_0_0.lockCityTable = {}

	var_0_0.clearLockSelectUI()

	var_0_0.lockCityEffect = {}
	worldControl.changeMapDatas = {}
	worldControl.mapsLineData = {}
	worldControl.buildRoadsCity = {}
	worldControl.closeRoadsCity = {}
	worldControl.monsterCity = {}
	var_0_0.huizhanUI = nil
	worldControl.lock = false

	rmgr.unloadTable(var_0_0.TEXTURE_TABLE)
end

function createWorldCamera(arg_75_0, arg_75_1)
	var_0_0.width = arg_75_0 or 6000
	var_0_0.height = arg_75_1 or 3600
	var_0_0.visibleRect = CCRect:new(-var_0_0.EDGE, -var_0_0.EDGE, visibleSize.width + 2 * var_0_0.EDGE, visibleSize.height + 2 * var_0_0.EDGE)

	rmgr.loadTable(var_0_0.TEXTURE_TABLE)

	local var_75_0 = createBaseLayer()

	var_75_0.onEnter = var_0_28
	var_75_0.onExit = var_0_29

	local var_75_1 = CCScrollView:create(visibleSize)

	var_75_1:setDirection(kCCScrollViewDirectionBoth)
	var_75_1:setBounceable(false)
	var_75_1:setPosition(ccp(0, 0))
	var_75_1:setContentSize(CCSizeMake(var_0_0.width, var_0_0.height))
	var_75_1:registerScriptHandler(function()
		worldUI.loadMapWithPosition(var_75_1:getContentOffset().x, var_75_1:getContentOffset().y)
	end, 0)

	local var_75_2 = CCLayer:create()
	local var_75_3 = CCLayer:create()
	local var_75_4 = CCLayer:create()
	local var_75_5 = CCLayer:create()

	var_75_2:setContentSize(CCSizeMake(var_0_0.width, var_0_0.height))
	var_75_1:setContainer(var_75_2)

	local var_75_6 = CCSpriteBatchNode:create("res/ui/world/worldBuilding.png", 1500)

	var_0_0.worldBuildingBatchNode = var_75_6

	var_75_6:setPosition(ccp(0, 0))
	var_75_2:addChild(var_75_6, 105)

	local var_75_7 = CCSpriteBatchNode:create("res/ui/world/specialNpc/specialNpcPic.png", 1500)

	var_0_0.specialNpcBatchNode = var_75_7

	var_75_7:setPosition(ccp(0, 0))
	var_75_2:addChild(var_75_7, 106)

	local var_75_8 = CCSpriteBatchNode:create("res/ui/world/qianx.png", 50)

	var_0_0.frontCityBatchNode = var_75_8

	var_75_8:setPosition(ccp(0, 0))
	var_75_2:addChild(var_75_8, 110)

	local var_75_9 = CCSpriteBatchNode:create("res/ui/world/worldTower.png", 1500)

	var_0_0.worldTowerBatchNode = var_75_9

	var_75_9:setPosition(ccp(0, 0))
	var_75_2:addChild(var_75_9, 106)

	local var_75_10 = CCSprite:create()

	var_0_0.towerBloodNode = var_75_10

	var_75_10:setPosition(ccp(0, 0))
	var_75_2:addChild(var_75_10, 107)

	local var_75_11 = CCSprite:create()

	var_0_0.yuanshaoNode = var_75_11

	var_75_11:setPosition(ccp(0, 0))
	var_75_2:addChild(var_75_11, 108)

	local var_75_12 = CCSprite:create()

	var_0_0.shenshiSkillNode = var_75_12

	var_75_12:setPosition(ccp(0, 0))
	var_75_2:addChild(var_75_12, 109)

	local var_75_13 = CCSprite:create()

	var_0_0.castleNode = var_75_13

	var_75_13:setPosition(ccp(0, 0))
	var_75_2:addChild(var_75_13, 110)

	local var_75_14 = CCSprite:create()

	var_0_0.tujiPhantomNode = var_75_14

	var_75_14:setPosition(ccp(0, 0))
	var_75_2:addChild(var_75_14, 120)

	local var_75_15 = CCSprite:create()

	var_0_0.newManzuNode = var_75_15

	var_75_15:setPosition(ccp(0, 0))
	var_75_2:addChild(var_75_15, 108)

	local var_75_16 = CCSprite:create()

	var_0_0.junliangkuNode = var_75_16

	var_75_16:setPosition(ccp(0, 0))
	var_75_2:addChild(var_75_16, 108)
	var_75_2:addChild(var_75_3, 107)
	var_75_2:addChild(var_75_4, 108)
	var_75_2:addChild(var_75_5, 109)
	var_75_0:addChild(var_75_1, 100)

	var_0_0.baseLayer = var_75_0
	var_0_0.worldLayer = var_75_2
	var_0_0.scrollLayer = var_75_1
	var_0_0.warOptionLayer = var_75_5
	var_0_0.effectLayer = var_75_3
	var_0_0.uiLayer = var_75_4

	var_0_1()

	if worldControl.memoryLocaition then
		var_0_4(worldControl.memoryLocaition)
	end

	return var_0_0
end
