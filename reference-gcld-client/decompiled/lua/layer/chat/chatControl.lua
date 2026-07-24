local var_0_0 = require("lua/common/html")
local var_0_1 = {}
local var_0_2

chatMessageList = {}

function var_0_1.initWithView(arg_1_0, arg_1_1)
	arg_1_0.view = arg_1_1
	arg_1_0.openChatWindow = false
	arg_1_0.isVideo = false
	arg_1_0.lastRecordTime = 0
	arg_1_0.channel = chatEnum.type.country
	arg_1_0.to = ""
	arg_1_0.selectPlayerName = ""
	arg_1_0.msgList = {}
	arg_1_0.msgView = nil
	arg_1_0.balcklist = nil

	log.info("@@ init chat timer")

	arg_1_0.fastChatTimer = nil
	arg_1_0.recordfile = CCFileUtils:sharedFileUtils():getWritablePath() .. "recordVoice.amr"
	arg_1_0.otherfile = CCFileUtils:sharedFileUtils():getWritablePath() .. "otherVoice.amr"
	arg_1_0.fastChatContent = {
		language.get(40601),
		language.get(40602),
		language.get(40603),
		language.get(40604),
		language.get(40605)
	}

	var_0_1.goBlackList()
end

function var_0_1.destory(arg_2_0)
	if arg_2_0.fastChatTimer then
		arg_2_0.fastChatTimer:over()

		arg_2_0.fastChatTimer = nil
	end
end

function var_0_1.parseMessage(arg_3_0, arg_3_1)
	local var_3_0 = ""

	if arg_3_1.msg == language.get(390533) then
		arg_3_1.msg = language.get(390532)
		arg_3_1.chatType = chatEnum.linkType.kfyz
	end

	if string.startWith(arg_3_1.msg, "||tocity|") then
		local var_3_1 = string.sub(arg_3_1.msg, 10)
		local var_3_2 = tool.split(var_3_1, "|")

		if tonumber(var_3_2[2]) == chatEnum.linkType.kfyzCity then
			arg_3_1.chatType = chatEnum.linkType.kfyzCity
			arg_3_1.params = var_3_2[3]
			arg_3_1.msg = var_3_2[1]

			for iter_3_0 = 1, #var_3_2 - 3 do
				arg_3_1.msg = arg_3_1.msg .. var_3_2[3 + iter_3_0]
			end
		end
	end

	if arg_3_1.type == chatEnum.type.system or arg_3_1.from == "系统" then
		var_3_0 = var_3_0 .. language.get(40101)
	elseif arg_3_1.type == chatEnum.type.country then
		var_3_0 = var_3_0 .. language.get(40102)
	elseif arg_3_1.type == chatEnum.type.private then
		var_3_0 = var_3_0 .. language.get(40103)
	elseif string.startWith(arg_3_1.type, chatEnum.type.yz) then
		local var_3_3 = string.match(arg_3_1.type, "(%d+)")

		var_3_0 = var_3_0 .. language.get(tonumber(40106 + var_3_3))
	elseif arg_3_1.type == chatEnum.type.jb then
		var_3_0 = var_3_0 .. language.get(40110)
	else
		var_3_0 = var_3_0 .. language.get(40101)
	end

	if arg_3_1.title then
		var_3_0 = var_3_0 .. arg_3_1.title
	end

	if string.startWith(arg_3_1.msg, "**!") and string.endWith(arg_3_1.msg, "!**") then
		local var_3_4 = string.sub(arg_3_1.msg, 4, string.len(arg_3_1.msg) - 3)
		local var_3_5 = string.split(var_3_4, "|")

		if var_3_4 and var_3_4 ~= "" and var_3_5 and #var_3_5 == 2 then
			arg_3_1.msg = string.format("<voice>%s</voice><font color='#68D9CC'> %s″</font>", var_3_5[1], var_3_5[2])
		end
	end

	if arg_3_1.type == chatEnum.type.private then
		if arg_3_1.from == user.player.name then
			var_3_0 = var_3_0 .. language.get(40104, arg_3_1.to)
		elseif arg_3_1.to == user.player.name then
			var_3_0 = var_3_0 .. language.get(40105, arg_3_1.from)
		end

		var_3_0 = var_3_0 .. string.format("<font color='#68D9CC'>%s</font>", arg_3_1.msg)
	elseif arg_3_1.from ~= "系统" then
		var_3_0 = var_3_0 .. string.format("<button>%s</button>", arg_3_1.from) .. "：" .. arg_3_1.msg
	else
		var_3_0 = var_3_0 .. arg_3_1.msg
	end

	if arg_3_1.chatType then
		if arg_3_1.chatType == chatEnum.linkType.battle then
			var_3_0 = var_3_0 .. language.get(40701, arg_3_1.params)
		elseif arg_3_1.chatType == chatEnum.linkType.city then
			var_3_0 = var_3_0 .. language.get(40703, arg_3_1.params)
		elseif arg_3_1.chatType == chatEnum.linkType.watch then
			var_3_0 = var_3_0 .. language.get(40702, arg_3_1.params)
		elseif arg_3_1.chatType == chatEnum.linkType.kfyzCity then
			var_3_0 = var_3_0 .. language.get(40705, arg_3_1.params)
		elseif arg_3_1.chatType == chatEnum.linkType.kfyz then
			var_3_0 = var_3_0 .. language.get(40704)
		end
	end

	return (var_0_0.parsestr(var_3_0))
