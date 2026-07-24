local var_0_0 = require("res/native/offset").get("layer.activity.furnace.furnaceTab")
local var_0_1 = require("lua/component/Button")
local var_0_2 = class("Furnace", function()
	return createBaseLayer()
end)
local var_0_3 = 1
local var_0_4 = 2
local var_0_5 = {
	{
		id = 1,
		name = "wutanmu"
	},
	{
		id = 2,
		name = "lihuamu"
	}
}

var_0_2.holePos = {
	{
		ccp(0, -64)
	},
	{
		ccp(-57, -60),
		ccp(63, -60)
	},
	{
		ccp(-93, -20),
		ccp(0, -82),
		ccp(92, -20)
	},
	{
		ccp(-113, -20),
		ccp(0, -82),
		ccp(113, -20),
		ccp(0, 87)
	},
	{
		ccp(-163, -92),
		ccp(0, -82),
		ccp(163, -92),
		ccp(-118, 62),
		ccp(118, 62)
	}
}
var_0_2.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = false,
		path = "res/ui/activity/furnace/sdyjs_bg.jpg"
	},
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			x = 458,
			y = 490,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/furnace/sdyjs_title.png"
			}
		},
		{
			fontSize = 25,
			name = "leftTime",
			type = "label",
			x = 730,
			style = "label_warlock",
			y = 480 + (var_0_0.timeLeftY or 0),
			anchorPoint = ccp(0.5, 0.5),
			color = colorQuality[5]
		},
		{
			style = "button_tip",
			name = "btn_tip",
			y = 490,
			type = "button",
			x = 840
		},
		{
			visible = false,
			name = "view1",
			x = 458,
			type = "sprite",
			y = 226,
			pic = {
				path = "res/ui/activity/furnace/sdyjs_bg3.jpg"
			},
			children = {
				{
					x = 178,
					y = 217,
					type = "sprite",
					pic = {
						path = "res/ui/activity/furnace/sdyjs_d01.png"
					}
				},
				{
					x = 586,
					y = 214,
					type = "sprite",
					pic = {
						path = "res/ui/activity/furnace/sdyjs_word_qwbssh.png"
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_gotoDiamondShop",
					h = 56,
					type = "button",
					w = 189,
					y = 102,
					x = 708,
					normal = {
						frame = false,
						path = "res/ui/common/button/sdyjs_btn_03.png"
					},
					touched = {
						frame = false,
						path = "res/ui/common/button/sdyjs_btn_03_c.png"
					},
					children = {
						{
							x = 92,
							y = 33,
							type = "sprite",
							pic = {
								path = "res/ui/activity/furnace/sdyjs_word_qwdh.png"
							}
						}
					}
				}
			}
		},
		{
			y = 0,
			name = "view2",
			type = "node",
			x = 0,
			children = {
				{
					y = 353,
					x = 223,
					type = "sprite",
					pic = {
						path = "res/ui/activity/furnace/sdyjs_time_bg.png"
					},
					children = {
						{
							fontSize = 22,
							style = "label_warlock",
							name = "label_addWoodInfo",
							type = "label",
							y = 40,
							x = 220,
							textId = 135510,
							color = colorText[10002]
						},
						{
							fontSize = 22,
							name = "label_addGemInfo",
							width = 300,
							type = "label",
							height = 0,
							textId = 135513,
							style = "label_warlock",
							y = 40,
							x = 190,
							color = colorText[10002]
						},
						{
							y = 0,
							name = "node_waitingInfo",
							type = "node",
							x = 0,
							children = {
								{
									y = 53,
									name = "node_waitingTime",
									x = 100,
									type = "node"
								},
								{
									fontSize = 22,
									name = "furnaceTimeDesc",
									type = "label",
									textId = 135507,
									style = "label_warlock",
									y = 53,
									x = 298,
									anchorPoint = ccp(0, 0.5),
									color = colorText[10002]
								},
								{
									fontSize = 22,
									style = "label_warlock",
									y = 27,
									type = "label",
									x = 150,
									textId = 135508,
									color = colorText[10002]
								},
								{
									fontSize = 22,
									style = "label_warlock",
									name = "label_totalDuration",
									type = "label",
									text = "00:00:00",
									x = 305,
									y = 27,
									color = colorText[10002]
								}
							}
						},
						{
							y = 0,
							name = "node_durationInfo",
							type = "node",
							x = 0,
							children = {
								{
									x = 83,
									y = 36,
									type = "sprite",
									pic = {
										path = "res/ui/general/jailView/icon_clock.png"
									}
								},
								{
									fontSize = 22,
									style = "label_warlock",
									name = "label_wutanmuTitle",
									type = "label",
									y = 53,
									x = 181,
									textId = 135505,
									color = colorText[10002]
								},
								{
									y = 53,
									name = "node_wutanmuDuration",
									x = 298,
									type = "node"
								},
								{
									fontSize = 22,
									style = "label_warlock",
									name = "label_lihuamuTitle",
									type = "label",
									y = 27,
									x = 181,
									textId = 135506,
									color = colorText[10002]
								},
								{
									y = 27,
									name = "node_lihuamuDuration",
									x = 298,
									type = "node"
								}
							}
						}
					}
				},
				{
					y = 202,
					name = "node_furnace",
					x = 458,
					type = "node"
				},
				{
					x = 437,
					name = "node_burningLeft",
					y = 39,
					type = "node",
					rotation = 21
				},
				{
					x = 487,
					name = "node_burningRight",
					y = 36,
					type = "node",
					rotation = -8
				},
				{
					y = 134,
					x = 784,
					type = "sprite",
					pic = {
						path = "res/ui/activity/furnace/sdyjs_samll_bg.png"
					},
					children = {
						{
							y = 223,
							name = "node_furnaceLevel",
							x = 118,
							type = "node"
						},
						{
							zoomOnTouchDown = true,
							name = "btn_buyLihuamu",
							h = 56,
							type = "button",
							w = 212,
							y = 113,
							x = 118,
							normal = {
								frame = false,
								path = "res/ui/common/button/sdyjs_btn_01.png"
							},
							touched = {
								frame = false,
								path = "res/ui/common/button/sdyjs_btn_01_c.png"
							},
							children = {
								{
									x = 122,
									y = 32,
									type = "sprite",
									pic = {
										path = "res/ui/activity/furnace/sdyjs_btn_word_lhm.png"
									}
								},
								{
									x = 36,
									y = 42,
									type = "sprite",
									pic = {
										path = "res/ui/activity/furnace/sdyjs_icon_lhm.png"
									}
								},
								{
									x = 22,
									y = 13,
									type = "sprite",
									pic = {
										path = "res/ui/activity/ironRotary/yuanbao.png"
									}
								},
								{
									fontSize = 24,
									style = "label_warlock",
									name = "label_lihuamuPrice",
									type = "label",
									x = 43,
									y = 15,
									color = colorQuality[4],
									anchorPoint = ccp(0, 0.5)
								},
								{
									name = "label_lihuamuCount",
									type = "atlaslabel",
									pic = "res/ui/activity/furnace/sdyjs_btn_digit.png",
									startCharMap = 48,
									text = "",
									y = 52,
									itemWidth = 22,
									x = 188,
									itemHeight = 31
								}
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_buyWutanmu",
							h = 56,
							type = "button",
							w = 212,
							y = 37,
							x = 118,
							normal = {
								frame = false,
								path = "res/ui/common/button/sdyjs_btn_02.png"
							},
							touched = {
								frame = false,
								path = "res/ui/common/button/sdyjs_btn_02_c.png"
							},
							children = {
								{
									x = 122,
									y = 32,
									type = "sprite",
									pic = {
										path = "res/ui/activity/furnace/sdyjs_btn_word_wtm.png"
									}
								},
								{
									x = 40,
									y = 36,
									type = "sprite",
									pic = {
										path = "res/ui/activity/furnace/sdyjs_icon_wtm.png"
									}
								},
								{
									x = 22,
									y = 13,
									type = "sprite",
									pic = {
										path = "res/ui/activity/ironRotary/yuanbao.png"
									}
								},
								{
									fontSize = 24,
									style = "label_warlock",
									name = "label_wutanmuPrice",
									type = "label",
									x = 43,
									y = 15,
									color = colorQuality[4],
									anchorPoint = ccp(0, 0.5)
								},
								{
									name = "label_wutanmuCount",
									type = "atlaslabel",
									pic = "res/ui/activity/furnace/sdyjs_btn_digit.png",
									startCharMap = 48,
									text = "",
									y = 52,
									itemWidth = 22,
									x = 188,
									itemHeight = 31
								}
							}
						}
					}
				},
				{
					y = -15,
					name = "node_fire",
					x = 315,
					type = "node"
				},
				{
					y = 423,
					x = 420,
					type = "node",
					children = {
						{
							fontSize = 30,
							name = "descNode1",
							type = "label",
							textId = 135501,
							style = "label_warlock",
							y = 0,
							x = -105,
							anchorPoint = ccp(0, 0.5),
							color = colorText[10002]
						},
						{
							fontSize = 30,
							name = "descNode2",
							type = "label",
							textId = 135502,
							style = "label_warlock",
							y = 0,
							x = -15,
							anchorPoint = ccp(0, 0.5),
							color = colorQuality[5]
						},
						{
							fontSize = 30,
							name = "descNode3",
							type = "label",
							textId = 135503,
							style = "label_warlock",
							y = 0,
							x = 105,
							anchorPoint = ccp(0, 0.5),
							color = colorText[10002]
						},
						{
							fontSize = 30,
							name = "descNode4",
							type = "label",
							textId = 135504,
							style = "label_warlock",
							y = 0,
							x = 216,
							anchorPoint = ccp(0, 0.5),
							color = colorQuality[5]
						}
					}
				}
			}
		}
	}
}
var_0_2.tipFrame = {
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
			width = 600,
			textId = 135518,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}

