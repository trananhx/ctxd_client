nationChallenges = {}

tool.requireRes("world/nationChallenges")

nationChallenges.ui = {}

local var_0_0 = require("lua/common/json")
local var_0_1
local var_0_2
local var_0_3
local var_0_4 = {
	[1901] = 1901,
	[1903] = 1903,
	[1905] = 1905,
	[17] = 7,
	[21] = 55,
	[1904] = 1904,
	[10] = 6,
	[4] = 4,
	[12] = 10003,
	[1902] = 1902,
	[13] = 10001
}

function nationChallenges.ui.init()
	var_0_1 = false
	var_0_3 = nil

	for iter_1_0 = 1, 3 do
		nationChallenges.ui.table["ring_process_" .. iter_1_0]:setMidpoint(ccp(0.5, 0.5))
		nationChallenges.ui.table["ring_process_" .. iter_1_0]:setBarChangeRate(ccp(1, 1))
		nationChallenges.ui.table["ring_complete_" .. iter_1_0]:setVisible(false)
		nationChallenges.ui.table["ring_click_" .. iter_1_0]:setVisible(false)
		nationChallenges.ui.table["bg_" .. iter_1_0]:setVisible(false)

		local var_1_0 = CCScale9Sprite:create("res/default.png")
		local var_1_1 = CCControlButton:create(var_1_0)

		var_1_1:setPreferredSize(CCSizeMake(75, 75))
		var_1_1:setPosition(38, 38)
		nationChallenges.ui.table["bg_" .. iter_1_0]:addChild(var_1_1)
		var_1_1:addHandleOfControlEvent(function()
			log.info("btn%s: TouchDown", iter_1_0)
			nationChallenges.ui.showTips(iter_1_0, true)
		end, CCControlEventTouchDown)
		var_1_1:addHandleOfControlEvent(function()
			log.info("btn%s: TouchUpInside", iter_1_0)
			nationChallenges.ui.showTips(iter_1_0, false)
			nationChallenges.ui.clickTips(iter_1_0)
		end, CCControlEventTouchUpInside)
		var_1_1:addHandleOfControlEvent(function()
			log.info("btn%s: TouchUpOutside", iter_1_0)
			nationChallenges.ui.showTips(iter_1_0, false)
		end, CCControlEventTouchUpOutside)

		nationChallenges.ui.table["tips_" .. iter_1_0] = var_1_1
	end
end

