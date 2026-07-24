local var_0_0 = {
	leftRole = {
		left = 30,
		name = "leftRole",
		down = 0,
		type = "pic",
		z = 3,
		pic = "res/ui/guide/npc_xq.png"
	},
	leftDialogueBox = {
		left = 220,
		name = "leftDialogueBox",
		y = 130,
		type = "pic",
		z = 4,
		pic = "res/ui/guide/npc_chat_view.png"
	},
	leftText = {
		fontSize = 25,
		name = "leftText",
		text = "小强",
		type = "label",
		y = 118,
		z = 5,
		left = 380
	},
	rightRole = {
		down = 0,
		name = "rightRole",
		z = 3,
		type = "pic",
		pic = "res/ui/guide/npc_xq.png",
		right = 15
	},
	rightDialogueBox = {
		y = 130,
		name = "rightDialogueBox",
		z = 4,
		type = "pic",
		pic = "res/ui/guide/npc_chat_view.png",
		right = 220
	},
	rightText = {
		fontSize = 25,
		name = "rightText",
		text = "小强",
		type = "label",
		down = 115,
		z = 5,
		right = 380
	}
}

local function var_0_1()
	if conf.language == "kr" then
		var_0_0.leftText.fontSize = 22
		var_0_0.rightText.fontSize = 22
	elseif conf.language == "vie" then
		var_0_0.leftText.fontSize = 18
		var_0_0.rightText.fontSize = 18
	elseif conf.language == "tha" then
		var_0_0.leftText.fontSize = 20
		var_0_0.rightText.fontSize = 20
	end
end

function getRoleDialogueData()
	var_0_1()

	return var_0_0
end
