tool.requireRes("playerInfo")

playerInfoUI = {}
playerInfoUI.uiTable = {}

local var_0_0 = playerInfoControl
local var_0_1 = playerInfoConstant

function playerInfoUI.showResTips(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = smgr.getLayer("topLayer")

	autoUI.createUI(var_1_0, getResTipsData(arg_1_0, arg_1_1), playerInfoUI.uiTable)
	log.info("show position :", arg_1_2, arg_1_3)

	local var_1_1 = playerInfoUI.uiTable.resTipsFrame:getContentSize()
	local var_1_2 = arg_1_2 + 200

	if var_1_2 > visibleSize.width then
		log.info("moveOffsetX  > visibleSize.width-tipFrameSize.width*0.5 :", var_1_2, visibleSize.width, var_1_1.width)

		var_1_2 = visibleSize.width - 10
	end

	local var_1_3 = arg_1_3 - 100

	if arg_1_0 == 1 then
		var_1_3 = arg_1_3 - 50
	end

	playerInfoUI.uiTable.resTipsFrame:setPosition(ccp(var_1_2, var_1_3))
end

function playerInfoUI.displayPlayerInfo()
	if smgr.nextSceneTag == SCENE_WORLD and worldThumbnailControl.visible == true then
		return
	end

	if user.settings.isCharacterLayerDisplayed == false then
		require("lua/layer/playerInfo2/ui")
		playerInfo2.ui.show(2)
	end
end

function playerInfoUI.show_setting()
	require("lua/layer/playerInfo2/ui")
	require("lua/layer/playerInfo2/setting/ui")

	setting.ui.pageIndex = 2

	if conf.language ~= "cn" and conf.language ~= "xm" then
		setting.ui.pageIndex = 1
	end

	playerInfo2.ui.show(1)
end

function playerInfoUI.updatePlayerPortrait()
	if user.player.pic ~= 0 then
		local var_4_0 = CCSprite:create("res/ui/common/playerHead/playerHead_icon_1" .. user.player.pic .. ".png")

		playerInfoUI.uiTable.forceSprite:setDisplayFrame(var_4_0:displayFrame())
		playerInfoUI.uiTable.forceSprite:setScale(1)
	else
		local var_4_1 = CCSprite:create("res/ui/common/fightPic/fightPic_0.png")

		playerInfoUI.uiTable.forceSprite:setDisplayFrame(var_4_1:displayFrame())
		playerInfoUI.uiTable.forceSprite:setScale(0.75)
	end

	if user.playerNewYearFrame == 1 then
		playerInfoUI.uiTable.newYearSprite:setVisible(true)
	else
		playerInfoUI.uiTable.newYearSprite:setVisible(false)
	end
end

function playerInfoUI.initBasicUI()
	local var_5_0 = smgr.getLayer("playerInfoLayer")

	playerInfoUI.uiTable = autoUI.initUI(var_5_0, getPlayerInfoData())

	playerInfoUI.uiTable.chongItem:setScale(1.5)
	playerInfoUI.uiTable.chongItem:registerScriptTapHandler(playerInfoUI.displayPlayerInfo)

	effect = playerInfoUI.uiTable.goldEffect

	effect:setScale(1.4)

	local var_5_1 = CCArray:create()

	for iter_5_0 = 1, 16 do
		local var_5_2 = CCSprite:create("res/ui/playerInfo/gold/" .. string.format("gold%04d.png", iter_5_0))

		var_5_1:addObject(var_5_2:displayFrame())
	end

	local var_5_3 = CCAnimation:createWithSpriteFrames(var_5_1, 0.1)
	local var_5_4 = CCAnimate:create(var_5_3)
	local var_5_5 = CCArray:create()

	var_5_5:addObject(var_5_4)

	local var_5_6 = CCSequence:create(var_5_5)
	local var_5_7 = CCRepeatForever:create(tolua.cast(var_5_6, "CCActionInterval"))

	effect:runAction(var_5_7)

	local var_5_8

	if smgr.currentSceneTag == SCENE_KFWORLD or smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		local var_5_9 = CCSprite:create("res/ui/kfworld/kfgz_jxjd_btn_close_a.png")
		local var_5_10 = CCSprite:create("res/ui/kfworld/kfgz_jxjd_btn_close_c.png")

		var_5_8 = CCMenuItemSprite:create(var_5_9, var_5_10)

		var_5_8:registerScriptTapHandler(function()
			eventManager.dispatchEvent("kfWorldExpandClick", false)
		end)
		var_5_8:setPosition(ccp(35.5, visibleSize.height - 36.5))
	else
		playerInfoUI.uiTable.forceSprite:setPosition(ccp(35, 56))
		playerInfoUI.updatePlayerPortrait()

		local var_5_11 = CCSprite:create("res/default.png")
		local var_5_12 = CCSprite:create("res/default.png")

		var_5_8 = CCMenuItemSprite:create(var_5_11, var_5_12)

		var_5_8:setScale(18)
		var_5_8:registerScriptTapHandler(playerInfoUI.displayPlayerInfo)
		var_5_8:setPosition(35, visibleSize.height - 35)
	end

	local var_5_13 = CCMenu:create()

	var_5_13:setPosition(ccp(0, 0))
	var_5_13:addChild(var_5_8, 1)
	var_5_0:addChild(var_5_13, 111)
	playerInfoUI.uiTable.setting:registerScriptTapHandler(playerInfoUI.show_setting)
end

function playerInfoUI.playerReduceAnim(arg_7_0, arg_7_1)
	local var_7_0 = playerInfoUI.uiTable.titleBarSprite

	local function var_7_1(arg_8_0)
		local var_8_0 = tolua.cast(arg_8_0, "CCLabelTTF")

		var_7_0:removeChild(var_8_0, true)
	end

	local var_7_2 = CCCallFuncN:create(var_7_1)
	local var_7_3 = playerInfoUI.uiTable[arg_7_0 .. "Label"]
	local var_7_4 = CCStrokeLabelTTF:create("-" .. arg_7_1, "Thonburi", 24)

	var_7_4:setPosition(ccp(var_7_3:getPositionX() + 48, var_7_3:getPositionY()))
	var_7_4:setColor(ccc3(255, 0, 0))
	var_7_0:addChild(var_7_4, 105)

	local var_7_5 = CCMoveBy:create(0.7, ccp(0, -20))
	local var_7_6 = CCMoveBy:create(0.3, ccp(0, 0))
	local var_7_7 = CCArray:create()

	var_7_7:addObject(var_7_5)
	var_7_7:addObject(var_7_6)
	var_7_7:addObject(var_7_2)
	var_7_4:runAction(CCSequence:create(var_7_7))
end

function playerInfoUI.updateResourceUI()
	local function var_9_0(arg_10_0)
		local var_10_0 = 0

		if arg_10_0 >= 10000 then
			arg_10_0 = tool.toint(arg_10_0 / 1000)
			var_10_0 = var_10_0 + 1
		end

		if arg_10_0 >= 100000 then
			arg_10_0 = tool.toint(arg_10_0 / 100000)
			var_10_0 = var_10_0 + 1
		end

		return arg_10_0, var_10_0
	end

	local function var_9_1(arg_11_0)
		if conf.language == "tha" then
			return var_9_0(arg_11_0)
		else
			local var_11_0 = 0

			if arg_11_0 >= 10000 then
				arg_11_0 = tool.toint(arg_11_0 / 10000)
				var_11_0 = var_11_0 + 1
			end

			if arg_11_0 >= 10000 then
				arg_11_0 = tool.toint(arg_11_0 / 10000)
				var_11_0 = var_11_0 + 1
			end

			return arg_11_0, var_11_0
		end
	end

	local function var_9_2(arg_12_0, arg_12_1, arg_12_2)
		local var_12_0 = {}

		if conf.language == "tha" then
			var_12_0.yiX = 16
		else
			var_12_0.yiX = 0
		end

		if arg_12_0 == 0 then
			playerInfoUI.uiTable[arg_12_1 .. "Wan"]:setVisible(false)
			playerInfoUI.uiTable[arg_12_1 .. "Yi"]:setVisible(false)
		elseif arg_12_0 == 1 then
			playerInfoUI.uiTable[arg_12_1 .. "Wan"]:setVisible(true)
			playerInfoUI.uiTable[arg_12_1 .. "Yi"]:setVisible(false)

			local var_12_1 = playerInfoUI.uiTable[arg_12_1 .. "Label"]

			playerInfoUI.uiTable[arg_12_1 .. "Wan"]:setPosition(ccp(var_12_1:getPositionX() + string.len(tostring(arg_12_2)) * 16 + 16, var_12_1:getPositionY()))
		elseif arg_12_0 == 2 then
			playerInfoUI.uiTable[arg_12_1 .. "Wan"]:setVisible(false)
			playerInfoUI.uiTable[arg_12_1 .. "Yi"]:setVisible(true)

			local var_12_2 = playerInfoUI.uiTable[arg_12_1 .. "Label"]

			playerInfoUI.uiTable[arg_12_1 .. "Yi"]:setPosition(ccp(var_12_2:getPositionX() + string.len(tostring(arg_12_2)) * 16 + 16 + var_12_0.yiX, var_12_2:getPositionY()))
		end

		local var_12_3 = arg_12_1 == "silver" and "copper" or arg_12_1

		if user.player[var_12_3] >= user.player[var_12_3 .. "Max"] then
			if conf.language == "cn" then
				playerInfoUI.uiTable[arg_12_1 .. "Wan"]:setDisplayFrame(CCSpriteFrame:create("res/ui/playerInfo/up_numb_wan_red.png", CCRectMake(0, 0, 43, 22)))
				playerInfoUI.uiTable[arg_12_1 .. "Yi"]:setDisplayFrame(CCSpriteFrame:create("res/ui/playerInfo/up_numb_yi_red.png", CCRectMake(0, 0, 23, 22)))
			else
				playerInfoUI.uiTable[arg_12_1 .. "Wan"]:setDisplayFrame(CCSprite:create("res/ui/playerInfo/up_numb_wan_red.png"):displayFrame())
				playerInfoUI.uiTable[arg_12_1 .. "Yi"]:setDisplayFrame(CCSprite:create("res/ui/playerInfo/up_numb_yi_red.png"):displayFrame())
			end
		elseif conf.language == "cn" then
			playerInfoUI.uiTable[arg_12_1 .. "Wan"]:setDisplayFrame(CCSpriteFrame:create("res/ui/playerInfo/up_numb_wan.png", CCRectMake(0, 0, 23, 22)))
			playerInfoUI.uiTable[arg_12_1 .. "Yi"]:setDisplayFrame(CCSpriteFrame:create("res/ui/playerInfo/up_numb_yi.png", CCRectMake(0, 0, 23, 22)))
		else
			playerInfoUI.uiTable[arg_12_1 .. "Wan"]:setDisplayFrame(CCSprite:create("res/ui/playerInfo/up_numb_wan.png"):displayFrame())
			playerInfoUI.uiTable[arg_12_1 .. "Yi"]:setDisplayFrame(CCSprite:create("res/ui/playerInfo/up_numb_yi.png"):displayFrame())
		end
	end

	local function var_9_3(arg_13_0, arg_13_1)
		local var_13_0 = arg_13_0 == "silver" and "copper" or arg_13_0
		local var_13_1 = smgr.getLayer("playerInfoLayer")
		local var_13_2 = playerInfoUI.uiTable[arg_13_0 .. "Label"]
		local var_13_3, var_13_4 = var_13_2:getPosition()

		playerInfoUI.uiTable.titleBarSprite:removeChild(var_13_2, true)

		if user.player[var_13_0] >= user.player[var_13_0 .. "Max"] then
			var_13_2 = CCLabelAtlas:create(tostring(arg_13_1), "res/ui/common/number/up_numb_red.png", 16, 21, 48)
		else
			var_13_2 = CCLabelAtlas:create(tostring(arg_13_1), "res/ui/common/number/up_numb.png", 16, 21, 48)
		end

		var_13_2:setAnchorPoint(ccp(0, 0.5))
		var_13_2:setPosition(ccp(var_13_3, var_13_4))
		playerInfoUI.uiTable.titleBarSprite:addChild(var_13_2)

		playerInfoUI.uiTable[arg_13_0 .. "Label"] = var_13_2

		log.info("resName=%s,%s,%s", arg_13_0, user.player[var_13_0], user.player[var_13_0 .. "Max"])
	end

	playerInfoUI.uiTable.goldLabel:setString(tostring(user.player.gold))

	local var_9_4, var_9_5 = var_9_1(user.player.copper)

	var_9_3("silver", var_9_4)
	var_9_2(var_9_5, "silver", var_9_4)

	local var_9_6, var_9_7 = var_9_1(user.player.wood)

	var_9_3("wood", var_9_6)
	var_9_2(var_9_7, "wood", var_9_6)

	local var_9_8, var_9_9 = var_9_1(user.player.food)

	var_9_3("food", var_9_8)
	var_9_2(var_9_9, "food", var_9_8)

	local var_9_10, var_9_11 = var_9_1(user.player.iron)

	var_9_3("iron", var_9_10)
	var_9_2(var_9_11, "iron", var_9_10)
	playerInfoUI.uiTable.lvLabel:setString(tostring(user.player.playerLv))

	local var_9_12 = 0
	local var_9_13 = user.player.expNeed == 0 and 100 or user.player.exp * 100 / user.player.expNeed

	if user.player.gemKit == true then
		var_9_13 = user.player.maxKitExp == 0 and 100 or user.player.curKitExp * 100 / user.player.maxKitExp
	end

	if user.player.hasBestSuit and user.player.expInfo then
		local var_9_14 = user.player.expInfo

		var_9_13 = var_9_14.curValue * 100 / var_9_14.maxValue
	end

	playerInfoUI.uiTable.expProcessTimer:setPercentage(var_9_13)
	playerInfoUI.uiTable.expValueLabel:setString(tool.toint(var_9_13) .. "%")

	if user.haveBaiNianBuff == 1 and user.baiNianBuffCd > 0 then
		playerInfoUI.uiTable.icon_wmbt:setVisible(true)
		playerInfoUI.showWMBTTips()
		playerInfoUI.uiTable.wmbtBg:setVisible(false)
	else
		playerInfoUI.uiTable.icon_wmbt:setVisible(false)
	end

	if user.player.hasSdtjBuff then
		playerInfoUI.uiTable.icon_sdtj:setVisible(true)
		playerInfoUI.setSdtjBuff()
	else
		playerInfoUI.uiTable.icon_sdtj:setVisible(false)
	end

	playerInfoUI.uiTable.icon_topLv:setVisible(user.topLv ~= nil and user.topLv >= 1)
	playerInfoUI.setOfflineBuff()
	playerInfoUI.setIconSeal()
end

function playerInfoUI.updateBuffPos()
	local var_14_0 = {}

	if playerInfoUI.uiTable.icon_wmbt:isVisible() then
		table.insert(var_14_0, playerInfoUI.uiTable.icon_wmbt)
	end

	if playerInfoUI.uiTable.icon_sdtj:isVisible() then
		table.insert(var_14_0, playerInfoUI.uiTable.icon_sdtj)
	end

	if playerInfoUI.uiTable.icon_offlineBuff:isVisible() then
		table.insert(var_14_0, playerInfoUI.uiTable.icon_offlineBuff)
	end

	if playerInfoUI.uiTable.icon_seal:isVisible() then
		table.insert(var_14_0, playerInfoUI.uiTable.icon_seal)
	end

	if playerInfoUI.uiTable.icon_topLv:isVisible() then
		table.insert(var_14_0, playerInfoUI.uiTable.icon_topLv)
	end

	if #var_14_0 > 0 then
		local var_14_1 = playerInfoUI.haveJunGong and 270 or 145

		for iter_14_0, iter_14_1 in ipairs(var_14_0) do
			iter_14_1:setPositionX(var_14_1 + (iter_14_0 - 1) * 60)
		end
	end
end

function playerInfoUI.setIconWmbtPos(arg_15_0)
	playerInfoUI.haveJunGong = arg_15_0

	playerInfoUI.updateBuffPos()
end

function playerInfoUI.setSdtjBuff()
	if user.player.hasSdtjBuff == true then
		playerInfoUI.uiTable.icon_sdtj:setVisible(true)

		local var_16_0 = ({
			[57] = "sdtj_expbuff_110.png",
			[54] = "sdtj_expbuff_70.png",
			[55] = "sdtj_expbuff_80.png",
			[50] = "sdtj_expbuff_20.png",
			[52] = "sdtj_expbuff_40.png",
			[56] = "sdtj_expbuff_100.png",
			[58] = "sdtj_expbuff_120.png",
			[51] = "sdtj_expbuff_30.png",
			[53] = "sdtj_expbuff_60.png"
		})[user.player.sdtjBuffId] or "sdtj_expbuff_20.png"
		local var_16_1 = CCSprite:create("res/ui/playerInfo/" .. var_16_0)

		playerInfoUI.uiTable.icon_sdtj:setDisplayFrame(var_16_1:displayFrame())
	else
		playerInfoUI.uiTable.icon_sdtj:setVisible(false)
	end

	playerInfoUI.updateBuffPos()
end

function playerInfoUI.setOfflineBuff()
	if user.player.hasOfflineBuff == 1 then
		playerInfoUI.uiTable.icon_offlineBuff:setVisible(true)

		local var_17_0 = CCSprite:create("res/ui/offlineBuff/lx_buff_0" .. user.player.offlineBuffId .. ".jpg")

		playerInfoUI.uiTable.icon_offlineBuff:setDisplayFrame(var_17_0:displayFrame())

		if not playerInfoUI.uiTable.offlineBuffBg then
			local var_17_1 = 100
			local var_17_2 = 50
			local var_17_3 = createTimerLabel(user.player.offlineEndTime, "@H:@M:@S", "Thonburi", 20, function(...)
				user.player.hasOfflineBuff = 0

				playerInfoUI.setOfflineBuff()
			end, nil, nil, nil)
			local var_17_4 = {
				width = 120,
				height = 50
			}

			require("lua/layer/offlineBuff/constant")

			local var_17_5 = CCStrokeLabelTTF:create(language.get(320031, offlineBuff.constant[user.player.offlineBuffId]), "Thonburi", 20)

			var_17_5:setAnchorPoint(ccp(0, 0.5))

			local var_17_6 = var_17_5:getContentSize()

			var_17_5:setPosition(ccp(var_17_1 / 2, (var_17_2 + var_17_6.height) / 2))
			var_17_3:setPosition(ccp(var_17_6.width + var_17_1 / 2 + 45, (var_17_2 + var_17_6.height) / 2))

			local var_17_7 = CCScale9Sprite:createWithSpriteFrameName("common_tip_frame_small.png")

			var_17_7:setAnchorPoint(ccp(0, 1))
			var_17_7:setContentSize(CCSizeMake(var_17_6.width + var_17_1 + 80, var_17_6.height + var_17_2))

			playerInfoUI.uiTable.offlineBuffBg = var_17_7
			playerInfoUI.uiTable.offlineEndTimeLabel = var_17_3

			playerInfoUI.uiTable.icon_offlineBuff:addChild(var_17_7)
			var_17_7:addChild(var_17_3)
			var_17_7:addChild(var_17_5)
			var_17_7:setScale(1.3333333333333333)
			var_17_7:setVisible(false)
		else
			playerInfoUI.uiTable.offlineEndTimeLabel:setTime(user.player.offlineEndTime)
		end
	else
		playerInfoUI.uiTable.icon_offlineBuff:setVisible(false)
	end

	playerInfoUI.updateBuffPos()
end

function playerInfoUI.setIconSeal()
	playerInfoUI.uiTable.icon_seal:setVisible(user.feudState == 1 and user.feudCd > 0)
	playerInfoUI.updateBuffPos()
end

local function var_0_2(arg_20_0)
	local var_20_0 = arg_20_0 / 1000
	local var_20_1 = math.floor(var_20_0 / 3600)
	local var_20_2 = var_20_0 % 3600
	local var_20_3 = math.floor(var_20_2 / 60)
	local var_20_4 = var_20_2 % 60

	return string.format("%02d:%02d:%02d", var_20_1, var_20_3, var_20_4)
end

function playerInfoUI.showWMBTTips()
	if not playerInfoUI.uiTable.wmbtTips then
		local var_21_0 = CCScale9Sprite:createWithSpriteFrameName("common_tip_frame_small.png")

		var_21_0:setAnchorPoint(ccp(0, 1))
		playerInfoUI.uiTable.icon_wmbt:addChild(var_21_0)

		local var_21_1 = 100
		local var_21_2 = 50
		local var_21_3 = CCStrokeLabelTTF:create(language.get(135226, var_0_2(user.baiNianBuffCd)), "Thonburi", 20)

		var_21_3:setAnchorPoint(ccp(0, 1))

		local var_21_4 = var_21_3:getContentSize()

		var_21_0:setPreferredSize(CCSizeMake(var_21_4.width + var_21_1, var_21_4.height + var_21_2))
		var_21_0:addChild(var_21_3)
		var_21_3:setPosition(ccp(var_21_1 / 2, var_21_4.height + var_21_2 / 2))

		local var_21_5 = CCArray:create()

		var_21_5:addObject(CCDelayTime:create(1))
		var_21_5:addObject(CCCallFuncN:create(function()
			user.baiNianBuffCd = user.baiNianBuffCd - 1000

			if user.baiNianBuffCd <= 0 then
				var_21_0:removeFromParentAndCleanup(true)
				playerInfoUI.uiTable.icon_wmbt:setVisible(false)

				playerInfoUI.uiTable.wmbtTips = nil
				playerInfoUI.uiTable.wmbtBg = nil
			else
				var_21_3:setString(language.get(135226, var_0_2(user.baiNianBuffCd)))
			end
		end))

		local var_21_6 = CCSequence:create(var_21_5)

		var_21_0:runAction(CCRepeatForever:create(var_21_6))

		playerInfoUI.uiTable.wmbtTips = var_21_3
		playerInfoUI.uiTable.wmbtBg = var_21_0
	else
		playerInfoUI.uiTable.wmbtBg:setVisible(true)
	end
end

function playerInfoUI.showSdtjTips()
	if not playerInfoUI.uiTable.sdtjBg then
		local var_23_0 = 100
		local var_23_1 = 50
		local var_23_2 = CCStrokeLabelTTF:create(language.get(450019, user.player.sdtjBuffLv), "Thonburi", 20)
		local var_23_3 = var_23_2:getContentSize()

		var_23_2:setPosition(ccp((var_23_3.width + var_23_0) / 2, (var_23_3.height + var_23_1) / 2))

		local var_23_4 = CCScale9Sprite:createWithSpriteFrameName("common_tip_frame_small.png")

		var_23_4:setAnchorPoint(ccp(0, 1))
		var_23_4:setContentSize(CCSizeMake(var_23_3.width + var_23_0, var_23_3.height + var_23_1))

		playerInfoUI.uiTable.sdtjBg = var_23_4
		playerInfoUI.uiTable.sdtjTips = var_23_2

		playerInfoUI.uiTable.icon_sdtj:addChild(var_23_4)
		var_23_4:addChild(var_23_2)
	else
		playerInfoUI.uiTable.sdtjTips:setString(language.get(450019, user.player.sdtjBuffLv))
		playerInfoUI.uiTable.sdtjBg:setVisible(true)
	end
end

function playerInfoUI.showOfflineBuffTips()
	if playerInfoUI.uiTable.offlineBuffBg then
		playerInfoUI.uiTable.offlineBuffBg:setVisible(true)
	end
end

function playerInfoUI.showSealBuffTips()
	if not playerInfoUI.uiTable.sealBuffBg then
		local var_25_0 = CCScale9Sprite:createWithSpriteFrameName("common_tip_frame_small.png")

		var_25_0:setAnchorPoint(ccp(0, 1))
		playerInfoUI.uiTable.icon_seal:addChild(var_25_0)

		local var_25_1 = 100
		local var_25_2 = 50
		local var_25_3 = CCStrokeLabelTTF:create(language.get(121070, var_0_2(user.feudCd), user.feudLeftTimes), "Thonburi", 25)

		var_25_3:setAnchorPoint(ccp(0, 1))
		var_25_3:setHorizontalAlignment(kCCTextAlignmentLeft)

		local var_25_4 = var_25_3:getContentSize()

		var_25_0:setPreferredSize(CCSizeMake(var_25_4.width + var_25_1, var_25_4.height + var_25_2))
		var_25_0:addChild(var_25_3)
		var_25_3:setPosition(ccp(var_25_1 / 2, var_25_4.height + var_25_2 / 2))

		local var_25_5 = CCArray:create()

		var_25_5:addObject(CCDelayTime:create(1))
		var_25_5:addObject(CCCallFuncN:create(function()
			if user.feudCd <= 0 then
				var_25_0:removeFromParentAndCleanup(true)
				playerInfoUI.uiTable.icon_seal:setVisible(false)

				playerInfoUI.uiTable.sealBuffBg = nil
			else
				var_25_3:setString(language.get(121070, var_0_2(user.feudCd), user.feudLeftTimes))
			end
		end))

		local var_25_6 = CCSequence:create(var_25_5)

		var_25_0:runAction(CCRepeatForever:create(var_25_6))

		playerInfoUI.uiTable.sealBuffBg = var_25_0
	else
		playerInfoUI.uiTable.sealBuffBg:setVisible(true)
	end
end

local function var_0_3()
	local var_27_0 = createBaseLayer()

	smgr.registerLayer(var_27_0, "playerInfoLayer")
	log.debug("playerInfoUI.initBasicUI()")
	playerInfoUI.initBasicUI()
	log.debug("playerInfoUI.initBasicUI() over")
	var_0_0.getPlayerInfo()
	playerInfoUI.updateResourceUI()
	var_27_0:setTouchEnabled(true)
	var_27_0:registerScriptTouchHandler(var_0_0.onTouch)

	var_27_0.onEnter = var_0_0.onEnter
	var_27_0.onExit = var_0_0.onExit

	if user.hasVipPrivilege and user.shouldShowVipPrivilege then
		local var_27_1, var_27_2 = tool.getPositionInScreen(playerInfoUI.uiTable.chongItem)

		guide.control.loadGuide2(5, var_27_1, var_27_2 - 80, true, language.get(310014))

		user.shouldShowVipPrivilege = false
	end

	smgr.showNotice()

	return var_27_0
end

function playerInfoUI.show()
	local var_28_0 = var_0_3()

	playerInfoUI.uiTable.layer = var_28_0

	smgr.getLayer("uiLayer"):addChild(var_28_0, layerConst.UI, layerConst.UIPLAYERINFO)

	return var_28_0
end
