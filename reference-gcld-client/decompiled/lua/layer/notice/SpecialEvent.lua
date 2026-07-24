local var_0_0 = class("SpecialEvent", function()
	return createBaseLayer()
end)

var_0_0.layout = {
	name = "panel",
	type = "sprite9",
	preferedSize = CCSizeMake(960, 580),
	middleRect = CCRectMake(30, 30, 45, 45),
	x = visibleSize.width / 2,
	y = visibleSize.height / 2 - 30,
	pic = {
		frame = true,
		path = "bigPanel.png"
	},
	children = {
		{
			x = 924,
			name = "btn_close",
			h = 33,
			type = "button",
			w = 32,
			y = 604,
			scale = 2,
			normal = {
				frame = true,
				path = "btn_close_a.png"
			},
			touched = {
				frame = true,
				path = "btn_close_c.png"
			}
		},
		{
			y = 290,
			name = "bg",
			type = "sprite",
			x = 480,
			pic = {
				path = "res/ui/welfareNotice/sw_view.jpg"
			},
			children = {
				{
					x = 457.5,
					y = 488,
					type = "sprite",
					pic = {
						path = "res/ui/noticeIcon/word_tssj.png"
					}
				}
			}
		}
	}
}
var_0_0.layout_card = {
	name = "bg",
	type = "sprite9",
	y = 0,
	x = 0,
	preferedSize = CCSizeMake(190, 144),
	middleRect = CCRectMake(0, 137, 190, 52),
	anchorPoint = ccp(0.5, 0),
	pic = {
		path = "res/ui/welfareNotice/sw_list_view_bg.jpg"
	},
	children = {
		{
			zoomOnTouchDown = true,
			name = "btn",
			h = 100,
			type = "button",
			w = 100,
			y = 72,
			x = 95,
			normal = {
				path = "res/default.png"
			},
			touched = {
				path = "res/default.png"
			},
			children = {
				{
					y = 50,
					name = "icon",
					x = 50,
					type = "sprite"
				}
			}
		}
	}
}

function var_0_0.onBtnCloseTap(arg_2_0)
	arg_2_0:removeFromParentAndCleanup(true)
end

