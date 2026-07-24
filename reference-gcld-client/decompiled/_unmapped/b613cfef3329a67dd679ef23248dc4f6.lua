local var_0_0 = require("res/native/offset").get("layer.technology.buildTech")

function getBuildTechUiData()
	return {
		BuildTechBackground = {
			anchorPointX = 0,
			name = "BuildTechViewBackground",
			x = 22.5,
			type = "pic",
			y = 30,
			anchorPointY = 0,
			pic = "res/ui/technology/buildTech/jzkj_bg.jpg",
			children = {
				{
					height = 521,
					name = "oneTechPanel",
					x = 0,
					type = "layer_color",
					y = 0,
					width = 915,
					color = ccc4(0, 0, 255, 0),
					children = {
						{
							x = 457,
							y = 477,
							pic = "res/ui/technology/buildTech/jzke_title.png",
							type = "pic"
						},
						{
							y = 312,
							x = 457,
							type = "pic",
							pic = "res/ui/technology/buildTech/jzke_viev_long.png",
							children = {
								{
									x = 160,
									name = "workpeople",
									y = 128,
									type = "pic",
									pic = "res/ui/technology/buildTech/mjx.png",
									children = {
										{
											x = 0,
											name = "worktype",
											y = 87,
											type = "pic",
											pic = "res/ui/technology/buildTech/jzke_type_mj.png"
										},
										{
											type = "button",
											buttons = {
												{
													pic2 = "res/ui/common/button/sdyjs_btn_03_c.png",
													name = "btn_change",
													pic1 = "res/ui/common/button/sdyjs_btn_03.png",
													y = 25,
													x = 110
												}
											}
										},
										{
											name = "text_change",
											type = "label",
											anchorPointX = 0,
											strokeSize = 1,
											y = 28,
											x = 83,
											fontSize = 20 + (var_0_0.changeLabelFntSize or 0),
											text = language.get("222002_buildingTech"),
											color = ccc3(204, 185, 134),
											strokeColor = ccc3(17, 22, 14)
										},
										{
											y = 30,
											x = 40,
											type = "pic",
											pic = "res/ui/common/button/public_btn_gold.png",
											children = {
												{
													xcenter = 0,
													y = 25,
													pic = "frame:res_icon_19_small.png",
													type = "pic"
												},
												{
													text = "100",
													name = "text_gold",
													fontSize = 20,
													type = "label",
													xcenter = -2,
													y = 14,
													color = ccc3(204, 185, 134)
												}
											}
										}
									}
								},
								{
									y = 92,
									x = 370,
									type = "pic",
									pic = "res/ui/nation/buildNation/mainTask/jgdy_gcqz_res_bg.png",
									children = {
										{
											xcenter = 0,
											name = "iconType",
											type = "pic",
											ycenter = 0,
											pic = "res/ui/technology/buildTech/jzke_icon_fz.png"
										}
									}
								},
								{
									fontSize = 25,
									name = "btn_text",
									type = "label",
									anchorPointX = 0,
									strokeSize = 1,
									y = 92,
									x = 410,
									text = language.get("222001_buildingTech"),
									color = ccc3(204, 185, 134),
									strokeColor = ccc3(17, 22, 14)
								},
								{
									y = 52,
									x = 340,
									anchorPointX = 0,
									type = "pic",
									anchorPointY = 0.5,
									pic = "res/ui/technology/buildTech/jzke_pb_d.png"
								},
								{
									x = 340,
									name = "processBar",
									y = 52,
									type = "process",
									anchorPointX = 0,
									anchorPointY = 0.5,
									pic = "res/ui/technology/buildTech/jzke_pb.png",
									percentage = 0
								},
								{
									fontSize = 25,
									name = "processWord",
									x = 590,
									type = "label",
									text = "0/100",
									y = 54,
									strokeSize = 1,
									color = ccc3(204, 185, 134),
									strokeColor = ccc3(17, 22, 14)
								}
							}
						},
						{
							x = 53,
							name = "techPoint",
							y = 130,
							type = "pic",
							pic = "res/ui/technology/buildTech/jzke_word_kjd.png",
							children = {
								{
									xcenter = 0,
									height = 28,
									name = "techPointNum",
									type = "atlas",
									pic = "res/ui/technology/buildTech/jzke_word_kjd_digit.png",
									text = "100",
									y = 64,
									startChar = 48,
									width = 18,
									anchorPoint = ccp(0.5, 0.5)
								},
								{
									type = "button",
									buttons = {
										{
											pic2 = "res/ui/common/button/btn_add_c.png",
											name = "btn_addTech",
											pic1 = "res/ui/common/button/btn_add.png",
											y = 25,
											x = 83
										}
									}
								}
							}
						},
						{
							type = "button",
							buttons = {
								{
									pic2 = "res/ui/technology/buildTech/jzke_btn_gjmc_c.png",
									name = "btn_open",
									pic1 = "res/ui/technology/buildTech/jzke_btn_gjmc.png",
									y = 397,
									x = 845
								}
							}
						},
						{
							y = 184,
							x = 136,
							anchorPointX = 0,
							type = "pic",
							pic = "res/ui/technology/buildTech/jzke_jn_line_01.png"
						},
						{
							y = 85,
							x = 136,
							type = "pic_9",
							anchorPointX = 0,
							pic = "res/ui/technology/buildTech/jzke_jn_line_02.png",
							middleRect = CCRectMake(100, 0, 1, 99),
							preferedSize = CCSizeMake(580, 99)
						},
						{
							x = 170,
							name = "buildTech_1",
							y = 138,
							type = "pic",
							pic = "res/ui/technology/buildTech/jzke_jn_icon_d.png"
						},
						{
							x = 296,
							name = "buildTech_2",
							y = 200,
							type = "pic",
							pic = "res/ui/technology/buildTech/jzke_jn_icon_d.png"
						},
						{
							x = 432,
							name = "buildTech_3",
							y = 200,
							type = "pic",
							pic = "res/ui/technology/buildTech/jzke_jn_icon_d.png"
						},
						{
							x = 296,
							name = "buildTech_4",
							y = 70,
							type = "pic",
							pic = "res/ui/technology/buildTech/jzke_jn_icon_d.png"
						},
						{
							x = 432,
							name = "buildTech_5",
							y = 70,
							type = "pic",
							pic = "res/ui/technology/buildTech/jzke_jn_icon_d.png"
						},
						{
							x = 568,
							name = "buildTech_6",
							y = 70,
							type = "pic",
							pic = "res/ui/technology/buildTech/jzke_jn_icon_d.png"
						},
						{
							x = 704,
							name = "buildTech_7",
							y = 200,
							type = "pic",
							pic = "res/ui/technology/buildTech/jzke_jn_icon_d.png"
						},
						{
							x = 840,
							name = "buildTech_8",
							y = 70,
							type = "pic",
							pic = "res/ui/technology/buildTech/jzke_jn_icon_d.png"
						},
						{
							x = 704,
							name = "buildTech_9",
							y = 70,
							type = "pic",
							pic = "res/ui/technology/buildTech/jzke_jn_icon_d.png"
						}
					}
				}
			}
		}
	}
