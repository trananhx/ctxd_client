dayReward = {}

tool.requireRes("dayReward")
require("lua/component/timerLabel")

dayReward.ui = {}
dayReward.ui.passTime = 0
dayReward.ui.clicked = false

function dayReward.ui.onTouch(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0 == CCTOUCHBEGAN then
		-- block empty
	elseif arg_1_0 == CCTOUCHENDED then
		local var_1_0 = arg_1_1 - visibleSize.width / 2
		local var_1_1 = arg_1_2 - visibleSize.height / 2

		if var_1_0 > -465 and var_1_0 < 465 and var_1_1 > -206 and var_1_1 < 206 then
			-- block empty
		else
			dayReward.ui.exit()
		end
	end

	return true
end

function dayReward.ui.exit()
	if dayReward.ui.updateSchedulerEntry ~= nil then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(dayReward.ui.updateSchedulerEntry)

		dayReward.ui.updateSchedulerEntry = nil
	end

	smgr.getLayer("topLayer"):removeChild(dayReward.ui.table.layer, true)

	if dayReward.ui.clicked == true then
		eventManager.dispatchEvent("replyDayReward")
	end
end

function dayReward.ui.update(arg_3_0)
	dayReward.ui.passTime = dayReward.ui.passTime + arg_3_0

	local var_3_0 = {
		0.1,
		0.7,
		1.6
	}

	for iter_3_0 = 1, 3 do
		if iter_3_0 == 1 and user.havePay0805Buff then
			-- block empty
		elseif dayReward.ui.passTime < var_3_0[iter_3_0] then
			dayReward.ui.table["scrollView_" .. iter_3_0]:setContentOffset(ccp(0, 0))
		elseif dayReward.ui.passTime < var_3_0[iter_3_0] + 3 then
			local var_3_1 = 72 * dayReward.ui.passTime * dayReward.ui.passTime
			local var_3_2 = math.mod(var_3_1, 216)

			dayReward.ui.table["scrollView_" .. iter_3_0]:setContentOffset(ccp(0, -var_3_2))
		elseif dayReward.ui.passTime < var_3_0[iter_3_0] + 3 + dayReward.ui.deltTime[iter_3_0] then
			local var_3_3 = 648 + 432 * (dayReward.ui.passTime - (3 + 0.5 * iter_3_0))
			local var_3_4 = math.mod(var_3_3, 216)

			dayReward.ui.table["scrollView_" .. iter_3_0]:setContentOffset(ccp(0, -var_3_4))
		elseif dayReward.ui.passTime < var_3_0[iter_3_0] + 3 + dayReward.ui.deltTime[iter_3_0] + 3 then
			local var_3_5 = dayReward.ui.passTime - (var_3_0[iter_3_0] + 3 + dayReward.ui.deltTime[iter_3_0])
			local var_3_6 = 648 + 432 * dayReward.ui.deltTime[iter_3_0] + 648 - 72 * (3 - var_3_5) * (3 - var_3_5)
			local var_3_7 = math.mod(var_3_6, 216)

			dayReward.ui.table["scrollView_" .. iter_3_0]:setContentOffset(ccp(0, -var_3_7))
		elseif dayReward.ui.passTime > var_3_0[iter_3_0] + 3 + dayReward.ui.deltTime[iter_3_0] + 3 and iter_3_0 == 3 then
			CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(dayReward.ui.updateSchedulerEntry)

			dayReward.ui.updateSchedulerEntry = nil

			dayReward.ui.table.bg_tips:setVisible(true)
			dayReward.ui.table.btn_try:setEnabled(true)
			dayReward.ui.table.btn_try:setVisible(false)
			dayReward.ui.table.btn_yes:setVisible(true)
			dayReward.ui.table.title_btn:setString(language.get(10001))
			eventManager.dispatchEvent("replyDayReward")
		end
	end
end

function dayReward.ui.update_reward()
	if dayReward.ui.updateSchedulerEntry == nil then
		local var_4_0 = CCDirector:sharedDirector():getScheduler()

		dayReward.ui.updateSchedulerEntry = var_4_0:scheduleScriptFunc(dayReward.ui.update, 0, false)
	end

	dayReward.ui.clicked = true

	if tonumber(dayReward.data.card_quality3) == 7 then
		dayReward.data.card_quality3 = 8
	elseif tonumber(dayReward.data.card_quality3) == 8 then
		dayReward.data.card_quality3 = 9
	elseif tonumber(dayReward.data.card_quality3) == 9 then
		dayReward.data.card_quality3 = 7
	end

	dayReward.ui.passTime = 0
	dayReward.ui.deltTime = {}
	dayReward.ui.deltTime[1] = (tonumber(dayReward.data.card_quality1) - 1) * 72 / 432
	dayReward.ui.deltTime[2] = (tonumber(dayReward.data.card_quality2) - 4) * 72 / 432
	dayReward.ui.deltTime[3] = (tonumber(dayReward.data.card_quality3) - 7) * 72 / 432

	if dayReward.ui.deltTime[2] < dayReward.ui.deltTime[1] then
		dayReward.ui.deltTime[2] = dayReward.ui.deltTime[2] + 0.5
	end

	if dayReward.ui.deltTime[3] < dayReward.ui.deltTime[2] then
		dayReward.ui.deltTime[3] = dayReward.ui.deltTime[3] + 1
	end

	dayReward.ui.table.gold_value:setString(dayReward.data.gold)
	dayReward.ui.table.incense_value:setString(dayReward.data.worship)
	dayReward.ui.table.btn_try:setEnabled(false)
end

function dayReward.ui.create_scroll_list(arg_5_0)
	local var_5_0 = {
		"reward_icon_gold",
		"reward_icon_fete",
		"reward_icon_mult"
	}
	local var_5_1 = createBaseLayer()

	for iter_5_0 = 1, 4 do
		local var_5_2 = iter_5_0

		if iter_5_0 == 4 then
			var_5_2 = 1
		end

		if arg_5_0 == 1 and iter_5_0 == 1 and user.havePay0805Buff then
			var_5_2 = 3
		end

		local var_5_3 = CCSprite:create("res/ui/dayReward/" .. var_5_0[arg_5_0] .. var_5_2 .. ".jpg")

		var_5_3:setPosition(ccp(36, 72 * iter_5_0 - 36))
		var_5_1:addChild(var_5_3)
	end

	local var_5_4 = CCScrollView:create(CCSizeMake(72, 72))

	var_5_4:setContainer(var_5_1)
	var_5_4:setPosition(4, 4)
	var_5_4:setContentSize(CCSizeMake(72, 72))
	var_5_4:setDirection(kCCScrollViewDirectionVertical)
	var_5_4:setContentOffset(ccp(0, 0))

	dayReward.ui.table["scrollView_" .. arg_5_0] = var_5_4

	dayReward.ui.table["frame_" .. arg_5_0]:addChild(var_5_4, 1000)
end

function dayReward.ui.init()
	user.havePay0805Buff = user.pay0805BuffStartCd < 0 and user.pay0805BuffEndCd > 0

	if user.havePay0805Buff then
		dayReward.ui.table.npcPic:setDisplayFrame(CCSprite:create("res/ui/activity/godPaper/czzyb_caishen.png"):displayFrame())
		dayReward.ui.table.npcPic:setScale(0.9)
		dayReward.ui.table.npcPic:setPositionX(-80)
		dayReward.ui.table.msg1:setDisplayFrame(CCSprite:create("res/ui/activity/pay0805/csd_mrdl_word_csd.png"):displayFrame())

		local var_6_0 = CCSprite:create("res/ui/activity/fishing/hjcd_time_line.png")

		var_6_0:setPosition(120, 40)
		dayReward.ui.table.bg:addChild(var_6_0, 100)

		local var_6_1 = math.floor(user.pay0805BuffEndCd / 86400000)
		local var_6_2 = CCSprite:create("res/ui/activity/pay0805/csd_mrdl_word_cshy.png")
		local var_6_3 = CCLabelAtlas:create(tostring(var_6_1), "res/ui/common/number/wdhtz_word_number.png", 26, 36, 48)

		var_6_3:setAnchorPoint(ccp(0.5, 0.5))

		local var_6_4 = CCSprite:create("res/ui/activity/pay0805/csd_mrdl_word_tlq.png")
		local var_6_5 = createRichNode({
			var_6_2,
			var_6_3,
			var_6_4
		}, 0.5)

		var_6_5:setPosition(165, 29)
		var_6_0:addChild(var_6_5)
		dayReward.ui.table.frame_name_1:setString(language.get(131102, 25))
	end

	for iter_6_0 = 1, 3 do
		dayReward.ui.create_scroll_list(iter_6_0)
	end

	dayReward.ui.table.bg_tips:setVisible(false)
	dayReward.ui.table.btn_try:registerScriptTapHandler(dayReward.control.request_dayGiftInfo)
	dayReward.ui.table.btn_yes:registerScriptTapHandler(dayReward.ui.exit)
	dayReward.ui.table.btn_try:setVisible(true)
	dayReward.ui.table.btn_yes:setVisible(false)
	dayReward.ui.table.btn_close:setScale(2)
	dayReward.ui.table.btn_close:registerScriptTapHandler(dayReward.ui.exit)
	dayReward.ui.table.msg1:setOpacity(0)
	dayReward.ui.table.msg2:setOpacity(0)
	dayReward.ui.table.msg3:setOpacity(0)
	dayReward.ui.table.msg1:setVisible(true)
	dayReward.ui.table.msg2:setVisible(true)
	dayReward.ui.table.msg3:setVisible(true)
	dayReward.ui.table.msg1:runAction(CCFadeIn:create(0.5))
	dayReward.ui.table.bg_4:setVisible(false)
	dayReward.ui.table.bg_5:setVisible(false)
end

function dayReward.ui.show()
	rmgr.loadResource("res/ui/technology/dragonTech/dragonTechPic.plist")
	rmgr.loadResource("res/ui/technology/dragonTech/dragonTechPic1.plist")
	rmgr.loadResource("res/ui/technology/technologyPic.plist")
	rmgr.loadResource("res/ui/technology/technologyPic1.plist")

	local var_7_0 = createBaseLayer()

	dayReward.ui.table = autoUI.initUI(var_7_0, getDayRewardData())
	dayReward.ui.table.layer = var_7_0

	var_7_0:registerScriptTouchHandler(dayReward.ui.onTouch, false, true)
	var_7_0:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_7_0, 10002)
	dayReward.ui.init()
	var_7_0:setVisible(true)

	if user.welfare.haveDayGift ~= true and user.haveMineDayGift ~= 0 then
		dayReward.ui.isOpenShowMineDayGift = true
	end

	dayReward.control.getNextTechInfo()
