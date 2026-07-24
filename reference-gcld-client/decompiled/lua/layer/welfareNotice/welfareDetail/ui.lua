require("lua/component/labelPage")
tool.requireRes("welfareNotice/welfareDetail")

welfareDetailUI = {}
welfareDetailUI.uiTable = {}

local var_0_0 = welfareDetailUI
local var_0_1 = welfareDetailControl

welfareDetailUI.indexToWelfareTable = {}

function var_0_0.show()
	local var_1_0 = createBaseLayer()

	smgr.registerLayer(var_1_0, "welfareDetailLayer")

	if var_0_0.uiTable then
		var_0_0.uiTable = nil
	end

	var_0_0.uiTable = autoUI.initUI(var_1_0, getWelfareDetailData())

	var_1_0:setTouchEnabled(true)

	var_1_0.onEnter = var_0_1.onEnter
	var_1_0.onExit = var_0_1.onExit

	var_0_0.updateWelfareButtonLayer()

	return var_1_0
end

function var_0_0.updateScrollView()
	if var_0_0.scrollView then
		pcall(var_0_0.scrollView.removeFromParentAndCleanup, var_0_0.scrollView, true)
	end

	local var_2_0 = CCSizeMake(905, 440)

	var_0_0.scrollView = CCScrollView:create(var_2_0)

	var_0_0.scrollView:removeAllChildrenWithCleanup(true)

	var_0_0.collectionViewLayer = var_0_0.uiTable.welfareCellLayer

	local var_2_1 = var_0_0.collectionViewLayer:getContentSize()

	var_0_0.scrollView:setContainer(var_0_0.collectionViewLayer)
	var_0_0.scrollView:setDirection(kCCScrollViewDirectionHorizontal)
	var_0_0.uiTable.welfareBackground:addChild(var_0_0.scrollView)
	var_0_0.scrollView:setContentSize(var_2_1)
	var_0_0.scrollView:setAnchorPoint(ccp(0, 0))
	var_0_0.scrollView:setPosition(ccp(5, 5))
	var_0_0.scrollView:setContentOffset(ccp(0, var_0_0.scrollView:getViewSize().height - var_2_1.height))
	log.info("scorllview up to date")
end

function var_0_0.updateWelfareButtonLayer()
	if var_0_0.uiTable.welfareCellLayer then
		pcall(var_0_0.uiTable.welfareCellLayer.removeFromParentAndCleanup, var_0_0.uiTable.welfareCellLayer, true)
	end

	local var_3_0 = var_0_0.updateWelfareCount()
	local var_3_1 = autoUI.createUI(nil, getWelfareCellLayerData(var_3_0), var_0_0.uiTable)

	log.info("welfareCount", var_3_0)

	if var_3_0 <= 8 then
		for iter_3_0 = 1, var_3_0 do
			var_0_0.uiTable["welfareButton" .. iter_3_0]:setVisible(false)
			var_0_0.uiTable["welfareIcon" .. iter_3_0]:setVisible(false)
			var_0_0.uiTable["welfareName" .. iter_3_0]:setVisible(false)

			local var_3_2 = var_0_0.indexToWelfareTable[iter_3_0]

			if var_3_2 then
				var_0_0.uiTable["welfareButton" .. iter_3_0]:setVisible(true)
				var_0_0.uiTable["welfareIcon" .. iter_3_0]:setVisible(true)
				var_0_0.uiTable["welfareName" .. iter_3_0]:setVisible(true)
				var_0_0.uiTable["welfareIcon" .. iter_3_0]:setDisplayFrame(CCSprite:create(welfareDetailConstant.welfareIconPic[var_3_2]):displayFrame())
				var_0_0.uiTable["welfareName" .. iter_3_0]:setDisplayFrame(CCSprite:create(welfareDetailConstant.welfareTitlePic[var_3_2]):displayFrame())
			end
		end

		var_0_0.uiTable.welfareBackground:addChild(var_0_0.uiTable.welfareCellLayer)
		var_0_0.uiTable.welfareCellLayer:setPosition(ccp(18, 5))
	else
		for iter_3_1 = 1, var_3_0 do
			var_0_0.uiTable["welfareButton" .. iter_3_1]:setVisible(false)
			var_0_0.uiTable["welfareIcon" .. iter_3_1]:setVisible(false)
			var_0_0.uiTable["welfareName" .. iter_3_1]:setVisible(false)

			local var_3_3 = var_0_0.indexToWelfareTable[iter_3_1]

			if var_3_3 then
				var_0_0.uiTable["welfareButton" .. iter_3_1]:setVisible(true)
				var_0_0.uiTable["welfareIcon" .. iter_3_1]:setVisible(true)
				var_0_0.uiTable["welfareName" .. iter_3_1]:setVisible(true)
				var_0_0.uiTable["welfareIcon" .. iter_3_1]:setDisplayFrame(CCSprite:create(welfareDetailConstant.welfareIconPic[var_3_3]):displayFrame())
				var_0_0.uiTable["welfareName" .. iter_3_1]:setDisplayFrame(CCSprite:create(welfareDetailConstant.welfareTitlePic[var_3_3]):displayFrame())
			end
		end

		var_0_0.updateScrollView()
	end
