local var_0_0 = {
	elapse_11001_11004 = function()
		local var_1_0 = {}

		var_1_0.count = 11
		var_1_0.time = {}
		var_1_0.time[1] = 0.052
		var_1_0.time[2] = 0.11
		var_1_0.time[3] = 0.178
		var_1_0.time[4] = 0.262
		var_1_0.time[5] = 0.374
		var_1_0.time[6] = 0.529
		var_1_0.time[7] = 0.661
		var_1_0.time[8] = 0.755
		var_1_0.time[9] = 0.829
		var_1_0.time[10] = 0.892
		var_1_0.time[11] = 0.948

		return var_1_0
	end,
	elapse_11001_11002 = function()
		local var_2_0 = {}

		var_2_0.count = 9
		var_2_0.time = {}
		var_2_0.time[1] = 0.103
		var_2_0.time[2] = 0.206
		var_2_0.time[3] = 0.308
		var_2_0.time[4] = 0.41
		var_2_0.time[5] = 0.511
		var_2_0.time[6] = 0.611
		var_2_0.time[7] = 0.71
		var_2_0.time[8] = 0.807
		var_2_0.time[9] = 0.904

		return var_2_0
	end,
	elapse_11001_11006 = function()
		local var_3_0 = {}

		var_3_0.count = 11
		var_3_0.time = {}
		var_3_0.time[1] = 0.085
		var_3_0.time[2] = 0.171
		var_3_0.time[3] = 0.256
		var_3_0.time[4] = 0.342
		var_3_0.time[5] = 0.427
		var_3_0.time[6] = 0.511
		var_3_0.time[7] = 0.595
		var_3_0.time[8] = 0.678
		var_3_0.time[9] = 0.76
		var_3_0.time[10] = 0.84
		var_3_0.time[11] = 0.92

		return var_3_0
	end,
	elapse_11002_11003 = function()
		local var_4_0 = {}

		var_4_0.count = 6
		var_4_0.time = {}
		var_4_0.time[1] = 0.099
		var_4_0.time[2] = 0.245
		var_4_0.time[3] = 0.449
		var_4_0.time[4] = 0.626
		var_4_0.time[5] = 0.769
		var_4_0.time[6] = 0.892

		return var_4_0
	end,
	elapse_11004_11005 = function()
		local var_5_0 = {}

		var_5_0.count = 10
		var_5_0.time = {}
		var_5_0.time[1] = 0.072
		var_5_0.time[2] = 0.147
		var_5_0.time[3] = 0.224
		var_5_0.time[4] = 0.305
		var_5_0.time[5] = 0.389
		var_5_0.time[6] = 0.476
		var_5_0.time[7] = 0.568
		var_5_0.time[8] = 0.666
		var_5_0.time[9] = 0.769
		var_5_0.time[10] = 0.879

		return var_5_0
	end,
	elapse_11004_11007 = function()
		local var_6_0 = {}

		var_6_0.count = 6
		var_6_0.time = {}
		var_6_0.time[1] = 0.133
		var_6_0.time[2] = 0.303
		var_6_0.time[3] = 0.496
		var_6_0.time[4] = 0.662
		var_6_0.time[5] = 0.795
		var_6_0.time[6] = 0.904

		return var_6_0
	end,
	elapse_11005_11006 = function()
		local var_7_0 = {}

		var_7_0.count = 6
		var_7_0.time = {}
		var_7_0.time[1] = 0.135
		var_7_0.time[2] = 0.279
		var_7_0.time[3] = 0.429
		var_7_0.time[4] = 0.58
		var_7_0.time[5] = 0.727
		var_7_0.time[6] = 0.867

		return var_7_0
	end,
	elapse_11005_11007 = function()
		local var_8_0 = {}

		var_8_0.count = 12
		var_8_0.time = {}
		var_8_0.time[1] = 0.064
		var_8_0.time[2] = 0.144
		var_8_0.time[3] = 0.245
		var_8_0.time[4] = 0.352
		var_8_0.time[5] = 0.447
		var_8_0.time[6] = 0.531
		var_8_0.time[7] = 0.606
		var_8_0.time[8] = 0.676
		var_8_0.time[9] = 0.743
		var_8_0.time[10] = 0.808
		var_8_0.time[11] = 0.872
		var_8_0.time[12] = 0.935

		return var_8_0
	end,
	elapse_11005_11008 = function()
		local var_9_0 = {}

		var_9_0.count = 8
		var_9_0.time = {}
		var_9_0.time[1] = 0.091
		var_9_0.time[2] = 0.19
		var_9_0.time[3] = 0.297
		var_9_0.time[4] = 0.412
		var_9_0.time[5] = 0.534
		var_9_0.time[6] = 0.658
		var_9_0.time[7] = 0.778
		var_9_0.time[8] = 0.893

		return var_9_0
	end
}

function var_0_0.elapse(arg_10_0, arg_10_1)
	local var_10_0 = "elapse_" .. tostring(arg_10_0) .. "_" .. tostring(arg_10_1)

	if arg_10_1 < arg_10_0 then
		var_10_0 = "elapse_" .. tostring(arg_10_1) .. "_" .. tostring(arg_10_0)
	end

	if var_0_0[var_10_0] == nil then
		return nil
	end

	return var_0_0[var_10_0]()
end

return var_0_0