end

function dayReward.ui.initNextTech(arg_8_0)
	if not arg_8_0 then
		dayReward.ui.hasNextTech = false

		return
	end

	dayReward.ui.hasNextTech = true

	dayReward.ui.table.btn_yes:registerScriptTapHandler(dayReward.ui.showNextTech)
	require("lua/layer/technology/dragonTech/constant")
	require("lua/layer/technology/technologyList/constant")

	local function var_8_0(arg_9_0)
		if arg_9_0.type == 1 then
			local var_9_0 = dragonTechConstant.techNamePic[arg_9_0.namePic] or "lm_tit_" .. arg_9_0.namePic .. ".png"

			return "res/ui/common/text/technology/techName/" .. var_9_0
		elseif arg_9_0.type == 2 then
			local var_9_1 = dragonTechConstant.techPic[arg_9_0.pic]

			if not var_9_1 then
				local var_9_2 = "lm_tit_" .. arg_9_0.namePic .. ".png"

				var_9_1 = "res/ui/common/text/technology/techName/" .. var_9_2
			end

			return var_9_1
		end
	end

	local function var_8_1(arg_10_0)
		local var_10_0 = arg_10_0.status
		local var_10_1
		local var_10_2 = false

		if arg_10_0.type == 1 then
			if var_10_0 ~= technologyListConstant.TECH_STATUS_UNOPENED and var_10_0 ~= technologyListConstant.TECH_STATUS_EFFECTED then
				var_10_1 = string.format("tech_icon_%s.jpg", arg_10_0.pic)
				var_10_2 = true
			elseif var_10_0 == technologyListConstant.TECH_STATUS_EFFECTED then
				var_10_1 = string.format("tech_icon_%s.jpg", arg_10_0.pic)
			else
				var_10_1 = var_10_0 == technologyListConstant.TECH_STATUS_UNOPENED and "tech_icon_next.jpg" or "tech_icon_wenhao.jpg"
			end

			if not CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_10_1) then
				var_10_1 = "tech_icon_wenhao.jpg"
				var_10_2 = true
			end
		elseif arg_10_0.type == 2 then
			var_10_1 = var_10_0 == 2 and "tech_icon_next.jpg" or string.format("tech_icon_%s.jpg", arg_10_0.pic)
		end

		return var_10_1, var_10_2
	end

	local function var_8_2(arg_11_0)
		if arg_11_0.type == 1 then
			local var_11_0 = dragonTechConstant.openConditionPic[arg_11_0.openConditionPic] or "lm_tit_" .. arg_11_0.openConditionPic .. ".png"

			return "res/ui/common/text/technology/armyName/" .. var_11_0
		end
	end

	local var_8_3, var_8_4 = var_8_1(arg_8_0)

	dayReward.ui.table.techPic:setDisplayFrame(tool.spriteFrameByName(var_8_3))

	local var_8_5

	if arg_8_0.type == 1 then
		var_8_5 = CCSprite:create(var_8_0(arg_8_0))
	else
		var_8_5 = CCSprite:createWithSpriteFrameName(string.sub(var_8_0(arg_8_0), 7))
	end

	dayReward.ui.table.techName:setDisplayFrame(var_8_5:displayFrame())
	dayReward.ui.table.techInfo:setString(arg_8_0.effect)

	local function var_8_6(arg_12_0)
		if dayReward.ui.table.techState then
			local var_12_0 = {}

			if arg_12_0 == 2 then
				if conf.language == "vie" then
					var_12_0.posX = 50
				else
					var_12_0.posX = 0
				end
			else
				var_12_0.posX = 0
			end

			dayReward.ui.table.techState:setAnchorPoint(ccp(0, 0.5))
			dayReward.ui.table.techState:setPosition(ccp(200 + var_12_0.posX, 150))
			dayReward.ui.table.techBg:addChild(dayReward.ui.table.techState, 200)
		end
	end

	if arg_8_0.type == 1 then
		dayReward.ui.table.techState = CCSprite:create("res/ui/common/text/technology/lm_tit_jb.png")

		local var_8_7 = dayReward.ui.table.techState:getContentSize()
		local var_8_8 = CCSprite:create(var_8_2(arg_8_0))

		dayReward.ui.table.techState:addChild(var_8_8)
		var_8_8:setAnchorPoint(ccp(0, 0.5))
		var_8_8:setPosition(ccp(var_8_7.width, var_8_7.height / 2))

		local var_8_9 = var_8_8:getContentSize()
		local var_8_10 = CCSprite:create("res/ui/common/text/technology/lm_tit_hkq.png")

		var_8_8:addChild(var_8_10)
		var_8_10:setAnchorPoint(ccp(0, 0.5))
		var_8_10:setPosition(ccp(var_8_9.width, var_8_9.height / 2))

		if conf.language == "vie" then
			dayReward.ui.table.techState:setScale(0.75)
			var_8_8:setScale(0.75)
			var_8_10:setScale(0.75)
		end
	elseif arg_8_0.type == 2 then
		dayReward.ui.table.techState = CCLabelAtlas:create(arg_8_0.openConditionPic, "res/ui/common/number/lm_tit_num.png", 22, 32, 48)

		local var_8_11 = dayReward.ui.table.techState:getContentSize()
		local var_8_12 = CCSprite:createWithSpriteFrameName("lm_tit_jkq.png")

		dayReward.ui.table.techState:addChild(var_8_12)

		if conf.language == "vie" then
			var_8_12:setAnchorPoint(ccp(0.5, 0.5))
			var_8_12:setPosition(ccp(var_8_11.width / 2, var_8_11.height / 2))
		else
			var_8_12:setAnchorPoint(ccp(0, 0.5))
			var_8_12:setPosition(ccp(var_8_11.width, var_8_11.height / 2))
		end
	end

	var_8_6(arg_8_0.type)
