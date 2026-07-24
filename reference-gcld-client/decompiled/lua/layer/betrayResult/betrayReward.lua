local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = {
	ccp(95, 260),
	ccp(477, 460),
	ccp(193, 210),
	ccp(575, 412),
	ccp(283, 159),
	ccp(677, 360),
	ccp(392, 109),
	ccp(779, 309),
	ccp(506, 51),
	ccp(882, 260)
}
local var_0_2 = {
	"yq_wj1.png",
	"yq_wj3.png"
}
local var_0_3 = {
	"yq_wj2.png",
	"yq_wj4.png"
}
local var_0_4 = class("BetrayReward", function()
	return createBaseLayer()
end)
local var_0_5 = 0.7913732394366197

var_0_4.layout = {
	name = "panel",
	type = "sprite9",
	pic = {
		path = "res/ui/general/jailView/comm_view_laofang_1.png"
	},
	middleRect = CCRectMake(51, 51, 1, 1),
	preferedSize = CCSizeMake(915, 532),
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			x = 8,
			name = "bg",
			y = 8,
			type = "sprite",
			visible = false,
			pic = {
				frame = false,
				path = "res/ui/kfsy/kfsy_ky.jpg"
			},
			scale = var_0_5,
			anchorPoint = ccp(0, 0)
		},
		{
			y = 435,
			x = 165,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/rankInfo/DailyFeatView/yq_zr.png"
			},
			scale = var_0_5
		},
		{
			y = 63,
			name = "boxNode",
			visible = false,
			type = "node",
			x = -125,
			zorder = 200,
			children = {
				{
					zoomOnTouchDown = false,
					name = "btn_reward",
					h = 230,
					type = "button",
					w = 226,
					y = 180,
					x = 630,
					normal = {
						frame = false,
						path = "res/ui/rankInfo/DailyFeatView/gxb_bx.png"
					},
					touched = {
						frame = false,
						path = "res/ui/rankInfo/DailyFeatView/gxb_bx_c.png"
					}
				},
				{
					x = 630,
					name = "box",
					y = 180,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/rankInfo/DailyFeatView/gxb_bx.png"
					}
				},
				{
					x = 620,
					name = "light",
					y = 275,
					type = "sprite",
					visible = false,
					pic = {
						frame = false,
						path = "res/ui/rankInfo/DailyFeatView/gxb_bxop_h.png"
					}
				},
				{
					x = 650,
					name = "star1",
					y = 165,
					type = "sprite",
					visible = false,
					pic = {
						frame = false,
						path = "res/ui/rankInfo/DailyFeatView/gxb_bxop_s.png"
					}
				},
				{
					x = 590,
					name = "star2",
					y = 170,
					type = "sprite",
					visible = false,
					pic = {
						frame = false,
						path = "res/ui/rankInfo/DailyFeatView/gxb_bxop_s.png"
					}
				},
				{
					x = 625,
					name = "star3",
					y = 195,
					type = "sprite",
					visible = false,
					pic = {
						frame = false,
						path = "res/ui/rankInfo/DailyFeatView/gxb_bxop_s.png"
					}
				}
			}
		},
		{
			y = 100,
			name = "renameDialog",
			type = "sprite",
			zorder = 200,
			visible = false,
			x = 490,
			pic = {
				frame = false,
				path = "res/ui/activity/famous/gjms_sce_view_bg.png"
			},
			anchorPoint = ccp(0.5, 0),
			children = {
				{
					x = 0,
					name = "bossImage",
					y = 0,
					type = "sprite",
					anchorPoint = ccp(0.5, 0),
					pic = {
						frame = false,
						path = "res/ui/common/halfPic/halfPic_caocao.png"
					}
				},
				{
					h = 60,
					name = "inputBox",
					type = "editBox",
					w = 300,
					y = 140,
					x = 380,
					maxLenght = 15,
					background = {
						frame = true,
						path = "role_input_name.png"
					}
				},
				{
					scale = 2,
					name = "dice",
					h = 45,
					type = "button",
					w = 43,
					zoomOnTouchDown = false,
					y = 140,
					x = 580,
					normal = {
						frame = true,
						path = "btn_name_auto_a.png"
					},
					touched = {
						frame = true,
						path = "btn_name_auto_click.png"
					}
				},
				{
					zoomOnTouchDown = false,
					name = "renameOk",
					h = 62,
					type = "button",
					w = 195,
					y = 60,
					x = 280,
					normal = {
						frame = false,
						path = "res/ui/common/button/public_btn_green.png"
					},
					touched = {
						frame = false,
						path = "res/ui/common/button/public_btn_green_c.png"
					},
					children = {
						{
							fontSize = 30,
							name = "ok",
							type = "label",
							y = 33,
							x = 98,
							text = language.get(135441),
							color = ccc3(223, 223, 223)
						}
					}
				},
				{
					zoomOnTouchDown = false,
					name = "renameCancel",
					h = 62,
					type = "button",
					w = 195,
					y = 60,
					x = 480,
					normal = {
						frame = false,
						path = "res/ui/common/button/public_btn_red.png"
					},
					touched = {
						frame = false,
						path = "res/ui/common/button/public_btn_red_c.png"
					},
					children = {
						{
							name = "cancel",
							y = 33,
							type = "label",
							fontSize = 30,
							x = 98,
							text = language.get(135442),
							color = ccc3(223, 223, 223)
						}
					}
				},
				{
					x = 80,
					name = "arrow",
					y = 140,
					type = "sprite",
					anchorPoint = ccp(0.5, 0.5),
					pic = {
						frame = false,
						path = "res/ui/guide/prompt_arrow_input.png"
					}
				}
			}
		}
	}
}

