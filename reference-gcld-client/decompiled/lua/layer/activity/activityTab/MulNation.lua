local var_0_0 = class("MulNation", function()
	return createBaseLayer()
end)
local var_0_1 = require("res/native/offset").get("layer.activity.MulNation")
local var_0_2 = {
	[116] = {
		scale = 0.55,
		txt = 136106,
		pic = "res/ui/task/get_icon_silk.png",
		type = 55
	},
	[216] = {
		scale = 0.8,
		txt = 205223,
		pic = "res/ui/weapon/machine/zc_yt_icon.png",
		type = 216
	}
}

var_0_0.picInfo = {
	background = {
		halfHeight = 266,
		halfWidth = 457.5,
		width = 915,
		height = 532
	},
	progressBack = {
		halfHeight = 51.5,
		height = 103,
		width = 909,
		halfWidth = 454.5
	},
	progressShadowBase = {
		halfHeight = 14.5,
		halfWidth = 358.5,
		width = 717,
		height = 29
	},
	buffIcon = {
		halfHeight = 36,
		halfWidth = 36,
		width = 72,
		height = 72
	}
}
var_0_0.staticData = {
	isRepListOpen = false,
	enableFastClick = true,
	buffCnt = 3,
	tags = {
		NEWBUFF_TIPS_FRAME = 3,
		BUFF_TIPS_FRAME = 2,
		MAIN_TIPS_FRAME = 1
	}
}
var_0_0.giftMap = {}
var_0_0.giftMap["126"] = 10030
var_0_0.giftMap["125"] = 10041
var_0_0.giftMap["116"] = 55
var_0_0.colorMap = {}
var_0_0.colorMap["1"] = colorQuality[1]
var_0_0.colorMap["2"] = colorQuality[2]
var_0_0.colorMap["4"] = colorQuality[4]
var_0_0.colorMap["5"] = colorQuality[5]
var_0_0.colorMap["6"] = colorQuality[6]
var_0_0.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = false,
		path = "res/ui/comment/bg1.jpg"
	},
	x = visibleSize.width / 2,
	y = visibleSize.height / 2 - 30,
	children = {
		{
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/MulNation/wblc_title.png"
			},
			x = var_0_0.picInfo.background.halfWidth,
			y = var_0_0.picInfo.background.height - 50
		},
		{
			fontSize = 24,
			name = "leftTime",
			type = "label",
			x = 730 + (var_0_1.leftTimeOffsetX or 0),
			y = var_0_0.picInfo.background.height - 50,
			anchorPoint = ccp(0.5, 0.5),
			color = colorQuality[5]
		},
		{
			zoomOnTouchDown = false,
			name = "tipBtn",
			h = 42,
			type = "button",
			w = 42,
			normal = {
				frame = true,
				path = "btnTip_a.png"
			},
			touched = {
				frame = true,
				path = "btnTip_c.png"
			},
			x = 800 + (var_0_1.leftTimeOffsetX or 0),
			y = var_0_0.picInfo.background.height - 50
		},
		{
			y = 406,
			type = "sprite",
			zorder = 1,
			pic = {
				frame = false,
				path = "res/ui/activity/generalDrink/zjlyx_zy_pb_bg.png"
			},
			x = var_0_0.picInfo.background.halfWidth,
			children = {
				{
					anchorPointX = 0,
					name = "richLine",
					type = "richLine",
					gap = 2,
					x = 5,
					zorder = 100,
					y = var_0_0.picInfo.progressBack.halfHeight,
					content = {
						{
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/MulNation/wblc_word_mq.png"
							}
						},
						{
							text = "0",
							name = "reputation",
							startCharMap = 48,
							type = "atlaslabel",
							itemWidth = 28,
							pic = "res/ui/common/number/gphb_word_digit.png",
							itemHeight = 33,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					x = 190,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/generalDrink/zjlyx_zy_pb_d.png"
					},
					y = var_0_0.picInfo.progressBack.halfHeight,
					anchorPoint = ccp(0, 0.5),
					children = {
						{
							name = "progressbar",
							type = "progressbar",
							percentage = 0,
							pic = {
								frame = false,
								path = "res/ui/activity/generalDrink/zjlyx_zy_pb.png"
							},
							x = var_0_0.picInfo.progressShadowBase.halfWidth,
							y = var_0_0.picInfo.progressShadowBase.halfHeight,
							anchorPoint = ccp(0.5, 0.5),
							progressType = kCCProgressTimerTypeBar
						}
					}
				},
				{
					x = 217,
					name = "buff_1",
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/generalDrink/zjlyx_jx_icon_d.png"
					},
					anchorPoint = ccp(0.5, 0.5),
					y = var_0_0.picInfo.progressBack.halfHeight + 2,
					children = {
						{
							x = 48.5,
							y = 49.5,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/MulNation/wblc_icon_sf01.jpg"
							}
						},
						{
							x = 48.5,
							y = 32.5,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/MulNation/wblc_number_di.png"
							}
						},
						{
							fontSize = 20,
							name = "target1",
							y = 32.5,
							type = "label",
							style = "label_warlock",
							x = 48.5,
							textId = -1,
							color = colorQuality[1]
						},
						{
							x = 48.5,
							name = "bg_silkNum1",
							y = -2,
							type = "sprite",
							pic = {
								path = "res/ui/activity/MulNation/wblcyh_word_bg.png"
							},
							children = {
								{
									x = 20,
									name = "icon1",
									y = 20,
									type = "sprite",
									scale = 0.55,
									pic = {
										path = "res/ui/task/get_icon_silk.png"
									}
								},
								{
									fontSize = 20,
									name = "silkNum1",
									y = 20,
									type = "label",
									style = "label_warlock",
									x = 62,
									color = colorQuality[1]
								}
							}
						}
					}
				},
				{
					name = "buff_2",
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/generalDrink/zjlyx_jx_icon_d.png"
					},
					anchorPoint = ccp(0.5, 0.5),
					x = 180 + var_0_0.picInfo.progressShadowBase.width / 3,
					y = var_0_0.picInfo.progressBack.halfHeight + 2,
					children = {
						{
							x = 48.5,
							y = 49.5,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/MulNation/wblc_icon_sf02.jpg"
							}
						},
						{
							x = 48.5,
							y = 32.5,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/MulNation/wblc_number_di.png"
							}
						},
						{
							fontSize = 20,
							name = "target2",
							y = 32.5,
							type = "label",
							style = "label_warlock",
							x = 48.5,
							textId = -1,
							color = colorQuality[1]
						},
						{
							x = 48.5,
							name = "bg_silkNum2",
							y = -2,
							type = "sprite",
							pic = {
								path = "res/ui/activity/MulNation/wblcyh_word_bg.png"
							},
							children = {
								{
									x = 20,
									name = "icon2",
									y = 20,
									type = "sprite",
									scale = 0.55,
									pic = {
										path = "res/ui/task/get_icon_silk.png"
									}
								},
								{
									fontSize = 20,
									name = "silkNum2",
									y = 20,
									type = "label",
									style = "label_warlock",
									x = 62,
									color = colorQuality[1]
								}
							}
						}
					}
				},
				{
					name = "buff_3",
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/generalDrink/zjlyx_jx_icon_d.png"
					},
					anchorPoint = ccp(0.5, 0.5),
					x = 180 + var_0_0.picInfo.progressShadowBase.width / 3 * 2,
					y = var_0_0.picInfo.progressBack.halfHeight + 2,
					children = {
						{
							x = 48.5,
							y = 49.5,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/MulNation/wblc_icon_sf03.jpg"
							}
						},
						{
							x = 48.5,
							y = 32.5,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/MulNation/wblc_number_di.png"
							}
						},
						{
							fontSize = 20,
							name = "target3",
							y = 32.5,
							type = "label",
							style = "label_warlock",
							x = 48.5,
							textId = -1,
							color = colorQuality[1]
						},
						{
							x = 48.5,
							name = "bg_silkNum3",
							y = -2,
							type = "sprite",
							pic = {
								path = "res/ui/activity/MulNation/wblcyh_word_bg.png"
							},
							children = {
								{
									x = 20,
									name = "icon3",
									y = 20,
									type = "sprite",
									scale = 0.55,
									pic = {
										path = "res/ui/task/get_icon_silk.png"
									}
								},
								{
									fontSize = 20,
									name = "silkNum3",
									y = 20,
									type = "label",
									style = "label_warlock",
									x = 62,
									color = colorQuality[1]
								}
							}
						}
					}
				},
				{
					type = "sprite",
					name = "buff_4",
					visible = false,
					pic = {
						frame = false,
						path = "res/ui/activity/generalDrink/zjlyx_jx_icon_d.png"
					},
					anchorPoint = ccp(0.5, 0.5),
					x = 190 + var_0_0.picInfo.progressShadowBase.width - 48 + 12,
					y = var_0_0.picInfo.progressBack.halfHeight + 2,
					children = {
						{
							x = 48.5,
							y = 49.5,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/MulNation/wblc_icon_sf04.jpg"
							}
						},
						{
							x = 48.5,
							y = 32.5,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/MulNation/wblc_number_di.png"
							}
						},
						{
							fontSize = 20,
							name = "target4",
							y = 32.5,
							type = "label",
							style = "label_warlock",
							x = 48.5,
							textId = -1,
							color = colorQuality[1]
						},
						{
							x = 48.5,
							name = "bg_silkNum4",
							y = -2,
							type = "sprite",
							pic = {
								path = "res/ui/activity/MulNation/wblcyh_word_bg.png"
							},
							children = {
								{
									y = 20,
									x = 20,
									scale = 0.55,
									type = "sprite",
									pic = {
										path = "res/ui/task/get_icon_silk.png"
									}
								},
								{
									fontSize = 20,
									name = "silkNum4",
									y = 20,
									type = "label",
									style = "label_warlock",
									x = 62,
									color = colorQuality[1]
								}
							}
						}
					}
				}
			}
		},
		{
			name = "dinnerBack",
			y = 220,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/dinner/dinnerBackground1.jpg"
			},
			x = var_0_0.picInfo.background.halfWidth,
			children = {
				{
					x = 280,
					y = 230,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/kfsy/dinnerChiefRole.png"
					}
				},
				{
					visible = false,
					name = "boxBg",
					x = 520,
					type = "sprite",
					y = 105,
					zorder = 10,
					pic = {
						frame = false,
						path = "res/ui/rankInfo/DailyFeatView/yq_tz.png"
					},
					children = {
						{
							x = 115,
							name = "box",
							y = 95,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/rankInfo/DailyFeatView/yq_bx.png"
							}
						},
						{
							y = 145,
							x = 115,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/juben/jb_wj_lv_d.png"
							},
							children = {
								{
									fontSize = 24,
									name = "nation",
									y = 24.5,
									type = "label",
									style = "label_warlock",
									x = 87.5,
									textId = -1,
									color = color_whi
								}
							}
						}
					}
				},
				{
					x = 510,
					name = "soldier_1",
					y = 141,
					type = "sprite",
					scale = 1.3,
					visible = false,
					zorder = 8,
					pic = {
						frame = false,
						path = "res/ui/rankInfo/DailyFeatView/yq_walk01.png"
					}
				},
				{
					x = 450,
					name = "soldier_2",
					y = 105,
					type = "sprite",
					scale = 1.3,
					visible = false,
					zorder = 11,
					pic = {
						frame = false,
						path = "res/ui/rankInfo/DailyFeatView/yq_walk01.png"
					}
				},
				{
					x = 560,
					name = "soldier_3",
					y = 40,
					type = "sprite",
					scale = 1.3,
					visible = false,
					zorder = 12,
					pic = {
						frame = false,
						path = "res/ui/rankInfo/DailyFeatView/yq_walk01.png"
					}
				},
				{
					x = 625,
					name = "soldier_4",
					y = 75,
					type = "sprite",
					scale = 1.3,
					visible = false,
					zorder = 9,
					pic = {
						frame = false,
						path = "res/ui/rankInfo/DailyFeatView/yq_walk01.png"
					}
				}
			}
		},
		{
			y = 103,
			name = "buff",
			type = "node",
			x = 120,
			children = {
				{
					y = -14.5,
					name = "buffInfoBg",
					type = "sprite",
					x = 166.5,
					pic = {
						path = "res/ui/activity/MulNation/wblcyh_word_di_s.png"
					},
					children = {
						{
							y = 20,
							name = "buffInfoEffectSp",
							type = "sprite",
							x = 133,
							pic = {
								path = "Default/Sprite.png"
							}
						},
						{
							fontSize = 20,
							name = "buffInfoLb",
							y = 22.5,
							type = "label",
							x = 148.5
						}
					}
				},
				{
					y = 0,
					name = "buffBg",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/activity/generalDrink/zjlyx_jx_icon_d.png"
					},
					children = {
						{
							y = 49,
							name = "buffIcon",
							type = "sprite",
							x = 48,
							pic = {
								path = "res/ui/activity/MulNation/wblc_icon_sf01.jpg"
							}
						},
						{
							y = 83.5,
							name = "wblcyh_number_di_s",
							type = "sprite",
							x = 78,
							pic = {
								path = "res/ui/activity/MulNation/wblcyh_number_di_s.png"
							}
						},
						{
							fontSize = 20,
							name = "buffNumLb",
							y = 85.5,
							type = "label",
							x = 77.5
						},
						{
							w = 60,
							name = "buffBtn",
							h = 60,
							type = "button",
							y = 49,
							x = 48,
							normal = {
								path = "res/ui/kfsy/150150.png"
							},
							touched = {
								path = "res/ui/kfsy/150150.png"
							}
						}
					}
				},
				{
					y = 100,
					name = "getBuffBg",
					visible = false,
					type = "sprite",
					x = 330,
					pic = {
						path = "res/ui/activity/MulNation/wblcyh_word_di.png"
					},
					children = {
						{
							y = 35.0003,
							name = "wblcyh_word_gxnysjw",
							type = "sprite",
							x = 228.1113,
							pic = {
								path = "res/ui/activity/MulNation/wblcyh_word_gxnysjw.png"
							}
						},
						{
							y = 35,
							name = "wblcyh_word_cxsh",
							type = "sprite",
							x = 472.1115,
							pic = {
								path = "res/ui/activity/MulNation/wblcyh_word_cxsh.png"
							}
						}
					}
				}
			}
		},
		{
			y = 72,
			name = "reputationList",
			type = "scrollview",
			x = 0,
			viewSize = CCSizeMake(360, 290),
			children = {
				{
					x = -6,
					name = "reputationListBase",
					y = 0,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/MulNation/wblc_list_di.png"
					},
					children = {
						{
							y = 267,
							x = 156.5,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/MulNation/wblc_word_di1.png"
							},
							children = {
								{
									x = 153,
									y = 22,
									type = "sprite",
									pic = {
										frame = false,
										path = "res/ui/activity/MulNation/wblc_word_jgjl.png"
									}
								}
							}
						},
						{
							y = 218,
							x = 156.5,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/MulNation/wblc_word_di2.png"
							},
							children = {
								{
									y = 22,
									type = "richLine",
									gap = 8,
									x = 46 + (var_0_1.rewardTipsOffsetX or 0),
									content = {
										{
											style = "label_warlock",
											y = 22,
											type = "label",
											x = 153,
											textId = 136094,
											fontSize = 24 + (var_0_1.repFntSize or 0),
											color = colorQuality[1]
										},
										{
											type = "sprite",
											pic = {
												frame = false,
												path = "res/ui/activity/MulNation/wblc_word_mq.png"
											},
											scale = 0.7 + (var_0_1.repSpScale or 0)
										},
										{
											type = "sprite",
											pic = {
												frame = false,
												path = "res/ui/activity/MulNation/wblc_word_plus.png"
											}
										},
										{
											text = "1",
											startCharMap = 48,
											type = "atlaslabel",
											itemWidth = 28,
											pic = "res/ui/common/number/gphb_word_digit.png",
											itemHeight = 33
										}
									}
								}
							}
						},
						{
							y = 169,
							x = 156.5,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/MulNation/wblc_word_di1.png"
							},
							children = {
								{
									y = 22,
									type = "richLine",
									gap = 8,
									x = 46 + (var_0_1.rewardTipsOffsetX or 0),
									content = {
										{
											style = "label_warlock",
											y = 22,
											type = "label",
											x = 153,
											textId = 136095,
											fontSize = 24 + (var_0_1.repFntSize or 0),
											color = colorQuality[2]
										},
										{
											type = "sprite",
											pic = {
												frame = false,
												path = "res/ui/activity/MulNation/wblc_word_mq.png"
											},
											scale = 0.7 + (var_0_1.repSpScale or 0)
										},
										{
											type = "sprite",
											pic = {
												frame = false,
												path = "res/ui/activity/MulNation/wblc_word_plus.png"
											}
										},
										{
											text = "2",
											startCharMap = 48,
											type = "atlaslabel",
											itemWidth = 28,
											pic = "res/ui/common/number/gphb_word_digit.png",
											itemHeight = 33
										}
									}
								}
							}
						},
						{
							y = 120,
							x = 156.5,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/MulNation/wblc_word_di2.png"
							},
							children = {
								{
									y = 22,
									type = "richLine",
									gap = 8,
									x = 46 + (var_0_1.rewardTipsOffsetX or 0),
									content = {
										{
											style = "label_warlock",
											y = 22,
											type = "label",
											x = 153,
											textId = 136096,
											fontSize = 24 + (var_0_1.repFntSize or 0),
											color = colorQuality[4]
										},
										{
											type = "sprite",
											pic = {
												frame = false,
												path = "res/ui/activity/MulNation/wblc_word_mq.png"
											},
											scale = 0.7 + (var_0_1.repSpScale or 0)
										},
										{
											type = "sprite",
											pic = {
												frame = false,
												path = "res/ui/activity/MulNation/wblc_word_plus.png"
											}
										},
										{
											text = "4",
											startCharMap = 48,
											type = "atlaslabel",
											itemWidth = 28,
											pic = "res/ui/common/number/gphb_word_digit.png",
											itemHeight = 33
										}
									}
								}
							}
						},
						{
							y = 71,
							x = 156.5,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/MulNation/wblc_word_di1.png"
							},
							children = {
								{
									y = 22,
									type = "richLine",
									gap = 8,
									x = 46 + (var_0_1.rewardTipsOffsetX or 0),
									content = {
										{
											style = "label_warlock",
											y = 22,
											type = "label",
											x = 153,
											textId = 136097,
											fontSize = 24 + (var_0_1.repFntSize or 0),
											color = colorQuality[5]
										},
										{
											type = "sprite",
											pic = {
												frame = false,
												path = "res/ui/activity/MulNation/wblc_word_mq.png"
											},
											scale = 0.7 + (var_0_1.repSpScale or 0)
										},
										{
											type = "sprite",
											pic = {
												frame = false,
												path = "res/ui/activity/MulNation/wblc_word_plus.png"
											}
										},
										{
											text = "8",
											startCharMap = 48,
											type = "atlaslabel",
											itemWidth = 28,
											pic = "res/ui/common/number/gphb_word_digit.png",
											itemHeight = 33
										}
									}
								}
							}
						},
						{
							y = 22,
							x = 156.5,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/MulNation/wblc_word_di2.png"
							},
							children = {
								{
									y = 22,
									type = "richLine",
									gap = 8,
									x = 46 + (var_0_1.rewardTipsOffsetX or 0),
									content = {
										{
											style = "label_warlock",
											y = 22,
											type = "label",
											x = 153,
											textId = 136098,
											fontSize = 24 + (var_0_1.repFntSize or 0),
											color = colorQuality[6]
										},
										{
											type = "sprite",
											pic = {
												frame = false,
												path = "res/ui/activity/MulNation/wblc_word_mq.png"
											},
											scale = 0.7 + (var_0_1.repSpScale or 0)
										},
										{
											type = "sprite",
											pic = {
												frame = false,
												path = "res/ui/activity/MulNation/wblc_word_plus.png"
											}
										},
										{
											text = "20",
											startCharMap = 48,
											type = "atlaslabel",
											itemWidth = 28,
											pic = "res/ui/common/number/gphb_word_digit.png",
											itemHeight = 33
										}
									}
								}
							}
						},
						{
							zoomOnTouchDown = false,
							name = "listBtn",
							h = 292,
							type = "button",
							w = 52,
							y = 145,
							x = 334,
							normal = {
								frame = false,
								path = "res/ui/activity/MulNation/wblc_list_btn.png"
							},
							touched = {
								frame = false,
								path = "res/ui/activity/MulNation/wblc_list_btn_c.png"
							},
							children = {
								{
									x = 26,
									y = 165,
									type = "sprite",
									pic = {
										frame = false,
										path = "res/ui/activity/MulNation/wblc_word_ckjl.png"
									}
								},
								{
									x = 26,
									name = "listBtnArrow",
									y = 60,
									type = "sprite",
									pic = {
										frame = false,
										path = "res/ui/activity/MulNation/wblc_arrow_01.png"
									}
								}
							}
						}
					}
				}
			}
		},
		{
			zoomOnTouchDown = false,
			name = "btnInvite",
			h = 56,
			type = "button",
			w = 212,
			y = 30,
			x = 800,
			normal = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_02.png"
			},
			touched = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_02_c.png"
			},
			children = {
				{
					style = "label_warlock",
					y = 32,
					type = "label",
					x = 130,
					textId = 136090,
					fontSize = 24 + (var_0_1.inviteFntSize or 0),
					color = color_whi
				},
				{
					y = 40,
					x = 46,
					scale = 0.6,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/kfsy/kfsy_qj.png"
					}
				},
				{
					fontSize = 20,
					name = "leftFreeInvites",
					y = 25,
					type = "label",
					style = "label_warlock",
					x = 46,
					textId = -1,
					color = color_whi
				},
				{
					x = 40,
					name = "goldIcon",
					y = 25,
					type = "sprite",
					scale = 0.5,
					pic = {
						frame = false,
						path = "res/ui/activity/ironRotary/yuanbao.png"
					}
				},
				{
					text = "",
					name = "goldCostLabel",
					y = 10,
					type = "label",
					style = "label_warlock",
					x = 40,
					fontSize = 14,
					color = color_yel
				}
			}
		},
		{
			y = 300,
			x = 800,
			scale = 1.2,
			type = "sprite",
			pic = {
				path = "res/ui/silk/market/scpm_word_d.png"
			},
			children = {
				{
					x = 78,
					name = "rewardType",
					y = 22,
					type = "sprite",
					pic = {
						path = "res/ui/activity/MulNation/wblc_word_sbjn.png"
					}
				}
			}
		},
		{
			zoomOnTouchDown = true,
			name = "btn_type1",
			h = 56,
			type = "button",
			w = 56,
			y = 240,
			x = 760,
			normal = {
				path = "res/ui/activity/MulNation/wblc_icon_di.png"
			},
			touched = {
				path = "res/ui/activity/MulNation/wblc_icon_di_c.png"
			},
			children = {
				{
					y = 28,
					x = 28,
					scale = 0.8,
					type = "sprite",
					pic = {
						path = "res/ui/task/get_icon_silk.png"
					}
				},
				{
					y = 28,
					name = "light1",
					scale = 0.85,
					type = "sprite",
					visible = false,
					x = 28
				}
			}
		},
		{
			zoomOnTouchDown = true,
			name = "btn_type2",
			h = 56,
			type = "button",
			w = 56,
			y = 240,
			x = 840,
			normal = {
				path = "res/ui/activity/MulNation/wblc_icon_di.png"
			},
			touched = {
				path = "res/ui/activity/MulNation/wblc_icon_di_c.png"
			},
			children = {
				{
					y = 28,
					x = 28,
					scale = 0.7,
					type = "sprite",
					pic = {
						path = "res/ui/resource/silkroad/sczldj_jn.png"
					}
				},
				{
					y = 28,
					name = "light2",
					scale = 0.85,
					type = "sprite",
					visible = false,
					x = 28
				}
			}
		},
		{
			y = 60,
			name = "accomplishLayer",
			x = 0,
			type = "layerColor",
			height = 312,
			visible = false,
			color = ccc4(20, 20, 20, 242),
			width = var_0_0.picInfo.background.width,
			children = {
				{
					y = 156,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/saotao/stfx_long_bg.png"
					},
					x = var_0_0.picInfo.background.halfWidth
				},
				{
					y = 156,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/MulNation/wblc_word_yhdzgmqch.png"
					},
					x = var_0_0.picInfo.background.halfWidth
				}
			}
		},
		{
			name = "topLayer",
			x = 0,
			type = "layerColor",
			y = 0,
			zorder = 1000,
			color = ccc4(255, 0, 0, 0),
			width = var_0_0.picInfo.background.width,
			height = var_0_0.picInfo.background.height
		}
	}
}

