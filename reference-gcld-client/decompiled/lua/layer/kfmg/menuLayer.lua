require("lua/layer/general/ui")
require("lua/layer/resource/ui")

local var_0_0 = class("yzMenuLayer", function()
	return createBaseLayer()
end)

var_0_0.layout = {
	type = "node",
	name = "node_army",
	y = 0,
	visible = false,
	x = 0,
	children = {
		{
			name = "btn_back",
			h = 50,
			type = "button",
			w = 104,
			scale = 1.2,
			normal = {
				frame = true,
				path = "btn_back_a.png"
			},
			touched = {
				frame = true,
				path = "btn_back_c.png"
			},
			x = visibleSize.width - 10,
			y = visibleSize.height - 10,
			anchorPoint = ccp(1, 1)
		},
		{
			x = 0,
			name = "btn_force1",
			h = 51,
			type = "button",
			w = 123,
			scale = 1.2,
			normal = {
				path = "res/ui/kfyz/dima.png"
			},
			touched = {
				path = "res/ui/kfyz/dima1.png"
			},
			y = visibleSize.height / 2,
			anchorPoint = ccp(0, 0.5)
		},
		{
			name = "btn_force2",
			h = 51,
			type = "button",
			w = 123,
			scale = 1.2,
			normal = {
				path = "res/ui/kfyz/dima.png"
			},
			touched = {
				path = "res/ui/kfyz/dima1.png"
			},
			x = visibleSize.width,
			y = visibleSize.height / 2,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 30,
			name = "name_force1",
			type = "label",
			style = "label_warlock",
			x = 67,
			y = visibleSize.height / 2 + 5,
			color = color_whi
		},
		{
			fontSize = 30,
			name = "name_force2",
			type = "label",
			style = "label_warlock",
			x = visibleSize.width - 67,
			y = visibleSize.height / 2 + 5,
			color = color_whi
		}
	}
}

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.world = arg_2_1
	arg_2_0.uiTable = autoUI.initUI(arg_2_0, arg_2_0:getUiData())
	arg_2_0.view = {}

	uiutil.initWidgets(arg_2_0.view, arg_2_0.layout)
	arg_2_0:addChild(arg_2_0.view.widgets.node_army)
	arg_2_0.uiTable.mainCity:registerScriptTapHandler(function()
		kfcmgr.sendRequest(nil, actions.kfLeave)
		pcall(kfcmgr.disconnectFromServer)
		smgr.changeScene(SCENE_MAIN_CITY)
	end)
	arg_2_0.uiTable.kuafu:registerScriptTapHandler(function()
		local var_4_0 = require("lua/layer/kfmg/kfmgJunku/ui").new(arg_2_0.world)

		smgr.getLayer("topLayer"):addChild(var_4_0)
	end)
	arg_2_0.uiTable.resource:registerScriptTapHandler(function()
		resourceUI.show()
	end)
	arg_2_0.uiTable.general:registerScriptTapHandler(function()
		showGeneralPanel(nil, true)
	end)
	arg_2_0.uiTable.taskButton:registerScriptTapHandler(function()
		local var_7_0 = require("lua/layer/kfmg/kfmgTask/ui").new()

		smgr.getLayer("topLayer"):addChild(var_7_0)
	end)
	arg_2_0.view.widgets.btn_force1:addHandleOfControlEvent(function()
		arg_2_0.forceToAtt = (arg_2_0.forceToAtt - 1) % 3

		if arg_2_0.forceToAtt == 0 then
			arg_2_0.forceToAtt = 3
		end

		log.info("btn_force1", arg_2_0.forceToAtt)
		arg_2_0:changeForceToAtt()
	end, CCControlEventTouchUpInside)
	arg_2_0.view.widgets.btn_force2:setScaleX(-1.2)
	arg_2_0.view.widgets.btn_force2:addHandleOfControlEvent(function()
		arg_2_0.forceToAtt = (arg_2_0.forceToAtt + 1) % 3

		if arg_2_0.forceToAtt == 0 then
			arg_2_0.forceToAtt = 3
		end

		log.info("btn_force2", arg_2_0.forceToAtt)
		arg_2_0:changeForceToAtt()
	end, CCControlEventTouchUpInside)
	arg_2_0.view.widgets.btn_back:addHandleOfControlEvent(function()
		eventManager.dispatchEvent("armyBaseSetVisible", false)
	end, CCControlEventTouchUpInside)

	if user.getFunc(15) then
		local var_2_0 = require("lua/layer/chat/chatWindow")

		var_2_0:showFastChatPanel(arg_2_0)
		var_2_0.widgets.panel:setVisible(true)

		arg_2_0.chat_panel = var_2_0.widgets.panel
	end
end

