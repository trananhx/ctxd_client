local var_0_0 = class("IronMineControl")

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.ui = arg_1_1
end

function var_0_0.handlerMineInfoAction(arg_2_0, arg_2_1)
	arg_2_0.totalPage = arg_2_1.action.data.totalPage
	arg_2_0.currentPage = arg_2_1.action.data.currentPage
	arg_2_0.isloading = false

	if arg_2_0.ismoving == true then
		arg_2_0.cacheResponse = arg_2_1

		return
	end

	arg_2_0.dealing = false

	arg_2_0.ui:setPosition(ccp(0, 0))

	if arg_2_0.currentPage > 1 then
		arg_2_0.m_Page = 2
		arg_2_0.m_CurPage = 2
	else
		arg_2_0.m_Page = 1
		arg_2_0.m_CurPage = 1
	end

	if arg_2_0.currentPage + 1 <= 5 then
		arg_2_0.m_Page = arg_2_0.m_Page + 1
	end

	arg_2_0.ui:init(arg_2_1)
end

function var_0_0.getMineInfo(arg_3_0, arg_3_1)
	arg_3_1 = arg_3_1 or 0

	cmgr.sendRequest(function(arg_4_0)
		arg_3_0:handlerMineInfoAction(arg_4_0)
	end, actions.getMineInfo, arg_3_1, 1)
end

