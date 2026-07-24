local var_0_0 = class("zhenGanning", function()
	return createBaseLayer()
end)

var_0_0.layout = {
	name = "panel",
	x = 0,
	type = "layerColor",
	y = 0,
	color = ccc4(0, 0, 0, 180),
	width = visibleSize.width,
	height = visibleSize.height,
	children = {
		{
			name = "ganning",
			scale = 0,
			type = "sprite",
			zorder = 0,
			x = visibleSize.width * 0.5 - 240,
			y = visibleSize.height * 0.5 - 40,
			pic = {
				path = "res/ui/common/halfPic/halfPic_ganning.png"
			}
		},
		{
			name = "weapon",
			scale = 0,
			type = "sprite",
			zorder = 100,
			x = visibleSize.width * 0.5 + 240,
			y = visibleSize.height * 0.5 - 40,
			pic = {
				path = "res/ui/gainGeneral/yxcy_weapon.png"
			}
		},
		{
			name = "light",
			scale = 1.8,
			type = "sprite",
			visible = false,
			zorder = 100,
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 - 40,
			pic = {
				path = "res/ui/activity/ironRotary/btdzp_lig.png"
			}
		},
		{
			name = "zhenGanning",
			scale = 0,
			type = "sprite",
			zorder = 200,
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 - 40,
			pic = {
				path = "res/ui/common/halfPic/halfPic_zhenganning.png"
			}
		},
		{
			name = "namebg",
			visible = false,
			type = "sprite",
			zorder = 200,
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 + 160,
			pic = {
				path = "res/ui/technology/dragonTech/lm_bg.png"
			}
		},
		{
			name = "name",
			visible = false,
			type = "sprite",
			zorder = 200,
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 + 160,
			pic = {
				path = "res/ui/gainGeneral/yxcy_word_zgn.png"
			}
		}
	}
}

function var_0_0.showEffectJinjie(arg_2_0)
	arg_2_0.view.widgets.panel:registerScriptTouchHandler(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == CCTOUCHBEGAN then
			log.info("CCTOUCH_BEGAN", arg_3_1, arg_3_2)

			return true
		elseif arg_3_0 == CCTOUCHMOVED then
			log.info("CCTOUCH_MOVED", arg_3_1, arg_3_2)

			return true
		elseif arg_3_0 == CCTOUCHENDED then
			log.info("CCTOUCH_ENDED", arg_3_1, arg_3_2)

			return true
		end
	end, false, true)
	arg_2_0.view.widgets.panel:setTouchEnabled(true)

	local var_2_0 = CCArray:create()

	var_2_0:addObject(CCEaseElasticOut:create(CCScaleTo:create(0.7, 1)))
	var_2_0:addObject(CCDelayTime:create(0.3))
	var_2_0:addObject(CCDelayTime:create(1))
	var_2_0:addObject(CCEaseSineOut:create(CCMoveBy:create(0.5, ccp(240, 0))))
	var_2_0:addObject(CCCallFuncN:create(function()
		return
	end))

	local var_2_1 = CCSequence:create(var_2_0)

	arg_2_0.view.widgets.ganning:runAction(var_2_1)

	local var_2_2 = CCArray:create()

	var_2_2:addObject(CCDelayTime:create(1))
	var_2_2:addObject(CCEaseElasticOut:create(CCScaleTo:create(0.7, 1)))
	var_2_2:addObject(CCDelayTime:create(0.3))
	var_2_2:addObject(CCEaseSineOut:create(CCMoveBy:create(0.5, ccp(-240, 0))))
	var_2_2:addObject(CCCallFuncN:create(function()
		local var_5_0 = "res/anim/stategyEffect/att_jitui/att_jitui.plist"

		rmgr.loadResource(var_5_0)

		local var_5_1 = CCArray:create()

		for iter_5_0 = 1, 10 do
			iter_5_0 = iter_5_0 == 10 and 15 or iter_5_0

			local var_5_2 = CCSprite:createWithSpriteFrameName(string.format("%d.png", iter_5_0))

			var_5_1:addObject(var_5_2:displayFrame())
		end

		local var_5_3 = CCAnimation:createWithSpriteFrames(var_5_1, 0.08)
		local var_5_4 = CCAnimate:create(var_5_3)
		local var_5_5 = CCSprite:create()

		var_5_5:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 40))
		arg_2_0.view.widgets.panel:addChild(var_5_5, 200)
		var_5_5:runAction(var_5_4)
		CCSpriteFrameCache:sharedSpriteFrameCache():removeSpriteFramesFromFile(var_5_0)
	end))
	var_2_2:addObject(CCDelayTime:create(0.8))
	var_2_2:addObject(CCCallFuncN:create(function()
		arg_2_0.view.widgets.ganning:setVisible(false)
		arg_2_0.view.widgets.weapon:setVisible(false)
		arg_2_0.view.widgets.namebg:setVisible(true)
		arg_2_0.view.widgets.name:setVisible(true)
		arg_2_0.view.widgets.light:setVisible(true)
		arg_2_0.view.widgets.light:runAction(CCRepeatForever:create(CCRotateBy:create(2, 360)))
		arg_2_0.view.widgets.zhenGanning:runAction(CCEaseElasticOut:create(CCScaleTo:create(0.7, 1)))

		local var_6_0 = CCArray:create()

		var_6_0:addObject(CCDelayTime:create(3))
		var_6_0:addObject(CCCallFuncN:create(function()
			arg_2_0:removeFromParentAndCleanup(true)
			roleDialogue.control.loadSpeak(1528)
		end))
		arg_2_0.view.widgets.zhenGanning:runAction(CCSequence:create(var_6_0))
	end))

	local var_2_3 = CCSequence:create(var_2_2)

	arg_2_0.view.widgets.weapon:runAction(var_2_3)