end

function var_0_1.parseHtmlToList(arg_4_0, arg_4_1, arg_4_2)
	for iter_4_0, iter_4_1 in pairs(arg_4_1) do
		if iter_4_0 ~= "_attr" and iter_4_0 ~= "_tag" and type(iter_4_1) == "string" then
			local var_4_0 = "#d9cc8f"
			local var_4_1 = "label"
			local var_4_2
			local var_4_3 = iter_4_1

			if arg_4_1._tag and arg_4_1._tag == "font" and arg_4_1._attr then
				var_4_0 = arg_4_1._attr.color
			elseif arg_4_1._tag and arg_4_1._tag == "button" then
				var_4_1 = "button"
			elseif arg_4_1._tag and arg_4_1._tag == "voice" then
				var_4_1 = "voiceButton"
				var_4_2 = iter_4_1
				var_4_3 = language.get(400032)
			elseif arg_4_1._tag and arg_4_1._tag == "a" then
				var_4_1 = "link"

				if arg_4_1._attr then
					if arg_4_1._attr.href then
						var_4_2 = arg_4_1._attr.href
					end

					if arg_4_1._attr.color then
						var_4_0 = arg_4_1._attr.color
					end
				end
			end

			table.insert(arg_4_2, {
				type = var_4_1,
				text = var_4_3,
				color = var_4_0,
				data = var_4_2
			})
		elseif type(iter_4_1) == "table" and iter_4_1._tag then
			arg_4_0:parseHtmlToList(iter_4_1, arg_4_2)
		end
	end
end

function var_0_1.updateChatState(arg_5_0, arg_5_1)
	var_0_1.isVideo = arg_5_1

	arg_5_0.view.widgets.keyboardButton:setVisible(arg_5_1)
	arg_5_0.view.widgets.videoButton:setVisible(not arg_5_1)
	arg_5_0.view.widgets.recordButton:setVisible(arg_5_1)
	arg_5_0.view.widgets.inputBox:setVisible(not arg_5_1)
	arg_5_0.view.widgets.sendButton:setVisible(not arg_5_1)
	arg_5_0.view.widgets.fastChatButton:setVisible(not arg_5_1)
end

function var_0_1.startLight()
	var_0_1.stopLight()

	if var_0_1.openChatWindow then
		return
	end

	var_0_1.view.widgets.chatLightSprite:setOpacity(1)

	local var_6_0 = CCArray:create()

	var_6_0:addObject(CCFadeOut:create(0.8))
	var_6_0:addObject(CCFadeIn:create(0.5))

	local var_6_1 = CCSequence:create(var_6_0)

	var_0_1.view.widgets.chatLightSprite:runAction(CCRepeatForever:create(var_6_1))
end

function var_0_1.stopLight()
	var_0_1.view.widgets.chatLightSprite:setOpacity(0)
	var_0_1.view.widgets.chatLightSprite:stopAllActions()
end

function var_0_1.checkHasInBlackList(arg_8_0)
	if not var_0_1.balcklist then
		return false
	end

	for iter_8_0, iter_8_1 in pairs(var_0_1.balcklist) do
		if iter_8_1.blackName == arg_8_0 then
			return true
		end
	end

	return false
