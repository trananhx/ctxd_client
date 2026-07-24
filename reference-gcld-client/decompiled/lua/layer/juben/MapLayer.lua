local var_0_0 = class("JubenMapLayer", function()
	return CCScrollView:create(visibleSize)
end)
local var_0_1 = require("lua/layer/juben/EffectLayer")
local var_0_2 = require("lua/layer/world/cityWindow2/ui")
local var_0_3 = {
	effectLayer = 3,
	cityWindow = 5,
	eventLayer = 4
}
local var_0_4 = 0

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.juben = arg_2_1

	local var_2_0 = arg_2_1.config:getMap()
	local var_2_1 = var_2_0.column * var_2_0.width
	local var_2_2 = var_2_0.row * var_2_0.height

	arg_2_0.hiddenRoads = arg_2_0.juben.config:getHiddenRoad()
	arg_2_0.hiddenRoadSpriteTable = {}

	local var_2_3 = CCLayer:create()

	var_2_3:registerScriptHandler(function(arg_3_0)
		if arg_3_0 == "enter" then
			arg_2_0:onEnter()
		elseif arg_3_0 == "exit" then
			arg_2_0:onExit()
		end
	end)

	arg_2_0.jubenWorldLayer = var_2_3

	arg_2_0:setDirection(kCCScrollViewDirectionBoth)
	arg_2_0:setBounceable(false)
	arg_2_0:setPosition(ccp(0, 0))
	arg_2_0:setContentSize(CCSizeMake(var_2_1, var_2_2))
	var_2_3:setContentSize(CCSizeMake(var_2_1, var_2_2))
	arg_2_0:setContainer(var_2_3)

	arg_2_0.effectLayer = var_0_1.new(arg_2_1)

	var_2_3:addChild(arg_2_0.effectLayer, var_0_3.effectLayer)

	local var_2_4 = arg_2_1.gId

	if var_2_4 == 12 then
		var_2_4 = 1
	end

	if var_2_4 == 10001 then
		var_2_4 = 4
	end

	for iter_2_0 = 1, var_2_0.column do
		for iter_2_1 = 1, var_2_0.row do
			local var_2_5 = var_2_0.row + 1 - iter_2_1
			local var_2_6 = CCSprite:create("res/jubenMap/" .. var_2_4 .. "/block" .. iter_2_0 .. "_" .. var_2_5 .. ".jpg")

			var_2_6:setPosition(ccp((iter_2_0 - 1) * var_2_0.width + var_2_0.width / 2, (iter_2_1 - 1) * var_2_0.height + var_2_0.height / 2))
			var_2_3:addChild(var_2_6, 0)
		end
	end

	arg_2_0.cityNameBatchNode = CCSpriteBatchNode:create("res/ui/jbName/jbName.png")
	arg_2_0.cityBatchNode = CCSpriteBatchNode:create("res/ui/world/worldBuilding.png")
	arg_2_0.cityFlagBatchNode = CCSpriteBatchNode:create("res/ui/juben/flag.png")

	var_2_3:addChild(arg_2_0.cityBatchNode, 2)
	var_2_3:addChild(arg_2_0.cityFlagBatchNode, 3)
	var_2_3:addChild(arg_2_0.cityNameBatchNode, 4)

	arg_2_0.cityTable = {}

	for iter_2_2, iter_2_3 in pairs(arg_2_1.config.city.cities) do
		local var_2_7 = arg_2_1.config:getCity(iter_2_2)

		if var_2_7 ~= nil then
			arg_2_0.cityTable[iter_2_2] = {}
			arg_2_0.cityTable[iter_2_2].sprite = CCSprite:createWithSpriteFrameName(var_2_7.model)

			local var_2_8 = arg_2_0.cityTable[iter_2_2].sprite
			local var_2_9 = var_2_8:getContentSize()
			local var_2_10 = var_2_7.x + var_2_9.width / 2
			local var_2_11 = var_2_2 - var_2_7.y - var_2_9.height / 2

			if user.isYw then
				var_2_10, var_2_11 = var_2_7.x, var_2_2 - var_2_7.y
			end

			var_2_8:setPosition(ccp(var_2_10, var_2_11))
			arg_2_0.cityBatchNode:addChild(var_2_8, 0)

			local var_2_12 = CCSprite:createWithSpriteFrameName("cc_view_bg.png")

			var_2_12:setPosition(ccp(var_2_10, var_2_11 - 50))
			arg_2_0.cityBatchNode:addChild(var_2_12, 0)

			if user.isYw then
				if iter_2_2 > 183 then
					if iter_2_2 == 184 then
						iter_2_2 = 154
					elseif iter_2_2 == 185 then
						iter_2_2 = 155
					elseif iter_2_2 == 186 then
						iter_2_2 = 138
					end
				else
					iter_2_2 = iter_2_2 - 31
				end
			end

			local var_2_13 = CCSprite:createWithSpriteFrameName(string.format("jb_%s.png", iter_2_2))

			var_2_13:setPosition(ccp(var_2_10, var_2_11 - 50))
			arg_2_0.cityNameBatchNode:addChild(var_2_13, 1)
		end
	end
end

local var_0_5 = {
	[0] = "jb_flag_manzu.png",
	"jb_flag_wei.png",
	"jb_flag_shu.png",
	"jb_flag_wu.png",
	"jb_flag_caocao.png",
	[101] = "jb_flag_yuanshu.png",
	[102] = "jb_flag_liubiao.png",
	[104] = "jb_flag_caocao.png",
	[103] = "jb_flag_manzu.png",
	[105] = "jb_flag_caocao.png"
}

