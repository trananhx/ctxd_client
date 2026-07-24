require("lua/layer/playerInfo2/ui")

local var_0_0 = require("res/native/offset").get("layer.activity.goldActivity.goldActivityTab")
local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = colorQuality[3]
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = 1
local var_0_6 = 2
local var_0_7 = 3
local var_0_8 = 4
local var_0_9 = {
	46,
	100,
	156,
	230,
	320,
	436,
	600
}
local var_0_10 = {
	redBag1,
	redBag2,
	redBag3,
	redBag4,
	redBag5,
	redBag6,
	redBag7
}
local var_0_11 = class("GoldActivity", function()
	return createBaseLayer()
end)
local var_0_12 = 600
local var_0_13 = 40
local var_0_14 = 54

var_0_11.layout = {
	name = "panel",
	type = "node",
	x = visibleSize.width * 0.5 - 480,
	y = visibleSize.height * 0.5 - 30 - 290,
	children = {
		{
			visible = false,
			name = "view2",
			y = 0,
			type = "node",
			x = 0,
			children = {
				{
					x = 480,
					y = 290,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/comment/bg1.jpg"
					}
				},
				{
					x = 458,
					y = 520,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/gphb_title.png"
					}
				},
				{
					y = 480,
					x = 40,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/gphb_bg.jpg"
					},
					anchorPoint = ccp(0, 1),
					children = {
						{
							x = 15,
							y = 105,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/goldActivity/myRedBag/bans.png"
							},
							anchorPoint = ccp(0, 0)
						},
						{
							fontSize = 35,
							name = "qhb",
							visible = false,
							type = "label",
							textId = 135789,
							style = "label_warlock",
							y = 220,
							x = 350,
							color = var_0_3,
							anchorPoint = ccp(0.5, 0.5)
						}
					}
				},
				{
					y = 480,
					x = 630,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/gphb_list_bg.jpg"
					},
					anchorPoint = ccp(0, 1),
					children = {
						{
							x = 60,
							y = 335,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/goldActivity/gphb_word_sqphb.png"
							},
							anchorPoint = ccp(0, 0)
						}
					}
				},
				{
					name = "btn_back",
					h = 50,
					type = "button",
					w = 180,
					y = 60,
					x = 800,
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
							fontSize = 24,
							style = "label_warlock",
							y = 30,
							type = "label",
							x = 85,
							textId = 83037,
							color = var_0_1
						}
					}
				}
			}
		},
		{
			y = 0,
			name = "view3",
			type = "node",
			x = 0,
			zorder = 20,
			children = {
				{
					visible = false,
					name = "btn_recGold",
					h = 200,
					type = "button",
					w = 120,
					y = 240,
					x = 520,
					children = {
						{
							y = 100,
							type = "sprite",
							x = 60,
							anchorPoint = ccp(0.5, 0.5),
							pic = {
								frame = false,
								path = "res/ui/activity/goldActivity/dabao.png"
							}
						},
						{
							y = 100,
							type = "sprite",
							x = 60,
							anchorPoint = ccp(0.5, 0.5),
							pic = {
								frame = false,
								path = "res/ui/activity/goldActivity/myRedBag/dyb.png"
							}
						},
						{
							y = 0,
							type = "sprite",
							x = 60,
							anchorPoint = ccp(0.5, 0.5),
							pic = {
								frame = false,
								path = "res/ui/activity/goldActivity/myRedBag/wdhb_word_02.png"
							}
						}
					}
				},
				{
					visible = false,
					name = "btn_openBag",
					h = 200,
					type = "button",
					w = 120,
					y = 240,
					x = 520,
					children = {
						{
							y = 100,
							type = "sprite",
							x = 60,
							anchorPoint = ccp(0.5, 0.5),
							pic = {
								frame = false,
								path = "res/ui/activity/goldActivity/myRedBag/gjms_ms_lig_bg.png"
							}
						},
						{
							y = 100,
							type = "sprite",
							x = 60,
							anchorPoint = ccp(0.5, 0.5),
							pic = {
								frame = false,
								path = "res/ui/activity/goldActivity/myRedBag/bans.png"
							}
						},
						{
							y = 220,
							type = "sprite",
							x = 60,
							anchorPoint = ccp(0.5, 0.5),
							pic = {
								frame = false,
								path = "res/ui/activity/goldActivity/myRedBag/wdhb_word_03.png"
							}
						},
						{
							y = 100,
							name = "open",
							type = "sprite",
							visible = false,
							x = 60,
							anchorPoint = ccp(0.5, 0.5),
							pic = {
								frame = false,
								path = "res/ui/activity/goldActivity/myRedBag/kai.png"
							}
						},
						{
							fontSize = 24,
							name = "openRedBagNum",
							y = 40,
							type = "label",
							style = "label_warlock",
							x = 80,
							color = var_0_1
						}
					}
				},
				{
					visible = false,
					name = "btn_sendRedBag",
					h = 200,
					type = "button",
					w = 120,
					y = 240,
					x = 520,
					children = {
						{
							y = 100,
							type = "sprite",
							x = 60,
							anchorPoint = ccp(0.5, 0.5),
							pic = {
								frame = false,
								path = "res/ui/activity/goldActivity/myRedBag/gjms_ms_lig_bg.png"
							}
						},
						{
							y = 100,
							type = "sprite",
							x = 60,
							anchorPoint = ccp(0.5, 0.5),
							pic = {
								frame = false,
								path = "res/ui/activity/goldActivity/myRedBag/bans.png"
							}
						},
						{
							y = 200,
							type = "sprite",
							x = 60,
							anchorPoint = ccp(0.5, 0.5),
							pic = {
								frame = false,
								path = "res/ui/activity/goldActivity/myRedBag/wdhb_word_01.png"
							}
						},
						{
							name = "sendRedBag",
							h = 55,
							type = "button",
							w = 140,
							y = -20,
							x = 60,
							normal = {
								frame = false,
								path = "res/ui/activity/goldActivity/nationButtonGreen1.png"
							},
							touched = {
								frame = false,
								path = "res/ui/activity/goldActivity/nationButtonGreen.png"
							},
							children = {
								{
									fontSize = 24,
									style = "label_warlock",
									y = 27,
									type = "label",
									x = 70,
									textId = 135781,
									color = var_0_1
								}
							}
						}
					}
				},
				{
					x = 540,
					name = "Word",
					y = 350,
					type = "sprite",
					visible = false,
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/gphb_word_hbsyjb.png"
					}
				}
			}
		},
		{
			y = 0,
			name = "view1",
			type = "node",
			x = 0,
			children = {
				{
					x = 480,
					y = 290,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/acti_view_bg.jpg"
					}
				},
				{
					y = 493,
					x = 458,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/czsj_title.png"
					},
					scale = var_0_0.titleScale or 1
				},
				{
					fontSize = 24,
					name = "leftTime",
					y = 485,
					type = "label",
					style = "label_warlock",
					x = 780 + (var_0_0.timeLeftX or 0),
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_3
				},
				{
					y = 415,
					x = 190,
					scale = 0.8,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/czsj_long_bg.png"
					},
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = 430,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/czsj_word_zcz.png"
					},
					x = 420 + (var_0_0.descLabel1X or 0),
					scale = var_0_0.descLabelScale or 1
				},
				{
					fontSize = 25,
					name = "nextGold",
					scale = 1.2,
					type = "label",
					text = "",
					style = "label_warlock",
					y = 430,
					x = 350 + (var_0_0.nextGoldX or 0),
					color = var_0_1,
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					y = 400,
					x = 520,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/czsj_word_bkew.png"
					},
					scale = var_0_0.descLabelScale or 1
				},
				{
					y = 400,
					x = 650,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/czsj_word_fhb.png"
					},
					scale = var_0_0.descLabelScale or 1
				},
				{
					name = "actPay",
					h = 50,
					type = "button",
					w = 180,
					y = 415,
					x = 800,
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
							style = "label_warlock",
							y = 30,
							type = "label",
							x = 85,
							textId = 131032,
							fontSize = 24 + (var_0_0.rechargeFntSize or 0),
							color = var_0_1
						}
					}
				},
				{
					x = 600,
					name = "jdtBg",
					y = 220,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/czsj_pb_bg.png"
					},
					children = {
						{
							x = 300,
							name = "jdt_loading",
							y = 13.5,
							type = "progressbar",
							pic = {
								frame = false,
								path = "res/ui/activity/goldActivity/czsj_pb.png"
							},
							anchorPoint = ccp(0.5, 0.5),
							progressType = kCCProgressTimerTypeBar
						},
						{
							y = 50,
							name = "btn_redBag1",
							h = 40,
							type = "button",
							w = 40,
							x = var_0_9[1],
							children = {
								{
									y = 0,
									name = "redBag1",
									type = "sprite",
									scale = 0.6,
									x = 0,
									anchorPoint = ccp(0, 0),
									pic = {
										frame = false,
										path = "res/ui/activity/goldActivity/czsj_hb01.png"
									}
								}
							}
						},
						{
							y = 50,
							name = "btn_redBag2",
							h = 40,
							type = "button",
							w = 40,
							x = var_0_9[2],
							children = {
								{
									y = 0,
									name = "redBag2",
									type = "sprite",
									scale = 0.7,
									x = 0,
									anchorPoint = ccp(0, 0),
									pic = {
										frame = false,
										path = "res/ui/activity/goldActivity/czsj_hb01.png"
									}
								}
							}
						},
						{
							y = 50,
							name = "btn_redBag3",
							h = 40,
							type = "button",
							w = 40,
							x = var_0_9[3],
							children = {
								{
									y = 0,
									name = "redBag3",
									type = "sprite",
									scale = 0.8,
									x = 0,
									anchorPoint = ccp(0, 0),
									pic = {
										frame = false,
										path = "res/ui/activity/goldActivity/czsj_hb02.png"
									}
								}
							}
						},
						{
							y = 60,
							name = "btn_redBag4",
							h = 60,
							type = "button",
							w = 40,
							x = var_0_9[4],
							children = {
								{
									y = 0,
									name = "redBag4",
									type = "sprite",
									scale = 0.9,
									x = 0,
									anchorPoint = ccp(0, 0),
									pic = {
										frame = false,
										path = "res/ui/activity/goldActivity/czsj_hb02.png"
									}
								}
							}
						},
						{
							y = 70,
							name = "btn_redBag5",
							h = 70,
							type = "button",
							w = 50,
							x = var_0_9[5],
							children = {
								{
									y = 0,
									name = "redBag5",
									type = "sprite",
									scale = 1,
									x = 0,
									anchorPoint = ccp(0, 0),
									pic = {
										frame = false,
										path = "res/ui/activity/goldActivity/czsj_hb03.png"
									}
								}
							}
						},
						{
							y = 70,
							name = "btn_redBag6",
							h = 90,
							type = "button",
							w = 70,
							x = var_0_9[6],
							children = {
								{
									y = 0,
									name = "redBag6",
									type = "sprite",
									scale = 1.2,
									x = 0,
									anchorPoint = ccp(0, 0),
									pic = {
										frame = false,
										path = "res/ui/activity/goldActivity/czsj_hb03.png"
									}
								}
							}
						},
						{
							y = 80,
							name = "btn_redBag7",
							h = 90,
							type = "button",
							w = 70,
							x = var_0_9[7] - 50,
							children = {
								{
									y = 0,
									name = "redBag7",
									type = "sprite",
									scale = 1.3,
									x = 0,
									anchorPoint = ccp(0, 0),
									pic = {
										frame = false,
										path = "res/ui/activity/goldActivity/czsj_hb04.png"
									}
								}
							}
						},
						{
							fontSize = 24,
							name = "goldNum1",
							type = "label",
							text = "",
							style = "label_warlock",
							y = -27,
							anchorPoint = ccp(0.5, 0.5),
							color = var_0_4,
							x = var_0_9[1] - 25
						},
						{
							fontSize = 24,
							name = "goldNum2",
							type = "label",
							text = "",
							style = "label_warlock",
							y = -27,
							anchorPoint = ccp(0.5, 0.5),
							color = var_0_4,
							x = var_0_9[2] - 20
						},
						{
							fontSize = 24,
							name = "goldNum3",
							type = "label",
							text = "",
							style = "label_warlock",
							y = -27,
							anchorPoint = ccp(0.5, 0.5),
							color = var_0_4,
							x = var_0_9[3]
						},
						{
							fontSize = 24,
							name = "goldNum4",
							type = "label",
							text = "",
							style = "label_warlock",
							y = -27,
							anchorPoint = ccp(0.5, 0.5),
							color = var_0_4,
							x = var_0_9[4]
						},
						{
							fontSize = 24,
							name = "goldNum5",
							type = "label",
							text = "",
							style = "label_warlock",
							y = -27,
							anchorPoint = ccp(0.5, 0.5),
							color = var_0_4,
							x = var_0_9[5]
						},
						{
							fontSize = 24,
							name = "goldNum6",
							type = "label",
							text = "",
							style = "label_warlock",
							y = -27,
							anchorPoint = ccp(0.5, 0.5),
							color = var_0_4,
							x = var_0_9[6]
						},
						{
							fontSize = 24,
							name = "goldNum7",
							type = "label",
							text = "",
							style = "label_warlock",
							y = -27,
							anchorPoint = ccp(0.5, 0.5),
							color = var_0_4,
							x = var_0_9[7] - 30
						},
						{
							scale = 0.6,
							name = "yilingqu1",
							visible = false,
							type = "sprite",
							x = 50,
							y = 50,
							pic = {
								frame = false,
								path = "res/ui/activity/goldActivity/yilingqu.png"
							}
						},
						{
							scale = 0.6,
							name = "yilingqu2",
							visible = false,
							type = "sprite",
							x = 100,
							y = 50,
							pic = {
								frame = false,
								path = "res/ui/activity/goldActivity/yilingqu.png"
							}
						},
						{
							scale = 0.7,
							name = "yilingqu3",
							visible = false,
							type = "sprite",
							x = 160,
							y = 60,
							pic = {
								frame = false,
								path = "res/ui/activity/goldActivity/yilingqu.png"
							}
						},
						{
							scale = 0.7,
							name = "yilingqu4",
							visible = false,
							type = "sprite",
							x = 230,
							y = 60,
							pic = {
								frame = false,
								path = "res/ui/activity/goldActivity/yilingqu.png"
							}
						},
						{
							scale = 0.8,
							name = "yilingqu5",
							visible = false,
							type = "sprite",
							x = 320,
							y = 70,
							pic = {
								frame = false,
								path = "res/ui/activity/goldActivity/yilingqu.png"
							}
						},
						{
							scale = 1.1,
							name = "yilingqu6",
							visible = false,
							type = "sprite",
							x = 440,
							y = 80,
							pic = {
								frame = false,
								path = "res/ui/activity/goldActivity/yilingqu.png"
							}
						},
						{
							scale = 1.1,
							name = "yilingqu7",
							visible = false,
							type = "sprite",
							x = 570,
							y = 90,
							pic = {
								frame = false,
								path = "res/ui/activity/goldActivity/yilingqu.png"
							}
						}
					}
				},
				{
					visible = false,
					name = "btn_rec",
					h = 50,
					type = "button",
					w = 200,
					y = 80,
					x = 750,
					children = {
						{
							fontSize = 24,
							style = "label_warlock",
							y = 25,
							type = "label",
							x = 100,
							textId = 135782,
							color = var_0_2
						}
					}
				}
			}
		}
	}
}
var_0_11.tipFrame = {
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
			color = var_0_1
		}
	}
}

