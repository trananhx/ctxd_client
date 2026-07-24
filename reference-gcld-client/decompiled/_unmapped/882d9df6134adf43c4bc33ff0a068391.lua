require("lua/common/tool")

dragonTechControl = {}

local var_0_0 = dragonTechControl

var_0_0.techDataAll = {}
var_0_0.techData = {}
var_0_0.nextTechInfo = nil
var_0_0.nextLevelTechInfo = nil

local var_0_1 = false

var_0_0.totalPage = 1
var_0_0.touchedTechIdx = 1

local var_0_2 = 0
local var_0_3 = 1
local var_0_4 = 2
local var_0_5 = 160
local var_0_6 = 200
local var_0_7 = {}
local var_0_8

function var_0_0.update(arg_1_0)
	for iter_1_0, iter_1_1 in pairs(var_0_7) do
		local var_1_0 = var_0_0.techData[iter_1_1]

		if var_1_0.cd > 0 then
			var_1_0.cd = var_1_0.cd - 1000 * arg_1_0

			if var_1_0.cd <= 0 then
				var_1_0.cd = 0
				var_1_0.status = technologyListConstant.TECH_STATUS_EFFECTED

				dragonTechUI.updateDragonTechCell(var_0_0.techData[iter_1_1], iter_1_1)
			end
		end
	end
end

function var_0_0.onEnter()
	var_0_0.touchedTechIdx = 1
	var_0_7 = {}
	var_0_0.nextTechInfo = nil
	var_0_0.nextLevelTechInfo = nil
	var_0_0.touchedTechIdx = 1
	var_0_8 = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_0_0.update, 1, false)
end

function var_0_0.onExit()
	if var_0_8 then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_8)
	end
end

