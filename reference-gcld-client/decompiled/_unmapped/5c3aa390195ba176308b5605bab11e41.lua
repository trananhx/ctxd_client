local var_0_0 = {
	[4] = {
		scale = 0.55,
		txt = 10104,
		pic = "res/ui/activity/moveMountain/btkd_icon_bt.png",
		type = 4
	},
	[21] = {
		scale = 0.8,
		txt = 10106,
		pic = "res/ui/activity/gemsActivity/icon_gem.png",
		type = 7
	},
	[116] = {
		scale = 0.8,
		txt = 310020,
		pic = "res/ui/resource/silkroad/sczl_sj_icon.png",
		type = 55
	},
	[126] = {
		scale = 0.8,
		txt = 111043,
		pic = "res/ui/resource/silkroad/sczldj_pbjn.png",
		type = 10030
	},
	[119] = {
		scale = 0.5,
		txt = 10110,
		pic = "res/ui/activity/gangMine/blgkd_icon_blg.png",
		type = 10033
	}
}
local var_0_1 = {
	{
		txt1 = 226084,
		txt2 = {
			226087,
			226088,
			226089
		}
	},
	{
		txt1 = 226085,
		txt2 = {
			226090,
			226091,
			226092
		}
	},
	{
		txt1 = 226086,
		txt2 = {
			226093,
			226094,
			226095
		}
	}
}
local var_0_2 = colorQuality[0]
local var_0_3 = tool.hexToRgb("#D9EDC5")
local var_0_4 = ccc3(0, 180, 0)
local var_0_5 = colorQuality[5]
local var_0_6 = colorQuality[4]
local var_0_7 = colorQuality[2]
local var_0_8 = {
	tool.hexToRgb("#FF8C7F"),
	tool.hexToRgb("#FFF461"),
	(tool.hexToRgb("#E57FFF"))
}
local var_0_9 = class("ZongziGiving", function()
	return createBaseLayer()
end)