function var_0_11.close(arg_2_0)
	local var_2_0 = smgr.getLayer("topLayer")

	tool.safeRemoveChildByTag(var_2_0, s_windows.tag.activity)
end

function var_0_11.refresh(arg_3_0)
	local function var_3_0(arg_4_0)
		arg_3_0:showPanel(arg_4_0.action.data)
	end

	cmgr.sendRequest(var_3_0, actions.getGoldActivityInfo)
end

function var_0_11.ctor(arg_5_0, arg_5_1, arg_5_2)
	log.info("@@ 充值送金抢红包活动")

	arg_5_0.view = {}

	uiutil.initWidgets(arg_5_0.view, arg_5_0.layout)

	arg_5_0.leftTime = arg_5_0.view.widgets.leftTime

	if arg_5_1 then
		arg_5_0:addChild(arg_5_0.view.widgets.panel)
		arg_5_1:addChild(arg_5_0)
	end

	arg_5_0.view.widgets.btn_rec:setOpacity(0)

	for iter_5_0 = 1, 7 do
		arg_5_0.view.widgets["btn_redBag" .. iter_5_0]:setOpacity(0)
	end

	arg_5_0.view.widgets.actPay:addHandleOfControlEvent(function()
		playerInfo2.ui.show(2)
	end, CCControlEventTouchUpInside)

	for iter_5_1 = 1, 7 do
		arg_5_0.view.widgets["btn_redBag" .. iter_5_1]:addHandleOfControlEvent(function()
			log.info("btn_tip")
			arg_5_0:showTip(iter_5_1)
			log.info("redBag", iter_5_1)

			if arg_5_0.info.currGold >= arg_5_0.info.bonus[iter_5_1].needGold and arg_5_2.bonus[iter_5_1].hasOpen == false then
				arg_5_0:onGetReward(iter_5_1)
			end
		end, CCControlEventTouchUpInside)
	end

	arg_5_0.view.widgets.btn_rec:addHandleOfControlEvent(function()
		arg_5_0:gotoRec()
	end, CCControlEventTouchUpInside)
	arg_5_0.view.widgets.btn_back:addHandleOfControlEvent(function()
		arg_5_0:backToFirst()
	end, CCControlEventTouchUpInside)
	arg_5_0:showPanel(arg_5_2)
