local var_0_0 = {
	bg = {
		xcenter = 0,
		name = "bg",
		type = "pic",
		ycenter = 0,
		pic = "res/ui/clockReward/clock_view_bg_public.png",
		children = {
			{
				x = 280,
				name = "current_reward_time_top",
				y = 340,
				type = "pic",
				pic = "res/ui/offlineBuff/lxjl_title.png"
			},
			{
				fontSize = 20,
				name = "current_reward_time_title",
				type = "label",
				y = 255,
				x = 250,
				text = language.get(320030),
				color = ccc3(204, 185, 134),
				children = {
					{
						text = "100%",
						name = "exp",
						fontSize = 22,
						type = "label",
						y = 0,
						x = 120,
						color = ccc3(94, 207, 64)
					}
				}
			},
			{
				x = 280,
				name = "current_reward_time_bg",
				y = 190,
				type = "pic",
				pic = "res/ui/weapon/gem_now_view_bg.jpg"
			},
			{
				x = 280,
				name = "expImage",
				y = 190,
				type = "pic",
				pic = "res/ui/offlineBuff/lx_buff_01.jpg"
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "frame:btn2_gre_c.png",
						name = "btn_linqu",
						pic1 = "frame:btn2_gre_a.png",
						y = 50,
						pic3 = "frame:btn2_gre_g.png",
						x = 280
					},
					{
						pic2 = "frame:btn2_gre_c.png",
						name = "btn_yes",
						pic1 = "frame:btn2_gre_a.png",
						y = 50,
						pic3 = "frame:btn2_gre_g.png",
						x = 280
					}
				}
			},
			{
				fontSize = 20,
				name = "title_btn",
				x = 280,
				type = "label",
				y = 50,
				strokeSize = 2,
				text = language.get(230010),
				color = colorText[10004],
				strokeColor = colorText[10005]
			}
		}
	}
}

function getOfflineBuffData()
	return var_0_0
end
