local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.countDownLabelX = 150
	var_0_0.levelScale = 0.9
	var_0_0.scoreTodayScale = 0.9
	var_0_0.scoreTotalScale = 0.9
	var_0_0.socreTotalScaleX = 16
elseif conf.language == "tha" then
	var_0_0.countDownLabelX = 0
	var_0_0.levelScale = 1
	var_0_0.scoreTodayScale = 1
	var_0_0.scoreTotalScale = 1
	var_0_0.socreTotalScaleX = 16
else
	var_0_0.countDownLabelX = 0
	var_0_0.levelScale = 1
	var_0_0.scoreTodayScale = 1
	var_0_0.scoreTotalScale = 1
	var_0_0.socreTotalScaleX = 0
end

local var_0_1 = {
	parent = "uiLayer",
	widgets = {
		{
			name = "panel",
			type = "sprite",
			zorder = 20,
			pic = {
				frame = true,
				path = "xflts_ph_view_bg.png"
			},
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 + 50,
			children = {
				{
					y = 450,
					name = "closeJifengWindowButton",
					scale = 1.5,
					type = "button",
					style = "button_close",
					x = 900
				},
				{
					x = 468,
					name = "titleWin",
					y = 425,
					type = "sprite",
					pic = {
						frame = true,
						path = "xflts_tit_scor.png"
					},
					anchorPoint = ccp(0.5, 0)
				},
				{
					y = 370,
					name = "timerNode",
					type = "node",
					x = 285,
					children = {
						{
							text = "NA",
							name = "timeToNext",
							y = 0,
							type = "label",
							style = "label_yellowish_24",
							x = 0,
							anchorPoint = ccp(0, 0)
						}
					}
				},
				{
					y = 340,
					x = 155,
					type = "sprite",
					pic = {
						frame = true,
						path = "xflts_name_pm.png"
					},
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					y = 340,
					x = 265,
					type = "sprite",
					pic = {
						frame = true,
						path = "xflts_name_fwq.png"
					},
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					y = 340,
					x = 415,
					type = "sprite",
					pic = {
						frame = true,
						path = "xflts_name_wj.png"
					},
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					y = 340,
					x = 555,
					type = "sprite",
					pic = {
						frame = true,
						path = "xflts_name_dj.png"
					},
					anchorPoint = ccp(0.5, 0.5),
					scale = var_0_0.levelScale
				},
				{
					y = 340,
					x = 650,
					type = "sprite",
					pic = {
						frame = true,
						path = "xflts_name_jrjf.png"
					},
					anchorPoint = ccp(0.5, 0.5),
					scale = var_0_0.scoreTodayScale
				},
				{
					y = 340,
					type = "sprite",
					pic = {
						frame = true,
						path = "xflts_name_zjf.png"
					},
					x = 760 + var_0_0.socreTotalScaleX,
					anchorPoint = ccp(0.5, 0.5),
					scale = var_0_0.scoreTotalScale
				}
			}
		},
		{
			text = "",
			name = "playerRankTip",
			anchorX = 0.5,
			type = "richLabel",
			y = 105,
			x = visibleSize.width * 0.5
		},
		{
			marginH = 10,
			name = "getRewardButton",
			h = 67,
			type = "button",
			w = 178,
			zoomOnTouchDown = false,
			visible = false,
			y = 50,
			marginV = 10,
			normal = {
				frame = true,
				path = "btn_xflts_lqjl_a.png"
			},
			touched = {
				frame = true,
				path = "btn_xflts_lqjl_c.png"
			},
			x = visibleSize.width * 0.5,
			children = {
				{
					text = "",
					name = "rewardTicketNum",
					y = 33,
					type = "label",
					style = "label_white_24",
					x = 188,
					anchorPoint = ccp(0, 0.5)
				}
			}
		},
		{
			y = 50,
			name = "hasGetReward",
			style = "label_white_24",
			type = "label",
			visible = false,
			size = 32,
			textId = 390303,
			x = visibleSize.width * 0.5
		}
	}
}
local var_0_2 = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			y = 0,
			x = 155,
			type = "node",
			children = {
				{
					visible = false,
					name = "topFlag",
					x = 0,
					type = "sprite",
					y = 0,
					pic = {
						frame = true,
						path = "xflts_pm_top.png"
					},
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					name = "rankNum",
					type = "atlaslabel",
					pic = "res/ui/common/number/xflts_res_numb.png",
					startCharMap = 48,
					text = "0",
					y = 0,
					itemWidth = 22,
					x = 0,
					itemHeight = 33,
					anchorPoint = ccp(0.5, 0.5)
				}
			}
		},
		{
			text = "",
			name = "serverLabel",
			y = 0,
			type = "label",
			style = "label_yellowish_24",
			x = 265,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			text = "",
			name = "playerLabel",
			y = 0,
			type = "label",
			style = "label_white_24",
			x = 415,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			text = "",
			name = "lvLabel",
			y = 0,
			type = "label",
			style = "label_yellowish_24",
			x = 555,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			text = "",
			name = "scoreLabel",
			y = 0,
			type = "label",
			style = "label_yellowish_24",
			x = 650,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			text = "",
			name = "totalScoreLabel",
			y = 0,
			type = "label",
			style = "label_yellowish_24",
			x = 760,
			anchorPoint = ccp(0.5, 0.5)
		}
	}
}
local var_0_3 = {}