end

function var_0_1.appendMsg(arg_9_0)
	table.insert(user.player.chatMessageList, arg_9_0)

	if table.getn(user.player.chatMessageList) > chatEnum.maxMsgNum then
		table.remove(user.player.chatMessageList, 1)
	end

	var_0_1.updateChat(arg_9_0)
end

function var_0_1.updateChat(arg_10_0)
	local var_10_0 = arg_10_0.from

	if var_0_1.checkHasInBlackList(var_10_0) then
		return
	end

	if var_0_1.msgView then
		var_0_1.msgView:appendMsg(arg_10_0)
	end

	local var_10_1 = var_0_1:parseMessage(arg_10_0)

	if var_10_1 then
		local var_10_2 = {}

		var_0_1:parseHtmlToList(var_10_1, var_10_2)

		local var_10_3 = {}

		for iter_10_0, iter_10_1 in pairs(var_10_2) do
			local var_10_4
			local var_10_5 = CCLabelTTF:create(iter_10_1.text, "Thonburi", 22)

			var_10_5:setColor(tool.hexToRgb(iter_10_1.color))

			if var_10_5 then
				table.insert(var_10_3, var_10_5)
			end
		end

		local var_10_6
		local var_10_7 = createMultiLineRichNode2(var_10_3, {
			width = 390,
			height = 40
		})

		var_10_7:setPosition(ccp(85, 75))
		var_0_1.view.widgets.panel:removeChildByTag(100, true)
		var_0_1.view.widgets.panel:addChild(var_10_7, 0, 100)
		var_0_1.view.widgets.panel:runAction(CCFadeIn:create(0.5))

		local function var_10_8()
			if var_0_1.view.widgets.panel then
				var_0_1.view.widgets.panel:runAction(CCFadeOut:create(0.5))
				var_0_1.view.widgets.panel:removeChildByTag(100, true)
			end
		end

		var_0_1.startLight()
		performWithDelay(var_0_1.view.widgets.panel, var_10_8, 10)
	end
end

function var_0_1.onSendMessage()
	var_0_1.sendMessage(var_0_1.view.widgets.inputBox:getText())
	var_0_1.view.widgets.inputBox:setText("")
end

function var_0_1.sendMessage(arg_13_0)
	if not arg_13_0 or string.len(arg_13_0) == 0 then
		return
	end

	if string.find(arg_13_0, "钓鱼岛") ~= nil or string.find(arg_13_0, "尖阁列岛") ~= nil then
		smgr.showTipText(language.get(143040))

		return
	end

	if var_0_1.to == "test" then
		local var_13_0 = {
			type = "COUNTRY",
			from = "[测试]",
			isGm = true,
			to = "",
			msg = "补充",
			voice = false
		}
		local var_13_1 = string.split(arg_13_0, " ")
		local var_13_2 = var_13_1[1]

		if gmgr.action and gmgr.action[var_13_2] then
			var_13_0.msg = gmgr.action[var_13_2](var_13_1)

			var_0_1.appendMsg(var_13_0)
		end

		return
	end

	cmgr.sendRequest(nil, actions.sendChat, var_0_1.channel, arg_13_0, var_0_1.to)
end

function var_0_1.changeChannelToJb()
	var_0_1.channel = chatEnum.type.jb
	var_0_1.to = ""

	var_0_1.view.widgets.selectChanelPanel:setVisible(false)
	var_0_1.changeChannelButtonTitle(language.get(40006))
	var_0_1.view.widgets.nationButtonName:setString(language.get(190076))
	var_0_1.view.widgets.nationButtonName:setVisible(true)
end

function var_0_1.changeChannelToThreeYZ()
	if user.isYw then
		var_0_1.changeChannelToJb()

		return
	end

	local var_15_0 = tonumber(user.player.kfgzForceId - 1000)

	var_0_1.channel = chatEnum.type.yz .. var_15_0
	var_0_1.to = ""

	var_0_1.view.widgets.selectChanelPanel:setVisible(false)
	var_0_1.changeChannelButtonTitle(language.get(40006))
	var_0_1.view.widgets.nationButtonName:setString(language.get("chatKf" .. var_15_0))
	var_0_1.view.widgets.nationButtonName:setVisible(true)
end