function var_0_0.createList(arg_3_0)
	local function var_3_0(arg_4_0, arg_4_1)
		log.info("cell touched at : ", arg_4_1:getIdx())
	end

	local function var_3_1(arg_5_0, arg_5_1)
		return 154, 915
	end

	local function var_3_2(arg_6_0, arg_6_1)
		local var_6_0 = arg_6_0:dequeueCell()

		if var_6_0 then
			var_6_0:removeAllChildrenWithCleanup(true)
		else
			var_6_0 = CCTableViewCell:new()
		end

		for iter_6_0 = 1, 4 do
			local var_6_1 = arg_3_0.list[4 * arg_6_1 + iter_6_0]

			if var_6_1 then
				local var_6_2 = {}

				uiutil.initWidgets(var_6_2, arg_3_0.layout_card)
				var_6_2.widgets.bg:setPosition(127.5 + 220 * (iter_6_0 - 1), 10)
				var_6_0:addChild(var_6_2.widgets.bg)
				var_6_2.widgets.icon:setDisplayFrame(CCSprite:create("res/ui/noticeIcon/" .. var_6_1.image .. ".png"):displayFrame())
				var_6_2.widgets.btn:addHandleOfControlEvent(function()
					log.info("btn")

					if var_6_1.callback then
						var_6_1.callback()
					end
				end, CCControlEventTouchUpInside)

				local var_6_3 = var_6_2.widgets.icon

				if var_6_1.cornerNum and var_6_1.cornerNum > 0 then
					log.info("v.cornerNum")

					local var_6_4 = CCSprite:create("res/ui/noticeIcon/icon_number_view.png")

					var_6_4:setPosition(ccp(76, 47))
					var_6_4:setScale(0.9)

					if var_6_1.id == notice.constant.mjjs then
						var_6_4:setPosition(ccp(86, 49))
					end

					var_6_3:addChild(var_6_4)

					local var_6_5 = CCLabelAtlas:create(tostring(var_6_1.cornerNum), "res/ui/noticeIcon/icon_number.png", 17, 32, 48)

					var_6_5:setPosition(ccp(22, 24))
					var_6_5:setAnchorPoint(ccp(0.5, 0.5))
					var_6_4:addChild(var_6_5)
				end

				if var_6_1.id == notice.constant.discount and user.discountCountDown > 0 then
					log.info("@@ 限时优惠倒计时")

					local function var_6_6(arg_8_0)
						return tool.formatTime(arg_8_0, arg_8_0 > 3600000 and "@H:@M:@S" or "@M:@S")
					end

					local var_6_7 = CCStrokeLabelTTF:create(var_6_6(user.discountCountDown), "Bold", 26, 1)

					var_6_7:setColor(colorQuality[5])
					var_6_3:addChild(var_6_7)
					var_6_7:setPosition(ccp(53, -5))

					notice.ui.table.discount_timer = var_6_7

					local var_6_8 = CCArray:create()

					var_6_8:addObject(CCDelayTime:create(1))
					var_6_8:addObject(CCCallFuncN:create(function()
						user.discountCountDown = user.discountCountDown - 1000

						if user.discountCountDown <= 0 then
							notice.ui.table.discount_timer:removeFromParentAndCleanup(true)

							notice.ui.table.discount_timer = nil
							user.discountCountDown = 0

							notice.control.refreshLayer()
						else
							var_6_7:setString(var_6_6(user.discountCountDown))
						end
					end))

					local var_6_9 = CCSequence:create(var_6_8)

					var_6_7:runAction(CCRepeatForever:create(var_6_9))
				end

				if var_6_1.id == notice.constant.tjsj then
					notice.ui.quickCastingView = require("lua/layer/weaponTab/casting/CastingQuickView").new(var_6_3, user.quickCastingInfo)
				end

				if var_6_1.id == notice.constant.gonghe then
					log.info("@@ 恭贺")

					if user.player.gonghe > 1 then
						local var_6_10 = CCLabelAtlas:create(tostring(user.player.gonghe), "res/ui/common/number/lv_numb.png", 18, 23, 48)

						var_6_10:setAnchorPoint(ccp(1, 0.5))
						var_6_10:setPosition(96, 60)
						var_6_3:addChild(var_6_10)
					end
				end
			else
				break
			end
		end

		return var_6_0
	end

	local function var_3_3()
		local var_10_0 = arg_3_0.list

		if var_10_0 and #var_10_0 > 0 then
			return math.ceil(#var_10_0 / 4)
		else
			return 0
		end
	end

	local var_3_4 = CCTableView:create(CCSizeMake(915, 416))

	var_3_4:setPosition(0, 20)
	var_3_4:setDirection(kCCScrollViewDirectionVertical)
	var_3_4:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_3_0.view.widgets.bg:addChild(var_3_4)

	if arg_3_0.iconList then
		arg_3_0.iconList:removeFromParentAndCleanup(true)
	end

	arg_3_0.iconList = var_3_4

	var_3_4:registerScriptHandler(var_3_0, CCTableView.kTableCellTouched)
	var_3_4:registerScriptHandler(var_3_1, CCTableView.kTableCellSizeForIndex)
	var_3_4:registerScriptHandler(var_3_2, CCTableView.kTableCellSizeAtIndex)
	var_3_4:registerScriptHandler(var_3_3, CCTableView.kNumberOfCellsInTableView)
	var_3_4:reloadData()
end

function var_0_0.showPanel(arg_11_0)
	arg_11_0.list = {}

	for iter_11_0, iter_11_1 in ipairs(notice.data) do
		local var_11_0 = false
		local var_11_1 = 0

		if iter_11_1.submenu ~= nil then
			for iter_11_2, iter_11_3 in ipairs(iter_11_1.submenu) do
				if iter_11_3.isVisible == true then
					var_11_1 = var_11_1 + 1
				end
			end

			if var_11_1 > 0 then
				var_11_0 = true
			end
		else
			var_11_0 = iter_11_1.isVisible
		end

		if iter_11_1.outside == true then
			var_11_0 = false
		end

		if var_11_0 then
			table.insert(arg_11_0.list, deepcopy(iter_11_1))
		end
	end

	arg_11_0:createList()
end

function var_0_0.ctor(arg_12_0, arg_12_1)
	arg_12_0.view = {}

	uiutil.initWidgets(arg_12_0.view, arg_12_0.layout)
	arg_12_0:addChild(arg_12_0.view.widgets.panel)

	if arg_12_1 then
		arg_12_1:addChild(arg_12_0)
	end

	swallowTouch(arg_12_0)
	arg_12_0.view.widgets.btn_close:addHandleOfControlEvent(function()
		log.info("btn_close")
		arg_12_0:onBtnCloseTap()
	end, CCControlEventTouchUpInside)
	arg_12_0:showPanel()
end

function var_0_0.onEnter(arg_14_0)
	arg_14_0.showPanelRef = handler(arg_14_0, arg_14_0.showPanel)

	eventManager.registerEvent("updateNoticeIcon", arg_14_0.showPanelRef)
end

function var_0_0.onExit(arg_15_0)
	eventManager.unregisterEvent("updateNoticeIcon", arg_15_0.showPanelRef)
end

return var_0_0
