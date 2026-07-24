tool.requireRes("rankInfo/twoRankInfo")

twoRankInfoUI = {}
twoRankInfoUI.uiTable = {}

local var_0_0 = twoRankInfoUI
local var_0_1 = twoRankInfoControl
local var_0_2 = twoRankInfoConstant

function twoRankInfoUI.show(arg_1_0)
	local var_1_0 = createBaseLayer()

	smgr.registerLayer(var_1_0, "twoRankInfoLayer")

	if var_0_0.uiTable then
		var_0_0.uiTable = nil
	end

	var_0_0.uiTable = autoUI.initUI(var_1_0, getTwoRankInfoData())

	var_1_0:setTouchEnabled(true)

	var_0_0.rankType = arg_1_0

	var_0_1.getTwoRankInfo(arg_1_0, true)

	var_1_0.onEnter = var_0_1.onEnter
	var_1_0.onExit = var_0_1.onExit

	return var_1_0
end

function var_0_0.updateRankInfoLayer(arg_2_0)
	local var_2_0
	local var_2_1

	if var_0_0.rankType == 1 then
		var_2_1 = var_0_2.challengeTitleTable
	else
		var_2_1 = var_0_2.stormTitleTable
	end

	if arg_2_0.title > #var_2_1 then
		arg_2_0.title = #var_2_1
	end

	local var_2_2 = string.format("res/ui/rankInfo/twoRankInfo/titles/%s.png", var_2_1[arg_2_0.title])
	local var_2_3 = CCSprite:create(var_2_2)

	var_0_0.uiTable.rankTitlePic:setDisplayFrame(var_2_3:displayFrame())

	local var_2_4 = 0
	local var_2_5 = language.get(113003, arg_2_0.nextNum)

	if var_0_0.rankType == 2 then
		var_2_5 = language.get(113004, arg_2_0.nextNum)

		var_0_0.uiTable.rankRewardTitle:setPosition(ccp(185, 485))
		var_0_0.uiTable.rankRewardTitle:setDimensions(CCSizeMake(220, 40))
		var_0_0.uiTable.rankRewardTitle:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_0_0.uiTable.rankRewardTitle:setHorizontalAlignment(kCCTextAlignmentRight)
		var_0_0.uiTable.getRewardButton:setPosition(ccp(65, 330))
		var_0_0.uiTable.getRewardButtonLabel:setPosition(ccp(228, 385))
		var_0_0.uiTable.zhancheng:setVisible(true)
		var_0_0.uiTable.generalHead1:setVisible(true)
		var_0_0.uiTable.generalHead2:setVisible(true)
		var_0_0.uiTable.generalHead3:setVisible(true)
		var_0_0.setGeneralTownInfo(arg_2_0.gInfos)
	else
		var_0_0.uiTable.rankRewardTitle:setPosition(ccp(165, 308))
		var_0_0.uiTable.rankRewardTitle:setDimensions(CCSizeMake(220, 40))
		var_0_0.uiTable.rankRewardTitle:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_0_0.uiTable.rankRewardTitle:setHorizontalAlignment(kCCTextAlignmentCenter)
		var_0_0.uiTable.getRewardButton:setPosition(ccp(0, 0))
		var_0_0.uiTable.getRewardButtonLabel:setPosition(ccp(163, 55))
		var_0_0.uiTable.zhancheng:setVisible(false)
		var_0_0.uiTable.generalHead1:setVisible(false)
		var_0_0.uiTable.generalHead2:setVisible(false)
		var_0_0.uiTable.generalHead3:setVisible(false)
	end

	var_0_0.uiTable.rankRewardTitle:setString(var_2_5)

	if arg_2_0.nextNum == 0 then
		var_2_4 = 100

		var_0_0.uiTable.rankRewardTitle:setString(language.get(113008))
		var_0_0.uiTable.amountValueLabel:setString(arg_2_0.value)
		var_0_0.uiTable.reachValueTitle:setVisible(false)
		var_0_0.uiTable.rankRewardNumber:setVisible(false)
		var_0_0.uiTable.allRewardReceivedLabel:setVisible(true)
		var_0_0.uiTable.getRewardButton:setEnabled(false)
		var_0_0.uiTable.getRewardButtonLabel:setVisible(false)
		var_0_0.uiTable.getRewardButton:setVisible(false)
		var_0_0.uiTable.rewardIcon:setDisplayFrame(CCSprite:create("res/ui/rankInfo/twoRankInfo/rank_top_icon.png"):displayFrame())

		if var_0_0.rankType == 1 then
			user.welfare.setWelfare("challengeReward", true)
			var_0_0.uiTable.rewardIcon:setVisible(true)
			var_0_0.uiTable.rewardSplitPic2:setVisible(false)
		else
			user.welfare.setWelfare("stormReward", true)
			var_0_0.uiTable.rewardIcon:setVisible(false)
			var_0_0.uiTable.rewardSplitPic2:setVisible(true)
			var_0_0.uiTable.allRewardReceivedLabel:setVisible(false)
			var_0_0.uiTable.rankRewardTitle:setString(language.get(113015))
		end
	else
		var_2_4 = arg_2_0.value / arg_2_0.nextNum * 100

		var_0_0.uiTable.amountValueLabel:setString(string.format("%s/%s", arg_2_0.value, arg_2_0.nextNum))
		var_0_0.uiTable.reachValueTitle:setVisible(true)

		local var_2_6 = language.get(113012, arg_2_0.value)

		if var_0_0.rankType == 2 then
			var_2_6 = language.get(113013, arg_2_0.value)
		end

		if arg_2_0.full and arg_2_0.full == true and arg_2_0.nextLv then
			var_2_6 = language.get(113011, arg_2_0.nextLv)

			var_0_0.uiTable.reachValueTitle:setColor(colorTips.red)
		else
			var_0_0.uiTable.reachValueTitle:setColor(ccc3(235, 209, 167))
		end

		var_0_0.uiTable.reachValueTitle:setString(var_2_6)

		if var_0_0.rankType == 2 then
			var_0_0.uiTable.rankRewardNumber:setString(language.get(113014, arg_2_0.reward))
			var_0_0.uiTable.rankRewardNumber:setAnchorPoint(ccp(1, 0.5))
			var_0_0.uiTable.rankRewardNumber:setScale(0.72)
			var_0_0.uiTable.rankRewardNumber:setPosition(ccp(289, 440))
			var_0_0.uiTable.rankRewardNumber:setColor(colorText[10002])
			var_0_0.uiTable.rewardSplitPic2:setVisible(true)
			var_0_0.uiTable.rewardIcon:setVisible(false)
		else
			var_0_0.uiTable.rankRewardNumber:setString(arg_2_0.reward)
			var_0_0.uiTable.rankRewardNumber:setAnchorPoint(ccp(0.5, 0.5))
			var_0_0.uiTable.rankRewardNumber:setScale(1)
			var_0_0.uiTable.rankRewardNumber:setPosition(ccp(165, 138))
			var_0_0.uiTable.rankRewardNumber:setColor(ccc3(255, 255, 255))
			var_0_0.uiTable.rewardSplitPic2:setVisible(false)
			var_0_0.uiTable.rewardIcon:setVisible(true)
		end

		var_0_0.uiTable.rankRewardNumber:setVisible(true)
		var_0_0.uiTable.allRewardReceivedLabel:setVisible(false)
		var_0_0.uiTable.getRewardButtonLabel:setVisible(true)
		var_0_0.uiTable.getRewardButton:setVisible(true)

		if arg_2_0.boxNum and arg_2_0.boxNum ~= 0 then
			if var_0_0.rankType == 1 then
				user.welfare.setWelfare("challengeReward", true)
			else
				user.welfare.setWelfare("stormReward", true)
			end

			var_0_0.uiTable.getRewardButton:setEnabled(true)
			var_0_0.uiTable.rewardIcon:setDisplayFrame(CCSprite:create("res/ui/rankInfo/twoRankInfo/exp_reward_icon.jpg"):displayFrame())
		else
			if var_0_0.rankType == 1 then
				user.welfare.setWelfare("challengeReward", false)
			else
				user.welfare.setWelfare("stormReward", false)
			end

			var_0_0.uiTable.rewardIcon:setDisplayFrame(CCSprite:create("res/ui/rankInfo/twoRankInfo/exp_reward_icon.jpg"):displayFrame())
			tool.spriteToGray(var_0_0.uiTable.rewardIcon)
			var_0_0.uiTable.getRewardButton:setEnabled(false)
		end
	end

	var_0_0.uiTable.amountProgressBar:setPercentage(var_2_4)
