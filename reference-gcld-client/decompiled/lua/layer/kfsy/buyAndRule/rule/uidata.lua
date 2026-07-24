local var_0_0 = {}
local var_0_1 = {}

if conf.language == "kr" then
	var_0_1.tipFontSize = -3
	var_0_1.tipFrameWidth = 0
	var_0_1.frameVisible = true
	var_0_1.girlZ = -150
elseif conf.language == "vie" then
	var_0_1.tipFontSize = -3
	var_0_1.tipFrameWidth = 640
	var_0_1.frameVisible = false
	var_0_1.girlZ = -150
else
	var_0_1.tipFontSize = 0
	var_0_1.tipFrameWidth = 600
	var_0_1.frameVisible = true
	var_0_1.girlZ = -150
end

var_0_0.menu = {
	xcenter = 0,
	ycenter = -23,
	type = "pic_9",
	pic = "res/ui/general/jailView/comm_view_2.png",
	middleRect = CCRectMake(30, 30, 45, 45),
	preferedSize = CCSizeMake(930, 545),
	children = {
		{
			xcenter = -310,
			name = "girl",
			type = "pic",
			ycenter = -40,
			pic = "res/ui/kfsy/kfsy_sv.png",
			z = 150 + var_0_1.girlZ
		},
		{
			xcenter = 100,
			z = 100,
			type = "label",
			ycenter = 0,
			height = 0,
			font = "Thonburi",
			strokeSize = 2,
			fontSize = 21 + var_0_1.tipFontSize,
			text = language.get(320406),
			color = ccc3(255, 255, 255),
			strokeColor = ccc3(22, 18, 13),
			width = var_0_1.tipFrameWidth
		},
		{
			xcenter = 80,
			name = "kuang",
			scale = 2.1,
			type = "pic",
			ycenter = 0,
			z = 50,
			pic = "res/ui/guide/npc_chat_view.png",
			visible = var_0_1.frameVisible
		}
	}
}

function getkfsyRuleData()
	return var_0_0
end
