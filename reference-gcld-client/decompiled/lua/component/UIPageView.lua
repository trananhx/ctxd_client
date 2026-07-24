local var_0_0 = import(".UIPageViewItem")
local var_0_1 = class("UIPageView", function()
	return (CCLayer:create())
end)

function var_0_1.ctor(arg_2_0, arg_2_1)
	arg_2_0.items_ = {}
	arg_2_0.viewRect_ = {
		x = 0,
		y = 0,
		width = arg_2_1.width or visibleSize.width,
		height = arg_2_1.height or visibleSize.height
	}
	arg_2_0.column_ = arg_2_1.column or 1
	arg_2_0.row_ = arg_2_1.row or 1
	arg_2_0.columnSpace_ = arg_2_1.columnSpace or 0
	arg_2_0.rowSpace_ = arg_2_1.rowSpace or 0
	arg_2_0.padding_ = arg_2_1.padding or {
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	}
	arg_2_0.bCirc = arg_2_1.bCirc or false

	local var_2_0 = CCScrollView:create()

	var_2_0:setTouchEnabled(false)

	local var_2_1 = CCLayerColor:create(ccc4(255, 0, 0, 0))

	var_2_0:setContainer(var_2_1)
	arg_2_0:addChild(var_2_0)

	arg_2_0.scrollView_ = var_2_0
	arg_2_0.layer_ = var_2_1

	arg_2_0:setClippingRegion(arg_2_0.viewRect_)
	arg_2_0:setTouchEnabled(true)
	arg_2_0:registerScriptTouchHandler(function(...)
		return arg_2_0:onTouch_(...)
	end, false, true)
end

function var_0_1.setClippingRegion(arg_4_0, arg_4_1)
	arg_4_0.scrollView_:setViewSize(CCSizeMake(arg_4_1.width, arg_4_1.height))
	arg_4_0.layer_:setContentSize(CCSizeMake(arg_4_1.width, arg_4_1.height))
	arg_4_0:setContentSize(CCSizeMake(arg_4_1.width, arg_4_1.height))
end

function var_0_1.newItem(arg_5_0)
	local var_5_0 = var_0_0.new()
	local var_5_1 = (arg_5_0.viewRect_.width - arg_5_0.padding_.left - arg_5_0.padding_.right - arg_5_0.columnSpace_ * (arg_5_0.column_ - 1)) / arg_5_0.column_
	local var_5_2 = (arg_5_0.viewRect_.height - arg_5_0.padding_.top - arg_5_0.padding_.bottom - arg_5_0.rowSpace_ * (arg_5_0.row_ - 1)) / arg_5_0.row_

	var_5_0:setContentSize(CCSizeMake(var_5_1, var_5_2))

	return var_5_0
end

function var_0_1.addItem(arg_6_0, arg_6_1)
	table.insert(arg_6_0.items_, arg_6_1)

	return arg_6_0
end

function var_0_1.removeItem(arg_7_0, arg_7_1)
	local var_7_0

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.items_) do
		if iter_7_1 == arg_7_1 then
			var_7_0 = iter_7_0
		end
	end

	if not var_7_0 then
		return arg_7_0
	end

	if var_7_0 then
		table.remove(arg_7_0.items_, var_7_0)
	end

	arg_7_0:reload(arg_7_0.curPageIdx_)

	return arg_7_0
end

function var_0_1.removeAllItems(arg_8_0)
	arg_8_0.items_ = {}

	arg_8_0:reload(arg_8_0.curPageIdx_)

	return arg_8_0
end

function var_0_1.onTouch(arg_9_0, arg_9_1)
	arg_9_0.touchListener = arg_9_1

	return arg_9_0
end

