local var_0_0 = class("HuizhanStateChange", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0, arg_2_1)
	log.info("@@ 会战状态变更 ")
	showTable(arg_2_1)

	local var_2_0
	local var_2_1 = false

	if arg_2_1.state == 1 then
		var_2_0 = CCSprite:create("res/ui/common/text/huizhan/huizhan_text_hzks.png")
		var_2_1 = true
	elseif arg_2_1.state == 5 then
		var_2_0 = CCSprite:create("res/ui/common/text/huizhan/huizhan_text_jjwc.png")
	elseif arg_2_1.state == 3 then
		var_2_0 = CCSprite:create("res/ui/common/text/huizhan/huizhan_text_hzjs.png")
	end

	if not var_2_0 then
		return
	end

	local var_2_2 = CCSprite:create("res/ui/juben/jb_set.png")

	arg_2_0:addChild(var_2_2)
	var_2_2:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))

	local var_2_3 = CCLabelAtlas:create("2", "res/ui/common/number/battle_prepare_compo_red.png", 40, 48, 48)

	var_2_3:setAnchorPoint(ccp(0.5, 0.5))
	var_2_3:setPosition(ccp(var_2_2:getContentSize().width / 2, var_2_2:getContentSize().height / 2))
	var_2_0:setPosition(ccp(var_2_2:getContentSize().width / 2, var_2_2:getContentSize().height / 2))
	var_2_0:setScale(4)
	var_2_2:addChild(var_2_3)
	var_2_2:addChild(var_2_0)
	var_2_0:setVisible(false)

	local var_2_4 = CCArray:create()

	if var_2_1 then
		var_2_4:addObject(CCCallFuncN:create(function()
			var_2_3:setString("2")
			var_2_3:setScale(4)
		end))
		var_2_4:addObject(CCEaseExponentialOut:create(CCScaleTo:create(0.8, 1.5)))
		var_2_4:addObject(CCCallFuncN:create(function()
			var_2_3:setString("1")
			var_2_3:setScale(4)
		end))
		var_2_4:addObject(CCEaseExponentialOut:create(CCScaleTo:create(0.8, 1.5)))
		var_2_4:addObject(CCCallFuncN:create(function()
			var_2_3:setString("0")
			var_2_3:setScale(4)
		end))
		var_2_4:addObject(CCEaseExponentialOut:create(CCScaleTo:create(0.8, 1.5)))
		var_2_4:addObject(CCCallFuncN:create(function()
			var_2_3:setVisible(false)
			var_2_0:setVisible(true)
		end))
		var_2_3:runAction(CCSequence:create(var_2_4))
	else
		var_2_3:setVisible(false)
		var_2_0:setVisible(true)
	end

	local var_2_5 = CCArray:create()

	if var_2_1 then
		var_2_5:addObject(CCDelayTime:create(2.4))
	end

	var_2_5:addObject(CCEaseExponentialOut:create(CCScaleTo:create(0.8, 1)))
	var_2_5:addObject(CCDelayTime:create(1.5))
	var_2_5:addObject(CCCallFuncN:create(function()
		arg_2_0:removeFromParentAndCleanup(true)

		if arg_2_1.hasReward then
			require("lua/layer/nation/ui")
			nationUI.show(8)
		end
	end))
	var_2_0:runAction(CCSequence:create(var_2_5))

	local var_2_6 = smgr.getLayer("effectlayer")

	if var_2_6 then
		var_2_6:addChild(arg_2_0)
	end
end

return var_0_0