function var_0_0.handlerGetWorldMapAction(arg_11_0, arg_11_1)
	arg_11_0.data = arg_11_1.data

	arg_11_0:showOrder()
end

function var_0_0.showOrder(arg_12_0)
	local function var_12_0()
		if not tolua.isnull(arg_12_0.pdlPicBg) then
			arg_12_0.pdlPicBg:removeFromParentAndCleanup(true)
		end

		if not tolua.isnull(arg_12_0.expPicBg) then
			arg_12_0.expPicBg:removeFromParentAndCleanup(true)
		end
	end

	var_12_0()

	local var_12_1 = 0

	if arg_12_0.data.effect and arg_12_0.data.pdlLastTime then
		local var_12_2 = CCSprite:create(picQualityFrame[6])

		var_12_2:setPosition(ccp(visibleSize.width - 160, visibleSize.height - 55))
		var_12_2:setScale(0.8)

		local var_12_3 = var_12_2:getContentSize()
		local var_12_4 = CCSprite:create("res/ui/kfmg/kfmgJunku/pdl.jpg")

		var_12_4:setPosition(ccp(var_12_3.width / 2, var_12_3.height / 2))

		local var_12_5 = createTimerLabel(arg_12_0.data.pdlLastTime, "@M:@S", "Thonburi", 26, var_12_0, nil, nil, colorText.TJ_Green)

		var_12_5:setPosition(ccp(var_12_2:getContentSize().width / 2, -5))
		var_12_2:addChild(var_12_4)
		var_12_2:addChild(var_12_5)
		arg_12_0:addChild(var_12_2)

		arg_12_0.pdlPicBg = var_12_2
		var_12_1 = var_12_1 + 1
	end

	if arg_12_0.data.effect and arg_12_0.data.expLastTime then
		local var_12_6 = -160

		if var_12_1 >= 1 then
			var_12_6 = -235
		end

		local var_12_7 = CCSprite:create(picQualityFrame[6])

		var_12_7:setPosition(ccp(visibleSize.width + var_12_6, visibleSize.height - 55))
		var_12_7:setScale(0.8)

		local var_12_8 = var_12_7:getContentSize()
		local var_12_9 = CCSprite:create("res/ui/kfmg/kfmgJunku/jyl.jpg")

		var_12_9:setPosition(ccp(var_12_8.width / 2, var_12_8.height / 2))

		local var_12_10 = createTimerLabel(arg_12_0.data.expLastTime, "@M:@S", "Thonburi", 26, var_12_0, nil, nil, colorText.TJ_Green)

		var_12_10:setPosition(ccp(var_12_7:getContentSize().width / 2, -5))
		var_12_7:addChild(var_12_9)
		var_12_7:addChild(var_12_10)
		arg_12_0:addChild(var_12_7)

		arg_12_0.expPicBg = var_12_7
	end
end

function var_0_0.changeRank(arg_14_0, arg_14_1)
	if arg_14_1.selfBRank > 0 and arg_14_1.selfBRank <= 40 then
		arg_14_0.uiTable.rankTitlePlus:setVisible(false)
		arg_14_0.uiTable.rankValueAtlas:setString(tostring(arg_14_1.selfBRank))
		arg_14_0.uiTable.rankValueAtlas:setPosition(ccp(40, 24))

		if arg_14_1.selfBRank > 0 and arg_14_1.selfBRank <= 5 then
			arg_14_0.uiTable.rankTitlePic:setDisplayFrame(CCSprite:create("res/ui/world/hourRank/sanguoshenjiang.png"):displayFrame())
		elseif arg_14_1.selfBRank > 5 and arg_14_1.selfBRank <= 10 then
			arg_14_0.uiTable.rankTitlePic:setDisplayFrame(CCSprite:create("res/ui/world/hourRank/shadimengjiang.png"):displayFrame())
		elseif arg_14_1.selfBRank > 10 and arg_14_1.selfBRank <= 20 then
			arg_14_0.uiTable.rankTitlePic:setDisplayFrame(CCSprite:create("res/ui/world/hourRank/zhengzhansifang.png"):displayFrame())
		elseif arg_14_1.selfBRank > 20 and arg_14_1.selfBRank <= 30 then
			arg_14_0.uiTable.rankTitlePic:setDisplayFrame(CCSprite:create("res/ui/world/hourRank/bingduojiangguang.png"):displayFrame())
		elseif arg_14_1.selfBRank > 30 and arg_14_1.selfBRank <= 40 then
			arg_14_0.uiTable.rankTitlePic:setDisplayFrame(CCSprite:create("res/ui/world/hourRank/chongfengxianzhen.png"):displayFrame())
		end
	else
		arg_14_0.uiTable.rankTitlePic:setDisplayFrame(CCSprite:create("res/ui/world/hourRank/rank_name_none.png"):displayFrame())
		arg_14_0.uiTable.rankValueAtlas:setString("40")
		arg_14_0.uiTable.rankTitlePlus:setVisible(true)
	end
