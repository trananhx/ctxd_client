local var_0_0 = {
	[4] = {
		type = 4
	},
	[21] = {
		type = 7
	},
	[110] = {
		pic = "icon_tj_h.png",
		type = 110
	},
	[5] = {
		pic = "icon_jy_h.png",
		type = 6
	},
	[19] = {
		pic = "icon_jb_h.png",
		type = 19
	},
	[40] = {
		pic = "icon_hjc_h.png",
		type = 40
	},
	[42] = {
		pic = "icon_mbl_h.png",
		type = 5
	},
	[81] = {
		pic = "icon_tj_h.png",
		type = 24
	},
	[102] = {
		pic = "icon_jiebing_h.png",
		type = 41
	},
	[100] = {
		pic = "icon_dq_h.png",
		type = 100
	},
	[116] = {
		type = 55
	},
	[126] = {
		type = 10030
	},
	[119] = {
		type = 10033
	}
}
local var_0_1 = {
	[116] = "dnsnjl_word_scns.png",
	[119] = "dnsnjl_word_gtns.png",
	[21] = "dnsnjl_word_bsns.png"
}
local var_0_2 = {
	idle1 = {
		[21] = {
			frame = "ns_gem_idle1_%d.png",
			num = 4,
			delay = 0.2
		},
		[116] = {
			frame = "ns_silk_idle1_%d.png",
			num = 4,
			delay = 0.2
		},
		[119] = {
			frame = "ns_idle1_%d.png",
			num = 4,
			delay = 0.2
		}
	},
	idle2 = {
		[21] = {
			frame = "ns_gem_idle2_%d.png",
			num = 14,
			delay = 0.15
		},
		[116] = {
			frame = "ns_silk_idle2_%d.png",
			num = 14,
			delay = 0.15
		},
		[119] = {
			frame = "ns_idle2_%d.png",
			num = 14,
			delay = 0.15
		}
	},
	run = {
		[21] = {
			frame = "ns_gem_run%d.png",
			num = 8,
			delay = 0.1
		},
		[116] = {
			frame = "ns_silk_run%d.png",
			num = 8,
			delay = 0.1
		},
		[119] = {
			frame = "ns_run%d.png",
			num = 8,
			delay = 0.1
		}
	},
	scare = {
		[21] = {
			frame = "ns_gem_scare%d.png",
			num = 14,
			delay = 0.15
		},
		[116] = {
			frame = "ns_silk_scare%d.png",
			num = 14,
			delay = 0.15
		},
		[119] = {
			frame = "ns_scare%d.png",
			num = 14,
			delay = 0.15
		}
	}
}
local var_0_3 = ""
local var_0_4 = 0
local var_0_5 = tool.hexToRgb("#D9EDC5")
local var_0_6 = ccc3(0, 180, 0)
local var_0_7 = colorQuality[5]
local var_0_8 = colorQuality[4]
local var_0_9 = colorQuality[2]
local var_0_10 = class("Beast", function()
	return createBaseLayer()
end)