end

function var_0_11.gotoRec(arg_10_0)
	log.info("@@界面跳转到我的红包@@")
	arg_10_0.view.widgets.view1:setVisible(false)
	arg_10_0.view.widgets.view2:setVisible(true)
	arg_10_0.view.widgets.qhb:setVisible(true)
	arg_10_0:addRankInfo()
end

function var_0_11.addRankInfo(arg_11_0)
	local function var_11_0(arg_12_0)
		arg_11_0.data = arg_12_0.action.data

		if #arg_11_0.data.redBags >= 1 then
			arg_11_0.view.widgets.qhb:setVisible(false)
		end

		arg_11_0:creatLeftList(arg_11_0.data)
	end

	cmgr.sendRequest(var_11_0, actions.getOwnRedBag)
end

function var_0_11.createRightList(arg_13_0, arg_13_1)
	if #arg_13_0.data.redBags == 0 then
		return
	end

	local var_13_0 = arg_13_0.data.redBags[arg_13_1].redBagChart
	local var_13_1 = CCLayerColor:create(ccc4(0, 0, 0, 0), 270, 315)
	local var_13_2 = CCScrollView:create(CCSizeMake(270, 315), var_13_1)

	var_13_2:setAnchorPoint(ccp(0, 0))
	var_13_2:setPosition(ccp(640, 105))
	var_13_2:setTouchEnabled(true)
	arg_13_0.view.widgets.view2:addChild(var_13_2)
	var_13_2:setDirection(kCCScrollViewDirectionVertical)

	if arg_13_0.scrollView then
		arg_13_0.scrollView:removeFromParentAndCleanup(true)
	end

	arg_13_0.scrollView = var_13_2

	local var_13_3 = 57
	local var_13_4 = #var_13_0
	local var_13_5 = var_13_3 * var_13_4

	if var_13_4 < 6 then
		local var_13_6 = 6

		var_13_5 = 315
	end

	var_13_1:setContentSize(CCSizeMake(270, var_13_5))
	var_13_2:setContentSize(CCSizeMake(270, var_13_5))
	var_13_2:setContentOffset(ccp(0, var_13_2:minContainerOffset().y))

	for iter_13_0 = 1, #var_13_0 do
		local var_13_7 = var_13_5 - iter_13_0 * var_13_3
		local var_13_8 = var_13_0[iter_13_0]
		local var_13_9
		local var_13_10 = iter_13_0 % 2 == 0 and "res/ui/activity/goldActivity/gphb_list_bg02.png" or "res/ui/activity/goldActivity/gphb_list_bg01.png"
		local var_13_11 = CCSprite:create(var_13_10)

		var_13_11:setAnchorPoint(ccp(0.5, 0.5))
		var_13_11:setPosition(0, var_13_7)
		var_13_2:addChild(var_13_11)

		local var_13_12 = CCLabelTTF:create(var_13_8.seq, "", 20)

		var_13_12:setAnchorPoint(ccp(0, 0))
		var_13_12:setPosition(20, 20)

		local var_13_13 = CCLabelTTF:create(var_13_8.playerName, "", 20)

		var_13_13:setAnchorPoint(ccp(0, 0))
		var_13_13:setPosition(50, 20)

		local var_13_14 = CCLabelTTF:create(var_13_8.gainNum, "", 18)

		var_13_14:setAnchorPoint(ccp(0.5, 0.5))
		var_13_14:setColor(var_0_4)
		var_13_14:setPosition(230, 20)

		local var_13_15 = CCSprite:create("res/ui/activity/goldActivity/myRedBag/dyb.png")

		var_13_15:setAnchorPoint(ccp(0.5, 0.5))
		var_13_15:setScale(0.2)
		var_13_15:setPosition(230, 40)
		var_13_11:addChild(var_13_12)
		var_13_11:addChild(var_13_13)
		var_13_11:addChild(var_13_14)
		var_13_11:addChild(var_13_15)
	end
