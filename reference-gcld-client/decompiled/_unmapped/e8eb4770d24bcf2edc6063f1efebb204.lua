local var_0_0 = {}
local var_0_1 = {}
local var_0_2 = require("res/native/offset").get("layer.resource.blacksmith")
local var_0_3 = colorQuality
local var_0_4 = {
	[0] = var_0_3[0],
	var_0_3[1],
	var_0_3[3],
	var_0_3[4],
	var_0_3[5],
	var_0_3[6]
}

local function var_0_5()
	local var_1_0 = {
		458,
		279,
		637,
		100,
		816
	}
	local var_1_1 = {
		language.get(75018),
		language.get(75053),
		language.get(75053),
		language.get(75065),
		""
	}
	local var_1_2 = {
		y = 0,
		x = 0,
		type = "pic",
		pic = "",
		children = {}
	}

	for iter_1_0 = 1, 5 do
		local var_1_3 = {
			y = 0,
			type = "pic",
			pic = "",
			x = var_1_0[iter_1_0],
			children = {
				{
					x = 0,
					y = 220,
					type = "pic",
					pic = "res/ui/resource/blacksmith/new/tjp_samll_bg2.png",
					name = "card_bg" .. iter_1_0
				},
				{
					x = 0,
					y = 293,
					type = "pic",
					pic = "res/ui/resource/blacksmith/new/tjp_weikaiqi.png",
					name = "notOpen" .. iter_1_0,
					children = {
						{
							x = 26,
							y = -52,
							type = "pic",
							pic = "res/ui/resource/blacksmith/new/tjp_word_jtjp_0" .. iter_1_0 .. ".png"
						},
						{
							x = 87,
							y = -74,
							pic = "res/ui/resource/blacksmith/new/tjp_word_jtjp.png",
							type = "pic"
						}
					}
				},
				{
					x = 0,
					y = 0,
					type = "pic",
					visible = false,
					pic = "",
					name = "smith_node" .. iter_1_0,
					children = {
						{
							x = 0,
							y = 0,
							type = "pic",
							visible = false,
							pic = "",
							name = "steel_node" .. iter_1_0,
							children = {
								{
									y = 389,
									x = 0,
									type = "pic",
									pic = "res/ui/resource/blacksmith/new/tjpcblg_name_d.jpg",
									children = {
										{
											y = 21,
											x = 25,
											scale = 0.4,
											type = "pic",
											pic = "res/ui/playerInfo/role_nation_view.png"
										},
										{
											x = 25,
											y = 21,
											type = "pic",
											pic = "res/ui/resource/blacksmith/new/tjpcblg_word_q.png",
											name = "icon_type" .. iter_1_0
										}
									}
								},
								{
									x = 2,
									y = 275,
									type = "pic",
									pic = "res/ui/resource/blacksmith/new/tjpcblg_qj_d.jpg",
									name = "bg_npc" .. iter_1_0
								}
							}
						},
						{
							x = 64,
							y = 388,
							type = "pic",
							pic = "res/ui/warlock/warlock_btn_sj_lig.png",
							name = "light" .. iter_1_0
						},
						{
							type = "button",
							buttons = {
								{
									pic2 = "res/ui/warlock/warlock_btn_sj_c.png",
									pic1 = "res/ui/warlock/warlock_btn_sj_a.png",
									y = 390,
									x = 0,
									name = "btn_upSmith" .. iter_1_0,
									callBack = function()
										blacksmithUI.handleUpgradeSmithButtonTap(iter_1_0)
									end
								}
							}
						},
						{
							y = 388,
							x = 0,
							type = "pic",
							pic = "res/ui/resource/blacksmith/new/tjp_name_0" .. iter_1_0 .. ".png",
							scale = 1 * (var_0_2.nameScale or 1)
						},
						{
							x = 0,
							y = 275,
							type = "pic",
							name = "pic_smith" .. iter_1_0,
							pic = "res/ui/resource/blacksmith/new/ironsmith_0" .. iter_1_0 .. ".png"
						},
						{
							y = 330,
							x = -60,
							scale = 0.8,
							type = "pic",
							pic = "res/ui/resource/blacksmith/new/p-hong.png"
						},
						{
							type = "label",
							strokeSize = 2,
							text = "",
							font = "Thonburi-Bold",
							y = 330,
							x = -60,
							name = "txt_lv" .. iter_1_0,
							fontSize = 20 + (var_0_2.starFntSize or 0),
							strokeColor = colorText[10005],
							align = kCCTextAlignmentCenter
						}
					}
				},
				{
					x = 0,
					y = 0,
					type = "pic",
					visible = false,
					pic = "",
					name = "btn_node" .. iter_1_0,
					children = {
						{
							type = "button",
							buttons = {
								{
									pic2 = "frame:btn4_gre_c.png",
									pic3 = "frame:btn4_gre_g.png",
									pic1 = "frame:btn4_gre_a.png",
									y = 98,
									x = 0,
									name = "btn_dissolve" .. iter_1_0,
									callBack = function()
										blacksmithUI.handleDissolveButtonTap(iter_1_0)
									end
								},
								{
									pic2 = "res/ui/resource/blacksmith/new/tjp_btn_c.png",
									pic3 = "res/ui/resource/blacksmith/new/tjp_btn_a.png",
									pic1 = "res/ui/resource/blacksmith/new/tjp_btn_a.png",
									y = 154,
									x = 20,
									name = "btn_select" .. iter_1_0,
									callBack = function()
										blacksmithUI.itemButtonTap(iter_1_0)
									end
								}
							}
						},
						{
							x = -60,
							y = 154,
							pic = "res/ui/resource/blacksmith/new/tjp_word_xh.png",
							type = "pic"
						},
						{
							x = -12,
							y = 154,
							pic = "res/ui/resource/blacksmith/new/tjp_icon_bg.png",
							type = "pic"
						},
						{
							x = -12,
							y = 154,
							type = "pic",
							scale = 0.55,
							pic = "",
							name = "itemPic" .. iter_1_0
						},
						{
							fontSize = 20,
							text = "",
							type = "label",
							anchorPointX = 1,
							anchorPointY = 1,
							x = 9,
							y = 176,
							name = "haveNum" .. iter_1_0
						},
						{
							fontSize = 20,
							type = "label",
							y = 154,
							x = 42,
							name = "type" .. iter_1_0,
							text = var_1_1[iter_1_0]
						},
						{
							fontSize = 20,
							type = "label",
							strokeSize = 2,
							text = "",
							y = 98,
							x = 0,
							name = "remainNum" .. iter_1_0,
							color = colorText[10004],
							strokeColor = colorText[10005]
						},
						{
							text = "",
							type = "label",
							y = 54,
							width = 160,
							x = 0,
							height = 36,
							name = "info" .. iter_1_0,
							fontSize = 18 + (var_0_2.infoFntSize or 0)
						}
					}
				},
				{
					x = 0,
					y = 110,
					type = "pic",
					visible = false,
					pic = "res/ui/resource/blacksmith/new/tjp_word_xyz.png",
					name = "inRest" .. iter_1_0,
					children = {
						{
							x = 68,
							y = 193,
							type = "pic",
							pic = "res/ui/resource/blacksmith/new/tjp_lianzi.png",
							name = "curtain" .. iter_1_0
						}
					}
				}
			}
		}

		table.insert(var_1_2.children, var_1_3)
	end

	return var_1_2