local function var_0_4(arg_1_0)
	local var_1_0 = {}

	table.insert(var_1_0, {
		id = 100,
		value = arg_1_0
	})
	globalAction_gotResource(var_1_0)
end

local function var_0_5(arg_2_0, arg_2_1)
	local function var_2_0(arg_3_0)
		local var_3_0 = arg_3_0.data.dtoList
		local var_3_1 = arg_3_0.data.day

		if var_3_1 == 0 then
			var_3_1 = 1
		end

		local var_3_2 = arg_3_0.data.selfPos + 1
		local var_3_3 = arg_3_0.data.hasGetReward
		local var_3_4 = arg_3_0.data.rewardTicket
		local var_3_5
		local var_3_6 = 300
		local var_3_7 = 36

		for iter_3_0, iter_3_1 in pairs(var_3_0) do
			if tolua.type(iter_3_1) ~= "[undefined]" then
				local var_3_8 = {}

				uiutil.initWidgets(var_3_8, var_0_2)

				if iter_3_0 < 4 then
					var_3_8.widgets.topFlag:setVisible(true)
				elseif iter_3_0 > 8 then
					break
				end

				if iter_3_1.self == 1 then
					local var_3_9 = stringSplit(iter_3_1.dayScore, ",")
					local var_3_10 = language.get(390302, var_3_1, var_3_9[var_3_1], iter_3_1.score, iter_3_1.pos + 1)

					arg_2_1.widgets.playerRankTip:setString(var_3_10)
				end

				var_3_8.widgets.rankNum:setString(tostring(iter_3_1.pos + 1))
				log.info("@@ 今日积分：", iter_3_1.dayScore, var_3_1)

				local var_3_11 = stringSplit(iter_3_1.dayScore, ",")

				var_3_8.widgets.serverLabel:setString(iter_3_1.serverName)
				var_3_8.widgets.playerLabel:setString(iter_3_1.playerName)
				var_3_8.widgets.lvLabel:setString(iter_3_1.plv)

				local var_3_12 = language.get(390404, iter_3_1.serverName, iter_3_1.serverId)

				var_3_8.widgets.serverLabel:setString(tostring(var_3_12))
				var_3_8.widgets.scoreLabel:setString(tostring(var_3_11[var_3_1]))
				var_3_8.widgets.totalScoreLabel:setString(iter_3_1.score)
				var_3_8.widgets.root:setPosition(ccp(0, var_3_6))
				arg_2_1.widgets.panel:addChild(var_3_8.widgets.root)
			end

			var_3_6 = var_3_6 - var_3_7
		end

		if arg_2_0.kfwdInfo.kfwdState == kfwdState.over then
			if var_3_1 ~= 3 then
				local var_3_13 = createTimerLabel(arg_2_0.kfwdInfo.nextSRoundCD - 3600000, "@H:@M:@S", "Thonburi", 24, arg_2_0.getKfwdInfo, nil, nil, colorTips.red)

				var_3_13:setPosition(ccp(397, 12))
				arg_2_1.widgets.timerNode:addChild(var_3_13)
				arg_2_1.widgets.timeToNext:setString(language.get(390300, var_3_1 + 1))
			else
				local var_3_14 = createTimerLabel(arg_2_0.kfwdInfo.nextStateCD, "@H:@M:@S", "Thonburi", 24, arg_2_0.getKfwdInfo, nil, nil, colorTips.red)

				var_3_14:setPosition(ccp(257 + var_0_0.countDownLabelX, 12))
				arg_2_1.widgets.timerNode:addChild(var_3_14)
				arg_2_1.widgets.timeToNext:setString(language.get(390301))
			end
		end

		if var_3_3 then
			if var_3_3 == 1 then
				arg_2_1.widgets.hasGetReward:setVisible(true)
			else
				arg_2_1.widgets.getRewardButton:setVisible(true)
				arg_2_1.widgets.rewardTicketNum:setString(language.get(390403, var_3_4))

				local function var_3_15()
					local function var_4_0()
						arg_2_1.widgets.getRewardButton:setVisible(false)
						arg_2_1.widgets.hasGetReward:setVisible(true)
						var_0_4(var_3_4)
					end

					kfcmgr.sendRequest(var_4_0, actions.kfwdGetReward, var_3_1)
				end

				arg_2_1.widgets.getRewardButton:addHandleOfControlEvent(var_3_15, CCControlEventTouchUpInside)
			end
		end
	end

	kfcmgr.sendRequest(var_2_0, actions.kfwdRank)
