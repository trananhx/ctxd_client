mainCity.control = {}
mainCity.control.selectedBuildIndex = 0
mainCity.control.selectedGuideIndex = 0
mainCity.control.mailInfo = {}

function mainCity.control.handlerMainCityInfo(arg_1_0)
	local var_1_0 = arg_1_0.action.data
	local var_1_1 = var_1_0.areas

	for iter_1_0 = 1, 6 do
		mainCity.control[iter_1_0] = {}
		mainCity.control[iter_1_0].isOpen = var_1_1[iter_1_0].isOpen

		if iter_1_0 == 6 then
			mainCity.control[iter_1_0].outputType = {}
			mainCity.control[iter_1_0].outputValue = {}

			for iter_1_1 = 1, 4 do
				mainCity.control[iter_1_0].outputType[iter_1_1] = var_1_1[iter_1_0].officerOutput[iter_1_1].type
				mainCity.control[iter_1_0].outputValue[iter_1_1] = var_1_1[iter_1_0].officerOutput[iter_1_1].value
			end
		else
			mainCity.control[iter_1_0].hasEvent = var_1_1[iter_1_0].hasEvent
			mainCity.control[iter_1_0].outputType = var_1_1[iter_1_0].totalOutput[1].type
			mainCity.control[iter_1_0].outputValue = var_1_1[iter_1_0].totalOutput[1].output
			mainCity.control[iter_1_0].upMode = var_1_1[iter_1_0].additionMode
			mainCity.control[iter_1_0].isUpdating = var_1_1[iter_1_0].pbwNum and var_1_1[iter_1_0].pbwNum > 0
		end

		mainCity.control[iter_1_0].totalGemOutPut = var_1_1[iter_1_0].totalGemOutPut
		mainCity.control[iter_1_0].isBuilding = var_1_1[iter_1_0].isBuilding
		mainCity.control[iter_1_0].canReform = var_1_1[iter_1_0].canReform
		mainCity.control[iter_1_0].status = var_1_1[iter_1_0].status

		if iter_1_0 == 2 then
			mainCity.control[iter_1_0].totalSilkOutPut = var_1_1[iter_1_0].totalSilkOutPut
		end

		if iter_1_0 == 5 then
			mainCity.control[iter_1_0].troopLv = var_1_0.troopLv
		end
	end

	mainCity.control.displayIron = var_1_0.displayIron
	mainCity.control.reformStatus = var_1_0.reformStatus
	mainCity.control.invest = var_1_0.invest
	mainCity.control.currentStage = var_1_0.currentStage
	mainCity.control.totalStage = var_1_0.totalStage
	mainCity.control.huangchengSlaveNum = var_1_0.huangchengSlaveNum
	mainCity.control.slaveNum = var_1_0.slaveNum
	mainCity.control.lumberYardReform = var_1_0.lumberYardReform
	mainCity.control.lumberYardReformPlus = var_1_0.lumberYardReformPlus
	mainCity.control.farmReform = var_1_0.farmReform
	mainCity.control.mohistReform = var_1_0.mohistReform

	mainCity.ui.initMainCityUI(mainCity.control)

	local var_1_2 = var_1_0.moonBuff

	if var_1_2 ~= nil or var_1_2 == nil and user.moonBuff then
		user.moonBuff = var_1_2

		notice.control.refreshLayer()
	end
end

function mainCity.control.showGuideArrow()
	taskUI.showTaskGuide()
end

function mainCity.control.getMainCityInfo()
	cmgr.sendRequest(mainCity.control.handlerMainCityInfo, actions.mainCityInfo, "")

	mainCity.control.mailInfo = {}

	if user.hasNewMail == true then
		cmgr.sendRequest(mainCity.control.handlerMailInfo, actions.getMailInfo, 0)
	end
end

function mainCity.control.handlerMailInfo(arg_4_0)
	local var_4_0 = arg_4_0.action.data

	if var_4_0.currentPage == 0 then
		mainCity.control.mailInfo = {}
	end

	if var_4_0.currentPage < var_4_0.totalPage then
		for iter_4_0, iter_4_1 in ipairs(var_4_0.mailList) do
			if tonumber(iter_4_1.isRead) == 0 then
				table.insert(mainCity.control.mailInfo, iter_4_1)
			end
		end

		if var_4_0.currentPage + 1 < var_4_0.totalPage then
			cmgr.sendRequest(mainCity.control.handlerMailInfo, actions.getMailInfo, var_4_0.currentPage + 1)
		else
			mainCity.ui.showMail()
		end
	end
end

function mainCity.control.onTouchBegan(arg_5_0, arg_5_1)
	local var_5_0 = smgr.getLayer("mainCityLayer")

	if var_5_0 == nil then
		return
	end

	local var_5_1 = ccp(arg_5_0, arg_5_1)

	for iter_5_0 = 1, 6 do
		if mainCity.control[iter_5_0] ~= nil and mainCity.control[iter_5_0].isOpen == true and LayerTransparentCheck:ifTransparent(1000 + iter_5_0, var_5_1, var_5_0) == false then
			guide.constant.city[iter_5_0] = false

			guide.ui.setVisible(false)

			mainCity.control.selectedBuildIndex = iter_5_0

			mainCity.ui.table["city_effect_" .. tostring(iter_5_0)]:setVisible(true)

			return true
		end
	end

	return false
end

function mainCity.control.onTouchEnded(arg_6_0, arg_6_1)
	if mainCity.control.selectedBuildIndex >= 1 and mainCity.control.selectedBuildIndex <= 6 then
		mainCity.ui.table["city_effect_" .. tostring(mainCity.control.selectedBuildIndex)]:setVisible(true)

		local var_6_0 = {
			SCENE_RES_JUMING,
			SCENE_RES_MUCHANG,
			SCENE_RES_NONGTIAN,
			SCENE_RES_BINGTIE,
			SCENE_RES_BINGYING,
			SCENE_RES_HUANGCHENG
		}

		if var_6_0[mainCity.control.selectedBuildIndex] == SCENE_RES_HUANGCHENG and user.player.inOccupyBattle then
			bmgr.tryEnterBattle(battleType.BATTLE_OCCUPY, {
				reserve = 0
			})
		else
			smgr.changeScene(var_6_0[mainCity.control.selectedBuildIndex])
		end

		mainCity.control.selectedBuildIndex = 0
	end
end

function mainCity.control.onTouch(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_0 == CCTOUCHBEGAN then
		return mainCity.control.onTouchBegan(arg_7_1, arg_7_2)
	elseif arg_7_0 == CCTOUCHENDED then
		return mainCity.control.onTouchEnded(arg_7_1, arg_7_2)
	end
end

function mainCity.control.Invest(arg_8_0)
	cmgr.sendRequest(mainCity.control.getMainCityInfo, actions.buildingInvest, mainCity.control.invest[arg_8_0].type)
end

function mainCity.control.handlerPushMohistAction(arg_9_0)
	local var_9_0 = arg_9_0.action.data.update

	if var_9_0.reformDone and (var_9_0.reformDone.buildingId and false or var_9_0.reformDone.bios) then
		roleDialogue.control.loadSpeak("moJiaBuild7")
	end

	if var_9_0.completeInfo and var_9_0.completeInfo.allOver then
		roleDialogue.control.loadSpeak("moJiaBuild2")
	end

	if var_9_0.mohistDrawing then
		user.mojia.mohistDrawingNum = var_9_0.mohistDrawing.drawingNum
	end
end
