local var_0_0 = {}

local function var_0_1(arg_1_0)
	return {
		y = 50,
		type = "pic",
		name = "generalQualityFrame" .. arg_1_0,
		x = 55 + (arg_1_0 - 1) * 100,
		pic = picQualityFrame[0],
		children = {
			{
				xcenter = 0,
				type = "pic",
				ycenter = 0,
				pic = "res/ui/general/training/train_list_emp.jpg",
				name = "generalPic" .. arg_1_0,
				children = {
					{
						xcenter = 0,
						y = 11,
						type = "pic",
						visible = false,
						pic = "frame:gray_text_background.png",
						name = "generalLvLayer" .. arg_1_0,
						children = {
							{
								xcenter = 0,
								fontSize = 22,
								type = "label",
								ycenter = 0,
								text = "Lv.",
								font = "Thonburi",
								name = "generalLvText" .. arg_1_0,
								align = kCCTextAlignmentCenter,
								color = colorQuality[1]
							}
						}
					}
				}
			}
		}
	}
end

var_0_0.backgroundLayer = {
	name = "backgroundLayer",
	height = 581,
	x = 0,
	type = "layer_color",
	y = 0,
	width = 960,
	color = ccc4(200, 100, 0, 0),
	children = {
		{
			left = 153,
			name = "basicBackground",
			down = 15,
			type = "pic",
			pic = "res/ui/general/training/train_background.png",
			children = {
				{
					x = -134,
					z = 90,
					height = 550,
					type = "layer_color",
					name = "tabButtonsLayer",
					y = 0,
					width = 150,
					color = ccc4(255, 0, 128, 0),
					children = {
						{
							z = 100,
							type = "button",
							buttons = {
								{
									pic2 = "res/ui/general/training/train_opt_view.png",
									pic1 = "res/ui/general/training/train_unopt_view.png",
									y = 465,
									z = 100,
									x = 78,
									name = "tabButton" .. 1,
									callBack = function()
										trainingUI.handleTabButtonTap(1)
									end
								},
								{
									pic2 = "res/ui/general/training/train_opt_view.png",
									pic1 = "res/ui/general/training/train_unopt_view.png",
									y = 319,
									z = 100,
									x = 78,
									name = "tabButton" .. 2,
									callBack = function()
										trainingUI.handleTabButtonTap(2)
									end
								},
								{
									pic2 = "res/ui/general/training/train_opt_view.png",
									pic1 = "res/ui/general/training/train_unopt_view.png",
									y = 173,
									z = 100,
									x = 78,
									name = "tabButton" .. 3,
									callBack = function()
										trainingUI.handleTabButtonTap(3)
									end
								}
							}
						},
						{
							x = 78,
							z = 100,
							y = 465,
							type = "pic",
							pic = "res/ui/general/training/train_left_pt.png"
						},
						{
							x = 78,
							z = 100,
							y = 319,
							type = "pic",
							pic = "res/ui/general/training/train_left_qh.png"
						},
						{
							x = 78,
							z = 100,
							y = 173,
							type = "pic",
							pic = "res/ui/general/training/train_left_dy.png"
						}
					}
				},
				{
					x = 240,
					name = "playerHalfPic",
					z = 200,
					type = "pic",
					ycenter = 5,
					pic = string.format("res/ui/common/playerPic/player%s.png", user.player.pic)
				},
				{
					y = 58,
					z = 300,
					x = 225,
					type = "pic",
					pic = "res/ui/general/training/train_general_bg.png",
					children = {
						var_0_1(1),
						var_0_1(2),
						var_0_1(3),
						var_0_1(4)
					}
				},
				{
					name = "trainingMask",
					z = 350,
					type = "layer_color",
					visible = false,
					color = ccc4(0, 0, 0, 128),
					width = visibleSize.width,
					height = visibleSize.height
				},
				{
					width = 330,
					z = 405,
					name = "underTrainingLayer",
					type = "layer_color",
					height = 530,
					y = 10,
					visible = false,
					x = 446,
					color = ccc4(100, 2, 30, 0),
					children = {
						{
							xcenter = 0,
							name = "modeTrainingTitlePic",
							type = "pic",
							top = 20,
							pic = "res/ui/general/training/train_ing_title_1.png"
						},
						{
							name = "trainingLeftTimeTitle",
							fontSize = 26,
							type = "label",
							y = 414,
							x = 101,
							text = language.get(86007),
							color = colorText[10003]
						},
						{
							x = 170,
							name = "trainingProgressBarBackground",
							y = 135,
							type = "pic",
							pic = "res/ui/general/training/train_load_bg.png"
						},
						{
							x = 170,
							name = "trainingProgressBar",
							y = 135,
							type = "process",
							pic = "res/ui/general/training/train_load_con.jpg",
							children = {
								{
									x = 0,
									name = "progressLight",
									z = 100,
									type = "pic",
									ycenter = 0,
									pic = "res/ui/general/training/train_load_lig.png"
								}
							}
						},
						{
							xcenter = 0,
							y = 45,
							type = "button",
							buttons = {
								{
									pic2 = "frame:btn4_gre_c.png",
									pic3 = "frame:btn4_gre_g.png",
									pic1 = "frame:btn4_gre_a.png",
									name = "stopTrainingButton",
									children = {
										{
											xcenter = 0,
											fontSize = 26,
											type = "label",
											ycenter = 0,
											text = language.get(86008),
											color = colorText[10004]
										}
									},
									callBack = function()
										trainingUI.onStopTrainingButtonTap()
									end
								}
							}
						}
					}
				},
				{
					x = 446,
					z = 400,
					name = "descriptionLayer",
					type = "layer_color",
					height = 530,
					visible = false,
					y = 10,
					width = 330,
					color = ccc4(100, 200, 30, 0),
					children = {
						{
							xcenter = 0,
							name = "modeTitlePic",
							type = "pic",
							top = 20,
							pic = "res/ui/general/training/train_title_1.png"
						},
						{
							xcenter = 0,
							type = "pic",
							top = 120,
							pic = "res/ui/general/training/train_des_bg.png",
							children = {
								{
									fontSize = 26,
									y = 85,
									type = "label",
									x = 38,
									text = language.get(86002),
									color = colorText[10002]
								},
								{
									fontSize = 26,
									y = 40,
									type = "label",
									right = 190,
									text = language.get(86003),
									color = colorText[10003]
								},
								{
									text = "",
									name = "trainingEffectLabel",
									fontSize = 26,
									type = "label",
									y = 40,
									x = 200
								}
							}
						},
						{
							xcenter = 0,
							type = "pic",
							top = 250,
							pic = "res/ui/general/training/train_des_bg.png",
							children = {
								{
									fontSize = 26,
									y = 85,
									type = "label",
									x = 38,
									text = language.get(86004),
									color = colorText[10002]
								},
								{
									fontSize = 26,
									y = 40,
									type = "label",
									right = 190,
									text = language.get(86005),
									color = colorText[10003]
								},
								{
									text = "",
									name = "trainingCostLabel",
									fontSize = 26,
									type = "label",
									y = 40,
									x = 210,
									color = colorText[10001]
								},
								{
									y = 40,
									right = 250,
									pic = "frame:res_icon_2.png",
									type = "pic"
								}
							}
						},
						{
							xcenter = 0,
							y = 45,
							type = "button",
							buttons = {
								{
									pic2 = "frame:btn4_gre_c.png",
									pic3 = "frame:btn4_gre_g.png",
									pic1 = "frame:btn4_gre_a.png",
									name = "startTrainingButton",
									children = {
										{
											xcenter = 0,
											fontSize = 26,
											type = "label",
											ycenter = 0,
											text = language.get(86001),
											color = colorText[10004]
										}
									},
									callBack = function()
										trainingUI.onStartTrainingButtonTap()
									end
								}
							}
						}
					}
				}
			}
		}
	}
}

function getTrainingUiData()
	return var_0_0
end
