require("lua/layer/general/constant")
require("lua/layer/general/generalSelectPanel")
require("lua/layer/general/control")
require("lua/component/labelPage")

if conf.language == "vie" or conf.language == "tha" then
	require("lua/layer/general/generalSelectPanel2")
end

function showGeneralPanel(arg_1_0, arg_1_1)
	amgr.playEffect(enumAudioFile.ui_dialog_open)

	arg_1_0 = arg_1_0 or 1

	if arg_1_0 == nil then
		arg_1_0 = 1
	end

	rmgr.loadResource("res/ui/general/general.plist")

	local var_1_0 = CCScale9Sprite:createWithSpriteFrameName("bigPanel.png")

	var_1_0:setPreferredSize(CCSizeMake(960, 581))
	var_1_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 28))

	local var_1_1 = newControl(var_1_0, arg_1_1)
	local var_1_2 = {}
	local var_1_3 = 1
	local var_1_4 = true
	local var_1_5 = true

	if user.getFunc(2) then
		var_1_4 = arg_1_0 == 1 and true or false

		local var_1_6 = {
			name = language.get(80001),
			callback = function()
				var_1_1.onGeneralLabelClick()

				if not var_1_5 then
					log.info(" is not default value")
					guide.control.setCurrentMarkTrace("panel:2:1")
				end
			end,
			default = var_1_4
		}

		var_1_6.pageIndex = 1

		table.insert(var_1_2, var_1_3, var_1_6)

		var_1_3 = var_1_3 + 1
		var_1_4 = false
	end

	if user.getFunc(45) and not arg_1_1 then
		var_1_4 = arg_1_0 == 3 and true or false

		local var_1_7 = {
			name = language.get(80003),
			callback = function()
				var_1_1.onTavernLabelClick()

				if not var_1_5 then
					log.info(" is not default value")
					guide.control.setCurrentMarkTrace("panel:2:3")
				end
			end,
			default = var_1_4
		}

		var_1_7.pageIndex = 3

		table.insert(var_1_2, var_1_3, var_1_7)

		var_1_3 = var_1_3 + 1
		var_1_4 = false
	end

	if user.getFunc(33) and not arg_1_1 then
		var_1_4 = arg_1_0 == 4 and true or false

		local var_1_8 = {
			name = language.get(80004),
			callback = function()
				var_1_1.onBanquestLabelClick()

				if not var_1_5 then
					log.info(" is not default value")
					guide.control.setCurrentMarkTrace("panel:2:4")
				end
			end,
			default = var_1_4
		}

		var_1_8.pageIndex = 4

		table.insert(var_1_2, var_1_3, var_1_8)

		var_1_3 = var_1_3 + 1
		var_1_4 = false
	end

	if user.getFunc(52) and not arg_1_1 then
		var_1_4 = arg_1_0 == 5 and true or false

		local var_1_9 = {
			name = language.get(80005),
			callback = function()
				var_1_1.onPrisonLabelClick()

				if not var_1_5 then
					log.info(" is not default value")
					guide.control.setCurrentMarkTrace("panel:2:5")
				end
			end,
			default = var_1_4
		}

		var_1_9.pageIndex = 5

		table.insert(var_1_2, var_1_3, var_1_9)

		var_1_3 = var_1_3 + 1
		var_1_4 = false
	end

	if user.getFunc(64) and not arg_1_1 then
		var_1_4 = arg_1_0 == 6 and true or false

		local var_1_10 = {
			name = language.get(80006),
			callback = function()
				var_1_1.onWarlockLabelClick()

				if not var_1_5 then
					guide.control.setCurrentMarkTrace("panel:2:6")
				end
			end,
			default = var_1_4
		}

		var_1_10.pageIndex = 6

		table.insert(var_1_2, var_1_3, var_1_10)

		var_1_3 = var_1_3 + 1
		var_1_4 = false
	end

	if conf.debug or game.newVersion.debug ~= nil and game.newVersion.debug ~= 0 then
		local var_1_11 = {
			name = "GM指令",
			pageIndex = 7,
			callback = function()
				var_1_1.clearPanel()
				require("lua/layer/gmLayer")

				local var_7_0 = gmLayer.show(layer)

				var_1_1.changeLabelPage(var_7_0, 999)
			end,
			default = var_1_4
		}

		table.insert(var_1_2, var_1_3, var_1_11)
	end

	local var_1_12 = createLabelPage()

	for iter_1_0, iter_1_1 in pairs(var_1_2) do
		local var_1_13 = CCSprite:createWithSpriteFrameName("labelButon_light.png")
		local var_1_14 = CCSprite:createWithSpriteFrameName("labelButton_noraml.png")
		local var_1_15 = CCStrokeLabelTTF:create(iter_1_1.name, "Thonburi-Bold", 26)

		var_1_15:setColor(ccc3(255, 255, 209))
		var_1_15:setPosition(ccp(var_1_13:getContentSize().width * 0.5, var_1_13:getContentSize().height * 0.4))
		var_1_13:addChild(var_1_15)

		local var_1_16 = CCStrokeLabelTTF:create(iter_1_1.name, "Thonburi-Bold", 26)

		var_1_16:setColor(ccc3(204, 187, 135))
		var_1_16:setPosition(ccp(var_1_14:getContentSize().width * 0.5, var_1_14:getContentSize().height * 0.4))
		var_1_14:addChild(var_1_16)

		local var_1_17 = var_1_13:getContentSize().width * iter_1_0 - var_1_13:getContentSize().width * 0.5 + 30
		local var_1_18 = var_1_0:getContentSize().height + var_1_13:getContentSize().height * 0.5 - 2
		local var_1_19 = var_1_12:addLabelButton(var_1_14, var_1_13, ccp(var_1_17, var_1_18), iter_1_1.callback, iter_1_1.default)

		guide.curMenuItems[iter_1_1.pageIndex] = var_1_19
	end

	var_1_0:addChild(var_1_12)

	local var_1_20 = CCMenu:create()

	var_1_20:setPosition(0, 0)

	local var_1_21 = CCSprite:createWithSpriteFrameName("btn_close_a.png")
	local var_1_22 = CCSprite:createWithSpriteFrameName("btn_close_c.png")
	local var_1_23 = CCMenuItemSprite:create(var_1_21, var_1_22)

	var_1_23:setScale(2)
	var_1_23:registerScriptTapHandler(var_1_1.closeItem)

	local var_1_24 = var_1_23:getContentSize()
	local var_1_25 = var_1_0:getContentSize()
	local var_1_26 = var_1_25.width - var_1_24.width
	local var_1_27 = var_1_25.height + var_1_24.height - 5

	var_1_23:setPosition(ccp(var_1_26 - 5, var_1_27 - 5))
	var_1_20:addChild(var_1_23)
	var_1_0:addChild(var_1_20)

	local function var_1_28(arg_8_0, arg_8_1, arg_8_2)
		return true
	end

	var_1_0:setTouchEnabled(true)
	var_1_0:registerScriptTouchHandler(var_1_28, false, true)
	initScriptEventNode(var_1_0)

	local var_1_29 = smgr.getLayer("topLayer")

	var_1_29:removeAllChildrenWithCleanup(true)
	var_1_29:addChild(var_1_0)
	guide.control.setCurrentMarkTrace("panel:2:" .. arg_1_0)

	var_1_5 = false
end
