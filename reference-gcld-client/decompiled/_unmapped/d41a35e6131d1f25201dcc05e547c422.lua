local var_0_0 = {
	bg = {
		x = 0,
		name = "bg",
		y = 0,
		type = "pic",
		pic = "res/ui/incenseLink/kj_fete_view.jpg",
		children = {
			{
				x = 55,
				name = "frame",
				y = 55,
				type = "pic",
				pic = "res/ui/incenseLink/kj_fete_icon.png"
			},
			{
				fontSize = 26,
				name = "buzu",
				x = 200,
				type = "label",
				y = 75,
				strokeSize = 2,
				text = language.get(70006, "银币"),
				color = ccc3(235, 209, 167),
				strokeColor = ccc3(17, 22, 57)
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "frame:btn2_gre_c.png",
						name = "btn_link",
						pic1 = "frame:btn2_gre_a.png",
						y = 30,
						pic3 = "frame:btn2_gre_g.png",
						x = 200
					}
				}
			},
			{
				fontSize = 20,
				name = "title_link",
				x = 200,
				type = "label",
				y = 30,
				strokeSize = 2,
				text = language.get(70007),
				color = colorText[10004],
				strokeColor = colorText[10005]
			}
		}
	}
}

function getIncenseLinkData()
	return var_0_0
end
