require("lua/layer/chat/chatConstants")

local var_0_0 = {}
local var_0_1 = require("lua/layer/chat/chatControl")

function var_0_0.showChatWindow(...)
	local var_1_0 = require("res/layout/chat/chatLayout")

	uiutil.initLayout(var_0_0, var_1_0)

	var_0_1.openChatWindow = true

	var_0_1.stopLight()

	local function var_1_1()
		var_0_1.openChatWindow = false

		smgr.getLayer("topLayer"):removeChild(var_0_0.widgets.window, true)

		var_0_1.msgView = nil

		if guide.control.isHideByTemp == true then
			guide.control.isHideByTemp = false

			guide.ui.setVisible(true)
		end
	end

	local function var_1_2()
		var_0_1:updateChatState(true)
		var_0_1.view.widgets.grayHuaTong:setVisible(true)
		var_0_1.view.widgets.greenHuaTong:setVisible(false)
	end

	local function var_1_3()
		var_0_1:updateChatState(false)
		var_0_1.view.widgets.grayHuaTong:setVisible(false)
		var_0_1.view.widgets.greenHuaTong:setVisible(false)
	end

	local function var_1_4()
		var_0_0.widgets.selectChanelPanel:setVisible(not var_0_0.widgets.selectChanelPanel:isVisible())

		if user.isSoldiersThreeRoad then
			if smgr.currentSceneTag == SCENE_KFYZ_WORLD and user.player.kfgzForceId > 1000 then
				local var_5_0 = CCSizeMake(110, 237)

				var_0_0.widgets.selectChanelPanel:setPreferredSize(var_5_0)
				var_0_0.widgets.threeYzButton:setVisible(true)

				local var_5_1 = tonumber(user.player.kfgzForceId - 1000)

				var_0_0.widgets.chatKfLb:setString(language.get("chatKf" .. var_5_1))
			end
		elseif user.isYw and smgr.currentSceneTag == SCENE_JUBEN then
			local var_5_2 = CCSizeMake(110, 237)

			var_0_0.widgets.selectChanelPanel:setPreferredSize(var_5_2)
			var_0_0.widgets.threeYzButton:setVisible(true)
			var_0_0.widgets.chatKfLb:setString(language.get(190076))
		else
			local var_5_3 = CCSizeMake(110, 182)

			var_0_0.widgets.selectChanelPanel:setPreferredSize(var_5_3)
			var_0_0.widgets.threeYzButton:setVisible(false)
		end
	end

	local function var_1_5()
		var_0_1.view.widgets.selectChanelPanel:setVisible(false)
		var_0_1.view.widgets.privateChatInputBox:setText("")
		var_0_1.view.widgets.privateChatWindow:setVisible(not var_0_0.widgets.privateChatWindow:isVisible())
	end

	local function var_1_6()
		var_0_1.view.widgets.fastChatWindow:setVisible(not var_0_0.widgets.fastChatWindow:isVisible())
	end

	local function var_1_7()
		var_0_1:getBlackList()
		var_0_1.view.widgets.selectChanelPanel:setVisible(false)
		var_0_1.view.widgets.blacklistWindow:setVisible(true)
		var_0_1.view.widgets.blacklistView:setVisible(true)
	end

	local function var_1_8()
		var_0_1.view.widgets.blacklistWindow:setVisible(false)
		var_0_1.view.widgets.blacklistView:setVisible(false)
	end

	function var_0_0.widgets.window.onEnter(...)
		var_0_0.widgets.openChatWindowButton:addHandleOfControlEvent(var_1_1, CCControlEventTouchUpInside)
		var_0_0.widgets.keyboardButton:addHandleOfControlEvent(var_1_3, CCControlEventTouchUpInside)
		var_0_0.widgets.videoButton:addHandleOfControlEvent(var_1_2, CCControlEventTouchUpInside)
		var_0_0.widgets.sendButton:addHandleOfControlEvent(var_0_1.onSendMessage, CCControlEventTouchUpInside)
		var_0_0.widgets.fastChatButton:addHandleOfControlEvent(var_1_6, CCControlEventTouchUpInside)
		var_0_0.widgets.recordButton:addHandleOfControlEvent(var_0_1.startRecord, CCControlEventTouchDown)
		var_0_0.widgets.recordButton:addHandleOfControlEvent(var_0_1.stopRecord, CCControlEventTouchUpInside)
		var_0_0.widgets.recordButton:addHandleOfControlEvent(var_0_1.stopRecord, CCControlEventTouchUpOutside)
		var_0_0.widgets.channelSelectButton:addHandleOfControlEvent(var_1_4, CCControlEventTouchUpInside)
		var_0_0.widgets.threeYzButton:addHandleOfControlEvent(var_0_1.changeChannelToThreeYZ, CCControlEventTouchUpInside)
		var_0_0.widgets.countryButton:addHandleOfControlEvent(var_0_1.changeChannelToCountry, CCControlEventTouchUpInside)
		var_0_0.widgets.privateButton:addHandleOfControlEvent(var_1_5, CCControlEventTouchUpInside)
		var_0_0.widgets.blacklistButton:addHandleOfControlEvent(var_1_7, CCControlEventTouchUpInside)
		var_0_0.widgets.closeBlackListWindow:addHandleOfControlEvent(var_1_8, CCControlEventTouchUpInside)

		local function var_10_0(arg_11_0, arg_11_1, arg_11_2)
			if arg_11_0 == CCTOUCHBEGAN then
				if not var_0_0.widgets.selectChanelPanel:isVisible() then
					return false
				end

				if not tool.checkIfTouch(var_0_0.widgets.selectChanelPanel, arg_11_1, arg_11_2) then
					var_0_0.widgets.selectChanelPanel:setVisible(false)

					return false
				else
					return true
				end
			end
		end

		var_0_0.widgets.selectChanelPanel:registerScriptTouchHandler(var_10_0, false, true)
		var_0_0.widgets.selectChanelPanel:setTouchEnabled(true)

		local function var_10_1(arg_12_0, arg_12_1, arg_12_2)
			if arg_12_0 == CCTOUCHBEGAN then
				if not var_0_0.widgets.privateChatWindow:isVisible() then
					return false
				end

				if not tool.checkIfTouch(var_0_0.widgets.privateChatWindow, arg_12_1, arg_12_2) then
					var_0_0.widgets.privateChatWindow:setVisible(false)

					return false
				else
					return true
				end
			end
		end

		var_0_0.widgets.privateChatWindow:registerScriptTouchHandler(var_10_1, false, true)
		var_0_0.widgets.privateChatWindow:setTouchEnabled(true)

		local function var_10_2(arg_13_0, arg_13_1, arg_13_2)
			if arg_13_0 == CCTOUCHBEGAN then
				if not var_0_0.widgets.fastChatWindow:isVisible() then
					return false
				end

				if not tool.checkIfTouch(var_0_0.widgets.fastChatWindow, arg_13_1, arg_13_2) then
					var_0_0.widgets.fastChatWindow:setVisible(false)

					return false
				else
					return true
				end
			end
		end

		var_0_0.widgets.fastChatWindow:registerScriptTouchHandler(var_10_2, false, true)
		var_0_0.widgets.fastChatWindow:setTouchEnabled(true)
		var_0_1.initFastChatContent()

		local function var_10_3(arg_14_0, arg_14_1, arg_14_2)
			if arg_14_0 == CCTOUCHBEGAN then
				if not var_0_0.widgets.privateAndBlacklistPanel:isVisible() then
					return false
				end

				if not tool.checkIfTouch(var_0_0.widgets.privateAndBlacklistPanel, arg_14_1, arg_14_2) then
					var_0_0.widgets.privateAndBlacklistPanel:setVisible(false)

					return false
				else
					return true
				end
			end
		end

		var_0_0.widgets.privateAndBlacklistPanel:registerScriptTouchHandler(var_10_3, false, true)
		var_0_0.widgets.privateAndBlacklistPanel:setTouchEnabled(true)

		local function var_10_4(arg_15_0, arg_15_1, arg_15_2)
			if arg_15_0 == CCTOUCHBEGAN then
				if not var_0_0.widgets.blacklistWindow:isVisible() then
					return false
				end

				if not tool.checkIfTouch(var_0_0.widgets.blacklistWindow, arg_15_1, arg_15_2) then
					var_1_8()

					return false
				else
					return true
				end
			end
		end

		var_0_0.widgets.blacklistWindow:registerScriptTouchHandler(var_10_4, false, true)
		var_0_0.widgets.blacklistWindow:setTouchEnabled(true)
		var_0_1.initBlacklist()
		var_0_1.getBlackList()
		var_0_0.widgets.privateToPlayerButton:addHandleOfControlEvent(var_0_1.privateChatTo, CCControlEventTouchUpInside)
		var_0_0.widgets.addToBlacklistButton:addHandleOfControlEvent(var_0_1.addToBlacklist, CCControlEventTouchUpInside)
		var_0_0.widgets.privateOkButton:addHandleOfControlEvent(var_0_1.changeChannelToPrivate, CCControlEventTouchUpInside)
		var_0_0.widgets.privateCancelButton:addHandleOfControlEvent(var_1_5, CCControlEventTouchUpInside)

		if user.isYw and smgr.currentSceneTag == SCENE_JUBEN or user.isSoldiersThreeRoad and smgr.currentSceneTag == SCENE_KFYZ_WORLD and user.player.kfgzForceId > 1000 then
			var_0_1.changeChannelToThreeYZ()
		end

		if var_0_1.channel == chatEnum.type.private then
			var_0_1.changeChannelButtonTitle(var_0_1.to)
		end

		local var_10_5 = require("lua/layer/chat/messageView")

		var_10_5:init(var_0_0.widgets.background, var_0_1, user.player.chatMessageList)

		var_0_1.msgView = var_10_5
	end

	function var_0_0.widgets.window.onExit(...)
		return
	end

	local function var_1_9(arg_17_0, arg_17_1, arg_17_2)
		return true
	end

	var_0_0.widgets.window:setTouchEnabled(true)
	var_0_0.widgets.window:registerScriptTouchHandler(var_1_9, false, true)
	initScriptEventNode(var_0_0.widgets.window)

	local var_1_10 = smgr.getLayer("topLayer")

	var_1_10:removeAllChildrenWithCleanup(true)
	var_1_10:addChild(var_0_0.widgets.window)

	if guide.ui.isVisible() == true then
		guide.control.isHideByTemp = true

		guide.ui.setVisible(false)
	end
end

function var_0_0.showFastChatPanel(arg_18_0, arg_18_1, arg_18_2)
	rmgr.loadResource("res/ui/chat/chat.plist")

	local var_18_0 = require("res/layout/chat/fastChatLayout")

	uiutil.initLayout(arg_18_0, var_18_0)

	function arg_18_0.widgets.panel.onEnter(...)
		arg_18_0.widgets.panel:setOpacity(0)
		var_0_1:initWithView(var_0_0)
		eventManager.registerEvent("pushChat", var_0_1.updateChat)
	end

	function arg_18_0.widgets.panel.onExit(...)
		var_0_1:destory()
		eventManager.unregisterEvent("pushChat", var_0_1.updateChat)
	end

	arg_18_0.widgets.chatLightSprite:setOpacity(0)
	arg_18_0.widgets.openChatWindowButton:addHandleOfControlEvent(arg_18_0.showChatWindow, CCControlEventTouchUpInside)
	initScriptEventNode(arg_18_0.widgets.panel)

	if arg_18_1 then
		if arg_18_2 then
			arg_18_1:addChild(arg_18_0.widgets.panel, arg_18_2)
		else
			arg_18_1:addChild(arg_18_0.widgets.panel)
		end
	end
end

return var_0_0
