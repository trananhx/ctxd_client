require("lua/game/battle/widget/generalSelector")

function showJoinGoldOrderPanel(arg_1_0, arg_1_1, arg_1_2)
	rmgr.loadResource("res/ui/battle/tujing/tujing.plist")
	rmgr.loadResource("res/ui/battle/gyl/gyl.plist")

	local var_1_0 = smgr.getLayer("topLayer")

	var_1_0:removeAllChildrenWithCleanup(true)

	local var_1_1 = createBaseLayer()
	local var_1_2
	local var_1_3 = {}
	local var_1_4 = 0
	local var_1_5 = ""

	var_1_3.generalList = {}

	function var_1_3.getTip(arg_2_0)
		local var_2_0 = ""

		if arg_2_0.state < 2 then
			-- block empty
		elseif arg_2_0.state == 2 then
			var_2_0 = language.get(190026)
		elseif arg_2_0.state == 3 then
			var_2_0 = language.get(190027)
		elseif arg_2_0.state == 6 then
			var_2_0 = language.get(190028)
		elseif arg_2_0.state == 7 then
			var_2_0 = language.get(190029)
		elseif arg_2_0.state == 22 then
			var_2_0 = language.get(190030)
		else
			var_2_0 = language.get(190031)
		end

		return var_2_0
	end

	function var_1_3.handleTokenInfo(arg_3_0)
		local var_3_0 = arg_3_0.data or arg_3_0.action.data
		local var_3_1
		local var_3_2
		local var_3_3
		local var_3_4
		local var_3_5
		local var_3_6
		local var_3_7 = {}
		local var_3_8 = 145
		local var_3_9 = 210

		if arg_1_0 then
			if smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
				if user.jpsIndex > 0 then
					var_3_1 = worldDongyingConstant.BUILDING_INFO["world_building_" .. var_3_0.officeToken.cityId].name
				else
					var_3_1 = worldConstant.BUILDING_INFO["world_building_" .. var_3_0.officeToken.cityId].name
				end
			else
				local var_3_10

				if conf.language ~= "xm" then
					var_3_10 = require("res/native/kfworld/config/" .. user.kfworldId .. "/city")
				else
					var_3_10 = require("lua/layer/kfworld/config/" .. user.kfworldId .. "/city")
				end

				var_3_1 = var_3_10.cities[var_3_0.officeToken.cityId].name
			end

			var_3_3 = var_3_0.officeToken.officerName
			var_3_4 = var_3_0.officeToken.playerName
			var_3_5 = var_3_0.officeToken.nation
			var_3_6 = var_3_0.officeToken.cd
			var_1_3.foodReward = var_3_0.officeToken.foodAdd
			var_1_3.cityId = var_3_0.officeToken.cityId
		elseif arg_1_1 and arg_1_1 == "zhiyuanling" then
			var_3_1 = var_3_0.cityName

			local var_3_11 = var_3_0.cityId

			var_3_6 = var_3_0.leftTime
			var_3_7 = var_3_0.generalInfo
		elseif user.isYw and smgr.currentSceneTag == SCENE_JUBEN then
			var_3_1 = var_3_0.cityName

			local var_3_12 = var_3_0.cityId

			var_3_3 = var_3_0.officerName
			var_3_4 = var_3_0.playerName
			var_3_5 = var_3_0.forceId
			var_3_6 = var_3_0.time
			var_1_3.foodReward = var_3_0.foodReward
			var_1_3.battleId = var_3_0.battleId
			var_1_3.cityId = var_3_0.cityId
			var_3_7 = var_3_0.generalInfo
		else
			local var_3_13 = var_3_0.goldOrderList[1]

			var_3_1 = var_3_13.cityName
			var_3_3 = var_3_13.officerName
			var_3_4 = var_3_13.playerName
			var_3_5 = var_3_13.forceId
			var_3_6 = var_3_13.time
			var_1_3.foodReward = var_3_0.foodReward
			var_1_3.battleId = var_3_13.battleId
			var_1_3.cityId = var_3_13.cityId
		end

		var_1_3.initPanel()

		local var_3_14 = CCStrokeLabelTTF:create(user.forceIdToName[var_3_5], "Thonburi", 35)

		var_3_14:setColor(colorForce[var_3_5])

		local var_3_15 = CCStrokeLabelTTF:create(string.format("[%s]", var_3_3), "Thonburi", 27)

		var_3_15:setColor(ccc3(227, 202, 156))

		local var_3_16 = CCStrokeLabelTTF:create(var_3_4, "Thonburi", 27)

		var_3_16:setColor(ccc3(227, 202, 156))

		local var_3_17 = CCSprite:create("res/ui/common/text/battle/text_tit_zzl.png")
		local var_3_18 = createRichNode({
			var_3_14,
			var_3_15,
			var_3_16,
			var_3_17
		}, 0.5, "bottom")

		if arg_1_1 and arg_1_1 == "zhiyuanling" then
			local var_3_19 = CCSprite:create("res/ui/nationTask/attdefzhiyuanling/gsrw_title_zymy.png")
			local var_3_20 = CCStrokeLabelTTF:create("", "Thonburi", 35)

			if user.noticeList.leagueForce then
				var_3_20:setString(user.forceIdToName[user.noticeList.leagueForce])
				var_3_20:setColor(colorForce[user.noticeList.leagueForce])
			end

			local var_3_21 = CCSprite:create("res/ui/nationTask/attdefzhiyuanling/gsrw_title_g.png")

			var_3_18 = createRichNode({
				var_3_19,
				var_3_20,
				var_3_21
			}, 0.5, "bottom")
		end

		local var_3_22 = CCStrokeLabelTTF:create(language.get(190032), "Thonburi", 27)

		var_3_22:setColor(ccc3(227, 202, 156))

		local var_3_23 = CCStrokeLabelTTF:create(var_3_1, "Thonburi", 27)

		var_3_23:setColor(ccc3(136, 212, 66))

		local var_3_24 = createRichNode({
			var_3_22,
			var_3_23
		})

		var_3_24:setPosition(ccp(147, 330))

		var_1_5 = var_3_1

		local var_3_25 = createTimerLabel(var_3_6, "@M:@S", "Thonburi", 27, nil, nil, nil, ccc3(214, 88, 54))

		if conf.language == "vie" then
			var_3_25:setPosition(ccp(450, 303))
		else
			var_3_25:setPosition(ccp(450, 330))
		end

		if var_1_3.foodReward == nil then
			var_1_3.foodReward = 0
		end

		local var_3_26 = CCStrokeLabelTTF:create(language.get(190033), "Thonburi", 27)

		var_3_26:setColor(ccc3(227, 202, 156))

		local var_3_27 = CCSprite:createWithSpriteFrameName("icon_forage.png")
		local var_3_28 = CCStrokeLabelTTF:create(tostring(var_1_3.foodReward), "Thonburi", 22)

		var_3_28:setColor(ccc3(239, 167, 95))

		local var_3_29 = CCStrokeLabelTTF:create(language.get(200209, var_1_3.foodReward), "Thonburi", 22)

		var_3_29:setColor(ccc3(172, 166, 159))

		local var_3_30 = createRichNode({
			var_3_26,
			var_3_27,
			var_3_28,
			var_3_29
		}, 0.5)

		if var_1_2 then
			var_3_18:setPosition(ccp(var_1_2:getContentSize().width * 0.5, var_1_2:getContentSize().height - 20))
			var_1_2:addChild(var_3_18)
			var_1_2:addChild(var_3_24)
			var_1_2:addChild(var_3_25)

			if var_3_30 then
				var_3_30:setPosition(ccp(var_1_2:getContentSize().width * 0.5, 120))
				var_1_2:addChild(var_3_30)
			end
		end

		if arg_1_0 then
			local var_3_31 = var_3_0.gIds

			if arg_1_2 then
				for iter_3_0, iter_3_1 in pairs(var_3_31) do
					for iter_3_2, iter_3_3 in pairs(arg_1_2) do
						if iter_3_1 == iter_3_2 then
							local var_3_32 = {
								generalId = iter_3_3.id,
								pic = iter_3_3.pic or iter_3_3.generalPic,
								state = iter_3_3.state
							}

							table.insert(var_3_7, var_3_32)
						end
					end
				end
			end
		elseif arg_1_1 and arg_1_1 == "zhiyuanling" then
			-- block empty
		else
			var_3_7 = var_3_0.generalInfo
		end

		if #var_3_7 >= 5 then
			var_3_8 = 85
		end

		for iter_3_4, iter_3_5 in pairs(var_3_7) do
			local var_3_33 = var_1_3.getTip(iter_3_5)
			local var_3_34 = ccp(var_3_8 + 115 * (iter_3_4 - 1), var_3_9)
			local var_3_35 = createGeneralSelector(var_1_2, var_3_34, iter_3_5.generalId, iter_3_5.pic or iter_3_5.generalPic, iter_3_5.state, var_3_33)

			table.insert(var_1_3.generalList, var_3_35)
		end
	end

	function var_1_3.getTokenInfo()
		if arg_1_0 then
			kfcmgr.sendRequest(var_1_3.handleTokenInfo, actions.kfgzOrderTokenInfo, arg_1_1.cityId)
		elseif arg_1_1 and arg_1_1 == "zhiyuanling" then
			cmgr.sendRequest(var_1_3.handleTokenInfo, actions.getAttDefToken)
		elseif user.isYw and smgr.currentSceneTag == SCENE_JUBEN then
			var_1_3.handleTokenInfo(arg_1_1)
		else
			cmgr.sendRequest(var_1_3.handleTokenInfo, actions.getGoldOrderInfo)
		end
	end

	function var_1_3.close()
		var_1_0:removeChild(var_1_1, true)
	end

	function var_1_3.joinOfficerToken(arg_6_0)
		var_1_3.close()

		if var_1_3.foodReward and var_1_3.foodReward > 0 then
			local var_6_0 = {
				{}
			}

			var_6_0[1].id = 3
			var_6_0[1].value = var_1_3.foodReward * var_1_4

			globalAction_gotResource(var_6_0)
		end

		local var_6_1 = language.get(190035, var_1_5)

		smgr.showProgramText(var_6_1, colorText[10003], ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 50))

		var_1_4 = 0

		if arg_1_0 then
			log.info("@@ 征召令 event ", var_1_3.cityId)
			eventManager.dispatchEvent("KfgzJoinOrderToken", var_1_3.cityId)
		elseif user.isYw then
			eventManager.dispatchEvent("YwJoinOrderToken", var_1_3.cityId)
		elseif var_1_3.cityId and var_1_3.battleId then
			smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_CITY_NPC, {
				battleId = var_1_3.battleId,
				cityId = var_1_3.cityId
			})
		end
	end

	function var_1_3.joinzhiyuanToken(arg_7_0)
		var_1_3.close()

		local var_7_0 = language.get(190035, var_1_5)

		smgr.showProgramText(var_7_0, colorText[10003], ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 50))

		var_1_4 = 0
		user.noticeList.attTokenNum = 0

		eventManager.dispatchEvent("JoinzhiyuanToken")
	end

	function var_1_3.ok()
		local var_8_0 = ""

		var_1_4 = 0

		for iter_8_0, iter_8_1 in pairs(var_1_3.generalList) do
			if iter_8_1:getChecked() then
				if arg_1_1 and arg_1_1 == "zhiyuanling" then
					var_8_0 = var_8_0 .. tostring(iter_8_1:getGenrealId()) .. ","
				else
					var_8_0 = var_8_0 .. tostring(iter_8_1:getGenrealId()) .. "#"
				end

				var_1_4 = var_1_4 + 1
			end
		end

		if string.len(var_8_0) > 0 then
			if arg_1_0 then
				log.info("@@ 加入征召 ", var_1_3.cityId)
				kfcmgr.sendRequest(var_1_3.joinOfficerToken, actions.kfgzOrderTokenDoRush, var_8_0, var_1_3.cityId)
			elseif arg_1_1 and arg_1_1 == "zhiyuanling" then
				cmgr.sendRequest(var_1_3.joinzhiyuanToken, actions.replyAttDefToken, var_8_0)
			else
				cmgr.sendRequest(var_1_3.joinOfficerToken, actions.replyGoldOrder, var_8_0, var_1_3.cityId, var_1_3.battleId)
			end
		else
			var_1_3.close()
		end
	end

	function var_1_3.initPanel()
		var_1_2 = CCSprite:createWithSpriteFrameName("gyl_view_bg.png")

		var_1_2:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 25))
		var_1_1:addChild(var_1_2)

		local var_9_0 = CCMenu:create()

		var_9_0:setPosition(ccp(0, 0))
		var_1_2:addChild(var_9_0)

		local var_9_1 = CCSprite:createWithSpriteFrameName("btn_default_lighted.png")
		local var_9_2 = CCSprite:createWithSpriteFrameName("btn_default_normal.png")
		local var_9_3 = CCStrokeLabelTTF:create(language.get(190036), "Thonburi", 20, 2, colorText[10005])

		var_9_3:setColor(colorText[10004])
		var_9_3:setPosition(ccp(var_9_1:getContentSize().width * 0.5, var_9_1:getContentSize().height * 0.5))

		local var_9_4 = CCMenuItemSprite:create(var_9_1, var_9_2)

		var_9_4:addChild(var_9_3)
		var_9_4:registerScriptTapHandler(var_1_3.ok)
		var_9_4:setPosition(ccp(170, 55))
		var_9_0:addChild(var_9_4)

		local var_9_5 = CCSprite:createWithSpriteFrameName("btn3_yel_a.png")
		local var_9_6 = CCSprite:createWithSpriteFrameName("btn3_yel_c.png")
		local var_9_7 = CCStrokeLabelTTF:create(language.get(190037), "Thonburi", 20, 2, colorText[10005])

		var_9_7:setColor(colorText[10004])
		var_9_7:setPosition(ccp(var_9_1:getContentSize().width * 0.5, var_9_1:getContentSize().height * 0.5))

		local var_9_8 = CCMenuItemSprite:create(var_9_5, var_9_6)

		var_9_8:addChild(var_9_7)
		var_9_8:registerScriptTapHandler(var_1_3.close)
		var_9_8:setPosition(ccp(455, 55))
		var_9_0:addChild(var_9_8)
		var_1_1:setTouchEnabled(true)
	end

	local function var_1_6(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == CCTOUCHBEGAN then
			for iter_10_0, iter_10_1 in pairs(var_1_3.generalList) do
				if iter_10_1:ifClick(arg_10_1, arg_10_2) then
					break
				end
			end
		end

		return true
	end

	var_1_3.getTokenInfo()
	var_1_1:registerScriptTouchHandler(var_1_6, false, true)
	var_1_0:addChild(var_1_1)
end
