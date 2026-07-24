local var_0_0 = require("res/native/offset").get("layer.activity.newGems.newGemsTab")
local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = ccc3(0, 180, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = class("NewGems", function()
	return createBaseLayer()
end)

var_0_6.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = false,
		path = "res/ui/comment/bg1.jpg"
	},
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			fontSize = 25,
			name = "leftTime",
			type = "label",
			style = "label_warlock",
			x = 750 + (var_0_0.timeLeftX or 0),
			y = 460 + (var_0_0.timeLeftY or 0),
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_3
		},
		{
			x = 458,
			y = 470,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/gemsActivity/new/xsczbs_title_sczbs.png"
			}
		},
		{
			x = 124,
			name = "remainPickBg",
			y = 435,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/gemsActivity/new/sczbs_word_di.png"
			},
			children = {
				{
					fontSize = 22,
					name = "remainPickNum",
					type = "label",
					y = 26.5,
					x = 4,
					style = "label_warlock",
					text = language.get(135563, 0),
					anchorPoint = ccp(0, 0.5)
				}
			}
		},
		{
			y = 0,
			name = "noStoneNode",
			type = "node",
			x = 0,
			children = {
				{
					x = 458,
					y = 210,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/new/xsczbs_bg2.jpg"
					}
				},
				{
					x = 458,
					name = "info_collect",
					y = 225,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/new/xsczbs_word_nswhdys.png"
					}
				},
				{
					x = 458,
					name = "info_end",
					y = 225,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/new/xsczbs_word_bchdyjs.png"
					}
				},
				{
					fontSize = 24,
					name = "info_wait",
					y = 30,
					type = "label",
					style = "label_warlock",
					x = 458,
					textId = 135554
				},
				{
					zoomOnTouchDown = false,
					name = "btn_collect",
					h = 56,
					type = "button",
					w = 189,
					y = 30,
					x = 458,
					normal = {
						frame = false,
						path = "res/ui/common/button/sdyjs_btn_03.png"
					},
					touched = {
						frame = false,
						path = "res/ui/common/button/sdyjs_btn_03_c.png"
					},
					children = {
						{
							height = 0,
							width = 100,
							type = "label",
							textId = 135560,
							style = "label_warlock",
							y = 32,
							x = 94,
							fontSize = 24 + (var_0_0.collectBtnFntSize or 0),
							color = var_0_1
						}
					}
				}
			}
		},
		{
			y = 0,
			name = "haveStoneNode",
			type = "node",
			x = 0,
			children = {
				{
					x = 458,
					y = 179,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/new/xsczbs_bg.jpg"
					}
				},
				{
					y = 380,
					x = 458,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/new/sczbsyh_pb_bg.png"
					},
					children = {
						{
							x = 90,
							y = 28,
							type = "sprite",
							pic = {
								path = "res/ui/activity/gemsActivity/new/sczbsyh_word_zkys.png"
							}
						},
						{
							x = 850,
							y = 28,
							type = "sprite",
							pic = {
								path = "res/ui/activity/gemsActivity/new/sczbsyh_word_sbjl.png"
							}
						},
						{
							x = 480,
							y = 25,
							type = "sprite",
							pic = {
								path = "res/ui/activity/gemsActivity/new/sczbsyh_pb_d.png"
							}
						},
						{
							y = 25,
							name = "progress",
							type = "progressbar",
							x = 480,
							progressType = kCCProgressTimerTypeBar,
							pic = {
								path = "res/ui/activity/gemsActivity/new/sczbsyh_pb.png"
							}
						},
						{
							text = "0/0",
							name = "knockNum",
							y = 25,
							type = "label",
							style = "label_warlock",
							x = 480,
							fontSize = 25,
							color = var_0_1
						}
					}
				},
				{
					text = "99999",
					name = "stoneNum",
					y = 330,
					type = "label",
					fontSize = 25,
					x = 20,
					style = "label_warlock",
					anchorPoint = ccp(0, 0.5)
				},
				{
					zoomOnTouchDown = false,
					name = "btn_knock",
					h = 56,
					type = "button",
					w = 212,
					y = 30,
					x = 330,
					normal = {
						frame = false,
						path = "res/ui/common/button/sdyjs_btn_02.png"
					},
					touched = {
						frame = false,
						path = "res/ui/common/button/sdyjs_btn_02_c.png"
					},
					children = {
						{
							height = 0,
							width = 100,
							type = "label",
							textId = 135561,
							style = "label_warlock",
							y = 32,
							x = 130,
							fontSize = 24 + (var_0_0.smashAbandonFntSize or 0),
							color = var_0_1
						},
						{
							text = "",
							name = "freeTimes",
							y = 32,
							type = "label",
							style = "label_warlock",
							x = 40,
							fontSize = 22,
							color = var_0_4
						},
						{
							x = 40,
							name = "goldIcon",
							y = 40,
							type = "sprite",
							scale = 0.6,
							pic = {
								frame = false,
								path = "res/ui/activity/ironRotary/yuanbao.png"
							}
						},
						{
							text = "",
							name = "gold",
							y = 22,
							type = "label",
							style = "label_warlock",
							x = 40,
							fontSize = 22,
							color = var_0_4
						}
					}
				},
				{
					zoomOnTouchDown = false,
					name = "btn_giveup",
					h = 56,
					type = "button",
					w = 189,
					y = 30,
					x = 600,
					normal = {
						frame = false,
						path = "res/ui/common/button/sdyjs_btn_04.png"
					},
					touched = {
						frame = false,
						path = "res/ui/common/button/sdyjs_btn_04_c.png"
					},
					children = {
						{
							style = "label_warlock",
							y = 32,
							type = "label",
							x = 94,
							textId = 135562,
							fontSize = 24 + (var_0_0.smashAbandonFntSize or 0),
							color = var_0_1
						}
					}
				},
				{
					zoomOnTouchDown = false,
					name = "btn_stone",
					h = 360,
					type = "button",
					w = 600,
					y = 180,
					x = 460,
					normal = {
						frame = false,
						path = "res/default.png"
					},
					touched = {
						frame = false,
						path = "res/default.png"
					}
				},
				{
					height = 355,
					name = "maskLayer",
					x = 0,
					type = "layerColor",
					y = 0,
					width = 915,
					color = ccc4(0, 0, 0, 180)
				},
				{
					frameGapHorizontal = 46,
					name = "plot_bg",
					x = 200,
					type = "sprite9Tips",
					y = 180,
					pic = {
						frame = false,
						path = "res/ui/activity/furnace/sdyjs_time_bg.png"
					},
					middleRect = CCRectMake(95, 17, 280, 52),
					content = {
						{
							fontSize = 22,
							height = 0,
							name = "plot",
							type = "label",
							text = "",
							style = "label_warlock",
							width = 250,
							halign = kCCTextAlignmentLeft,
							color = var_0_1
						}
					}
				},
				{
					x = 460,
					name = "name",
					y = 300,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/new/xsczbs_name_01.png"
					}
				},
				{
					x = 460,
					name = "icon",
					y = 180,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/new/xsczbs_ys_01.png"
					}
				},
				{
					x = 460,
					name = "info_remainKnockTimes",
					y = 300,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/new/xsczbs_word_nhkyz.png"
					},
					children = {
						{
							scale = 0.9,
							name = "remainKnockTimes",
							type = "atlaslabel",
							pic = "res/ui/common/number/nation_task_upg_numb.png",
							startCharMap = 48,
							text = "88",
							y = 35,
							itemWidth = 53,
							itemHeight = 64,
							x = 310 + (var_0_0.remainSmashCntX or 0),
							anchorPoint = ccp(0.5, 0.5)
						}
					}
				},
				{
					x = 460,
					name = "info_gemLv",
					y = 300,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/new/xsczbs_word_gxhd.png"
					},
					children = {
						{
							scale = 0.9,
							name = "gemLv",
							type = "atlaslabel",
							pic = "res/ui/common/number/nation_task_upg_numb.png",
							startCharMap = 48,
							text = "88",
							y = 35,
							itemWidth = 53,
							itemHeight = 64,
							x = 304 + (var_0_0.gainGemLvlX or 0),
							anchorPoint = ccp(0.5, 0.5)
						}
					}
				},
				{
					x = 460,
					name = "info_knock",
					y = 300,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/new/xsczbs_word_lxdj.png"
					}
				}
			}
		}
	}
}

