actorInfo = {}

tool.requireRes("playerInfo2/actorInfo")

actorInfo.ui = {}
actorInfo.ui.table = {}

local var_0_0 = {}

if conf.language == "kr" then
	var_0_0.guanzhiValueX = 0
	var_0_0.dengjiValueX = 0
	var_0_0.jinyanValueX = 15
elseif conf.language == "vie" then
	var_0_0.guanzhiValueX = 60
	var_0_0.dengjiValueX = 20
	var_0_0.jinyanValueX = 94
else
	var_0_0.guanzhiValueX = 0
	var_0_0.dengjiValueX = 20
	var_0_0.jinyanValueX = 0
end

function actorInfo.ui.init()
	if conf.language == "tw" then
		if channelMgr.getCurrentChannel() == channels.andTwPub then
			actorInfo.ui.table.title_secret_tips:setString("粉絲團")
		elseif channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
			actorInfo.ui.table.title_secret_tips:setString("線上客服")
		else
			actorInfo.ui.table.title_secret_tips:setString("攻略")
		end

		actorInfo.ui.table.title_secret_tips:setVisible(true)
		actorInfo.ui.table.btn_secret_tips:setVisible(true)
		actorInfo.ui.table.btn_secret_tips:registerScriptTapHandler(actorInfo.control.click_secret_tips)
		actorInfo.ui.table.btn_back_player:setPositionY(actorInfo.ui.table.btn_back_player:getPositionY() - 10)
		actorInfo.ui.table.btn_back_server:setPositionY(actorInfo.ui.table.btn_back_server:getPositionY() - 10)
		actorInfo.ui.table.btn_back:setPositionY(actorInfo.ui.table.btn_back:getPositionY() - 10)
		actorInfo.ui.table.title_back_player:setPositionY(actorInfo.ui.table.title_back_player:getPositionY() - 10)
		actorInfo.ui.table.title_back_server:setPositionY(actorInfo.ui.table.title_back_server:getPositionY() - 10)
		actorInfo.ui.table.title_back:setPositionY(actorInfo.ui.table.title_back:getPositionY() - 10)
	end

	local var_1_0 = 520
	local var_1_1 = 730

	actorInfo.ui.table.name:setDimensions(CCSizeMake(220, 40))
	actorInfo.ui.table.name:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	actorInfo.ui.table.name:setHorizontalAlignment(kCCTextAlignmentLeft)
	actorInfo.ui.table.vip:setDimensions(CCSizeMake(220, 40))
	actorInfo.ui.table.vip:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	actorInfo.ui.table.vip:setHorizontalAlignment(kCCTextAlignmentLeft)
	actorInfo.ui.table.guanzhiValue:setDimensions(CCSizeMake(220, 40))
	actorInfo.ui.table.guanzhiValue:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	actorInfo.ui.table.guanzhiValue:setHorizontalAlignment(kCCTextAlignmentLeft)
	actorInfo.ui.table.dengjiValue:setDimensions(CCSizeMake(220, 40))
	actorInfo.ui.table.dengjiValue:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	actorInfo.ui.table.dengjiValue:setHorizontalAlignment(kCCTextAlignmentLeft)
	actorInfo.ui.table.jingyan:setDimensions(CCSizeMake(220, 40))
	actorInfo.ui.table.jingyan:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	actorInfo.ui.table.jingyan:setHorizontalAlignment(kCCTextAlignmentLeft)
	actorInfo.ui.table.fuwuqi:setDimensions(CCSizeMake(420, 40))
	actorInfo.ui.table.fuwuqi:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	actorInfo.ui.table.fuwuqi:setHorizontalAlignment(kCCTextAlignmentLeft)
	actorInfo.ui.table.xuhao:setDimensions(CCSizeMake(420, 40))
	actorInfo.ui.table.xuhao:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	actorInfo.ui.table.xuhao:setHorizontalAlignment(kCCTextAlignmentLeft)
	actorInfo.ui.table.jiaoseID:setDimensions(CCSizeMake(420, 40))
	actorInfo.ui.table.jiaoseID:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	actorInfo.ui.table.jiaoseID:setHorizontalAlignment(kCCTextAlignmentLeft)
	actorInfo.ui.table.jingyanValue:setDimensions(CCSizeMake(320, 40))
	actorInfo.ui.table.jingyanValue:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	actorInfo.ui.table.jingyanValue:setHorizontalAlignment(kCCVerticalTextAlignmentCenter)
	actorInfo.ui.table.name:setPosition(ccp(var_1_0, 420))
	actorInfo.ui.table.vip:setPosition(ccp(var_1_1 + 20, 420))
	actorInfo.ui.table.guanzhiValue:setPosition(ccp(var_1_1 - 20 + var_0_0.guanzhiValueX, 375))
	actorInfo.ui.table.dengjiValue:setPosition(ccp(var_1_0 + 5 + var_0_0.dengjiValueX, 375))
	actorInfo.ui.table.jingyan:setPosition(ccp(var_1_0, 310))
	actorInfo.ui.table.jingyanValue:setPosition(ccp(var_1_1 - 20 + var_0_0.jinyanValueX, 310))
	actorInfo.ui.table.dengjiValue:setPosition(ccp(var_1_0 + 2, 365))
	actorInfo.ui.table.fuwuqi:setPosition(ccp(var_1_0 + 100, 255))
	actorInfo.ui.table.xuhao:setPosition(ccp(var_1_0 + 100, 200))
	actorInfo.ui.table.jiaoseID:setPosition(ccp(var_1_0 + 100, 148))
	actorInfo.ui.table.exp:setMidpoint(CCPointMake(0, 1))
	actorInfo.ui.table.exp:setBarChangeRate(CCPointMake(1, 0))
	actorInfo.ui.table.btn_back_player:registerScriptTapHandler(actorInfo.control.click_backToPlayer)
	actorInfo.ui.table.btn_back_server:registerScriptTapHandler(actorInfo.control.click_backToServer)
	actorInfo.ui.table.btn_renzheng:registerScriptTapHandler(actorInfo.control.click_renzheng)

	if channelMgr.backButtonText == 141010 then
		actorInfo.ui.table.btn_back:registerScriptTapHandler(actorInfo.control.click_showUserCenter)
	else
		actorInfo.ui.table.btn_back:registerScriptTapHandler(actorInfo.control.click_backTologin)
	end

	if conf.language == "tw" or conf.language == "kr" then
		if user.haveShareReward == 1 then
			actorInfo.ui.table.shareButton:setEnabled(true)
			actorInfo.ui.table.shareRewardLabel:setVisible(true)
		else
			actorInfo.ui.table.shareRewardLabel:setVisible(false)
		end
	end

	actorInfo.ui.table.btn_player_center:setVisible(false)
	actorInfo.ui.table.title_player_center:setVisible(false)

	if channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
		actorInfo.ui.table.btn_player_center:registerScriptTapHandler(actorInfo.control.click_showAccountCenter)
		actorInfo.ui.table.btn_player_center:setVisible(true)
		actorInfo.ui.table.title_player_center:setVisible(true)
		actorInfo.ui.table.btn_player_center:setPosition(ccp(650, 110))
		actorInfo.ui.table.title_player_center:setPosition(ccp(650, 110))
		actorInfo.ui.table.snsShareLayer:setVisible(false)
	end

	actorInfo.control.update()
end

function actorInfo.ui.show()
	local var_2_0 = createBaseLayer()

	actorInfo.ui.table = autoUI.initUI(var_2_0, getActorInfoData())
	actorInfo.ui.table.layer = var_2_0

	actorInfo.ui.init()

	return var_2_0
end
