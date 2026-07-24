local var_0_0 = require("res/native/offset").get("layer.activity.jingLian.jingLianTab")
local var_0_1 = {
	y = 0,
	name = "root",
	type = "layer",
	x = 0,
	children = {
		{
			name = "panel",
			type = "node",
			x = visibleSize.width / 2,
			y = visibleSize.height / 2 - 28,
			children = {
				{
					y = 0,
					name = "bg1",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/comment/bg1.jpg"
					},
					children = {
						{
							y = 382.3196,
							name = "jldfs_long_bg",
							type = "sprite",
							x = 457.5,
							pic = {
								path = "res/ui/activity/jldfs/jldfs_long_bg.png"
							},
							children = {
								{
									fontSize = 20,
									name = "Text_5",
									y = 51.2507,
									type = "label",
									width = 100,
									height = 0,
									textId = 135855,
									style = "label_yellowish_22",
									x = 104.5003,
									halign = kCCTextAlignmentLeft,
									valign = kCCVerticalTextAlignmentBottom,
									anchorPoint = ccp(1, 0.5)
								},
								{
									y = 49.8909,
									name = "Image_2",
									type = "sprite9",
									x = 432.6682,
									preferedSize = CCSizeMake(645, 33),
									middleRect = CCRectMake(50, 16, 563, 1),
									pic = {
										path = "res/ui/activity/famous/gjms_deg_view.png"
									},
									children = {
										{
											y = 17.6331,
											name = "progress",
											type = "progressbar",
											scaleX = 0.97,
											x = 23.3096,
											anchorPoint = ccp(0, 0.5),
											pic = {
												path = "res/ui/activity/famous/gjms_deg_con.png"
											}
										},
										{
											y = 16.5,
											name = "Sprite_16",
											type = "sprite",
											x = 171.4816,
											pic = {
												path = "res/ui/activity/famous/gjms_deg_div.png"
											}
										},
										{
											y = 16.5,
											name = "Sprite_16_Copy",
											type = "sprite",
											x = 322.5,
											pic = {
												path = "res/ui/activity/famous/gjms_deg_div.png"
											}
										},
										{
											y = 16.5,
											name = "Sprite_16_Copy_0",
											type = "sprite",
											x = 470.85,
											pic = {
												path = "res/ui/activity/famous/gjms_deg_div.png"
											}
										},
										{
											fontSize = 20,
											name = "num1",
											y = -13.8578,
											type = "label",
											text = "20次",
											style = "label_yellowish_22",
											x = 168.4281,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										},
										{
											fontSize = 20,
											name = "num2",
											y = -13.8578,
											type = "label",
											text = "80次",
											style = "label_yellowish_22",
											x = 320.8565,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										},
										{
											fontSize = 20,
											name = "num3",
											y = -13.858,
											type = "label",
											text = "150次",
											style = "label_yellowish_22",
											x = 472.9996,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										},
										{
											fontSize = 20,
											name = "num4",
											y = -13.8579,
											type = "label",
											text = "300次",
											style = "label_yellowish_22",
											x = 626.7153,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										},
										{
											y = 56.8899,
											name = "Sprite_20",
											type = "sprite",
											x = 175.6666,
											pic = {
												path = "res/ui/activity/jldfs/jldfs_icon_jll.png"
											}
										},
										{
											y = 56.8899,
											name = "Sprite_20_Copy",
											type = "sprite",
											x = 325.4448,
											pic = {
												path = "res/ui/activity/jldfs/jldfs_icon_jlml.png"
											}
										},
										{
											y = 53.89,
											name = "Sprite_20_Copy_0",
											type = "sprite",
											x = 477.1132,
											pic = {
												path = "res/ui/activity/jldfs/jldfs_icon_jlml2.png"
											}
										},
										{
											y = 56.8899,
											name = "Sprite_20_Copy_1",
											type = "sprite",
											x = 626.4457,
											pic = {
												path = "res/ui/activity/jldfs/jldfs_icon_jlsl.png"
											}
										}
									}
								},
								{
									name = "btnGoTo",
									h = 58,
									type = "button",
									w = 140,
									y = 49.5,
									x = 830.7523,
									normal = {
										frame = true,
										path = "btn_default_normal.png"
									},
									touched = {
										frame = true,
										path = "btn_default_lighted.png"
									},
									children = {
										{
											fontSize = 20,
											name = "Text_10",
											y = 29.9097,
											type = "label",
											textId = 135856,
											style = "label_yellowish_22",
											x = 70.1808,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								}
							}
						},
						{
							y = 485.6681,
							name = "Sprite_25",
							type = "sprite",
							x = 437.0011,
							pic = {
								path = "res/ui/activity/jldfs/jldfs_title.png"
							}
						},
						{
							fontSize = 24,
							name = "needTimes",
							y = 473.671,
							type = "label",
							width = 180,
							height = 0,
							text = "还需要精炼0次",
							style = "label_yellowish_22",
							x = 20,
							anchorPoint = ccp(0, 0.5),
							halign = kCCTextAlignmentLeft,
							valign = kCCVerticalTextAlignmentBottom
						},
						{
							fontSize = 24,
							name = "leftTime",
							y = 473.671,
							type = "label",
							text = "",
							color = ccc3(255, 0, 0),
							halign = kCCTextAlignmentLeft,
							valign = kCCVerticalTextAlignmentBottom,
							x = 666.4517 + (var_0_0.timeLeftX or 0)
						},
						{
							y = 165.8092,
							name = "Image_3",
							type = "sprite9",
							x = 458.4088,
							preferedSize = CCSizeMake(876, 310),
							middleRect = CCRectMake(50, 50, 2, 2),
							pic = {
								path = "res/ui/activity/xilian/xs_view_2.png"
							}
						},
						{
							y = 198,
							name = "item1",
							type = "sprite",
							x = 165,
							pic = {
								path = "res/ui/activity/jldfs/jldfs_icon_bg.png"
							},
							children = {
								{
									y = 137.8764,
									name = "ticket_icon_view_bg",
									type = "sprite",
									x = 123.7516,
									pic = {
										path = "res/ui/resource/tickets/ticket_icon_view_bg.png"
									},
									children = {
										{
											y = 42,
											name = "Sprite_37",
											type = "sprite",
											x = 42,
											pic = {
												path = "res/ui/activity/jldfs/huangz.jpg"
											}
										}
									}
								},
								{
									fontSize = 20,
									name = "itemName1",
									y = 24.2499,
									type = "label",
									textId = 135859,
									style = "label_yellowish_22",
									x = 125,
									halign = kCCTextAlignmentLeft,
									valign = kCCVerticalTextAlignmentBottom
								},
								{
									y = 136.2507,
									name = "usedImage1",
									type = "sprite",
									x = 125,
									pic = {
										path = "res/ui/activity/jldfs/jldfs_seal_ysy.png"
									}
								},
								{
									name = "btnUse1",
									h = 54,
									type = "button",
									w = 125,
									y = -26.6669,
									x = 124.1691,
									normal = {
										frame = true,
										path = "btn2_gre_a.png"
									},
									touched = {
										frame = true,
										path = "btn2_gre_c.png"
									},
									disable = {
										frame = true,
										path = "btn2_gre_g.png"
									},
									children = {
										{
											fontSize = 20,
											name = "Text_25",
											y = 27,
											type = "label",
											textId = 135850,
											style = "label_yellowish_22",
											x = 62,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								},
								{
									w = 42,
									name = "tips1",
									h = 42,
									type = "button",
									y = 208,
									x = 221,
									normal = {
										frame = true,
										path = "btnTip_a.png"
									},
									touched = {
										frame = true,
										path = "btnTip_c.png"
									}
								}
							}
						},
						{
							y = 198,
							name = "item2",
							type = "sprite",
							x = 460,
							pic = {
								path = "res/ui/activity/jldfs/jldfs_icon_bg.png"
							},
							children = {
								{
									y = 137.8764,
									name = "ticket_icon_view_bg_Copy",
									type = "sprite",
									x = 123.7516,
									pic = {
										path = "res/ui/resource/tickets/ticket_icon_view_bg.png"
									},
									children = {
										{
											y = 42,
											name = "Sprite_37_Copy",
											type = "sprite",
											x = 42,
											pic = {
												path = "res/ui/activity/jldfs/hongz.png"
											}
										}
									}
								},
								{
									fontSize = 20,
									name = "itemName2",
									y = 24.2499,
									type = "label",
									textId = 135860,
									style = "label_yellowish_22",
									x = 125,
									halign = kCCTextAlignmentLeft,
									valign = kCCVerticalTextAlignmentBottom
								},
								{
									y = 136.2507,
									name = "usedImage2",
									type = "sprite",
									x = 125,
									pic = {
										path = "res/ui/activity/jldfs/jldfs_seal_ysy.png"
									}
								},
								{
									name = "btnUse2",
									h = 54,
									type = "button",
									w = 125,
									y = -26.6669,
									x = 124.1691,
									normal = {
										frame = true,
										path = "btn2_gre_a.png"
									},
									touched = {
										frame = true,
										path = "btn2_gre_c.png"
									},
									disable = {
										frame = true,
										path = "btn2_gre_g.png"
									},
									children = {
										{
											fontSize = 20,
											name = "Text_25_Copy",
											y = 27,
											type = "label",
											textId = 135850,
											style = "label_yellowish_22",
											x = 62,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								},
								{
									w = 42,
									name = "tips2",
									h = 42,
									type = "button",
									y = 208,
									x = 221,
									normal = {
										frame = true,
										path = "btnTip_a.png"
									},
									touched = {
										frame = true,
										path = "btnTip_c.png"
									}
								}
							}
						},
						{
							y = 198,
							name = "item3",
							type = "sprite",
							x = 756,
							pic = {
								path = "res/ui/activity/jldfs/jldfs_icon_bg.png"
							},
							children = {
								{
									y = 137.8764,
									name = "ticket_icon_view_bg_Copy",
									type = "sprite",
									x = 123.7516,
									pic = {
										path = "res/ui/resource/tickets/ticket_icon_view_bg.png"
									},
									children = {
										{
											y = 42,
											name = "Sprite_37_Copy",
											type = "sprite",
											x = 42,
											pic = {
												path = "res/ui/activity/jldfs/ziz.png"
											}
										}
									}
								},
								{
									fontSize = 20,
									name = "itemName3",
									y = 24.2499,
									type = "label",
									textId = 135861,
									style = "label_yellowish_22",
									x = 125,
									halign = kCCTextAlignmentLeft,
									valign = kCCVerticalTextAlignmentBottom
								},
								{
									y = 136.2507,
									name = "usedImage3",
									type = "sprite",
									x = 125,
									pic = {
										path = "res/ui/activity/jldfs/jldfs_seal_ysy.png"
									}
								},
								{
									name = "btnUse3",
									h = 54,
									type = "button",
									w = 125,
									y = -26.6669,
									x = 124.1691,
									normal = {
										frame = true,
										path = "btn2_gre_a.png"
									},
									touched = {
										frame = true,
										path = "btn2_gre_c.png"
									},
									disable = {
										frame = true,
										path = "btn2_gre_g.png"
									},
									children = {
										{
											fontSize = 20,
											name = "Text_25_Copy_0",
											y = 27,
											type = "label",
											textId = 135850,
											style = "label_yellowish_22",
											x = 62,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								},
								{
									w = 42,
									name = "tips3",
									h = 42,
									type = "button",
									y = 208,
									x = 221,
									normal = {
										frame = true,
										path = "btnTip_a.png"
									},
									touched = {
										frame = true,
										path = "btnTip_c.png"
									}
								}
							}
						},
						{
							y = 198,
							name = "update",
							type = "node",
							x = 460,
							children = {
								{
									y = 19,
									name = "ticket_icon_view_bg",
									type = "sprite",
									x = -1.0001,
									pic = {
										path = "res/ui/resource/tickets/ticket_icon_view_bg.png"
									},
									children = {
										{
											y = 42,
											name = "gemNode",
											x = 42,
											type = "node"
										}
									}
								},
								{
									y = 0,
									name = "layer2",
									type = "node",
									x = -0.0001,
									children = {
										{
											name = "skill1_Copy",
											type = "sprite",
											x = -104,
											y = -39 + (var_0_0.skillNodeY or 0),
											pic = {
												path = "res/ui/activity/jldfs/jldfs_icon_samll_bg.png"
											},
											children = {
												{
													y = 36,
													name = "bg1_Copy",
													type = "sprite",
													x = 33,
													pic = {
														path = "res/ui/weapon/diamond/bs_bg.png"
													}
												},
												{
													y = 33,
													name = "skillImage1_Copy",
													type = "sprite",
													x = 33,
													pic = {
														path = "res/ui/weapon/diamond/warlock_tit_js_zs_red.png"
													},
													children = {
														{
															fontSize = 20,
															name = "lv1",
															y = 10,
															type = "label",
															text = "lv 5",
															style = "label_yellowish_22",
															x = 30,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom
														}
													}
												},
												{
													name = "btn1",
													h = 59,
													type = "button",
													w = 74,
													y = -31,
													x = 33,
													normal = {
														path = "res/ui/weapon/diamond/bs_btn.png"
													},
													touched = {
														path = "res/ui/weapon/diamond/bs_btn.png"
													},
													disable = {
														path = "res/ui/weapon/diamond/bs_btn_g.png"
													},
													children = {
														{
															fontSize = 20,
															name = "Text_28_Copy",
															y = 40,
															type = "label",
															textId = 135851,
															style = "label_yellowish_22",
															x = 37,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom
														}
													}
												}
											}
										},
										{
											name = "skill2_Copy",
											type = "sprite",
											x = 101,
											y = -41 + (var_0_0.skillNodeY or 0),
											pic = {
												path = "res/ui/activity/jldfs/jldfs_icon_samll_bg.png"
											},
											children = {
												{
													y = 36,
													name = "bg2_Copy",
													type = "sprite",
													x = 33,
													pic = {
														path = "res/ui/weapon/diamond/bs_bg.png"
													}
												},
												{
													y = 33,
													name = "skillImage2_Copy",
													type = "sprite",
													x = 33,
													pic = {
														path = "res/ui/weapon/diamond/warlock_tit_js_zs_red.png"
													},
													children = {
														{
															fontSize = 20,
															name = "lv2",
															y = 10,
															type = "label",
															text = "lv 5",
															style = "label_yellowish_22",
															x = 30,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom
														}
													}
												},
												{
													name = "btn2",
													h = 59,
													type = "button",
													w = 74,
													y = -31,
													x = 33,
													normal = {
														path = "res/ui/weapon/diamond/bs_btn.png"
													},
													touched = {
														path = "res/ui/weapon/diamond/bs_btn.png"
													},
													disable = {
														path = "res/ui/weapon/diamond/bs_btn_g.png"
													},
													children = {
														{
															fontSize = 20,
															name = "Text_28_Copy_0",
															y = 40,
															type = "label",
															textId = 135851,
															style = "label_yellowish_22",
															x = 37,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom
														}
													}
												}
											}
										},
										{
											name = "skill3_Copy",
											type = "sprite",
											x = -104,
											y = 84 + (var_0_0.skillNodeY or 0),
											pic = {
												path = "res/ui/activity/jldfs/jldfs_icon_samll_bg.png"
											},
											children = {
												{
													y = 36,
													name = "bg3_Copy",
													type = "sprite",
													x = 33,
													pic = {
														path = "res/ui/weapon/diamond/bs_bg.png"
													}
												},
												{
													y = 33,
													name = "skillImage3_Copy",
													type = "sprite",
													x = 33,
													pic = {
														path = "res/ui/weapon/diamond/warlock_tit_js_zs_red.png"
													},
													children = {
														{
															fontSize = 20,
															name = "lv3",
															y = 10,
															type = "label",
															text = "lv 5",
															style = "label_yellowish_22",
															x = 30,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom
														}
													}
												},
												{
													name = "btn3",
													h = 59,
													type = "button",
													w = 74,
													y = -31,
													x = 33,
													normal = {
														path = "res/ui/weapon/diamond/bs_btn.png"
													},
													touched = {
														path = "res/ui/weapon/diamond/bs_btn.png"
													},
													disable = {
														path = "res/ui/weapon/diamond/bs_btn_g.png"
													},
													children = {
														{
															fontSize = 20,
															name = "Text_28",
															y = 40,
															type = "label",
															textId = 135851,
															style = "label_yellowish_22",
															x = 37,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom
														}
													}
												}
											}
										},
										{
											name = "skill4_Copy",
											type = "sprite",
											x = 101,
											y = 84 + (var_0_0.skillNodeY or 0),
											pic = {
												path = "res/ui/activity/jldfs/jldfs_icon_samll_bg.png"
											},
											children = {
												{
													y = 36,
													name = "bg4_Copy",
													type = "sprite",
													x = 33,
													pic = {
														path = "res/ui/weapon/diamond/bs_bg.png"
													}
												},
												{
													y = 33,
													name = "skillImage4_Copy",
													type = "sprite",
													x = 33,
													pic = {
														path = "res/ui/weapon/diamond/warlock_tit_js_zs_red.png"
													},
													children = {
														{
															fontSize = 20,
															name = "lv4",
															y = 10,
															type = "label",
															text = "lv 5",
															style = "label_yellowish_22",
															x = 30,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom
														}
													}
												},
												{
													name = "btn4",
													h = 59,
													type = "button",
													w = 74,
													y = -31,
													x = 33,
													normal = {
														path = "res/ui/weapon/diamond/bs_btn.png"
													},
													touched = {
														path = "res/ui/weapon/diamond/bs_btn.png"
													},
													disable = {
														path = "res/ui/weapon/diamond/bs_btn_g.png"
													},
													children = {
														{
															fontSize = 20,
															name = "Text_28_Copy_1",
															y = 40,
															type = "label",
															textId = 135851,
															style = "label_yellowish_22",
															x = 37,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom
														}
													}
												}
											}
										},
										{
											name = "btnCancel2",
											h = 54,
											type = "button",
											w = 125,
											y = -146,
											x = 0,
											normal = {
												frame = true,
												path = "btn2_yel_a.png"
											},
											touched = {
												frame = true,
												path = "btn2_yel_c.png"
											},
											disable = {
												frame = true,
												path = "btn2_yel_g.png"
											},
											children = {
												{
													fontSize = 20,
													name = "Text_18_Copy",
													y = 29,
													type = "label",
													textId = 135852,
													style = "label_yellowish_22",
													x = 63,
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
				},
				{
					y = 0,
					name = "listNode",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/weapon/cangku.png"
					},
					children = {
						{
							y = 9.9999,
							name = "list",
							type = "TableView",
							x = 10.7614,
							viewSize = CCSizeMake(514, 147),
							dirction = kCCScrollViewDirectionHorizontal
						}
					}
				}
			}
		}
	}
}
local var_0_2 = class("JinglianLayer", BaseLayOutLayer)

function var_0_2.ctor(arg_1_0, arg_1_1)
	amgr.playEffect(enumAudioFile.ui_dialog_open)

	arg_1_0.__listData = {}

	var_0_2.super.ctor(arg_1_0, var_0_1, handler(arg_1_0, arg_1_0.initLayout))
	arg_1_0:init(arg_1_1)
end

function var_0_2.initLayout(arg_2_0)
	arg_2_0.widgets.btnCancel2:addHandleOfControlEvent(handler(arg_2_0, arg_2_0.onCanelClicked), CCControlEventTouchUpInside)
	arg_2_0.widgets.btnGoTo:addHandleOfControlEvent(handler(arg_2_0, arg_2_0.onGoToClicked), CCControlEventTouchUpInside)
	arg_2_0.widgets.btnUse1:addHandleOfControlEvent(handler(arg_2_0, arg_2_0.onUseClicked), CCControlEventTouchUpInside)
	arg_2_0.widgets.btnUse2:addHandleOfControlEvent(handler(arg_2_0, arg_2_0.onUseClicked), CCControlEventTouchUpInside)
	arg_2_0.widgets.btnUse3:addHandleOfControlEvent(handler(arg_2_0, arg_2_0.onUseClicked), CCControlEventTouchUpInside)
	arg_2_0.widgets.btn1:addHandleOfControlEvent(handler(arg_2_0, arg_2_0.onUpdateClicked), CCControlEventTouchUpInside)
	arg_2_0.widgets.btn2:addHandleOfControlEvent(handler(arg_2_0, arg_2_0.onUpdateClicked), CCControlEventTouchUpInside)
	arg_2_0.widgets.btn3:addHandleOfControlEvent(handler(arg_2_0, arg_2_0.onUpdateClicked), CCControlEventTouchUpInside)
	arg_2_0.widgets.btn4:addHandleOfControlEvent(handler(arg_2_0, arg_2_0.onUpdateClicked), CCControlEventTouchUpInside)
	arg_2_0.widgets.tips1:addHandleOfControlEvent(handler(arg_2_0, arg_2_0.showTips), CCControlEventTouchUpInside)
	arg_2_0.widgets.tips2:addHandleOfControlEvent(handler(arg_2_0, arg_2_0.showTips), CCControlEventTouchUpInside)
	arg_2_0.widgets.tips3:addHandleOfControlEvent(handler(arg_2_0, arg_2_0.showTips), CCControlEventTouchUpInside)
	arg_2_0.widgets.list:registerScriptHandler(handler(arg_2_0, arg_2_0.tableCellTouched), CCTableView.kTableCellTouched)
	arg_2_0.widgets.list:registerScriptHandler(handler(arg_2_0, arg_2_0.cellSizeForTable), CCTableView.kTableCellSizeForIndex)
	arg_2_0.widgets.list:registerScriptHandler(handler(arg_2_0, arg_2_0.tableCellAtIndex), CCTableView.kTableCellSizeAtIndex)
	arg_2_0.widgets.list:registerScriptHandler(handler(arg_2_0, arg_2_0.numberOfCellsInTableView), CCTableView.kNumberOfCellsInTableView)
	arg_2_0.widgets.list:reloadData()
	arg_2_0.widgets.listNode:setVisible(false)
	arg_2_0.widgets.update:setVisible(false)

	local function var_2_0(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == CCTOUCHBEGAN then
			if arg_2_0.widgets.listNode:isVisible() then
				return true
			else
				return false
			end
		elseif arg_3_0 == CCTOUCHMOVED then
			return true
		elseif arg_3_0 == CCTOUCHENDED then
			if not tool.checkIfTouch2(arg_2_0.widgets.listNode, arg_3_1, arg_3_2) then
				arg_2_0.widgets.listNode:setVisible(false)
			end

			return true
		end
	end

	arg_2_0.widgets.listNode:setTouchEnabled(true)
	arg_2_0.widgets.listNode:registerScriptTouchHandler(var_2_0, false, true)
end

function var_0_2.hideTips(arg_4_0)
	log.info("hideTips--")

	if arg_4_0.__tips and not tolua.isnull(arg_4_0.__tips) then
		arg_4_0.__tips:removeFromParentAndCleanup(true)

		arg_4_0.__tips = nil
	end
end

function var_0_2.showTips(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_0.__tips and not tolua.isnull(arg_5_0.__tips) then
		arg_5_0.__tips:removeFromParentAndCleanup(true)

		arg_5_0.__tips = nil
	end

	local var_5_0 = ""

	if arg_5_2 == arg_5_0.widgets.tips1 then
		var_5_0 = arg_5_0.__data.jinLianTimes[1].tips
	elseif arg_5_2 == arg_5_0.widgets.tips2 then
		var_5_0 = arg_5_0.__data.jinLianTimes[2].tips
	elseif arg_5_2 == arg_5_0.widgets.tips3 then
		var_5_0 = arg_5_0.__data.jinLianTimes[4].tips
	end

	local var_5_1 = CCStrokeLabelTTF:create(var_5_0, "Thonburi", 22)

	var_5_1:setDimensions(CCSizeMake(220, 0))

	local var_5_2 = var_5_1:getContentSize()
	local var_5_3 = CCScale9Sprite:createWithSpriteFrameName("autoSizePanel.png")

	var_5_3:setPreferredSize(CCSizeMake(var_5_2.width + 10, var_5_2.height + 10))
	var_5_3:setAnchorPoint(ccp(1, 0))
	var_5_1:setPosition(ccp(var_5_3:getContentSize().width / 2, var_5_3:getContentSize().height / 2))
	var_5_3:addChild(var_5_1)
	var_5_1:setHorizontalAlignment(kCCTextAlignmentLeft)

	local function var_5_4(arg_6_0, arg_6_1, arg_6_2)
		arg_5_0:hideTips()

		return false
	end

	var_5_3:setTouchEnabled(true)
	var_5_3:registerScriptTouchHandler(var_5_4, false, false)
	var_5_3:setPosition(arg_5_0:convertToNodeSpace(arg_5_2:convertToWorldSpace(ccp(0, 0))))
	arg_5_0:addChild(var_5_3)

	arg_5_0.__tips = var_5_3
end

function var_0_2.onUpdateClicked(arg_7_0, arg_7_1, arg_7_2)
	for iter_7_0 = 1, 4 do
		if arg_7_2 == arg_7_0.widgets["btn" .. iter_7_0] then
			local var_7_0 = 1
			local var_7_1 = arg_7_0.__useType == 1 and 1 or arg_7_0.__useType == 2 and (arg_7_0.__data.jinLianTimes[2].received == 0 and 2 or 3) or 4

			cmgr.sendRequest(handler(arg_7_0, arg_7_0.getJinLianRewardHandler), actions.getJinLianReward, var_7_1, arg_7_0.__gemInfo.vId, iter_7_0)

			break
		end
	end
end

function var_0_2.getJinLianRewardHandler(arg_8_0, arg_8_1)
	if arg_8_1.action.state == 1 then
		arg_8_0:showUpdateLayer(arg_8_1.action.data.gem[1])

		local var_8_0 = CCSprite:create("res/ui/activity/xilian/acti_text_jnsj.png")

		var_8_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height * 0.4))

		local var_8_1 = CCMoveTo:create(0.3, ccp(visibleSize.width / 2, visibleSize.height * 0.6))
		local var_8_2 = CCDelayTime:create(0.3)
		local var_8_3 = CCMoveTo:create(0.5, ccp(visibleSize.width / 2, visibleSize.height))
		local var_8_4 = CCCallFuncN:create(function(arg_9_0)
			arg_9_0:removeFromParentAndCleanup(true)
			cmgr.sendRequest(handler(arg_8_0, arg_8_0.getJinLianActivityInfoHandler), actions.getJinLianActivityInfo)
		end)
		local var_8_5 = CCArray:create()

		var_8_5:addObject(var_8_1)
		var_8_5:addObject(var_8_2)
		var_8_5:addObject(var_8_3)
		var_8_5:addObject(var_8_4)

		local var_8_6 = CCSequence:create(var_8_5)

		var_8_0:runAction(var_8_6)
		arg_8_0:addChild(var_8_0)
	end
end

function var_0_2.getJinLianActivityInfoHandler(arg_10_0, arg_10_1)
	if arg_10_1.action.state == 1 then
		arg_10_0:refreshPanel(arg_10_1.action.data)
	end
end

function var_0_2.tableCellTouched(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_2:getIdx()

	if arg_11_0.widgets.listNode:isVisible() then
		arg_11_0:showUpdateLayer(arg_11_0.__listData[var_11_0 + 1])
		arg_11_0.widgets.listNode:setVisible(false)
	end
end

function var_0_2.cellSizeForTable(arg_12_0, arg_12_1, arg_12_2)
	return 147, 80
end

function var_0_2.createTabelCellContent(arg_13_0, arg_13_1)
	require("lua/layer/weaponTab/diamond/ui")

	return diamond.ui.create_single_dimond(arg_13_1, false)
end

function var_0_2.tableCellAtIndex(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_1:dequeueCell()

	if var_14_0 then
		var_14_0:removeAllChildrenWithCleanup(true)
	else
		var_14_0 = CCTableViewCell:new()
	end

	local var_14_1 = arg_14_0:createTabelCellContent(arg_14_0.__listData[arg_14_2 + 1])

	var_14_1:setPosition(40, 73.5)
	var_14_0:addChild(var_14_1)

	return var_14_0
end

function var_0_2.numberOfCellsInTableView(arg_15_0)
	return #arg_15_0.__listData
end

function var_0_2.setPercent(arg_16_0)
	local var_16_0 = 0
	local var_16_1 = 0

	for iter_16_0 = 1, #arg_16_0.__data.jinLianTimes do
		arg_16_0.widgets["num" .. iter_16_0]:setString(language.get(135858, arg_16_0.__data.jinLianTimes[iter_16_0].times))

		if arg_16_0.__data.jinLianTimes[iter_16_0].times <= arg_16_0.__data.num then
			var_16_1 = var_16_1 + 100 / #arg_16_0.__data.jinLianTimes
		elseif iter_16_0 > 1 and arg_16_0.__data.jinLianTimes[iter_16_0].times > arg_16_0.__data.num and arg_16_0.__data.jinLianTimes[iter_16_0 - 1].times <= arg_16_0.__data.num then
			var_16_1 = var_16_1 + 100 / #arg_16_0.__data.jinLianTimes * (arg_16_0.__data.num - arg_16_0.__data.jinLianTimes[iter_16_0 - 1].times) / (arg_16_0.__data.jinLianTimes[iter_16_0].times - arg_16_0.__data.jinLianTimes[iter_16_0 - 1].times)
			var_16_0 = arg_16_0.__data.jinLianTimes[iter_16_0].times - arg_16_0.__data.num
		elseif iter_16_0 == 1 then
			var_16_1 = var_16_1 + 100 / #arg_16_0.__data.jinLianTimes * arg_16_0.__data.num / arg_16_0.__data.jinLianTimes[iter_16_0].times
			var_16_0 = arg_16_0.__data.jinLianTimes[iter_16_0].times - arg_16_0.__data.num
		end
	end

	if arg_16_0.__data.num >= arg_16_0.__data.jinLianTimes[#arg_16_0.__data.jinLianTimes].times then
		arg_16_0.widgets.needTimes:setVisible(false)
	else
		arg_16_0.widgets.needTimes:setVisible(true)
		arg_16_0.widgets.needTimes:setString(language.get(135857, var_16_0))
	end

	arg_16_0.widgets.progress:setPercentage(var_16_1)
end

function var_0_2.onCanelClicked(arg_17_0, ...)
	arg_17_0.widgets.update:setVisible(false)

	for iter_17_0 = 1, 3 do
		arg_17_0.widgets["btnUse" .. iter_17_0]:setVisible(true)
	end
end

function var_0_2.onGoToClicked(arg_18_0, ...)
	require("lua/layer/weaponTab/ui")
	weaponTab.ui.show(2)
end

function var_0_2.onUseClicked(arg_19_0, arg_19_1, arg_19_2)
	for iter_19_0 = 1, 3 do
		if arg_19_2 == arg_19_0.widgets["btnUse" .. iter_19_0] then
			arg_19_0.__useType = iter_19_0
		end
	end

	arg_19_0:onCanelClicked()
	cmgr.sendRequest(handler(arg_19_0, arg_19_0.getListHandler), actions.getEquipForUseRefineItem, arg_19_0.__useType)
end

function var_0_2.getListHandler(arg_20_0, arg_20_1)
	if arg_20_1.action.state == 1 then
		arg_20_0.__listData = arg_20_1.action.data.gem

		arg_20_0:showListLayer()
	end
end

function var_0_2.showListLayer(arg_21_0)
	arg_21_0.widgets.listNode:setVisible(true)
	arg_21_0.widgets.list:reloadData()
end

function var_0_2.showUpdateLayer(arg_22_0, arg_22_1)
	arg_22_0:onCanelClicked()
	arg_22_0.widgets["btnUse" .. arg_22_0.__useType]:setVisible(false)

	arg_22_0.__gemInfo = arg_22_1

	arg_22_0.widgets.update:setVisible(true)
	arg_22_0.widgets.update:setPosition(arg_22_0.widgets["item" .. arg_22_0.__useType]:getPosition())
	arg_22_0:setPercent()
	arg_22_0.widgets.gemNode:removeAllChildrenWithCleanup(true)
	arg_22_0.widgets.gemNode:addChild(arg_22_0:createTabelCellContent(arg_22_1))

	for iter_22_0 = 1, 4 do
		if arg_22_1.skills[iter_22_0] and arg_22_1.skills[iter_22_0].pic then
			arg_22_0.widgets["skillImage" .. iter_22_0 .. "_Copy"]:setDisplayFrame(CCSprite:create("res/ui/weapon/diamond/warlock_tit_" .. arg_22_1.skills[iter_22_0].pic .. "_red.png"):displayFrame())
			arg_22_0.widgets["lv" .. iter_22_0]:setString("Lv." .. arg_22_1.skills[iter_22_0].lv)
			arg_22_0.widgets["skill" .. iter_22_0 .. "_Copy"]:setVisible(true)
			arg_22_0.widgets["btn" .. iter_22_0]:setEnabled(tonumber(arg_22_1.skills[iter_22_0].lv) < 5)
		else
			arg_22_0.widgets["skill" .. iter_22_0 .. "_Copy"]:setVisible(false)
		end
	end
end

function var_0_2.init(arg_23_0, arg_23_1)
	arg_23_0:refreshPanel(arg_23_1)
end

function var_0_2.refreshPanel(arg_24_0, arg_24_1)
	if arg_24_1 then
		arg_24_0.__data = arg_24_1

		arg_24_0.widgets.panel:setVisible(true)
		arg_24_0:onCanelClicked()
		arg_24_0.widgets.listNode:setVisible(false)
		arg_24_0:setPercent()
		arg_24_0.widgets.usedImage1:setVisible(arg_24_0.__data.jinLianTimes[1].received == 1)
		arg_24_0.widgets.usedImage2:setVisible(arg_24_0.__data.jinLianTimes[2].received == 1 and arg_24_0.__data.jinLianTimes[3].received == 1)
		arg_24_0.widgets.usedImage3:setVisible(arg_24_0.__data.jinLianTimes[4].received == 1)
		arg_24_0.widgets.btnUse1:setEnabled(arg_24_0.__data.jinLianTimes[1].received == 0 and arg_24_0.__data.jinLianTimes[1].times <= arg_24_0.__data.num)
		arg_24_0.widgets.btnUse2:setEnabled(arg_24_0.__data.jinLianTimes[2].received == 0 and arg_24_0.__data.jinLianTimes[2].times <= arg_24_0.__data.num or arg_24_0.__data.jinLianTimes[3].received == 0 and arg_24_0.__data.jinLianTimes[3].times <= arg_24_0.__data.num)
		arg_24_0.widgets.btnUse3:setEnabled(arg_24_0.__data.jinLianTimes[4].received == 0 and arg_24_0.__data.jinLianTimes[4].times <= arg_24_0.__data.num)
	else
		arg_24_0.widgets.panel:setVisible(false)
	end
end

function var_0_2.getPanelInfoHandler(arg_25_0, arg_25_1)
	log.info("getPanelInfoHandler")

	if arg_25_1.action.state == 1 then
		if arg_25_1.action.data.infos and #arg_25_1.action.data.infos > 0 then
			arg_25_0.__panelInfo = arg_25_1.action.data.infos[1]

			arg_25_0.widgets.panel:setVisible(true)
			arg_25_0:refreshPanel()
		else
			arg_25_0:close()
		end
	end
end

function var_0_2.onEnter(arg_26_0)
	log.info("onEnter")
end

function var_0_2.onExit(arg_27_0)
	log.info("onExit")
end

return var_0_2