function var_0_6.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getNewGemsActivity)
end

function var_0_6.onStartKnockNewGems(arg_4_0)
	local function var_4_0(arg_5_0)
		arg_4_0:refresh()
	end

	cmgr.sendRequest(var_4_0, actions.startKnockNewGems)
end

function var_0_6.onKnockNewGems(arg_6_0)
	local function var_6_0(arg_7_0)
		arg_6_0.view.widgets.btn_stone:setEnabled(true)
		arg_6_0:refresh()
	end

	cmgr.sendRequest(var_6_0, actions.knockNewGems)
end

function var_0_6.onGetNewGemsReward(arg_8_0)
	local function var_8_0(arg_9_0)
		arg_8_0:refresh()

		local var_9_0 = arg_9_0.action.data

		for iter_9_0 = 1, var_9_0.gemNum do
			local var_9_1 = CCArray:create()

			var_9_1:addObject(CCDelayTime:create(0.2 * (iter_9_0 - 1)))
			var_9_1:addObject(CCCallFuncN:create(function()
				local var_10_0 = {}
				local var_10_1 = {}

				var_10_1.id = 7
				var_10_1.value = 1
				var_10_1.gemLevel = var_9_0.gemLv

				table.insert(var_10_0, var_10_1)
				globalAction_gotResource(var_10_0, ccp(visibleSize.width / 2, visibleSize.height * 0.5 - 170))
			end))

			local var_9_2 = CCSequence:create(var_9_1)

			arg_8_0:runAction(var_9_2)
		end

		if var_9_0.jxsNum and var_9_0.jxsNum > 0 then
			local var_9_3 = CCArray:create()

			var_9_3:addObject(CCDelayTime:create(0.2 * var_9_0.gemNum))
			var_9_3:addObject(CCCallFuncN:create(function()
				local var_11_0 = {}
				local var_11_1 = {}

				var_11_1.id = 20
				var_11_1.value = var_9_0.jxsNum

				table.insert(var_11_0, var_11_1)
				globalAction_gotResource(var_11_0, ccp(visibleSize.width / 2, visibleSize.height * 0.5 - 170))
			end))

			local var_9_4 = CCSequence:create(var_9_3)

			arg_8_0:runAction(var_9_4)
		end
	end

	cmgr.sendRequest(var_8_0, actions.getNewGemsReward)
