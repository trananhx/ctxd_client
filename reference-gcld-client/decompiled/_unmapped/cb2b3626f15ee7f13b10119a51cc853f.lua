local var_0_0 = ccc3(255, 255, 209)
local var_0_1 = colorQuality[3]
local var_0_2 = colorQuality[5]
local var_0_3 = colorQuality[4]
local var_0_4 = {
	bg = {
		xcenter = 0,
		name = "bg",
		type = "pic",
		ycenter = -30,
		pic = "res/ui/weapon/di.png",
		children = {
			{
				x = 235,
				name = "left_bg",
				y = 270,
				type = "pic",
				pic = "res/ui/weapon/neiban.png",
				children = {}
			},
			{
				x = 685,
				name = "right_bg",
				y = 270,
				type = "pic",
				pic = "res/ui/weapon/neiban.png",
				children = {}
			}
		}
	}
}

local function var_0_5(arg_1_0)
	local var_1_0
	local var_1_1 = {
		230,
		230,
		230,
		230,
		230,
		230
	}
	local var_1_2 = {
		440,
		270,
		100,
		440,
		270,
		100
	}

	return {
		x = 220,
		type = "pic",
		pic = "res/ui/weapon/xiaoban1.png",
		name = "bg_" .. arg_1_0,
		y = var_1_2[arg_1_0] - 10,
		children = {
			{
				x = 75,
				y = 90,
				type = "pic",
				pic = "res/ui/weapon/bq_icon_bg.png",
				name = "weapon_icon_bg_" .. arg_1_0
			},
			{
				font = "Thonburi-Bold",
				type = "label",
				y = 95,
				x = 275,
				fontSize = 25,
				name = "notOpen_" .. arg_1_0,
				text = language.get(143047),
				color = var_0_0
			},
			{
				anchorPointX = 0,
				x = 140,
				type = "pic",
				y = 140,
				pic = "res/ui/common/text/weapon/reform/bqcz_tit_wcb.png",
				name = "name_" .. arg_1_0
			},
			{
				x = 75,
				y = 90,
				type = "pic",
				pic = "res/ui/weapon/weapon_1.png",
				name = "weapon_icon_" .. arg_1_0
			},
			{
				x = 75,
				y = 130,
				pic = "res/ui/weapon/bq_digit_bg.png",
				type = "pic"
			},
			{
				x = 100,
				y = 65,
				type = "pic",
				scale = 1.5,
				pic = "res/ui/weapon/baoshidi2.png",
				name = "weapon_gem_bg_" .. arg_1_0
			},
			{
				x = 100,
				y = 65,
				type = "pic",
				scale = 0.6,
				pic = "res/ui/weapon/baoshi1.jpg",
				name = "weapon_gem_" .. arg_1_0
			},
			{
				fontSize = 20,
				text = "19",
				type = "label",
				y = 130,
				x = 40,
				name = "lvValue_" .. arg_1_0
			},
			{
				x = 160,
				y = 95,
				type = "pic",
				pic = "res/ui/weapon/icon_att.png",
				name = "quantiIcon_" .. arg_1_0
			},
			{
				fontSize = 20,
				text = "+123",
				type = "label",
				anchorPointX = 0,
				y = 95,
				x = 180,
				name = "quantiValue_" .. arg_1_0
			},
			{
				x = 222,
				y = 22,
				type = "pic",
				pic = "res/ui/weapon/bq_pb_bg.png",
				name = "zhuzaoBarBg_" .. arg_1_0
			},
			{
				x = 222,
				y = 22,
				type = "process",
				pic = "res/ui/weapon/bq_pb.png",
				name = "zhuzaoBar_" .. arg_1_0
			},
			{
				fontSize = 20,
				text = "50%",
				type = "label",
				y = 22,
				x = 222,
				name = "zhuzaoPercent_" .. arg_1_0
			},
			{
				x = 160,
				y = 50,
				type = "pic",
				pic = "res/ui/weapon/tie.png",
				name = "cost_icon_" .. arg_1_0
			},
			{
				fontSize = 20,
				text = "12345",
				type = "label",
				anchorPointX = 0,
				y = 50,
				x = 180,
				name = "cost_value_" .. arg_1_0
			},
			{
				x = 370,
				y = 95,
				type = "pic",
				pic = "res/ui/weapon/donghuadi.png",
				name = "donghuadi_" .. arg_1_0
			},
			{
				x = 368,
				y = 95,
				type = "pic",
				pic = "res/ui/weapon/donghuachui1.png",
				name = "donghuaValue_" .. arg_1_0
			},
			{
				x = 225,
				y = 95,
				type = "pic",
				pic = "res/ui/weapon/jingdudi.png",
				name = "dazaoBarBg_" .. arg_1_0
			},
			{
				x = 225,
				y = 95,
				type = "process",
				pic = "res/ui/weapon/jingdutiao.png",
				name = "dazaoBar_" .. arg_1_0
			},
			{
				fontSize = 20,
				text = "50%",
				type = "label",
				y = 95,
				x = 225,
				name = "dazaoPercent_" .. arg_1_0
			},
			{
				fontSize = 20,
				type = "label",
				anchorPointX = 1,
				y = 140,
				x = 425,
				name = "map_title_" .. arg_1_0,
				text = language.get(121016)
			},
			{
				x = 250,
				y = 95,
				type = "pic",
				pic = "res/ui/weapon/tuzhi.png",
				name = "map_icon_" .. arg_1_0
			},
			{
				fontSize = 20,
				text = "3/6",
				type = "label",
				y = 95,
				x = 300,
				name = "map_percent_" .. arg_1_0
			},
			{
				fontSize = 20,
				type = "label",
				anchorPointX = 0,
				y = 95,
				x = 180,
				name = "cost2_title_" .. arg_1_0,
				text = language.get(121015)
			},
			{
				x = 160,
				y = 60,
				type = "pic",
				pic = "res/ui/weapon/tie.png",
				name = "cost2_icon1_" .. arg_1_0
			},
			{
				fontSize = 20,
				text = "3/6",
				type = "label",
				anchorPointX = 0,
				y = 60,
				x = 180,
				name = "cost2_icon1Value_" .. arg_1_0
			},
			{
				x = 160,
				y = 30,
				type = "pic",
				pic = "res/ui/weapon/tie.png",
				name = "cost2_icon2_" .. arg_1_0
			},
			{
				fontSize = 20,
				text = "3/6",
				type = "label",
				anchorPointX = 0,
				y = 30,
				x = 180,
				name = "cost2_icon2Value_" .. arg_1_0
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "frame:btn3_gre_c.png",
						pic1 = "frame:btn3_gre_a.png",
						y = 50,
						pic3 = "frame:btn3_gre_g.png",
						x = 360,
						name = "btn_zhuzao_" .. tostring(arg_1_0),
						tag = arg_1_0
					},
					{
						pic2 = "frame:btn2_gre_c.png",
						pic1 = "frame:btn2_gre_a.png",
						y = 50,
						pic3 = "frame:btn2_gre_g.png",
						x = 240,
						name = "btn_buy_" .. tostring(arg_1_0),
						tag = arg_1_0
					},
					{
						pic2 = "frame:btn2_gre_c.png",
						pic1 = "frame:btn2_gre_a.png",
						y = 50,
						pic3 = "frame:btn2_gre_g.png",
						x = 370,
						name = "btn_drop_" .. tostring(arg_1_0),
						tag = arg_1_0
					},
					{
						pic2 = "frame:btn2_gre_c.png",
						pic1 = "frame:btn2_gre_a.png",
						y = 50,
						pic3 = "frame:btn2_gre_g.png",
						x = 370,
						name = "btn_dazao_" .. tostring(arg_1_0),
						tag = arg_1_0
					},
					{
						pic2 = "frame:btn3_yel_c.png",
						pic1 = "frame:btn3_yel_a.png",
						y = 50,
						pic3 = "frame:btn3_yel_g.png",
						x = 360,
						name = "btn_reform_" .. arg_1_0,
						tag = arg_1_0
					}
				}
			},
			{
				fontSize = 20,
				x = 360,
				type = "label",
				y = 50,
				strokeSize = 2,
				name = "btn_name_zhuzao_" .. tostring(arg_1_0),
				text = language.get(121017),
				color = colorText[10004],
				strokeColor = colorText[10005]
			},
			{
				fontSize = 20,
				x = 240,
				type = "label",
				y = 50,
				strokeSize = 2,
				name = "btn_name_buy_" .. tostring(arg_1_0),
				text = language.get(121018),
				color = colorText[10004],
				strokeColor = colorText[10005]
			},
			{
				fontSize = 20,
				x = 370,
				type = "label",
				y = 50,
				strokeSize = 2,
				name = "btn_name_drop_" .. tostring(arg_1_0),
				text = language.get(121019),
				color = colorText[10004],
				strokeColor = colorText[10005]
			},
			{
				fontSize = 20,
				x = 370,
				type = "label",
				y = 50,
				strokeSize = 2,
				name = "btn_name_dazao_" .. tostring(arg_1_0),
				text = language.get(121020),
				color = colorText[10004],
				strokeColor = colorText[10005]
			},
			{
				x = 310,
				y = 140,
				type = "pic",
				scale = 0.9,
				pic = "res/ui/weapon/xing_dark.png",
				name = "star1_" .. arg_1_0,
				children = {
					{
						x = 42,
						y = 13.5,
						type = "pic",
						pic = "res/ui/weapon/xing_dark.png",
						name = "star2_" .. arg_1_0
					},
					{
						x = 70,
						y = 13.5,
						type = "pic",
						pic = "res/ui/weapon/xing_dark.png",
						name = "star3_" .. arg_1_0
					},
					{
						x = 98,
						y = 13.5,
						type = "pic",
						pic = "res/ui/weapon/xing_dark.png",
						name = "star4_" .. arg_1_0
					},
					{
						x = 126,
						y = 13.5,
						type = "pic",
						pic = "res/ui/weapon/xing_dark.png",
						name = "star5_" .. arg_1_0
					}
				}
			},
			{
				x = 221.5,
				y = 40,
				type = "pic",
				visible = true,
				pic = "",
				name = "donghuaFire_" .. arg_1_0
			}
		}
	}
