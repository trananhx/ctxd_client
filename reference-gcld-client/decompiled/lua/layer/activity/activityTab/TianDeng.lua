local var_0_0 = require("res/native/offset").get("layer.activity.tianDeng.tianDengTab")
local var_0_1 = {
	y = 0,
	name = "Layer",
	type = "layer",
	x = 0,
	children = {
		{
			name = "bg1",
			type = "sprite",
			x = visibleSize.width / 2,
			y = visibleSize.height / 2 - 30,
			pic = {
				path = "res/ui/comment/bg1.jpg"
			},
			children = {
				{
					style = "button_tip",
					name = "btn_tip",
					y = 480,
					type = "button",
					x = 860
				},
				{
					y = 492.9148,
					name = "tdxy_title",
					type = "sprite",
					x = 457.6658,
					pic = {
						path = "res/ui/activity/tiandeng/tdxy_title.png"
					}
				},
				{
					name = "leftTime",
					text = "剩余2天",
					type = "label",
					y = 481.562,
					fontSize = 30 + (var_0_0.timeLeftSz or 0),
					halign = kCCTextAlignmentLeft,
					valign = kCCVerticalTextAlignmentBottom,
					x = 680.7704 + (var_0_0.timeLeftX or 0)
				},
				{
					y = 2,
					name = "view",
					type = "scrollview",
					x = 3,
					viewSize = CCSizeMake(909, 454)
				},
				{
					y = 454.1667,
					name = "qtmh_up_line",
					type = "sprite",
					x = 457.5,
					pic = {
						path = "res/ui/activity/sevenCatch/qtmh_up_line.png"
					}
				},
				{
					y = 67.5425,
					name = "ytqne_line_list",
					type = "sprite",
					x = 194.0708,
					pic = {
						path = "res/ui/activity/tiandeng/ytqne_line_list.png"
					},
					children = {
						{
							y = 33.9994,
							name = "desc",
							x = 174.9998,
							type = "node"
						}
					}
				},
				{
					y = 19.59,
					name = "notice",
					type = "sprite",
					x = 457.5,
					pic = {
						path = "res/ui/activity/tiandeng/ytqne_line_top.png"
					},
					children = {
						{
							y = 0,
							name = "noticeScrollView",
							type = "scrollview",
							x = 0,
							viewSize = CCSizeMake(909, 41)
						}
					}
				},
				{
					y = 0,
					name = "flyLayer",
					type = "layer",
					x = 0,
					children = {
						{
							name = "myLight",
							h = 244,
							type = "button",
							w = 245,
							y = 286.1986,
							x = 434.2867,
							normal = {
								path = "res/ui/activity/tiandeng/tdxy_lantern_01.png"
							},
							touched = {
								path = "res/ui/activity/tiandeng/tdxy_lantern_01.png"
							},
							children = {
								{
									y = 122,
									name = "fire",
									type = "sprite",
									x = 122.5,
									pic = {
										path = "res/ui/activity/tiandeng/tdxy_lantern_02.png"
									}
								},
								{
									y = 92.1441,
									name = "line",
									type = "sprite",
									x = 127.7142,
									pic = {
										path = "res/ui/activity/tiandeng/tdxy_lantern_sdx.png"
									}
								}
							}
						},
						{
							y = 243.93,
							name = "tdxy_pb_bg",
							type = "sprite",
							x = 782.66,
							zorder = 10,
							pic = {
								path = "res/ui/activity/tiandeng/tdxy_pb_bg.png"
							},
							children = {
								{
									y = 179.7779,
									name = "progress",
									type = "progressbar",
									x = 14.5556,
									pic = {
										path = "res/ui/activity/tiandeng/tdxy_pb.png"
									},
									children = {
										{
											y = 0,
											name = "heightTips",
											type = "sprite",
											x = -104,
											pic = {
												path = "res/ui/activity/tiandeng/tdxy_height_tips.png"
											},
											children = {
												{
													fontSize = 20,
													name = "currentHeight",
													text = "Text Label",
													type = "label",
													y = 17.4615,
													x = 96.1563,
													halign = kCCTextAlignmentLeft,
													valign = kCCVerticalTextAlignmentBottom
												}
											}
										},
										{
											y = 68.6,
											name = "tdxy_pb_line_Copy",
											type = "sprite",
											x = 8.5,
											pic = {
												path = "res/ui/activity/tiandeng/tdxy_pb_line.png"
											}
										},
										{
											y = 137.2,
											name = "tdxy_pb_line_Copy_0",
											type = "sprite",
											x = 8.5,
											pic = {
												path = "res/ui/activity/tiandeng/tdxy_pb_line.png"
											}
										},
										{
											y = 205.8,
											name = "tdxy_pb_line_Copy_1",
											type = "sprite",
											x = 8.5,
											pic = {
												path = "res/ui/activity/tiandeng/tdxy_pb_line.png"
											}
										},
										{
											y = 274.4,
											name = "tdxy_pb_line_Copy_2",
											type = "sprite",
											x = 8.5,
											pic = {
												path = "res/ui/activity/tiandeng/tdxy_pb_line.png"
											}
										},
										{
											y = 68.6,
											name = "tips1",
											type = "sprite",
											x = 74.9999,
											pic = {
												path = "res/ui/activity/tiandeng/tdxy_reward_tips.png"
											},
											children = {
												{
													y = 18,
													name = "tdxy_word_jl",
													type = "sprite",
													x = 41,
													pic = {
														path = "res/ui/activity/tiandeng/tdxy_word_jl.png"
													}
												},
												{
													fontSize = 24,
													name = "height1",
													type = "label",
													text = "6000米",
													y = 45,
													x = 21,
													halign = kCCTextAlignmentLeft,
													valign = kCCVerticalTextAlignmentBottom,
													anchorPoint = ccp(0, 0.5)
												},
												{
													y = 18,
													name = "mult1",
													x = 84,
													type = "node"
												},
												{
													y = 18,
													name = "tdxy_digit_c_Copy_0",
													type = "sprite",
													x = 72,
													pic = {
														path = "res/ui/activity/tiandeng/tdxy_digit_c.png"
													}
												}
											}
										},
										{
											y = 137.2,
											name = "tips2",
											type = "sprite",
											x = 74.9999,
											pic = {
												path = "res/ui/activity/tiandeng/tdxy_reward_tips.png"
											},
											children = {
												{
													y = 18,
													name = "tdxy_word_jl_Copy",
													type = "sprite",
													x = 41,
													pic = {
														path = "res/ui/activity/tiandeng/tdxy_word_jl.png"
													}
												},
												{
													y = 18,
													name = "mult2",
													x = 84,
													type = "node"
												},
												{
													fontSize = 24,
													name = "height2",
													type = "label",
													text = "6000米",
													y = 45,
													x = 21,
													halign = kCCTextAlignmentLeft,
													valign = kCCVerticalTextAlignmentBottom,
													anchorPoint = ccp(0, 0.5)
												},
												{
													y = 18,
													name = "tdxy_digit_c_Copy_1",
													type = "sprite",
													x = 72,
													pic = {
														path = "res/ui/activity/tiandeng/tdxy_digit_c.png"
													}
												}
											}
										},
										{
											y = 205.8,
											name = "tips3",
											type = "sprite",
											x = 74.9999,
											pic = {
												path = "res/ui/activity/tiandeng/tdxy_reward_tips.png"
											},
											children = {
												{
													y = 18,
													name = "tdxy_word_jl_Copy_0",
													type = "sprite",
													x = 41,
													pic = {
														path = "res/ui/activity/tiandeng/tdxy_word_jl.png"
													}
												},
												{
													fontSize = 24,
													name = "height3",
													type = "label",
													text = "6000米",
													y = 45,
													x = 21,
													halign = kCCTextAlignmentLeft,
													valign = kCCVerticalTextAlignmentBottom,
													anchorPoint = ccp(0, 0.5)
												},
												{
													y = 18,
													name = "tdxy_digit_c_Copy_2",
													type = "sprite",
													x = 72,
													pic = {
														path = "res/ui/activity/tiandeng/tdxy_digit_c.png"
													}
												},
												{
													y = 18,
													name = "mult3",
													x = 84,
													type = "node"
												}
											}
										},
										{
											y = 274.4,
											name = "tips4",
											type = "sprite",
											x = 74.9999,
											pic = {
												path = "res/ui/activity/tiandeng/tdxy_reward_tips.png"
											},
											children = {
												{
													y = 18,
													name = "tdxy_word_jl_Copy_1",
													type = "sprite",
													x = 41,
													pic = {
														path = "res/ui/activity/tiandeng/tdxy_word_jl.png"
													}
												},
												{
													fontSize = 24,
													name = "height4",
													type = "label",
													text = "6000米",
													y = 45,
													x = 21,
													halign = kCCTextAlignmentLeft,
													valign = kCCVerticalTextAlignmentBottom,
													anchorPoint = ccp(0, 0.5)
												},
												{
													y = 18,
													name = "tdxy_digit_c_Copy",
													type = "sprite",
													x = 72,
													pic = {
														path = "res/ui/activity/tiandeng/tdxy_digit_c.png"
													}
												},
												{
													y = 18,
													name = "mult4",
													x = 84,
													type = "node"
												}
											}
										},
										{
											y = 343,
											name = "tips5",
											type = "sprite",
											x = 74.9999,
											pic = {
												path = "res/ui/activity/tiandeng/tdxy_reward_tips.png"
											},
											children = {
												{
													y = 18,
													name = "tdxy_word_jl_Copy_2",
													type = "sprite",
													x = 41,
													pic = {
														path = "res/ui/activity/tiandeng/tdxy_word_jl.png"
													}
												},
												{
													fontSize = 24,
													name = "height5",
													type = "label",
													text = "6000米",
													y = 45,
													x = 21,
													halign = kCCTextAlignmentLeft,
													valign = kCCVerticalTextAlignmentBottom,
													anchorPoint = ccp(0, 0.5)
												},
												{
													y = 18,
													name = "tdxy_digit_c",
													type = "sprite",
													x = 72,
													pic = {
														path = "res/ui/activity/tiandeng/tdxy_digit_c.png"
													}
												},
												{
													y = 18,
													name = "mult5",
													x = 84,
													type = "node"
												}
											}
										}
									}
								}
							}
						},
						{
							y = 285.4969,
							name = "arrow",
							type = "sprite",
							x = 213.4971,
							pic = {
								path = "res/ui/activity/goldActivity/myRedBag/wdhb_arrows.png"
							},
							children = {
								{
									fontSize = 20,
									name = "arrowDesc",
									type = "label",
									y = 60.8333,
									x = 144.6666,
									textId = 135916,
									halign = kCCTextAlignmentLeft,
									valign = kCCVerticalTextAlignmentBottom
								},
								{
									y = -68.8123,
									name = "tdxy_word_ffh",
									type = "sprite",
									x = 359.6529 + (var_0_0.tdxy_wordX or 0),
									pic = {
										path = "res/ui/activity/tiandeng/tdxy_word_ffh.png"
									}
								}
							}
						}
					}
				},
				{
					y = 0,
					name = "rewardLayer",
					visible = false,
					type = "layer",
					x = 0,
					children = {
						{
							name = "selfAward",
							h = 267,
							type = "button",
							w = 261,
							y = 278.3334,
							x = 255.2933,
							normal = {
								path = "res/ui/activity/tiandeng/tdxy_star01.png"
							},
							touched = {
								path = "res/ui/activity/tiandeng/tdxy_star01.png"
							},
							children = {
								{
									y = 62.2849,
									name = "tdxy_ranking_line",
									type = "sprite",
									x = 100.0108,
									pic = {
										path = "res/ui/activity/tiandeng/tdxy_ranking_line.png"
									},
									children = {
										{
											fontSize = 20,
											name = "mylightText",
											type = "label",
											textId = 135910,
											y = 20.0239,
											x = 144.0585,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom,
											anchorPoint = ccp(1, 0.5)
										},
										{
											fontSize = 20,
											name = "myheight",
											type = "label",
											text = "Text Label",
											y = 20.0239,
											x = 174.0585,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom,
											anchorPoint = ccp(0, 0.5)
										}
									}
								},
								{
									name = "getMyAward",
									h = 267,
									type = "button",
									w = 261,
									scaleY = 0.5,
									y = 128.3337,
									scaleX = 0.5,
									x = 127.4979,
									normal = {
										path = "res/ui/activity/tiandeng/tdxy_star01.png"
									},
									touched = {
										path = "res/ui/activity/tiandeng/tdxy_star01.png"
									}
								},
								{
									y = 144.2862,
									name = "awardArrow",
									type = "sprite",
									x = -88.5713,
									pic = {
										path = "res/ui/activity/goldActivity/myRedBag/wdhb_arrows.png"
									},
									children = {
										{
											fontSize = 20,
											name = "awardArrowText",
											type = "label",
											y = 60.8333,
											x = 144.6666,
											textId = 135917,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								}
							}
						},
						{
							name = "award1",
							h = 267,
							type = "button",
							w = 261,
							y = 398.7501,
							x = 561.9591,
							normal = {
								path = "res/ui/activity/tiandeng/tdxy_star02.png"
							},
							touched = {
								path = "res/ui/activity/tiandeng/tdxy_star03.png"
							},
							children = {
								{
									y = 77.2849,
									name = "tdxy_ranking_line_Copy",
									type = "sprite",
									x = 76.6774,
									pic = {
										path = "res/ui/activity/tiandeng/tdxy_ranking_line_samll.png"
									},
									children = {
										{
											fontSize = 20,
											name = "one",
											type = "label",
											textId = 135911,
											y = 17.5239,
											x = 129.0585,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom,
											anchorPoint = ccp(1, 0.5)
										},
										{
											fontSize = 20,
											name = "name1",
											type = "label",
											text = "Text Label",
											y = 17.5239,
											x = 148.4335,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom,
											anchorPoint = ccp(0, 0.5)
										}
									}
								},
								{
									name = "getAward1",
									h = 267,
									type = "button",
									w = 261,
									scaleY = 0.43,
									y = 132.0837,
									scaleX = 0.44,
									x = 121.2464,
									normal = {
										path = "res/ui/activity/tiandeng/tdxy_star01.png"
									},
									touched = {
										path = "res/ui/activity/tiandeng/tdxy_star01.png"
									}
								},
								{
									y = 144.2862,
									name = "awardArrow1",
									type = "sprite",
									x = -88.5713,
									pic = {
										path = "res/ui/activity/goldActivity/myRedBag/wdhb_arrows.png"
									},
									children = {
										{
											fontSize = 20,
											name = "awardArrowText",
											type = "label",
											y = 60.8333,
											x = 144.6666,
											textId = 135917,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								}
							}
						},
						{
							name = "award2",
							h = 267,
							type = "button",
							w = 261,
							y = 286.6665,
							x = 744.0472,
							normal = {
								path = "res/ui/activity/tiandeng/tdxy_star03.png"
							},
							touched = {
								path = "res/ui/activity/tiandeng/tdxy_star04.png"
							},
							children = {
								{
									y = 80.0626,
									name = "tdxy_ranking_line_Copy",
									type = "sprite",
									x = 76.6769,
									pic = {
										path = "res/ui/activity/tiandeng/tdxy_ranking_line_samll.png"
									},
									children = {
										{
											fontSize = 20,
											name = "two",
											type = "label",
											textId = 135912,
											y = 17.8017,
											x = 116.2816,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom,
											anchorPoint = ccp(1, 0.5)
										},
										{
											fontSize = 20,
											name = "name2",
											type = "label",
											text = "Text Label",
											y = 18.9128,
											x = 149.6143,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom,
											anchorPoint = ccp(0, 0.5)
										}
									}
								},
								{
									name = "getAward2",
									h = 267,
									type = "button",
									w = 261,
									scaleY = 0.4,
									y = 135.8341,
									scaleX = 0.44,
									x = 122.4977,
									normal = {
										path = "res/ui/activity/tiandeng/tdxy_star01.png"
									},
									touched = {
										path = "res/ui/activity/tiandeng/tdxy_star01.png"
									}
								},
								{
									y = 144.2862,
									name = "awardArrow2",
									type = "sprite",
									x = -88.5713,
									pic = {
										path = "res/ui/activity/goldActivity/myRedBag/wdhb_arrows.png"
									},
									children = {
										{
											fontSize = 20,
											name = "awardArrowText",
											type = "label",
											y = 60.8333,
											x = 144.6666,
											textId = 135917,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								}
							}
						},
						{
							name = "award3",
							h = 267,
							type = "button",
							w = 261,
							y = 150.9724,
							x = 670.579,
							normal = {
								path = "res/ui/activity/tiandeng/tdxy_star04.png"
							},
							touched = {
								path = "res/ui/activity/tiandeng/tdxy_star04.png"
							},
							children = {
								{
									y = 83.3958,
									name = "tdxy_ranking_line_Copy",
									type = "sprite",
									x = 82.2329,
									pic = {
										path = "res/ui/activity/tiandeng/tdxy_ranking_line_samll.png"
									},
									children = {
										{
											fontSize = 20,
											name = "three",
											type = "label",
											textId = 135913,
											y = 16.5794,
											x = 116.2803,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom,
											anchorPoint = ccp(1, 0.5)
										},
										{
											fontSize = 20,
											name = "name3",
											type = "label",
											text = "Text Label",
											y = 16.6905,
											x = 148.5027,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom,
											anchorPoint = ccp(0, 0.5)
										}
									}
								},
								{
									name = "getAward3",
									h = 267,
									type = "button",
									w = 261,
									scaleY = 0.4,
									y = 132.5004,
									scaleX = 0.4,
									x = 121.6653,
									normal = {
										path = "res/ui/activity/tiandeng/tdxy_star01.png"
									},
									touched = {
										path = "res/ui/activity/tiandeng/tdxy_star01.png"
									}
								},
								{
									y = 144.2862,
									name = "awardArrow3",
									type = "sprite",
									x = -88.5713,
									pic = {
										path = "res/ui/activity/goldActivity/myRedBag/wdhb_arrows.png"
									},
									children = {
										{
											fontSize = 20,
											name = "awardArrowText",
											type = "label",
											y = 60.8333,
											x = 144.6666,
											textId = 135917,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}
local var_0_2 = {
	ccp(234, 402),
	ccp(585, 381),
	ccp(98, 365),
	ccp(725, 355),
	ccp(234, 266),
	ccp(628, 257),
	ccp(74, 206),
	ccp(580, 168),
	ccp(216, 144),
	ccp(719, 233)
}
local var_0_3 = class("TianDeng", function()
	return createBaseLayer()
end)

function var_0_3.ctor(arg_2_0, arg_2_1)
	arg_2_0._runingLabels = {}
	arg_2_0._texts = {}

	arg_2_0:init(arg_2_1)
end

function var_0_3.initLayout(arg_3_0)
	arg_3_0._layoutNode:getWidget("progress"):setMidpoint(CCPointMake(0.5, 0))
	arg_3_0._layoutNode:getWidget("progress"):setBarChangeRate(CCPointMake(0, 1))

	for iter_3_0 = 1, 5 do
		local var_3_0 = CCLabelAtlas:create(iter_3_0, "res/ui/common/number/lm_tit_num.png", 22, 32, 48)

		arg_3_0["_mult" .. iter_3_0] = var_3_0

		var_3_0:setAnchorPoint(ccp(0, 0.5))
		arg_3_0._layoutNode:getWidget("mult" .. iter_3_0):addChild(var_3_0)
	end

	arg_3_0._layoutNode:getWidget("fire"):setOpacity(0)

	arg_3_0._contains = arg_3_0._layoutNode:getWidget("view"):getContainer()
	arg_3_0._city = CCSprite:create("res/ui/activity/tiandeng/tdxy_bg_01.png")

	arg_3_0._city:ignoreAnchorPointForPosition(true)
	arg_3_0._contains:addChild(arg_3_0._city, 1)

	arg_3_0._bg1 = CCSprite:create("res/ui/activity/tiandeng/tdxy_bg_02.jpg")

	arg_3_0._bg1:ignoreAnchorPointForPosition(true)
	arg_3_0._bg1:setPosition(ccp(0, 0))

	arg_3_0._bg2 = CCSprite:create("res/ui/activity/tiandeng/tdxy_bg_03.jpg")

	arg_3_0._bg2:ignoreAnchorPointForPosition(true)
	arg_3_0._bg2:setPosition(ccp(0, 409))

	arg_3_0._bg3 = CCSprite:create("res/ui/activity/tiandeng/tdxy_bg_02.jpg")

	arg_3_0._bg3:ignoreAnchorPointForPosition(true)
	arg_3_0._bg3:setPosition(ccp(0, 818))

	arg_3_0._bg4 = CCSprite:create("res/ui/activity/tiandeng/tdxy_bg_03.jpg")

	arg_3_0._bg4:ignoreAnchorPointForPosition(true)
	arg_3_0._bg4:setPosition(ccp(0, 1227))
	arg_3_0._contains:addChild(arg_3_0._bg1)
	arg_3_0._contains:addChild(arg_3_0._bg2)
	arg_3_0._contains:addChild(arg_3_0._bg3)
	arg_3_0._contains:addChild(arg_3_0._bg4)
	arg_3_0._layoutNode:getWidget("line"):setOpacity(0)
	arg_3_0._layoutNode:getWidget("myLight"):addHandleOfControlEvent(function(...)
		arg_3_0:flyLantern()
	end, CCControlEventTouchUpInside)
	arg_3_0._layoutNode:getWidget("noticeScrollView"):setTouchEnabled(false)
	arg_3_0._layoutNode:getWidget("view"):setTouchEnabled(false)
	arg_3_0._layoutNode:getWidget("selfAward"):setEnabled(false)
	arg_3_0._layoutNode:getWidget("award1"):setEnabled(false)
	arg_3_0._layoutNode:getWidget("award2"):setEnabled(false)
	arg_3_0._layoutNode:getWidget("award3"):setEnabled(false)
	arg_3_0._layoutNode:getWidget("getMyAward"):addHandleOfControlEvent(handler(arg_3_0, arg_3_0.getMyAward), CCControlEventTouchUpInside)
	arg_3_0._layoutNode:getWidget("getAward1"):addHandleOfControlEvent(handler(arg_3_0, arg_3_0.getAward1), CCControlEventTouchUpInside)
	arg_3_0._layoutNode:getWidget("getAward2"):addHandleOfControlEvent(handler(arg_3_0, arg_3_0.getAward2), CCControlEventTouchUpInside)
	arg_3_0._layoutNode:getWidget("getAward3"):addHandleOfControlEvent(handler(arg_3_0, arg_3_0.getAward3), CCControlEventTouchUpInside)
	arg_3_0._layoutNode:getWidget("btn_tip"):addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_3_0:showTip()
	end, CCControlEventTouchUpInside)
end

function var_0_3.showTip(arg_6_0)
	log.info("should show tips ")

	local var_6_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_6_0:registerScriptTouchHandler(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == CCTOUCHBEGAN then
			return true
		elseif arg_7_0 == CCTOUCHMOVED then
			return true
		elseif arg_7_0 == CCTOUCHENDED then
			pcall(var_6_0.removeFromParentAndCleanup, var_6_0, true)

			return true
		end
	end, false, true)
	var_6_0:setTouchEnabled(true)
	arg_6_0:addChild(var_6_0, 60000)

	local var_6_1 = 0
	local var_6_2 = 0
	local var_6_3 = {
		name = "tipFrame",
		type = "sprite9",
		visible = true,
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
				textId = 135918,
				style = "label_warlock",
				width = 400,
				anchorPoint = ccp(0, 0),
				halign = kCCTextAlignmentLeft,
				color = color_whi
			}
		}
	}
	local var_6_4 = {}

	uiutil.initWidgets(var_6_4, var_6_3)
	var_6_0:addChild(var_6_4.widgets.tipFrame)

	local var_6_5, var_6_6 = tool.getPositionInScreen(arg_6_0._layoutNode:getWidget("btn_tip"))
	local var_6_7 = var_6_5 + 20
	local var_6_8 = var_6_6 - 20
	local var_6_9 = var_6_4.widgets.tipMsg:getContentSize().width
	local var_6_10 = var_6_4.widgets.tipMsg:getContentSize().height

	var_6_4.widgets.tipFrame:setPreferredSize(CCSizeMake(var_6_9 + 30, var_6_10 + 30))
	var_6_4.widgets.tipFrame:setPosition(ccp(var_6_7, var_6_8))
	var_6_4.widgets.tipMsg:setPosition(ccp(15, 15))
	var_6_4.widgets.tipFrame:setVisible(true)
end

function var_0_3.getMyAward(arg_8_0, ...)
	log.info("getMyAward")

	if arg_8_0.__data.canGetReward then
		cmgr.sendRequest(handler(arg_8_0, arg_8_0.getOthersRewardHandler), actions.getSelfReward)
	end
end

function var_0_3.getAward1(arg_9_0, ...)
	log.info("getAward1")
	arg_9_0:getOthersReward(1)
end

function var_0_3.getAward2(arg_10_0, ...)
	log.info("getAward2")
	arg_10_0:getOthersReward(2)
end

function var_0_3.getAward3(arg_11_0, ...)
	log.info("getAward3")
	arg_11_0:getOthersReward(3)
end

function var_0_3.getOthersReward(arg_12_0, arg_12_1)
	if arg_12_0.__data.max[arg_12_1].canGetReward then
		messageBox.confirm(language.get(135915, arg_12_0.__data.max[arg_12_1].cost), function()
			cmgr.sendRequest(handler(arg_12_0, arg_12_0.getOthersRewardHandler), actions.getOthersReward, arg_12_1)
		end)
	else
		cmgr.sendRequest(handler(arg_12_0, arg_12_0.getOthersRewardHandler), actions.getOthersReward, arg_12_1)
	end
end

function var_0_3.getOthersRewardHandler(arg_14_0, arg_14_1)
	local var_14_0 = {}
	local var_14_1 = 0

	for iter_14_0, iter_14_1 in pairs(arg_14_1.action.data.reward) do
		if iter_14_1.type == "chief_exp" then
			var_14_0[iter_14_0] = {}
			var_14_0[iter_14_0].id = 6
			var_14_0[iter_14_0].value = iter_14_1.value
		elseif iter_14_1.type == "food" then
			var_14_0[iter_14_0] = {}
			var_14_0[iter_14_0].id = 3
			var_14_0[iter_14_0].value = iter_14_1.value
		elseif iter_14_1.type == "iron" then
			var_14_0[iter_14_0] = {}
			var_14_0[iter_14_0].id = 4
			var_14_0[iter_14_0].value = iter_14_1.value
		elseif iter_14_1.type == "gem" then
			var_14_0[iter_14_0] = {}
			var_14_0[iter_14_0].id = 7
			var_14_0[iter_14_0].value = iter_14_1.value
		elseif iter_14_1.type == "silk" then
			var_14_0[iter_14_0] = {}
			var_14_0[iter_14_0].id = 55
			var_14_0[iter_14_0].value = iter_14_1.value
		end
	end

	globalAction_gotResource(var_14_0)
	cmgr.sendRequest(handler(arg_14_0, arg_14_0.getTianDengInfo), actions.getTianDengInfo)
end

function var_0_3.setPercent(arg_15_0)
	local var_15_0 = 0
	local var_15_1 = 0

	for iter_15_0 = 1, #arg_15_0.__data.jinLianTimes do
		arg_15_0.widgets["num" .. iter_15_0]:setString(language.get(135858, arg_15_0.__data.jinLianTimes[iter_15_0].times))

		if arg_15_0.__data.jinLianTimes[iter_15_0].times <= arg_15_0.__data.num then
			var_15_1 = var_15_1 + 100 / #arg_15_0.__data.jinLianTimes
		elseif iter_15_0 > 1 and arg_15_0.__data.jinLianTimes[iter_15_0].times > arg_15_0.__data.num and arg_15_0.__data.jinLianTimes[iter_15_0 - 1].times <= arg_15_0.__data.num then
			var_15_1 = var_15_1 + 100 / #arg_15_0.__data.jinLianTimes * (arg_15_0.__data.num - arg_15_0.__data.jinLianTimes[iter_15_0 - 1].times) / (arg_15_0.__data.jinLianTimes[iter_15_0].times - arg_15_0.__data.jinLianTimes[iter_15_0 - 1].times)
			var_15_0 = arg_15_0.__data.jinLianTimes[iter_15_0].times - arg_15_0.__data.num
		elseif iter_15_0 == 1 then
			var_15_1 = var_15_1 + 100 / #arg_15_0.__data.jinLianTimes * arg_15_0.__data.num / arg_15_0.__data.jinLianTimes[iter_15_0].times
			var_15_0 = arg_15_0.__data.jinLianTimes[iter_15_0].times - arg_15_0.__data.num
		end
	end

	if arg_15_0.__data.num >= arg_15_0.__data.jinLianTimes[#arg_15_0.__data.jinLianTimes].times then
		arg_15_0.widgets.needTimes:setVisible(false)
	else
		arg_15_0.widgets.needTimes:setVisible(true)
		arg_15_0.widgets.needTimes:setString(language.get(135857, var_15_0))
	end

	arg_15_0.widgets.progress:setPercentage(var_15_1)
end

function var_0_3.getPercent(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = 0

	for iter_16_0 = 1, #arg_16_1 do
		if arg_16_2 >= arg_16_1[iter_16_0] then
			var_16_0 = var_16_0 + 100 / #arg_16_1
		elseif iter_16_0 > 1 and arg_16_2 < arg_16_1[iter_16_0] and arg_16_2 >= arg_16_1[iter_16_0 - 1] then
			var_16_0 = var_16_0 + 100 / #arg_16_1 * (arg_16_2 - arg_16_1[iter_16_0 - 1]) / (arg_16_1[iter_16_0] - arg_16_1[iter_16_0 - 1])
		elseif iter_16_0 == 1 then
			var_16_0 = var_16_0 + 100 / #arg_16_1 * arg_16_2 / arg_16_1[iter_16_0]
		end
	end

	return var_16_0
end

function var_0_3.init(arg_17_0, arg_17_1)
	arg_17_0._layoutNode = LayoutNode.new()

	arg_17_0:addChild(arg_17_0._layoutNode)
	arg_17_0._layoutNode:setLoadFunc(handler(arg_17_0, arg_17_0.initLayout))
	arg_17_0._layoutNode:reload(var_0_1)
	arg_17_0:refreshPanel(arg_17_1)
end

function var_0_3.refreshPanel(arg_18_0, arg_18_1)
	if arg_18_1 then
		arg_18_0.__data = arg_18_1

		table.sort(arg_18_1.flag, function(arg_19_0, arg_19_1)
			return arg_19_0.flagElement < arg_19_1.flagElement
		end)

		local var_18_0 = {}

		for iter_18_0, iter_18_1 in ipairs(arg_18_1.flag) do
			var_18_0[iter_18_0] = iter_18_1.flagElement

			arg_18_0._layoutNode:getWidget("height" .. iter_18_0):setString(language.get(135906, iter_18_1.flagElement))
			arg_18_0["_mult" .. iter_18_0]:setString(iter_18_1.reward[1].value / arg_18_1.flag[1].reward[1].value)
		end

		local var_18_1 = arg_18_0:getPercent(var_18_0, arg_18_1.height or 0)

		arg_18_0._layoutNode:getWidget("progress"):setPercentage(var_18_1)
		arg_18_0._layoutNode:getWidget("currentHeight"):setString(language.get(135903, arg_18_1.height or 0))
		arg_18_0._layoutNode:getWidget("heightTips"):setPosition(-104, var_18_1 / 100 * arg_18_0._layoutNode:getWidget("progress"):getContentSize().height)
		arg_18_0._layoutNode:getWidget("desc"):removeAllChildrenWithCleanup(true)

		arg_18_0._texts = arg_18_1.broadcastInfo or {}

		arg_18_0._layoutNode:getWidget("myheight"):setString(language.get(135903, arg_18_1.height or 0))

		if not arg_18_1.isEnd then
			arg_18_0._layoutNode:getWidget("flyLayer"):setVisible(true)
			arg_18_0._layoutNode:getWidget("rewardLayer"):setVisible(false)
			arg_18_0._layoutNode:getWidget("ytqne_line_list"):setVisible(true)

			if arg_18_1.hasFlyed then
				if arg_18_1.canFlyed then
					if arg_18_0._releaseLantern then
						arg_18_0._releaseLantern = false

						arg_18_0._city:runAction(CCMoveTo:create(1, ccp(0, -200)))
					else
						arg_18_0._city:setPosition(ccp(0, -200))
					end

					arg_18_0:playLanternFlyAnimation()

					local var_18_2 = TimerLabelClass.new({
						fontSize = 18,
						font = "Thonburi",
						triggerTime = 0,
						labelType = "LabelStroke",
						time = arg_18_1.cd,
						format = language.get(135904) .. " @H:@M:@S",
						callback = function(...)
							cmgr.sendRequest(handler(arg_18_0, arg_18_0.getTianDengInfo), actions.getTianDengInfo)
						end
					})

					arg_18_0._layoutNode:getWidget("desc"):addChild(var_18_2)

					local var_18_3 = math.random(1, 10)
					local var_18_4 = {
						1,
						2,
						3,
						4,
						5,
						6,
						7,
						8,
						9,
						10
					}

					for iter_18_2, iter_18_3 in pairs(arg_18_1.otherLanterns or {}) do
						if #var_18_4 > 0 then
							local var_18_5 = arg_18_0:createOthersLantern(iter_18_3)
							local var_18_6 = math.random(1, #var_18_4)

							var_18_5:setPosition(ccp(var_0_2[var_18_4[var_18_6]].x, var_0_2[var_18_4[var_18_6]].y))
							table.remove(var_18_4, var_18_6)
							arg_18_0._layoutNode:getWidget("flyLayer"):addChild(var_18_5)
						end
					end
				else
					local var_18_7 = CCStrokeLabelTTF:create(language.get(135907), "Thonburi-Bold", 30, 1, ccc3(33, 29, 23))

					arg_18_0._layoutNode:getWidget("desc"):addChild(var_18_7)
				end

				arg_18_0._layoutNode:getWidget("arrow"):setVisible(false)
				arg_18_0._layoutNode:getWidget("myLight"):setEnabled(false)
			else
				arg_18_0._layoutNode:getWidget("arrow"):setVisible(true)
				arg_18_0._layoutNode:getWidget("myLight"):setEnabled(true)

				local var_18_8 = ""

				if arg_18_1.canFlyed then
					var_18_8 = language.get(135901)
				else
					var_18_8 = language.get(135902)
				end

				local var_18_9 = CCStrokeLabelTTF:create(var_18_8, "Thonburi-Bold", 30, 1, ccc3(33, 29, 23))

				arg_18_0._layoutNode:getWidget("desc"):addChild(var_18_9)
			end
		else
			arg_18_0:stopSkyAnimation()
			arg_18_0._layoutNode:getWidget("flyLayer"):setVisible(false)
			arg_18_0._layoutNode:getWidget("rewardLayer"):setVisible(true)
			arg_18_0._layoutNode:getWidget("ytqne_line_list"):setVisible(false)
			arg_18_0._layoutNode:getWidget("awardArrow"):setVisible(arg_18_1.canGetReward)

			for iter_18_4 = 1, 3 do
				if arg_18_1.max[iter_18_4] then
					arg_18_0._layoutNode:getWidget("awardArrow" .. iter_18_4):setVisible(arg_18_1.max[iter_18_4].canGetReward)
					arg_18_0._layoutNode:getWidget("award" .. iter_18_4):setVisible(true)
					arg_18_0._layoutNode:getWidget("name" .. iter_18_4):setString(language.get(135914, arg_18_1.max[iter_18_4].playerName, arg_18_1.max[iter_18_4].height))
				else
					arg_18_0._layoutNode:getWidget("award" .. iter_18_4):setVisible(false)
				end
			end
		end
	end
end

function var_0_3.playReleaseLantern(arg_21_0)
	arg_21_0._city:runAction(CCMoveTo:create(0.5, ccp(0, -100)))
	arg_21_0:playLanternFlyAnimation()
	arg_21_0:runTextAnimation()
end

function var_0_3.flyLantern(arg_22_0, ...)
	cmgr.sendRequest(function(...)
		arg_22_0._releaseLantern = true

		cmgr.sendRequest(handler(arg_22_0, arg_22_0.getTianDengInfo), actions.getTianDengInfo)
	end, actions.flyLantern)
end

function var_0_3.getTianDengInfo(arg_24_0, arg_24_1)
	if arg_24_1.action.state == 1 then
		arg_24_0:refreshPanel(arg_24_1.action.data)
	end
end

function var_0_3.playLanternFlyAnimation(arg_25_0, ...)
	local var_25_0 = arg_25_0._layoutNode:getWidget("myLight")

	var_25_0:stopAllActions()
	var_25_0:runAction(CCRepeatForever:create(CCSequence:createWithTwoActions(CCRotateTo:create(2, 10), CCRotateTo:create(2, -10))))
	arg_25_0._layoutNode:getWidget("fire"):stopAllActions()
	arg_25_0._layoutNode:getWidget("fire"):runAction(CCRepeatForever:create(CCSequence:createWithTwoActions(CCFadeIn:create(1), CCFadeOut:create(1))))

	local var_25_1 = CCArray:create()
	local var_25_2 = CCArray:create()

	var_25_2:addObject(CCFadeIn:create(0.2))
	var_25_2:addObject(CCMoveBy:create(0.3, ccp(0, -100)))
	var_25_1:addObject(CCSpawn:create(var_25_2))
	var_25_1:addObject(CCPlace:create(ccp(122.5, 100)))

	local var_25_3 = CCSequence:create(var_25_1)

	arg_25_0._layoutNode:getWidget("line"):stopAllActions()
	arg_25_0._layoutNode:getWidget("line"):runAction(CCRepeatForever:create(var_25_3))
	arg_25_0:runSkyAnimation()
end

function var_0_3.onEnter(arg_26_0)
	log.info("onEnter")
	arg_26_0:runTextAnimation()
end

function var_0_3.onExit(arg_27_0)
	log.info("onExit")
	arg_27_0:stopSkyAnimation()
	arg_27_0:stopTextAnimation()
end

function var_0_3.update(arg_28_0, arg_28_1)
	local var_28_0 = 100
	local var_28_1 = -409
	local var_28_2 = 1227

	height = var_28_0 * arg_28_1

	for iter_28_0 = 1, 4 do
		local var_28_3, var_28_4 = arg_28_0["_bg" .. iter_28_0]:getPosition()

		if var_28_4 < var_28_1 then
			arg_28_0["_bg" .. iter_28_0]:setPosition(ccp(var_28_3, var_28_2 - (var_28_1 - var_28_4) - height))
		else
			arg_28_0["_bg" .. iter_28_0]:setPosition(ccp(var_28_3, var_28_4 - height))
		end
	end
end

function var_0_3.runSkyAnimation(arg_29_0, ...)
	arg_29_0:stopSkyAnimation()

	arg_29_0.updateHandler = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_29_0, arg_29_0.update), 0, false)
end

function var_0_3.stopSkyAnimation(arg_30_0, ...)
	if arg_30_0.updateHandler then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_30_0.updateHandler)

		arg_30_0.updateHandler = nil
	end
end

function var_0_3.runTextAnimation(arg_31_0)
	arg_31_0:stopTextAnimation()

	arg_31_0.updateTextRunHandler = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_31_0, arg_31_0.updateTextRun), 0, false)
end

function var_0_3.stopTextAnimation(arg_32_0, ...)
	if arg_32_0.updateTextRunHandler then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_32_0.updateTextRunHandler)

		arg_32_0.updateTextRunHandler = nil
	end
end

function var_0_3.updateTextRun(arg_33_0, arg_33_1)
	local var_33_0 = 100
	local var_33_1 = 50
	local var_33_2 = arg_33_0._layoutNode:getWidget("noticeScrollView"):getContainer():getContentSize()

	local function var_33_3(...)
		if #arg_33_0._texts > 0 then
			arg_33_0._runingTextIndex = (arg_33_0._runingTextIndex or 0) % #arg_33_0._texts + 1

			local var_34_0 = CCStrokeLabelTTF:create(arg_33_0._texts[arg_33_0._runingTextIndex].info, "Thonburi-Bold", 30, 1, ccc3(33, 29, 23))

			var_34_0:setAnchorPoint(ccp(0, 0.5))

			arg_33_0._runingLabels[#arg_33_0._runingLabels + 1] = var_34_0

			var_34_0:setPosition(ccp(var_33_2.width, var_33_2.height / 2))
			arg_33_0._layoutNode:getWidget("noticeScrollView"):getContainer():addChild(var_34_0)
		end
	end

	for iter_33_0, iter_33_1 in pairs(arg_33_0._runingLabels) do
		local var_33_4, var_33_5 = iter_33_1:getPosition()

		iter_33_1:setPosition(ccp(var_33_4 - var_33_1 * arg_33_1, var_33_5))
	end

	if #arg_33_0._runingLabels > 0 then
		local var_33_6, var_33_7 = arg_33_0._runingLabels[1]:getPosition()

		if var_33_6 + arg_33_0._runingLabels[1]:getContentSize().width < 0 then
			arg_33_0._runingLabels[1]:removeFromParentAndCleanup(true)
			table.remove(arg_33_0._runingLabels, 1)
		end

		local var_33_8, var_33_9 = arg_33_0._runingLabels[#arg_33_0._runingLabels]:getPosition()
		local var_33_10 = arg_33_0._runingLabels[#arg_33_0._runingLabels]:getContentSize()

		if var_33_2.width - (var_33_8 + var_33_10.width + var_33_0) > 0 then
			var_33_3()
		end
	else
		var_33_3()
	end
end

function var_0_3.createRunText(arg_35_0, arg_35_1)
	local var_35_0 = {}

	for iter_35_0, iter_35_1 in pairs(arg_35_1) do
		var_35_0[iter_35_0] = CCStrokeLabelTTF:create(iter_35_1, "Thonburi-Bold", 30, 1, ccc3(33, 29, 23))
	end

	local var_35_1 = arg_35_0._layoutNode:getWidget("noticeScrollView"):getContainer()

	var_35_1:removeAllChildrenWithCleanup(true)

	local var_35_2 = var_35_1:getContentSize()
	local var_35_3 = var_35_2.width
	local var_35_4 = 100

	for iter_35_2, iter_35_3 in ipairs(var_35_0) do
		var_35_1:addChild(iter_35_3)
		iter_35_3:setPosition(ccp(var_35_3, var_35_2.height / 2))

		var_35_3 = var_35_3 + iter_35_3:getContentSize().width + var_35_4
	end

	arg_35_0._labels = var_35_0
end

function var_0_3.getLeftTimeLabel(arg_36_0)
	if arg_36_0._layoutNode then
		return arg_36_0._layoutNode:getWidget("leftTime")
	else
		return nil
	end
end

function var_0_3.createOthersLantern(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_1
	local var_37_1 = CCNode:create()
	local var_37_2 = CCScale9Sprite:create("res/ui/activity/tiandeng/tdxy_lantern.png")
	local var_37_3 = CCControlButton:create(var_37_2)

	var_37_3:setAdjustBackgroundImage(false)
	var_37_3:setZoomOnTouchDown(false)
	var_37_3:setScale(0.5)
	var_37_3:setOpacity(200)
	var_37_3:runAction(CCRepeatForever:create(CCSequence:createWithTwoActions(CCRotateTo:create(1 + math.random(), 10), CCRotateTo:create(1 + math.random(), -10))))

	local var_37_4 = CCSprite:create("res/ui/activity/tiandeng/tdxy_lantern_fly.png")

	var_37_4:setVisible(not var_37_0.canClick)
	var_37_4:runAction(CCRepeatForever:create(CCSequence:createWithTwoActions(CCFadeIn:create(1), CCFadeOut:create(1))))
	var_37_4:setPosition(ccp(var_37_3:getContentSize().width / 2, var_37_3:getContentSize().height / 2))
	var_37_3:addChild(var_37_4)

	local var_37_5 = CCStrokeLabelTTF:create(var_37_0.playerName, "Thonburi-Bold", 20, 1, ccc3(33, 29, 23))

	var_37_5:setPosition(ccp(0, -50))
	var_37_1:addChild(var_37_5)
	var_37_1:addChild(var_37_3)
	var_37_3:addHandleOfControlEvent(function(...)
		if var_37_0.canClick == true then
			cmgr.sendRequest(function(arg_39_0)
				var_37_0.canClick = false
				arg_37_0._texts = arg_39_0.action.data.broadcastInfo

				var_37_4:setVisible(true)

				local var_39_0 = CCSprite:create("res/ui/activity/tiandeng/tdxy_praise.png")

				var_39_0:setScale(0.3)

				local var_39_1 = CCArray:create()
				local var_39_2 = CCArray:create()

				var_39_2:addObject(CCSequence:createWithTwoActions(CCRotateTo:create(0.5, 20), CCRotateTo:create(0.5, -20)))
				var_39_2:addObject(CCMoveBy:create(1, ccp(0, 100)))
				var_39_1:addObject(CCSpawn:create(var_39_2))
				var_39_1:addObject(CCCallFunc:create(function(...)
					var_39_0:removeFromParentAndCleanup(true)
				end))

				local var_39_3 = CCSequence:create(var_39_1)

				var_39_0:runAction(var_39_3)
				var_37_1:addChild(var_39_0)
			end, actions.praiseLantern, var_37_0.playerId)
		end
	end, CCControlEventTouchUpInside)

	return var_37_1
end

return var_0_3