end

function var_0_11.creatLeftList(arg_14_0, arg_14_1)
	local var_14_0 = CCTableView:create(CCSizeMake(400, 300))

	var_14_0:setPosition(200, 200)
	var_14_0:setViewSize(CCSizeMake(400, 350))
	var_14_0:setDirection(kCCScrollViewDirectionHorizontal)

	local function var_14_1(arg_15_0, arg_15_1)
		log.info("cell touched at : ", arg_15_1:getIdx() + 1)
		arg_14_0:createRightList(arg_15_1:getIdx() + 1)
	end

	local function var_14_2(arg_16_0, arg_16_1)
		return 180, 320
	end

	local function var_14_3(arg_17_0, arg_17_1)
		local var_17_0 = arg_17_0:dequeueCell()

		if var_17_0 then
			var_17_0:removeAllChildrenWithCleanup(true)
		else
			var_17_0 = CCTableViewCell:new()
		end

		local var_17_1 = CCSprite:create("res/ui/activity/goldActivity/gphb_left_bg.png")

		var_17_1:setAnchorPoint(CCPointMake(0, 0))
		var_17_1:setPosition(CCPointMake(0, 0))
		var_17_0:addChild(var_17_1)

		local var_17_2 = CCLabelTTF:create(language.get(135784, arg_14_1.redBags[arg_17_1 + 1].owner), "", 24)

		var_17_2:setAnchorPoint(CCPointMake(0, 0))
		var_17_2:setColor(var_0_4)
		var_17_2:setPosition(50, 125)

		local var_17_3 = CCLabelTTF:create(language.get(135785, arg_14_1.redBags[arg_17_1 + 1].remainGold), "", 24)

		var_17_3:setAnchorPoint(CCPointMake(0, 0))
		var_17_3:setPosition(50, 80)

		local var_17_4 = CCLabelTTF:create(language.get(135786, arg_14_1.redBags[arg_17_1 + 1].remainNum), "", 24)

		var_17_4:setAnchorPoint(CCPointMake(0, 0))
		var_17_4:setPosition(50, 35)
		var_17_0:addChild(var_17_2)
		var_17_0:addChild(var_17_3)
		var_17_0:addChild(var_17_4)

		return var_17_0
	end

	local function var_14_4()
		if arg_14_1.redBags then
			return #arg_14_1.redBags
		else
			return 0
		end
	end

	var_14_0:registerScriptHandler(var_14_1, CCTableView.kTableCellTouched)
	var_14_0:registerScriptHandler(var_14_2, CCTableView.kTableCellSizeForIndex)
	var_14_0:registerScriptHandler(var_14_3, CCTableView.kTableCellSizeAtIndex)
	var_14_0:registerScriptHandler(var_14_4, CCTableView.kNumberOfCellsInTableView)
	var_14_0:reloadData()
	arg_14_0.view.widgets.view2:addChild(var_14_0)

	if arg_14_0.tableView then
		arg_14_0.tableView:removeFromParentAndCleanup(true)
	end

	arg_14_0.tableView = var_14_0

	arg_14_0:createRightList(1)
