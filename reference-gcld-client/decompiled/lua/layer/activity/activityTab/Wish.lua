local var_0_0 = {
	[4] = {
		id = 4,
		txt = 131007,
		pic = "res_icon_4.png",
		frame = true
	},
	[5] = {
		id = 6,
		txt = 135263,
		pic = "res_icon_6.png",
		frame = true
	},
	[21] = {
		id = 7,
		txt = 135266,
		pic = "res_icon_7.png",
		frame = true
	},
	[100] = {
		id = 100,
		txt = 135265,
		pic = "res_icon_100.png",
		frame = true
	},
	[101] = {
		id = 15,
		txt = 135264,
		pic = "xcxy_icon_xl.png",
		frame = true
	},
	[116] = {
		id = 55,
		txt = 135286,
		pic = "res/ui/task/get_icon_silk.png",
		scale = 0.8
	},
	[126] = {
		id = 10030,
		txt = 135287,
		pic = "res/ui/resource/silkroad/sczldj_jn.png",
		scale = 0.8
	},
	[119] = {
		id = 10033,
		txt = 135289,
		pic = "fubenDituBaiLianGang.png",
		frame = true
	},
	[113] = {
		id = 2003,
		txt = 135288,
		pic = "fubenDituJinLian.png",
		frame = true
	},
	[214] = {
		id = 214,
		scale = 0.5,
		frame = true,
		txt = 154114,
		pic = "liuguangyufu.jpg"
	},
	[216] = {
		id = 216,
		txt = 154115,
		pic = "res/ui/weapon/machine/zc_yt_icon.png"
	}
}
local var_0_1 = {
	{
		npc = "chengong",
		scale = 1.2,
		des = 135290
	},
	{
		npc = "chengyu",
		scale = 1.2,
		des = 135291
	},
	{
		npc = "fazheng",
		scale = 1.2,
		des = 135292
	},
	{
		npc = "zhangzhao",
		scale = 1.2,
		des = 135293
	},
	{
		npc = "lusu",
		scale = 1.2,
		des = 135294
	},
	{
		npc = "wenguan",
		des = 135295
	},
	{
		npc = "wenguan",
		des = 135296
	},
	{
		npc = "wenguan",
		des = 135297
	},
	{
		npc = "wenguan",
		des = 135298
	},
	{
		npc = "chengyu",
		des = 200632
	},
	{
		npc = "simazhao",
		des = 200633
	}
}

local function var_0_2(arg_1_0)
	local function var_1_0(arg_2_0)
		if arg_2_0 > math.floor(arg_2_0) then
			if arg_2_0 < 10 then
				arg_2_0 = string.format("%.1f", arg_2_0)
			else
				arg_2_0 = math.floor(arg_2_0)
			end
		end

		return arg_2_0
	end

	local var_1_1

	if arg_1_0 < 10000 then
		var_1_1 = tostring(arg_1_0)
	else
		local var_1_2 = arg_1_0 / 10000

		var_1_1 = language.get(75021, var_1_0(var_1_2))
	end

	return var_1_1
end

local var_0_3 = tool.hexToRgb("#D9EDC5")
local var_0_4 = ccc3(0, 255, 0)
local var_0_5 = colorQuality[5]
local var_0_6 = colorQuality[4]
local var_0_7 = 1
local var_0_8 = 3
local var_0_9 = class("Wish", function()
	return createBaseLayer()
end)

