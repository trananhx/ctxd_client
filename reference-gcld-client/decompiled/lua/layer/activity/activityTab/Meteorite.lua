local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = ccc3(0, 180, 0)
local var_0_2 = colorQuality[5]
local var_0_3 = colorQuality[4]
local var_0_4 = colorQuality[2]
local var_0_5 = class("Meteorite", function()
	return createBaseLayer()
end)

var_0_5.layout = {
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
			y = 460,
			type = "label",
			x = 750,
			style = "label_warlock",
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_2
		},
		{
			x = 458,
			y = 470,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/meteorite/sczys_title.png"
			}
		},
		{
			y = 435,
			x = 3,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/gemsActivity/new/sczbs_word_di.png"
			},
			anchorPoint = ccp(0, 0.5),
			children = {
				{
					fontSize = 22,
					name = "remainNum",
					type = "label",
					y = 26.5,
					x = 4,
					style = "label_warlock",
					text = language.get(217100, 0),
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
					x = 457.5,
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
						path = "res/ui/activity/meteorite/sczys_word_qcsjshdys.png"
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
					textId = 190523
				},
				{
					zoomOnTouchDown = true,
					name = "btn_collect",
					h = 60,
					type = "button",
					w = 260,
					y = 30,
					x = 458,
					normal = {
						frame = false,
						path = "res/default.png"
					},
					touched = {
						frame = false,
						path = "res/default.png"
					},
					children = {
						{
							fontSize = 24,
							name = "cityName",
							y = 30,
							type = "label",
							style = "label_warlock",
							x = 130,
							textId = 135560,
							color = ccc3(0, 255, 0)
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
					y = 3,
					x = 457.5,
					type = "sprite",
					scaleY = 1.16,
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/new/xsczbs_bg.jpg"
					},
					anchorPoint = ccp(0.5, 0)
				},
				{
					x = 457.5,
					y = 414,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/seaSilk/hssl_line.png"
					}
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
							fontSize = 24,
							style = "label_warlock",
							y = 32,
							type = "label",
							x = 130,
							textId = 217108,
							color = var_0_0
						},
						{
							text = "",
							name = "freeTimes",
							y = 32,
							type = "label",
							style = "label_warlock",
							x = 40,
							fontSize = 22,
							color = var_0_3
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
							color = var_0_3
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
							fontSize = 24,
							style = "label_warlock",
							y = 32,
							type = "label",
							x = 94,
							textId = 135562,
							color = var_0_0
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
					height = 412,
					name = "maskLayer",
					x = 0,
					type = "layerColor",
					y = 0,
					width = 915,
					color = ccc4(0, 0, 0, 180)
				},
				{
					x = 200,
					name = "plot_bg",
					y = 180,
					type = "sprite",
					scale = 0.9,
					pic = {
						frame = false,
						path = "res/ui/activity/furnace/sdyjs_time_bg.png"
					}
				},
				{
					fontSize = 22,
					name = "plot",
					width = 250,
					type = "label",
					height = 0,
					textId = 217106,
					style = "label_warlock",
					y = 180,
					x = 350,
					anchorPoint = ccp(1, 0.5),
					halign = kCCTextAlignmentLeft,
					color = var_0_0
				},
				{
					x = 460,
					name = "name",
					y = 300,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/meteorite/sczys_word_01.png"
					}
				},
				{
					x = 460,
					name = "icon",
					y = 180,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/meteorite/sczys_ys_01.png"
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
							x = 310,
							itemHeight = 64,
							anchorPoint = ccp(0.5, 0.5)
						}
					}
				}
			}
		}
	}
}

function var_0_5.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getMeteorite)
end

function var_0_5.onStartHit(arg_4_0)
	local function var_4_0(arg_5_0)
		arg_4_0:refresh()
	end

	cmgr.sendRequest(var_4_0, actions.meteoriteStartHit)
end

function var_0_5.onHit(arg_6_0)
	local function var_6_0(arg_7_0)
		arg_6_0.view.widgets.btn_stone:setEnabled(true)
		arg_6_0:refresh()
	end

	cmgr.sendRequest(var_6_0, actions.meteoriteHit)
end

