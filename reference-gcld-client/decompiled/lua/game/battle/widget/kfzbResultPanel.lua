local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.ticketsLabelX = -50
	var_0_1.timerX = -25
	var_0_1.lostTroopsX = 0
elseif conf.language == "tha" then
	var_0_1.ticketsLabelX = 0
	var_0_1.timerX = -8
	var_0_1.lostTroopsX = -20
else
	var_0_1.ticketsLabelX = 0
	var_0_1.timerX = 0
	var_0_1.lostTroopsX = 0
end

local var_0_2 = 929
local var_0_3 = 338
local var_0_4 = {
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
			text = "",
			name = "matchLabel",
			y = 265,
			type = "label",
			style = "label_yellowish_24",
			x = var_0_2 / 2
		},
		{
			text = "",
			name = "msgTip",
			y = 67,
			type = "label",
			style = "label_yellowish_24",
			x = var_0_2 / 2,
			anchorPoint = ccp(0.5, 0.5)
		},
		(function()
			if conf.language == "vie" then
				return {
					text = "Sau",
					name = "after",
					y = 33,
					type = "label",
					style = "label_yellowish_24",
					x = var_0_2 / 2 - 320,
					anchorPoint = ccp(1, 0.5)
				}
			elseif conf.language == "tha" then
				return {
					text = "ลัง",
					name = "after",
					y = 33,
					type = "label",
					style = "label_yellowish_24",
					x = var_0_2 / 2 - 230,
					anchorPoint = ccp(1, 0.5)
				}
			else
				return {}
			end
		end)(),
		{
			fontSize = 22,
			name = "timerTip",
			y = 33,
			type = "label",
			text = "",
			style = "label_yellowish_24",
			x = var_0_2 / 2,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			visible = false,
			name = "resJoinNode",
			type = "node",
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
					x = 525 + var_0_1.lostTroopsX,
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
					type = "node",
					name = "ticketNode",
					y = 180,
					visible = false,
					x = 390,
					children = {
						{
							y = 0,
							type = "sprite",
							pic = {
								frame = true,
								path = "xflts_res_get_dq.png"
							},
							x = 0 + var_0_1.ticketsLabelX,
							anchorPoint = ccp(0, 0.5)
						},
						{
							y = 0,
							x = 72,
							type = "sprite",
							pic = {
								frame = true,
								path = "xflts_res_numb_plus.png"
							},
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
							x = 95,
							itemHeight = 33,
							anchorPoint = ccp(0, 0.5)
						}
					}
				}
			}
		},
		{
			visible = false,
			name = "resWatchNode",
			type = "node",
			children = {
				{
					y = 160,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/kfzb/kfzbs_vs.png"
					},
					x = var_0_2 / 2
				},
				{
					name = "attPicBg",
					y = 160,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/kfzb/kfzbs_txdk72_02.png"
					},
					x = var_0_2 / 2 - 120
				},
				{
					name = "attWinPic",
					y = 190,
					type = "sprite",
					scale = 0.5,
					visible = false,
					pic = {
						frame = false,
						path = "res/ui/kfzb/kfzbs_zt_jieguo_sheng.png"
					},
					x = var_0_2 / 2 - 150
				},
				{
					name = "attLosePic",
					y = 190,
					type = "sprite",
					scale = 0.5,
					visible = false,
					pic = {
						frame = false,
						path = "res/ui/kfzb/kfzbs_zt_jieguo_bai.png"
					},
					x = var_0_2 / 2 - 150
				},
				{
					y = 180,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/kfzb/kfzbs_zt_jieguo_gf.png"
					},
					x = var_0_2 / 2 - 240
				},
				{
					text = "",
					name = "attWinNum",
					y = 150,
					type = "label",
					style = "label_yellowish_24",
					x = var_0_2 / 2 - 240
				},
				{
					text = "",
					name = "attLoseNum",
					y = 120,
					type = "label",
					style = "label_yellowish_24",
					anchor = ccp(1, 0.5),
					x = var_0_2 / 2 - 200
				},
				{
					name = "defPicBg",
					y = 160,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/kfzb/kfzbs_txdk72_02.png"
					},
					x = var_0_2 / 2 + 120
				},
				{
					name = "defWinPic",
					y = 190,
					type = "sprite",
					scale = 0.5,
					visible = false,
					pic = {
						frame = false,
						path = "res/ui/kfzb/kfzbs_zt_jieguo_sheng.png"
					},
					x = var_0_2 / 2 + 150
				},
				{
					name = "defLosePic",
					y = 190,
					type = "sprite",
					scale = 0.5,
					visible = false,
					pic = {
						frame = false,
						path = "res/ui/kfzb/kfzbs_zt_jieguo_bai.png"
					},
					x = var_0_2 / 2 + 150
				},
				{
					y = 180,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/kfzb/kfzbs_zt_jieguo_sf.png"
					},
					x = var_0_2 / 2 + 240
				},
				{
					text = "",
					name = "defWinNum",
					y = 150,
					type = "label",
					style = "label_yellowish_24",
					x = var_0_2 / 2 + 240
				},
				{
					text = "",
					name = "defLoseNum",
					y = 120,
					type = "label",
					style = "label_yellowish_24",
					anchor = ccp(0, 0.5),
					x = var_0_2 / 2 + 200
				}
			}
		}
	}
}
local var_0_5 = {
	zoomOnTouchDown = true,
	name = "btn",
	h = 80,
	type = "button",
	w = 80,
	y = 0,
	x = 0,
	normal = {
		path = "res/default.png"
	},
	touched = {
		path = "res/default.png"
	},
	children = {
		{
			y = 40,
			name = "icon",
			type = "sprite",
			x = 40,
			pic = {
				path = "res/ui/resource/tickets/ticket_icon_big.png"
			}
		},
		{
			fontSize = 25,
			name = "num",
			y = 10,
			type = "label",
			x = 40,
			color = var_0_0
		}
	}
}

