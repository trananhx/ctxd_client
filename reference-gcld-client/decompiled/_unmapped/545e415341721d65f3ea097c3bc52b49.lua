local var_0_0 = {
	bg = {
		xcenter = 0,
		name = "bg",
		type = "pic_9",
		ycenter = -28,
		pic = "frame:bigPanel.png",
		middleRect = CCRectMake(30, 30, 45, 45),
		preferedSize = CCSizeMake(960, 581),
		children = {
			{
				xcenter = 0,
				name = "bg2",
				type = "pic",
				ycenter = 0,
				pic = "res/ui/activity/acti_view_bg.jpg",
				children = {
					{
						x = 530,
						name = "title",
						y = 500,
						type = "pic",
						pic = "res/ui/firstPayActivity/acti_tit_shcchzh.png"
					},
					{
						x = 610,
						name = "item_bg_1",
						y = 315,
						type = "pic",
						pic = "res/ui/firstPayActivity/acti_list.png",
						children = {
							{
								x = 70,
								name = "item_bg_1",
								y = 65,
								type = "pic",
								pic = "frame:general_background_light.png"
							},
							{
								x = 70,
								name = "item_icon_1",
								y = 65,
								type = "pic",
								pic = "res/ui/firstPayActivity/icon_mc.png"
							},
							{
								fontSize = 24,
								name = "item_title_1",
								x = 330,
								type = "label",
								y = 80,
								strokeSize = 2,
								text = language.get(350003, 50000),
								color = ccc3(219, 248, 8),
								strokeColor = colorText[10005]
							},
							{
								fontSize = 24,
								name = "item_title_11",
								type = "label",
								y = 50,
								strokeSize = 2,
								x = 330,
								text = language.get(350007),
								strokeColor = colorText[10005]
							}
						}
					},
					{
						x = 610,
						name = "item_bg_2",
						y = 225,
						type = "pic",
						pic = "res/ui/firstPayActivity/acti_list.png",
						children = {
							{
								x = 70,
								name = "item_bg_2",
								y = 65,
								type = "pic",
								pic = "frame:general_background_light.png"
							},
							{
								x = 70,
								name = "item_icon_2",
								y = 65,
								type = "pic",
								pic = "res/ui/firstPayActivity/icon_yb.png"
							},
							{
								fontSize = 24,
								name = "item_title_2",
								x = 330,
								type = "label",
								y = 80,
								strokeSize = 2,
								text = language.get(350004, 50000),
								color = ccc3(219, 248, 8),
								strokeColor = colorText[10005]
							},
							{
								fontSize = 24,
								name = "item_title_22",
								type = "label",
								y = 50,
								strokeSize = 2,
								x = 330,
								text = language.get(350008),
								strokeColor = colorText[10005]
							}
						}
					},
					{
						x = 610,
						name = "item_bg_3",
						y = 135,
						type = "pic",
						pic = "res/ui/firstPayActivity/acti_list.png",
						children = {
							{
								x = 70,
								name = "item_bg_3",
								y = 65,
								type = "pic",
								pic = "frame:general_background_light.png"
							},
							{
								x = 70,
								name = "item_icon_3",
								y = 65,
								type = "pic",
								pic = "res/ui/firstPayActivity/icon_hjch.png"
							},
							{
								fontSize = 24,
								name = "item_title_3",
								x = 330,
								type = "label",
								y = 80,
								strokeSize = 2,
								text = language.get(350005, 50),
								color = ccc3(219, 248, 8),
								strokeColor = colorText[10005]
							},
							{
								fontSize = 24,
								name = "item_title_33",
								type = "label",
								y = 50,
								strokeSize = 2,
								x = 330,
								text = language.get(350009),
								strokeColor = colorText[10005]
							}
						}
					},
					{
						x = 610,
						name = "item_bg_4",
						y = 45,
						type = "pic",
						pic = "res/ui/firstPayActivity/acti_list.png",
						children = {
							{
								x = 70,
								name = "item_bg_4",
								y = 65,
								type = "pic",
								pic = "frame:general_background_light.png"
							},
							{
								x = 70,
								name = "item_icon_4",
								y = 65,
								type = "pic",
								pic = "res/ui/firstPayActivity/icon_mbl.png"
							},
							{
								fontSize = 24,
								name = "item_title_4",
								x = 330,
								type = "label",
								y = 80,
								strokeSize = 2,
								text = language.get(350006, 50),
								color = ccc3(219, 248, 8),
								strokeColor = colorText[10005]
							},
							{
								fontSize = 24,
								name = "item_title_44",
								type = "label",
								y = 50,
								strokeSize = 2,
								x = 330,
								text = language.get(350010),
								strokeColor = colorText[10005]
							}
						}
					},
					{
						type = "button",
						buttons = {
							{
								pic2 = "frame:btn_close_c.png",
								name = "btn_exit",
								pic1 = "frame:btn_close_a.png",
								y = 595,
								x = 908
							},
							{
								pic2 = "frame:btn3_gre_c.png",
								name = "btn_chong",
								pic1 = "frame:btn3_gre_a.png",
								y = 415,
								x = 750
							}
						}
					},
					{
						fontSize = 20,
						name = "title_chong",
						x = 750,
						type = "label",
						y = 415,
						strokeSize = 2,
						text = language.get(142011),
						color = colorText[10004],
						strokeColor = colorText[10005]
					}
				}
			}
		}
	}
}

function getFirstPayActivityData()
	return var_0_0
end
