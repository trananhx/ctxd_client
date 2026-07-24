return {
	name = "drinkTipsFrame",
	type = "scrollview",
	bounceable = false,
	y = -180,
	x = -visibleSize.width / 2 + platform.getSafeDistance(),
	anchorPoint = ccp(0, 0.5),
	viewSize = CCSizeMake(446, 360),
	direction = kCCScrollViewDirectionHorizontal,
	children = {
		{
			name = "drinkTipsBg",
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/kfsy/jiangliTips/jxsy_list_di.png"
			},
			children = {
				{
					y = 330,
					name = "jxsy_list_title_di_2",
					type = "sprite",
					x = 197.90789999999998,
					pic = {
						frame = false,
						path = "res/ui/kfsy/jiangliTips/jxsy_list_title_di.png"
					},
					children = {
						{
							y = 35.7022,
							name = "jxsy_list_word_jxjjl_4",
							type = "sprite",
							x = 191.1342,
							pic = {
								frame = false,
								path = "res/ui/kfsy/jiangliTips/jxsy_list_word_jxjjl.png"
							}
						}
					}
				},
				{
					zoomOnTouchDown = false,
					name = "listBtn",
					h = 362,
					type = "button",
					w = 52,
					y = 179.9997,
					x = 417.0191,
					normal = {
						frame = false,
						path = "res/ui/kfsy/jiangliTips/jxsy_list_btn.png"
					},
					touched = {
						frame = false,
						path = "res/ui/kfsy/jiangliTips/jxsy_list_btn.png"
					},
					children = {
						{
							y = 191.3312,
							name = "jxsy_list_word_ckjxjjl_5",
							type = "sprite",
							x = 27.5155,
							pic = {
								frame = false,
								path = "res/ui/kfsy/jiangliTips/jxsy_list_word_ckjxjjl.png"
							}
						},
						{
							y = 37.3219,
							name = "listBtnArrow",
							type = "sprite",
							x = 27.5158,
							pic = {
								frame = false,
								path = "res/ui/activity/MulNation/wblc_arrow_01.png"
							}
						}
					}
				},
				{
					y = 281,
					name = "jxsy_list_1",
					type = "sprite",
					x = 195,
					pic = {
						frame = false,
						path = "res/ui/kfsy/jiangliTips/jxsy_list_l1.png"
					},
					children = {
						{
							y = 24,
							type = "richLine",
							gap = 5,
							x = 18,
							content = {
								{
									fontSize = 24,
									style = "label_warlock",
									type = "label",
									textId = 320454,
									color = colorQuality[3]
								},
								{
									fontSize = 24,
									style = "label_warlock",
									type = "label",
									text = language.get(320460, 3),
									color = colorText[10003]
								},
								{
									scale = 0.7,
									type = "sprite",
									pic = {
										frame = true,
										path = "res_icon_114.png"
									}
								},
								{
									fontSize = 24,
									style = "label_warlock",
									text = "x1",
									type = "label",
									color = colorText[10003]
								}
							}
						}
					}
				},
				{
					y = 230,
					name = "jxsy_list_2",
					type = "sprite",
					x = 195,
					pic = {
						frame = false,
						path = "res/ui/kfsy/jiangliTips/jxsy_list_l2.png"
					},
					children = {
						{
							y = 24,
							type = "richLine",
							gap = 5,
							x = 18,
							content = {
								{
									fontSize = 24,
									style = "label_warlock",
									type = "label",
									textId = 320455,
									color = colorQuality[3]
								},
								{
									fontSize = 24,
									style = "label_warlock",
									type = "label",
									text = language.get(320460, 3),
									color = colorText[10003]
								},
								{
									scale = 0.7,
									type = "sprite",
									pic = {
										frame = true,
										path = "res_icon_114.png"
									}
								},
								{
									fontSize = 24,
									style = "label_warlock",
									text = "x2",
									type = "label",
									color = colorText[10003]
								}
							}
						}
					}
				},
				{
					y = 179,
					name = "jxsy_list_3",
					type = "sprite",
					x = 195,
					pic = {
						frame = false,
						path = "res/ui/kfsy/jiangliTips/jxsy_list_l1.png"
					},
					children = {
						{
							y = 24,
							type = "richLine",
							gap = 5,
							x = 18,
							content = {
								{
									fontSize = 24,
									style = "label_warlock",
									type = "label",
									textId = 320456,
									color = colorQuality[3]
								},
								{
									fontSize = 24,
									style = "label_warlock",
									type = "label",
									text = language.get(320460, 6),
									color = colorText[10003]
								},
								{
									scale = 0.7,
									type = "sprite",
									pic = {
										frame = true,
										path = "res_icon_114.png"
									}
								},
								{
									fontSize = 24,
									style = "label_warlock",
									text = "x2",
									type = "label",
									color = colorText[10003]
								}
							}
						}
					}
				},
				{
					y = 128,
					name = "jxsy_list_4",
					type = "sprite",
					x = 195,
					pic = {
						frame = false,
						path = "res/ui/kfsy/jiangliTips/jxsy_list_l2.png"
					},
					children = {
						{
							y = 24,
							type = "richLine",
							gap = 5,
							x = 18,
							content = {
								{
									fontSize = 24,
									style = "label_warlock",
									type = "label",
									textId = 320457,
									color = colorQuality[3]
								},
								{
									fontSize = 24,
									style = "label_warlock",
									type = "label",
									text = language.get(320461),
									color = colorText[10003]
								},
								{
									scale = 0.7,
									type = "sprite",
									pic = {
										frame = true,
										path = "res_icon_114.png"
									}
								},
								{
									fontSize = 24,
									style = "label_warlock",
									text = "x2",
									type = "label",
									color = colorText[10003]
								}
							}
						}
					}
				},
				{
					y = 77,
					name = "jxsy_list_5",
					type = "sprite",
					x = 195,
					pic = {
						frame = false,
						path = "res/ui/kfsy/jiangliTips/jxsy_list_l1.png"
					},
					children = {
						{
							y = 24,
							type = "richLine",
							gap = 5,
							x = 18,
							content = {
								{
									fontSize = 24,
									style = "label_warlock",
									type = "label",
									textId = 320458,
									color = colorQuality[3]
								},
								{
									fontSize = 24,
									style = "label_warlock",
									type = "label",
									text = language.get(320462),
									color = colorText[10003]
								},
								{
									scale = 0.7,
									type = "sprite",
									pic = {
										frame = true,
										path = "res_icon_114.png"
									}
								},
								{
									fontSize = 24,
									style = "label_warlock",
									text = "x3",
									type = "label",
									color = colorText[10003]
								}
							}
						}
					}
				},
				{
					y = 26,
					name = "jxsy_list_6",
					type = "sprite",
					x = 195,
					pic = {
						frame = false,
						path = "res/ui/kfsy/jiangliTips/jxsy_list_l2.png"
					},
					children = {
						{
							y = 24,
							type = "richLine",
							gap = 5,
							x = 18,
							content = {
								{
									fontSize = 24,
									style = "label_warlock",
									type = "label",
									textId = 320459,
									color = colorQuality[3]
								},
								{
									fontSize = 24,
									style = "label_warlock",
									type = "label",
									text = language.get(320461),
									color = colorText[10003]
								},
								{
									scale = 0.7,
									type = "sprite",
									pic = {
										frame = true,
										path = "res_icon_114.png"
									}
								},
								{
									fontSize = 24,
									style = "label_warlock",
									text = "x9",
									type = "label",
									color = colorText[10003]
								}
							}
						}
					}
				}
			}
		}
	}
}
