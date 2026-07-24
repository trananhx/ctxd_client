actorInfo.control = {}

function actorInfo.control.setNationTextrue(arg_1_0)
	local var_1_0 = {
		"blue",
		"red",
		"green"
	}
	local var_1_1

	if arg_1_0 >= 1 and arg_1_0 <= 3 then
		var_1_1 = CCSprite:create("res/ui/playerInfo/nation_flag_" .. var_1_0[arg_1_0] .. ".png")

		local var_1_2 = CCLabelTTF:create(user.forceIdToName[arg_1_0], "", 60)

		var_1_2:setColor(colorForce[0])
		var_1_2:setPosition(85, 130)
		var_1_1:addChild(var_1_2)
	end

	if var_1_1 ~= nil then
		actorInfo.ui.table.bg:addChild(var_1_1, 3)
		var_1_1:setPosition(ccp(830, 413))
		var_1_1:setScale(0.6)
	end
end

function actorInfo.control.setPlayerTextrue(arg_2_0)
	local var_2_0

	if arg_2_0 >= 1 and arg_2_0 <= 6 then
		var_2_0 = "res/ui/common/playerPic/player" .. tostring(arg_2_0) .. ".png"
	end

	if var_2_0 ~= nil then
		local var_2_1 = CCSprite:create(var_2_0)

		actorInfo.ui.table.actor:setDisplayFrame(var_2_1:displayFrame())
		actorInfo.ui.table.actor:setVisible(true)
		actorInfo.ui.table.undisplay:setVisible(false)
	elseif arg_2_0 == 0 then
		local var_2_2 = CCSprite:create(rmgr.getGeneralBust("huanying"))

		actorInfo.ui.table.actor:setDisplayFrame(var_2_2:displayFrame())
		actorInfo.ui.table.actor:setVisible(true)
		actorInfo.ui.table.undisplay:setVisible(false)
	else
		actorInfo.ui.table.actor:setVisible(false)
		actorInfo.ui.table.undisplay:setVisible(true)
	end
end

function actorInfo.control.update()
	actorInfo.control.setNationTextrue(tonumber(user.player.forceId))
	actorInfo.control.setPlayerTextrue(tonumber(user.player.pic))
	actorInfo.ui.table.name:setString(user.player.name)
	actorInfo.ui.table.vip:setString("VIP" .. user.player.vipLv)

	local var_3_0 = user.player.vId

	if conf.language == "vie" or conf.language == "tha" then
		local var_3_1 = string.find(var_3_0, "_")

		var_3_0 = string.sub(var_3_0, var_3_1, string.len(var_3_0))

		if platform.getFlag() == "MOBILE_ANDROID" then
			var_3_0 = "Android" .. var_3_0
		elseif platform.getFlag() == "MOBILE_IPHONE" then
			var_3_0 = "IOS" .. var_3_0
		else
			var_3_0 = "gcld" .. var_3_0
		end
	end

	if conf.debug == true and var_3_0 == nil then
		var_3_0 = "TEST_1234_5678"
	end

	if var_3_0 and var_3_0 ~= "" then
		local var_3_2 = stringSplit(var_3_0, "_")

		if var_3_2[1] and var_3_2[2] then
			log.info(language.get(141011) .. "【" .. var_3_2[1] .. "】" .. var_3_2[2] .. language.get(141014))

			if conf.language == "vie" then
				actorInfo.ui.table.fuwuqi:setString(language.get(141011) .. "【" .. var_3_2[1] .. "】" .. var_3_2[2] .. language.get(141014))
			else
				actorInfo.ui.table.fuwuqi:setString(language.get(141011) .. "【" .. var_3_2[1] .. "】" .. language.get(141014) .. var_3_2[2])
			end

			if channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
				actorInfo.ui.table.fuwuqi:setString(language.get(141011) .. "【" .. var_3_2[1] .. "】" .. user.defaultserverName .. language.get(141014))
			end
		end

		if conf.language == "tw" then
			actorInfo.ui.table.jiaoseID:setString(language.get(141013) .. user.player.userId)
		elseif var_3_2[3] then
			actorInfo.ui.table.jiaoseID:setString(language.get(141013) .. var_3_2[3])
		end

		if channelMgr.currentChannel == channels.andOppo then
			var_3_0 = string.gsub(var_3_0, "^keke_", "oppo_")
		end
	end

	if game.version and game.version.game then
		actorInfo.ui.table.xuhao:setString(language.get(141012) .. game.version.game)
	else
		actorInfo.ui.table.xuhao:setString(language.get(141012) .. "4.3.2.1")
	end

	actorInfo.control.vid = var_3_0

	log.info("@@ vid: ", var_3_0)
	actorInfo.ui.table.guanzhiValue:setString(user.player.nowOfficer)
	actorInfo.ui.table.dengjiValue:setString("Lv." .. user.player.playerLv)
	actorInfo.ui.table.jingyanValue:setString("" .. user.player.exp .. "/" .. user.player.expNeed)

	local var_3_3 = 100 * user.player.exp / user.player.expNeed

	actorInfo.ui.table.exp:setPercentage(var_3_3)

	if user.player.gemKit == true then
		actorInfo.ui.table.jingyanValue:setString("" .. user.player.curKitExp .. "/" .. user.player.maxKitExp)

		local var_3_4 = 100 * user.player.curKitExp / user.player.maxKitExp

		actorInfo.ui.table.exp:setPercentage(var_3_4)
	end

	if user.player.hasBestSuit and user.player.expInfo then
		local var_3_5 = user.player.expInfo

		actorInfo.ui.table.jingyanValue:setString("" .. var_3_5.curValue .. "/" .. var_3_5.maxValue)

		local var_3_6 = math.min(100 * var_3_5.curValue / var_3_5.maxValue, 100)

		actorInfo.ui.table.exp:setPercentage(var_3_6)
	end