function var_0_0.onTouchBegan(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.m_TouchDownPoint = ccp(arg_5_1, arg_5_2)
	arg_5_0.m_TouchCurPoint = ccp(arg_5_1, arg_5_2)

	return true
end

function var_0_0.onTouchMoved(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_0.dealing then
		return
	end

	local var_6_0 = ccp(arg_6_1, arg_6_2)
	local var_6_1 = ccp(arg_6_0.ui:getPositionX() + var_6_0.x - arg_6_0.m_TouchCurPoint.x, arg_6_0.ui:getPositionY())

	if arg_6_0.currentPage == 1 and var_6_1.x > 0 then
		var_6_1 = ccp(0, 0)
	end

	if arg_6_0.currentPage == arg_6_0.totalPage and var_6_1.x < 0 then
		var_6_1 = ccp(0, 0)
	end

	arg_6_0.ui:setPosition(var_6_1)

	arg_6_0.m_TouchCurPoint = var_6_0
end

function var_0_0.onTouchEnded(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_0.dealing then
		return
	end

	arg_7_0.dir = 0
	arg_7_0.m_TouchUpPoint = ccp(arg_7_1, arg_7_2)

	local var_7_0 = arg_7_0.m_TouchUpPoint.x - arg_7_0.m_TouchDownPoint.x

	if math.abs(var_7_0) < 15 then
		if arg_7_0.ui.board and not tool.checkIfTouch(arg_7_0.ui.board, arg_7_1, arg_7_2) then
			arg_7_0.ui.board:removeFromParentAndCleanup(true)

			arg_7_0.ui.board = nil
		elseif not arg_7_0.ui.board then
			for iter_7_0, iter_7_1 in pairs(arg_7_0.ui.mineSpriteTable) do
				local var_7_1 = arg_7_1
				local var_7_2 = arg_7_2
				local var_7_3 = var_7_1 + (1386 - visibleSize.width) / 2
				local var_7_4 = var_7_2 + (768 - visibleSize.height) / 2

				if not LayerTransparentCheck:ifTransparent(iter_7_0, ccp(var_7_3, var_7_4), arg_7_0.ui.mineBatchNode) then
					log.info("mineInfo", tool.tableToJson(arg_7_0.ui.mineInfoTable[iter_7_0]))
					arg_7_0.ui:showMineDetail(arg_7_0.ui.mineInfoTable[iter_7_0])
				end
			end
		end

		arg_7_0.changePowerId = arg_7_0.currentPage
	elseif var_7_0 < -300 then
		if arg_7_0.m_CurPage < arg_7_0.m_Page then
			arg_7_0.m_CurPage = arg_7_0.m_Page
			arg_7_0.dir = 1
			arg_7_0.changePowerId = arg_7_0.currentPage + 1
		end
	elseif var_7_0 > 300 and arg_7_0.m_CurPage == 2 then
		arg_7_0.m_CurPage = 1
		arg_7_0.dir = -1
		arg_7_0.changePowerId = arg_7_0.currentPage - 1
	end

	arg_7_0:goToPage()
end

function var_0_0.goToPage(arg_8_0)
	local var_8_0 = CCMoveTo:create(0.2, ccp(-arg_8_0.dir * 1386, 0))
	local var_8_1 = CCArray:create()

	if arg_8_0.changePowerId ~= arg_8_0.currentPage then
		var_8_1:addObject(CCCallFuncN:create(function()
			arg_8_0.isloading = true

			cmgr.sendRequest(function(arg_10_0)
				arg_8_0:handlerMineInfoAction(arg_10_0)
			end, actions.getMineInfo, arg_8_0.changePowerId, 1)
		end))
	end

	if arg_8_0.changePowerId ~= arg_8_0.currentPage then
		var_8_1:addObject(CCCallFuncN:create(function()
			arg_8_0.ismoving = true
		end))
	end

	var_8_1:addObject(var_8_0)

	if arg_8_0.changePowerId ~= arg_8_0.currentPage then
		var_8_1:addObject(CCCallFuncN:create(function()
			arg_8_0.ismoving = false
		end))
	end

	if arg_8_0.changePowerId ~= arg_8_0.currentPage then
		var_8_1:addObject(CCCallFuncN:create(function()
			if arg_8_0.isloading == false then
				arg_8_0:handlerMineInfoAction(arg_8_0.cacheResponse)
			end

			arg_8_0.dealing = false
		end))
	end

	arg_8_0.ui:runAction(CCSequence:create(var_8_1))
end

function var_0_0.onTouch(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	if arg_14_1 == CCTOUCHBEGAN then
		return arg_14_0:onTouchBegan(arg_14_2, arg_14_3)
	elseif arg_14_1 == CCTOUCHMOVED then
		return arg_14_0:onTouchMoved(arg_14_2, arg_14_3)
	elseif arg_14_1 == CCTOUCHENDED then
		return arg_14_0:onTouchEnded(arg_14_2, arg_14_3)
	end
end

function var_0_0.abandon(arg_15_0)
	local function var_15_0(arg_16_0)
		cmgr.sendRequest(function(arg_17_0)
			arg_15_0:handlerMineInfoAction(arg_17_0)
		end, actions.getMineInfo, arg_15_0.currentPage, 1)
	end

	cmgr.sendRequest(var_15_0, actions.mineAbandon, 1)
end

function var_0_0.rush(arg_18_0)
	local function var_18_0(arg_19_0)
		cmgr.sendRequest(function(arg_20_0)
			arg_18_0:handlerMineInfoAction(arg_20_0)
		end, actions.getMineInfo, arg_18_0.currentPage, 1)
	end

	cmgr.sendRequest(var_18_0, actions.mineRush, 1)
end

function var_0_0.mine(arg_21_0)
	local function var_21_0(arg_22_0)
		if arg_22_0.action.data.output then
			globalAction_gotResource({
				{
					id = 4,
					value = tonumber(arg_22_0.action.data.output)
				}
			})
		end

		cmgr.sendRequest(function(arg_23_0)
			arg_21_0:handlerMineInfoAction(arg_23_0)
		end, actions.getMineInfo, arg_21_0.currentPage, 1)
	end

	cmgr.sendRequest(var_21_0, actions.mineMine, 1)
end

function var_0_0.occupy(arg_24_0, arg_24_1)
	bmgr.tryEnterBattle(battleType.BATTLE_PERSONAL_MINE, {
		generalId = 0,
		reserve = 1,
		targetId = arg_24_1
	})
end

function var_0_0.onEnter(arg_25_0)
	mine = {}

	function arg_25_0.updateRef(arg_26_0)
		mine = mine or {}
		mine.dt = mine.dt or 0
		mine.dt = mine.dt + arg_26_0
	end

	arg_25_0.upgradeTimeScheduleEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(arg_25_0.updateRef, 1, false)
end

function var_0_0.onExit(arg_27_0)
	if arg_27_0.upgradeTimeScheduleEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_27_0.upgradeTimeScheduleEntry)

		arg_27_0.upgradeTimeScheduleEntry = nil
	end
end

return var_0_0
