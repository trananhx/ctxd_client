recharge.control = {}
recharge.control.isGot = {}
recharge.control.privileges = {}
recharge.control.currentLv = 0
recharge.control.vip5BonusNpc = {}
recharge.control.isChongZhiLayer = true
recharge.control.iapData = {}
recharge.control.isUnderTransaction = false
recharge.control.isProductInfoLoaded = false
recharge.control.currentIdx = 0
recharge.control.changeNameGold = 0

function recharge.control.onEnter()
	log.info("channelMgr.payMethod : ", channelMgr.payMethod)

	if channelMgr.payMethod == 1 or channelMgr.payMethod == 6 then
		Purchase:iap_init(recharge.control.iap_receipt_verify)
	end
end

function recharge.control.onExit()
	if channelMgr.payMethod ~= 1 and channelMgr.payMethod == 6 then
		-- block empty
	end
end

function recharge.control.handlerPayInfo(arg_3_0)
	local var_3_0 = arg_3_0.action.data

	if channelMgr.payMethod == 7 then
		var_3_0.productId = ({
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			"702_0_1_30",
			"702_0_2_150",
			"702_0_3_450",
			"702_0_4_900",
			"702_0_5_3000"
		})[tonumber(var_3_0.itemId)]
	end

	if channelMgr.payMethod == 8 or channelMgr.payMethod == 9 or channelMgr.payMethod == 10 or channelMgr.payMethod == 11 then
		var_3_0.playerLv = tostring(user.player.playerLv)
	end

	if channelMgr.payMethod == 12 or channelMgr.payMethod == 13 then
		var_3_0.productId = conf.iapItemIdTableXm[tonumber(var_3_0.itemId)]
		var_3_0.playerLv = tostring(user.player.playerLv)
	end

	if channelMgr.payMethod == 22 or channelMgr.payMethod == 23 then
		var_3_0.productId = conf.iapItemIdTableUjoytw[tonumber(var_3_0.itemId)]
		var_3_0.playerLv = tostring(user.player.playerLv)
	end

	local function var_3_1(arg_4_0)
		if arg_4_0.action.state == 1 then
			if channelMgr.isAppStoreReview() then
				var_3_0.isAppStoreReview = "1"
			end

			local var_4_0 = tool.tableToJson(var_3_0)

			log.info("jsonString", var_4_0)
			channelMgr.pay(var_4_0)
		elseif arg_4_0.action.state == 7 then
			local var_4_1 = arg_4_0.action.data.msg or ""

			messageBox.confirm(var_4_1)
		else
			log.info("handlerPlayerCreatePayOrder unknow state = ", arg_4_0.action.state)
		end
	end

	if channelMgr.payMethod == 9 or channelMgr.payMethod == 8 then
		local var_3_2 = "http://sdkvn.changicvn.com:8090/platform/bluePay.jsp" .. "?appId=" .. "1058" .. "&userId=" .. user.player.userId .. "&gameZoneId=" .. var_3_0.zoneId .. "&gameOrderId=" .. var_3_0.orderId

		log.info("link", var_3_2)
		CCApplication:sharedApplication():openURL(var_3_2)
	elseif channelMgr.payMethod == 11 then
		cmgr.sendRequest(var_3_1, actions.playerCreatePayOrder, var_3_0.productId)
	else
		local var_3_3 = tool.tableToJson(var_3_0)

		log.info("jsonString", var_3_3)
		channelMgr.pay(var_3_3)
	end
end

function recharge.control.handlerTwOtherPay(arg_5_0)
	local var_5_0 = arg_5_0.action.data
	local var_5_1 = tool.tableToJson(var_5_0)

	channelMgr.payWithSdkId(1, var_5_1)
end

function recharge.control.handlerPayList(arg_6_0)
	showTable(arg_6_0)

	local var_6_0 = #arg_6_0.action.data.payItemList

	if channelMgr.payMethod == 5 then
		var_6_0 = 5
	end

	recharge.control.iapData = {}

	for iter_6_0 = 1, var_6_0 do
		local var_6_1 = arg_6_0.action.data.payItemList[iter_6_0]
		local var_6_2 = {
			gold = var_6_1.gold,
			money = var_6_1.money,
			itemId = var_6_1.itemId
		}

		var_6_2.pic = 6

		if iter_6_0 <= 6 then
			var_6_2.pic = iter_6_0
		end

		table.insert(recharge.control.iapData, var_6_2)
	end

	recharge.ui.init()
end

