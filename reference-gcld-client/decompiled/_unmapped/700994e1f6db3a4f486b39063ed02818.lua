local var_0_0 = require("lua/component/BaseUI")

ClippingNode = {}

function ClippingNode.create(arg_1_0)
	local var_1_0 = {}

	var_1_0.displayObj = nil

	var_0_0.extend(var_1_0)

	function var_1_0.create(arg_2_0)
		var_1_0.displayObj = CCClippingNode:create()
		arg_1_0.style = arg_1_0.style or "Clipping_default"

		local var_2_0 = styles.getStyle(arg_1_0.style)
		local var_2_1 = arg_1_0.stencil or var_2_0.stencil
		local var_2_2 = arg_1_0.inverted or var_2_0.inverted
		local var_2_3 = arg_1_0.alphaThreshold or var_2_0.alphaThreshold

		log.info("@@ stencil : ", var_2_1)

		local var_2_4 = var_0_0.createSpriteFromPic(var_2_1)

		var_1_0.displayObj:setStencil(var_2_4)
		var_1_0.displayObj:setInverted(var_2_2)
		var_1_0.displayObj:setAlphaThreshold(var_2_3)
		var_1_0:initBaseUI(arg_1_0)
	end

	var_1_0:create()

	return var_1_0
end
