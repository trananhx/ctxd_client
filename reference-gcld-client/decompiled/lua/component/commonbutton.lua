function creatBaseButton(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = CCNode:create()
	local var_1_1 = {}

	arg_1_0:setVisible(true)
	arg_1_1:setVisible(false)
	var_1_0:addChild(arg_1_0)
	var_1_0:addChild(arg_1_1)

	function var_1_1.getContentSize(arg_2_0)
		return arg_1_0:getContentSize()
	end

	function var_1_1.onTouchBegan(arg_3_0, arg_3_1, arg_3_2)
		if tool.checkIfTouch(arg_1_0, arg_3_1, arg_3_2) then
			arg_1_1:setVisible(true)
		end
	end

	function var_1_1.onTouchMove(arg_4_0, arg_4_1, arg_4_2)
		return
	end

	function var_1_1.onTouchEnd(arg_5_0, arg_5_1, arg_5_2)
		if arg_1_1:isVisible() then
			arg_1_1:setVisible(false)
		end

		if tool.checkIfTouch(arg_1_0, arg_5_1, arg_5_2) then
			arg_1_2(arg_1_3)
		end
	end

	return var_1_0, var_1_1
end
