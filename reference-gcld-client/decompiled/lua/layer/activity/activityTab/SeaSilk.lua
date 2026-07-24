local var_0_0 = require("res/native/offset").get("layer.activity.SeaSilk")
local var_0_1 = class("SeaSilk", function()
	return createBaseLayer()
end)
local var_0_2 = {
	{}
}

var_0_2[1][1] = ccp(217, 219)
var_0_2[1][2] = ccp(303, 142)
var_0_2[1][3] = ccp(454, 135)
var_0_2[1][4] = ccp(529, 111)
var_0_2[1][5] = ccp(707, 121)
var_0_2[1][6] = ccp(873, 117)
var_0_2[2] = {}
var_0_2[2][1] = ccp(136, 77)
var_0_2[2][2] = ccp(229, 124)
var_0_2[2][3] = ccp(392, 143)
var_0_2[2][4] = ccp(504, 136)
var_0_2[2][5] = ccp(631, 138)
var_0_2[2][6] = ccp(759, 190)
var_0_2[3] = {}
var_0_2[3][1] = ccp(127, 167)
var_0_2[3][2] = ccp(231, 131)
var_0_2[3][3] = ccp(403, 146)
var_0_2[3][4] = ccp(567, 145)
var_0_2[3][5] = ccp(717, 102)
var_0_2[3][6] = ccp(796, 52)

local var_0_3 = {
	{
		pic = "res/ui/world/world_silk.jpg",
		type = 116
	},
	{
		pic = "res/ui/activity/seaSilk/jinnang.png",
		type = 126
	}
}
local var_0_4 = {
	{
		pic = "res/ui/resource/silkroad/gjcb.jpg",
		type = 10000001
	},
	{
		pic = "res/ui/resource/silkroad/gj1.jpg",
		type = 10000002
	},
	{
		pic = "res/ui/resource/silkroad/gj2.jpg",
		type = 10000003
	},
	{
		pic = "res/ui/resource/silkroad/gj3.jpg",
		type = 10000004
	},
	{
		pic = "res/ui/resource/silkroad/gj4.jpg",
		type = 10000005
	},
	{
		pic = "res/ui/resource/silkroad/gj5.jpg",
		type = 10000006
	},
	{
		pic = "res/ui/resource/silkroad/cqdkj.jpg",
		type = 10000007
	},
	{
		pic = "res/ui/resource/silkroad/kj1.jpg",
		type = 10000008
	},
	{
		pic = "res/ui/resource/silkroad/kj2.jpg",
		type = 10000009
	},
	{
		pic = "res/ui/resource/silkroad/kj3.jpg",
		type = 10000010
	},
	{
		pic = "res/ui/resource/silkroad/kj4.jpg",
		type = 10000011
	},
	{
		pic = "res/ui/resource/silkroad/kj5.jpg",
		type = 10000012
	},
	{
		pic = "res/ui/resource/silkroad/cpddd.jpg",
		type = 10000013
	},
	{
		pic = "res/ui/resource/silkroad/dd1.jpg",
		type = 10000014
	},
	{
		pic = "res/ui/resource/silkroad/dd2.jpg",
		type = 10000015
	},
	{
		pic = "res/ui/resource/silkroad/dd3.jpg",
		type = 10000016
	},
	{
		pic = "res/ui/resource/silkroad/dd4.jpg",
		type = 10000017
	},
	{
		pic = "res/ui/resource/silkroad/dd5.jpg",
		type = 10000018
	},
	{
		pic = "res/ui/resource/silkroad/psdbd.jpg",
		type = 10000019
	},
	{
		pic = "res/ui/resource/silkroad/bd1.jpg",
		type = 10000020
	},
	{
		pic = "res/ui/resource/silkroad/bd2.jpg",
		type = 10000021
	},
	{
		pic = "res/ui/resource/silkroad/bd3.jpg",
		type = 10000022
	},
	{
		pic = "res/ui/resource/silkroad/bd4.jpg",
		type = 10000023
	},
	{
		pic = "res/ui/resource/silkroad/bd5.jpg",
		type = 10000024
	},
	{
		pic = "res/ui/resource/silkroad/ssdhg.jpg",
		type = 10000025
	},
	{
		pic = "res/ui/resource/silkroad/hg1.jpg",
		type = 10000026
	},
	{
		pic = "res/ui/resource/silkroad/hg2.jpg",
		type = 10000027
	},
	{
		pic = "res/ui/resource/silkroad/hg3.jpg",
		type = 10000028
	},
	{
		pic = "res/ui/resource/silkroad/hg4.jpg",
		type = 10000029
	},
	{
		pic = "res/ui/resource/silkroad/hg5.jpg",
		type = 10000030
	},
	{
		pic = "res/ui/weapon/silkTreasure/treasure_icon/pifengtu.png",
		type = 10000036
	},
	{
		pic = "res/ui/resource/silkroad/pf1.jpg",
		type = 10000037
	},
	{
		pic = "res/ui/resource/silkroad/pf2.jpg",
		type = 10000038
	},
	{
		pic = "res/ui/resource/silkroad/pf3.jpg",
		type = 10000039
	},
	{
		pic = "res/ui/resource/silkroad/pf4.jpg",
		type = 10000040
	},
	{
		pic = "res/ui/resource/silkroad/pf5.jpg",
		type = 10000041
	},
	{
		pic = "res/ui/weapon/silkTreasure/treasure_icon/qiangtu.png",
		type = 10000043
	},
	{
		pic = "res/ui/resource/silkroad/cq1.jpg",
		type = 10000044
	},
	{
		pic = "res/ui/resource/silkroad/cq2.jpg",
		type = 10000045
	},
	{
		pic = "res/ui/resource/silkroad/cq3.jpg",
		type = 10000046
	},
	{
		pic = "res/ui/resource/silkroad/cq4.jpg",
		type = 10000047
	},
	{
		pic = "res/ui/resource/silkroad/cq5.jpg",
		type = 10000048
	},
	{
		pic = "res/ui/weapon/silkTreasure/treasure_icon/kuitu.png",
		type = 10000050
	},
	{
		pic = "res/ui/resource/silkroad/tk1.jpg",
		type = 10000051
	},
	{
		pic = "res/ui/resource/silkroad/tk2.jpg",
		type = 10000052
	},
	{
		pic = "res/ui/resource/silkroad/tk3.jpg",
		type = 10000053
	},
	{
		pic = "res/ui/resource/silkroad/tk4.jpg",
		type = 10000054
	},
	{
		pic = "res/ui/resource/silkroad/tk5.jpg",
		type = 10000055
	},
	{
		pic = "res/ui/weapon/silkTreasure/treasure_icon/jinduntu.png",
		type = 10000057
	},
	{
		pic = "res/ui/resource/silkroad/yd1.jpg",
		type = 10000058
	},
	{
		pic = "res/ui/resource/silkroad/yd2.jpg",
		type = 10000059
	},
	{
		pic = "res/ui/resource/silkroad/yd3.jpg",
		type = 10000060
	},
	{
		pic = "res/ui/resource/silkroad/yd4.jpg",
		type = 10000061
	},
	{
		pic = "res/ui/resource/silkroad/yd5.jpg",
		type = 10000062
	}
}

