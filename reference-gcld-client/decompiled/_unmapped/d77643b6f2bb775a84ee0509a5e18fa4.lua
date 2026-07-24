local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = colorQuality[3]
local var_0_2 = colorQuality[5]
local var_0_3 = colorQuality[4]
local var_0_4 = 11
local var_0_5 = 22
local var_0_6 = class("GodSendRed", function()
	return createBaseLayer()
end)
local var_0_7 = {
	110,
	220,
	330,
	440,
	550,
	660,
	770
}
local var_0_8 = 342
local var_0_9 = 1
local var_0_10 = {}

if var_0_9 == 0 then
	var_0_10.titlePic = "res/ui/activity/godSendRed/csshb_title.png"
	var_0_10.bgPic = "res/ui/activity/redBomb/czshb_view.jpg"
	var_0_10.caishen = "res/ui/activity/godSendRed/caishen.png"
	var_0_10.hongbao_g = "res/ui/activity/godSendRed/csshb_jhb_g.png"
	var_0_10.hongbao = "res/ui/activity/godSendRed/csshb_jhb.png"
	var_0_10.fntSize = 24
	var_0_10.processY = 350
	var_0_10.leftBag = "res/ui/activity/godSendRed/leftBag.png"
	var_0_10.leftBag_k = "res/ui/activity/godSendRed/leftBag_k.png"
	var_0_10.rightBag = "res/ui/activity/godSendRed/rightBag.png"
	var_0_10.rightBag_k = "res/ui/activity/godSendRed/rightBag_k.png"
	var_0_10.leftBagText = 135618
	var_0_10.tipText = 135611
elseif var_0_9 == 1 then
	var_0_10.titlePic = "res/ui/activity/godSendRed/cezyb_title.png"
	var_0_10.bgPic = "res/ui/activity/godSendRed/cezyb_bg.png"
	var_0_10.caishen = ""
	var_0_10.hongbao_g = "res/ui/activity/godSendRed/cezyb_icon_yuebing.png"
	var_0_10.hongbao = "res/ui/activity/godSendRed/cezyb_icon_yuebing.png"
	var_0_10.fntSize = 18
	var_0_10.processY = 370
	var_0_10.bagOffsetY = -10
	var_0_10.labelNumOffsetY = -5
	var_0_10.labelGoldNumOffsetY = 7
	var_0_10.labelNoticeOffsetY = 20
	var_0_10.leftBag = "res/ui/activity/godSendRed/cezyb_btn_yuebing2_a.png"
	var_0_10.leftBag_k = "res/ui/activity/godSendRed/cezyb_btn_yuebing2_c.png"
	var_0_10.rightBag = "res/ui/activity/godSendRed/cezyb_btn_yuebing1_a.png"
	var_0_10.rightBag_k = "res/ui/activity/godSendRed/cezyb_btn_yuebing1_c.png"
	var_0_10.leftBagOffsetX = -115
	var_0_10.leftBagOffsetY = -45
	var_0_10.rightBagOffsetX = -260
	var_0_10.rightBagOffsetY = -45
	var_0_10.BagNumOffsetY = 20
	var_0_10.leftBagTipsOffsetX = 250
	var_0_10.leftBagText = "135618_change"
	var_0_10.tipText = "135611_change"
end

