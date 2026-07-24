local var_0_0 = require("res/native/offset").get("layer.nation.buildNation.Feast")
local var_0_1 = {
	ccp(575, 380),
	ccp(685, 320),
	ccp(775, 260),
	ccp(655, 390),
	ccp(755, 330),
	ccp(855, 270)
}
local var_0_2 = {
	ccp(238, 344),
	ccp(713, 605),
	ccp(362, 280),
	ccp(837, 544),
	ccp(475, 215),
	ccp(969, 479),
	ccp(613, 152),
	ccp(1097, 413),
	ccp(755, 81),
	ccp(1225, 351)
}
local var_0_3 = {
	"yq_wj1.png",
	"yq_wj3.png"
}
local var_0_4 = {
	"yq_wj2.png",
	"yq_wj4.png"
}
local var_0_5 = false
local var_0_6 = class("Feast", function()
	return createBaseLayer()
end)

var_0_6.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			name = "bg",
			type = "sprite",
			x = visibleSize.width / 2,
			y = visibleSize.height / 2,
			pic = {
				path = "res/ui/kfsy/kfsy_ky1.jpg"
			},
			children = {
				{
					y = 575,
					x = 320,
					type = "sprite",
					pic = {
						path = "res/ui/rankInfo/DailyFeatView/yq_zr.png"
					}
				},
				{
					y = 630,
					x = 320,
					type = "sprite",
					pic = {
						path = "res/ui/activity/betray/cc_view_bg.png"
					}
				},
				{
					fontSize = 20,
					name = "kingName",
					y = 630,
					type = "label",
					x = 320
				},
				{
					y = 310,
					name = "btn_congratulate",
					type = "button",
					visible = false,
					x = 693,
					normal = {
						path = "res/ui/gonghe/ghjl_btn_gh.png"
					},
					touched = {
						path = "res/ui/gonghe/ghjl_btn_ghc.png"
					},
					w = 153 + (var_0_0.btn_congratulate_w or 0),
					h = 161 + (var_0_0.btn_congratulate_h or 0)
				},
				{
					type = "sprite",
					name = "bg_medal",
					y = 440,
					visible = false,
					x = 550,
					pic = {
						path = "res/ui/silk/market/scpm_samll_view_icon.png"
					},
					children = {
						{
							w = 72,
							name = "btn_medal",
							h = 72,
							type = "button",
							y = 39,
							x = 39,
							normal = {
								path = "res/ui/nation/buildNation/Reward/kaiguoxunzhang.jpg"
							},
							touched = {
								path = "res/ui/nation/buildNation/Reward/kaiguoxunzhang_l.jpg"
							}
						},
						{
							y = 100,
							x = 39,
							type = "sprite",
							scale = 1.5,
							pic = {
								path = "res/ui/activity/betray/cc_view_bg.png"
							}
						},
						{
							fontSize = 25,
							name = "xunzhang_name",
							y = 100,
							type = "label",
							x = 39,
							textId = 136058,
							color = colorQuality[6]
						},
						{
							type = "sprite",
							name = "arrow",
							y = 39,
							visible = false,
							x = 130,
							pic = {
								path = "res/ui/guide/jiantou-zuo.png"
							}
						}
					}
				},
				{
					type = "sprite",
					name = "bg_box",
					y = 195,
					visible = false,
					x = 960,
					pic = {
						path = "res/ui/rankInfo/DailyFeatView/yq_tz.png"
					},
					children = {
						{
							y = 95,
							name = "box",
							type = "sprite",
							x = 115,
							pic = {
								path = "res/ui/rankInfo/DailyFeatView/yq_bx.png"
							}
						},
						{
							x = 5,
							name = "npc1",
							y = 65,
							type = "sprite",
							scale = 1.2,
							pic = {
								path = "res/ui/rankInfo/DailyFeatView/yq_walk01.png"
							}
						},
						{
							x = 60,
							name = "npc2",
							y = 100,
							type = "sprite",
							scale = 1.2,
							zorder = -1,
							pic = {
								path = "res/ui/rankInfo/DailyFeatView/yq_walk01.png"
							}
						},
						{
							x = 155,
							name = "npc3",
							y = -15,
							type = "sprite",
							scale = 1.2,
							pic = {
								path = "res/ui/rankInfo/DailyFeatView/yq_walk01.png"
							}
						},
						{
							x = 210,
							name = "npc4",
							y = 20,
							type = "sprite",
							scale = 1.2,
							zorder = -1,
							pic = {
								path = "res/ui/rankInfo/DailyFeatView/yq_walk01.png"
							}
						}
					}
				}
			}
		},
		{
			w = 104,
			name = "btn_back",
			h = 50,
			type = "button",
			normal = {
				frame = true,
				path = "btn_back_a.png"
			},
			touched = {
				frame = true,
				path = "btn_back_c.png"
			},
			x = visibleSize.width - 70,
			y = visibleSize.height - 40
		}
	}
}
var_0_6.tipFrame = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(1, 0),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			name = "tipMsg",
			height = 0,
			type = "label",
			width = 200,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}