end

function actorInfo.control.click_backTologin()
	log.info("@@ 退出游戏")
	CCUserDefault:sharedUserDefault():setBoolForKey("hasEnter", false)
	CCUserDefault:sharedUserDefault():flush()
	statistics.roleLogout(nil, user.player.id, user.player.name, user.player.playerLv, 0)
	cmgr.sendRequestWithoutModal(nil, actions.logout, platform.getFlag())
	guide.ui.setVisible(false)
	smgr.returnToLogin()

	if channelMgr.getCurrentChannel() ~= channels.andTHPocketGame then
		channelMgr.logout()
	end
end

function actorInfo.control.click_showUserCenter()
	log.info("@@显示用户中心")
	channelMgr.logout()
end

function actorInfo.control.click_showAccountCenter()
	channelMgr.showAccountCenter()
end

function actorInfo.control.click_backToPlayer()
	statistics.roleLogout(nil, user.player.id, user.player.name, user.player.playerLv, 0)
	smgr.returnToPlayerList()
	cmgr.sendRequestWithoutModal(nil, actions.logout, platform.getFlag())
	guide.ui.setVisible(false)
end

function actorInfo.control.click_backToServer()
	cmgr.sendRequestWithoutModal(nil, actions.logout, platform.getFlag())
	guide.ui.setVisible(false)

	user.skipSDKStepFlag = true

	log.info("@@ 退出游戏")
	smgr.returnToLogin()
end

function actorInfo.control.getShareReward()
	eventManager.unregisterEvent("shareSucceed", actorInfo.control.getShareReward)
	eventManager.unregisterEvent("shareFailed", actorInfo.control.shareFailed)

	local function var_9_0(arg_10_0)
		if arg_10_0.action.state == 1 then
			local var_10_0 = {
				{}
			}

			var_10_0[1].id = 2
			var_10_0[1].value = arg_10_0.action.data.wood

			globalAction_gotResource(var_10_0)
			actorInfo.ui.table.shareRewardLabel:setVisible(false)

			user.haveShareReward = 0
		end
	end

	log.info("getDailyShareReward !!!!")

	if user.haveShareReward == 1 then
		cmgr.sendRequest(var_9_0, actions.getDailyShareReward)
	end
end

function actorInfo.control.click_renzheng()
	local var_11_0 = {
		y = 0,
		name = "Scene",
		type = "node",
		x = 0,
		children = {
			{
				name = "bg",
				type = "sprite",
				x = visibleSize.width * 0.5,
				y = visibleSize.height * 0.5,
				pic = {
					path = "res/ui/clockReward/clock_view_bg_public.png"
				},
				children = {
					{
						y = 340,
						x = 280,
						type = "sprite",
						pic = {
							path = "res/ui/clockReward/rzxx_title.png"
						}
					},
					{
						y = 200,
						type = "sprite9",
						x = 280,
						preferedSize = CCSizeMake(450, 150),
						middleRect = CCRectMake(20, 20, 50, 50),
						pic = {
							path = "res/ui/common/panel/comm_view.png"
						}
					},
					{
						fontSize = 24,
						name = "yonghuId",
						y = 235,
						type = "label",
						x = 100,
						textId = 141018,
						color = colorText[10002],
						anchorPoint = ccp(0, 0.5)
					},
					{
						fontSize = 24,
						name = "renzhengId",
						y = 180,
						type = "label",
						x = 100,
						color = colorText[10002],
						anchorPoint = ccp(0, 0.5)
					},
					{
						fontSize = 20,
						y = 130,
						type = "label",
						x = 280,
						textId = 141021,
						color = colorQuality[5],
						anchorPoint = ccp(0.5, 0)
					},
					{
						name = "btn_ok",
						h = 54,
						type = "button",
						w = 125,
						y = 55,
						x = 280.0003,
						normal = {
							frame = true,
							path = "btn2_gre_a.png"
						},
						touched = {
							frame = true,
							path = "btn2_gre_c.png"
						},
						children = {
							{
								fontSize = 25,
								y = 27,
								type = "label",
								x = 62,
								textId = 10001,
								color = colorText[10004]
							}
						}
					}
				}
			}
		}
	}
	local var_11_1 = {}

	uiutil.initWidgets(var_11_1, var_11_0)

	local var_11_2 = CCLayer:create()

	swallowTouch(var_11_2)
	smgr.rootLayer:addChild(var_11_2, 60000)
	var_11_2:addChild(var_11_1.widgets.Scene)

	if user.player.userId then
		var_11_1.widgets.yonghuId:setString(language.get(141018) .. user.player.userId)
	end

	var_11_1.widgets.renzhengId:setString(language.get(141019) .. actorInfo.control.vid)
	var_11_1.widgets.btn_ok:addHandleOfControlEvent(function()
		log.info("btn_ok")
		var_11_2:removeFromParentAndCleanup(true)
	end, CCControlEventTouchUpInside)
