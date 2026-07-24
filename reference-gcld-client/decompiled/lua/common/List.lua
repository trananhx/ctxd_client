return {
	new = function(arg_1_0, arg_1_1)
		local var_1_0 = {}

		require("lua/common/EventProtocol").extend(var_1_0)

		var_1_0.datas = arg_1_0
		var_1_0.items = {}
		var_1_0.displayItems = {}
		var_1_0.render = arg_1_1
		var_1_0.render.list = var_1_0

		function var_1_0.setData(arg_2_0)
			var_1_0.datas = arg_2_0
			var_1_0.items = {}
			var_1_0.displayItems = {}
		end

		function var_1_0.setRender(arg_3_0)
			var_1_0.render = arg_3_0
			var_1_0.render.list = var_1_0
		end

		function var_1_0.updateList(arg_4_0)
			var_1_0.datas = arg_4_0

			for iter_4_0 = 1, #var_1_0.items do
				var_1_0.render.update(var_1_0.items[iter_4_0], arg_4_0[iter_4_0])
			end
		end

		function var_1_0.renderList(arg_5_0, arg_5_1)
			if var_1_0.datas == nil then
				return
			end

			var_1_0.type = arg_5_1.listType
			var_1_0.x = arg_5_1.x
			var_1_0.y = arg_5_1.y
			var_1_0.startX = arg_5_1.startX
			var_1_0.startY = arg_5_1.startY
			var_1_0.xcelling = arg_5_1.xcelling
			var_1_0.ycelling = arg_5_1.ycelling
			var_1_0.parent = arg_5_1.parent
			var_1_0.itemRender = arg_5_1.itemRender
			var_1_0.listLayer = CCSprite:create()

			var_1_0.listLayer:setPosition(ccp(var_1_0.x, var_1_0.y))

			for iter_5_0 = 1, #var_1_0.datas do
				local var_5_0 = var_1_0.datas[iter_5_0]
				local var_5_1, var_5_2 = var_1_0.render.render(var_5_0, arg_5_1.itemRender, iter_5_0)

				if var_1_0.type == "hlist" then
					var_5_1:setPosition(ccp(var_1_0.startX + (iter_5_0 - 1) * var_1_0.xcelling, var_1_0.startY))
				else
					var_5_1:setPosition(ccp(var_1_0.startX, var_1_0.startY - (iter_5_0 - 1) * var_1_0.ycelling))
				end

				var_1_0.listLayer:addChild(var_5_1)
				table.insert(var_1_0.items, var_5_2)
				table.insert(var_1_0.displayItems, var_5_1)
			end

			arg_5_0[var_1_0.parent]:addChild(var_1_0.listLayer)
		end

		function var_1_0.clear()
			log.info("list.displayItems len", #var_1_0.displayItems)

			for iter_6_0 = 1, #var_1_0.displayItems do
				pcall(var_1_0.displayItems[iter_6_0].removeFromParentAndCleanup, var_1_0.displayItems[iter_6_0], true)
			end

			var_1_0.displayItems = nil
			var_1_0.items = nil
			var_1_0.datas = nil
			var_1_0.render = nil
		end

		return var_1_0
	end
}