end

function dayReward.ui.showNextTech()
	dayReward.ui.table.btn_yes:registerScriptTapHandler(dayReward.ui.exit)
	dayReward.ui.table.btn_yes:setEnabled(true)
	dayReward.ui.table.bg_tips:setVisible(false)
	dayReward.ui.table.msg1:setVisible(false)
	dayReward.ui.table.msg3:setVisible(false)
	dayReward.ui.table.msg2:setVisible(true)
	dayReward.ui.table.msg2:runAction(CCFadeIn:create(0.5))
	dayReward.ui.table.bg_1:setVisible(false)
	dayReward.ui.table.bg_2:setVisible(false)
	dayReward.ui.table.bg_3:setVisible(false)
	dayReward.ui.table.bg_4:setVisible(false)
	dayReward.ui.table.bg_5:setVisible(false)
	dayReward.ui.table.techBg:setVisible(true)
end

function dayReward.ui.initMineDayGiftInfo(arg_14_0)
	if arg_14_0 then
		dayReward.ui.table.btn_yes:registerScriptTapHandler(dayReward.ui.showMineDayGift)

		if arg_14_0.freeBigIncenseNum then
			dayReward.ui.table.lock_4:setVisible(false)
			dayReward.ui.table.frame_name_4:setString(language.get(320005, arg_14_0.freeBigIncenseNum))
		else
			dayReward.ui.table.lock_4:setVisible(false)
			dayReward.ui.table.frame_name_4:setString(language.get(320007))
		end

		if arg_14_0.gemNum then
			dayReward.ui.table.lock_5:setVisible(false)
			dayReward.ui.table.frame_name_5:setString(language.get(320006, arg_14_0.gemLv, arg_14_0.gemNum))

			local var_14_0 = math.modf((tonumber(arg_14_0.gemLv) - 1) / 4) + 1

			gemSprite = CCSprite:create("res/ui/weapon/baoshi" .. var_14_0 .. ".jpg")

			local var_14_1 = dayReward.ui.table.frame_5:getContentSize()

			gemSprite:setPosition(ccp(var_14_1.width / 2, var_14_1.height / 2))

			local var_14_2 = math.mod(arg_14_0.gemLv, 4)

			if var_14_2 == 0 then
				var_14_2 = 4
			end

			for iter_14_0 = 1, var_14_2 do
				local var_14_3 = CCSprite:create("res/ui/weapon/xing.png")

				var_14_3:setPosition(15 * iter_14_0, 62)
				var_14_3:setScale(0.5)
				gemSprite:addChild(var_14_3)
			end

			dayReward.ui.table.frame_5:removeAllChildrenWithCleanup(true)
			dayReward.ui.table.frame_5:addChild(gemSprite)
		else
			dayReward.ui.table.lock_5:setVisible(true)
			dayReward.ui.table.frame_name_5:setString(language.get(320008))
		end
	end

	if dayReward.ui.isOpenShowMineDayGift then
		dayReward.ui.table.bg_1:setVisible(false)
		dayReward.ui.table.bg_2:setVisible(false)
		dayReward.ui.table.bg_3:setVisible(false)
		dayReward.ui.table.bg_4:setVisible(false)
		dayReward.ui.table.bg_5:setVisible(false)
		dayReward.ui.showMineDayGift()
	end