var_0_9.layout = {
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
			y = 473,
			x = 458,
			type = "sprite",
			zorder = 100,
			pic = {
				frame = true,
				path = "xcxy_title.png"
			}
		},
		{
			fontSize = 22,
			name = "leftTime",
			scale = 1.5909090909090908,
			type = "label",
			visible = false,
			zorder = 100,
			style = "label_warlock",
			y = 473,
			x = 760,
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_5
		},
		{
			fontSize = 22,
			name = "wishTime",
			type = "label",
			zorder = 100,
			style = "label_warlock",
			y = 473,
			x = 735,
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_6
		},
		{
			y = 0,
			name = "selWishNode",
			type = "node",
			x = 0,
			children = {
				{
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/wish/xcxy_bg1.jpg"
					},
					anchorPoint = ccp(0, 0)
				},
				{
					x = 160,
					name = "npcPic",
					y = 5,
					type = "sprite",
					scale = 1.2,
					pic = {
						frame = false,
						path = "res/ui/common/halfPic/halfPic_wenguan.png"
					},
					anchorPoint = ccp(0.5, 0)
				},
				{
					x = 10,
					y = 415,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/farm/farm_chat_frame.png"
					},
					anchorPoint = ccp(0, 1)
				},
				{
					fontSize = 22,
					name = "msg",
					y = 365,
					type = "label",
					width = 284,
					height = 0,
					style = "label_warlock",
					x = 160,
					anchorPoint = ccp(0.5, 0.5),
					halign = kCCTextAlignmentLeft,
					color = var_0_3
				},
				{
					fontSize = 22,
					style = "label_warlock",
					y = 402,
					type = "label",
					x = 370,
					textId = 135253,
					anchorPoint = ccp(0, 0.5)
				},
				{
					fontSize = 22,
					style = "label_warlock",
					y = 360,
					type = "label",
					x = 400,
					textId = 135251,
					anchorPoint = ccp(0, 0.5),
					color = var_0_3
				},
				{
					y = 50,
					x = 620,
					type = "node",
					children = {
						{
							y = 0,
							name = "btn_wish",
							style = "button_yel4",
							type = "button",
							visible = true,
							scale = 0.66,
							x = 0
						},
						{
							x = -50,
							y = 3,
							type = "sprite",
							pic = {
								frame = true,
								path = "xcxy_btn_hand.png"
							}
						},
						{
							fontSize = 22,
							style = "label_warlock",
							y = 0,
							type = "label",
							x = 20,
							textId = 135254,
							color = var_0_3
						}
					}
				}
			}
		},
		{
			y = 0,
			name = "treeNode",
			type = "node",
			x = 0,
			children = {
				{
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/wish/xcxy_bg2.jpg"
					},
					anchorPoint = ccp(0, 0)
				},
				{
					y = 50,
					name = "btn_wishNode",
					visible = false,
					type = "node",
					x = 458,
					children = {
						{
							y = 0,
							name = "btn_wishGold",
							style = "button_yel4",
							type = "button",
							visible = true,
							scale = 0.66,
							x = 0
						},
						{
							x = -50,
							y = 3,
							type = "sprite",
							pic = {
								frame = true,
								path = "xcxy_btn_hand.png"
							}
						},
						{
							fontSize = 22,
							style = "label_warlock",
							y = 0,
							type = "label",
							x = 20,
							textId = 135255,
							color = var_0_3
						},
						{
							x = 105,
							y = 0,
							type = "sprite",
							pic = {
								frame = true,
								path = "res_icon_19_small.png"
							}
						},
						{
							text = "",
							name = "goldLb",
							y = 0,
							type = "label",
							style = "label_warlock",
							x = 135,
							fontSize = 22,
							color = var_0_6
						},
						{
							fontSize = 22,
							name = "numLb",
							y = 0,
							type = "label",
							style = "label_warlock",
							x = 180,
							anchorPoint = ccp(0, 0.5),
							color = var_0_3
						}
					}
				},
				{
					fontSize = 22,
					name = "info_max",
					y = 50,
					type = "label",
					style = "label_warlock",
					x = 458,
					textId = 135268,
					color = var_0_3
				},
				{
					visible = false,
					name = "info_reward",
					type = "sprite9",
					y = 380,
					x = 460,
					pic = {
						path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
					},
					middleRect = CCRectMake(180, 20, 5, 20),
					preferedSize = CCSizeMake(600, 80),
					children = {
						{
							fontSize = 30,
							style = "label_warlock",
							y = 45,
							type = "label",
							x = 300,
							textId = 135285,
							color = var_0_6
						}
					}
				},
				{
					visible = false,
					name = "info_end",
					type = "sprite9",
					y = 240,
					x = 460,
					pic = {
						path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
					},
					middleRect = CCRectMake(180, 20, 5, 20),
					preferedSize = CCSizeMake(700, 100),
					children = {
						{
							x = 350,
							y = 55,
							type = "sprite",
							pic = {
								path = "res/ui/activity/gemsActivity/new/xsczbs_word_bchdyjs.png"
							}
						},
						{
							y = -40,
							name = "btn_end",
							style = "button_gre2",
							type = "button",
							x = 350
						},
						{
							fontSize = 22,
							style = "label_warlock",
							y = -40,
							type = "label",
							x = 350,
							textId = 390008,
							color = var_0_3
						}
					}
				}
			}
		},
		{
			x = 0,
			name = "mask_sel",
			height = 532,
			type = "layerColor",
			visible = false,
			zorder = 150,
			y = 0,
			width = 915,
			color = ccc4(0, 0, 0, 180),
			children = {
				{
					y = 380,
					x = 460,
					type = "sprite9",
					pic = {
						path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
					},
					middleRect = CCRectMake(180, 20, 5, 20),
					preferedSize = CCSizeMake(600, 80),
					children = {
						{
							fontSize = 30,
							style = "label_warlock",
							y = 45,
							type = "label",
							x = 300,
							textId = 135284,
							color = var_0_6
						}
					}
				},
				{
					y = 50,
					x = 460,
					type = "node",
					children = {
						{
							y = 0,
							name = "btn_wish1",
							style = "button_yel4",
							type = "button",
							visible = true,
							scale = 0.66,
							x = 0
						},
						{
							x = -50,
							y = 3,
							type = "sprite",
							pic = {
								frame = true,
								path = "xcxy_btn_hand.png"
							}
						},
						{
							fontSize = 22,
							style = "label_warlock",
							y = 0,
							type = "label",
							x = 20,
							textId = 135267,
							color = var_0_3
						}
					}
				}
			}
		},
		{
			x = 0,
			name = "mask_reward",
			height = 532,
			type = "layerColor",
			visible = false,
			zorder = 150,
			y = 0,
			width = 915,
			color = ccc4(0, 0, 0, 180),
			children = {
				{
					scale = 1.4,
					y = 240,
					type = "node",
					x = 460,
					children = {
						{
							visible = false,
							name = "btn_reward",
							h = 160,
							type = "button",
							w = 160,
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
									x = 80,
									name = "bag_light",
									y = 80,
									type = "sprite",
									pic = {
										path = "res/ui/threeColorBag/gjn.png"
									}
								},
								{
									x = 78.5,
									y = 76.5,
									type = "sprite",
									pic = {
										path = "res/ui/threeColorBag/daj.PNG"
									}
								}
							}
						},
						{
							x = 6,
							name = "bag_empty",
							y = -33,
							type = "sprite",
							visible = false,
							pic = {
								path = "res/ui/threeColorBag/empty.PNG"
							}
						}
					}
				}
			}
		}
	}
}
var_0_9.tipFrame = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(0, 1),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			height = 0,
			name = "tipMsg",
			type = "label",
			style = "label_warlock",
			width = 400,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_3
		}
	}
}

