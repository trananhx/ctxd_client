local var_0_0 = class("kfmgReadyUiData")

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
				pic = "res/ui/kfmg/kfmgReady/text/kfmgz_cbyj_meishuzi_jfmgzcbjd.png",
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
		y = 290,
		x = 480,
		type = "pic",
		pic = "res/ui/kfmg/kfmgReady/kfmgz_cbyj_bg_2.png",
		children = {
			{
				y = 420,
				x = 350,
				scale = 0.5,
				type = "pic",
				pic = "res/ui/kfmg/kfmgReady/kfmg_building.png"
			},
			{
				fontSize = 20,
				y = 420,
				type = "label",
				x = 430,
				text = language.get("hw_kfmg_000009"),
				color = colorForce[1]
			},
			{
				y = 270,
				x = 90,
				scale = 0.5,
				type = "pic",
				pic = "res/ui/kfmg/kfmgReady/kfmg_building.png"
			},
			{
				fontSize = 20,
				y = 270,
				type = "label",
				x = 170,
				text = language.get("hw_kfmg_000010"),
				color = colorForce[2]
			},
			{
				y = 290,
				x = 300,
				scale = 0.5,
				type = "pic",
				pic = "res/ui/kfmg/kfmgReady/kfmg_building.png"
			},
			{
				fontSize = 20,
				y = 290,
				type = "label",
				x = 380,
				text = language.get("hw_kfmg_000012"),
				color = colorForce[104]
			},
			{
				y = 170,
				x = 425,
				scale = 0.5,
				type = "pic",
				pic = "res/ui/kfmg/kfmgReady/kfmg_building.png"
			},
			{
				fontSize = 20,
				y = 170,
				type = "label",
				x = 505,
				text = language.get("hw_kfmg_000011"),
				color = colorForce[3]
			},
			{
				xcenter = -188,
				name = "maxReward_bg",
				y = 70,
				type = "pic",
				pic = "res/ui/kfmg/kfmgReady/kfmgz_cbyj_bg_zuo_1.png",
				children = {
					{
						xcenter = 0,
						name = "maxReward_bg2",
						type = "pic",
						ycenter = 0,
						pic = "res/ui/kfmg/kfmgReady/kfmgz_cbyj_bg_zuo_2.png"
					},
					{
						x = 67,
						y = 100,
						pic = "res/ui/kfmg/kfmgReady/text/kfmgz_cbyj_meishuzi_scjl.png",
						type = "pic"
					},
					{
						x = 300,
						y = 102,
						pic = "res/ui/kfmg/kfmgReady/kfmgz_cbyj_icon_xingxing.png",
						type = "pic"
					},
					{
						x = 330,
						y = 102,
						pic = "res/ui/kfmg/kfmgReady/kfmgz_cbyj_icon_xingxing.png",
						type = "pic"
					},
					{
						x = 360,
						y = 102,
						pic = "res/ui/kfmg/kfmgReady/kfmgz_cbyj_icon_xingxing.png",
						type = "pic"
					},
					{
						y = 102,
						h = 42,
						type = "button",
						w = 42,
						x = 515,
						buttons = {
							{
								pic2 = "frame:btnTip_c.png",
								name = "tipsBtnReward",
								pic1 = "frame:btnTip_a.png"
							}
						}
					}
				}
			},
			{
				xcenter = 270,
				type = "pic",
				ycenter = -36,
				pic = "res/ui/kfmg/kfmgReady/kfmgz_cbyj_bg_you_1.png",
				children = {
					{
						xcenter = -62,
						height = 23,
						name = "cd_h",
						type = "atlas",
						pic = "res/ui/kfmg/kfmgReady/text/kfmgz_cbyj_daojishi.png",
						text = "00",
						y = 407,
						startChar = 48,
						width = 18
					},
					{
						xcenter = 0,
						height = 23,
						name = "cd_m",
						type = "atlas",
						pic = "res/ui/kfmg/kfmgReady/text/kfmgz_cbyj_daojishi.png",
						text = "00",
						y = 407,
						startChar = 48,
						width = 18
					},
					{
						xcenter = 60,
						height = 23,
						name = "cd_s",
						type = "atlas",
						pic = "res/ui/kfmg/kfmgReady/text/kfmgz_cbyj_daojishi.png",
						text = "00",
						y = 407,
						startChar = 48,
						width = 18
					},
					{
						xcenter = 0,
						y = 362,
						pic = "res/ui/kfmg/kfmgReady/text/kfmgz_cbyj_meishuzi_jzzzl.png",
						type = "pic"
					},
					{
						xcenter = 160,
						y = 361,
						h = 42,
						type = "button",
						w = 42,
						buttons = {
							{
								pic2 = "frame:btnTip_c.png",
								name = "tipsBtnZZ",
								pic1 = "frame:btnTip_a.png"
							}
						}
					},
					{
						xcenter = -152,
						y = 296,
						scale = 0.6,
						type = "pic",
						pic = "res/ui/kfmg/kfmgReady/kfyz_view_zhengzhaoling.png"
					},
					{
						xcenter = 27,
						y = 292,
						type = "pic",
						pic = "res/ui/kfmg/kfmgReady/kfmgz_cbyj_jingyan_1.png",
						children = {
							{
								xcenter = -3,
								name = "zhengzhaoProcess",
								percentage = 0,
								type = "process",
								ycenter = 4,
								pic = "res/ui/kfmg/kfmgReady/kfmgz_cbyj_jingyan_2.png"
							},
							{
								text = "0/0",
								name = "zhengzhaoNum",
								fontSize = 18,
								type = "label",
								ycenter = 4,
								xcenter = 0,
								percentage = 0,
								align = kCCTextAlignmentCenter
							},
							{
								xcenter = 70,
								name = "zhengzhaoFinish",
								type = "pic",
								ycenter = -30,
								pic = "res/ui/kfmg/kfmgReady/kfmgz_cbyj_icon_wc.png"
							}
						}
					},
					{
						xcenter = 0,
						y = 240,
						type = "button",
						buttons = {
							{
								pic2 = "res/ui/common/button/sdyjs_btn_03_c.png",
								name = "zhengzhaoButton",
								pic1 = "res/ui/common/button/sdyjs_btn_03.png",
								children = {
									{
										xcenter = -5,
										ycenter = 5,
										pic = "res/ui/kfmg/kfmgReady/text/kfmgz_cbyj_meishuzi_jz.png",
										type = "pic"
									},
									{
										y = -5,
										x = 70,
										scale = 0.7,
										type = "pic",
										pic = "frame:res_icon_19.png"
									},
									{
										fontSize = 18,
										name = "zhengzhaoGoldNum",
										anchorPointX = 0,
										type = "label",
										text = "200",
										y = -5,
										x = 95
									}
								}
							}
						}
					},
					{
						xcenter = 0,
						y = 174,
						pic = "res/ui/kfmg/kfmgReady/text/kfmgz_cbyj_meishuzi_jzzb.png",
						type = "pic"
					},
					{
						xcenter = -152,
						y = 114,
						scale = 0.6,
						type = "pic",
						pic = "res/ui/kfmg/kfmgReady/kfyz_view_yingzi.png"
					},
					{
						xcenter = 27,
						y = 110,
						type = "pic",
						pic = "res/ui/kfmg/kfmgReady/kfmgz_cbyj_jingyan_1.png",
						children = {
							{
								xcenter = -3,
								name = "phantomProcess",
								percentage = 0,
								type = "process",
								ycenter = 4,
								pic = "res/ui/kfmg/kfmgReady/kfmgz_cbyj_jingyan_2.png"
							},
							{
								text = "0/0",
								name = "phantomNum",
								fontSize = 18,
								type = "label",
								ycenter = 4,
								xcenter = 0,
								percentage = 0,
								align = kCCTextAlignmentCenter
							},
							{
								xcenter = 70,
								name = "phantomFinish",
								type = "pic",
								ycenter = -30,
								pic = "res/ui/kfmg/kfmgReady/kfmgz_cbyj_icon_wc.png"
							}
						}
					},
					{
						xcenter = 0,
						y = 60,
						type = "button",
						new = true,
						buttons = {
							{
								pic2 = "res/ui/common/button/sdyjs_btn_03_c.png",
								name = "phantomButton",
								pic1 = "res/ui/common/button/sdyjs_btn_03.png",
								children = {
									{
										xcenter = -5,
										ycenter = 5,
										pic = "res/ui/kfmg/kfmgReady/text/kfmgz_cbyj_meishuzi_jz.png",
										type = "pic"
									},
									{
										x = 70,
										name = "phantomGoldIcon",
										y = -5,
										type = "pic",
										scale = 0.7,
										pic = "frame:res_icon_19.png"
									},
									{
										fontSize = 18,
										name = "phantomGoldNum",
										anchorPointX = 0,
										type = "label",
										text = "200",
										y = -5,
										x = 95
									},
									{
										text = "",
										name = "freePhantom",
										fontSize = 18,
										type = "label",
										y = -5,
										x = 95
									}
								}
							}
						}
					},
					{
						xcenter = 160,
						y = 173,
						h = 42,
						type = "button",
						w = 42,
						buttons = {
							{
								pic2 = "frame:btnTip_c.png",
								name = "tipsBtnYZ",
								pic1 = "frame:btnTip_a.png"
							}
						}
					}
				}
			}
		}
	})
	var_1_0(arg_1_0.data.background.children, {
		y = 510,
		h = 42,
		type = "button",
		w = 42,
		x = 907,
		buttons = {
			{
				pic2 = "frame:btnTip_c.png",
				name = "tipsBtnMain",
				pic1 = "frame:btnTip_a.png"
			}
		}
	})
end

function var_0_0.getData(arg_3_0)
	return arg_3_0.data or {}
end

return var_0_0
