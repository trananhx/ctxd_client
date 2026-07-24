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
					x = 531,
					style = "label_yellowish_24",
					color = colorQuality[1],
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					y = 60,
					x = 471,
					type = "sprite",
					scale = 0.7,
					pic = {
						path = "res/ui/playerInfo/role_nation_view.png"
					}
				},
				{
					fontSize = 32,
					name = "name1",
					y = 60,
					type = "label",
					x = 471
				},
				{
					y = 60,
					x = 591,
					type = "sprite",
					scale = 0.7,
					pic = {
						path = "res/ui/playerInfo/role_nation_view.png"
					}
				},
				{
					fontSize = 32,
					name = "name2",
					y = 60,
					type = "label",
					x = 591
				},
				{
					y = 60,
					name = "node_player",
					x = 531,
					type = "node"
				}
			}
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
			x = visibleSize.width - 100,
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
			zorder = 1,
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
		},
		{
			type = "sprite",
			name = "lock",
			x = 30,
			visible = false,
			y = 90,
			pic = {
				path = "res/ui/nationTask/arena/ltzbs_zdzb_lock.png"
			}
		}
	}
}
local var_0_8 = {
	y = 0,
	name = "node",
	type = "node",
	x = 0,
	children = {
		{
			zoomOnTouchDown = true,
			name = "btn",
			h = 50,
			type = "button",
			w = 50,
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
					x = 25,
					name = "bg",
					y = 25,
					type = "sprite",
					scale = 0.5,
					pic = {
						path = "res/ui/selectPlayer/vip_port_view.jpg"
					},
					children = {
						{
							y = 50,
							name = "head",
							type = "sprite",
							x = 50,
							pic = {
								path = "res/ui/common/playerHead/playerHead_icon_0.png"
							}
						}
					}
				},
				{
					height = 46,
					name = "out",
					x = 2,
					type = "layerColor",
					y = 2,
					width = 46,
					visible = false,
					color = ccc4(0, 0, 0, 180)
				}
			}
		},
		{
			fontSize = 20,
			name = "name",
			y = -35,
			type = "label",
			x = 0,
			color = var_0_1
		}
	}
}
local var_0_9 = {
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
			width = 0,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = color_whi
		}
	}
}

