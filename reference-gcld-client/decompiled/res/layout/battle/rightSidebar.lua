return {
	name = "rightSidebar",
	type = "sprite",
	pic = {
		frame = true,
		path = "battle_right_panel_di.png"
	},
	x = visibleSize.width - 65 - platform.getSafeDistance(),
	y = visibleSize.height * 0.5,
	children = {
		{
			name = "actionView",
			type = "TableView",
			y = 7,
			x = 15,
			viewSize = CCSizeMake(96, 351),
			dirction = kCCScrollViewDirectionVertical,
			verticalFill = kCCTableViewFillTopDown
		},
		{
			opacity = 0,
			name = "butonBackground",
			y = 184,
			type = "sprite",
			x = -29,
			pic = {
				frame = true,
				path = "fight_open_background.png"
			}
		},
		{
			visible = false,
			name = "openButton",
			h = 57,
			type = "button",
			w = 54,
			y = 181,
			x = -35,
			normal = {
				frame = true,
				path = "btn_fight_normal.png"
			},
			touched = {
				frame = true,
				path = "btn_fight_light.png"
			}
		},
		{
			visible = true,
			name = "closeButton",
			h = 57,
			type = "button",
			w = 54,
			y = 181,
			x = -35,
			normal = {
				frame = true,
				path = "btn_fight_close_normal.png"
			},
			touched = {
				frame = true,
				path = "btn_fight_close_light.png"
			}
		}
	}
}