end

function var_0_0.changeMatchState(arg_15_0, arg_15_1)
	log.info("yzMenuLayer:changeMatchState(%s)", arg_15_1)

	if arg_15_1 == 2 then
		arg_15_0.uiTable.openbar:setVisible(true)
		arg_15_0.uiTable.kuafu:setVisible(true)
		arg_15_0.uiTable.resource:setVisible(true)
		arg_15_0.uiTable.general:setVisible(true)
		arg_15_0.uiTable.rankFlag:setVisible(true)
		arg_15_0.uiTable.background:setVisible(true)
	else
		arg_15_0.uiTable.openbar:setVisible(false)
		arg_15_0.uiTable.kuafu:setVisible(false)
		arg_15_0.uiTable.resource:setVisible(false)
		arg_15_0.uiTable.general:setVisible(false)
		arg_15_0.uiTable.rankFlag:setVisible(false)
		arg_15_0.uiTable.background:setVisible(false)
	end
end

function var_0_0.clickPackUpOrUnFold(arg_16_0)
	if not kfworld.upOrDown then
		local var_16_0 = {
			name = "sequence",
			actions = {
				{
					name = "callFunc",
					func = function()
						local var_17_0 = CCSprite:create("ui/mainUI/btn_zhankai_a.png")
						local var_17_1 = CCSprite:create("ui/mainUI/btn_zhankai_c.png")
						local var_17_2 = GraySprite:create("ui/mainUI/btn_zhankai_a.png")

						arg_16_0.uiTable.footerBg:setNormalImage(var_17_0)
						arg_16_0.uiTable.footerBg:setSelectedImage(var_17_1)
						arg_16_0.uiTable.footerBg:setDisabledImage(var_17_2)

						kfworld.upOrDown = true
					end
				},
				{
					isEaseBackOut = true,
					name = "moveTo",
					duration = 0.2,
					position = ccp(570, 0)
				}
			}
		}
		local var_16_1 = tool.loadActionByTable(var_16_0)

		arg_16_0.uiTable.openbar:runAction(var_16_1)
	else
		local var_16_2 = {
			name = "sequence",
			actions = {
				{
					name = "callFunc",
					func = function()
						local var_18_0 = CCSprite:create("ui/mainUI/btn_shouqi_a.png")
						local var_18_1 = CCSprite:create("ui/mainUI/btn_shouqi_c.png")
						local var_18_2 = GraySprite:create("ui/mainUI/btn_shouqi_a.png")

						arg_16_0.uiTable.footerBg:setNormalImage(var_18_0)
						arg_16_0.uiTable.footerBg:setSelectedImage(var_18_1)
						arg_16_0.uiTable.footerBg:setDisabledImage(var_18_2)

						kfworld.upOrDown = false
					end
				},
				{
					isEaseBackOut = true,
					name = "moveTo",
					duration = 0.2,
					position = ccp(255, 0)
				}
			}
		}
		local var_16_3 = tool.loadActionByTable(var_16_2)

		arg_16_0.uiTable.openbar:runAction(var_16_3)
	end
end

