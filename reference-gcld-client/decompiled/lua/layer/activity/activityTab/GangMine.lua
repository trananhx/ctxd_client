local var_0_0 = require("res/native/offset").get("layer.activity.gangMine")
local var_0_1 = {
	[119] = 10033,
	[131] = 10050
}
local var_0_2 = {
	ccp(98, 330),
	ccp(228, 330),
	ccp(688, 330),
	ccp(818, 330),
	ccp(98, 180),
	ccp(228, 180),
	ccp(688, 180),
	ccp(818, 180)
}
local var_0_3 = {
	[0] = {
		pic = "sbdz_word_cjdz.png"
	},
	{
		pic = "sbdz_word_zjdz.png"
	},
	{
		pic = "sbdz_word_gjdz.png"
	}
}
local var_0_4 = colorQuality[0]
local var_0_5 = tool.hexToRgb("#D9EDC5")
local var_0_6 = ccc3(0, 255, 0)
local var_0_7 = colorQuality[5]
local var_0_8 = colorQuality[4]
local var_0_9 = colorQuality[2]
local var_0_10 = class("GangMine", function()
	return createBaseLayer()
end)

var_0_10.layout = {
	name = "panel",
	type = "sprite",
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	pic = {
		path = "res/ui/comment/bg1.jpg"
	},
	children = {
		{
			y = 458,
			name = "line1",
			type = "sprite",
			x = 458,
			pic = {
				path = "res/ui/general/jailView/comm_list_laofang_3.png"
			}
		},
		{
			y = 101,
			name = "line2",
			type = "sprite",
			x = 458,
			pic = {
				path = "res/ui/general/jailView/comm_list_laofang_3.png"
			}
		},
		{
			y = 260,
			x = 458,
			type = "sprite",
			pic = {
				path = "res/ui/activity/ironMine/btkd_bg_pit.jpg"
			}
		},
		{
			y = 480,
			name = "title",
			type = "sprite",
			x = 458,
			pic = {
				path = "res/ui/activity/gangMine/sbdz_title.png"
			}
		},
		{
			fontSize = 25,
			name = "leftTime",
			y = 465,
			type = "label",
			x = 780,
			style = "label_warlock",
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_7
		},
		{
			y = 465,
			type = "sprite",
			x = 80,
			pic = {
				path = "res/ui/activity/gangMine/blgkd_number_bg.png"
			},
			children = {
				{
					y = 20,
					x = 5,
					type = "sprite",
					scale = 0.6,
					pic = {
						path = "res/ui/activity/gangMine/blgkd_icon_blg.png"
					}
				},
				{
					fontSize = 22,
					name = "gangNum",
					y = 18,
					type = "label",
					x = 30,
					anchorPoint = ccp(0, 0.5)
				}
			}
		},
		{
			y = 465,
			type = "sprite",
			x = 220,
			pic = {
				path = "res/ui/activity/gangMine/blgkd_number_bg.png"
			},
			children = {
				{
					y = 20,
					x = 5,
					type = "sprite",
					scale = 0.6,
					pic = {
						path = "res/ui/activity/gangMine/blgkd_icon_bljg.png"
					}
				},
				{
					fontSize = 22,
					name = "goodGangNum",
					y = 18,
					type = "label",
					x = 30,
					anchorPoint = ccp(0, 0.5)
				}
			}
		},
		{
			y = 0,
			name = "node_mine",
			type = "node",
			x = 0,
			children = {
				{
					name = "btn_putBomb",
					h = 62,
					type = "button",
					w = 195,
					y = 40,
					x = 360,
					normal = {
						path = "res/ui/common/button/public_btn_green.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_green_c.png"
					},
					disable = {
						path = "res/ui/common/button/public_btn_green_g.png"
					},
					children = {
						{
							y = 35,
							x = 40,
							type = "sprite",
							scale = 0.9,
							pic = {
								frame = true,
								path = "btkd_btn_bomb.png"
							}
						},
						{
							fontSize = 25,
							y = 34,
							type = "label",
							x = 105,
							textId = 135037,
							color = var_0_5
						},
						{
							type = "node",
							name = "node_gold",
							y = 22,
							visible = false,
							x = 0,
							children = {
								{
									y = 0,
									x = 26,
									type = "sprite",
									pic = {
										frame = true,
										path = "res_icon_19_small.png"
									}
								},
								{
									fontSize = 22,
									name = "buyBombGold",
									y = 5,
									type = "label",
									x = 30,
									color = var_0_8,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							fontSize = 22,
							name = "bombNum",
							type = "label",
							visible = false,
							y = 27,
							x = 30,
							color = var_0_5,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					name = "btn_showWeapon",
					h = 62,
					type = "button",
					w = 195,
					y = 40,
					x = 560,
					normal = {
						path = "res/ui/common/button/public_btn_orange.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_orange_c.png"
					},
					disable = {
						path = "res/ui/common/button/public_btn_orange_g.png"
					},
					children = {
						{
							y = 34,
							type = "label",
							x = 100,
							textId = 136153,
							color = var_0_5,
							fontSize = 25 + (var_0_0.forgeFntSize or 0)
						},
						{
							x = 30,
							type = "sprite",
							y = 35,
							rotate = 20,
							scale = 0.65,
							pic = {
								path = "res/ui/mainCity/chui.png"
							}
						}
					}
				},
				{
					fontSize = 20,
					name = "infoLb1",
					width = 250,
					type = "label",
					height = 0,
					textId = 136152,
					y = 40,
					x = 10,
					color = var_0_5,
					anchorPoint = ccp(0, 0.5)
				},
				{
					fontSize = 20,
					name = "infoLb2",
					x = 905,
					type = "label",
					height = 0,
					y = 40,
					width = 250,
					color = var_0_5,
					anchorPoint = ccp(1, 0.5)
				},
				{
					type = "sprite",
					name = "bombEnd",
					y = 260,
					visible = false,
					x = 458,
					pic = {
						path = "res/ui/activity/gangMine/sbdz_word_kdyjtt.png"
					}
				}
			}
		},
		{
			type = "node",
			name = "node_weapon",
			y = 0,
			visible = false,
			x = 0,
			children = {
				{
					y = 259,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/activity/gangMine/blgkd_bg.png"
					}
				},
				{
					name = "btn_showMine",
					h = 62,
					type = "button",
					w = 195,
					y = 40,
					x = 360,
					normal = {
						path = "res/ui/common/button/public_btn_green.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_green_c.png"
					},
					disable = {
						path = "res/ui/common/button/public_btn_green_g.png"
					},
					children = {
						{
							fontSize = 25,
							y = 34,
							type = "label",
							x = 97,
							textId = 136154,
							color = var_0_5
						}
					}
				},
				{
					name = "btn_startUpgrade",
					h = 62,
					type = "button",
					w = 195,
					y = 40,
					x = 560,
					normal = {
						path = "res/ui/common/button/public_btn_orange.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_orange_c.png"
					},
					disable = {
						path = "res/ui/common/button/public_btn_orange_g.png"
					},
					children = {
						{
							fontSize = 25,
							y = 34,
							type = "label",
							x = 97,
							textId = 136164,
							color = var_0_5
						}
					}
				},
				{
					name = "btn_upgrade",
					h = 62,
					type = "button",
					w = 195,
					y = 40,
					visible = false,
					x = 460,
					normal = {
						path = "res/ui/common/button/public_btn_orange.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_orange_c.png"
					},
					disable = {
						path = "res/ui/common/button/public_btn_orange_g.png"
					},
					children = {
						{
							fontSize = 25,
							y = 34,
							type = "label",
							x = 97,
							textId = 136153,
							color = var_0_5
						}
					}
				},
				{
					y = 261,
					name = "icon",
					type = "sprite",
					x = 457,
					pic = {
						path = "res/ui/weapon/godWeapon/weapon7.jpg"
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_tip",
					h = 60,
					type = "button",
					w = 160,
					y = 400,
					x = 458,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					children = {
						{
							y = 30,
							type = "sprite",
							x = 80,
							pic = {
								path = "res/ui/weapon/godWeapon/sbxt_word_d.png"
							},
							children = {
								{
									y = 26,
									name = "round",
									type = "sprite",
									x = 138,
									pic = {
										path = "res/ui/activity/gangMine/sbdz_word_cjdz.png"
									}
								}
							}
						}
					}
				},
				{
					y = 140,
					type = "sprite",
					x = 458,
					pic = {
						path = "res/ui/activity/gangMine/blgkd_pb_bg.png"
					},
					children = {
						{
							fontSize = 25,
							name = "state",
							y = 75,
							type = "label",
							x = 155
						},
						{
							y = 30,
							type = "sprite",
							x = 155,
							pic = {
								path = "res/ui/world/feud/sbxt_w_pb_d.png"
							},
							children = {
								{
									y = 0,
									name = "bar",
									type = "progressbar",
									x = 0,
									anchorPoint = ccp(0, 0),
									pic = {
										path = "res/ui/world/feud/sbxt_w_pb.png"
									}
								},
								{
									fontSize = 22,
									name = "num_bar",
									y = 13,
									type = "label",
									x = 123
								}
							}
						}
					}
				},
				{
					y = 222,
					name = "bg_lv",
					type = "sprite",
					scaleX = 1.5,
					x = 458,
					pic = {
						path = "res/ui/activity/gangMine/blgkd_number_bg2.png"
					}
				},
				{
					fontSize = 20,
					name = "lv",
					y = 222,
					type = "label",
					x = 458,
					color = var_0_5
				},
				{
					zoomOnTouchDown = true,
					name = "btn_prev",
					h = 72,
					type = "button",
					w = 65,
					y = 260,
					x = 338,
					normal = {
						path = "res/ui/activity/gangMine/blgkd_btn.png"
					},
					touched = {
						path = "res/ui/activity/gangMine/blgkd_btn_c.png"
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_next",
					h = 72,
					rotate = 180,
					w = 65,
					type = "button",
					y = 260,
					x = 578,
					normal = {
						path = "res/ui/activity/gangMine/blgkd_btn.png"
					},
					touched = {
						path = "res/ui/activity/gangMine/blgkd_btn_c.png"
					}
				},
				{
					visible = false,
					name = "hammer",
					type = "sprite9",
					y = 180,
					x = 570,
					preferedSize = CCSizeMake(56, 150),
					middleRect = CCRectMake(1, 44, 1, 1),
					anchorPoint = ccp(0.5, 0),
					pic = {
						path = "res/ui/mainCity/chui.png"
					}
				}
			}
		},
		{
			y = 0,
			name = "btn_maskBottom",
			h = 80,
			type = "button",
			w = 915,
			zorder = 100,
			visible = false,
			x = 0,
			normal = {
				path = "res/default.png"
			},
			touched = {
				path = "res/default.png"
			},
			anchorPoint = ccp(0, 0)
		},
		{
			y = 80,
			name = "btn_maskMiddle",
			h = 360,
			type = "button",
			w = 915,
			zorder = 100,
			visible = false,
			x = 0,
			normal = {
				path = "res/default.png"
			},
			touched = {
				path = "res/default.png"
			},
			anchorPoint = ccp(0, 0),
			children = {}
		},
		{
			x = 0,
			height = 80,
			name = "mask_bottom",
			type = "layerColor",
			y = 0,
			zorder = 100,
			visible = false,
			width = 915,
			color = ccc4(0, 0, 0, 180)
		},
		{
			x = 0,
			height = 360,
			name = "mask_middle",
			type = "layerColor",
			y = 80,
			zorder = 100,
			visible = false,
			width = 915,
			color = ccc4(0, 0, 0, 180),
			children = {}
		},
		{
			fontSize = 25,
			name = "num_reward",
			type = "label",
			visible = false,
			y = 105,
			x = 458,
			zorder = 100,
			color = var_0_6
		},
		{
			type = "sprite",
			name = "upgradeEnd",
			y = 260,
			visible = false,
			x = 458,
			zorder = 200,
			pic = {
				path = "res/ui/activity/gangMine/blgkd_word_over.png"
			}
		}
	}
}

function var_0_10.getSingleBtnRes(arg_2_0, arg_2_1)
	return {
		zoomOnTouchDown = true,
		h = 70,
		type = "button",
		w = 70,
		y = 0,
		x = 0,
		name = "btn_area" .. arg_2_1,
		normal = {
			path = "res/ui/activity/gangMine/blgkd_icon_c_bg.png"
		},
		touched = {
			path = "res/ui/activity/gangMine/blgkd_icon_c_bg.png"
		},
		children = {
			{
				y = 35,
				type = "sprite",
				x = 35,
				name = "icon" .. arg_2_1,
				pic = {
					path = "res/ui/activity/gangMine/blgkd_icon_lock.png"
				}
			},
			{
				type = "sprite",
				y = -20,
				visible = false,
				x = 35,
				name = "bg_num" .. arg_2_1,
				pic = {
					path = "res/ui/activity/gangMine/blgkd_number_bg2.png"
				},
				children = {
					{
						fontSize = 20,
						y = 13,
						type = "label",
						x = 46,
						name = "num" .. arg_2_1
					}
				}
			}
		}
	}
end

function var_0_10.refresh(arg_3_0)
	local function var_3_0(arg_4_0)
		arg_3_0:showPanel(arg_4_0.action.data)
	end

	cmgr.sendRequest(var_3_0, actions.getGangMineActivity)
end

function var_0_10.onBombGangMine(arg_5_0)
	local function var_5_0(arg_6_0)
		arg_5_0:refresh()
	end

	cmgr.sendRequest(var_5_0, actions.gangMineBomb)
end

function var_0_10.onPutGangMineBomb(arg_7_0)
	local function var_7_0(arg_8_0)
		local var_8_0 = arg_8_0.action.data.buyBombGold

		arg_7_0.info.buyBombGold = var_8_0

		arg_7_0.view.widgets.buyBombGold:setString(var_8_0)

		arg_7_0.putBombNum = arg_7_0.putBombNum + 1
		arg_7_0.info.bombNum = arg_7_0.info.bombNum + 1

		arg_7_0:addBomb()
	end

	local function var_7_1()
		cmgr.sendRequest(var_7_0, actions.gangMineBuyBomb)
	end

	if arg_7_0.putBombNum < arg_7_0.info.bombNum then
		arg_7_0.putBombNum = arg_7_0.putBombNum + 1

		arg_7_0:addBomb()
	else
		messageBox.showChargeWin("", language.get(135030, arg_7_0.info.buyBombGold), "gangMineBuyBomb", var_7_1)
	end
end

function var_0_10.onRecvReward(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	local var_10_0 = arg_10_0.info.stockInfo
	local var_10_1 = 0
	local var_10_2 = {}

	local function var_10_3(arg_11_0)
		for iter_11_0, iter_11_1 in ipairs(arg_11_0.action.data.rewards) do
			local var_11_0 = {
				id = var_0_1[iter_11_1.type],
				value = iter_11_1.num
			}

			table.insert(var_10_2, var_11_0)

			if iter_11_1.type == 119 then
				var_10_0.gangNum = var_10_0.gangNum + iter_11_1.num
			elseif iter_11_1.type == 131 then
				var_10_0.goodGangNum = var_10_0.goodGangNum + iter_11_1.num
			end
		end

		var_10_1 = var_10_1 + 1

		if var_10_1 == 1 then
			tolua.cast(table.remove(arg_10_0.bombGang, arg_10_1).obj, "CCSprite"):removeFromParentAndCleanup(true)
		else
			tolua.cast(table.remove(arg_10_0.bombGang).obj, "CCSprite"):removeFromParentAndCleanup(true)
		end

		if var_10_1 < arg_10_2 then
			cmgr.sendRequest(var_10_3, actions.gangMineRecvReward, arg_10_0.bombGang[#arg_10_0.bombGang].type)
		else
			globalAction_gotResource(var_10_2)
			arg_10_0.view.widgets.gangNum:setString(var_10_0.gangNum)
			arg_10_0.view.widgets.goodGangNum:setString(var_10_0.goodGangNum)

			if arg_10_3 then
				arg_10_0:refresh()
			end
		end
	end

	cmgr.sendRequest(var_10_3, actions.gangMineRecvReward, arg_10_0.bombGang[arg_10_1].type)
end

function var_0_10.onStartUpgrade(arg_12_0)
	local function var_12_0(arg_13_0)
		arg_12_0.view.widgets.mask_bottom:setVisible(true)
		arg_12_0.view.widgets.btn_maskBottom:setVisible(true)
		arg_12_0:showEffectTextFly("res/ui/activity/gangMine/sbdz_word_ksdz.png", function()
			arg_12_0:refresh()
		end)
	end

	local var_12_1 = arg_12_0.info.weapons[arg_12_0.weaponIdx]

	cmgr.sendRequest(var_12_0, actions.gangMineStartUpgrade, var_12_1.id)
end

function var_0_10.onSwitchWeapon(arg_15_0)
	local function var_15_0(arg_16_0)
		arg_15_0:refresh()
	end

	cmgr.sendRequest(var_15_0, actions.gangMineSwitchWeapon)
end

function var_0_10.onUpgradeWeapon(arg_17_0)
	local function var_17_0(arg_18_0)
		local var_18_0 = arg_18_0.action.data
		local var_18_1 = var_18_0.weaponInfo

		arg_17_0.info.weapons[arg_17_0.weaponIdx].lv = var_18_1.lv

		arg_17_0.view.widgets.lv:setString(language.get(83027, var_18_1.lv))

		local var_18_2 = math.floor(100 * var_18_1.times / var_18_1.totalTimes)

		arg_17_0.view.widgets.num_bar:setString(var_18_2 .. "%")
		arg_17_0.view.widgets.bar:setPercentage(var_18_2)
		arg_17_0.view.widgets.state:setString(language.get(136163))

		arg_17_0.info.leftUseNum = arg_17_0.info.leftUseNum - 1

		arg_17_0.view.widgets.state:setString(language.get(136165, arg_17_0.info.leftUseNum))
		arg_17_0.view.widgets.hammer:stopAllActions()
		arg_17_0.view.widgets.hammer:setOpacity(255)
		arg_17_0.view.widgets.hammer:setRotation(0)
		arg_17_0.view.widgets.hammer:setVisible(true)

		local var_18_3 = CCArray:create()

		var_18_3:addObject(CCEaseBounceOut:create(CCRotateTo:create(0.5, -50)))
		var_18_3:addObject(CCFadeOut:create(0.2))
		var_18_3:addObject(CCDelayTime:create(0.5))
		var_18_3:addObject(CCCallFunc:create(function()
			local var_19_0 = math.min(arg_17_0.info.weapons[1].lv, arg_17_0.info.weapons[2].lv, arg_17_0.info.weapons[3].lv)
			local var_19_1

			if var_19_0 >= MAX_GOD_WEAPON_LV then
				var_19_1 = "sbdz_word_ndsbyqbmj.png"
			elseif arg_17_0.info.leftUseNum == 0 then
				var_19_1 = "sbdz_word_dzjs.png"
			end

			if var_19_1 then
				arg_17_0:showEffectTextFly("res/ui/activity/gangMine/" .. var_19_1, function()
					arg_17_0:refresh()
				end)
			else
				arg_17_0:refresh()
			end
		end))

		local var_18_4 = CCSequence:create(var_18_3)

		arg_17_0.view.widgets.hammer:runAction(var_18_4)

		local var_18_5, var_18_6 = arg_17_0.view.widgets.icon:getPosition()
		local var_18_7 = rmgr.getAnimation("warlockUpgrade")
		local var_18_8 = CCAnimation:createWithSpriteFrames(var_18_7, 0.05)
		local var_18_9 = CCAnimate:create(var_18_8)
		local var_18_10 = CCSprite:create()

		arg_17_0.view.widgets.node_weapon:addChild(var_18_10, 10)
		var_18_10:setPosition(ccp(var_18_5, var_18_6))
		var_18_10:runAction(var_18_9)

		local var_18_11 = {
			"mz7.png",
			"mz8.png",
			nil,
			"mz9.png",
			[10] = "mz10.png"
		}
		local var_18_12 = #var_18_0.baojiInfo

		for iter_18_0, iter_18_1 in ipairs(var_18_0.baojiInfo) do
			local var_18_13 = var_18_11[iter_18_1.baoji]

			if var_18_13 then
				local var_18_14 = CCSprite:create("res/ui/weapon/" .. var_18_13)

				var_18_14:setPosition(ccp(var_18_5, var_18_6))
				var_18_14:setScale(0.2)
				arg_17_0.view.widgets.node_weapon:addChild(var_18_14, 20)

				local var_18_15 = CCArray:create()

				var_18_15:addObject(CCScaleTo:create(0.3, 1))
				var_18_15:addObject(CCDelayTime:create(0.7))
				var_18_15:addObject(CCCallFuncN:create(function(arg_21_0)
					arg_21_0:removeFromParentAndCleanup(true)
				end))

				local var_18_16 = CCSequence:create(var_18_15)

				var_18_14:runAction(var_18_16)
			end
		end
	end

	cmgr.sendRequest(var_17_0, actions.gangMineUpgradeWeapon)
end

function var_0_10.onBtnAreaTap(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0.info.stockInfo
	local var_22_1 = arg_22_0.info.areas[arg_22_1]

	var_22_1.num = var_22_1.num or 0

	local var_22_2 = var_22_1.type == 1 and "gangNum" or "goodGangNum"

	if var_22_1.num == 0 then
		if var_22_1.currNeedNum > var_22_0[var_22_2] then
			smgr.showTipText(language.get(var_22_1.type == 1 and 136158 or 136159))
		else
			var_22_1.num = var_22_1.currNeedNum
			var_22_0[var_22_2] = var_22_0[var_22_2] - var_22_1.currNeedNum

			local var_22_3 = CCSprite:create("res/ui/activity/gangMine/blgkd_word_clyjr.png")

			var_22_3:setPosition(var_0_2[arg_22_1])
			arg_22_0.view.widgets.node_weapon:addChild(var_22_3, 20)

			local var_22_4 = CCArray:create()

			var_22_4:addObject(CCMoveBy:create(0.5, ccp(0, 60)))
			var_22_4:addObject(CCDelayTime:create(0.3))
			var_22_4:addObject(CCCallFuncN:create(function(arg_23_0)
				arg_23_0:removeFromParentAndCleanup(true)
			end))

			local var_22_5 = CCSequence:create(var_22_4)

			var_22_3:runAction(var_22_5)
		end
	else
		var_22_1.num = 0
		var_22_0[var_22_2] = var_22_0[var_22_2] + var_22_1.currNeedNum
	end

	arg_22_0.view.widgets[var_22_2]:setString(var_22_0[var_22_2])
	arg_22_0.view.widgets["num" .. arg_22_1]:setString(language.get(390478, var_22_1.num, var_22_1.currNeedNum))
	arg_22_0.view.widgets["light" .. arg_22_1]:setVisible(var_22_1.num > 0)

	local var_22_6 = arg_22_0.info.weapons[arg_22_0.weaponIdx]
	local var_22_7 = true
	local var_22_8
	local var_22_9

	if var_22_6.isMaxLv then
		var_22_7 = false
		var_22_8 = 136169
		var_22_9 = var_0_7
	else
		for iter_22_0, iter_22_1 in ipairs(arg_22_0.info.areas) do
			if iter_22_1.currNeedNum > 0 and iter_22_1.num == 0 then
				var_22_7 = false

				break
			end
		end

		var_22_8 = var_22_7 and 136162 or 136160
		var_22_9 = var_22_7 and var_0_7 or var_0_5
	end

	arg_22_0.view.widgets.btn_startUpgrade:setEnabled(var_22_7)
	arg_22_0.view.widgets.state:setString(language.get(var_22_8))
	arg_22_0.view.widgets.state:setColor(var_22_9)
end

function var_0_10.onBtnUpgradeTap(arg_24_0)
	local var_24_0 = arg_24_0.info.weapons[arg_24_0.weaponIdx]
	local var_24_1 = math.min(arg_24_0.info.weapons[1].lv, arg_24_0.info.weapons[2].lv, arg_24_0.info.weapons[3].lv)

	if var_24_0.lv % 10 == 0 and var_24_1 < var_24_0.lv then
		arg_24_0.view.widgets.mask_bottom:setVisible(true)
		arg_24_0.view.widgets.btn_maskBottom:setVisible(true)
		arg_24_0:showEffectTextFly("res/ui/activity/gangMine/sbdz_word_djsxqhsb.png", function()
			arg_24_0:onSwitchWeapon()
		end)
	else
		arg_24_0:onUpgradeWeapon()
	end
end

function var_0_10.updateWeaponInfo(arg_26_0)
	arg_26_0.weaponIdx = arg_26_0.weaponIdx or 1
	arg_26_0.weaponIdx = 1 + (arg_26_0.weaponIdx - 1) % 3

	local var_26_0 = arg_26_0.info.weapons[arg_26_0.weaponIdx]

	arg_26_0.view.widgets.icon:setDisplayFrame(CCSprite:create(string.format("res/ui/weapon/godWeapon/weapon%s.jpg", var_26_0.id)):displayFrame())
	arg_26_0.view.widgets.lv:setString(language.get(83027, var_26_0.lv))

	local var_26_1 = math.floor(100 * var_26_0.times / var_26_0.totalTimes)

	arg_26_0.view.widgets.num_bar:setString(var_26_1 .. "%")
	arg_26_0.view.widgets.bar:setPercentage(var_26_1)

	local var_26_2 = arg_26_0.info.leftUseNum > 0
	local var_26_3
	local var_26_4

	if var_26_2 then
		var_26_3 = language.get(136165, arg_26_0.info.leftUseNum)
		var_26_4 = var_0_5
	else
		var_26_3 = language.get(var_26_0.isMaxLv and 136169 or 136160)
		var_26_4 = var_26_0.isMaxLv and var_0_7 or var_0_5

		arg_26_0.view.widgets.btn_startUpgrade:setEnabled(false)
	end

	arg_26_0.view.widgets.state:setString(var_26_3)
	arg_26_0.view.widgets.state:setColor(var_26_4)

	local var_26_5 = arg_26_0.info.stockInfo

	for iter_26_0, iter_26_1 in ipairs(arg_26_0.info.areas) do
		local var_26_6

		iter_26_1.currNeedNum = arg_26_0:getCurrNeedNum(iter_26_1.needNum)

		if iter_26_1.currNeedNum > 0 then
			if iter_26_1.type == 1 then
				var_26_6 = "blgkd_icon_blg_c.png"
			elseif iter_26_1.type == 2 then
				var_26_6 = "blgkd_icon_bljg_c.png"
			end
		else
			var_26_6 = "blgkd_icon_lock.png"
		end

		if var_26_6 ~= nil then
			arg_26_0.view.widgets["icon" .. iter_26_0]:setDisplayFrame(CCSprite:create("res/ui/activity/gangMine/" .. var_26_6):displayFrame())
		end

		arg_26_0.view.widgets["btn_area" .. iter_26_0]:setEnabled(not var_26_2)
		arg_26_0.view.widgets["bg_num" .. iter_26_0]:setVisible(not var_26_2)

		iter_26_1.num = iter_26_1.num or 0

		local var_26_7 = iter_26_1.type == 1 and "gangNum" or "goodGangNum"

		if iter_26_1.num ~= 0 then
			var_26_5[var_26_7] = var_26_5[var_26_7] + iter_26_1.num
			iter_26_1.num = 0
		end

		arg_26_0.view.widgets["num" .. iter_26_0]:setString(language.get(390478, iter_26_1.num, iter_26_1.currNeedNum))
		arg_26_0.view.widgets["light" .. iter_26_0]:setVisible(iter_26_1.num > 0)
	end

	arg_26_0.view.widgets.gangNum:setString(var_26_5.gangNum)
	arg_26_0.view.widgets.goodGangNum:setString(var_26_5.goodGangNum)
end

function var_0_10.initNodeMine(arg_27_0)
	for iter_27_0, iter_27_1 in ipairs(arg_27_0.info.areas) do
		iter_27_1.num = iter_27_1.num or 0

		local var_27_0 = iter_27_1.type == 1 and "gangNum" or "goodGangNum"

		if iter_27_1.num > 0 then
			arg_27_0.info.stockInfo[var_27_0] = arg_27_0.info.stockInfo[var_27_0] + iter_27_1.num
			iter_27_1.num = 0
		end
	end

	arg_27_0.putBombNum = 0
end

function var_0_10.initNodeWeapon(arg_28_0)
	table.sort(arg_28_0.info.areas, function(arg_29_0, arg_29_1)
		return arg_29_0.id < arg_29_1.id
	end)

	if arg_28_0.info.nowWeaponId == 7 or arg_28_0.info.nowWeaponId == 8 or arg_28_0.info.nowWeaponId == 9 then
		arg_28_0.weaponIdx = arg_28_0.info.nowWeaponId - 6
	end

	local var_28_0 = math.min(arg_28_0.info.weapons[1].lv, arg_28_0.info.weapons[2].lv, arg_28_0.info.weapons[3].lv)

	for iter_28_0, iter_28_1 in pairs(arg_28_0.info.weapons) do
		iter_28_1.isMaxLv = iter_28_1.lv % 10 == 0 and var_28_0 < iter_28_1.lv
	end

	arg_28_0:updateWeaponInfo()
end

function var_0_10.addBomb(arg_30_0, arg_30_1)
	if arg_30_0.bombNode then
		arg_30_0.bombNode:removeAllChildrenWithCleanup(true)
	else
		arg_30_0.bombNode = CCNode:create()

		arg_30_0.view.widgets.panel:addChild(arg_30_0.bombNode, 10)
	end

	if arg_30_1 then
		return
	end

	local var_30_0 = arg_30_0.info.bombNum > arg_30_0.putBombNum

	arg_30_0.view.widgets.bombNum:setVisible(var_30_0)
	arg_30_0.view.widgets.node_gold:setVisible(not var_30_0)

	if var_30_0 then
		arg_30_0.view.widgets.bombNum:setString(language.get(490026, arg_30_0.info.bombNum - arg_30_0.putBombNum))
	else
		arg_30_0.view.widgets.buyBombGold:setString(arg_30_0.info.buyBombGold)
	end

	arg_30_0.view.widgets.infoLb2:setString(language.get(135050, arg_30_0.info.singleBombNum - arg_30_0.putBombNum))

	local var_30_1 = {
		ccp(170, 105),
		ccp(440, 165),
		ccp(720, 135)
	}

	for iter_30_0 = 1, arg_30_0.putBombNum do
		local var_30_2 = CCSprite:createWithSpriteFrameName("btkd_icon_bomb.png")

		var_30_2:setAnchorPoint(ccp(0.5, 0))
		var_30_2:setPosition(var_30_1[iter_30_0])
		arg_30_0.bombNode:addChild(var_30_2)
	end

	if arg_30_0.putBombNum >= arg_30_0.info.singleBombNum then
		arg_30_0.view.widgets.mask_bottom:setVisible(true)
		arg_30_0.view.widgets.btn_maskBottom:setVisible(true)
		arg_30_0:showBombEffect()
	end
end

function var_0_10.addGang(arg_31_0, arg_31_1)
	if arg_31_0.gangNode then
		arg_31_0.gangNode:removeAllChildrenWithCleanup(true)
	else
		arg_31_0.gangNode = CCSpriteBatchNode:create("res/ui/activity/gangMine/gang.png")

		arg_31_0.view.widgets.panel:addChild(arg_31_0.gangNode, 200)
	end

	math.randomseed(os.time())

	arg_31_0.bombGang = {}

	if not arg_31_1 then
		return
	end

	if arg_31_0.info.copiesBombIron > 0 then
		for iter_31_0 = 1, arg_31_0.info.copiesBombIron do
			local var_31_0 = CCSprite:createWithSpriteFrameName("blgkd_icon_blg.png")

			arg_31_0.gangNode:addChild(var_31_0)

			local var_31_1 = math.random(90, 820)
			local var_31_2 = math.random(160, 230)

			var_31_0:setPosition(ccp(var_31_1, 420))
			var_31_0:runAction(CCEaseBounceOut:create(CCMoveTo:create(1, ccp(var_31_1, var_31_2))))
			table.insert(arg_31_0.bombGang, {
				type = 1,
				obj = var_31_0
			})
		end
	end

	if arg_31_0.info.copiesBombGoodGang > 0 then
		for iter_31_1 = 1, arg_31_0.info.copiesBombGoodGang do
			local var_31_3 = CCSprite:createWithSpriteFrameName("blgkd_icon_bljg.png")

			arg_31_0.gangNode:addChild(var_31_3)

			local var_31_4 = math.random(90, 820)
			local var_31_5 = math.random(160, 240)

			var_31_3:setPosition(ccp(var_31_4, 420))
			var_31_3:runAction(CCEaseBounceOut:create(CCMoveTo:create(1, ccp(var_31_4, var_31_5))))
			table.insert(arg_31_0.bombGang, {
				type = 2,
				obj = var_31_3
			})
		end
	end
end

function var_0_10.showBombEffect(arg_32_0)
	local var_32_0 = arg_32_0.bombNode:getChildren()

	if var_32_0 and var_32_0:count() > 0 then
		for iter_32_0 = 1, var_32_0:count() do
			local var_32_1 = tolua.cast(var_32_0:objectAtIndex(iter_32_0 - 1), "CCSprite")
			local var_32_2 = CCArray:create()
			local var_32_3 = CCRotateBy:create(0.1, 10)
			local var_32_4 = CCRotateBy:create(0.2, -20)
			local var_32_5 = CCRotateBy:create(0.1, 10)

			var_32_2:addObject(var_32_3)
			var_32_2:addObject(var_32_4)
			var_32_2:addObject(var_32_5)

			local var_32_6 = CCRepeat:create(CCSequence:create(var_32_2), 3)
			local var_32_7 = CCSprite:create()

			var_32_1:addChild(var_32_7)
			var_32_7:setPosition(ccp(35, 97))

			local var_32_8 = CCArray:create()

			for iter_32_1 = 1, 5 do
				local var_32_9 = CCSprite:createWithSpriteFrameName(string.format("btkt_huohua%04d.png", iter_32_1))

				var_32_8:addObject(var_32_9:displayFrame())
			end

			local var_32_10 = CCAnimation:createWithSpriteFrames(var_32_8, 0.1)
			local var_32_11 = CCAnimate:create(var_32_10)

			var_32_7:runAction(CCRepeatForever:create(var_32_11))

			local var_32_12 = CCArray:create()

			for iter_32_2 = 1, 14 do
				local var_32_13 = CCSprite:createWithSpriteFrameName(string.format("btkd_fire%02d.png", iter_32_2))

				var_32_12:addObject(var_32_13:displayFrame())
			end

			local var_32_14 = CCAnimation:createWithSpriteFrames(var_32_12, 0.1)
			local var_32_15 = CCAnimate:create(var_32_14)
			local var_32_16 = CCArray:create()

			var_32_16:addObject(var_32_6)
			var_32_16:addObject(CCCallFuncN:create(function()
				var_32_7:removeFromParentAndCleanup(true)

				local var_33_0, var_33_1 = var_32_1:getPosition()

				var_32_1:setPosition(var_33_0, var_33_1 - 100)
			end))
			var_32_16:addObject(var_32_15)
			var_32_16:addObject(CCCallFuncN:create(function()
				var_32_1:removeFromParentAndCleanup(true)
			end))

			if iter_32_0 == 3 then
				var_32_16:addObject(CCCallFuncN:create(function()
					arg_32_0:showStoneEffect()
				end))
			end

			local var_32_17 = CCSequence:create(var_32_16)

			var_32_1:runAction(CCSpeed:create(var_32_17, 2))
		end
	end
end

function var_0_10.showStoneEffect(arg_36_0)
	if arg_36_0.stoneNode then
		arg_36_0.stoneNode:removeAllChildrenWithCleanup(true)
	else
		arg_36_0.stoneNode = CCSpriteBatchNode:create("res/ui/activity/ironMine/ironMinePic.png")

		arg_36_0.view.widgets.panel:addChild(arg_36_0.stoneNode)
	end

	local function var_36_0()
		local var_37_0 = CCArray:create()

		var_37_0:addObject(CCMoveBy:create(0.12, ccp(10, 0)))
		var_37_0:addObject(CCMoveBy:create(0.12, ccp(-10, 0)))

		return CCSequence:create(var_37_0)
	end

	arg_36_0.view.widgets.stone:stopAllActions()
	arg_36_0.view.widgets.stone:setPosition(ccp(0, 0))
	arg_36_0.view.widgets.stone:runAction(CCRepeat:create(var_36_0(), 6))

	local var_36_1 = CCSprite:createWithSpriteFrameName("btkd_word_ddsy.png")

	var_36_1:setPosition(ccp(458, 255))
	arg_36_0.stoneNode:addChild(var_36_1)
	var_36_1:runAction(CCRepeat:create(var_36_0(), 5))

	local var_36_2 = 30

	for iter_36_0 = 1, var_36_2 do
		math.mod(iter_36_0, 4)

		local var_36_3 = CCSprite:createWithSpriteFrameName(string.format("btkt_ss%03d.png", 1 + math.mod(iter_36_0, 4)))

		arg_36_0.stoneNode:addChild(var_36_3)

		local var_36_4 = math.random(90, 820)
		local var_36_5 = math.random(240, 320)
		local var_36_6 = CCArray:create()

		var_36_6:addObject(CCCallFuncN:create(function()
			var_36_3:setPosition(ccp(var_36_4, 430))
			var_36_3:setOpacity(0)
		end))
		var_36_6:addObject(CCDelayTime:create(math.random(0, 0.5)))
		var_36_6:addObject(CCFadeIn:create(0.3))
		var_36_6:addObject(CCMoveTo:create(0.5, ccp(var_36_4, var_36_5)))
		var_36_6:addObject(CCFadeOut:create(0.3))

		if iter_36_0 == var_36_2 then
			var_36_6:addObject(CCCallFuncN:create(function()
				arg_36_0.stoneNode:removeAllChildrenWithCleanup(true)
				arg_36_0:onBombGangMine()
			end))
		end

		local var_36_7 = CCSequence:create(var_36_6)

		var_36_3:runAction(CCSpeed:create(var_36_7, 1.6))
	end
end

function var_0_10.showEffectTextFly(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = {
		name = "bg",
		type = "sprite9Tips",
		frameGapHorizontal = 90,
		frameGapVertical = 20,
		middleRect = CCRectMake(100, 15, 22, 4),
		pic = {
			path = "res/ui/buildEvent/jzcl_wjm_di.png"
		},
		content = {
			{
				type = "sprite",
				pic = {
					path = arg_40_1
				}
			}
		}
	}
	local var_40_1 = {}

	uiutil.initWidgets(var_40_1, var_40_0)
	smgr.getLayer("tipLayer"):addChild(var_40_1.widgets.bg)

	local var_40_2, var_40_3 = tool.getPositionInScreen(arg_40_0.view.widgets.icon)

	var_40_1.widgets.bg:setPosition(var_40_2, var_40_3)

	local var_40_4 = CCArray:create()

	var_40_4:addObject(CCMoveBy:create(0.6, ccp(0, 60)))
	var_40_4:addObject(CCDelayTime:create(0.6))
	var_40_4:addObject(CCCallFuncN:create(function(arg_41_0)
		arg_41_0:removeFromParentAndCleanup(true)

		if arg_40_2 then
			arg_40_2()
		end
	end))

	local var_40_5 = CCSequence:create(var_40_4)

	var_40_1.widgets.bg:runAction(var_40_5)
end

function var_0_10.getCurrNeedNum(arg_42_0, arg_42_1)
	local var_42_0 = tonumber(arg_42_1)

	if var_42_0 <= 0 then
		local var_42_1 = arg_42_0.info.weapons[arg_42_0.weaponIdx].id

		_, _, var_42_0 = string.find(arg_42_1, var_42_1 .. "=(%d+)")
		var_42_0 = tonumber(var_42_0)
	end

	return var_42_0
end

function var_0_10.showTip(arg_43_0)
	log.info("should show tips ")

	local var_43_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_43_0:registerScriptTouchHandler(function(arg_44_0, arg_44_1, arg_44_2)
		if arg_44_0 == CCTOUCHBEGAN then
			return true
		elseif arg_44_0 == CCTOUCHMOVED then
			return true
		elseif arg_44_0 == CCTOUCHENDED then
			pcall(var_43_0.removeFromParentAndCleanup, var_43_0, true)

			return true
		end
	end, false, true)
	var_43_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_43_0, 60000)

	local var_43_1

	if arg_43_0.info.roundNo == 0 then
		var_43_1 = language.get(136166, arg_43_0.info.numPPs[1])
	elseif arg_43_0.info.roundNo == 1 then
		var_43_1 = language.get(136167, arg_43_0.info.numPPs[2])
	elseif arg_43_0.info.roundNo == 2 then
		var_43_1 = language.get(136168, arg_43_0.info.numPPs[3])
	end

	local var_43_2 = {
		name = "tipFrame",
		type = "sprite9Tips",
		pic = {
			frame = true,
			path = "common_tip_frame_small.png"
		},
		anchorPoint = ccp(0, 1),
		middleRect = CCRectMake(24, 24, 1, 1),
		preferedSize = CCSizeMake(160, 140),
		content = {
			{
				fontSize = 20,
				height = 0,
				name = "tipMsg",
				type = "label",
				style = "label_warlock",
				width = 0,
				anchorPoint = ccp(0, 0),
				halign = kCCTextAlignmentLeft,
				color = var_0_5,
				text = var_43_1
			}
		}
	}
	local var_43_3 = 0
	local var_43_4 = 0
	local var_43_5 = {}

	uiutil.initWidgets(var_43_5, var_43_2)
	var_43_0:addChild(var_43_5.widgets.tipFrame)

	local var_43_6, var_43_7 = tool.getPositionInScreen(arg_43_0.view.widgets.btn_tip)
	local var_43_8 = var_43_6
	local var_43_9 = var_43_7

	var_43_5.widgets.tipFrame:setPosition(ccp(var_43_8, var_43_9))
end

function var_0_10.showPanel(arg_45_0, arg_45_1)
	arg_45_0.info = arg_45_1

	local var_45_0 = arg_45_0.view.widgets.node_mine:isVisible()
	local var_45_1 = arg_45_1.leftUseNum > 0

	if var_45_1 then
		var_45_0 = false
	end

	if math.min(arg_45_0.info.weapons[1].lv, arg_45_0.info.weapons[2].lv, arg_45_0.info.weapons[3].lv) >= MAX_GOD_WEAPON_LV then
		var_45_0 = true
	end

	arg_45_0.view.widgets.node_mine:setVisible(var_45_0)
	arg_45_0.view.widgets.node_weapon:setVisible(not var_45_0)

	if var_45_0 then
		arg_45_0:initNodeMine()

		local var_45_2 = arg_45_1.bombNum > 0

		arg_45_0.view.widgets.bombNum:setVisible(var_45_2)
		arg_45_0.view.widgets.node_gold:setVisible(not var_45_2)

		if var_45_2 then
			arg_45_0.view.widgets.bombNum:setString(language.get(490026, arg_45_1.bombNum))
		else
			arg_45_0.view.widgets.buyBombGold:setString(arg_45_1.buyBombGold)
		end

		arg_45_0.view.widgets.infoLb2:setString(language.get(135050, arg_45_1.singleBombNum))

		local var_45_3 = arg_45_1.remainBombTimes == 0

		arg_45_0.view.widgets.bombEnd:setVisible(var_45_3)
		arg_45_0.view.widgets.btn_putBomb:setEnabled(not var_45_3)
		arg_45_0.view.widgets.infoLb1:setVisible(not var_45_3)
		arg_45_0.view.widgets.infoLb2:setVisible(not var_45_3)

		local var_45_4 = math.min(arg_45_1.weapons[1].lv, arg_45_1.weapons[2].lv, arg_45_1.weapons[3].lv)

		arg_45_0.view.widgets.btn_showWeapon:setEnabled(var_45_4 < MAX_GOD_WEAPON_LV)
	else
		arg_45_0:initNodeWeapon()

		if arg_45_1.roundNo > 2 then
			arg_45_1.roundNo = 2
		end

		arg_45_0.view.widgets.round:setDisplayFrame(CCSprite:create("res/ui/activity/gangMine/" .. var_0_3[arg_45_1.roundNo].pic):displayFrame())
		arg_45_0.view.widgets.btn_showMine:setVisible(not var_45_1)
		arg_45_0.view.widgets.btn_startUpgrade:setVisible(not var_45_1)
		arg_45_0.view.widgets.btn_prev:setVisible(not var_45_1)
		arg_45_0.view.widgets.btn_next:setVisible(not var_45_1)
		arg_45_0.view.widgets.btn_upgrade:setVisible(var_45_1)
	end

	arg_45_0.view.widgets.gangNum:setString(arg_45_1.stockInfo.gangNum)
	arg_45_0.view.widgets.goodGangNum:setString(arg_45_1.stockInfo.goodGangNum)
	arg_45_0.view.widgets.mask_bottom:setVisible(false)
	arg_45_0.view.widgets.mask_middle:setVisible(false)
	arg_45_0.view.widgets.btn_maskBottom:setVisible(false)
	arg_45_0.view.widgets.btn_maskMiddle:setVisible(false)

	local var_45_5 = var_45_0 and (arg_45_1.copiesBombIron > 0 or arg_45_1.copiesBombGoodGang > 0)

	arg_45_0.view.widgets.num_reward:setVisible(var_45_5)
	arg_45_0:addGang(var_45_5)

	if var_45_5 then
		arg_45_0.view.widgets.mask_bottom:setVisible(true)
		arg_45_0.view.widgets.mask_middle:setVisible(true)
		arg_45_0.view.widgets.btn_maskBottom:setVisible(true)
		arg_45_0.view.widgets.btn_maskMiddle:setVisible(true)

		local var_45_6

		if arg_45_1.copiesBombIron > 0 then
			var_45_6 = language.get(136156, arg_45_1.copiesBombIron * arg_45_1.singleBombIron)
		end

		if arg_45_1.copiesBombGoodGang > 0 then
			var_45_6 = var_45_6 ~= nil and var_45_6 .. "   " or ""
			var_45_6 = var_45_6 .. language.get(136157, arg_45_1.copiesBombGoodGang * arg_45_1.singleBombGoodGang)
		end

		arg_45_0.view.widgets.num_reward:setString(var_45_6)
	end

	arg_45_0:addBomb(true)

	local var_45_7 = var_45_0 == false and arg_45_1.remainForgingTimes == 0

	arg_45_0.view.widgets.upgradeEnd:setVisible(var_45_7)

	if var_45_7 then
		arg_45_0.view.widgets.mask_middle:setVisible(true)
		arg_45_0.view.widgets.btn_maskMiddle:setVisible(true)
	end
end

function var_0_10.ctor(arg_46_0, arg_46_1, arg_46_2)
	log.info("@@ 神兵锻造活动")
	rmgr.loadResource("res/ui/activity/ironMine/ironMinePic.plist")
	rmgr.loadResource("res/ui/activity/ironMine/btkd_fire.plist")
	rmgr.loadResource("res/ui/activity/gangMine/light.plist")
	rmgr.loadResource("res/ui/activity/gangMine/light2.plist")
	rmgr.loadResource("res/ui/activity/gangMine/gang.plist")

	arg_46_0.view = {}

	uiutil.initWidgets(arg_46_0.view, arg_46_0.layout)

	arg_46_0.leftTime = arg_46_0.view.widgets.leftTime

	if arg_46_1 then
		arg_46_0:addChild(arg_46_0.view.widgets.panel)
		arg_46_1:addChild(arg_46_0)
	end

	arg_46_0.view.widgets.btn_maskBottom:addHandleOfControlEvent(function()
		log.info("btn_maskBottom")
	end, CCControlEventTouchUpInside)
	arg_46_0.view.widgets.btn_maskMiddle:addHandleOfControlEvent(function()
		log.info("btn_maskMiddle")
	end, CCControlEventTouchUpInside)
	arg_46_0.view.widgets.btn_putBomb:addHandleOfControlEvent(function()
		log.info("btn_putBomb")
		arg_46_0:onPutGangMineBomb()
	end, CCControlEventTouchUpInside)
	arg_46_0.view.widgets.btn_showWeapon:addHandleOfControlEvent(function()
		log.info("btn_showWeapon")
		arg_46_0.view.widgets.node_mine:setVisible(false)
		arg_46_0.view.widgets.node_weapon:setVisible(true)
		arg_46_0:showPanel(arg_46_0.info)
	end, CCControlEventTouchUpInside)

	local var_46_0 = CCLayerColor:create(ccc4(0, 0, 0, 0), 915, 436)
	local var_46_1 = CCScrollView:create(CCSizeMake(915, 436), var_46_0)

	var_46_1:setPosition(ccp(0, 0))
	var_46_1:setTouchEnabled(false)
	arg_46_0.view.widgets.node_mine:addChild(var_46_1)

	local var_46_2 = CCSpriteBatchNode:create("res/ui/activity/gangMine/gang.png")

	var_46_0:addChild(var_46_2)

	arg_46_0.view.widgets.stone = var_46_2

	math.randomseed(1)

	local var_46_3 = 30

	for iter_46_0 = 1, var_46_3 do
		local var_46_4 = CCSprite:createWithSpriteFrameName("blgkd_icon_blg_s.png")
		local var_46_5 = 36 + (iter_46_0 - 1) * 880 / math.floor(var_46_3 / 2)
		local var_46_6 = 426

		if iter_46_0 > math.ceil(var_46_3 / 2) then
			var_46_4:setOpacity(160)

			var_46_5 = var_46_5 - var_46_3 / 2 * 836 / math.floor(var_46_3 / 2)
			var_46_5 = var_46_5 + math.random(-20, 20)
			var_46_6 = var_46_6 + math.random(-10, 0)

			var_46_2:addChild(var_46_4, 0)
		else
			var_46_2:addChild(var_46_4, 1)
		end

		var_46_4:setPosition(ccp(var_46_5, var_46_6))
	end

	local var_46_7 = 4

	for iter_46_1 = 1, var_46_7 do
		local var_46_8 = CCSprite:createWithSpriteFrameName("blgkd_icon_bljg_s.png")
		local var_46_9 = 36 + (iter_46_1 - 1 + 0.25) * 880 / math.floor(var_46_7) + math.random(-50, 50)
		local var_46_10 = 416

		var_46_2:addChild(var_46_8, 1)
		var_46_8:setPosition(ccp(var_46_9, var_46_10))
	end

	arg_46_0.view.widgets.btn_showMine:addHandleOfControlEvent(function()
		log.info("btn_showMine")
		arg_46_0.view.widgets.node_mine:setVisible(true)
		arg_46_0.view.widgets.node_weapon:setVisible(false)
		arg_46_0:showPanel(arg_46_0.info)
	end, CCControlEventTouchUpInside)
	arg_46_0.view.widgets.btn_startUpgrade:addHandleOfControlEvent(function()
		log.info("btn_startUpgrade")
		arg_46_0:onStartUpgrade()
	end, CCControlEventTouchUpInside)
	arg_46_0.view.widgets.btn_upgrade:addHandleOfControlEvent(function()
		log.info("btn_upgrade")
		arg_46_0:onBtnUpgradeTap()
	end, CCControlEventTouchUpInside)
	arg_46_0.view.widgets.btn_prev:addHandleOfControlEvent(function()
		log.info("btn_prev")

		arg_46_0.weaponIdx = arg_46_0.weaponIdx - 1

		arg_46_0:updateWeaponInfo()
	end, CCControlEventTouchUpInside)
	arg_46_0.view.widgets.btn_next:addHandleOfControlEvent(function()
		log.info("btn_next")

		arg_46_0.weaponIdx = arg_46_0.weaponIdx + 1

		arg_46_0:updateWeaponInfo()
	end, CCControlEventTouchUpInside)
	arg_46_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_46_0:showTip()
	end, CCControlEventTouchUpInside)

	local var_46_11 = CCSpriteBatchNode:create("res/ui/activity/gangMine/light.png")

	arg_46_0.view.widgets.node_weapon:addChild(var_46_11, 10)

	for iter_46_2 = 1, 8 do
		if iter_46_2 % 2 == 1 then
			local var_46_12 = CCSprite:create("res/ui/activity/gangMine/sbdz_tielian.png")

			var_46_12:setPosition(0.5 * (var_0_2[iter_46_2].x + var_0_2[iter_46_2 + 1].x), 0.5 * (var_0_2[iter_46_2].y + var_0_2[iter_46_2 + 1].y))
			arg_46_0.view.widgets.node_weapon:addChild(var_46_12)
		end

		uiutil.initWidgets(arg_46_0.view, arg_46_0:getSingleBtnRes(iter_46_2))
		arg_46_0.view.widgets.node_weapon:addChild(arg_46_0.view.widgets["btn_area" .. iter_46_2])
		arg_46_0.view.widgets["btn_area" .. iter_46_2]:setPosition(var_0_2[iter_46_2])
		arg_46_0.view.widgets["btn_area" .. iter_46_2]:setEnabled(false)
		arg_46_0.view.widgets["btn_area" .. iter_46_2]:addHandleOfControlEvent(function()
			log.info("btn_area" .. iter_46_2)
			arg_46_0:onBtnAreaTap(iter_46_2)
		end, CCControlEventTouchUpInside)

		local var_46_13 = CCSprite:createWithSpriteFrameName("gang_mine_light_1.png")

		var_46_13:setPosition(var_0_2[iter_46_2])
		var_46_13:setVisible(false)
		var_46_11:addChild(var_46_13)

		arg_46_0.view.widgets["light" .. iter_46_2] = var_46_13

		local var_46_14 = CCArray:create()

		for iter_46_3 = 1, 25 do
			local var_46_15 = CCSprite:createWithSpriteFrameName(string.format("gang_mine_light_%d.png", iter_46_3))

			var_46_14:addObject(var_46_15:displayFrame())
		end

		local var_46_16 = CCAnimation:createWithSpriteFrames(var_46_14, 0.04)
		local var_46_17 = CCAnimate:create(var_46_16)

		var_46_13:runAction(CCRepeatForever:create(var_46_17))
	end

	arg_46_0:showPanel(arg_46_2)
end

function var_0_10.onEnter(arg_58_0)
	arg_58_0.touchBeganRef = handler(arg_58_0, arg_58_0.onTouchBegan)
	arg_58_0.touchMovedRef = handler(arg_58_0, arg_58_0.onTouchMoved)
	arg_58_0.touchEndedRef = handler(arg_58_0, arg_58_0.onTouchEnded)
	arg_58_0.touchCancelledRef = handler(arg_58_0, arg_58_0.onTouchCancelled)

	eventManager.registerEvent("globalOnTouchBegan", arg_58_0.touchBeganRef)
	eventManager.registerEvent("globalOnTouchMoved", arg_58_0.touchMovedRef)
	eventManager.registerEvent("globalOnTouchEnded", arg_58_0.touchEndedRef)
	eventManager.registerEvent("globalOnTouchCancelled", arg_58_0.touchCancelledRef)
end

function var_0_10.onExit(arg_59_0)
	eventManager.unregisterEvent("globalOnTouchBegan", arg_59_0.touchBeganRef)
	eventManager.unregisterEvent("globalOnTouchMoved", arg_59_0.touchMovedRef)
	eventManager.unregisterEvent("globalOnTouchEnded", arg_59_0.touchEndedRef)
	eventManager.unregisterEvent("globalOnTouchCancelled", arg_59_0.touchCancelledRef)
end

function var_0_10.onTouchBegan(arg_60_0, arg_60_1, arg_60_2)
	if arg_60_0.bombGang and #arg_60_0.bombGang > 0 then
		for iter_60_0 = #arg_60_0.bombGang, 1, -1 do
			local var_60_0 = tolua.cast(arg_60_0.bombGang[iter_60_0].obj, "CCSprite")

			if tool.checkIfTouch(var_60_0, arg_60_1, arg_60_2) then
				if #arg_60_0.bombGang <= 3 then
					arg_60_0:onRecvReward(iter_60_0, #arg_60_0.bombGang, true)
				else
					arg_60_0:onRecvReward(iter_60_0, 3, false)
				end

				return
			end
		end
	end
end

function var_0_10.onTouchMoved(arg_61_0, arg_61_1, arg_61_2)
	return
end

function var_0_10.onTouchEnded(arg_62_0, arg_62_1, arg_62_2)
	return
end

function var_0_10.onTouchCancelled(arg_63_0, arg_63_1, arg_63_2)
	return
end

return var_0_10
