local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.leftTimeX = 30
else
	var_0_0.leftTimeX = 0
end

local var_0_1 = {}
local var_0_2 = {}
local var_0_3 = tool.hexToRgb("#EADAC4")
local var_0_4 = colorQuality[3]
local var_0_5 = colorQuality[2]
local var_0_6 = colorQuality[5]
local var_0_7 = colorQuality[4]
local var_0_8 = colorQuality[6]

local function var_0_9()
	return {
		kfzbViewBg = {
			xcenter = 0,
			name = "bg",
			type = "pic_9",
			ycenter = -28,
			pic = "frame:bigPanel.png",
			middleRect = CCRectMake(51, 51, 1, 1),
			preferedSize = CCSizeMake(960, 581),
			children = {
				{
					x = 97,
					y = 607,
					pic = "frame:labelButon_light.png",
					type = "pic"
				},
				{
					fontSize = 26,
					font = "Thonburi-Bold",
					type = "label",
					y = 601.4,
					x = 97,
					strokeSize = 1,
					text = language.get(135111),
					color = ccc3(255, 255, 209)
				},
				{
					xcenter = -6,
					ycenter = 0,
					pic = "res/ui/activity/acti_view_bg.jpg",
					type = "pic"
				},
				{
					xcenter = 55,
					ycenter = 215,
					pic = "res/ui/common/text/discount/xsyh_title.png",
					type = "pic"
				},
				{
					xcenter = 15,
					ycenter = 130,
					pic = "res/ui/common/text/discount/xsyh_subhead.png",
					type = "pic"
				},
				{
					fontSize = 24,
					font = "Thonburi",
					name = "leftTime",
					type = "label",
					ycenter = 130,
					strokeSize = 2,
					x = 810 + var_0_0.leftTimeX,
					color = var_0_6
				},
				{
					x = 600,
					y = 215,
					type = "pic_9",
					pic = "res/ui/discount/xsyh_icon_bg.png",
					middleRect = CCRectMake(25, 23, 1, 1),
					preferedSize = CCSizeMake(475, 300)
				}
			}
		},
		closeMenu = {
			type = "button",
			buttons = {
				{
					pic2 = "frame:btn_close_c.png",
					name = "closeBtn",
					pic1 = "frame:btn_close_a.png",
					top = 5,
					right = 5
				}
			}
		}
	}
end

local function var_0_10(arg_2_0)
	return {
		y = 255,
		type = "pic",
		pic = "res/ui/discount/xsyh_icon_view.png",
		name = "itemCard" .. arg_2_0,
		x = 600 - (2 - arg_2_0) * 155,
		children = {
			{
				xcenter = 0,
				y = 102,
				type = "pic",
				visible = false,
				pic = "frame:baoshi1.jpg",
				name = "itemPic" .. arg_2_0
			},
			{
				xcenter = 0,
				type = "pic_9",
				y = 60,
				pic = "res/ui/noticeIcon/marquee_list.png",
				visible = false,
				name = "stateBg" .. arg_2_0,
				middleRect = CCRectMake(20, 10, 517, 20),
				preferedSize = CCSizeMake(160, 35)
			},
			{
				fontSize = 24,
				font = "Thonburi-Bold",
				type = "label",
				y = 30,
				strokeSize = 2,
				xcenter = 0,
				name = "itemName" .. arg_2_0,
				color = var_0_3
			},
			{
				xcenter = 0,
				y = -30,
				type = "button",
				buttons = {
					{
						pic2 = "frame:btn2_yel_c.png",
						pic1 = "frame:btn2_yel_a.png",
						name = "btn_buy" .. arg_2_0
					}
				}
			},
			{
				fontSize = 24,
				font = "Thonburi",
				type = "label",
				y = -30,
				strokeSize = 2,
				xcenter = 0,
				text = language.get(101018),
				color = var_0_3
			},
			{
				x = 40,
				y = -75,
				pic = "frame:res_icon_19_small.png",
				type = "pic"
			},
			{
				fontSize = 24,
				type = "label",
				anchorPointX = 0,
				strokeSize = 2,
				font = "Thonburi",
				y = -70,
				x = 60,
				name = "itemGold" .. arg_2_0,
				color = var_0_7
			}
		}
	}
end

