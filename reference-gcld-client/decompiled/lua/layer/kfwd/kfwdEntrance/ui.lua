require("lua/component/labelPage")
tool.requireRes("kfwd/kfwdEntrance")

kfwdEntranceUI = {}
kfwdEntranceUI.uiTable = {}

local var_0_0 = kfwdEntranceUI
local var_0_1 = kfwdEntranceControl

function var_0_0.show()
	local var_1_0 = createBaseLayer()

	smgr.registerLayer(var_1_0, "kfwdEntranceLayer")

	if var_0_0.uiTable then
		var_0_0.uiTable = nil
	end

	var_0_0.uiTable = autoUI.initUI(var_1_0, getKfwdEntranceDetailData())

	var_1_0:registerScriptTouchHandler(var_0_0.onTouch, false, false)
	var_1_0:setTouchEnabled(true)

	var_1_0.onEnter = var_0_1.onEnter
	var_1_0.onExit = var_0_1.onExit

	var_0_1.getKfwdEntranceInfo()

	for iter_1_0 = 1, 6 do
		var_0_0.uiTable["itemFlag" .. iter_1_0]:setVisible(false)
	end

	return var_1_0
end

function var_0_0.updateEntrancePanel(arg_2_0)
	local var_2_0 = arg_2_0.signInfo
	local var_2_1 = arg_2_0.tList

	var_0_1.treasureCnt = #var_2_1

	local var_2_2 = arg_2_0.kfwdbaseInfo
	local var_2_3 = arg_2_0.levelLimit

	var_0_0.uiTable.signButton:setVisible(false)
	var_0_0.uiTable.enterButton:setVisible(false)
	var_0_0.uiTable.getRewardButton:setVisible(false)
	var_0_0.uiTable.knownButton:setVisible(false)
	var_0_0.uiTable.buttonTextLabel:setVisible(false)
	var_0_0.uiTable.signLimitLabel:setVisible(false)
	var_0_0.uiTable.signOverPic:setVisible(false)

	local var_2_4 = false

	if var_2_0.signed then
		var_0_0.uiTable.kfwdEntranceTitlePic:setDisplayFrame(CCSprite:create("res/ui/kfwd/xflts_tit_cgbm.png"):displayFrame())

		if var_2_2.kfwdState == 20 then
			var_0_0.uiTable.timerMsgLabel:setVisible(true)

			var_2_4 = true
		elseif var_2_2.kfwdState == 30 then
			var_0_0.uiTable.timerMsgLabel:setVisible(true)

			var_2_4 = true
		elseif var_2_2.kfwdState == 50 then
			var_0_0.uiTable.kfwdEntranceTitlePic:setDisplayFrame(CCSprite:create("res/ui/kfwd/xflts_tit_beg.png"):displayFrame())
			var_0_0.uiTable.enterButton:setVisible(true)
			var_0_0.uiTable.buttonTextLabel:setVisible(true)
			var_0_0.uiTable.buttonTextLabel:setString(language.get(390004))

			if arg_2_0.getTreasure == 0 and arg_2_0.treasureId then
				var_0_0.uiTable.kfwdEntranceTitlePic:setDisplayFrame(CCSprite:create("res/ui/kfwd/xflts_tit.png"):displayFrame())

				var_0_1.treasureId = arg_2_0.treasureId

				var_0_0.uiTable.enterButton:setVisible(false)
				var_0_0.uiTable.getRewardButton:setVisible(true)
				var_0_0.uiTable.buttonTextLabel:setVisible(true)
				var_0_0.uiTable.buttonTextLabel:setString(language.get(390005))
			end
		elseif var_2_2.kfwdState == 60 then
			var_0_0.uiTable.kfwdEntranceTitlePic:setDisplayFrame(CCSprite:create("res/ui/kfwd/xflts_tit.png"):displayFrame())
			var_0_0.uiTable.enterButton:setVisible(true)
			var_0_0.uiTable.buttonTextLabel:setVisible(true)
			var_0_0.uiTable.buttonTextLabel:setString(language.get(390004))

			if arg_2_0.getTreasure == 0 and arg_2_0.treasureId then
				var_0_0.uiTable.kfwdEntranceTitlePic:setDisplayFrame(CCSprite:create("res/ui/kfwd/xflts_tit.png"):displayFrame())

				var_0_1.treasureId = arg_2_0.treasureId

				var_0_0.uiTable.enterButton:setVisible(false)
				var_0_0.uiTable.getRewardButton:setVisible(true)
				var_0_0.uiTable.buttonTextLabel:setVisible(true)
				var_0_0.uiTable.buttonTextLabel:setString(language.get(390005))
			end
		end
	else
		var_0_0.uiTable.kfwdEntranceTitlePic:setDisplayFrame(CCSprite:create("res/ui/kfwd/xflts_tit.png"):displayFrame())

		if var_2_2.kfwdState == 20 then
			var_0_0.uiTable.signButton:setVisible(true)
			var_0_0.uiTable.signLimitLabel:setVisible(true)
			var_0_0.uiTable.signLimitLabel:setString(language.get(390006, var_2_3))
			var_0_0.uiTable.buttonTextLabel:setVisible(true)
			var_0_0.uiTable.buttonTextLabel:setString(language.get(390007))

			var_2_4 = true
		elseif var_2_2.kfwdState == 30 then
			var_0_0.uiTable.knownButton:setVisible(true)
			var_0_0.uiTable.buttonTextLabel:setVisible(true)
			var_0_0.uiTable.buttonTextLabel:setString(language.get(390008))
			var_0_0.uiTable.signOverPic:setVisible(true)
			log.info("signOverPic set to visible")
		elseif var_2_2.kfwdState == 50 then
			var_0_0.uiTable.knownButton:setVisible(true)
			var_0_0.uiTable.buttonTextLabel:setVisible(true)
			var_0_0.uiTable.buttonTextLabel:setString(language.get(390008))
			var_0_0.uiTable.signOverPic:setVisible(true)
		elseif var_2_2.kfwdState == 60 then
			var_0_0.uiTable.knownButton:setVisible(true)
			var_0_0.uiTable.buttonTextLabel:setVisible(true)
			var_0_0.uiTable.buttonTextLabel:setString(language.get(390008))
			var_0_0.uiTable.signOverPic:setVisible(true)
		end
	end

	if var_0_0.timer then
		pcall(var_0_0.timer.removeFromParentAndCleanup, var_0_0.timer, true)
	end

	if var_2_4 and var_2_2.nextStateCD then
		var_0_0.uiTable.signOverPic:setVisible(false)

		local var_2_5 = createTimerLabel(var_2_2.nextStateCD, "@H:@M:@S", "Thonburi", 26, var_0_1.getKfwdEntranceInfo, nil, nil, colorTips.red)

		var_0_0.uiTable.kfwdEntranceBackground:addChild(var_2_5)

		local var_2_6 = var_0_0.uiTable.kfwdEntranceBackground:getContentSize()

		var_2_5:setPosition(ccp(var_2_6.width / 2 + 180, 70))

		var_0_0.timer = var_2_5
	end

	for iter_2_0 = 1, var_0_1.treasureCnt do
		local var_2_7 = var_2_1[iter_2_0]

		if var_2_7 then
			log.info("should update reward label text")
			var_0_0.uiTable["rewardTitleLabel" .. iter_2_0]:setString(language.get(390002, var_2_7.minRank, var_2_7.maxRank))
			var_0_0.uiTable["itemPic" .. iter_2_0]:setDisplayFrame(tool.spriteByName(var_2_7.treasurePic .. ".jpg"):displayFrame())
			var_0_0.uiTable["itemPic" .. iter_2_0]:setVisible(true)

			kfwdEntranceConstant.rewardItemTipName[iter_2_0] = var_2_7.treasureName
		end
	end

	for iter_2_1 = 1, var_0_1.treasureCnt do
		var_0_0.uiTable["rewardFrame" .. iter_2_1]:setVisible(true)

		if string.find(var_2_1[iter_2_1].treasurePic, "ymzsp") ~= nil then
			var_0_0.uiTable["itemFlag" .. iter_2_1]:setVisible(true)
		end
	end
