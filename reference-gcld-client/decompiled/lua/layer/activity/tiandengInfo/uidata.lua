local var_0_0 = {}

local function var_0_1(arg_1_0, arg_1_1)
	arg_1_0[#arg_1_0 + 1] = arg_1_1

	return arg_1_1
end

var_0_0.board = {
	xcenter = 0,
	name = "board",
	down = 36,
	type = "pic",
	pic = "res/ui/activity/famous/gjms_sce_view_bg.png",
	children = {}
}

var_0_1(var_0_0.board.children, {
	left = -80,
	name = "general",
	down = 0,
	type = "pic",
	pic = "res/ui/common/halfPic/halfPic_guojia.png"
})

local var_0_2 = var_0_1(var_0_0.board.children, {
	type = "button",
	buttons = {}
})

for iter_0_0 = 1, 2 do
	local var_0_3 = var_0_1(var_0_2.buttons, {
		pic2 = "res/ui/activity/famous/gjms_sce_list_on.jpg",
		pic1 = "res/ui/activity/famous/gjms_sce_list.jpg",
		x = 400,
		name = "button" .. iter_0_0,
		y = 185 - (iter_0_0 - 1) * 120,
		children = {}
	})

	var_0_1(var_0_3.children, {
		pic = "res/ui/activity/famous/gjms_icon_view.jpg",
		type = "pic_9",
		ycenter = 0,
		left = 15,
		middleRect = CCRectMake(5, 5, 50, 50),
		preferedSize = CCSizeMake(82, 82)
	})
	var_0_1(var_0_0.board.children, {
		x = 254,
		type = "pic",
		pic = "res/ui/activity/tiandeng/tdxy_world_light.jpg",
		name = "needItemPic" .. iter_0_0,
		y = 129 - (iter_0_0 - 1) * 120 + 15 + 41
	})
	var_0_1(var_0_0.board.children, {
		strokeSize = 2,
		type = "label",
		fontSize = 18,
		x = 443,
		text = "酒逢知己千杯少，让我替你满上！",
		width = 270,
		name = "plot" .. iter_0_0,
		color = ccc3(235, 209, 167),
		strokeColor = ccc3(22, 18, 13),
		align = kCCTextAlignmentLeft,
		y = 129 - (iter_0_0 - 1) * 120 + 112 - 16 - 9
	})
	var_0_1(var_0_0.board.children, {
		fontSize = 18,
		type = "label",
		anchorPointX = 0,
		x = 308,
		width = 270,
		text = "奖励:50000经验 75名声",
		height = 0,
		strokeSize = 2,
		name = "reward" .. iter_0_0,
		color = ccc3(235, 209, 167),
		strokeColor = ccc3(22, 18, 13),
		align = kCCTextAlignmentLeft,
		y = 129 - (iter_0_0 - 1) * 120 + 112 - 42 - 9
	})
	var_0_1(var_0_0.board.children, {
		strokeSize = 2,
		type = "label",
		fontSize = 20,
		x = 443,
		text = "需要:宝马×10",
		width = 270,
		name = "cost" .. iter_0_0,
		color = colorQuality[3],
		strokeColor = ccc3(22, 18, 13),
		align = kCCTextAlignmentLeft,
		y = 129 - (iter_0_0 - 1) * 120 + 112 - 42 - 26 - 10
	})
end

return var_0_0