local function var_0_11(arg_3_0)
	local var_3_0 = {}

	if conf.language == "vie" then
		var_3_0.frameWidth = 75
	else
		var_3_0.frameWidth = 0
	end

	return {
		anchorPointX = 0,
		name = "itemInfoFrame",
		type = "pic_9",
		anchorPointY = 0.5,
		pic = "frame:common_tip_frame_small.png",
		middleRect = CCRectMake(24, 24, 1, 1),
		preferedSize = CCSizeMake(170 + var_3_0.frameWidth, 110),
		children = {
			{
				fontSize = 26,
				font = "Thonburi",
				type = "label",
				ycenter = 30,
				left = 10,
				strokeSize = 1,
				text = arg_3_0.name,
				color = var_0_7
			},
			{
				fontSize = 24,
				font = "Thonburi",
				type = "label",
				ycenter = 0,
				left = 10,
				strokeSize = 1,
				text = language.get(30201, arg_3_0.lead),
				color = var_0_5
			},
			{
				fontSize = 24,
				font = "Thonburi",
				type = "label",
				ycenter = -30,
				left = 10,
				strokeSize = 1,
				text = language.get(30202, arg_3_0.strength),
				color = var_0_6
			}
		}
	}
end

local function var_0_12(arg_4_0)
	local var_4_0 = {}

	if conf.language == "vie" then
		var_4_0.frameWidth = 200
	else
		var_4_0.frameWidth = 0
	end

	local var_4_1 = 400
	local var_4_2 = {
		anchorPointX = 1,
		name = "itemInfoFrame",
		type = "pic_9",
		anchorPointY = 0.5,
		pic = "frame:common_tip_frame_small.png",
		middleRect = CCRectMake(24, 24, 1, 1),
		preferedSize = CCSizeMake(400 + var_4_0.frameWidth, var_4_1),
		children = {
			{
				fontSize = 26,
				font = "Thonburi",
				type = "label",
				strokeSize = 1,
				left = 10,
				text = arg_4_0.itemName,
				color = var_0_8
			},
			{
				fontSize = 22,
				font = "Thonburi",
				type = "label",
				strokeSize = 1,
				left = 10,
				text = language.get(30304),
				color = var_0_3
			},
			{
				fontSize = 24,
				font = "Thonburi",
				type = "label",
				strokeSize = 1,
				left = 10,
				text = language.get(30103, arg_4_0.att, arg_4_0.def, arg_4_0.blood),
				color = var_0_4
			},
			{
				fontSize = 22,
				font = "Thonburi",
				type = "label",
				strokeSize = 1,
				left = 10,
				text = language.get(30303),
				color = var_0_3
			},
			{
				fontSize = 24,
				name = "equipLb1",
				type = "label",
				anchorPointX = 0,
				x = 10,
				font = "Thonburi",
				strokeSize = 1,
				color = var_0_8,
				align = kCCTextAlignmentLeft
			},
			{
				fontSize = 24,
				name = "equipLb2",
				type = "label",
				anchorPointX = 0,
				x = 10,
				font = "Thonburi",
				strokeSize = 1,
				color = var_0_8,
				align = kCCTextAlignmentLeft
			},
			{
				fontSize = 24,
				name = "equipLb3",
				type = "label",
				anchorPointX = 0,
				x = 10,
				font = "Thonburi",
				strokeSize = 1,
				color = var_0_8,
				align = kCCTextAlignmentLeft
			},
			{
				fontSize = 24,
				name = "equipLb4",
				type = "label",
				anchorPointX = 0,
				x = 10,
				font = "Thonburi",
				strokeSize = 1,
				color = var_0_8,
				align = kCCTextAlignmentLeft
			},
			{
				fontSize = 24,
				name = "equipLb5",
				type = "label",
				anchorPointX = 0,
				x = 10,
				font = "Thonburi",
				strokeSize = 1,
				color = var_0_8,
				align = kCCTextAlignmentLeft
			},
			{
				fontSize = 24,
				name = "equipLb6",
				type = "label",
				anchorPointX = 0,
				x = 10,
				font = "Thonburi",
				strokeSize = 1,
				color = var_0_8,
				align = kCCTextAlignmentLeft
			},
			{
				fontSize = 22,
				font = "Thonburi",
				type = "label",
				strokeSize = 1,
				left = 10,
				text = language.get(30301),
				color = var_0_3
			},
			{
				fontSize = 24,
				font = "Thonburi",
				type = "label",
				left = 10,
				text = arg_4_0.suitIntro
			}
		}
	}

	for iter_4_0 = 1, #var_4_2.children do
		var_4_2.children[iter_4_0].y = var_4_1 - 30 * iter_4_0
	end

	return var_4_2
