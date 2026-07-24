local var_0_0 = {
	att = {},
	def = {}
}
local var_0_1 = {}
local var_0_2 = 1
local var_0_3 = {
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
			y = visibleSize.height * 0.5,
			children = {
				{
					text = "",
					name = "matchLabel",
					y = 25,
					type = "label",
					style = "label_yellowish_24",
					x = 531,
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
			normal = {
				frame = true,
				path = "btn_xflts_bczx_a.png"
			},
			touched = {
				frame = true,
				path = "btn_xflts_bczx_c.png"
			},
			x = visibleSize.width - 110,
			y = visibleSize.height - 150
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
			x = 0,
			name = "attPlayer",
			y = 0,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/common/text/battle/fight_info_att.png"
			}
		},
		{
			x = 0,
			name = "defPlayer",
			y = 0,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/common/text/battle/fight_info_def.png"
			}
		}
	}
}
local var_0_4 = {
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

function var_0_1.createGeneralCard(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	local var_1_0 = 155
	local var_1_1 = visibleSize.width * 0.5 + var_1_0 * 1.5
	local var_1_2 = visibleSize.height * 0.75

	if arg_1_3 == "def" then
		var_1_2 = visibleSize.height * 0.25
	end

	local var_1_3 = {}
	local var_1_4 = {}

	var_0_0[arg_1_3] = {}

	for iter_1_0, iter_1_1 in pairs(arg_1_4) do
		var_0_0[arg_1_3][iter_1_0] = ccp(var_1_1, var_1_2)

		local var_1_5 = {}

		uiutil.initWidgets(var_1_5, var_0_4)
		var_1_5.widgets.cardSprite:setPosition(ccp(var_1_1, var_1_2))
		arg_1_1:addChild(var_1_5.widgets.cardSprite)
		var_1_5.widgets.generalName:setString(tostring(iter_1_1.generalName))

		iter_1_1.quality = iter_1_1.quality or 1

		var_1_5.widgets.generalName:setColor(colorQuality[iter_1_1.quality])

		local var_1_6 = string.format("res/ui/common/generalHead/generalHead_%s.png", iter_1_1.generalPic)
		local var_1_7 = CCSprite:create(var_1_6)

		var_1_7:setPosition(ccp(60, 44))

		local var_1_8 = "battle_pre_gen_qual_white.png"

		if iter_1_1.quality == 2 then
			var_1_8 = "battle_pre_gen_qual_blue.png"
		elseif iter_1_1.quality == 3 then
			var_1_8 = "battle_pre_gen_qual_green.png"
		elseif iter_1_1.quality == 4 then
			var_1_8 = "battle_pre_gen_qual_yellow.png"
		elseif iter_1_1.quality == 5 then
			var_1_8 = "battle_pre_gen_qual_red.png"
		elseif iter_1_1.quality == 6 then
			var_1_8 = "battle_pre_gen_qual_purple.png"
		end

		local var_1_9 = CCSprite:createWithSpriteFrameName(var_1_8)

		var_1_9:setPosition(ccp(67, 120))
		var_1_9:addChild(var_1_7)
		var_1_5.widgets.cardSprite:addChild(var_1_9)

		if iter_1_1.tacticName then
			var_1_5.widgets.skillName:setString(iter_1_1.tacticName)
		end

		var_1_5.widgets.lv:setString(string.format("Lv%s", iter_1_1.generalLv))
		var_1_5.widgets.hpNum:setString(tostring(iter_1_1.armyHpMax))

		if iter_1_1.troopType > 9 then
			iter_1_1.troopType = 9
		end

		local var_1_10 = string.format("troop_%d.png", iter_1_1.troopType)
		local var_1_11 = CCSprite:createWithSpriteFrameName(var_1_10)

		var_1_11:setScale(0.85)
		var_1_11:setPosition(ccp(19, 19))
		var_1_5.widgets.cardSprite:addChild(var_1_11)
		log.info("@@ general index ", iter_1_1.index)

		if arg_1_3 == "att" then
			var_1_5.widgets.attIndexNum:setVisible(true)
			var_1_5.widgets.attIndexNum:setString(string.format("%d", iter_1_1.index))
		else
			var_1_5.widgets.defIndexNum:setVisible(true)
			var_1_5.widgets.defIndexNum:setString(string.format("%d", iter_1_1.index))
		end

		var_1_3[iter_1_1.index] = var_1_5
		var_1_4[iter_1_1.index] = iter_1_1
		var_1_1 = var_1_1 - var_1_0
	end

	return var_1_3, var_1_4
end

function var_0_1.create(arg_2_0, arg_2_1)
	rmgr.loadResource("res/ui/battle/battlePrepare/battlePrepare.plist")

	local var_2_0 = createBaseLayer()
	local var_2_1
	local var_2_2
	local var_2_3 = "att"
	local var_2_4 = arg_2_1.kfwdInfo.nextSRoundCD / 1000
	local var_2_5 = {}

	uiutil.initLayout(var_2_5, var_0_3)

	local function var_2_6(arg_3_0)
		if var_2_2 then
			local var_3_0 = ""

			for iter_3_0, iter_3_1 in pairs(var_2_2) do
				var_3_0 = var_3_0 .. tostring(iter_3_1.generalId) .. "#"
			end

			cmgr.sendRequest(arg_3_0, actions.kfwdSyndata, var_3_0)
		end
	end

	local function var_2_7()
		local function var_4_0()
			log.info("@@ 完成同步")
			smgr.showTipTextGreen(language.get(390411))
		end

		var_2_6(var_4_0)
	end

	local function var_2_8()
		arg_2_1.layerTabel.prepareLayer:removeChild(var_2_0, true)
		arg_2_1.layerTabel.prepareLayer:removeAllChildrenWithCleanup(true)
		arg_2_1.layerTabel.uiLayer:removeChild(var_2_5.widgets.passLayer, true)
		arg_2_1.layerTabel.uiLayer:removeChild(var_2_5.widgets.panel, true)
		arg_2_1.layerTabel.uiLayer:removeChild(var_2_5.widgets.saveButton, true)
		arg_2_1.layerTabel.uiLayer:removeChild(var_2_5.widgets.playerInfoLabelAtt, true)
		arg_2_1.layerTabel.uiLayer:removeChild(var_2_5.widgets.playerInfoLabelDef, true)
		arg_2_1.layerTabel.uiLayer:removeChild(var_2_5.widgets.attPlayer, true)
		arg_2_1.layerTabel.uiLayer:removeChild(var_2_5.widgets.defPlayer, true)

		if arg_2_1.kfwdInfo.competitorId1 == 0 or arg_2_1.kfwdInfo.competitorId2 == 0 then
			arg_2_1.kfwdInit()
		else
			arg_2_1.kfwdInfo.kfwdState = kfwdState.fight

			if arg_2_1.kfwdInfo.kfwdView then
				arg_2_1.kfwdInfo.kfwdView.widgets.rankButton:setVisible(false)
				arg_2_1.kfwdInfo.kfwdView.widgets.gotoShopButton:setVisible(false)
			end

			local var_6_0 = CCSprite:createWithSpriteFrameName("xflts_start.png")

			var_6_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
			var_6_0:setScale(20)
			smgr.getLayer("tipLayer"):addChild(var_6_0, 0, 1000)

			local function var_6_1()
				smgr.getLayer("tipLayer"):removeChild(var_6_0, true)
			end

			local var_6_2 = CCArray:create()

			var_6_2:addObject(CCScaleTo:create(0.3, 1))
			var_6_2:addObject(CCDelayTime:create(1))
			var_6_2:addObject(CCCallFuncN:create(var_6_1))
			var_6_0:runAction(CCSequence:create(var_6_2))
		end
	end

	var_2_5.widgets.matchLabel:setString(language.get(390401, arg_2_1.kfwdInfo.round))

	local var_2_9 = createTimerLabel(arg_2_1.kfwdInfo.nextSRoundCD, "@H:@M:@S", "Thonburi", 32, var_2_8, nil, nil, colorTips.red)

	var_2_9:setPosition(ccp(531, 60))
	var_2_5.widgets.panel:addChild(var_2_9)
	var_2_5.widgets.saveButton:addHandleOfControlEvent(var_2_7, CCControlEventTouchUpInside)

	if arg_2_1.kfwdInfo.competitorId1 == 0 or arg_2_1.kfwdInfo.competitorId2 == 0 then
		var_2_5.widgets.passLayer:setVisible(true)
	end

	local var_2_10
	local var_2_11
	local var_2_12
	local var_2_13

	if arg_2_1.kfwdInfo.isAttacker then
		var_2_10 = arg_2_1.kfwdInfo.p1gInfo.list

		if arg_2_1.kfwdInfo.p2gInfo then
			var_2_11 = arg_2_1.kfwdInfo.p2gInfo.list
		end

		var_2_12 = arg_2_1.kfwdInfo.p1Info
		var_2_13 = arg_2_1.kfwdInfo.p2Info
		var_0_2 = 1
	else
		var_2_10 = arg_2_1.kfwdInfo.p2gInfo.list

		if arg_2_1.kfwdInfo.p1gInfo then
			var_2_11 = arg_2_1.kfwdInfo.p1gInfo.list
		end

		var_2_12 = arg_2_1.kfwdInfo.p2Info
		var_2_13 = arg_2_1.kfwdInfo.p1Info
		var_0_2 = 0
	end

	local function var_2_14(arg_8_0)
		var_2_1, var_2_2 = arg_2_0:createGeneralCard(var_2_0, arg_2_1, "att", var_2_10)

		if var_2_11 then
			arg_2_0:createGeneralCard(var_2_0, arg_2_1, "def", var_2_11)
		end

		if arg_8_0 then
			var_2_6()
		end
	end

	local function var_2_15(arg_9_0)
		local var_9_0 = arg_9_0.action.data.military
		local var_9_1 = false
		local var_9_2 = {}

		for iter_9_0, iter_9_1 in pairs(var_9_0) do
			local var_9_3 = {
				armyHp = iter_9_1.forces or 0,
				armyHpMax = iter_9_1.forcesMax or 0,
				generalId = iter_9_1.generalId or 0,
				generalLv = iter_9_1.generalLv or 0,
				generalName = iter_9_1.generalName or "",
				generalPic = iter_9_1.pic or nil,
				index = iter_9_0,
				quality = iter_9_1.quality,
				tacticName = iter_9_1.tacName,
				troopId = iter_9_1.troopId,
				troopType = iter_9_1.troopType
			}

			table.insert(var_9_2, var_9_3)
		end

		if not var_2_10 or #var_2_10 == 0 or #var_9_2 ~= #var_2_10 then
			var_2_10 = var_9_2
			var_9_1 = true
		else
			for iter_9_2, iter_9_3 in pairs(var_9_2) do
				local var_9_4 = true

				for iter_9_4, iter_9_5 in pairs(var_2_10) do
					if iter_9_5.generalId == iter_9_3.generalId then
						var_9_4 = false

						break
					end
				end

				if var_9_4 then
					var_2_10 = var_9_2
					var_9_1 = true

					break
				end
			end
		end

		var_2_14(var_9_1)
	end

	if var_2_4 > 20 then
		cmgr.sendRequest(var_2_15, actions.generalSimpleInfo)

		local function var_2_16()
			var_2_5.widgets.saveButton:setVisible(false)
		end

		performWithDelay(var_2_5.widgets.saveButton, var_2_16, var_2_4 - 21)
	else
		var_2_14(false)
		var_2_5.widgets.saveButton:setVisible(false)
	end

	if var_2_12 then
		local var_2_17 = language.get(390408, var_2_12.serverName, var_2_12.serverId, var_2_12.playerName, var_2_12.playerLevel)

		var_2_5.widgets.playerInfoLabelAtt:setString(var_2_17)
		var_2_5.widgets.playerInfoLabelAtt:setVisible(true)

		if var_0_2 == 1 then
			var_2_5.widgets.attPlayer:setPosition(ccp(visibleSize.width * 0.5 + 300, visibleSize.height * 0.75 + 80))
			var_2_5.widgets.defPlayer:setPosition(ccp(visibleSize.width * 0.5 + 300, visibleSize.height * 0.25 + 80))
		else
			var_2_5.widgets.attPlayer:setPosition(ccp(visibleSize.width * 0.5 + 300, visibleSize.height * 0.25 + 80))
			var_2_5.widgets.defPlayer:setPosition(ccp(visibleSize.width * 0.5 + 300, visibleSize.height * 0.75 + 80))
		end
	end

	if var_2_13 then
		local var_2_18 = language.get(390408, var_2_13.serverName, var_2_13.serverId, var_2_13.playerName, var_2_13.playerLevel)

		var_2_5.widgets.playerInfoLabelDef:setString(var_2_18)
		var_2_5.widgets.playerInfoLabelDef:setVisible(true)
	end

	local var_2_19
	local var_2_20 = CCDirector:sharedDirector():getScheduler()
	local var_2_21
	local var_2_22
	local var_2_23 = {
		x = 0,
		y = 0
	}
	local var_2_24 = {
		x = 0,
		y = 0
	}
	local var_2_25 = {
		x = 0,
		y = 0
	}

	local function var_2_26(arg_11_0)
		local var_11_0 = arg_11_0.widgets.cardSprite:getPositionX()
		local var_11_1 = 67
		local var_11_2
		local var_11_3
		local var_11_4

		for iter_11_0, iter_11_1 in pairs(var_2_1) do
			local var_11_5 = iter_11_1.widgets.cardSprite
			local var_11_6 = math.abs(var_11_0 - var_11_5:getPositionX())

			log.info("@@@ check offset ", var_11_6)

			if arg_11_0 ~= iter_11_1 then
				if not var_11_4 then
					var_11_4 = var_11_6
					var_11_3 = iter_11_0
				elseif var_11_6 < var_11_4 then
					var_11_4 = var_11_6
					var_11_3 = iter_11_0
				end
			else
				var_11_2 = iter_11_0
			end
		end

		if var_11_3 then
			local var_11_7 = var_0_0[var_2_3][var_11_3]
			local var_11_8 = var_2_1[var_11_3]

			var_11_8.widgets.cardSprite:runAction(CCMoveTo:create(0.3, var_2_22))
			arg_11_0.widgets.cardSprite:runAction(CCMoveTo:create(0.3, var_11_7))

			local var_11_9 = arg_11_0.widgets.attIndexNum
			local var_11_10 = var_11_8.widgets.attIndexNum

			if not arg_2_1.kfwdInfo.isAttacker then
				var_11_9 = arg_11_0.widgets.defIndexNum
				var_11_10 = var_11_8.widgets.defIndexNum
			end

			local var_11_11 = var_11_10:getString()

			var_11_10:setString(var_11_9:getString())
			var_11_9:setString(var_11_11)

			var_2_1[var_11_3] = arg_11_0
			var_2_1[var_11_2] = var_11_8
			var_2_2[var_11_3], var_2_2[var_11_2] = var_2_2[var_11_2], var_2_2[var_11_3]
		else
			arg_11_0.widgets.cardSprite:runAction(CCMoveTo:create(0.3, var_2_22))
		end

		return var_11_3
	end

	local function var_2_27()
		if var_2_21 then
			var_2_21.widgets.selectedSprite:setVisible(false)
			var_2_26(var_2_21)

			var_2_21 = nil
			var_2_22 = nil
		end
	end

	local function var_2_28(arg_13_0)
		var_2_27()

		var_2_21 = arg_13_0

		if var_2_21 then
			var_2_21.widgets.selectedSprite:setVisible(true)
			var_2_0:reorderChild(var_2_21.widgets.cardSprite, 10)
		end
	end

	local function var_2_29(arg_14_0, arg_14_1)
		for iter_14_0, iter_14_1 in pairs(var_2_1) do
			local var_14_0 = iter_14_1.widgets.cardSprite

			if tool.checkIfTouch(var_14_0, arg_14_0, arg_14_1) then
				var_2_22 = var_0_0[var_2_3][iter_14_0]

				iter_14_1.widgets.selectedSprite:setVisible(true)
				var_2_28(iter_14_1)

				break
			end
		end
	end

	local function var_2_30(arg_15_0, arg_15_1)
		local var_15_0 = arg_15_0 - var_2_25.x

		var_2_25.x = arg_15_0
		var_2_25.y = arg_15_1

		if var_2_21 and var_15_0 ~= 0 and math.abs(var_2_23.x - var_2_25.x) > 50 then
			local var_15_1 = var_2_21.widgets.cardSprite
			local var_15_2 = var_15_1:getPositionX()
			local var_15_3 = var_15_1:getPositionY()
			local var_15_4 = var_15_2 + var_15_0

			var_15_1:setPosition(ccp(var_15_4, var_15_3))
		end
	end

	local function var_2_31(arg_16_0, arg_16_1, arg_16_2)
		if arg_16_0 == CCTOUCHBEGAN then
			var_2_23.x = arg_16_1
			var_2_23.y = arg_16_2
			var_2_25.x = arg_16_1
			var_2_25.y = arg_16_2

			var_2_29(arg_16_1, arg_16_2)
		elseif arg_16_0 == CCTOUCHMOVED then
			var_2_30(arg_16_1, arg_16_2)
		elseif arg_16_0 == CCTOUCHENDED then
			var_2_27()
		end

		return true
	end

	var_2_0:registerScriptTouchHandler(var_2_31)
	var_2_0:setTouchEnabled(true)
	arg_2_1.layerTabel.prepareLayer:addChild(var_2_0)
end

return var_0_1
