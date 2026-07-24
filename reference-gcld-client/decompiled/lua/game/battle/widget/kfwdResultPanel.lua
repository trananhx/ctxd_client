local var_0_0 = {}

if conf.language == "kr" then
	var_0_0.totalScoreX = 38
	var_0_0.ticketsLabelX = 0
	var_0_0.ticketsPlusX = 0
	var_0_0.ticketsX = 0
	var_0_0.socrePlusX = 40
	var_0_0.scoreX = 40
	var_0_0.timeX = 0
elseif conf.language == "vie" then
	var_0_0.totalScoreX = 70
	var_0_0.ticketsLabelX = -20
	var_0_0.ticketsPlusX = 25
	var_0_0.ticketsX = 25
	var_0_0.socrePlusX = 35
	var_0_0.scoreX = 35
	var_0_0.timeX = 80
elseif conf.language == "tha" then
	var_0_0.totalScoreX = 0
	var_0_0.ticketsLabelX = 0
	var_0_0.ticketsPlusX = 0
	var_0_0.ticketsX = 0
	var_0_0.socrePlusX = 50
	var_0_0.scoreX = 50
	var_0_0.timeX = 0
else
	var_0_0.totalScoreX = 0
	var_0_0.ticketsLabelX = 0
	var_0_0.ticketsPlusX = 0
	var_0_0.ticketsX = 0
	var_0_0.socrePlusX = 0
	var_0_0.scoreX = 0
	var_0_0.timeX = 0
end

local var_0_1 = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = true,
		path = "xflts_res_view.png"
	},
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5,
	children = {
		{
			visible = false,
			name = "titleWin",
			x = 680,
			type = "sprite",
			y = 157,
			pic = {
				frame = true,
				path = "xflts_res_sl.png"
			},
			anchorPoint = ccp(0, 0)
		},
		{
			visible = false,
			name = "titleLose",
			x = 680,
			type = "sprite",
			y = 157,
			pic = {
				frame = true,
				path = "xflts_res_sb.png"
			},
			anchorPoint = ccp(0, 0)
		},
		{
			visible = false,
			name = "titlePass",
			x = 680,
			type = "sprite",
			y = 157,
			pic = {
				frame = true,
				path = "xflts_res_lk.png"
			},
			anchorPoint = ccp(0, 0)
		},
		{
			y = 240,
			x = 400,
			type = "node",
			children = {
				{
					y = 0,
					style = "label_yellowish_24",
					type = "label",
					x = 0,
					textId = 390200,
					anchorPoint = ccp(0, 0)
				},
				{
					text = "0",
					name = "totalSourceNum",
					y = 0,
					type = "label",
					style = "label_white_24",
					x = 97 + var_0_0.totalScoreX,
					anchorPoint = ccp(0, 0)
				}
			}
		},
		{
			y = 110,
			name = "killNode",
			type = "node",
			x = 255,
			children = {
				{
					y = 0,
					style = "label_yellowish_24",
					type = "label",
					x = 0,
					textId = 390201,
					anchorPoint = ccp(0, 0)
				},
				{
					text = "0",
					name = "killNum",
					y = 0,
					type = "label",
					style = "label_white_24",
					x = 112,
					anchorPoint = ccp(0, 0)
				}
			}
		},
		{
			y = 110,
			name = "loseNode",
			type = "node",
			x = 525,
			children = {
				{
					y = 0,
					style = "label_yellowish_24",
					type = "label",
					x = 0,
					textId = 390202,
					anchorPoint = ccp(0, 0)
				},
				{
					text = "0",
					name = "loseNum",
					y = 0,
					type = "label",
					style = "label_white_24",
					x = 112,
					anchorPoint = ccp(0, 0)
				}
			}
		},
		{
			y = 110,
			name = "gotoNode",
			visible = false,
			type = "node",
			x = 475,
			children = {
				{
					y = 60,
					style = "label_yellowish_24",
					type = "gotoTip",
					x = 250,
					textId = 390201,
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = 60,
					style = "label_white_24",
					type = "label",
					x = 350,
					textId = "0",
					anchorPoint = ccp(0, 0.5)
				}
			}
		},
		{
			y = 180,
			name = "ticket",
			type = "node",
			x = 390,
			children = {
				{
					y = 0,
					type = "sprite",
					pic = {
						frame = true,
						path = "xflts_res_get_dq.png"
					},
					x = 0 + var_0_0.ticketsLabelX,
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = 0,
					type = "sprite",
					pic = {
						frame = true,
						path = "xflts_res_numb_plus.png"
					},
					x = 72 + var_0_0.ticketsPlusX,
					anchorPoint = ccp(0, 0.5)
				},
				{
					name = "ticketNum",
					type = "atlaslabel",
					pic = "res/ui/common/number/xflts_res_numb.png",
					startCharMap = 48,
					text = "0",
					y = 0,
					itemWidth = 22,
					itemHeight = 33,
					x = 95 + var_0_0.ticketsX,
					anchorPoint = ccp(0, 0.5)
				}
			}
		},
		{
			y = 130,
			name = "score",
			visible = false,
			type = "node",
			x = 490,
			children = {
				{
					y = 0,
					x = 0,
					type = "sprite",
					pic = {
						frame = true,
						path = "xflts_res_get_jf.png"
					},
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = 0,
					type = "sprite",
					pic = {
						frame = true,
						path = "xflts_res_numb_plus.png"
					},
					x = 72 + var_0_0.socrePlusX,
					anchorPoint = ccp(0, 0.5)
				},
				{
					name = "scoreNum",
					type = "atlaslabel",
					pic = "res/ui/common/number/xflts_res_numb.png",
					startCharMap = 48,
					text = "0",
					y = 0,
					itemWidth = 22,
					itemHeight = 33,
					x = 95 + var_0_0.scoreX,
					anchorPoint = ccp(0, 0.5)
				}
			}
		},
		{
			x = 464,
			name = "passTip",
			y = 185,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "xflts_res_mess_lk.png"
			}
		},
		{
			y = 55,
			style = "label_yellowish_24",
			type = "label",
			x = 310,
			textId = 390405,
			anchorPoint = ccp(0, 0.5)
		}
	}
}