end

function var_0_11.backToFirst(arg_19_0)
	log.info("@@界面跳转到首界面@@")
	arg_19_0.view.widgets.view1:setVisible(true)
	arg_19_0.view.widgets.view2:setVisible(false)
end

function var_0_11.showTip(arg_20_0, arg_20_1)
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

	uiutil.initWidgets(var_20_3, var_0_11.tipFrame)
	var_20_0:addChild(var_20_3.widgets.tipFrame)

	local var_20_4, var_20_5 = tool.getPositionInScreen(arg_20_0.view.widgets["btn_redBag" .. arg_20_1])
	local var_20_6 = var_20_4 - 80
	local var_20_7 = var_20_5 - 130

	var_20_3.widgets.tipFrame:setAnchorPoint(ccp(0, 0))
	var_20_3.widgets.tipMsg:setDimensions(CCSizeMake(150, 0))
	var_20_3.widgets.tipMsg:setString(language.get(135783, arg_20_0.info.bonus[arg_20_1].needGold, arg_20_0.info.bonus[arg_20_1].bonusGold, arg_20_0.info.bonus[arg_20_1].rewardBagNum))

	local var_20_8 = var_20_3.widgets.tipMsg:getContentSize().width
	local var_20_9 = var_20_3.widgets.tipMsg:getContentSize().height

	var_20_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_20_8, var_20_9 + 20))
	var_20_3.widgets.tipFrame:setPosition(ccp(var_20_6, var_20_7))
	var_20_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_20_3.widgets.tipFrame:setVisible(true)
