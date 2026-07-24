require("lua/layer/kfyzWorld/Constant")

local var_0_0 = {
	"flag_wei.png",
	"flag_shu.png",
	"flag_wu.png",
	"flag_mz.png",
	[1003] = "flag_yuan.png",
	[1001] = "flag_yuan.png",
	[1002] = "flag_yuan.png"
}
local var_0_1 = {
	[206] = true,
	[252] = true,
	[254] = true,
	[251] = true,
	[250] = true,
	[253] = true
}
local var_0_2 = {
	[19] = true,
	[123] = true,
	[105] = true,
	[207] = true
}
local var_0_3 = {}
local var_0_4 = class("KfMapLayer", function()
	return CCScrollView:create(visibleSize)
end)
local var_0_5 = 6
local var_0_6 = 6
local var_0_7 = false
local var_0_8 = require("lua/layer/kfyzWorld/EffectLayer")
local var_0_9 = require("lua/layer/world/cityWindow2/ui")
local var_0_10 = require("lua/layer/kfyzWorld/YzMoveLayer")
local var_0_11 = {
	{
		"block1_1.jpg",
		"block1_2.jpg",
		"block1_3.jpg",
		"block1_4.jpg",
		"block1_5.jpg",
		"block1_6.jpg"
	},
	{
		"block2_1.jpg",
		"block2_2.jpg",
		"block2_3.jpg",
		"block2_4.jpg",
		"block2_5.jpg",
		"block2_6.jpg"
	},
	{
		"block3_1.jpg",
		"block3_2.jpg",
		"block3_3.jpg",
		"block3_4.jpg",
		"block3_5.jpg",
		"block3_6.jpg"
	},
	{
		"block4_1.jpg",
		"block4_2.jpg",
		"block4_3.jpg",
		"block4_4.jpg",
		"block4_5.jpg",
		"block4_6.jpg"
	},
	{
		"block5_1.jpg",
		"block5_2.jpg",
		"block5_3.jpg",
		"block5_4.jpg",
		"block5_5.jpg",
		"block5_6.jpg"
	},
	{
		"block6_1.jpg",
		"block6_2.jpg",
		"block6_3.jpg",
		"block6_4.jpg",
		"block6_5.jpg",
		"block6_6.jpg"
	}
}
local var_0_12
local var_0_13 = 20

function var_0_4.ctor(arg_2_0, arg_2_1)
	arg_2_0.world = arg_2_1

	arg_2_0:init()
end

function var_0_4.init(arg_3_0)
	local var_3_0 = {}

	var_3_0.width = 1000
	var_3_0.height = 600

	if user.jpsIndex == 0 then
		var_3_0.row = 6
		var_3_0.column = 6
		var_0_5 = 6
		var_0_6 = 6
	elseif user.isKfdy then
		var_0_5 = 3
		var_0_6 = 3
		var_3_0.row = 3
		var_3_0.column = 3
	elseif user.isKfgl then
		var_0_5 = 3
		var_0_6 = 3
		var_3_0.row = 3
		var_3_0.column = 3
	elseif user.isKfyn then
		var_0_5 = 3
		var_0_6 = 3
		var_3_0.row = 3
		var_3_0.column = 3
	elseif user.isKflq then
		var_0_5 = 3
		var_0_6 = 3
		var_3_0.row = 3
		var_3_0.column = 3
	elseif user.isKfnz then
		var_0_5 = 3
		var_0_6 = 3
		var_3_0.row = 3
		var_3_0.column = 3
	end

	arg_3_0.mapInfo = var_3_0

	local var_3_1 = var_3_0.column * var_3_0.width
	local var_3_2 = var_3_0.row * var_3_0.height

	arg_3_0.mapInfo.mapWidth = var_3_1
	arg_3_0.mapInfo.mapHeight = var_3_2

	local var_3_3 = CCLayer:create()

	var_3_3:registerScriptHandler(function(arg_4_0)
		if arg_4_0 == "enter" then
			arg_3_0:onEnter()
		elseif arg_4_0 == "exit" then
			arg_3_0:onExit()
		end
	end)
	arg_3_0:registerScriptHandler(function(arg_5_0)
		arg_3_0:loadMapWithPosition(arg_3_0:getContentOffset().x, arg_3_0:getContentOffset().y)
	end, 0)

	arg_3_0.worldLayer = var_3_3

	arg_3_0:setDirection(kCCScrollViewDirectionBoth)
	arg_3_0:setBounceable(false)
	arg_3_0:setPosition(ccp(0, 0))
	arg_3_0:setContentSize(CCSizeMake(var_3_1, var_3_2))
	var_3_3:setContentSize(CCSizeMake(var_3_1, var_3_2))
	arg_3_0:setContainer(var_3_3)
	arg_3_0.worldLayer:registerScriptTouchHandler(function(arg_6_0, arg_6_1, arg_6_2)
		return arg_3_0:onTouch(arg_6_0, arg_6_1, arg_6_2)
	end)
	arg_3_0.worldLayer:setTouchEnabled(true)

	local var_3_4 = kfyzWorld.memoryLocation or ccp(0, 0)

	arg_3_0:worldSetOffset(var_3_4)

	local var_3_5

	if user.jpsIndex == 0 then
		var_3_5 = "thumbnailXiaoditu.jpg"
	elseif user.isKfdy then
		var_3_5 = "thumbnailXiaodituDongying.jpg"
	elseif user.isKfgl then
		var_3_5 = "djgl_map.jpg"
	elseif user.isKfyn then
		var_3_5 = "yn_smallmap.jpg"
	elseif user.isKflq then
		var_3_5 = "lq_smallmap.jpg"
	elseif user.isKfnz then
		var_3_5 = "nz_smallmap.jpg"
	end

	local var_3_6 = CCSprite:createWithSpriteFrameName(var_3_5)

	tool.scaleTo(var_3_6, var_3_1, var_3_2)
	var_3_6:setAnchorPoint(ccp(0, 0))
	var_3_6:setPosition(ccp(0, 0))
	var_3_3:addChild(var_3_6, -1)

	arg_3_0.cityBatchNode = CCSpriteBatchNode:create("res/ui/world/worldBuilding.png")

	var_3_3:addChild(arg_3_0.cityBatchNode, 2)

	arg_3_0.eventNode = CCNode:create()

	var_3_3:addChild(arg_3_0.eventNode, 3)

	arg_3_0.yzMoveLayer = var_0_10.new(user.isKfyn)

	var_3_3:addChild(arg_3_0.yzMoveLayer, 4)

	arg_3_0.cityTable = {}
	arg_3_0.cityEventTable = {}

	local var_3_7 = "world_building_"

	if user.jpsIndex > 0 then
		local var_3_8 = 0
		local var_3_9 = 0

		if user.isKfdy then
			var_3_8, var_3_9 = 4001, 4045
		elseif user.isKfgl then
			var_3_8, var_3_9 = 5001, 5046
		elseif user.isKfyn then
			var_3_8, var_3_9 = 6001, 6046
		elseif user.isKflq then
			var_3_8, var_3_9 = 7001, 7056
		elseif user.isKfnz then
			var_3_8, var_3_9 = 8001, 8050
		end

		for iter_3_0 = var_3_8, var_3_9 do
			local var_3_10 = worldDongyingConstant.BUILDING_INFO[var_3_7 .. iter_3_0]

			if var_3_10 then
				local var_3_11 = CCSprite:createWithSpriteFrameName(var_3_10.model)

				arg_3_0.cityTable[iter_3_0] = arg_3_0.cityTable[iter_3_0] or {}
				arg_3_0.cityTable[iter_3_0].sprite = var_3_11

				local var_3_12 = var_3_11:getContentSize()
				local var_3_13 = var_3_10.x
				local var_3_14 = var_3_2 - var_3_10.y

				var_3_11:setPosition(ccp(var_3_13, var_3_14))
				arg_3_0.cityBatchNode:addChild(var_3_11, 110)

				local var_3_15 = CCSprite:createWithSpriteFrameName("cc_view_bg.png")

				var_3_15:setPosition(ccp(var_3_13, var_3_14 - 50))
				arg_3_0.cityBatchNode:addChild(var_3_15, 111)

				local var_3_16 = CCSprite:createWithSpriteFrameName("dy_" .. iter_3_0 .. ".png")

				var_3_16:setPosition(ccp(var_3_13, var_3_14 - 50))
				arg_3_0.cityBatchNode:addChild(var_3_16, 112)
			end
		end
	else
		for iter_3_1, iter_3_2 in pairs(worldConstant.BUILDING_INFO) do
			local var_3_17 = string.sub(iter_3_1, #var_3_7 + 1, -1)
			local var_3_18 = tonumber(var_3_17)
			local var_3_19 = CCSprite:createWithSpriteFrameName(iter_3_2.model)

			arg_3_0.cityTable[var_3_18] = arg_3_0.cityTable[var_3_18] or {}
			arg_3_0.cityTable[var_3_18].sprite = var_3_19

			local var_3_20 = var_3_19:getContentSize()
			local var_3_21 = iter_3_2.x + var_3_20.width / 2
			local var_3_22 = var_3_2 - iter_3_2.y - var_3_20.height / 2

			var_3_19:setPosition(ccp(var_3_21, var_3_22))
			arg_3_0.cityBatchNode:addChild(var_3_19, 110)

			local var_3_23 = CCSprite:createWithSpriteFrameName("cc_view_bg.png")

			var_3_23:setPosition(ccp(var_3_21, var_3_22 - 50))
			arg_3_0.cityBatchNode:addChild(var_3_23, 111)

			local var_3_24 = CCSprite:createWithSpriteFrameName("cc_" .. var_3_18 .. ".png")

			var_3_24:setPosition(ccp(var_3_21, var_3_22 - 50))
			arg_3_0.cityBatchNode:addChild(var_3_24, 112)

			if user.kfyzWorldId == 9 and worldMianzhanConstant.BUILDING_INFO["world_building_" .. var_3_18] then
				local var_3_25 = worldMianzhanConstant.BUILDING_INFO["world_building_" .. var_3_18].model

				if var_3_25 == "worldBuildingGuanqia1.png" then
					local var_3_26 = CCSprite:createWithSpriteFrameName("word_lock_old_02.png")

					var_3_26:setPosition(ccp(var_3_21, var_3_22))
					arg_3_0.cityBatchNode:addChild(var_3_26, 115)
				elseif var_3_25 == "worldBuildingGuanqia2.png" then
					local var_3_27 = CCSprite:createWithSpriteFrameName("word_lock_old_03.png")

					var_3_27:setPosition(ccp(var_3_21, var_3_22))
					arg_3_0.cityBatchNode:addChild(var_3_27, 115)
				elseif var_3_25 == "worldBuildingGuanqia3.png" then
					local var_3_28 = CCSprite:createWithSpriteFrameName("word_lock_old_01.png")

					var_3_28:setPosition(ccp(var_3_21, var_3_22))
					arg_3_0.cityBatchNode:addChild(var_3_28, 115)
				end

				local var_3_29 = CCSprite:createWithSpriteFrameName("yzxms_icon_mz_c.png")

				var_3_29:setPosition(ccp(var_3_21, var_3_22 + 50))
				arg_3_0.cityBatchNode:addChild(var_3_29, 116)

				local var_3_30 = CCSprite:createWithSpriteFrameName("yzxms_word_yzmz.png")

				var_3_30:setPosition(ccp(var_3_21, var_3_22 + 20))
				arg_3_0.cityBatchNode:addChild(var_3_30, 117)

				local var_3_31 = CCArray:create()

				var_3_31:addObject(CCFadeIn:create(0.5))
				var_3_31:addObject(CCFadeOut:create(0.5))

				local var_3_32 = CCSequence:create(var_3_31)

				var_3_29:runAction(CCRepeatForever:create(var_3_32))
			end
		end
	end

	arg_3_0.effectLayer = var_0_8.new(arg_3_0.world, arg_3_0)

	arg_3_0:addChild(arg_3_0.effectLayer, 3)
end

function var_0_4.handlerGetWorldMapAction(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.data = arg_7_1.data
	var_0_3 = {}

	if arg_7_2 and arg_7_2 == true then
		log.info("不需要更新generalMoveLayer")
	else
		if arg_7_0.generalMoveLayer and not tolua.isnull(arg_7_0.generalMoveLayer) then
			arg_7_0:removeChild(arg_7_0.generalMoveLayer, true)
		end

		arg_7_0.generalMoveLayer = require("lua/layer/world/generalMoveLayer").show()

		arg_7_0.worldLayer:addChild(arg_7_0.generalMoveLayer, 5)
	end

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.data.city) do
		arg_7_0:changeCity(iter_7_1, arg_7_2)
	end

	if arg_7_0.data.sdCities and #arg_7_0.data.sdCities > 0 then
		for iter_7_2, iter_7_3 in ipairs(arg_7_0.data.sdCities) do
			arg_7_0:changeCity({
				isInSd = 1,
				id = iter_7_3
			})
		end
	end

	for iter_7_4, iter_7_5 in pairs(arg_7_1.data.changeRoad) do
		arg_7_0.hiddenRoad[iter_7_5.id].sprite:setVisible(iter_7_5.connect == 0)
	end

	if arg_7_0.data.slaughterInfo then
		for iter_7_6 = 1, #arg_7_0.data.slaughterInfo do
			log.info("add tucheng")
			arg_7_0:addTucheng(arg_7_0.data.slaughterInfo[iter_7_6])
		end
	end

	arg_7_0.effectLayer:handlerGetWorldMapAction(arg_7_1)

	if user.isKfnz then
		if arg_7_0.data.keyCities then
			for iter_7_7, iter_7_8 in pairs(arg_7_0.data.keyCities) do
				iter_7_8.hasLock = false

				for iter_7_9, iter_7_10 in pairs(iter_7_8.slaveCities) do
					if iter_7_10.occupied then
						arg_7_0:clearLock(iter_7_8.cityId, iter_7_10.cityId)
					else
						arg_7_0:drawLock(iter_7_8.cityId, iter_7_10.cityId)

						iter_7_8.hasLock = true
					end
				end

				arg_7_0:addNzEvent(iter_7_8.cityId, iter_7_8, 0)
			end
		end

		if arg_7_0.data.keyCityState and arg_7_0.data.keyCityState == 1 then
			local var_7_0 = arg_7_0.cityTable[8050]

			if var_7_0 then
				local var_7_1, var_7_2 = var_7_0.sprite:getPosition()

				arg_7_0.cityEventTable[8050] = var_7_0

				if var_7_0.eventSprite and not tolua.isnull(var_7_0.eventSprite) then
					var_7_0.eventSprite:removeFromParentAndCleanup(true)

					var_7_0.eventSprite = nil
				end

				var_7_0.eventSprite = CCSprite:create("res/ui/world/worldEventBtn1.png")

				var_7_0.eventSprite:setPosition(ccp(var_7_1, var_7_2 + 160))
				arg_7_0.eventNode:addChild(var_7_0.eventSprite)

				local var_7_3 = var_7_0.eventSprite:getContentSize()
				local var_7_4 = CCSprite:create("res/ui/kfyz/nzKing.jpg")

				var_7_4:setPosition(var_7_3.width / 2, var_7_3.height / 2)
				var_7_4:setScale(0.85)
				var_7_0.eventSprite:addChild(var_7_4)
			end
		end
	end
end

function var_0_4.handlerGetSTaskInfoAction(arg_8_0, arg_8_1)
	arg_8_0.effectLayer:handlerGetSTaskInfoAction(arg_8_1)

	if arg_8_1.data then
		user.kfyz.KfyzTaskVO = arg_8_1.data

		eventManager.dispatchEvent("kfntTaskInfoUpdate", user.kfyz.KfyzTaskVO)
	end
end

function var_0_4.fightBackEffect(arg_9_0)
	local var_9_0 = {
		123,
		19,
		207
	}
	local var_9_1 = user.player.forceId

	if user.player.kfgzForceId == 1001 then
		var_9_1 = 1 + user.player.forceId % 3
	end

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.data.city) do
		if iter_9_1.force == var_9_1 then
			local var_9_2 = arg_9_0.cityTable[iter_9_1.id]

			if var_9_2 then
				local var_9_3, var_9_4 = var_9_2.sprite:getPosition()
				local var_9_5 = CCSprite:create("res/ui/kfyz/yzxzb_word_bsyz.png")

				var_9_5:setPosition(ccp(var_9_3, var_9_4))
				smgr.showSpriteText(arg_9_0.worldLayer, var_9_5)
			end
		end
	end
