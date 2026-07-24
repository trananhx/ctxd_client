require("lua/game/battle/widget/generalSelector")

function showJoinOfficerTokenPanel(arg_1_0, arg_1_1, arg_1_2)
	rmgr.loadResource("res/ui/battle/tujing/tujing.plist")
	rmgr.loadResource("res/ui/battle/gyl/gyl.plist")

	local var_1_0 = smgr.getLayer("topLayer")

	var_1_0:removeAllChildrenWithCleanup(true)

	local var_1_1 = createBaseLayer()
	local var_1_2
	local var_1_3 = {}
	local var_1_4 = {}

	var_1_3.generalList = {}

	local var_1_5 = 0
	local var_1_6 = ""

	function var_1_3.getTip(arg_2_0)
		local var_2_0 = ""

		if arg_2_0.state < 2 then
			-- block empty
		elseif arg_2_0.state == 2 then
			var_2_0 = language.get(190041)
		elseif arg_2_0.state == 3 then
			var_2_0 = language.get(190042)
		elseif arg_2_0.state == 6 then
			var_2_0 = language.get(190043)
		elseif arg_2_0.state == 7 then
			var_2_0 = language.get(190044)
		elseif arg_2_0.state == 22 then
			var_2_0 = language.get(190045)
		else
			var_2_0 = language.get(190046)
		end

		return var_2_0
	end

	function var_1_3.handleTokenInfo(arg_3_0)
		local var_3_0 = arg_3_0.data or arg_3_0.action.data
		local var_3_1 = var_3_0.cityName
		local var_3_2 = var_3_0.officerName
		local var_3_3
		local var_3_4
		local var_3_5

		if arg_1_0 then
			log.info("@@ 加入官员令")

			if smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
				var_3_1 = worldConstant.BUILDING_INFO["world_building_" .. var_3_0.officeToken.cityId].name
			else
				local var_3_6

				if conf.language ~= "xm" then
					var_3_6 = require("res/native/kfworld/config/" .. user.kfworldId .. "/city")
				else
					var_3_6 = require("lua/layer/kfworld/config/" .. user.kfworldId .. "/city")
				end

				var_3_1 = var_3_6.cities[var_3_0.officeToken.cityId].name
			end

			var_3_2 = var_3_0.officeToken.officerName
			var_3_3 = var_3_0.officeToken.nation
			var_3_4 = var_3_0.officeToken.playerName
			var_3_5 = var_3_0.officeToken.cd
			var_1_3.foodAdd = var_3_0.officeToken.foodAdd
			var_1_3.cityId = var_3_0.officeToken.cityId
		else
			var_3_1 = var_3_0.cityName
			var_3_2 = var_3_0.officerName
			var_3_3 = var_3_0.forceId
			var_3_4 = var_3_0.playerName
			var_3_5 = var_3_0.latestTime
			var_1_3.foodAdd = var_3_0.rewards[1].value
			var_1_3.battleId = var_3_0.battleId
			var_1_3.cityId = var_3_0.cityId
			var_1_4 = var_3_0.rewards
		end

		var_1_3.initPanel()

		local var_3_7 = CCStrokeLabelTTF:create(user.forceIdToName[var_3_3], "Thonburi", 35)

		var_3_7:setColor(colorForce[var_3_3])

		local var_3_8 = CCStrokeLabelTTF:create(string.format("[%s]", var_3_2), "Thonburi", 27)

		var_3_8:setColor(ccc3(227, 202, 156))

		local var_3_9 = CCStrokeLabelTTF:create(var_3_4, "Thonburi", 27)

		var_3_9:setColor(ccc3(227, 202, 156))

		local var_3_10 = CCSprite:create("res/ui/common/text/battle/text_tit_gyl.png")
		local var_3_11 = createRichNode({
			var_3_7,
			var_3_8,
			var_3_9,
			var_3_10
		}, 0.5, "bottom")
		local var_3_12 = CCStrokeLabelTTF:create(language.get(190032), "Thonburi", 27)

		var_3_12:setColor(ccc3(227, 202, 156))

		local var_3_13 = CCStrokeLabelTTF:create(var_3_1, "Thonburi", 27)

		var_3_13:setColor(ccc3(136, 212, 66))

		local var_3_14 = createRichNode({
			var_3_12,
			var_3_13
		})

		var_3_14:setPosition(ccp(147, 330))

		var_1_6 = var_3_1

		local var_3_15 = createTimerLabel(var_3_5, "@M:@S", "Thonburi", 27, nil, nil, nil, ccc3(214, 88, 54))

		if conf.language == "vie" then
			var_3_15:setPosition(ccp(450, 303))
		else
			var_3_15:setPosition(ccp(450, 330))
		end

		local var_3_16 = {}
		local var_3_17 = CCStrokeLabelTTF:create(language.get(190033), "Thonburi", 27)

		var_3_17:setColor(ccc3(227, 202, 156))
		table.insert(var_3_16, var_3_17)

		local var_3_18 = CCSprite:createWithSpriteFrameName("icon_forage.png")

		table.insert(var_3_16, var_3_18)

		local var_3_19 = CCStrokeLabelTTF:create(language.get("190210_sy", var_1_3.foodAdd), "Thonburi", 22)

		var_3_19:setColor(ccc3(239, 167, 95))
		table.insert(var_3_16, var_3_19)

		if var_3_0.feat then
			local var_3_20 = CCStrokeLabelTTF:create(language.get("190209_sy"), "Thonburi", 27)

			var_3_20:setColor(ccc3(227, 202, 156))
			table.insert(var_3_16, var_3_20)

			local var_3_21 = CCSprite:createWithSpriteFrameName("res_icon_10001.png")

			table.insert(var_3_16, var_3_21)

			local var_3_22 = CCStrokeLabelTTF:create(language.get("190210_sy", var_3_0.feat), "Thonburi", 22)

			var_3_22:setColor(ccc3(239, 167, 95))
			table.insert(var_3_16, var_3_22)
		end

		local var_3_23 = createRichNode(var_3_16, 0.5)

		if var_1_2 then
			var_3_11:setPosition(ccp(var_1_2:getContentSize().width * 0.5, var_1_2:getContentSize().height - 20))
			var_1_2:addChild(var_3_11)
			var_1_2:addChild(var_3_14)
			var_1_2:addChild(var_3_15)
			var_3_23:setPosition(ccp(var_1_2:getContentSize().width * 0.5, 120))
			var_1_2:addChild(var_3_23)
		end

		local var_3_24 = {}
		local var_3_25 = 145
		local var_3_26 = 210

		if arg_1_0 then
			local var_3_27 = var_3_0.gIds

			if arg_1_2 then
				for iter_3_0, iter_3_1 in pairs(var_3_27) do
					for iter_3_2, iter_3_3 in pairs(arg_1_2) do
						if iter_3_1 == iter_3_2 then
							local var_3_28 = {
								generalId = iter_3_3.id,
								pic = iter_3_3.pic or iter_3_3.generalPic,
								state = iter_3_3.state
							}

							table.insert(var_3_24, var_3_28)
						end
					end
				end
			end
		else
			var_3_24 = var_3_0.generalInfo
		end

		if #var_3_24 >= 5 then
			var_3_25 = 85
		end

		for iter_3_4, iter_3_5 in pairs(var_3_24) do
			local var_3_29 = var_1_3.getTip(iter_3_5)

			log.info("@@ 官员令 武将 ", iter_3_5.state, var_3_29)

			local var_3_30 = ccp(var_3_25 + 115 * (iter_3_4 - 1), var_3_26)
			local var_3_31 = createGeneralSelector(var_1_2, var_3_30, iter_3_5.generalId, iter_3_5.pic or iter_3_5.generalPic, iter_3_5.state, var_3_29)

			table.insert(var_1_3.generalList, var_3_31)
		end
	end

	function var_1_3.getTokenInfo()
		if arg_1_0 then
			kfcmgr.sendRequest(var_1_3.handleTokenInfo, actions.kfgzOfficerTokenInfo, arg_1_1.cityId)
		elseif user.isYw and smgr.currentSceneTag == SCENE_JUBEN then
			var_1_3.handleTokenInfo(arg_1_1)
		else
			cmgr.sendRequest(var_1_3.handleTokenInfo, actions.getCurrentTokenInfo, 1)
		end
	end

	function var_1_3.close()
		var_1_0:removeChild(var_1_1, true)
	end

	function var_1_3.joinOfficerToken(arg_6_0)
		eventManager.dispatchEvent("replyOfficerToken")
		var_1_3.close()

		if var_1_3.foodAdd then
			local var_6_0 = {
				{}
			}

			var_6_0[1].id = 3
			var_6_0[1].value = var_1_3.foodAdd * var_1_5

			globalAction_gotResource(var_6_0)
		end

		local var_6_1 = language.get(190047, var_1_6)

		smgr.showProgramText(var_6_1, colorText[10003], ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 50))

		var_1_5 = 0

		if arg_1_0 then
			log.info("@@ 官员令 event ", var_1_3.cityId)
			eventManager.dispatchEvent("KfgzJoinOfficerToken", var_1_3.cityId)
		elseif user.isYw then
			eventManager.dispatchEvent("YwJoinOfficerToken", var_1_3.cityId)
		elseif var_1_3.cityId and var_1_3.battleId then
			smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_CITY_NPC, {
				battleId = var_1_3.battleId,
				cityId = var_1_3.cityId
			})
		end
	end

	function var_1_3.ok()
		local var_7_0 = ""

		var_1_5 = 0

		for iter_7_0, iter_7_1 in pairs(var_1_3.generalList) do
			if iter_7_1:getChecked() then
				if arg_1_0 then
					var_7_0 = var_7_0 .. tostring(iter_7_1:getGenrealId()) .. "#"
				else
					var_7_0 = var_7_0 .. tostring(iter_7_1:getGenrealId()) .. ","
				end

				var_1_5 = var_1_5 + 1
			end
		end

		if string.len(var_7_0) > 0 then
			if arg_1_0 then
				kfcmgr.sendRequest(var_1_3.joinOfficerToken, actions.kfgzOfficerTokenDoRush, var_7_0, var_1_3.cityId)
			else
				cmgr.sendRequest(var_1_3.joinOfficerToken, actions.joinOfficerToken, var_1_3.battleId, var_1_3.cityId, var_7_0)
			end
		else
			var_1_3.close()
		end
	end

	function var_1_3.initPanel()
		var_1_2 = CCSprite:createWithSpriteFrameName("gyl_view_bg.png")

		var_1_2:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 25))
		var_1_1:addChild(var_1_2)

		local var_8_0 = CCMenu:create()

		var_8_0:setPosition(ccp(0, 0))
		var_1_2:addChild(var_8_0)

		local var_8_1 = CCSprite:createWithSpriteFrameName("btn_default_lighted.png")
		local var_8_2 = CCSprite:createWithSpriteFrameName("btn_default_normal.png")
		local var_8_3 = CCStrokeLabelTTF:create(language.get(190036), "Thonburi", 20, 2, colorText[10005])

		var_8_3:setColor(colorText[10004])
		var_8_3:setPosition(ccp(var_8_1:getContentSize().width * 0.5, var_8_1:getContentSize().height * 0.5))

		local var_8_4 = CCMenuItemSprite:create(var_8_1, var_8_2)

		var_8_4:addChild(var_8_3)
		var_8_4:registerScriptTapHandler(var_1_3.ok)
		var_8_4:setPosition(ccp(170, 55))
		var_8_0:addChild(var_8_4)

		local var_8_5 = CCSprite:createWithSpriteFrameName("btn3_yel_a.png")
		local var_8_6 = CCSprite:createWithSpriteFrameName("btn3_yel_c.png")
		local var_8_7 = CCStrokeLabelTTF:create(language.get(190037), "Thonburi", 20, 2, colorText[10005])

		var_8_7:setColor(colorText[10004])
		var_8_7:setPosition(ccp(var_8_1:getContentSize().width * 0.5, var_8_1:getContentSize().height * 0.5))

		local var_8_8 = CCMenuItemSprite:create(var_8_5, var_8_6)

		var_8_8:addChild(var_8_7)
		var_8_8:registerScriptTapHandler(var_1_3.close)
		var_8_8:setPosition(ccp(455, 55))
		var_8_0:addChild(var_8_8)
		var_1_1:setTouchEnabled(true)
	end

	local function var_1_7(arg_9_0, arg_9_1, arg_9_2)
		log.info(" @@@ onTouch")

		if arg_9_0 == CCTOUCHBEGAN then
			for iter_9_0, iter_9_1 in pairs(var_1_3.generalList) do
				if iter_9_1:ifClick(arg_9_1, arg_9_2) then
					break
				end
			end
		end

		return true
	end

	var_1_1:registerScriptTouchHandler(var_1_7, false, true)
	var_1_3.getTokenInfo()
	var_1_0:addChild(var_1_1)
end
