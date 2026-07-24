local var_0_0 = class("kfmgJunkuUiData")

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.ui = arg_1_1

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
		pic = "res/ui/kfmg/kfmgJunKu/kfmgz_jk_bg_2.png",
		children = {
			{
				xcenter = 0,
				ycenter = 0,
				pic = "res/ui/kfmg/kfmgJunKu/kfmgz_jk_bg_3.png",
				type = "pic"
			},
			{
				xcenter = 0,
				y = 515,
				pic = "res/ui/kfmg/kfmgJunKu/text/kfmgz_jk_meishuzi_jk.png",
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

	local var_1_1 = {
		"res/ui/kfmg/kfmgJunKu/kfmgz_jk_jiaobiao_guowang.png",
		"res/ui/kfmg/kfmgJunKu/kfmgz_jk_jiaobiao_yipin.png",
		"",
		""
	}

	for iter_1_0 = 1, 4 do
		var_1_0(arg_1_0.data.background.children, {
			y = 227,
			type = "pic",
			pic = "res/ui/kfmg/kfmgJunKu/kfmgz_jk_kapai.png",
			x = 156 + (iter_1_0 - 1) * 218,
			children = {
				{
					xcenter = -6,
					y = 42,
					type = "button",
					new = true,
					buttons = {
						{
							pic2 = "res/ui/kfmg/kfmgJunKu/kfmgz_jk_kapai_btn_c.png",
							pic1 = "res/ui/kfmg/kfmgJunKu/kfmgz_jk_kapai_btn_a.png",
							name = "useButton_" .. iter_1_0,
							children = {
								{
									xcenter = 0,
									ycenter = 0,
									pic = "res/ui/kfmg/kfmgJunKu/text/kfmgz_jk_meishuzi_sy.png",
									type = "pic"
								}
							}
						}
					}
				},
				{
					xcenter = -6,
					y = 347,
					type = "pic",
					pic = "res/ui/kfmg/kfmgJunKu/text/kfmgz_jk_meishuzi_gcc.png",
					name = "titlePic_" .. iter_1_0
				},
				{
					x = 30,
					y = 352,
					type = "pic",
					pic = var_1_1[iter_1_0]
				},
				{
					width = 14,
					height = 22,
					type = "atlas",
					pic = "res/ui/kfmg/kfmgJunKu/text/kfmgz_jk_shuzi.png",
					text = "0/3",
					y = 347,
					startChar = 47,
					x = 163,
					name = "useNum_" .. iter_1_0
				},
				{
					xcenter = -6,
					y = 228,
					type = "pic",
					pic = "res/ui/kfmg/kfmgJunKu/kfmgz_jk_wupin_di_1.png",
					children = {
						{
							xcenter = -1,
							scale = 1.25,
							type = "pic",
							ycenter = 1,
							pic = "res/ui/kfmg/kfmgJunKu/gcc.jpg",
							name = "iconPic_" .. iter_1_0
						},
						{
							xcenter = 0,
							ycenter = -53,
							pic = "res/ui/kfmg/kfmgJunKu/kfmgz_jk_kapai_xiaofei_di.png",
							type = "pic"
						},
						{
							xcenter = -26,
							ycenter = -52,
							pic = "res/ui/kfmg/kfmgJunKu/kfmgz_jk_kapai_yuanbao.png",
							type = "pic"
						},
						{
							fontSize = 18,
							text = "0",
							type = "label",
							ycenter = -52,
							xcenter = 20,
							name = "useGold" .. iter_1_0
						}
					}
				},
				{
					xcenter = -6,
					height = 0,
					type = "label",
					fontSize = 20,
					text = "",
					y = 103,
					width = 185,
					name = "introLabel_" .. iter_1_0,
					color = ccc3(204, 185, 134)
				}
			}
		})
	end
end

function var_0_0.getData(arg_3_0)
	return arg_3_0.data or {}
end

function var_0_0.getSelectNationData(arg_4_0)
	local function var_4_0(arg_5_0, arg_5_1)
		arg_5_0[#arg_5_0 + 1] = arg_5_1

		return arg_5_1
	end

	local var_4_1 = {
		130,
		315,
		415
	}
	local var_4_2 = {
		11,
		12,
		13
	}
	local var_4_3 = {
		123,
		19,
		207
	}
	local var_4_4 = {}

	if user.player.kfForceId == 1 then
		local var_4_5 = {
			12,
			13,
			105
		}

		var_4_3 = {
			19,
			207,
			105
		}
		var_4_4 = {
			2,
			3,
			6002
		}
	elseif user.player.kfForceId == 2 then
		local var_4_6 = {
			11,
			13,
			105
		}

		var_4_3 = {
			123,
			207,
			105
		}
		var_4_4 = {
			1,
			3,
			6002
		}
	elseif user.player.kfForceId == 3 then
		local var_4_7 = {
			11,
			12,
			105
		}

		var_4_3 = {
			123,
			19,
			105
		}
		var_4_4 = {
			1,
			2,
			6002
		}
	end

	local var_4_8 = {
		name = "backgroundPic",
		type = "pic_9",
		pic = "frame:bigPanel.png",
		preferedSize = CCSizeMake(620, 350),
		middleRect = CCRectMake(30, 30, 45, 45),
		x = visibleSize.width / 2,
		y = visibleSize.height / 2,
		children = {
			{
				xcenter = 0,
				top = 23,
				pic = "res/ui/kfmg/kfmgJunKu/text/gcc.png",
				type = "pic"
			},
			{
				fontSize = 24,
				xcenter = 0,
				type = "label",
				top = 75,
				text = language.get("hw_kfmg_000018"),
				color = colorText.TJ_Yellow
			}
		}
	}

	var_4_0(var_4_8.children, {
		y = 370,
		x = 592,
		type = "button",
		buttons = {
			{
				pic2 = "frame:btn_close_c.png",
				name = "junkucloseButton",
				pic1 = "frame:btn_close_a.png",
				scale = 2
			}
		}
	})

	for iter_4_0 = 1, 3 do
		var_4_0(var_4_8.children, {
			y = 150,
			type = "button",
			x = 104 + 210 * (iter_4_0 - 1),
			buttons = {
				{
					pic2 = "res/ui/kfmg/kfmgReady/kfmg_building.png",
					pic1 = "res/ui/kfmg/kfmgReady/kfmg_building.png",
					scale = 0.8,
					name = "nationNamePic_" .. iter_4_0,
					children = {
						{
							xcenter = 0,
							y = 0,
							type = "pic",
							pic = "frame:cc_" .. var_4_3[iter_4_0] .. ".png"
						},
						{
							fontSize = 24,
							type = "label",
							xcenter = 0,
							y = -20,
							name = "nationNameText_" .. iter_4_0,
							text = arg_4_0.ui.world:getNationName(var_4_4[iter_4_0])
						}
					}
				}
			}
		})
	end

	return var_4_8
end

return var_0_0
