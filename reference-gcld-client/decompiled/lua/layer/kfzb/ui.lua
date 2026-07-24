tool.requireRes("kfzb")
require("lua/component/labelPage")
require("lua/common/tool")

kfzbUI = {}

local var_0_0 = kfzbUI
local var_0_1 = kfzbControl
local var_0_2 = kfzbConstant
local var_0_3 = 0
local var_0_4 = 0
local var_0_5 = ""

function var_0_0.show()
	if user.kfzbState == -60 then
		var_0_0.showViewGZT_YXT(true)
	elseif user.kfzbState == 20 or user.kfzbState == 30 then
		var_0_0.showViewGZT_YXT(false)
	else
		var_0_1.kfzbGet16Table()
	end
end

function var_0_0.show16Table(arg_2_0)
	local var_2_0 = {}

	if conf.language == "vie" or conf.language == "tha" then
		if arg_2_0 == nil then
			var_2_0.bg2X = 0
		elseif arg_2_0.curLayer == 1 or arg_2_0.curLayer == 2 or arg_2_0.curLayer == 3 or arg_2_0.curLayer == 4 then
			var_2_0.bg2X = -100
		else
			var_2_0.bg2X = 0
		end
	else
		var_2_0.bg2X = 0
	end

	local var_2_1 = createBaseLayer()

	rmgr.loadTable(var_0_2.RES)
	smgr.registerLayer(var_2_1, "kfzbLayer")

	local function var_2_2(arg_3_0, arg_3_1, arg_3_2)
		return true
	end

	var_2_1:setTouchEnabled(true)
	var_2_1:registerScriptTouchHandler(var_2_2, false, true)

	var_2_1.onEnter = var_0_1.onEnter
	var_2_1.onExit = var_0_1.onExit

	local var_2_3 = CCSprite:create("res/ui/kfzb/kfzbs_dzb_bg.jpg")

	var_2_3:setAnchorPoint(ccp(0.5, 0.5))
	var_2_3:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))

	local var_2_4 = CCSprite:create("res/ui/kfzb/kfzbs_qizi.png")

	var_2_4:setAnchorPoint(ccp(0.5, 1))
	var_2_4:setPosition(ccp(visibleSize.width / 2, visibleSize.height + 10))

	local var_2_5 = user.kfzbZone > 0 and "jywdh_wdhdzb_title.png" or "kfzbs_zt_zbsdzb.png"
	local var_2_6 = CCSprite:create("res/ui/kfzb/" .. var_2_5)

	var_2_6:setAnchorPoint(ccp(0.5, 1))
	var_2_6:setPosition(ccp(visibleSize.width / 2 + var_2_0.bg2X, visibleSize.height - 25))
	var_2_1:addChild(var_2_3)
	var_2_1:addChild(var_2_4)
	var_2_1:addChild(var_2_6)

	if arg_2_0 then
		var_0_0.showViewDZB(arg_2_0)
	else
		var_0_1.kfzbGet16Table(true)
	end

	return var_2_1
end

local function var_0_6()
	log.info("should show tips ")

	local var_4_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_4_0:registerScriptTouchHandler(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == CCTOUCHBEGAN then
			return true
		elseif arg_5_0 == CCTOUCHMOVED then
			return true
		elseif arg_5_0 == CCTOUCHENDED then
			if var_0_0.uiTable.kfzbTipFrame then
				var_0_0.uiTable.kfzbTipFrame:setVisible(false)
			end

			pcall(var_4_0.removeFromParentAndCleanup, var_4_0, true)

			return true
		end
	end, false, true)
	var_4_0:setTouchEnabled(true)
	autoUI.createUI(var_4_0, getKfzbTipFrame(), var_0_0.uiTable)

	local var_4_1, var_4_2 = tool.getPositionInScreen(var_0_0.uiTable.btn_tip)

	var_0_0.uiTable.kfzbTipFrame:setPosition(ccp(visibleSize.width * 0.5, var_4_2 - 20))
	smgr.rootLayer:addChild(var_4_0, 60000)
end

local function var_0_7()
	if smgr.currentSceneTag == SCENE_KFZB_TABLE then
		smgr.changeScene(SCENE_MAIN_CITY)
	else
		amgr.playEffect(enumAudioFile.ui_dialog_close)

		local var_6_0 = smgr.getLayer("topLayer")
		local var_6_1 = smgr.getLayer("kfzbLayer")

		var_6_0:removeChild(var_6_1, true)
	end
end

function var_0_0.showViewGZT_YXT(arg_7_0)
	local var_7_0 = createBaseLayer()

	rmgr.loadTable(var_0_2.RES)
	smgr.registerLayer(var_7_0, "kfzbLayer")

	local function var_7_1(arg_8_0, arg_8_1, arg_8_2)
		return true
	end

	var_7_0:setTouchEnabled(true)
	var_7_0:registerScriptTouchHandler(var_7_1, false, true)

	var_7_0.onEnter = var_0_1.onEnter
	var_7_0.onExit = var_0_1.onExit

	local var_7_2 = smgr.getLayer("topLayer")

	var_7_2:removeAllChildrenWithCleanup(true)
	var_7_2:addChild(var_7_0)

	if var_0_0.uiTable then
		var_0_0.uiTable = nil
		var_0_0.cdTimeLabel = nil
	end

	var_0_0.uiTable = autoUI.initUI(var_7_0, getUiDataGZT_YXT(arg_7_0))

	local var_7_3 = var_0_0.uiTable.closeBtn

	var_7_3:setScale(2)

	local var_7_4 = var_7_3:getContentSize()
	local var_7_5 = var_0_0.uiTable.bg:getContentSize()
	local var_7_6 = visibleSize.width / 2 + var_7_5.width / 2 - var_7_4.width / 2 - 30
	local var_7_7 = visibleSize.height / 2 + var_7_5.height / 2 + var_7_4.height / 2 - 20

	var_7_3:setPosition(ccp(var_7_6, var_7_7))
	var_7_3:registerScriptTapHandler(var_0_7)
	var_0_0.uiTable.btn_tip:registerScriptTapHandler(var_0_6)

	if arg_7_0 then
		var_0_0.uiTable.btn_green:setVisible(true)
		var_0_0.uiTable.btn_green:registerScriptTapHandler(var_0_7)
		var_0_0.uiTable.label_btn:setVisible(true)
		var_0_0.uiTable.label_btn:setString(language.get(390008))
	else
		var_0_1.kfzbGetSignUpPanel()
	end
end

