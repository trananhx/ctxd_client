local var_0_0 = {
	curve_10602_10606 = function()
		local var_1_0 = {}

		var_1_0.rank = 3
		var_1_0.x = {}
		var_1_0.y = {}
		var_1_0.x[0] = -337.5
		var_1_0.y[0] = 382.5
		var_1_0.x[1] = 535.5
		var_1_0.y[1] = -535.5
		var_1_0.x[2] = 42
		var_1_0.y[2] = 220
		var_1_0.x[3] = 603
		var_1_0.y[3] = 208

		return var_1_0
	end,
	curve_10601_10602 = function()
		local var_2_0 = {}

		var_2_0.rank = 3
		var_2_0.x = {}
		var_2_0.y = {}
		var_2_0.x[0] = 1.9011e-12
		var_2_0.y[0] = 6.6093e-13
		var_2_0.x[1] = 74
		var_2_0.y[1] = 55
		var_2_0.x[2] = -250
		var_2_0.y[2] = 18
		var_2_0.x[3] = 779
		var_2_0.y[3] = 135

		return var_2_0
	end,
	curve_10602_10603 = function()
		local var_3_0 = {}

		var_3_0.rank = 3
		var_3_0.x = {}
		var_3_0.y = {}
		var_3_0.x[0] = -1.2476e-12
		var_3_0.y[0] = 1.5279e-12
		var_3_0.x[1] = -127
		var_3_0.y[1] = -6
		var_3_0.x[2] = 120
		var_3_0.y[2] = 162
		var_3_0.x[3] = 603
		var_3_0.y[3] = 208

		return var_3_0
	end,
	curve_10603_10604 = function()
		local var_4_0 = {}

		var_4_0.rank = 3
		var_4_0.x = {}
		var_4_0.y = {}
		var_4_0.x[0] = 5.1983e-13
		var_4_0.y[0] = 5.3468e-13
		var_4_0.x[1] = 94
		var_4_0.y[1] = 148
		var_4_0.x[2] = -278
		var_4_0.y[2] = -90
		var_4_0.x[3] = 596
		var_4_0.y[3] = 364

		return var_4_0
	end,
	curve_10604_10605 = function()
		local var_5_0 = {}

		var_5_0.rank = 3
		var_5_0.x = {}
		var_5_0.y = {}
		var_5_0.x[0] = -297
		var_5_0.y[0] = 468
		var_5_0.x[1] = 423
		var_5_0.y[1] = -697.5
		var_5_0.x[2] = 63
		var_5_0.y[2] = 351.5
		var_5_0.x[3] = 412
		var_5_0.y[3] = 422

		return var_5_0
	end,
	curve_10605_10607 = function()
		local var_6_0 = {}

		var_6_0.rank = 3
		var_6_0.x = {}
		var_6_0.y = {}
		var_6_0.x[0] = -9.3569e-13
		var_6_0.y[0] = 1.1882e-13
		var_6_0.x[1] = 47
		var_6_0.y[1] = 81
		var_6_0.x[2] = 162
		var_6_0.y[2] = -198
		var_6_0.x[3] = 601
		var_6_0.y[3] = 544

		return var_6_0
	end,
	curve_10606_10607 = function()
		local var_7_0 = {}

		var_7_0.rank = 3
		var_7_0.x = {}
		var_7_0.y = {}
		var_7_0.x[0] = 3.6091e-12
		var_7_0.y[0] = 5.3839e-13
		var_7_0.x[1] = -45
		var_7_0.y[1] = -6
		var_7_0.x[2] = 12
		var_7_0.y[2] = 158
		var_7_0.x[3] = 843
		var_7_0.y[3] = 275

		return var_7_0
	end,
	curve_10607_10608 = function()
		local var_8_0 = {}

		var_8_0.rank = 3
		var_8_0.x = {}
		var_8_0.y = {}
		var_8_0.x[0] = -1.9159e-12
		var_8_0.y[0] = 8.9114e-13
		var_8_0.x[1] = -75
		var_8_0.y[1] = 25
		var_8_0.x[2] = 76
		var_8_0.y[2] = 138
		var_8_0.x[3] = 810
		var_8_0.y[3] = 427

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

	return x + 53, y
end

return var_0_0
