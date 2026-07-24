local var_0_0 = {}
local var_0_1 = 560
local var_0_2 = 342
local var_0_3 = 150
local var_0_4 = 82
local var_0_5 = 55
local var_0_6 = -60
local var_0_7 = 68
local var_0_8 = -5
local var_0_9 = 62
local var_0_10 = 4

var_0_0.bg = {
	xcenter = 0,
	name = "bg",
	type = "pic",
	ycenter = -30,
	pic = "res/ui/weapon/diamond/di.png",
	children = {
		{
			name = "tit_di_1",
			type = "pic",
			pic = "res/ui/weapon/diamond/warlock_tit_di.png",
			x = var_0_1 - var_0_3,
			y = var_0_2 + var_0_4 + var_0_5
		},
		{
			name = "tit_di_2",
			type = "pic",
			pic = "res/ui/weapon/diamond/warlock_tit_di.png",
			x = var_0_1 + var_0_4 + var_0_7,
			y = var_0_2 + var_0_4 + var_0_5
		},
		{
			name = "tit_di_3",
			type = "pic",
			pic = "res/ui/weapon/diamond/warlock_tit_di.png",
			x = var_0_1 - var_0_3,
			y = var_0_2 - var_0_4 + var_0_5
		},
		{
			name = "tit_di_4",
			type = "pic",
			pic = "res/ui/weapon/diamond/warlock_tit_di.png",
			x = var_0_1 + var_0_4 + var_0_7,
			y = var_0_2 - var_0_4 + var_0_5
		},
		{
			scale = 1,
			name = "tit_di_jinengshi",
			z = 0,
			type = "pic",
			pic = "res/ui/weapon/diamond/jsjh_word_main_skill.png",
			x = var_0_1 - var_0_3,
			y = var_0_2 - var_0_4
		},
		{
			z = 100,
			name = "jinegnshi_title",
			type = "pic",
			pic = "res/ui/weapon/diamond/jsjh_name_bg.png",
			x = var_0_1,
			y = var_0_2 + var_0_4 * 1.35
		},
		{
			z = 100,
			name = "jinegnshi_title_word",
			type = "pic",
			pic = "res/ui/weapon/diamond/jsjh_word_baoji.png",
			x = var_0_1,
			y = var_0_2 + var_0_4 * 1.35
		},
		{
			z = 100,
			name = "sougua_tucheng",
			type = "pic",
			pic = "res/ui/weapon/diamond/jsjh_word_sg.png",
			x = var_0_1 + 35,
			y = var_0_2 - 60
		},
		{
			fontSize = 20,
			name = "sougua_tucheng_word",
			type = "label",
			text = language.get(122077),
			x = var_0_1 - 45,
			y = var_0_2 - 60
		},
		{
			fontSize = 20,
			name = "remainSlaughterTimes",
			type = "label",
			x = var_0_1,
			y = var_0_2 - 120
		},
		{
			fontSize = 20,
			name = "kejinhua_word",
			type = "label",
			text = language.get(122082, 21),
			x = var_0_1,
			y = var_0_2 - 60
		},
		{
			fontSize = 20,
			name = "tit_1",
			type = "label",
			text = language.get(122056, 1),
			x = var_0_1 - var_0_3,
			y = var_0_2 + var_0_4 + var_0_5
		},
		{
			fontSize = 20,
			name = "tit_2",
			type = "label",
			text = language.get(122056, 5),
			x = var_0_1 + var_0_3,
			y = var_0_2 + var_0_4 + var_0_5
		},
		{
			fontSize = 20,
			name = "tit_3",
			type = "label",
			text = language.get(122056, 10),
			x = var_0_1 - var_0_3,
			y = var_0_2 - var_0_4 + var_0_5
		},
		{
			fontSize = 20,
			name = "tit_4",
			type = "label",
			text = language.get(122056, 15),
			x = var_0_1 + var_0_3,
			y = var_0_2 - var_0_4 + var_0_5
		},
		{
			z = 50,
			name = "icon_bg_1",
			type = "pic",
			scale = 0.7692307692307693,
			pic = "res/ui/weapon/diamond/warlock_btn_sz.png",
			x = var_0_1 - var_0_3,
			y = var_0_2 + var_0_4
		},
		{
			z = 50,
			name = "icon_bg_2",
			type = "pic",
			scale = 0.7692307692307693,
			pic = "res/ui/weapon/diamond/warlock_btn_sz.png",
			x = var_0_1 + var_0_4 + var_0_7,
			y = var_0_2 + var_0_4
		},
		{
			z = 50,
			name = "icon_bg_3",
			type = "pic",
			scale = 0.7692307692307693,
			pic = "res/ui/weapon/diamond/warlock_btn_sz.png",
			x = var_0_1 - var_0_3,
			y = var_0_2 - var_0_4
		},
		{
			z = 50,
			name = "icon_bg_4",
			type = "pic",
			scale = 0.7692307692307693,
			pic = "res/ui/weapon/diamond/warlock_btn_sz.png",
			x = var_0_1 + var_0_4 + var_0_7,
			y = var_0_2 - var_0_4
		},
		{
			z = 51,
			name = "icon_1",
			type = "pic",
			pic = "res/ui/weapon/diamond/warlock_btn_sz.png",
			x = var_0_1 - var_0_3,
			y = var_0_2 + var_0_4
		},
		{
			z = 51,
			name = "icon_2",
			type = "pic",
			pic = "res/ui/weapon/diamond/warlock_btn_sz.png",
			x = var_0_1 + var_0_4 + var_0_7,
			y = var_0_2 + var_0_4
		},
		{
			z = 51,
			name = "icon_3",
			type = "pic",
			pic = "res/ui/weapon/diamond/warlock_btn_sz.png",
			x = var_0_1 - var_0_3,
			y = var_0_2 - var_0_4
		},
		{
			z = 51,
			name = "icon_4",
			type = "pic",
			pic = "res/ui/weapon/diamond/warlock_btn_sz.png",
			x = var_0_1 + var_0_4 + var_0_7,
			y = var_0_2 - var_0_4
		},
		{
			z = 51,
			name = "icon_jinengshi",
			type = "pic",
			pic = "res/ui/weapon/diamond/warlock_btn_sz.png",
			x = var_0_1 - var_0_3,
			y = var_0_2 - var_0_4
		},
		{
			text = "1",
			name = "lv_1",
			type = "label",
			fontSize = 18,
			x = var_0_1 - var_0_3,
			y = var_0_2 + var_0_4 - 15
		},
		{
			text = "2",
			name = "lv_2",
			type = "label",
			fontSize = 18,
			x = var_0_1 + var_0_4 + var_0_7,
			y = var_0_2 + var_0_4 - 15
		},
		{
			text = "3",
			name = "lv_3",
			type = "label",
			fontSize = 18,
			x = var_0_1 - var_0_3,
			y = var_0_2 - var_0_4 - 15
		},
		{
			text = "4",
			name = "lv_4",
			type = "label",
			fontSize = 18,
			x = var_0_1 + var_0_4 + var_0_7,
			y = var_0_2 - var_0_4 - 15
		},
		{
			text = "0",
			name = "lv_jinengshi",
			type = "label",
			fontSize = 18,
			x = var_0_1 - var_0_3,
			y = var_0_2 - var_0_4 - 15
		},
		{
			x = 97,
			name = "jinjie_select",
			y = 255,
			type = "pic",
			pic = "res/ui/weapon/diamond/jinjie_select_frame.png"
		},
		{
			x = 560,
			name = "center",
			y = 339,
			type = "pic",
			pic = "res/ui/weapon/diamond/warlock_btn_sz.png"
		},
		{
			x = 560,
			name = "effect",
			y = 337,
			type = "pic",
			z = 200,
			pic = "res/ui/weapon/star.png"
		},
		{
			fontSize = 20,
			name = "des",
			type = "label",
			y = 485,
			x = 225,
			anchorPointX = 0,
			text = language.get(122020),
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "des11",
			type = "label",
			y = 500,
			x = 0,
			anchorPointX = 0,
			text = language.get(226067),
			color = ccc3(227, 194, 152)
		},
		{
			type = "button",
			buttons = {
				{
					visible = false,
					name = "autoBuyBtn",
					y = 488,
					x = 720,
					pic1 = {
						pics = {
							{
								pic = "res/ui/messagebox/unite_view_a.png",
								children = {
									{
										x = 19,
										name = "checkedBtn",
										y = 19,
										type = "pic",
										pic = "res/ui/messagebox/unite_view_on.png"
									},
									{
										fontSize = 20,
										x = 106,
										type = "menu_label",
										font = "Thonburi",
										y = 19,
										strokeSize = 2,
										text = language.get(226066),
										color = ccc3(0, 0, 0),
										strokeColor = ccc3(204, 185, 134)
									}
								}
							}
						}
					}
				}
			}
		},
		{
			name = "gem_pos",
			type = "pic",
			visible = false,
			pic = "res/ui/weapon/gem_pos.png",
			x = var_0_1,
			y = var_0_2 - 135,
			children = {
				{
					fontSize = 24,
					name = "gem_pos_word",
					text = " ",
					type = "label",
					ycenter = 5,
					xcenter = 0
				}
			}
		},
		{
			z = 49,
			name = "jinglian_di_1",
			type = "pic",
			pic = "res/ui/weapon/diamond/bs_bg.png",
			x = var_0_1 - var_0_3,
			y = var_0_2 + var_0_4 + var_0_6 + var_0_9
		},
		{
			z = 49,
			name = "jinglian_di_2",
			type = "pic",
			pic = "res/ui/weapon/diamond/bs_bg.png",
			x = var_0_1 + var_0_3,
			y = var_0_2 + var_0_4 + var_0_6 + var_0_9
		},
		{
			z = 49,
			name = "jinglian_di_3",
			type = "pic",
			pic = "res/ui/weapon/diamond/bs_bg.png",
			x = var_0_1 - var_0_3,
			y = var_0_2 - var_0_4 + var_0_6 + var_0_9
		},
		{
			z = 49,
			name = "jinglian_di_4",
			type = "pic",
			pic = "res/ui/weapon/diamond/bs_bg.png",
			x = var_0_1 + var_0_3,
			y = var_0_2 - var_0_4 + var_0_6 + var_0_9
		},
		{
			z = 50,
			name = "icon_shenshi_bg_1",
			type = "pic",
			pic = "res/ui/weapon/diamond/warlock_btn_sz.png",
			x = var_0_1 - var_0_3 * 1.1,
			y = var_0_2 + var_0_4
		},
		{
			z = 50,
			name = "icon_shenshi_bg_2",
			type = "pic",
			pic = "res/ui/weapon/diamond/warlock_btn_sz.png",
			x = var_0_1 + var_0_3 * 1.1,
			y = var_0_2 + var_0_4
		},
		{
			z = 50,
			name = "icon_shenshi_bg_3",
			type = "pic",
			pic = "res/ui/weapon/diamond/warlock_btn_sz.png",
			x = var_0_1 - var_0_3 * 1.3,
			y = var_0_2
		},
		{
			z = 50,
			name = "icon_shenshi_bg_4",
			type = "pic",
			pic = "res/ui/weapon/diamond/warlock_btn_sz.png",
			x = var_0_1 + var_0_3 * 1.3,
			y = var_0_2
		},
		{
			z = 50,
			name = "icon_shenshi_bg_5",
			type = "pic",
			pic = "res/ui/weapon/diamond/warlock_btn_sz.png",
			x = var_0_1 - var_0_3 * 1.1,
			y = var_0_2 - var_0_4
		},
		{
			z = 50,
			name = "icon_shenshi_bg_6",
			type = "pic",
			pic = "res/ui/weapon/diamond/warlock_btn_sz.png",
			x = var_0_1 + var_0_3 * 1.1,
			y = var_0_2 - var_0_4
		},
		{
			z = 51,
			name = "icon_shenshi_1",
			type = "pic",
			pic = "res/ui/weapon/jinengshenshi.png",
			x = var_0_1 - var_0_3 * 1.1,
			y = var_0_2 + var_0_4
		},
		{
			z = 51,
			name = "icon_shenshi_2",
			type = "pic",
			pic = "res/ui/weapon/jinengshenshi.png",
			x = var_0_1 + var_0_3 * 1.1,
			y = var_0_2 + var_0_4
		},
		{
			z = 51,
			name = "icon_shenshi_3",
			type = "pic",
			pic = "res/ui/weapon/jinengshenshi.png",
			x = var_0_1 - var_0_3 * 1.3,
			y = var_0_2
		},
		{
			z = 51,
			name = "icon_shenshi_4",
			type = "pic",
			pic = "res/ui/weapon/jinengshenshi.png",
			x = var_0_1 + var_0_3 * 1.3,
			y = var_0_2
		},
		{
			z = 51,
			name = "icon_shenshi_5",
			type = "pic",
			pic = "res/ui/weapon/jinengshenshi.png",
			x = var_0_1 - var_0_3 * 1.1,
			y = var_0_2 - var_0_4
		},
		{
			z = 51,
			name = "icon_shenshi_6",
			type = "pic",
			pic = "res/ui/weapon/jinengshenshi.png",
			x = var_0_1 + var_0_3 * 1.1,
			y = var_0_2 - var_0_4
		},
		{
			type = "button",
			buttons = {
				{
					pic2 = "frame:btn2_gre_c.png",
					name = "btn_hecheng",
					pic1 = "frame:btn2_gre_a.png",
					y = 75,
					pic3 = "frame:btn2_gre_g.png",
					x = 400
				},
				{
					pic2 = "frame:btn2_gre_c.png",
					name = "btn_chaijie",
					pic1 = "frame:btn2_gre_a.png",
					y = 75,
					pic3 = "frame:btn2_gre_g.png",
					x = 550
				},
				{
					pic2 = "frame:btn2_gre_c.png",
					name = "btn_damo",
					pic1 = "frame:btn2_gre_a.png",
					y = 75,
					pic3 = "frame:btn2_gre_g.png",
					x = 700
				},
				{
					pic2 = "frame:btn2_gre_c.png",
					name = "btn_jinjie2",
					pic1 = "frame:btn2_gre_a.png",
					y = 50,
					pic3 = "frame:btn2_gre_g.png",
					x = 475
				},
				{
					pic2 = "frame:btn2_gre_c.png",
					name = "btn_jinhua",
					pic1 = "frame:btn2_gre_a.png",
					y = 50,
					pic3 = "frame:btn2_gre_g.png",
					x = 625
				},
				{
					pic2 = "frame:btn2_gre_c.png",
					name = "btn_ok",
					pic1 = "frame:btn2_gre_a.png",
					y = 50,
					x = 475
				},
				{
					pic2 = "frame:btn2_gre_c.png",
					name = "btn_cancel",
					pic1 = "frame:btn2_gre_a.png",
					y = 50,
					x = 625
				},
				{
					pic2 = "res/ui/weapon/diamond/bs_btn.png",
					name = "btn_jinglian_1",
					pic1 = "res/ui/weapon/diamond/bs_btn.png",
					tag = 1,
					x = var_0_1 - var_0_3,
					y = var_0_2 + var_0_4 + var_0_6 + var_0_8
				},
				{
					pic2 = "res/ui/weapon/diamond/bs_btn.png",
					name = "btn_jinglian_2",
					pic1 = "res/ui/weapon/diamond/bs_btn.png",
					tag = 2,
					x = var_0_1 + var_0_3,
					y = var_0_2 + var_0_4 + var_0_6 + var_0_8
				},
				{
					pic2 = "res/ui/weapon/diamond/bs_btn.png",
					name = "btn_jinglian_3",
					pic1 = "res/ui/weapon/diamond/bs_btn.png",
					tag = 3,
					x = var_0_1 - var_0_3,
					y = var_0_2 - var_0_4 + var_0_6 + var_0_8
				},
				{
					pic2 = "res/ui/weapon/diamond/bs_btn.png",
					name = "btn_jinglian_4",
					pic1 = "res/ui/weapon/diamond/bs_btn.png",
					tag = 4,
					x = var_0_1 + var_0_3,
					y = var_0_2 - var_0_4 + var_0_6 + var_0_8
				}
			}
		},
		{
			fontSize = 20,
			name = "title_hecheng",
			x = 400,
			type = "label",
			y = 75,
			strokeSize = 2,
			text = language.get(122028),
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			fontSize = 20,
			name = "title_chaijie",
			x = 550,
			type = "label",
			y = 75,
			strokeSize = 2,
			text = language.get(122029),
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			fontSize = 20,
			name = "title_damo",
			x = 700,
			type = "label",
			y = 75,
			strokeSize = 2,
			text = language.get(122051),
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			fontSize = 20,
			name = "title_jinjie2",
			x = 475,
			type = "label",
			y = 50,
			strokeSize = 2,
			text = language.get(122055),
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			fontSize = 20,
			name = "title_jinhua",
			x = 625,
			type = "label",
			y = 50,
			strokeSize = 2,
			text = language.get(122072),
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			fontSize = 20,
			name = "title_ok",
			x = 475,
			type = "label",
			y = 50,
			strokeSize = 2,
			text = language.get(10001),
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			fontSize = 20,
			name = "title_cancel",
			x = 625,
			type = "label",
			y = 50,
			strokeSize = 2,
			text = language.get(10002),
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			fontSize = 20,
			name = "title_jinglian_1",
			type = "label",
			strokeSize = 2,
			text = language.get(122057),
			x = var_0_1 - var_0_3,
			y = var_0_2 + var_0_4 + var_0_6 + var_0_10,
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			fontSize = 20,
			name = "title_jinglian_2",
			type = "label",
			strokeSize = 2,
			text = language.get(122057),
			x = var_0_1 + var_0_3,
			y = var_0_2 + var_0_4 + var_0_6 + var_0_10,
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			fontSize = 20,
			name = "title_jinglian_3",
			type = "label",
			strokeSize = 2,
			text = language.get(122057),
			x = var_0_1 - var_0_3,
			y = var_0_2 - var_0_4 + var_0_6 + var_0_10,
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			fontSize = 20,
			name = "title_jinglian_4",
			type = "label",
			strokeSize = 2,
			text = language.get(122057),
			x = var_0_1 + var_0_3,
			y = var_0_2 - var_0_4 + var_0_6 + var_0_10,
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			x = 550,
			name = "jinjieBg",
			y = 100,
			type = "pic",
			pic = "res/ui/weapon/diamond/jdtd_load_di.png"
		},
		{
			x = 550,
			name = "jinjie",
			y = 100,
			type = "process",
			pic = "res/ui/weapon/diamond/jdt_load_red.png"
		},
		{
			x = 550,
			name = "jinjie_2",
			y = 100,
			type = "process",
			pic = "res/ui/weapon/diamond/jdt_load_green.png"
		},
		{
			fontSize = 20,
			name = "lv",
			type = "label",
			y = 125,
			x = 430,
			text = language.get(122060, 0),
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "percent",
			text = "50%",
			type = "label",
			y = 125,
			x = 670,
			color = ccc3(227, 194, 152)
		}
	}
}

function getDiamondData()
	return var_0_0
end