function recharge.control.getPayList()
	log.info("@@ 获取商品列表")
	cmgr.sendRequest(recharge.control.handlerPayList, actions.getPayItemList)
end

function recharge.control.iap_receipt_verify(arg_8_0)
	local function var_8_0(arg_9_0)
		smgr.hideModal()

		recharge.control.isUnderTransaction = false

		if recharge.control.removeMe then
			recharge.control.removeMe()

			recharge.control.removeMe = nil
		end

		log.info("data.transactionId:", arg_8_0.transactionId)

		if arg_9_0.action.data.result == 1 then
			Purchase:iap_complete_transaction(arg_8_0.transactionId)
			messageBox.error(language.get(142001))
			recharge.control.getVipInfo()
		elseif arg_9_0.action.data.result == 2 or arg_9_0.action.data.result == 3 then
			Purchase:iap_fail_transaction(arg_8_0.transactionId)
			messageBox.error(language.get(142002) .. "\n" .. arg_9_0.action.data.msg)
		end
	end

	if arg_8_0.result == 1 then
		log.info("should show modal  line:39")
		smgr.showModal(180)
		cmgr.sendRequest(var_8_0, actions.playerPayByReceipt, conf.debug, arg_8_0.receiptStr, platform.getFlag(), "13")
	elseif arg_8_0.result == 0 then
		messageBox.error(language.get(142002))

		recharge.control.isUnderTransaction = false

		if recharge.control.removeMe then
			recharge.control.removeMe()

			recharge.control.removeMe = nil
		end
	elseif arg_8_0.result == 2 then
		log.info("用户取消")

		recharge.control.isUnderTransaction = false

		if recharge.control.removeMe then
			recharge.control.removeMe()

			recharge.control.removeMe = nil
		end

		smgr.hideModal()
	elseif arg_8_0.result == 3 then
		recharge.control.isProductInfoLoaded = false
	elseif arg_8_0.result == 4 then
		recharge.control.isProductInfoLoaded = true

		smgr.hideModal()
	else
		recharge.control.isUnderTransaction = false

		if recharge.control.removeMe then
			recharge.control.removeMe()

			recharge.control.removeMe = nil
		end
	end
end

function recharge.control.click_buy(arg_10_0)
	if user.isGuestLogin then
		CCMessageBox("", "游客账号无法购买")

		return
	end

	if arg_10_0 <= 0 and arg_10_0 > #recharge.control.iapData then
		return
	end

	if not conf.openPay then
		messageBox.error(language.get(142017))

		return
	end

	if channelMgr.payMethod == 3 then
		local var_10_0 = recharge.control.iapData[arg_10_0].itemId

		cmgr.sendRequest(recharge.control.handlerPayInfo, actions.flPayInfo, var_10_0)
	end

	if channelMgr.payMethod == 2 then
		local var_10_1 = language.get(142003, recharge.control.iapData[arg_10_0].gold)
		local var_10_2 = recharge.control.iapData[arg_10_0].money

		Purchase:buy(conf.alipayURL, var_10_1, user.serverId, user.player.userId, user.player.id, var_10_2, recharge.control.buy_result)
	end

	if channelMgr.payMethod == 1 or channelMgr.payMethod == 6 then
		if not recharge.control.isUnderTransaction and recharge.control.isProductInfoLoaded then
			log.info("buy product :", arg_10_0)
			Purchase:iapBuy(recharge.control.iapItemIdTable[arg_10_0], recharge.control.iap_receipt_verify)

			recharge.control.isUnderTransaction = true
			recharge.control.removeMe = messageBox.countDownAlert(language.get(142015), 10000)
		elseif recharge.control.isUnderTransaction then
			log.info("正在购买")

			recharge.control.removeMe = messageBox.countDownAlert(language.get(142015), 10000)
		end

		if not recharge.control.isProductInfoLoaded then
			log.info("正在加载商品信息")
			messageBox.confirm(language.get(142016))
		end
	end

	if channelMgr.payMethod == 4 then
		channelMgr.pay(tostring(arg_10_0))
	end

	if channelMgr.payMethod == 5 then
		local var_10_3 = recharge.control.iapData[arg_10_0].itemId

		cmgr.sendRequest(recharge.control.handlerPayInfo, actions.flPayInfo, var_10_3)
	end

	if channelMgr.payMethod == 7 then
		local var_10_4 = ({
			["702_0_4_900"] = 14,
			["702_0_3_450"] = 13,
			["702_0_1_30"] = 11,
			["702_0_2_150"] = 12,
			["702_0_5_3000"] = 15
		})[recharge.control.iapItemIdTable[arg_10_0]]

		cmgr.sendRequest(recharge.control.handlerPayInfo, actions.flPayInfo, var_10_4)
	end

	if channelMgr.payMethod == 8 or channelMgr.payMethod == 9 or channelMgr.payMethod == 10 or channelMgr.payMethod == 20 then
		cmgr.sendRequest(recharge.control.handlerPayInfo, actions.flPayInfo, 1)
	end

	if channelMgr.payMethod == 12 or channelMgr.payMethod == 13 or channelMgr.payMethod == 22 or channelMgr.payMethod == 23 or channelMgr.payMethod == 21 then
		cmgr.sendRequest(recharge.control.handlerPayInfo, actions.flPayInfo, arg_10_0)
	end

	if channelMgr.payMethod == 11 then
		if channelMgr.isAppStoreReview() then
			cmgr.sendRequest(recharge.control.handlerPayInfo, actions.flPayInfo, arg_10_0)
		else
			cmgr.sendRequest(recharge.control.handlerPayInfo, actions.flPayInfo, 1)
		end
	end
