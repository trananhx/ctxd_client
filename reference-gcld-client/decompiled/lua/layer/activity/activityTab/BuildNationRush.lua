local var_0_0 = class("BuildNationRush", function()
	return createBaseLayer()
end)
local var_0_1 = require("res/native/offset").get("layer.activity.BuildNationRush")

var_0_0.layout = {
	name = "Scene",
	type = "node",
	x = visibleSize.width / 2,
	y = visibleSize.height / 2,
	children = {
		{
			x = 0,
			name = "panel",
			y = -28,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/comment/bg1.jpg"
			}
		},
		{
			y = 178,
			x = 0,
			type = "sprite",
			pic = {
				path = "res/ui/activity/BuildNaitionRush/jgcc_title.png"
			}
		},
		{
			fontSize = 24,
			name = "leftTime",
			style = "label_warlock",
			type = "label",
			y = 168,
			x = 320,
			color = ccc3(255, 0, 0)
		},
		{
			y = 114,
			x = 0,
			type = "sprite",
			pic = {
				path = "res/ui/activity/generalDrink/zjlyx_line.png"
			}
		},
		{
			y = -90,
			name = "Sprite_1",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/activity/BuildNaitionRush/jgcc_bg.jpg"
			},
			children = {
				{
					y = 66.6675,
					name = "Sprite_2",
					type = "sprite",
					x = 229.0562,
					pic = {
						path = "res/ui/activity/BuildNaitionRush/jgcc_word_di.png"
					},
					children = {
						{
							y = 89.4184,
							name = "Sprite_4",
							type = "sprite",
							x = 231.8054,
							pic = {
								path = "res/ui/activity/BuildNaitionRush/jgcc_word_01_1.png"
							}
						},
						{
							y = 46.9193,
							name = "Sprite_4_Copy",
							type = "sprite",
							x = 231.8055,
							scale = 1 + (var_0_1.spriteScale or 0),
							pic = {
								path = "res/ui/activity/BuildNaitionRush/jgcc_word_01_2.png"
							}
						}
					}
				},
				{
					y = 66.1675,
					name = "Sprite_2_Copy",
					type = "sprite",
					x = 682.0564,
					pic = {
						path = "res/ui/activity/BuildNaitionRush/jgcc_word_di.png"
					},
					children = {
						{
							y = 91.4168,
							name = "Sprite_6",
							type = "sprite",
							x = 229.5536,
							pic = {
								path = "res/ui/activity/BuildNaitionRush/jgcc_word_02_1.png"
							}
						},
						{
							y = 49.4167,
							name = "Sprite_6_Copy",
							type = "sprite",
							x = 229.5536,
							scale = 1 + (var_0_1.spriteScale or 0),
							pic = {
								path = "res/ui/activity/BuildNaitionRush/jgcc_word_02_2.png"
							}
						}
					}
				}
			}
		}
	}
}

function var_0_0.ctor(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.data = arg_2_2
	arg_2_0.view = {}

	uiutil.initWidgets(arg_2_0.view, arg_2_0.layout)

	arg_2_0.leftTime = arg_2_0.view.widgets.leftTime

	if arg_2_1 then
		arg_2_0:addChild(arg_2_0.view.widgets.Scene)
		arg_2_1:addChild(arg_2_0)
	end
end

function var_0_0.onEnter(arg_3_0)
	return
end

function var_0_0.onExit(arg_4_0)
	return
end

function var_0_0.onTouchBegan(arg_5_0, arg_5_1, arg_5_2)
	return
end

function var_0_0.onTouchMoved(arg_6_0, arg_6_1, arg_6_2)
	return
end

function var_0_0.onTouchEnded(arg_7_0, arg_7_1, arg_7_2)
	return
end

function var_0_0.onTouchCancelled(arg_8_0, arg_8_1, arg_8_2)
	return
end

return var_0_0
