local function var_0_0()
	if user.player.playerLv < 20 then
		roleDialogue.control.quick_loadSpeak(360)
	elseif user.player.playerLv < 27 then
		roleDialogue.control.quick_loadSpeak(361)
	elseif user.player.playerLv < 29 then
		roleDialogue.control.quick_loadSpeak(362)
	elseif user.player.playerLv < 36 then
		-- block empty
	elseif user.player.playerLv < 46 then
		roleDialogue.control.quick_loadSpeak(363)
	elseif user.player.playerLv < 49 then
		roleDialogue.control.quick_loadSpeak(364)
	elseif user.player.playerLv < 53 then
		roleDialogue.control.quick_loadSpeak(365)
	elseif user.player.playerLv < 61 then
		roleDialogue.control.quick_loadSpeak(366)
	elseif user.player.playerLv < 70 then
		-- block empty
	elseif user.player.playerLv < 72 then
		roleDialogue.control.quick_loadSpeak(367)
	elseif user.player.playerLv < 80 then
		roleDialogue.control.quick_loadSpeak(368)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = {}

	if conf.language == "vie" then
		var_2_0.titleX = 80
	else
		var_2_0.titleX = 0
	end

	local var_2_1

	if arg_2_1.finishedPercent == -1 then
		if arg_2_1.fightResult == 1 then
			var_2_1 = CCSprite:create("res/ui/common/text/battle/text_result_success.png")
		elseif arg_2_1.fightResult == 2 then
			var_2_1 = CCSprite:create("res/ui/common/text/battle/text_result_faild.png")
		end

		var_2_1:setPosition(ccp(arg_2_0:getContentSize().width / 2, arg_2_0:getContentSize().height * 0.95))
	else
		local var_2_2 = CCSprite:create("res/ui/common/text/battle/text_result_harry.png")
		local var_2_3 = CCLabelAtlas:create(tostring(arg_2_1.finishedPercent), "res/ui/common/number/progressNum.png", 43, 56, 48)

		var_2_3:setAnchorPoint(ccp(0.5, 0.5))

		local var_2_4 = CCSprite:createWithSpriteFrameName("symbol_green_percent.png")

		var_2_1 = createRichNode({
			var_2_2,
			var_2_3,
			var_2_4
		}, 0.5)

		var_2_1:setPosition(ccp(arg_2_0:getContentSize().width / 2 + var_2_0.titleX, arg_2_0:getContentSize().height * 0.92))
	end

	if var_2_1 then
		arg_2_0:addChild(var_2_1)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0

	log.info("战斗方：", arg_3_0.figthSide, "结果：", arg_3_2.fightResult)

	local var_3_1 = string.format("res/ui/common/playerPic/player%d.png", user.player.pic)
	local var_3_2

	if arg_3_2.fightResult == 1 then
		var_3_2 = CCSprite:create(var_3_1)
	elseif arg_3_2.fightResult == 2 then
		var_3_2 = GraySprite:create(var_3_1)
	end

	var_3_2:setScale(0.7)
	var_3_2:setAnchorPoint(ccp(0, 0))
	var_3_2:setPosition(ccp(0, 65))
	arg_3_1:addChild(var_3_2)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = {}

	if conf.language == "tha" then
		var_4_0.rivalNameFontSize = 8
		var_4_0.rivalNameLabelY = 5
		var_4_0.killNumY = 16
	else
		var_4_0.rivalNameFontSize = 0
		var_4_0.rivalNameLabelY = 0
		var_4_0.killNumY = 0
	end

	local var_4_1 = CCSprite:createWithSpriteFrameName("fightResultPanel.png")

	var_4_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
	arg_4_1:addChild(var_4_1)

	local var_4_2 = ccp(var_4_1:getContentSize().width * 0.3, var_4_1:getContentSize().height * 0.55)
	local var_4_3 = ccp(var_4_1:getContentSize().width * 0.3, var_4_1:getContentSize().height * 0.4)
	local var_4_4 = ccp(var_4_1:getContentSize().width * 0.3, var_4_1:getContentSize().height * 0.22)

	if arg_4_0.battleType ~= battleType.BATTLE_ARMY then
		var_4_2 = ccp(var_4_1:getContentSize().width * 0.3, var_4_1:getContentSize().height * 0.7)
		var_4_3 = ccp(var_4_1:getContentSize().width * 0.3, var_4_1:getContentSize().height * 0.6)
		var_4_4 = ccp(var_4_1:getContentSize().width * 0.3, var_4_1:getContentSize().height * 0.4)
	elseif arg_4_2.fightResult == 2 then
		var_0_0()
	end

	var_0_1(var_4_1, arg_4_2)
	var_0_2(arg_4_0, var_4_1, arg_4_2)

	if arg_4_0.battleType == battleType.BATTLE_ARMY then
		local var_4_5 = CCSprite:create("res/ui/common/text/battle/text_result_difang.png")

		var_4_5:setAnchorPoint(ccp(0, 0.5))
		var_4_5:setPosition(ccp(var_4_1:getContentSize().width * 0.3, var_4_1:getContentSize().height * 0.7))
		var_4_1:addChild(var_4_5)

		local var_4_6 = CCLabelTTF:create(arg_4_2.killedGeneralName, "Thonburi-Bold", 18 + var_4_0.rivalNameFontSize)

		var_4_6:setPosition(ccp(var_4_5:getContentSize().width + var_4_6:getContentSize().width * 0.5 + 10, var_4_6:getContentSize().height * 0.5 + var_4_0.rivalNameLabelY))
		var_4_5:addChild(var_4_6)
	end

	local var_4_7 = CCSprite:create("res/ui/common/text/battle/text_result_jianmiedir.png")

	var_4_7:setPosition(ccp(var_4_1:getContentSize().width * 0.7, var_4_1:getContentSize().height * 0.7))
	var_4_1:addChild(var_4_7)

	local var_4_8 = CCLabelAtlas:create(tostring(arg_4_2.killNum), "res/ui/common/number/jianmieNum.png", 19, 20, 48)

	if conf.language == "tha" then
		var_4_8:setAnchorPoint(ccp(0, 0.5))
		var_4_8:setPosition(ccp(var_4_7:getContentSize().width / 2 + 72, 0 + var_4_0.killNumY))
	else
		var_4_8:setPosition(ccp(var_4_7:getContentSize().width + 10, 0 + var_4_0.killNumY))
	end

	var_4_7:addChild(var_4_8)

	local var_4_9 = CCSprite:create("res/ui/common/text/battle/text_result_zuidajisha.png")

	var_4_9:setAnchorPoint(ccp(0, 0.5))
	var_4_9:setPosition(var_4_2)
	var_4_1:addChild(var_4_9)

	if arg_4_2.killGeneralNum then
		local var_4_10 = CCLabelAtlas:create(tostring(arg_4_2.killGeneralNum), "res/ui/common/number/shaNum.png", 38.2, 47, 48)

		var_4_10:setAnchorPoint(ccp(0.5, 0.5))

		local var_4_11 = CCSprite:create("res/ui/common/text/battle/text_fight_info_sha1.png")
		local var_4_12 = createRichNode({
			var_4_10,
			var_4_11
		}, 0)

		var_4_12:setPosition(ccp(var_4_9:getContentSize().width + 10, var_4_9:getContentSize().height * 0.5))

		if conf.language == "vie" then
			var_4_12:setScale(0.7)
		else
			var_4_12:setScale(1)
		end

		var_4_9:addChild(var_4_12)
	end

	local var_4_13 = CCSprite:create("res/ui/common/text/battle/text_result_shunshibingli.png")

	var_4_13:setPosition(ccp(var_4_1:getContentSize().width * 0.7, var_4_1:getContentSize().height * 0.55))
	var_4_1:addChild(var_4_13)

	local var_4_14 = CCLabelAtlas:create(tostring(arg_4_2.loseNum), "res/ui/common/number/sunshiNum.png", 19, 20, 48)

	var_4_14:setPosition(ccp(var_4_13:getContentSize().width + 10, 0))
	var_4_13:addChild(var_4_14)

	local var_4_15 = CCSprite:create("res/ui/common/text/battle/text_result_jingli.png")

	var_4_15:setAnchorPoint(ccp(0, 0.5))
	var_4_15:setPosition(var_4_3)
	var_4_1:addChild(var_4_15)

	local var_4_16 = 0
	local var_4_17 = var_4_15:getContentSize().height * 0.5

	for iter_4_0, iter_4_1 in pairs(arg_4_2.res) do
		if iter_4_1 then
			local var_4_18

			if iter_4_1.id == BATTLE_RES_SILVER then
				var_4_18 = "res/ui/common/text/battle/text_result_yingliang.png"
			elseif iter_4_1.id == BATTLE_RES_FOOD then
				var_4_18 = "res/ui/common/text/battle/text_result_liangcao.png"
			elseif iter_4_1.id == BATTLE_RES_EXP then
				var_4_18 = "res/ui/common/text/battle/text_result_jinyan.png"

				if user.player.gemKit then
					var_4_18 = "res/ui/common/text/battle/text_result_jnjy.png"
				end
			elseif iter_4_1.id == BATTLE_RES_FERRUM then
				var_4_18 = "res/ui/common/text/battle/text_result_bingtie.png"
			end

			if var_4_18 then
				local var_4_19 = {}
				local var_4_20 = CCSprite:create(var_4_18)

				table.insert(var_4_19, var_4_20)

				local var_4_21 = CCSprite:createWithSpriteFrameName("symbol_fightresult_add.png")

				table.insert(var_4_19, var_4_21)

				local var_4_22 = CCLabelAtlas:create(tostring(iter_4_1.num), "res/ui/common/number/rewardNum.png", 25, 28, 48)

				var_4_22:setAnchorPoint(ccp(0.5, 0.5))
				table.insert(var_4_19, var_4_22)

				if iter_4_1.id == BATTLE_RES_EXP and iter_4_1.num == 0 then
					if arg_4_0.battleType == battleType.BATTLE_ARMY then
						local var_4_23 = CCStrokeLabelTTF:create(language.get(190600), "Thonburi", 20)

						var_4_23:setColor(ccc3(253, 98, 98))
						table.insert(var_4_19, var_4_23)
					elseif arg_4_0.battleType == battleType.BATTLE_CITY or arg_4_0.battleType == battleType.BATTLE_CITY_ONE2ONE then
						local var_4_24 = CCStrokeLabelTTF:create(language.get(190601), "Thonburi", 20)

						var_4_24:setColor(ccc3(253, 98, 98))
						table.insert(var_4_19, var_4_24)
					end
				end

				local var_4_25 = createRichNode(var_4_19)

				var_4_25:setPosition(ccp(var_4_15:getContentSize().width + 10, var_4_17 - var_4_16 * (var_4_15:getContentSize().height + 10)))
				var_4_15:addChild(var_4_25)

				var_4_16 = var_4_16 + 1
			end
		end
	end

	local var_4_26 = CCSprite:create("res/ui/common/text/battle/fight_result_other_reward.png")

	var_4_26:setAnchorPoint(ccp(0, 0.5))
	var_4_26:setPosition(var_4_4)
	var_4_1:addChild(var_4_26)

	if #arg_4_2.res > 0 then
		local var_4_27 = 0

		for iter_4_2, iter_4_3 in pairs(arg_4_2.res) do
			if iter_4_3 then
				local var_4_28
				local var_4_29 = 1

				if iter_4_3.id == extraReward.silver then
					var_4_28 = "res/ui/common/text/battle/text_result_yingliang.png"
				elseif iter_4_3.id == extraReward.wood then
					var_4_28 = "res/ui/common/text/battle/text_result_liangcao.png"
				elseif iter_4_3.id == extraReward.exp then
					var_4_28 = "res/ui/common/text/battle/text_result_jinyan.png"

					if user.player.gemKit then
						var_4_28 = "res/ui/common/text/battle/text_result_jnjy.png"
					end
				elseif iter_4_3.id == extraReward.ferrum then
					var_4_28 = "res/ui/common/text/battle/text_result_bingtie.png"
				elseif ybMaterialTypes[iter_4_3.id] then
					var_4_29 = 0.6
					var_4_28 = "res/ui/common/text/resource/res_title_" .. ybMaterialTypes[iter_4_3.id] .. ".png"
				end

				if var_4_28 then
					local var_4_30 = CCSprite:create(var_4_28)

					var_4_30:setScale(var_4_29)

					local var_4_31 = CCSprite:createWithSpriteFrameName("symbol_fightresult_add.png")
					local var_4_32 = CCLabelAtlas:create(tostring(iter_4_3.num), "res/ui/common/number/rewardNum.png", 25, 28, 48)

					var_4_32:setAnchorPoint(ccp(0.5, 0.5))

					local var_4_33 = createRichNode({
						var_4_30,
						var_4_31,
						var_4_32
					}, 0, nil, true)

					var_4_33:setPosition(ccp(var_4_26:getContentSize().width + 10, 0 - var_4_27 * var_4_26:getContentSize().height + var_4_26:getContentSize().height * 0.5))
					var_4_26:addChild(var_4_33)

					var_4_27 = var_4_27 + 1
				end
			end
		end
	end

	if arg_4_2.cityName and arg_4_2.cityFightHelpe then
		local var_4_34 = CCSprite:create("res/ui/common/text/battle/fight_result_get_city.png")
		local var_4_35 = CCStrokeLabelTTF:create(arg_4_2.cityName, "Thonburi", 25)

		var_4_35:setColor(ccc3(203, 186, 134))

		local var_4_36

		if arg_4_2.cityFightHelpe == 25 then
			var_4_36 = language.get(190001)
		elseif arg_4_2.cityFightHelpe == 26 then
			var_4_36 = language.get(190002)
		elseif arg_4_2.cityFightHelpe == 27 then
			var_4_36 = language.get(190003)
		end

		local var_4_37 = CCStrokeLabelTTF:create(string.format("    %s+%s", var_4_36, arg_4_2.cityFightHelpeNum), "Thonburi", 25)

		var_4_37:setColor(ccc3(203, 186, 134))

		local var_4_38 = createRichNode({
			var_4_34,
			var_4_35,
			var_4_37
		}, 0)

		var_4_38:setPosition(ccp(var_4_1:getContentSize().width * 0.3, var_4_1:getContentSize().height * 0.27))
		var_4_1:addChild(var_4_38)
	end

	if arg_4_2.hasBiwujifen then
		local var_4_39 = CCSprite:create("res/ui/common/text/battle/fight_result_hdbwjf.png")
		local var_4_40 = CCSprite:createWithSpriteFrameName("symbol_fightresult_add.png")
		local var_4_41 = CCLabelAtlas:create(tostring(arg_4_2.biwujifenNum), "res/ui/common/number/rewardNum.png", 25, 28, 48)

		var_4_41:setAnchorPoint(ccp(0.5, 0.5))

		local var_4_42 = createRichNode({
			var_4_39,
			var_4_40,
			var_4_41
		}, 0)

		var_4_42:setPosition(ccp(var_4_1:getContentSize().width * 0.3, var_4_1:getContentSize().height * 0.27))
		var_4_1:addChild(var_4_42)
	end

	if arg_4_2.hasOfficer then
		local var_4_43 = CCSprite:create("res/ui/common/text/battle/fight_result_hdgz.png")
		local var_4_44 = CCSprite:create(string.format("res/ui/empire/officer_name/%s.png", arg_4_2.officerName))
		local var_4_45 = createRichNode({
			var_4_43,
			var_4_44
		}, 0)

		var_4_45:setPosition(ccp(var_4_1:getContentSize().width * 0.3, var_4_1:getContentSize().height * 0.27))
		var_4_1:addChild(var_4_45)
	end

	if #arg_4_2.dropItem > 0 then
		local var_4_46 = var_4_1:getContentSize().height * 0.22

		for iter_4_4, iter_4_5 in pairs(arg_4_2.dropItem) do
			local var_4_47 = string.format("%s + %d", iter_4_5.text, iter_4_5.num)
			local var_4_48 = CCLabelTTF:create(var_4_47, "Thonburi-Bold", 20)

			var_4_48:setPosition(ccp(var_4_1:getContentSize().width * 0.3 + 130, var_4_46))
			var_4_48:setColor(ccc3(238, 168, 17))
			var_4_48:setAnchorPoint(ccp(0, 0.5))
			var_4_1:addChild(var_4_48)

			var_4_46 = var_4_46 + 30
		end
	end

	if #arg_4_2.building > 0 then
		local var_4_49 = 398

		for iter_4_6, iter_4_7 in pairs(arg_4_2.building) do
			local var_4_50 = CCLabelTTF:create(iter_4_7, "Thonburi-Bold", 20)

			var_4_50:setPosition(ccp(var_4_49, var_4_1:getContentSize().height * 0.22))
			var_4_50:setColor(ccc3(238, 168, 17))
			var_4_50:setAnchorPoint(ccp(0, 0.5))
			var_4_1:addChild(var_4_50)

			var_4_49 = var_4_49 + var_4_50:getContentSize().width + 17
		end
	end

	if arg_4_0.battleType == battleType.BATTLE_LTZB then
		local var_4_51 = CCSprite:createWithSpriteFrameName("btn3_gre_a.png")
		local var_4_52 = CCSprite:createWithSpriteFrameName("btn3_gre_c.png")
		local var_4_53 = CCMenu:create()
		local var_4_54 = CCMenuItemSprite:create(var_4_51, var_4_52)

		var_4_54:registerScriptTapHandler(function()
			smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_LTZB, {
				terrain = 0,
				generalId = 0,
				prepare = true,
				target = arg_4_0.targetId
			})
		end)
		var_4_53:setPosition(451, 30)

		local var_4_55 = CCStrokeLabelTTF:create(language.get(10001), "Thonburi", 22)

		var_4_55:setPosition(70, 29)
		var_4_54:addChild(var_4_55)
		var_4_53:addChild(var_4_54)
		var_4_1:addChild(var_4_53)
	end
