local var_0_0 = colorQuality[0]
local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = ccc3(0, 180, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = class("MeteorIncense", function()
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
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 - 30,
			pic = {
				path = "res/ui/comment/bg1.jpg"
			},
			children = {
				{
					y = 340,
					x = 457.5,
					type = "sprite",
					pic = {
						path = "res/ui/activity/meteorIncense/ytjs_res_bg.png"
					}
				},
				{
					y = 100,
					name = "npc",
					type = "sprite",
					x = 3,
					anchorPoint = ccp(0, 0),
					pic = {
						path = "res/ui/common/halfPic/halfPic_fuxi.png"
					}
				},
				{
					y = 480,
					x = 457.5,
					type = "sprite",
					pic = {
						path = "res/ui/activity/meteorIncense/ytjs_title.png"
					}
				},
				{
					fontSize = 25,
					name = "leftTime",
					y = 470,
					type = "label",
					x = 780,
					color = var_0_3
				},
				{
					y = 375,
					type = "sprite",
					x = 510,
					pic = {
						path = "res/ui/activity/meteorIncense/ytjs_bar_bg.png"
					},
					children = {
						{
							y = 18,
							name = "bar1",
							type = "progressbar",
							x = 360,
							pic = {
								path = "res/ui/activity/meteorIncense/ytjs_bar.png"
							},
							children = {
								{
									y = 0,
									name = "node_bar",
									x = 0,
									type = "node"
								},
								{
									fontSize = 25,
									name = "incenseNum",
									style = "label_warlock",
									type = "label",
									y = 18,
									x = 351,
									color = var_0_1
								}
							}
						}
					}
				},
				{
					y = 190,
					type = "sprite",
					x = 510,
					pic = {
						path = "res/ui/activity/meteorIncense/ytjs_word_bg.png"
					},
					children = {
						{
							anchorPointX = 0.5,
							name = "richLine",
							y = 30,
							type = "richLine",
							x = 220,
							content = {
								{
									name = "leftTimesToSp",
									fontSize = 25,
									type = "label",
									color = var_0_1
								},
								{
									type = "sprite",
									pic = {
										path = "res/ui/weapon/machine/zc_yt_icon.png"
									}
								},
								{
									fontSize = 25,
									name = "spReward",
									type = "label"
								}
							}
						}
					}
				},
				{
					y = 158,
					type = "sprite",
					x = 510,
					pic = {
						path = "res/ui/activity/meteorIncense/ytjs_bar_s_bg.png"
					},
					children = {
						{
							y = 9,
							name = "bar2",
							type = "progressbar",
							x = 236,
							pic = {
								path = "res/ui/activity/meteorIncense/ytjs_bar_s.png"
							}
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_incense",
					h = 62,
					type = "button",
					w = 195,
					y = 80,
					x = 400,
					normal = {
						path = "res/ui/common/button/public_btn_green.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_green_c.png"
					},
					disable = {
						path = "res/ui/common/button/public_btn_green_g.png"
					},
					children = {
						{
							y = 34,
							type = "sprite",
							x = 14,
							pic = {
								path = "res/ui/common/button/public_btn_gold.png"
							},
							children = {
								{
									y = 35,
									x = 42,
									type = "sprite",
									pic = {
										path = "res/ui/activity/ironRotary/yuanbao.png"
									}
								},
								{
									fontSize = 22,
									name = "incenseGold",
									y = 15,
									type = "label",
									x = 42
								}
							}
						},
						{
							fontSize = 25,
							y = 34,
							type = "label",
							x = 110,
							color = var_0_1,
							text = language.get(131162, 1)
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_incense5",
					h = 62,
					type = "button",
					w = 195,
					y = 80,
					x = 650,
					normal = {
						path = "res/ui/common/button/public_btn_orange.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_orange_c.png"
					},
					disable = {
						path = "res/ui/common/button/public_btn_orange_g.png"
					},
					children = {
						{
							y = 34,
							type = "sprite",
							x = 14,
							pic = {
								path = "res/ui/common/button/public_btn_gold.png"
							},
							children = {
								{
									y = 35,
									x = 42,
									type = "sprite",
									pic = {
										path = "res/ui/activity/ironRotary/yuanbao.png"
									}
								},
								{
									fontSize = 22,
									name = "incense5Gold",
									y = 15,
									type = "label",
									x = 42
								}
							}
						},
						{
							fontSize = 25,
							y = 34,
							type = "label",
							x = 110,
							color = var_0_1,
							text = language.get(131162, 6)
						}
					}
				}
			}
		}
	}
}
var_0_6.layout_reward = {
	y = 0,
	name = "node",
	type = "node",
	x = 0,
	children = {
		{
			name = "btn",
			h = 100,
			type = "button",
			w = 100,
			y = 0,
			x = 0,
			normal = {
				path = "res/default.png"
			},
			touched = {
				path = "res/default.png"
			},
			children = {
				{
					y = 50,
					type = "sprite",
					x = 50,
					pic = {
						path = "res/ui/equip/shenjiang/jtz_icon_bg.png"
					},
					children = {
						{
							y = 44,
							name = "icon",
							type = "sprite",
							x = 44,
							pic = {
								path = "res/ui/activity/meteorIncense/yuntie2.jpg"
							}
						},
						{
							type = "sprite",
							name = "light",
							y = 44,
							visible = false,
							x = 44,
							pic = {
								path = "res/ui/equip/shenjiang/jtz_icon_bg_l.png"
							}
						},
						{
							fontSize = 25,
							name = "reward",
							type = "label",
							style = "label_warlock",
							x = 44,
							y = 8,
							color = var_0_1,
							anchorPoint = ccp(0.5, 0)
						}
					}
				}
			}
		},
		{
			fontSize = 22,
			name = "num",
			y = 100,
			type = "label",
			x = 0,
			color = var_0_1
		}
	}
}

function var_0_6.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getMeteorIncenseActivity)
end

function var_0_6.onGetReward(arg_4_0, arg_4_1)
	local function var_4_0(arg_5_0)
		local var_5_0 = arg_5_0.action.data

		if var_5_0.num and var_5_0.num > 0 then
			local var_5_1 = {}
			local var_5_2 = {}

			var_5_2.id = 216
			var_5_2.value = var_5_0.num

			table.insert(var_5_1, var_5_2)
			globalAction_gotResource(var_5_1)
		end

		arg_4_0:refresh()
	end

	cmgr.sendRequest(var_4_0, actions.getMeteorIncenseReward, arg_4_1)
end

function var_0_6.onDoWorship(arg_6_0, arg_6_1)
	local var_6_0 = 0
	local var_6_1

	local function var_6_2(arg_7_0)
		local var_7_0 = arg_7_0.action.data

		if var_7_0.ex and var_7_0.ex.addNum > 0 then
			local var_7_1 = {}
			local var_7_2 = {}

			var_7_2.id = 216
			var_7_2.value = var_7_0.ex.addNum

			table.insert(var_7_1, var_7_2)
			globalAction_gotResource(var_7_1)
		end

		local var_7_3 = var_7_0.resourceGot[1]
		local var_7_4 = var_7_0.multiple
		local var_7_5 = CCSprite:create("res/ui/activity/ironReward/js_get_bg.png")
		local var_7_6 = CCStrokeLabelTTF:create(language.get(131153, var_7_3.addNum), "Thonburi", 20, 2, ccc3(22, 18, 13))
		local var_7_7 = smgr.getLayer("pushLayer")
		local var_7_8 = arg_6_0.view.widgets.npc

		if var_7_4 > 1 then
			if arg_6_0.bjSprite and not tolua.isnull(arg_6_0.bjSprite) then
				arg_6_0.bjSprite:removeFromParentAndCleanup(true)

				arg_6_0.bjSprite = nil
			end

			local var_7_9 = CCSprite:create("res/ui/activity/ironReward/js_bj_" .. var_7_4 .. ".png")
			local var_7_10 = ccp(tool.getPositionInScreen(var_7_8))
			local var_7_11 = ccpAdd(var_7_10, ccp(105.5, 140))

			var_7_9:setPosition(var_7_11)
			var_7_7:addChild(var_7_9)

			local var_7_12 = CCArray:create()

			var_7_12:addObject(CCDelayTime:create(0.5))
			var_7_12:addObject(CCFadeOut:create(0.2))
			var_7_12:addObject(CCCallFunc:create(function()
				var_7_9:removeFromParentAndCleanup(true)

				var_7_9 = nil
			end))
			var_7_9:runAction(CCSequence:create(var_7_12))

			arg_6_0.bjSprite = var_7_9
		end

		if var_7_4 == 1 then
			var_7_6:setColor(ccc3(255, 255, 204))
		elseif var_7_4 == 2 then
			var_7_6:setColor(ccc3(255, 204, 0))
		elseif var_7_4 == 4 then
			var_7_6:setColor(ccc3(240, 112, 84))
		elseif var_7_4 == 10 then
			var_7_6:setColor(ccc3(200, 123, 245))
		end

		var_7_6:setPosition(ccp(80.5, 16.5))
		var_7_5:addChild(var_7_6)

		local var_7_13 = ccp(tool.getPositionInScreen(var_7_8))
		local var_7_14 = ccpAdd(var_7_13, ccp(105.5, 0))

		var_7_5:setPosition(var_7_14)
		var_7_7:addChild(var_7_5)

		local var_7_15 = CCArray:create()

		var_7_15:addObject(CCEaseSineInOut:create(CCMoveBy:create(0.5, ccp(0, 100))))
		var_7_15:addObject(CCFadeOut:create(0.4))
		var_7_15:addObject(CCCallFunc:create(function()
			var_7_5:removeFromParentAndCleanup(true)
		end))
		var_7_5:runAction(CCSequence:create(var_7_15))

		local var_7_16 = CCArray:create()

		var_7_16:addObject(CCDelayTime:create(0.5))
		var_7_16:addObject(CCFadeOut:create(0.4))
		var_7_6:runAction(CCSequence:create(var_7_16))

		var_6_0 = var_6_0 + 1

		if var_6_0 >= arg_6_1 then
			arg_6_0:refresh()
		else
			cmgr.sendRequest(var_6_2, actions.doWorship, 5)
		end
	end

	local var_6_3 = arg_6_1 > 1 and arg_6_0.info.incense5Gold or arg_6_0.info.incenseGold

	messageBox.showChargeWin("", language.get(71010, var_6_3), "incenseGold", function()
		cmgr.sendRequest(var_6_2, actions.doWorship, 5)
	end)
end

function var_0_6.showEffectShake(arg_11_0, arg_11_1)
	if not arg_11_1 or tolua.isnull(arg_11_1) then
		return
	end

	local var_11_0 = CCArray:create()

	var_11_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_11_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_11_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_11_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_11_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_11_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_11_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_11_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_11_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_11_0:addObject(CCDelayTime:create(0.4))

	local var_11_1 = CCSequence:create(var_11_0)

	arg_11_1:stopAllActions()
	arg_11_1:runAction(CCRepeatForever:create(var_11_1))
end

function var_0_6.showPanel(arg_12_0, arg_12_1)
	arg_12_0.info = arg_12_1

	arg_12_0.view.widgets.incenseNum:setString(language.get(213297, arg_12_1.incenseNum, arg_12_1.fmfs[#arg_12_1.fmfs].feteNum))
	arg_12_0.view.widgets.node_bar:removeAllChildrenWithCleanup(true)

	local var_12_0 = #arg_12_1.fmfs
	local var_12_1 = 0

	for iter_12_0, iter_12_1 in ipairs(arg_12_1.fmfs) do
		local var_12_2 = {}
		local var_12_3 = iter_12_0 / var_12_0 * 702

		uiutil.initWidgets(var_12_2, arg_12_0.layout_reward)
		var_12_2.widgets.node:setPosition(var_12_3, -50)
		arg_12_0.view.widgets.node_bar:addChild(var_12_2.widgets.node)
		var_12_2.widgets.num:setString(language.get(131162, iter_12_1.feteNum))
		var_12_2.widgets.reward:setString(iter_12_1.reward)
		var_12_2.widgets.btn:setEnabled(false)
		var_12_2.widgets.btn:addHandleOfControlEvent(function()
			log.info("btn" .. iter_12_0)
			arg_12_0:onGetReward(iter_12_0)
		end, CCControlEventTouchUpInside)

		if iter_12_1.recved == true then
			tool.spriteToGray(var_12_2.widgets.icon)
		end

		if arg_12_1.incenseNum >= iter_12_1.feteNum then
			var_12_1 = var_12_1 + 100 / var_12_0

			if iter_12_1.recved == false then
				var_12_2.widgets.light:setVisible(true)
				arg_12_0:showEffectShake(var_12_2.widgets.btn)
				var_12_2.widgets.btn:setEnabled(true)
			end
		else
			local var_12_4 = iter_12_0 == 1 and 0 or arg_12_1.fmfs[iter_12_0 - 1].feteNum

			if var_12_4 <= arg_12_1.incenseNum then
				var_12_1 = var_12_1 + 100 / var_12_0 * (arg_12_1.incenseNum - var_12_4) / (iter_12_1.feteNum - var_12_4)
			end
		end
	end

	arg_12_0.view.widgets.bar1:setPercentage(var_12_1)
	arg_12_0.view.widgets.leftTimesToSp:setString(language.get(131164, arg_12_1.leftTimesToSp))
	arg_12_0.view.widgets.spReward:setString(language.get(135039, arg_12_1.spReward))
	arg_12_0.view.widgets.richLine:reorder()
	arg_12_0.view.widgets.bar2:setPercentage(100 - 10 * arg_12_1.leftTimesToSp)
	arg_12_0.view.widgets.incenseGold:setString(arg_12_1.incenseGold)
	arg_12_0.view.widgets.incense5Gold:setString(arg_12_1.incense5Gold)
end

function var_0_6.ctor(arg_14_0, arg_14_1, arg_14_2)
	log.info("@@ 陨铁祭祀活动")

	arg_14_0.view = {}

	uiutil.initWidgets(arg_14_0.view, arg_14_0.layout)

	arg_14_0.leftTime = arg_14_0.view.widgets.leftTime

	if arg_14_1 then
		arg_14_0:addChild(arg_14_0.view.widgets.root)
		arg_14_1:addChild(arg_14_0)
	end

	arg_14_0.view.widgets.btn_incense:addHandleOfControlEvent(function()
		log.info("btn_incense")
		arg_14_0:onDoWorship(1)
	end, CCControlEventTouchUpInside)
	arg_14_0.view.widgets.btn_incense5:addHandleOfControlEvent(function()
		log.info("btn_incense5")
		arg_14_0:onDoWorship(6)
	end, CCControlEventTouchUpInside)
	arg_14_0:showPanel(arg_14_2)
end

return var_0_6
