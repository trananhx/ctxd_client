local var_0_0 = {
	curve_10401_10403 = function()
		local var_1_0 = {}

		var_1_0.rank = 3
		var_1_0.x = {}
		var_1_0.y = {}
		var_1_0.x[0] = -1.1696e-12
		var_1_0.y[0] = -2.9853e-12
		var_1_0.x[1] = 21
		var_1_0.y[1] = -29
		var_1_0.x[2] = 354
		var_1_0.y[2] = 18
		var_1_0.x[3] = 291
		var_1_0.y[3] = 952

		return var_1_0
	end,
	curve_10402_10403 = function()
		local var_2_0 = {}

		var_2_0.rank = 3
		var_2_0.x = {}
		var_2_0.y = {}
		var_2_0.x[0] = -5.9409e-13
		var_2_0.y[0] = -7.4187e-12
		var_2_0.x[1] = -190
		var_2_0.y[1] = -43
		var_2_0.x[2] = 364
		var_2_0.y[2] = -186
		var_2_0.x[3] = 492
		var_2_0.y[3] = 1170

		return var_2_0
	end,
	curve_10403_10404 = function()
		local var_3_0 = {}

		var_3_0.rank = 3
		var_3_0.x = {}
		var_3_0.y = {}
		var_3_0.x[0] = -1.4852e-12
		var_3_0.y[0] = 1.5446e-12
		var_3_0.x[1] = -155
		var_3_0.y[1] = -24
		var_3_0.x[2] = 204
		var_3_0.y[2] = -304
		var_3_0.x[3] = 666
		var_3_0.y[3] = 941

		return var_3_0
	end,
	curve_10404_10405 = function()
		local var_4_0 = {}

		var_4_0.rank = 3
		var_4_0.x = {}
		var_4_0.y = {}
		var_4_0.x[0] = -2.8219e-12
		var_4_0.y[0] = -2.6734e-12
		var_4_0.x[1] = 29
		var_4_0.y[1] = 80
		var_4_0.x[2] = 216
		var_4_0.y[2] = -130
		var_4_0.x[3] = 715
		var_4_0.y[3] = 613

		return var_4_0
	end,
	curve_10404_10406 = function()
		local var_5_0 = {}

		var_5_0.rank = 3
		var_5_0.x = {}
		var_5_0.y = {}
		var_5_0.x[0] = 2.5249e-12
		var_5_0.y[0] = -1.4927e-12
		var_5_0.x[1] = 168
		var_5_0.y[1] = 15
		var_5_0.x[2] = -180
		var_5_0.y[2] = -226
		var_5_0.x[3] = 715
		var_5_0.y[3] = 613

		return var_5_0
	end,
	curve_10406_10407 = function()
		local var_6_0 = {}

		var_6_0.rank = 3
		var_6_0.x = {}
		var_6_0.y = {}
		var_6_0.x[0] = 1.4852e-12
		var_6_0.y[0] = 1.7823e-13
		var_6_0.x[1] = -234
		var_6_0.y[1] = 111
		var_6_0.x[2] = 126
		var_6_0.y[2] = -312
		var_6_0.x[3] = 703
		var_6_0.y[3] = 402

		return var_6_0
	end
}

function var_0_0.curve(arg_7_0, arg_7_1)
	local var_7_0 = "curve_" .. tostring(arg_7_0) .. "_" .. tostring(arg_7_1)

	if arg_7_1 < arg_7_0 then
		var_7_0 = "curve_" .. tostring(arg_7_1) .. "_" .. tostring(arg_7_0)
	end

	if var_0_0[var_7_0] == nil then
		return nil
	end

	return var_0_0[var_7_0]()
end

function var_0_0.position(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	if arg_8_2 < arg_8_1 then
		arg_8_3 = 1 - arg_8_3
	end

	x = arg_8_0.x[0]
	y = arg_8_0.y[0]

	for iter_8_0 = 1, arg_8_0.rank do
		x = x * arg_8_3 + arg_8_0.x[iter_8_0]
		y = y * arg_8_3 + arg_8_0.y[iter_8_0]
	end

	return x + 53, y
end

return var_0_0