function var_0_2.ctor(arg_2_0, arg_2_1, arg_2_2)
	log.info("@@ 神鼎养晶石活动")
	showTable(arg_2_2)

	arg_2_0.view = {}

	uiutil.initWidgets(arg_2_0.view, arg_2_0.layout)

	arg_2_0.leftTime = arg_2_0.view.widgets.leftTime

	arg_2_0:refineLayout()

	arg_2_0.gems = {}

	if arg_2_1 then
		arg_2_0:addChild(arg_2_0.view.widgets.panel)
		arg_2_1:addChild(arg_2_0)
	end

	arg_2_0.view.widgets.btn_gotoDiamondShop:addHandleOfControlEvent(function()
		arg_2_0:onBtnGotoDiamondShopTouched()
	end, CCControlEventTouchUpInside)
	arg_2_0.view.widgets.btn_buyWutanmu:addHandleOfControlEvent(function()
		arg_2_0:onBtnBuyWoodTouched(var_0_5[var_0_3].id)
	end, CCControlEventTouchUpInside)
	arg_2_0.view.widgets.btn_buyLihuamu:addHandleOfControlEvent(function()
		arg_2_0:onBtnBuyWoodTouched(var_0_5[var_0_4].id)
	end, CCControlEventTouchUpInside)
	arg_2_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		arg_2_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_2_0.view.widgets.node_burningLeft:setRotation(15)
	arg_2_0.view.widgets.node_burningLeft:setScaleX(-1)
	arg_2_0.view.widgets.node_burningRight:setRotation(-5)
	arg_2_0:showPanel(arg_2_2)
