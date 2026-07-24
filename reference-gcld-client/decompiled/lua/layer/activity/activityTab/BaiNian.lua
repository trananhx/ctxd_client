local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.line2Scale = 0.75
else
	var_0_0.line2Scale = 1
end

local var_0_1 = {
	[3] = 3,
	[5] = 6,
	[100] = 100,
	[101] = 15
}
local var_0_2 = {
	"caocao",
	"liubei",
	"sunquan"
}
local var_0_3 = tool.hexToRgb("#D9EDC5")
local var_0_4 = ccc3(0, 255, 0)
local var_0_5 = colorQuality[5]
local var_0_6 = colorQuality[4]
local var_0_7 = 1
local var_0_8 = class("BaiNian", function()
	return createBaseLayer()
end)

var_0_8.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = false,
		path = "res/ui/activity/wish/xcxy_bg1.jpg"
	},
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			y = 473,
			x = 458,
			type = "sprite",
			zorder = 100,
			pic = {
				frame = true,
				path = "bn_title.png"
			}
		},
		{
			fontSize = 22,
			name = "leftTime",
			scale = 1.5909090909090908,
			type = "label",
			style = "label_warlock",
			y = 460,
			x = 760,
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_5
		},
		{
			x = 10,
			name = "npcPic",
			y = 5,
			type = "sprite",
			scale = 1.2,
			visible = false,
			pic = {
				frame = false,
				path = "res/ui/common/halfPic/halfPic_xushu.png"
			},
			anchorPoint = ccp(0, 0)
		},
		{
			fontSize = 22,
			style = "label_warlock",
			y = 402,
			type = "label",
			x = 370,
			textId = 135271,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 22,
			name = "info",
			y = 360,
			type = "label",
			style = "label_warlock",
			x = 400,
			anchorPoint = ccp(0, 0.5),
			color = var_0_3
		},
		{
			x = 630,
			name = "panelBg",
			y = 175,
			type = "sprite",
			pic = {
				frame = true,
				path = "bn_nd02.png"
			}
		},
		{
			y = 0,
			name = "selWishNode",
			type = "node",
			x = 0,
			children = {
				{
					y = 50,
					name = "btn_wish",
					style = "button_yel2",
					type = "button",
					x = 630
				},
				{
					fontSize = 22,
					style = "label_warlock",
					y = 50,
					type = "label",
					x = 630,
					textId = 135272,
					color = var_0_3
				}
			}
		},
		{
			y = 0,
			name = "boxNode",
			type = "node",
			x = 0,
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
		}
	}
}
var_0_8.tipFrame = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(1, 1),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			height = 0,
			name = "tipMsg",
			type = "label",
			style = "label_warlock",
			width = 200,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_3
		}
	}
}
var_0_8.talkFrame = {
	y = 300,
	z = 200,
	name = "talkFrame",
	type = "sprite",
	visible = false,
	x = 0,
	pic = {
		frame = true,
		path = "bn_bg.png"
	},
	anchorPoint = ccp(0, 0.5),
	children = {
		{
			x = 0,
			name = "pic",
			y = 12,
			type = "sprite",
			scale = 1.2,
			pic = {
				frame = true,
				path = "bn_bg.png"
			},
			anchorPoint = ccp(0, 0)
		},
		{
			x = 335,
			name = "line1",
			y = 145,
			type = "sprite",
			pic = {
				frame = true,
				path = "bn_tit_small1.png"
			},
			anchorPoint = ccp(0, 0.5)
		},
		{
			x = 335,
			name = "line2",
			y = 70,
			type = "sprite",
			pic = {
				frame = true,
				path = "bn_tit_big1.png"
			},
			anchorPoint = ccp(0, 0.5),
			scale = var_0_0.line2Scale
		}
	}
}

function var_0_8.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getBaiNianActivity)
end

function var_0_8.onGetBaiNianReward(arg_4_0, arg_4_1)
	local function var_4_0(arg_5_0)
		arg_4_0:refresh()
	end

	cmgr.sendRequest(var_4_0, actions.getBaiNianReward, arg_4_1)
end

function var_0_8.onGetBaiNianBigGift(arg_6_0)
	log.info("onGetBaiNianBigGift")

	local function var_6_0(arg_7_0)
		local var_7_0 = arg_7_0.action.data.rewards
		local var_7_1 = {}

		for iter_7_0 = 1, #var_7_0 do
			local var_7_2 = var_7_0[iter_7_0]
			local var_7_3 = {
				id = var_0_1[var_7_2.pic or var_7_2.type],
				value = var_7_2.value
			}

			table.insert(var_7_1, var_7_3)
		end

		globalAction_gotResource(var_7_1)
		arg_6_0:showOpenBoxEffect()
	end

	cmgr.sendRequest(var_6_0, actions.getBaiNianBigGift)
