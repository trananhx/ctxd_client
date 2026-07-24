local var_0_0 = 1
local var_0_1 = false
local var_0_2 = false
local var_0_3 = class("downloadDetailView", function()
	return CCLayer:create()
end)

function var_0_3.ctor(arg_2_0, ...)
	arg_2_0.uidata = require("lua/layer/downloadViewer/downloadDetailView/uidata").new()
	arg_2_0.control = require("lua/layer/downloadViewer/downloadDetailView/control").new(arg_2_0)
	arg_2_0.constant = {}
	arg_2_0.constant.progressStates = {
		installing = 5,
		downloading = 2,
		installCompleted = 6,
		downloadCompleted = 4,
		downloadStopped = 3,
		no = 1
	}
	arg_2_0.constant.stateToText = {
		language.get("620001_TJXS"),
		language.get("620002_TJXS"),
		language.get("620003_TJXS"),
		language.get("620004_TJXS"),
		language.get("620005_TJXS"),
		language.get("620006_TJXS")
	}
	arg_2_0.previewPages = {
		"res/ui/downloadViewer/page_1.jpg",
		"res/ui/downloadViewer/page_2.jpg",
		"res/ui/downloadViewer/page_3.jpg",
		"res/ui/downloadViewer/page_4.jpg",
		"res/ui/downloadViewer/page_5.jpg",
		"res/ui/downloadViewer/page_6.jpg"
	}

	arg_2_0:registerScriptHandler(function(arg_3_0)
		if arg_3_0 == "enter" then
			arg_2_0:onEnter()
		elseif arg_3_0 == "exit" then
			arg_2_0:onExit()
		end
	end)
	swallowTouch(arg_2_0)
	arg_2_0:init()
end

function var_0_3.init(arg_4_0)
	arg_4_0.uiTable = autoUI.initUI(arg_4_0, arg_4_0.uidata:getData())

	arg_4_0.uiTable.closeButton:registerScriptTapHandler(handler(arg_4_0, arg_4_0.close))
	arg_4_0.uiTable.closeButton:setScale(2)
	arg_4_0.uiTable.zs_right:setFlipX(true)

	local var_4_0 = updateManager.getState()

	log.info("the status is ", var_4_0)

	if var_4_0 == 1 or var_4_0 == 3 then
		local var_4_1 = updateManager.getDownloadPercent()

		arg_4_0:updatePercentage(var_4_1)

		if var_4_1 == 0 then
			arg_4_0:setCurrentState(arg_4_0.constant.progressStates.no)
		else
			arg_4_0:setCurrentState(arg_4_0.constant.progressStates.downloadStopped)
		end
	elseif var_4_0 == 2 then
		local var_4_2 = updateManager.getDownloadPercent()

		arg_4_0:updatePercentage(var_4_2)

		if var_4_2 == 0 then
			arg_4_0:setCurrentState(arg_4_0.constant.progressStates.no)
		else
			arg_4_0:setCurrentState(arg_4_0.constant.progressStates.downloading)
		end
	elseif var_4_0 == 4 then
		arg_4_0:updatePercentage(100)
		arg_4_0:setCurrentState(arg_4_0.constant.progressStates.downloadCompleted)
	elseif var_4_0 == 5 then
		arg_4_0:setCurrentState(arg_4_0.constant.progressStates.installing)
	elseif var_4_0 == 6 then
		arg_4_0:setCurrentState(arg_4_0.constant.progressStates.installCompleted)
	end

	if CCUserDefault:sharedUserDefault():getIntegerForKey("inComplete") == 1 and CCUserDefault:sharedUserDefault():getIntegerForKey("packageStatus") == 1 then
		arg_4_0:setCurrentState(arg_4_0.constant.progressStates.installCompleted)
	end

	log.info("111 ", arg_4_0.progressState)
	log.info("222 ", arg_4_0.constant.stateToText[arg_4_0.progressState])
	arg_4_0:updatePanel()
	arg_4_0.uiTable.actionButtonLabel:setString(arg_4_0.constant.stateToText[arg_4_0.progressState])
	arg_4_0.uiTable.actionButton:registerScriptTapHandler(handler(arg_4_0, arg_4_0.actionButtonTapHandler))

	local var_4_3 = CCControlButton:create(CCScale9Sprite:create("res/ui/rankInfo/DailyFeatView/gxb_pb_bx.png"))

	var_4_3:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/rankInfo/DailyFeatView/gxb_pb_bx.png"), CCControlStateHighlighted)
	var_4_3:setAdjustBackgroundImage(false)
	var_4_3:setPosition(ccp(850, 35))
	var_4_3:setZoomOnTouchDown(true)
	arg_4_0.uiTable.background_2:addChild(var_4_3)

	arg_4_0.uiTable.rewardButton = var_4_3

	arg_4_0.uiTable.rewardButton:addHandleOfControlEvent(handler(arg_4_0, arg_4_0.rewardButtonTouchDown), CCControlEventTouchDown)
	arg_4_0.uiTable.rewardButton:addHandleOfControlEvent(handler(arg_4_0, arg_4_0.rewardButtonTouchUpInside), CCControlEventTouchUpInside)
	arg_4_0.uiTable.rewardButton:addHandleOfControlEvent(handler(arg_4_0, arg_4_0.rewardButtonTouchUpOutside), CCControlEventTouchUpOutside)

	if not tolua.isnull(arg_4_0.pageView) then
		arg_4_0.pageView:removeFromParentAndCleanup(true)
	end

	arg_4_0.pageView = arg_4_0:createPageView()

	arg_4_0.pageView:setPosition(ccp(5, 5))
	arg_4_0.uiTable.tableViewBackground:addChild(arg_4_0.pageView)
	arg_4_0.uiTable.hand:setVisible(false)
	performWithDelay(arg_4_0, function()
		arg_4_0:showTaskGuide()
	end, 0.5)
