require("lua/layer/playerInfo2/ui")

local var_0_0 = class("Huigui", function()
	return createBaseLayer()
end)
local var_0_1 = {
	nil,
	nil,
	3,
	4,
	6,
	[81] = 24,
	freeHuanyin = 41,
	[42] = 5,
	[100] = 100,
	[19] = 19,
	[101] = 15,
	[21] = 7,
	[102] = 41,
	[119] = 10033,
	xinlian = 15,
	[116] = 55,
	[47] = 10055,
	[126] = 10030
}
local var_0_2 = {
	bg = {
		name = "backgroundPic",
		type = "pic_9",
		pic = "frame:bigPanel.png",
		preferedSize = CCSizeMake(960, 580),
		middleRect = CCRectMake(30, 30, 45, 45),
		x = visibleSize.width / 2,
		y = visibleSize.height / 2 - 30,
		anchorPoint = ccp(0.5, 0.5),
		children = {
			{
				type = "pic",
				pic = "res/ui/activity/furnace/sdyjs_bg1.jpg",
				width = visibleSize.width,
				height = visibleSize.height,
				x = visibleSize.width / 2,
				y = visibleSize.height / 2 - 30,
				anchorPoint = ccp(0, 0),
				children = {
					{
						fontSize = 25,
						name = "leftTime",
						ycenter = 220,
						type = "label",
						xcenter = 355,
						font = "Thonburi-Bold",
						text = language.get(131002, "1"),
						anchorPoint = ccp(0, 0),
						color = ccc3(253, 98, 98)
					},
					{
						xcenter = -420,
						name = "bestreward",
						type = "label",
						ycenter = 195,
						fontSize = 22,
						font = "Thonburi-Bold",
						text = language.get(136695),
						color = ccc3(255, 212, 38)
					},
					{
						xcenter = 3,
						z = 400,
						type = "pic",
						ycenter = 230,
						pic = "res/ui/activity/huigui/zhxfl_biaoti_zhxfl.png"
					},
					{
						xcenter = 0,
						name = "bg",
						type = "pic",
						ycenter = -40,
						pic = "res/ui/activity/huigui/zhxfl_di.png",
						children = {
							{
								xcenter = -326,
								ycenter = -50,
								pic = "res/ui/activity/huigui/zhxfl_meishuzi_hysyzhly.png",
								type = "pic"
							},
							{
								xcenter = -323,
								name = "bg2",
								type = "pic",
								ycenter = 0,
								pic = "res/ui/activity/huigui/zhxfl_zuo_di.png",
								children = {
									{
										xcenter = -323,
										ycenter = 5,
										pic = "res/ui/activity/huigui/zhxfl_shurukuang.png",
										type = "pic"
									},
									{
										xcenter = 0,
										name = "zhaohuima",
										type = "label",
										ycenter = -124,
										fontSize = 22,
										font = "Thonburi-Bold",
										text = language.get(136696),
										color = ccc3(114, 223, 55)
									},
									{
										fontSize = 22,
										name = "zhaohuima1",
										xcenter = 0,
										type = "label",
										ycenter = -110,
										font = "Thonburi-Bold",
										visible = false,
										text = language.get(136697),
										color = ccc3(255, 255, 255)
									},
									{
										xcenter = 0,
										ycenter = -180,
										type = "button",
										buttons = {
											{
												pic2 = "res/ui/activity/xinfuhuikui/xfhk_btn_2.png",
												name = "bangding",
												pic1 = "res/ui/activity/xinfuhuikui/xfhk_btn_1.png",
												children = {
													{
														xcenter = 0,
														ycenter = 0,
														pic = "res/ui/activity/huigui/zhxfl_btn_meishuzi_fz.png",
														type = "pic"
													}
												}
											}
										}
									},
									{
										xcenter = 0,
										ycenter = -180,
										type = "button",
										buttons = {
											{
												pic2 = "res/ui/activity/xinfuhuikui/xfhk_btn_2.png",
												name = "yanzheng",
												pic1 = "res/ui/activity/xinfuhuikui/xfhk_btn_1.png",
												children = {
													{
														xcenter = 0,
														ycenter = 0,
														pic = "res/ui/activity/huigui/zhxfl_btn_meishuzi_yz.png",
														type = "pic"
													}
												}
											}
										}
									}
								}
							},
							{
								fontSize = 22,
								name = "friend",
								ycenter = 190,
								type = "label",
								xcenter = -160,
								font = "Thonburi-Bold",
								text = language.get(136698),
								anchorPoint = ccp(0, 0.5),
								color = ccc3(253, 98, 98)
							},
							{
								xcenter = -160,
								name = "titlecell1",
								text = "",
								type = "label",
								ycenter = 136,
								fontSize = 20,
								font = "Thonburi-Bold",
								color = ccc3(255, 255, 200)
							},
							{
								xcenter = -160,
								name = "progress1",
								text = "",
								type = "label",
								ycenter = 136,
								fontSize = 20,
								font = "Thonburi-Bold",
								color = ccc3(255, 255, 200)
							},
							{
								xcenter = 360,
								name = "dc1",
								visible = false,
								type = "pic",
								ycenter = 120,
								pic = "res/ui/activity/huigui/zhxfl_icon_dc.png"
							},
							{
								xcenter = -160,
								name = "goldstr1",
								type = "label",
								ycenter = 101,
								fontSize = 20,
								font = "Thonburi-Bold",
								text = language.get(390456),
								color = ccc3(255, 212, 38)
							},
							{
								xcenter = -40,
								name = "gold1",
								text = "",
								type = "label",
								ycenter = 101,
								fontSize = 20,
								font = "Thonburi-Bold",
								color = ccc3(255, 212, 38)
							},
							{
								xcenter = -90,
								name = "goldpic1",
								type = "pic",
								ycenter = 101,
								pic = "res/ui/activity/huigui/zhxfl_icon_yuanbao.png"
							},
							{
								xcenter = 360,
								ycenter = 120,
								type = "button",
								buttons = {
									{
										pic2 = "res/ui/messagebox/btn_no_c.png",
										name = "lingqu1",
										pic1 = "res/ui/messagebox/btn_no_a.png",
										children = {
											{
												xcenter = 0,
												font = "Thonburi-Bold",
												fontSize = 22,
												type = "label",
												ycenter = 0,
												text = language.get(111008),
												color = ccc3(255, 255, 255)
											}
										}
									}
								}
							},
							{
								xcenter = 360,
								ycenter = 120,
								type = "button",
								buttons = {
									{
										pic2 = "res/ui/messagebox/btn_yes_c.png",
										name = "qianwang1",
										pic1 = "res/ui/messagebox/btn_yes_a.png",
										children = {
											{
												xcenter = 0,
												font = "Thonburi-Bold",
												fontSize = 22,
												type = "label",
												ycenter = 0,
												text = language.get(72005),
												color = ccc3(255, 255, 255)
											}
										}
									}
								}
							},
							{
								xcenter = -160,
								name = "titlecell2",
								text = "",
								type = "label",
								ycenter = 46,
								fontSize = 20,
								font = "Thonburi-Bold",
								color = ccc3(255, 255, 200)
							},
							{
								xcenter = -160,
								name = "progress2",
								text = "",
								type = "label",
								ycenter = 136,
								fontSize = 20,
								font = "Thonburi-Bold",
								color = ccc3(255, 255, 200)
							},
							{
								xcenter = 360,
								name = "dc2",
								visible = false,
								type = "pic",
								ycenter = 25,
								pic = "res/ui/activity/huigui/zhxfl_icon_dc.png"
							},
							{
								xcenter = -160,
								name = "goldstr2",
								type = "label",
								ycenter = 11,
								fontSize = 20,
								font = "Thonburi-Bold",
								text = language.get(390456),
								color = ccc3(255, 212, 38)
							},
							{
								xcenter = -40,
								name = "gold2",
								text = "",
								type = "label",
								ycenter = 11,
								fontSize = 20,
								font = "Thonburi-Bold",
								color = ccc3(255, 212, 38)
							},
							{
								xcenter = -90,
								name = "goldpic2",
								type = "pic",
								ycenter = 11,
								pic = "res/ui/activity/huigui/zhxfl_icon_yuanbao.png"
							},
							{
								xcenter = 360,
								ycenter = 25,
								type = "button",
								buttons = {
									{
										pic2 = "res/ui/messagebox/btn_no_c.png",
										name = "lingqu2",
										pic1 = "res/ui/messagebox/btn_no_a.png",
										children = {
											{
												xcenter = 0,
												font = "Thonburi-Bold",
												fontSize = 22,
												type = "label",
												ycenter = 0,
												text = language.get(111008),
												color = ccc3(255, 255, 255)
											}
										}
									}
								}
							},
							{
								xcenter = 360,
								ycenter = 25,
								type = "button",
								buttons = {
									{
										pic2 = "res/ui/messagebox/btn_yes_c.png",
										name = "qianwang2",
										pic1 = "res/ui/messagebox/btn_yes_a.png",
										children = {
											{
												xcenter = 0,
												font = "Thonburi-Bold",
												fontSize = 22,
												type = "label",
												ycenter = 0,
												text = language.get(72005),
												color = ccc3(255, 255, 255)
											}
										}
									}
								}
							},
							{
								xcenter = -160,
								name = "titlecell3",
								text = "",
								type = "label",
								ycenter = -54,
								fontSize = 20,
								font = "Thonburi-Bold",
								color = ccc3(255, 255, 200)
							},
							{
								xcenter = -160,
								name = "progress3",
								text = "",
								type = "label",
								ycenter = 136,
								fontSize = 20,
								font = "Thonburi-Bold",
								color = ccc3(255, 255, 200)
							},
							{
								xcenter = 360,
								name = "dc3",
								visible = false,
								type = "pic",
								ycenter = -70,
								pic = "res/ui/activity/huigui/zhxfl_icon_dc.png"
							},
							{
								xcenter = -160,
								name = "goldstr3",
								type = "label",
								ycenter = -89,
								fontSize = 20,
								font = "Thonburi-Bold",
								text = language.get(390456),
								color = ccc3(255, 212, 38)
							},
							{
								xcenter = -90,
								name = "goldpic3",
								type = "pic",
								ycenter = -89,
								pic = "res/ui/activity/huigui/zhxfl_icon_yuanbao.png"
							},
							{
								xcenter = -40,
								name = "gold3",
								text = "",
								type = "label",
								ycenter = -89,
								fontSize = 20,
								font = "Thonburi-Bold",
								color = ccc3(255, 212, 38)
							},
							{
								xcenter = 360,
								ycenter = -70,
								type = "button",
								buttons = {
									{
										pic2 = "res/ui/messagebox/btn_no_c.png",
										name = "lingqu3",
										pic1 = "res/ui/messagebox/btn_no_a.png",
										children = {
											{
												xcenter = 0,
												font = "Thonburi-Bold",
												fontSize = 22,
												type = "label",
												ycenter = 0,
												text = language.get(111008),
												color = ccc3(255, 255, 255)
											}
										}
									}
								}
							},
							{
								xcenter = 360,
								ycenter = -70,
								type = "button",
								buttons = {
									{
										pic2 = "res/ui/messagebox/btn_yes_c.png",
										name = "qianwang3",
										pic1 = "res/ui/messagebox/btn_yes_a.png",
										children = {
											{
												xcenter = 0,
												font = "Thonburi-Bold",
												fontSize = 22,
												type = "label",
												ycenter = 0,
												text = language.get(72005),
												color = ccc3(255, 255, 255)
											}
										}
									}
								}
							},
							{
								xcenter = -160,
								name = "titlecell4",
								text = "",
								type = "label",
								ycenter = -144,
								fontSize = 20,
								font = "Thonburi-Bold",
								color = ccc3(255, 255, 200)
							},
							{
								xcenter = -160,
								name = "progress4",
								text = "",
								type = "label",
								ycenter = 136,
								fontSize = 20,
								font = "Thonburi-Bold",
								color = ccc3(255, 255, 200)
							},
							{
								xcenter = 360,
								name = "dc4",
								visible = false,
								type = "pic",
								ycenter = -165,
								pic = "res/ui/activity/huigui/zhxfl_icon_dc.png"
							},
							{
								xcenter = -160,
								name = "goldstr4",
								type = "label",
								ycenter = -179,
								fontSize = 20,
								font = "Thonburi-Bold",
								text = language.get(390456),
								color = ccc3(255, 212, 38)
							},
							{
								xcenter = -40,
								name = "gold4",
								text = "",
								type = "label",
								ycenter = -179,
								fontSize = 20,
								font = "Thonburi-Bold",
								color = ccc3(255, 212, 38)
							},
							{
								xcenter = -90,
								name = "goldpic4",
								type = "pic",
								ycenter = -179,
								pic = "res/ui/activity/huigui/zhxfl_icon_yuanbao.png"
							},
							{
								xcenter = 360,
								ycenter = -165,
								type = "button",
								buttons = {
									{
										pic2 = "res/ui/messagebox/btn_no_c.png",
										name = "lingqu4",
										pic1 = "res/ui/messagebox/btn_no_a.png",
										children = {
											{
												xcenter = 0,
												font = "Thonburi-Bold",
												fontSize = 22,
												type = "label",
												ycenter = 0,
												text = language.get(111008),
												color = ccc3(255, 255, 255)
											}
										}
									}
								}
							},
							{
								xcenter = 360,
								ycenter = -165,
								type = "button",
								buttons = {
									{
										pic2 = "res/ui/messagebox/btn_yes_c.png",
										name = "qianwang4",
										pic1 = "res/ui/messagebox/btn_yes_a.png",
										children = {
											{
												xcenter = 0,
												font = "Thonburi-Bold",
												fontSize = 22,
												type = "label",
												ycenter = 0,
												text = language.get(72005),
												color = ccc3(255, 255, 255)
											}
										}
									}
								}
							}
						}
					},
					{
						xcenter = 440,
						ycenter = 300,
						type = "button",
						buttons = {
							{
								pic2 = "frame:btn_close_c.png",
								name = "closeButton",
								pic1 = "frame:btn_close_a.png",
								scale = 2
							}
						}
					}
				}
			}
		}
	}
}

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.uidata = var_0_2

	arg_2_0:registerScriptHandler(function(arg_3_0)
		if arg_3_0 == "enter" then
			arg_2_0:onEnter()
		elseif arg_3_0 == "exit" then
			arg_2_0:onExit()
		end
	end)
	arg_2_0:setTouchEnabled(true)
	arg_2_0:registerScriptTouchHandler(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == CCTOUCHBEGAN then
			arg_2_0:onTouchBegan(arg_4_1, arg_4_2)

			return true
		elseif arg_4_0 == CCTOUCHMOVED then
			arg_2_0:onTouchMoved(arg_4_1, arg_4_2)

			return true
		elseif arg_4_0 == CCTOUCHENDED then
			arg_2_0:onTouchEnded(arg_4_1, arg_4_2)

			return true
		end
	end, false, true)
	arg_2_0:init(arg_2_1)