local function var_0_10(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_1.widgets.headPic
	local var_2_1 = arg_2_1.widgets.headPicBg
	local var_2_2 = arg_2_1.widgets.generalName
	local var_2_3 = arg_2_1.widgets.cardSprite
	local var_2_4 = var_2_0:getChildren()
	local var_2_5 = var_2_4 ~= nil and var_2_4.count ~= nil and var_2_4:count() > 0

	if arg_2_0 then
		if var_2_5 and arg_2_2 then
			arg_2_2.quality = arg_2_2.quality or 1

			var_2_0:removeAllChildrenWithCleanup(true)
			var_2_1:setDisplayFrame(CCSprite:createWithSpriteFrameName(var_0_0(arg_2_2.quality)):displayFrame())
			var_2_2:setColor(colorQuality[arg_2_2.quality])
			var_2_3:setDisplayFrame(CCSprite:createWithSpriteFrameName("battle_pre_gen_list_view_bg.png"):displayFrame())
		end
	elseif not var_2_5 then
		tool.spriteToGray(var_2_0)
		var_2_1:setDisplayFrame(CCSprite:createWithSpriteFrameName("battle_pre_gen_qual_gray.png"):displayFrame())
		var_2_2:setColor(colorQuality[0])
		var_2_3:setDisplayFrame(CCSprite:createWithSpriteFrameName("battle_pre_gen_list_view_gray.png"):displayFrame())
	end
end

function var_0_5.createGeneralCard(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	local var_3_0 = 155
	local var_3_1 = visibleSize.width * 0.5 + var_3_0 * 1.5
	local var_3_2 = visibleSize.height * 0.75 + 16

	if arg_3_3 == "def" then
		var_3_2 = visibleSize.height * 0.25 - 16
	end

	local var_3_3 = {}
	local var_3_4 = {}

	var_0_4[arg_3_3] = {}

	for iter_3_0, iter_3_1 in pairs(arg_3_4) do
		var_0_4[arg_3_3][iter_3_0] = ccp(var_3_1, var_3_2)

		local var_3_5 = {}

		uiutil.initWidgets(var_3_5, var_0_7)
		var_3_5.widgets.cardSprite:setPosition(ccp(var_3_1, var_3_2))
		arg_3_1:addChild(var_3_5.widgets.cardSprite)
		var_3_5.widgets.generalName:setString(tostring(iter_3_1.generalName))

		iter_3_1.quality = iter_3_1.quality or 1

		var_3_5.widgets.generalName:setColor(colorQuality[iter_3_1.quality])

		local var_3_6 = string.format("res/ui/common/generalHead/generalHead_%s.png", iter_3_1.generalPic)

		var_3_5.widgets.headPic:setDisplayFrame(CCSprite:create(var_3_6):displayFrame())
		var_3_5.widgets.headPicBg:setDisplayFrame(CCSprite:createWithSpriteFrameName(var_0_0(iter_3_1.quality)):displayFrame())

		if iter_3_1.tacticName and type(iter_3_1.tacticName) == "string" then
			var_3_5.widgets.skillName:setString(iter_3_1.tacticName)
		end

		var_3_5.widgets.lv:setString(string.format("Lv%s", iter_3_1.generalLv))
		var_3_5.widgets.hpNum:setString(tostring(iter_3_1.armyHp))

		if iter_3_1.armyHp <= 0 then
			var_0_10(false, var_3_5)
		end

		if iter_3_1.troopType > 9 then
			iter_3_1.troopType = 9
		end

		local var_3_7 = string.format("troop_%d.png", iter_3_1.troopType)
		local var_3_8 = CCSprite:createWithSpriteFrameName(var_3_7)

		var_3_8:setScale(0.85)
		var_3_8:setPosition(ccp(19, 19))
		var_3_5.widgets.cardSprite:addChild(var_3_8)
		log.info("@@ general index ", iter_3_1.index)

		if arg_3_3 == "att" then
			var_3_5.widgets.attIndexNum:setVisible(true)
			var_3_5.widgets.attIndexNum:setString(string.format("%d", iter_3_0))
		else
			var_3_5.widgets.defIndexNum:setVisible(true)
			var_3_5.widgets.defIndexNum:setString(string.format("%d", iter_3_0))
		end

		if iter_3_1.armyHp and iter_3_1.armyHpMax then
			local var_3_9 = "battle_pre_gen_blood_con.png"

			if iter_3_1.armyHp == iter_3_1.armyHpMax then
				var_3_9 = arg_3_3 == "att" and "battle_pre_gen_blood_full.png" or "battle_pre_gen_blood_full_red.png"
			end

			local var_3_10 = CCSprite:createWithSpriteFrameName(var_3_9)
			local var_3_11 = CCProgressTimer:create(var_3_10)

			var_3_11:setType(kCCProgressTimerTypeBar)
			var_3_11:setMidpoint(CCPointMake(0, 0.5))
			var_3_11:setBarChangeRate(CCPointMake(1, 0))
			var_3_11:setAnchorPoint(ccp(0.5, 0.5))
			var_3_11:setPercentage(iter_3_1.armyHp / iter_3_1.armyHpMax * 100)
			var_3_11:setPosition(ccp(84, 18))
			var_3_5.widgets.cardSprite:addChild(var_3_11)
		end

		if arg_3_3 == "att" then
			var_3_5.widgets.lock:setVisible(arg_3_2.attTeam.isLocked == true)
		else
			var_3_5.widgets.lock:setVisible(arg_3_2.defTeam.isLocked == true)
		end

		var_3_3[iter_3_0] = var_3_5
		var_3_4[iter_3_0] = iter_3_1
		var_3_1 = var_3_1 - var_3_0
	end

	return var_3_3, var_3_4
end

function var_0_5.create(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if arg_4_1.colosseumFinish == true then
		smgr.changeScene(SCENE_MAIN_CITY)

		return
	end

	rmgr.loadResource("res/ui/battle/kfwd/kfwd.plist")
	rmgr.loadResource("res/ui/battle/battlePrepare/battlePrepare.plist")
	rmgr.loadResource("res/ui/battle/buff/buff.plist")

	local var_4_0 = createBaseLayer()
	local var_4_1
	local var_4_2
	local var_4_3
	local var_4_4 = arg_4_1.ownSide == 1 or arg_4_1.ownSide == 0
	local var_4_5 = var_4_4 and "att" or "def"
	local var_4_6 = {}

	uiutil.initLayout(var_4_6, var_0_6)

	local function var_4_7()
		if var_4_3 then
			local var_5_0 = ""

			for iter_5_0, iter_5_1 in pairs(var_4_3) do
				var_5_0 = var_5_0 .. tostring(iter_5_1.generalId) .. "#"
			end

			cmgr.sendRequest(function()
				log.info("@@ 完成同步")
			end, actions.colosseumSaveGids, var_5_0)
		end
	end

	local function var_4_8()
		do return end

		arg_4_1.layerTabel.prepareLayer:removeChild(var_4_0, true)
		arg_4_1.layerTabel.prepareLayer:removeAllChildrenWithCleanup(true)
		arg_4_1.layerTabel.uiLayer:removeChild(var_4_6.widgets.panel, true)
		arg_4_1.layerTabel.uiLayer:removeChild(var_4_6.widgets.trickButton, true)
		arg_4_1.layerTabel.uiLayer:removeChild(var_4_6.widgets.attPlayer, true)
		arg_4_1.layerTabel.uiLayer:removeChild(var_4_6.widgets.defPlayer, true)
		log.info("@@ ltzbPrepare.lua,擂台争霸")
	end

	var_4_6.widgets.matchLabel:setString(terrainType[arg_4_1.terrain])

	local var_4_9 = createTimerLabel(arg_4_1.autoCd, "@M:@S", "Thonburi", 32, var_4_8, nil, nil, colorTips.red)

	var_4_9:setPosition(ccp(531, 60))
	var_4_6.widgets.panel:addChild(var_4_9)

	local var_4_10

	if arg_4_1.ownSide == 1 then
		var_4_10 = visibleSize.height * 0.75
	elseif arg_4_1.ownSide == 2 then
		var_4_10 = visibleSize.height * 0.25
	end

	if var_4_10 then
		var_4_6.widgets.trickButton:setPositionY(var_4_10)
	end

	local function var_4_11(arg_8_0, arg_8_1)
		log.info("should show tips ")

		local var_8_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

		var_8_0:registerScriptTouchHandler(function(arg_9_0, arg_9_1, arg_9_2)
			if arg_9_0 == CCTOUCHBEGAN then
				return true
			elseif arg_9_0 == CCTOUCHMOVED then
				return true
			elseif arg_9_0 == CCTOUCHENDED then
				pcall(var_8_0.removeFromParentAndCleanup, var_8_0, true)

				return true
			end
		end, false, true)
		var_8_0:setTouchEnabled(true)
		smgr.rootLayer:addChild(var_8_0, 60000)

		local var_8_1 = 0
		local var_8_2 = 0
		local var_8_3 = {}

		uiutil.initWidgets(var_8_3, var_0_9)
		var_8_0:addChild(var_8_3.widgets.tipFrame)

		local var_8_4, var_8_5 = tool.getPositionInScreen(arg_8_0)
		local var_8_6 = var_8_4
		local var_8_7 = var_8_5

		var_8_3.widgets.tipMsg:setString(arg_8_1)

		local var_8_8 = var_8_3.widgets.tipMsg:getContentSize().width
		local var_8_9 = var_8_3.widgets.tipMsg:getContentSize().height

		var_8_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_8_8 + 30, var_8_9 + 30))
		var_8_3.widgets.tipFrame:setPosition(ccp(var_8_6, var_8_7))
		var_8_3.widgets.tipMsg:setPosition(ccp(15, 15))
		var_8_3.widgets.tipFrame:setVisible(true)
	end

	var_4_6.widgets.node_player:removeAllChildrenWithCleanup(true)
	var_4_6.widgets.name1:setString(arg_4_1.attTeam.forceName)
	var_4_6.widgets.name1:setColor(colorForce[arg_4_1.attTeam.forceId])
	var_4_6.widgets.name2:setString(arg_4_1.defTeam.forceName)
	var_4_6.widgets.name2:setColor(colorForce[arg_4_1.defTeam.forceId])

	for iter_4_0 = 1, 2 do
		local var_4_12 = iter_4_0 == 1 and arg_4_1.attTeam.list or arg_4_1.defTeam.list
		local var_4_13 = {}

		for iter_4_1, iter_4_2 in ipairs(var_4_12) do
			local var_4_14 = iter_4_1

			if iter_4_2.out == true then
				var_4_14 = 10 - iter_4_1
			end

			iter_4_2.idx = var_4_14

			table.insert(var_4_13, iter_4_2)
		end

		table.sort(var_4_13, function(arg_10_0, arg_10_1)
			return arg_10_0.idx < arg_10_1.idx
		end)

		for iter_4_3 = 1, 5 do
			local var_4_15 = {}

			uiutil.initWidgets(var_4_15, var_0_8)

			local var_4_16

			if iter_4_0 == 1 then
				var_4_16 = -140 + -60 * (iter_4_3 - 1)
			else
				var_4_16 = 140 + 60 * (iter_4_3 - 1)
			end

			var_4_15.widgets.node:setPosition(var_4_16, 0)
			var_4_6.widgets.node_player:addChild(var_4_15.widgets.node)

			local var_4_17 = var_4_13[iter_4_3]

			if var_4_17 then
				if iter_4_3 == 1 then
					var_4_15.widgets.name:setString(var_4_17.name)
				end

				var_4_15.widgets.head:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerHead/playerHead_icon_%s.png", var_4_17.pic)):displayFrame())
				var_4_15.widgets.out:setVisible(var_4_17.out == true)
				var_4_15.widgets.btn:addHandleOfControlEvent(function()
					log.info("btn")

					local var_11_0 = var_4_15.widgets.btn
					local var_11_1 = var_4_17.name

					var_4_11(var_11_0, var_11_1)
				end, CCControlEventTouchUpInside)
			end
		end
	end

	local function var_4_18()
		if arg_4_1.ownSide == 1 or arg_4_1.ownSide == 2 then
			local var_12_0 = arg_4_1.ownSide == 1 and arg_4_1.attTeam or arg_4_1.defTeam
			local var_12_1 = var_12_0.civilTimes
			local var_12_2

			var_4_6.widgets.trickButton:setVisible(var_12_1 > 0)

			if var_12_1 > 0 then
				var_12_2 = var_12_0.civilActivated == true and "wgjc_word_02.png" or "wgjc_word_01.png"

				var_4_6.widgets.bg_num:setVisible(var_12_1 > 0)
				var_4_6.widgets.num:setString(language.get(84008) .. var_12_1)
			end

			if var_12_2 then
				var_4_6.widgets.state:setDisplayFrame(CCSprite:create("res/ui/kfzb/" .. var_12_2):displayFrame())
			end

			var_4_6.widgets.icon:removeAllChildrenWithCleanup(true)
		end
	end

	var_4_6.widgets.trickButton:addHandleOfControlEvent(function()
		log.info("trickButton")

		local function var_13_0(arg_14_0)
			if arg_4_1.ownSide == 1 or arg_4_1.ownSide == 2 then
				local var_14_0 = arg_4_1.ownSide == 1 and arg_4_1.attTeam or arg_4_1.defTeam

				var_14_0.civilActivated = not var_14_0.civilActivated

				var_4_18()
			end
		end

		cmgr.sendRequest(var_13_0, actions.colosseumActCivil)
	end, CCControlEventTouchUpInside)
	var_4_18()

	local var_4_19
	local var_4_20

	local function var_4_21(arg_15_0)
		var_4_1, var_4_3 = arg_4_0:createGeneralCard(var_4_0, arg_4_1, var_4_4 and "att" or "def", var_4_19)

		if var_4_20 then
			var_4_2 = arg_4_0:createGeneralCard(var_4_0, arg_4_1, var_4_4 and "def" or "att", var_4_20)
		end

		if arg_15_0 then
			var_4_7()
		end
	end

	if arg_4_1.ownSide == 1 then
		var_4_19 = arg_4_2
		var_4_20 = arg_4_3
	elseif arg_4_1.ownSide == 2 then
		var_4_19 = arg_4_3
		var_4_20 = arg_4_2
	else
		var_4_19 = arg_4_2
		var_4_20 = arg_4_3
	end

	var_4_21(true)

	local var_4_22
	local var_4_23 = CCDirector:sharedDirector():getScheduler()
	local var_4_24
	local var_4_25
	local var_4_26 = {
		x = 0,
		y = 0
	}
	local var_4_27 = {
		x = 0,
		y = 0
	}
	local var_4_28 = {
		x = 0,
		y = 0
	}

	local function var_4_29(arg_16_0)
		local var_16_0 = arg_16_0.widgets.cardSprite:getPositionX()
		local var_16_1 = 67
		local var_16_2
		local var_16_3
		local var_16_4

		for iter_16_0, iter_16_1 in pairs(var_4_1) do
			local var_16_5 = iter_16_1.widgets.cardSprite
			local var_16_6 = math.abs(var_16_0 - var_16_5:getPositionX())

			log.info("@@@ check offset ", var_16_6)

			if arg_16_0 ~= iter_16_1 then
				if not var_16_4 then
					var_16_4 = var_16_6
					var_16_3 = iter_16_0
				elseif var_16_6 < var_16_4 then
					var_16_4 = var_16_6
					var_16_3 = iter_16_0
				end
			else
				var_16_2 = iter_16_0
			end
		end

		if var_16_3 then
			local var_16_7 = var_0_4[var_4_5][var_16_3]
			local var_16_8 = var_4_1[var_16_3]

			var_16_8.widgets.cardSprite:runAction(CCMoveTo:create(0.3, var_4_25))

			local var_16_9 = CCArray:create()

			var_16_9:addObject(CCMoveTo:create(0.3, var_16_7))
			var_16_9:addObject(CCCallFunc:create(var_4_7))

			local var_16_10 = CCSequence:create(var_16_9)

			arg_16_0.widgets.cardSprite:runAction(var_16_10)

			local var_16_11 = arg_16_0.widgets.attIndexNum
			local var_16_12 = var_16_8.widgets.attIndexNum

			if not var_4_4 then
				var_16_11 = arg_16_0.widgets.defIndexNum
				var_16_12 = var_16_8.widgets.defIndexNum
			end

			local var_16_13 = var_16_12:getString()

			var_16_12:setString(var_16_11:getString())
			var_16_11:setString(var_16_13)

			var_4_1[var_16_3] = arg_16_0
			var_4_1[var_16_2] = var_16_8
			var_4_3[var_16_3], var_4_3[var_16_2] = var_4_3[var_16_2], var_4_3[var_16_3]
		else
			local var_16_14 = CCArray:create()

			var_16_14:addObject(CCMoveTo:create(0.3, var_4_25))
			var_16_14:addObject(CCCallFunc:create(var_4_7))

			local var_16_15 = CCSequence:create(var_16_14)

			arg_16_0.widgets.cardSprite:runAction(var_16_15)
		end

		return var_16_3
	end

	local function var_4_30()
		if var_4_24 then
			var_4_24.widgets.selectedSprite:setVisible(false)
			var_4_29(var_4_24)

			var_4_24 = nil
			var_4_25 = nil
		end
	end

	local function var_4_31(arg_18_0)
		var_4_30()

		var_4_24 = arg_18_0

		if var_4_24 then
			var_4_24.widgets.selectedSprite:setVisible(true)
			var_4_0:reorderChild(var_4_24.widgets.cardSprite, 10)
		end
	end

	local function var_4_32(arg_19_0, arg_19_1)
		for iter_19_0, iter_19_1 in pairs(var_4_1) do
			local var_19_0 = iter_19_1.widgets.cardSprite

			if tool.checkIfTouch(var_19_0, arg_19_0, arg_19_1) then
				var_4_25 = var_0_4[var_4_5][iter_19_0]

				iter_19_1.widgets.selectedSprite:setVisible(true)
				var_4_31(iter_19_1)

				break
			end
		end
	end

	local function var_4_33(arg_20_0, arg_20_1)
		local var_20_0 = arg_20_0 - var_4_28.x

		var_4_28.x = arg_20_0
		var_4_28.y = arg_20_1

		if var_4_24 and var_20_0 ~= 0 and math.abs(var_4_26.x - var_4_28.x) > 50 then
			local var_20_1 = var_4_24.widgets.cardSprite
			local var_20_2 = var_20_1:getPositionX()
			local var_20_3 = var_20_1:getPositionY()
			local var_20_4 = var_20_2 + var_20_0

			var_20_1:setPosition(ccp(var_20_4, var_20_3))
		end
	end

	local function var_4_34(arg_21_0, arg_21_1, arg_21_2)
		if arg_21_0 == CCTOUCHBEGAN then
			var_4_26.x = arg_21_1
			var_4_26.y = arg_21_2
			var_4_28.x = arg_21_1
			var_4_28.y = arg_21_2

			var_4_32(arg_21_1, arg_21_2)
		elseif arg_21_0 == CCTOUCHMOVED then
			var_4_33(arg_21_1, arg_21_2)
		elseif arg_21_0 == CCTOUCHENDED then
			var_4_30()
		end

		return true
	end

	if arg_4_1.ownSide == 0 or arg_4_1.ownSide == 1 and arg_4_1.attTeam.isLocked == true or arg_4_1.ownSide == 2 and arg_4_1.defTeam.isLocked == true then
		var_4_0:setTouchEnabled(false)
	else
		var_4_0:registerScriptTouchHandler(var_4_34)
		var_4_0:setTouchEnabled(true)
	end

	local function var_4_35(arg_22_0)
		local var_22_0 = arg_22_0.action.data.colosseum

		if var_22_0 and (var_22_0.formChange ~= true or true) and var_22_0.batId then
			smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_LTZB, {
				terrain = 0,
				generalId = 0,
				prepare = true,
				target = arg_4_1.targetId
			})
		end
	end

	function var_4_0.onEnter(arg_23_0)
		cmgr.registerResponseHandler(actions.pushColosseum, var_4_35)
	end

	function var_4_0.onExit(arg_24_0)
		cmgr.unregisterResponseHandler(actions.pushColosseum, var_4_35)
	end

	arg_4_1.layerTabel.prepareLayer:addChild(var_4_0)
end

return var_0_5