end

function recharge.control.buy_result(arg_11_0)
	smgr.hideModal()

	if arg_11_0.result == 1 then
		recharge.ui.table.currentGoldValue:setString(language.get(142004, user.player.gold))
		recharge.control.getVipInfo()
	end
end

function recharge.control.gotoWebRecharge()
	CCApplication:sharedApplication():openURL("http://sdk-webpayv1-sg.pocketgamesol.com/gcld/login.html")
end

function recharge.control.click_chongzhi()
	if conf.language == "vie" or channelMgr.payMethod == 20 then
		recharge.control.click_buy(1)

		return
	end

	if conf.language == "tha" then
		if channelMgr.isAppStoreReview() then
			log.info("@@ 苹果购买")
		else
			recharge.control.click_buy(1)

			return
		end
	end

	recharge.control.isChongZhiLayer = true

	recharge.ui.table.scrollView:setVisible(false)
	recharge.ui.table.iap_scrollView:setVisible(true)
	recharge.ui.table.currentGoldValue:setVisible(true)
	recharge.ui.table.btn_chongzhi:setVisible(false)
	recharge.ui.table.btn_tequan:setVisible(true)
	recharge.ui.table.title_chongzhi:setVisible(false)
	recharge.ui.table.title_tequan:setVisible(true)
end

function recharge.control.click_tequan()
	recharge.control.isChongZhiLayer = false

	recharge.ui.table.scrollView:setVisible(true)
	recharge.ui.table.iap_scrollView:setVisible(false)
	recharge.ui.table.currentGoldValue:setVisible(false)
	recharge.ui.table.btn_chongzhi:setVisible(true)
	recharge.ui.table.btn_tequan:setVisible(false)
	recharge.ui.table.title_chongzhi:setVisible(true)
	recharge.ui.table.title_tequan:setVisible(false)
end

function recharge.control.setPlayerIconTextrue(arg_15_0)
	local var_15_0

	if arg_15_0 >= 0 and arg_15_0 <= 6 then
		var_15_0 = "res/ui/common/playerHead/playerHead_icon_" .. tostring(arg_15_0) .. ".png"
	end

	if var_15_0 ~= nil then
		local var_15_1 = CCSprite:create(var_15_0)

		recharge.ui.table.icon:setDisplayFrame(var_15_1:displayFrame())
	end
end

function recharge.control.action_zoom(arg_16_0)
	arg_16_0:setScale(5)

	local var_16_0 = CCScaleTo:create(0.3, 1)

	arg_16_0:runAction(var_16_0)
	arg_16_0:setVisible(true)
end

