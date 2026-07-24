bmgr = {}

function bmgr.watchBattle(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0(arg_2_0)
		CCTextureCache:sharedTextureCache():removeUnusedTextures()
		smgr.changeScene(SCENE_BATTLE, arg_1_0, {
			watch = true,
			prepare = false,
			battleId = arg_1_1,
			battleData = arg_2_0.action.data
		})
	end

	arg_1_2 = arg_1_2 or 0

	cmgr.sendRequest(var_1_0, actions.watch, arg_1_1, arg_1_2)
end

function bmgr.tryEnterBattle(arg_3_0, arg_3_1)
	local function var_3_0(arg_4_0)
		if arg_4_0.action.data.battle then
			local var_4_0 = {}

			var_4_0.prepare = true
			var_4_0.generalId = arg_3_1.generalId or 0
			var_4_0.target = arg_3_1.targetId
			var_4_0.terrain = arg_3_1.terrain

			if arg_4_0.action.data.battleId and arg_3_0 ~= battleType.BATTLE_CITY_ONE2ONE then
				local var_4_1 = arg_4_0.action.data.battleId

				if arg_3_1.hasInBattleId and arg_3_1.hasInBattleId == var_4_1 then
					return
				end

				bmgr.watchBattle(arg_3_0, arg_4_0.action.data.battleId)

				return
			else
				CCTextureCache:sharedTextureCache():removeUnusedTextures()
				smgr.changeScene(SCENE_BATTLE, arg_3_0, var_4_0)
			end
		end
	end

	if arg_3_1.battleId then
		local var_3_1 = {}

		var_3_1.prepare = false
		var_3_1.battleId = arg_3_1.battleId

		bmgr.watchBattle(arg_3_0, arg_3_1.battleId)

		return
	end

	if not arg_3_1.reserve then
		arg_3_1.reserve = 1
	end

	if not arg_3_1.generalId then
		arg_3_1.generalId = 0
	end

	if not arg_3_1.targetId then
		arg_3_1.targetId = 0
	end

	if not arg_3_1.terrain then
		arg_3_1.terrain = 0
	end

	if user.player.inPveBattle and arg_3_0 and (arg_3_0 == battleType.BATTLE_ARMY or battleType.BATTLE_ARMY_EXTRA) then
		arg_3_1.reserve = 0
	end

	cmgr.sendRequest(var_3_0, actions.battlePermit, arg_3_1.targetId, arg_3_1.generalId, arg_3_1.reserve, arg_3_0)
end

function bmgr.playBattle(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0 or {
		{
			generalPic = "zhoutai",
			quality = 1,
			generalId = 0,
			state = 1,
			generalName = "家丁",
			index = 1,
			generalLv = 10
		}
	}
	local var_5_1 = arg_5_1 or {
		{
			generalPic = "zhoutai",
			quality = 1,
			generalId = 0,
			state = 1,
			generalName = "土匪",
			index = 1,
			generalLv = 10
		}
	}

	bmgr.reportAttType = 2000120
	bmgr.reportAttName = "防守"

	local var_5_2 = arg_5_2 or "1|-1#17|1#10|att;0|73083|7|11|1级短弓兵|0|2000120|0|400*400,400*400,400*400;1|73083|7|11|1级短弓兵|0|3000110|0|400*400,400*400,400*400;#10|def;0|-1|5|1|1级藤甲兵|0|1000130|0|256*256,256*256,256*256;1|-1|5|1|1级藤甲兵|0|2000120|0|256*256,256*256,256*256;#16|att|1|2400|2400|0|;1|村民|村民|cunmin|1|0|null|0;null#16|def|10|1536|1536|0|;0|NPC|土匪|shanzei|1|0|null|0;null##27|att|" .. user.player.id .. "|0|村民|-1|1;2000120|3000110|攻击|2000120|防守|1000130|突击;1|0|cunmin|0|0#27|def|-1|0|NPC|-1|0;null;null#26|5800#25|73083|1;0|3000110;1|3000110#16|att|1|2400|2400|0|;1|村民|村民|cunmin|1|0|null|0;null#16|def|10|1536|1536|0|;0|NPC|土匪|shanzei|1|0|null|0;null#14|2;0,73083|0,-1;2,0," .. bmgr.reportAttType .. ",0,0,0," .. bmgr.reportAttType .. "," .. bmgr.reportAttName .. ",0,0,0|2,0,1000130,0,0,0,1000130,突击,0,0,0;0,51,349,51,349,51,349,|0,10,246,10,246,10,246;null|null;null|null#30|-1|-1#16|att|1|2247|2400|0|;1|村民|村民|cunmin|1|0|null|0;null#16|def|10|1506|1536|0|;0|NPC|土匪|shanzei|1|0|null|0;null#3|1|1;0|0;1|45|121,2|35|125,1001|1*1|47|124,2|33|122,1001|1*1|49|125,2|31|121,1001|1;269,269,269|0,0,0#31|1#30|-1|0#16|att|1|2007|2400|0|;1|村民|村民|cunmin|1|0|null|0;null#16|def|10|768|1536|0|;0|NPC|土匪|shanzei|1|0|null|0;null#19|att;73083|23|0|0;1*23|5*23#27|att|" .. user.player.id .. "|0|村民|-1|0;null;null#27|def|-1|1|NPC|-1|0;null;null#26|5800#16|att|1|2007|2400|0|;1|村民|村民|cunmin|1|0|null|0;null#16|def|10|768|1536|0|;0|NPC|土匪|shanzei|1|0|null|0;null#14|1;0,73083|1,-1;2,0,3000110,0,0,0,3000110,攻击,0,0,0|2,0,2000120,0,0,0,2000120,防守,0,0,0;0,10,259,10,259,10,259,|1,53,203,53,203,53,203;null|null;null|null#30|-1|-1#16|att|1|1977|2400|0|;1|村民|村民|cunmin|1|0|null|0;null#16|def|10|609|1536|0|;0|NPC|土匪|shanzei|1|0|null|0;null#3|2|1;0|1;1|41|140,2|33|63,1001|1*1|38|135,2|36|68,1001|1*1|40|132,2|34|71,1001|1;185,185,185|0,0,0#31|1#30|-1|1#20|att;1;1;73083;0,1#16|att|1|1755|2400|1|;1|村民|村民|cunmin|1|0|null|0;null#16|def|10|0|1536|0|;0|NPC|土匪|shanzei|1|0|null|0;null#19|att;73083|15|0|0;1*15|5*15#5|#7|1|-1;1536|645|1|土匪;1*38|5*73;0|0|0|;null;null;null;null;null#"

	smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_DEMO, {
		att = var_5_0,
		def = var_5_1,
		report = var_5_2
	})
end

function bmgr.showTeamBattleEffect()
	local var_6_0 = smgr.getLayer("effectlayer")
	local var_6_1 = CCSprite:create("res/ui/battle/teamBattle/army_group_enter.png")

	var_6_1:setPosition(ccp(visibleSize.width + var_6_1:getContentSize().width * 0.5, visibleSize.height * 0.5))
	var_6_0:addChild(var_6_1)

	local var_6_2 = CCSprite:create("res/ui/common/text/battle/army_group_enter_tit.png")

	var_6_2:setPosition(ccp(var_6_1:getContentSize().width * 0.5, var_6_1:getContentSize().height * 1.2))
	var_6_1:addChild(var_6_2)

	local function var_6_3()
		var_6_0:removeChild(var_6_1, true)
	end

	local var_6_4 = rmgr.getSpeedEffectAnimation()
	local var_6_5 = CCAnimation:createWithSpriteFrames(var_6_4, 0.08)
	local var_6_6 = CCAnimate:create(var_6_5)
	local var_6_7 = CCRepeatForever:create(var_6_6)
	local var_6_8 = CCSprite:create()

	var_6_8:runAction(var_6_7)
	var_6_8:setPosition(ccp(var_6_1:getContentSize().width * 0.5, var_6_1:getContentSize().height * 0.5))
	var_6_1:addChild(var_6_8)

	local var_6_9 = CCArray:create()

	var_6_9:addObject(CCMoveTo:create(0.5, ccp(visibleSize.width * 0.5, visibleSize.height * 0.5)))
	var_6_9:addObject(CCDelayTime:create(2))
	var_6_9:addObject(CCMoveTo:create(0.5, ccp(0 - var_6_1:getContentSize().width * 0.5, visibleSize.height * 0.5)))
	var_6_9:addObject(CCCallFuncN:create(var_6_3))

	local var_6_10 = CCSequence:create(var_6_9)

	var_6_1:runAction(var_6_10)
end

function bmgr.enterKfgz(arg_8_0)
	if arg_8_0 then
		smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_KFGZ, {
			teamId = arg_8_0
		})
	end