local function var_0_6(arg_4_0)
	local var_4_0 = {}
	local var_4_1 = 1

	if arg_4_0.jennyPic == "huangsao" then
		var_4_1 = 1
	elseif arg_4_0.jennyPic == "yiji" then
		var_4_1 = 3
	elseif arg_4_0.jennyPic == "caozhi" then
		var_4_1 = 4
	elseif arg_4_0.jennyPic == "lisu" then
		var_4_1 = 5
	end

	var_4_0[1] = {
		marchState = 0,
		immediately = false,
		pic = arg_4_0.jennyPic,
		nextExcutedTime = arg_4_0.nextJennyTime,
		curCityId = arg_4_0.jennyCity,
		nextCityId = arg_4_0.nextJennyCity,
		forceId = var_4_1,
		blood = arg_4_0.blood
	}
	var_4_0[2] = {
		forceId = 2,
		marchState = 0,
		immediately = true,
		pic = arg_4_0.tommyPic,
		nextExcutedTime = arg_4_0.nextTommyTime,
		curCityId = arg_4_0.tommyCity,
		nextCityId = arg_4_0.nextTommyCity
	}

	return var_4_0
end

local function var_0_7(arg_5_0)
	local var_5_0 = {
		{
			forceId = 1,
			marchState = 0,
			nextExcutedTime = 0,
			pic = "caocao",
			immediately = true,
			curCityId = var_0_4 > 0 and var_0_4 or arg_5_0.location,
			nextCityId = arg_5_0.location,
			isSafe = arg_5_0.isSafe
		}
	}

	var_0_4 = arg_5_0.location

	return var_5_0
end

function var_0_0.getYWJubenScene(arg_6_0, arg_6_1)
	log.info("getJubenScene", tool.tableToJson(arg_6_1))

	for iter_6_0, iter_6_1 in pairs(arg_6_1.cities) do
		local var_6_0 = var_0_5[iter_6_1.forceId] or var_0_5[0]
		local var_6_1 = iter_6_1.cityId

		arg_6_0.cityTable[var_6_1].flagSprite = CCSprite:createWithSpriteFrameName(var_6_0)

		local var_6_2 = arg_6_0.cityTable[var_6_1].flagSprite
		local var_6_3 = arg_6_0.cityTable[var_6_1].sprite:getContentSize()
		local var_6_4 = arg_6_0.juben.config:getMap()
		local var_6_5 = var_6_4.column * var_6_4.width
		local var_6_6 = var_6_4.row * var_6_4.height
		local var_6_7 = arg_6_0.juben.config:getCity(var_6_1)
		local var_6_8 = var_6_7.x + var_6_3.width / 2
		local var_6_9 = var_6_6 - var_6_7.y - var_6_3.height / 2

		if user.isYw then
			var_6_8, var_6_9 = var_6_7.x, var_6_6 - var_6_7.y
		end

		var_6_2:setPosition(ccp(var_6_8 - 50, var_6_9 - 50))
		arg_6_0.cityFlagBatchNode:addChild(var_6_2, 1)
	end
end

function var_0_0.getJubenScene(arg_7_0, arg_7_1)
	log.info("getJubenScene", tool.tableToJson(arg_7_1))

	for iter_7_0, iter_7_1 in pairs(arg_7_1.action.data.cities) do
		local var_7_0 = var_0_5[iter_7_1.forceId] or var_0_5[0]
		local var_7_1 = iter_7_1.cityId

		if arg_7_0.cityTable[var_7_1].flagSprite == nil then
			arg_7_0.cityTable[var_7_1].flagSprite = CCSprite:createWithSpriteFrameName(var_7_0)

			local var_7_2 = arg_7_0.cityTable[var_7_1].flagSprite
			local var_7_3 = arg_7_0.cityTable[var_7_1].sprite:getContentSize()
			local var_7_4 = arg_7_0.juben.config:getMap()
			local var_7_5 = var_7_4.column * var_7_4.width
			local var_7_6 = var_7_4.row * var_7_4.height
			local var_7_7 = arg_7_0.juben.config:getCity(var_7_1)
			local var_7_8 = var_7_7.x + var_7_3.width / 2
			local var_7_9 = var_7_6 - var_7_7.y - var_7_3.height / 2

			if user.isYw then
				var_7_8, var_7_9 = var_7_7.x, var_7_6 - var_7_7.y
			end

			var_7_2:setPosition(ccp(var_7_8 - 50, var_7_9 - 50))
			arg_7_0.cityFlagBatchNode:addChild(var_7_2, 1)
		else
			local var_7_10 = tool.spriteFrameByName(var_7_0)

			arg_7_0.cityTable[var_7_1].flagSprite:setDisplayFrame(var_7_10)
		end
	end
end