end

function var_0_0.showEffectZhaomu(arg_8_0)
	local function var_8_0(arg_9_0, arg_9_1)
		local function var_9_0()
			arg_9_1:setVisible(true)
		end

		local var_9_1 = CCArray:create()

		var_9_1:addObject(CCDelayTime:create(arg_9_0))
		var_9_1:addObject(CCCallFuncN:create(var_9_0))
		var_9_1:addObject(CCFadeIn:create(0.5))

		return (CCSequence:create(var_9_1))
	end

	rmgr.loadResource("res/ui/common/generalWord1.plist")

	local var_8_1 = CCSprite:create("res/ui/battle/stategyPic/2.png")
	local var_8_2 = CCSprite:create("res/ui/common/halfPic/halfPic_zhenganning.png")

	var_8_2:setPosition(ccp(145, 140))
	var_8_1:addChild(var_8_2)

	local var_8_3 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("wjzm_tit_gn_01.png"))

	var_8_3:setPosition(ccp(400, 200))
	var_8_3:runAction(var_8_0(2.5, var_8_3))
	var_8_3:setVisible(false)
	var_8_1:addChild(var_8_3)

	local var_8_4 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("wjzm_tit_gn_02.png"))

	var_8_4:setPosition(ccp(330, 80))
	var_8_4:runAction(var_8_0(3.5, var_8_4))
	var_8_4:setVisible(false)
	var_8_1:addChild(var_8_4)

	local var_8_5 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("wjzm_tit_gn_03.png"))

	var_8_5:setPosition(ccp(750, 120))
	var_8_5:runAction(var_8_0(0.5, var_8_5))
	var_8_5:setVisible(false)
	var_8_1:addChild(var_8_5)

	local var_8_6 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("wjzm_tit_gn_04.png"))

	var_8_6:setPosition(ccp(700, 120))
	var_8_6:runAction(var_8_0(1.5, var_8_6))
	var_8_6:setVisible(false)
	var_8_1:addChild(var_8_6)
	var_8_1:setVisible(false)
	var_8_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
	arg_8_0:addChild(var_8_1, 1000)

	local function var_8_7()
		arg_8_0:removeFromParentAndCleanup(true)
	end

	local function var_8_8()
		var_8_1:setVisible(true)
	end

	local var_8_9 = CCArray:create()

	var_8_9:addObject(CCCallFuncN:create(var_8_8))
	var_8_9:addObject(CCFadeIn:create(0.5))
	var_8_9:addObject(CCDelayTime:create(6))
	var_8_9:addObject(CCFadeOut:create(0.5))
	var_8_9:addObject(CCCallFuncN:create(var_8_7))

	local var_8_10 = CCSequence:create(var_8_9)

	var_8_1:runAction(var_8_10)
end

function var_0_0.ctor(arg_13_0, arg_13_1)
	if arg_13_1 == 1 then
		arg_13_0.view = {}

		uiutil.initWidgets(arg_13_0.view, arg_13_0.layout)
		arg_13_0:addChild(arg_13_0.view.widgets.panel)
		arg_13_0:showEffectJinjie()
	elseif arg_13_1 == 2 then
		arg_13_0:showEffectZhaomu()
	end
end

return var_0_0