function var_0_1.changeChannelToCountry()
	var_0_1.channel = chatEnum.type.country
	var_0_1.to = ""

	var_0_1.view.widgets.selectChanelPanel:setVisible(false)
	var_0_1.changeChannelButtonTitle(language.get(40006))
	var_0_1.view.widgets.nationButtonName:setString(language.get(40001))
	var_0_1.view.widgets.nationButtonName:setVisible(true)
end

function var_0_1.changeChannelToPrivate()
	local var_17_0 = var_0_1.view.widgets.privateChatInputBox:getText()

	var_0_1.channel = chatEnum.type.private
	var_0_1.to = var_17_0

	var_0_1.changeChannelButtonTitle(var_17_0)
	var_0_1.view.widgets.privateChatWindow:setVisible(false)
	var_0_1.view.widgets.nationButtonName:setVisible(false)
end

function var_0_1.changeChannelButtonTitle(arg_18_0)
	local var_18_0 = arg_18_0

	if string.utf8len(arg_18_0) > 3 then
		var_18_0 = string.utf8sub(arg_18_0, 1, 2) .. "..."
	end

	var_0_1.view.widgets.nationButtonName:setVisible(false)
	var_0_1.view.widgets.channelSelectButton:setTitleForState(CCString:create(var_18_0), CCControlStateNormal)
	var_0_1.view.widgets.channelSelectButton:setTitleForState(CCString:create(var_18_0), CCControlStateHighlighted)
	var_0_1.view.widgets.channelSelectButton:setTitleForState(CCString:create(var_18_0), CCControlStateDisabled)
	var_0_1.view.widgets.channelSelectButton:setTitleForState(CCString:create(var_18_0), CCControlStateSelected)
end

function var_0_1.initFastChatContent()
	for iter_19_0, iter_19_1 in pairs(var_0_1.fastChatContent) do
		log.info(iter_19_1)

		local var_19_0 = iter_19_0 % 2

		if var_19_0 == 0 then
			var_19_0 = 2
		end

		local var_19_1 = CCScale9Sprite:createWithSpriteFrameName(string.format("chat_list_bg%s.jpg", var_19_0))
		local var_19_2 = CCScale9Sprite:createWithSpriteFrameName(string.format("chat_list_bg%s.jpg", var_19_0))
		local var_19_3 = CCScale9Sprite:createWithSpriteFrameName("chat_tips_list_on.png", CCRectMake(0, 0, 0, 0))

		var_19_3:setPreferredSize(CCSizeMake(360, 60))
		var_19_3:setPosition(ccp(180, 30))
		var_19_2:addChild(var_19_3)

		local var_19_4 = CCLabelTTF:create(iter_19_1, "Thonburi", 22)

		var_19_4:setHorizontalAlignment(kCCTextAlignmentLeft)

		local var_19_5 = CCControlButton:create(var_19_4, var_19_1)

		var_19_5:setPreferredSize(CCSizeMake(360, 60))
		var_19_5:setBackgroundSpriteForState(var_19_2, CCControlStateHighlighted)
		var_19_5:setTitleColorForState(ccc3(129, 193, 109), CCControlStateHighlighted)
		var_19_5:setPosition(ccp(187, 310 - (iter_19_0 - 0.5) * var_19_5:getContentSize().height))
		var_19_5:setZoomOnTouchDown(false)
		var_19_5:setLabelAnchorPoint(ccp(163 / var_19_4:getContentSize().width, 0.5))
		var_19_5:addHandleOfControlEvent(var_0_1.fastChatClick, CCControlEventTouchUpInside)
		var_0_1.view.widgets.fastChatWindow:addChild(var_19_5)

		if conf.language == "kr" then
			var_19_3:setPreferredSize(CCSizeMake(703, 60))
			var_19_3:setPosition(ccp(353, 30))
			var_19_5:setPreferredSize(CCSizeMake(707, 60))
			var_19_5:setPositionX(363)
			var_19_5:setLabelAnchorPoint(ccp(343 / var_19_4:getContentSize().width, 0.5))
		elseif conf.language == "vie" then
			var_19_3:setPreferredSize(CCSizeMake(703, 60))
			var_19_3:setPosition(ccp(353, 30))
			var_19_5:setPreferredSize(CCSizeMake(707, 60))
			var_19_5:setPositionX(363)
			var_19_5:setLabelAnchorPoint(ccp(343 / var_19_4:getContentSize().width, 0.5))
		end
	end
