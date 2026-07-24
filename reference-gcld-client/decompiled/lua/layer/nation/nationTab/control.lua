nationTabControl = {}

local var_0_0 = nationTabControl

function handlerGetNationInfoAction(arg_1_0)
	local var_1_0 = arg_1_0.action.data

	var_0_0.nations = var_1_0.nations
	var_0_0.name = var_1_0.name
	var_0_0.forceId = user.player.forceId
	var_0_0.times = var_1_0.times
	var_0_0.canUpgrade = var_1_0.canUpgrade
	var_0_0.isKing = var_1_0.isKing
	var_0_0.canEditKingNotice = var_1_0.canEditKingNotice

	if var_1_0.yzInfo and var_1_0.yzInfo.fbTokenNum then
		user.fbTokenNum = var_1_0.yzInfo.fbTokenNum
	end

	for iter_1_0, iter_1_1 in pairs(var_0_0.nations) do
		if var_0_0.forceId == iter_1_1.forceId then
			var_0_0.ourNation = iter_1_1

			table.remove(var_0_0.nations, iter_1_0)
		end
	end

	nationTabUI.init()
end

function var_0_0.getNationInfo()
	cmgr.sendRequest(handlerGetNationInfoAction, actions.getNationInfo)
end

function var_0_0.startShilian()
	messageBox.confirm(language.get(91001), function()
		cmgr.sendRequest(function(arg_5_0)
			return
		end, actions.nationOpenTry)
	end)
end

function var_0_0.startShengji()
	messageBox.confirm(language.get(91002), function()
		cmgr.sendRequest(function(arg_8_0)
			smgr.showTipTextGreen(language.get(91003))
		end, actions.startNationTask, 1)
	end)
end

function var_0_0.updateKingNotice(arg_9_0)
	local function var_9_0(arg_10_0)
		user.kingNotice = 0

		eventManager.dispatchEvent("refreshNoticeLayer")
		nationTabUI.uiTable.lbl_input:setString(arg_9_0)
		nationTabUI.effectHideKingNotice()

		local var_10_0 = CCSprite:create("res/ui/nation/kingNotice/gwgg_word_fzcg.png")
		local var_10_1 = visibleSize.width * 0.5
		local var_10_2 = visibleSize.height * 0.5

		var_10_0:setPosition(ccp(var_10_1, var_10_2))
		smgr.showTipSpriteText(var_10_0, nil)
	end

	cmgr.sendRequest(var_9_0, actions.updateKingNotice, arg_9_0)
end

function var_0_0.getKingNoticeInfo()
	local function var_11_0(arg_12_0)
		nationTabUI.uiTable.lbl_input:setString(arg_12_0.action.data.notice)
	end

	cmgr.sendRequest(var_11_0, actions.getKingNoticeInfo)
end

function var_0_0.clickEditBoxHandle(arg_13_0, arg_13_1)
	local var_13_0 = tolua.cast(arg_13_1, "CCEditBox")

	log.info("editBox", arg_13_0)

	if arg_13_0 == "began" then
		var_0_0.isPrinting = true

		var_13_0:setText(nationTabUI.uiTable.lbl_input:getString())
	elseif arg_13_0 == "changed" then
		if var_0_0.isPrinting == true then
			nationTabUI.uiTable.lbl_input:setString(var_13_0:getText())
		end
	elseif arg_13_0 == "ended" then
		var_0_0.isPrinting = false

		var_13_0:setText("")
		var_13_0:setPlaceHolder(language.get(91024))
	end
end

function var_0_0.onTouch(arg_14_0, arg_14_1, arg_14_2)
	if nationTabUI.open then
		nationTabUI.showTips()
	end
end

function var_0_0.onEnter()
	var_0_0.isPrinting = false

	eventManager.registerEvent("showKingNotice", nationTabUI.effectShowKingNotice)
end

function var_0_0.onExit()
	eventManager.unregisterEvent("showKingNotice", nationTabUI.effectShowKingNotice)
end
