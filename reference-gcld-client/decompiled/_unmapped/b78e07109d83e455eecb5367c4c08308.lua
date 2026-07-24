local var_0_0 = {
	elapse_51_52 = function()
		local var_1_0 = {}

		var_1_0.count = 11
		var_1_0.time = {}
		var_1_0.time[1] = 0.056
		var_1_0.time[2] = 0.119
		var_1_0.time[3] = 0.19
		var_1_0.time[4] = 0.268
		var_1_0.time[5] = 0.352
		var_1_0.time[6] = 0.441
		var_1_0.time[7] = 0.533
		var_1_0.time[8] = 0.625
		var_1_0.time[9] = 0.72
		var_1_0.time[10] = 0.816
		var_1_0.time[11] = 0.91

		return var_1_0
	end,
	elapse_52_53 = function()
		local var_2_0 = {}

		var_2_0.count = 9
		var_2_0.time = {}
		var_2_0.time[1] = 0.1
		var_2_0.time[2] = 0.212
		var_2_0.time[3] = 0.332
		var_2_0.time[4] = 0.45
		var_2_0.time[5] = 0.562
		var_2_0.time[6] = 0.665
		var_2_0.time[7] = 0.759
		var_2_0.time[8] = 0.845
		var_2_0.time[9] = 0.925

		return var_2_0
	end,
	elapse_53_54 = function()
		local var_3_0 = {}

		var_3_0.count = 7
		var_3_0.time = {}
		var_3_0.time[1] = 0.104
		var_3_0.time[2] = 0.232
		var_3_0.time[3] = 0.392
		var_3_0.time[4] = 0.564
		var_3_0.time[5] = 0.711
		var_3_0.time[6] = 0.827
		var_3_0.time[7] = 0.92

		return var_3_0
	end,
	elapse_54_55 = function()
		local var_4_0 = {}

		var_4_0.count = 7
		var_4_0.time = {}
		var_4_0.time[1] = 0.121
		var_4_0.time[2] = 0.241
		var_4_0.time[3] = 0.363
		var_4_0.time[4] = 0.492
		var_4_0.time[5] = 0.627
		var_4_0.time[6] = 0.765
		var_4_0.time[7] = 0.891

		return var_4_0
	end
}

function var_0_0.elapse(arg_5_0, arg_5_1)
	local var_5_0 = "elapse_" .. tostring(arg_5_0) .. "_" .. tostring(arg_5_1)

	if arg_5_1 < arg_5_0 then
		var_5_0 = "elapse_" .. tostring(arg_5_1) .. "_" .. tostring(arg_5_0)
	end

	if var_0_0[var_5_0] == nil then
		return nil
	end

	return var_0_0[var_5_0]()
end

return var_0_0
