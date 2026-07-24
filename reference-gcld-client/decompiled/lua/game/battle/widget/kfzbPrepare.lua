local function var_0_0(arg_1_0)
	local var_1_0 = "battle_pre_gen_qual_white.png"

	if arg_1_0 == 2 then
		var_1_0 = "battle_pre_gen_qual_blue.png"
	elseif arg_1_0 == 3 then
		var_1_0 = "battle_pre_gen_qual_green.png"
	elseif arg_1_0 == 4 then
		var_1_0 = "battle_pre_gen_qual_yellow.png"
	elseif arg_1_0 == 5 then
		var_1_0 = "battle_pre_gen_qual_red.png"
	elseif arg_1_0 == 6 then
		var_1_0 = "battle_pre_gen_qual_purple.png"
	end

	return var_1_0
end

local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = colorQuality[3]
local var_0_3 = colorQuality[4]
local var_0_4 = {
	att = {},
	def = {}
}
local var_0_5 = {}
local var_0_6 = {
	parent = "uiLayer",
	widgets = {
		{
			y = 0,
			name = "passLayer",
			x = 0,
			type = "layerColor",
			visible = false,
			color = ccc4(0, 0, 0, 180),
			width = visibleSize.width,
			height = visibleSize.height * 0.5 - 10,
			children = {
				{
					name = "panel",
					y = 170,
					type = "sprite",
					pic = {
						frame = true,
						path = "xflts_prep_lk.png"
					},
					x = visibleSize.width * 0.5
				}
			}
		},
		{
			name = "panel",
			type = "sprite",
			pic = {
				frame = true,
				path = "battle_pre_gen_prep_vs.png"
			},
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 + 5,
			children = {
				{
					text = "",
					name = "matchLabel",
					y = 25,
					type = "label",
					style = "label_yellowish_24",
					x = 531,
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					type = "label",
					name = "tipsLb",
					y = 100,
					visible = false,
					style = "label_green_24",
					x = 531,
					textId = 226315,
					anchorPoint = ccp(0.5, 0.5)
				}
			}
		},
		{
			zoomOnTouchDown = false,
			name = "saveButton",
			h = 94,
			type = "button",
			w = 214,
			visible = false,
			scale = 0.8,
			normal = {
				frame = true,
				path = "btn_xflts_bczx_a.png"
			},
			touched = {
				frame = true,
				path = "btn_xflts_bczx_c.png"
			},
			x = visibleSize.width - 100 - platform.getSafeDistance(),
			y = visibleSize.height - 150
		},
		{
			zoomOnTouchDown = true,
			name = "trickButton",
			h = 140,
			type = "button",
			w = 120,
			visible = false,
			normal = {
				path = "res/default.png"
			},
			touched = {
				path = "res/default.png"
			},
			x = visibleSize.width - 100 - platform.getSafeDistance(),
			y = visibleSize.height - 150,
			children = {
				{
					y = 80,
					x = 60,
					type = "node",
					children = {
						{
							y = 0,
							name = "bg_icon",
							type = "sprite",
							x = 0,
							pic = {
								path = "res/ui/kfzb/wgjc_tx_di.png"
							},
							children = {
								{
									y = 56,
									name = "icon",
									type = "sprite",
									x = 56,
									pic = {
										path = "res/ui/common/fightPic/fightPic_xunyu2.png"
									}
								}
							}
						},
						{
							type = "sprite",
							name = "bg_num",
							y = -70,
							visible = false,
							x = 0,
							pic = {
								path = "res/ui/kfzb/wgjc_word_di.png"
							},
							children = {
								{
									fontSize = 20,
									name = "num",
									style = "label_green_24",
									type = "label",
									y = 22,
									x = 73,
									color = colorQuality[4]
								}
							}
						},
						{
							y = -40,
							name = "bg_state",
							type = "sprite",
							x = 0,
							pic = {
								path = "res/ui/kfzb/wgjc_word_di2.png"
							},
							children = {
								{
									y = 24,
									name = "state",
									type = "sprite",
									x = 70,
									pic = {
										path = "res/ui/kfzb/wgjc_word_01.png"
									}
								}
							}
						}
					}
				}
			}
		},
		{
			type = "node",
			name = "node_giveWay",
			visible = false,
			x = visibleSize.width - 100 - platform.getSafeDistance(),
			y = visibleSize.height * 0.5,
			children = {
				{
					type = "sprite9",
					y = 0,
					rotate = 90,
					x = 0,
					preferedSize = CCSizeMake(160, 150),
					middleRect = CCRectMake(45, 13, 3, 1),
					pic = {
						path = "res/ui/activity/gangMine/blgkd_number_bg2.png"
					}
				},
				{
					name = "btn_giveWay1",
					h = 58,
					type = "button",
					w = 140,
					y = 30,
					x = 0,
					normal = {
						frame = true,
						path = "btn3_yel_a.png"
					},
					touched = {
						frame = true,
						path = "btn3_yel_c.png"
					},
					disable = {
						frame = true,
						path = "btn3_yel_g.png"
					},
					children = {
						{
							text = "",
							name = "txt_giveWay",
							y = 29,
							type = "label",
							style = "label_yellowish_24",
							x = 70,
							anchorPoint = ccp(0.5, 0.5)
						}
					}
				},
				{
					name = "btn_giveWay2",
					h = 58,
					type = "button",
					w = 140,
					y = -30,
					x = 0,
					normal = {
						frame = true,
						path = "btn3_yel_a.png"
					},
					touched = {
						frame = true,
						path = "btn3_yel_c.png"
					},
					disable = {
						frame = true,
						path = "btn3_yel_g.png"
					},
					children = {
						{
							y = 29,
							style = "label_yellowish_24",
							type = "label",
							x = 70,
							textId = 136437,
							anchorPoint = ccp(0.5, 0.5)
						}
					}
				}
			}
		},
		{
			zoomOnTouchDown = true,
			name = "btn_buff1",
			h = 53,
			type = "button",
			w = 55,
			visible = false,
			normal = {
				path = "res/ui/kfzb/buff.png"
			},
			touched = {
				path = "res/ui/kfzb/buff.png"
			},
			x = visibleSize.width * 0.5 + 232,
			y = visibleSize.height * 0.5 + 38,
			children = {
				{
					x = 50,
					name = "p1BuffNum",
					type = "atlaslabel",
					pic = "res/ui/common/number/clock_lucky_numb.png",
					startCharMap = 48,
					text = "0",
					y = 6,
					itemWidth = 32,
					scale = 0.5,
					itemHeight = 42,
					anchorPoint = ccp(1, 0)
				}
			}
		},
		{
			zoomOnTouchDown = true,
			name = "btn_buff2",
			h = 53,
			type = "button",
			w = 55,
			visible = false,
			normal = {
				path = "res/ui/kfzb/buff.png"
			},
			touched = {
				path = "res/ui/kfzb/buff.png"
			},
			x = visibleSize.width * 0.5 + 232,
			y = visibleSize.height * 0.5 - 38,
			children = {
				{
					x = 50,
					name = "p2BuffNum",
					type = "atlaslabel",
					pic = "res/ui/common/number/clock_lucky_numb.png",
					startCharMap = 48,
					text = "0",
					y = 6,
					itemWidth = 32,
					scale = 0.5,
					itemHeight = 42,
					anchorPoint = ccp(1, 0)
				}
			}
		},
		{
			type = "sprite",
			name = "p1NoUseTactic",
			visible = false,
			pic = {
				frame = true,
				path = "fightBuff_75.png"
			},
			x = visibleSize.width * 0.5 + 232,
			y = visibleSize.height - 20
		},
		{
			type = "sprite",
			name = "p2NoUseTactic",
			visible = false,
			y = 20,
			pic = {
				frame = true,
				path = "fightBuff_75.png"
			},
			x = visibleSize.width * 0.5 + 232
		},
		{
			text = "",
			name = "playerInfoLabelAtt",
			anchorX = 0.5,
			type = "richLabel",
			visible = false,
			x = visibleSize.width * 0.5,
			y = visibleSize.height - 20
		},
		{
			text = "",
			name = "playerInfoLabelDef",
			anchorX = 0.5,
			type = "richLabel",
			y = 20,
			visible = false,
			x = visibleSize.width * 0.5
		},
		{
			name = "attPlayer",
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/common/text/battle/fight_info_att.png"
			},
			x = visibleSize.width * 0.5 + 300,
			y = visibleSize.height * 0.75 + 80
		},
		{
			name = "defPlayer",
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/common/text/battle/fight_info_def.png"
			},
			x = visibleSize.width * 0.5 + 300,
			y = visibleSize.height * 0.25 + 80
		},
		{
			type = "node",
			name = "supUiNode",
			zorder = 1,
			children = {
				{
					zoomOnTouchDown = true,
					name = "btnAttGu",
					h = 109,
					type = "button",
					w = 148,
					visible = false,
					normal = {
						frame = false,
						path = "res/ui/kfzb/kfzbs_zdzb_djzc01.png"
					},
					touched = {
						frame = false,
						path = "res/ui/kfzb/kfzbs_zdzb_djzc01.png"
					},
					x = visibleSize.width - 110,
					y = visibleSize.height * 0.75 - 10,
					children = {
						{
							x = 74,
							y = 20,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/kfzb/kfzbs_zdzb_djzc.png"
							}
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btnDefGu",
					h = 109,
					type = "button",
					w = 148,
					visible = false,
					normal = {
						frame = false,
						path = "res/ui/kfzb/kfzbs_zdzb_djzc01.png"
					},
					touched = {
						frame = false,
						path = "res/ui/kfzb/kfzbs_zdzb_djzc01.png"
					},
					x = visibleSize.width - 110,
					y = visibleSize.height * 0.25 - 10,
					children = {
						{
							x = 74,
							y = 20,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/kfzb/kfzbs_zdzb_djzc.png"
							}
						}
					}
				},
				{
					text = "",
					name = "supNum",
					type = "label",
					size = 20,
					style = "label_green_24",
					anchorPoint = {
						x = 0,
						y = 0.5
					},
					x = visibleSize.width * 0.5 + 100,
					y = visibleSize.height * 0.5
				},
				{
					text = "",
					name = "attGfLb",
					type = "label",
					size = 20,
					style = "label_green_24",
					anchorPoint = {
						x = 0,
						y = 0.5
					},
					x = visibleSize.width * 0.5 - 470,
					y = visibleSize.height * 0.75 - 25
				},
				{
					text = "",
					name = "defGfLb",
					type = "label",
					size = 20,
					style = "label_green_24",
					anchorPoint = {
						x = 0,
						y = 0.5
					},
					x = visibleSize.width * 0.5 - 470,
					y = visibleSize.height * 0.25 - 25
				},
				{
					name = "attSupTrue",
					type = "sprite",
					visible = false,
					pic = {
						frame = false,
						path = "res/ui/kfzb/kfzbs_zdzb_yzc01.png"
					},
					x = visibleSize.width - 110,
					y = visibleSize.height * 0.75,
					children = {
						{
							x = 43,
							y = 0,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/kfzb/kfzbs_zdzb_yzc02.png"
							}
						}
					}
				},
				{
					name = "defSupTrue",
					type = "sprite",
					visible = false,
					pic = {
						frame = false,
						path = "res/ui/kfzb/kfzbs_zdzb_yzc01.png"
					},
					x = visibleSize.width - 110,
					y = visibleSize.height * 0.25,
					children = {
						{
							x = 43,
							y = 0,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/kfzb/kfzbs_zdzb_yzc02.png"
							}
						}
					}
				},
				{
					text = "攻方支持数XX",
					name = "attSupNum",
					type = "label",
					style = "label_green_24",
					size = 26,
					visible = false,
					x = visibleSize.width - 110,
					y = visibleSize.height * 0.75 - 70
				},
				{
					text = "守方支持数XX",
					name = "defSupNum",
					type = "label",
					style = "label_green_24",
					size = 26,
					visible = false,
					x = visibleSize.width - 110,
					y = visibleSize.height * 0.25 - 70
				},
				{
					anchorPointX = 0.5,
					name = "richLine",
					type = "richLine",
					visible = false,
					gap = 0,
					x = visibleSize.width * 0.5 + 230,
					y = visibleSize.height * 0.5,
					content = {
						{
							y = 0,
							name = "rewardIcon",
							x = 0,
							type = "sprite"
						},
						{
							y = 0,
							name = "rewardNum",
							style = "label_green_24",
							type = "label",
							size = 26,
							x = 0,
							color = var_0_3
						}
					}
				}
			}
		}
	}
}
local var_0_7 = {
	x = 0,
	name = "cardSprite",
	y = 0,
	type = "sprite",
	pic = {
		frame = true,
		path = "battle_pre_gen_list_view_bg.png"
	},
	children = {
		{
			x = 67,
			name = "selectedSprite",
			y = 108,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "battle_pre_gen_list_view_on.png"
			}
		},
		{
			y = 120,
			name = "headPicBg",
			x = 67,
			type = "sprite"
		},
		{
			y = 112,
			name = "headPic",
			x = 67,
			type = "sprite"
		},
		{
			text = "",
			name = "generalName",
			y = 190,
			type = "label",
			style = "label_white_20",
			size = 26,
			x = 67
		},
		{
			text = "",
			name = "skillName",
			y = 50,
			type = "label",
			style = "label_white_20",
			size = 26,
			x = 67
		},
		{
			text = "",
			name = "lv",
			y = 165,
			type = "label",
			size = 22,
			x = 115,
			zorder = 1,
			anchorPoint = ccp(1, 1)
		},
		{
			x = 84,
			y = 18,
			type = "sprite",
			pic = {
				frame = true,
				path = "battle_pre_gen_blood_full.png"
			}
		},
		{
			name = "hpNum",
			type = "atlaslabel",
			pic = "res/ui/common/number/gen_amount_numb.png",
			startCharMap = 48,
			text = "0",
			y = 18,
			itemWidth = 12,
			x = 84,
			itemHeight = 19,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			visible = false,
			name = "attIndexNum",
			zorder = 1,
			type = "atlaslabel",
			pic = "res/ui/common/number/battle_prepare_compo_blue.png",
			startCharMap = 49,
			text = "0",
			y = 90,
			itemWidth = 40,
			x = 105,
			itemHeight = 48,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			visible = false,
			name = "defIndexNum",
			zorder = 1,
			type = "atlaslabel",
			pic = "res/ui/common/number/battle_prepare_compo_red.png",
			startCharMap = 49,
			text = "0",
			y = 90,
			itemWidth = 40,
			x = 105,
			itemHeight = 48,
			anchorPoint = ccp(0.5, 0.5)
		}
	}
}
local var_0_8 = {
	y = 320,
	name = "bg",
	type = "sprite",
	x = 480,
	anchorPoint = ccp(1, 0.5),
	pic = {
		path = "res/ui/kfzb/jywdh_xzjl_di.png"
	},
	children = {
		{
			fontSize = 25,
			y = 135,
			type = "label",
			x = 200,
			textId = 490094,
			color = var_0_1
		}
	}
}
local var_0_9 = {
	zoomOnTouchDown = true,
	name = "btn",
	h = 80,
	type = "button",
	w = 80,
	y = 0,
	x = 0,
	normal = {
		path = "res/default.png"
	},
	touched = {
		path = "res/default.png"
	},
	children = {
		{
			y = 40,
			name = "icon",
			type = "sprite",
			x = 40,
			pic = {
				path = "res/ui/resource/tickets/ticket_icon_big.png"
			}
		},
		{
			fontSize = 25,
			name = "num",
			y = 10,
			type = "label",
			x = 40,
			color = var_0_1
		}
	}
}
local var_0_10 = {
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
			color = color_whi
		}
	}
}