function var_0_5.onGetMeteoriteReward(arg_8_0)
	local var_8_0 = arg_8_0.info.rewardMax

	local function var_8_1(arg_9_0)
		arg_8_0:refresh()

		local var_9_0 = arg_9_0.action.data.rewards[1].num

		if var_8_0 then
			var_9_0 = var_9_0 - 9
		end

		for iter_9_0 = 1, var_9_0 do
			local var_9_1 = CCArray:create()

			var_9_1:addObject(CCDelayTime:create(0.2 * (iter_9_0 - 1)))
			var_9_1:addObject(CCCallFuncN:create(function()
				local var_10_0 = {}
				local var_10_1 = {}

				var_10_1.id = 216
				var_10_1.value = 1

				if iter_9_0 == 1 and var_8_0 then
					var_10_1.value = 10
				end

				table.insert(var_10_0, var_10_1)
				globalAction_gotResource(var_10_0, ccp(visibleSize.width / 2, visibleSize.height * 0.5 - 170))
			end))

			local var_9_2 = CCSequence:create(var_9_1)

			arg_8_0:runAction(var_9_2)
		end
	end

	cmgr.sendRequest(var_8_1, actions.getMeteoriteReward)
end

function var_0_5.onGiveUp(arg_11_0)
	arg_11_0.view.widgets.btn_stone:setVisible(true)

	local function var_11_0(arg_12_0)
		arg_11_0:showGiveUpEffect()
	end

	cmgr.sendRequest(var_11_0, actions.meteoriteGiveUp)
end

function var_0_5.onBtnCollectTap(arg_13_0)
	if arg_13_0.info and arg_13_0.info.cityId > 0 then
		smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
		loadingLayer.show(SCENE_WORLD, arg_13_0.info.cityId)
	end
end

function var_0_5.onBtnStoneTap(arg_14_0)
	if arg_14_0.info.meteoriteNum > 0 then
		arg_14_0:onGetMeteoriteReward()
	elseif arg_14_0.info.remainHits > 0 then
		arg_14_0:showHammerEffect()
	end
end

function var_0_5.onBtnKnockTap(arg_15_0)
	if arg_15_0.info.freeHitTimes > 0 then
		arg_15_0:onStartHit()
	else
		messageBox.showChargeWinWithData("", language.get(217107, arg_15_0.info.hitGold), "startHitMeteorite", function()
			arg_15_0:onStartHit()
		end)
	end
end

function var_0_5.showGiveUpEffect(arg_17_0)
	if arg_17_0.info.nextType == 0 then
		arg_17_0:refresh()

		return
	end

	arg_17_0.view.widgets.plot_bg:setVisible(false)
	arg_17_0.view.widgets.plot:setVisible(false)
	arg_17_0.view.widgets.name:setVisible(false)
	arg_17_0:addStar(true)

	local var_17_0 = arg_17_0.view.widgets.icon
	local var_17_1 = CCArray:create()

	var_17_1:addObject(CCFadeOut:create(0.5))
	var_17_1:addObject(CCCallFuncN:create(function()
		var_17_0:removeFromParentAndCleanup(true)
	end))
	arg_17_0.view.widgets.icon:runAction(CCSequence:create(var_17_1))

	local var_17_2 = CCSprite:create(string.format("res/ui/activity/meteorite/sczys_ys_%02d.png", arg_17_0.info.nextType))

	arg_17_0.view.widgets.icon = var_17_2

	arg_17_0.view.widgets.haveStoneNode:addChild(var_17_2)

	local var_17_3 = 160

	var_17_2:setPosition(ccp(460 - var_17_3, 180))
	var_17_2:setOpacity(0)

	local var_17_4 = CCEaseSineOut:create(CCMoveBy:create(0.8, ccp(var_17_3, 0)))
	local var_17_5 = CCFadeIn:create(0.8)
	local var_17_6 = CCArray:create()

	var_17_6:addObject(CCSpawn:createWithTwoActions(var_17_4, var_17_5))
	var_17_6:addObject(CCCallFuncN:create(function()
		arg_17_0:refresh()
	end))
	var_17_2:runAction(CCSequence:create(var_17_6))
end

