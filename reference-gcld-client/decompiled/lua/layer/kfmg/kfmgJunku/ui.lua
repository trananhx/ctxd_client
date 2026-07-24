local var_0_0 = class("kfmgJunku", function()
	return CCLayer:create()
end)

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.world = arg_2_1
	arg_2_0.uidata = require("lua/layer/kfmg/kfmgJunku/uidata").new(arg_2_0)
	arg_2_0.control = require("lua/layer/kfmg/kfmgJunku/control").new(arg_2_0)

	arg_2_0:registerScriptHandler(function(arg_3_0)
		if arg_3_0 == "enter" then
			arg_2_0:onEnter()
		elseif arg_3_0 == "exit" then
			arg_2_0:onExit()
		end
	end)
	arg_2_0:setTouchEnabled(true)
	arg_2_0:registerScriptTouchHandler(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == CCTOUCHBEGAN then
			arg_2_0:onTouchBegan(arg_4_1, arg_4_2)

			return true
		elseif arg_4_0 == CCTOUCHMOVED then
			arg_2_0:onTouchMoved(arg_4_1, arg_4_2)

			return true
		elseif arg_4_0 == CCTOUCHENDED then
			arg_2_0:onTouchEnded(arg_4_1, arg_4_2)

			return true
		end
	end, false, true)
	arg_2_0:init()
end

function var_0_0.init(arg_5_0)
	arg_5_0.uiTable = autoUI.initUI(arg_5_0, arg_5_0.uidata:getData())

	arg_5_0.uiTable.closeButton:registerScriptTapHandler(function()
		arg_5_0:close()
	end)
	arg_5_0.control:refreshData()
end

function var_0_0.initData(arg_7_0, arg_7_1)
	arg_7_0.junkuData = arg_7_1

	local var_7_0 = {
		"gcc",
		"fhd",
		"pdl",
		"jyl"
	}

	for iter_7_0 = 1, #arg_7_0.junkuData.items do
		local var_7_1 = arg_7_0.junkuData.items[iter_7_0]

		arg_7_0.uiTable["titlePic_" .. iter_7_0]:setDisplayFrame(CCSprite:create("res/ui/kfmg/kfmgJunKu/text/" .. var_7_0[var_7_1.id] .. ".png"):displayFrame())
		arg_7_0.uiTable["iconPic_" .. iter_7_0]:setDisplayFrame(CCSprite:create("res/ui/kfmg/kfmgJunKu/" .. var_7_0[var_7_1.id] .. ".jpg"):displayFrame())
		arg_7_0.uiTable["useNum_" .. iter_7_0]:setString(var_7_1.num - var_7_1.useNum .. "/" .. var_7_1.num)
		arg_7_0.uiTable["introLabel_" .. iter_7_0]:setString(var_7_1.intro)
		arg_7_0.uiTable["useGold" .. iter_7_0]:setString(var_7_1.gold)
		tool.fixNodePosByMid({
			arg_7_0.uiTable["titlePic_" .. iter_7_0],
			arg_7_0.uiTable["useNum_" .. iter_7_0]
		}, 103)
		arg_7_0.uiTable["useButton_" .. iter_7_0]:addHandleOfControlEvent(function()
			arg_7_0.control:useItemWithId(var_7_1.id, var_7_1.gold, language.get("hw_kfmg_00001" .. 3 + iter_7_0))
		end, CCControlEventTouchUpInside)
	end
end

