local var_0_0 = require("res/native/offset").get("layer.resource.silkSell")
local var_0_1 = tool.hexToRgb("#ECDEA7")
local var_0_2 = ccc3(0, 180, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = colorQuality[0]
local var_0_7 = class("silkSell", function()
	return createBaseLayer()
end)

var_0_7.layout = {
	y = 0,
	name = "Scene",
	type = "node",
	x = 0,
	children = {
		{
			name = "panel",
			type = "sprite9",
			preferedSize = CCSizeMake(916, 532),
			middleRect = CCRectMake(10, 10, 70, 70),
			x = visibleSize.width / 2,
			y = visibleSize.height / 2 - 30,
			pic = {
				path = "res/ui/common/panel/comm_view.png"
			},
			children = {
				{
					y = 532,
					type = "sprite",
					x = 458,
					anchorPoint = ccp(0.5, 1),
					pic = {
						path = "res/ui/silk/market/scsp_bk.png"
					}
				},
				{
					y = 2,
					type = "sprite",
					x = 458,
					anchorPoint = ccp(0.5, 0),
					pic = {
						path = "res/ui/silk/market/scpm_bg.jpg"
					}
				},
				{
					visible = false,
					name = "no_sell",
					type = "sprite9",
					y = 360,
					x = 458,
					preferedSize = CCSizeMake(900, 120),
					middleRect = CCRectMake(100, 20, 232, 15),
					pic = {
						path = "res/ui/world/league/jm_tit_bg.png"
					},
					children = {
						{
							y = 60,
							x = 450,
							type = "sprite",
							pic = {
								path = "res/ui/silk/market/scsp_word_dqwsjsc.png"
							}
						}
					}
				},
				{
					name = "btn_sell",
					h = 75,
					type = "button",
					w = 258,
					y = 40,
					x = 230,
					normal = {
						frame = true,
						path = "btn4_gre_a.png"
					},
					touched = {
						frame = true,
						path = "btn4_gre_c.png"
					},
					disable = {
						frame = true,
						path = "btn4_gre_g.png"
					},
					children = {
						{
							fontSize = 30,
							y = 38,
							type = "label",
							x = 129,
							textId = 122154,
							color = var_0_1
						}
					}
				},
				{
					y = 120,
					type = "sprite",
					x = 230,
					pic = {
						path = "res/ui/silk/market/scpm_kdh_d.png"
					},
					children = {
						{
							y = 44,
							type = "label",
							x = 124,
							textId = 122138,
							color = var_0_1,
							fontSize = 25 + (var_0_0.cellLabelSz or 0)
						}
					}
				},
				{
					y = 120,
					type = "sprite",
					x = 100,
					pic = {
						path = "res/ui/silk/market/scpm_samll_view_icon.png"
					},
					children = {
						{
							name = "btn_add",
							h = 51,
							type = "button",
							w = 51,
							y = 22,
							x = -21,
							normal = {
								path = "res/ui/common/button/btn_add.png"
							},
							touched = {
								path = "res/ui/common/button/btn_add_c.png"
							},
							disable = {
								path = "res/ui/common/button/btn_add_g.png"
							}
						},
						{
							name = "btn_reduce",
							h = 51,
							type = "button",
							w = 51,
							y = 22,
							x = 99,
							normal = {
								path = "res/ui/common/button/btn_reduce.png"
							},
							touched = {
								path = "res/ui/common/button/btn_reduce_c.png"
							},
							disable = {
								path = "res/ui/common/button/btn_reduce_g.png"
							}
						},
						{
							y = 39,
							x = 39,
							type = "sprite",
							pic = {
								path = "res/ui/world/world_silk.jpg"
							}
						},
						{
							y = 15,
							name = "bg_num1",
							type = "sprite",
							x = 39,
							pic = {
								path = "res/ui/silk/market/scpm_word_d.png"
							}
						},
						{
							fontSize = 20,
							name = "silk",
							y = 15,
							type = "label",
							width = 100,
							height = 0,
							x = 39
						}
					}
				},
				{
					y = 120,
					type = "sprite",
					x = 360,
					pic = {
						path = "res/ui/silk/market/scpm_samll_view_icon.png"
					},
					children = {
						{
							y = 47,
							x = 39,
							type = "sprite",
							pic = {
								frame = true,
								path = "res_icon_19.png"
							}
						},
						{
							y = 15,
							name = "bg_num2",
							type = "sprite",
							x = 39,
							pic = {
								path = "res/ui/silk/market/scpm_word_d.png"
							}
						},
						{
							fontSize = 20,
							name = "gold",
							y = 15,
							type = "label",
							x = 39,
							color = var_0_4
						}
					}
				},
				{
					y = 190,
					name = "bg_info",
					type = "sprite",
					x = 230,
					pic = {
						path = "res/ui/silk/market/scpm_word_d.png"
					}
				},
				{
					name = "lbl_info",
					y = 190,
					type = "label",
					x = 230,
					color = var_0_1,
					fontSize = 25 + (var_0_0.infoFntSize or 0)
				},
				{
					y = 140,
					type = "sprite",
					x = 690,
					pic = {
						path = "res/ui/silk/market/scsp_word_bg.png"
					},
					children = {
						{
							y = 38,
							x = 40,
							type = "sprite",
							pic = {
								path = "res/ui/task/get_icon_silk.png"
							}
						},
						{
							name = "num_silk",
							y = 38,
							type = "label",
							x = 75,
							color = var_0_4,
							fontSize = 35 + (var_0_0.sellSilkFntSize or 0),
							anchorPoint = ccp(0, 0.5)
						},
						{
							w = 522,
							name = "btn_tip",
							h = 150,
							type = "button",
							y = 38,
							x = 260,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							}
						}
					}
				},
				{
					y = 50,
					type = "sprite",
					x = 690,
					pic = {
						path = "res/ui/silk/market/scsp_word_bg.png"
					},
					children = {
						{
							y = 38,
							x = 40,
							type = "sprite",
							pic = {
								path = "res/ui/silk/market/sc_word_jue.png"
							}
						},
						{
							name = "num_silk_juexing",
							y = 38,
							type = "label",
							x = 75,
							color = var_0_4,
							fontSize = 35 + (var_0_0.sellSilkFntSize or 0),
							anchorPoint = ccp(0, 0.5)
						},
						{
							w = 522,
							name = "btn_tip_juexing",
							h = 150,
							type = "button",
							y = 38,
							x = 260,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							}
						}
					}
				}
			}
		}
	}
}
var_0_7.layout_item = {
	y = 0,
	name = "bg",
	type = "sprite",
	x = 0,
	pic = {
		path = "res/ui/silk/market/scpm_samll_view2.png"
	},
	children = {
		{
			type = "node",
			name = "node_gold",
			y = 0,
			visible = false,
			x = 0,
			children = {
				{
					y = 70,
					name = "icon_gold",
					type = "sprite",
					x = 120,
					pic = {
						frame = true,
						path = "res_icon_19.png"
					}
				},
				{
					fontSize = 25,
					name = "num_gold",
					y = 70,
					type = "label",
					x = 190,
					color = var_0_4
				},
				{
					x = 170,
					name = "btn_gold",
					h = 75,
					type = "button",
					w = 258,
					y = 32,
					scale = 0.6,
					normal = {
						frame = true,
						path = "btn4_gre_a.png"
					},
					touched = {
						frame = true,
						path = "btn4_gre_c.png"
					}
				}
			}
		},
		{
			type = "node",
			name = "node_redeem",
			y = 0,
			visible = false,
			x = 0,
			children = {
				{
					x = 170,
					name = "btn_redeem",
					h = 75,
					type = "button",
					w = 258,
					y = 32,
					scale = 0.6,
					normal = {
						frame = true,
						path = "btn4_yel_a.png"
					},
					touched = {
						frame = true,
						path = "btn4_yel_c.png"
					}
				},
				{
					x = 120,
					name = "icon_silk",
					y = 70,
					type = "sprite",
					scale = 0.8,
					pic = {
						path = "res/ui/task/get_icon_silk.png"
					}
				},
				{
					fontSize = 25,
					name = "num_silk",
					y = 70,
					type = "label",
					x = 190
				}
			}
		},
		{
			y = 53,
			name = "bg_icon",
			type = "sprite",
			x = 52,
			pic = {
				path = "res/ui/silk/market/scpm_samll_view_icon.png"
			},
			children = {
				{
					x = 39,
					name = "icon",
					y = 39,
					type = "sprite",
					scale = 0.8,
					pic = {
						path = "res/ui/common/playerHead/playerHead_icon_0.png"
					}
				},
				{
					y = 76,
					name = "bar",
					type = "sprite",
					x = 39,
					anchorPoint = ccp(0.5, 1),
					pic = {
						path = "res/ui/silk/market/bar.png"
					}
				}
			}
		},
		{
			fontSize = 25,
			name = "txt_btn",
			y = 32,
			type = "label",
			x = 170,
			color = var_0_1
		},
		{
			fontSize = 25,
			name = "info",
			y = 115,
			type = "label",
			x = 130,
			color = var_0_1
		}
	}
}
var_0_7.tipFrame = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(0.5, 1),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			height = 0,
			name = "tipMsg",
			type = "label",
			style = "label_warlock",
			width = 220,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_1
		}
	}
}