end

function var_0_6.onGiveUpGemStone(arg_12_0)
	arg_12_0.view.widgets.btn_stone:setVisible(true)

	local function var_12_0(arg_13_0)
		arg_12_0:showGiveUpEffect()
	end

	cmgr.sendRequest(var_12_0, actions.giveUpGemStone)
end

function var_0_6.onBuyKnockNewGemsTimes(arg_14_0)
	local function var_14_0(arg_15_0)
		arg_14_0:onStartKnockNewGems()
	end

	cmgr.sendRequest(var_14_0, actions.buyKnockNewGemsTimes)
end

function var_0_6.onBtnCollectTap(arg_16_0)
	if arg_16_0.info and arg_16_0.info.haveEvent == 1 then
		smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
		loadingLayer.show(SCENE_WORLD, arg_16_0.info.cityId)
	end
end

function var_0_6.onBtnStoneTap(arg_17_0)
	if arg_17_0.info.gemNum > 0 then
		arg_17_0:onGetNewGemsReward()
	elseif arg_17_0.info.startKnock == 1 then
		arg_17_0:showHammerEffect()
	end
end

function var_0_6.onBtnKnockTap(arg_18_0)
	if arg_18_0.info.freeTimes > 0 or arg_18_0.info.type == 1 then
		arg_18_0:onStartKnockNewGems()
	else
		messageBox.showChargeWinWithData(language.get(10003), language.get(135552, arg_18_0.info.gold), "newGemsGold", function()
			arg_18_0:onBuyKnockNewGemsTimes()
		end)
	end
end

