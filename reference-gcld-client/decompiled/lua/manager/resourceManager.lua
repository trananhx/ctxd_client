rmgr = {}

function rmgr.init()
	rmgr.res = {}
	rmgr.army = {}
	rmgr.batchImage = {}
	rmgr.stategyEffect = {}
	rmgr.stategyEffectInfo = {}
	rmgr.fightFireEffect = nil
	rmgr.modalAnim = nil

	rmgr.initStategyData()
	rmgr.preLoad()

	rmgr.anim = {}
	rmgr.animData = require("res/animation")
end

function rmgr.initStategyData()
	rmgr.stategyEffectInfo[0] = {
		name = "one",
		frameNum = 14
	}
	rmgr.stategyEffectInfo[1] = {
		name = "one",
		frameNum = 14
	}
	rmgr.stategyEffectInfo[2] = {
		name = "group_common",
		frameNum = 20
	}
	rmgr.stategyEffectInfo[3] = {
		name = "two",
		frameNum = 18
	}
	rmgr.stategyEffectInfo[4] = {
		name = "two",
		frameNum = 18
	}
	rmgr.stategyEffectInfo[5] = {
		name = "two",
		frameNum = 18
	}
	rmgr.stategyEffectInfo[6] = {
		name = "group_arrow",
		frameNum = 10
	}
	rmgr.stategyEffectInfo[7] = {
		name = "two",
		frameNum = 18
	}
	rmgr.stategyEffectInfo[8] = {
		name = "group_knight",
		frameNum = 15
	}
	rmgr.stategyEffectInfo[9] = {
		name = "group_common",
		frameNum = 20
	}
	rmgr.stategyEffectInfo[10] = {
		name = "two",
		frameNum = 18
	}
	rmgr.stategyEffectInfo[11] = {
		name = "group_common",
		frameNum = 20
	}
	rmgr.stategyEffectInfo[12] = {
		name = "group_common",
		frameNum = 20
	}
	rmgr.stategyEffectInfo[13] = {
		name = "group_common",
		frameNum = 20
	}
	rmgr.stategyEffectInfo[14] = {
		name = "group_common",
		frameNum = 20
	}
	rmgr.stategyEffectInfo[15] = {
		name = "two",
		frameNum = 18
	}
	rmgr.stategyEffectInfo[16] = {
		name = "two",
		frameNum = 18
	}
	rmgr.stategyEffectInfo[17] = {
		name = "group_knight",
		frameNum = 15
	}
	rmgr.stategyEffectInfo[18] = {
		name = "two",
		frameNum = 18
	}
	rmgr.stategyEffectInfo[19] = {
		name = "two",
		frameNum = 18
	}
	rmgr.stategyEffectInfo[20] = {
		name = "group_common",
		frameNum = 20
	}
	rmgr.stategyEffectInfo[21] = {
		name = "one",
		frameNum = 14
	}
	rmgr.stategyEffectInfo[22] = {
		name = "two",
		frameNum = 18
	}
	rmgr.stategyEffectInfo[23] = {
		name = "two",
		frameNum = 18
	}
	rmgr.stategyEffectInfo[24] = {
		name = "two",
		frameNum = 18
	}
	rmgr.stategyEffectInfo[25] = {
		name = "group_common",
		frameNum = 20
	}
	rmgr.stategyEffectInfo[28] = {
		name = "group_knight",
		frameNum = 15
	}
	rmgr.stategyEffectInfo[29] = {
		name = "group_common",
		frameNum = 20
	}
	rmgr.stategyEffectInfo[31] = {
		name = "group_common",
		frameNum = 20
	}
	rmgr.stategyEffectInfo[33] = {
		name = "group_arrow",
		frameNum = 10
	}
	rmgr.stategyEffectInfo[34] = {
		name = "two",
		frameNum = 18
	}
	rmgr.stategyEffectInfo[38] = {
		name = "ganningjx",
		frameNum = 17
	}
	rmgr.stategyEffectInfo[39] = {
		name = "two",
		frameNum = 18
	}
	rmgr.stategyEffectInfo[40] = {
		name = "group_common",
		frameNum = 20
	}
	rmgr.stategyEffectInfo[41] = {
		name = "group_knight",
		frameNum = 20
	}
	rmgr.stategyEffectInfo[42] = {
		name = "group_knight",
		frameNum = 20
	}
	rmgr.stategyEffectInfo[43] = {
		name = "lvbujx",
		frameNum = 7,
		attPos = ccp(100, 100),
		defPos = ccp(-150, 0)
	}
	rmgr.stategyEffectInfo[46] = {
		name = "qytx",
		frameNum = 17,
		attPos = ccp(200, 450),
		defPos = ccp(-255, 150)
	}
	rmgr.stategyEffectInfo[8044] = {
		name = "lvbu",
		frameNum = 18
	}
	rmgr.stategyEffectInfo[8045] = {
		name = "pzfj",
		frameNum = 11
	}

	require("lua/game/battle/uiConstant")

	rmgr.stategyEffectInfo[battleTower.FANGJIAN] = {
		name = "tower_shoot",
		frameNum = 34
	}
	rmgr.stategyEffectInfo[battleTower.FANGJIAN_1] = {
		name = "tower_shoot_2",
		frameNum = 34
	}
	rmgr.stategyEffectInfo[battleTower.PAOJI] = {
		name = "tower_paoji",
		frameNum = 21
	}
	rmgr.stategyEffectInfo[battleTower.POHUAI] = {
		name = "toushiche_pohuai",
		frameNum = 30
	}
	rmgr.stategyEffectInfo[battleTower.POHUAI_1] = {
		name = "toushiche_pohuai_2",
		frameNum = 26
	}
	rmgr.stategyEffectInfo[battleTower.FANGJIAN_5] = {
		name = "tower_shoot_3",
		frameNum = 23
	}
	rmgr.stategyEffectInfo[battleTower.SMOKE] = {
		name = "tower_smoke",
		frameNum = 32
	}
	rmgr.stategyEffectInfo[ZHUGELIANG_BAGUA] = {
		name = "zhugeliang",
		frameNum = 8
	}
	rmgr.stategyEffectInfo[BATTLE_TUCHENGH] = {
		name = "tucheng",
		frameNum = 52
	}
	rmgr.stategyEffectInfo[BATTLE_LVBUZIBAO] = {
		name = "lvbu",
		frameNum = 12
	}
	rmgr.stategyEffectInfo[XUNYU_YEHUOPOZHEN] = {
		name = "group_common",
		frameNum = 20
	}
	rmgr.stategyEffectInfo[TEN_JUNLINTIANXIA] = {
		name = "jntx",
		frameNum = 13
	}
	rmgr.stategyEffectInfo[CARSHILED_EFFECT] = {
		name = "carShield",
		frameNum = 15
	}
