ccb = ccb or {}

function CCBNodeLoad(arg_1_0, arg_1_1)
	if arg_1_0 == nil then
		return
	end

	arg_1_1.outletNames = {}

	local var_1_0 = arg_1_0:createCCBReader()
	local var_1_1 = arg_1_0:readCCBFromFile("res/ccbi/" .. arg_1_1.__cname .. ".ccbi", var_1_0, true)
	local var_1_2 = ""

	if arg_1_1 ~= nil then
		local var_1_3 = tolua.cast(var_1_0:getOwnerCallbackNames(), "CCArray")
		local var_1_4 = tolua.cast(var_1_0:getOwnerCallbackNodes(), "CCArray")
		local var_1_5 = 1

		for iter_1_0 = 1, var_1_3:count() do
			local var_1_6 = tolua.cast(var_1_3:objectAtIndex(iter_1_0 - 1), "CCString")
			local var_1_7 = tolua.cast(var_1_4:objectAtIndex(iter_1_0 - 1), "CCNode")
			local var_1_8 = var_1_6:getCString()

			if type(arg_1_1[var_1_8]) == "function" then
				arg_1_0:setCallback(var_1_7, handler(arg_1_1, arg_1_1[var_1_8]))
			else
				log.warn("Warning: Cannot find owner's lua function:" .. ":" .. var_1_8 .. " for ownerVar selector")
			end
		end

		local var_1_9 = tolua.cast(var_1_0:getOwnerOutletNames(), "CCArray")
		local var_1_10 = tolua.cast(var_1_0:getOwnerOutletNodes(), "CCArray")

		for iter_1_1 = 1, var_1_9:count() do
			local var_1_11 = tolua.cast(var_1_9:objectAtIndex(iter_1_1 - 1), "CCString")
			local var_1_12 = tolua.cast(var_1_10:objectAtIndex(iter_1_1 - 1), "CCNode")

			arg_1_1.outletNames[#arg_1_1.outletNames + 1] = var_1_11:getCString()
			arg_1_1[var_1_11:getCString()] = tolua.cast(var_1_12, arg_1_0:getNodeTypeName(var_1_12))
		end
	end

	local var_1_13 = tolua.cast(var_1_0:getNodesWithAnimationManagers(), "CCArray")
	local var_1_14 = tolua.cast(var_1_0:getAnimationManagersForNodes(), "CCArray")

	for iter_1_2 = 1, var_1_13:count() do
		local var_1_15 = tolua.cast(var_1_13:objectAtIndex(iter_1_2 - 1), "CCNode")
		local var_1_16 = tolua.cast(var_1_14:objectAtIndex(iter_1_2 - 1), "CCBAnimationManager")
		local var_1_17 = var_1_16:getDocumentControllerName()

		if var_1_17 == "" then
			-- block empty
		end

		if var_1_17 == arg_1_1.__cname then
			arg_1_1.mAnimationManager = var_1_16
		end

		local var_1_18 = tolua.cast(var_1_16:getDocumentCallbackNames(), "CCArray")
		local var_1_19 = tolua.cast(var_1_16:getDocumentCallbackNodes(), "CCArray")

		for iter_1_3 = 1, var_1_18:count() do
			local var_1_20 = tolua.cast(var_1_18:objectAtIndex(iter_1_3 - 1), "CCString")
			local var_1_21 = tolua.cast(var_1_19:objectAtIndex(iter_1_3 - 1), "CCNode")

			if var_1_17 ~= "" and ccb[var_1_17] ~= nil then
				local var_1_22 = var_1_20:getCString()

				if type(ccb[var_1_17][var_1_22]) == "function" then
					arg_1_0:setCallback(var_1_21, ccb[var_1_17][var_1_22])
				else
					log.warn("WARNING: Cannot found lua function [" .. var_1_17 .. "." .. var_1_22 .. "] for docRoot selector")
				end
			end
		end

		local var_1_23 = tolua.cast(var_1_16:getDocumentOutletNames(), "CCArray")
		local var_1_24 = tolua.cast(var_1_16:getDocumentOutletNodes(), "CCArray")

		for iter_1_4 = 1, var_1_23:count() do
			local var_1_25 = tolua.cast(var_1_23:objectAtIndex(iter_1_4 - 1), "CCString")
			local var_1_26 = tolua.cast(var_1_24:objectAtIndex(iter_1_4 - 1), "CCNode")

			if ccb[var_1_17] ~= nil then
				ccb[var_1_17][var_1_25:getCString()] = tolua.cast(var_1_26, arg_1_0:getNodeTypeName(var_1_26))
			end
		end

		local var_1_27 = var_1_16:getKeyframeCallbacks()

		for iter_1_5 = 1, var_1_27:count() do
			local var_1_28 = tolua.cast(var_1_27:objectAtIndex(iter_1_5 - 1), "CCString"):getCString()
			local var_1_29, var_1_30 = string.find(var_1_28, ":")
			local var_1_31 = tonumber(string.sub(var_1_28, 1, var_1_29 - 1))
			local var_1_32 = string.sub(var_1_28, var_1_30 + 1, -1)

			if var_1_31 == 1 and ccb[var_1_17] ~= nil then
				local var_1_33 = CCCallFunc:create(ccb[var_1_17][var_1_32])

				var_1_16:setCallFuncForLuaCallbackNamed(var_1_33, var_1_28)
			elseif var_1_31 == 2 and arg_1_1 ~= nil then
				local var_1_34 = CCCallFunc:create(ccb[strOwnerName][var_1_32])

				var_1_16:setCallFuncForLuaCallbackNamed(var_1_34, var_1_28)
			end
		end

		local var_1_35 = var_1_16:getAutoPlaySequenceId()

		if var_1_35 ~= -1 then
			var_1_16:runAnimationsForSequenceIdTweenDuration(var_1_35, 0)
		end
	end

	return var_1_1
end
