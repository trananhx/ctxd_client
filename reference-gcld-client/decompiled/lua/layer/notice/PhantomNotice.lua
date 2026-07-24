local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = class("PhantomNotice", function()
	return createBaseLayer()
end)

var_0_1.layout = {
	y = 0,
	name = "Scene",
	type = "node",
	x = 0,
	children = {
		{
			y = 0,
			name = "bg",
			type = "sprite",
			x = visibleSize.width * 0.5,
			anchorPoint = ccp(0.5, 0),
			pic = {
				path = "res/ui/instance/bonus/fb_Bonus_view.png"
			},
			children = {
				{
					y = 0,
					type = "sprite",
					x = 0,
					anchorPoint = ccp(0, 0),
					pic = {
						path = "res/ui/guide/npc_xq.png"
					}
				},
				{
					fontSize = 25,
					name = "msg",
					y = 160,
					type = "label",
					x = 570,
					height = 0,
					style = "label_warlock",
					width = 600,
					halign = kCCTextAlignmentLeft
				},
				{
					name = "btn_ok",
					h = 58,
					type = "button",
					w = 140,
					y = 50,
					x = 570,
					normal = {
						frame = true,
						path = "btn3_gre_a.png"
					},
					touched = {
						frame = true,
						path = "btn3_gre_c.png"
					},
					children = {
						{
							fontSize = 22,
							style = "label_warlock",
							y = 29,
							type = "label",
							x = 70,
							textId = 450103,
							color = var_0_0
						}
					}
				}
			}
		}
	}
}

function var_0_1.showPanel(arg_2_0, arg_2_1)
	arg_2_0.info = arg_2_1

	local var_2_0 = {}

	if arg_2_1.leftTujinNum > 0 then
		table.insert(var_2_0, language.get(450106, arg_2_1.leftTujinNum))
	end

	if arg_2_1.leftSoloNum > 0 then
		table.insert(var_2_0, language.get(450107, arg_2_1.leftSoloNum))
	end

	if arg_2_1.leftHbqNum > 0 then
		table.insert(var_2_0, language.get(450108, arg_2_1.leftHbqNum))
	end

	if arg_2_1.leftFusion > 0 then
		table.insert(var_2_0, language.get(450109, arg_2_1.leftFusion))
	end

	if arg_2_1.leftFision > 0 then
		table.insert(var_2_0, language.get(450110, arg_2_1.leftFision))
	end

	local var_2_1 = table.concat(var_2_0, "，")

	arg_2_0.view.widgets.msg:setString(language.get(450105, var_2_1))
end

function var_0_1.ctor(arg_3_0, arg_3_1, arg_3_2)
	log.info("@@ 特殊幻影")

	arg_3_0.view = {}

	uiutil.initWidgets(arg_3_0.view, arg_3_0.layout)
	arg_3_0:addChild(arg_3_0.view.widgets.Scene)
	arg_3_1:addChild(arg_3_0)
	swallowTouch(arg_3_0)
	arg_3_0.view.widgets.btn_ok:addHandleOfControlEvent(function()
		log.info("btn_ok")
		arg_3_0:removeFromParentAndCleanup(true)
	end, CCControlEventTouchUpInside)
	arg_3_0:showPanel(arg_3_2)
end

return var_0_1
