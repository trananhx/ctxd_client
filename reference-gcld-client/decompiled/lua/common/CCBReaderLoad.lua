ccb = ccb or {}

function CCBReaderLoad(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if arg_1_1 == nil then
		return
	end

	local var_1_0 = arg_1_1:createCCBReader()
	local var_1_1 = arg_1_1:readCCBFromFile(arg_1_0, var_1_0, arg_1_2)
	local var_1_2 = var_1_0:getOwner()
	local var_1_3 = ""

	if var_1_2 ~= nil then
		local var_1_4 = tolua.cast(var_1_0:getOwnerCallbackNames(), "CCArray")
		local var_1_5 = tolua.cast(var_1_0:getOwnerCallbackNodes(), "CCArray")
		local var_1_6 = 1

		for iter_1_0 = 1, var_1_4:count() do
			local var_1_7 = tolua.cast(var_1_4:objectAtIndex(iter_1_0 - 1), "CCString")
			local var_1_8 = tolua.cast(var_1_5:objectAtIndex(iter_1_0 - 1), "CCNode")

			if arg_1_3 ~= "" and ccb[arg_1_3] ~= nil then
				local var_1_9 = var_1_7:getCString()

				if type(ccb[arg_1_3][var_1_9]) == "function" then
					arg_1_1:setCallback(var_1_8, ccb[arg_1_3][var_1_9])
				else
					log.warn("WARNING: Cannot found lua function [" .. arg_1_3 .. "." .. var_1_9 .. "] for owner selector")
				end
			end
		end

		local var_1_10 = tolua.cast(var_1_0:getOwnerOutletNames(), "CCArray")
		local var_1_11 = tolua.cast(var_1_0:getOwnerOutletNodes(), "CCArray")

		for iter_1_1 = 1, var_1_10:count() do
			local var_1_12 = tolua.cast(var_1_10:objectAtIndex(iter_1_1 - 1), "CCString")
			local var_1_13 = tolua.cast(var_1_11:objectAtIndex(iter_1_1 - 1), "CCNode")

			if arg_1_3 ~= "" and ccb[arg_1_3] ~= nil then
				ccb[arg_1_3][var_1_12:getCString()] = tolua.cast(var_1_13, arg_1_1:getNodeTypeName(var_1_13))
			end
		end
	end

	local var_1_14 = tolua.cast(var_1_0:getNodesWithAnimationManagers(), "CCArray")
	local var_1_15 = tolua.cast(var_1_0:getAnimationManagersForNodes(), "CCArray")

	for iter_1_2 = 1, var_1_14:count() do
		local var_1_16 = tolua.cast(var_1_14:objectAtIndex(iter_1_2 - 1), "CCNode")
		local var_1_17 = tolua.cast(var_1_15:objectAtIndex(iter_1_2 - 1), "CCBAnimationManager")
		local var_1_18 = var_1_17:getDocumentControllerName()

		if var_1_18 == "" then
			-- block empty
		end

		if ccb[var_1_18] ~= nil then
			ccb[var_1_18].mAnimationManager = var_1_17
		end

		local var_1_19 = tolua.cast(var_1_17:getDocumentCallbackNames(), "CCArray")
		local var_1_20 = tolua.cast(var_1_17:getDocumentCallbackNodes(), "CCArray")

		for iter_1_3 = 1, var_1_19:count() do
			local var_1_21 = tolua.cast(var_1_19:objectAtIndex(iter_1_3 - 1), "CCString")
			local var_1_22 = tolua.cast(var_1_20:objectAtIndex(iter_1_3 - 1), "CCNode")

			if var_1_18 ~= "" and ccb[var_1_18] ~= nil then
				local var_1_23 = var_1_21:getCString()

				if type(ccb[var_1_18][var_1_23]) == "function" then
					arg_1_1:setCallback(var_1_22, ccb[var_1_18][var_1_23])
				else
					log.warn("WARNING: Cannot found lua function [" .. var_1_18 .. "." .. var_1_23 .. "] for docRoot selector")
				end
			end
		end

		local var_1_24 = tolua.cast(var_1_17:getDocumentOutletNames(), "CCArray")
		local var_1_25 = tolua.cast(var_1_17:getDocumentOutletNodes(), "CCArray")

		for iter_1_4 = 1, var_1_24:count() do
			local var_1_26 = tolua.cast(var_1_24:objectAtIndex(iter_1_4 - 1), "CCString")
			local var_1_27 = tolua.cast(var_1_25:objectAtIndex(iter_1_4 - 1), "CCNode")

			if ccb[var_1_18] ~= nil then
				ccb[var_1_18][var_1_26:getCString()] = tolua.cast(var_1_27, arg_1_1:getNodeTypeName(var_1_27))
			end
		end

		local var_1_28 = var_1_17:getKeyframeCallbacks()

		for iter_1_5 = 1, var_1_28:count() do
			local var_1_29 = tolua.cast(var_1_28:objectAtIndex(iter_1_5 - 1), "CCString"):getCString()
			local var_1_30, var_1_31 = string.find(var_1_29, ":")
			local var_1_32 = tonumber(string.sub(var_1_29, 1, var_1_30 - 1))
			local var_1_33 = string.sub(var_1_29, var_1_31 + 1, -1)

			if var_1_32 == 1 and ccb[var_1_18] ~= nil then
				local var_1_34 = CCCallFunc:create(ccb[var_1_18][var_1_33])

				var_1_17:setCallFuncForLuaCallbackNamed(var_1_34, var_1_29)
			elseif var_1_32 == 2 and var_1_2 ~= nil then
				local var_1_35 = CCCallFunc:create(ccb[arg_1_3][var_1_33])

				var_1_17:setCallFuncForLuaCallbackNamed(var_1_35, var_1_29)
			end
		end

		local var_1_36 = var_1_17:getAutoPlaySequenceId()

		if var_1_36 ~= -1 then
			var_1_17:runAnimationsForSequenceIdTweenDuration(var_1_36, 0)
		end
	end

	return var_1_1
end