var_0_10.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = false,
		path = "res/ui/comment/bg1.jpg"
	},
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			x = 458,
			y = 205,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/beast/ns_bg1.jpg"
			}
		},
		{
			y = 205,
			x = 458,
			type = "sprite",
			zorder = 100,
			pic = {
				frame = true,
				path = "ns_bg2.png"
			}
		},
		{
			x = 458,
			y = 470,
			type = "sprite",
			pic = {
				path = "res/ui/activity/beast/dnsnjl_title.png"
			}
		},
		{
			x = 458,
			y = 430,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/general/jailView/comm_list_laofang_3.png"
			}
		},
		{
			fontSize = 24,
			name = "leftTime",
			y = 460,
			type = "label",
			x = 730,
			style = "label_warlock",
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_7
		},
		{
			x = 5,
			y = 370,
			type = "sprite9",
			pic = {
				frame = true,
				path = "ns_titbg_1.png"
			},
			anchorPoint = ccp(0, 0.5),
			middleRect = CCRectMake(0, 30, 370, 37),
			preferedSize = CCSizeMake(370, 80)
		},
		{
			fontSize = 20,
			style = "label_warlock",
			y = 385,
			type = "label",
			x = 10,
			textId = 135221,
			anchorPoint = ccp(0, 0.5),
			color = var_0_5
		},
		{
			fontSize = 20,
			name = "infoLb",
			type = "label",
			text = "",
			style = "label_warlock",
			y = 355,
			x = 10,
			anchorPoint = ccp(0, 0.5),
			color = var_0_5
		},
		{
			y = 385,
			name = "btn_city",
			style = "button_yel1",
			type = "button",
			visible = false,
			scale = 0.7,
			x = 270,
			children = {
				{
					fontSize = 26,
					style = "label_warlock",
					y = 29,
					type = "label",
					x = 49,
					textId = 420008,
					color = var_0_5
				}
			}
		},
		{
			fontSize = 20,
			name = "Lb_cityName",
			visible = false,
			type = "label",
			text = "北极星",
			style = "label_warlock",
			y = 385,
			x = 200,
			color = var_0_6
		},
		{
			x = 820,
			name = "btn_bg",
			y = 55,
			type = "sprite",
			pic = {
				frame = true,
				path = "ns_titbg_2.png"
			},
			children = {
				{
					y = 55,
					x = 38,
					type = "node",
					children = {
						{
							zoomOnTouchDown = true,
							name = "btn_cracker",
							h = 72,
							type = "button",
							w = 88,
							y = 0,
							x = 0,
							normal = {
								path = "res/ui/activity/beast/dnsnjl_btn_boom_s.png"
							},
							touched = {
								path = "res/ui/activity/beast/dnsnjl_btn_boom_s_c.png"
							}
						},
						{
							text = "100",
							name = "cracker",
							y = -35,
							type = "label",
							style = "label_warlock",
							x = 0,
							fontSize = 22,
							color = var_0_5
						}
					}
				},
				{
					y = 55,
					x = 118,
					type = "node",
					children = {
						{
							zoomOnTouchDown = true,
							name = "btn_thunder",
							h = 69,
							type = "button",
							w = 82,
							y = 0,
							x = 0,
							normal = {
								path = "res/ui/activity/beast/dnsnjl_btn_boom.png"
							},
							touched = {
								path = "res/ui/activity/beast/dnsnjl_btn_boom_c.png"
							}
						},
						{
							fontSize = 22,
							name = "thunderNum",
							visible = false,
							type = "label",
							text = "100",
							style = "label_warlock",
							y = -35,
							x = 0,
							color = var_0_5
						},
						{
							fontSize = 22,
							name = "thunderGold",
							visible = false,
							type = "label",
							text = "100",
							style = "label_warlock",
							y = -35,
							x = 15,
							color = var_0_8,
							children = {
								{
									x = -30,
									y = 0,
									type = "sprite",
									pic = {
										frame = true,
										path = "res_icon_19_small.png"
									}
								}
							}
						}
					}
				}
			}
		},
		{
			style = "button_tip",
			name = "btn_tip",
			y = 470,
			type = "button",
			x = 860
		},
		{
			y = 0,
			name = "node_select",
			type = "node",
			x = 0,
			children = {
				{
					y = 310,
					type = "sprite",
					scaleX = 1.4,
					x = 458,
					pic = {
						path = "res/ui/saotao/stfx_word_bg.png"
					}
				},
				{
					y = 314,
					name = "info",
					type = "sprite",
					x = 458,
					pic = {
						path = "res/ui/activity/beast/dnsnjl_word_nscmqxzyzgd.png"
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_beast1",
					h = 120,
					type = "button",
					w = 320,
					y = 214,
					x = 174,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					children = {
						{
							y = 60,
							name = "beast1",
							type = "sprite",
							x = 160,
							pic = {
								frame = true,
								path = "ns_idle1_1.png"
							}
						},
						{
							type = "sprite",
							name = "bg_name11",
							y = 14,
							visible = false,
							x = 240,
							pic = {
								path = "res/ui/activity/beast/dnsnjl_word_bg_a.png"
							},
							children = {
								{
									y = 30,
									x = 20,
									type = "sprite",
									scale = 0.5,
									pic = {
										path = "res/ui/activity/ironRotary/yuanbao.png"
									}
								},
								{
									fontSize = 22,
									name = "gold1",
									style = "label_warlock",
									type = "label",
									y = 14,
									x = 20,
									color = var_0_8
								}
							}
						},
						{
							type = "sprite",
							name = "bg_name12",
							y = 12,
							visible = false,
							x = 252,
							pic = {
								path = "res/ui/activity/beast/dnsnjl_word_bg_b.png"
							}
						},
						{
							y = 16,
							name = "name1",
							type = "sprite",
							x = 240,
							pic = {
								path = "res/ui/activity/beast/dnsnjl_word_gtns.png"
							}
						},
						{
							fontSize = 22,
							name = "notOpen1",
							visible = false,
							type = "label",
							textId = 135245,
							style = "label_warlock",
							y = -10,
							x = 240,
							color = var_0_5
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_beast2",
					h = 120,
					type = "button",
					w = 320,
					y = 202,
					x = 562,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					children = {
						{
							y = 60,
							name = "beast2",
							type = "sprite",
							x = 160,
							pic = {
								frame = true,
								path = "ns_silk_idle1_1.png"
							}
						},
						{
							type = "sprite",
							name = "bg_name21",
							y = 14,
							visible = false,
							x = 240,
							pic = {
								path = "res/ui/activity/beast/dnsnjl_word_bg_a.png"
							},
							children = {
								{
									y = 30,
									x = 20,
									type = "sprite",
									scale = 0.5,
									pic = {
										path = "res/ui/activity/ironRotary/yuanbao.png"
									}
								},
								{
									fontSize = 22,
									name = "gold2",
									style = "label_warlock",
									type = "label",
									y = 14,
									x = 20,
									color = var_0_8
								}
							}
						},
						{
							type = "sprite",
							name = "bg_name22",
							y = 12,
							visible = false,
							x = 252,
							pic = {
								path = "res/ui/activity/beast/dnsnjl_word_bg_b.png"
							}
						},
						{
							y = 16,
							name = "name2",
							type = "sprite",
							x = 240,
							pic = {
								path = "res/ui/activity/beast/dnsnjl_word_scns.png"
							}
						},
						{
							fontSize = 22,
							name = "notOpen2",
							visible = false,
							type = "label",
							textId = 135245,
							style = "label_warlock",
							y = -10,
							x = 240,
							color = var_0_5
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_beast3",
					h = 120,
					type = "button",
					w = 320,
					y = 106,
					x = 374,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					children = {
						{
							y = 60,
							name = "beast3",
							type = "sprite",
							x = 160,
							pic = {
								frame = true,
								path = "ns_gem_idle1_1.png"
							}
						},
						{
							type = "sprite",
							name = "bg_name31",
							y = 14,
							visible = false,
							x = 240,
							pic = {
								path = "res/ui/activity/beast/dnsnjl_word_bg_a.png"
							},
							children = {
								{
									y = 30,
									x = 20,
									type = "sprite",
									scale = 0.5,
									pic = {
										path = "res/ui/activity/ironRotary/yuanbao.png"
									}
								},
								{
									fontSize = 22,
									name = "gold3",
									style = "label_warlock",
									type = "label",
									y = 14,
									x = 20,
									color = var_0_8
								}
							}
						},
						{
							type = "sprite",
							name = "bg_name32",
							y = 12,
							visible = false,
							x = 252,
							pic = {
								path = "res/ui/activity/beast/dnsnjl_word_bg_b.png"
							}
						},
						{
							y = 16,
							name = "name3",
							type = "sprite",
							x = 240,
							pic = {
								path = "res/ui/activity/beast/dnsnjl_word_bsns.png"
							}
						},
						{
							fontSize = 22,
							name = "notOpen3",
							visible = false,
							type = "label",
							textId = 135245,
							style = "label_warlock",
							y = -10,
							x = 240,
							color = var_0_5
						}
					}
				}
			}
		}
	}
}
var_0_10.tipFrame = {
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
			height = 0,
			name = "tipMsg",
			type = "label",
			textId = 135238,
			style = "label_warlock",
			width = 400,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_5
		}
	}
}

function var_0_10.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getBeastActivity)
end

function var_0_10.onGoToCity(arg_4_0, arg_4_1)
	smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
	loadingLayer.show(SCENE_WORLD, arg_4_1)
end

