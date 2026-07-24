kfsyBuyControl = {}

function kfsyBuyControl.receive_kfsyBuyCard(arg_1_0)
	log.info("kfsyBuyControl.receive_kfsyBuyCard")
	kfsyBuyControl.request_kfsyFeastInfo()

	local var_1_0 = {
		{}
	}

	var_1_0[1].id = 1212
	var_1_0[1].value = arg_1_0.action.data.card

	globalAction_gotResource(var_1_0)
end

function kfsyBuyControl.request_kfsyBuyCard(arg_2_0)
	cmgr.sendRequest(kfsyBuyControl.receive_kfsyBuyCard, actions.kfsyBuyCard, arg_2_0)
end

function kfsyBuyControl.receive_kfsyBuyDrink(arg_3_0)
	log.info("kfsyBuyControl.request_kfsyBuyDrink")
	kfsyBuyControl.request_kfsyFeastInfo()

	local var_3_0 = {
		{}
	}

	var_3_0[1].id = 20000
	var_3_0[1].value = 10000

	globalAction_gotResource(var_3_0)
end

function kfsyBuyControl.request_kfsyBuyDrink()
	cmgr.sendRequest(kfsyBuyControl.receive_kfsyBuyDrink, actions.kfsyBuyDrink)
end

function kfsyBuyControl.receive_kfsyFeastInfo(arg_5_0)
	log.info("kfsyBuyControl.kfsyFeastInfo")
	require("lua/layer/kfsy/feastInfo")
	require("lua/layer/kfsy/buyAndRule/buy/ui")

	if arg_5_0.action.data.rooms then
		local var_5_0 = arg_5_0.action.data.rooms

		for iter_5_0 = 1, #var_5_0 - 1 do
			for iter_5_1 = 1, #var_5_0 - 1 do
				if var_5_0[iter_5_1].haveDrink == 0 and var_5_0[iter_5_1 + 1].haveDrink > 0 then
					local var_5_1 = var_5_0[iter_5_1]

					var_5_0[iter_5_1] = var_5_0[iter_5_1 + 1]
					var_5_0[iter_5_1 + 1] = var_5_1
				end
			end
		end
	end

	kfsyInfo.feastInfo.response = arg_5_0

	kfsyBuyUI.update(arg_5_0)
	kfsyInfo.ref.backGroundLayer:updateInfo(arg_5_0)
end

function kfsyBuyControl.request_kfsyFeastInfo()
	cmgr.sendRequest(kfsyBuyControl.receive_kfsyFeastInfo, actions.kfsyFeastInfo)
end