function nationChallenges.ui.showTips(arg_5_0, arg_5_1)
	local var_5_0 = nationChallenges.ui.data[arg_5_0]

	if var_5_0 == nil then
		return
	end

	if nationChallenges.ui.table.tips == nil then
		local var_5_1 = CCScale9Sprite:create("res/ui/weapon/tips_di.png", CCRectMake(0, 0, 80, 80), CCRectMake(20, 20, 40, 40))

		var_5_1:setPreferredSize(CCSizeMake(300, 90))

		local var_5_2 = CCLabelTTF:create("", "", 20)

		var_5_2:setPosition(150, 45)
		var_5_2:setColor(ccc3(235, 209, 167))
		var_5_2:setDimensions(CCSizeMake(280, 0))
		var_5_2:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_5_2:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_5_1:addChild(var_5_2)

		nationChallenges.ui.table.tipsLabel = var_5_2

		nationChallenges.ui.table.layer:addChild(var_5_1, 10000)

		nationChallenges.ui.table.tips = var_5_1
	end

	for iter_5_0 = 1, 3 do
		nationChallenges.ui.table["ring_click_" .. iter_5_0]:stopAllActions()
		nationChallenges.ui.table["ring_click_" .. iter_5_0]:setVisible(false)
	end

	arg_5_1 = arg_5_1 and (var_5_0.hasRewarded ~= false or not (var_5_0.goal <= var_5_0.process))

	if arg_5_1 then
		local var_5_3 = var_5_0.name .. ": " .. var_5_0.process .. "/" .. var_5_0.goal

		if var_5_0.goal > 10000 then
			var_5_3 = var_5_0.name .. " " .. tool.getFormatNum(var_5_0.process) .. "/" .. tool.getFormatNum(var_5_0.goal)
		end

		local var_5_4 = language.get("95102_lxd", var_5_0.intro)
		local var_5_5 = ""

		if var_5_0.taskIndex then
			var_5_3 = language.get(92033, var_5_0.taskIndex, var_5_0.taskTotalIndex) .. "\n" .. var_5_3

			for iter_5_1, iter_5_2 in ipairs(var_5_0.rewards) do
				if iter_5_1 > 1 then
					var_5_5 = var_5_5 .. ","
				end

				var_5_5 = var_5_5 .. nationChallenges.ui.calculateStr(iter_5_2.rewardType, iter_5_2.rewardNum)
			end
		else
			var_5_5 = nationChallenges.ui.calculateStr(var_5_0.rewardType, var_5_0.rewardNum)

			if var_5_0.itemNum and var_5_0.itemNum > 0 then
				var_5_5 = var_5_5 .. "," .. nationChallenges.ui.calculateStr(var_5_0.itemId, var_5_0.itemNum)
			end
		end

		local var_5_6 = language.get("95103_lxd", var_5_5)
		local var_5_7 = var_5_3 .. "\n" .. var_5_4 .. "\n" .. var_5_6

		nationChallenges.ui.table.tips:stopAllActions()
		nationChallenges.ui.table.tipsLabel:setString(var_5_7)

		local var_5_8 = nationChallenges.ui.table.tipsLabel:getContentSize()
		local var_5_9 = var_5_8.width + 20
		local var_5_10 = var_5_8.height + 20

		nationChallenges.ui.table.tips:setPreferredSize(CCSizeMake(var_5_9, var_5_10))
		nationChallenges.ui.table.tipsLabel:setPosition(ccp(0.5 * var_5_9, 0.5 * var_5_10))
		nationChallenges.ui.table.tips:setPosition(ccp(visibleSize.width - 220, visibleSize.height - 180 - 85 * (arg_5_0 - 1)))
	end

	nationChallenges.ui.table.tips:setVisible(arg_5_1)
	nationChallenges.ui.table["ring_click_" .. arg_5_0]:setVisible(arg_5_1)
end

function nationChallenges.ui.clickTips(arg_6_0)
	local var_6_0 = nationChallenges.ui.data[arg_6_0]

	if var_6_0 == nil then
		return
	end

	if var_6_0.hasRewarded == false and var_6_0.goal <= var_6_0.process then
		local function var_6_1(arg_7_0)
			local var_7_0 = {}

			if var_6_0.taskIndex then
				for iter_7_0, iter_7_1 in ipairs(var_6_0.rewards) do
					if var_0_4[iter_7_1.rewardType] then
						local var_7_1 = {
							id = var_0_4[iter_7_1.rewardType],
							value = iter_7_1.rewardNum
						}

						table.insert(var_7_0, var_7_1)
					end
				end

				nationChallenges.ui.nationTaskChanged()
			else
				if var_0_4[var_6_0.rewardType] then
					local var_7_2 = {
						id = var_0_4[var_6_0.rewardType],
						value = var_6_0.rewardNum
					}

					table.insert(var_7_0, var_7_2)
				end

				if var_6_0.itemNum and var_6_0.itemNum > 0 then
					local var_7_3 = {
						id = var_0_4[var_6_0.itemId],
						value = var_6_0.itemNum
					}

					table.insert(var_7_0, var_7_3)
				end

				var_6_0.hasRewarded = true
				nationChallenges.ui.data[arg_6_0] = var_6_0

				nationChallenges.ui.update(nationChallenges.ui.data)
			end

			globalAction_gotResource(var_7_0)
		end

		cmgr.sendRequest(var_6_1, actions.getIndivReward, var_6_0.id)

		return
	end

	if not var_6_0.taskIndex then
		local function var_6_2(arg_8_0)
			nationChallenges.ui.nationTaskChanged()
		end

		messageBox.showChargeWin("", language.get(92110, var_6_0.fastIndivGold), "fastIndivTask", function()
			cmgr.sendRequest(var_6_2, actions.fastIndivTask)
		end)

		return
	end