end

function var_0_4.updateFightBackButton(arg_10_0, arg_10_1)
	local var_10_0 = {
		123,
		19,
		207
	}
	local var_10_1 = user.player.forceId

	if user.player.kfgzForceId == 1001 then
		var_10_1 = 1 + user.player.forceId % 3
	end

	local var_10_2 = var_10_0[var_10_1]
	local var_10_3 = arg_10_0.cityTable[var_10_2]

	if not var_10_3 then
		return
	end

	local var_10_4, var_10_5 = var_10_3.sprite:getPosition()

	if arg_10_0.fightBackLayer then
		if arg_10_1 == 0 then
			arg_10_0.fightBackLayer:removeFromParentAndCleanup(true)

			arg_10_0.fightBackLayer = nil
		end
	elseif arg_10_1 > 0 then
		local var_10_6 = {
			name = "layer",
			scale = 0.8,
			type = "layer",
			x = var_10_4,
			y = var_10_5 - 100,
			children = {
				{
					w = 132,
					name = "fightBackBtn",
					h = 100,
					type = "button",
					y = 0,
					x = 0,
					normal = {
						path = "res/ui/kfyz/yzxzb_btn_bsyz.png"
					},
					touched = {
						path = "res/ui/kfyz/yzxzb_btn_bsyz_c.png"
					}
				}
			}
		}
		local var_10_7 = {}

		uiutil.initWidgets(var_10_7, var_10_6)
		arg_10_0.worldLayer:addChild(var_10_7.widgets.layer, 6)

		arg_10_0.fightBackLayer = var_10_7.widgets.layer

		var_10_7.widgets.fightBackBtn:addHandleOfControlEvent(function()
			log.info("fightBackBtn")
			messageBox.confirm(language.get(216362), function()
				kfcmgr.sendRequest(function(...)
					user.fbTokenNum = 0

					arg_10_0:updateFightBackButton(user.fbTokenNum)
				end, actions.useTool, 0, 4)
			end)
		end, CCControlEventTouchUpInside)
	end
end

