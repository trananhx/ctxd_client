kfzbControl = {}

local var_0_0 = kfzbControl

var_0_0.kfzbData = {}
var_0_0.supportData = {}

function var_0_0.onEnter()
	log.info("kfzb,control.onEnter")
	cmgr.registerResponseHandler(actions.kfzbPush, var_0_0.handlerKfzbPush)
	eventManager.registerEvent("kfzbStateChg", var_0_0.kfzbGet16Table)
	eventManager.registerEvent("kfzbWatchBattleWait", kfzbUI.showKfzbWaitLb)
end

function var_0_0.onExit()
	log.info("kfzb,control.onExit")
	cmgr.unregisterResponseHandler(actions.kfzbPush, var_0_0.handlerKfzbPush)
	eventManager.unregisterEvent("kfzbStateChg", var_0_0.kfzbGet16Table)
	eventManager.unregisterEvent("kfzbWatchBattleWait", kfzbUI.showKfzbWaitLb)
end

function var_0_0.setDataDefault()
	var_0_0.kfzbData.saiqu = var_0_0.kfzbData.saiqu or 0
	var_0_0.kfzbData.tickets = var_0_0.kfzbData.tickets or 0

	if var_0_0.kfzbData.rewards and var_0_0.kfzbData.rewards[1] then
		var_0_0.kfzbData.tickets = var_0_0.kfzbData.rewards[1].num
	end

	var_0_0.kfzbData.suptickets = var_0_0.kfzbData.suptickets or 0
	var_0_0.kfzbData.phase = var_0_0.kfzbData.phase or 0
	var_0_0.kfzbData.battleTime = var_0_0.kfzbData.battleTime or 0
	var_0_0.kfzbData.day2Cd = var_0_0.kfzbData.day2Cd or 0
	var_0_0.kfzbData.curLayer = var_0_0.kfzbData.curLayer or 0
	var_0_0.kfzbData.curRound = var_0_0.kfzbData.curRound or 0
	var_0_0.kfzbData.nextBatTime = var_0_0.kfzbData.nextBatTime or 0
	var_0_0.kfzbData.nextRBegTime = var_0_0.kfzbData.nextRBegTime or 0
	var_0_0.kfzbData.nextLayer = var_0_0.kfzbData.nextLayer or 0
	var_0_0.kfzbData.nextRound = var_0_0.kfzbData.nextRound or 0
	var_0_0.kfzbData.selfState = var_0_0.kfzbData.selfState or 0
	var_0_0.kfzbData.supportNum = var_0_0.kfzbData.supportNum or 0
	var_0_0.kfzbData.address = var_0_0.kfzbData.address or ""
	var_0_0.kfzbData.port = var_0_0.kfzbData.port or ""
	var_0_0.kfzbData.cId = var_0_0.kfzbData.cId or 0
	var_0_0.kfzbData.key = var_0_0.kfzbData.key or ""
	var_0_0.kfzbData.totalLayer = var_0_0.kfzbData.totalLayer or 0
	var_0_0.kfzbData.flag = var_0_0.kfzbData.flag or 0
	var_0_0.kfzbData.layer = var_0_0.kfzbData.layer or 0
	var_0_0.kfzbData.treasurePic = var_0_0.kfzbData.treasurePic or ""
	var_0_0.kfzbData.treasureStr = var_0_0.kfzbData.treasureStr or 0
	var_0_0.kfzbData.treasureLea = var_0_0.kfzbData.treasureLea or 0
	var_0_0.kfzbData.treasureName = var_0_0.kfzbData.treasureName or 0
	var_0_0.kfzbData.treasureId = var_0_0.kfzbData.treasureId or 0

	if var_0_0.kfzbData.feastCd then
		var_0_0.kfzbData.feastCd = var_0_0.kfzbData.feastCd - 7200000
	else
		var_0_0.kfzbData.feastCd = 0
	end

	if var_0_0.kfzbData.phase == 1 then
		var_0_0.kfzbData.selfState = 1
	end

	var_0_0.kfzbData.Infos = var_0_0.kfzbData.Infos or {}
end

function var_0_0.handlerKfzbPush(arg_4_0)
	local var_4_0 = arg_4_0.action.data.report

	if var_4_0 and var_4_0.refresh then
		var_0_0.kfzbGet16Table(true)
	end
end

function var_0_0.kfzbGetSignUpPanel()
	local function var_5_0(arg_6_0)
		if arg_6_0.action.state == 1 then
			kfzbUI.updateViewYXT(arg_6_0.action.data)
		end
	end

	cmgr.sendRequest(var_5_0, actions.kfzbGetSignUpPanel)
end

function var_0_0.kfzbSignUp()
	local function var_7_0(arg_8_0)
		if arg_8_0.action.state == 1 then
			var_0_0.kfzbGetSignUpPanel()
		end
	end

	cmgr.sendRequest(var_7_0, actions.kfzbSignUp)
end

