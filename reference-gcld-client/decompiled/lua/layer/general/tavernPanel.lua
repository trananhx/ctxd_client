require("lua/layer/general/tavernGeneralCardPanel")
require("lua/component/menuButton")

local var_0_0 = require("res/native/offset").get("layer.general.tavernPanel")

recordGeneralID = 0
TAG_GENERAL_CARD = 101
TAG_TAVERN_INFO = 102
TAG_TAVERN_TIPS = 103
TAG_TAVERN_ZIJIANG = 105

local var_0_1 = false
local var_0_2 = {
	{
		default = true,
		name = language.get(83001),
		type = generalConstant.tavern.wujiang
	},
	{
		default = false,
		name = language.get(83029),
		type = generalConstant.tavern.wenguan
	}
}

function createTavernPanel(arg_1_0)
	guide.uiElementsTable[1013] = nil

	rmgr.loadResource("res/ui/tavern/tavern.plist")

	local var_1_0 = {}
	local var_1_1 = createBaseLayer()

	var_1_1:setPosition(ccp(18, 32))

	local var_1_2 = generalConstant.tavern.wujiang

	if user.is_enter_jiuguan_wujiang == false then
		user.is_enter_jiuguan_wujiang = true
		var_1_2 = generalConstant.tavern.wenguan
		var_0_2[1].default = false
		var_0_2[2].default = true
	end

	local var_1_3 = CCSprite:create("res/ui/tavern/poth_view_bg.jpg")

	var_1_3:setPosition(ccp(var_1_3:getContentSize().width * 0.5, var_1_3:getContentSize().height * 0.5))
	var_1_1:addChild(var_1_3)

	function var_1_0.clearRefreshCD()
		local function var_2_0()
			if var_1_2 then
				cmgr.sendRequest(var_1_0.handlerClearCD, actions.clearTavernCD, var_1_2)
			end
		end

		local function var_2_1(arg_4_0)
			local var_4_0 = arg_4_0.action.data.gold

			messageBox.showChargeWin(language.get(10003), language.get(83002, var_4_0), "refreshGeneralCd", var_2_0)
		end

		cmgr.sendRequest(var_2_1, actions.tavernCdRecover, var_1_2)
	end

	local function var_1_4()
		local var_5_0 = CCStrokeLabelTTF:create(language.get(83003), "Thonburi-Bold", 20)

		var_5_0:setColor(ccc3(166, 146, 101))

		if conf.language ~= "cn" then
			var_5_0:setAnchorPoint(ccp(1, 0.5))
			var_5_0:setPosition(ccp(810, 490))
		else
			var_5_0:setPosition(ccp(740, 490))
		end

		var_1_1:addChild(var_5_0)

		local var_5_1 = CCSprite:createWithSpriteFrameName("btnTip_a.png")
		local var_5_2 = CCSprite:createWithSpriteFrameName("btnTip_c.png")
		local var_5_3 = creatMenuButton(var_5_1, var_5_2, nil, var_1_0.getCanDropGeneral, nil, ccp(875, 495))

		var_1_1:addChild(var_5_3)
	end

	local function var_1_5(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
		local var_6_0 = {}

		if conf.language == "vie" then
			var_6_0.tw = 200
			var_6_0.troopX = 10
			var_6_0.skillX = 10
			var_6_0.terrainX = 10
			var_6_0.tacticsX = 10

			if arg_6_0.pic == "zhoutai" then
				var_6_0.fontSize = -4
			else
				var_6_0.fontSize = 0
			end
		else
			var_6_0.tw = 0
			var_6_0.troopX = 0
			var_6_0.skillX = 0
			var_6_0.terrainX = 0
			var_6_0.tacticsX = 0
			var_6_0.fontSize = 0
		end

		if not arg_6_1 then
			return
		end

		if var_1_2 == generalConstant.tavern.wenguan then
			local var_6_1 = ccc3(246, 233, 193)
			local var_6_2 = {
				lineGap = 8,
				name = "bg",
				type = "sprite9Tips",
				pic = {
					path = "res/ui/weapon/tips_di.png"
				},
				middleRect = CCRectMake(6, 6, 68, 68),
				content = {
					{
						height = 0,
						fontSize = 26,
						type = "label",
						width = 284,
						color = colorQuality[arg_6_0.quality],
						text = arg_6_0.name,
						halign = kCCTextAlignmentLeft
					},
					{
						height = 0,
						fontSize = 22,
						type = "label",
						width = 284,
						color = ccc3(255, 204, 0),
						text = language.get(83047, arg_6_0.stratagemList[1].trickName),
						halign = kCCTextAlignmentLeft
					},
					{
						height = 0,
						fontSize = 22,
						type = "label",
						width = 284,
						color = var_6_1,
						text = language.get(74050, arg_6_0.stratagemList[1].intro),
						halign = kCCTextAlignmentLeft
					},
					{
						type = "sprite",
						pic = {
							path = "res/ui/activity/weekActivity/acti_lxdl_tips_list.png"
						}
					}
				}
			}

			if #arg_6_0.stratagemList == 1 then
				table.insert(var_6_2.content, {
					height = 0,
					fontSize = 22,
					type = "label",
					width = 284,
					color = var_6_1,
					text = language.get(83030) .. language.get(83032, arg_6_0.stratagemList[1].lastTime or 0),
					halign = kCCTextAlignmentLeft
				})
				table.insert(var_6_2.content, {
					type = "sprite",
					pic = {
						path = "res/ui/activity/weekActivity/acti_lxdl_tips_list.png"
					}
				})
				table.insert(var_6_2.content, {
					height = 0,
					fontSize = 22,
					type = "label",
					width = 284,
					color = var_6_1,
					text = language.get(83031) .. language.get(83033, arg_6_0.stratagemList[1].promptCD),
					halign = kCCTextAlignmentLeft
				})
			else
				table.insert(var_6_2.content, {
					height = 0,
					fontSize = 22,
					type = "label",
					width = 284,
					color = ccc3(255, 204, 0),
					text = language.get(83048, arg_6_0.stratagemList[2].trickName),
					halign = kCCTextAlignmentLeft
				})
				table.insert(var_6_2.content, {
					height = 0,
					fontSize = 22,
					type = "label",
					width = 284,
					color = var_6_1,
					text = language.get(74050, arg_6_0.stratagemList[2].intro),
					halign = kCCTextAlignmentLeft
				})
				table.insert(var_6_2.content, {
					height = 0,
					fontSize = 22,
					type = "label",
					width = 284,
					color = var_6_1,
					text = language.get(83049, arg_6_0.stratagemList[2].validNum),
					halign = kCCTextAlignmentLeft
				})
			end

			local var_6_3 = {}

			uiutil.initWidgets(var_6_3, var_6_2)

			local var_6_4 = 167
			local var_6_5 = 330
			local var_6_6, var_6_7 = tool.getPositionFromUpperNode(arg_6_1, var_1_1)
			local var_6_8 = arg_6_1:getAnchorPointInPoints()
			local var_6_9 = var_6_6 - var_6_8.x
			local var_6_10 = var_6_7 - var_6_8.y
			local var_6_11 = 290
			local var_6_12 = 450
			local var_6_13 = 0
			local var_6_14 = 0

			if var_6_9 + var_6_4 + var_6_11 > visibleSize.width then
				var_6_13 = var_6_9
			else
				var_6_13 = var_6_9 + var_6_4
			end

			local var_6_15 = var_6_10 + var_6_5

			var_6_3.widgets.bg:setPosition(ccp(var_6_13, var_6_15))
			var_1_1:addChild(var_6_3.widgets.bg, 100, TAG_TAVERN_TIPS)
		elseif var_1_2 == generalConstant.tavern.wujiang then
			local var_6_16 = CCScale9Sprite:createWithSpriteFrameName("tavern_tip.png", CCRectMake(0, 118, 237, 42))

			var_6_16:setPreferredSize(CCSizeMake(239, 409))
			var_6_16:setAnchorPoint(ccp(0, 1))

			local var_6_17 = CCStrokeLabelTTF:create(arg_6_0.name .. " " .. language.get(83027, arg_6_0.generalLv), "Thonburi-Bold", 22)

			var_6_17:setColor(colorQuality[arg_6_0.quality])
			var_6_17:setPosition(ccp(10 + var_6_17:getContentSize().width * 0.5, 378))
			var_6_16:addChild(var_6_17)

			local var_6_18 = CCStrokeLabelTTF:create(language.get(83004, arg_6_0.leader), "Thonburi-Bold", 22)

			var_6_18:setColor(ccc3(102, 157, 187))
			var_6_18:setPosition(ccp(10 + var_6_18:getContentSize().width * 0.5, 338))

			local var_6_19 = CCStrokeLabelTTF:create(language.get(83005), "Thonburi-Bold", 20)

			var_6_19:setColor(ccc3(188, 167, 146))
			var_6_19:setPosition(ccp(var_6_18:getContentSize().width * 0.5 + var_6_19:getContentSize().width * 0.5, 0))
			var_6_18:addChild(var_6_19)
			var_6_16:addChild(var_6_18)

			local var_6_20 = CCStrokeLabelTTF:create(language.get(83006, arg_6_0.strength), "Thonburi-Bold", 22)

			var_6_20:setColor(ccc3(183, 91, 68))
			var_6_20:setPosition(ccp(10 + var_6_20:getContentSize().width * 0.5, 308))

			local var_6_21 = CCStrokeLabelTTF:create(language.get(83007), "Thonburi-Bold", 20)

			var_6_21:setColor(ccc3(188, 167, 146))
			var_6_21:setPosition(ccp(var_6_20:getContentSize().width * 0.5 + var_6_21:getContentSize().width * 0.5, 0))
			var_6_20:addChild(var_6_21)
			var_6_16:addChild(var_6_20)

			local var_6_22 = CCStrokeLabelTTF:create(language.get(83009), "Thonburi-Bold", 22)

			var_6_22:setColor(ccc3(203, 173, 141))
			var_6_22:setPosition(ccp(10 + var_6_22:getContentSize().width * 0.5, 270))
			var_6_16:addChild(var_6_22)

			if arg_6_0.tacName and string.len(arg_6_0.tacName) > 0 then
				local var_6_23 = CCStrokeLabelTTF:create(arg_6_0.tacName, "Thonburi-Bold", 22)

				var_6_23:setColor(colorQuality[arg_6_0.quality])
				var_6_23:setPosition(ccp(var_6_22:getContentSize().width * 0.5 + var_6_23:getContentSize().width * 0.5 + var_6_0.skillX, 0))
				var_6_22:addChild(var_6_23)

				local var_6_24 = CCStrokeLabelTTF:create(language.get(83010, arg_6_0.tacRange), "Thonburi-Bold", 20)

				var_6_24:setColor(ccc3(193, 184, 178))
				var_6_24:setPosition(ccp(var_6_24:getContentSize().width * 0.5 - var_6_23:getContentSize().width * 0.5, -(var_6_23:getContentSize().height * 0.5 + var_6_24:getContentSize().height * 0.5)))
				var_6_23:addChild(var_6_24)
			end

			local var_6_25 = CCStrokeLabelTTF:create(language.get(83011), "Thonburi-Bold", 22)

			var_6_25:setPosition(ccp(10 + var_6_25:getContentSize().width * 0.5, 210))
			var_6_25:setColor(ccc3(203, 173, 139))
			var_6_16:addChild(var_6_25)

			if arg_6_0.terrain then
				for iter_6_0, iter_6_1 in pairs(arg_6_0.terrain) do
					local var_6_26 = language.get(83012)

					if iter_6_1.tType == 1 then
						local var_6_27 = language.get(83012)
					elseif iter_6_1.tType == 2 then
						var_6_26 = language.get(83013)
					elseif iter_6_1.tType == 3 then
						var_6_26 = language.get(83014)
					elseif iter_6_1.tType == 4 then
						var_6_26 = language.get(81112)
					end

					local var_6_28 = language.get(83015, iter_6_1.tValue)
					local var_6_29 = CCStrokeLabelTTF:create(var_6_26, "Thonburi-Bold", 20)

					var_6_29:setPosition(ccp(var_6_25:getContentSize().width * 0.5 + var_6_29:getContentSize().width * 0.5 + var_6_0.terrainX, -(iter_6_0 - 1) * (var_6_29:getContentSize().height + 15)))
					var_6_29:setColor(ccc3(193, 182, 178))
					var_6_25:addChild(var_6_29)

					local var_6_30 = CCStrokeLabelTTF:create(var_6_28, "Thonburi-Bold", 18)

					var_6_30:setPosition(ccp(var_6_29:getContentSize().width * 0.5 + var_6_30:getContentSize().width * 0.5, 0))
					var_6_30:setColor(ccc3(189, 167, 146))
					var_6_29:addChild(var_6_30)
				end
			end

			local var_6_31 = CCStrokeLabelTTF:create(language.get(83016), "Thonburi-Bold", 22)

			var_6_31:setPosition(ccp(10 + var_6_31:getContentSize().width * 0.5, 95))
			var_6_31:setColor(ccc3(203, 173, 139))
			var_6_16:addChild(var_6_31)

			if arg_6_0.tts then
				local var_6_32 = 0
				local var_6_33 = 0

				for iter_6_2, iter_6_3 in pairs(arg_6_0.tts) do
					local var_6_34 = iter_6_3.sName
					local var_6_35 = CCStrokeLabelTTF:create(var_6_34, "Thonburi-Bold", 20 + var_6_0.fontSize)

					var_6_35:setPosition(ccp(var_6_33 + var_6_31:getContentSize().width * 0.5 + var_6_35:getContentSize().width * 0.5 + var_6_0.tacticsX, var_6_32))
					var_6_35:setColor(ccc3(193, 182, 178))
					var_6_31:addChild(var_6_35)

					if iter_6_2 % 2 == 1 then
						var_6_33 = var_6_33 + 10 + var_6_35:getContentSize().width
					else
						var_6_33 = 0
						var_6_32 = var_6_32 - 10 - var_6_35:getContentSize().height
					end
				end
			end

			local var_6_36 = 167
			local var_6_37 = 330
			local var_6_38, var_6_39 = tool.getPositionFromUpperNode(arg_6_1, var_1_1)
			local var_6_40 = arg_6_1:getAnchorPointInPoints()
			local var_6_41 = var_6_38 - var_6_40.x
			local var_6_42 = var_6_39 - var_6_40.y
			local var_6_43 = 240 + var_6_0.tw
			local var_6_44 = 450
			local var_6_45 = 0
			local var_6_46 = 0

			if var_6_41 + var_6_36 + var_6_43 > visibleSize.width then
				var_6_45 = var_6_41 - var_6_43
			else
				var_6_45 = var_6_41 + var_6_36
			end

			local var_6_47 = var_6_42 + var_6_37

			var_6_16:setPosition(ccp(var_6_45, var_6_47))
			var_1_1:addChild(var_6_16, 100, TAG_TAVERN_TIPS)
		end
	end

	local function var_1_6()
		multiLangOffset = {}

		if conf.language == "vie" then
			multiLangOffset.recruitLabelX = 0
			multiLangOffset.fontSize = -2
		elseif conf.language == "kr" then
			multiLangOffset.recruitLabelX = 0
			multiLangOffset.fontSize = 0
		else
			multiLangOffset.recruitLabelX = 0
			multiLangOffset.fontSize = 0
		end

		local var_7_0 = createLabelPage()

		var_1_1:addChild(var_7_0)

		for iter_7_0, iter_7_1 in pairs(var_0_2) do
			if iter_7_0 ~= 2 or user.isOpenWenguan() == true then
				local var_7_1 = CCSprite:createWithSpriteFrameName("tavern_yeqian1_normal.png")

				var_7_1:setAnchorPoint(ccp(0.5, 0))

				local var_7_2 = CCSprite:createWithSpriteFrameName("tavern_yeqian1_light.png")

				var_7_2:setAnchorPoint(ccp(0.5, 0))

				local var_7_3 = CCStrokeLabelTTF:create(iter_7_1.name, "Thonburi-Bold", 26 + multiLangOffset.fontSize)

				var_7_3:setColor(ccc3(204, 185, 134))
				var_7_3:setPosition(ccp(var_7_1:getContentSize().width * 0.5, var_7_1:getContentSize().height * 0.5))
				var_7_1:addChild(var_7_3)

				local var_7_4 = CCStrokeLabelTTF:create(iter_7_1.name, "Thonburi-Bold", 26 + multiLangOffset.fontSize)

				var_7_4:setColor(ccc3(255, 255, 205))
				var_7_4:setPosition(ccp(var_7_2:getContentSize().width * 0.5, var_7_2:getContentSize().height * 0.5))
				var_7_2:addChild(var_7_4)
				var_7_0:addLabelButton(var_7_1, var_7_2, ccp(75 + (var_7_1:getContentSize().width - 25) * (iter_7_0 - 1), 470), var_1_0.callback, iter_7_1.default, iter_7_1.type)
			end
		end
	end

	local function var_1_7(arg_8_0, arg_8_1)
		local var_8_0 = CCMenu:create()

		var_8_0:setPosition(ccp(0, 0))

		local var_8_1 = CCSprite:createWithSpriteFrameName("btn3_yel_a.png")
		local var_8_2 = CCSprite:createWithSpriteFrameName("btn3_yel_c.png")
		local var_8_3 = CCStrokeLabelTTF:create(arg_8_0, "Thonburi-Bold", 22, 2, colorText[10005])

		var_8_3:setPosition(ccp(var_8_1:getContentSize().width * 0.5, var_8_1:getContentSize().height * 0.5))
		var_8_3:setColor(colorText[10004])
		var_8_1:addChild(var_8_3)

		local var_8_4 = CCStrokeLabelTTF:create(arg_8_0, "Thonburi-Bold", 22, 2, colorText[10005])

		var_8_4:setPosition(ccp(var_8_1:getContentSize().width * 0.5, var_8_1:getContentSize().height * 0.5))
		var_8_4:setColor(colorText[10004])
		var_8_2:addChild(var_8_4)

		local var_8_5 = CCMenuItemSprite:create(var_8_1, var_8_2)

		var_8_5:setPosition(ccp(790, 40))
		var_8_5:registerScriptTapHandler(arg_8_1)
		var_8_0:addChild(var_8_5)

		return var_8_0
	end

	local function var_1_8(arg_9_0, arg_9_1)
		var_1_0.tavernGenerals = arg_9_0

		var_1_1:removeChildByTag(TAG_GENERAL_CARD, true)

		local var_9_0 = createTavernGeneralCardPanel(arg_9_0, var_1_5, var_1_0.handlerRecruitGeneral, arg_9_1)

		var_1_1:addChild(var_9_0, 1, TAG_GENERAL_CARD)
	end

	local function var_1_9(arg_10_0)
		local var_10_0 = arg_10_0.action.data.stratagem

		if var_10_0 ~= nil then
			eventManager.dispatchEvent("stratagemChanged", var_10_0)
		end

		log.info("@@ 解雇武将")
		eventManager.dispatchEvent("fireGeneral")
		var_1_0.getTavernGeneralInfo(var_1_2)
	end

	local function var_1_10(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5)
		local var_11_0 = {}
		local var_11_1 = {}
		local var_11_2 = 1

		if arg_11_5 == true then
			for iter_11_0, iter_11_1 in pairs(arg_11_1) do
				if arg_11_1[iter_11_0] and arg_11_1[iter_11_0].isDeputy == false then
					var_11_1[var_11_2] = arg_11_1[iter_11_0]
					var_11_2 = var_11_2 + 1
				end

				if arg_11_1[iter_11_0] and arg_11_1[iter_11_0].isDeputy == true then
					var_11_0[#var_11_0 + 1] = arg_11_1[iter_11_0]
				end
			end
		else
			var_11_1 = arg_11_1
		end

		var_1_1:removeChildByTag(TAG_GENERAL_MY_ICON, true)

		local var_11_3 = createTavernMyGeneralIconPanel(arg_11_0, var_11_1, arg_11_2, var_1_9, var_1_2, var_11_0, arg_11_4, arg_11_5, var_1_1)

		if (arg_11_5 and 5 or arg_11_0.maxGeneralNum) + (arg_11_0.deputyNum > 0 and arg_11_0.deputyNum or 1) > 8 then
			local var_11_4 = CCScrollView:create(CCSizeMake(900, 120))

			var_11_4:setContainer(var_11_3)
			var_11_4:setPosition(6, 344)
			var_11_4:setContentSize(CCSizeMake(1005, 120))
			var_11_4:setContentOffset(ccp(-100, -342))
			var_11_4:setDirection(kCCScrollViewDirectionHorizontal)
			var_1_1:addChild(var_11_4, 1, TAG_GENERAL_MY_ICON)
		else
			var_1_1:addChild(var_11_3, 1, TAG_GENERAL_MY_ICON)
		end

		if guide.callback then
			guide.callback()

			guide.callback = nil
		end
	end

	local function var_1_11(arg_12_0)
		local var_12_0 = var_1_1:getChildByTag(TAG_TAVERN_INFO)

		while var_12_0 do
			var_1_1:removeChild(var_12_0, true)

			var_12_0 = var_1_1:getChildByTag(TAG_TAVERN_INFO)
		end

		if var_1_2 == generalConstant.tavern.wenguan then
			local var_12_1 = CCStrokeLabelTTF:create(language.get(83017, arg_12_0.nowGeneralNum, arg_12_0.maxGeneralNum), "Thonburi-Bold", 24)

			var_12_1:setColor(ccc3(188, 167, 145))
			var_12_1:setPosition(ccp(120, 415))

			if conf.language == "vie" or conf.language == "kr" then
				var_12_1:setDimensions(CCSizeMake(200, 0))
			end

			var_1_1:addChild(var_12_1, 1, TAG_TAVERN_INFO)
		end

		if arg_12_0.refreshCD then
			if arg_12_0.refreshCopper == 0 and arg_12_0.refreshCD == 0 then
				if conf.language ~= "cn" then
					local var_12_2 = CCStrokeLabelTTF:create(language.get(83018), "Thonburi-Bold", 20)

					var_12_2:setColor(ccc3(188, 167, 145))
					var_12_2:setAnchorPoint(ccp(1, 0.5))
					var_12_2:setPosition(ccp(690, 40))
					var_1_1:addChild(var_12_2, 1, TAG_TAVERN_INFO)
				else
					local var_12_3 = CCStrokeLabelTTF:create(language.get(83018), "Thonburi-Bold", 20)

					var_12_3:setColor(ccc3(188, 167, 145))
					var_12_3:setPosition(ccp(660, 40))
					var_1_1:addChild(var_12_3, 1, TAG_TAVERN_INFO)
				end
			else
				local var_12_4 = createTimerLabel(arg_12_0.refreshCD, "CD:@H:@M:@S", "Thonburi-Bold", 24, nil, nil, nil, ccc3(216, 86, 73))

				var_12_4:setPosition(ccp(630, 40))
				var_1_1:addChild(var_12_4, 1, TAG_TAVERN_INFO)
			end

			local var_12_5 = language.get(83019)
			local var_12_6 = var_1_0.refreshGeneral

			if arg_12_0.refreshCD > 3600000 then
				var_12_5 = language.get(83020)
				var_12_6 = var_1_0.clearRefreshCD
			end

			local var_12_7 = var_1_7(var_12_5, var_12_6)

			var_1_1:addChild(var_12_7, 1, TAG_TAVERN_INFO)
		end

		if arg_12_0.flipTechOpen then
			local var_12_8 = var_1_1:getChildByTag(TAG_TAVERN_ZIJIANG)

			while var_12_8 do
				var_1_1:removeChild(var_12_8, true)

				var_12_8 = var_1_1:getChildByTag(TAG_TAVERN_ZIJIANG)
			end

			log.info("显示紫将按钮")

			local var_12_9 = CCStrokeLabelTTF:create(language.get(83045), "Thonburi-Bold", 20)

			var_12_9:setColor(ccc3(188, 167, 145))
			var_12_9:setPosition(ccp(200 + (var_0_0.checkBoxOffsetX or 0), 40))
			var_1_1:addChild(var_12_9, 1, TAG_TAVERN_ZIJIANG)

			local var_12_10 = CCSprite:create("res/ui/playerInfo/setting/unite_view_on.png")

			var_12_10:setPosition(ccp(120, 40))
			var_1_1:addChild(var_12_10, 2, TAG_TAVERN_ZIJIANG)

			local function var_12_11()
				local function var_13_0(arg_14_0)
					if arg_14_0.action.data then
						if var_12_10:isVisible() then
							arg_12_0.flipState = false
							var_0_1 = false

							var_12_10:setVisible(false)
						else
							arg_12_0.flipState = true
							var_0_1 = true

							var_12_10:setVisible(true)
						end
					end
				end

				cmgr.sendRequest(var_13_0, actions.flip)
			end

			local var_12_12 = CCMenu:create()

			var_12_12:setPosition(ccp(0, 0))

			local var_12_13 = CCSprite:create("res/ui/playerInfo/setting/unite_view_a.png")
			local var_12_14 = CCSprite:create("res/ui/playerInfo/setting/unite_view_a.png")
			local var_12_15 = CCMenuItemSprite:create(var_12_13, var_12_14)

			var_12_15:setPosition(ccp(120, 40))
			var_12_15:registerScriptTapHandler(var_12_11)
			var_12_12:addChild(var_12_15)
			var_1_1:addChild(var_12_12, 1, TAG_TAVERN_ZIJIANG)

			if arg_12_0.flipState then
				var_0_1 = true

				var_12_10:setVisible(true)
			else
				var_0_1 = false

				var_12_10:setVisible(false)
			end
		end
	end

	local function var_1_12(arg_15_0)
		log.debug("#######  get general ##### ")

		local var_15_0 = require("lua/common/json")

		log.info("", var_15_0.encode(arg_15_0))

		if var_1_2 == generalConstant.tavern.wenguan then
			local var_15_1 = arg_15_0.action.data.myCivilList

			if var_15_1 ~= nil then
				eventManager.dispatchEvent("stratagemChanged", var_15_1)
			end
		end

		if var_1_2 == generalConstant.tavern.wujiang then
			var_1_8(arg_15_0.action.data.Generals, true)
			var_1_10(arg_15_0.action.data, arg_15_0.action.data.myGeneralList, arg_15_0.action.data.maxGeneralNum, var_1_9, arg_15_0.action.data.deputyOpen, true)
		elseif var_1_2 == generalConstant.tavern.wenguan then
			var_1_8(arg_15_0.action.data.Generals)
			var_1_10(arg_15_0.action.data, arg_15_0.action.data.myCivilList, arg_15_0.action.data.maxGeneralNum, var_1_9)
		end

		var_1_11(arg_15_0.action.data)

		if guide.callback then
			guide.callback()

			guide.callback = nil
		end
	end

	function var_1_0.getTavernGeneralInfo(arg_16_0)
		log.debug("###### actions.taverGeneralInfo ### ", var_1_0.handlerTavernGeneralInfo)
		cmgr.sendRequest(var_1_12, actions.taverGeneralInfo, arg_16_0)
	end

	function var_1_0.callback(arg_17_0)
		var_1_1:removeChildByTag(TAG_GENERAL_CARD, true)
		var_1_0.getTavernGeneralInfo(arg_17_0)

		var_1_2 = arg_17_0
	end

	function var_1_0.firstRecruitAnimation()
		local function var_18_0(arg_19_0, arg_19_1)
			local function var_19_0()
				arg_19_1:setVisible(true)
			end

			local var_19_1 = CCArray:create()

			var_19_1:addObject(CCDelayTime:create(arg_19_0))
			var_19_1:addObject(CCCallFuncN:create(var_19_0))
			var_19_1:addObject(CCFadeIn:create(0.5))

			return (CCSequence:create(var_19_1))
		end

		local var_18_1 = smgr.getLayer("tipLayer")
		local var_18_2 = recordGeneralID

		if generalConstant.general[var_18_2] then
			rmgr.loadResource("res/ui/common/generalWord.plist")
			rmgr.loadResource("res/ui/common/generalWord1.plist")

			local var_18_3 = CCSprite:create("res/ui/battle/stategyPic/2.png")
			local var_18_4 = var_18_3:getContentSize()

			if generalConstant.general[var_18_2].bg then
				var_18_3 = CCSprite:create("res/ui/battle/stategyPic/" .. generalConstant.general[var_18_2].bg .. ".png")
			end

			local var_18_5 = CCSprite:create("res/ui/common/halfPic/halfPic_" .. generalConstant.general[var_18_2].pic .. ".png")

			var_18_5:setPosition(ccp(145, 140))
			var_18_3:addChild(var_18_5)

			local var_18_6 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("wjzm_tit_" .. generalConstant.general[var_18_2].word .. "_03.png"))

			var_18_6:setAnchorPoint(ccp(1, 0.5))
			var_18_6:setPosition(ccp(800, var_18_4.height / 2))
			var_18_6:runAction(var_18_0(0.5, var_18_6))
			var_18_6:setVisible(false)
			var_18_3:addChild(var_18_6)

			local var_18_7 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("wjzm_tit_" .. generalConstant.general[var_18_2].word .. "_04.png"))

			var_18_7:setAnchorPoint(ccp(1, 0.5))
			var_18_7:setPosition(ccp(var_18_6:getPositionX() - var_18_6:getContentSize().width - 10, var_18_4.height / 2))
			var_18_7:runAction(var_18_0(1.5, var_18_7))
			var_18_7:setVisible(false)
			var_18_3:addChild(var_18_7)

			local var_18_8 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("wjzm_tit_" .. generalConstant.general[var_18_2].word .. "_01.png"))

			var_18_8:setAnchorPoint(ccp(1, 0.5))
			var_18_8:setPosition(ccp(var_18_7:getPositionX() - var_18_7:getContentSize().width - 80, var_18_4.height / 2))
			var_18_8:runAction(var_18_0(2.5, var_18_8))
			var_18_8:setVisible(false)
			var_18_3:addChild(var_18_8)

			local var_18_9 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("wjzm_tit_" .. generalConstant.general[var_18_2].word .. "_02.png"))

			var_18_9:setAnchorPoint(ccp(1, 0.5))
			var_18_9:setPosition(ccp(var_18_8:getPositionX() - var_18_8:getContentSize().width - 10, var_18_4.height / 2))
			var_18_9:runAction(var_18_0(3.5, var_18_9))
			var_18_9:setVisible(false)
			var_18_3:addChild(var_18_9)
			var_18_3:setVisible(false)
			var_18_3:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
			var_18_1:addChild(var_18_3, 1000)

			local function var_18_10()
				var_18_1:removeChild(var_18_3, true)
			end

			local function var_18_11()
				var_18_3:setVisible(true)
			end

			local var_18_12 = CCArray:create()

			var_18_12:addObject(CCCallFuncN:create(var_18_11))
			var_18_12:addObject(CCFadeIn:create(0.5))
			var_18_12:addObject(CCDelayTime:create(6))
			var_18_12:addObject(CCFadeOut:create(0.5))
			var_18_12:addObject(CCCallFuncN:create(var_18_10))

			local var_18_13 = CCSequence:create(var_18_12)

			var_18_3:runAction(var_18_13)
		end
	end

	function var_1_0.handlerRecruitGeneral(arg_23_0)
		if arg_23_0.action.data.firstRecruit and arg_23_0.action.data.firstRecruit == 1 then
			var_1_0.firstRecruitAnimation()
		end

		if var_1_2 then
			var_1_0.getTavernGeneralInfo(var_1_2)
			eventManager.dispatchEvent("recruitGeneral")

			local var_23_0 = CCSprite:create("res/ui/common/text/genealPanel/text_tavern_success.png")

			var_23_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 30))
			smgr.showTipSpriteText(var_23_0)
		end
	end

	function var_1_0.handlerRefreshGeneral(arg_24_0)
		if var_1_2 == generalConstant.tavern.wujiang then
			var_1_8(arg_24_0.action.data.Generals, true)
			var_1_10(arg_24_0.action.data, arg_24_0.action.data.myGeneralList, arg_24_0.action.data.maxGeneralNum, var_1_9, arg_24_0.action.data.deputyOpen, true)
		elseif var_1_2 == generalConstant.tavern.wenguan then
			var_1_8(arg_24_0.action.data.Generals)
			var_1_10(arg_24_0.action.data, arg_24_0.action.data.myCivilList, arg_24_0.action.data.maxGeneralNum)
		end

		var_1_11(arg_24_0.action.data)
	end

	function var_1_0.refreshGeneral()
		local var_25_0 = false
		local var_25_1 = true

		if #var_1_0.tavernGenerals == 0 then
			var_25_1 = false
		else
			for iter_25_0, iter_25_1 in pairs(var_1_0.tavernGenerals) do
				if tonumber(iter_25_1.quality) == 6 and not iter_25_1.bought and iter_25_1.locked == 0 then
					var_25_0 = true
				end

				if iter_25_1.locked == 0 then
					var_25_1 = false
				end
			end

			if #var_1_0.tavernGenerals < 5 then
				var_25_1 = false
			end
		end

		local function var_25_2()
			if var_1_2 then
				cmgr.sendRequest(var_1_0.handlerRefreshGeneral, actions.refreshGeneral, var_1_2)
			end
		end

		if var_25_0 and var_0_1 ~= true then
			messageBox.confirm(language.get("83034_lxr"), var_25_2, language.get(10001))
		elseif var_25_1 then
			smgr.showTipTextGreen(language.get(83044))
		else
			var_25_2()
		end
	end

	function var_1_0.handlerClearCD(arg_27_0)
		var_1_0.getTavernGeneralInfo(var_1_2)
	end

	function var_1_0.handlerCanDropGeneral(arg_28_0)
		local var_28_0 = {}

		if conf.language == "vie" then
			var_28_0.genTitleFontSize = -4
			var_28_0.genFontSize = -6
			var_28_0.genNameInterval = 40
			var_28_0.tipFrameX = -100
			var_28_0.tipFrameWidth = 30
			var_28_0.tipFrameHeight = 30
			var_28_0.tipStartY = 30
		elseif conf.language == "tha" then
			var_28_0.genTitleFontSize = 0
			var_28_0.genFontSize = 0
			var_28_0.genNameInterval = 20
			var_28_0.tipFrameX = -100
			var_28_0.tipFrameWidth = 20
			var_28_0.tipFrameHeight = 70
			var_28_0.tipStartY = 70
		else
			var_28_0.genTitleFontSize = 0
			var_28_0.genFontSize = 0
			var_28_0.genNameInterval = 0
			var_28_0.tipFrameX = 0
			var_28_0.tipFrameWidth = 0
			var_28_0.tipFrameHeight = 0
			var_28_0.tipStartY = 0
		end

		local var_28_1

		if conf.language == "vie" or conf.language == "tha" then
			var_28_1 = CCScale9Sprite:createWithSpriteFrameName("tavern_tip2.png")

			var_28_1:setPreferredSize(CCSizeMake(300 + var_28_0.tipFrameWidth, 314 + var_28_0.tipFrameHeight))
		else
			var_28_1 = CCSprite:createWithSpriteFrameName("tavern_tip2.png")
		end

		local var_28_2 = CCStrokeLabelTTF:create(language.get(83021), "Thonburi-Bold", 24 + var_28_0.genTitleFontSize)

		var_28_2:setColor(ccc3(234, 219, 185))
		var_28_2:setPosition(ccp(var_28_1:getContentSize().width * 0.5, var_28_1:getContentSize().height - 10 - var_28_2:getContentSize().height * 0.5))
		var_28_1:addChild(var_28_2)

		local var_28_3 = 5
		local var_28_4 = 248 + var_28_0.tipStartY
		local var_28_5 = 1
		local var_28_6 = var_28_3
		local var_28_7 = var_28_4

		for iter_28_0, iter_28_1 in pairs(arg_28_0.action.data.dropGenerals) do
			local var_28_8 = CCStrokeLabelTTF:create(iter_28_1.name, "Thonburi-Bold", 22 + var_28_0.genFontSize)

			var_28_8:setColor(colorQuality[iter_28_1.quality])
			var_28_8:setPosition(ccp(var_28_6 + var_28_8:getContentSize().width * 0.5, var_28_7))
			var_28_1:addChild(var_28_8)

			var_28_5 = var_28_5 + 1

			if var_28_5 > 3 then
				var_28_5 = 1
				var_28_6 = var_28_3
				var_28_7 = var_28_7 - 25
			else
				var_28_6 = var_28_6 + 75 + var_28_0.genNameInterval
			end
		end

		var_28_1:setPosition(ccp(805 + var_28_0.tipFrameX, 310))
		var_1_1:addChild(var_28_1, 100, TAG_TAVERN_TIPS)
	end

	function var_1_0.getCanDropGeneral()
		if var_1_2 then
			cmgr.sendRequest(var_1_0.handlerCanDropGeneral, actions.getCanDropGeneral, var_1_2)
		end
	end

	local function var_1_13(arg_30_0, arg_30_1, arg_30_2)
		if arg_30_0 == CCTOUCHBEGAN then
			local var_30_0 = var_1_1:getChildByTag(TAG_TAVERN_TIPS)

			while var_30_0 do
				var_1_1:removeChild(var_30_0, true)

				var_30_0 = var_1_1:getChildByTag(TAG_TAVERN_TIPS)
			end

			return true
		elseif arg_30_0 == CCTOUCHMOVED then
			-- block empty
		elseif arg_30_0 == CCTOUCHENDED then
			-- block empty
		end
	end

	var_1_1:setTouchEnabled(true)
	var_1_1:registerScriptTouchHandler(var_1_13)
	var_1_6()
	var_1_4()

	return var_1_1
end
