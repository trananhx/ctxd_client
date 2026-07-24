local var_0_0 = colorQuality[5]
local var_0_1 = colorQuality[0]
local var_0_2 = {
	[4] = 4,
	[116] = 55
}
local var_0_3 = class("MoonBuff", function()
	return createBaseLayer()
end)

var_0_3.layout = {
	name = "layer",
	x = 0,
	type = "layerColor",
	y = 0,
	color = ccc4(0, 0, 0, 200),
	width = visibleSize.width,
	height = visibleSize.height,
	children = {
		{
			name = "node",
			type = "node",
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 + 40,
			children = {
				{
					y = 90,
					name = "moon",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/activity/moonCake/ybds_moon.png"
					}
				},
				{
					y = 40,
					name = "cloud1",
					type = "sprite",
					x = 120,
					pic = {
						path = "res/ui/activity/moonCake/ybds_cloud_01.png"
					}
				},
				{
					y = 40,
					name = "cloud2",
					type = "sprite",
					x = -120,
					pic = {
						path = "res/ui/activity/moonCake/ybds_cloud_02.png"
					}
				},
				{
					y = -40,
					name = "cloud3",
					type = "sprite",
					x = 20,
					pic = {
						path = "res/ui/activity/moonCake/ybds_cloud_03.png"
					}
				},
				{
					y = -55,
					name = "censer1",
					type = "sprite",
					x = -140,
					pic = {
						path = "res/ui/activity/moonCake/ybds_xianglu.png"
					}
				},
				{
					y = -55,
					name = "censer2",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/activity/moonCake/ybds_xianglu.png"
					}
				},
				{
					y = -55,
					name = "censer3",
					type = "sprite",
					x = 140,
					pic = {
						path = "res/ui/activity/moonCake/ybds_xianglu.png"
					}
				},
				{
					y = 40,
					name = "txt",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/activity/moonCake/ybds_word_zqqf.png"
					}
				},
				{
					y = -150,
					name = "btn_silk",
					h = 62,
					type = "button",
					w = 195,
					visible = false,
					x = -120,
					normal = {
						path = "res/ui/common/button/public_btn_green.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_green_c.png"
					},
					children = {
						{
							fontSize = 25,
							y = 34,
							type = "label",
							x = 97,
							textId = 136124
						},
						{
							type = "sprite",
							name = "icon_gold_silk",
							x = 70,
							visible = false,
							y = -5,
							scale = 0.8,
							pic = {
								path = "res/ui/playerInfo/icon_gold.png"
							}
						},
						{
							fontSize = 22,
							name = "gold_silk",
							type = "label",
							visible = false,
							y = -5,
							x = 90,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					name = "btn_iron",
					h = 62,
					type = "button",
					w = 195,
					y = -150,
					x = 120,
					normal = {
						path = "res/ui/common/button/public_btn_green.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_green_c.png"
					},
					children = {
						{
							fontSize = 25,
							y = 34,
							type = "label",
							x = 97,
							textId = 136123
						},
						{
							type = "sprite",
							name = "icon_gold_iron",
							x = 70,
							visible = false,
							y = -5,
							scale = 0.8,
							pic = {
								path = "res/ui/playerInfo/icon_gold.png"
							}
						},
						{
							fontSize = 22,
							name = "gold_iron",
							type = "label",
							visible = false,
							y = -5,
							x = 90,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					name = "btn_back",
					h = 62,
					type = "button",
					w = 195,
					y = -260,
					x = 0,
					normal = {
						path = "res/ui/common/button/public_btn_orange.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_orange_c.png"
					},
					children = {
						{
							fontSize = 25,
							y = 34,
							type = "label",
							x = 97,
							textId = 83037
						}
					}
				},
				{
					visible = false,
					name = "bg_freeWishTimes",
					type = "sprite9",
					y = -210,
					x = 0,
					preferedSize = CCSizeMake(400, 54),
					middleRect = CCRectMake(10, 20, 514, 18),
					pic = {
						path = "res/ui/activity/moonCake/ybds_word_bg.png"
					},
					children = {
						{
							fontSize = 22,
							name = "freeWishTimes",
							y = 27,
							type = "label",
							x = 200
						}
					}
				}
			}
		}
	}
}

function var_0_3.onGetMoonCakeReward(arg_2_0, arg_2_1)
	local function var_2_0(arg_3_0)
		local var_3_0 = arg_3_0.action.data
		local var_3_1 = var_3_0.rewards[1]
		local var_3_2 = {}
		local var_3_3 = {
			id = var_0_2[var_3_1.type],
			value = var_3_1.num
		}

		table.insert(var_3_2, var_3_3)
		globalAction_gotResource(var_3_2)

		if var_3_1.baoji == 2 or var_3_1.baoji == 4 or var_3_1.baoji == 10 then
			local var_3_4 = CCSprite:create(string.format("res/ui/activity/ironReward/js_bj_%d.png", var_3_1.baoji))

			var_3_4:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 + 120))
			arg_2_0:showEffectBaoji(var_3_4)
		end

		user.moonBuff = var_3_0.moonBuff

		arg_2_0:showPanel(var_3_0.moonBuff)
	end

	if arg_2_0.info.freeWishTimes > 0 then
		cmgr.sendRequest(var_2_0, actions.getMoonCakeReward, arg_2_1)
	else
		local var_2_1 = arg_2_1 == 2 and arg_2_0.info.wishIronGold or arg_2_0.info.wishSilkGold

		messageBox.showChargeWin("", language.get(136116, var_2_1), "moonCakeBuyIronWishTimes", function()
			cmgr.sendRequest(var_2_0, actions.getMoonCakeReward, arg_2_1)
		end)
	end
