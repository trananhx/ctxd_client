local var_0_0 = {
	bg = {
		xcenter = 0,
		name = "bg",
		z = 1,
		type = "pic",
		ycenter = 0,
		pic = "frame:offic_apply_view_bg.png",
		children = {
			{
				x = 260,
				name = "list_bg",
				y = 177,
				type = "pic",
				pic = "frame:offic_apply_list_view.png"
			},
			{
				fontSize = 20,
				name = "key_1",
				type = "label",
				y = 250,
				x = 90,
				text = language.get(240003)
			},
			{
				fontSize = 20,
				name = "key_2",
				type = "label",
				y = 250,
				x = 200,
				text = language.get(240004)
			},
			{
				fontSize = 20,
				name = "key_3",
				type = "label",
				y = 250,
				x = 350,
				text = language.get(240005)
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "frame:btn_check_1_a.png",
						name = "btn_gou",
						pic1 = "frame:btn_check_1_a.png",
						y = 43,
						x = 70
					}
				}
			},
			{
				x = 70,
				name = "gou_yes",
				y = 43,
				type = "pic",
				pic = "frame:btn_check_1_on.png"
			},
			{
				fontSize = 20,
				name = "key_4",
				type = "label",
				y = 43,
				x = 160,
				text = language.get(240006)
			}
		}
	}
}

function getApplyOfficerData()
	return var_0_0
end
