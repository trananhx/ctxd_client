local var_0_0 = {
	elapse_10401_10403 = function()
		local var_1_0 = {}

		var_1_0.count = 14
		var_1_0.time = {}
		var_1_0.time[1] = 0.07
		var_1_0.time[2] = 0.14
		var_1_0.time[3] = 0.209
		var_1_0.time[4] = 0.277
		var_1_0.time[5] = 0.345
		var_1_0.time[6] = 0.413
		var_1_0.time[7] = 0.48
		var_1_0.time[8] = 0.547
		var_1_0.time[9] = 0.613
		var_1_0.time[10] = 0.678
		var_1_0.time[11] = 0.743
		var_1_0.time[12] = 0.808
		var_1_0.time[13] = 0.872
		var_1_0.time[14] = 0.935

		return var_1_0
	end,
	elapse_10402_10403 = function()
		local var_2_0 = {}

		var_2_0.count = 11
		var_2_0.time = {}
		var_2_0.time[1] = 0.063
		var_2_0.time[2] = 0.13
		var_2_0.time[3] = 0.2
		var_2_0.time[4] = 0.275
		var_2_0.time[5] = 0.353
		var_2_0.time[6] = 0.436
		var_2_0.time[7] = 0.523
		var_2_0.time[8] = 0.615
		var_2_0.time[9] = 0.71
		var_2_0.time[10] = 0.807
		var_2_0.time[11] = 0.904

		return var_2_0
	end,
	elapse_10403_10404 = function()
		local var_3_0 = {}

		var_3_0.count = 12
		var_3_0.time = {}
		var_3_0.time[1] = 0.073
		var_3_0.time[2] = 0.147
		var_3_0.time[3] = 0.224
		var_3_0.time[4] = 0.302
		var_3_0.time[5] = 0.38
		var_3_0.time[6] = 0.46
		var_3_0.time[7] = 0.539
		var_3_0.time[8] = 0.619
		var_3_0.time[9] = 0.697
		var_3_0.time[10] = 0.775
		var_3_0.time[11] = 0.851
		var_3_0.time[12] = 0.926

		return var_3_0
	end,
	elapse_10404_10405 = function()
		local var_4_0 = {}

		var_4_0.count = 9
		var_4_0.time = {}
		var_4_0.time[1] = 0.101
		var_4_0.time[2] = 0.203
		var_4_0.time[3] = 0.306
		var_4_0.time[4] = 0.409
		var_4_0.time[5] = 0.511
		var_4_0.time[6] = 0.612
		var_4_0.time[7] = 0.712
		var_4_0.time[8] = 0.809
		var_4_0.time[9] = 0.905

		return var_4_0
	end,
	elapse_10404_10406 = function()
		local var_5_0 = {}

		var_5_0.count = 8
		var_5_0.time = {}
		var_5_0.time[1] = 0.092
		var_5_0.time[2] = 0.191
		var_5_0.time[3] = 0.299
		var_5_0.time[4] = 0.414
		var_5_0.time[5] = 0.534
		var_5_0.time[6] = 0.657
		var_5_0.time[7] = 0.777
		var_5_0.time[8] = 0.892

		return var_5_0
	end,
	elapse_10406_10407 = function()
		local var_6_0 = {}

		var_6_0.count = 9
		var_6_0.time = {}
		var_6_0.time[1] = 0.084
		var_6_0.time[2] = 0.177
		var_6_0.time[3] = 0.28
		var_6_0.time[4] = 0.392
		var_6_0.time[5] = 0.51
		var_6_0.time[6] = 0.626
		var_6_0.time[7] = 0.733
		var_6_0.time[8] = 0.831
		var_6_0.time[9] = 0.919

		return var_6_0
	end
}

function var_0_0.elapse(arg_7_0, arg_7_1)
	local var_7_0 = "elapse_" .. tostring(arg_7_0) .. "_" .. tostring(arg_7_1)

	if arg_7_1 < arg_7_0 then
		var_7_0 = "elapse_" .. tostring(arg_7_1) .. "_" .. tostring(arg_7_0)
	end

	if var_0_0[var_7_0] == nil then
		return nil
	end

	return var_0_0[var_7_0]()
end

return var_0_0
