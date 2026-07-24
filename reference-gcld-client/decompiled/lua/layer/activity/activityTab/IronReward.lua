local var_0_0 = colorQuality[5]
local var_0_1 = class("IronReward", function()
	return createBaseLayer()
end)
local var_0_2 = {
	bg = {
		xcenter = 0,
		type = "pic",
		ycenter = -30,
		pic = "res/ui/comment/bg1.jpg",
		children = {
			{
				xcenter = 0,
				name = "title",
				y = 485,
				type = "pic",
				pic = "res/ui/activity/ironReward/acti_tit_btjs.png"
			},
			{
				fontSize = 25,
				name = "actLefttime",
				type = "label",
				y = 485,
				x = 780,
				text = language.get(131022),
				color = colorQuality[5]
			},
			{
				xcenter = 0,
				name = "ironProgressBg",
				type = "pic",
				top = 90,
				pic = "res/ui/activity/ironReward/btjs_degr_view_bg.png",
				children = {
					{
						xcenter = 0,
						name = "actIronRewardBar",
						percentage = 20,
						type = "process",
						ycenter = 0,
						pic = "res/ui/activity/ironReward/btjs_degr_con.png",
						children = {
							{
								ycenter = 0,
								xcenter = -237,
								pic = "res/ui/activity/ironReward/btjs_degr_con_div.png",
								type = "pic"
							},
							{
								ycenter = 0,
								xcenter = -79,
								pic = "res/ui/activity/ironReward/btjs_degr_con_div.png",
								type = "pic"
							},
							{
								ycenter = 0,
								xcenter = 79,
								pic = "res/ui/activity/ironReward/btjs_degr_con_div.png",
								type = "pic"
							},
							{
								ycenter = 0,
								xcenter = 237,
								pic = "res/ui/activity/ironReward/btjs_degr_con_div.png",
								type = "pic"
							},
							{
								xcenter = -237,
								name = "actIronRewardIcon1",
								y = -80,
								type = "pic",
								scale = 0.75,
								pic = "res/ui/activity/ironReward/acti_iron_icon_1.jpg",
								children = {
									{
										xcenter = 0,
										name = "grayIcon1",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/ironReward/acti_iron_icon_1.jpg"
									},
									{
										fontSize = 26,
										type = "label",
										xcenter = 0,
										strokeSize = 2,
										y = 94,
										text = language.get(131162, 5),
										color = ccc3(188, 183, 183),
										strokeColor = ccc3(22, 18, 13)
									},
									{
										xcenter = 0,
										name = "animSprite1",
										type = "pic",
										ycenter = 0,
										pic = ""
									}
								}
							},
							{
								xcenter = -79,
								name = "actIronRewardIcon2",
								y = -80,
								type = "pic",
								scale = 0.75,
								pic = "res/ui/activity/ironReward/acti_iron_icon_2.jpg",
								children = {
									{
										xcenter = 0,
										name = "grayIcon2",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/ironReward/acti_iron_icon_2.jpg"
									},
									{
										fontSize = 26,
										type = "label",
										xcenter = 0,
										strokeSize = 2,
										y = 94,
										text = language.get(131162, 15),
										color = ccc3(188, 183, 183),
										strokeColor = ccc3(22, 18, 13)
									},
									{
										xcenter = 0,
										name = "animSprite2",
										type = "pic",
										ycenter = 0,
										pic = ""
									}
								}
							},
							{
								xcenter = 79,
								name = "actIronRewardIcon3",
								y = -80,
								type = "pic",
								scale = 0.75,
								pic = "res/ui/activity/ironReward/acti_iron_icon_5.jpg",
								children = {
									{
										xcenter = 0,
										name = "grayIcon3",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/ironReward/acti_iron_icon_5.jpg"
									},
									{
										fontSize = 26,
										type = "label",
										xcenter = 0,
										strokeSize = 2,
										y = 94,
										text = language.get(131162, 50),
										color = ccc3(188, 183, 183),
										strokeColor = ccc3(22, 18, 13)
									},
									{
										xcenter = 0,
										name = "animSprite3",
										type = "pic",
										ycenter = 0,
										pic = ""
									}
								}
							},
							{
								xcenter = 237,
								name = "actIronRewardIcon4",
								y = -80,
								type = "pic",
								scale = 0.75,
								pic = "res/ui/activity/ironReward/acti_iron_icon_3.jpg",
								children = {
									{
										xcenter = 0,
										name = "grayIcon4",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/ironReward/acti_iron_icon_3.jpg"
									},
									{
										fontSize = 26,
										type = "label",
										xcenter = 0,
										strokeSize = 2,
										y = 94,
										text = language.get(131162, 150),
										color = ccc3(188, 183, 183),
										strokeColor = ccc3(22, 18, 13)
									},
									{
										xcenter = 0,
										name = "animSprite4",
										type = "pic",
										ycenter = 0,
										pic = ""
									}
								}
							},
							{
								xcenter = 395,
								name = "actIronRewardIcon5",
								y = -80,
								type = "pic",
								scale = 0.75,
								pic = "res/ui/activity/ironReward/acti_iron_icon_4.jpg",
								children = {
									{
										xcenter = 0,
										name = "grayIcon5",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/ironReward/acti_iron_icon_4.jpg"
									},
									{
										fontSize = 26,
										type = "label",
										xcenter = 0,
										strokeSize = 2,
										y = 94,
										text = language.get(131162, 400),
										color = ccc3(188, 183, 183),
										strokeColor = ccc3(22, 18, 13)
									},
									{
										xcenter = 0,
										name = "animSprite5",
										type = "pic",
										ycenter = 0,
										pic = ""
									}
								}
							},
							{
								xcenter = -237,
								name = "actEffect_1",
								visible = false,
								type = "pic",
								ycenter = -138,
								pic = "res/ui/activity/ironReward/acti_text_icon_sbjs.png"
							},
							{
								xcenter = -79,
								name = "actEffect_2",
								visible = false,
								type = "pic",
								ycenter = -138,
								pic = "res/ui/activity/ironReward/acti_text_icon_sbzz.png"
							},
							{
								xcenter = 79,
								name = "actEffect_3",
								visible = false,
								type = "pic",
								ycenter = -138,
								pic = "res/ui/activity/ironReward/acti_text_icon_sbjs.png"
							},
							{
								xcenter = 237,
								name = "actEffect_4",
								visible = false,
								type = "pic",
								ycenter = -138,
								pic = "res/ui/activity/ironReward/acti_text_icon_shbzz.png"
							},
							{
								xcenter = 395,
								name = "actEffect_5",
								visible = false,
								type = "pic",
								ycenter = -138,
								pic = "res/ui/activity/ironReward/acti_text_icon_bjzz.png"
							}
						}
					}
				}
			},
			{
				fontSize = 26,
				name = "num",
				type = "label",
				x = 60,
				strokeSize = 2,
				y = 380,
				color = ccc3(235, 209, 167),
				strokeColor = ccc3(22, 18, 13)
			},
			{
				xcenter = 0,
				down = 15,
				type = "pic_9",
				pic = "res/ui/activity/ironReward/xs_view_2.png",
				middleRect = CCRectMake(10, 10, 60, 60),
				preferedSize = CCSizeMake(880, 255),
				children = {
					{
						xcenter = -215,
						name = "actIronRewardLeft",
						type = "pic",
						ycenter = 0,
						pic = "res/ui/activity/ironReward/acti_view_left.jpg",
						children = {
							{
								y = 65,
								x = 350,
								type = "button",
								buttons = {
									{
										pic2 = "frame:btn_default_lighted.png",
										name = "incenseBtn1",
										pic1 = "frame:btn_default_normal.png"
									}
								}
							},
							{
								name = "lblBtn1",
								strokeSize = 2,
								type = "label",
								fontSize = 20,
								y = 65,
								x = 350,
								text = language.get(131163, 1),
								color = ccc3(188, 183, 183),
								strokeColor = ccc3(22, 18, 13)
							},
							{
								x = 330,
								y = 23,
								pic = "res/ui/playerInfo/icon_gold.png",
								type = "pic"
							},
							{
								name = "incenseGold1",
								strokeSize = 2,
								type = "label",
								fontSize = 20,
								text = "15",
								y = 23,
								x = 370,
								color = ccc3(235, 209, 167),
								strokeColor = ccc3(22, 18, 13)
							},
							{
								x = 350,
								name = "actBjIcon",
								y = 115,
								type = "pic",
								visible = false,
								scale = 0.5,
								pic = "res/ui/activity/ironReward/acti_iron_icon_1.jpg"
							}
						}
					},
					{
						xcenter = 215,
						name = "actIronRewardRight",
						type = "pic",
						ycenter = 0,
						pic = "res/ui/activity/ironReward/acti_view_right.jpg",
						children = {
							{
								y = 65,
								x = 350,
								type = "button",
								buttons = {
									{
										pic2 = "frame:btn_default_lighted.png",
										name = "incenseBtn5",
										pic1 = "frame:btn_default_normal.png"
									}
								}
							},
							{
								name = "lblBtn5",
								strokeSize = 2,
								type = "label",
								fontSize = 20,
								y = 65,
								x = 350,
								text = language.get(131163, 5),
								color = ccc3(188, 183, 183),
								strokeColor = ccc3(22, 18, 13)
							},
							{
								x = 330,
								y = 23,
								pic = "res/ui/playerInfo/icon_gold.png",
								type = "pic"
							},
							{
								name = "incenseGold5",
								strokeSize = 2,
								type = "label",
								fontSize = 20,
								text = "15",
								y = 23,
								x = 370,
								color = ccc3(235, 209, 167),
								strokeColor = ccc3(22, 18, 13)
							}
						}
					},
					{
						name = "nextIncense",
						strokeSize = 2,
						type = "label",
						fontSize = 20,
						anchorPointX = 1,
						y = 25,
						x = 592,
						text = language.get(131164, 5),
						color = ccc3(235, 209, 167),
						strokeColor = ccc3(22, 18, 13)
					},
					{
						x = 620,
						name = "ironRewardIcon",
						y = 25,
						type = "pic",
						pic = "res/ui/task/get_icon_iron.png"
					},
					{
						name = "ironRewardNum",
						strokeSize = 2,
						type = "label",
						fontSize = 20,
						text = "5000",
						y = 25,
						x = 660,
						color = ccc3(235, 209, 167),
						strokeColor = ccc3(22, 18, 13)
					},
					{
						x = 780,
						y = 25,
						type = "pic_9",
						pic = "res/ui/activity/ironReward/acti_loading_di.png",
						middleRect = CCRectMake(2, 2, 2, 17),
						preferedSize = CCSizeMake(175, 21),
						children = {
							{
								anchorPointX = 0,
								name = "smallProgress",
								type = "pic_9",
								pic = "res/ui/activity/ironReward/acti_loading_con.jpg",
								y = 10.5,
								anchorPointY = 0.5,
								x = 3,
								middleRect = CCRectMake(0, 0, 1, 13),
								preferedSize = CCSizeMake(0, 13)
							}
						}
					}
				}
			}
		}
	}
}