end

function bmgr.enterKfwd()
	local function var_9_0(arg_10_0)
		require("lua/game/battle/battleConstants")
		log.info("@@ 跨服武斗初始化信息")

		local var_10_0 = arg_10_0.data

		if var_10_0.battleIni then
			smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_KFWD, {
				state = kfwdState.fight,
				info = var_10_0.battleIni
			})
		elseif var_10_0.battleRes then
			smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_KFWD, {
				state = kfwdState.result,
				info = var_10_0.battleRes
			})
		end
	end

	local function var_9_1(arg_11_0)
		local var_11_0 = arg_11_0.data.bInfo
		local var_11_1 = var_11_0.nextSRoundCD
		local var_11_2 = var_11_0.round

		if var_11_1 / 3600000 > 1 or var_11_2 > 15 then
			log.info("@@ 比赛结束，显示积分榜")
			smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_KFWD, {
				state = kfwdState.over
			})
		elseif var_11_1 > 0 then
			log.info("@@ 比赛准备界面")
			smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_KFWD, {
				state = kfwdState.prepare
			})
		else
			kfcmgr.sendRequest(var_9_0, actions.kfwdInit)
		end
	end

	kfcmgr.sendRequest(var_9_1, actions.kfwdMatchRTInfo)
end

function bmgr.enterKfzb()
	local function var_12_0(arg_13_0)
		require("lua/game/battle/battleConstants")
		log.info("@@ 跨服争霸初始化信息")

		local var_13_0 = arg_13_0.data

		if var_13_0.battleIni then
			log.info("@@ 跨服争霸，参战战报:", var_13_0.battleIni)
			smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_KFZB, {
				state = kfzbState.fight,
				info = var_13_0.battleIni
			})
		elseif var_13_0.battleRes then
			log.info("@@ 跨服争霸，参战战报:", var_13_0.battleRes)
			smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_KFZB, {
				state = kfzbState.result,
				info = var_13_0.battleRes
			})
		end
	end

	local function var_12_1(arg_14_0)
		if arg_14_0.data.bInfo.battleCd > 0 then
			smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_KFZB, {
				state = kfzbState.prepare,
				info = arg_14_0.data
			})
		else
			kfcmgr.sendRequest(var_12_0, actions.kfzbGetBattleIniInfo)
		end
	end

	kfcmgr.sendRequest(var_12_1, actions.kfzbGetMatchRTInfo)
end