end

function var_0_0.onTouch(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_0 == CCTOUCHBEGAN then
		for iter_3_0 = 1, var_0_1.treasureCnt do
			if var_0_0.uiTable["rewardFrame" .. iter_3_0] and tool.checkIfTouch(var_0_0.uiTable["rewardFrame" .. iter_3_0], arg_3_1, arg_3_2) then
				local var_3_0 = kfwdEntranceConstant.rewardItemTipName[iter_3_0]

				var_0_0.uiTable.tipTextLabel:setString(var_3_0)

				local var_3_1 = var_0_0.uiTable.tipTextLabel:getContentSize().width
				local var_3_2 = var_0_0.uiTable.tipTextLabel:getContentSize().height

				var_0_0.uiTable.itemTipsFrame:setPreferredSize(CCSizeMake(var_3_1 + 20, var_3_2 + 20))
				var_0_0.uiTable.itemTipsFrame:setVisible(true)

				local var_3_3, var_3_4 = var_0_0.uiTable["rewardFrame" .. iter_3_0]:getPosition()

				if iter_3_0 <= 3 then
					var_0_0.uiTable.itemTipsFrame:setPosition(ccp(var_3_3, var_3_4 + 90))
				else
					var_0_0.uiTable.itemTipsFrame:setPosition(ccp(var_3_3, var_3_4 + 60))
				end
			end
		end

		return true
	elseif arg_3_0 == CCTOUCHENDED then
		if var_0_0.uiTable.itemTipsFrame then
			var_0_0.uiTable.itemTipsFrame:setVisible(false)
		end

		return true
	end
end

function var_0_0.signButtonDidTouched()
	var_0_1.kfwdSignUp()
end

function var_0_0.knownButtonDidTouched()
	user.inkfwd = 0

	kfwdUI.click_close_item()
	eventManager.unregisterEvent("kfwdStateDidChanged", var_0_1.getKfwdEntranceInfo)
	eventManager.dispatchEvent("kfwdStateDidChanged")
end

function var_0_0.enterButtonDidTouched()
	log.info("@@ 进入跨服武斗")
	require("lua/manager/kfConnectManager")
	kfcmgr.loginkfwd(var_0_1.signInfo)
end

function var_0_0.getRewardButtonDidTouched()
	log.info("should get reward")
	var_0_1.kfwdGetReward()
end

function var_0_0.showKfwdTipsView()
	local var_8_0 = {}

	if conf.language == "kr" and platform.getFlag() == "MOBILE_ANDROID" then
		var_8_0.tipsFrameY = 130
	elseif conf.language == "vie" and platform.getFlag() == "MOBILE_ANDROID" then
		var_8_0.tipsFrameY = 130
	else
		var_8_0.tipsFrameY = 0
	end

	local var_8_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_8_1:registerScriptTouchHandler(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == CCTOUCHBEGAN then
			return true
		elseif arg_9_0 == CCTOUCHMOVED then
			return true
		elseif arg_9_0 == CCTOUCHENDED then
			var_8_1:removeFromParentAndCleanup(true)

			return true
		end
	end, false, true)
	var_8_1:setTouchEnabled(true)
	autoUI.createUI(var_8_1, getKfwdEntranceTipsUiData(), var_0_0.uiTable)
	smgr.rootLayer:addChild(var_8_1, 60000)

	local var_8_2, var_8_3 = tool.getPositionInScreen(var_0_0.uiTable.kfwdTipsButton)

	var_0_0.uiTable.kfwdTipsFrame:setPosition(ccp(var_8_2 - 30, var_8_3 - 30 + var_8_0.tipsFrameY))
end