function var_0_0.showSelectNation(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	local var_9_0 = CCLayerColor:create(ccc4(0, 0, 0, 120))

	var_9_0:setTouchEnabled(true)
	var_9_0:registerScriptTouchHandler(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == CCTOUCHBEGAN then
			if not tolua.isnull(arg_9_0.uiTable.nationBg) then
				if tool.checkIfTouch(arg_9_0.uiTable.nationBg, arg_10_1, arg_10_2) then
					arg_9_0.isTouchBeganInside = true
				else
					arg_9_0.isTouchBeganInside = false
				end
			end

			return true
		elseif arg_10_0 == CCTOUCHMOVED then
			return true
		elseif arg_10_0 == CCTOUCHENDED then
			if not tolua.isnull(arg_9_0.uiTable.nationBg) and not tool.checkIfTouch(arg_9_0.uiTable.nationBg, arg_10_1, arg_10_2) and not arg_9_0.isTouchBeganInside then
				var_9_0:removeFromParentAndCleanup(true)
			end

			return true
		end
	end, false, true)
	smgr.rootLayer:addChild(var_9_0, 9)

	arg_9_0.mask = var_9_0

	autoUI.createUI(var_9_0, arg_9_0.uidata:getSelectNationData(), arg_9_0.uiTable)

	for iter_9_0 = 1, 3 do
		arg_9_0.uiTable["nationNamePic_" .. iter_9_0]:registerScriptTapHandler(function()
			arg_9_0:useGcc(iter_9_0, arg_9_2, arg_9_3)
		end)
	end

	arg_9_0.uiTable.junkucloseButton:registerScriptTapHandler(function()
		var_9_0:removeFromParentAndCleanup(true)
	end)
end

function var_0_0.useGcc(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	log.info("useGcc")

	local var_13_0 = {}
	local var_13_1 = {}
	local var_13_2 = {}
	local var_13_3 = {}

	if user.player.kfForceId == 1 then
		var_13_0 = {
			language.get(91010),
			language.get(91011),
			language.get("85040_sunc")
		}
		var_13_1 = {
			language.get("world_city_19"),
			language.get("world_city_207"),
			language.get("world_city_105")
		}
		var_13_2 = {
			19,
			207,
			105
		}
		var_13_3 = {
			2,
			3,
			6002
		}
	elseif user.player.kfForceId == 2 then
		var_13_0 = {
			language.get(91009),
			language.get(91011),
			language.get("85040_sunc")
		}
		var_13_1 = {
			language.get("world_city_123"),
			language.get("world_city_207"),
			language.get("world_city_105")
		}
		var_13_2 = {
			123,
			207,
			105
		}
		var_13_3 = {
			1,
			3,
			6002
		}
	elseif user.player.kfForceId == 3 then
		var_13_0 = {
			language.get(91009),
			language.get(91010),
			language.get("85040_sunc")
		}
		var_13_1 = {
			language.get("world_city_123"),
			language.get("world_city_19"),
			language.get("world_city_105")
		}
		var_13_2 = {
			123,
			19,
			105
		}
		var_13_3 = {
			1,
			2,
			6002
		}
	end

	messageBox.confirm(language.get("hw_kfmg_000019", arg_13_2, var_13_0[arg_13_1], "【" .. var_13_1[arg_13_1] .. "】", arg_13_3), function()
		local function var_14_0(arg_15_0)
			if arg_15_0.state == 1 then
				arg_13_0.control:showUseSucceedText()
				eventManager.dispatchEvent("getYzWorldMap", true)
				arg_13_0:close()
				eventManager.dispatchEvent("moveToCity", var_13_2[arg_13_1])
			end
		end

		kfcmgr.sendRequest(var_14_0, actions.kfyzUseArmyBaseInfo, 1, var_13_3[arg_13_1])
	end)
end

function var_0_0.getWorldMap(arg_16_0, arg_16_1)
	if tonumber(arg_16_1.effect) == 2 then
		eventManager.dispatchEvent("getYzWorldMap", true)
	end
end

function var_0_0.close(arg_17_0)
	arg_17_0:removeFromParentAndCleanup(true)

	if not tolua.isnull(arg_17_0.mask) then
		arg_17_0.mask:removeFromParentAndCleanup(true)
	end
end

function var_0_0.onEnter(arg_18_0)
	return
end

function var_0_0.onExit(arg_19_0)
	return
end

function var_0_0.onTouchBegan(arg_20_0, arg_20_1, arg_20_2)
	return true
end

function var_0_0.onTouchMoved(arg_21_0, arg_21_1, arg_21_2)
	return true
end

function var_0_0.onTouchEnded(arg_22_0, arg_22_1, arg_22_2)
	return true
end

return var_0_0
