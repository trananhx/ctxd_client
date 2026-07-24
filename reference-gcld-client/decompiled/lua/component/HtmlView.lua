local var_0_0 = require("lua/common/html")

return {
	parseHtmlToList = function(arg_1_0, arg_1_1, arg_1_2)
		for iter_1_0, iter_1_1 in pairs(arg_1_1) do
			if iter_1_0 ~= "_attr" and iter_1_0 ~= "_tag" and type(iter_1_1) == "string" then
				local var_1_0 = "#d9cc8f"
				local var_1_1 = "label"
				local var_1_2 = 26
				local var_1_3
				local var_1_4 = iter_1_1

				if arg_1_1._tag and arg_1_1._tag == "font" and arg_1_1._attr then
					var_1_0 = arg_1_1._attr.color
					var_1_2 = arg_1_1._attr.size or 26
				elseif arg_1_1._tag and arg_1_1._tag == "button" then
					var_1_1 = "button"
				elseif arg_1_1._tag and arg_1_1._tag == "a" then
					var_1_1 = "link"

					if arg_1_1._attr then
						if arg_1_1._attr.href then
							var_1_3 = arg_1_1._attr.href
						end

						if arg_1_1._attr.color then
							var_1_0 = arg_1_1._attr.color
						end
					end
				end

				table.insert(arg_1_2, {
					type = var_1_1,
					text = var_1_4,
					color = var_1_0,
					data = var_1_3,
					size = var_1_2
				})
			elseif type(iter_1_1) == "table" and iter_1_1._tag then
				if iter_1_1._tag == "br" then
					table.insert(arg_1_2, {
						type = "br"
					})
				else
					arg_1_0:parseHtmlToList(iter_1_1, arg_1_2)
				end
			end
		end
	end,
	create = function(arg_2_0, arg_2_1)
		arg_2_1.htmlText = arg_2_1.htmlText or ""
		arg_2_1.onOpenUrl = arg_2_1.onOpenUrl or nil
		arg_2_1.rowWidth = arg_2_1.rowWidth or 100
		arg_2_1.rowHeight = arg_2_1.rowHeihgt or 24
		arg_2_1.singleLine = arg_2_1.singleLine or false
		arg_2_1.anchorX = arg_2_1.anchorX or 0

		local var_2_0 = var_0_0.parsestr(arg_2_1.htmlText)

		if var_2_0 then
			local var_2_1 = {}

			arg_2_0:parseHtmlToList(var_2_0, var_2_1)

			local var_2_2 = {}

			for iter_2_0, iter_2_1 in pairs(var_2_1) do
				local var_2_3

				if iter_2_1.type == "label" then
					var_2_3 = CCLabelTTF:create(iter_2_1.text, "Thonburi", iter_2_1.size)

					var_2_3:setColor(tool.hexToRgb(iter_2_1.color))
				elseif iter_2_1.type == "link" then
					var_2_3 = CCControlButton:create(iter_2_1.text, "Thonburi", iter_2_1.size)

					if iter_2_1.color then
						local var_2_4 = tool.hexToRgb(iter_2_1.color)

						var_2_3:setTitleColorForState(var_2_4, CCControlStateNormal)
						var_2_3:setTitleColorForState(var_2_4, CCControlStateHighlighted)
						var_2_3:setTitleColorForState(var_2_4, CCControlStateSelected)
					end

					local var_2_5 = CCString:create(iter_2_1.data)

					var_2_3:setUserObject(var_2_5)

					if arg_2_1.onOpenUrl then
						var_2_3:addHandleOfControlEvent(arg_2_1.onOpenUrl, CCControlEventTouchUpInside)
					end
				elseif iter_2_1.type == "br" then
					var_2_3 = CCNode:create()
					var_2_3.stype = "br"
				end

				if var_2_3 then
					table.insert(var_2_2, var_2_3)
				end
			end

			local var_2_6

			if arg_2_1.singleLine then
				var_2_6 = createRichNode(var_2_2, arg_2_1.anchorX)
			elseif conf.language == "tha" then
				var_2_6 = createMultiLineRichNode2(var_2_2, {
					width = arg_2_1.rowWidth,
					height = arg_2_1.rowHeight
				})
			elseif conf.language == "vie" then
				var_2_6 = createMultiLineRichNode(var_2_2, {
					width = arg_2_1.rowWidth,
					height = arg_2_1.rowHeight,
					rowheight = arg_2_1.rowHeight or 0
				})
			else
				var_2_6 = createMultiLineRichNode(var_2_2, {
					width = arg_2_1.rowWidth,
					height = arg_2_1.rowHeight
				})
			end

			return var_2_6
		end

		return nil
	end
}
