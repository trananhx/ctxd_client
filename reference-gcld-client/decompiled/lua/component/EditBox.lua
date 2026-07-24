local var_0_0 = require("lua/component/BaseUI")

return {
	create = function(arg_1_0)
		local var_1_0 = {}

		var_1_0.displayObj = nil

		var_0_0.extend(var_1_0)

		function var_1_0.create(arg_2_0)
			arg_1_0.style = arg_1_0.style or "edit_default"

			local var_2_0 = styles.getStyle(arg_1_0.style)

			arg_1_0.background = arg_1_0.background or var_2_0.background

			local var_2_1

			if arg_1_0.background then
				if arg_1_0.background.frame then
					var_2_1 = CCScale9Sprite:createWithSpriteFrameName(arg_1_0.background.path)
				else
					var_2_1 = CCScale9Sprite:create(tool.resPath(arg_1_0.background.path))
				end
			end

			var_1_0.displayObj = CCEditBox:create(CCSizeMake(arg_1_0.w, arg_1_0.h), var_2_1)

			if var_2_0.font then
				var_1_0.displayObj:setFontName(var_2_0.font)
			end

			if var_2_0.fontSize then
				var_1_0.displayObj:setFontSize(var_2_0.fontSize)
			end

			if arg_1_0.inputFlag then
				var_1_0.displayObj:setInputFlag(arg_1_0.inputFlag)
			end

			if arg_1_0.placeHolderId then
				arg_1_0.placeHolder = language.get(arg_1_0.placeHolderId)
			end

			if arg_1_0.placeHolder then
				var_1_0.displayObj:setPlaceHolder(arg_1_0.placeHolder)
			end

			if arg_1_0.maxLenght then
				var_1_0.displayObj:setMaxLength(arg_1_0.maxLenght)
			end

			var_1_0:initBaseUI(arg_1_0)
		end

		var_1_0:create()

		return var_1_0
	end
}