end

function var_0_0.updateWelfareCount()
	local var_4_0 = 0

	var_0_0.indexToWelfareTable = {}

	if user.welfare.haveDayGift == true or user.haveMineDayGift ~= 0 then
		var_4_0 = var_4_0 + 1
		var_0_0.indexToWelfareTable[var_4_0] = "dljl"
	end

	if user.welfare.topLv >= 1 then
		var_4_0 = var_4_0 + 1
		var_0_0.indexToWelfareTable[var_4_0] = "jysx"
	end

	if user.welfare.freeIncenseNum >= 1 then
		var_4_0 = var_4_0 + 1
		var_0_0.indexToWelfareTable[var_4_0] = "mfjs"
	end

	if not rmgr.isNotComplete() then
		if user.welfare.dayTrain == true then
			var_4_0 = var_4_0 + 1
			var_0_0.indexToWelfareTable[var_4_0] = "mrcl"
		end

		if user.welfare.countryRewardNum >= 1 then
			var_4_0 = var_4_0 + 1
			var_0_0.indexToWelfareTable[var_4_0] = "jzjl"
		end
	end

	if user.welfare.marketCanBuyNum >= 1 then
		var_4_0 = var_4_0 + 1
		var_0_0.indexToWelfareTable[var_4_0] = "jsgm"
	end

	if user.welfare.onlineNum >= 1 then
		var_4_0 = var_4_0 + 1
		var_0_0.indexToWelfareTable[var_4_0] = "zdjl"
	end

	if user.welfare.dinnerNum >= 1 then
		var_4_0 = var_4_0 + 1
		var_0_0.indexToWelfareTable[var_4_0] = "yhcs"
	end

	if user.welfare.freeQuechingTimes >= 1 and user.sublimated ~= true then
		var_4_0 = var_4_0 + 1
		var_0_0.indexToWelfareTable[var_4_0] = "xlcs"
	end

	if user.welfare.wizardIconType >= 1 then
		var_4_0 = var_4_0 + 1
		var_0_0.indexToWelfareTable[var_4_0] = "ssgf"
	end

	if user.welfare.batReward == true then
		var_4_0 = var_4_0 + 1
		var_0_0.indexToWelfareTable[var_4_0] = "gxjl"
	end

	if user.welfare.hasSalary == true then
		var_4_0 = var_4_0 + 1
		var_0_0.indexToWelfareTable[var_4_0] = "lqfl"
	end

	if user.welfare.displayBlack >= 1 then
		var_4_0 = var_4_0 + 1
		var_0_0.indexToWelfareTable[var_4_0] = "hsdh"
	end

	if tonumber(user.welfare.displayTech) >= 1 then
		var_4_0 = var_4_0 + 1
		var_0_0.indexToWelfareTable[var_4_0] = "yjkj"
	end

	if user.welfare.canGetOfflineBuff == 1 then
		var_4_0 = var_4_0 + 1
		var_0_0.indexToWelfareTable[var_4_0] = "lxjl"
	end

	return var_4_0
end

