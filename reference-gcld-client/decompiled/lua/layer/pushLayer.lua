local var_0_0
local var_0_1
local var_0_2
local var_0_3 = {}

if conf.language == "kr" then
	var_0_3.offset1 = -70
	var_0_3.offset2 = -40
	var_0_3.offset3 = -100
	var_0_3.offset4 = -40
	var_0_3.gemX = 0
	var_0_3.gemY = 0
elseif conf.language == "tha" then
	var_0_3.offset1 = 220
	var_0_3.offset2 = 83
	var_0_3.offset3 = 25
	var_0_3.offset4 = 95
	var_0_3.gemX = 180
	var_0_3.gemY = 5
elseif conf.language == "vie" then
	var_0_3.offset1 = 0
	var_0_3.offset2 = 60
	var_0_3.offset3 = 25
	var_0_3.offset4 = 0
	var_0_3.gemX = 260
	var_0_3.gemY = 5
else
	var_0_3.offset1 = 0
	var_0_3.offset2 = 0
	var_0_3.offset3 = 0
	var_0_3.offset4 = 0
	var_0_3.gemX = 0
	var_0_3.gemY = 0
end

function globalAction_gotResourceEnd(arg_1_0)
	arg_1_0:setVisible(false)
	var_0_0:removeChild(arg_1_0, true)
end

local var_0_4 = {}

var_0_4.zhanbuxingpan = 40001
var_0_4.baoshijiezhi = 40002
var_0_4.xiyutuoling = 40003
var_0_4.dengta = 40004
var_0_4.mingzhuxianglian = 40005
var_0_4.hailuohao = 40006

function getIdByPic(arg_2_0)
	return var_0_4[arg_2_0]
end

function globalAction_gotResource(arg_3_0, arg_3_1)
	amgr.playEffect(enumAudioFile.ui_get_award, false)

	local var_3_0 = #arg_3_0

	if var_3_0 > 0 then
		local var_3_1 = false

		if var_0_1 ~= nil then
			var_0_0:removeChild(sender, true)
		end

		var_0_1 = CCNode:create()

		for iter_3_0, iter_3_1 in pairs(arg_3_0) do
			if user.phantomLimit and iter_3_1.id == 41 then
				var_3_1 = true
			end

			local var_3_2 = globalAction_gotSingleResource(iter_3_1.id, iter_3_1.value, iter_3_1.gemLevel, iter_3_1.suffix)

			if var_3_2 == nil then
				var_0_1:removeAllChildrenWithCleanup(true)
				log.info("push layer , unknow id ", iter_3_1.id)

				return
			end

			var_3_2:setPosition(0, (var_3_0 - 1) * 25 - (iter_3_0 - 1) * 50)
			var_0_1:addChild(var_3_2)
		end

		arg_3_1 = arg_3_1 or ccp(visibleSize.width / 2, visibleSize.height * 0.4)

		var_0_1:setPosition(arg_3_1)

		local var_3_3 = (visibleSize.height * 0.6 - arg_3_1.y) / (visibleSize.height * 0.2 / 0.3)
		local var_3_4 = CCMoveTo:create(var_3_3, ccp(visibleSize.width / 2, visibleSize.height * 0.6))
		local var_3_5 = CCDelayTime:create(0.3)
		local var_3_6 = CCMoveTo:create(0.5, ccp(0, visibleSize.height))
		local var_3_7 = CCScaleTo:create(0.5, 0.1)
		local var_3_8 = CCSpawn:createWithTwoActions(var_3_6, var_3_7)
		local var_3_9 = CCCallFuncN:create(globalAction_gotResourceEnd)
		local var_3_10 = CCArray:create()

		var_3_10:addObject(var_3_4)
		var_3_10:addObject(var_3_5)
		var_3_10:addObject(var_3_8)

		if var_3_1 then
			var_3_10:addObject(CCCallFunc:create(function()
				user.phantomLimit = false

				smgr.showTipText(language.get(20054))
				amgr.playEffect(enumAudioFile.ui_click_error, false, true)
			end))
		end

		var_3_10:addObject(var_3_9)

		local var_3_11 = CCSequence:create(var_3_10)

		var_0_1:runAction(var_3_11)
		var_0_0:addChild(var_0_1)
	end
end

function globalAction_gotSingleResource(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = CCNode:create()
	local var_5_1 = arg_5_0
	local var_5_2
	local var_5_3

	if type(var_5_1) == "number" then
		if var_5_1 > 1000 then
			if var_5_1 < 1130 then
				var_5_1 = 1000
			elseif var_5_1 < 1140 then
				var_5_1 = 1130
			elseif var_5_1 < 1150 then
				var_5_1 = 1140
			elseif var_5_1 < 1160 then
				var_5_1 = 1150
			elseif var_5_1 < 1180 then
				var_5_1 = 1160
			elseif var_5_1 < 1190 then
				var_5_1 = 1180
			elseif var_5_1 > 1200 and var_5_1 <= 1205 then
				var_5_1 = 1205
			end
		end

		local var_5_4 = tonumber(arg_5_2)

		if var_5_1 == 7 and (var_5_4 == nil or var_5_4 == 0) then
			var_5_4 = 1
		end

		if var_5_1 == 41 or var_5_1 == 44 or var_5_1 == 45 or var_5_1 == 46 or var_5_1 == 85 or var_5_1 == 10002 or var_5_1 == 10003 or var_5_1 == 10004 or var_5_1 == 10005 or var_5_1 == 10006 or var_5_1 == 10007 or var_5_1 == 2001 or var_5_1 == 2002 or var_5_1 == 10019 or var_5_1 == 10024 or var_5_1 == 1000000 then
			var_5_2 = CCSprite:create()
		elseif var_5_1 == 61 then
			var_5_2 = CCSprite:create("res/ui/activity/dragonBoat/shijie_shuishou.png")
		elseif var_5_1 == 84 then
			var_5_2 = CCSprite:create("res/ui/activity/famous/get_icon_84.png")
		elseif var_5_1 == 50 then
			var_5_2 = CCSprite:create("res/ui/activity/ancientCastle/gctb_sz.png")
		elseif var_5_1 == 20000 then
			var_5_2 = CCSprite:create("res/ui/kfsy/kfsy_jh.png")
		elseif var_5_1 == 10008 then
			var_5_2 = CCSprite:create("res/ui/gonghe/ghjl_tit_yhcs.png")
		elseif var_5_1 == 35 then
			var_5_2 = CCSprite:create("res/ui/activity/christmasDay/sdhd_zslwh_small.png")

			var_5_2:setScale(1.3)
		elseif var_5_1 == 36 then
			var_5_2 = CCSprite:create("res/ui/activity/christmasDay/sdhd_zscq_small.png")

			var_5_2:setScale(1.3)
		elseif var_5_1 == 37 then
			var_5_2 = CCSprite:create("res/ui/activity/christmasDay/sdhd_zsxh_small.png")

			var_5_2:setScale(1.3)
		elseif var_5_1 == 108 then
			var_5_2 = CCSprite:createWithSpriteFrameName("byzg.jpg")
		elseif var_5_1 == 7 then
			if var_5_4 >= 1 and var_5_4 <= 16 then
				local var_5_5 = math.ceil(var_5_4 / 4)

				var_5_2 = CCSprite:create(string.format("res/ui/activity/gemsActivity/new/gem_a%d.png", var_5_5))
			else
				var_5_2 = CCSprite:create()
			end
		elseif var_5_1 == 1905 then
			var_5_2 = CCSprite:create("res/ui/weapon/diamondShop/bssh_icon_bssq.png")
		elseif var_5_1 == 100023 then
			var_5_2 = CCSprite:createWithSpriteFrameName("res_icon_1160.png")
		elseif var_5_1 == 10020 then
			var_5_2 = CCSprite:create("res/ui/activity/midAutumn/rabbit.png")
		elseif var_5_1 == 10022 then
			var_5_2 = CCSprite:create("res/ui/kfsy/lvbu/lvdqj_qj.png")

			var_5_2:setScale(0.6)
		elseif var_5_1 == 10025 then
			var_5_2 = CCSprite:createWithSpriteFrameName("res_icon_55.png")
		elseif var_5_1 == 20011 then
			var_5_2 = CCSprite:createWithSpriteFrameName("res_icon_6.png")
		elseif var_5_1 == 10030 then
			var_5_2 = CCSprite:create("res/ui/resource/silkroad/sczldj_jn.png")

			var_5_2:setScale(0.55)
		elseif var_5_1 == 10031 then
			var_5_2 = CCSprite:create("res/ui/rankInfo/DailyFeatView/gxb_pb_bx.png")
		elseif var_5_1 == 10032 then
			var_5_2 = CCSprite:create("res/ui/rankInfo/DailyFeatView/gxb_sq.png")
		elseif var_5_1 == 10033 then
			var_5_2 = CCSprite:create("res/ui/activity/gangMine/blgkd_icon_blg.png")

			var_5_2:setScale(0.65)
		elseif var_5_1 == 10050 then
			var_5_2 = CCSprite:create("res/ui/activity/gangMine/blgkd_icon_bljg.png")

			var_5_2:setScale(0.65)
		elseif var_5_1 == 10059 then
			var_5_2 = CCSprite:create("res/ui/weapon/diamondShop/warlock_view_up_list_gem.png")
		elseif var_5_1 == 30011 then
			var_5_2 = CCSprite:create("res/ui/general/juexing/evokezgjl.png")
		elseif var_5_1 == 30012 then
			var_5_2 = CCSprite:create("res/ui/resourceArea2/wood_gaizao/tuzhi.png")
		else
			var_5_2 = CCSprite:createWithSpriteFrameName("res_icon_" .. var_5_1 .. ".png")
		end

		if var_5_1 == 7 then
			arg_5_2 = arg_5_2 or 1
			var_5_3 = CCSprite:create("res/ui/common/text/resource/res_title_gem.png")

			local var_5_6 = CCLabelAtlas:create(tostring(arg_5_2), "res/ui/common/text/resource/res_title_num.png", 30, 45, 48)

			if conf.language == "vie" then
				var_5_6:setPosition(ccp(250, 0))
			else
				var_5_6:setPosition(ccp(0, 0))
			end

			var_5_3:addChild(var_5_6)
		elseif var_5_1 == 113 then
			var_5_3 = CCSprite:create("res/ui/common/text/resource/res_title_15.png")
		elseif var_5_1 == 6 then
			if user.player.gemKit then
				var_5_3 = CCSprite:create("res/ui/common/text/resource/res_title_jnjy.png")
			else
				var_5_3 = CCSprite:create("res/ui/common/text/resource/res_title_" .. arg_5_0 .. ".png")
			end
		elseif var_5_1 == 61 then
			var_5_3 = CCSprite:create("res/ui/common/text/resource/res_title_shuishou.png")
		elseif var_5_1 == 40001 then
			var_5_3 = CCSprite:create("res/ui/common/text/resource/res_title_licheng.png")
		elseif var_5_1 == 65 then
			var_5_3 = CCSprite:create("res/ui/common/text/resource/res_title_milu.png")
		elseif var_5_1 == 10022 then
			var_5_3 = CCSprite:create("res/ui/common/text/resource/res_title_1211.png")
		elseif var_5_1 == 10064 then
			var_5_3 = CCSprite:create("res/ui/common/text/resource/res_title_fdjsc.png")
		elseif var_5_1 == 20001 then
			var_5_3 = CCSprite:create("res/ui/common/text/resource/res_title_zsbw.png")
		elseif var_5_1 == 20011 then
			var_5_3 = CCSprite:create("res/ui/common/text/resource/res_title_wjjy.png")
		elseif var_5_1 == 20012 then
			var_5_3 = CCSprite:create("res/ui/common/text/resource/res_title_mfpqcs.png")
		elseif var_5_1 == 30001 then
			var_5_3 = CCSprite:create("res/ui/common/text/resource/res_title_zy.png")
		elseif var_5_1 == 30011 then
			var_5_3 = CCSprite:create("res/ui/general/juexing/zgljx_word_zgjn.png")
		else
			var_5_3 = CCSprite:create("res/ui/common/text/resource/res_title_" .. arg_5_0 .. ".png")
		end
	else
		var_5_2 = CCSprite:create()
		var_5_3 = CCSprite:create("res/ui/common/text/resource/res_title_" .. arg_5_0 .. ".png")
	end

	if type(arg_5_1) == "number" then
		if arg_5_1 > 0 then
			arg_5_1 = ":" .. math.abs(arg_5_1)
		elseif arg_5_1 < 0 then
			arg_5_1 = ";" .. math.abs(arg_5_1)
		end
	end

	local var_5_7 = CCLabelAtlas:create(tostring(arg_5_1), "res/ui/common/number/get_numb.png", 29, 46, 48)

	var_5_7:setAnchorPoint(ccp(0.5, 0.5))

	local var_5_8 = var_5_2:getContentSize().width * var_5_2:getScaleX()
	local var_5_9 = var_5_3:getContentSize().width
	local var_5_10 = var_5_7:getContentSize().width
	local var_5_11 = (var_5_8 + var_5_9 + var_5_10) / 2

	var_5_2:setPositionX(var_5_8 / 2 - var_5_11)
	var_5_3:setPositionX(var_5_8 + var_5_9 / 2 - var_5_11)
	var_5_7:setPositionX(var_5_8 + var_5_9 + var_5_10 / 2 - var_5_11)

	if conf.language == "vie" and var_5_1 == 6 then
		-- block empty
	else
		var_5_0:addChild(var_5_2)
	end

	var_5_0:addChild(var_5_3)
	var_5_0:addChild(var_5_7)

	if arg_5_3 then
		local var_5_12 = CCSprite:create("res/ui/common/text/resource/" .. arg_5_3 .. ".png")

		var_5_12:setAnchorPoint(ccp(0.5, 0.5))

		local var_5_13 = var_5_12:getContentSize().width
		local var_5_14 = (var_5_8 + var_5_9 + var_5_10 + var_5_13) / 2

		var_5_2:setPositionX(var_5_8 / 2 - var_5_14)
		var_5_3:setPositionX(var_5_8 + var_5_9 / 2 - var_5_14)
		var_5_7:setPositionX(var_5_8 + var_5_9 + var_5_10 / 2 - var_5_14)
		var_5_12:setPositionX(var_5_8 + var_5_9 + var_5_10 + var_5_13 / 2 - var_5_14)
		var_5_0:addChild(var_5_12)
	end

	return var_5_0
end

function globalAction_flyNode(arg_6_0, arg_6_1)
	if arg_6_0 then
		arg_6_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height * 0.4))

		local var_6_0 = CCMoveTo:create(0.3, ccp(visibleSize.width / 2, visibleSize.height * 0.6))
		local var_6_1 = CCDelayTime:create(0.3)
		local var_6_2 = CCMoveTo:create(0.5, ccp(visibleSize.width / 2, visibleSize.height))
		local var_6_3 = CCCallFuncN:create(function(arg_7_0)
			arg_7_0:removeFromParentAndCleanup(true)

			if arg_6_1 then
				arg_6_1()
			end
		end)
		local var_6_4 = CCArray:create()

		var_6_4:addObject(var_6_0)
		var_6_4:addObject(var_6_1)
		var_6_4:addObject(var_6_2)
		var_6_4:addObject(var_6_3)

		local var_6_5 = CCSequence:create(var_6_4)

		arg_6_0:runAction(var_6_5)
		smgr.getLayer("pushLayer"):addChild(arg_6_0)
	end