end

local function var_0_3(arg_5_0)
	local function var_5_0(arg_6_0)
		if arg_6_0 > math.floor(arg_6_0) then
			if arg_6_0 < 10 then
				arg_6_0 = string.format("%.1f", arg_6_0)
			else
				arg_6_0 = math.floor(arg_6_0)
			end
		end

		return arg_6_0
	end

	local var_5_1

	if arg_5_0 < 10000 then
		var_5_1 = tostring(arg_5_0)
	else
		local var_5_2 = arg_5_0 / 10000

		var_5_1 = language.get(750211, var_5_0(var_5_2))
	end

	return var_5_1
end

function var_0_0.init(arg_7_0, arg_7_1)
	arg_7_0.uiTable = autoUI.initUI(arg_7_0, arg_7_0.uidata)

	arg_7_0.uiTable.closeButton:registerScriptTapHandler(function()
		arg_7_0:close()
	end)

	local function var_7_0(arg_9_0)
		local var_9_0 = arg_9_0.action.data

		log.info("@@ 奖励")

		if var_9_0.rewards then
			local var_9_1 = {}

			for iter_9_0 = 1, #var_9_0.rewards do
				local var_9_2 = {
					id = var_0_1[var_9_0.rewards[iter_9_0].type or var_9_0.rewards[iter_9_0].pic]
				}

				var_9_2.id = var_9_2.id or 3
				var_9_2.value = var_9_0.rewards[iter_9_0].num

				table.insert(var_9_1, var_9_2)
			end

			globalAction_gotResource(var_9_1)
		end

		arg_7_0:refresh()
	end

	arg_7_0.uiTable.lingqu1:registerScriptTapHandler(function()
		showTable(arg_7_0.currIndexs)
		cmgr.sendRequest(var_7_0, actions.getHUIGUIReward, arg_7_0.currIndexs[1].id)
	end)
	arg_7_0.uiTable.lingqu2:registerScriptTapHandler(function()
		showTable(arg_7_0.currIndexs)
		cmgr.sendRequest(var_7_0, actions.getHUIGUIReward, arg_7_0.currIndexs[2].id)
	end)
	arg_7_0.uiTable.lingqu3:registerScriptTapHandler(function()
		showTable(arg_7_0.currIndexs)
		cmgr.sendRequest(var_7_0, actions.getHUIGUIReward, arg_7_0.currIndexs[3].id)
	end)
	arg_7_0.uiTable.lingqu4:registerScriptTapHandler(function()
		showTable(arg_7_0.currIndexs)
		cmgr.sendRequest(var_7_0, actions.getHUIGUIReward, arg_7_0.currIndexs[4].id)
	end)
	arg_7_0.uiTable.qianwang1:registerScriptTapHandler(function()
		if smgr.currentSceneTag == SCENE_WORLD then
			smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
		else
			smgr.changeScene(SCENE_WORLD)
		end
	end)
	arg_7_0.uiTable.qianwang2:registerScriptTapHandler(function()
		if smgr.currentSceneTag == SCENE_WORLD then
			smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
		else
			smgr.changeScene(SCENE_WORLD)
		end
	end)
	arg_7_0.uiTable.qianwang3:registerScriptTapHandler(function()
		if smgr.currentSceneTag == SCENE_WORLD then
			smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
		else
			smgr.changeScene(SCENE_WORLD)
		end
	end)
	arg_7_0.uiTable.qianwang4:registerScriptTapHandler(function()
		playerInfo2.ui.show(2)
	end)
	arg_7_0.uiTable.bangding:registerScriptTapHandler(function()
		if arg_7_0.inviteCode then
			DeviceProxy:copyToClipboard(arg_7_0.inviteCode)
			smgr.showTipTextGreen(language.get("450002_yyl"))
		end
	end)
	arg_7_0:showPanel(arg_7_1)
