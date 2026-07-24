require("lua/layer/general/ui")
require("lua/layer/resource/ui")

local var_0_0 = class("KfMenuLayer", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.world = arg_2_1
	arg_2_0.uiTable = autoUI.initUI(arg_2_0, arg_2_0:getUiData())

	arg_2_0.uiTable.mainCity:registerScriptTapHandler(function()
		pcall(kfcmgr.disconnectFromServer)
		smgr.changeScene(SCENE_MAIN_CITY)
	end)
	arg_2_0.uiTable.kuafu:registerScriptTapHandler(function()
		local var_4_0 = require("lua/layer/kfworld/kfgzRank/kfgzRank")

		var_4_0:destory()
		var_4_0:create()
		eventManager.dispatchEvent("kfWorldExpandClick", false)
	end)
	arg_2_0.uiTable.resource:registerScriptTapHandler(function()
		resourceUI.show()
	end)
	arg_2_0.uiTable.general:registerScriptTapHandler(function()
		showGeneralPanel(nil, true)
	end)
end

function var_0_0.handlerGetWorldMapAction(arg_7_0, arg_7_1)
	if user.kfworldId == 2 and arg_7_0.waterGauge == nil then
		local var_7_0 = require("lua/layer/kfworld/WaterGauge").new()

		var_7_0:setPosition(visibleSize.width - 40 - platform.getSafeDistance(), 300)
		arg_7_0:addChild(var_7_0)
		var_7_0:updateChangeRoadInfo(arg_7_1.data.changeRoad[1])

		arg_7_0.waterGauge = var_7_0
	end
end

function var_0_0.changeRank(arg_8_0, arg_8_1)
	if arg_8_1.selfBRank > 0 and arg_8_1.selfBRank <= 40 then
		arg_8_0.uiTable.rankTitlePlus:setVisible(false)
		arg_8_0.uiTable.rankValueAtlas:setString(tostring(arg_8_1.selfBRank))

		if arg_8_1.selfBRank > 0 and arg_8_1.selfBRank <= 5 then
			arg_8_0.uiTable.rankTitlePic:setDisplayFrame(CCSprite:create("res/ui/kfworld/rank/rank_name_wsjs.png"):displayFrame())
		elseif arg_8_1.selfBRank > 5 and arg_8_1.selfBRank <= 10 then
			arg_8_0.uiTable.rankTitlePic:setDisplayFrame(CCSprite:create("res/ui/kfworld/rank/rank_name_yjdq.png"):displayFrame())
		elseif arg_8_1.selfBRank > 10 and arg_8_1.selfBRank <= 20 then
			arg_8_0.uiTable.rankTitlePic:setDisplayFrame(CCSprite:create("res/ui/kfworld/rank/rank_name_yydb.png"):displayFrame())
		elseif arg_8_1.selfBRank > 20 and arg_8_1.selfBRank <= 30 then
			arg_8_0.uiTable.rankTitlePic:setDisplayFrame(CCSprite:create("res/ui/kfworld/rank/rank_name_sbkd.png"):displayFrame())
		elseif arg_8_1.selfBRank > 30 and arg_8_1.selfBRank <= 40 then
			arg_8_0.uiTable.rankTitlePic:setDisplayFrame(CCSprite:create("res/ui/kfworld/rank/rank_name_wmxz.png"):displayFrame())
		end
	else
		arg_8_0.uiTable.rankTitlePic:setDisplayFrame(CCSprite:create("res/ui/world/hourRank/rank_name_none.png"):displayFrame())
		arg_8_0.uiTable.rankValueAtlas:setString("40")
		arg_8_0.uiTable.rankTitlePlus:setVisible(true)
	end
end

function var_0_0.changeMatchState(arg_9_0, arg_9_1)
	log.info("MenuLayer:changeMatchState(%s)", arg_9_1)

	if arg_9_1 == 2 then
		arg_9_0.uiTable.openbar:setVisible(true)
		arg_9_0.uiTable.kuafu:setVisible(true)
		arg_9_0.uiTable.resource:setVisible(true)
		arg_9_0.uiTable.general:setVisible(true)
		arg_9_0.uiTable.rankFlag:setVisible(true)
	else
		arg_9_0.uiTable.openbar:setVisible(false)
		arg_9_0.uiTable.kuafu:setVisible(false)
		arg_9_0.uiTable.resource:setVisible(false)
		arg_9_0.uiTable.general:setVisible(false)
		arg_9_0.uiTable.rankFlag:setVisible(false)
	end
end

function var_0_0.getUiData(arg_10_0)
	local var_10_0 = {}

	local function var_10_1(arg_11_0, arg_11_1)
		arg_11_0[#arg_11_0 + 1] = arg_11_1

		return arg_11_1
	end

	var_10_0.background = {
		down = 0,
		type = "pic",
		pic = "res/ui/mainUI/footer_r_view.png",
		right = 0,
		children = {}
	}

	var_10_1(var_10_0.background.children, {
		z = -1,
		name = "openbar",
		x = 160,
		type = "pic",
		y = 23,
		pic = "res/ui/mainUI/footer_r_open_view.png"
	})
	var_10_1(var_10_0.background.children, {
		name = "menu",
		type = "button",
		buttons = {
			{
				pic2 = "res/ui/kfworld/kfgz_view_zc_btn_c.png",
				name = "mainCity",
				pic1 = "res/ui/kfworld/kfgz_view_zc_btn_a.png",
				y = 49,
				x = 94.5
			},
			{
				pic2 = "res/ui/kfworld/navi_l_kf_click.png",
				pic3 = "res/ui/kfworld/navi_l_kf_gray.png",
				pic1 = "res/ui/kfworld/navi_l_kf_a.png",
				y = 45,
				name = "kuafu",
				x = -220
			},
			{
				pic2 = "res/ui/mainUI/navi_l_zy_click.png",
				pic3 = "res/ui/mainUI/navi_l_zy_gray.png",
				pic1 = "res/ui/mainUI/navi_l_zy_a.png",
				y = 45,
				name = "resource",
				x = -115
			},
			{
				pic2 = "res/ui/mainUI/navi_l_wj_click.png",
				pic3 = "res/ui/mainUI/navi_l_wj_gray.png",
				pic1 = "res/ui/mainUI/navi_l_wj_a.png",
				y = 45,
				name = "general",
				x = -15
			}
		}
	})

	var_10_0.rankFlag = {
		name = "rankFlag",
		type = "pic",
		top = 50,
		right = 50,
		pic = "res/ui/world/hourRank/rank_view_" .. user.player.forceId .. ".png",
		children = {
			{
				xcenter = 0,
				height = 26,
				name = "rankValueAtlas",
				type = "atlas",
				ycenter = 75,
				pic = "res/ui/world/hourRank/rank_numb.png",
				text = "40",
				startChar = 48,
				width = 20
			},
			{
				xcenter = 30,
				name = "rankTitlePlus",
				type = "pic",
				ycenter = 75,
				pic = "res/ui/world/hourRank/rank_numb_plus.png"
			},
			{
				xcenter = 0,
				name = "rankTitlePic",
				type = "pic",
				ycenter = 0,
				pic = "res/ui/world/hourRank/rank_name_none.png"
			}
		}
	}

	return var_10_0
end

function var_0_0.onBridgeConnectChange(arg_12_0, arg_12_1)
	if arg_12_1 == 1 then
		local var_12_0 = CCSprite:create("res/ui/kfworld/water/bridge_arise_view.png")
		local var_12_1 = CCSprite:create("res/ui/kfworld/water/kfjrj_gqcx.png")

		var_12_1:setPosition(309.5, 58)
		var_12_0:addChild(var_12_1)
		var_12_0:setPosition(ccp(visibleSize.width + var_12_0:getContentSize().width / 2, visibleSize.height / 2))
		arg_12_0:addChild(var_12_0)

		local var_12_2 = CCArray:create()

		var_12_2:addObject(CCEaseExponentialOut:create(CCMoveTo:create(0.5, ccp(visibleSize.width / 2, visibleSize.height / 2))))
		var_12_2:addObject(CCDelayTime:create(1))
		var_12_2:addObject(CCMoveTo:create(0.5, ccp(-var_12_0:getContentSize().width / 2, visibleSize.height / 2)))
		var_12_2:addObject(CCCallFuncN:create(function()
			var_12_0:removeFromParentAndCleanup(true)
		end))
		var_12_0:runAction(CCSequence:create(var_12_2))
	end
end

function var_0_0.onEnter(arg_14_0)
	arg_14_0.bridgeConnectRef = handler(arg_14_0, arg_14_0.onBridgeConnectChange)

	eventManager.registerEvent("bridgeConnect", arg_14_0.bridgeConnectRef)
end

function var_0_0.onExit(arg_15_0)
	eventManager.unregisterEvent("bridgeConnect", arg_15_0.bridgeConnectRef)
end

return var_0_0
