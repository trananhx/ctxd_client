cityComboControl = {}

local var_0_0 = cityComboControl

local function var_0_1(arg_1_0)
	local var_1_0 = arg_1_0.data or arg_1_0.action.data

	cityComboUI.setCityComboPush(var_1_0.cityCombo)
end

function var_0_0.onEnter()
	log.info("city combo onEnter")
	cmgr.registerResponseHandler(actions.pushCityCombo, var_0_1)
end

function var_0_0.onExit()
	log.info("city combo onExit")
	cmgr.unregisterResponseHandler(actions.pushCityCombo, var_0_1)
end

function var_0_0.receiveCityComboReward(arg_4_0)
	log.info("control.receiveCityComboReward")

	local var_4_0 = arg_4_0.data or arg_4_0.action.data
	local var_4_1 = {
		{}
	}

	var_4_1[1].id = 10001
	var_4_1[1].value = var_4_0.gainFeat

	if user.canCatchRabbit and var_4_0.gainRabbit and var_4_0.gainRabbit > 0 then
		var_4_1[2] = {}
		var_4_1[2].id = 10020
		var_4_1[2].value = var_4_0.gainRabbit
	end

	if var_4_0.rewards and #var_4_0.rewards > 0 then
		for iter_4_0, iter_4_1 in pairs(var_4_0.rewards) do
			local var_4_2 = {
				id = iter_4_1.type,
				value = iter_4_1.num
			}

			table.insert(var_4_1, var_4_2)
		end
	end

	globalAction_gotResource(var_4_1)
	cityComboUI.setGetReward(var_4_0)
end

function var_0_0.requestCityComboReward()
	cmgr.sendRequest(var_0_0.receiveCityComboReward, actions.getComboReward)
end

function var_0_0.startCityCombo()
	local function var_6_0(arg_7_0)
		log.info("cityCombo begin")
		cityComboUI.setCityComboPush(arg_7_0.action.data)
	end

	cmgr.sendRequest(var_6_0, actions.startCombo)
end