end

function var_0_0.refresh(arg_19_0)
	local function var_19_0(arg_20_0)
		arg_19_0:showPanel(arg_20_0.action.data)
	end

	cmgr.sendRequest(var_19_0, actions.getHUIGUI)
end

function var_0_0.showPanel(arg_21_0, arg_21_1)
	arg_21_0.data = arg_21_1

	if arg_21_0.data then
		showTable(arg_21_0.data)
	else
		return
	end

	local function var_21_0(arg_22_0, arg_22_1)
		local var_22_0, var_22_1 = arg_22_1:getPosition()

		arg_22_1:setPosition(ccp(var_22_0, var_22_1))

		local var_22_2 = arg_22_0 / 1000

		if var_22_2 < 3600 then
			arg_22_1:setString("")

			local var_22_3 = createTimerLabel(var_22_2 * 1000, language.get(131003), "Thonburi", 22, nil, nil, nil, ccc3(255, 0, 0))

			arg_22_1:addChild(var_22_3)
		elseif var_22_2 < 86400 then
			local var_22_4 = var_22_2 / 3600

			arg_22_1:setString(language.get(131001, tool.toint(var_22_4)))
		else
			local var_22_5 = var_22_2 / 3600 / 24

			arg_22_1:setString(language.get(131002, tool.toint(var_22_5)))
		end
	end

	if arg_21_0.data.isReturnPlayer then
		arg_21_0.uiTable.zhaohuima:setVisible(false)
		arg_21_0.uiTable.bangding:setVisible(false)

		if arg_21_0.data.isInvited then
			arg_21_0.uiTable.zhaohuima1:setVisible(false)
			arg_21_0.uiTable.yanzheng:setVisible(false)
			arg_21_0.uiTable.bg2:setVisible(false)
		else
			local var_21_1 = CCScale9Sprite:create("res/ui/activity/huigui/zhxfl_shurukuang.png")
			local var_21_2 = CCEditBox:create(CCSizeMake(207, 29), var_21_1)

			var_21_2:setPosition(ccp(arg_21_0.uiTable.zhaohuima1:getPositionX(), arg_21_0.uiTable.zhaohuima1:getPositionY() - 30))
			var_21_2:setMaxLength(15)
			var_21_2:setReturnType(1)
			arg_21_0.uiTable.bg2:addChild(var_21_2, 2, 111)

			local function var_21_3(arg_23_0, arg_23_1)
				local var_23_0 = tolua.cast(arg_23_1, "CCEditBox")

				log.info("editBox", arg_23_0)

				if arg_23_0 == "began" then
					var_23_0:setText("")
				elseif arg_23_0 == "changed" then
					arg_21_0.inviteCode = var_23_0:getText()

					var_23_0:setText(arg_21_0.inviteCode)
					log.info(var_23_0:getText())
				elseif arg_23_0 == "ended" then
					arg_21_0.inviteCode = var_23_0:getText()

					var_23_0:setText(arg_21_0.inviteCode)
					log.info(var_23_0:getText())
				end
			end

			var_21_2:registerScriptEditBoxHandler(var_21_3)
			arg_21_0.uiTable.zhaohuima1:setVisible(true)
			arg_21_0.uiTable.yanzheng:setVisible(true)

			local function var_21_4(arg_24_0)
				local var_24_0 = arg_24_0.action.data

				log.info("@@ 绑定")

				if arg_24_0.state == 1 then
					smgr.showTipTextGreen(language.get(136694))
				end

				arg_21_0:refresh()
			end

			arg_21_0.uiTable.yanzheng:registerScriptTapHandler(function()
				local var_25_0 = tolua.cast(arg_21_0.uiTable.bg2:getChildByTag(111), "CCEditBox"):getText()

				arg_21_0.inviteCode = var_25_0

				if arg_21_0.inviteCode then
					cmgr.sendRequest(var_21_4, actions.getHUIGUIAccept, arg_21_0.inviteCode)
				else
					smgr.showTipTextGreen(language.get(136693))
				end
			end)
		end
	elseif arg_21_0.data.isInvited then
		arg_21_0.uiTable.zhaohuima:setVisible(false)
		arg_21_0.uiTable.bangding:setVisible(false)
		arg_21_0.uiTable.bg2:setVisible(false)
	else
		arg_21_0.inviteCode = arg_21_0.data.inviteCode

		arg_21_0.uiTable.zhaohuima:setString(language.get(136696) .. arg_21_0.inviteCode)
		arg_21_0.uiTable.yanzheng:setVisible(false)
		arg_21_0.uiTable.bangding:setVisible(true)
	end

	arg_21_0.currIndexs = {}

	var_21_0(arg_21_0.data.cd, arg_21_0.uiTable.leftTime)
	arg_21_0.uiTable.leftTime:setAnchorPoint(ccp(0, 0.5))
	arg_21_0.uiTable.bestreward:setAnchorPoint(ccp(0, 0.5))

	local var_21_5 = arg_21_0.data.taskList

	for iter_21_0, iter_21_1 in ipairs(var_21_5) do
		local var_21_6 = iter_21_1.id
		local var_21_7 = var_0_3(iter_21_1.targetNum)
		local var_21_8 = var_0_3(iter_21_1.curNum)
		local var_21_9 = iter_21_1.intro
		local var_21_10 = {
			id = var_21_6
		}

		table.insert(arg_21_0.currIndexs, var_21_10)

		local var_21_11 = CCNode:create()

		arg_21_0.uiTable["gold" .. iter_21_0]:setString(iter_21_1.rewards)
		arg_21_0.uiTable["goldstr" .. iter_21_0]:setAnchorPoint(ccp(0, 0.5))
		arg_21_0.uiTable["goldpic" .. iter_21_0]:setPosition(ccp(arg_21_0.uiTable["goldstr" .. iter_21_0]:getPositionX() + arg_21_0.uiTable["goldstr" .. iter_21_0]:getContentSize().width, arg_21_0.uiTable["goldstr" .. iter_21_0]:getPositionY()))
		arg_21_0.uiTable["goldpic" .. iter_21_0]:setAnchorPoint(ccp(0, 0.5))
		arg_21_0.uiTable["gold" .. iter_21_0]:setPosition(ccp(arg_21_0.uiTable["goldstr" .. iter_21_0]:getPositionX() + arg_21_0.uiTable["goldpic" .. iter_21_0]:getContentSize().width + arg_21_0.uiTable["goldstr" .. iter_21_0]:getContentSize().width, arg_21_0.uiTable["goldstr" .. iter_21_0]:getPositionY()))
		arg_21_0.uiTable["gold" .. iter_21_0]:setAnchorPoint(ccp(0, 0.5))
		arg_21_0.uiTable["titlecell" .. iter_21_0]:setString(var_21_9)
		arg_21_0.uiTable["titlecell" .. iter_21_0]:setAnchorPoint(ccp(0, 0.5))
		arg_21_0.uiTable.friend:setAnchorPoint(ccp(0, 0.5))

		local var_21_12 = "(" .. var_21_8 .. "/" .. var_21_7 .. ")"

		arg_21_0.uiTable["progress" .. iter_21_0]:setString(var_21_12)
		arg_21_0.uiTable["progress" .. iter_21_0]:setPosition(ccp(arg_21_0.uiTable["titlecell" .. iter_21_0]:getPositionX() + arg_21_0.uiTable["titlecell" .. iter_21_0]:getContentSize().width, arg_21_0.uiTable["titlecell" .. iter_21_0]:getPositionY()))
		arg_21_0.uiTable["progress" .. iter_21_0]:setColor(ccc3(114, 223, 55))
		arg_21_0.uiTable["progress" .. iter_21_0]:setAnchorPoint(ccp(0, 0.5))

		if arg_21_0.data.isInvited then
			arg_21_0.uiTable.friend:setString(language.get(136699) .. arg_21_0.data.friendName)
			arg_21_0.uiTable["qianwang" .. iter_21_0]:setEnabled(true)

			if iter_21_1.isRewarded then
				arg_21_0.uiTable["dc" .. iter_21_0]:setVisible(true)
				arg_21_0.uiTable["lingqu" .. iter_21_0]:setVisible(false)
				arg_21_0.uiTable["qianwang" .. iter_21_0]:setVisible(false)
			else
				arg_21_0.uiTable["dc" .. iter_21_0]:setVisible(false)

				if iter_21_1.isFinished then
					arg_21_0.uiTable["lingqu" .. iter_21_0]:setVisible(true)
					arg_21_0.uiTable["qianwang" .. iter_21_0]:setVisible(false)
					arg_21_0.uiTable["progress" .. iter_21_0]:setColor(ccc3(255, 189, 66))
				else
					arg_21_0.uiTable["lingqu" .. iter_21_0]:setVisible(false)
					arg_21_0.uiTable["qianwang" .. iter_21_0]:setVisible(true)
				end
			end
		else
			arg_21_0.uiTable["lingqu" .. iter_21_0]:setVisible(false)
			arg_21_0.uiTable["qianwang" .. iter_21_0]:setVisible(true)
			arg_21_0.uiTable["qianwang" .. iter_21_0]:setEnabled(false)
		end
	end
end

function var_0_0.onEnter(arg_26_0)
	log.info("@@ 召回")
end

function var_0_0.onExit(arg_27_0)
	return
end

function var_0_0.onTouchBegan(arg_28_0, arg_28_1, arg_28_2)
	return
end

function var_0_0.onTouchMoved(arg_29_0, arg_29_1, arg_29_2)
	arg_29_0.isTouchOn = false
end

function var_0_0.onTouchEnded(arg_30_0, arg_30_1, arg_30_2)
	arg_30_0.isTouchOn = false
end

function var_0_0.onTouchCancelled(arg_31_0, arg_31_1, arg_31_2)
	arg_31_0.isTouchOn = false
end

function var_0_0.close(arg_32_0)
	arg_32_0:removeFromParentAndCleanup(true)
end

return var_0_0
