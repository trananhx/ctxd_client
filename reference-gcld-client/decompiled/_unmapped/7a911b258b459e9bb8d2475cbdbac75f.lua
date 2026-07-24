threeColorBag.control = {}
threeColorBag.data = {}
threeColorBag.data.kitType = 0
threeColorBag.data.num = 10
threeColorBag.data.kitNum = 0
threeColorBag.data.kitColor = 0
threeColorBag.data.kitDes = 1
threeColorBag.data.kitPos = 1
threeColorBag.data.currentSate = 0
threeColorBag.data.onlySendInfo = false
threeColorBag.data.isSpecialBox = false

function threeColorBag.control.setCurrentState(arg_1_0)
	if arg_1_0.action.data.isExpFull == false then
		if arg_1_0.action.data.comboList[1].isMatch == true and arg_1_0.action.data.comboList[2].isMatch == true and arg_1_0.action.data.comboList[3].isMatch == true then
			threeColorBag.data.kitType = 2

			if threeColorBag.data.currentSate == 3 then
				threeColorBag.data.currentSate = 4

				threeColorBag.ui.addLayer(4, arg_1_0)

				threeColorBag.data.onlySendInfo = true

				log.info("threeBag.currentState = " .. threeColorBag.data.currentSate)

				return
			end

			threeColorBag.data.currentSate = 5

			threeColorBag.ui.addLayer(5, arg_1_0)

			return
		end

		if arg_1_0.action.data.rewardsInfo ~= nil then
			if arg_1_0.action.data.rewardsInfo[1].rewards then
				threeColorBag.data.currentSate = 3
				threeColorBag.data.kitType = 1

				threeColorBag.ui.addLayer(3, arg_1_0)

				return
			elseif arg_1_0.action.data.rewardsInfo[2].rewards then
				threeColorBag.data.currentSate = 6
				threeColorBag.data.kitType = 2

				threeColorBag.ui.addLayer(6, arg_1_0)

				return
			end
		elseif arg_1_0.action.data.hasCollectBtn == true then
			if threeColorBag.data.currentSate ~= 6 then
				threeColorBag.data.currentSate = 4

				threeColorBag.ui.addLayer(4, arg_1_0)

				return
			else
				threeColorBag.data.currentSate = 7

				threeColorBag.ui.addLayer(7, arg_1_0)

				return
			end
		end

		if threeColorBag.data.currentSate == 3 then
			threeColorBag.data.currentSate = 4

			threeColorBag.ui.addLayer(4, arg_1_0)

			threeColorBag.data.onlySendInfo = true

			log.info("threeBag.currentState = " .. threeColorBag.data.currentSate)

			return
		end

		threeColorBag.data.currentSate = 1

		threeColorBag.ui.addLayer(1, arg_1_0)
	elseif arg_1_0.action.data.rewardsInfo == nil and arg_1_0.action.data.hasCollectBtn == nil then
		if arg_1_0.action.data.comboList[1].isMatch == true and arg_1_0.action.data.comboList[2].isMatch == true and arg_1_0.action.data.comboList[3].isMatch == true then
			threeColorBag.data.kitType = 2

			if threeColorBag.data.currentSate == 3 then
				threeColorBag.data.currentSate = 4

				threeColorBag.ui.addLayer(4, arg_1_0)

				threeColorBag.data.onlySendInfo = true

				log.info("threeBag.currentState = " .. threeColorBag.data.currentSate)

				return
			end

			threeColorBag.data.currentSate = 5

			threeColorBag.ui.addLayer(5, arg_1_0)
		else
			threeColorBag.data.kitType = 1
			threeColorBag.data.currentSate = 2

			threeColorBag.ui.addLayer(2, arg_1_0)
		end
	elseif arg_1_0.action.data.rewardsInfo ~= nil then
		if arg_1_0.action.data.rewardsInfo[1].rewards then
			threeColorBag.data.currentSate = 3
			threeColorBag.data.kitType = 1

			threeColorBag.ui.addLayer(3, arg_1_0)
		elseif arg_1_0.action.data.rewardsInfo[2].rewards then
			threeColorBag.data.currentSate = 6
			threeColorBag.data.kitType = 2

			threeColorBag.ui.addLayer(6, arg_1_0)
		end
	elseif arg_1_0.action.data.hasCollectBtn == true then
		if threeColorBag.data.currentSate ~= 6 then
			threeColorBag.data.currentSate = 4

			threeColorBag.ui.addLayer(4, arg_1_0)
		else
			threeColorBag.data.currentSate = 7

			threeColorBag.ui.addLayer(7, arg_1_0)
		end
	end

	log.info("threeBag.currentState = " .. threeColorBag.data.currentSate)
