local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.doubleCostX = -60
else
	var_0_0.doubleCostX = 0
end

local var_0_1 = {
	parent = "uiLayer",
	widgets = {
		{
			zoomOnTouchDown = false,
			name = "rankButton",
			h = 67,
			type = "button",
			w = 200,
			zorder = 10,
			y = 170,
			normal = {
				frame = true,
				path = "btn_xflts_wdph_a.png"
			},
			touched = {
				frame = true,
				path = "btn_xflts_wdph_c.png"
			},
			x = visibleSize.width - 110
		},
		{
			zoomOnTouchDown = false,
			name = "gotoShopButton",
			h = 67,
			type = "button",
			w = 200,
			zorder = 10,
			y = 95,
			normal = {
				frame = true,
				path = "btn_xflts_dqsc_a.png"
			},
			touched = {
				frame = true,
				path = "btn_xflts_dqsc_c.png"
			},
			x = visibleSize.width - 110
		},
		{
			zoomOnTouchDown = false,
			name = "doubleButton",
			h = 67,
			type = "button",
			w = 200,
			zorder = 10,
			normal = {
				frame = true,
				path = "btn_xflts_dqfb_a.png"
			},
			touched = {
				frame = true,
				path = "btn_xflts_dqfb_c.png"
			},
			x = visibleSize.width - 110,
			y = visibleSize.height * 0.5
		},
		{
			text = "",
			name = "tiketNumLabel",
			type = "label",
			style = "label_white_24",
			zorder = 10,
			x = visibleSize.width - 110 + var_0_0.doubleCostX,
			y = visibleSize.height * 0.5 - 40,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			text = "",
			name = "needGoldLabel",
			type = "label",
			style = "label_white_24",
			zorder = 10,
			x = visibleSize.width - 110,
			y = visibleSize.height * 0.5 + 40,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			visible = false,
			name = "doubleMaxLabel",
			zorder = 10,
			type = "label",
			textId = 390409,
			style = "label_white_24",
			x = visibleSize.width - 110,
			y = visibleSize.height * 0.5,
			anchorPoint = ccp(0.5, 0.5),
			color = ccc3(255, 68, 68)
		}
	}
}
local var_0_2 = {}

local function var_0_3()
	require("lua/layer/resource/ui")
	resourceUI.show(4)
end

function var_0_2.create(arg_2_0, arg_2_1)
	local var_2_0 = {}

	uiutil.initLayout(var_2_0, var_0_1)

	arg_2_1.kfwdCommonUi = var_2_0

	function var_2_0.updateDoubleInfo(arg_3_0)
		if arg_2_1.kfwdInfo.doubleCost ~= 0 then
			arg_3_0.widgets.needGoldLabel:setString(language.get(390407, arg_2_1.kfwdInfo.doubleCost))
			arg_3_0.widgets.doubleButton:setVisible(true)
			arg_3_0.widgets.needGoldLabel:setVisible(true)
			arg_3_0.widgets.doubleMaxLabel:setVisible(false)
		else
			arg_3_0.widgets.doubleButton:setVisible(false)
			arg_3_0.widgets.doubleMaxLabel:setVisible(true)
			arg_3_0.widgets.needGoldLabel:setVisible(false)
		end
	end

	function var_2_0.updateVisible(arg_4_0)
		log.info("@@ 通用ui.战斗状态：", arg_2_1.kfwdInfo.kfwdState)

		if arg_2_1.kfwdInfo.kfwdState == kfwdState.fight then
			var_2_0.widgets.rankButton:setVisible(false)
			var_2_0.widgets.doubleButton:setVisible(true)
			var_2_0.widgets.gotoShopButton:setVisible(false)
		elseif arg_2_1.kfwdInfo.kfwdState == kfwdState.result then
			var_2_0.widgets.rankButton:setVisible(true)
			var_2_0.widgets.doubleButton:setVisible(false)
			var_2_0.widgets.gotoShopButton:setVisible(true)
			var_2_0.widgets.needGoldLabel:setVisible(false)
			var_2_0.widgets.doubleMaxLabel:setVisible(false)
			var_2_0.widgets.tiketNumLabel:setVisible(false)
		elseif arg_2_1.kfwdInfo.kfwdState == kfwdState.over then
			var_2_0.widgets.rankButton:setVisible(false)
			var_2_0.widgets.doubleButton:setVisible(false)
			var_2_0.widgets.gotoShopButton:setVisible(true)
		elseif arg_2_1.kfwdInfo.kfwdState == kfwdState.prepare then
			var_2_0.widgets.rankButton:setVisible(true)
			var_2_0.widgets.gotoShopButton:setVisible(true)
		end
	end

	function var_2_0.clearup(arg_5_0)
		arg_2_1.layerTabel.uiLayer:removeChild(arg_5_0.widgets.doubleButton, true)
		arg_2_1.layerTabel.uiLayer:removeChild(arg_5_0.widgets.gotoShopButton, true)
		arg_2_1.layerTabel.uiLayer:removeChild(arg_5_0.widgets.rankButton, true)
		arg_2_1.layerTabel.uiLayer:removeChild(arg_5_0.widgets.doubleMaxLabel, true)
		arg_2_1.layerTabel.uiLayer:removeChild(arg_5_0.widgets.tiketNumLabel, true)
		arg_2_1.layerTabel.uiLayer:removeChild(arg_5_0.widgets.needGoldLabel, true)
	end

	local function var_2_1()
		local function var_6_0(arg_7_0)
			local function var_7_0(arg_8_0)
				arg_2_1.updateKfwdInfo(arg_8_0.data)
			end

			kfcmgr.sendRequest(var_7_0, actions.kfwdMatchRTInfo)
		end

		local function var_6_1()
			cmgr.sendRequest(var_6_0, actions.kfwdDoubleReward, arg_2_1.kfwdInfo.round, arg_2_1.kfwdInfo.doubleCoef + 1)
		end

		messageBox.showChargeWin(language.get(10003), language.get(390410, arg_2_1.kfwdInfo.doubleCost), "kfDqGold", var_6_1)
	end

	local function var_2_2()
		arg_2_1.showKfwdJifenbang({
			hideGetReward = true
		})
	end

	var_2_0.widgets.rankButton:addHandleOfControlEvent(var_2_2, CCControlEventTouchUpInside)
	var_2_0.widgets.doubleButton:addHandleOfControlEvent(var_2_1, CCControlEventTouchUpInside)
	var_2_0.widgets.gotoShopButton:addHandleOfControlEvent(var_0_3, CCControlEventTouchUpInside)

	if arg_2_1.kfwdInfo.kfwdState == kfwdState.prepare or arg_2_1.kfwdInfo.kfwdState == kfwdState.fight then
		log.info("@@ doubleCost ", arg_2_1.kfwdInfo.doubleCost)
		var_2_0.widgets.tiketNumLabel:setString(language.get(390406, arg_2_1.kfwdInfo.ticket))
		var_2_0:updateDoubleInfo()
	end

	var_2_0:updateVisible()

	return var_2_0
end

return var_0_2
