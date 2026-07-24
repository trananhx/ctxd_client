notice = {}
notice.ui = {}
notice.ui.expandID = -1

require("lua/layer/notice/control")
require("lua/layer/noviceWantedActivity/constant")

local var_0_0 = require("lua/common/html")

function notice.ui.update()
	if not smgr.isShowNotice then
		return
	end

	notice.ui.table.layer:removeAllChildrenWithCleanup(true)

	local var_1_0 = CCMenu:create()

	var_1_0:setPosition(ccp(0, 0))
	notice.ui.table.layer:addChild(var_1_0, 2)

	local var_1_1 = 280
	local var_1_2 = visibleSize.height - 85
	local var_1_3 = 106
	local var_1_4 = 75
	local var_1_5 = 1

	for iter_1_0, iter_1_1 in ipairs(notice.data) do
		local var_1_6 = false
		local var_1_7 = 0

		if iter_1_1.submenu ~= nil then
			for iter_1_2, iter_1_3 in ipairs(iter_1_1.submenu) do
				if iter_1_3.isVisible == true then
					var_1_7 = var_1_7 + 1
				end
			end

			if var_1_7 > 0 then
				var_1_6 = true
			end
		else
			var_1_6 = iter_1_1.isVisible
		end

		if var_1_6 == true and iter_1_1.outside == true then
			local var_1_8 = "res/ui/noticeIcon/" .. iter_1_1.image .. ".png"
			local var_1_9 = CCSprite:create(var_1_8)
			local var_1_10 = CCSprite:create(var_1_8)
			local var_1_11 = CCMenuItemSprite:create(var_1_9, var_1_10)

			if iter_1_1.callback then
				var_1_11:registerScriptTapHandler(iter_1_1.callback)
			end

			var_1_11:setPosition(ccp(var_1_1 + var_1_5 * var_1_3, var_1_2))

			if var_1_1 + var_1_5 * var_1_3 > visibleSize.width - 130 then
				local var_1_12 = math.modf((visibleSize.width - 130 - var_1_1) / var_1_3)
				local var_1_13 = var_1_5
				local var_1_14 = 0

				while var_1_12 < var_1_13 do
					var_1_13 = var_1_13 - var_1_12
					var_1_14 = var_1_14 + 1
				end

				var_1_11:setPosition(ccp(var_1_1 + var_1_13 * var_1_3, var_1_2 - var_1_14 * var_1_4))
			end

			var_1_0:addChild(var_1_11, 1, iter_1_1.id)

			notice.ui.table["icon_" .. iter_1_1.id] = var_1_11

			if iter_1_1.cornerNum and iter_1_1.cornerNum > 0 then
				log.info("v.cornerNum")

				local var_1_15 = CCSprite:create("res/ui/noticeIcon/icon_number_view.png")

				var_1_15:setPosition(ccp(76, 47))
				var_1_15:setScale(0.9)

				if iter_1_1.id == notice.constant.mjjs then
					var_1_15:setPosition(ccp(86, 49))
				end

				var_1_11:addChild(var_1_15)

				local var_1_16 = CCLabelAtlas:create(tostring(iter_1_1.cornerNum), "res/ui/noticeIcon/icon_number.png", 17, 32, 48)

				var_1_16:setPosition(ccp(22, 24))
				var_1_16:setAnchorPoint(ccp(0.5, 0.5))
				var_1_15:addChild(var_1_16)
			end

			if iter_1_1.submenu ~= nil then
				local var_1_17 = CCSprite:create("res/ui/noticeIcon/icon_view.png")
				local var_1_18 = CCMenu:create()

				var_1_18:setPosition(ccp(0, 0))
				var_1_17:addChild(var_1_18)

				local var_1_19 = var_1_1 + var_1_5 * var_1_3
				local var_1_20 = var_1_2 - var_1_4

				var_1_17:setPosition(ccp(var_1_19, var_1_20 + 10))
				notice.ui.table.layer:addChild(var_1_17, 3)

				notice.ui.table["subBg_" .. iter_1_1.id] = var_1_17

				local var_1_21 = 1

				for iter_1_4, iter_1_5 in ipairs(iter_1_1.submenu) do
					if iter_1_5.isVisible == true then
						log.info(iter_1_5.image)

						local var_1_22 = "res/ui/noticeIcon/" .. iter_1_5.image .. ".png"
						local var_1_23 = CCSprite:create(var_1_22)
						local var_1_24 = CCSprite:create(var_1_22)
						local var_1_25 = CCMenuItemSprite:create(var_1_23, var_1_24)

						var_1_25:registerScriptTapHandler(iter_1_5.callback)
						var_1_25:setPosition(ccp(var_1_17:getContentSize().width / 2 - var_1_3 / 2 * (var_1_7 - 1) + (var_1_21 - 1) * var_1_3, var_1_17:getContentSize().height / 2 - 10))
						var_1_18:addChild(var_1_25, 10, iter_1_1.id)

						var_1_21 = var_1_21 + 1
						notice.ui.table["icon_" .. iter_1_5.id] = var_1_25

						if iter_1_5.id == notice.constant.goldOrder and user.goldOrderNum > 1 then
							local var_1_26 = CCLabelAtlas:create(tostring(user.goldOrderNum), "res/ui/common/number/icon_numb.png", 19, 23, 48)

							var_1_26:setAnchorPoint(ccp(0.5, 0.5))

							local var_1_27 = CCSprite:createWithSpriteFrameName("icon_numb_multi.png")
							local var_1_28 = createRichNode({
								var_1_27,
								var_1_26
							}, 0, "bottom")

							var_1_28:setPosition(ccp(62, 45))
							var_1_25:addChild(var_1_28)
						end
					end
				end

				local var_1_29

				if notice.ui.expandID == iter_1_1.id then
					var_1_29 = CCSprite:create("res/ui/noticeIcon/sign_cut.png")

					var_1_17:setVisible(true)
				else
					var_1_29 = CCSprite:create("res/ui/noticeIcon/sign_add.png")

					var_1_17:setVisible(false)
				end

				var_1_29:setPosition(ccp(var_1_1 + var_1_5 * var_1_3 + 38, var_1_2 + 23))

				notice.ui.table["sign_" .. iter_1_1.id] = var_1_29

				notice.ui.table.layer:addChild(var_1_29, 3)
			end

			if iter_1_1.id == notice.constant.activity and user.player.hasSDTJActivity == 1 then
				log.info("@@ 显示活动进度条")

				local var_1_30 = CCSprite:create("res/ui/sdtj/sdtj_progress_bg3.png")
				local var_1_31 = CCSprite:create("res/ui/sdtj/sdtj_progress_bar3.png")
				local var_1_32 = kCCProgressTimerTypeBar
				local var_1_33 = CCProgressTimer:create(var_1_31)

				var_1_33:setType(var_1_32)
				var_1_30:addChild(var_1_33)
				var_1_33:setPosition(ccp(12, 8))
				var_1_33:setAnchorPoint(ccp(0, 0.5))
				var_1_33:setMidpoint(CCPointMake(0, 0.5))
				var_1_33:setBarChangeRate(CCPointMake(1, 0))
				var_1_33:setPercentage(user.player.sdtjcurExp / user.player.sdtjMaxExp * 100)
				var_1_30:setPosition(ccp(53, -5))
				var_1_11:addChild(var_1_30)

				notice.ui.table.sdtj_progress = var_1_33
			end

			if iter_1_1.id == notice.constant.discount and user.discountCountDown > 0 then
				log.info("@@ 限时优惠倒计时")

				local function var_1_34(arg_2_0)
					return tool.formatTime(arg_2_0, arg_2_0 > 3600000 and "@H:@M:@S" or "@M:@S")
				end

				local var_1_35 = CCStrokeLabelTTF:create(var_1_34(user.discountCountDown), "Bold", 26, 1)

				var_1_35:setColor(colorQuality[5])
				var_1_11:addChild(var_1_35)
				var_1_35:setPosition(ccp(53, -5))

				notice.ui.table.discount_timer = var_1_35

				local var_1_36 = CCArray:create()

				var_1_36:addObject(CCDelayTime:create(1))
				var_1_36:addObject(CCCallFuncN:create(function()
					user.discountCountDown = user.discountCountDown - 1000

					if user.discountCountDown <= 0 then
						notice.ui.table.discount_timer:removeFromParentAndCleanup(true)

						notice.ui.table.discount_timer = nil
						user.discountCountDown = 0

						notice.control.refreshLayer()
					else
						var_1_35:setString(var_1_34(user.discountCountDown))
					end
				end))

				local var_1_37 = CCSequence:create(var_1_36)

				var_1_35:runAction(CCRepeatForever:create(var_1_37))
			end

			if iter_1_1.id == notice.constant.xzyl then
				log.info("@@ 显示下载有礼进度条")

				local var_1_38 = rmgr.isNotComplete()

				notice.ui.table.xzyl_progress = nil

				if var_1_38 then
					local var_1_39 = CCSprite:create("res/ui/downloadViewer/jdtdi.png")
					local var_1_40 = CCSprite:create("res/ui/downloadViewer/jdtdi-huang.png")
					local var_1_41 = kCCProgressTimerTypeBar
					local var_1_42 = CCProgressTimer:create(var_1_40)

					var_1_42:setType(var_1_41)
					var_1_39:addChild(var_1_42)
					var_1_42:setPosition(ccp(0, 0))
					var_1_42:setAnchorPoint(ccp(0, 0))
					var_1_42:setMidpoint(CCPointMake(0, 0.5))
					var_1_42:setBarChangeRate(CCPointMake(1, 0))
					var_1_39:setPosition(ccp(53, -5))
					var_1_11:addChild(var_1_39)

					notice.ui.table.xzyl_progress = var_1_42

					notice.control.refreshXZYL()
				end
			end

			if iter_1_1.id == notice.constant.tjsj then
				notice.ui.quickCastingView = require("lua/layer/weaponTab/casting/CastingQuickView").new(var_1_11, user.quickCastingInfo)
			end

			if iter_1_1.id == notice.constant.gonghe then
				log.info("@@ 恭贺")

				if user.player.gonghe > 1 then
					local var_1_43 = CCLabelAtlas:create(tostring(user.player.gonghe), "res/ui/common/number/lv_numb.png", 18, 23, 48)

					var_1_43:setAnchorPoint(ccp(1, 0.5))
					var_1_43:setPosition(96, 60)
					var_1_11:addChild(var_1_43)
				end
			end

			if iter_1_1.id == notice.constant.xfhk then
				log.info("@@ 回馈")

				if user.haveXfhk == 2 then
					local var_1_44 = CCArray:create()

					for iter_1_6 = 0, 8 do
						local var_1_45 = tool.spriteFrameByName(string.format("ui01_0000%d.png", iter_1_6))

						var_1_44:addObject(var_1_45)
					end

					local var_1_46 = CCAnimation:createWithSpriteFrames(var_1_44, 0.05)
					local var_1_47 = CCAnimate:create(var_1_46)
					local var_1_48 = CCRepeatForever:create(var_1_47)
					local var_1_49 = CCSprite:create()

					var_1_49:setScale(0.5)
					var_1_49:runAction(var_1_48)
					var_1_49:setPosition(ccp(var_1_11:getContentSize().width / 2, var_1_11:getContentSize().height / 2))
					var_1_11:addChild(var_1_49)
				end
			end

			if iter_1_1.id == notice.constant.cdsh and user.haveLookActivityIcon == 2 then
				local var_1_50 = CCArray:create()

				for iter_1_7 = 0, 8 do
					local var_1_51 = tool.spriteFrameByName(string.format("ui01_0000%d.png", iter_1_7))

					var_1_50:addObject(var_1_51)
				end

				local var_1_52 = CCAnimation:createWithSpriteFrames(var_1_50, 0.05)
				local var_1_53 = CCAnimate:create(var_1_52)
				local var_1_54 = CCRepeatForever:create(var_1_53)
				local var_1_55 = CCSprite:create()

				var_1_55:setScale(0.5)
				var_1_55:runAction(var_1_54)
				var_1_55:setPosition(ccp(var_1_11:getContentSize().width / 2, var_1_11:getContentSize().height / 2))
				var_1_11:addChild(var_1_55)
			end

			var_1_5 = var_1_5 + 1
		end
	end

	eventManager.dispatchEvent("updateNoticeIcon")
