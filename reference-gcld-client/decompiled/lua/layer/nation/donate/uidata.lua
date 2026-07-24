local var_0_0 = class("donateUiData")

function var_0_0.ctor(arg_1_0)
	local function var_1_0(arg_2_0, arg_2_1)
		arg_2_0[#arg_2_0 + 1] = arg_2_1

		return arg_2_1
	end

	arg_1_0.data = {}
	arg_1_0.data.background = {
		xcenter = 0,
		type = "pic",
		ycenter = -50,
		pic = "res/ui/nation/invest_view_bg.jpg",
		children = {}
	}

	var_1_0(arg_1_0.data.background.children, {
		xcenter = 0,
		y = 472,
		pic = "frame:invest_tit.png",
		type = "pic"
	})
	var_1_0(arg_1_0.data.background.children, {
		xcenter = 0,
		name = "donateEventPic",
		y = 291,
		type = "pic",
		pic = "res/ui/nation/101.jpg"
	})
	var_1_0(arg_1_0.data.background.children, {
		y = 116,
		x = 233,
		type = "pic",
		pic = "frame:invest_degr_view.png",
		children = {
			{
				xcenter = 0,
				name = "donateProgress",
				percentage = 50,
				type = "process",
				ycenter = 0,
				pic = "frame:invest_degr_con.png"
			},
			{
				fontSize = 22,
				name = "donateProgressLabel",
				text = "50%",
				type = "label",
				ycenter = 0,
				x = 343
			}
		}
	})
	var_1_0(arg_1_0.data.background.children, {
		fontSize = 22,
		y = 76,
		type = "label",
		x = 123,
		text = language.get(94003),
		children = {
			{
				x = 84,
				y = 0,
				pic = "res/ui/task/get_icon_silver.png",
				type = "pic"
			},
			{
				fontSize = 22,
				name = "donateTarget",
				text = "10000000",
				type = "label",
				x = 190,
				width = 150,
				y = 0,
				align = kCCTextAlignmentLeft
			}
		}
	})
	var_1_0(arg_1_0.data.background.children, {
		fontSize = 22,
		y = 41,
		type = "label",
		x = 123,
		text = language.get(94004),
		children = {
			{
				x = 84,
				y = 0,
				pic = "res/ui/task/get_icon_silver.png",
				type = "pic"
			},
			{
				fontSize = 22,
				name = "donateNow",
				text = "9999999",
				type = "label",
				x = 190,
				width = 150,
				y = 0,
				align = kCCTextAlignmentLeft
			}
		}
	})
	var_1_0(arg_1_0.data.background.children, {
		x = 506,
		name = "donateTicket",
		y = 116,
		type = "pic",
		visible = false,
		pic = "frame:invest_icon_ticket.png",
		children = {
			{
				fontSize = 22,
				name = "donateTicketNum",
				text = "×50",
				type = "label",
				ycenter = 0,
				x = 90
			}
		}
	})
	var_1_0(arg_1_0.data.background.children, {
		x = 629,
		name = "donateSilver",
		y = 116,
		type = "pic",
		visible = false,
		pic = "res/ui/task/get_icon_silver.png",
		children = {
			{
				fontSize = 22,
				text = "10000",
				type = "label",
				ycenter = 0,
				x = 80
			}
		}
	})
	var_1_0(arg_1_0.data.background.children, {
		type = "button",
		buttons = {
			{
				pic2 = "frame:nationButtonGreen1.png",
				name = "donateButton",
				pic1 = "frame:nationButtonGreen.png",
				y = 116,
				visible = false,
				x = 814,
				children = {
					{
						fontSize = 22,
						name = "donateButtonLabel",
						type = "label",
						ycenter = 0,
						xcenter = 0,
						text = language.get(94006)
					}
				}
			}
		}
	})
	var_1_0(arg_1_0.data.background.children, {
		type = "button",
		buttons = {
			{
				pic2 = "frame:nationButtonGreen1.png",
				name = "donateCdRecover",
				pic1 = "frame:nationButtonGreen.png",
				y = 116,
				visible = false,
				x = 814,
				children = {
					{
						fontSize = 22,
						name = "donateButtonLabel",
						type = "label",
						ycenter = 0,
						xcenter = 0,
						text = language.get(94005)
					}
				}
			}
		}
	})
end

function var_0_0.getData(arg_3_0)
	return arg_3_0.data or {}
end

return var_0_0
