tool.requireRes("nation/nationTab")

nationTabUI = {}
nationTabUI.uiTable = nil
nationTabUI.tipUiTable = nil

local var_0_0 = nationTabControl
local var_0_1 = nationTabUI

nationTabUI.open = false

function nationTabUI.showTips()
	local var_1_0 = smgr.getLayer("nationTabLayer")

	if nationTabUI.open then
		nationTabUI.tipUiTable.tipsBg:removeFromParentAndCleanup(true)

		nationTabUI.tipUiTable = nil
		nationTabUI.open = false
	else
		nationTabUI.tipUiTable = autoUI.initUI(var_1_0, getNationTipsData())

		local var_1_1 = nationTabUI.tipUiTable.tipsBg:getContentSize().height

		if var_1_1 > visibleSize.height then
			nationTabUI.tipUiTable.tipsBg:setScale(visibleSize.height / var_1_1)
		end

		nationTabUI.open = true
	end
end

local function var_0_2()
	local var_2_0 = tool.hexToRgb("#D9EDC5")

	return {
		x = 0,
		name = "bg",
		y = 0,
		type = "pic",
		anchorPointX = 0,
		anchorPointY = 0,
		pic = "res/ui/nation/kingNotice/gwgg_bg.png",
		children = {
			{
				fontSize = 30,
				y = 320,
				type = "label",
				x = 322,
				strokeSize = 2,
				text = language.get(91019),
				color = var_2_0,
				strokeColor = ccc3(22, 18, 13)
			},
			{
				y = 0,
				x = 0,
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/nation/kingNotice/gwgg_btn_arrows_c.png",
						name = "btn_show",
						pic1 = "res/ui/nation/kingNotice/gwgg_btn_arrows.png",
						y = 325,
						x = -40,
						children = {
							{
								x = 47.5,
								y = 38,
								pic = "res/ui/nation/kingNotice/gwgg_btn_pen.png",
								type = "pic"
							}
						}
					},
					{
						pic2 = "res/ui/nation/kingNotice/gwgg_btn_arrows_c.png",
						name = "btn_hide",
						pic1 = "res/ui/nation/kingNotice/gwgg_btn_arrows.png",
						y = 325,
						x = 50
					},
					{
						pic2 = "res/ui/common/button/public_btn_red_c.png",
						name = "btn_cancel",
						pic1 = "res/ui/common/button/public_btn_red.png",
						y = 45,
						x = 182
					},
					{
						pic2 = "res/ui/common/button/public_btn_green_c.png",
						name = "btn_update",
						pic1 = "res/ui/common/button/public_btn_green.png",
						y = 45,
						x = 462
					}
				}
			},
			{
				x = 50,
				y = 325,
				pic = "res/ui/nation/kingNotice/gwgg_btn_pen.png",
				type = "pic"
			},
			{
				fontSize = 24,
				y = 48,
				type = "label",
				x = 182,
				strokeSize = 2,
				text = language.get(10002),
				color = var_2_0,
				strokeColor = ccc3(22, 18, 13)
			},
			{
				fontSize = 24,
				y = 48,
				type = "label",
				x = 462,
				strokeSize = 2,
				text = language.get(91022),
				color = var_2_0,
				strokeColor = ccc3(22, 18, 13)
			},
			{
				fontSize = 30,
				name = "lbl_input",
				text = "",
				type = "label",
				y = 213,
				x = 322,
				color = ccc3(235, 209, 167)
			}
		}
	}
end

function nationTabUI.effectShowKingNotice()
	if var_0_1.scrollLayer then
		var_0_1.uiTable.btn_show:setVisible(false)
		var_0_1.uiTable.shilianItem:setEnabled(false)
		var_0_1.uiTable.shengjiItem:setEnabled(false)

		local var_3_0 = CCArray:create()

		var_3_0:addObject(CCMoveTo:create(0.5, ccp(0, 0)))
		var_3_0:addObject(CCCallFuncN:create(function()
			return
		end))

		local var_3_1 = CCSequence:create(var_3_0)

		var_0_1.scrollLayer:runAction(var_3_1)
	end
end

function nationTabUI.effectHideKingNotice()
	if var_0_1.scrollLayer then
		local var_5_0 = CCArray:create()

		var_5_0:addObject(CCMoveTo:create(0.5, ccp(644, 0)))
		var_5_0:addObject(CCCallFuncN:create(function()
			var_0_1.uiTable.btn_show:setVisible(true)
			var_0_1.uiTable.shilianItem:setEnabled(true)
			var_0_1.uiTable.shengjiItem:setEnabled(true)
		end))

		local var_5_1 = CCSequence:create(var_5_0)

		var_0_1.scrollLayer:runAction(var_5_1)
	end