end

function var_0_8.showBaiNianEffect(arg_8_0)
	arg_8_0.view.widgets.selWishNode:setVisible(false)
	arg_8_0:showTalk(function()
		log.info("show player talk")
		arg_8_0:showTalk(function()
			log.info("show npc talk1")
			arg_8_0:onGetBaiNianReward(var_0_7)
		end, true, 1)
	end, false)
end

function var_0_8.showOpenBoxEffect(arg_11_0)
	arg_11_0:showTalk(function()
		log.info("show npc talk2")
		arg_11_0:refresh()

		local var_12_0 = CCSprite:createWithSpriteFrameName("bn_icon_horse.png")

		var_12_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
		smgr.getLayer("pushLayer"):addChild(var_12_0)

		local var_12_1 = CCArray:create()

		var_12_1:addObject(CCDelayTime:create(2))
		var_12_1:addObject(CCSpawn:createWithTwoActions(CCScaleTo:create(1, 0.2), CCMoveTo:create(1, ccp(0, visibleSize.height))))
		var_12_1:addObject(CCCallFuncN:create(function()
			var_12_0:removeFromParentAndCleanup(true)
		end))

		local var_12_2 = CCSequence:create(var_12_1)

		var_12_0:runAction(var_12_2)
	end, true, 2)
	arg_11_0.view.widgets.box:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/gxb_bx_c.png"):displayFrame())
	arg_11_0.view.widgets.light:setVisible(true)
	arg_11_0.view.widgets.light:stopAllActions()

	local var_11_0 = CCArray:create()

	var_11_0:addObject(CCCallFuncN:create(function()
		arg_11_0.view.widgets.light:setOpacity(120)
	end))
	var_11_0:addObject(CCFadeIn:create(0.6))
	var_11_0:addObject(CCFadeOut:create(1.4))
	var_11_0:addObject(CCCallFuncN:create(function()
		arg_11_0.view.widgets.light:setVisible(false)
	end))

	local var_11_1 = CCSequence:create(var_11_0)

	arg_11_0.view.widgets.light:runAction(var_11_1)

	for iter_11_0 = 1, 3 do
		local var_11_2 = arg_11_0.view.widgets["star" .. iter_11_0]

		var_11_2:setVisible(true)
		var_11_2:stopAllActions()
		var_11_2:setScale(0.05)

		local var_11_3 = CCArray:create()

		var_11_3:addObject(CCScaleTo:create(0.5, 1))
		var_11_3:addObject(CCScaleTo:create(0.5, 0.05))

		local var_11_4 = CCSpawn:createWithTwoActions(CCSequence:create(var_11_3), CCRotateBy:create(1, 360))
		local var_11_5 = CCRepeat:create(var_11_4, 2)
		local var_11_6 = CCArray:create()

		var_11_6:addObject(CCDelayTime:create((iter_11_0 - 1) * 0.2))
		var_11_6:addObject(var_11_5)
		var_11_6:addObject(CCCallFuncN:create(function()
			var_11_2:setVisible(false)
		end))

		local var_11_7 = CCSequence:create(var_11_6)

		var_11_2:runAction(var_11_7)
	end
end

function var_0_8.showPanel(arg_17_0, arg_17_1)
	arg_17_0.info = arg_17_1

	local var_17_0 = arg_17_1.id ~= 0

	arg_17_0.view.widgets.selWishNode:setVisible(not var_17_0)
	arg_17_0.view.widgets.boxNode:setVisible(var_17_0)
	arg_17_0.view.widgets.info:setString(language.get(var_17_0 and 135279 or 135278))
	arg_17_0.view.widgets.panelBg:setDisplayFrame(tool.spriteFrameByName(var_17_0 and "bn_nd01.png" or "bn_nd02.png"))

	if var_17_0 then
		local var_17_1
		local var_17_2 = arg_17_1.received == 0 and "res/ui/rankInfo/DailyFeatView/gxb_bx.png" or "res/ui/rankInfo/DailyFeatView/gxb_bx_c.png"

		arg_17_0.view.widgets.box:setDisplayFrame(CCSprite:create(var_17_2):displayFrame())
		arg_17_0.view.widgets.btn_reward:addHandleOfControlEvent(function()
			if arg_17_0.info.received == 0 then
				log.info("getGift")
				arg_17_0:onGetBaiNianBigGift()
			else
				log.info("showTip")

				local var_18_0 = arg_17_1.bless[arg_17_1.id].rewards
				local var_18_1 = 0
				local var_18_2 = 0
				local var_18_3 = 0

				for iter_18_0 = 1, #var_18_0 do
					local var_18_4 = var_18_0[iter_18_0]

					if var_18_4.type == 3 then
						var_18_3 = var_18_4.value
					elseif var_18_4.type == 100 then
						var_18_1 = var_18_4.value
					elseif var_18_4.type == 5 then
						var_18_2 = var_18_4.value
					end
				end

				local var_18_5 = language.get(135273) .. "\n" .. language.get(70004) .. language.get(135039, var_18_1) .. "\n" .. language.get(10103) .. language.get(135039, var_18_3) .. "\n" .. language.get(10107) .. language.get(135039, var_18_2)

				arg_17_0:showTip(var_18_5)
			end
		end, CCControlEventTouchUpInside)
	end
