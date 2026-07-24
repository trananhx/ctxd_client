local var_0_0 = {
	curve_10802_10803 = function()
		local var_1_0 = {}

		var_1_0.rank = 3
		var_1_0.x = {}
		var_1_0.y = {}
		var_1_0.x[0] = -80
		var_1_0.y[0] = -10.667
		var_1_0.x[1] = 22.857
		var_1_0.y[1] = 424
		var_1_0.x[2] = -279.86
		var_1_0.y[2] = -429.33
		var_1_0.x[3] = 1965.4
		var_1_0.y[3] = 249.8

		return var_1_0
	end,
	curve_10803_10804 = function()
		local var_2_0 = {}

		var_2_0.rank = 3
		var_2_0.x = {}
		var_2_0.y = {}
		var_2_0.x[0] = 64
		var_2_0.y[0] = -80
		var_2_0.x[1] = -434.29
		var_2_0.y[1] = 236.57
		var_2_0.x[2] = 450.29
		var_2_0.y[2] = 40.429
		var_2_0.x[3] = 1629.1
		var_2_0.y[3] = 234.87

		return var_2_0
	end,
	curve_10803_10805 = function()
		local var_3_0 = {}

		var_3_0.rank = 3
		var_3_0.x = {}
		var_3_0.y = {}
		var_3_0.x[0] = 6.2268e-12
		var_3_0.y[0] = -8.4287e-13
		var_3_0.x[1] = 16
		var_3_0.y[1] = 25
		var_3_0.x[2] = -336
		var_3_0.y[2] = 60
		var_3_0.x[3] = 1629
		var_3_0.y[3] = 235

		return var_3_0
	end,
	curve_10805_10806 = function()
		local var_4_0 = {}

		var_4_0.rank = 3
		var_4_0.x = {}
		var_4_0.y = {}
		var_4_0.x[0] = 9.1156e-13
		var_4_0.y[0] = -7.2776e-13
		var_4_0.x[1] = 14
		var_4_0.y[1] = -84
		var_4_0.x[2] = -340
		var_4_0.y[2] = 48
		var_4_0.x[3] = 1309
		var_4_0.y[3] = 320

		return var_4_0
	end,
	curve_10805_10807 = function()
		local var_5_0 = {}

		var_5_0.rank = 3
		var_5_0.x = {}
		var_5_0.y = {}
		var_5_0.x[0] = 1.6337e-12
		var_5_0.y[0] = 6.1637e-13
		var_5_0.x[1] = 86
		var_5_0.y[1] = 21
		var_5_0.x[2] = -332
		var_5_0.y[2] = 182
		var_5_0.x[3] = 1309
		var_5_0.y[3] = 320

		return var_5_0
	end,
	curve_10806_10807 = function()
		local var_6_0 = {}

		var_6_0.rank = 3
		var_6_0.x = {}
		var_6_0.y = {}
		var_6_0.x[0] = -1.9902e-12
		var_6_0.y[0] = 2.265e-13
		var_6_0.x[1] = -118
		var_6_0.y[1] = 23
		var_6_0.x[2] = 198
		var_6_0.y[2] = 216
		var_6_0.x[3] = 983
		var_6_0.y[3] = 284

		return var_6_0
	end,
	curve_10806_10808 = function()
		local var_7_0 = {}

		var_7_0.rank = 3
		var_7_0.x = {}
		var_7_0.y = {}
		var_7_0.x[0] = -3.3418e-13
		var_7_0.y[0] = 1.3367e-13
		var_7_0.x[1] = -15
		var_7_0.y[1] = -27
		var_7_0.x[2] = -240
		var_7_0.y[2] = 174
		var_7_0.x[3] = 983
		var_7_0.y[3] = 284

		return var_7_0
	end,
	curve_10807_10808 = function()
		local var_8_0 = {}

		var_8_0.rank = 3
		var_8_0.x = {}
		var_8_0.y = {}
		var_8_0.x[0] = 1.8194e-13
		var_8_0.y[0] = 4.0287e-13
		var_8_0.x[1] = -17
		var_8_0.y[1] = 8
		var_8_0.x[2] = -318
		var_8_0.y[2] = -100
		var_8_0.x[3] = 1063
		var_8_0.y[3] = 523

		return var_8_0
	end,
	curve_10801_10802 = function()
		local var_9_0 = {}

		var_9_0.rank = 3
		var_9_0.x = {}
		var_9_0.y = {}
		var_9_0.x[0] = 4.1586e-12
		var_9_0.y[0] = -1.0545e-12
		var_9_0.x[1] = -129
		var_9_0.y[1] = 53
		var_9_0.x[2] = 132
		var_9_0.y[2] = -286
		var_9_0.x[3] = 1963
		var_9_0.y[3] = 484

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

	return x, y
end

return var_0_0
