local var_0_0 = class("IronMineUiData")

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.ui = arg_1_1
end

function var_0_0.getUiData(arg_2_0)
	return {
		background = {
			xcenter = 0,
			ycenter = 0,
			pic = "res/ui/ironMine/sjbt_bg.jpg",
			type = "pic"
		},
		preBackground = {
			pic = "res/ui/ironMine/sjbt_bg.jpg",
			type = "pic",
			x = visibleSize.width / 2 - 1386,
			y = visibleSize.height / 2
		},
		nextBackground = {
			pic = "res/ui/ironMine/sjbt_bg.jpg",
			type = "pic",
			x = visibleSize.width / 2 + 1386,
			y = visibleSize.height / 2
		}
	}
end

return var_0_0
