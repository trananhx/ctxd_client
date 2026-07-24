local var_0_0 = {
	nLabel = {
		style = "label_normal",
		type = "label",
		y = 570,
		width = 400,
		x = 160,
		text = language.get(211018),
		align = kCCTextAlignmentRight
	},
	pLabel = {
		style = "label_normal",
		type = "label",
		y = 470,
		width = 400,
		x = 160,
		text = language.get(211019),
		align = kCCTextAlignmentRight
	},
	startMenu = {
		x = 480,
		type = "button",
		buttons = {
			{
				pic2 = "res/ui/login/registerButton_highlight.png",
				name = "registerItem",
				pic1 = "res/ui/login/registerButton.png",
				down = 0,
				x = -100
			},
			{
				pic2 = "res/ui/login/loginButton_highlight.png",
				name = "loginItem",
				pic1 = "res/ui/login/loginButton.png",
				down = 0,
				x = 100
			},
			{
				pic2 = "res/sys/serverItem2.png",
				name = "serverItem",
				pic1 = "res/sys/serverItem1.png",
				down = 0,
				x = 350
			}
		}
	}
}

function getLoginUiData()
	return var_0_0
end
