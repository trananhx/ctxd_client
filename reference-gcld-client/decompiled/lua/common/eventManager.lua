eventManager = {}

local var_0_0 = {}

function eventManager.dispatchEvent(arg_1_0, ...)
	log.debug("[event]send ", arg_1_0)

	if arg_1_0 == nil then
		messageBox.error("name不能为空")
	end

	if not var_0_0[arg_1_0] then
		return
	end

	local var_1_0 = false
	local var_1_1

	for iter_1_0, iter_1_1 in pairs(deepcopy(var_0_0[arg_1_0])) do
		var_1_1 = iter_1_1(...)
		var_1_0 = true
	end

	if not var_1_0 then
		log.warn("[warn] event" .. arg_1_0 .. "not have callback")
	end

	if var_1_1 ~= nil then
		return var_1_1
	end
end

local var_0_1 = {}

function eventManager.registerEvent(arg_2_0, arg_2_1)
	log.debug("[event]add ", arg_2_0)

	if var_0_0[arg_2_0] == nil then
		var_0_0[arg_2_0] = {}
	end

	table.insert(var_0_0[arg_2_0], arg_2_1)
end

function eventManager.unregisterEvent(arg_3_0, arg_3_1)
	log.debug("[event]del ", arg_3_0)

	if var_0_0[arg_3_0] == nil then
		return
	end

	for iter_3_0, iter_3_1 in pairs(var_0_0[arg_3_0]) do
		if iter_3_1 == arg_3_1 then
			table.remove(var_0_0[arg_3_0], iter_3_0)

			break
		end
	end
end

return eventManager