end

local function var_0_0(arg_2_0)
	local var_2_0 = arg_2_0.action.data

	if var_2_0.rewardsInfo and var_2_0.rewardsInfo[1].rewards and var_2_0.rewardsInfo[1].rewards[1].num then
		threeColorBag.data.num = var_2_0.rewardsInfo[1].rewards[1].num
	elseif var_2_0.rewardsInfo and var_2_0.rewardsInfo[2].rewards and var_2_0.rewardsInfo[2].rewards[1].num then
		threeColorBag.data.num = var_2_0.rewardsInfo[2].rewards[1].num
	else
		threeColorBag.data.num = 0
	end

	if var_2_0.kitNum == 1 then
		threeColorBag.data.kitNum = 1
	else
		threeColorBag.data.kitNum = 0
	end
end

local function var_0_1(arg_3_0)
	local function var_3_0(arg_4_0)
		if arg_4_0 == "1" then
			return 1
		end

		if arg_4_0 == "2" then
			return 2
		end

		if arg_4_0 == "3" then
			return 3
		end

		if arg_4_0 == 1 then
			return 1
		end

		if arg_4_0 == 2 then
			return 2
		end

		if arg_4_0 == 3 then
			return 3
		end
	end

	local var_3_1 = arg_3_0.action.data

	if var_3_1.comboList then
		for iter_3_0 = 3, 1, -1 do
			if var_3_1.comboList[iter_3_0].isMatch == true then
				log.info("data.comboList[i].isMatch: ")
			end

			if var_3_0(var_3_1.comboList[iter_3_0].color) == threeColorBag.data.kitColor and var_3_1.comboList[iter_3_0].isMatch == true then
				threeColorBag.data.kitDes = iter_3_0

				break
			end
		end
	end
end

function threeColorBag.control.receive_threeColorBagInfo(arg_5_0)
	var_0_1(arg_5_0)
	threeColorBag.control.setCurrentState(arg_5_0)
	var_0_0(arg_5_0)
end

function threeColorBag.control.request_threeColorBagInfo()
	cmgr.sendRequest(threeColorBag.control.receive_threeColorBagInfo, actions.getKitInfo)
end

function threeColorBag.control.receive_recvGem(arg_7_0)
	threeColorBag.control.request_threeColorBagInfo()
end

function threeColorBag.control.request_recvGem()
	cmgr.sendRequest(threeColorBag.control.receive_recvGem, actions.recvGem, threeColorBag.data.num, threeColorBag.data.kitType)
end

function threeColorBag.control.receive_recvKit(arg_9_0)
	threeColorBag.data.kitColor = arg_9_0.action.data.color

	threeColorBag.control.request_recvGem()
end

function threeColorBag.control.request_recvKit()
	cmgr.sendRequest(threeColorBag.control.receive_recvKit, actions.recvKit)
end

function threeColorBag.control.receive_continueCollect(arg_11_0)
	threeColorBag.control.request_threeColorBagInfo()
end

function threeColorBag.control.request_continueCollect()
	cmgr.sendRequest(threeColorBag.control.receive_continueCollect, actions.continueCollect)
end

function threeColorBag.control.receive_openKit(arg_13_0)
	threeColorBag.control.request_threeColorBagInfo()
end

function threeColorBag.control.request_openKit()
	cmgr.sendRequest(threeColorBag.control.receive_openKit, actions.openKit, threeColorBag.data.kitType)
end