function var_0_10.addReward(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_0.rewardNode then
		arg_5_0.rewardNode:stopAllActions()
	else
		arg_5_0.rewardNode = CCNode:create()

		arg_5_0.view.widgets.panel:addChild(arg_5_0.rewardNode, 100)
	end

	arg_5_0.reward = arg_5_0.reward or {}

	local function var_5_0(arg_6_0, arg_6_1, arg_6_2)
		local var_6_0 = {}
		local var_6_1 = {
			id = var_0_0[arg_6_0].type,
			value = arg_6_1,
			gemLevel = arg_6_2
		}

		table.insert(var_6_0, var_6_1)
		globalAction_gotResource(var_6_0)
	end

	local function var_5_1(arg_7_0)
		arg_5_0.rewardNode:addChild(arg_7_0)

		local var_7_0 = math.random(280, 640)
		local var_7_1 = math.random(70, 130)

		arg_7_0:setPosition(ccp(460, 310))
		arg_7_0:runAction(CCEaseBounceOut:create(CCMoveTo:create(1, ccp(var_7_0, var_7_1))))
	end

	local var_5_2 = 3
	local var_5_3 = 0.5

	if arg_5_2 then
		var_5_2 = 0
		var_5_3 = 0.2
	end

	for iter_5_0, iter_5_1 in ipairs(arg_5_1) do
		if iter_5_1.type == 4 then
			local var_5_4 = arg_5_2 and 20 or 1

			for iter_5_2 = 1, var_5_4 do
				local var_5_5 = CCSprite:create("res/ui/task/get_icon_iron.png")

				table.insert(arg_5_0.reward, {
					obj = var_5_5,
					type = iter_5_1.type,
					value = iter_5_1.value / var_5_4,
					cd = var_5_2
				})
				var_5_1(var_5_5)

				var_5_2 = var_5_2 + var_5_3
			end
		elseif iter_5_1.type == 119 then
			local var_5_6 = arg_5_2 and 20 or 1

			for iter_5_3 = 1, var_5_6 do
				local var_5_7 = CCSprite:create("res/ui/activity/gangMine/blgkd_icon_blg.png")

				var_5_7:setScale(0.8)
				table.insert(arg_5_0.reward, {
					obj = var_5_7,
					type = iter_5_1.type,
					value = iter_5_1.value / var_5_6,
					cd = var_5_2
				})
				var_5_1(var_5_7)

				var_5_2 = var_5_2 + var_5_3
			end
		elseif iter_5_1.type == 116 then
			local var_5_8 = arg_5_2 and 20 or 1

			for iter_5_4 = 1, var_5_8 do
				local var_5_9 = CCSprite:create("res/ui/task/get_icon_silk.png")

				var_5_9:setScale(0.9)
				table.insert(arg_5_0.reward, {
					obj = var_5_9,
					type = iter_5_1.type,
					value = iter_5_1.value / var_5_8,
					cd = var_5_2
				})
				var_5_1(var_5_9)

				var_5_2 = var_5_2 + var_5_3
			end
		elseif iter_5_1.type == 126 then
			local var_5_10 = arg_5_2 and 25 or 1

			for iter_5_5 = 1, var_5_10 do
				local var_5_11 = CCSprite:create("res/ui/resource/silkroad/sczldj_jn.png")

				var_5_11:setScale(0.9)
				table.insert(arg_5_0.reward, {
					obj = var_5_11,
					type = iter_5_1.type,
					value = iter_5_1.value / var_5_10,
					cd = var_5_2
				})
				var_5_1(var_5_11)

				var_5_2 = var_5_2 + var_5_3
			end
		elseif iter_5_1.type == 21 then
			local var_5_12 = 1

			if iter_5_1.lv >= 1 and iter_5_1.lv <= 16 then
				var_5_12 = math.ceil(iter_5_1.lv / 4)
			end

			local var_5_13 = arg_5_2 and iter_5_1.value >= 25 and 25 or 1

			for iter_5_6 = 1, var_5_13 do
				local var_5_14 = CCSprite:create(string.format("res/ui/activity/gemsActivity/new/gem_a%d.png", var_5_12))

				table.insert(arg_5_0.reward, {
					obj = var_5_14,
					type = iter_5_1.type,
					value = iter_5_1.value / var_5_13,
					lv = iter_5_1.lv,
					cd = var_5_2
				})
				var_5_1(var_5_14)

				var_5_2 = var_5_2 + var_5_3
			end
		elseif var_0_0[iter_5_1.type] then
			local var_5_15 = CCSprite:createWithSpriteFrameName(var_0_0[iter_5_1.type].pic)

			table.insert(arg_5_0.reward, {
				obj = var_5_15,
				type = iter_5_1.type,
				value = iter_5_1.value,
				cd = var_5_2
			})
			var_5_1(var_5_15)

			var_5_2 = var_5_2 + var_5_3
		else
			log.info(string.format("unknown reward type:%s", iter_5_1.type))
		end
	end

	local var_5_16 = CCArray:create()

	var_5_16:addObject(CCDelayTime:create(var_5_3))
	var_5_16:addObject(CCCallFuncN:create(function()
		log.info("zhu@@@size", #arg_5_0.reward)

		if #arg_5_0.reward > 0 then
			for iter_8_0 = 1, #arg_5_0.reward do
				local var_8_0 = arg_5_0.reward[iter_8_0]

				var_8_0.cd = var_8_0.cd - var_5_3

				if var_8_0.cd <= 0 then
					tolua.cast(var_8_0.obj, "CCSprite"):removeFromParentAndCleanup(true)
					var_5_0(var_8_0.type, var_8_0.value, var_8_0.lv)
				end
			end

			local var_8_1 = arg_5_0.reward

			arg_5_0.reward = {}

			for iter_8_1 = 1, #var_8_1 do
				local var_8_2 = var_8_1[iter_8_1]

				if var_8_2.cd > 0 then
					table.insert(arg_5_0.reward, var_8_2)
				end
			end
		else
			arg_5_0.rewardNode:stopAllActions()
		end
	end))

	local var_5_17 = CCSequence:create(var_5_16)

	arg_5_0.rewardNode:runAction(CCRepeatForever:create(var_5_17))

	local var_5_18 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_5_18:registerScriptTouchHandler(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == CCTOUCHBEGAN then
			log.info("CCTOUCH_BEGAN", arg_9_1, arg_9_2)

			if arg_5_0.reward and #arg_5_0.reward > 0 then
				for iter_9_0 = 1, #arg_5_0.reward do
					local var_9_0 = arg_5_0.reward[iter_9_0]
					local var_9_1 = tolua.cast(arg_5_0.reward[iter_9_0].obj, "CCSprite")

					if tool.checkIfTouch(var_9_1, arg_9_1, arg_9_2) then
						var_5_0(var_9_0.type, var_9_0.value, var_9_0.lv)
						var_9_1:removeFromParentAndCleanup(true)
						table.remove(arg_5_0.reward, iter_9_0)

						return true
					end
				end
			end

			return false
		elseif arg_9_0 == CCTOUCHMOVED then
			log.info("CCTOUCH_MOVED", arg_9_1, arg_9_2)

			return true
		elseif arg_9_0 == CCTOUCHENDED then
			log.info("CCTOUCH_ENDED", arg_9_1, arg_9_2)

			return true
		end
	end, false, true)
	var_5_18:setTouchEnabled(true)
	arg_5_0.view.widgets.panel:addChild(var_5_18)

	if arg_5_0.maskLayer then
		arg_5_0.maskLayer:removeFromParentAndCleanup(true)
	end

	arg_5_0.maskLayer = var_5_18
end

function var_0_10.onGetBeastReward(arg_10_0, arg_10_1)
	local function var_10_0(arg_11_0)
		if type(arg_11_0) ~= "number" then
			return
		end

		local var_11_0 = CCLabelAtlas:create(arg_11_0, "res/ui/common/number/blood_ded_numb.png", 17, 22, 48)

		var_11_0:setAnchorPoint(ccp(0.5, 0.5))

		local var_11_1 = CCSprite:createWithSpriteFrameName("blood_ded_subt.png")
		local var_11_2 = createRichNode({
			var_11_1,
			var_11_0
		}, 0.5)

		arg_10_0.view.widgets.panel:addChild(var_11_2, 100)
		var_11_2:setPosition(ccp(458, 200))
		var_11_0:setOpacity(0)
		var_11_1:setOpacity(0)

		for iter_11_0 = 1, 2 do
			local var_11_3 = CCArray:create()

			var_11_3:addObject(CCFadeIn:create(0.3))
			var_11_3:addObject(CCMoveBy:create(0.3, ccp(0, 20)))

			if iter_11_0 == 1 then
				var_11_3:addObject(CCDelayTime:create(0.3))
				var_11_3:addObject(CCCallFuncN:create(function()
					var_11_2:removeFromParentAndCleanup(true)
					arg_10_0:showStarEffect()
				end))
			end

			local var_11_4 = CCSequence:create(var_11_3)

			if iter_11_0 == 1 then
				var_11_0:runAction(var_11_4)
			else
				var_11_1:runAction(var_11_4)
			end
		end
	end

	local function var_10_1(arg_13_0)
		local var_13_0 = arg_13_0.action.data

		if arg_10_1 == 1 then
			arg_10_0:showEffectCracker()
		elseif arg_10_1 == 2 then
			arg_10_0:showEffectThunder()
		end

		arg_10_0.beastBlood = arg_10_0.beastBlood - var_13_0.lostBlood

		local var_13_1 = var_13_0.lastStraw == 1

		if var_13_1 then
			arg_10_0:showBeastAct("run")

			if arg_10_0.starNode then
				arg_10_0.starNode:removeAllChildrenWithCleanup(true)
			end
		else
			var_10_0(var_13_0.lostBlood)
			arg_10_0:showBeastAct("scare")

			arg_10_0.isGetReward = true

			arg_10_0:refresh()
		end

		if arg_13_0.action.data.rewards then
			arg_10_0:addReward(arg_13_0.action.data.rewards, var_13_1)
		end
	end

	local function var_10_2()
		cmgr.sendRequest(var_10_1, actions.getBeastReward, arg_10_1)
	end

	if arg_10_1 == 1 then
		var_10_2()
	elseif arg_10_1 == 2 then
		if arg_10_0.info.thunderNum > 0 then
			var_10_2()
		else
			messageBox.showChargeWin("", language.get(135224, arg_10_0.info.thunderGold), "buyCrack", var_10_2)
		end
	end
end

function var_0_10.onBuyBeast(arg_15_0, arg_15_1)
	local function var_15_0(arg_16_0)
		arg_15_0.info.beastType = arg_15_1

		arg_15_0:showPanel(arg_15_0.info)
	end

	if arg_15_0.info.freeTimes > 0 then
		cmgr.sendRequest(var_15_0, actions.buyBeast, arg_15_1)
	else
		messageBox.showChargeWin("", language.get(135225, arg_15_0.info.beastGold), "beastSummon", function()
			cmgr.sendRequest(var_15_0, actions.buyBeast, arg_15_1)
		end)
	end
end

local function var_0_11(arg_18_0, arg_18_1)
	local var_18_0 = var_0_2[arg_18_0][arg_18_1]
	local var_18_1 = CCArray:create()

	for iter_18_0 = 1, var_18_0.num do
		local var_18_2 = CCSprite:createWithSpriteFrameName(string.format(var_18_0.frame, iter_18_0))

		var_18_1:addObject(var_18_2:displayFrame())
	end

	local var_18_3 = CCAnimation:createWithSpriteFrames(var_18_1, var_18_0.delay)
	local var_18_4 = CCAnimate:create(var_18_3)

	var_18_4:retain()

	return var_18_4
end

function var_0_10.showBeastAct(arg_19_0, arg_19_1)
	if var_0_3 == arg_19_1 and var_0_3 ~= "" then
		return
	else
		var_0_3 = arg_19_1
	end

	log.info("showBeastAct:", arg_19_1, var_0_3)

	if not var_0_2[arg_19_1] and arg_19_1 ~= "sleep" then
		return
	end

	if arg_19_0.beastNode then
		arg_19_0.beastNode:stopAllActions()
		arg_19_0.beast:stopAllActions()
		arg_19_0.beast:setScale(1)
		arg_19_0.beast:setPosition(ccp(0, 0))
		arg_19_0.name:setDisplayFrame(CCSprite:create("res/ui/activity/beast/" .. var_0_1[arg_19_0.info.beastType]):displayFrame())
	else
		arg_19_0.beastNode = CCNode:create()

		arg_19_0.beastLayer:addChild(arg_19_0.beastNode)

		arg_19_0.beast = CCSprite:create()

		arg_19_0.beastNode:addChild(arg_19_0.beast)

		local var_19_0 = CCProgressTimer:create(CCSprite:createWithSpriteFrameName("ns_pb.png"))

		arg_19_0.beastNode:addChild(var_19_0)

		arg_19_0.blood = var_19_0

		var_19_0:setScale(0.8)
		var_19_0:setType(kCCProgressTimerTypeBar)
		var_19_0:setMidpoint(ccp(0, 0.5))
		var_19_0:setBarChangeRate(ccp(1, 0))
		var_19_0:setPercentage(100 * arg_19_0.beastBlood / arg_19_0.info.totalBlood)
		var_19_0:setPosition(ccp(97, 11.5))
		var_19_0:setPosition(ccp(40, 130))

		local var_19_1 = CCSprite:createWithSpriteFrameName("ns_pb_bg.png")

		var_19_1:setAnchorPoint(ccp(0, 0))
		var_19_0:addChild(var_19_1, -1)

		local var_19_2 = CCSprite:create("res/ui/activity/beast/" .. var_0_1[arg_19_0.info.beastType])

		var_19_2:setPosition(ccp(92, 34))
		var_19_0:addChild(var_19_2)

		arg_19_0.name = var_19_2
		arg_19_0.tipNode = CCNode:create()

		arg_19_0.beastNode:addChild(arg_19_0.tipNode)
		arg_19_0.tipNode:setVisible(false)
	end

	arg_19_0.beast:setVisible(true)

	if arg_19_1 == "sleep" then
		arg_19_0.beastNode:setPosition(ccp(805, 310))
		arg_19_0.beast:setDisplayFrame(tool.spriteFrameByName("ns_ns.png"))

		local var_19_3 = CCArray:create()

		var_19_3:addObject(CCScaleTo:create(0.8, 1.05))
		var_19_3:addObject(CCScaleTo:create(0.8, 1))

		local var_19_4 = CCSequence:create(var_19_3)

		arg_19_0.beast:runAction(CCRepeatForever:create(var_19_4))
	else
		arg_19_0.beastNode:setPosition(ccp(380, 140))

		if arg_19_1 == "run" then
			arg_19_0.beast:setPosition(ccp(55, 0))
		end

		arg_19_0.beast:setScale(1.4)

		local var_19_5 = var_0_11(arg_19_1, arg_19_0.info.beastType)

		if arg_19_1 == "idle1" or arg_19_1 == "idle2" then
			local var_19_6 = CCArray:create()

			var_19_6:addObject(var_19_5)
			var_19_6:addObject(CCCallFuncN:create(function()
				local var_20_0 = "idle" .. (math.random(1, 3) > 1 and 1 or 2)

				var_0_3 = ""

				arg_19_0:showBeastAct(var_20_0)
			end))

			local var_19_7 = CCSequence:create(var_19_6)

			arg_19_0.beast:runAction(var_19_7)
		elseif arg_19_1 == "scare" then
			local var_19_8 = CCArray:create()

			var_19_8:addObject(var_19_5)
			var_19_8:addObject(CCCallFuncN:create(function()
				var_0_3 = ""

				arg_19_0:showBeastAct("idle1")
			end))

			local var_19_9 = CCSequence:create(var_19_8)

			arg_19_0.beast:runAction(var_19_9)
		elseif arg_19_1 == "run" then
			arg_19_0.beast:runAction(CCRepeatForever:create(var_19_5))

			local var_19_10 = CCArray:create()

			var_19_10:addObject(CCDelayTime:create(0.3))
			var_19_10:addObject(CCMoveTo:create(1.5, ccp(950, 350)))
			var_19_10:addObject(CCDelayTime:create(0.3))
			var_19_10:addObject(CCCallFuncN:create(function()
				arg_19_0.beast:setVisible(false)
				arg_19_0:refresh()
			end))

			local var_19_11 = CCSequence:create(var_19_10)

			arg_19_0.beastNode:runAction(var_19_11)
		end

		arg_19_0.blood:setPercentage(100 * arg_19_0.beastBlood / arg_19_0.info.totalBlood)

		if arg_19_1 == "idle1" then
			var_0_4 = var_0_4 + 1
		elseif arg_19_1 == "idle2" then
			var_0_4 = var_0_4 + 2
		else
			var_0_4 = 0
		end

		if arg_19_0.tipNode:isVisible() and arg_19_1 ~= "scare" then
			var_0_4 = 0
		else
			arg_19_0.tipNode:removeAllChildrenWithCleanup(true)

			if arg_19_1 ~= "idle1" and arg_19_1 ~= "idle2" or not (var_0_4 <= 10) then
				local var_19_12 = {}

				uiutil.initWidgets(var_19_12, arg_19_0.tipFrame)
				arg_19_0.tipNode:addChild(var_19_12.widgets.tipFrame)
				var_19_12.widgets.tipFrame:setAnchorPoint(ccp(0, 0))
				var_19_12.widgets.tipMsg:setDimensions(CCSizeMake(200, 0))

				local var_19_13

				if arg_19_1 == "idle1" or arg_19_1 == "idle2" then
					var_0_4 = 0

					local var_19_14 = {
						135229,
						135230,
						135231,
						135232,
						135233
					}

					var_19_13 = language.get(var_19_14[math.random(1, #var_19_14)])
				elseif arg_19_1 == "scare" then
					local var_19_15 = {
						135234,
						135235
					}

					var_19_13 = language.get(var_19_15[math.random(1, #var_19_15)])
				elseif arg_19_1 == "run" then
					var_19_13 = language.get(135236)
				end

				var_19_12.widgets.tipMsg:setString(var_19_13)

				local var_19_16 = var_19_12.widgets.tipMsg:getContentSize().width
				local var_19_17 = var_19_12.widgets.tipMsg:getContentSize().height

				var_19_12.widgets.tipFrame:setPreferredSize(CCSizeMake(var_19_16 + 30, var_19_17 + 30))
				var_19_12.widgets.tipFrame:setPosition(ccp(180, 80))
				var_19_12.widgets.tipMsg:setPosition(ccp(15, 15))
				var_19_12.widgets.tipFrame:setVisible(true)

				local var_19_18 = CCArray:create()

				var_19_18:addObject(CCDelayTime:create(5))
				var_19_18:addObject(CCCallFuncN:create(function()
					var_19_12.widgets.tipFrame:removeFromParentAndCleanup(true)
					arg_19_0.tipNode:setVisible(false)
				end))

				local var_19_19 = CCSequence:create(var_19_18)

				arg_19_0.tipNode:setVisible(true)
				var_19_12.widgets.tipFrame:runAction(var_19_19)
			end
		end
	end
end

function var_0_10.showEffectCracker(arg_24_0)
	if arg_24_0.crackerNode then
		arg_24_0.crackerNode:removeAllChildrenWithCleanup(true)
	else
		arg_24_0.crackerNode = CCNode:create()

		arg_24_0.view.widgets.panel:addChild(arg_24_0.crackerNode, 100)
	end

	local function var_24_0(arg_25_0, arg_25_1)
		local var_25_0 = {
			ccp(14, 37),
			ccp(33, 30),
			ccp(56, 27),
			ccp(75, 27),
			ccp(105, 27),
			ccp(130, 27),
			ccp(155, 29),
			ccp(187, 30),
			ccp(216, 40),
			ccp(240, 50),
			ccp(260, 70),
			ccp(285, 87),
			ccp(305, 97)
		}
		local var_25_1 = CCSprite:create()

		arg_25_0:addChild(var_25_1)

		local var_25_2 = var_25_0[arg_25_1].x + math.random(-20, 20)
		local var_25_3 = var_25_0[arg_25_1].y + math.random(-20, 20)

		var_25_1:setPosition(ccp(var_25_2, var_25_3))

		local var_25_4 = CCArray:create()

		for iter_25_0 = 1, 3 do
			local var_25_5 = CCSprite:createWithSpriteFrameName(string.format("ns_cracker_fire%d.png", iter_25_0))

			var_25_4:addObject(var_25_5:displayFrame())
		end

		local var_25_6 = CCAnimation:createWithSpriteFrames(var_25_4, 0.3)
		local var_25_7 = CCAnimate:create(var_25_6)

		var_25_1:runAction(CCRepeatForever:create(var_25_7))

		local var_25_8 = CCArray:create()

		var_25_8:addObject(CCCallFuncN:create(function()
			var_25_1:setScale(0.2)
		end))
		var_25_8:addObject(CCFadeIn:create(0))
		var_25_8:addObject(CCScaleTo:create(0.2, 1))
		var_25_8:addObject(CCFadeOut:create(0))

		local var_25_9 = CCSequence:create(var_25_8)

		var_25_1:runAction(CCRepeatForever:create(var_25_9))
	end

	local var_24_1 = CCSprite:create()

	arg_24_0.crackerNode:addChild(var_24_1)
	var_24_1:setPosition(ccp(458, 100))

	local var_24_2 = 0

	math.randomseed(os.time())

	for iter_24_0 = 1, 13 do
		local var_24_3 = CCSprite:createWithSpriteFrameName(string.format("ns_cracker%d.png", iter_24_0))

		var_24_1:addChild(var_24_3, 13 - iter_24_0)

		var_24_2 = var_24_2 + 0.1 + (iter_24_0 % 4 == 0 and 0.2 or 0)

		local var_24_4 = CCArray:create()

		var_24_4:addObject(CCDelayTime:create(var_24_2))
		var_24_4:addObject(CCCallFuncN:create(function()
			var_24_0(var_24_3, iter_24_0)
		end))
		var_24_4:addObject(CCDelayTime:create(0.2))
		var_24_4:addObject(CCCallFuncN:create(function()
			var_24_3:removeFromParentAndCleanup(true)
		end))

		local var_24_5 = CCSequence:create(var_24_4)

		var_24_3:runAction(var_24_5)
	end
end

function var_0_10.showStarEffect(arg_29_0)
	if arg_29_0.starNode then
		arg_29_0.starNode:removeAllChildrenWithCleanup(true)
	else
		arg_29_0.starNode = CCNode:create()

		arg_29_0.beastNode:addChild(arg_29_0.starNode)
		arg_29_0.starNode:setPosition(ccp(120, 60))
	end

	if var_0_3 == "run" then
		return
	end

	local var_29_0 = CCSprite:create()

	var_29_0:setScale(1.4)
	arg_29_0.starNode:addChild(var_29_0)

	local var_29_1 = CCArray:create()

	for iter_29_0 = 1, 2 do
		local var_29_2 = CCSprite:createWithSpriteFrameName(string.format("ns_sick%d.png", iter_29_0))

		var_29_1:addObject(var_29_2:displayFrame())
	end

	local var_29_3 = CCAnimation:createWithSpriteFrames(var_29_1, 0.3)
	local var_29_4 = CCAnimate:create(var_29_3)

	var_29_0:runAction(CCRepeatForever:create(var_29_4))

	local var_29_5 = CCNode:create()

	arg_29_0.starNode:addChild(var_29_5)
	var_29_5:setScaleY(0.5)

	local var_29_6 = CCNode:create()

	var_29_5:addChild(var_29_6)

	for iter_29_1 = 1, 3 do
		local var_29_7 = CCSprite:createWithSpriteFrameName("ns_star.png")

		var_29_6:addChild(var_29_7)

		local var_29_8 = 50 * math.cos(math.rad(120 * iter_29_1 - 90))
		local var_29_9 = 50 * math.sin(math.rad(120 * iter_29_1 - 90))

		var_29_7:setPosition(ccp(var_29_8, var_29_9))
		var_29_7:setScaleY(2)

		if iter_29_1 ~= 1 then
			local var_29_10 = CCArray:create()

			var_29_10:addObject(CCDelayTime:create(0.3 * (iter_29_1 - 1)))
			var_29_10:addObject(CCCallFuncN:create(function()
				var_29_7:setVisible(not var_29_7:isVisible())
			end))

			local var_29_11 = CCSequence:create(var_29_10)

			var_29_7:runAction(CCRepeatForever:create(var_29_11))
		end

		var_29_7:runAction(CCRepeatForever:create(CCRotateBy:create(0.6, -360)))
	end

	var_29_6:runAction(CCRepeatForever:create(CCRotateBy:create(0.6, 360)))

	local var_29_12 = CCArray:create()

	var_29_12:addObject(CCDelayTime:create(5))
	var_29_12:addObject(CCCallFuncN:create(function()
		var_29_0:removeFromParentAndCleanup(true)
		var_29_5:removeFromParentAndCleanup(true)
	end))

	local var_29_13 = CCSequence:create(var_29_12)

	var_29_0:runAction(var_29_13)
end

function var_0_10.showEffectThunder(arg_32_0)
	if arg_32_0.thunderNode then
		arg_32_0.thunderNode:removeAllChildrenWithCleanup(true)
	else
		arg_32_0.thunderNode = CCNode:create()

		arg_32_0.view.widgets.panel:addChild(arg_32_0.thunderNode, 100)
	end

	local function var_32_0(arg_33_0)
		local var_33_0 = {
			ccc3(255, 255, 255),
			var_0_6,
			var_0_8,
			var_0_7,
			var_0_9
		}
		local var_33_1 = CCSprite:create()
		local var_33_2 = 640 + math.random(-200, 200)
		local var_33_3 = 300 + math.random(-100, 100)

		var_33_1:setPosition(ccp(var_33_2, var_33_3))
		arg_32_0.thunderNode:addChild(var_33_1)

		if arg_33_0 > #var_33_0 then
			arg_33_0 = 1
		end

		var_33_1:setColor(var_33_0[arg_33_0])
		var_33_1:setOpacity(150)

		local var_33_4 = CCArray:create()

		for iter_33_0 = 1, 14 do
			local var_33_5 = CCSprite:createWithSpriteFrameName(string.format("btkd_fire%02d.png", iter_33_0))

			var_33_4:addObject(var_33_5:displayFrame())
		end

		local var_33_6 = CCAnimation:createWithSpriteFrames(var_33_4, 0.1)
		local var_33_7 = CCAnimate:create(var_33_6)
		local var_33_8 = CCArray:create()

		var_33_8:addObject(var_33_7)
		var_33_8:addObject(CCCallFuncN:create(function()
			var_33_1:removeFromParentAndCleanup(true)
		end))

		local var_33_9 = CCSequence:create(var_33_8)

		var_33_1:runAction(var_33_9)
	end

	local var_32_1 = CCSprite:create("res/ui/activity/beast/dnsnjl_btn_boom.png")

	var_32_1:setPosition(ccp(670, 200))
	var_32_1:setScale(1.2)
	arg_32_0.thunderNode:addChild(var_32_1)

	local var_32_2 = CCArray:create()

	var_32_2:addObject(CCMoveBy:create(0.1, ccp(0, 2)))
	var_32_2:addObject(CCMoveBy:create(0.1, ccp(0, -4)))
	var_32_2:addObject(CCMoveBy:create(0.1, ccp(0, 2)))

	local var_32_3 = CCRepeat:create(CCSequence:create(var_32_2), 2)
	local var_32_4 = CCSprite:create()

	var_32_1:addChild(var_32_4)
	var_32_4:setPosition(ccp(12, 56))

	local var_32_5 = CCArray:create()

	for iter_32_0 = 1, 5 do
		local var_32_6 = CCSprite:createWithSpriteFrameName(string.format("btkt_huohua%04d.png", iter_32_0))

		var_32_5:addObject(var_32_6:displayFrame())
	end

	local var_32_7 = CCAnimation:createWithSpriteFrames(var_32_5, 0.1)
	local var_32_8 = CCAnimate:create(var_32_7)

	var_32_4:runAction(CCRepeatForever:create(var_32_8))

	local var_32_9 = CCArray:create()

	var_32_9:addObject(var_32_3)
	var_32_9:addObject(CCCallFuncN:create(function()
		var_32_4:removeFromParentAndCleanup(true)
	end))
	var_32_9:addObject(CCCallFuncN:create(function()
		for iter_36_0 = 1, 6 do
			var_32_0(iter_36_0)
		end
	end))
	var_32_9:addObject(CCCallFuncN:create(function()
		var_32_1:removeFromParentAndCleanup(true)
	end))

	local var_32_10 = CCSequence:create(var_32_9)

	var_32_1:runAction(var_32_10)
end

local function var_0_12(arg_38_0)
	local var_38_0 = arg_38_0 / 1000
	local var_38_1 = math.floor(var_38_0 / 3600)
	local var_38_2 = var_38_0 % 3600
	local var_38_3 = math.floor(var_38_2 / 60)
	local var_38_4 = var_38_2 % 60

	return string.format("%02d:%02d", var_38_3, var_38_4)
end

function var_0_10.showPanel(arg_39_0, arg_39_1)
	arg_39_0.info = arg_39_1

	table.sort(arg_39_1.beastArrs, function(arg_40_0, arg_40_1)
		return arg_40_0.beastType > arg_40_1.beastType
	end)

	local var_39_0 = arg_39_1.beastType == 0
	local var_39_1 = arg_39_1.freeTimes > 0

	arg_39_0.beastBlood = arg_39_1.totalBlood - arg_39_1.getBlood

	arg_39_0.view.widgets.btn_city:setVisible(false)
	arg_39_0.view.widgets.Lb_cityName:setVisible(false)

	if arg_39_0.armyTimerLabel then
		arg_39_0.armyTimerLabel:removeFromParentAndCleanup(true)

		arg_39_0.armyTimerLabel = nil
	end

	if arg_39_1.cities and #arg_39_1.cities >= 1 then
		arg_39_0.view.widgets.btn_city:setVisible(true)
		arg_39_0.view.widgets.Lb_cityName:setVisible(true)
		arg_39_0.view.widgets.Lb_cityName:setString(arg_39_1.cities[1].cityName)
	elseif arg_39_1.cd and arg_39_1.cd > 0 then
		local function var_39_2()
			if arg_39_0.armyTimerLabel then
				arg_39_0.armyTimerLabel:removeFromParentAndCleanup(true)

				arg_39_0.armyTimerLabel = nil
			end

			arg_39_0:refresh()
		end

		local var_39_3 = createTimerLabel(arg_39_1.cd + 5000, "@M:@S", "Thonburi", 20, var_39_2, nil, nil, ccc3(255, 0, 0))

		arg_39_0.armyTimerLabel = var_39_3

		local var_39_4, var_39_5 = arg_39_0.view.widgets.Lb_cityName:getPosition()

		var_39_3:setPosition(ccp(var_39_4, var_39_5))
		arg_39_0.view.widgets.panel:addChild(var_39_3)
	end

	local var_39_6

	if var_39_0 then
		var_39_6 = var_39_1 and 135243 or 135239
	else
		var_39_6 = 135243
	end

	arg_39_0.view.widgets.infoLb:setString(language.get(var_39_6))
	arg_39_0.view.widgets.cracker:setString(arg_39_1.cracker)

	local var_39_7 = arg_39_1.thunderNum > 0

	arg_39_0.view.widgets.thunderNum:setVisible(var_39_7)
	arg_39_0.view.widgets.thunderGold:setVisible(not var_39_7)

	if var_39_7 then
		arg_39_0.view.widgets.thunderNum:setString(arg_39_1.thunderNum)
	else
		arg_39_0.view.widgets.thunderGold:setString(arg_39_1.thunderGold)
	end

	arg_39_0.view.widgets.node_select:setVisible(var_39_0)

	if var_39_0 then
		for iter_39_0, iter_39_1 in ipairs(arg_39_1.beastArrs) do
			arg_39_0.view.widgets["btn_beast" .. iter_39_0]:setEnabled(iter_39_1.open)
			arg_39_0.view.widgets["notOpen" .. iter_39_0]:setVisible(not iter_39_1.open)

			if not iter_39_1.open then
				tool.spriteToGray(arg_39_0.view.widgets["beast" .. iter_39_0])
				arg_39_0.view.widgets["name" .. iter_39_0]:setVisible(false)

				local var_39_8, var_39_9 = arg_39_0.view.widgets["name" .. iter_39_0]:getPosition()
				local var_39_10 = GraySprite:create("res/ui/activity/beast/" .. var_0_1[iter_39_1.beastType])

				var_39_10:setPosition(var_39_8, var_39_9)
				arg_39_0.view.widgets["btn_beast" .. iter_39_0]:addChild(var_39_10)
			end

			local var_39_11 = iter_39_1.open and not var_39_1

			arg_39_0.view.widgets["bg_name" .. iter_39_0 .. "1"]:setVisible(var_39_11)
			arg_39_0.view.widgets["bg_name" .. iter_39_0 .. "2"]:setVisible(not var_39_11)

			if var_39_11 then
				arg_39_0.view.widgets["gold" .. iter_39_0]:setString(arg_39_1.beastGold)
			end
		end

		local var_39_12 = var_39_1 and "dnsnjl_word_nscmqxzyzgd.png" or "dnsnjl_word_nsybjbyzhnsm.png"

		arg_39_0.view.widgets.info:setDisplayFrame(CCSprite:create("res/ui/activity/beast/" .. var_39_12):displayFrame())
	elseif arg_39_0.isGetReward == true then
		-- block empty
	else
		var_0_3 = ""
		var_0_4 = 0

		arg_39_0:showBeastAct("idle1")
	end

	arg_39_0.isGetReward = false
end

function var_0_10.ctor(arg_42_0, arg_42_1, arg_42_2)
	log.info("@@ 首充豪礼活动")
	rmgr.loadResource("res/ui/activity/beast/beastPic.plist")
	rmgr.loadResource("res/ui/activity/beast/beastAnim.plist")
	rmgr.loadResource("res/ui/activity/beast/beastAnim_gem.plist")
	rmgr.loadResource("res/ui/activity/beast/beastAnim_silk.plist")
	rmgr.loadResource("res/ui/activity/beast/reward.plist")
	rmgr.loadResource("res/ui/activity/ironMine/btkd_fire.plist")
	rmgr.loadResource("res/ui/activity/ironMine/ironMinePic.plist")

	arg_42_0.view = {}

	uiutil.initWidgets(arg_42_0.view, arg_42_0.layout)

	arg_42_0.leftTime = arg_42_0.view.widgets.leftTime

	if arg_42_1 then
		arg_42_0:addChild(arg_42_0.view.widgets.panel)
		arg_42_1:addChild(arg_42_0)
	end

	arg_42_0.view.widgets.btn_cracker:addHandleOfControlEvent(function()
		log.info("btn_cracker")
		arg_42_0:onGetBeastReward(1)
	end, CCControlEventTouchUpInside)
	arg_42_0.view.widgets.btn_thunder:addHandleOfControlEvent(function()
		log.info("btn_thunder")
		arg_42_0:onGetBeastReward(2)
	end, CCControlEventTouchUpInside)
	arg_42_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_42_0:showTip()
	end, CCControlEventTouchUpInside)

	local var_42_0 = CCLayerColor:create(ccc4(0, 0, 0, 0), 909, 404)
	local var_42_1 = CCScrollView:create(CCSizeMake(909, 404), var_42_0)

	var_42_1:setPosition(ccp(3, 3))
	var_42_1:setTouchEnabled(false)
	arg_42_0.view.widgets.panel:addChild(var_42_1)

	arg_42_0.beastLayer = var_42_0

	for iter_42_0 = 1, 3 do
		arg_42_0.view.widgets["btn_beast" .. iter_42_0]:addHandleOfControlEvent(function()
			log.info("btn_beast" .. iter_42_0)

			local var_46_0 = arg_42_0.info.beastArrs[iter_42_0]

			arg_42_0:onBuyBeast(var_46_0.beastType)
		end, CCControlEventTouchUpInside)
	end

	arg_42_0.view.widgets.btn_city:addHandleOfControlEvent(function()
		log.info("btn_city")
		arg_42_0:onGoToCity(arg_42_0.info.cities[1].cityId)
	end, CCControlEventTouchUpInside)
	arg_42_0:showPanel(arg_42_2)
end

function var_0_10.showTip(arg_48_0, arg_48_1)
	log.info("should show tips ")

	local var_48_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_48_0:registerScriptTouchHandler(function(arg_49_0, arg_49_1, arg_49_2)
		if arg_49_0 == CCTOUCHBEGAN then
			return true
		elseif arg_49_0 == CCTOUCHMOVED then
			return true
		elseif arg_49_0 == CCTOUCHENDED then
			pcall(var_48_0.removeFromParentAndCleanup, var_48_0, true)

			return true
		end
	end, false, true)
	var_48_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_48_0, 60000)

	local var_48_1 = 0
	local var_48_2 = 0
	local var_48_3 = {}

	uiutil.initWidgets(var_48_3, arg_48_0.tipFrame)
	var_48_0:addChild(var_48_3.widgets.tipFrame)

	local var_48_4, var_48_5 = tool.getPositionInScreen(arg_48_0.view.widgets.btn_tip)
	local var_48_6 = var_48_4 + 20
	local var_48_7 = var_48_5 - 20
	local var_48_8 = language.get(135238) .. "\n\n" .. language.get(135240) .. "\n" .. language.get(135241)

	var_48_3.widgets.tipMsg:setString(var_48_8)

	local var_48_9 = var_48_3.widgets.tipMsg:getContentSize().width
	local var_48_10 = var_48_3.widgets.tipMsg:getContentSize().height

	var_48_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_48_9 + 30, var_48_10 + 30))
	var_48_3.widgets.tipFrame:setPosition(ccp(var_48_6, var_48_7))
	var_48_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_48_3.widgets.tipFrame:setVisible(true)
end

return var_0_10
