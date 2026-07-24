noviceWantedActivity = {}

tool.requireRes("noviceWantedActivity")
require("lua/component/timerLabel")

noviceWantedActivity.ui = {}

function noviceWantedActivity.ui.exit()
	smgr.getLayer("topLayer"):removeChild(noviceWantedActivity.ui.table.layer, true)
end

function noviceWantedActivity.ui.chong()
	noviceWantedActivity.ui.exit()
	require("lua/layer/playerInfo2/ui")
	playerInfo2.ui.show(2)
end

function noviceWantedActivity.ui.onTouch()
	return true
end

function noviceWantedActivity.ui.update_bar()
	local var_4_0 = #noviceWantedActivity.data.goldArrays

	for iter_4_0 = 1, var_4_0 do
		local var_4_1 = 25 + 810 * iter_4_0 / var_4_0

		if iter_4_0 < var_4_0 then
			local var_4_2 = CCSprite:create("res/ui/noviceWanted/xs_loading_strip.jpg")

			var_4_2:setPosition(ccp(var_4_1, 18))
			noviceWantedActivity.ui.table.bar_bg:addChild(var_4_2, 2)
		end

		local var_4_3 = CCSprite:create("res/ui/noviceWanted/jiebing_yuanbao.png")

		var_4_3:setPosition(ccp(var_4_1 - 20, -20))
		noviceWantedActivity.ui.table.bar_bg:addChild(var_4_3, 2)

		local var_4_4 = CCLabelTTF:create(noviceWantedActivity.data.goldArrays[iter_4_0], "", 20)

		var_4_4:setDimensions(CCSizeMake(100, 40))
		var_4_4:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_4_4:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_4_4:setPosition(var_4_1 + 48, -20)
		noviceWantedActivity.ui.table.bar_bg:addChild(var_4_4, 2)
	end

	local var_4_5 = noviceWantedActivity.ui.calculate()
	local var_4_6 = CCSprite:create("res/ui/noviceWanted/xs_loading_con.jpg")

	var_4_6:setScaleX(var_4_5 - 25)
	var_4_6:setPosition(ccp(25 + (var_4_5 - 25) / 2, 18))
	noviceWantedActivity.ui.table.bar_bg:addChild(var_4_6, 1)

	noviceWantedActivity.ui.table.bar = var_4_6
end

function noviceWantedActivity.ui.calculate()
	local var_5_0 = 0
	local var_5_1 = 0
	local var_5_2 = #noviceWantedActivity.data.goldArrays

	for iter_5_0 = 1, var_5_2 do
		local var_5_3 = noviceWantedActivity.data.goldArrays[1]

		if iter_5_0 > 1 then
			var_5_3 = noviceWantedActivity.data.goldArrays[iter_5_0] - noviceWantedActivity.data.goldArrays[iter_5_0 - 1]
		end

		if noviceWantedActivity.control.total_money >= noviceWantedActivity.data.goldArrays[iter_5_0] then
			var_5_0 = iter_5_0
		else
			local var_5_4 = 0

			if iter_5_0 > 1 then
				var_5_4 = noviceWantedActivity.data.goldArrays[iter_5_0 - 1]
			end

			var_5_1 = (noviceWantedActivity.control.total_money - var_5_4) / var_5_3

			break
		end
	end

	return 25 + 810 * (var_5_0 + var_5_1) / var_5_2
end

