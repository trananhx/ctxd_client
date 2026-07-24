local var_0_0 = colorQuality[0]
local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = ccc3(0, 180, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = class("ChangbanSally", function()
	return createBaseLayer()
end)

var_0_6.layout = {
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
					y = 2.5,
					name = "scrollView",
					type = "scrollview",
					x = 2.5,
					viewSize = CCSizeMake(910, 440),
					children = {
						{
							y = 0,
							name = "node_map",
							type = "node",
							x = 0,
							children = {
								{
									y = 0,
									name = "map",
									type = "sprite",
									x = -40,
									anchorPoint = ccp(0, 0),
									pic = {
										path = "res/ui/activity/changbanSally/cbtw_map_01.jpg"
									},
									children = {
										{
											y = 1575,
											name = "tent",
											type = "sprite",
											x = 3355,
											pic = {
												path = "res/ui/activity/changbanSally/cbtw_map_tent.png"
											}
										}
									}
								}
							}
						},
						{
							y = 0,
							name = "node_npc",
							type = "node",
							x = 0,
							children = {
								{
									name = "att",
									scale = 1.5,
									type = "sprite"
								},
								{
									name = "def",
									scale = 1.5,
									type = "sprite"
								}
							}
						}
					}
				},
				{
					y = 2.5,
					type = "sprite",
					x = 2.5,
					anchorPoint = ccp(0, 0),
					pic = {
						path = "res/ui/activity/changbanSally/cbtw_frame.png"
					}
				},
				{
					y = 480,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/activity/changbanSally/cbtw_title.png"
					}
				},
				{
					fontSize = 25,
					name = "leftTime",
					y = 470,
					type = "label",
					x = 780,
					color = var_0_3
				},
				{
					y = 465,
					type = "sprite",
					x = 60,
					pic = {
						path = "res/ui/activity/gangMine/blgkd_number_bg2.png"
					},
					children = {
						{
							y = 20,
							x = 10,
							type = "sprite",
							scale = 0.7,
							pic = {
								path = "res/ui/activity/generalDrink/jxj_2.png"
							}
						},
						{
							fontSize = 20,
							name = "wineNum",
							y = 13,
							type = "label",
							x = 30,
							color = var_0_4,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					y = 400,
					type = "sprite",
					x = 420,
					pic = {
						path = "res/ui/activity/changbanSally/cbtw_bar_bg.png"
					},
					children = {
						{
							y = 13,
							type = "sprite",
							x = 9,
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/activity/changbanSally/cbtw_bar_02.png"
							}
						},
						{
							y = 13,
							name = "bar_lvs",
							type = "progressbar",
							x = 9,
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/activity/changbanSally/cbtw_bar_01.png"
							}
						},
						{
							y = 0,
							name = "node_lvs",
							type = "node",
							x = 0,
							children = {}
						}
					}
				},
				{
					y = 360,
					type = "sprite",
					x = 74,
					pic = {
						path = "res/ui/activity/changbanSally/cbtw_number_di.png"
					},
					children = {
						{
							y = 30,
							x = 25,
							type = "sprite",
							scale = 0.7,
							pic = {
								path = "res/ui/activity/generalDrink/jxj_2.png"
							}
						},
						{
							y = 80,
							x = 68,
							type = "sprite",
							pic = {
								path = "res/ui/activity/changbanSally/cbtw_js_word_ljjl.png"
							}
						},
						{
							fontSize = 35,
							name = "rewardNum",
							y = 30,
							type = "label",
							x = 45,
							color = var_0_4,
							anchorPoint = ccp(0, 0.5)
						},
						{
							fontSize = 22,
							y = -3,
							type = "label",
							x = 3,
							textId = 215800,
							color = var_0_1,
							anchorPoint = ccp(0, 1)
						}
					}
				},
				{
					type = "node",
					name = "node_hp",
					y = 0,
					visible = false,
					x = 0,
					children = {
						{
							y = 102,
							type = "sprite",
							x = 130,
							pic = {
								path = "res/ui/buildEvent/jzcl_wjm_di.png"
							},
							children = {
								{
									y = 16,
									x = 64,
									type = "sprite",
									pic = {
										path = "res/ui/activity/changbanSally/cbtw_icon_love.png"
									}
								},
								{
									fontSize = 22,
									name = "hp",
									y = 16,
									type = "label",
									x = 80,
									color = var_0_1,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							y = 96,
							x = 36,
							type = "sprite",
							pic = {
								path = "res/ui/activity/changbanSally/cbtw_icon_wj.png"
							}
						},
						{
							y = 76,
							type = "sprite",
							x = 146,
							pic = {
								path = "res/ui/activity/changbanSally/cbtw_tl_bar_bg.png"
							},
							children = {
								{
									y = 13,
									name = "bar_hp",
									type = "progressbar",
									x = 9,
									anchorPoint = ccp(0, 0.5),
									pic = {
										path = "res/ui/activity/changbanSally/cbtw_tl_bar.png"
									}
								}
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_hp",
							h = 62,
							type = "button",
							w = 195,
							y = 36,
							x = 136,
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
											name = "buyHpGold",
											y = 15,
											type = "label",
											x = 42,
											color = var_0_4
										}
									}
								},
								{
									fontSize = 25,
									y = 33,
									type = "label",
									x = 125,
									textId = 215808,
									color = var_0_1
								}
							}
						},
						{
							type = "sprite",
							name = "no_hp",
							y = 250,
							visible = false,
							x = 400,
							pic = {
								path = "res/ui/activity/changbanSally/cbtw_word_tlbz.png"
							}
						}
					}
				},
				{
					type = "node",
					name = "node_tactic",
					y = 110,
					visible = false,
					x = 790,
					children = {
						{
							zoomOnTouchDown = true,
							name = "btn_t1",
							h = 70,
							type = "button",
							w = 70,
							y = -45,
							x = 78,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							},
							children = {
								{
									y = 35,
									x = 35,
									type = "sprite",
									pic = {
										path = "res/ui/activity/changbanSally/cbtw_btn_gj.png"
									}
								}
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_t2",
							h = 70,
							type = "button",
							w = 70,
							y = -45,
							x = -78,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							},
							children = {
								{
									y = 35,
									x = 35,
									type = "sprite",
									pic = {
										path = "res/ui/activity/changbanSally/cbtw_btn_fs.png"
									}
								}
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_t3",
							h = 70,
							type = "button",
							w = 70,
							y = 90,
							x = 0,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							},
							children = {
								{
									y = 35,
									x = 35,
									type = "sprite",
									pic = {
										path = "res/ui/activity/changbanSally/cbtw_btn_tj.png"
									}
								}
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_win",
							h = 90,
							type = "button",
							w = 90,
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
									y = 45,
									x = 45,
									type = "sprite",
									scale = 0.8,
									pic = {
										frame = true,
										path = "tactics_view_bg.png"
									},
									children = {
										{
											y = 78.5,
											x = 77.5,
											type = "sprite",
											scale = 1.13,
											pic = {
												path = "res/ui/common/fightPic/fightPic_zhaoyunjx.png"
											}
										}
									}
								},
								{
									fontSize = 22,
									name = "freeWinNum",
									style = "label_warlock",
									type = "label",
									y = 20,
									x = 45,
									color = var_0_4
								},
								{
									type = "sprite",
									name = "icon_winGold",
									x = 20,
									visible = false,
									y = 17,
									scale = 0.8,
									pic = {
										path = "res/ui/activity/ironRotary/yuanbao.png"
									}
								},
								{
									fontSize = 22,
									name = "winGold",
									style = "label_warlock",
									type = "label",
									y = 20,
									x = 39,
									color = var_0_4,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							y = 40,
							x = -69,
							type = "sprite",
							scale = 0.8,
							pic = {
								frame = true,
								path = "tactics_arrows_1.png"
							}
						},
						{
							y = 40,
							x = 69,
							type = "sprite",
							scale = 0.8,
							pic = {
								frame = true,
								path = "tactics_arrows_2.png"
							}
						},
						{
							y = -80,
							x = 0,
							type = "sprite",
							scale = 0.8,
							pic = {
								frame = true,
								path = "tactics_arrows_3.png"
							}
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_sally",
					h = 62,
					type = "button",
					w = 195,
					y = 50,
					visible = false,
					x = 458,
					normal = {
						path = "res/ui/common/button/public_btn_red.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_red_c.png"
					},
					children = {
						{
							fontSize = 25,
							name = "txt_sally",
							y = 34,
							type = "label",
							x = 97,
							textId = 215806,
							color = var_0_1
						}
					}
				},
				{
					y = 280,
					name = "node_hint",
					x = 590,
					type = "node"
				},
				{
					type = "node",
					name = "node_msg",
					y = 320,
					visible = false,
					x = 740,
					children = {
						{
							y = 0,
							name = "bg_msg",
							type = "sprite9",
							x = 0,
							preferedSize = CCSizeMake(200, 100),
							middleRect = CCRectMake(10, 10, 29, 29),
							pic = {
								frame = true,
								path = "common_tip_frame_small.png"
							},
							children = {
								{
									fontSize = 20,
									name = "msg",
									height = 0,
									type = "label",
									y = 10,
									width = 180,
									x = 10,
									color = var_0_1,
									halign = kCCTextAlignmentLeft,
									anchorPoint = ccp(0, 0)
								}
							}
						}
					}
				},
				{
					name = "bg_win",
					h = 532,
					type = "button",
					w = 915,
					y = 0,
					visible = false,
					x = 0,
					anchorPoint = ccp(0, 0),
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
							x = 457.5,
							anchorPoint = ccp(0.5, 0),
							pic = {
								path = "res/ui/activity/changbanSally/cbtw_js_bg.png"
							},
							children = {
								{
									y = 0,
									type = "sprite",
									x = 0,
									anchorPoint = ccp(0, 0),
									pic = {
										path = "res/ui/common/halfPic/halfPic_zhaoyunjx.png"
									}
								},
								{
									y = 245,
									x = 560,
									type = "sprite",
									pic = {
										path = "res/ui/activity/changbanSally/cbtw_js_word_zyddyzlxxzyxqdzlp.png"
									}
								},
								{
									y = 185,
									type = "sprite",
									x = 550,
									pic = {
										path = "res/ui/activity/changbanSally/cbtw_js_word_di.png"
									},
									children = {
										{
											y = 20,
											x = 106,
											type = "sprite",
											pic = {
												path = "res/ui/activity/changbanSally/cbtw_js_word_di_ink.png"
											}
										},
										{
											y = 20,
											x = 90,
											type = "sprite",
											pic = {
												path = "res/ui/activity/changbanSally/cbtw_word_sdtj.png"
											}
										},
										{
											y = 0,
											name = "node_kill",
											type = "node",
											x = 0,
											children = {
												{
													y = 20,
													name = "sp",
													type = "sprite",
													x = 200,
													pic = {
														path = "res/ui/activity/changbanSally/cbtw_bar_head_01.png"
													}
												},
												{
													fontSize = 22,
													name = "num",
													y = 20,
													type = "label",
													x = 220,
													anchorPoint = ccp(0, 0.5)
												},
												{
													y = 20,
													name = "sp_Copy",
													type = "sprite",
													x = 320,
													pic = {
														path = "res/ui/activity/changbanSally/cbtw_bar_head_01.png"
													}
												},
												{
													y = 20,
													name = "sp_Copy_Copy",
													type = "sprite",
													x = 440,
													pic = {
														path = "res/ui/activity/changbanSally/cbtw_bar_head_01.png"
													}
												}
											}
										}
									}
								},
								{
									y = 140,
									type = "sprite",
									x = 550,
									pic = {
										path = "res/ui/activity/changbanSally/cbtw_js_word_di.png"
									},
									children = {
										{
											y = 20,
											x = 106,
											type = "sprite",
											pic = {
												path = "res/ui/activity/changbanSally/cbtw_js_word_di_ink.png"
											}
										},
										{
											y = 20,
											x = 90,
											type = "sprite",
											pic = {
												path = "res/ui/activity/changbanSally/cbtw_js_word_ljjl.png"
											}
										},
										{
											x = 200,
											name = "sp",
											y = 20,
											type = "sprite",
											scale = 0.55,
											pic = {
												path = "res/ui/activity/generalDrink/jxj_2.png"
											}
										},
										{
											fontSize = 22,
											name = "rewardNum2",
											y = 20,
											type = "label",
											x = 225,
											anchorPoint = ccp(0, 0.5)
										}
									}
								},
								{
									y = 95,
									type = "sprite",
									x = 550,
									pic = {
										path = "res/ui/activity/changbanSally/cbtw_js_word_di.png"
									},
									children = {
										{
											y = 20,
											x = 106,
											type = "sprite",
											pic = {
												path = "res/ui/activity/changbanSally/cbtw_js_word_di_ink.png"
											}
										},
										{
											y = 20,
											x = 90,
											type = "sprite",
											pic = {
												path = "res/ui/activity/changbanSally/cbtw_js_word_tlhf.png"
											}
										},
										{
											y = 20,
											x = 198,
											type = "sprite",
											pic = {
												path = "res/ui/activity/changbanSally/cbtw_icon_love.png"
											}
										},
										{
											y = 22,
											x = 214,
											type = "sprite",
											pic = {
												path = "res/ui/activity/changbanSally/cbtw_icon_love_arrow.png"
											}
										},
										{
											fontSize = 22,
											name = "gainHp",
											y = 20,
											type = "label",
											x = 225,
											anchorPoint = ccp(0, 0.5)
										}
									}
								},
								{
									zoomOnTouchDown = true,
									name = "btn_reward",
									h = 62,
									type = "button",
									w = 195,
									y = 35,
									x = 452,
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
											textId = 92013,
											color = var_0_1
										}
									}
								}
							}
						}
					}
				},
				{
					y = 0,
					name = "node_effect",
					x = 0,
					type = "node"
				}
			}
		}
	}
}
var_0_6.layout_hint1 = {
	y = 0,
	name = "bg",
	type = "sprite",
	x = 0,
	anchorPoint = ccp(0, 0),
	pic = {
		path = "res/ui/activity/changbanSally/cbtw_bubble_s.png"
	},
	children = {
		{
			y = 42,
			name = "t1",
			type = "sprite",
			x = 125,
			pic = {
				path = "res/ui/activity/changbanSally/cbtw_icon_syfs.png"
			}
		}
	}
}
var_0_6.layout_hint2 = {
	y = 0,
	name = "bg",
	type = "sprite",
	x = 0,
	anchorPoint = ccp(0, 0),
	pic = {
		path = "res/ui/activity/changbanSally/cbtw_bubble.png"
	},
	children = {
		{
			y = 42,
			name = "t1",
			type = "sprite",
			x = 110,
			pic = {
				path = "res/ui/activity/changbanSally/cbtw_icon_sygj.png"
			}
		},
		{
			y = 42,
			name = "t2",
			type = "sprite",
			x = 200,
			pic = {
				path = "res/ui/activity/changbanSally/cbtw_icon_tj.png"
			}
		},
		{
			y = 45,
			x = 155,
			type = "sprite",
			pic = {
				path = "res/ui/activity/changbanSally/cbtw_word_huo.png"
			}
		}
	}
}
var_0_6.layout_hint3 = {
	y = 0,
	name = "bg",
	type = "sprite",
	x = 0,
	anchorPoint = ccp(0, 0),
	pic = {
		path = "res/ui/activity/changbanSally/cbtw_bubble.png"
	},
	children = {
		{
			x = 120,
			type = "sprite",
			y = 65,
			rotate = 20,
			scale = 0.3,
			pic = {
				frame = true,
				path = "tactics_arrows_1.png"
			}
		},
		{
			x = 190,
			type = "sprite",
			y = 65,
			rotate = -20,
			scale = 0.3,
			pic = {
				frame = true,
				path = "tactics_arrows_2.png"
			}
		},
		{
			y = 20,
			x = 155,
			type = "sprite",
			scale = 0.3,
			pic = {
				frame = true,
				path = "tactics_arrows_3.png"
			}
		},
		{
			y = 30,
			x = 200,
			type = "sprite",
			scale = 0.8,
			pic = {
				path = "res/ui/activity/changbanSally/cbtw_icon_syfs.png"
			}
		},
		{
			y = 30,
			x = 110,
			type = "sprite",
			scale = 0.8,
			pic = {
				path = "res/ui/activity/changbanSally/cbtw_icon_tj.png"
			}
		},
		{
			y = 70,
			x = 155,
			type = "sprite",
			scale = 0.8,
			pic = {
				path = "res/ui/activity/changbanSally/cbtw_icon_sygj.png"
			}
		}
	}
}