end

function rmgr.preLoad()
	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("res/ui/common/button/button.plist")
	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("res/ui/common/widgets/widgets.plist")
	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("res/ui/common/icon/icon.plist")
	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("res/ui/common/panel/panel.plist")
	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("res/ui/common/symbol/symbol.plist")
	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("res/ui/common/ItemsPic/ItemsPic3.plist")
	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("res/ui/common/ItemsPic/ItemsPic2.plist")
	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("res/ui/common/ItemsPic/ItemsPic.plist")
	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("res/ui/common/consumeWin.plist")
	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("res/ui/common/mainTitle.plist")
	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("res/ui/nation/nation.plist")
	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("res/ui/nation/nation1.plist")
end

function rmgr.loadPlistAsync(arg_4_0, arg_4_1, arg_4_2)
	local function var_4_0()
		CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile(arg_4_0)

		if arg_4_2 then
			arg_4_2()
		end

		log.info("@@ 异步加载资源完成 ", arg_4_0)
	end

	log.info("@@ 异步加载资源 ", arg_4_0)
	rmgr.loadTextureAsync(arg_4_1, var_4_0)
end

function rmgr.loadTextureAsync(arg_6_0, arg_6_1)
	CCTextureCache:sharedTextureCache():addImageAsyncInLua(arg_6_0, arg_6_1)
end

function rmgr.loadResource(arg_7_0)
	if rmgr.res[arg_7_0] then
		rmgr.res[arg_7_0] = rmgr.res[arg_7_0] + 1
	else
		rmgr.res[arg_7_0] = 1
	end

	log.info("[rmgr] load ", arg_7_0)
	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile(arg_7_0)
end