function noviceWantedActivity.ui.update_scroll()
	local var_6_0 = #noviceWantedActivity.data.armiesArray
	local var_6_1 = createBaseLayer()

	noviceWantedActivity.control.total_money = 0

	local var_6_2 = {
		"xp",
		"gd",
		"xs",
		"xs",
		"xs",
		"cbp",
		"jd",
		"mh"
	}

	for iter_6_0 = 1, var_6_0 do
		local var_6_3 = noviceWantedActivity.data.armiesArray[iter_6_0]
		local var_6_4 = CCSprite:create("res/ui/noviceWanted/xs_peop_down.jpg")

		var_6_4:setPosition(ccp(97 + 194 * (iter_6_0 - 1), 135))
		var_6_1:addChild(var_6_4)

		local var_6_5 = CCSprite:create("res/ui/noviceWanted/xs_peop_xs_" .. var_6_2[iter_6_0] .. ".png")

		var_6_5:setPosition(ccp(87, 240))
		var_6_4:addChild(var_6_5)

		local var_6_6 = "qWhite.png"

		if var_6_3.quality == 2 then
			var_6_6 = "qBlue.png"
		elseif var_6_3.quality == 3 then
			var_6_6 = "qGreen.png"
		elseif var_6_3.quality == 4 then
			var_6_6 = "qYellow.png"
		elseif var_6_3.quality == 5 then
			var_6_6 = "qRed.png"
		elseif var_6_3.quality == 6 then
			var_6_6 = "qViolet.png"
		end

		local var_6_7 = CCSprite:createWithSpriteFrameName(var_6_6)

		var_6_7:setPosition(ccp(87, 150))
		var_6_4:addChild(var_6_7)

		local var_6_8

		if var_6_3.goldState == 2 then
			var_6_8 = GraySprite:create("res/ui/common/generalPic/generalPic_" .. var_6_3.pic .. ".jpg")
		else
			var_6_8 = CCSprite:create("res/ui/common/generalPic/generalPic_" .. var_6_3.pic .. ".jpg")
		end

		var_6_8:setPosition(ccp(38, 38))
		var_6_7:addChild(var_6_8, 1)

		noviceWantedActivity.ui.table["icon_" .. iter_6_0] = var_6_8

		local var_6_9 = CCSprite:create("res/ui/noviceWanted/xs_peop_up.png")

		var_6_9:setPosition(ccp(36, 13))
		var_6_8:addChild(var_6_9)

		local var_6_10 = CCLabelTTF:create(var_6_3.armiesName, "", 20)

		var_6_10:setPosition(ccp(36, 13))
		var_6_9:addChild(var_6_10)

		local var_6_11 = CCSprite:create("res/ui/noviceWanted/nation_task_draw.png")

		var_6_11:setPosition(ccp(100, 130))
		var_6_4:addChild(var_6_11)

		noviceWantedActivity.ui.table["lingqu_" .. iter_6_0] = var_6_11

		if var_6_3.goldState == 2 then
			-- block empty
		else
			var_6_11:setVisible(false)
		end

		local var_6_12 = CCSprite:create("res/ui/noviceWanted/jiebing_yuanbao.png")
		local var_6_13 = CCSprite:create("res/ui/noviceWanted/resou_up_plus.png")
		local var_6_14 = CCLabelAtlas:create(tostring(var_6_3.gold), "res/ui/activity/weekActivity/resou_up_numb.png", 20, 22, 48)

		var_6_14:setAnchorPoint(ccp(0.5, 0.5))

		local var_6_15 = var_6_14:getContentSize().width
		local var_6_16 = createRichNode({
			var_6_12,
			var_6_13,
			var_6_14
		})

		var_6_16:setPosition(ccp(87 - (53 + var_6_15) / 2, 80))
		var_6_4:addChild(var_6_16)

		if var_6_3.goldState == 2 then
			noviceWantedActivity.control.total_money = noviceWantedActivity.control.total_money + var_6_3.gold
		end

		local var_6_17 = CCSprite:createWithSpriteFrameName("btn3_gre_a.png")
		local var_6_18 = CCSprite:createWithSpriteFrameName("btn3_gre_c.png")
		local var_6_19 = CCSprite:createWithSpriteFrameName("btn3_gre_g.png")
		local var_6_20 = CCMenuItemSprite:create(var_6_17, var_6_18, var_6_19)

		var_6_20:registerScriptTapHandler(noviceWantedActivity.control.click_lingqu)
		var_6_20:setPosition(ccp(87, 32))

		noviceWantedActivity.ui.table["btn_" .. iter_6_0] = var_6_20

		local var_6_21 = CCMenu:create()

		var_6_21:setPosition(ccp(0, 0))
		var_6_21:addChild(var_6_20, 1, iter_6_0)
		var_6_4:addChild(var_6_21)

		local var_6_22 = CCLabelTTF:create("领赏", "", 20)

		var_6_22:setPosition(ccp(87, 32))
		var_6_4:addChild(var_6_22)

		noviceWantedActivity.ui.table["btn_title_" .. iter_6_0] = var_6_22

		if var_6_3.goldState == 0 then
			var_6_20:setEnabled(false)
		elseif var_6_3.goldState == 1 then
			var_6_20:setEnabled(true)
		elseif var_6_3.goldState == 2 then
			var_6_20:setEnabled(false)
			var_6_22:setString("已领赏")
		end
	end

	local var_6_23 = CCScrollView:create(CCSizeMake(845, 280))

	var_6_23:setContainer(var_6_1)
	var_6_23:setPosition(10, 20)
	var_6_23:setContentSize(CCSizeMake(var_6_0 * 194, 269))
	var_6_23:setDirection(kCCScrollViewDirectionHorizontal)
	noviceWantedActivity.ui.table.scroll_bg:addChild(var_6_23, 10)
end

function noviceWantedActivity.ui.update_time()
	local var_7_0 = noviceWantedActivity.data.endTime
	local var_7_1 = math.floor(var_7_0)
	local var_7_2 = createTimerLabel(var_7_1, "@H:@M:@S", "Thonburi-Bold", 24, nil, nil, nil, ccc3(216, 86, 73))

	var_7_2:setPosition(ccp(220, 450))
	noviceWantedActivity.ui.table.bg2:addChild(var_7_2)
end

function noviceWantedActivity.ui.update()
	noviceWantedActivity.ui.update_time()
	noviceWantedActivity.ui.update_scroll()
	noviceWantedActivity.ui.update_bar()
	noviceWantedActivity.ui.table.layer:setVisible(true)
end

function noviceWantedActivity.ui.init()
	noviceWantedActivity.ui.table.btn_exit:setScale(2)
	noviceWantedActivity.ui.table.btn_exit:registerScriptTapHandler(noviceWantedActivity.ui.exit)
end

function noviceWantedActivity.ui.show()
	local var_10_0 = createBaseLayer()

	noviceWantedActivity.ui.table = autoUI.initUI(var_10_0, getNoviceWantedActivityData())
	noviceWantedActivity.ui.table.layer = var_10_0

	var_10_0:registerScriptTouchHandler(noviceWantedActivity.ui.onTouch, false, true)
	var_10_0:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_10_0, 10001)
	noviceWantedActivity.ui.init()
	var_10_0:setVisible(false)
	noviceWantedActivity.control.request_noviceWantInfo()
end