end

function var_0_3.showEffectBaoji(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if arg_5_1 then
		arg_5_0:addChild(arg_5_1)
		arg_5_1:setScale(0.2)

		local function var_5_0()
			arg_5_0:removeChild(arg_5_1, true)

			if arg_5_2 then
				arg_5_2()
			end
		end

		local var_5_1 = CCArray:create()

		var_5_1:addObject(CCMoveBy:create(1, ccp(0, 60)))
		var_5_1:addObject(CCScaleTo:create(0.05, 1.1, 1.1))
		var_5_1:addObject(CCScaleTo:create(0.05, 1, 1))
		var_5_1:addObject(CCDelayTime:create(0.4))

		if type(arg_5_3) == "number" and arg_5_3 > 0 then
			var_5_1:addObject(CCDelayTime:create(arg_5_3))
		end

		var_5_1:addObject(CCCallFuncN:create(var_5_0))

		local var_5_2 = CCSequence:create(var_5_1)

		arg_5_1:runAction(var_5_2)
		arg_5_1:runAction(CCScaleTo:create(0.5, 1, 1))
	end
end

function var_0_3.showPanel(arg_7_0, arg_7_1)
	arg_7_0.info = arg_7_1

	local var_7_0 = arg_7_1.freeWishTimes > 0

	arg_7_0.view.widgets.bg_freeWishTimes:setVisible(var_7_0)
	arg_7_0.view.widgets.icon_gold_silk:setVisible(not var_7_0)
	arg_7_0.view.widgets.icon_gold_iron:setVisible(not var_7_0)
	arg_7_0.view.widgets.gold_silk:setVisible(not var_7_0)
	arg_7_0.view.widgets.gold_iron:setVisible(not var_7_0)

	if var_7_0 then
		arg_7_0.view.widgets.freeWishTimes:setString(language.get(136114, arg_7_1.freeWishTimes))
	else
		arg_7_0.view.widgets.gold_silk:setString(arg_7_1.wishSilkGold)
		arg_7_0.view.widgets.gold_iron:setString(arg_7_1.wishIronGold)
	end
end

function var_0_3.ctor(arg_8_0, arg_8_1, arg_8_2)
	log.info("@@ 中秋祈福")

	arg_8_0.view = {}

	uiutil.initWidgets(arg_8_0.view, arg_8_0.layout)
	swallowTouch(arg_8_0)

	if arg_8_1 then
		arg_8_0:addChild(arg_8_0.view.widgets.layer)
		arg_8_1:addChild(arg_8_0)
	end

	if arg_8_2.buttonNum == 1 then
		arg_8_0.view.widgets.btn_iron:setPositionX(0)
	end

	arg_8_0.view.widgets.btn_silk:setVisible(arg_8_2.buttonNum == 2)
	arg_8_0.view.widgets.btn_silk:addHandleOfControlEvent(function()
		log.info("btn_silk")
		arg_8_0:onGetMoonCakeReward(3)
	end, CCControlEventTouchUpInside)
	arg_8_0.view.widgets.btn_iron:addHandleOfControlEvent(function()
		log.info("btn_iron")
		arg_8_0:onGetMoonCakeReward(2)
	end, CCControlEventTouchUpInside)
	arg_8_0.view.widgets.btn_back:addHandleOfControlEvent(function()
		log.info("btn_back")
		arg_8_0:removeFromParentAndCleanup(true)
	end, CCControlEventTouchUpInside)
	arg_8_0:showPanel(arg_8_2)
end

return var_0_3