function var_0_5.addStar(arg_20_0, arg_20_1)
	local var_20_0 = "res/ui/activity/gemsActivity/new/star.png"

	if arg_20_0.starNode then
		arg_20_0.starNode:removeAllChildrenWithCleanup(true)
	else
		arg_20_0.starNode = CCSpriteBatchNode:create(var_20_0)

		arg_20_0.view.widgets.panel:addChild(arg_20_0.starNode, 100)
	end

	if arg_20_1 or arg_20_0.info.meteoriteNum > 0 or arg_20_0.info.remainHits > 0 or arg_20_0.info.curType == 0 then
		return
	end

	local var_20_1 = {
		ccp(425, 215),
		ccp(515, 200),
		ccp(410, 180),
		ccp(530, 125),
		ccp(435, 125)
	}

	for iter_20_0 = 1, 5 do
		local var_20_2 = CCSprite:create(var_20_0)

		arg_20_0.starNode:addChild(var_20_2)
		var_20_2:setPosition(var_20_1[iter_20_0])
		var_20_2:setScale(0)

		local var_20_3 = CCArray:create()

		var_20_3:addObject(CCEaseSineOut:create(CCScaleTo:create(0.5, 1)))
		var_20_3:addObject(CCEaseSineIn:create(CCScaleTo:create(0.5, 0)))

		local var_20_4 = CCSpawn:createWithTwoActions(CCSequence:create(var_20_3), CCRotateBy:create(1, 360))
		local var_20_5 = CCRepeat:create(var_20_4, 1)
		local var_20_6 = 0.2 * math.random(3, 10)
		local var_20_7 = CCArray:create()

		var_20_7:addObject(CCDelayTime:create(0.2 * iter_20_0))
		var_20_7:addObject(var_20_5)
		var_20_7:addObject(CCDelayTime:create(0.2 * (5 - iter_20_0)))

		local var_20_8 = CCSequence:create(var_20_7)

		var_20_2:runAction(CCRepeatForever:create(var_20_8))
	end
end

function var_0_5.addArrow(arg_21_0)
	if arg_21_0.arrowNode then
		arg_21_0.arrowNode:removeAllChildrenWithCleanup(true)
	else
		arg_21_0.arrowNode = CCNode:create()

		arg_21_0.view.widgets.haveStoneNode:addChild(arg_21_0.arrowNode, 100)
	end

	if arg_21_0.info.remainHits > 0 and arg_21_0.info.meteoriteNum == 0 then
		local var_21_0 = CCSprite:create("res/ui/guide/jiantou-zuo.png")

		arg_21_0.arrowNode:addChild(var_21_0, 100)
		var_21_0:setPosition(ccp(600, 180))

		local var_21_1 = CCStrokeLabelTTF:create(language.get(135258), "Thonburi-Bold", 20, 2)

		var_21_1:setColor(var_0_3)
		var_21_0:addChild(var_21_1)
		var_21_1:setPosition(ccp(60, 30))

		local var_21_2 = CCMoveBy:create(0.6, ccp(-30, 0))
		local var_21_3 = CCEaseOut:create(var_21_2, 1)
		local var_21_4 = CCMoveBy:create(0.6, ccp(30, 0))
		local var_21_5 = CCEaseIn:create(var_21_4, 1)
		local var_21_6 = CCArray:create()

		var_21_6:addObject(var_21_3)
		var_21_6:addObject(var_21_5)

		local var_21_7 = CCSequence:create(var_21_6)
		local var_21_8 = CCRepeatForever:create(var_21_7)

		var_21_0:runAction(var_21_8)
	end
end

function var_0_5.addGem(arg_22_0)
	if arg_22_0.gemNode then
		arg_22_0.gemNode:removeAllChildrenWithCleanup(true)
	else
		arg_22_0.gemNode = CCNode:create()

		arg_22_0.view.widgets.panel:addChild(arg_22_0.gemNode, 100)
	end

	local var_22_0 = arg_22_0.info.rewardMax
	local var_22_1 = arg_22_0.info.meteoriteNum

	if var_22_0 then
		var_22_1 = var_22_1 - 9
	end

	if var_22_1 > 0 then
		for iter_22_0 = 1, var_22_1 do
			local var_22_2 = CCSprite:create("res/ui/weapon/machine/zc_yt_icon.png")

			arg_22_0.gemNode:addChild(var_22_2)

			if iter_22_0 == var_22_1 and var_22_0 then
				var_22_2:setScale(2)

				local var_22_3 = CCSprite:create("res/ui/activity/ironRotary/btdzp_lig.png")

				var_22_3:setScale(0.3)
				var_22_3:setPosition(19, 17)
				var_22_2:addChild(var_22_3, -1)
				var_22_3:runAction(CCRepeatForever:create(CCRotateBy:create(2, 360)))
			end

			local var_22_4 = math.random(260, 660)
			local var_22_5 = math.random(60, 180)

			var_22_2:setPosition(ccp(460, 200))
			var_22_2:runAction(CCEaseBounceOut:create(CCMoveTo:create(0.8, ccp(var_22_4, var_22_5))))
		end
	end
