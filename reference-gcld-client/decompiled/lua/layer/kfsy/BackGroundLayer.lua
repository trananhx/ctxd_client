local var_0_0 = require("res/native/offset").get("layer.kfsy.backgroundLayer")
local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = class("KfsyBackgroundLayer", function()
	return createBaseLayer()
end)

var_0_2.layout = {
	y = 0,
	name = "panel",
	type = "node",
	x = 0,
	children = {
		{
			type = "sprite",
			pic = {
				path = "res/ui/kfsy/kfsy_rk.jpg"
			},
			x = visibleSize.width / 2,
			y = visibleSize.height / 2,
			children = {
				{
					zoomOnTouchDown = true,
					name = "btn_enter",
					type = "button",
					y = 364,
					x = 693,
					normal = {
						path = "res/ui/kfsy/kfsy_djjr.png"
					},
					touched = {
						path = "res/ui/kfsy/kfsy_djjr.png"
					},
					w = var_0_0.djjrBtnWidth or 219,
					h = var_0_0.djjrBtnHeight or 72
				},
				{
					x = 483,
					name = "light_zhaoyun",
					y = 394,
					type = "sprite",
					pic = {
						path = "res/ui/kfsy/zhaoyun/jxsy_zhaoyun_light.png"
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_zhaoyun",
					h = 232,
					type = "button",
					w = 235,
					y = 394,
					x = 483,
					normal = {
						path = "res/ui/kfsy/zhaoyun/jxsy_zhaoyun.png"
					},
					touched = {
						path = "res/ui/kfsy/zhaoyun/jxsy_zhaoyun_light.png"
					}
				},
				{
					x = 448,
					y = 430,
					type = "sprite",
					pic = {
						path = "res/ui/kfsy/lvbu/lvdqj_name_bg.png"
					}
				},
				{
					fontSize = 25,
					y = 435,
					type = "label",
					x = 448,
					textId = 320430,
					color = var_0_1
				},
				{
					x = 548,
					name = "light_npc",
					y = 304,
					type = "sprite",
					pic = {
						path = "res/ui/kfsy/lvbu/dcdqj_dc_light.png"
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_npc",
					h = 159,
					type = "button",
					w = 123,
					y = 304,
					x = 548,
					normal = {
						path = "res/ui/kfsy/lvbu/dcdqj_dc.png"
					},
					touched = {
						path = "res/ui/kfsy/lvbu/dcdqj_dc_light.png"
					}
				},
				{
					x = 543,
					y = 385,
					type = "sprite",
					pic = {
						path = "res/ui/kfsy/lvbu/lvdqj_name_bg.png"
					}
				},
				{
					fontSize = 25,
					y = 390,
					type = "label",
					x = 543,
					textId = 320426,
					color = var_0_1
				},
				{
					y = 354,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/kfsy/jxsy_pb_di.png"
					},
					x = visibleSize.width / 2 + 530 + 125 - platform.getSafeDistance(),
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							name = "progressbar",
							percentage = 0,
							x = 12.5,
							type = "progressbar",
							rotate = -90,
							y = 124,
							pic = {
								frame = false,
								path = "res/ui/kfsy/jxsy_pb.png"
							},
							anchorPoint = ccp(0.5, 0.5),
							progressType = kCCProgressTimerTypeBar
						}
					}
				},
				{
					name = "zuiyiIcon",
					y = 498,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/generalDrink/zjlyx_pb_icon_h.png"
					},
					x = visibleSize.width / 2 + 530 + 125 - platform.getSafeDistance(),
					children = {
						{
							y = 19,
							x = 35,
							scale = 0.9,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/MulNation/wblc_number_di.png"
							}
						},
						{
							fontSize = 18,
							name = "zuiyiState",
							y = 19,
							type = "label",
							style = "label_warlock",
							x = 35,
							textId = -1,
							color = colorQuality[1]
						}
					}
				}
			}
		},
		{
			name = "bg_num",
			type = "sprite9",
			x = 0,
			preferedSize = CCSizeMake(400, 100),
			middleRect = CCRectMake(0, 31, 837, 1),
			y = visibleSize.height - 10,
			anchorPoint = ccp(0.5, 1),
			pic = {
				path = "res/ui/kfsy/kfsy_di.png"
			}
		},
		{
			x = 0,
			type = "node",
			y = visibleSize.height - 10,
			children = {
				{
					name = "icon1",
					x = 25,
					type = "sprite",
					y = -30,
					scale = 0.5,
					pic = {
						path = "res/ui/kfsy/lvbu/lvdqj_qj.png"
					}
				},
				{
					name = "icon2",
					x = 25,
					type = "sprite",
					y = -70,
					scale = 0.5,
					pic = {
						path = "res/ui/kfsy/zhaoyun/jxsy_icon_vipqj.png"
					}
				},
				{
					type = "sprite",
					name = "icon3",
					visible = false,
					x = 25,
					y = -110,
					scale = 0.5,
					pic = {
						path = "res/ui/activity/generalDrink/jxj_2.png"
					}
				},
				{
					type = "sprite",
					name = "icon4",
					visible = false,
					x = 25,
					y = -150,
					scale = 0.4,
					pic = {
						path = "res/ui/kfsy/kfsy_jh.png"
					}
				},
				{
					text = "x%s",
					name = "num1",
					fontSize = 22,
					type = "label",
					x = 50,
					y = -30,
					color = var_0_1,
					anchorPoint = ccp(0, 0.5)
				},
				{
					text = "x%s",
					name = "num2",
					fontSize = 22,
					type = "label",
					x = 50,
					y = -70,
					color = var_0_1,
					anchorPoint = ccp(0, 0.5)
				},
				{
					fontSize = 22,
					name = "num3",
					y = -110,
					type = "label",
					visible = false,
					x = 50,
					text = language.get(320423, 0),
					color = var_0_1,
					anchorPoint = ccp(0, 0.5)
				},
				{
					fontSize = 25,
					name = "num4",
					y = -150,
					type = "label",
					visible = false,
					x = 50,
					text = language.get(320402, 0),
					color = var_0_1,
					anchorPoint = ccp(0, 0.5)
				},
				{
					name = "btnExchangeCard",
					h = 43,
					type = "button",
					w = 137,
					y = -30,
					x = 160,
					normal = {
						frame = false,
						path = "res/ui/common/button/public_btn_green70.png"
					},
					touched = {
						frame = false,
						path = "res/ui/common/button/public_btn_green70_c.png"
					},
					children = {
						{
							fontSize = 18,
							style = "label_warlock",
							y = 21.5,
							type = "label",
							x = 68.5,
							textId = 320429
						}
					}
				},
				{
					name = "btnExchangeVipCard",
					h = 43,
					type = "button",
					w = 137,
					y = -75,
					x = 160,
					normal = {
						frame = false,
						path = "res/ui/common/button/public_btn_green70.png"
					},
					touched = {
						frame = false,
						path = "res/ui/common/button/public_btn_green70_c.png"
					},
					children = {
						{
							fontSize = 18,
							style = "label_warlock",
							y = 21.5,
							type = "label",
							x = 68.5,
							textId = 320429
						}
					}
				},
				{
					y = -10,
					x = 286,
					type = "sprite",
					pic = {
						path = "res/ui/kfsy/zhaoyun/jxsy_qjsl_di.png"
					},
					children = {
						{
							name = "leftLabelOne",
							stype = "label_warlock",
							type = "label",
							y = 15,
							x = 15,
							fontSize = 18,
							text = language.get(102058, 0),
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					y = -56,
					x = 286,
					type = "sprite",
					pic = {
						path = "res/ui/kfsy/zhaoyun/jxsy_qjsl_di.png"
					},
					children = {
						{
							name = "leftLabelTwo",
							stype = "label_warlock",
							type = "label",
							y = 15,
							x = 15,
							fontSize = 18,
							text = language.get(102058, 0),
							anchorPoint = ccp(0, 0.5)
						}
					}
				}
			}
		}
	}
}