end

function notice.ui.onTouch(arg_4_0)
	if arg_4_0 == CCTOUCHBEGAN and notice.ui.expandID ~= -1 then
		notice.ui.expandID = -1

		notice.ui.update()
	end

	return false
end

function notice.ui.init()
	notice.control.init()

	notice.ui.expandID = -1

	notice.ui.update()
end

function notice.ui.show(arg_6_0)
	local var_6_0 = createBaseLayer()

	rmgr.loadResource("res/anim/instanceAnim/bonusAnim.plist")

	function var_6_0.onEnter(arg_7_0)
		cmgr.registerResponseHandler(actions.pushPlayer, notice.control.handlePushPlayer)
		cmgr.registerResponseHandler(actions.pushOfficerToken, notice.control.handlePushOfficerToken)
		cmgr.registerResponseHandler(actions.rightNotice, notice.control.handlerPushRightNotice)
		cmgr.registerResponseHandler(actions.pushAttToken, notice.control.handlePushAttToken)
		cmgr.registerResponseHandler(actions.pushCastle, notice.control.handlePushCastle)
		cmgr.registerResponseHandler(actions.pushForceTask, notice.control.handlerPushJungongEventAction)
		eventManager.registerEvent("replyClockReward", notice.control.replyClockReward)
		eventManager.registerEvent("refreshActivityNotice", notice.control.refreshLayer)
		eventManager.registerEvent("refreshBarToken", notice.control.refreshBarToken)
		eventManager.registerEvent("replyBarToken", notice.control.replyBarToken)
		eventManager.registerEvent("refreshGoldOrder", notice.control.refreshLayer)
		eventManager.registerEvent("GameOver", notice.control.game_exit)
		eventManager.registerEvent("nationTaskDidChanged", notice.control.refreshLayer)
		eventManager.registerEvent("tryAndProtectTaskStateDidChanged", notice.control.refreshLayer)
		eventManager.registerEvent("welfareValueDidChanged", notice.control.refreshLayer)
		eventManager.registerEvent("kfwdStateDidChanged", notice.control.refreshLayer)
		eventManager.registerEvent("refreshTJSDExp", notice.control.refreshTJSDExp)
		eventManager.registerEvent("refreshNoticeLayer", notice.control.refreshLayer)
		eventManager.registerEvent("downloadProgressDidChanged", notice.control.refreshXZYL)
		eventManager.registerEvent("changeHuizhanIconState", notice.control.refreshHuizhanGather)
		eventManager.registerEvent("JoinzhiyuanToken", notice.control.refreshLayer)
		eventManager.registerEvent("slaughterConfirmNotify", notice.control.refreshLayer)
		eventManager.registerEvent("PushJiaoZhenIcon", notice.control.handleJiaoZhenIcon)
		eventManager.registerEvent("quickCastingInfo", notice.control.handlePushYcbw)
	end

	function var_6_0.onExit(arg_8_0)
		cmgr.unregisterResponseHandler(actions.pushPlayer, notice.control.handlePushPlayer)
		cmgr.unregisterResponseHandler(actions.pushOfficerToken, notice.control.handlePushOfficerToken)
		cmgr.unregisterResponseHandler(actions.rightNotice, notice.control.handlerPushRightNotice)
		cmgr.unregisterResponseHandler(actions.pushAttToken, notice.control.handlePushAttToken)
		cmgr.unregisterResponseHandler(actions.pushCastle, notice.control.handlePushCastle)
		cmgr.unregisterResponseHandler(actions.pushForceTask, notice.control.handlerPushJungongEventAction)
		eventManager.unregisterEvent("replyClockReward", notice.control.replyClockReward)
		eventManager.unregisterEvent("refreshActivityNotice", notice.control.refreshLayer)
		eventManager.unregisterEvent("refreshBarToken", notice.control.refreshBarToken)
		eventManager.unregisterEvent("replyBarToken", notice.control.replyBarToken)
		eventManager.unregisterEvent("refreshGoldOrder", notice.control.refreshLayer)
		eventManager.unregisterEvent("GameOver", notice.control.game_exit)
		eventManager.unregisterEvent("nationTaskDidChanged", notice.control.refreshLayer)
		eventManager.unregisterEvent("tryAndProtectTaskStateDidChanged", notice.control.refreshLayer)
		eventManager.unregisterEvent("welfareValueDidChanged", notice.control.refreshLayer)
		eventManager.unregisterEvent("kfwdStateDidChanged", notice.control.refreshLayer)
		eventManager.unregisterEvent("refreshTJSDExp", notice.control.refreshTJSDExp)
		eventManager.unregisterEvent("refreshNoticeLayer", notice.control.refreshLayer)
		eventManager.unregisterEvent("downloadProgressDidChanged", notice.control.refreshXZYL)
		eventManager.unregisterEvent("changeHuizhanIconState", notice.control.refreshHuizhanGather)
		eventManager.unregisterEvent("JoinzhiyuanToken", notice.control.refreshLayer)
		eventManager.unregisterEvent("slaughterConfirmNotify", notice.control.refreshLayer)
		eventManager.unregisterEvent("PushJiaoZhenIcon", notice.control.handleJiaoZhenIcon)
		eventManager.unregisterEvent("quickCastingInfo", notice.control.handlePushYcbw)
	end

	var_6_0:registerScriptTouchHandler(notice.ui.onTouch, false, false)
	var_6_0:setTouchEnabled(true)
	arg_6_0:addChild(var_6_0)

	notice.ui.table = {}
	notice.ui.table.layer = var_6_0

	notice.ui.init()

	return var_6_0