end

function nationChallenges.ui.calculateStr(arg_10_0, arg_10_1)
	local var_10_0 = ""

	if arg_10_0 == 4 then
		var_10_0 = language.get(10104)
	elseif arg_10_0 == 10 then
		var_10_0 = language.get(10107)
	elseif arg_10_0 == 12 then
		var_10_0 = language.get(100004)
	elseif arg_10_0 == 13 then
		var_10_0 = language.get(111016)
	elseif arg_10_0 == 17 then
		var_10_0 = language.get(10106)
	elseif arg_10_0 == 21 then
		var_10_0 = language.get(310020)
	elseif arg_10_0 == 1905 then
		var_10_0 = language.get(122070)
	end

	return var_10_0 .. "x" .. tool.getFormatNum(arg_10_1)
end

function nationChallenges.ui.getCurrentRankInfo(arg_11_0)
	local var_11_0
	local var_11_1 = arg_11_0.action.data

	if var_11_1.tasks ~= nil then
		var_0_1 = var_11_1.needTransfer

		if var_11_1.tasks[1] ~= nil and var_11_1.tasks[1].indivTasks ~= nil then
			var_11_0 = var_11_1.tasks[1].indivTasks
		end

		if var_11_0 == nil and var_11_1.tasks[2] ~= nil and var_11_1.tasks[2].indivTasks ~= nil then
			var_11_0 = var_11_1.tasks[2].indivTasks
		end

		var_0_2 = false

		if var_11_1.tasks[1] and var_11_1.tasks[1].nextTaskTime then
			if var_11_1.tasks[1].taskType == 14 or var_11_1.tasks[1].taskType == 17 then
				if var_11_1.tasks[1].taskState ~= 0 and var_11_1.tasks[1].canGetReward == false then
					var_0_2 = true
				end
			elseif var_11_1.tasks[2] then
				if var_11_1.tasks[2].nextTaskTime then
					var_0_2 = true
				end
			else
				var_0_2 = true
			end
		end

		for iter_11_0, iter_11_1 in ipairs(var_11_1.tasks) do
			if iter_11_1.taskType == taskTabConstant.TYPES.NATION_TASK_ZCCG then
				if iter_11_1.canGetReward == true or iter_11_1.deadTime > 0 then
					user.hasKillAllTask = true
				else
					user.hasKillAllTask = false
				end

				taskUI.setkillAllTaskSide(iter_11_1)

				break
			end
		end
	end

	if var_11_0 ~= nil then
		nationChallenges.ui.update(var_11_0)
	end
end

function nationChallenges.ui.updateChanged(arg_12_0)
	if nationChallenges.ui.data then
		for iter_12_0, iter_12_1 in ipairs(nationChallenges.ui.data) do
			if iter_12_1.id == arg_12_0.id then
				iter_12_1.process = arg_12_0.process
				nationChallenges.ui.data[iter_12_0] = iter_12_1

				nationChallenges.ui.update_single(iter_12_0, iter_12_1)

				break
			end
		end
	end
end