function var_0_0.updateViewYXT(arg_9_0)
	if arg_9_0.minLv then
		if user.player.playerLv < arg_9_0.minLv then
			var_0_0.uiTable.label_btn:setVisible(true)
			var_0_0.uiTable.label_btn:setString(language.get(490003, arg_9_0.minLv, arg_9_0.minLv))
			var_0_0.uiTable.label_btn:setColor(ccc3(255, 114, 98))
		else
			var_0_0.uiTable.btn_green:setVisible(true)
			var_0_0.uiTable.btn_green:registerScriptTapHandler(var_0_1.kfzbSignUp)
			var_0_0.uiTable.label_btn:setVisible(true)
			var_0_0.uiTable.label_btn:setString(language.get(390007))
			var_0_0.uiTable.label_btn:setColor(ccc3(255, 255, 255))
		end
	else
		var_0_0.uiTable.btn_green:setVisible(false)
		var_0_0.uiTable.label_btn:setVisible(true)
		var_0_0.uiTable.label_btn:setString(language.get(490004))
		var_0_0.uiTable.label_btn:setColor(ccc3(255, 114, 98))
	end

	if arg_9_0.countDown <= 0 then
		var_0_0.uiTable.btn_green:setVisible(false)
		var_0_0.uiTable.label_info:setVisible(true)
		var_0_0.uiTable.label_info:setString(language.get(490006))
	elseif arg_9_0.countDown > 0 then
		local function var_9_0()
			var_0_0.cdTimeLabel:removeFromParentAndCleanup(true)

			var_0_0.cdTimeLabel = nil

			var_0_0.uiTable.btn_green:setVisible(false)

			if arg_9_0.minLv then
				var_0_0.uiTable.label_btn:setVisible(false)
			end

			var_0_0.uiTable.label_info:setVisible(true)
			var_0_0.uiTable.label_info:setString(language.get(490006))
		end

		if var_0_0.cdTimeLabel then
			var_0_0.cdTimeLabel:setTime(arg_9_0.countDown)
		else
			var_0_0.cdTimeLabel = createTimerLabel(arg_9_0.countDown, language.get(490005) .. "@H:@M:@S", "Thonburi", 20, var_9_0, nil, nil, ccc3(255, 114, 98))

			var_0_0.uiTable.bg:addChild(var_0_0.cdTimeLabel, 200)
			var_0_0.cdTimeLabel:setPosition(ccp(480, 100))
		end
	end
end

function var_0_0.showKfzbWaitLb()
	local var_11_0 = smgr.getLayer("kfzbLayer")

	log.info("showKfzbWaitLb")

	local var_11_1 = CCStrokeLabelTTF:create(language.get(490057), "Thonburi", 26, 2)

	var_11_1:setColor(colorQuality[3])
	var_11_1:setAnchorPoint(ccp(0.5, 0.5))
	var_11_1:setPosition(visibleSize.width / 2, visibleSize.height / 2 + 30)
	var_11_0:addChild(var_11_1, 300)

	local var_11_2 = CCArray:create()

	var_11_2:addObject(CCDelayTime:create(2))
	var_11_2:addObject(CCCallFunc:create(function()
		kfzbControl.kfzbGetSupportPanel(var_0_1.supportData.matchId)
		var_11_1:removeFromParentAndCleanup(true)
	end))
	var_11_1:runAction(CCSequence:create(var_11_2))
end

local function var_0_8(arg_13_0)
	return arg_13_0.win1 + arg_13_0.win2 == arg_13_0.layerRound and arg_13_0.win1 > arg_13_0.win2
end

local function var_0_9(arg_14_0)
	return arg_14_0.win1 + arg_14_0.win2 == arg_14_0.layerRound and arg_14_0.win2 > arg_14_0.win1
end

local function var_0_10(arg_15_0)
	local var_15_0 = ""

	if arg_15_0 > 7 then
		var_15_0 = language.get(490038)
	elseif arg_15_0 >= 4 and arg_15_0 <= 7 then
		var_15_0 = language.get(490039)
	elseif arg_15_0 == 2 or arg_15_0 == 3 then
		var_15_0 = language.get(490040)
	elseif arg_15_0 == 1 then
		var_15_0 = language.get(490041)
	end

	return var_15_0
end

local function var_0_11(arg_16_0, arg_16_1)
	log.info("should显示介绍信息")

	local var_16_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_16_0:registerScriptTouchHandler(function(arg_17_0, arg_17_1, arg_17_2)
		if arg_17_0 == CCTOUCHBEGAN then
			return true
		elseif arg_17_0 == CCTOUCHMOVED then
			return true
		elseif arg_17_0 == CCTOUCHENDED then
			if var_0_0.uiTable.introFrame then
				var_0_0.uiTable.introFrame:setVisible(false)
			end

			pcall(var_16_0.removeFromParentAndCleanup, var_16_0, true)

			return true
		end
	end, false, true)
	var_16_0:setTouchEnabled(true)

	local var_16_1, var_16_2 = tool.getPositionInScreen(arg_16_1)

	autoUI.createUI(var_16_0, getIntroFrame(arg_16_0), var_0_0.uiTable)

	local var_16_3 = var_0_0.uiTable.intro:getContentSize().width
	local var_16_4 = var_0_0.uiTable.intro:getContentSize().height

	var_0_0.uiTable.introFrame:setPreferredSize(CCSizeMake(var_16_3 + 30, var_16_4 + 30))
	var_0_0.uiTable.intro:setPosition(ccp(15, var_16_4 + 15))

	local var_16_5 = 0
	local var_16_6 = 0

	if var_16_1 + var_16_3 + 60 <= visibleSize.width then
		var_16_5 = var_16_1 - 30
	else
		var_16_5 = var_16_1 - var_16_3
	end

	if var_16_2 - var_16_4 - 60 >= 0 then
		var_16_6 = var_16_2 - 30
	else
		var_16_6 = var_16_2 + var_16_4 + 60
	end

	var_0_0.uiTable.introFrame:setPosition(ccp(var_16_5, var_16_6))
	smgr.rootLayer:addChild(var_16_0, 60000)
end

local function var_0_12(arg_18_0, arg_18_1)
	log.info("should show tips ")

	local var_18_0 = ""

	if arg_18_1 == 1 then
		var_18_0 = language.get(490037, arg_18_0.server1, arg_18_0.serverId1, arg_18_0.name1, arg_18_0.lv1, var_0_10(arg_18_0.matchId), arg_18_0.win1, arg_18_0.win2, arg_18_0.sup1)
	elseif arg_18_1 == 2 then
		var_18_0 = language.get(490037, arg_18_0.server2, arg_18_0.serverId2, arg_18_0.name2, arg_18_0.lv2, var_0_10(arg_18_0.matchId), arg_18_0.win2, arg_18_0.win1, arg_18_0.sup2)
	end

	var_0_11(var_18_0, var_0_0.uiTable["p" .. arg_18_0.matchId .. "_" .. arg_18_1])
end