function var_0_0.getUiData(arg_19_0)
	local var_19_0 = {}

	local function var_19_1(arg_20_0, arg_20_1)
		arg_20_0[#arg_20_0 + 1] = arg_20_1

		return arg_20_1
	end

	var_19_0.background = {
		down = 0,
		type = "pic",
		pic = "res/ui/mainUI/footer_r_view.png",
		right = 0,
		children = {}
	}

	var_19_1(var_19_0.background.children, {
		z = -1,
		name = "openbar",
		x = 160,
		type = "pic",
		y = 23,
		pic = "res/ui/mainUI/footer_r_open_view.png"
	})
	var_19_1(var_19_0.background.children, {
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
				pic2 = "res/ui/kfyz/navi_l_jk_click.png",
				pic3 = "res/ui/kfyz/navi_l_jk_gray.png",
				pic1 = "res/ui/kfyz/navi_l_jk_a.png",
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

	var_19_0.rankFlag = {
		name = "rankFlag",
		type = "pic",
		ycenter = 20,
		right = 70,
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
	var_19_0.taskBut = {
		y = 340,
		right = 40,
		type = "button",
		new = true,
		buttons = {
			{
				pic2 = "res/ui/world/nationChallenges/task_challenge_btn_view.png",
				name = "taskButton",
				pic1 = "res/ui/world/nationChallenges/task_challenge_btn_view.png",
				children = {
					{
						xcenter = 0,
						ycenter = 0,
						pic = "res/ui/world/nationChallenges/task_challenge_tit_shadi.png",
						type = "pic"
					},
					{
						xcenter = 0,
						name = "progress1",
						type = "process",
						ycenter = 0,
						pic = "res/ui/world/nationChallenges/task_challenge_btn_con.png",
						barType = kCCProgressTimerTypeRadial,
						midPoint = CCPointMake(0.5, 0.5),
						barChangeRate = CCPointMake(1, 0)
					},
					{
						xcenter = 0,
						name = "complete1",
						type = "pic",
						visible = false,
						ycenter = 0,
						pic = "res/ui/world/nationChallenges/task_challenge_btn_con_2.png"
					},
					{
						xcenter = 0,
						name = "light1",
						type = "pic",
						visible = false,
						ycenter = 0,
						pic = "res/ui/world/nationChallenges/task_challenge_btn_lig.png"
					}
				}
			}
		}
	}

	return var_19_0
end

function var_0_0.handlerGetSIndivTaskAction(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_1.data.indiv

	for iter_21_0 = 1, 1 do
		arg_21_0.uiTable["progress" .. iter_21_0]:setPercentage(100 * var_21_0[iter_21_0].value / var_21_0[iter_21_0].goal)

		local var_21_1 = var_21_0[iter_21_0].isFinish and not var_21_0[iter_21_0].isReward

		arg_21_0.uiTable["complete" .. iter_21_0]:setVisible(var_21_0[iter_21_0].isFinish)

		local var_21_2 = arg_21_0.uiTable["light" .. iter_21_0]

		var_21_2:stopAllActions()
		var_21_2:setVisible(var_21_1)

		if var_21_1 then
			var_21_2:setOpacity(0)

			local var_21_3 = CCArray:create()

			var_21_3:addObject(CCFadeIn:create(0.3))
			var_21_3:addObject(CCFadeOut:create(0.7))

			local var_21_4 = CCSequence:create(var_21_3)
			local var_21_5 = CCRepeatForever:create(tolua.cast(var_21_4, "CCActionInterval"))

			var_21_2:runAction(var_21_5)
		end
	end
end

function var_0_0.setVisibleArmyBase(arg_22_0, arg_22_1)
	if arg_22_1 then
		arg_22_0:changeForceToAtt()
	end

	arg_22_0.view.widgets.node_army:setVisible(arg_22_1)
	eventManager.dispatchEvent("sideGeneralSetVisible", not arg_22_1)
	arg_22_0.world.thumbnail:setVisible(not arg_22_1)

	if arg_22_0.chat_panel then
		arg_22_0.chat_panel:setVisible(not arg_22_1)
	end

	arg_22_0.uiTable.background:setVisible(not arg_22_1)
	arg_22_0.uiTable.taskBut:setVisible(not arg_22_1)
	arg_22_0.uiTable.rankFlag:setVisible(not arg_22_1)
	arg_22_0.world.mapLayer:setTouchEnabled(not arg_22_1)
	arg_22_0.world.mapLayer.worldLayer:setTouchEnabled(not arg_22_1)
end

function var_0_0.changeForceToAtt(arg_23_0)
	local var_23_0 = {
		390512,
		390513,
		390514,
		[6002] = 390515
	}
	local var_23_1 = {
		123,
		19,
		207,
		[6002] = 105
	}

	if user.player.kfForceId == 1 then
		forcePic = {
			2,
			3,
			6002
		}
	elseif user.player.kfForceId == 2 then
		forcePic = {
			1,
			3,
			6002
		}
	elseif user.player.kfForceId == 3 then
		forcePic = {
			1,
			2,
			6002
		}
	end

	arg_23_0.forceToAtt = arg_23_0.forceToAtt or 1

	log.info("self.forceToAtt = ", arg_23_0.forceToAtt, var_23_1[forcePic[arg_23_0.forceToAtt]])
	eventManager.dispatchEvent("moveToCity", var_23_1[forcePic[arg_23_0.forceToAtt]], false)

	local var_23_2 = {
		(arg_23_0.forceToAtt - 1) % 3,
		(arg_23_0.forceToAtt + 1) % 3
	}

	for iter_23_0 = 1, 2 do
		if var_23_2[iter_23_0] == 0 then
			var_23_2[iter_23_0] = 3
		end

		arg_23_0.view.widgets["name_force" .. iter_23_0]:setString(language.get(var_23_0[forcePic[var_23_2[iter_23_0]]]))
	end
end

function var_0_0.onEnter(arg_24_0)
	arg_24_0.setVisibleArmyBaseRef = handler(arg_24_0, arg_24_0.setVisibleArmyBase)

	eventManager.registerEvent("armyBaseSetVisible", arg_24_0.setVisibleArmyBaseRef)
end

function var_0_0.onExit(arg_25_0)
	eventManager.unregisterEvent("armyBaseSetVisible", arg_25_0.setVisibleArmyBaseRef)
end

return var_0_0