function var_0_4.showFightBackPic(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.cityTable[arg_14_1]

	if not var_14_0 then
		return
	end

	local var_14_1, var_14_2 = var_14_0.sprite:getPosition()
	local var_14_3 = CCSprite:create("res/ui/resourceArea2/zcgz_btn_round.png")
	local var_14_4 = CCSprite:create("res/ui/common/fightPic/fightPic_yuanzhengjun.png")

	var_14_4:setScale(0.7)
	var_14_4:setPosition(ccp(var_14_3:getContentSize().width * 0.5, var_14_3:getContentSize().height * 0.5))
	var_14_3:addChild(var_14_4)
	var_14_3:setPosition(ccp(var_14_1, var_14_2 + 60))
	arg_14_0.worldLayer:addChild(var_14_3, 6)
	NewScheduler(3, function(...)
		if var_14_3 and not tolua.isnull(var_14_3) then
			var_14_3:removeFromParentAndCleanup(true)

			var_14_3 = nil
		end
	end)
end

function var_0_4.changeCity(arg_16_0, arg_16_1, arg_16_2)
	if arg_16_0.warOptionTable and not arg_16_0.warOptionTable.isClosed and tonumber(arg_16_0.warOptionTable.cityId) == tonumber(arg_16_1.id) and arg_16_1.cityState and arg_16_1.cityState ~= 1 then
		arg_16_0.warOptionTable.optionClosed()
	end

	local var_16_0 = arg_16_1.id
	local var_16_1 = arg_16_0.cityTable[var_16_0]

	log.info("=========changeCity cityId===============")
	log.info(var_16_0)

	if not var_16_1 then
		return
	end

	local var_16_2, var_16_3 = var_16_1.sprite:getPosition()

	if arg_16_1.cityState then
		if var_16_1.fireSprite and not tolua.isnull(var_16_1.fireSprite) then
			var_16_1.fireSprite:removeFromParentAndCleanup(true)

			var_16_1.fireSprite = nil
		end

		if arg_16_1.cityState == 0 and not arg_16_2 then
			eventManager.dispatchEvent("KfgzJoinOrderToken", var_16_0)
			eventManager.dispatchEvent("KfgzJoinOfficerToken", var_16_0)
		end

		if arg_16_1.cityState == 1 then
			var_16_1.fireSprite = CCSprite:createWithSpriteFrameName("worldFire_00000.png")

			var_16_1.fireSprite:setPosition(ccp(var_16_2, var_16_3 + 40))

			local var_16_4 = CCArray:create()

			for iter_16_0 = 0, 4 do
				var_16_4:addObject(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("worldFire_0000" .. iter_16_0 .. ".png"))
			end

			local var_16_5 = CCAnimation:createWithSpriteFrames(var_16_4, 0.1)
			local var_16_6 = CCAnimate:create(var_16_5)
			local var_16_7 = CCRepeatForever:create(var_16_6)
			local var_16_8 = CCRepeatForever:create(var_16_7)

			var_16_1.fireSprite:runAction(var_16_8)
			arg_16_0.cityBatchNode:addChild(var_16_1.fireSprite, 113)
		end
	end

	if arg_16_1.force then
		local var_16_9 = var_16_1.flagSprite
		local var_16_10 = var_0_0[arg_16_1.force] or var_0_0[4]

		if user.jpsIndex > 0 then
			if arg_16_1.force ~= 1001 then
				var_16_10 = var_0_0[4]
			end

			if user.isKfyn then
				if arg_16_1.force > 1000 then
					var_16_10 = var_0_0[user.player.forceId]
				elseif arg_16_1.force < 1000 then
					var_16_10 = var_0_0[1001]
				end
			end
		end

		if var_16_9 and not tolua.isnull(var_16_9) then
			var_16_9:setDisplayFrame(tool.spriteFrameByName(var_16_10))
		else
			local var_16_11 = CCSprite:createWithSpriteFrameName(var_16_10)

			var_16_11:setAnchorPoint(ccp(0.5, 0))
			var_16_11:setPosition(ccp(var_16_2 - 50, var_16_3 - 50 - 13))
			arg_16_0.cityBatchNode:addChild(var_16_11, 113)

			var_16_1.flagSprite = var_16_11
		end
	end

	if arg_16_1.ruined then
		local var_16_12 = arg_16_0.cityTable[var_16_0].sprite
		local var_16_13

		if user.jpsIndex ~= 0 then
			var_16_13 = worldDongyingConstant.BUILDING_INFO["world_building_" .. var_16_0].model
		else
			var_16_13 = worldConstant.BUILDING_INFO["world_building_" .. var_16_0].model
		end

		var_16_13 = var_16_13 == "worldBuildingPingyuan.png" and "worldBuildingTuCheng_pingyuan.png" or var_16_13 == "worldBuildingShandi.png" and "worldBuildingTuCheng_shandi.png" or var_16_13 == "worldBuildingShuidi1.png" and "worldBuildingTuCheng_shuiyu.png" or var_16_13 == "worldBuildingGuanqia1.png" and "worldBuildingTuCheng1.png" or var_16_13 == "worldBuildingGuanqia2.png" and "worldBuildingTuCheng2.png" or var_16_13 == "worldBuildingGuanqia3.png" and "worldBuildingTuCheng3.png" or "worldBuildingTuCheng4.png"

		var_16_12:setDisplayFrame(tool.spriteFrameByName(var_16_13))
	end

	if arg_16_2 and var_16_1.eventSprite and not tolua.isnull(var_16_1.eventSprite) and not var_0_3[var_16_0] then
		var_16_1.eventSprite:removeFromParentAndCleanup(true)

		var_16_1.eventSprite = nil
	end

	if arg_16_1.enduranceState then
		if var_16_1.eventSprite and not tolua.isnull(var_16_1.eventSprite) then
			var_16_1.eventSprite:removeFromParentAndCleanup(true)

			var_16_1.eventSprite = nil
		end

		if arg_16_1.enduranceState == 2 or arg_16_1.enduranceState == 3 then
			var_16_1.eventSprite = CCSprite:create("res/ui/world/worldEventBtn1.png")

			var_16_1.eventSprite:setPosition(ccp(var_16_2, var_16_3 + 90))
			arg_16_0.eventNode:addChild(var_16_1.eventSprite)

			local var_16_14 = var_16_1.eventSprite:getContentSize()
			local var_16_15 = CCSprite:create("res/ui/common/generalPic/generalPic_yuanzhengjun.jpg")

			var_16_15:setPosition(var_16_14.width / 2, var_16_14.height / 2)
			var_16_15:setScale(0.85)
			var_16_1.eventSprite:addChild(var_16_15)

			local var_16_16 = arg_16_1.enduranceState == 2 and "kfyz_icon_min.png" or "kfyz_icon_yu.png"
			local var_16_17 = CCSprite:create("res/ui/kfyz/" .. var_16_16)

			var_16_17:setScale(0.7)
			var_16_17:setPosition(var_16_14.width, 0)
			var_16_17:setAnchorPoint(ccp(1, 0))

			if user.jpsIndex > 0 then
				-- block empty
			else
				var_16_1.eventSprite:addChild(var_16_17)
			end
		end

		if user.jpsIndex > 0 then
			local var_16_18 = CCStrokeLabelTTF:create(language.get("222422_dongying"), "Thonburi-Bold", 22)
			local var_16_19 = var_16_1.eventSprite:getContentSize()

			var_16_18:setPosition(var_16_19.width, 0)
			var_16_18:setAnchorPoint(ccp(1, 0))
			var_16_1.eventSprite:addChild(var_16_18)
		end
	end

	if arg_16_1.isInSd then
		if var_16_1.eventSprite and not tolua.isnull(var_16_1.eventSprite) then
			var_16_1.eventSprite:removeFromParentAndCleanup(true)

			var_16_1.eventSprite = nil
		end

		if arg_16_1.isInSd == 1 then
			var_16_1.eventSprite = CCSprite:create("res/ui/world/worldEventBtn1.png")

			var_16_1.eventSprite:setPosition(ccp(var_16_2, var_16_3 + 90))
			arg_16_0.eventNode:addChild(var_16_1.eventSprite)

			local var_16_20 = var_16_1.eventSprite:getContentSize()
			local var_16_21 = CCSprite:create("res/ui/kfyz/taobing.jpg")

			var_16_21:setPosition(var_16_20.width / 2, var_16_20.height / 2)
			var_16_21:setScale(0.85)
			var_16_1.eventSprite:addChild(var_16_21)
		end
	end

	if arg_16_1.cityS or arg_16_1.force == user.player.kfgzForceId then
		if var_16_1.attackSprite and not tolua.isnull(var_16_1.attackSprite) then
			var_16_1.attackSprite:removeFromParentAndCleanup(true)

			var_16_1.attackSprite = nil
		end

		if arg_16_1.cityS == 1 and not var_0_2[var_16_0] then
			local var_16_22 = CCSprite:createWithSpriteFrameName("worldDaojian.png")

			var_16_22:setPosition(ccp(var_16_2, var_16_3))

			var_16_1.attackSprite = var_16_22

			arg_16_0.cityBatchNode:addChild(var_16_22, 113)
		end
	end

	if arg_16_1.slaveInfo then
		if var_16_1.eventSprite and not tolua.isnull(var_16_1.eventSprite) then
			var_16_1.eventSprite:removeFromParentAndCleanup(true)

			var_16_1.eventSprite = nil
		end

		if arg_16_1.slaveInfo.nextTime then
			var_16_1.eventSprite = CCSprite:create("res/ui/kfyz/kfyz_word_bg.png")

			var_16_1.eventSprite:setPosition(ccp(var_16_2, var_16_3 + 90))
			arg_16_0.eventNode:addChild(var_16_1.eventSprite)

			local var_16_23 = CCSprite:create("res/ui/kfyz/yzdy_icon_yuan.png")
			local var_16_24 = createTimerLabel(arg_16_1.slaveInfo.nextTime, "@M:@S", "Thonburi", 22, nil, nil, nil, colorTips.red)
			local var_16_25

			if user.isKfdy then
				var_16_25 = "222419_dongying"
			elseif user.isKfgl then
				var_16_25 = 226039
			end

			local var_16_26 = CCLabelTTF:create(language.get(var_16_25), "Thonburi", 18)

			var_16_23:setPosition(ccp(10, 29))
			var_16_24:setPosition(ccp(63, 29))
			var_16_26:setPosition(ccp(185, 29))
			var_16_1.eventSprite:addChild(var_16_23)
			var_16_1.eventSprite:addChild(var_16_24)
			var_16_1.eventSprite:addChild(var_16_26)
		end
	end

	if (user.isKfdy or user.isKfyn) and arg_16_1.mainInfo then
		arg_16_0.cityEventTable[var_16_0] = arg_16_1.mainInfo

		if var_16_1.eventSprite and not tolua.isnull(var_16_1.eventSprite) then
			var_16_1.eventSprite:removeFromParentAndCleanup(true)

			var_16_1.eventSprite = nil
		end

		if arg_16_1.mainInfo.pic then
			var_16_1.eventSprite = CCSprite:create("res/ui/world/worldEventBtn1.png")

			var_16_1.eventSprite:setPosition(ccp(var_16_2, var_16_3 + 90))
			arg_16_0.eventNode:addChild(var_16_1.eventSprite)

			local var_16_27 = var_16_1.eventSprite:getContentSize()
			local var_16_28 = CCSprite:create("res/ui/common/generalPic/generalPic_" .. arg_16_1.mainInfo.pic .. ".jpg")

			var_16_28:setPosition(var_16_27.width / 2, var_16_27.height / 2)
			var_16_28:setScale(0.85)
			var_16_1.eventSprite:addChild(var_16_28)

			if arg_16_1.mainInfo.attackingPlayer then
				local var_16_29 = CCStrokeLabelTTF:create(language.get("222423_dongying", arg_16_1.mainInfo.attackingPlayer), "Thonburi", 20, 2)

				var_16_1.eventSprite:addChild(var_16_29)
				var_16_29:setPosition(ccp(var_16_27.width / 2, var_16_27.height + 10))
				var_16_29:setColor(ccc3(255, 0, 0))
			end
		end
	end

	if user.isKfgl and arg_16_1.cityEvent then
		arg_16_0.cityEventTable[var_16_0] = arg_16_1.cityEvent

		if var_16_1.eventSprite and not tolua.isnull(var_16_1.eventSprite) then
			var_16_1.eventSprite:removeFromParentAndCleanup(true)

			var_16_1.eventSprite = nil
		end

		if arg_16_1.cityEvent.pic then
			var_16_1.eventSprite = CCSprite:create("res/ui/world/worldEventBtn1.png")

			var_16_1.eventSprite:setPosition(ccp(var_16_2, var_16_3 + 90))
			arg_16_0.eventNode:addChild(var_16_1.eventSprite)

			local var_16_30 = var_16_1.eventSprite:getContentSize()
			local var_16_31 = CCSprite:create("res/ui/common/generalPic/generalPic_" .. arg_16_1.cityEvent.pic .. ".jpg")

			var_16_31:setPosition(var_16_30.width / 2, var_16_30.height / 2)
			var_16_31:setScale(0.85)
			var_16_1.eventSprite:addChild(var_16_31)
		end
	end

	if arg_16_1.wanaInfo then
		arg_16_0:addTrap(arg_16_1.wanaInfo)
	end

	arg_16_0:changeVietmainInfo(arg_16_1)
	arg_16_0:changeVietslaveInfo(arg_16_1)

	if user.isKfnz and arg_16_1.cityEvent then
		var_0_3[arg_16_1.cityEvent.cityId] = true

		arg_16_0:addNzEvent(arg_16_1.cityEvent.cityId, arg_16_1.cityEvent, 1)
	end
end

function var_0_4.handlerPushNanZhao(arg_17_0, arg_17_1)
	if arg_17_1.tujin and user.kfnzData.keyEvents and #user.kfnzData.keyEvents > 0 then
		for iter_17_0, iter_17_1 in pairs(user.kfnzData.keyEvents) do
			if iter_17_1.cityId == arg_17_1.tujin.tujinCity then
				iter_17_1.nextTime = arg_17_1.tujin.nextTime

				if iter_17_1.nextTime and iter_17_1.nextTime > 0 then
					arg_17_0:addNzEvent(cityId, {
						type = "fytj",
						cityId = iter_17_1.cityId,
						nextTime = iter_17_1.nextTime
					}, 1)
				end
			end
		end
	end
end

function var_0_4.addNzEvent(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	if arg_18_3 == 0 then
		local var_18_0 = arg_18_0.cityTable[arg_18_1]

		if var_18_0 then
			local var_18_1, var_18_2 = var_18_0.sprite:getPosition()

			arg_18_0.cityEventTable[arg_18_1] = var_18_0

			if var_18_0.eventSprite and not tolua.isnull(var_18_0.eventSprite) then
				var_18_0.eventSprite:removeFromParentAndCleanup(true)

				var_18_0.eventSprite = nil
			end

			var_18_0.eventSprite = CCSprite:create("res/ui/world/worldEventBtn1.png")

			var_18_0.eventSprite:setPosition(ccp(var_18_1, var_18_2 + 90))
			arg_18_0.eventNode:addChild(var_18_0.eventSprite)

			local var_18_3 = var_18_0.eventSprite:getContentSize()
			local var_18_4 = CCSprite:create("res/ui/kfyz/nzJiang.jpg")

			var_18_4:setPosition(var_18_3.width / 2, var_18_3.height / 2)
			var_18_4:setScale(0.85)
			var_18_0.eventSprite:addChild(var_18_4)

			local var_18_5 = CCMenu:create()

			var_18_5:setPosition(var_18_3.width / 2, var_18_3.height / 2)
			var_18_0.eventSprite:addChild(var_18_5)

			local var_18_6 = CCSprite:create("res/default.png")
			local var_18_7 = CCSprite:create("res/default.png")
			local var_18_8 = CCMenuItemSprite:create(var_18_6, var_18_7)

			var_18_8:setScale(18)
			var_18_5:addChild(var_18_8, 10)

			if not arg_18_2.hasLock then
				local var_18_9 = CCStrokeLabelTTF:create(language.get(218017), "Thonburi", 20, 2)

				var_18_0.eventSprite:addChild(var_18_9)
				var_18_9:setPosition(ccp(var_18_3.width / 2, var_18_3.height - 85))
				var_18_9:setColor(ccc3(0, 255, 0))
			end

			local function var_18_10(arg_19_0)
				local var_19_0 = require("lua/component/TipPanel")

				var_19_0:create(var_18_0.eventSprite, {
					arg_19_0
				})
				var_19_0:setPosition(ccp(333, 100))
			end

			var_18_8:registerScriptTapHandler(function()
				var_18_10(language.get(218018, arg_18_0:getJiang(arg_18_1)))
			end)
		end
	else
		local var_18_11 = arg_18_0.cityTable[arg_18_2.cityId]

		if var_18_11 then
			local var_18_12, var_18_13 = var_18_11.sprite:getPosition()

			arg_18_0.cityEventTable[arg_18_2.cityId] = var_18_11

			if var_18_11.eventSprite and not tolua.isnull(var_18_11.eventSprite) then
				var_18_11.eventSprite:removeFromParentAndCleanup(true)

				var_18_11.eventSprite = nil
			end

			if arg_18_2.type == "bgsg" then
				var_18_11.eventSprite = CCSprite:createWithSpriteFrameName("yzxms_icon_mz_c.png")

				var_18_11.eventSprite:setPosition(ccp(var_18_12, var_18_13))
				arg_18_0.eventNode:addChild(var_18_11.eventSprite)
			elseif arg_18_2.type == "fytj" then
				var_18_11.eventSprite = CCSprite:create("res/ui/world/worldEventBtn1.png")

				var_18_11.eventSprite:setPosition(ccp(var_18_12, var_18_13 + 90))
				arg_18_0.eventNode:addChild(var_18_11.eventSprite)

				local var_18_14 = var_18_11.eventSprite:getContentSize()
				local var_18_15 = CCSprite:create("res/ui/kfyz/nzJiang.jpg")

				var_18_15:setPosition(var_18_14.width / 2, var_18_14.height / 2)
				var_18_15:setScale(0.85)
				var_18_11.eventSprite:addChild(var_18_15)

				if arg_18_2.nextTime and arg_18_2.nextTime > 0 then
					local var_18_16 = createTimerLabel(arg_18_2.nextTime, "@M:@S" .. language.get(218016), "Thonburi", 18, function()
						return
					end, nil, nil, ccc3(0, 255, 0))

					var_18_16:setAnchorPoint(ccp(0.5, 0.5))
					var_18_16:setPosition(ccp(35, -10))
					var_18_11.eventSprite:addChild(var_18_16)
				end
			end
		end
	end
end

function var_0_4.getJiang(arg_22_0, arg_22_1)
	local var_22_0 = ""

	if arg_22_1 == 8036 or arg_22_1 == 8023 then
		var_22_0 = language.get(218012)
	elseif arg_22_1 == 8037 or arg_22_1 == 8024 then
		var_22_0 = language.get(218011)
	elseif arg_22_1 == 8039 or arg_22_1 == 8025 then
		var_22_0 = language.get(218013)
	end

	return var_22_0
end

function var_0_4.addLQCityEventUpdate(arg_23_0)
	if user.isKflq and user.kflqData.rightEventList then
		for iter_23_0, iter_23_1 in pairs(user.kflqData.rightEventList) do
			if iter_23_1 and iter_23_1.palaceCityId and iter_23_1.palaceCityId > 0 then
				arg_23_0:addLQCityEvent(iter_23_1.palaceCityId)
			else
				arg_23_0.world.menuLayer:lqwXZ()
			end
		end
	end
end

function var_0_4.addLQCityEvent(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0.cityTable[arg_24_1]

	if var_24_0 then
		local var_24_1, var_24_2 = var_24_0.sprite:getPosition()

		arg_24_0.cityEventTable[arg_24_1] = var_24_0

		if var_24_0.eventSprite and not tolua.isnull(var_24_0.eventSprite) then
			var_24_0.eventSprite:removeFromParentAndCleanup(true)

			var_24_0.eventSprite = nil
		end

		var_24_0.eventSprite = CCSprite:create("res/ui/world/worldEventBtn1.png")

		var_24_0.eventSprite:setPosition(ccp(var_24_1, var_24_2 + 90))
		arg_24_0.eventNode:addChild(var_24_0.eventSprite)

		local var_24_3 = var_24_0.eventSprite:getContentSize()
		local var_24_4 = CCSprite:create("res/ui/kfyz/lqw.jpg")

		var_24_4:setPosition(var_24_3.width / 2, var_24_3.height / 2)
		var_24_4:setScale(0.85)
		var_24_0.eventSprite:addChild(var_24_4)

		function playEnd()
			arg_24_0:removeCityEvent(arg_24_1)

			if user.kflqData.joinFun == "kflqState3" or user.kflqData.joinFun == "kflqState6" then
				arg_24_0.world.menuLayer:lqwXZ()
			end
		end

		if user.kflqData.joinFun == "kflqState3" or user.kflqData.joinFun == "kflqState6" then
			local var_24_5 = CCSprite:create("res/ui/kfyz/yzlq_icon_prison.png")

			var_24_5:setPosition(var_24_3.width / 2, var_24_3.height / 2)
			var_24_5:setScale(0.85)
			var_24_0.eventSprite:addChild(var_24_5)
			roleDialogue.control.loadSpeak("kflq1006")
			notice.control.flyImage("res/ui/kfyz/yzlq_word_qhlq.png", var_24_0.eventSprite, playEnd)
		elseif user.kflqData.joinFun == "kflqState4" then
			roleDialogue.control.loadSpeak("kflq1007")
			notice.control.flyImage("res/ui/kfyz/yzlq_word_lqwtz.png", var_24_0.eventSprite, nil)
		end

		local var_24_6 = CCStrokeLabelTTF:create(language.get(215606), "Thonburi", 20, 2)

		var_24_0.eventSprite:addChild(var_24_6)
		var_24_6:setPosition(ccp(var_24_3.width / 2, var_24_3.height - 80))
	end
end

function var_0_4.changeVietslaveInfo(arg_26_0, arg_26_1)
	if user.isKfyn and arg_26_1.vietslaveInfo then
		arg_26_0.yzMoveLayer:initMarchingInfo(arg_26_1.vietslaveInfo, arg_26_0.cityTable)
	end
end

function var_0_4.changeVietmainInfo(arg_27_0, arg_27_1)
	if user.isKfyn then
		local var_27_0 = arg_27_1.id or arg_27_1.cityId
		local var_27_1 = arg_27_0.cityTable[var_27_0]

		if not var_27_1 then
			return
		end

		local var_27_2, var_27_3 = var_27_1.sprite:getPosition()

		if arg_27_1.vietmainInfo then
			arg_27_0.cityEventTable[var_27_0] = arg_27_1.vietmainInfo

			if var_27_1.eventSprite and not tolua.isnull(var_27_1.eventSprite) then
				var_27_1.eventSprite:removeFromParentAndCleanup(true)

				var_27_1.eventSprite = nil
			end

			if arg_27_1.vietmainInfo then
				var_27_1.eventSprite = CCSprite:create("res/ui/kfworld/swjz_word_di01.png")

				var_27_1.eventSprite:setPosition(ccp(var_27_2, var_27_3 + 50))
				arg_27_0.eventNode:addChild(var_27_1.eventSprite)

				local var_27_4 = CCSprite:create("res/ui/world/newleague/mzjm_di_round_2.png")

				var_27_4:setPosition(0, 21)
				var_27_1.eventSprite:addChild(var_27_4)

				local var_27_5 = CCSprite:create("res/ui/kfyz/swjz_word_" .. arg_27_1.vietmainInfo.phantomType .. ".png")

				var_27_5:setPosition(0, 21)
				var_27_1.eventSprite:addChild(var_27_5)

				if arg_27_1.vietmainInfo.state == 3 then
					local var_27_6 = language.get(136828, arg_27_1.vietmainInfo.nextCity)

					if arg_27_1.vietmainInfo.nextTime and arg_27_1.vietmainInfo.nextTime > 0 then
						local var_27_7 = createTimerLabel(arg_27_1.vietmainInfo.nextTime, "@M:@S" .. var_27_6, "Thonburi", 18, function()
							return
						end, nil, nil, ccc3(0, 255, 0))

						var_27_7:setAnchorPoint(ccp(0.5, 0.5))
						var_27_7:setPosition(ccp(145, 21))
						var_27_1.eventSprite:addChild(var_27_7)
					end
				elseif arg_27_1.vietmainInfo.state == 4 then
					local var_27_8 = CCStrokeLabelTTF:create(language.get(226053), "Thonburi", 20, 2)

					var_27_1.eventSprite:addChild(var_27_8)
					var_27_8:setPosition(ccp(145, 21))
				elseif arg_27_1.vietmainInfo.state == 5 then
					local var_27_9 = CCStrokeLabelTTF:create(language.get(136826), "Thonburi", 20, 2)

					var_27_1.eventSprite:addChild(var_27_9)
					var_27_9:setPosition(ccp(145, 21))
				end
			end
		end
	end
end

function var_0_4.addTrap(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_1.teamId
	local var_29_1 = arg_29_0.cityTable[var_29_0]

	if not var_29_1 then
		return
	end

	local var_29_2, var_29_3 = var_29_1.sprite:getPosition()

	if var_29_1.trapSprite and not tolua.isnull(var_29_1.trapSprite) then
		var_29_1.trapSprite:removeFromParentAndCleanup(true)

		var_29_1.trapSprite = nil
	end

	if arg_29_1.startCd <= 0 and arg_29_1.endCd <= 0 then
		return
	end

	var_29_1.trapSprite = CCSprite:create()

	local var_29_4, var_29_5 = var_29_1.sprite:getPosition()

	var_29_1.trapSprite:setPosition(ccp(var_29_4, var_29_5))
	arg_29_0.eventNode:addChild(var_29_1.trapSprite)

	local var_29_6 = rmgr.getAnimation("huizhan_lv_5")
	local var_29_7 = CCAnimation:createWithSpriteFrames(var_29_6, 0.05)
	local var_29_8 = CCAnimate:create(var_29_7)
	local var_29_9 = CCRepeatForever:create(var_29_8)
	local var_29_10 = CCSprite:create()

	var_29_10:setPosition(ccp(0, 0))
	var_29_10:runAction(var_29_9)

	if var_29_1.trapSprite then
		var_29_1.trapSprite:removeChildByTag(123, true)
		var_29_1.trapSprite:addChild(var_29_10, 1000, 123)
	end

	local var_29_11 = CCSprite:create("res/ui/kfyz/trap.png")

	var_29_11:setPosition(0, 60)
	var_29_1.trapSprite:addChild(var_29_11, 1001)

	local function var_29_12()
		arg_29_1.startCd = -1

		arg_29_0:addTrap(arg_29_1)
	end

	local function var_29_13()
		if var_29_1.trapSprite and not tolua.isnull(var_29_1.trapSprite) then
			var_29_1.trapSprite:removeFromParentAndCleanup(true)

			var_29_1.trapSprite = nil
		end
	end

	if user.player.kfgzForceId ~= arg_29_1.forceId and arg_29_1.startCd <= 0 then
		local var_29_14 = CCSprite:create("res/ui/kfyz/lock.png")

		var_29_14:setPosition(0, 15)
		var_29_14:setScale(1.5)
		var_29_1.trapSprite:addChild(var_29_14, 1001)
	end

	if arg_29_1.startCd > 0 then
		local var_29_15 = createTimerLabel(arg_29_1.startCd, language.get("224103_trap"), "Thonburi", 22, var_29_12, nil, nil, ccc3(255, 0, 0))

		var_29_15:setPosition(0, -45)
		var_29_1.trapSprite:addChild(var_29_15, 1001)
	elseif arg_29_1.endCd > 0 then
		local var_29_16 = createTimerLabel(arg_29_1.endCd, language.get("224102_trap"), "Thonburi", 22, var_29_13, nil, nil, ccc3(255, 0, 0))

		var_29_16:setPosition(0, -45)
		var_29_1.trapSprite:addChild(var_29_16, 1001)
	end
end

function var_0_4.addTucheng(arg_32_0, arg_32_1)
	if arg_32_1.cityId == nil then
		log.info("tucheng, cityId nil !!!!")

		return
	end

	local var_32_0 = arg_32_1.cityId
	local var_32_1 = arg_32_0.cityTable[var_32_0]

	if not var_32_1 then
		return
	end

	local var_32_2, var_32_3 = var_32_1.sprite:getPosition()

	if var_32_1.tuchengSprite and not tolua.isnull(var_32_1.tuchengSprite) then
		var_32_1.tuchengSprite:removeFromParentAndCleanup(true)

		var_32_1.tuchengSprite = nil
	end

	local function var_32_4(arg_33_0)
		local var_33_0 = rmgr.getAnimation("tucheng")
		local var_33_1 = CCAnimation:createWithSpriteFrames(var_33_0, 0.05)
		local var_33_2 = CCAnimate:create(var_33_1)
		local var_33_3 = CCRepeat:create(var_33_2, 1)
		local var_33_4 = CCSprite:create()

		var_33_4:setPosition(ccp(20, 20))
		var_33_4:runAction(var_33_3)

		if var_32_1.tuchengSprite then
			var_32_1.tuchengSprite:removeChildByTag(123, true)
			var_32_1.tuchengSprite:addChild(var_33_4, 1000, 123)
		end
	end

	if arg_32_1.canSlaughterTime and arg_32_1.canSlaughterTime > 0 then
		var_32_1.tuchengSprite = CCSprite:create("res/ui/kfyz/kfyz_word_bg.png")

		local var_32_5, var_32_6 = var_32_1.sprite:getPosition()

		var_32_1.tuchengSprite:setPosition(ccp(var_32_5, var_32_6 + 90))
		arg_32_0.eventNode:addChild(var_32_1.tuchengSprite)

		local var_32_7 = CCSprite:create()
		local var_32_8 = CCMenu:create()

		var_32_8:setPosition(ccp(55, 45))
		var_32_7:setPosition(ccp(0, 0))
		var_32_7:addChild(var_32_8)
		var_32_1.tuchengSprite:addChild(var_32_7)

		local var_32_9 = CCSprite:create("res/ui/world/tucheng/tcxg_city_btn.png")
		local var_32_10 = CCSprite:create("res/ui/world/tucheng/tcxg_city_btn_c.png")
		local var_32_11 = CCMenuItemSprite:create(var_32_9, var_32_10)

		var_32_11:setPosition(ccp(85, 55))
		var_32_8:addChild(var_32_11, 10)
		var_32_11:registerScriptTapHandler(function()
			log.info("kick tucheng")

			local function var_34_0(arg_35_0)
				local var_35_0 = arg_35_0.data or arg_35_0.action.data

				var_32_4(var_35_0.cityId)

				if var_35_0.rewards then
					local var_35_1 = {}

					for iter_35_0 = 1, #var_35_0.rewards do
						var_35_1[iter_35_0] = {}

						if var_35_0.rewards[iter_35_0].type == 17 then
							var_35_1[iter_35_0].id = 7
						else
							var_35_1[iter_35_0].id = var_35_0.rewards[iter_35_0].type
						end

						var_35_1[iter_35_0].value = var_35_0.rewards[iter_35_0].value
						var_35_1[iter_35_0].gemLevel = 1
					end

					globalAction_gotResource(var_35_1)
				end
			end

			kfcmgr.sendRequest(var_34_0, actions.gameserverSlaughter, arg_32_1.battleId)
		end)

		local function var_32_12()
			if var_32_1.tuchengSprite and not tolua.isnull(var_32_1.tuchengSprite) then
				var_32_1.tuchengSprite:removeFromParentAndCleanup(true)

				var_32_1.tuchengSprite = nil
			end
		end

		local var_32_13 = createTimerLabel(arg_32_1.canSlaughterTime, "@M:@S", "Thonburi", 22, var_32_12, nil, nil, ccc3(255, 0, 0))

		var_32_13:setPosition(185, 30)

		local var_32_14 = CCStrokeLabelTTF:create(language.get(122101), "Thonburi", 22)

		var_32_14:setColor(ccc3(255, 0, 0))
		var_32_14:setPosition(105, 30)

		if arg_32_1.slaughterCd and arg_32_1.slaughterCd > 0 then
			var_32_13:setVisible(false)

			local var_32_15 = createTimerLabel(arg_32_1.slaughterCd, "@M:@S", "Thonburi", 22, nil, nil, nil, ccc3(255, 255, 0))

			var_32_15:setPosition(185, 30)
			var_32_7:addChild(var_32_15)
			var_32_14:setString(language.get("122100_tucheng"))
			var_32_14:setColor(ccc3(255, 255, 0))
		end

		var_32_7:addChild(var_32_13)
		var_32_7:addChild(var_32_14)
	elseif arg_32_1.constructionTime and arg_32_1.constructionTime > 0 then
		var_32_1.tuchengSprite = CCSprite:create("res/ui/kfyz/kfyz_word_bg.png")

		local var_32_16, var_32_17 = var_32_1.sprite:getPosition()

		var_32_1.tuchengSprite:setPosition(ccp(var_32_16, var_32_17 + 90))
		arg_32_0.eventNode:addChild(var_32_1.tuchengSprite)

		local var_32_18 = CCSprite:create()

		var_32_1.tuchengSprite:addChild(var_32_18)

		local var_32_19 = arg_32_0.cityTable[var_32_0].sprite
		local var_32_20

		if user.jpsIndex ~= 0 then
			var_32_20 = worldDongyingConstant.BUILDING_INFO["world_building_" .. var_32_0].model
		else
			var_32_20 = worldConstant.BUILDING_INFO["world_building_" .. var_32_0].model
		end

		var_32_20 = var_32_20 == "worldBuildingPingyuan.png" and "worldBuildingTuCheng_pingyuan.png" or var_32_20 == "worldBuildingShandi.png" and "worldBuildingTuCheng_shandi.png" or var_32_20 == "worldBuildingShuidi1.png" and "worldBuildingTuCheng_shuiyu.png" or var_32_20 == "worldBuildingGuanqia1.png" and "worldBuildingTuCheng1.png" or var_32_20 == "worldBuildingGuanqia2.png" and "worldBuildingTuCheng2.png" or var_32_20 == "worldBuildingGuanqia3.png" and "worldBuildingTuCheng3.png" or "worldBuildingTuCheng4.png"

		var_32_19:setDisplayFrame(tool.spriteFrameByName(var_32_20))

		local function var_32_21()
			local var_37_0

			if user.jpsIndex ~= 0 then
				local var_37_1 = worldDongyingConstant.BUILDING_INFO["world_building_" .. var_32_0].model
			else
				local var_37_2 = worldConstant.BUILDING_INFO["world_building_" .. var_32_0].model
			end

			arg_32_0.cityTable[var_32_0].sprite:setDisplayFrame(tool.spriteFrameByName(var_32_1.model))

			if var_32_1.tuchengSprite and not tolua.isnull(var_32_1.tuchengSprite) then
				var_32_1.tuchengSprite:removeFromParentAndCleanup(true)

				var_32_1.tuchengSprite = nil
			end
		end

		local var_32_22 = createTimerLabel(arg_32_1.constructionTime, "@M:@S", "Thonburi", 22, var_32_21, nil, nil, ccc3(255, 0, 0))

		var_32_22:setPosition(ccp(80, 30))

		local var_32_23 = CCStrokeLabelTTF:create(language.get(122118), "Thonburi", 22)
		local var_32_24 = CCSprite:create("res/ui/world/tucheng/tcyh_icon_dao.png")
		local var_32_25 = createRichNode({
			var_32_23,
			var_32_24
		}, 0.5)

		var_32_25:setPosition(ccp(180, 30))
		var_32_18:addChild(var_32_25)
		var_32_18:addChild(var_32_22)
	end
end

function var_0_4.removeCityEvent(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_0.cityTable[arg_38_1]

	if var_38_0 and var_38_0.eventSprite and not tolua.isnull(var_38_0.eventSprite) then
		var_38_0.eventSprite:removeFromParentAndCleanup(true)

		var_38_0.eventSprite = nil
	end
end

function var_0_4.onTouch(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	if user.kfyzState ~= 1 and (user.kfyzState ~= 2 or not user.isInSd) then
		return
	end

	if arg_39_1 == CCTOUCHBEGAN then
		var_0_12 = ccp(arg_39_2, arg_39_3)

		return true
	elseif arg_39_1 == CCTOUCHMOVED then
		return true
	elseif arg_39_1 == CCTOUCHENDED then
		if ccpDistance(var_0_12, ccp(arg_39_2, arg_39_3)) > var_0_13 then
			return
		end

		local var_39_0 = eventManager.dispatchEvent("cityWindowIsOpen")

		for iter_39_0, iter_39_1 in pairs(arg_39_0.cityTable) do
			if arg_39_0.warOptionTable and not arg_39_0.warOptionTable.isClosed and tool.checkIfTouch(iter_39_1.sprite, arg_39_2, arg_39_3) then
				arg_39_0.warOptionTable.doWarAction(iter_39_0)

				return
			end

			if not var_39_0 and tool.checkIfTouch(iter_39_1.sprite, arg_39_2, arg_39_3) and not var_0_1[iter_39_0] then
				local var_39_1 = var_0_9.new(iter_39_0)
				local var_39_2, var_39_3 = arg_39_0.cityTable[iter_39_0].sprite:getPosition()

				var_39_1:setPosition(ccp(var_39_2, var_39_3))
				arg_39_0:addChild(var_39_1, 5)

				return
			end

			if not tolua.isnull(iter_39_1.eventSprite) and tool.checkIfTouch(iter_39_1.eventSprite, arg_39_2, arg_39_3) and arg_39_0.cityEventTable[iter_39_0] then
				if user.isKfdy then
					arg_39_0:showEvent(arg_39_0.cityEventTable[iter_39_0], iter_39_0)
				elseif user.isKfgl then
					arg_39_0:showEventKorea(arg_39_0.cityEventTable[iter_39_0], iter_39_0)
				elseif user.isKfyn then
					arg_39_0:showEventYn(arg_39_0.cityEventTable[iter_39_0], iter_39_0)
				end

				return
			end
		end

		kfyzWorld.memoryLocation = arg_39_0:getContentOffset()
	end
end

function var_0_4.showEventYn(arg_40_0, arg_40_1, arg_40_2)
	if not arg_40_2 or not arg_40_1 or arg_40_2 == 6046 then
		return
	end

	local var_40_0 = "manzihaiya"
	local var_40_1 = {
		y = 0,
		name = "layer",
		type = "layer",
		x = 0,
		children = {
			{
				name = "bg",
				type = "sprite9",
				y = 36,
				preferedSize = CCSizeMake(654, 190),
				middleRect = CCRectMake(110, 36, 434, 178),
				x = visibleSize.width * 0.5,
				anchorPoint = ccp(0.5, 0),
				pic = {
					path = "res/ui/activity/famous/gjms_sce_view_bg.png"
				},
				children = {
					{
						name = "btn_corps",
						h = 112,
						type = "button",
						w = 404,
						y = 64,
						x = 382,
						normal = {
							path = "res/ui/activity/famous/gjms_sce_list.jpg"
						},
						touched = {
							path = "res/ui/activity/famous/gjms_sce_list_on.jpg"
						},
						children = {
							{
								fontSize = 22,
								height = 0,
								x = 335,
								type = "label",
								y = 56,
								textId = 136834,
								width = 360,
								halign = kCCTextAlignmentLeft,
								color = ccc3(0, 255, 0)
							}
						}
					},
					{
						x = 620,
						name = "btn_close",
						h = 33,
						type = "button",
						w = 32,
						y = 216,
						scale = 2,
						normal = {
							frame = true,
							path = "btn_close_a.png"
						},
						touched = {
							frame = true,
							path = "btn_close_click.png"
						}
					},
					{
						y = 4,
						name = "generalPic",
						type = "sprite",
						x = 55,
						anchorPoint = ccp(0.5, 0),
						pic = {
							path = string.format("res/ui/common/halfPic/halfPic_%s.png", var_40_0)
						}
					},
					{
						fontSize = 22,
						height = 0,
						type = "label",
						x = 382,
						textId = 136833,
						y = 182,
						width = 400,
						halign = kCCTextAlignmentLeft,
						anchorPoint = ccp(0.5, 1)
					}
				}
			}
		}
	}
	local var_40_2 = {}

	uiutil.initWidgets(var_40_2, var_40_1)

	local var_40_3 = smgr.getLayer("topLayer")

	var_40_3:addChild(var_40_2.widgets.layer)
	swallowTouch(var_40_2.widgets.layer)
	var_40_2.widgets.btn_close:addHandleOfControlEvent(function()
		log.info("btn_close")
		var_40_2.widgets.layer:removeFromParentAndCleanup(true)
	end, CCControlEventTouchUpInside)

	local function var_40_4()
		local function var_42_0(arg_43_0)
			var_40_3:removeAllChildrenWithCleanup(true)

			local var_43_0 = arg_43_0.data

			if var_43_0.teamId then
				log.info("teamId: ", var_43_0.teamId)
				bmgr.enterKfgz(var_43_0.teamId)
			end
		end

		kfcmgr.sendRequest(var_42_0, actions.kfgzDealJpsEvent, arg_40_2)
	end

	var_40_2.widgets.btn_corps:addHandleOfControlEvent(var_40_4, CCControlEventTouchUpInside)
end

function var_0_4.getCitySprite(arg_44_0, arg_44_1)
	log.info("cityId: ", arg_44_1)

	local var_44_0 = arg_44_0.cityTable[arg_44_1]

	if var_44_0 then
		return var_44_0.sprite
	end
end

function var_0_4.generalMove(arg_45_0, arg_45_1)
	if arg_45_1.fromCity ~= arg_45_1.toCity then
		eventManager.dispatchEvent("generalMoveFromTo", arg_45_1.gid, arg_45_1.fromCity, arg_45_1.toCity, arg_45_1.cd, false)
	else
		eventManager.dispatchEvent("positionGeneral", arg_45_1.gid, arg_45_1.toCity)
	end
end

function var_0_4.handlerKfWorldMoveAction(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
	local var_46_0 = {}
	local var_46_1
	local var_46_2 = eventManager.dispatchEvent("KfworldGetGenerals")

	for iter_46_0, iter_46_1 in pairs(var_46_2) do
		if iter_46_1.id == arg_46_1 and iter_46_1.kfCityId then
			var_46_0[#var_46_0 + 1] = iter_46_1.kfCityId

			local var_46_3 = iter_46_1.kfCityId
		end
	end

	if arg_46_3.data.cityList == nil then
		return
	end

	for iter_46_2, iter_46_3 in pairs(arg_46_3.data.cityList) do
		var_46_0[#var_46_0 + 1] = tonumber(iter_46_3.id)
	end

	if smgr.getLayer("generalMoveLayer") ~= nil then
		traceData.createTrace(arg_46_1, var_46_0)
	end
end

function var_0_4.handlerCallGeneralAction(arg_47_0, arg_47_1)
	for iter_47_0, iter_47_1 in pairs(arg_47_1.data) do
		local var_47_0 = {}
		local var_47_1
		local var_47_2 = eventManager.dispatchEvent("KfworldGetGenerals")

		for iter_47_2, iter_47_3 in pairs(var_47_2) do
			if tonumber(iter_47_3.id) == tonumber(iter_47_0) and iter_47_3.kfCityId then
				var_47_0[#var_47_0 + 1] = iter_47_3.kfCityId

				local var_47_3 = iter_47_3.kfCityId
			end
		end

		if type(iter_47_1) ~= "table" then
			smgr.showTipText(iter_47_1)

			return
		end

		for iter_47_4, iter_47_5 in pairs(iter_47_1) do
			var_47_0[#var_47_0 + 1] = tonumber(iter_47_5.id)
		end

		if smgr.getLayer("generalMoveLayer") ~= nil then
			traceData.createTrace(iter_47_0, var_47_0)
		end
	end
end

function var_0_4.moveTo(arg_48_0, arg_48_1, arg_48_2, arg_48_3, arg_48_4, arg_48_5)
	arg_48_2 = arg_48_2 or false
	arg_48_3 = arg_48_3 or false

	if arg_48_3 and kfyzWorld.memoryLocation then
		arg_48_0:worldSetOffset(kfyzWorld.memoryLocation)

		return
	end

	local var_48_0 = arg_48_0.cityTable[arg_48_1]

	if var_48_0 == nil then
		return
	end

	local var_48_1 = var_48_0.sprite
	local var_48_2 = var_48_1:getContentSize()
	local var_48_3, var_48_4 = var_48_1:getPosition()
	local var_48_5 = arg_48_0.mapInfo
	local var_48_6 = var_48_5.column * var_48_5.width
	local var_48_7 = var_48_5.row * var_48_5.height

	if var_48_3 < visibleSize.width / 2 then
		var_48_3 = visibleSize.width / 2
	end

	if var_48_3 > var_48_6 - visibleSize.width / 2 then
		var_48_3 = var_48_6 - visibleSize.width / 2
	end

	if var_48_4 < visibleSize.height / 2 then
		var_48_4 = visibleSize.height / 2
	end

	if var_48_4 > var_48_7 - visibleSize.height / 2 then
		var_48_4 = var_48_7 - visibleSize.height / 2
	end

	if arg_48_2 then
		arg_48_4 = arg_48_4 or 0.15

		arg_48_0:setContentOffsetInDuration(ccp(-var_48_3 + visibleSize.width / 2, -var_48_4 + visibleSize.height / 2), arg_48_4)
	else
		arg_48_0:setContentOffset(ccp(-var_48_3 + visibleSize.width / 2, -var_48_4 + visibleSize.height / 2), arg_48_2)
	end

	kfyzWorld.memoryLocation = ccp(-var_48_3 + visibleSize.width / 2, -var_48_4 + visibleSize.height / 2)

	if arg_48_5 then
		local var_48_8 = CCSprite:create("res/ui/guide/jiantou-xia.png")
		local var_48_9, var_48_10 = var_48_1:getPosition()

		var_48_8:setPosition(ccp(var_48_9, var_48_10 + 80))
		arg_48_0.effectLayer:addChild(var_48_8, 130)

		local var_48_11 = CCJumpBy:create(1, ccp(0, 0), 40, 1)

		var_48_8:runAction(CCRepeatForever:create(var_48_11))

		local var_48_12 = CCSequence:createWithTwoActions(CCDelayTime:create(3), CCCallFuncN:create(function()
			var_48_8:removeFromParentAndCleanup(true)
		end))

		var_48_8:runAction(var_48_12)
	end
end

function var_0_4.loadMapWithPosition(arg_50_0, arg_50_1, arg_50_2)
	arg_50_0:stopAllActions()
	performWithDelay(arg_50_0, function()
		arg_50_0.mapTable = arg_50_0.mapTable or {}
		arg_50_1 = -arg_50_1
		arg_50_2 = -arg_50_2

		local var_51_0 = CCRectMake(arg_50_1, arg_50_2, visibleSize.width, visibleSize.height)

		for iter_51_0 = 1, var_0_5 do
			for iter_51_1 = 1, var_0_6 do
				local var_51_1 = var_0_5 + 1 - iter_51_1

				if arg_50_0.mapTable[string.format("block%s_%s", iter_51_0, var_51_1)] == nil then
					local var_51_2 = CCRectMake((iter_51_0 - 1) * 1000, (iter_51_1 - 1) * 600, 1000, 600)

					if var_51_0:intersectsRect(var_51_2) then
						local var_51_3

						if user.jpsIndex == 0 then
							var_51_3 = "res/tiledmap/" .. var_0_11[iter_51_0][var_51_1]
						elseif user.isKfdy then
							var_51_3 = "res/ui/kfyz/dongying/map/" .. var_0_11[iter_51_0][var_51_1]
						elseif user.isKfgl then
							var_51_3 = "res/ui/kfyz/gaoli/" .. var_0_11[iter_51_0][var_51_1]
						elseif user.isKfyn then
							var_51_3 = "res/ui/kfyz/yuenan/" .. var_0_11[iter_51_0][var_51_1]
						elseif user.isKflq then
							var_51_3 = "res/ui/kfyz/liuqiu/" .. var_0_11[iter_51_0][var_51_1]
						elseif user.isKfnz then
							var_51_3 = "res/ui/kfyz/nanzhao/" .. var_0_11[iter_51_0][var_51_1]
						end

						local var_51_4 = CCSprite:create(var_51_3)

						var_51_4:setPosition(ccp((iter_51_0 - 1) * 1000 + 500, (iter_51_1 - 1) * 600 + 300))
						arg_50_0.worldLayer:addChild(var_51_4)

						arg_50_0.mapTable[string.format("block%s_%s", iter_51_0, var_51_1)] = var_51_4

						local function var_51_5(arg_52_0)
							local var_52_0 = 0

							for iter_52_0, iter_52_1 in pairs(arg_52_0) do
								var_52_0 = var_52_0 + 1
							end

							return var_52_0
						end

						log.info("载入地图 %s %s #length#%s", iter_51_0, var_51_1, var_51_5(arg_50_0.mapTable))
					end
				end
			end
		end
	end, 0.02)
end

function var_0_4.worldSetOffset(arg_53_0, arg_53_1)
	arg_53_0:setContentOffset(arg_53_1)
end

function var_0_4.handlerhandlerpushSlaveAction(arg_54_0, arg_54_1)
	if arg_54_1.cityId then
		local var_54_0 = arg_54_0.cityTable[arg_54_1.cityId]

		if var_54_0 and var_54_0.eventSprite and not tolua.isnull(var_54_0.eventSprite) then
			var_54_0.eventSprite:removeFromParentAndCleanup(true)

			var_54_0.eventSprite = nil
		end

		if arg_54_1.slaveInfo.nextTime then
			var_54_0.eventSprite = CCSprite:create("res/ui/kfyz/kfyz_word_bg.png")

			local var_54_1, var_54_2 = var_54_0.sprite:getPosition()

			var_54_0.eventSprite:setPosition(ccp(var_54_1, var_54_2 + 90))
			arg_54_0.eventNode:addChild(var_54_0.eventSprite)

			local var_54_3 = CCSprite:create("res/ui/kfyz/yzdy_icon_yuan.png")
			local var_54_4 = createTimerLabel(arg_54_1.slaveInfo.nextTime, "@M:@S", "Thonburi", 22, nil, nil, nil, colorTips.red)
			local var_54_5

			if user.isKfdy then
				var_54_5 = "222419_dongying"
			elseif user.isKfgl then
				var_54_5 = 226039
			end

			local var_54_6 = CCLabelTTF:create(language.get(var_54_5), "Thonburi", 18)

			var_54_3:setPosition(ccp(10, 29))
			var_54_4:setPosition(ccp(63, 29))
			var_54_6:setPosition(ccp(185, 29))
			var_54_0.eventSprite:addChild(var_54_3)
			var_54_0.eventSprite:addChild(var_54_4)
			var_54_0.eventSprite:addChild(var_54_6)
		end
	end
end

function var_0_4.handlerhandlerpushMainAction(arg_55_0, arg_55_1)
	if not user.isKfdy and not user.isKfyn then
		return
	end

	if arg_55_1.cityId then
		local var_55_0 = arg_55_0.cityTable[arg_55_1.cityId]

		if var_55_0.eventSprite and not tolua.isnull(var_55_0.eventSprite) then
			var_55_0.eventSprite:removeFromParentAndCleanup(true)

			var_55_0.eventSprite = nil
		end

		if arg_55_1.mainInfo.pic then
			var_55_0.eventSprite = CCSprite:create("res/ui/world/worldEventBtn1.png")

			local var_55_1, var_55_2 = var_55_0.sprite:getPosition()

			var_55_0.eventSprite:setPosition(ccp(var_55_1, var_55_2 + 90))
			arg_55_0.eventNode:addChild(var_55_0.eventSprite)

			local var_55_3 = var_55_0.eventSprite:getContentSize()
			local var_55_4 = CCSprite:create("res/ui/common/generalPic/generalPic_" .. arg_55_1.mainInfo.pic .. ".jpg")

			var_55_4:setPosition(var_55_3.width / 2, var_55_3.height / 2)
			var_55_4:setScale(0.85)
			var_55_0.eventSprite:addChild(var_55_4)

			if arg_55_1.mainInfo.attackingPlayer then
				local var_55_5 = CCStrokeLabelTTF:create(language.get("222423_dongying", arg_55_1.mainInfo.attackingPlayer), "Thonburi", 20, 2)

				var_55_0.eventSprite:addChild(var_55_5)
				var_55_5:setPosition(ccp(var_55_3.width / 2, var_55_3.height + 10))
				var_55_5:setColor(ccc3(255, 0, 0))
			end
		end
	end
end

function var_0_4.showEvent(arg_56_0, arg_56_1, arg_56_2)
	local var_56_0 = {
		xuzuozhinan = language.get("222441_dongying"),
		suworulu = language.get("222440_dongying"),
		jushimalv = language.get("222442_dongying"),
		beimihu = language.get("222443_dongying")
	}
	local var_56_1 = language.get("222420_dongying")

	if arg_56_1.fakeEvent then
		var_56_1 = language.get("222421_dongying")
	end

	local var_56_2 = {
		background = {
			xcenter = 0,
			type = "pic",
			ycenter = 0,
			pic = "res/ui/juben/event/tssj_view_bg.png",
			children = {
				{
					xcenter = 0,
					top = -26,
					pic = "res/ui/juben/event/sj_view_tit.png",
					type = "pic"
				},
				{
					fontSize = 24,
					height = 60,
					type = "label",
					x = 455,
					width = 480,
					y = 272,
					text = var_56_0[arg_56_1.pic] or "",
					color = ccc3(255, 255, 204)
				},
				{
					y = 263,
					x = 145,
					type = "pic",
					pic = "res/ui/juben/event/off_city_port_view.png",
					children = {
						{
							xcenter = 0,
							ycenter = 0,
							type = "pic",
							pic = "res/ui/common/generalPic/generalPic_" .. arg_56_1.pic .. ".jpg"
						}
					}
				},
				{
					type = "button",
					top = 0,
					scale = 2,
					right = 38,
					buttons = {
						{
							pic2 = "frame:btn_close_c.png",
							name = "closeItem",
							scale = 2,
							pic1 = "frame:btn_close_a.png"
						}
					}
				}
			}
		}
	}

	var_56_2.background.children[#var_56_2.background.children + 1] = {
		xcenter = 0,
		name = "normalButton",
		y = 100,
		type = "button",
		buttons = {
			{
				pic2 = "res/ui/juben/event/tssj_list_view_c.jpg",
				name = "choiceButton_1",
				pic1 = "res/ui/juben/event/tssj_list_view_a.jpg",
				y = 0,
				x = 0,
				children = {
					{
						xcenter = 0,
						height = 57,
						fontSize = 24,
						type = "label",
						y = 13,
						width = 250,
						text = language.get(10001),
						color = ccc3(255, 255, 204),
						align = kCCTextAlignmentCenter
					}
				}
			}
		}
	}
	var_56_2.background.children[#var_56_2.background.children + 1] = {
		fontSize = 22,
		name = "choiceLabel_1",
		type = "label",
		xcenter = 0,
		y = 120,
		text = var_56_1,
		color = ccc3(0, 255, 0)
	}

	local var_56_3 = smgr.getLayer("topLayer")

	arg_56_0.eventTable = autoUI.initUI(var_56_3, var_56_2)

	local function var_56_4()
		var_56_3:removeAllChildrenWithCleanup(true)
	end

	arg_56_0.eventTable.closeItem:registerScriptTapHandler(var_56_4)

	local function var_56_5()
		local function var_58_0(arg_59_0)
			var_56_3:removeAllChildrenWithCleanup(true)

			local var_59_0 = arg_59_0.data

			if var_59_0.teamId then
				log.info("teamId: ", var_59_0.teamId)
				bmgr.enterKfgz(var_59_0.teamId)
			end
		end

		kfcmgr.sendRequest(var_58_0, actions.kfgzDealJpsEvent, arg_56_2)
	end

	arg_56_0.eventTable.choiceButton_1:registerScriptTapHandler(var_56_5)
end

function var_0_4.showEventKorea(arg_60_0, arg_60_1, arg_60_2)
	local var_60_0 = ""

	if arg_60_1.corpsLv == 1 then
		var_60_0 = "madai"
	elseif arg_60_1.corpsLv == 2 then
		var_60_0 = "xiahoumao"
	end

	local var_60_1 = {
		y = 0,
		name = "layer",
		type = "layer",
		x = 0,
		children = {
			{
				name = "bg",
				type = "sprite9",
				y = 36,
				preferedSize = CCSizeMake(654, 190),
				middleRect = CCRectMake(110, 36, 434, 178),
				x = visibleSize.width * 0.5,
				anchorPoint = ccp(0.5, 0),
				pic = {
					path = "res/ui/activity/famous/gjms_sce_view_bg.png"
				},
				children = {
					{
						name = "btn_corps",
						h = 112,
						type = "button",
						w = 404,
						y = 64,
						x = 382,
						normal = {
							path = "res/ui/activity/famous/gjms_sce_list.jpg"
						},
						touched = {
							path = "res/ui/activity/famous/gjms_sce_list_on.jpg"
						},
						children = {
							{
								fontSize = 22,
								height = 0,
								x = 202,
								type = "label",
								y = 56,
								textId = 226043,
								width = 360,
								halign = kCCTextAlignmentLeft,
								color = ccc3(0, 255, 0)
							}
						}
					},
					{
						x = 620,
						name = "btn_close",
						h = 33,
						type = "button",
						w = 32,
						y = 216,
						scale = 2,
						normal = {
							frame = true,
							path = "btn_close_a.png"
						},
						touched = {
							frame = true,
							path = "btn_close_click.png"
						}
					},
					{
						y = 4,
						name = "generalPic",
						type = "sprite",
						x = 55,
						anchorPoint = ccp(0.5, 0),
						pic = {
							path = string.format("res/ui/common/halfPic/halfPic_%s.png", var_60_0)
						}
					},
					{
						fontSize = 22,
						height = 0,
						type = "label",
						x = 382,
						textId = 226042,
						y = 182,
						width = 400,
						halign = kCCTextAlignmentLeft,
						anchorPoint = ccp(0.5, 1)
					}
				}
			}
		}
	}
	local var_60_2 = {}

	uiutil.initWidgets(var_60_2, var_60_1)
	smgr.getLayer("topLayer"):addChild(var_60_2.widgets.layer)
	swallowTouch(var_60_2.widgets.layer)
	var_60_2.widgets.btn_close:addHandleOfControlEvent(function()
		log.info("btn_close")
		var_60_2.widgets.layer:removeFromParentAndCleanup(true)
	end, CCControlEventTouchUpInside)
	var_60_2.widgets.btn_corps:addHandleOfControlEvent(function()
		log.info("btn_corps")

		local function var_62_0(arg_63_0)
			if arg_63_0.data.force ~= 1001 then
				smgr.showTipText(language.get(226044))
			elseif user.pin ~= 0 and user.pin ~= 1 then
				smgr.showTipText(language.get(226047))
			else
				local function var_63_0(arg_64_0)
					var_60_2.widgets.layer:removeFromParentAndCleanup(true)

					local var_64_0 = smgr.getLayer("topLayer")

					require("lua/layer/corps/CorpsPanelNew").new(var_64_0, arg_64_0.data, 0)
				end

				kfcmgr.sendRequest(var_63_0, actions.getCorpsInfo, arg_60_1.cityId, 0)
			end
		end

		kfcmgr.sendRequest(var_62_0, actions.kfworldGetCityInfo, arg_60_1.cityId)
	end, CCControlEventTouchUpInside)
end

function var_0_4.handlerRightBarAction(arg_65_0, arg_65_1)
	if arg_65_1.firstBloodName and arg_65_0.cityTable[arg_65_1.cityId] and arg_65_0.cityTable[arg_65_1.cityId].eventSprite and not tolua.isnull(arg_65_0.cityTable[arg_65_1.cityId].eventSprite) then
		arg_65_0.cityTable[arg_65_1.cityId].eventSprite:removeFromParentAndCleanup(true)

		arg_65_0.cityTable[arg_65_1.cityId].eventSprite = nil
	end
end

function var_0_4.addArena(arg_66_0, arg_66_1)
	if arg_66_1 == nil then
		return
	end

	if arg_66_1.cityId == nil then
		return
	end

	user.kfChampionList = user.kfChampionList or {}
	arg_66_0.arenaTable = arg_66_0.arenaTable or {}

	local var_66_0 = arg_66_0.arenaTable[arg_66_1.cityId]

	if var_66_0 then
		var_66_0:removeFromParentAndCleanup(true)

		user.kfChampionList[arg_66_1.cityId] = nil
		arg_66_0.arenaTable[arg_66_1.cityId] = nil
	end

	if arg_66_1.id ~= nil and arg_66_1.id > 0 then
		local var_66_1, var_66_2 = arg_66_0.cityTable[arg_66_1.cityId].sprite:getPosition()
		local var_66_3 = CCSprite:create("res/ui/arena/jzxt_word_bg.png")
		local var_66_4 = CCSprite:create("res/ui/arena/jzxt_icon_bg.png")

		var_66_4:setPosition(12, 17)
		var_66_3:addChild(var_66_4)

		local var_66_5 = CCSprite:create("res/ui/arena/jzxt_icon_01.png")

		var_66_5:setPosition(18, 36)
		var_66_4:addChild(var_66_5)

		local var_66_6 = CCLabelTTF:create(arg_66_1.forceName .. "·" .. arg_66_1.name, "Thonburi", 20)
		local var_66_7

		if arg_66_1.forceId == 1 and (user.isKfdy or user.isKfgl or user.isKfyn) then
			var_66_7 = colorQuality[6]
		elseif arg_66_1.forceId == 1001 or arg_66_1.forceId == 1002 or arg_66_1.forceId == 1003 then
			var_66_7 = tool.hexToRgb("#F49429")
		else
			var_66_7 = colorForce[arg_66_1.forceId]
		end

		if var_66_7 then
			var_66_6:setColor(var_66_7)
		end

		local var_66_8 = CCLabelTTF:create(language.get(225003), "Thonburi", 20)
		local var_66_9 = createRichNode({
			var_66_6,
			var_66_8
		}, 0)

		var_66_9:setPosition(ccp(34, 17))
		var_66_3:addChild(var_66_9)
		var_66_3:setPosition(ccp(var_66_1, var_66_2 + 60))
		arg_66_0.eventNode:addChild(var_66_3)

		arg_66_0.arenaTable[arg_66_1.cityId] = var_66_3
		user.kfChampionList[arg_66_1.cityId] = arg_66_1
	end
end

function var_0_4.drawLock(arg_67_0, arg_67_1, arg_67_2)
	arg_67_0:clearLock(arg_67_1, arg_67_2)

	local var_67_0 = require("lua/layer/kfyzWorld/config/road/nanzhaoCubePoly")
	local var_67_1 = require("lua/layer/kfyzWorld/config/road/nanzhaoTracePoints")
	local var_67_2 = var_67_0.curve(tonumber(arg_67_1), tonumber(arg_67_2))
	local var_67_3 = {}
	local var_67_4 = var_67_1.elapse(tonumber(arg_67_1), tonumber(arg_67_2))

	var_67_3.count = var_67_4.count + 1

	for iter_67_0 = 1, var_67_4.count do
		if iter_67_0 < var_67_4.count then
			local var_67_5 = var_67_4.time[iter_67_0]
			local var_67_6, var_67_7 = var_67_0.position(var_67_2, tonumber(arg_67_1), tonumber(arg_67_2), var_67_5)
			local var_67_8 = var_67_4.time[iter_67_0 + 1]
			local var_67_9, var_67_10 = var_67_0.position(var_67_2, tonumber(arg_67_1), tonumber(arg_67_2), var_67_8)
			local var_67_11 = tool.getAngle(ccp(var_67_6, var_67_7), ccp(var_67_9, var_67_10))

			if iter_67_0 % 2 == 0 then
				local var_67_12 = CCSprite:createWithSpriteFrameName("lock11.png")

				var_67_12:setPosition(ccp(var_67_6, var_67_7))
				var_67_12:setScale(1.5)
				var_67_12:setRotation(var_67_11)
				arg_67_0.cityBatchNode:addChild(var_67_12, 111)

				if not arg_67_0.lockCityEffect[arg_67_1 .. "_" .. arg_67_2] then
					arg_67_0.lockCityEffect[arg_67_1 .. "_" .. arg_67_2] = {}
				end

				table.insert(arg_67_0.lockCityEffect[arg_67_1 .. "_" .. arg_67_2], var_67_12)
			else
				local var_67_13 = CCSprite:createWithSpriteFrameName("lock21.png")

				var_67_13:setPosition(ccp(var_67_6, var_67_7))
				var_67_13:setScale(1.5)
				var_67_13:setRotation(var_67_11)
				arg_67_0.cityBatchNode:addChild(var_67_13, 110)

				if not arg_67_0.lockCityEffect[arg_67_1 .. "_" .. arg_67_2] then
					arg_67_0.lockCityEffect[arg_67_1 .. "_" .. arg_67_2] = {}
				end

				table.insert(arg_67_0.lockCityEffect[arg_67_1 .. "_" .. arg_67_2], var_67_13)
			end
		end
	end
end

function var_0_4.clearLock(arg_68_0, arg_68_1, arg_68_2)
	local var_68_0 = arg_68_0.lockCityEffect[arg_68_1 .. "_" .. arg_68_2] or arg_68_0.lockCityEffect[arg_68_2 .. "_" .. arg_68_1]

	if var_68_0 then
		for iter_68_0, iter_68_1 in pairs(var_68_0) do
			if iter_68_1 then
				pcall(iter_68_1.removeFromParentAndCleanup, iter_68_1, true)

				arg_68_0.lockCityEffect[arg_68_1 .. "_" .. arg_68_2] = nil
			end
		end
	end
end

function var_0_4.onEnter(arg_69_0)
	arg_69_0.lockCityEffect = {}

	function arg_69_0.eventRef(arg_70_0)
		return arg_69_0:getCitySprite(arg_70_0)
	end

	arg_69_0.callGeneralRef = handler(arg_69_0, arg_69_0.handlerCallGeneralAction)
	arg_69_0.bridgeConnectRef = handler(arg_69_0, arg_69_0.onBridgeConnectChange)
	arg_69_0.moveToCityRef = handler(arg_69_0, arg_69_0.moveTo)
	arg_69_0.worldSetOffsetRef = handler(arg_69_0, arg_69_0.worldSetOffset)
	arg_69_0.addArenaRef = handler(arg_69_0, arg_69_0.addArena)

	eventManager.registerEvent("handlerCallGeneralAction", arg_69_0.callGeneralRef)
	eventManager.registerEvent("KfworldGetCitySprite", arg_69_0.eventRef)
	eventManager.registerEvent("bridgeConnect", arg_69_0.bridgeConnectRef)
	eventManager.registerEvent("moveToCity", arg_69_0.moveToCityRef)
	eventManager.registerEvent("worldSetOffet", arg_69_0.worldSetOffsetRef)
	eventManager.registerEvent("PushJiaoZhen", arg_69_0.addArenaRef)
end

function var_0_4.onExit(arg_71_0)
	arg_71_0.fightBackLayer = nil

	eventManager.unregisterEvent("handlerCallGeneralAction", arg_71_0.callGeneralRef)
	eventManager.unregisterEvent("KfworldGetCitySprite", arg_71_0.eventRef)
	eventManager.unregisterEvent("bridgeConnect", arg_71_0.bridgeConnectRef)
	eventManager.unregisterEvent("moveToCity", arg_71_0.moveToCityRef)
	eventManager.unregisterEvent("worldSetOffet", arg_71_0.worldSetOffsetRef)
	eventManager.unregisterEvent("PushJiaoZhen", arg_71_0.addArenaRef)

	kfyzWorld.memoryLocation = arg_71_0:getContentOffset()
end

return var_0_4