function var_0_6.showGiveUpEffect(arg_20_0)
	if arg_20_0.info.nextType == 0 then
		arg_20_0:refresh()

		return
	end

	arg_20_0.view.widgets.plot_bg:setVisible(false)
	arg_20_0.view.widgets.plot:setVisible(false)
	arg_20_0.view.widgets.name:setVisible(false)
	arg_20_0:addStar(true)

	local var_20_0 = arg_20_0.view.widgets.icon
	local var_20_1 = CCArray:create()

	var_20_1:addObject(CCFadeOut:create(0.5))
	var_20_1:addObject(CCCallFuncN:create(function()
		var_20_0:removeFromParentAndCleanup(true)
	end))
	arg_20_0.view.widgets.icon:runAction(CCSequence:create(var_20_1))

	local var_20_2 = CCSprite:create(string.format("res/ui/activity/gemsActivity/new/xsczbs_ys_%02d.png", arg_20_0.info.nextType))

	arg_20_0.view.widgets.icon = var_20_2

	arg_20_0.view.widgets.haveStoneNode:addChild(var_20_2)

	local var_20_3 = 160

	var_20_2:setPosition(ccp(460 - var_20_3, 180))
	var_20_2:setOpacity(0)

	local var_20_4 = CCEaseSineOut:create(CCMoveBy:create(0.8, ccp(var_20_3, 0)))
	local var_20_5 = CCFadeIn:create(0.8)
	local var_20_6 = CCArray:create()

	var_20_6:addObject(CCSpawn:createWithTwoActions(var_20_4, var_20_5))
	var_20_6:addObject(CCCallFuncN:create(function()
		arg_20_0:refresh()
	end))
	var_20_2:runAction(CCSequence:create(var_20_6))
end

function var_0_6.addStar(arg_23_0, arg_23_1)
	local var_23_0 = "res/ui/activity/gemsActivity/new/star.png"

	if arg_23_0.starNode then
		arg_23_0.starNode:removeAllChildrenWithCleanup(true)
	else
		arg_23_0.starNode = CCSpriteBatchNode:create(var_23_0)

		arg_23_0.view.widgets.panel:addChild(arg_23_0.starNode, 100)
	end

	if arg_23_1 or arg_23_0.info.startKnock == 1 or arg_23_0.info.gemNum > 0 or arg_23_0.info.type == 0 then
		return
	end

	local var_23_1 = {
		ccp(425, 215),
		ccp(515, 200),
		ccp(410, 180),
		ccp(530, 125),
		ccp(435, 125)
	}

	for iter_23_0 = 1, 5 do
		local var_23_2 = CCSprite:create(var_23_0)

		arg_23_0.starNode:addChild(var_23_2)
		var_23_2:setPosition(var_23_1[iter_23_0])
		var_23_2:setScale(0)

		local var_23_3 = CCArray:create()

		var_23_3:addObject(CCEaseSineOut:create(CCScaleTo:create(0.5, 1)))
		var_23_3:addObject(CCEaseSineIn:create(CCScaleTo:create(0.5, 0)))

		local var_23_4 = CCSpawn:createWithTwoActions(CCSequence:create(var_23_3), CCRotateBy:create(1, 360))
		local var_23_5 = CCRepeat:create(var_23_4, 1)
		local var_23_6 = 0.2 * math.random(3, 10)
		local var_23_7 = CCArray:create()

		var_23_7:addObject(CCDelayTime:create(0.2 * iter_23_0))
		var_23_7:addObject(var_23_5)
		var_23_7:addObject(CCDelayTime:create(0.2 * (5 - iter_23_0)))

		local var_23_8 = CCSequence:create(var_23_7)

		var_23_2:runAction(CCRepeatForever:create(var_23_8))
	end
end