end

function var_0_0.updateRankListLayer(arg_3_0)
	log.info("rank list :", arg_3_0)

	if var_0_0.rankListTableView then
		pcall(var_0_0.rankListTableView.removeFromParentAndCleanup, var_0_0.rankListTableView, true)
	end

	var_0_0.rankListTableView = var_0_0.createRankListTableView(arg_3_0)

	if var_0_0.rankType == 2 then
		var_0_0.uiTable.playerListBackground2:setVisible(true)
		var_0_0.uiTable.playerListBackground:setVisible(false)
		var_0_0.uiTable.playerListBackground2:addChild(var_0_0.rankListTableView, 10, 101)
	else
		var_0_0.uiTable.playerListBackground:setVisible(true)
		var_0_0.uiTable.playerListBackground2:setVisible(false)
		var_0_0.uiTable.playerListBackground:addChild(var_0_0.rankListTableView, 10, 101)
	end

	var_0_0.rankListTableView:setPosition(3, 4)
end

function var_0_0.createRankListTableView(arg_4_0)
	local var_4_0 = CCTableView:create(CCSizeMake(557, 283))

	var_4_0:setDirection(kCCScrollViewDirectionVertical)
	var_4_0:setVerticalFillOrder(kCCTableViewFillTopDown)

	local function var_4_1(arg_5_0, arg_5_1)
		return
	end

	local function var_4_2(arg_6_0, arg_6_1)
		return
	end

	local function var_4_3(arg_7_0, arg_7_1)
		return
	end

	local function var_4_4(arg_8_0, arg_8_1)
		return 39, 557
	end

	local function var_4_5(arg_9_0, arg_9_1)
		local var_9_0 = arg_4_0[arg_9_1 + 1]
		local var_9_1 = arg_9_0:dequeueCell()

		if var_9_1 then
			var_9_1:removeAllChildrenWithCleanup(true)
		else
			var_9_1 = CCTableViewCell:new()
		end

		local var_9_2 = CCSprite:create(string.format("res/ui/rankInfo/twoRankInfo/rank_list_bg_%s.jpg", arg_9_1 % 2))

		var_9_2:setAnchorPoint(CCPointMake(0, 0))
		var_9_2:setPosition(CCPointMake(0, 0))

		local var_9_3

		if var_0_0.rankType == 1 then
			local var_9_4 = autoUI.createUI(var_9_2, getRankListInfoCellData(var_9_0), nil)
		else
			local var_9_5 = autoUI.createUI(var_9_2, getRankListInfoCellData2(var_9_0), nil)
		end

		var_9_1:addChild(var_9_2)

		return var_9_1
	end

	local function var_4_6()
		if arg_4_0 then
			return #arg_4_0
		else
			return 0
		end
	end

	var_4_0:registerScriptHandler(var_4_1, CCTableView.kTableCellHighLight)
	var_4_0:registerScriptHandler(var_4_2, CCTableView.kTableCellUnhighLight)
	var_4_0:registerScriptHandler(var_4_3, CCTableView.kTableCellTouched)
	var_4_0:registerScriptHandler(var_4_4, CCTableView.kTableCellSizeForIndex)
	var_4_0:registerScriptHandler(var_4_5, CCTableView.kTableCellSizeAtIndex)
	var_4_0:registerScriptHandler(var_4_6, CCTableView.kNumberOfCellsInTableView)
	var_4_0:reloadData()

	return var_4_0