end

function var_0_3.create(arg_6_0, arg_6_1, arg_6_2)
	rmgr.loadResource("res/ui/battle/fightResult/fightResult.plist")

	local var_6_0 = {}

	uiutil.initLayout(var_6_0, var_0_1)

	local var_6_1 = true

	if arg_6_2 and arg_6_2.hideGetReward then
		var_6_0.widgets.getRewardButton:setVisible(false)
		var_6_0.widgets.hasGetReward:setVisible(false)
		var_6_0.widgets.rewardTicketNum:setVisible(false)
		var_6_0.widgets.timerNode:setVisible(false)
		var_6_0.widgets.playerRankTip:setVisible(false)
	else
		var_6_0.widgets.timerNode:setVisible(true)
		var_6_0.widgets.closeJifengWindowButton:setVisible(false)

		var_6_1 = false
	end

	local function var_6_2()
		arg_6_1.layerTabel.uiLayer:removeChild(var_6_0.widgets.panel, true)
		arg_6_1.layerTabel.uiLayer:removeChild(var_6_0.widgets.playerRankTip, true)
		arg_6_1.layerTabel.uiLayer:removeChild(var_6_0.widgets.hasGetReward, true)
		arg_6_1.layerTabel.uiLayer:removeChild(var_6_0.widgets.getRewardButton, true)
	end

	var_6_0.widgets.closeJifengWindowButton:addHandleOfControlEvent(var_6_2, CCControlEventTouchUpInside)

	local function var_6_3(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == CCTOUCHBEGAN then
			if not var_6_0.widgets.panel:isVisible() then
				return false
			end

			local var_8_0 = var_6_0.widgets.panel:getParent()

			while var_8_0 do
				if not var_8_0:isVisible() then
					return false
				end

				var_8_0 = var_8_0:getParent()
			end

			if tool.checkIfTouch(var_6_0.widgets.panel, arg_8_1, arg_8_2) then
				return true
			end

			return false
		end
	end

	var_6_0.widgets.panel:registerScriptTouchHandler(var_6_3, false, var_6_1)
	var_6_0.widgets.panel:setTouchEnabled(true)
	var_0_5(arg_6_1, var_6_0)
end

return var_0_3