var_0_9.layout = {
	y = 0,
	name = "root",
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
					y = 481,
					x = 457.5,
					type = "sprite",
					pic = {
						path = "res/ui/activity/zongzi/sdsl_pic.jpg"
					}
				},
				{
					y = 281.9977,
					x = 457.5002,
					type = "sprite",
					pic = {
						path = "res/ui/activity/zongzi/sdsl_bg1.png"
					}
				},
				{
					y = 480,
					x = 457.5,
					type = "sprite",
					pic = {
						path = "res/ui/activity/zongzi/sdsl_title.png"
					}
				},
				{
					fontSize = 25,
					name = "leftTime",
					y = 480,
					type = "label",
					x = 780,
					color = var_0_5
				},
				{
					name = "curRound",
					type = "atlaslabel",
					pic = "res/ui/common/number/nation_task_upg_numb.png",
					startCharMap = 48,
					text = "0",
					y = 480,
					itemWidth = 53,
					x = 66,
					itemHeight = 64,
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					type = "node",
					name = "node_give",
					y = 0,
					visible = false,
					x = 0,
					children = {
						{
							fontSize = 24,
							name = "generalName",
							y = 412,
							type = "label",
							x = 42
						},
						{
							fontSize = 24,
							name = "curIndex",
							y = 412,
							type = "label",
							x = 122,
							color = tool.hexToRgb("#CCB986")
						},
						{
							y = 138,
							name = "halfPic",
							type = "sprite",
							x = 3,
							anchorPoint = ccp(0, 0),
							pic = {
								path = "res/ui/common/halfPic/halfPic_diaochan.png"
							}
						},
						{
							visible = false,
							name = "bg_msg",
							type = "sprite9",
							y = 150,
							x = 120,
							pic = {
								frame = true,
								path = "common_tip_frame_small.png"
							},
							anchorPoint = ccp(0.5, 0),
							middleRect = CCRectMake(24, 24, 1, 1),
							preferedSize = CCSizeMake(160, 140),
							children = {
								{
									fontSize = 20,
									height = 0,
									name = "msg",
									type = "label",
									textId = 135238,
									style = "label_warlock",
									width = 200,
									anchorPoint = ccp(0, 0),
									halign = kCCTextAlignmentLeft,
									color = var_0_3
								}
							}
						},
						{
							y = 300,
							type = "sprite",
							x = 595,
							pic = {
								path = "res/ui/activity/zongzi/dwsl_bar_1_bg.png"
							},
							children = {
								{
									y = 20,
									name = "bar1",
									type = "progressbar",
									x = 282,
									pic = {
										path = "res/ui/activity/zongzi/dwsl_bar_1.png"
									}
								},
								{
									y = 0,
									name = "node_box",
									x = 0,
									type = "node"
								},
								{
									zoomOnTouchDown = true,
									name = "btn_mood",
									h = 50,
									type = "button",
									w = 100,
									y = 75,
									x = -40,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									},
									children = {
										{
											y = 25,
											name = "bg_mood",
											type = "sprite",
											x = 70,
											pic = {
												path = "res/ui/activity/zongzi/dwsl_word_di01.png"
											}
										},
										{
											y = 25,
											name = "mood",
											type = "sprite",
											x = 50,
											pic = {
												path = "res/ui/activity/zongzi/dwsl_word_1.png"
											}
										}
									}
								},
								{
									y = 17,
									type = "sprite",
									scaleX = 0.45,
									x = -40,
									scaleY = 0.7,
									pic = {
										path = "res/ui/common/button/public_btn_red.png"
									}
								},
								{
									name = "curFavor",
									type = "atlaslabel",
									pic = "res/ui/common/number/mnlm_word_time_numb.png",
									startCharMap = 48,
									text = "0",
									y = 20,
									itemWidth = 20,
									x = -40,
									itemHeight = 30,
									anchorPoint = ccp(0.5, 0.5)
								}
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_next",
							h = 114,
							type = "button",
							w = 114,
							y = 80,
							x = 460,
							normal = {
								path = "res/ui/activity/zongzi/dwsl_btn.png"
							},
							touched = {
								path = "res/ui/activity/zongzi/dwsl_btn_c.png"
							},
							disable = {
								path = "res/ui/activity/zongzi/dwsl_btn_g.png"
							},
							children = {
								{
									y = 70,
									name = "btn_next_sp1",
									type = "sprite",
									x = 60,
									pic = {
										path = "res/ui/activity/zongzi/dwsl_btn_icon_arrow.png"
									}
								},
								{
									y = 35,
									name = "btn_next_sp2",
									type = "sprite",
									x = 57,
									pic = {
										path = "res/ui/activity/zongzi/dwsl_btn_word_xyw.png"
									}
								}
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_give",
							h = 114,
							type = "button",
							w = 114,
							y = 80,
							x = 690,
							normal = {
								path = "res/ui/activity/zongzi/dwsl_btn.png"
							},
							touched = {
								path = "res/ui/activity/zongzi/dwsl_btn_c.png"
							},
							children = {
								{
									y = 60,
									x = 57,
									type = "sprite",
									pic = {
										path = "res/ui/activity/zongzi/sdsl_gift_btn.png"
									}
								},
								{
									y = 35,
									x = 57,
									type = "sprite",
									pic = {
										path = "res/ui/activity/zongzi/dwsl_btn_word_sl.png"
									}
								}
							}
						},
						{
							fontSize = 22,
							name = "range_favor",
							y = 15,
							type = "label",
							x = 690
						},
						{
							fontSize = 40,
							name = "freeNum",
							type = "label",
							visible = false,
							y = 60,
							x = 740,
							color = var_0_3,
							anchorPoint = ccp(0, 0.5)
						},
						{
							type = "sprite",
							name = "icon_giveAwayGold",
							y = 60,
							visible = false,
							x = 760,
							pic = {
								path = "res/ui/activity/ironRotary/yuanbao.png"
							},
							children = {
								{
									fontSize = 25,
									name = "giveAwayGold",
									y = 18,
									type = "label",
									x = 44,
									anchorPoint = ccp(0, 0.5)
								}
							}
						}
					}
				},
				{
					type = "node",
					name = "node_result",
					y = 0,
					visible = false,
					x = 0,
					children = {
						{
							y = 278,
							name = "bg_result",
							type = "sprite",
							x = 458.5,
							pic = {
								path = "res/ui/activity/zongzi/sdsl_js_bg2.jpg"
							},
							children = {
								{
									y = 200,
									type = "sprite",
									x = 454.5,
									pic = {
										path = "res/ui/activity/zongzi/sdsl_bar_bg.png"
									},
									children = {
										{
											y = 24,
											name = "bar2",
											type = "progressbar",
											x = 345,
											pic = {
												path = "res/ui/activity/zongzi/sdsl_bar.png"
											}
										},
										{
											y = 24,
											type = "sprite",
											x = 0,
											pic = {
												path = "res/ui/activity/zongzi/dwsl_btn.png"
											},
											children = {
												{
													y = 57,
													x = 57,
													type = "sprite",
													pic = {
														path = "res/ui/activity/zongzi/sdsl_r_icon_xh.png"
													}
												},
												{
													name = "curRound1",
													type = "atlaslabel",
													pic = "res/ui/common/number/nation_task_upg_numb.png",
													startCharMap = 48,
													text = "0",
													y = 57,
													itemWidth = 53,
													x = 57,
													itemHeight = 64,
													anchorPoint = ccp(0.5, 0.5)
												}
											}
										},
										{
											y = 24,
											x = 345,
											type = "node",
											children = {
												{
													zoomOnTouchDown = true,
													name = "btn_buff1",
													h = 100,
													type = "button",
													w = 100,
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
															y = 50,
															type = "sprite",
															x = 50,
															pic = {
																path = "res/ui/activity/zongzi/dwsl_btn.png"
															},
															children = {
																{
																	y = 57,
																	name = "icon_buff1",
																	type = "sprite",
																	x = 57,
																	pic = {
																		path = "res/ui/activity/zongzi/sdsl_r_icon_ld.png"
																	}
																}
															}
														}
													}
												},
												{
													y = 55,
													type = "sprite9",
													x = 0,
													preferedSize = CCSizeMake(50, 30),
													middleRect = CCRectMake(10, 10, 29, 29),
													pic = {
														frame = true,
														path = "common_tip_frame_small.png"
													},
													children = {
														{
															fontSize = 22,
															name = "round1",
															y = 15,
															type = "label",
															x = 25,
															color = var_0_3
														}
													}
												},
												{
													x = 0,
													name = "light_buff1",
													y = 0,
													type = "sprite",
													scale = 1.5
												}
											}
										},
										{
											y = 24,
											x = 690,
											type = "node",
											children = {
												{
													zoomOnTouchDown = true,
													name = "btn_buff2",
													h = 100,
													type = "button",
													w = 100,
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
															y = 50,
															type = "sprite",
															x = 50,
															pic = {
																path = "res/ui/activity/zongzi/dwsl_btn.png"
															},
															children = {
																{
																	y = 57,
																	name = "icon_buff2",
																	type = "sprite",
																	x = 57,
																	pic = {
																		path = "res/ui/activity/zongzi/sdsl_r_icon_lwh.png"
																	}
																}
															}
														}
													}
												},
												{
													y = 55,
													type = "sprite9",
													x = 0,
													preferedSize = CCSizeMake(50, 30),
													middleRect = CCRectMake(10, 10, 29, 29),
													pic = {
														frame = true,
														path = "common_tip_frame_small.png"
													},
													children = {
														{
															fontSize = 22,
															name = "round2",
															y = 15,
															type = "label",
															x = 25,
															color = var_0_3
														}
													}
												},
												{
													x = 0,
													name = "light_buff2",
													y = 0,
													type = "sprite",
													scale = 1.5
												}
											}
										}
									}
								},
								{
									type = "node",
									name = "node_bell",
									y = 0,
									visible = false,
									x = 0,
									children = {
										{
											zoomOnTouchDown = true,
											name = "btn_bell1",
											h = 80,
											type = "button",
											w = 100,
											y = 100,
											x = 354.5,
											normal = {
												path = "res/default.png"
											},
											touched = {
												path = "res/default.png"
											},
											children = {
												{
													y = 40,
													x = 50,
													type = "sprite",
													pic = {
														path = "res/ui/activity/zongzi/sdsl_icon_ld_di.png"
													}
												},
												{
													type = "sprite",
													name = "bell1",
													y = 40,
													visible = false,
													x = 50,
													pic = {
														path = "res/ui/activity/zongzi/sdsl_icon_ld.png"
													}
												}
											}
										},
										{
											zoomOnTouchDown = true,
											name = "btn_bell2",
											h = 80,
											type = "button",
											w = 100,
											y = 100,
											x = 454.5,
											normal = {
												path = "res/default.png"
											},
											touched = {
												path = "res/default.png"
											},
											children = {
												{
													y = 40,
													x = 50,
													type = "sprite",
													pic = {
														path = "res/ui/activity/zongzi/sdsl_icon_ld_di.png"
													}
												},
												{
													type = "sprite",
													name = "bell2",
													y = 40,
													visible = false,
													x = 50,
													pic = {
														path = "res/ui/activity/zongzi/sdsl_icon_ld.png"
													}
												}
											}
										},
										{
											zoomOnTouchDown = true,
											name = "btn_bell3",
											h = 80,
											type = "button",
											w = 100,
											y = 100,
											x = 554.5,
											normal = {
												path = "res/default.png"
											},
											touched = {
												path = "res/default.png"
											},
											children = {
												{
													y = 40,
													x = 50,
													type = "sprite",
													pic = {
														path = "res/ui/activity/zongzi/sdsl_icon_ld_di.png"
													}
												},
												{
													type = "sprite",
													name = "bell3",
													y = 40,
													visible = false,
													x = 50,
													pic = {
														path = "res/ui/activity/zongzi/sdsl_icon_ld.png"
													}
												}
											}
										}
									}
								},
								{
									zoomOnTouchDown = true,
									name = "btn_treasure1",
									h = 80,
									type = "button",
									w = 80,
									y = 100,
									visible = false,
									x = 454.5,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									},
									children = {
										{
											y = 40,
											name = "icon_treasure1",
											x = 40,
											type = "sprite"
										}
									}
								},
								{
									anchorPointX = 0.5,
									name = "richLine",
									y = 33,
									type = "richLine",
									x = 454.5,
									content = {
										{
											type = "label",
											fontSize = 30,
											textId = 226118,
											color = var_0_6
										},
										{
											name = "type1",
											fontSize = 30,
											type = "label",
											color = var_0_6
										},
										{
											name = "num1",
											fontSize = 40,
											type = "label",
											color = var_0_3
										},
										{
											name = "type2",
											fontSize = 30,
											type = "label",
											color = var_0_6
										},
										{
											name = "num2",
											fontSize = 40,
											type = "label",
											color = var_0_3
										}
									}
								},
								{
									zoomOnTouchDown = true,
									name = "btn_newRound",
									h = 62,
									type = "button",
									w = 195,
									y = -60,
									x = 454.5,
									normal = {
										path = "res/ui/common/button/public_btn_green.png"
									},
									touched = {
										path = "res/ui/common/button/public_btn_green_c.png"
									},
									children = {
										{
											y = 34,
											type = "sprite",
											x = 48,
											pic = {
												path = "res/ui/common/button/public_btn_gold.png"
											},
											children = {
												{
													y = 35,
													x = 42,
													type = "sprite",
													pic = {
														path = "res/ui/activity/ironRotary/yuanbao.png"
													}
												},
												{
													fontSize = 22,
													name = "coverCdGold",
													y = 15,
													type = "label",
													x = 42
												}
											}
										},
										{
											fontSize = 22,
											y = 33,
											type = "label",
											x = 125,
											textId = 226064,
											color = var_0_3
										}
									}
								},
								{
									fontSize = 20,
									y = -100,
									type = "label",
									x = 454.5,
									textId = 226099,
									color = var_0_6
								}
							}
						}
					}
				},
				{
					x = 3,
					height = 425,
					visible = false,
					type = "layerColor",
					name = "bg_treasure",
					y = 3,
					width = 909,
					color = ccc4(0, 0, 0, 180),
					children = {
						{
							zoomOnTouchDown = true,
							name = "btn_treasure2",
							h = 120,
							type = "button",
							w = 120,
							y = 200,
							x = 454.5,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							},
							children = {
								{
									x = 60,
									name = "icon_treasure2",
									y = 60,
									type = "sprite",
									scale = 1.2
								}
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_getTreasure",
							h = 62,
							type = "button",
							w = 195,
							y = 110,
							x = 454.5,
							normal = {
								path = "res/ui/common/button/public_btn_green.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_green_c.png"
							},
							children = {
								{
									fontSize = 25,
									y = 33,
									type = "label",
									x = 98,
									textId = 111020,
									color = var_0_3
								}
							}
						}
					}
				}
			}
		}
	}
}
var_0_9.layout_box = {
	y = 20,
	name = "bg",
	type = "sprite",
	x = 564,
	pic = {
		path = "res/ui/activity/zongzi/sdsl_gift_bg.png"
	},
	children = {
		{
			y = 36,
			name = "box",
			type = "sprite",
			x = 36,
			pic = {
				path = "res/ui/activity/zongzi/sdsl_gift_icon.png"
			}
		},
		{
			y = 96,
			type = "sprite",
			x = 8,
			pic = {
				path = "res/ui/activity/zongzi/dwsl_numb_di.png"
			},
			children = {
				{
					x = 25,
					name = "sp",
					y = 21,
					type = "sprite",
					scale = 0.8,
					pic = {
						path = "res/ui/resource/silkroad/sczl_sj_icon.png"
					}
				},
				{
					fontSize = 24,
					name = "num",
					y = 21,
					type = "label",
					x = 44,
					anchorPoint = ccp(0, 0.5)
				}
			}
		},
		{
			y = -26,
			type = "sprite",
			x = 36,
			pic = {
				path = "res/ui/activity/zongzi/sdsl_love.png"
			},
			children = {
				{
					fontSize = 24,
					name = "favor",
					y = 32,
					type = "label",
					x = 34
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
	anchorPoint = ccp(0.5, 0),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			height = 0,
			name = "tipMsg",
			type = "label",
			textId = 135238,
			style = "label_warlock",
			width = 200,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_3
		}
	}
}

function var_0_9.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getDWXZ)
end

function var_0_9.onGiveAway(arg_4_0)
	local function var_4_0(arg_5_0)
		local var_5_0 = arg_5_0.action.data

		arg_4_0:showEffectFavor(var_5_0.favor)
		arg_4_0:showEffectTalk()
		arg_4_0:refresh()
	end

	if arg_4_0.info.giveAwayGold == 0 or arg_4_0.info.giveAwayGold == nil then
		cmgr.sendRequest(var_4_0, actions.giveDwxz)
	else
		messageBox.showChargeWin("", language.get(226070, arg_4_0.info.giveAwayGold), "dwxzGiveAwayGold", function()
			cmgr.sendRequest(var_4_0, actions.giveDwxz)
		end)
	end
end

function var_0_9.onGetReward(arg_7_0, arg_7_1)
	local function var_7_0(arg_8_0)
		local var_8_0 = arg_8_0.action.data
		local var_8_1 = {}

		for iter_8_0, iter_8_1 in ipairs(var_8_0.rewards) do
			local var_8_2 = {
				id = (var_0_0[iter_8_1.type] or var_0_0[4]).type,
				value = iter_8_1.value
			}

			table.insert(var_8_1, var_8_2)
		end

		globalAction_gotResource(var_8_1)
		arg_7_0:refresh()
	end

	cmgr.sendRequest(var_7_0, actions.getDWxzReward, arg_7_1)
end

function var_0_9.onEnterNext(arg_9_0)
	local function var_9_0(arg_10_0)
		arg_9_0:refresh()
	end

	cmgr.sendRequest(var_9_0, actions.nextDwxz)
end

function var_0_9.onStartNewRound(arg_11_0)
	local function var_11_0(arg_12_0)
		arg_11_0:refresh()
	end

	messageBox.showChargeWin("", language.get(226098, arg_11_0.info.coverCdGold), "dwxzNewRoundGold", function()
		cmgr.sendRequest(var_11_0, actions.resertDwxz)
	end)
end

function var_0_9.onPlayWithFairy(arg_14_0)
	local function var_14_0(arg_15_0)
		local var_15_0 = {}
		local var_15_1 = {}

		var_15_1.id = 10021
		var_15_1.value = 1

		table.insert(var_15_0, var_15_1)
		globalAction_gotResource(var_15_0)
		arg_14_0:refresh()
	end

	cmgr.sendRequest(var_14_0, actions.dwxzPlayWithFairy)
end

function var_0_9.showEffectNPC(arg_16_0)
	arg_16_0.view.widgets.halfPic:setPosition(-250, 138)
	arg_16_0.view.widgets.halfPic:setOpacity(0)

	local var_16_0 = CCFadeIn:create(0.5)
	local var_16_1 = CCEaseSineOut:create(CCMoveTo:create(0.5, ccp(3, 138)))
	local var_16_2 = CCArray:create()

	var_16_2:addObject(CCSpawn:createWithTwoActions(var_16_0, var_16_1))
	var_16_2:addObject(CCCallFunc:create(function()
		return
	end))

	local var_16_3 = CCSequence:create(var_16_2)

	arg_16_0.view.widgets.halfPic:runAction(var_16_3)
end

function var_0_9.showEffectTalk(arg_18_0)
	local var_18_0 = arg_18_0.msgIdx or math.random(1, 3)
	local var_18_1 = {
		1,
		2,
		3
	}

	table.remove(var_18_1, var_18_0)

	arg_18_0.msgIdx = var_18_1[math.random(1, 2)]

	local var_18_2 = language.get(var_0_1[arg_18_0.info.mood].txt2[arg_18_0.msgIdx])

	arg_18_0.view.widgets.msg:setString(var_18_2)

	local var_18_3 = arg_18_0.view.widgets.msg:getContentSize().width
	local var_18_4 = arg_18_0.view.widgets.msg:getContentSize().height

	arg_18_0.view.widgets.bg_msg:setPreferredSize(CCSizeMake(var_18_3 + 30, var_18_4 + 30))
	arg_18_0.view.widgets.msg:setPosition(15, 15)
	arg_18_0.view.widgets.bg_msg:setVisible(true)
	arg_18_0.view.widgets.bg_msg:stopAllActions()

	local var_18_5 = CCArray:create()

	var_18_5:addObject(CCDelayTime:create(2))
	var_18_5:addObject(CCHide:create())

	local var_18_6 = CCSequence:create(var_18_5)

	arg_18_0.view.widgets.bg_msg:runAction(var_18_6)
end

function var_0_9.showEffectFavor(arg_19_0, arg_19_1)
	arg_19_1 = arg_19_1 or 0

	local var_19_0 = CCLabelAtlas:create(string.format(":%s", arg_19_1), "res/ui/common/number/get_numb.png", 29, 46, 48)

	var_19_0:setAnchorPoint(ccp(0.5, 0.5))
	var_19_0:setPosition(595, 250)
	arg_19_0.view.widgets.bg:addChild(var_19_0)

	local var_19_1 = CCArray:create()

	var_19_1:addObject(CCEaseSineOut:create(CCMoveBy:create(0.5, ccp(0, 30))))
	var_19_1:addObject(CCDelayTime:create(0.5))
	var_19_1:addObject(CCCallFunc:create(function()
		var_19_0:removeFromParentAndCleanup(true)
	end))

	local var_19_2 = CCSequence:create(var_19_1)

	var_19_0:runAction(var_19_2)
end

function var_0_9.showEffectTxt(arg_21_0)
	local var_21_0 = CCSprite:create("res/ui/activity/zongzi/qxsl_word_lhyyj.png")

	var_21_0:setPosition(690, 80)
	arg_21_0.view.widgets.bg:addChild(var_21_0)

	local var_21_1 = CCArray:create()

	var_21_1:addObject(CCEaseSineOut:create(CCMoveBy:create(0.5, ccp(0, 30))))
	var_21_1:addObject(CCDelayTime:create(0.5))
	var_21_1:addObject(CCCallFunc:create(function()
		var_21_0:removeFromParentAndCleanup(true)
	end))

	local var_21_2 = CCSequence:create(var_21_1)

	var_21_0:runAction(var_21_2)
end

function var_0_9.showTip(arg_23_0, arg_23_1, arg_23_2)
	log.info("should show tips ")

	local var_23_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_23_0:registerScriptTouchHandler(function(arg_24_0, arg_24_1, arg_24_2)
		if arg_24_0 == CCTOUCHBEGAN then
			return true
		elseif arg_24_0 == CCTOUCHMOVED then
			return true
		elseif arg_24_0 == CCTOUCHENDED then
			pcall(var_23_0.removeFromParentAndCleanup, var_23_0, true)

			return true
		end
	end, false, true)
	var_23_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_23_0, 60000)

	local var_23_1 = 0
	local var_23_2 = 0
	local var_23_3 = {}

	uiutil.initWidgets(var_23_3, arg_23_0.tipFrame)
	var_23_0:addChild(var_23_3.widgets.tipFrame)

	local var_23_4, var_23_5 = tool.getPositionInScreen(arg_23_1)
	local var_23_6 = var_23_4
	local var_23_7 = var_23_5

	var_23_3.widgets.tipMsg:setString(arg_23_2)

	local var_23_8 = var_23_3.widgets.tipMsg:getContentSize().width
	local var_23_9 = var_23_3.widgets.tipMsg:getContentSize().height

	var_23_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_23_8 + 30, var_23_9 + 30))
	var_23_3.widgets.tipFrame:setPosition(ccp(var_23_6, var_23_7))
	var_23_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_23_3.widgets.tipFrame:setVisible(true)