function var_0_9.updateWishSelected(arg_4_0)
	if not (arg_4_0.info.status ~= 0) then
		local var_4_0 = arg_4_0.unselected[var_0_7].id
		local var_4_1 = var_0_1[var_4_0]

		arg_4_0.view.widgets.npcPic:setDisplayFrame(CCSprite:create("res/ui/common/halfPic/halfPic_" .. var_4_1.npc .. ".png"):displayFrame())
		arg_4_0.view.widgets.npcPic:setScale(var_4_1.scale or 1)
		arg_4_0.view.widgets.msg:setString(language.get(var_4_1.des))
	end
end

function var_0_9.addBtnPaper(arg_5_0, arg_5_1)
	if arg_5_0.btnPaperNode then
		arg_5_0.btnPaperNode:removeAllChildrenWithCleanup(true)
	else
		arg_5_0.btnPaperNode = CCNode:create()

		arg_5_0.view.widgets.panel:addChild(arg_5_0.btnPaperNode, 200)
	end

	local var_5_0 = 1
	local var_5_1 = 140

	if #arg_5_0.unselected == 5 then
		var_5_0 = 0.75
		var_5_1 = var_5_1 * var_5_0
	end

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.unselected) do
		local var_5_2 = {
			h = 260,
			type = "button",
			name = "btn_paper" .. iter_5_0,
			scale = var_5_0,
			normal = {
				path = "res/default.png"
			},
			touched = {
				path = "res/default.png"
			},
			x = arg_5_1.x + var_5_1 * (iter_5_0 - 1) - 0.5 * var_5_1 * (#arg_5_0.unselected - 1),
			y = arg_5_1.y,
			w = var_5_1,
			children = {
				{
					x = 70,
					y = 130,
					type = "sprite",
					name = "wish" .. iter_5_0,
					pic = {
						frame = true,
						path = string.format("xcxy_ywz%02d.png", iter_5_1.id)
					}
				},
				{
					x = 70,
					y = 130,
					type = "sprite",
					visible = false,
					name = "light" .. iter_5_0,
					pic = {
						frame = true,
						path = string.format("xcxy_ywz%02d_h.png", iter_5_1.id)
					}
				}
			}
		}

		uiutil.initWidgets(arg_5_0.view, var_5_2)
		arg_5_0.btnPaperNode:addChild(arg_5_0.view.widgets["btn_paper" .. iter_5_0])

		local var_5_3 = arg_5_0.view.widgets["btn_paper" .. iter_5_0]

		var_5_3:addHandleOfControlEvent(function()
			log.info("btn_wish%s TouchDown", iter_5_0)
			arg_5_0:showTip(true, iter_5_0)
			arg_5_0.view.widgets["light" .. iter_5_0]:setVisible(true)

			if var_0_7 ~= iter_5_0 then
				arg_5_0.view.widgets["light" .. var_0_7]:setVisible(false)

				var_0_7 = iter_5_0

				arg_5_0:updateWishSelected()
			end
		end, CCControlEventTouchDown)
		var_5_3:addHandleOfControlEvent(function()
			log.info("btn_wish%s TouchUpInside", iter_5_0)
			arg_5_0:showTip(false)
		end, CCControlEventTouchUpInside)
		var_5_3:addHandleOfControlEvent(function()
			log.info("btn_wish%s TouchUpOutside", iter_5_0)
			arg_5_0:showTip(false)
		end, CCControlEventTouchUpOutside)
	end

	var_0_7 = 1

	arg_5_0.view.widgets.light1:setVisible(true)
	arg_5_0:updateWishSelected()
end

function var_0_9.addTreePaper(arg_9_0)
	if arg_9_0.treePaperNode then
		arg_9_0.treePaperNode:removeAllChildrenWithCleanup(true)
	else
		arg_9_0.treePaperNode = CCNode:create()

		arg_9_0.view.widgets.treeNode:addChild(arg_9_0.treePaperNode)
	end

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.selected) do
		local var_9_0 = iter_9_1.rewards[1]
		local var_9_1 = {
			visible = false,
			name = "node",
			y = 240,
			type = "node",
			x = 460 + 160 * (iter_9_0 - 2),
			children = {
				{
					x = 0,
					name = "paper",
					y = 0,
					type = "sprite",
					scale = 0.6,
					pic = {
						frame = true,
						path = string.format("xcxy_ywz%02d.png", iter_9_1.id)
					}
				},
				{
					scale = 0.6,
					y = -100,
					type = "node",
					x = -6,
					children = {
						{
							zoomOnTouchDown = true,
							name = "btn_bag",
							h = 173,
							type = "button",
							w = 174,
							y = 0,
							x = 0,
							normal = {
								path = "res/ui/threeColorBag/gjn.png"
							},
							touched = {
								path = "res/ui/threeColorBag/gjn.png"
							}
						}
					}
				},
				{
					x = 0,
					name = "icon",
					y = -100,
					type = "sprite",
					pic = {
						path = var_0_0[var_9_0.type].pic,
						frame = var_0_0[var_9_0.type].frame
					},
					scale = var_0_0[var_9_0.type].scale or 1
				},
				{
					fontSize = 22,
					name = "num",
					type = "label",
					style = "label_warlock",
					y = -120,
					x = 0,
					text = var_0_2(var_9_0.value),
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_6
				}
			}
		}
		local var_9_2 = {}

		uiutil.initWidgets(var_9_2, var_9_1)
		arg_9_0.treePaperNode:addChild(var_9_2.widgets.node)
		var_9_2.widgets.btn_bag:addHandleOfControlEvent(function()
			log.info("btn_bag%s", iter_9_0)
			arg_9_0.view.widgets.mask_reward:setVisible(true)
			arg_9_0.view.widgets.btn_reward:setVisible(true)
			arg_9_0.view.widgets.bag_empty:setVisible(false)

			var_0_7 = iter_9_0
		end, CCControlEventTouchUpInside)

		local var_9_3 = arg_9_0.info.cd == 0

		var_9_2.widgets.btn_bag:setEnabled(var_9_3)
		var_9_2.widgets.icon:setVisible(not var_9_3)
		var_9_2.widgets.num:setVisible(not var_9_3)
		var_9_2.widgets.node:setVisible(iter_9_1.received == 0 or not var_9_3)

		if not var_9_3 then
			local var_9_4 = CCArray:create()

			var_9_4:addObject(CCFadeIn:create(0.6))
			var_9_4:addObject(CCDelayTime:create(0.6))
			var_9_4:addObject(CCFadeOut:create(0.6))

			local var_9_5 = CCSequence:create(var_9_4)
			local var_9_6 = CCRepeatForever:create(var_9_5)

			var_9_2.widgets.icon:runAction(tolua.cast(var_9_6:copy(), "CCAction"))
			var_9_2.widgets.num:runActionCopy(var_9_6)
		end
	end