end

function getSelectBuildTechUiData()
	return {
		BuildTechBackground = {
			anchorPointX = 0,
			name = "BuildTechViewBackground",
			x = 22.5,
			type = "pic",
			y = 30,
			anchorPointY = 0,
			pic = "res/ui/technology/buildTech/jzkj_bg.jpg",
			children = {
				{
					height = 521,
					name = "oneTechPanel",
					x = 0,
					type = "layer_color",
					y = 0,
					width = 915,
					color = ccc4(0, 0, 255, 0),
					children = {
						{
							x = 457,
							y = 477,
							pic = "res/ui/technology/buildTech/jzke_title.png",
							type = "pic"
						},
						{
							xcenter = -200,
							name = "workpeople1",
							type = "pic",
							ycenter = 50,
							pic = "res/ui/technology/buildTech/mjx.png",
							children = {
								{
									x = 0,
									name = "worktype",
									y = 97,
									type = "pic",
									pic = "res/ui/technology/buildTech/jzke_type_mj.png"
								},
								{
									type = "button",
									buttons = {
										{
											pic2 = "res/ui/common/button/sdyjs_btn_03_c.png",
											name = "btn_change1",
											pic1 = "res/ui/common/button/sdyjs_btn_03.png",
											y = -120,
											x = 110
										}
									}
								},
								{
									fontSize = 20,
									name = "text_change1",
									x = 110,
									type = "label",
									y = -116,
									strokeSize = 1,
									text = language.get("222002_buildingTech"),
									color = ccc3(204, 185, 134),
									strokeColor = ccc3(17, 22, 14)
								},
								{
									x = 110,
									name = "describe1",
									y = -15,
									type = "pic",
									pic = "res/ui/technology/buildTech/jzke_word_d.png",
									children = {
										{
											fontSize = 22,
											height = 70,
											type = "label",
											ycenter = 20,
											xcenter = 0,
											width = 300,
											text = language.get("222035_buildingTech")
										},
										{
											fontSize = 22,
											name = "mjNum",
											type = "label",
											ycenter = -60,
											height = 70,
											width = 300,
											xcenter = 0,
											text = language.get("222036_buildingTech", 0)
										}
									}
								}
							}
						},
						{
							xcenter = 200,
							name = "workpeople2",
							type = "pic",
							ycenter = 50,
							pic = "res/ui/technology/buildTech/tjx.png",
							children = {
								{
									x = 0,
									name = "worktype",
									y = 97,
									type = "pic",
									pic = "res/ui/technology/buildTech/jzke_type_tj.png"
								},
								{
									type = "button",
									buttons = {
										{
											pic2 = "res/ui/common/button/sdyjs_btn_03_c.png",
											name = "btn_change2",
											pic1 = "res/ui/common/button/sdyjs_btn_03.png",
											y = -120,
											x = 110
										}
									}
								},
								{
									fontSize = 20,
									name = "text_change2",
									x = 110,
									type = "label",
									y = -116,
									strokeSize = 1,
									text = language.get("222003_buildingTech"),
									color = ccc3(204, 185, 134),
									strokeColor = ccc3(17, 22, 14)
								},
								{
									x = 110,
									name = "describe2",
									y = -15,
									type = "pic",
									pic = "res/ui/technology/buildTech/jzke_word_d.png",
									children = {
										{
											fontSize = 22,
											height = 70,
											type = "label",
											ycenter = 20,
											xcenter = 0,
											width = 300,
											text = language.get("222034_buildingTech")
										},
										{
											fontSize = 22,
											name = "tjNum",
											type = "label",
											ycenter = -60,
											height = 70,
											width = 300,
											xcenter = 0,
											text = language.get("222036_buildingTech", 0)
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
end

local var_0_1 = {
	tipsBg = {
		xcenter = 0,
		anchorPointX = 0.5,
		type = "pic_9_tips",
		ycenter = 0,
		pic = "frame:common_tip_frame_small.png",
		anchorPointY = 0.5,
		middleRect = CCRectMake(0, 0, 0, 0),
		preferedSize = CCSizeMake(300, 300),
		content = {
			{
				fontSize = 22,
				type = "label",
				text = language.get(103050)
			},
			{
				fontSize = 22,
				type = "label",
				text = language.get(103051)
			}
		}
	}
}

autoUI.initUI(layer, var_0_1)