function var_0_6.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.kbFeastInfo)
end

function var_0_6.onGetReward(arg_4_0)
	local function var_4_0(arg_5_0)
		local var_5_0 = {}
		local var_5_1 = {}

		if arg_4_0.info.kbLv == 2 then
			var_5_1.id = 10040
		elseif arg_4_0.info.kbLv == 3 then
			var_5_1.id = 10045
		elseif arg_4_0.info.kbLv == 4 then
			var_5_1.id = 10056
		elseif arg_4_0.info.kbLv == 5 then
			var_5_1.id = 10060
		elseif arg_4_0.info.kbLv == 6 then
			var_5_1.id = 10065
		elseif arg_4_0.info.kbLv == 7 then
			var_5_1.id = 10071
		else
			var_5_1.id = 10026
		end

		var_5_1.value = 1

		table.insert(var_5_0, var_5_1)
		globalAction_gotResource(var_5_0)
		arg_4_0.view.widgets.bg_box:setVisible(false)
		arg_4_0.view.widgets.bg_medal:setVisible(false)

		var_0_5 = true

		if arg_4_0.info.kbLv and arg_4_0.info.kbLv == 3 then
			performWithDelay(arg_4_0.view.widgets.bg, function()
				arg_4_0:getDiwangYing()
			end, 0.5)
		else
			performWithDelay(arg_4_0.view.widgets.bg, function()
				arg_4_0:afterGetReward()
			end, 1.5)
		end
	end

	if var_0_5 then
		log.info("sdfdsadsda")

		local var_4_1 = {}
		local var_4_2 = {}

		var_4_2.id = 10046
		var_4_2.value = 1

		table.insert(var_4_1, var_4_2)
		globalAction_gotResource(var_4_1)
		arg_4_0.view.widgets.bg_box:setVisible(false)
		arg_4_0.view.widgets.bg_medal:setVisible(false)
		performWithDelay(arg_4_0.view.widgets.bg, function()
			arg_4_0:afterGetReward()
		end, 1.5)
	else
		log.info("aaaaa")
		cmgr.sendRequest(var_4_0, actions.kbGetCReward)
	end
end

function var_0_6.addPlayer(arg_9_0)
	if arg_9_0.playerNode then
		arg_9_0.playerNode:removeAllChildrenWithCleanup(true)
	else
		arg_9_0.playerNode = CCNode:create()

		arg_9_0.view.widgets.bg:addChild(arg_9_0.playerNode, 100)
	end

	if #arg_9_0.info.participants == 9 then
		table.insert(arg_9_0.info.participants, 9, {
			generalName = user.player.name
		})
	end

	for iter_9_0 = 1, 10 do
		local var_9_0 = arg_9_0.info.participants[iter_9_0].generalName
		local var_9_1 = var_0_2[iter_9_0]
		local var_9_2 = iter_9_0 % 2 == 1 and var_0_3[math.random(1, 2)] or var_0_4[math.random(1, 2)]
		local var_9_3 = CCSprite:create("res/ui/rankInfo/DailyFeatView/" .. var_9_2)

		var_9_3:setPosition(var_9_1)
		arg_9_0.playerNode:addChild(var_9_3)

		if iter_9_0 <= 9 then
			local var_9_4 = CCSprite:create("res/ui/activity/betray/cc_view_bg.png")

			var_9_4:setPosition(ccp(var_9_1.x, var_9_1.y + 35))
			arg_9_0.playerNode:addChild(var_9_4)

			local var_9_5 = CCLabelTTF:create(var_9_0, "Thonburi-Bold", 20)

			var_9_5:setPosition(ccp(var_9_1.x, var_9_1.y + 35))
			arg_9_0.playerNode:addChild(var_9_5)
		end

		arg_9_0.view.widgets["player" .. iter_9_0] = var_9_3
	end