function var_0_6.addArrow(arg_24_0)
	if arg_24_0.arrowNode then
		arg_24_0.arrowNode:removeAllChildrenWithCleanup(true)
	else
		arg_24_0.arrowNode = CCNode:create()

		arg_24_0.view.widgets.haveStoneNode:addChild(arg_24_0.arrowNode, 100)
	end

	if (arg_24_0.info.startKnock == 1 or arg_24_0.info.gemNum > 0) and (arg_24_0.info.gemNum == 0 and (arg_24_0.info.type == 1 or arg_24_0.info.type == 2) or arg_24_0.info.gemNum > 0 and arg_24_0.info.type == 3) then
		local var_24_0 = CCSprite:create("res/ui/guide/jiantou-zuo.png")

		arg_24_0.arrowNode:addChild(var_24_0, 100)
		var_24_0:setPosition(ccp(600, 180))

		local var_24_1 = CCStrokeLabelTTF:create(language.get(135258), "Thonburi-Bold", 20, 2)

		var_24_1:setColor(var_0_4)
		var_24_0:addChild(var_24_1)
		var_24_1:setPosition(ccp(60, 30))

		local var_24_2 = CCMoveBy:create(0.6, ccp(-30, 0))
		local var_24_3 = CCEaseOut:create(var_24_2, 1)
		local var_24_4 = CCMoveBy:create(0.6, ccp(30, 0))
		local var_24_5 = CCEaseIn:create(var_24_4, 1)
		local var_24_6 = CCArray:create()

		var_24_6:addObject(var_24_3)
		var_24_6:addObject(var_24_5)

		local var_24_7 = CCSequence:create(var_24_6)
		local var_24_8 = CCRepeatForever:create(var_24_7)

		var_24_0:runAction(var_24_8)
	end
end

function var_0_6.addGem(arg_25_0)
	if arg_25_0.gemNode then
		arg_25_0.gemNode:removeAllChildrenWithCleanup(true)
	else
		arg_25_0.gemNode = CCNode:create()

		arg_25_0.view.widgets.panel:addChild(arg_25_0.gemNode, 100)
	end

	local var_25_0 = arg_25_0.info.groundType
	local var_25_1 = arg_25_0.info.gemNum
	local var_25_2 = arg_25_0.info.gemLv

	if var_25_1 > 0 and var_25_2 > 0 then
		local var_25_3 = math.ceil(var_25_2 / 4)

		if var_25_0 == 1 or var_25_0 == 2 then
			for iter_25_0 = 1, var_25_1 do
				local var_25_4 = CCSprite:create(string.format("res/ui/activity/gemsActivity/new/gem_a%d.png", var_25_3))

				arg_25_0.gemNode:addChild(var_25_4)

				local var_25_5 = math.random(260, 660)
				local var_25_6 = math.random(60, 180)

				var_25_4:setPosition(ccp(460, 200))
				var_25_4:runAction(CCEaseBounceOut:create(CCMoveTo:create(0.8, ccp(var_25_5, var_25_6))))
			end
		elseif var_25_0 == 3 then
			local var_25_7 = CCSprite:create("res/ui/activity/ironRotary/btdzp_lig.png")

			var_25_7:setScale(1.5)
			var_25_7:setPosition(ccp(460, 180))
			arg_25_0.gemNode:addChild(var_25_7)
			var_25_7:runAction(CCRepeatForever:create(CCRotateBy:create(2, 360)))

			local var_25_8 = CCSprite:create(string.format("res/ui/activity/gemsActivity/new/gem_b%d.png", var_25_3))

			var_25_8:setPosition(ccp(460, 180))
			arg_25_0.gemNode:addChild(var_25_8)
		end

		if arg_25_0.info.jxsNum and arg_25_0.info.jxsNum > 0 then
			for iter_25_1 = 1, arg_25_0.info.jxsNum do
				local var_25_9 = CCSprite:createWithSpriteFrameName("res_icon_20.png")

				arg_25_0.gemNode:addChild(var_25_9)

				local var_25_10 = math.random(260, 660)
				local var_25_11 = math.random(60, 180)

				var_25_9:setPosition(ccp(460, 200))
				var_25_9:runAction(CCEaseBounceOut:create(CCMoveTo:create(0.8, ccp(var_25_10, var_25_11))))
			end
		end
	end
end

