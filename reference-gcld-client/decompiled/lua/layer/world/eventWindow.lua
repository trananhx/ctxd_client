local var_0_0 = require("res/native/offset").get("layer.world.eventPannel.cityEventPanel")

local function var_0_1(arg_1_0)
	local var_1_0 = 4

	for iter_1_0 = 1, 2 do
		arg_1_0["optionDescriptionLabel" .. iter_1_0]:setAnchorPoint(ccp(0, 1))
		arg_1_0["optionDescriptionLabel" .. iter_1_0]:setPosition(ccp(115, 96))
		arg_1_0["optionDescriptionLabel" .. iter_1_0]:setDimensions(CCSizeMake(300, 0))
		arg_1_0["optionRewardLabel" .. iter_1_0]:setDimensions(CCSizeMake(300, 0))
		arg_1_0["optionRewardLabel" .. iter_1_0]:setAnchorPoint(ccp(0, 1))
		arg_1_0["optionRewardLabel" .. iter_1_0]:setPosition(ccp(arg_1_0["optionDescriptionLabel" .. iter_1_0]:getPositionX(), arg_1_0["optionDescriptionLabel" .. iter_1_0]:getPositionY() - arg_1_0["optionDescriptionLabel" .. iter_1_0]:getContentSize().height - var_1_0))
	end
end

local function var_0_2(arg_2_0)
	return
end

local function var_0_3(arg_3_0)
	local var_3_0 = 4

	var_0_1(arg_3_0)
	arg_3_0.cost:setAnchorPoint(ccp(0, 1))
	arg_3_0.cost:setDimensions(CCSizeMake(300, 0))
	arg_3_0.cost:setHorizontalAlignment(kCCTextAlignmentLeft)
	arg_3_0.cost:setPosition(ccp(arg_3_0.optionRewardLabel2:getPositionX(), arg_3_0.optionRewardLabel2:getPositionY() - arg_3_0.optionRewardLabel2:getContentSize().height - var_3_0))
end

local var_0_4 = 1001
local var_0_5

local function var_0_6(arg_4_0)
	local var_4_0 = smgr.getLayer("eventWindow")
	local var_4_1 = smgr.getLayer("worldCamera")

	if arg_4_0.action.data.cityEvent.eventCount == 0 then
		local var_4_2 = var_4_1.cityTable["world_building_" .. arg_4_0.action.data.cityId]

		pcall(var_4_2.eventSprite.removeFromParentAndCleanup, var_4_2.eventSprite, true)

		var_4_2.eventSprite = nil
		var_4_2.eventInfo = nil

		local var_4_3 = arg_4_0.action.data.eventReward
		local var_4_4 = {}

		for iter_4_0, iter_4_1 in pairs(var_4_3) do
			if iter_4_1.type == 5 then
				iter_4_1.type = 6
			end

			var_4_4[iter_4_0] = {}
			var_4_4[iter_4_0].id = iter_4_1.type
			var_4_4[iter_4_0].value = iter_4_1.num
		end

		globalAction_gotResource(var_4_4)
	end

	pcall(var_4_0.removeFromParentAndCleanup, var_4_0, true)
	smgr.unregisterLayer("eventWindow")

	worldControl.lock = false
	worldControl.thumbnailIconTable["city_" .. arg_4_0.action.data.cityId] = nil

	worldThumbnailUI.updateEventNum()
end

