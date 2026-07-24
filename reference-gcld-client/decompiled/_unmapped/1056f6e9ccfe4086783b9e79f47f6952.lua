local var_0_0 = {
	elapse_10104_10105 = function()
		local var_1_0 = {}

		var_1_0.count = 12
		var_1_0.time = {}
		var_1_0.time[1] = 0.069
		var_1_0.time[2] = 0.148
		var_1_0.time[3] = 0.233
		var_1_0.time[4] = 0.319
		var_1_0.time[5] = 0.404
		var_1_0.time[6] = 0.487
		var_1_0.time[7] = 0.572
		var_1_0.time[8] = 0.658
		var_1_0.time[9] = 0.743
		var_1_0.time[10] = 0.822
		var_1_0.time[11] = 0.89
		var_1_0.time[12] = 0.949

		return var_1_0
	end,
	elapse_10101_10102 = function()
		local var_2_0 = {}

		var_2_0.count = 8
		var_2_0.time = {}
		var_2_0.time[1] = 0.102
		var_2_0.time[2] = 0.211
		var_2_0.time[3] = 0.328
		var_2_0.time[4] = 0.449
		var_2_0.time[5] = 0.57
		var_2_0.time[6] = 0.688
		var_2_0.time[7] = 0.799
		var_2_0.time[8] = 0.902

		return var_2_0
	end,
	elapse_10102_10103 = function()
		local var_3_0 = {}

		var_3_0.count = 7
		var_3_0.time = {}
		var_3_0.time[1] = 0.112
		var_3_0.time[2] = 0.231
		var_3_0.time[3] = 0.358
		var_3_0.time[4] = 0.49
		var_3_0.time[5] = 0.624
		var_3_0.time[6] = 0.755
		var_3_0.time[7] = 0.88

		return var_3_0
	end,
	elapse_10103_10104 = function()
		local var_4_0 = {}

		var_4_0.count = 8
		var_4_0.time = {}
		var_4_0.time[1] = 0.114
		var_4_0.time[2] = 0.231
		var_4_0.time[3] = 0.349
		var_4_0.time[4] = 0.465
		var_4_0.time[5] = 0.58
		var_4_0.time[6] = 0.691
		var_4_0.time[7] = 0.798
		var_4_0.time[8] = 0.9

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