function var_0_6.showHammerEffect(arg_26_0)
	if arg_26_0.hammerNode then
		arg_26_0.hammerNode:removeAllChildrenWithCleanup(true)
	else
		arg_26_0.hammerNode = CCNode:create()

		arg_26_0.view.widgets.panel:addChild(arg_26_0.hammerNode, 200)
	end

	arg_26_0.view.widgets.btn_stone:setEnabled(false)

	local var_26_0 = CCNode:create()

	var_26_0:setScaleX(-1)
	arg_26_0.hammerNode:addChild(var_26_0)
	var_26_0:setPosition(ccp(350, 160))

	local var_26_1 = CCSprite:create("res/ui/resourceArea2/resou_gra_cz_g.png")

	var_26_1:setAnchorPoint(ccp(1, 0))
	var_26_1:setRotation(90)
	var_26_1:setScale(1.3)
	var_26_0:addChild(var_26_1)

	local var_26_2 = CCArray:create()

	for iter_26_0 = 1, 2 do
		var_26_2:addObject(CCEaseBounceOut:create(CCRotateBy:create(0.2, -90)))
		var_26_2:addObject(CCRotateBy:create(0.4, 90))

		if iter_26_0 == 2 then
			var_26_2:addObject(CCCallFuncN:create(function()
				var_26_1:removeFromParentAndCleanup(true)

				if arg_26_0.info.type == 1 or arg_26_0.info.type == 2 then
					arg_26_0:onKnockNewGems()
				end
			end))
		end
	end

	local var_26_3 = CCSequence:create(var_26_2)

	var_26_1:runAction(CCSpeed:create(var_26_3, 1.6))

	if arg_26_0.info.type == 3 then
		local var_26_4 = "res/anim/stategyEffect/att_jitui/att_jitui.plist"

		rmgr.loadResource(var_26_4)

		local var_26_5 = CCArray:create()

		for iter_26_1 = 1, 10 do
			iter_26_1 = iter_26_1 == 10 and 15 or iter_26_1

			local var_26_6 = CCSprite:createWithSpriteFrameName(string.format("%d.png", iter_26_1))

			var_26_5:addObject(var_26_6:displayFrame())
		end

		local var_26_7 = CCAnimation:createWithSpriteFrames(var_26_5, 0.08)
		local var_26_8 = CCAnimate:create(var_26_7)
		local var_26_9 = CCArray:create()

		var_26_9:addObject(CCDelayTime:create(0.9))
		var_26_9:addObject(var_26_8)
		var_26_9:addObject(CCCallFuncN:create(function()
			arg_26_0:onKnockNewGems()
		end))

		local var_26_10 = CCSprite:create()

		var_26_10:setPosition(ccp(460, 180))
		arg_26_0.hammerNode:addChild(var_26_10)
		var_26_10:runAction(CCSequence:create(var_26_9))
		CCSpriteFrameCache:sharedSpriteFrameCache():removeSpriteFramesFromFile(var_26_4)
	end
end