function rmgr.clearup()
	log.info("[rmgr] clearup resource ")

	for iter_8_0, iter_8_1 in pairs(rmgr.res) do
		log.info("[rmgr] remove ", iter_8_0)
		CCSpriteFrameCache:sharedSpriteFrameCache():removeSpriteFramesFromFile(iter_8_0)
	end

	rmgr.res = {}

	log.info("[rmgr] clearup army")

	for iter_8_2, iter_8_3 in pairs(rmgr.army) do
		for iter_8_4, iter_8_5 in pairs(iter_8_3) do
			for iter_8_6, iter_8_7 in pairs(iter_8_5) do
				iter_8_7:release()
			end
		end
	end

	rmgr.army = {}

	log.info("[rmgr] clearup effect")

	for iter_8_8, iter_8_9 in pairs(rmgr.stategyEffect) do
		for iter_8_10, iter_8_11 in pairs(iter_8_9) do
			if not tolua.isnull(iter_8_11) then
				iter_8_11:release()
			end
		end
	end

	rmgr.stategyEffect = {}

	rmgr.releaseAllAnimation()

	if rmgr.speedAnim then
		rmgr.speedAnim:release()

		rmgr.speedAnim = nil
	end
end

function rmgr.loadTable(arg_9_0)
	for iter_9_0, iter_9_1 in pairs(arg_9_0) do
		CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile(iter_9_1)
	end
end

function rmgr.unloadTable(arg_10_0)
	for iter_10_0, iter_10_1 in pairs(arg_10_0) do
		rmgr.loadResource(iter_10_1)
	end
end

function rmgr.createFrameArray(arg_11_0, arg_11_1)
	local var_11_0 = CCArray:create()

	for iter_11_0 = 1, arg_11_1 do
		local var_11_1 = string.format("%s/%d.png", arg_11_0, iter_11_0)
		local var_11_2 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_11_1)

		if var_11_2 == nil then
			log.error("[rmgr] get army error ", var_11_1)
		else
			var_11_0:addObject(var_11_2)
		end
	end

	var_11_0:retain()

	return var_11_0
end

function rmgr.getArmy(arg_12_0, arg_12_1, arg_12_2)
	if arg_12_2 == nil then
		arg_12_2 = ""
	end

	if arg_12_1 == 1 then
		arg_12_1 = 2
	elseif arg_12_1 == 6 then
		arg_12_1 = 7
	elseif arg_12_1 == 11 then
		arg_12_1 = 12
	elseif arg_12_1 == 16 then
		arg_12_1 = 17
	elseif arg_12_1 == 22 then
		arg_12_1 = 23
	elseif arg_12_1 == 24 then
		arg_12_1 = 25
	elseif arg_12_1 == 31 then
		arg_12_1 = 33
	elseif arg_12_1 == 34 then
		arg_12_1 = 32
	elseif arg_12_1 == 41 then
		arg_12_1 = 4
	elseif arg_12_1 == 44 then
		arg_12_1 = 15
	end

	rmgr.army[arg_12_0] = rmgr.army[arg_12_0] or {}
	rmgr.batchImage[arg_12_0] = rmgr.batchImage[arg_12_0] or {}

	if rmgr.army[arg_12_0][arg_12_1] and arg_12_2 == "" then
		return rmgr.army[arg_12_0][arg_12_1], rmgr.batchImage[arg_12_0][arg_12_1]
	end

	local var_12_0 = {}
	local var_12_1 = string.format("res/anim/avatar/%s%s%s.plist", arg_12_0, arg_12_1, arg_12_2)
	local var_12_2 = string.format("res/anim/avatar/%s%s%s.png", arg_12_0, arg_12_1, arg_12_2)
	local var_12_3 = CCSpriteFrameCache:sharedSpriteFrameCache()

	var_12_3:addSpriteFramesWithFile(var_12_1)
	log.info("[rmgr] get army anim ", arg_12_1, arg_12_0, var_12_1)

	local var_12_4 = 12
	local var_12_5 = 4
	local var_12_6 = 1
	local var_12_7 = 6
	local var_12_8 = 14

	if arg_12_1 == 30 then
		var_12_4 = 13
	elseif arg_12_1 == 40 and arg_12_2 == "_2" then
		var_12_6 = 8
	elseif arg_12_1 == 54 then
		var_12_4 = 11
		var_12_8 = 12
	elseif arg_12_1 == 55 then
		var_12_4 = 13
		var_12_8 = 11
	elseif arg_12_1 == 56 then
		var_12_7 = 8
		var_12_8 = 12
	elseif arg_12_1 == 58 then
		var_12_4 = 10
		var_12_5 = 9
		var_12_6 = 8
		var_12_7 = 1
		var_12_8 = 1
	elseif arg_12_1 == "58_1" then
		var_12_6 = 8
		var_12_7 = 8
	end

	if arg_12_1 == 21 and arg_12_0 == "def" then
		var_12_0.win = rmgr.createFrameArray("idle", 1)
		var_12_0.attack = rmgr.createFrameArray("move", var_12_7)
	else
		var_12_0.win = rmgr.createFrameArray("win", var_12_8)
		var_12_0.attack = rmgr.createFrameArray("attack", var_12_4)
	end

	var_12_0.hitted = rmgr.createFrameArray("hitted", var_12_5)
	var_12_0.idle = rmgr.createFrameArray("idle", var_12_6)
	var_12_0.move = rmgr.createFrameArray("move", var_12_7)

	if arg_12_1 == 56 then
		var_12_0.attack_2 = rmgr.createFrameArray("attack_2", var_12_4)
		var_12_0.hitted_2 = rmgr.createFrameArray("hitted_2", var_12_5)
		var_12_0.idle_2 = rmgr.createFrameArray("idle_2", var_12_6)
		var_12_0.move_2 = rmgr.createFrameArray("move_2", var_12_7)
		var_12_0.win_2 = rmgr.createFrameArray("win_2", var_12_8)
	end

	if arg_12_1 == "57_1" then
		var_12_0.light = rmgr.createFrameArray("light", 34)
	end

	if arg_12_2 == "" then
		rmgr.army[arg_12_0][arg_12_1] = var_12_0
		rmgr.batchImage[arg_12_0][arg_12_1] = var_12_2

		var_12_3:removeSpriteFramesFromFile(var_12_1)

		return rmgr.army[arg_12_0][arg_12_1], rmgr.batchImage[arg_12_0][arg_12_1]
	else
		var_12_3:removeSpriteFramesFromFile(var_12_1)

		return var_12_0, var_12_2
	end
