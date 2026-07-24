local var_0_0 = class("KfPlayerInfoLayer", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.world = arg_2_1
	arg_2_0.onEnter = handler(arg_2_0, arg_2_0.onEnter)
	arg_2_0.onExit = handler(arg_2_0, arg_2_0.onExit)
end

function var_0_0.handlerGetWorldMapAction(arg_3_0, arg_3_1)
	arg_3_0.data = arg_3_1.data
	arg_3_0.time = arg_3_0.data.cd

	arg_3_0:initExpand(false)
end

function var_0_0.initExpand(arg_4_0, arg_4_1)
	arg_4_0.isOpen = arg_4_1

	arg_4_0:removeAllChildrenWithCleanup(true)
	eventManager.dispatchEvent("kfyzNoticeSetVisible", not arg_4_0.isOpen)

	if arg_4_0.isOpen == true then
		playerInfoUI.show()
		smgr.hideNotice()

		arg_4_0.uiTable = autoUI.initUI(arg_4_0, arg_4_0:getUiDataExpand())

		arg_4_0.uiTable.bg_yz:setOpacity(0)
		arg_4_0.uiTable.bg_sd:setOpacity(0)
		arg_4_0.uiTable.bg_yz:setVisible(not user.isInSd)
		arg_4_0.uiTable.bg_sd:setVisible(user.isInSd)

		if arg_4_0.data.serverName4 and arg_4_0.data.serverName1 and arg_4_0.data.nationName4 then
			arg_4_0.uiTable.leftServerName:setString(tool.getServerName(arg_4_0.data.serverName4) .. language.get(460037, arg_4_0.data.nationName4))
			arg_4_0.uiTable.rightServerName:setString(tool.getServerName(arg_4_0.data.serverName1))
		end

		if arg_4_0.data.servers then
			for iter_4_0, iter_4_1 in pairs(arg_4_0.data.servers) do
				if iter_4_1.forceId == user.player.kfgzForceId then
					for iter_4_2, iter_4_3 in pairs(arg_4_0.data.nationNames) do
						if iter_4_3.forceId == iter_4_1.forceId then
							if type(iter_4_1.serverName) == "userdata" or type(iter_4_3.nationName) == "userdata" then
								arg_4_0.uiTable.leftServerName:setString("NPC")
							else
								arg_4_0.uiTable.leftServerName:setString(tool.getServerName(iter_4_1.serverName) .. language.get(460037, iter_4_3.nationName))
							end
						end
					end
				elseif math.abs(iter_4_1.forceId - user.player.kfgzForceId) == 1000 then
					if user.kfyzWorldId == 9 then
						for iter_4_4, iter_4_5 in pairs(arg_4_0.data.nationNames) do
							if iter_4_5.forceId == iter_4_1.forceId then
								if type(iter_4_1.serverName) == "userdata" or type(iter_4_5.nationName) == "userdata" then
									arg_4_0.uiTable.rightServerName:setString("NPC")
								else
									arg_4_0.uiTable.rightServerName:setString(tool.getServerName(iter_4_1.serverName) .. language.get(460037, iter_4_5.nationName))
								end
							end
						end
					elseif type(iter_4_1.serverName) == "userdata" then
						arg_4_0.uiTable.rightServerName:setString("NPC")
					else
						arg_4_0.uiTable.rightServerName:setString(tool.getServerName(iter_4_1.serverName))
					end
				end
			end
		end

		local var_4_0

		if user.jpsIndex == 1 then
			var_4_0 = "222404_dongying"
		elseif user.jpsIndex == 2 then
			var_4_0 = "222405_dongying"
		elseif user.jpsIndex == 3 then
			var_4_0 = "222406_dongying"
		elseif user.jpsIndex == 4 then
			var_4_0 = "222493_dongying"
		elseif user.jpsIndex == 5 then
			var_4_0 = 136552
		elseif user.jpsIndex == 6 then
			var_4_0 = 136553
		elseif user.jpsIndex == 7 then
			var_4_0 = 136554
		end

		if var_4_0 then
			arg_4_0.uiTable.rightServerName:setString(language.get(var_4_0))
		end

		if user.jpsIndex == 0 and user.invastType == 1 and not user.isInSd and user.kfyzWorldId ~= 5 then
			local var_4_1 = 265
			local var_4_2 = arg_4_0.uiTable.lbl_info_yz
			local var_4_3 = arg_4_0.uiTable.timeLabel
			local var_4_4 = arg_4_0.uiTable.btn_tip
			local var_4_5 = var_4_2:getContentSize().width
			local var_4_6 = var_4_3:getContentSize().width
			local var_4_7 = var_4_4:getContentSize().width + 20
			local var_4_8 = var_4_5 + var_4_6 + var_4_7

			var_4_2:setPositionX(var_4_1 - var_4_8 / 2 + var_4_5 / 2)
			var_4_3:setPositionX(var_4_1 - var_4_8 / 2 + var_4_5 + var_4_6 / 2)
			var_4_4:setPositionX(var_4_1 - var_4_8 / 2 + var_4_5 + var_4_6 + var_4_7 / 2)
			arg_4_0.uiTable.btn_tip:registerScriptTapHandler(function()
				arg_4_0:showTips()
			end)
			arg_4_0.uiTable.btn_tip:setScale(0.85)
			arg_4_0.uiTable.btn_tip:setVisible(true)
		else
			local var_4_9 = 265
			local var_4_10 = user.isInSd and arg_4_0.uiTable.lbl_info_sd or arg_4_0.uiTable.lbl_info_yz
			local var_4_11 = arg_4_0.uiTable.timeLabel
			local var_4_12 = var_4_10:getContentSize().width
			local var_4_13 = var_4_11:getContentSize().width
			local var_4_14 = var_4_12 + var_4_13

			var_4_10:setPositionX(var_4_9 - var_4_14 / 2 + var_4_12 / 2)
			var_4_11:setPositionX(var_4_9 - var_4_14 / 2 + var_4_12 + var_4_13 / 2)
		end
	else
		if playerInfoUI and playerInfoUI.uiTable and playerInfoUI.uiTable.layer and not tolua.isnull(playerInfoUI.uiTable.layer) then
			playerInfoUI.uiTable.layer:removeFromParentAndCleanup(true)

			playerInfoUI.uiTable.layer = nil
		end

		arg_4_0.uiTable = autoUI.initUI(arg_4_0, arg_4_0:getUiData())

		arg_4_0.uiTable.bg_yz:setOpacity(0)
		arg_4_0.uiTable.bg_sd:setOpacity(0)
		arg_4_0.uiTable.bg_yz:setVisible(not user.isInSd)
		arg_4_0.uiTable.bg_sd:setVisible(user.isInSd)
		arg_4_0.uiTable.expandBtn:registerScriptTapHandler(function()
			eventManager.dispatchEvent("kfWorldExpandClick", true)
		end)
	end

	arg_4_0.uiTable.timeLabel:setString("")

	local var_4_15 = createTimerLabel(arg_4_0.time, arg_4_0.time > 3600000 and "@H:@M:@S" or "@M:@S", "Thonburi", 24, nil, nil, nil, ccc3(255, 0, 0))

	arg_4_0.uiTable.timeLabel:addChild(var_4_15)
end

function var_0_0.getUiData(arg_7_0)
	local var_7_0 = {}

	local function var_7_1(arg_8_0, arg_8_1)
		arg_8_0[#arg_8_0 + 1] = arg_8_1

		return arg_8_1
	end

	var_7_0.background = {
		left = 0,
		type = "pic",
		top = 0,
		pic = "res/ui/kfworld/kfgz_jxjd_bg_ss.png",
		children = {
			{
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/kfworld/kfgz_jxjd_btn_open_c.png",
						name = "expandBtn",
						pic1 = "res/ui/kfworld/kfgz_jxjd_btn_open_a.png",
						y = 56.5,
						x = 35.5
					}
				}
			},
			{
				visible = false,
				name = "bg_yz",
				type = "pic",
				anchorPointX = 0,
				pic = "res/ui/kfworld/kfgz_jxjd_bg_ss.png",
				y = 0,
				anchorPointY = 0,
				x = 0,
				children = {
					{
						x = 120,
						y = 56,
						pic = "res/ui/kfworld/kfgz_gzjs_icon_red.png",
						type = "pic"
					},
					{
						x = 325,
						y = 56,
						pic = "res/ui/kfworld/kfgz_gzjs_icon_blue.png",
						type = "pic"
					},
					{
						x = 225,
						y = 56,
						pic = "res/ui/kfyz/kfgz_gzjs_up_vs.png",
						type = "pic"
					}
				}
			},
			{
				visible = false,
				name = "bg_sd",
				type = "pic",
				anchorPointX = 0,
				pic = "res/ui/kfworld/kfgz_jxjd_bg_ss.png",
				y = 0,
				anchorPointY = 0,
				x = 0,
				children = {
					{
						x = 225,
						y = 54,
						pic = "res/ui/kfyz/kfyz_word_sdtb.png",
						type = "pic"
					}
				}
			},
			{
				fontSize = 24,
				name = "timeLabel",
				text = "00:00:00",
				type = "label",
				y = 56,
				x = 420,
				color = ccc3(255, 0, 0)
			}
		}
	}

	return var_7_0