function var_0_6.showPanel(arg_29_0, arg_29_1)
	arg_29_0.info = arg_29_1

	if arg_29_1.currentKnockTimes > arg_29_1.totalKnockTimes then
		arg_29_1.currentKnockTimes = arg_29_1.totalKnockTimes
	end

	arg_29_0.view.widgets.progress:setPercentage(100 * arg_29_1.currentKnockTimes / arg_29_1.totalKnockTimes)
	arg_29_0.view.widgets.knockNum:setString(language.get(390478, arg_29_1.currentKnockTimes, arg_29_1.totalKnockTimes))
	arg_29_0.view.widgets.remainPickNum:setString(language.get(135563, arg_29_0.info.remainPickNum))
	arg_29_0.view.widgets.stoneNum:setString(language.get(135544, arg_29_1.stoneNum))
	arg_29_0.view.widgets.plot:setString(arg_29_1.plot)
	arg_29_0.view.widgets.plot_bg:resetLayout()

	local var_29_0 = arg_29_1.stoneNum == 0 and arg_29_1.gemNum == 0

	arg_29_0.view.widgets.noStoneNode:setVisible(var_29_0)
	arg_29_0.view.widgets.haveStoneNode:setVisible(not var_29_0)

	if var_29_0 then
		local var_29_1 = arg_29_1.status == 0

		arg_29_0.view.widgets.info_collect:setVisible(var_29_1)
		arg_29_0.view.widgets.info_end:setVisible(not var_29_1)

		local var_29_2 = arg_29_1.haveEvent == 1

		arg_29_0.view.widgets.info_wait:setVisible(var_29_1 and not var_29_2)
		arg_29_0.view.widgets.btn_collect:setVisible(var_29_1 and var_29_2)
	else
		local var_29_3 = arg_29_1.startKnock == 1
		local var_29_4 = arg_29_1.gemNum > 0

		arg_29_1.type = var_29_4 and arg_29_1.groundType or arg_29_1.type

		if var_29_4 then
			var_29_3 = true
		end

		local var_29_5 = arg_29_1.freeTimes > 0
		local var_29_6 = arg_29_1.type == 1

		var_29_5 = var_29_5 or var_29_6

		arg_29_0.view.widgets.freeTimes:setVisible(var_29_5)
		arg_29_0.view.widgets.goldIcon:setVisible(not var_29_5)
		arg_29_0.view.widgets.gold:setVisible(not var_29_5)

		if var_29_5 then
			arg_29_0.view.widgets.freeTimes:setString(var_29_6 and language.get(85060) or language.get(20036, arg_29_1.freeTimes))
		else
			arg_29_0.view.widgets.gold:setString(language.get(142003, arg_29_1.gold))
		end

		arg_29_0.view.widgets.btn_knock:setPositionX(var_29_6 and 458 or 330)
		arg_29_0.view.widgets.btn_giveup:setVisible(not var_29_6)
		arg_29_0.view.widgets.plot_bg:setVisible(not var_29_3)
		arg_29_0.view.widgets.plot:setVisible(not var_29_3)
		arg_29_0.view.widgets.name:setVisible(not var_29_3)
		arg_29_0.view.widgets.maskLayer:setVisible(var_29_3)
		arg_29_0.view.widgets.btn_stone:setVisible(var_29_3)
		arg_29_0.view.widgets.icon:setDisplayFrame(CCSprite:create(string.format("res/ui/activity/gemsActivity/new/xsczbs_ys_%02d.png", arg_29_1.type)):displayFrame())
		arg_29_0.view.widgets.name:setDisplayFrame(CCSprite:create(string.format("res/ui/activity/gemsActivity/new/xsczbs_name_%02d.png", arg_29_1.type)):displayFrame())

		local var_29_7 = not var_29_3 or var_29_3 and arg_29_1.remainKnockTimes > 0

		arg_29_0.view.widgets.icon:setVisible(var_29_7)

		local var_29_8 = var_29_3 and not var_29_4 and (arg_29_1.type == 1 or arg_29_1.type == 2)

		arg_29_0.view.widgets.info_remainKnockTimes:setVisible(var_29_8)

		if var_29_8 then
			arg_29_0.view.widgets.remainKnockTimes:setString(arg_29_1.remainKnockTimes)
		end

		local var_29_9 = var_29_3 and not var_29_4 and arg_29_1.type == 3

		arg_29_0.view.widgets.info_knock:setVisible(var_29_9)

		local var_29_10 = var_29_3 and var_29_4 and arg_29_1.type == 3

		arg_29_0.view.widgets.info_gemLv:setVisible(var_29_10)

		if var_29_10 then
			arg_29_0.view.widgets.gemLv:setString(arg_29_1.gemLv)
		end
	end

	arg_29_0:addStar()
	arg_29_0:addArrow()
	arg_29_0:addGem()
end

function var_0_6.ctor(arg_30_0, arg_30_1, arg_30_2)
	log.info("@@ 新神锤砸宝石活动")

	arg_30_0.view = {}

	uiutil.initWidgets(arg_30_0.view, arg_30_0.layout)

	arg_30_0.leftTime = arg_30_0.view.widgets.leftTime

	if arg_30_1 then
		arg_30_0:addChild(arg_30_0.view.widgets.panel)
		arg_30_1:addChild(arg_30_0)
	end

	arg_30_0.view.widgets.btn_collect:addHandleOfControlEvent(function()
		log.info("btn_collect")
		arg_30_0:onBtnCollectTap()
	end, CCControlEventTouchUpInside)
	arg_30_0.view.widgets.btn_knock:addHandleOfControlEvent(function()
		log.info("btn_knock")
		arg_30_0:onBtnKnockTap()
	end, CCControlEventTouchUpInside)
	arg_30_0.view.widgets.btn_giveup:addHandleOfControlEvent(function()
		log.info("btn_giveup")
		arg_30_0:onGiveUpGemStone()
	end, CCControlEventTouchUpInside)
	arg_30_0.view.widgets.btn_stone:addHandleOfControlEvent(function()
		log.info("btn_stone")
		arg_30_0:onBtnStoneTap()
	end, CCControlEventTouchUpInside)
	arg_30_0:showPanel(arg_30_2)
end

return var_0_6
