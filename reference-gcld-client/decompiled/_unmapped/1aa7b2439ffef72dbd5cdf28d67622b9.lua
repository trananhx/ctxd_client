local var_0_0 = {
	bg = {
		xcenter = 0,
		name = "bg",
		type = "pic_9",
		ycenter = -28,
		pic = "frame:bigPanel.png",
		middleRect = CCRectMake(30, 30, 45, 45),
		preferedSize = CCSizeMake(960, 580),
		children = {
			{
				xcenter = 0,
				name = "bg2",
				type = "pic_9",
				ycenter = 0,
				pic = "res/ui/noviceWanted/xs_view_1.png",
				middleRect = CCRectMake(30, 30, 45, 45),
				preferedSize = CCSizeMake(930, 550),
				children = {
					{
						x = 480,
						name = "title",
						y = 500,
						type = "pic",
						pic = "res/ui/noviceWanted/xs_xssj.png"
					},
					{
						xcenter = 0,
						name = "scroll_bg",
						type = "pic_9",
						ycenter = -100,
						pic = "res/ui/noviceWanted/xs_view_2.png",
						middleRect = CCRectMake(30, 30, 45, 45),
						preferedSize = CCSizeMake(875, 310)
					},
					{
						fontSize = 22,
						name = "title_timedown",
						x = 100,
						type = "label",
						text = "活动倒计时:",
						y = 450,
						strokeSize = 2,
						color = ccc3(166, 146, 101),
						strokeColor = ccc3(22, 18, 13)
					},
					{
						x = 850,
						name = "xiangzi",
						y = 450,
						type = "pic",
						pic = "res/ui/noviceWanted/xs_loading_bx.png"
					},
					{
						xcenter = 0,
						name = "bar_bg",
						type = "pic_9",
						ycenter = 130,
						pic = "res/ui/noviceWanted/xs_loading_di.png",
						middleRect = CCRectMake(25, 16, 6, 1),
						preferedSize = CCSizeMake(860, 33)
					},
					{
						type = "button",
						buttons = {
							{
								pic2 = "frame:btn_close_c.png",
								name = "btn_exit",
								pic1 = "frame:btn_close_a.png",
								y = 588,
								x = 908
							}
						}
					}
				}
			}
		}
	}
}

function getNoviceWantedActivityData()
	return var_0_0
end