function var_0_1.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getIronRewardActivityInfo)
end

function var_0_1.incenseIron(arg_4_0, arg_4_1)
	local var_4_0 = 0
	local var_4_1

	local function var_4_2(arg_5_0)
		local var_5_0 = arg_5_0.action.data

		if var_5_0.extraIron and var_5_0.extraIron > 0 then
			local var_5_1 = {}
			local var_5_2 = {}

			var_5_2.id = 4
			var_5_2.value = var_5_0.extraIron

			table.insert(var_5_1, var_5_2)
			globalAction_gotResource(var_5_1)
		end

		if var_5_0.extraGang and var_5_0.extraGang > 0 then
			local var_5_3 = {}
			local var_5_4 = {}

			var_5_4.id = 10033
			var_5_4.value = var_5_0.extraGang

			table.insert(var_5_3, var_5_4)
			globalAction_gotResource(var_5_3)
		end

		local var_5_5 = var_5_0.resourceGot[1]
		local var_5_6 = var_5_0.multiple
		local var_5_7 = CCSprite:create("res/ui/activity/ironReward/js_get_bg.png")
		local var_5_8 = var_5_5.resourceType == 119 and 131152 or 131165
		local var_5_9 = CCStrokeLabelTTF:create(language.get(var_5_8, var_5_5.addNum), "Thonburi", 20, 2, ccc3(22, 18, 13))
		local var_5_10 = smgr.getLayer("pushLayer")
		local var_5_11

		if arg_4_1 == 1 then
			var_5_11 = arg_4_0.view.actIronRewardLeft
		else
			var_5_11 = arg_4_0.view.actIronRewardRight
		end

		if var_5_6 > 1 then
			if arg_4_0.bjSprite and not tolua.isnull(arg_4_0.bjSprite) then
				arg_4_0.bjSprite:removeFromParentAndCleanup(true)

				arg_4_0.bjSprite = nil
			end

			local var_5_12 = CCSprite:create("res/ui/activity/ironReward/js_bj_" .. var_5_6 .. ".png")
			local var_5_13 = ccp(tool.getPositionInScreen(var_5_11))
			local var_5_14 = ccpAdd(var_5_13, ccp(-80, 71))

			var_5_12:setPosition(var_5_14)
			var_5_10:addChild(var_5_12)

			local var_5_15 = CCArray:create()

			var_5_15:addObject(CCDelayTime:create(0.5))
			var_5_15:addObject(CCFadeOut:create(0.2))
			var_5_15:addObject(CCCallFunc:create(function()
				var_5_12:removeFromParentAndCleanup(true)

				var_5_12 = nil
			end))
			var_5_12:runAction(CCSequence:create(var_5_15))

			arg_4_0.bjSprite = var_5_12
		end

		if var_5_6 == 1 then
			var_5_9:setColor(ccc3(255, 255, 204))
		elseif var_5_6 == 2 then
			var_5_9:setColor(ccc3(255, 204, 0))
		elseif var_5_6 == 4 then
			var_5_9:setColor(ccc3(240, 112, 84))
		elseif var_5_6 == 10 then
			var_5_9:setColor(ccc3(200, 123, 245))
		end

		var_5_9:setPosition(ccp(80.5, 16.5))
		var_5_7:addChild(var_5_9)

		local var_5_16 = ccp(tool.getPositionInScreen(var_5_11))
		local var_5_17 = ccpAdd(var_5_16, ccp(-80, -71))

		var_5_7:setPosition(var_5_17)
		var_5_10:addChild(var_5_7)

		local var_5_18 = CCArray:create()

		var_5_18:addObject(CCEaseSineInOut:create(CCMoveBy:create(0.5, ccp(0, 100))))
		var_5_18:addObject(CCFadeOut:create(0.4))
		var_5_18:addObject(CCCallFunc:create(function()
			var_5_7:removeFromParentAndCleanup(true)
		end))
		var_5_7:runAction(CCSequence:create(var_5_18))

		local var_5_19 = CCArray:create()

		var_5_19:addObject(CCDelayTime:create(0.5))
		var_5_19:addObject(CCFadeOut:create(0.4))
		var_5_9:runAction(CCSequence:create(var_5_19))

		var_4_0 = var_4_0 + 1

		if var_4_0 >= arg_4_1 then
			arg_4_0:refresh()
		else
			cmgr.sendRequest(var_4_2, actions.doWorship, "4")
		end
	end

	messageBox.showChargeWin(language.get(10003), language.get(71010, arg_4_0.info["gold" .. arg_4_1]), "incenseGold", function()
		cmgr.sendRequest(var_4_2, actions.doWorship, "4")
	end)
