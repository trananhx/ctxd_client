local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.genListGenNameX = 40
	var_0_0.genListGenStateX = 130
	var_0_0.genListFontSize = -6
else
	var_0_0.genListGenNameX = 0
	var_0_0.genListGenStateX = 0
	var_0_0.genListFontSize = 0
end

local var_0_1 = {}

var_0_1.join = 1

function showGeneralListPanel(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	local var_1_0 = createBaseLayer()
	local var_1_1 = {}

	var_1_1.btnNormal = nil
	var_1_1.btnPressed = nil
	var_1_1.btnPosition = ccp(300, 590)
	var_1_1.numPosition = nil
	var_1_1.panelPosition = nil
	var_1_1.panelAnchorPoint = nil
	var_1_1.tag = nil
	var_1_1.offsetX = 330
	var_1_1.offsetY = 80
	var_1_1.rowHeight = 43

	if conf.language == "vie" then
		var_1_1.rowWidth = 580
	else
		var_1_1.rowWidth = 420
	end

	var_1_1.generalNum = arg_1_3
	var_1_1.maxHeiht = var_1_1.rowHeight * 5 + var_1_1.rowHeight * 0.5
	var_1_1.totalPage = 1
	var_1_1.curPage = 1
	var_1_1.generalList = {}
	var_1_1.hasShowGeneralList = false
	var_1_1.panel = nil
	var_1_1.generalListView = nil
	var_1_1.canGetNextPage = true
	var_1_1.lockTip = ""

	function var_1_1.updateGeneralsShow(arg_2_0)
		local var_2_0 = var_1_1.rowHeight

		if var_1_1.generalNum > 5 then
			var_2_0 = var_1_1.maxHeiht
		elseif var_1_1.generalNum > 0 then
			var_2_0 = var_1_1.rowHeight * var_1_1.generalNum
		end

		if var_1_1.panel then
			var_1_1.panel:setContentSize(CCSizeMake(var_1_1.rowWidth, var_2_0))
		end

		if var_1_1.generalListView then
			var_1_1.generalListView:setViewSize(CCSizeMake(var_1_1.rowWidth - 10, var_2_0 - 10))

			local var_2_1 = var_1_1.generalListView:getContentOffset().y
			local var_2_2 = arg_2_0 * var_1_1.rowHeight
			local var_2_3

			if var_2_2 < var_1_1.maxHeiht then
				var_2_3 = 0
			elseif var_2_1 == 0 then
				var_2_3 = var_2_1 + var_1_1.maxHeiht - var_2_2
			else
				var_2_3 = var_2_1 - var_2_2
			end

			var_1_1.generalListView:reloadData()
			var_1_1.generalListView:setContentOffset(ccp(0, var_2_3))
		end
	end

	function var_1_1.handlerGeneralList(arg_3_0)
		local var_3_0 = arg_3_0.data or arg_3_0.action.data

		var_1_1.totalPage = var_3_0.totalPage

		local var_3_1 = var_3_0.pageList
		local var_3_2 = 0

		if var_3_1 then
			for iter_3_0, iter_3_1 in pairs(var_3_1) do
				table.insert(var_1_1.generalList, iter_3_1)
			end

			var_3_2 = #var_3_1
		end

		if var_1_1.hasShowGeneralList then
			var_1_1.updateGeneralsShow(var_3_2)
		end

		var_1_1.canGetNextPage = true
	end

	function var_1_1.getGeneralList(arg_4_0)
		log.info("@@ 战斗武将列表 换页：", arg_4_0)

		local var_4_0 = 0

		if arg_1_2 == "def" then
			var_4_0 = 1
		end

		arg_4_0 = arg_4_0 or 1

		if arg_1_0.battleType == battleType.BATTLE_KFGZ then
			kfcmgr.sendRequest(var_1_1.handlerGeneralList, actions.kfgzGetBattleCampList, arg_1_0.cityId, arg_4_0, var_4_0)
		elseif arg_1_0.battleType == battleType.BATTLE_KFGZ_SOLO then
			kfcmgr.sendRequest(var_1_1.handlerGeneralList, actions.kfgzGetBattleCampList, arg_1_0.teamId, arg_4_0, var_4_0)
		elseif arg_1_0.battleType == battleType.BATTLE_KFYZ_DONGYING_SOLO then
			kfcmgr.sendRequest(var_1_1.handlerGeneralList, actions.kfgzGetBattleCampList, arg_1_0.teamId, arg_4_0, var_4_0)
		elseif arg_1_0.battleType == battleType.BATTLE_KFYZ_JIAOZHEN then
			kfcmgr.sendRequest(var_1_1.handlerGeneralList, actions.kfgzGetBattleCampList, arg_1_0.teamId, arg_4_0, var_4_0)
		else
			cmgr.sendRequest(var_1_1.handlerGeneralList, actions.getFightGeneralList, arg_1_4, arg_4_0, var_4_0)
		end
	end

	function var_1_1.getNextPage()
		if var_1_1.curPage + 1 > var_1_1.totalPage then
			return
		end

		var_1_1.curPage = var_1_1.curPage + 1

		var_1_1.getGeneralList(var_1_1.curPage)
	end

	function var_1_1.showGeneralList()
		if not var_1_1.hasShowGeneralList then
			var_1_1.generalList = {}
			var_1_1.curPage = 1

			var_1_1.getGeneralList()
			var_1_1.generalListView:setContentOffset(ccp(0, 0))
		end

		var_1_1.hasShowGeneralList = not var_1_1.hasShowGeneralList

		var_1_1.panel:setVisible(var_1_1.hasShowGeneralList)
	end

	function var_1_1.closeGeneralList()
		var_1_1.hasShowGeneralList = false

		var_1_1.panel:setVisible(var_1_1.hasShowGeneralList)
	end

	function var_1_1.cellSizeForTable(arg_8_0, arg_8_1)
		return var_1_1.rowHeight, var_1_1.rowHeight
	end

	function var_1_1.tableCellAtIndex(arg_9_0, arg_9_1)
		local var_9_0 = arg_9_1 + 1
		local var_9_1 = var_1_1.generalList[var_9_0]
		local var_9_2 = arg_9_0:dequeueCell()

		if var_9_2 then
			var_9_2:removeAllChildrenWithCleanup(true)
		else
			var_9_2 = CCTableViewCell:new()
		end

		local var_9_3
		local var_9_4 = colorForce[var_9_1.forceId]
		local var_9_5
		local var_9_6

		if var_9_1.forceId == 0 then
			var_9_3 = language.get(190015)
		elseif var_9_1.forceId == 1 or var_9_1.forceId == 2 or var_9_1.forceId == 3 then
			var_9_3 = language.get(410144, user.forceIdToName[var_9_1.forceId], var_9_1.playerName)
		elseif var_9_1.forceId == 104 then
			var_9_3 = language.get(190019, var_9_1.playerName)
			var_9_4 = ccc3(255, 255, 0)
		elseif var_9_1.forceId == 106 then
			var_9_3 = language.get(490201, var_9_1.playerName)
			var_9_4 = ccc3(255, 255, 0)
		elseif var_9_1.forceId == 1001 or var_9_1.forceId == 1002 or var_9_1.forceId == 1003 then
			var_9_3 = language.get(390424, var_9_1.playerName)
			var_9_4 = colorQuality[4]
		else
			var_9_3 = language.get(190020, var_9_1.playerName)
		end

		if arg_1_0.battleType == battleType.BATTLE_SCENARIO then
			var_9_4 = colorJubenForce[var_9_1.forceId]

			if var_9_1.forceId == 101 then
				var_9_3 = language.get(190401)
			elseif var_9_1.forceId == 102 then
				var_9_3 = language.get(190402)
			elseif var_9_1.forceId == 103 then
				var_9_3 = language.get(190403)
			elseif var_9_1.forceId == 104 then
				var_9_3 = language.get(190404)
			elseif var_9_1.forceId == 105 then
				var_9_3 = language.get(190404)
			elseif var_9_1.forceId == 107 then
				var_9_3 = language.get(190405)
			elseif var_9_1.forceId == 109 then
				var_9_3 = language.get(190406)
			end
		end

		if arg_1_0.battleType == battleType.BATTLE_KFGZ or arg_1_0.battleType == battleType.BATTLE_KFGZ_SOLO or arg_1_0.battleType == battleType.BATTLE_KFYZ_DONGYING_SOLO then
			if arg_1_0.isYz then
				if var_9_1.forceId == 1 or var_9_1.forceId == 2 or var_9_1.forceId == 3 then
					var_9_3 = language.get(410144, user.forceIdToName_kfyz[var_9_1.forceId], var_9_1.playerName)
					var_9_4 = colorForce[var_9_1.forceId]

					if var_9_1.forceId == 1 then
						local var_9_7

						if user.isKfdy then
							var_9_7 = "222416_dongying"
						elseif user.isKfgl then
							var_9_7 = 136566
						elseif user.isKfyn then
							var_9_7 = 136823
						elseif user.isKflq then
							var_9_7 = 136847
						elseif user.isKfnz then
							var_9_7 = 218004
						end

						var_9_3 = language.get(410144, language.get(var_9_7), var_9_1.playerName)
						var_9_4 = colorForce[101]
					end
				elseif var_9_1.forceId == 4 then
					var_9_3 = var_9_1.playerName
					var_9_4 = colorForce[101]
				elseif var_9_1.forceId == 1001 or var_9_1.forceId == 1002 or var_9_1.forceId == 1003 then
					var_9_3 = language.get(390424, var_9_1.playerName)
					var_9_4 = colorQuality[4]

					if user.isKfyn then
						var_9_3 = language.get(410144, user.forceIdToName[user.player.forceId], var_9_1.playerName)
						var_9_4 = colorForce[user.player.forceId]
					end
				else
					var_9_3 = var_9_1.playerName
					var_9_4 = colorForce[101]
				end
			elseif smgr.lastSafeScene == SCENE_KFEXPEDITION then
				if var_9_1.forceId == 1 or var_9_1.forceId == 2 or var_9_1.forceId == 3 then
					var_9_3 = language.get(410144, user.forceIdToName_kfmg[var_9_1.forceId], var_9_1.playerName)
					var_9_4 = colorForce[var_9_1.forceId]
				elseif var_9_1.forceId == 6002 then
					var_9_3 = language.get(410144, language.get("85040_sunc"), var_9_1.playerName)
					var_9_4 = colorForce[104]
				else
					var_9_3 = language.get(410143, var_9_1.playerName)
					var_9_4 = ccc3(209, 111, 242)
				end
			elseif var_9_1.forceId == 1 then
				var_9_3 = language.get(410141, var_9_1.playerName)
				var_9_4 = ccc3(253, 98, 98)
			elseif var_9_1.forceId == 2 then
				var_9_4 = ccc3(122, 166, 231)
				var_9_3 = language.get(410142, var_9_1.playerName)
			else
				var_9_3 = language.get(410143, var_9_1.playerName)
				var_9_4 = ccc3(209, 111, 242)
			end
		end

		var_9_4 = var_9_4 or ccc3(255, 255, 255)
		var_9_3 = var_9_3 or "Unknow"
		var_9_1.isOnQueue = var_9_1.isOnQueue or 0

		if arg_1_0.battleType == battleType.BATTLE_KFGZ or arg_1_0.battleType == battleType.BATTLE_KFGZ_SOLO or arg_1_0.battleType == battleType.BATTLE_KFYZ_DONGYING_SOLO then
			if var_9_1.isOnQueue == 1 then
				var_9_5 = language.get(190021)
				var_9_6 = ccc3(200, 0, 0)
			else
				var_9_5 = language.get(190022)
				var_9_6 = ccc3(0, 200, 0)
			end
		elseif var_9_1.isOnQueue == 1 then
			var_9_5 = language.get(190021)
			var_9_6 = ccc3(200, 0, 0)
		elseif var_9_1.isOnQueue == 2 then
			var_9_5 = language.get(113033)
			var_9_6 = colorQuality[4]
		else
			var_9_5 = language.get(190022)
			var_9_6 = ccc3(0, 200, 0)
		end

		local var_9_8 = CCNode:create()

		var_9_8:setPosition(ccp(0, 21.5))

		if arg_9_1 % 2 == 0 then
			local var_9_9 = CCSprite:createWithSpriteFrameName("battle_generalList_fenge.png")

			var_9_9:setAnchorPoint(ccp(0, 0.5))
			var_9_8:addChild(var_9_9)
		end

		local var_9_10 = CCLabelTTF:create(tostring(var_9_0), "Thonburi", 22 + var_0_0.genListFontSize)

		var_9_10:setPosition(ccp(10 + var_9_10:getContentSize().width * 0.5, 0))
		var_9_8:addChild(var_9_10)

		local var_9_11 = CCLabelTTF:create(var_9_3, "Thonburi", 22 + var_0_0.genListFontSize)

		var_9_11:setPosition(ccp(42 + var_9_11:getContentSize().width * 0.5, 0))
		var_9_11:setColor(var_9_4)
		var_9_8:addChild(var_9_11)

		local var_9_12 = CCLabelTTF:create(var_9_1.generalName, "Thonburi", 22 + var_0_0.genListFontSize)

		var_9_12:setPosition(ccp(230 + var_9_12:getContentSize().width * 0.5 + var_0_0.genListGenNameX, 0))
		var_9_12:setColor(colorQuality[var_9_1.quality])
		var_9_8:addChild(var_9_12)

		local var_9_13 = CCLabelTTF:create(var_9_5, "Thonburi", 22 + var_0_0.genListFontSize)

		var_9_13:setPosition(ccp(345 + var_9_13:getContentSize().width * 0.5 + var_0_0.genListGenStateX, 0))
		var_9_13:setColor(var_9_6)
		var_9_8:addChild(var_9_13)
		var_9_2:addChild(var_9_8)

		return var_9_2
	end

	function var_1_1.numberOfCellsInTableView(arg_10_0)
		if var_1_1.generalList then
			return #var_1_1.generalList
		else
			return 0
		end
	end

	function var_1_1.tableCellTouched(arg_11_0, arg_11_1)
		return
	end

	function var_1_1.tableCellHightLight(arg_12_0, arg_12_1)
		return
	end

	function var_1_1.tableCellUnHightLight(arg_13_0, arg_13_1)
		return
	end

	function var_1_1.touch(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == CCTOUCHBEGAN then
			if var_1_1.panel and not tool.checkIfTouch(var_1_1.panel, arg_14_1, arg_14_2) then
				var_1_1.closeGeneralList()

				return false
			end
		elseif arg_14_0 == CCTOUCHMOVED then
			if var_1_1.hasShowGeneralList and var_1_1.generalListView:getContentOffset().y > 0 and var_1_1.canGetNextPage then
				var_1_1.getNextPage()

				var_1_1.canGetNextPage = false
			end
		elseif arg_14_0 == CCTOUCHENDED then
			-- block empty
		end

		return true
	end

	function var_1_1.showMenu()
		if arg_1_2 == "att" then
			var_1_1.tag = uiTag.generalListPanel.attacker
			var_1_1.btnNormal = "btn_left_list_normal.png"
			var_1_1.btnPressed = "btn_left_list_light.png"
			var_1_1.btnPosition = ccp(var_1_1.offsetX, visibleSize.height - var_1_1.offsetY + 24)
			var_1_1.numPosition = ccp(25, 18)
			var_1_1.panelPosition = ccp(285, visibleSize.height - 100)
			var_1_1.panelAnchorPoint = ccp(0, 1)
		else
			var_1_1.tag = uiTag.generalListPanel.defender
			var_1_1.btnNormal = "btn_right_list_normal.png"
			var_1_1.btnPressed = "btn_right_list_light.png"
			var_1_1.btnPosition = ccp(visibleSize.width - var_1_1.offsetX, var_1_1.offsetY - 20)
			var_1_1.numPosition = ccp(55, 18)
			var_1_1.panelPosition = ccp(visibleSize.width - 372, 105)
			var_1_1.panelAnchorPoint = ccp(1, 0)
		end

		tool.safeRemoveChildByTag(arg_1_1, var_1_1.tag)

		local var_15_0 = CCSprite:createWithSpriteFrameName(var_1_1.btnNormal)
		local var_15_1 = CCSprite:createWithSpriteFrameName(var_1_1.btnPressed)
		local var_15_2 = CCMenu:create()
		local var_15_3 = CCMenuItemSprite:create(var_15_0, var_15_1)

		var_15_3:registerScriptTapHandler(var_1_1.showGeneralList)
		var_15_3:setPosition(var_1_1.btnPosition)

		var_1_1.generalNumLabel = CCStrokeLabelTTF:create(tostring(var_1_1.generalNum), "Thonburi", 22)

		var_1_1.generalNumLabel:setPosition(var_1_1.numPosition)
		var_15_3:addChild(var_1_1.generalNumLabel)
		var_15_2:addChild(var_15_3)

		if arg_1_2 == "def" then
			if var_1_1.lockItem then
				pcall(var_1_1.lockItem.removeFromParentAndCleanup, var_1_1.lockItem, true)
			end

			var_1_1.lockItem = CCMenuItemSprite:create(CCSprite:createWithSpriteFrameName("btn_left_list_normal.png"), CCSprite:createWithSpriteFrameName("btn_left_list_light.png"))

			var_1_1.lockItem:registerScriptTapHandler(var_1_1.showLockTips)
			var_1_1.lockItem:setPosition(ccp(visibleSize.width - var_1_1.offsetX - 85 - 70, var_1_1.offsetY - 20))

			var_1_1.lockNumLabel = CCStrokeLabelTTF:create(tostring(var_1_1.generalNum), "Thonburi", 22)

			var_1_1.lockNumLabel:setPosition(ccp(25, 18))
			var_1_1.lockItem:addChild(var_1_1.lockNumLabel)

			local var_15_4 = CCSprite:createWithSpriteFrameName("ccls_lock.png")

			var_15_4:setPosition(ccp(120, 10))
			var_1_1.lockItem:addChild(var_15_4)
			var_1_1.lockItem:setVisible(false)
			var_15_2:addChild(var_1_1.lockItem)
			var_1_1.updateLockInfo(arg_1_0.cityLockInfo)
		end

		var_15_2:setPosition(ccp(0, 0))
		var_1_0:addChild(var_15_2)
		arg_1_1:addChild(var_1_0, 0, var_1_1.tag)

		var_1_1.panel = CCScale9Sprite:createWithSpriteFrameName("common_tip_frame_small.png")

		var_1_1.panel:setPosition(var_1_1.panelPosition)
		var_1_1.panel:setAnchorPoint(var_1_1.panelAnchorPoint)
		var_1_1.panel:setVisible(false)
		var_1_1.panel:registerScriptTouchHandler(var_1_1.touch, false, true)
		var_1_1.panel:setTouchEnabled(true)
		var_1_0:addChild(var_1_1.panel)

		local var_15_5 = CCSizeMake(0, 0)

		var_1_1.generalListView = CCTableView:create(var_15_5)

		var_1_1.generalListView:setVerticalFillOrder(kCCTableViewFillTopDown)
		var_1_1.generalListView:setPosition(ccp(5, 5))
		var_1_1.generalListView:registerScriptHandler(var_1_1.tableCellHightLight, CCTableView.kTableCellHighLight)
		var_1_1.generalListView:registerScriptHandler(var_1_1.tableCellUnHightLight, CCTableView.kTableCellUnhighLight)
		var_1_1.generalListView:registerScriptHandler(var_1_1.tableCellTouched, CCTableView.kTableCellTouched)
		var_1_1.generalListView:registerScriptHandler(var_1_1.cellSizeForTable, CCTableView.kTableCellSizeForIndex)
		var_1_1.generalListView:registerScriptHandler(var_1_1.tableCellAtIndex, CCTableView.kTableCellSizeAtIndex)
		var_1_1.generalListView:registerScriptHandler(var_1_1.numberOfCellsInTableView, CCTableView.kNumberOfCellsInTableView)
		var_1_1.generalListView:setAnchorPoint(ccp(0, 0))
		var_1_1.panel:addChild(var_1_1.generalListView)
	end

	function var_1_1.updateLockInfo(arg_16_0)
		if var_1_1.lockItem == nil or arg_16_0 == nil or arg_16_0.state == -1 then
			log.info("control.lockItem")

			if var_1_1.lockItem then
				var_1_1.lockItem:setVisible(false)
			end

			return
		end

		if arg_16_0.state <= 1 then
			local var_16_0 = 0
			local var_16_1 = ""

			for iter_16_0, iter_16_1 in pairs(arg_16_0.cityList) do
				var_16_0 = var_16_0 + iter_16_1.num
				var_16_1 = var_16_1 .. iter_16_1.cityName .. " " .. iter_16_1.num .. "\n"
			end

			if var_1_1.lockNumLabel then
				var_1_1.lockNumLabel:setString(var_16_0)
			end

			var_1_1.lockTip = language.get(214500, var_16_1)

			var_1_1.lockItem:setVisible(true)
		else
			var_1_1.lockItem:setVisible(false)
		end
	end

	var_1_1.layout_tipFrame = {
		name = "tipFrame",
		type = "sprite9",
		visible = false,
		pic = {
			frame = true,
			path = "common_tip_frame_small.png"
		},
		anchorPoint = ccp(1, 1),
		middleRect = CCRectMake(24, 24, 1, 1),
		preferedSize = CCSizeMake(160, 140),
		children = {
			{
				fontSize = 20,
				name = "tipMsg",
				height = 0,
				type = "label",
				width = 300,
				anchorPoint = ccp(0, 0),
				halign = kCCTextAlignmentLeft
			}
		}
	}

	function var_1_1.showLockTips()
		local var_17_0 = true
		local var_17_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

		var_17_1:registerScriptTouchHandler(function(arg_18_0, arg_18_1, arg_18_2)
			if arg_18_0 == CCTOUCHBEGAN then
				return true
			elseif arg_18_0 == CCTOUCHMOVED then
				return true
			elseif arg_18_0 == CCTOUCHENDED then
				pcall(var_17_1.removeFromParentAndCleanup, var_17_1, true)

				var_1_1.view.widgets.tipFrame = nil

				return true
			end
		end, false, true)
		var_17_1:setTouchEnabled(true)
		smgr.rootLayer:addChild(var_17_1, 60000)

		if var_17_0 then
			local var_17_2 = 0
			local var_17_3 = 0

			if var_1_1.view == nil then
				var_1_1.view = {}
			end

			uiutil.initWidgets(var_1_1.view, var_1_1.layout_tipFrame)
			var_1_1.view.widgets.tipFrame:setAnchorPoint(ccp(1, 0))
			var_17_1:addChild(var_1_1.view.widgets.tipFrame)

			local var_17_4, var_17_5 = tool.getPositionInScreen(var_1_1.lockItem)
			local var_17_6 = var_17_4 + 20
			local var_17_7 = var_17_5 + 20

			if offset then
				var_17_6 = var_17_6 + offset.x
				var_17_7 = var_17_7 + offset.y
			end

			var_1_1.view.widgets.tipMsg:setString(var_1_1.lockTip)

			local var_17_8 = var_1_1.view.widgets.tipMsg:getContentSize().width
			local var_17_9 = var_1_1.view.widgets.tipMsg:getContentSize().height

			var_1_1.view.widgets.tipFrame:setPreferredSize(CCSizeMake(var_17_8 + 30, var_17_9 + 30))
			var_1_1.view.widgets.tipFrame:setPosition(ccp(var_17_6, var_17_7))
			var_1_1.view.widgets.tipMsg:setPosition(ccp(15, 15))
			var_1_1.view.widgets.tipFrame:setVisible(true)
		end
	end

	function var_1_1.showNewJoin(arg_19_0)
		for iter_19_0, iter_19_1 in pairs(arg_19_0) do
			if iter_19_1.side == arg_1_2 then
				local var_19_0 = CCScale9Sprite:createWithSpriteFrameName("common_tip_frame_small.png")
				local var_19_1 = iter_19_1.playerName .. language.get(190023)

				if iter_19_1.playerId == user.player.id then
					var_19_1 = language.get(190024)
				end

				local var_19_2 = CCStrokeLabelTTF:create(var_19_1, "Thonburi", 22)
				local var_19_3 = CCStrokeLabelTTF:create(iter_19_1.generalName, "Thonburi", 22)

				var_19_3:setColor(colorQuality[iter_19_1.gQuality])

				local var_19_4 = CCStrokeLabelTTF:create(language.get(190025), "Thonburi", 22)
				local var_19_5 = createRichNode({
					var_19_2,
					var_19_3,
					var_19_4
				}, 0)
				local var_19_6 = var_19_2:getContentSize().width + var_19_3:getContentSize().width + var_19_4:getContentSize().width

				var_19_0:setContentSize(CCSizeMake(var_19_6 + 20, 50))
				var_19_5:setPosition(10, 25)
				var_19_0:addChild(var_19_5)

				local var_19_7 = ccp(380, 558)
				local var_19_8 = ccp(0, 0.5)

				if arg_1_2 == "def" then
					var_19_7 = ccp(580, 35)
					var_19_8 = ccp(1, 0.5)
				end

				var_19_0:setPosition(var_19_7)
				var_19_0:setAnchorPoint(var_19_8)
				tool.safeRemoveChildByTag(var_1_0, var_0_1.join)
				var_1_0:addChild(var_19_0, 0, var_0_1.join)

				local function var_19_9()
					tool.safeRemoveChildByTag(var_1_0, var_0_1.join)
				end

				local var_19_10 = -20

				if arg_1_2 == "def" then
					var_19_10 = 20
				end

				local var_19_11 = CCArray:create()

				var_19_11:addObject(CCMoveBy:create(0.5, ccp(var_19_10, 0)))
				var_19_11:addObject(CCFadeOut:create(0.3))
				var_19_11:addObject(CCCallFuncN:create(var_19_9))

				local var_19_12 = CCSequence:create(var_19_11)

				var_19_0:runAction(var_19_12)

				break
			end
		end
	end

	function var_1_1.updateGeneralNum()
		if var_1_1.generalNumLabel and not tolua.isnull(var_1_1.generalNumLabel) then
			var_1_1.generalNumLabel:setString(tostring(var_1_1.generalNum or 0))
		end
	end

	function var_1_1.updateData(arg_22_0, arg_22_1, arg_22_2)
		arg_22_0.generalNum = arg_22_2

		arg_22_0.showNewJoin(arg_22_1)
		arg_22_0.updateGeneralNum()
	end

	var_1_1.showMenu()

	return var_1_1
end