end

function globalAction_showAutoBattleStart(arg_8_0)
	local var_8_0 = {
		"res/ui/world/autoBattle/zdgz_sta_gdcc.png",
		"res/ui/world/autoBattle/zdgz_sta_jscc.png"
	}
	local var_8_1 = CCSprite:create(var_8_0[arg_8_0])

	var_8_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
	var_0_0:addChild(var_8_1)

	local var_8_2 = CCFadeIn:create(0.5)
	local var_8_3 = CCDelayTime:create(0.5)
	local var_8_4 = var_8_2:reverse()
	local var_8_5 = CCCallFuncN:create(function()
		var_8_1:removeFromParentAndCleanup(true)
	end)
	local var_8_6 = CCArray:create()

	var_8_6:addObject(var_8_2)
	var_8_6:addObject(var_8_3)
	var_8_6:addObject(var_8_4)
	var_8_6:addObject(var_8_5)
	var_8_1:runAction(CCSequence:create(var_8_6))
end

local function var_0_5(arg_10_0)
	if arg_10_0.action.data.bartaskMessage then
		local var_10_0 = arg_10_0.action.data.bartaskMessage.state
		local var_10_1 = arg_10_0.action.data.bartaskMessage.lv
		local var_10_2 = user.player.forceId

		if var_10_0 == 1 then
			local var_10_3 = CCSprite:createWithSpriteFrameName("nationUpgradeSucc.png")

			if var_10_2 == 1 then
				local var_10_4 = CCSprite:createWithSpriteFrameName("nationTextWei.png")

				var_10_4:setPosition(ccp(153, 37))
				var_10_3:addChild(var_10_4)
			elseif var_10_2 == 2 then
				local var_10_5 = CCSprite:createWithSpriteFrameName("nationTextShu.png")

				var_10_5:setPosition(ccp(153, 37))
				var_10_3:addChild(var_10_5)
			else
				local var_10_6 = CCSprite:createWithSpriteFrameName("nationTextWu.png")

				var_10_6:setPosition(ccp(153, 37))
				var_10_3:addChild(var_10_6)
			end

			local var_10_7 = CCLabelAtlas:create(var_10_1, "res/ui/common/number/nation_task_upg_numb.png", 53, 64, 48)

			var_10_7:setPosition(ccp(360, 4))
			var_10_3:addChild(var_10_7)
			rmgr.loadResource("res/ui/nation/fireworks.plist")

			local var_10_8 = CCArray:create()

			for iter_10_0 = 1, 65 do
				local var_10_9 = tool.spriteFrameByName(string.format("yanhua%04d.png", iter_10_0))

				var_10_8:addObject(var_10_9)
			end

			local var_10_10 = CCAnimation:createWithSpriteFrames(var_10_8, 0.1)
			local var_10_11 = CCAnimate:create(var_10_10)
			local var_10_12 = CCSprite:create()

			var_10_12:runAction(var_10_11)
			var_10_12:setPosition(ccp(var_10_3:getContentSize().width / 2, var_10_3:getContentSize().height / 2))
			var_10_3:addChild(var_10_12)
			var_10_3:setScale(1.2)

			local var_10_13 = CCArray:create()

			var_10_13:addObject(CCScaleTo:create(0.2, 1))
			var_10_13:addObject(CCDelayTime:create(5))
			var_10_13:addObject(CCCallFuncN:create(function()
				var_10_3:removeFromParentAndCleanup(true)
			end))
			var_10_3:runAction(CCSequence:create(var_10_13))
			var_10_3:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
			smgr.getLayer("effectlayer"):addChild(var_10_3)
		else
			local var_10_14 = CCSprite:createWithSpriteFrameName("nationShengjishibai.png")

			var_10_14:setScale(1.2)

			local var_10_15 = CCArray:create()

			var_10_15:addObject(CCScaleTo:create(0.2, 1))
			var_10_15:addObject(CCDelayTime:create(5))
			var_10_15:addObject(CCCallFuncN:create(function()
				var_10_14:removeFromParentAndCleanup(true)
			end))
			var_10_14:runAction(CCSequence:create(var_10_15))
			var_10_14:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
			smgr.getLayer("effectlayer"):addChild(var_10_14)
		end
	end
end

function handlerPushManWangLing(arg_13_0)
	if arg_13_0.action.data.manWangLing.countDown < 0 then
		user.manWangLing = nil
	else
		user.manWangLing = arg_13_0.action.data.manWangLing
	end

	eventManager.dispatchEvent("refreshBarToken")
end

function globalAction_levelUp_delay()
	if var_0_2 ~= nil then
		globalAction_levelUp(var_0_2)

		var_0_2 = nil
	end
end