end

function var_0_1.useIronRewardItem(arg_9_0, arg_9_1)
	local var_9_0 = {
		[119] = 10033
	}

	local function var_9_1(arg_10_0)
		local var_10_0 = arg_10_0.action.data
		local var_10_1 = {}

		for iter_10_0, iter_10_1 in pairs(var_10_0.rewards) do
			local var_10_2 = {
				id = var_9_0[iter_10_1.type],
				value = iter_10_1.num
			}

			table.insert(var_10_1, var_10_2)
		end

		globalAction_gotResource(var_10_1)
		arg_9_0:refresh()
	end

	cmgr.sendRequest(var_9_1, actions.useIronRewardItem, arg_9_1)
end

function var_0_1.showIronRewardTips(arg_11_0, arg_11_1)
	if arg_11_0.tips and not tolua.isnull(arg_11_0.tips) then
		arg_11_0.tips:removeFromParentAndCleanup(true)

		arg_11_0.tips = nil
	end

	local var_11_0 = arg_11_0.view["actIronRewardIcon" .. arg_11_1]
	local var_11_1 = CCScale9Sprite:createWithSpriteFrameName("autoSizePanel.png")

	var_11_1:setPreferredSize(CCSizeMake(250, 100))
	var_11_1:setAnchorPoint(ccp(0.5, 0))

	local var_11_2, var_11_3 = var_11_0:getPosition()

	log.info(var_11_2, var_11_3)
	var_11_1:setPosition(ccp(var_11_2 - 25, var_11_3 + 40))
	arg_11_0.view.ironProgressBg:addChild(var_11_1, 110)

	local var_11_4 = ({
		language.get(133001),
		language.get(133002),
		language.get(133003),
		language.get(133004),
		language.get(133005)
	})[arg_11_1]
	local var_11_5 = arg_11_0.info.incenseTimes[arg_11_1]

	if var_11_5.type == 119 then
		if arg_11_1 == 2 then
			var_11_4 = language.get(131161, var_11_5.num)
		else
			var_11_4 = language.get(133006)
		end
	end

	local var_11_6 = CCStrokeLabelTTF:create(var_11_4, "Thonburi", 22)

	var_11_6:setDimensions(CCSizeMake(230, 80))
	var_11_6:setPosition(ccp(125, 50))
	var_11_1:addChild(var_11_6)
	var_11_6:setHorizontalAlignment(kCCTextAlignmentLeft)

	arg_11_0.tips = var_11_1
