local var_0_0 = {
	curve_10307_10308 = function()
		local var_1_0 = {}

		var_1_0.rank = 3
		var_1_0.x = {}
		var_1_0.y = {}
		var_1_0.x[0] = 486.11
		var_1_0.y[0] = 369.21
		var_1_0.x[1] = -786.31
		var_1_0.y[1] = -538.19
		var_1_0.x[2] = 499.96
		var_1_0.y[2] = -10.582
		var_1_0.x[3] = 1053.3
		var_1_0.y[3] = 601.03

		return var_1_0
	end,
	curve_10301_10302 = function()
		local var_2_0 = {}

		var_2_0.rank = 3
		var_2_0.x = {}
		var_2_0.y = {}
		var_2_0.x[0] = -6.7578e-13
		var_2_0.y[0] = 1.2327e-12
		var_2_0.x[1] = -33
		var_2_0.y[1] = -19
		var_2_0.x[2] = 192
		var_2_0.y[2] = -152
		var_2_0.x[3] = 186
		var_2_0.y[3] = 472

		return var_2_0
	end,
	curve_10302_10303 = function()
		local var_3_0 = {}

		var_3_0.rank = 3
		var_3_0.x = {}
		var_3_0.y = {}
		var_3_0.x[0] = -6.832e-13
		var_3_0.y[0] = -7.4261e-14
		var_3_0.x[1] = 72
		var_3_0.y[1] = 89
		var_3_0.x[2] = 162
		var_3_0.y[2] = -182
		var_3_0.x[3] = 345
		var_3_0.y[3] = 301

		return var_3_0
	end,
	curve_10302_10304 = function()
		local var_4_0 = {}

		var_4_0.rank = 3
		var_4_0.x = {}
		var_4_0.y = {}
		var_4_0.x[0] = 522.67
		var_4_0.y[0] = -26.667
		var_4_0.x[1] = -790.86
		var_4_0.y[1] = 48
		var_4_0.x[2] = 458.19
		var_4_0.y[2] = 187.67
		var_4_0.x[3] = 345.94
		var_4_0.y[3] = 300.7

		return var_4_0
	end,
	curve_10303_10306 = function()
		local var_5_0 = {}

		var_5_0.rank = 3
		var_5_0.x = {}
		var_5_0.y = {}
		var_5_0.x[0] = 1.0397e-13
		var_5_0.y[0] = -2.9705e-13
		var_5_0.x[1] = 58
		var_5_0.y[1] = -114
		var_5_0.x[2] = 186
		var_5_0.y[2] = 330
		var_5_0.x[3] = 579
		var_5_0.y[3] = 208

		return var_5_0
	end,
	curve_10304_10306 = function()
		local var_6_0 = {}

		var_6_0.rank = 3
		var_6_0.x = {}
		var_6_0.y = {}
		var_6_0.x[0] = -0
		var_6_0.y[0] = 3.5645e-13
		var_6_0.x[1] = 206
		var_6_0.y[1] = 68
		var_6_0.x[2] = 82
		var_6_0.y[2] = -154
		var_6_0.x[3] = 535
		var_6_0.y[3] = 510

		return var_6_0
	end,
	curve_10305_10306 = function()
		local var_7_0 = {}

		var_7_0.rank = 3
		var_7_0.x = {}
		var_7_0.y = {}
		var_7_0.x[0] = -1017
		var_7_0.y[0] = -261
		var_7_0.x[1] = 1413
		var_7_0.y[1] = 355.5
		var_7_0.x[2] = -400
		var_7_0.y[2] = -353.5
		var_7_0.x[3] = 827
		var_7_0.y[3] = 683

		return var_7_0
	end,
	curve_10306_10307 = function()
		local var_8_0 = {}

		var_8_0.rank = 3
		var_8_0.x = {}
		var_8_0.y = {}
		var_8_0.x[0] = -2.2093e-12
		var_8_0.y[0] = 5.6439e-13
		var_8_0.x[1] = -27
		var_8_0.y[1] = -139
		var_8_0.x[2] = 256
		var_8_0.y[2] = 316
		var_8_0.x[3] = 823
		var_8_0.y[3] = 424

		return var_8_0
	end
}

function var_0_0.curve(arg_9_0, arg_9_1)
	local var_9_0 = "curve_" .. tostring(arg_9_0) .. "_" .. tostring(arg_9_1)

	if arg_9_1 < arg_9_0 then
		var_9_0 = "curve_" .. tostring(arg_9_1) .. "_" .. tostring(arg_9_0)
	end

	if var_0_0[var_9_0] == nil then
		return nil
	end

	return var_0_0[var_9_0]()
end

function var_0_0.position(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	if arg_10_2 < arg_10_1 then
		arg_10_3 = 1 - arg_10_3
	end

	x = arg_10_0.x[0]
	y = arg_10_0.y[0]

	for iter_10_0 = 1, arg_10_0.rank do
		x = x * arg_10_3 + arg_10_0.x[iter_10_0]
		y = y * arg_10_3 + arg_10_0.y[iter_10_0]
	end

	return x, y
end

return var_0_0
