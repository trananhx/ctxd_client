local var_0_0 = require("res/native/offset").get("layer.activity.IronSell")
local var_0_1 = class("IronSell", function()
	return createBaseLayer()
end)
local var_0_2 = 20
local var_0_3 = {
	bg = {
		xcenter = 0,
		name = "bgyanhua",
		type = "pic",
		ycenter = -30,
		pic = "res/ui/playerInfo/invite/bg.jpg",
		children = {
			{
				xcenter = 0,
				y = 455,
				pic = "res/ui/general/jailView/comm_list_laofang_3.png",
				type = "pic"
			},
			{
				fontSize = 28,
				name = "leftTime",
				type = "label",
				ycenter = 205,
				font = "Thonburi-Bold",
				x = 760,
				color = ccc3(253, 98, 98)
			},
			{
				xcenter = 0,
				name = "title",
				z = 200,
				type = "pic",
				ycenter = 210,
				pic = "res/ui/activity/ironSell/btdqx_title.png"
			},
			{
				x = 80,
				pic = "res/ui/activity/seaSilk/hssl_map_word_di.png",
				y = 460,
				type = "pic",
				scale = 0.6
			},
			{
				x = 35,
				y = 476,
				pic = "res/ui/activity/ironSell/xbtdfs_icon_tq.png",
				type = "pic"
			},
			{
				fontSize = 22,
				name = "state",
				anchorPointX = 0,
				type = "label",
				font = "Thonburi-Bold",
				y = 490,
				x = 65,
				color = ccc3(204, 185, 134),
				text = language.get(450091)
			},
			{
				fontSize = 22,
				name = "quanNum",
				anchorPointX = 0,
				type = "label",
				y = 460,
				font = "Thonburi-Bold",
				x = 65,
				text = "X 20"
			},
			{
				x = 458,
				name = "tiaoziBg",
				y = 48,
				type = "pic",
				pic = "res/ui/activity/ironSell/xbtdfs_pb_bg.png",
				children = {
					{
						y = 70,
						x = 480,
						type = "pic",
						pic = "res/ui/activity/generalDrink/zjlyx_zy_pb_d.png",
						children = {
							{
								xcenter = 0,
								name = "goldNumBar",
								percentage = 50,
								type = "process",
								ycenter = 0,
								pic = "res/ui/activity/generalDrink/zjlyx_zy_pb.png"
							}
						}
					},
					{
						x = 65,
						y = 70,
						pic = "res/ui/activity/ironSell/xbtdfs_word_xffj.png",
						type = "pic"
					},
					{
						fontSize = 22,
						name = "jinduNum",
						y = 70,
						type = "label",
						font = "Thonburi-Bold",
						text = "200/500",
						x = 480
					},
					{
						fontSize = 22,
						font = "Thonburi-Bold",
						y = 45,
						type = "label",
						x = 480,
						color = ccc3(204, 185, 134),
						text = language.get(450093)
					},
					{
						x = 870,
						name = "goldIconBg",
						y = 70,
						type = "pic",
						pic = "res/ui/activity/ironSell/xbtdfs_jb_d.png",
						children = {
							{
								xcenter = 0,
								name = "getGoldIcon",
								type = "pic",
								ycenter = 3,
								pic = "frame:res_icon_19.png"
							},
							{
								xcenter = 0,
								name = "getGoldNum",
								fontSize = 22,
								type = "label",
								ycenter = -16,
								font = "Thonburi-Bold",
								text = "100",
								z = 1000
							},
							{
								xcenter = 0,
								name = "light",
								pic = "res/ui/general/generalSilk/reward_icon_view_bg_light.png",
								visible = false,
								ycenter = 0,
								type = "pic",
								scale = 0.73
							}
						}
					}
				}
			},
			{
				y = 264,
				x = 127,
				type = "pic",
				pic = "res/ui/activity/ironSell/xbtdfs_icon_d1.png",
				children = {
					{
						x = 106,
						y = 228,
						pic = "res/ui/activity/ironSell/gtdqx_icon_g.png",
						type = "pic"
					},
					{
						x = 106,
						y = 130,
						pic = "res/ui/activity/ironSell/gtdqx_numb_bg.png",
						type = "pic"
					},
					{
						x = 55,
						y = 130,
						pic = "res/ui/activity/ironSell/gtdqx_icon_bg.png",
						type = "pic"
					},
					{
						x = 45,
						y = 282,
						pic = "res/ui/activity/ironSell/xbtdfs_jb_mianfei.png",
						type = "pic"
					},
					{
						x = 107,
						name = "icon11",
						y = 228,
						type = "pic",
						pic = "res/ui/common/ItemsPic/kuang.jpg"
					},
					{
						x = 55,
						name = "icon21",
						y = 130,
						type = "pic",
						pic = "frame:res_icon_4.png",
						children = {
							{
								xcenter = 60,
								name = "getIronNum1",
								fontSize = 22,
								type = "label",
								ycenter = 0,
								font = "Thonburi-Bold",
								text = " x 2000"
							}
						}
					},
					{
						xcenter = 0,
						name = "LeftNum1",
						y = 85,
						type = "label",
						fontSize = 22,
						font = "Thonburi-Bold",
						color = ccc3(204, 185, 134),
						text = language.get(450090, 0)
					},
					{
						xcenter = 0,
						y = 40,
						type = "button",
						buttons = {
							{
								pic2 = "res/ui/common/button/public_btn_orange_c.png",
								name = "ironButtons1",
								pic1 = "res/ui/common/button/public_btn_orange.png"
							}
						}
					},
					{
						xcenter = -50,
						y = 42,
						type = "pic",
						pic = "res/ui/common/button/public_btn_gold.png",
						children = {
							{
								xcenter = 0,
								ycenter = 0,
								pic = "res/ui/activity/ironSell/xbtdfs_icon_tq_samll.png",
								type = "pic"
							},
							{
								xcenter = 0,
								name = "costNum1",
								fontSize = 22,
								type = "label",
								ycenter = -5,
								font = "Thonburi-Bold",
								text = "0"
							}
						}
					},
					{
						fontSize = 22,
						font = "Thonburi-Bold",
						xcenter = 15,
						type = "label",
						y = 43,
						color = ccc3(204, 185, 134),
						text = language.get(450095)
					}
				}
			}
		}
	}
}