function nationChallenges.ui.update(arg_13_0)
	if nationChallenges.ui.isVisible == false or user.player.playerLv <= 29 then
		return
	end

	if worldControl and worldControl.received and (tonumber(worldControl.isWholePointKill) == 1 or tonumber(worldControl.received) == 0) then
		nationChallenges.ui.table.layer:setVisible(false)
		eventManager.dispatchEvent("hourRankSetVisible", true)

		return
	end

	local function var_13_0(arg_14_0, arg_14_1)
		return arg_14_0.id < arg_14_1.id
	end

	table.sort(arg_13_0, var_13_0)

	nationChallenges.ui.data = {}

	local var_13_1 = false

	var_0_3 = nil

	for iter_13_0, iter_13_1 in ipairs(arg_13_0) do
		if iter_13_1.taskIndex and iter_13_1.hasRewarded == false then
			var_0_3 = iter_13_1

			break
		end
	end

	if var_0_2 then
		var_0_3 = nil
		arg_13_0 = {}
	end

	if var_0_1 and var_0_3 then
		var_13_1 = true

		nationChallenges.ui.table.name_indiv:setVisible(true)
		nationChallenges.ui.table.name_1:setVisible(false)
		nationChallenges.ui.table.bg_1:setVisible(true)
		nationChallenges.ui.table.bg_2:setVisible(false)
		nationChallenges.ui.table.bg_3:setVisible(false)
		nationChallenges.ui.update_single(1, var_0_3)

		nationChallenges.ui.data[1] = var_0_3

		if nationChallenges.ui.table.timer then
			nationChallenges.ui.table.timer:removeFromParentAndCleanup(true)

			nationChallenges.ui.table.timer = nil
		end

		if var_0_3.innerType == 1 and var_0_3.indivLeftTime and var_0_3.indivLeftTime > 0 then
			local var_13_2 = createTimerLabel(var_0_3.indivLeftTime, "@M:@S", "Thonburi", 25, function()
				nationChallenges.ui.nationTaskChanged()
				nationChallenges.ui.table.timer:removeFromParentAndCleanup(true)

				nationChallenges.ui.table.timer = nil
			end, nil, nil, colorTips.red)

			var_13_2:setPosition(ccp(38, 0))
			nationChallenges.ui.table.bg_1:addChild(var_13_2, 200)

			nationChallenges.ui.table.timer = var_13_2
		end

		if var_0_3.frontCities then
			eventManager.dispatchEvent("addFrontCity", var_0_3.frontCities)
		end
	else
		local var_13_3 = 1

		for iter_13_2 = 1, 3 do
			nationChallenges.ui.table["bg_" .. iter_13_2]:setVisible(false)

			local var_13_4 = arg_13_0[iter_13_2]

			if var_13_4 ~= nil and var_13_4.hasRewarded == false then
				nationChallenges.ui.update_single(var_13_3, var_13_4)

				nationChallenges.ui.data[var_13_3] = var_13_4
				var_13_3 = var_13_3 + 1

				if var_13_1 == false then
					var_13_1 = true
				end
			end
		end
	end

	eventManager.dispatchEvent("hourRankSetVisible", not var_13_1)
	nationChallenges.ui.table.layer:setVisible(var_13_1)
end

