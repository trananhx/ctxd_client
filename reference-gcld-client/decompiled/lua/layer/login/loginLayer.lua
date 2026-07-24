local var_0_0 = require("lua/common/json")
local var_0_1 = class("loginLayer", function()
	return createBaseLayer()
end)

function var_0_1.ctor(arg_2_0, arg_2_1)
	arg_2_0._currentSelectedPlayerIndex = nil
	arg_2_0._currentSelectedIndex = nil
	arg_2_0._rightShowServerList = {}
	arg_2_0._currentSelectedServer = nil
	arg_2_0._currentSelectedServerId = nil
	arg_2_0._currentSelectedPlayerId = nil
	arg_2_0._currentSelectedSSP = nil

	if loginData.selectedServer then
		arg_2_0._currentSelectedServerId = loginData.selectedServer.serverId
		arg_2_0._currentSelectedServer = loginData.selectedServer
	end

	arg_2_0._groupCapacity = 20
	arg_2_0._control = arg_2_1

	for iter_2_0 = #arg_2_0._control.havePlayerServerList, 1, -1 do
		for iter_2_1, iter_2_2 in pairs(arg_2_0._control.serverList) do
			if tostring(iter_2_2.serverId) == tostring(arg_2_0._control.havePlayerServerList[iter_2_0].sid) then
				arg_2_0._control.havePlayerServerList[iter_2_0].serverInfo = iter_2_2

				break
			end
		end

		for iter_2_3, iter_2_4 in pairs(arg_2_0._control.wujiangServerList) do
			if tostring(iter_2_4.serverId) == tostring(arg_2_0._control.havePlayerServerList[iter_2_0].sid) then
				arg_2_0._control.havePlayerServerList[iter_2_0].serverInfo = iter_2_4

				break
			end
		end

		local var_2_0 = arg_2_0._control.havePlayerServerList[iter_2_0].o.isDelete

		if not arg_2_0._control.havePlayerServerList[iter_2_0].serverInfo or var_2_0 then
			log.info("remove index " .. iter_2_0)
			table.remove(arg_2_0._control.havePlayerServerList, iter_2_0)
		end
	end

	if QuickLogin then
		if arg_2_0._control.havePlayerServerList[1] then
			loginData.selectedServer = arg_2_0._control.havePlayerServerList[1].serverInfo

			local var_2_1 = string.split(arg_2_0._control.havePlayerServerList[1].ssp, "_")

			arg_2_0._control._selectedPlayerId = var_2_1[3]

			return
		elseif loginData.selectedServer then
			return
		end
	end

	arg_2_0._leftListTypeTable = {}

	if #arg_2_0._control.havePlayerServerList > 0 then
		table.insert(arg_2_0._leftListTypeTable, "HavePlayerServerList")
	end

	if #arg_2_0._control.hadLoginServerList > 0 then
		table.insert(arg_2_0._leftListTypeTable, "HadLoginServerList")
	end

	if #arg_2_0._control.recommendServerList > 0 then
		table.insert(arg_2_0._leftListTypeTable, "RecommendServerList")
	end

	if #arg_2_0._control.wujiangServerList > 0 then
		table.insert(arg_2_0._leftListTypeTable, "wujiangServerList")
	end

	if channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
		arg_2_0._leftListNum = #arg_2_0._leftListTypeTable
	else
		table.insert(arg_2_0._leftListTypeTable, "ServerList")

		arg_2_0._leftListNum = math.ceil(#(arg_2_1.serverList or {}) / arg_2_0._groupCapacity) + #arg_2_0._leftListTypeTable - 1
	end

	local var_2_2 = CCSprite:create("res/ui/login/server_view.png")

	var_2_2:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))

	local var_2_3 = CCControlButton:create(CCScale9Sprite:create("res/ui/login/server_start_btn.png"))

	var_2_3:setAdjustBackgroundImage(false)
	var_2_3:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/login/server_start_btn_c.png"), CCControlStateHighlighted)
	var_2_3:setZoomOnTouchDown(false)
	var_2_3:addHandleOfControlEvent(handler(arg_2_0, arg_2_0.onStartBtnClicked), CCControlEventTouchUpInside)
	var_2_3:setPosition(ccp(605, 57))

	arg_2_0._leftList = CCTableView:create(CCSizeMake(257, 456))

	arg_2_0._leftList:setDirection(kCCScrollViewDirectionVertical)
	arg_2_0._leftList:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_2_0._leftList:setPosition(ccp(36, 33))
	arg_2_0._leftList:registerScriptHandler(handler(arg_2_0, arg_2_0.tableCellTouched), CCTableView.kTableCellTouched)
	arg_2_0._leftList:registerScriptHandler(handler(arg_2_0, arg_2_0.cellSizeForTable), CCTableView.kTableCellSizeForIndex)
	arg_2_0._leftList:registerScriptHandler(handler(arg_2_0, arg_2_0.tableCellAtIndex), CCTableView.kTableCellSizeAtIndex)
	arg_2_0._leftList:registerScriptHandler(handler(arg_2_0, arg_2_0.numberOfCellsInTableView), CCTableView.kNumberOfCellsInTableView)

	arg_2_0._rightScrollView = CCScrollView:create()

	arg_2_0._rightScrollView:setDirection(kCCScrollViewDirectionVertical)
	arg_2_0._rightScrollView:setViewSize(CCSizeMake(555, 373))
	arg_2_0._rightScrollView:setContentSize(CCSizeMake(555, 373))
	arg_2_0._rightScrollView:setPosition(ccp(328, 112))

	arg_2_0._scrollViewContentLayer = arg_2_0._rightScrollView:getContainer()

	arg_2_0._scrollViewContentLayer:setTouchEnabled(true)
	arg_2_0._scrollViewContentLayer:registerScriptTouchHandler(handler(arg_2_0, arg_2_0.onScorllViewContainerTouch), false, false)

	arg_2_0._rightList = CCTableView:create(CCSizeMake(555, 373))

	arg_2_0._rightList:setDirection(kCCScrollViewDirectionVertical)
	arg_2_0._rightList:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_2_0._rightList:setPosition(ccp(328, 112))
	arg_2_0._rightList:registerScriptHandler(handler(arg_2_0, arg_2_0.rightListTableCellTouched), CCTableView.kTableCellTouched)
	arg_2_0._rightList:registerScriptHandler(handler(arg_2_0, arg_2_0.rightListCellSizeForTable), CCTableView.kTableCellSizeForIndex)
	arg_2_0._rightList:registerScriptHandler(handler(arg_2_0, arg_2_0.rightListTableCellAtIndex), CCTableView.kTableCellSizeAtIndex)
	arg_2_0._rightList:registerScriptHandler(handler(arg_2_0, arg_2_0.rightListNumberOfCellsInTableView), CCTableView.kNumberOfCellsInTableView)
	arg_2_0._leftList:reloadData()
	arg_2_0:selectIndex(1)
	arg_2_0._rightList:reloadData()
	arg_2_0:selectPlayerIndex(1)
	var_2_2:addChild(var_2_3)
	var_2_2:addChild(arg_2_0._leftList)
	var_2_2:addChild(arg_2_0._rightList)
	var_2_2:addChild(arg_2_0._rightScrollView)
	arg_2_0:addChild(var_2_2)
	arg_2_0:setTouchEnabled(true)
	arg_2_0:registerScriptTouchHandler(handler(arg_2_0, arg_2_0.onTouch), false, true)
