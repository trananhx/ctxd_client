require("CCBReaderLoad")

local var_0_0 = class("CCBNode", function()
	return CCNode:create()
end)

function var_0_0.ctor(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.ownerName = arg_2_2
	ccb[arg_2_0.ownerName] = ccb[arg_2_0.ownerName] or {}
	arg_2_0.proxy = CCBProxy:create()
	arg_2_0.node = CCBReaderLoad(arg_2_1, arg_2_0.proxy, true, arg_2_2)

	if arg_2_3 then
		arg_2_0.node = tolua.cast(arg_2_0.node, arg_2_3)
	end

	arg_2_0:setContentSize(arg_2_0.node:getContentSize())
	arg_2_0:addChild(arg_2_0.node)
end

function var_0_0.getNodeByName(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_2 then
		return tolua.cast(ccb[arg_3_0.ownerName][arg_3_1], arg_3_2)
	end

	return ccb[arg_3_0.ownerName][arg_3_1]
end

function var_0_0.getRootNode(arg_4_0, arg_4_1)
	if arg_4_1 then
		return tolua.cast(arg_4_0.node, arg_4_1)
	end

	return arg_4_0.node
end

return var_0_0
