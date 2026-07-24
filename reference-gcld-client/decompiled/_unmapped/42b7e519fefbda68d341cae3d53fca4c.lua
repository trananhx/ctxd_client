local var_0_0 = {
	bg = {
		xcenter = 0,
		z = -100,
		name = "bg",
		type = "pic_9",
		ycenter = -28,
		pic = "frame:bigPanel.png",
		middleRect = CCRectMake(30, 30, 45, 45),
		preferedSize = CCSizeMake(960, 580),
		children = {
			{
				xcenter = 0,
				z = 10,
				name = "bg2",
				type = "pic_9",
				ycenter = 0,
				pic = "res/ui/general/jailView/comm_view_2.png",
				middleRect = CCRectMake(30, 30, 45, 45),
				preferedSize = CCSizeMake(930, 545),
				children = {
					{
						xcenter = 0,
						name = "bgTitle",
						z = 20,
						type = "pic",
						ycenter = 225,
						pic = "res/ui/dayTrain/comm_viewcaolian_tit_list.png",
						children = {
							{
								xcenter = 0,
								name = "caoLian",
								z = 30,
								type = "pic",
								ycenter = 0,
								pic = "res/ui/dayTrain/caolian_tit_mrcl.png"
							}
						}
					},
					{
						xcenter = 0,
						z = 20,
						name = "bgContent",
						type = "pic_9",
						ycenter = -35,
						pic = "res/ui/general/jailView/comm_view_laofang_1.png",
						middleRect = CCRectMake(30, 30, 45, 45),
						preferedSize = CCSizeMake(900, 455),
						children = {
							{
								xcenter = 0,
								name = "bgTrain",
								z = 30,
								type = "pic",
								ycenter = 0,
								pic = "res/ui/dayTrain/caolian_view_map.jpg"
							},
							{
								xcenter = -336,
								name = "bgPeople",
								z = 40,
								type = "pic",
								ycenter = -179,
								pic = "res/ui/dayTrain/caolian_peop_list.png",
								children = {
									{
										xcenter = 0,
										name = "zhuGeLiang",
										z = 60,
										type = "pic",
										ycenter = 35,
										pic = "res/ui/common/generalPic/generalPic_zhangliang.jpg"
									},
									{
										xcenter = 0,
										name = "vipView",
										type = "pic_9",
										z = 50,
										pic = "res/ui/selectPlayer/vip_port_view.jpg",
										ycenter = 35,
										middleRect = CCRectMake(30, 30, 45, 45),
										preferedSize = CCSizeMake(80, 80)
									},
									{
										xcenter = 0,
										z = 50,
										fontSize = 22,
										type = "label",
										ycenter = -20,
										width = 200,
										height = 0,
										font = "Thonburi",
										strokeSize = 2,
										text = language.get(320100),
										color = ccc3(0, 255, 0),
										strokeColor = ccc3(22, 18, 13)
									}
								}
							}
						}
					}
				}
			}
		}
	},
	closeMenu = {
		type = "button",
		buttons = {
			{
				pic2 = "frame:btn_close_c.png",
				name = "closeItem",
				pic1 = "frame:btn_close_a.png",
				top = 5,
				right = 5
			}
		}
	}
}

function getDayTrainData()
	return var_0_0
end