end

function var_0_8.ctor(arg_19_0, arg_19_1, arg_19_2)
	log.info("@@ 新春拜年活动")
	rmgr.loadResource("res/ui/activity/baiNian/baiNianPic.plist")

	arg_19_0.view = {}

	uiutil.initWidgets(arg_19_0.view, arg_19_0.layout)

	arg_19_0.leftTime = arg_19_0.view.widgets.leftTime

	if arg_19_1 then
		arg_19_0:addChild(arg_19_0.view.widgets.panel)
		arg_19_1:addChild(arg_19_0)
	end

	local var_19_0 = CCMenu:create()

	arg_19_0.view.widgets.selWishNode:addChild(var_19_0)
	var_19_0:setPosition(ccp(0, 0))

	for iter_19_0 = 1, 3 do
		local var_19_1 = CCSprite:createWithSpriteFrameName(string.format("bn_hz%02d.png", iter_19_0))
		local var_19_2 = CCSprite:createWithSpriteFrameName(string.format("bn_hz%02d_h.png", iter_19_0))
		local var_19_3 = CCMenuItemSprite:create(var_19_1, var_19_2)

		var_19_0:addChild(var_19_3)
		var_19_3:setPosition(ccp(470 + (iter_19_0 - 1) * 160, 200))
		var_19_3:registerScriptTapHandler(function()
			log.info("btn_wish", iter_19_0)
			var_19_3:selected()

			if var_0_7 ~= iter_19_0 then
				arg_19_0.view.widgets["btn_wish" .. var_0_7]:unselected()

				var_0_7 = iter_19_0
			end
		end)

		arg_19_0.view.widgets["btn_wish" .. iter_19_0] = var_19_3
	end

	var_0_7 = 1

	arg_19_0.view.widgets.btn_wish1:selected()
	arg_19_0.view.widgets.btn_wish:addHandleOfControlEvent(function()
		arg_19_0:showBaiNianEffect()
	end, CCControlEventTouchUpInside)
	arg_19_0.view.widgets.btn_reward:setOpacity(0)
	arg_19_0.view.widgets.npcPic:setDisplayFrame(CCSprite:create("res/ui/common/halfPic/halfPic_" .. var_0_2[user.player.forceId] .. ".png"):displayFrame())
	arg_19_0.view.widgets.npcPic:setVisible(true)
	arg_19_0:showPanel(arg_19_2)
end

function var_0_8.showTip(arg_22_0, arg_22_1)
	log.info("should show tips ")

	local var_22_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_22_0:registerScriptTouchHandler(function(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 == CCTOUCHBEGAN then
			return true
		elseif arg_23_0 == CCTOUCHMOVED then
			return true
		elseif arg_23_0 == CCTOUCHENDED then
			pcall(var_22_0.removeFromParentAndCleanup, var_22_0, true)

			return true
		end
	end, false, true)
	var_22_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_22_0, 60000)

	local var_22_1 = 0
	local var_22_2 = 0
	local var_22_3 = {}

	uiutil.initWidgets(var_22_3, var_0_8.tipFrame)
	var_22_0:addChild(var_22_3.widgets.tipFrame)
	var_22_3.widgets.tipFrame:setAnchorPoint(ccp(0, 0))
	var_22_3.widgets.tipMsg:setDimensions(CCSizeMake(200, 0))

	local var_22_4, var_22_5 = tool.getPositionInScreen(arg_22_0.view.widgets.btn_reward)
	local var_22_6 = var_22_4
	local var_22_7 = var_22_5 + 20

	var_22_3.widgets.tipMsg:setString(arg_22_1)

	local var_22_8 = var_22_3.widgets.tipMsg:getContentSize().width
	local var_22_9 = var_22_3.widgets.tipMsg:getContentSize().height

	var_22_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_22_8 + 30, var_22_9 + 30))
	var_22_3.widgets.tipFrame:setPosition(ccp(var_22_6, var_22_7))
	var_22_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_22_3.widgets.tipFrame:setVisible(true)
