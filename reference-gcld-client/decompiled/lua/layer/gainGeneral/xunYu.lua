local var_0_0 = class("xunYu", function()
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
			name = "npc",
			scale = 0,
			type = "sprite",
			zorder = 0,
			x = visibleSize.width * 0.5 - 240,
			y = visibleSize.height * 0.5 - 40,
			pic = {
				path = "res/ui/common/halfPic/halfPic_xunyu.png"
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
				path = "res/ui/gainGeneral/jcs.png"
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
			name = "npc_new",
			scale = 0,
			type = "sprite",
			zorder = 200,
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 - 40,
			pic = {
				path = "res/ui/common/halfPic/halfPic_xunyu2.png"
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

	arg_2_0.view.widgets.npc:runAction(var_2_1)

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
		arg_2_0.view.widgets.npc:setVisible(false)
		arg_2_0.view.widgets.weapon:setVisible(false)
		arg_2_0.view.widgets.light:setVisible(true)
		arg_2_0.view.widgets.light:runAction(CCRepeatForever:create(CCRotateBy:create(2, 360)))
		arg_2_0.view.widgets.npc_new:runAction(CCEaseElasticOut:create(CCScaleTo:create(0.7, 1)))

		local var_6_0 = CCArray:create()

		var_6_0:addObject(CCDelayTime:create(3))
		var_6_0:addObject(CCCallFuncN:create(function()
			arg_2_0:removeFromParentAndCleanup(true)

			if arg_2_0.info.hasRecruited == 0 then
				roleDialogue.control.loadSpeak(1573)
			end
		end))
		arg_2_0.view.widgets.npc_new:runAction(CCSequence:create(var_6_0))
	end))

	local var_2_3 = CCSequence:create(var_2_2)

	arg_2_0.view.widgets.weapon:runAction(var_2_3)
end

function var_0_0.ctor(arg_8_0, arg_8_1)
	arg_8_0.info = arg_8_1
	arg_8_0.view = {}

	uiutil.initWidgets(arg_8_0.view, arg_8_0.layout)
	arg_8_0:addChild(arg_8_0.view.widgets.panel)
	arg_8_0:showEffectJinjie()
end

return var_0_0
