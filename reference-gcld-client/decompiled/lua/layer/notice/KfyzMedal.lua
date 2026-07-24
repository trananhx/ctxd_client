local var_0_0 = {
	jbqgxz = 10075,
	wmxgxz = 10073,
	yydgxz = 10076,
	sswcxz = 10077,
	frzbxz = 10074
}
local var_0_1 = class("KfyzMedal", function()
	return createBaseLayer()
end)

var_0_1.layout = {
	name = "layer",
	x = 0,
	type = "layerColor",
	y = 0,
	color = ccc4(0, 0, 0, 200),
	width = visibleSize.width,
	height = visibleSize.height,
	children = {
		{
			name = "node",
			type = "node",
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 - 30,
			children = {
				{
					y = 20,
					name = "light",
					x = 10,
					type = "sprite"
				},
				{
					zoomOnTouchDown = true,
					name = "btn_medal",
					h = 200,
					type = "button",
					w = 200,
					y = 0,
					x = 0,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					children = {
						{
							y = 100,
							name = "icon",
							x = 100,
							type = "sprite"
						}
					}
				}
			}
		}
	}
}

function var_0_1.onGetMedal(arg_2_0)
	local function var_2_0(arg_3_0)
		local var_3_0 = arg_3_0.action.data
		local var_3_1 = {}
		local var_3_2 = {
			id = var_0_0[user.medal.pic],
			value = arg_3_0.action.data.getFreeTimesReward
		}

		table.insert(var_3_1, var_3_2)
		globalAction_gotResource(var_3_1)

		user.canGetMedal = var_3_0.canGetMedal
		user.conquestRate = var_3_0.conquestRate
		user.medal = var_3_0.medal

		notice.control.refreshLayer()
		arg_2_0:removeFromParentAndCleanup(true)
	end

	cmgr.sendRequest(var_2_0, actions.kfyzGetMedal)
end

function var_0_1.ctor(arg_4_0, arg_4_1)
	log.info("@@ 远征授勋")

	arg_4_0.view = {}

	uiutil.initWidgets(arg_4_0.view, arg_4_0.layout)
	swallowTouch(arg_4_0)
	arg_4_0:addChild(arg_4_0.view.widgets.layer)

	local var_4_0 = rmgr.getAnimation("treasureLight")
	local var_4_1 = CCAnimation:createWithSpriteFrames(var_4_0, 0.1)
	local var_4_2 = CCAnimate:create(var_4_1)

	arg_4_0.view.widgets.light:runAction(CCRepeatForever:create(var_4_2))
	arg_4_0.view.widgets.icon:setDisplayFrame(tool.spriteFrameByName(string.format("%s.jpg", user.medal.pic)))
	arg_4_0.view.widgets.btn_medal:addHandleOfControlEvent(function()
		log.info("btn_medal")
		arg_4_0:onGetMedal()
	end, CCControlEventTouchUpInside)
end

return var_0_1
