local var_0_0 = class("LookActivityUiData")

function var_0_0.ctor(arg_1_0)
	arg_1_0:createUiData()
end

function var_0_0.createUiData(arg_2_0)
	arg_2_0.layout = {
		name = "panel",
		type = "sprite",
		pic = {
			frame = true,
			path = "cdsh_bg.png"
		},
		x = visibleSize.width * 0.5,
		y = visibleSize.height * 0.5 - 30,
		children = {
			{
				y = 465,
				name = "title",
				type = "sprite",
				x = 457.5,
				pic = {
					frame = false,
					path = "res/ui/common/text/activity/lookActivity/bt_cdsh.png"
				}
			},
			{
				fontSize = 24,
				name = "leftTime",
				y = 465,
				type = "label",
				x = 690,
				style = "label_warlock",
				anchor = ccp(0, 0.5),
				color = color_red
			},
			{
				y = 253,
				name = "picture1",
				type = "sprite",
				x = 160,
				pic = {
					frame = true,
					path = "cdsh_kapai_1.png"
				}
			},
			{
				y = 253,
				name = "picture2",
				type = "sprite",
				x = 457.5,
				pic = {
					frame = true,
					path = "cdsh_kapai_2.png"
				}
			},
			{
				y = 253,
				name = "pictrue3",
				type = "sprite",
				x = 755,
				pic = {
					frame = true,
					path = "cdsh_kapai_3.png"
				}
			},
			{
				name = "start_btn",
				h = 58,
				type = "button",
				w = 170,
				y = 43,
				x = 457.5,
				normal = {
					frame = true,
					path = "cdsh_btn_2.png"
				},
				touched = {
					frame = true,
					path = "cdsh_btn_1.png"
				},
				children = {
					{
						fontSize = 24,
						style = "label_warlock",
						y = 29,
						type = "label",
						x = 85,
						textId = "130057_gcldhw",
						color = colorText[10004]
					}
				}
			}
		}
	}
end

function var_0_0.getLayout(arg_3_0)
	return arg_3_0.layout or {}
end

return var_0_0