end

function dayReward.ui.showMineDayGift()
	if dayReward.ui.hasNextTech == true then
		dayReward.ui.table.btn_yes:registerScriptTapHandler(dayReward.ui.showNextTech)
	else
		dayReward.ui.table.btn_yes:registerScriptTapHandler(dayReward.ui.exit)
	end

	dayReward.ui.table.btn_try:registerScriptTapHandler(dayReward.control.getMineDayGift)
	dayReward.ui.table.btn_yes:setVisible(false)
	dayReward.ui.table.bg_tips:setVisible(false)
	dayReward.ui.table.btn_try:setVisible(true)
	dayReward.ui.table.btn_try:setEnabled(true)
	dayReward.ui.table.title_btn:setString(language.get(230005))
	dayReward.ui.table.msg1:setVisible(false)
	dayReward.ui.table.msg2:setVisible(false)
	dayReward.ui.table.msg3:setVisible(true)
	dayReward.ui.table.msg3:runAction(CCFadeIn:create(0.5))
	dayReward.ui.table.bg_1:setVisible(false)
	dayReward.ui.table.bg_2:setVisible(false)
	dayReward.ui.table.bg_3:setVisible(false)
	dayReward.ui.table.bg_4:setVisible(true)
	dayReward.ui.table.bg_5:setVisible(true)
end

function dayReward.ui.showGetMineDayGift(arg_16_0)
	dayReward.ui.table.btn_try:setVisible(false)
	dayReward.ui.table.btn_try:setEnabled(false)
	dayReward.ui.table.title_btn:setString(language.get(230002))
	dayReward.ui.table.btn_yes:setVisible(true)

	local var_16_0 = {}

	if arg_16_0.freeBigIncenseNum then
		var_16_0[#var_16_0 + 1] = {}
		var_16_0[#var_16_0].id = 10024
		var_16_0[#var_16_0].value = arg_16_0.freeBigIncenseNum
	end

	if arg_16_0.gemNum then
		var_16_0[#var_16_0 + 1] = {}
		var_16_0[#var_16_0].id = 7
		var_16_0[#var_16_0].gemLevel = arg_16_0.gemLv
		var_16_0[#var_16_0].value = arg_16_0.gemNum
	end

	globalAction_gotResource(var_16_0)
end