function var_0_7.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getSilkMarketInfo)
end

function var_0_7.onSellSilk(arg_4_0)
	local function var_4_0(arg_5_0)
		arg_4_0:refresh()
		arg_4_0:showEffectTxt("res/ui/silk/market/scsp_word_cg_sj.png", 1)
	end

	cmgr.sendRequest(var_4_0, actions.sellSilk, user.silkSell_basenum)
end

function var_0_7.onRedeemSilk(arg_6_0, arg_6_1)
	local function var_6_0(arg_7_0)
		arg_6_0:showEffectTxt("res/ui/silk/market/scsp_word_cg_hs.png", arg_6_1)
	end

	local var_6_1 = arg_6_0.info.sellList[arg_6_1].vid

	cmgr.sendRequest(var_6_0, actions.redeemSilk, var_6_1)
end

function var_0_7.onRecvSilkGold(arg_8_0, arg_8_1)
	local function var_8_0(arg_9_0)
		arg_8_0:showEffectTxt("res/ui/silk/market/scsp_word_cg_lq.png", arg_8_1)

		local var_9_0 = {}
		local var_9_1 = {}

		var_9_1.id = 19
		var_9_1.value = arg_9_0.action.data.gold

		table.insert(var_9_0, var_9_1)
		globalAction_gotResource(var_9_0)
	end

	local var_8_1 = arg_8_0.info.sellList[arg_8_1].vid

	cmgr.sendRequest(var_8_0, actions.recvSilkGold, var_8_1)