local function var_0_13(arg_19_0)
	if not arg_19_0 then
		return
	end

	local var_19_0 = {
		{
			{
				x = 0,
				y = 55
			},
			{
				x = 0,
				y = 55
			}
		},
		{
			{
				x = 0,
				y = 55
			},
			{
				x = 0,
				y = 55
			}
		},
		{
			{
				x = 0,
				y = 55
			},
			{
				x = 0,
				y = 55
			}
		},
		{
			{
				x = 60,
				y = 25
			},
			{
				x = 60,
				y = -25
			}
		},
		[6] = {
			{
				x = -60,
				y = 25
			},
			{
				x = -60,
				y = -25
			}
		},
		[8] = {
			{
				x = 30,
				y = 25
			},
			{
				x = -30,
				y = -25
			}
		}
	}

	var_19_0[5] = var_19_0[4]
	var_19_0[7] = var_19_0[6]

	for iter_19_0 = 1, 7 do
		var_19_0[8 + iter_19_0] = var_19_0[8]
	end

	local function var_19_1(arg_20_0)
		local var_20_0, var_20_1 = tool.getPositionInScreen(var_0_0.uiTable["p" .. arg_19_0.matchId .. "_" .. arg_20_0])
		local var_20_2 = var_19_0[arg_19_0.matchId][arg_20_0].x
		local var_20_3 = var_19_0[arg_19_0.matchId][arg_20_0].y
		local var_20_4 = CCNode:create()

		var_20_4:setAnchorPoint(ccp(0.5, 0.5))

		local var_20_5 = CCSprite:create("res/ui/kfzb/kfzbs_zdzb_sheng1.png")
		local var_20_6 = CCLabelAtlas:create(tostring(arg_19_0["win" .. arg_20_0]), "res/ui/common/number/Num_fightJiebingAddExp.png", 27, 41, 48)

		var_20_4:addChild(var_20_5)
		var_20_4:addChild(var_20_6)
		var_20_5:setAnchorPoint(ccp(0.5, 0.5))
		var_20_6:setAnchorPoint(ccp(0.5, 0.5))
		var_20_5:setPosition(ccp(-11, 0))
		var_20_6:setPosition(ccp(var_20_5:getPositionX() + var_20_5:getContentSize().width / 2 + var_20_6:getContentSize().width / 2 + 6, var_20_5:getPositionY()))
		var_20_4:setPosition(ccp(var_20_0 + var_20_2, var_20_1 + var_20_3))
		var_20_4:setScale(0.7)

		if arg_19_0.matchId >= 8 then
			var_0_0.uiTable.tablePage1:addChild(var_20_4, 500)
		else
			var_0_0.uiTable.tablePage2:addChild(var_20_4, 500)
		end
	end

	local function var_19_2(arg_21_0)
		if conf.language == "vie" or conf.language == "tha" then
			var_19_1(arg_21_0)

			return
		end

		local var_21_0, var_21_1 = tool.getPositionInScreen(var_0_0.uiTable["p" .. arg_19_0.matchId .. "_" .. arg_21_0])
		local var_21_2 = var_19_0[arg_19_0.matchId][arg_21_0].x
		local var_21_3 = var_19_0[arg_19_0.matchId][arg_21_0].y
		local var_21_4 = CCNode:create()

		var_21_4:setAnchorPoint(ccp(0.5, 0.5))

		local var_21_5 = CCSprite:create("res/ui/kfzb/kfzbs_zdzb_sheng1.png")
		local var_21_6 = CCLabelAtlas:create(tostring(arg_19_0["win" .. arg_21_0]), "res/ui/common/number/Num_fightJiebingAddExp.png", 27, 41, 48)

		var_21_4:addChild(var_21_5)
		var_21_4:addChild(var_21_6)
		var_21_5:setAnchorPoint(ccp(0.5, 0.5))
		var_21_6:setAnchorPoint(ccp(0.5, 0.5))
		var_21_5:setPosition(ccp(-11, 0))
		var_21_6:setPosition(ccp(19, 0))
		var_21_4:setPosition(ccp(var_21_0 + var_21_2, var_21_1 + var_21_3))
		var_21_4:setScale(0.7)

		if arg_19_0.matchId >= 8 then
			var_0_0.uiTable.tablePage1:addChild(var_21_4, 500)
		else
			var_0_0.uiTable.tablePage2:addChild(var_21_4, 500)
		end
	end

	if arg_19_0.win1 >= 1 then
		var_19_2(1)
	end

	if arg_19_0.win2 >= 1 then
		var_19_2(2)
	end
end

local function var_0_14(arg_22_0)
	if conf.language == "vie" or conf.language == "tha" then
		var_0_13(arg_22_0)

		return
	end

	if not arg_22_0 then
		return
	end

	local var_22_0 = {
		{
			{
				x = 0,
				y = 55
			},
			{
				x = 0,
				y = 55
			}
		},
		{
			{
				x = 0,
				y = 55
			},
			{
				x = 0,
				y = 55
			}
		},
		{
			{
				x = 0,
				y = 55
			},
			{
				x = 0,
				y = 55
			}
		},
		{
			{
				x = 60,
				y = 25
			},
			{
				x = 60,
				y = -25
			}
		},
		[6] = {
			{
				x = -60,
				y = 25
			},
			{
				x = -60,
				y = -25
			}
		},
		[8] = {
			{
				x = 60,
				y = -25
			},
			{
				x = -60,
				y = -25
			}
		}
	}

	var_22_0[5] = var_22_0[4]
	var_22_0[7] = var_22_0[6]

	for iter_22_0 = 1, 7 do
		var_22_0[8 + iter_22_0] = var_22_0[8]
	end

	local function var_22_1(arg_23_0)
		local var_23_0, var_23_1 = tool.getPositionInScreen(var_0_0.uiTable["p" .. arg_22_0.matchId .. "_" .. arg_23_0])
		local var_23_2 = var_22_0[arg_22_0.matchId][arg_23_0].x
		local var_23_3 = var_22_0[arg_22_0.matchId][arg_23_0].y
		local var_23_4 = CCNode:create()

		var_23_4:setAnchorPoint(ccp(0.5, 0.5))

		local var_23_5 = CCSprite:create("res/ui/kfzb/kfzbs_zdzb_sheng1.png")
		local var_23_6 = CCLabelAtlas:create(tostring(arg_22_0["win" .. arg_23_0]), "res/ui/common/number/Num_fightJiebingAddExp.png", 27, 41, 48)

		var_23_4:addChild(var_23_5)
		var_23_4:addChild(var_23_6)
		var_23_5:setAnchorPoint(ccp(0.5, 0.5))
		var_23_6:setAnchorPoint(ccp(0.5, 0.5))
		var_23_5:setPosition(ccp(-11, 0))
		var_23_6:setPosition(ccp(19, 0))
		var_23_4:setPosition(ccp(var_23_0 + var_23_2, var_23_1 + var_23_3))
		var_23_4:setScale(0.7)

		if arg_22_0.matchId >= 8 then
			var_0_0.uiTable.tablePage1:addChild(var_23_4, 500)
		else
			var_0_0.uiTable.tablePage2:addChild(var_23_4, 500)
		end
	end

	if arg_22_0.win1 >= 1 then
		var_22_1(1)
	end

	if arg_22_0.win2 >= 1 then
		var_22_1(2)
	end
end

local function var_0_15()
	log.info("addTimer")

	local var_24_0 = var_0_1.kfzbData
	local var_24_1 = smgr.getLayer("kfzbLayer")
	local var_24_2, var_24_3 = var_0_0.uiTable.tipsLb:getPosition()
	local var_24_4 = var_0_0.uiTable.tipsLb:getContentSize()

	local function var_24_5()
		var_0_0.cdTimeLabel:removeFromParentAndCleanup(true)

		var_0_0.cdTimeLabel = nil

		var_0_1.kfzbGet16Table(true)
	end

	if var_0_0.cdTimeLabel then
		var_0_0.cdTimeLabel:removeFromParentAndCleanup(true)
	end

	var_0_0.cdTimeLabel = createTimerLabel(var_24_0.battleTime, "@H:@M:@S", "Thonburi-Bold", 20, var_24_5, nil, nil, ccc3(255, 114, 98))

	var_24_1:addChild(var_0_0.cdTimeLabel, 300)
	var_0_0.uiTable.tipsLb:setPosition(ccp(var_24_2 - 38, visibleSize.height - 85))
	var_0_0.cdTimeLabel:setPosition(ccp(var_24_2 + 0.5 * var_24_4.width, visibleSize.height - 85))
end

