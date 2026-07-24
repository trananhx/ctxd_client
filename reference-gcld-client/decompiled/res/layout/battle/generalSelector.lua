return {
	y = 0,
	name = "generalSelector",
	type = "node",
	x = 0,
	children = {
		{
			w = 82,
			name = "generalButton",
			h = 82,
			type = "button",
			normal = {
				frame = true,
				path = "general_background.png"
			},
			touched = {
				frame = true,
				path = "general_background_light.png"
			},
			anchorPoint = ccp(0.5, 0.5),
			children = {
				{
					y = 41,
					name = "generalPicNode",
					type = "node",
					x = 41,
					zorder = 1
				},
				{
					text = "",
					name = "nameLabel",
					y = -17,
					type = "label",
					fontSize = 20,
					x = 41,
					color = ccc3(223, 223, 223)
				},
				{
					y = 14,
					x = 14,
					type = "sprite",
					zorder = 2,
					pic = {
						frame = true,
						path = "check_box.png"
					}
				},
				{
					type = "sprite",
					name = "checkSprite",
					x = 14,
					visible = false,
					y = 14,
					zorder = 3,
					pic = {
						frame = true,
						path = "check_box_ok.png"
					}
				}
			}
		}
	}
}