function globalAction_levelUp(arg_15_0)
	if conf.language == "tw" then
		if platform.getFlag() == "MOBILE_ANDROID" then
			if arg_15_0.playerLv == 10 then
				statistics.customEvent("99742191-a9bc-47ef-b4fe-326bf42c2b66")
			elseif arg_15_0.playerLv == 20 then
				-- block empty
			elseif arg_15_0.playerLv == 30 then
				-- block empty
			elseif arg_15_0.playerLv == 40 then
				-- block empty
			end
		elseif platform.getFlag() == "MOBILE_IPHONE" then
			if arg_15_0.playerLv == 10 then
				statistics.customEvent("3b2f8138-2364-4c26-b92d-32da22b86779")
			elseif arg_15_0.playerLv == 20 then
				statistics.customEvent("7710ff29-1f22-4689-b779-5478e417ebb1")
			elseif arg_15_0.playerLv == 30 then
				statistics.customEvent("90f5c20b-5cce-4c7e-9abd-9ec73dc8412f")
			elseif arg_15_0.playerLv == 40 then
				statistics.customEvent("31b62630-77d5-4984-9bc2-6f1b11c77da0")
			end
		end
	end

	if channelMgr.currentChannel == channels.andVivo then
		channelMgr.transform("serverId", user.serverId)
		channelMgr.transform("serverName", user.serverLoginName)
		channelMgr.transform("playerId", user.player.playerId)
		channelMgr.transform("playerName", user.player.name)
		channelMgr.transform("playerLevel", user.player.playerLv)
		channelMgr.createRole()
	end

	if channelMgr.currentChannel == channels.andCaohua then
		channelMgr.transform("serverId", user.serverId)
		channelMgr.transform("serverName", user.serverLoginName)
		channelMgr.transform("playerId", user.player.playerId)
		channelMgr.transform("playerName", user.player.name)
		channelMgr.transform("playerLevel", user.player.playerLv)
		channelMgr.transform("method", "levelUp")
	end

	if channelMgr.currentChannel == channels.andKuaiyong or channelMgr.currentChannel == channels.andTt or channelMgr.currentChannel == channels.andLoexu then
		channelMgr.statForAndroidKuaiyong()
		channelMgr.transform("method", "levelUp")
	end

	if channelMgr.currentChannel == channels.andUC then
		channelMgr.transform("playerName", user.player.name)
		channelMgr.transform("playerLevel", user.player.playerLv)
		channelMgr.transform("method", "levelUp")
	end

	if channelMgr.currentChannel == channels.wanDouJia then
		local var_15_0 = versionUpdateConstant.file.version

		reload(var_15_0)

		local var_15_1 = sys_version

		if var_15_1 and var_15_1.client and tool.cmpVersion("7.4.0.1", var_15_1.client) then
			channelMgr.transform("playerName", user.player.name)
			channelMgr.transform("playerLevel", user.player.playerLv)
			channelMgr.transform("method", "levelUp")
		end
	end

	if channelMgr.currentChannel == channels.qihoo then
		local var_15_2 = versionUpdateConstant.file.version

		reload(var_15_2)

		local var_15_3 = sys_version

		if var_15_3 and var_15_3.client and tool.cmpVersion("7.2.0.1", var_15_3.client) then
			channelMgr.transform("playerName", user.player.name)
			channelMgr.transform("playerLevel", user.player.playerLv)
			channelMgr.transform("method", "levelUp")
		end
	end

	if arg_15_0.playerLv < 10 then
		return
	end

	if smgr.currentSceneTag == SCENE_BATTLE then
		var_0_2 = arg_15_0

		return
	end

	local var_15_4 = CCNode:create()
	local var_15_5 = 0

	if math.mod(arg_15_0.playerLv, 5) == 0 then
		local var_15_6 = CCSprite:create("res/ui/levelup/update_att_clear.png")

		var_15_6:setPosition(ccp(0, var_15_5))
		var_15_4:addChild(var_15_6, 1)

		local var_15_7 = CCLabelAtlas:create(tostring(arg_15_0.playerLv), "res/ui/levelup/update_att_numb.png", 55, 76, 48)

		var_15_7:setPosition(ccp(365 + var_0_3.offset1, 10))
		var_15_7:setString(tostring(arg_15_0.playerLv))
		var_15_6:addChild(var_15_7, 1)
	else
		local var_15_8 = CCSprite:create("res/ui/levelup/update_att.png")

		var_15_8:setPosition(ccp(0, var_15_5))
		var_15_4:addChild(var_15_8, 1)
	end

	local var_15_9 = CCSprite:create("res/ui/levelup/update/update0001.png")

	var_15_9:setPosition(ccp(0, var_15_5))
	var_15_4:addChild(var_15_9, 2)

	local var_15_10 = CCArray:create()

	for iter_15_0 = 1, 22 do
		local var_15_11 = CCSprite:create("res/ui/levelup/update/" .. string.format("update%04d.png", iter_15_0))

		var_15_10:addObject(var_15_11:displayFrame())
	end

	local var_15_12 = CCAnimation:createWithSpriteFrames(var_15_10, 0.1)
	local var_15_13 = CCAnimate:create(var_15_12)
	local var_15_14 = CCArray:create()

	var_15_14:addObject(var_15_13)

	local var_15_15 = CCSequence:create(var_15_14)
	local var_15_16 = CCRepeatForever:create(tolua.cast(var_15_15, "CCActionInterval"))

	var_15_9:runAction(var_15_16)

	local var_15_17 = var_15_5 - 90

	if arg_15_0.updateReward ~= nil then
		for iter_15_1, iter_15_2 in ipairs(arg_15_0.updateReward) do
			if tonumber(iter_15_2.type) == 22 then
				local var_15_18 = CCSprite:create("res/ui/levelup/update_get_view_bg.png")

				var_15_18:setPosition(ccp(0, var_15_17))
				var_15_4:addChild(var_15_18, 1)

				local var_15_19 = CCSprite:create("res/ui/levelup/update_get_worship.png")

				var_15_19:setPosition(ccp(0, var_15_17))

				local var_15_20 = CCLabelAtlas:create(tostring(iter_15_2.num), "res/ui/levelup/update_get_numb.png", 18, 27, 48)

				var_15_20:setPosition(ccp(60 + var_0_3.offset2, 3))
				var_15_19:addChild(var_15_20, 2)
				var_15_4:addChild(var_15_19, 2)

				var_15_17 = var_15_17 - 60
			elseif tonumber(iter_15_2.type) == 25 then
				local var_15_21 = CCSprite:create("res/ui/levelup/update_get_view_bg.png")

				var_15_21:setPosition(ccp(0, var_15_17))
				var_15_4:addChild(var_15_21, 1)

				local var_15_22 = CCSprite:create("res/ui/levelup/update_get_market.png")

				var_15_22:setPosition(ccp(0, var_15_17))

				local var_15_23 = CCLabelAtlas:create(tostring(iter_15_2.num), "res/ui/levelup/update_get_numb.png", 18, 27, 48)

				var_15_23:setPosition(ccp(60 + var_0_3.offset4, 3))
				var_15_22:addChild(var_15_23, 2)
				var_15_4:addChild(var_15_22, 2)

				var_15_17 = var_15_17 - 60
			end
		end
	end

	if arg_15_0.nextSpecialRewardLv ~= nil then
		local var_15_24 = CCSprite:create("res/ui/levelup/update_get_view_bg.png")

		var_15_24:setPosition(ccp(0, var_15_17))
		var_15_4:addChild(var_15_24, 1)

		local var_15_25 = CCSprite:create("res/ui/levelup/update_get_extra.png")

		var_15_25:setPosition(ccp(0, var_15_17))
		var_15_4:addChild(var_15_25, 2)

		local var_15_26 = CCLabelAtlas:create(tostring(arg_15_0.nextSpecialRewardLv), "res/ui/levelup/update_get_numb.png", 18, 27, 48)

		var_15_26:setPosition(ccp(60 + var_0_3.offset3, 3))
		var_15_25:addChild(var_15_26, 2)

		var_15_17 = var_15_17 - 60
	end

	local var_15_27 = {
		16,
		28,
		36,
		53,
		70
	}
	local var_15_28 = 0

	for iter_15_3, iter_15_4 in ipairs(var_15_27) do
		if arg_15_0.playerLv == iter_15_4 then
			var_15_28 = iter_15_3

			break
		end
	end

	if var_15_28 ~= 0 then
		local var_15_29 = CCSprite:create("res/ui/levelup/update_get_view_bg.png")

		var_15_29:setPosition(ccp(0, var_15_17))
		var_15_4:addChild(var_15_29, 1)

		local var_15_30 = CCSprite:create("res/ui/levelup/update_open.png")

		var_15_30:setPosition(ccp(-50, var_15_17))
		var_15_4:addChild(var_15_30, 2)

		local var_15_31 = {
			"blue",
			"gre",
			"yell",
			"red",
			"purp"
		}
		local var_15_32 = CCSprite:create("res/ui/levelup/update_open_" .. var_15_31[var_15_28] .. ".png")

		var_15_32:setPosition(ccp(30, var_15_17))
		var_15_4:addChild(var_15_32, 2)

		var_15_17 = var_15_17 - 50
	end

	var_15_4:setPosition(visibleSize.width / 2, visibleSize.height / 2 - var_15_17 / 2)

	local var_15_33 = CCDelayTime:create(2)
	local var_15_34 = CCMoveTo:create(0.1, ccp(visibleSize.width / 2, visibleSize.height / 2 - var_15_17 / 2 - 10))
	local var_15_35 = CCMoveTo:create(0.3, ccp(visibleSize.width / 2, visibleSize.height / 2 - var_15_17 / 2 + 50))
	local var_15_36 = CCCallFuncN:create(globalAction_gotResourceEnd)
	local var_15_37 = CCArray:create()

	var_15_37:addObject(var_15_33)
	var_15_37:addObject(var_15_34)
	var_15_37:addObject(var_15_35)
	var_15_37:addObject(var_15_36)

	local var_15_38 = CCSequence:create(var_15_37)

	var_15_4:runAction(var_15_38)
	var_0_0:addChild(var_15_4)

	var_0_2 = nil

	amgr.playEffect(enumAudioFile.ui_levelup)
end

function globalAction_checkGift()
	if menuUI.ui.table.layer and not tolua.isnull(menuUI.ui.table.layer) then
		local var_16_0 = menuUI.ui.table.layer:getChildByTag(2001)

		if var_16_0 then
			var_16_0:removeFromParentAndCleanup(true)
		end

		if user.hasGift then
			local var_16_1 = CCMenuItemImage:create("res/ui/noticeIcon/icon_gift.png", "res/ui/noticeIcon/icon_gift.png")

			var_16_1:setPosition(ccp(100, -visibleSize.height / 2 + 150))

			local var_16_2 = CCMenu:createWithItem(var_16_1)
			local var_16_3 = CCSprite:create("res/ui/noticeIcon/icon_gift_lig.png")

			var_16_3:setPosition(ccp(54.5, 57))
			var_16_1:addChild(var_16_3, -1)
			var_16_1:registerScriptTapHandler(function()
				require("lua/layer/playerInfo2/ui")
				require("lua/layer/playerInfo2/setting/ui")

				setting.ui.pageIndex = 4

				playerInfo2.ui.show(3)
			end)

			local var_16_4 = CCFadeIn:create(0.3)
			local var_16_5 = var_16_4:reverse()
			local var_16_6 = CCSequence:createWithTwoActions(var_16_4, var_16_5)

			var_16_3:runAction(CCRepeatForever:create(var_16_6))
			menuUI.ui.table.layer:addChild(var_16_2, 1, 2001)

			local var_16_7 = CCEaseExponentialOut:create(CCRotateBy:create(0.1, -20))
			local var_16_8 = CCEaseExponentialOut:create(CCRotateBy:create(0.2, 40))
			local var_16_9 = CCEaseExponentialOut:create(CCRotateBy:create(0.1, -20))
			local var_16_10 = CCArray:create()

			var_16_10:addObject(var_16_7)
			var_16_10:addObject(var_16_8)
			var_16_10:addObject(var_16_9)

			local var_16_11 = CCSequence:create(var_16_10)
			local var_16_12 = CCSequence:createWithTwoActions(var_16_11, CCDelayTime:create(0.5))

			var_16_1:runAction(CCRepeatForever:create(var_16_12))

			local var_16_13 = versionUpdateConstant.file.version

			reload(var_16_13)

			local var_16_14 = sys_version

			if game.newVersion.appStoreCode == var_16_14.appStoreCode then
				var_16_2:setVisible(false)
			end
		end
	end
end