function var_0_0.kfzbGet16Table(arg_9_0)
	local function var_9_0(arg_10_0)
		var_0_0.kfzbData = arg_10_0.action.data

		var_0_0.setDataDefault()

		local var_10_0 = {}

		for iter_10_0 = 1, #var_0_0.kfzbData.Infos do
			local var_10_1 = var_0_0.kfzbData.Infos[iter_10_0]

			var_10_0[var_10_1.matchId] = var_10_1
		end

		var_0_0.kfzbData.Infos = var_10_0

		if arg_9_0 then
			smgr.changeScene(SCENE_KFZB_TABLE, var_0_0.kfzbData)
		else
			local var_10_2 = var_0_0.kfzbData.Infos[1]
			local var_10_3 = false

			if var_10_2 and var_10_2.win1 + var_10_2.win2 == var_10_2.layerRound then
				var_10_3 = true
			end

			if (var_0_0.kfzbData.selfState == 1 or var_0_0.kfzbData.phase == 1) and var_0_0.kfzbData.flag < 3 and not var_10_3 then
				local var_10_4 = {
					competitorId = var_0_0.kfzbData.cId,
					certifacate = var_0_0.kfzbData.key,
					matchAdress = var_0_0.kfzbData.address,
					matchPort = var_0_0.kfzbData.port
				}

				log.info("@@ 进入跨服争霸")
				require("lua/manager/kfConnectManager")
				kfcmgr.loginkfzb(var_10_4)

				return
			else
				smgr.changeScene(SCENE_KFZB_TABLE, var_0_0.kfzbData)
			end
		end
	end

	cmgr.sendRequest(var_9_0, actions.kfzbGet16Table)
end

function var_0_0.kfzbGetTickets(arg_11_0)
	arg_11_0 = arg_11_0 or 0

	local function var_11_0(arg_12_0)
		local var_12_0 = arg_12_0.action.data.reward
		local var_12_1 = {}
		local var_12_2 = {
			id = kfzbConstant.rewardTypeTable[var_12_0.type].type,
			value = var_12_0.num
		}

		table.insert(var_12_1, var_12_2)
		globalAction_gotResource(var_12_1)

		if user.kfzbZone == 0 then
			var_0_0.kfzbGet16Table(true)
		end
	end

	cmgr.sendRequest(var_11_0, actions.kfzbGetTickets, arg_11_0)
end

function var_0_0.kfzbGetSupTickets()
	local function var_13_0(arg_14_0)
		if arg_14_0.action.state == 1 then
			local var_14_0 = {
				{}
			}

			var_14_0[1].id = 1211
			var_14_0[1].value = arg_14_0.action.data.tickets

			globalAction_gotResource(var_14_0)
			var_0_0.kfzbGet16Table(true)
		end
	end

	cmgr.sendRequest(var_13_0, actions.kfzbGetSupTickets)
end

function var_0_0.kfzbGetSupportPanel(arg_15_0)
	var_0_0.supportData.matchId = arg_15_0

	local function var_15_0(arg_16_0)
		if arg_16_0.action.state == 1 then
			require("lua/game/battle/battleConstants")
			log.info("@@ 跨服争霸初始化信息，观战")

			local var_16_0 = arg_16_0.action.data

			var_0_0.kfzbData.nextRoundCD = var_16_0.nextRoundCD or 0

			log.info("@@ 跨服争霸初始化信息，观战结果倒计时：", var_0_0.kfzbData.nextRoundCD)

			if var_16_0.report or var_16_0.plus then
				local var_16_1 = ""

				if var_16_0.report then
					var_16_1 = var_16_1 .. var_16_0.report
				end

				if var_16_0.plus then
					local var_16_2 = string.find(var_16_0.plus, "#")
					local var_16_3 = string.sub(var_16_0.plus, var_16_2 + 1)

					var_16_1 = var_16_1 .. var_16_3
				end

				log.info("@@ 跨服争霸，观战战报:", var_16_1)
				smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_KFZB, {
					state = kfzbState.fightWatch,
					info = var_16_1
				})
			end
		else
			log.info("跨服争霸，获取信息失败")
			eventManager.dispatchEvent("kfzbWatchBattleWait")
		end
	end

	local function var_15_1(arg_17_0)
		local var_17_0 = arg_17_0.action.data
		local var_17_1 = var_17_0.nextCd
		local var_17_2 = var_17_0.round

		var_0_0.supportData.round = var_17_2

		if var_17_1 > 0 then
			smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_KFZB, {
				state = kfzbState.support
			})
		else
			cmgr.sendRequest(var_15_0, actions.kfzbViewBattle, arg_15_0, var_17_2)
		end
	end

	log.info("@@ 进入跨服争霸")
	require("lua/manager/kfConnectManager")
	cmgr.sendRequest(var_15_1, actions.kfzbGetSupportPanel, arg_15_0)
end

function var_0_0.feastGetFeastInfo()
	local function var_18_0(arg_19_0)
		if arg_19_0.action.state == 1 then
			log.info("跨服盛宴")
			showTable(arg_19_0.action.data)
			smgr.changeScene(SCENE_KFSY)
		end
	end

	cmgr.sendRequest(var_18_0, actions.kfsyFeastInfo)
end
