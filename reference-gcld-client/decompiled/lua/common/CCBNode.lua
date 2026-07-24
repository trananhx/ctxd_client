require("lua/common/CCBNodeLoad")

return {
	create = function(arg_1_0, arg_1_1)
		local var_1_0 = CCBProxy:create()
		local var_1_1 = CCBNodeLoad(var_1_0, arg_1_1)

		arg_1_0:replaceUnsupportNode(arg_1_1)
		arg_1_1:addChild(var_1_1)

		return var_1_1
	end,
	replaceUnsupportNode = function(arg_2_0, arg_2_1)
		local var_2_0 = {}

		for iter_2_0, iter_2_1 in pairs(arg_2_1.outletNames) do
			local var_2_1 = arg_2_1[iter_2_1]

			if string.find(iter_2_1, "@") ~= nil then
				local var_2_2 = tool.split(iter_2_1, "@")
				local var_2_3 = var_2_2[1]
				local var_2_4 = var_2_2[2]
				local var_2_5 = var_2_2[3] or ""
				local var_2_6 = var_2_1:getParent()
				local var_2_7, var_2_8 = var_2_1:getPosition()
				local var_2_9 = var_2_1:getZOrder()
				local var_2_10 = var_2_1:getTag()
				local var_2_11 = var_2_1:getAnchorPoint()
				local var_2_12

				if var_2_3 == "progress" then
					local var_2_13 = CCSprite:createWithSpriteFrame(var_2_1:displayFrame())

					var_2_12 = CCProgressTimer:create(var_2_13)

					var_2_12:setType(kCCProgressTimerTypeBar)
					var_2_12:setMidpoint(ccp(0, 0))
					var_2_12:setBarChangeRate(ccp(1, 0))
				elseif var_2_3 == "atlas" then
					local var_2_14 = tool.split(var_2_5, "#")

					var_2_12 = CCLabelAtlas:create("0", var_2_14[1], tonumber(var_2_14[2]), tonumber(var_2_14[3]), tonumber(var_2_14[4]))
				elseif var_2_3 == "strokelabel" then
					var_2_12 = CCStrokeLabelTTF:create(var_2_1:getString(), var_2_1:getFontSize(), var_2_1:getFontSize())

					var_2_12:setColor(var_2_1:getColor())
				end

				if var_2_12 then
					var_2_1:addChild(var_2_12)
					var_2_1:setOpacity(0)
					var_2_12:setAnchorPoint(var_2_11)

					local var_2_15 = var_2_1:getContentSize()

					var_2_12:setPosition(ccp(var_2_15.width * var_2_11.x, var_2_15.height * var_2_11.y))

					var_2_0[#var_2_0 + 1] = {
						oldName = iter_2_1,
						newName = var_2_4,
						node = var_2_12
					}
				end
			end
		end

		for iter_2_2, iter_2_3 in pairs(var_2_0) do
			arg_2_1[iter_2_3.oldName] = nil
			arg_2_1[iter_2_3.newName] = iter_2_3.node
		end
	end
}
