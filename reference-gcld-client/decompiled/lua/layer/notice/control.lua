require("lua/layer/notice/constant")
require("lua/game/battle/widget/showJoinOfficerTokenPanel")
require("lua/game/battle/widget/showJoinTeamPanel")
require("lua/layer/clockReward/ui")
require("lua/layer/dayReward/ui")
require("lua/layer/activity/ui")
require("lua/layer/world/barToken/ui")
require("lua/game/battle/widget/showJoinGoldOrderPanel")
require("lua/layer/nation/ui")
require("lua/layer/noviceWantedActivity/ui")
require("lua/layer/welfareNotice/ui")
require("lua/layer/kfwd/ui")
require("lua/layer/kfzb/ui")

notice.control = {}
notice.data = {}
notice.castleIcon = {}

function notice.control.replyClockReward()
	user.noticeList.onlineNum = 0

	notice.control.refreshLayer()
end

function notice.control.replyBarToken()
	user.manWangLing = nil

	notice.control.refreshLayer()
end

function notice.control.refreshLayer()
	notice.control.update()
	notice.ui.update()
end

function notice.control.game_exit()
	notice.control.setDefaultData()
	smgr.hideNotice()
end

function notice.control.enterKfgz()
	log.info("@@ 进入跨服国战==")
	require("lua/manager/kfConnectManager")

	local function var_5_0(arg_6_0)
		kfcmgr.loginkfgz(arg_6_0.action.data)
	end

	cmgr.sendRequest(var_5_0, actions.kfgzSignUp)
end

function notice.control.onFbInviteClick()
	log.info("facebook invite clicked")
	ChannelManager:getInstance():fbInvite("马上加入攻城掠地，万人国战，称王称霸！热血男儿，不容错过！", "攻城掠地", "3金币", "30金币", "60金币", "60金币", "150金币", "https://www.facebook.com/ujoygcld")
end

function notice.control.onInviteClick()
	require("lua/layer/playerInfo2/ui")

	local var_8_0 = 4

	if user.player.playerLv < 7 then
		-- block empty
	else
		var_8_0 = 5
	end

	playerInfo2.ui.show(var_8_0)

	notice.data[7].isVisible = false

	notice.control.refreshLayer()
end

function notice.control.handlePushOfficerToken(arg_9_0)
	log.info("user.curMainTask.taskId: ", user.curMainTask.taskId)

	if not user.getFunc(10) then
		return
	end

	user.noticeList.officerToken = arg_9_0.action.data.tokenInfo.officialNew

	notice.control.refreshLayer()
end

function notice.control.handlePushAttToken(arg_10_0)
	if not user.getFunc(10) then
		return
	end

	if arg_10_0.action.data and arg_10_0.action.data.token then
		user.noticeList.attTokenNum = arg_10_0.action.data.token.attTokenNum or 0
		user.noticeList.attLeftTime = arg_10_0.action.data.token.attLeftTime or 0

		notice.control.refreshLayer()
	end
end

function notice.control.receive_teamInfo(arg_11_0)
	local var_11_0 = arg_11_0.action.data.teamList

	if #var_11_0 == 1 and var_11_0[1].creatorName == user.player.name then
		notice.data[1].submenu[1].isVisible = false
	else
		notice.data[1].submenu[1].isVisible = true
	end

	notice.ui.update()
end

function notice.control.request_teamInfo()
	cmgr.sendRequest(notice.control.receive_teamInfo, actions.getTeamInfo)
end

function notice.control.handlePushCastle(arg_13_0)
	if arg_13_0.action.data and arg_13_0.action.data.castleIcon then
		notice.castleIcon = arg_13_0.action.data.castleIcon or {}

		notice.control.update()
		notice.ui.update()
	end
end

function notice.control.handlerPushJungongEventAction(arg_14_0)
	local var_14_0 = arg_14_0.action.data

	if var_14_0.lcxxReward then
		user.player.lcxxReward = var_14_0.lcxxReward
	end
end

function notice.control.handlePushPlayer(arg_15_0)
	if isExpUpdate(arg_15_0) then
		return
	end

	local var_15_0 = require("lua/common/json")

	log.info("-------> ", var_15_0.encode(arg_15_0))

	local var_15_1 = arg_15_0.action.data.update

	user.activity = user.activity or {}

	if var_15_1 then
		local var_15_2 = false

		if var_15_1.batTeamNum then
			user.noticeList.batTeamNum = var_15_1.batTeamNum
			var_15_2 = true
		elseif var_15_1.hasGoldOrder then
			user.hasGoldOrder = var_15_1.hasGoldOrder
			var_15_2 = true
		elseif var_15_1.tryTasks then
			user.curTryTask = var_15_1.tryTasks
			var_15_2 = true
		end

		if var_15_1.remainNumber then
			user.noticeList.onlineNum = var_15_1.remainNumber
			var_15_2 = true
		end

		if var_15_1.endTime then
			user.activity.endTime = var_15_1.endTime
			var_15_2 = true
		end

		if var_15_1.inkfwd then
			user.inkfwd = var_15_1.inkfwd
			var_15_2 = true

			eventManager.dispatchEvent("kfwdStateDidChanged")
		end

		if var_15_1.kfgzState then
			user.kfgzState = var_15_1.kfgzState
		end

		if var_15_1.kfzbState then
			user.kfzbState = var_15_1.kfzbState
			var_15_2 = true
		end

		if var_15_1.supplyIcon ~= nil then
			user.supplyIcon = var_15_1.supplyIcon
			var_15_2 = true
		end

		if var_15_1.didiIcon ~= nil then
			user.didiIcon = var_15_1.didiIcon
			var_15_2 = true
		end

		local var_15_3 = var_15_1.isDivided and var_15_1.isDivided == 1

		if var_15_3 then
			user.isSoldiersThreeRoad = var_15_3
			user.kfRoadId = var_15_1.roadId or 0
			var_15_2 = true
		end

		if var_15_1.ycbwEvent then
			user.ycbwEvent = var_15_1.ycbwEvent and var_15_1.ycbwEvent == 1
			var_15_2 = true
		end

		if var_15_1.firstBeatPowerNpc183 then
			user.firstBeatPowerNpc183 = var_15_1.firstBeatPowerNpc183
			var_15_2 = true
		end

		if var_15_1.hasMeteoriteTips then
			user.hasMeteoriteTips = var_15_1.hasMeteoriteTips
			var_15_2 = true
		end

		if var_15_1.haveFeast then
			user.haveFeast = var_15_1.haveFeast
			var_15_2 = true
		end

		if var_15_1.celeNumAdded and user.player.gonghe then
			user.player.gonghe = user.player.gonghe + var_15_1.celeNumAdded
			var_15_2 = true
		end

		if var_15_1.seeNineTreasureIcon and user.player.seeNineTreasureIcon ~= var_15_1.seeNineTreasureIcon then
			user.player.seeNineTreasureIcon = var_15_1.seeNineTreasureIcon
			var_15_2 = true
		end

		if var_15_1.haveYcbwReward and user.player.haveYcbwReward ~= var_15_1.haveYcbwReward then
			user.player.haveYcbwReward = var_15_1.haveYcbwReward
			var_15_2 = true
		end

		if var_15_1.conquerLeftNum and user.player.conquerLeftNum ~= var_15_1.conquerLeftNum then
			user.player.conquerLeftNum = var_15_1.conquerLeftNum
			var_15_2 = true
		end

		if var_15_1.haveFeudPrivilege and user.player.haveFeudPrivilege ~= var_15_1.haveFeudPrivilege then
			user.player.haveFeudPrivilege = var_15_1.haveFeudPrivilege
			user.player.feudPrivilegeNeedNum = var_15_1.feudPrivilegeNeedNum
			user.player.feudPrivilegeLv = var_15_1.feudPrivilegeLv
			var_15_2 = true
		end

		if var_15_1.celeNumReduced and user.player.gonghe then
			user.player.gonghe = user.player.gonghe - var_15_1.celeNumReduced

			if user.player.gonghe < 0 then
				user.player.gonghe = 0
			end

			var_15_2 = true
		end

		if var_15_1.needShowClean ~= nil then
			user.needShowClean = var_15_1.needShowClean
			var_15_2 = true
		end

		if var_15_1.needShowCelebrate ~= nil then
			user.needShowCelebrate = var_15_1.needShowCelebrate
			var_15_2 = true
		end

		if var_15_1.sadStoryCities ~= nil then
			user.sadStoryCities = var_15_1.sadStoryCities

			for iter_15_0, iter_15_1 in pairs(user.sadStoryCities) do
				eventManager.dispatchEvent("guoshang" .. iter_15_1)
			end

			var_15_2 = true
		end

		if var_15_1.displayCatapultIcon then
			user.displayCatapultIcon = var_15_1.displayCatapultIcon

			if user.displayCatapultIcon == 2 then
				roleDialogue.control.loadSpeak(1950)
			end

			var_15_2 = true
		end

		if var_15_1.hasCbhsPower then
			user.hasCbhsPower = var_15_1.hasCbhsPower
			var_15_2 = true
		end

		if var_15_1.kbtaskCong ~= nil then
			user.kbtaskCong = var_15_1.kbtaskCong
			var_15_2 = true
		end

		if var_15_1.signComplete then
			if user.kbLv <= 0 then
				if var_15_1.signComplete == 0 then
					roleDialogue.control.loadSpeak(1970)
				elseif var_15_1.signComplete == 1 then
					roleDialogue.control.loadSpeak(1971)
				end
			elseif user.kbLv == 1 then
				if var_15_1.signComplete == 0 then
					roleDialogue.control.loadSpeak(2020)
				elseif var_15_1.signComplete == 1 then
					roleDialogue.control.loadSpeak(2021)
				end
			elseif user.kbLv == 2 then
				if var_15_1.signComplete == 0 then
					roleDialogue.control.loadSpeak(2111)
				elseif var_15_1.signComplete == 1 then
					roleDialogue.control.loadSpeak(2112)
				end
			end

			if user.signComplete == 0 and var_15_1.signComplete >= 1 and user.kbLv == 3 and user.forceExp == 60 then
				roleDialogue.control.loadSpeak(1579)
			end

			if var_15_1.signComplete == 0 and user.kbLv == 1 then
				-- block empty
			end

			user.signComplete = var_15_1.signComplete
			var_15_2 = true
		end

		if var_15_1.tujinPhantomIcon ~= nil then
			user.tujinPhantomIcon = var_15_1.tujinPhantomIcon
			var_15_2 = true
		end

		if var_15_1.seePromotionIcon ~= nil then
			user.seePromotionIcon = var_15_1.seePromotionIcon
			var_15_2 = true
		end

		if var_15_1.haveMoonCakeActivity == 0 then
			user.moonBuff = nil
			var_15_2 = true
		end

		if var_15_1.mohistTips and var_15_1.mohistTips.firstStartMohistReform then
			smgr.changeScene(SCENE_MAIN_CITY)
			roleDialogue.control.loadSpeak("moJiaBuild3")
		end

		if var_15_1.activityBulletin then
			user.activityBulletin = var_15_1.activityBulletin
			var_15_2 = true
		end

		if var_15_1.mohistIcon then
			user.mohistIconState = var_15_1.mohistIcon.state
			var_15_2 = true
		end

		if var_15_1.startEvokeZgl ~= nil then
			user.startEvokeZgl = var_15_1.startEvokeZgl
			var_15_2 = true
		end

		if var_15_1.readyEvokeZgl ~= nil then
			user.readyEvokeZgl = var_15_1.readyEvokeZgl
			var_15_2 = true
		end

		if var_15_1.officialNew and user.getFunc(10) then
			user.noticeList.officerToken = var_15_1.officialNew
			var_15_2 = true
		end

		if var_15_1.silkGoodsNotify ~= nil then
			user.silkGoodsNotify = var_15_1.silkGoodsNotify
			var_15_2 = true
		end

		if var_15_1.hasDrillTimes then
			user.welfare.setWelfareSimple("dayTrain", var_15_1.hasDrillTimes)

			var_15_2 = true
		end

		if var_15_1.attTokenNum then
			user.noticeList.attTokenNum = var_15_1.attTokenNum
			var_15_2 = true
		end

		if var_15_1.attLeftTime then
			user.noticeList.attLeftTime = var_15_1.attLeftTime
			var_15_2 = true
		end

		if var_15_1.kingNotice then
			user.kingNotice = var_15_1.kingNotice
			var_15_2 = true
		end

		if var_15_1.heroEventZglIcon then
			user.heroEventZglIcon = var_15_1.heroEventZglIcon
			var_15_2 = true
		end

		if var_15_1.haveNewServerFeedbackActivity then
			user.haveXfhk = var_15_1.haveNewServerFeedbackActivity
			var_15_2 = true
		end

		if var_15_1.haveQuizActivity then
			user.haveQuizActivity = var_15_1.haveQuizActivity
			var_15_2 = true
		end

		if var_15_1.haveRecallActivity then
			user.haveHghd = var_15_1.haveRecallActivity
			var_15_2 = true
		end

		if var_15_2 == true then
			notice.control.update()
			notice.ui.update()
		end

		for iter_15_2, iter_15_3 in pairs(arg_15_0.action.data.update) do
			if iter_15_2 == "remainNumber" then
				iter_15_2 = "onlineNum"
			end

			if user.welfare[iter_15_2] ~= nil then
				user.welfare.setWelfare(iter_15_2, iter_15_3)
				log.info("更新福利提醒信息: ", iter_15_2, iter_15_3)
			end
		end

		if var_15_1.freeConsNum and resourceAreaUI ~= nil then
			resourceAreaUI.update_goldCount(var_15_1.freeConsNum)
		end

		if var_15_1.personalCorpsOpen then
			user.personalCorpsOpen = var_15_1.personalCorpsOpen
			user.freePersonalCorpsTimes = var_15_1.freePersonalCorpsTimes
		end
	end