var_0_6.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = false,
		path = var_0_10.bgPic
	},
	middleRect = CCRectMake(20, 20, 20, 20),
	preferedSize = CCSizeMake(960, 580),
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			x = 458,
			y = 493,
			type = "sprite",
			pic = {
				frame = false,
				path = var_0_10.titlePic
			}
		},
		{
			fontSize = 24,
			name = "leftTime",
			y = 485,
			type = "label",
			x = 780,
			style = "label_warlock",
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_2
		},
		{
			style = "button_tip",
			name = "btn_tip",
			y = 490,
			type = "button",
			x = 840
		},
		{
			fontSize = 24,
			style = "label_warlock",
			type = "label",
			y = 485,
			x = 100,
			textId = 131101,
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_0
		},
		{
			x = 170,
			y = 485,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/godSendRed/yuanbao.png"
			},
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 24,
			name = "currentGold",
			y = 485,
			type = "label",
			x = 225,
			style = "label_warlock",
			anchorPoint = ccp(0, 0.5),
			color = var_0_3
		},
		{
			fontSize = 20,
			name = "txLabel",
			visible = false,
			type = "label",
			textId = 135613,
			style = "label_warlock",
			x = 730,
			y = 270 + (var_0_10.labelNoticeOffsetY or 0),
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_0
		},
		{
			fontSize = 20,
			name = "beCityName",
			visible = false,
			type = "label",
			textId = 135612,
			style = "label_warlock",
			x = 550,
			y = 270 + (var_0_10.labelNoticeOffsetY or 0),
			anchorPoint = ccp(0, 0.5),
			color = var_0_0
		},
		{
			name = "btn_goCity",
			h = 40,
			type = "button",
			w = 60,
			x = 600,
			y = 270 + (var_0_10.labelNoticeOffsetY or 0),
			anchorPoint = ccp(0, 0.5),
			children = {
				{
					fontSize = 20,
					name = "goCityLabel",
					y = 20,
					type = "label",
					style = "label_warlock",
					x = 20,
					visible = false,
					color = var_0_1
				}
			}
		},
		{
			fontSize = 20,
			name = "afCityName",
			visible = false,
			type = "label",
			textId = 135614,
			style = "label_warlock",
			x = 610,
			y = 250 + (var_0_10.labelNoticeOffsetY or 0),
			anchorPoint = ccp(0, 0.5),
			color = var_0_0
		},
		{
			x = 480,
			y = 145,
			type = "sprite",
			pic = {
				frame = false,
				path = var_0_10.caishen
			}
		},
		{
			name = "btn_leftBag",
			h = 160,
			type = "button",
			w = 110,
			x = 300 + (var_0_10.leftBagOffsetX or 0),
			y = 150 + (var_0_10.leftBagOffsetY or 0),
			children = {
				{
					y = 100,
					name = "goldBag",
					type = "sprite",
					visible = false,
					x = 50,
					pic = {
						frame = false,
						path = var_0_10.leftBag
					}
				},
				{
					y = 100,
					name = "goldBag_k",
					type = "sprite",
					visible = false,
					x = 50,
					pic = {
						frame = false,
						path = var_0_10.leftBag_k
					}
				},
				{
					fontSize = 30,
					name = "gBagNum",
					type = "label",
					x = 90,
					style = "label_warlock",
					y = 30 + (var_0_10.BagNumOffsetY or 0),
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_0
				}
			}
		},
		{
			name = "btn_rightBag",
			h = 150,
			type = "button",
			w = 100,
			x = 650 + (var_0_10.rightBagOffsetX or 0),
			y = 150 + (var_0_10.rightBagOffsetY or 0),
			children = {
				{
					y = 100,
					name = "redBag",
					type = "sprite",
					visible = false,
					x = 50,
					pic = {
						frame = false,
						path = var_0_10.rightBag
					}
				},
				{
					y = 100,
					name = "redBag_k",
					type = "sprite",
					visible = false,
					x = 50,
					pic = {
						frame = false,
						path = var_0_10.rightBag_k
					}
				},
				{
					fontSize = 30,
					name = "rBagNum",
					type = "label",
					x = 70,
					style = "label_warlock",
					y = 30 + (var_0_10.BagNumOffsetY or 0),
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_0
				}
			}
		},
		{
			x = 480,
			name = "jdtBg",
			type = "sprite9",
			pic = {
				frame = false,
				path = "res/ui/noviceWanted/xs_loading_di.png"
			},
			y = var_0_10.processY,
			middleRect = CCRectMake(25, 16, 6, 1),
			preferedSize = CCSizeMake(800, 33),
			children = {
				{
					y = 17,
					type = "sprite",
					zorder = 10,
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/jdt_fg.png"
					},
					x = var_0_7[1]
				},
				{
					y = 17,
					type = "sprite",
					zorder = 10,
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/jdt_fg.png"
					},
					x = var_0_7[2]
				},
				{
					y = 17,
					type = "sprite",
					zorder = 10,
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/jdt_fg.png"
					},
					x = var_0_7[3]
				},
				{
					y = 17,
					type = "sprite",
					zorder = 10,
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/jdt_fg.png"
					},
					x = var_0_7[4]
				},
				{
					y = 17,
					type = "sprite",
					zorder = 10,
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/jdt_fg.png"
					},
					x = var_0_7[5]
				},
				{
					y = 17,
					type = "sprite",
					zorder = 10,
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/jdt_fg.png"
					},
					x = var_0_7[6]
				},
				{
					visible = false,
					name = "jdt_loading",
					type = "sprite",
					zorder = 5,
					pic = {
						frame = false,
						path = "res/ui/noviceWanted/xs_loading_con.jpg"
					},
					anchorPoint = ccp(0, 0.5)
				},
				{
					name = "redBag1",
					type = "sprite",
					x = var_0_7[1] - 20,
					y = 60 + (var_0_10.bagOffsetY or 0),
					anchorPoint = ccp(0, 0),
					pic = {
						frame = false,
						path = var_0_10.hongbao_g
					}
				},
				{
					name = "redBag1_k",
					type = "sprite",
					visible = false,
					x = var_0_7[1] - 20,
					y = 60 + (var_0_10.bagOffsetY or 0),
					anchorPoint = ccp(0, 0),
					pic = {
						frame = false,
						path = var_0_10.hongbao
					}
				},
				{
					name = "redBag2",
					type = "sprite",
					x = var_0_7[2] - 20,
					y = 60 + (var_0_10.bagOffsetY or 0),
					anchorPoint = ccp(0, 0),
					pic = {
						frame = false,
						path = var_0_10.hongbao_g
					}
				},
				{
					name = "redBag2_k",
					type = "sprite",
					visible = false,
					x = var_0_7[2] - 20,
					y = 60 + (var_0_10.bagOffsetY or 0),
					anchorPoint = ccp(0, 0),
					pic = {
						frame = false,
						path = var_0_10.hongbao
					}
				},
				{
					name = "redBag3",
					type = "sprite",
					x = var_0_7[3] - 20,
					y = 60 + (var_0_10.bagOffsetY or 0),
					anchorPoint = ccp(0, 0),
					pic = {
						frame = false,
						path = var_0_10.hongbao_g
					}
				},
				{
					name = "redBag3_k",
					type = "sprite",
					visible = false,
					x = var_0_7[3] - 20,
					y = 60 + (var_0_10.bagOffsetY or 0),
					anchorPoint = ccp(0, 0),
					pic = {
						frame = false,
						path = var_0_10.hongbao
					}
				},
				{
					name = "redBag4",
					type = "sprite",
					x = var_0_7[4] - 20,
					y = 60 + (var_0_10.bagOffsetY or 0),
					anchorPoint = ccp(0, 0),
					pic = {
						frame = false,
						path = var_0_10.hongbao_g
					}
				},
				{
					name = "redBag4_k",
					type = "sprite",
					visible = false,
					x = var_0_7[4] - 20,
					y = 60 + (var_0_10.bagOffsetY or 0),
					anchorPoint = ccp(0, 0),
					pic = {
						frame = false,
						path = var_0_10.hongbao
					}
				},
				{
					name = "redBag5",
					type = "sprite",
					x = var_0_7[5] - 20,
					y = 60 + (var_0_10.bagOffsetY or 0),
					anchorPoint = ccp(0, 0),
					pic = {
						frame = false,
						path = var_0_10.hongbao_g
					}
				},
				{
					name = "redBag5_k",
					type = "sprite",
					visible = false,
					x = var_0_7[5] - 20,
					y = 60 + (var_0_10.bagOffsetY or 0),
					anchorPoint = ccp(0, 0),
					pic = {
						frame = false,
						path = var_0_10.hongbao
					}
				},
				{
					name = "redBag6",
					type = "sprite",
					x = var_0_7[6] - 20,
					y = 60 + (var_0_10.bagOffsetY or 0),
					anchorPoint = ccp(0, 0),
					pic = {
						frame = false,
						path = var_0_10.hongbao_g
					}
				},
				{
					name = "redBag6_k",
					type = "sprite",
					visible = false,
					x = var_0_7[6] - 20,
					y = 60 + (var_0_10.bagOffsetY or 0),
					anchorPoint = ccp(0, 0),
					pic = {
						frame = false,
						path = var_0_10.hongbao
					}
				},
				{
					name = "redBag7",
					type = "sprite",
					x = var_0_7[7] - 20,
					y = 60 + (var_0_10.bagOffsetY or 0),
					anchorPoint = ccp(0, 0),
					pic = {
						frame = false,
						path = var_0_10.hongbao_g
					}
				},
				{
					name = "redBag7_k",
					type = "sprite",
					visible = false,
					x = var_0_7[7] - 20,
					y = 60 + (var_0_10.bagOffsetY or 0),
					anchorPoint = ccp(0, 0),
					pic = {
						frame = false,
						path = var_0_10.hongbao
					}
				},
				{
					name = "redNum1",
					type = "label",
					text = "",
					style = "label_warlock",
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_0,
					fontSize = var_0_10.fntSize,
					x = var_0_7[1],
					y = 45 + (var_0_10.labelNumOffsetY or 0)
				},
				{
					name = "redNum2",
					type = "label",
					text = "",
					style = "label_warlock",
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_0,
					fontSize = var_0_10.fntSize,
					x = var_0_7[2],
					y = 45 + (var_0_10.labelNumOffsetY or 0)
				},
				{
					name = "redNum3",
					type = "label",
					text = "",
					style = "label_warlock",
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_0,
					fontSize = var_0_10.fntSize,
					x = var_0_7[3],
					y = 45 + (var_0_10.labelNumOffsetY or 0)
				},
				{
					name = "redNum4",
					type = "label",
					text = "",
					style = "label_warlock",
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_0,
					fontSize = var_0_10.fntSize,
					x = var_0_7[4],
					y = 45 + (var_0_10.labelNumOffsetY or 0)
				},
				{
					name = "redNum5",
					type = "label",
					text = "",
					style = "label_warlock",
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_0,
					fontSize = var_0_10.fntSize,
					x = var_0_7[5],
					y = 45 + (var_0_10.labelNumOffsetY or 0)
				},
				{
					name = "redNum6",
					type = "label",
					text = "",
					style = "label_warlock",
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_0,
					fontSize = var_0_10.fntSize,
					x = var_0_7[6],
					y = 45 + (var_0_10.labelNumOffsetY or 0)
				},
				{
					name = "redNum7",
					type = "label",
					text = "",
					style = "label_warlock",
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_0,
					fontSize = var_0_10.fntSize,
					x = var_0_7[7],
					y = 45 + (var_0_10.labelNumOffsetY or 0)
				},
				{
					visible = false,
					name = "yilingqu1",
					type = "sprite",
					y = 80,
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/yilingqu.png"
					},
					x = var_0_7[1]
				},
				{
					visible = false,
					name = "yilingqu2",
					type = "sprite",
					y = 80,
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/yilingqu.png"
					},
					x = var_0_7[2]
				},
				{
					visible = false,
					name = "yilingqu3",
					type = "sprite",
					y = 80,
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/yilingqu.png"
					},
					x = var_0_7[3]
				},
				{
					visible = false,
					name = "yilingqu4",
					type = "sprite",
					y = 80,
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/yilingqu.png"
					},
					x = var_0_7[4]
				},
				{
					visible = false,
					name = "yilingqu5",
					type = "sprite",
					y = 80,
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/yilingqu.png"
					},
					x = var_0_7[5]
				},
				{
					visible = false,
					name = "yilingqu6",
					type = "sprite",
					y = 80,
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/yilingqu.png"
					},
					x = var_0_7[6]
				},
				{
					visible = false,
					name = "yilingqu7",
					type = "sprite",
					y = 80,
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/yilingqu.png"
					},
					x = var_0_7[7]
				},
				{
					name = "goldNum1",
					type = "label",
					text = "",
					style = "label_warlock",
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_3,
					fontSize = var_0_10.fntSize,
					x = var_0_7[1],
					y = -20 + (var_0_10.labelGoldNumOffsetY or 0)
				},
				{
					name = "goldNum2",
					type = "label",
					text = "",
					style = "label_warlock",
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_3,
					fontSize = var_0_10.fntSize,
					x = var_0_7[2],
					y = -20 + (var_0_10.labelGoldNumOffsetY or 0)
				},
				{
					name = "goldNum3",
					type = "label",
					text = "",
					style = "label_warlock",
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_3,
					fontSize = var_0_10.fntSize,
					x = var_0_7[3],
					y = -20 + (var_0_10.labelGoldNumOffsetY or 0)
				},
				{
					name = "goldNum4",
					type = "label",
					text = "",
					style = "label_warlock",
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_3,
					fontSize = var_0_10.fntSize,
					x = var_0_7[4],
					y = -20 + (var_0_10.labelGoldNumOffsetY or 0)
				},
				{
					name = "goldNum5",
					type = "label",
					text = "",
					style = "label_warlock",
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_3,
					fontSize = var_0_10.fntSize,
					x = var_0_7[5],
					y = -20 + (var_0_10.labelGoldNumOffsetY or 0)
				},
				{
					name = "goldNum6",
					type = "label",
					text = "",
					style = "label_warlock",
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_3,
					fontSize = var_0_10.fntSize,
					x = var_0_7[6],
					y = -20 + (var_0_10.labelGoldNumOffsetY or 0)
				},
				{
					name = "goldNum7",
					type = "label",
					text = "",
					style = "label_warlock",
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_3,
					fontSize = var_0_10.fntSize,
					x = var_0_7[7],
					y = -20 + (var_0_10.labelGoldNumOffsetY or 0)
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
	anchorPoint = ccp(1, 1),
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
			color = var_0_0,
			textId = var_0_10.tipText
		}
	}
}
var_0_6.tipFrame2 = {
	name = "tipFrame2",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(1, 1),
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
			color = var_0_0
		}
	}
}