end

function var_0_6.addDancer(arg_10_0)
	if arg_10_0.dancerNode then
		arg_10_0.dancerNode:removeAllChildrenWithCleanup(true)
	else
		arg_10_0.dancerNode = CCSpriteBatchNode:create("res/anim/buildNation/meinv.png")

		arg_10_0.view.widgets.bg:addChild(arg_10_0.dancerNode, 100)
	end

	for iter_10_0 = 1, 6 do
		local var_10_0 = CCSprite:createWithSpriteFrameName("meinv_1.png")

		var_10_0:setPosition(var_0_1[iter_10_0])
		var_10_0:setScale(1.2)
		var_10_0:setOpacity(0)
		arg_10_0.dancerNode:addChild(var_10_0)

		local var_10_1 = CCArray:create()

		for iter_10_1 = 1, 16 do
			local var_10_2 = CCSprite:createWithSpriteFrameName(string.format("meinv_%d.png", iter_10_1))

			var_10_1:addObject(var_10_2:displayFrame())
		end

		local var_10_3 = CCAnimation:createWithSpriteFrames(var_10_1, 0.1)
		local var_10_4 = CCAnimate:create(var_10_3)

		var_10_0:runAction(CCRepeatForever:create(var_10_4))
		var_10_0:runAction(CCFadeIn:create(1))
	end
end

function var_0_6.addBox(arg_11_0)
	arg_11_0.view.widgets.bg_box:setVisible(true)

	for iter_11_0 = 1, 4 do
		local var_11_0 = CCArray:create()

		for iter_11_1 = 1, 12 do
			local var_11_1 = CCSprite:create(string.format("res/ui/rankInfo/DailyFeatView/yq_walk%02d.png", iter_11_1))

			var_11_0:addObject(var_11_1:displayFrame())
		end

		local var_11_2 = CCAnimation:createWithSpriteFrames(var_11_0, 0.06)
		local var_11_3 = CCAnimate:create(var_11_2)

		arg_11_0.view.widgets["npc" .. iter_11_0]:runAction(CCRepeat:create(var_11_3, 4))
	end

	local var_11_4 = CCArray:create()

	var_11_4:addObject(CCMoveTo:create(2.88, ccp(550, 400)))
	var_11_4:addObject(CCCallFuncN:create(function()
		return
	end))

	local var_11_5 = CCSequence:create(var_11_4)

	arg_11_0.view.widgets.bg_box:runAction(var_11_5)

	local var_11_6 = CCArray:create()

	var_11_6:addObject(CCDelayTime:create(2.88))
	var_11_6:addObject(CCCallFuncN:create(function()
		local var_13_0 = rmgr.getAnimation("warlockUpgrade")
		local var_13_1 = CCAnimation:createWithSpriteFrames(var_13_0, 0.05)
		local var_13_2 = CCAnimate:create(var_13_1)
		local var_13_3 = CCSprite:create()

		var_13_3:setPosition(ccp(50, 50))
		arg_11_0.view.widgets.box:addChild(var_13_3, 200)
		var_13_3:runAction(var_13_2)
	end))
	var_11_6:addObject(CCDelayTime:create(0.6))
	var_11_6:addObject(CCCallFuncN:create(function()
		arg_11_0.view.widgets.box:removeAllChildrenWithCleanup(true)
		arg_11_0.view.widgets.box:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/yq_bx_c.png"):displayFrame())

		local var_14_0 = CCArray:create()

		var_14_0:addObject(CCShow:create())
		var_14_0:addObject(CCEaseSineOut:create(CCMoveTo:create(1, ccp(425, 540))))
		var_14_0:addObject(CCCallFuncN:create(function()
			arg_11_0.view.widgets.arrow:setVisible(true)
		end))

		local var_14_1 = CCSequence:create(var_14_0)

		arg_11_0.view.widgets.bg_medal:runAction(var_14_1)
	end))

	local var_11_7 = CCSequence:create(var_11_6)

	arg_11_0.view.widgets.box:runAction(var_11_7)
