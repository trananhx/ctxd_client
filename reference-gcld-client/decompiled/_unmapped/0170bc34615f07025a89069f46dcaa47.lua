hourRankControl = {}

local var_0_0 = hourRankControl
local var_0_1 = 0

function var_0_0.getReward()
	local function var_1_0(arg_2_0)
		local var_2_0 = arg_2_0.action.data

		worldControl.rank = var_2_0.rank
		worldControl.title = var_2_0.title
		worldControl.titleName = var_2_0.titleName
		worldControl.killTotal = var_2_0.killTotal
		worldControl.nextKillNum = var_2_0.nextKillNum
		worldControl.nextTitle = var_2_0.nextTitle
		worldControl.leftTime = var_2_0.time
		worldControl.received = var_2_0.received

		local var_2_1 = {
			{}
		}

		var_2_1[1].id = var_2_0.rewards[1].type
		var_2_1[1].value = var_2_0.rewards[1].value

		globalAction_gotResource(var_2_1)
		log.info("control.getReward()")
		hourRankUI.updateRankLayer(worldControl)
		eventManager.dispatchEvent("worldRewardDidReceived")
	end

	cmgr.sendRequest(var_1_0, actions.worldGetRewardWholePointKill)
end

local function var_0_2(arg_3_0)
	log.info("rankPanel changeWorldKill")

	if os.time() - var_0_1 <= 1 then
		return
	end

	var_0_1 = os.time()

	if arg_3_0.playerId == user.player.id then
		worldControl.rank = arg_3_0.rank or worldControl.rank
		worldControl.title = arg_3_0.title or worldControl.title
		worldControl.titleName = arg_3_0.titleName or worldControl.titleName
		worldControl.killTotal = arg_3_0.killTotal or worldControl.killTotal
		worldControl.nextKillNum = arg_3_0.nextKillNum or worldControl.nextKillNum
		worldControl.nextTitle = arg_3_0.nextTitle or worldControl.nextTitle
		worldControl.received = arg_3_0.received or worldControl.received

		hourRankUI.updateRankLayer(worldControl)
	end
end

local function var_0_3(arg_4_0)
	worldControl.leftTime = arg_4_0.leftTime

	if worldControl.rank and worldControl.rank <= 200 and worldControl.rank > 0 then
		worldControl.received = 0
	end

	log.info("worldRewardChange: ", worldControl.received)

	local function var_4_0(arg_5_0)
		if arg_5_0.action.data.isWholeKill then
			worldControl.isWholePointKill = 1
		else
			worldControl.isWholePointKill = 0
		end

		log.info("handlerIsWholeKill")
		hourRankUI.updateRankLayer(worldControl)
	end

	cmgr.sendRequest(var_4_0, actions.rankIsWholeKill)
end

function var_0_0.getWholeKillState()
	local function var_6_0(arg_7_0)
		if arg_7_0.action.data.isWholeKill then
			worldControl.isWholePointKill = 1
		else
			worldControl.isWholePointKill = 0
		end

		log.info("control.getWholeKillState()")
		hourRankUI.updateRankLayer(worldControl)
	end

	cmgr.sendRequest(var_6_0, actions.rankIsWholeKill)
end

local function var_0_4(arg_8_0)
	log.info("handlerPushWholeKill !!!")

	local var_8_0 = arg_8_0.action.data.wholeKill

	worldControl.rank = var_8_0.rank
	worldControl.title = var_8_0.title
	worldControl.titleName = var_8_0.titleName
	worldControl.killTotal = var_8_0.killTotal
	worldControl.nextKillNum = var_8_0.nextKillNum
	worldControl.nextTitle = var_8_0.nextTitle
	worldControl.leftTime = var_8_0.time
	worldControl.received = var_8_0.received
	worldControl.isWholePointKill = 1

	hourRankUI.updateRankLayer(worldControl)
end

function var_0_0.onEnter()
	log.info("@@进入杀敌榜")
	log.info("registerEvent hourRankSetVisible")
	eventManager.registerEvent("hourRankSetVisible", hourRankUI.setVisible)
	eventManager.registerEvent("hourRankOnTap", var_0_0.onTap)
	eventManager.registerEvent("changeWorldKill", var_0_2)
	eventManager.registerEvent("worldRewardChange", var_0_3)
	eventManager.registerEvent("nationTaskDidChanged", var_0_0.getWholeKillState)
	cmgr.registerResponseHandler(actions.pushWholeKill, var_0_4)
end

function var_0_0.onExit()
	log.info("@@退出杀敌榜")
	eventManager.unregisterEvent("hourRankSetVisible", hourRankUI.setVisible)
	eventManager.unregisterEvent("hourRankOnTap", var_0_0.onTap)
	eventManager.unregisterEvent("changeWorldKill", var_0_2)
	eventManager.unregisterEvent("worldRewardChange", var_0_3)
	eventManager.unregisterEvent("nationTaskDidChanged", var_0_0.getWholeKillState)
	cmgr.unregisterResponseHandler(actions.pushWholeKill, var_0_4)
end

function var_0_0.onTap(arg_11_0, arg_11_1)
	log.info("control.onTap(x,y)")

	if tool.checkIfTouch(hourRankUI.uiTable.rankFlag, arg_11_0, arg_11_1) or tool.checkIfTouch(hourRankUI.uiTable.rankRewardButton, arg_11_0, arg_11_1) then
		log.info("rankFlag touched")

		return false
	end

	return true
end
