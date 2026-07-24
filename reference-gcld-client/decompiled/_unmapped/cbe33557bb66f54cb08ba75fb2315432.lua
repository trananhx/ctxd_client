local var_0_0 = {}
local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.desFontSize = -4
else
	var_0_1.desFontSize = 0
end

var_0_0.bg = {
	xcenter = 0,
	type = "pic",
	ycenter = -30,
	pic = "res/ui/playerInfo/battleHelp/di.jpg",
	children = {
		{
			fontSize = 24,
			name = "name",
			type = "label",
			y = 295,
			x = 315,
			text = language.get(143042),
			color = ccc3(180, 112, 73)
		},
		{
			fontSize = 24,
			name = "name",
			type = "label",
			y = 295,
			x = 770,
			text = language.get(143043),
			color = ccc3(180, 112, 73)
		},
		{
			fontSize = 20,
			name = "name",
			type = "label",
			y = 258,
			x = 658,
			text = language.get(143044),
			color = ccc3(193, 173, 112)
		},
		{
			fontSize = 20,
			name = "name",
			type = "label",
			y = 175,
			x = 658,
			text = language.get(143045),
			color = ccc3(193, 173, 112)
		},
		{
			fontSize = 20,
			name = "name",
			type = "label",
			y = 215,
			x = 770,
			text = language.get(143046),
			color = ccc3(240, 206, 165)
		},
		{
			fontSize = 20,
			name = "none_des",
			type = "label",
			y = 90,
			x = 770,
			text = language.get(143046),
			color = ccc3(240, 206, 165)
		},
		{
			name = "des",
			type = "label",
			y = 83,
			x = 770,
			text = language.get(143046),
			fontSize = 20 + var_0_1.desFontSize,
			color = ccc3(240, 206, 165)
		}
	}
}

function getBattleHelpData()
	return var_0_0
end
