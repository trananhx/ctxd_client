local var_0_0 = require("lua/component/BaseUI")

return {
	create = function(arg_1_0)
		local var_1_0 = {}

		var_1_0.displayObj = nil
		var_1_0.text = ""

		var_0_0.extend(var_1_0)

		function var_1_0.create(arg_2_0)
			arg_1_0.style = arg_1_0.style or "label_default"

			local var_2_0 = styles.getStyle(arg_1_0.style)

			arg_1_0.fontSize = arg_1_0.fontSize or var_2_0.fontSize
			arg_1_0.font = arg_1_0.font or var_2_0.font

			if arg_1_0.textId then
				log.info("@@ textid ", arg_1_0.textId)

				var_1_0.text = language.get(arg_1_0.textId)
			end

			if arg_1_0.text then
				var_1_0.text = arg_1_0.text
			end

			arg_1_0.halign = arg_1_0.halign or var_2_0.halign

			if var_2_0.stroke then
				local var_2_1 = var_2_0.strokeColor or ccc3(255, 255, 255)
				local var_2_2 = var_2_0.strokeSize or 1

				var_1_0.displayObj = CCStrokeLabelTTF:create(var_1_0.text, arg_1_0.font, arg_1_0.fontSize, var_2_2, var_2_1)
			else
				var_1_0.displayObj = CCLabelTTF:create(var_1_0.text, arg_1_0.font, arg_1_0.fontSize)
			end

			var_1_0:initBaseUI(arg_1_0)

			if arg_1_0.halign ~= nil then
				var_1_0.displayObj:setHorizontalAlignment(arg_1_0.halign)
			end

			if arg_1_0.valign ~= nil then
				var_1_0.displayObj:setVerticalAlignment(arg_1_0.valign)
			end

			if arg_1_0.width or arg_1_0.height then
				arg_1_0.width = arg_1_0.width or arg_1_0.fontSize * string.len(arg_1_0.text)
				arg_1_0.height = arg_1_0.height or arg_1_0.fontSize

				var_1_0.displayObj:setDimensions(CCSizeMake(arg_1_0.width, arg_1_0.height))
			end

			if arg_1_0.color then
				var_1_0.displayObj:setColor(arg_1_0.color)
			elseif var_2_0.color then
				var_1_0.displayObj:setColor(var_2_0.color)
			end

			if arg_1_0.anchor then
				var_1_0.displayObj:setAnchorPoint(arg_1_0.anchor)
			elseif var_2_0.anchor then
				var_1_0.displayObj:setAnchorPoint(var_2_0.anchor)
			end
		end

		var_1_0:create()

		return var_1_0
	end
}