function var_0_0.removeYwEvent(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0.cityTable[arg_8_1]

	if var_8_0.eventSprite and not tolua.isnull(var_8_0.eventSprite) then
		var_8_0.eventSprite:removeFromParentAndCleanup(true)

		var_8_0.eventSprite = nil
	end
end

function var_0_0.updateYwEvent(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0.cityTable[arg_9_1]
	local var_9_1 = arg_9_0.juben.config:getMap()
	local var_9_2 = var_9_1.row * var_9_1.height

	var_9_0.eventInfo = arg_9_2

	if var_9_0.eventSprite and not tolua.isnull(var_9_0.eventSprite) then
		var_9_0.eventSprite:removeFromParentAndCleanup(true)

		var_9_0.eventSprite = nil
	end

	local var_9_3 = CCSprite:create("res/ui/world/worldEventTimeBg.png")

	var_9_0.eventSprite = var_9_3

	local var_9_4 = arg_9_0.cityTable[arg_9_1].sprite:getContentSize()
	local var_9_5 = arg_9_0.juben.config:getCity(arg_9_1)
	local var_9_6 = var_9_5.x
	local var_9_7 = var_9_2 - var_9_5.y

	var_9_3:setPosition(ccp(var_9_6, var_9_7 + 90))
	arg_9_0.eventLayer:addChild(var_9_3)
	arg_9_0:updateYwBarInfo(var_9_3, arg_9_2)
end

function var_0_0.updateYwBarInfo(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = ""

	arg_10_2.barType = arg_10_2.barType or 0
	arg_10_2.attType = arg_10_2.attType or 0

	if arg_10_2.barType == 0 then
		if arg_10_2.attType == 0 then
			var_10_0 = language.get(60002, arg_10_2.cityName)
		elseif arg_10_2.attType == 1 then
			var_10_0 = language.get(60003, arg_10_2.cityName)
		end
	elseif arg_10_2.barType == 1 then
		if arg_10_2.attType == 0 then
			var_10_0 = language.get(215138, arg_10_2.cityName)
		elseif arg_10_2.attType == 1 then
			var_10_0 = language.get(215139, arg_10_2.cityName)
		end
	elseif arg_10_2.barType == 2 then
		var_10_0 = language.get(215120)
	elseif arg_10_2.barType == 3 then
		var_10_0 = language.get(215132)
	end

	if arg_10_2.endTime and arg_10_2.endTime > 0 then
		local var_10_1 = createTimerLabel(arg_10_2.endTime, var_10_0 .. "@H:@M:@S", "Thonburi-Bold", 20, nil, nil, nil)

		var_10_1:setPosition(ccp(109.5, 20.5))
		arg_10_1:addChild(var_10_1)
	else
		local var_10_2 = CCLabelTTF:create(var_10_0, "Thonburi", 20)

		var_10_2:setPosition(ccp(109.5, 20.5))
		arg_10_1:addChild(var_10_2)
	end
end

function var_0_0.enterJubenScene(arg_11_0, arg_11_1, arg_11_2)
	user.soId = arg_11_0.juben.gId
	arg_11_0.cities = arg_11_1.action.data.cities
	arg_11_0.events = arg_11_1.action.data.event
	arg_11_0.followGeneralId = arg_11_1.action.data.followGeneralId

	if arg_11_0.eventLayer and not tolua.isnull(arg_11_0.eventLayer) then
		arg_11_0:removeChild(arg_11_0.eventLayer, true)
	end

	local var_11_0 = user.isYw and user.ywData.watch

	if arg_11_2 ~= false and not var_11_0 then
		if arg_11_0.generalMoveLayer and not tolua.isnull(arg_11_0.generalMoveLayer) then
			arg_11_0.jubenWorldLayer:removeChild(arg_11_0.generalMoveLayer, true)
		end

		arg_11_0.generalMoveLayer = require("lua/layer/world/generalMoveLayer").show()

		arg_11_0.jubenWorldLayer:addChild(arg_11_0.generalMoveLayer, 5)
	end

	if arg_11_0.juben.gId == 11 then
		log.info("add new marchingLayer", "潼关之战")

		if arg_11_0.marchingLayer ~= nil and not tolua.isnull(arg_11_0.marchingLayer) then
			arg_11_0.marchingLayer:removeFromParentAndCleanup(true)

			arg_11_0.marchingLayer = nil
		end
	end

	if arg_11_0.marchingLayer == nil then
		log.info("add new marchingLayer")

		arg_11_0.marchingLayer = require("lua/layer/juben/MarchingLayer").new(arg_11_0.juben)

		arg_11_0.jubenWorldLayer:addChild(arg_11_0.marchingLayer, 5)
	end

	arg_11_0.jubenWorldLayer:registerScriptTouchHandler(function(arg_12_0, arg_12_1, arg_12_2)
		return arg_11_0:onTouch(arg_12_0, arg_12_1, arg_12_2)
	end)
	arg_11_0.jubenWorldLayer:setTouchEnabled(true)

	local var_11_1 = arg_11_0.juben.config:getMap()
	local var_11_2 = var_11_1.column * var_11_1.width
	local var_11_3 = var_11_1.row * var_11_1.height

	for iter_11_0, iter_11_1 in pairs(arg_11_1.action.data.cities) do
		local var_11_4 = var_0_5[iter_11_1.forceId] or var_0_5[0]
		local var_11_5 = iter_11_1.cityId

		log.info("cityId = %s", var_11_5)

		if arg_11_0.cityTable[var_11_5].flagSprite == nil then
			arg_11_0.cityTable[var_11_5].flagSprite = CCSprite:createWithSpriteFrameName(var_11_4)

			local var_11_6 = arg_11_0.cityTable[var_11_5].flagSprite
			local var_11_7 = arg_11_0.cityTable[var_11_5].sprite:getContentSize()
			local var_11_8 = arg_11_0.juben.config:getCity(var_11_5)
			local var_11_9 = var_11_8.x + var_11_7.width / 2
			local var_11_10 = var_11_3 - var_11_8.y - var_11_7.height / 2

			if user.isYw then
				var_11_9, var_11_10 = var_11_8.x, var_11_3 - var_11_8.y
			end

			var_11_6:setPosition(ccp(var_11_9 - 50, var_11_10 - 50))
			arg_11_0.cityFlagBatchNode:addChild(var_11_6, 1)
		else
			local var_11_11 = tool.spriteFrameByName(var_11_4)

			arg_11_0.cityTable[var_11_5].flagSprite:setDisplayFrame(var_11_11)
		end

		arg_11_0:changeCity(iter_11_1)

		if iter_11_1.trickState and iter_11_1.trickState[1] and iter_11_1.trickState[1].type == "kongcheng" then
			local var_11_12 = CCSprite:createWithSpriteFrameName("jb_dqjz_debuff_1.png")

			var_11_12:setPosition(ccp(110, 14))
			arg_11_0.cityTable[var_11_5].flagSprite:addChild(var_11_12)

			if iter_11_1.trickState[1].lastTime then
				performWithDelay(var_11_12, function()
					var_11_12:removeFromParentAndCleanup(true)
				end, iter_11_1.trickState[1].lastTime / 1000)
			end
		end
	end

	for iter_11_2, iter_11_3 in pairs(arg_11_0.hiddenRoads) do
		local var_11_13 = arg_11_0:getEventState(iter_11_3.eventId)

		if iter_11_3.initShow == true and var_11_13 ~= 3 or iter_11_3.initShow == false and var_11_13 == 3 then
			local var_11_14 = CCSprite:create("res/jubenMap/" .. arg_11_0.juben.gId .. "/hiddenRoads/jb_pic_" .. iter_11_2 .. ".png")
			local var_11_15 = iter_11_3.x
			local var_11_16 = iter_11_3.y

			if arg_11_0.hiddenRoadSpriteTable[iter_11_2] == nil then
				arg_11_0.hiddenRoadSpriteTable[iter_11_2] = {}
				arg_11_0.hiddenRoadSpriteTable[iter_11_2].sprite = var_11_14

				local var_11_17 = var_11_15 + var_11_14:getContentSize().width / 2
				local var_11_18 = var_11_3 - (var_11_16 + var_11_14:getContentSize().height / 2)

				var_11_14:setPosition(ccp(var_11_17, var_11_18))
				arg_11_0.jubenWorldLayer:addChild(var_11_14, 1)
			end
		end
	end

	arg_11_0.eventLayer = createBaseLayer()

	arg_11_0.jubenWorldLayer:addChild(arg_11_0.eventLayer, var_0_3.eventLayer)

	if arg_11_1.action.data.event then
		for iter_11_4, iter_11_5 in pairs(arg_11_1.action.data.event) do
			if iter_11_5.cityId1 ~= nil then
				local var_11_19 = iter_11_5.cityId1
				local var_11_20 = arg_11_0.cityTable[var_11_19]

				var_11_20.eventInfo = iter_11_5

				if var_11_20.eventSprite and not tolua.isnull(var_11_20.eventSprite) then
					var_11_20.eventSprite:removeFromParentAndCleanup(true)

					var_11_20.eventSprite = nil
				end

				if iter_11_5.eventState ~= 3 and iter_11_5.pic1 and iter_11_5.pic1 ~= nil and iter_11_5.pic1 ~= "" and iter_11_5.pic1 ~= "jinnang" then
					log.info("event = %s", tool.tableToJson(iter_11_5))

					local var_11_21 = CCSprite:create("res/ui/world/worldEventBtn1.png")

					var_11_20.eventSprite = var_11_21

					local var_11_22 = arg_11_0.cityTable[var_11_19].sprite:getContentSize()
					local var_11_23 = arg_11_0.juben.config:getCity(var_11_19)
					local var_11_24 = var_11_23.x + var_11_22.width / 2
					local var_11_25 = var_11_3 - var_11_23.y - var_11_22.height / 2

					var_11_21:setPosition(ccp(var_11_24, var_11_25 + 90))
					arg_11_0.eventLayer:addChild(var_11_21)

					local var_11_26 = string.format("res/ui/common/generalPic/generalPic_%s.jpg", iter_11_5.pic1)
					local var_11_27 = CCSprite:create(var_11_26)
					local var_11_28 = var_11_21:getContentSize()

					var_11_27:setPosition(ccp(var_11_28.width / 2, var_11_28.height / 2))
					tool.scaleTo(var_11_27, 60, 60)
					var_11_21:addChild(var_11_27)

					if arg_11_0.juben.gId == 2 and var_11_19 == 21 then
						if iter_11_5.nextTime then
							local var_11_29 = CCNode:create()
							local var_11_30 = createTimerLabel(iter_11_5.nextTime, language.get(400028), "Thonburi", 20, function()
								local var_14_0 = CCSprite:create("res/ui/juben/event/fb_cfjj_cjzb.png")

								var_14_0:setPosition(ccp(var_11_24 - 78, var_11_25 + 50))
								arg_11_0:addChild(var_14_0)
								var_14_0:runAction(CCSequence:createWithTwoActions(CCMoveBy:create(1, ccp(0, 50)), CCCallFuncN:create(function()
									var_14_0:removeFromParentAndCleanup(true)
								end)))
								var_11_29:removeFromParentAndCleanup(true)
							end)

							var_11_29:addChild(var_11_30)
							var_11_29:setPosition(ccp(var_11_21:getContentSize().width / 2, 80))
							var_11_21:addChild(var_11_29)
						end

						if iter_11_5.deadLine then
							local var_11_31 = createTimerLabel(iter_11_5.deadLine, language.get(400029), "Thonburi", 20, function()
								var_11_21:removeFromParentAndCleanup(true)

								var_11_23.eventSprite = nil
								var_11_23.eventInfo = nil
							end)

							var_11_31:setPosition(ccp(var_11_21:getContentSize().width / 2, -5))
							var_11_21:addChild(var_11_31)
						end
					end

					if arg_11_0.juben.gId == 10 and var_11_19 == 131 and iter_11_5.deadLine and iter_11_5.deadLine > 0 then
						local var_11_32 = CCSprite:create("res/ui/juben/event/jb_head_set_time.png")
						local var_11_33 = createTimerLabel(iter_11_5.deadLine, language.get(400030), "Thonburi", 20, function()
							var_11_21:removeFromParentAndCleanup(true)

							var_11_23.eventSprite = nil
							var_11_23.eventInfo = nil
						end, nil, nil, colorQuality[5])

						var_11_33:setPosition(ccp(132, 15))
						var_11_32:addChild(var_11_33)
						var_11_32:setPosition(ccp(var_11_21:getContentSize().width / 2, -5))
						var_11_21:addChild(var_11_32)
					end

					if arg_11_0.juben.gId == 1 and iter_11_5.addCity == 14 then
						arg_11_0:generalAdd({
							cityId = iter_11_5.addCity,
							leftTime = iter_11_5.nextTime
						})
					end

					if arg_11_0.juben.gId == 11 and iter_11_5.deadLine and iter_11_5.deadLine > 0 then
						local var_11_34 = CCSprite:create("res/ui/juben/event/jb_head_set_time.png")
						local var_11_35 = createTimerLabel(iter_11_5.deadLine, "传令兵 @M:@S", "Thonburi", 20, function()
							var_11_34:removeFromParentAndCleanup(true)
						end, nil, nil, colorQuality[5])

						var_11_35:setPosition(ccp(132, 15))
						var_11_34:addChild(var_11_35)
						var_11_34:setPosition(ccp(var_11_21:getContentSize().width / 2, -5))
						var_11_21:addChild(var_11_34)
					end
				end
			end

			if iter_11_5.marchInfo then
				for iter_11_6, iter_11_7 in pairs(iter_11_5.marchInfo) do
					if arg_11_0.juben.gId == 9 then
						iter_11_7.forceId = iter_11_7.forceId or 4
					end

					arg_11_0.marchingLayer:changeMarchingInfo(iter_11_7, iter_11_5.eventId)
				end
			end

			if iter_11_5.chasingInfo then
				for iter_11_8, iter_11_9 in pairs(var_0_6(iter_11_5.chasingInfo)) do
					if iter_11_9.curCityId then
						arg_11_0.marchingLayer:changeMarchingInfo(iter_11_9, iter_11_5.eventId)
					end
				end
			end

			if iter_11_5.nextTrickTime then
				arg_11_0.juben.infoLayer:showAllTrick(iter_11_5)
			end

			if (iter_11_5.addCity == 163 or iter_11_5.addCity == 157) and arg_11_0.juben.gId == 12 then
				arg_11_0:generalAdd({
					cityId = 163,
					leftTime = iter_11_5.nextTime
				})
				arg_11_0:generalAdd({
					cityId = 157,
					leftTime = iter_11_5.nextTime
				})
			end
		end
	end

	if arg_11_1.action.data.mengdeLocation then
		for iter_11_10, iter_11_11 in pairs(var_0_7({
			location = arg_11_1.action.data.mengdeLocation,
			isSafe = arg_11_1.action.data.isSafe
		})) do
			arg_11_0.marchingLayer:changeMarchingInfo(iter_11_11)
		end
	end

	if arg_11_1.action.data.state == 0 and not user.isYw then
		arg_11_0.juben.guideLayer:showRewardPanel()
		arg_11_0.juben.infoLayer:stopLeftTime()
	end
end

function var_0_0.getCityName(arg_19_0, arg_19_1)
	for iter_19_0, iter_19_1 in pairs(arg_19_0.cities) do
		if iter_19_1.cityId == arg_19_1 then
			return iter_19_1.name
		end
	end
end

function var_0_0.getCityForceId(arg_20_0, arg_20_1)
	for iter_20_0, iter_20_1 in pairs(arg_20_0.cities) do
		if iter_20_1.cityId == arg_20_1 then
			return iter_20_1.forceId
		end
	end
end

function var_0_0.moveTo(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4)
	arg_21_2 = arg_21_2 or false
	arg_21_3 = arg_21_3 or false

	if arg_21_3 and juben.memoryLocation then
		arg_21_0:setContentOffset(juben.memoryLocation)

		return
	end

	local var_21_0 = arg_21_0.cityTable[arg_21_1]

	if var_21_0 == nil then
		return
	end

	local var_21_1 = var_21_0.sprite
	local var_21_2 = var_21_1:getContentSize()
	local var_21_3, var_21_4 = var_21_1:getPosition()
	local var_21_5 = arg_21_0.juben.config:getMap()
	local var_21_6 = var_21_5.column * var_21_5.width
	local var_21_7 = var_21_5.row * var_21_5.height

	if var_21_3 < visibleSize.width / 2 then
		var_21_3 = visibleSize.width / 2
	end

	if var_21_3 > var_21_6 - visibleSize.width / 2 then
		var_21_3 = var_21_6 - visibleSize.width / 2
	end

	if var_21_4 < visibleSize.height / 2 then
		var_21_4 = visibleSize.height / 2
	end

	if var_21_4 > var_21_7 - visibleSize.height / 2 then
		var_21_4 = var_21_7 - visibleSize.height / 2
	end

	if arg_21_2 then
		arg_21_4 = arg_21_4 or 0.15

		arg_21_0:setContentOffsetInDuration(ccp(-var_21_3 + visibleSize.width / 2, -var_21_4 + visibleSize.height / 2), arg_21_4)
	else
		arg_21_0:setContentOffset(ccp(-var_21_3 + visibleSize.width / 2, -var_21_4 + visibleSize.height / 2), arg_21_2)
	end

	juben.memoryLocation = ccp(-var_21_3 + visibleSize.width / 2, -var_21_4 + visibleSize.height / 2)
end

function var_0_0.generalAdd(arg_22_0, arg_22_1)
	if arg_22_0.juben.gId == 2 and arg_22_1.cityId == 21 and arg_22_1.leftTime and arg_22_1.leftTime > 0 then
		local var_22_0 = arg_22_0.cityTable[arg_22_1.cityId]
		local var_22_1, var_22_2 = var_22_0.sprite:getPosition()
		local var_22_3 = var_22_0.eventSprite

		if var_22_3 == nil or tolua.isnull(var_22_3) then
			return
		end

		local var_22_4 = CCNode:create()
		local var_22_5 = createTimerLabel(arg_22_1.leftTime, language.get(400028), "Thonburi", 20, function()
			local var_23_0 = CCSprite:create("res/ui/juben/event/fb_cfjj_cjzb.png")

			var_23_0:setPosition(ccp(var_22_1 - 78, var_22_2 + 50))
			arg_22_0:addChild(var_23_0)
			var_23_0:runAction(CCSequence:createWithTwoActions(CCMoveBy:create(1, ccp(0, 50)), CCCallFuncN:create(function()
				var_23_0:removeFromParentAndCleanup(true)
			end)))
			var_22_4:removeFromParentAndCleanup(true)
		end)

		var_22_4:addChild(var_22_5)
		var_22_4:setPosition(ccp(var_22_3:getContentSize().width / 2, 80))
		var_22_3:addChild(var_22_4)
	end

	if (arg_22_0.juben.gId == 1 and arg_22_1.cityId == 14 or arg_22_0.juben.gId == 12 and (arg_22_1.cityId == 163 or arg_22_1.cityId == 157)) and arg_22_1.leftTime and arg_22_1.leftTime > 0 then
		local var_22_6 = arg_22_0.cityTable[arg_22_1.cityId]
		local var_22_7, var_22_8 = var_22_6.sprite:getPosition()
		local var_22_9 = CCSprite:create("res/ui/juben/event/jb_head_set_time.png")
		local var_22_10 = createTimerLabel(arg_22_1.leftTime, language.get(400031), "Thonburi", 20, function()
			local var_25_0 = CCSprite:create("res/ui/juben/event/fb_cfjj_cjzb.png")

			var_25_0:setPosition(ccp(var_22_7 - 78, var_22_8 + 50))
			arg_22_0:addChild(var_25_0)
			var_25_0:runAction(CCSequence:createWithTwoActions(CCMoveBy:create(1, ccp(0, 50)), CCCallFuncN:create(function()
				var_25_0:removeFromParentAndCleanup(true)
			end)))
			var_22_9:removeFromParentAndCleanup(true)
		end)

		var_22_10:setPosition(ccp(132, 15))
		var_22_9:addChild(var_22_10)
		var_22_9:setPosition(ccp(var_22_7, var_22_8 + 80))
		arg_22_0.eventLayer:addChild(var_22_9)

		if var_22_6.leftTime then
			pcall(var_22_6.leftTime.removeFromParentAndCleanup, var_22_6.leftTime, true)
		end

		var_22_6.leftTime = var_22_9
	end
end

function var_0_0.npcTrick(arg_27_0, arg_27_1)
	if arg_27_1.type == "kongcheng" then
		local var_27_0 = CCSprite:createWithSpriteFrameName("jb_dqjz_debuff_1.png")

		var_27_0:setPosition(ccp(110, 14))
		arg_27_0.cityTable[arg_27_1.cityId].flagSprite:addChild(var_27_0)

		if arg_27_1.lastTime then
			performWithDelay(var_27_0, function()
				var_27_0:removeFromParentAndCleanup(true)
			end, arg_27_1.lastTime / 1000)
		end
	end

	arg_27_0.effectLayer:showNpcTrick(arg_27_1)
end

function var_0_0.changeCity(arg_29_0, arg_29_1)
	if arg_29_0.warOptionTable and not arg_29_0.warOptionTable.isClosed and tonumber(arg_29_0.warOptionTable.cityId) == tonumber(arg_29_1.cityId) and arg_29_1.state and arg_29_1.state ~= 1 then
		log.info(" self.warOptionTable.cityId: ", arg_29_0.warOptionTable.cityId, "city.id: ", arg_29_1.cityId)
		arg_29_0.warOptionTable.optionClosed()
	end

	local var_29_0 = arg_29_1.cityId
	local var_29_1 = arg_29_0.cityTable[var_29_0]

	if not var_29_1 then
		return
	end

	if arg_29_1.state then
		if var_29_1.fireSprite and not tolua.isnull(var_29_1.fireSprite) then
			var_29_1.fireSprite:removeFromParentAndCleanup(true)

			var_29_1.fireSprite = nil
		end

		if var_29_1.surroundSprite and not tolua.isnull(var_29_1.surroundSprite) then
			var_29_1.surroundSprite:removeFromParentAndCleanup(true)

			var_29_1.surroundSprite = nil
		end

		if arg_29_1.state == 1 then
			var_29_1.fireSprite = CCSprite:createWithSpriteFrameName("worldFire_00000.png")

			local var_29_2, var_29_3 = var_29_1.sprite:getPosition()

			var_29_1.fireSprite:setPosition(ccp(var_29_2, var_29_3 + 40))

			local var_29_4 = CCArray:create()

			for iter_29_0 = 0, 4 do
				local var_29_5 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("worldFire_0000" .. iter_29_0 .. ".png")

				if var_29_5 then
					var_29_4:addObject(var_29_5)
				end
			end

			local var_29_6 = CCAnimation:createWithSpriteFrames(var_29_4, 0.1)
			local var_29_7 = CCAnimate:create(var_29_6)
			local var_29_8 = CCRepeatForever:create(var_29_7)
			local var_29_9 = CCRepeatForever:create(var_29_8)

			var_29_1.fireSprite:runAction(var_29_9)
			arg_29_0.cityBatchNode:addChild(var_29_1.fireSprite, 2)
		end
	end

	if tonumber(arg_29_1.nameId) > 0 or tonumber(arg_29_1.slam) > 0 then
		local var_29_10 = arg_29_0.cityTable[var_29_0].sprite
		local var_29_11
		local var_29_12 = var_29_10:getContentSize().width / 2
		local var_29_13 = var_29_10:getContentSize().height / 2

		if tonumber(arg_29_1.slam) > 0 then
			var_29_11 = "bwqh_word_fs.png"
			var_29_13 = var_29_13 + 60
		end

		if tonumber(arg_29_1.nameId) > 0 then
			var_29_11 = "world_city_surround.png"
		end

		local var_29_14 = CCSprite:createWithSpriteFrameName(var_29_11)

		var_29_14:setPosition(var_29_12, var_29_13)
		var_29_10:addChild(var_29_14)

		var_29_1.surroundSprite = var_29_14
	end

	if arg_29_0.eventLayer then
		arg_29_0:updateTj(arg_29_1)
	else
		arg_29_0.cacheTjData = arg_29_0.cacheTjData or {}
		arg_29_0.cacheTjData[arg_29_1.cityId] = arg_29_1
	end
end

function var_0_0.updateTjBar(arg_30_0)
	if arg_30_0.cacheTjData then
		for iter_30_0, iter_30_1 in pairs(arg_30_0.cacheTjData) do
			if iter_30_1 then
				arg_30_0:updateTj(iter_30_1)
			end
		end

		arg_30_0.cacheTjData = nil
	end
end

function var_0_0.updateTj(arg_31_0, arg_31_1)
	if arg_31_1.campType == 1 then
		local var_31_0

		if arg_31_1.campCd and arg_31_1.campCd > 0 then
			var_31_0 = {
				barType = 2,
				endTime = arg_31_1.campCd,
				cityName = arg_31_1.name,
				cityForceId = arg_31_1.forceId,
				cityId = arg_31_1.cityId
			}
		else
			var_31_0 = {
				barType = 3,
				endTime = arg_31_1.campCd,
				cityName = arg_31_1.name,
				cityForceId = arg_31_1.forceId,
				cityId = arg_31_1.cityId
			}
		end

		arg_31_0:updateYwEvent(arg_31_1.cityId, var_31_0)
	end
end

function var_0_0.getCitySprite(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_0.cityTable[arg_32_1]

	if var_32_0 then
		return var_32_0.sprite
	end

	log.warn("JubenMapLayer:getCitySprite failed!!! cityid = %s", arg_32_1)
end

function var_0_0.onTouch(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
	if arg_33_1 == CCTOUCHBEGAN then
		return true
	elseif arg_33_1 == CCTOUCHMOVED then
		-- block empty
	elseif arg_33_1 == CCTOUCHENDED then
		local var_33_0 = eventManager.dispatchEvent("cityWindowIsOpen")

		for iter_33_0, iter_33_1 in pairs(arg_33_0.cityTable) do
			if arg_33_0.warOptionTable and not arg_33_0.warOptionTable.isClosed and tool.checkIfTouch(iter_33_1.sprite, arg_33_2, arg_33_3) then
				arg_33_0.warOptionTable.doWarAction(iter_33_0)

				return
			end

			if not var_33_0 and tool.checkIfTouch(iter_33_1.sprite, arg_33_2, arg_33_3) then
				local var_33_1 = var_0_2.new(iter_33_0)
				local var_33_2, var_33_3 = arg_33_0.cityTable[iter_33_0].sprite:getPosition()

				var_33_1:setPosition(ccp(var_33_2, var_33_3))
				arg_33_0:addChild(var_33_1, var_0_3.cityWindow)

				return
			end

			if iter_33_1.eventInfo and iter_33_1.eventInfo.eventState == 2 and not tolua.isnull(iter_33_1.eventSprite) and tool.checkIfTouch(iter_33_1.eventSprite, arg_33_2, arg_33_3) then
				arg_33_0:showEvent(iter_33_1.eventInfo)
			elseif iter_33_1.eventInfo and iter_33_1.eventInfo.eventState ~= 3 and not tolua.isnull(iter_33_1.eventSprite) and tool.checkIfTouch(iter_33_1.eventSprite, arg_33_2, arg_33_3) then
				arg_33_0.effectLayer:showEventTips(iter_33_1.eventInfo)
			end
		end

		juben.memoryLocation = arg_33_0:getContentOffset()
	end
end

function var_0_0.showEvent(arg_34_0, arg_34_1)
	arg_34_0.juben.guideLayer:showChoice(arg_34_1)
end

function var_0_0.eventOver(arg_35_0, arg_35_1)
	for iter_35_0, iter_35_1 in pairs(arg_35_0.cityTable) do
		if iter_35_1.eventInfo and iter_35_1.eventInfo.eventId == arg_35_1.id and iter_35_1.eventSprite and not tolua.isnull(iter_35_1.eventSprite) then
			iter_35_1.eventSprite:removeFromParentAndCleanup(true)

			iter_35_1.eventSprite = nil
			iter_35_1.eventInfo = nil
		end
	end

	arg_35_0.marchingLayer:eventRemove(arg_35_1.id)

	if arg_35_0.juben.gId == 2 and arg_35_1.id == 24 then
		arg_35_0.juben.infoLayer:zhugeliangTrick()
	end
end

function var_0_0.eventIconRemove(arg_36_0, arg_36_1)
	for iter_36_0, iter_36_1 in pairs(arg_36_0.cityTable) do
		if iter_36_1.eventInfo and iter_36_1.eventInfo.eventId == arg_36_1 then
			iter_36_1.eventSprite:removeFromParentAndCleanup(true)

			iter_36_1.eventSprite = nil
			iter_36_1.eventInfo = nil
		end
	end
end

function var_0_0.changeEventState(arg_37_0, arg_37_1)
	if not arg_37_1.cityId then
		return
	end

	log.info("eventInfo", tool.tableToJson(arg_37_0.cityTable[arg_37_1.cityId].eventInfo))

	if arg_37_0.cityTable[arg_37_1.cityId].eventInfo == nil or arg_37_0.cityTable[arg_37_1.cityId].eventInfo.eventId ~= arg_37_1.eventId then
		arg_37_0.juben:enterJubenScene(false)

		return
	end

	arg_37_0.cityTable[arg_37_1.cityId].eventInfo.eventState = arg_37_1.flag
end

function var_0_0.generalMove(arg_38_0, arg_38_1)
	arg_38_1.cd = arg_38_1.cd or 4000

	if arg_38_1.path ~= nil and arg_38_1.atOnce == false then
		local var_38_0 = {}

		for iter_38_0, iter_38_1 in ipairs(arg_38_1.path) do
			var_38_0[iter_38_0] = tonumber(iter_38_1.cityId)
		end

		if smgr.getLayer("generalMoveLayer") ~= nil then
			traceData.createTrace(arg_38_1.generalId, var_38_0)
		end
	end

	eventManager.dispatchEvent("generalMoveFromTo", arg_38_1.generalId, arg_38_1.orgCityId, arg_38_1.curCityId, arg_38_1.cd, arg_38_1.atOnce)
end

function var_0_0.changeMarchingInfo(arg_39_0, arg_39_1)
	if arg_39_0.marchingLayer then
		arg_39_0.marchingLayer:changeMarchingInfo(arg_39_1)
	end
end

function var_0_0.changeChasingInfo(arg_40_0, arg_40_1)
	local var_40_0 = var_0_6(arg_40_1)

	for iter_40_0, iter_40_1 in pairs(var_40_0) do
		if iter_40_1.curCityId and arg_40_0.marchingLayer then
			arg_40_0.marchingLayer:changeMarchingInfo(iter_40_1)
		end
	end
end

function var_0_0.changeMengdeInfo(arg_41_0, arg_41_1)
	local var_41_0 = var_0_7(arg_41_1)

	for iter_41_0, iter_41_1 in pairs(var_41_0) do
		if iter_41_1.curCityId and arg_41_0.marchingLayer then
			arg_41_0.marchingLayer:changeMarchingInfo(iter_41_1)
		end
	end
end

function var_0_0.getEventState(arg_42_0, arg_42_1)
	for iter_42_0, iter_42_1 in pairs(arg_42_0.events) do
		if iter_42_1.eventId == arg_42_1 then
			return iter_42_1.eventState
		end
	end
end

function var_0_0.onEnter(arg_43_0)
	function arg_43_0.moveToCityRef(arg_44_0)
		arg_43_0:moveTo(arg_44_0)
	end

	function arg_43_0.eventRef(arg_45_0)
		return arg_43_0:getCitySprite(arg_45_0)
	end

	function arg_43_0.followGeneralRef()
		local var_46_0

		if arg_43_0.juben.gId == 12 then
			var_46_0 = arg_43_0.followGeneralId
		end

		return var_46_0
	end

	eventManager.registerEvent("JubenGetCitySprite", arg_43_0.eventRef)
	eventManager.registerEvent("JubenFollowGeneral", arg_43_0.followGeneralRef)
	eventManager.registerEvent("moveToCity", arg_43_0.moveToCityRef)

	var_0_4 = 0
end

function var_0_0.onExit(arg_47_0)
	eventManager.unregisterEvent("JubenGetCitySprite", arg_47_0.eventRef)
	eventManager.unregisterEvent("JubenFollowGeneral", arg_47_0.followGeneralRef)
	eventManager.unregisterEvent("moveToCity", arg_47_0.moveToCityRef)
end

return var_0_0
