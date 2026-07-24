local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.btnFontSize = -6
else
	var_0_0.btnFontSize = 0
end

local var_0_1 = {
	position = {
		ccp(visibleSize.width * 0.5, 75),
		ccp(visibleSize.width * 0.5 - 160 - 20, 75),
		(ccp(visibleSize.width * 0.5 + 160 + 20, 75))
	},
	position2 = {
		ccp(visibleSize.width * 0.5 - 80 - 10, 75),
		ccp(visibleSize.width * 0.5 - 240 - 40, 75),
		ccp(visibleSize.width * 0.5 + 80 + 10, 75),
		(ccp(visibleSize.width * 0.5 + 240 + 40, 75))
	},
	layout = {
		parent = "uiLayer",
		widgets = {
			{
				marginH = 10,
				name = "rankButton",
				h = 67,
				type = "button",
				w = 160,
				x = 472,
				visible = false,
				zoomOnTouchDown = true,
				y = 50,
				marginV = 10,
				normal = {
					frame = true,
					path = "kfgz_view_btn_a.png"
				},
				touched = {
					frame = true,
					path = "kfgz_view_btn_c.png"
				},
				label = {
					type = "label",
					strokeSize = 2,
					textId = 410301,
					fontSize = 24 + var_0_0.btnFontSize,
					color = colorText[10004],
					strokeColor = colorText[10005]
				}
			},
			{
				marginH = 10,
				name = "getRewardButton",
				h = 67,
				type = "button",
				w = 160,
				x = 472,
				visible = false,
				zoomOnTouchDown = true,
				y = 50,
				marginV = 10,
				normal = {
					frame = true,
					path = "kfgz_view_btn_a.png"
				},
				touched = {
					frame = true,
					path = "kfgz_view_btn_c.png"
				},
				label = {
					type = "label",
					strokeSize = 2,
					textId = 410302,
					fontSize = 24 + var_0_0.btnFontSize,
					color = colorText[10004],
					strokeColor = colorText[10005]
				}
			},
			{
				marginH = 10,
				name = "scheduleButton",
				h = 67,
				type = "button",
				w = 160,
				x = 472,
				visible = false,
				zoomOnTouchDown = true,
				y = 50,
				marginV = 10,
				normal = {
					frame = true,
					path = "kfgz_view_btn_a.png"
				},
				touched = {
					frame = true,
					path = "kfgz_view_btn_c.png"
				},
				label = {
					type = "label",
					strokeSize = 2,
					textId = 410303,
					fontSize = 24 + var_0_0.btnFontSize,
					color = colorText[10004],
					strokeColor = colorText[10005]
				}
			},
			{
				marginH = 10,
				name = "qingongButton",
				h = 67,
				type = "button",
				w = 200,
				zoomOnTouchDown = true,
				visible = false,
				marginV = 10,
				normal = {
					frame = true,
					path = "kfgz_view_btn_qg_a.png"
				},
				touched = {
					frame = true,
					path = "kfgz_view_btn_qg_c.png"
				},
				labelAnchorPoint = ccp(0.3, 0.5),
				label = {
					type = "label",
					strokeSize = 2,
					textId = 410304,
					fontSize = 24 + var_0_0.btnFontSize,
					color = colorText[10004],
					strokeColor = colorText[10005]
				}
			},
			{
				marginH = 10,
				name = "shopButton",
				h = 67,
				type = "button",
				w = 200,
				zoomOnTouchDown = true,
				visible = false,
				marginV = 10,
				normal = {
					frame = true,
					path = "kfgz_view_btn_lqjl_a.png"
				},
				touched = {
					frame = true,
					path = "kfgz_view_btn_lqjl_c.png"
				},
				labelAnchorPoint = ccp(0.3, 0.5),
				label = {
					height = 0,
					width = 140,
					type = "label",
					strokeSize = 2,
					textId = 410305,
					fontSize = 24 + var_0_0.btnFontSize,
					color = colorText[10004],
					strokeColor = colorText[10005]
				}
			}
		}
	}
}

function var_0_1.updateWhenMatchFinal()
	if var_0_1.view.widgets then
		var_0_1.view.widgets.qingongButton:setVisible(true)
		var_0_1.view.widgets.qingongButton:setPosition(var_0_1.position2[3])
		var_0_1.view.widgets.scheduleButton:setVisible(false)
	end
end

function var_0_1.change(arg_2_0)
	if var_0_1.currentPane then
		var_0_1.currentPane:destory()
	end

	var_0_1.currentPane = arg_2_0
end