end

function notice.control.setDefaultData()
	notice.data = {
		{
			outside = true,
			image = "icon_hlqx",
			isVisible = false,
			id = notice.constant.haolingqunxiong,
			callback = notice.control.openHaolingqunxiong,
			submenu = {
				{
					image = "icon_jtj",
					isVisible = false,
					id = notice.constant.team,
					callback = notice.control.openTeam
				},
				{
					image = "icon_zzl",
					isVisible = false,
					id = notice.constant.goldOrder,
					callback = notice.control.openGoldOrder
				},
				{
					image = "icon_gyl",
					isVisible = false,
					id = notice.constant.token,
					callback = notice.control.openToken
				},
				{
					image = "icon_zyl",
					isVisible = false,
					id = notice.constant.zhiyuanOrder,
					callback = notice.control.openZhiyuan
				}
			}
		},
		{
			outside = true,
			image = "icon_hd",
			isVisible = false,
			id = notice.constant.activity,
			callback = activityUI.show
		},
		{
			outside = true,
			image = "icon_qgrw",
			isVisible = false,
			id = notice.constant.quanguorenwu,
			callback = notice.control.openGuojiarenwu,
			submenu = {
				{
					image = "icon_mwl",
					isVisible = false,
					id = notice.constant.barToken,
					callback = notice.control.barToken
				},
				{
					image = "icon_gjsl",
					isVisible = false,
					id = notice.constant.nationTry,
					callback = notice.control.openNationTry
				},
				{
					image = "icon_gjsj",
					isVisible = false,
					id = notice.constant.nationLevelUp,
					callback = notice.control.openNationLevelUp
				}
			}
		},
		{
			outside = true,
			image = "icon_welfare",
			isVisible = false,
			id = notice.constant.welfareNotice,
			callback = welfareNoticeUI.show
		},
		{
			image = "xflts_icon",
			isVisible = false,
			id = notice.constant.kfwdNotice,
			callback = kfwdUI.show
		},
		{
			image = "icon_kfgz",
			isVisible = false,
			id = notice.constant.kfgz,
			callback = notice.control.enterKfgz
		},
		{
			image = "icon_khuizhan",
			isVisible = false,
			id = notice.constant.huizhan,
			callback = notice.control.huizhanInfo
		},
		{
			image = "icon_hzzj",
			isVisible = false,
			id = notice.constant.huizhanGather,
			callback = notice.control.huizhanGather
		},
		{
			image = "icon_sansejinn",
			isVisible = false,
			id = notice.constant.sansejinnang,
			callback = notice.control.sansejinnang
		},
		{
			outside = true,
			image = "icon_kfzb",
			isVisible = false,
			id = notice.constant.kfzb,
			callback = kfzbUI.show
		},
		{
			image = "icon_zcsl",
			isVisible = false,
			id = notice.constant.zcsl,
			callback = notice.control.showTelFare
		},
		{
			image = "icon_gonghe",
			isVisible = false,
			id = notice.constant.gonghe,
			callback = notice.control.celebration
		},
		{
			image = "icon_gonghe2",
			isVisible = false,
			id = notice.constant.gonghe2,
			callback = notice.control.celebration
		},
		{
			image = "icon_gonghe3",
			isVisible = false,
			id = notice.constant.gonghe3,
			callback = notice.control.celebration
		},
		{
			image = "icon_gonghe4",
			isVisible = false,
			id = notice.constant.gonghe4,
			callback = notice.control.celebration
		},
		{
			image = "icon_gonghe5",
			isVisible = false,
			id = notice.constant.gonghe5,
			callback = notice.control.celebration
		},
		{
			image = "icon_discount",
			isVisible = false,
			id = notice.constant.discount,
			callback = notice.control.showDiscount
		},
		{
			image = "icon_invite",
			isVisible = false,
			id = notice.constant.invite,
			callback = notice.control.onInviteClick
		},
		{
			image = "icon_flzp",
			isVisible = false,
			id = notice.constant.flzp,
			callback = notice.control.showBigRotary
		},
		{
			image = "icon_schl",
			isVisible = false,
			id = notice.constant.schl,
			callback = notice.control.showFirstPay
		},
		{
			image = "icon_limitedEditionGift",
			isVisible = false,
			id = notice.constant.limitedEditionGift,
			callback = notice.control.showLimitedEditionGiftPanel
		},
		{
			image = "icon_zhmd",
			isVisible = false,
			id = notice.constant.zhmd,
			callback = notice.control.showBetrayListPanel
		},
		{
			image = "icon_jzkz",
			isVisible = false,
			id = notice.constant.jzkz,
			callback = notice.control.showBetrayRewardPanel
		},
		{
			image = "icon_flzp",
			isVisible = false,
			id = notice.constant.flzp2,
			callback = notice.control.showZhuanPanPanel
		},
		{
			image = "icon_ddsq",
			isVisible = false,
			id = notice.constant.ddsq,
			callback = notice.control.showDidiPanel
		},
		{
			image = "icon_shong",
			isVisible = false,
			id = notice.constant.havePayRedBagActivity,
			callback = notice.control.havePayRedBagActivity
		},
		{
			image = "icon_lqll",
			isVisible = false,
			id = notice.constant.lqll,
			callback = notice.control.showDataRewardPanel
		},
		{
			image = "icon_zlp",
			isVisible = false,
			id = notice.constant.stfx,
			callback = notice.control.showSaoTaoPanel
		},
		{
			image = "icon_tcqg",
			isVisible = false,
			id = notice.constant.tcqg,
			callback = notice.control.showTuChengCelebratePanel
		},
		{
			outside = true,
			image = "icon_tcgs",
			isVisible = false,
			id = notice.constant.tcgs,
			callback = notice.control.gotoSadStoryCities
		},
		{
			outside = true,
			image = "icon_xzyl",
			isVisible = false,
			id = notice.constant.xzyl,
			callback = notice.control.showDownloadDetailView
		},
		{
			image = "icon_fbgg",
			isVisible = false,
			id = notice.constant.ggts,
			callback = notice.control.showKingNotice
		},
		{
			image = "icon_jkmw",
			isVisible = false,
			id = notice.constant.jkmw,
			callback = notice.control.openFogActivityPanel
		},
		{
			image = "icon_kfyz",
			isVisible = false,
			id = notice.constant.kfyz
		},
		{
			image = "icon_sczl",
			isVisible = false,
			id = notice.constant.sczl,
			callback = notice.control.showSilk
		},
		{
			image = "icon_sjfb",
			isVisible = false,
			id = notice.constant.sjfb,
			callback = notice.control.showWorldFuBen
		},
		{
			image = "icon_scpm",
			isVisible = false,
			id = notice.constant.scpm,
			callback = notice.control.showSilkMarket
		},
		{
			image = "icon_tsc",
			isVisible = false,
			id = notice.constant.plc,
			callback = notice.control.showPiLiChe
		},
		{
			image = "icon_zyjx",
			isVisible = false,
			id = notice.constant.zyjc,
			callback = notice.control.gotoZhouyuJx
		},
		{
			image = "icon_zgzl",
			isVisible = false,
			id = notice.constant.zgzl,
			callback = notice.control.showZhugongZHaoling
		},
		{
			image = "icon_qgy",
			isVisible = false,
			id = notice.constant.qgy,
			callback = notice.control.gotoKbFeast
		},
		{
			image = "icon_mhbg",
			isVisible = false,
			id = notice.constant.mhbg,
			callback = notice.control.showChangeName
		},
		{
			image = "icon_jlfb",
			isVisible = false,
			id = notice.constant.jlfb,
			callback = notice.control.showGemBonus
		},
		{
			outside = true,
			image = "icon_jzcl",
			isVisible = false,
			id = notice.constant.jzcl,
			callback = notice.control.showJzcl
		},
		{
			outside = true,
			image = "icon_jzgs",
			isVisible = false,
			id = notice.constant.jzgs,
			callback = notice.control.showJzgs
		},
		{
			image = "icon_lsqs",
			isVisible = false,
			id = notice.constant.lsqs,
			callback = notice.control.foodQiangshou
		},
		{
			image = "icon_fdnz",
			isVisible = false,
			id = notice.constant.fdnz,
			callback = notice.control.showFeud
		},
		{
			outside = true,
			image = "icon_jqhb",
			isVisible = false,
			id = notice.constant.jqhb,
			callback = notice.control.showJqhb
		},
		{
			image = "icon_tshy",
			isVisible = false,
			id = notice.constant.tshy,
			callback = notice.control.showSpecialPhantom
		},
		{
			outside = true,
			image = "icon_djjy",
			isVisible = false,
			id = notice.constant.djjy,
			callback = notice.control.showFeudSeal
		},
		{
			image = "icon_jzcl1",
			isVisible = false,
			id = notice.constant.jzcl1,
			callback = notice.control.showBuildReward
		},
		{
			image = "icon_wgjj",
			isVisible = false,
			id = notice.constant.wgjj,
			callback = notice.control.onClickPromotion
		},
		{
			image = "icon_wdqg",
			isVisible = false,
			id = notice.constant.wdqg,
			callback = notice.control.showKfzbCele
		},
		{
			image = "icon_zqqf",
			isVisible = false,
			id = notice.constant.zqqf,
			callback = notice.control.showMoonBuffPanel
		},
		{
			image = "icon_zgljx",
			isVisible = false,
			id = notice.constant.zgljx,
			callback = notice.control.showZgljx
		},
		{
			image = "icon_yzmz",
			isVisible = false,
			id = notice.constant.yzmz,
			callback = notice.control.showKfyzNoDisturb
		},
		{
			image = "icon_dlzb",
			isVisible = false,
			id = notice.constant.dlzb,
			callback = notice.control.clickDiliuZhengbao
		},
		{
			outside = true,
			image = "icon_jtmj",
			isVisible = false,
			id = notice.constant.jtmj,
			callback = notice.control.showCorpsPanel
		},
		{
			image = "icon_xhdjx",
			isVisible = false,
			id = notice.constant.xhdjx,
			callback = notice.control.showXhdjx
		},
		{
			image = "icon_lcxx",
			isVisible = false,
			id = notice.constant.lcxx,
			callback = notice.control.showLcxx
		},
		{
			image = "icon_dqzb",
			isVisible = false,
			id = notice.constant.dqzb,
			callback = notice.control.clickDiQiZhengbao
		},
		{
			image = "icon_mjjs",
			isVisible = false,
			id = notice.constant.mjjs,
			callback = notice.control.manjiJiaoshi
		},
		{
			image = "icon_dbzb",
			isVisible = false,
			id = notice.constant.dbzb,
			callback = notice.control.clickDiBaZhengbao
		},
		{
			image = "icon_jz",
			isVisible = false,
			id = notice.constant.jzicon,
			callback = notice.control.clickJiaoZhen
		},
		{
			image = "icon_yz",
			isVisible = false,
			id = notice.constant.yzicon,
			callback = notice.control.clickYingZhan
		},
		{
			image = "icon_lz",
			isVisible = false,
			id = notice.constant.lzicon,
			callback = notice.control.clickLeiZhu
		},
		{
			image = "icon_zzdx",
			isVisible = false,
			id = notice.constant.zzdx,
			callback = notice.control.clickHeroEventZglIcon
		},
		{
			image = "icon_lxzc_01",
			isVisible = false,
			id = notice.constant.lxgcicon1,
			callback = notice.control.clickLXGC
		},
		{
			image = "icon_lxzc_02",
			isVisible = false,
			id = notice.constant.lxgcicon2,
			callback = notice.control.clickLXGC
		},
		{
			image = "icon_lxzc_03",
			isVisible = false,
			id = notice.constant.lxgcicon3,
			callback = notice.control.clickLXGC
		},
		{
			image = "icon_fdtq",
			isVisible = false,
			id = notice.constant.fdtqicon,
			callback = notice.control.clickFdtq
		},
		{
			image = "icon_cdsh",
			isVisible = false,
			id = notice.constant.cdsh,
			callback = notice.control.showCdsh
		},
		{
			image = "icon_mrjc",
			isVisible = false,
			id = notice.constant.ayjc,
			callback = notice.control.showAyjc
		},
		{
			image = "icon_kfmg",
			isVisible = false,
			id = notice.constant.kfmg,
			callback = notice.control.enterKfmg
		},
		{
			image = "icon_gnjx",
			isVisible = false,
			id = notice.constant.gnjxicon,
			callback = notice.control.clickGNJX
		},
		{
			image = "icon_mood",
			isVisible = false,
			id = notice.constant.moodicon,
			callback = notice.control.clickMood
		},
		{
			image = "icon_league",
			isVisible = false,
			id = notice.constant.leagueicon,
			callback = notice.control.clickLeague
		},
		{
			image = "icon_xfhk",
			isVisible = false,
			id = notice.constant.xfhk,
			callback = notice.control.clickXfhk
		},
		{
			image = "icon_huigui",
			isVisible = false,
			id = notice.constant.hghd,
			callback = notice.control.clickHuigui
		},
		{
			outside = true,
			image = "icon_zz",
			isVisible = false,
			id = notice.constant.zzyb,
			callback = notice.control.clickZZ
		},
		{
			outside = true,
			image = "icon_castingsj",
			isVisible = false,
			id = notice.constant.tjsj,
			callback = notice.control.clickZZ
		},
		{
			image = "icon_djzb",
			isVisible = false,
			id = notice.constant.djzb,
			callback = notice.control.clickDjzb
		},
		{
			image = "icon_ltzb0",
			isVisible = false,
			id = notice.constant.ltzb0,
			callback = notice.control.clickArenaMatch0
		},
		{
			image = "icon_ltzb1",
			isVisible = false,
			id = notice.constant.ltzb1,
			callback = notice.control.clickArenaMatch1
		},
		{
			image = "icon_jbyw",
			isVisible = false,
			id = notice.constant.jbyw,
			callback = notice.control.openDrill
		},
		{
			image = "icon_jxc",
			isVisible = false,
			id = notice.constant.jxc,
			callback = notice.control.openSupply
		},
		{
			image = "icon_ybcc",
			isVisible = false,
			id = notice.constant.ybcc,
			callback = notice.control.openYBCC
		},
		{
			image = "icon_grjt",
			isVisible = false,
			id = notice.constant.grjt,
			callback = notice.control.openGRJT
		},
		{
			image = "icon_lvjx",
			isVisible = false,
			id = notice.constant.lbjxicon,
			callback = notice.control.clickLBJX
		},
		{
			image = "icon_dzzc",
			isVisible = false,
			id = notice.constant.carTechOpen,
			callback = notice.control.openChariotTech
		},
		{
			image = "icon_dzzc",
			isVisible = false,
			id = notice.constant.carDoOpen,
			callback = notice.control.openChariotPanel
		},
		{
			image = "icon_pcts",
			isVisible = false,
			id = notice.constant.didiIcon,
			callback = notice.control.openSilkCarpool
		},
		{
			outside = true,
			image = "icon_gjgs",
			isVisible = false,
			id = notice.constant.gjgsIcon,
			callback = notice.control.openBuildWorld
		},
		{
			outside = true,
			image = "icon_gjgs2",
			isVisible = false,
			id = notice.constant.gjgsIcon2,
			callback = notice.control.openCloseWorld
		},
		{
			outside = true,
			image = "icon_tssj",
			isVisible = false,
			id = notice.constant.tssj,
			callback = notice.control.openSpecialEvent
		},
		{
			image = "icon_yzsx",
			isVisible = false,
			id = notice.constant.yzsx,
			callback = notice.control.getKfyzMedal
		},
		{
			image = "icon_zszy",
			isVisible = false,
			id = notice.constant.zszy,
			callback = notice.control.enterMainCity
		},
		{
			image = "icon_yyjx",
			isVisible = false,
			id = notice.constant.yyjx,
			callback = notice.control.clickHYYJX
		},
		{
			outside = true,
			image = "icon_hd",
			isVisible = false,
			id = notice.constant.activity1,
			callback = notice.control.showActivity1
		},
		{
			outside = true,
			image = "icon_hd",
			isVisible = false,
			id = notice.constant.activity2,
			callback = notice.control.showActivity2
		},
		{
			outside = true,
			image = "icon_znq",
			isVisible = false,
			id = notice.constant.znqAct,
			callback = notice.control.showZnqAct
		},
		{
			outside = true,
			image = "icon_zqjc",
			isVisible = false,
			id = notice.constant.zqjc,
			callback = notice.control.showZQJC
		}
	}