end

var_0_0.blacksmithBackground = {
	xcenter = 0,
	name = "blacksmithBackground",
	type = "pic",
	ycenter = -30,
	pic = "res/ui/weapon/diamondShop/warlock_view1.jpg",
	children = {
		{
			xcenter = 0,
			name = "blacksmithLevelText",
			y = 504,
			type = "pic",
			pic = "res/ui/resource/blacksmith/tjp_grade_1.png"
		},
		{
			type = "button",
			buttons = {
				{
					pic2 = "frame:btnTip_c.png",
					name = "tipButton",
					pic1 = "frame:btnTip_a.png",
					y = 504,
					x = 630,
					enable = true,
					callBack = function()
						blacksmithUI.handleTipsButtonTap()
					end
				},
				{
					pic2 = "frame:btn3_gre_c.png",
					name = "buildButton",
					pic1 = "frame:btn3_gre_a.png",
					y = 460,
					visible = true,
					x = 458,
					callBack = function()
						blacksmithUI.blacksmithBuildButtonTap()
					end
				}
			}
		},
		{
			fontSize = 20,
			name = "buildButtonTextLabel",
			text = "",
			type = "label",
			y = 460,
			x = 458
		},
		var_0_5()
	}
}

local function var_0_6(arg_7_0)
	local var_7_0 = 0

	if arg_7_0.investCopper and arg_7_0.needCopper then
		var_7_0 = math.floor(100 * arg_7_0.investCopper / arg_7_0.needCopper)
	end

	local var_7_1 = {
		xcenter = 0,
		name = "leftPanel",
		z = 300,
		type = "pic",
		ycenter = 0,
		pic = "res/ui/general/jailView/laofang_jianzao_view.jpg",
		children = {
			{
				top = 25,
				x = 48,
				pic = "res/ui/resource/blacksmith/tiejiangpu_tit_jztjp.png",
				type = "pic"
			},
			{
				xcenter = 0,
				name = "light",
				z = 100,
				type = "pic",
				ycenter = 45,
				visible = false,
				pic = "res/ui/resource/blacksmith/tiejiangpu_build_lig.png"
			},
			{
				xcenter = 0,
				z = 100,
				type = "pic",
				ycenter = 45,
				pic = "res/ui/resource/blacksmith/tiejiangpu_build.png"
			},
			{
				xcenter = 0,
				z = 0,
				type = "button",
				ycenter = 45,
				buttons = {
					{
						pic2 = "res/ui/resource/blacksmith/tiejiangpu_build_lig.png",
						name = "btn_building",
						pic1 = "res/ui/resource/blacksmith/tiejiangpu_build.png",
						enable = true,
						callBack = blacksmithControl.blacksmithUpgradeBlackSmith
					}
				}
			},
			{
				xcenter = 0,
				name = "pic_djjr",
				y = 145,
				type = "pic",
				visible = false,
				pic = "res/ui/general/jailView/laofang_tit_djjr.png"
			},
			{
				xcenter = 0,
				y = 95,
				pic = "res/ui/general/jailView/comm_list_laofang_3.png",
				type = "pic"
			},
			{
				x = 461,
				y = 37,
				pic = "res/ui/rankInfo/twoRankInfo/rank_progress_bar_bg.jpg",
				type = "pic"
			},
			{
				name = "amountProgressBar",
				x = 461,
				type = "process",
				y = 37,
				pic = "res/ui/general/jailView/laofang_load_con.png",
				percentage = var_7_0
			},
			{
				name = "amountValueLabel",
				fontSize = 50,
				type = "label",
				strokeSize = 2,
				y = 39,
				x = 461,
				text = var_7_0 .. "%",
				color = ccc3(235, 209, 167),
				strokeColor = ccc3(22, 18, 13)
			}
		}
	}

	if arg_7_0.buildLv and user.player.playerLv < arg_7_0.buildLv then
		local var_7_2 = {
			fontSize = 22,
			y = 120,
			type = "label",
			x = 800,
			strokeSize = 2,
			text = language.get(85063, tostring(arg_7_0.buildLv)),
			color = ccc3(235, 209, 167),
			strokeColor = ccc3(22, 18, 13)
		}

		table.insert(var_7_1.children, var_7_2)
	elseif arg_7_0.havePic ~= 1 then
		if arg_7_0.finished ~= 1 then
			local var_7_3 = {
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/general/jailView/laofang_btn_ljjc_c.png",
						pic1 = "res/ui/general/jailView/laofang_btn_ljjc_a.png",
						y = 260,
						x = 800,
						enable = true,
						callBack = blacksmithUI.handleBuildBtnTap_LJ
					},
					{
						pic2 = "res/ui/general/jailView/laofang_btn_ksjz_c.png",
						pic1 = "res/ui/general/jailView/laofang_btn_ksjz_a.png",
						y = 190,
						x = 800,
						enable = true,
						callBack = blacksmithUI.handleBuildBtnTap_KS
					},
					{
						pic2 = "res/ui/general/jailView/laofang_btn_ptjz_c.png",
						pic1 = "res/ui/general/jailView/laofang_btn_ptjz_a.png",
						y = 120,
						x = 800,
						enable = true,
						callBack = blacksmithUI.handleBuildBtnTap_PT
					}
				}
			}
			local var_7_4 = {
				fontSize = 24,
				y = 170,
				type = "label",
				x = 740,
				strokeSize = 2,
				text = language.get(75021, math.floor(arg_7_0.keyNum / 10000)),
				color = ccc3(235, 209, 167),
				strokeColor = ccc3(22, 18, 13)
			}
			local var_7_5 = {
				fontSize = 24,
				y = 100,
				type = "label",
				x = 740,
				strokeSize = 2,
				text = language.get(75021, math.floor(arg_7_0.singleNum / 10000)),
				color = ccc3(235, 209, 167),
				strokeColor = ccc3(22, 18, 13)
			}

			table.insert(var_7_1.children, var_7_3)
			table.insert(var_7_1.children, var_7_4)
			table.insert(var_7_1.children, var_7_5)
		end
	else
		local var_7_6 = {
			type = "button",
			buttons = {
				{
					pic2 = "res/ui/general/jailView/laofang_btn_tzjz_c.png",
					name = "btn_build_TZ",
					pic1 = "res/ui/general/jailView/laofang_btn_tzjz_a.png",
					y = 120,
					x = 800,
					enable = true,
					callBack = blacksmithUI.handleBuildBtnTap_TZ
				}
			}
		}

		table.insert(var_7_1.children, var_7_6)
	end

	var_0_1.blacksmithBackground = {
		xcenter = 0,
		name = "blacksmithBackground",
		type = "pic_9",
		anchorPointX = 0.5,
		ycenter = -30,
		pic = "res/ui/general/jailView/comm_view_2.png",
		anchorPointY = 0.5,
		middleRect = CCRectMake(51, 51, 1, 1),
		preferedSize = CCSizeMake(927, 547),
		children = {
			var_7_1
		}
	}

	return var_0_1
