local var_0_0 = {
	bg = {
		xcenter = 0,
		name = "bg",
		type = "pic",
		ycenter = 0,
		pic = "res/ui/dayReward/dljl_bg.png",
		children = {
			{
				xcenter = 15,
				y = 395,
				pic = "res/ui/dayReward/dljl_title_dljl.png",
				type = "pic"
			},
			{
				xcenter = 15,
				name = "msg1",
				y = 330,
				type = "pic",
				scale = 0.9589442815249267,
				visible = false,
				pic = "res/ui/dayReward/dljl_tit_01.png"
			},
			{
				xcenter = 15,
				name = "msg2",
				y = 330,
				type = "pic",
				visible = false,
				pic = "res/ui/dayReward/dljl_tit_02.png"
			},
			{
				xcenter = 15,
				name = "msg3",
				y = 330,
				type = "pic",
				visible = false,
				pic = "res/ui/dayReward/zcgz_mrdl_word01.png"
			},
			{
				anchorPointX = 0,
				name = "npcPic",
				x = 0,
				type = "pic",
				y = 0,
				anchorPointY = 0,
				pic = "res/ui/comment/xiaoqian.png",
				scale = 0.7
			},
			{
				x = 320,
				name = "bg_1",
				y = 180,
				type = "pic",
				pic = "frame:lm_icon_view_low_a.png",
				children = {
					{
						fontSize = 20,
						name = "frame_name_1",
						type = "label",
						y = 40,
						x = 73.5,
						text = language.get(320002),
						color = ccc3(237, 209, 169)
					},
					{
						x = 73.5,
						name = "frame_1",
						y = 130,
						type = "pic",
						pic = "frame:item_background.jpg"
					}
				}
			},
			{
				x = 500,
				name = "bg_2",
				y = 180,
				type = "pic",
				pic = "frame:lm_icon_view_low_a.png",
				children = {
					{
						fontSize = 20,
						name = "frame_name_2",
						type = "label",
						y = 40,
						x = 73.5,
						text = language.get(320003),
						color = ccc3(237, 209, 169)
					},
					{
						x = 73.5,
						name = "frame_2",
						y = 130,
						type = "pic",
						pic = "frame:item_background.jpg"
					}
				}
			},
			{
				x = 680,
				name = "bg_3",
				y = 180,
				type = "pic",
				pic = "frame:lm_icon_view_low_a.png",
				children = {
					{
						fontSize = 20,
						name = "frame_name_3",
						type = "label",
						y = 40,
						x = 73.5,
						text = language.get(320004),
						color = ccc3(237, 209, 169)
					},
					{
						x = 73.5,
						name = "frame_3",
						y = 130,
						type = "pic",
						pic = "frame:item_background.jpg"
					}
				}
			},
			{
				xcenter = 0,
				name = "bg_tips",
				y = 200,
				type = "pic",
				pic = "res/ui/dayReward/get_view_bg.png",
				children = {
					{
						xcenter = -100,
						name = "gold_icon",
						y = 110,
						type = "pic",
						pic = "frame:res_icon_19.png"
					},
					{
						xcenter = -25,
						name = "gold_title",
						y = 110,
						type = "pic",
						pic = "res/ui/common/text/resource/res_title_19.png"
					},
					{
						xcenter = 35,
						name = "gold_add",
						y = 110,
						type = "pic",
						pic = "frame:res_plus.png"
					},
					{
						xcenter = 75,
						height = 46,
						name = "gold_value",
						type = "atlas",
						pic = "res/ui/common/number/get_numb.png",
						text = "0",
						y = 110,
						startChar = 48,
						width = 29
					},
					{
						xcenter = -100,
						name = "incense_icon",
						y = 40,
						type = "pic",
						pic = "res/ui/dayReward/get_icon_fete.png"
					},
					{
						xcenter = -25,
						name = "incense_title",
						y = 40,
						type = "pic",
						pic = "res/ui/dayReward/get_reso_fete.png"
					},
					{
						xcenter = 35,
						name = "incense_add",
						y = 40,
						type = "pic",
						pic = "frame:res_plus.png"
					},
					{
						xcenter = 75,
						height = 46,
						name = "incense_value",
						type = "atlas",
						pic = "res/ui/common/number/get_numb.png",
						text = "0",
						y = 40,
						startChar = 48,
						width = 29
					}
				}
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "frame:btn2_yel_c.png",
						name = "btn_try",
						pic1 = "frame:btn2_yel_a.png",
						y = 50,
						pic3 = "frame:btn2_yel_g.png",
						x = 500
					},
					{
						pic2 = "frame:btn2_yel_c.png",
						name = "btn_yes",
						pic1 = "frame:btn2_yel_a.png",
						y = 50,
						pic3 = "frame:btn2_yel_g.png",
						x = 500
					},
					{
						pic2 = "frame:btn_close_c.png",
						name = "btn_close",
						pic1 = "frame:btn_close_a.png",
						y = 400,
						x = 800
					}
				}
			},
			{
				fontSize = 20,
				name = "title_btn",
				x = 500,
				type = "label",
				y = 50,
				strokeSize = 2,
				text = language.get(320001),
				color = colorText[10004],
				strokeColor = colorText[10005]
			},
			{
				x = 380,
				name = "bg_4",
				y = 180,
				type = "pic",
				pic = "frame:lm_icon_view_low_a.png",
				children = {
					{
						fontSize = 20,
						name = "frame_name_4",
						type = "label",
						y = 40,
						x = 73.5,
						text = language.get(320002),
						color = ccc3(237, 209, 169)
					},
					{
						x = 73.5,
						name = "frame_4",
						y = 130,
						type = "pic",
						pic = "frame:item_background.jpg"
					},
					{
						x = 73.5,
						name = "Image_4",
						y = 130,
						type = "pic",
						pic = "res/ui/dayReward/jisk.png"
					},
					{
						x = 73.5,
						name = "lock_4",
						y = 130,
						type = "pic",
						pic = "res/ui/dayReward/suo.png"
					},
					{
						x = 73.5,
						y = 75,
						pic = "res/ui/dayReward/zcgz_mrdl_word02.png",
						type = "pic"
					}
				}
			},
			{
				x = 620,
				name = "bg_5",
				y = 180,
				type = "pic",
				pic = "frame:lm_icon_view_low_a.png",
				children = {
					{
						fontSize = 20,
						name = "frame_name_5",
						type = "label",
						y = 40,
						x = 73.5,
						text = language.get(320003),
						color = ccc3(237, 209, 169)
					},
					{
						x = 73.5,
						name = "frame_5",
						y = 130,
						type = "pic",
						pic = "frame:item_background.jpg"
					},
					{
						x = 73.5,
						name = "lock_5",
						y = 130,
						type = "pic",
						pic = "res/ui/dayReward/suo.png"
					},
					{
						x = 73.5,
						y = 75,
						pic = "res/ui/dayReward/zcgz_mrdl_word03.png",
						type = "pic"
					}
				}
			},
			{
				x = 320,
				name = "techBg",
				y = 180,
				type = "pic",
				visible = false,
				pic = "frame:lm_icon_view.png",
				children = {
					{
						xcenter = 2,
						name = "techPic",
						type = "pic",
						ycenter = 6,
						pic = "frame:lm_icon_qm.jpg"
					},
					{
						anchorPointX = 0,
						name = "techName",
						x = 200,
						type = "pic",
						y = 110,
						pic = "res/ui/common/text/technology/techName/lm_tit_bcsj.png"
					},
					{
						fontSize = 20,
						name = "techInfo",
						type = "label",
						anchorPointX = 0,
						width = 350,
						height = 0,
						text = "",
						y = 70,
						x = 200,
						color = tool.hexToRgb("#FEFFCC")
					}
				}
			}
		}
	}
}

function getDayRewardData()
	return var_0_0
end