function var_0_5.createGeneralCard(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	local var_2_0 = 155
	local var_2_1 = visibleSize.width * 0.5 + var_2_0 * 1.5
	local var_2_2 = visibleSize.height * 0.75 + 16

	if arg_2_3 == "def" then
		var_2_2 = visibleSize.height * 0.25 - 16
	end

	local var_2_3 = {}
	local var_2_4 = {}

	var_0_4[arg_2_3] = {}

	for iter_2_0, iter_2_1 in pairs(arg_2_4) do
		var_0_4[arg_2_3][iter_2_0] = ccp(var_2_1, var_2_2)

		local var_2_5 = {}

		uiutil.initWidgets(var_2_5, var_0_7)
		var_2_5.widgets.cardSprite:setPosition(ccp(var_2_1, var_2_2))
		arg_2_1:addChild(var_2_5.widgets.cardSprite)
		var_2_5.widgets.generalName:setString(tostring(iter_2_1.generalName))

		iter_2_1.quality = iter_2_1.quality or 1

		var_2_5.widgets.generalName:setColor(colorQuality[iter_2_1.quality])

		local var_2_6 = string.format("res/ui/common/generalHead/generalHead_%s.png", iter_2_1.generalPic)

		var_2_5.widgets.headPic:setDisplayFrame(CCSprite:create(var_2_6):displayFrame())
		var_2_5.widgets.headPicBg:setDisplayFrame(CCSprite:createWithSpriteFrameName(var_0_0(iter_2_1.quality)):displayFrame())

		if iter_2_1.tacticName and type(iter_2_1.tacticName) == "string" then
			var_2_5.widgets.skillName:setString(iter_2_1.tacticName)
		end

		var_2_5.widgets.lv:setString(string.format("Lv%s", iter_2_1.generalLv))
		var_2_5.widgets.hpNum:setString(tostring(iter_2_1.armyHpMax))

		if iter_2_1.troopType > 9 then
			iter_2_1.troopType = 9
		end

		local var_2_7 = string.format("troop_%d.png", iter_2_1.troopType)
		local var_2_8 = CCSprite:createWithSpriteFrameName(var_2_7)

		var_2_8:setScale(0.85)
		var_2_8:setPosition(ccp(19, 19))
		var_2_5.widgets.cardSprite:addChild(var_2_8)
		log.info("@@ general index ", iter_2_1.index)

		if arg_2_3 == "att" then
			var_2_5.widgets.attIndexNum:setVisible(true)
			var_2_5.widgets.attIndexNum:setString(string.format("%d", iter_2_0))
		else
			var_2_5.widgets.defIndexNum:setVisible(true)
			var_2_5.widgets.defIndexNum:setString(string.format("%d", iter_2_0))
		end

		var_2_3[iter_2_0] = var_2_5
		var_2_4[iter_2_0] = iter_2_1
		var_2_1 = var_2_1 - var_2_0
	end

	return var_2_3, var_2_4
end

function var_0_5.create(arg_3_0, arg_3_1)
	rmgr.loadResource("res/ui/battle/battlePrepare/battlePrepare.plist")
	rmgr.loadResource("res/ui/battle/buff/buff.plist")

	local var_3_0 = createBaseLayer()
	local var_3_1
	local var_3_2
	local var_3_3
	local var_3_4 = arg_3_1.kfzbInfo.isAttacker and "att" or "def"
	local var_3_5 = arg_3_1.kfzbInfo.nextSRoundCD / 1000
	local var_3_6 = {}

	uiutil.initLayout(var_3_6, var_0_6)

	local function var_3_7(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = arg_4_1.widgets.headPic
		local var_4_1 = arg_4_1.widgets.headPicBg
		local var_4_2 = arg_4_1.widgets.generalName
		local var_4_3 = arg_4_1.widgets.cardSprite
		local var_4_4 = var_4_0:getChildren()
		local var_4_5 = var_4_4 ~= nil and var_4_4.count ~= nil and var_4_4:count() > 0

		if arg_4_0 then
			if var_4_5 and arg_4_2 then
				arg_4_2.quality = arg_4_2.quality or 1

				var_4_0:removeAllChildrenWithCleanup(true)
				var_4_1:setDisplayFrame(CCSprite:createWithSpriteFrameName(var_0_0(arg_4_2.quality)):displayFrame())
				var_4_2:setColor(colorQuality[arg_4_2.quality])
				var_4_3:setDisplayFrame(CCSprite:createWithSpriteFrameName("battle_pre_gen_list_view_bg.png"):displayFrame())
			end
		elseif not var_4_5 then
			tool.spriteToGray(var_4_0)
			var_4_1:setDisplayFrame(CCSprite:createWithSpriteFrameName("battle_pre_gen_qual_gray.png"):displayFrame())
			var_4_2:setColor(colorQuality[0])
			var_4_3:setDisplayFrame(CCSprite:createWithSpriteFrameName("battle_pre_gen_list_view_gray.png"):displayFrame())
		end
	end

	local function var_3_8(arg_5_0)
		if var_3_3 then
			local var_5_0 = ""

			for iter_5_0, iter_5_1 in pairs(var_3_3) do
				var_5_0 = var_5_0 .. tostring(iter_5_1.generalId) .. "#"
			end

			cmgr.sendRequest(arg_5_0, actions.kfzbSynData, var_5_0)
		end
	end

	local function var_3_9()
		local function var_6_0()
			log.info("@@ 完成同步")
			smgr.showTipTextGreen(language.get(390411))
		end

		var_3_8(var_6_0)
	end

	local function var_3_10()
		if arg_3_1.kfzbInfo.kfzbState == kfzbState.support then
			log.info("@@ kfzbPrepare.lua,跨服争霸，重新获得支持面板")
			kfzbControl.kfzbGetSupportPanel(arg_3_1.kfzbInfo.matchId)
		else
			arg_3_1.layerTabel.prepareLayer:removeChild(var_3_0, true)
			arg_3_1.layerTabel.prepareLayer:removeAllChildrenWithCleanup(true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.passLayer, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.panel, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.saveButton, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.trickButton, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.playerInfoLabelAtt, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.playerInfoLabelDef, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.attPlayer, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.defPlayer, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.node_giveWay, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.btn_buff1, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.btn_buff2, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.p1NoUseTactic, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.p2NoUseTactic, true)
			log.info("@@ kfzbPrepare.lua,跨服争霸")

			if arg_3_1.kfzbInfo.competitorId1 == 0 or arg_3_1.kfzbInfo.competitorId2 == 0 then
				arg_3_1.kfzbInit()
			else
				arg_3_1.kfzbInfo.kfzbState = kfzbState.fight

				local var_8_0 = CCSprite:createWithSpriteFrameName("xflts_start.png")

				var_8_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
				var_8_0:setScale(20)
				smgr.getLayer("tipLayer"):addChild(var_8_0, 0, 1000)

				local function var_8_1()
					smgr.getLayer("tipLayer"):removeChild(var_8_0, true)
				end

				local var_8_2 = CCArray:create()

				var_8_2:addObject(CCScaleTo:create(0.3, 1))
				var_8_2:addObject(CCDelayTime:create(1))
				var_8_2:addObject(CCCallFuncN:create(var_8_1))
				var_8_0:runAction(CCSequence:create(var_8_2))
			end
		end
	end

	function var_0_5.updateView(arg_10_0)
		local function var_10_0(arg_11_0)
			arg_3_1.layerTabel.prepareLayer:removeAllChildrenWithCleanup(true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.supUiNode, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.passLayer, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.panel, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.saveButton, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.trickButton, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.playerInfoLabelAtt, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.playerInfoLabelDef, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.attPlayer, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.defPlayer, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.node_giveWay, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.btn_buff1, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.btn_buff2, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.p1NoUseTactic, true)
			arg_3_1.layerTabel.uiLayer:removeChild(var_3_6.widgets.p2NoUseTactic, true)
			arg_3_1.updateKfzbInfo(arg_11_0)
			arg_3_1.showKfzbPrepare()
		end

		cmgr.sendRequest(var_10_0, actions.kfzbGetSupportPanel, arg_3_1.kfzbInfo.matchId)
	end

	local function var_3_11(arg_12_0, arg_12_1)
		arg_12_1 = arg_12_1 or 0

		local function var_12_0(arg_13_0)
			if var_3_6.widgets.selectPanel then
				var_3_6.widgets.selectPanel:removeFromParentAndCleanup(true)

				var_3_6.widgets.selectPanel = nil
			end

			var_0_5:updateView()
		end

		cmgr.sendRequest(var_12_0, actions.kfzbSupport, arg_3_1.kfzbInfo.matchId, arg_12_0, arg_12_1)
	end

	local function var_3_12(arg_14_0)
		local function var_14_0()
			if arg_14_0 == arg_3_1.kfzbInfo.competitorId1 then
				var_3_6.widgets.selectPanel:setPositionY(visibleSize.height * 0.75)
			elseif arg_14_0 == arg_3_1.kfzbInfo.competitorId2 then
				var_3_6.widgets.selectPanel:setPositionY(visibleSize.height * 0.25)
			end
		end

		local function var_14_1(arg_16_0)
			if not arg_16_0 or tolua.isnull(arg_16_0) then
				return
			end

			local var_16_0 = CCArray:create()

			var_16_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
			var_16_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
			var_16_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
			var_16_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
			var_16_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
			var_16_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
			var_16_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
			var_16_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
			var_16_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
			var_16_0:addObject(CCDelayTime:create(0.4))

			local var_16_1 = CCSequence:create(var_16_0)

			arg_16_0:stopAllActions()
			arg_16_0:runAction(CCRepeatForever:create(var_16_1))
		end

		if not var_3_6.widgets.selectPanel then
			local function var_14_2(arg_17_0)
				local var_17_0 = arg_17_0.action.data
				local var_17_1 = {}

				uiutil.initWidgets(var_17_1, var_0_8)
				var_17_1.widgets.bg:setPosition(ccp(visibleSize.width - 110, visibleSize.height * 0.5))
				smgr.getLayer("uiLayer"):addChild(var_17_1.widgets.bg)

				var_3_6.widgets.selectPanel = var_17_1.widgets.bg

				var_14_0()

				local var_17_2 = #var_17_0.rewards

				for iter_17_0, iter_17_1 in ipairs(var_17_0.rewards) do
					uiutil.initWidgets(var_17_1, var_0_9)
					var_17_1.widgets.btn:addHandleOfControlEvent(function()
						log.info("btn_pos" .. iter_17_1.pos)
						var_3_11(arg_14_0, iter_17_1.pos)
					end, CCControlEventTouchUpInside)
					var_17_1.widgets.icon:setDisplayFrame(CCSprite:create(kfzbConstant.rewardTypeTable[iter_17_1.type].pic):displayFrame())
					var_17_1.widgets.num:setString(iter_17_1.num)

					local var_17_3 = 200 - 50 * (var_17_2 - 1) + 100 * (iter_17_0 - 1)

					var_17_1.widgets.btn:setPosition(ccp(var_17_3, 55))
					var_17_1.widgets.bg:addChild(var_17_1.widgets.btn)
					var_14_1(var_17_1.widgets.icon)
				end

				for iter_17_2 = 1, var_17_2 - 1 do
					local var_17_4 = CCLabelTTF:create(language.get(490095), "", 22)
					local var_17_5 = 250 - 50 * (var_17_2 - 1) + 100 * (iter_17_2 - 1)

					var_17_4:setPosition(ccp(var_17_5, 55))
					var_17_1.widgets.bg:addChild(var_17_4)
				end
			end

			cmgr.sendRequest(var_14_2, actions.kfzbGetRewardInfo, 0)
		else
			var_14_0()
		end
	end

	local function var_3_13(arg_19_0)
		local function var_19_0()
			if user.kfzbZone > 0 then
				var_3_12(arg_19_0)
			else
				var_3_11(arg_19_0)
			end
		end

		if arg_3_1.kfzbInfo.leftNum == 0 then
			messageBox.showChargeWin(language.get(10003), language.get(490058, arg_3_1.kfzbInfo.buySupGold), "kfzbBuySup", function()
				local function var_21_0(arg_22_0)
					var_19_0()
				end

				cmgr.sendRequest(var_21_0, actions.kfzbBuyFlower)
			end)
		else
			var_19_0()
		end
	end

	local var_3_14 = ""

	arg_3_1.kfzbInfo.isNextMatch = false

	if arg_3_1.kfzbInfo.matchId == 1 then
		var_3_14 = language.get(490045, language.get(490041), arg_3_1.kfzbInfo.round)

		if arg_3_1.kfzbInfo.round == 5 then
			arg_3_1.kfzbInfo.isNextMatch = true
		end
	elseif arg_3_1.kfzbInfo.matchId == 2 or arg_3_1.kfzbInfo.matchId == 3 then
		var_3_14 = language.get(490045, language.get(490040), arg_3_1.kfzbInfo.round)

		if arg_3_1.kfzbInfo.round == 5 then
			arg_3_1.kfzbInfo.isNextMatch = true
		end
	elseif arg_3_1.kfzbInfo.matchId >= 4 and arg_3_1.kfzbInfo.matchId <= 7 then
		var_3_14 = language.get(490044, language.get(490039), arg_3_1.kfzbInfo.round)

		if arg_3_1.kfzbInfo.round == 3 then
			arg_3_1.kfzbInfo.isNextMatch = true
		end
	elseif arg_3_1.kfzbInfo.matchId >= 8 and arg_3_1.kfzbInfo.matchId <= 15 then
		var_3_14 = language.get(490044, language.get(490038), arg_3_1.kfzbInfo.round)

		if arg_3_1.kfzbInfo.round == 3 then
			arg_3_1.kfzbInfo.isNextMatch = true
		end
	else
		local var_3_15 = language.get(user.kfzbZone > 0 and 490087 or 490086)

		arg_3_1.kfzbInfo.isNextMatch = true
		var_3_14 = language.get(490043, kfzbControl.kfzbData.saiqu, var_3_15, arg_3_1.kfzbInfo.layerNum)
	end

	if user.kfzbZone > 0 then
		var_3_14 = string.format("%s-%s", language.get(490088, user.kfzbZone), var_3_14)
	end

	var_3_6.widgets.matchLabel:setString(var_3_14)

	local var_3_16 = arg_3_1.kfzbInfo.matchId < 16 and arg_3_1.kfzbInfo.round == 1 and (arg_3_1.kfzbInfo.dice ~= nil or arg_3_1.kfzbInfo.nextSRoundCD >= 300000)

	var_3_6.widgets.tipsLb:setVisible(var_3_16)

	local var_3_17 = createTimerLabel(arg_3_1.kfzbInfo.nextSRoundCD, "@H:@M:@S", "Thonburi", 32, var_3_10, nil, nil, colorTips.red)

	var_3_17:setPosition(ccp(531, 60))
	var_3_6.widgets.panel:addChild(var_3_17)

	local var_3_18
	local var_3_19
	local var_3_20

	if arg_3_1.kfzbInfo.isAttacker then
		var_3_18 = visibleSize.height * 0.75 - 120
		var_3_19 = visibleSize.height * 0.75
		var_3_20 = visibleSize.height * 0.25
	else
		var_3_18 = visibleSize.height * 0.25 - 120
		var_3_19 = visibleSize.height * 0.25
		var_3_20 = visibleSize.height * 0.75
	end

	var_3_6.widgets.saveButton:setPositionY(var_3_18)
	var_3_6.widgets.trickButton:setPositionY(var_3_19)
	var_3_6.widgets.node_giveWay:setPositionY(var_3_20)

	local function var_3_21(arg_23_0)
		log.info("should show tips ")

		local var_23_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

		var_23_0:registerScriptTouchHandler(function(arg_24_0, arg_24_1, arg_24_2)
			if arg_24_0 == CCTOUCHBEGAN then
				return true
			elseif arg_24_0 == CCTOUCHMOVED then
				return true
			elseif arg_24_0 == CCTOUCHENDED then
				pcall(var_23_0.removeFromParentAndCleanup, var_23_0, true)

				return true
			end
		end, false, true)
		var_23_0:setTouchEnabled(true)
		smgr.rootLayer:addChild(var_23_0, 60000)

		local var_23_1 = 0
		local var_23_2 = 0
		local var_23_3 = {}

		uiutil.initWidgets(var_23_3, var_0_10)
		var_23_0:addChild(var_23_3.widgets.tipFrame)

		local var_23_4, var_23_5 = tool.getPositionInScreen(var_3_6.widgets["btn_buff" .. arg_23_0])
		local var_23_6 = var_23_4
		local var_23_7 = var_23_5
		local var_23_8 = arg_23_0 == 1 and arg_3_1.kfzbInfo.p1BuffNum or arg_3_1.kfzbInfo.p2BuffNum
		local var_23_9 = language.get(136427, var_23_8)

		var_23_3.widgets.tipMsg:setString(var_23_9)

		local var_23_10 = var_23_3.widgets.tipMsg:getContentSize().width
		local var_23_11 = var_23_3.widgets.tipMsg:getContentSize().height

		var_23_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_23_10 + 30, var_23_11 + 30))
		var_23_3.widgets.tipFrame:setPosition(ccp(var_23_6, var_23_7))
		var_23_3.widgets.tipMsg:setPosition(ccp(15, 15))
		var_23_3.widgets.tipFrame:setVisible(true)
	end

	var_3_6.widgets.btn_buff1:addHandleOfControlEvent(function()
		log.info("btn_buff1")
		var_3_21(1)
	end, CCControlEventTouchUpInside)
	var_3_6.widgets.btn_buff2:addHandleOfControlEvent(function()
		log.info("btn_buff2")
		var_3_21(2)
	end, CCControlEventTouchUpInside)

	if arg_3_1.kfzbInfo.kfzbState == kfzbState.support then
		if arg_3_1.kfzbInfo.matchId >= 4 and arg_3_1.kfzbInfo.matchId <= 15 and arg_3_1.kfzbInfo.round > 1 and arg_3_1.kfzbInfo.supported == 0 then
			arg_3_1.kfzbInfo.supported = -1
		end

		var_3_6.widgets.btnAttGu:addHandleOfControlEvent(function()
			log.info("btnAttGu")
			var_3_13(arg_3_1.kfzbInfo.competitorId1)
		end, CCControlEventTouchUpInside)
		var_3_6.widgets.btnDefGu:addHandleOfControlEvent(function()
			log.info("btnDefGu")
			var_3_13(arg_3_1.kfzbInfo.competitorId2)
		end, CCControlEventTouchUpInside)

		if arg_3_1.kfzbInfo.supported == 0 then
			log.info("跨服争霸，支持界面")
			var_3_6.widgets.supNum:setVisible(true)
			var_3_6.widgets.supNum:setString(language.get(490051, arg_3_1.kfzbInfo.leftNum))
			var_3_6.widgets.attSupNum:setColor(var_0_2)
			var_3_6.widgets.defSupNum:setColor(var_0_2)
			var_3_6.widgets.attSupNum:setVisible(true)
			var_3_6.widgets.defSupNum:setVisible(true)
			var_3_6.widgets.attSupNum:setString(language.get(490050, arg_3_1.kfzbInfo.sup1))
			var_3_6.widgets.defSupNum:setString(language.get(490050, arg_3_1.kfzbInfo.sup2))
			var_3_6.widgets.btnAttGu:setVisible(true)
			var_3_6.widgets.btnDefGu:setVisible(true)

			if arg_3_1.kfzbInfo.leftNum == 0 then
				var_3_6.widgets.supNum:setString(language.get(490052, arg_3_1.kfzbInfo.buySupGold))
			end
		elseif arg_3_1.kfzbInfo.supported == 1 then
			var_3_6.widgets.attSupTrue:setVisible(true)

			if user.kfzbZone > 0 then
				local var_3_22 = arg_3_1.kfzbInfo.reward

				var_3_6.widgets.rewardIcon:setDisplayFrame(CCSprite:create(kfzbConstant.rewardTypeTable[var_3_22.type].pic):displayFrame())
				var_3_6.widgets.rewardNum:setString(language.get(135039, var_3_22.num))
				var_3_6.widgets.richLine:reorder()
				var_3_6.widgets.richLine:setVisible(true)
			else
				var_3_6.widgets.attSupNum:setColor(var_0_3)
				var_3_6.widgets.attSupNum:setVisible(true)
				var_3_6.widgets.attSupNum:setString(language.get(490053, arg_3_1.kfzbInfo.winTicket))
			end
		elseif arg_3_1.kfzbInfo.supported == 2 then
			var_3_6.widgets.defSupTrue:setVisible(true)

			if user.kfzbZone > 0 then
				local var_3_23 = arg_3_1.kfzbInfo.reward

				var_3_6.widgets.rewardIcon:setDisplayFrame(CCSprite:create(kfzbConstant.rewardTypeTable[var_3_23.type].pic):displayFrame())
				var_3_6.widgets.rewardNum:setString(language.get(135039, var_3_23.num))
				var_3_6.widgets.richLine:reorder()
				var_3_6.widgets.richLine:setVisible(true)
			else
				var_3_6.widgets.defSupNum:setColor(var_0_3)
				var_3_6.widgets.defSupNum:setVisible(true)
				var_3_6.widgets.defSupNum:setString(language.get(490053, arg_3_1.kfzbInfo.winTicket))
			end
		end

		local var_3_24 = arg_3_1.kfzbInfo.p1BuffNum

		var_3_6.widgets.btn_buff1:setVisible(var_3_24 > 0)

		if var_3_24 > 0 then
			var_3_6.widgets.p1BuffNum:setString(var_3_24)
		end

		local var_3_25 = arg_3_1.kfzbInfo.p2BuffNum

		var_3_6.widgets.btn_buff2:setVisible(var_3_25 > 0)

		if var_3_25 > 0 then
			var_3_6.widgets.p2BuffNum:setString(var_3_25)
		end

		var_3_6.widgets.p1NoUseTactic:setVisible(arg_3_1.kfzbInfo.p1NoUseTactic)
		var_3_6.widgets.p2NoUseTactic:setVisible(arg_3_1.kfzbInfo.p2NoUseTactic)
	else
		local function var_3_26()
			local var_29_0 = arg_3_1.kfzbInfo.strataXy == 171
			local var_29_1 = arg_3_1.kfzbInfo.trickState
			local var_29_2 = arg_3_1.kfzbInfo.trickLeftNum
			local var_29_3
			local var_29_4

			if var_29_1 == 0 then
				var_3_6.widgets.saveButton:setPositionY(var_3_19)
			else
				var_3_6.widgets.trickButton:setVisible(true)

				if var_29_1 == 1 then
					var_29_3 = "wgjc_word_03.png"
				elseif var_29_1 == 2 then
					var_29_3 = var_29_0 and "wgjc_word_02.png" or var_29_2 > 0 and "wgjc_word_01.png" or "wgjc_word_04.png"

					var_3_6.widgets.bg_num:setVisible(var_29_2 > 0)

					if var_29_2 > 0 then
						var_3_6.widgets.num:setString(language.get(84008) .. var_29_2)
					end
				end

				if var_29_3 then
					var_3_6.widgets.state:setDisplayFrame(CCSprite:create("res/ui/kfzb/" .. var_29_3):displayFrame())
				end

				var_3_6.widgets.icon:removeAllChildrenWithCleanup(true)

				if var_29_1 == 1 or var_29_1 == 2 and not var_29_0 and var_29_2 == 0 then
					tool.spriteToGray(var_3_6.widgets.icon, true)
					var_3_6.widgets.trickButton:setEnabled(false)
				end
			end
		end

		local function var_3_27()
			local var_30_0 = arg_3_1.kfzbInfo.canGiveway == true
			local var_30_1 = arg_3_1.kfzbInfo.p1GivewayGIds
			local var_30_2 = arg_3_1.kfzbInfo.p2GivewayGIds
			local var_30_3 = arg_3_1.kfzbInfo.p1NoUseTactic
			local var_30_4 = arg_3_1.kfzbInfo.p2NoUseTactic
			local var_30_5 = arg_3_1.kfzbInfo.p1BuffNum
			local var_30_6 = arg_3_1.kfzbInfo.p2BuffNum

			var_3_6.widgets.node_giveWay:setVisible(var_30_0)
			var_3_6.widgets.p1NoUseTactic:setVisible(var_30_3)
			var_3_6.widgets.p2NoUseTactic:setVisible(var_30_4)

			if var_30_0 then
				local var_30_7 = var_30_2
				local var_30_8 = var_30_4

				if arg_3_1.kfzbInfo.isAttacker then
					var_30_7 = var_30_1
					var_30_8 = var_30_3
				end

				local var_30_9
				local var_30_10
				local var_30_11

				if #var_30_7 == 0 then
					var_30_9 = 136433
					var_30_11 = true
				elseif #var_30_7 == 1 then
					var_30_9 = 136434
					var_30_11 = true
				else
					var_30_9 = 136434
					var_30_11 = false
				end

				var_3_6.widgets.txt_giveWay:setString(language.get(var_30_9))
				var_3_6.widgets.btn_giveWay1:setEnabled(var_30_11)
				var_3_6.widgets.btn_giveWay2:setEnabled(not var_30_8)
			end
		end

		var_3_6.widgets.saveButton:addHandleOfControlEvent(var_3_9, CCControlEventTouchUpInside)
		var_3_6.widgets.saveButton:setVisible(true)

		if arg_3_1.kfzbInfo.competitorId1 == 0 or arg_3_1.kfzbInfo.competitorId2 == 0 then
			var_3_6.widgets.passLayer:setVisible(true)
		else
			var_3_6.widgets.trickButton:addHandleOfControlEvent(function()
				log.info("trickButton")

				local function var_31_0(arg_32_0)
					local var_32_0 = arg_32_0.action.data.stratagemGids[1]

					arg_3_1.kfzbInfo.trickState = var_32_0.state
					arg_3_1.kfzbInfo.trickLeftNum = var_32_0.leftNum

					local var_32_1 = arg_3_1.kfzbInfo.strataXy

					arg_3_1.kfzbInfo.strataXy = var_32_1 == 171 and 0 or 171

					var_3_26()
				end

				local var_31_1 = arg_3_1.kfzbInfo.strataXy == 171 and 0 or 1

				cmgr.sendRequest(var_31_0, actions.kfzbUseStratagem, var_31_1)
			end, CCControlEventTouchUpInside)

			local function var_3_28(arg_33_0)
				local var_33_0 = arg_33_0.action.data.stratagemGids[1]

				arg_3_1.kfzbInfo.trickState = var_33_0.state
				arg_3_1.kfzbInfo.trickLeftNum = var_33_0.leftNum

				var_3_26()
			end

			cmgr.sendRequest(var_3_28, actions.kfzbGetStratagems)

			local function var_3_29(arg_34_0, arg_34_1)
				local function var_34_0(arg_35_0)
					local var_35_0 = arg_35_0.action.data

					if arg_34_0 == 1 then
						var_3_7(false, var_3_1[arg_34_1])

						if arg_3_1.kfzbInfo.isAttacker then
							table.insert(arg_3_1.kfzbInfo.p1GivewayGIds, arg_34_1)
						else
							table.insert(arg_3_1.kfzbInfo.p2GivewayGIds, arg_34_1)
						end

						local var_35_1
						local var_35_2

						if var_35_0.givewayNum == 1 then
							var_35_1 = 136434
							var_35_2 = true
						elseif var_35_0.givewayNum == 2 then
							var_35_1 = 136434
							var_35_2 = false
						end

						var_3_6.widgets.txt_giveWay:setString(language.get(var_35_1))
						var_3_6.widgets.btn_giveWay1:setEnabled(var_35_2)
					elseif arg_34_0 == 2 then
						var_3_6.widgets.btn_giveWay2:setEnabled(false)

						if arg_3_1.kfzbInfo.isAttacker then
							var_3_6.widgets.p1NoUseTactic:setVisible(true)
						else
							var_3_6.widgets.p2NoUseTactic:setVisible(true)
						end
					end

					local var_35_3 = CCSprite:create("res/ui/kfzb/kfwdrjgz_word_xczlss.png")

					var_35_3:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
					smgr.showTipSpriteText(var_35_3)
				end

				cmgr.sendRequest(var_34_0, actions.kfzbGiveWay, arg_34_0, arg_34_1)
			end

			var_3_6.widgets.btn_giveWay1:addHandleOfControlEvent(function()
				log.info("btn_giveWay1")

				local var_36_0 = arg_3_1.kfzbInfo.p1GivewayGIds
				local var_36_1 = arg_3_1.kfzbInfo.p2GivewayGIds

				if arg_3_1.kfzbInfo.isAttacker then
					var_36_1 = var_36_0
				end

				local var_36_2
				local var_36_3

				if #var_36_1 == 0 then
					var_36_2 = 136421
					var_36_3 = #var_3_1
				elseif #var_36_1 == 1 then
					var_36_2 = 136435
					var_36_3 = #var_3_1 - 1
				end

				messageBox.confirm(language.get(var_36_2), function()
					var_3_29(1, var_36_3)
				end)
			end, CCControlEventTouchUpInside)
			var_3_6.widgets.btn_giveWay2:addHandleOfControlEvent(function()
				log.info("btn_giveWay2")
				messageBox.confirm(language.get(136422), function()
					var_3_29(2, 0)
				end)
			end, CCControlEventTouchUpInside)
			var_3_27()

			local var_3_30 = arg_3_1.kfzbInfo.p1BuffNum

			var_3_6.widgets.btn_buff1:setVisible(var_3_30 > 0)

			if var_3_30 > 0 then
				var_3_6.widgets.p1BuffNum:setString(var_3_30)
			end

			local var_3_31 = arg_3_1.kfzbInfo.p2BuffNum

			var_3_6.widgets.btn_buff2:setVisible(var_3_31 > 0)

			if var_3_31 > 0 then
				var_3_6.widgets.p2BuffNum:setString(var_3_31)
			end
		end
	end

	local var_3_32
	local var_3_33

	if arg_3_1.kfzbInfo.kfzbState == kfzbState.support then
		var_3_32 = arg_3_1.kfzbInfo.p1gInfo.list

		if arg_3_1.kfzbInfo.p2gInfo then
			var_3_33 = arg_3_1.kfzbInfo.p2gInfo.list
		end

		arg_3_1.kfzbInfo.isAttacker = true
	elseif arg_3_1.kfzbInfo.isAttacker then
		var_3_32 = arg_3_1.kfzbInfo.p1gInfo.list

		if arg_3_1.kfzbInfo.p2gInfo then
			var_3_33 = arg_3_1.kfzbInfo.p2gInfo.list
		end
	else
		var_3_32 = arg_3_1.kfzbInfo.p2gInfo.list

		if arg_3_1.kfzbInfo.p1gInfo then
			var_3_33 = arg_3_1.kfzbInfo.p1gInfo.list
		end
	end

	local function var_3_34(arg_40_0)
		var_3_1, var_3_3 = arg_3_0:createGeneralCard(var_3_0, arg_3_1, arg_3_1.kfzbInfo.isAttacker and "att" or "def", var_3_32)

		if var_3_33 then
			var_3_2 = arg_3_0:createGeneralCard(var_3_0, arg_3_1, arg_3_1.kfzbInfo.isAttacker and "def" or "att", var_3_33)
		end

		if arg_3_1.kfzbInfo.isAttacker then
			for iter_40_0, iter_40_1 in pairs(arg_3_1.kfzbInfo.p1GivewayGIds) do
				var_3_7(false, var_3_1[iter_40_1])
			end

			for iter_40_2, iter_40_3 in pairs(arg_3_1.kfzbInfo.p2GivewayGIds) do
				var_3_7(false, var_3_2[iter_40_3])
			end
		else
			for iter_40_4, iter_40_5 in pairs(arg_3_1.kfzbInfo.p1GivewayGIds) do
				var_3_7(false, var_3_2[iter_40_5])
			end

			for iter_40_6, iter_40_7 in pairs(arg_3_1.kfzbInfo.p2GivewayGIds) do
				var_3_7(false, var_3_1[iter_40_7])
			end
		end

		if arg_40_0 then
			var_3_8()
		end
	end

	local function var_3_35(arg_41_0)
		local var_41_0 = arg_41_0.action.data.military
		local var_41_1 = false
		local var_41_2 = {}

		for iter_41_0, iter_41_1 in pairs(var_41_0) do
			local var_41_3 = {
				armyHp = iter_41_1.forces or 0,
				armyHpMax = iter_41_1.forcesMax or 0,
				generalId = iter_41_1.generalId or 0,
				generalLv = iter_41_1.generalLv or 0,
				generalName = iter_41_1.generalName or "",
				generalPic = iter_41_1.pic or nil,
				index = iter_41_0,
				quality = iter_41_1.quality,
				tacticName = iter_41_1.tacName,
				troopId = iter_41_1.troopId,
				troopType = iter_41_1.troopType
			}

			table.insert(var_41_2, var_41_3)
		end

		if not var_3_32 or #var_3_32 == 0 or #var_41_2 ~= #var_3_32 then
			var_3_32 = var_41_2
			var_41_1 = true
		else
			for iter_41_2, iter_41_3 in pairs(var_41_2) do
				local var_41_4 = true

				for iter_41_4, iter_41_5 in pairs(var_3_32) do
					if iter_41_5.generalId == iter_41_3.generalId then
						var_41_4 = false

						break
					end
				end

				if var_41_4 then
					var_3_32 = var_41_2
					var_41_1 = true

					break
				end
			end
		end

		var_3_34(var_41_1)
	end

	if arg_3_1.kfzbInfo.kfzbState == kfzbState.support then
		var_3_34(false)

		local function var_3_36(arg_42_0)
			log.info("添加玩家赢的次数")

			local var_42_0 = 155
			local var_42_1 = visibleSize.width * 0.5 - var_42_0 * 2.5 - 60
			local var_42_2 = (arg_42_0 == 1 and visibleSize.height * 0.75 or visibleSize.height * 0.25) + 30
			local var_42_3 = CCNode:create()

			var_42_3:setAnchorPoint(ccp(0.5, 0.5))

			local var_42_4 = CCLabelAtlas:create(tostring(arg_3_1.kfzbInfo["win" .. arg_42_0]), "res/ui/common/number/Num_fightJiebingAddExp.png", 27, 41, 48)
			local var_42_5 = CCSprite:create("res/ui/kfzb/kfzbs_zdzb_sheng1.png")

			var_42_3:addChild(var_42_4)
			var_42_3:addChild(var_42_5)
			var_42_4:setAnchorPoint(ccp(0.5, 0.5))
			var_42_5:setAnchorPoint(ccp(0.5, 0.5))
			var_42_4:setPosition(ccp(0, 20))
			var_42_5:setPosition(ccp(0, -20))
			var_42_3:setPosition(ccp(var_42_1, var_42_2))
			var_3_6.widgets.supUiNode:addChild(var_42_3)
		end

		local function var_3_37(arg_43_0)
			local var_43_0 = 0

			if arg_43_0 == 1 then
				var_43_0 = 5
			elseif arg_43_0 == 2 then
				var_43_0 = 10
			elseif arg_43_0 == 3 then
				var_43_0 = 15
			elseif arg_43_0 > 3 then
				var_43_0 = 20
			end

			return var_43_0
		end

		var_3_36(1)
		var_3_36(2)

		local var_3_38 = math.abs(arg_3_1.kfzbInfo.win2 - arg_3_1.kfzbInfo.win1)

		if arg_3_1.kfzbInfo.win1 < arg_3_1.kfzbInfo.win2 then
			var_3_6.widgets.attGfLb:setString(language.get(490056, var_3_37(var_3_38)))
		elseif arg_3_1.kfzbInfo.win2 < arg_3_1.kfzbInfo.win1 then
			var_3_6.widgets.defGfLb:setString(language.get(490056, var_3_37(var_3_38)))
		end
	elseif var_3_5 > 20 then
		cmgr.sendRequest(var_3_35, actions.generalSimpleInfo)

		local function var_3_39()
			var_3_6.widgets.saveButton:setVisible(false)
		end

		performWithDelay(var_3_6.widgets.saveButton, var_3_39, var_3_5 - 21)
	else
		var_3_34(false)
		var_3_6.widgets.saveButton:setVisible(false)
	end

	local var_3_40 = arg_3_1.kfzbInfo.p1Info

	if var_3_40 then
		local var_3_41 = language.get(390408, var_3_40.serverName, var_3_40.serverId, var_3_40.playerName, var_3_40.playerLevel)

		var_3_6.widgets.playerInfoLabelAtt:setString(var_3_41)
		var_3_6.widgets.playerInfoLabelAtt:setVisible(true)
	end

	local var_3_42 = arg_3_1.kfzbInfo.p2Info

	if var_3_42 then
		local var_3_43 = language.get(390408, var_3_42.serverName, var_3_42.serverId, var_3_42.playerName, var_3_42.playerLevel)

		var_3_6.widgets.playerInfoLabelDef:setString(var_3_43)
		var_3_6.widgets.playerInfoLabelDef:setVisible(true)
	end

	local var_3_44
	local var_3_45 = CCDirector:sharedDirector():getScheduler()
	local var_3_46
	local var_3_47
	local var_3_48 = {
		x = 0,
		y = 0
	}
	local var_3_49 = {
		x = 0,
		y = 0
	}
	local var_3_50 = {
		x = 0,
		y = 0
	}

	local function var_3_51(arg_45_0)
		local var_45_0 = arg_45_0.widgets.cardSprite:getPositionX()
		local var_45_1 = 67
		local var_45_2
		local var_45_3
		local var_45_4

		for iter_45_0, iter_45_1 in pairs(var_3_1) do
			local var_45_5 = iter_45_1.widgets.cardSprite
			local var_45_6 = math.abs(var_45_0 - var_45_5:getPositionX())

			log.info("@@@ check offset ", var_45_6)

			if arg_45_0 ~= iter_45_1 then
				if not var_45_4 then
					var_45_4 = var_45_6
					var_45_3 = iter_45_0
				elseif var_45_6 < var_45_4 then
					var_45_4 = var_45_6
					var_45_3 = iter_45_0
				end
			else
				var_45_2 = iter_45_0
			end
		end

		if var_45_3 then
			local var_45_7 = var_0_4[var_3_4][var_45_3]
			local var_45_8 = var_3_1[var_45_3]

			var_45_8.widgets.cardSprite:runAction(CCMoveTo:create(0.3, var_3_47))
			arg_45_0.widgets.cardSprite:runAction(CCMoveTo:create(0.3, var_45_7))

			local var_45_9 = arg_45_0.widgets.attIndexNum
			local var_45_10 = var_45_8.widgets.attIndexNum

			if not arg_3_1.kfzbInfo.isAttacker then
				var_45_9 = arg_45_0.widgets.defIndexNum
				var_45_10 = var_45_8.widgets.defIndexNum
			end

			local var_45_11 = var_45_10:getString()

			var_45_10:setString(var_45_9:getString())
			var_45_9:setString(var_45_11)

			local var_45_12 = arg_45_0.widgets.headPic
			local var_45_13 = var_45_8.widgets.headPic
			local var_45_14 = var_45_12:getChildren()
			local var_45_15 = var_45_13:getChildren()
			local var_45_16 = var_45_14 ~= nil and var_45_14.count ~= nil and var_45_14:count() > 0
			local var_45_17 = var_45_15 ~= nil and var_45_15.count ~= nil and var_45_15:count() > 0

			if not var_45_16 and var_45_17 then
				var_3_7(false, arg_45_0)
				var_3_7(true, var_45_8, var_3_3[var_45_3])
			elseif var_45_16 and not var_45_17 then
				var_3_7(true, arg_45_0, var_3_3[var_45_2])
				var_3_7(false, var_45_8)
			end

			var_3_1[var_45_3] = arg_45_0
			var_3_1[var_45_2] = var_45_8
			var_3_3[var_45_3], var_3_3[var_45_2] = var_3_3[var_45_2], var_3_3[var_45_3]
		else
			arg_45_0.widgets.cardSprite:runAction(CCMoveTo:create(0.3, var_3_47))
		end

		return var_45_3
	end

	local function var_3_52()
		if var_3_46 then
			var_3_46.widgets.selectedSprite:setVisible(false)
			var_3_51(var_3_46)

			var_3_46 = nil
			var_3_47 = nil
		end
	end

	local function var_3_53(arg_47_0)
		var_3_52()

		var_3_46 = arg_47_0

		if var_3_46 then
			var_3_46.widgets.selectedSprite:setVisible(true)
			var_3_0:reorderChild(var_3_46.widgets.cardSprite, 10)
		end
	end

	local function var_3_54(arg_48_0, arg_48_1)
		for iter_48_0, iter_48_1 in pairs(var_3_1) do
			local var_48_0 = iter_48_1.widgets.cardSprite

			if tool.checkIfTouch(var_48_0, arg_48_0, arg_48_1) then
				var_3_47 = var_0_4[var_3_4][iter_48_0]

				iter_48_1.widgets.selectedSprite:setVisible(true)
				var_3_53(iter_48_1)

				break
			end
		end
	end

	local function var_3_55(arg_49_0, arg_49_1)
		local var_49_0 = arg_49_0 - var_3_50.x

		var_3_50.x = arg_49_0
		var_3_50.y = arg_49_1

		if var_3_46 and var_49_0 ~= 0 and math.abs(var_3_48.x - var_3_50.x) > 50 then
			local var_49_1 = var_3_46.widgets.cardSprite
			local var_49_2 = var_49_1:getPositionX()
			local var_49_3 = var_49_1:getPositionY()
			local var_49_4 = var_49_2 + var_49_0

			var_49_1:setPosition(ccp(var_49_4, var_49_3))
		end
	end

	local function var_3_56(arg_50_0, arg_50_1, arg_50_2)
		if arg_50_0 == CCTOUCHBEGAN then
			var_3_48.x = arg_50_1
			var_3_48.y = arg_50_2
			var_3_50.x = arg_50_1
			var_3_50.y = arg_50_2

			var_3_54(arg_50_1, arg_50_2)
		elseif arg_50_0 == CCTOUCHMOVED then
			var_3_55(arg_50_1, arg_50_2)
		elseif arg_50_0 == CCTOUCHENDED then
			var_3_52()
		end

		return true
	end

	if arg_3_1.kfzbInfo.kfzbState == kfzbState.support then
		var_3_0:setTouchEnabled(false)
	else
		var_3_0:registerScriptTouchHandler(var_3_56)
		var_3_0:setTouchEnabled(true)
	end

	local function var_3_57(arg_51_0)
		local var_51_0 = arg_51_0.data.info

		if var_51_0 then
			if var_51_0.givewayNum == 1 then
				messageBox.alert("", language.get(136429))
				var_3_7(false, var_3_2[#var_3_2])
			end

			if var_51_0.givewayNum == 2 then
				messageBox.alert("", language.get(136432))
				var_3_7(false, var_3_2[#var_3_2])
				var_3_7(false, var_3_2[#var_3_2 - 1])
			end

			if var_51_0.noUseTactic == 1 then
				messageBox.alert("", language.get(136430))

				if arg_3_1.kfzbInfo.isAttacker then
					var_3_6.widgets.p2NoUseTactic:setVisible(true)
				else
					var_3_6.widgets.p1NoUseTactic:setVisible(true)
				end
			end
		end
	end

	function var_3_0.onEnter(arg_52_0)
		kfcmgr.registerResponseHandler(actions.pushKfzbGiveway, var_3_57)
	end

	function var_3_0.onExit(arg_53_0)
		kfcmgr.unregisterResponseHandler(actions.pushKfzbGiveway, var_3_57)
	end

	arg_3_1.layerTabel.prepareLayer:addChild(var_3_0)
end

return var_0_5