end

function var_0_8.showTalk(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	log.info("should show tips ")

	local var_24_0 = {}

	uiutil.initWidgets(var_24_0, var_0_8.talkFrame)
	arg_24_0.view.widgets.panel:addChild(var_24_0.widgets.talkFrame)
	var_24_0.widgets.talkFrame:setPosition(ccp(0, 300))

	if arg_24_2 then
		var_24_0.widgets.pic:setDisplayFrame(CCSprite:create("res/ui/common/halfPic/halfPic_" .. var_0_2[user.player.forceId] .. ".png"):displayFrame())
		var_24_0.widgets.pic:setScale(1.2)

		local var_24_1
		local var_24_2
		local var_24_3

		if arg_24_3 == 1 then
			var_24_1 = "bn_tit_small2.png"
			var_24_3 = "bn_tit_big4.png"
		else
			var_24_1 = "bn_tit_small3.png"
			var_24_3 = "bn_tit_big5.png"
		end

		var_24_0.widgets.line1:setDisplayFrame(tool.spriteFrameByName(var_24_1))
		var_24_0.widgets.line2:setDisplayFrame(tool.spriteFrameByName(var_24_3))
		var_24_0.widgets.line1:setPosition(ccp(335, 145))
		var_24_0.widgets.line2:setPosition(ccp(335, 70))
	else
		var_24_0.widgets.pic:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerPic/player%d.png", user.player.pic)):displayFrame())
		var_24_0.widgets.pic:setScale(0.65)

		local var_24_4 = ({
			"bn_tit_big1.png",
			"bn_tit_big2.png",
			"bn_tit_big3.png"
		})[var_0_7]

		var_24_0.widgets.line1:setDisplayFrame(tool.spriteFrameByName("bn_tit_small1.png"))
		var_24_0.widgets.line2:setDisplayFrame(tool.spriteFrameByName(var_24_4))
		var_24_0.widgets.line1:setPosition(ccp(240, 145))
		var_24_0.widgets.line2:setPosition(ccp(240, 70))
	end

	var_24_0.widgets.pic:setOpacity(0)
	var_24_0.widgets.line1:setOpacity(0)
	var_24_0.widgets.line2:setOpacity(0)
	var_24_0.widgets.talkFrame:setVisible(true)

	local var_24_5 = 240
	local var_24_6 = 360
	local var_24_7 = CCArray:create()

	var_24_7:addObject(CCFadeIn:create(0.3))

	if arg_24_2 and arg_24_3 == 2 then
		var_24_7:addObject(CCDelayTime:create(0.5))
	end

	var_24_7:addObject(CCCallFuncN:create(function()
		local var_25_0, var_25_1 = var_24_0.widgets.pic:getPosition()

		var_24_0.widgets.pic:setPositionX(var_25_0 - var_24_5)

		local var_25_2 = CCSpawn:createWithTwoActions(CCMoveBy:create(0.2, ccp(var_24_5, 0)), CCFadeIn:create(0.2))

		var_24_0.widgets.pic:runAction(var_25_2)

		local var_25_3, var_25_4 = var_24_0.widgets.line1:getPosition()

		var_24_0.widgets.line1:setPositionX(var_25_3 + var_24_6)
		var_24_0.widgets.line2:setPositionX(var_25_3 + var_24_6)

		local var_25_5 = CCSpawn:createWithTwoActions(CCMoveBy:create(0.3, ccp(-var_24_6, 0)), CCFadeIn:create(0.3))

		var_24_0.widgets.line1:runAction(var_25_5)
		var_24_0.widgets.line2:runAction(tolua.cast(var_25_5:copy(), "CCAction"))
	end))
	var_24_7:addObject(CCDelayTime:create(2))
	var_24_7:addObject(CCCallFuncN:create(function()
		var_24_0.widgets.talkFrame:removeFromParentAndCleanup(true)

		if arg_24_1 then
			arg_24_1()
		end
	end))

	local var_24_8 = CCSequence:create(var_24_7)

	var_24_0.widgets.talkFrame:runAction(var_24_8)
end

return var_0_8
