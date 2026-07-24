local var_0_0 = class("budokaiTab", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0)
	rmgr.loadTable({
		"res/ui/nation/budokai.plist"
	})

	arg_2_0.uidata = require("lua/layer/nation/budokai/uidata").new()
	arg_2_0.control = require("lua/layer/nation/budokai/control").new(arg_2_0)
	arg_2_0.onEnter = arg_2_0.control.onEnter
	arg_2_0.onExit = arg_2_0.control.onExit

	arg_2_0:registerScriptTouchHandler(function(arg_3_0, arg_3_1, arg_3_2)
		arg_2_0.control:onTouch(arg_3_0, arg_3_1, arg_3_2)
	end)
	arg_2_0:setTouchEnabled(true)
	arg_2_0.control:getDuelInfo()
end

function var_0_0.init(arg_4_0)
	if arg_4_0.uiTable and arg_4_0.uiTable.background then
		arg_4_0.uiTable.background:removeFromParentAndCleanup(true)
	end

	arg_4_0.uiTable = autoUI.initUI(arg_4_0, arg_4_0.uidata:getData())

	arg_4_0.uiTable.budokaiPlayerHead:setDisplayFrame(CCSpriteFrame:create(string.format("res/ui/common/playerHead/playerHead_icon_%s.png", user.player.pic), CCRectMake(0, 0, 90, 90)))
	arg_4_0.uiTable.budokaiScore:setString(arg_4_0.control.data.score)
	arg_4_0.uiTable.budokaiWin:setString(arg_4_0.control.data.win)
	arg_4_0.uiTable.budokaiLose:setString(arg_4_0.control.data.lose)
	arg_4_0.uiTable.budokaiRank:setString(arg_4_0.control.data.rank)

	for iter_4_0 = 1, 6 do
		local var_4_0 = arg_4_0.control.data.records[iter_4_0]

		if var_4_0 == nil then
			arg_4_0.uiTable["budokaiRecord_" .. iter_4_0]:setString("")
		else
			if var_4_0.isAtt == 0 then
				local var_4_1 = language.get(93004, var_4_0.playerName, var_4_0.isWin and language.get(93005) or language.get(93006), var_4_0.isWin and "+" or "-", var_4_0.score)

				arg_4_0.uiTable["budokaiRecord_" .. iter_4_0]:setString(var_4_1)
			else
				local var_4_2 = language.get(93007, var_4_0.playerName, var_4_0.isWin and language.get(93006) or language.get(93005), var_4_0.score)

				arg_4_0.uiTable["budokaiRecord_" .. iter_4_0]:setString(var_4_2)
			end

			if var_4_0.isWin then
				arg_4_0.uiTable["budokaiRecord_" .. iter_4_0]:setColor(ccc3(0, 255, 0))
			else
				arg_4_0.uiTable["budokaiRecord_" .. iter_4_0]:setColor(ccc3(255, 0, 0))
			end
		end
	end

	if arg_4_0.control.data.players then
		for iter_4_1 = 1, #arg_4_0.control.data.players do
			local var_4_3 = arg_4_0.control.data.players[iter_4_1]

			arg_4_0.uiTable["budokaiPlayerCard_" .. iter_4_1]:setVisible(true)
			arg_4_0.uiTable["budokaiEnemyHead_" .. iter_4_1]:setDisplayFrame(CCSpriteFrame:create(string.format("res/ui/common/playerHead/playerHead_icon_%s.png", var_4_3.pic), CCRectMake(0, 0, 90, 90)))
			arg_4_0.uiTable["budokaiPlayerName_" .. iter_4_1]:setString(var_4_3.playerName)
			arg_4_0.uiTable["budokaiEnemyScore_" .. iter_4_1]:setString(var_4_3.score)
			arg_4_0.uiTable["budokaiEnemyForce_" .. iter_4_1]:setString(user.forceIdToName[var_4_3.forceId])
			arg_4_0.uiTable["budokaiEnemyForce_" .. iter_4_1]:setColor(colorForce[var_4_3.forceId])
		end

		arg_4_0.uiTable.budokaiStart:setVisible(true)
		arg_4_0.uiTable.budokaiStart:registerScriptTapHandler(function()
			arg_4_0.control:startFight()
		end)
	else
		arg_4_0.uiTable.budokaiFighting:setVisible(true)
		arg_4_0.uiTable.budokaiEnemyName:setString(language.get(93002) .. arg_4_0.control.data.playerName)
		arg_4_0.uiTable.budokaiButtonLabel:setString(language.get(93003))
		arg_4_0.uiTable.budokaiStart:registerScriptTapHandler(function()
			arg_4_0.control:enterFight(arg_4_0.control.data.battleId)
		end)

		for iter_4_2 = 1, 4 do
			local var_4_4 = arg_4_0.control.data.generals[iter_4_2]

			arg_4_0.uiTable["budokaiEnemyGeneral_" .. iter_4_2]:setVisible(true)

			if var_4_4 == nil then
				arg_4_0.uiTable["budokaiEnemyGeneralHead_" .. iter_4_2]:setDisplayFrame(CCSprite:create("res/ui/nation/assa_general_view_emp.jpg"):displayFrame())
				arg_4_0.uiTable["budokaiEnemyGeneralLevel_" .. iter_4_2]:setVisible(false)
			else
				arg_4_0.uiTable.budokaiChoose:setVisible(false)
				arg_4_0.uiTable["budokaiEnemyGeneralHead_" .. iter_4_2]:setDisplayFrame(CCSprite:create("res/ui/common/generalPic/generalPic_" .. var_4_4.pic .. ".jpg"):displayFrame())
				arg_4_0.uiTable["budokaiEnemyGeneralLevel_" .. iter_4_2]:setVisible(true)
				arg_4_0.uiTable["budokaiEnemyGeneralLevel_" .. iter_4_2]:setString("Lv:" .. var_4_4.generalLv)
			end
		end
	end
end

return var_0_0