end

function notice.ui.checkIfNeedShowWelfareButton()
	if user.welfare.freeIncenseNum < 1 and user.welfare.dayTrain == false and user.welfare.marketCanBuyNum < 1 and user.welfare.displayBlack < 1 and user.welfare.hasSalary == false and user.welfare.countryRewardNum < 1 and user.welfare.onlineNum < 1 and user.welfare.freeQuechingTimes < 1 and user.welfare.dinnerNum < 1 and user.welfare.wizardIconType < 1 and user.welfare.slaveNum < 1 and user.welfare.displayTech < 1 and user.welfare.batReward == false and user.welfare.challengeReward == false and user.welfare.stormReward == false and user.welfare.haveDayGift == false and user.welfare.topLv < 1 and user.welfare.canGetOfflineBuff == 0 then
		return false
	else
		return true
	end
end

function showNoticeLayer(arg_10_0)
	notice.ui.show(arg_10_0)
end

local function var_0_1(arg_11_0, arg_11_1)
	for iter_11_0, iter_11_1 in pairs(arg_11_0) do
		if iter_11_0 ~= "_attr" and iter_11_0 ~= "_tag" and type(iter_11_1) == "string" then
			local var_11_0 = "#d9cc8f"
			local var_11_1 = "label"
			local var_11_2
			local var_11_3 = iter_11_1

			if arg_11_0._tag and arg_11_0._tag == "font" and arg_11_0._attr then
				var_11_0 = arg_11_0._attr.color
			elseif arg_11_0._tag and arg_11_0._tag == "a" then
				var_11_1 = "link"

				if arg_11_0._attr then
					if arg_11_0._attr.href then
						var_11_2 = arg_11_0._attr.href
					end

					if arg_11_0._attr.color then
						var_11_0 = arg_11_0._attr.color
					end
				end
			end

			table.insert(arg_11_1, {
				type = var_11_1,
				text = var_11_3,
				color = var_11_0,
				data = var_11_2
			})
		elseif type(iter_11_1) == "table" and iter_11_1._tag then
			var_0_1(iter_11_1, arg_11_1)
		end
	end