function var_0_1.reload(arg_10_0, arg_10_1)
	local var_10_0
	local var_10_1

	arg_10_0.pages_ = {}

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.items_) do
		iter_10_1:retain()
	end

	arg_10_0.layer_:removeAllChildrenWithCleanup(true)

	local var_10_2 = arg_10_0:getPageCount()

	if var_10_2 < 1 then
		return arg_10_0
	end

	if var_10_2 > 0 then
		for iter_10_2 = 1, var_10_2 do
			local var_10_3 = arg_10_0:createPage_(iter_10_2)

			var_10_3:setVisible(false)
			table.insert(arg_10_0.pages_, var_10_3)
			arg_10_0.layer_:addChild(var_10_3)
		end
	end

	if not arg_10_1 or arg_10_1 < 1 then
		arg_10_1 = 1
	elseif var_10_2 < arg_10_1 then
		arg_10_1 = var_10_2
	end

	arg_10_0.curPageIdx_ = arg_10_1

	arg_10_0.pages_[arg_10_1]:setVisible(true)
	arg_10_0.pages_[arg_10_1]:setPosition(arg_10_0.viewRect_.x, arg_10_0.viewRect_.y)

	for iter_10_3, iter_10_4 in ipairs(arg_10_0.items_) do
		iter_10_4:release()
	end

	return arg_10_0
end