end

function var_0_9.refresh(arg_11_0)
	local function var_11_0(arg_12_0)
		arg_11_0:showPanel(arg_12_0.action.data)
	end

	cmgr.sendRequest(var_11_0, actions.getWishActivity)
end

function var_0_9.onGetWishReward(arg_13_0)
	local var_13_0 = arg_13_0.unselected[var_0_7].id

	log.info("onGetWishReward", var_13_0)

	local function var_13_1(arg_14_0)
		arg_13_0:refresh()
	end

	cmgr.sendRequest(var_13_1, actions.getWishReward, var_13_0)
end

function var_0_9.onGetWishBigGift(arg_15_0)
	local function var_15_0(arg_16_0)
		arg_15_0.view.widgets.btn_reward:setVisible(false)
		arg_15_0.view.widgets.bag_empty:setVisible(true)

		local var_16_0 = CCArray:create()

		var_16_0:addObject(CCDelayTime:create(1.5))
		var_16_0:addObject(CCCallFuncN:create(function()
			arg_15_0.view.widgets.mask_reward:setVisible(false)
			arg_15_0.view.widgets.btn_reward:setVisible(false)
			arg_15_0.view.widgets.bag_empty:setVisible(false)
			arg_15_0:refresh()
		end))

		local var_16_1 = CCSequence:create(var_16_0)

		arg_15_0.view.widgets.mask_reward:runAction(var_16_1)

		local var_16_2 = arg_16_0.action.data.rewards
		local var_16_3 = {}

		for iter_16_0 = 1, #var_16_2 do
			local var_16_4 = var_16_2[iter_16_0]
			local var_16_5 = {
				id = var_0_0[var_16_4.pic or var_16_4.type].id,
				value = var_16_4.value
			}

			table.insert(var_16_3, var_16_5)
		end

		globalAction_gotResource(var_16_3)
	end

	local var_15_1 = arg_15_0.selected[var_0_7].id

	cmgr.sendRequest(var_15_0, actions.getWishBigGift, var_15_1)
