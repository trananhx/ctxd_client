require("lua/game/battle/widget/generalSelector")

function showJoinTeamPanel(arg_1_0, arg_1_1)
	rmgr.loadResource("res/ui/battle/tujing/tujing.plist")
	rmgr.loadResource("res/ui/battle/jtj/jtj.plist")

	local var_1_0 = smgr.getLayer("topLayer")

	var_1_0:removeAllChildrenWithCleanup(true)

	local var_1_1 = createBaseLayer()
	local var_1_2
	local var_1_3 = {}
	local var_1_4 = 0

	var_1_3.generalList = {}

	function var_1_3.update_teamInfo()
		if var_1_2.table.icon_select == nil then
			var_1_2.table.icon_select = CCSprite:createWithSpriteFrameName("jtj_choo_on.png")

			var_1_2:addChild(var_1_2.table.icon_select)
		end

		local var_2_0, var_2_1 = var_1_2.table["icon_" .. var_1_4 + 1]:getPosition()

		var_1_2.table.icon_select:setPosition(ccp(var_2_0, var_2_1))

		if var_1_2.table.text_node ~= nil then
			var_1_2:removeChild(var_1_2.table.text_node, true)
		end

		local var_2_2 = CCStrokeLabelTTF:create(var_1_3.teamList[var_1_4 + 1].creatorName, "Thonburi", 30)
		local var_2_3

		if conf.language == "vie" then
			var_2_3 = CCStrokeLabelTTF:create(language.get(190051), "Thonburi", 28)
		else
			var_2_3 = CCStrokeLabelTTF:create(language.get(190051), "Thonburi", 30)
		end

		var_2_3:setColor(ccc3(206, 174, 136))

		local var_2_4 = CCSprite:createWithSpriteFrameName("general_numb_slash.png")
		local var_2_5 = CCLabelAtlas:create(tostring(var_1_3.teamList[var_1_4 + 1].generalNum), "res/ui/common/number/jtj_general_num.png", 29, 49, 48)

		var_2_5:setAnchorPoint(ccp(0.5, 0.5))

		local var_2_6 = CCLabelAtlas:create(tostring(var_1_3.teamList[var_1_4 + 1].generalMaxNum), "res/ui/common/number/jtj_general_num.png", 29, 49, 48)

		var_2_6:setAnchorPoint(ccp(0.5, 0.5))

		local var_2_7

		if conf.language == "vie" then
			var_2_4:setScale(0.8)
			var_2_5:setScale(0.8)
			var_2_6:setScale(0.8)

			var_2_7 = createRichNode({
				var_2_5,
				var_2_4,
				var_2_6,
				var_2_3,
				var_2_2
			})
		else
			var_2_7 = createRichNode({
				var_2_2,
				var_2_3,
				var_2_5,
				var_2_4,
				var_2_6
			})
		end

		local var_2_8 = var_2_2:getContentSize().width + var_2_3:getContentSize().width + var_2_4:getContentSize().width + var_2_5:getContentSize().width + var_2_6:getContentSize().width

		var_2_7:setPosition(ccp(300 - var_2_8 / 2, 265))
		var_1_2:addChild(var_2_7)

		var_1_2.table.text_node = var_2_7
	end

	function var_1_3.click_left()
		var_1_4 = var_1_4 - 1

		if var_1_4 < 0 then
			var_1_4 = 0
		end

		var_1_3.update_teamInfo()
	end

	function var_1_3.click_right()
		var_1_4 = var_1_4 + 1

		if var_1_4 > #var_1_3.teamList - 1 then
			var_1_4 = #var_1_3.teamList - 1
		end

		var_1_3.update_teamInfo()
	end

	function var_1_3.showTeamInfo()
		var_1_3.initPanel()

		if var_1_2 then
			local var_5_0 = #var_1_3.teamList
			local var_5_1 = 30
			local var_5_2 = 293.5 - (var_5_0 - 1) * var_5_1 / 2
			local var_5_3 = 297

			var_1_2.table = {}

			for iter_5_0 = 1, var_5_0 do
				local var_5_4 = CCSprite:createWithSpriteFrameName("jtj_choo_oth.png")

				var_5_4:setPosition(ccp(var_5_2 + (iter_5_0 - 1) * var_5_1, var_5_3))
				var_1_2:addChild(var_5_4)

				var_1_2.table["icon_" .. iter_5_0] = var_5_4
			end

			var_1_4 = 0

			var_1_3.update_teamInfo()

			local var_5_5 = CCSprite:createWithSpriteFrameName("jtj_btn_left.png")
			local var_5_6 = CCSprite:createWithSpriteFrameName("jtj_btn_left.png")
			local var_5_7 = CCSprite:createWithSpriteFrameName("jtj_btn_right.png")
			local var_5_8 = CCSprite:createWithSpriteFrameName("jtj_btn_right.png")
			local var_5_9 = CCMenuItemSprite:create(var_5_5, var_5_6)
			local var_5_10 = CCMenuItemSprite:create(var_5_7, var_5_8)

			var_5_9:registerScriptTapHandler(var_1_3.click_left)
			var_5_10:registerScriptTapHandler(var_1_3.click_right)
			var_5_9:setPosition(ccp(60, 265))
			var_5_10:setPosition(ccp(537, 265))

			local var_5_11 = CCMenu:create()

			var_5_11:setPosition(ccp(0, 0))
			var_5_11:addChild(var_5_9)
			var_5_11:addChild(var_5_10)
			var_1_2:addChild(var_5_11)
		end
	end

	function var_1_3.handleGeneralInfo(arg_6_0)
		local var_6_0

		if arg_1_0 then
			local var_6_1 = arg_6_0.data.gIds

			var_1_3.food = arg_6_0.data.foodAdd
			var_6_0 = {}

			if arg_1_1 then
				for iter_6_0, iter_6_1 in pairs(var_6_1) do
					for iter_6_2, iter_6_3 in pairs(arg_1_1) do
						if iter_6_1 == iter_6_2 then
							local var_6_2 = {
								generalId = iter_6_3.id,
								pic = iter_6_3.pic,
								state = iter_6_3.state
							}

							table.insert(var_6_0, var_6_2)
						end
					end
				end
			end
		else
			var_6_0 = arg_6_0.action.data.military
			var_1_3.food = arg_6_0.action.data.food
		end

		var_1_3.showTeamInfo()

		local var_6_3 = 145
		local var_6_4 = 155

		if #var_6_0 >= 5 then
			var_6_3 = 85
		end

		for iter_6_4, iter_6_5 in pairs(var_6_0) do
			local var_6_5 = ccp(var_6_3 + 115 * (iter_6_4 - 1), var_6_4)
			local var_6_6 = createGeneralSelector(var_1_2, var_6_5, iter_6_5.generalId, iter_6_5.pic, iter_6_5.state, iter_6_5.tip)

			table.insert(var_1_3.generalList, var_6_6)
		end
	end

	function var_1_3.handleTeamInfo(arg_7_0)
		local var_7_0 = (arg_7_0.data or arg_7_0.action.data).teamList

		var_1_3.teamList = {}

		for iter_7_0, iter_7_1 in ipairs(var_7_0) do
			if iter_7_1.creatorName ~= user.player.name then
				table.insert(var_1_3.teamList, iter_7_1)
			end
		end

		if table.getn(var_1_3.teamList) > 0 then
			var_1_3.curGeneralNum = var_1_3.teamList[1].generalNum
			var_1_3.maxGeneralNum = var_1_3.teamList[1].generalMaxNum

			local var_7_1 = 1

			if arg_1_0 then
				kfcmgr.sendRequest(var_1_3.handleGeneralInfo, actions.kfgzGroupTeamJoinInfo, var_1_3.teamList[1].teamId)
			else
				cmgr.sendRequest(var_1_3.handleGeneralInfo, actions.getTeamGeneralInfo, var_1_3.teamList[1].teamId)
			end
		end
	end

	function var_1_3.getTeamInfo()
		if arg_1_0 then
			-- block empty
		else
			cmgr.sendRequest(var_1_3.handleTeamInfo, actions.getTeamInfo)
		end
	end

	function var_1_3.handleJoinTeam(arg_9_0)
		var_1_3.close()
	end

	function var_1_3.close()
		var_1_0:removeChild(var_1_1, true)
	end

	function var_1_3.ok()
		local var_11_0 = ""

		for iter_11_0, iter_11_1 in pairs(var_1_3.generalList) do
			if iter_11_1:getChecked() then
				var_11_0 = var_11_0 .. tostring(iter_11_1:getGenrealId()) .. "#"
			end
		end

		if string.len(var_11_0) > 0 then
			if arg_1_0 then
				kfcmgr.sendRequest(var_1_3.handleJoinTeam, actions.kfgzGroupTeamJoin, var_1_3.teamList[var_1_4 + 1].teamId, var_11_0)
			else
				cmgr.sendRequest(var_1_3.handleJoinTeam, actions.joinTeam, var_1_3.teamList[var_1_4 + 1].teamId, var_11_0)
			end
		else
			var_1_3.close()
		end
	end

	function var_1_3.initPanel()
		var_1_2 = CCSprite:createWithSpriteFrameName("panel_action.png")

		var_1_2:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
		var_1_1:addChild(var_1_2)

		local var_12_0 = CCSprite:create("res/ui/common/text/battle/text_tit_jtj_jion.png")

		var_12_0:setPosition(ccp(var_1_2:getContentSize().width * 0.5, var_1_2:getContentSize().height))
		var_1_2:addChild(var_12_0)

		local var_12_1 = CCMenu:create()

		var_12_1:setPosition(ccp(0, 0))
		var_1_2:addChild(var_12_1)

		local var_12_2 = CCSprite:createWithSpriteFrameName("btn_default_lighted.png")
		local var_12_3 = CCSprite:createWithSpriteFrameName("btn_default_normal.png")
		local var_12_4 = CCStrokeLabelTTF:create(language.get(190052), "Thonburi", 22)

		var_12_4:setPosition(ccp(var_12_2:getContentSize().width * 0.5, var_12_2:getContentSize().height * 0.5))

		local var_12_5 = CCMenuItemSprite:create(var_12_2, var_12_3)

		var_12_5:addChild(var_12_4)
		var_12_5:registerScriptTapHandler(var_1_3.ok)
		var_12_5:setPosition(ccp(170, 55))
		var_12_1:addChild(var_12_5)

		local var_12_6 = CCSprite:createWithSpriteFrameName("btn3_yel_a.png")
		local var_12_7 = CCSprite:createWithSpriteFrameName("btn3_yel_c.png")
		local var_12_8 = CCStrokeLabelTTF:create(language.get(190053), "Thonburi", 22)

		var_12_8:setPosition(ccp(var_12_2:getContentSize().width * 0.5, var_12_2:getContentSize().height * 0.5))

		local var_12_9 = CCMenuItemSprite:create(var_12_6, var_12_7)

		var_12_9:addChild(var_12_8)
		var_12_9:registerScriptTapHandler(var_1_3.close)
		var_12_9:setPosition(ccp(455, 55))
		var_12_1:addChild(var_12_9)

		function var_1_3.onTouch(arg_13_0, arg_13_1, arg_13_2)
			if arg_13_0 == CCTOUCHBEGAN then
				for iter_13_0, iter_13_1 in pairs(var_1_3.generalList) do
					if iter_13_1:ifClick(arg_13_1, arg_13_2) then
						break
					end
				end
			end

			return true
		end

		var_1_1:registerScriptTouchHandler(var_1_3.onTouch, false, true)
		var_1_1:setTouchEnabled(true)
	end

	var_1_3.getTeamInfo()
	var_1_0:addChild(var_1_1)
end