function var_0_6.close(arg_2_0)
	local var_2_0 = smgr.getLayer("topLayer")

	tool.safeRemoveChildByTag(var_2_0, s_windows.tag.activity)
end

function var_0_6.refresh(arg_3_0)
	local function var_3_0(arg_4_0)
		arg_3_0:showPanel(arg_4_0.action.data)
	end

	cmgr.sendRequest(var_3_0, actions.godSendRedInfo)
end

function var_0_6.ctor(arg_5_0, arg_5_1, arg_5_2)
	log.info("@@ 财神送红包活动")
	rmgr.loadResource("res/ui/activity/godSendRed/open.plist")

	arg_5_0.view = {}

	uiutil.initWidgets(arg_5_0.view, arg_5_0.layout)

	arg_5_0.leftTime = arg_5_0.view.widgets.leftTime

	if arg_5_1 then
		arg_5_0:addChild(arg_5_0.view.widgets.panel)
		arg_5_1:addChild(arg_5_0)
	end

	arg_5_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		arg_5_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_5_0.view.widgets.btn_leftBag:setOpacity(0)
	arg_5_0.view.widgets.btn_rightBag:setOpacity(0)
	arg_5_0.view.widgets.btn_goCity:setOpacity(0)
	arg_5_0:refresh()
	arg_5_0:showPanel(arg_5_2)