end

function var_0_0.getUiDataExpand(arg_9_0)
	local var_9_0 = {}

	local function var_9_1(arg_10_0, arg_10_1)
		arg_10_0[#arg_10_0 + 1] = arg_10_1

		return arg_10_1
	end

	var_9_0.background = {
		xcenter = 0,
		type = "pic",
		top = 70,
		pic = "res/ui/kfworld/kfgz_jxjd_qk_bg.png",
		children = {
			{
				visible = false,
				name = "bg_yz",
				type = "pic",
				anchorPointX = 0,
				pic = "res/ui/kfworld/kfgz_jxjd_qk_bg.png",
				y = 0,
				anchorPointY = 0,
				x = 0,
				children = {
					{
						xcenter = -70,
						y = 68,
						pic = "res/ui/kfworld/kfgz_gzjs_icon_red.png",
						type = "pic"
					},
					{
						xcenter = 70,
						y = 68,
						pic = "res/ui/kfworld/kfgz_gzjs_icon_blue.png",
						type = "pic"
					},
					{
						xcenter = 0,
						y = 68,
						pic = "res/ui/kfyz/kfgz_gzjs_up_vs.png",
						type = "pic"
					},
					{
						name = "leftServerName",
						type = "label",
						anchorPointX = 1,
						fontSize = 25,
						xcenter = -120,
						y = 65,
						strokeSize = 1,
						text = language.get(430002),
						color = colorQuality[4],
						strokeColor = ccc3(22, 18, 13)
					},
					{
						name = "rightServerName",
						type = "label",
						anchorPointX = 0,
						fontSize = 25,
						xcenter = 120,
						y = 65,
						strokeSize = 1,
						text = language.get(430002),
						color = colorQuality[4],
						strokeColor = ccc3(22, 18, 13)
					},
					{
						name = "lbl_info_yz",
						strokeSize = 2,
						type = "label",
						fontSize = 24,
						y = 26,
						x = 220,
						text = language.get(390560),
						color = ccc3(235, 209, 167),
						strokeColor = ccc3(22, 18, 13)
					},
					{
						type = "button",
						buttons = {
							{
								pic2 = "frame:btnTip_c.png",
								name = "btn_tip",
								pic1 = "frame:btnTip_a.png",
								y = 26,
								visible = false,
								x = 220
							}
						}
					}
				}
			},
			{
				visible = false,
				name = "bg_sd",
				type = "pic",
				anchorPointX = 0,
				pic = "res/ui/kfworld/kfgz_jxjd_qk_bg.png",
				y = 0,
				anchorPointY = 0,
				x = 0,
				children = {
					{
						xcenter = 0,
						y = 65,
						pic = "res/ui/kfyz/kfyz_word_sdtb.png",
						type = "pic"
					},
					{
						name = "lbl_info_sd",
						strokeSize = 2,
						type = "label",
						fontSize = 24,
						y = 26,
						x = 220,
						text = language.get(390566),
						color = ccc3(235, 209, 167),
						strokeColor = ccc3(22, 18, 13)
					}
				}
			},
			{
				fontSize = 24,
				name = "timeLabel",
				text = "00:00:00",
				type = "label",
				y = 26,
				x = 320,
				color = ccc3(255, 0, 0)
			}
		}
	}

	return var_9_0
end

function var_0_0.showTips(arg_11_0)
	local var_11_0 = createBaseLayer()

	local function var_11_1(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == CCTOUCHBEGAN then
			-- block empty
		elseif arg_12_0 == CCTOUCHENDED then
			smgr.getLayer("topLayer"):removeChild(var_11_0, true)
		end

		return true
	end

	local var_11_2 = {
		tipsBg = {
			xcenter = 0,
			name = "bg",
			type = "pic_9_tips",
			anchorPointX = 0.5,
			ycenter = 0,
			pic = "frame:common_tip_frame_small.png",
			anchorPointY = 1,
			middleRect = CCRectMake(0, 0, 0, 0),
			preferedSize = CCSizeMake(290, 300),
			content = {
				{
					fontSize = 22,
					type = "label",
					text = language.get(390452),
					color = ccc3(244, 232, 178)
				},
				{
					fontSize = 22,
					type = "label",
					text = language.get(390453),
					color = ccc3(244, 232, 178)
				}
			}
		}
	}
	local var_11_3 = autoUI.initUI(var_11_0, var_11_2)

	var_11_0:registerScriptTouchHandler(var_11_1, false, true)
	var_11_0:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_11_0, 10002)
	var_11_0:setVisible(true)

	local var_11_4, var_11_5 = tool.getPositionInScreen(arg_11_0.uiTable.btn_tip)

	var_11_3.bg:setPositionY(var_11_5 - 25)
end

function var_0_0.update(arg_13_0, arg_13_1)
	if arg_13_0.time then
		arg_13_0.time = arg_13_0.time - arg_13_1 * 1000
		kfyzWorld.leftTime = arg_13_0.time
	end
end

function var_0_0.kfyzStateChg(arg_14_0)
	if arg_14_0.uiTable then
		arg_14_0.uiTable.bg_yz:setVisible(not user.isInSd)
		arg_14_0.uiTable.bg_sd:setVisible(user.isInSd)

		local var_14_0 = false

		if user.kfyzState == 1 or user.kfyzState == 2 and user.isInSd then
			var_14_0 = true
		end

		eventManager.dispatchEvent("sideGeneralSetVisible", var_14_0)
	end
end

function var_0_0.onEnter(arg_15_0)
	arg_15_0.expandEventRef = handler(arg_15_0, arg_15_0.initExpand)
	arg_15_0.kfyzStateChgRef = handler(arg_15_0, arg_15_0.kfyzStateChg)

	function arg_15_0.isOpenRef()
		return arg_15_0.isOpen
	end

	arg_15_0.updateRef = handler(arg_15_0, arg_15_0.update)

	eventManager.registerEvent("kfWorldExpandClick", arg_15_0.expandEventRef)
	eventManager.registerEvent("kfyzPlayerInfoIsOpen", arg_15_0.isOpenRef)
	eventManager.registerEvent("kfyzStateChg", arg_15_0.kfyzStateChgRef)

	arg_15_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(arg_15_0.updateRef, 0.1, false)
end

function var_0_0.onExit(arg_17_0)
	eventManager.unregisterEvent("kfWorldExpandClick", arg_17_0.expandEventRef)
	eventManager.unregisterEvent("kfyzPlayerInfoIsOpen", arg_17_0.isOpenRef)
	eventManager.unregisterEvent("kfyzStateChg", arg_17_0.kfyzStateChgRef)

	if arg_17_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_17_0.updateSchedulerEntry)
	end
end

return var_0_0
