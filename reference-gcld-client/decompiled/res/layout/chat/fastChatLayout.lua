return {
	widgets = {
		{
			x = 0,
			name = "panel",
			y = 0,
			type = "sprite",
			pic = {
				frame = true,
				path = "chat_main_view.png"
			},
			anchorPoint = ccp(0, 0),
			children = {
				{
					x = 48,
					name = "chatLightSprite",
					y = 34,
					type = "sprite",
					pic = {
						frame = true,
						path = "chat_icon_lig.png"
					}
				},
				{
					y = 32,
					name = "openChatWindowButton",
					h = 64,
					type = "button",
					w = 84,
					x = 52,
					normal = {
						frame = true,
						path = "chat_icon.png"
					},
					touched = {
						frame = true,
						path = "chat_icon.png"
					}
				}
			}
		}
	}
}