end

function var_0_3.createPageView(arg_6_0)
	for iter_6_0 = 1, 6 do
		local var_6_0 = iter_6_0 == 1 and "dot_full.png" or "dot_empty.png"
		local var_6_1 = CCSprite:create("res/ui/downloadViewer/" .. var_6_0)

		var_6_1:setPosition(ccp(383 + 30 * (iter_6_0 - 1), 130))
		arg_6_0.uiTable.background_2:addChild(var_6_1)

		arg_6_0.uiTable["dot" .. iter_6_0] = var_6_1
	end

	local var_6_2 = require("lua/component/UIPageView").new({
		row = 1,
		height = 302,
		width = 880,
		column = 1
	})

	for iter_6_1 = 1, 6 do
		local var_6_3 = var_6_2:newItem()
		local var_6_4 = CCSprite:create(arg_6_0.previewPages[iter_6_1])

		var_6_4:setAnchorPoint(ccp(0, 0))
		var_6_3:addChild(var_6_4)
		var_6_2:addItem(var_6_3)
	end

	var_6_2:reload()
	var_6_2:onTouch(function(arg_7_0)
		showTable(arg_7_0)

		if arg_7_0.name == "pageChange" and var_0_0 ~= arg_7_0.pageIdx then
			arg_6_0.uiTable["dot" .. var_0_0]:setDisplayFrame(CCSprite:create("res/ui/downloadViewer/dot_empty.png"):displayFrame())

			var_0_0 = arg_7_0.pageIdx

			arg_6_0.uiTable["dot" .. var_0_0]:setDisplayFrame(CCSprite:create("res/ui/downloadViewer/dot_full.png"):displayFrame())

			var_0_1 = true

			arg_6_0.uiTable.hand:stopAllActions()
			arg_6_0.uiTable.hand:setVisible(not var_0_1)
		end
	end)

	var_0_0 = 1

	return var_6_2
end

