local var_0_0 = {
	elapse_10602_10606 = function()
		local var_1_0 = {}

		var_1_0.count = 9
		var_1_0.time = {}
		var_1_0.time[1] = 0.139
		var_1_0.time[2] = 0.261
		var_1_0.time[3] = 0.359
		var_1_0.time[4] = 0.447
		var_1_0.time[5] = 0.53
		var_1_0.time[6] = 0.614
		var_1_0.time[7] = 0.703
		var_1_0.time[8] = 0.799
		var_1_0.time[9] = 0.902

		return var_1_0
	end,
	elapse_10601_10602 = function()
		local var_2_0 = {}

		var_2_0.count = 6
		var_2_0.time = {}
		var_2_0.time[1] = 0.115
		var_2_0.time[2] = 0.238
		var_2_0.time[3] = 0.371
		var_2_0.time[4] = 0.513
		var_2_0.time[5] = 0.666
		var_2_0.time[6] = 0.829

		return var_2_0
	end,
	elapse_10602_10603 = function()
		local var_3_0 = {}

		var_3_0.count = 5
		var_3_0.time = {}
		var_3_0.time[1] = 0.15
		var_3_0.time[2] = 0.318
		var_3_0.time[3] = 0.498
		var_3_0.time[4] = 0.679
		var_3_0.time[5] = 0.848

		return var_3_0
	end,
	elapse_10603_10604 = function()
		local var_4_0 = {}

		var_4_0.count = 7
		var_4_0.time = {}
		var_4_0.time[1] = 0.096
		var_4_0.time[2] = 0.202
		var_4_0.time[3] = 0.319
		var_4_0.time[4] = 0.449
		var_4_0.time[5] = 0.59
		var_4_0.time[6] = 0.734
		var_4_0.time[7] = 0.872

		return var_4_0
	end,
	elapse_10604_10605 = function()
		local var_5_0 = {}

		var_5_0.count = 9
		var_5_0.time = {}
		var_5_0.time[1] = 0.081
		var_5_0.time[2] = 0.182
		var_5_0.time[3] = 0.29
		var_5_0.time[4] = 0.391
		var_5_0.time[5] = 0.488
		var_5_0.time[6] = 0.587
		var_5_0.time[7] = 0.692
		var_5_0.time[8] = 0.808
		var_5_0.time[9] = 0.916

		return var_5_0
	end,
	elapse_10605_10607 = function()
		local var_6_0 = {}

		var_6_0.count = 8
		var_6_0.time = {}
		var_6_0.time[1] = 0.107
		var_6_0.time[2] = 0.218
		var_6_0.time[3] = 0.33
		var_6_0.time[4] = 0.444
		var_6_0.time[5] = 0.557
		var_6_0.time[6] = 0.67
		var_6_0.time[7] = 0.782
		var_6_0.time[8] = 0.892

		return var_6_0
	end,
	elapse_10606_10607 = function()
		local var_7_0 = {}

		var_7_0.count = 5
		var_7_0.time = {}
		var_7_0.time[1] = 0.167
		var_7_0.time[2] = 0.336
		var_7_0.time[3] = 0.505
		var_7_0.time[4] = 0.673
		var_7_0.time[5] = 0.838

		return var_7_0
	end,
	elapse_10607_10608 = function()
		local var_8_0 = {}

		var_8_0.count = 5
		var_8_0.time = {}
		var_8_0.time[1] = 0.18
		var_8_0.time[2] = 0.36
		var_8_0.time[3] = 0.534
		var_8_0.time[4] = 0.7
		var_8_0.time[5] = 0.854

		return var_8_0
	end
}

function var_0_0.elapse(arg_9_0, arg_9_1)
	local var_9_0 = "elapse_" .. tostring(arg_9_0) .. "_" .. tostring(arg_9_1)

	if arg_9_1 < arg_9_0 then
		var_9_0 = "elapse_" .. tostring(arg_9_1) .. "_" .. tostring(arg_9_0)
	end

	if var_0_0[var_9_0] == nil then
		return nil
	end

	return var_0_0[var_9_0]()
end

return var_0_0
