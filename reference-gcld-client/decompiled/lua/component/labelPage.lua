function createLabelButton(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	local var_1_0 = CCNode:create()
	local var_1_1 = 1
	local var_1_2 = 2
	local var_1_3 = 3

	var_1_0:addChild(arg_1_0, 1, var_1_1)
	arg_1_0:setVisible(true)
	var_1_0:addChild(arg_1_1, 1, var_1_2)
	arg_1_1:setVisible(false)

	local var_1_4 = CCSprite:create("res/ui/noticeIcon/icon_new.png")

	var_1_4:setPosition(ccp(-52, 11))
	var_1_0:addChild(var_1_4, 1, var_1_3)
	var_1_4:setVisible(false)

	if arg_1_3 and type(arg_1_3) == "table" and arg_1_3.isNew then
		var_1_4:setVisible(true)
	end

	function var_1_0.release(arg_2_0)
		local var_2_0 = arg_2_0:getChildByTag(var_1_1)

		if var_2_0 then
			var_2_0:setVisible(true)
		end

		local var_2_1 = arg_2_0:getChildByTag(var_1_2)

		if var_2_1 then
			var_2_1:setVisible(false)
		end
	end

	function var_1_0.onClick(arg_3_0)
		var_1_0:getParent():reorderChild(var_1_0, 1)

		local var_3_0 = arg_3_0:getChildByTag(var_1_1)

		if var_3_0 then
			var_3_0:setVisible(false)
		end

		local var_3_1 = arg_3_0:getChildByTag(var_1_2)

		if var_3_1 then
			var_3_1:setVisible(true)
		end

		amgr.playEffect(enumAudioFile.ui_click_common)

		if arg_1_2 then
			arg_1_2(arg_1_3)
		end
	end

	function var_1_0.onTouch(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = arg_4_0:getChildByTag(var_1_1)
		local var_4_1 = arg_4_0:getChildByTag(var_1_2)
		local var_4_2

		if var_4_0:isVisible() then
			var_4_2 = var_4_0
		else
			var_4_2 = var_4_1
		end

		if var_4_2 and arg_1_4 then
			return checkIfTouch(var_4_2, arg_4_1, arg_4_2)
		end

		return false
	end

	return var_1_0
end

function createLabelPage(arg_5_0)
	local var_5_0 = createBaseLayer()

	var_5_0.buttons = {}
	var_5_0.pressedButton = {}

	function var_5_0.addLabelButton(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5, arg_6_6, arg_6_7)
		if arg_6_7 == nil then
			arg_6_7 = true
		end

		local var_6_0 = createLabelButton(arg_6_1, arg_6_2, arg_6_4, arg_6_6, arg_6_7)

		var_6_0:setPosition(arg_6_3)
		arg_6_0:addChild(var_6_0, 0)
		table.insert(var_5_0.buttons, var_6_0)

		if arg_6_5 and arg_6_7 then
			arg_6_0.pressedButton = var_6_0

			arg_6_0.pressedButton:onClick(arg_6_6)
		end

		return var_6_0
	end

	local function var_5_1(arg_7_0, arg_7_1)
		local var_7_0

		for iter_7_0, iter_7_1 in pairs(var_5_0.buttons) do
			if iter_7_1:onTouch(arg_7_0, arg_7_1) then
				var_7_0 = iter_7_1

				break
			end
		end

		if var_7_0 then
			var_5_0.pressedButton = var_7_0

			var_5_0.pressedButton:onClick()

			for iter_7_2, iter_7_3 in pairs(var_5_0.buttons) do
				if iter_7_3 ~= var_7_0 then
					iter_7_3:release()
				end
			end
		end
	end

	local function var_5_2(arg_8_0, arg_8_1)
		return
	end

	local function var_5_3(arg_9_0, arg_9_1)
		return
	end

	local function var_5_4(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == CCTOUCHBEGAN then
			return var_5_1(arg_10_1, arg_10_2)
		elseif arg_10_0 == CCTOUCHMOVED then
			return var_5_2(arg_10_1, arg_10_2)
		elseif arg_10_0 == CCTOUCHENDED then
			return var_5_3(arg_10_1, arg_10_2)
		end
	end

	var_5_0:setTouchEnabled(true)
	var_5_0:registerScriptTouchHandler(var_5_4)

	return var_5_0
end
