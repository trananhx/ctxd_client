local var_0_0 = {
	curve_11001_11004 = function()
		local var_1_0 = {}

		var_1_0.rank = 3
		var_1_0.x = {}
		var_1_0.y = {}
		var_1_0.x[0] = 15.046
		var_1_0.y[0] = 24.306
		var_1_0.x[1] = -536.41
		var_1_0.y[1] = 38.988
		var_1_0.x[2] = 531.08
		var_1_0.y[2] = 106.59
		var_1_0.x[3] = 708.46
		var_1_0.y[3] = 266.95

		return var_1_0
	end,
	curve_11001_11002 = function()
		local var_2_0 = {}

		var_2_0.rank = 3
		var_2_0.x = {}
		var_2_0.y = {}
		var_2_0.x[0] = 6.108e-13
		var_2_0.y[0] = 1.5298e-12
		var_2_0.x[1] = -13
		var_2_0.y[1] = 50
		var_2_0.x[2] = 246
		var_2_0.y[2] = 80
		var_2_0.x[3] = 709
		var_2_0.y[3] = 266

		return var_2_0
	end,
	curve_11001_11006 = function()
		local var_3_0 = {}

		var_3_0.rank = 3
		var_3_0.x = {}
		var_3_0.y = {}
		var_3_0.x[0] = -8.0945e-13
		var_3_0.y[0] = -9.0599e-13
		var_3_0.x[1] = -35
		var_3_0.y[1] = 70
		var_3_0.x[2] = -252
		var_3_0.y[2] = -150
		var_3_0.x[3] = 709
		var_3_0.y[3] = 266

		return var_3_0
	end,
	curve_11002_11003 = function()
		local var_4_0 = {}

		var_4_0.rank = 3
		var_4_0.x = {}
		var_4_0.y = {}
		var_4_0.x[0] = 234.67
		var_4_0.y[0] = 101.33
		var_4_0.x[1] = -509.71
		var_4_0.y[1] = -88
		var_4_0.x[2] = 291.05
		var_4_0.y[2] = 157.67
		var_4_0.x[3] = 942.89
		var_4_0.y[3] = 395.5

		return var_4_0
	end,
	curve_11004_11005 = function()
		local var_5_0 = {}

		var_5_0.rank = 3
		var_5_0.x = {}
		var_5_0.y = {}
		var_5_0.x[0] = 2.7031e-12
		var_5_0.y[0] = -9.777e-13
		var_5_0.x[1] = 83
		var_5_0.y[1] = 1
		var_5_0.x[2] = -362
		var_5_0.y[2] = -84
		var_5_0.x[3] = 719
		var_5_0.y[3] = 436

		return var_5_0
	end,
	curve_11004_11007 = function()
		local var_6_0 = {}

		var_6_0.rank = 3
		var_6_0.x = {}
		var_6_0.y = {}
		var_6_0.x[0] = -5.0498e-12
		var_6_0.y[0] = -2.5546e-12
		var_6_0.x[1] = -225
		var_6_0.y[1] = -51
		var_6_0.x[2] = 146
		var_6_0.y[2] = 178
		var_6_0.x[3] = 719
		var_6_0.y[3] = 436

		return var_6_0
	end,
	curve_11005_11006 = function()
		local var_7_0 = {}

		var_7_0.rank = 3
		var_7_0.x = {}
		var_7_0.y = {}
		var_7_0.x[0] = -1.0397e-13
		var_7_0.y[0] = 9.097e-13
		var_7_0.x[1] = 102
		var_7_0.y[1] = -15
		var_7_0.x[2] = -120
		var_7_0.y[2] = -152
		var_7_0.x[3] = 440
		var_7_0.y[3] = 353

		return var_7_0
	end,
	curve_11005_11007 = function()
		local var_8_0 = {}

		var_8_0.rank = 3
		var_8_0.x = {}
		var_8_0.y = {}
		var_8_0.x[0] = -309.33
		var_8_0.y[0] = 181.33
		var_8_0.x[1] = 769.14
		var_8_0.y[1] = -347.43
		var_8_0.x[2] = -259.81
		var_8_0.y[2] = 376.1
		var_8_0.x[3] = 439.14
		var_8_0.y[3] = 352.77

		return var_8_0
	end,
	curve_11005_11008 = function()
		local var_9_0 = {}

		var_9_0.rank = 3
		var_9_0.x = {}
		var_9_0.y = {}
		var_9_0.x[0] = 7.1291e-13
		var_9_0.y[0] = -1.0916e-12
		var_9_0.x[1] = 170
		var_9_0.y[1] = 12
		var_9_0.x[2] = -214
		var_9_0.y[2] = 188
		var_9_0.x[3] = 440
		var_9_0.y[3] = 353

		return var_9_0
	end
}

function var_0_0.curve(arg_10_0, arg_10_1)
	local var_10_0 = "curve_" .. tostring(arg_10_0) .. "_" .. tostring(arg_10_1)

	if arg_10_1 < arg_10_0 then
		var_10_0 = "curve_" .. tostring(arg_10_1) .. "_" .. tostring(arg_10_0)
	end

	if var_0_0[var_10_0] == nil then
		return nil
	end

	return var_0_0[var_10_0]()
end

function var_0_0.position(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	if arg_11_2 < arg_11_1 then
		arg_11_3 = 1 - arg_11_3
	end

	x = arg_11_0.x[0]
	y = arg_11_0.y[0]

	for iter_11_0 = 1, arg_11_0.rank do
		x = x * arg_11_3 + arg_11_0.x[iter_11_0]
		y = y * arg_11_3 + arg_11_0.y[iter_11_0]
	end

	return x + 53, y
end

return var_0_0