function var_0_4.onGetBetrayReward(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showOpenBoxEffect()

		local var_3_0 = {}

		table.insert(var_3_0, {
			id = 19,
			value = arg_3_0.action.data.gold
		})
		globalAction_gotResource(var_3_0)

		user.havaBetrayReward = 0

		notice.control.refreshLayer()

		if user.havaBetrayChangeNameReward == 1 then
			roleDialogue.control.loadSpeak(1908)
		end
	end

	cmgr.sendRequest(var_2_0, actions.getBetrayReward)
end

function var_0_4.showOpenBoxEffect(arg_4_0)
	arg_4_0.view.widgets.btn_reward:setEnabled(false)
	arg_4_0.view.widgets.box:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/gxb_bx_c.png"):displayFrame())
	arg_4_0.view.widgets.light:setVisible(true)
	arg_4_0.view.widgets.light:stopAllActions()

	local var_4_0 = CCArray:create()

	var_4_0:addObject(CCCallFuncN:create(function()
		arg_4_0.view.widgets.light:setOpacity(120)
	end))
	var_4_0:addObject(CCFadeIn:create(0.6))
	var_4_0:addObject(CCFadeOut:create(1.4))
	var_4_0:addObject(CCCallFuncN:create(function()
		arg_4_0.view.widgets.light:setVisible(false)
	end))

	local var_4_1 = CCSequence:create(var_4_0)

	arg_4_0.view.widgets.light:runAction(var_4_1)

	for iter_4_0 = 1, 3 do
		local var_4_2 = arg_4_0.view.widgets["star" .. iter_4_0]

		var_4_2:setVisible(true)
		var_4_2:stopAllActions()
		var_4_2:setScale(0.05)

		local var_4_3 = CCArray:create()

		var_4_3:addObject(CCScaleTo:create(0.5, 1))
		var_4_3:addObject(CCScaleTo:create(0.5, 0.05))

		local var_4_4 = CCSpawn:createWithTwoActions(CCSequence:create(var_4_3), CCRotateBy:create(1, 360))
		local var_4_5 = CCRepeat:create(var_4_4, 2)
		local var_4_6 = CCArray:create()

		var_4_6:addObject(CCDelayTime:create((iter_4_0 - 1) * 0.2))
		var_4_6:addObject(var_4_5)
		var_4_6:addObject(CCCallFuncN:create(function()
			var_4_2:setVisible(false)
		end))

		local var_4_7 = CCSequence:create(var_4_6)

		var_4_2:runAction(var_4_7)
	end
end

function var_0_4.addPlayer(arg_8_0)
	if arg_8_0.playerNode then
		arg_8_0.playerNode:removeAllChildrenWithCleanup(true)
	else
		arg_8_0.playerNode = CCNode:create()

		arg_8_0.view.widgets.panel:addChild(arg_8_0.playerNode, 100)
	end

	for iter_8_0 = 1, 10 do
		local var_8_0 = arg_8_0.info.playerList[iter_8_0].playerName
		local var_8_1 = var_0_1[iter_8_0]
		local var_8_2 = iter_8_0 % 2 == 1 and var_0_2[math.random(1, 2)] or var_0_3[math.random(1, 2)]
		local var_8_3 = CCSprite:create("res/ui/rankInfo/DailyFeatView/" .. var_8_2)

		var_8_3:setScale(var_0_5)
		var_8_3:setPosition(var_8_1)
		arg_8_0.playerNode:addChild(var_8_3)

		if iter_8_0 <= 9 then
			local var_8_4 = CCSprite:create("res/ui/activity/betray/cc_view_bg.png")

			var_8_4:setPosition(ccp(var_8_1.x, var_8_1.y + 35))
			arg_8_0.playerNode:addChild(var_8_4)

			local var_8_5 = CCLabelTTF:create(var_8_0, "Thonburi-Bold", 20)

			var_8_5:setPosition(ccp(var_8_1.x, var_8_1.y + 35))
			arg_8_0.playerNode:addChild(var_8_5)
		end
	end

	local var_8_6 = CCSprite:create()

	var_8_6:setPosition(ccp(560, 185))
	arg_8_0.playerNode:addChild(var_8_6)

	arg_8_0.player = var_8_6

	local var_8_7 = CCArray:create()

	for iter_8_1 = 1, 12 do
		local var_8_8 = CCSprite:create(string.format("res/ui/rankInfo/DailyFeatView/yq_walk%02d.png", iter_8_1))

		var_8_7:addObject(var_8_8:displayFrame())
	end

	local var_8_9 = CCAnimation:createWithSpriteFrames(var_8_7, 0.05)
	local var_8_10 = CCAnimate:create(var_8_9)

	var_8_6:runAction(CCRepeat:create(var_8_10, 4))

	local var_8_11 = CCArray:create()

	var_8_11:addObject(CCMoveBy:create(2.4, ccp(-200, 100)))
	var_8_11:addObject(CCCallFuncN:create(function()
		roleDialogue.control.loadSpeak(1514)
	end))

	local var_8_12 = CCSequence:create(var_8_11)

	var_8_6:runAction(var_8_12)
end

function var_0_4.showBox(arg_10_0)
	arg_10_0.player:setVisible(false)
	arg_10_0.view.widgets.boxNode:setPosition(ccp(-125, 263))
	arg_10_0.view.widgets.boxNode:setVisible(true)
	arg_10_0.view.widgets.boxNode:runAction(CCEaseBounceOut:create(CCMoveBy:create(1, ccp(0, -200))))
end

function var_0_4.showRename(arg_11_0)
	arg_11_0.view.widgets.renameDialog:setVisible(true)
end

function var_0_4.showPanel(arg_12_0, arg_12_1)
	arg_12_0.info = arg_12_1

	arg_12_0:addPlayer()
end

function var_0_4.ctor(arg_13_0, arg_13_1, arg_13_2)
	rmgr.loadResource("res/ui/character/character.plist")
	log.info("@@ 君主馈赠")

	arg_13_0.view = {}

	uiutil.initWidgets(arg_13_0.view, arg_13_0.layout)

	if arg_13_1 then
		arg_13_0:addChild(arg_13_0.view.widgets.panel)
		arg_13_1:addChild(arg_13_0)
	end

	arg_13_0.view.widgets.bg:setTextureRect(CCRectMake(0, 80, 1136, 652))
	arg_13_0.view.widgets.bg:setVisible(true)
	arg_13_0.view.widgets.btn_reward:setOpacity(0)
	arg_13_0.view.widgets.btn_reward:addHandleOfControlEvent(function()
		log.info("btn_reward")
		arg_13_0:onGetBetrayReward()
	end, CCControlEventTouchUpInside)

	local var_13_0 = ({
		"caocao",
		"liubei",
		"sunquan"
	})[user.player.forceId]

	arg_13_0.view.widgets.bossImage:setDisplayFrame(CCSprite:create(rmgr.getGeneralBust(var_13_0)):displayFrame())
	arg_13_0.view.widgets.dice:addHandleOfControlEvent(function()
		arg_13_0:onDice()
	end, CCControlEventTouchUpInside)
	arg_13_0.view.widgets.renameOk:addHandleOfControlEvent(function()
		arg_13_0:renameOk()
	end, CCControlEventTouchUpInside)
	arg_13_0.view.widgets.renameCancel:addHandleOfControlEvent(function()
		arg_13_0:renameCancel()
	end, CCControlEventTouchUpInside)
	arg_13_0:onDice()

	local var_13_1 = CCMoveBy:create(0.4, ccp(50, 0))
	local var_13_2 = CCEaseOut:create(var_13_1, 1)
	local var_13_3 = CCMoveBy:create(0.4, ccp(-50, 0))
	local var_13_4 = CCEaseIn:create(var_13_3, 1)
	local var_13_5 = CCArray:create()

	var_13_5:addObject(var_13_2)
	var_13_5:addObject(var_13_4)

	local var_13_6 = CCSequence:create(var_13_5)
	local var_13_7 = CCRepeatForever:create(tolua.cast(var_13_6, "CCActionInterval"))

	arg_13_0.view.widgets.arrow:runAction(var_13_7)
	arg_13_0:showPanel(arg_13_2)
end

function var_0_4.onDice(arg_18_0)
	cmgr.sendRequest(function(arg_19_0)
		arg_18_0.view.widgets.inputBox:setText(arg_19_0.action.data.list[1])
	end, actions.autoname, "")
end

function var_0_4.renameOk(arg_20_0)
	cmgr.sendRequest(function(arg_21_0)
		if arg_21_0.action.state == 1 then
			user.havaBetrayChangeNameReward = 0

			arg_20_0.view.widgets.renameDialog:setVisible(false)

			user.player.name = arg_21_0.action.data.playerName

			roleDialogue.control.loadSpeak(1909)
		end
	end, actions.createAndName, arg_20_0.view.widgets.inputBox:getText(), user.player.pic)
end

function var_0_4.renameCancel(arg_22_0)
	cmgr.sendRequest(function(arg_23_0)
		arg_22_0.view.widgets.renameDialog:setVisible(false)
		roleDialogue.control.loadSpeak(1910)

		user.havaBetrayChangeNameReward = 0
	end, actions.giveUpBetrayChangeName, "")
end

function var_0_4.onEnter(arg_24_0)
	arg_24_0.showBoxRef = handler(arg_24_0, arg_24_0.showBox)
	arg_24_0.showRenameRef = handler(arg_24_0, arg_24_0.showRename)

	eventManager.registerEvent("getBetrayReward", arg_24_0.showBoxRef)
	eventManager.registerEvent("showRenameDialog", arg_24_0.showRenameRef)
end

function var_0_4.onExit(arg_25_0)
	eventManager.unregisterEvent("getBetrayReward", arg_25_0.showBoxRef)
	eventManager.unregisterEvent("showRenameDialog", arg_25_0.showRenameRef)
end

return var_0_4
