local var_0_0 = {
	y = 0,
	name = "Layer",
	type = "layer",
	x = 0,
	children = {
		{
			name = "bg",
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
					y = 476.7149,
					name = "hjcd_title",
					type = "sprite",
					x = 457.4996,
					pic = {
						path = "res/ui/activity/fishing/hjcd_title.png"
					}
				},
				{
					fontSize = 28,
					name = "leftTime",
					text = "剩余5天",
					type = "label",
					y = 467.7144,
					x = 661.1432,
					halign = kCCTextAlignmentLeft,
					valign = kCCVerticalTextAlignmentBottom
				},
				{
					y = 220.9991,
					name = "hjcd_bg",
					type = "sprite",
					x = 457.5,
					pic = {
						path = "res/ui/activity/fishing/hjcd_bg.jpg"
					},
					children = {
						{
							y = 0,
							name = "fishingLayer",
							type = "layer",
							x = 0,
							children = {
								{
									y = 411.5779,
									name = "hjcd_top_line",
									type = "sprite",
									x = 142,
									pic = {
										path = "res/ui/activity/fishing/hjcd_top_line.png"
									},
									children = {
										{
											y = 29.9997,
											name = "hjcd_fish_icon",
											type = "sprite",
											x = 33,
											pic = {
												path = "res/ui/activity/fishing/hjcd_fish_icon.png"
											}
										},
										{
											y = 29.9998,
											name = "leftTimes",
											x = 71,
											type = "node"
										}
									}
								},
								{
									y = 346.77,
									name = "hjcd_yulou",
									type = "sprite",
									x = 45.92,
									pic = {
										path = "res/ui/activity/fishing/hjcd_yulou.png"
									}
								},
								{
									name = "btnList",
									h = 43,
									type = "button",
									w = 89,
									y = 318.59,
									x = 47.53,
									normal = {
										path = "res/ui/activity/fishing/hjcd_yulou_list.png"
									},
									touched = {
										path = "res/ui/activity/fishing/hjcd_yulou_list.png"
									},
									children = {
										{
											y = 20.5886,
											name = "arrow",
											type = "sprite",
											x = 68.2355,
											pic = {
												path = "res/ui/activity/fishing/hjcd_yulou_list_arrows.png"
											}
										},
										{
											y = -145,
											name = "list",
											type = "sprite",
											x = 110,
											pic = {
												path = "res/ui/activity/fishing/hjcd_yulou_list_bg.png"
											},
											children = {
												{
													fontSize = 20,
													name = "listDesc",
													y = 270,
													type = "label",
													textId = 135952,
													style = "label_yellowish_24",
													x = 109.5,
													halign = kCCTextAlignmentLeft,
													valign = kCCVerticalTextAlignmentBottom
												},
												{
													y = 166,
													name = "Node_7_Copy_Copy",
													type = "node",
													x = 0,
													children = {
														{
															y = 44.294,
															name = "hjcd_yulou_list_line_Copy_Copy",
															type = "sprite",
															x = 141.6297,
															pic = {
																path = "res/ui/activity/fishing/hjcd_yulou_list_line.png"
															}
														},
														{
															y = 44.4299,
															name = "bq_icon_bg_Copy_Copy",
															type = "sprite",
															scaleX = 0.67,
															x = 44.7778,
															scaleY = 0.68,
															pic = {
																path = "res/ui/weapon/bq_icon_bg.png"
															}
														},
														{
															y = 44.5,
															name = "fish1",
															type = "sprite",
															x = 44.7778,
															pic = {
																path = "res/ui/activity/fishing/fish1.jpg"
															},
															children = {
																{
																	fontSize = 24,
																	name = "fishNum1",
																	type = "label",
																	text = "0",
																	y = 2,
																	x = 68,
																	halign = kCCTextAlignmentLeft,
																	valign = kCCVerticalTextAlignmentBottom,
																	anchorPoint = ccp(1, 0)
																}
															}
														},
														{
															fontSize = 20,
															name = "desc1",
															y = 30,
															type = "label",
															textId = 135959,
															style = "label_yellowish_24",
															x = 91,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom,
															anchorPoint = ccp(0, 0.5)
														},
														{
															fontSize = 20,
															name = "fishName1",
															y = 63,
															type = "label",
															textId = 135960,
															style = "label_yellowish_24",
															x = 91,
															color = colorQuality[6],
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom,
															anchorPoint = ccp(0, 0.5)
														}
													}
												},
												{
													y = 83,
													name = "Node_7_Copy",
													type = "node",
													x = 0,
													children = {
														{
															y = 44.294,
															name = "hjcd_yulou_list_line_Copy",
															type = "sprite",
															x = 141.6297,
															pic = {
																path = "res/ui/activity/fishing/hjcd_yulou_list_line.png"
															}
														},
														{
															y = 44.4299,
															name = "bq_icon_bg_Copy",
															type = "sprite",
															scaleX = 0.67,
															x = 44.7778,
															scaleY = 0.68,
															pic = {
																path = "res/ui/weapon/bq_icon_bg.png"
															}
														},
														{
															y = 44.5,
															name = "fish2",
															type = "sprite",
															x = 44.7778,
															pic = {
																path = "res/ui/activity/fishing/fish2.jpg"
															},
															children = {
																{
																	fontSize = 24,
																	name = "fishNum2",
																	type = "label",
																	text = "0",
																	y = 2,
																	x = 68,
																	halign = kCCTextAlignmentLeft,
																	valign = kCCVerticalTextAlignmentBottom,
																	anchorPoint = ccp(1, 0)
																}
															}
														},
														{
															fontSize = 20,
															name = "desc2",
															y = 30,
															type = "label",
															textId = 135961,
															style = "label_yellowish_24",
															x = 91,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom,
															anchorPoint = ccp(0, 0.5)
														},
														{
															fontSize = 20,
															name = "fishName2",
															y = 63,
															type = "label",
															textId = 135962,
															style = "label_yellowish_24",
															x = 91,
															color = colorQuality[5],
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom,
															anchorPoint = ccp(0, 0.5)
														}
													}
												},
												{
													y = 0,
													name = "Node_7",
													type = "node",
													x = 0,
													children = {
														{
															y = 44.294,
															name = "hjcd_yulou_list_line",
															type = "sprite",
															x = 141.6297,
															pic = {
																path = "res/ui/activity/fishing/hjcd_yulou_list_line.png"
															}
														},
														{
															y = 44.4299,
															name = "bq_icon_bg",
															type = "sprite",
															scaleX = 0.67,
															x = 44.7778,
															scaleY = 0.68,
															pic = {
																path = "res/ui/weapon/bq_icon_bg.png"
															}
														},
														{
															y = 44.5,
															name = "fish3",
															type = "sprite",
															x = 44.7778,
															pic = {
																path = "res/ui/activity/fishing/fish3.jpg"
															},
															children = {
																{
																	fontSize = 24,
																	name = "fishNum3",
																	type = "label",
																	text = "0",
																	y = 2,
																	x = 68,
																	halign = kCCTextAlignmentLeft,
																	valign = kCCVerticalTextAlignmentBottom,
																	anchorPoint = ccp(1, 0)
																}
															}
														},
														{
															fontSize = 20,
															name = "desc3",
															y = 30,
															type = "label",
															textId = 135963,
															style = "label_yellowish_24",
															x = 91,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom,
															anchorPoint = ccp(0, 0.5)
														},
														{
															fontSize = 20,
															name = "fishName3",
															y = 63,
															type = "label",
															textId = 135964,
															style = "label_yellowish_24",
															x = 91,
															color = colorQuality[3],
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom,
															anchorPoint = ccp(0, 0.5)
														}
													}
												}
											}
										},
										{
											fontSize = 20,
											name = "totleFishNum",
											text = "0",
											type = "label",
											y = 22.4283,
											x = 26.1427,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								},
								{
									y = 212.3471,
									name = "hjcd_bg_role",
									type = "sprite",
									x = 361.632,
									pic = {
										path = "res/ui/activity/fishing/hjcd_bg_role.png"
									}
								},
								{
									y = 292.566,
									name = "fishingProgress",
									type = "sprite",
									x = 463.2882,
									pic = {
										path = "res/ui/activity/fishing/hjcd_time_pb_line.png"
									},
									children = {
										{
											y = 11.6,
											name = "progress",
											type = "progressbar",
											x = 111.5,
											pic = {
												path = "res/ui/activity/fishing/hjcd_time_pb.png"
											}
										},
										{
											y = 53.4692,
											name = "hjcd_time_line",
											type = "sprite",
											x = 118.62,
											pic = {
												path = "res/ui/activity/fishing/hjcd_time_line.png"
											},
											children = {
												{
													y = 27.9998,
													name = "fishTime",
													x = 156.6665,
													type = "node"
												}
											}
										}
									}
								},
								{
									y = 153.7,
									name = "circle",
									type = "sprite",
									x = 459.28,
									pic = {
										path = "res/ui/activity/fishing/hjcd_bg_riffle.png"
									},
									children = {
										{
											y = 11.5,
											name = "hjcd_bg_riffle",
											type = "sprite",
											scaleX = 0.79,
											x = 33,
											scaleY = 0.65,
											pic = {
												path = "res/ui/activity/fishing/hjcd_bg_riffle.png"
											}
										}
									}
								},
								{
									name = "btnRewards",
									h = 62,
									type = "button",
									w = 195,
									y = 63.7501,
									x = 337.5001,
									normal = {
										path = "res/ui/common/button/public_btn_red.png"
									},
									touched = {
										path = "res/ui/common/button/public_btn_red_c.png"
									},
									children = {
										{
											fontSize = 20,
											name = "Text_42",
											y = 32.86,
											type = "label",
											textId = 135965,
											style = "label_yellowish_24",
											x = 97.5,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								},
								{
									name = "btnStart",
									h = 62,
									type = "button",
									w = 195,
									y = 115.8487,
									x = 454.5,
									normal = {
										path = "res/ui/common/button/public_btn_green.png"
									},
									touched = {
										path = "res/ui/common/button/public_btn_green_c.png"
									},
									children = {
										{
											fontSize = 20,
											name = "Text_40",
											y = 32.86,
											type = "label",
											textId = 135966,
											style = "label_yellowish_24",
											x = 97.5,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								},
								{
									name = "btnFishingNet",
									h = 62,
									type = "button",
									w = 195,
									y = 61.4043,
									x = 558.9458,
									normal = {
										path = "res/ui/common/button/public_btn_green.png"
									},
									touched = {
										path = "res/ui/common/button/public_btn_green_c.png"
									},
									children = {
										{
											fontSize = 20,
											name = "Text_40_Copy",
											y = 32.86,
											type = "label",
											textId = 135967,
											style = "label_yellowish_24",
											x = 97.5,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								},
								{
									type = "scrollview",
									name = "view",
									visible = false,
									y = 0,
									x = 0,
									viewSize = CCSizeMake(910, 437),
									children = {
										{
											y = 0,
											name = "Panel_3",
											type = "layer",
											x = 0,
											children = {
												{
													y = 0,
													name = "rightPanel",
													type = "layer",
													x = 910,
													children = {
														{
															y = 248,
															name = "rightPanelBg",
															type = "sprite",
															x = 185.7886,
															pic = {
																path = "res/ui/activity/fishing/hjcd_qd_view.png"
															},
															children = {
																{
																	y = 331.1713,
																	name = "hjcd_word_xlbwnnyy",
																	type = "sprite",
																	x = 204.1992,
																	pic = {
																		path = "res/ui/activity/fishing/hjcd_word_xlbwnnyy.png"
																	}
																},
																{
																	y = 148.6416,
																	name = "hjcd_time_line",
																	type = "sprite",
																	x = 209.9984,
																	pic = {
																		path = "res/ui/activity/fishing/hjcd_time_line.png"
																	},
																	children = {
																		{
																			fontSize = 24,
																			name = "needDays",
																			y = 29.0907,
																			type = "label",
																			text = "Text Label",
																			style = "label_yellowish_24",
																			x = 164.5442,
																			halign = kCCTextAlignmentLeft,
																			valign = kCCVerticalTextAlignmentBottom
																		}
																	}
																},
																{
																	y = 223.7505,
																	name = "hjcd_baowu_icon",
																	type = "sprite",
																	x = 206.2497,
																	pic = {
																		path = "res/ui/activity/fishing/hjcd_baowu_icon.png"
																	},
																	children = {
																		{
																			name = "yu",
																			h = 72,
																			type = "button",
																			w = 72,
																			y = 45.2951,
																			x = 41,
																			normal = {
																				path = "res/ui/activity/fishing/yu.png"
																			},
																			touched = {
																				path = "res/ui/activity/fishing/yu.png"
																			},
																			disable = {
																				path = "res/ui/activity/fishing/yu.png"
																			},
																			pic = {
																				path = "res/ui/activity/fishing/yu.png"
																			}
																		}
																	}
																},
																{
																	y = 0,
																	name = "signInLayer",
																	type = "layer",
																	x = 0,
																	children = {
																		{
																			name = "signIn1",
																			h = 89,
																			type = "button",
																			w = 64,
																			y = 58.8891,
																			x = 67.7762,
																			normal = {
																				path = "res/ui/activity/fishing/hjcd_qd_01.png"
																			},
																			touched = {
																				path = "res/ui/activity/fishing/hjcd_qd_01.png"
																			},
																			disable = {
																				path = "res/ui/activity/fishing/hjcd_qd_02.png"
																			},
																			children = {
																				{
																					y = 36.8747,
																					name = "image1",
																					type = "sprite",
																					x = 33.1247,
																					pic = {
																						path = "res/ui/activity/fishing/hjcd_qd_seal.png"
																					}
																				}
																			}
																		},
																		{
																			name = "signIn2",
																			h = 89,
																			type = "button",
																			w = 64,
																			y = 58.8891,
																			x = 136.4309,
																			normal = {
																				path = "res/ui/activity/fishing/hjcd_qd_01.png"
																			},
																			touched = {
																				path = "res/ui/activity/fishing/hjcd_qd_01.png"
																			},
																			disable = {
																				path = "res/ui/activity/fishing/hjcd_qd_02.png"
																			},
																			children = {
																				{
																					y = 36.8747,
																					name = "image2",
																					type = "sprite",
																					x = 33.1247,
																					pic = {
																						path = "res/ui/activity/fishing/hjcd_qd_seal.png"
																					}
																				}
																			}
																		},
																		{
																			name = "signIn3",
																			h = 89,
																			type = "button",
																			w = 64,
																			y = 58.8891,
																			x = 205.0857,
																			normal = {
																				path = "res/ui/activity/fishing/hjcd_qd_01.png"
																			},
																			touched = {
																				path = "res/ui/activity/fishing/hjcd_qd_01.png"
																			},
																			disable = {
																				path = "res/ui/activity/fishing/hjcd_qd_02.png"
																			},
																			children = {
																				{
																					y = 36.8747,
																					name = "image3",
																					type = "sprite",
																					x = 33.1247,
																					pic = {
																						path = "res/ui/activity/fishing/hjcd_qd_seal.png"
																					}
																				}
																			}
																		},
																		{
																			name = "signIn4",
																			h = 89,
																			type = "button",
																			w = 64,
																			y = 58.8891,
																			x = 273.7405,
																			normal = {
																				path = "res/ui/activity/fishing/hjcd_qd_01.png"
																			},
																			touched = {
																				path = "res/ui/activity/fishing/hjcd_qd_01.png"
																			},
																			disable = {
																				path = "res/ui/activity/fishing/hjcd_qd_02.png"
																			},
																			children = {
																				{
																					y = 36.8747,
																					name = "image4",
																					type = "sprite",
																					x = 33.1247,
																					pic = {
																						path = "res/ui/activity/fishing/hjcd_qd_seal.png"
																					}
																				}
																			}
																		},
																		{
																			name = "signIn5",
																			h = 89,
																			type = "button",
																			w = 64,
																			y = 58.8891,
																			x = 342.3952,
																			normal = {
																				path = "res/ui/activity/fishing/hjcd_qd_01.png"
																			},
																			touched = {
																				path = "res/ui/activity/fishing/hjcd_qd_01.png"
																			},
																			disable = {
																				path = "res/ui/activity/fishing/hjcd_qd_02.png"
																			},
																			children = {
																				{
																					y = 36.8747,
																					name = "image5",
																					type = "sprite",
																					x = 33.1247,
																					pic = {
																						path = "res/ui/activity/fishing/hjcd_qd_seal.png"
																					}
																				}
																			}
																		}
																	}
																},
																{
																	name = "btnGetBaoWu",
																	h = 62,
																	type = "button",
																	w = 195,
																	y = 53.75,
																	x = 204.9999,
																	normal = {
																		path = "res/ui/common/button/public_btn_red.png"
																	},
																	touched = {
																		path = "res/ui/common/button/public_btn_red_c.png"
																	},
																	children = {
																		{
																			fontSize = 20,
																			name = "TextGetBaoWu",
																			text = "Text Label",
																			type = "label",
																			y = 35,
																			x = 96.2471,
																			halign = kCCTextAlignmentLeft,
																			valign = kCCVerticalTextAlignmentBottom
																		}
																	}
																}
															}
														},
														{
															w = 75,
															name = "btnCheck",
															h = 75,
															type = "button",
															y = 247.61,
															x = -37,
															normal = {
																path = "res/ui/activity/fishing/hjcd_qd_arrows.png"
															},
															touched = {
																path = "res/ui/activity/fishing/hjcd_qd_arrows.png"
															}
														}
													}
												}
											}
										}
									}
								},
								{
									y = 258.4982,
									name = "netRewards",
									type = "sprite",
									x = 449.4906,
									pic = {
										path = "res/ui/messagebox/atten_view_bg.png"
									},
									children = {
										{
											y = 182.9773,
											name = "hjcd_baowu_icon",
											type = "sprite",
											x = 130.7397,
											pic = {
												path = "res/ui/activity/fishing/hjcd_baowu_icon.png"
											},
											children = {
												{
													y = 44.5,
													name = "fish2_Copy",
													type = "sprite",
													x = 40.988,
													pic = {
														path = "res/ui/activity/fishing/fish1.jpg"
													}
												},
												{
													fontSize = 28,
													name = "getFishNum1",
													type = "label",
													text = "0",
													y = 10,
													x = 74,
													halign = kCCTextAlignmentLeft,
													valign = kCCVerticalTextAlignmentBottom,
													anchorPoint = ccp(1, 0)
												}
											}
										},
										{
											y = 182.0677,
											name = "hjcd_baowu_icon_Copy",
											type = "sprite",
											x = 259.3745,
											pic = {
												path = "res/ui/activity/fishing/hjcd_baowu_icon.png"
											},
											children = {
												{
													y = 44.5,
													name = "fish2_Copy",
													type = "sprite",
													x = 40.988,
													pic = {
														path = "res/ui/activity/fishing/fish2.jpg"
													}
												},
												{
													fontSize = 28,
													name = "getFishNum2",
													type = "label",
													text = "0",
													y = 10,
													x = 74,
													halign = kCCTextAlignmentLeft,
													valign = kCCVerticalTextAlignmentBottom,
													anchorPoint = ccp(1, 0)
												}
											}
										},
										{
											y = 183.8856,
											name = "hjcd_baowu_icon_Copy_0",
											type = "sprite",
											x = 388.0089,
											pic = {
												path = "res/ui/activity/fishing/hjcd_baowu_icon.png"
											},
											children = {
												{
													y = 44.5,
													name = "fish2_Copy",
													type = "sprite",
													x = 40.988,
													pic = {
														path = "res/ui/activity/fishing/fish3.jpg"
													}
												},
												{
													fontSize = 28,
													name = "getFishNum3",
													type = "label",
													text = "0",
													y = 10,
													x = 74,
													halign = kCCTextAlignmentLeft,
													valign = kCCVerticalTextAlignmentBottom,
													anchorPoint = ccp(1, 0)
												}
											}
										},
										{
											name = "btnComment",
											h = 56,
											type = "button",
											w = 189,
											y = 48.8687,
											x = 260,
											normal = {
												path = "res/ui/common/button/sdyjs_btn_04.png"
											},
											touched = {
												path = "res/ui/common/button/sdyjs_btn_04_c.png"
											},
											disable = {
												path = "res/ui/common/button/sdyjs_btn_04_g.png"
											},
											children = {
												{
													fontSize = 20,
													name = "Text_36",
													y = 32.7271,
													type = "label",
													textId = 135968,
													style = "label_yellowish_24",
													x = 95,
													halign = kCCTextAlignmentLeft,
													valign = kCCVerticalTextAlignmentBottom
												}
											}
										},
										{
											y = 297.9732,
											name = "hjcd_title_ywbh",
											type = "sprite",
											x = 255.464,
											pic = {
												path = "res/ui/activity/fishing/hjcd_title_ywbh.png"
											}
										}
									}
								}
							}
						},
						{
							height = 437,
							name = "rewardLayer",
							x = 0,
							type = "layerColor",
							y = 0,
							width = 909,
							color = ccc4(20, 20, 20, 242),
							children = {
								{
									y = 217.71,
									name = "change1",
									type = "sprite",
									x = 155,
									pic = {
										path = "res/ui/activity/fishing/hjcd_dh_view.png"
									},
									children = {
										{
											y = 0,
											name = "front1",
											type = "layer",
											x = 0,
											children = {
												{
													y = 263.8219,
													name = "hjcd_jg",
													type = "sprite",
													x = 132.3459,
													pic = {
														path = "res/ui/activity/fishing/hjcd_jg.jpg"
													}
												},
												{
													y = 116.0499,
													name = "hjcd_baowu_icon",
													type = "sprite",
													x = 54.3775,
													pic = {
														path = "res/ui/activity/fishing/hjcd_baowu_icon.png"
													},
													children = {
														{
															y = 44.5349,
															name = "fish1",
															type = "sprite",
															x = 41.2436,
															pic = {
																path = "res/ui/activity/fishing/fish1.jpg"
															}
														}
													}
												},
												{
													fontSize = 20,
													name = "jinli",
													y = 138.5825,
													type = "label",
													textId = 135960,
													style = "label_yellowish_24",
													x = 110.9167,
													color = colorQuality[6],
													halign = kCCTextAlignmentLeft,
													valign = kCCVerticalTextAlignmentBottom,
													anchorPoint = ccp(0, 0.5)
												},
												{
													fontSize = 28,
													name = "hasFishNum1",
													type = "label",
													text = "0",
													y = 96.666,
													x = 110.9167,
													halign = kCCTextAlignmentLeft,
													valign = kCCVerticalTextAlignmentBottom,
													anchorPoint = ccp(0, 0.5)
												},
												{
													y = 387.24,
													name = "hjcd_word_jgzg",
													type = "sprite",
													x = 132,
													pic = {
														path = "res/ui/activity/fishing/hjcd_word_jgzg.png"
													}
												},
												{
													name = "btnChange1",
													h = 75,
													type = "button",
													w = 258,
													y = 39.33,
													x = 132.22,
													normal = {
														frame = true,
														path = "btn4_gre_a.png"
													},
													touched = {
														frame = true,
														path = "btn4_gre_c.png"
													},
													disable = {
														frame = true,
														path = "btn4_gre_g.png"
													},
													children = {
														{
															fontSize = 20,
															name = "Text_55",
															y = 37.5,
															type = "label",
															textId = 135969,
															style = "label_yellowish_24",
															x = 129,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom
														}
													}
												}
											}
										},
										{
											y = 0,
											name = "back1",
											visible = false,
											type = "layer",
											x = 0,
											children = {
												{
													y = 264.3595,
													name = "hjcd_box_03",
													type = "sprite",
													x = 132.1257,
													pic = {
														path = "res/ui/activity/fishing/hjcd_box_03.jpg"
													},
													children = {
														{
															fontSize = 36,
															name = "boxNum1",
															type = "label",
															text = "0",
															y = 7,
															x = 237,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom,
															anchorPoint = ccp(1, 0)
														}
													}
												},
												{
													y = 387.24,
													name = "hjcd_word_jbx",
													type = "sprite",
													x = 132,
													pic = {
														path = "res/ui/activity/fishing/hjcd_word_jbx.png"
													}
												},
												{
													name = "btnTwo",
													h = 75,
													type = "button",
													w = 258,
													y = 44.33,
													x = 132.22,
													normal = {
														frame = true,
														path = "btn4_gre_a.png"
													},
													touched = {
														frame = true,
														path = "btn4_gre_c.png"
													},
													disable = {
														frame = true,
														path = "btn4_gre_g.png"
													},
													children = {
														{
															fontSize = 20,
															name = "Text_45",
															y = 37.5,
															type = "label",
															textId = 135970,
															style = "label_yellowish_24",
															x = 129,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom
														}
													}
												},
												{
													name = "btnFive",
													h = 75,
													type = "button",
													w = 258,
													y = 121.33,
													x = 132.22,
													normal = {
														frame = true,
														path = "btn4_yel_a.png"
													},
													touched = {
														frame = true,
														path = "btn4_yel_c.png"
													},
													disable = {
														frame = true,
														path = "btn4_gre_g.png"
													},
													children = {
														{
															fontSize = 20,
															name = "Text_46",
															y = 37.5,
															type = "label",
															textId = 135971,
															style = "label_yellowish_24",
															x = 129,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom
														}
													}
												}
											}
										}
									}
								},
								{
									y = 217.71,
									name = "change2",
									type = "sprite",
									x = 453.4999,
									pic = {
										path = "res/ui/activity/fishing/hjcd_dh_view.png"
									},
									children = {
										{
											y = 0,
											name = "front2",
											type = "layer",
											x = 0,
											children = {
												{
													y = 263.8219,
													name = "hjcd_jg_Copy",
													type = "sprite",
													x = 132.3459,
													pic = {
														path = "res/ui/activity/fishing/hjcd_kz.jpg"
													}
												},
												{
													y = 116.0499,
													name = "hjcd_baowu_icon_Copy",
													type = "sprite",
													x = 54.3775,
													pic = {
														path = "res/ui/activity/fishing/hjcd_baowu_icon.png"
													},
													children = {
														{
															y = 44.5349,
															name = "fish1_Copy",
															type = "sprite",
															x = 41.2436,
															pic = {
																path = "res/ui/activity/fishing/fish2.jpg"
															}
														}
													}
												},
												{
													fontSize = 20,
													name = "jinli_Copy",
													y = 138.5825,
													type = "label",
													textId = 135962,
													style = "label_yellowish_24",
													x = 110.9167,
													color = colorQuality[5],
													halign = kCCTextAlignmentLeft,
													valign = kCCVerticalTextAlignmentBottom,
													anchorPoint = ccp(0, 0.5)
												},
												{
													fontSize = 28,
													name = "hasFishNum2",
													type = "label",
													text = "0",
													y = 96.666,
													x = 110.9167,
													halign = kCCTextAlignmentLeft,
													valign = kCCVerticalTextAlignmentBottom,
													anchorPoint = ccp(0, 0.5)
												},
												{
													y = 387.24,
													name = "hjcd_word_jgzg_Copy",
													type = "sprite",
													x = 132,
													pic = {
														path = "res/ui/activity/fishing/hjcd_word_kzhy.png"
													}
												},
												{
													name = "btnChange2",
													h = 75,
													type = "button",
													w = 258,
													y = 39.33,
													x = 132.22,
													normal = {
														frame = true,
														path = "btn4_gre_a.png"
													},
													touched = {
														frame = true,
														path = "btn4_gre_c.png"
													},
													disable = {
														frame = true,
														path = "btn4_gre_g.png"
													},
													children = {
														{
															fontSize = 20,
															name = "Text_55_Copy",
															y = 37.5,
															type = "label",
															textId = 135972,
															style = "label_yellowish_24",
															x = 129,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom
														}
													}
												}
											}
										},
										{
											y = 0,
											name = "back2",
											visible = false,
											type = "layer",
											x = 0,
											children = {
												{
													y = 264.3595,
													name = "hjcd_box_03_Copy",
													type = "sprite",
													x = 132.1257,
													pic = {
														path = "res/ui/activity/fishing/hjcd_box_02.jpg"
													},
													children = {
														{
															fontSize = 36,
															name = "boxNum2",
															type = "label",
															text = "0",
															y = 7,
															x = 237,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom,
															anchorPoint = ccp(1, 0)
														}
													}
												},
												{
													y = 387.24,
													name = "hjcd_word_jbx_Copy",
													type = "sprite",
													x = 132,
													pic = {
														path = "res/ui/activity/fishing/hjcd_word_ybx.png"
													}
												},
												{
													name = "btnGet2",
													h = 75,
													type = "button",
													w = 258,
													y = 44.33,
													x = 132.22,
													normal = {
														frame = true,
														path = "btn4_gre_a.png"
													},
													touched = {
														frame = true,
														path = "btn4_gre_c.png"
													},
													disable = {
														frame = true,
														path = "btn4_gre_g.png"
													},
													children = {
														{
															fontSize = 20,
															name = "Text_45_Copy",
															y = 37.5,
															type = "label",
															textId = 135973,
															style = "label_yellowish_24",
															x = 129,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom
														}
													}
												},
												{
													fontSize = 20,
													name = "Text_66",
													y = 150.5556,
													type = "label",
													textId = 135974,
													style = "label_yellowish_24",
													x = 20.0003,
													halign = kCCTextAlignmentLeft,
													valign = kCCVerticalTextAlignmentBottom,
													anchorPoint = ccp(0, 1)
												}
											}
										}
									}
								},
								{
									y = 217.71,
									name = "change3",
									type = "sprite",
									x = 751.9999,
									pic = {
										path = "res/ui/activity/fishing/hjcd_dh_view.png"
									},
									children = {
										{
											y = 0,
											name = "front3",
											type = "layer",
											x = 0,
											children = {
												{
													y = 263.8219,
													name = "hjcd_jg_Copy",
													type = "sprite",
													x = 132.3459,
													pic = {
														path = "res/ui/activity/fishing/hjcd_jy.jpg"
													}
												},
												{
													y = 116.0499,
													name = "hjcd_baowu_icon_Copy",
													type = "sprite",
													x = 54.3775,
													pic = {
														path = "res/ui/activity/fishing/hjcd_baowu_icon.png"
													},
													children = {
														{
															y = 44.5349,
															name = "fish1_Copy",
															type = "sprite",
															x = 41.2436,
															pic = {
																path = "res/ui/activity/fishing/fish3.jpg"
															}
														}
													}
												},
												{
													fontSize = 20,
													name = "jinli_Copy",
													y = 138.5825,
													type = "label",
													textId = 135964,
													style = "label_yellowish_24",
													x = 110.9167,
													color = colorQuality[3],
													halign = kCCTextAlignmentLeft,
													valign = kCCVerticalTextAlignmentBottom,
													anchorPoint = ccp(0, 0.5)
												},
												{
													fontSize = 28,
													name = "hasFishNum3",
													type = "label",
													text = "0",
													y = 96.666,
													x = 110.9167,
													halign = kCCTextAlignmentLeft,
													valign = kCCVerticalTextAlignmentBottom,
													anchorPoint = ccp(0, 0.5)
												},
												{
													y = 387.24,
													name = "hjcd_word_jgzg_Copy",
													type = "sprite",
													x = 132,
													pic = {
														path = "res/ui/activity/fishing/hjcd_word_ypjy.png"
													}
												},
												{
													name = "btnChange3",
													h = 75,
													type = "button",
													w = 258,
													y = 39.33,
													x = 132.22,
													normal = {
														frame = true,
														path = "btn4_gre_a.png"
													},
													touched = {
														frame = true,
														path = "btn4_gre_c.png"
													},
													disable = {
														frame = true,
														path = "btn4_gre_g.png"
													},
													children = {
														{
															fontSize = 20,
															name = "Text_55_Copy",
															y = 37.5,
															type = "label",
															textId = 135975,
															style = "label_yellowish_24",
															x = 129,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom
														}
													}
												}
											}
										},
										{
											y = 0,
											name = "back3",
											visible = false,
											type = "layer",
											x = 0,
											children = {
												{
													y = 264.3595,
													name = "hjcd_box_03_Copy",
													type = "sprite",
													x = 132.1257,
													pic = {
														path = "res/ui/activity/fishing/hjcd_box_01.jpg"
													},
													children = {
														{
															fontSize = 36,
															name = "boxNum3",
															type = "label",
															text = "0",
															y = 7,
															x = 237,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom,
															anchorPoint = ccp(1, 0)
														}
													}
												},
												{
													y = 387.24,
													name = "hjcd_word_jbx_Copy",
													type = "sprite",
													x = 132,
													pic = {
														path = "res/ui/activity/fishing/hjcd_word_tbx.png"
													}
												},
												{
													fontSize = 20,
													name = "Text_66_Copy",
													y = 150.56,
													type = "label",
													textId = 135976,
													style = "label_yellowish_24",
													x = 20,
													halign = kCCTextAlignmentLeft,
													valign = kCCVerticalTextAlignmentBottom,
													anchorPoint = ccp(0, 1)
												},
												{
													name = "btnGet3",
													h = 75,
													type = "button",
													w = 258,
													y = 44.33,
													x = 132.22,
													normal = {
														frame = true,
														path = "btn4_gre_a.png"
													},
													touched = {
														frame = true,
														path = "btn4_gre_c.png"
													},
													disable = {
														frame = true,
														path = "btn4_gre_g.png"
													},
													children = {
														{
															fontSize = 20,
															name = "Text_45_Copy",
															y = 37.5,
															type = "label",
															textId = 135973,
															style = "label_yellowish_24",
															x = 129,
															halign = kCCTextAlignmentLeft,
															valign = kCCVerticalTextAlignmentBottom
														}
													}
												}
											}
										}
									}
								},
								{
									name = "btnBack",
									h = 54,
									type = "button",
									w = 173,
									y = 471.6659,
									x = 808.3324,
									normal = {
										path = "res/ui/activity/fishing/hjcd_fhdy_line.png"
									},
									touched = {
										path = "res/ui/activity/fishing/hjcd_fhdy_line.png"
									},
									children = {
										{
											y = 33.3328,
											name = "hjcd_fish_icon",
											type = "sprite",
											x = 19.1667,
											pic = {
												path = "res/ui/activity/fishing/hjcd_fish_icon.png"
											}
										},
										{
											fontSize = 24,
											name = "Text_68",
											y = 29.9989,
											type = "label",
											textId = 135977,
											style = "label_yellowish_24",
											x = 91.6667,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								}
							}
						}
					}
				},
				{
					y = 441.29,
					name = "Sprite_52",
					type = "sprite",
					x = 457.5,
					pic = {
						path = "res/ui/activity/sevenCatch/qtmh_up_line.png"
					}
				}
			}
		}
	}
}
local var_0_1 = 1
local var_0_2 = 1
local var_0_3 = 0.2
local var_0_4 = class("Fishing", function()
	return createBaseLayer()
end)

function var_0_4.ctor(arg_2_0, arg_2_1)
	arg_2_0:init(arg_2_1)
end

function var_0_4.init(arg_3_0, arg_3_1)
	arg_3_0._fistShow = true
	arg_3_0._layoutNode = LayoutNode.new()

	arg_3_0:addChild(arg_3_0._layoutNode)
	arg_3_0._layoutNode:setLoadFunc(handler(arg_3_0, arg_3_0.initLayout))
	arg_3_0._layoutNode:reload(var_0_0)
	arg_3_0:refreshPanel(arg_3_1)
end

function var_0_4.initLayout(arg_4_0, ...)
	arg_4_0._layoutNode:getWidget("view"):setTouchEnabled(false)
	arg_4_0._layoutNode:getWidget("arrow"):setFlipY(false)
	arg_4_0._layoutNode:getWidget("list"):setVisible(false)

	local var_4_0 = CCArray:create()

	var_4_0:addObject(CCSpawn:createWithTwoActions(CCScaleTo:create(0.7, 1.5), CCFadeOut:create(1)))
	var_4_0:addObject(CCScaleTo:create(0, 1))
	var_4_0:addObject(CCDelayTime:create(1))
	var_4_0:addObject(CCFadeIn:create(0.1))
	arg_4_0._layoutNode:getWidget("circle"):setCascadeOpacityEnabled(true)
	arg_4_0._layoutNode:getWidget("circle"):runAction(CCRepeatForever:create(CCSequence:create(var_4_0)))
	arg_4_0._layoutNode:getWidget("netRewards"):setVisible(false)
	arg_4_0._layoutNode:getWidget("netRewards"):setTouchEnabled(true)
	arg_4_0._layoutNode:getWidget("netRewards"):registerScriptTouchHandler(handler(arg_4_0, arg_4_0.onNetRewardsLayerTouched), false, true)

	local var_4_1 = CCStrokeLabelTTF:create(language.get(135951), "Thonburi-Bold", 22, 1)

	var_4_1:setColor(colorText[10002])

	local var_4_2 = CCStrokeLabelTTF:create("0", "Thonburi-Bold", 22, 1)

	var_4_2:setColor(ccc3(114, 223, 55))
	arg_4_0._layoutNode:getWidget("leftTimes"):addChild(createRichNode({
		var_4_1,
		var_4_2
	}))

	arg_4_0._leftFishingNumLabel = var_4_2

	local var_4_3 = CCStrokeLabelTTF:create(language.get(135954), "Thonburi-Bold", 22, 1)

	var_4_3:setColor(colorText[10002])

	local var_4_4 = TimerLabelClass.new({
		fontSize = 22,
		font = "Thonburi-Bold",
		time = 0,
		labelType = "LabelStroke",
		strokeSize = 1,
		format = "@M:@S"
	})

	var_4_4:setColor(ccc3(114, 223, 55))
	arg_4_0._layoutNode:getWidget("fishTime"):addChild(createRichNode({
		var_4_3,
		var_4_4
	}, 0.5))

	arg_4_0._fishingTimer = var_4_4
	arg_4_0._isRightPanelShow = false

	arg_4_0._layoutNode:getWidget("rewardLayer"):setVisible(false)
	arg_4_0._layoutNode:getWidget("rewardLayer"):setTouchEnabled(true)
	arg_4_0._layoutNode:getWidget("rewardLayer"):registerScriptTouchHandler(handler(arg_4_0, arg_4_0.onRewardLayerTouched), false, true)
	arg_4_0._layoutNode:getWidget("rightPanelBg"):setTouchEnabled(true)
	arg_4_0._layoutNode:getWidget("rightPanelBg"):registerScriptTouchHandler(handler(arg_4_0, arg_4_0.onRightPanelBgTouched), false, true)
	arg_4_0._layoutNode:getWidget("btnList"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.changeListState), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("btnBack"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.backToFishLayer), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("btnRewards"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.goToRewardLayer), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("btnStart"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.onButtonStartClicked), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("btnFishingNet"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.onButtonFishingNetClicked), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("btnCheck"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.onButtonCheckClicked), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("btnTwo"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.onButtonTwoClicked), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("btnFive"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.onButtonFiveClicked), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("btnChange1"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.onButtonChange1Clicked), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("btnChange2"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.onButtonChange2Clicked), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("btnChange3"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.onButtonChange3Clicked), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("btnGet2"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.onButtonGet2Clicked), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("btnGet3"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.onButtonGet3Clicked), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("btnComment"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.onButtonCommentClicked), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("btnGetBaoWu"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.onButtonGetBaoWuClicked), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("btn_tip"):addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_4_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("yu"):addHandleOfControlEvent(function()
		log.info("yu_tip")
		arg_4_0:showYuTip()
	end, CCControlEventTouchUpInside)

	if conf.language == "tw" then
		arg_4_0._layoutNode:getWidget("rightPanel"):setVisible(false)
	end
end

function var_0_4.showTip(arg_7_0)
	log.info("should show tips ")

	local var_7_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_7_0:registerScriptTouchHandler(function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == CCTOUCHBEGAN then
			return true
		elseif arg_8_0 == CCTOUCHMOVED then
			return true
		elseif arg_8_0 == CCTOUCHENDED then
			pcall(var_7_0.removeFromParentAndCleanup, var_7_0, true)

			return true
		end
	end, false, true)
	var_7_0:setTouchEnabled(true)
	arg_7_0:addChild(var_7_0, 60000)

	local var_7_1 = 0
	local var_7_2 = 0
	local var_7_3 = {
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
				textId = 135986,
				style = "label_warlock",
				width = 400,
				anchorPoint = ccp(0, 0),
				halign = kCCTextAlignmentLeft,
				color = color_whi
			}
		}
	}
	local var_7_4 = {}

	uiutil.initWidgets(var_7_4, var_7_3)
	var_7_0:addChild(var_7_4.widgets.tipFrame)

	local var_7_5, var_7_6 = tool.getPositionInScreen(arg_7_0._layoutNode:getWidget("btn_tip"))
	local var_7_7 = var_7_5 + 20
	local var_7_8 = var_7_6 - 20
	local var_7_9 = var_7_4.widgets.tipMsg:getContentSize().width
	local var_7_10 = var_7_4.widgets.tipMsg:getContentSize().height

	var_7_4.widgets.tipFrame:setPreferredSize(CCSizeMake(var_7_9 + 30, var_7_10 + 30))
	var_7_4.widgets.tipFrame:setPosition(ccp(var_7_7, var_7_8))
	var_7_4.widgets.tipMsg:setPosition(ccp(15, 15))
	var_7_4.widgets.tipFrame:setVisible(true)
end

function var_0_4.showYuTip(arg_9_0)
	log.info("should show tips ")

	local var_9_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_9_0:registerScriptTouchHandler(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == CCTOUCHBEGAN then
			return true
		elseif arg_10_0 == CCTOUCHMOVED then
			return true
		elseif arg_10_0 == CCTOUCHENDED then
			pcall(var_9_0.removeFromParentAndCleanup, var_9_0, true)

			return true
		end
	end, false, true)
	var_9_0:setTouchEnabled(true)
	arg_9_0:addChild(var_9_0, 60000)

	local var_9_1 = 0
	local var_9_2 = 0
	local var_9_3 = {
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
				textId = 135985,
				style = "label_warlock",
				width = 0,
				anchorPoint = ccp(0, 0),
				halign = kCCTextAlignmentLeft,
				color = color_whi
			}
		}
	}
	local var_9_4 = {}

	uiutil.initWidgets(var_9_4, var_9_3)
	var_9_0:addChild(var_9_4.widgets.tipFrame)

	local var_9_5, var_9_6 = tool.getPositionInScreen(arg_9_0._layoutNode:getWidget("yu"))
	local var_9_7 = var_9_5 + 20
	local var_9_8 = var_9_6 - 20
	local var_9_9 = var_9_4.widgets.tipMsg:getContentSize().width
	local var_9_10 = var_9_4.widgets.tipMsg:getContentSize().height

	var_9_4.widgets.tipFrame:setPreferredSize(CCSizeMake(var_9_9 + 30, var_9_10 + 30))
	var_9_4.widgets.tipFrame:setPosition(ccp(var_9_7, var_9_8))
	var_9_4.widgets.tipMsg:setPosition(ccp(15, 15))
	var_9_4.widgets.tipFrame:setVisible(true)
end

function var_0_4.changeListState(arg_11_0)
	if arg_11_0._layoutNode:getWidget("arrow"):isFlipY() then
		arg_11_0._layoutNode:getWidget("arrow"):setFlipY(false)
		arg_11_0._layoutNode:getWidget("list"):setVisible(false)
	else
		arg_11_0._layoutNode:getWidget("arrow"):setFlipY(true)
		arg_11_0._layoutNode:getWidget("list"):setVisible(true)
	end
end

function var_0_4.backToFishLayer(arg_12_0)
	arg_12_0._layoutNode:getWidget("rewardLayer"):setVisible(false)
end

function var_0_4.goToRewardLayer(arg_13_0, ...)
	arg_13_0._layoutNode:getWidget("rewardLayer"):setVisible(true)
	arg_13_0._layoutNode:getWidget("rewardLayer"):setOpacity(0)

	local var_13_0 = arg_13_0._layoutNode:getWidget("rewardLayer"):getChildren()

	for iter_13_0 = 0, var_13_0:count() - 1 do
		var_13_0:objectAtIndex(iter_13_0):setVisible(false)
	end

	local var_13_1 = CCArray:create()

	var_13_1:addObject(CCFadeIn:create(0.2))

	for iter_13_1 = 0, var_13_0:count() - 1 do
		var_13_1:addObject(CCTargetedAction:create(var_13_0:objectAtIndex(iter_13_1), CCShow:create()))
	end

	arg_13_0._layoutNode:getWidget("rewardLayer"):runAction(CCSequence:create(var_13_1))
end

function var_0_4.refreshPanel(arg_14_0, arg_14_1)
	if arg_14_1 then
		arg_14_0._data = arg_14_1

		local var_14_0 = 1

		if arg_14_0._data.status == 0 then
			arg_14_0._layoutNode:getWidget("signInLayer"):setVisible(true)
			arg_14_0._layoutNode:getWidget("btnGetBaoWu"):setVisible(false)
			arg_14_0._layoutNode:getWidget("needDays"):setString(language.get(135953, arg_14_1.needDays))
		elseif arg_14_0._data.status == 1 then
			arg_14_0._layoutNode:getWidget("signInLayer"):setVisible(false)
			arg_14_0._layoutNode:getWidget("btnGetBaoWu"):setVisible(true)
			arg_14_0._layoutNode:getWidget("TextGetBaoWu"):setString(language.get(135979))
			arg_14_0._layoutNode:getWidget("needDays"):setString(language.get(135980))
		elseif arg_14_0._data.status == 2 then
			arg_14_0._layoutNode:getWidget("signInLayer"):setVisible(false)
			arg_14_0._layoutNode:getWidget("btnGetBaoWu"):setVisible(true)
			arg_14_0._layoutNode:getWidget("TextGetBaoWu"):setString(language.get(135978))
			arg_14_0._layoutNode:getWidget("needDays"):setString(language.get(135981))
		elseif arg_14_0._data.status == 3 then
			arg_14_0._layoutNode:getWidget("signInLayer"):setVisible(true)
			arg_14_0._layoutNode:getWidget("btnGetBaoWu"):setVisible(false)
			arg_14_0._layoutNode:getWidget("needDays"):setString(language.get(135982))
		else
			arg_14_0._layoutNode:getWidget("signInLayer"):setVisible(true)
			arg_14_0._layoutNode:getWidget("btnGetBaoWu"):setVisible(false)
		end

		for iter_14_0 = 1, 5 do
			if iter_14_0 <= arg_14_1.days then
				arg_14_0._layoutNode:getWidget("signIn" .. iter_14_0):setEnabled(false)
				arg_14_0._layoutNode:getWidget("image" .. iter_14_0):setVisible(true)

				var_14_0 = iter_14_0
			else
				arg_14_0._layoutNode:getWidget("signIn" .. iter_14_0):setEnabled(true)
				arg_14_0._layoutNode:getWidget("image" .. iter_14_0):setVisible(false)
			end
		end

		local var_14_1 = 0

		for iter_14_1 = 1, 3 do
			local var_14_2 = 0

			if arg_14_1.fishes[iter_14_1] then
				var_14_2 = arg_14_1.fishes[iter_14_1].num
			end

			arg_14_0._layoutNode:getWidget("hasFishNum" .. iter_14_1):setString(var_14_2)
			arg_14_0._layoutNode:getWidget("fishNum" .. iter_14_1):setString(var_14_2)

			var_14_1 = var_14_1 + var_14_2
		end

		arg_14_0._layoutNode:getWidget("totleFishNum"):setString(var_14_1)
		arg_14_0._leftFishingNumLabel:setString(arg_14_1.times)

		for iter_14_2 = 1, 3 do
			local var_14_3 = 0

			if arg_14_1.boxes[iter_14_2] then
				var_14_3 = arg_14_1.boxes[iter_14_2].num
			end

			arg_14_0._layoutNode:getWidget("boxNum" .. iter_14_2):setString(var_14_3)

			if var_14_3 > 0 then
				arg_14_0._layoutNode:getWidget("front" .. iter_14_2):setVisible(false)
				arg_14_0._layoutNode:getWidget("back" .. iter_14_2):setVisible(true)
			else
				arg_14_0._layoutNode:getWidget("front" .. iter_14_2):setVisible(true)
				arg_14_0._layoutNode:getWidget("back" .. iter_14_2):setVisible(false)
			end
		end

		if #arg_14_1.addedFishes > 0 then
			local var_14_4 = arg_14_1.addedFishes[1].id
			local var_14_5 = CCSprite:create("res/ui/activity/fishing/fish" .. var_14_4 .. ".jpg")

			var_14_5:setPosition(ccp(460, 135))
			arg_14_0._layoutNode:getWidget("fishingLayer"):addChild(var_14_5)

			local var_14_6 = CCArray:create()

			var_14_6:addObject(CCDelayTime:create(var_0_2))
			var_14_6:addObject(CCMoveTo:create(var_0_1, ccp(47, 318)))
			var_14_6:addObject(CCScaleTo:create(var_0_1, 0.1))
			var_14_6:addObject(CCFadeOut:create(var_0_1))
			var_14_5:runAction(CCSequence:createWithTwoActions(CCSpawn:create(var_14_6), CCCallFuncN:create(function(arg_15_0)
				arg_15_0:removeFromParentAndCleanup(true)
			end)))
		end

		if arg_14_1.cd == 0 and arg_14_1.times > 0 then
			arg_14_0._layoutNode:getWidget("fishingProgress"):setVisible(false)
			arg_14_0._layoutNode:getWidget("btnStart"):setVisible(true)
			arg_14_0._layoutNode:getWidget("btnRewards"):setVisible(false)
			arg_14_0._layoutNode:getWidget("btnFishingNet"):setVisible(false)
			arg_14_0._fishingTimer:setCallback(nil)
		elseif arg_14_1.times <= 0 then
			arg_14_0._layoutNode:getWidget("fishingProgress"):setVisible(false)
			arg_14_0._fishingTimer:setCallback(nil)
			arg_14_0._layoutNode:getWidget("btnStart"):setVisible(false)
			arg_14_0._layoutNode:getWidget("btnRewards"):setVisible(true)
			arg_14_0._layoutNode:getWidget("btnFishingNet"):setVisible(false)

			if arg_14_0._fistShow then
				arg_14_0:goToRewardLayer()
			end
		else
			arg_14_0._layoutNode:getWidget("fishingProgress"):setVisible(true)
			arg_14_0._fishingTimer:setCallback(handler(arg_14_0, arg_14_0.fishingTimeCallBack))
			arg_14_0._fishingTimer:resetTime(arg_14_1.cd)
			arg_14_0._layoutNode:getWidget("progress"):setPercentage((arg_14_1.totalCd - arg_14_1.cd) / arg_14_1.totalCd * 100)
			arg_14_0._layoutNode:getWidget("progress"):runAction(CCProgressTo:create(arg_14_1.cd / 1000, 100))
			arg_14_0._layoutNode:getWidget("btnStart"):setVisible(false)
			arg_14_0._layoutNode:getWidget("btnRewards"):setVisible(true)
			arg_14_0._layoutNode:getWidget("btnFishingNet"):setVisible(true)

			if arg_14_0._startFish then
				arg_14_0._startFish = false

				arg_14_0:showSignIn(var_14_0)
			end
		end

		arg_14_0._fistShow = false
	end
end

function var_0_4.onButtonStartClicked(arg_16_0, ...)
	arg_16_0:startFishing()
end

function var_0_4.startFishing(arg_17_0, ...)
	cmgr.sendRequest(function(...)
		arg_17_0._startFish = true

		cmgr.sendRequest(handler(arg_17_0, arg_17_0.getFishingInfoHandler), actions.getFishingInfo)
	end, actions.startFish)
end

function var_0_4.onButtonFishingNetClicked(arg_19_0, ...)
	messageBox.showChargeWin(language.get(190080), language.get(135958, arg_19_0._data.netGold), "fishBuyNet", function(...)
		cmgr.sendRequest(handler(arg_19_0, arg_19_0.useNetResponseHandler), actions.useNet)
	end)
end

function var_0_4.useNetResponseHandler(arg_21_0, arg_21_1)
	if arg_21_1.action.state == 1 then
		arg_21_0._layoutNode:getWidget("netRewards"):runAction(CCSequence:createWithTwoActions(CCDelayTime:create(0.2), CCShow:create()))

		local var_21_0 = {
			0,
			0,
			0
		}

		for iter_21_0, iter_21_1 in pairs(arg_21_1.action.data.fishes) do
			var_21_0[iter_21_1.id] = iter_21_1.num
		end

		for iter_21_2 = 1, 3 do
			arg_21_0._layoutNode:getWidget("getFishNum" .. iter_21_2):setString(var_21_0[iter_21_2])
		end
	end
end

function var_0_4.onButtonCheckClicked(arg_22_0, ...)
	local var_22_0 = 910
	local var_22_1 = 530
	local var_22_2, var_22_3 = arg_22_0._layoutNode:getWidget("rightPanel"):getPosition()
	local var_22_4 = 1000

	arg_22_0._layoutNode:getWidget("rightPanel"):stopAllActions()

	if arg_22_0._isRightPanelShow then
		arg_22_0._layoutNode:getWidget("btnCheck"):setScaleX(1)
		arg_22_0._layoutNode:getWidget("rightPanel"):runAction(CCMoveTo:create(math.max((var_22_0 - var_22_2) / var_22_4, 0), ccp(var_22_0, var_22_3)))
	else
		arg_22_0._layoutNode:getWidget("btnCheck"):setScaleX(-1)
		arg_22_0._layoutNode:getWidget("rightPanel"):runAction(CCMoveTo:create(math.max((var_22_2 - var_22_1) / var_22_4, 0), ccp(var_22_1, var_22_3)))
	end

	arg_22_0._isRightPanelShow = not arg_22_0._isRightPanelShow
end

function var_0_4.showSignIn(arg_23_0, arg_23_1)
	local var_23_0 = 0

	if not arg_23_0._isRightPanelShow then
		arg_23_0:onButtonCheckClicked()

		var_23_0 = 0.5
	end

	local var_23_1 = CCArray:create()

	var_23_1:addObject(CCHide:create())
	var_23_1:addObject(CCScaleTo:create(0, 1.8))
	var_23_1:addObject(CCRotateTo:create(0, -10))
	var_23_1:addObject(CCDelayTime:create(var_23_0))
	var_23_1:addObject(CCShow:create())
	var_23_1:addObject(CCSpawn:createWithTwoActions(CCScaleTo:create(0.2, 1), CCRotateTo:create(0.2, 0)))
	arg_23_0._layoutNode:getWidget("image" .. arg_23_1):runAction(CCSequence:create(var_23_1))
end

function var_0_4.onButtonTwoClicked(arg_24_0, ...)
	messageBox.showChargeWin(language.get(190080), language.get(135957, arg_24_0._data.gold2), "fishBoxGold", function(...)
		arg_24_0:openFishBox(1, 1)
	end)
end

function var_0_4.onButtonFiveClicked(arg_26_0, ...)
	messageBox.showChargeWin(language.get(190080), language.get(135957, arg_26_0._data.gold5), "fishBoxGold", function(...)
		arg_26_0:openFishBox(1, 2)
	end)
end

function var_0_4.onButtonChange1Clicked(arg_28_0)
	arg_28_0:changeBaoXiang(1)
end

function var_0_4.onButtonChange2Clicked(arg_29_0)
	arg_29_0:changeBaoXiang(2)
end

function var_0_4.onButtonChange3Clicked(arg_30_0)
	arg_30_0:changeBaoXiang(3)
end

function var_0_4.changeBaoXiang(arg_31_0, arg_31_1)
	cmgr.sendRequest(function(arg_32_0)
		if arg_32_0.action.state == 1 then
			local var_32_0 = CCArray:create()

			var_32_0:addObject(CCScaleTo:create(var_0_3, 0, 1))
			var_32_0:addObject(CCTargetedAction:create(arg_31_0._layoutNode:getWidget("front" .. arg_31_1), CCHide:create()))
			var_32_0:addObject(CCTargetedAction:create(arg_31_0._layoutNode:getWidget("back" .. arg_31_1), CCShow:create()))
			var_32_0:addObject(CCScaleTo:create(var_0_3, 1))
			var_32_0:addObject(CCCallFunc:create(function(...)
				cmgr.sendRequest(handler(arg_31_0, arg_31_0.getFishingInfoHandler), actions.getFishingInfo)
			end))
			arg_31_0._layoutNode:getWidget("boxNum" .. arg_31_1):setString(arg_32_0.action.data.num)
			arg_31_0._layoutNode:getWidget("change" .. arg_31_1):runAction(CCSequence:create(var_32_0))
		end
	end, actions.exchangeReward, arg_31_1, arg_31_0._data.fishes[arg_31_1].num)
end

function var_0_4.onButtonGet2Clicked(arg_34_0)
	arg_34_0:openFishBox(2, 0)
end

function var_0_4.onButtonGet3Clicked(arg_35_0)
	arg_35_0:openFishBox(3, 0)
end

function var_0_4.onButtonCommentClicked(arg_36_0)
	for iter_36_0 = 1, 3 do
		local var_36_0 = CCSprite:create("res/ui/activity/fishing/fish" .. iter_36_0 .. ".jpg")

		var_36_0:setPosition(ccp(450 + (iter_36_0 - 2) * 130, 286))
		arg_36_0._layoutNode:getWidget("fishingLayer"):addChild(var_36_0)

		local var_36_1 = CCArray:create()

		var_36_1:addObject(CCDelayTime:create(var_0_2))
		var_36_1:addObject(CCMoveTo:create(var_0_1, ccp(47, 318)))
		var_36_1:addObject(CCScaleTo:create(var_0_1, 0.1))
		var_36_1:addObject(CCFadeOut:create(var_0_1))
		var_36_0:runAction(CCSequence:createWithTwoActions(CCSpawn:create(var_36_1), CCCallFuncN:create(function(arg_37_0)
			arg_37_0:removeFromParentAndCleanup(true)
		end)))
	end

	arg_36_0._layoutNode:getWidget("netRewards"):setVisible(false)
	cmgr.sendRequest(handler(arg_36_0, arg_36_0.getFishingInfoHandler), actions.getFishingInfo)
end

function var_0_4.openFishBox(arg_38_0, arg_38_1, arg_38_2)
	cmgr.sendRequest(function(arg_39_0)
		if arg_39_0.action.state == 1 then
			local var_39_0 = {}

			for iter_39_0, iter_39_1 in pairs(arg_39_0.action.data.rewards) do
				local var_39_1 = 1

				if arg_38_2 == 1 then
					var_39_1 = 2
				elseif arg_38_2 == 2 then
					var_39_1 = 5
				end

				for iter_39_2 = 1, var_39_1 do
					var_39_0[#var_39_0 + 1] = {}

					local var_39_2 = iter_39_1.type

					if iter_39_1.type == 112 then
						var_39_2 = 10001
					elseif iter_39_1.type == 5 then
						var_39_2 = 6
					elseif iter_39_1.type == 102 then
						var_39_2 = 41
					end

					var_39_0[#var_39_0].id = var_39_2
					var_39_0[#var_39_0].value = iter_39_1.value
				end
			end

			globalAction_gotResource(var_39_0)
			cmgr.sendRequest(function(arg_40_0)
				if arg_40_0.action.state == 1 then
					if arg_40_0.action.data.boxes[arg_38_1].num <= 0 then
						local var_40_0 = CCArray:create()

						var_40_0:addObject(CCScaleTo:create(var_0_3, 0, 1))
						var_40_0:addObject(CCTargetedAction:create(arg_38_0._layoutNode:getWidget("back" .. arg_38_1), CCHide:create()))
						var_40_0:addObject(CCTargetedAction:create(arg_38_0._layoutNode:getWidget("front" .. arg_38_1), CCShow:create()))
						var_40_0:addObject(CCScaleTo:create(var_0_3, 1))
						var_40_0:addObject(CCCallFunc:create(function(...)
							cmgr.sendRequest(handler(arg_38_0, arg_38_0.getFishingInfoHandler), actions.getFishingInfo)
						end))
						arg_38_0._layoutNode:getWidget("change" .. arg_38_1):runAction(CCSequence:create(var_40_0))
					else
						arg_38_0:getFishingInfoHandler(arg_40_0)
					end
				end
			end, actions.getFishingInfo)
		end
	end, actions.openFishBox, arg_38_1, arg_38_2)
end

function var_0_4.onButtonGetBaoWuClicked(arg_42_0)
	if arg_42_0._data.status == 1 then
		cmgr.sendRequest(handler(arg_42_0, arg_42_0.getBaoWuHandlerResponse), actions.getFishBaoWu)
	elseif arg_42_0._data.status == 2 then
		messageBox.showChargeWin(language.get(190080), language.get(135984, arg_42_0._data.buyTreasureGold), "fishTreasure", function(...)
			cmgr.sendRequest(handler(arg_42_0, arg_42_0.getBaoWuHandlerResponse), actions.getFishBaoWu)
		end)
	end
end

function var_0_4.getBaoWuHandlerResponse(arg_44_0, arg_44_1)
	if arg_44_1.action.state == 1 then
		local var_44_0 = {
			{}
		}

		var_44_0[1].id = 10019
		var_44_0[1].value = 1

		globalAction_gotResource(var_44_0)
		cmgr.sendRequest(handler(arg_44_0, arg_44_0.getFishingInfoHandler), actions.getFishingInfo)
	end
end

function var_0_4.getLeftTimeLabel(arg_45_0)
	if arg_45_0._layoutNode then
		return arg_45_0._layoutNode:getWidget("leftTime")
	else
		return nil
	end
end

function var_0_4.onRewardLayerTouched(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
	if arg_46_1 == CCTOUCHBEGAN then
		if arg_46_0._layoutNode:getWidget("rewardLayer"):isVisible() and tool.checkIfTouch2(arg_46_0._layoutNode:getWidget("rewardLayer"), arg_46_2, arg_46_3) then
			return true
		else
			return false
		end
	elseif arg_46_1 == CCTOUCHMOVED then
		return true
	elseif arg_46_1 == CCTOUCHENDED then
		return true
	end
end

function var_0_4.onNetRewardsLayerTouched(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	if arg_47_1 == CCTOUCHBEGAN then
		if arg_47_0._layoutNode:getWidget("netRewards"):isVisible() then
			return true
		else
			return false
		end
	elseif arg_47_1 == CCTOUCHMOVED then
		return true
	elseif arg_47_1 == CCTOUCHENDED then
		return true
	end
end

function var_0_4.onRightPanelBgTouched(arg_48_0, arg_48_1, arg_48_2, arg_48_3)
	if arg_48_1 == CCTOUCHBEGAN then
		if arg_48_0._layoutNode:getWidget("rightPanelBg"):isVisible() and tool.checkIfTouch2(arg_48_0._layoutNode:getWidget("rightPanelBg"), arg_48_2, arg_48_3) then
			return true
		else
			return false
		end
	elseif arg_48_1 == CCTOUCHMOVED then
		return true
	elseif arg_48_1 == CCTOUCHENDED then
		return true
	end
end

function var_0_4.fishingTimeCallBack(arg_49_0)
	cmgr.sendRequest(handler(arg_49_0, arg_49_0.getFishingInfoHandler), actions.getFishingInfo)
end

function var_0_4.getFishingInfoHandler(arg_50_0, arg_50_1)
	if arg_50_1.action.state == 1 then
		arg_50_0:refreshPanel(arg_50_1.action.data)
	end
end

return var_0_4
