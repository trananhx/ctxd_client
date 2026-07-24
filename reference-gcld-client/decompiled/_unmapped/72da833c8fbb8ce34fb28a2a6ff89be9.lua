local var_0_0 = 5
local var_0_1 = 12
local var_0_2 = 33
local var_0_3 = class("PathArrow", function()
	return CCSpriteBatchNode:create("res/ui/kfworld/cro_jr_arrow.png", var_0_0)
end)

function var_0_3.ctor(arg_2_0)
	arg_2_0.arrowArray = {}

	for iter_2_0 = 1, var_0_0 do
		local var_2_0 = CCSprite:create("res/ui/kfworld/cro_jr_arrow.png")

		var_2_0:setPosition(var_0_1 * (iter_2_0 - 1), 0)
		arg_2_0:addChild(var_2_0)

		local var_2_1 = CCSequence:createWithTwoActions(CCDelayTime:create(0.1 * iter_2_0), CCCallFunc:create(function()
			local var_3_0 = CCFadeIn:create(0.3)
			local var_3_1 = var_3_0:reverse()
			local var_3_2 = CCRepeatForever:create(CCSequence:createWithTwoActions(var_3_0, var_3_1))

			var_2_0:stopAllActions()
			var_2_0:runAction(var_3_2)
		end))

		var_2_0:runAction(var_2_1)

		arg_2_0.arrowArray[iter_2_0] = var_2_0
	end
end

function var_0_3.blink(arg_4_0)
	for iter_4_0 = 1, var_0_0 do
		local var_4_0 = arg_4_0.arrowArray[iter_4_0]

		var_4_0:stopAllActions()
		var_4_0:setOpacity(255)

		local var_4_1 = CCSequence:createWithTwoActions(CCDelayTime:create(0.1 * iter_4_0), CCCallFunc:create(function()
			local var_5_0 = CCFadeIn:create(0.3)
			local var_5_1 = var_5_0:reverse()
			local var_5_2 = CCRepeatForever:create(CCSequence:createWithTwoActions(var_5_0, var_5_1))

			var_4_0:stopAllActions()
			var_4_0:runAction(var_5_2)
		end))

		var_4_0:runAction(var_4_1)
	end
end

function var_0_3.stop(arg_6_0)
	for iter_6_0 = 1, var_0_0 do
		local var_6_0 = arg_6_0.arrowArray[iter_6_0]

		var_6_0:stopAllActions()
		var_6_0:setOpacity(204)
	end
end

return var_0_3
