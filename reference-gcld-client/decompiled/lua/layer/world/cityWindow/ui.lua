tool.requireRes("world/cityWindow")
require("lua/component/timerLabel")
require("lua/layer/world/eventWindow")

local var_0_0 = cityWindowControl

cityWindowUI = {}
cityWindowUI.uiTable = {}

local function var_0_1(arg_1_0)
	local var_1_0 = smgr.getLayer("worldLayer")
	local var_1_1 = require("lua/layer/world/convene/conveneLayer").getConveneLayer({
		cityId = arg_1_0
	})

	smgr.registerLayer(var_1_1, "ConveneLayer")
	var_1_0:addChild(var_1_1, 105)
	smgr.getLayer("cityWindowLayer"):removeFromParentAndCleanup(true)
	smgr.unregisterLayer("cityWindowLayer")

	cityWindowUI.uiTable = {}
end

local function var_0_2()
	local var_2_0 = var_0_0.battleId
	local var_2_1 = var_0_0.cityId

	smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_CITY_NPC, {
		battleId = var_2_0,
		cityId = var_2_1
	})
end

local function var_0_3()
	var_0_0.shoumai()
end

local function var_0_4()
	var_0_0.coverCd()
end

local function var_0_5()
	var_0_0.fadong()
end

local function var_0_6()
	local var_6_0 = smgr.getLayer("cityWindowLayer")
	local var_6_1 = smgr.getLayer("worldLayer")

	var_6_0:removeFromParentAndCleanup(true)
	smgr.unregisterLayer("cityWindowLayer")

	local var_6_2 = createEventWindow(var_0_0.cityId)

	var_6_1:addChild(var_6_2, 105)
end

function cityWindowUI.init()
	local var_7_0 = smgr.getLayer("cityWindowLayer")

	if cityWindowUI.uiTable.cityWindowBg ~= nil then
		pcall(var_7_0.removeChild, var_7_0, cityWindowUI.uiTable.cityWindowBg, true)

		cityWindowUI.uiTable = {}
	end

	if tonumber(var_0_0.cityId) == 19 or tonumber(var_0_0.cityId) == 123 or tonumber(var_0_0.cityId) == 207 then
		cityWindowUI.uiTable = autoUI.initUI(var_7_0, getCityWindowUiData())
	elseif (tonumber(var_0_0.cityId) == 250 or tonumber(var_0_0.cityId) == 251 or tonumber(var_0_0.cityId) == 252) and (not var_0_0.battleId or var_0_0.shouMaiInfo.ifOurs == false) then
		cityWindowUI.uiTable = autoUI.initUI(var_7_0, getCityWindowUiData())
	else
		cityWindowUI.uiTable = autoUI.initUI(var_7_0, getNormailCityWindowUiData())
	end

	local var_7_1 = tonumber(var_0_0.cityId)

	if var_7_1 == 19 or var_7_1 == 123 or var_7_1 == 207 then
		cityWindowUI.uiTable.instruction:setDimensions(CCSizeMake(256, 200))

		local var_7_2 = createTimerLabel(var_0_0.capitalCityInfo.CountDown1, "@H:@M:@S", "Thonburi-Bold", 20, nil, nil)
		local var_7_3 = createTimerLabel(var_0_0.capitalCityInfo.CountDown2, "@H:@M:@S", "Thonburi-Bold", 20, nil, nil)

		var_7_2:setPosition(ccp(visibleSize.width / 2 + 700 - 480, visibleSize.height / 2 + 399 - 320))
		var_7_3:setPosition(ccp(visibleSize.width / 2 + 700 - 480, visibleSize.height / 2 + 363 - 320))
		var_7_0:addChild(var_7_2, 101)
		var_7_0:addChild(var_7_3, 101)
	end

	if cityWindowUI.uiTable.conveneButton then
		cityWindowUI.uiTable.conveneButton:registerScriptTapHandler(function(arg_8_0)
			var_0_1(var_0_0.cityId)
		end)
	end

	if cityWindowUI.uiTable.lookBattleButton then
		cityWindowUI.uiTable.lookBattleButton:registerScriptTapHandler(function(arg_9_0)
			var_0_2()
		end)
	end

	if cityWindowUI.uiTable.shoumaiButton then
		cityWindowUI.uiTable.shoumaiButton:registerScriptTapHandler(function(arg_10_0)
			var_0_3()
		end)
	end

	if cityWindowUI.uiTable.coverCdButton then
		cityWindowUI.uiTable.coverCdButton:registerScriptTapHandler(function(arg_11_0)
			var_0_4()
		end)
	end

	if cityWindowUI.uiTable.fadongButton then
		cityWindowUI.uiTable.fadongButton:registerScriptTapHandler(function(arg_12_0)
			var_0_5()
		end)
	end

	if cityWindowUI.uiTable.eventButton then
		cityWindowUI.uiTable.eventButton:registerScriptTapHandler(function(arg_13_0)
			var_0_6()
		end)
	end

	if cityWindowUI.uiTable.cityWindowVs then
		cityWindowUI.uiTable.cityWindowVs:setScale(0.6)
	end
end

function cityWindowUI.show(arg_14_0)
	var_0_0.cityId = arg_14_0

	if smgr.getLayer("cityWindowLayer") ~= nil then
		pcall(smgr.getLayer("cityWindowLayer").removeFromParentAndCleanup, smgr.getLayer("cityWindowLayer"), true)
	end

	local var_14_0 = smgr.getLayer("worldLayer")
	local var_14_1 = createBaseLayer()

	smgr.registerLayer(var_14_1, "cityWindowLayer")

	var_14_1.onEnter = var_0_0.onEnter
	var_14_1.onExit = var_0_0.onExit

	var_0_0.getCityDetailInfo(arg_14_0)
	var_14_0:addChild(var_14_1, 106)
end