end

function rmgr.getStategyEffect(arg_13_0, arg_13_1)
	rmgr.stategyEffect[arg_13_0] = rmgr.stategyEffect[arg_13_0] or {}

	if rmgr.stategyEffect[arg_13_0][arg_13_1] then
		return rmgr.stategyEffect[arg_13_0][arg_13_1]
	else
		if not rmgr.stategyEffectInfo[arg_13_1] then
			log.error("@@ 战法特效不存在，战法id : ", arg_13_1)

			return
		end

		local var_13_0 = rmgr.stategyEffectInfo[arg_13_1].frameNum
		local var_13_1 = rmgr.stategyEffectInfo[arg_13_1].name
		local var_13_2 = string.format("%s_%s", arg_13_0, var_13_1)
		local var_13_3 = string.format("res/anim/stategyEffect/%s/%s.plist", var_13_2, var_13_2)
		local var_13_4 = CCSpriteFrameCache:sharedSpriteFrameCache()

		var_13_4:addSpriteFramesWithFile(var_13_3)

		local var_13_5 = CCArray:create()

		for iter_13_0 = 1, var_13_0 do
			local var_13_6 = var_13_4:spriteFrameByName(string.format("%d.png", iter_13_0))

			if var_13_6 then
				var_13_5:addObject(var_13_6)
			end
		end

		var_13_5:retain()

		rmgr.stategyEffect[arg_13_0][arg_13_1] = var_13_5

		var_13_4:removeSpriteFramesFromFile(var_13_3)

		return var_13_5
	end
end

function rmgr.getFightFireEffect()
	if rmgr.fightFireEffect then
		return rmgr.fightFireEffect
	else
		local var_14_0 = 5
		local var_14_1 = CCSpriteFrameCache:sharedSpriteFrameCache()
		local var_14_2 = "res/anim/fightEffect/fire.plist"

		var_14_1:addSpriteFramesWithFile(var_14_2)

		local var_14_3 = CCArray:create()

		for iter_14_0 = 1, var_14_0 do
			local var_14_4 = string.format("%d.png", iter_14_0)
			local var_14_5 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_14_4)

			if var_14_5 then
				var_14_3:addObject(var_14_5)
			end
		end

		var_14_3:retain()

		rmgr.fightFireEffect = var_14_3

		var_14_1:removeSpriteFramesFromFile(var_14_2)

		return var_14_3
	end