local function var_0_16()
	log.info("addTimer1")

	local var_26_0 = var_0_1.kfzbData
	local var_26_1 = smgr.getLayer("kfzbLayer")
	local var_26_2, var_26_3 = var_0_0.uiTable.tipsLb:getPosition()
	local var_26_4 = var_0_0.uiTable.tipsLb:getContentSize()

	local function var_26_5()
		var_0_0.cdTimeLabel:removeFromParentAndCleanup(true)

		var_0_0.cdTimeLabel = nil

		var_0_1.kfzbGet16Table(true)
	end

	if var_0_0.cdTimeLabel then
		var_0_0.cdTimeLabel:removeFromParentAndCleanup(true)
	end

	var_0_0.cdTimeLabel = createTimerLabel(var_26_0.nextRBegTime, "@H:@M:@S", "Thonburi-Bold", 20, var_26_5, nil, nil, ccc3(255, 114, 98))

	var_26_1:addChild(var_0_0.cdTimeLabel, 300)
	var_0_0.uiTable.tipsLb:setPosition(ccp(var_26_2 - 38, visibleSize.height - 85))
	var_0_0.cdTimeLabel:setPosition(ccp(var_26_2 + 0.5 * var_26_4.width, visibleSize.height - 85))
end

local function var_0_17()
	log.info("addTimer2")

	local var_28_0 = var_0_1.kfzbData
	local var_28_1 = smgr.getLayer("kfzbLayer")
	local var_28_2, var_28_3 = var_0_0.uiTable.tipsLb:getPosition()
	local var_28_4 = var_0_0.uiTable.tipsLb:getContentSize()

	local function var_28_5()
		var_0_0.cdTimeLabel:removeFromParentAndCleanup(true)

		var_0_0.cdTimeLabel = nil

		var_0_1.kfzbGet16Table(true)
	end

	if var_0_0.cdTimeLabel then
		var_0_0.cdTimeLabel:removeFromParentAndCleanup(true)
	end

	var_0_0.cdTimeLabel = createTimerLabel(var_28_0.feastCd, "@H:@M:@S", "Thonburi-Bold", 20, var_28_5, nil, nil, ccc3(255, 114, 98))

	var_28_1:addChild(var_0_0.cdTimeLabel, 300)
	var_0_0.uiTable.tipsLb:setPosition(ccp(var_28_2 - 38, visibleSize.height - 85))
	var_0_0.cdTimeLabel:setPosition(ccp(var_28_2 + 0.5 * var_28_4.width, visibleSize.height - 85))
end

function var_0_0.setTopTips(arg_30_0)
	log.info("setTopTips:" .. arg_30_0)

	local var_30_0 = var_0_1.kfzbData

	var_0_3 = arg_30_0

	if arg_30_0 == 1 then
		log.info("to addTimer,state == 1")

		var_0_4 = 5

		if var_30_0.battleTime > 0 then
			var_0_0.uiTable.tipsLb:setString(language.get(490013, var_30_0.curRound))
			log.info("to addTimer")
			var_0_15()

			return
		end

		if var_30_0.nextRBegTime > 0 then
			var_0_0.uiTable.tipsLb:setString(language.get(490015, var_30_0.curRound))
			log.info("to addTimer1")
			var_0_16()

			return
		end

		if var_30_0.feastCd > 0 then
			if user.kfzbZone > 0 then
				var_0_0.uiTable.tipsLb:setString(language.get(490089))
			else
				var_0_0.uiTable.tipsLb:setString(language.get(490021))
				log.info("to addTimer2")
				var_0_17()
			end

			return
		end

		var_0_0.uiTable.tipsLb:setString(language.get(490014, var_30_0.curRound))
	elseif arg_30_0 == 2 then
		log.info("to addTimer,state == 2")

		var_0_4 = 3

		if var_30_0.battleTime > 0 then
			var_0_0.uiTable.tipsLb:setString(language.get(490016, var_30_0.curRound))
			var_0_15()

			return
		end

		if var_30_0.nextRBegTime > 0 then
			var_0_0.uiTable.tipsLb:setString(language.get(490018, var_30_0.curRound))
			var_0_16()

			return
		end

		var_0_0.uiTable.tipsLb:setString(language.get(490017, var_30_0.curRound))
	elseif arg_30_0 == 3 then
		log.info("to addTimer,state == 3")

		if var_30_0.battleTime > 0 then
			var_0_0.uiTable.tipsLb:setString(language.get(490019, var_30_0.totalLayer - var_30_0.layer + 1))
			var_0_15()

			return
		end

		var_0_0.uiTable.tipsLb:setString(language.get(490020, var_30_0.totalLayer - var_30_0.layer + 1))
	end
end

local function var_0_18()
	log.info("btn我的比赛")

	local var_31_0 = var_0_1.kfzbData
	local var_31_1 = {
		competitorId = var_31_0.cId,
		certifacate = var_31_0.key,
		matchAdress = var_31_0.address,
		matchPort = var_31_0.port
	}

	log.info("@@ 进入跨服争霸")
	require("lua/manager/kfConnectManager")
	kfcmgr.loginkfzb(var_31_1)
end

local function var_0_19()
	log.info("btn庆功宴")
	var_0_1.feastGetFeastInfo()
end