end

function var_0_9.showPanel(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0.info

	arg_25_0.info = arg_25_1

	local var_25_1 = arg_25_1.curRound
	local var_25_2 = arg_25_1.progressBar ~= nil
	local var_25_3 = arg_25_1.fairyState == 1

	arg_25_0.view.widgets.node_give:setVisible(var_25_2)
	arg_25_0.view.widgets.node_result:setVisible(not var_25_2)
	arg_25_0.view.widgets.bg_treasure:setVisible(var_25_3)

	if var_25_2 then
		arg_25_0.view.widgets.generalName:setString(arg_25_1.generalName)
		arg_25_0.view.widgets.curIndex:setString(arg_25_1.curIndex .. "/" .. arg_25_1.maxIndex)
		arg_25_0.view.widgets.halfPic:setDisplayFrame(CCSprite:create("res/ui/common/halfPic/halfPic_" .. arg_25_1.generalPic .. ".png"):displayFrame())
		arg_25_0.view.widgets.generalName:setColor(colorQuality[arg_25_1.generalQuality])

		if var_25_0 and var_25_0.generalPic and var_25_0.generalPic ~= arg_25_1.generalPic then
			arg_25_0:showEffectNPC()
			arg_25_0.view.widgets.bg_msg:stopAllActions()
			arg_25_0.view.widgets.bg_msg:setVisible(false)
		end

		arg_25_0.view.widgets.bg_mood:setDisplayFrame(CCSprite:create("res/ui/activity/zongzi/dwsl_word_di0" .. arg_25_1.mood .. ".png"):displayFrame())
		arg_25_0.view.widgets.mood:setDisplayFrame(CCSprite:create("res/ui/activity/zongzi/dwsl_word_" .. arg_25_1.mood .. ".png"):displayFrame())
		arg_25_0.view.widgets.curFavor:setString(tostring(arg_25_1.curFavor))
		arg_25_0.view.widgets.node_box:removeAllChildrenWithCleanup(true)

		local var_25_4 = #arg_25_1.progressBar
		local var_25_5 = 0

		for iter_25_0, iter_25_1 in ipairs(arg_25_1.progressBar) do
			local var_25_6 = {}
			local var_25_7 = iter_25_0 / var_25_4 * 564

			uiutil.initWidgets(var_25_6, arg_25_0.layout_box)
			var_25_6.widgets.bg:setPositionX(var_25_7)
			arg_25_0.view.widgets.node_box:addChild(var_25_6.widgets.bg)
			var_25_6.widgets.favor:setString(iter_25_1.favor)

			local var_25_8 = iter_25_1.num

			if var_25_8 > 100000 then
				var_25_8 = tool.getFormatNum(var_25_8)
			end

			var_25_6.widgets.num:setString(var_25_8)

			if iter_25_1.status == 0 then
				tool.spriteToGray(var_25_6.widgets.box)
			end

			local var_25_9 = var_0_0[iter_25_1.type] or var_0_0[4]

			var_25_6.widgets.sp:setDisplayFrame(CCSprite:create(var_25_9.pic):displayFrame())
			var_25_6.widgets.sp:setScale(var_25_9.scale)

			if arg_25_1.curFavor >= iter_25_1.favor then
				var_25_5 = var_25_5 + 100 / var_25_4
			else
				local var_25_10 = iter_25_0 == 1 and 0 or arg_25_1.progressBar[iter_25_0 - 1].favor

				if var_25_10 <= arg_25_1.curFavor then
					var_25_5 = var_25_5 + 100 / var_25_4 * (arg_25_1.curFavor - var_25_10) / (iter_25_1.favor - var_25_10)
				end
			end
		end

		arg_25_0.view.widgets.bar1:setPercentage(var_25_5)
		arg_25_0.view.widgets.range_favor:setString(language.get(226082, arg_25_1.minFavor, arg_25_1.maxFavor))
		arg_25_0.view.widgets.range_favor:setColor(var_0_8[arg_25_1.mood])

		local var_25_11 = arg_25_1.freeZongzi > arg_25_1.usedZongzi

		arg_25_0.view.widgets.btn_next:setEnabled(not var_25_11)
		arg_25_0.view.widgets.freeNum:setVisible(var_25_11)
		arg_25_0.view.widgets.icon_giveAwayGold:setVisible(not var_25_11)
		arg_25_0.view.widgets.btn_next_sp1:removeAllChildrenWithCleanup(true)
		arg_25_0.view.widgets.btn_next_sp2:removeAllChildrenWithCleanup(true)

		if var_25_11 then
			arg_25_0.view.widgets.freeNum:setString(language.get(135039, arg_25_1.freeZongzi - arg_25_1.usedZongzi))
			tool.spriteToGray(arg_25_0.view.widgets.btn_next_sp1)
			tool.spriteToGray(arg_25_0.view.widgets.btn_next_sp2)
		else
			arg_25_0.view.widgets.giveAwayGold:setString(arg_25_1.giveAwayGold)

			if var_25_0 and var_25_0.freeZongzi > var_25_0.usedZongzi then
				arg_25_0:showEffectTxt()
			end
		end

		for iter_25_2, iter_25_3 in ipairs(arg_25_1.progressBar) do
			if arg_25_1.curFavor >= iter_25_3.favor and iter_25_3.status == 0 then
				arg_25_0:onGetReward(iter_25_3.id)

				return
			end
		end

		if arg_25_1.curFavor >= arg_25_1.progressBar[#arg_25_1.progressBar].favor then
			arg_25_0:onEnterNext()

			return
		end

		var_25_1 = var_25_1 - 1
	else
		local var_25_12 = #arg_25_1.buff
		local var_25_13 = 0

		for iter_25_4, iter_25_5 in ipairs(arg_25_1.buff) do
			local var_25_14 = arg_25_0.view.widgets["icon_buff" .. iter_25_4]
			local var_25_15 = arg_25_0.view.widgets["light_buff" .. iter_25_4]

			var_25_14:removeAllChildrenWithCleanup(true)
			var_25_15:setVisible(false)
			arg_25_0.view.widgets["round" .. iter_25_4]:setString(iter_25_5.round)

			if var_25_1 >= iter_25_5.round then
				var_25_15:setVisible(true)

				var_25_13 = var_25_13 + 100 / var_25_12
			else
				tool.spriteToGray(var_25_14)

				local var_25_16 = iter_25_4 == 1 and 0 or arg_25_1.buff[iter_25_4 - 1].round

				if var_25_16 <= var_25_1 then
					var_25_13 = var_25_13 + 100 / var_25_12 * (var_25_1 - var_25_16) / (iter_25_5.round - var_25_16)
				end
			end
		end

		arg_25_0.view.widgets.bar2:setPercentage(var_25_13)

		local var_25_17 = arg_25_1.fairyState ~= 2

		arg_25_0.view.widgets.node_bell:setVisible(var_25_17)
		arg_25_0.view.widgets.btn_treasure1:setVisible(not var_25_17)

		if var_25_17 then
			for iter_25_6 = 1, 3 do
				arg_25_0.view.widgets["bell" .. iter_25_6]:setVisible(false)
			end

			for iter_25_7, iter_25_8 in ipairs(arg_25_1.fairyBalls) do
				arg_25_0.view.widgets["bell" .. iter_25_7]:setVisible(iter_25_8 == 1)
			end
		else
			arg_25_0.view.widgets.icon_treasure1:setDisplayFrame(tool.spriteFrameByName(arg_25_1.treasureInfo.pic .. ".jpg"))
		end

		for iter_25_9, iter_25_10 in ipairs(arg_25_1.rewards) do
			local var_25_18 = var_0_0[tonumber(iter_25_10.type)] or var_0_0[4]
			local var_25_19 = tonumber(iter_25_10.value)

			if var_25_19 > 100000 then
				var_25_19 = tool.getFormatNum(var_25_19)
			end

			arg_25_0.view.widgets["type" .. iter_25_9]:setString(string.format(" %s", language.get(var_25_18.txt)))
			arg_25_0.view.widgets["num" .. iter_25_9]:setString(var_25_19)
		end

		arg_25_0.view.widgets.richLine:reorder()
		arg_25_0.view.widgets.coverCdGold:setString(arg_25_1.coverCdGold)
	end

	arg_25_0.view.widgets.curRound:setString(tostring(var_25_1))
	arg_25_0.view.widgets.curRound1:setString(tostring(var_25_1))

	if var_25_3 then
		arg_25_0.view.widgets.icon_treasure2:setDisplayFrame(tool.spriteFrameByName(arg_25_1.treasureInfo.pic .. ".jpg"))
	end
end

function var_0_9.ctor(arg_26_0, arg_26_1, arg_26_2)
	log.info("@@ 圣诞送礼")
	rmgr.loadResource("res/ui/activity/gangMine/light.plist")

	arg_26_0.view = {}

	uiutil.initWidgets(arg_26_0.view, arg_26_0.layout)

	arg_26_0.leftTime = arg_26_0.view.widgets.leftTime

	if arg_26_1 then
		arg_26_0:addChild(arg_26_0.view.widgets.root)
		arg_26_1:addChild(arg_26_0)
	end

	arg_26_0.view.widgets.btn_mood:addHandleOfControlEvent(function()
		log.info("btn_mood")

		local var_27_0 = language.get(var_0_1[arg_26_0.info.mood].txt1)

		arg_26_0:showTip(arg_26_0.view.widgets.btn_mood, var_27_0)
	end, CCControlEventTouchUpInside)
	arg_26_0.view.widgets.btn_next:addHandleOfControlEvent(function()
		log.info("btn_next")
		arg_26_0:onEnterNext()
	end, CCControlEventTouchUpInside)
	arg_26_0.view.widgets.btn_give:addHandleOfControlEvent(function()
		log.info("btn_give")
		arg_26_0:onGiveAway()
	end, CCControlEventTouchUpInside)
	arg_26_0.view.widgets.btn_newRound:addHandleOfControlEvent(function()
		log.info("btn_newRound")
		arg_26_0:onStartNewRound()
	end, CCControlEventTouchUpInside)
	swallowTouch(arg_26_0.view.widgets.bg_treasure)

	for iter_26_0 = 1, 2 do
		local var_26_0 = CCArray:create()

		for iter_26_1 = 1, 25 do
			local var_26_1 = CCSprite:createWithSpriteFrameName(string.format("gang_mine_light_%d.png", iter_26_1))

			var_26_0:addObject(var_26_1:displayFrame())
		end

		local var_26_2 = CCAnimation:createWithSpriteFrames(var_26_0, 0.04)
		local var_26_3 = CCAnimate:create(var_26_2)

		arg_26_0.view.widgets["light_buff" .. iter_26_0]:runAction(CCRepeatForever:create(var_26_3))

		local var_26_4 = arg_26_0.view.widgets["btn_buff" .. iter_26_0]

		var_26_4:addHandleOfControlEvent(function()
			log.info("btn_buff" .. iter_26_0)

			local var_31_0 = string.format("%s\n%s", arg_26_0.info.buff[iter_26_0].name, arg_26_0.info.buff[iter_26_0].tips)

			arg_26_0:showTip(var_26_4, var_31_0)
		end, CCControlEventTouchUpInside)
	end

	for iter_26_2 = 1, 3 do
		local var_26_5 = arg_26_0.view.widgets["btn_bell" .. iter_26_2]

		var_26_5:addHandleOfControlEvent(function()
			log.info("btn_bell" .. iter_26_2)

			local var_32_0 = language.get(226110)

			arg_26_0:showTip(var_26_5, var_32_0)
		end, CCControlEventTouchUpInside)
	end

	for iter_26_3 = 1, 2 do
		local var_26_6 = arg_26_0.view.widgets["btn_treasure" .. iter_26_3]

		var_26_6:addHandleOfControlEvent(function()
			log.info("btn_treasure" .. iter_26_3)

			local var_33_0 = arg_26_0.info.treasureInfo
			local var_33_1 = language.get(135213, var_33_0.name, var_33_0.lea, var_33_0.str)

			arg_26_0:showTip(var_26_6, var_33_1)
		end, CCControlEventTouchUpInside)
	end

	arg_26_0.view.widgets.btn_getTreasure:addHandleOfControlEvent(function()
		log.info("btn_getTreasure")
		arg_26_0:onPlayWithFairy()
	end, CCControlEventTouchUpInside)
	arg_26_0:showPanel(arg_26_2)
end

return var_0_9
