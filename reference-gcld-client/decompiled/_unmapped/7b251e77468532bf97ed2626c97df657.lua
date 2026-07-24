local var_0_0 = {}
local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.yinPingLabelX = 20
else
	var_0_1.yinPingLabelX = 0
end

local var_0_2 = {
	213,
	800,
	650
}
local var_0_3 = {
	278,
	400,
	120
}

var_0_0.bg = {
	xcenter = 0,
	name = "bg",
	type = "pic",
	ycenter = -30,
	pic = "res/ui/playerInfo/setting/set_view_bg.jpg",
	children = {
		{
			x = 100,
			name = "tab_1",
			y = 460,
			type = "pic",
			pic = "res/ui/playerInfo/setting/set_navi_view_bg.png"
		},
		{
			x = 250,
			name = "tab_2",
			y = 460,
			type = "pic",
			pic = "res/ui/playerInfo/setting/set_navi_view_bg.png"
		},
		{
			x = 400,
			name = "tab_3",
			y = 460,
			type = "pic",
			pic = "res/ui/playerInfo/setting/set_navi_view_bg.png"
		},
		{
			x = 550,
			name = "tab_4",
			y = 460,
			type = "pic",
			pic = "res/ui/playerInfo/setting/set_navi_view_bg.png"
		},
		{
			x = 700,
			name = "tab_5",
			y = 460,
			type = "pic",
			visible = false,
			pic = "res/ui/playerInfo/setting/set_navi_view_bg.png"
		},
		{
			x = 458,
			name = "pane_4",
			y = 217,
			type = "pic",
			pic = "res/ui/playerInfo/setting/set_navi_con_bg.jpg",
			children = {
				{
					x = 441,
					name = "lb_bg",
					y = 200,
					type = "pic",
					pic = "res/ui/playerInfo/setting/set_lb_view_bg.jpg"
				},
				{
					fontSize = 20,
					name = "lb_name",
					type = "label",
					y = 335,
					x = 125,
					text = language.get(143027),
					color = ccc3(237, 209, 169)
				},
				{
					fontSize = 20,
					name = "lb_des",
					type = "label",
					y = 335,
					x = 441,
					text = language.get(143028),
					color = ccc3(237, 209, 169)
				},
				{
					fontSize = 20,
					name = "lb_status",
					type = "label",
					y = 335,
					x = 765,
					text = language.get(143029),
					color = ccc3(237, 209, 169)
				},
				{
					type = "button",
					buttons = {
						{
							pic2 = "frame:btn2_gre_c.png",
							name = "lb_btn_commit",
							pic1 = "frame:btn2_gre_a.png",
							y = 88,
							x = 760
						}
					}
				},
				{
					fontSize = 20,
					name = "lb_text_commit",
					x = 760,
					type = "label",
					y = 88,
					strokeSize = 2,
					text = language.get(143038),
					color = colorText[10004],
					strokeColor = colorText[10005]
				}
			}
		},
		{
			x = 458,
			name = "pane_1",
			y = 217,
			type = "pic",
			pic = "res/ui/playerInfo/setting/set_navi_con_bg.jpg",
			children = {
				{
					x = 441,
					name = "xf_bg",
					y = 200,
					type = "pic",
					pic = "res/ui/playerInfo/setting/set_xf_view_bg.jpg"
				},
				{
					fontSize = 20,
					name = "des",
					type = "label",
					y = 330,
					x = 150,
					text = language.get(143030),
					color = ccc3(188, 167, 145)
				},
				{
					type = "button",
					buttons = {
						{
							pic2 = "frame:btn2_gre_c.png",
							name = "xf_btn_all_yes",
							pic1 = "frame:btn2_gre_a.png",
							y = 330,
							x = 653
						},
						{
							pic2 = "frame:btn2_gre_c.png",
							name = "xf_btn_all_no",
							pic1 = "frame:btn2_gre_a.png",
							y = 330,
							x = 787
						}
					}
				},
				{
					fontSize = 20,
					name = "title_all_yes",
					x = 653,
					type = "label",
					y = 330,
					strokeSize = 2,
					text = language.get(143031),
					color = colorText[10004],
					strokeColor = colorText[10005]
				},
				{
					fontSize = 20,
					name = "title_all_no",
					x = 787,
					type = "label",
					y = 330,
					strokeSize = 2,
					text = language.get(143032),
					color = colorText[10004],
					strokeColor = colorText[10005]
				}
			}
		},
		{
			x = 458,
			name = "pane_5",
			y = 217,
			type = "pic",
			visible = false,
			pic = "res/ui/playerInfo/setting/set_navi_con_bg.jpg",
			children = {
				{
					x = 441,
					name = "yp_bg",
					y = 200,
					type = "pic",
					pic = "res/ui/playerInfo/setting/set_yp_view_bg.jpg"
				},
				{
					type = "button",
					buttons = {
						{
							pic2 = "frame:btn_check_1_a.png",
							name = "yp_btn_1",
							pic1 = "frame:btn_check_1_a.png",
							y = 150,
							x = 200
						},
						{
							pic2 = "frame:btn_check_1_a.png",
							name = "yp_btn_2",
							pic1 = "frame:btn_check_1_a.png",
							y = 260,
							x = 200
						}
					}
				},
				{
					x = 200,
					name = "yp_gou_1",
					y = 150,
					type = "pic",
					pic = "frame:btn_check_1_on.png"
				},
				{
					x = 200,
					name = "yp_gou_2",
					y = 260,
					type = "pic",
					pic = "frame:btn_check_1_on.png"
				},
				{
					fontSize = 20,
					name = "yp_title_1",
					type = "label",
					y = 150,
					text = language.get(143034),
					x = 250 + var_0_1.yinPingLabelX,
					color = ccc3(188, 167, 145)
				},
				{
					fontSize = 20,
					name = "yp_title_2",
					type = "label",
					y = 260,
					x = 250,
					text = language.get(143033),
					color = ccc3(188, 167, 145)
				}
			}
		},
		{
			x = 458,
			name = "pane_3",
			y = 217,
			type = "pic",
			pic = "res/ui/playerInfo/setting/set_navi_con_bg.jpg",
			children = {
				{
					x = 441,
					name = "dt_bg",
					y = 200,
					type = "pic",
					pic = "res/ui/playerInfo/setting/set_dt_view_bg.jpg"
				},
				{
					type = "button",
					buttons = {
						{
							pic2 = "res/ui/playerInfo/setting/set_dt_list_bg.jpg",
							name = "dt_bg_left",
							pic1 = "res/ui/playerInfo/setting/set_dt_list_bg.jpg",
							y = 200,
							x = 221
						},
						{
							pic2 = "res/ui/playerInfo/setting/set_dt_list_bg.jpg",
							name = "dt_bg_right",
							pic1 = "res/ui/playerInfo/setting/set_dt_list_bg.jpg",
							y = 200,
							x = 661
						}
					}
				},
				{
					x = 221,
					name = "dt_left",
					y = 200,
					type = "pic",
					pic = "res/ui/playerInfo/setting/set_dt_list_no.png"
				},
				{
					x = 661,
					name = "dt_right",
					y = 200,
					type = "pic",
					pic = "res/ui/playerInfo/setting/set_dt_list_yes.png"
				},
				{
					x = 221,
					name = "dt_select",
					y = 200,
					type = "pic",
					pic = "res/ui/playerInfo/setting/set_dt_list_on.png"
				}
			}
		},
		{
			x = 458,
			name = "pane_2",
			y = 217,
			type = "pic",
			pic = "res/ui/playerInfo/setting/set_navi_con_bg.jpg",
			children = {
				{
					x = 441,
					name = "fk_bg",
					y = 200,
					type = "pic",
					pic = "res/ui/playerInfo/setting/set_fk_view_bg.jpg"
				},
				{
					x = 441,
					name = "fk_input_bg",
					y = 230,
					type = "pic",
					pic = "res/ui/playerInfo/setting/set_fk_input_bg.jpg"
				},
				{
					fontSize = 30,
					name = "fk_input_label",
					text = "",
					type = "label",
					y = 230,
					x = 441,
					color = ccc3(107, 103, 89)
				},
				{
					fontSize = 22,
					name = "fk_playerJiaoliu",
					type = "label",
					y = 370,
					x = 350,
					text = language.get(143039),
					color = ccc3(188, 167, 145)
				},
				{
					fontSize = 22,
					name = "fk_qq2",
					text = "203102381",
					type = "label",
					y = 370,
					x = 475,
					color = ccc3(136, 211, 69)
				},
				{
					type = "button",
					buttons = {
						{
							pic2 = "frame:btn2_gre_c.png",
							name = "fk_btn_commit",
							pic1 = "frame:btn2_gre_a.png",
							y = 88,
							x = 760
						}
					}
				},
				{
					fontSize = 20,
					name = "fk_text_commit",
					x = 760,
					type = "label",
					y = 88,
					strokeSize = 2,
					text = language.get(143036),
					color = colorText[10004],
					strokeColor = colorText[10005]
				}
			}
		},
		{
			x = 100,
			name = "select_tab",
			y = 460,
			type = "pic",
			pic = "res/ui/playerInfo/setting/set_navi_view_on.png"
		},
		{
			type = "button",
			buttons = {
				{
					pic2 = "res/ui/playerInfo/setting/set_navi_lb_c.png",
					name = "btn_4",
					pic1 = "res/ui/playerInfo/setting/set_navi_lb.png",
					y = 460,
					tag = 4,
					x = 550
				},
				{
					pic2 = "res/ui/playerInfo/setting/set_navi_xf_c.png",
					name = "btn_1",
					pic1 = "res/ui/playerInfo/setting/set_navi_xf.png",
					y = 460,
					tag = 1,
					x = 100
				},
				{
					pic2 = "res/ui/playerInfo/setting/set_navi_yp_c.png",
					name = "btn_5",
					pic1 = "res/ui/playerInfo/setting/set_navi_yp.png",
					y = 460,
					tag = 5,
					x = 700
				},
				{
					pic2 = "res/ui/playerInfo/setting/set_navi_dt_c.png",
					name = "btn_3",
					pic1 = "res/ui/playerInfo/setting/set_navi_dt.png",
					y = 460,
					tag = 3,
					x = 400
				},
				{
					name = "btn_2",
					y = 460,
					tag = 2,
					x = 250,
					pic1 = (function()
						if conf.language == "xm" then
							return "res/ui/playerInfo/setting/set_navi_ujoy.png"
						end

						return "res/ui/playerInfo/setting/set_navi_fk.png"
					end)(),
					pic2 = (function()
						if conf.language == "xm" then
							return "res/ui/playerInfo/setting/set_navi_ujoyc.png"
						end

						return "res/ui/playerInfo/setting/set_navi_fk_c.png"
					end)()
				}
			}
		}
	}
}

local function var_0_4()
	var_0_0.bg.children[7].children[2].x = 250
end

function getSettingData()
	var_0_4()

	return var_0_0
end