function var_0_0.showViewDZB(arg_33_0)
	if var_0_0.uiTable then
		var_0_0.uiTable = nil
	end

	if var_0_0.cdTimeLabel then
		pcall(var_0_0.cdTimeLabel.removeFromParentAndCleanup, var_0_0.cdTimeLabel, true)

		var_0_0.cdTimeLabel = nil
	end

	if var_0_0.kfzbViewBackground then
		pcall(var_0_0.kfzbViewBackground.removeFromParentAndCleanup, var_0_0.kfzbViewBackground, true)

		var_0_0.kfzbViewBackground = nil
	end

	local var_33_0 = smgr.getLayer("kfzbLayer")

	var_0_0.uiTable = autoUI.initUI(var_33_0, getUiDataDZB(arg_33_0))
	var_0_0.kfzbViewBackground = var_0_0.uiTable.bg

	local var_33_1 = {
		{
			xcenter = 0,
			name = "lostTipsLb",
			text = "失败提示",
			y = 80,
			color = ccc3(255, 255, 209)
		},
		{
			xcenter = 0,
			name = "tipsLb",
			text = "提示文本",
			top = 82,
			color = ccc3(255, 255, 209)
		},
		{
			xcenter = 0,
			name = "jinjiLb",
			text = "晋级提示文本",
			y = 170,
			color = ccc3(255, 255, 209)
		},
		{
			xcenter = 0,
			name = "seeTipsLb",
			text = "观看者提示",
			y = 130,
			color = ccc3(255, 255, 209)
		},
		{
			xcenter = 0,
			name = "ticketLJLb",
			text = "累积点券",
			y = 220,
			color = ccc3(255, 255, 209)
		},
		{
			xcenter = 25,
			name = "ticketLb",
			text = "点券数量",
			anchorPointX = 0,
			y = 180,
			color = ccc3(255, 255, 209)
		},
		{
			xcenter = 0,
			name = "winName",
			text = "冠军名称",
			visible = false,
			ycenter = 65,
			color = ccc3(255, 255, 209)
		},
		{
			xcenter = 0,
			name = "winLv",
			text = "冠军等级",
			visible = false,
			ycenter = 45,
			color = ccc3(255, 114, 98)
		}
	}

	for iter_33_0 = 1, #var_33_1 do
		local var_33_2 = CCLabelTTF:create("", "", 20)

		var_33_2:setDimensions(CCSizeMake(320, 0))

		local var_33_3
		local var_33_4
		local var_33_5 = visibleSize.width / 2 + var_33_1[iter_33_0].xcenter

		if var_33_1[iter_33_0].y then
			var_33_4 = var_33_1[iter_33_0].y
		elseif var_33_1[iter_33_0].ycenter then
			var_33_4 = visibleSize.height / 2 + var_33_1[iter_33_0].ycenter
		elseif var_33_1[iter_33_0].top then
			var_33_4 = visibleSize.height - var_33_1[iter_33_0].top
		end

		var_33_2:setPosition(var_33_5, var_33_4)
		var_33_2:setColor(var_33_1[iter_33_0].color)

		if var_33_1[iter_33_0].visible ~= nil then
			var_33_2:setVisible(var_33_1[iter_33_0].visible)
		end

		if var_33_1[iter_33_0].anchorPointX ~= nil then
			var_33_2:setAnchorPoint(ccp(var_33_1[iter_33_0].anchorPointX, 0.5))
		end

		var_0_0.kfzbViewBackground:addChild(var_33_2, 200)

		var_0_0.uiTable[var_33_1[iter_33_0].name] = var_33_2
	end

	var_0_0.uiTable.lostTipsLb:setHorizontalAlignment(kCCTextAlignmentCenter)

	local var_33_6 = var_0_0.uiTable.closeBtn

	var_33_6:setScale(2)
	var_33_6:setPosition(ccp(visibleSize.width - 32, visibleSize.height - 33))
	var_33_6:registerScriptTapHandler(var_0_7)
	var_0_0.uiTable.btn_tip:registerScriptTapHandler(var_0_6)
	var_0_0.uiTable.myMatchBtn:registerScriptTapHandler(var_0_18)
	var_0_0.uiTable.qinggongBtn:registerScriptTapHandler(var_0_19)

	for iter_33_1 = 1, 4 do
		local var_33_7 = CCNode:create()
		local var_33_8 = CCSprite:create("res/ui/kfzb/kfzbs_line04h.png")
		local var_33_9 = CCSprite:create("res/ui/kfzb/kfzbs_line04h.png")

		var_33_8:setScaleY(-1)
		var_33_7:addChild(var_33_8)
		var_33_7:addChild(var_33_9)
		var_0_0.uiTable.tablePage2:addChild(var_33_7, 10)
		var_33_8:setPosition(ccp(0, 34))
		var_33_9:setPosition(ccp(0, -34))

		if iter_33_1 <= 2 then
			var_33_7:setScaleX(-1)
			var_33_7:setPosition(ccp(visibleSize.width * 0.83, visibleSize.height / 2 - 390 + iter_33_1 * 260 - 30))
		else
			var_33_7:setPosition(ccp(visibleSize.width * 0.17, visibleSize.height / 2 - 390 + (iter_33_1 - 2) * 260 - 30))
		end

		var_33_8:setVisible(false)
		var_33_9:setVisible(false)

		var_0_0.uiTable["l" .. 8 - iter_33_1 .. "_1"] = var_33_8
		var_0_0.uiTable["l" .. 8 - iter_33_1 .. "_2"] = var_33_9
	end

	for iter_33_2 = 1, 2 do
		local var_33_10 = CCNode:create()
		local var_33_11 = CCSprite:create("res/ui/kfzb/kfzbs_line03h.png")
		local var_33_12 = CCSprite:create("res/ui/kfzb/kfzbs_line03h.png")

		var_33_12:setScaleY(-1)
		var_33_10:addChild(var_33_11)
		var_33_10:addChild(var_33_12)
		var_0_0.uiTable.tablePage2:addChild(var_33_10, 10)
		var_33_11:setPosition(ccp(0, 23.5))
		var_33_12:setPosition(ccp(0, -23.5))

		if iter_33_2 == 1 then
			var_33_10:setScaleX(-1)
			var_33_10:setPosition(ccp(visibleSize.width * 0.74, visibleSize.height / 2 - 30))
		else
			var_33_10:setPosition(ccp(visibleSize.width * 0.26, visibleSize.height / 2 - 30))
		end

		var_33_11:setVisible(false)
		var_33_12:setVisible(false)

		var_0_0.uiTable["l" .. 4 - iter_33_2 .. "_1"] = var_33_11
		var_0_0.uiTable["l" .. 4 - iter_33_2 .. "_2"] = var_33_12
	end

	for iter_33_3 = 1, 15 do
		var_0_0.uiTable["mmarkVS" .. iter_33_3]:setVisible(true)
		tool.spriteToGray(var_0_0.uiTable["mmarkQJH" .. iter_33_3])
	end

	if arg_33_0.phase == 1 then
		var_0_0.uiTable.tablePage1:setVisible(true)
	else
		if arg_33_0.curLayer == 4 then
			var_0_0.uiTable.tablePage1:setVisible(true)
		else
			var_0_0.uiTable.tablePage2:setVisible(true)
		end

		var_0_0.uiTable.shiftBtn:setVisible(true)
		var_0_0.uiTable.shiftBtnLb:setVisible(true)
		var_0_0.uiTable.shiftBtn:registerScriptTapHandler(function()
			var_0_0.uiTable.tablePage1:setVisible(not var_0_0.uiTable.tablePage1:isVisible())
			var_0_0.uiTable.tablePage2:setVisible(not var_0_0.uiTable.tablePage2:isVisible())

			if var_0_0.uiTable.tablePage1:isVisible() then
				var_0_0.uiTable.shiftBtnLb:setString(language.get(490059))
			else
				var_0_0.uiTable.shiftBtnLb:setString(language.get(490060))
			end
		end)
	end

	if var_0_0.uiTable.tablePage1:isVisible() then
		var_0_0.uiTable.shiftBtnLb:setString(language.get(490059))
	else
		var_0_0.uiTable.shiftBtnLb:setString(language.get(490060))
	end

	if arg_33_0.givewayRank and #arg_33_0.givewayRank > 0 then
		if var_0_0.showGiveWayFirst then
			pcall(var_0_0.showGiveWayFirst.removeFromParentAndCleanup, var_0_0.showGiveWayFirst, true)

			var_0_0.showGiveWayFirst = nil
		end

		var_0_0.showGiveWayFirst = showGiveWayFirst(var_0_0.kfzbViewBackground, arg_33_0.givewayRank, var_0_0)
	elseif var_0_0.showGiveWayFirst then
		pcall(var_0_0.showGiveWayFirst.removeFromParentAndCleanup, var_0_0.showGiveWayFirst, true)

		var_0_0.showGiveWayFirst = nil
	end

	if arg_33_0.curLayer == 1 then
		local var_33_13 = 1
		local var_33_14 = arg_33_0.Infos[var_33_13]

		var_0_14(var_33_14)
	elseif arg_33_0.curLayer == 2 then
		for iter_33_4 = 2, 3 do
			local var_33_15 = arg_33_0.Infos[iter_33_4]

			var_0_14(var_33_15)
		end
	elseif arg_33_0.curLayer == 3 then
		for iter_33_5 = 4, 7 do
			local var_33_16 = arg_33_0.Infos[iter_33_5]

			var_0_14(var_33_16)
		end
	elseif arg_33_0.curLayer == 4 then
		for iter_33_6 = 8, 15 do
			local var_33_17 = arg_33_0.Infos[iter_33_6]

			var_0_14(var_33_17)
		end
	end

	local var_33_18 = false
	local var_33_19 = ""
	local var_33_20 = false
	local var_33_21 = 0

	if arg_33_0.selfState == 1 or arg_33_0.phase == 1 then
		var_0_0.uiTable.headWin:setVisible(true)
		var_0_0.uiTable.generalPic:setVisible(true)
		var_0_0.uiTable.generalPic:setDisplayFrame(tool.spriteByName(arg_33_0.treasurePic .. ".jpg"):displayFrame())

		if arg_33_0.curLayer == 1 then
			var_33_19 = language.get(490010)
			var_0_5 = language.get(490007)
		elseif arg_33_0.curLayer == 2 then
			var_33_19 = language.get(490091)
			var_0_5 = language.get(490007)
		elseif arg_33_0.curLayer == 3 then
			var_33_19 = language.get(490011, 4)
			var_0_5 = language.get(490009)
		elseif arg_33_0.curLayer == 4 then
			var_33_19 = language.get(490011, 8)
			var_0_5 = language.get(490008)
		end

		if arg_33_0.phase == 1 then
			var_33_19 = language.get(490011, 16)
			var_0_5 = language.get(490007)
		end

		var_0_0.uiTable.winName:setVisible(true)
		var_0_0.uiTable.winName:setString(language.get(490012, var_33_19))

		local var_33_22 = var_0_0.uiTable.headWin:getContentSize()
		local var_33_23 = CCMenuItemImage:create("res/ui/kfzb/kfzbs_txdk72_01.png", "res/ui/kfzb/kfzbs_txdk72_01.png")

		var_33_23:setPosition(ccp(var_33_22.width / 2, var_33_22.height / 2))

		var_0_0.uiTable.headWinBtn = var_33_23

		local var_33_24 = CCMenu:create()

		var_33_24:setPosition(ccp(0, 0))
		var_33_24:addChild(var_33_23)
		var_0_0.uiTable.headWin:addChild(var_33_24, 0)
		var_33_23:registerScriptTapHandler(function()
			local var_35_0 = language.get(490055, arg_33_0.treasureName, arg_33_0.treasureStr, arg_33_0.treasureLea)

			var_0_11(var_35_0, var_0_0.uiTable.headWin)
		end)
	else
		var_0_0.uiTable.winName:setString("")
		var_0_0.uiTable.generalPic:setVisible(false)
	end

	local var_33_25 = false

	if arg_33_0.phase == 1 then
		var_33_18 = false
		arg_33_0.selfState = 1

		var_0_0.uiTable.jinjiLb:setVisible(arg_33_0.flag == 2 and arg_33_0.layer > 4)
		var_0_0.uiTable.lostTipsLb:setVisible(arg_33_0.flag == 3)
		var_0_0.uiTable.myMatchBtn:setVisible(arg_33_0.flag < 3)
		var_0_0.setTopTips(3)
	else
		var_0_0.uiTable.jinjiLb:setVisible(false)
		var_0_0.uiTable.lostTipsLb:setVisible(true)
		var_0_0.uiTable.myMatchBtn:setVisible(arg_33_0.selfState == 1)
		var_0_0.uiTable.pic_layer:setVisible(true)

		if arg_33_0.curLayer == 1 then
			local var_33_26 = CCTextureCache:sharedTextureCache():addImage("res/ui/kfzb/kfzbs_zt_zjs.png")

			var_0_0.uiTable.pic_layer:setTexture(var_33_26)
			var_0_0.setTopTips(1)

			var_33_21 = 5
		elseif arg_33_0.curLayer == 2 then
			local var_33_27 = CCTextureCache:sharedTextureCache():addImage("res/ui/kfzb/kfzbs_zt_bjs.png")

			var_0_0.uiTable.pic_layer:setTexture(var_33_27)
			var_0_0.setTopTips(1)

			var_33_21 = 5
		elseif arg_33_0.curLayer == 3 then
			local var_33_28 = CCTextureCache:sharedTextureCache():addImage("res/ui/kfzb/kfzbs_zt_84.png")

			var_0_0.uiTable.pic_layer:setTexture(var_33_28)

			var_33_25 = arg_33_0.curRound > 1

			var_0_0.setTopTips(2)

			var_33_21 = 3
		elseif arg_33_0.curLayer == 4 then
			local var_33_29 = CCTextureCache:sharedTextureCache():addImage("res/ui/kfzb/kfzbs_zt_168.png")

			var_0_0.uiTable.pic_layer:setTexture(var_33_29)

			var_33_25 = arg_33_0.curRound > 1

			var_0_0.setTopTips(2)

			var_33_21 = 3
		end

		var_33_25 = var_33_25 or arg_33_0.battleTime <= 0

		if user.kfzbState >= 65 then
			local var_33_30 = arg_33_0.Infos[1]

			if var_33_30 then
				var_0_0.uiTable.headWin:setVisible(true)

				local var_33_31 = var_0_0.uiTable.generalPic:getContentSize()

				if var_0_8(var_33_30) then
					local var_33_32 = CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. var_33_30.pic1 .. ".png")

					var_33_32:setScale(0.7777777777777778)
					var_33_32:setPosition(ccp(var_33_31.width / 2, var_33_31.height / 2))
					var_0_0.uiTable.generalPic:addChild(var_33_32, 300)
					var_0_0.uiTable.generalPic:setVisible(true)
					var_0_0.uiTable.winName:setVisible(true)
					var_0_0.uiTable.winLv:setVisible(true)
					var_0_0.uiTable.winName:setString(var_33_30.name1)
					var_0_0.uiTable.winLv:setString(language.get(83027, var_33_30.lv1))

					var_33_20 = true

					if var_0_0.uiTable.headWinBtn then
						var_0_0.uiTable.headWinBtn:setEnabled(false)
					end
				elseif var_0_9(var_33_30) then
					local var_33_33 = CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. var_33_30.pic2 .. ".png")

					var_33_33:setScale(0.7777777777777778)
					var_33_33:setPosition(ccp(var_33_31.width / 2, var_33_31.height / 2))
					var_0_0.uiTable.generalPic:addChild(var_33_33, 300)
					var_0_0.uiTable.generalPic:setVisible(true)
					var_0_0.uiTable.winName:setVisible(true)
					var_0_0.uiTable.winLv:setVisible(true)
					var_0_0.uiTable.winName:setString(var_33_30.name2)
					var_0_0.uiTable.winLv:setString(language.get(83027, var_33_30.lv2))

					var_33_20 = true

					if var_0_0.uiTable.headWinBtn then
						var_0_0.uiTable.headWinBtn:setEnabled(false)
					end
				end

				if var_33_20 then
					var_0_0.uiTable.myMatchBtn:setVisible(false)

					if arg_33_0.feastCd <= 0 then
						if user.kfzbZone > 0 then
							var_0_0.uiTable.tipsLb:setString(language.get(490089))
						else
							var_0_0.uiTable.tipsLb:setString(language.get(490022))
						end
					end
				end
			end
		end
	end

	if arg_33_0.phase == 1 then
		for iter_33_7 = 1, 16 do
			local var_33_34, var_33_35 = var_0_0.uiTable["pSQ" .. iter_33_7]:getPosition()
			local var_33_36 = language.get(user.kfzbZone > 0 and 490087 or 490086)
			local var_33_37 = CCLabelTTF:create(language.get(490042, iter_33_7, var_33_36), "", 20)

			var_33_37:setPosition(var_33_34, var_33_35 - 60)
			var_33_37:setColor(ccc3(255, 255, 209))
			var_0_0.uiTable.tablePage1:addChild(var_33_37)
		end

		if var_0_0.uiTable["pSQ" .. arg_33_0.saiqu] then
			local var_33_38 = var_0_0.uiTable["pSQ" .. arg_33_0.saiqu]:getContentSize()
			local var_33_39 = CCSprite:create("res/ui/kfzb/kfzbs_txdkh72.png")
			local var_33_40 = CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. user.player.pic .. ".png")

			var_33_40:setScale(0.7777777777777778)
			var_0_0.uiTable["pSQ" .. arg_33_0.saiqu]:addChild(var_33_39)
			var_0_0.uiTable["pSQ" .. arg_33_0.saiqu]:addChild(var_33_40)
			var_33_39:setPosition(ccp(var_33_38.width / 2, var_33_38.height / 2))
			var_33_40:setPosition(ccp(var_33_38.width / 2, var_33_38.height / 2))
		end
	else
		for iter_33_8, iter_33_9 in pairs(arg_33_0.Infos) do
			local var_33_41 = iter_33_9
			local var_33_42 = var_0_0.uiTable["p" .. var_33_41.matchId .. "_1"]:getContentSize()
			local var_33_43 = CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. var_33_41.pic1 .. ".png")
			local var_33_44 = CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. var_33_41.pic2 .. ".png")

			var_33_43:setScale(0.7777777777777778)
			var_33_44:setScale(0.7777777777777778)
			var_33_43:setPosition(ccp(var_33_42.width / 2, var_33_42.height / 2))
			var_33_44:setPosition(ccp(var_33_42.width / 2, var_33_42.height / 2))
			var_0_0.uiTable["p" .. var_33_41.matchId .. "_1"]:addChild(var_33_43, 100)
			var_0_0.uiTable["p" .. var_33_41.matchId .. "_2"]:addChild(var_33_44, 100)

			local var_33_45, var_33_46 = var_0_0.uiTable["p" .. var_33_41.matchId .. "_1"]:getPosition()
			local var_33_47, var_33_48 = var_0_0.uiTable["p" .. var_33_41.matchId .. "_2"]:getPosition()
			local var_33_49 = CCLabelTTF:create(var_33_41.name1, "", 20)

			var_33_49:setPosition(var_33_45, var_33_46 - 50)
			var_33_49:setColor(ccc3(255, 255, 209))

			local var_33_50 = CCLabelTTF:create(var_33_41.name2, "", 20)

			var_33_50:setPosition(var_33_47, var_33_48 - 50)
			var_33_50:setColor(ccc3(255, 255, 209))

			local var_33_51 = CCLabelTTF:create(language.get(83027, var_33_41.lv1), "", 20)

			var_33_51:setPosition(var_33_45, var_33_46 - 70)
			var_33_51:setColor(ccc3(255, 114, 98))

			local var_33_52 = CCLabelTTF:create(language.get(83027, var_33_41.lv2), "", 20)

			var_33_52:setPosition(var_33_47, var_33_48 - 70)
			var_33_52:setColor(ccc3(255, 114, 98))

			var_0_0.uiTable["name" .. var_33_41.matchId .. "_1"] = var_33_49
			var_0_0.uiTable["name" .. var_33_41.matchId .. "_2"] = var_33_50
			var_0_0.uiTable["lv" .. var_33_41.matchId .. "_1"] = var_33_51
			var_0_0.uiTable["lv" .. var_33_41.matchId .. "_2"] = var_33_52

			if var_33_41.matchId >= 8 then
				var_0_0.uiTable.tablePage1:addChild(var_33_49)
				var_0_0.uiTable.tablePage1:addChild(var_33_50)
				var_0_0.uiTable.tablePage1:addChild(var_33_51)
				var_0_0.uiTable.tablePage1:addChild(var_33_52)
			else
				var_0_0.uiTable.tablePage2:addChild(var_33_49)
				var_0_0.uiTable.tablePage2:addChild(var_33_50)
				var_0_0.uiTable.tablePage2:addChild(var_33_51)
				var_0_0.uiTable.tablePage2:addChild(var_33_52)
			end

			local var_33_53 = CCMenuItemImage:create("res/ui/kfzb/kfzbs_txdk72_02.png", "res/ui/kfzb/kfzbs_txdk72_02.png")
			local var_33_54 = CCMenuItemImage:create("res/ui/kfzb/kfzbs_txdk72_02.png", "res/ui/kfzb/kfzbs_txdk72_02.png")

			var_33_53:setPosition(ccp(var_33_42.width / 2, var_33_42.height / 2))
			var_33_54:setPosition(ccp(var_33_42.width / 2, var_33_42.height / 2))

			local var_33_55 = CCMenu:create()
			local var_33_56 = CCMenu:create()

			var_33_55:setPosition(ccp(0, 0))
			var_33_56:setPosition(ccp(0, 0))
			var_33_55:addChild(var_33_53)
			var_33_56:addChild(var_33_54)
			var_0_0.uiTable["p" .. var_33_41.matchId .. "_1"]:addChild(var_33_55, 0)
			var_0_0.uiTable["p" .. var_33_41.matchId .. "_2"]:addChild(var_33_56, 0)
			var_33_53:registerScriptTapHandler(function()
				var_0_12(var_33_41, 1)
			end)
			var_33_54:registerScriptTapHandler(function()
				var_0_12(var_33_41, 2)
			end)

			if arg_33_0.selfState == 1 and not var_0_8(var_33_41) and not var_0_9(var_33_41) then
				if user.player.name == var_33_41.name1 then
					local var_33_57 = CCSprite:create("res/ui/kfzb/kfzbs_txdkh72.png")

					var_0_0.uiTable["p" .. var_33_41.matchId .. "_1"]:addChild(var_33_57)
					var_33_57:setPosition(ccp(var_33_42.width / 2, var_33_42.height / 2))
				elseif user.player.name == var_33_41.name2 then
					local var_33_58 = CCSprite:create("res/ui/kfzb/kfzbs_txdkh72.png")

					var_0_0.uiTable["p" .. var_33_41.matchId .. "_2"]:addChild(var_33_58)
					var_33_58:setPosition(ccp(var_33_42.width / 2, var_33_42.height / 2))
				end
			end

			local var_33_59 = false

			local function var_33_60()
				var_0_0.uiTable["mmarkVS" .. var_33_41.matchId]:setVisible(false)
			end

			if user.haveFeast == 0 then
				if not var_0_8(var_33_41) and not var_0_9(var_33_41) then
					var_33_59 = true
				end

				if var_33_41.matchId == 1 then
					var_33_59 = true
				end
			end

			if not var_0_8(var_33_41) and not var_0_9(var_33_41) and var_33_59 then
				if arg_33_0.selfState == 1 then
					var_33_60()
					var_0_0.uiTable["mmarkDZ" .. var_33_41.matchId]:setVisible(true)
				else
					if var_33_41.guanzhu1 or var_33_41.guanzhu2 or var_33_25 then
						var_33_60()
						var_0_0.uiTable["mmarkCK" .. var_33_41.matchId]:setVisible(true)
					else
						var_33_60()
						var_0_0.uiTable["mmarkZC" .. var_33_41.matchId]:setVisible(true)

						var_33_18 = true
					end

					var_0_0.uiTable["mmarkBtn" .. var_33_41.matchId]:registerScriptTapHandler(function()
						print("matchId:" .. var_33_41.matchId)
						var_0_1.kfzbGetSupportPanel(var_33_41.matchId)
					end)
				end
			elseif arg_33_0.selfState == 2 and var_33_59 then
				if var_33_41.supSucNum > 0 then
					var_33_60()
					var_0_0.uiTable["mmarkQJ" .. var_33_41.matchId]:setVisible(true)
				else
					var_33_60()
					var_0_0.uiTable["mmarkQJH" .. var_33_41.matchId]:setVisible(true)
				end
			end

			if var_33_41.guanzhu1 then
				var_0_0.uiTable["pmarkZC" .. var_33_41.matchId .. "_1"]:setVisible(true)
			elseif var_33_41.guanzhu2 then
				var_0_0.uiTable["pmarkZC" .. var_33_41.matchId .. "_2"]:setVisible(true)
			end

			if var_0_8(var_33_41) then
				var_0_0.uiTable["pmarkJJ" .. var_33_41.matchId .. "_1"]:setVisible(true)
				tool.spriteToGray(var_33_44)
				var_0_0.uiTable["name" .. var_33_41.matchId .. "_2"]:setColor(colorQuality[0])
				var_0_0.uiTable["lv" .. var_33_41.matchId .. "_2"]:setColor(colorQuality[0])

				if var_33_41.matchId >= 2 and var_33_41.matchId <= 7 then
					var_0_0.uiTable["l" .. var_33_41.matchId .. "_1"]:setVisible(true)
				end
			elseif var_0_9(var_33_41) then
				var_0_0.uiTable["pmarkJJ" .. var_33_41.matchId .. "_2"]:setVisible(true)
				tool.spriteToGray(var_33_43)
				var_0_0.uiTable["name" .. var_33_41.matchId .. "_1"]:setColor(colorQuality[0])
				var_0_0.uiTable["lv" .. var_33_41.matchId .. "_1"]:setColor(colorQuality[0])

				if var_33_41.matchId >= 2 and var_33_41.matchId <= 7 then
					var_0_0.uiTable["l" .. var_33_41.matchId .. "_2"]:setVisible(true)
				end
			end
		end
	end

	var_0_0.uiTable.seeTipsLb:setVisible(arg_33_0.selfState == 2)
	var_0_0.uiTable.qinggongBtn:setVisible(user.haveFeast == 1)

	local var_33_61 = 0
	local var_33_62 = arg_33_0.tickets > 0 and arg_33_0.tickets or arg_33_0.suptickets

	var_0_0.uiTable.ticketLJLb:setVisible(not var_33_20)

	if arg_33_0.tickets > 0 or arg_33_0.selfState == 1 then
		var_0_0.uiTable.ticketLJLb:setString(language.get(490023, var_33_62))
	else
		var_0_0.uiTable.ticketLJLb:setString(language.get(490024, var_33_62))
	end

	if arg_33_0.selfState == 1 and arg_33_0.flag ~= 3 then
		local var_33_63 = var_33_62 > 0 and var_33_20

		var_0_0.uiTable.ticketLb:setVisible(var_33_63)
		var_0_0.uiTable.ticketIcon:setVisible(var_33_63)
		var_0_0.uiTable.rewardBtn:setVisible(var_33_63)
	else
		local var_33_64 = var_33_62 > 0 and (arg_33_0.curRound == var_33_21 and arg_33_0.battleTime <= 0 or arg_33_0.flag == 3 or var_33_20)

		var_0_0.uiTable.ticketLb:setVisible(var_33_64)
		var_0_0.uiTable.ticketIcon:setVisible(var_33_64)
		var_0_0.uiTable.rewardBtn:setVisible(var_33_64)
	end

	if arg_33_0.tickets > 0 and arg_33_0.selfState == 2 then
		var_0_0.uiTable.ticketLb:setVisible(true)
		var_0_0.uiTable.ticketIcon:setVisible(true)
		var_0_0.uiTable.rewardBtn:setVisible(true)
	end

	if arg_33_0.tickets > 0 then
		var_0_0.uiTable.ticketIcon:setDisplayFrame(tool.spriteByName("res_icon_100.png"):displayFrame())
		var_0_0.uiTable.rewardBtn:registerScriptTapHandler(function()
			var_0_1.kfzbGetTickets(0)
		end)
	else
		var_0_0.uiTable.ticketIcon:setDisplayFrame(tool.spriteByName("res_icon_1211.png"):displayFrame())
		var_0_0.uiTable.rewardBtn:registerScriptTapHandler(var_0_1.kfzbGetSupTickets)
	end

	if arg_33_0.selfState == 1 and arg_33_0.flag ~= 3 then
		var_0_0.uiTable.lostTipsLb:setVisible(true)
		var_0_0.uiTable.lostTipsLb:setString(language.get(490025))
	end

	if user.haveFeast == 1 then
		var_0_0.uiTable.lostTipsLb:setVisible(false)
		var_0_0.uiTable.seeTipsLb:setVisible(false)
	end

	var_0_0.uiTable.ticketLb:setString(language.get(490026, var_33_62))
	var_0_0.uiTable.jinjiLb:setString(language.get(490027, arg_33_0.layer - 4))

	if arg_33_0.phase == 1 and arg_33_0.flag == 3 then
		var_0_0.uiTable.seeTipsLb:setVisible(true)
		var_0_0.uiTable.lostTipsLb:setString(language.get(490028))
		var_0_0.uiTable.seeTipsLb:setString(language.get(490029))
	end

	if var_0_0.uiTable.myMatchBtn:isVisible() then
		var_0_0.uiTable.lostTipsLb:setString(language.get(490025))
	end

	if var_33_18 and arg_33_0.phase == 2 and arg_33_0.selfState == 2 and var_33_20 == false then
		var_0_0.uiTable.seeTipsLb:setVisible(true)
		var_0_0.uiTable.lostTipsLb:setVisible(true)
		var_0_0.uiTable.seeTipsLb:setString(language.get(490031))
		var_0_0.uiTable.lostTipsLb:setString(language.get(490032, var_0_4))
	elseif not var_33_18 and arg_33_0.phase == 2 and arg_33_0.selfState == 2 and var_33_20 == false then
		var_0_0.uiTable.seeTipsLb:setVisible(true)
		var_0_0.uiTable.lostTipsLb:setVisible(true)
		var_0_0.uiTable.seeTipsLb:setString(language.get(490033))
		var_0_0.uiTable.lostTipsLb:setString(language.get(490032, var_0_4))
	elseif var_33_20 == true then
		var_0_0.uiTable.seeTipsLb:setVisible(true)
		var_0_0.uiTable.seeTipsLb:setString(language.get(490034))
		var_0_0.uiTable.lostTipsLb:setString("")
	end

	if var_0_0.uiTable.rewardBtn:isVisible() then
		var_0_0.uiTable.seeTipsLb:setVisible(false)
	end

	if user.kfzbZone > 0 then
		var_0_0.uiTable.ticketLJLb:setVisible(false)
		var_0_0.uiTable.seeTipsLb:setVisible(false)
		var_0_0.uiTable.lostTipsLb:setVisible(false)
		var_0_0.uiTable.mmarkQJH1:setVisible(false)
		var_0_0.uiTable.mmarkVS1:setVisible(true)

		if arg_33_0.phase == 1 and arg_33_0.flag == 3 then
			var_0_0.uiTable.seeTipsLb:setVisible(true)
			var_0_0.uiTable.lostTipsLb:setVisible(false)
			var_0_0.uiTable.seeTipsLb:setString(language.get(490029))
			var_0_0.uiTable.lostTipsLb:setString(language.get(490028))
		end

		if var_33_18 and arg_33_0.phase == 2 and arg_33_0.selfState == 2 and var_33_20 == false then
			var_0_0.uiTable.seeTipsLb:setVisible(true)
			var_0_0.uiTable.seeTipsLb:setString(language.get(490031))
		end
	end
end

return kfzbUI