function var_0_2.ctor(arg_2_0)
	arg_2_0.view = {}

	uiutil.initWidgets(arg_2_0.view, arg_2_0.layout)
	arg_2_0:addChild(arg_2_0.view.widgets.panel)

	for iter_2_0 = 1, 4 do
		local var_2_0 = -30 - 40 * (iter_2_0 - 1)

		arg_2_0.view.widgets["icon" .. iter_2_0]:setPosition(ccp(25, var_2_0))
		arg_2_0.view.widgets["num" .. iter_2_0]:setPosition(ccp(50, var_2_0))
	end

	local function var_2_1(arg_3_0)
		arg_3_0:stopAllActions()
		arg_3_0:setOpacity(0)
		arg_3_0:setVisible(true)

		local var_3_0 = CCArray:create()

		var_3_0:addObject(CCFadeIn:create(0.5))
		var_3_0:addObject(CCFadeOut:create(0.5))

		local var_3_1 = CCSequence:create(var_3_0)

		arg_3_0:runAction(CCRepeatForever:create(var_3_1))
	end

	var_2_1(arg_2_0.view.widgets.light_npc)
	arg_2_0.view.widgets.btn_npc:addHandleOfControlEvent(function()
		log.info("btn_npc: TouchDown")
		arg_2_0.view.widgets.light_npc:setVisible(false)
	end, CCControlEventTouchDown)
	arg_2_0.view.widgets.btn_npc:addHandleOfControlEvent(function()
		log.info("btn_npc: TouchUpInside")
		var_2_1(arg_2_0.view.widgets.light_npc)
		eventManager.dispatchEvent("setLvbuLayerVisible", true)
	end, CCControlEventTouchUpInside)
	arg_2_0.view.widgets.btn_npc:addHandleOfControlEvent(function()
		log.info("btn_npc: TouchUpOutside")
		var_2_1(arg_2_0.view.widgets.light_npc)
	end, CCControlEventTouchUpOutside)
	var_2_1(arg_2_0.view.widgets.light_zhaoyun)
	arg_2_0.view.widgets.btn_zhaoyun:addHandleOfControlEvent(function()
		arg_2_0.view.widgets.light_zhaoyun:setVisible(false)
	end, CCControlEventTouchDown)
	arg_2_0.view.widgets.btn_zhaoyun:addHandleOfControlEvent(function()
		var_2_1(arg_2_0.view.widgets.light_zhaoyun)
		eventManager.dispatchEvent("showZhaoYunLayer", true, kfsyInfo.feastInfo.response.action.data)
	end, CCControlEventTouchUpInside)
	arg_2_0.view.widgets.btn_zhaoyun:addHandleOfControlEvent(function()
		var_2_1(arg_2_0.view.widgets.light_zhaoyun)
	end, CCControlEventTouchUpOutside)
	arg_2_0.view.widgets.btn_enter:addHandleOfControlEvent(function()
		log.info("btn_enter")
		buyAndRuleUI.show(2)
	end, CCControlEventTouchUpInside)
	arg_2_0.view.widgets.btnExchangeCard:addHandleOfControlEvent(function()
		local function var_11_0(arg_12_0)
			if arg_12_0.action.state == 1 then
				local var_12_0 = string.match(arg_2_0.view.widgets.num1:getString(), "%d+")
				local var_12_1 = arg_12_0.action.data.zhaoYunCardNum

				arg_2_0.view.widgets.num1:setString(string.format("x%s", var_12_0 + var_12_1))

				local var_12_2 = string.match(arg_2_0.view.widgets.leftLabelOne:getString(), "%d+")

				arg_2_0.view.widgets.leftLabelOne:setString(language.get(102058, var_12_2 - var_12_1))
			end
		end

		cmgr.sendRequest(var_11_0, actions.kfsyExchangeCard, 1, false)
	end, CCControlEventTouchUpInside)
	arg_2_0.view.widgets.btnExchangeVipCard:addHandleOfControlEvent(function()
		local function var_13_0(arg_14_0)
			if arg_14_0.action.state == 1 then
				local var_14_0 = string.match(arg_2_0.view.widgets.num2:getString(), "%d+")
				local var_14_1 = arg_14_0.action.data.zhaoYunCardNum

				arg_2_0.view.widgets.num2:setString(string.format("x%s", var_14_0 + var_14_1))

				local var_14_2 = string.match(arg_2_0.view.widgets.leftLabelTwo:getString(), "%d+")

				arg_2_0.view.widgets.leftLabelTwo:setString(language.get(102058, var_14_2 - var_14_1))
			end
		end

		cmgr.sendRequest(var_13_0, actions.kfsyExchangeCard, 1, true)
	end, CCControlEventTouchUpInside)
	arg_2_0:registerScriptTouchHandler(handler(arg_2_0, arg_2_0.onTouch), false, true)
	arg_2_0:setTouchEnabled(true)