end

function getBlacksmithItemTipFrame(arg_8_0)
	return {
		anchorPointX = 0,
		name = "blacksmithItemTipFrame",
		type = "pic_9_tips",
		anchorPointY = 1,
		pic = "frame:common_tip_frame_small.png",
		middleRect = CCRectMake(0, 0, 0, 0),
		preferedSize = CCSizeMake(400, 220),
		content = {
			{
				fontSize = 20,
				font = "Thonburi",
				top = 15,
				type = "label",
				left = 15,
				text = arg_8_0,
				color = colorText[10002],
				align = kCCTextAlignmentLeft
			}
		}
	}
end

function getBlacksmithTipFrame(arg_9_0)
	return {
		anchorPointX = 1,
		name = "blacksmithTipFrame",
		type = "pic_9_tips",
		anchorPointY = 1,
		pic = "frame:common_tip_frame_small.png",
		middleRect = CCRectMake(0, 0, 0, 0),
		preferedSize = CCSizeMake(400, 220),
		content = {
			{
				fontSize = 20,
				font = "Thonburi",
				stroke = false,
				type = "label",
				text = language.get(75044),
				color = ccc3(188, 167, 145)
			},
			{
				pic = "res/ui/weapon/line.png",
				type = "pic"
			},
			{
				fontSize = 18,
				font = "Thonburi",
				stroke = false,
				type = "label",
				text = language.get(75045),
				color = var_0_4[arg_9_0.lv >= 1 and 1 or 0]
			},
			{
				fontSize = 18,
				font = "Thonburi",
				stroke = false,
				type = "label",
				text = language.get(75046),
				color = var_0_4[arg_9_0.lv >= 2 and 2 or 0]
			},
			{
				fontSize = 18,
				font = "Thonburi",
				stroke = false,
				type = "label",
				text = language.get(75047),
				color = var_0_4[arg_9_0.lv >= 3 and 3 or 0]
			},
			{
				fontSize = 18,
				font = "Thonburi",
				stroke = false,
				type = "label",
				text = language.get(75048),
				color = var_0_4[arg_9_0.lv >= 4 and 4 or 0]
			},
			{
				fontSize = 18,
				font = "Thonburi",
				stroke = false,
				type = "label",
				text = language.get(75049) .. "\n",
				color = var_0_4[arg_9_0.lv >= 5 and 5 or 0]
			},
			{
				fontSize = 18,
				font = "Thonburi",
				stroke = false,
				type = "label",
				text = language.get(75075),
				color = var_0_4[arg_9_0.lv >= 1 and 1 or 0]
			},
			{
				fontSize = 18,
				font = "Thonburi",
				stroke = false,
				type = "label",
				text = language.get(75076),
				color = var_0_4[arg_9_0.lv >= 2 and 2 or 0]
			},
			{
				fontSize = 18,
				font = "Thonburi",
				stroke = false,
				type = "label",
				text = language.get(75077),
				color = var_0_4[arg_9_0.lv >= 3 and 3 or 0]
			},
			{
				fontSize = 18,
				font = "Thonburi",
				stroke = false,
				type = "label",
				text = language.get(75078),
				color = var_0_4[arg_9_0.lv >= 4 and 4 or 0]
			},
			{
				fontSize = 18,
				font = "Thonburi",
				stroke = false,
				type = "label",
				text = language.get(75079) .. "\n",
				color = var_0_4[arg_9_0.lv >= 5 and 5 or 0]
			},
			{
				fontSize = 18,
				font = "Thonburi",
				stroke = false,
				type = "label",
				text = language.get(75080),
				color = var_0_4[5]
			}
		}
	}
end

function getBlacksmithUiData(arg_10_0)
	if arg_10_0.type == 2 then
		return var_0_6(arg_10_0)
	else
		return var_0_0
	end
end