end

function notice.control.init()
	notice.control.setDefaultData()
	notice.control.update()
end

function notice.control.updateIconXZYL()
	local var_18_0 = rmgr.isNotComplete()

	notice.data[31].isVisible = false

	if tool.cmpVersion("2.0.2.0", game.version.client) and CCUserDefault:sharedUserDefault():getIntegerForKey("inComplete") == 1 then
		notice.data[31].isVisible = (var_18_0 or user.hasHotSwapGift == 1) and user.player.playerLv > 17

		if notice.data[31].isVisible then
			require("lua/manager/updateManager")

			if updateManager.state == updateManager.constant.state.no then
				updateManager.init()
			end
		end
	end

	if channelMgr.getCurrentChannel() == channels.iosplay800 or channelMgr.getCurrentChannel() == channels.iosAppstore or channelMgr.getCurrentChannel() == channels.iosappstore30lv or channelMgr.getCurrentChannel() == channels.iosmouding then
		local var_18_1 = versionUpdateConstant.file.version

		reload(var_18_1)

		local var_18_2 = sys_version

		if game.newVersion.appStoreCode == var_18_2.appStoreCode then
			notice.data[31].isVisible = false
		end
	end
end

function notice.control.update()
	if rmgr.isNotCompleteAndHighLevel() then
		notice.control.updateIconXZYL()

		return
	end

	if #notice.data == 0 then
		return
	end

	local var_19_0 = rmgr.isNotComplete()

	user.activity = user.activity or {}

	if user.noticeList.batTeamNum ~= nil then
		if user.noticeList.batTeamNum == 1 then
			notice.control.request_teamInfo()
		else
			notice.data[1].submenu[1].isVisible = user.noticeList.batTeamNum > 0

			if var_19_0 then
				notice.data[1].submenu[1].isVisible = false
			end
		end
	end

	if user.goldOrderNum ~= nil then
		notice.data[1].submenu[2].isVisible = user.goldOrderNum > 0

		if var_19_0 then
			notice.data[1].submenu[2].isVisible = false
		end
	end

	notice.data[1].submenu[3].isVisible = false
	notice.data[1].submenu[4].isVisible = false

	if user.getFunc(10) == true then
		if user.noticeList.officerToken ~= nil and not var_19_0 and table.getn(user.noticeList.officerToken) > 0 then
			notice.data[1].submenu[3].isVisible = true
		end

		if not var_19_0 and user.noticeList.attTokenNum > 0 then
			notice.data[1].submenu[4].isVisible = true
		end
	end

	user.actMenu = {}

	local var_19_1 = 1
	local var_19_2 = false

	for iter_19_0, iter_19_1 in pairs(activityConstant.TYPES) do
		if user.activity[iter_19_1.key] then
			var_19_2 = true
			user.actMenu[var_19_1] = iter_19_1
			var_19_1 = var_19_1 + 1
		end
	end

	notice.data[99].isVisible = var_19_2
	notice.data[100].isVisible = #user.actMenu > 6
	user.newActivity = user.newActivity or {}

	if #user.actMenu <= 6 then
		notice.data[99].cornerNum = #user.newActivity
	else
		local var_19_3 = 0

		for iter_19_2 = 1, 6 do
			for iter_19_3, iter_19_4 in pairs(user.newActivity) do
				if iter_19_4 == user.actMenu[iter_19_2].id then
					var_19_3 = var_19_3 + 1
				end
			end
		end

		notice.data[99].cornerNum = var_19_3
		notice.data[100].cornerNum = #user.newActivity - var_19_3
	end

	notice.data[101].isVisible = user.activityBulletin and user.activityBulletin == 1
	notice.data[3].submenu[1].isVisible = user.manWangLing ~= nil

	if var_19_0 then
		notice.data[3].submenu[1].isVisible = false
	end

	notice.data[3].submenu[2].isVisible = false

	if not var_19_0 and user.curTryTask and user.curTryTask.state == 0 then
		notice.data[3].submenu[2].isVisible = true
	end

	notice.data[3].submenu[3].isVisible = false

	if not var_19_0 and user.curNationTask and user.curNationTask.tasks then
		for iter_19_5, iter_19_6 in ipairs(user.curNationTask.tasks) do
			if iter_19_6.taskType == 0 then
				notice.data[3].submenu[3].isVisible = true
			end
		end
	end

	if notice.ui.checkIfNeedShowWelfareButton() then
		notice.data[4].isVisible = true
	else
		notice.data[4].isVisible = false
	end

	if user.inkfwd and user.inkfwd ~= 0 and user.inkfwd ~= 4 then
		notice.data[5].isVisible = true
	else
		notice.data[5].isVisible = false
	end

	if not var_19_0 and user.kfgzState and user.kfgzState > 0 then
		notice.data[6].isVisible = true
	else
		notice.data[6].isVisible = false
	end

	if not var_19_0 and user.player.hasHuizhan then
		notice.data[7].isVisible = true
	else
		notice.data[7].isVisible = false
	end

	if not var_19_0 and user.player.hasHuiZhanGatherIcon then
		notice.data[8].isVisible = true
	else
		notice.data[8].isVisible = false
	end

	if user.player.gemKit == true then
		notice.data[9].isVisible = true
	else
		notice.data[9].isVisible = false
	end

	local var_19_4 = notice.data[10]

	if not var_19_0 and user.kfzbState and user.kfzbState > 0 or user.kfzbState == -60 then
		var_19_4.isVisible = true
	else
		var_19_4.isVisible = false
	end

	if user.kfzbZone and user.kfzbZone > 0 then
		var_19_4.image = "icon_jywd"
	else
		var_19_4.image = "icon_kfzb"
	end

	if user.haveTelFareActivity == 1 then
		notice.data[11].isVisible = true
	else
		notice.data[11].isVisible = false
	end

	if user.player.seeNineTreasureIcon and user.player.seeNineTreasureIcon > 0 then
		notice.data[82].isVisible = true
	end

	if user.player.haveYcbwReward then
		notice.data[80].isVisible = false
	end

	if user.player.conquerLeftNum then
		notice.data[68].isVisible = false
		notice.data[69].isVisible = false
		notice.data[70].isVisible = false

		if user.player.conquerLeftNum == 1 then
			notice.data[68].isVisible = true
		end

		if user.player.conquerLeftNum == 2 then
			notice.data[69].isVisible = true
		end

		if user.player.conquerLeftNum == 3 then
			notice.data[70].isVisible = true
		end
	end

	if user.player.showFriendHeadhunter then
		notice.data[76].isVisible = user.player.showFriendHeadhunter
	else
		notice.data[76].isVisible = false
	end

	if user.player.showHostileHeadhunter then
		notice.data[77].isVisible = user.player.showHostileHeadhunter
	else
		notice.data[77].isVisible = false
	end

	if user.player.haveFeudPrivilege then
		notice.data[71].isVisible = user.player.haveFeudPrivilege == 1
	end

	notice.data[12].isVisible = not var_19_0 and user.player.gonghe > 0

	if user.discountCountDown and user.discountCountDown > 0 and user.hasDiscountIcon then
		notice.data[17].isVisible = true
	else
		notice.data[17].isVisible = false
	end

	if user.haveInviteCodeActivity == 1 then
		notice.data[18].isVisible = true
	else
		notice.data[18].isVisible = false
	end

	if not notice.data[18].isVisible and channelMgr.currentChannel == channels.iosAppstore and user.openInviteCode == 1 and user.haveInvite == 1 then
		local var_19_5 = versionUpdateConstant.file.version

		reload(var_19_5)

		local var_19_6 = sys_version

		if var_19_6 and var_19_6.client and tool.cmpVersion("1.4.9.9", var_19_6.client) then
			notice.data[18].isVisible = true
		end
	end

	if user.haveBigRotaryActivity == 1 and user.player.playerLv >= 25 then
		notice.data[19].isVisible = true
	else
		notice.data[19].isVisible = false
	end

	if user.hasFirstPayPkg then
		notice.data[21].isVisible = true
	else
		notice.data[21].isVisible = false
	end

	notice.data[22].isVisible = user.getFunc(10) and not var_19_0 and user.displayBetrayers == 1
	notice.data[23].isVisible = user.havaBetrayReward == 1
	notice.data[24].isVisible = user.haveZhuanPanActivity == 1
	notice.data[25].isVisible = user.activity.haveDidiActivity
	notice.data[26].isVisible = user.player.havePayRedBagActivity
	notice.data[27].isVisible = user.activity.haveDataRewardEvent
	notice.data[28].isVisible = not var_19_0 and user.needShowClean
	notice.data[29].isVisible = not var_19_0 and user.needShowCelebrate
	notice.data[30].isVisible = not var_19_0 and user.sadStoryCities and #user.sadStoryCities > 0

	notice.control.updateIconXZYL()

	notice.data[32].isVisible = user.kingNotice == 1

	if not var_19_0 and user.uncoverFog and user.uncoverFog == 1 then
		notice.data[33].isVisible = true
	else
		notice.data[33].isVisible = false
	end

	local var_19_7 = notice.data[34]

	var_19_7.isVisible = false

	if user.kfyzState ~= 0 then
		var_19_7.isVisible = true

		if user.kfyzState == 1 then
			if user.startTime >= 180000 then
				if user.invastType == 1 then
					if user.jpsIndex == 0 then
						var_19_7.image = "icon_yzcb"
					elseif user.jpsIndex == 4 then
						var_19_7.image = "icon_yzdy"
					else
						var_19_7.isVisible = false
					end
				elseif user.invastType == 2 then
					var_19_7.image = "icon_yzxl"
				end

				if user.isSoldiersThreeRoad then
					var_19_7.image = "icon_bfsl"
				end
			elseif user.jpsIndex == 0 then
				var_19_7.image = "icon_kfyz"
			elseif user.jpsIndex >= 1 and user.jpsIndex <= 4 then
				var_19_7.image = "icon_yzdy"
			elseif user.jpsIndex >= 5 and user.jpsIndex <= 7 then
				var_19_7.image = "icon_yzgl"
			elseif user.jpsIndex >= 8 and user.jpsIndex <= 10 then
				var_19_7.image = "icon_swjz"
			elseif user.jpsIndex >= 11 and user.jpsIndex <= 13 then
				var_19_7.image = "icon_yzlq"
			elseif user.jpsIndex >= 14 and user.jpsIndex <= 16 then
				var_19_7.image = "icon_yznz"
			end
		elseif user.kfyzState == 2 then
			if user.jpsIndex == 0 then
				var_19_7.image = "icon_kfyz"
			elseif user.jpsIndex == 1 or user.jpsIndex == 2 or user.jpsIndex == 3 or user.jpsIndex == 4 then
				var_19_7.image = "icon_yzdy"
			elseif user.jpsIndex == 5 or user.jpsIndex == 6 or user.jpsIndex == 7 then
				var_19_7.image = "icon_yzgl"
			elseif user.jpsIndex >= 8 and user.jpsIndex <= 10 then
				var_19_7.image = "icon_swjz"
			elseif user.jpsIndex >= 11 and user.jpsIndex <= 13 then
				var_19_7.image = "icon_yzlq"
			elseif user.jpsIndex >= 14 and user.jpsIndex <= 16 then
				var_19_7.image = "icon_yznz"
			end
		end

		var_19_7.callback = notice.control.enterKfyz
	elseif user.noSchedule and not user.hasApplied then
		var_19_7.isVisible = true
		var_19_7.image = "icon_yyyz"
		var_19_7.callback = notice.control.kfyzYuyue
	end

	if var_19_0 then
		var_19_7.isVisible = false
	end

	notice.data[35].isVisible = user.silkIcon and user.silkIcon > 0 or user.silkRoadDispatch == 1 and user.haveTreasureFinish == 0
	notice.data[36].isVisible = user.haveWorldFuBen == 1
	notice.data[37].isVisible = user.silkGoodsNotify == true

	if not var_19_0 and user.displayCatapultIcon and user.displayCatapultIcon > 0 then
		notice.data[38].isVisible = true
	else
		notice.data[38].isVisible = false
	end

	notice.data[39].isVisible = user.hasCbhsPower

	if not var_19_0 then
		if user.kbLv == 2 then
			notice.data[40].image = "icon_wcsj"
			notice.data[40].isVisible = user.getFunc(10)
		elseif user.kbLv == 3 or user.kbLv == 4 or user.kbLv == 5 or user.kbLv == 6 then
			notice.data[40].image = "icon_wcsj2"
			notice.data[40].isVisible = user.getFunc(10)
		elseif user.kbLv < 2 then
			notice.data[40].image = "icon_zgzl"
			notice.data[40].isVisible = user.signComplete == 0
		end
	end

	notice.data[41].isVisible = not var_19_0 and user.kbtaskCong
	notice.data[42].isVisible = not var_19_0 and type(user.changeName) == "table" and #user.changeName > 0
	notice.data[43].isVisible = not var_19_0 and user.hasGemBonus
	notice.data[44].isVisible = false

	if not var_19_0 and notice.castleIcon and notice.castleIcon.rewardCities and #notice.castleIcon.rewardCities > 0 then
		notice.data[44].isVisible = true
	end

	notice.data[45].isVisible = false

	if not var_19_0 and notice.castleIcon and notice.castleIcon.preparedCities and #notice.castleIcon.preparedCities > 0 then
		notice.data[45].isVisible = true
	end

	notice.data[46].isVisible = false

	if user.harvest and user.harvest > 0 then
		notice.data[46].isVisible = true
	end

	user.feudCities = user.feudCities or {}

	local var_19_8 = 0

	for iter_19_7, iter_19_8 in pairs(user.feudCities) do
		var_19_8 = var_19_8 + 1
	end

	notice.data[47].isVisible = var_19_8 > 0

	if user.tujinPhantomIcon ~= nil then
		notice.data[48].isVisible = user.tujinPhantomIcon
	end

	notice.data[49].isVisible = user.specialPhantom
	user.feudSealCities = user.feudSealCities or {}

	local var_19_9 = 0

	for iter_19_9, iter_19_10 in pairs(user.feudSealCities) do
		var_19_9 = var_19_9 + 1
	end

	notice.data[50].isVisible = var_19_9 > 0
	notice.data[51].isVisible = user.hasBuildReward == true
	notice.data[52].isVisible = user.seePromotionIcon == 1
	notice.data[53].isVisible = user.showKfzbCele == true
	notice.data[54].isVisible = type(user.moonBuff) == "table" and type(user.moonBuff.state) == "number" and user.moonBuff.state > 0

	if user.startEvokeZgl or user.readyEvokeZgl then
		notice.data[55].isVisible = true
	else
		notice.data[55].isVisible = false
	end

	notice.data[56].isVisible = user.disturbState == 1
	notice.data[57].isVisible = user.seeSixTreasureIcon == 1
	notice.data[58].isVisible = user.donationState == true
	notice.data[59].isVisible = user.startEvokeXhd == true
	notice.data[72].isVisible = user.startEvokeGN == true

	if user.player.lcxxReward and user.player.lcxxReward.rewards and #user.player.lcxxReward.rewards > 0 then
		notice.data[60].isVisible = true
	else
		notice.data[60].isVisible = false
	end

	notice.data[61].isVisible = user.seeSevenTreasureIcon == 1
	notice.data[62].isVisible = false

	if user.player.hasBestSuit and user.player.expInfo then
		local var_19_10 = user.player.expInfo

		if var_19_10.curValue >= var_19_10.maxValue then
			notice.data[62].cornerNum = math.modf(var_19_10.curValue / var_19_10.maxValue)
			notice.data[62].isVisible = true
		end
	end

	notice.data[63].isVisible = user.seeEightTreasureIcon == 1

	notice.control.updateIconJiaoZhen(user.jiaozhen.hasEnemy, user.jiaozhen.championBattleId ~= nil and user.jiaozhen.championBattleId ~= "", user.jiaozhen.chamArenas and #user.jiaozhen.chamArenas > 0)

	notice.data[67].isVisible = user.activity.haveHeroActivity2 and user.heroEventZglIcon == 1

	if user.haveLookActivityIcon then
		if user.haveLookActivityIcon == 1 then
			notice.data[72].isVisible = true
		elseif user.haveLookActivityIcon == 2 then
			notice.data[72].isVisible = true
		else
			notice.data[72].isVisible = false
		end
	end

	if user.kfmgState and user.kfmgState > 0 and user.kfmgState < 5 and user.getFunc(10) then
		notice.data[74].isVisible = true
	else
		notice.data[74].isVisible = false
	end

	if user.haveXfhk then
		if user.haveXfhk == 1 then
			notice.data[78].isVisible = true
		elseif user.haveXfhk == 2 then
			notice.data[78].isVisible = true
		else
			notice.data[78].isVisible = false
		end
	end

	if user.haveHghd then
		if user.haveHghd == 1 then
			notice.data[79].isVisible = true
		else
			notice.data[79].isVisible = false
		end
	end

	notice.data[83].isVisible = user.arenaMatchIcons ~= nil and user.arenaMatchIcons[0] ~= nil
	notice.data[84].isVisible = user.arenaMatchIcons ~= nil and user.arenaMatchIcons[1] ~= nil
	notice.data[86].isVisible = user.supplyIcon == 1
	notice.data[87].isVisible = user.ycbwEvent
	notice.data[88].isVisible = user.personalDonation == true
	notice.data[89].isVisible = user.startEvokeLB == true
	notice.data[90].isVisible = user.firstBeatPowerNpc183 == true
	notice.data[91].isVisible = user.hasMeteoriteTips == true
	notice.data[92].isVisible = user.didiIcon and user.didiIcon > 0
	notice.data[93].isVisible = user.iconBuildRoads and #user.iconBuildRoads > 0
	notice.data[94].isVisible = user.iconCloseRoads and #user.iconCloseRoads > 0
	notice.data[96].isVisible = user.canGetMedal == true
	notice.data[97].isVisible = user.mohistIconState and user.mohistIconState == 1
	notice.data[98].isVisible = user.startEvokeHYY == true
	notice.data[102].isVisible = user.haveQuizActivity == 1

	local var_19_11 = 0

	for iter_19_11, iter_19_12 in ipairs(notice.data) do
		if iter_19_11 ~= 95 and iter_19_12.outside ~= true and iter_19_12.isVisible == true then
			var_19_11 = var_19_11 + 1
		end
	end

	notice.data[95].isVisible = var_19_11 > 0
	notice.data[95].cornerNum = var_19_11
end

function notice.control.openNationTry()
	nationUI.show(3)
end

function notice.control.openNationLevelUp()
	nationUI.show(4)
end

function notice.control.barToken()
	notice.ui.expandID = -1

	notice.ui.update()
	showBarTokenNoticePanel()
end

function notice.control.openTeam()
	notice.ui.expandID = -1

	notice.ui.update()
	showJoinTeamPanel()
end

function notice.control.openGoldOrder()
	notice.ui.expandID = -1

	notice.ui.update()
	showJoinGoldOrderPanel()
end

function notice.control.openZhiyuan()
	notice.ui.expandID = -1

	notice.ui.update()
	showJoinGoldOrderPanel(false, "zhiyuanling")
end

function notice.control.openToken()
	notice.ui.expandID = -1

	notice.ui.update()
	showJoinOfficerTokenPanel()
end

function notice.control.openHaolingqunxiong()
	if notice.ui.expandID == notice.constant.haolingqunxiong then
		notice.ui.expandID = -1
	else
		notice.ui.expandID = notice.constant.haolingqunxiong
	end

	notice.ui.update()
end

function notice.control.openGuojiarenwu()
	if notice.ui.expandID == notice.constant.quanguorenwu then
		notice.ui.expandID = -1
	else
		notice.ui.expandID = notice.constant.quanguorenwu
	end

	notice.ui.update()
end

function notice.control.handlerPushRightNotice(arg_29_0)
	local var_29_0 = arg_29_0.action.data.rightNotice

	if var_29_0 then
		notice.ui.scrollNotice(var_29_0)
	end
end

function notice.control.openUrl(arg_30_0, arg_30_1)
	local var_30_0 = tolua.cast(arg_30_1, "CCControlButton")
	local var_30_1 = tolua.cast(var_30_0:getUserObject(), "CCString"):getCString()

	pcall(function()
		CCApplication:sharedApplication():openURL(var_30_1)
	end)
end

function notice.control.refreshTJSDExp()
	if notice.ui.table.sdtj_progress then
		notice.ui.table.sdtj_progress:setPercentage(user.player.sdtjcurExp / user.player.sdtjMaxExp * 100)
	end
end

function notice.control.refreshXZYL()
	if notice.ui.table.xzyl_progress then
		local var_33_0 = updateManager.getDownloadPercent()

		if var_33_0 >= 100 then
			local var_33_1 = CCSprite:create("res/ui/downloadViewer/jdtdi-lv.png")

			notice.ui.table.xzyl_progress:setSprite(var_33_1)
		end

		notice.ui.table.xzyl_progress:setPercentage(var_33_0)
	end
end

function notice.control.refreshHuizhanGather(arg_34_0)
	if arg_34_0.hasGather ~= nil then
		user.player.hasHuiZhanGatherIcon = arg_34_0.hasGather
	end

	if arg_34_0.hasIcon ~= nil then
		user.player.hasHuizhan = arg_34_0.hasIcon
	end

	notice.control.update()
	notice.ui.update()
end

function notice.control.huizhanInfo()
	require("lua/layer/nation/ui")
	nationUI.show(8)
end

function notice.control.huizhanGather()
	log.info("@@ 会战召集面板显示")

	local var_36_0 = require("lua/layer/nation/huizhan/HuizhanGather").new()
	local var_36_1 = smgr.getLayer("topLayer")

	if var_36_1 then
		var_36_1:addChild(var_36_0)
	end
end

function notice.control.sansejinnang()
	log.info("@@ 三色锦囊面板显示")
	require("lua/layer/threeColorBag/ui")
	threeColorBag.ui.show()
end

function notice.control.showTelFare()
	activityUI.show(activityConstant.TYPES.ACTIVITY_TEL_FARE.tag)
end

function notice.control.showBigRotary()
	activityUI.show(activityConstant.TYPES.ACTIVITY_BIG_ROTARY.tag)
end

function notice.control.showFirstPay()
	return
end

function notice.control.showLimitedEditionGiftPanel()
	log.info("@@ 限量礼包面板显示")
	require("lua/layer/limitedEditionGift/ui")
	limitedEditionGift.ui.show()

	if channelMgr.currentChannel ~= channels.andyulong and channelMgr.currentChannel ~= channels.andyulongHD then
		user.hasFirstPayPkg = false

		notice.control.refreshLayer()
	end
end

function notice.control.celebration()
	log.info("@@ 恭贺系统入口")
	require("lua/layer/celebration/ui")
	celebration.ui.show()
end

function notice.control.havePayRedBagActivity()
	log.info("@@ 领取红包入口")

	local var_43_0 = smgr.getLayer("topLayer")
	local var_43_1 = require("lua/layer/activity/activityTab/SendRed").new(var_43_0)
end

function notice.control.showDiscount()
	log.info("@@ 限时优惠活动入口")

	local function var_44_0(arg_45_0)
		local var_45_0 = arg_45_0.action.data

		if var_45_0.countDown and var_45_0.countDown > 0 then
			require("lua/layer/discount/discountLayer.lua").show(var_45_0)
		elseif var_45_0.msg then
			smgr.showTipText(var_45_0.msg)
			amgr.playEffect(enumAudioFile.ui_click_error, false, true)
		end
	end

	cmgr.sendRequest(var_44_0, actions.getDiscountInfo)
end

function notice.control.showBetrayListPanel()
	log.info("@@ 阵营转换后，转换名单")
	require("lua/layer/betrayResult/ui")
	betrayResultUI.show(1)
end

function notice.control.showBetrayRewardPanel()
	log.info("@@ 阵营转换后，君主馈赠")
	require("lua/layer/betrayResult/ui")
	betrayResultUI.show(2)
end

function notice.control.showZhuanPanPanel()
	activityUI.show(activityConstant.TYPES.ACTIVITY_ZHUAN_PAN.tag)
end

function notice.control.showDidiPanel()
	activityUI.show(activityConstant.TYPES.ACTIVITY_TAXI.tag)
end

function notice.control.showDataRewardPanel()
	activityUI.show(activityConstant.TYPES.ACTIVITY_DATA_REWARD.tag)
end

function notice.control.showActivity1()
	activityUI.show(nil, 1)
end

function notice.control.showActivity2()
	activityUI.show(nil, 2)
end

function notice.control.kfyzYuyue()
	local function var_53_0(arg_54_0)
		local var_54_0 = smgr.getLayer("topLayer")

		require("lua/layer/kfyz/YuyueLayer").new(var_54_0)

		user.hasApplied = true

		notice.control.refreshLayer()
	end

	cmgr.sendRequest(var_53_0, actions.kfyzNotifyOrderYz)
end

function notice.control.enterKfyz()
	if user.kfyzState == 1 and user.startTime < 180000 or user.kfyzState == 2 and user.isInSd then
		log.info("@@ 进入跨服远征")
		require("lua/manager/kfConnectManager")

		local function var_55_0(arg_56_0)
			local var_56_0 = arg_56_0.action.data

			user.isKfdy = false
			user.isKfgl = false
			user.isKfyn = false
			user.isKflq = false
			user.isKfnz = false

			if var_56_0.worldId then
				user.kfworldId = var_56_0.worldId
				user.isKfdy = var_56_0.worldId >= 6 and var_56_0.worldId <= 8 or var_56_0.worldId == 10
				user.isKfgl = var_56_0.worldId >= 11 and var_56_0.worldId <= 13
				user.isKfyn = var_56_0.worldId >= 14 and var_56_0.worldId <= 16
				user.KfyzOneAndOne = var_56_0.worldId == 9
				user.isKflq = var_56_0.worldId >= 17 and var_56_0.worldId <= 19
				user.isKfnz = var_56_0.worldId >= 20 and var_56_0.worldId <= 23
			end

			local var_56_1 = var_56_0.matchState

			if var_56_1 == 1 or var_56_1 == 2 then
				kfcmgr.loginkfyz(var_56_0)
			elseif var_56_1 == 4 then
				if smgr.currentSceneTag ~= SCENE_WORLD then
					loadingLayer.show(SCENE_WORLD)
				end
			else
				user.kfyzState = 0

				notice.control.refreshLayer()
			end
		end

		cmgr.sendRequest(var_55_0, actions.kfyzSignUp)
	elseif user.kfyzState == 1 and user.startTime >= 180000 then
		local var_55_1 = smgr.getLayer("topLayer")

		var_55_1:removeAllChildrenWithCleanup(true)

		if user.jpsIndex == 4 then
			require("lua/layer/kfyz/InvestLayer2").new(var_55_1)
		elseif user.isSoldiersThreeRoad then
			if user.kfRoadId and user.kfRoadId > 0 then
				user.isSelfKfRoad = true

				require("lua/layer/kfyz/InvestLayer").new(var_55_1)
			elseif user.invastType == 1 then
				require("lua/layer/kfyz/KfyzMorePanel").new(var_55_1)
			else
				require("lua/layer/kfyz/InvestLayer").new(var_55_1)
			end
		else
			require("lua/layer/kfyz/InvestLayer").new(var_55_1)
		end
	elseif user.kfyzState == 2 then
		if user.isSoldiersThreeRoad then
			if user.invastType == 1 then
				local var_55_2 = smgr.getLayer("topLayer")

				var_55_2:removeAllChildrenWithCleanup(true)
				require("lua/layer/kfyz/KfyzMorePanel").new(var_55_2)
			else
				require("lua/layer/nation/ui")
				nationUI.show(10)
			end
		else
			require("lua/layer/nation/ui")
			nationUI.show(10)
		end
	end
end

function notice.control.showSaoTaoPanel()
	log.info("@@ 扫讨面板显示")

	local var_57_0 = require("lua/layer/saotao/saotao").new()
	local var_57_1 = smgr.getLayer("topLayer")

	var_57_1:removeAllChildrenWithCleanup(true)
	var_57_1:addChild(var_57_0)
end

function notice.control.showTuChengCelebratePanel()
	log.info("@@ 屠城庆功面板显示")

	local var_58_0 = require("lua/layer/saotao/celebrateSlaughter").new()
	local var_58_1 = smgr.getLayer("topLayer")

	var_58_1:removeAllChildrenWithCleanup(true)
	var_58_1:addChild(var_58_0)
end

function notice.control.gotoSadStoryCities()
	log.info("gotoCity")

	if notice.control.currentSadStoryCityId then
		local var_59_0 = 1

		for iter_59_0 = 1, #user.sadStoryCities do
			if user.sadStoryCities[iter_59_0] == notice.control.currentSadStoryCityId then
				var_59_0 = iter_59_0 % #user.sadStoryCities + 1

				break
			end
		end

		notice.control.currentSadStoryCityId = user.sadStoryCities[var_59_0]
	else
		notice.control.currentSadStoryCityId = user.sadStoryCities[1]
	end

	if notice.control.currentSadStoryCityId then
		loadingLayer.show(SCENE_WORLD, notice.control.currentSadStoryCityId)
	end
end

function notice.control.showDownloadDetailView()
	log.info("should show download view")

	local var_60_0 = require("lua/layer/downloadViewer/downloadDetailView/ui").new()
	local var_60_1 = smgr.getLayer("topLayer")

	var_60_1:removeAllChildrenWithCleanup(true)
	var_60_1:addChild(var_60_0)
end

function notice.control.showKingNotice(...)
	roleDialogue.control.loadSpeak(1911)
	require("lua/layer/nation/ui")
	nationUI.show(1)
end

function notice.control.openFogActivityPanel()
	local var_62_0 = createBaseLayer()
	local var_62_1 = CCScale9Sprite:createWithSpriteFrameName("bigPanel.png")

	var_62_1:setPreferredSize(CCSizeMake(960, 581))
	var_62_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 28))
	var_62_0:addChild(var_62_1, 0)

	local var_62_2 = {
		closeMenu = {
			type = "button",
			buttons = {
				{
					pic2 = "frame:btn_close_c.png",
					name = "closeItem",
					pic1 = "frame:btn_close_a.png",
					y = 605,
					x = 926
				}
			}
		}
	}
	local var_62_3 = autoUI.initUI(var_62_1, var_62_2).closeItem

	var_62_3:setScale(2)

	local function var_62_4()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)

		if guide.control.isHideByTemp == true then
			guide.control.isHideByTemp = false

			guide.ui.setVisible(true)
		end

		guide.control.setCurrentMarkTrace(nil)
	end

	var_62_3:registerScriptTapHandler(var_62_4)

	local var_62_5 = require("lua/layer/uncoverFog/ui").new()

	var_62_1:addChild(var_62_5, 1)

	local var_62_6 = smgr.getLayer("topLayer")

	var_62_6:removeAllChildrenWithCleanup(true)
	var_62_6:addChild(var_62_0, 1, 2002)
