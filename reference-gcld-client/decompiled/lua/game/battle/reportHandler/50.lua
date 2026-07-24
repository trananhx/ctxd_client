function doReport50(arg_1_0, arg_1_1)
	log.info("==============50 report================" .. arg_1_1)

	local var_1_0 = stringSplit(arg_1_1, "|")
	local var_1_1 = stringSplit(var_1_0[2], ";")
	local var_1_2 = {
		side = var_1_1[1],
		pic = var_1_1[2],
		num = var_1_1[3]
	}

	eventManager.dispatchEvent("deterUpdateChange", var_1_2)
end