end

function var_0_5.showHammerEffect(arg_23_0)
	if arg_23_0.hammerNode then
		arg_23_0.hammerNode:removeAllChildrenWithCleanup(true)
	else
		arg_23_0.hammerNode = CCNode:create()

		arg_23_0.view.widgets.panel:addChild(arg_23_0.hammerNode, 200)
	end

	arg_23_0.view.widgets.btn_stone:setEnabled(false)

	local var_23_0 = CCNode:create()

	var_23_0:setScaleX(-1)
	arg_23_0.hammerNode:addChild(var_23_0)
	var_23_0:setPosition(ccp(350, 160))

	local var_23_1 = CCSprite:create("res/ui/resourceArea2/resou_gra_cz_g.png")

	var_23_1:setAnchorPoint(ccp(1, 0))
	var_23_1:setRotation(90)
	var_23_1:setScale(1.3)
	var_23_0:addChild(var_23_1)

	local var_23_2 = CCArray:create()

	for iter_23_0 = 1, 2 do
		var_23_2:addObject(CCEaseBounceOut:create(CCRotateBy:create(0.2, -90)))
		var_23_2:addObject(CCRotateBy:create(0.4, 90))

		if iter_23_0 == 2 then
			var_23_2:addObject(CCCallFuncN:create(function()
				var_23_1:removeFromParentAndCleanup(true)

				if arg_23_0.info.curType == 1 or arg_23_0.info.curType == 2 then
					arg_23_0:onKnockMeteorite()
				end
			end))
		end
	end

	local var_23_3 = CCSequence:create(var_23_2)

	var_23_1:runAction(CCSpeed:create(var_23_3, 1.6))

	if arg_23_0.info.curType == 3 then
		local var_23_4 = "res/anim/stategyEffect/att_jitui/att_jitui.plist"

		rmgr.loadResource(var_23_4)

		local var_23_5 = CCArray:create()

		for iter_23_1 = 1, 10 do
			iter_23_1 = iter_23_1 == 10 and 15 or iter_23_1

			local var_23_6 = CCSprite:createWithSpriteFrameName(string.format("%d.png", iter_23_1))

			var_23_5:addObject(var_23_6:displayFrame())
		end

		local var_23_7 = CCAnimation:createWithSpriteFrames(var_23_5, 0.08)
		local var_23_8 = CCAnimate:create(var_23_7)
		local var_23_9 = CCArray:create()

		var_23_9:addObject(CCDelayTime:create(0.9))
		var_23_9:addObject(var_23_8)
		var_23_9:addObject(CCCallFuncN:create(function()
			arg_23_0:onHit()
		end))

		local var_23_10 = CCSprite:create()

		var_23_10:setPosition(ccp(460, 180))
		arg_23_0.hammerNode:addChild(var_23_10)
		var_23_10:runAction(CCSequence:create(var_23_9))
		CCSpriteFrameCache:sharedSpriteFrameCache():removeSpriteFramesFromFile(var_23_4)
	end
end