end

function var_0_7.showList(arg_10_0)
	if arg_10_0.itemNode then
		arg_10_0.itemNode:removeAllChildrenWithCleanup(true)
	else
		arg_10_0.itemNode = CCNode:create()

		arg_10_0.view.widgets.panel:addChild(arg_10_0.itemNode, 100)
	end

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.info.sellList) do
		local var_10_0 = 170 + (iter_10_0 - 1) % 3 * 288
		local var_10_1 = iter_10_0 <= 3 and 452 or 307
		local var_10_2 = {}

		uiutil.initWidgets(var_10_2, arg_10_0.layout_item)
		var_10_2.widgets.bg:setPosition(ccp(var_10_0, var_10_1))
		arg_10_0.itemNode:addChild(var_10_2.widgets.bg)

		if iter_10_1.state == 0 then
			var_10_2.widgets.info:setString(language.get(122153))
			var_10_2.widgets.num_silk:setString(iter_10_1.num)
			var_10_2.widgets.num_silk:setColor(colorQuality[iter_10_1.quality])
			var_10_2.widgets.txt_btn:setString(language.get(122155))
			var_10_2.widgets.bar:setColor(colorQuality[iter_10_1.quality])
			var_10_2.widgets.btn_redeem:addHandleOfControlEvent(function()
				var_10_2.widgets.btn_redeem:setEnabled(false)
				arg_10_0:onRedeemSilk(iter_10_0)
			end, CCControlEventTouchUpInside)
			var_10_2.widgets.node_redeem:setVisible(true)
		end

		if iter_10_1.state == 1 then
			var_10_2.widgets.info:setString(iter_10_1.buyerName)
			var_10_2.widgets.num_gold:setString(iter_10_1.gold)
			var_10_2.widgets.txt_btn:setString(language.get(20005))
			var_10_2.widgets.icon:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerHead/playerHead_icon_%s.png", iter_10_1.buyerPic)):displayFrame())
			var_10_2.widgets.bar:setColor(colorQuality[iter_10_1.quality])
			var_10_2.widgets.btn_gold:addHandleOfControlEvent(function()
				var_10_2.widgets.btn_gold:setEnabled(false)
				arg_10_0:onRecvSilkGold(iter_10_0)
			end, CCControlEventTouchUpInside)
			var_10_2.widgets.node_gold:setVisible(true)
		end
	end
end