end

function rmgr.getModalAnimation()
	if rmgr.modalAnim then
		return rmgr.modalAnim
	else
		local var_15_0 = 11
		local var_15_1 = CCSpriteFrameCache:sharedSpriteFrameCache()
		local var_15_2 = "res/anim/common/loadingAnim.plist"

		var_15_1:addSpriteFramesWithFile(var_15_2)

		local var_15_3 = CCArray:create()

		for iter_15_0 = 1, var_15_0 do
			local var_15_4 = string.format("loading%d.png", iter_15_0)
			local var_15_5 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_15_4)

			if var_15_5 then
				var_15_3:addObject(var_15_5)
			end
		end

		var_15_3:retain()

		rmgr.modalAnim = var_15_3

		var_15_1:removeSpriteFramesFromFile(var_15_2)

		return var_15_3
	end
end

function rmgr.getSpeedEffectAnimation()
	if rmgr.speedAnim then
		return rmgr.speedAnim
	else
		local var_16_0 = 5
		local var_16_1 = CCSpriteFrameCache:sharedSpriteFrameCache()
		local var_16_2 = "res/anim/speed/SpeedEffect.plist"

		var_16_1:addSpriteFramesWithFile(var_16_2)

		local var_16_3 = CCArray:create()

		for iter_16_0 = 1, var_16_0 do
			local var_16_4 = string.format("%d.png", iter_16_0)
			local var_16_5 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_16_4)

			if var_16_5 then
				var_16_3:addObject(var_16_5)
			end
		end

		var_16_3:retain()

		rmgr.speedAnim = var_16_3

		var_16_1:removeSpriteFramesFromFile(var_16_2)

		return var_16_3
	end
end

function rmgr.getAnimation(arg_17_0)
	if rmgr.anim[arg_17_0] then
		return rmgr.anim[arg_17_0]
	end

	if rmgr.animData and rmgr.animData[arg_17_0] then
		local var_17_0 = rmgr.animData[arg_17_0].frame
		local var_17_1 = rmgr.animData[arg_17_0].file
		local var_17_2 = rmgr.animData[arg_17_0].prefix or ""
		local var_17_3 = CCSpriteFrameCache:sharedSpriteFrameCache()

		var_17_3:addSpriteFramesWithFile(var_17_1)

		local var_17_4 = CCArray:create()

		for iter_17_0 = 1, var_17_0 do
			local var_17_5 = string.format("%s%d.png", var_17_2, iter_17_0)
			local var_17_6 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_17_5)

			if var_17_6 == nil then
				log.error("[rmgr] get army animation %s error", var_17_5)
			else
				var_17_4:addObject(var_17_6)
			end
		end

		var_17_4:retain()

		rmgr.anim[arg_17_0] = var_17_4

		var_17_3:removeSpriteFramesFromFile(var_17_1)

		return var_17_4
	end
end

function rmgr.releaseAllAnimation()
	for iter_18_0, iter_18_1 in pairs(rmgr.anim) do
		iter_18_1:release()
	end

	rmgr.anim = {}
end

function rmgr.getGeneralBust(arg_19_0)
	require("lua/data/generalBustMap")

	local var_19_0 = generalBustMap[arg_19_0]
	local var_19_1 = "res/ui/common/halfPic/halfPic_%s.png"

	if var_19_0 then
		var_19_1 = string.format(var_19_1, var_19_0)
	else
		if string.endWith(arg_19_0, ".png") then
			arg_19_0 = string.sub(arg_19_0, 1, string.find(arg_19_0, ".png") - 1)
		end

		log.info("@@@@ ", arg_19_0)

		var_19_1 = string.format(var_19_1, arg_19_0)
	end

	return var_19_1
end

function rmgr.getLoginUpOnPic()
	local var_20_0 = channelMgr.getCurrentChannel()
	local var_20_1 = "res/ui/login/login_up_on.png"

	if conf.language == "tw" then
		if var_20_0 == channels.andTwPub then
			var_20_1 = "res/native/login/login_up_on_pubgame.png"
		elseif var_20_0 == channels.andTwGo2Play or var_20_0 == channels.andTwGo2PlayThird then
			var_20_1 = "res/native/login/login_up_on_go2play.png"
		elseif var_20_0 == channels.iosTw37Wan or var_20_0 == channels.andTw37Wan then
			var_20_1 = "res/native/login/login_up_on_37wan.png"
		end
	elseif conf.language == "tha" then
		var_20_1 = "res/native/login/login_up_on.png"
	end

	return var_20_1