end

function notice.control.showSilk()
	if user.silkIcon > 0 then
		local var_64_0 = smgr.getLayer("topLayer")
		local var_64_1 = require("lua/layer/silk/IntroLayer").new()

		var_64_0:removeAllChildrenWithCleanup(true)
		var_64_0:addChild(var_64_1)
	elseif user.silkRoadDispatch == 1 and user.haveTreasureFinish == 0 then
		require("lua/layer/resource/ui")
		resourceUI.show(7)
	end
end

function notice.control.showWorldFuBen()
	if smgr.currentSceneTag ~= SCENE_SILK_POWER then
		smgr.changeScene(SCENE_SILK_POWER)
	end
end

function notice.control.showSilkMarket()
	require("lua/layer/resource/ui")
	resourceUI.show(6)
end

function notice.control.showPiLiChe()
	log.info("piliche show")
	require("lua/layer/weaponTab/ui")
	weaponTab.ui.show(4)
end

function notice.control.gotoZhouyuJx()
	smgr.changeScene(SCENE_CBHS_POWER)
end

function notice.control.gotoKbFeast()
	smgr.changeScene(SCENE_KB_FEAST)
end

function notice.control.showChangeName()
	local var_70_0 = smgr.getLayer("topLayer")
	local var_70_1 = require("lua/layer/ChangeNameNotice").new()

	var_70_0:removeAllChildrenWithCleanup(true)
	var_70_0:addChild(var_70_1)