function handlerPushPlayerInfoAction(arg_18_0)
	log.debug("playerUpData!!")

	local var_18_0 = arg_18_0.action.data.update

	if user.player and isExpUpdate(arg_18_0) then
		if var_18_0.exp then
			user.player.exp = var_18_0.exp
		end

		if var_18_0.expNeed then
			user.player.expNeed = var_18_0.expNeed
		end

		if var_18_0.curKitExp then
			user.player.curKitExp = var_18_0.curKitExp
		end

		if var_18_0.maxKitExp then
			user.player.maxKitExp = var_18_0.maxKitExp
		end

		eventManager.dispatchEvent(eventConst.PLAYER_UPDATE_OVER, var_18_0)

		return
	end

	if var_18_0 and user.player then
		eventManager.dispatchEvent(eventConst.PLAYER_UPDATE_BEFORE, var_18_0)

		if var_18_0.pushCommentTimes and platform.getFlag() == "MOBILE_IPHONE" and conf.language == "kr" and tonumber(var_18_0.pushCommentTimes) == 1 then
			roleDialogue.control.loadSpeak(30)
		end

		if var_18_0.catapultRebuilt then
			user.catapultRebuilt = var_18_0.catapultRebuilt
		end

		if var_18_0.haveUncoverMistActivity then
			user.uncoverFog = var_18_0.haveUncoverMistActivity
		end

		if var_18_0.haveMineDayGift then
			user.haveMineDayGift = var_18_0.haveMineDayGift
		end

		if var_18_0.gold then
			user.player.gold = var_18_0.gold

			eventManager.dispatchEvent("vipLvPush", var_18_0)
		end

		if var_18_0.hasNewMail then
			user.hasNewMail = true
		end

		if var_18_0.wood then
			user.player.wood = var_18_0.wood
		end

		if var_18_0.copper then
			user.player.copper = var_18_0.copper
		end

		if var_18_0.food then
			user.player.food = var_18_0.food
		end

		if var_18_0.iron then
			user.player.iron = var_18_0.iron
		end

		if var_18_0.woodMax then
			user.player.woodMax = var_18_0.woodMax
		end

		if var_18_0.copperMax then
			user.player.copperMax = var_18_0.copperMax
		end

		if var_18_0.foodMax then
			user.player.foodMax = var_18_0.foodMax
		end

		if var_18_0.ironMax then
			user.player.ironMax = var_18_0.ironMax
		end

		if var_18_0.exp then
			user.player.exp = var_18_0.exp
		end

		if var_18_0.expNeed then
			user.player.expNeed = var_18_0.expNeed
		end

		if var_18_0.output then
			for iter_18_0, iter_18_1 in ipairs(var_18_0.output) do
				if iter_18_1.outputType == 1 then
					user.player.copperOutput = iter_18_1.outputValue
					user.player.copperMax = iter_18_1.outputMax
				elseif iter_18_1.outputType == 2 then
					user.player.woodOutput = iter_18_1.outputValue
					user.player.woodMax = iter_18_1.outputMax
				elseif iter_18_1.outputType == 3 then
					user.player.foodOutput = iter_18_1.outputValue
					user.player.foodMax = iter_18_1.outputMax
				elseif iter_18_1.outputType == 4 then
					user.player.ironOutput = iter_18_1.outputValue
					user.player.ironMax = iter_18_1.outputMax
				elseif iter_18_1.outputType == 5 then
					-- block empty
				end
			end
		end

		if var_18_0.haveConsumeGiftActivity then
			user.player.haveConsumeGiftActivity = var_18_0.haveConsumeGiftActivity
		end

		if var_18_0.haveConsumeGift2Activity then
			user.player.haveConsumeGift2Activity = var_18_0.haveConsumeGift2Activity
		end

		if var_18_0.hasGemKit then
			user.player.gemKit = var_18_0.hasGemKit

			log.info("收到满级消息")

			language.expStr = language[10107]
			language[10107] = language[10108]

			if user.player.gemKit == true then
				if user.player.forceId == 1 then
					roleDialogue.control.loadSpeak(842)
				elseif user.player.forceId == 2 then
					roleDialogue.control.loadSpeak(840)
				elseif user.player.forceId == 3 then
					roleDialogue.control.loadSpeak(841)
				end
			end

			log.info("QQQ: end")
		end

		if var_18_0.proAutoBlood ~= nil then
			user.proAutoBlood = var_18_0.proAutoBlood == 1
		end

		if var_18_0.hasBestSuit then
			user.player.hasBestSuit = var_18_0.hasBestSuit
		end

		if var_18_0.expInfo then
			user.player.expInfo = var_18_0.expInfo
		end

		if var_18_0.bestSuitAnimation then
			roleDialogue.control.loadSpeak(2370)
		end

		if var_18_0.havePayRedBagActivity then
			user.player.havePayRedBagActivity = var_18_0.havePayRedBagActivity == 2
		end

		if var_18_0.firstNation4 then
			log.info("收到箭塔小倩的消息")
			roleDialogue.control.loadSpeak(1600)
		end

		if var_18_0.celeType and var_18_0.celeGoods then
			log.info("@@ 恭贺触发")
			require("lua/layer/celebration/ui")

			celebration.dialogueType = var_18_0.celeType
			celebration.dialogueName = var_18_0.celeGoods

			roleDialogue.control.loadSpeak(1700)
		end

		if var_18_0.hjRewardExp or var_18_0.hjRewardIron then
			local var_18_1
			local var_18_2
			local var_18_3 = CCSprite:create("res/ui/world/huangjin/hjqy_tit_01.png")

			if var_18_0.hjRewardExp then
				var_18_1 = CCLabelAtlas:create(string.format("%s", var_18_0.hjRewardExp / 10000), "res/ui/world/huangjin/hjqy_tit_digit.png", 42, 50, 48)

				var_18_1:setAnchorPoint(ccp(0.5, 0.5))

				var_18_2 = CCSprite:create("res/ui/world/huangjin/hjqy_tit_03.png")
			elseif var_18_0.hjRewardIron then
				var_18_1 = CCLabelAtlas:create(string.format("%s", var_18_0.hjRewardIron / 10000), "res/ui/world/huangjin/hjqy_tit_digit.png", 42, 50, 48)

				var_18_1:setAnchorPoint(ccp(0.5, 0.5))

				var_18_2 = CCSprite:create("res/ui/world/huangjin/hjqy_tit_02.png")
			end

			local var_18_4 = CCSprite:create("res/ui/nationTask/thief/tmzj_city_bg.png")

			var_18_4:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))

			local var_18_5 = createRichNode({
				var_18_3,
				var_18_1,
				var_18_2
			}, 0.5)

			var_18_5:setPosition(ccp(var_18_4:getContentSize().width / 2, var_18_4:getContentSize().height / 2))
			var_18_4:addChild(var_18_5)
			smgr.getLayer("pushLayer"):addChild(var_18_4)

			local var_18_6 = CCArray:create()

			var_18_6:addObject(CCFadeIn:create(0.5))
			var_18_6:addObject(CCDelayTime:create(2))
			var_18_6:addObject(CCFadeOut:create(0.5))
			var_18_6:addObject(CCCallFunc:create(function()
				var_18_4:removeFromParentAndCleanup(true)
			end))
			var_18_4:runAction(CCSequence:create(var_18_6))
		end

		if var_18_0.zfjxNum and var_18_0.zfjxForceId and var_18_0.zfjxNum > 0 then
			log.info("@@ 张飞吼人")

			local var_18_7 = smgr.getLayer("tipLayer")

			if var_18_7 then
				local var_18_8 = CCSprite:create("res/ui/battle/battle_tip_background.png")

				var_18_8:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
				var_18_7:addChild(var_18_8)

				local function var_18_9()
					var_18_7:removeChild(var_18_8, true)
				end

				local var_18_10

				log.info("playerUpData.zfjxForceId" .. var_18_0.zfjxForceId .. user.player.forceId)

				if var_18_0.zfjxForceId == user.player.forceId then
					var_18_10 = CCStrokeLabelTTF:create(language.get(490721, var_18_0.zfjxNum), "Thonburi-Bold", 32)
				else
					var_18_10 = CCStrokeLabelTTF:create(language.get(490722, var_18_0.zfjxNum), "Thonburi-Bold", 32)
				end

				local var_18_11 = 200

				if var_18_10 then
					var_18_10:setPosition(ccp(var_18_8:getContentSize().width * 0.5 + var_18_11, var_18_8:getContentSize().height * 0.5))
					var_18_8:addChild(var_18_10)

					local var_18_12 = CCArray:create()

					var_18_12:addObject(CCFadeIn:create(0.06))
					var_18_12:addObject(CCMoveBy:create(0.3, ccp(-var_18_11, 0)))
					var_18_12:addObject(CCDelayTime:create(2.5))
					var_18_12:addObject(CCMoveBy:create(0.3, ccp(-var_18_11, 0)))
					var_18_12:addObject(CCFadeOut:create(0.06))
					var_18_12:addObject(CCCallFuncN:create(var_18_9))

					local var_18_13 = CCSequence:create(var_18_12)

					var_18_10:runAction(CCSequence:create(var_18_12))
				end
			end
		end

		if var_18_0.curKitExp then
			user.player.curKitExp = var_18_0.curKitExp
		end

		if var_18_0.maxKitExp then
			user.player.maxKitExp = var_18_0.maxKitExp
		end

		if var_18_0.displayTech then
			user.displayTech = var_18_0.displayTech
		end

		if var_18_0.vipLv then
			user.player.vipLv = var_18_0.vipLv

			eventManager.dispatchEvent("vipLvPush", var_18_0)
		end

		if var_18_0.playerLv then
			user.player.playerLv = var_18_0.playerLv

			log.debug("玩家升级了 刷新一下副本")
			eventManager.dispatchEvent("refreshInstance")
			globalAction_levelUp(var_18_0)

			if channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan or conf.language == "xm" then
				ChannelManager:getInstance():transform("updatelv", var_18_0.playerLv)
			end

			if user.player.playerLv >= 40 and math.mod(user.player.playerLv, 10) == 0 then
				smgr.showScoreTips()
			end
		end

		if var_18_0["function"] then
			user.setFunctionData(var_18_0["function"])
		end

		if var_18_0.inPveBattle ~= nil then
			user.player.inPveBattle = var_18_0.inPveBattle

			log.info("@@@ in pev battle : ", user.player.inPveBattle)
		end

		if var_18_0.inOccupyBattle ~= nil then
			user.player.inOccupyBattle = var_18_0.inOccupyBattle
		end

		if var_18_0.goldOrderNum ~= nil then
			user.goldOrderNum = var_18_0.goldOrderNum

			eventManager.dispatchEvent("refreshGoldOrder")
		end

		if var_18_0.hasGoldOrder ~= nil then
			user.hasGoldOrder = var_18_0.hasGoldOrder

			eventManager.dispatchEvent("refreshGoldOrder")
		end

		if var_18_0.haveSwordActivity then
			user.player.hasSDTJActivity = var_18_0.haveSwordActivity
		end

		if var_18_0.curLv and var_18_0.curExp and var_18_0.addExp and var_18_0.lvExp then
			user.player.sdtjMaxExp = var_18_0.lvExp
			user.player.sdtjcurExp = var_18_0.curExp
			user.player.sdtjLv = var_18_0.curLv

			eventManager.dispatchEvent("refreshTJSDExp")
		end

		if var_18_0.buffId then
			if var_18_0.buff and var_18_0.buff > 0 then
				user.player.hasSdtjBuff = true
				user.player.sdtjBuffLv = var_18_0.buff
				user.player.sdtjBuffId = var_18_0.buffId
			else
				user.player.hasSdtjBuff = false
			end

			eventManager.dispatchEvent("sdtjBuff")
		end

		if var_18_0.isNewSword then
			var_18_0.haveNewSwordActivity = var_18_0.haveSwordActivity
			var_18_0.haveSwordActivity = 0
		end

		if var_18_0.supplyOpen then
			roleDialogue.control.loadSpeak("warShop")

			user.supplyOpen = var_18_0.supplyOpen
		end

		if var_18_0.canGetMedal ~= nil then
			user.canGetMedal = var_18_0.canGetMedal
			user.conquestRate = var_18_0.conquestRate
			user.medal = var_18_0.medal
		end

		if var_18_0.hasOfflineBuff then
			user.player.hasOfflineBuff = var_18_0.hasOfflineBuff
			user.player.offlineBuffId = var_18_0.offlineBuffId
			user.player.offlineEndTime = var_18_0.endTime

			eventManager.dispatchEvent("offlineBuff")
		end

		if var_18_0.pin ~= nil then
			user.pin = var_18_0.pin

			if user.pin == 0 then
				roleDialogue.control.loadSpeak(1522)

				user.isNewKing = true
			end
		end

		if var_18_0.inJuBen ~= nil then
			user.inJuBen = var_18_0.inJuBen
		end

		if var_18_0.startEvokeZgl ~= nil then
			user.startEvokeZgl = var_18_0.startEvokeZgl
		end

		if var_18_0.readyEvokeZgl ~= nil then
			user.readyEvokeZgl = var_18_0.readyEvokeZgl
		end

		if var_18_0.evokeGenerals ~= nil then
			for iter_18_2, iter_18_3 in ipairs(var_18_0.evokeGenerals) do
				if iter_18_3 == 270 then
					user.startEvokeXhd = true
				elseif iter_18_3 == 230 then
					user.startEvokeGN = true
				elseif iter_18_3 == 201 then
					user.startEvokeLB = true
				elseif iter_18_3 == 275 then
					user.startEvokeHYY = true
				end
			end
		end

		if var_18_0.seeSixTreasureIcon ~= nil then
			user.seeSixTreasureIcon = var_18_0.seeSixTreasureIcon
		end

		if var_18_0.seeSevenTreasureIcon ~= nil then
			user.seeSevenTreasureIcon = var_18_0.seeSevenTreasureIcon
		end

		if var_18_0.seeEightTreasureIcon ~= nil then
			user.seeEightTreasureIcon = var_18_0.seeEightTreasureIcon
		end

		if var_18_0.kfgzState then
			user.kfgzState = var_18_0.kfgzState

			if var_18_0.kfgzState == 1 then
				eventManager.dispatchEvent("kfworldBattleOver", var_18_0.kfgzState)
			else
				eventManager.dispatchEvent("changeMatchState", var_18_0.kfgzState)
			end
		end

		if var_18_0.kfzbState and user.kfzbState ~= -60 and user.kfzbState ~= var_18_0.kfzbState then
			user.kfzbState = var_18_0.kfzbState

			if user.kfzbState > 30 then
				eventManager.dispatchEvent("kfzbStateChg", true)
			end
		end

		if var_18_0.kfzbZone then
			user.kfzbZone = var_18_0.kfzbZone
		end

		if var_18_0.showKfzbCele ~= nil then
			user.showKfzbCele = var_18_0.showKfzbCele
		end

		if var_18_0.moveFaster then
			user.moveFaster = var_18_0.moveFaster
		end

		if var_18_0.kfyzState then
			user.kfyzState = var_18_0.kfyzState
			user.invastType = var_18_0.invastType or user.invastType
			user.noSchedule = var_18_0.noSchedule or user.noSchedule
			user.startTime = var_18_0.startTime or user.startTime
			user.isInSd = var_18_0.isInSd or user.isInSd
			user.jpsIndex = var_18_0.jpsIndex or user.jpsIndex

			eventManager.dispatchEvent("kfyzStateChg")
		end

		user.disturbState = var_18_0.disturbState or user.disturbState
		user.forceExp = var_18_0.forceExp or user.forceExp
		user.signComplete = var_18_0.signComplete or user.signComplete
		user.jpsWin = var_18_0.jpsWin or user.jpsWin

		if user.isPro ~= 1 and var_18_0.isPro == 1 then
			user.isPro = 1

			eventManager.dispatchEvent("changeWorkerIsPro")
		end

		if var_18_0.kfmgShowTipsState then
			user.kfmgState = var_18_0.kfmgShowTipsState
		end

		log.info("playerUpData.kfmgShowTipsState = ", var_18_0.kfmgShowTipsState)

		if var_18_0.haveGDSMoonFestivalActivity ~= nil then
			user.haveGDSMoonFestivalActivity = var_18_0.haveGDSMoonFestivalActivity
		end

		if var_18_0.canCatchRabbit ~= nil then
			user.canCatchRabbit = var_18_0.canCatchRabbit
		end

		user.silkIcon = var_18_0.silkIcon or user.silkIcon
		user.openSilkFunction = var_18_0.openSilkFunction or user.openSilkFunction
		user.haveWorldFuBen = var_18_0.haveWorldFuBen or user.haveWorldFuBen
		user.haveTreasureFinish = var_18_0.haveTreasureFinish or user.haveTreasureFinish
		user.silkRoadDispatch = var_18_0.silkRoadDispatch or user.silkRoadDispatch

		if var_18_0.haveTelFareActivity then
			user.haveTelFareActivity = var_18_0.haveTelFareActivity
		end

		if var_18_0.discountCountDown then
			user.hasDiscountIcon = var_18_0.hasDiscountIcon
			user.discountCountDown = var_18_0.discountCountDown
		end

		if var_18_0.haveInviteCodeActivity and channelMgr.currentChannel == channels.iosAppstore then
			user.haveInviteCodeActivity = var_18_0.haveInviteCodeActivity
		end

		if var_18_0.haveBigRotaryActivity then
			user.haveBigRotaryActivity = var_18_0.haveBigRotaryActivity
		end

		if var_18_0.haveZhuanPanActivity then
			user.haveZhuanPanActivity = var_18_0.haveZhuanPanActivity
		end

		if var_18_0.haveBaiNianBuff then
			user.haveBaiNianBuff = var_18_0.haveBaiNianBuff
			user.baiNianBuffCd = var_18_0.baiNianBuffCd
		end

		if var_18_0.haveIronRewardActivity == 2 then
			activityConstant.TYPES.ACTIVITY_IRON_REWARD.name = language.get(130058)
		end

		if var_18_0.haveIronGiveActivity == 2 then
			activityConstant.TYPES.ACTIVITY_IRON_GIVE.name = language.get(130059)
		end

		if var_18_0.haveDragonBoatActivity and var_18_0.haveDragonBoatActivity ~= 0 then
			activityConstant.TYPES.ACTIVITY_DRAGON_BOAT.name = language.get(var_18_0.haveDragonBoatActivity == 1 and 130067 or 130068)
			user.haveDragonBoatActivity = var_18_0.haveDragonBoatActivity
		end

		if var_18_0.haveDwxzActivity and var_18_0.haveDwxzActivity ~= 0 then
			activityConstant.TYPES.ACTIVITY_DWXZ.name = language.get(var_18_0.haveDwxzActivity == 1 and 130076 or 130082)
			user.haveDwxzActivity = var_18_0.haveDwxzActivity
		end

		if var_18_0.haveNewYearRedPaperActivity and var_18_0.haveNewYearRedPaperActivity ~= 0 then
			activityConstant.TYPES.ACTIVITY_MU_NIU.name = language.get(var_18_0.haveNewYearRedPaperActivity == 1 and 130072 or 130084)
			user.haveNewYearRedPaperActivity = var_18_0.haveNewYearRedPaperActivity
		end

		if var_18_0.pay0805BuffStartCd then
			user.pay0805BuffStartCd = var_18_0.pay0805BuffStartCd
		end

		if var_18_0.pay0805BuffEndCd then
			user.pay0805BuffEndCd = var_18_0.pay0805BuffEndCd
		end

		if var_18_0.hasBuildReward ~= nil then
			user.hasBuildReward = var_18_0.hasBuildReward
		end

		if var_18_0.ironRotaryEventCountAdd and var_18_0.ironRotaryEventCountAdd > 0 then
			local var_18_14 = {
				{}
			}

			var_18_14[1].id = 10004
			var_18_14[1].value = var_18_0.ironRotaryEventCountAdd

			globalAction_gotResource(var_18_14)
		end

		if var_18_0.gemRotaryEventCountAdd and var_18_0.gemRotaryEventCountAdd > 0 then
			local var_18_15 = {
				{}
			}

			var_18_15[1].id = 10004
			var_18_15[1].value = var_18_0.gemRotaryEventCountAdd

			globalAction_gotResource(var_18_15)
		end

		if var_18_0.newGemRotaryEventCountAdd and var_18_0.newGemRotaryEventCountAdd > 0 then
			local var_18_16 = {
				{}
			}

			var_18_16[1].id = 10004
			var_18_16[1].value = var_18_0.newGemRotaryEventCountAdd

			globalAction_gotResource(var_18_16)
		end

		if var_18_0.superGemRotaryEventCountAdd and var_18_0.superGemRotaryEventCountAdd > 0 then
			local var_18_17 = {
				{}
			}

			var_18_17[1].id = 10004
			var_18_17[1].value = var_18_0.superGemRotaryEventCountAdd

			globalAction_gotResource(var_18_17)
		end

		if var_18_0.sevenCatchForcesFull == 1 then
			local var_18_18 = CCSprite:create("res/ui/activity/sevenCatch/qtmh_word_djjjwc.png")

			var_18_18:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 + 50))
			smgr.showTipSpriteText(var_18_18)
		end

		if var_18_0.sublimated then
			log.info("playerUpData.sublimated: ", var_18_0.sublimated)

			user.sublimated = var_18_0.sublimated
		end

		if var_18_0.weiName then
			user.forceIdToName[1] = var_18_0.weiName
		end

		if var_18_0.shuName then
			user.forceIdToName[2] = var_18_0.shuName
		end

		if var_18_0.wuName then
			user.forceIdToName[3] = var_18_0.wuName
		end

		if var_18_0.hasGemBonus ~= nil then
			user.hasGemBonus = var_18_0.hasGemBonus
		end

		if var_18_0.feudState then
			user.feudState = var_18_0.feudState
			user.feudCd = var_18_0.feudCd
		end

		if var_18_0.feudLeftTimes then
			user.feudLeftTimes = var_18_0.feudLeftTimes
		end

		if var_18_0.specialPhantom ~= nil then
			user.specialPhantom = var_18_0.specialPhantom
		end

		if var_18_0.isFirstChangeName then
			roleDialogue.control.loadSpeak(1982)
		end

		if var_18_0.needChangeName and user.pin == 0 then
			roleDialogue.control.loadSpeak(1990)
		end

		local function var_18_19(arg_21_0)
			if type(arg_21_0) == "number" then
				return arg_21_0 > 0
			elseif type(arg_21_0) == "boolean" then
				return arg_21_0
			elseif type(arg_21_0) == "string" then
				return arg_21_0 == "1"
			end
		end

		if var_18_0.openTrade then
			user.player.openTrade = var_18_19(var_18_0.openTrade)
		end

		if var_18_0.hasGift ~= nil then
			user.hasGift = var_18_19(var_18_0.hasGift)

			globalAction_checkGift()
		end

		if var_18_0.woodChangedDrawingCommand then
			log.info("playerUpData.woodChangedDrawingCommand:", var_18_0.woodChangedDrawingCommand)

			if var_18_0.woodChangedDrawingCommand == 1 then
				roleDialogue.control.loadSpeak(1940)
			elseif var_18_0.woodChangedDrawingCommand == 3 then
				roleDialogue.control.loadSpeak(1941)
			elseif var_18_0.woodChangedDrawingCommand == 2 then
				roleDialogue.control.loadSpeak(1942)
			end
		end

		if var_18_0.silkTraderChange and var_18_0.silkTraderChange == 1 then
			log.info("playerUpData.silkTraderChange:", var_18_0.silkTraderChange)
			roleDialogue.control.loadSpeak(1943)
		end

		if var_18_0.godEnchancerOpen then
			roleDialogue.control.loadSpeak("godGemTech1")
			roleDialogue.control.loadSpeak("godGemTech2")
		end

		if var_18_0.spSlaughters then
			user.spSlaughters = var_18_0.spSlaughters
		end

		if rmgr.isNotComplete() then
			var_18_0.haveIronMineActivity = 0
			var_18_0.haveNationalDayActivity = 0
			var_18_0.haveBeastActivity = 0
			var_18_0.haveBaiNianActivity = 0
			var_18_0.haveWishActivity = 0
			var_18_0.haveSevenCatchActivity = 0
			var_18_0.haveGodPaperActivity = 0
			var_18_0.haveGDSMoonFestivalActivity = false
			var_18_0.haveSkyLanternEvent = 0
			var_18_0.haveFishActivity = 0
			var_18_0.haveRewardGeneralActivity = 0
			var_18_0.haveHorseRacingActivity = 0
			var_18_0.haveSuperGemRotaryActivity = 0
			var_18_0.haveGemMineActivity = 0
			var_18_0.haveHeroActivity = 0
			var_18_0.haveNewSwordActivity = 0
			var_18_0.ironMountainEvent = 0
			var_18_0.haveIronGiveActivity = 0
			var_18_0.haveSilkshopActivity = 0
			var_18_0.haveMulNationEvent = 0
			var_18_0.haveKindomBuildSprint = 0
			var_18_0.haveTrialBuildEvent = 0
			var_18_0.haveSeaSilkRoadActivity = 0
			var_18_0.haveMoonCakeActivity = 0
			var_18_0.haveSilkCardEvent = 0
			var_18_0.haveGangMineActivity = 0
			var_18_0.haveGangCardEvent = 0
			var_18_0.haveSeasilkRoad2Activity = 0
			var_18_0.haveDragonBoatActivity = 0
			var_18_0.haveTsDrinkingEvent = 0
			var_18_0.haveJueStoneActivity = 0
			var_18_0.haveNewLanternActivity = 0
			var_18_0.haveNewYearRedPaperActivity = 0
			var_18_0.haveTombActivity = 0
			var_18_0.haveSpecialOfftime = 0
			var_18_0.haveSpecialOfftime2 = 0
			var_18_0.haveSpecialOfftime3 = 0
			var_18_0.haveSpecialOfftime4 = 0
			var_18_0.haveHeroActivity2 = 0
			var_18_0.haveLookActivity = 0
			var_18_0.haveDwxzActivity = 0
			var_18_0.haveQAActivity = 0
			var_18_0.hasEntertainWarlordAct = 0
			var_18_0.arrowBoatEvent = 0
			var_18_0.hasChangbanSally = 0
			var_18_0.meteorIncenseEvent = 0
			var_18_0.hasPay0805 = 0
			var_18_0.yearBeast17 = 0
			var_18_0.MeteoriteEvent = 0
		end

		if var_18_0.haveLookActivity then
			user.haveLookActivityIcon = var_18_0.haveLookActivity
		end

		if var_18_0.haveDragonBoatActivity then
			user.haveDragonBoatActivity = var_18_0.haveDragonBoatActivity
		end

		require("lua/layer/activity/constant")

		user.activity = user.activity or {}
		user.newActivity = user.newActivity or {}

		for iter_18_4, iter_18_5 in pairs(activityConstant.TYPES) do
			if var_18_0[iter_18_5.key] ~= nil then
				log.info("find a activity change!!!", iter_18_5.key, var_18_0[iter_18_5.key])

				local var_18_20 = var_18_19(var_18_0[iter_18_5.key])

				log.info("bool", var_18_20)

				user.activity[iter_18_5.key] = var_18_20

				if var_18_20 then
					log.info("new activity")
					log.info("show old activity", unpack(user.newActivity))

					local var_18_21 = false

					for iter_18_6, iter_18_7 in pairs(user.newActivity) do
						if iter_18_7 == iter_18_5.id then
							var_18_21 = true
						end
					end

					if not var_18_21 then
						user.newActivity[#user.newActivity + 1] = iter_18_5.id
					end

					log.info("show new activity", unpack(user.newActivity))
				else
					log.info("old activity")
					log.info("show old activity", unpack(user.newActivity))

					local var_18_22

					for iter_18_8, iter_18_9 in pairs(user.newActivity) do
						if iter_18_9 == iter_18_5.id then
							var_18_22 = iter_18_8
						end
					end

					if var_18_22 then
						table.remove(user.newActivity, var_18_22)
					end

					log.info("show new activity", unpack(user.newActivity))
				end
			end
		end

		eventManager.dispatchEvent("refreshActivityNotice")

		if var_18_0.tryTasks then
			user.curTryTask = var_18_0.tryTasks
		end

		if var_18_0.tryTaskSuccess and (smgr.currentSceneTag == SCENE_WORLD or smgr.currentSceneTag == SCENE_BATTLE) then
			local var_18_23

			if var_18_0.tryTaskSuccess == 1 then
				var_18_23 = CCSprite:createWithSpriteFrameName("nationShilianshengli.png")

				rmgr.loadResource("res/ui/nation/fireworks.plist")

				local var_18_24 = CCArray:create()

				for iter_18_10 = 1, 65 do
					local var_18_25 = tool.spriteFrameByName(string.format("yanhua%04d.png", iter_18_10))

					var_18_24:addObject(var_18_25)
				end

				local var_18_26 = CCAnimation:createWithSpriteFrames(var_18_24, 0.1)
				local var_18_27 = CCAnimate:create(var_18_26)
				local var_18_28 = CCSprite:create()

				var_18_28:runAction(var_18_27)
				var_18_28:setPosition(ccp(var_18_23:getContentSize().width / 2, var_18_23:getContentSize().height / 2))
				var_18_23:addChild(var_18_28)
			else
				var_18_23 = CCSprite:createWithSpriteFrameName("nationShilianshibai.png")
			end

			var_18_23:setScale(1.2)

			local var_18_29 = CCArray:create()

			var_18_29:addObject(CCScaleTo:create(0.2, 1))
			var_18_29:addObject(CCDelayTime:create(5))
			var_18_29:addObject(CCCallFuncN:create(function()
				var_18_23:removeFromParentAndCleanup(true)
			end))
			var_18_23:runAction(CCSequence:create(var_18_29))
			var_18_23:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
			smgr.getLayer("effectlayer"):addChild(var_18_23)
		end

		if var_18_0.tryTaskStage and (smgr.currentSceneTag == SCENE_WORLD or smgr.currentSceneTag == SCENE_BATTLE) then
			local var_18_30

			if var_18_0.tryTaskStage == 1 then
				var_18_30 = CCSprite:create("res/ui/world/nationManzuzhuanyi.png")
			elseif var_18_0.tryTaskStage == 2 then
				var_18_30 = CCSprite:create("res/ui/world/nationManzujinwei.png")
			else
				var_18_30 = CCSprite:create("res/ui/world/nationManwangfaling.png")
			end

			local var_18_31 = smgr.getLayer("effectlayer")
			local var_18_32 = CCSprite:create("res/ui/world/smmz_fli_enter.png")

			var_18_32:setPosition(ccp(visibleSize.width + var_18_32:getContentSize().width * 0.5, visibleSize.height * 0.5))
			var_18_31:addChild(var_18_32)
			var_18_30:setPosition(ccp(var_18_32:getContentSize().width * 0.5, var_18_32:getContentSize().height * 1.2))
			var_18_32:addChild(var_18_30)

			local function var_18_33()
				var_18_31:removeChild(var_18_32, true)
			end

			local var_18_34 = rmgr.getSpeedEffectAnimation()
			local var_18_35 = CCAnimation:createWithSpriteFrames(var_18_34, 0.08)
			local var_18_36 = CCAnimate:create(var_18_35)
			local var_18_37 = CCRepeatForever:create(var_18_36)
			local var_18_38 = CCSprite:create()

			var_18_38:runAction(var_18_37)
			var_18_38:setPosition(ccp(var_18_32:getContentSize().width * 0.5, var_18_32:getContentSize().height * 0.5))
			var_18_32:addChild(var_18_38)

			local var_18_39 = CCArray:create()

			var_18_39:addObject(CCMoveTo:create(0.5, ccp(visibleSize.width * 0.5, visibleSize.height * 0.5)))
			var_18_39:addObject(CCDelayTime:create(2))
			var_18_39:addObject(CCMoveTo:create(0.5, ccp(0 - var_18_32:getContentSize().width * 0.5, visibleSize.height * 0.5)))
			var_18_39:addObject(CCCallFuncN:create(var_18_33))

			local var_18_40 = CCSequence:create(var_18_39)

			var_18_32:runAction(var_18_40)
		end

		if var_18_0.showIncense and var_18_0.resourceType and tonumber(var_18_0.resourceType) > 0 then
			require("lua/layer/incenseLink/ui")
			incenseLink.ui.show(var_18_0.resourceType)
		end

		if var_18_0.refreshHeroActivity then
			log.info("HeroDrinkRefresh")
			eventManager.dispatchEvent("HeroDrinkRefresh")
		end

		if var_18_0.zuiyi then
			local var_18_41 = {
				{}
			}

			var_18_41[1].id = 30001
			var_18_41[1].value = var_18_0.zuiyi

			globalAction_gotResource(var_18_41)
		end

		if conf.language == "tw" then
			local var_18_42 = channelMgr.getCurrentChannel()

			if var_18_42 == channels.andTwGo2Play or var_18_42 == channels.andTwGo2PlayThird then
				local var_18_43 = var_18_0.go2playBilling

				if var_18_43 then
					channelMgr.transform("billing", var_18_43.gold .. "_" .. var_18_43.unit)
				end
			end
		end

		if var_18_0.evokeZglGemNotify then
			roleDialogue.control.loadSpeak(2170)
		end

		if var_18_0.haveKindomBuildSprint then
			user.haveKindomBuildSprint = var_18_0.haveKindomBuildSprint
		end

		if var_18_0.haveBetterPigCityId then
			user.haveBetterPigCityId = var_18_0.haveBetterPigCityId

			if smgr.currentSceneTag == SCENE_WORLD then
				eventManager.dispatchEvent("haveBetterPigCityId")
			end

			loadingLayer.show(SCENE_WORLD, var_18_0.haveBetterPigCityId)
		end

		if var_18_0.hasVipPrivilege ~= nil then
			user.hasVipPrivilege = var_18_0.hasVipPrivilege
			user.shouldShowVipPrivilege = true
		end

		if var_18_0.needPoint then
			user.needPoint = var_18_0.needPoint

			if var_18_0.displayLight == false then
				needShowKaiguangAnimationBegin = true
			end
		end

		if var_18_0.currentPoint then
			user.currentPoint = var_18_0.currentPoint
		end

		eventManager.dispatchEvent(eventConst.PLAYER_UPDATE_OVER, var_18_0)
	end
end

function isExpUpdate(arg_24_0)
	if arg_24_0 and arg_24_0.action and arg_24_0.action.data and arg_24_0.action.data.update then
		local var_24_0 = arg_24_0.action.data.update
		local var_24_1 = 0

		if var_24_0.exp and var_24_0.expNeed then
			for iter_24_0, iter_24_1 in pairs(var_24_0) do
				var_24_1 = var_24_1 + 1
			end

			if var_24_1 == 2 then
				return true
			end
		end

		if var_24_0.curKitExp and var_24_0.maxKitExp then
			for iter_24_2, iter_24_3 in pairs(var_24_0) do
				var_24_1 = var_24_1 + 1
			end

			if var_24_1 == 2 then
				return true
			end
		end
	end

	return false
end

function handlerPushChatAction(arg_25_0)
	local var_25_0 = arg_25_0.action.data.chatSend

	if chatEnum then
		table.insert(user.player.chatMessageList, var_25_0)

		if table.getn(user.player.chatMessageList) > chatEnum.maxMsgNum then
			table.remove(user.player.chatMessageList, 1)
		end

		eventManager.dispatchEvent("pushChat", var_25_0)
	end
end

local function var_0_6()
	if smgr.currentSceneTag == SCENE_WORLD then
		user.championList = user.championList or {}

		for iter_26_0, iter_26_1 in pairs(user.championList) do
			if iter_26_1.cityId and iter_26_1.forceId ~= user.player.forceId then
				loadingLayer.show(SCENE_WORLD, iter_26_1.cityId)

				return
			end
		end
	end

	user.seeChampionCity = true

	loadingLayer.show(SCENE_WORLD)
end

local function var_0_7()
	log.info("worldClean")

	if worldControl then
		log.info("检测到进入过世界 清除位置")

		worldControl.memoryLocaition = nil
	end
end

function handlerPushJubenAction(arg_28_0)
	local var_28_0 = arg_28_0.action.data

	if var_28_0.eventFinish and (var_28_0.eventFinish.type == "hy" or var_28_0.eventFinish.type == "tujin") then
		local var_28_1 = CCSprite:create("res/ui/juben/event/jb_hide_set.png")

		var_28_1:setPosition(ccp(visibleSize.width + var_28_1:getContentSize().width / 2, visibleSize.height / 2))
		var_0_0:addChild(var_28_1)

		local var_28_2
		local var_28_3

		if var_28_0.eventFinish.type == "hy" then
			var_28_2 = CCSprite:create("res/ui/juben/event/jb_hide_suc_jbdr.png")
			var_28_3 = CCSprite:create("res/ui/juben/event/jb_hide_award_ib.png")
		elseif var_28_0.eventFinish.type == "tujin" then
			var_28_2 = CCSprite:create("res/ui/juben/event/jb_hide_suc_gdyx.png")
			var_28_3 = CCSprite:create("res/ui/juben/event/jb_hide_award_tj.png")
		else
			var_28_2 = CCSprite:create()
			var_28_3 = CCSprite:create()
		end

		var_28_2:setPosition(ccp(163, 163))
		var_28_1:addChild(var_28_2)

		local var_28_4 = CCLabelAtlas:create(tostring(var_28_0.eventFinish.number), "res/ui/common/number/resou_up_numb.png", 20, 22, 48)

		var_28_4:setAnchorPoint(ccp(0.5, 0.5))

		local var_28_5 = CCSprite:create("res/ui/juben/event/jb_hide_award_c.png")
		local var_28_6 = CCSprite:create("res/ui/juben/event/jb_hide_award_wc.png")

		var_28_3:setPosition(ccp(62, 79))
		var_28_4:setPosition(ccp(118, 79))
		var_28_5:setPosition(ccp(156, 79))
		var_28_6:setPosition(ccp(240, 79))
		var_28_1:addChild(var_28_3)
		var_28_1:addChild(var_28_4)
		var_28_1:addChild(var_28_5)
		var_28_1:addChild(var_28_6)

		local var_28_7 = CCSprite:create("res/ui/juben/event/jb_hide_award_jlshj.png")
		local var_28_8 = tool.formatTime(var_28_0.eventFinish.time * 1000, "@M:@S")

		juben.eventFinishTime = var_28_0.eventFinish.time

		local var_28_9 = tool.split(var_28_8, ":")
		local var_28_10 = CCLabelAtlas:create(tostring(var_28_9[1]), "res/ui/common/number/resou_up_numb.png", 20, 22, 48)

		var_28_10:setAnchorPoint(ccp(0.5, 0.5))

		local var_28_11 = CCSprite:create("res/ui/juben/result/settle_time_point.png")
		local var_28_12 = CCLabelAtlas:create(tostring(var_28_9[2]), "res/ui/common/number/resou_up_numb.png", 20, 22, 48)

		var_28_12:setAnchorPoint(ccp(0.5, 0.5))
		var_28_7:setPosition(ccp(95, 35))
		var_28_10:setPosition(ccp(213, 35))
		var_28_11:setPosition(ccp(238, 35))
		var_28_12:setPosition(ccp(263, 35))
		var_28_1:addChild(var_28_7)
		var_28_1:addChild(var_28_10)
		var_28_1:addChild(var_28_11)
		var_28_1:addChild(var_28_12)

		local var_28_13 = CCArray:create()

		var_28_13:addObject(CCEaseExponentialOut:create(CCMoveTo:create(0.5, ccp(visibleSize.width / 2, visibleSize.height / 2))))
		var_28_13:addObject(CCDelayTime:create(1))
		var_28_13:addObject(CCMoveTo:create(0.5, ccp(-var_28_1:getContentSize().width / 2, visibleSize.height / 2)))
		var_28_13:addObject(CCCallFuncN:create(function()
			var_28_1:removeFromParentAndCleanup(true)
		end))
		var_28_1:runAction(CCSequence:create(var_28_13))
	elseif var_28_0.info and var_28_0.info.star then
		if juben.curStar == var_28_0.info.star and var_28_0.info.addTime and var_28_0.info.addTime > 0 then
			juben.eventFinishTime = var_28_0.info.addTime
		end

		juben.curStar = var_28_0.info.star
	end
end

function handlerPushAutoBattleAction(arg_30_0)
	if arg_30_0.action.data.autoBattle then
		if arg_30_0.action.data.autoBattle.autoBattleTechGain ~= nil then
			user.autoBattleTechGain = arg_30_0.action.data.autoBattle.autoBattleTechGain
		elseif arg_30_0.action.data.autoBattle.result then
			local var_30_0 = require("lua/layer/world/autoBattle/AutoBattleNew")

			var_30_0.new({
				response = arg_30_0,
				state = var_30_0.STATE.AFTER_BATTLE
			})
		end
	end
end

function handlerPushIndivInfo(arg_31_0)
	if arg_31_0.action.data.procChange ~= nil then
		local var_31_0 = arg_31_0.action.data.procChange

		eventManager.dispatchEvent("nationChallengesChanged", var_31_0)
	elseif arg_31_0.action.data.taskComplete ~= nil then
		local var_31_1 = arg_31_0.action.data.taskComplete

		if var_31_1.taskIndex then
			require("lua/layer/world/nationChallenges/ZhaoLing.lua").new(var_0_0, var_31_1)
		else
			require("lua/layer/world/nationChallenges/TaskComplete.lua").new(var_0_0, var_31_1)
		end
	end
end

function handlerHuizhanPush(arg_32_0)
	local var_32_0 = arg_32_0.data or arg_32_0.action.data

	log.info("@@ 会战推送")

	if var_32_0.hzGatherIcon and var_32_0.hzGatherIcon.hasHuiZhanGatherIcon ~= nil then
		eventManager.dispatchEvent("changeHuizhanIconState", {
			hasGather = var_32_0.hzGatherIcon.hasHuiZhanGatherIcon
		})
	end

	if var_32_0.HuiZhanIcon and var_32_0.HuiZhanIcon.hasHuiZhan ~= nil then
		eventManager.dispatchEvent("changeHuizhanIconState", {
			hasIcon = var_32_0.HuiZhanIcon.hasHuiZhan
		})
	end

	if var_32_0.hzForceChange then
		eventManager.dispatchEvent("changeHuizhanState", {
			attForceNum = var_32_0.hzForceChange.lastestAttForfce,
			defForceNum = var_32_0.hzForceChange.lastestDefForfce
		})
	end

	if var_32_0.hzTaskInfo then
		user.player.hzState = var_32_0.hzTaskInfo.hzState

		local var_32_1 = {
			state = user.player.hzState
		}

		if var_32_0.hzTaskInfo.hzCountDown then
			user.player.hzCountDown = var_32_0.hzTaskInfo.hzCountDown
			var_32_1.countDown = var_32_0.hzTaskInfo.hzCountDown
		end

		if var_32_0.hzTaskInfo.hasHzReward then
			var_32_1.hasReward = var_32_0.hzTaskInfo.hasHzReward
		end

		local var_32_2 = require("lua/layer/nation/huizhan/HuizhanStateChange").new(var_32_1)

		eventManager.dispatchEvent("changeHuizhanState", var_32_1)
	end
end

function handlerCityComboPush(arg_33_0)
	local var_33_0 = arg_33_0.data or arg_33_0.action.data

	log.info("@@ 城池连破消息推送")
	require("lua/layer/world/cityCombo/ui")

	if var_33_0.cityCombo.flag == 1 then
		cityComboUI.showCityComboSelect(var_33_0.cityCombo.needNum, var_33_0.cityCombo.totalCd, var_33_0.cityCombo.feat, var_33_0.cityCombo.cd, var_33_0.cityCombo.nextRabbits)
	elseif var_33_0.cityCombo.flag == 2 then
		cityComboUI.showCityComboAction(var_33_0.cityCombo.num, false)
	elseif var_33_0.cityCombo.flag == 0 and var_33_0.cityCombo.num > 0 then
		cityComboUI.showCityComboAction(var_33_0.cityCombo.num, true)
	end

	if var_33_0.cityCombo.flag == 0 and var_33_0.cityCombo.num < cityComboUI.currentCityCombo then
		log.info("少城了。。。")
	else
		cityComboUI.currentCityCombo = var_33_0.cityCombo.num
	end
end

local function var_0_8(arg_34_0)
	local var_34_0 = arg_34_0.action.data.tradeInfo

	if var_34_0 then
		user.silkTradeInfo = user.silkTradeInfo or {}

		table.insert(user.silkTradeInfo, var_34_0)

		user.silkGoodsNotify = true

		eventManager.dispatchEvent("refreshActivityNotice")
		eventManager.dispatchEvent("refreshSilkMarket")
	end
end

local function var_0_9(arg_35_0)
	local var_35_0 = arg_35_0.action.data

	if var_35_0.decide then
		if var_35_0.decide.selfNation == user.player.forceId or var_35_0.decide.selfNation == nil and var_35_0.decide.predicateOver then
			user.taskDecide = var_35_0.decide

			require("lua/layer/nation/ui")
			nationUI.show(2)
		end

		if var_35_0.decide.strategy then
			user.taskDecide2 = user.taskDecide2 or {}

			table.insert(user.taskDecide2, var_35_0.decide)

			if smgr.currentSceneTag == SCENE_WORLD then
				eventManager.dispatchEvent("handlerPredicatePush_strategy", var_35_0.decide)
			end
		end
	end

	if var_35_0.addNpc then
		eventManager.dispatchEvent("handlerPredicatePush_addNpc", var_35_0.addNpc)
	end

	if var_35_0.chooseFail and var_35_0.chooseFail.fail == true then
		roleDialogue.control.loadSpeak("strategyChooseLose")
	end

	if var_35_0.fulfill and (var_35_0.fulfill.isFinished and false or var_35_0.fulfill.fulfill) then
		if var_35_0.fulfill.predicateDecision == 1 then
			roleDialogue.control.loadSpeak(1570)
		elseif var_35_0.fulfill.predicateDecision == 2 then
			roleDialogue.control.loadSpeak(1571)
		end
	end
end

local function var_0_10(arg_36_0)
	local var_36_0 = arg_36_0.action.data

	if var_36_0.limit and var_36_0.limit.pass == true then
		user.phantomLimit = true
	end
end

local function var_0_11(arg_37_0)
	local var_37_0 = arg_37_0.action.data

	if var_37_0.corpsAction and var_37_0.corpsAction.forceId then
		user.corpsAction[var_37_0.corpsAction.forceId] = var_37_0.corpsAction
	end

	if var_37_0.corpsInfo and var_37_0.corpsInfo.forceId then
		user.corpsInfo[var_37_0.corpsInfo.forceId] = var_37_0.corpsInfo
	end

	if var_37_0.state and type(var_37_0.state) == "number" then
		-- block empty
	else
		if var_37_0.state and var_37_0.state.corpsState then
			user.corpsState = var_37_0.state.corpsState
		end

		if var_37_0.corpsNum then
			user.corpsNum = var_37_0.corpsNum
		end

		local var_37_1 = var_37_0.state

		if var_37_1 then
			if var_37_1.start ~= nil then
				local var_37_2 = var_37_1.start == user.player.forceId and "jt_word_wgjtzscz.png" or "jt_word_djjtqslx.png"
				local var_37_3 = CCSprite:create("res/ui/saotao/stfx_long_bg.png")
				local var_37_4 = CCSprite:create("res/ui/corps/" .. var_37_2)

				var_37_4:setPosition(ccp(454, 85))
				var_37_3:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
				var_37_3:addChild(var_37_4)
				smgr.showTipSpriteText(var_37_3)
			end

			if var_37_1.cartoon == true then
				-- block empty
			end

			if var_37_1.donationState ~= nil then
				user.corpsCmdId = var_37_1.cmdId
				user.donationState = var_37_1.donationState

				notice.control.refreshLayer()
			end

			if var_37_1.transfer == true then
				local var_37_5 = smgr.getLayer("topLayer")

				require("lua/layer/corps/MessageBox").new(var_37_5, var_37_1)
			end

			if var_37_1.personalDonation ~= nil then
				user.personalDonation = var_37_1.personalDonation

				notice.control.refreshLayer()
			end
		end
	end
end

local function var_0_12(arg_38_0)
	local var_38_0 = arg_38_0.data or arg_38_0.action.data

	if var_38_0.arena then
		eventManager.dispatchEvent("pushArena", var_38_0.arena)
		eventManager.dispatchEvent("PushJiaoZhen", var_38_0.arena.champion)
		eventManager.dispatchEvent("PushJiaoZhenIcon", var_38_0.arena)
	end
end

local function var_0_13(arg_39_0)
	local var_39_0 = arg_39_0.action.data.update

	if var_39_0 then
		local var_39_1 = var_39_0.NyRedPaperUpdateInfo

		if var_39_1 and var_39_1.tuHao then
			user.tuHao = var_39_1.tuHao
		end
	end
end

local function var_0_14(arg_40_0)
	local var_40_0 = arg_40_0.action.data.update

	if var_40_0 then
		if var_40_0.goSignUp == true then
			roleDialogue.control.loadSpeak("arenaGoSignUp")
		end

		if var_40_0.goWatch == true then
			roleDialogue.control.loadSpeak("arenaGoWatch")
		end

		if var_40_0.arenaMatchIcons then
			user.arenaMatchIcons = {}

			for iter_40_0, iter_40_1 in ipairs(var_40_0.arenaMatchIcons) do
				user.arenaMatchIcons[iter_40_1.index] = iter_40_1
			end

			notice.control.refreshLayer()
		end
	end
end

local function var_0_15(arg_41_0)
	local var_41_0 = arg_41_0.action.data.occupy

	if var_41_0 then
		local var_41_1
		local var_41_2 = var_41_0.forceId == user.player.forceId and "jlktz_word_wfjlkzdtx.png" or "jlktz_word_dfjlkzdtx.png"
		local var_41_3 = CCSprite:create("res/ui/nationTask/newPic/" .. var_41_2)

		var_41_3:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 + 50))
		smgr.showTipSpriteText(var_41_3)
	end