end

function nationTabUI.initKingNotice()
	local var_7_0 = smgr.getLayer("nationTabLayer")
	local var_7_1 = CCLayerColor:create(ccc4(0, 255, 0, 0), 644, 359)
	local var_7_2 = CCScrollView:create(CCSizeMake(644, 359), var_7_1)

	var_7_2:setPosition(ccp(visibleSize.width * 0.5 - 187, visibleSize.height * 0.5 - 247))
	var_7_2:setDirection(kCCScrollViewDirectionHorizontal)
	var_7_2:setTouchEnabled(false)
	autoUI.createUI(var_7_1, var_0_2(), var_0_1.uiTable)
	var_7_0:addChild(var_7_2, 200)
	var_0_1.uiTable.btn_hide:setScaleX(-1)
	var_0_1.uiTable.lbl_input:setDimensions(CCSizeMake(610, 150))
	var_0_1.uiTable.lbl_input:setHorizontalAlignment(kCCTextAlignmentLeft)
	var_0_1.uiTable.lbl_input:setVerticalAlignment(kCCVerticalTextAlignmentTop)
	var_7_1:setPosition(ccp(644, 0))

	var_0_1.scrollLayer = var_7_1

	var_0_1.uiTable.btn_show:registerScriptTapHandler(function()
		var_0_1.effectShowKingNotice()
		var_0_0.getKingNoticeInfo()

		if user.isNewKing then
			var_0_1.arrow:removeFromParentAndCleanup(true)
			roleDialogue.control.loadSpeak(1523)

			user.isNewKing = nil
		end
	end)
	var_0_1.uiTable.btn_hide:registerScriptTapHandler(function()
		var_0_1.effectHideKingNotice()
	end)
	var_0_1.uiTable.btn_cancel:registerScriptTapHandler(function()
		var_0_1.effectHideKingNotice()
	end)
	var_0_1.uiTable.btn_update:registerScriptTapHandler(function()
		local var_11_0 = var_0_1.uiTable.lbl_input:getString()

		if string.len(var_11_0) > 0 then
			var_0_0.updateKingNotice(var_11_0)
		end
	end)

	local var_7_3 = CCScale9Sprite:create("res/ui/playerInfo/setting/set_fk_input_bg_small.jpg")
	local var_7_4 = CCEditBox:create(CCSizeMake(620, 50), var_7_3)

	var_7_4:setPosition(ccp(322, 105))
	var_7_4:setMaxLength(100)
	var_7_4:setReturnType(1)
	var_7_4:setPlaceHolder(language.get(91024))
	var_7_4:setInputMode(kEditBoxInputModeAny)
	var_7_4:registerScriptEditBoxHandler(var_0_0.clickEditBoxHandle)
	var_7_4:setFontSize(25)
	var_0_1.uiTable.bg:addChild(var_7_4)

	var_0_1.editBox = var_7_4

	if user.isNewKing then
		local var_7_5 = CCSprite:create("res/ui/guide/jiantou-xia.png")
		local var_7_6, var_7_7 = var_0_1.uiTable.tipItem:getPosition()

		var_7_5:setPosition(ccp(var_7_6 + 20, var_7_7 - 80))
		var_7_0:addChild(var_7_5, 400)

		var_0_1.arrow = var_7_5

		local var_7_8 = CCJumpBy:create(1, ccp(0, 0), 40, 1)

		var_7_5:runAction(CCRepeatForever:create(var_7_8))
	end
end

function nationTabUI.init()
	local var_12_0 = smgr.getLayer("nationTabLayer")

	nationTabUI.uiTable = autoUI.initUI(var_12_0, getNationTabData())

	nationTabUI.uiTable.tipItem:registerScriptTapHandler(nationTabUI.showTips)
	nationTabUI.uiTable.shilianItem:registerScriptTapHandler(var_0_0.startShilian)
	nationTabUI.uiTable.shengjiItem:registerScriptTapHandler(var_0_0.startShengji)

	if var_0_0.isKing and var_0_0.canEditKingNotice then
		nationTabUI.initKingNotice()
	end
end

function nationTabUI.show()
	local var_13_0 = createBaseLayer()

	smgr.registerLayer(var_13_0, "nationTabLayer")

	var_13_0.onEnter = var_0_0.onEnter
	var_13_0.onExit = var_0_0.onExit

	var_0_0.getNationInfo()
	var_13_0:setTouchEnabled(true)
	var_13_0:registerScriptTouchHandler(var_0_0.onTouch)

	return var_13_0
end