function var_0_5.showPanel(arg_26_0, arg_26_1)
	arg_26_0.info = arg_26_1

	arg_26_0.view.widgets.remainNum:setString(language.get(217100, arg_26_0.info.remainNum))

	local var_26_0 = arg_26_1.remainNum == 0 and arg_26_1.meteoriteNum == 0

	arg_26_0.view.widgets.noStoneNode:setVisible(var_26_0)
	arg_26_0.view.widgets.haveStoneNode:setVisible(not var_26_0)

	if var_26_0 then
		local var_26_1 = arg_26_1.over ~= true

		arg_26_0.view.widgets.info_collect:setVisible(var_26_1)
		arg_26_0.view.widgets.info_end:setVisible(not var_26_1)

		local var_26_2 = arg_26_1.cityId > 0

		arg_26_0.view.widgets.info_wait:setVisible(var_26_1 and not var_26_2)
		arg_26_0.view.widgets.btn_collect:setVisible(var_26_1 and var_26_2)

		if var_26_1 and var_26_2 then
			arg_26_0.view.widgets.cityName:setString(language.get(217101, arg_26_1.cityName))
		end
	else
		local var_26_3 = arg_26_1.remainHits > 0

		if arg_26_1.meteoriteNum > 0 then
			var_26_3 = true
		end

		local var_26_4 = arg_26_1.freeHitTimes > 0

		arg_26_0.view.widgets.plot:setString(language.get(var_26_4 and 190520 or 217106))
		arg_26_0.view.widgets.freeTimes:setVisible(var_26_4)
		arg_26_0.view.widgets.goldIcon:setVisible(not var_26_4)
		arg_26_0.view.widgets.gold:setVisible(not var_26_4)

		if var_26_4 then
			arg_26_0.view.widgets.freeTimes:setString(language.get(20036, arg_26_1.freeHitTimes))
		else
			arg_26_0.view.widgets.gold:setString(language.get(142003, arg_26_1.hitGold))
		end

		arg_26_0.view.widgets.plot_bg:setVisible(not var_26_3)
		arg_26_0.view.widgets.plot:setVisible(not var_26_3)
		arg_26_0.view.widgets.name:setVisible(not var_26_3)
		arg_26_0.view.widgets.maskLayer:setVisible(var_26_3)
		arg_26_0.view.widgets.btn_stone:setVisible(var_26_3)

		if arg_26_1.curType > 0 then
			arg_26_0.view.widgets.icon:setDisplayFrame(CCSprite:create(string.format("res/ui/activity/meteorite/sczys_ys_%02d.png", arg_26_1.curType)):displayFrame())
			arg_26_0.view.widgets.name:setDisplayFrame(CCSprite:create(string.format("res/ui/activity/meteorite/sczys_word_%02d.png", arg_26_1.curType)):displayFrame())
		end

		local var_26_5 = not var_26_3 or var_26_3 and arg_26_1.remainHits > 0

		arg_26_0.view.widgets.icon:setVisible(var_26_5)

		local var_26_6 = arg_26_1.remainHits > 0

		arg_26_0.view.widgets.info_remainKnockTimes:setVisible(var_26_6)

		if var_26_6 then
			arg_26_0.view.widgets.remainKnockTimes:setString(tostring(arg_26_1.remainHits))
		end
	end

	arg_26_0:addStar()
	arg_26_0:addArrow()
	arg_26_0:addGem()
end

function var_0_5.ctor(arg_27_0, arg_27_1, arg_27_2)
	log.info("@@ 新神锤砸宝石活动")

	arg_27_0.view = {}

	uiutil.initWidgets(arg_27_0.view, arg_27_0.layout)

	arg_27_0.leftTime = arg_27_0.view.widgets.leftTime

	if arg_27_1 then
		arg_27_0:addChild(arg_27_0.view.widgets.panel)
		arg_27_1:addChild(arg_27_0)
	end

	arg_27_0.view.widgets.btn_collect:addHandleOfControlEvent(function()
		log.info("btn_collect")
		arg_27_0:onBtnCollectTap()
	end, CCControlEventTouchUpInside)
	arg_27_0.view.widgets.btn_knock:addHandleOfControlEvent(function()
		log.info("btn_knock")
		arg_27_0:onBtnKnockTap()
	end, CCControlEventTouchUpInside)
	arg_27_0.view.widgets.btn_giveup:addHandleOfControlEvent(function()
		log.info("btn_giveup")
		arg_27_0:onGiveUp()
	end, CCControlEventTouchUpInside)
	arg_27_0.view.widgets.btn_stone:addHandleOfControlEvent(function()
		log.info("btn_stone")
		arg_27_0:onBtnStoneTap()
	end, CCControlEventTouchUpInside)
	arg_27_0:showPanel(arg_27_2)
end

return var_0_5