function var_0_0.ctor(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:init(arg_2_1, arg_2_2)
end

function var_0_0.init(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.data = arg_3_2
	arg_3_0.localData = {}

	arg_3_0:initLayout(arg_3_1, arg_3_0.layout)
	arg_3_0:registerHandler()
end

function var_0_0.initLayout(arg_4_0, arg_4_1, arg_4_2)
	rmgr.loadResource("res/ui/activity/gangMine/light.plist")
	rmgr.loadResource("res/anim/mulNationEffect/light/light.plist")

	arg_4_0.view = {}

	uiutil.initWidgets(arg_4_0.view, arg_4_2)

	arg_4_0.leftTime = arg_4_0.view.widgets.leftTime

	arg_4_0.view.widgets.dinnerBack:setTextureRect(CCRectMake(0, 0, 915, 310))

	for iter_4_0 = 1, 2 do
		local var_4_0 = CCArray:create()

		for iter_4_1 = 1, 25 do
			local var_4_1 = CCSprite:createWithSpriteFrameName(string.format("gang_mine_light_%d.png", iter_4_1))

			var_4_0:addObject(var_4_1:displayFrame())
		end

		local var_4_2 = CCAnimation:createWithSpriteFrames(var_4_0, 0.04)
		local var_4_3 = CCAnimate:create(var_4_2)

		arg_4_0.view.widgets["light" .. iter_4_0]:runAction(CCRepeatForever:create(var_4_3))
	end

	arg_4_0:updateBuffInfo()
	arg_4_0:initBuffIcon()
	arg_4_0:initRepList()
	arg_4_0:checkRewardType()
	arg_4_0:checkProgress()
	arg_4_0:checkCurrentInvite()
	arg_4_0:checkBtnUI()
	arg_4_0:checkAccomplish()
	arg_4_0:addChild(arg_4_0.view.widgets.panel)

	if arg_4_1 then
		arg_4_1:addChild(arg_4_0)
	end
end

function var_0_0.updateBuffInfo(arg_5_0)
	local var_5_0 = 0
	local var_5_1 = {}
	local var_5_2 = {}

	for iter_5_0 = 1, #arg_5_0.data.reputes do
		if arg_5_0.data.myRepute < arg_5_0.data.reputes[iter_5_0].target then
			var_5_0 = iter_5_0 - 1
			var_5_1.target = arg_5_0.data.reputes[iter_5_0].target
			var_5_1.name = arg_5_0.data.reputes[iter_5_0].name
			var_5_1.id = arg_5_0.data.reputes[iter_5_0].id

			break
		elseif arg_5_0.data.myRepute >= arg_5_0.data.reputes[iter_5_0].target then
			var_5_2.target = arg_5_0.data.reputes[iter_5_0].target
			var_5_2.name = arg_5_0.data.reputes[iter_5_0].name
			var_5_2.id = arg_5_0.data.reputes[iter_5_0].id
			arg_5_0.buffTitle = arg_5_0.data.reputes[iter_5_0].name
		end
	end

	arg_5_0.iconPic = 1

	if var_5_1.id then
		arg_5_0.iconPic = var_5_1.id - 1

		arg_5_0.view.widgets.buffInfoLb:setString(language.get(226101, var_5_1.name, var_5_1.target - arg_5_0.data.myRepute))
		arg_5_0.view.widgets.buffInfoBg:setVisible(true)
	else
		arg_5_0.view.widgets.buffInfoBg:setVisible(false)

		arg_5_0.iconPic = var_5_2.id
	end

	if arg_5_0.iconPic == 0 then
		arg_5_0.iconPic = 1
		arg_5_0.buffTitle = language.get(226103)
	end

	arg_5_0.view.widgets.buffIcon:setDisplayFrame(CCSprite:create("res/ui/activity/MulNation/wblc_icon_sf0" .. arg_5_0.iconPic .. ".jpg"):displayFrame())

	if var_5_0 == 0 then
		tool.spriteToGray(arg_5_0.view.widgets.buffIcon)
	else
		arg_5_0.view.widgets.buffIcon:removeAllChildrenWithCleanup(true)
	end

	if not arg_5_0.buffAnim then
		local var_5_3 = CCArray:create()

		for iter_5_1 = 1, 20 do
			local var_5_4 = CCSprite:createWithSpriteFrameName("mulnBuffEffect" .. iter_5_1 .. ".png")

			var_5_3:addObject(var_5_4:displayFrame())
		end

		local var_5_5 = CCAnimation:createWithSpriteFrames(var_5_3, 0.04)
		local var_5_6 = CCAnimate:create(var_5_5)

		arg_5_0.view.widgets.buffInfoEffectSp:runAction(CCRepeatForever:create(var_5_6))

		arg_5_0.buffAnim = true
	end

	arg_5_0.view.widgets.buffNumLb:setString("x" .. arg_5_0.data.leftBuffTimes)
end

function var_0_0.initBuffIcon(arg_6_0)
	for iter_6_0 = 1, var_0_0.staticData.buffCnt do
		local var_6_0 = arg_6_0.data.reputes[iter_6_0]

		arg_6_0.view.widgets["target" .. iter_6_0]:setString(var_6_0.target)
		arg_6_0.view.widgets["silkNum" .. iter_6_0]:setString(tool.getFormatNum(var_6_0.rewards[1].num))

		local var_6_1 = var_0_2[var_6_0.rewards[1].type]

		if var_6_1 then
			arg_6_0.view.widgets["icon" .. iter_6_0]:setDisplayFrame(CCSprite:create(var_6_1.pic):displayFrame())
			arg_6_0.view.widgets["icon" .. iter_6_0]:setScale(var_6_1.scale)
		end
	end

	for iter_6_1 = 1, 3 do
		arg_6_0.view.widgets["buff_" .. iter_6_1]:setPositionX(194 + arg_6_0.picInfo.progressShadowBase.width * iter_6_1 / 3 - arg_6_0.picInfo.buffIcon.halfWidth)
	end
end

function var_0_0.checkBtnUI(arg_7_0)
	if arg_7_0.data.freeLeftInvites > 0 then
		arg_7_0.view.widgets.goldIcon:setVisible(false)
		arg_7_0.view.widgets.goldCostLabel:setVisible(false)
		arg_7_0.view.widgets.leftFreeInvites:setVisible(true)
		arg_7_0.view.widgets.leftFreeInvites:setString(language.get(136091, arg_7_0.data.freeLeftInvites))
	else
		arg_7_0.view.widgets.leftFreeInvites:setVisible(false)
		arg_7_0.view.widgets.goldIcon:setVisible(true)
		arg_7_0.view.widgets.goldCostLabel:setVisible(true)
		arg_7_0.view.widgets.goldCostLabel:setString(arg_7_0.data.costGold)
	end
end

function var_0_0.checkRewardType(arg_8_0)
	local var_8_0 = arg_8_0.data.rewardChoiceType == 116
	local var_8_1 = var_8_0 and "wblc_word_sbsc.png" or "wblc_word_sbjn.png"

	arg_8_0.view.widgets.rewardType:setDisplayFrame(CCSprite:create("res/ui/activity/MulNation/" .. var_8_1):displayFrame())
	arg_8_0.view.widgets.light1:setVisible(var_8_0)
	arg_8_0.view.widgets.light2:setVisible(not var_8_0)
end

function var_0_0.checkProgress(arg_9_0)
	local var_9_0 = 3
	local var_9_1 = 1 / var_9_0
	local var_9_2 = 0

	for iter_9_0 = 1, var_9_0 do
		if arg_9_0.data.myRepute - arg_9_0.data.reputes[iter_9_0].target > 0 then
			var_9_2 = var_9_2 + var_9_1
		else
			local var_9_3 = arg_9_0.data.reputes[iter_9_0].target
			local var_9_4 = arg_9_0.data.reputes[iter_9_0 - 1] and arg_9_0.data.reputes[iter_9_0 - 1].target or 0

			var_9_2 = var_9_2 + (arg_9_0.data.myRepute - var_9_4) / (var_9_3 - var_9_4) * var_9_1

			break
		end
	end

	arg_9_0.view.widgets.progressbar:setPercentage(var_9_2 * 100)
	arg_9_0:checkBuffLight()
	arg_9_0.view.widgets.reputation:setString(arg_9_0.data.myRepute)
	arg_9_0.view.widgets.richLine:reorder()

	if arg_9_0.data.newFinishIds and #arg_9_0.data.newFinishIds > 0 then
		local var_9_5 = arg_9_0.data.newFinishIds[1]

		if arg_9_0.iconPic == 3 then
			arg_9_0:showEffectReward(var_9_5)
		else
			arg_9_0:flyBuffIcon(function()
				arg_9_0:showEffectReward(var_9_5)
			end)
		end
	end
end

function var_0_0.checkBuffLight(arg_11_0)
	local var_11_0 = #arg_11_0.data.reputes

	for iter_11_0 = #arg_11_0.data.reputes, 1, -1 do
		if arg_11_0.data.myRepute >= arg_11_0.data.reputes[iter_11_0].target then
			break
		else
			var_11_0 = var_11_0 - 1
		end
	end

	for iter_11_1 = 1, var_11_0 do
		arg_11_0:addLight(iter_11_1)
		arg_11_0.view.widgets["bg_silkNum" .. iter_11_1]:setVisible(false)
	end
end

function var_0_0.showEffectReward(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0.data.reputes[arg_12_1].rewards[1]
	local var_12_1 = "res/ui/task/get_icon_silk.png"
	local var_12_2 = var_0_2[var_12_0.type]

	if var_12_2 then
		var_12_1 = var_12_2.pic
	end

	local var_12_3 = var_12_0.num
	local var_12_4 = var_12_3 / 10

	if arg_12_0.rewardNode then
		arg_12_0.rewardNode:stopAllActions()
	else
		arg_12_0.rewardNode = CCSpriteBatchNode:create(var_12_1)

		arg_12_0.view.widgets.panel:addChild(arg_12_0.rewardNode, 100)
	end

	arg_12_0.reward = arg_12_0.reward or {}

	local function var_12_5(arg_13_0)
		local var_13_0 = {}

		for iter_13_0 = 1, arg_13_0 do
			local var_13_1 = {}

			var_13_1.id = 55

			if var_12_2 then
				var_13_1.id = var_12_2.type
			end

			var_13_1.value = var_12_4

			table.insert(var_13_0, var_13_1)
		end

		globalAction_gotResource(var_13_0)
	end

	local function var_12_6(arg_14_0)
		arg_12_0.rewardNode:addChild(arg_14_0)

		local var_14_0 = math.random(280, 640)
		local var_14_1 = math.random(90, 150)

		arg_14_0:setPosition(ccp(460, 270))
		arg_14_0:runAction(CCEaseBounceOut:create(CCMoveTo:create(1, ccp(var_14_0, var_14_1))))
	end

	for iter_12_0 = 1, 10 do
		local var_12_7 = CCSprite:create(var_12_1)

		table.insert(arg_12_0.reward, {
			obj = var_12_7
		})
		var_12_6(var_12_7)
	end

	local var_12_8 = CCLayerColor:create(ccc4(0, 0, 0, 200), 909, 375)

	var_12_8:setPosition(3, 3)
	var_12_8:registerScriptTouchHandler(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == CCTOUCHBEGAN then
			log.info("CCTOUCH_BEGAN", arg_15_1, arg_15_2)

			if arg_12_0.reward and #arg_12_0.reward > 0 then
				local var_15_0 = 0

				for iter_15_0 = #arg_12_0.reward, 1, -1 do
					local var_15_1 = arg_12_0.reward[iter_15_0]
					local var_15_2 = tolua.cast(arg_12_0.reward[iter_15_0].obj, "CCSprite")

					if tool.checkIfTouch(var_15_2, arg_15_1, arg_15_2) then
						var_15_0 = var_15_0 + 1

						var_15_2:removeFromParentAndCleanup(true)
						table.remove(arg_12_0.reward, iter_15_0)

						if var_15_0 >= 5 then
							break
						end
					end
				end

				if var_15_0 > 0 then
					while var_15_0 < 3 and #arg_12_0.reward > 0 do
						tolua.cast(table.remove(arg_12_0.reward).obj, "CCSprite"):removeFromParentAndCleanup(true)

						var_15_0 = var_15_0 + 1
					end

					var_12_5(var_15_0)

					if #arg_12_0.reward == 0 and arg_12_0.maskLayer then
						arg_12_0.maskLayer:removeFromParentAndCleanup(true)

						arg_12_0.maskLayer = nil
					end

					return true
				end
			end

			log.info("touch", tool.checkIfTouch(arg_12_0.view.widgets.bg, arg_15_1, arg_15_2))

			if tool.checkIfTouch(arg_12_0.view.widgets.dinnerBack, arg_15_1, arg_15_2) then
				return true
			end

			return false
		elseif arg_15_0 == CCTOUCHMOVED then
			log.info("CCTOUCH_MOVED", arg_15_1, arg_15_2)

			return true
		elseif arg_15_0 == CCTOUCHENDED then
			log.info("CCTOUCH_ENDED", arg_15_1, arg_15_2)

			return true
		end
	end, false, true)
	var_12_8:setTouchEnabled(true)
	arg_12_0.view.widgets.panel:addChild(var_12_8, 10)

	local var_12_9 = CCStrokeLabelTTF:create(language.get(var_12_2.txt, tool.getFormatNum(var_12_3)), "Thonburi", 22)

	var_12_9:setColor(ccc3(0, 255, 0))
	var_12_9:setPosition(454, 30)
	var_12_8:addChild(var_12_9)

	if arg_12_0.maskLayer then
		arg_12_0.maskLayer:removeFromParentAndCleanup(true)
	end

	arg_12_0.maskLayer = var_12_8
end

function var_0_0.addLight(arg_16_0, arg_16_1)
	assert(arg_16_1 >= 1 and arg_16_1 <= 4)

	if arg_16_0.view.widgets["buff_" .. arg_16_1]:getChildByTag(1) ~= nil then
		return
	end

	local var_16_0 = rmgr.getAnimation("sdtj_itemLight")
	local var_16_1 = CCAnimation:createWithSpriteFrames(var_16_0, 0.08)
	local var_16_2 = CCAnimate:create(var_16_1)
	local var_16_3 = CCSprite:create()

	var_16_3:runAction(CCRepeatForever:create(var_16_2))
	var_16_3:setPosition(ccp(49, 49))
	var_16_3:setScale(0.9)
	arg_16_0.view.widgets["buff_" .. arg_16_1]:addChild(var_16_3, 0, 1)
end

function var_0_0.checkCurrentInvite(arg_17_0)
	if type(arg_17_0.data.currentInvite) == "userdata" then
		return
	elseif type(arg_17_0.data.currentInvite) == "table" then
		arg_17_0:recieveGiftWithAnimation()
	end
end

function var_0_0.registerHandler(arg_18_0)
	arg_18_0.view.widgets.btn_type1:addHandleOfControlEvent(function()
		if arg_18_0.data.rewardChoiceType ~= 116 then
			arg_18_0:onChooseRewardType(116)
		end
	end, CCControlEventTouchUpInside)
	arg_18_0.view.widgets.btn_type2:addHandleOfControlEvent(function()
		if arg_18_0.data.rewardChoiceType ~= 126 then
			arg_18_0:onChooseRewardType(126)
		end
	end, CCControlEventTouchUpInside)
	arg_18_0.view.widgets.tipBtn:addHandleOfControlEvent(function()
		if not arg_18_0.view.widgets.topLayer:getChildByTag(var_0_0.staticData.tags.MAIN_TIPS_FRAME) then
			arg_18_0:addMainTips()
		else
			arg_18_0:removeMainTips()
		end
	end, CCControlEventTouchUpInside)
	arg_18_0.view.widgets.buffBtn:addHandleOfControlEvent(function()
		if not arg_18_0.view.widgets.topLayer:getChildByTag(var_0_0.staticData.tags.NEWBUFF_TIPS_FRAME) then
			arg_18_0:addNewBuffTips()
		else
			arg_18_0:removeNewBuffTips()
		end
	end, CCControlEventTouchDown)

	if not var_0_0.staticData.enableFastClick then
		arg_18_0.view.widgets.btnInvite:addHandleOfControlEvent(function()
			arg_18_0:normalInviteClick()
		end, CCControlEventTouchUpInside)
	else
		arg_18_0.view.widgets.btnInvite:addHandleOfControlEvent(function()
			arg_18_0:fastInviteClick()
		end, CCControlEventTouchUpInside)
	end
end

function var_0_0.onChooseRewardType(arg_25_0, arg_25_1)
	local function var_25_0(arg_26_0)
		arg_25_0.data.rewardChoiceType = arg_25_1

		arg_25_0:checkRewardType()
	end

	cmgr.sendRequest(var_25_0, actions.chooseRewardType, arg_25_1)
end

function var_0_0.flyBuffIcon(arg_27_0, arg_27_1)
	local var_27_0 = CCArray:create()
	local var_27_1, var_27_2 = tool.getPositionInScreen(arg_27_0.view.widgets.buffIcon)
	local var_27_3 = smgr.getLayer("topLayer")
	local var_27_4 = CCSprite:create("res/ui/activity/MulNation/wblc_icon_sf0" .. arg_27_0.iconPic .. ".jpg")
	local var_27_5, var_27_6 = tool.getPositionInScreen(arg_27_0.view.widgets["buff_" .. arg_27_0.iconPic])

	var_27_4:setPosition(var_27_5, var_27_6)
	var_27_3:addChild(var_27_4)
	var_27_0:addObject(CCDelayTime:create(1))
	var_27_0:addObject(CCMoveTo:create(0.8, ccp(var_27_1, var_27_2)))
	var_27_0:addObject(CCDelayTime:create(0.2))
	var_27_0:addObject(CCCallFuncN:create(function()
		if not tolua.isnull(arg_27_0.view.widgets.getBuffBg) then
			arg_27_0.view.widgets.getBuffBg:setPosition(ccp(330, 100))
			arg_27_0.view.widgets.getBuffBg:setVisible(true)

			local var_28_0 = CCArray:create()

			var_28_0:addObject(CCFadeIn:create(0.06))
			var_28_0:addObject(CCMoveTo:create(0.8, ccp(330, 200)))
			var_28_0:addObject(CCCallFuncN:create(function(...)
				arg_27_0.view.widgets.getBuffBg:setVisible(false)
			end))

			local var_28_1 = CCSequence:create(var_28_0)

			arg_27_0.view.widgets.getBuffBg:runAction(CCSequence:create(var_28_0))
			arg_27_1()
		end

		var_27_4:removeFromParentAndCleanup(true)
	end))

	local var_27_7 = CCSequence:create(var_27_0)

	var_27_4:runAction(var_27_7)
end

function var_0_0.normalInviteClick(arg_30_0)
	if arg_30_0.localData.onRecieveGift == true then
		return
	end

	arg_30_0:resetRecieve()

	local function var_30_0(arg_31_0)
		arg_30_0.data = arg_31_0.action.data

		arg_30_0:updateBuffInfo()
		arg_30_0:checkRewardType()
		arg_30_0:checkProgress()
		arg_30_0:checkBtnUI()
		arg_30_0:getReputationEffect()
		arg_30_0:recieveGiftWithAnimation()
	end

	if arg_30_0.data.freeLeftInvites ~= 0 then
		cmgr.sendRequest(var_30_0, actions.sendInvitation)
	else
		messageBox.showChargeWinWithData(language.get(10003), language.get(136093, arg_30_0.data.costGold), "mulNationInviteBuy", function()
			cmgr.sendRequest(var_30_0, actions.sendInvitation)
		end)
	end
end

function var_0_0.fastInviteClick(arg_33_0)
	if arg_33_0.localData.onRecieveGift == true then
		arg_33_0:stopRecieveGift()
		arg_33_0:recieveGiftWithoutAnimation()

		if not arg_33_0.localData.isAccomplish then
			arg_33_0:normalInviteClick()
		end
	else
		arg_33_0:normalInviteClick()
	end
end

function var_0_0.getReputationEffect(arg_34_0)
	local var_34_0 = CCArray:create()
	local var_34_1 = CCScaleBy:create(0.4, 1.5)
	local var_34_2 = var_34_1:reverse()

	var_34_0:addObject(CCEaseExponentialOut:create(var_34_1))
	var_34_0:addObject(CCEaseExponentialIn:create(var_34_2))

	local var_34_3 = CCSequence:create(var_34_0)

	arg_34_0.view.widgets.reputation:stopAllActions()
	arg_34_0.view.widgets.reputation:setScale(1)
	arg_34_0.view.widgets.reputation:runAction(var_34_3)
end

function var_0_0.recieveGiftWithAnimation(arg_35_0)
	arg_35_0.view.widgets.nation:setColor(arg_35_0:mapQuality(arg_35_0.data.currentInvite.quality))
	arg_35_0.view.widgets.nation:setString(arg_35_0.data.currentInvite.name)

	local var_35_0 = CCJumpBy:create(1.5, ccp(-70, 42), 4, 2)
	local var_35_1 = CCCallFunc:create(function()
		arg_35_0.view.widgets.box:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/yq_bx_c.png"):displayFrame())

		local var_36_0 = rmgr.getAnimation("warlockUpgrade")
		local var_36_1 = CCAnimation:createWithSpriteFrames(var_36_0, 0.05)
		local var_36_2 = CCAnimate:create(var_36_1)
		local var_36_3 = CCSprite:create()

		arg_35_0.view.widgets.box:removeAllChildrenWithCleanup(true)
		arg_35_0.view.widgets.box:addChild(var_36_3)
		var_36_3:setPosition(ccp(50, 50))
		var_36_3:setScale(0.5)
		var_36_3:runAction(var_36_2)
	end)
	local var_35_2 = CCDelayTime:create(1.3)
	local var_35_3 = CCCallFunc:create(function()
		local function var_37_0(arg_38_0)
			arg_35_0:checkAccomplish()

			arg_35_0.localData.onRecieveGift = false

			local var_38_0 = {}

			for iter_38_0, iter_38_1 in ipairs(arg_38_0.action.data.rewards) do
				table.insert(var_38_0, {
					id = arg_35_0:mapGift(tostring(iter_38_1.type)),
					value = iter_38_1.num
				})
			end

			globalAction_gotResource(var_38_0)
		end

		cmgr.sendRequest(var_37_0, actions.getVisitorGift)
	end)
	local var_35_4 = CCArray:create()

	var_35_4:addObject(var_35_0)
	var_35_4:addObject(var_35_1)
	var_35_4:addObject(var_35_2)
	var_35_4:addObject(var_35_3)

	local var_35_5 = CCSequence:create(var_35_4)

	arg_35_0.view.widgets.boxBg:setVisible(true)
	arg_35_0.view.widgets.boxBg:runAction(var_35_5)

	for iter_35_0 = 1, 4 do
		local var_35_6 = CCMoveBy:create(1.5, ccp(-70, 42))
		local var_35_7 = CCArray:create()

		for iter_35_1 = 1, 12 do
			local var_35_8 = CCSprite:create(string.format("res/ui/rankInfo/DailyFeatView/yq_walk%02d.png", iter_35_1))

			var_35_7:addObject(var_35_8:displayFrame())
		end

		local var_35_9 = CCAnimation:createWithSpriteFrames(var_35_7, 0.167)
		local var_35_10 = CCAnimate:create(var_35_9)

		arg_35_0.view.widgets["soldier_" .. iter_35_0]:setVisible(true)
		arg_35_0.view.widgets["soldier_" .. iter_35_0]:runAction(var_35_6)
		arg_35_0.view.widgets["soldier_" .. iter_35_0]:runAction(var_35_10)
	end

	arg_35_0.localData.onRecieveGift = true
end

function var_0_0.recieveGiftWithoutAnimation(arg_39_0)
	local function var_39_0(arg_40_0)
		arg_39_0:checkAccomplish()

		local var_40_0 = {}

		for iter_40_0, iter_40_1 in ipairs(arg_40_0.action.data.rewards) do
			table.insert(var_40_0, {
				id = arg_39_0:mapGift(tostring(iter_40_1.type)),
				value = iter_40_1.num
			})
		end

		globalAction_gotResource(var_40_0)
	end

	cmgr.sendRequest(var_39_0, actions.getVisitorGift)
end

function var_0_0.stopRecieveGift(arg_41_0)
	arg_41_0.view.widgets.box:removeAllChildrenWithCleanup(true)
	arg_41_0.view.widgets.boxBg:stopAllActions()

	for iter_41_0 = 1, 4 do
		arg_41_0.view.widgets["soldier_" .. iter_41_0]:stopAllActions()
	end

	arg_41_0.localData.onRecieveGift = false
end

function var_0_0.resetRecieve(arg_42_0)
	arg_42_0.view.widgets.boxBg:setVisible(false)
	arg_42_0.view.widgets.boxBg:setPosition(ccp(520, 105))
	arg_42_0.view.widgets.box:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/yq_bx.png"):displayFrame())

	for iter_42_0 = 1, 4 do
		arg_42_0.view.widgets["soldier_" .. iter_42_0]:setVisible(false)
	end

	arg_42_0.view.widgets.soldier_1:setPosition(ccp(510, 141))
	arg_42_0.view.widgets.soldier_2:setPosition(ccp(450, 105))
	arg_42_0.view.widgets.soldier_3:setPosition(ccp(560, 40))
	arg_42_0.view.widgets.soldier_4:setPosition(ccp(625, 75))
end

function var_0_0.initRepList(arg_43_0)
	arg_43_0.view.widgets.reputationList:setTouchEnabled(false)

	if var_0_0.staticData.isRepListOpen then
		arg_43_0.view.widgets.reputationListBase:setPositionX(-6)
		arg_43_0.view.widgets.listBtnArrow:setDisplayFrame(CCSprite:create("res/ui/activity/MulNation/wblc_arrow_02.png"):displayFrame())
	else
		arg_43_0.view.widgets.reputationListBase:setPositionX(-308)
		arg_43_0.view.widgets.listBtnArrow:setDisplayFrame(CCSprite:create("res/ui/activity/MulNation/wblc_arrow_01.png"):displayFrame())
	end

	arg_43_0.view.widgets.listBtn:addHandleOfControlEvent(function()
		local var_44_0 = CCArray:create()

		if var_0_0.staticData.isRepListOpen then
			arg_43_0.view.widgets.listBtn:setEnabled(false)

			local var_44_1 = CCEaseExponentialOut:create(CCMoveBy:create(1, ccp(-302, 0)))
			local var_44_2 = CCCallFunc:create(function()
				arg_43_0.view.widgets.listBtnArrow:setDisplayFrame(CCSprite:create("res/ui/activity/MulNation/wblc_arrow_01.png"):displayFrame())
				arg_43_0.view.widgets.listBtn:setEnabled(true)

				var_0_0.staticData.isRepListOpen = false
			end)

			var_44_0:addObject(var_44_1)
			var_44_0:addObject(var_44_2)
		else
			arg_43_0.view.widgets.listBtn:setEnabled(false)

			local var_44_3 = CCEaseExponentialIn:create(CCMoveBy:create(1, ccp(302, 0)))
			local var_44_4 = CCCallFunc:create(function()
				arg_43_0.view.widgets.listBtnArrow:setDisplayFrame(CCSprite:create("res/ui/activity/MulNation/wblc_arrow_02.png"):displayFrame())
				arg_43_0.view.widgets.listBtn:setEnabled(true)

				var_0_0.staticData.isRepListOpen = true
			end)

			var_44_0:addObject(var_44_3)
			var_44_0:addObject(var_44_4)
		end

		local var_44_5 = CCSequence:create(var_44_0)

		arg_43_0.view.widgets.reputationListBase:runAction(var_44_5)
	end, CCControlEventTouchUpInside)
end

function var_0_0.checkAccomplish(arg_47_0)
	local var_47_0 = false

	if arg_47_0.data.myRepute >= arg_47_0.data.reputes[var_0_0.staticData.buffCnt].target then
		arg_47_0.view.widgets.accomplishLayer:setVisible(true)
		arg_47_0.view.widgets.listBtn:setEnabled(false)
		arg_47_0.view.widgets.btnInvite:setEnabled(false)

		var_47_0 = true
	end

	arg_47_0.localData.isAccomplish = var_47_0
end

function var_0_0.mapGift(arg_48_0, arg_48_1)
	if arg_48_0.giftMap[tostring(arg_48_1)] then
		return arg_48_0.giftMap[tostring(arg_48_1)]
	else
		assert(false, string.format("no item pic for type: %s", arg_48_1))

		return arg_48_1
	end
end

function var_0_0.mapQuality(arg_49_0, arg_49_1)
	if arg_49_0.colorMap[tostring(arg_49_1)] then
		return arg_49_0.colorMap[tostring(arg_49_1)]
	else
		return colorQuality[1]
	end
end

function var_0_0.addNewBuffTips(arg_50_0)
	local var_50_0 = {
		y = 80,
		name = "newBuffTips",
		type = "sprite9Tips",
		x = 300,
		pic = {
			frame = false,
			path = "res/ui/weapon/tips_di.png"
		},
		middleRect = CCRectMake(6, 6, 68, 68),
		content = {
			{
				fontSize = 20,
				style = "label_warlock",
				type = "label",
				height = 0,
				width = 280,
				text = language.get(226102, arg_50_0.buffTitle or language.get(226103)),
				color = colorQuality[1],
				halign = kCCTextAlignmentCenter
			}
		}
	}
	local var_50_1 = {}

	uiutil.initWidgets(var_50_1, var_50_0)
	arg_50_0.view.widgets.topLayer:addChild(var_50_1.widgets.newBuffTips, 0, var_0_0.staticData.tags.NEWBUFF_TIPS_FRAME)
end

function var_0_0.addMainTips(arg_51_0)
	local var_51_0 = {
		y = 280,
		name = "mainTips",
		type = "sprite9Tips",
		x = 590,
		pic = {
			frame = false,
			path = "res/ui/weapon/tips_di.png"
		},
		middleRect = CCRectMake(6, 6, 68, 68),
		content = {
			{
				fontSize = 20,
				style = "label_warlock",
				height = 0,
				type = "label",
				width = 380,
				textId = 136099,
				color = colorQuality[1],
				halign = kCCTextAlignmentCenter
			},
			{
				fontSize = 20,
				style = "label_warlock",
				height = 0,
				type = "label",
				width = 380,
				textId = 136100,
				color = colorQuality[1],
				halign = kCCTextAlignmentLeft
			},
			{
				fontSize = 20,
				style = "label_warlock",
				height = 0,
				type = "label",
				width = 380,
				textId = 136101,
				color = colorQuality[1],
				halign = kCCTextAlignmentCenter
			},
			{
				fontSize = 20,
				style = "label_warlock",
				height = 0,
				type = "label",
				width = 380,
				textId = 136102,
				color = colorQuality[1],
				halign = kCCTextAlignmentLeft
			}
		}
	}
	local var_51_1 = {}

	uiutil.initWidgets(var_51_1, var_51_0)
	arg_51_0.view.widgets.topLayer:addChild(var_51_1.widgets.mainTips, 0, var_0_0.staticData.tags.MAIN_TIPS_FRAME)
end

function var_0_0.addBuffTips(arg_52_0, arg_52_1, arg_52_2, arg_52_3)
	local var_52_0 = {
		name = "tip",
		type = "sprite9Tips",
		x = arg_52_2 - 170,
		y = arg_52_3,
		pic = {
			frame = false,
			path = "res/ui/weapon/tips_di.png"
		},
		middleRect = CCRectMake(6, 6, 68, 68),
		content = {
			{
				fontSize = 20,
				height = 0,
				name = "label1",
				type = "label",
				style = "label_warlock",
				width = 200,
				text = arg_52_1.name,
				color = colorQuality[1],
				halign = kCCTextAlignmentLeft
			},
			{
				fontSize = 20,
				height = 0,
				name = "label2",
				type = "label",
				style = "label_warlock",
				width = 200,
				text = arg_52_1.tips,
				color = colorQuality[1],
				halign = kCCTextAlignmentLeft
			},
			{
				fontSize = 20,
				height = 0,
				name = "label3",
				type = "label",
				style = "label_warlock",
				width = 200,
				text = language.get(136103, arg_52_1.times),
				color = colorQuality[1],
				halign = kCCTextAlignmentLeft
			}
		}
	}
	local var_52_1 = {}

	uiutil.initWidgets(var_52_1, var_52_0)
	arg_52_0.view.widgets.topLayer:addChild(var_52_1.widgets.tip, 0, var_0_0.staticData.tags.BUFF_TIPS_FRAME)
end

function var_0_0.removeMainTips(arg_53_0)
	arg_53_0.view.widgets.topLayer:removeChildByTag(var_0_0.staticData.tags.MAIN_TIPS_FRAME, true)
end

function var_0_0.removeBuffTips(arg_54_0)
	arg_54_0.view.widgets.topLayer:removeChildByTag(var_0_0.staticData.tags.BUFF_TIPS_FRAME, true)
end

function var_0_0.removeNewBuffTips(arg_55_0)
	arg_55_0.view.widgets.topLayer:removeChildByTag(var_0_0.staticData.tags.NEWBUFF_TIPS_FRAME, true)
end

function var_0_0.onEnter(arg_56_0)
	arg_56_0.view.widgets.topLayer:registerScriptTouchHandler(function(arg_57_0, arg_57_1, arg_57_2)
		if arg_57_0 == CCTOUCHBEGAN then
			if not tool.checkIfTouch(arg_56_0.view.widgets.tipBtn, arg_57_1, arg_57_2) then
				arg_56_0:removeMainTips()
			end

			for iter_57_0 = 1, var_0_0.staticData.buffCnt do
				if tool.checkIfTouch(arg_56_0.view.widgets["buff_" .. iter_57_0], arg_57_1, arg_57_2) then
					arg_56_0:addBuffTips(arg_56_0.data.reputes[iter_57_0], arg_57_1, arg_57_2)

					break
				end
			end

			return true
		elseif arg_57_0 == CCTOUCHMOVED then
			return true
		elseif arg_57_0 == CCTOUCHENDED then
			arg_56_0:removeBuffTips()
			arg_56_0:removeNewBuffTips()

			return true
		end
	end, false, false)
	arg_56_0.view.widgets.topLayer:setTouchEnabled(true)
end

function var_0_0.onExit(arg_58_0)
	return
end

return var_0_0
