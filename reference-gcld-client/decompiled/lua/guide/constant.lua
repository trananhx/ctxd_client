guide.constant = {}
guide.constant.area = {}
guide.constant.area[1] = false
guide.constant.area[2] = false
guide.constant.area[3] = false
guide.constant.city = {}
guide.constant.city[1] = false
guide.constant.city[2] = false
guide.constant.city[3] = false
guide.constant.city[4] = false
guide.constant.city[5] = false
guide.constant.city[6] = false
guide.constant.button = {}
guide.constant.button[1] = false
guide.constant.button[2] = false
guide.constant.button[3] = false
guide.constant.button[4] = false
guide.constant.button[5] = false
guide.constant.button[6] = false
guide.constant.button[7] = false
guide.constant.popui = {}
guide.constant.popui[1] = {}
guide.constant.popui[1][1] = false
guide.constant.popui[1][2] = false
guide.constant.popui[1][3] = false
guide.constant.popui[1][4] = false
guide.constant.popui[1][5] = false
guide.constant.popui[2] = {}
guide.constant.popui[2][1] = false
guide.constant.popui[2][2] = false
guide.constant.popui[2][3] = false
guide.constant.popui[2][4] = false
guide.constant.popui[2][5] = false
guide.constant.popui[2][6] = false
guide.constant.popui[3] = {}
guide.constant.popui[3][1] = false
guide.constant.popui[3][2] = false
guide.constant.popui[3][3] = false
guide.constant.popui[3][4] = false
guide.constant.popui[3][5] = false
guide.constant.popui[3][6] = false
guide.constant.popui[3][7] = false
guide.constant.popui[4] = {}
guide.constant.popui[4][1] = false
guide.constant.popui[4][2] = false
guide.constant.popui[4][3] = false
guide.constant.popui[4][4] = false
guide.constant.popui[4][5] = false
guide.constant.popui[5] = {}
guide.constant.popui[5][1] = false
guide.constant.popui[5][2] = false
guide.constant.popui[6] = {}
guide.constant.popui[6][1] = false
guide.constant.popui[6][2] = false
guide.constant.popui[6][3] = false
guide.constant.popui[6][4] = false
guide.constant.popui[6][5] = false
guide.constant.popui[7] = {}
guide.constant.popui[7][1] = false
guide.constant.popui[7][2] = false
guide.constant.popui[7][3] = false
guide.constant.popui[7][4] = false
guide.constant.popui[7][5] = false
guide.constant.popui[7][6] = false
guide.constant.other = {}
guide.constant.other[1] = false
guide.constant.other[2] = false
guide.constant.other[3] = false
guide.constant.other[4] = false
guide.constant.other[5] = false
guide.constant.other[6] = false
guide.constant.panelToMenu = {}
guide.constant.panelToMenu[1] = 1018
guide.constant.panelToMenu[2] = 1005
guide.constant.panelToMenu[4] = 1004
guide.constant.panelToMenu[5] = 1011
guide.constant.panelToMenu[6] = 1017
guide.constant.panelToMenu[7] = 1021

function guide.constant.isContainGuide()
	if guide.constant.isAreaContainGuide() == true then
		return true
	end

	if guide.constant.isCityContainGuide() == true then
		return true
	end

	if guide.constant.isButtonContainGuide() == true then
		return true
	end

	if guide.constant.isPopuiContainGuide() == true then
		return true
	end

	return false
end

function guide.constant.isAreaContainGuide()
	for iter_2_0 = 1, 3 do
		if guide.constant.area[1] == true then
			return true
		end
	end

	return false
end

function guide.constant.isCityContainGuide()
	for iter_3_0 = 1, 3 do
		if guide.constant.city[1] == true then
			return true
		end
	end

	return false
end

function guide.constant.isButtonContainGuide()
	for iter_4_0 = 1, 3 do
		if guide.constant.button[1] == true then
			return true
		end
	end

	return false
end

function guide.constant.isPopuiContainGuide()
	for iter_5_0 = 1, 7 do
		local var_5_0 = "isPopuiContainGuide_" .. iter_5_0

		if guide.constant[var_5_0]() == true then
			return true
		end
	end

	return false
end

function guide.constant.isPopuiContainGuide_1()
	for iter_6_0 = 1, 5 do
		if guide.constant.popui[1][iter_6_0] == true then
			return true
		end
	end

	return false
end

function guide.constant.isPopuiContainGuide_2()
	for iter_7_0 = 1, 6 do
		if guide.constant.popui[2][iter_7_0] == true then
			return true
		end
	end

	return false
end

function guide.constant.isPopuiContainGuide_3()
	for iter_8_0 = 1, 7 do
		if guide.constant.popui[3][iter_8_0] == true then
			return true
		end
	end

	return false
end

function guide.constant.isPopuiContainGuide_4()
	for iter_9_0 = 1, 5 do
		if guide.constant.popui[4][iter_9_0] == true then
			return true
		end
	end

	return false
end

function guide.constant.isPopuiContainGuide_5()
	for iter_10_0 = 1, 2 do
		if guide.constant.popui[5][iter_10_0] == true then
			return true
		end
	end
end

function guide.constant.isPopuiContainGuide_6()
	for iter_11_0 = 1, 5 do
		if guide.constant.popui[6][iter_11_0] == true then
			return true
		end
	end

	return false
end

function guide.constant.isPopuiContainGuide_7()
	for iter_12_0 = 1, 2 do
		if guide.constant.popui[7][iter_12_0] == true then
			return true
		end
	end

	return false
end

require("lua/guide/constant2")

function guide.constant.guideFrame(arg_13_0, arg_13_1)
	local var_13_0 = "guideFrame_" .. tostring(arg_13_0) .. "_" .. tostring(arg_13_1)

	if var_13_0 ~= nil then
		return guide.constant[var_13_0]()
	end

	return nil
end
