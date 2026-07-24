playerInfoControl = {}

local var_0_0 = playerInfoControl

local function var_0_1(arg_1_0)
	require("lua/data/actionHandler").handlerPlayerInfoAction(arg_1_0)
end

local function var_0_2(arg_2_0)
	if arg_2_0.gold and user.player.gold > arg_2_0.gold then
		playerInfoUI.playerReduceAnim("gold", user.player.gold - arg_2_0.gold)
	end

	if arg_2_0.copper and user.player.copper > arg_2_0.copper then
		playerInfoUI.playerReduceAnim("silver", user.player.copper - arg_2_0.copper)
	end

	if arg_2_0.wood and user.player.wood > arg_2_0.wood then
		playerInfoUI.playerReduceAnim("wood", user.player.wood - arg_2_0.wood)
	end

	if arg_2_0.food and user.player.food > arg_2_0.food then
		playerInfoUI.playerReduceAnim("food", user.player.food - arg_2_0.food)
	end

	if arg_2_0.iron and user.player.iron > arg_2_0.iron then
		playerInfoUI.playerReduceAnim("iron", user.player.iron - arg_2_0.iron)
	end

	if arg_2_0.playerLv then
		eventManager.dispatchEvent("refreshInstance")
	end

	if arg_2_0["function"] then
		eventManager.dispatchEvent("updateFuncionItem")
	end
end

local function var_0_3()
	playerInfoUI.updateResourceUI()
end

local function var_0_4()
	playerInfoUI.updatePlayerPortrait()
end

local function var_0_5(arg_5_0)
	local var_5_0 = arg_5_0.action.data.changeName

	if var_5_0 then
		if user.player.name == var_5_0.from then
			user.player.pic = var_5_0.pic
			user.player.name = var_5_0.to

			playerInfoUI.updatePlayerPortrait()
		else
			user.changeName = user.changeName or {}

			table.insert(user.changeName, var_5_0)
			notice.control.refreshLayer()
		end
	end
end

function var_0_0.getPlayerInfo()
	return
end

function var_0_0.game_exit()
	smgr.getLayer("uiLayer"):removeChild(playerInfoUI.uiTable.layer, true)
end

function var_0_0.CrossMenuClicked(arg_8_0)
	local var_8_0, var_8_1 = playerInfoUI.uiTable.setting:getPosition()

	if arg_8_0 == false then
		local var_8_2 = CCMoveTo:create(0.3, ccp(var_8_0 + 100, var_8_1 + 100))

		playerInfoUI.uiTable.setting:runAction(var_8_2)
	else
		local var_8_3 = CCMoveTo:create(0.3, ccp(var_8_0 - 100, var_8_1 - 100))

		playerInfoUI.uiTable.setting:runAction(var_8_3)
	end
end

function var_0_0.onEnter()
	eventManager.registerEvent(eventConst.PLAYER_UPDATE_BEFORE, var_0_2)
	eventManager.registerEvent(eventConst.PLAYER_UPDATE_OVER, var_0_3)
	eventManager.registerEvent("createCharacterOver", var_0_4)
	eventManager.registerEvent("GameOver", var_0_0.game_exit)
	eventManager.registerEvent("CrossMenuClicked", var_0_0.CrossMenuClicked)
	eventManager.registerEvent("chgJunGongButton", playerInfoUI.setIconWmbtPos)
	eventManager.registerEvent("sdtjBuff", playerInfoUI.setSdtjBuff)
	eventManager.registerEvent("offlineBuff", playerInfoUI.setOfflineBuff)
	cmgr.registerResponseHandler(actions.pushChangeName, var_0_5)
end

function var_0_0.onExit()
	eventManager.unregisterEvent(eventConst.PLAYER_UPDATE_BEFORE, var_0_2)
	eventManager.unregisterEvent(eventConst.PLAYER_UPDATE_OVER, var_0_3)
	eventManager.unregisterEvent("createCharacterOver", var_0_4)
	eventManager.unregisterEvent("GameOver", var_0_0.game_exit)
	eventManager.unregisterEvent("CrossMenuClicked", var_0_0.CrossMenuClicked)
	eventManager.unregisterEvent("chgJunGongButton", playerInfoUI.setIconWmbtPos)
	eventManager.unregisterEvent("sdtjBuff", playerInfoUI.setSdtjBuff)
	eventManager.unregisterEvent("offlineBuff", playerInfoUI.setOfflineBuff)
	cmgr.unregisterResponseHandler(actions.pushChangeName, var_0_5)
end

