return {
	render = function(arg_1_0, arg_1_1, arg_1_2)
		local var_1_0 = {
			index = arg_1_2,
			attributeRenderHandler = function(arg_2_0)
				if arg_2_0.name == "nameLabel" then
					arg_2_0.text = arg_1_0.attrName .. " Lv." .. arg_1_0.attValue
				else
					arg_2_0.text = arg_1_0.attIntro
				end
			end
		}

		uiutil.initUI(var_1_0, arg_1_1)

		return var_1_0.attribteLayer, var_1_0
	end
}
