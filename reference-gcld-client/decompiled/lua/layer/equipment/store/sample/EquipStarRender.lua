return {
	render = function(arg_1_0, arg_1_1, arg_1_2)
		local var_1_0 = {
			index = arg_1_2,
			starRenderHandler = function(arg_2_0)
				if arg_1_2 < arg_1_0.solidStarNum then
					arg_2_0.pic = {
						frame = true,
						path = "star_light.png"
					}
				else
					arg_2_0.pic = {
						frame = true,
						path = "star_dark.png"
					}
				end
			end
		}

		uiutil.initUI(var_1_0, arg_1_1)

		return var_1_0.starSprite, var_1_0
	end
}