end

local function var_0_16(arg_42_0)
	local var_42_0 = {}

	if arg_42_0 then
		var_42_0.cd = arg_42_0.cd
		var_42_0.taskState = arg_42_0.taskState
		var_42_0.taskType = arg_42_0.taskType
		var_42_0.state = arg_42_0.state

		if arg_42_0.strategies and #arg_42_0.strategies > 0 then
			var_42_0.suc = arg_42_0.strategies[1].suc
			var_42_0.nextManzuTime = arg_42_0.strategies[1].nextManzuTime
		end

		var_42_0.hasReward = arg_42_0.hasReward
		var_42_0.strategy = arg_42_0.strategy
		var_42_0.selfNation = arg_42_0.selfNation
		var_42_0.npcCityId = arg_42_0.targetCity and arg_42_0.targetCity or arg_42_0.fromCityId

		if not var_42_0.npcCityId and arg_42_0.target then
			var_42_0.npcCityId = arg_42_0.target
		end

		var_42_0.toCityIdList = arg_42_0.toCityIdList

		if arg_42_0.path then
			var_42_0.path = stringSplit(arg_42_0.path, ";")
		end
	end

	return var_42_0
end

local function var_0_17(arg_43_0)
	if not arg_43_0 then
		return
	end

	local var_43_0 = arg_43_0.action.data
	local var_43_1 = user.worldData
	local var_43_2 = {}

	var_43_1.nationNpcCityList = var_43_1.nationNpcCityList or {}

	if var_43_0.bar then
		if var_43_1.nationNpcCityList then
			local var_43_3 = var_0_16(var_43_0.bar)

			var_43_3.nextManzuTime = var_43_0.bar.nextManzuTime
			var_43_3.npcCityId = var_43_0.bar.targetCity
			var_43_3.strategy = "barInvade"
			var_43_1.nationNpcCityList[var_43_0.bar.targetCity] = var_43_3

			eventManager.dispatchEvent("nationNpcCityListUpdate")
		end

		if var_43_0.bar.over ~= nil then
			if var_43_0.bar.over then
				roleDialogue.control.loadSpeak("NpcManZu2")
			else
				roleDialogue.control.loadSpeak("NpcManZu3")
			end

			var_43_1.nationNpcCityList[var_43_0.bar.cityId] = nil

			eventManager.dispatchEvent("nationNpcCityListUpdate")
		end
	end

	if var_43_0.ys and var_43_0.ys.winCall ~= nil then
		roleDialogue.control.loadSpeak("NpcYuanShao2")

		if var_43_1.nationNpcCityList then
			var_43_1.nationNpcCityList[var_43_0.ys.cityId] = nil

			eventManager.dispatchEvent("nationNpcCityListUpdate")
		end
	end

	if var_43_0.hj then
		local var_43_4 = false

		if var_43_0.hj.hjState == 1 then
			roleDialogue.control.loadSpeak("NpcHuangJin2")
		elseif var_43_0.hj.hjState == 2 then
			roleDialogue.control.loadSpeak("NpcHuangJin3")

			var_43_4 = false

			if var_43_1.nationNpcCityList then
				for iter_43_0, iter_43_1 in pairs(var_43_1.nationNpcCityList) do
					if iter_43_1.strategy == "hjRebelAtt" then
						var_43_1.nationNpcCityList[iter_43_1.npcCityId] = nil
					end
				end

				eventManager.dispatchEvent("nationNpcCityListUpdate")
			end
		elseif var_43_0.hj.hjState == 3 then
			var_43_4 = false

			if var_43_1.nationNpcCityList then
				for iter_43_2, iter_43_3 in pairs(var_43_1.nationNpcCityList) do
					if iter_43_3.strategy == "hjRebel" then
						var_43_1.nationNpcCityList[iter_43_3.npcCityId] = nil
					end
				end

				eventManager.dispatchEvent("nationNpcCityListUpdate")
			end
		end

		if var_43_0.hj.hjCities then
			var_43_1.nationNpcLockCityList = var_43_1.nationNpcLockCityList or {}

			local var_43_5 = {}

			if #var_43_0.hj.hjCities > 0 then
				for iter_43_4, iter_43_5 in pairs(var_43_0.hj.hjCities) do
					local var_43_6 = var_0_16(iter_43_5)

					if var_43_6.state < 2 then
						var_43_1.nationNpcLockCityList[var_43_6.npcCityId] = var_43_6
					else
						var_43_1.nationNpcLockCityList[var_43_6.npcCityId] = nil
					end

					if var_43_6.state < 3 then
						if var_43_6.state < 2 then
							var_43_1.nationNpcCityList[var_43_6.npcCityId] = var_43_6
						end

						if var_43_6.state == 2 and var_43_6.selfNation ~= user.player.forceId then
							var_43_1.nationNpcCityList[var_43_6.npcCityId] = nil
						end
					else
						var_43_1.nationNpcCityList[var_43_6.npcCityId] = nil
					end

					var_43_4 = var_43_4 or var_43_6.state < 2 and var_43_6.selfNation == user.player.forceId
				end
			else
				var_43_1.nationNpcLockCityList = nil
			end

			eventManager.dispatchEvent("nationNpcCityListUpdate")
		end
	end