local function var_0_7(arg_5_0)
	require("lua/layer/world/eventPanelData")

	local var_5_0 = CCLayerColor:create(ccc4(255, 0, 255, 0))

	var_5_0:registerScriptTouchHandler(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == CCTOUCHBEGAN then
			return true
		elseif arg_6_0 == CCTOUCHMOVED then
			return true
		elseif arg_6_0 == CCTOUCHENDED then
			pcall(var_5_0.removeFromParentAndCleanup, var_5_0, true)

			return true
		end
	end, false, true)
	var_5_0:setTouchEnabled(true)

	worldControl.lock = true

	local var_5_1 = smgr.getLayer("eventWindow")
	local var_5_2 = {}

	autoUI.createUI(var_5_0, getCityEventPanelUiData(), var_5_2)
	var_5_1:addChild(var_5_0)

	local var_5_3 = arg_5_0.action.data

	if var_5_3.eventOrdinary then
		local var_5_4 = var_5_3.eventOrdinary
		local var_5_5 = {
			"res/ui/common/ItemsPic/ying.jpg",
			"res/ui/common/ItemsPic/mucai.jpg",
			"res/ui/common/ItemsPic/liang.jpg",
			"res/ui/common/ItemsPic/kuang.jpg",
			"res/ui/common/ItemsPic/jingyan.jpg"
		}
		local var_5_6 = {
			language.get(10101),
			language.get(10102),
			language.get(10103),
			language.get(10104),
			language.get(10107)
		}

		var_5_2["eventPic" .. 1]:setDisplayFrame(CCSprite:create(var_5_5[var_5_4.reward1Type]):displayFrame())
		var_5_2["optionDescriptionLabel" .. 1]:setString(var_5_4.desc1)
		var_5_2["optionDescriptionLabel" .. 1]:setDimensions(CCSizeMake(280, 0))

		local var_5_7 = language.get("201001_lxr", var_5_6[var_5_4.reward1Type] .. "×" .. var_5_4.reward1Num)

		var_5_2["optionRewardLabel" .. 1]:setString(var_5_7)

		if var_5_4.reward2Type then
			var_5_2["eventPic" .. 2]:setDisplayFrame(CCSprite:create(var_5_5[var_5_4.reward2Type]):displayFrame())
			var_5_2["optionDescriptionLabel" .. 2]:setString(var_5_4.desc2)
			var_5_2["optionDescriptionLabel" .. 2]:setDimensions(CCSizeMake(280, 0))

			local var_5_8 = language.get("201001_lxr", var_5_6[var_5_4.reward2Type] .. "×" .. var_5_4.reward2Num)

			var_5_2["optionRewardLabel" .. 2]:setString(var_5_8)
		else
			var_5_2.cityEventChoice2:setVisible(false)
		end

		var_5_2.generalPic:setDisplayFrame(CCSprite:create("res/ui/common/halfPic/halfPic_" .. var_5_4.gPic .. ".png"):displayFrame())
		var_5_2.eventDesLabel:setString(var_5_4.desc)

		if conf.language == "vie" then
			var_5_2.eventDesLabel:setDimensions(CCSizeMake(370, 0))
		end

		var_5_2["optionButton" .. 1]:registerScriptTapHandler(function(arg_7_0)
			cmgr.sendRequest(var_0_6, actions.dealCityEvent, var_0_5, 1)
		end)
		var_5_2["optionButton" .. 2]:registerScriptTapHandler(function(arg_8_0)
			cmgr.sendRequest(var_0_6, actions.dealCityEvent, var_0_5, 2)
		end)
	elseif var_5_3.eventFight then
		-- block empty
	end
end

local function var_0_8(arg_9_0, arg_9_1)
	local var_9_0 = smgr.getLayer("eventWindow")

	if not var_9_0 then
		return
	end

	local var_9_1 = var_9_0:getChildByTag(var_0_4)

	if var_9_1 and tool.checkIfTouch(var_9_1, arg_9_0, arg_9_1) then
		-- block empty
	else
		pcall(var_9_0.removeFromParentAndCleanup, var_9_0, true)
		smgr.unregisterLayer("eventWindow")

		worldControl.lock = false
	end
end

local function var_0_9()
	eventManager.registerEvent("eventWindowOnTap", var_0_8)
end

local function var_0_10()
	eventManager.unregisterEvent("eventWindowOnTap", var_0_8)

	worldControl.lock = false
end