end

function var_0_6.addTalk(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	arg_16_0.talkTable = arg_16_0.talkTable or {}

	if arg_16_0.talkTable[arg_16_1] then
		pcall(arg_16_0.talkTable[arg_16_1].removeFromParentAndCleanup, arg_16_0.talkTable[arg_16_1], true)

		arg_16_0.talkTable[arg_16_1] = nil
	end

	if arg_16_2 == nil then
		return
	end

	local var_16_0
	local var_16_1
	local var_16_2

	arg_16_3 = arg_16_3 or 20

	if arg_16_1 == 0 then
		var_16_0, var_16_1 = arg_16_0.view.widgets.kingName:getPosition()
		var_16_2 = ccp(0, 1)
	elseif arg_16_1 >= 1 and arg_16_1 <= 9 then
		local var_16_3 = var_0_2[arg_16_1]

		var_16_0, var_16_1 = var_16_3.x, var_16_3.y + 35
		var_16_2 = arg_16_1 % 2 == 1 and ccp(0, 0) or ccp(1, 0)
	end

	local var_16_4 = {}

	uiutil.initWidgets(var_16_4, arg_16_0.tipFrame)
	var_16_4.widgets.tipMsg:setFontSize(arg_16_3)
	var_16_4.widgets.tipMsg:setString(tostring(arg_16_2))

	local var_16_5 = var_16_4.widgets.tipMsg:getContentSize()

	var_16_4.widgets.tipFrame:setPreferredSize(CCSizeMake(var_16_5.width + 20, var_16_5.height + 20))
	var_16_4.widgets.tipMsg:setPosition(ccp(10, 10))
	var_16_4.widgets.tipFrame:setVisible(true)
	var_16_4.widgets.tipFrame:setPosition(ccp(var_16_0, var_16_1))
	var_16_4.widgets.tipFrame:setAnchorPoint(var_16_2)
	arg_16_0.view.widgets.bg:addChild(var_16_4.widgets.tipFrame, 200)

	arg_16_0.talkTable[arg_16_1] = var_16_4.widgets.tipFrame

	return var_16_4.widgets.tipFrame
end

function var_0_6.onCongratulate(arg_17_0)
	arg_17_0:addTalk(0)
	arg_17_0.view.widgets.btn_congratulate:setVisible(false)

	local var_17_0 = {
		9,
		1,
		3,
		5,
		2,
		8
	}

	for iter_17_0, iter_17_1 in ipairs(var_17_0) do
		local var_17_1 = CCArray:create()

		var_17_1:addObject(CCDelayTime:create(1 * (iter_17_0 - 1)))
		var_17_1:addObject(CCCallFuncN:create(function()
			local var_18_0 = arg_17_0:addTalk(iter_17_1, language.get(136054))
			local var_18_1 = CCArray:create()

			var_18_1:addObject(CCDelayTime:create(0.8))
			var_18_1:addObject(CCCallFuncN:create(function()
				var_18_0:setVisible(false)
			end))

			local var_18_2 = CCSequence:create(var_18_1)

			var_18_0:runAction(var_18_2)
		end))

		local var_17_2 = CCSequence:create(var_17_1)

		arg_17_0.view.widgets.bg:runAction(var_17_2)
	end

	local var_17_3 = 0
	local var_17_4 = CCArray:create()

	var_17_4:addObject(CCDelayTime:create(5.5))
	var_17_4:addObject(CCCallFuncN:create(function()
		arg_17_0:addTalk(var_17_3, language.get(136055))
	end))
	var_17_4:addObject(CCDelayTime:create(1))
	var_17_4:addObject(CCCallFuncN:create(function()
		if arg_17_0.info.kbLv == 2 or arg_17_0.info.kbLv == 3 or arg_17_0.info.kbLv == 4 or arg_17_0.info.kbLv == 5 or arg_17_0.info.kbLv == 6 or arg_17_0.info.kbLv == 7 then
			arg_17_0:addTalk(var_17_3, language.get("222482_dongying"))
		else
			arg_17_0:addTalk(var_17_3, language.get(136056))
		end
	end))
	var_17_4:addObject(CCDelayTime:create(1))
	var_17_4:addObject(CCCallFuncN:create(function()
		local var_22_0 = arg_17_0:addTalk(var_17_3, language.get(136057))
		local var_22_1 = CCArray:create()

		var_22_1:addObject(CCDelayTime:create(2))
		var_22_1:addObject(CCCallFuncN:create(function()
			var_22_0:setVisible(false)
		end))

		local var_22_2 = CCSequence:create(var_22_1)

		var_22_0:runAction(var_22_2)
	end))
	var_17_4:addObject(CCDelayTime:create(0.5))
	var_17_4:addObject(CCCallFuncN:create(function()
		arg_17_0:addBox()
	end))

	local var_17_5 = CCSequence:create(var_17_4)

	arg_17_0.view.widgets.bg:runAction(var_17_5)
end

function var_0_6.getDiwangYing(arg_25_0)
	local var_25_0 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("diwangyin.jpg"))
	local var_25_1 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("diwangyin.jpg"))

	var_25_0:setPosition(ccp(36, 36))
	var_25_1:setPosition(ccp(36, 36))

	local var_25_2 = CCScale9Sprite:create()
	local var_25_3 = CCScale9Sprite:create()

	var_25_2:addChild(var_25_1)
	var_25_3:addChild(var_25_0)
	arg_25_0.view.widgets.btn_medal:setBackgroundSpriteForState(var_25_3, CCControlStateHighlighted)
	arg_25_0.view.widgets.btn_medal:setBackgroundSpriteForState(var_25_2, CCControlStateNormal)
	arg_25_0.view.widgets.xunzhang_name:setString(language.get("222485_dongying"))
	arg_25_0.view.widgets.bg_medal:setPosition(ccp(425, 440))

	local var_25_4 = CCArray:create()

	var_25_4:addObject(CCDelayTime:create(1))
	var_25_4:addObject(CCCallFuncN:create(function()
		arg_25_0.view.widgets.bg_box:setVisible(true)
		arg_25_0.view.widgets.bg_medal:setVisible(true)
	end))
	var_25_4:addObject(CCEaseSineOut:create(CCMoveTo:create(1, ccp(425, 540))))
	var_25_4:addObject(CCCallFuncN:create(function()
		arg_25_0.view.widgets.arrow:setVisible(true)
	end))

	local var_25_5 = CCSequence:create(var_25_4)

	arg_25_0.view.widgets.bg_medal:runAction(var_25_5)

	local var_25_6 = arg_25_0:addTalk(0, language.get("222483_dongying", user.player.name))
	local var_25_7 = CCArray:create()

	var_25_7:addObject(CCDelayTime:create(2.5))
	var_25_7:addObject(CCCallFuncN:create(function()
		var_25_6:setVisible(false)
	end))

	local var_25_8 = CCSequence:create(var_25_7)

	var_25_6:runAction(var_25_8)