function var_0_0.getDragonTechInfo(arg_4_0)
	local function var_4_0(arg_5_0)
		if arg_5_0.action.data.currentPage == 1 then
			var_0_0.techDataAll = {}
			var_0_0.techData = {}
			var_0_0.totalPage = arg_5_0.action.data.totalPage
			var_0_0.nextTechInfo = arg_5_0.action.data.nextTechInfo
			var_0_0.nextLevelTechInfo = arg_5_0.action.data.nextLevelTechInfo

			if var_0_0.nextLevelTechInfo and (var_0_0.nextLevelTechInfo.pic == "minzhong" or var_0_0.nextLevelTechInfo.pic == "zhengwu") then
				var_0_0.nextLevelTechInfo = nil
			end
		end

		for iter_5_0 = 1, #arg_5_0.action.data.techs do
			if arg_5_0.action.data.techs[iter_5_0].pic ~= "minzhong" and arg_5_0.action.data.techs[iter_5_0].pic ~= "zhengwu" and not arg_5_0.action.data.techs[iter_5_0].isLianxie then
				var_0_0.techDataAll[#var_0_0.techDataAll + 1] = arg_5_0.action.data.techs[iter_5_0]
			end
		end

		if arg_5_0.action.data.currentPage ~= arg_5_0.action.data.totalPage then
			var_0_0.getDragonTechInfo(arg_5_0.action.data.currentPage + 1)
		else
			var_0_0.techData = var_0_0.techDataAll

			for iter_5_1 = 1, #var_0_0.techData do
				local var_5_0 = var_0_0.techData[iter_5_1]

				if var_5_0.status == technologyListConstant.TECH_STATUS_RESEARCHING then
					table.insert(var_0_7, iter_5_1)
				end

				if var_0_0.nextTechInfo and var_0_0.nextLevelTechInfo then
					if not var_0_0.nextTechInfo.idx and var_5_0.pic == var_0_0.nextTechInfo.pic then
						var_0_0.nextTechInfo.idx = iter_5_1
					end

					if not var_0_0.nextLevelTechInfo.idx and var_5_0.pic == var_0_0.nextLevelTechInfo.pic then
						var_0_0.nextLevelTechInfo.idx = iter_5_1
					end
				end
			end

			log.info("render begin...")
			dragonTechUI.createDragonTechList(var_0_0.techData)
			dragonTechUI.showTechInfoPanel()
			log.info("render end.")
		end

		log.info("get info action successed")
	end

	cmgr.sendRequest(var_4_0, actions.technologyGetInfo, arg_4_0)
end

function var_0_0.openDragonTech(arg_6_0)
	local function var_6_0(arg_7_0)
		dragonTechUI.showOpenTechEffect(function()
			local var_8_0 = var_0_0.touchedTechIdx
			local var_8_1 = var_0_0.techData[var_8_0]

			var_8_1.status = var_0_3

			dragonTechUI.updateDragonTechCell(var_8_1, var_8_0)
			dragonTechUI.showDragonTechByIdx(var_8_0)
		end)
	end

	cmgr.sendRequest(var_6_0, actions.openDragonTech, arg_6_0)
end

function var_0_0.onInvest(arg_9_0)
	local function var_9_0(arg_10_0)
		local var_10_0 = var_0_0.touchedTechIdx
		local var_10_1 = var_0_0.techData[var_10_0]

		var_10_1.num = arg_10_0.action.data.num

		dragonTechUI.showInvestEffect(var_10_1.num)

		if var_10_1.num == arg_10_0.action.data.total then
			var_10_1.status = technologyListConstant.TECH_STATUS_READY

			dragonTechUI.showOpenTechEffect(function()
				dragonTechUI.updateDragonTechCell(var_10_1, var_10_0)
				dragonTechUI.showDragonTechByIdx(var_10_0)
			end, "res/ui/common/text/technology/lm_tit_zzcg.png")
		end
	end

	cmgr.sendRequest(var_9_0, actions.technologyInvest, arg_9_0)
end

function var_0_0.onResearch(arg_12_0)
	local function var_12_0(arg_13_0)
		local var_13_0 = var_0_0.touchedTechIdx
		local var_13_1 = var_0_0.techData[var_13_0]

		var_13_1.status = technologyListConstant.TECH_STATUS_RESEARCHING

		table.insert(var_0_7, var_13_0)

		var_13_1.cd = var_13_1.cdTotal

		dragonTechUI.showOpenTechEffect(function()
			dragonTechUI.updateDragonTechCell(var_13_1, var_13_0)
			dragonTechUI.showDragonTechByIdx(var_13_0)
		end, "res/ui/common/text/technology/lm_tit_ksyj.png")
	end

	cmgr.sendRequest(var_12_0, actions.technologyResearch, arg_12_0)
end

function var_0_0.onCdRecover(arg_15_0)
	local function var_15_0(arg_16_0)
		local var_16_0 = var_0_0.touchedTechIdx
		local var_16_1 = var_0_0.techData[var_16_0]

		var_16_1.status = technologyListConstant.TECH_STATUS_EFFECTED

		dragonTechUI.showOpenTechEffect(function()
			dragonTechUI.updateDragonTechCell(var_16_1, var_16_0)
			dragonTechUI.showDragonTechByIdx(var_16_0)
		end)
	end

	local function var_15_1(arg_18_0)
		messageBox.showChargeWin(language.get(10003), language.get(50006, arg_18_0.action.data.gold), "techCd", function()
			cmgr.sendRequest(var_15_0, actions.technologyCdRecoverConfirm, arg_15_0)
		end)
	end

	if user.chargeItems.techCd.noDisturb then
		cmgr.sendRequest(var_15_0, actions.technologyCdRecoverConfirm, arg_15_0)
	else
		cmgr.sendRequest(var_15_1, actions.technologyCdRecover, arg_15_0)
	end
end

local function var_0_9(arg_20_0, arg_20_1)
	log.debug("touch end  at " .. arg_20_0 .. ", " .. arg_20_1)

	if dragonTechUI.uiTable.twoTechPanel:isVisible() then
		if tool.checkIfTouch(dragonTechUI.uiTable.techPicL, arg_20_0, arg_20_1) then
			dragonTechUI.moveToCell(var_0_0.nextTechInfo.idx)
		elseif tool.checkIfTouch(dragonTechUI.uiTable.techPicR, arg_20_0, arg_20_1) then
			dragonTechUI.moveToCell(var_0_0.nextLevelTechInfo.idx)
		end
	end

	if dragonTechUI.uiTable.dragonTechList then
		for iter_20_0 = 1, #var_0_0.techData do
			if tool.checkIfTouch(dragonTechUI.uiTable["dragonTechCell" .. iter_20_0], arg_20_0, arg_20_1) then
				log.info("cell " .. iter_20_0 .. " touched")
				dragonTechUI.showDragonTechByIdx(iter_20_0)
				dragonTechUI.uiTable.oneTechPanel:setVisible(true)
				dragonTechUI.uiTable.twoTechPanel:setVisible(false)
			end
		end
	end
end

local var_0_10 = 0

function var_0_0.onTouch(arg_21_0, arg_21_1, arg_21_2)
	log.debug("touched  at " .. arg_21_1 .. ", " .. arg_21_2)

	if arg_21_0 == CCTOUCHBEGAN then
		var_0_10 = arg_21_1

		return true
	elseif arg_21_0 == CCTOUCHMOVED then
		var_0_1 = true

		return true
	elseif arg_21_0 == CCTOUCHENDED then
		log.debug("touched end ")

		if not var_0_1 or math.abs(var_0_10 - arg_21_1) < 20 then
			var_0_9(arg_21_1, arg_21_2)
		end

		var_0_1 = false

		return true
	end
end