end

function actorInfo.control.shareFailed()
	eventManager.unregisterEvent("shareFailed", actorInfo.control.shareFailed)
	eventManager.unregisterEvent("shareSucceed", actorInfo.control.getShareReward)
end

function actorInfo.control.shareButtonTap()
	if conf.language == "tw" then
		local var_14_0
		local var_14_1
		local var_14_2
		local var_14_3
		local var_14_4 = "厭倦了抽卡？不喜歡呆萌？還是覺得戰略遊戲最耐玩？來試試最新“國戰”SLG力作《%s》吧，現在手機也可以玩了！想要和好朋友一起征服天下嗎？一起來戰！"

		if channelMgr.getCurrentChannel() == channels.andTwPub then
			var_14_0 = "https://play.google.com/store/apps/details?id=com.pubgame.mgc"
			var_14_1 = "三國志風起蜀漢"
			var_14_2 = "Pubgame"
			var_14_3 = "http://i.imgur.com/GbvVNZ3.png"
			var_14_4 = string.format(var_14_4, "三國志風起蜀漢")
		elseif channelMgr.getCurrentChannel() == channels.andTwGo2Play or channelMgr.getCurrentChannel() == channels.andTwGo2PlayThird then
			var_14_0 = "http://gcld.tw.punchbox.org/m/?fbfrom=1"
			var_14_1 = "天下霸圖"
			var_14_2 = "CHUKONG CO, INC."
			var_14_3 = "http://i.imgur.com/wzEuacb.png"
			var_14_4 = string.format(var_14_4, "攻城掠地")
		else
			var_14_0 = "http://gcld.tw.punchbox.org/m/?fbfrom=1"
			var_14_1 = "攻城掠地"
			var_14_2 = "CHUKONG CO, INC."
			var_14_3 = "http://i.imgur.com/wzEuacb.png"
			var_14_4 = string.format(var_14_4, "攻城掠地")
		end

		ChannelManager:getInstance():snsShare(var_14_0, var_14_1, var_14_2, var_14_3, var_14_4)
		eventManager.registerEvent("shareSucceed", actorInfo.control.getShareReward)
		eventManager.registerEvent("shareFailed", actorInfo.control.shareFailed)
	elseif conf.language == "kr" then
		local var_14_5 = "https://www.facebook.com/k3game"
		local var_14_6 = "K3 모바일"
		local var_14_7 = "I Love Mobile Game Studio."
		local var_14_8 = "http://i.imgur.com/PKDba1w.png?1"
		local var_14_9 = "카드 뽑기 시스템에 질리였죠?큐티한 캐릭도 싫어졌죠?그래도 전략 시뮬레이션이 재미있는가요?지금 모바일로 다시 만나는 K3을 즐겨 보시죠!친구들과 함께 삼국지의 King이 되고 싶나요? 다 같이 초호화 전략 시뮬레이션 <K3 모바일>을 즐깁시다!"

		ChannelManager:getInstance():snsShare(var_14_5, var_14_6, var_14_7, var_14_8, var_14_9)
		eventManager.registerEvent("shareSucceed", actorInfo.control.getShareReward)
		eventManager.registerEvent("shareFailed", actorInfo.control.shareFailed)
	end
end

function actorInfo.control.click_secret_tips()
	if channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
		ChannelManager:getInstance():transform("kefu", "")

		return
	end

	local var_15_0
	local var_15_1 = channelMgr.getCurrentChannel() == channels.andTwPub and "http://www.facebook.com/pubgame.mgc" or "http://www.mofang.com.tw/gcld/"

	CCApplication:sharedApplication():openURL(var_15_1)
end
