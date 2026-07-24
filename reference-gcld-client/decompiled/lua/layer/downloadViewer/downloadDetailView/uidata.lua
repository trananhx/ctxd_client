local var_0_0 = class("downloadDetailViewUiData")

function var_0_0.ctor(arg_1_0, ...)
	arg_1_0.data = {}
	arg_1_0.data.background = {
		xcenter = 0,
		ycenter = -30,
		type = "pic_9",
		pic = "frame:bigPanel.png",
		middleRect = CCRectMake(30, 30, 45, 45),
		preferedSize = CCSizeMake(960, 580),
		children = {
			{
				top = -20,
				right = 40,
				type = "button",
				buttons = {
					{
						pic2 = "frame:btn_close_c.png",
						name = "closeButton",
						pic1 = "frame:btn_close_a.png"
					}
				}
			},
			{
				xcenter = 0,
				name = "background_2",
				type = "pic",
				ycenter = 0,
				pic = "res/ui/comment/bg1.jpg",
				children = {
					{
						xcenter = 0,
						y = 490,
						pic = "res/ui/downloadViewer/xzyl.png",
						type = "pic"
					},
					{
						xcenter = 0,
						name = "tableViewBackground",
						y = 300,
						type = "pic",
						pic = "res/ui/downloadViewer/tupiandi.jpg"
					},
					{
						anchorPointX = 0,
						name = "hand",
						x = 800,
						type = "pic",
						y = 240,
						anchorPointY = 1,
						pic = "res/ui/downloadViewer/fubenDituShouzhi.PNG"
					},
					{
						xcenter = 0,
						name = "downloadTipPic",
						y = 95,
						type = "pic",
						visible = false,
						scale = 0.95,
						pic = "res/ui/downloadViewer/shuomingwenzi.png"
					},
					{
						xcenter = 0,
						name = "progressBarBackground",
						y = 95,
						type = "pic",
						visible = false,
						scale = 0.95,
						pic = "res/ui/downloadViewer/jdtd.png",
						children = {
							{
								xcenter = 0,
								z = 102,
								alphaThreshold = 0,
								type = "clipping_node",
								ycenter = 0,
								mask = "res/ui/downloadViewer/jdtd.png",
								children = {
									{
										x = 0,
										name = "progressLight",
										anchorPointX = 0.924812030075188,
										type = "pic",
										ycenter = 0,
										pic = "res/ui/downloadViewer/guang.png"
									}
								}
							},
							{
								xcenter = 0,
								name = "downloadProgress",
								z = 101,
								type = "process",
								ycenter = 0,
								pic = "res/ui/downloadViewer/jdt.png"
							},
							{
								left = -10,
								z = 103,
								type = "pic",
								ycenter = 0,
								pic = "res/ui/downloadViewer/zs.png"
							},
							{
								z = 103,
								name = "zs_right",
								type = "pic",
								ycenter = 0,
								pic = "res/ui/downloadViewer/zs.png",
								right = -10
							}
						}
					},
					{
						fontSize = 22,
						type = "label",
						strokeSize = 1,
						anchorPointX = 0,
						font = "",
						y = 42,
						anchorPointY = 0,
						x = 40,
						text = language.get("620007_TJXS"),
						align = kCCTextAlignmentLeft,
						color = colorText.TJ_Yellow,
						children = {
							{
								fontSize = 22,
								name = "packSizeLabel",
								type = "label",
								anchorPointX = 0,
								text = "0",
								font = "",
								anchorPointY = 0,
								strokeSize = 1,
								right = -15,
								align = kCCTextAlignmentLeft
							}
						}
					},
					{
						fontSize = 22,
						type = "label",
						strokeSize = 1,
						anchorPointX = 0,
						font = "",
						y = 38,
						anchorPointY = 1,
						x = 40,
						text = language.get("620008_TJXS"),
						align = kCCTextAlignmentLeft,
						color = colorText.TJ_Yellow
					},
					{
						fontSize = 24,
						name = "rewardsTipsLabel",
						type = "label",
						anchorPointX = 1,
						strokeSize = 1,
						font = "",
						y = 40,
						anchorPointY = 0.5,
						x = 810,
						text = language.get("620009_TJXS"),
						align = kCCTextAlignmentRight,
						color = colorText.TJ_Yellow
					},
					{
						type = "pic_9",
						name = "rewardTipsBackground",
						visible = false,
						anchorPointX = 1,
						pic = "frame:common_tip_frame_small.png",
						y = 170,
						anchorPointY = 0,
						x = 820,
						middleRect = CCRectMake(24, 24, 1, 1),
						preferedSize = CCSizeMake(20, 20),
						children = {
							{
								x = 0,
								name = "rewardTipsNode",
								y = 0,
								type = "pic",
								pic = ""
							}
						}
					},
					{
						xcenter = 0,
						y = 35,
						type = "button",
						buttons = {
							{
								pic2 = "res/ui/common/button/public_btn_green_c.png",
								name = "actionButton",
								pic1 = "res/ui/common/button/public_btn_green.png"
							}
						}
					},
					{
						fontSize = 25,
						name = "actionButtonLabel",
						xcenter = 0,
						type = "label",
						text = "",
						font = "",
						y = 38,
						strokeSize = 1,
						color = colorText[10004]
					}
				}
			}
		}
	}
end

function var_0_0.getData(arg_2_0)
	return arg_2_0.data or {}
end

return var_0_0
