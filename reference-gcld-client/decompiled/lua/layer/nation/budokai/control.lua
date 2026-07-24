local var_0_0 = class("budokaiControl")

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.ui = arg_1_1
end

function var_0_0.getDuelInfo(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0.data = arg_3_0.action.data

		arg_2_0.ui:init()
	end

	cmgr.sendRequest(var_2_0, actions.getDuelInfo)
end

function var_0_0.onTouch(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if arg_4_1 == CCTOUCHBEGAN then
		for iter_4_0 = 1, 3 do
			if arg_4_0.data.players and tool.checkIfTouch(arg_4_0.ui.uiTable["budokaiPlayerCard_" .. iter_4_0], arg_4_2, arg_4_3) then
				arg_4_0.ui.uiTable["budokaiPlayerHighlight_" .. iter_4_0]:setVisible(true)

				for iter_4_1 = 1, 3 do
					if iter_4_0 ~= iter_4_1 then
						arg_4_0.ui.uiTable["budokaiPlayerHighlight_" .. iter_4_1]:setVisible(false)
					end
				end

				arg_4_0.targetId = arg_4_0.data.players[iter_4_0].playerId

				arg_4_0:getDuelGeneralInfo(arg_4_0.data.players[iter_4_0].playerId)

				return
			end
		end
	end
end

function var_0_0.getDuelGeneralInfo(arg_5_0, arg_5_1)
	local function var_5_0(arg_6_0)
		arg_5_0.ui.uiTable.budokaiChoose:setVisible(false)

		for iter_6_0 = 1, 4 do
			local var_6_0 = arg_6_0.action.data.generals[iter_6_0]

			arg_5_0.ui.uiTable["budokaiEnemyGeneral_" .. iter_6_0]:setVisible(true)

			if var_6_0 == nil then
				arg_5_0.ui.uiTable["budokaiEnemyGeneralHead_" .. iter_6_0]:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("assa_general_view_emp.png"))
				arg_5_0.ui.uiTable["budokaiEnemyGeneralLevel_" .. iter_6_0]:setVisible(false)
			else
				arg_5_0.ui.uiTable["budokaiEnemyGeneralHead_" .. iter_6_0]:setDisplayFrame(CCSprite:create("res/ui/common/generalPic/generalPic_" .. var_6_0.pic .. ".jpg"):displayFrame())
				arg_5_0.ui.uiTable["budokaiEnemyGeneralLevel_" .. iter_6_0]:setVisible(true)
				arg_5_0.ui.uiTable["budokaiEnemyGeneralLevel_" .. iter_6_0]:setString("Lv:" .. var_6_0.generalLv)
			end
		end
	end

	cmgr.sendRequest(var_5_0, actions.getDuelGeneralInfo, arg_5_1)
end

function var_0_0.startFight(arg_7_0)
	if arg_7_0.targetId == nil then
		messageBox.alert("", language.get(93001))

		return
	end

	smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
	bmgr.tryEnterBattle(battleType.BATTLE_DUEL, {
		targetId = arg_7_0.targetId
	})
end

function var_0_0.enterFight(arg_8_0, arg_8_1)
	smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
	bmgr.tryEnterBattle(battleType.BATTLE_DUEL, {
		battleId = arg_8_1
	})
end

function var_0_0.onEnter(arg_9_0)
	return
end

function var_0_0.onExit(arg_10_0)
	return
end

return var_0_0