function var_0_1.ctor(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.data = arg_2_2
	arg_2_0.view = autoUI.initUI(arg_2_0, var_0_3)
	arg_2_0.leftTime = arg_2_0.view.leftTime

	arg_2_1:addChild(arg_2_0)

	local var_2_0 = arg_2_2.activityType == 1

	for iter_2_0 = 2, 4 do
		local var_2_1 = var_2_0 and string.format("res/ui/activity/ironSell/gt%d.jpg", iter_2_0) or "res/ui/common/ItemsPic/kuang.jpg"
		local var_2_2 = var_2_0 and "res/ui/weapon/godWeapon/sbxt_icon_blg.png" or "frame:res_icon_4.png"
		local var_2_3 = {
			y = 264,
			type = "pic",
			pic = "res/ui/activity/ironSell/xbtdfs_icon_d2.png",
			x = 127 + 220 * (iter_2_0 - 1),
			children = {
				{
					x = 106,
					y = 228,
					pic = "res/ui/activity/ironSell/gtdqx_icon_purple.png",
					type = "pic"
				},
				{
					x = 106,
					y = 130,
					pic = "res/ui/activity/ironSell/gtdqx_numb_bg.png",
					type = "pic"
				},
				{
					x = 55,
					y = 130,
					pic = "res/ui/activity/ironSell/gtdqx_icon_bg.png",
					type = "pic"
				},
				{
					x = 107,
					y = 228,
					type = "pic",
					pic = var_2_1
				},
				{
					y = 130,
					x = 55,
					type = "pic",
					pic = var_2_2,
					children = {
						{
							xcenter = 60,
							fontSize = 22,
							type = "label",
							ycenter = 0,
							font = "Thonburi-Bold",
							text = " x 2000",
							name = "getIronNum" .. iter_2_0
						}
					}
				},
				{
					xcenter = 0,
					y = 85,
					type = "label",
					fontSize = 22,
					font = "Thonburi-Bold",
					name = "LeftNum" .. iter_2_0,
					color = ccc3(204, 185, 134),
					text = language.get(450090, 0)
				},
				{
					xcenter = 0,
					y = 40,
					type = "button",
					buttons = {
						{
							pic2 = "res/ui/common/button/public_btn_green_c.png",
							pic1 = "res/ui/common/button/public_btn_green.png",
							name = "ironButtons" .. iter_2_0
						}
					}
				},
				{
					xcenter = -50,
					y = 42,
					type = "pic",
					pic = "res/ui/common/button/public_btn_gold.png",
					children = {
						{
							xcenter = 0,
							ycenter = 3,
							pic = "frame:res_icon_19.png",
							type = "pic"
						},
						{
							xcenter = 0,
							fontSize = 22,
							type = "label",
							ycenter = -7,
							font = "Thonburi-Bold",
							text = "10",
							name = "costNum" .. iter_2_0
						}
					}
				},
				{
					fontSize = 22,
					font = "Thonburi-Bold",
					xcenter = 15,
					type = "label",
					y = 43,
					color = ccc3(204, 185, 134),
					text = language.get(450096)
				}
			}
		}

		autoUI.createUI(arg_2_0.view.bgyanhua, var_2_3, arg_2_0.view)
	end

	if var_2_0 then
		arg_2_0.view.title:setDisplayFrame(CCSprite:create("res/ui/activity/ironSell/gtdqx_title.png"):displayFrame())
		arg_2_0.view.icon11:setDisplayFrame(CCSprite:create("res/ui/activity/ironSell/gt1.jpg"):displayFrame())
		arg_2_0.view.icon21:setDisplayFrame(CCSprite:create("res/ui/weapon/godWeapon/sbxt_icon_blg.png"):displayFrame())
	end

	for iter_2_1 = 1, 4 do
		arg_2_0.view["ironButtons" .. iter_2_1]:registerScriptTapHandler(function()
			local function var_3_0(arg_4_0)
				local var_4_0 = arg_4_0.action.data
				local var_4_1 = {
					{}
				}

				var_4_1[1].id = arg_2_0.data.activityType == 1 and 10033 or 4
				var_4_1[1].value = var_4_0.iron

				globalAction_gotResource(var_4_1)
				arg_2_0:refresh()
			end

			local function var_3_1()
				if arg_2_0.data.irons and arg_2_0.data.irons[iter_2_1] then
					cmgr.sendRequest(var_3_0, actions.getIronSellReward, arg_2_0.data.irons[iter_2_1].id)
				end
			end

			if iter_2_1 == 1 then
				if arg_2_0.data.needOverFlowTips then
					messageBox.confirm(language.get(450081), var_3_1, language.get(10001))
				else
					var_3_1()
				end
			else
				local var_3_2 = arg_2_0.data.activityType == 1 and 450080 or 450097

				messageBox.showChargeWin(language.get(190080), language.get(var_3_2, arg_2_0.data.irons[iter_2_1].gold, arg_2_0.data.irons[iter_2_1].iron), "irongive", var_3_1)
			end
		end)
	end

	local var_2_4 = CCArray:create()

	var_2_4:addObject(CCFadeIn:create(0.3))
	var_2_4:addObject(CCFadeOut:create(0.3))

	local var_2_5 = CCSequence:create(var_2_4)

	arg_2_0.view.light:runAction(CCRepeatForever:create(var_2_5))
	arg_2_0:showPanel()
end

function var_0_1.onEnter(arg_6_0)
	log.info("IronSell:onEnter()")

	arg_6_0.touchBeganRef = handler(arg_6_0, arg_6_0.onTouchBegan)
	arg_6_0.touchMovedRef = handler(arg_6_0, arg_6_0.onTouchMoved)
	arg_6_0.touchEndedRef = handler(arg_6_0, arg_6_0.onTouchEnded)
	arg_6_0.touchCancelledRef = handler(arg_6_0, arg_6_0.onTouchCancelled)

	eventManager.registerEvent("globalOnTouchBegan", arg_6_0.touchBeganRef)
	eventManager.registerEvent("globalOnTouchMoved", arg_6_0.touchMovedRef)
	eventManager.registerEvent("globalOnTouchEnded", arg_6_0.touchEndedRef)
	eventManager.registerEvent("globalOnTouchCancelled", arg_6_0.touchCancelledRef)
end

function var_0_1.onExit(arg_7_0)
	log.info("IronSell:onExit()")
	eventManager.unregisterEvent("globalOnTouchBegan", arg_7_0.touchBeganRef)
	eventManager.unregisterEvent("globalOnTouchMoved", arg_7_0.touchMovedRef)
	eventManager.unregisterEvent("globalOnTouchEnded", arg_7_0.touchEndedRef)
	eventManager.unregisterEvent("globalOnTouchCancelled", arg_7_0.touchCancelledRef)
end

function var_0_1.onTouchBegan(arg_8_0, arg_8_1, arg_8_2)
	if tool.checkIfTouch(arg_8_0.view.goldIconBg, arg_8_1, arg_8_2) and arg_8_0.data.bonusGold > 0 then
		local function var_8_0(arg_9_0)
			local var_9_0 = arg_9_0.action.data
			local var_9_1 = {
				{}
			}

			var_9_1[1].id = 19
			var_9_1[1].value = var_9_0.rewardGold

			globalAction_gotResource(var_9_1)
			arg_8_0:refresh()
		end

		cmgr.sendRequest(var_8_0, actions.getIronGiveBonus)
	elseif arg_8_0.view.cityName and tool.checkIfTouch(arg_8_0.view.cityName, arg_8_1, arg_8_2) and arg_8_0.data.cities and arg_8_0.data.cities[1] then
		loadingLayer.show(SCENE_WORLD, arg_8_0.data.cities[1].cityId)
	end
end

function var_0_1.onTouchMoved(arg_10_0, arg_10_1, arg_10_2)
	return
end

function var_0_1.onTouchEnded(arg_11_0, arg_11_1, arg_11_2)
	return
end

function var_0_1.onTouchCancelled(arg_12_0, arg_12_1, arg_12_2)
	return
end

function var_0_1.refresh(arg_13_0)
	local function var_13_0(arg_14_0)
		arg_13_0.data = arg_14_0.action.data

		arg_13_0:showPanel()
	end

	cmgr.sendRequest(var_13_0, actions.getIronSellActivity)
end

function var_0_1.showPanel(arg_15_0)
	arg_15_0.view.goldNumBar:setPercentage((arg_15_0.data.currGold - arg_15_0.data.startGold) / (arg_15_0.data.maxGold - arg_15_0.data.startGold) * 100)
	arg_15_0.view.jinduNum:setString(arg_15_0.data.currGold - arg_15_0.data.startGold .. "/" .. arg_15_0.data.maxGold - arg_15_0.data.startGold)

	local var_15_0

	if arg_15_0.data.bonusGold > 0 then
		var_15_0 = arg_15_0.data.bonusGold

		arg_15_0.view.getGoldIcon:removeAllChildrenWithCleanup(true)
		arg_15_0.view.light:setVisible(true)
	else
		if arg_15_0.data.currGold >= arg_15_0.data.maxGold then
			var_15_0 = language.get(111007)
		else
			var_15_0 = arg_15_0.data.nextBonusGold
		end

		arg_15_0.view.getGoldIcon:removeAllChildrenWithCleanup(true)
		tool.spriteToGray(arg_15_0.view.getGoldIcon)
		arg_15_0.view.light:setVisible(false)
	end

	arg_15_0.view.getGoldNum:setString(var_15_0)
	arg_15_0.view.quanNum:setString("x " .. arg_15_0.data.ticket)

	local var_15_1
	local var_15_2

	if arg_15_0.data.duringTask then
		arg_15_0.data.cities = {}
		arg_15_0.data.cd = 0
		var_15_1 = 1520115
		var_15_2 = tool.hexToRgb("#FFCC00")
	else
		var_15_1 = 450091
		var_15_2 = ccc3(204, 185, 134)
	end

	arg_15_0.view.state:setString(language.get(var_15_1))
	arg_15_0.view.state:setColor(var_15_2)

	if arg_15_0.data.cities and arg_15_0.data.cities[1] then
		local var_15_3 = CCLabelTTF:create(arg_15_0.data.cities[1].cityName, "Thonburi", 22)

		var_15_3:setPosition(ccp(220, 490))
		var_15_3:setColor(ccc3(0, 255, 0))
		arg_15_0.view.bgyanhua:removeChildByTag(101, true)
		arg_15_0.view.bgyanhua:addChild(var_15_3, 100, 101)

		arg_15_0.view.cityName = var_15_3
	elseif arg_15_0.data.cd > 0 then
		local function var_15_4()
			arg_15_0:refresh()
		end

		local var_15_5 = createTimerLabel(arg_15_0.data.cd + 100, language.get(122103), "Thonburi", 22, var_15_4, nil, nil, ccc3(255, 0, 0))

		var_15_5:setPosition(ccp(220, 490))

		if conf.language == "vie" or conf.language == "tha" then
			var_15_5:setPosition(ccp(250, 490))
		end

		arg_15_0.view.bgyanhua:removeChildByTag(101, true)
		arg_15_0.view.bgyanhua:addChild(var_15_5, 100, 101)

		arg_15_0.view.cityName = nil
	else
		arg_15_0.view.tiaoziBg:removeChildByTag(101, true)

		arg_15_0.view.cityName = nil
	end

	table.sort(arg_15_0.data.irons, function(arg_17_0, arg_17_1)
		return arg_17_0.gold < arg_17_1.gold
	end)

	for iter_15_0 = 1, 4 do
		if arg_15_0.data.irons[iter_15_0] then
			arg_15_0.view["getIronNum" .. iter_15_0]:setString(" x " .. arg_15_0.data.irons[iter_15_0].iron)
			arg_15_0.view["LeftNum" .. iter_15_0]:setString(language.get(450090, arg_15_0.data.irons[iter_15_0].num))

			if arg_15_0.data.irons[iter_15_0].gold > 0 then
				arg_15_0.view["costNum" .. iter_15_0]:setString(arg_15_0.data.irons[iter_15_0].gold)
			else
				arg_15_0.view["costNum" .. iter_15_0]:setString("" .. var_0_2)
			end
		end
	end
end

return var_0_1