end

function var_0_6.showPanel(arg_7_0, arg_7_1)
	arg_7_0.info = arg_7_1

	arg_7_0:timeShow()

	local var_7_0 = arg_7_1.gold

	for iter_7_0 = 1, 7 do
		arg_7_0.view.widgets["redNum" .. iter_7_0]:setString(language.get(135002, arg_7_1.godPapers[iter_7_0].num))
		arg_7_0.view.widgets["goldNum" .. iter_7_0]:setString(language.get(20028, arg_7_1.godPapers[iter_7_0].gold))

		if var_7_0 >= arg_7_1.godPapers[iter_7_0].gold then
			arg_7_0.view.widgets["yilingqu" .. iter_7_0]:setVisible(true)
			arg_7_0.view.widgets["redBag" .. iter_7_0 .. "_k"]:setVisible(true)
			arg_7_0.view.widgets["redBag" .. iter_7_0]:setVisible(false)
		else
			arg_7_0.view.widgets["yilingqu" .. iter_7_0]:setVisible(false)
		end
	end

	if arg_7_1.num > 0 then
		arg_7_0.view.widgets.goldBag:setVisible(true)
		arg_7_0.view.widgets.gBagNum:setString(language.get(135617, arg_7_1.num))
		arg_7_0.view.widgets.btn_leftBag:setEnabled(true)
		arg_7_0.view.widgets.btn_leftBag:addHandleOfControlEvent(function()
			arg_7_0:showTipInfo(arg_7_1.num, var_0_4)
			arg_7_0:onGetReward(var_0_4)
			arg_7_0:refresh()
		end, CCControlEventTouchUpInside)
	elseif arg_7_1.num == 0 then
		arg_7_0.view.widgets.goldBag:setVisible(false)
		arg_7_0.view.widgets.gBagNum:setString("")
		arg_7_0.view.widgets.btn_leftBag:setEnabled(false)
	end

	if arg_7_1.normalNum > 0 then
		arg_7_0.view.widgets.redBag:setVisible(true)
		arg_7_0.view.widgets.rBagNum:setString(language.get(135617, arg_7_1.normalNum))
		arg_7_0.view.widgets.btn_rightBag:setEnabled(true)
		arg_7_0.view.widgets.btn_rightBag:addHandleOfControlEvent(function()
			arg_7_0:showTipInfo(arg_7_1.normalNum, var_0_5)
			arg_7_0:onGetReward(var_0_5)
			arg_7_0:refresh()
		end, CCControlEventTouchUpInside)
	elseif arg_7_1.normalNum == 0 then
		arg_7_0.view.widgets.redBag:setVisible(false)
		arg_7_0.view.widgets.rBagNum:setString("")
		arg_7_0.view.widgets.btn_rightBag:setEnabled(false)
	end

	arg_7_0.view.widgets.currentGold:setString(language.get(20028, arg_7_1.gold))
	arg_7_0:percentShow(arg_7_1)