end

local function var_0_18(arg_44_0)
	local var_44_0 = arg_44_0.action.data.update
	local var_44_1 = user.NationData

	log.info("@@@@@@@handlerPushYwMatch")
	showTable(var_44_0)

	if var_44_0.scoreList and var_44_1.drillInfo then
		var_44_1.drillInfo.scoreList = var_44_0.scoreList

		eventManager.dispatchEvent("scoreUpdate")
	end

	if var_44_0.ywInfo then
		var_44_1.drillInfo = var_44_0.ywInfo

		eventManager.dispatchEvent("nationDataUpdate")
	end

	if var_44_0.playerList then
		if var_44_1.drillInfo then
			var_44_1.drillInfo.startCd = var_44_0.startCd
		end

		var_44_1.curJoinFreeFightNum = 0
		var_44_1.isSignUpFreeFight = false

		for iter_44_0, iter_44_1 in pairs(var_44_0.playerList) do
			if iter_44_1.playerId then
				var_44_1.curJoinFreeFightNum = var_44_1.curJoinFreeFightNum + 1
			end

			if iter_44_1.playerId == user.player.id then
				var_44_1.isSignUpFreeFight = true
			end
		end

		var_44_1.freePlayerList = var_44_0.playerList

		eventManager.dispatchEvent("freePlayerList")
	end

	if var_44_0.ywFormalSignUp then
		-- block empty
	end

	if var_44_0.ywFormalFight then
		roleDialogue.control.loadSpeak("yw215158")
	end

	if var_44_0.ywFreeFight then
		var_44_1.showFreeFightDialogue = true
	end

	if var_44_0.ifYw ~= nil then
		user.isYw = var_44_0.ifYw
	end

	if var_44_0.rank then
		-- block empty
	end

	if var_44_0.ywMatchIcon then
		var_44_1.ywState = var_44_0.ywMatchIcon.state

		if var_44_1.ywState == 0 then
			user.soId = var_44_0.ywMatchIcon.juBenId
		end

		if var_44_0.ywMatchIcon.battleKey then
			var_44_1.battleKey = var_44_0.ywMatchIcon.battleKey
		else
			var_44_1.battleKey = 0
		end

		local var_44_2 = var_44_1.battleKey > 0 and var_44_1.ywState ~= 2

		notice.control.handleJBYWIcon(var_44_2)

		if var_44_1.showFreeFightDialogue and var_44_1.ywState == 0 then
			var_44_1.showFreeFightDialogue = false
		end
	end

	if var_44_0.freeOver then
		eventManager.dispatchEvent("refreshNationTask")
	end

	if not var_44_0.ywStartCd or var_44_0.battleType == 1 then
		-- block empty
	elseif var_44_0.battleType == 2 then
		var_44_1.showFreeSuccess = true

		eventManager.dispatchEvent("showFreeSuccess")
	end
