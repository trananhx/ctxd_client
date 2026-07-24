function createServerList(arg_1_0)
	local var_1_0 = CCLayerColor:create(ccc4(33, 33, 29, 255), visibleSize.width, visibleSize.height)
	local var_1_1 = CCMenu:create()

	var_1_1:setPosition(ccp(0, 0))
	var_1_0:addChild(var_1_1)

	local var_1_2 = {
		x = 0,
		y = 0
	}
	local var_1_3 = {
		x = 0,
		y = 0
	}
	local var_1_4 = 0
	local var_1_5 = 65

	local function var_1_6(arg_2_0, arg_2_1)
		log.info(arg_2_1:getResponseString())
	end

	local function var_1_7()
		local var_3_0 = var_1_0:getParent()

		if var_3_0 then
			var_3_0:removeChild(var_3_0, true)
		end
	end

	local function var_1_8(arg_4_0, arg_4_1)
		for iter_4_0, iter_4_1 in pairs(serverlist.gcld) do
			if iter_4_0 == arg_4_0 then
				log.info(iter_4_1.name, iter_4_1.port, iter_4_1.addr)
				arg_1_0:refresh(iter_4_1.name, iter_4_1.addr, iter_4_1.port)
			end
		end
	end

	local function var_1_9()
		local var_5_0 = "data/server.lua"

		platform.doLuaFile(var_5_0)

		if serverlist and serverlist.gcld then
			var_1_4 = var_1_4 + 1

			for iter_5_0, iter_5_1 in pairs(serverlist.gcld) do
				local var_5_1 = CCSprite:create("res/sys/server_hot.png")
				local var_5_2 = CCLabelTTF:create(iter_5_1.name, "Arial", 22)

				var_5_2:setPosition(ccp(var_5_1:getContentSize().width * 0.5 + 15, var_5_1:getContentSize().height * 0.5))
				var_5_1:addChild(var_5_2)

				local var_5_3 = CCSprite:create("res/sys/server_hot.png")
				local var_5_4 = CCLabelTTF:create(iter_5_1.name, "Arial", 22)

				var_5_4:setPosition(ccp(var_5_1:getContentSize().width * 0.5 + 15, var_5_1:getContentSize().height * 0.5))
				var_5_3:addChild(var_5_4)

				local var_5_5 = CCMenuItemSprite:create(var_5_1, var_5_3)

				var_5_5:setScale(1.5)
				var_5_5:setPosition(ccp(visibleSize.width / 2, visibleSize.height - iter_5_0 * var_1_5))
				var_5_5:registerScriptTapHandler(var_1_8)
				var_1_1:addChild(var_5_5, 0, iter_5_0)
			end
		end
	end

	local function var_1_10(arg_6_0, arg_6_1)
		var_1_2 = {
			x = arg_6_0,
			y = arg_6_1
		}

		return true
	end

	local function var_1_11(arg_7_0, arg_7_1)
		local var_7_0 = arg_7_1 - var_1_2.y
		local var_7_1, var_7_2 = var_1_1:getPosition()
		local var_7_3 = var_7_2 + var_7_0

		if var_7_3 < 0 then
			var_1_1:setPosition(0, 0)

			return
		end

		if var_7_3 > (var_1_4 + 1) * var_1_5 - visibleSize.height then
			var_1_1:setPosition(0, (var_1_4 + 1) * var_1_5 - visibleSize.height)

			return
		end

		var_1_1:setPosition(var_7_1, var_7_3)

		var_1_2 = {
			x = arg_7_0,
			y = arg_7_1
		}
		var_1_3 = {
			x = var_7_1,
			y = var_7_3
		}
	end

	local function var_1_12(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == "began" then
			return true
		elseif arg_8_0 == "moved" then
			-- block empty
		end
	end

	var_1_0:setTouchEnabled(true)
	var_1_0:registerScriptTouchHandler(var_1_12, false, true)
	var_1_9()

	return var_1_0
end