end

function var_0_6.timeShow(arg_10_0)
	arg_10_0.view.widgets.beCityName:setVisible(false)
	arg_10_0.view.widgets.afCityName:setVisible(false)
	arg_10_0.view.widgets.goCityLabel:setVisible(false)

	if arg_10_0.TimerLabel then
		arg_10_0.TimerLabel:removeFromParentAndCleanup(true)

		arg_10_0.TimerLabel = nil
	end

	if arg_10_0.info.cd > 0 then
		arg_10_0.view.widgets.txLabel:setVisible(true)

		local function var_10_0()
			if arg_10_0.TimerLabel then
				arg_10_0.TimerLabel:removeFromParentAndCleanup(true)

				arg_10_0.TimerLabel = nil
			end

			arg_10_0:refresh()
		end

		local var_10_1 = createTimerLabel(arg_10_0.info.cd + 5000, "@M:@S", "Thonburi", 26, var_10_0, nil, nil, ccc3(255, 0, 0))

		arg_10_0.TimerLabel = var_10_1

		var_10_1:setPosition(ccp(590, 270 + var_0_10.labelNoticeOffsetY))
		arg_10_0.view.widgets.panel:addChild(var_10_1)
	elseif #arg_10_0.info.cities > 0 then
		arg_10_0.view.widgets.txLabel:setVisible(false)
		arg_10_0.view.widgets.beCityName:setVisible(true)
		arg_10_0.view.widgets.afCityName:setVisible(true)
		arg_10_0.view.widgets.goCityLabel:setVisible(true)
		arg_10_0.view.widgets.goCityLabel:setString(language.get(20028, arg_10_0.info.cities[1].cityName))
		arg_10_0.view.widgets.btn_goCity:addHandleOfControlEvent(function()
			arg_10_0:onGoToCity(arg_10_0.info.cities[1].cityId)
		end, CCControlEventTouchUpInside)
		arg_10_0.view.widgets.btn_goCity:setEnabled(true)
		arg_10_0.view.widgets.btn_goCity:setPositionX(arg_10_0.view.widgets.beCityName:getPositionX() + arg_10_0.view.widgets.beCityName:getContentSize().width + 4)
	end