end

function createPushLayer()
	local var_45_0 = createBaseLayer()

	var_0_0 = var_45_0

	log.info("create push layer")
	smgr.registerLayer(var_0_0, "pushLayer")

	function var_45_0.onEnter(arg_46_0)
		cmgr.registerResponseHandler(actions.pushPlayer, handlerPushPlayerInfoAction)
		cmgr.registerResponseHandler(actions.pushBarTaskStateChange, var_0_5)
		cmgr.registerResponseHandler(actions.pushManWangLing, handlerPushManWangLing)
		cmgr.registerResponseHandler(actions.pushChat, handlerPushChatAction)
		cmgr.registerResponseHandler(actions.pushJuBen, handlerPushJubenAction)
		cmgr.registerResponseHandler(actions.pushAutoBattle, handlerPushAutoBattleAction)
		cmgr.registerResponseHandler(actions.pushIndivInfo, handlerPushIndivInfo)
		cmgr.registerResponseHandler(actions.huizhanPush, handlerHuizhanPush)
		cmgr.registerResponseHandler(actions.pushCityCombo, handlerCityComboPush)
		cmgr.registerResponseHandler(actions.pushSilkMarket, var_0_8)
		cmgr.registerResponseHandler(actions.pushPredicate, var_0_9)
		cmgr.registerResponseHandler(actions.pushPhantom, var_0_10)
		cmgr.registerResponseHandler(actions.pushCorps, var_0_11)
		cmgr.registerResponseHandler(actions.pushArena, var_0_12)
		cmgr.registerResponseHandler(actions.pushNyRedPaper, var_0_13)
		cmgr.registerResponseHandler(actions.pushArenaMatch, var_0_14)
		cmgr.registerResponseHandler(actions.granary, var_0_15)
		eventManager.registerEvent("SeeChampionCity", var_0_6)
		eventManager.registerEvent("GameOver", var_0_7)
		cmgr.registerResponseHandler(actions.pushYwMatch, var_0_18)
		cmgr.registerResponseHandler(actions.pushNpcstr, var_0_17)
	end

	function var_45_0.onExit(arg_47_0)
		cmgr.unregisterResponseHandler(actions.pushPlayer, handlerPushPlayerInfoAction)
		cmgr.unregisterResponseHandler(actions.pushBarTaskStateChange, var_0_5)
		cmgr.unregisterResponseHandler(actions.pushManWangLing, handlerPushManWangLing)
		cmgr.unregisterResponseHandler(actions.pushChat, handlerPushChatAction)
		cmgr.unregisterResponseHandler(actions.pushJuBen, handlerPushJubenAction)
		cmgr.unregisterResponseHandler(actions.pushAutoBattle, handlerPushAutoBattleAction)
		cmgr.unregisterResponseHandler(actions.pushIndivInfo, handlerPushIndivInfo)
		cmgr.unregisterResponseHandler(actions.huizhanPush, handlerHuizhanPush)
		cmgr.unregisterResponseHandler(actions.pushCityCombo, handlerCityComboPush)
		cmgr.unregisterResponseHandler(actions.pushSilkMarket, var_0_8)
		cmgr.unregisterResponseHandler(actions.pushPredicate, var_0_9)
		cmgr.unregisterResponseHandler(actions.pushPhantom, var_0_10)
		cmgr.unregisterResponseHandler(actions.pushCorps, var_0_11)
		cmgr.unregisterResponseHandler(actions.pushArena, var_0_12)
		cmgr.unregisterResponseHandler(actions.pushNyRedPaper, var_0_13)
		cmgr.unregisterResponseHandler(actions.pushArenaMatch, var_0_14)
		cmgr.unregisterResponseHandler(actions.granary, var_0_15)
		eventManager.unregisterEvent("SeeChampionCity", var_0_6)
		eventManager.unregisterEvent("GameOver", var_0_7)
		cmgr.unregisterResponseHandler(actions.pushYwMatch, var_0_18)
		cmgr.unregisterResponseHandler(actions.pushNpcstr, var_0_17)
	end

	return var_45_0
