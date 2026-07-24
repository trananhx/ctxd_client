require("lua/component/timerLabel")
require("lua/layer/rankInfo/workerList/control")
require("lua/layer/rankInfo/workerList/constant")
require("lua/layer/rankInfo/workerList/uidata")

workerListUI = {}

local var_0_0 = workerListUI

workerListUI.uiTable = {}

local var_0_1 = workerListControl
local var_0_2 = workerListConstant

function workerListUI.show()
	rmgr.loadResource("res/ui/tavern/tavern.plist")

	local var_1_0 = createBaseLayer()

	smgr.registerLayer(var_1_0, "workerListLayer")
	var_1_0:registerScriptTouchHandler(var_0_1.onTouch)
	var_1_0:setTouchEnabled(true)

	var_1_0.onEnter = var_0_1.onEnter
	var_1_0.onExit = var_0_1.onExit
	var_0_0.uiTable = autoUI.initUI(var_1_0, getWorkerListUIData())

	var_0_1.getWorkListInfo(1)
	var_0_0.uiTable.btn_open:registerScriptTapHandler(function()
		technologyUI.show(2)
	end)

	if conf.language == "vie" then
		workerListUI.uiTable.baseTechNum:setDimensions(CCSizeMake(224, 45))
		workerListUI.uiTable.baseTechNum:setHorizontalAlignment(kCCTextAlignmentCenter)
		workerListUI.uiTable.baseTechNum:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		workerListUI.uiTable.armyTechNum:setDimensions(CCSizeMake(224, 45))
		workerListUI.uiTable.armyTechNum:setHorizontalAlignment(kCCTextAlignmentCenter)
		workerListUI.uiTable.armyTechNum:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	end

	return var_1_0
end

function workerListUI.setListData(arg_3_0, arg_3_1)
	workerListUI.updateRankListLayer(arg_3_0.list)

	if arg_3_1 == 1 then
		log.info("1111111111111")
		workerListUI.uiTable.mujiang:setDisplayFrame(tool.spriteFrameByName("tavern_yeqian1_normal.png"))
		workerListUI.uiTable.tiejiang:setDisplayFrame(tool.spriteFrameByName("tavern_yeqian1_light.png"))
		workerListUI.uiTable.oneTechPanel:reorderChild(workerListUI.uiTable.mujiang, 100)
		workerListUI.uiTable.oneTechPanel:reorderChild(workerListUI.uiTable.tiejiang, 200)
	else
		log.info("2222222222222")
		workerListUI.uiTable.mujiang:setDisplayFrame(tool.spriteFrameByName("tavern_yeqian1_light.png"))
		workerListUI.uiTable.tiejiang:setDisplayFrame(tool.spriteFrameByName("tavern_yeqian1_normal.png"))
		workerListUI.uiTable.oneTechPanel:reorderChild(workerListUI.uiTable.mujiang, 200)
		workerListUI.uiTable.oneTechPanel:reorderChild(workerListUI.uiTable.tiejiang, 100)
	end

	workerListUI.uiTable.baseTechNum:setString(language.get("222022_buildingTech", arg_3_0.baseTechNum))
	workerListUI.uiTable.armyTechNum:setString(language.get("222021_buildingTech", arg_3_0.armyTechNum))
	workerListUI.uiTable.deathTechNum:setString(language.get(491070, arg_3_0.deathTechNum))
end

function workerListUI.updateRankListLayer(arg_4_0)
	if var_0_0.uiTable.rankListTableView then
		pcall(var_0_0.uiTable.rankListTableView.removeFromParentAndCleanup, var_0_0.uiTable.rankListTableView, true)
	end

	if #arg_4_0 < 8 then
		for iter_4_0 = 1, 8 do
			if arg_4_0[iter_4_0] then
				arg_4_0[iter_4_0].lv = "Lv." .. arg_4_0[iter_4_0].lv
			else
				arg_4_0[iter_4_0] = {}
				arg_4_0[iter_4_0].name = ""
				arg_4_0[iter_4_0].lv = ""
			end
		end
	else
		for iter_4_1 = 1, #arg_4_0 do
			arg_4_0[iter_4_1].lv = "Lv." .. arg_4_0[iter_4_1].lv
		end
	end

	var_0_0.uiTable.rankListTableView = var_0_0.createRankListTableView(arg_4_0)

	var_0_0.uiTable.rankListTableView:setPosition(3, 4)
	var_0_0.uiTable.oneTechPanel:addChild(var_0_0.uiTable.rankListTableView)
end

function workerListUI.createRankListTableView(arg_5_0)
	local var_5_0 = CCTableView:create(CCSizeMake(909, 328))

	var_5_0:setDirection(kCCScrollViewDirectionVertical)
	var_5_0:setVerticalFillOrder(kCCTableViewFillTopDown)

	local function var_5_1(arg_6_0, arg_6_1)
		return
	end

	local function var_5_2(arg_7_0, arg_7_1)
		return
	end

	local function var_5_3(arg_8_0, arg_8_1)
		return
	end

	local function var_5_4(arg_9_0, arg_9_1)
		return 40, 905
	end

	local function var_5_5(arg_10_0, arg_10_1)
		local var_10_0 = arg_5_0[arg_10_1 + 1]
		local var_10_1 = arg_10_0:dequeueCell()

		if var_10_1 then
			var_10_1:removeAllChildrenWithCleanup(true)
		else
			var_10_1 = CCTableViewCell:new()
		end

		local var_10_2 = CCSprite:create(string.format("res/ui/rankInfo/workerList/jzke_gjmc_list_long0%s.png", arg_10_1 % 2 + 1))

		var_10_2:setAnchorPoint(CCPointMake(0, 0))
		var_10_2:setPosition(CCPointMake(0, 0))

		local var_10_3 = autoUI.createUI(var_10_2, getWorkerListInfoCellData(var_10_0), nil)

		var_10_1:addChild(var_10_2)

		return var_10_1
	end

	local function var_5_6()
		if arg_5_0 then
			return #arg_5_0
		else
			return 0
		end
	end

	var_5_0:registerScriptHandler(var_5_1, CCTableView.kTableCellHighLight)
	var_5_0:registerScriptHandler(var_5_2, CCTableView.kTableCellUnhighLight)
	var_5_0:registerScriptHandler(var_5_3, CCTableView.kTableCellTouched)
	var_5_0:registerScriptHandler(var_5_4, CCTableView.kTableCellSizeForIndex)
	var_5_0:registerScriptHandler(var_5_5, CCTableView.kTableCellSizeAtIndex)
	var_5_0:registerScriptHandler(var_5_6, CCTableView.kNumberOfCellsInTableView)
	var_5_0:reloadData()

	return var_5_0
end