local function var_0_6(arg_11_0, arg_11_1)
	log.info("onTouch :", arg_11_0, arg_11_1)

	if playerInfoUI.uiTable.resTipsFrame then
		pcall(function()
			playerInfoUI.uiTable.resTipsFrame:removeFromParentAndCleanup(true)
		end)

		playerInfoUI.uiTable.resTipsFrame = nil
	end

	if tool.checkIfTouch(playerInfoUI.uiTable.goldLabelLayer, arg_11_0, arg_11_1) then
		log.info("goldLabelLayer onTouch :", arg_11_0, arg_11_1)

		local var_11_0 = {}

		playerInfoUI.showResTips(1, var_11_0, arg_11_0, arg_11_1)
	elseif tool.checkIfTouch(playerInfoUI.uiTable.silverLabelLayer, arg_11_0, arg_11_1) then
		log.info("silverLabelLayer onTouch :", arg_11_0, arg_11_1)

		local var_11_1 = {
			res = user.player.copper,
			output = user.player.copperOutput,
			max = user.player.copperMax
		}

		log.info(string.format("ouput:%s max:%s", user.player.copperOutput, user.player.copperMax))
		playerInfoUI.showResTips(2, var_11_1, arg_11_0, arg_11_1)
	elseif tool.checkIfTouch(playerInfoUI.uiTable.woodLabelLayer, arg_11_0, arg_11_1) then
		log.info("woodLabelLayer onTouch :", arg_11_0, arg_11_1)

		local var_11_2 = {
			res = user.player.wood,
			output = user.player.woodOutput,
			max = user.player.woodMax
		}

		log.info(string.format("ouput:%s max:%s", user.player.woodOutput, user.player.woodMax))
		playerInfoUI.showResTips(3, var_11_2, arg_11_0, arg_11_1)
	elseif tool.checkIfTouch(playerInfoUI.uiTable.foodLabelLayer, arg_11_0, arg_11_1) then
		log.info("foodLabelLayer onTouch :", arg_11_0, arg_11_1)

		local var_11_3 = {
			res = user.player.food,
			output = user.player.foodOutput,
			max = user.player.foodMax
		}

		log.info(string.format("ouput:%s max:%s", user.player.foodOutput, user.player.foodMax))
		playerInfoUI.showResTips(4, var_11_3, arg_11_0, arg_11_1)
	elseif tool.checkIfTouch(playerInfoUI.uiTable.ironLabelLayer, arg_11_0, arg_11_1) then
		log.info("ironLabelLayer onTouch :", arg_11_0, arg_11_1)

		local var_11_4 = {
			res = user.player.iron,
			output = user.player.ironOutput,
			max = user.player.ironMax
		}

		log.info(string.format("ouput:%s max:%s", user.player.ironOutput, user.player.ironMax))
		playerInfoUI.showResTips(5, var_11_4, arg_11_0, arg_11_1)
	elseif playerInfoUI.uiTable.icon_wmbt:isVisible() and tool.checkIfTouch(playerInfoUI.uiTable.icon_wmbt, arg_11_0, arg_11_1) then
		log.info("show tips, icon_wmbt onTouch:", arg_11_0, arg_11_1)
		playerInfoUI.showWMBTTips()
	elseif playerInfoUI.uiTable.icon_sdtj:isVisible() and tool.checkIfTouch(playerInfoUI.uiTable.icon_sdtj, arg_11_0, arg_11_1) then
		log.info("show tips, icon_sdtj onTouch:", arg_11_0, arg_11_1)
		playerInfoUI.showSdtjTips()
	elseif playerInfoUI.uiTable.icon_offlineBuff:isVisible() and tool.checkIfTouch(playerInfoUI.uiTable.icon_offlineBuff, arg_11_0, arg_11_1) then
		log.info("show tips, icon_offlineBuff onTouch:", arg_11_0, arg_11_1)
		playerInfoUI.showOfflineBuffTips()
	elseif playerInfoUI.uiTable.icon_seal:isVisible() and tool.checkIfTouch(playerInfoUI.uiTable.icon_seal, arg_11_0, arg_11_1) then
		log.info("show tips, icon_seal onTouch:", arg_11_0, arg_11_1)
		playerInfoUI.showSealBuffTips()
	elseif playerInfoUI.uiTable.icon_topLv:isVisible() and tool.checkIfTouch(playerInfoUI.uiTable.icon_topLv, arg_11_0, arg_11_1) then
		log.info("show tips, icon_topLv onTouch:", arg_11_0, arg_11_1)
		messageBox.confirm(language.get(385002))
	end

	log.info("should show tips ")

	return true
end

function var_0_0.onTouch(arg_13_0, arg_13_1, arg_13_2)
	if arg_13_0 == CCTOUCHBEGAN then
		return var_0_6(arg_13_1, arg_13_2)
	elseif arg_13_0 == CCTOUCHENDED then
		log.info("should hide tips ")

		if playerInfoUI.uiTable.resTipsFrame then
			pcall(function()
				playerInfoUI.uiTable.resTipsFrame:removeFromParentAndCleanup(true)
			end)
		end

		if playerInfoUI.uiTable.icon_wmbt:isVisible() and playerInfoUI.uiTable.wmbtBg then
			playerInfoUI.uiTable.wmbtBg:setVisible(false)
		end

		if playerInfoUI.uiTable.icon_sdtj and playerInfoUI.uiTable.icon_sdtj:isVisible() and playerInfoUI.uiTable.sdtjBg then
			playerInfoUI.uiTable.sdtjBg:setVisible(false)
		end

		if playerInfoUI.uiTable.icon_offlineBuff and playerInfoUI.uiTable.icon_offlineBuff:isVisible() and playerInfoUI.uiTable.offlineBuffBg then
			playerInfoUI.uiTable.offlineBuffBg:setVisible(false)
		end

		if playerInfoUI.uiTable.icon_seal and playerInfoUI.uiTable.icon_seal:isVisible() and playerInfoUI.uiTable.sealBuffBg then
			playerInfoUI.uiTable.sealBuffBg:setVisible(false)
		end
	end
end
