local var_0_0 = class("KfyzMorePanel", function()
	return createBaseLayer()
end)

var_0_0.layout = {
	name = "root",
	type = "node",
	x = visibleSize.width / 2,
	y = visibleSize.height / 2 - 30,
	children = {
		{
			y = 0,
			name = "panel",
			type = "sprite9",
			x = 0,
			preferedSize = CCSizeMake(960, 580),
			middleRect = CCRectMake(45, 30, 15, 45),
			pic = {
				frame = true,
				path = "bigPanel.png"
			},
			children = {
				{
					x = 924,
					name = "btn_close",
					h = 33,
					type = "button",
					w = 32,
					y = 604,
					scale = 2,
					normal = {
						frame = true,
						path = "btn_close_a.png"
					},
					touched = {
						frame = true,
						path = "btn_close_c.png"
					}
				},
				{
					y = 290,
					name = "bg_att",
					type = "sprite9",
					x = 480,
					preferedSize = CCSizeMake(915, 532),
					middleRect = CCRectMake(20, 10, 50, 70),
					pic = {
						path = "res/ui/common/panel/comm_view.png"
					}
				},
				{
					y = 290,
					name = "bg",
					type = "sprite",
					x = 480,
					pic = {
						path = "res/ui/kfyz/threeRoad/bfslyz_bg.jpg"
					},
					children = {
						{
							y = 485,
							name = "bfslyz_title",
							type = "sprite",
							x = 457.5001,
							pic = {
								path = "res/ui/kfyz/threeRoad/bfslyz_title.png"
							}
						},
						{
							fontSize = 24,
							name = "leftTime",
							y = 210,
							type = "label",
							x = 300
						},
						{
							y = 0,
							name = "KfyzMoreRenderer1",
							type = "node",
							x = 0,
							children = {
								{
									y = 415.0004,
									name = "bfslyz_road_di",
									type = "sprite",
									x = 157,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_road_di.png"
									}
								},
								{
									y = 370.0001,
									name = "bfslyz_server_di",
									type = "sprite",
									x = 157,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_server_di.png"
									}
								},
								{
									y = 289.9997,
									name = "bfslyz_rolehead_di",
									type = "sprite",
									x = 157,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_rolehead_di.png"
									}
								},
								{
									y = 220.0003,
									name = "bfslyz_name_di",
									type = "sprite",
									x = 157,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_name_di.png"
									}
								},
								{
									y = 185.0001,
									name = "bfslyz_ybm_di",
									type = "sprite",
									x = 157,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_ybm_di.png"
									}
								},
								{
									y = 220.0002,
									name = "bfslyz_flag_01",
									type = "sprite",
									x = 45.9998,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_flag_02.png"
									}
								},
								{
									w = 46,
									name = "downBtn1",
									h = 34,
									type = "button",
									y = 185.0002,
									x = 249.9994,
									normal = {
										path = "res/ui/kfyz/threeRoad/bfslyz_ybm_btn.png"
									},
									touched = {
										path = "res/ui/kfyz/threeRoad/bfslyz_ybm_btn_c.png"
									}
								},
								{
									fontSize = 36,
									name = "attGuoLb1",
									y = 422.0002,
									type = "label",
									x = 157,
									textId = 215209,
									color = colorForce[2]
								},
								{
									fontSize = 30,
									name = "infoLb1",
									y = 371,
									type = "label",
									x = 157
								},
								{
									fontSize = 22,
									name = "jq1",
									y = 221.0032,
									type = "label",
									x = 82.0002,
									textId = 215221,
									color = colorQuality[4]
								},
								{
									fontSize = 20,
									name = "heroLb1",
									y = 220,
									type = "label",
									x = 157
								},
								{
									fontSize = 20,
									name = "signLb1",
									y = 185.0002,
									type = "label",
									x = 157
								},
								{
									fontSize = 30,
									name = "addedLb1",
									y = 100,
									type = "label",
									x = 157,
									textId = 215207,
									color = colorQuality[4]
								},
								{
									name = "addBtn1",
									h = 62,
									type = "button",
									w = 195,
									y = 98.75,
									x = 158.25,
									normal = {
										path = "res/ui/common/button/public_btn_green.png"
									},
									touched = {
										path = "res/ui/common/button/public_btn_green_c.png"
									},
									children = {
										{
											fontSize = 30,
											style = "label_warlock",
											name = "addBtnLb1",
											type = "label",
											y = 34,
											x = 97.5,
											textId = 390007,
											color = color_whi
										}
									}
								},
								{
									zoomOnTouchDown = true,
									name = "linkBtn1",
									h = 24,
									type = "button",
									w = 96,
									y = 50,
									x = 157,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									},
									children = {
										{
											fontSize = 24,
											name = "linkLb1",
											y = 12,
											type = "label",
											x = 48,
											textId = 215203,
											color = colorQuality[3]
										}
									}
								},
								{
									y = 152,
									name = "listBg1",
									x = 157,
									type = "node"
								},
								{
									type = "sprite",
									name = "playerPic1",
									y = 290,
									visible = false,
									x = 157,
									pic = {
										path = "res/ui/common/playerHead/playerHead_icon_1.png"
									}
								},
								{
									type = "sprite",
									name = "bgChoose1",
									y = 222.0001,
									visible = false,
									x = 157,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_bg_light.png"
									}
								},
								{
									type = "sprite",
									name = "moreWin1",
									y = 100,
									visible = false,
									x = 157,
									pic = {
										path = "res/ui/nationTask/arena/ltzbs_word_sl.png"
									}
								}
							}
						},
						{
							y = 0,
							name = "KfyzMoreRenderer2",
							type = "node",
							x = 294,
							children = {
								{
									y = 415.0004,
									name = "bfslyz_road_di_2",
									type = "sprite",
									x = 157,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_road_di.png"
									}
								},
								{
									y = 370.0001,
									name = "bfslyz_server_di_2",
									type = "sprite",
									x = 157,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_server_di.png"
									}
								},
								{
									y = 289.9997,
									name = "bfslyz_rolehead_di_2",
									type = "sprite",
									x = 157,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_rolehead_di.png"
									}
								},
								{
									y = 220.0003,
									name = "bfslyz_name_di_2",
									type = "sprite",
									x = 157,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_name_di.png"
									}
								},
								{
									y = 185.0001,
									name = "bfslyz_ybm_di_2",
									type = "sprite",
									x = 157,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_ybm_di.png"
									}
								},
								{
									y = 220.0002,
									name = "bfslyz_flag_01_2",
									type = "sprite",
									x = 45.9998,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_flag_01.png"
									}
								},
								{
									w = 46,
									name = "downBtn2",
									h = 34,
									type = "button",
									y = 185.0002,
									x = 249.9994,
									normal = {
										path = "res/ui/kfyz/threeRoad/bfslyz_ybm_btn.png"
									},
									touched = {
										path = "res/ui/kfyz/threeRoad/bfslyz_ybm_btn_c.png"
									}
								},
								{
									fontSize = 36,
									name = "attGuoLb2",
									y = 422.0002,
									type = "label",
									x = 157,
									textId = 215210,
									color = colorForce[1]
								},
								{
									fontSize = 30,
									name = "infoLb2",
									y = 371,
									type = "label",
									x = 157
								},
								{
									fontSize = 22,
									name = "jq2",
									y = 221.0032,
									type = "label",
									x = 82.0002,
									textId = 215221,
									color = colorQuality[4]
								},
								{
									fontSize = 20,
									name = "heroLb2",
									y = 220,
									type = "label",
									x = 157
								},
								{
									fontSize = 20,
									name = "signLb2",
									y = 185.0002,
									type = "label",
									x = 157
								},
								{
									fontSize = 30,
									name = "addedLb2",
									y = 100,
									type = "label",
									x = 157,
									textId = 215207,
									color = colorQuality[4]
								},
								{
									name = "addBtn2",
									h = 62,
									type = "button",
									w = 195,
									y = 98.75,
									x = 158.25,
									normal = {
										path = "res/ui/common/button/public_btn_green.png"
									},
									touched = {
										path = "res/ui/common/button/public_btn_green_c.png"
									},
									children = {
										{
											fontSize = 30,
											style = "label_warlock",
											name = "addBtnLb2",
											type = "label",
											y = 34,
											x = 97.5,
											textId = 390007,
											color = color_whi
										}
									}
								},
								{
									zoomOnTouchDown = true,
									name = "linkBtn2",
									h = 24,
									type = "button",
									w = 96,
									y = 50,
									x = 157,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									},
									children = {
										{
											fontSize = 24,
											name = "linkLb2",
											y = 12,
											type = "label",
											x = 48,
											textId = 215203,
											color = colorQuality[3]
										}
									}
								},
								{
									y = 152,
									name = "listBg2",
									x = 157,
									type = "node"
								},
								{
									type = "sprite",
									name = "playerPic2",
									y = 290,
									visible = false,
									x = 157,
									pic = {
										path = "res/ui/common/playerHead/playerHead_icon_1.png"
									}
								},
								{
									type = "sprite",
									name = "bgChoose2",
									y = 222.0001,
									visible = false,
									x = 157,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_bg_light.png"
									}
								},
								{
									type = "sprite",
									name = "moreWin2",
									y = 100,
									visible = false,
									x = 157,
									pic = {
										path = "res/ui/nationTask/arena/ltzbs_word_sl.png"
									}
								}
							}
						},
						{
							y = 0,
							name = "KfyzMoreRenderer3",
							type = "node",
							x = 602,
							children = {
								{
									y = 415.0004,
									name = "bfslyz_road_di_3",
									type = "sprite",
									x = 157,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_road_di.png"
									}
								},
								{
									y = 370.0001,
									name = "bfslyz_server_di_3",
									type = "sprite",
									x = 157,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_server_di.png"
									}
								},
								{
									y = 289.9997,
									name = "bfslyz_rolehead_di_3",
									type = "sprite",
									x = 157,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_rolehead_di.png"
									}
								},
								{
									y = 220.0003,
									name = "bfslyz_name_di_3",
									type = "sprite",
									x = 157,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_name_di.png"
									}
								},
								{
									y = 185.0001,
									name = "bfslyz_ybm_di_3",
									type = "sprite",
									x = 157,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_ybm_di.png"
									}
								},
								{
									y = 220.0002,
									name = "bfslyz_flag_01_3",
									type = "sprite",
									x = 45.9998,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_flag_03.png"
									}
								},
								{
									w = 46,
									name = "downBtn3",
									h = 34,
									type = "button",
									y = 185.0002,
									x = 249.9994,
									normal = {
										path = "res/ui/kfyz/threeRoad/bfslyz_ybm_btn.png"
									},
									touched = {
										path = "res/ui/kfyz/threeRoad/bfslyz_ybm_btn_c.png"
									}
								},
								{
									fontSize = 36,
									name = "attGuoLb3",
									y = 422.0002,
									type = "label",
									x = 157,
									textId = 215211,
									color = colorForce[3]
								},
								{
									fontSize = 30,
									name = "infoLb3",
									y = 371,
									type = "label",
									x = 157
								},
								{
									fontSize = 22,
									name = "jq3",
									y = 221.0032,
									type = "label",
									x = 82.0002,
									textId = 215221,
									color = colorQuality[4]
								},
								{
									fontSize = 20,
									name = "heroLb3",
									y = 220,
									type = "label",
									x = 157
								},
								{
									fontSize = 20,
									name = "signLb3",
									y = 185.0002,
									type = "label",
									x = 157
								},
								{
									fontSize = 30,
									name = "addedLb3",
									y = 100,
									type = "label",
									x = 157,
									textId = 215207,
									color = colorQuality[4]
								},
								{
									name = "addBtn3",
									h = 62,
									type = "button",
									w = 195,
									y = 98.75,
									x = 158.25,
									normal = {
										path = "res/ui/common/button/public_btn_green.png"
									},
									touched = {
										path = "res/ui/common/button/public_btn_green_c.png"
									},
									children = {
										{
											fontSize = 30,
											style = "label_warlock",
											name = "addBtnLb3",
											type = "label",
											y = 34,
											x = 97.5,
											textId = 390007,
											color = color_whi
										}
									}
								},
								{
									zoomOnTouchDown = true,
									name = "linkBtn3",
									h = 24,
									type = "button",
									w = 96,
									y = 50,
									x = 157,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									},
									children = {
										{
											fontSize = 24,
											name = "linkLb3",
											y = 12,
											type = "label",
											x = 48,
											textId = 215203,
											color = colorQuality[3]
										}
									}
								},
								{
									y = 152,
									name = "listBg3",
									x = 157,
									type = "node"
								},
								{
									type = "sprite",
									name = "playerPic3",
									y = 290,
									visible = false,
									x = 157,
									pic = {
										path = "res/ui/common/playerHead/playerHead_icon_1.png"
									}
								},
								{
									type = "sprite",
									name = "bgChoose3",
									y = 222.0001,
									visible = false,
									x = 157,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_bg_light.png"
									}
								},
								{
									type = "sprite",
									name = "moreWin3",
									y = 100,
									visible = false,
									x = 157,
									pic = {
										path = "res/ui/nationTask/arena/ltzbs_word_sl.png"
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

function var_0_0.ctor(arg_2_0, arg_2_1, arg_2_2)
	log.info("@@ 兵分三路")

	arg_2_0.view = {}

	uiutil.initWidgets(arg_2_0.view, arg_2_0.layout)

	arg_2_0.leftTime = arg_2_0.view.widgets.leftTime

	if arg_2_1 then
		arg_2_0:addChild(arg_2_0.view.widgets.root)
		arg_2_1:addChild(arg_2_0)
		swallowTouch(arg_2_0)
	end

	arg_2_0:update(arg_2_2)
	arg_2_0:refresh()
end

function var_0_0.update(arg_3_0, arg_3_1)
	if arg_3_1 then
		arg_3_0.info = arg_3_1

		showTable(arg_3_1)

		local var_3_0 = {
			arg_3_1.roads[2],
			arg_3_1.roads[1],
			arg_3_1.roads[3]
		}

		for iter_3_0, iter_3_1 in ipairs(var_3_0) do
			arg_3_0.view.widgets["infoLb" .. iter_3_0]:setString(iter_3_1.serverName .. " " .. iter_3_1.nationName)

			if iter_3_1.playerPic then
				arg_3_0.view.widgets["playerPic" .. iter_3_0]:setDisplayFrame(CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. iter_3_1.playerPic .. ".png"):displayFrame())
				arg_3_0.view.widgets["playerPic" .. iter_3_0]:setVisible(true)
			else
				arg_3_0.view.widgets["playerPic" .. iter_3_0]:setVisible(false)
			end

			local var_3_1 = iter_3_1.playerName or language.get(215206)

			arg_3_0.view.widgets["heroLb" .. iter_3_0]:setString(var_3_1)
			arg_3_0.view.widgets["signLb" .. iter_3_0]:setString(language.get(215205, iter_3_1.signNum))

			if iter_3_1.signNum > 0 then
				arg_3_0.view.widgets["downBtn" .. iter_3_0]:setVisible(true)
			else
				arg_3_0.view.widgets["downBtn" .. iter_3_0]:setVisible(false)
			end

			local var_3_2 = iter_3_1.selfRoadId and iter_3_1.selfRoadId == 0

			arg_3_0.view.widgets["addBtn" .. iter_3_0]:setVisible(var_3_2)

			local var_3_3 = iter_3_1.selfRoadId and iter_3_1.road and iter_3_1.selfRoadId == iter_3_1.road

			arg_3_0.view.widgets["bgChoose" .. iter_3_0]:setVisible(var_3_3)
			arg_3_0.view.widgets["addedLb" .. iter_3_0]:setVisible(var_3_3)

			if user.kfyzState == 2 then
				local var_3_4

				if iter_3_1.win == 0 then
					var_3_4 = "ltzbs_word_sl.png"
				elseif iter_3_1.win == 1 then
					var_3_4 = "ltzbs_word_sb.png"
				elseif iter_3_1.win == 2 then
					var_3_4 = "ltzbs_word_sb.png"
				end

				if var_3_4 then
					arg_3_0.view.widgets["moreWin" .. iter_3_0]:setDisplayFrame(CCSprite:create("res/ui/nationTask/arena/" .. var_3_4):displayFrame())
					arg_3_0.view.widgets["moreWin" .. iter_3_0]:setVisible(true)
				end

				arg_3_0.view.widgets["addedLb" .. iter_3_0]:setVisible(false)
				arg_3_0.view.widgets["linkLb" .. iter_3_0]:setString(var_3_3 and language.get(215219) or "")
			else
				arg_3_0.view.widgets["moreWin" .. iter_3_0]:setVisible(false)
				arg_3_0.view.widgets["linkLb" .. iter_3_0]:setString(language.get(215203))
				arg_3_0.view.widgets["addedLb" .. iter_3_0]:setString(language.get(215207))
			end

			local function var_3_5()
				cmgr.sendRequest(function(arg_5_0)
					user.kfRoadId = iter_3_1.road
					user.preKfRoadId = 0

					arg_3_0:refresh()
				end, actions.kfyzRoadSign, iter_3_1.road)
			end

			local function var_3_6()
				local var_6_0 = smgr.getLayer("topLayer")

				var_6_0:removeAllChildrenWithCleanup(true)

				if user.kfyzState == 2 then
					require("lua/layer/nation/ui")
					nationUI.show(10)
				else
					user.isSelfKfRoad = iter_3_1.road == iter_3_1.selfRoadId
					user.preKfRoadId = iter_3_1.road

					require("lua/layer/kfyz/InvestLayer").new(var_6_0)
				end

				arg_3_0:removeFromParentAndCleanup(true)
			end

			local function var_3_7(...)
				local var_7_0 = arg_3_0.view.widgets["downBtn" .. iter_3_0]:getScale()

				if var_7_0 < 0 then
					arg_3_0.view.widgets["listBg" .. iter_3_0]:setVisible(false)
				else
					arg_3_0:getAddMoreList(iter_3_1.road, arg_3_0.view.widgets["listBg" .. iter_3_0])
				end

				arg_3_0.view.widgets["downBtn" .. iter_3_0]:setScale(-1 * var_7_0)
			end

			arg_3_0.view.widgets["addBtn" .. iter_3_0]:addHandleOfControlEvent(var_3_5, CCControlEventTouchDown)
			arg_3_0.view.widgets["linkBtn" .. iter_3_0]:addHandleOfControlEvent(var_3_6, CCControlEventTouchDown)
			arg_3_0.view.widgets["downBtn" .. iter_3_0]:addHandleOfControlEvent(var_3_7, CCControlEventTouchDown)
		end
	end
end

function var_0_0.getAddMoreList(arg_8_0, arg_8_1, arg_8_2)
	cmgr.sendRequest(function(arg_9_0)
		local var_9_0 = arg_9_0.action.data

		arg_8_0:moreList(arg_8_2, var_9_0.players)
		arg_8_2:setVisible(true)
	end, actions.kfyzGetSignInfo, arg_8_1)
end

function var_0_0.moreList(arg_10_0, arg_10_1, arg_10_2)
	local function var_10_0(arg_11_0, arg_11_1)
		return 30, 290
	end

	local function var_10_1(arg_12_0, arg_12_1)
		local var_12_0 = arg_12_0:dequeueCell()

		if var_12_0 then
			var_12_0:removeAllChildrenWithCleanup(true)
		else
			var_12_0 = CCTableViewCell:new()
		end

		local var_12_1 = arg_10_2[arg_12_1 + 1]

		if var_12_1 then
			local var_12_2

			if arg_12_1 % 2 == 1 then
				var_12_2 = CCSprite:create("res/ui/kfyz/threeRoad/bfslyz_ybm_list_02.png")
			else
				var_12_2 = CCSprite:create("res/ui/kfyz/threeRoad/bfslyz_ybm_list_01.png")
			end

			var_12_2:setAnchorPoint(ccp(0, 0.5))
			var_12_0:addChild(var_12_2)

			local var_12_3 = CCLabelTTF:create(tonumber(arg_12_1 + 1) .. "·" .. var_12_1.playerName, "", 20)

			var_12_3:setAnchorPoint(ccp(0, 0.5))
			var_12_3:setPosition(ccp(35, 0))
			var_12_0:addChild(var_12_3)

			local var_12_4 = CCLabelTTF:create("Lv·" .. var_12_1.playerLv, "", 20)

			var_12_4:setAnchorPoint(ccp(0, 0.5))
			var_12_4:setPosition(ccp(180, 0))
			var_12_0:addChild(var_12_4)
		end

		return var_12_0
	end

	local function var_10_2()
		local var_13_0 = arg_10_2

		if var_13_0 and #var_13_0 > 0 then
			return #var_13_0
		else
			return 0
		end
	end

	local var_10_3 = CCTableView:create(CCSizeMake(290, 160))

	var_10_3:setPosition(-145, -127)
	var_10_3:setDirection(kCCScrollViewDirectionVertical)
	var_10_3:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_10_1:addChild(var_10_3)
	var_10_3:registerScriptHandler(var_10_0, CCTableView.kTableCellSizeForIndex)
	var_10_3:registerScriptHandler(var_10_1, CCTableView.kTableCellSizeAtIndex)
	var_10_3:registerScriptHandler(var_10_2, CCTableView.kNumberOfCellsInTableView)
	var_10_3:reloadData()
end

function var_0_0.refresh(arg_14_0)
	cmgr.sendRequest(function(arg_15_0)
		arg_14_0:update(arg_15_0.action.data)
	end, actions.kfyzGetDividedInfo)
end

function var_0_0.onEnter(arg_16_0)
	local function var_16_0(...)
		arg_16_0:removeFromParentAndCleanup(true)
	end

	arg_16_0.view.widgets.btn_close:addHandleOfControlEvent(var_16_0, CCControlEventTouchDown)
end

function var_0_0.onExit(arg_18_0)
	return
end

return var_0_0
