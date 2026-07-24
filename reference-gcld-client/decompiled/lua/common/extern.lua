function class(arg_1_0, arg_1_1)
	local var_1_0 = type(arg_1_1)
	local var_1_1

	if var_1_0 ~= "function" and var_1_0 ~= "table" then
		var_1_0 = nil
		arg_1_1 = nil
	end

	if var_1_0 == "function" or arg_1_1 and arg_1_1.__ctype == 1 then
		var_1_1 = {}

		if var_1_0 == "table" then
			for iter_1_0, iter_1_1 in pairs(arg_1_1) do
				var_1_1[iter_1_0] = iter_1_1
			end

			var_1_1.__create = arg_1_1.__create
			var_1_1.super = arg_1_1
		else
			var_1_1.__create = arg_1_1
		end

		function var_1_1.ctor()
			return
		end

		var_1_1.__cname = arg_1_0
		var_1_1.__ctype = 1

		function var_1_1.new(...)
			local var_3_0 = var_1_1.__create(...)

			for iter_3_0, iter_3_1 in pairs(var_1_1) do
				var_3_0[iter_3_0] = iter_3_1
			end

			var_3_0.class = var_1_1

			var_3_0:ctor(...)

			return var_3_0
		end
	else
		if arg_1_1 then
			var_1_1 = clone(arg_1_1)
			var_1_1.super = arg_1_1
		else
			var_1_1 = {
				ctor = function()
					return
				end
			}
		end

		var_1_1.__cname = arg_1_0
		var_1_1.__ctype = 2
		var_1_1.__index = var_1_1

		function var_1_1.new(...)
			local var_5_0 = setmetatable({}, var_1_1)

			var_5_0.class = var_1_1

			var_5_0:ctor(...)

			return var_5_0
		end
	end

	return var_1_1
end

function schedule(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = CCDelayTime:create(arg_6_2)
	local var_6_1 = CCCallFunc:create(arg_6_1)
	local var_6_2 = CCSequence:createWithTwoActions(var_6_0, var_6_1)
	local var_6_3 = CCRepeatForever:create(var_6_2)

	arg_6_0:runAction(var_6_3)

	return var_6_3
end

function performWithDelay(arg_7_0, arg_7_1, arg_7_2)
	if tolua.isnull(arg_7_0) or not arg_7_1 then
		return
	end

	local var_7_0 = CCDelayTime:create(arg_7_2)
	local var_7_1 = CCCallFunc:create(arg_7_1)
	local var_7_2 = CCSequence:createWithTwoActions(var_7_0, var_7_1)

	arg_7_0:runAction(var_7_2)

	return var_7_2
end

function cancelWithDelay(arg_8_0)
	arg_8_0:stopAllActions()
end

function swallowTouch(arg_9_0)
	local function var_9_0(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == CCTOUCHBEGAN then
			if not arg_9_0:isVisible() then
				return false
			end

			local var_10_0 = arg_9_0:getParent()

			while var_10_0 do
				if not var_10_0:isVisible() then
					return false
				end

				var_10_0 = var_10_0:getParent()
			end

			if checkIfTouch(arg_9_0, arg_10_1, arg_10_2) then
				return true
			else
				return false
			end
		end
	end

	arg_9_0:registerScriptTouchHandler(var_9_0, false, true)
	arg_9_0:setTouchEnabled(true)
end

function checkIfTouch(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_0:convertToNodeSpace(ccp(arg_11_1, arg_11_2))

	if CCRectMake(0, 0, arg_11_0:getContentSize().width, arg_11_0:getContentSize().height):containsPoint(var_11_0) then
		return true
	end

	return false
end
