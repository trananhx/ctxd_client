local var_0_0 = {
	bg = {
		x = 568,
		name = "bg",
		y = 384,
		type = "pic",
		z = 0,
		pic = "res/ui/juben/jubenSelect/jb_jb_down.jpg",
		children = {
			{
				x = 693,
				name = "textBg",
				y = 644,
				type = "pic",
				pic = "res/ui/juben/jubenSelect/jb_jb_set_name.png"
			},
			{
				x = 693,
				name = "text",
				y = 634,
				type = "pic",
				pic = "res/ui/juben/jubenSelect/jb_jb_set_name.png"
			},
			{
				x = 543,
				name = "text_blood",
				y = 636,
				type = "pic",
				visible = false,
				pic = "res/ui/juben/jubenSelect/btn_word_tx.png"
			},
			{
				name = "tips",
				y = 139,
				type = "label",
				fontSize = 22,
				x = 693,
				text = language.get(330032),
				color = ccc3(217, 204, 143)
			},
			{
				x = 693,
				name = "selectBg",
				y = 384,
				type = "pic",
				z = 2,
				pic = "res/ui/juben/jubenSelect/jb_jb_list_lig.png",
				children = {
					{
						x = 190,
						name = "select_up",
						y = 408,
						type = "pic",
						pic = "res/ui/juben/jubenSelect/jb_jb_list_shang.png"
					},
					{
						x = 190,
						name = "select_mid",
						y = 130,
						type = "pic",
						z = -1,
						pic = "res/ui/juben/jubenSelect/jb_jb_tips.png",
						children = {
							{
								name = "bestReward",
								y = 185,
								type = "label",
								fontSize = 22,
								x = 180,
								text = language.get(330027),
								color = ccc3(217, 204, 143)
							}
						}
					},
					{
						x = 190,
						name = "select_down",
						y = 18,
						type = "pic",
						pic = "res/ui/juben/jubenSelect/jb_jb_list_xia.png"
					}
				}
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/juben/jubenLevelSelect/btn_jb_back_h.png",
						name = "btn_back",
						pic1 = "res/ui/juben/jubenLevelSelect/btn_jb_back_n.png",
						x = 693 + visibleSize.width / 2 - 72,
						y = 384 + visibleSize.height / 2 - 50
					},
					{
						pic2 = "res/ui/juben/jubenSelect/jb_jb_record_icon.png",
						name = "btn_high",
						pic1 = "res/ui/juben/jubenSelect/jb_jb_record_icon.png",
						x = 693 - visibleSize.width / 2 + 66,
						y = 384 + visibleSize.height / 2 - 50
					}
				}
			}
		}
	}
}

function getJubenSelectData()
	return var_0_0
end