function var_0_6.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getChangbanActivity)
end

function var_0_6.onGetReward(arg_4_0, arg_4_1, arg_4_2)
	arg_4_2 = arg_4_2 or 0

	local function var_4_0(arg_5_0)
		local var_5_0 = arg_5_0.action.data

		if arg_4_1 == 0 then
			arg_4_0:showEffectSally()
		elseif arg_4_1 == 1 then
			arg_4_0:showEffectTactic(var_5_0, arg_4_2)
		elseif arg_4_1 == 2 then
			if arg_4_0.info.rewards and #arg_4_0.info.rewards > 0 then
				local var_5_1 = {}
				local var_5_2 = {}

				var_5_2.id = 114
				var_5_2.value = arg_4_0.info.rewards[1].num

				table.insert(var_5_1, var_5_2)
				globalAction_gotResource(var_5_1)
			end

			arg_4_0:refresh()
		end
	end

	cmgr.sendRequest(var_4_0, actions.getChangbanReward, arg_4_1, arg_4_2)
end

function var_0_6.onWin(arg_6_0)
	local function var_6_0(arg_7_0)
		local var_7_0 = arg_7_0.action.data

		arg_6_0:showEffectTactic(var_7_0, 0)
	end

	if arg_6_0.info.freeWinNum > 0 then
		cmgr.sendRequest(var_6_0, actions.changbanWin)
	else
		messageBox.showChargeWin("", language.get(215805, arg_6_0.info.winGold), "buyChangbanWin", function()
			cmgr.sendRequest(var_6_0, actions.changbanWin)
		end)
	end
