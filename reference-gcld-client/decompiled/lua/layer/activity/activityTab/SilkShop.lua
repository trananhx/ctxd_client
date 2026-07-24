local var_0_0 = require("res/native/offset").get("layer.activity.silkshop")
local var_0_1 = class("SilkShop", function()
	return createBaseLayer()
end)
local var_0_2 = {
	[123] = {}
}

var_0_2[123].pic = "res/ui/silk/market/scsp_yhj_sb.png"
var_0_2[123].scale = 0.6
var_0_2[122] = {}
var_0_2[122].pic = "res/ui/silk/market/scsp_yhj_3b.png"
var_0_2[122].scale = 0.6
var_0_2[125] = {}
var_0_2[125].pic = "res/ui/world/feud/sbxt_btn_zs.png"
var_0_2[125].scale = 1
var_0_2[116] = {}
var_0_2[116].pic = "res/ui/task/get_icon_silk.png"
var_0_2[116].scale = 1

local var_0_3 = {}

var_0_3[116] = 55
var_0_3[122] = 10029
var_0_3[123] = 10028
var_0_3[125] = 10034
var_0_1.layout = {
	name = "Scene",
	type = "node",
	x = visibleSize.width / 2 - 188.5,
	y = visibleSize.height / 2 - 168.5,
	children = {
		{
			y = 139.5,
			name = "Sprite_1",
			type = "sprite",
			x = 188.5,
			pic = {
				path = "res/ui/comment/bg1.jpg"
			}
		},
		{
			fontSize = 24,
			name = "leftTime",
			style = "label_warlock",
			type = "label",
			y = 338,
			color = ccc3(255, 0, 0),
			x = 420 + (var_0_0.leftTimeOffsetX or 0)
		},
		{
			y = 341.2502,
			name = "Sprite_2",
			type = "sprite",
			x = 185.1677,
			pic = {
				path = "res/ui/activity/silkshop/scdcb_title.png"
			}
		},
		{
			y = 284.5836,
			name = "Sprite_3",
			z = 1000,
			type = "sprite",
			x = 174.3342,
			pic = {
				path = "res/ui/activity/consumeGift/xfshl_tit_bg.png"
			},
			children = {
				{
					y = 37.5836,
					name = "upWord",
					type = "sprite",
					x = 457.3342,
					scale = 0.9 + (var_0_0.nextGoldScale or 0),
					pic = {
						path = "res/ui/activity/silkshop/scdcb_word_01.png"
					},
					children = {
						{
							name = "nextGold",
							type = "atlaslabel",
							pic = "res/ui/common/number/lm_tit_num.png",
							startCharMap = 48,
							text = "1000",
							itemWidth = 22,
							itemHeight = 32,
							x = 152 + (var_0_0.nextGoldOffsetX or 0),
							y = 15 + (var_0_0.nextGoldOffsetY or 0),
							anchorPoint = ccp(0.5, 0.5)
						}
					}
				}
			}
		},
		{
			y = 134.1671,
			name = "Sprite_4",
			type = "sprite",
			x = 181.8351,
			pic = {
				path = "res/ui/activity/consumeGift/xfshl_bg.png"
			},
			children = {
				{
					y = 115.417,
					name = "Sprite_5",
					type = "sprite",
					x = 564.5002,
					pic = {
						path = "res/ui/activity/consumeGift/xfshl_pb_bg.png"
					},
					children = {
						{
							y = 22,
							name = "progress",
							type = "progressbar",
							x = 0,
							anchorPoint = ccp(0, 0.5),
							progressType = kCCProgressTimerTypeBar,
							pic = {
								frame = false,
								path = "res/ui/activity/consumeGift/xfshl_pb.png"
							}
						},
						{
							name = "Text_1",
							y = 174,
							type = "label",
							x = 570,
							fontSize = 24 + (var_0_0.Text_1FntSize or 0),
							text = language.get(450051),
							color = ccc3(0, 255, 0)
						},
						{
							y = 25,
							name = "CircleBg0",
							type = "sprite",
							x = 0,
							pic = {
								frame = true,
								path = "res_icon_19.png"
							}
						},
						{
							y = 25,
							name = "CircleBg2",
							type = "sprite",
							x = 290,
							pic = {
								path = "res/ui/activity/consumeGift/xfshl_gem_bg.png"
							},
							children = {
								{
									y = 24,
									name = "Box2",
									type = "sprite",
									x = 26.2502,
									pic = {
										path = "res/ui/activity/ancientCastle/tbxz_pb_box.png"
									}
								},
								{
									name = "goldNum2",
									type = "atlaslabel",
									pic = "res/ui/common/number/up_numb.png",
									startCharMap = 48,
									text = "100",
									y = 60,
									itemWidth = 16,
									x = 26,
									itemHeight = 21,
									anchorPoint = ccp(0.5, 0.5)
								}
							}
						},
						{
							y = 25,
							name = "CircleBg1",
							type = "sprite",
							x = 145,
							pic = {
								path = "res/ui/activity/consumeGift/xfshl_gem_bg.png"
							},
							children = {
								{
									y = 24.2504,
									name = "Box1",
									type = "sprite",
									x = 26,
									pic = {
										path = "res/ui/activity/ancientCastle/tbxz_pb_box.png"
									}
								},
								{
									name = "goldNum1",
									type = "atlaslabel",
									pic = "res/ui/common/number/up_numb.png",
									startCharMap = 48,
									text = "100",
									y = 60,
									itemWidth = 16,
									x = 26,
									itemHeight = 21,
									anchorPoint = ccp(0.5, 0.5)
								}
							}
						},
						{
							y = 25,
							name = "CircleBg3",
							type = "sprite",
							x = 435,
							pic = {
								path = "res/ui/activity/consumeGift/xfshl_gem_bg.png"
							},
							children = {
								{
									y = 24.2504,
									name = "Box3",
									type = "sprite",
									x = 26,
									pic = {
										path = "res/ui/activity/ancientCastle/tbxz_pb_box.png"
									}
								},
								{
									name = "goldNum3",
									type = "atlaslabel",
									pic = "res/ui/common/number/up_numb.png",
									startCharMap = 48,
									text = "100",
									y = 60,
									itemWidth = 16,
									x = 26,
									itemHeight = 21,
									anchorPoint = ccp(0.5, 0.5)
								}
							}
						},
						{
							y = 25,
							name = "CircleBg4",
							type = "sprite",
							x = 580,
							pic = {
								path = "res/ui/activity/consumeGift/xfshl_gem_bg.png"
							},
							children = {
								{
									y = 24.2504,
									name = "Box4",
									type = "sprite",
									x = 26,
									pic = {
										path = "res/ui/activity/ancientCastle/tbxz_pb_box.png"
									}
								},
								{
									name = "goldNum4",
									type = "atlaslabel",
									pic = "res/ui/common/number/up_numb.png",
									startCharMap = 48,
									text = "100",
									y = 60,
									itemWidth = 16,
									x = 26,
									itemHeight = 21,
									anchorPoint = ccp(0.5, 0.5)
								}
							}
						}
					}
				}
			}
		},
		{
			y = 102.5004,
			name = "Sprite_6",
			scale = 0.8,
			type = "sprite",
			x = -155.1638,
			pic = {
				path = "res/ui/comment/xiaoqian.png"
			}
		},
		{
			y = 124.1671,
			name = "tip_node",
			type = "sprite",
			x = 11.835100000000011,
			pic = {
				path = "res/default.png"
			}
		},
		{
			fontSize = 22,
			name = "Text_2",
			y = -48.0836,
			type = "label",
			x = 215.9992 + (var_0_0.Text_2OffsetX or 0),
			text = language.get(450052),
			color = ccc3(237, 209, 169)
		},
		{
			name = "Button_1",
			h = 62,
			type = "button",
			w = 195,
			y = -50.8334,
			x = 204.7508,
			normal = {
				path = "res/ui/common/button/public_btn_green.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_green_c.png"
			},
			disable = {
				path = "res/ui/common/button/public_btn_green_g.png"
			}
		},
		{
			fontSize = 24,
			name = "Text_Button",
			y = -48.8334,
			type = "label",
			z = 1000,
			x = 204.7508,
			text = language.get(20005)
		}
	}
}