end

function var_0_2.updateInfo(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1.action.data
	local var_15_1 = {}

	if var_15_0 then
		if var_15_0.specialCard then
			table.insert(var_15_1, 1)
			arg_15_0.view.widgets.num1:setString(string.format("x%s", var_15_0.specialCard))
		end

		if var_15_0.goldSpecialCard then
			table.insert(var_15_1, 2)
			arg_15_0.view.widgets.num2:setString(string.format("x%s", var_15_0.goldSpecialCard))
		end

		arg_15_0.view.widgets.leftLabelOne:setString(language.get(102058, var_15_0.remainExchangeTimes))
		arg_15_0.view.widgets.leftLabelTwo:setString(language.get(102058, var_15_0.remainVipExchangeTimes))

		local var_15_2 = type(var_15_0.feastDrinkNum) == "number"

		arg_15_0.view.widgets.num3:setVisible(var_15_2)
		arg_15_0.view.widgets.icon3:setVisible(var_15_2)

		if var_15_2 then
			table.insert(var_15_1, 3)
			arg_15_0.view.widgets.num3:setString(string.format("x%s", var_15_0.feastDrinkNum))
		end

		local var_15_3 = var_15_0.isTop16 == true and type(var_15_0.drink) == "number"

		arg_15_0.view.widgets.num4:setVisible(var_15_3)
		arg_15_0.view.widgets.icon4:setVisible(var_15_3)

		if var_15_3 then
			table.insert(var_15_1, 4)
			arg_15_0.view.widgets.num4:setString(language.get(320402, var_15_0.drink))
		end

		for iter_15_0, iter_15_1 in ipairs(var_15_1) do
			local var_15_4 = -30 - 40 * (iter_15_1 - 1)

			arg_15_0.view.widgets["icon" .. iter_15_0]:setPositionY(var_15_4)
			arg_15_0.view.widgets["num" .. iter_15_0]:setPositionY(var_15_4)
		end

		arg_15_0.view.widgets.bg_num:setPreferredSize(CCSizeMake(400, 60 + 40 * (#var_15_1 - 1)))
		arg_15_0.view.widgets.progressbar:setPercentage(var_15_0.zuiyi / var_15_0.maxZuiyi * 100)
		arg_15_0.view.widgets.zuiyiState:setString(string.format("%d/%d", var_15_0.zuiyi, var_15_0.maxZuiyi))

		if var_15_0.zuiyi >= var_15_0.maxZuiyi then
			arg_15_0:addBuffLight()
		end
	end

	local var_15_5 = var_15_0.lvbuCardReward ~= nil and var_15_0.lvbuCardInfo ~= nil

	arg_15_0.view.widgets.btn_npc:setVisible(var_15_5)
end

function var_0_2.addBuffLight(arg_16_0)
	if not arg_16_0.view.widgets.zuiyiIcon:getChildByTag(1) then
		local var_16_0 = rmgr.getAnimation("sdtj_itemLight")
		local var_16_1 = CCAnimation:createWithSpriteFrames(var_16_0, 0.08)
		local var_16_2 = CCAnimate:create(var_16_1)
		local var_16_3 = CCSprite:create()

		var_16_3:runAction(CCRepeatForever:create(var_16_2))
		var_16_3:setPosition(ccp(35, 35))
		var_16_3:setScale(0.8)
		arg_16_0.view.widgets.zuiyiIcon:addChild(var_16_3, 0, 1)
	end
end

function var_0_2.onTouch(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	if arg_17_1 == CCTOUCHBEGAN then
		if tool.checkIfTouch2(arg_17_0.view.widgets.zuiyiIcon, arg_17_2, arg_17_3) then
			arg_17_0:addZuiyiTips(arg_17_2, arg_17_3)
		end

		return true
	elseif arg_17_1 == CCTOUCHMOVED then
		return true
	elseif arg_17_1 == CCTOUCHENDED then
		arg_17_0:closeZuiyiTips()

		return true
	end
end

function var_0_2.addZuiyiTips(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = {
		name = "tip",
		type = "sprite9Tips",
		x = arg_18_1 - 170,
		y = arg_18_2,
		pic = {
			frame = false,
			path = "res/ui/weapon/tips_di.png"
		},
		middleRect = CCRectMake(6, 6, 68, 68),
		content = {
			{
				fontSize = 18,
				style = "label_warlock",
				type = "label",
				text = language.get(320442, (function()
					if kfsyInfo.feastInfo.response.action.data.zuiyi >= kfsyInfo.feastInfo.response.action.data.maxZuiyi then
						return language.get(320443)
					else
						return language.get(320444)
					end
				end)()),
				color = colorQuality[4],
				halign = kCCTextAlignmentLeft
			},
			{
				fontSize = 18,
				style = "label_warlock",
				type = "label",
				text = language.get(320445),
				color = colorQuality[3],
				halign = kCCTextAlignmentLeft
			},
			{
				fontSize = 18,
				style = "label_warlock",
				type = "label",
				width = 200,
				height = 0,
				text = language.get(320446),
				color = colorText[10003],
				halign = kCCTextAlignmentLeft
			},
			{
				fontSize = 18,
				style = "label_warlock",
				type = "label",
				text = language.get(320447),
				color = colorQuality[3],
				halign = kCCTextAlignmentLeft
			},
			{
				fontSize = 18,
				style = "label_warlock",
				type = "label",
				width = 200,
				height = 0,
				text = language.get(320448),
				color = colorText[10003],
				halign = kCCTextAlignmentLeft
			}
		}
	}
	local var_18_1 = {}

	uiutil.initWidgets(var_18_1, var_18_0)
	arg_18_0.view.widgets.panel:addChild(var_18_1.widgets.tip, 0, 300)
end

function var_0_2.closeZuiyiTips(arg_20_0)
	arg_20_0.view.widgets.panel:removeChildByTag(300, true)
end

function var_0_2.onEnter(arg_21_0)
	return
end

function var_0_2.onExit(arg_22_0)
	return
end

return var_0_2