end

function var_0_6.afterGetReward(arg_29_0)
	local var_29_0 = arg_29_0:addTalk(0, language.get(136059))
	local var_29_1 = CCArray:create()

	var_29_1:addObject(CCDelayTime:create(2.5))
	var_29_1:addObject(CCCallFuncN:create(function()
		var_29_0:setVisible(false)
	end))

	local var_29_2 = CCSequence:create(var_29_1)

	var_29_0:runAction(var_29_2)

	local var_29_3 = {
		136061,
		136062,
		136063,
		136064
	}

	for iter_29_0 = 1, 9 do
		local var_29_4 = CCArray:create()

		var_29_4:addObject(CCDelayTime:create(1 + 0.08 * math.random(0, 100)))
		var_29_4:addObject(CCCallFuncN:create(function()
			local var_31_0 = arg_29_0:addTalk(iter_29_0, language.get(136060))
			local var_31_1 = CCArray:create()

			var_31_1:addObject(CCDelayTime:create(1.5))
			var_31_1:addObject(CCCallFuncN:create(function()
				arg_29_0:addTalk(iter_29_0)
			end))
			var_31_1:addObject(CCDelayTime:create(0.15 * math.random(0, 100)))
			var_31_1:addObject(CCCallFuncN:create(function()
				arg_29_0:addTalk(iter_29_0, language.get(var_29_3[math.random(1, 4)]))
			end))

			local var_31_2 = CCSequence:create(var_31_1)

			arg_29_0.view.widgets["player" .. iter_29_0]:runAction(CCRepeatForever:create(var_31_2))
		end))

		local var_29_5 = CCSequence:create(var_29_4)

		arg_29_0.view.widgets.bg:runAction(var_29_5)
	end

	arg_29_0:addDancer()
