local var_0_0 = require("lua/component/BaseUI")

return {
	create = function(arg_1_0, arg_1_1)
		local var_1_0 = {}

		var_1_0.displayObj = nil

		var_0_0.extend(var_1_0)

		function var_1_0.create(arg_2_0)
			arg_1_0.style = arg_1_0.style or "button_default"

			local var_2_0 = styles.getStyle(arg_1_0.style)

			arg_1_0.normal = arg_1_0.normal or var_2_0.normal
			arg_1_0.touched = arg_1_0.touched or var_2_0.touched
			arg_1_0.disable = arg_1_0.disable or var_2_0.disable
			arg_1_0.selected = arg_1_0.selected or var_2_0.selected
			arg_1_0.w = arg_1_0.w or var_2_0.width
			arg_1_0.h = arg_1_0.h or var_2_0.height
			arg_1_0.zoomOnTouchDown = arg_1_0.zoomOnTouchDown or var_2_0.zoomOnTouchDown

			local var_2_1

			if arg_1_0.normal then
				if arg_1_0.normal.frame then
					var_2_1 = CCScale9Sprite:createWithSpriteFrameName(arg_1_0.normal.path)
				else
					var_2_1 = CCScale9Sprite:create(arg_1_0.normal.path)
				end

				if arg_1_0.normal.child then
					local var_2_2 = uiutil.initUIComponent(nil, nil, arg_1_0.normal.child)

					var_2_1:addChild(var_2_2.displayObj)
				end
			end

			if arg_1_1 then
				var_1_0.displayObj = CCControlButton:create(arg_1_1, var_2_1)
			else
				var_1_0.displayObj = CCControlButton:create(var_2_1)
			end

			if arg_1_0.w and arg_1_0.h then
				var_1_0.displayObj:setPreferredSize(CCSizeMake(arg_1_0.w, arg_1_0.h))
			end

			if arg_1_0.touched then
				local var_2_3

				if arg_1_0.touched.frame then
					var_2_3 = CCScale9Sprite:createWithSpriteFrameName(arg_1_0.touched.path)
				else
					var_2_3 = CCScale9Sprite:create(arg_1_0.touched.path)
				end

				if arg_1_0.touched.child then
					local var_2_4 = uiutil.initUIComponent(nil, nil, arg_1_0.touched.child)

					var_2_3:addChild(var_2_4.displayObj)
				end

				var_1_0.displayObj:setBackgroundSpriteForState(var_2_3, CCControlStateHighlighted)
			end

			if arg_1_0.disable then
				local var_2_5

				if arg_1_0.disable.frame then
					var_2_5 = CCScale9Sprite:createWithSpriteFrameName(arg_1_0.disable.path)
				else
					var_2_5 = CCScale9Sprite:create(arg_1_0.disable.path)
				end

				if arg_1_0.disable.child then
					local var_2_6 = uiutil.initUIComponent(nil, nil, arg_1_0.disable.child)

					var_2_5:addChild(var_2_6.displayObj)
				end

				var_1_0.displayObj:setBackgroundSpriteForState(var_2_5, CCControlStateDisabled)
			end

			if arg_1_0.selected then
				local var_2_7

				if arg_1_0.selected.frame then
					var_2_7 = CCScale9Sprite:createWithSpriteFrameName(arg_1_0.selected.path)
				else
					var_2_7 = CCScale9Sprite:create(arg_1_0.selected.path)
				end

				if arg_1_0.selected.child then
					local var_2_8 = uiutil.initUIComponent(nil, nil, arg_1_0.selected.child)

					var_2_7:addChild(var_2_8.displayObj)
				end

				var_1_0.displayObj:setBackgroundSpriteForState(var_2_7, CCControlStateSelected)
			end

			if arg_1_0.zoomOnTouchDown ~= nil then
				var_1_0.displayObj:setZoomOnTouchDown(arg_1_0.zoomOnTouchDown)
			end

			if arg_1_0.enable then
				var_1_0.displayObj:setEnabled(arg_1_0.enable)
			end

			if arg_1_0.labelAnchorPoint then
				var_1_0.displayObj:setLabelAnchorPoint(arg_1_0.labelAnchorPoint)
			end

			var_1_0:initBaseUI(arg_1_0)
		end

		var_1_0:create()

		return var_1_0
	end
}