end

function notice.control.showZhugongZHaoling()
	if user.kbLv == 2 or user.kbLv == 3 or user.kbLv == 4 or user.kbLv == 5 or user.kbLv == 6 then
		log.info("决战瀛洲")
		nationUI.show(12)
	else
		log.info("notice.control.showZhugongZHaoling")
		require("lua/layer/nation/buildNation/zhugongzhaoling/zhugongzhaoling")
		showZhugongZhaolingPanel()
	end
end

function notice.control.showGemBonus()
	local var_72_0 = smgr.getLayer("topLayer")
	local var_72_1 = require("lua/layer/activity/activityTab/GemBonus").new()

	var_72_0:removeAllChildrenWithCleanup(true)
	var_72_0:addChild(var_72_1)
end

function notice.control.showJzcl()
	if notice.castleIcon and notice.castleIcon.rewardCities and #notice.castleIcon.rewardCities > 0 then
		loadingLayer.show(SCENE_WORLD, notice.castleIcon.rewardCities[1])
	end
end

function notice.control.showJzgs()
	if notice.castleIcon and notice.castleIcon.preparedCities and #notice.castleIcon.preparedCities > 0 then
		loadingLayer.show(SCENE_WORLD, notice.castleIcon.preparedCities[1])
	end
end

function notice.control.foodQiangshou()
	user.harvest = 0

	smgr.changeScene(SCENE_RES_NONGTIAN)