end

function var_0_6.showTipInfo(arg_13_0, arg_13_1, arg_13_2)
	arg_13_1 = arg_13_1 - 1

	log.info("should show tips ")

	local var_13_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_13_0:registerScriptTouchHandler(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == CCTOUCHBEGAN then
			return true
		elseif arg_14_0 == CCTOUCHMOVED then
			return true
		elseif arg_14_0 == CCTOUCHENDED then
			pcall(var_13_0.removeFromParentAndCleanup, var_13_0, true)

			return true
		end
	end, false, true)
	var_13_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_13_0, 60000)

	local var_13_1 = 0
	local var_13_2 = 0
	local var_13_3 = {}

	uiutil.initWidgets(var_13_3, var_0_6.tipFrame2)
	var_13_0:addChild(var_13_3.widgets.tipFrame2)

	if arg_13_2 == var_0_4 then
		local var_13_4, var_13_5 = tool.getPositionInScreen(arg_13_0.view.widgets.btn_leftBag)

		var_13_1 = var_13_4 - 200 + (var_0_10.leftBagTipsOffsetX or 0)
		var_13_2 = var_13_5 - 50

		var_13_3.widgets.tipMsg:setString(language.get(135616, arg_13_1))
	elseif arg_13_2 == var_0_5 then
		local var_13_6, var_13_7 = tool.getPositionInScreen(arg_13_0.view.widgets.btn_rightBag)

		var_13_1 = var_13_6 + 50
		var_13_2 = var_13_7 - 80

		var_13_3.widgets.tipMsg:setString(language.get(var_0_10.leftBagText, arg_13_1, arg_13_0.info.totalNormalNum, arg_13_0.info.currentNormalNum))
	end

	var_13_3.widgets.tipFrame2:setAnchorPoint(ccp(0, 0))
	var_13_3.widgets.tipMsg:setDimensions(CCSizeMake(150, 0))

	local var_13_8 = var_13_3.widgets.tipMsg:getContentSize().width
	local var_13_9 = var_13_3.widgets.tipMsg:getContentSize().height

	var_13_3.widgets.tipFrame2:setPreferredSize(CCSizeMake(var_13_8 + 20, var_13_9 + 20))
	var_13_3.widgets.tipFrame2:setPosition(ccp(var_13_1, var_13_2))
	var_13_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_13_3.widgets.tipFrame2:setVisible(true)
