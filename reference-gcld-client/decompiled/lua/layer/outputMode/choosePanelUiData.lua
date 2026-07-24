local var_0_0 = class("choosePanelUiData")
local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.descLabelX = 100
	var_0_1.rateLabelX = 30
else
	var_0_1.descLabelX = 0
	var_0_1.rateLabelX = 0
end

local var_0_2 = {
	"profit_navi_icon_up_150.png",
	"profit_navi_icon_up_200.png",
	"profit_navi_icon_up_300.png"
}
local var_0_3 = {
	"profit_1d_2.png",
	"profit_7d_2.png",
	"profit_30d_2.png"
}

function var_0_0.ctor(arg_1_0)
	local function var_1_0(arg_2_0, arg_2_1)
		arg_2_0[#arg_2_0 + 1] = arg_2_1

		return arg_2_1
	end

	arg_1_0.data = {}
	arg_1_0.data.background = {
		xcenter = 0,
		type = "pic",
		ycenter = -30,
		pic = "res/ui/outputMode/profit_view_bg.jpg",
		children = {}
	}

	var_1_0(arg_1_0.data.background.children, {
		xcenter = 0,
		top = 20,
		pic = "frame:profit_tit.png",
		type = "pic"
	})

	local var_1_1 = var_1_0(arg_1_0.data.background.children, {
		xcenter = 0,
		name = "board",
		down = 14,
		type = "pic",
		z = 1,
		pic = "res/ui/outputMode/profit_navi_con.png",
		children = {}
	})

	var_1_0(var_1_1.children, {
		fontSize = 22,
		y = 389,
		type = "label",
		x = 692,
		text = language.get(250012),
		color = colorText[10002]
	})
	var_1_0(var_1_1.children, {
		fontSize = 22,
		name = "rate",
		text = "100%↑",
		type = "label",
		y = 389,
		color = colorText[10002],
		x = 784 + var_0_1.rateLabelX
	})
	var_1_0(var_1_1.children, {
		fontSize = 22,
		y = 344,
		type = "label",
		x = 692,
		text = language.get(250013),
		color = colorText[10002]
	})
	var_1_0(var_1_1.children, {
		fontSize = 22,
		name = "timer",
		type = "label",
		y = 344,
		text = language.get(250014),
		color = colorText[10002],
		x = 790 + var_0_1.rateLabelX * 1.4
	})
	var_1_0(var_1_1.children, {
		fontSize = 22,
		name = "desc",
		text = "",
		type = "label",
		y = 227,
		color = colorText[10002],
		x = 153 + var_0_1.descLabelX
	})

	for iter_1_0 = 1, 3 do
		var_1_0(var_1_1.children, {
			type = "button",
			buttons = {
				{
					y = 120,
					name = "button_" .. iter_1_0,
					pic1 = {
						pics = {
							{
								pic = "res/ui/outputMode/profit_list_view_bg.jpg",
								type = "pic",
								children = {
									{
										x = 122,
										y = 102,
										type = "pic",
										name = "day_" .. iter_1_0,
										pic = "frame:" .. var_0_3[iter_1_0]
									},
									{
										x = 92,
										y = 25,
										pic = "frame:icon_gold.png",
										type = "pic"
									},
									{
										fontSize = 22,
										text = "10",
										type = "label",
										font = "Thonburi-Blod",
										x = 127,
										y = 25,
										name = "gold_" .. iter_1_0,
										color = colorText[10002]
									}
								}
							}
						}
					},
					pic2 = {
						pics = {
							{
								pic = "res/ui/outputMode/profit_list_view_on.jpg",
								type = "pic",
								children = {
									{
										x = 122,
										y = 102,
										type = "pic",
										name = "day_on_" .. iter_1_0,
										pic = "frame:" .. var_0_3[iter_1_0]
									},
									{
										x = 92,
										y = 25,
										pic = "frame:icon_gold.png",
										type = "pic"
									},
									{
										fontSize = 22,
										text = "10",
										type = "label",
										font = "Thonburi-Blod",
										x = 127,
										y = 25,
										name = "gold_on_" .. iter_1_0,
										color = colorText[10002]
									}
								}
							}
						}
					},
					x = 441.5 + (iter_1_0 - 2) * 260
				}
			}
		})
	end

	for iter_1_1 = 1, 3 do
		local var_1_2 = var_1_0(arg_1_0.data.background.children, {
			y = 356,
			type = "pic",
			z = 2,
			pic = "frame:profit_navi_view_bg.png",
			name = "tab_" .. iter_1_1,
			x = 115 + (iter_1_1 - 1) * 150,
			children = {}
		})

		var_1_0(var_1_2.children, {
			xcenter = 0,
			type = "pic",
			ycenter = 0,
			pic = "frame:profit_navi_icon_bg.png",
			children = {
				{
					left = 5,
					down = 5,
					type = "pic",
					pic = "res/ui/task/get_icon_silver.png",
					name = "resIcon_" .. iter_1_1
				},
				{
					xcenter = 0,
					ycenter = 0,
					type = "pic",
					pic = "frame:" .. var_0_2[iter_1_1]
				}
			}
		})
	end
end

function var_0_0.getData(arg_3_0)
	return arg_3_0.data or {}
end

return var_0_0