end

function var_0_1.fastChatClick(arg_20_0, arg_20_1)
	local var_20_0 = tolua.cast(arg_20_1, "CCControlButton"):getTitleForState(CCControlStateNormal):getCString()

	if string.len(var_20_0) > 0 then
		var_0_1.view.widgets.inputBox:setText(var_20_0)
	end
end

function var_0_1.clickNameOnMessageView(arg_21_0, arg_21_1)
	local var_21_0 = tolua.cast(arg_21_1, "CCControlButton")
	local var_21_1 = var_21_0:getTitleForState(CCControlStateNormal):getCString()

	var_0_1.selectPlayerName = var_21_1

	local var_21_2, var_21_3 = tool.getPositionFromUpperNode(var_21_0, var_0_1.view.widgets.window)

	var_0_1.view.widgets.privateAndBlacklistPanel:setPosition(ccp(var_21_2, var_21_3 - 95))
	var_0_1.view.widgets.privateAndBlacklistPanel:setVisible(true)
end

function var_0_1.privateChatTo()
	var_0_1.view.widgets.privateAndBlacklistPanel:setVisible(false)

	var_0_1.channel = chatEnum.type.private
	var_0_1.to = var_0_1.selectPlayerName

	var_0_1.changeChannelButtonTitle(var_0_1.to)
end

function var_0_1.handlerAddBlacklist(arg_23_0)
	smgr.showTipTextGreen(language.get(40503))
	var_0_1.getBlackList()
end

function var_0_1.addToBlacklist()
	if var_0_1.checkHasInBlackList(var_0_1.selectPlayerName) then
		smgr.showTipText(language.get(40505))

		return
	end

	var_0_1.view.widgets.privateAndBlacklistPanel:setVisible(false)
	cmgr.sendRequest(var_0_1.handlerAddBlacklist, actions.addToBlackList, var_0_1.selectPlayerName)
end

function var_0_1.cellSizeForTable(arg_25_0, arg_25_1)
	return 60, 60
end