end

function var_0_11.onGetReward(arg_22_0, arg_22_1)
	if arg_22_0.recNode then
		arg_22_0.recNode:removeAllChildrenWithCleanup(true)
	else
		arg_22_0.recNode = CCNode:create()

		arg_22_0.view.widgets.panel:addChild(arg_22_0.recNode)
	end

	arg_22_0:addMask(var_0_7)
	arg_22_0.view.widgets.btn_recGold:setOpacity(0)
	arg_22_0.view.widgets.btn_recGold:setVisible(true)
	arg_22_0.view.widgets.btn_recGold:addHandleOfControlEvent(function()
		arg_22_0:recGold(arg_22_1)
	end, CCControlEventTouchUpInside)
end

function var_0_11.recGold(arg_24_0, arg_24_1)
	local function var_24_0(arg_25_0)
		local var_25_0 = arg_25_0.action.data
		local var_25_1 = {
			{}
		}

		var_25_1[1].id = 19
		var_25_1[1].value = var_25_0.bonusGold

		globalAction_gotResource(var_25_1)
		arg_24_0:refresh()
	end

	cmgr.sendRequest(var_24_0, actions.sendRedBag, arg_24_1)
end

function var_0_11.openBag(arg_26_0, arg_26_1)
	if arg_26_0.recNode then
		arg_26_0.recNode:removeAllChildrenWithCleanup(true)
	else
		arg_26_0.recNode = CCNode:create()

		arg_26_0.view.widgets.panel:addChild(arg_26_0.recNode)
	end

	arg_26_0:addMask(var_0_7)
	arg_26_0.view.widgets.btn_recGold:setVisible(false)
	arg_26_0.view.widgets.btn_openBag:setOpacity(0)
	arg_26_0.view.widgets.btn_openBag:setVisible(true)
	arg_26_0.view.widgets.open:setVisible(false)
	arg_26_0.view.widgets.openRedBagNum:setString(language.get(135780, arg_26_0.info.remainOwnBagNum))
	arg_26_0.view.widgets.btn_openBag:addHandleOfControlEvent(function()
		arg_26_0:openBagNum(arg_26_1)
	end, CCControlEventTouchUpInside)
