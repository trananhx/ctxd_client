local var_0_0 = {
	bg = {
		xcenter = 0,
		name = "bg",
		type = "pic",
		ycenter = 0,
		pic = "res/ui/gainGeneral/gain_view.png",
		children = {
			{
				x = 305,
				name = "bg2",
				y = 165,
				type = "pic",
				pic = "res/ui/gainGeneral/gain_peop_view.jpg"
			},
			{
				x = 305,
				name = "title",
				y = 290,
				type = "pic",
				pic = "res/ui/gainGeneral/gain_hdwj.png"
			},
			{
				x = 200,
				name = "head",
				y = 165,
				type = "pic",
				pic = "res/ui/common/generalPic/generalPic_zhangliang.jpg"
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/gainGeneral/gain_btn_a.png",
						name = "shangzhen",
						pic1 = "res/ui/gainGeneral/gain_btn_a.png",
						y = 45,
						x = 305
					}
				}
			},
			{
				fontSize = 24,
				name = "name",
				x = 350,
				type = "label",
				y = 182,
				strokeSize = 2,
				text = language.get(370001),
				color = ccc3(133, 190, 109),
				strokeColor = ccc3(34, 34, 34)
			},
			{
				fontSize = 22,
				name = "des",
				x = 350,
				type = "label",
				y = 147,
				strokeSize = 2,
				text = language.get(370002),
				color = ccc3(255, 255, 204),
				strokeColor = ccc3(22, 18, 13)
			}
		}
	}
}

function getGainGeneralData()
	return var_0_0
end
