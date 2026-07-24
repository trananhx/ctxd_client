local var_0_0 = colorQuality[5]
local var_0_1 = class("TelFare", function()
	return createBaseLayer()
end)

var_0_1.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = false,
		path = "res/ui/activity/telFare/zcshf_bg.jpg"
	},
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			fontSize = 22,
			name = "leftTime",
			scale = 1.5909090909090908,
			type = "label",
			style = "label_warlock",
			y = 475,
			x = 770,
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_0
		},
		{
			zoomOnTouchDown = true,
			name = "btn_reward",
			h = 82,
			type = "button",
			w = 329,
			y = 100,
			x = 458,
			normal = {
				frame = false,
				path = "res/ui/activity/telFare/czshf_btn_a.png"
			},
			touched = {
				frame = false,
				path = "res/ui/activity/telFare/czshf_btn_c.png"
			}
		}
	}
}

function var_0_1.onGetTelFareReward(arg_2_0)
	local function var_2_0(arg_3_0)
		local var_3_0 = arg_3_0.action.data

		if var_3_0.eventCd > 0 then
			local var_3_1 = var_3_0.yx
			local var_3_2 = var_3_0.userId
			local var_3_3 = var_3_0.playerId
			local var_3_4 = user.serverId
			local var_3_5 = "46714ae8cdd0980eea87f33b46d9a3f7"
			local var_3_6 = Utils:md5ToLua(var_3_1 .. var_3_2 .. var_3_3 .. var_3_4 .. var_3_5)

			log.info("zhu@@@", var_3_1 .. var_3_2 .. var_3_3 .. var_3_4 .. var_3_5, var_3_6)

			local var_3_7 = "http://act.feiliu.com/gc/shf/login?" .. "yx=%s&userId=%s&playerId=%s&serverId=%s&ticket=%s"
			local var_3_8 = string.format(var_3_7, var_3_1, var_3_2, var_3_3, var_3_4, var_3_6)

			log.info("zhu@@@url", var_3_8)
			CCApplication:sharedApplication():openURL(var_3_8)
		end
	end

	cmgr.sendRequest(var_2_0, actions.getTelFareActivity)
end

function var_0_1.showPanel(arg_4_0, arg_4_1)
	arg_4_0.info = arg_4_1
end

function var_0_1.ctor(arg_5_0, arg_5_1, arg_5_2)
	log.info("@@ 注册送礼活动")

	arg_5_0.view = {}

	uiutil.initWidgets(arg_5_0.view, arg_5_0.layout)

	arg_5_0.leftTime = arg_5_0.view.widgets.leftTime

	if arg_5_1 then
		arg_5_0:addChild(arg_5_0.view.widgets.panel)
		arg_5_1:addChild(arg_5_0)
	end

	arg_5_0.view.widgets.btn_reward:addHandleOfControlEvent(function()
		log.info("btn_reward")
		arg_5_0:onGetTelFareReward()
	end, CCControlEventTouchUpInside)
	arg_5_0:showPanel(arg_5_2)
end

return var_0_1
