local var_0_0 = {}
local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.titleFntSize = -8
else
	var_0_1.titleFntSize = 0
end

local var_0_2 = 180
local var_0_3 = 180

var_0_0.bg = {
	xcenter = 0,
	name = "bg",
	down = 0,
	type = "pic",
	z = 1,
	pic = "res/ui/instance/bonus/fb_Bonus_view.png",
	children = {
		{
			type = "button",
			buttons = {
				{
					pic2 = "frame:btn_close_c.png",
					name = "closeItem",
					pic1 = "frame:btn_close_a.png",
					y = 170,
					x = 900
				}
			}
		},
		{
			name = "bg_1",
			y = 109,
			type = "pic",
			pic = "res/ui/instance/bonus/fb_Bonus_loading_di.png",
			x = var_0_2,
			children = {
				{
					y = 47,
					name = "general_1",
					z = 3,
					type = "pic",
					pic = "res/ui/instance/bonus/fb_Bonus_peop_lig.png",
					x = 47
				},
				{
					y = 18,
					name = "cishuBg_1",
					z = 4,
					type = "pic",
					pic = "res/ui/instance/bonus/fb_Bonus_list_nb.png",
					x = 90,
					children = {
						{
							width = 19,
							height = 20,
							name = "cishu_1",
							type = "atlas",
							pic = "res/ui/common/number/jianmieNum.png",
							text = "0",
							y = 23,
							startChar = 48,
							x = 23
						}
					}
				},
				{
					y = -30,
					name = "di_1",
					z = 5,
					type = "pic",
					pic = "res/ui/instance/bonus/fb_Bonus_list_consume.png",
					x = 47,
					children = {
						{
							y = 22,
							name = "icon_1",
							pic = "frame:btn_close_a.png",
							type = "pic",
							x = 30
						},
						{
							text = "16000",
							name = "value_1",
							y = 22,
							type = "label",
							fontSize = 24,
							x = 92
						}
					}
				},
				{
					y = 120,
					name = "top_1",
					z = 6,
					type = "pic",
					pic = "res/ui/instance/bonus/fb_Bonus_list_name.png",
					x = 47,
					children = {
						{
							text = "押送部将",
							name = "name_1",
							y = 15,
							type = "label",
							x = 58,
							fontSize = 22 + var_0_1.titleFntSize
						}
					}
				},
				{
					type = "button",
					buttons = {
						{
							pic2 = "default.png",
							name = "res_1",
							pic1 = "default.png",
							down = 47,
							tag = 1,
							x = 47
						}
					}
				}
			}
		},
		{
			name = "bg_2",
			y = 109,
			type = "pic",
			pic = "res/ui/instance/bonus/fb_Bonus_loading_di.png",
			x = var_0_2 + var_0_3,
			children = {
				{
					y = 47,
					name = "general_2",
					z = 3,
					type = "pic",
					pic = "res/ui/instance/bonus/fb_Bonus_peop_lig.png",
					x = 47
				},
				{
					y = 18,
					name = "cishuBg_2",
					z = 4,
					type = "pic",
					pic = "res/ui/instance/bonus/fb_Bonus_list_nb.png",
					x = 90,
					children = {
						{
							width = 19,
							height = 20,
							name = "cishu_2",
							type = "atlas",
							pic = "res/ui/common/number/jianmieNum.png",
							text = "0",
							y = 23,
							startChar = 48,
							x = 23
						}
					}
				},
				{
					y = -30,
					name = "di_2",
					z = 5,
					type = "pic",
					pic = "res/ui/instance/bonus/fb_Bonus_list_consume.png",
					x = 47,
					children = {
						{
							y = 22,
							name = "icon_2",
							pic = "frame:btn_close_a.png",
							type = "pic",
							x = 30
						},
						{
							text = "16000",
							name = "value_2",
							y = 22,
							type = "label",
							fontSize = 24,
							x = 92
						}
					}
				},
				{
					y = 120,
					name = "top_2",
					z = 6,
					type = "pic",
					pic = "res/ui/instance/bonus/fb_Bonus_list_name.png",
					x = 47,
					children = {
						{
							text = "押送部将",
							name = "name_2",
							y = 15,
							type = "label",
							x = 58,
							fontSize = 22 + var_0_1.titleFntSize
						}
					}
				},
				{
					type = "button",
					buttons = {
						{
							pic2 = "default.png",
							name = "res_2",
							pic1 = "default.png",
							down = 47,
							tag = 2,
							x = 47
						}
					}
				}
			}
		},
		{
			name = "bg_3",
			y = 109,
			type = "pic",
			pic = "res/ui/instance/bonus/fb_Bonus_loading_di.png",
			x = var_0_2 + 2 * var_0_3,
			children = {
				{
					y = 47,
					name = "general_3",
					z = 3,
					type = "pic",
					pic = "res/ui/instance/bonus/fb_Bonus_peop_lig.png",
					x = 47
				},
				{
					y = 18,
					name = "cishuBg_3",
					z = 4,
					type = "pic",
					pic = "res/ui/instance/bonus/fb_Bonus_list_nb.png",
					x = 90,
					children = {
						{
							width = 19,
							height = 20,
							name = "cishu_3",
							type = "atlas",
							pic = "res/ui/common/number/jianmieNum.png",
							text = "0",
							y = 23,
							startChar = 48,
							x = 23
						}
					}
				},
				{
					y = -30,
					name = "di_3",
					z = 5,
					type = "pic",
					pic = "res/ui/instance/bonus/fb_Bonus_list_consume.png",
					x = 47,
					children = {
						{
							y = 22,
							name = "icon_3",
							pic = "frame:btn_close_a.png",
							type = "pic",
							x = 30
						},
						{
							text = "16000",
							name = "value_3",
							y = 22,
							type = "label",
							fontSize = 24,
							x = 92
						}
					}
				},
				{
					y = 120,
					name = "top_3",
					z = 6,
					type = "pic",
					pic = "res/ui/instance/bonus/fb_Bonus_list_name.png",
					x = 47,
					children = {
						{
							text = "押送部将",
							name = "name_3",
							y = 15,
							type = "label",
							x = 58,
							fontSize = 22 + var_0_1.titleFntSize
						}
					}
				},
				{
					type = "button",
					buttons = {
						{
							pic2 = "default.png",
							name = "res_3",
							pic1 = "default.png",
							down = 47,
							tag = 3,
							x = 47
						}
					}
				}
			}
		},
		{
			name = "bg_4",
			y = 109,
			type = "pic",
			pic = "res/ui/instance/bonus/fb_Bonus_loading_di.png",
			x = var_0_2 + 3 * var_0_3,
			children = {
				{
					y = 47,
					name = "general_4",
					z = 3,
					type = "pic",
					pic = "res/ui/instance/bonus/fb_Bonus_peop_lig.png",
					x = 47
				},
				{
					y = 18,
					name = "cishuBg_4",
					z = 4,
					type = "pic",
					pic = "res/ui/instance/bonus/fb_Bonus_list_nb.png",
					x = 90,
					children = {
						{
							width = 19,
							height = 20,
							name = "cishu_4",
							type = "atlas",
							pic = "res/ui/common/number/jianmieNum.png",
							text = "0",
							y = 23,
							startChar = 48,
							x = 23
						}
					}
				},
				{
					y = -30,
					name = "di_4",
					z = 5,
					type = "pic",
					pic = "res/ui/instance/bonus/fb_Bonus_list_consume.png",
					x = 47,
					children = {
						{
							y = 22,
							name = "icon_4",
							pic = "frame:btn_close_a.png",
							type = "pic",
							x = 30
						},
						{
							text = "16000",
							name = "value_4",
							y = 22,
							type = "label",
							fontSize = 24,
							x = 92
						}
					}
				},
				{
					y = 120,
					name = "top_4",
					z = 6,
					type = "pic",
					pic = "res/ui/instance/bonus/fb_Bonus_list_name.png",
					x = 47,
					children = {
						{
							text = "押送部将",
							name = "name_4",
							y = 15,
							type = "label",
							x = 58,
							fontSize = 22 + var_0_1.titleFntSize
						}
					}
				},
				{
					type = "button",
					buttons = {
						{
							pic2 = "default.png",
							name = "res_4",
							pic1 = "default.png",
							down = 47,
							tag = 4,
							x = 47
						}
					}
				}
			}
		}
	}
}

function getfbBonusData()
	return var_0_0
end