end

function var_0_1.showPanel(arg_12_0, arg_12_1)
	arg_12_0.info = arg_12_1

	local var_12_0 = arg_12_1.activityType == 1

	arg_12_0.view.num:setString(language.get(20036, arg_12_1.num))
	arg_12_0.view.ironRewardNum:setString(var_12_0 and arg_12_1.extraGang or arg_12_1.extIron)
	arg_12_0.view.incenseGold1:setString(tostring(arg_12_1.gold1))
	arg_12_0.view.incenseGold5:setString(tostring(arg_12_1.gold5))

	local var_12_1 = arg_12_1.times - arg_12_1.num % arg_12_1.times

	arg_12_0.view.nextIncense:setString(language.get(131164, var_12_1))

	local var_12_2 = (arg_12_1.times - var_12_1) * 100 / arg_12_1.times * 175 / 100

	arg_12_0.view.smallProgress:setPreferredSize(CCSizeMake(var_12_2, 13))

	if arg_12_1.specialId == 1 and arg_12_1.specialLimit > 0 then
		arg_12_0.view.actBjIcon:setVisible(true)
	end

	local var_12_3 = 0
	local var_12_4 = arg_12_1.num
	local var_12_5 = 5

	for iter_12_0 = 1, var_12_5 do
		local var_12_6 = arg_12_1.incenseTimes[iter_12_0]

		if var_12_4 > var_12_6.times then
			var_12_3 = var_12_3 + 100 / var_12_5
		else
			local var_12_7 = 0

			if arg_12_1.incenseTimes[iter_12_0 - 1] ~= nil then
				var_12_7 = arg_12_1.incenseTimes[iter_12_0 - 1].times
			end

			if var_12_7 < var_12_4 then
				local var_12_8 = var_12_4 - var_12_7
				local var_12_9 = var_12_6.times - var_12_7

				var_12_3 = var_12_3 + var_12_8 * 100 / var_12_9 / var_12_5
			end
		end

		if var_12_6.type == 119 then
			local var_12_10

			if iter_12_0 == 2 then
				var_12_10 = CCSprite:create("res/ui/activity/ironReward/bailg.jpg"):displayFrame()
			else
				var_12_10 = tool.spriteFrameByName("gfzz.jpg")
			end

			arg_12_0.view["grayIcon" .. iter_12_0]:setDisplayFrame(var_12_10)
		end

		arg_12_0.view["grayIcon" .. iter_12_0]:removeAllChildrenWithCleanup(true)
		arg_12_0.view["actIronRewardIcon" .. iter_12_0]:stopAllActions()
		arg_12_0.view["actIronRewardIcon" .. iter_12_0]:setPositionY(-80)
		arg_12_0.view["animSprite" .. iter_12_0]:setVisible(false)

		if var_12_6.received == 1 then
			tool.spriteToGray(arg_12_0.view["grayIcon" .. iter_12_0])
		elseif var_12_4 >= var_12_6.times then
			local var_12_11 = CCJumpBy:create(0.4, ccp(0, 0), 5, 1)

			arg_12_0.view["actIronRewardIcon" .. iter_12_0]:runAction(CCRepeatForever:create(var_12_11))

			if var_12_6.type ~= 119 then
				arg_12_0.view["actEffect_" .. iter_12_0]:setVisible(true)
			end

			arg_12_0.view["animSprite" .. iter_12_0]:setVisible(true)
		end
	end

	arg_12_0.view.actIronRewardBar:setPercentage(var_12_3)