end

function var_0_1.show(arg_5_0)
	local var_5_0 = createBaseLayer()

	smgr.registerLayer(var_5_0, "discountLayer")
	var_5_0:setTouchEnabled(true)
	var_5_0:registerScriptTouchHandler(var_0_2.onTouch, false, true)

	var_5_0.onEnter = var_0_2.onEnter
	var_5_0.onExit = var_0_2.onExit

	local var_5_1 = smgr.getLayer("topLayer")

	var_5_1:removeAllChildrenWithCleanup(true)
	var_5_1:addChild(var_5_0)

	if var_0_1.uiTable then
		var_0_1.uiTable = nil
		var_0_1.cdTimeLabel = nil
	end

	var_0_1.uiTable = autoUI.initUI(var_5_0, var_0_9())

	local var_5_2 = var_0_1.uiTable.closeBtn

	var_5_2:setScale(2)

	local var_5_3 = var_5_2:getContentSize()
	local var_5_4 = var_0_1.uiTable.bg:getContentSize()
	local var_5_5 = visibleSize.width / 2 + var_5_4.width / 2 - var_5_3.width / 2 - 30
	local var_5_6 = visibleSize.height / 2 + var_5_4.height / 2 + var_5_3.height / 2 - 20

	var_5_2:setPosition(ccp(var_5_5, var_5_6))
	var_5_2:registerScriptTapHandler(var_0_1.onCloseBtnClicked)

	for iter_5_0 = 1, 3 do
		autoUI.createUI(var_0_1.uiTable.bg, var_0_10(iter_5_0), var_0_1.uiTable)
		var_0_1.uiTable["btn_buy" .. iter_5_0]:registerScriptTapHandler(function()
			var_0_2.buyDiscountGoods(iter_5_0)
		end)
	end

	if arg_5_0 and arg_5_0.countDown then
		var_0_1.updatePanel(arg_5_0)

		var_0_2.goodsInfoList = arg_5_0.goodsInfoList
	else
		var_0_2.getDiscountInfo()
	end
end