function recharge.control.updateScrollView(arg_17_0)
	local var_17_0 = {
		1,
		3,
		5,
		7,
		9,
		11,
		12,
		13,
		14,
		15,
		15,
		15,
		15,
		15
	}

	for iter_17_0, iter_17_1 in pairs(arg_17_0) do
		recharge.ui.table["item_label_" .. iter_17_0]:setString(iter_17_1.intro)

		if recharge.control.currentLv > 0 and iter_17_0 <= var_17_0[recharge.control.currentLv] then
			if tonumber(iter_17_1.remainingTimes) ~= nil and tonumber(iter_17_1.remainingTimes) > 0 then
				recharge.ui.table["item_muti_" .. iter_17_0]:setString("x" .. iter_17_1.remainingTimes)
				recharge.ui.table["item_muti_" .. iter_17_0]:setVisible(true)
			else
				recharge.ui.table["item_muti_" .. iter_17_0]:setVisible(false)
			end

			if tonumber(iter_17_1.status) == 1 or iter_17_0 == 8 and user.player.playerLv >= 50 and recharge.control.vip5BonusNpc.canAttack == false then
				if recharge.control.isGot[iter_17_0] == 0 then
					recharge.control.action_zoom(recharge.ui.table["item_huode_" .. iter_17_0])
				end

				if recharge.ui.table["item_icon_" .. iter_17_0] ~= nil then
					recharge.ui.table["item_icon_" .. iter_17_0]:removeChild(recharge.ui.table["item_icon_gray_" .. iter_17_0], true)
				end

				recharge.ui.table["item_huode_" .. iter_17_0]:setVisible(true)

				recharge.control.changeNameGold = iter_17_1.changeNameGold or 0

				if iter_17_1.changeNameGold then
					recharge.ui.table["item_huode_" .. iter_17_0]:setVisible(false)
				end

				local var_17_1 = CCSprite:create("res/ui/playerInfo/vip_list_view.jpg")

				recharge.ui.table["huode_bg_" .. iter_17_0]:setDisplayFrame(var_17_1:displayFrame())
			else
				recharge.ui.table["item_huode_" .. iter_17_0]:setVisible(false)

				local var_17_2 = CCSprite:create("res/ui/playerInfo/vip_list_view.jpg")

				recharge.ui.table["huode_bg_" .. iter_17_0]:setDisplayFrame(var_17_2:displayFrame())
			end
		else
			recharge.ui.table["item_muti_" .. iter_17_0]:setVisible(false)
			recharge.ui.table["item_huode_" .. iter_17_0]:setVisible(false)

			local var_17_3 = tool.spriteToGray(recharge.ui.table["item_icon_" .. iter_17_0], false)

			recharge.ui.table["item_icon_gray_" .. iter_17_0] = var_17_3

			local var_17_4 = CCSprite:create("res/ui/playerInfo/vip_list_view_gray.jpg")

			recharge.ui.table["huode_bg_" .. iter_17_0]:setDisplayFrame(var_17_4:displayFrame())
		end

		recharge.control.isGot[iter_17_0] = iter_17_1.status

		if iter_17_0 == 8 and user.player.playerLv >= 50 and recharge.control.vip5BonusNpc.canAttack == false then
			recharge.control.isGot[iter_17_0] = 1
		end
	end
end

function recharge.control.update_push(arg_18_0)
	if recharge.control.isChongZhiLayer == true and recharge.ui.table.currentGoldValue ~= nil then
		recharge.ui.table.currentGoldValue:setString(language.get(142006, user.player.gold))
		recharge.control.getVipInfo()
	end
end

