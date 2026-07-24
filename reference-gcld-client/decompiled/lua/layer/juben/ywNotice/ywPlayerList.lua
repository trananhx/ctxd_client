local var_0_0 = class("ywPlayer", function()
	return createBaseLayer()
end)

var_0_0.layout = {
	name = "root",
	type = "node",
	x = visibleSize.width - 250 - 0.6 * platform.getSafeDistance(),
	y = visibleSize.height - 100,
	children = {
		{
			y = 64,
			name = "bg1",
			type = "sprite",
			x = 116,
			pic = {
				path = "res/ui/ywTask/jbyw_card_word_di.png"
			}
		},
		{
			fontSize = 24,
			name = "nation1",
			y = 65,
			type = "label",
			x = 50
		},
		{
			fontSize = 20,
			name = "ckzr1",
			y = 65,
			type = "label",
			x = 116,
			textId = 215160
		},
		{
			w = 42,
			name = "downBtn1",
			h = 30,
			type = "button",
			y = 65,
			x = 200,
			normal = {
				path = "res/ui/ywTask/jbyw_card_btn.png"
			},
			touched = {
				path = "res/ui/ywTask/jbyw_card_btn_c.png"
			}
		},
		{
			y = 32,
			name = "bg2",
			type = "sprite",
			x = 116,
			pic = {
				path = "res/ui/ywTask/jbyw_card_word_di.png"
			}
		},
		{
			fontSize = 24,
			name = "nation2",
			y = 33,
			type = "label",
			x = 50
		},
		{
			fontSize = 20,
			name = "ckzr2",
			y = 33,
			type = "label",
			x = 116,
			textId = 215160
		},
		{
			w = 42,
			name = "downBtn2",
			h = 30,
			type = "button",
			y = 33,
			x = 200,
			normal = {
				path = "res/ui/ywTask/jbyw_card_btn.png"
			},
			touched = {
				path = "res/ui/ywTask/jbyw_card_btn_c.png"
			}
		},
		{
			y = 0,
			name = "playerListBg",
			x = 0,
			type = "node"
		}
	}
}

function var_0_0.ctor(arg_2_0, arg_2_1, arg_2_2)
	log.info("@@ 演武阵容")

	arg_2_0.info = arg_2_1
	arg_2_0.view = {}

	uiutil.initWidgets(arg_2_0.view, arg_2_0.layout)
	arg_2_0:addChild(arg_2_0.view.widgets.root)
	arg_2_2:addChild(arg_2_0)
	arg_2_0.view.widgets.nation1:setString(user.forceIdToName[arg_2_1.attForceId])
	arg_2_0.view.widgets.nation1:setColor(colorForce[arg_2_1.attForceId])
	arg_2_0.view.widgets.nation2:setString(user.forceIdToName[arg_2_1.defForceId])
	arg_2_0.view.widgets.nation2:setColor(colorForce[arg_2_1.defForceId])
end

function var_0_0.createPlayerList(arg_3_0, arg_3_1, arg_3_2)
	local function var_3_0(arg_4_0, arg_4_1)
		return 30, 216
	end

	local function var_3_1(arg_5_0, arg_5_1)
		local var_5_0 = arg_5_0:dequeueCell()

		if var_5_0 then
			var_5_0:removeAllChildrenWithCleanup(true)
		else
			var_5_0 = CCTableViewCell:new()
		end

		local var_5_1 = arg_3_2[arg_5_1 + 1]

		if var_5_1 then
			local var_5_2

			if arg_5_1 % 2 == 1 then
				var_5_2 = CCSprite:create("res/ui/ywTask/jbyw_card_list02.png")
			else
				var_5_2 = CCSprite:create("res/ui/ywTask/jbyw_card_list01.png")
			end

			var_5_2:setAnchorPoint(ccp(0, 0.5))
			var_5_0:addChild(var_5_2)

			local var_5_3 = CCLabelTTF:create("Lv." .. var_5_1.lv .. "  " .. var_5_1.name, "", 20)

			if var_5_1.name == user.player.name then
				var_5_3:setColor(colorQuality[4])
			end

			var_5_3:setAnchorPoint(ccp(0, 0.5))
			var_5_3:setPosition(ccp(15, 0))
			var_5_0:addChild(var_5_3)
		end

		return var_5_0
	end

	local function var_3_2()
		local var_6_0 = arg_3_2

		if var_6_0 and #var_6_0 > 0 then
			return #var_6_0
		else
			return 0
		end
	end

	local var_3_3 = CCTableView:create(CCSizeMake(216, 200))

	var_3_3:setPosition(7, -170)
	var_3_3:setDirection(kCCScrollViewDirectionVertical)
	var_3_3:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_3_1:addChild(var_3_3)
	var_3_3:registerScriptHandler(var_3_0, CCTableView.kTableCellSizeForIndex)
	var_3_3:registerScriptHandler(var_3_1, CCTableView.kTableCellSizeAtIndex)
	var_3_3:registerScriptHandler(var_3_2, CCTableView.kNumberOfCellsInTableView)
	var_3_3:reloadData()
end

function var_0_0.onEnter(arg_7_0)
	local function var_7_0()
		arg_7_0.view.widgets.playerListBg:removeAllChildrenWithCleanup(true)

		if arg_7_0.view.widgets.downBtn2:getScale() < 0 then
			arg_7_0.view.widgets.downBtn2:setScale(-1 * arg_7_0.view.widgets.downBtn2:getScale())
		end

		local var_8_0 = arg_7_0.view.widgets.downBtn1:getScale()

		if var_8_0 < 0 then
			arg_7_0.view.widgets.playerListBg:setVisible(false)
		else
			arg_7_0:createPlayerList(arg_7_0.view.widgets.playerListBg, arg_7_0.info.attPlayers)
			arg_7_0.view.widgets.playerListBg:setVisible(true)
		end

		arg_7_0.view.widgets.downBtn1:setScale(-1 * var_8_0)
	end

	local function var_7_1()
		arg_7_0.view.widgets.playerListBg:removeAllChildrenWithCleanup(true)

		if arg_7_0.view.widgets.downBtn1:getScale() < 0 then
			arg_7_0.view.widgets.downBtn1:setScale(-1 * arg_7_0.view.widgets.downBtn1:getScale())
		end

		local var_9_0 = arg_7_0.view.widgets.downBtn2:getScale()

		if var_9_0 < 0 then
			arg_7_0.view.widgets.playerListBg:setVisible(false)
		else
			arg_7_0:createPlayerList(arg_7_0.view.widgets.playerListBg, arg_7_0.info.defPlayers)
			arg_7_0.view.widgets.playerListBg:setVisible(true)
		end

		arg_7_0.view.widgets.downBtn2:setScale(-1 * var_9_0)
	end

	arg_7_0.view.widgets.downBtn1:addHandleOfControlEvent(var_7_0, CCControlEventTouchUpInside)
	arg_7_0.view.widgets.downBtn2:addHandleOfControlEvent(var_7_1, CCControlEventTouchUpInside)
end

function var_0_0.onExit(arg_10_0)
	return
end

return var_0_0
