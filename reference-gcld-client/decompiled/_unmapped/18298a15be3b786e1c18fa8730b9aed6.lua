local var_0_0 = {
	curve_10104_10105 = function()
		local var_1_0 = {}

		var_1_0.rank = 3
		var_1_0.x = {}
		var_1_0.y = {}
		var_1_0.x[0] = 250.67
		var_1_0.y[0] = 528
		var_1_0.x[1] = -332.57
		var_1_0.y[1] = -701.71
		var_1_0.x[2] = -155.1
		var_1_0.y[2] = 374.71
		var_1_0.x[3] = 541.53
		var_1_0.y[3] = 318.59

		return var_1_0
	end,
	curve_10101_10102 = function()
		local var_2_0 = {}

		var_2_0.rank = 3
		var_2_0.x = {}
		var_2_0.y = {}
		var_2_0.x[0] = -1.8714e-12
		var_2_0.y[0] = -2.5063e-12
		var_2_0.x[1] = -164
		var_2_0.y[1] = 9
		var_2_0.x[2] = 140
		var_2_0.y[2] = -214
		var_2_0.x[3] = 939
		var_2_0.y[3] = 596

		return var_2_0
	end,
	curve_10102_10103 = function()
		local var_3_0 = {}

		var_3_0.rank = 3
		var_3_0.x = {}
		var_3_0.y = {}
		var_3_0.x[0] = 1.3813e-12
		var_3_0.y[0] = -1.4852e-12
		var_3_0.x[1] = -81
		var_3_0.y[1] = 105
		var_3_0.x[2] = -70
		var_3_0.y[2] = -236
		var_3_0.x[3] = 915
		var_3_0.y[3] = 391

		return var_3_0
	end,
	curve_10103_10104 = function()
		local var_4_0 = {}

		var_4_0.rank = 3
		var_4_0.x = {}
		var_4_0.y = {}
		var_4_0.x[0] = 1.5632e-12
		var_4_0.y[0] = 5.4953e-13
		var_4_0.x[1] = 5
		var_4_0.y[1] = 112
		var_4_0.x[2] = -228
		var_4_0.y[2] = -54
		var_4_0.x[3] = 764
		var_4_0.y[3] = 260

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