end

function var_0_1.ctor(arg_13_0, arg_13_1, arg_13_2)
	log.info("@@ 镔铁祭祀")

	arg_13_0.view = autoUI.initUI(arg_13_0, var_0_2)
	arg_13_0.leftTime = arg_13_0.view.actLefttime

	arg_13_1:addChild(arg_13_0)

	for iter_13_0 = 1, 5 do
		local var_13_0 = CCArray:create()

		for iter_13_1 = 1, 8 do
			local var_13_1 = CCSpriteFrame:create(string.format("res/ui/activity/ironReward/btjs_gq/btjs_gq_%04d.png", iter_13_1), CCRectMake(0, 0, 100, 100))

			var_13_0:addObject(var_13_1)
		end

		local var_13_2 = CCAnimation:createWithSpriteFrames(var_13_0, 0.1)
		local var_13_3 = CCAnimate:create(var_13_2)

		arg_13_0.view["animSprite" .. iter_13_0]:runAction(CCRepeatForever:create(var_13_3))
		arg_13_0.view["animSprite" .. iter_13_0]:setVisible(false)
	end

	arg_13_0.view.incenseBtn1:registerScriptTapHandler(function()
		arg_13_0:incenseIron(1)
	end)
	arg_13_0.view.incenseBtn5:registerScriptTapHandler(function()
		arg_13_0:incenseIron(5)
	end)

	if arg_13_2.activityType == 1 then
		local var_13_4 = arg_13_0.view.title

		var_13_4:setDisplayFrame(CCSprite:create("res/ui/activity/ironReward/gtjs_title.png"):displayFrame())

		local var_13_5 = var_13_4:getContentSize()
		local var_13_6 = CCSprite:create("res/ui/activity/ironSell/word_xin.png")

		var_13_6:setPosition(ccp(20, 0.5 * var_13_5.height))
		var_13_6:setAnchorPoint(ccp(1, 0.5))
		var_13_4:addChild(var_13_6)
		arg_13_0.view.lblBtn1:setString(language.get(131151, 1))
		arg_13_0.view.lblBtn5:setString(language.get(131151, 5))
		arg_13_0.view.ironRewardIcon:setDisplayFrame(CCSprite:create("res/ui/weapon/godWeapon/sbxt_icon_blg.png"):displayFrame())
	end

	arg_13_0:showPanel(arg_13_2)
