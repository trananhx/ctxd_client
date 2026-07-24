return {
	buildLayout = {
		y = 0,
		name = "buildNode",
		type = "node",
		x = 0,
		children = {
			{
				y = 0,
				name = "gjgs_world_word_di",
				type = "sprite",
				x = 0,
				pic = {
					path = "res/ui/world/worldBuild/gjgs_world_word_di.png"
				}
			},
			{
				y = 50,
				name = "title",
				type = "sprite",
				x = 0,
				pic = {
					path = "res/ui/world/worldBuild/gjgs_world_word_gsjxz.png"
				}
			},
			{
				y = 0,
				name = "flagIcon",
				type = "sprite",
				x = -130,
				pic = {
					path = "res/ui/world/worldBuild/gjgs_world_flag_1.png"
				}
			},
			{
				y = 10,
				name = "forceIcon",
				type = "sprite",
				x = -130,
				pic = {
					path = "res/ui/world/worldBuild/gjgs_world_word_1.png"
				}
			},
			{
				fontSize = 20,
				name = "infoLb",
				y = 13,
				type = "label",
				x = 0
			},
			{
				fontSize = 20,
				name = "timeLb",
				y = -11,
				type = "label",
				x = 0,
				color = colorQuality[5]
			},
			{
				visible = false,
				name = "closeIcon",
				y = -100,
				type = "sprite",
				x = 0,
				pic = {
					path = "res/ui/world/worldBuild/gjgs_world_prohibit.png"
				}
			}
		}
	}
}