end

function rmgr.setTallyPic(arg_21_0, arg_21_1)
	local var_21_0 = type(arg_21_0) == "number" and arg_21_0 >= 1 and arg_21_0 <= 4

	if var_21_0 then
		arg_21_1:setDisplayFrame(CCSprite:create(string.format("res/ui/kfyz/wait/icon_hf%s.png", arg_21_0)):displayFrame())
	end

	return var_21_0
end

function rmgr.isNotComplete()
	local var_22_0 = CCUserDefault:sharedUserDefault():getIntegerForKey("inComplete")
	local var_22_1 = CCUserDefault:sharedUserDefault():getIntegerForKey("packageStatus")

	return var_22_0 == 1 and var_22_1 == 0
end

function rmgr.isNotCompleteAndHighLevel()
	return rmgr.isNotComplete() and user ~= nil and user.player ~= nil and user.player.playerLv ~= nil and user.player.playerLv >= 35
end

function rmgr.getSData(arg_24_0)
	rmgr.sdata = rmgr.sdata or {}

	if rmgr.sdata[arg_24_0] == nil then
		local var_24_0 = require("lua/common/xmlSimple").newParser()
		local var_24_1 = string.format("res/sdata/%s", tostring(arg_24_0))
		local var_24_2 = require(var_24_1)
		local var_24_3 = string.gsub(var_24_2, "<!%[CDATA%[", "")
		local var_24_4 = string.gsub(var_24_3, "]]>", "")
		local var_24_5 = string.gsub(var_24_4, "<br>", "[br]")
		local var_24_6 = var_24_0:ParseXmlText(var_24_5)

		if var_24_6 == nil then
			log.error("@@ 加载静态数据出错，配置不存在", var_24_1)

			return nil
		end

		local var_24_7 = var_24_6.table.key

		if var_24_7 == nil then
			log.error("@@ 加载静态数据出错，没有配置key", var_24_1)

			return nil
		end

		local var_24_8 = tostring(var_24_7:value())

		if var_24_8 == nil or #var_24_8 == 0 then
			log.error("@@ 加载静态数据出错，key值为null", var_24_1)

			return nil
		end

		local var_24_9 = {}

		for iter_24_0, iter_24_1 in pairs(var_24_6.table.r) do
			local var_24_10 = {}
			local var_24_11

			for iter_24_2, iter_24_3 in pairs(iter_24_1.f) do
				local var_24_12 = tostring(iter_24_3["@n"])
				local var_24_13 = tostring(iter_24_3:value())

				if var_24_12 and #var_24_12 > 0 then
					var_24_10[var_24_12] = var_24_13
				end

				if var_24_8 == var_24_12 then
					var_24_11 = var_24_13
				end
			end

			var_24_9[var_24_11] = var_24_10
		end

		rmgr.sdata[arg_24_0] = var_24_9
	end

	return rmgr.sdata[arg_24_0]
end

function rmgr.getBaoshiFilePath(arg_25_0, arg_25_1)
	if arg_25_1 == nil then
		arg_25_1 = 1
	end

	local var_25_0
	local var_25_1
	local var_25_2, var_25_3 = string.find(arg_25_0, "baoshi")

	if var_25_2 and var_25_3 then
		var_25_0 = "res/ui/weapon/" .. arg_25_0 .. ".jpg"
		var_25_1 = 0
	else
		local var_25_4, var_25_5 = string.find(arg_25_0, "shenshi")

		if var_25_4 and var_25_5 then
			if arg_25_1 >= 1 and arg_25_1 <= 4 then
				var_25_0 = "res/ui/weapon/jinengshenshi.png"
			elseif arg_25_1 >= 5 and arg_25_1 <= 8 then
				var_25_0 = "res/ui/weapon/jinengshenshi1.jpg"
			elseif arg_25_1 >= 9 then
				var_25_0 = "res/ui/weapon/jinengshenshi2.jpg"
			end

			var_25_1 = 2
		else
			local var_25_6 = math.floor((arg_25_1 - 1) / 4) + 1

			var_25_0 = "res/ui/weapon/jinengshi" .. var_25_6 .. ".png"
			var_25_1 = 1
		end
	end

	return var_25_0, var_25_1
end