end

function var_0_2.onEnter(arg_7_0)
	log.info("Furnace:onEnter()")
end

function var_0_2.onExit(arg_8_0)
	log.info("Furnace:onExit()")
end

function var_0_2.onTouchBegan(arg_9_0, arg_9_1, arg_9_2)
	log.info("onTouchBegan")

	arg_9_0.touchBeganX = arg_9_1
	arg_9_0.touchBeganY = arg_9_2

	if arg_9_0.view.widgets.gemListView then
		if not tool.checkIfTouch(arg_9_0.view.widgets.gemListView, arg_9_1, arg_9_2) then
			arg_9_0.view.widgets.gemListView:removeFromParentAndCleanup(true)

			arg_9_0.view.widgets.gemListView = nil
		end

		return true
	end

	log.info("return false false false")

	return false
end

function var_0_2.onTouchMoved(arg_10_0, arg_10_1, arg_10_2)
	return false
end

function var_0_2.onTouchEnded(arg_11_0, arg_11_1, arg_11_2)
	log.info("onTouchEnded")

	if arg_11_0.view.widgets.gemListView then
		local var_11_0 = 100

		if math.abs(arg_11_0.touchBeganX - arg_11_1) * math.abs(arg_11_0.touchBeganY - arg_11_2) < 400 then
			log.info("is touching")

			for iter_11_0, iter_11_1 in ipairs(arg_11_0.view.widgets.gemList) do
				if tool.checkIfTouch(iter_11_1, arg_11_1, arg_11_2) then
					log.info("touch a gem")
					cmgr.sendRequest(function(arg_12_0)
						log.info("handleLoadGem")
						arg_11_0.view.widgets.gemListView:removeFromParentAndCleanup(true)

						arg_11_0.view.widgets.gemListView = nil

						arg_11_0:update()
					end, actions.loadGemToFurnace, iter_11_1.vId, arg_11_0.view.widgets.gemListView.index)

					return true
				end
			end
		else
			log.info("is scrolling")
		end

		return true
	end

	return false
end

function var_0_2.onTouchCancelled(arg_13_0, arg_13_1, arg_13_2)
	return false
end

function var_0_2.onBtnGotoDiamondShopTouched(arg_14_0)
	require("lua/layer/weaponTab/ui")
	weaponTab.ui.show(3)
end

