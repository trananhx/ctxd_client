local var_0_0 = {
	bg = {
		xcenter = 0,
		name = "bg",
		z = 0,
		type = "pic",
		ycenter = 0,
		pic = "res/ui/juben/jubenSelect/map/jb_jb_1.png",
		children = {
			{
				fontSize = 26,
				name = "title",
				x = 181,
				type = "label",
				text = "",
				y = 150,
				strokeSize = 2,
				color = ccc3(255, 255, 204),
				strokeColor = ccc3(22, 18, 13)
			},
			{
				x = 181,
				name = "bg1",
				y = 115,
				type = "pic",
				pic = "res/ui/world/jubenEnter/jb_jb_list_nandu.png"
			},
			{
				x = 181,
				name = "bg2",
				y = -32,
				type = "pic",
				pic = "res/ui/world/jubenEnter/jb_jb_list_cishu.png"
			},
			{
				fontSize = 20,
				name = "des",
				x = 235,
				type = "label",
				text = "",
				y = 115,
				strokeSize = 2,
				color = ccc3(197, 171, 141),
				strokeColor = ccc3(22, 18, 13)
			},
			{
				fontSize = 26,
				name = "times",
				x = 181,
				type = "label",
				text = "",
				y = -32,
				strokeSize = 2,
				color = ccc3(255, 255, 204),
				strokeColor = ccc3(22, 18, 13)
			},
			{
				x = 60,
				name = "diff",
				y = 115,
				type = "pic",
				pic = "res/ui/juben/jubenLevelSelect/text/jb_mode_3.png"
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/juben/jubenLevelSelect/btn_jb_a.png",
						name = "btn_start",
						pic1 = "res/ui/juben/jubenLevelSelect/btn_jb_a.png",
						y = 41,
						x = 181
					}
				}
			}
		}
	}
}

function getJubenEnterData()
	return var_0_0
end
