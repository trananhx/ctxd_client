return {
	widgets = {
		{
			name = "window",
			type = "sprite",
			swallowTouch = true,
			pic = {
				frame = true,
				path = "zhw_set1.png"
			},
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5,
			children = {
				{
					y = 390,
					name = "closeWindowButton",
					scale = 1.5,
					type = "button",
					style = "button_close",
					x = 840
				},
				{
					y = 160,
					name = "eventNode",
					x = 215,
					type = "node"
				},
				{
					y = 160,
					x = 215,
					type = "sprite",
					pic = {
						frame = true,
						path = "zhw_pic_list.png"
					}
				},
				{
					y = 323,
					style = "label_yellowish_22",
					type = "label",
					x = 135,
					textId = 340001
				},
				{
					text = "",
					name = "eventNum",
					y = 323,
					type = "label",
					style = "label_white_20",
					x = 225
				},
				{
					x = 485,
					y = 323,
					type = "sprite",
					pic = {
						frame = true,
						path = "zhw_heart.png"
					}
				},
				{
					fontSize = 26,
					style = "label_yellowish_24",
					y = 323,
					type = "label",
					x = 540,
					textId = 340003
				},
				{
					x = 680,
					name = "progressBarSprite",
					y = 323,
					type = "sprite",
					pic = {
						frame = true,
						path = "zhw_load_di.png"
					},
					children = {
						{
							y = 10,
							name = "progressBarNode",
							x = 0,
							type = "node"
						},
						{
							text = "",
							style = "label_white_20",
							name = "progressNumLabel",
							type = "label",
							y = 10,
							x = 113
						}
					}
				},
				{
					name = "getRewardButton",
					h = 54,
					type = "button",
					w = 125,
					y = 323,
					x = 740,
					normal = {
						frame = true,
						path = "btn2_gre_a.png"
					},
					touched = {
						frame = true,
						path = "btn2_gre_c.png"
					},
					label = {
						fontSize = 20,
						type = "label",
						strokeSize = 2,
						textId = 340004,
						color = ccc3(237, 209, 169),
						strokeColor = ccc3(33, 29, 23)
					}
				},
				{
					y = 90,
					x = 215,
					type = "sprite",
					pic = {
						frame = true,
						path = "zhw_pic_up.png"
					},
					children = {
						{
							text = "",
							name = "eventNameLabel",
							y = 80,
							type = "label",
							style = "label_white_20",
							x = 7,
							fontSize = 24,
							anchorPoint = ccp(0, 0.5)
						},
						{
							width = 297,
							height = 60,
							y = 7,
							type = "label",
							name = "eventDesc",
							text = "",
							style = "label_white_20",
							x = 7,
							halign = kCCTextAlignmentLeft,
							anchorPoint = ccp(0, 0)
						}
					}
				},
				{
					name = "option1",
					h = 125,
					type = "button",
					w = 393,
					y = 220,
					x = 610,
					normal = {
						frame = true,
						path = "zhw_opt_set_a.png"
					},
					touched = {
						frame = true,
						path = "zhw_opt_set_c.png"
					},
					children = {
						{
							y = 66,
							name = "generalHeadNode1",
							type = "sprite",
							x = 60,
							pic = {
								frame = true,
								path = "general_background.png"
							}
						},
						{
							width = 260,
							height = 60,
							y = 50,
							type = "label",
							name = "generalSayLabel1",
							text = "",
							style = "label_white_20",
							x = 110,
							halign = kCCTextAlignmentLeft,
							anchorPoint = ccp(0, 0)
						},
						{
							text = "",
							name = "rewardLabel1",
							y = 25,
							type = "label",
							style = "label_yellowish_20",
							x = 110,
							anchorPoint = ccp(0, 0)
						},
						{
							text = "",
							name = "goldConsum1",
							y = 25,
							type = "label",
							x = 270,
							anchorPoint = ccp(0, 0),
							color = ccc3(254, 203, 0)
						},
						{
							x = 300,
							name = "accept1",
							y = 45,
							type = "sprite",
							pic = {
								frame = true,
								path = "zhw_opt_set_cn.png"
							}
						}
					}
				},
				{
					name = "option2",
					h = 125,
					type = "button",
					w = 393,
					y = 85,
					x = 610,
					normal = {
						frame = true,
						path = "zhw_opt_set_a.png"
					},
					touched = {
						frame = true,
						path = "zhw_opt_set_c.png"
					},
					children = {
						{
							y = 66,
							name = "generalHeadNode2",
							type = "sprite",
							x = 60,
							pic = {
								frame = true,
								path = "general_background.png"
							}
						},
						{
							width = 260,
							height = 60,
							y = 50,
							type = "label",
							name = "generalSayLabel2",
							text = "",
							style = "label_white_20",
							x = 110,
							halign = kCCTextAlignmentLeft,
							anchorPoint = ccp(0, 0)
						},
						{
							text = "",
							name = "rewardLabel2",
							y = 25,
							type = "label",
							style = "label_yellowish_20",
							x = 110,
							anchorPoint = ccp(0, 0)
						},
						{
							text = "",
							name = "goldConsum2",
							y = 25,
							type = "label",
							x = 270,
							anchorPoint = ccp(0, 0),
							color = ccc3(254, 203, 0)
						},
						{
							x = 300,
							name = "accept2",
							y = 45,
							type = "sprite",
							pic = {
								frame = true,
								path = "zhw_opt_set_cn.png"
							}
						}
					}
				}
			}
		}
	}
}