end

function createBattleResultPanle(arg_6_0, arg_6_1)
	local var_6_0 = createBaseLayer()

	if arg_6_0.battleType == battleType.BATTLE_KFGZ or arg_6_0.battleType == battleType.BATTLE_KFGZ_SOLO or arg_6_0.battleType == battleType.BATTLE_KFYZ_DONGYING_SOLO or arg_6_0.battleType == battleType.BATTLE_KFYZ_JIAOZHEN then
		arg_6_1.finishedPercent = -1
	end

	local function var_6_1(arg_7_0, arg_7_1, arg_7_2)
		if arg_6_0.battleType == battleType.BATTLE_LTZB then
			-- block empty
		else
			arg_6_0.isBattleStart = false

			local var_7_0 = stringSplit(arg_6_0.battleId, "_")

			if arg_6_1.fightResult == 1 and tonumber(arg_6_0.fightTitle) == 1201301 and #var_7_0 >= 3 and tonumber(var_7_0[1]) == 12 and tonumber(var_7_0[3]) == 133 then
				smgr.changeScene(SCENE_MAIN_CITY)

				user.haveWorldFuBen = 0

				notice.control.refreshLayer()
			else
				arg_6_0.returnToLastScene()
			end
		end
	end

	var_6_0:setTouchEnabled(true)
	var_6_0:registerScriptTouchHandler(var_6_1)

	local function var_6_2(arg_8_0)
		local var_8_0 = arg_8_0.action.data.colosseum

		if var_8_0 and (var_8_0.formChange ~= true or true) and var_8_0.batId then
			smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_LTZB, {
				terrain = 0,
				generalId = 0,
				prepare = true,
				target = arg_6_0.targetId
			})
		end
	end

	function var_6_0.onEnter(arg_9_0)
		rmgr.loadResource("res/ui/battle/fightResult/fightResult.plist")
		var_0_3(arg_6_0, arg_9_0, arg_6_1)

		if arg_6_1.fightResult == 1 then
			amgr.playMusic(enumAudioFile.battle_result_win, false)
		elseif arg_6_1.fightResult == 2 then
			amgr.playMusic(enumAudioFile.battle_result_lose, false)
		end

		if arg_6_0.battleType == battleType.BATTLE_LTZB then
			cmgr.registerResponseHandler(actions.pushColosseum, var_6_2)
		end
	end

	function var_6_0.onExit(arg_10_0)
		if arg_6_0.battleType == battleType.BATTLE_LTZB then
			cmgr.unregisterResponseHandler(actions.pushColosseum, var_6_2)
		end
	end

	arg_6_0.layerTabel.uiLayer:addChild(var_6_0)
end