end

function var_0_11.openBagNum(arg_28_0, arg_28_1)
	local function var_28_0(arg_29_0)
		arg_28_0.view.widgets.open:setVisible(true)

		local var_29_0 = arg_29_0.action.data
		local var_29_1 = {
			{}
		}

		var_29_1[1].id = 19
		var_29_1[1].value = var_29_0.redBagGold

		globalAction_gotResource(var_29_1)
		arg_28_0:refresh()
	end

	cmgr.sendRequest(var_28_0, actions.recvOwnRedBag)
end

function var_0_11.sendBag(arg_30_0, arg_30_1)
	if arg_30_0.recNode then
		arg_30_0.recNode:removeAllChildrenWithCleanup(true)
	else
		arg_30_0.recNode = CCNode:create()

		arg_30_0.view.widgets.panel:addChild(arg_30_0.recNode)
	end

	arg_30_0:addMask(var_0_7)
	arg_30_0.view.widgets.btn_openBag:setVisible(false)
	arg_30_0.view.widgets.btn_sendRedBag:setOpacity(0)
	arg_30_0.view.widgets.btn_sendRedBag:setVisible(true)
	arg_30_0.view.widgets.sendRedBag:addHandleOfControlEvent(function()
		arg_30_0:sendBagNum(arg_30_1)
	end, CCControlEventTouchUpInside)
end

function var_0_11.sendBagNum(arg_32_0, arg_32_1)
	local function var_32_0(arg_33_0)
		local var_33_0 = arg_33_0.action.data

		arg_32_0.view.widgets.btn_sendRedBag:setVisible(false)
		arg_32_0.view.widgets.Word:setVisible(true)

		local var_33_1 = CCArray:create()

		var_33_1:addObject(CCDelayTime:create(1))
		var_33_1:addObject(CCCallFuncN:create(function()
			arg_32_0.view.widgets.Word:setVisible(false)
		end))

		local var_33_2 = CCSequence:create(var_33_1)

		arg_32_0.view.widgets.Word:runAction(var_33_2)

		local var_33_3 = {}

		arg_32_0:refresh()
	end

	cmgr.sendRequest(var_32_0, actions.deliverRedBag, arg_32_1)
end

