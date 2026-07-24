gmLayer = {}
gmLayer.layer = nil

local var_0_0 = require("lua/common/json")

local function var_0_1(arg_1_0)
	for iter_1_0 = 0, 5 do
		local var_1_0 = CCSprite:createWithTexture(gmLayer.texture)

		var_1_0:setPosition(ccp(iter_1_0 * 100 + 50, 0))
		gmLayer.batchNode:addChild(var_1_0)

		local var_1_1 = CCMoveTo:create(3, ccp(0, 640))
		local var_1_2 = CCCallFuncN:create(function(arg_2_0)
			tolua.cast(arg_2_0, "CCNode"):removeFromParentAndCleanup(true)
		end)
		local var_1_3 = CCArray:create()

		var_1_3:addObject(var_1_1)
		var_1_3:addObject(var_1_2)

		local var_1_4 = CCSequence:create(var_1_3)

		var_1_0:runAction(var_1_4)
	end
end

function gmLayer.show(arg_3_0)
	local var_3_0 = CCLayerColor:create(ccc4(0, 0, 0, 0))

	gmLayer.layer = var_3_0
	gmLayer.batchNode = CCSpriteBatchNode:create("res/ui/task/get_icon_silver.png")
	gmLayer.texture = gmLayer.batchNode:getTexture()

	gmLayer.layer:addChild(gmLayer.batchNode)

	local var_3_1 = CCScale9Sprite:create("res/ui/login/textfield.png", CCRectMake(0, 0, 600, 80))
	local var_3_2 = CCEditBox:create(CCSizeMake(600, 80), var_3_1)
	local var_3_3 = CCMenuItemFont:create("+1000金币")

	var_3_3:registerScriptTapHandler(function(arg_4_0)
		var_3_2:setText("金币 + 1000")
	end)

	local var_3_4 = CCMenuItemFont:create("+10000银币")

	var_3_4:registerScriptTapHandler(function(arg_5_0)
		var_3_2:setText("银币 + 10000")
	end)

	local var_3_5 = CCMenuItemFont:create("+10000木材")

	var_3_5:registerScriptTapHandler(function(arg_6_0)
		var_3_2:setText("木材 + 10000")
	end)

	local var_3_6 = CCMenuItemFont:create("+10000粮食")

	var_3_6:registerScriptTapHandler(function(arg_7_0)
		var_3_2:setText("粮食 + 10000")
	end)

	local var_3_7 = CCMenuItemFont:create("+10000镔铁")

	var_3_7:registerScriptTapHandler(function(arg_8_0)
		var_3_2:setText("镔铁 + 10000")
	end)
	CCMenuItemFont:create("退出"):registerScriptTapHandler(function(arg_9_0)
		arg_3_0:removeChild(var_3_0, true)
	end)

	local var_3_8 = CCMenuItemFont:create("进入剧本")

	var_3_8:registerScriptTapHandler(function(arg_10_0)
		cmgr.sendRequest(function(arg_11_0)
			smgr.changeScene(SCENE_JUBEN, 9, 1, 1)
		end, actions.juBenPermit, 9, 1, 1)
	end)

	local var_3_9 = CCMenuItemFont:create("执行GM指令")
	local var_3_10 = CCArray:create()

	var_3_10:addObject(var_3_3)
	var_3_10:addObject(var_3_4)
	var_3_10:addObject(var_3_5)
	var_3_10:addObject(var_3_6)
	var_3_10:addObject(var_3_7)
	var_3_10:addObject(var_3_8)
	var_3_10:addObject(var_3_9)

	local function var_3_11()
		local var_12_0 = os.time()
		local var_12_1 = os.date("%Y-%m-%d %X")
		local var_12_2 = var_12_0 + 86400
		local var_12_3 = os.date("%Y-%m-%d %X", var_12_2)

		return var_12_1, var_12_3
	end

	local var_3_12 = CCMenu:createWithArray(var_3_10)

	var_3_12:alignItemsVerticallyWithPadding(20)
	var_3_12:setPosition(250, 340)
	var_3_0:addChild(var_3_12)

	local var_3_13 = "{\"test\":[null,null,\"aaa\",\"bbb\",null,\"ccc\",null]}"
	local var_3_14 = "{\"test\":[\"aaa\",\"bbb\",\"ccc\"]}"
	local var_3_15 = var_0_0.decode(var_3_14)

	for iter_3_0, iter_3_1 in pairs(var_3_15.test) do
		log.info(iter_3_0, iter_3_1)
	end

	var_3_2:setPosition(ccp(visibleSize.width / 2, 50))
	var_3_0:addChild(var_3_2)

	local function var_3_16()
		log.info("CMDS:%s", var_3_2:getText())

		local var_13_0 = tool.split(var_3_2:getText(), " ")
		local var_13_1 = table.remove(var_13_0, 1)

		log.info("CMD = %s", var_13_1)

		for iter_13_0, iter_13_1 in pairs(var_13_0) do
			if iter_13_1 == "=" then
				var_13_0[iter_13_0] = "~"
			end
		end

		local var_13_2 = table.concat(var_13_0, "|")
		local var_13_3 = string.format("cmd=%s&param=%s", var_13_1, var_13_2)

		log.info("params", var_13_3)
		cmgr.sendRequest(function()
			log.info("GM指令发送成功")
		end, {
			name = "gm@gmcommand",
			args = var_13_3
		})
	end

	var_3_9:registerScriptTapHandler(var_3_16)

	return var_3_0
end