end

function var_0_6.onGetReward(arg_15_0, arg_15_1)
	log.info("@@获得红包奖励")

	if arg_15_1 == var_0_4 then
		arg_15_0.view.widgets.goldBag_k:setVisible(true)

		local var_15_0 = CCArray:create()

		for iter_15_0 = 1, 10 do
			local var_15_1 = CCSprite:createWithSpriteFrameName(string.format("open%s.png", iter_15_0))

			var_15_0:addObject(var_15_1:displayFrame())
		end

		local var_15_2 = CCAnimation:createWithSpriteFrames(var_15_0, 0.1)
		local var_15_3 = CCAnimate:create(var_15_2)
		local var_15_4 = CCSprite:create("res/ui/activity/godSendRed/leftBag.png")

		var_15_4:setPosition(ccp(arg_15_0.view.widgets.goldBag_k:getContentSize().width * 0.5, arg_15_0.view.widgets.goldBag_k:getContentSize().height * 0.5))
		arg_15_0.view.widgets.goldBag_k:addChild(var_15_4)
		var_15_4:runAction(var_15_3)
	elseif arg_15_1 == var_0_5 then
		arg_15_0.view.widgets.redBag_k:setVisible(true)

		local var_15_5 = CCArray:create()

		for iter_15_1 = 1, 10 do
			local var_15_6 = CCSprite:createWithSpriteFrameName(string.format("open%s.png", iter_15_1))

			var_15_5:addObject(var_15_6:displayFrame())
		end

		local var_15_7 = CCAnimation:createWithSpriteFrames(var_15_5, 0.1)
		local var_15_8 = CCAnimate:create(var_15_7)
		local var_15_9 = CCSprite:create("res/ui/activity/godSendRed/rightBag.png")

		var_15_9:setPosition(ccp(arg_15_0.view.widgets.redBag_k:getContentSize().width * 0.5, arg_15_0.view.widgets.redBag_k:getContentSize().height * 0.5))
		arg_15_0.view.widgets.redBag_k:addChild(var_15_9)
		var_15_9:runAction(var_15_8)
	end

	local var_15_10 = CCArray:create()

	var_15_10:addObject(CCDelayTime:create(1))
	var_15_10:addObject(CCCallFuncN:create(function()
		arg_15_0.view.widgets.goldBag_k:setVisible(false)
		arg_15_0.view.widgets.redBag_k:setVisible(false)
	end))

	local var_15_11 = CCSequence:create(var_15_10)

	if arg_15_1 == var_0_4 then
		arg_15_0.view.widgets.goldBag_k:runAction(var_15_11)
	elseif arg_15_1 == var_0_5 then
		arg_15_0.view.widgets.redBag_k:runAction(var_15_11)
	end

	local function var_15_12(arg_17_0)
		local var_17_0 = arg_17_0.action.data.rewards

		log.info("******" .. var_17_0[1].type)

		local var_17_1 = {}
		local var_17_2 = {
			id = var_17_0[1].type
		}

		if var_17_2.id == 102 then
			var_17_2.id = 41
		elseif var_17_2.id == 21 then
			var_17_2.id = 7
		elseif var_17_2.id == 5 then
			var_17_2.id = 6
		end

		var_17_2.value = var_17_0[1].value

		table.insert(var_17_1, var_17_2)
		globalAction_gotResource(var_17_1)
		arg_15_0:refresh()
	end

	if arg_15_1 == var_0_4 then
		cmgr.sendRequest(var_15_12, actions.getRedReward, 1)
	elseif arg_15_1 == var_0_5 then
		cmgr.sendRequest(var_15_12, actions.getRedReward, 2)
	end