local function var_0_13(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0 / 1000

	if var_7_0 < 3600 then
		arg_7_1:setString("")

		local var_7_1 = createTimerLabel(var_7_0 * 1000, language.get(131003), "Thonburi", 22, nil, nil, nil, ccc3(255, 0, 0))

		arg_7_1:addChild(var_7_1)
	elseif var_7_0 < 86400 then
		local var_7_2 = var_7_0 / 3600

		arg_7_1:setString(language.get(131001, tool.toint(var_7_2)))
	else
		local var_7_3 = var_7_0 / 3600 / 24

		arg_7_1:setString(language.get(131002, tool.toint(var_7_3)))
	end
end

function var_0_1.updatePanel(arg_8_0)
	user.discountCountDown = arg_8_0.countDown

	notice.control.refreshLayer()
	var_0_13(arg_8_0.countDown, var_0_1.uiTable.leftTime)

	for iter_8_0 = 1, 3 do
		local var_8_0 = arg_8_0.goodsInfoList[iter_8_0]

		var_0_1.uiTable["itemName" .. iter_8_0]:setString(var_8_0.name or var_8_0.itemName)
		var_0_1.uiTable["itemGold" .. iter_8_0]:setString(var_8_0.cost)
		var_0_1.uiTable["itemPic" .. iter_8_0]:setVisible(true)
		var_0_1.uiTable["itemPic" .. iter_8_0]:setDisplayFrame(tool.spriteFrameByName(var_8_0.pic .. ".jpg"))
		var_0_1.uiTable["itemPic" .. iter_8_0]:removeAllChildrenWithCleanup(true)
		var_0_1.uiTable["stateBg" .. iter_8_0]:setVisible(false)

		if var_0_1.uiTable["buyState" .. iter_8_0] then
			var_0_1.uiTable["buyState" .. iter_8_0]:removeFromParentAndCleanup(true)

			var_0_1.uiTable["buyState" .. iter_8_0] = nil
		end

		if var_8_0.buyState == 0 then
			var_0_1.uiTable["btn_buy" .. iter_8_0]:setEnabled(true)
			rmgr.loadResource("res/anim/sdtj/itemLight.plist")

			local var_8_1 = CCSprite:create()

			var_8_1:setScaleX(-1)
			var_0_1.uiTable["itemPic" .. iter_8_0]:addChild(var_8_1)
			var_8_1:setPosition(ccp(36, 36))

			local var_8_2 = CCArray:create()

			for iter_8_1 = 1, 16 do
				local var_8_3 = CCSprite:createWithSpriteFrameName("itemLight_" .. iter_8_1 .. ".png")

				var_8_2:addObject(var_8_3:displayFrame())
			end

			local var_8_4 = CCAnimation:createWithSpriteFrames(var_8_2, 0.08)
			local var_8_5 = CCAnimate:create(var_8_4)

			var_8_1:runAction(CCRepeatForever:create(var_8_5))
		elseif var_8_0.buyState == 1 then
			var_0_1.uiTable["btn_buy" .. iter_8_0]:setEnabled(false)

			if var_8_0.type == 2 then
				if conf.language == "vie" then
					var_0_1.uiTable["stateBg" .. iter_8_0]:setVisible(true)

					local var_8_6 = CCSprite:create("res/ui/common/text/discount/xsyh_tit_jkq.png")
					local var_8_7 = CCLabelAtlas:create(var_8_0.buyLv, "res/ui/common/number/xsyh_tit_digit.png", 16, 20, 48)

					var_8_6:addChild(var_8_7)
					var_8_7:setPosition(ccp(54, 6))
					var_0_1.uiTable["stateBg" .. iter_8_0]:addChild(var_8_6)

					local var_8_8 = var_8_6:getContentSize()
					local var_8_9 = var_0_1.uiTable["stateBg" .. iter_8_0]:getContentSize()

					var_8_6:setPosition(ccp(0.5 * var_8_9.width, 0.5 * var_8_9.height))

					var_0_1.uiTable["buyState" .. iter_8_0] = var_8_8
				else
					var_0_1.uiTable["stateBg" .. iter_8_0]:setVisible(true)

					local var_8_10 = CCLabelAtlas:create(var_8_0.buyLv, "res/ui/common/number/xsyh_tit_digit.png", 16, 20, 48)

					var_8_10:setAnchorPoint(ccp(0.5, 0.5))

					local var_8_11 = CCSprite:create("res/ui/common/text/discount/xsyh_tit_jkq.png")
					local var_8_12 = createRichNode({
						var_8_10,
						var_8_11
					})

					var_0_1.uiTable["stateBg" .. iter_8_0]:addChild(var_8_12)

					local var_8_13 = var_0_1.uiTable["stateBg" .. iter_8_0]:getContentSize()
					local var_8_14 = var_8_10:getContentSize()
					local var_8_15 = var_8_11:getContentSize()

					var_8_12:setPosition(ccp(0.5 * (var_8_13.width - var_8_14.width - var_8_15.width), 0.5 * var_8_13.height))

					var_0_1.uiTable["buyState" .. iter_8_0] = var_8_12
				end
			end
		elseif var_8_0.buyState == 2 then
			var_0_1.uiTable["btn_buy" .. iter_8_0]:setEnabled(false)
			var_0_1.uiTable["stateBg" .. iter_8_0]:setVisible(true)

			local var_8_16 = CCSprite:create("res/ui/common/text/discount/xsyh_tit_yyy.png")

			var_0_1.uiTable["stateBg" .. iter_8_0]:addChild(var_8_16)

			local var_8_17 = var_0_1.uiTable["stateBg" .. iter_8_0]:getContentSize()

			var_8_16:setPosition(ccp(0.5 * var_8_17.width, 0.5 * var_8_17.height))

			var_0_1.uiTable["buyState" .. iter_8_0] = var_8_16
		end
	end
end

function var_0_1.onCloseBtnClicked()
	amgr.playEffect(enumAudioFile.ui_dialog_close)

	local var_9_0 = smgr.getLayer("topLayer")
	local var_9_1 = smgr.getLayer("discountLayer")

	var_9_0:removeChild(var_9_1, true)
end

function var_0_1.showItemTip(arg_10_0)
	local var_10_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_10_0:registerScriptTouchHandler(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == CCTOUCHBEGAN then
			return true
		elseif arg_11_0 == CCTOUCHMOVED then
			return true
		elseif arg_11_0 == CCTOUCHENDED then
			pcall(var_10_0.removeFromParentAndCleanup, var_10_0, true)

			return true
		end
	end, false, true)
	var_10_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_10_0, 60000)

	local var_10_1 = var_0_2.goodsInfoList[arg_10_0]

	if var_10_1.type == 1 then
		autoUI.createUI(var_10_0, var_0_11(var_10_1), var_0_1.uiTable)
	elseif var_10_1.type == 2 then
		autoUI.createUI(var_10_0, var_0_12(var_10_1), var_0_1.uiTable)

		for iter_10_0 = 1, 6 do
			var_0_1.uiTable["equipLb" .. iter_10_0]:setString(var_10_1.subEquips[iter_10_0].equipName)

			local var_10_2 = var_0_1.uiTable["equipLb" .. iter_10_0]:getContentSize()
			local var_10_3, var_10_4 = var_0_1.uiTable["equipLb" .. iter_10_0]:getPosition()
			local var_10_5 = CCStrokeLabelTTF:create(language.get(410005, var_10_1.subEquips[iter_10_0].skillName, var_10_1.subEquips[iter_10_0].skillLv), "Thonburi", 22)

			var_0_1.uiTable.itemInfoFrame:addChild(var_10_5)
			var_10_5:setAnchorPoint(ccp(0, 0.5))
			var_10_5:setPosition(ccp(var_10_3 + var_10_2.width + 10, var_10_4))
		end
	end

	local var_10_6, var_10_7 = tool.getPositionInScreen(var_0_1.uiTable["itemCard" .. arg_10_0])

	var_0_1.uiTable.itemInfoFrame:setPosition(ccp(var_10_6, var_10_7))
