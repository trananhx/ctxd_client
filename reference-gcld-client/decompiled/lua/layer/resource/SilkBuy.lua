local var_0_0 = tool.hexToRgb("#ECDEA7")
local var_0_1 = ccc3(0, 180, 0)
local var_0_2 = colorQuality[5]
local var_0_3 = colorQuality[4]
local var_0_4 = colorQuality[2]
local var_0_5 = colorQuality[0]
local var_0_6 = class("silkBuy", function()
	return createBaseLayer()
end)

var_0_6.layout = {
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
					type = "sprite9",
					x = 458,
					preferedSize = CCSizeMake(917, 440),
					middleRect = CCRectMake(50, 50, 817, 212),
					anchorPoint = ccp(0.5, 1),
					pic = {
						path = "res/ui/silk/market/scsp_bk.png"
					}
				},
				{
					visible = false,
					name = "no_sell",
					type = "sprite9",
					y = 290,
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
								path = "res/ui/silk/market/scsp_word_dqwrcs.png"
							}
						}
					}
				},
				{
					x = 50,
					name = "node1",
					y = 45,
					type = "node",
					scale = 0.8,
					zorder = 200,
					children = {
						{
							type = "button",
							name = "btn_card1",
							h = 120,
							visible = false,
							w = 114,
							normal = {
								path = "res/ui/silk/market/scsp_yhj_3b.png"
							},
							touched = {
								path = "res/ui/silk/market/scsp_yhj_3b.png"
							}
						},
						{
							name = "card1",
							type = "sprite",
							pic = {
								path = "res/ui/silk/market/scsp_yhj_3b.png"
							}
						},
						{
							type = "sprite",
							name = "light1",
							visible = false,
							pic = {
								path = "res/ui/silk/market/scsp_yhj_light.png"
							}
						},
						{
							fontSize = 30,
							name = "num1",
							y = -20,
							type = "label",
							x = 43,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					x = 180,
					name = "node2",
					y = 45,
					type = "node",
					scale = 0.8,
					zorder = 200,
					children = {
						{
							type = "button",
							name = "btn_card2",
							h = 120,
							visible = false,
							w = 114,
							normal = {
								path = "res/ui/silk/market/scsp_yhj_sb.png"
							},
							touched = {
								path = "res/ui/silk/market/scsp_yhj_sb.png"
							}
						},
						{
							name = "card2",
							type = "sprite",
							pic = {
								path = "res/ui/silk/market/scsp_yhj_sb.png"
							}
						},
						{
							type = "sprite",
							name = "light2",
							visible = false,
							pic = {
								path = "res/ui/silk/market/scsp_yhj_light.png"
							}
						},
						{
							fontSize = 30,
							name = "num2",
							y = -20,
							type = "label",
							x = 43,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					x = 310,
					name = "node3",
					y = 45,
					type = "node",
					scale = 0.8,
					zorder = 200,
					children = {
						{
							type = "button",
							name = "btn_card3",
							h = 120,
							visible = false,
							w = 114,
							normal = {
								path = "res/ui/silk/market/scsp_yhj_dh.png"
							},
							touched = {
								path = "res/ui/silk/market/scsp_yhj_dh.png"
							}
						},
						{
							name = "card3",
							type = "sprite",
							pic = {
								path = "res/ui/silk/market/scsp_yhj_dh.png"
							}
						},
						{
							type = "sprite",
							name = "light3",
							visible = false,
							pic = {
								path = "res/ui/silk/market/scsp_yhj_light.png"
							}
						},
						{
							fontSize = 30,
							name = "num3",
							y = -20,
							type = "label",
							x = 43,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					y = 532,
					type = "sprite9",
					x = 457.9953,
					preferedSize = CCSizeMake(917, 440),
					middleRect = CCRectMake(50, 50, 817, 212),
					anchorPoint = ccp(0.5, 1),
					pic = {
						path = "res/ui/silk/market/scsp_bk.png"
					}
				},
				{
					y = 45,
					type = "sprite9",
					x = 490,
					preferedSize = CCSizeMake(180, 56),
					middleRect = CCRectMake(60, 1, 257, 54),
					pic = {
						path = "res/ui/silk/market/scpm_sc_long.png"
					},
					children = {
						{
							y = 28,
							x = 28,
							type = "sprite",
							scale = 0.8,
							pic = {
								path = "res/ui/silk/market/sc_word_jue.png"
							}
						},
						{
							fontSize = 25,
							name = "juexingSilk",
							y = 28,
							type = "label",
							x = 54,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					y = 45,
					type = "sprite9",
					x = 660,
					preferedSize = CCSizeMake(180, 56),
					middleRect = CCRectMake(60, 1, 257, 54),
					pic = {
						path = "res/ui/silk/market/scpm_sc_long.png"
					},
					children = {
						{
							y = 28,
							x = 28,
							type = "sprite",
							scale = 0.8,
							pic = {
								path = "res/ui/task/get_icon_silk.png"
							}
						},
						{
							fontSize = 25,
							name = "silk",
							y = 28,
							type = "label",
							x = 54,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					y = 45,
					type = "sprite9",
					x = 830,
					preferedSize = CCSizeMake(180, 56),
					middleRect = CCRectMake(60, 1, 257, 54),
					pic = {
						path = "res/ui/silk/market/scpm_sc_long.png"
					},
					children = {
						{
							y = 28,
							x = 28,
							type = "sprite",
							pic = {
								frame = true,
								path = "res_icon_19.png"
							}
						},
						{
							fontSize = 25,
							name = "gold",
							y = 28,
							type = "label",
							x = 54,
							color = var_0_3,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					name = "btn_tips_evoke_silk",
					h = 80,
					type = "button",
					w = 180,
					zorder = 200,
					y = 45,
					x = 490,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					}
				},
				{
					name = "btn_tips_silk",
					h = 80,
					type = "button",
					w = 180,
					zorder = 200,
					y = 45,
					x = 660,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					}
				},
				{
					name = "btn_tips_gold",
					h = 80,
					type = "button",
					w = 180,
					zorder = 200,
					y = 45,
					x = 830,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					}
				},
				{
					visible = false,
					name = "arrow",
					y = 45,
					type = "sprite",
					x = 400,
					zorder = 200,
					pic = {
						path = "res/ui/guide/jiantou-zuo.png"
					},
					children = {
						{
							fontSize = 20,
							style = "label_warlock",
							y = 30,
							type = "label",
							x = 60,
							textId = 122157,
							color = var_0_3
						}
					}
				},
				{
					name = "btn_mask",
					h = 100,
					type = "button",
					w = 916,
					zorder = 100,
					y = 50,
					x = 458,
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
var_0_6.layout_item = {
	y = -5,
	name = "bg",
	type = "sprite",
	x = 0,
	anchorPoint = ccp(0.5, 0),
	pic = {
		path = "res/ui/silk/market/scpm_samll_view2.png"
	},
	children = {
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
						path = "res/ui/common/playerHead/playerHead_icon_1.png"
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
			name = "name",
			y = 115,
			type = "label",
			x = 130,
			color = var_0_0
		},
		{
			y = 70,
			x = 120,
			type = "sprite",
			scale = 0.8,
			pic = {
				path = "res/ui/task/get_icon_silk.png"
			}
		},
		{
			fontSize = 25,
			name = "silk",
			y = 70,
			type = "label",
			x = 190
		},
		{
			x = 170,
			name = "btn_buy",
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
			y = 32,
			x = 170,
			type = "node",
			children = {
				{
					anchorPointX = 0.5,
					name = "richLine",
					type = "richLine",
					content = {
						{
							type = "label",
							fontSize = 25,
							textId = 101018,
							color = var_0_0
						},
						{
							type = "sprite",
							pic = {
								frame = true,
								path = "res_icon_19_small.png"
							}
						},
						{
							name = "gold",
							fontSize = 20,
							type = "label",
							color = var_0_3
						}
					}
				}
			}
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
			height = 0,
			name = "tipMsg",
			type = "label",
			style = "label_warlock",
			width = 220,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_0
		}
	}
}

function var_0_6.refresh(arg_2_0)
	local var_2_0 = {}
	local var_2_1 = 1
	local var_2_2 = 10

	local function var_2_3(arg_3_0)
		local var_3_0 = arg_3_0.action.data

		for iter_3_0, iter_3_1 in pairs(var_3_0.goodsList) do
			table.insert(var_2_0, iter_3_1)
		end

		if var_3_0.currPage >= var_3_0.totalPage or var_3_0.currPage >= var_2_2 then
			var_3_0.goodsList = var_2_0

			arg_2_0:showPanel(var_3_0)
		else
			var_2_1 = var_2_1 + 1

			cmgr.sendRequest(var_2_3, actions.getSilkMarketDetailInfo, var_2_1)
		end
	end

	cmgr.sendRequest(var_2_3, actions.getSilkMarketDetailInfo, var_2_1)
end

function var_0_6.onBuySilk(arg_4_0, arg_4_1, arg_4_2)
	local function var_4_0(arg_5_0)
		local var_5_0 = arg_5_0.action.data

		arg_4_0:showEffectTxt("res/ui/silk/market/scsp_word_cg_gm.png", arg_4_2)

		local var_5_1 = {}
		local var_5_2 = {}

		var_5_2.id = 55
		var_5_2.value = var_5_0.silkNum

		table.insert(var_5_1, var_5_2)

		if var_5_0.bonusSilkNum and var_5_0.bonusSilkNum > 0 then
			local var_5_3 = {}

			var_5_3.id = 10025
			var_5_3.value = var_5_0.bonusSilkNum

			table.insert(var_5_1, var_5_3)
		end

		globalAction_gotResource(var_5_1)
	end

	local var_4_1 = arg_4_0.info.goodsList[arg_4_1]

	messageBox.showChargeWin("", language.get(122133, var_4_1.goldPrice, var_4_1.silkNum), "buySilkGold", function()
		cmgr.sendRequest(var_4_0, actions.buySilk, var_4_1.vid, arg_4_0.tokenId)
	end)
end

function var_0_6.onBtnCardTap(arg_7_0, arg_7_1)
	arg_7_0.tokenId = arg_7_0.tokenId or 0

	local var_7_0 = arg_7_0.view.widgets["light" .. arg_7_0.tokenId]

	if var_7_0 then
		var_7_0:setVisible(false)
	end

	if arg_7_0.tokenId == arg_7_1 then
		arg_7_0.tokenId = 0
	else
		arg_7_0.view.widgets["light" .. arg_7_1]:setVisible(true)

		arg_7_0.tokenId = arg_7_1
	end
end

function var_0_6.createList(arg_8_0)
	local function var_8_0(arg_9_0, arg_9_1)
		log.info("cell touched at : ", arg_9_1:getIdx())
	end

	local function var_8_1(arg_10_0, arg_10_1)
		return 150, 916
	end

	local function var_8_2(arg_11_0, arg_11_1)
		local var_11_0 = arg_11_0:dequeueCell()

		if var_11_0 then
			var_11_0:removeAllChildrenWithCleanup(true)
		else
			var_11_0 = CCTableViewCell:new()
		end

		for iter_11_0 = 1, 3 do
			local var_11_1 = 3 * arg_11_1 + iter_11_0
			local var_11_2 = arg_8_0.info.goodsList[var_11_1]

			if var_11_2 then
				local var_11_3 = 170 + (iter_11_0 - 1) % 3 * 288
				local var_11_4 = {}

				uiutil.initWidgets(var_11_4, arg_8_0.layout_item)
				var_11_4.widgets.bg:setPosition(ccp(var_11_3, 0))
				var_11_0:addChild(var_11_4.widgets.bg)
				var_11_4.widgets.name:setString(var_11_2.sellerName)
				var_11_4.widgets.icon:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerHead/playerHead_icon_%s.png", var_11_2.sellerPic)):displayFrame())
				var_11_4.widgets.silk:setString(var_11_2.silkNum)
				var_11_4.widgets.silk:setColor(colorQuality[var_11_2.quality])
				var_11_4.widgets.bar:setColor(colorQuality[var_11_2.quality])
				var_11_4.widgets.gold:setString(var_11_2.goldPrice)
				var_11_4.widgets.richLine:reorder()
				var_11_4.widgets.btn_buy:addHandleOfControlEvent(function()
					log.info("btn_buy" .. var_11_1)
					arg_8_0:onBuySilk(var_11_1, var_11_4.widgets.bg)
				end, CCControlEventTouchUpInside)
			end
		end

		return var_11_0
	end

	local function var_8_3()
		local var_13_0 = arg_8_0.info.goodsList

		if var_13_0 and #var_13_0 > 0 then
			return math.ceil(#var_13_0 / 3)
		else
			return 0
		end
	end

	local var_8_4 = CCTableView:create(CCSizeMake(916, 420))

	var_8_4:setPosition(ccp(0, 102))
	var_8_4:setDirection(kCCScrollViewDirectionVertical)
	var_8_4:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_8_0.view.widgets.panel:addChild(var_8_4)

	if arg_8_0.silkList then
		arg_8_0.silkList:removeFromParentAndCleanup(true)
	end

	arg_8_0.silkList = var_8_4

	var_8_4:registerScriptHandler(var_8_0, CCTableView.kTableCellTouched)
	var_8_4:registerScriptHandler(var_8_1, CCTableView.kTableCellSizeForIndex)
	var_8_4:registerScriptHandler(var_8_2, CCTableView.kTableCellSizeAtIndex)
	var_8_4:registerScriptHandler(var_8_3, CCTableView.kNumberOfCellsInTableView)
	var_8_4:reloadData()
end

function var_0_6.showEffectTxt(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0, var_14_1 = tool.getPositionInScreen(arg_14_2)
	local var_14_2 = CCSprite:create(arg_14_1)

	var_14_2:setPosition(ccp(var_14_0, var_14_1 + 72))
	arg_14_0:addChild(var_14_2, 200)

	local var_14_3 = CCArray:create()

	var_14_3:addObject(CCMoveBy:create(0.3, ccp(0, 30)))
	var_14_3:addObject(CCDelayTime:create(0.4))
	var_14_3:addObject(CCCallFuncN:create(function()
		arg_14_0:refresh()
	end))
	var_14_3:addObject(CCFadeOut:create(0.2))
	var_14_3:addObject(CCCallFuncN:create(function()
		var_14_2:removeFromParentAndCleanup(true)
	end))

	local var_14_4 = CCSequence:create(var_14_3)

	var_14_2:runAction(var_14_4)
end

function var_0_6.showPanel(arg_17_0, arg_17_1)
	arg_17_0.info = arg_17_1
	arg_17_0.currPage = arg_17_1.currPage
	arg_17_0.tokenId = arg_17_0.tokenId or 0

	local var_17_0 = false

	for iter_17_0, iter_17_1 in ipairs(arg_17_1.tokenNums) do
		arg_17_0.view.widgets["card" .. iter_17_0]:removeAllChildrenWithCleanup(true)

		local var_17_1 = iter_17_1 > 0

		arg_17_0.view.widgets["btn_card" .. iter_17_0]:setVisible(var_17_1)

		if var_17_1 then
			arg_17_0.view.widgets["num" .. iter_17_0]:setString(language.get(135039, iter_17_1))
			arg_17_0.view.widgets["num" .. iter_17_0]:setColor(var_0_3)

			if not var_17_0 then
				var_17_0 = true
			end
		else
			tool.spriteToGray(arg_17_0.view.widgets["card" .. iter_17_0])
			arg_17_0.view.widgets["num" .. iter_17_0]:setString(language.get(122143))
			arg_17_0.view.widgets["num" .. iter_17_0]:setColor(var_0_5)

			if iter_17_0 == arg_17_0.tokenId then
				arg_17_0.tokenId = 0

				arg_17_0.view.widgets["light" .. iter_17_0]:setVisible(false)
			end
		end
	end

	arg_17_0.view.widgets.juexingSilk:setString(arg_17_1.evokeSilk or 0)
	arg_17_0.view.widgets.juexingSilk:setColor(var_0_0)
	arg_17_0.view.widgets.silk:setString(arg_17_1.totalSilkNum)
	arg_17_0.view.widgets.silk:setColor(arg_17_1.totalSilkNum >= arg_17_1.silkMax and var_0_2 or var_0_0)
	arg_17_0.view.widgets.gold:setString(arg_17_1.uGold)
	arg_17_0:createList()
	arg_17_0.view.widgets.no_sell:setVisible(#arg_17_1.goodsList == 0)

	if not arg_17_0.showArrow and var_17_0 then
		arg_17_0.showArrow = true

		local var_17_2 = CCMoveBy:create(0.6, ccp(30, 0))
		local var_17_3 = CCEaseOut:create(var_17_2, 1)
		local var_17_4 = CCMoveBy:create(0.6, ccp(-30, 0))
		local var_17_5 = CCEaseIn:create(var_17_4, 1)
		local var_17_6 = CCArray:create()

		var_17_6:addObject(var_17_3)
		var_17_6:addObject(var_17_5)

		local var_17_7 = CCSequence:create(var_17_6)
		local var_17_8 = CCRepeat:create(var_17_7, 3)
		local var_17_9 = CCArray:create()

		var_17_9:addObject(CCShow:create())
		var_17_9:addObject(var_17_8)
		var_17_9:addObject(CCHide:create())

		local var_17_10 = CCSequence:create(var_17_9)

		arg_17_0.view.widgets.arrow:runAction(var_17_10)
	end
end

function var_0_6.showTip(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	if arg_18_2 then
		arg_18_2:stopAllActions()
	end

	if arg_18_0.view.widgets.tipFrame then
		arg_18_0.view.widgets.tipFrame:removeFromParentAndCleanup(true)

		arg_18_0.view.widgets.tipFrame = nil
	end

	if arg_18_1 then
		local var_18_0, var_18_1 = tool.getPositionInScreen(arg_18_2)
		local var_18_2
		local var_18_3
		local var_18_4 = var_18_0 + 70
		local var_18_5 = var_18_1 + 20

		uiutil.initWidgets(arg_18_0.view, arg_18_0.tipFrame)
		arg_18_0:addChild(arg_18_0.view.widgets.tipFrame)
		arg_18_0.view.widgets.tipMsg:setDimensions(CCSizeMake(220, 0))

		local var_18_6 = ""

		if arg_18_3 <= 3 then
			local var_18_7 = {
				122147,
				122148,
				122149
			}

			var_18_6 = language.get(var_18_7[arg_18_3])
			var_18_4 = var_18_0
			var_18_5 = var_18_1 + 20

			arg_18_0.view.widgets.tipFrame:setAnchorPoint(ccp(0, 0))
		elseif arg_18_3 == 4 then
			var_18_6 = language.get(122129, arg_18_0.info.silkMax)
		elseif arg_18_3 == 5 then
			var_18_6 = language.get(122128)
		elseif arg_18_3 == 6 then
			var_18_6 = language.get(122141)
		end

		arg_18_0.view.widgets.tipMsg:setString(var_18_6)

		local var_18_8 = arg_18_0.view.widgets.tipMsg:getContentSize().width
		local var_18_9 = arg_18_0.view.widgets.tipMsg:getContentSize().height

		arg_18_0.view.widgets.tipFrame:setPreferredSize(CCSizeMake(var_18_8 + 30, var_18_9 + 30))
		arg_18_0.view.widgets.tipFrame:setPosition(ccp(var_18_4, var_18_5))
		arg_18_0.view.widgets.tipMsg:setPosition(ccp(15, 15))
		arg_18_0.view.widgets.tipFrame:setVisible(true)
	end
end

function var_0_6.ctor(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0.view = {}

	uiutil.initWidgets(arg_19_0.view, arg_19_0.layout)
	arg_19_0:addChild(arg_19_0.view.widgets.Scene)

	if arg_19_1 then
		arg_19_1:addChild(arg_19_0)
	end

	for iter_19_0 = 1, 3 do
		local var_19_0 = CCArray:create()

		var_19_0:addObject(CCFadeIn:create(0.3))
		var_19_0:addObject(CCFadeOut:create(0.5))

		local var_19_1 = CCSequence:create(var_19_0)

		arg_19_0.view.widgets["light" .. iter_19_0]:runAction(CCRepeatForever:create(var_19_1))
	end

	local var_19_2 = {
		"btn_card1",
		"btn_card2",
		"btn_card3",
		"btn_tips_silk",
		"btn_tips_gold",
		"btn_tips_evoke_silk"
	}

	for iter_19_1 = 1, 6 do
		local var_19_3 = arg_19_0.view.widgets[var_19_2[iter_19_1]]

		var_19_3:addHandleOfControlEvent(function()
			log.info("btn%s: TouchDown", iter_19_1)

			if iter_19_1 <= 3 then
				schedule(var_19_3, function()
					arg_19_0:showTip(true, var_19_3, iter_19_1)
				end, 0.1)
			else
				arg_19_0:showTip(true, var_19_3, iter_19_1)
			end
		end, CCControlEventTouchDown)
		var_19_3:addHandleOfControlEvent(function()
			log.info("btn%s: TouchUpInside", iter_19_1)
			arg_19_0:showTip(false, var_19_3)

			if iter_19_1 <= 3 then
				arg_19_0:onBtnCardTap(iter_19_1)
			end
		end, CCControlEventTouchUpInside)
		var_19_3:addHandleOfControlEvent(function()
			log.info("btn%s: TouchUpOutside", iter_19_1)
			arg_19_0:showTip(false, var_19_3)
		end, CCControlEventTouchUpOutside)
	end

	arg_19_0:refresh()
end

function var_0_6.onEnter(arg_24_0)
	arg_24_0.refreshRef = handler(arg_24_0, arg_24_0.refresh)

	eventManager.registerEvent("refreshsilkBuy", arg_24_0.refreshRef)
end

function var_0_6.onExit(arg_25_0)
	eventManager.unregisterEvent("refreshsilkBuy", arg_25_0.refreshRef)
end

return var_0_6
