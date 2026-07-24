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
				pic = "res/ui/clockReward/clock_title.png"
			},
			{
				fontSize = 20,
				name = "current_reward_time_title",
				type = "label",
				y = 255,
				width = 420,
				x = 280,
				height = 0,
				text = language.get(230007)
			},
			{
				x = 280,
				name = "current_reward_time_bg",
				y = 190,
				type = "pic",
				pic = "res/ui/clockReward/clock_reward_times_view.png"
			},
			{
				fontSize = 40,
				name = "current_reward_time_left",
				type = "label",
				y = 190,
				x = 230,
				text = language.get(230008)
			},
			{
				width = 32,
				height = 42,
				name = "current_reward_time_mid",
				type = "atlas",
				pic = "res/ui/common/number/clock_lucky_numb.png",
				text = "0",
				y = 190,
				startChar = 48,
				x = 280
			},
			{
				fontSize = 40,
				name = "current_reward_time_right",
				type = "label",
				y = 190,
				x = 330,
				text = language.get(230011)
			},
			{
				fontSize = 20,
				name = "current_reward_time_des",
				type = "label",
				y = 130,
				x = 280,
				text = language.get(230009)
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

function getClockRewardData()
	return var_0_0
end
