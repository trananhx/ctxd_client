local var_0_0 = class("YuBaoSprint", function()
	return createBaseLayer()
end)

var_0_0.layout = {
	name = "root",
	type = "node",
	x = visibleSize.width / 2,
	y = visibleSize.height / 2 - 30,
	children = {
		{
			y = 0,
			name = "bg",
			type = "sprite9",
			x = 0,
			preferedSize = CCSizeMake(960, 580),
			middleRect = CCRectMake(45, 30, 15, 45),
			pic = {
				frame = true,
				path = "bigPanel.png"
			},
			children = {
				{
					x = 924,
					name = "btn_close",
					h = 33,
					type = "button",
					w = 32,
					y = 604,
					scale = 2,
					normal = {
						frame = true,
						path = "btn_close_a.png"
					},
					touched = {
						frame = true,
						path = "btn_close_c.png"
					}
				}
			}
		},
		{
			y = 0,
			name = "bg1",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/comment/bg1.jpg"
			}
		},
		{
			y = -40.0009,
			name = "zz_bg",
			type = "sprite",
			x = -0.004,
			pic = {
				path = "res/ui/weapon/casting/zz_bg.jpg"
			}
		},
		{
			y = 220,
			name = "ybcc_title",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/activity/ybcc/ybcc_title.png"
			}
		},
		{
			y = 183,
			name = "zz_line",
			type = "sprite",
			x = -0.0004,
			pic = {
				path = "res/ui/weapon/casting/zz_line.png"
			}
		},
		{
			y = 0,
			name = "npcSp",
			type = "sprite",
			x = 0,
			anchorPoint = ccp(0, 0),
			pic = {
				path = "Default/Sprite.png"
			}
		},
		{
			fontSize = 24,
			name = "leftTime",
			y = 210,
			type = "label",
			x = 300
		},
		{
			y = 120,
			name = "infoSp1",
			type = "sprite",
			x = 120,
			pic = {
				path = "res/ui/activity/ybcc/ybcc_word_di01.png"
			}
		},
		{
			fontSize = 22,
			name = "infoLb1",
			y = 120,
			type = "label",
			x = 120,
			textId = 214301
		},
		{
			y = 15,
			name = "infoSp2",
			type = "sprite",
			x = 120,
			pic = {
				path = "res/ui/activity/ybcc/ybcc_word_di02.png"
			}
		},
		{
			y = 45,
			name = "blackBg2",
			type = "sprite",
			x = -90,
			pic = {
				path = "res/ui/activity/ybcc/ybcc_word_ink.png"
			}
		},
		{
			y = 45,
			name = "titleArt2",
			type = "sprite",
			x = -100,
			pic = {
				path = "res/ui/activity/ybcc/ybcc_word_mgkc.png"
			}
		},
		{
			fontSize = 22,
			name = "infoLb2",
			y = 5,
			type = "label",
			x = 120,
			textId = 214302
		},
		{
			y = -90,
			name = "infoSp3",
			type = "sprite",
			x = 120,
			pic = {
				path = "res/ui/activity/ybcc/ybcc_word_di02.png"
			}
		},
		{
			y = -60,
			name = "blackBg3",
			type = "sprite",
			x = -90,
			pic = {
				path = "res/ui/activity/ybcc/ybcc_word_ink.png"
			}
		},
		{
			y = -60,
			name = "titleArt3",
			type = "sprite",
			x = -100,
			pic = {
				path = "res/ui/activity/ybcc/ybcc_word_sjxz.png"
			}
		},
		{
			fontSize = 22,
			name = "infoLb3",
			y = -100,
			type = "label",
			x = 15,
			textId = 214303
		},
		{
			y = -195,
			name = "infoSp4",
			type = "sprite",
			x = 120,
			pic = {
				path = "res/ui/activity/ybcc/ybcc_word_di02.png"
			}
		},
		{
			y = -165,
			name = "blackBg4",
			type = "sprite",
			x = -90,
			pic = {
				path = "res/ui/activity/ybcc/ybcc_word_ink.png"
			}
		},
		{
			y = -165,
			name = "titleArt4",
			type = "sprite",
			x = -100,
			pic = {
				path = "res/ui/activity/ybcc/ybcc_word_bljz.png"
			}
		},
		{
			fontSize = 22,
			name = "infoLb4",
			y = -205,
			type = "label",
			x = 12,
			textId = 214304
		}
	}
}

function var_0_0.ctor(arg_2_0, arg_2_1)
	log.info("@@ 御宝冲刺界面")

	arg_2_0.data = {}
	arg_2_0.view = {}

	uiutil.initWidgets(arg_2_0.view, arg_2_0.layout)

	if arg_2_1 then
		arg_2_0:addChild(arg_2_0.view.widgets.root)
		arg_2_1:addChild(arg_2_0)
	end

	local var_2_0 = CCSprite:create("res/ui/weapon/casting/zz_npc.png")

	var_2_0:setAnchorPoint(ccp(0, 0))
	var_2_0:setPosition(ccp(-455, -255))
	var_2_0:setTextureRect(CCRectMake(93, 0, 342, 408))
	arg_2_0.view.widgets.npcSp:addChild(var_2_0)
	swallowTouch(arg_2_0)
end

function var_0_0.calcTime(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0, var_3_1 = arg_3_2:getPosition()

	arg_3_2:setPosition(ccp(var_3_0 - 20, var_3_1))

	local var_3_2 = arg_3_1 / 1000

	if var_3_2 < 3600 then
		arg_3_2:setString("")

		local var_3_3 = createTimerLabel(var_3_2 * 1000, language.get(131003), "Thonburi", 22, nil, nil, nil, ccc3(255, 0, 0))

		arg_3_2:addChild(var_3_3)
	elseif var_3_2 < 86400 then
		local var_3_4 = var_3_2 / 3600

		arg_3_2:setString(language.get(131001, tool.toint(var_3_4)))
	else
		local var_3_5 = var_3_2 / 3600 / 24

		arg_3_2:setString(language.get(131002, tool.toint(var_3_5)))
	end
end

function var_0_0.updatePanel(arg_4_0, arg_4_1)
	arg_4_0:calcTime(arg_4_1.eventCd, arg_4_0.view.widgets.leftTime)
end

function var_0_0.refresh(arg_5_0)
	local function var_5_0(arg_6_0)
		arg_5_0:updatePanel(arg_6_0.action.data)
	end

	cmgr.sendRequest(var_5_0, actions.getYuBaoSprint)
end

function var_0_0.closeBtnDown(arg_7_0)
	arg_7_0:removeFromParentAndCleanup(true)
end

function var_0_0.onEnter(arg_8_0)
	arg_8_0:refresh()

	arg_8_0.closeBtnDownRef = handler(arg_8_0, arg_8_0.closeBtnDown)

	arg_8_0.view.widgets.btn_close:addHandleOfControlEvent(arg_8_0.closeBtnDownRef, CCControlEventTouchDown)
end

function var_0_0.onExit(arg_9_0)
	return
end

return var_0_0