end

function var_0_2.onEnter()
	return
end

function var_0_2.onExit()
	return
end

function var_0_2.onTouch(arg_14_0, arg_14_1, arg_14_2)
	if arg_14_0 == CCTOUCHBEGAN then
		log.info("CCTOUCH_BEGAN", arg_14_1, arg_14_2)

		for iter_14_0 = 1, 3 do
			local var_14_0 = tolua.cast(var_0_1.uiTable["itemCard" .. iter_14_0], "CCSprite")

			if tool.checkIfTouch(var_14_0, arg_14_1, arg_14_2) then
				var_0_1.showItemTip(iter_14_0)
			end
		end

		return true
	elseif arg_14_0 == CCTOUCHMOVED then
		log.info("CCTOUCH_MOVED", arg_14_1, arg_14_2)

		return true
	elseif arg_14_0 == CCTOUCHENDED then
		log.info("CCTOUCH_ENDED", arg_14_1, arg_14_2)

		return true
	end
end

function var_0_2.getDiscountInfo()
	local function var_15_0(arg_16_0)
		var_0_1.updatePanel(arg_16_0.action.data)

		var_0_2.goodsInfoList = arg_16_0.action.data.goodsInfoList
	end

	cmgr.sendRequest(var_15_0, actions.getDiscountInfo)
end

function var_0_2.buyDiscountGoods(arg_17_0)
	local function var_17_0(arg_18_0)
		local var_18_0 = CCSprite:createWithSpriteFrameName(var_0_2.goodsInfoList[arg_17_0].pic .. ".jpg")

		var_0_1.uiTable.bg:addChild(var_18_0, 200)

		local var_18_1, var_18_2 = var_0_1.uiTable["itemCard" .. arg_17_0]:getPosition()

		var_18_0:setPosition(ccp(var_18_1, var_18_2))

		local var_18_3 = CCMoveTo:create(0.3, ccp(var_18_1, visibleSize.height * 0.6))
		local var_18_4 = CCDelayTime:create(0.3)
		local var_18_5 = CCMoveTo:create(0.5, ccp(0, visibleSize.height))
		local var_18_6 = CCScaleTo:create(0.5, 0.1)
		local var_18_7 = CCSpawn:createWithTwoActions(var_18_5, var_18_6)
		local var_18_8 = CCCallFuncN:create(function()
			var_18_0:removeFromParentAndCleanup(true)
			var_0_2.getDiscountInfo()
		end)
		local var_18_9 = CCArray:create()

		var_18_9:addObject(var_18_3)
		var_18_9:addObject(var_18_4)
		var_18_9:addObject(var_18_7)
		var_18_9:addObject(var_18_8)

		local var_18_10 = CCSequence:create(var_18_9)

		var_18_0:runAction(var_18_10)
	end

	messageBox.confirm(language.get(135112, var_0_2.goodsInfoList[arg_17_0].cost, var_0_2.goodsInfoList[arg_17_0].name or var_0_2.goodsInfoList[arg_17_0].itemName), function()
		cmgr.sendRequest(var_17_0, actions.buyDiscountGoods, arg_17_0)
	end)
end

return var_0_1