end

function var_0_6.showPanel(arg_34_0, arg_34_1)
	arg_34_0.info = arg_34_1

	arg_34_0.view.widgets.kingName:setString(arg_34_1.kingName)
	arg_34_0:addPlayer()

	if arg_34_1.kbLv == 2 or arg_34_1.kbLv == 3 or arg_34_1.kbLv == 4 or arg_34_1.kbLv == 5 or arg_34_0.info.kbLv == 6 or arg_34_0.info.kbLv == 7 then
		local var_34_0 = {
			[2] = {
				pic = "ejwcxz.jpg",
				txt = "221049_buildNation"
			},
			[3] = {
				pic = "sjwcxz.jpg",
				txt = "222484_dongying"
			},
			[4] = {
				pic = "sijwcxz.jpg",
				txt = 136577
			},
			[5] = {
				pic = "wjwcxz.jpg",
				txt = "222486_dongying"
			},
			[6] = {
				pic = "ljwcxz.jpg",
				txt = "222487_dongying"
			},
			[7] = {
				pic = "qjwcxz.jpg",
				txt = "222488_dongying"
			}
		}
		local var_34_1 = CCScale9Sprite:createWithSpriteFrameName(var_34_0[arg_34_1.kbLv].pic)
		local var_34_2 = CCScale9Sprite:createWithSpriteFrameName(var_34_0[arg_34_1.kbLv].pic)

		arg_34_0.view.widgets.btn_medal:setBackgroundSpriteForState(var_34_2, CCControlStateHighlighted)
		arg_34_0.view.widgets.btn_medal:setBackgroundSpriteForState(var_34_1, CCControlStateNormal)
		arg_34_0.view.widgets.xunzhang_name:setString(language.get(var_34_0[arg_34_1.kbLv].txt))
	end

	local var_34_3 = 0

	if arg_34_1.kbLv == 2 then
		arg_34_0:addTalk(var_34_3, language.get("221081_buildNation"))

		local var_34_4 = CCArray:create()

		var_34_4:addObject(CCDelayTime:create(1))
		var_34_4:addObject(CCCallFuncN:create(function()
			arg_34_0:addTalk(var_34_3, language.get("221082_buildNation"))
		end))
		var_34_4:addObject(CCCallFuncN:create(function()
			arg_34_0.view.widgets.btn_congratulate:setVisible(true)
		end))

		local var_34_5 = CCSequence:create(var_34_4)

		arg_34_0.view.widgets.bg:runAction(var_34_5)
	elseif arg_34_1.kbLv == 3 or arg_34_1.kbLv == 4 or arg_34_1.kbLv == 5 or arg_34_0.info.kbLv == 6 or arg_34_0.info.kbLv == 7 then
		arg_34_0:addTalk(var_34_3, language.get("222480_dongying"))

		local var_34_6 = CCArray:create()

		var_34_6:addObject(CCDelayTime:create(1))
		var_34_6:addObject(CCCallFuncN:create(function()
			arg_34_0:addTalk(var_34_3, language.get("222482_dongying"))
		end))
		var_34_6:addObject(CCCallFuncN:create(function()
			arg_34_0.view.widgets.btn_congratulate:setVisible(true)
		end))

		local var_34_7 = CCSequence:create(var_34_6)

		arg_34_0.view.widgets.bg:runAction(var_34_7)
	else
		arg_34_0:addTalk(var_34_3, language.get(136052))

		local var_34_8 = CCArray:create()

		var_34_8:addObject(CCDelayTime:create(1))
		var_34_8:addObject(CCCallFuncN:create(function()
			arg_34_0:addTalk(var_34_3, language.get(136053))
		end))
		var_34_8:addObject(CCDelayTime:create(1))
		var_34_8:addObject(CCCallFuncN:create(function()
			local var_40_0 = arg_34_0:addTalk(var_34_3, arg_34_1.changeName, 35)

			arg_34_0.kingTalk = var_40_0

			arg_34_0.view.widgets.btn_congratulate:setVisible(true)
		end))

		local var_34_9 = CCSequence:create(var_34_8)

		arg_34_0.view.widgets.bg:runAction(var_34_9)
	end
