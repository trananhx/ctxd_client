local var_0_0 = {
	curve_10206_10207 = function()
		local var_1_0 = {}

		var_1_0.rank = 3
		var_1_0.x = {}
		var_1_0.y = {}
		var_1_0.x[0] = 720
		var_1_0.y[0] = 294
		var_1_0.x[1] = -1148.6
		var_1_0.y[1] = -289.71
		var_1_0.x[2] = 891.57
		var_1_0.y[2] = -187.45
		var_1_0.x[3] = 975.4
		var_1_0.y[3] = 628.74

		return var_1_0
	end,
	curve_10201_10202 = function()
		local var_2_0 = {}

		var_2_0.rank = 3
		var_2_0.x = {}
		var_2_0.y = {}
		var_2_0.x[0] = 957.18
		var_2_0.y[0] = -107.64
		var_2_0.x[1] = -1724.6
		var_2_0.y[1] = 296.73
		var_2_0.x[2] = 881.51
		var_2_0.y[2] = -515.4
		var_2_0.x[3] = 269.28
		var_2_0.y[3] = 793.19

		return var_2_0
	end,
	curve_10201_10205 = function()
		local var_3_0 = {}

		var_3_0.rank = 3
		var_3_0.x = {}
		var_3_0.y = {}
		var_3_0.x[0] = 120
		var_3_0.y[0] = -474
		var_3_0.x[1] = -209.14
		var_3_0.y[1] = 1030.7
		var_3_0.x[2] = 489.67
		var_3_0.y[2] = -714.19
		var_3_0.x[3] = 270.83
		var_3_0.y[3] = 798.86

		return var_3_0
	end,
	curve_10202_10203 = function()
		local var_4_0 = {}

		var_4_0.rank = 3
		var_4_0.x = {}
		var_4_0.y = {}
		var_4_0.x[0] = 1.7823e-13
		var_4_0.y[0] = 1.3367e-12
		var_4_0.x[1] = 75
		var_4_0.y[1] = 19
		var_4_0.x[2] = 164
		var_4_0.y[2] = -188
		var_4_0.x[3] = 387
		var_4_0.y[3] = 470

		return var_4_0
	end,
	curve_10203_10204 = function()
		local var_5_0 = {}

		var_5_0.rank = 3
		var_5_0.x = {}
		var_5_0.y = {}
		var_5_0.x[0] = 192
		var_5_0.y[0] = -32
		var_5_0.x[1] = -459.43
		var_5_0.y[1] = 193.14
		var_5_0.x[2] = 539.43
		var_5_0.y[2] = -61.143
		var_5_0.x[3] = 625.77
		var_5_0.y[3] = 300.74

		return var_5_0
	end,
	curve_10204_10207 = function()
		local var_6_0 = {}

		var_6_0.rank = 3
		var_6_0.x = {}
		var_6_0.y = {}
		var_6_0.x[0] = -120
		var_6_0.y[0] = 606
		var_6_0.x[1] = 33.429
		var_6_0.y[1] = -1059
		var_6_0.x[2] = 626.76
		var_6_0.y[2] = 501.67
		var_6_0.x[3] = 896.4
		var_6_0.y[3] = 395.83

		return var_6_0
	end,
	curve_10205_10206 = function()
		local var_7_0 = {}

		var_7_0.rank = 3
		var_7_0.x = {}
		var_7_0.y = {}
		var_7_0.x[0] = 1.6746e-12
		var_7_0.y[0] = 3.2675e-13
		var_7_0.x[1] = 22
		var_7_0.y[1] = 137
		var_7_0.x[2] = 282
		var_7_0.y[2] = -142
		var_7_0.x[3] = 674
		var_7_0.y[3] = 639

		return var_7_0
	end
}

function var_0_0.curve(arg_8_0, arg_8_1)
	local var_8_0 = "curve_" .. tostring(arg_8_0) .. "_" .. tostring(arg_8_1)

	if arg_8_1 < arg_8_0 then
		var_8_0 = "curve_" .. tostring(arg_8_1) .. "_" .. tostring(arg_8_0)
	end

	if var_0_0[var_8_0] == nil then
		return nil
	end

	return var_0_0[var_8_0]()
end

function var_0_0.position(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	if arg_9_2 < arg_9_1 then
		arg_9_3 = 1 - arg_9_3
	end

	x = arg_9_0.x[0]
	y = arg_9_0.y[0]

	for iter_9_0 = 1, arg_9_0.rank do
		x = x * arg_9_3 + arg_9_0.x[iter_9_0]
		y = y * arg_9_3 + arg_9_0.y[iter_9_0]
	end

	return x, y
end

return var_0_0