end

function var_0_1.onTouch(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if arg_3_1 == CCTOUCHBEGAN then
		return true
	elseif arg_3_1 == CCTOUCHMOVED then
		return true
	elseif arg_3_1 == CCTOUCHENDED then
		return true
	end
end

function var_0_1.onScorllViewContainerTouch(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local function var_4_0(arg_5_0, arg_5_1, arg_5_2)
		local var_5_0 = arg_5_0:convertToNodeSpace(ccp(arg_5_1, arg_5_2))

		if CCRectMake(0, 0, arg_5_0:getViewSize().width, arg_5_0:getViewSize().height):containsPoint(var_5_0) then
			return true
		end

		return false
	end

	if arg_4_1 == "began" and not var_4_0(arg_4_0._rightScrollView, arg_4_2, arg_4_3) or not arg_4_0._rightScrollView:isVisible() then
		return false
	end

	if arg_4_1 == "began" then
		arg_4_0.bDrag_ = false
		arg_4_0._beginY = arg_4_3
	elseif arg_4_1 == "moved" then
		arg_4_0.bDrag_ = true
	elseif arg_4_1 == "ended" and (not arg_4_0.bDrag_ or math.abs(arg_4_0._beginY - arg_4_3) < 10) then
		local var_4_1 = arg_4_0._scrollViewContentLayer:convertToNodeSpace(ccp(arg_4_2, arg_4_3))
		local var_4_2 = arg_4_0:getTouchCellIndex(var_4_1)

		if var_4_2 then
			log.info(var_4_2)

			if arg_4_0._currentSelectedServer then
				for iter_4_0, iter_4_1 in pairs(arg_4_0._rightShowServerList) do
					if tostring(iter_4_1.serverId) == tostring(arg_4_0._currentSelectedServer.serverId) then
						local var_4_3 = tolua.cast(arg_4_0._cellTable[iter_4_0]:getChildByTag(60), "CCSprite")
						local var_4_4

						if arg_4_0._showType == "hadLogServerList" then
							var_4_4 = CCSprite:create("res/ui/login/server_01.png")
						elseif arg_4_0._showType == "recommendServerList" then
							var_4_4 = CCSprite:create("res/ui/login/server_01.png")
						elseif arg_4_0._showType == "wujiangServerList" then
							var_4_4 = CCSprite:create("res/ui/login/server_01.png")
						elseif arg_4_0._showType == "serverList" then
							var_4_4 = CCSprite:create("res/ui/login/server_02.png")
						else
							var_4_4 = CCSprite:create("res/ui/login/server_02.png")
						end

						var_4_3:setDisplayFrame(var_4_4:displayFrame())
						var_4_3:getChildByTag(60):setVisible(false)
					end
				end
			end

			local var_4_5 = tolua.cast(arg_4_0._cellTable[var_4_2]:getChildByTag(60), "CCSprite")
			local var_4_6

			if arg_4_0._showType == "hadLogServerList" then
				var_4_6 = CCSprite:create("res/ui/login/server_01_po.png")
			elseif arg_4_0._showType == "recommendServerList" then
				var_4_6 = CCSprite:create("res/ui/login/server_01_po.png")
			elseif arg_4_0._showType == "wujiangServerList" then
				var_4_6 = CCSprite:create("res/ui/login/server_01_po.png")
			elseif arg_4_0._showType == "serverList" then
				var_4_6 = CCSprite:create("res/ui/login/server_02_po.png")
			else
				var_4_6 = CCSprite:create("res/ui/login/server_02_po.png")
			end

			var_4_5:setDisplayFrame(var_4_6:displayFrame())
			var_4_5:getChildByTag(60):setVisible(true)

			arg_4_0._currentSelectedServer = arg_4_0._rightShowServerList[var_4_2]
			arg_4_0._currentSelectedServerId = arg_4_0._currentSelectedServer.serverId
			arg_4_0._currentSelectedPlayerId = nil
			arg_4_0._currentSelectedSSP = nil
			arg_4_0._currentSelectedPlayerIndex = nil

			log.info("serverId " .. tostring(arg_4_0._currentSelectedServerId))
			log.info("playerId " .. tostring(arg_4_0._currentSelectedPlayerId))
			log.info("SSP " .. tostring(arg_4_0._currentSelectedSSP))
		end
	end

	return true
end

function var_0_1.getTouchCellIndex(arg_6_0, arg_6_1)
	if #arg_6_0._cellTable > 0 then
		local var_6_0 = arg_6_0._scrollViewContentLayer:getContentSize()

		if CCRectMake(0, 0, var_6_0.width, var_6_0.height):containsPoint(arg_6_1) then
			local var_6_1 = arg_6_0._cellTable[1]:getContentSize()
			local var_6_2 = var_6_0.width / var_6_1.width
			local var_6_3 = math.min(math.floor(arg_6_1.x / var_6_1.width) + 1, var_6_2)
			local var_6_4 = math.ceil(#arg_6_0._cellTable / var_6_2)
			local var_6_5 = (var_6_4 - math.min(math.floor(arg_6_1.y / var_6_1.height) + 1, var_6_4) + 1 - 1) * var_6_2 + var_6_3

			if var_6_5 <= #arg_6_0._cellTable then
				return var_6_5
			else
				return nil
			end
		else
			return nil
		end
	else
		return nil
	end
end

function var_0_1.selectIndex(arg_7_0, arg_7_1)
	if arg_7_0._currentSelectedIndex then
		local var_7_0 = arg_7_0._leftList:cellAtIndex(arg_7_0._currentSelectedIndex - 1)

		if var_7_0 then
			tolua.cast(var_7_0:getChildByTag(60), "CCSprite"):setDisplayFrame(CCSprite:create("res/ui/login/server_list.png"):displayFrame())
		end
	end

	tolua.cast(arg_7_0._leftList:cellAtIndex(arg_7_1 - 1):getChildByTag(60), "CCSprite"):setDisplayFrame(CCSprite:create("res/ui/login/server_list_po.png"):displayFrame())

	arg_7_0._currentSelectedIndex = arg_7_1

	local var_7_1 = arg_7_0:getCellType(arg_7_1)
	local var_7_2

	if var_7_1 == "HavePlayerServerList" then
		arg_7_0._showType = "playerList"

		arg_7_0:showHavePlayerServerList()
	elseif var_7_1 == "HadLoginServerList" then
		arg_7_0._showType = "hadLogServerList"

		arg_7_0:showHadLoginServerList()
	elseif var_7_1 == "RecommendServerList" then
		arg_7_0._showType = "recommendServerList"

		arg_7_0:showRecommendServerList()
	elseif var_7_1 == "wujiangServerList" then
		arg_7_0._showType = "wujiangServerList"

		arg_7_0:showwujiangServerList()
	else
		arg_7_0._showType = "serverList"

		local var_7_3 = math.max(#arg_7_0._control.serverList - (arg_7_1 - (#arg_7_0._leftListTypeTable - 1) - 1) * arg_7_0._groupCapacity, 1)
		local var_7_4 = math.max(#arg_7_0._control.serverList - (arg_7_1 - (#arg_7_0._leftListTypeTable - 1)) * arg_7_0._groupCapacity + 1, 1)

		arg_7_0:showServerList(var_7_3, var_7_4)
	end
end

function var_0_1.selectPlayerIndex(arg_8_0, arg_8_1)
	if arg_8_0._currentSelectedPlayerIndex then
		local var_8_0 = arg_8_0._rightList:cellAtIndex(arg_8_0._currentSelectedPlayerIndex - 1)

		if var_8_0 then
			local var_8_1 = tolua.cast(var_8_0:getChildByTag(60), "CCSprite")

			var_8_1:setDisplayFrame(CCSprite:create("res/ui/login/server_role.png"):displayFrame())
			var_8_1:getChildByTag(60):setVisible(false)
		end
	end

	if arg_8_1 > 0 and #arg_8_0._control.havePlayerServerList > 0 then
		local var_8_2 = tolua.cast(arg_8_0._rightList:cellAtIndex(arg_8_1 - 1):getChildByTag(60), "CCSprite")

		var_8_2:setDisplayFrame(CCSprite:create("res/ui/login/server_role_po.png"):displayFrame())
		var_8_2:getChildByTag(60):setVisible(true)

		arg_8_0._currentSelectedPlayerIndex = arg_8_1

		local var_8_3 = arg_8_0._control.havePlayerServerList[arg_8_0._currentSelectedPlayerIndex]

		arg_8_0._currentSelectedPlayerId = string.split(var_8_3.ssp, "_")[3]
		arg_8_0._currentSelectedSSP = var_8_3.ssp
		arg_8_0._currentSelectedServerId = var_8_3.sid
		arg_8_0._currentSelectedServer = var_8_3.serverInfo

		log.info("serverId " .. tostring(arg_8_0._currentSelectedServerId))
		log.info("playerId " .. tostring(arg_8_0._currentSelectedPlayerId))
		log.info("SSP " .. tostring(arg_8_0._currentSelectedSSP))
	end
end

function var_0_1.showHavePlayerServerList(arg_9_0)
	log.info("showHavePlayerServerList")
	arg_9_0:showPlayers()
end

function var_0_1.showHadLoginServerList(arg_10_0)
	log.info("showHadLoginServerList")

	arg_10_0._rightShowServerList = arg_10_0._control.hadLoginServerList

	arg_10_0:showServers(arg_10_0._rightShowServerList)
end

function var_0_1.showRecommendServerList(arg_11_0)
	log.info("showRecommendServerList")

	arg_11_0._rightShowServerList = arg_11_0._control.recommendServerList

	arg_11_0:showServers(arg_11_0._rightShowServerList)
end

function var_0_1.showwujiangServerList(arg_12_0)
	log.info("showwujiangServerList")

	arg_12_0._rightShowServerList = arg_12_0._control.wujiangServerList

	arg_12_0:showServers(arg_12_0._rightShowServerList)
end

function var_0_1.showServerList(arg_13_0, arg_13_1, arg_13_2)
	log.info("showServerList")

	local var_13_0 = arg_13_1
	local var_13_1 = arg_13_2

	if arg_13_1 < arg_13_2 then
		var_13_0 = arg_13_2
		var_13_1 = arg_13_1
	end

	arg_13_0._rightShowServerList = {}

	for iter_13_0 = var_13_0, var_13_1, -1 do
		if arg_13_0._control.serverList[#arg_13_0._control.serverList - iter_13_0 + 1] then
			table.insert(arg_13_0._rightShowServerList, arg_13_0._control.serverList[#arg_13_0._control.serverList - iter_13_0 + 1])
		else
			log.info("serverIndex " .. #arg_13_0._control.serverList - iter_13_0 + 1 .. " not exist")
		end
	end

	arg_13_0:showServers(arg_13_0._rightShowServerList)
end

function var_0_1.showServers(arg_14_0, arg_14_1)
	arg_14_0._rightList:setVisible(false)
	arg_14_0._rightScrollView:setVisible(true)

	local var_14_0 = {}

	for iter_14_0, iter_14_1 in pairs(arg_14_1) do
		local var_14_1 = arg_14_0:createServerNode(iter_14_1)

		if var_14_1 then
			table.insert(var_14_0, var_14_1)
		end
	end

	arg_14_0:setScrollViewLayerContent(var_14_0, 2, 80)
	arg_14_0._rightScrollView:setContentOffset(arg_14_0._rightScrollView:minContainerOffset())
end

function var_0_1.createServerNode(arg_15_0, arg_15_1)
	local var_15_0
	local var_15_1 = CCSprite:create("res/ui/login/server_01_light.png")

	if tostring(arg_15_1.serverId) ~= tostring(arg_15_0._currentSelectedServerId) then
		if arg_15_0._showType == "hadLogServerList" then
			var_15_0 = CCSprite:create("res/ui/login/server_01.png")
		elseif arg_15_0._showType == "RecommendServerList" then
			var_15_0 = CCSprite:create("res/ui/login/server_01.png")
		elseif arg_15_0._showType == "wujiangServerList" then
			var_15_0 = CCSprite:create("res/ui/login/server_01.png")
		elseif arg_15_0._showType == "serverList" then
			var_15_0 = CCSprite:create("res/ui/login/server_02.png")
		else
			var_15_0 = CCSprite:create("res/ui/login/server_02.png")
		end

		var_15_1:setVisible(false)
	else
		if arg_15_0._showType == "hadLogServerList" then
			var_15_0 = CCSprite:create("res/ui/login/server_01_po.png")
		elseif arg_15_0._showType == "RecommendServerList" then
			var_15_0 = CCSprite:create("res/ui/login/server_01_po.png")
		elseif arg_15_0._showType == "wujiangServerList" then
			var_15_0 = CCSprite:create("res/ui/login/server_01.png")
		elseif arg_15_0._showType == "serverList" then
			var_15_0 = CCSprite:create("res/ui/login/server_02_po.png")
		else
			var_15_0 = CCSprite:create("res/ui/login/server_02_po.png")
		end

		var_15_1:setVisible(true)
	end

	local var_15_2 = CCStrokeLabelTTF:create(arg_15_1.serverName, "Thonburi-Bold", 30, 1, ccc3(33, 29, 23))
	local var_15_3 = var_15_0:getContentSize()

	var_15_2:setPosition(ccp(var_15_3.width / 2, var_15_3.height / 2))
	var_15_0:addChild(var_15_2)
	var_15_1:setPosition(ccp(var_15_3.width / 2, var_15_3.height / 2))
	var_15_0:addChild(var_15_1, 1, 60)

	return var_15_0
end

function var_0_1.showPlayers(arg_16_0, ...)
	arg_16_0._rightList:setVisible(true)
	arg_16_0._rightScrollView:setVisible(false)
	arg_16_0._rightList:reloadData()
end

function var_0_1.getCellType(arg_17_0, arg_17_1)
	return arg_17_0._leftListTypeTable[arg_17_1] or "ServerList"
end

function var_0_1.createTabelCellContent(arg_18_0, arg_18_1)
	local var_18_0

	if arg_18_1 ~= arg_18_0._currentSelectedIndex then
		var_18_0 = CCSprite:create("res/ui/login/server_list.png")
	else
		var_18_0 = CCSprite:create("res/ui/login/server_list_po.png")
	end

	local var_18_1 = arg_18_0:getCellType(arg_18_1)
	local var_18_2

	if var_18_1 == "HavePlayerServerList" then
		var_18_2 = CCStrokeLabelTTF:create(language.get(212008), "Thonburi-Bold", 30, 1, ccc3(33, 29, 23))
	elseif var_18_1 == "HadLoginServerList" then
		var_18_2 = CCStrokeLabelTTF:create(language.get(212011), "Thonburi-Bold", 30, 1, ccc3(33, 29, 23))
	elseif var_18_1 == "RecommendServerList" then
		var_18_2 = CCStrokeLabelTTF:create(language.get(212009), "Thonburi-Bold", 30, 1, ccc3(33, 29, 23))
	elseif var_18_1 == "wujiangServerList" then
		var_18_2 = CCStrokeLabelTTF:create(language.get(212014), "Thonburi-Bold", 30, 1, ccc3(33, 29, 23))
	else
		local var_18_3 = math.max(#arg_18_0._control.serverList - (arg_18_1 - (#arg_18_0._leftListTypeTable - 1) - 1) * arg_18_0._groupCapacity, 1)
		local var_18_4 = math.max(#arg_18_0._control.serverList - (arg_18_1 - (#arg_18_0._leftListTypeTable - 1)) * arg_18_0._groupCapacity + 1, 1)

		var_18_2 = CCStrokeLabelTTF:create(language.get(212010, var_18_4, var_18_3), "Thonburi-Bold", 22, 1, ccc3(33, 29, 23))
	end

	if var_18_2 then
		var_18_2:setColor(ccc3(255, 255, 205))

		local var_18_5 = var_18_0:getContentSize()

		var_18_2:setPosition(ccp(var_18_5.width / 2, var_18_5.height / 2))
		var_18_0:addChild(var_18_2)
	end

	return var_18_0
end

function var_0_1.tableCellTouched(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_2:getIdx()

	if var_19_0 + 1 ~= arg_19_0._currentSelectedIndex then
		arg_19_0:selectIndex(var_19_0 + 1)
	end
end

function var_0_1.cellSizeForTable(arg_20_0, arg_20_1, arg_20_2)
	return 80, 257
end

function var_0_1.tableCellAtIndex(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_1:dequeueCell()

	if var_21_0 then
		var_21_0:removeAllChildrenWithCleanup(true)
	else
		var_21_0 = CCTableViewCell:new()
	end

	local var_21_1 = arg_21_0:createTabelCellContent(arg_21_2 + 1)

	var_21_1:setPosition(128.5, 40)
	var_21_0:addChild(var_21_1, 0, 60)

	return var_21_0
end

function var_0_1.numberOfCellsInTableView(arg_22_0)
	return arg_22_0._leftListNum
end

function var_0_1.rightListTableCellTouched(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_2:getIdx()

	if var_23_0 + 1 ~= arg_23_0._currentSelectedPlayerIndex then
		arg_23_0:selectPlayerIndex(var_23_0 + 1)
	end
end

function var_0_1.rightListCellSizeForTable(arg_24_0, arg_24_1, arg_24_2)
	return 115, 555
end

function var_0_1.rightListTableCellAtIndex(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_1:dequeueCell()

	if var_25_0 then
		var_25_0:removeAllChildrenWithCleanup(true)
	else
		var_25_0 = CCTableViewCell:new()
	end

	local var_25_1 = arg_25_0:createRightListTabelCellContent(arg_25_2 + 1)

	var_25_1:setPosition(277.5, 57.5)
	var_25_0:addChild(var_25_1, 0, 60)

	return var_25_0
end

function var_0_1.rightListNumberOfCellsInTableView(arg_26_0)
	return #arg_26_0._control.havePlayerServerList
end

function var_0_1.createRightListTabelCellContent(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_0._control.havePlayerServerList[arg_27_1]

	if var_27_0 then
		local var_27_1
		local var_27_2 = string.split(var_27_0.ssp, "_")[3]
		local var_27_3 = var_27_0.sid
		local var_27_4 = CCSprite:create("res/ui/login/server_role_light.png")

		if var_27_2 == arg_27_0._currentSelectedPlayerId and tostring(var_27_3) == tostring(arg_27_0._currentSelectedServerId) then
			var_27_1 = CCSprite:create("res/ui/login/server_role_po.png")

			var_27_4:setVisible(true)
		else
			var_27_1 = CCSprite:create("res/ui/login/server_role.png")

			var_27_4:setVisible(false)
		end

		local var_27_5 = var_27_1:getContentSize()

		var_27_4:setPosition(ccp(var_27_5.width / 2, var_27_5.height / 2))
		var_27_1:addChild(var_27_4, 1, 60)

		local var_27_6 = CCSprite:create("res/ui/saotao/stfx_por_view.png")

		var_27_6:setPosition(ccp(72, 56))
		var_27_1:addChild(var_27_6)

		local var_27_7 = CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. var_27_0.face .. ".png")

		var_27_7:setPosition(ccp(72, 56))
		var_27_1:addChild(var_27_7)

		local var_27_8 = CCStrokeLabelTTF:create(var_27_0.pn, "Thonburi-Bold", 22, 1, ccc3(33, 29, 23))

		var_27_8:setAnchorPoint(ccp(0, 0.5))
		var_27_8:setPosition(ccp(132, 90))
		var_27_1:addChild(var_27_8)

		local var_27_9 = CCStrokeLabelTTF:create(language.get(212012), "Thonburi-Bold", 22, 1, ccc3(33, 29, 23))

		var_27_9:setColor(ccc3(204, 185, 134))

		local var_27_10 = CCStrokeLabelTTF:create(var_27_0.pl, "Thonburi-Bold", 22, 1, ccc3(33, 29, 23))
		local var_27_11 = createRichNode({
			var_27_9,
			var_27_10
		}, 0)

		var_27_11:setPosition(ccp(132, 55))
		var_27_1:addChild(var_27_11)

		local var_27_12 = CCStrokeLabelTTF:create(language.get(212013), "Thonburi-Bold", 22, 1, ccc3(33, 29, 23))

		var_27_12:setColor(ccc3(204, 185, 134))

		local var_27_13 = CCStrokeLabelTTF:create(var_27_0.ll, "Thonburi-Bold", 22, 1, ccc3(33, 29, 23))
		local var_27_14 = createRichNode({
			var_27_12,
			var_27_13
		}, 0)

		var_27_14:setPosition(ccp(132, 24))
		var_27_1:addChild(var_27_14)

		local var_27_15 = CCSprite:create("res/ui/playerInfo/vip_tit.png")
		local var_27_16 = CCLabelAtlas:create(var_27_0.vip, "res/ui/common/number/get_numb.png", 29, 46, 48)

		var_27_16:setAnchorPoint(ccp(0.5, 0.5))

		local var_27_17 = createRichNode({
			var_27_15,
			var_27_16
		}, 1)

		var_27_17:setPosition(ccp(531, 55))
		var_27_17:setScale(0.7)
		var_27_1:addChild(var_27_17)

		if var_27_0.serverInfo then
			local var_27_18 = CCStrokeLabelTTF:create(var_27_0.serverInfo.serverName, "Thonburi-Bold", 26, 1, ccc3(33, 29, 23))

			var_27_18:setAnchorPoint(ccp(1, 0.5))
			var_27_18:setPosition(ccp(531, 90))
			var_27_1:addChild(var_27_18)
		end

		return var_27_1
	else
		return CCNode:create()
	end
end

function var_0_1.setScrollViewLayerContent(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	arg_28_0._scrollViewContentLayer:removeAllChildrenWithCleanup(true)

	arg_28_0._cellTable = {}

	if arg_28_1 and #arg_28_1 > 0 then
		local var_28_0 = math.ceil(#arg_28_1 / arg_28_2)
		local var_28_1 = arg_28_0._scrollViewContentLayer:getContentSize()

		var_28_1.height = var_28_0 * arg_28_3

		local var_28_2 = CCSizeMake(var_28_1.width / arg_28_2, arg_28_3)

		arg_28_0._rightScrollView:setContentSize(var_28_1)

		for iter_28_0, iter_28_1 in pairs(arg_28_1) do
			local var_28_3 = CCNode:create()

			var_28_3:setContentSize(var_28_2)

			local var_28_4 = var_28_1.width / arg_28_2 * ((iter_28_0 - 1) % arg_28_2)
			local var_28_5 = var_28_1.height - arg_28_3 * math.ceil(iter_28_0 / arg_28_2)

			var_28_3:setPosition(ccp(var_28_4, var_28_5))
			iter_28_1:setPosition(ccp(var_28_2.width / 2, var_28_2.height / 2))
			var_28_3:addChild(iter_28_1, 1, 60)
			table.insert(arg_28_0._cellTable, var_28_3)
			arg_28_0._scrollViewContentLayer:addChild(var_28_3)
		end
	end
end

function var_0_1.onStartBtnClicked(arg_29_0)
	arg_29_0._control._selectedPlayerId = arg_29_0._currentSelectedPlayerId
	arg_29_0._control._selectedPlayerSSP = arg_29_0._currentSelectedSSP

	if arg_29_0._currentSelectedServer then
		loginData.selectedServer = arg_29_0._currentSelectedServer

		CCUserDefault:sharedUserDefault():setStringForKey(arg_29_0._control.defaultServerKey, arg_29_0._currentSelectedServer.serverId)
		arg_29_0._control.startGame()
	else
		messageBox.alert(language.get(211007), language.get(211013))
	end
end

function var_0_1.onEnter(arg_30_0)
	log.info("loginLayer onEnter")
end

function var_0_1.onExit(arg_31_0)
	log.info("loginLayer onExit")
end

return var_0_1