end

function var_0_6.onGoToCity(arg_18_0, arg_18_1)
	smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
	loadingLayer.show(SCENE_WORLD, arg_18_1)
end

function var_0_6.percentShow(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_1.gold
	local var_19_1 = 110
	local var_19_2 = arg_19_1.godPapers[1].gold
	local var_19_3 = arg_19_1.godPapers[2].gold
	local var_19_4 = arg_19_1.godPapers[3].gold
	local var_19_5 = arg_19_1.godPapers[4].gold
	local var_19_6 = arg_19_1.godPapers[5].gold
	local var_19_7 = arg_19_1.godPapers[6].gold
	local var_19_8 = arg_19_1.godPapers[7].gold

	if var_19_0 > 0 then
		local var_19_9 = 0

		if var_19_0 <= var_19_2 then
			var_19_9 = var_19_1 * (var_19_0 / var_19_2) - 20
		elseif var_19_2 < var_19_0 and var_19_0 <= var_19_3 then
			var_19_9 = var_19_1 * (1 + (var_19_0 - var_19_2) / (var_19_3 - var_19_2)) - 20
		elseif var_19_3 < var_19_0 and var_19_0 <= var_19_4 then
			var_19_9 = var_19_1 * (2 + (var_19_0 - var_19_3) / (var_19_4 - var_19_3)) - 20
		elseif var_19_4 < var_19_0 and var_19_0 <= var_19_5 then
			var_19_9 = var_19_1 * (3 + (var_19_0 - var_19_4) / (var_19_5 - var_19_4)) - 20
		elseif var_19_5 < var_19_0 and var_19_0 <= var_19_6 then
			var_19_9 = var_19_1 * (4 + (var_19_0 - var_19_5) / (var_19_6 - var_19_5)) - 20
		elseif var_19_6 < var_19_0 and var_19_0 <= var_19_7 then
			var_19_9 = var_19_1 * (5 + (var_19_0 - var_19_6) / (var_19_7 - var_19_6)) - 20
		elseif var_19_7 < var_19_0 and var_19_0 < var_19_8 then
			var_19_9 = var_19_1 * (6 + (var_19_0 - var_19_7) / (var_19_8 - var_19_7)) - 20
		elseif var_19_8 <= var_19_0 then
			var_19_9 = var_19_1 * 7 - 10
		end

		arg_19_0.view.widgets.jdt_loading:setVisible(true)
		arg_19_0.view.widgets.jdt_loading:setScaleX(var_19_9)
		arg_19_0.view.widgets.jdt_loading:setPosition(ccp(20, 18))
	else
		arg_19_0.view.widgets.jdt_loading:setVisible(false)
	end
end

function var_0_6.showTip(arg_20_0, arg_20_1, arg_20_2)
	log.info("should show tips ")

	local var_20_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_20_0:registerScriptTouchHandler(function(arg_21_0, arg_21_1, arg_21_2)
		if arg_21_0 == CCTOUCHBEGAN then
			return true
		elseif arg_21_0 == CCTOUCHMOVED then
			return true
		elseif arg_21_0 == CCTOUCHENDED then
			pcall(var_20_0.removeFromParentAndCleanup, var_20_0, true)

			return true
		end
	end, false, true)
	var_20_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_20_0, 60000)

	local var_20_1 = 0
	local var_20_2 = 0
	local var_20_3 = {}

	uiutil.initWidgets(var_20_3, arg_20_0.tipFrame)
	var_20_0:addChild(var_20_3.widgets.tipFrame)

	local var_20_4, var_20_5 = tool.getPositionInScreen(arg_20_0.view.widgets.btn_tip)
	local var_20_6 = var_20_4 + 20
	local var_20_7 = var_20_5 - 20
	local var_20_8 = var_20_3.widgets.tipMsg:getContentSize().width
	local var_20_9 = var_20_3.widgets.tipMsg:getContentSize().height

	var_20_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_20_8 + 30, var_20_9 + 30))
	var_20_3.widgets.tipFrame:setPosition(ccp(var_20_6, var_20_7))
	var_20_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_20_3.widgets.tipFrame:setVisible(true)
end

return var_0_6
