SHCollectionView = {}

local var_0_0 = 0
local var_0_1 = 0
local var_0_2 = 0
local var_0_3 = CCSizeMake(0, 0)

local function var_0_4(arg_1_0)
	local var_1_0 = math.ceil(arg_1_0 / var_0_2)
	local var_1_1 = arg_1_0 - (var_1_0 - 1) * var_0_2
	local var_1_2 = var_0_0 * var_1_1 - var_0_0 * 0.5
	local var_1_3 = var_0_3.height - (var_0_1 * var_1_0 - var_0_1 * 0.5)

	return ccp(var_1_2, var_1_3)
end

function SHCollectionView.createCollectionLayer(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = createBaseLayer()

	if arg_2_3 and #arg_2_3 > 0 then
		var_0_0 = arg_2_0
		var_0_1 = arg_2_1
		var_0_2 = arg_2_2

		local var_2_1 = math.ceil(#arg_2_3 / arg_2_2)
		local var_2_2 = CCSizeMake(arg_2_0 * arg_2_2, arg_2_1 * var_2_1)

		var_0_3 = var_2_2

		var_2_0:setContentSize(var_2_2)

		for iter_2_0 = 1, #arg_2_3 do
			local var_2_3 = var_0_4(iter_2_0)
			local var_2_4 = arg_2_3[iter_2_0]

			var_2_0:addChild(var_2_4)
			var_2_4:setPosition(var_2_3)
		end
	end

	return var_2_0
end