end

function var_0_9.addCenser(arg_18_0, arg_18_1)
	if arg_18_0.censerNode then
		arg_18_0.censerNode:removeAllChildrenWithCleanup(true)
	else
		arg_18_0.censerNode = CCNode:create()

		arg_18_0.view.widgets.panel:addChild(arg_18_0.censerNode, 200)
	end

	local var_18_0 = CCSprite:createWithSpriteFrameName("xianglu_0001.png")

	arg_18_0.censerNode:addChild(var_18_0, 100)
	var_18_0:setPosition(ccp(458, 280))
	var_18_0:setScale(1.5)

	local var_18_1 = 0
	local var_18_2 = 10
	local var_18_3
	local var_18_4
	local var_18_5
	local var_18_6 = {
		var_18_3,
		var_18_4,
		var_18_5
	}

	local function var_18_7(arg_19_0, arg_19_1)
		local var_19_0 = {
			{
				p1 = ccp(71, 101),
				p2 = ccp(74, 82)
			},
			{
				p1 = ccp(85, 106),
				p2 = ccp(85, 84)
			},
			{
				p1 = ccp(101, 101),
				p2 = ccp(98, 84)
			}
		}
		local var_19_1 = var_19_0[arg_19_0].p1
		local var_19_2 = var_19_0[arg_19_0].p2
		local var_19_3 = var_19_1.x + (var_19_2.x - var_19_1.x) * arg_19_1 / var_18_2
		local var_19_4 = var_19_1.y + (var_19_2.y - var_19_1.y) * arg_19_1 / var_18_2

		return ccp(var_19_3, var_19_4)
	end

	for iter_18_0 = 1, 3 do
		local var_18_8 = CCSprite:createWithSpriteFrameName("xcxy_xianglu_fire.png")

		var_18_0:addChild(var_18_8)
		var_18_8:setScale(0.5)

		var_18_6[iter_18_0] = var_18_8

		var_18_8:setPosition(var_18_7(iter_18_0, 0))

		local var_18_9 = CCArray:create()

		var_18_9:addObject(CCFadeIn:create(0.3))
		var_18_9:addObject(CCFadeOut:create(0.3))

		local var_18_10 = CCSequence:create(var_18_9)
		local var_18_11 = CCRepeatForever:create(var_18_10)

		var_18_8:runAction(var_18_11)
	end

	local var_18_12 = CCSprite:create("res/ui/guide/jiantou-you.png")

	arg_18_0.censerNode:addChild(var_18_12, 100)
	var_18_12:setPosition(ccp(320, 200))

	local var_18_13 = CCStrokeLabelTTF:create(language.get(135258), "Thonburi-Bold", 20, 2)

	var_18_13:setColor(var_0_6)
	var_18_12:addChild(var_18_13)
	var_18_13:setPosition(ccp(30, 30))

	local var_18_14 = CCMoveBy:create(0.6, ccp(30, 0))
	local var_18_15 = CCEaseOut:create(var_18_14, 1)
	local var_18_16 = CCMoveBy:create(0.6, ccp(-30, 0))
	local var_18_17 = CCEaseIn:create(var_18_16, 1)
	local var_18_18 = CCArray:create()

	var_18_18:addObject(var_18_15)
	var_18_18:addObject(var_18_17)

	local var_18_19 = CCSequence:create(var_18_18)
	local var_18_20 = CCRepeatForever:create(tolua.cast(var_18_19, "CCActionInterval"))

	var_18_12:runAction(var_18_20)

	local var_18_21 = CCLayerColor:create(ccc4(0, 0, 0, 180), 915, 532)

	var_18_21:registerScriptTouchHandler(function(arg_20_0, arg_20_1, arg_20_2)
		if arg_20_0 == CCTOUCHBEGAN then
			log.info("CCTOUCH_BEGAN", arg_20_1, arg_20_2)

			if arg_20_1 > 0 and arg_20_1 < 915 and arg_20_2 > 0 and arg_20_2 < 532 then
				var_18_1 = var_18_1 + 1

				if var_18_1 >= var_18_2 then
					arg_18_0.censerNode:removeAllChildrenWithCleanup(true)

					if arg_18_1 then
						arg_18_1()
					end
				else
					for iter_20_0 = 1, 3 do
						var_18_6[iter_20_0]:setPosition(var_18_7(iter_20_0, var_18_1))
					end

					if var_18_1 >= 1 and var_18_1 <= 10 then
						var_18_0:setDisplayFrame(tool.spriteFrameByName(string.format("xianglu_%04d.png", var_18_1 + 1)))
					end
				end

				return true
			end

			return false
		elseif arg_20_0 == CCTOUCHMOVED then
			log.info("CCTOUCH_MOVED", arg_20_1, arg_20_2)

			return true
		elseif arg_20_0 == CCTOUCHENDED then
			log.info("CCTOUCH_ENDED", arg_20_1, arg_20_2)

			return true
		end
	end, false, true)
	var_18_21:setTouchEnabled(true)
	arg_18_0.censerNode:addChild(var_18_21)