function createEventWindow(arg_12_0)
	var_0_5 = arg_12_0

	local var_12_0 = createBaseLayer()

	smgr.registerLayer(var_12_0, "eventWindow")

	var_12_0.onEnter = var_0_9
	var_12_0.onExit = var_0_10

	cmgr.sendRequest(var_0_7, actions.getCityEventPanel, arg_12_0)

	return var_12_0
end

local function var_0_11(arg_13_0)
	local var_13_0 = smgr.getLayer("eventWindow")
	local var_13_1 = smgr.getLayer("worldCamera").cityTable["world_building_" .. arg_13_0.action.data.cityId]

	pcall(var_13_1.eventSprite.removeFromParentAndCleanup, var_13_1.eventSprite, true)
	pcall(var_13_0.removeFromParentAndCleanup, var_13_0, true)
	smgr.unregisterLayer("eventWindow")

	var_13_1.eventSprite = nil
	var_13_1.eventInfo = nil

	local var_13_2 = {}
	local var_13_3 = {
		gain_29 = 42,
		gain_36 = 36,
		gain_43 = 1701,
		gain_56 = 56,
		gain_58 = 58,
		gain_53 = 1704,
		gain_61 = 20051,
		gain_66 = 66,
		gain_24 = 41,
		gain_59 = 59,
		gain_86 = 10066,
		gain_52 = 1703,
		gain_49 = 10015,
		gain_87 = 10067,
		gain_88 = 10068,
		gain_35 = 35,
		gain_55 = 55,
		gain_48 = 10014,
		gain_60 = 60,
		gain_7 = 7,
		gain_54 = 1705,
		gain_51 = 1702,
		gain_44 = 10002,
		gain_37 = 37,
		gain_65 = 10051,
		gain_50 = 10016
	}

	for iter_13_0, iter_13_1 in pairs(arg_13_0.action.data.playerEvent.gain) do
		var_13_2[#var_13_2 + 1] = {}
		var_13_2[#var_13_2].id = var_13_3["gain_" .. iter_13_1.gainType]
		var_13_2[#var_13_2].value = iter_13_1.gainNum
	end

	globalAction_gotResource(var_13_2)

	worldControl.lock = false
	worldControl.thumbnailIconTable["city_" .. arg_13_0.action.data.cityId] = nil

	worldThumbnailUI.updateEventNum()
end

local function var_0_12(arg_14_0)
	local var_14_0 = {}

	var_14_0[1001] = "res/ui/common/ItemsPic/kuang.jpg"
	var_14_0[1002] = "res/ui/common/ItemsPic/mucai.jpg"
	var_14_0[1003] = "res/ui/common/ItemsPic/xuantieyuanshi.jpg"
	var_14_0[1006] = "res/ui/common/ItemsPic/tuntianling.jpg"
	var_14_0[1007] = "res/ui/common/ItemsPic/ying.jpg"
	var_14_0[1008] = "res/ui/common/generalPic/generalPic_tufei.jpg"
	var_14_0[1009] = "1009"
	var_14_0[1011] = "res/ui/world/world_silk.jpg"
	var_14_0[1012] = "res/ui/activity/GeneralReward/kssj_icon_nr.jpg"
	var_14_0[1013] = "res/ui/common/ItemsPic/ying.jpg"
	var_14_0[1014] = "res/ui/activity/dragonBoat/icon_shuishou.jpg"
	var_14_0[1016] = "res/ui/activity/dragonBoat/icon_deer.jpg"
	var_14_0[1017] = "res/ui/activity/meteorite/sczys_icon_01.png"

	if not var_14_0[arg_14_0.action.data.playerEvent.eventType] then
		log.error("unrecognized event type !!!")

		return
	end

	local var_14_1 = {
		[1001] = language.get("200108_lxr"),
		[1002] = language.get("200109_lxr"),
		[1003] = language.get("200110_lxr"),
		[1006] = language.get("200111_lxr"),
		[1007] = language.get(200122),
		[1008] = language.get("200112_lxr"),
		[1011] = language.get("122109_silk_qym"),
		[1012] = language.get(135995),
		[1013] = language.get("222105_juexingJiu"),
		[1014] = language.get(136302),
		[1016] = language.get(136295)
	}
	local var_14_2 = {
		[1001] = language.get("200113_lxr"),
		[1002] = language.get("200113_lxr"),
		[1003] = language.get("200113_lxr"),
		[1006] = language.get("200113_lxr"),
		[1007] = language.get("200113_lxr"),
		[1008] = language.get("200114_lxr"),
		[1011] = language.get("122110_silk_qym"),
		[1012] = language.get(135997),
		[1013] = language.get("222104_juexingJiu"),
		[1014] = language.get(136263),
		[1016] = language.get(136285)
	}
	local var_14_3 = {
		[29] = language.get("200115_lxr", "%s"),
		[44] = language.get("200116_lxr", "%s"),
		[7] = language.get("200117_lxr", "%s"),
		[24] = language.get("200118_lxr", "%s"),
		[43] = language.get("200119_lxr", "%s"),
		[35] = language.get(200123, "%s"),
		[36] = language.get(200124, "%s"),
		[37] = language.get(200125, "%s"),
		[51] = language.get("200119_lxr_1", "%s"),
		[52] = language.get("200119_lxr_2", "%s"),
		[53] = language.get("200119_lxr_3", "%s"),
		[54] = language.get("200119_lxr_4", "%s"),
		[55] = language.get("122111_silk_qym", "%s"),
		[56] = language.get(136017, "%s"),
		[58] = language.get("222101_juexingJiu", "%s"),
		[59] = language.get("222102_juexingJiu", "%s"),
		[60] = language.get("222103_juexingJiu", "%s"),
		[61] = language.get(136303, "%s"),
		[65] = language.get(136296, "%s"),
		[66] = language.get(136520, "%s")
	}
	local var_14_4 = {
		[2] = language.get("200120_lxr", "%s"),
		[4] = language.get("200121_lxr", "%s"),
		[11] = language.get("200122_zww", "%s")
	}
	local var_14_5 = {}

	var_14_5[1001] = "res/ui/common/halfPic/halfPic_baoshishangren.png"
	var_14_5[1002] = "res/ui/common/halfPic/halfPic_zhangjiao.png"
	var_14_5[1003] = "res/ui/comment/xiaoqian.png"
	var_14_5[1006] = "res/ui/comment/xiaoqian.png"
	var_14_5[1007] = "res/ui/comment/xiaoqian.png"
	var_14_5[1008] = "res/ui/comment/xiaoqian.png"
	var_14_5[1011] = "res/ui/comment/xiaoqian.png"
	var_14_5[1012] = "res/ui/comment/xiaoqian.png"
	var_14_5[1013] = "res/ui/comment/xiaoqian.png"
	var_14_5[1014] = "res/ui/comment/xiaoqian.png"
	var_14_5[1016] = "res/ui/comment/xiaoqian.png"

	local var_14_6 = arg_14_0.action.data.playerEvent

	require("lua/layer/world/eventPanelData")

	local var_14_7 = CCLayerColor:create(ccc4(255, 0, 255, 0))

	var_14_7:registerScriptTouchHandler(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == CCTOUCHBEGAN then
			return true
		elseif arg_15_0 == CCTOUCHMOVED then
			return true
		elseif arg_15_0 == CCTOUCHENDED then
			pcall(var_14_7.removeFromParentAndCleanup, var_14_7, true)

			return true
		end
	end, false, true)
	var_14_7:setTouchEnabled(true)

	worldControl.lock = true

	local var_14_8 = smgr.getLayer("eventWindow")
	local var_14_9 = {}

	if var_14_6.eventType == 1009 or var_14_6.eventType == 1017 then
		autoUI.createUI(var_14_7, getCityEventPanelUiData(), var_14_9)
		var_14_8:addChild(var_14_7)

		local var_14_10 = {
			[49] = "res/ui/activity/gemsActivity/new/xsczbs_icon_02.png",
			[87] = "res/ui/activity/meteorite/sczys_icon_02.png",
			[48] = "res/ui/activity/gemsActivity/new/xsczbs_icon_01.png",
			[50] = "res/ui/activity/gemsActivity/new/xsczbs_icon_03.png",
			[86] = "res/ui/activity/meteorite/sczys_icon_01.png",
			[88] = "res/ui/activity/meteorite/sczys_icon_03.png"
		}
		local var_14_11 = {
			[48] = language.get(135557),
			[49] = language.get(135558),
			[50] = language.get(135559),
			[86] = language.get(217103),
			[87] = language.get(217104),
			[88] = language.get(217105)
		}

		var_14_9["eventPic" .. 1]:setDisplayFrame(CCSprite:create(var_14_10[var_14_6.gain[1].gainType]):displayFrame())
		var_14_9["optionDescriptionLabel" .. 1]:setString(var_14_6.plot1)
		var_14_9["optionDescriptionLabel" .. 1]:setPosition(ccp(115, 85))

		local var_14_12 = language.get("201001_lxr", var_14_11[var_14_6.gain[1].gainType] .. "×" .. var_14_6.gain[1].gainNum)

		var_14_9["optionRewardLabel" .. 1]:setString(var_14_12)
		var_14_9["optionRewardLabel" .. 1]:setPosition(ccp(115, 58))
		var_14_9["eventPic" .. 2]:setDisplayFrame(CCSprite:create(var_14_10[var_14_6.gain2[1].gainType]):displayFrame())
		var_14_9["optionDescriptionLabel" .. 2]:setString(var_14_6.plot2)
		var_14_9["optionDescriptionLabel" .. 2]:setPosition(ccp(115, 85))

		local var_14_13 = language.get("201001_lxr", var_14_11[var_14_6.gain2[1].gainType] .. "×" .. var_14_6.gain2[1].gainNum)

		var_14_9["optionRewardLabel" .. 2]:setString(var_14_13)
		var_14_9["optionRewardLabel" .. 2]:setPosition(ccp(115, 58))
		var_14_9.generalPic:setDisplayFrame(CCSprite:create("res/ui/common/halfPic/halfPic_" .. var_14_6.pic .. ".png"):displayFrame())
		var_14_9.eventDesLabel:setDimensions(CCSizeMake(420, 0))
		var_14_9.eventDesLabel:setString(var_14_6.greeting)
		var_14_9["optionButton" .. 1]:registerScriptTapHandler(function(arg_16_0)
			cmgr.sendRequest(var_0_11, actions.dealFamousEvent, var_0_5, 1)
		end)
		var_14_9["optionButton" .. 2]:registerScriptTapHandler(function(arg_17_0)
			cmgr.sendRequest(var_0_11, actions.dealFamousEvent, var_0_5, 2)
		end)

		if var_14_6.cost2[1].costNum > 0 then
			local var_14_14 = string.format(var_14_4[var_14_6.cost2[1].costType], var_14_6.cost2[1].costNum)
			local var_14_15 = CCStrokeLabelTTF:create(var_14_14, "", 22 + (var_0_0.fntSize or 0))

			var_14_15:setColor(colorQuality[5])
			var_14_15:setPosition(ccp(115, 30))
			var_14_15:setAnchorPoint(ccp(0, 0.5))
			var_14_9.optionRewardLabel2:getParent():addChild(var_14_15, 200)

			var_14_9.cost = var_14_15
		end

		var_0_3(var_14_9)
	else
		autoUI.createUI(var_14_7, getPlayerEventPanelUiData(), var_14_9)
		var_14_8:addChild(var_14_7)
		var_14_9.generalPic:setDisplayFrame(CCSprite:create(var_14_5[var_14_6.eventType]):displayFrame())

		if var_14_6.eventType == 1003 or var_14_6.eventType == 1006 or var_14_6.eventType == 1007 or var_14_6.eventType == 1008 or var_14_6.eventType == 1011 or var_14_6.eventType == 1012 or var_14_6.eventType == 1013 or var_14_6.eventType == 1014 or var_14_6.eventType == 1016 then
			var_14_9.generalPic:setScale(0.53)
			var_14_9.generalPic:setPosition(ccp(65, 158))
		end

		var_14_9.eventDesLabel:setString(var_14_1[var_14_6.eventType])

		if conf.language == "vie" then
			var_14_9.eventDesLabel:setDimensions(CCSizeMake(440, 0))
		end

		var_14_9.eventPic:setDisplayFrame(CCSprite:create(var_14_0[var_14_6.eventType]):displayFrame())

		if var_14_6.eventType == 1006 then
			if var_14_6.gain[1].gainType == 51 then
				var_14_9.eventPic:setDisplayFrame(CCSprite:create("res/ui/common/ItemsPic/tuntianling1.jpg"):displayFrame())
			elseif var_14_6.gain[1].gainType == 52 then
				var_14_9.eventPic:setDisplayFrame(CCSprite:create("res/ui/common/ItemsPic/tuntianling2.jpg"):displayFrame())
			elseif var_14_6.gain[1].gainType == 53 then
				var_14_9.eventPic:setDisplayFrame(CCSprite:create("res/ui/common/ItemsPic/tuntianling3.jpg"):displayFrame())
			elseif var_14_6.gain[1].gainType == 54 then
				var_14_9.eventPic:setDisplayFrame(CCSprite:create("res/ui/common/ItemsPic/tuntianling4.jpg"):displayFrame())
			end
		elseif var_14_6.eventType == 1011 then
			if var_14_6.gain[1].gainType == 55 then
				var_14_9.eventPic:setDisplayFrame(CCSprite:create("res/ui/world/world_silk.jpg"):displayFrame())
			end
		elseif var_14_6.eventType == 1013 then
			if var_14_6.gain[1].gainType == 58 then
				var_14_9.eventPic:setDisplayFrame(tool.spriteFrameByName("lbg.jpg"))
			elseif var_14_6.gain[1].gainType == 59 then
				var_14_9.eventPic:setDisplayFrame(tool.spriteFrameByName("neh.jpg"))
			elseif var_14_6.gain[1].gainType == 60 then
				var_14_9.eventPic:setDisplayFrame(tool.spriteFrameByName("zyq.jpg"))
			elseif var_14_6.gain[1].gainType == 66 then
				var_14_9.eventPic:setDisplayFrame(tool.spriteFrameByName("xhj.jpg"))
			end
		end

		var_14_9.optionDescriptionLabel:setString(var_14_2[var_14_6.eventType])

		if var_14_6.gain and var_14_6.gain[1] then
			local var_14_16 = var_14_6.gain[1]

			if conf.language == "vie" then
				var_14_9.optionRewardLabel:setDimensions(CCSizeMake(280, 0))
				var_14_9.optionRewardLabel:setPosition(ccp(115, 53))
			end

			var_14_9.optionRewardLabel:setString(string.format(var_14_3[var_14_16.gainType], var_14_16.gainNum))
		end

		if var_14_6.cost and var_14_6.cost[1] then
			local var_14_17 = var_14_6.cost[1]

			var_14_9.optionCostLabel:setString(string.format(var_14_4[var_14_17.costType], var_14_17.costNum))

			if conf.language == "vie" then
				var_14_9.optionCostLabel:setPosition(ccp(115, 22))
			end
		end

		var_14_9.optionButton:registerScriptTapHandler(function(arg_18_0)
			cmgr.sendRequest(var_0_11, actions.dealPlayerEvent, var_0_5)
		end)
	end
end

function createPlayerEventWindow(arg_19_0)
	var_0_5 = arg_19_0

	local var_19_0 = createBaseLayer()

	smgr.registerLayer(var_19_0, "eventWindow")

	var_19_0.onEnter = var_0_9
	var_19_0.onExit = var_0_10

	cmgr.sendRequest(var_0_12, actions.getPEPanel, arg_19_0)

	return var_19_0
end