end

function notice.control.showFeud()
	local var_76_0 = smgr.getLayer("topLayer")
	local var_76_1 = require("lua/layer/feud/FeudPanel").new()

	var_76_0:removeAllChildrenWithCleanup(true)
	var_76_0:addChild(var_76_1)
end

function notice.control.showJqhb()
	user.tujinPhantomIcon = false

	notice.control.update()

	local function var_77_0(arg_78_0)
		local var_78_0 = arg_78_0.action.data

		user.phantomMp = var_78_0.phantomMp
		user.phantomGeneral = var_78_0.pic
		user.phantomOccupyNum = var_78_0.occupyNum
		user.phantomKillNum = var_78_0.killNum
		user.phantomAddFeat = var_78_0.addFeat

		if var_78_0.pic == nil and var_78_0.phantomMp and #var_78_0.phantomMp > 0 then
			user.phantomGeneral = var_78_0.phantomMp[1].pic
		end

		roleDialogue.control.loadSpeak(2040)

		if var_78_0.phantomMp and #var_78_0.phantomMp > 0 then
			loadingLayer.show(SCENE_WORLD, var_78_0.phantomMp[1].cityId)
			eventManager.dispatchEvent("addPhantomMp")
		end
	end

	cmgr.sendRequest(var_77_0, actions.getTujinResult)