end

function var_0_6.ctor(arg_41_0)
	var_0_5 = false

	log.info("@@ 建国大业_庆功宴")
	rmgr.loadResource("res/anim/buildNation/meinv.plist")

	arg_41_0.view = {}

	uiutil.initWidgets(arg_41_0.view, arg_41_0.layout)
	arg_41_0:addChild(arg_41_0.view.widgets.root)
	arg_41_0.view.widgets.btn_back:addHandleOfControlEvent(function()
		log.info("btn_back")
		smgr.changeScene(SCENE_MAIN_CITY)

		if var_0_5 and arg_41_0.info.kbLv == 3 then
			roleDialogue.control.loadSpeak("worldBuild")
		elseif var_0_5 and arg_41_0.info.kbLv == 4 then
			roleDialogue.control.loadSpeak("worldBuildFour")
		elseif var_0_5 and arg_41_0.info.kbLv == 5 then
			roleDialogue.control.loadSpeak("worldBuildFive")
		elseif var_0_5 and arg_41_0.info.kbLv == 6 then
			roleDialogue.control.loadSpeak("worldBuildSix")
		elseif var_0_5 and arg_41_0.info.kbLv == 7 then
			roleDialogue.control.loadSpeak("worldBuildSeven")
		end
	end, CCControlEventTouchUpInside)
	arg_41_0.view.widgets.btn_congratulate:addHandleOfControlEvent(function()
		log.info("btn_congratulate")
		arg_41_0:onCongratulate()
	end, CCControlEventTouchUpInside)
	arg_41_0.view.widgets.btn_medal:addHandleOfControlEvent(function()
		log.info("btn_medal")
		arg_41_0.view.widgets.arrow:setVisible(false)
		arg_41_0:onGetReward()
	end, CCControlEventTouchUpInside)

	local var_41_0 = CCMoveBy:create(0.6, ccp(-30, 0))
	local var_41_1 = CCEaseOut:create(var_41_0, 1)
	local var_41_2 = CCMoveBy:create(0.6, ccp(30, 0))
	local var_41_3 = CCEaseIn:create(var_41_2, 1)
	local var_41_4 = CCArray:create()

	var_41_4:addObject(var_41_1)
	var_41_4:addObject(var_41_3)

	local var_41_5 = CCSequence:create(var_41_4)
	local var_41_6 = CCRepeatForever:create(var_41_5)

	arg_41_0.view.widgets.arrow:runAction(var_41_6)

	arg_41_0.step = 0

	arg_41_0:refresh()
end

return var_0_6
