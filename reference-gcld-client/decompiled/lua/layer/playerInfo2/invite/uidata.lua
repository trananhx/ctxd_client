local var_0_0 = {}

local function var_0_1(arg_1_0, arg_1_1)
	arg_1_0[#arg_1_0 + 1] = arg_1_1

	return arg_1_1
end

var_0_0.background = {
	xcenter = 0,
	type = "pic",
	ycenter = -30,
	pic = "res/ui/playerInfo/invite/bg.jpg",
	children = {}
}

var_0_1(var_0_0.background.children, {
	xcenter = 0,
	top = 12,
	pic = "res/ui/playerInfo/invite/invite_reward.png",
	type = "pic"
})
var_0_1(var_0_0.background.children, {
	fontSize = 28,
	font = "Thonburi",
	name = "leftTime",
	type = "label",
	ycenter = 195,
	x = 700,
	strokeSize = 2,
	color = colorQuality[5]
})
var_0_1(var_0_0.background.children, {
	xcenter = 0,
	type = "pic",
	top = 95,
	pic = "res/ui/comment/bg2.jpg",
	children = {
		{
			xcenter = 0,
			ycenter = 0,
			pic = "res/ui/playerInfo/invite/text.png",
			type = "pic"
		}
	}
})

local var_0_2 = var_0_1(var_0_0.background.children, {
	left = 34,
	down = 104,
	type = "pic",
	pic = "res/ui/playerInfo/invite/givecode.png",
	children = {}
})

var_0_1(var_0_2.children, {
	x = 120,
	anchorPointX = 0,
	type = "pic",
	ycenter = 0,
	pic = "res/ui/playerInfo/invite/input2.png",
	children = {
		{
			name = "code",
			fontSize = 22,
			type = "label",
			ycenter = 0,
			xcenter = 0,
			width = 586,
			text = "",
			strokeSize = 2,
			color = ccc3(235, 209, 167),
			strokeColor = ccc3(22, 18, 13)
		}
	}
})
var_0_1(var_0_2.children, {
	ycenter = 0,
	x = 805,
	type = "button",
	buttons = {
		{
			pic2 = "frame:btn_default_lighted.png",
			name = "copy",
			pic1 = "frame:btn_default_normal.png",
			children = {
				{
					fontSize = 22,
					type = "label",
					xcenter = 0,
					strokeSize = 2,
					ycenter = 0,
					text = language.get("450000_yyl"),
					color = ccc3(235, 209, 167),
					strokeColor = ccc3(22, 18, 13)
				}
			}
		}
	}
})

for iter_0_0 = 1, 4 do
	var_0_1(var_0_0.background.children, {
		y = 46,
		type = "pic",
		pic = "frame:icon_silver.png",
		name = "rewardIcon_" .. iter_0_0,
		x = 157 + (iter_0_0 - 1) * 190 - 130,
		children = {
			{
				x = 113,
				type = "pic",
				ycenter = 0,
				pic = "res/ui/playerInfo/invite/input1.png",
				children = {
					{
						anchorPointX = 0,
						height = 21,
						type = "atlas",
						ycenter = 0,
						x = 10,
						pic = "res/ui/common/number/up_numb.png",
						text = "0",
						startChar = 48,
						anchorPointY = 0.5,
						width = 16,
						name = "rewardValue_" .. iter_0_0
					}
				}
			}
		}
	})
end

var_0_1(var_0_0.background.children, {
	y = 46,
	x = 838,
	type = "button",
	buttons = {
		{
			pic2 = "frame:btn_default_lighted.png",
			name = "share",
			pic1 = "frame:btn_default_normal.png",
			children = {
				{
					fontSize = 22,
					type = "label",
					xcenter = 0,
					strokeSize = 2,
					ycenter = 0,
					text = language.get("450001_yyl"),
					color = ccc3(235, 209, 167),
					strokeColor = ccc3(22, 18, 13)
				}
			}
		}
	}
})

return var_0_0
