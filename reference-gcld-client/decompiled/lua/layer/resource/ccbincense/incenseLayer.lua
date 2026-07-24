require("CCBReaderLoad")

local var_0_0 = require("lua/common/ccb/CCBNode")

return {
	getIncenseLayer = function()
		IncenseLayer = IncenseLayer or {}
		ccb.IncenseLayer = IncenseLayer

		function ccb.IncenseLayer.incenseOnClick_1()
			log.info("按钮按下了哟")
		end

		local var_1_0 = var_0_0.new("ccbi/IncenseLayer.ccbi", "IncenseLayer", "CCLayer")
		local var_1_1 = var_0_0.new("ccbi/IncenseBtnSprite.ccbi", "IncenseBtnSprite")
		local var_1_2 = CCScale9Sprite:create()

		var_1_1:setPosition(ccp(var_1_1:getContentSize().width / 2, var_1_1:getContentSize().height / 2))
		var_1_2:addChild(var_1_1)
		var_1_0:getNodeByName("incenseButton_1"):setBackgroundSpriteForState(var_1_2, CCControlStateNormal)

		return var_1_0
	end
}