function nationChallenges.ui.update_single(arg_16_0, arg_16_1)
	local var_16_0 = "res/ui/world/nationChallenges/"
	local var_16_1 = nationChallenges.ui.table["ring_click_" .. arg_16_0]

	var_16_1:setVisible(false)
	var_16_1:setOpacity(255)
	var_16_1:stopAllActions()

	if arg_16_1.taskIndex then
		if arg_16_1.process >= arg_16_1.goal then
			nationChallenges.ui.table["ring_process_" .. arg_16_0]:setVisible(false)
			nationChallenges.ui.table["ring_complete_" .. arg_16_0]:setVisible(true)
			var_16_1:setVisible(true)
			var_16_1:setOpacity(0)

			local var_16_2 = CCArray:create()

			var_16_2:addObject(CCFadeIn:create(0.3))
			var_16_2:addObject(CCFadeOut:create(0.7))

			local var_16_3 = CCSequence:create(var_16_2)
			local var_16_4 = CCRepeatForever:create(tolua.cast(var_16_3, "CCActionInterval"))

			var_16_1:runAction(var_16_4)
		else
			local var_16_5 = 100 * arg_16_1.process / arg_16_1.goal

			nationChallenges.ui.table["ring_process_" .. arg_16_0]:setPercentage(var_16_5)
			nationChallenges.ui.table["ring_process_" .. arg_16_0]:setVisible(true)
			nationChallenges.ui.table["ring_complete_" .. arg_16_0]:setVisible(false)
		end

		return
	end

	if arg_16_1.process >= arg_16_1.goal then
		nationChallenges.ui.table["ring_process_" .. arg_16_0]:setVisible(false)
		nationChallenges.ui.table["ring_complete_" .. arg_16_0]:setVisible(true)
		nationChallenges.ui.table["name_" .. arg_16_0]:setVisible(false)

		local var_16_6 = CCSprite:create(var_16_0 .. "task_challenge_icon_" .. arg_16_1.rewardType .. ".png")

		nationChallenges.ui.table["name_" .. arg_16_0]:setDisplayFrame(var_16_6:displayFrame())
		nationChallenges.ui.table["name_" .. arg_16_0]:setVisible(true)

		if nationChallenges.ui.table["name_number_" .. arg_16_0] == nil then
			local var_16_7 = CCLabelTTF:create(arg_16_1.rewardNum, "", 22)

			var_16_7:setPosition(ccp(23, 5))
			nationChallenges.ui.table["name_" .. arg_16_0]:addChild(var_16_7, 10)

			nationChallenges.ui.table["name_number_" .. arg_16_0] = var_16_7
		else
			nationChallenges.ui.table["name_number_" .. arg_16_0]:setString(arg_16_1.rewardNum)
		end

		nationChallenges.ui.table["name_number_" .. arg_16_0]:setVisible(true)
	else
		local var_16_8 = 100 * arg_16_1.process / arg_16_1.goal

		nationChallenges.ui.table["ring_process_" .. arg_16_0]:setPercentage(var_16_8)
		nationChallenges.ui.table["ring_process_" .. arg_16_0]:setVisible(true)
		nationChallenges.ui.table["ring_complete_" .. arg_16_0]:setVisible(false)

		local var_16_9 = CCSprite:create(var_16_0 .. "task_challenge_tit_" .. nationChallenges.constant.picToTit[arg_16_1.pic] .. ".png")

		nationChallenges.ui.table["name_" .. arg_16_0]:setDisplayFrame(var_16_9:displayFrame())
		nationChallenges.ui.table["name_" .. arg_16_0]:setVisible(true)

		if nationChallenges.ui.table["name_number_" .. arg_16_0] ~= nil then
			nationChallenges.ui.table["name_number_" .. arg_16_0]:setVisible(false)
		end
	end

	nationChallenges.ui.table["bg_" .. arg_16_0]:setVisible(true)
end

function nationChallenges.ui.nationTaskChanged()
	cmgr.sendRequest(nationChallenges.ui.getCurrentRankInfo, actions.getCurRankInfo, 1)
end

function nationChallenges.ui.worldRewardDidChanged()
	cmgr.sendRequest(nationChallenges.ui.getCurrentRankInfo, actions.getCurRankInfo, 1)
end

function nationChallenges.ui.show()
	local var_19_0 = createBaseLayer()

	smgr.registerLayer(var_19_0, "nationChallengeLayer")

	nationChallenges.ui.table = autoUI.initUI(var_19_0, getNationChallengesData())
	nationChallenges.ui.table.layer = var_19_0

	nationChallenges.ui.init()

	function var_19_0.onEnter()
		log.info("@@进入个人挑战")

		nationChallenges.ui.isVisible = true

		eventManager.registerEvent("nationChallengesChanged", nationChallenges.ui.updateChanged)
		eventManager.registerEvent("nationTaskDidChanged", nationChallenges.ui.nationTaskChanged)
		eventManager.registerEvent("worldRewardDidReceived", nationChallenges.ui.worldRewardDidChanged)
	end

	function var_19_0.onExit()
		log.info("@@退出个人挑战")

		nationChallenges.ui.isVisible = false

		eventManager.dispatchEvent("hourRankSetVisible", true)
		eventManager.unregisterEvent("nationChallengesChanged", nationChallenges.ui.updateChanged)
		eventManager.unregisterEvent("nationTaskDidChanged", nationChallenges.ui.nationTaskChanged)
		eventManager.unregisterEvent("worldRewardDidReceived", nationChallenges.ui.worldRewardDidChanged)
	end

	cmgr.sendRequest(nationChallenges.ui.getCurrentRankInfo, actions.getCurRankInfo, 1)

	return var_19_0
end