end

function fly_gainGenaral(arg_48_0)
	local var_48_0

	if arg_48_0 == 1 then
		var_48_0 = CCSprite:create("res/ui/common/fightPic/fightPic_zhangliang.png")
	elseif arg_48_0 == 2 then
		var_48_0 = CCSprite:create("res/ui/common/fightPic/fightPic_huaxiong.png")
	end

	if menuUI.ui.isOpen == false then
		menuUI.ui.clickedMainItem()
	end

	var_48_0:setPosition(ccp(visibleSize.width / 2 + 200 - 305, visibleSize.height / 2 + 165 - 141))

	local var_48_1 = CCArray:create()

	for iter_48_0 = 2, 19 do
		local var_48_2 = CCSprite:create("res/ui/mainUI/effect/" .. string.format("1%04d.png", iter_48_0))

		var_48_1:addObject(var_48_2:displayFrame())
	end

	local var_48_3 = CCAnimation:createWithSpriteFrames(var_48_1, 0.05)
	local var_48_4 = CCAnimate:create(var_48_3)

	local function var_48_5()
		var_0_0:removeChild(var_48_0, true)
		menuUI.ui.table["icon_" .. 2]:setEnabled(true)

		if arg_48_0 == 1 then
			taskUI.showTaskGuide()
		elseif arg_48_0 == 2 then
			taskUI.showTaskGuide()
		end
	end

	local var_48_6 = menuUI.constant.rightIconX + -1 * menuUI.constant.rightIconSpan - 445
	local var_48_7 = menuUI.constant.rightIconY + 40
	local var_48_8 = CCDelayTime:create(0.3)
	local var_48_9 = CCMoveTo:create(0.5, ccp(var_48_6, var_48_7))
	local var_48_10 = CCCallFuncN:create(var_48_5)
	local var_48_11 = CCArray:create()

	var_48_11:addObject(var_48_8)
	var_48_11:addObject(var_48_9)
	var_48_11:addObject(var_48_4)
	var_48_11:addObject(var_48_10)

	local var_48_12 = CCSequence:create(var_48_11)

	var_48_0:runAction(var_48_12)
	var_0_0:addChild(var_48_0, 10000)
end
