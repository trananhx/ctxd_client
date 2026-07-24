return {
	create = function(arg_1_0, arg_1_1, arg_1_2)
		tool.safeRemoveChildByTag(arg_1_1.layerTabel.uiLayer, uiTag.chetui)

		local var_1_0 = require("res/layout/battle/chetuiPanel")
		local var_1_1 = {}

		uiutil.initWidgets(var_1_1, var_1_0)

		local var_1_2 = {}
		local var_1_3 = 90
		local var_1_4 = 150

		if arg_1_2.gIds then
			for iter_1_0, iter_1_1 in pairs(arg_1_2.gIds) do
				local var_1_5 = require("lua/game/battle/widget/generalSelector"):create(var_1_1.widgets.chetuiPanel)

				var_1_5:init(iter_1_1)
				var_1_5:setPosition(ccp(var_1_3, var_1_4))
				table.insert(var_1_2, var_1_5)

				var_1_3 = var_1_3 + 92
			end
		end

		local function var_1_6()
			tool.safeRemoveChildByTag(arg_1_1.layerTabel.uiLayer, uiTag.chetui)
		end

		local function var_1_7()
			local var_3_0 = ""

			for iter_3_0, iter_3_1 in pairs(var_1_2) do
				if iter_3_1.isCheck and iter_3_1.general then
					var_3_0 = var_3_0 .. tostring(iter_3_1.general.gId)
					var_3_0 = var_3_0 .. "#"
				end
			end

			arg_1_1.cheTui2(var_3_0)
			var_1_6()
		end

		var_1_1.widgets.closeButton:addHandleOfControlEvent(var_1_6, CCControlEventTouchUpInside)
		var_1_1.widgets.chetuiButton:addHandleOfControlEvent(var_1_7, CCControlEventTouchUpInside)
		arg_1_1.layerTabel.uiLayer:addChild(var_1_1.widgets.chetuiPanel, 100, uiTag.chetui)
	end
}
