function getFightOpenButtonData()
	return {
		background = {
			visible = true,
			pic = "frame:fight_open_background.png",
			type = "pic"
		},
		menu = {
			z = 101,
			type = "button",
			buttons = {
				{
					pic2 = "frame:btn_fight_light.png",
					name = "openItem",
					pic1 = "frame:btn_fight_normal.png",
					visible = true
				},
				{
					pic2 = "frame:btn_fight_close_light.png",
					name = "closeItem",
					pic1 = "frame:btn_fight_close_normal.png",
					visible = false
				}
			}
		}
	}
end