function var_0_11.showPanel(arg_35_0, arg_35_1)
	arg_35_0.info = arg_35_1

	local var_35_0 = arg_35_1.currGold
	local var_35_1 = 0
	local var_35_2 = false
	local var_35_3 = 0
	local var_35_4 = 0
	local var_35_5 = 0
	local var_35_6 = arg_35_0.view.widgets.btn_redBag1:getContentSize()

	for iter_35_0 = 1, #arg_35_1.bonus do
		arg_35_0.view.widgets["goldNum" .. iter_35_0]:setString(language.get(20028, arg_35_1.bonus[iter_35_0].needGold))

		if var_35_2 == false and var_35_0 < arg_35_1.bonus[iter_35_0].needGold then
			var_35_1 = arg_35_1.bonus[iter_35_0].needGold - var_35_0
			var_35_2 = true
			var_35_3 = var_35_3 + (var_35_0 - var_35_4) / (arg_35_1.bonus[iter_35_0].needGold - var_35_4) * ((var_0_9[iter_35_0] - var_35_5) / (var_0_9[#var_0_9] / 100))
		elseif var_35_0 >= arg_35_1.bonus[iter_35_0].needGold then
			var_35_3 = var_35_3 + (var_0_9[iter_35_0] - var_35_5) / (var_0_9[#var_0_9] / 100)

			local var_35_7 = CCArray:create()

			var_35_7:addObject(CCMoveBy:create(0.1, ccp(5, 0)))
			var_35_7:addObject(CCMoveBy:create(0.1, ccp(-5, 0)))
			var_35_7:addObject(CCMoveBy:create(0.1, ccp(5, 0)))
			var_35_7:addObject(CCMoveBy:create(0.1, ccp(-5, 0)))
			var_35_7:addObject(CCDelayTime:create(0.5))

			local var_35_8 = CCSequence:create(var_35_7)

			arg_35_0.view.widgets["btn_redBag" .. iter_35_0]:runAction(CCRepeatForever:create(var_35_8))
		end

		var_35_4 = arg_35_1.bonus[iter_35_0].needGold
		var_35_5 = var_0_9[iter_35_0]

		if arg_35_1.bonus[iter_35_0].hasOpen == true then
			arg_35_0.view.widgets["yilingqu" .. iter_35_0]:setVisible(true)
			arg_35_0.view.widgets["btn_redBag" .. iter_35_0]:stopAllActions()
			tool.spriteToGray(arg_35_0.view.widgets["redBag" .. iter_35_0])
		else
			arg_35_0.view.widgets["yilingqu" .. iter_35_0]:setVisible(false)
		end
	end

	arg_35_0.view.widgets.nextGold:setString(language.get(20028, var_35_1))
	arg_35_0.view.widgets.nextGold:setVisible(true)
	arg_35_0.view.widgets.jdt_loading:setPercentage(var_35_3)

	if arg_35_1.currId > 0 then
		if arg_35_1.bonus[arg_35_1.currId].hasReceived == false then
			arg_35_0:onGetReward(arg_35_1.currId)
		elseif arg_35_1.remainOwnBagNum > 0 then
			arg_35_0:addMask(var_0_8)
			arg_35_0:openBag(arg_35_0.info.bonus[arg_35_1.currId].id)
		elseif arg_35_1.bonus[arg_35_1.currId].hasOpen == false then
			arg_35_0:addMask(var_0_8)
			arg_35_0:sendBag(arg_35_0.info.bonus[arg_35_1.currId].id)
		end
	else
		arg_35_0:addMask(var_0_8)
		arg_35_0.view.widgets.btn_recGold:setVisible(false)
		arg_35_0.view.widgets.btn_openBag:setVisible(false)
		arg_35_0.view.widgets.btn_sendRedBag:setVisible(false)
	end

	if arg_35_0.info.hasSentBag == true then
		arg_35_0.view.widgets.btn_rec:setVisible(true)
	end
end

function var_0_11.addMask(arg_36_0, arg_36_1)
	if arg_36_0.maskNode then
		arg_36_0.maskNode:removeAllChildrenWithCleanup(true)
	else
		arg_36_0.maskNode = CCNode:create()

		arg_36_0.view.widgets.panel:addChild(arg_36_0.maskNode, 10)
	end

	if arg_36_1 == var_0_6 then
		local var_36_0 = CCLayerColor:create(ccc4(0, 0, 0, 180), 960, 353)

		var_36_0:setPosition(ccp(0, 118))
		arg_36_0.maskNode:addChild(var_36_0)
	elseif arg_36_1 == var_0_7 then
		local var_36_1 = CCLayerColor:create(ccc4(0, 0, 0, 180), 960, 526)

		var_36_1:setPosition(ccp(0, 27))
		arg_36_0.maskNode:addChild(var_36_1)
	elseif arg_36_1 == var_0_5 then
		local var_36_2 = CCLayerColor:create(ccc4(0, 0, 0, 180), 960, 74)

		var_36_2:setPosition(ccp(0, 253))
		arg_36_0.maskNode:addChild(var_36_2)

		local var_36_3 = CCLayerColor:create(ccc4(0, 0, 0, 180), 960, 100)

		var_36_3:setPosition(ccp(0, 240))
		arg_36_0.maskNode:addChild(var_36_3)
	end

	local var_36_4 = arg_36_1 == var_0_8

	arg_36_0.view.widgets.btn_rec:setEnabled(var_36_4)
	arg_36_0.view.widgets.actPay:setEnabled(var_36_4)

	for iter_36_0 = 1, 7 do
		arg_36_0.view.widgets["btn_redBag" .. iter_36_0]:setEnabled(var_36_4)
	end

	if arg_36_0.maskLayer then
		arg_36_0.maskLayer:setTouchEnabled(var_36_4)
	end
end

return var_0_11
