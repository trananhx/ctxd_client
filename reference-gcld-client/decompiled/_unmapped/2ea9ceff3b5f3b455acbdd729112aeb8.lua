local var_0_0 = {
	bg = {
		xcenter = 0,
		name = "bg",
		type = "pic",
		ycenter = -30,
		pic = "res/ui/weapon/machine/tsc_bg.jpg",
		children = {
			{
				x = 467,
				name = "machine_name",
				y = 487,
				type = "pic",
				pic = ""
			},
			{
				y = 413,
				x = 467,
				type = "pic",
				pic = "res/ui/weapon/machine/tsc_long_01.png",
				children = {
					{
						xcenter = 0,
						ycenter = 0,
						pic = "res/ui/weapon/machine/tsc_word_drpl.png",
						type = "pic"
					}
				}
			},
			{
				x = 467,
				name = "machine_word_bg",
				y = 122,
				type = "pic",
				pic = "res/ui/weapon/machine/tsc_long_02.png",
				children = {
					{
						xcenter = 0,
						name = "machine_word",
						type = "pic",
						ycenter = 0,
						pic = ""
					}
				}
			},
			{
				xcenter = 0,
				name = "processBg",
				y = 101,
				type = "pic",
				ycenter = 0,
				pic = "res/ui/weapon/machine/zc_new_bar_bg.png",
				visible = false,
				x = 438,
				children = {
					{
						xcenter = 0,
						name = "process",
						percentage = 0,
						type = "process",
						ycenter = 0,
						pic = "res/ui/weapon/machine/zc_new_bar.png"
					},
					{
						xcenter = 0,
						name = "processLb",
						text = "0%",
						type = "label",
						ycenter = 0,
						fontSize = 20
					},
					{
						type = "button",
						buttons = {
							{
								pic2 = "res/default.png",
								name = "lvBtnT1",
								pic1 = "res/default.png",
								y = 7,
								scale = 13,
								visible = true,
								x = 208
							},
							{
								pic2 = "res/default.png",
								name = "lvBtnT2",
								pic1 = "res/default.png",
								y = 7,
								scale = 13,
								visible = true,
								x = 642
							},
							{
								pic2 = "res/ui/weapon/machine/zc_new_icon_jjq_y.png",
								name = "lvBtn1",
								pic1 = "res/ui/weapon/machine/zc_new_icon_jjq_r.png",
								y = 7,
								visible = true,
								x = 208
							},
							{
								pic2 = "res/ui/weapon/machine/zc_new_icon_jjq_y.png",
								name = "lvBtn2",
								pic1 = "res/ui/weapon/machine/zc_new_icon_jjq_r.png",
								y = 7,
								visible = true,
								x = 642
							},
							{
								pic2 = "res/default.png",
								name = "blueprintBtnT",
								pic1 = "res/default.png",
								y = 10,
								scale = 13,
								visible = true,
								x = 866
							},
							{
								pic2 = "res/ui/weapon/machine/zc_new_icon_tz.png",
								name = "blueprintBtn",
								pic1 = "res/ui/weapon/machine/zc_new_icon_tz.png",
								y = 10,
								visible = true,
								x = 866
							}
						}
					},
					{
						fontSize = 20,
						name = "blueprintLb",
						xcenter = 0,
						type = "label",
						ycenter = 0,
						visible = false,
						text = "0/20",
						y = 0,
						x = 866
					}
				}
			},
			{
				x = 467,
				name = "machine_car",
				y = 270,
				type = "pic",
				visible = false,
				pic = "frame:machine1_1.png"
			},
			{
				x = 627,
				name = "logo_buy",
				y = 270,
				type = "pic",
				visible = false,
				pic = "res/ui/weapon/machine/tsc_seal_yzb.png"
			},
			{
				x = 467,
				name = "animation_sprite",
				y = 270,
				type = "pic",
				visible = false,
				pic = "res/default.png"
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/activity/boatArrow/ccjj_word_numb_di.png",
						name = "btn_yt",
						pic1 = "res/ui/activity/boatArrow/ccjj_word_numb_di.png",
						y = 480,
						visible = false,
						x = 85
					},
					{
						pic2 = "res/ui/common/button/sdyjs_btn_02_c.png",
						name = "btn_buy",
						pic1 = "res/ui/common/button/sdyjs_btn_02.png",
						y = 50,
						visible = false,
						x = 467
					},
					{
						pic2 = "res/ui/nationTask/thunder/lxgs_btn_c.png",
						name = "btn_left",
						pic1 = "res/ui/nationTask/thunder/lxgs_btn.png",
						y = 265,
						x = 50,
						visible = false,
						scale = -1
					},
					{
						pic2 = "res/ui/nationTask/thunder/lxgs_btn_c.png",
						name = "btn_right",
						pic1 = "res/ui/nationTask/thunder/lxgs_btn.png",
						y = 265,
						visible = false,
						x = 865
					},
					{
						pic2 = "res/ui/common/button/sdyjs_btn_02_c.png",
						name = "btn_buyNew",
						pic1 = "res/ui/common/button/sdyjs_btn_02.png",
						y = 40,
						visible = false,
						x = 300
					},
					{
						pic2 = "res/ui/common/button/sdyjs_btn_01_c.png",
						name = "btn_build1",
						pic1 = "res/ui/common/button/sdyjs_btn_01.png",
						y = 40,
						visible = false,
						x = 570
					},
					{
						pic2 = "res/ui/common/button/public_btn_green_c.png",
						name = "btn_build2",
						pic1 = "res/ui/common/button/public_btn_green.png",
						y = 40,
						visible = false,
						x = 570
					},
					{
						pic2 = "res/ui/common/button/public_btn_green_c.png",
						name = "btn_build3",
						pic1 = "res/ui/common/button/public_btn_green.png",
						y = 40,
						visible = false,
						x = 467
					},
					{
						pic2 = "res/ui/activity/boatArrow/ccjj_word_numb_di.png",
						name = "btn_lock",
						pic1 = "res/ui/activity/boatArrow/ccjj_word_numb_di.png",
						y = 480,
						visible = false,
						x = 245
					}
				}
			},
			{
				x = 25,
				name = "icon_yt",
				y = 480,
				type = "pic",
				visible = false,
				pic = "res/ui/weapon/machine/zc_yt_icon.png",
				children = {
					{
						xcenter = 0,
						name = "num_yt",
						fontSize = 20,
						type = "label",
						ycenter = -10,
						text = "0",
						y = 17,
						x = 80,
						color = colorText[10001]
					}
				}
			},
			{
				y = 480,
				name = "icon_lock",
				type = "pic_9",
				pic = "res/ui/common/quailtyFrames/quality_frame_1.png",
				visible = false,
				x = 185,
				middleRect = CCRectMake(5, 5, 66, 66),
				preferedSize = CCSizeMake(44, 44),
				children = {
					{
						y = 22,
						x = 22,
						scale = 0.55,
						type = "pic",
						pic = "frame:kms.jpg"
					},
					{
						fontSize = 20,
						name = "num_lock",
						text = "0",
						type = "label",
						y = 2,
						anchorPointY = 0,
						x = 42,
						anchorPointX = 1
					}
				}
			},
			{
				x = 236,
				name = "icon_buyNew",
				y = 45,
				type = "pic",
				visible = false,
				pic = "frame:res_icon_19_small.png",
				children = {
					{
						fontSize = 20,
						name = "num_buyNew",
						text = "2000",
						type = "label",
						ycenter = -10,
						xcenter = 0,
						color = colorText[10001]
					},
					{
						fontSize = 24,
						y = 15,
						type = "label",
						x = 100,
						text = language.get(20003),
						color = colorText[10001]
					}
				}
			},
			{
				x = 506,
				name = "icon_build1",
				y = 45,
				type = "pic",
				visible = false,
				pic = "res/ui/weapon/machine/zc_yt_icon.png",
				children = {
					{
						fontSize = 20,
						name = "num_build1",
						text = "2000",
						type = "label",
						ycenter = -10,
						xcenter = 0,
						color = colorText[10001]
					},
					{
						fontSize = 24,
						y = 15,
						type = "label",
						x = 105,
						text = language.get(121020),
						color = colorText[10001]
					}
				}
			},
			{
				fontSize = 24,
				name = "word_build2",
				type = "label",
				y = 44,
				x = 570,
				visible = false,
				text = language.get(216115),
				color = colorText[10001]
			},
			{
				fontSize = 24,
				name = "word_build3",
				type = "label",
				y = 44,
				x = 467,
				visible = false,
				text = language.get(216116),
				color = colorText[10001]
			},
			{
				fontSize = 24,
				name = "word_buy",
				type = "label",
				y = 53,
				x = 475,
				visible = false,
				text = language.get(101018),
				color = colorText[10001]
			},
			{
				fontSize = 24,
				name = "need_level",
				type = "label",
				y = 50,
				x = 467,
				visible = false,
				text = language.get("220702_qixie", 100),
				color = colorText[10001]
			},
			{
				x = 403,
				name = "icon_buy",
				y = 52,
				type = "pic",
				visible = false,
				pic = "frame:res_icon_19_small.png",
				children = {
					{
						fontSize = 20,
						name = "num_buy",
						text = "2000",
						type = "label",
						ycenter = -10,
						xcenter = 0,
						color = colorText[10001]
					}
				}
			},
			{
				xcenter = 0,
				name = "tipBg",
				y = 0,
				type = "pic",
				ycenter = 0,
				visible = true,
				x = 0,
				pic = "res/default.png"
			}
		}
	}
}

function getMachinePanelData()
	return var_0_0
end