function recharge.control.update(arg_19_0)
	if arg_19_0.action.state == 1 then
		local var_19_0 = arg_19_0.action.data

		if conf.language == "xm" and tool.cmpVersion("2.0.0.2", sys_version.client) then
			channelMgr.transform("currentPay", tostring(var_19_0.currentPay))
		end

		recharge.ui.table.percentValue:setString("" .. tostring(var_19_0.currentPay) .. "/" .. tostring(var_19_0.totalPay))

		if var_19_0.totalPay == 0 then
			recharge.ui.table.percent:setPercentage(0)
		else
			recharge.ui.table.percent:setPercentage(100 * var_19_0.currentPay / var_19_0.totalPay)
		end

		recharge.control.checkShowFirstPay(tonumber(var_19_0.currentPay) == 0)
		recharge.ui.table.vipValue:setString(var_19_0.currentLv)

		recharge.control.currentLv = var_19_0.currentLv
		recharge.control.vip5BonusNpc = var_19_0.vip5BonusNpc

		recharge.ui.table.shengjixuyao:setString(language.get(142005, tostring(var_19_0.nextLv)))

		local var_19_1 = var_19_0.totalPay - var_19_0.currentPay

		if var_19_1 < 0 then
			var_19_1 = 0
		end

		recharge.ui.table.needValue:setString(tostring(var_19_1))
		recharge.ui.table.needChongValue:setString(tostring(var_19_1))

		if var_19_1 == 0 then
			recharge.ui.table.shengjixuyao:setVisible(false)
			recharge.ui.table.gold_bg:setVisible(false)
			recharge.ui.table.needValue:setVisible(false)
		end

		if tonumber(var_19_0.currentLv) >= 7 then
			recharge.ui.table.needChongGold:setVisible(false)
			recharge.ui.table.needChongValue:setVisible(false)
		else
			local var_19_2 = {
				1,
				2,
				4,
				6,
				8,
				10,
				12
			}
			local var_19_3 = (var_19_0.nextLv - 1) * recharge.constant.singleItemWidth

			recharge.ui.table.needChongGold:setPosition(ccp(var_19_3 + 30, 275))
			recharge.ui.table.needChongValue:setPosition(ccp(var_19_3 + 90, 275))
			recharge.ui.table.needChongGold:setVisible(true)
			recharge.ui.table.needChongValue:setVisible(true)
		end

		recharge.control.privileges = {}
		recharge.control.privileges[1] = var_19_0.privileges[1][1]
		recharge.control.privileges[2] = var_19_0.privileges[2][1]
		recharge.control.privileges[3] = var_19_0.privileges[2][2]
		recharge.control.privileges[4] = var_19_0.privileges[3][1]
		recharge.control.privileges[5] = var_19_0.privileges[3][2]
		recharge.control.privileges[6] = var_19_0.privileges[4][1]
		recharge.control.privileges[7] = var_19_0.privileges[4][2]
		recharge.control.privileges[8] = var_19_0.privileges[5][1]
		recharge.control.privileges[9] = var_19_0.privileges[5][2]
		recharge.control.privileges[10] = var_19_0.privileges[6][1]
		recharge.control.privileges[11] = var_19_0.privileges[6][2]
		recharge.control.privileges[12] = var_19_0.privileges[7][1]

		if var_19_0.privileges[8] and var_19_0.privileges[8][1] then
			recharge.control.privileges[13] = var_19_0.privileges[8][1]
		end

		if var_19_0.privileges[9] and var_19_0.privileges[9][2] then
			recharge.control.privileges[14] = var_19_0.privileges[9][2]
		end

		if var_19_0.privileges[10] and var_19_0.privileges[10][1] then
			recharge.control.privileges[15] = var_19_0.privileges[10][1]
		end

		recharge.control.updateScrollView(recharge.control.privileges)
		recharge.ui.table.layer:setVisible(true)

		if recharge.control.isChongZhiLayer == true then
			recharge.ui.table.currentGoldValue:setString(language.get(142006, user.player.gold))
		end
	end
end

function recharge.control.checkShowFirstPay(arg_20_0)
	recharge.ui.table.iconBg:setVisible(not arg_20_0)
	recharge.ui.table.icon:setVisible(not arg_20_0)
	recharge.ui.table.vip:setVisible(not arg_20_0)
	recharge.ui.table.vipValue:setVisible(not arg_20_0)
	recharge.ui.table.percentBg:setVisible(not arg_20_0)
	recharge.ui.table.percent:setVisible(not arg_20_0)
	recharge.ui.table.percentValue:setVisible(not arg_20_0)
	recharge.ui.table.shengjixuyao:setVisible(not arg_20_0)
	recharge.ui.table.gold_bg:setVisible(not arg_20_0)
	recharge.ui.table.needValue:setVisible(not arg_20_0)
	recharge.ui.table.firstPayPic:setVisible(arg_20_0)
	recharge.ui.table.scjl_scrollView:setVisible(arg_20_0)
	recharge.ui.table.scjl_bg:setVisible(arg_20_0)
	recharge.ui.table.scjl_dark:setVisible(arg_20_0)
end

function recharge.control.gotResult(arg_21_0)
	if arg_21_0.action.state == 1 then
		if arg_21_0.action.data.ErrorMessage ~= nil then
			smgr.showTipText(arg_21_0.action.data.ErrorMessage)
		elseif recharge.ui.table["item_huode_" .. recharge.control.currentIdx] then
			recharge.ui.table["item_huode_" .. recharge.control.currentIdx]:setVisible(true)
		end
	end
end

function recharge.control.click_got(arg_22_0)
	local var_22_0 = {
		"1_1",
		"2_1",
		"2_2",
		"3_1",
		"3_2",
		"4_1",
		"4_2",
		"5_1",
		"5_2",
		"6_1",
		"6_2",
		"7_1",
		"8_1",
		"9_2",
		"10_1"
	}

	recharge.control.currentIdx = arg_22_0

	cmgr.sendRequest(recharge.control.gotResult, actions.getVipPrivilege, var_22_0[arg_22_0])
end

function recharge.control.getVipInfo()
	cmgr.sendRequest(recharge.control.update, actions.getVipInfo)
end