function var_0_1.onRankButtonClick()
	local var_3_0 = require("lua/layer/kfworld/kfgzRank/kfgzRank")

	var_0_1.change(var_3_0)
	var_3_0:create()
end

function var_0_1.onRewardClick()
	local var_4_0 = require("lua/layer/kfworld/kfgzRank/kfgzOver")

	var_0_1.change(var_4_0)
	var_4_0:create(var_0_1.updateWhenMatchFinal)
end

function var_0_1.onScheduleClick()
	local var_5_0 = require("lua/layer/kfworld/kfgzRank/kfgzSchedule")

	var_0_1.change(var_5_0)
	var_5_0:create()
end

function var_0_1.onQingongClick()
	require("lua/layer/kfworld/kfgzReward/ui")
	kfgzRewardUI.show()
end

function var_0_1.gotoShop()
	require("lua/layer/resource/ui")
	resourceUI.show(4)
end

function var_0_1.create(arg_8_0, arg_8_1)
	rmgr.loadResource("res/ui/kfworld/kfWorldRanking.plist")

	arg_8_0.view = {}
	arg_8_0.currentPane = nil

	uiutil.initLayout(arg_8_0.view, arg_8_0.layout)
	arg_8_0.view.widgets.rankButton:addHandleOfControlEvent(var_0_1.onRankButtonClick, CCControlEventTouchUpInside)
	arg_8_0.view.widgets.getRewardButton:addHandleOfControlEvent(var_0_1.onRewardClick, CCControlEventTouchUpInside)
	arg_8_0.view.widgets.scheduleButton:addHandleOfControlEvent(var_0_1.onScheduleClick, CCControlEventTouchUpInside)
	arg_8_0.view.widgets.shopButton:addHandleOfControlEvent(var_0_1.gotoShop, CCControlEventTouchUpInside)
	arg_8_0.view.widgets.qingongButton:addHandleOfControlEvent(var_0_1.onQingongClick, CCControlEventTouchUpInside)
	arg_8_0.view.widgets.rankButton:setVisible(true)
	arg_8_0.view.widgets.getRewardButton:setVisible(true)
	arg_8_0.view.widgets.scheduleButton:setVisible(true)
	arg_8_0.view.widgets.rankButton:setPosition(var_0_1.position[1])
	arg_8_0.view.widgets.getRewardButton:setPosition(var_0_1.position[2])
	arg_8_0.view.widgets.scheduleButton:setPosition(var_0_1.position[3])
	log.info("@@ 跨服国战 state ", arg_8_1)

	kfworld = kfworld or {}
	kfworld.matchState = arg_8_1

	if arg_8_1 == 1 then
		arg_8_0.onRewardClick()
		arg_8_0.view.widgets.shopButton:setVisible(true)
		arg_8_0.view.widgets.rankButton:setPosition(var_0_1.position2[1])
		arg_8_0.view.widgets.getRewardButton:setPosition(var_0_1.position2[2])
		arg_8_0.view.widgets.scheduleButton:setPosition(var_0_1.position2[3])
		arg_8_0.view.widgets.shopButton:setPosition(var_0_1.position2[4])
	elseif arg_8_1 == 3 then
		arg_8_0.onScheduleClick()
		arg_8_0.view.widgets.rankButton:setVisible(false)
		arg_8_0.view.widgets.getRewardButton:setVisible(false)
		arg_8_0.view.widgets.scheduleButton:setPosition(var_0_1.position[1])
	elseif arg_8_1 == 4 then
		arg_8_0.onQingongClick()
		arg_8_0.view.widgets.qingongButton:setVisible(true)
		arg_8_0.view.widgets.shopButton:setVisible(true)
		arg_8_0.view.widgets.getRewardButton:setVisible(false)
		arg_8_0.view.widgets.scheduleButton:setVisible(false)
		arg_8_0.view.widgets.qingongButton:setPosition(var_0_1.position[2])
		arg_8_0.view.widgets.rankButton:setPosition(var_0_1.position[1])
		arg_8_0.view.widgets.shopButton:setPosition(var_0_1.position[3])
	elseif arg_8_1 == 5 then
		arg_8_0.onScheduleClick()
		arg_8_0.view.widgets.getRewardButton:setVisible(false)
	end
end

function var_0_1.destory(arg_9_0)
	if arg_9_0.currentPane then
		arg_9_0.currentPane:destory()

		arg_9_0.currentPane = nil
	end

	if arg_9_0.view and arg_9_0.view.widgets then
		for iter_9_0, iter_9_1 in pairs(arg_9_0.view.widgets) do
			smgr.getLayer("uiLayer"):removeChild(iter_9_1, true)
		end

		arg_9_0.view = {}
	end
end

return var_0_1