end

function notice.control.showSpecialPhantom()
	local function var_79_0(arg_80_0)
		local var_80_0 = arg_80_0.action.data

		if var_80_0.leftTujinNum > 0 or var_80_0.leftSoloNum > 0 or var_80_0.leftFusion > 0 or var_80_0.leftFision > 0 or var_80_0.leftHbqNum > 0 then
			local var_80_1 = smgr.getLayer("topLayer")

			require("lua/layer/notice/PhantomNotice").new(var_80_1, var_80_0)
		end

		user.specialPhantom = false

		notice.control.refreshLayer()
	end

	cmgr.sendRequest(var_79_0, actions.getSpecialPhantomInfo)
end

function notice.control.showFeudSeal()
	for iter_81_0, iter_81_1 in pairs(user.feudSealCities) do
		loadingLayer.show(SCENE_WORLD, iter_81_0)

		user.feudSealCities[iter_81_0] = nil

		break
	end

	notice.control.refreshLayer()
end

function notice.control.showBuildReward()
	local function var_82_0(arg_83_0)
		local var_83_0 = smgr.getLayer("topLayer")

		var_83_0:removeAllChildrenWithCleanup(true)
		require("lua/layer/world/buildEvent/BuildReward").new(var_83_0, arg_83_0.action.data)
	end

	cmgr.sendRequest(var_82_0, actions.getBuildRewardInfo)
end

function notice.control.onClickPromotion()
	require("lua/layer/resource/ui")
	resourceUI.show(4)

	local function var_84_0(arg_85_0)
		user.seePromotionIcon = 0

		notice.control.refreshLayer()
	end

	cmgr.sendRequest(var_84_0, actions.civilClickPromotion)
end

function notice.control.showKfzbCele()
	local function var_86_0(arg_87_0)
		local var_87_0 = smgr.getLayer("topLayer")

		var_87_0:removeAllChildrenWithCleanup(true)
		require("lua/layer/kfzb/CelePanel").new(var_87_0, arg_87_0.action.data)
	end

	cmgr.sendRequest(var_86_0, actions.kfzbGetCurrChampionInfo)
end

function notice.control.showMoonBuffPanel()
	local var_88_0 = smgr.getLayer("topLayer")

	var_88_0:removeAllChildrenWithCleanup(true)
	require("lua/layer/activity/activityTab/MoonBuff").new(var_88_0, user.moonBuff)
end

function notice.control.showZgljx()
	if user.startEvokeZgl then
		roleDialogue.control.loadSpeak(2160)

		user.startEvokeZgl = false
	elseif user.readyEvokeZgl then
		roleDialogue.control.loadSpeak(2150)

		user.readyEvokeZgl = false
	end

	notice.control.update()
	notice.ui.update()
end

function notice.control.showXhdjx()
	if user.startEvokeXhd then
		roleDialogue.control.loadSpeak(1580)

		user.startEvokeXhd = false
	end

	notice.control.update()
	notice.ui.update()
end

function notice.control.clickGNJX()
	if user.startEvokeGN then
		roleDialogue.control.loadSpeak(2441)

		user.startEvokeGN = false
	end

	notice.control.update()
	notice.ui.update()
end

function notice.control.clickLBJX()
	if user.startEvokeLB then
		roleDialogue.control.loadSpeak(2160)

		user.startEvokeLB = false
	end

	notice.control.update()
	notice.ui.update()
end

function notice.control.clickHYYJX()
	if user.startEvokeHYY then
		roleDialogue.control.loadSpeak("hyyjx1")

		user.startEvokeHYY = false
	end

	notice.control.update()
	notice.ui.update()
end

function notice.control.showKfyzNoDisturb()
	local function var_94_0(arg_95_0)
		local var_95_0 = smgr.getLayer("topLayer")

		var_95_0:removeAllChildrenWithCleanup(true)
		require("lua/layer/kfyz/NoDisturb").new(var_95_0, arg_95_0.action.data)
	end

	cmgr.sendRequest(var_94_0, actions.kfyzGetDisturbInfo)
end

function notice.control.clickDiliuZhengbao()
	local function var_96_0(arg_97_0)
		user.seeSixTreasureIcon = 0

		notice.control.update()
		notice.ui.update()
	end

	roleDialogue.control.loadSpeak(2240)
	cmgr.sendRequest(var_96_0, actions.clickSixTreasureIcon)
end

function notice.control.clickDiQiZhengbao()
	local function var_98_0(arg_99_0)
		user.seeSevenTreasureIcon = 0

		notice.control.update()
		notice.ui.update()
	end

	roleDialogue.control.loadSpeak(2330)
	cmgr.sendRequest(var_98_0, actions.clickSevenTreasureIcon)
end

function notice.control.clickDiBaZhengbao()
	local function var_100_0(arg_101_0)
		user.seeEightTreasureIcon = 0

		notice.control.update()
		notice.ui.update()
	end

	roleDialogue.control.loadSpeak(2380)
	cmgr.sendRequest(var_100_0, actions.clickEightTreasureIcon)
end

function notice.control.showCorpsPanel()
	local function var_102_0(arg_103_0)
		local var_103_0 = smgr.getLayer("topLayer")

		var_103_0:removeAllChildrenWithCleanup(true)
		require("lua/layer/corps/CorpsPanelNew").new(var_103_0, arg_103_0.action.data, 0)
	end

	cmgr.sendRequest(var_102_0, actions.getCorpsInfo, 0, 0)
end

function notice.control.openGRJT()
	local function var_104_0(arg_105_0)
		local var_105_0 = smgr.getLayer("topLayer")

		var_105_0:removeAllChildrenWithCleanup(true)
		require("lua/layer/corps/CorpsPanelNew").new(var_105_0, arg_105_0.action.data, 1)
	end

	cmgr.sendRequest(var_104_0, actions.getCorpsInfo, 0, 1)
end

function notice.control.showLcxx()
	if user.player.lcxxReward then
		if #user.player.lcxxReward.rewards >= 2 then
			roleDialogue.control.loadSpeak(2320)
		else
			roleDialogue.control.loadSpeak(2310)
		end

		local function var_106_0(arg_107_0)
			local var_107_0 = arg_107_0.action.data

			if var_107_0.rewards then
				local var_107_1 = {}

				for iter_107_0 = 1, #var_107_0.rewards do
					var_107_1[iter_107_0] = {}

					if var_107_0.rewards[iter_107_0].type == 21 then
						var_107_1[iter_107_0].id = 7
					else
						var_107_1[iter_107_0].id = var_107_0.rewards[iter_107_0].type
					end

					var_107_1[iter_107_0].value = var_107_0.rewards[iter_107_0].num
				end

				globalAction_gotResource(var_107_1)
			end

			user.player.lcxxReward = nil

			notice.control.update()
			notice.ui.update()
		end

		cmgr.sendRequest(var_106_0, actions.getSweepReward)
	end
end

function notice.control.manjiJiaoshi()
	log.info("领取角石")

	local function var_108_0(arg_109_0)
		local var_109_0 = arg_109_0.action.data

		user.player.jiaoshiNum = var_109_0.num
		user.player.expInfo = var_109_0.expInfo

		showTable(var_109_0)

		local var_109_1 = {
			{}
		}

		var_109_1[1].id = 10054
		var_109_1[1].value = var_109_0.num

		globalAction_gotResource(var_109_1)
		notice.control.update()
		notice.ui.update()
	end

	cmgr.sendRequest(var_108_0, actions.recvStone)
end

function notice.control.handleJBYWIcon(arg_110_0)
	local var_110_0

	if notice.data[80] ~= arg_110_0 then
		notice.data[80].isVisible = arg_110_0
		var_110_0 = true
	end

	if var_110_0 then
		notice.control.refreshLayer()
	end
end

function notice.control.updateIconJiaoZhen(arg_111_0, arg_111_1, arg_111_2)
	if arg_111_0 then
		if notice.data[64] then
			notice.data[64].isVisible = true
		end
	elseif notice.data[64] then
		notice.data[64].isVisible = false
	end

	if arg_111_1 then
		if notice.data[65] then
			notice.data[65].isVisible = true
		end
	elseif notice.data[65] then
		notice.data[65].isVisible = false
	end

	if arg_111_2 then
		if notice.data[66] then
			notice.data[66].isVisible = true
		end
	elseif notice.data[66] then
		notice.data[66].isVisible = false
	end
end

function notice.control.handleJiaoZhenIcon(arg_112_0)
	notice.control.updateIconJiaoZhen(false, false, false)

	local var_112_0

	if arg_112_0.hasEnemy ~= nil then
		user.jiaozhen.hasEnemy = arg_112_0.hasEnemy
		var_112_0 = true
	end

	if arg_112_0.battleId then
		user.jiaozhen.championBattleId = arg_112_0.battleId
		var_112_0 = true
	end

	if arg_112_0.chamArenas then
		user.jiaozhen.chamArenas = arg_112_0.chamArenas
		var_112_0 = true
	end

	if var_112_0 then
		notice.control.refreshLayer()
	end
end

function notice.control.clickJiaoZhen()
	eventManager.dispatchEvent("SeeChampionCity")
end

function notice.control.clickYingZhan()
	smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_JIAOZHEN, {
		battleId = user.jiaozhen.championBattleId
	})
end

function notice.control.clickLeiZhu()
	loadingLayer.show(SCENE_WORLD, user.jiaozhen.chamArenas[1])
end

function notice.control.clickHeroEventZglIcon()
	require("lua/layer/general/ui")
	showGeneralPanel(1)
end

function notice.control.clickLXGC()
	log.info("@@ 连续攻城入口")
	cmgr.sendRequest(function(...)
		log.info("@@ 开始连续攻城")
	end, actions.triggerConquer)
end

function notice.control.clickFdtq()
	log.info("@@ 封地特权入口")
	roleDialogue.control.loadSpeak(2440)

	user.player.haveFeudPrivilege = 0

	notice.control.refreshLayer()
end

function notice.control.showCdsh()
	activityUI.show(activityConstant.TYPES.ACTIVITY_LOOK.tag)
end

function notice.control.showAyjc()
	log.info("==== 开启奥运竞猜面板 ====")
	activityUI.show(activityConstant.TYPES.ACTIVITY_OLYMPIC_BETTING_GAME.tag)
end

