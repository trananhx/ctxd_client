local var_0_0 = require("lua/common/ccb/CCBNode")
local var_0_1 = require("lua/layer/world/convene/control")

return {
	getConveneLayer = function(arg_1_0)
		ConveneLayer = ConveneLayer or {}
		var_0_1.cityId = arg_1_0.cityId
		ccb.ConveneLayer = ConveneLayer
		ConveneLayer.quedingButtonClick = var_0_1.conveneButtonOnClick

		local var_1_0 = worldConstant.BUILDING_INFO["world_building_" .. arg_1_0.cityId]

		function ConveneLayer.quxiaoButtonClick()
			local var_2_0 = smgr.getLayer("ConveneLayer")

			if var_2_0 then
				var_2_0:removeFromParentAndCleanup(true)
				smgr.unregisterLayer("ConveneLayer")

				worldControl.lock = false
			end
		end

		local var_1_1 = var_0_0.new("ccbi/convene.ccbi", "ConveneLayer", "CCLayer")
		local var_1_2 = CCStrokeLabelTTF:create(language.get(200502), "Thonburi", 20, 2, colorText[10005])
		local var_1_3 = ConveneLayer.quedingButton:getContentSize()

		var_1_2:setPosition(ccp(var_1_3.width / 2, var_1_3.height / 2))
		ConveneLayer.quedingButton:addChild(var_1_2, 100)

		local var_1_4 = CCStrokeLabelTTF:create(language.get(200503), "Thonburi", 20, 2, colorText[10005])

		var_1_4:setColor(colorText[10004])

		local var_1_5 = ConveneLayer.quxiaoButton:getContentSize()

		var_1_4:setPosition(ccp(var_1_5.width / 2, var_1_5.height / 2))
		ConveneLayer.quxiaoButton:addChild(var_1_4, 100)

		local var_1_6 = CCStrokeLabelTTF:create(language.get(200504), "Thonburi", 26, 2, colorText[10005])

		var_1_6:setPosition(ccp(258, 221))
		var_1_6:setColor(colorText[10004])
		ConveneLayer.conveneBg:addChild(var_1_6)

		local var_1_7 = CCStrokeLabelTTF:create(var_1_0.name, "Thonburi", 26)

		var_1_7:setPosition(ccp(var_1_6:getPositionX() + var_1_6:getContentSize().width / 2 + var_1_7:getContentSize().width / 2 + 10, var_1_6:getPositionY()))
		ConveneLayer.conveneBg:addChild(var_1_7)

		worldControl.lock = true

		var_0_1.getAssembleGeneral()
		var_1_1:registerScriptHandler(var_0_1.eventHandler)

		return var_1_1
	end
}
