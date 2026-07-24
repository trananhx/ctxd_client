local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.timeX = 60
else
	var_0_0.timeX = 0
end

local var_0_1 = {
	layout = {
		parent = "uiLayer",
		widgets = {
			{
				name = "panel",
				type = "sprite",
				pic = {
					frame = false,
					path = "res/ui/kfworld/kfgz_js_bg.png"
				},
				x = visibleSize.width * 0.5,
				y = visibleSize.height * 0.5,
				children = {
					{
						x = 363.5,
						name = "succSprite",
						y = 68.5,
						type = "sprite",
						visible = false,
						pic = {
							frame = true,
							path = "xflts_res_sl.png"
						}
					},
					{
						x = 363.5,
						name = "failedSprite",
						y = 68.5,
						type = "sprite",
						visible = false,
						pic = {
							frame = true,
							path = "xflts_res_sb.png"
						}
					},
					{
						y = -12,
						name = "calcLabel",
						style = "label_white_24",
						type = "label",
						x = 350,
						textId = 410210,
						anchorPoint = ccp(0.5, 0.5)
					},
					{
						y = -12,
						name = "timerNode",
						type = "node",
						x = 422 + var_0_0.timeX
					}
				}
			}
		}
	}
}

function var_0_1.onTimerOver()
	if var_0_1.overCallback then
		var_0_1.overCallback(var_0_1.callbackArgs)
	end

	if var_0_1.view and var_0_1.view.widgets then
		smgr.getLayer("uiLayer"):removeChild(var_0_1.view.widgets.panel, true)

		var_0_1.view = {}
	end
end

function var_0_1.create(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	rmgr.loadResource("res/ui/battle/kfwd/kfwd.plist")

	arg_2_0.overCallback = arg_2_2
	arg_2_0.callbackArgs = arg_2_3
	arg_2_0.view = {}

	uiutil.initLayout(arg_2_0.view, var_0_1.layout)

	if arg_2_1 then
		arg_2_0.view.widgets.succSprite:setVisible(true)
	else
		arg_2_0.view.widgets.failedSprite:setVisible(true)
	end

	local var_2_0 = createTimerLabel(10000, "@S", "Thonburi", 24, var_0_1.onTimerOver, nil, nil, colorTips.red)

	arg_2_0.view.widgets.timerNode:addChild(var_2_0)
end

return var_0_1
