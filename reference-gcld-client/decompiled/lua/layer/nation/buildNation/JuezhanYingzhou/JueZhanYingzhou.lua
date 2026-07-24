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
local var_0_1 = class("JuezhanYingzhou", function()
	return createBaseLayer()
end)

var_0_1.layout = {}

local var_0_2 = {}

if conf.language == "vie" then
	var_0_2.daojishi_name = 42
	var_0_2.labelX = 42
	var_0_2.labelY = -10
end

var_0_1.layout.bg = {
	xcenter = 0,
	name = "bg",
	type = "pic_9",
	ycenter = -28,
	pic = "frame:bigPanel.png",
	middleRect = CCRectMake(30, 30, 45, 45),
	preferedSize = CCSizeMake(960, 580),
	children = {
		{
			xcenter = 0,
			type = "pic",
			ycenter = 0,
			pic = "res/ui/nation/renwudi.jpg",
			children = {
				{
					xcenter = 0,
					name = "dongying_title",
					type = "pic",
					top = 21,
					pic = "res/ui/nation/buildNation/dongying/wcsj_title.png"
				},
				{
					x = 165,
					name = "daojishi",
					y = 92,
					type = "pic",
					pic = "res/ui/kfyz/kfyz_word_bg.png",
					children = {
						{
							xcenter = -130,
							name = "daojishiIcon",
							type = "pic",
							ycenter = 0,
							pic = "res/ui/general/jailView/icon_clock.png"
						},
						{
							name = "daojishi_name",
							fontSize = 20,
							type = "label",
							ycenter = 3,
							text = language.get("222401_dongying"),
							color = ccc3(204, 185, 134),
							xcenter = 0 + (var_0_2.daojishi_name or 0)
						}
					}
				},
				{
					fontSize = 20,
					height = 0,
					type = "label",
					width = 330,
					text = language.get(136315),
					x = 165 + (var_0_2.labelX or 0),
					y = 60 + (var_0_2.labelY or 0)
				},
				{
					type = "button",
					buttons = {
						{
							pic2 = "res/ui/common/button/public_btn_red_c.png",
							name = "btn_goDongying",
							pic1 = "res/ui/common/button/public_btn_red.png",
							y = 160,
							x = 170,
							children = {
								{
									fontSize = 20,
									y = 33,
									type = "label",
									x = 97.5,
									text = language.get("222402_dongying"),
									color = ccc3(204, 185, 134)
								}
							}
						}
					}
				},
				{
					x = 167,
					name = "taskMap",
					y = 317,
					type = "pic",
					pic = "res/ui/common/halfPic/halfPic_caocao2.png"
				},
				{
					type = "button",
					buttons = {
						{
							pic2 = "res/ui/nation/gjrk_word_bg.png",
							name = "btn_population",
							pic1 = "res/ui/nation/gjrk_word_bg.png",
							y = 424,
							x = 88,
							children = {
								{
									x = 2,
									y = 24,
									pic = "res/ui/nation/gjrk_icon.png",
									type = "pic"
								}
							}
						}
					}
				},
				{
					fontSize = 22,
					name = "population",
					y = 424,
					type = "label",
					anchorPointX = 0,
					x = 63.5
				},
				{
					x = 358,
					name = "gongchengqianzuo_bg",
					y = 415,
					type = "pic",
					pic = "res/ui/nationTask/newPic/rwyh_icon01.png",
					children = {
						{
							anchorPointX = 0,
							x = 45,
							y = 60,
							type = "pic",
							anchorPointY = 1,
							pic = "res/ui/nationTask/newPic/rwyh_small_bg.png"
						},
						{
							x = 0,
							anchorPointX = 0,
							y = -85,
							type = "pic",
							scale = 1,
							pic = "res/ui/nation/buildNation/mainTask/jgdy_view_d01.png"
						},
						{
							fontSize = 22,
							name = "info_prefix",
							stroke = false,
							anchorPointX = 0,
							type = "label",
							y = 30,
							x = 75,
							text = language.get("222403_dongying"),
							color = ccc3(204, 185, 134)
						},
						{
							fontSize = 22,
							name = "info_suffix",
							stroke = false,
							anchorPointX = 0,
							type = "label",
							y = 30,
							x = 345,
							text = language.get("222404_dongying"),
							color = ccc3(255, 0, 0)
						},
						{
							anchorPointX = 0,
							name = "process_bg",
							x = 75,
							type = "pic",
							y = -85,
							pic = "frame:guojiajingdudi1.png"
						},
						{
							anchorPointX = 0,
							name = "process_jingyan",
							x = 75,
							type = "process",
							y = -85,
							percentage = 100,
							pic = "frame:guojiajingdutiao1_3.png"
						},
						{
							fontSize = 22,
							name = "num_jingyan",
							text = "0/0",
							type = "label",
							y = -85,
							x = 300
						},
						{
							x = 75,
							y = -85,
							pic = "res/ui/nation/buildNation/dongying/sjwc_pb_line.png",
							type = "pic"
						},
						{
							x = 228,
							y = -85,
							pic = "res/ui/nation/buildNation/dongying/sjwc_pb_line.png",
							type = "pic"
						},
						{
							x = 381,
							y = -85,
							pic = "res/ui/nation/buildNation/dongying/sjwc_pb_line.png",
							type = "pic"
						},
						{
							x = 534,
							y = -85,
							pic = "res/ui/nation/buildNation/dongying/sjwc_pb_line.png",
							type = "pic"
						},
						{
							fontSize = 18,
							name = "chuzhandongying_word",
							type = "label",
							y = -110,
							x = 228,
							text = language.get("222404_dongying"),
							color = ccc3(204, 185, 134)
						},
						{
							fontSize = 18,
							name = "zaizhandongying_word",
							type = "label",
							y = -110,
							x = 381,
							text = language.get("222405_dongying"),
							color = ccc3(204, 185, 134)
						},
						{
							fontSize = 18,
							name = "juezhandongying_word",
							type = "label",
							y = -110,
							x = 534,
							text = language.get("222406_dongying"),
							color = ccc3(204, 185, 134)
						},
						{
							x = 0,
							anchorPointX = 0,
							y = -70,
							type = "pic",
							pic = "res/ui/nation/buildNation/mainTask/rwyh_icon04.png"
						},
						{
							name = "gongxian",
							anchorPointX = 0,
							type = "label",
							fontSize = 22,
							x = 75,
							y = -50,
							text = language.get(91008),
							color = ccc3(204, 185, 134)
						}
					}
				},
				{
					x = 358,
					name = "indiv_reward_bg",
					y = 190,
					type = "pic",
					pic = "res/ui/nationTask/newPic/rwyh_icon03.png",
					children = {
						{
							anchorPointX = 0,
							name = "indivRewardBg",
							type = "pic_9",
							pic = "res/ui/nationTask/newPic/rwyh_jl_bg.png",
							y = 60,
							anchorPointY = 1,
							x = -15,
							middleRect = CCRectMake(0, 20, 589, 112),
							preferedSize = CCSizeMake(600, 200),
							children = {
								{
									name = "qiansanming",
									anchorPointX = 0,
									type = "label",
									fontSize = 22,
									y = 165,
									x = 90,
									text = language.get("222505_dongying")
								},
								{
									anchorPointX = 0,
									name = "diwangying",
									x = 295,
									type = "pic",
									y = 165,
									pic = "res/ui/nation/buildNation/dongying/sjwc_jmxz.png"
								},
								{
									anchorPointX = 0,
									name = "qizi",
									x = 335,
									type = "pic",
									y = 165,
									pic = "res/ui/nation/buildNation/dongying/sjwc_icon_qz.png"
								},
								{
									xcenter = 0,
									name = "noSanjiwangchao",
									type = "pic",
									ycenter = -10,
									pic = "res/ui/nation/buildNation/dongying/sjwc_word_swgjkqsjwc.png"
								},
								{
									xcenter = 0,
									name = "left",
									visible = false,
									type = "pic",
									ycenter = 15,
									pic = "res/ui/rankInfo/player_view_bg.png",
									children = {
										{
											xcenter = 0,
											name = "centerHead_1",
											type = "pic",
											ycenter = 0,
											pic = "res/ui/common/playerHead/playerHead_icon_0.png"
										},
										{
											xcenter = 0,
											name = "down_1",
											type = "pic",
											ycenter = -70,
											pic = "res/ui/nation/buildNation/zhaoLing/zgzl_name_d.png",
											children = {
												{
													fontSize = 22,
													font = "Thonburi-Bold",
													name = "playerName_1",
													type = "label",
													ycenter = 0,
													xcenter = 0,
													text = ""
												}
											}
										},
										{
											type = "button",
											buttons = {
												{
													pic2 = "res/ui/common/button/public_btn_orange_c.png",
													name = "zijian",
													pic1 = "res/ui/common/button/public_btn_orange.png",
													y = -22,
													scale = 0.8,
													visible = false,
													x = 50,
													children = {
														{
															fontSize = 22,
															y = 33,
															type = "label",
															x = 97.5,
															text = language.get("220901_buildNation"),
															color = ccc3(204, 185, 134)
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
	}
}

function var_0_1.ctor(arg_2_0, arg_2_1)
	arg_2_0.view = {}
	arg_2_0.view = autoUI.initUI(arg_2_0, arg_2_0.layout)

	if arg_2_1 then
		arg_2_1:addChild(arg_2_0)
	end

	local function var_2_0()
		local var_3_0 = smgr.getLayer("topLayer")

		var_3_0:removeAllChildrenWithCleanup(true)
		require("lua/layer/kfyz/YuyueLayer").new(var_3_0)
	end

	arg_2_0.view.btn_goDongying:registerScriptTapHandler(var_2_0)

	local var_2_1 = arg_2_0.view.btn_population:getSelectedImage()

	var_2_1:setColor(ccc3(255, 255, 0))
	var_2_1:setScaleY(1.1)
	arg_2_0.view.btn_population:registerScriptTapHandler(function()
		arg_2_0:showTipPopulation()
	end)

	local function var_2_2()
		local function var_5_0(arg_6_0)
			arg_2_0:refresh()
		end

		cmgr.sendRequest(var_5_0, actions.zijian)
	end

	arg_2_0.view.zijian:registerScriptTapHandler(var_2_2)
	arg_2_0:refresh()
end

function var_0_1.showTipPopulation(arg_7_0)
	log.info("should show tips ")

	local var_7_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_7_0:registerScriptTouchHandler(function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == CCTOUCHBEGAN then
			return true
		elseif arg_8_0 == CCTOUCHMOVED then
			return true
		elseif arg_8_0 == CCTOUCHENDED then
			pcall(var_7_0.removeFromParentAndCleanup, var_7_0, true)

			return true
		end
	end, false, true)
	var_7_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_7_0, 60000)

	local function var_7_1()
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
						text = language.get(var_0_0[arg_7_0.data.population].txt2),
						align = kCCTextAlignmentLeft,
						color = tool.hexToRgb(var_0_0[arg_7_0.data.population].color)
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

	local var_7_2 = {}
	local var_7_3 = autoUI.initUI(var_7_0, var_7_1())
	local var_7_4, var_7_5 = tool.getPositionInScreen(arg_7_0.view.btn_population)

	var_7_3.tipsBg:setPosition(var_7_4 - 50, var_7_5 - 16)
end

function var_0_1.refresh(arg_10_0)
	local function var_10_0(arg_11_0)
		if arg_11_0.action.data then
			arg_10_0.data = arg_11_0.action.data

			if arg_10_0.data.population and arg_10_0.data.population > 4 then
				arg_10_0.data.population = 4
			end

			log.info("self.data.forceExp: ", arg_10_0.data.forceExp)

			if arg_10_0.data.leftTime and arg_10_0.data.leftTime > 0 then
				arg_10_0.view.info_prefix:setString(language.get("222414_dongying"))
				arg_10_0.view.info_suffix:setVisible(false)
				arg_10_0.view.daojishi_name:setString(language.get("222413_dongying"))
				arg_10_0.view.daojishi_name:removeChildByTag(1001, true)

				local var_11_0 = createTimerLabel(arg_10_0.data.leftTime, "@H:@M:@S", "Thonburi", 22, nil, nil, nil, ccc3(255, 0, 0))

				arg_10_0.view.daojishi_name:addChild(var_11_0, 0, 1001)
				var_11_0:setPosition(ccp(120, 1))
			else
				arg_10_0.view.daojishi_name:setString(language.get("222401_dongying"))

				if arg_10_0.data.forceExp > 100 then
					arg_10_0.view.daojishi_name:setString(language.get("222412_dongying"))
				end

				arg_10_0.view.daojishi_name:removeChildByTag(1001, true)
				arg_10_0.view.info_prefix:setString(language.get("222403_dongying"))
				arg_10_0.view.info_suffix:setVisible(true)

				if arg_10_0.data.forceExp <= 40 then
					arg_10_0.view.info_suffix:setString(language.get("222404_dongying"))
				elseif arg_10_0.data.forceExp <= 100 then
					arg_10_0.view.info_suffix:setString(language.get("222405_dongying"))
				elseif arg_10_0.data.forceExp <= 160 then
					arg_10_0.view.info_suffix:setString(language.get("222406_dongying"))
				else
					arg_10_0.view.info_suffix:setString(language.get("222406_dongying"))
				end

				if arg_10_0.data.forceExp == 40 and arg_10_0.data.signComplete == 1 then
					arg_10_0.view.info_suffix:setString(language.get("222405_dongying"))
				elseif arg_10_0.data.forceExp == 100 and arg_10_0.data.signComplete == 2 then
					arg_10_0.view.info_suffix:setString(language.get("222406_dongying"))
				end
			end

			if arg_10_0.data.forceExp < 40 then
				arg_10_0.view.chuzhandongying_word:setColor(ccc3(96, 96, 96))
				arg_10_0.view.zaizhandongying_word:setColor(ccc3(96, 96, 96))
				arg_10_0.view.juezhandongying_word:setColor(ccc3(96, 96, 96))
				arg_10_0.view.process_jingyan:setPercentage(arg_10_0.data.forceExp / 40 * 33)
			elseif arg_10_0.data.forceExp < 100 then
				arg_10_0.view.chuzhandongying_word:setColor(ccc3(204, 185, 134))
				arg_10_0.view.zaizhandongying_word:setColor(ccc3(96, 96, 96))
				arg_10_0.view.juezhandongying_word:setColor(ccc3(96, 96, 96))
				arg_10_0.view.process_jingyan:setPercentage(33 + (arg_10_0.data.forceExp - 40) / 60 * 33)
			elseif arg_10_0.data.forceExp < 160 then
				arg_10_0.view.chuzhandongying_word:setColor(ccc3(204, 185, 134))
				arg_10_0.view.zaizhandongying_word:setColor(ccc3(204, 185, 134))
				arg_10_0.view.juezhandongying_word:setColor(ccc3(96, 96, 96))
				arg_10_0.view.process_jingyan:setPercentage(66 + (arg_10_0.data.forceExp - 100) / 60 * 33)
			else
				arg_10_0.view.chuzhandongying_word:setColor(ccc3(204, 185, 134))
				arg_10_0.view.zaizhandongying_word:setColor(ccc3(204, 185, 134))
				arg_10_0.view.juezhandongying_word:setColor(ccc3(204, 185, 134))
				arg_10_0.view.process_jingyan:setPercentage(100)
			end

			arg_10_0.view.num_jingyan:setString(arg_10_0.data.forceExp .. "/" .. 160)

			if arg_10_0.data.functionOpen ~= nil then
				arg_10_0.view.info_prefix:setString(language.get("222410_dongying"))

				if arg_10_0.data.players then
					arg_10_0.view.info_prefix:setString(language.get("222513_dongying"))
					arg_10_0.view.centerHead_1:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerHead/playerHead_icon_%s.png", arg_10_0.data.players[1].pic)):displayFrame())
					arg_10_0.view.playerName_1:setString(arg_10_0.data.players[1].playerName)
				end

				arg_10_0.view.info_suffix:setVisible(false)
				arg_10_0.view.qiansanming:setString(language.get("222411_dongying"))
				arg_10_0.view.diwangying:setVisible(false)
				arg_10_0.view.qizi:setVisible(false)
				arg_10_0.view.noSanjiwangchao:setVisible(false)
				arg_10_0.view.left:setVisible(true)

				if arg_10_0.data.functionOpen and arg_10_0.data.hasSign ~= true and (arg_10_0.data.players == nil or #arg_10_0.data.players == 0) then
					arg_10_0.view.zijian:setVisible(true)
				else
					arg_10_0.view.zijian:setVisible(false)
				end
			else
				arg_10_0.view.qiansanming:setString(language.get("222505_dongying"))
				arg_10_0.view.diwangying:setVisible(true)
				arg_10_0.view.qizi:setVisible(true)

				if arg_10_0.data.jpsList == nil or #arg_10_0.data.jpsList == 0 then
					arg_10_0.view.noSanjiwangchao:setVisible(true)
				else
					arg_10_0.view.noSanjiwangchao:setVisible(false)

					if arg_10_0.view.rankListTableView then
						pcall(arg_10_0.view.rankListTableView.removeFromParentAndCleanup, arg_10_0.view.rankListTableView, true)
					end

					if arg_10_0.data.jpsList then
						local var_11_1 = {}
						local var_11_2 = math.floor(#arg_10_0.data.jpsList / 2)

						if #arg_10_0.data.jpsList % 2 == 1 then
							var_11_2 = var_11_2 + 1
						end

						for iter_11_0 = 1, var_11_2 do
							var_11_1[iter_11_0] = {}
							var_11_1[iter_11_0].index = iter_11_0
							var_11_1[iter_11_0].txt1 = arg_10_0.data.jpsList[iter_11_0 * 2 - 1].serverName .. language.get(141014) .. " " .. arg_10_0.data.jpsList[iter_11_0 * 2 - 1].nationName

							if arg_10_0.data.jpsList[iter_11_0 * 2] then
								var_11_1[iter_11_0].txt2 = arg_10_0.data.jpsList[iter_11_0 * 2].serverName .. language.get(141014) .. " " .. arg_10_0.data.jpsList[iter_11_0 * 2].nationName
							end
						end

						arg_10_0.view.rankListTableView = arg_10_0:createRankListTableView(var_11_1)

						arg_10_0.view.rankListTableView:setPosition(50, 16)
						arg_10_0.view.indivRewardBg:addChild(arg_10_0.view.rankListTableView)
					end
				end

				arg_10_0.view.left:setVisible(false)
				arg_10_0.view.zijian:setVisible(false)
			end

			arg_10_0.view.population:setString(language.get(var_0_0[arg_10_0.data.population].txt1))
			arg_10_0.view.population:setColor(tool.hexToRgb(var_0_0[arg_10_0.data.population].color))
		end

		arg_10_0.view.diwangying:setPositionX(arg_10_0.view.qiansanming:getPositionX() + arg_10_0.view.qiansanming:getContentSize().width + 10)
		arg_10_0.view.qizi:setPositionX(arg_10_0.view.diwangying:getPositionX() + arg_10_0.view.diwangying:getContentSize().width + 10)
		arg_10_0.view.info_suffix:setPositionX(arg_10_0.view.info_prefix:getPositionX() + arg_10_0.view.info_prefix:getContentSize().width)
	end

	cmgr.sendRequest(var_10_0, actions.getJpsSignInfo)
end

function var_0_1.getRankListInfoCellData(arg_12_0, arg_12_1)
	return {
		height = 34,
		type = "layer_color",
		width = 485,
		color = ccc4(0, 0, 128, 0),
		children = {
			{
				y = 17,
				x = 40,
				type = "pic",
				pic = arg_12_1.index ~= 1 and "res/ui/nation/buildNation/dongying/sjwc_number_di.png" or "res/ui/nation/buildNation/dongying/sjwc_word_ss.png",
				children = {
					{
						xcenter = 0,
						height = 32,
						z = 500,
						type = "atlas",
						ycenter = 0,
						pic = "res/ui/common/number/scpm_word_digit.png",
						startChar = 48,
						width = 21,
						text = 2 * arg_12_1.index - 1,
						visible = arg_12_1.index ~= 1
					}
				}
			},
			{
				fontSize = 22,
				y = 17,
				type = "label",
				x = 160,
				text = arg_12_1.txt1 or "",
				color = colorText[10003]
			},
			{
				y = 17,
				x = 290,
				type = "pic",
				pic = "res/ui/nation/buildNation/dongying/sjwc_number_di.png",
				children = {
					{
						xcenter = 0,
						height = 32,
						z = 500,
						type = "atlas",
						ycenter = 0,
						pic = "res/ui/common/number/scpm_word_digit.png",
						startChar = 48,
						width = 21,
						text = 2 * arg_12_1.index
					}
				}
			},
			{
				fontSize = 22,
				y = 17,
				type = "label",
				x = 410,
				text = arg_12_1.txt2 or "",
				color = colorText[10003]
			}
		}
	}
end

function var_0_1.createRankListTableView(arg_13_0, arg_13_1)
	local var_13_0 = CCTableView:create(CCSizeMake(500, 130))

	var_13_0:setDirection(kCCScrollViewDirectionVertical)
	var_13_0:setVerticalFillOrder(kCCTableViewFillTopDown)

	local function var_13_1(arg_14_0, arg_14_1)
		return
	end

	local function var_13_2(arg_15_0, arg_15_1)
		return
	end

	local function var_13_3(arg_16_0, arg_16_1)
		return
	end

	local function var_13_4(arg_17_0, arg_17_1)
		return 34, 500
	end

	local function var_13_5(arg_18_0, arg_18_1)
		local var_18_0 = arg_13_1[arg_18_1 + 1]
		local var_18_1 = arg_18_0:dequeueCell()

		if var_18_1 then
			var_18_1:removeAllChildrenWithCleanup(true)
		else
			var_18_1 = CCTableViewCell:new()
		end

		local var_18_2 = CCSprite:create(string.format("res/ui/nation/buildNation/dongying/sjwc_pm_list0%s.png", arg_18_1 % 2 + 1))

		var_18_2:setAnchorPoint(CCPointMake(0, 0))
		var_18_2:setPosition(CCPointMake(0, 0))

		local var_18_3 = autoUI.createUI(var_18_2, arg_13_0:getRankListInfoCellData(var_18_0), nil)

		var_18_1:addChild(var_18_2)

		return var_18_1
	end

	local function var_13_6()
		if arg_13_1 then
			return #arg_13_1
		else
			return 0
		end
	end

	var_13_0:registerScriptHandler(var_13_1, CCTableView.kTableCellHighLight)
	var_13_0:registerScriptHandler(var_13_2, CCTableView.kTableCellUnhighLight)
	var_13_0:registerScriptHandler(var_13_3, CCTableView.kTableCellTouched)
	var_13_0:registerScriptHandler(var_13_4, CCTableView.kTableCellSizeForIndex)
	var_13_0:registerScriptHandler(var_13_5, CCTableView.kTableCellSizeAtIndex)
	var_13_0:registerScriptHandler(var_13_6, CCTableView.kNumberOfCellsInTableView)
	var_13_0:reloadData()

	return var_13_0
end

function var_0_1.onEnter(arg_20_0)
	return
end

function var_0_1.onExit(arg_21_0)
	return
end

return var_0_1
