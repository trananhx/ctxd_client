local var_0_0 = class("kfmgRewardUiData")

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
				pic = "res/ui/kfmg/kfmgReady/text/kfmgz_mgjl_meishuzi_mhjl.png",
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
				name = "getReward_panel",
				type = "pic",
				ycenter = -36,
				pic = "res/ui/kfmg/kfmgReady/kfmgz_mgjl_bg_you.png",
				children = {
					{
						xcenter = 0,
						y = 362,
						pic = "res/ui/kfmg/kfmgReady/text/kfmgz_mgjl_meishuzi_scjl.png",
						type = "pic"
					},
					{
						xcenter = 65,
						name = "def_result",
						type = "pic",
						ycenter = 45,
						pic = "frame:tuzhang_yiwancheng.png"
					},
					{
						xcenter = 0,
						name = "reward_tile",
						y = 188,
						type = "pic",
						pic = "res/ui/kfmg/kfmgReady/text/kfmgz_mgjl_meishuzi_jl_3.png"
					},
					{
						xcenter = 65,
						name = "atk_result",
						type = "pic",
						ycenter = -120,
						pic = "frame:tuzhang_yiwancheng.png"
					},
					{
						xcenter = 0,
						y = 34,
						type = "button",
						buttons = {
							{
								pic2 = "res/ui/kfmg/kfmgReady/kfmgz_cbyj_btn_c.png",
								name = "rewardButton",
								pic1 = "res/ui/kfmg/kfmgReady/kfmgz_cbyj_btn_a.png",
								visible = false,
								children = {
									{
										xcenter = 0,
										ycenter = 5,
										pic = "res/ui/kfmg/kfmgReady/text/kfmgz_cbyj_meishuzi_lqjl.png",
										type = "pic"
									}
								}
							}
						}
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
