ticketControl = {}

local var_0_0 = ticketControl

var_0_0.ticketData = {}

local var_0_1 = {}
local var_0_2 = false

function var_0_0.onEnter()
	var_0_0.ticketData = {}
	var_0_1 = {}
	var_0_2 = false
end

function var_0_0.onExit()
	var_0_0.ticketData = nil
end

function var_0_0.handlerTicketsGetMarketAction(arg_3_0)
	if arg_3_0.action.state == 1 then
		local var_3_0 = arg_3_0.action.data

		if var_0_2 then
			globalAction_gotResource(var_0_1)

			var_0_2 = false
		end

		var_0_0.ticketData = var_3_0

		ticketUI.updateTicketView(var_3_0, true)
	end
end

function var_0_0.ticketsGetMarket()
	cmgr.sendRequest(var_0_0.handlerTicketsGetMarketAction, actions.ticketsGetMarket)
end

function var_0_0.handlerTicketsBuyAction(arg_5_0)
	local var_5_0 = arg_5_0.action.data

	if var_5_0.hasRecruited ~= nil then
		local var_5_1 = smgr.getLayer("topLayer")

		var_5_1:removeAllChildrenWithCleanup(true)

		local var_5_2 = require("lua/layer/gainGeneral/xunYu").new(var_5_0)

		var_5_1:addChild(var_5_2, 10001)

		var_0_2 = false
	else
		var_0_2 = true

		var_0_0.ticketsGetMarket()
	end
end

function var_0_0.ticketsBuy(arg_6_0, arg_6_1, arg_6_2)
	var_0_1[1] = {}
	var_0_1[1].id = ticketConstant.ticketItemPicToResId[arg_6_0.pic]
	var_0_1[1].value = arg_6_2

	cmgr.sendRequest(var_0_0.handlerTicketsBuyAction, actions.ticketsBuy, arg_6_0.id, arg_6_1)
end
