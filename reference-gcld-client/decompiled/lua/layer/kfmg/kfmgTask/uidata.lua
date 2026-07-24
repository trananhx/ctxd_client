local var_0_0 = class("kfmgTaskUiData")

function var_0_0.ctor(arg_1_0, ...)
	local function var_1_0(arg_2_0, arg_2_1)
		arg_2_0[#arg_2_0 + 1] = arg_2_1

		return arg_2_1
	end

	arg_1_0.data = {}
	arg_1_0.data.background = {
		name = "backgroundPic",
		type = "pic_9",
		pic = "frame:bigPanel.png",
		preferedSize = CCSizeMake(960, 580),
		middleRect = CCRectMake(30, 30, 45, 45),
		x = visibleSize.width / 2,
		y = visibleSize.height / 2 - 30,
		children = {}
	}

	var_1_0(arg_1_0.data.background.children, {
		y = 290,
		x = 480,
		type = "pic",
		pic = "res/ui/kfmg/kfmgz_bg_1.png",
		children = {
			{
				xcenter = 0,
				y = 500,
				pic = "res/ui/kfmg/kfmgTask/text/kfmgz_yzrw_meishuzi_mgrw.png",
				type = "pic"
			}
		}
	})
	var_1_0(arg_1_0.data.background.children, {
		y = 604,
		x = 924,
		type = "button",
		buttons = {
			{
				pic2 = "frame:btn_close_c.png",
				name = "closeButton",
				pic1 = "frame:btn_close_a.png",
				scale = 2
			}
		}
	})
	var_1_0(arg_1_0.data.background.children, {
		xcenter = 0,
		y = 255,
		type = "pic",
		pic = "res/ui/kfmg/kfmgTask/kfmgz_yzrw_bg.png",
		children = {
			{
				x = 15,
				anchorPointX = 0,
				y = 442,
				type = "pic",
				pic = "res/ui/kfmg/kfmgTask/text/kfmgz_yzrw_meishuzi_mgsd.png"
			},
			{
				x = 25,
				anchorPointX = 0,
				y = 395,
				type = "pic",
				pic = "res/ui/kfmg/kfmgTask/text/kfmgz_yzrw_meishuzi_mb.png"
			},
			{
				name = "killNum",
				fontSize = 22,
				type = "label",
				anchorPointX = 0,
				x = 100,
				y = 395,
				text = language.get("hw_kfmg_000024", 0),
				color = colorText.TJ_White
			},
			{
				name = "processLabel",
				fontSize = 22,
				type = "label",
				anchorPointX = 1,
				x = 850,
				y = 395,
				text = language.get("hw_kfmg_000025", 0, 0),
				color = colorText.TJ_White
			},
			{
				x = 25,
				anchorPointX = 0,
				y = 325,
				type = "pic",
				pic = "res/ui/kfmg/kfmgTask/text/kfmgz_yzrw_meishuzi_jl.png"
			},
			{
				anchorPointX = 0,
				name = "rewardIcon_1",
				x = 90,
				type = "pic",
				y = 325,
				pic = "frame:icon_iron.png"
			},
			{
				text = "",
				name = "rewardLabel_1",
				fontSize = 22,
				type = "label",
				anchorPointX = 0,
				x = 140,
				y = 325,
				color = colorText.TJ_White
			},
			{
				y = 325,
				type = "button",
				new = true,
				x = 780,
				buttons = {
					{
						pic2 = "res/ui/common/button/public_btn_green_c.png",
						name = "jiasuButton",
						pic1 = "res/ui/common/button/public_btn_green.png",
						children = {
							{
								xcenter = 0,
								fontSize = 22,
								type = "label",
								ycenter = 5,
								text = language.get("hw_kfmg_000026"),
								color = colorText.TJ_Yellow
							}
						}
					}
				}
			},
			{
				y = 325,
				type = "button",
				new = true,
				x = 590,
				buttons = {
					{
						pic2 = "res/ui/common/button/public_btn_green_c.png",
						name = "rewardButton_1",
						pic1 = "res/ui/common/button/public_btn_green.png",
						visible = false,
						children = {
							{
								xcenter = 0,
								fontSize = 22,
								type = "label",
								ycenter = 5,
								text = language.get(92013),
								color = colorText.TJ_Yellow
							}
						}
					}
				}
			},
			{
				visible = false,
				name = "success_1",
				x = 590,
				type = "pic",
				y = 325,
				pic = "frame:tuzhang_yiwancheng.png"
			},
			{
				anchorPointX = 0,
				name = "processFrame",
				x = 95,
				type = "pic",
				y = 365,
				pic = "res/ui/kfmg/kfmgTask/kfmgz_yzrw_jindutiao_1.png",
				children = {
					{
						xcenter = -3,
						name = "process_1",
						percentage = 0,
						type = "process",
						ycenter = 4,
						pic = "res/ui/kfmg/kfmgTask/kfmgz_yzrw_jindutiao_2.png"
					}
				}
			},
			{
				x = 15,
				anchorPointX = 0,
				y = 272,
				type = "pic",
				pic = "res/ui/kfmg/kfmgTask/text/kfmgz_yzrw_meishuzi_zzrw.png"
			},
			{
				y = 120,
				x = 163,
				type = "pic",
				pic = "",
				children = {
					{
						xcenter = 0,
						ycenter = 94,
						pic = "res/ui/kfmg/kfmgTask/text/kfmgz_yzrw_meishuzi_rw1.png",
						type = "pic"
					},
					{
						x = -124,
						anchorPointX = 0,
						y = -13,
						type = "pic",
						pic = "res/ui/kfmg/kfmgTask/text/kfmgz_yzrw_meishuzi_jl.png"
					},
					{
						anchorPointX = 0,
						name = "rewardIcon_2",
						x = -43,
						type = "pic",
						y = -13,
						pic = "frame:icon_iron.png"
					},
					{
						text = "",
						name = "renwu_2",
						fontSize = 22,
						type = "label",
						anchorPointX = 0,
						x = -124,
						y = 26,
						color = colorText.TJ_White
					},
					{
						text = "",
						name = "renwuNum_2",
						fontSize = 22,
						type = "label",
						anchorPointX = 1,
						x = 107,
						y = 26,
						color = colorText.TJ_White
					},
					{
						text = "",
						name = "rewardLabel_2",
						fontSize = 22,
						type = "label",
						anchorPointX = 0,
						x = 7,
						y = -13,
						color = colorText.TJ_Yellow
					},
					{
						xcenter = 0,
						new = true,
						type = "button",
						ycenter = -77,
						buttons = {
							{
								pic2 = "res/ui/kfmg/kfmgTask/kfmgz_yzrw_btn_c.png",
								name = "rewardButton_2",
								pic1 = "res/ui/kfmg/kfmgTask/kfmgz_yzrw_btn_a.png",
								visible = false,
								children = {
									{
										xcenter = 0,
										ycenter = 0,
										pic = "res/ui/kfmg/kfmgTask/text/kfmgz_yzrw_meishuzi_lqjl.png",
										type = "pic"
									}
								}
							}
						}
					},
					{
						xcenter = 0,
						name = "success_2",
						visible = false,
						type = "pic",
						ycenter = -77,
						pic = "frame:tuzhang_yiwancheng.png"
					}
				}
			},
			{
				y = 120,
				x = 462,
				type = "pic",
				pic = "",
				children = {
					{
						xcenter = 0,
						ycenter = 94,
						pic = "res/ui/kfmg/kfmgTask/text/kfmgz_yzrw_meishuzi_rw2.png",
						type = "pic"
					},
					{
						x = -124,
						anchorPointX = 0,
						y = -13,
						type = "pic",
						pic = "res/ui/kfmg/kfmgTask/text/kfmgz_yzrw_meishuzi_jl.png"
					},
					{
						anchorPointX = 0,
						name = "rewardIcon_3",
						x = -43,
						type = "pic",
						y = -13,
						pic = "frame:icon_iron.png"
					},
					{
						text = "",
						name = "renwu_3",
						fontSize = 22,
						type = "label",
						anchorPointX = 0,
						x = -124,
						y = 26,
						color = colorText.TJ_White
					},
					{
						text = "",
						name = "renwuNum_3",
						fontSize = 22,
						type = "label",
						anchorPointX = 1,
						x = 107,
						y = 26,
						color = colorText.TJ_White
					},
					{
						text = "",
						name = "rewardLabel_3",
						fontSize = 22,
						type = "label",
						anchorPointX = 0,
						x = 7,
						y = -13,
						color = colorText.TJ_Yellow
					},
					{
						xcenter = 0,
						new = true,
						type = "button",
						ycenter = -77,
						buttons = {
							{
								pic2 = "res/ui/kfmg/kfmgTask/kfmgz_yzrw_btn_c.png",
								name = "rewardButton_3",
								pic1 = "res/ui/kfmg/kfmgTask/kfmgz_yzrw_btn_a.png",
								visible = false,
								children = {
									{
										xcenter = 0,
										ycenter = 0,
										pic = "res/ui/kfmg/kfmgTask/text/kfmgz_yzrw_meishuzi_lqjl.png",
										type = "pic"
									}
								}
							}
						}
					},
					{
						xcenter = 0,
						name = "success_3",
						visible = false,
						type = "pic",
						ycenter = -77,
						pic = "frame:tuzhang_yiwancheng.png"
					}
				}
			},
			{
				y = 120,
				x = 761,
				type = "pic",
				pic = "",
				children = {
					{
						xcenter = 0,
						ycenter = 94,
						pic = "res/ui/kfmg/kfmgTask/text/kfmgz_yzrw_meishuzi_rw3.png",
						type = "pic"
					},
					{
						x = -124,
						anchorPointX = 0,
						y = -13,
						type = "pic",
						pic = "res/ui/kfmg/kfmgTask/text/kfmgz_yzrw_meishuzi_jl.png"
					},
					{
						anchorPointX = 0,
						name = "rewardIcon_4",
						x = -43,
						type = "pic",
						y = -13,
						pic = "frame:icon_iron.png"
					},
					{
						text = "",
						name = "renwu_4",
						fontSize = 22,
						type = "label",
						anchorPointX = 0,
						x = -124,
						y = 26,
						color = colorText.TJ_White
					},
					{
						text = "",
						name = "renwuNum_4",
						fontSize = 22,
						type = "label",
						anchorPointX = 1,
						x = 107,
						y = 26,
						color = colorText.TJ_White
					},
					{
						text = "",
						name = "rewardLabel_4",
						fontSize = 22,
						type = "label",
						anchorPointX = 0,
						x = 7,
						y = -13,
						color = colorText.TJ_Yellow
					},
					{
						xcenter = 0,
						new = true,
						type = "button",
						ycenter = -77,
						buttons = {
							{
								pic2 = "res/ui/kfmg/kfmgTask/kfmgz_yzrw_btn_c.png",
								name = "rewardButton_4",
								pic1 = "res/ui/kfmg/kfmgTask/kfmgz_yzrw_btn_a.png",
								visible = false,
								children = {
									{
										xcenter = 0,
										ycenter = 0,
										pic = "res/ui/kfmg/kfmgTask/text/kfmgz_yzrw_meishuzi_lqjl.png",
										type = "pic"
									}
								}
							}
						}
					},
					{
						xcenter = 0,
						name = "success_4",
						visible = false,
						type = "pic",
						ycenter = -77,
						pic = "frame:tuzhang_yiwancheng.png"
					}
				}
			}
		}
	})
end

function var_0_0.getData(arg_3_0)
	return arg_3_0.data or {}
end

return var_0_0
