require("lua/component/CCStrokeLabelTTF")

function createPlayerInfoPanel(arg_1_0, arg_1_1)
	rmgr.loadResource("res/ui/battle/fightInfo/fightInfo.plist")
	rmgr.loadResource("res/ui/battle/buff/buff.plist")

	local var_1_0 = {}

	if conf.language == "vie" then
		var_1_0.rightGeneralNameX = 40
	else
		var_1_0.rightGeneralNameX = 0
	end

	local var_1_1 = arg_1_0.side
	local var_1_2 = arg_1_0.zbAllTimes and arg_1_0.zbAllTimes > 0
	local var_1_3
	local var_1_4
	local var_1_5
	local var_1_6
	local var_1_7
	local var_1_8 = false
	local var_1_9 = CCSprite:createWithSpriteFrameName("fight_info_background.png")
	local var_1_10 = CCSprite:createWithSpriteFrameName("fight_info_head.png")
	local var_1_11 = CCSprite:createWithSpriteFrameName("fight_info_hpbackground.png")
	local var_1_12 = CCSprite:createWithSpriteFrameName("dszb_fight_role_mask.png")
	local var_1_13
	local var_1_14
	local var_1_15
	local var_1_16
	local var_1_17 = CCSprite:create(string.format("res/ui/common/fightPic/fightPic_%s.png", arg_1_0.pic))

	var_1_17:setPosition(ccp(var_1_10:getContentSize().width * 0.5, var_1_10:getContentSize().height * 0.5))
	var_1_10:addChild(var_1_17)

	if var_1_2 then
		var_1_12:setPosition(ccp(var_1_10:getContentSize().width * 0.5, var_1_10:getContentSize().height * 0.5 - 5))
		var_1_10:addChild(var_1_12)
	end

	local var_1_18 = CCNode:create()
	local var_1_19 = CCStrokeLabelTTF:create(arg_1_0.playerName, "Thonburi", 18)

	var_1_19:setColor(ccc3(0, 255, 0))

	local var_1_20 = CCStrokeLabelTTF:create(string.format("%s    Lv. %s", arg_1_0.generalname, arg_1_0.lv), "Thonburi", 18)

	if arg_1_0.killNum and arg_1_0.killNum > 0 then
		local var_1_21 = CCLabelAtlas:create(tostring(arg_1_0.killNum), "res/ui/common/number/shaNum.png", 38.2, 47, 48)

		var_1_21:setAnchorPoint(ccp(0.5, 0.5))

		local var_1_22 = CCSprite:create("res/ui/common/text/battle/text_fight_info_sha.png")
		local var_1_23 = createRichNode({
			var_1_21,
			var_1_22
		}, 0.5)

		if var_1_1 == "att" then
			var_1_23:setPosition(ccp(var_1_9:getContentSize().width * 0.5, -24))
		else
			var_1_23:setPosition(ccp(var_1_9:getContentSize().width * 0.5, 120))
		end

		var_1_9:addChild(var_1_23)
	end

	if var_1_1 == "att" then
		var_1_3 = ccp(var_1_9:getContentSize().width * 0.5 + 30, visibleSize.height - 10 - var_1_9:getContentSize().height * 0.5)
		var_1_4 = ccp(var_1_10:getContentSize().width * 0.5, var_1_10:getContentSize().height * 0.5)
		var_1_6 = ccp(var_1_10:getContentSize().width + 10 + var_1_19:getContentSize().width * 0.5, var_1_9:getContentSize().height - 10)
		var_1_7 = ccp(var_1_10:getContentSize().width + 10 + var_1_20:getContentSize().width * 0.5, var_1_6.y - 20)
		var_1_5 = ccp(var_1_9:getContentSize().width * 0.5 + 10, var_1_9:getContentSize().height * 0.5)
		var_1_13 = CCSprite:createWithSpriteFrameName("fight_info_att_hp.png")

		var_1_13:setAnchorPoint(ccp(0, 0))

		var_1_14 = CCSprite:create("res/ui/common/text/battle/fight_info_att.png")
		var_1_15 = ccp(0, var_1_9:getContentSize().height * 0.5 - 25)
	else
		var_1_3 = ccp(visibleSize.width - var_1_9:getContentSize().width * 0.5 - 30, 10 + var_1_9:getContentSize().height * 0.5)
		var_1_8 = true
		var_1_4 = ccp(var_1_9:getContentSize().width - var_1_10:getContentSize().width * 0.5, var_1_10:getContentSize().height * 0.5)
		var_1_6 = ccp(var_1_9:getContentSize().width - 10 - var_1_10:getContentSize().width - var_1_19:getContentSize().width * 0.5, var_1_9:getContentSize().height - 10)
		var_1_7 = ccp(var_1_9:getContentSize().width - 10 - var_1_10:getContentSize().width - var_1_20:getContentSize().width * 0.5 + var_1_0.rightGeneralNameX, var_1_6.y - 20)
		var_1_5 = ccp(var_1_9:getContentSize().width * 0.5 - 10, var_1_9:getContentSize().height * 0.5)
		var_1_13 = CCSprite:createWithSpriteFrameName("fight_info_def_hp.png")

		var_1_13:setAnchorPoint(ccp(1, 0))
		var_1_13:setPosition(ccp(var_1_13:getContentSize().width, 0))

		var_1_14 = CCSprite:create("res/ui/common/text/battle/fight_info_def.png")
		var_1_15 = ccp(var_1_9:getContentSize().width, var_1_9:getContentSize().height * 0.5 - 25)
	end

	if var_1_2 then
		function showTreasureTip()
			local var_2_0 = smgr.getLayer("topLayer")
			local var_2_1 = require("lua/component/TipPanel")

			var_2_1:create(var_2_0, {
				language.get(215923),
				language.get(215924, arg_1_0.zbAllTimes)
			})

			if var_1_1 == "att" then
				var_2_1:setPosition(ccp(685, visibleSize.height - 80))
			else
				var_2_1:setPosition(ccp(visibleSize.width - 105, 170))
			end
		end

		if var_1_1 == "att" then
			var_1_16 = CCSprite:createWithSpriteFrameName("dszb_fight_role_bar_bg.png")

			var_1_16:setPosition(ccp(var_1_5.x, var_1_5.y - 15))

			local var_1_24 = 0

			if arg_1_0.zbAllTimes and arg_1_0.zbTimes then
				var_1_24 = arg_1_0.zbTimes / arg_1_0.zbAllTimes * 100
			end

			local var_1_25 = var_1_24 >= 100 and "dszb_fight_role_bar_02.png" or "dszb_fight_role_bar_01.png"
			local var_1_26 = CCSprite:createWithSpriteFrameName(var_1_25)
			local var_1_27 = CCProgressTimer:create(var_1_26)

			var_1_27:setType(kCCProgressTimerTypeBar)
			var_1_27:setMidpoint(CCPointMake(0, 0.5))
			var_1_27:setAnchorPoint(ccp(0.5, 0.5))
			var_1_27:setBarChangeRate(ccp(1, 0))
			var_1_27:setPosition(CCPointMake(var_1_16:getContentSize().width * 0.5, var_1_16:getContentSize().height * 0.5))
			var_1_16:addChild(var_1_27)
			var_1_27:setPercentage(var_1_24)
		else
			var_1_16 = CCSprite:createWithSpriteFrameName("dszb_fight_role_bar_bg.png")

			var_1_16:setPosition(ccp(var_1_5.x, var_1_5.y - 15))

			local var_1_28 = 0

			if arg_1_0.zbAllTimes and arg_1_0.zbTimes then
				var_1_28 = arg_1_0.zbTimes / arg_1_0.zbAllTimes * 100
			end

			local var_1_29 = var_1_28 >= 100 and "dszb_fight_role_bar_02.png" or "dszb_fight_role_bar_01.png"
			local var_1_30 = CCSprite:createWithSpriteFrameName(var_1_29)
			local var_1_31 = CCProgressTimer:create(var_1_30)

			var_1_31:setType(kCCProgressTimerTypeBar)
			var_1_31:setMidpoint(CCPointMake(1, 0.5))
			var_1_31:setAnchorPoint(ccp(0.5, 0.5))
			var_1_31:setBarChangeRate(ccp(1, 0))
			var_1_31:setPosition(CCPointMake(var_1_16:getContentSize().width * 0.5, var_1_16:getContentSize().height * 0.5))
			var_1_16:addChild(var_1_31)
			var_1_31:setPercentage(var_1_28)
		end

		var_1_9:addChild(var_1_16)

		local function var_1_32(arg_3_0, arg_3_1, arg_3_2)
			if arg_3_0 == CCTOUCHBEGAN and checkIfTouch(var_1_16, arg_3_1, arg_3_2) then
				log.info("@@ 显示十珍效果")
				showTreasureTip()
			end
		end

		var_1_16:registerScriptTouchHandler(var_1_32)
		var_1_16:setTouchEnabled(true)
	end

	var_1_9:setPosition(var_1_3)

	if var_1_8 then
		var_1_9:setFlipX(true)
	end

	if var_1_13 then
		local var_1_33 = arg_1_0.hp / arg_1_0.maxHp

		if var_1_33 < 0 then
			var_1_33 = 0
		end

		if var_1_33 > 1 then
			var_1_33 = 1
		end

		var_1_13:setScaleX(var_1_33)
	end

	var_1_10:setPosition(var_1_4)
	var_1_11:setPosition(var_1_5)
	var_1_11:addChild(var_1_13)
	var_1_9:addChild(var_1_11)
	var_1_19:setPosition(var_1_6)
	var_1_20:setPosition(var_1_7)
	var_1_9:addChild(var_1_19)
	var_1_9:addChild(var_1_20)
	var_1_9:addChild(var_1_10)

	if conf.language == "tha" then
		var_1_14:setScale(0.8)
	end

	var_1_14:setPosition(var_1_15)
	var_1_9:addChild(var_1_14)

	if arg_1_0.specialNpc then
		local var_1_34 = CCSprite:create("res/ui/world/specialNpc/sjsw_guard_" .. arg_1_0.specialNpc .. ".png")

		var_1_9:addChild(var_1_34)

		local var_1_35 = var_1_9:getContentSize()
		local var_1_36 = var_1_8 and -1 or 1
		local var_1_37 = var_1_35.width * 0.5 + var_1_36 * (25 + var_1_11:getContentSize().width * 0.5)
		local var_1_38 = var_1_35.height * 0.5

		var_1_34:setPosition(ccp(var_1_37, var_1_38))
	end

	if arg_1_0.force and arg_1_0.force ~= 0 then
		local var_1_39 = CCSprite:createWithSpriteFrameName("fight_info_guojiadi.png")
		local var_1_40

		if arg_1_1.battleType == battleType.BATTLE_KFGZ or arg_1_1.battleType == battleType.BATTLE_KFGZ_SOLO or arg_1_1.battleType == battleType.BATTLE_KFYZ_DONGYING_SOLO then
			if arg_1_1.isYz then
				if arg_1_0.force == 1 or arg_1_0.force == 2 or arg_1_0.force == 3 then
					if user.jpsIndex ~= 0 and arg_1_0.force == 1 then
						local var_1_41

						if user.isKfdy then
							var_1_41 = "222416_dongying"
						elseif user.isKfgl then
							var_1_41 = 136566
						end

						var_1_40 = CCLabelTTF:create(language.get(var_1_41), "", 26)

						var_1_40:setColor(colorForce[101])
					else
						var_1_40 = CCLabelTTF:create(user.forceIdToName_kfyz[arg_1_0.force], "", 26)

						var_1_40:setColor(colorForce[arg_1_0.force])
					end
				elseif arg_1_0.force == 4 then
					var_1_40 = CCSprite:create("res/ui/common/text/country/guojia-di.png")
				elseif arg_1_0.force == 1001 or arg_1_0.force == 1002 or arg_1_0.force == 1003 then
					var_1_40 = CCSprite:create("res/ui/common/text/country/guojia-zheng.png")
				else
					var_1_40 = CCSprite:create("res/ui/common/text/country/guojia-di.png")
				end
			elseif smgr.lastSafeScene == SCENE_KFEXPEDITION then
				if arg_1_0.force == 1 or arg_1_0.force == 2 or arg_1_0.force == 3 then
					var_1_40 = CCLabelTTF:create(user.forceIdToName_kfmg[arg_1_0.force], "", 26)

					var_1_40:setColor(colorForce[arg_1_0.force])
				elseif arg_1_0.force == 6002 then
					var_1_40 = CCSprite:create("res/ui/common/text/country/guojia-huang.png")
				else
					var_1_40 = CCSprite:create("res/ui/common/text/country/guojia-di.png")
				end

				if user.isKfyn then
					local var_1_42 = ""
					local var_1_43

					if arg_1_0.force > 1000 then
						local var_1_44 = user.forceIdToName[user.player.forceId]
						local var_1_45 = colorForce[user.player.forceId]

						var_1_40 = CCLabelTTF:create(var_1_44, "", 26)

						var_1_40:setColor(var_1_45)
					else
						var_1_40 = CCSprite:create("res/ui/common/text/country/guojia-zheng.png")
					end
				elseif user.isKflq then
					if arg_1_0.force < 1000 then
						var_1_40 = CCSprite:create("res/ui/kfyz/yzlq_word_liu.png")
					end
				elseif user.isKfnz and arg_1_0.force < 1000 then
					var_1_40 = CCSprite:create("res/ui/kfyz/yznz_word_nan.png")
				end
			elseif arg_1_0.force == 1 then
				var_1_40 = CCSprite:create("res/ui/common/text/country/force_1.png")
			elseif arg_1_0.force == 2 then
				var_1_40 = CCSprite:create("res/ui/common/text/country/force_2.png")
			else
				var_1_40 = CCSprite:create("res/ui/common/text/country/force_3.png")
			end
		elseif arg_1_0.force == 1 or arg_1_0.force == 2 or arg_1_0.force == 3 then
			var_1_40 = CCLabelTTF:create(user.forceIdToName[arg_1_0.force], "", 26)

			var_1_40:setColor(colorForce[arg_1_0.force])
		elseif arg_1_0.force == 106 then
			var_1_40 = CCSprite:create("res/ui/common/text/country/guojia-yuan.png")
		elseif arg_1_0.force == 104 then
			var_1_40 = CCSprite:create("res/ui/common/text/country/guojia-huang.png")
		elseif arg_1_0.force == 1001 or arg_1_0.force == 1002 or arg_1_0.force == 1003 then
			var_1_40 = CCSprite:create("res/ui/common/text/country/guojia-zheng.png")
		else
			var_1_40 = CCSprite:create("res/ui/common/text/country/guojia-man.png")
		end

		var_1_40:setPosition(ccp(var_1_39:getContentSize().width * 0.5, var_1_39:getContentSize().height * 0.5))
		var_1_39:addChild(var_1_40)

		if var_1_1 == "att" then
			var_1_39:setPosition(ccp(0, var_1_9:getContentSize().height - var_1_39:getContentSize().height * 0.5))
		else
			var_1_39:setPosition(ccp(var_1_9:getContentSize().width, var_1_9:getContentSize().height - var_1_39:getContentSize().height * 0.5))
		end

		var_1_9:addChild(var_1_39)
	end

	local var_1_46 = 115
	local var_1_47 = 25
	local var_1_48 = 26

	if var_1_1 == "att" then
		-- block empty
	end

	if arg_1_0.buffs then
		local var_1_49 = 0
		local var_1_50 = 0

		if var_1_2 then
			var_1_49 = 5
			var_1_50 = -10
		end

		for iter_1_0, iter_1_1 in pairs(arg_1_0.buffs) do
			local var_1_51 = iter_1_1.id
			local var_1_52 = string.format("fightBuff_%s.png", var_1_51)
			local var_1_53 = CCSprite:createWithSpriteFrameName(var_1_52)

			if tonumber(var_1_51) >= 62 and tonumber(var_1_51) <= 65 then
				var_1_53 = CCSprite:create("res/ui/farm/tuntian_buff.jpg")
			end

			if tonumber(var_1_51) == 74 then
				var_1_53 = CCSprite:createWithSpriteFrameName("fightBuff_fc3.png")
			end

			if tonumber(iter_1_1.id) >= 81 and tonumber(iter_1_1.id) <= 84 then
				var_1_53 = CCSprite:create("res/ui/offlineBuff/lx_buff_fight_0" .. tonumber(iter_1_1.id) - 80 .. ".png")
			end

			if var_1_53 then
				var_1_53:setPosition(ccp(var_1_46 + var_1_49, var_1_47 + var_1_50))
				var_1_9:addChild(var_1_53)

				var_1_46 = var_1_46 + var_1_48
			end
		end
	end

	local function var_1_54(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == CCTOUCHBEGAN and checkIfTouch(var_1_17, arg_4_1, arg_4_2) then
			log.info("@@ 显示buff")
			require("lua/game/battle/widget/BuffTipPanel"):create(arg_1_0.buffs, var_1_1)
		end
	end

	var_1_17:registerScriptTouchHandler(var_1_54)
	var_1_17:setTouchEnabled(true)

	return var_1_9
end