function notice.control.enterKfmg()
	if user.kfmgState == 2 or user.kfmgState == 3 then
		log.info("@@ 进入跨服灭国")
		require("lua/manager/kfConnectManager")

		local function var_122_0(arg_123_0)
			log.info("===============onSingUp")
			showTable(arg_123_0)
			kfcmgr.loginkfmg(arg_123_0.action.data)
		end

		cmgr.sendRequest(var_122_0, actions.kfmgSignUp)
	elseif user.kfmgState == 1 then
		local var_122_1 = require("lua/layer/kfmg/kfmgReady/ui").new()
		local var_122_2 = smgr.getLayer("topLayer")

		var_122_2:removeAllChildrenWithCleanup(true)
		var_122_2:addChild(var_122_1)
	elseif user.kfmgState == 4 then
		local var_122_3 = require("lua/layer/kfmg/kfmgReward/ui").new()
		local var_122_4 = smgr.getLayer("topLayer")

		var_122_4:removeAllChildrenWithCleanup(true)
		var_122_4:addChild(var_122_3)
	end
end

function notice.control.clickMood()
	log.info("@@ 蛮族结盟")

	if user.player.headhunterVO then
		if user.player.headhunterVO.type == 1 then
			roleDialogue.control.loadSpeak(2501)
		else
			roleDialogue.control.loadSpeak(2502)
		end

		user.player.showFriendHeadhunter = false

		notice.control.refreshLayer()
	end
end

function notice.control.clickLeague()
	log.info("@@ 蛮族结盟敌对")

	if user.player.headhunterVO then
		if user.player.headhunterVO.againstForce == user.player.forceId then
			if user.player.headhunterVO.type == 1 then
				roleDialogue.control.loadSpeak(2503)
			else
				roleDialogue.control.loadSpeak(2504)
			end
		else
			roleDialogue.control.loadSpeak(2505)
		end

		user.player.showHostileHeadhunter = false

		notice.control.refreshLayer()
	end
end

function notice.control.clickXfhk()
	log.info("@@ 新服回馈")

	local function var_126_0(arg_127_0)
		local var_127_0 = require("lua/layer/activity/activityTab/Xinfuhuikui").new(arg_127_0.action.data)
		local var_127_1 = smgr.getLayer("topLayer")

		var_127_1:removeAllChildrenWithCleanup(true)
		var_127_1:addChild(var_127_0)
	end

	cmgr.sendRequest(var_126_0, actions.getXFHK)
end

function notice.control.clickZZ()
	log.info("@@ 铸造")
	require("lua/layer/weaponTab/ui")
	weaponTab.ui.show(6)
end

function notice.control.lockNotice(arg_129_0)
	local var_129_0 = CCSprite:create("res/ui/arena/jzxt_word_time_bg.png")
	local var_129_1 = CCSprite:create("res/ui/world/cityLock//word_" .. arg_129_0 .. ".png")

	var_129_1:setPosition(ccp(363, 30))
	var_129_0:addChild(var_129_1)
	var_129_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
	smgr.showTipSpriteText(var_129_0, callback, 0.1)
end

function notice.control.handlePushYcbw(arg_130_0)
	if arg_130_0 then
		notice.data[81].isVisible = true

		if notice.ui.quickCastingView then
			notice.ui.quickCastingView:updatePanel(arg_130_0)
		end
	end
end

function notice.control.clickDjzb()
	local function var_131_0(arg_132_0)
		user.player.seeNineTreasureIcon = 0

		notice.control.update()
		notice.ui.update()
	end

	roleDialogue.control.loadSpeak(2381)
	cmgr.sendRequest(var_131_0, actions.clickNineTreasureIcon)
end

function notice.control.clickArenaMatch0()
	local var_133_0 = user.arenaMatchIcons[0]

	smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_LTZB, {
		terrain = 0,
		generalId = 0,
		prepare = true,
		target = var_133_0.battleId
	})
end

function notice.control.clickArenaMatch1()
	local var_134_0 = user.arenaMatchIcons[1]

	smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_LTZB, {
		terrain = 0,
		generalId = 0,
		prepare = true,
		target = var_134_0.battleId
	})
end

function notice.control.openDrill()
	log.info("@@点击剧本演武Icon")

	local var_135_0 = user.NationData

	if var_135_0.ywState == 0 then
		user.ywData.battleKey = var_135_0.battleKey

		smgr.changeScene(SCENE_JUBEN, user.soId, 0, 0)
	elseif var_135_0.ywState == 1 then
		notice.control.openMuilJbTask()
	end
end

function notice.control.openYBCC()
	log.info("@@点击御宝冲刺Icon")

	local var_136_0 = smgr.getLayer("topLayer")

	var_136_0:removeAllChildrenWithCleanup(true)
	require("lua/layer/activity/activityTab/YuBaoSprint").new(var_136_0)
end

function notice.control.openMuilJbTask()
	local var_137_0 = require("lua/layer/juben/DrillTask").new()
	local var_137_1 = smgr.getLayer("topLayer")

	if var_137_1 then
		var_137_1:removeAllChildrenWithCleanup(true)
		var_137_1:addChild(var_137_0)
	end
end

function notice.control.openSupply()
	equipmentUI.show(1)
end

function notice.control.openChariotTech()
	roleDialogue.control.loadSpeak("openChariotTech")
	technologyUI.show()

	user.firstBeatPowerNpc183 = false
	user.firstOpenChariotTech = true
end

function notice.control.openChariotPanel()
	require("lua/layer/weaponTab/ui")
	weaponTab.ui.show(4)
end

function notice.control.openSilkCarpool()
	user.isReciveInvitePcts = true

	require("lua/layer/resource/ui")
	resourceUI.show(7)
end

local var_0_0 = 1

function notice.control.openBuildWorld()
	if user.iconBuildRoads and #user.iconBuildRoads > 0 then
		if var_0_0 > #user.iconBuildRoads then
			var_0_0 = 1
		end

		local var_142_0 = user.iconBuildRoads[var_0_0]

		if var_142_0 then
			loadingLayer.show(SCENE_WORLD, var_142_0.cityId)

			var_0_0 = var_0_0 + 1

			eventManager.dispatchEvent("openBuildWorld", var_142_0.cityId)
		end
	end
end

local var_0_1 = 1

function notice.control.openCloseWorld()
	if user.iconCloseRoads and #user.iconCloseRoads > 0 then
		if var_0_1 > #user.iconCloseRoads then
			var_0_1 = 1
		end

		local var_143_0 = user.iconCloseRoads[var_0_1]

		if var_143_0 then
			loadingLayer.show(SCENE_WORLD, var_143_0.cityId)

			var_0_1 = var_0_1 + 1
		end
	end
end

function notice.control.enterMainCity()
	smgr.changeScene(SCENE_MAIN_CITY)
end

function notice.control.showZQJC()
	log.info("足球竞猜@@")

	local function var_145_0(arg_146_0)
		local var_146_0 = smgr.getLayer("topLayer")

		var_146_0:removeAllChildrenWithCleanup(true)

		local var_146_1 = require("lua/layer/activity/activityTab/JingCai1").new(var_146_0, arg_146_0.action.data)
	end

	cmgr.sendRequest(var_145_0, actions.getQuizInfo)
end

function notice.control.showZnqAct()
	log.info("周年庆@@")

	local var_147_0 = smgr.getLayer("topLayer")

	var_147_0:removeAllChildrenWithCleanup(true)

	local var_147_1 = require("lua/layer/activity/activityTab/ActivityNotice").new(var_147_0)
end

function notice.control.flyPicEffect(arg_148_0, arg_148_1)
	local var_148_0 = smgr.getLayer("effectlayer")
	local var_148_1
	local var_148_2

	if arg_148_0 == 1 then
		var_148_1 = CCSprite:create("res/ui/battle/stategyPic/fightBack.png")
		var_148_2 = CCSprite:create("res/ui/kfyz/yzxzb_word_bsyz.png")

		var_148_2:setPosition(ccp(var_148_1:getContentSize().width * 0.5, var_148_1:getContentSize().height * 0.85))
		var_148_1:addChild(var_148_2)
	end

	if not var_148_2 then
		return
	end

	var_148_1:setPosition(ccp(0 - var_148_1:getContentSize().width * 0.5, visibleSize.height * 0.5))
	var_148_0:addChild(var_148_1)

	local function var_148_3()
		var_148_0:removeChild(var_148_1, true)

		if arg_148_1 then
			arg_148_1()
		end
	end

	local var_148_4 = CCArray:create()

	var_148_4:addObject(CCMoveTo:create(0.5, ccp(visibleSize.width * 0.5, visibleSize.height * 0.5)))
	var_148_4:addObject(CCDelayTime:create(1.5))
	var_148_4:addObject(CCMoveTo:create(0.5, ccp(visibleSize.width + var_148_1:getContentSize().width * 0.5, visibleSize.height * 0.5)))
	var_148_4:addObject(CCCallFuncN:create(var_148_3))

	local var_148_5 = CCSequence:create(var_148_4)

	var_148_1:runAction(var_148_5)
end

function notice.control.flyImage(arg_150_0, arg_150_1, arg_150_2, arg_150_3, arg_150_4)
	local var_150_0 = CCSprite:create(arg_150_0)
	local var_150_1 = arg_150_3 or 0.2
	local var_150_2, var_150_3 = tool.getPositionInScreen(arg_150_1)

	if arg_150_4 then
		var_150_0:setPosition(ccp(arg_150_4.x + var_150_2, arg_150_4.y + var_150_3))
	else
		var_150_0:setPosition(ccp(var_150_2, var_150_3))
	end

	smgr.showTipSpriteText(var_150_0, arg_150_2, var_150_1)
end

function notice.control.testNotice(arg_151_0)
	local var_151_0 = {
		[0] = "halfPic_yuanzhengjun",
		"halfPic_gaoliputong",
		nil,
		nil,
		nil,
		"halfPic_jinweijun",
		[20] = "halfPic_dongyingputong"
	}
	local var_151_1 = CCSprite:create("res/ui/common/halfPic/" .. var_151_0[arg_151_0] .. ".png")
	local var_151_2 = CCSprite:create("res/ui/world/newleague/mzjm_ink.png")
	local var_151_3 = CCSprite:create("res/ui/kfyz/rqTip_" .. arg_151_0 .. ".png")

	var_151_2:setPosition(ccp(120, 20))
	var_151_1:addChild(var_151_2)
	var_151_3:setPosition(ccp(120, 20))
	var_151_1:addChild(var_151_3)
	var_151_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
	smgr.showTipSpriteText(var_151_1, callback, 0.1)
end

function notice.control.clickHuigui()
	log.info("@@ 回归活动")

	local function var_152_0(arg_153_0)
		local var_153_0 = require("lua/layer/activity/activityTab/Huigui").new(arg_153_0.action.data)
		local var_153_1 = smgr.getLayer("topLayer")

		var_153_1:removeAllChildrenWithCleanup(true)
		var_153_1:addChild(var_153_0)
	end

	cmgr.sendRequest(var_152_0, actions.getHUIGUI)
end

function notice.control.openSpecialEvent()
	local var_154_0 = smgr.getLayer("topLayer")

	var_154_0:removeAllChildrenWithCleanup(true)
	require("lua/layer/notice/SpecialEvent").new(var_154_0)
end

function notice.control.getKfyzMedal()
	roleDialogue.control.loadSpeak("kfyzMedal")
end