end

function var_0_1.onEnter(arg_16_0)
	log.info("IronReward:onEnter()")

	arg_16_0.touchBeganRef = handler(arg_16_0, arg_16_0.onTouchBegan)
	arg_16_0.touchMovedRef = handler(arg_16_0, arg_16_0.onTouchMoved)
	arg_16_0.touchEndedRef = handler(arg_16_0, arg_16_0.onTouchEnded)
	arg_16_0.touchCancelledRef = handler(arg_16_0, arg_16_0.onTouchCancelled)

	eventManager.registerEvent("globalOnTouchBegan", arg_16_0.touchBeganRef)
	eventManager.registerEvent("globalOnTouchMoved", arg_16_0.touchMovedRef)
	eventManager.registerEvent("globalOnTouchEnded", arg_16_0.touchEndedRef)
	eventManager.registerEvent("globalOnTouchCancelled", arg_16_0.touchCancelledRef)
end

function var_0_1.onExit(arg_17_0)
	log.info("IronReward:onExit()")
	eventManager.unregisterEvent("globalOnTouchBegan", arg_17_0.touchBeganRef)
	eventManager.unregisterEvent("globalOnTouchMoved", arg_17_0.touchMovedRef)
	eventManager.unregisterEvent("globalOnTouchEnded", arg_17_0.touchEndedRef)
	eventManager.unregisterEvent("globalOnTouchCancelled", arg_17_0.touchCancelledRef)
