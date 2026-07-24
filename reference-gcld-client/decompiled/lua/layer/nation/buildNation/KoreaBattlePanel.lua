local var_0_0 = {
	{
		color = "#6aff7f",
		txt1 = 136311,
		txt2 = 136316
	},
	{
		color = "#ffd940",
		txt1 = 136312,
		txt2 = 136317
	},
	{
		color = "#ff8a00",
		txt1 = 136313,
		txt2 = 136318
	},
	{
		color = "#ff4638",
		txt1 = 136314,
		txt2 = 136319
	}
}
local var_0_1 = colorQuality[0]
local var_0_2 = ccc3(204, 185, 134)
local var_0_3 = class("KoreaBattlePanel", function()
	return createBaseLayer()
end)

var_0_3.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			name = "panel",
			type = "sprite",
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 - 30,
			pic = {
				path = "res/ui/nation/renwudi.jpg"
			},
			children = {
				{
					y = 494,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/nation/buildNation/dongying/wcsj_title.png"
					}
				},
				{
					type = "sprite",
					name = "playerImg",
					x = 167,
					visible = false,
					y = 317,
					scale = 0.7,
					pic = {
						path = "res/ui/common/playerPic/player1.png"
					}
				},
				{
					type = "sprite",
					name = "smallMapMc",
					y = 280,
					visible = false,
					x = 167,
					pic = {
						path = "res/ui/nation/buildNation/dongying/yzgl_map_s.png"
					}
				},
				{
					y = 132,
					type = "sprite",
					x = 165,
					pic = {
						path = "res/ui/kfyz/kfyz_word_bg.png"
					},
					children = {
						{
							fontSize = 20,
							name = "playerNameLb",
							y = 32,
							type = "label",
							x = 138
						}
					}
				},
				{
					y = 92,
					type = "sprite",
					x = 165,
					pic = {
						path = "res/ui/kfyz/kfyz_word_bg.png"
					},
					children = {
						{
							fontSize = 20,
							name = "startLb",
							y = 32,
							type = "label",
							x = 138,
							textId = 136546,
							color = var_0_2
						}
					}
				},
				{
					fontSize = 20,
					name = "populationTipLb",
					y = 60,
					type = "label",
					x = 165,
					textId = 136315
				},
				{
					y = 190,
					name = "startBtn",
					h = 62,
					type = "button",
					w = 195,
					visible = false,
					x = 175,
					normal = {
						path = "res/ui/common/button/public_btn_red.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_red_c.png"
					},
					children = {
						{
							fontSize = 25,
							name = "startBtnLb",
							y = 34,
							type = "label",
							x = 97
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_population",
					h = 34,
					type = "button",
					w = 105,
					y = 424,
					x = 88,
					normal = {
						path = "res/ui/nation/gjrk_word_bg.png"
					},
					touched = {
						path = "res/ui/nation/gjrk_word_bg.png"
					},
					children = {
						{
							y = 24,
							x = 2,
							type = "sprite",
							pic = {
								path = "res/ui/nation/gjrk_icon.png"
							}
						},
						{
							fontSize = 22,
							name = "populationLb",
							y = 17,
							type = "label",
							x = 28,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					y = 415,
					name = "gongchengqianzuo_bg",
					type = "sprite",
					x = 358,
					pic = {
						path = "res/ui/nationTask/newPic/rwyh_icon01.png"
					},
					children = {
						{
							y = 60,
							type = "sprite",
							x = 45,
							anchorPoint = ccp(0, 1),
							pic = {
								path = "res/ui/nationTask/newPic/rwyh_small_bg.png"
							}
						},
						{
							y = -85,
							type = "sprite",
							x = 0,
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/nation/buildNation/mainTask/jgdy_view_d01.png"
							}
						},
						{
							fontSize = 20,
							name = "infoLb",
							y = 30,
							type = "label",
							x = 80,
							color = var_0_2,
							anchorPoint = ccp(0, 0.5)
						},
						{
							y = -85,
							name = "process_bg",
							type = "sprite",
							x = 75,
							anchorPoint = ccp(0, 0.5),
							pic = {
								frame = true,
								path = "guojiajingdudi1.png"
							}
						},
						{
							y = -85,
							name = "process_jingyan",
							type = "progressbar",
							x = 75,
							anchorPoint = ccp(0, 0.5),
							pic = {
								frame = true,
								path = "guojiajingdutiao1_3.png"
							}
						},
						{
							fontSize = 22,
							name = "expLb",
							y = -83,
							type = "label",
							x = 283
						},
						{
							y = -70,
							type = "sprite",
							x = 0,
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/nation/buildNation/mainTask/rwyh_icon04.png"
							}
						},
						{
							fontSize = 22,
							y = -50,
							type = "label",
							x = 75,
							textId = 91008,
							color = var_0_2,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					y = 190,
					name = "indiv_reward_bg",
					type = "sprite",
					x = 358,
					pic = {
						path = "res/ui/nationTask/newPic/rwyh_icon03.png"
					},
					children = {
						{
							name = "indivRewardBg",
							type = "sprite9",
							y = 60,
							x = -15,
							preferedSize = CCSizeMake(600, 200),
							middleRect = CCRectMake(200, 80, 189, 22),
							anchorPoint = ccp(0, 1),
							pic = {
								path = "res/ui/nationTask/newPic/rwyh_jl_bg.png"
							},
							children = {
								{
									fontSize = 22,
									name = "rankLb",
									y = 165,
									type = "label",
									x = 90,
									textId = 136572,
									color = var_0_2,
									anchorPoint = ccp(0, 0.5)
								},
								{
									y = 90,
									name = "noNationSp",
									type = "sprite",
									x = 300,
									pic = {
										path = "res/ui/nation/buildNation/dongying/sjwc_word_swgjsjsjwc.png"
									}
								},
								{
									type = "sprite",
									name = "picBgSp",
									y = 115,
									visible = false,
									x = 300,
									pic = {
										path = "res/ui/rankInfo/player_view_bg.png"
									},
									children = {
										{
											y = 50,
											name = "playerHead",
											type = "sprite",
											x = 50,
											pic = {
												path = "res/ui/common/playerHead/playerHead_icon_0.png"
											}
										},
										{
											y = -20,
											type = "sprite",
											x = 50,
											pic = {
												path = "res/ui/nation/buildNation/zhaoLing/zgzl_name_d.png"
											},
											children = {
												{
													fontSize = 22,
													name = "playerName",
													y = 21,
													type = "label",
													x = 91
												}
											}
										},
										{
											x = 50,
											name = "okBtn",
											h = 62,
											type = "button",
											w = 195,
											y = -22,
											visible = false,
											scale = 0.8,
											normal = {
												path = "res/ui/common/button/public_btn_orange.png"
											},
											touched = {
												path = "res/ui/common/button/public_btn_orange_c.png"
											},
											children = {
												{
													fontSize = 25,
													y = 34,
													type = "label",
													x = 97,
													textId = "220901_buildNation"
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

function var_0_3.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getJpsSignInfo)
end

function var_0_3.onZijian(arg_4_0)
	local function var_4_0(arg_5_0)
		arg_4_0:refresh()
	end

	cmgr.sendRequest(var_4_0, actions.zijian)
end

function var_0_3.createRankList(arg_6_0)
	local function var_6_0(arg_7_0, arg_7_1)
		log.info("cell touched at : ", arg_7_1:getIdx())
	end

	local function var_6_1(arg_8_0, arg_8_1)
		return 34, 500
	end

	local function var_6_2(arg_9_0, arg_9_1)
		local var_9_0 = arg_9_0:dequeueCell()

		if var_9_0 then
			var_9_0:removeAllChildrenWithCleanup(true)
		else
			var_9_0 = CCTableViewCell:new()
		end

		local var_9_1 = CCSprite:create(string.format("res/ui/nation/buildNation/dongying/sjwc_pm_list0%s.png", arg_9_1 % 2 + 1))

		var_9_1:setAnchorPoint(ccp(0, 0))
		var_9_1:setPosition(0, 0)
		var_9_0:addChild(var_9_1)

		for iter_9_0 = 1, 2 do
			local var_9_2 = 2 * arg_9_1 + iter_9_0
			local var_9_3 = arg_6_0.info.jpsList[var_9_2]

			if var_9_3 then
				local var_9_4 = var_9_2 == 1
				local var_9_5 = var_9_4 and "sjwc_word_ss.png" or "sjwc_number_di.png"
				local var_9_6 = CCSprite:create("res/ui/nation/buildNation/dongying/" .. var_9_5)

				var_9_6:setPosition(iter_9_0 == 1 and 40 or 290, 17)
				var_9_1:addChild(var_9_6)

				if not var_9_4 then
					local var_9_7 = CCLabelAtlas:create(var_9_2, "res/ui/common/number/scpm_word_digit.png", 21, 32, 48)

					var_9_7:setAnchorPoint(ccp(0.5, 0.5))
					var_9_7:setPosition(30.5, 18.5)
					var_9_6:addChild(var_9_7)
				end

				local var_9_8 = CCLabelTTF:create(string.format("%s %s", var_9_3.serverName, var_9_3.nationName), "Thonburi", 22)

				var_9_8:setColor(colorText[10003])
				var_9_8:setPosition(iter_9_0 == 1 and 160 or 410, 17)
				var_9_1:addChild(var_9_8)
			end
		end

		return var_9_0
	end

	local function var_6_3()
		local var_10_0 = arg_6_0.info.jpsList

		if var_10_0 and #var_10_0 > 0 then
			return math.ceil(#var_10_0 / 2)
		else
			return 0
		end
	end

	local var_6_4 = CCTableView:create(CCSizeMake(500, 130))

	var_6_4:setPosition(50, 16)
	var_6_4:setDirection(kCCScrollViewDirectionVertical)
	var_6_4:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_6_0.view.widgets.indivRewardBg:addChild(var_6_4)

	if arg_6_0.rankList then
		arg_6_0.rankList:removeFromParentAndCleanup(true)
	end

	arg_6_0.rankList = var_6_4

	var_6_4:registerScriptHandler(var_6_0, CCTableView.kTableCellTouched)
	var_6_4:registerScriptHandler(var_6_1, CCTableView.kTableCellSizeForIndex)
	var_6_4:registerScriptHandler(var_6_2, CCTableView.kTableCellSizeAtIndex)
	var_6_4:registerScriptHandler(var_6_3, CCTableView.kNumberOfCellsInTableView)
	var_6_4:reloadData()
end

function var_0_3.showPanel(arg_11_0, arg_11_1)
	if arg_11_1.population and arg_11_1.population > 4 then
		arg_11_1.population = 4
	end

	arg_11_0.info = arg_11_1

	local var_11_0 = user.jpsStages

	arg_11_0.view.widgets.populationLb:setString(language.get(var_0_0[arg_11_1.population].txt1))
	arg_11_0.view.widgets.populationLb:setColor(tool.hexToRgb(var_0_0[arg_11_1.population].color))

	local var_11_1 = user.kbLv == 3 and "res/ui/nation/buildNation/dongying/sjwc_word_swgjsjsjwc.png" or "res/ui/nation/buildNation/dongying/wjwc_word_swgjsjwjwc.png"

	if user.kbLv == 5 then
		var_11_1 = "res/ui/nation/buildNation/dongying/ljwc_word_swgjsjljwc.png"
	elseif user.kbLv == 6 then
		var_11_1 = "res/ui/nation/buildNation/dongying/qjwc_word_swgjsjjjwc.png"
	end

	arg_11_0.view.widgets.noNationSp:setDisplayFrame(CCSprite:create(var_11_1):displayFrame())

	local var_11_2 = user.kbLv == 3 and "res/ui/nation/buildNation/dongying/yzgl_map_s.png" or "res/ui/nation/buildNation/dongying/wjwc_map_jiaozhi.png"

	if user.kbLv == 5 then
		var_11_2 = "res/ui/nation/buildNation/dongying/yzlq_map_s.png"
	elseif user.kbLv == 6 then
		var_11_2 = "res/ui/nation/buildNation/dongying/qjwc_map_s.png"
	end

	arg_11_0.view.widgets.smallMapMc:setDisplayFrame(CCSprite:create(var_11_2):displayFrame())

	if not arg_11_0.view.widgets.node_process then
		local var_11_3 = CCNode:create()

		arg_11_0.view.widgets.gongchengqianzuo_bg:addChild(var_11_3, 100)

		arg_11_0.view.widgets.node_process = var_11_3

		local var_11_4 = user.kbLv == 3 and {
			"222493_dongying",
			136552,
			136553,
			136554
		} or {
			136803,
			136804,
			136805
		}

		if user.kbLv == 5 then
			var_11_4 = {
				136851,
				136852,
				136853
			}
		elseif user.kbLv == 6 then
			var_11_4 = {
				218100,
				218101,
				218102
			}
		end

		local var_11_5 = #var_11_0
		local var_11_6 = {}
		local var_11_7 = var_11_0[var_11_5]

		for iter_11_0, iter_11_1 in ipairs(var_11_0) do
			local var_11_8 = 75 + iter_11_1 / var_11_7 * 460

			table.insert(var_11_6, var_11_8)

			if iter_11_0 ~= var_11_5 then
				local var_11_9 = CCSprite:create("res/ui/nation/buildNation/dongying/sjwc_pb_line.png")

				var_11_9:setPosition(var_11_8, -85)
				var_11_3:addChild(var_11_9)
			end

			local var_11_10 = CCStrokeLabelTTF:create(language.get(var_11_4[iter_11_0]), "Thonburi", 18)

			var_11_10:setPosition(var_11_8, -110)
			var_11_10:setColor(iter_11_1 <= arg_11_1.forceExp and var_0_2 or var_0_1)
			var_11_3:addChild(var_11_10)
		end

		arg_11_0.view.widgets.expLb:setPositionX((var_11_6[2] + var_11_6[3]) / 2)
		arg_11_0.view.widgets.process_jingyan:setPercentage(100 * arg_11_1.forceExp / var_11_7)
		arg_11_0.view.widgets.expLb:setString(arg_11_1.forceExp .. "/" .. var_11_7)
	end

	arg_11_0.view.widgets.okBtn:setVisible(false)
	arg_11_0.view.widgets.playerNameLb:setString(language.get(226050, user.forceIdToName[user.player.forceId], arg_11_1.kingName))
	arg_11_0.view.widgets.playerNameLb:setColor(colorForce[user.player.forceId])
	arg_11_0.view.widgets.playerImg:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerPic/player%d.png", arg_11_1.kingPic)):displayFrame())

	if user.kbLv == 3 then
		arg_11_0.view.widgets.startBtnLb:setString(language.get(user.jpsWin > 0 and 136571 or "222402_dongying"))
	elseif user.kbLv == 4 then
		arg_11_0.view.widgets.expLb:setPositionX(280)
		arg_11_0.view.widgets.startBtnLb:setString(language.get(136803))
	elseif user.kbLv == 5 then
		arg_11_0.view.widgets.expLb:setPositionX(280)
		arg_11_0.view.widgets.startBtnLb:setString(language.get(136849))
	elseif user.kbLv == 6 then
		arg_11_0.view.widgets.expLb:setPositionX(280)
		arg_11_0.view.widgets.startBtnLb:setString(language.get(218003))
	end

	if arg_11_1.forceExp == var_11_0[#var_11_0] then
		arg_11_0.view.widgets.rankLb:setString(language.get("222411_dongying"))
		arg_11_0.view.widgets.picBgSp:setVisible(true)
		arg_11_0.view.widgets.noNationSp:setVisible(false)

		arg_11_1.players = arg_11_1.players or {}

		if user.kbLv == 3 then
			arg_11_0.view.widgets.infoLb:setString(language.get(#arg_11_1.players > 0 and 136560 or 136559))
			arg_11_0.view.widgets.startLb:setString(language.get(136561))
		elseif user.kbLv == 4 then
			arg_11_0.view.widgets.playerHead:setDisplayFrame(CCSprite:create("res/ui/nation/bazhrnbao.jpg"):displayFrame())
			arg_11_0.view.widgets.infoLb:setString(language.get(#arg_11_1.players > 0 and 136814 or 136813))
			arg_11_0.view.widgets.startLb:setString(language.get(136809))
		elseif user.kbLv == 5 then
			arg_11_0.view.widgets.playerHead:setDisplayFrame(CCSprite:create("res/ui/nation/ljwc_icon_9_2zb.jpg"):displayFrame())
			arg_11_0.view.widgets.infoLb:setString(language.get(#arg_11_1.players > 0 and 136860 or 136859))
			arg_11_0.view.widgets.startLb:setString(language.get(136848))
		elseif user.kbLv == 6 then
			arg_11_0.view.widgets.playerHead:setDisplayFrame(CCSprite:create("res/ui/nation/qjwc_icon_9_3zb.jpg"):displayFrame())
			arg_11_0.view.widgets.infoLb:setString(language.get(#arg_11_1.players > 0 and 218116 or 218115))
			arg_11_0.view.widgets.startLb:setString(language.get(218107))
		end

		if #arg_11_1.players > 0 then
			arg_11_0.view.widgets.playerHead:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerHead/playerHead_icon_%s.png", arg_11_1.players[1].pic)):displayFrame())
			arg_11_0.view.widgets.playerName:setString(arg_11_1.players[1].playerName)
		end

		arg_11_0.view.widgets.okBtn:setVisible(arg_11_1.functionOpen == true and arg_11_1.hasSign ~= true and #arg_11_1.players == 0)
	else
		if user.kbLv == 3 then
			if var_11_0[1] and arg_11_1.forceExp < var_11_0[1] then
				arg_11_0.view.widgets.infoLb:setString(language.get(136555))
			elseif var_11_0[2] and arg_11_1.forceExp < var_11_0[2] then
				arg_11_0.view.widgets.infoLb:setString(language.get(136556))
			elseif var_11_0[3] and arg_11_1.forceExp < var_11_0[3] then
				arg_11_0.view.widgets.infoLb:setString(language.get(136557))
			elseif var_11_0[4] and arg_11_1.forceExp < var_11_0[4] then
				arg_11_0.view.widgets.infoLb:setString(language.get(136558))
			end

			if arg_11_1.forceExp == var_11_0[1] and user.jpsWin == 0 then
				arg_11_0.view.widgets.startLb:setString(language.get("222401_dongying"))
				arg_11_0.view.widgets.infoLb:setString(language.get(136555))
			elseif arg_11_1.forceExp == var_11_0[2] and user.jpsWin == 1 then
				arg_11_0.view.widgets.startLb:setString(language.get("222401_dongying"))
				arg_11_0.view.widgets.infoLb:setString(language.get(136556))
			elseif arg_11_1.forceExp == var_11_0[3] and user.jpsWin == 2 then
				arg_11_0.view.widgets.startLb:setString(language.get("222401_dongying"))
				arg_11_0.view.widgets.infoLb:setString(language.get(136557))
			end
		elseif user.kbLv == 4 then
			if arg_11_1.forceExp <= var_11_0[1] and user.jpsWin == 0 then
				arg_11_0.view.widgets.startLb:setString(language.get("222401_dongying"))
				arg_11_0.view.widgets.infoLb:setString(language.get(136810))
			elseif arg_11_1.forceExp <= var_11_0[2] and user.jpsWin == 1 then
				arg_11_0.view.widgets.startLb:setString(language.get("222401_dongying"))
				arg_11_0.view.widgets.infoLb:setString(language.get(136811))
			elseif arg_11_1.forceExp <= var_11_0[3] and user.jpsWin == 2 then
				arg_11_0.view.widgets.startLb:setString(language.get("222401_dongying"))
				arg_11_0.view.widgets.infoLb:setString(language.get(136812))
			end
		elseif user.kbLv == 5 then
			if arg_11_1.forceExp <= var_11_0[1] and user.jpsWin == 0 then
				arg_11_0.view.widgets.startLb:setString(language.get("222401_dongying"))
				arg_11_0.view.widgets.infoLb:setString(language.get(136854))
			elseif arg_11_1.forceExp <= var_11_0[2] and user.jpsWin == 1 then
				arg_11_0.view.widgets.startLb:setString(language.get("222401_dongying"))
				arg_11_0.view.widgets.infoLb:setString(language.get(136855))
			elseif arg_11_1.forceExp <= var_11_0[3] and user.jpsWin == 2 then
				arg_11_0.view.widgets.startLb:setString(language.get("222401_dongying"))
				arg_11_0.view.widgets.infoLb:setString(language.get(136856))
			end
		elseif user.kbLv == 6 then
			if arg_11_1.forceExp <= var_11_0[1] and user.jpsWin == 0 then
				arg_11_0.view.widgets.startLb:setString(language.get("222401_dongying"))
				arg_11_0.view.widgets.infoLb:setString(language.get(218108))
			elseif arg_11_1.forceExp <= var_11_0[2] and user.jpsWin == 1 then
				arg_11_0.view.widgets.startLb:setString(language.get("222401_dongying"))
				arg_11_0.view.widgets.infoLb:setString(language.get(218109))
			elseif arg_11_1.forceExp <= var_11_0[3] and user.jpsWin == 2 then
				arg_11_0.view.widgets.startLb:setString(language.get("222401_dongying"))
				arg_11_0.view.widgets.infoLb:setString(language.get(218110))
			end
		elseif user.kbLv == 7 then
			arg_11_0.view.widgets.startLb:setString(language.get(136820))
			arg_11_0.view.widgets.infoLb:setString(language.get(218107))
			arg_11_0.view.widgets.expLb:setString("")
		end

		arg_11_0.view.widgets.rankLb:setString(language.get(136572))
		arg_11_0.view.widgets.picBgSp:setVisible(false)

		arg_11_1.jpsList = arg_11_1.jpsList or {}

		if #arg_11_1.jpsList > 0 then
			arg_11_0:createRankList()
		end

		arg_11_0.view.widgets.noNationSp:setVisible(#arg_11_1.jpsList == 0)
	end

	if user.kbLv == 7 then
		arg_11_0.view.widgets.process_jingyan:setPercentage(100)
		arg_11_0.view.widgets.startLb:setString(language.get(136820))
		arg_11_0.view.widgets.infoLb:setString(language.get(218107))
		arg_11_0.view.widgets.expLb:setString("")
	end

	local var_11_11 = user.jpsWin

	if arg_11_1.leftTime and arg_11_1.leftTime > 0 then
		arg_11_0.view.widgets.playerImg:setVisible(false)
		arg_11_0.view.widgets.startBtn:setVisible(false)
		arg_11_0.view.widgets.smallMapMc:setVisible(true)

		if user.kbLv == 3 then
			arg_11_0.view.widgets.infoLb:setString(language.get(136562))
			arg_11_0.view.widgets.startLb:setString(language.get(136563))
		elseif user.kbLv == 4 then
			arg_11_0.view.widgets.infoLb:setString(language.get(136808))
			arg_11_0.view.widgets.startLb:setString(language.get(136807))
		elseif user.kbLv == 5 then
			arg_11_0.view.widgets.infoLb:setString(language.get(136857))
			arg_11_0.view.widgets.startLb:setString(language.get(136858))
		elseif user.kbLv == 6 then
			arg_11_0.view.widgets.infoLb:setString(language.get(218113))
			arg_11_0.view.widgets.startLb:setString(language.get(218114))
		end

		arg_11_0.view.widgets.startLb:removeChildByTag(1001, true)

		local var_11_12 = createTimerLabel(arg_11_1.leftTime, "@H:@M:@S", "Thonburi", 22, nil, nil, nil, ccc3(255, 0, 0))

		arg_11_0.view.widgets.startLb:addChild(var_11_12, 0, 1001)

		local var_11_13 = arg_11_0.view.widgets.startLb:getContentSize()

		var_11_12:setPosition(var_11_13.width + 50, var_11_13.height / 2)
	else
		if var_11_11 == 0 and arg_11_1.forceExp == var_11_0[1] or var_11_11 == 1 and arg_11_1.forceExp == var_11_0[2] or var_11_11 == 2 and arg_11_1.forceExp == var_11_0[3] or var_11_11 == 3 and arg_11_1.forceExp == var_11_0[4] then
			arg_11_0.view.widgets.startBtn:setVisible(true)
		else
			arg_11_0.view.widgets.startBtn:setVisible(false)
		end

		arg_11_0.view.widgets.playerImg:setVisible(true)
		arg_11_0.view.widgets.smallMapMc:setVisible(false)
	end
end

function var_0_3.ctor(arg_12_0, arg_12_1)
	log.info("@@ 高丽诏令")

	arg_12_0.view = {}

	uiutil.initWidgets(arg_12_0.view, arg_12_0.layout)

	if arg_12_1 then
		arg_12_0:addChild(arg_12_0.view.widgets.root)
		arg_12_1:addChild(arg_12_0)
	end

	arg_12_0.view.widgets.btn_population:addHandleOfControlEvent(function()
		arg_12_0:showTipPopulation()
	end, CCControlEventTouchUpInside)
	arg_12_0.view.widgets.okBtn:addHandleOfControlEvent(function()
		arg_12_0:onZijian()
	end, CCControlEventTouchUpInside)
	arg_12_0.view.widgets.startBtn:addHandleOfControlEvent(function()
		local var_15_0 = smgr.getLayer("topLayer")

		var_15_0:removeAllChildrenWithCleanup(true)
		require("lua/layer/kfyz/YuyueLayer").new(var_15_0)
	end, CCControlEventTouchUpInside)
	arg_12_0:refresh()
end

function var_0_3.showTipPopulation(arg_16_0)
	log.info("should show tips ")

	local var_16_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_16_0:registerScriptTouchHandler(function(arg_17_0, arg_17_1, arg_17_2)
		if arg_17_0 == CCTOUCHBEGAN then
			return true
		elseif arg_17_0 == CCTOUCHMOVED then
			return true
		elseif arg_17_0 == CCTOUCHENDED then
			pcall(var_16_0.removeFromParentAndCleanup, var_16_0, true)

			return true
		end
	end, false, true)
	var_16_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_16_0, 60000)

	local function var_16_1()
		return {
			tipsBg = {
				anchorPointX = 0,
				name = "tipsBg",
				z = 300,
				type = "pic_9_tips",
				pic = "frame:common_tip_frame_small.png",
				anchorPointY = 1,
				middleRect = CCRectMake(0, 0, 0, 0),
				preferedSize = CCSizeMake(290, 300),
				x = visibleSize.width - 100,
				y = visibleSize.height * 0.5,
				content = {
					{
						fontSize = 22,
						type = "label",
						text = language.get(var_0_0[arg_16_0.info.population].txt2),
						align = kCCTextAlignmentLeft,
						color = tool.hexToRgb(var_0_0[arg_16_0.info.population].color)
					},
					{
						fontSize = 22,
						type = "label",
						text = language.get(136320),
						align = kCCTextAlignmentLeft
					}
				}
			}
		}
	end

	local var_16_2 = {}
	local var_16_3 = autoUI.initUI(var_16_0, var_16_1())
	local var_16_4, var_16_5 = tool.getPositionInScreen(arg_16_0.view.widgets.btn_population)

	var_16_3.tipsBg:setPosition(var_16_4 - 50, var_16_5 - 16)
end

return var_0_3