end

function var_0_6.onBuyHp(arg_9_0)
	local function var_9_0(arg_10_0)
		local var_10_0 = arg_10_0.action.data

		arg_9_0:showEffectHp(var_10_0.addHp, function()
			arg_9_0:refresh()
		end)
	end

	messageBox.showChargeWin("", language.get(215802, arg_9_0.info.buyHpGold), "buyChangbanHp", function()
		cmgr.sendRequest(var_9_0, actions.changbanBuyHp)
	end)
end

function var_0_6.showEffectHp(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = CCSprite:create("res/ui/activity/changbanSally/cbtw_icon_love.png")
	local var_13_1
	local var_13_2

	if arg_13_1 > 0 then
		var_13_1 = string.format("+%d", arg_13_1)
		var_13_2 = var_0_2

		local var_13_3 = CCSprite:create("res/ui/activity/changbanSally/cbtw_icon_love_arrow.png")

		var_13_3:setPosition(35, 18)
		var_13_0:addChild(var_13_3)
	else
		var_13_1 = string.format("%d", arg_13_1)
		var_13_2 = var_0_3
	end

	local var_13_4 = CCStrokeLabelTTF:create(var_13_1, "Thonburi", 24)

	var_13_4:setColor(var_13_2)

	local var_13_5 = createRichNode({
		var_13_0,
		var_13_4
	}, 0.5)
	local var_13_6, var_13_7 = arg_13_0.view.widgets.att:getPosition()

	var_13_5:setPosition(var_13_6, var_13_7)
	arg_13_0.view.widgets.node_effect:addChild(var_13_5)

	local var_13_8 = CCArray:create()

	var_13_8:addObject(CCMoveBy:create(0.5, ccp(0, 30)))
	var_13_8:addObject(CCCallFunc:create(function()
		var_13_5:removeFromParentAndCleanup(true)

		if arg_13_2 then
			arg_13_2()
		end
	end))

	local var_13_9 = CCSequence:create(var_13_8)

	var_13_5:runAction(var_13_9)
end

function var_0_6.showEffectMap(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = CCArray:create()

	var_15_0:addObject(CCMoveTo:create(1, arg_15_1))
	var_15_0:addObject(CCCallFunc:create(function()
		if arg_15_2 then
			arg_15_2()
		end
	end))

	local var_15_1 = CCSequence:create(var_15_0)

	arg_15_0.view.widgets.map:runAction(var_15_1)
end

function var_0_6.showEffectArmy(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	local var_17_0
	local var_17_1

	if arg_17_1 == "att" then
		var_17_0 = arg_17_0.view.widgets.att
		var_17_1 = arg_17_0.animArrays1[arg_17_2]

		if not var_17_1 then
			arg_17_2 = "idle"
			var_17_1 = arg_17_0.animArrays1[arg_17_2]
		end

		arg_17_0.curAnim1 = arg_17_2
	else
		var_17_0 = arg_17_0.view.widgets.def
		var_17_1 = arg_17_0.animArrays2[arg_17_2]

		if not var_17_1 then
			arg_17_2 = "idle"
			var_17_1 = arg_17_0.animArrays2[arg_17_2]
		end

		arg_17_0.curAnim2 = arg_17_2
	end

	local var_17_2 = CCAnimation:createWithSpriteFrames(var_17_1, 0.05)
	local var_17_3 = CCAnimate:create(var_17_2)
	local var_17_4 = CCRepeat:create(var_17_3, arg_17_4 or 1)
	local var_17_5 = CCArray:create()

	var_17_5:addObject(var_17_4)
	var_17_5:addObject(CCCallFunc:create(function()
		if arg_17_3 then
			arg_17_3()
		end

		if arg_17_1 == "att" and arg_17_0.curAnim1 ~= "idle" or arg_17_1 == "def" and arg_17_0.curAnim2 ~= "idle" then
			arg_17_0:showEffectArmy(arg_17_1, "idle")
		end
	end))

	local var_17_6 = CCSequence:create(var_17_5)

	var_17_0:stopAllActions()
	var_17_0:runAction(var_17_6)
end

function var_0_6.showEffectTactic(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0.view.widgets.node_hp:setVisible(false)
	arg_19_0.view.widgets.node_tactic:setVisible(false)
	arg_19_0.view.widgets.node_hint:removeAllChildrenWithCleanup(true)

	local var_19_0 = arg_19_2
	local var_19_1 = arg_19_1.enemyTactic
	local var_19_2 = arg_19_1.win == true
	local var_19_3 = {
		[0] = "stategyBackground.png",
		"gongji.png",
		"fangshou.png",
		"tuji.png"
	}
	local var_19_4 = CCSprite:createWithSpriteFrameName(var_19_3[var_19_0])

	if var_19_0 == 0 then
		local var_19_5 = CCSprite:create("res/ui/common/fightPic/fightPic_zhaoyunjx.png")

		var_19_5:setPosition(50, 48.5)
		var_19_4:addChild(var_19_5)
	end

	local var_19_6 = CCSprite:createWithSpriteFrameName(var_19_3[var_19_1])

	var_19_4:setScale(0.5)
	var_19_6:setScale(0.5)
	var_19_4:setPosition(300, 240)
	var_19_6:setPosition(570, 360)
	arg_19_0.view.widgets.node_effect:addChild(var_19_4)
	arg_19_0.view.widgets.node_effect:addChild(var_19_6)

	local var_19_7 = CCArray:create()

	var_19_7:addObject(CCEaseExponentialOut:create(CCMoveTo:create(0.5, ccp(400, 280))))
	var_19_7:addObject(CCMoveBy:create(0.1, ccp(10, 4)))
	var_19_7:addObject(CCEaseElasticOut:create(CCMoveBy:create(0.5, ccp(-10, -4)), 0.2))

	if not var_19_2 then
		var_19_7:addObject(CCHide:create())
	end

	var_19_7:addObject(CCDelayTime:create(0.5))
	var_19_7:addObject(CCCallFunc:create(function()
		var_19_4:removeFromParentAndCleanup(true)
	end))

	local var_19_8 = CCSequence:create(var_19_7)

	var_19_4:runAction(var_19_8)

	local var_19_9 = CCArray:create()

	var_19_9:addObject(CCEaseExponentialOut:create(CCMoveTo:create(0.5, ccp(470, 320))))
	var_19_9:addObject(CCMoveBy:create(0.1, ccp(10, 4)))
	var_19_9:addObject(CCEaseElasticOut:create(CCMoveBy:create(0.5, ccp(-10, -4)), 0.2))

	if var_19_2 then
		var_19_9:addObject(CCHide:create())
	end

	var_19_9:addObject(CCDelayTime:create(0.5))
	var_19_9:addObject(CCCallFunc:create(function()
		var_19_6:removeFromParentAndCleanup(true)
	end))

	local var_19_10 = CCSequence:create(var_19_9)

	var_19_6:runAction(var_19_10)

	if var_19_2 then
		local var_19_11 = CCArray:create()

		var_19_11:addObject(CCDelayTime:create(1))
		var_19_11:addObject(CCCallFunc:create(function()
			arg_19_0:showEffectArmy("att", "attack")
		end))
		var_19_11:addObject(CCDelayTime:create(0.4))
		var_19_11:addObject(CCCallFunc:create(function()
			arg_19_0:showEffectArmy("def", "hitted")

			local var_23_0 = CCSprite:create()

			var_23_0:setPosition(350, 220)
			arg_19_0.view.widgets.node_effect:addChild(var_23_0)

			local var_23_1 = rmgr.getAnimation("juexingZhaoyun")
			local var_23_2 = CCAnimation:createWithSpriteFrames(var_23_1, 0.05)
			local var_23_3 = CCAnimate:create(var_23_2)
			local var_23_4 = CCArray:create()

			var_23_4:addObject(CCRepeat:create(var_23_3, 1))
			var_23_4:addObject(CCCallFunc:create(function()
				var_23_0:removeFromParentAndCleanup(true)
				arg_19_0.view.widgets.def:setVisible(false)
			end))
			var_23_0:runAction(CCSequence:create(var_23_4))
		end))
		var_19_11:addObject(CCDelayTime:create(0.4))
		var_19_11:addObject(CCCallFunc:create(function()
			if arg_19_1.rewards and #arg_19_1.rewards > 0 then
				local var_25_0 = arg_19_1.rewards[1].num

				for iter_25_0 = 1, var_25_0 do
					local var_25_1 = CCSprite:create("res/ui/activity/generalDrink/jxj_2.png")

					var_25_1:setScale(0.7)
					arg_19_0.view.widgets.node_effect:addChild(var_25_1)

					local var_25_2 = 570 + math.random(-100, 100)
					local var_25_3 = 200 + math.random(-20, 20)

					var_25_1:setPosition(570, 330)

					local var_25_4 = CCArray:create()

					var_25_4:addObject(CCEaseBounceOut:create(CCMoveTo:create(0.3, ccp(var_25_2, var_25_3))))
					var_25_4:addObject(CCDelayTime:create(0.3))
					var_25_4:addObject(CCEaseSineOut:create(CCMoveTo:create(0.6, ccp(74, 360))))
					var_25_4:addObject(CCCallFunc:create(function()
						var_25_1:removeFromParentAndCleanup(true)

						if iter_25_0 == 1 then
							local var_26_0 = 0

							if arg_19_0.info.rewards and #arg_19_0.info.rewards > 0 then
								var_26_0 = arg_19_0.info.rewards[1].num
							end

							local var_26_1 = var_26_0 + var_25_0

							arg_19_0.view.widgets.rewardNum:setString(language.get(135039, var_26_1))
							arg_19_0:showEffectHp(-1 * arg_19_1.lostHp)

							if arg_19_1.toNext and arg_19_1.toNext ~= 0 then
								local var_26_2 = arg_19_0.info.curLv

								if var_26_2 == 0 then
									var_26_2 = 1
								end

								local var_26_3 = var_26_2 / (#arg_19_0.info.lvs - 1)
								local var_26_4 = -40 - 2760 * var_26_3
								local var_26_5 = -1240 * var_26_3

								arg_19_0:showEffectArmy("att", "move", nil, 100)
								arg_19_0:showEffectMap(ccp(var_26_4, var_26_5), function()
									if arg_19_1.toNext == 1 then
										arg_19_0:showEffectArmy("att", "idle")
										arg_19_0:refresh()
									elseif arg_19_1.toNext == 2 then
										local var_27_0 = CCArray:create()

										var_27_0:addObject(CCMoveTo:create(0.6, ccp(550, 380)))
										var_27_0:addObject(CCHide:create())
										var_27_0:addObject(CCCallFunc:create(function()
											arg_19_0:refresh()
										end))
										arg_19_0.view.widgets.att:runAction(CCSequence:create(var_27_0))
									end
								end)
							end
						end
					end))
					var_25_1:runAction(CCSequence:create(var_25_4))
				end
			end
		end))

		local var_19_12 = CCSequence:create(var_19_11)

		arg_19_0.view.widgets.node_effect:runAction(var_19_12)
	else
		local var_19_13 = CCArray:create()

		var_19_13:addObject(CCDelayTime:create(1))
		var_19_13:addObject(CCCallFunc:create(function()
			arg_19_0:showEffectArmy("def", "attack")
		end))
		var_19_13:addObject(CCDelayTime:create(0.4))
		var_19_13:addObject(CCCallFunc:create(function()
			arg_19_0:showEffectArmy("att", "hitted")
			arg_19_0:showEffectHp(-1 * arg_19_1.lostHp)
		end))
		var_19_13:addObject(CCDelayTime:create(0.4))
		var_19_13:addObject(CCCallFunc:create(function()
			arg_19_0:refresh()
		end))

		local var_19_14 = CCSequence:create(var_19_13)

		arg_19_0.view.widgets.node_effect:runAction(var_19_14)
	end
end

function var_0_6.showEffectSally(arg_32_0)
	arg_32_0:showEffectArmy("att", "move", nil, 100)

	local var_32_0 = 0.5

	if arg_32_0.info.round == 1 then
		var_32_0 = 1
	end

	local var_32_1 = CCArray:create()

	var_32_1:addObject(CCMoveTo:create(var_32_0, ccp(300, 180)))
	var_32_1:addObject(CCCallFunc:create(function()
		arg_32_0:showEffectArmy("att", "idle")
		arg_32_0:refresh()
	end))

	local var_32_2 = CCSequence:create(var_32_1)

	arg_32_0.view.widgets.att:runAction(var_32_2)
end

function var_0_6.showPanel(arg_34_0, arg_34_1)
	arg_34_0.info = arg_34_1

	local var_34_0 = arg_34_1.round == 1
	local var_34_1 = arg_34_1.curLv == 0
	local var_34_2 = arg_34_1.win == true
	local var_34_3 = arg_34_1.canAttack == true

	arg_34_0.view.widgets.node_lvs:removeAllChildrenWithCleanup(true)

	local var_34_4 = #arg_34_1.lvs
	local var_34_5 = var_34_1 and 1 or arg_34_1.curLv

	for iter_34_0, iter_34_1 in ipairs(arg_34_1.lvs) do
		local var_34_6 = string.format("cbtw_bar_head_%02d.png", iter_34_1)
		local var_34_7 = 456 * (iter_34_0 - 1) / (var_34_4 - 1)

		if iter_34_1 == 4 then
			var_34_6 = "cbtw_icon_tent.png"
		end

		local var_34_8 = CCSprite:create("res/ui/activity/changbanSally/" .. var_34_6)

		var_34_8:setPosition(var_34_7, 20)

		if iter_34_0 < arg_34_1.curLv or iter_34_0 == var_34_4 and arg_34_1.curLv == var_34_4 then
			tool.spriteToGray(var_34_8)
		end

		arg_34_0.view.widgets.node_lvs:addChild(var_34_8)
	end

	local var_34_9 = (var_34_5 - 1) / (var_34_4 - 1)

	arg_34_0.view.widgets.bar_lvs:setPercentage(100 * var_34_9)

	if not var_34_0 then
		arg_34_0.view.widgets.map:setDisplayFrame(CCSprite:create("res/ui/activity/changbanSally/cbtw_map_02.jpg"):displayFrame())
	end

	local var_34_10 = -40 - 2760 * var_34_9
	local var_34_11 = -1240 * var_34_9

	arg_34_0.view.widgets.map:setPosition(var_34_10, var_34_11)
	arg_34_0.view.widgets.wineNum:setString(tostring(arg_34_1.wineNum or 0))

	local var_34_12 = language.get(135039, 0)

	if arg_34_1.rewards and #arg_34_1.rewards > 0 then
		var_34_12 = language.get(135039, arg_34_1.rewards[1].num)
	end

	arg_34_0.view.widgets.rewardNum:setString(var_34_12)
	arg_34_0.view.widgets.rewardNum2:setString(var_34_12)
	arg_34_0.view.widgets.node_msg:setVisible(not var_34_2 and not var_34_3)
	arg_34_0.view.widgets.node_hint:removeAllChildrenWithCleanup(true)

	if var_34_3 then
		local var_34_13 = {
			"cbtw_icon_sygj.png",
			"cbtw_icon_syfs.png",
			"cbtw_icon_tj.png"
		}
		local var_34_14 = {}

		if arg_34_1.tacticHint and #arg_34_1.tacticHint > 0 then
			if #arg_34_1.tacticHint == 1 then
				uiutil.initWidgets(var_34_14, arg_34_0.layout_hint1)
			elseif #arg_34_1.tacticHint == 2 then
				uiutil.initWidgets(var_34_14, arg_34_0.layout_hint2)
			end

			for iter_34_2, iter_34_3 in ipairs(arg_34_1.tacticHint) do
				var_34_14.widgets["t" .. iter_34_2]:setDisplayFrame(CCSprite:create("res/ui/activity/changbanSally/" .. var_34_13[iter_34_3]):displayFrame())
			end
		else
			uiutil.initWidgets(var_34_14, arg_34_0.layout_hint3)
		end

		arg_34_0.view.widgets.node_hint:addChild(var_34_14.widgets.bg)
	end

	arg_34_0.view.widgets.node_tactic:setVisible(not var_34_2 and not var_34_1)

	local var_34_15 = arg_34_1.freeWinNum > 0

	arg_34_0.view.widgets.freeWinNum:setVisible(var_34_15)
	arg_34_0.view.widgets.icon_winGold:setVisible(not var_34_15)
	arg_34_0.view.widgets.winGold:setVisible(not var_34_15)

	if var_34_15 then
		arg_34_0.view.widgets.freeWinNum:setString(language.get(215801, arg_34_1.freeWinNum))
	else
		arg_34_0.view.widgets.winGold:setString(language.get(135039, arg_34_1.winGold))
	end

	arg_34_0.view.widgets.bg_win:setVisible(var_34_2)

	if var_34_2 then
		arg_34_0.view.widgets.node_kill:removeAllChildrenWithCleanup(true)

		local var_34_16 = {
			0,
			0,
			0
		}

		for iter_34_4, iter_34_5 in ipairs(arg_34_1.lvs) do
			if iter_34_5 ~= 4 then
				var_34_16[iter_34_5] = var_34_16[iter_34_5] + 1
			end
		end

		local var_34_17 = 1

		for iter_34_6, iter_34_7 in ipairs(var_34_16) do
			if iter_34_7 > 0 then
				local var_34_18 = string.format("cbtw_bar_head_%02d.png", iter_34_6)
				local var_34_19 = CCSprite:create("res/ui/activity/changbanSally/" .. var_34_18)

				var_34_19:setPosition(200 + 120 * (var_34_17 - 1), 22)
				arg_34_0.view.widgets.node_kill:addChild(var_34_19)

				local var_34_20 = CCLabelTTF:create(language.get(135039, iter_34_7), "Thonburi", 20)

				var_34_20:setAnchorPoint(ccp(0, 0.5))
				var_34_20:setPosition(225 + 120 * (var_34_17 - 1), 20)
				arg_34_0.view.widgets.node_kill:addChild(var_34_20)

				var_34_17 = var_34_17 + 1
			end
		end

		arg_34_0.view.widgets.gainHp:setString(string.format("+%s", arg_34_1.gainHp))
	end

	arg_34_0.view.widgets.node_hp:setVisible(not var_34_1)

	if not var_34_1 then
		arg_34_0.view.widgets.hp:setString(language.get(213297, arg_34_1.hp, arg_34_1.hpMax))
		arg_34_0.view.widgets.bar_hp:setPercentage(100 * arg_34_1.hp / arg_34_1.hpMax)
		arg_34_0.view.widgets.buyHpGold:setString(arg_34_1.buyHpGold)
		arg_34_0.view.widgets.no_hp:setVisible(arg_34_1.hp == 0)
	end

	arg_34_0.view.widgets.btn_sally:setVisible(var_34_1)

	if var_34_1 and not var_34_0 then
		arg_34_0.view.widgets.txt_sally:setString(language.get(215807))
	end

	if not var_34_2 then
		arg_34_0.animArrays1 = rmgr.getArmy("att", 43)

		local var_34_21

		if var_34_1 then
			var_34_21 = arg_34_1.lvs[1]
		else
			var_34_21 = arg_34_1.lvs[arg_34_1.curLv]
		end

		local var_34_22 = {
			240,
			260,
			330
		}
		local var_34_23 = {
			2,
			28,
			40
		}

		arg_34_0.animArrays2 = rmgr.getArmy("def", var_34_23[var_34_21])

		local var_34_24
		local var_34_25

		if var_34_1 then
			if var_34_0 then
				var_34_24, var_34_25 = -150, -70
			else
				var_34_24, var_34_25 = 220, 110
			end
		else
			var_34_24, var_34_25 = 300, 180
		end

		arg_34_0.view.widgets.att:setPosition(var_34_24, var_34_25)
		arg_34_0.view.widgets.def:setPosition(570, var_34_22[var_34_21])
		arg_34_0.view.widgets.att:setVisible(true)
		arg_34_0.view.widgets.def:setVisible(true)
		arg_34_0:showEffectArmy("att", "idle")
		arg_34_0:showEffectArmy("def", "idle")
	end
end

function var_0_6.ctor(arg_35_0, arg_35_1, arg_35_2)
	log.info("@@ 长坂突围活动")
	rmgr.loadResource("res/ui/battle/battle.plist")
	rmgr.loadResource("res/ui/battle/tractics/tractics.plist")
	rmgr.loadResource("res/ui/battle/tractics/tacticsSelect.plist")
	math.randomseed(os.time())

	arg_35_0.view = {}

	uiutil.initWidgets(arg_35_0.view, arg_35_0.layout)

	arg_35_0.leftTime = arg_35_0.view.widgets.leftTime

	if arg_35_1 then
		arg_35_0:addChild(arg_35_0.view.widgets.root)
		arg_35_1:addChild(arg_35_0)
	end

	arg_35_0.view.widgets.scrollView:setTouchEnabled(false)
	arg_35_0.view.widgets.btn_sally:addHandleOfControlEvent(function()
		log.info("btn_sally")
		arg_35_0:onGetReward(0)
	end, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.btn_hp:addHandleOfControlEvent(function()
		log.info("btn_hp")
		arg_35_0:onBuyHp()
	end, CCControlEventTouchUpInside)

	for iter_35_0 = 1, 3 do
		arg_35_0.view.widgets["btn_t" .. iter_35_0]:addHandleOfControlEvent(function()
			log.info("btn_t" .. iter_35_0)
			arg_35_0:onGetReward(1, iter_35_0)
		end, CCControlEventTouchUpInside)
	end

	arg_35_0.view.widgets.btn_win:addHandleOfControlEvent(function()
		log.info("btn_win")
		arg_35_0:onWin()
	end, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.btn_reward:addHandleOfControlEvent(function()
		log.info("btn_reward")
		arg_35_0:onGetReward(2)
	end, CCControlEventTouchUpInside)

	local var_35_0 = CCArray:create()

	var_35_0:addObject(CCShow:create())
	var_35_0:addObject(CCCallFunc:create(function()
		arg_35_0.view.widgets.msg:setString(language.get(math.random(215811, 215817)))

		local var_41_0 = arg_35_0.view.widgets.msg:getContentSize()

		arg_35_0.view.widgets.bg_msg:setPreferredSize(CCSizeMake(var_41_0.width + 20, var_41_0.height + 20))
	end))
	var_35_0:addObject(CCDelayTime:create(3))
	var_35_0:addObject(CCHide:create())
	var_35_0:addObject(CCDelayTime:create(1))

	local var_35_1 = CCSequence:create(var_35_0)

	arg_35_0.view.widgets.bg_msg:runAction(CCRepeatForever:create(var_35_1))

	local var_35_2 = CCArray:create()

	var_35_2:addObject(CCScaleTo:create(0.8, 1.2))
	var_35_2:addObject(CCScaleTo:create(0.4, 1))

	local var_35_3 = CCSequence:create(var_35_2)

	arg_35_0.view.widgets.no_hp:runAction(CCRepeatForever:create(var_35_3))
	arg_35_0:showPanel(arg_35_2)
end

return var_0_6