function var_0_1.tableCellAtIndex(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_1 % 2

	if var_26_0 == 0 then
		var_26_0 = 2
	end

	local var_26_1 = string.format("%d", arg_26_1)
	local var_26_2 = arg_26_0:dequeueCell()

	if var_26_2 then
		var_26_2:removeAllChildrenWithCleanup(true)
	else
		local var_26_3 = CCTableViewCell:new()
	end

	local var_26_4
	local var_26_5 = CCTableViewCell:new()
	local var_26_6 = CCScale9Sprite:createWithSpriteFrameName(string.format("chat_list_bg%s.jpg", var_26_0))

	var_26_6:setPreferredSize(CCSizeMake(340, 60))
	var_26_6:setAnchorPoint(CCPointMake(0, 0))
	var_26_6:setPosition(CCPointMake(1, 0))

	local var_26_7 = CCScale9Sprite:createWithSpriteFrameName("chat_tips_list_on.png", CCRectMake(0, 0, 0, 0))

	var_26_7:setPreferredSize(CCSizeMake(340, 60))
	var_26_7:setAnchorPoint(CCPointMake(0, 0))
	var_26_7:setPosition(CCPointMake(1, 0))
	var_26_7:setVisible(false)
	var_26_5:addChild(var_26_6)
	var_26_5:addChild(var_26_7, 1, 101)

	local var_26_8 = var_0_1.balcklist[arg_26_1 + 1]

	if var_26_8 then
		local var_26_9 = CCLabelTTF:create(var_26_8.blackName, "Helvetica", 24)

		var_26_9:setColor(ccc3(237, 209, 169))
		var_26_9:setPosition(CCPointMake(17, 30))
		var_26_9:setAnchorPoint(CCPointMake(0, 0.5))
		var_26_5:addChild(var_26_9)

		local var_26_10 = CCLabelTTF:create(language.get(40502), "Helvetica", 24)

		var_26_10:setColor(ccc3(130, 187, 110))
		var_26_10:setPosition(CCPointMake(235, 30))
		var_26_10:setAnchorPoint(CCPointMake(0, 0.5))
		var_26_5:addChild(var_26_10)
	end

	return var_26_5
end

function var_0_1.numberOfCellsInTableView(arg_27_0)
	if var_0_1.balcklist then
		return #var_0_1.balcklist
	else
		return 0
	end
end

function var_0_1.tableCellTouched(arg_28_0, arg_28_1)
	local var_28_0 = var_0_1.balcklist[arg_28_1:getIdx() + 1]

	cmgr.sendRequest(var_0_1.handlerRemoveFromBlackList, actions.removeFromBlacklist, var_28_0.vId)
end

function var_0_1.tableCellHightLight(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_1:getChildByTag(101)

	if var_29_0 then
		var_29_0:setVisible(true)
	end
end

function var_0_1.tableCellUnHightLight(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_1:getChildByTag(101)

	if var_30_0 then
		var_30_0:setVisible(false)
	end
end

function var_0_1.handlerRemoveFromBlackList(arg_31_0)
	smgr.showTipTextGreen(language.get(40504))
	var_0_1.getBlackList()
end

function var_0_1.handlerBlackList(arg_32_0)
	var_0_1.balcklist = arg_32_0.action.data.blacks

	var_0_1.view.widgets.blacklistView:reloadData()
end

function var_0_1.initBlacklist()
	var_0_1.view.widgets.blacklistView:registerScriptHandler(var_0_1.tableCellHightLight, CCTableView.kTableCellHighLight)
	var_0_1.view.widgets.blacklistView:registerScriptHandler(var_0_1.tableCellUnHightLight, CCTableView.kTableCellUnhighLight)
	var_0_1.view.widgets.blacklistView:registerScriptHandler(var_0_1.tableCellTouched, CCTableView.kTableCellTouched)
	var_0_1.view.widgets.blacklistView:registerScriptHandler(var_0_1.cellSizeForTable, CCTableView.kTableCellSizeForIndex)
	var_0_1.view.widgets.blacklistView:registerScriptHandler(var_0_1.tableCellAtIndex, CCTableView.kTableCellSizeAtIndex)
	var_0_1.view.widgets.blacklistView:registerScriptHandler(var_0_1.numberOfCellsInTableView, CCTableView.kNumberOfCellsInTableView)
end

function var_0_1.getBlackList()
	cmgr.sendRequest(var_0_1.handlerBlackList, actions.getblacklist)
end

function var_0_1.goBlackList()
	cmgr.sendRequest(var_0_1.handlergoBlackList, actions.getblacklist)
end

function var_0_1.handlergoBlackList(arg_36_0)
	var_0_1.balcklist = arg_36_0.action.data.blacks
end

function var_0_1.startRecord()
	local function var_37_0()
		if os.time() - var_0_1.lastRecordTime < 2 then
			smgr.showTipTextGreen(language.get(400021))

			return
		end

		var_0_1.view.widgets.grayHuaTong:setVisible(false)
		var_0_1.view.widgets.greenHuaTong:setVisible(true)

		var_0_2 = createTimerLabel(59000, language.get(40009), "Thonburi", 20, var_0_1.stopRecord, nil, nil, colorText[10004])

		var_0_2:setPosition(ccp(73, -22))
		var_0_1.view.widgets.greenHuaTong:addChild(var_0_2)
	end

	local function var_37_1()
		if SimpleAudioEngine:sharedEngine():isBackgroundMusicPlaying() then
			amgr.pauseMusic()
		end

		log.info("record path:", var_0_1.recordfile)
		VoiceManager:getInstance():startRecord(var_0_1.recordfile)
	end

	pmgr.requestPersmission(language.get(470003), function()
		var_37_0()
		var_37_1()
	end, function()
		messageBox.alert(language.get(211007), language.get(470004))
	end, PERMISSION.RECORD_AUDIO)
end

function var_0_1.stopRecord()
	if var_0_2 then
		var_0_2:removeFromParentAndCleanup(true)

		var_0_2 = nil
	else
		log.info("chat record time up!!!!")

		return
	end

	var_0_1.lastRecordTime = os.time()

	var_0_1.view.widgets.grayHuaTong:setVisible(true)
	var_0_1.view.widgets.greenHuaTong:setVisible(false)

	local var_42_0 = 0

	local function var_42_1()
		amgr.resumeMusic()

		if var_42_0 < 1 then
			smgr.showTipTextGreen(language.get(400019))
		elseif var_42_0 > 60 then
			smgr.showTipTextGreen(language.get(400020))
		else
			vmgr.upload(var_42_0, var_0_1.recordfile, var_0_1.uploadOver)
		end
	end

	VoiceManager:getInstance():stopRecord(var_42_1)

	var_42_0 = VoiceManager:getInstance():getRecordTime()

	log.info("@@record time: ", var_42_0)

	if platform.platform == kTargetAndroid then
		var_42_1()
	end
end

function var_0_1.uploadOver(arg_44_0, arg_44_1)
	cmgr.sendRequest(nil, actions.speak, arg_44_0, arg_44_1, var_0_1.channel, var_0_1.to)
end

function var_0_1.onPlayerVoice(arg_45_0, arg_45_1)
	local var_45_0 = tolua.cast(arg_45_1, "CCControlButton")
	local var_45_1 = tolua.cast(var_45_0:getUserObject(), "CCString"):getCString()

	local function var_45_2(arg_46_0)
		log.info("@@ 按钮发光效果")

		if arg_46_0 and arg_46_0 > 0 then
			local var_46_0 = CCSprite:createWithSpriteFrameName("voice_play_light.png")

			var_46_0:setPosition(ccp(var_45_0:getContentSize().width * 0.5, var_45_0:getContentSize().height * 0.5))

			local function var_46_1()
				var_45_0:removeChild(var_46_0, true)
			end

			local var_46_2 = CCArray:create()

			var_46_2:addObject(CCFadeOut:create(0.5))
			var_46_2:addObject(CCFadeIn:create(0.5))

			local var_46_3 = CCSequence:create(var_46_2)

			var_46_0:runAction(CCSequence:createWithTwoActions(CCRepeat:create(var_46_3, arg_46_0), CCCallFunc:create(var_46_1)))
			var_45_0:addChild(var_46_0)
			log.info("@@ 暂停背景音乐")
			amgr.pauseMusic()

			local var_46_4

			local function var_46_5()
				log.info("@@ 恢复音量")

				if amgr.canPlayeMusic then
					amgr.resumeMusic()
				end

				if var_46_4 then
					var_46_4:over()
				end
			end

			var_46_4 = NewTimer(arg_46_0, var_46_5)
		end
	end

	if var_45_1 then
		vmgr.download(var_45_1, var_0_1.otherfile, var_45_2)
	end
end

function var_0_1.openUrl(arg_49_0, arg_49_1)
	local var_49_0 = tolua.cast(arg_49_1, "CCControlButton")
	local var_49_1 = tolua.cast(var_49_0:getUserObject(), "CCString"):getCString()

	if string.startWith(var_49_1, "event") then
		local var_49_2 = string.split(var_49_1, "|")
		local var_49_3 = var_49_2[2]
		local var_49_4 = var_49_2[3]

		if var_49_3 == "enterFight" then
			local var_49_5 = string.split(var_49_4, "#")
			local var_49_6 = tonumber(var_49_5[1])
			local var_49_7 = tonumber(var_49_5[2])

			bmgr.tryEnterBattle(var_49_6, {
				targetId = var_49_7
			})
		elseif var_49_3 == "watchFight" then
			local var_49_8 = var_49_4

			bmgr.tryEnterBattle(nil, {
				battleId = var_49_8
			})
		elseif var_49_3 == "cityEvent" then
			loadingLayer.show(SCENE_WORLD, tonumber(var_49_4))
		elseif var_49_3 == "kfyzCityEvent" then
			if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
				eventManager.dispatchEvent("moveToCity", tonumber(var_49_4))
			elseif user.kfyzState == 1 and user.startTime < 180000 or user.kfyzState == 2 and user.isInSd then
				smgr.changeScene(SCENE_KFYZ_WORLD, user.kfyzState, nil, tonumber(var_49_4))
			else
				smgr.showTipText(language.get(40706))
			end
		elseif var_49_3 == "kfyz" then
			local var_49_9 = smgr.getLayer("topLayer")

			var_49_9:removeAllChildrenWithCleanup(true)
			require("lua/layer/kfyz/YuyueLayer").new(var_49_9)
		end
	else
		pcall(var_0_1.openUrl2, var_49_1)
	end
end

function var_0_1.openUrl2(arg_50_0)
	CCApplication:sharedApplication():openURL(arg_50_0)
end

return var_0_1