function var_0_7.showEffectTxt(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = 170 + (arg_13_2 - 1) % 3 * 288
	local var_13_1 = arg_13_2 <= 3 and 452 or 307
	local var_13_2 = CCSprite:create(arg_13_1)

	var_13_2:setPosition(ccp(var_13_0, var_13_1))
	arg_13_0.view.widgets.panel:addChild(var_13_2, 200)

	local var_13_3 = CCArray:create()

	var_13_3:addObject(CCMoveBy:create(0.3, ccp(0, 30)))
	var_13_3:addObject(CCDelayTime:create(0.4))
	var_13_3:addObject(CCCallFuncN:create(function()
		arg_13_0:refresh()
	end))
	var_13_3:addObject(CCFadeOut:create(0.2))
	var_13_3:addObject(CCCallFuncN:create(function()
		var_13_2:removeFromParentAndCleanup(true)
	end))

	local var_13_4 = CCSequence:create(var_13_3)

	var_13_2:runAction(var_13_4)
end

function var_0_7.showPanel(arg_16_0, arg_16_1)
	arg_16_0.info = arg_16_1

	arg_16_0.view.widgets.num_silk:setString(language.get(122156, arg_16_1.totalSilkNum))
	arg_16_0.view.widgets.lbl_info:setString(language.get(122145, arg_16_1.maxSellNum))
	arg_16_0.view.widgets.num_silk_juexing:setString(language.get(122158, arg_16_1.evokeSilk))

	user.silkSell_basenum = user.silkSell_basenum or arg_16_1.silkMultiply

	local var_16_0 = arg_16_1.totalSilkNum + arg_16_1.evokeSilk >= arg_16_1.silkMultiply

	if var_16_0 then
		arg_16_0.view.widgets.silk:setColor(ccc3(255, 255, 255))
		arg_16_0.view.widgets.silk:setString(user.silkSell_basenum)
		arg_16_0.view.widgets.gold:setString(user.silkSell_basenum * arg_16_1.goldPerSilk)
	else
		arg_16_0.view.widgets.silk:setColor(ccc3(255, 0, 0))
		arg_16_0.view.widgets.silk:setString(language.get(122146))
		arg_16_0.view.widgets.gold:setString("")
	end

	arg_16_0.view.widgets.btn_reduce:setEnabled(var_16_0)
	arg_16_0.view.widgets.btn_add:setEnabled(var_16_0)
	arg_16_0.view.widgets.btn_sell:setEnabled(var_16_0)
	arg_16_0:showList()
	arg_16_0.view.widgets.no_sell:setVisible(#arg_16_1.sellList == 0)
end

function var_0_7.ctor(arg_17_0, arg_17_1, arg_17_2)
	arg_17_0.view = {}

	uiutil.initWidgets(arg_17_0.view, arg_17_0.layout)
	arg_17_0:addChild(arg_17_0.view.widgets.Scene)

	if arg_17_1 then
		arg_17_1:addChild(arg_17_0)
	end

	arg_17_0.view.widgets.bg_num1:setScaleX(0.6)
	arg_17_0.view.widgets.bg_num1:setScaleY(0.8)
	arg_17_0.view.widgets.bg_num2:setScaleX(0.6)
	arg_17_0.view.widgets.bg_num2:setScaleY(0.8)
	arg_17_0.view.widgets.bg_info:setScaleX(2.5)
	arg_17_0.view.widgets.btn_sell:addHandleOfControlEvent(function()
		arg_17_0:onSellSilk()
	end, CCControlEventTouchUpInside)
	arg_17_0.view.widgets.btn_add:addHandleOfControlEvent(function()
		if user.silkSell_basenum < arg_17_0.info.maxSellNum then
			user.silkSell_basenum = user.silkSell_basenum + arg_17_0.info.silkMultiply

			arg_17_0:showPanel(arg_17_0.info)
		end
	end, CCControlEventTouchUpInside)
	arg_17_0.view.widgets.btn_reduce:addHandleOfControlEvent(function()
		if user.silkSell_basenum > arg_17_0.info.silkMultiply then
			user.silkSell_basenum = user.silkSell_basenum - arg_17_0.info.silkMultiply

			arg_17_0:showPanel(arg_17_0.info)
		end
	end, CCControlEventTouchUpInside)

	local var_17_0 = arg_17_0.view.widgets.btn_tip

	var_17_0:addHandleOfControlEvent(function()
		log.info("btn_tip: TouchDown")
		arg_17_0:showTip(true, var_17_0)
	end, CCControlEventTouchDown)
	var_17_0:addHandleOfControlEvent(function()
		log.info("btn_tip: TouchUpInside")
		arg_17_0:showTip(false)
	end, CCControlEventTouchUpInside)
	var_17_0:addHandleOfControlEvent(function()
		log.info("btn_tip: TouchUpOutside")
		arg_17_0:showTip(false)
	end, CCControlEventTouchUpOutside)

	local var_17_1 = arg_17_0.view.widgets.btn_tip_juexing

	var_17_1:addHandleOfControlEvent(function()
		log.info("btn_tip_juexing: TouchDown")
		arg_17_0:showTip2(true, var_17_1)
	end, CCControlEventTouchDown)
	var_17_1:addHandleOfControlEvent(function()
		log.info("btn_tip_juexing: TouchUpInside")
		arg_17_0:showTip2(false)
	end, CCControlEventTouchUpInside)
	var_17_1:addHandleOfControlEvent(function()
		log.info("btn_tip_juexing: TouchUpOutside")
		arg_17_0:showTip2(false)
	end, CCControlEventTouchUpOutside)
	arg_17_0:refresh()
end

function var_0_7.showTip(arg_27_0, arg_27_1, arg_27_2)
	if arg_27_0.view.widgets.tipFrame then
		arg_27_0.view.widgets.tipFrame:removeFromParentAndCleanup(true)

		arg_27_0.view.widgets.tipFrame = nil
	end

	if arg_27_1 then
		local var_27_0, var_27_1 = tool.getPositionInScreen(arg_27_2)

		uiutil.initWidgets(arg_27_0.view, arg_27_0.tipFrame)
		arg_27_0:addChild(arg_27_0.view.widgets.tipFrame)
		arg_27_0.view.widgets.tipMsg:setDimensions(CCSizeMake(220, 0))

		local var_27_2 = language.get(122129, arg_27_0.info.silkMax)

		arg_27_0.view.widgets.tipMsg:setString(var_27_2)

		local var_27_3 = arg_27_0.view.widgets.tipMsg:getContentSize().width
		local var_27_4 = arg_27_0.view.widgets.tipMsg:getContentSize().height

		arg_27_0.view.widgets.tipFrame:setPreferredSize(CCSizeMake(var_27_3 + 30, var_27_4 + 30))
		arg_27_0.view.widgets.tipFrame:setPosition(ccp(var_27_0 + 30, var_27_1 - 20))
		arg_27_0.view.widgets.tipMsg:setPosition(ccp(15, 15))
		arg_27_0.view.widgets.tipFrame:setVisible(true)
	end
end

function var_0_7.showTip2(arg_28_0, arg_28_1, arg_28_2)
	if arg_28_0.view.widgets.tipFrame then
		arg_28_0.view.widgets.tipFrame:removeFromParentAndCleanup(true)

		arg_28_0.view.widgets.tipFrame = nil
	end

	if arg_28_1 then
		local var_28_0, var_28_1 = tool.getPositionInScreen(arg_28_2)

		uiutil.initWidgets(arg_28_0.view, arg_28_0.tipFrame)
		arg_28_0:addChild(arg_28_0.view.widgets.tipFrame)
		arg_28_0.view.widgets.tipMsg:setDimensions(CCSizeMake(220, 0))

		local var_28_2 = language.get(122141)

		arg_28_0.view.widgets.tipMsg:setString(var_28_2)

		local var_28_3 = arg_28_0.view.widgets.tipMsg:getContentSize().width
		local var_28_4 = arg_28_0.view.widgets.tipMsg:getContentSize().height

		arg_28_0.view.widgets.tipFrame:setPreferredSize(CCSizeMake(var_28_3 + 30, var_28_4 + 30))
		arg_28_0.view.widgets.tipFrame:setPosition(ccp(var_28_0 + 30, var_28_1 - 20))
		arg_28_0.view.widgets.tipMsg:setPosition(ccp(15, 15))
		arg_28_0.view.widgets.tipFrame:setVisible(true)
	end
end

function var_0_7.onEnter(arg_29_0)
	arg_29_0.refreshRef = handler(arg_29_0, arg_29_0.refresh)

	eventManager.registerEvent("refreshSilkMarket", arg_29_0.refreshRef)
end

function var_0_7.onExit(arg_30_0)
	if user.silkGoodsNotify then
		user.silkGoodsNotify = false

		eventManager.dispatchEvent("refreshActivityNotice")
	end

	eventManager.unregisterEvent("refreshSilkMarket", arg_30_0.refreshRef)
end

return var_0_7