end

function var_0_1.onTouchBegan(arg_18_0, arg_18_1, arg_18_2)
	return
end

function var_0_1.onTouchMoved(arg_19_0, arg_19_1, arg_19_2)
	return
end

function var_0_1.onTouchEnded(arg_20_0, arg_20_1, arg_20_2)
	if arg_20_0.tips and not tolua.isnull(arg_20_0.tips) then
		arg_20_0.tips:removeFromParentAndCleanup(true)

		arg_20_0.tips = nil
	end

	local var_20_0 = arg_20_0.info.num

	for iter_20_0 = 1, 5 do
		local var_20_1 = arg_20_0.view["grayIcon" .. iter_20_0]
		local var_20_2 = arg_20_0.info.incenseTimes[iter_20_0]

		if var_20_0 >= var_20_2.times and var_20_2.received == 0 and tool.checkIfTouch(var_20_1, arg_20_1, arg_20_2) then
			log.info("touch on " .. iter_20_0)

			if var_20_2.type == 119 then
				if iter_20_0 == 2 then
					arg_20_0:useIronRewardItem(iter_20_0)
				else
					globalAction_showSpecialWindow({
						openType = 6,
						step = iter_20_0
					})
				end
			else
				globalAction_showSpecialWindow({
					openType = iter_20_0
				})
			end
		elseif tool.checkIfTouch(var_20_1, arg_20_1, arg_20_2) then
			log.info("shajgsdkahjgsdkjahg")
			arg_20_0:showIronRewardTips(iter_20_0)
		end
	end
end

function var_0_1.onTouchCancelled(arg_21_0, arg_21_1, arg_21_2)
	return
end

return var_0_1
