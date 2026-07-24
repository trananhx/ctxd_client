local var_0_0 = {
	elapse_10307_10308 = function()
		local var_1_0 = {}

		var_1_0.count = 10
		var_1_0.time = {}
		var_1_0.time[1] = 0.059
		var_1_0.time[2] = 0.13
		var_1_0.time[3] = 0.215
		var_1_0.time[4] = 0.309
		var_1_0.time[5] = 0.405
		var_1_0.time[6] = 0.5
		var_1_0.time[7] = 0.597
		var_1_0.time[8] = 0.702
		var_1_0.time[9] = 0.814
		var_1_0.time[10] = 0.918

		return var_1_0
	end,
	elapse_10301_10302 = function()
		local var_2_0 = {}

		var_2_0.count = 8
		var_2_0.time = {}
		var_2_0.time[1] = 0.106
		var_2_0.time[2] = 0.215
		var_2_0.time[3] = 0.324
		var_2_0.time[4] = 0.434
		var_2_0.time[5] = 0.546
		var_2_0.time[6] = 0.658
		var_2_0.time[7] = 0.771
		var_2_0.time[8] = 0.885

		return var_2_0
	end,
	elapse_10302_10303 = function()
		local var_3_0 = {}

		var_3_0.count = 9
		var_3_0.time = {}
		var_3_0.time[1] = 0.107
		var_3_0.time[2] = 0.214
		var_3_0.time[3] = 0.322
		var_3_0.time[4] = 0.428
		var_3_0.time[5] = 0.531
		var_3_0.time[6] = 0.632
		var_3_0.time[7] = 0.729
		var_3_0.time[8] = 0.822
		var_3_0.time[9] = 0.912

		return var_3_0
	end,
	elapse_10302_10304 = function()
		local var_4_0 = {}

		var_4_0.count = 10
		var_4_0.time = {}
		var_4_0.time[1] = 0.058
		var_4_0.time[2] = 0.129
		var_4_0.time[3] = 0.217
		var_4_0.time[4] = 0.322
		var_4_0.time[5] = 0.439
		var_4_0.time[6] = 0.559
		var_4_0.time[7] = 0.675
		var_4_0.time[8] = 0.779
		var_4_0.time[9] = 0.867
		var_4_0.time[10] = 0.939

		return var_4_0
	end,
	elapse_10303_10306 = function()
		local var_5_0 = {}

		var_5_0.count = 12
		var_5_0.time = {}
		var_5_0.time[1] = 0.068
		var_5_0.time[2] = 0.138
		var_5_0.time[3] = 0.21
		var_5_0.time[4] = 0.284
		var_5_0.time[5] = 0.359
		var_5_0.time[6] = 0.436
		var_5_0.time[7] = 0.515
		var_5_0.time[8] = 0.594
		var_5_0.time[9] = 0.674
		var_5_0.time[10] = 0.755
		var_5_0.time[11] = 0.837
		var_5_0.time[12] = 0.918

		return var_5_0
	end,
	elapse_10304_10306 = function()
		local var_6_0 = {}

		var_6_0.count = 11
		var_6_0.time = {}
		var_6_0.time[1] = 0.141
		var_6_0.time[2] = 0.265
		var_6_0.time[3] = 0.372
		var_6_0.time[4] = 0.467
		var_6_0.time[5] = 0.552
		var_6_0.time[6] = 0.629
		var_6_0.time[7] = 0.701
		var_6_0.time[8] = 0.767
		var_6_0.time[9] = 0.83
		var_6_0.time[10] = 0.889
		var_6_0.time[11] = 0.945

		return var_6_0
	end,
	elapse_10305_10306 = function()
		local var_7_0 = {}

		var_7_0.count = 12
		var_7_0.time = {}
		var_7_0.time[1] = 0.055
		var_7_0.time[2] = 0.132
		var_7_0.time[3] = 0.234
		var_7_0.time[4] = 0.332
		var_7_0.time[5] = 0.418
		var_7_0.time[6] = 0.499
		var_7_0.time[7] = 0.584
		var_7_0.time[8] = 0.679
		var_7_0.time[9] = 0.779
		var_7_0.time[10] = 0.858
		var_7_0.time[11] = 0.916
		var_7_0.time[12] = 0.961

		return var_7_0
	end,
	elapse_10306_10307 = function()
		local var_8_0 = {}

		var_8_0.count = 10
		var_8_0.time = {}
		var_8_0.time[1] = 0.067
		var_8_0.time[2] = 0.137
		var_8_0.time[3] = 0.211
		var_8_0.time[4] = 0.288
		var_8_0.time[5] = 0.37
		var_8_0.time[6] = 0.457
		var_8_0.time[7] = 0.549
		var_8_0.time[8] = 0.649
		var_8_0.time[9] = 0.756
		var_8_0.time[10] = 0.873

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
