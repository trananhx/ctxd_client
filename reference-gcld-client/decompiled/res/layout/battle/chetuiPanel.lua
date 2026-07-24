return {
	name = "chetuiPanel",
	type = "sprite9",
	swallowTouch = true,
	pic = {
		frame = true,
		path = "common_panel_2.png"
	},
	middleRect = CCRectMake(0, 0, 0, 0),
	preferedSize = CCSizeMake(370, 230),
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5,
	children = {
		{
			x = 185,
			name = "butonBackground",
			type = "sprite9",
			y = 145,
			pic = {
				frame = true,
				path = "common_panel_1.png"
			},
			middleRect = CCRectMake(0, 0, 0, 0),
			preferedSize = CCSizeMake(320, 136)
		},
		{
			y = 45,
			name = "closeButton",
			style = "button_yel3",
			type = "button",
			visible = true,
			x = 95,
			label = {
				fontSize = 22,
				textId = 190302,
				type = "label"
			}
		},
		{
			y = 45,
			name = "chetuiButton",
			style = "button_gre3",
			type = "button",
			visible = true,
			x = 275,
			label = {
				fontSize = 22,
				textId = 190301,
				type = "label"
			}
		}
	}
}
