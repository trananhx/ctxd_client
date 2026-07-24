require("lua/component/labelPage")
require("lua/layer/betrayResult/uidata")
require("lua/layer/betrayResult/control")

betrayResultUI = {}
betrayResultUI.uiTable = {}

local var_0_0 = betrayResultControl

function betrayResultUI.show(arg_1_0)
	amgr.playEffect(enumAudioFile.ui_dialog_open)

	if arg_1_0 == nil then
		arg_1_0 = 1
	end

	local var_1_0 = createBaseLayer()

	smgr.registerLayer(var_1_0, "betrayResultLayer")

	betrayResultUI.uiTable = autoUI.initUI(var_1_0, getBetrayResultData())

	local function var_1_1()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.getLayer("topLayer"):removeChild(var_1_0, true)
	end

	betrayResultUI.uiTable.closeItem:registerScriptTapHandler(var_1_1)
	var_0_0.initControl(var_1_0)

	local var_1_2 = {}
	local var_1_3 = 1
	local var_1_4 = true

	if user.displayBetrayers == 1 then
		local var_1_5 = arg_1_0 == 1 and true or false
		local var_1_6 = {
			pageIndex = 1,
			name = language.get(135436),
			callback = function()
				var_0_0.onListLabelClick()
			end,
			default = var_1_5
		}

		var_1_6.pageIndex = 1

		table.insert(var_1_2, var_1_3, var_1_6)

		var_1_3 = var_1_3 + 1

		local var_1_7 = false
	end

	if user.havaBetrayReward == 1 then
		local var_1_8 = arg_1_0 == 2 and true or false
		local var_1_9 = {
			pageIndex = 2,
			name = language.get(135437),
			callback = function()
				var_0_0.onRewardLabelClick()
			end,
			default = var_1_8
		}

		var_1_9.pageIndex = 2

		table.insert(var_1_2, var_1_3, var_1_9)

		local var_1_10 = var_1_3 + 1
		local var_1_11 = false
	end

	local var_1_12 = CCScale9Sprite:createWithSpriteFrameName("bigPanel.png")

	var_1_12:setPreferredSize(CCSizeMake(960, 581))
	var_1_12:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 28))
	var_1_0:addChild(var_1_12, 0)

	local var_1_13 = createLabelPage()

	for iter_1_0, iter_1_1 in pairs(var_1_2) do
		local var_1_14 = CCSprite:createWithSpriteFrameName("labelButon_light.png")
		local var_1_15 = CCSprite:createWithSpriteFrameName("labelButton_noraml.png")
		local var_1_16 = CCStrokeLabelTTF:create(iter_1_1.name, "Thonburi-Bold", 26)

		var_1_16:setColor(ccc3(255, 255, 209))
		var_1_16:setPosition(ccp(var_1_14:getContentSize().width * 0.5, var_1_14:getContentSize().height * 0.4))
		var_1_14:addChild(var_1_16)

		local var_1_17 = CCStrokeLabelTTF:create(iter_1_1.name, "Thonburi-Bold", 26)

		var_1_17:setColor(ccc3(204, 187, 135))
		var_1_17:setPosition(ccp(var_1_15:getContentSize().width * 0.5, var_1_15:getContentSize().height * 0.4))
		var_1_15:addChild(var_1_17)

		local var_1_18 = visibleSize.width / 2 - var_1_12:getContentSize().width / 2 + var_1_14:getContentSize().width * iter_1_0 - var_1_14:getContentSize().width * 0.5 + 30
		local var_1_19 = visibleSize.height / 2 + var_1_12:getContentSize().height / 2 - 2
		local var_1_20 = var_1_13:addLabelButton(var_1_15, var_1_14, ccp(var_1_18, var_1_19), iter_1_1.callback, iter_1_1.default)

		log.info("item.pageIndex: ", iter_1_1.pageIndex, var_1_20)

		guide.curMenuItems[iter_1_1.pageIndex] = var_1_20
	end

	betrayResultUI.uiTable.closeItem:setScale(2)

	local var_1_21 = visibleSize.width / 2 + var_1_12:getContentSize().width / 2 - betrayResultUI.uiTable.closeItem:getContentSize().width
	local var_1_22 = visibleSize.height / 2 + var_1_12:getContentSize().height / 2

	betrayResultUI.uiTable.closeItem:setPosition(ccp(var_1_21 - 5, var_1_22 - 5))
	var_1_0:addChild(var_1_13)

	local function var_1_23(arg_5_0, arg_5_1, arg_5_2)
		return true
	end

	var_1_0:setTouchEnabled(true)
	var_1_0:registerScriptTouchHandler(var_1_23, false, true)

	function var_1_0.onEnter()
		return
	end

	function var_1_0.onExit()
		return
	end

	local var_1_24 = smgr.getLayer("topLayer")

	var_1_24:removeAllChildrenWithCleanup(true)
	var_1_24:addChild(var_1_0)
end
