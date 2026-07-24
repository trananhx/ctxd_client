yuanshaoEvent = {}

function yuanshaoEvent.addYuanshao(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = CCSprite:create("res/ui/world/flight_place_view.png")

	var_1_0:setPosition(ccp(arg_1_1, arg_1_2 + 50))

	local var_1_1 = CCSprite:create("res/ui/common/text/country/guojia-yuan.png")

	var_1_1:setPosition(ccp(20.5, 20.5))
	var_1_0:addChild(var_1_1)

	local var_1_2 = CCStrokeLabelTTF:create(language.get(490210), "Thonburi", 22)

	var_1_2:setPosition(ccp(170, 22))
	var_1_0:addChild(var_1_2)
	arg_1_0:addChild(var_1_0, 1001, worldConstant.yuanshaoTag)
end

function yuanshaoEvent.removeYuanshao(arg_2_0)
	arg_2_0:removeChildByTag(worldConstant.yuanshaoTag, true)
end

function yuanshaoEvent.showYuanshao()
	log.info("袁绍logo")

	local var_3_0 = smgr.getLayer("effectlayer")
	local var_3_1 = CCSprite:create("res/ui/world/yuanshao/yssj_ysbg.png")
	local var_3_2 = CCSprite:create("res/ui/world/yuanshao/yssj_tit_ysqb.png")

	var_3_2:setPosition(ccp(var_3_1:getContentSize().width * 0.5, var_3_1:getContentSize().height * 0.95))
	var_3_1:addChild(var_3_2)

	local var_3_3 = CCSprite:create("res/ui/world/yuanshao/yssj_tit_sj01.png")

	var_3_3:setPosition(ccp(var_3_1:getContentSize().width * 0.3, var_3_1:getContentSize().height * 0.6))
	var_3_1:addChild(var_3_3)

	local var_3_4 = CCSprite:create("res/ui/world/yuanshao/yssj_tit_sj02.png")

	var_3_4:setPosition(ccp(var_3_1:getContentSize().width * 0.32, var_3_1:getContentSize().height * 0.4))
	var_3_1:addChild(var_3_4)

	local var_3_5 = CCSprite:create("res/ui/world/yuanshao/yssj_tit_sj03.png")

	var_3_5:setPosition(ccp(var_3_1:getContentSize().width * 0.45, var_3_1:getContentSize().height * 0.2))
	var_3_1:addChild(var_3_5)
	var_3_1:setPosition(ccp(0 - var_3_1:getContentSize().width * 0.5, visibleSize.height * 0.5))
	var_3_0:addChild(var_3_1)

	local function var_3_6()
		var_3_0:removeChild(var_3_1, true)
	end

	local var_3_7 = CCArray:create()

	var_3_7:addObject(CCMoveTo:create(0.5, ccp(visibleSize.width * 0.5, visibleSize.height * 0.5)))
	var_3_7:addObject(CCDelayTime:create(3))
	var_3_7:addObject(CCMoveTo:create(0.5, ccp(visibleSize.width + var_3_1:getContentSize().width * 0.5, visibleSize.height * 0.5)))
	var_3_7:addObject(CCCallFuncN:create(var_3_6))

	local var_3_8 = CCSequence:create(var_3_7)

	var_3_1:runAction(var_3_8)
end

function yuanshaoEvent.addZhangjiaoZhengxing(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = CCSprite:create()

	var_5_0:setPosition(ccp(arg_5_1, arg_5_2 + 50))
	var_5_0:setScale(1)

	local var_5_1 = rmgr.getAnimation("zhangjiao_zheng")
	local var_5_2 = CCAnimation:createWithSpriteFrames(var_5_1, 0.1)
	local var_5_3 = CCAnimate:create(var_5_2)
	local var_5_4 = CCRepeatForever:create(var_5_3)
	local var_5_5 = CCRepeatForever:create(var_5_4)

	var_5_0:runAction(var_5_5)

	local var_5_6 = CCSprite:create()

	var_5_6:setPosition(ccp(arg_5_1, arg_5_2 - 15))
	var_5_6:setScale(0.5)

	local var_5_7 = rmgr.getAnimation("zhuge_thunder")
	local var_5_8 = CCAnimation:createWithSpriteFrames(var_5_7, 0.1)
	local var_5_9 = CCAnimate:create(var_5_8)
	local var_5_10 = CCRepeatForever:create(var_5_9)
	local var_5_11 = CCRepeatForever:create(var_5_10)

	var_5_6:runAction(var_5_11)

	local var_5_12 = CCSprite:create()

	var_5_12:setPosition(ccp(arg_5_1 - 60, arg_5_2 + 30))
	var_5_12:setScale(0.5)

	local var_5_13 = rmgr.getAnimation("zhuge_thunder")
	local var_5_14 = CCAnimation:createWithSpriteFrames(var_5_13, 0.1)
	local var_5_15 = CCAnimate:create(var_5_14)
	local var_5_16 = CCRepeatForever:create(var_5_15)
	local var_5_17 = CCRepeatForever:create(var_5_16)

	var_5_12:runAction(var_5_17)

	local var_5_18 = CCSprite:create()

	var_5_18:setPosition(ccp(arg_5_1 + 60, arg_5_2 + 30))
	var_5_18:setScale(0.5)

	local var_5_19 = rmgr.getAnimation("zhuge_thunder")
	local var_5_20 = CCAnimation:createWithSpriteFrames(var_5_19, 0.1)
	local var_5_21 = CCAnimate:create(var_5_20)
	local var_5_22 = CCRepeatForever:create(var_5_21)
	local var_5_23 = CCRepeatForever:create(var_5_22)

	var_5_18:runAction(var_5_23)
	arg_5_0:addChild(var_5_0, 1001, 10000 + arg_5_3 * 5)
	arg_5_0:addChild(var_5_6, 1000, 10000 + arg_5_3 * 5 + 1)
	arg_5_0:addChild(var_5_12, 1000, 10000 + arg_5_3 * 5 + 2)
	arg_5_0:addChild(var_5_18, 1000, 10000 + arg_5_3 * 5 + 3)
end

function yuanshaoEvent.removeZhangjiao(arg_6_0)
	arg_6_0:removeAllChildrenWithCleanup(true)
end

function yuanshaoEvent.removeZhangjiaoByTag(arg_7_0, arg_7_1)
	arg_7_0:removeChildByTag(10000 + arg_7_1 * 5, true)
	arg_7_0:removeChildByTag(10000 + arg_7_1 * 5 + 1, true)
	arg_7_0:removeChildByTag(10000 + arg_7_1 * 5 + 2, true)
	arg_7_0:removeChildByTag(10000 + arg_7_1 * 5 + 3, true)
	arg_7_0:removeChildByTag(10000 + arg_7_1 * 5 + 4, true)
end

function yuanshaoEvent.showZhangjiao()
	log.info("张角logo")

	local var_8_0 = smgr.getLayer("effectlayer")
	local var_8_1 = CCSprite:create("res/ui/world/huangjin/huangj.png")
	local var_8_2 = CCSprite:create("res/ui/world/huangjin/hjqy_title.png")

	var_8_2:setPosition(ccp(var_8_1:getContentSize().width * 0.5, var_8_1:getContentSize().height * 0.95))
	var_8_1:addChild(var_8_2)

	local var_8_3 = CCSprite:create("res/ui/world/huangjin/hjqy_tit_05.png")

	var_8_3:setPosition(ccp(var_8_1:getContentSize().width * 0.35, var_8_1:getContentSize().height * 0.6))
	var_8_1:addChild(var_8_3)

	local var_8_4 = CCSprite:create("res/ui/world/huangjin/hjqy_tit_06.png")

	var_8_4:setPosition(ccp(var_8_1:getContentSize().width * 0.35, var_8_1:getContentSize().height * 0.4))
	var_8_1:addChild(var_8_4)

	local var_8_5 = CCSprite:create("res/ui/world/huangjin/hjqy_tit_07.png")

	var_8_5:setPosition(ccp(var_8_1:getContentSize().width * 0.35, var_8_1:getContentSize().height * 0.2))
	var_8_1:addChild(var_8_5)
	var_8_1:setPosition(ccp(0 - var_8_1:getContentSize().width * 0.5, visibleSize.height * 0.5))
	var_8_0:addChild(var_8_1)

	local function var_8_6()
		var_8_0:removeChild(var_8_1, true)
	end

	local var_8_7 = CCArray:create()

	var_8_7:addObject(CCMoveTo:create(0.5, ccp(visibleSize.width * 0.5, visibleSize.height * 0.5)))
	var_8_7:addObject(CCDelayTime:create(3))
	var_8_7:addObject(CCMoveTo:create(0.5, ccp(visibleSize.width + var_8_1:getContentSize().width * 0.5, visibleSize.height * 0.5)))
	var_8_7:addObject(CCCallFuncN:create(var_8_6))

	local var_8_8 = CCSequence:create(var_8_7)

	var_8_1:runAction(var_8_8)
end

function yuanshaoEvent.zhangjiaoInfo(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4, arg_10_5)
	arg_10_0:removeChildByTag(10000 + arg_10_5 * 5 + 4, true)

	local var_10_0 = CCSprite:create("res/ui/world/flight_place_view.png")

	var_10_0:setPosition(ccp(arg_10_1, arg_10_2 + 50))

	local var_10_1 = CCSprite:create("res/ui/common/text/country/guojia-huang.png")

	var_10_1:setPosition(ccp(20.5, 20.5))
	var_10_0:addChild(var_10_1)

	local var_10_2
	local var_10_3

	if arg_10_3 == 1 then
		var_10_2 = CCStrokeLabelTTF:create(language.get(490227), "Thonburi", 22)
		var_10_3 = createTimerLabel(arg_10_4, "@M:@S", "Thonburi", 22, nil, nil)
	elseif arg_10_3 == 2 then
		local function var_10_4()
			var_10_3:setTime(120000)
		end

		var_10_2 = CCStrokeLabelTTF:create(language.get(490228), "Thonburi", 22)
		var_10_3 = createTimerLabel(120000, "@M:@S", "Thonburi", 22, var_10_4, nil)
	end

	var_10_2:setPosition(ccp(120, 22))
	var_10_0:addChild(var_10_2)
	var_10_3:setPosition(ccp(220, 22))
	var_10_0:addChild(var_10_3)
	arg_10_0:addChild(var_10_0, 1005, 10000 + arg_10_5 * 5 + 4)
end