end

function notice.ui.scrollNotice(arg_12_0)
	local var_12_0 = arg_12_0.content
	local var_12_1 = var_0_0.parsestr(var_12_0)
	local var_12_2 = {}

	if var_12_1 then
		if notice.ui.table.noticeBg ~= nil and not tolua.isnull(notice.ui.table.noticeBg) then
			notice.ui.table.noticeBg:removeFromParentAndCleanup(true)

			notice.ui.table.noticeBg = nil
		end

		var_0_1(var_12_1, var_12_2)

		local var_12_3 = {}
		local var_12_4 = 0

		for iter_12_0, iter_12_1 in pairs(var_12_2) do
			local var_12_5

			if iter_12_1.type == "label" then
				var_12_5 = CCStrokeLabelTTF:create(iter_12_1.text, "Thonburi", 22)

				var_12_5:setColor(tool.hexToRgb(iter_12_1.color))
			elseif iter_12_1.type == "link" then
				var_12_5 = CCControlButton:create(iter_12_1.text, "Thonburi", 26)

				if iter_12_1.color then
					local var_12_6 = tool.hexToRgb(iter_12_1.color)

					var_12_5:setTitleColorForState(var_12_6, CCControlStateNormal)
					var_12_5:setTitleColorForState(var_12_6, CCControlStateHighlighted)
					var_12_5:setTitleColorForState(var_12_6, CCControlStateSelected)
				end

				local var_12_7 = CCString:create(iter_12_1.data)

				var_12_5:setUserObject(var_12_7)
				var_12_5:addHandleOfControlEvent(notice.control.openUrl, CCControlEventTouchUpInside)
			end

			table.insert(var_12_3, var_12_5)

			var_12_4 = var_12_4 + var_12_5:getContentSize().width
		end

		local var_12_8 = createRichNode(var_12_3)
		local var_12_9 = CCSprite:create("res/ui/noticeIcon/marquee_list.png")

		var_12_9:setPosition(ccp(visibleSize.width / 2, visibleSize.height - 130))
		smgr.getLayer("noticeLayer"):addChild(var_12_9, 9999)

		local var_12_10 = CCLayer:create()

		var_12_10:setContentSize(CCSizeMake(1671, 36))
		var_12_8:setPosition(ccp(var_12_4, 18))
		var_12_10:addChild(var_12_8)

		local var_12_11 = CCScrollView:create(CCSizeMake(500, 36), var_12_10)

		var_12_11:setPosition(ccp(28.5, 0))
		var_12_11:setTouchEnabled(false)
		var_12_9:addChild(var_12_11)
		var_12_10:runAction(CCMoveBy:create(20, ccp(-var_12_4 * 2, 0)))

		notice.ui.table.noticeBg = var_12_9

		performWithDelay(var_12_9, function()
			notice.ui.table.noticeBg:removeFromParentAndCleanup(true)

			notice.ui.table.noticeBg = nil
		end, 20)
	end
end