end

for iter_0_0 = 1, 3 do
	var_0_4.bg.children[1].children[iter_0_0] = var_0_5(iter_0_0)
	var_0_4.bg.children[2].children[iter_0_0 + 3] = var_0_5(iter_0_0 + 3)
end

function getWeaponData()
	return var_0_4
end

function getWeaponReformPanelData()
	return {
		xcenter = 0,
		name = "bg_reform",
		type = "pic",
		ycenter = -30,
		pic = "res/ui/weapon/reform/bqcz_bg.jpg",
		children = {
			{
				x = 52,
				y = 418,
				pic = "res/ui/common/text/weapon/reform/bqcz_title.png",
				type = "pic"
			},
			{
				x = 466,
				name = "icon",
				y = 316,
				type = "pic",
				pic = "res/ui/weapon/reform/weapon_true_1.jpg"
			},
			{
				x = 466,
				y = 216,
				pic = "res/ui/weapon/reform/bqcz_bqname_bg.png",
				type = "pic"
			},
			{
				x = 466,
				name = "name",
				y = 216,
				type = "pic",
				pic = "res/ui/common/text/weapon/reform/bqcz_tit_zhjf.png"
			},
			{
				x = 466,
				name = "info",
				y = 150,
				type = "pic",
				visible = false,
				pic = "res/ui/weapon/reform/bqcz_small_bg.png"
			},
			{
				text = "",
				font = "Thonburi-Bold",
				name = "txt_btn",
				type = "label",
				y = 85,
				x = 466,
				fontSize = 24,
				color = var_0_0
			},
			{
				x = 435,
				name = "star1",
				y = 345,
				type = "pic",
				scale = 0.6,
				pic = "frame:star_light.png"
			},
			{
				x = 450,
				name = "star2",
				y = 345,
				type = "pic",
				scale = 0.6,
				pic = "frame:star_light.png"
			},
			{
				x = 465,
				name = "star3",
				y = 345,
				type = "pic",
				scale = 0.6,
				pic = "frame:star_light.png"
			},
			{
				x = 480,
				name = "star4",
				y = 345,
				type = "pic",
				scale = 0.6,
				pic = "frame:star_light.png"
			},
			{
				x = 495,
				name = "star5",
				y = 345,
				type = "pic",
				scale = 0.6,
				pic = "frame:star_light.png"
			},
			{
				x = 466,
				name = "fire",
				y = 250,
				type = "pic",
				visible = false,
				pic = "res/ui/weapon/reform/bqcz_mask.png"
			}
		}
	}
end