end

function var_0_9.showTip(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_0.view.widgets.tipFrame then
		arg_21_0.view.widgets.tipFrame:removeFromParentAndCleanup(true)

		arg_21_0.view.widgets.tipFrame = nil
	end

	if arg_21_1 then
		local var_21_0, var_21_1 = tool.getPositionInScreen(arg_21_0.view.widgets["btn_paper" .. arg_21_2])

		uiutil.initWidgets(arg_21_0.view, arg_21_0.tipFrame)
		arg_21_0:addChild(arg_21_0.view.widgets.tipFrame)
		arg_21_0.view.widgets.tipMsg:setDimensions(CCSizeMake(100, 0))

		local var_21_2 = ""
		local var_21_3 = arg_21_0.unselected[arg_21_2].rewards[1]
		local var_21_4 = language.get(var_0_0[var_21_3.type].txt, var_0_2(var_21_3.value))

		arg_21_0.view.widgets.tipMsg:setString(var_21_4)

		local var_21_5 = arg_21_0.view.widgets.tipMsg:getContentSize().width
		local var_21_6 = arg_21_0.view.widgets.tipMsg:getContentSize().height

		arg_21_0.view.widgets.tipFrame:setPreferredSize(CCSizeMake(var_21_5 + 30, var_21_6 + 30))
		arg_21_0.view.widgets.tipFrame:setPosition(ccp(var_21_0 - 40, var_21_1))
		arg_21_0.view.widgets.tipMsg:setPosition(ccp(15, 15))
		arg_21_0.view.widgets.tipFrame:setVisible(true)
	end
end

function var_0_9.showPanel(arg_22_0, arg_22_1)
	arg_22_0.info = arg_22_1
	arg_22_0.selected = {}
	arg_22_0.unselected = {}
	arg_22_0.received = {}

	if arg_22_0.btnPaperNode then
		arg_22_0.btnPaperNode:removeAllChildrenWithCleanup(true)
	end

	local var_22_0 = arg_22_1.status ~= 0

	if var_22_0 then
		for iter_22_0, iter_22_1 in ipairs(arg_22_1.wishes) do
			if iter_22_1.selected == 1 then
				table.insert(arg_22_0.selected, iter_22_1)

				if iter_22_1.received == 1 then
					table.insert(arg_22_0.received, iter_22_1)
				end
			else
				table.insert(arg_22_0.unselected, iter_22_1)
			end
		end
	else
		arg_22_0.unselected = arg_22_1.wishes

		arg_22_0:addBtnPaper(ccp(620, 215))
	end

	arg_22_0.view.widgets.selWishNode:setVisible(not var_22_0)
	arg_22_0.view.widgets.treeNode:setVisible(var_22_0)

	if var_22_0 then
		local var_22_1 = arg_22_1.status < var_0_8

		arg_22_0.view.widgets.btn_wishNode:setVisible(var_22_1 and arg_22_1.cd > 0)
		arg_22_0.view.widgets.info_max:setVisible(not var_22_1 and arg_22_1.cd > 0)

		if var_22_1 then
			arg_22_0.view.widgets.goldLb:setString(language.get(135039, arg_22_1.gold))
			arg_22_0.view.widgets.numLb:setString(language.get(135282, var_0_8 - arg_22_1.status))
		end

		arg_22_0:addTreePaper()
	end

	arg_22_0.view.widgets.wishTime:setVisible(false)

	if arg_22_0.view.widgets.timer then
		arg_22_0.view.widgets.timer:removeFromParentAndCleanup(true)

		arg_22_0.view.widgets.timer = nil
	end

	if arg_22_1.cd > 0 or arg_22_1.cd == 0 and arg_22_1.eventCd > 0 then
		local var_22_2
		local var_22_3
		local var_22_4 = arg_22_1.cd > 0 and arg_22_1.cd or arg_22_1.eventCd

		if arg_22_1.cd > 0 then
			var_22_2 = var_22_0 and var_0_6 or var_0_5
			var_22_3 = var_22_0 and 135259 or 135281
		else
			var_22_2 = var_0_5
			var_22_3 = 135283
		end

		local var_22_5 = math.floor(var_22_4 / 86400000)

		arg_22_0.view.widgets.wishTime:setColor(var_22_2)

		if var_22_5 >= 1 then
			arg_22_0.view.widgets.wishTime:setString(language.get(var_22_3, language.get(135260, var_22_5)))
		else
			log.info("showPanel(), add timer, cd:", var_22_4)
			arg_22_0.view.widgets.wishTime:setString("")

			local var_22_6 = createTimerLabel(var_22_4, language.get(var_22_3, "@H:@M:@S"), "Thonburi", 22, function()
				arg_22_0:refresh()
			end, nil, nil, var_22_2)

			var_22_6:setVisible(false)
			arg_22_0.view.widgets.wishTime:addChild(var_22_6)

			local var_22_7 = var_22_6:getContentSize().width

			var_22_6:setVisible(true)

			arg_22_0.view.widgets.timer = var_22_6
		end

		arg_22_0.view.widgets.wishTime:setVisible(true)
	end

	if arg_22_1.cd == 0 then
		local var_22_8 = #arg_22_0.selected > #arg_22_0.received
		local var_22_9 = #arg_22_0.selected == #arg_22_0.received

		arg_22_0.view.widgets.info_reward:setVisible(var_22_8)
		arg_22_0.view.widgets.info_end:setVisible(var_22_9)
	end
end

function var_0_9.ctor(arg_24_0, arg_24_1, arg_24_2)
	log.info("@@ 新春许愿活动")
	rmgr.loadResource("res/ui/activity/wish/wishPic.plist")
	rmgr.loadResource("res/ui/activity/wish/wishPic1.plist")
	rmgr.loadResource("res/ui/activity/wish/wishPic2.plist")
	rmgr.loadResource("res/ui/activity/wish/wishLight.plist")
	rmgr.loadResource("res/ui/resource/xianglu/xianglu.plist")
	rmgr.loadResource("res/ui/instance/instanceMap1.plist")

	arg_24_0.view = {}

	uiutil.initWidgets(arg_24_0.view, arg_24_0.layout)

	arg_24_0.leftTime = arg_24_0.view.widgets.leftTime

	if arg_24_1 then
		arg_24_0:addChild(arg_24_0.view.widgets.panel)
		arg_24_1:addChild(arg_24_0)
	end

	arg_24_0.view.widgets.btn_wish:addHandleOfControlEvent(function()
		arg_24_0:addCenser(function()
			arg_24_0:onGetWishReward()
		end)
	end, CCControlEventTouchUpInside)
	arg_24_0.view.widgets.btn_wish1:addHandleOfControlEvent(function()
		arg_24_0.view.widgets.mask_sel:setVisible(false)

		if arg_24_0.btnPaperNode then
			arg_24_0.btnPaperNode:removeAllChildrenWithCleanup(true)
		end

		arg_24_0:addCenser(function()
			arg_24_0:onGetWishReward()
		end)
	end, CCControlEventTouchUpInside)
	arg_24_0.view.widgets.btn_wishGold:addHandleOfControlEvent(function()
		messageBox.confirm(language.get(135256, arg_24_0.info.gold), function()
			arg_24_0.view.widgets.mask_sel:setVisible(true)
			arg_24_0:addBtnPaper(ccp(460, 215))
		end)
	end, CCControlEventTouchUpInside)
	arg_24_0.view.widgets.btn_end:addHandleOfControlEvent(function()
		user.activity.haveWishActivity = false

		smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
	end, CCControlEventTouchUpInside)
	arg_24_0.view.widgets.btn_reward:addHandleOfControlEvent(function()
		log.info("btn_reward")
		arg_24_0:onGetWishBigGift()
	end, CCControlEventTouchUpInside)

	local var_24_0 = CCArray:create()

	var_24_0:addObject(CCFadeIn:create(0.6))
	var_24_0:addObject(CCFadeOut:create(0.6))

	local var_24_1 = CCSequence:create(var_24_0)
	local var_24_2 = CCRepeatForever:create(var_24_1)

	arg_24_0.view.widgets.bag_light:runAction(var_24_2)
	swallowTouch(arg_24_0.view.widgets.mask_sel)
	swallowTouch(arg_24_0.view.widgets.mask_reward)
	arg_24_0:showPanel(arg_24_2)
end

return var_0_9