return {
	create = function(arg_1_0, arg_1_1, arg_1_2)
		rmgr.loadResource("res/ui/battle/fightResult/fightResult.plist")

		local var_1_0 = {}

		uiutil.initWidgets(var_1_0, var_0_1)

		arg_1_1.isBattleStart = false

		if arg_1_2.TotalScore then
			var_1_0.widgets.totalSourceNum:setString(tostring(arg_1_2.TotalScore))
		end

		if arg_1_2.kill then
			var_1_0.widgets.killNum:setString(tostring(arg_1_2.kill))
		end

		if arg_1_2.lost then
			var_1_0.widgets.loseNum:setString(tostring(arg_1_2.lost))
		end

		var_1_0.widgets.ticketNum:setString(tostring(arg_1_2.ticket))

		if arg_1_2.winState == kfwdWinState.win then
			if arg_1_1.kfwdInfo.enemyId == 0 then
				var_1_0.widgets.titlePass:setVisible(true)
				var_1_0.widgets.killNode:setVisible(false)
				var_1_0.widgets.loseNode:setVisible(false)
				var_1_0.widgets.passTip:setVisible(true)
				var_1_0.widgets.ticket:setPosition(ccp(300, 130))
				var_1_0.widgets.score:setVisible(true)
				var_1_0.widgets.scoreNum:setString(tostring(arg_1_2.score))
			else
				var_1_0.widgets.titleWin:setVisible(true)
			end
		elseif arg_1_2.winState == kfwdWinState.lose then
			var_1_0.widgets.titleLose:setVisible(true)
		end

		local function var_1_1()
			return
		end

		log.info("@@ 跨服武斗结果面板倒计时：", arg_1_2.nextRoundCd)

		local var_1_2 = createTimerLabel(arg_1_2.nextRoundCd, "@H:@M:@S", "Thonburi", 32, var_1_1, nil, nil, colorTips.red)

		var_1_2:setPosition(ccp(531 + var_0_0.timeX, 55))
		var_1_0.widgets.panel:addChild(var_1_2)
		arg_1_1.layerTabel.uiLayer:addChild(var_1_0.widgets.panel, 0, uiTag.kfwdResultPanel)
	end
}