var_0_1.layout = {
	y = 0,
	name = "Scene",
	type = "node",
	x = 0,
	children = {
		{
			name = "bg",
			type = "sprite",
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 - 30,
			pic = {
				path = "res/ui/comment/bg1.jpg"
			},
			children = {
				{
					text = "",
					name = "leftTime",
					style = "label_warlock",
					type = "label",
					fontSize = 25,
					y = 470,
					color = ccc3(253, 98, 98),
					x = 690 + (var_0_0.lefttimeOffsetX or 0)
				},
				{
					y = 480,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/activity/seaSilk/hssl_title.png"
					}
				},
				{
					y = 440,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/activity/seaSilk/hssl_line.png"
					}
				},
				{
					y = 305,
					name = "currentMap",
					type = "sprite",
					x = 458,
					pic = {
						path = "res/ui/activity/seaSilk/hssc_map_01.jpg"
					},
					children = {
						{
							y = 246,
							type = "sprite",
							x = 104,
							pic = {
								path = "res/ui/activity/seaSilk/hssl_map_word_di.png"
							},
							children = {
								{
									fontSize = 22,
									style = "label_warlock",
									name = "label_progress",
									type = "label",
									x = 104,
									y = 23,
									color = colorQuality[1],
									text = language.get("222604_seasilk", 0, 15)
								}
							}
						},
						{
							name = "currentBoat",
							type = "sprite",
							x = var_0_2[1][1].x,
							y = var_0_2[1][1].y,
							pic = {
								path = "res/default.png"
							},
							children = {
								{
									y = 0,
									name = "realBoat",
									type = "sprite",
									x = 0,
									pic = {
										path = "res/ui/activity/seaSilk/move30001.png"
									}
								},
								{
									y = -40,
									name = "realBoatDi",
									z = 1000,
									type = "sprite",
									x = 0,
									pic = {
										path = "res/ui/activity/seaSilk/hssl_map_word_di.png"
									},
									children = {
										{
											y = 23,
											name = "realBoatState",
											type = "sprite",
											x = 104,
											pic = {
												path = "res/ui/activity/seaSilk/hssl_map_word_cybz.png"
											}
										}
									}
								},
								{
									visible = false,
									name = "btn_boat",
									h = 92,
									type = "button",
									w = 94,
									zoomOnTouchDown = true,
									y = 45,
									x = 15,
									normal = {
										frame = false,
										path = "res/ui/activity/seaSilk/hssl_map_bubble.png"
									},
									touched = {
										frame = false,
										path = "res/ui/activity/seaSilk/hssl_map_bubble_c.png"
									},
									children = {
										{
											y = 55,
											x = 55,
											scale = 0.6,
											type = "sprite",
											pic = {
												path = "res/ui/resource/silkroad/sczl_box.png"
											}
										}
									}
								}
							}
						},
						{
							name = "rateNum",
							type = "sprite",
							anchorPoint = ccp(1, 0),
							x = var_0_2[1][6].x + 30,
							y = var_0_2[1][6].y - 30,
							pic = {
								path = "res/ui/activity/seaSilk/hssl_map_word_jl2x.png"
							}
						},
						{
							y = 134,
							name = "activityEnd",
							visible = false,
							type = "sprite",
							x = 454,
							pic = {
								path = "res/ui/activity/gemMine/bskd_word_04.png"
							}
						}
					}
				},
				{
					y = 170,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/activity/seaSilk/hssl_line.png"
					}
				},
				{
					y = 85,
					name = "choosePeople",
					type = "sprite",
					x = 458,
					pic = {
						path = "res/ui/activity/seaSilk/hssc_di_down.jpg"
					},
					children = {
						{
							y = 93,
							name = "people1",
							type = "sprite",
							x = 211,
							pic = {
								path = "res/ui/activity/seaSilk/hssl_tx_di.png"
							},
							children = {
								{
									y = 43,
									name = "peoplePic1",
									type = "sprite",
									x = 42,
									pic = {
										path = "res/ui/common/generalPic/generalPic_0.jpg"
									}
								},
								{
									y = -15,
									name = "peopleName1",
									type = "sprite",
									x = 42,
									pic = {
										path = "res/ui/activity/seaSilk/hssl_tx_word_ss.png"
									}
								}
							}
						},
						{
							y = 93,
							name = "people2",
							type = "sprite",
							x = 321,
							pic = {
								path = "res/ui/activity/seaSilk/hssl_tx_di.png"
							},
							children = {
								{
									y = 43,
									name = "peoplePic2",
									type = "sprite",
									x = 42,
									pic = {
										path = "res/ui/common/generalPic/generalPic_0.jpg"
									}
								},
								{
									y = -15,
									name = "peopleName2",
									type = "sprite",
									x = 42,
									pic = {
										path = "res/ui/activity/seaSilk/hssl_tx_word_ds.png"
									}
								}
							}
						},
						{
							y = 93,
							name = "people3",
							type = "sprite",
							x = 431,
							pic = {
								path = "res/ui/activity/seaSilk/hssl_tx_di.png"
							},
							children = {
								{
									y = 43,
									name = "peoplePic3",
									type = "sprite",
									x = 42,
									pic = {
										path = "res/ui/common/generalPic/generalPic_0.jpg"
									}
								},
								{
									y = -15,
									name = "peopleName3",
									type = "sprite",
									x = 42,
									pic = {
										path = "res/ui/activity/seaSilk/hssl_tx_word_df.png"
									}
								}
							}
						},
						{
							y = 93,
							name = "people4",
							type = "sprite",
							x = 541,
							pic = {
								path = "res/ui/activity/seaSilk/hssl_tx_di.png"
							},
							children = {
								{
									y = 43,
									name = "peoplePic4",
									type = "sprite",
									x = 42,
									pic = {
										path = "res/ui/common/generalPic/generalPic_0.jpg"
									}
								},
								{
									y = -15,
									name = "peopleName4",
									type = "sprite",
									x = 42,
									pic = {
										path = "res/ui/activity/seaSilk/hssl_tx_word_cz.png"
									}
								}
							}
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_pinqing",
					h = 56,
					type = "button",
					w = 212,
					y = 113,
					x = 780,
					normal = {
						frame = false,
						path = "res/ui/common/button/sdyjs_btn_01.png"
					},
					touched = {
						frame = false,
						path = "res/ui/common/button/sdyjs_btn_01_c.png"
					},
					children = {
						{
							x = 40,
							name = "gold_icon",
							y = 38,
							type = "sprite",
							pic = {
								path = "res/ui/activity/ironRotary/yuanbao.png"
							}
						},
						{
							fontSize = 24,
							style = "label_warlock",
							name = "label_pinqingPrice",
							type = "label",
							text = "0",
							x = 40,
							y = 20,
							color = colorQuality[4]
						},
						{
							fontSize = 24,
							style = "label_warlock",
							name = "pinqing_free",
							type = "label",
							x = 40,
							y = 38,
							color = colorQuality[4],
							text = language.get(85060)
						},
						{
							fontSize = 24,
							style = "label_warlock",
							name = "pinqingContent",
							type = "label",
							y = 32,
							x = 120,
							text = language.get("222601_seasilk")
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_pinqingGold",
					h = 56,
					type = "button",
					w = 212,
					y = 48,
					x = 780,
					normal = {
						frame = false,
						path = "res/ui/common/button/sdyjs_btn_01.png"
					},
					touched = {
						frame = false,
						path = "res/ui/common/button/sdyjs_btn_01_c.png"
					},
					children = {
						{
							x = 40,
							y = 38,
							type = "sprite",
							pic = {
								path = "res/ui/activity/ironRotary/yuanbao.png"
							}
						},
						{
							fontSize = 24,
							style = "label_warlock",
							name = "label_pinqingGoldPrice",
							type = "label",
							text = "0",
							x = 40,
							y = 20,
							color = colorQuality[4]
						},
						{
							fontSize = 24,
							style = "label_warlock",
							y = 32,
							type = "label",
							width = 90,
							x = 127,
							height = 0,
							text = language.get("222602_seasilk")
						}
					}
				},
				{
					style = "button_tip",
					name = "btn_tip",
					y = 470,
					type = "button",
					x = 850
				},
				{
					y = -7,
					name = "npcBg1",
					type = "sprite",
					zorder = 100,
					visible = false,
					x = 0,
					pic = {
						path = "res/default.png"
					},
					anchorPoint = ccp(0, 0),
					children = {
						{
							y = 0,
							type = "sprite",
							x = 0,
							anchorPoint = ccp(0, 0),
							pic = {
								path = "res/ui/activity/seaSilk/hssl_dhk_di.png"
							},
							children = {
								{
									fontSize = 22,
									name = "npcMsg1",
									x = 280,
									type = "label",
									height = 0,
									y = 162,
									width = 540,
									color = color_whi,
									anchorPoint = ccp(0, 1),
									halign = kCCTextAlignmentLeft
								},
								{
									y = 0,
									name = "npcPic1",
									type = "sprite",
									x = 0,
									anchorPoint = ccp(0, 0),
									pic = {
										path = "res/ui/common/halfPic/halfPic_duihr.png"
									}
								},
								{
									zoomOnTouchDown = true,
									name = "btn_addGezi",
									h = 62,
									type = "button",
									w = 195,
									y = 48,
									x = 780,
									normal = {
										frame = false,
										path = "res/ui/common/button/public_btn_red.png"
									},
									touched = {
										frame = false,
										path = "res/ui/common/button/public_btn_red_c.png"
									},
									children = {
										{
											x = 29,
											y = 33,
											type = "sprite",
											pic = {
												path = "res/ui/common/button/public_btn_gold.png"
											}
										},
										{
											x = 29,
											name = "gold_icon_gezi",
											y = 38,
											type = "sprite",
											pic = {
												path = "res/ui/activity/ironRotary/yuanbao.png"
											}
										},
										{
											fontSize = 24,
											style = "label_warlock",
											name = "gezi_free",
											type = "label",
											x = 29,
											y = 38,
											color = colorQuality[4],
											text = language.get(85060)
										},
										{
											fontSize = 24,
											style = "label_warlock",
											name = "label_addGezi",
											type = "label",
											text = "0",
											x = 29,
											y = 20,
											color = colorQuality[4]
										},
										{
											fontSize = 24,
											style = "label_warlock",
											name = "name_addGezi",
											type = "label",
											y = 34,
											x = 115,
											text = language.get("222608_seasilk")
										}
									}
								},
								{
									zoomOnTouchDown = true,
									name = "btn_tansuo",
									h = 62,
									type = "button",
									w = 195,
									y = 48,
									x = 530,
									normal = {
										frame = false,
										path = "res/ui/common/button/public_btn_green.png"
									},
									touched = {
										frame = false,
										path = "res/ui/common/button/public_btn_green_c.png"
									},
									children = {
										{
											fontSize = 24,
											style = "label_warlock",
											y = 34,
											type = "label",
											x = 97,
											text = language.get("222609_seasilk")
										}
									}
								}
							}
						}
					}
				},
				{
					y = 306,
					name = "endReward",
					visible = false,
					type = "sprite",
					x = 457,
					pic = {
						path = "res/ui/resource/silkroad/sczl_jl_d.png"
					},
					children = {
						{
							y = 227,
							x = 437,
							type = "sprite",
							pic = {
								path = "res/ui/activity/seaSilk/hssl_js_title.png"
							}
						},
						{
							y = 230,
							name = "rewardRate",
							type = "sprite",
							x = 660,
							pic = {
								path = "res/ui/activity/seaSilk/hssl_js_word_5x.png"
							}
						},
						{
							y = 166,
							name = "rewardBg",
							type = "sprite",
							x = 437,
							pic = {
								path = "res/ui/activity/seaSilk/hssl_js_di1.png"
							},
							children = {
								{
									y = 70,
									name = "node4",
									type = "sprite",
									scaleX = 0.82,
									x = 227.5,
									scaleY = 0.82,
									pic = {
										path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
									},
									children = {
										{
											y = 40,
											name = "chain4",
											type = "sprite",
											x = 40,
											pic = {
												path = "res/ui/activity/seaSilk/hssl_icon_lock.png"
											}
										}
									}
								},
								{
									y = 70,
									name = "node2",
									type = "sprite",
									scaleX = 0.9,
									x = 327.5,
									scaleY = 0.9,
									pic = {
										path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
									},
									children = {
										{
											y = 40,
											name = "chain2",
											type = "sprite",
											x = 40,
											pic = {
												path = "res/ui/activity/seaSilk/hssl_icon_lock.png"
											}
										}
									}
								},
								{
									y = 70,
									name = "node1",
									type = "sprite",
									x = 437.5,
									pic = {
										path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
									},
									children = {
										{
											y = 40,
											name = "chain1",
											type = "sprite",
											x = 40,
											pic = {
												path = "res/ui/activity/seaSilk/hssl_icon_lock.png"
											}
										}
									}
								},
								{
									y = 70,
									name = "node3",
									type = "sprite",
									scaleX = 0.9,
									x = 547.5,
									scaleY = 0.9,
									pic = {
										path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
									},
									children = {
										{
											y = 40,
											name = "chain3",
											type = "sprite",
											x = 40,
											pic = {
												path = "res/ui/activity/seaSilk/hssl_icon_lock.png"
											}
										}
									}
								},
								{
									y = 70,
									name = "node5",
									type = "sprite",
									scaleX = 0.82,
									x = 647.5,
									scaleY = 0.82,
									pic = {
										path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
									},
									children = {
										{
											y = 40,
											name = "chain5",
											type = "sprite",
											x = 40,
											pic = {
												path = "res/ui/activity/seaSilk/hssl_icon_lock.png"
											}
										}
									}
								}
							}
						},
						{
							y = 45,
							name = "zymz_pb_bg_Copy",
							type = "sprite",
							x = 437,
							pic = {
								path = "res/ui/activity/consumeGift/xfshl_pb_bg.png"
							},
							children = {
								{
									y = 22,
									name = "loadingbar2",
									type = "progressbar",
									x = 290.5,
									pic = {
										path = "res/ui/activity/consumeGift/xfshl_pb.png"
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

local var_0_5 = {
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
			name = "tipMsg",
			height = 0,
			type = "label",
			width = 400,
			textId = "222603_seasilk",
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}

function var_0_1.setBoatState(arg_2_0)
	if arg_2_0.boatState == 1 then
		arg_2_0.view.widgets.npcBg1:setVisible(false)
		arg_2_0.view.widgets.endReward:setVisible(false)
		arg_2_0.view.widgets.choosePeople:setVisible(true)
		arg_2_0.view.widgets.btn_pinqing:setVisible(true)
		arg_2_0.view.widgets.btn_pinqingGold:setVisible(true)
	elseif arg_2_0.boatState == 2 then
		arg_2_0.view.widgets.npcBg1:setVisible(true)
		arg_2_0.view.widgets.btn_addGezi:setVisible(true)
		arg_2_0.view.widgets.btn_tansuo:setVisible(true)
		arg_2_0.view.widgets.endReward:setVisible(true)
		arg_2_0.view.widgets.choosePeople:setVisible(false)
		arg_2_0.view.widgets.btn_pinqing:setVisible(false)
		arg_2_0.view.widgets.btn_pinqingGold:setVisible(false)
	elseif arg_2_0.boatState == 3 then
		arg_2_0.view.widgets.npcBg1:setVisible(true)
		arg_2_0.view.widgets.btn_addGezi:setVisible(false)
		arg_2_0.view.widgets.btn_tansuo:setVisible(false)
		arg_2_0.view.widgets.endReward:setVisible(false)
		arg_2_0.view.widgets.choosePeople:setVisible(false)
		arg_2_0.view.widgets.btn_pinqing:setVisible(false)
		arg_2_0.view.widgets.btn_pinqingGold:setVisible(false)
	elseif arg_2_0.boatState == 4 then
		arg_2_0.view.widgets.npcBg1:setVisible(true)
		arg_2_0.view.widgets.btn_addGezi:setVisible(false)
		arg_2_0.view.widgets.btn_tansuo:setVisible(false)
		arg_2_0.view.widgets.endReward:setVisible(false)
		arg_2_0.view.widgets.choosePeople:setVisible(false)
		arg_2_0.view.widgets.btn_pinqing:setVisible(false)
		arg_2_0.view.widgets.btn_pinqingGold:setVisible(false)
	end
end

function var_0_1.showWindow(arg_3_0)
	local function var_3_0(arg_4_0)
		local var_4_0 = arg_4_0.data or arg_4_0.action.data

		arg_3_0.windowsInfo = var_4_0.windowsInfo
		arg_3_0.boatState = 2

		arg_3_0:setBoatState()
		arg_3_0.view.widgets.btn_boat:setVisible(false)

		for iter_4_0 = 1, 5 do
			arg_3_0.view.widgets["node" .. iter_4_0]:removeChildByTag(12345, true)
		end

		if arg_3_0.windowsInfo.freeBuyTimes > 0 then
			arg_3_0.view.widgets.label_addGezi:setString("x" .. arg_3_0.windowsInfo.freeBuyTimes)
			arg_3_0.view.widgets.gezi_free:setVisible(true)
			arg_3_0.view.widgets.gold_icon_gezi:setVisible(false)
		else
			arg_3_0.view.widgets.label_addGezi:setString(arg_3_0.windowsInfo.gold)
			arg_3_0.view.widgets.gezi_free:setVisible(false)
			arg_3_0.view.widgets.gold_icon_gezi:setVisible(true)
		end

		for iter_4_1 = 1, 5 do
			if iter_4_1 <= arg_3_0.windowsInfo.openWindowsNum then
				arg_3_0.view.widgets["chain" .. iter_4_1]:setDisplayFrame(CCSprite:create("res/ui/activity/seaSilk/hssl_icon_wenhao.png"):displayFrame())
			else
				arg_3_0.view.widgets["chain" .. iter_4_1]:setDisplayFrame(CCSprite:create("res/ui/activity/seaSilk/hssl_icon_lock.png"):displayFrame())
			end
		end

		if arg_3_0.info.posInfo and arg_3_0.info.posInfo.special then
			arg_3_0.view.widgets.rewardRate:setVisible(true)

			if arg_3_0.info.posInfo.map == 1 then
				arg_3_0.view.widgets.rewardRate:setDisplayFrame(CCSprite:create("res/ui/activity/seaSilk/hssl_js_word_2x.png"):displayFrame())
			elseif arg_3_0.info.posInfo.map == 2 then
				arg_3_0.view.widgets.rewardRate:setDisplayFrame(CCSprite:create("res/ui/activity/seaSilk/hssl_js_word_3x.png"):displayFrame())
			else
				arg_3_0.view.widgets.rewardRate:setDisplayFrame(CCSprite:create("res/ui/activity/seaSilk/hssl_js_word_5x.png"):displayFrame())
			end

			arg_3_0.view.widgets.npcMsg1:setString(language.get("222610_seasilk"))
			arg_3_0.view.widgets.rewardBg:setDisplayFrame(CCSprite:create("res/ui/activity/seaSilk/hssl_js_di2.png"):displayFrame())
		else
			arg_3_0.view.widgets.npcMsg1:setString(language.get("222606_seasilk"))
			arg_3_0.view.widgets.rewardRate:setVisible(false)
			arg_3_0.view.widgets.rewardBg:setDisplayFrame(CCSprite:create("res/ui/activity/seaSilk/hssl_js_di1.png"):displayFrame())
		end
	end

	cmgr.sendRequest(var_3_0, actions.getWindowsInfo)
end

function var_0_1.showPanel(arg_5_0, arg_5_1)
	arg_5_0.info = arg_5_1

	arg_5_0:setBoatState()

	if arg_5_0.boatState == 3 then
		arg_5_0.view.widgets.npcMsg1:setString(language.get("222605_seasilk"))
	elseif arg_5_0.boatState == 4 then
		arg_5_0.view.widgets.npcMsg1:setString(language.get("222607_seasilk"))
	end

	if arg_5_0.info.employInfo then
		local var_5_0 = arg_5_0.info.employInfo

		if var_5_0 and var_5_0.employeeNum then
			local var_5_1 = {}

			var_5_1[1] = "shuishou"
			var_5_1[2] = "duoshou"
			var_5_1[3] = "dafu"
			var_5_1[4] = "chuanzhang"

			for iter_5_0 = 1, math.min(var_5_0.employeeNum, 4) do
				arg_5_0.view.widgets["peoplePic" .. iter_5_0]:setDisplayFrame(CCSprite:create("res/ui/activity/seaSilk/" .. var_5_1[iter_5_0] .. ".jpg"):displayFrame())
			end

			for iter_5_1 = math.min(var_5_0.employeeNum, 4) + 1, 4 do
				arg_5_0.view.widgets["peoplePic" .. iter_5_1]:setDisplayFrame(CCSprite:create("res/ui/common/generalPic/generalPic_0.jpg"):displayFrame())
			end
		end

		if var_5_0.freeTimes > 0 then
			arg_5_0.view.widgets.label_pinqingPrice:setString("x" .. var_5_0.freeTimes)
			arg_5_0.view.widgets.pinqing_free:setVisible(true)
			arg_5_0.view.widgets.gold_icon:setVisible(false)
		else
			arg_5_0.view.widgets.label_pinqingPrice:setString(var_5_0.freeGold)
			arg_5_0.view.widgets.pinqing_free:setVisible(false)
			arg_5_0.view.widgets.gold_icon:setVisible(true)
		end

		arg_5_0.view.widgets.label_pinqingGoldPrice:setString(var_5_0.gold)
	end

	if arg_5_0.info.posInfo and arg_5_0.info.employInfo then
		local var_5_2 = arg_5_0.info.posInfo
		local var_5_3 = arg_5_0.info.employInfo

		if var_5_2.map > 3 then
			var_5_2.map = 3
		end

		arg_5_0.view.widgets.currentMap:setDisplayFrame(CCSprite:create("res/ui/activity/seaSilk/hssc_map_0" .. var_5_2.map .. ".jpg"):displayFrame())
		arg_5_0.view.widgets.label_progress:setString(language.get("222604_seasilk", (var_5_2.map - 1) * 5 + var_5_2.island, 15))

		if var_5_2.map == 1 then
			arg_5_0.view.widgets.rateNum:setDisplayFrame(CCSprite:create("res/ui/activity/seaSilk/hssl_map_word_jl2x.png"):displayFrame())
		elseif var_5_2.map == 2 then
			arg_5_0.view.widgets.rateNum:setDisplayFrame(CCSprite:create("res/ui/activity/seaSilk/hssl_map_word_jl3x.png"):displayFrame())
		else
			arg_5_0.view.widgets.rateNum:setDisplayFrame(CCSprite:create("res/ui/activity/seaSilk/hssl_map_word_jl5x.png"):displayFrame())
		end

		if arg_5_0.boatState == 4 then
			arg_5_0.view.widgets.currentBoat:stopAllActions()

			local var_5_4 = CCArray:create()

			var_5_4:addObject(CCMoveTo:create(1.5, var_0_2[var_5_2.map][var_5_2.island + 1]))
			var_5_4:addObject(CCCallFuncN:create(function()
				arg_5_0.boatState = 3

				arg_5_0:refresh()
			end))

			local var_5_5 = CCSequence:create(var_5_4)

			arg_5_0.view.widgets.currentBoat:runAction(var_5_5)
		else
			arg_5_0.view.widgets.currentBoat:setPosition(var_0_2[var_5_2.map][var_5_2.island + 1])
		end

		if var_5_3.totalSailorNum > var_5_3.employeeNum then
			arg_5_0.view.widgets.realBoatDi:setVisible(true)
			arg_5_0.view.widgets.realBoatState:setDisplayFrame(CCSprite:create("res/ui/activity/seaSilk/hssl_map_word_cybz.png"):displayFrame())
		elseif arg_5_0.boatState == 4 then
			arg_5_0.view.widgets.realBoatDi:setVisible(true)
			arg_5_0.view.widgets.realBoatState:setDisplayFrame(CCSprite:create("res/ui/activity/seaSilk/hssl_map_word_cdcf.png"):displayFrame())
		else
			arg_5_0.view.widgets.realBoatDi:setVisible(false)
		end

		if arg_5_0.boatState == 3 then
			arg_5_0.view.widgets.btn_boat:setVisible(true)
		else
			arg_5_0.view.widgets.btn_boat:setVisible(false)
		end
	end

	if arg_5_0.info.state == 2 then
		arg_5_0.view.widgets.currentBoat:setVisible(false)
		arg_5_0.view.widgets.rateNum:setVisible(false)
		arg_5_0.view.widgets.activityEnd:setVisible(true)
		arg_5_0.view.widgets.label_progress:setVisible(false)
		arg_5_0.view.widgets.choosePeople:setVisible(false)
		arg_5_0.view.widgets.btn_pinqing:setVisible(false)
		arg_5_0.view.widgets.btn_pinqingGold:setVisible(false)
	end
end

function var_0_1.refresh(arg_7_0)
	local function var_7_0(arg_8_0)
		showTable(arg_8_0)

		local var_8_0 = arg_8_0.data or arg_8_0.action.data

		arg_7_0:showPanel(var_8_0)
	end

	cmgr.sendRequest(var_7_0, actions.seaSilkActivity)
end

function var_0_1.ctor(arg_9_0, arg_9_1, arg_9_2)
	log.info("@@ 海上丝路")

	arg_9_0.view = {}
	arg_9_0._rewards = {}
	arg_9_0.info = arg_9_2

	if arg_9_0.info.state == 1 then
		arg_9_0.boatState = 3
	else
		arg_9_0.boatState = 1
	end

	if arg_9_0.info.state == 1 and arg_9_0.info.posInfo and arg_9_0.info.posInfo.map == 1 and arg_9_0.info.posInfo.island == 1 then
		arg_9_0.boatState = 4
	end

	uiutil.initWidgets(arg_9_0.view, arg_9_0.layout)

	arg_9_0.leftTime = arg_9_0.view.widgets.leftTime

	if arg_9_1 then
		arg_9_0:addChild(arg_9_0.view.widgets.Scene)
		arg_9_1:addChild(arg_9_0)
	end

	local function var_9_0()
		local function var_10_0(arg_11_0)
			local var_11_0 = arg_11_0.data or arg_11_0.action.data
			local var_11_1 = CCSprite:create("res/ui/activity/seaSilk/hssl_map_word_pqcg.png")

			if var_11_0.goAhead then
				arg_9_0.boatState = 4
			elseif var_11_0.success then
				-- block empty
			else
				var_11_1 = CCSprite:create("res/ui/activity/seaSilk/hssl_map_word_pqsb.png")
			end

			local var_11_2 = ccp(tool.getPositionInScreen(arg_9_0.view.widgets["peoplePic" .. arg_9_0.info.employInfo.employeeNum + 1]))

			var_11_1:setPosition(var_11_2)
			smgr.getLayer("pushLayer"):addChild(var_11_1)

			local var_11_3 = CCArray:create()

			var_11_3:addObject(CCDelayTime:create(0.4))
			var_11_3:addObject(CCMoveBy:create(0.3, ccp(0, 50)))
			var_11_3:addObject(CCFadeOut:create(0.2))
			var_11_3:addObject(CCCallFunc:create(function()
				var_11_1:removeFromParentAndCleanup(true)

				var_11_1 = nil
			end))
			var_11_1:runAction(CCSequence:create(var_11_3))
			arg_9_0:refresh()
		end

		cmgr.sendRequest(var_10_0, actions.seaSilkEmploy, arg_9_0.zhaopingMode or 0)
	end

	arg_9_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_9_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_9_0.view.widgets.btn_boat:addHandleOfControlEvent(function()
		log.info("btn_boat")
		arg_9_0:showWindow()
	end, CCControlEventTouchUpInside)
	arg_9_0.view.widgets.btn_pinqing:addHandleOfControlEvent(function()
		log.info("btn_pinqing")

		arg_9_0.zhaopingMode = 0

		if arg_9_0.info.employInfo.freeTimes > 0 then
			var_9_0()
		else
			messageBox.showChargeWin(language.get(190080), language.get("222622_seasilk", arg_9_0.info.employInfo.freeGold), "seaSilkroadBuyFreeEmployee", var_9_0)
		end
	end, CCControlEventTouchUpInside)
	arg_9_0.view.widgets.btn_pinqingGold:addHandleOfControlEvent(function()
		log.info("btn_pinqingGold")

		arg_9_0.zhaopingMode = 1

		messageBox.showChargeWin(language.get(190080), language.get("222620_seasilk", arg_9_0.info.employInfo.gold), "seaSilkroadBuyEmployee", var_9_0)
	end, CCControlEventTouchUpInside)
	arg_9_0.view.widgets.btn_addGezi:addHandleOfControlEvent(function()
		log.info("btn_addGezi")

		local function var_17_0()
			local function var_18_0(arg_19_0)
				if not arg_19_0.data then
					local var_19_0 = arg_19_0.action.data
				end

				arg_9_0:showWindow()
			end

			cmgr.sendRequest(var_18_0, actions.buyWindows)
		end

		if arg_9_0.windowsInfo.freeBuyTimes > 0 then
			var_17_0()
		else
			messageBox.showChargeWin(language.get(190080), language.get("222621_seasilk", arg_9_0.windowsInfo.gold), "seaSilkroadBuyWindows", var_17_0)
		end
	end, CCControlEventTouchUpInside)
	arg_9_0.view.widgets.btn_tansuo:addHandleOfControlEvent(function()
		log.info("btn_tansuo")

		local function var_20_0(arg_21_0)
			arg_9_0:silkEndPosEventResponse(arg_21_0)
		end

		cmgr.sendRequest(var_20_0, actions.seaSilkRoadGetReward)
	end, CCControlEventTouchUpInside)
	arg_9_0:showPanel(arg_9_2)
end

function var_0_1.showTip(arg_22_0)
	log.info("should show tips ")

	local var_22_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_22_0:registerScriptTouchHandler(function(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 == CCTOUCHBEGAN then
			return true
		elseif arg_23_0 == CCTOUCHMOVED then
			return true
		elseif arg_23_0 == CCTOUCHENDED then
			pcall(var_22_0.removeFromParentAndCleanup, var_22_0, true)

			return true
		end
	end, false, true)
	var_22_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_22_0, 60000)

	local var_22_1 = 0
	local var_22_2 = 0
	local var_22_3 = {}

	uiutil.initWidgets(var_22_3, var_0_5)
	var_22_0:addChild(var_22_3.widgets.tipFrame)

	local var_22_4, var_22_5 = tool.getPositionInScreen(arg_22_0.view.widgets.btn_tip)
	local var_22_6 = var_22_4 + 20
	local var_22_7 = var_22_5 - 20
	local var_22_8 = var_22_3.widgets.tipMsg:getContentSize().width
	local var_22_9 = var_22_3.widgets.tipMsg:getContentSize().height

	var_22_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_22_8 + 30, var_22_9 + 30))
	var_22_3.widgets.tipFrame:setPosition(ccp(var_22_6, var_22_7))
	var_22_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_22_3.widgets.tipFrame:setVisible(true)
end

function var_0_1.silkEndPosEventResponse(arg_24_0, arg_24_1)
	showTable(arg_24_1)

	arg_24_0._rewards = {}

	for iter_24_0 = 1, #arg_24_1.action.data.rewards do
		table.insert(arg_24_0._rewards, arg_24_1.action.data.rewards[iter_24_0])
	end

	local var_24_0 = {}

	for iter_24_1, iter_24_2 in pairs(var_0_3) do
		table.insert(var_24_0, iter_24_2)
	end

	for iter_24_3, iter_24_4 in pairs(var_0_4) do
		table.insert(var_24_0, iter_24_4)
	end

	for iter_24_5, iter_24_6 in ipairs(arg_24_0._rewards) do
		local var_24_1 = {}

		for iter_24_7, iter_24_8 in pairs(var_24_0) do
			table.insert(var_24_1, CCSprite:create(iter_24_8.pic))
		end

		local var_24_2 = require("lua/layer/resource/silkRoad/circleListNode").new(72, 72)

		var_24_2:setItems(var_24_1)

		local var_24_3 = 1

		for iter_24_9, iter_24_10 in pairs(var_24_0) do
			if iter_24_6.type == iter_24_10.type then
				var_24_3 = iter_24_9
			end
		end

		var_24_2:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(0.3 * iter_24_5), CCCallFunc:create(function(...)
			var_24_2:runCircleAction(var_24_3, 3, function(...)
				local var_26_0 = {
					{}
				}

				if iter_24_6.type == 21 then
					var_26_0[1].id = 7
				elseif iter_24_6.type == 5 then
					var_26_0[1].id = 6
				elseif iter_24_6.type == 81 then
					var_26_0[1].id = 24
				elseif iter_24_6.type >= 10000001 and iter_24_6.type <= 10000030 then
					var_26_0[1].id = 1000000
				elseif iter_24_6.type >= 10000036 and iter_24_6.type <= 10000041 then
					var_26_0[1].id = 1000000
				elseif iter_24_6.type == 116 then
					var_26_0[1].id = 55
				elseif iter_24_6.type == 126 then
					var_26_0[1].id = 10030
				else
					var_26_0[1].id = iter_24_6.type
				end

				var_26_0[1].value = iter_24_6.num

				if arg_24_0.info.posInfo and arg_24_0.info.posInfo.special and arg_24_0.info.posInfo.map then
					if arg_24_0.info.posInfo.map == 1 then
						var_26_0[2] = var_26_0[1]
					elseif arg_24_0.info.posInfo.map == 2 then
						var_26_0[2] = var_26_0[1]
						var_26_0[3] = var_26_0[1]
					else
						var_26_0[2] = var_26_0[1]
						var_26_0[3] = var_26_0[1]
						var_26_0[4] = var_26_0[1]
						var_26_0[5] = var_26_0[1]
					end
				end

				globalAction_gotResource(var_26_0)

				if iter_24_6.num == 2 or iter_24_6.num == 4 or iter_24_6.num == 10 then
					local var_26_1 = CCSprite:create("res/ui/activity/ironReward/js_bj_" .. iter_24_6.num .. ".png")
					local var_26_2 = ccp(tool.getPositionInScreen(arg_24_0.view.widgets["node" .. iter_24_5]))

					var_26_1:setPosition(var_26_2)
					smgr.getLayer("pushLayer"):addChild(var_26_1)

					local var_26_3 = CCArray:create()

					var_26_3:addObject(CCDelayTime:create(0.8))
					var_26_3:addObject(CCFadeOut:create(0.2))
					var_26_3:addObject(CCCallFunc:create(function()
						var_26_1:removeFromParentAndCleanup(true)

						var_26_1 = nil
					end))
					var_26_1:runAction(CCSequence:create(var_26_3))
				end
			end)
		end)))
		var_24_2:setPosition(ccp(4, 4))
		arg_24_0.view.widgets.loadingbar2:runAction(CCProgressTo:create(3 + 0.3 * #arg_24_0._rewards, 100))

		if iter_24_5 == #arg_24_0._rewards then
			arg_24_0:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(4.5 + 0.3 * #arg_24_0._rewards), CCCallFunc:create(function(...)
				arg_24_0.boatState = 1

				arg_24_0:refresh()
			end)))
		end

		if arg_24_0.view.widgets["node" .. iter_24_5] then
			arg_24_0.view.widgets["node" .. iter_24_5]:addChild(var_24_2, 100, 12345)
		end
	end
end

return var_0_1