return {
	create = function(arg_2_0, arg_2_1, arg_2_2)
		rmgr.loadResource("res/ui/battle/fightResult/fightResult.plist")

		local var_2_0 = {}

		uiutil.initWidgets(var_2_0, var_0_4)

		arg_2_1.isBattleStart = false

		if kfzbControl.kfzbData.selfState == 1 then
			var_2_0.widgets.resJoinNode:setVisible(true)

			if arg_2_2.kill then
				var_2_0.widgets.killNum:setString(tostring(arg_2_2.kill))
			end

			if arg_2_2.lost then
				var_2_0.widgets.loseNum:setString(tostring(arg_2_2.lost))
			end

			arg_2_2.ticket = arg_2_2.ticket or 0

			if user.kfzbZone == 0 and arg_2_2.ticket then
				-- block empty
			end

			if arg_2_1.kfzbInfo.competitorId1 == 0 or arg_2_1.kfzbInfo.competitorId2 == 0 then
				arg_2_2.winState = 3
			end

			if arg_2_2.winState == 1 then
				var_2_0.widgets.titleWin:setVisible(true)
			elseif arg_2_2.winState == 2 then
				var_2_0.widgets.titleLose:setVisible(true)
			elseif arg_2_2.winState == 3 then
				var_2_0.widgets.titlePass:setVisible(true)
			end

			if user.kfzbZone > 0 and (arg_2_2.winState == 1 or arg_2_2.winState == 3) then
				var_2_0.widgets.timerTip:setPosition(ccp(var_0_2 / 2 + 200, 33))

				local function var_2_1(arg_3_0)
					if not arg_3_0 or tolua.isnull(arg_3_0) then
						return
					end

					local var_3_0 = CCArray:create()

					var_3_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
					var_3_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
					var_3_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
					var_3_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
					var_3_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
					var_3_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
					var_3_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
					var_3_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
					var_3_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
					var_3_0:addObject(CCDelayTime:create(0.4))

					local var_3_1 = CCSequence:create(var_3_0)

					arg_3_0:stopAllActions()
					arg_3_0:runAction(CCRepeatForever:create(var_3_1))
				end

				local function var_2_2(arg_4_0)
					if arg_4_0.action.state == 1 then
						local var_4_0 = arg_4_0.action.data
						local var_4_1 = {}
						local var_4_2 = #var_4_0.rewards

						for iter_4_0, iter_4_1 in ipairs(var_4_0.rewards) do
							uiutil.initWidgets(var_4_1, var_0_5)
							var_4_1.widgets.btn:addHandleOfControlEvent(function()
								log.info("btn_pos" .. iter_4_1.pos)
								kfzbControl.kfzbGetTickets(iter_4_1.pos)
							end, CCControlEventTouchUpInside)
							var_4_1.widgets.icon:setDisplayFrame(CCSprite:create(kfzbConstant.rewardTypeTable[iter_4_1.type].pic):displayFrame())
							var_4_1.widgets.num:setString(iter_4_1.num)

							local var_4_3 = 300 - 50 * (var_4_2 - 1) + 100 * (iter_4_0 - 1)

							var_4_1.widgets.btn:setPosition(ccp(var_4_3, 50))
							var_2_0.widgets.panel:addChild(var_4_1.widgets.btn)
							var_2_1(var_4_1.widgets.icon)
						end

						for iter_4_2 = 1, var_4_2 - 1 do
							local var_4_4 = CCLabelTTF:create(language.get(490095), "", 22)
							local var_4_5 = 350 - 50 * (var_4_2 - 1) + 100 * (iter_4_2 - 1)

							var_4_4:setPosition(ccp(var_4_5, 50))
							var_2_0.widgets.panel:addChild(var_4_4)
						end
					end
				end

				cmgr.sendRequest(var_2_2, actions.kfzbGetRewardInfo, 1)
			end
		elseif kfzbControl.kfzbData.selfState == 2 then
			var_2_0.widgets.resWatchNode:setVisible(true)

			local var_2_3 = var_2_0.widgets.attPicBg:getContentSize()
			local var_2_4 = CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. arg_2_1.kfzbInfo.pic1 .. ".png")
			local var_2_5 = CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. arg_2_1.kfzbInfo.pic2 .. ".png")

			var_2_4:setScale(0.7777777777777778)
			var_2_5:setScale(0.7777777777777778)
			var_2_4:setPosition(ccp(var_2_3.width / 2, var_2_3.height / 2))
			var_2_5:setPosition(ccp(var_2_3.width / 2, var_2_3.height / 2))
			var_2_0.widgets.attPicBg:addChild(var_2_4)
			var_2_0.widgets.defPicBg:addChild(var_2_5)
			var_2_0.widgets.attWinNum:setString(language.get(490054, arg_2_2.p1Win))
			var_2_0.widgets.defWinNum:setString(language.get(490054, arg_2_2.p2Win))
			var_2_0.widgets.attLoseNum:setString(language.get(490063, arg_2_2.lost))
			var_2_0.widgets.defLoseNum:setString(language.get(490063, arg_2_2.kill))

			if arg_2_2.winState == 1 then
				var_2_0.widgets.attWinPic:setVisible(true)
				var_2_0.widgets.defLosePic:setVisible(true)
			elseif arg_2_2.winState == 2 then
				var_2_0.widgets.attLosePic:setVisible(true)
				var_2_0.widgets.defWinPic:setVisible(true)
			end
		end

		local function var_2_6()
			local var_6_0 = ""

			arg_2_1.kfzbInfo.isNextMatch = false

			if arg_2_1.kfzbInfo.matchId == 1 then
				var_6_0 = language.get(490045, language.get(490041), arg_2_1.kfzbInfo.round)

				if arg_2_1.kfzbInfo.round == 5 then
					arg_2_1.kfzbInfo.isNextMatch = true
				end
			elseif arg_2_1.kfzbInfo.matchId == 2 or arg_2_1.kfzbInfo.matchId == 3 then
				var_6_0 = language.get(490045, language.get(490040), arg_2_1.kfzbInfo.round)

				if arg_2_1.kfzbInfo.round == 5 then
					arg_2_1.kfzbInfo.isNextMatch = true
				end
			elseif arg_2_1.kfzbInfo.matchId >= 4 and arg_2_1.kfzbInfo.matchId <= 7 then
				var_6_0 = language.get(490044, language.get(490039), arg_2_1.kfzbInfo.round)

				if arg_2_1.kfzbInfo.round == 3 then
					arg_2_1.kfzbInfo.isNextMatch = true
				end
			elseif arg_2_1.kfzbInfo.matchId >= 8 and arg_2_1.kfzbInfo.matchId <= 15 then
				var_6_0 = language.get(490044, language.get(490038), arg_2_1.kfzbInfo.round)

				if arg_2_1.kfzbInfo.round == 3 then
					arg_2_1.kfzbInfo.isNextMatch = true
				end
			else
				local var_6_1 = language.get(user.kfzbZone > 0 and 490087 or 490086)

				arg_2_1.kfzbInfo.isNextMatch = true
				var_6_0 = language.get(490043, kfzbControl.kfzbData.saiqu, var_6_1, arg_2_1.kfzbInfo.layerNum)
			end

			if user.kfzbZone > 0 then
				var_6_0 = string.format("%s-%s", language.get(490088, user.kfzbZone), var_6_0)
			end

			var_2_0.widgets.matchLabel:setString(var_6_0)
		end

		local var_2_7
		local var_2_8 = ""

		local function var_2_9()
			if kfzbControl.kfzbData.selfState == 1 then
				if arg_2_1.kfzbInfo.isNextMatch then
					if arg_2_2.winState == 2 or arg_2_1.kfzbInfo.matchId == 1 and arg_2_1.kfzbInfo.round == 5 then
						var_2_8 = language.get(490048)

						function var_2_7()
							smgr.changeScene(SCENE_KFZB_TABLE)
						end
					else
						var_2_8 = language.get(490047)

						function var_2_7()
							log.info("@@ kfzbResultPanel.lua,跨服争霸", "bmgr.enterKfzb")
							bmgr.enterKfzb()
						end
					end
				elseif arg_2_1.kfzbInfo.matchId == 1 and arg_2_1.kfzbInfo.round == 5 then
					var_2_8 = language.get(490048)

					function var_2_7()
						smgr.changeScene(SCENE_KFZB_TABLE)
					end
				else
					var_2_8 = language.get(490046)

					function var_2_7()
						log.info("@@ kfzbResultPanel.lua,跨服争霸", "bmgr.enterKfzb")
						bmgr.enterKfzb()
					end
				end
			elseif kfzbControl.kfzbData.selfState == 2 then
				if arg_2_1.kfzbInfo.isNextMatch or arg_2_1.kfzbInfo.matchId == 1 and arg_2_1.kfzbInfo.round == 5 then
					var_2_8 = language.get(490048)

					function var_2_7()
						smgr.changeScene(SCENE_KFZB_TABLE)
					end
				else
					var_2_8 = language.get(490049)

					function var_2_7()
						kfzbControl.kfzbGetSupportPanel(arg_2_1.kfzbInfo.matchId)
					end
				end
			end

			if arg_2_2.nextRoundCd <= 0 then
				log.info("resultData.nextRoundCd<=0")

				arg_2_2.nextRoundCd = 0

				function var_2_7()
					smgr.changeScene(SCENE_KFZB_TABLE)
				end
			end

			var_2_0.widgets.timerTip:setString(var_2_8)
		end

		local function var_2_10()
			if user.kfzbZone > 0 then
				return
			end

			local var_15_0 = 0
			local var_15_1 = 0
			local var_15_2 = ""
			local var_15_3 = ""

			if kfzbControl.kfzbData.phase == 1 then
				var_2_0.widgets.msgTip:setVisible(false)
			elseif arg_2_1.kfzbInfo.matchId == 1 then
				var_15_1 = 3
				var_15_0 = 5
				var_15_2 = language.get(490041)
			elseif arg_2_1.kfzbInfo.matchId == 2 or arg_2_1.kfzbInfo.matchId == 3 then
				var_15_1 = 3
				var_15_0 = 5
				var_15_2 = language.get(490040)
			elseif arg_2_1.kfzbInfo.matchId >= 4 and arg_2_1.kfzbInfo.matchId <= 7 then
				var_15_1 = 2
				var_15_0 = 3
				var_15_2 = language.get(490039)
			elseif arg_2_1.kfzbInfo.matchId >= 8 and arg_2_1.kfzbInfo.matchId <= 15 then
				var_15_1 = 2
				var_15_0 = 3
				var_15_2 = language.get(490038)
			end

			if kfzbControl.kfzbData.phase == 2 then
				if kfzbControl.kfzbData.selfState == 1 then
					var_2_0.widgets.msgTip:setVisible(true)

					if arg_2_2.p1Win + arg_2_2.p2Win == var_15_0 then
						if arg_2_2.winState == 1 then
							if arg_2_1.kfzbInfo.matchId == 1 then
								var_15_3 = language.get(490072, arg_2_2.ticket)
							else
								var_15_3 = language.get(490069, arg_2_2.ticket)
							end
						elseif arg_2_2.winState == 2 then
							if arg_2_1.kfzbInfo.matchId == 1 then
								var_15_3 = language.get(490073, arg_2_2.ticket)
							else
								var_15_3 = language.get(490070, arg_2_2.ticket)
							end
						end
					else
						local var_15_4 = arg_2_1.kfzbInfo.isAttacker and var_15_1 - arg_2_2.p1Win or var_15_1 - arg_2_2.p2Win

						if var_15_4 < 0 then
							var_15_4 = 0
						end

						if arg_2_1.kfzbInfo.matchId == 1 then
							var_15_3 = language.get(490071, var_15_4, arg_2_2.ticket)
						else
							var_15_3 = language.get(490068, var_15_4, var_15_2)
						end
					end
				else
					var_2_0.widgets.msgTip:setVisible(arg_2_1.kfzbInfo.supported ~= 0)

					if arg_2_2.p1Win + arg_2_2.p2Win == var_15_0 then
						if var_15_1 == 2 then
							if arg_2_2.p1Win > arg_2_2.p2Win and arg_2_1.kfzbInfo.supported == 1 then
								var_15_3 = language.get(490064, 1)
							elseif arg_2_2.p1Win < arg_2_2.p2Win and arg_2_1.kfzbInfo.supported == 2 then
								var_15_3 = language.get(490066, 1)
							elseif arg_2_2.p1Win < arg_2_2.p2Win and arg_2_1.kfzbInfo.supported == 1 then
								var_15_3 = language.get(490065)
							elseif arg_2_2.p1Win > arg_2_2.p2Win and arg_2_1.kfzbInfo.supported == 2 then
								var_15_3 = language.get(490067)
							end
						elseif arg_2_2.winState == 1 and arg_2_1.kfzbInfo.supported == 1 then
							var_15_3 = language.get(490074, 1)
						elseif arg_2_2.winState == 2 and arg_2_1.kfzbInfo.supported == 2 then
							var_15_3 = language.get(490076, 1)
						elseif arg_2_2.winState == 2 and arg_2_1.kfzbInfo.supported == 1 then
							var_15_3 = language.get(490075)
						elseif arg_2_2.winState == 1 and arg_2_1.kfzbInfo.supported == 2 then
							var_15_3 = language.get(490077)
						else
							var_15_3 = language.get(490080)
						end
					elseif var_15_1 == 2 then
						if arg_2_1.kfzbInfo.supported == 1 then
							var_15_3 = language.get(490061, var_15_1 - arg_2_2.p1Win)
						elseif arg_2_1.kfzbInfo.supported == 2 then
							var_15_3 = language.get(490062, var_15_1 - arg_2_2.p2Win)
						end
					elseif arg_2_2.winState == 1 and arg_2_1.kfzbInfo.supported == 1 then
						var_15_3 = language.get(490074, 1)
					elseif arg_2_2.winState == 2 and arg_2_1.kfzbInfo.supported == 2 then
						var_15_3 = language.get(490076, 1)
					elseif arg_2_2.winState == 2 and arg_2_1.kfzbInfo.supported == 1 then
						var_15_3 = language.get(490075)
					elseif arg_2_2.winState == 1 and arg_2_1.kfzbInfo.supported == 2 then
						var_15_3 = language.get(490077)
					else
						var_15_3 = language.get(490080)
					end
				end
			end

			var_2_0.widgets.msgTip:setString(var_15_3)
		end

		local function var_2_11()
			log.info("@@ 删除跨服争霸结果面板")
			arg_2_1.layerTabel.uiLayer:removeChild(var_2_0.widgets.panel, true)

			if var_2_7 then
				var_2_7()
			end
		end

		log.info("@@ 跨服争霸结果面板倒计时：", arg_2_2.nextRoundCd)
		var_2_6()
		var_2_10()
		var_2_9()

		local var_2_12 = createTimerLabel(arg_2_2.nextRoundCd, "@H:@M:@S", "Thonburi", 22, var_2_11, nil, nil, colorTips.red)

		var_2_0.widgets.panel:addChild(var_2_12)

		local var_2_13, var_2_14 = var_2_0.widgets.timerTip:getPosition()
		local var_2_15 = var_2_0.widgets.timerTip:getContentSize()

		var_2_0.widgets.timerTip:setPosition(ccp(var_2_13 + 63 - 10, var_2_14))
		var_2_12:setPosition(ccp(var_2_13 - 0.5 * var_2_15.width + var_0_1.timerX, var_2_14))
		arg_2_1.layerTabel.uiLayer:addChild(var_2_0.widgets.panel)
	end
}
