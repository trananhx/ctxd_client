local var_0_0 = {
	shuaibu = "gzzl_word_sbsd.png",
	xianshi = "gzzl_word_xssd.png",
	dantiao = "gzzl_word_dtsd.png",
	gongcheng = "xkjtt_word_gcdjf.png",
	qianxian = "gzzl_word_qxsd.png"
}
local var_0_1 = tool.hexToRgb("#ECDEA7")
local var_0_2 = ccc3(0, 180, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = class("zhaoLingLayer", function()
	return createBaseLayer()
end)

var_0_6.layout = {
	name = "panel",
	type = "sprite",
	x = visibleSize.width / 2,
	y = visibleSize.height / 2,
	pic = {
		path = "res/ui/kfyz/zhaoling/yzzl_scroll_bg.png"
	},
	children = {
		{
			y = 300,
			name = "title",
			type = "sprite",
			x = 427.0002,
			pic = {
				path = "res/ui/world/nationChallenges/gzzl_title.png"
			}
		},
		{
			y = 165,
			name = "bg_txt",
			type = "sprite9",
			x = 401.9988,
			preferedSize = CCSizeMake(860, 140),
			middleRect = CCRectMake(40, 10, 780, 88),
			pic = {
				path = "res/ui/world/cityCombo/lxzc_bg4.png"
			},
			children = {
				{
					x = 105,
					name = "bg_progress",
					y = 50,
					type = "sprite",
					scale = 1.1,
					anchorPoint = ccp(0, 0.5),
					pic = {
						path = "res/ui/general/jailView/new/lf_pb_bg.png"
					}
				},
				{
					x = 105,
					name = "progress",
					y = 50,
					type = "progressbar",
					scale = 1.1,
					anchorPoint = ccp(0, 0.5),
					progressType = kCCProgressTimerTypeBar,
					pic = {
						path = "res/ui/general/jailView/new/lf_pb.png"
					}
				},
				{
					fontSize = 25,
					name = "num",
					y = 50,
					type = "label",
					x = 430
				},
				{
					y = 90,
					name = "title_p1",
					type = "sprite",
					x = 110,
					anchorPoint = ccp(0, 0.5),
					pic = {
						path = "res/ui/world/nationChallenges/gzzl_word_dtsd.png"
					}
				},
				{
					name = "title_p2",
					type = "atlaslabel",
					pic = "res/ui/common/number/gphb_word_digit.png",
					startCharMap = 48,
					text = "0",
					y = 90,
					itemWidth = 28,
					x = 280,
					itemHeight = 33,
					anchorPoint = ccp(0, 0.5)
				},
				{
					type = "sprite",
					name = "title_p3",
					y = 90,
					visible = false,
					x = 370,
					anchorPoint = ccp(0, 0.5),
					pic = {
						path = "res/ui/world/nationChallenges/gzzl_word_w.png"
					}
				},
				{
					type = "sprite",
					name = "win",
					x = 710,
					visible = false,
					y = 70,
					scale = 1.4,
					pic = {
						frame = true,
						path = "tuzhang_yiwancheng.png"
					}
				},
				{
					type = "sprite",
					name = "lose",
					x = 710,
					visible = false,
					y = 70,
					scale = 1.4,
					pic = {
						frame = true,
						path = "nation_task_defe.png"
					}
				}
			}
		},
		{
			y = 70,
			name = "btn_accept",
			h = 62,
			type = "button",
			w = 200,
			visible = false,
			x = 402,
			normal = {
				path = "res/ui/common/button/public_btn_red.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_red_c.png"
			},
			children = {
				{
					fontSize = 25,
					style = "label_warlock",
					y = 34,
					type = "label",
					x = 100,
					textId = 92025,
					color = var_0_1
				}
			}
		}
	}
}

function var_0_6.showOpenEffect(arg_2_0)
	arg_2_0:setVisible(true)
	arg_2_0.view.widgets.panel:setScale(0.1)

	local var_2_0 = CCArray:create()

	var_2_0:addObject(CCScaleTo:create(0.3, 1))
	arg_2_0.view.widgets.panel:runAction(CCSequence:create(var_2_0))
end

function var_0_6.showPanel(arg_3_0, arg_3_1)
	arg_3_0.info = arg_3_1

	if arg_3_1.pic == "gongcheng" then
		arg_3_0.view.widgets.title:setDisplayFrame(CCSprite:create("res/ui/world/nationChallenges/xkjtt_title_gczl.png"):displayFrame())
	else
		arg_3_0.view.widgets.title:setDisplayFrame(CCSprite:create("res/ui/world/nationChallenges/gzzl_title.png"):displayFrame())
	end

	arg_3_0.view.widgets.title_p1:setDisplayFrame(CCSprite:create("res/ui/world/nationChallenges/" .. var_0_0[arg_3_1.pic]):displayFrame())

	if arg_3_1.goal > 10000 then
		arg_3_0.view.widgets.title_p2:setString(math.floor(arg_3_1.goal / 10000))
		arg_3_0.view.widgets.title_p3:setVisible(true)
	else
		arg_3_0.view.widgets.title_p2:setString(arg_3_1.goal)
	end

	local var_3_0, var_3_1 = arg_3_0.view.widgets.title_p1:getPosition()
	local var_3_2 = arg_3_0.view.widgets.title_p1:getContentSize().width
	local var_3_3 = arg_3_0.view.widgets.title_p2:getContentSize().width

	arg_3_0.view.widgets.title_p2:setPositionX(var_3_0 + var_3_2)
	arg_3_0.view.widgets.title_p3:setPositionX(var_3_0 + var_3_2 + var_3_3)
	arg_3_0.view.widgets.progress:setPercentage(100 * arg_3_1.process / arg_3_1.goal)
	arg_3_0.view.widgets.num:setString(language.get(390478, tool.getFormatNum(arg_3_1.process), tool.getFormatNum(arg_3_1.goal)))

	if arg_3_1.edictNotice then
		roleDialogue.control.loadSpeak(1530)
		arg_3_0:setVisible(false)
		arg_3_0.view.widgets.btn_accept:setVisible(true)
	else
		local var_3_4 = arg_3_1.process >= arg_3_1.goal

		arg_3_0.view.widgets.win:setVisible(var_3_4)
		arg_3_0.view.widgets.lose:setVisible(not var_3_4)
		arg_3_0.view.widgets.panel:setScale(0.1)

		local var_3_5 = CCArray:create()

		var_3_5:addObject(CCScaleTo:create(0.3, 1))
		var_3_5:addObject(CCDelayTime:create(3))
		var_3_5:addObject(CCCallFuncN:create(function()
			arg_3_0:removeFromParentAndCleanup(true)
		end))
		arg_3_0.view.widgets.panel:runAction(CCSequence:create(var_3_5))
	end
end

function var_0_6.onEnter(arg_5_0)
	log.info("onEnter")

	arg_5_0.showOpenEffectRef = handler(arg_5_0, arg_5_0.showOpenEffect)

	eventManager.registerEvent("zhaoLingLayer", arg_5_0.showOpenEffectRef)
end

function var_0_6.onExit(arg_6_0)
	log.info("onExit")
	eventManager.unregisterEvent("zhaoLingLayer", arg_6_0.showOpenEffectRef)
end

function var_0_6.ctor(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.view = {}

	uiutil.initWidgets(arg_7_0.view, arg_7_0.layout)
	swallowTouch(arg_7_0)

	if arg_7_1 then
		arg_7_0:addChild(arg_7_0.view.widgets.panel)
		arg_7_1:addChild(arg_7_0)
	end

	arg_7_0.view.widgets.btn_accept:addHandleOfControlEvent(function()
		local var_8_0 = CCScaleTo:create(0.6, 0)
		local var_8_1 = CCEaseSineOut:create(CCMoveTo:create(0.6, ccp(0, visibleSize.height)))
		local var_8_2 = CCArray:create()

		var_8_2:addObject(CCSpawn:createWithTwoActions(var_8_0, var_8_1))
		var_8_2:addObject(CCCallFuncN:create(function()
			arg_7_0:removeFromParentAndCleanup(true)
		end))
		arg_7_0.view.widgets.panel:runAction(CCSequence:create(var_8_2))
	end, CCControlEventTouchUpInside)
	arg_7_0:showPanel(arg_7_2)
end

return var_0_6