function var_0_2.showFurnace(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0.view.widgets.node_furnace
	local var_15_1 = "res/ui/activity/furnace/sdyjs_sd_0" .. tostring(arg_15_1 + 1) .. ".png"

	var_15_0:removeAllChildrenWithCleanup(true)
	var_15_0:addChild(CCSprite:create(var_15_1))

	local var_15_2 = arg_15_0.view.widgets.node_furnaceLevel
	local var_15_3 = "res/ui/activity/furnace/sdyjs_word_sd" .. tostring(arg_15_1) .. ".png"

	var_15_2:removeAllChildrenWithCleanup(true)
	var_15_2:addChild(CCSprite:create(var_15_3))
end

function var_0_2.setWoodPrice(arg_16_0, arg_16_1, arg_16_2)
	log.info("set wood price, type: " .. arg_16_1 .. "price: " .. arg_16_2)
	arg_16_0.view.widgets["label_" .. var_0_5[arg_16_1].name .. "Price"]:setString(tostring(arg_16_2))
end

function var_0_2.setWoodTotalDuration(arg_17_0, arg_17_1)
	local var_17_0 = tool.formatTime(arg_17_1, "@H:@M:@S")

	arg_17_0.view.widgets.label_totalDuration:setString(var_17_0)
end

function var_0_2.setWaitingTime(arg_18_0, arg_18_1)
	local var_18_0 = createTimerLabel(arg_18_1, "@H:@M:@S", "Thonburi", 22, function()
		arg_18_0:update()
	end, nil, nil, colorQuality[5])

	arg_18_0.view.widgets.node_waitingTime:addChild(var_18_0)
	arg_18_0.view.widgets.furnaceTimeDesc:setPositionX(arg_18_0.view.widgets.node_waitingTime:getPositionX() + var_18_0:getSize().width / 2 + 4)
end

function var_0_2.setWoodCount(arg_20_0, arg_20_1, arg_20_2)
	log.info("set wood count, type: " .. arg_20_1 .. " price: " .. arg_20_2)
	arg_20_0.view.widgets["label_" .. var_0_5[arg_20_1].name .. "Count"]:setString(tostring(arg_20_2))
end

function var_0_2.setWoodDuration(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	log.info("set wood duration, type: " .. arg_21_1 .. " duration: " .. arg_21_2 .. " enabled: " .. tostring(arg_21_3))
	log.info("last buy wood: " .. tostring(arg_21_0.lastBuyWood))

	local var_21_0 = "node_" .. var_0_5[arg_21_1].name .. "Duration"
	local var_21_1 = "label_" .. var_0_5[arg_21_1].name .. "Duration"
	local var_21_2 = "label_" .. var_0_5[arg_21_1].name .. "Title"

	if arg_21_3 == true then
		if not arg_21_0.lastBuyWood or arg_21_0.lastBuyWood and arg_21_1 == arg_21_0.lastBuyWood then
			local var_21_3 = createTimerLabel(arg_21_2, "@H:@M:@S", "Thonburi", 22, function()
				arg_21_0:setWoodDuration(arg_21_1, 0, false)

				if arg_21_1 == var_0_3 and arg_21_0.info.furnaces[var_0_4].cd >= 0 then
					arg_21_0:setBurning(var_0_4)
					arg_21_0:setWoodDuration(var_0_4, arg_21_0.info.furnaces[var_0_4].cd, true)
				else
					arg_21_0:setBurning(0)
				end
			end, nil, nil, colorQuality[5])

			log.info(var_21_0)
			arg_21_0.view.widgets[var_21_0]:removeAllChildrenWithCleanup(true)
			arg_21_0.view.widgets[var_21_0]:addChild(var_21_3)

			arg_21_0.view.widgets[var_21_1] = var_21_3

			arg_21_0.view.widgets[var_21_2]:setColor(colorText[10002])
		end
	else
		local var_21_4 = tool.formatTime(arg_21_2, "@H:@M:@S")
		local var_21_5 = CCStrokeLabelTTF:create(var_21_4, "Thonburi", 22)

		var_21_5:setColor(ccc3(193, 184, 178))
		arg_21_0.view.widgets[var_21_0]:removeAllChildrenWithCleanup(true)
		arg_21_0.view.widgets[var_21_0]:addChild(var_21_5)

		arg_21_0.view.widgets[var_21_1] = var_21_5

		arg_21_0.view.widgets[var_21_2]:setColor(ccc3(193, 184, 178))
	end

	arg_21_0.lastBuyWood = nil
end

function var_0_2.setBurning(arg_23_0, arg_23_1)
	log.info("setBurning " .. arg_23_1)

	if arg_23_0.furnaceId ~= arg_23_1 then
		local var_23_0
		local var_23_1

		if arg_23_1 == var_0_3 then
			var_23_0 = "res/ui/activity/furnace/sdyjs_icon_wtm.png"
			var_23_1 = "res/ui/activity/furnace/fire_pur.plist"
		elseif arg_23_1 == var_0_4 then
			var_23_0 = "res/ui/activity/furnace/sdyjs_icon_lhm.png"
			var_23_1 = "res/ui/activity/furnace/fire_red.plist"
		elseif arg_23_1 == 0 then
			var_23_0 = "res/ui/activity/furnace/sdyjs_icon_mh.png"
		end

		arg_23_0.view.widgets.node_burningLeft:removeAllChildrenWithCleanup(true)
		arg_23_0.view.widgets.node_burningRight:removeAllChildrenWithCleanup(true)
		arg_23_0.view.widgets.node_fire:removeAllChildrenWithCleanup(true)

		if var_23_0 then
			arg_23_0.view.widgets.node_burningLeft:addChild(CCSprite:create(var_23_0))
			arg_23_0.view.widgets.node_burningRight:addChild(CCSprite:create(var_23_0))
		end

		if var_23_1 then
			local var_23_2 = CCParticleSystemQuad:create(var_23_1)

			arg_23_0.view.widgets.node_fire:addChild(var_23_2)
			var_23_2:setScale(0.5)
		end
	end

	arg_23_0.furnaceId = arg_23_1
end

function var_0_2.onBtnBuyWoodTouched(arg_24_0, arg_24_1)
	log.info("buy wood")

	local var_24_0 = "buyFurnace" .. arg_24_1
	local var_24_1 = 135515 + arg_24_1

	messageBox.showChargeWinWithData(language.get(10003), language.get(var_24_1, arg_24_0.info.furnaces[arg_24_1].gold, arg_24_0.info.furnaces[arg_24_1].buyBundle * arg_24_0.info.furnaces[arg_24_1].pieces), var_24_0, function()
		cmgr.sendRequest(function(arg_26_0)
			log.info("handle buy wood")

			arg_24_0.lastBuyWood = arg_24_1

			local var_26_0
			local var_26_1
			local var_26_2

			log.info("status" .. arg_24_0.info.status)
			log.info("type" .. arg_24_1)

			if arg_24_0.furnaceId ~= var_0_4 and arg_24_0.furnaceId ~= var_0_3 then
				if arg_24_1 == var_0_3 then
					var_26_0 = "res/ui/activity/furnace/sdyjs_icon_wtm.png"
					var_26_2 = arg_24_0.view.widgets.btn_buyWutanmu
				elseif arg_24_1 == var_0_4 then
					var_26_0 = "res/ui/activity/furnace/sdyjs_icon_lhm.png"
					var_26_2 = arg_24_0.view.widgets.btn_buyLihuamu
				end

				log.info("pic" .. var_26_0)

				if var_26_0 then
					log.info("handle buy wood 2")

					var_26_1 = CCSprite:create(var_26_0)
				end
			elseif arg_24_0.info.furnaceId == 2 and arg_24_1 == var_0_3 then
				local var_26_3 = "res/ui/activity/furnace/sdyjs_icon_wtm.png"

				var_26_1 = CCSprite:create(var_26_3)
				var_26_2 = arg_24_0.view.widgets.btn_buyWutanmu
			end

			if var_26_1 then
				local var_26_4 = var_26_2:convertToWorldSpace(ccp(0, 0))
				local var_26_5 = arg_24_0.view.widgets.node_fire:convertToWorldSpace(ccp(0, 0))
				local var_26_6 = ccp(var_26_5.x - var_26_4.x, var_26_5.y - var_26_4.y)
				local var_26_7 = var_26_2:getContentSize()

				var_26_1:setPosition(ccp(var_26_7.width / 2, var_26_7.height / 2))
				var_26_2:addChild(var_26_1)

				local var_26_8 = CCArray:create()

				var_26_8:addObject(CCMoveBy:create(1, var_26_6))
				var_26_8:addObject(CCCallFunc:create(function()
					var_26_1:removeFromParentAndCleanup(true)
					arg_24_0:update()
				end))
				var_26_1:runAction(CCSequence:create(var_26_8))
			else
				arg_24_0:update()
			end
		end, actions.investWoodToFurnace, arg_24_1)
	end)
end

function var_0_2.showGem(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	local var_28_0 = arg_28_1.pos
	local var_28_1 = arg_28_1.pic
	local var_28_2 = arg_28_1.gemLv

	if arg_28_0.gems[var_28_0] then
		if arg_28_0.gems[var_28_0].info.vId ~= arg_28_1.vId then
			arg_28_0.gems[var_28_0]:removeFromParentAndCleanup(true)

			arg_28_0.gems[var_28_0] = nil
		else
			arg_28_0.gems[var_28_0].info = arg_28_1

			if arg_28_1.curPs and arg_28_1.maxPs then
				arg_28_0.gems[var_28_0].progress:setPercentage(arg_28_1.curPs / arg_28_1.maxPs * 100)
			end
		end
	end

	if arg_28_0.gems[var_28_0] == nil then
		if arg_28_0.holePos[arg_28_0.furnaceLevel] and arg_28_0.holePos[arg_28_0.furnaceLevel][var_28_0] then
			local var_28_3

			if var_28_1 then
				local var_28_4, var_28_5 = string.find(var_28_1, "baoshi")

				if var_28_4 and var_28_5 then
					var_28_3 = "res/ui/activity/furnace/" .. var_28_1 .. ".png"
				else
					local var_28_6 = math.modf((tonumber(var_28_2) - 1) / 4) + 1

					var_28_3 = "res/ui/activity/furnace/jinengshi" .. var_28_6 .. ".png"
				end
			else
				var_28_3 = "res/ui/activity/furnace/baoshi5.png"
			end

			local var_28_7 = arg_28_0.holePos[arg_28_0.furnaceLevel][var_28_0]
			local var_28_8 = var_0_1.create({
				zoomOnTouchDown = false,
				h = 60,
				w = 64,
				normal = {
					path = var_28_3
				},
				touched = {
					path = var_28_3
				},
				x = var_28_7.x,
				y = var_28_7.y
			}).displayObj

			var_28_8:addHandleOfControlEvent(handler(arg_28_0, arg_28_0.onGemTouched), CCControlEventTouchUpInside)

			local var_28_9 = CCSprite:create("res/ui/activity/furnace/sdyjs_jspb_bg.png")

			var_28_9:setPosition(ccp(32, -20))

			var_28_8.progressBg = var_28_9

			var_28_8:addChild(var_28_9)

			local var_28_10 = CCProgressTimer:create(CCSprite:create("res/ui/activity/furnace/sdyjs_jspb1.png"))

			var_28_10:setType(kCCProgressTimerTypeBar)
			var_28_10:setMidpoint(ccp(0, 0))
			var_28_10:setBarChangeRate(ccp(1, 0))
			var_28_10:setPosition(ccp(32, -20))

			if arg_28_1.curPs and arg_28_1.maxPs then
				var_28_10:setPercentage(arg_28_1.curPs / arg_28_1.maxPs * 100)
			end

			var_28_8.progress = var_28_10

			var_28_8:addChild(var_28_10)

			local var_28_11 = ""

			if arg_28_1.curPs and arg_28_1.maxPs and arg_28_1.addNum then
				var_28_11 = language.get(135511, string.format("%.1f", (arg_28_1.curPs + arg_28_1.addNum) / arg_28_1.maxPs * 100))
			end

			local var_28_12 = CCStrokeLabelTTF:create(var_28_11, "Thonburi", 22)

			var_28_12:setColor(colorText[10002])
			var_28_12:setPosition(32, -17)

			var_28_8.infoLabel = var_28_12

			var_28_8:addChild(var_28_12)
			arg_28_0.view.widgets.node_furnace:addChild(var_28_8)

			var_28_8.index = var_28_0
			var_28_8.info = arg_28_1
			arg_28_0.gems[var_28_0] = var_28_8
		else
			log.info("晶石位置不存在")
		end
	end

	arg_28_0.gems[var_28_0].infoLabel:setVisible(arg_28_3)

	if arg_28_2 then
		arg_28_0.gems[var_28_0]:setOpacity(255)
		arg_28_0.gems[var_28_0].progress:setVisible(arg_28_2)
		arg_28_0.gems[var_28_0].progressBg:setVisible(arg_28_2)
		arg_28_0.gems[var_28_0].progressBg:setVisible(arg_28_2)
	else
		arg_28_0.gems[var_28_0]:setOpacity(0)
		arg_28_0.gems[var_28_0].progress:setVisible(arg_28_2)
		arg_28_0.gems[var_28_0].progressBg:setVisible(arg_28_2)
		arg_28_0.gems[var_28_0].progressBg:setVisible(arg_28_2)
	end
end

function var_0_2.onGemTouched(arg_29_0, arg_29_1, arg_29_2)
	log.info("gem touched")

	if arg_29_2:getOpacity() == 0 then
		cmgr.sendRequest(function(arg_30_0)
			log.info("handleGetGemList")
			showTable(arg_30_0.action.data.gems)
			arg_29_0:showGemList(arg_30_0.action.data.gems, arg_29_2.index)
		end, actions.getGemList, arg_29_2.index)
	else
		cmgr.sendRequest(function(arg_31_0)
			log.info("handleUnloadGem")
			arg_29_0:update()
		end, actions.unLoadGemFromFurnace, arg_29_2.index)
	end
end

function var_0_2.showGemList(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = createBaseLayer()
	local var_32_1 = #arg_32_1

	arg_32_0.view.widgets.gemList = {}

	for iter_32_0 = 1, var_32_1 do
		local var_32_2 = arg_32_1[iter_32_0]
		local var_32_3
		local var_32_4, var_32_5 = string.find(var_32_2.pic, "baoshi")

		if var_32_4 and var_32_5 then
			var_32_3 = CCSprite:create("res/ui/weapon/" .. var_32_2.pic .. ".jpg")
		else
			local var_32_6 = math.modf((tonumber(var_32_2.gemLv) - 1) / 4) + 1

			var_32_3 = CCSprite:create("res/ui/weapon/jinengshi" .. var_32_6 .. ".png")
		end

		var_32_3.vId = var_32_2.vId
		var_32_3.pic = var_32_2.pic

		var_32_3:setPosition(ccp(90 * (iter_32_0 - 1) + 36, 36))
		var_32_0:addChild(var_32_3)
		table.insert(arg_32_0.view.widgets.gemList, var_32_3)

		local var_32_7 = math.mod(var_32_2.gemLv, 4)

		if var_32_7 == 0 then
			var_32_7 = 4
		end

		for iter_32_1 = 1, var_32_7 do
			local var_32_8 = CCSprite:create("res/ui/weapon/xing.png")

			var_32_8:setPosition(18 * iter_32_1 - 9, 62)
			var_32_8:setScale(0.7)
			var_32_3:addChild(var_32_8)
		end
	end

	local var_32_9 = CCSprite:create("res/ui/weapon/cangku.png")

	var_32_9:setPosition(visibleSize.width / 2, visibleSize.height / 2)

	local var_32_10 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_32_10:registerScriptTouchHandler(function(arg_33_0, arg_33_1, arg_33_2)
		if arg_33_0 == CCTOUCHBEGAN then
			return arg_32_0:onTouchBegan(arg_33_1, arg_33_2)
		elseif arg_33_0 == CCTOUCHMOVED then
			return arg_32_0:onTouchMoved(arg_33_1, arg_33_2)
		elseif arg_33_0 == CCTOUCHENDED then
			return arg_32_0:onTouchEnded(arg_33_1, arg_33_2)
		elseif arg_33_0 == CCTOUCHCANCELLED then
			return arg_32_0:onTouchCancelled(arg_33_1, arg_33_2)
		end
	end, false, true)
	var_32_10:setTouchEnabled(true)
	var_32_9:addChild(var_32_10)

	local var_32_11 = CCScrollView:create(CCSizeMake(474, 72))

	var_32_11:setContainer(var_32_0)
	var_32_11:setPosition(30, 30)
	var_32_11:setContentSize(CCSizeMake(var_32_1 * 90, 72))
	var_32_11:setDirection(kCCScrollViewDirectionHorizontal)
	var_32_9:addChild(var_32_11)

	local var_32_12 = CCLabelTTF:create(language.get(121006), "", 30)

	var_32_12:setPosition(ccp(267, 135))
	var_32_9:addChild(var_32_12)
	arg_32_0:addChild(var_32_9, 10000)

	arg_32_0.view.widgets.gemListView = var_32_9
	arg_32_0.view.widgets.gemListView.index = arg_32_2
end

function var_0_2.update(arg_34_0)
	cmgr.sendRequest(function(arg_35_0)
		log.info("update")
		arg_34_0:showPanel(arg_35_0.action.data)
	end, actions.getFurnaceActivity)
end

function var_0_2.showPanel(arg_36_0, arg_36_1)
	arg_36_0.info = arg_36_1

	if arg_36_1.lv == 0 then
		arg_36_0.view.widgets.view1:setVisible(true)
		arg_36_0.view.widgets.view2:setVisible(false)

		return
	end

	if arg_36_0.furnaceLevel ~= arg_36_1.lv then
		arg_36_0:showFurnace(arg_36_1.lv)

		arg_36_0.furnaceLevel = arg_36_1.lv
	end

	arg_36_0:setWoodPrice(var_0_3, arg_36_1.furnaces[var_0_3].gold)
	arg_36_0:setWoodPrice(var_0_4, arg_36_1.furnaces[var_0_4].gold)
	arg_36_0:setWoodCount(var_0_3, arg_36_1.furnaces[var_0_3].num)
	arg_36_0:setWoodCount(var_0_4, arg_36_1.furnaces[var_0_4].num)

	if arg_36_1.beginHour == 0 then
		if arg_36_1.furnaceId ~= var_0_4 and arg_36_1.furnaceId ~= var_0_3 then
			arg_36_0.view.widgets.node_waitingInfo:setVisible(false)
			arg_36_0.view.widgets.node_durationInfo:setVisible(false)
			arg_36_0.view.widgets.label_addGemInfo:setVisible(false)
			arg_36_0.view.widgets.label_addWoodInfo:setVisible(true)

			local var_36_0, var_36_1 = tool.getPositionInScreen(arg_36_0.view.widgets.btn_buyLihuamu)

			guide.control.loadGuide2(6, var_36_0 - 220, var_36_1 - 35, true, language.get(135512))
		else
			arg_36_0.view.widgets.node_waitingInfo:setVisible(false)
			arg_36_0.view.widgets.label_addWoodInfo:setVisible(false)
			arg_36_0.view.widgets.label_addGemInfo:setVisible(false)
			arg_36_0.view.widgets.node_durationInfo:setVisible(true)
			arg_36_0.view.widgets.node_durationInfo:setVisible(true)
			arg_36_0:setWoodDuration(var_0_3, arg_36_1.furnaces[var_0_3].cd, arg_36_1.furnaceId == var_0_3)
			arg_36_0:setWoodDuration(var_0_4, arg_36_1.furnaces[var_0_4].cd, arg_36_1.furnaceId == var_0_4)
		end
	else
		arg_36_0.view.widgets.node_durationInfo:setVisible(false)
		arg_36_0.view.widgets.label_addWoodInfo:setVisible(false)
		arg_36_0.view.widgets.label_addGemInfo:setVisible(false)
		arg_36_0.view.widgets.node_waitingInfo:setVisible(true)
		arg_36_0.view.widgets.node_waitingInfo:setVisible(true)
		arg_36_0:setWaitingTime(arg_36_1.beginHour)
		arg_36_0:setWoodTotalDuration(arg_36_1.furnaceCd)
	end

	local var_36_2 = false
	local var_36_3 = arg_36_1.beginHour ~= 0 or arg_36_1.furnaceId ~= var_0_4 and arg_36_1.furnaceId ~= var_0_3

	for iter_36_0, iter_36_1 in ipairs(arg_36_1.gems) do
		local var_36_4 = false

		if iter_36_1.vId and iter_36_1.vId ~= 0 then
			var_36_4 = true
			var_36_2 = true
		end

		arg_36_0:showGem(iter_36_1, var_36_4, var_36_3)
	end

	if var_36_2 == false then
		arg_36_0.view.widgets.node_durationInfo:setVisible(false)
		arg_36_0.view.widgets.label_addWoodInfo:setVisible(false)
		arg_36_0.view.widgets.node_waitingInfo:setVisible(false)
		arg_36_0.view.widgets.label_addGemInfo:setVisible(true)
	end

	if var_36_2 == false or arg_36_1.beginHour ~= 0 then
		arg_36_0:setBurning(-1)
	else
		arg_36_0:setBurning(arg_36_1.furnaceId)
	end
end

function var_0_2.showTip(arg_37_0, arg_37_1, arg_37_2)
	log.info("should show tips ")

	local var_37_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_37_0:registerScriptTouchHandler(function(arg_38_0, arg_38_1, arg_38_2)
		if arg_38_0 == CCTOUCHBEGAN then
			return true
		elseif arg_38_0 == CCTOUCHMOVED then
			return true
		elseif arg_38_0 == CCTOUCHENDED then
			pcall(var_37_0.removeFromParentAndCleanup, var_37_0, true)

			return true
		end
	end, false, true)
	var_37_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_37_0, 60000)

	local var_37_1 = 0
	local var_37_2 = 0
	local var_37_3 = {}

	uiutil.initWidgets(var_37_3, arg_37_0.tipFrame)
	var_37_0:addChild(var_37_3.widgets.tipFrame)

	local var_37_4, var_37_5 = tool.getPositionInScreen(arg_37_0.view.widgets.btn_tip)
	local var_37_6 = var_37_4 + 20
	local var_37_7 = var_37_5 - 20
	local var_37_8 = var_37_3.widgets.tipMsg:getContentSize().width
	local var_37_9 = var_37_3.widgets.tipMsg:getContentSize().height

	var_37_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_37_8 + 30, var_37_9 + 30))
	var_37_3.widgets.tipFrame:setPosition(ccp(var_37_6, var_37_7))
	var_37_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_37_3.widgets.tipFrame:setVisible(true)
end

function var_0_2.refineLayout(arg_39_0)
	arg_39_0.view.widgets.panel:reorderChild(arg_39_0.leftTime, 100)

	local var_39_0 = 4

	arg_39_0.view.widgets.descNode1:setPositionX(-380)
	arg_39_0.view.widgets.descNode2:setPositionX(arg_39_0.view.widgets.descNode1:getPositionX() + arg_39_0.view.widgets.descNode1:getContentSize().width + var_39_0)
	arg_39_0.view.widgets.descNode3:setPositionX(arg_39_0.view.widgets.descNode2:getPositionX() + arg_39_0.view.widgets.descNode2:getContentSize().width + var_39_0)
	arg_39_0.view.widgets.descNode4:setPositionX(arg_39_0.view.widgets.descNode3:getPositionX() + arg_39_0.view.widgets.descNode3:getContentSize().width + var_39_0)
end

return var_0_2