end

function var_0_0.getRankReward()
	var_0_1.getRankReward(var_0_0.rankType)
end

function var_0_0.setGeneralTownInfo(arg_12_0)
	local function var_12_0(arg_13_0)
		if arg_13_0 == 1 then
			return ccc3(255, 255, 255)
		elseif arg_13_0 == 2 then
			return ccc3(0, 0, 255)
		elseif arg_13_0 == 3 then
			return ccc3(0, 255, 0)
		elseif arg_13_0 == 4 then
			return ccc3(255, 255, 0)
		elseif arg_13_0 == 5 then
			return ccc3(255, 0, 0)
		else
			return ccc3(255, 0, 255)
		end
	end

	for iter_12_0 = 1, 3 do
		if arg_12_0[iter_12_0] then
			local var_12_1 = CCSprite:create("res/ui/common/generalPic/generalPic_" .. arg_12_0[iter_12_0].pic .. ".jpg")

			var_0_0.uiTable["head" .. iter_12_0]:setDisplayFrame(var_12_1:displayFrame())

			local var_12_2 = CCSprite:create("res/ui/common/quailtyFrames/quality_frame_" .. arg_12_0[iter_12_0].quality .. ".png")

			var_0_0.uiTable["generalHead" .. iter_12_0]:setDisplayFrame(var_12_2:displayFrame())
			var_0_0.uiTable["zhanCheng" .. iter_12_0]:setString(language.get(113018, arg_12_0[iter_12_0].value))
			var_0_0.uiTable["generalName" .. iter_12_0]:setString(arg_12_0[iter_12_0].generalName)
			var_0_0.uiTable["generalName" .. iter_12_0]:setColor(var_12_0(arg_12_0[iter_12_0].quality))
		end
	end

	return arg_12_0
end