function var_0_1.gotoPage(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	if arg_11_1 < 1 or arg_11_1 > arg_11_0:getPageCount() then
		return arg_11_0
	end

	if arg_11_1 == arg_11_0.curPageIdx_ and arg_11_2 then
		return arg_11_0
	end

	if arg_11_2 then
		arg_11_0:resetPagePos(arg_11_1, arg_11_3)
		arg_11_0:scrollPagePos(arg_11_1, arg_11_3)
	else
		arg_11_0.pages_[arg_11_0.curPageIdx_]:setVisible(false)
		arg_11_0.pages_[arg_11_1]:setVisible(true)
		arg_11_0.pages_[arg_11_1]:setPosition(arg_11_0.viewRect_.x, arg_11_0.viewRect_.y)

		arg_11_0.curPageIdx_ = arg_11_1

		arg_11_0:notifyListener_({
			name = "pageChange"
		})
	end

	return arg_11_0
end

function var_0_1.getPageCount(arg_12_0)
	return math.ceil(table.nums(arg_12_0.items_) / (arg_12_0.column_ * arg_12_0.row_))
end

function var_0_1.getCurPageIdx(arg_13_0)
	return arg_13_0.curPageIdx_
end

function var_0_1.setCirculatory(arg_14_0, arg_14_1)
	arg_14_0.bCirc = arg_14_1

	return arg_14_0
end

function var_0_1.createPage_(arg_15_0, arg_15_1)
	local var_15_0 = CCNode:create()
	local var_15_1
	local var_15_2 = arg_15_0.row_ * arg_15_0.column_ * (arg_15_1 - 1) + 1
	local var_15_3
	local var_15_4
	local var_15_5 = (arg_15_0.viewRect_.width - arg_15_0.padding_.left - arg_15_0.padding_.right - arg_15_0.columnSpace_ * (arg_15_0.column_ - 1)) / arg_15_0.column_
	local var_15_6 = (arg_15_0.viewRect_.height - arg_15_0.padding_.top - arg_15_0.padding_.bottom - arg_15_0.rowSpace_ * (arg_15_0.row_ - 1)) / arg_15_0.row_
	local var_15_7 = false

	for iter_15_0 = 1, arg_15_0.row_ do
		for iter_15_1 = 1, arg_15_0.column_ do
			local var_15_8 = arg_15_0.items_[var_15_2]

			var_15_2 = var_15_2 + 1

			if not var_15_8 then
				var_15_7 = true

				break
			end

			var_15_0:addChild(var_15_8)
			var_15_8:setAnchorPoint(ccp(0.5, 0.5))
			var_15_8:setPosition(arg_15_0.padding_.left + (iter_15_1 - 1) * arg_15_0.columnSpace_ + iter_15_1 * var_15_5 - var_15_5 / 2, arg_15_0.viewRect_.height - arg_15_0.padding_.top - (iter_15_0 - 1) * arg_15_0.rowSpace_ - iter_15_0 * var_15_6 + var_15_6 / 2)
		end

		if var_15_7 then
			break
		end
	end

	var_15_0:setTag(1500 + arg_15_1)

	return var_15_0
end

function var_0_1.isTouchInViewRect_(arg_16_0, arg_16_1, arg_16_2)
	arg_16_2 = arg_16_2 or arg_16_0.viewRect_

	local var_16_0 = arg_16_0:convertToWorldSpace(ccp(arg_16_2.x, arg_16_2.y))

	var_16_0.width = arg_16_2.width
	var_16_0.height = arg_16_2.height

	return ccRectContainsPoint(var_16_0, ccp(arg_16_1.x, arg_16_1.y))
end

function ccRectContainsPoint(arg_17_0, arg_17_1)
	local var_17_0 = false

	if arg_17_1.x >= arg_17_0.x and arg_17_1.x <= arg_17_0.x + arg_17_0.width and arg_17_1.y >= arg_17_0.y and arg_17_1.y <= arg_17_0.y + arg_17_0.height then
		var_17_0 = true
	end

	return var_17_0
end

function var_0_1.onTouch_(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	arg_18_1 = {
		x = arg_18_2,
		y = arg_18_3,
		name = arg_18_1
	}

	if arg_18_1.name == "moved" then
		arg_18_1.prevX = arg_18_0._prevX
	end

	if arg_18_1.name == "began" and not arg_18_0:isTouchInViewRect_(arg_18_1) then
		return false
	end

	if arg_18_1.name == "began" then
		arg_18_0._prevX = arg_18_2

		arg_18_0:stopAllTransition()

		arg_18_0.bDrag_ = false
	elseif arg_18_1.name == "moved" then
		arg_18_0.bDrag_ = true
		arg_18_0.speed = arg_18_1.x - arg_18_1.prevX

		arg_18_0:scroll(arg_18_0.speed)

		arg_18_0._prevX = arg_18_2
	elseif arg_18_1.name == "ended" then
		if arg_18_0.bDrag_ then
			arg_18_0:scrollAuto()
		else
			arg_18_0:resetPages_()
			arg_18_0:onClick_(arg_18_1)
		end
	end

	return true
end

function var_0_1.resetPages_(arg_19_0)
	local var_19_0, var_19_1 = arg_19_0.pages_[arg_19_0.curPageIdx_]:getPosition()

	if var_19_0 == arg_19_0.viewRect_.x then
		return
	end

	arg_19_0:disablePage()
	arg_19_0:gotoPage(arg_19_0.curPageIdx_)
end

function var_0_1.resetPagePos(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_0.curPageIdx_
	local var_20_1
	local var_20_2 = arg_20_0.viewRect_.width
	local var_20_3
	local var_20_4 = #arg_20_0.pages_
	local var_20_5 = arg_20_1 - var_20_0

	if arg_20_0.bCirc then
		local var_20_6
		local var_20_7

		if var_20_5 > 0 then
			var_20_7 = var_20_5
			var_20_6 = var_20_7 - var_20_4
		else
			var_20_6 = var_20_5
			var_20_7 = var_20_6 + var_20_4
		end

		if arg_20_2 == nil then
			var_20_5 = math.abs(var_20_6) > math.abs(var_20_7) and var_20_7 or var_20_6
		elseif arg_20_2 then
			var_20_5 = var_20_7
		else
			var_20_5 = var_20_6
		end
	end

	local var_20_8 = math.abs(var_20_5)
	local var_20_9 = arg_20_0.pages_[var_20_0]:getPosition()

	for iter_20_0 = 1, var_20_8 do
		if var_20_5 > 0 then
			var_20_0 = var_20_0 + 1
			var_20_9 = var_20_9 + var_20_2
		else
			var_20_0 = var_20_0 + var_20_4
			var_20_0 = var_20_0 - 1
			var_20_9 = var_20_9 - var_20_2
		end

		var_20_0 = var_20_0 % var_20_4

		if var_20_0 == 0 then
			var_20_0 = var_20_4
		end

		local var_20_10 = arg_20_0.pages_[var_20_0]

		if var_20_10 then
			var_20_10:setVisible(true)
			var_20_10:setPosition(var_20_9, arg_20_0.viewRect_.y)
		end
	end
end

function var_0_1.scrollPagePos(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_0.curPageIdx_
	local var_21_1
	local var_21_2 = arg_21_0.viewRect_.width
	local var_21_3
	local var_21_4 = #arg_21_0.pages_
	local var_21_5 = arg_21_1 - var_21_0

	if arg_21_0.bCirc then
		local var_21_6
		local var_21_7

		if var_21_5 > 0 then
			var_21_7 = var_21_5
			var_21_6 = var_21_7 - var_21_4
		else
			var_21_6 = var_21_5
			var_21_7 = var_21_6 + var_21_4
		end

		if arg_21_2 == nil then
			var_21_5 = math.abs(var_21_6) > math.abs(var_21_7) and var_21_7 or var_21_6
		elseif arg_21_2 then
			var_21_5 = var_21_7
		else
			var_21_5 = var_21_6
		end
	end

	local var_21_8 = math.abs(var_21_5)
	local var_21_9 = arg_21_0.viewRect_.x
	local var_21_10 = var_21_5 * var_21_2

	for iter_21_0 = 1, var_21_8 do
		if var_21_5 > 0 then
			var_21_0 = var_21_0 + 1
		else
			var_21_0 = var_21_0 + var_21_4
			var_21_0 = var_21_0 - 1
		end

		var_21_0 = var_21_0 % var_21_4

		if var_21_0 == 0 then
			var_21_0 = var_21_4
		end

		local var_21_11 = arg_21_0.pages_[var_21_0]

		if var_21_11 then
			var_21_11:setVisible(true)
			transitionmoveBy(var_21_11, {
				time = 0.3,
				y = 0,
				x = -var_21_10
			})
		end
	end

	transitionmoveBy(arg_21_0.pages_[arg_21_0.curPageIdx_], {
		time = 0.3,
		y = 0,
		x = -var_21_10,
		onComplete = function()
			local var_22_0 = (arg_21_0.curPageIdx_ + var_21_5 + var_21_4) % var_21_4

			if var_22_0 == 0 then
				var_22_0 = var_21_4
			end

			arg_21_0.curPageIdx_ = var_22_0

			arg_21_0:disablePage()
			arg_21_0:notifyListener_({
				name = "pageChange"
			})
		end
	})
end

function var_0_1.stopAllTransition(arg_23_0)
	for iter_23_0, iter_23_1 in ipairs(arg_23_0.pages_) do
		if not tolua.isnull(iter_23_1) then
			iter_23_1:stopAllActions()
		end
	end
end

function var_0_1.disablePage(arg_24_0)
	local var_24_0 = arg_24_0.curPageIdx_
	local var_24_1

	for iter_24_0, iter_24_1 in ipairs(arg_24_0.pages_) do
		if iter_24_0 ~= arg_24_0.curPageIdx_ then
			iter_24_1:setVisible(false)
		end
	end
end

function var_0_1.scroll(arg_25_0, arg_25_1)
	local var_25_0 = {}
	local var_25_1

	if arg_25_0.pages_ then
		var_25_1 = #arg_25_0.pages_
	else
		var_25_1 = 0
	end

	local var_25_2

	if var_25_1 == 0 then
		return
	elseif var_25_1 == 1 then
		table.insert(var_25_0, false)
		table.insert(var_25_0, arg_25_0.pages_[arg_25_0.curPageIdx_])
	elseif var_25_1 == 2 then
		local var_25_3, var_25_4 = arg_25_0.pages_[arg_25_0.curPageIdx_]:getPosition()

		if var_25_3 > arg_25_0.viewRect_.x then
			local var_25_5 = arg_25_0:getNextPage(false) or false

			table.insert(var_25_0, var_25_5)
			table.insert(var_25_0, arg_25_0.pages_[arg_25_0.curPageIdx_])
		else
			table.insert(var_25_0, false)
			table.insert(var_25_0, arg_25_0.pages_[arg_25_0.curPageIdx_])
			table.insert(var_25_0, arg_25_0:getNextPage(true))
		end
	else
		local var_25_6 = arg_25_0:getNextPage(false) or false

		table.insert(var_25_0, var_25_6)
		table.insert(var_25_0, arg_25_0.pages_[arg_25_0.curPageIdx_])
		table.insert(var_25_0, arg_25_0:getNextPage(true))
	end

	arg_25_0:scrollLCRPages(var_25_0, arg_25_1)
end

function var_0_1.scrollLCRPages(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0
	local var_26_1
	local var_26_2 = arg_26_1[1]
	local var_26_3 = arg_26_1[2]
	local var_26_4 = arg_26_1[3]
	local var_26_5, var_26_6 = var_26_3:getPosition()
	local var_26_7 = var_26_6
	local var_26_8 = var_26_5 + arg_26_2

	var_26_3:setPosition(var_26_8, var_26_7)

	local var_26_9 = var_26_8 - arg_26_0.viewRect_.width

	if var_26_2 and type(var_26_2) ~= "boolean" then
		var_26_2:setPosition(var_26_9, var_26_7)

		if not var_26_2:isVisible() then
			var_26_2:setVisible(true)
		end
	end

	local var_26_10 = var_26_9 + arg_26_0.viewRect_.width * 2

	if var_26_4 then
		var_26_4:setPosition(var_26_10, var_26_7)

		if not var_26_4:isVisible() then
			var_26_4:setVisible(true)
		end
	end
end

function var_0_1.scrollAuto(arg_27_0)
	local var_27_0 = arg_27_0.pages_[arg_27_0.curPageIdx_]
	local var_27_1 = arg_27_0:getNextPage(false)
	local var_27_2 = arg_27_0:getNextPage(true)
	local var_27_3 = false
	local var_27_4, var_27_5 = var_27_0:getPosition()
	local var_27_6 = var_27_4 - arg_27_0.viewRect_.x
	local var_27_7 = arg_27_0.viewRect_.x + arg_27_0.viewRect_.width
	local var_27_8 = arg_27_0.viewRect_.x - arg_27_0.viewRect_.width
	local var_27_9 = #arg_27_0.pages_

	if var_27_9 == 0 then
		return
	elseif var_27_9 == 1 then
		var_27_1 = nil
		var_27_2 = nil
	end

	if (var_27_6 > arg_27_0.viewRect_.width / 2 or arg_27_0.speed > 10) and (arg_27_0.curPageIdx_ > 1 or arg_27_0.bCirc) and var_27_9 > 1 then
		var_27_3 = true
	elseif (-var_27_6 > arg_27_0.viewRect_.width / 2 or -arg_27_0.speed > 10) and (arg_27_0.curPageIdx_ < arg_27_0:getPageCount() or arg_27_0.bCirc) and var_27_9 > 1 then
		var_27_3 = true
	end

	if var_27_6 > 0 then
		if var_27_3 then
			transitionmoveTo(var_27_0, {
				time = 0.3,
				x = var_27_7,
				y = var_27_5,
				onComplete = function()
					arg_27_0.curPageIdx_ = arg_27_0:getNextPageIndex(false)

					arg_27_0:disablePage()
					arg_27_0:notifyListener_({
						name = "pageChange"
					})
				end
			})
			transitionmoveTo(var_27_1, {
				time = 0.3,
				x = arg_27_0.viewRect_.x,
				y = var_27_5
			})
		else
			transitionmoveTo(var_27_0, {
				time = 0.3,
				x = arg_27_0.viewRect_.x,
				y = var_27_5,
				onComplete = function()
					arg_27_0:disablePage()
					arg_27_0:notifyListener_({
						name = "pageChange"
					})
				end
			})

			if var_27_1 then
				transitionmoveTo(var_27_1, {
					time = 0.3,
					x = var_27_8,
					y = var_27_5
				})
			end
		end
	elseif var_27_3 then
		transitionmoveTo(var_27_0, {
			time = 0.3,
			x = var_27_8,
			y = var_27_5,
			onComplete = function()
				arg_27_0.curPageIdx_ = arg_27_0:getNextPageIndex(true)

				arg_27_0:disablePage()
				arg_27_0:notifyListener_({
					name = "pageChange"
				})
			end
		})
		transitionmoveTo(var_27_2, {
			time = 0.3,
			x = arg_27_0.viewRect_.x,
			y = var_27_5
		})
	else
		transitionmoveTo(var_27_0, {
			time = 0.3,
			x = arg_27_0.viewRect_.x,
			y = var_27_5,
			onComplete = function()
				arg_27_0:disablePage()
				arg_27_0:notifyListener_({
					name = "pageChange"
				})
			end
		})

		if var_27_2 then
			transitionmoveTo(var_27_2, {
				time = 0.3,
				x = var_27_7,
				y = var_27_5
			})
		end
	end
end

function transitionmoveTo(arg_32_0, arg_32_1)
	assert(not tolua.isnull(arg_32_0), "transitionmoveTo() - target is not cc.Node")

	local var_32_0 = arg_32_1.x or arg_32_0:getPositionX()
	local var_32_1 = arg_32_1.y or arg_32_0:getPositionY()
	local var_32_2 = CCMoveTo:create(arg_32_1.time, ccp(var_32_0, var_32_1))

	if arg_32_1.onComplete then
		var_32_2 = CCSequence:createWithTwoActions(var_32_2, CCCallFunc:create(arg_32_1.onComplete))
	end

	arg_32_0:runAction(var_32_2)
end

function transitionmoveBy(arg_33_0, arg_33_1)
	assert(not tolua.isnull(arg_33_0), "transitionmoveBy() - target is not cc.Node")

	local var_33_0 = arg_33_1.x or 0
	local var_33_1 = arg_33_1.y or 0
	local var_33_2 = CCMoveBy:create(arg_33_1.time, cc.p(var_33_0, var_33_1))

	if arg_33_1.onComplete then
		var_33_2 = CCSequence:createWithTwoActions(var_33_2, CCCallFunc:create(arg_33_1.onComplete))
	end

	arg_33_0:runAction(var_33_2)
end

function var_0_1.onClick_(arg_34_0, arg_34_1)
	local var_34_0
	local var_34_1
	local var_34_2 = (arg_34_0.viewRect_.width - arg_34_0.padding_.left - arg_34_0.padding_.right - arg_34_0.columnSpace_ * (arg_34_0.column_ - 1)) / arg_34_0.column_
	local var_34_3 = (arg_34_0.viewRect_.height - arg_34_0.padding_.top - arg_34_0.padding_.bottom - arg_34_0.rowSpace_ * (arg_34_0.row_ - 1)) / arg_34_0.row_
	local var_34_4 = {
		width = var_34_2,
		height = var_34_3
	}
	local var_34_5

	for iter_34_0 = 1, arg_34_0.row_ do
		var_34_4.y = arg_34_0.viewRect_.y + arg_34_0.viewRect_.height - arg_34_0.padding_.top - iter_34_0 * var_34_3 - (iter_34_0 - 1) * arg_34_0.rowSpace_

		for iter_34_1 = 1, arg_34_0.column_ do
			var_34_4.x = arg_34_0.viewRect_.x + arg_34_0.padding_.left + (iter_34_1 - 1) * (var_34_2 + arg_34_0.columnSpace_)

			if arg_34_0:isTouchInViewRect_(arg_34_1, var_34_4) then
				var_34_5 = (iter_34_0 - 1) * arg_34_0.column_ + iter_34_1

				break
			end
		end

		if var_34_5 then
			break
		end
	end

	if not var_34_5 then
		return
	end

	local var_34_6 = var_34_5 + arg_34_0.column_ * arg_34_0.row_ * (arg_34_0.curPageIdx_ - 1)

	arg_34_0:notifyListener_({
		name = "clicked",
		item = arg_34_0.items_[var_34_6],
		itemIdx = var_34_6
	})
end

function var_0_1.notifyListener_(arg_35_0, arg_35_1)
	if not arg_35_0.touchListener then
		return
	end

	arg_35_1.pageView = arg_35_0
	arg_35_1.pageIdx = arg_35_0.curPageIdx_

	arg_35_0.touchListener(arg_35_1)
end

function var_0_1.getNextPage(arg_36_0, arg_36_1)
	if not arg_36_0.pages_ then
		return
	end

	if arg_36_0.pages_ and #arg_36_0.pages_ < 2 then
		return
	end

	local var_36_0 = arg_36_0:getNextPageIndex(arg_36_1)

	return arg_36_0.pages_[var_36_0]
end

function var_0_1.getNextPageIndex(arg_37_0, arg_37_1)
	local var_37_0 = #arg_37_0.pages_
	local var_37_1

	if arg_37_1 then
		var_37_1 = arg_37_0.curPageIdx_ + 1
	else
		var_37_1 = arg_37_0.curPageIdx_ - 1
	end

	if arg_37_0.bCirc then
		var_37_1 = var_37_1 + var_37_0
		var_37_1 = var_37_1 % var_37_0

		if var_37_1 == 0 then
			var_37_1 = var_37_0
		end
	end

	return var_37_1
end

return var_0_1