function var_0_1.ctor(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.data = arg_2_2
	arg_2_0.view = {}
	arg_2_0.view = {}

	uiutil.initWidgets(arg_2_0.view, arg_2_0.layout)

	arg_2_0.leftTime = arg_2_0.view.widgets.leftTime

	arg_2_0.view.widgets.Button_1:addHandleOfControlEvent(function()
		log.info("Button_1")

		local function var_3_0(arg_4_0)
			if arg_4_0.action.data then
				local var_4_0 = arg_4_0.action.data.rewards
				local var_4_1 = {}

				for iter_4_0, iter_4_1 in pairs(var_4_0) do
					var_4_1[iter_4_0] = {}
					var_4_1[iter_4_0].id = var_0_3[iter_4_1.type]
					var_4_1[iter_4_0].value = iter_4_1.value
				end

				globalAction_gotResource(var_4_1)

				local function var_4_2(arg_5_0)
					if arg_5_0.action.data then
						arg_2_0.data = arg_5_0.action.data

						arg_2_0:refresh()
					end
				end

				cmgr.sendRequest(var_4_2, actions.getSilkShopActivity)
			end
		end

		cmgr.sendRequest(var_3_0, actions.silkShopReward, arg_2_0.currentStep or 0)
	end, CCControlEventTouchUpInside)

	if arg_2_1 then
		arg_2_0:addChild(arg_2_0.view.widgets.Scene)
		arg_2_1:addChild(arg_2_0)
	end

	arg_2_0:refresh()
end

function var_0_1.onEnter(arg_6_0)
	log.info("SilkShop:onEnter()")

	arg_6_0.touchBeganRef = handler(arg_6_0, arg_6_0.onTouchBegan)
	arg_6_0.touchMovedRef = handler(arg_6_0, arg_6_0.onTouchMoved)
	arg_6_0.touchEndedRef = handler(arg_6_0, arg_6_0.onTouchEnded)
	arg_6_0.touchCancelledRef = handler(arg_6_0, arg_6_0.onTouchCancelled)

	eventManager.registerEvent("globalOnTouchBegan", arg_6_0.touchBeganRef)
	eventManager.registerEvent("globalOnTouchMoved", arg_6_0.touchMovedRef)
	eventManager.registerEvent("globalOnTouchEnded", arg_6_0.touchEndedRef)
	eventManager.registerEvent("globalOnTouchCancelled", arg_6_0.touchCancelledRef)
end

function var_0_1.onExit(arg_7_0)
	log.info("SilkShop:onExit()")
	eventManager.unregisterEvent("globalOnTouchBegan", arg_7_0.touchBeganRef)
	eventManager.unregisterEvent("globalOnTouchMoved", arg_7_0.touchMovedRef)
	eventManager.unregisterEvent("globalOnTouchEnded", arg_7_0.touchEndedRef)
	eventManager.unregisterEvent("globalOnTouchCancelled", arg_7_0.touchCancelledRef)
end

function var_0_1.onTouchBegan(arg_8_0, arg_8_1, arg_8_2)
	for iter_8_0 = 0, 4 do
		if tool.checkIfTouch(arg_8_0.view.widgets["CircleBg" .. iter_8_0], arg_8_1, arg_8_2) then
			arg_8_0:addTips(iter_8_0)
		end
	end

	if tool.checkIfTouch(arg_8_0.view.widgets.Text_1, arg_8_1, arg_8_2) then
		resourceUI.show(8)
	end
end

function var_0_1.onTouchMoved(arg_9_0, arg_9_1, arg_9_2)
	return
end

function var_0_1.onTouchEnded(arg_10_0, arg_10_1, arg_10_2)
	return
end

function var_0_1.onTouchCancelled(arg_11_0, arg_11_1, arg_11_2)
	return
end

function var_0_1.refresh(arg_12_0)
	local var_12_0 = 1

	if arg_12_0.data.yesterday then
		for iter_12_0, iter_12_1 in pairs(arg_12_0.data.yesterday) do
			if iter_12_1.received ~= iter_12_1.reached then
				var_12_0 = 0
				arg_12_0.currentStep = iter_12_0

				break
			end
		end
	end

	arg_12_0:addTips()

	if var_12_0 == 0 then
		local var_12_1 = 0

		for iter_12_2 = 1, 4 do
			if arg_12_0.data.yesterday and arg_12_0.data.yesterday[iter_12_2] then
				arg_12_0.view.widgets["goldNum" .. iter_12_2]:setString(arg_12_0.data.yesterday[iter_12_2].gold)
			end

			if arg_12_0.data.yesterday[iter_12_2].received == 1 then
				arg_12_0.view.widgets["Box" .. iter_12_2]:setDisplayFrame(CCSprite:create("res/ui/activity/ancientCastle/zhongckai.png"):displayFrame())
			else
				arg_12_0.view.widgets["Box" .. iter_12_2]:setDisplayFrame(CCSprite:create("res/ui/activity/ancientCastle/tbxz_pb_box.png"):displayFrame())
			end

			if arg_12_0.data.yesterday[iter_12_2].gold < arg_12_0.data.yesterdayGold then
				var_12_1 = var_12_1 + 25
			elseif arg_12_0.data.yesterday[iter_12_2 - 1] == nil or arg_12_0.data.yesterday[iter_12_2 - 1].gold < arg_12_0.data.yesterdayGold then
				if arg_12_0.data.yesterday[iter_12_2 - 1] then
					var_12_1 = var_12_1 + (arg_12_0.data.yesterdayGold - arg_12_0.data.yesterday[iter_12_2 - 1].gold) * 25 / (arg_12_0.data.yesterday[iter_12_2].gold - arg_12_0.data.yesterday[iter_12_2 - 1].gold)
				else
					var_12_1 = var_12_1 + arg_12_0.data.yesterdayGold * 25 / arg_12_0.data.yesterday[iter_12_2].gold
				end
			end
		end

		arg_12_0.view.widgets.progress:setPercentage(var_12_1)
	else
		local var_12_2 = 0

		for iter_12_3 = 1, 4 do
			arg_12_0.view.widgets["Box" .. iter_12_3]:setDisplayFrame(CCSprite:create("res/ui/activity/ancientCastle/tbxz_pb_box.png"):displayFrame())

			if arg_12_0.data.today and arg_12_0.data.today[iter_12_3] then
				arg_12_0.view.widgets["goldNum" .. iter_12_3]:setString(arg_12_0.data.today[iter_12_3].gold)
			end

			if arg_12_0.data.today[iter_12_3].gold < arg_12_0.data.todayGold then
				var_12_2 = var_12_2 + 25
			elseif arg_12_0.data.today[iter_12_3 - 1] == nil or arg_12_0.data.today[iter_12_3 - 1].gold < arg_12_0.data.todayGold then
				if arg_12_0.data.today[iter_12_3 - 1] then
					var_12_2 = var_12_2 + (arg_12_0.data.todayGold - arg_12_0.data.today[iter_12_3 - 1].gold) * 25 / (arg_12_0.data.today[iter_12_3].gold - arg_12_0.data.today[iter_12_3 - 1].gold)
				else
					var_12_2 = var_12_2 + arg_12_0.data.todayGold * 25 / arg_12_0.data.today[iter_12_3].gold
				end
			end
		end

		arg_12_0.view.widgets.progress:setPercentage(var_12_2)
	end

	arg_12_0.view.widgets.nextGold:setVisible(false)
	arg_12_0.view.widgets.Text_2:setVisible(false)
	arg_12_0.view.widgets.Button_1:setVisible(false)
	arg_12_0.view.widgets.Text_Button:setVisible(false)

	if var_12_0 == 0 then
		arg_12_0.view.widgets.upWord:setDisplayFrame(CCSprite:create("res/ui/activity/silkshop/scdcb_word_03.png"):displayFrame())
		arg_12_0.view.widgets.Button_1:setVisible(true)
		arg_12_0.view.widgets.Text_Button:setVisible(true)
	elseif arg_12_0.data.freeStatus == 0 then
		arg_12_0.view.widgets.upWord:setDisplayFrame(CCSprite:create("res/ui/activity/silkshop/scdcb_word_01.png"):displayFrame())
		arg_12_0.view.widgets.Button_1:setVisible(true)
		arg_12_0.view.widgets.Text_Button:setVisible(true)

		arg_12_0.currentStep = 0
	elseif arg_12_0.data.today and arg_12_0.data.today[4] and arg_12_0.data.today[4].gold <= arg_12_0.data.todayGold then
		arg_12_0.view.widgets.upWord:setDisplayFrame(CCSprite:create("res/ui/activity/silkshop/scdcb_word_02.png"):displayFrame())
		arg_12_0.view.widgets.Text_2:setVisible(true)

		if arg_12_0.data.tipsType == 1 then
			arg_12_0.view.widgets.Text_2:setString(language.get(450052))
		else
			arg_12_0.view.widgets.Text_2:setString(language.get(450055))
		end
	else
		arg_12_0.view.widgets.nextGold:setVisible(true)

		for iter_12_4 = 1, 4 do
			if arg_12_0.data.today[iter_12_4].gold > arg_12_0.data.todayGold then
				arg_12_0.view.widgets.nextGold:setString(arg_12_0.data.today[iter_12_4].gold - arg_12_0.data.todayGold)

				break
			end
		end

		arg_12_0.view.widgets.upWord:setDisplayFrame(CCSprite:create("res/ui/activity/silkshop/scdcb_word_04.png"):displayFrame())
		arg_12_0.view.widgets.Text_2:setVisible(true)

		if arg_12_0.data.tipsType == 1 then
			arg_12_0.view.widgets.Text_2:setString(language.get(450052))
		else
			arg_12_0.view.widgets.Text_2:setString(language.get(450055))
		end
	end
end

function var_0_1.addTips(arg_13_0, arg_13_1)
	local function var_13_0(arg_14_0, arg_14_1)
		if arg_14_1 == 0 and arg_13_0.data.freeStatus == 0 then
			local var_14_0 = arg_13_0.data.freeRewards
			local var_14_1 = CCSprite:create("res/ui/activity/silkshop/scdcb_jl_d.png")

			if #var_14_0 > 2 then
				var_14_1 = CCSprite:create("res/ui/activity/silkshop/scdcb_jl_d2.png")
			end

			for iter_14_0 = 1, #var_14_0 do
				local var_14_2 = CCSprite:create("res/ui/silk/market/scpm_samll_view_icon.png")
				local var_14_3 = CCSprite:create("res/ui/activity/betray/cc_view_bg.png")

				var_14_3:setPosition(ccp(var_14_2:getContentSize().width / 2, 12))
				var_14_3:setScale(0.7)
				var_14_2:addChild(var_14_3, 1)

				local var_14_4 = CCLabelTTF:create(var_14_0[iter_14_0].num, "Thonburi", 20)

				var_14_4:setPosition(ccp(var_14_2:getContentSize().width / 2, 12))
				var_14_2:addChild(var_14_4, 2)

				local var_14_5 = CCSprite:create(var_0_2[var_14_0[iter_14_0].type].pic)

				var_14_5:setScale(var_0_2[var_14_0[iter_14_0].type].scale)
				var_14_5:setPosition(ccp(var_14_2:getContentSize().width / 2, var_14_2:getContentSize().height / 2 + 3))
				var_14_2:addChild(var_14_5, 0)
				var_14_2:setPosition(ccp(53 + 90 * (iter_14_0 - 1), 50))
				var_14_1:addChild(var_14_2)
			end

			arg_13_0.view.widgets.tip_node:removeChildByTag(101, true)
			arg_13_0.view.widgets.tip_node:addChild(var_14_1, 100, 101)

			if arg_13_0.view.widgets["CircleBg" .. arg_14_1] then
				local var_14_6, var_14_7 = arg_13_0.view.widgets["CircleBg" .. arg_14_1]:getPosition()

				if #var_14_0 > 2 then
					var_14_1:setPosition(ccp(var_14_6 - 120, var_14_7 - 80))
				else
					var_14_1:setPosition(ccp(var_14_6, var_14_7 - 80))
				end
			end
		elseif arg_14_1 and arg_14_0[arg_14_1] then
			local var_14_8 = arg_14_0[arg_14_1]
			local var_14_9 = CCSprite:create("res/ui/activity/silkshop/scdcb_jl_d.png")

			if #var_14_8.rewards > 2 then
				var_14_9 = CCSprite:create("res/ui/activity/silkshop/scdcb_jl_d2.png")
			end

			for iter_14_1 = 1, #var_14_8.rewards do
				local var_14_10 = CCSprite:create("res/ui/silk/market/scpm_samll_view_icon.png")
				local var_14_11 = CCSprite:create("res/ui/activity/betray/cc_view_bg.png")

				var_14_11:setPosition(ccp(var_14_10:getContentSize().width / 2, 12))
				var_14_11:setScale(0.7)
				var_14_10:addChild(var_14_11, 1)

				local var_14_12 = CCLabelTTF:create(var_14_8.rewards[iter_14_1].num, "Thonburi", 20)

				var_14_12:setPosition(ccp(var_14_10:getContentSize().width / 2, 12))
				var_14_10:addChild(var_14_12, 2)

				local var_14_13 = CCSprite:create(var_0_2[var_14_8.rewards[iter_14_1].type].pic)

				var_14_13:setScale(var_0_2[var_14_8.rewards[iter_14_1].type].scale)
				var_14_13:setPosition(ccp(var_14_10:getContentSize().width / 2, var_14_10:getContentSize().height / 2 + 3))
				var_14_10:addChild(var_14_13, 0)
				var_14_10:setPosition(ccp(53 + 90 * (iter_14_1 - 1), 50))
				var_14_9:addChild(var_14_10)
			end

			arg_13_0.view.widgets.tip_node:removeChildByTag(101, true)
			arg_13_0.view.widgets.tip_node:addChild(var_14_9, 100, 101)

			if arg_13_0.view.widgets["CircleBg" .. arg_14_1] then
				local var_14_14, var_14_15 = arg_13_0.view.widgets["CircleBg" .. arg_14_1]:getPosition()

				if #var_14_8.rewards > 2 then
					var_14_9:setPosition(ccp(var_14_14 - 120, var_14_15 - 80))
				else
					var_14_9:setPosition(ccp(var_14_14, var_14_15 - 80))
				end
			end
		end
	end

	if arg_13_1 then
		if arg_13_0.data.yesterday then
			for iter_13_0, iter_13_1 in pairs(arg_13_0.data.yesterday) do
				if iter_13_1.received ~= iter_13_1.reached then
					var_13_0(arg_13_0.data.yesterday, arg_13_1)

					return
				end
			end
		end

		var_13_0(arg_13_0.data.today, arg_13_1)

		return
	end

	if arg_13_0.data.freeStatus == 0 then
		var_13_0(arg_13_0.data.freeRewards, 0)

		return
	end

	if arg_13_0.data.yesterday then
		for iter_13_2, iter_13_3 in pairs(arg_13_0.data.yesterday) do
			if iter_13_3.received ~= iter_13_3.reached then
				var_13_0(arg_13_0.data.yesterday, iter_13_2)

				return
			end
		end
	end

	if arg_13_0.data.today then
		for iter_13_4, iter_13_5 in pairs(arg_13_0.data.today) do
			if iter_13_5.reached == 0 then
				var_13_0(arg_13_0.data.today, iter_13_4)

				return
			end
		end

		var_13_0(arg_13_0.data.today, #arg_13_0.data.today)
	end
end

return var_0_1