function var_0_3.showRewardTips(arg_8_0, arg_8_1)
	arg_8_0.tipsAdded = false

	log.info("showRewardTips :", user.installFullPackRewards)
	showTable(user.installFullPackRewards)
	arg_8_0.uiTable.rewardTipsBackground:setVisible(arg_8_1)

	if #user.installFullPackRewards == 0 then
		arg_8_0.uiTable.rewardTipsBackground:setVisible(false)
	elseif not arg_8_0.tipsAdded then
		arg_8_0.tipsAdded = true

		arg_8_0.uiTable.rewardTipsNode:removeAllChildrenWithCleanup(true)
		log.info("100*#user.installFullPackRewards:", 100 * #user.installFullPackRewards)
		arg_8_0.uiTable.rewardTipsBackground:setPreferredSize(CCSizeMake(20 + 100 * #user.installFullPackRewards, 120))

		local var_8_0, var_8_1 = arg_8_0.uiTable.rewardButton:getPosition()

		arg_8_0.uiTable.rewardTipsBackground:setPosition(ccp(var_8_0 + 35, var_8_1 + 40))

		local var_8_2 = 60
		local var_8_3 = 70
		local var_8_4 = {
			[42] = 5
		}
		local var_8_5 = {
			language.get(10101),
			language.get(10102),
			language.get(10103),
			[42] = language.get(10105),
			[40] = language.get(10109)
		}

		for iter_8_0, iter_8_1 in pairs(user.installFullPackRewards) do
			local var_8_6 = CCSprite:create()
			local var_8_7 = "res_icon_" .. (var_8_4[iter_8_1.type] or iter_8_1.type) .. ".png"
			local var_8_8 = CCSprite:createWithSpriteFrameName(var_8_7)

			var_8_8:setPosition(ccp(var_8_6:getContentSize().width / 2, var_8_6:getContentSize().height / 2))
			var_8_6:addChild(var_8_8, 1)

			local var_8_9 = CCStrokeLabelTTF:create(var_8_5[iter_8_1.type], "", 20, 1)
			local var_8_10 = CCStrokeLabelTTF:create(iter_8_1.value, "", 20, 1)

			var_8_6:addChild(var_8_9, 2)
			var_8_9:setPosition(ccp(var_8_6:getContentSize().width / 2, var_8_6:getContentSize().height / 2 - 25))
			var_8_9:setColor(colorText.TJ_Yellow)
			var_8_6:addChild(var_8_10, 2)
			var_8_10:setPosition(ccp(var_8_6:getContentSize().width / 2, var_8_6:getContentSize().height / 2 - 53))
			var_8_6:setPosition(ccp(var_8_2, var_8_3))

			var_8_2 = var_8_2 + 100

			arg_8_0.uiTable.rewardTipsNode:addChild(var_8_6)
		end
	end
end

function var_0_3.rewardButtonTouchDown(arg_9_0)
	if user.hasHotSwapGift == 1 then
		arg_9_0:showRewardTips(true)
	end
end

function var_0_3.rewardButtonTouchUpInside(arg_10_0)
	arg_10_0:stopAllActions()
	performWithDelay(arg_10_0, function()
		arg_10_0:showRewardTips(false)
	end, 1)
end

function var_0_3.rewardButtonTouchUpOutside(arg_12_0)
	arg_12_0:stopAllActions()
	performWithDelay(arg_12_0, function()
		arg_12_0:showRewardTips(false)
	end, 1)
end

function var_0_3.updatePanel(arg_14_0)
	local var_14_0 = false

	if arg_14_0.progressState == arg_14_0.constant.progressStates.no then
		var_14_0 = true
	end

	local var_14_1 = {
		[arg_14_0.constant.progressStates.no] = true,
		[arg_14_0.constant.progressStates.downloadStopped] = true,
		[arg_14_0.constant.progressStates.downloadCompleted] = true
	}

	arg_14_0.uiTable.rewardsTipsLabel:setVisible(true)
	arg_14_0.uiTable.downloadTipPic:setVisible(var_14_0)
	arg_14_0.uiTable.progressBarBackground:setVisible(not var_14_0)
	arg_14_0.uiTable.actionButton:setEnabled(var_14_1[arg_14_0.progressState] or false)

	local var_14_2 = user.hasHotSwapGift == 1

	arg_14_0.uiTable.rewardsTipsLabel:setString(language.get(var_14_2 and "620009_TJXS" or "620010_TJXS"))

	if arg_14_0.progressState == arg_14_0.constant.progressStates.installCompleted and var_14_2 then
		arg_14_0:showRewardBox()
	end
end

function var_0_3.actionButtonTapHandler(arg_15_0)
	if arg_15_0.progressState == arg_15_0.constant.progressStates.no then
		arg_15_0:setCurrentState(arg_15_0.constant.progressStates.downloading)

		local var_15_0 = CCSprite:create("res/ui/downloadViewer/ksxz.png")

		smgr.showTipFloatYSprite(var_15_0, 60, ccp(visibleSize.width / 2, visibleSize.height / 2 - 150), nil, 1, 2)
		updateManager.start()

		if not var_0_2 then
			performWithDelay(arg_15_0, function()
				arg_15_0:showTaskGuide()
			end, 0.5)
		end
	elseif arg_15_0.progressState == arg_15_0.constant.progressStates.downloading then
		-- block empty
	elseif arg_15_0.progressState == arg_15_0.constant.progressStates.downloadStopped then
		arg_15_0:setCurrentState(arg_15_0.constant.progressStates.downloading)

		local var_15_1 = CCSprite:create("res/ui/downloadViewer/ksxz.png")

		smgr.showTipFloatYSprite(var_15_1, 60, ccp(visibleSize.width / 2, visibleSize.height / 2 - 150), nil, 1, 2)
		updateManager.start()

		if not var_0_2 then
			performWithDelay(arg_15_0, function()
				arg_15_0:showTaskGuide()
			end, 0.5)
		end
	elseif arg_15_0.progressState == arg_15_0.constant.progressStates.downloadCompleted then
		arg_15_0:setCurrentState(arg_15_0.constant.progressStates.installing)
		updateManager.startInstall()
		arg_15_0:updatePercentage(0)
	elseif arg_15_0.progressState == arg_15_0.constant.progressStates.installCompleted then
		-- block empty
	end

	arg_15_0:updatePanel()
	arg_15_0.uiTable.actionButtonLabel:setString(arg_15_0.constant.stateToText[arg_15_0.progressState])
	guide.ui.setVisible(false)
end

function var_0_3.close(arg_18_0)
	arg_18_0:removeFromParentAndCleanup(true)

	if notice and notice.ui then
		notice.control.refreshLayer()
	end
end

function var_0_3.updatePercentage(arg_19_0, arg_19_1)
	arg_19_0.uiTable.downloadProgress:setPercentage(arg_19_1)
	arg_19_0.uiTable.progressLight:setPositionX(arg_19_0.uiTable.downloadProgress:getContentSize().width * arg_19_1 / 100 - arg_19_0.uiTable.downloadProgress:getContentSize().width / 2)

	if arg_19_0.progressState ~= arg_19_0.constant.progressStates.installing then
		local var_19_0 = updateManager.getTotalFileSize()
		local var_19_1 = updateManager.getLocalFileSize()

		arg_19_0.uiTable.packSizeLabel:setString(string.format("%s/%sKB", math.ceil(var_19_1 / 1024), math.ceil(var_19_0 / 1024)))
	end
end

function var_0_3.installPercentage(arg_20_0, arg_20_1)
	arg_20_0.uiTable.downloadProgress:setPercentage(arg_20_1)
	arg_20_0.uiTable.progressLight:setPositionX(arg_20_0.uiTable.downloadProgress:getContentSize().width * arg_20_1 / 100 - arg_20_0.uiTable.downloadProgress:getContentSize().width / 2)

	local var_20_0 = updateManager.getZipFileCount()
	local var_20_1 = var_20_0 * arg_20_1 / 100

	arg_20_0.uiTable.packSizeLabel:setString(string.format("%s/%s", math.ceil(var_20_1), math.ceil(var_20_0)))
end

function var_0_3.updateDownloadInfo(arg_21_0)
	log.info("updateManager.downloadPercent:", updateManager.getDownloadPercent())
	arg_21_0:updatePercentage(updateManager.getDownloadPercent())
end

function var_0_3.showTaskGuide(arg_22_0)
	log.info("downloadDetailView showTaskGuide :", arg_22_0.progressState)

	local var_22_0, var_22_1 = tool.getPositionInScreen(arg_22_0.uiTable.actionButton)
	local var_22_2 = var_22_1 + 60

	if arg_22_0.progressState == arg_22_0.constant.progressStates.no then
		guide.control.loadGuide2(7, var_22_0, var_22_2, true, language.get("620011_TJXS"))
	elseif arg_22_0.progressState == arg_22_0.constant.progressStates.downloadStopped then
		guide.control.loadGuide2(7, var_22_0, var_22_2, true, language.get("620012_TJXS"))
	elseif arg_22_0.progressState == arg_22_0.constant.progressStates.downloadCompleted then
		guide.control.loadGuide2(7, var_22_0, var_22_2, true, language.get("620013_TJXS"))
	elseif arg_22_0.progressState == arg_22_0.constant.progressStates.downloading and not var_0_2 then
		local var_22_3, var_22_4 = tool.getPositionInScreen(arg_22_0.uiTable.closeButton)

		guide.control.loadGuide2(6, var_22_3 - 130, var_22_4 - 10, true, language.get("620014_TJXS"))

		var_0_2 = true
	end

	arg_22_0.uiTable.hand:setVisible(not var_0_1)

	if not var_0_1 then
		arg_22_0.uiTable.hand:setPosition(ccp(800, 240))

		local var_22_5 = CCArray:create()

		var_22_5:addObject(CCScaleTo:create(0.3, 0.8))
		var_22_5:addObject(CCDelayTime:create(0.3))
		var_22_5:addObject(CCMoveBy:create(0.5, ccp(-150, 0)))
		var_22_5:addObject(CCDelayTime:create(0.3))
		var_22_5:addObject(CCCallFuncN:create(function()
			arg_22_0.uiTable.hand:setPosition(ccp(800, 240))
		end))
		var_22_5:addObject(CCScaleTo:create(0.3, 1))
		var_22_5:addObject(CCDelayTime:create(0.5))

		local var_22_6 = CCSequence:create(var_22_5)

		arg_22_0.uiTable.hand:runAction(CCRepeatForever:create(var_22_6))
	end
end

function var_0_3.showRewardBox(arg_24_0)
	local var_24_0 = false
	local var_24_1 = CCLayerColor:create(ccc4(0, 0, 0, 120))

	var_24_1:setTouchEnabled(true)
	var_24_1:registerScriptTouchHandler(function(arg_25_0, arg_25_1, arg_25_2)
		if arg_25_0 == CCTOUCHBEGAN then
			return true
		elseif arg_25_0 == CCTOUCHMOVED then
			return true
		elseif arg_25_0 == CCTOUCHENDED then
			if var_24_0 then
				var_24_1:removeFromParentAndCleanup(true)
				arg_24_0.control:getInstallRewards()
			end

			return true
		end
	end, false, true)
	arg_24_0:addChild(var_24_1, 1000)

	local var_24_2, var_24_3 = tool.getPositionInScreen(arg_24_0.uiTable.rewardButton)
	local var_24_4 = CCSprite:create("res/ui/rankInfo/DailyFeatView/gxb_bx.png")

	var_24_4:setPosition(ccp(var_24_2, var_24_3))
	var_24_1:addChild(var_24_4)

	local var_24_5 = CCArray:create()

	var_24_5:addObject(CCMoveTo:create(0.6, ccp(visibleSize.width / 2, visibleSize.height / 2)))
	var_24_5:addObject(CCCallFuncN:create(function()
		local var_26_0 = CCSprite:create("res/ui/activity/ironRotary/btdzp_lig.png")

		var_26_0:setPosition(ccp(var_24_4:getContentSize().width / 2, var_24_4:getContentSize().height / 2))
		var_24_4:addChild(var_26_0, -1)

		local var_26_1 = CCArray:create()

		var_26_1:addObject(CCRotateBy:create(0.8, 90))

		local var_26_2 = CCRepeatForever:create(CCSequence:create(var_26_1))

		var_26_0:runAction(var_26_2)

		var_24_0 = true
	end))

	local var_24_6 = CCSequence:create(var_24_5)

	var_24_4:runAction(var_24_6)
end

function var_0_3.installCompleted(arg_27_0)
	log.info("安装完成！！")
	arg_27_0:setCurrentState(arg_27_0.constant.progressStates.installCompleted)
	arg_27_0.uiTable.actionButton:setEnabled(false)
	arg_27_0.uiTable.actionButtonLabel:setString(arg_27_0.constant.stateToText[arg_27_0.progressState])
	arg_27_0:updatePanel()
end

function var_0_3.downloadCompleted(arg_28_0)
	arg_28_0.uiTable.actionButton:setEnabled(true)
	arg_28_0:setCurrentState(arg_28_0.constant.progressStates.downloadCompleted)
	arg_28_0.uiTable.actionButtonLabel:setString(arg_28_0.constant.stateToText[arg_28_0.progressState])
	arg_28_0:updatePanel()
	arg_28_0:showTaskGuide()
end

function var_0_3.setCurrentState(arg_29_0, arg_29_1)
	arg_29_0.progressState = arg_29_1

	cmgr.sendRequestWithoutModal(nil, actions.recordPreviewUserState, arg_29_0.progressState)
end

function var_0_3.fileCopyProgressChanged(arg_30_0, arg_30_1)
	log.info("fileCopyProgressChanged:", arg_30_1)
	arg_30_0:updatePercentage(arg_30_1)
end

function var_0_3.onEnter(arg_31_0)
	arg_31_0.updatePercentageRef = handler(arg_31_0, arg_31_0.updatePercentage)

	eventManager.registerEvent("downloadProgressDidChanged", arg_31_0.updatePercentageRef)

	arg_31_0.installPercentageRef = handler(arg_31_0, arg_31_0.installPercentage)

	eventManager.registerEvent("installProgressDidChanged", arg_31_0.installPercentageRef)

	arg_31_0.updateDownloadInfoRef = handler(arg_31_0, arg_31_0.updateDownloadInfo)

	eventManager.registerEvent("getTempDownloadFileInfoSucceed", arg_31_0.updateDownloadInfoRef)

	arg_31_0.installCompletedRef = handler(arg_31_0, arg_31_0.installCompleted)

	eventManager.registerEvent("fullPackInstallCompleted", arg_31_0.installCompletedRef)

	arg_31_0.downloadCompletedRef = handler(arg_31_0, arg_31_0.downloadCompleted)

	eventManager.registerEvent("fullPackDownloadCompleted", arg_31_0.downloadCompletedRef)

	arg_31_0.fileCopyProgressChangedRef = handler(arg_31_0, arg_31_0.fileCopyProgressChanged)

	eventManager.registerEvent("fileCopyProgressChanged", arg_31_0.fileCopyProgressChangedRef)
end

function var_0_3.onExit(arg_32_0)
	eventManager.unregisterEvent("downloadProgressDidChanged", arg_32_0.updatePercentageRef)
	eventManager.unregisterEvent("installProgressDidChanged", arg_32_0.installPercentageRef)
	eventManager.unregisterEvent("getTempDownloadFileInfoSucceed", arg_32_0.updateDownloadInfoRef)
	eventManager.unregisterEvent("fullPackInstallCompleted", arg_32_0.installCompletedRef)
	eventManager.unregisterEvent("fullPackDownloadCompleted", arg_32_0.downloadCompletedRef)
	eventManager.unregisterEvent("fileCopyProgressChanged", arg_32_0.fileCopyProgressChangedRef)
end

function var_0_3.onTouchBegan(arg_33_0, arg_33_1, arg_33_2)
	return true
end

function var_0_3.onTouchMoved(arg_34_0, arg_34_1, arg_34_2)
	return true
end

function var_0_3.onTouchEnded(arg_35_0, arg_35_1, arg_35_2)
	return true
end

return var_0_3