function var_0_0.welfarePressAtIndex(arg_5_0)
	log.info(" press at index ", arg_5_0)

	if var_0_0.indexToWelfareTable[arg_5_0] == "mfjs" then
		require("lua/layer/resource/ui")
		resourceUI.show(1)
	elseif var_0_0.indexToWelfareTable[arg_5_0] == "mrcl" then
		smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)

		if user.player.forceId == 1 then
			roleDialogue.control.loadSpeak(812)
		elseif user.player.forceId == 2 then
			roleDialogue.control.loadSpeak(810)
		elseif user.player.forceId == 3 then
			roleDialogue.control.loadSpeak(811)
		end
	elseif var_0_0.indexToWelfareTable[arg_5_0] == "jsgm" then
		require("lua/layer/resource/ui")
		resourceUI.show(2)
	elseif var_0_0.indexToWelfareTable[arg_5_0] == "hsdh" then
		require("lua/layer/resource/ui")
		resourceUI.show(3)
	elseif var_0_0.indexToWelfareTable[arg_5_0] == "lqfl" then
		require("lua/layer/rankInfo/ui")
		rankInfoUI.show(2)
	elseif var_0_0.indexToWelfareTable[arg_5_0] == "jzjl" then
		if worldUI and smgr.currentSceneTag == SCENE_WORLD then
			worldThumbnailControl.thumbnailIsVisible = true

			worldThumbnailUI.setThumbnailVisible(worldThumbnailControl.thumbnailIsVisible)
			eventManager.dispatchEvent("sideGeneralSetVisible", not worldThumbnailControl.thumbnailIsVisible)
			eventManager.dispatchEvent("taskButtonItemSetVisible", not worldThumbnailControl.thumbnailIsVisible)
			eventManager.dispatchEvent("rightMenuSetVisible", not worldThumbnailControl.thumbnailIsVisible)
			welfareNoticeUI.click_close_item()
		else
			smgr.changeScene(SCENE_WORLD, nil, true)
		end
	elseif var_0_0.indexToWelfareTable[arg_5_0] == "zdjl" then
		require("lua/layer/clockReward/ui")
		clockReward.ui.show()
	elseif var_0_0.indexToWelfareTable[arg_5_0] == "xlcs" then
		require("lua/layer/equipment/ui")
		equipmentUI.show(4)
	elseif var_0_0.indexToWelfareTable[arg_5_0] == "yhcs" then
		require("lua/layer/general/ui")
		showGeneralPanel(4)
	elseif var_0_0.indexToWelfareTable[arg_5_0] == "ssgf" then
		require("lua/layer/general/ui")
		showGeneralPanel(6)
	elseif var_0_0.indexToWelfareTable[arg_5_0] == "lfqf" then
		require("lua/layer/general/ui")
		showGeneralPanel(5)
	elseif var_0_0.indexToWelfareTable[arg_5_0] == "yjkj" then
		require("lua/layer/technology/ui")
		technologyUI.show(1)
	elseif var_0_0.indexToWelfareTable[arg_5_0] == "gxjl" then
		require("lua/layer/rankInfo/ui")
		rankInfoUI.show(1)
	elseif var_0_0.indexToWelfareTable[arg_5_0] == "dtb" then
		require("lua/layer/rankInfo/ui")
		rankInfoUI.show(3)
	elseif var_0_0.indexToWelfareTable[arg_5_0] == "gcb" then
		require("lua/layer/rankInfo/ui")
		rankInfoUI.show(4)
	elseif var_0_0.indexToWelfareTable[arg_5_0] == "dljl" then
		require("lua/layer/dayReward/ui")
		dayReward.ui.show()
		welfareNoticeUI.click_close_item()
	elseif var_0_0.indexToWelfareTable[arg_5_0] == "jysx" then
		log.info("@@ 经验上线提示")
		messageBox.confirm(language.get(385002))
	elseif var_0_0.indexToWelfareTable[arg_5_0] == "lxjl" then
		require("lua/layer/offlineBuff/ui")
		offlineBuff.ui.show()
	elseif var_0_0.indexToWelfareTable[arg_5_0] == "wybq" then
		CCApplication:sharedApplication():openURL("http://gc.feiliu.com")
	end
end
