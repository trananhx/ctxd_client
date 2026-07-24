local var_0_0 = {
	curve_51_52 = function()
		local var_1_0 = {}

		var_1_0.rank = 3
		var_1_0.x = {}
		var_1_0.y = {}
		var_1_0.x[0] = -130.79
		var_1_0.y[0] = -333.33
		var_1_0.x[1] = 211.81
		var_1_0.y[1] = 611.61
		var_1_0.x[2] = 155.13
		var_1_0.y[2] = -482.56
		var_1_0.x[3] = 303.17
		var_1_0.y[3] = 520.36

		return var_1_0
	end,
	curve_52_53 = function()
		local var_2_0 = {}

		var_2_0.rank = 3
		var_2_0.x = {}
		var_2_0.y = {}
		var_2_0.x[0] = 48
		var_2_0.y[0] = -74.667
		var_2_0.x[1] = 28.571
		var_2_0.y[1] = 227.43
		var_2_0.x[2] = 156.43
		var_2_0.y[2] = -216.76
		var_2_0.x[3] = 539.87
		var_2_0.y[3] = 317.23

		return var_2_0
	end,
	curve_53_54 = function()
		local var_3_0 = {}

		var_3_0.rank = 3
		var_3_0.x = {}
		var_3_0.y = {}
		var_3_0.x[0] = 122.67
		var_3_0.y[0] = 138.67
		var_3_0.x[1] = -244.57
		var_3_0.y[1] = -83.429
		var_3_0.x[2] = 262.9
		var_3_0.y[2] = 80.762
		var_3_0.x[3] = 772.73
		var_3_0.y[3] = 252.77

		return var_3_0
	end,
	curve_54_55 = function()
		local var_4_0 = {}

		var_4_0.rank = 3
		var_4_0.x = {}
		var_4_0.y = {}
		var_4_0.x[0] = -136.57
		var_4_0.y[0] = -16.204
		var_4_0.x[1] = 36.111
		var_4_0.y[1] = 25.198
		var_4_0.x[2] = 124.91
		var_4_0.y[2] = 188.23
		var_4_0.x[3] = 915.78
		var_4_0.y[3] = 390.17

		return var_4_0
	end
}

function var_0_0.curve(arg_5_0, arg_5_1)
	local var_5_0 = "curve_" .. tostring(arg_5_0) .. "_" .. tostring(arg_5_1)

	if arg_5_1 < arg_5_0 then
		var_5_0 = "curve_" .. tostring(arg_5_1) .. "_" .. tostring(arg_5_0)
	end

	if var_0_0[var_5_0] == nil then
		return nil
	end

	return var_0_0[var_5_0]()
end

function var_0_0.position(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	if arg_6_2 < arg_6_1 then
		arg_6_3 = 1 - arg_6_3
	end

	x = arg_6_0.x[0]
	y = arg_6_0.y[0]

	for iter_6_0 = 1, arg_6_0.rank do
		x = x * arg_6_3 + arg_6_0.x[iter_6_0]
		y = y * arg_6_3 + arg_6_0.y[iter_6_0]
	end

	return x + 53, y
end

return var_0_0
