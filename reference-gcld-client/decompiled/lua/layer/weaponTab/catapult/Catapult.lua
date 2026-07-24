local var_0_0 = {
	attCoeUp = 216123,
	attUp = 216120,
	thresholdUp = 216125,
	enduranceUp = 216126,
	armorNumUp = 216124,
	defUp = 216121,
	hpUp = 216122
}
local var_0_1 = class("Catapult", function()
	return createBaseLayer()
end)

var_0_1.layout = {
	name = "root",
	type = "node",
	x = visibleSize.width / 2,
	y = visibleSize.height / 2 - 30,
	children = {
		{
			y = 0,
			name = "tsc_bg",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/weapon/machine/tsc_bg.jpg"
			}
		},
		{
			y = 0,
			name = "zc_bg",
			type = "sprite",
			x = 50,
			pic = {
				path = "res/ui/weapon/catapult/zc_bg.jpg"
			}
		},
		{
			y = 0,
			name = "chariotListView",
			type = "node",
			x = 0,
			children = {
				{
					name = "upBtn",
					h = 57,
					type = "button",
					w = 104,
					x = -400.9997,
					y = 235.0009,
					scale = -1,
					normal = {
						path = "res/ui/weapon/silkTreasure/zb_btn_sign.png"
					},
					touched = {
						path = "res/ui/weapon/silkTreasure/zb_btn_sign_c.png"
					},
					disable = {
						path = "res/ui/weapon/silkTreasure/zb_btn_sign_g.png"
					}
				},
				{
					name = "downBtn",
					h = 57,
					type = "button",
					w = 104,
					y = -234,
					x = -400,
					normal = {
						path = "res/ui/weapon/silkTreasure/zb_btn_sign.png"
					},
					touched = {
						path = "res/ui/weapon/silkTreasure/zb_btn_sign_c.png"
					},
					disable = {
						path = "res/ui/weapon/silkTreasure/zb_btn_sign_g.png"
					}
				},
				{
					name = "chariotItem1",
					h = 104,
					type = "button",
					w = 104,
					y = 155.9998,
					x = -399.9998,
					normal = {
						path = "res/ui/weapon/silkTreasure/zb_icon.png"
					},
					touched = {
						path = "res/ui/weapon/silkTreasure/zb_icon.png"
					},
					disable = {
						path = "res/ui/weapon/silkTreasure/zb_icon.png"
					},
					children = {
						{
							y = 51.9999,
							name = "zc_icon_lock",
							type = "sprite",
							x = 52,
							pic = {
								path = "res/ui/weapon/catapult/zc_icon_lock.png"
							}
						},
						{
							type = "sprite",
							name = "carIcon1",
							y = 52,
							visible = false,
							x = 52,
							pic = {
								path = "res/ui/weapon/catapult/icon1/car1.jpg"
							}
						},
						{
							type = "sprite",
							name = "selectEffect1",
							y = 52,
							visible = false,
							x = 52,
							pic = {
								path = "res/ui/weapon/silkTreasure/zb_icon_light.png"
							}
						}
					}
				},
				{
					name = "chariotItem2",
					h = 104,
					type = "button",
					w = 104,
					y = 50.9999,
					x = -399.9999,
					normal = {
						path = "res/ui/weapon/silkTreasure/zb_icon.png"
					},
					touched = {
						path = "res/ui/weapon/silkTreasure/zb_icon.png"
					},
					disable = {
						path = "res/ui/weapon/silkTreasure/zb_icon.png"
					},
					children = {
						{
							y = 51.9999,
							name = "zc_icon_lock_Copy",
							type = "sprite",
							x = 52,
							pic = {
								path = "res/ui/weapon/catapult/zc_icon_lock.png"
							}
						},
						{
							type = "sprite",
							name = "carIcon2",
							y = 52,
							visible = false,
							x = 52,
							pic = {
								path = "res/ui/weapon/catapult/icon1/car1.jpg"
							}
						},
						{
							type = "sprite",
							name = "selectEffect2",
							y = 52,
							visible = false,
							x = 52,
							pic = {
								path = "res/ui/weapon/silkTreasure/zb_icon_light.png"
							}
						}
					}
				},
				{
					name = "chariotItem3",
					h = 104,
					type = "button",
					w = 104,
					y = -54.0002,
					x = -399.9998,
					normal = {
						path = "res/ui/weapon/silkTreasure/zb_icon.png"
					},
					touched = {
						path = "res/ui/weapon/silkTreasure/zb_icon.png"
					},
					disable = {
						path = "res/ui/weapon/silkTreasure/zb_icon.png"
					},
					children = {
						{
							y = 51.9999,
							name = "zc_icon_lock_Copy",
							type = "sprite",
							x = 52,
							pic = {
								path = "res/ui/weapon/catapult/zc_icon_lock.png"
							}
						},
						{
							type = "sprite",
							name = "carIcon3",
							y = 52,
							visible = false,
							x = 52,
							pic = {
								path = "res/ui/weapon/catapult/icon1/car1.jpg"
							}
						},
						{
							type = "sprite",
							name = "selectEffect3",
							y = 52,
							visible = false,
							x = 52,
							pic = {
								path = "res/ui/weapon/silkTreasure/zb_icon_light.png"
							}
						}
					}
				},
				{
					name = "chariotItem4",
					h = 104,
					type = "button",
					w = 104,
					y = -159,
					x = -400,
					normal = {
						path = "res/ui/weapon/silkTreasure/zb_icon.png"
					},
					touched = {
						path = "res/ui/weapon/silkTreasure/zb_icon.png"
					},
					disable = {
						path = "res/ui/weapon/silkTreasure/zb_icon.png"
					},
					children = {
						{
							y = 51.9999,
							name = "zc_icon_lock_Copy",
							type = "sprite",
							x = 52,
							pic = {
								path = "res/ui/weapon/catapult/zc_icon_lock.png"
							}
						},
						{
							type = "sprite",
							name = "carIcon4",
							y = 52,
							visible = false,
							x = 52,
							pic = {
								path = "res/ui/weapon/catapult/icon1/car1.jpg"
							}
						},
						{
							type = "sprite",
							name = "selectEffect4",
							y = 52,
							visible = false,
							x = 52,
							pic = {
								path = "res/ui/weapon/silkTreasure/zb_icon_light.png"
							}
						}
					}
				}
			}
		},
		{
			y = 0,
			name = "chariotCarView",
			type = "node",
			x = 0,
			children = {
				{
					y = 72.9998,
					name = "carImage",
					type = "sprite",
					x = 39.9999,
					pic = {
						path = "res/ui/weapon/catapult/car/car1.png"
					}
				},
				{
					name = "carNameBtn",
					h = 174,
					type = "button",
					w = 66,
					y = 165,
					x = -310,
					normal = {
						path = "res/ui/weapon/catapult/zc_title_bg.png"
					},
					touched = {
						path = "res/ui/weapon/catapult/zc_title_bg.png"
					},
					disable = {
						path = "res/ui/weapon/catapult/zc_title_bg.png"
					},
					children = {
						{
							y = 83.5,
							name = "carName",
							type = "sprite",
							x = 33,
							pic = {
								path = "res/ui/weapon/catapult/carName/zc_word_lyzc.png"
							}
						}
					}
				},
				{
					name = "skillNameBtn",
					h = 44,
					type = "button",
					w = 302,
					y = 230.0001,
					x = 293.9999,
					normal = {
						path = "res/ui/weapon/catapult/zc_teji_di.png"
					},
					touched = {
						path = "res/ui/weapon/catapult/zc_teji_di.png"
					},
					children = {
						{
							y = 21.9999,
							name = "smallSkillName",
							type = "sprite",
							x = 213.9975,
							pic = {
								path = "res/ui/weapon/catapult/skill/zc_word_1_s.png"
							}
						},
						{
							y = 18.9998,
							name = "zc_word_tj",
							type = "sprite",
							x = 90,
							pic = {
								path = "res/ui/weapon/catapult/sx/zc_word_tj.png"
							}
						}
					}
				},
				{
					y = 126,
					name = "line1",
					type = "sprite",
					x = -46,
					pic = {
						path = "res/ui/weapon/catapult/btn/zc_line_1.png"
					}
				},
				{
					y = 26.9998,
					name = "line2",
					type = "sprite",
					x = -100.0001,
					pic = {
						path = "res/ui/weapon/catapult/btn/zc_line_2.png"
					}
				},
				{
					y = 27.9998,
					name = "line3",
					type = "sprite",
					x = 170.9999,
					pic = {
						path = "res/ui/weapon/catapult/btn/zc_line_3.png"
					}
				},
				{
					y = 130,
					name = "line4",
					type = "sprite",
					x = 121,
					pic = {
						path = "res/ui/weapon/catapult/btn/zc_line_4.png"
					}
				},
				{
					name = "chariotBodyItem1",
					h = 118,
					type = "button",
					w = 118,
					y = 139.9993,
					x = -145.0008,
					normal = {
						path = "res/ui/weapon/catapult/btn/zc_round_icon_bg.png"
					},
					touched = {
						path = "res/ui/weapon/catapult/btn/zc_round_icon_bg.png"
					},
					children = {
						{
							y = 59,
							name = "cbIcon1",
							type = "sprite",
							x = 59,
							pic = {
								path = "res/ui/weapon/catapult/icon2/cb1_1.png"
							}
						},
						{
							type = "sprite",
							name = "cbEffect1",
							y = 59,
							visible = false,
							x = 59,
							pic = {
								path = "res/ui/weapon/catapult/zc_round_icon_light.png"
							}
						},
						{
							fontSize = 24,
							name = "cbNum1",
							type = "label",
							visible = false,
							y = 110,
							x = 120
						},
						{
							type = "sprite",
							name = "cbMan1",
							y = 104.9998,
							visible = false,
							x = 104.9996,
							pic = {
								path = "res/ui/weapon/catapult/zc_word_man.png"
							}
						},
						{
							y = -7.9999,
							name = "sxIcon1",
							type = "sprite",
							x = 57.9999,
							pic = {
								path = "res/ui/weapon/catapult/sx/zc_round_word_1.png"
							}
						}
					}
				},
				{
					name = "chariotBodyItem2",
					h = 118,
					type = "button",
					w = 118,
					y = 5.9995,
					x = -228.5725,
					normal = {
						path = "res/ui/weapon/catapult/btn/zc_round_icon_bg.png"
					},
					touched = {
						path = "res/ui/weapon/catapult/btn/zc_round_icon_bg.png"
					},
					children = {
						{
							y = 59,
							name = "cbIcon2",
							type = "sprite",
							x = 59,
							pic = {
								path = "res/ui/weapon/catapult/icon2/cb1_1.png"
							}
						},
						{
							type = "sprite",
							name = "cbEffect2",
							y = 59,
							visible = false,
							x = 59,
							pic = {
								path = "res/ui/weapon/catapult/zc_round_icon_light.png"
							}
						},
						{
							fontSize = 24,
							name = "cbNum2",
							type = "label",
							visible = false,
							y = 110,
							x = 120
						},
						{
							type = "sprite",
							name = "cbMan2",
							y = 104.9998,
							visible = false,
							x = 104.9996,
							pic = {
								path = "res/ui/weapon/catapult/zc_word_man.png"
							}
						},
						{
							y = -8,
							name = "sxIcon2",
							type = "sprite",
							x = 58,
							pic = {
								path = "res/ui/weapon/catapult/sx/zc_round_word_1.png"
							}
						}
					}
				},
				{
					name = "chariotBodyItem3",
					h = 118,
					type = "button",
					w = 118,
					y = 4.9999,
					x = 288.9998,
					normal = {
						path = "res/ui/weapon/catapult/btn/zc_round_icon_bg.png"
					},
					touched = {
						path = "res/ui/weapon/catapult/btn/zc_round_icon_bg.png"
					},
					children = {
						{
							y = 59,
							name = "cbIcon3",
							type = "sprite",
							x = 59,
							pic = {
								path = "res/ui/weapon/catapult/icon2/cb1_1.png"
							}
						},
						{
							type = "sprite",
							name = "cbEffect3",
							y = 59,
							visible = false,
							x = 59,
							pic = {
								path = "res/ui/weapon/catapult/zc_round_icon_light.png"
							}
						},
						{
							fontSize = 24,
							name = "cbNum3",
							type = "label",
							visible = false,
							y = 110,
							x = 120
						},
						{
							type = "sprite",
							name = "cbMan3",
							y = 104.9998,
							visible = false,
							x = 104.9996,
							pic = {
								path = "res/ui/weapon/catapult/zc_word_man.png"
							}
						},
						{
							y = -8,
							name = "sxIcon3",
							type = "sprite",
							x = 58,
							pic = {
								path = "res/ui/weapon/catapult/sx/zc_round_word_1.png"
							}
						}
					}
				},
				{
					name = "chariotBodyItem4",
					h = 118,
					type = "button",
					w = 118,
					y = 139.9995,
					x = 218,
					normal = {
						path = "res/ui/weapon/catapult/btn/zc_round_icon_bg.png"
					},
					touched = {
						path = "res/ui/weapon/catapult/btn/zc_round_icon_bg.png"
					},
					children = {
						{
							y = 59,
							name = "cbIcon4",
							type = "sprite",
							x = 59,
							pic = {
								path = "res/ui/weapon/catapult/icon2/cb1_1.png"
							}
						},
						{
							type = "sprite",
							name = "cbEffect4",
							y = 59,
							visible = false,
							x = 59,
							pic = {
								path = "res/ui/weapon/catapult/zc_round_icon_light.png"
							}
						},
						{
							fontSize = 24,
							name = "cbNum4",
							type = "label",
							visible = false,
							y = 110,
							x = 120
						},
						{
							type = "sprite",
							name = "cbMan4",
							y = 104.9998,
							visible = false,
							x = 104.9996,
							pic = {
								path = "res/ui/weapon/catapult/zc_word_man.png"
							}
						},
						{
							y = -8,
							name = "sxIcon4",
							type = "sprite",
							x = 58,
							pic = {
								path = "res/ui/weapon/catapult/sx/zc_round_word_1.png"
							}
						}
					}
				},
				{
					name = "chooseGeneralBtn",
					h = 85,
					type = "button",
					w = 84,
					y = 154.9997,
					x = 394.0002,
					normal = {
						path = "res/ui/rankInfo/DailyFeatView/gxb_icon_di.png"
					},
					touched = {
						path = "res/ui/rankInfo/DailyFeatView/gxb_icon_di.png"
					},
					children = {
						{
							y = 45,
							name = "zc_word_xzwj",
							type = "sprite",
							x = 42,
							pic = {
								path = "res/ui/weapon/catapult/zc_word_xzwj.png"
							}
						},
						{
							type = "sprite",
							name = "generalPic",
							y = 45,
							visible = false,
							x = 42.0001,
							pic = {
								path = "res/ui/common/generalPic/generalPic_zhurong.jpg"
							}
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_lock",
					h = 38,
					type = "button",
					w = 154,
					y = 226,
					visible = false,
					x = -196,
					normal = {
						path = "res/ui/activity/boatArrow/ccjj_word_numb_di.png"
					},
					touched = {
						path = "res/ui/activity/boatArrow/ccjj_word_numb_di.png"
					},
					children = {
						{
							y = 19,
							type = "sprite9",
							x = 17,
							preferedSize = CCSizeMake(44, 44),
							middleRect = CCRectMake(5, 5, 66, 66),
							pic = {
								path = "res/ui/common/quailtyFrames/quality_frame_1.png"
							},
							children = {
								{
									y = 22,
									x = 22,
									type = "sprite",
									scale = 0.55,
									pic = {
										frame = true,
										path = "kms.jpg"
									}
								},
								{
									fontSize = 22,
									name = "zhugeLockNum",
									text = "0",
									type = "label",
									y = 2,
									x = 42,
									anchorPoint = ccp(1, 0)
								}
							}
						},
						{
							fontSize = 22,
							name = "zhugeLockCD",
							y = 19,
							type = "label",
							x = 90,
							color = colorQuality[5]
						}
					}
				}
			}
		},
		{
			y = 0,
			name = "chariotBodyView",
			type = "node",
			x = 0,
			children = {
				{
					y = 0,
					name = "bodyNode",
					type = "node",
					x = 0,
					children = {
						{
							y = -170,
							name = "zc_title_bg",
							type = "sprite",
							x = -310,
							pic = {
								path = "res/ui/weapon/catapult/zc_title_bg.png"
							}
						},
						{
							y = -170,
							name = "zc_word_bjqh",
							type = "sprite",
							x = -310,
							pic = {
								path = "res/ui/weapon/catapult/zc_word_bjqh.png"
							}
						},
						{
							name = "ytBgBtn",
							h = 60,
							type = "button",
							w = 140,
							y = -134,
							x = -205,
							normal = {
								path = "res/ui/weapon/catapult/zc_zy_btn01.png"
							},
							touched = {
								path = "res/ui/weapon/catapult/zc_zy_btn01.png"
							},
							children = {
								{
									y = 30,
									name = "zc_yt_icon",
									type = "sprite",
									x = 29.9999,
									pic = {
										path = "res/ui/weapon/machine/zc_yt_icon.png"
									}
								},
								{
									fontSize = 20,
									name = "yuntieNum",
									type = "label",
									y = 30,
									x = 85,
									halign = kCCTextAlignmentLeft
								}
							}
						},
						{
							name = "tzBgBtn",
							h = 60,
							type = "button",
							w = 140,
							y = -206,
							x = -205,
							normal = {
								path = "res/ui/weapon/catapult/zc_zy_btn02.png"
							},
							touched = {
								path = "res/ui/weapon/catapult/zc_zy_btn02.png"
							},
							children = {
								{
									y = 30,
									name = "zc_new_icon_tz",
									type = "sprite",
									x = 30,
									pic = {
										path = "res/ui/weapon/machine/zc_new_icon_tz2.png"
									}
								},
								{
									fontSize = 20,
									name = "blueprintNum",
									type = "label",
									y = 30,
									x = 80,
									halign = kCCTextAlignmentLeft
								}
							}
						},
						{
							y = -168,
							name = "zc_word_di_ink",
							type = "sprite",
							x = -100,
							pic = {
								path = "res/ui/weapon/catapult/zc_word_di_ink.png"
							},
							children = {
								{
									y = 67,
									name = "zc_word_huoli",
									type = "sprite",
									x = 26,
									pic = {
										path = "res/ui/weapon/catapult/sx/zc_word_1.png"
									}
								}
							}
						},
						{
							y = 0,
							name = "cpNode",
							type = "node",
							x = 0,
							children = {
								{
									y = -170,
									name = "cpItem1",
									type = "sprite",
									x = 0,
									pic = {
										path = "res/ui/weapon/catapult/zc_bujian_di1.png"
									},
									children = {
										{
											name = "bIconBtn1",
											h = 4,
											type = "button",
											w = 4,
											y = -127.3216,
											x = 180.8531,
											normal = {
												path = "res/default.png"
											},
											touched = {
												path = "res/default.png"
											},
											children = {
												{
													y = 238.0043,
													name = "bIcon1",
													type = "sprite",
													x = -121.0008,
													pic = {
														path = "res/ui/weapon/catapult/icon1/1_1.jpg"
													}
												},
												{
													w = 72,
													name = "bBtn1",
													h = 72,
													type = "button",
													y = 238.0043,
													x = -121.0008,
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
											fontSize = 22,
											name = "bproLb1",
											y = 130,
											type = "label",
											x = 57.9995
										},
										{
											fontSize = 22,
											name = "fullLb1",
											y = 33,
											type = "label",
											x = 58,
											textId = 216134
										},
										{
											name = "makeBtn1",
											h = 54,
											type = "button",
											w = 106,
											y = 35.0001,
											x = 58.9998,
											normal = {
												path = "res/ui/weapon/catapult/zc_bujian_card_btn.png"
											},
											touched = {
												path = "res/ui/weapon/catapult/zc_bujian_card_btn_c.png"
											},
											children = {
												{
													y = 82,
													name = "gold_icon1",
													scale = 0.6,
													type = "sprite",
													x = 35,
													pic = {
														path = "res/ui/playerInfo/icon_gold.png"
													}
												},
												{
													fontSize = 20,
													name = "goldLb1",
													y = 80,
													type = "label",
													x = 66
												},
												{
													y = 28.0001,
													name = "yt_icon1",
													type = "sprite",
													x = 27.9994,
													pic = {
														path = "res/ui/weapon/machine/zc_yt_icon.png"
													}
												},
												{
													fontSize = 20,
													name = "costLb1",
													y = 28,
													type = "label",
													x = 64.9985
												}
											}
										},
										{
											y = 84,
											name = "btn_sp1",
											h = 180,
											type = "button",
											w = 130,
											visible = false,
											x = 59,
											normal = {
												path = "res/default.png"
											},
											touched = {
												path = "res/ui/general/generalSilk/reward_icon_view_bg_light.png"
											}
										}
									}
								},
								{
									y = -170,
									name = "cpItem2",
									type = "sprite",
									x = 125,
									pic = {
										path = "res/ui/weapon/catapult/zc_bujian_di1.png"
									},
									children = {
										{
											name = "bIconBtn2",
											h = 4,
											type = "button",
											w = 4,
											y = -127.3216,
											x = 180.8531,
											normal = {
												path = "res/default.png"
											},
											touched = {
												path = "res/default.png"
											},
											children = {
												{
													y = 238.0043,
													name = "bIcon2",
													type = "sprite",
													x = -121.0008,
													pic = {
														path = "res/ui/weapon/catapult/icon1/1_1.jpg"
													}
												},
												{
													w = 72,
													name = "bBtn2",
													h = 72,
													type = "button",
													y = 238.0043,
													x = -121.0008,
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
											fontSize = 22,
											name = "bproLb2",
											y = 130,
											type = "label",
											x = 57.9995
										},
										{
											fontSize = 22,
											name = "fullLb2",
											y = 33,
											type = "label",
											x = 58,
											textId = 216134
										},
										{
											name = "makeBtn2",
											h = 54,
											type = "button",
											w = 106,
											y = 35.0001,
											x = 58.9998,
											normal = {
												path = "res/ui/weapon/catapult/zc_bujian_card_btn.png"
											},
											touched = {
												path = "res/ui/weapon/catapult/zc_bujian_card_btn_c.png"
											},
											children = {
												{
													y = 82,
													name = "gold_icon2",
													scale = 0.6,
													type = "sprite",
													x = 35,
													pic = {
														path = "res/ui/playerInfo/icon_gold.png"
													}
												},
												{
													fontSize = 20,
													name = "goldLb2",
													y = 80,
													type = "label",
													x = 66
												},
												{
													y = 28.0001,
													name = "yt_icon2",
													type = "sprite",
													x = 27.9994,
													pic = {
														path = "res/ui/weapon/machine/zc_yt_icon.png"
													}
												},
												{
													fontSize = 20,
													name = "costLb2",
													y = 28,
													type = "label",
													x = 64.9985
												}
											}
										},
										{
											y = 84,
											name = "btn_sp2",
											h = 180,
											type = "button",
											w = 130,
											visible = false,
											x = 59,
											normal = {
												path = "res/default.png"
											},
											touched = {
												path = "res/ui/general/generalSilk/reward_icon_view_bg_light.png"
											}
										}
									}
								},
								{
									y = -170,
									name = "cpItem3",
									type = "sprite",
									x = 250,
									pic = {
										path = "res/ui/weapon/catapult/zc_bujian_di1.png"
									},
									children = {
										{
											name = "bIconBtn3",
											h = 4,
											type = "button",
											w = 4,
											y = -127.3216,
											x = 180.8531,
											normal = {
												path = "res/default.png"
											},
											touched = {
												path = "res/default.png"
											},
											children = {
												{
													y = 238.0043,
													name = "bIcon3",
													type = "sprite",
													x = -121.0008,
													pic = {
														path = "res/ui/weapon/catapult/icon1/1_1.jpg"
													}
												},
												{
													w = 72,
													name = "bBtn3",
													h = 72,
													type = "button",
													y = 238.0043,
													x = -121.0008,
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
											fontSize = 22,
											name = "bproLb3",
											y = 130,
											type = "label",
											x = 57.9995
										},
										{
											fontSize = 22,
											name = "fullLb3",
											y = 33,
											type = "label",
											x = 58,
											textId = 216134
										},
										{
											name = "makeBtn3",
											h = 54,
											type = "button",
											w = 106,
											y = 35.0001,
											x = 58.9998,
											normal = {
												path = "res/ui/weapon/catapult/zc_bujian_card_btn.png"
											},
											touched = {
												path = "res/ui/weapon/catapult/zc_bujian_card_btn_c.png"
											},
											children = {
												{
													y = 82,
													name = "gold_icon3",
													scale = 0.6,
													type = "sprite",
													x = 35,
													pic = {
														path = "res/ui/playerInfo/icon_gold.png"
													}
												},
												{
													fontSize = 20,
													name = "goldLb3",
													y = 80,
													type = "label",
													x = 66
												},
												{
													y = 28.0001,
													name = "yt_icon3",
													type = "sprite",
													x = 27.9994,
													pic = {
														path = "res/ui/weapon/machine/zc_yt_icon.png"
													}
												},
												{
													fontSize = 20,
													name = "costLb3",
													y = 28,
													type = "label",
													x = 64.9985
												}
											}
										},
										{
											y = 84,
											name = "btn_sp3",
											h = 180,
											type = "button",
											w = 130,
											visible = false,
											x = 59,
											normal = {
												path = "res/default.png"
											},
											touched = {
												path = "res/ui/general/generalSilk/reward_icon_view_bg_light.png"
											}
										}
									}
								},
								{
									y = -170,
									name = "cpItem4",
									type = "sprite",
									x = 375,
									pic = {
										path = "res/ui/weapon/catapult/zc_bujian_di1.png"
									},
									children = {
										{
											name = "bIconBtn4",
											h = 4,
											type = "button",
											w = 4,
											y = -127.3216,
											x = 180.8531,
											normal = {
												path = "res/default.png"
											},
											touched = {
												path = "res/default.png"
											},
											children = {
												{
													y = 238.0043,
													name = "bIcon4",
													type = "sprite",
													x = -121.0008,
													pic = {
														path = "res/ui/weapon/catapult/icon1/1_1.jpg"
													}
												},
												{
													w = 72,
													name = "bBtn4",
													h = 72,
													type = "button",
													y = 238.0043,
													x = -121.0008,
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
											fontSize = 22,
											name = "bproLb4",
											y = 130,
											type = "label",
											x = 57.9995
										},
										{
											fontSize = 22,
											name = "fullLb4",
											y = 33,
											type = "label",
											x = 58,
											textId = 216134
										},
										{
											name = "makeBtn4",
											h = 54,
											type = "button",
											w = 106,
											y = 35.0001,
											x = 58.9998,
											normal = {
												path = "res/ui/weapon/catapult/zc_bujian_card_btn.png"
											},
											touched = {
												path = "res/ui/weapon/catapult/zc_bujian_card_btn_c.png"
											},
											children = {
												{
													y = 80,
													name = "gold_icon4",
													scale = 0.6,
													type = "sprite",
													x = 35,
													pic = {
														path = "res/ui/playerInfo/icon_gold.png"
													}
												},
												{
													fontSize = 20,
													name = "goldLb4",
													y = 80,
													type = "label",
													x = 66
												},
												{
													y = 28.0001,
													name = "yt_icon4",
													type = "sprite",
													x = 27.9994,
													pic = {
														path = "res/ui/weapon/machine/zc_yt_icon.png"
													}
												},
												{
													fontSize = 20,
													name = "costLb4",
													y = 28,
													type = "label",
													x = 64.9985
												}
											}
										},
										{
											y = 84,
											name = "btn_sp4",
											h = 180,
											type = "button",
											w = 130,
											visible = false,
											x = 59,
											normal = {
												path = "res/default.png"
											},
											touched = {
												path = "res/ui/general/generalSilk/reward_icon_view_bg_light.png"
											}
										}
									}
								}
							}
						}
					}
				},
				{
					visible = false,
					name = "bigSkillBtn",
					h = 70,
					type = "button",
					w = 400,
					y = -150,
					x = 30,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					children = {
						{
							y = 18,
							name = "zc_word_tj_big",
							type = "sprite",
							x = 30,
							pic = {
								path = "res/ui/weapon/catapult/sx/zc_word_tj_big.png"
							}
						},
						{
							y = 18,
							name = "zc_word_tj_big",
							type = "sprite",
							x = 260,
							pic = {
								path = "res/ui/weapon/catapult/skill/zc_word_1_b.png"
							}
						}
					}
				},
				{
					y = -170.0001,
					name = "openCondition",
					type = "sprite",
					visible = false,
					x = 44.9996,
					pic = {
						path = "res/ui/weapon/catapult/zc_word_tjzcwqgzhhd.png"
					}
				},
				{
					y = -170,
					name = "cbFull",
					type = "sprite",
					visible = false,
					x = 150.0003,
					pic = {
						path = "res/ui/weapon/catapult/zc_word_bjymj.png"
					}
				},
				{
					y = -167.0005,
					name = "gzBtn",
					h = 62,
					type = "button",
					w = 195,
					visible = false,
					x = 45.0011,
					normal = {
						path = "res/ui/common/button/public_btn_green.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_green_c.png"
					},
					children = {
						{
							fontSize = 20,
							name = "gzLb",
							y = 33,
							type = "label",
							x = 97.5,
							color = color_whi
						}
					}
				},
				{
					visible = false,
					name = "bg_list",
					type = "sprite9",
					y = 0,
					x = 0,
					preferedSize = CCSizeMake(400, 560),
					middleRect = CCRectMake(30, 30, 45, 45),
					pic = {
						frame = true,
						path = "bigPanel.png"
					},
					children = {
						{
							y = 0,
							h = 560,
							type = "button",
							w = 400,
							x = 0,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							},
							anchorPoint = ccp(0, 0)
						},
						{
							x = 350,
							name = "btn_closeList",
							h = 33,
							type = "button",
							w = 32,
							y = 575,
							scale = 2,
							normal = {
								frame = true,
								path = "btn_close_a.png"
							},
							touched = {
								frame = true,
								path = "btn_close_c.png"
							}
						}
					}
				}
			}
		}
	}
}
var_0_1.layout_cell_candidate = {
	x = 200,
	name = "bg",
	y = 0,
	type = "sprite",
	scale = 0.85,
	anchorPoint = ccp(0.5, 0),
	pic = {
		path = "res/ui/rankInfo/DailyFeatView/gxb_ph_bg.png"
	},
	children = {
		{
			y = 57,
			name = "icon",
			type = "sprite",
			x = 59,
			pic = {
				path = "res/ui/common/playerHead/playerHead_icon_0.png"
			}
		},
		{
			fontSize = 25,
			name = "weaponLv",
			y = 90,
			type = "label",
			x = 130,
			color = color_yel,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 30,
			name = "playerName",
			y = 25,
			type = "label",
			x = 130,
			color = color_pur,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 30,
			name = "clickInfo",
			y = 60,
			type = "label",
			x = 420,
			textId = 136216,
			anchorPoint = ccp(1, 0.5)
		}
	}
}
var_0_1.layout_zhugeLock = {
	height = 530,
	name = "layer_lock",
	x = -457.5,
	type = "layerColor",
	y = -265,
	width = 915,
	color = ccc4(0, 0, 0, 0),
	children = {
		{
			height = 530,
			name = "mask",
			x = 0,
			type = "layerColor",
			y = 0,
			width = 120,
			color = ccc4(0, 255, 0, 0)
		},
		{
			zoomOnTouchDown = true,
			name = "btn_back",
			h = 50,
			type = "button",
			w = 104,
			y = 500,
			x = 60,
			normal = {
				path = "res/ui/juben/jubenLevelSelect/btn_jb_back_n.png"
			},
			touched = {
				path = "res/ui/juben/jubenLevelSelect/btn_jb_back_h.png"
			}
		}
	}
}

function var_0_1.ctor(arg_2_0, arg_2_1)
	log.info("@@ 新战车")

	arg_2_0.view = {}
	arg_2_0.tipStr = {}
	arg_2_0.selectBodyId = 0

	uiutil.initWidgets(arg_2_0.view, arg_2_0.layout)
	arg_2_0:addChild(arg_2_0.view.widgets.root)
end

function var_0_1.showPanel(arg_3_0, arg_3_1)
	arg_3_0:chariotItemResert()
	arg_3_0:chariotBodyItemResert()

	arg_3_0.info = arg_3_1

	local var_3_0 = arg_3_0.info

	if var_3_0.chariots then
		for iter_3_0, iter_3_1 in ipairs(var_3_0.chariots) do
			if iter_3_1 then
				arg_3_0.view.widgets["carIcon" .. iter_3_0]:setDisplayFrame(CCSprite:create("res/ui/weapon/catapult/icon1/car" .. iter_3_0 .. ".jpg"):displayFrame())

				if iter_3_1.open == 1 then
					arg_3_0.view.widgets["chariotItem" .. iter_3_0]:setEnabled(true)
					arg_3_0.view.widgets["carIcon" .. iter_3_0]:removeAllChildrenWithCleanup(true)
				else
					tool.spriteToGray(arg_3_0.view.widgets["carIcon" .. iter_3_0])
				end

				arg_3_0.view.widgets["carIcon" .. iter_3_0]:setVisible(true)

				if iter_3_0 > 2 then
					arg_3_0.view.widgets["chariotItem" .. iter_3_0]:setEnabled(false)
					arg_3_0.view.widgets["carIcon" .. iter_3_0]:setVisible(false)
				end
			end
		end
	end

	arg_3_0.curChariot = var_3_0.chariot

	if var_3_0.chariot then
		arg_3_0.view.widgets.carNameBtn:setEnabled(true)
		arg_3_0.view.widgets.skillNameBtn:setEnabled(true)
		arg_3_0.view.widgets.chooseGeneralBtn:setEnabled(true)
		arg_3_0.view.widgets.btn_lock:setEnabled(true)
		arg_3_0.view.widgets.btn_lock:setVisible(false)
		arg_3_0.view.widgets.openCondition:setVisible(false)
		arg_3_0.view.widgets.chooseGeneralBtn:setVisible(true)
		arg_3_0.view.widgets["selectEffect" .. var_3_0.chariot.id]:setVisible(true)
		arg_3_0.view.widgets.smallSkillName:removeAllChildrenWithCleanup(true)
		arg_3_0.view.widgets.carImage:setDisplayFrame(CCSprite:create("res/ui/weapon/catapult/car/car" .. var_3_0.chariot.id .. ".png"):displayFrame())
		arg_3_0.view.widgets.carName:setDisplayFrame(CCSprite:create("res/ui/weapon/catapult/carName/zc_word_" .. var_3_0.chariot.id .. ".png"):displayFrame())
		arg_3_0.view.widgets.smallSkillName:setDisplayFrame(CCSprite:create("res/ui/weapon/catapult/skill/zc_word_" .. var_3_0.chariot.id .. "_s.png"):displayFrame())
		arg_3_0.view.widgets.zc_word_tj_big:setDisplayFrame(CCSprite:create("res/ui/weapon/catapult/skill/zc_word_" .. var_3_0.chariot.id .. "_b.png"):displayFrame())

		arg_3_0.curChariot.open = var_3_0.chariots[var_3_0.chariot.id].open

		if var_3_0.chariots[var_3_0.chariot.id].open == 0 then
			arg_3_0.view.widgets.openCondition:setVisible(true)

			local var_3_1 = 1

			if var_3_0.chariot.id > 1 then
				var_3_1 = var_3_0.chariot.id - 1
			end

			arg_3_0.view.widgets.openCondition:setDisplayFrame(CCSprite:create("res/ui/weapon/catapult/zc_word_tip" .. var_3_1 .. ".png"):displayFrame())
			arg_3_0.view.widgets.bodyNode:setVisible(false)
			arg_3_0.view.widgets.bigSkillBtn:setVisible(false)
			arg_3_0.view.widgets.cbFull:setVisible(false)
			arg_3_0.view.widgets.gzBtn:setVisible(false)
			arg_3_0.view.widgets.chooseGeneralBtn:setVisible(false)
		elseif tonumber(arg_3_1.zhugeLockNum) > 0 and tonumber(arg_3_1.zhugeLockCD) > 0 then
			arg_3_0.view.widgets.btn_lock:setVisible(true)
			arg_3_0.view.widgets.zhugeLockNum:setString(arg_3_1.zhugeLockNum)
			arg_3_0.view.widgets.zhugeLockCD:stopAllActions()

			local var_3_2 = CCArray:create()

			var_3_2:addObject(CCCallFuncN:create(function()
				if arg_3_1.zhugeLockCD <= 0 then
					arg_3_0.view.widgets.zhugeLockCD:stopAllActions()
					arg_3_0.view.widgets.btn_lock:setVisible(false)
				else
					arg_3_0.view.widgets.zhugeLockCD:setString(tool.getFormatTime(arg_3_1.zhugeLockCD))
				end
			end))
			var_3_2:addObject(CCDelayTime:create(0.5))

			local var_3_3 = CCSequence:create(var_3_2)

			arg_3_0.view.widgets.zhugeLockCD:runAction(CCRepeatForever:create(var_3_3))
		end

		if var_3_0.chariot.generalId and var_3_0.chariot.generalId > 0 then
			arg_3_0.view.widgets.generalPic:setVisible(true)

			local var_3_4 = rmgr.getSData("general")[tostring(var_3_0.chariot.generalId)].pic

			arg_3_0.view.widgets.generalPic:setDisplayFrame(CCSprite:create("res/ui/common/generalPic/generalPic_" .. var_3_4 .. ".jpg"):displayFrame())
		else
			arg_3_0.view.widgets.generalPic:setVisible(false)
		end

		if arg_3_0.selectBodyId == 0 then
			for iter_3_2, iter_3_3 in ipairs(var_3_0.chariot.bp) do
				if iter_3_3.lv < iter_3_3.maxLv then
					arg_3_0.selectBodyId = iter_3_2

					break
				end
			end
		end

		if arg_3_0.selectBodyId > 0 then
			arg_3_0.view.widgets["cbEffect" .. arg_3_0.selectBodyId]:setVisible(true)
			arg_3_0:selectBpItem()
		else
			arg_3_0.selectBodyId = 4

			arg_3_0.view.widgets.cbEffect4:setVisible(true)
			arg_3_0:selectBpItem()
		end

		for iter_3_4, iter_3_5 in ipairs(var_3_0.chariot.bp) do
			arg_3_0.view.widgets["cbIcon" .. iter_3_4]:setDisplayFrame(CCSprite:create("res/ui/weapon/catapult/icon2/cb" .. var_3_0.chariot.id .. "_" .. iter_3_5.id .. ".png"):displayFrame())
			arg_3_0.view.widgets["sxIcon" .. iter_3_4]:setDisplayFrame(CCSprite:create("res/ui/weapon/catapult/sx/zc_round_word_" .. iter_3_4 .. ".png"):displayFrame())

			if iter_3_5.lv >= iter_3_5.maxLv then
				arg_3_0.view.widgets["cbNum" .. iter_3_4]:setVisible(false)
				arg_3_0.view.widgets["cbMan" .. iter_3_4]:setVisible(true)
			else
				arg_3_0.view.widgets["cbNum" .. iter_3_4]:setString("Lv." .. iter_3_5.lv)
				arg_3_0.view.widgets["cbNum" .. iter_3_4]:setVisible(true)
				arg_3_0.view.widgets["cbMan" .. iter_3_4]:setVisible(false)
			end

			if var_3_0.chariot.finalSkill and var_3_0.chariot.finalSkill.open == 1 then
				arg_3_0.view.widgets.smallSkillName:removeAllChildrenWithCleanup(true)
			else
				tool.spriteToGray(arg_3_0.view.widgets.smallSkillName)
			end
		end
	end
end

function var_0_1.showZhugeLock(arg_5_0)
	arg_5_0.view.widgets.carNameBtn:setEnabled(false)
	arg_5_0.view.widgets.skillNameBtn:setEnabled(false)
	arg_5_0.view.widgets.chooseGeneralBtn:setEnabled(false)
	arg_5_0.view.widgets.btn_lock:setEnabled(false)

	local var_5_0 = {}

	uiutil.initWidgets(var_5_0, arg_5_0.layout_zhugeLock)
	arg_5_0.view.widgets.root:addChild(var_5_0.widgets.layer_lock, 100)

	arg_5_0.view.widgets.layer_lock = var_5_0.widgets.layer_lock

	swallowTouch(var_5_0.widgets.mask)
	var_5_0.widgets.btn_back:addHandleOfControlEvent(function()
		log.info("btn_back")
		var_5_0.widgets.layer_lock:removeFromParentAndCleanup(true)

		arg_5_0.usingZhugeLock = false

		arg_5_0:showPanel(arg_5_0.info)
	end, CCControlEventTouchUpInside)

	local var_5_1 = CCLayerColor:create(ccc4(0, 0, 0, 180), 915, 530)
	local var_5_2 = CCSprite:create("res/ui/activity/defendXiangYang/zsxy_zc_word_qxzygbjsy.png")

	var_5_2:setPosition(486, 332)
	var_5_1:addChild(var_5_2)

	local var_5_3 = CCLayerColor:create(ccc4(0, 255, 0, 0), 810, 200)

	var_5_3:setPosition(105, 0)
	var_5_1:addChild(var_5_3)
	swallowTouch(var_5_3)

	local var_5_4 = CCClippingNode:create()
	local var_5_5 = CCNode:create()
	local var_5_6 = {
		ccp(309, 408),
		ccp(679, 408),
		ccp(225, 267),
		ccp(749, 267)
	}

	for iter_5_0 = 1, 4 do
		local var_5_7 = CCSprite:create("res/ui/common/ItemsPic/circle400.png")

		tool.scaleTo(var_5_7, 103, 103)
		var_5_7:setPosition(var_5_6[iter_5_0])
		var_5_5:addChild(var_5_7)
	end

	var_5_4:setStencil(var_5_5)
	var_5_4:setInverted(true)
	var_5_4:setAlphaThreshold(0)
	var_5_4:addChild(var_5_1)
	var_5_0.widgets.layer_lock:addChild(var_5_4, -1)

	arg_5_0.view.widgets.clip1 = var_5_4

	local var_5_8 = CCLayerColor:create(ccc4(0, 0, 0, 180), 915, 530)
	local var_5_9 = CCSprite:create("res/ui/activity/defendXiangYang/zsxy_zc_word_qxzyxsxqh.png")

	var_5_9:setPosition(644, 208)
	var_5_8:addChild(var_5_9)

	local var_5_10 = CCLayerColor:create(ccc4(0, 255, 0, 0), 810, 350)

	var_5_10:setPosition(105, 180)
	var_5_8:addChild(var_5_10)
	swallowTouch(var_5_10)

	local var_5_11 = CCClippingNode:create()
	local var_5_12 = CCNode:create()
	local var_5_13 = CCSprite:create("res/default2.png")

	var_5_13:setAnchorPoint(ccp(0, 0))
	tool.scaleTo(var_5_13, 530, 180)
	var_5_13:setPosition(385, 0)
	var_5_12:addChild(var_5_13)
	var_5_11:setStencil(var_5_12)
	var_5_11:setInverted(true)
	var_5_11:setAlphaThreshold(0)
	var_5_11:addChild(var_5_8)
	var_5_0.widgets.layer_lock:addChild(var_5_11, -1)
	var_5_11:setVisible(false)

	arg_5_0.view.widgets.clip2 = var_5_11
	arg_5_0.usingZhugeLock = true
end

function var_0_1.onSuperForgeSp(arg_7_0, arg_7_1, arg_7_2)
	local function var_7_0()
		local var_8_0 = rmgr.getAnimation("fireball")
		local var_8_1 = CCAnimation:createWithSpriteFrames(var_8_0, 0.04)
		local var_8_2 = CCAnimate:create(var_8_1)
		local var_8_3 = CCRepeatForever:create(var_8_2)
		local var_8_4 = CCSprite:create()

		var_8_4:setRotation(90)
		var_8_4:runAction(var_8_3)

		return var_8_4
	end

	local function var_7_1(arg_9_0)
		arg_7_0.view.widgets.layer_lock:removeFromParentAndCleanup(true)

		arg_7_0.usingZhugeLock = false

		local var_9_0 = arg_9_0.action.data
		local var_9_1 = CCLayerColor:create(ccc4(0, 0, 0, 0), 915, 530)

		var_9_1:setPosition(-457.5, -265)
		arg_7_0.view.widgets.root:addChild(var_9_1, 100)
		swallowTouch(var_9_1)

		local var_9_2 = 497.5
		local var_9_3 = 438
		local var_9_4, var_9_5 = arg_7_0.view.widgets["cpItem" .. arg_7_2]:getPosition()
		local var_9_6, var_9_7 = var_9_4 + 457.5, var_9_5 + 265
		local var_9_8 = var_7_0()

		var_9_8:setScale(2)
		var_9_8:setPosition(var_9_2, var_9_3)
		var_9_1:addChild(var_9_8)

		local var_9_9 = var_7_0()

		var_9_9:setPosition(var_9_2, var_9_3)
		var_9_1:addChild(var_9_9)

		local var_9_10 = CCArray:create()

		for iter_9_0 = 1, var_9_0.maxUp do
			var_9_10:addObject(CCCallFunc:create(function()
				var_9_9:setPosition(var_9_2, var_9_3)
			end))
			var_9_10:addObject(CCShow:create())
			var_9_10:addObject(CCMoveTo:create(0.3, ccp(var_9_6, var_9_7)))
			var_9_10:addObject(CCCallFunc:create(function()
				local var_11_0 = arg_7_0.info.chariot.bp[arg_7_0.selectBodyId].sp[arg_7_2]
				local var_11_1 = var_11_0.num >= var_11_0.numMax

				if not var_11_1 then
					var_11_0.num = var_11_0.num + 1

					arg_7_0:showPanel(arg_7_0.info)
				end

				local var_11_2

				if var_11_1 then
					var_11_2 = language.get(215747)
				else
					for iter_11_0, iter_11_1 in pairs(var_0_0) do
						if var_9_0[iter_11_0] then
							var_11_2 = language.get(iter_11_1, "+" .. var_9_0[iter_11_0])

							break
						end
					end
				end

				local var_11_3 = CCStrokeLabelTTF:create(var_11_2, "Thonburi", 22, 2)

				var_11_3:setColor(var_11_1 and colorTips.red or colorTips.green)
				var_11_3:setPosition(var_9_6, var_9_7)
				var_9_1:addChild(var_11_3)

				local var_11_4 = CCArray:create()

				var_11_4:addObject(CCMoveBy:create(0.5, ccp(0, 30)))
				var_11_4:addObject(CCDelayTime:create(0.2))
				var_11_4:addObject(CCCallFunc:create(function()
					var_11_3:removeFromParentAndCleanup(true)
				end))

				local var_11_5 = CCSequence:create(var_11_4)

				var_11_3:runAction(var_11_5)
			end))
			var_9_10:addObject(CCDelayTime:create(0.3))
			var_9_10:addObject(CCHide:create())
		end

		var_9_10:addObject(CCCallFunc:create(function()
			var_9_1:removeFromParentAndCleanup(true)
			cmgr.sendRequest(arg_7_0.chariotGetInfoHandlerRef, actions.chariotGetInfo, arg_7_0.curChariot.id)
		end))

		local var_9_11 = CCSequence:create(var_9_10)

		var_9_9:runAction(var_9_11)
	end

	messageBox.confirm(language.get(215746), function()
		cmgr.sendRequest(var_7_1, actions.chariotSuperForgeSp, arg_7_1, arg_7_2)
	end)
end

function var_0_1.onSuperRft(arg_15_0, arg_15_1, arg_15_2)
	local function var_15_0(arg_16_0)
		return
	end

	cmgr.sendRequest(var_15_0, actions.chariotSuperRft, arg_15_1, arg_15_2)
end

function var_0_1.selectBpItem(arg_17_0)
	for iter_17_0 = 1, 4 do
		arg_17_0.view.widgets["cbEffect" .. iter_17_0]:setVisible(false)
		arg_17_0.view.widgets["line" .. iter_17_0]:setDisplayFrame(CCSprite:create("res/ui/weapon/catapult/btn/zc_line_" .. iter_17_0 .. ".png"):displayFrame())
	end

	arg_17_0.view.widgets.zc_word_huoli:setDisplayFrame(CCSprite:create("res/ui/weapon/catapult/sx/zc_round_word_" .. arg_17_0.selectBodyId .. ".png"):displayFrame())
	arg_17_0.view.widgets["line" .. arg_17_0.selectBodyId]:setDisplayFrame(CCSprite:create("res/ui/weapon/catapult/btn/zc_line_" .. arg_17_0.selectBodyId .. "_c.png"):displayFrame())
	arg_17_0.view.widgets["cbEffect" .. arg_17_0.selectBodyId]:setVisible(true)
	arg_17_0.view.widgets.yuntieNum:setString(arg_17_0.info.meteoriteNum)

	if arg_17_0.info.meteoriteNum >= arg_17_0.info.meteoriteNumMax then
		arg_17_0.view.widgets.yuntieNum:setColor(ccc3(255, 0, 0))
	else
		arg_17_0.view.widgets.yuntieNum:setColor(colorQuality[1])
	end

	arg_17_0.view.widgets.blueprintNum:setString(arg_17_0.info.blueprintNum)

	if arg_17_0.info.blueprintNumMax and arg_17_0.info.blueprintNum >= arg_17_0.info.blueprintNumMax then
		arg_17_0.view.widgets.blueprintNum:setColor(ccc3(255, 0, 0))
	else
		arg_17_0.view.widgets.blueprintNum:setColor(colorQuality[1])
	end

	arg_17_0.view.widgets.cbFull:setVisible(false)
	arg_17_0.view.widgets.gzBtn:setVisible(false)

	if arg_17_0.curChariot and arg_17_0.curChariot.finalSkill and arg_17_0.curChariot.finalSkill.open == 0 and arg_17_0.curChariot.open == 1 then
		arg_17_0.view.widgets.bodyNode:setVisible(true)
		arg_17_0.view.widgets.skillNameBtn:setVisible(true)
		arg_17_0.view.widgets.bigSkillBtn:setVisible(false)

		if arg_17_0.curChariot.bp and arg_17_0.curChariot.bp[arg_17_0.selectBodyId] then
			local var_17_0 = arg_17_0.curChariot.bp[arg_17_0.selectBodyId]

			if var_17_0.canForge > 0 then
				arg_17_0.view.widgets.bodyNode:setVisible(false)
				arg_17_0.view.widgets.gzBtn:setVisible(true)
				arg_17_0.view.widgets.gzLb:setString(language.get(216115) .. language.get(216140 + arg_17_0.selectBodyId))

				local function var_17_1(arg_18_0)
					arg_17_0:flyAttribute(arg_18_0.action.data)

					if arg_17_0.curChariot then
						cmgr.sendRequest(arg_17_0.chariotGetInfoHandlerRef, actions.chariotGetInfo, arg_17_0.curChariot.id)
					end
				end

				local function var_17_2()
					arg_17_0:closeTips()
					cmgr.sendRequest(var_17_1, actions.chariotForgeBp, arg_17_0.selectBodyId)
				end

				arg_17_0.view.widgets.gzBtn:addHandleOfControlEvent(var_17_2, CCControlEventTouchUpInside)
			elseif var_17_0.lv >= var_17_0.maxLv then
				arg_17_0.view.widgets.cpNode:setVisible(false)
				arg_17_0.view.widgets.cbFull:setVisible(true)
			else
				arg_17_0.view.widgets.cpNode:setVisible(true)

				for iter_17_1 = 1, 4 do
					arg_17_0.view.widgets["gold_icon" .. iter_17_1]:setVisible(false)
					arg_17_0.view.widgets["goldLb" .. iter_17_1]:setVisible(false)
					arg_17_0.view.widgets["bIconBtn" .. iter_17_1]:setVisible(false)
					arg_17_0.view.widgets["makeBtn" .. iter_17_1]:setVisible(false)
					arg_17_0.view.widgets["fullLb" .. iter_17_1]:setVisible(false)
					arg_17_0.view.widgets["bproLb" .. iter_17_1]:setString("")
					arg_17_0.view.widgets["btn_sp" .. iter_17_1]:setVisible(false)
				end

				if var_17_0.sp then
					for iter_17_2, iter_17_3 in ipairs(var_17_0.sp) do
						arg_17_0.view.widgets["fullLb" .. iter_17_2]:setVisible(true)
						arg_17_0.view.widgets["bIconBtn" .. iter_17_2]:setVisible(true)
						arg_17_0.view.widgets["btn_sp" .. iter_17_2]:setVisible(arg_17_0.usingZhugeLock == true)

						if iter_17_3.num < iter_17_3.numMax then
							arg_17_0.view.widgets["makeBtn" .. iter_17_2]:setVisible(true)
							arg_17_0.view.widgets["costLb" .. iter_17_2]:setString(iter_17_3.costNum)
						end

						local var_17_3 = ""

						if arg_17_0.selectBodyId == 4 then
							var_17_3 = "car" .. arg_17_0.curChariot.id .. "_" .. iter_17_3.id
						else
							var_17_3 = arg_17_0.selectBodyId .. "_" .. iter_17_3.id
						end

						arg_17_0.view.widgets["bproLb" .. iter_17_2]:setString(iter_17_3.num .. "/" .. iter_17_3.numMax)
						arg_17_0.view.widgets["bIcon" .. iter_17_2]:setDisplayFrame(CCSprite:create("res/ui/weapon/catapult/icon1/" .. var_17_3 .. ".jpg"):displayFrame())

						local var_17_4 = 0

						if iter_17_3.costType == 216 then
							if arg_17_0.info.meteoriteNum < iter_17_3.costNum then
								arg_17_0.view.widgets["costLb" .. iter_17_2]:setColor(ccc3(255, 0, 0))
							else
								arg_17_0.view.widgets["costLb" .. iter_17_2]:setColor(colorQuality[1])
							end

							arg_17_0.view.widgets["yt_icon" .. iter_17_2]:setDisplayFrame(CCSprite:create("res/ui/weapon/machine/zc_yt_icon.png"):displayFrame())
						elseif iter_17_3.costType == 218 then
							if arg_17_0.info.blueprintNum < iter_17_3.costNum then
								var_17_4 = arg_17_0.info.blueprintGold * (iter_17_3.costNum - arg_17_0.info.blueprintNum)

								arg_17_0.view.widgets["costLb" .. iter_17_2]:setColor(ccc3(255, 0, 0))
								arg_17_0.view.widgets["gold_icon" .. iter_17_2]:setVisible(true)
								arg_17_0.view.widgets["goldLb" .. iter_17_2]:setVisible(true)
								arg_17_0.view.widgets["goldLb" .. iter_17_2]:setString(var_17_4)
							else
								arg_17_0.view.widgets["costLb" .. iter_17_2]:setColor(colorQuality[1])
							end

							arg_17_0.view.widgets["yt_icon" .. iter_17_2]:setDisplayFrame(CCSprite:create("res/ui/weapon/machine/zc_new_icon_tz2.png"):displayFrame())
						end

						local function var_17_5(arg_20_0)
							arg_17_0:flyAttribute(arg_20_0.action.data)

							if arg_17_0.curChariot then
								cmgr.sendRequest(arg_17_0.chariotGetInfoHandlerRef, actions.chariotGetInfo, arg_17_0.curChariot.id)
							end
						end

						local function var_17_6()
							arg_17_0:closeTips()

							if var_17_4 > 0 then
								messageBox.showChargeWin(language.get(190080), language.get(216135, var_17_4), "buyChariotBlueprint", function()
									cmgr.sendRequest(var_17_5, actions.chariotForgeSp, arg_17_0.selectBodyId, iter_17_3.id)
								end)
							else
								cmgr.sendRequest(var_17_5, actions.chariotForgeSp, arg_17_0.selectBodyId, iter_17_3.id)
							end
						end

						arg_17_0.view.widgets["makeBtn" .. iter_17_2]:addHandleOfControlEvent(var_17_6, CCControlEventTouchUpInside)

						local function var_17_7()
							arg_17_0:showTip(arg_17_0:spAttribute(iter_17_3, arg_17_0.curChariot.id), arg_17_0.view.widgets["bIconBtn" .. iter_17_2], ccp(-120, 250))
						end

						arg_17_0.view.widgets["bBtn" .. iter_17_2]:addHandleOfControlEvent(var_17_7, CCControlEventTouchUpInside)
					end
				end
			end
		end
	else
		arg_17_0.view.widgets.bodyNode:setVisible(false)

		if arg_17_0.curChariot.open == 1 then
			arg_17_0.view.widgets.skillNameBtn:setVisible(false)
			arg_17_0.view.widgets.bigSkillBtn:setVisible(true)
		end
	end
end

function var_0_1.chariotBodyItemHandel(arg_24_0, arg_24_1)
	arg_24_0.selectBodyId = arg_24_1

	if arg_24_0.usingZhugeLock then
		arg_24_0.view.widgets.clip1:setVisible(false)
		arg_24_0.view.widgets.clip2:setVisible(true)
	elseif arg_24_0.curChariot and arg_24_0.curChariot.bp and arg_24_0.curChariot.bp and arg_24_0.curChariot.bp[arg_24_1] then
		arg_24_0:showTip(arg_24_0:tbAttribute(arg_24_0.curChariot.bp[arg_24_1]), arg_24_0.view.widgets["chariotBodyItem" .. arg_24_1], ccp(100, 0))
	end

	arg_24_0:selectBpItem()
end

function var_0_1.chariotItemHandel(arg_25_0, arg_25_1)
	arg_25_0:closeTips()

	if arg_25_0.info and arg_25_0.info.chariots then
		local var_25_0 = arg_25_0.info.chariots[arg_25_1]

		if var_25_0 then
			cmgr.sendRequest(arg_25_0.chariotGetInfoHandlerRef, actions.chariotGetInfo, var_25_0.id)
		end
	end
end

function var_0_1.showTip(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	if arg_26_0.timer then
		arg_26_0.timer:over()

		arg_26_0.timer = nil
	end

	arg_26_0.timer = NewTimer(5, function()
		if arg_26_0.mask then
			pcall(arg_26_0.mask.removeFromParentAndCleanup, arg_26_0.mask, true)

			arg_26_0.mask = nil
		end
	end)

	log.info("should show tips ")

	if arg_26_0.mask then
		pcall(arg_26_0.mask.removeFromParentAndCleanup, arg_26_0.mask, true)

		arg_26_0.mask = nil
	end

	arg_26_0.mask = CCLayerColor:create(ccc4(255, 255, 255, 0))

	smgr.rootLayer:addChild(arg_26_0.mask, 60000)

	local var_26_0 = {
		name = "tipFrame",
		type = "sprite9Tips",
		pic = {
			frame = true,
			path = "common_tip_frame_small.png"
		},
		anchorPoint = ccp(0.5, 0),
		middleRect = CCRectMake(24, 24, 1, 1),
		content = arg_26_1
	}
	local var_26_1 = 0
	local var_26_2 = 0
	local var_26_3 = {}

	uiutil.initWidgets(var_26_3, var_26_0)
	arg_26_0.mask:addChild(var_26_3.widgets.tipFrame)

	local var_26_4, var_26_5 = tool.getPositionInScreen(arg_26_2)
	local var_26_6 = var_26_4
	local var_26_7 = var_26_5

	if arg_26_3 then
		var_26_6 = var_26_6 + arg_26_3.x
		var_26_7 = var_26_7 + arg_26_3.y
	end

	var_26_3.widgets.tipFrame:setPosition(ccp(var_26_6, var_26_7))
end

function var_0_1.flyAttribute(arg_28_0, arg_28_1)
	if arg_28_1 then
		arg_28_0.flyTb = {}

		for iter_28_0, iter_28_1 in pairs(var_0_0) do
			if arg_28_1[iter_28_0] then
				table.insert(arg_28_0.flyTb, language.get(iter_28_1, "+" .. arg_28_1[iter_28_0]))
			end
		end
	end
end

function var_0_1.spAttribute(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = {}
	local var_29_1 = language.get(216140 + arg_29_2) .. arg_29_1.num .. "/" .. arg_29_1.numMax

	table.insert(var_29_0, {
		fontSize = 22,
		type = "label",
		color = colorQuality[4],
		halign = kCCTextAlignmentLeft,
		text = var_29_1
	})
	table.insert(var_29_0, {
		fontSize = 20,
		type = "label",
		color = colorQuality[4],
		halign = kCCTextAlignmentLeft,
		text = language.get(216139)
	})

	local var_29_2 = arg_29_1.attribute

	if var_29_2.att and var_29_2.att > 0 then
		local var_29_3 = language.get(216120, var_29_2.att)

		table.insert(var_29_0, {
			fontSize = 20,
			type = "label",
			color = color_whi,
			halign = kCCTextAlignmentLeft,
			text = var_29_3
		})
	end

	if var_29_2.def and var_29_2.def > 0 then
		local var_29_4 = language.get(216121, var_29_2.def)

		table.insert(var_29_0, {
			fontSize = 20,
			type = "label",
			color = color_whi,
			halign = kCCTextAlignmentLeft,
			text = var_29_4
		})
	end

	if var_29_2.hp and var_29_2.hp > 0 then
		local var_29_5 = language.get(216122, var_29_2.hp)

		table.insert(var_29_0, {
			fontSize = 20,
			type = "label",
			color = color_whi,
			halign = kCCTextAlignmentLeft,
			text = var_29_5
		})
	end

	if not var_29_2.att and not var_29_2.def and not var_29_2.hp then
		table.insert(var_29_0, {
			fontSize = 20,
			type = "label",
			color = color_whi,
			halign = kCCTextAlignmentLeft,
			text = language.get(216131)
		})
	end

	if arg_29_1.nextAttribute then
		if arg_29_1.nextAttribute and arg_29_1.nextAttribute.att or arg_29_1.nextAttribute.def or arg_29_1.nextAttribute.hp then
			table.insert(var_29_0, {
				fontSize = 20,
				type = "label",
				color = colorQuality[3],
				halign = kCCTextAlignmentLeft,
				text = language.get(216140)
			})
		end

		local var_29_6 = arg_29_1.nextAttribute

		if var_29_6.att and var_29_6.att > 0 then
			local var_29_7 = language.get(216120, var_29_6.att)

			table.insert(var_29_0, {
				fontSize = 20,
				type = "label",
				color = color_whi,
				halign = kCCTextAlignmentLeft,
				text = var_29_7
			})
		end

		if var_29_6.def and var_29_6.def > 0 then
			local var_29_8 = language.get(216121, var_29_6.def)

			table.insert(var_29_0, {
				fontSize = 20,
				type = "label",
				color = color_whi,
				halign = kCCTextAlignmentLeft,
				text = var_29_8
			})
		end

		if var_29_6.hp and var_29_6.hp > 0 then
			local var_29_9 = language.get(216122, var_29_6.hp)

			table.insert(var_29_0, {
				fontSize = 20,
				type = "label",
				color = color_whi,
				halign = kCCTextAlignmentLeft,
				text = var_29_9
			})
		end
	end

	return var_29_0
end

function var_0_1.tbAttribute(arg_30_0, arg_30_1)
	local var_30_0 = {}
	local var_30_1 = {}
	local var_30_2 = {
		def = 0,
		attCoe = 0,
		hp = 0,
		endurance = 0,
		armorNum = 0,
		threshold = 0,
		att = 0
	}

	if arg_30_1 then
		if arg_30_1.attribute.att then
			var_30_2.att = arg_30_1.attribute.att
		end

		if arg_30_1.attribute.def then
			var_30_2.def = arg_30_1.attribute.def
		end

		if arg_30_1.attribute.hp then
			var_30_2.hp = arg_30_1.attribute.hp
		end

		if arg_30_1.attribute.attCoe then
			var_30_2.attCoe = arg_30_1.attribute.attCoe
		end

		if arg_30_1.attribute.armorNum then
			var_30_2.armorNum = arg_30_1.attribute.armorNum
		end

		if arg_30_1.attribute.endurance then
			var_30_2.endurance = arg_30_1.attribute.endurance
		end

		if arg_30_1.attribute.threshold then
			var_30_2.threshold = arg_30_1.attribute.threshold
		end

		if arg_30_1.attribute.coreSkill then
			local var_30_3 = arg_30_1.attribute.coreSkill.type

			if not var_30_1[var_30_3] then
				var_30_1[var_30_3] = arg_30_1.attribute.coreSkill.value
			else
				var_30_1[var_30_3] = var_30_1[var_30_3] + arg_30_1.attribute.coreSkill.value
			end
		end
	end

	local var_30_4 = language.get(216141) .. " Lv." .. arg_30_1.lv

	table.insert(var_30_0, {
		fontSize = 22,
		type = "label",
		color = colorQuality[4],
		halign = kCCTextAlignmentLeft,
		text = var_30_4
	})
	table.insert(var_30_0, {
		fontSize = 20,
		type = "label",
		color = colorQuality[4],
		halign = kCCTextAlignmentLeft,
		text = language.get(216133)
	})

	if var_30_2.att and var_30_2.att > 0 then
		local var_30_5 = language.get(216120, var_30_2.att)

		table.insert(var_30_0, {
			fontSize = 20,
			type = "label",
			color = color_whi,
			halign = kCCTextAlignmentLeft,
			text = var_30_5
		})
	end

	if var_30_2.def and var_30_2.def > 0 then
		local var_30_6 = language.get(216121, var_30_2.def)

		table.insert(var_30_0, {
			fontSize = 20,
			type = "label",
			color = color_whi,
			halign = kCCTextAlignmentLeft,
			text = var_30_6
		})
	end

	if var_30_2.hp and var_30_2.hp > 0 then
		local var_30_7 = language.get(216122, var_30_2.hp)

		table.insert(var_30_0, {
			fontSize = 20,
			type = "label",
			color = color_whi,
			halign = kCCTextAlignmentLeft,
			text = var_30_7
		})
	end

	if var_30_2.attCoe and var_30_2.attCoe > 0 then
		local var_30_8 = language.get(216123, var_30_2.attCoe)

		table.insert(var_30_0, {
			fontSize = 20,
			type = "label",
			color = color_whi,
			halign = kCCTextAlignmentLeft,
			text = var_30_8
		})
	end

	if var_30_2.armorNum and var_30_2.armorNum > 0 then
		local var_30_9 = language.get(216124, var_30_2.armorNum)

		table.insert(var_30_0, {
			fontSize = 20,
			type = "label",
			color = color_whi,
			halign = kCCTextAlignmentLeft,
			text = var_30_9
		})
	end

	if var_30_2.threshold and var_30_2.threshold > 0 then
		local var_30_10 = language.get(216125, var_30_2.threshold)

		table.insert(var_30_0, {
			fontSize = 20,
			type = "label",
			color = color_whi,
			halign = kCCTextAlignmentLeft,
			text = var_30_10
		})
	end

	if var_30_2.endurance and var_30_2.endurance > 0 then
		local var_30_11 = language.get(216126, var_30_2.endurance)

		table.insert(var_30_0, {
			fontSize = 20,
			type = "label",
			color = color_whi,
			halign = kCCTextAlignmentLeft,
			text = var_30_11
		})
	end

	local var_30_12 = ""

	for iter_30_0, iter_30_1 in pairs(var_30_1) do
		if iter_30_0 == 1 then
			var_30_12 = var_30_12 .. language.get(216127, iter_30_1)
		elseif iter_30_0 == 2 then
			var_30_12 = var_30_12 .. language.get(216128, iter_30_1)
		elseif iter_30_0 == 3 then
			var_30_12 = var_30_12 .. language.get(216129, iter_30_1)
		end
	end

	table.insert(var_30_0, {
		fontSize = 20,
		type = "label",
		color = colorQuality[3],
		halign = kCCTextAlignmentLeft,
		text = var_30_12
	})

	return var_30_0
end

function var_0_1.totalAttribute(arg_31_0, arg_31_1)
	local var_31_0 = {}
	local var_31_1 = {}
	local var_31_2 = {
		def = 0,
		attCoe = 0,
		hp = 0,
		endurance = 0,
		armorNum = 0,
		threshold = 0,
		att = 0
	}

	for iter_31_0, iter_31_1 in ipairs(arg_31_1.bp) do
		if iter_31_1.attribute.att then
			var_31_2.att = var_31_2.att + iter_31_1.attribute.att
		end

		if iter_31_1.attribute.def then
			var_31_2.def = var_31_2.def + iter_31_1.attribute.def
		end

		if iter_31_1.attribute.hp then
			var_31_2.hp = var_31_2.hp + iter_31_1.attribute.hp
		end

		if iter_31_1.attribute.attCoe then
			var_31_2.attCoe = var_31_2.attCoe + iter_31_1.attribute.attCoe
		end

		if iter_31_1.attribute.armorNum then
			var_31_2.armorNum = var_31_2.armorNum + iter_31_1.attribute.armorNum
		end

		if iter_31_1.attribute.endurance then
			var_31_2.endurance = var_31_2.endurance + iter_31_1.attribute.endurance
		end

		if iter_31_1.attribute.threshold then
			var_31_2.threshold = var_31_2.threshold + iter_31_1.attribute.threshold
		end

		if iter_31_1.attribute.coreSkill then
			local var_31_3 = iter_31_1.attribute.coreSkill.type

			if not var_31_1[var_31_3] then
				var_31_1[var_31_3] = iter_31_1.attribute.coreSkill.value
			else
				var_31_1[var_31_3] = var_31_1[var_31_3] + iter_31_1.attribute.coreSkill.value
			end
		end
	end

	local var_31_4 = arg_31_0.info.chariots[arg_31_1.id].name .. "\n"

	table.insert(var_31_0, {
		fontSize = 22,
		type = "label",
		color = colorQuality[4],
		halign = kCCTextAlignmentLeft,
		text = var_31_4
	})
	table.insert(var_31_0, {
		fontSize = 20,
		type = "label",
		color = colorQuality[4],
		halign = kCCTextAlignmentLeft,
		text = language.get(216119)
	})

	if var_31_2.att and var_31_2.att > 0 then
		local var_31_5 = language.get(216120, var_31_2.att)

		table.insert(var_31_0, {
			fontSize = 20,
			type = "label",
			color = color_whi,
			halign = kCCTextAlignmentLeft,
			text = var_31_5
		})
	end

	if var_31_2.def and var_31_2.def > 0 then
		local var_31_6 = language.get(216121, var_31_2.def)

		table.insert(var_31_0, {
			fontSize = 20,
			type = "label",
			color = color_whi,
			halign = kCCTextAlignmentLeft,
			text = var_31_6
		})
	end

	if var_31_2.hp and var_31_2.hp > 0 then
		local var_31_7 = language.get(216122, var_31_2.hp)

		table.insert(var_31_0, {
			fontSize = 20,
			type = "label",
			color = color_whi,
			halign = kCCTextAlignmentLeft,
			text = var_31_7
		})
	end

	if var_31_2.attCoe and var_31_2.attCoe > 0 then
		local var_31_8 = language.get(216123, var_31_2.attCoe)

		table.insert(var_31_0, {
			fontSize = 20,
			type = "label",
			color = color_whi,
			halign = kCCTextAlignmentLeft,
			text = var_31_8
		})
	end

	if var_31_2.armorNum and var_31_2.armorNum > 0 then
		local var_31_9 = language.get(216124, var_31_2.armorNum)

		table.insert(var_31_0, {
			fontSize = 20,
			type = "label",
			color = color_whi,
			halign = kCCTextAlignmentLeft,
			text = var_31_9
		})
	end

	if var_31_2.threshold and var_31_2.threshold > 0 then
		local var_31_10 = language.get(216125, var_31_2.threshold)

		table.insert(var_31_0, {
			fontSize = 20,
			type = "label",
			color = color_whi,
			halign = kCCTextAlignmentLeft,
			text = var_31_10
		})
	end

	if var_31_2.endurance and var_31_2.endurance > 0 then
		local var_31_11 = language.get(216126, var_31_2.endurance)

		table.insert(var_31_0, {
			fontSize = 20,
			type = "label",
			color = color_whi,
			halign = kCCTextAlignmentLeft,
			text = var_31_11
		})
	end

	local var_31_12 = ""

	for iter_31_2, iter_31_3 in pairs(var_31_1) do
		if iter_31_2 == 1 then
			var_31_12 = var_31_12 .. language.get(216127, iter_31_3)
		elseif iter_31_2 == 2 then
			var_31_12 = var_31_12 .. language.get(216128, iter_31_3)
		elseif iter_31_2 == 3 then
			var_31_12 = var_31_12 .. language.get(216129, iter_31_3)
		end
	end

	table.insert(var_31_0, {
		fontSize = 20,
		type = "label",
		color = colorQuality[3],
		halign = kCCTextAlignmentLeft,
		text = var_31_12
	})

	local var_31_13 = language.get(216131)

	if arg_31_1.generalId then
		if arg_31_1.generalId <= 0 then
			var_31_13 = language.get(216131)
		else
			var_31_13 = rmgr.getSData("general")[tostring(arg_31_1.generalId)].name
		end
	end

	table.insert(var_31_0, {
		fontSize = 20,
		type = "label",
		color = colorQuality[6],
		halign = kCCTextAlignmentLeft,
		text = language.get(216130, var_31_13)
	})

	return var_31_0
end

function var_0_1.chooseGeneralBtnHandel(arg_32_0)
	arg_32_0:closeTips()

	local function var_32_0(arg_33_0)
		local var_33_0 = arg_33_0.action.data

		arg_32_0.view.widgets.bg_list:setVisible(true)
		arg_32_0:createGeneralList(var_33_0.generalList)
	end

	cmgr.sendRequest(var_32_0, actions.chariotGetGenerals, arg_32_0.curChariot.id)
end

function var_0_1.createGeneralList(arg_34_0, arg_34_1)
	if arg_34_1 then
		local var_34_0 = arg_34_1

		local function var_34_1(arg_35_0, arg_35_1)
			log.info("cell touched at : ", arg_35_1:getIdx())

			local var_35_0 = var_34_0[arg_35_1:getIdx() + 1]
			local var_35_1 = 0
			local var_35_2 = var_35_0.generalId == arg_34_0.curChariot.generalId and 0 or var_35_0.generalId

			cmgr.sendRequest(function()
				cmgr.sendRequest(arg_34_0.chariotGetInfoHandlerRef, actions.chariotGetInfo, arg_34_0.curChariot.id)
			end, actions.chariotEquip, arg_34_0.curChariot.id, var_35_2)
			arg_34_0.view.widgets.bg_list:setVisible(false)

			if arg_34_0.candidateList then
				arg_34_0.candidateList:removeFromParentAndCleanup(true)

				arg_34_0.candidateList = nil
			end
		end

		local function var_34_2(arg_37_0, arg_37_1)
			return 105, 480
		end

		local function var_34_3(arg_38_0, arg_38_1)
			local var_38_0 = arg_38_0:dequeueCell()

			if var_38_0 then
				var_38_0:removeAllChildrenWithCleanup(true)
			else
				var_38_0 = CCTableViewCell:new()
			end

			local var_38_1 = var_34_0[arg_38_1 + 1]

			if var_38_1 then
				local var_38_2 = {}

				uiutil.initWidgets(var_38_2, arg_34_0.layout_cell_candidate)
				var_38_0:addChild(var_38_2.widgets.bg)

				local var_38_3 = rmgr.getSData("general")
				local var_38_4 = var_38_3[tostring(var_38_1.generalId)].name or ""
				local var_38_5 = var_38_3[tostring(var_38_1.generalId)].pic or ""

				var_38_2.widgets.weaponLv:setString(language.get(450001, var_38_1.generalLv))
				var_38_2.widgets.playerName:setString(var_38_4)
				var_38_2.widgets.icon:setDisplayFrame(CCSprite:create("res/ui/common/generalPic/generalPic_" .. var_38_5 .. ".jpg"):displayFrame())

				if var_38_1.generalId == arg_34_0.curChariot.generalId then
					var_38_2.widgets.clickInfo:setString(language.get(216145))
				else
					var_38_2.widgets.clickInfo:setString(language.get(136216))
				end
			end

			return var_38_0
		end

		local function var_34_4()
			if var_34_0 and #var_34_0 > 0 then
				return #var_34_0
			else
				return 0
			end
		end

		local var_34_5 = CCTableView:create(CCSizeMake(400, 540))

		var_34_5:setPosition(0, 10)
		var_34_5:setDirection(kCCScrollViewDirectionVertical)
		var_34_5:setVerticalFillOrder(kCCTableViewFillTopDown)
		arg_34_0.view.widgets.bg_list:addChild(var_34_5)

		if arg_34_0.candidateList then
			arg_34_0.candidateList:removeFromParentAndCleanup(true)

			arg_34_0.candidateList = nil
		end

		arg_34_0.candidateList = var_34_5

		var_34_5:registerScriptHandler(var_34_1, CCTableView.kTableCellTouched)
		var_34_5:registerScriptHandler(var_34_2, CCTableView.kTableCellSizeForIndex)
		var_34_5:registerScriptHandler(var_34_3, CCTableView.kTableCellSizeAtIndex)
		var_34_5:registerScriptHandler(var_34_4, CCTableView.kNumberOfCellsInTableView)
		var_34_5:reloadData()
	end
end

function var_0_1.chariotItemResert(arg_40_0)
	for iter_40_0 = 1, 4 do
		arg_40_0.view.widgets["carIcon" .. iter_40_0]:setVisible(false)
		arg_40_0.view.widgets["selectEffect" .. iter_40_0]:setVisible(false)
	end
end

function var_0_1.chariotBodyItemResert(arg_41_0)
	for iter_41_0 = 1, 4 do
		arg_41_0.view.widgets["cbEffect" .. iter_41_0]:setVisible(false)
		arg_41_0.view.widgets["cbMan" .. iter_41_0]:setVisible(false)
		arg_41_0.view.widgets["cbNum" .. iter_41_0]:setVisible(false)
		arg_41_0.view.widgets["line" .. iter_41_0]:setDisplayFrame(CCSprite:create("res/ui/weapon/catapult/btn/zc_line_" .. iter_41_0 .. ".png"):displayFrame())
	end
end

function var_0_1.chariotGetInfoHandler(arg_42_0, arg_42_1)
	arg_42_0:showPanel(arg_42_1.action.data)
end

function var_0_1.carNameBtnHandel(arg_43_0)
	if arg_43_0.curChariot then
		arg_43_0:showTip(arg_43_0:totalAttribute(arg_43_0.curChariot), arg_43_0.view.widgets.carNameBtn, ccp(115, -180))
	end
end

function var_0_1.skillNameBtnHandel(arg_44_0)
	if arg_44_0.curChariot and arg_44_0.curChariot.finalSkill then
		local var_44_0 = {}

		table.insert(var_44_0, {
			fontSize = 22,
			type = "label",
			color = colorQuality[1],
			halign = kCCTextAlignmentLeft,
			text = string.gsub(arg_44_0.curChariot.finalSkill.intro, "<br>", "\n")
		})

		if arg_44_0.curChariot.finalSkill.open == 0 then
			table.insert(var_44_0, {
				fontSize = 22,
				type = "label",
				color = colorQuality[1],
				halign = kCCTextAlignmentLeft,
				text = language.get(216132)
			})
		end

		arg_44_0:showTip(var_44_0, arg_44_0.view.widgets.carNameBtn, ccp(475, -10))
	end
end

function var_0_1.ytBgBtnHandel(arg_45_0)
	if arg_45_0.info and arg_45_0.info.meteoriteNum and arg_45_0.info.meteoriteNumMax then
		local var_45_0 = {}

		table.insert(var_45_0, {
			fontSize = 22,
			type = "label",
			color = colorQuality[1],
			halign = kCCTextAlignmentLeft,
			text = language.get(216137, arg_45_0.info.meteoriteNum, arg_45_0.info.meteoriteNumMax)
		})
		arg_45_0:showTip(var_45_0, arg_45_0.view.widgets.ytBgBtn, ccp(30, 30))
	end
end

function var_0_1.tzBgBtnHandel(arg_46_0)
	if arg_46_0.info and arg_46_0.info.blueprintNum and arg_46_0.info.blueprintNumMax then
		local var_46_0 = {}

		table.insert(var_46_0, {
			fontSize = 22,
			type = "label",
			color = colorQuality[1],
			halign = kCCTextAlignmentLeft,
			text = language.get(216138, arg_46_0.info.blueprintNum, arg_46_0.info.blueprintNumMax)
		})
		arg_46_0:showTip(var_46_0, arg_46_0.view.widgets.ytBgBtn, ccp(100, -45))
	end
end

function var_0_1.handlerParam(arg_47_0, arg_47_1, arg_47_2)
	return function(...)
		return arg_47_1(arg_47_0, arg_47_2, ...)
	end
end

function var_0_1.onEnter(arg_49_0)
	arg_49_0.skillNameBtnHandelRef = handler(arg_49_0, arg_49_0.skillNameBtnHandel)
	arg_49_0.chariotGetInfoHandlerRef = handler(arg_49_0, arg_49_0.chariotGetInfoHandler)
	arg_49_0.carNameBtnHandelRef = handler(arg_49_0, arg_49_0.carNameBtnHandel)
	arg_49_0.ytBgBtnHandelRef = handler(arg_49_0, arg_49_0.ytBgBtnHandel)
	arg_49_0.tzBgBtnHandelRef = handler(arg_49_0, arg_49_0.tzBgBtnHandel)
	arg_49_0.chooseGeneralBtnHandelRef = handler(arg_49_0, arg_49_0.chooseGeneralBtnHandel)

	cmgr.sendRequest(arg_49_0.chariotGetInfoHandlerRef, actions.chariotGetInfo, 0)
	arg_49_0.view.widgets.carNameBtn:addHandleOfControlEvent(arg_49_0.carNameBtnHandelRef, CCControlEventTouchUpInside)
	arg_49_0.view.widgets.skillNameBtn:addHandleOfControlEvent(arg_49_0.skillNameBtnHandelRef, CCControlEventTouchUpInside)
	arg_49_0.view.widgets.bigSkillBtn:addHandleOfControlEvent(arg_49_0.skillNameBtnHandelRef, CCControlEventTouchUpInside)
	arg_49_0.view.widgets.chariotItem1:addHandleOfControlEvent(var_0_1.handlerParam(arg_49_0, arg_49_0.chariotItemHandel, 1), CCControlEventTouchUpInside)
	arg_49_0.view.widgets.chariotItem2:addHandleOfControlEvent(var_0_1.handlerParam(arg_49_0, arg_49_0.chariotItemHandel, 2), CCControlEventTouchUpInside)
	arg_49_0.view.widgets.chariotItem3:addHandleOfControlEvent(var_0_1.handlerParam(arg_49_0, arg_49_0.chariotItemHandel, 3), CCControlEventTouchUpInside)
	arg_49_0.view.widgets.chariotItem4:addHandleOfControlEvent(var_0_1.handlerParam(arg_49_0, arg_49_0.chariotItemHandel, 4), CCControlEventTouchUpInside)
	arg_49_0.view.widgets.chariotBodyItem1:addHandleOfControlEvent(var_0_1.handlerParam(arg_49_0, arg_49_0.chariotBodyItemHandel, 1), CCControlEventTouchUpInside)
	arg_49_0.view.widgets.chariotBodyItem2:addHandleOfControlEvent(var_0_1.handlerParam(arg_49_0, arg_49_0.chariotBodyItemHandel, 2), CCControlEventTouchUpInside)
	arg_49_0.view.widgets.chariotBodyItem3:addHandleOfControlEvent(var_0_1.handlerParam(arg_49_0, arg_49_0.chariotBodyItemHandel, 3), CCControlEventTouchUpInside)
	arg_49_0.view.widgets.chariotBodyItem4:addHandleOfControlEvent(var_0_1.handlerParam(arg_49_0, arg_49_0.chariotBodyItemHandel, 4), CCControlEventTouchUpInside)
	arg_49_0.view.widgets.ytBgBtn:addHandleOfControlEvent(arg_49_0.ytBgBtnHandelRef, CCControlEventTouchUpInside)
	arg_49_0.view.widgets.tzBgBtn:addHandleOfControlEvent(arg_49_0.tzBgBtnHandelRef, CCControlEventTouchUpInside)
	arg_49_0.view.widgets.chooseGeneralBtn:addHandleOfControlEvent(arg_49_0.chooseGeneralBtnHandelRef, CCControlEventTouchUpInside)
	arg_49_0.view.widgets.btn_closeList:addHandleOfControlEvent(function()
		log.info("btn_closeList")
		arg_49_0.view.widgets.bg_list:setVisible(false)

		if arg_49_0.candidateList then
			arg_49_0.candidateList:removeFromParentAndCleanup(true)

			arg_49_0.candidateList = nil
		end
	end, CCControlEventTouchUpInside)
	arg_49_0.view.widgets.btn_lock:addHandleOfControlEvent(function()
		log.info("btn_lock")
		arg_49_0:showZhugeLock()
	end, CCControlEventTouchUpInside)

	for iter_49_0 = 1, 4 do
		arg_49_0.view.widgets["btn_sp" .. iter_49_0]:addHandleOfControlEvent(function()
			log.info("btn_sp" .. iter_49_0)
			log.info("btn_sp", arg_49_0.selectBodyId, iter_49_0)
			arg_49_0:onSuperForgeSp(arg_49_0.selectBodyId, iter_49_0)
		end, CCControlEventTouchUpInside)
	end

	arg_49_0.updateRef = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_49_0, arg_49_0.update), 0.5, false)
end

function var_0_1.onExit(arg_53_0)
	arg_53_0:closeTips()

	if arg_53_0.updateRef then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_53_0.updateRef)
	end
end

function var_0_1.closeTips(arg_54_0)
	if arg_54_0.mask then
		pcall(arg_54_0.mask.removeFromParentAndCleanup, arg_54_0.mask, true)

		arg_54_0.mask = nil
	end
end

function var_0_1.update(arg_55_0, arg_55_1)
	if arg_55_0.flyTb and #arg_55_0.flyTb > 0 then
		local var_55_0 = table.remove(arg_55_0.flyTb, 1)

		smgr.showTipTextGreen2(var_55_0)
	end

	if arg_55_0.info and arg_55_0.info.zhugeLockCD then
		if arg_55_0.info.zhugeLockCD > 0 then
			arg_55_0.info.zhugeLockCD = arg_55_0.info.zhugeLockCD - 1000 * arg_55_1
		elseif arg_55_0.info.zhugeLockCD <= 0 then
			arg_55_0.info.zhugeLockCD = 0
		end
	end
end

return var_0_1
