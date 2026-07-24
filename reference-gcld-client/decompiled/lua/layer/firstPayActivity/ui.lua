firstPayActivity = {}

tool.requireRes("firstPayActivity")
require("lua/component/timerLabel")

firstPayActivity.ui = {}

function firstPayActivity.ui.exit()
	smgr.getLayer("topLayer"):removeChild(firstPayActivity.ui.table.layer, true)
end

function firstPayActivity.ui.chong()
	firstPayActivity.ui.exit()
	require("lua/layer/playerInfo2/ui")
	playerInfo2.ui.show(2)
end

function firstPayActivity.ui.onTouch()
	return true
end

function firstPayActivity.ui.update_reward()
	if user.player.firstPayData.wood ~= nil then
		firstPayActivity.ui.table.item_title_1:setString(language.get(350003, user.player.firstPayData.wood))
	end

	if user.player.firstPayData.copper ~= nil then
		firstPayActivity.ui.table.item_title_2:setString(language.get(350004, user.player.firstPayData.copper))
	end

	if user.player.firstPayData.freeCons ~= nil then
		firstPayActivity.ui.table.item_title_3:setString(language.get(350005, user.player.firstPayData.freeCons))
	end

	if user.player.firstPayData.token ~= nil then
		firstPayActivity.ui.table.item_title_4:setString(language.get(350006, user.player.firstPayData.token))
	end

	firstPayActivity.ui.table.layer:setVisible(true)
end

function firstPayActivity.ui.init()
	local var_5_0 = CCStrokeLabelTTF:create(language.get(350001), "", 26, 2, colorText[10005])

	var_5_0:setColor(ccc3(235, 209, 167))

	local var_5_1 = CCSprite:create("res/ui/firstPayActivity/acti_tit_ryje.png")
	local var_5_2 = CCStrokeLabelTTF:create(language.get(350002), "", 26, 2, colorText[10005])

	var_5_2:setColor(ccc3(235, 209, 167))

	local var_5_3 = createRichNode({
		var_5_0,
		var_5_1,
		var_5_2
	})

	var_5_3:setPosition(ccp(250, 415))
	firstPayActivity.ui.table.bg2:addChild(var_5_3)
	firstPayActivity.ui.table.btn_exit:setScale(2)
	firstPayActivity.ui.table.btn_exit:registerScriptTapHandler(firstPayActivity.ui.exit)
	firstPayActivity.ui.table.btn_chong:registerScriptTapHandler(firstPayActivity.ui.chong)
	firstPayActivity.ui.table.item_title_1:setDimensions(CCSizeMake(400, 80))
	firstPayActivity.ui.table.item_title_2:setDimensions(CCSizeMake(400, 80))
	firstPayActivity.ui.table.item_title_3:setDimensions(CCSizeMake(400, 80))
	firstPayActivity.ui.table.item_title_4:setDimensions(CCSizeMake(400, 80))
	firstPayActivity.ui.table.item_title_1:setHorizontalAlignment(kCCTextAlignmentLeft)
	firstPayActivity.ui.table.item_title_2:setHorizontalAlignment(kCCTextAlignmentLeft)
	firstPayActivity.ui.table.item_title_3:setHorizontalAlignment(kCCTextAlignmentLeft)
	firstPayActivity.ui.table.item_title_4:setHorizontalAlignment(kCCTextAlignmentLeft)
	firstPayActivity.ui.table.item_title_1:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	firstPayActivity.ui.table.item_title_2:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	firstPayActivity.ui.table.item_title_3:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	firstPayActivity.ui.table.item_title_4:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	firstPayActivity.ui.table.item_title_11:setDimensions(CCSizeMake(400, 80))
	firstPayActivity.ui.table.item_title_22:setDimensions(CCSizeMake(400, 80))
	firstPayActivity.ui.table.item_title_33:setDimensions(CCSizeMake(400, 80))
	firstPayActivity.ui.table.item_title_44:setDimensions(CCSizeMake(400, 80))
	firstPayActivity.ui.table.item_title_11:setHorizontalAlignment(kCCTextAlignmentLeft)
	firstPayActivity.ui.table.item_title_22:setHorizontalAlignment(kCCTextAlignmentLeft)
	firstPayActivity.ui.table.item_title_33:setHorizontalAlignment(kCCTextAlignmentLeft)
	firstPayActivity.ui.table.item_title_44:setHorizontalAlignment(kCCTextAlignmentLeft)
	firstPayActivity.ui.table.item_title_11:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	firstPayActivity.ui.table.item_title_22:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	firstPayActivity.ui.table.item_title_33:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	firstPayActivity.ui.table.item_title_44:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
end

function firstPayActivity.ui.show()
	local var_6_0 = createBaseLayer()

	firstPayActivity.ui.table = autoUI.initUI(var_6_0, getFirstPayActivityData())
	firstPayActivity.ui.table.layer = var_6_0

	var_6_0:registerScriptTouchHandler(firstPayActivity.ui.onTouch, false, true)
	var_6_0:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_6_0, 10001)
	firstPayActivity.ui.init()
	var_6_0:setVisible(false)
	firstPayActivity.control.request_firstPayReward()
end
