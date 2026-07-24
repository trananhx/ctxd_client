local var_0_0 = class("DrillView", function()
	return createBaseLayer()
end)

var_0_0.layout = {
	name = "root",
	type = "node",
	x = visibleSize.width / 2,
	y = visibleSize.height / 2 - 30,
	children = {
		{
			y = 0,
			name = "panel",
			type = "sprite9",
			x = 0,
			preferedSize = CCSizeMake(960, 580),
			middleRect = CCRectMake(45, 30, 15, 45),
			pic = {
				frame = true,
				path = "bigPanel.png"
			},
			children = {
				{
					y = 290,
					name = "jbyw_bg",
					type = "sprite",
					x = 480,
					pic = {
						path = "res/ui/ywTask/jbyw_bg.jpg"
					},
					children = {
						{
							y = 480,
							name = "jbyw_title",
							type = "sprite",
							x = 457.5,
							pic = {
								path = "res/ui/ywTask/jbyw_title.png"
							}
						},
						{
							y = 480,
							name = "btn_tip",
							style = "button_tip",
							type = "button",
							x = 600
						},
						{
							y = 413,
							name = "ltzbs_word_zbf",
							type = "sprite",
							x = 91,
							pic = {
								path = "res/ui/nationTask/arena/ltzbs_word_zbf.png"
							}
						},
						{
							y = 413,
							name = "ltzbs_word_di_ink",
							type = "sprite",
							x = 255,
							pic = {
								path = "res/ui/nationTask/arena/ltzbs_word_di_ink.png"
							}
						},
						{
							y = 413,
							name = "ltzbs_word_di_ink_2",
							type = "sprite",
							x = 484.9998,
							pic = {
								path = "res/ui/nationTask/arena/ltzbs_word_di_ink.png"
							}
						},
						{
							y = 413,
							name = "ltzbs_word_di_ink_3",
							type = "sprite",
							x = 714.9993,
							pic = {
								path = "res/ui/nationTask/arena/ltzbs_word_di_ink.png"
							}
						},
						{
							y = 413,
							name = "role_nation_view",
							type = "sprite",
							x = 215,
							pic = {
								path = "res/ui/playerInfo/role_nation_view.png"
							}
						},
						{
							y = 413,
							name = "role_nation_view_2",
							type = "sprite",
							x = 445,
							pic = {
								path = "res/ui/playerInfo/role_nation_view.png"
							}
						},
						{
							y = 413,
							name = "role_nation_view_3",
							type = "sprite",
							x = 675,
							pic = {
								path = "res/ui/playerInfo/role_nation_view.png"
							}
						},
						{
							fontSize = 36,
							name = "weiLb",
							y = 413,
							type = "label",
							x = 215,
							color = colorForce[1]
						},
						{
							name = "score1",
							type = "atlaslabel",
							pic = "res/ui/common/number/mnlm_word_time_numb.png",
							startCharMap = 48,
							text = "0",
							y = 413,
							itemWidth = 20,
							x = 270,
							itemHeight = 30,
							anchorPoint = ccp(0, 0.5)
						},
						{
							fontSize = 36,
							name = "shuLb",
							y = 413,
							type = "label",
							x = 445,
							color = colorForce[2]
						},
						{
							name = "score2",
							type = "atlaslabel",
							pic = "res/ui/common/number/mnlm_word_time_numb.png",
							startCharMap = 48,
							text = "0",
							y = 413,
							itemWidth = 20,
							x = 500,
							itemHeight = 30,
							anchorPoint = ccp(0, 0.5)
						},
						{
							fontSize = 36,
							name = "wuLb",
							y = 413,
							type = "label",
							x = 675,
							color = colorForce[3]
						},
						{
							name = "score3",
							type = "atlaslabel",
							pic = "res/ui/common/number/mnlm_word_time_numb.png",
							startCharMap = 48,
							text = "0",
							y = 413,
							itemWidth = 20,
							x = 730,
							itemHeight = 30,
							anchorPoint = ccp(0, 0.5)
						}
					}
				}
			}
		},
		{
			fontSize = 24,
			name = "nationTaskTimeInfoText",
			y = 95.0001,
			type = "label",
			visible = true,
			x = 0
		},
		{
			y = 0,
			name = "nationFight",
			visible = false,
			type = "node",
			x = 0,
			children = {
				{
					y = -64.0001,
					name = "nationFightRenderer1",
					type = "sprite",
					x = -341.0001,
					pic = {
						path = "res/ui/ywTask/jbyw_card_di.png"
					},
					children = {
						{
							fontSize = 24,
							name = "fightNumText1",
							y = 244,
							type = "label",
							x = 116
						},
						{
							y = 0,
							name = "fightInfoSp1",
							type = "node",
							x = 0,
							children = {
								{
									y = 166,
									name = "jbyw_head_di",
									type = "sprite",
									x = 116,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_rolehead_di.png"
									}
								},
								{
									y = 166,
									name = "playerHead_icon_1",
									type = "sprite",
									x = 116,
									pic = {
										path = "res/ui/common/playerHead/playerHead_icon_1.png"
									}
								},
								{
									y = 95,
									name = "jbyw_card_name_di",
									type = "sprite",
									x = 116,
									pic = {
										path = "res/ui/ywTask/jbyw_card_name_di.png"
									}
								},
								{
									fontSize = 20,
									name = "playerNameText1",
									y = 95,
									type = "label",
									x = 116
								},
								{
									y = 64,
									name = "jbyw_card_word_di",
									type = "sprite",
									x = 116,
									pic = {
										path = "res/ui/ywTask/jbyw_card_word_di.png"
									}
								},
								{
									y = 65,
									name = "jbyw_card_list_icon",
									type = "sprite",
									x = 40,
									pic = {
										path = "res/ui/ywTask/jbyw_card_list_icon.png"
									}
								},
								{
									fontSize = 20,
									name = "groupNumText1",
									y = 65,
									type = "label",
									x = 116
								},
								{
									w = 42,
									name = "downBtn1",
									h = 30,
									type = "button",
									y = 65,
									x = 200,
									normal = {
										path = "res/ui/ywTask/jbyw_card_btn.png"
									},
									touched = {
										path = "res/ui/ywTask/jbyw_card_btn_c.png"
									}
								},
								{
									visible = false,
									name = "actionbtn1",
									h = 43,
									type = "button",
									w = 137,
									y = 26,
									x = 116,
									normal = {
										path = "res/ui/common/button/public_btn_green70.png"
									},
									touched = {
										path = "res/ui/common/button/public_btn_green70_c.png"
									},
									children = {
										{
											fontSize = 20,
											style = "label_warlock",
											name = "actionbtnLb1",
											type = "label",
											y = 24,
											x = 68.5,
											color = color_whi
										}
									}
								},
								{
									fontSize = 20,
									name = "infoTipText1",
									y = 28,
									type = "label",
									x = 116,
									color = colorQuality[4]
								},
								{
									y = 0,
									name = "playerListBg1",
									x = 0,
									type = "node"
								}
							}
						},
						{
							y = 116,
							name = "fightResult1",
							type = "sprite",
							visible = false,
							x = 116,
							pic = {
								path = "res/ui/ywTask/jbyw_word_sl.png"
							}
						}
					}
				},
				{
					y = -64.0001,
					name = "nationFightRenderer2",
					type = "sprite",
					x = -115.0002,
					pic = {
						path = "res/ui/ywTask/jbyw_card_di.png"
					},
					children = {
						{
							fontSize = 24,
							name = "fightNumText2",
							y = 244,
							type = "label",
							x = 116
						},
						{
							y = 0,
							name = "fightInfoSp2",
							type = "node",
							x = 0,
							children = {
								{
									y = 166,
									name = "jbyw_head_di_Copy",
									type = "sprite",
									x = 116,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_rolehead_di.png"
									}
								},
								{
									y = 166,
									name = "playerHead_icon_2",
									type = "sprite",
									x = 116,
									pic = {
										path = "res/ui/common/playerHead/playerHead_icon_1.png"
									}
								},
								{
									y = 95,
									name = "jbyw_card_name_di_Copy",
									type = "sprite",
									x = 116,
									pic = {
										path = "res/ui/ywTask/jbyw_card_name_di.png"
									}
								},
								{
									fontSize = 20,
									name = "playerNameText2",
									y = 95,
									type = "label",
									x = 116
								},
								{
									y = 64,
									name = "jbyw_card_word_di_Copy",
									type = "sprite",
									x = 116,
									pic = {
										path = "res/ui/ywTask/jbyw_card_word_di.png"
									}
								},
								{
									y = 65,
									name = "jbyw_card_list_icon_Copy",
									type = "sprite",
									x = 40,
									pic = {
										path = "res/ui/ywTask/jbyw_card_list_icon.png"
									}
								},
								{
									fontSize = 20,
									name = "groupNumText2",
									y = 65,
									type = "label",
									x = 116
								},
								{
									w = 42,
									name = "downBtn2",
									h = 30,
									type = "button",
									y = 65,
									x = 200,
									normal = {
										path = "res/ui/ywTask/jbyw_card_btn.png"
									},
									touched = {
										path = "res/ui/ywTask/jbyw_card_btn_c.png"
									}
								},
								{
									visible = false,
									name = "actionbtn2",
									h = 43,
									type = "button",
									w = 137,
									y = 26,
									x = 116,
									normal = {
										path = "res/ui/common/button/public_btn_green70.png"
									},
									touched = {
										path = "res/ui/common/button/public_btn_green70_c.png"
									},
									children = {
										{
											fontSize = 20,
											style = "label_warlock",
											name = "actionbtnLb2",
											type = "label",
											y = 24,
											x = 68.5,
											color = color_whi
										}
									}
								},
								{
									fontSize = 20,
									name = "infoTipText2",
									y = 28,
									type = "label",
									x = 116,
									color = colorQuality[4]
								},
								{
									y = 0,
									name = "playerListBg2",
									x = 0,
									type = "node"
								}
							}
						},
						{
							y = 116,
							name = "fightResult2",
							type = "sprite",
							visible = false,
							x = 116,
							pic = {
								path = "res/ui/ywTask/jbyw_word_sl.png"
							}
						}
					}
				},
				{
					y = -64.0001,
					name = "nationFightRenderer3",
					type = "sprite",
					x = 111.9998,
					pic = {
						path = "res/ui/ywTask/jbyw_card_di.png"
					},
					children = {
						{
							fontSize = 24,
							name = "fightNumText3",
							y = 244,
							type = "label",
							x = 116
						},
						{
							y = 0,
							name = "fightInfoSp3",
							type = "node",
							x = 0,
							children = {
								{
									y = 166,
									name = "jbyw_head_di_Copy",
									type = "sprite",
									x = 116,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_rolehead_di.png"
									}
								},
								{
									y = 166,
									name = "playerHead_icon_3",
									type = "sprite",
									x = 116,
									pic = {
										path = "res/ui/common/playerHead/playerHead_icon_1.png"
									}
								},
								{
									y = 95,
									name = "jbyw_card_name_di_Copy",
									type = "sprite",
									x = 116,
									pic = {
										path = "res/ui/ywTask/jbyw_card_name_di.png"
									}
								},
								{
									fontSize = 20,
									name = "playerNameText3",
									y = 95,
									type = "label",
									x = 116
								},
								{
									y = 64,
									name = "jbyw_card_word_di_Copy",
									type = "sprite",
									x = 116,
									pic = {
										path = "res/ui/ywTask/jbyw_card_word_di.png"
									}
								},
								{
									y = 65,
									name = "jbyw_card_list_icon_Copy",
									type = "sprite",
									x = 40,
									pic = {
										path = "res/ui/ywTask/jbyw_card_list_icon.png"
									}
								},
								{
									fontSize = 20,
									name = "groupNumText3",
									y = 65,
									type = "label",
									x = 116
								},
								{
									w = 42,
									name = "downBtn3",
									h = 30,
									type = "button",
									y = 65,
									x = 200,
									normal = {
										path = "res/ui/ywTask/jbyw_card_btn.png"
									},
									touched = {
										path = "res/ui/ywTask/jbyw_card_btn_c.png"
									}
								},
								{
									visible = false,
									name = "actionbtn3",
									h = 43,
									type = "button",
									w = 137,
									y = 26,
									x = 116,
									normal = {
										path = "res/ui/common/button/public_btn_green70.png"
									},
									touched = {
										path = "res/ui/common/button/public_btn_green70_c.png"
									},
									children = {
										{
											fontSize = 20,
											style = "label_warlock",
											name = "actionbtnLb3",
											type = "label",
											y = 24,
											x = 68.5,
											color = color_whi
										}
									}
								},
								{
									fontSize = 20,
									name = "infoTipText3",
									y = 28,
									type = "label",
									x = 116,
									color = colorQuality[4]
								},
								{
									y = 0,
									name = "playerListBg3",
									x = 0,
									type = "node"
								}
							}
						},
						{
							y = 116,
							name = "fightResult3",
							type = "sprite",
							visible = false,
							x = 116,
							pic = {
								path = "res/ui/ywTask/jbyw_word_sl.png"
							}
						}
					}
				},
				{
					y = -64,
					name = "nationFightRenderer4",
					type = "sprite",
					x = 340,
					pic = {
						path = "res/ui/ywTask/jbyw_card_di.png"
					},
					children = {
						{
							fontSize = 24,
							name = "fightNumText4",
							y = 244,
							type = "label",
							x = 116
						},
						{
							y = 0,
							name = "fightInfoSp4",
							type = "node",
							x = 0,
							children = {
								{
									y = 166,
									name = "jbyw_head_di_Copy",
									type = "sprite",
									x = 116,
									pic = {
										path = "res/ui/kfyz/threeRoad/bfslyz_rolehead_di.png"
									}
								},
								{
									y = 166,
									name = "playerHead_icon_4",
									type = "sprite",
									x = 116,
									pic = {
										path = "res/ui/common/playerHead/playerHead_icon_1.png"
									}
								},
								{
									y = 95,
									name = "jbyw_card_name_di_Copy",
									type = "sprite",
									x = 116,
									pic = {
										path = "res/ui/ywTask/jbyw_card_name_di.png"
									}
								},
								{
									fontSize = 20,
									name = "playerNameText4",
									y = 95,
									type = "label",
									x = 116
								},
								{
									y = 64,
									name = "jbyw_card_word_di_Copy",
									type = "sprite",
									x = 116,
									pic = {
										path = "res/ui/ywTask/jbyw_card_word_di.png"
									}
								},
								{
									y = 65,
									name = "jbyw_card_list_icon_Copy",
									type = "sprite",
									x = 40,
									pic = {
										path = "res/ui/ywTask/jbyw_card_list_icon.png"
									}
								},
								{
									fontSize = 20,
									name = "groupNumText4",
									y = 65,
									type = "label",
									x = 116
								},
								{
									w = 42,
									name = "downBtn4",
									h = 30,
									type = "button",
									y = 65,
									x = 200,
									normal = {
										path = "res/ui/ywTask/jbyw_card_btn.png"
									},
									touched = {
										path = "res/ui/ywTask/jbyw_card_btn_c.png"
									}
								},
								{
									visible = false,
									name = "actionbtn4",
									h = 43,
									type = "button",
									w = 137,
									y = 26,
									x = 116,
									normal = {
										path = "res/ui/common/button/public_btn_green70.png"
									},
									touched = {
										path = "res/ui/common/button/public_btn_green70_c.png"
									},
									children = {
										{
											fontSize = 20,
											style = "label_warlock",
											name = "actionbtnLb4",
											type = "label",
											y = 24,
											x = 68.5,
											color = color_whi
										}
									}
								},
								{
									fontSize = 20,
									name = "infoTipText4",
									y = 28,
									type = "label",
									x = 116,
									color = colorQuality[4]
								},
								{
									y = 0,
									name = "playerListBg4",
									x = 0,
									type = "node"
								}
							}
						},
						{
							y = 116,
							name = "fightResult4",
							type = "sprite",
							visible = false,
							x = 116,
							pic = {
								path = "res/ui/ywTask/jbyw_word_sl.png"
							}
						}
					}
				}
			}
		},
		{
			name = "freeFightBtn",
			h = 56,
			type = "button",
			w = 212,
			visible = false,
			y = -235.0013,
			x = 0,
			normal = {
				path = "res/ui/common/button/sdyjs_btn_02.png"
			},
			touched = {
				path = "res/ui/common/button/sdyjs_btn_02_c.png"
			},
			disable = {
				path = "res/ui/common/button/sdyjs_btn_02_g.png"
			},
			children = {
				{
					y = 31.9999,
					name = "freeFightOpenText",
					type = "sprite",
					x = 41,
					pic = {
						path = "res/ui/ywTask/jbyw_word_ykq.png"
					}
				},
				{
					fontSize = 24,
					name = "freeFightBtnLb",
					style = "label_warlock",
					type = "label",
					y = 35,
					x = 127.9999,
					textId = 215156,
					color = color_whi
				},
				{
					fontSize = 20,
					name = "freeFightAddDownTimeText",
					y = 13,
					type = "label",
					x = 41
				}
			}
		},
		{
			visible = false,
			name = "backNationFightBtn",
			h = 62,
			type = "button",
			w = 195,
			y = -235,
			x = 0,
			normal = {
				path = "res/ui/common/button/public_btn_red.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_red_c.png"
			},
			children = {
				{
					fontSize = 24,
					name = "btnStateText",
					y = 34.0001,
					type = "label",
					x = 97.5
				}
			}
		},
		{
			y = 0,
			name = "freeFight",
			visible = false,
			type = "node",
			x = 0,
			children = {
				{
					y = -72.0001,
					name = "jbyw_baoming_di",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/ywTask/jbyw_baoming_di.png"
					}
				},
				{
					fontSize = 24,
					name = "introText",
					y = -157.0003,
					type = "label",
					x = 0
				},
				{
					y = 0,
					name = "fightInfoList",
					x = 0,
					type = "node"
				}
			}
		},
		{
			fontSize = 24,
			name = "infoTipText",
			y = -228,
			type = "label",
			x = 0
		},
		{
			visible = false,
			name = "drillFightReward",
			y = 0,
			type = "node",
			x = 0,
			children = {
				{
					y = -60,
					name = "rwyh_jl_bg",
					type = "sprite",
					x = 119.9997,
					pic = {
						path = "res/ui/nationTask/newPic/rwyh_jl_bg.png"
					}
				},
				{
					y = 0,
					name = "rwyh_icon03",
					type = "sprite",
					x = -112,
					pic = {
						path = "res/ui/nationTask/newPic/rwyh_icon03.png"
					}
				},
				{
					x = -282.0011,
					name = "xiaoqian",
					y = -66,
					type = "sprite",
					scale = 0.7,
					pic = {
						path = "res/ui/comment/xiaoqian.png"
					}
				},
				{
					y = 0,
					name = "rewardList",
					x = 0,
					type = "node"
				},
				{
					y = 94,
					name = "jbyw_word_wgrhd",
					type = "sprite",
					x = -35.0001,
					pic = {
						path = "res/ui/ywTask/jbyw_word_wgrhd.png"
					}
				},
				{
					y = 94,
					name = "jbyw_word_wgrh_m",
					type = "sprite",
					x = 100.2365,
					pic = {
						path = "res/ui/ywTask/jbyw_word_wgrh_m.png"
					}
				},
				{
					fontSize = 36,
					name = "rewardRank",
					y = 94.0001,
					type = "label",
					x = 63.9995
				},
				{
					name = "getBtn",
					h = 62,
					type = "button",
					w = 195,
					y = -200.0002,
					x = 54.9999,
					normal = {
						path = "res/ui/common/button/public_btn_green.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_green_c.png"
					},
					children = {
						{
							fontSize = 28,
							name = "getBtnLb",
							style = "label_warlock",
							type = "label",
							y = 33.9999,
							x = 97.5,
							textId = 95047,
							color = color_whi
						}
					}
				}
			}
		}
	}
}

function var_0_0.getSignLayOut(arg_2_0, arg_2_1)
	return {
		y = 0,
		type = "sprite",
		x = 0,
		name = "bg" .. arg_2_1,
		pic = {
			path = "res/default.png"
		},
		children = {
			{
				y = 0,
				type = "sprite",
				x = 0,
				name = "signHeadBg" .. arg_2_1,
				pic = {
					path = "res/ui/kfyz/threeRoad/bfslyz_rolehead_di.png"
				}
			},
			{
				y = 0,
				type = "sprite",
				x = 0,
				name = "signHeadIcon" .. arg_2_1,
				pic = {
					path = "res/ui/common/playerHead/playerHead_icon_1.png"
				}
			},
			{
				fontSize = 20,
				y = -75,
				type = "label",
				x = 0,
				name = "signNameLb" .. arg_2_1
			},
			{
				y = -75,
				h = 58,
				type = "button",
				w = 97,
				x = 0,
				name = "signBtn" .. arg_2_1,
				normal = {
					frame = true,
					path = "btn1_gre_a.png"
				},
				touched = {
					frame = true,
					path = "btn1_gre_c.png"
				},
				children = {
					{
						fontSize = 20,
						y = 30,
						type = "label",
						x = 48.5,
						textId = 215103
					}
				}
			}
		}
	}
end

local var_0_1 = {
	y = 0,
	name = "bg",
	type = "sprite",
	x = 0,
	pic = {
		frame = true,
		path = "jianglikuang1.png"
	},
	children = {
		{
			y = 44,
			name = "icon",
			type = "sprite",
			x = 39.5,
			zorder = 10
		},
		{
			y = 20,
			name = "txt",
			type = "sprite",
			x = 39.5,
			zorder = 10
		},
		{
			type = "sprite",
			name = "corner",
			y = 54,
			visible = false,
			x = 23,
			zorder = 10,
			pic = {
				frame = true,
				path = "nation_task_win_icon.png"
			}
		},
		{
			fontSize = 20,
			name = "num",
			y = -10,
			type = "label",
			x = 39.5,
			color = color_yel
		}
	}
}
local var_0_2 = {
	[4] = {
		txt = "get_rewa_iron.png",
		pic = "get_icon_iron.png",
		type = 4
	},
	[10] = {
		txt = "get_rewa_exp.png",
		pic = "get_icon_exp.png",
		type = 6
	},
	[17] = {
		txt = "get_rewa_gem.png",
		pic = "get_icon_gem.png",
		type = 7
	},
	[21] = {
		type = 55
	},
	[216] = {
		txt = "get_rewa_yuntie.png",
		pic = "get_icon_yt.png",
		type = 216
	},
	[237] = {
		txt = "get_rewa_js.png",
		pic = "get_icon_gemjs.png",
		type = 237
	},
	[1901] = {
		type = 1901
	},
	[1902] = {
		type = 1902
	},
	[1903] = {
		type = 1903
	},
	[1904] = {
		type = 1904
	},
	[1905] = {
		type = 1905
	}
}
local var_0_3 = {
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
			width = 300,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}

function var_0_0.showHelpTip(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	log.info("should show tips ")

	local var_3_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_3_0:registerScriptTouchHandler(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == CCTOUCHBEGAN then
			return true
		elseif arg_4_0 == CCTOUCHMOVED then
			return true
		elseif arg_4_0 == CCTOUCHENDED then
			pcall(var_3_0.removeFromParentAndCleanup, var_3_0, true)

			arg_3_0.view.widgets.tipFrame = nil

			return true
		end
	end, false, true)
	var_3_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_3_0, 60000)

	if arg_3_1 then
		local var_3_1 = 0
		local var_3_2 = 0

		if arg_3_0.view == nil then
			arg_3_0.view = {}
		end

		uiutil.initWidgets(arg_3_0.view, var_0_3)
		arg_3_0.view.widgets.tipFrame:setAnchorPoint(ccp(1, 0))
		var_3_0:addChild(arg_3_0.view.widgets.tipFrame)

		local var_3_3, var_3_4 = tool.getPositionInScreen(arg_3_0.view.widgets[arg_3_2])
		local var_3_5 = var_3_3 + 20
		local var_3_6 = var_3_4 + 20

		if arg_3_4 then
			var_3_5 = var_3_5 + arg_3_4.x
			var_3_6 = var_3_6 + arg_3_4.y
		end

		arg_3_0.view.widgets.tipMsg:setString(arg_3_3)

		local var_3_7 = arg_3_0.view.widgets.tipMsg:getContentSize().width
		local var_3_8 = arg_3_0.view.widgets.tipMsg:getContentSize().height

		arg_3_0.view.widgets.tipFrame:setPreferredSize(CCSizeMake(var_3_7 + 30, var_3_8 + 30))
		arg_3_0.view.widgets.tipFrame:setPosition(ccp(var_3_5, var_3_6))
		arg_3_0.view.widgets.tipMsg:setPosition(ccp(15, 15))
		arg_3_0.view.widgets.tipFrame:setVisible(true)
	end
end

local var_0_4

function var_0_0.ctor(arg_5_0, arg_5_1)
	log.info("@@ 剧本演武")

	arg_5_0.view = {}

	uiutil.initWidgets(arg_5_0.view, arg_5_0.layout)
	arg_5_0:addChild(arg_5_0.view.widgets.root)

	var_0_4 = user.NationData

	arg_5_0:resetVisible()
	arg_5_0:nationDataUpdate()
end

function var_0_0.updateRewardList(arg_6_0, arg_6_1)
	arg_6_0.view.widgets.rewardList:removeAllChildrenWithCleanup(true)

	for iter_6_0, iter_6_1 in pairs(arg_6_1) do
		local var_6_0 = {}

		uiutil.initWidgets(var_6_0, var_0_1)
		arg_6_0.view.widgets.rewardList:addChild(var_6_0.widgets.bg)
		var_6_0.widgets.bg:setPosition(100 * (iter_6_0 - 1), -68)

		local var_6_1 = var_0_2[iter_6_1.type]

		if var_6_1 and var_6_1.pic then
			var_6_0.widgets.icon:setDisplayFrame(CCSprite:create("res/ui/task/" .. var_6_1.pic):displayFrame())
			var_6_0.widgets.txt:setDisplayFrame(CCSprite:create("res/ui/task/" .. var_6_1.txt):displayFrame())
		end

		var_6_0.widgets.num:setString(tool.getFormatNum(tonumber(iter_6_1.value)))
	end
end

function var_0_0.updateFightInfoList(arg_7_0, arg_7_1)
	arg_7_0.view.widgets.fightInfoList:removeAllChildrenWithCleanup(true)

	for iter_7_0, iter_7_1 in ipairs(arg_7_1) do
		local var_7_0 = {}

		uiutil.initWidgets(var_7_0, arg_7_0:getSignLayOut(iter_7_0))
		arg_7_0.view.widgets.fightInfoList:addChild(var_7_0.widgets["bg" .. iter_7_0])
		var_7_0.widgets["bg" .. iter_7_0]:setPosition(-360 + 180 * (iter_7_0 - 1), -20)

		if iter_7_1.playerName and iter_7_1.playerName ~= "" then
			var_7_0.widgets["signBtn" .. iter_7_0]:setVisible(false)
			var_7_0.widgets["signNameLb" .. iter_7_0]:setString(iter_7_1.playerName)
		else
			var_7_0.widgets["signBtn" .. iter_7_0]:setVisible(true)
			var_7_0.widgets["signNameLb" .. iter_7_0]:setString("")
		end

		if iter_7_1.pic then
			var_7_0.widgets["signHeadIcon" .. iter_7_0]:setVisible(true)
			var_7_0.widgets["signHeadIcon" .. iter_7_0]:setDisplayFrame(CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. iter_7_1.pic .. ".png"):displayFrame())
		else
			var_7_0.widgets["signHeadIcon" .. iter_7_0]:setVisible(false)
		end

		local function var_7_1()
			log.info("@@报名自由战")

			local function var_8_0(arg_9_0)
				local var_9_0 = CCSprite:create("res/ui/nationTask/arena/ltzbs_word_bmcg.png")

				var_9_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 50))
				smgr.showTipSpriteText(var_9_0)
			end

			cmgr.sendRequest(var_8_0, actions.ywSignUp, 0, iter_7_0)
		end

		var_7_0.widgets["signBtn" .. iter_7_0]:addHandleOfControlEvent(var_7_1, CCControlEventTouchUpInside)
	end
end

function var_0_0.refreshNationTask(arg_10_0)
	local function var_10_0(arg_11_0)
		local var_11_0 = arg_11_0.action.data

		if var_11_0.ywInfo then
			var_0_4.taskId = var_11_0.ywInfo.taskId

			log.info("刷新演武")
			showTable(var_11_0.ywInfo)

			var_0_4.drillInfo = var_11_0.ywInfo

			arg_10_0:nationDataUpdate()
		end
	end

	cmgr.sendRequest(var_10_0, actions.getCurRankInfo, 1)
end

function var_0_0.createPlayerList(arg_12_0, arg_12_1, arg_12_2)
	local function var_12_0(arg_13_0, arg_13_1)
		return 30, 216
	end

	local function var_12_1(arg_14_0, arg_14_1)
		local var_14_0 = arg_14_0:dequeueCell()

		if var_14_0 then
			var_14_0:removeAllChildrenWithCleanup(true)
		else
			var_14_0 = CCTableViewCell:new()
		end

		local var_14_1 = arg_12_2[arg_14_1 + 1]

		if var_14_1 then
			local var_14_2

			if arg_14_1 % 2 == 1 then
				var_14_2 = CCSprite:create("res/ui/ywTask/jbyw_card_list02.png")
			else
				var_14_2 = CCSprite:create("res/ui/ywTask/jbyw_card_list01.png")
			end

			var_14_2:setAnchorPoint(ccp(0, 0.5))
			var_14_0:addChild(var_14_2)

			local var_14_3 = CCLabelTTF:create(tonumber(arg_14_1 + 1) .. "·" .. var_14_1.playerName, "", 20)

			var_14_3:setAnchorPoint(ccp(0, 0.5))
			var_14_3:setPosition(ccp(30, 0))
			var_14_0:addChild(var_14_3)
		end

		return var_14_0
	end

	local function var_12_2()
		local var_15_0 = arg_12_2

		if var_15_0 and #var_15_0 > 0 then
			return #var_15_0
		else
			return 0
		end
	end

	local var_12_3 = CCTableView:create(CCSizeMake(216, 150))

	var_12_3:setPosition(7, -85)
	var_12_3:setDirection(kCCScrollViewDirectionVertical)
	var_12_3:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_12_1:addChild(var_12_3)
	var_12_3:registerScriptHandler(var_12_0, CCTableView.kTableCellSizeForIndex)
	var_12_3:registerScriptHandler(var_12_1, CCTableView.kTableCellSizeAtIndex)
	var_12_3:registerScriptHandler(var_12_2, CCTableView.kNumberOfCellsInTableView)
	var_12_3:reloadData()
end

function var_0_0.resetVisible(arg_16_0)
	arg_16_0.view.widgets.nationFight:setVisible(false)
	arg_16_0.view.widgets.freeFightBtn:setVisible(false)
	arg_16_0.view.widgets.freeFight:setVisible(false)
	arg_16_0.view.widgets.backNationFightBtn:setVisible(false)
	arg_16_0.view.widgets.drillFightReward:setVisible(false)
end

function var_0_0.updateBackBtnState(arg_17_0)
	arg_17_0.view.widgets.infoTipText:setString("")

	if var_0_4.drillInfo.state > 1 then
		if var_0_4.drillInfo.state == 3 then
			arg_17_0.view.widgets.nationTaskTimeInfoText:setString("")
			arg_17_0.view.widgets.backNationFightBtn:setVisible(false)
			arg_17_0.view.widgets.freeFightBtn:setVisible(false)
		elseif arg_17_0.view.widgets.nationFight:isVisible() then
			arg_17_0.view.widgets.freeFightOpenText:setDisplayFrame(CCSprite:create("res/ui/ywTask/jbyw_word_wkq.png"):displayFrame())
			arg_17_0.view.widgets.freeFightOpenText:setVisible(true)
			arg_17_0.view.widgets.backNationFightBtn:setVisible(false)

			if var_0_4.isNationSignUp then
				arg_17_0.view.widgets.freeFightBtn:setVisible(false)
			else
				arg_17_0.view.widgets.freeFightBtn:setVisible(not var_0_4.drillInfo.freeFinish)
			end

			if var_0_4.drillInfo.matchCd and var_0_4.drillInfo.matchCd > 0 then
				arg_17_0.view.widgets.freeFightOpenText:setDisplayFrame(CCSprite:create("res/ui/ywTask/jbyw_word_ykq.png"):displayFrame())
			else
				arg_17_0.view.widgets.infoTipText:setString(language.get(215111))
				arg_17_0.view.widgets.backNationFightBtn:setVisible(false)
				arg_17_0.view.widgets.freeFightBtn:setVisible(false)
			end
		else
			arg_17_0.view.widgets.freeFightOpenText:setVisible(false)
			arg_17_0.view.widgets.backNationFightBtn:setVisible(true)
			arg_17_0.view.widgets.freeFightBtn:setVisible(false)

			if var_0_4.isSignUpFreeFight then
				arg_17_0.view.widgets.btnStateText:setString(language.get(215155))
			else
				arg_17_0.view.widgets.btnStateText:setString(language.get(215154))
			end
		end
	else
		arg_17_0.view.widgets.backNationFightBtn:setVisible(false)
		arg_17_0.view.widgets.freeFightBtn:setVisible(not var_0_4.isNationSignUp)
		arg_17_0.view.widgets.freeFightOpenText:setVisible(true)
		arg_17_0.view.widgets.freeFightOpenText:setDisplayFrame(CCSprite:create("res/ui/ywTask/jbyw_word_wkq.png"):displayFrame())
	end
end

function var_0_0.clearNationTime(arg_18_0)
	if arg_18_0.nationFightTime then
		pcall(arg_18_0.nationFightTime.removeFromParentAndCleanup, arg_18_0.nationFightTime, true)

		arg_18_0.nationFightTime = nil
	end

	if arg_18_0.nationFightTime2 then
		pcall(arg_18_0.nationFightTime2.removeFromParentAndCleanup, arg_18_0.nationFightTime2, true)

		arg_18_0.nationFightTime2 = nil
	end
end

function var_0_0.nationDataUpdate(arg_19_0)
	local var_19_0 = var_0_4.drillInfo

	log.info("演武面板 nationDataUpdate")
	showTable(var_19_0)

	if var_19_0.state == 1 then
		arg_19_0.view.widgets.freeFightBtn:setEnabled(false)
		arg_19_0.view.widgets.nationFight:setVisible(true)

		if var_19_0.signUpCd > 0 then
			arg_19_0.view.widgets.nationTaskTimeInfoText:setString("")

			if arg_19_0.nationFightTime2 then
				pcall(arg_19_0.nationFightTime2.removeFromParentAndCleanup, arg_19_0.nationFightTime2, true)

				arg_19_0.nationFightTime2 = nil
			end

			if arg_19_0.nationFightTime == nil then
				local function var_19_1()
					if var_0_4.drillInfo.signUpCd > 0 then
						var_0_4.drillInfo.signUpCd = 0
					end

					arg_19_0:updateBackBtnState()
					arg_19_0.view.widgets.nationTaskTimeInfoText:setString("")

					if arg_19_0.nationFightTime then
						pcall(arg_19_0.nationFightTime.removeFromParentAndCleanup, arg_19_0.nationFightTime, true)

						arg_19_0.nationFightTime = nil
					end
				end

				local function var_19_2(arg_21_0)
					return
				end

				arg_19_0.nationFightTime = createTimerLabel(var_19_0.signUpCd, language.get(215101) .. "@H:@M:@S", "Thonburi-Bold", 24, var_19_1, nil, nil, colorTips.red, var_19_2)

				arg_19_0.nationFightTime:setPosition(ccp(0, 95))
				arg_19_0.view.widgets.root:addChild(arg_19_0.nationFightTime)
			else
				arg_19_0.nationFightTime:setTime(var_19_0.signUpCd)
			end
		end

		if var_19_0.signUpCd and var_19_0.signUpCd <= 0 and var_19_0.startCd and var_19_0.startCd > 0 then
			arg_19_0.view.widgets.nationTaskTimeInfoText:setString("")
			arg_19_0:updateBackBtnState()

			if arg_19_0.nationFightTime then
				pcall(arg_19_0.nationFightTime.removeFromParentAndCleanup, arg_19_0.nationFightTime, true)

				arg_19_0.nationFightTime = nil
			end

			if arg_19_0.nationFightTime2 == nil then
				local function var_19_3()
					if arg_19_0.nationFightTime2 then
						pcall(arg_19_0.nationFightTime2.removeFromParentAndCleanup, arg_19_0.nationFightTime2, true)

						arg_19_0.nationFightTime2 = nil
					end
				end

				local function var_19_4(arg_23_0)
					return
				end

				arg_19_0.nationFightTime2 = createTimerLabel(var_19_0.startCd, language.get(215140) .. "@H:@M:@S", "Thonburi-Bold", 24, var_19_3, nil, nil, colorTips.red, var_19_4)

				arg_19_0.nationFightTime2:setPosition(ccp(0, 95))
				arg_19_0.view.widgets.root:addChild(arg_19_0.nationFightTime2)
			else
				arg_19_0.nationFightTime2:setTime(var_19_0.startCd)
			end
		end
	elseif var_19_0.state == 2 then
		arg_19_0:clearNationTime()
		arg_19_0.view.widgets.freeFightBtn:setEnabled(true)

		if var_19_0.matchCd and var_19_0.matchCd > 0 then
			arg_19_0.view.widgets.nationTaskTimeInfoText:setString("")

			if arg_19_0.freeFightTime == nil then
				local function var_19_5()
					var_0_4.drillInfo.matchCd = 0

					arg_19_0:updateBackBtnState()

					if arg_19_0.freeFightTime then
						arg_19_0.freeFightTime:removeFromParentAndCleanup(true)

						arg_19_0.freeFightTime = nil
					end
				end

				local function var_19_6(arg_25_0)
					return
				end

				arg_19_0.freeFightTime = createTimerLabel(var_19_0.matchCd, "@H:@M:@S", "Thonburi-Bold", 24, var_19_5, nil, nil, colorTips.red, var_19_6)

				arg_19_0.freeFightTime:setPosition(ccp(41, 13))
				arg_19_0.view.widgets.freeFightBtn:addChild(arg_19_0.freeFightTime)
			else
				arg_19_0.freeFightTime:setTime(var_19_0.matchCd)
			end
		end

		if var_19_0.startCd and var_19_0.startCd > 0 then
			if arg_19_0.nationFightTime == nil then
				local function var_19_7()
					arg_19_0:updateBackBtnState()
					arg_19_0.view.widgets.nationTaskTimeInfoText:setString("")

					if arg_19_0.nationFightTime then
						pcall(arg_19_0.nationFightTime.removeFromParentAndCleanup, arg_19_0.nationFightTime, true)

						arg_19_0.nationFightTime = nil
					end
				end

				local function var_19_8(arg_27_0)
					return
				end

				arg_19_0.nationFightTime = createTimerLabel(var_19_0.startCd, language.get(215140) .. "@H:@M:@S", "Thonburi-Bold", 24, var_19_7, nil, nil, colorTips.red, var_19_8)

				arg_19_0.nationFightTime:setPosition(ccp(0, 95))
				arg_19_0.view.widgets.root:addChild(arg_19_0.nationFightTime)
			else
				arg_19_0.nationFightTime:setTime(var_19_0.startCd)
			end
		else
			arg_19_0.view.widgets.nationTaskTimeInfoText:setString(language.get(215102))
		end

		arg_19_0.view.widgets.freeFightBtn:setVisible(true)
		arg_19_0.view.widgets.nationFight:setVisible(true)
	elseif var_19_0.state == 3 then
		arg_19_0.view.widgets.nationTaskTimeInfoText:setString("")
		arg_19_0.view.widgets.drillFightReward:setVisible(true)
	end

	if var_19_0.allFightEnd then
		arg_19_0:clearNationTime()

		if arg_19_0.view.widgets.nationFight:isVisible() then
			arg_19_0.view.widgets.nationTaskTimeInfoText:setString(language.get(215133))
		else
			arg_19_0.view.widgets.nationTaskTimeInfoText:setString(language.get(215102))
		end
	end

	arg_19_0.view.widgets.weiLb:setString(user.forceIdToName[1])
	arg_19_0.view.widgets.shuLb:setString(user.forceIdToName[2])
	arg_19_0.view.widgets.wuLb:setString(user.forceIdToName[3])

	if var_19_0.scoreList and #var_19_0.scoreList >= 3 then
		arg_19_0.view.widgets.score1:setString(var_19_0.scoreList[1] and var_19_0.scoreList[1].score or 0)
		arg_19_0.view.widgets.score2:setString(var_19_0.scoreList[2] and var_19_0.scoreList[2].score or 0)
		arg_19_0.view.widgets.score3:setString(var_19_0.scoreList[3] and var_19_0.scoreList[3].score or 0)
	end

	if var_0_4.drillInfo.teamList then
		for iter_19_0, iter_19_1 in ipairs(var_0_4.drillInfo.teamList) do
			local var_19_9 = iter_19_1
			local var_19_10

			arg_19_0.view.widgets["fightNumText" .. iter_19_1.id]:setString(language.get(215100, tool.getChineseNum(iter_19_1.id)))

			var_19_9.curPlayerNum = #var_19_9.playerList or 0

			arg_19_0:checkPlayerList(var_19_9)

			if var_0_4.drillInfo.state == 1 then
				if var_19_9.playerList and #var_19_9.playerList > 0 then
					local var_19_11 = var_19_9.playerList[1]

					if var_19_11 then
						arg_19_0.view.widgets["playerHead_icon_" .. iter_19_1.id]:setVisible(true)
						arg_19_0.view.widgets["playerNameText" .. iter_19_1.id]:setString(var_19_11.playerName)
						arg_19_0.view.widgets["playerHead_icon_" .. iter_19_1.id]:setDisplayFrame(CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. var_19_11.pic .. ".png"):displayFrame())
					else
						arg_19_0.view.widgets["playerHead_icon_" .. iter_19_1.id]:setVisible(false)
						arg_19_0.view.widgets["playerNameText" .. iter_19_1.id]:setString("")
					end

					arg_19_0.view.widgets["groupNumText" .. iter_19_1.id]:setString(var_19_9.curPlayerNum .. "/" .. var_19_9.maxPlayerNum)
					arg_19_0.view.widgets["downBtn" .. iter_19_1.id]:setEnabled(true)
				else
					arg_19_0.view.widgets["playerNameText" .. iter_19_1.id]:setString(language.get(215106))
					arg_19_0.view.widgets["groupNumText" .. iter_19_1.id]:setString(var_19_9.curPlayerNum .. "/" .. var_19_9.maxPlayerNum)
					arg_19_0.view.widgets["playerHead_icon_" .. iter_19_1.id]:setVisible(false)
					arg_19_0.view.widgets["downBtn" .. iter_19_1.id]:setEnabled(false)
				end

				if var_19_9.isSignUp then
					arg_19_0.view.widgets["infoTipText" .. iter_19_1.id]:setString(language.get(215127))
					arg_19_0.view.widgets["actionbtn" .. iter_19_1.id]:setVisible(false)
				else
					arg_19_0.view.widgets["infoTipText" .. iter_19_1.id]:setString("")
					arg_19_0.view.widgets["actionbtn" .. iter_19_1.id]:setVisible(true)
				end

				arg_19_0.view.widgets["fightInfoSp" .. iter_19_1.id]:setVisible(true)
				arg_19_0.view.widgets["fightResult" .. iter_19_1.id]:setVisible(false)
				arg_19_0.view.widgets["actionbtnLb" .. iter_19_1.id]:setString(language.get(215151))
			elseif var_0_4.drillInfo.state == 2 then
				arg_19_0.view.widgets["infoTipText" .. iter_19_1.id]:setString("")
				arg_19_0.view.widgets["actionbtn" .. iter_19_1.id]:setVisible(true)

				if var_19_9.result == 0 then
					arg_19_0.view.widgets["fightNumText" .. iter_19_1.id]:setString(language.get(215100, tool.getChineseNum(iter_19_1.id)))

					if var_19_9.playerList and #var_19_9.playerList > 0 then
						local var_19_12 = var_19_9.playerList[1]

						if var_19_12 then
							arg_19_0.view.widgets["playerHead_icon_" .. iter_19_1.id]:setVisible(true)
							arg_19_0.view.widgets["playerNameText" .. iter_19_1.id]:setString(var_19_12.playerName)
							arg_19_0.view.widgets["playerHead_icon_" .. iter_19_1.id]:setDisplayFrame(CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. var_19_12.pic .. ".png"):displayFrame())
						else
							arg_19_0.view.widgets["playerHead_icon_" .. iter_19_1.id]:setVisible(false)
							arg_19_0.view.widgets["playerNameText" .. iter_19_1.id]:setString("")
						end

						arg_19_0.view.widgets["groupNumText" .. iter_19_1.id]:setString(var_19_9.curPlayerNum .. "/" .. var_19_9.maxPlayerNum)
						arg_19_0.view.widgets["downBtn" .. iter_19_1.id]:setEnabled(true)
					else
						arg_19_0.view.widgets["playerNameText" .. iter_19_1.id]:setString(language.get(215106))
						arg_19_0.view.widgets["groupNumText" .. iter_19_1.id]:setString(var_19_9.curPlayerNum .. "/" .. var_19_9.maxPlayerNum)
						arg_19_0.view.widgets["playerHead_icon_" .. iter_19_1.id]:setVisible(false)
						arg_19_0.view.widgets["downBtn" .. iter_19_1.id]:setEnabled(false)
					end

					arg_19_0.view.widgets["fightInfoSp" .. iter_19_1.id]:setVisible(true)
					arg_19_0.view.widgets["fightResult" .. iter_19_1.id]:setVisible(false)

					if var_19_9.isPlayer then
						arg_19_0.view.widgets["actionbtnLb" .. iter_19_1.id]:setString(language.get(215153))
					else
						arg_19_0.view.widgets["actionbtnLb" .. iter_19_1.id]:setString(language.get(215152))
					end
				else
					arg_19_0.view.widgets["fightInfoSp" .. iter_19_1.id]:setVisible(false)
					arg_19_0.view.widgets["fightResult" .. iter_19_1.id]:setVisible(true)

					if var_19_9.result == 1 then
						arg_19_0.view.widgets["fightResult" .. iter_19_1.id]:setDisplayFrame(CCSprite:create("res/ui/ywTask/jbyw_word_sl.png"):displayFrame())
					elseif var_19_9.result == 2 then
						arg_19_0.view.widgets["fightResult" .. iter_19_1.id]:setDisplayFrame(CCSprite:create("res/ui/nationTask/arena/ltzbs_word_sb.png"):displayFrame())
					elseif var_19_9.result == 3 then
						arg_19_0.view.widgets["fightResult" .. iter_19_1.id]:setDisplayFrame(CCSprite:create("res/ui/nationTask/arena/ltzbs_word_pj.png"):displayFrame())
					end
				end
			end

			local function var_19_13()
				local var_28_0 = arg_19_0.view.widgets["downBtn" .. iter_19_1.id]:getScale()

				if var_28_0 < 0 then
					arg_19_0.view.widgets["playerListBg" .. iter_19_0]:setVisible(false)
				else
					arg_19_0:createPlayerList(arg_19_0.view.widgets["playerListBg" .. iter_19_0], var_19_9.playerList)
					arg_19_0.view.widgets["playerListBg" .. iter_19_0]:setVisible(true)
				end

				arg_19_0.view.widgets["downBtn" .. iter_19_1.id]:setScale(-1 * var_28_0)
			end

			local function var_19_14()
				if var_0_4.drillInfo.state == 1 then
					local function var_29_0(arg_30_0)
						local var_30_0 = arg_30_0.action.data

						arg_19_0.view.widgets["infoTipText" .. iter_19_1.id]:setString(language.get(215127))
						arg_19_0.view.widgets["actionbtn" .. iter_19_1.id]:setVisible(false)

						var_0_4.isNationSignUp = true

						arg_19_0:drillBtnStateUpdate()

						local var_30_1 = CCSprite:create("res/ui/nationTask/arena/ltzbs_word_bmcg.png")
						local var_30_2, var_30_3 = tool.getPositionInScreen(arg_19_0.view.widgets["actionbtn" .. iter_19_1.id])

						var_30_1:setPosition(ccp(var_30_2, var_30_3 - 50))
						smgr.showTipSpriteText(var_30_1)
					end

					cmgr.sendRequest(var_29_0, actions.ywSignUp, iter_19_1.id, 0)
				elseif var_0_4.drillInfo.state == 2 then
					log.info("@@进入演武剧本")

					user.soId = var_0_4.drillInfo.juBenId
					user.ywData.watch = not var_19_9.isPlayer
					user.ywData.battleKey = var_19_9.battleKey

					smgr.changeScene(SCENE_JUBEN, user.soId, 0, 0)
				end
			end

			arg_19_0.view.widgets["downBtn" .. iter_19_1.id]:addHandleOfControlEvent(var_19_13, CCControlEventTouchUpInside)
			arg_19_0.view.widgets["actionbtn" .. iter_19_1.id]:addHandleOfControlEvent(var_19_14, CCControlEventTouchUpInside)
		end
	end

	arg_19_0:updateReward()
	arg_19_0:updateBackBtnState()
end

function var_0_0.checkPlayerList(arg_31_0, arg_31_1)
	for iter_31_0, iter_31_1 in ipairs(arg_31_1.playerList) do
		if iter_31_1.playerId == user.player.id then
			var_0_4.isNationSignUp = true
			arg_31_1.isSignUp = true
		end
	end

	if arg_31_1.curPlayerNum < arg_31_1.maxPlayerNum then
		for iter_31_2 = 1, arg_31_1.maxPlayerNum - arg_31_1.curPlayerNum do
			table.insert(arg_31_1.playerList, nil)
		end
	end
end

function var_0_0.scoreUpdate(arg_32_0)
	local var_32_0 = var_0_4.drillInfo

	if var_32_0.scoreList and #var_32_0.scoreList >= 3 then
		arg_32_0.view.widgets.score1:setString(var_32_0.scoreList[1] and var_32_0.scoreList[1].score or 0)
		arg_32_0.view.widgets.score2:setString(var_32_0.scoreList[2] and var_32_0.scoreList[2].score or 0)
		arg_32_0.view.widgets.score3:setString(var_32_0.scoreList[3] and var_32_0.scoreList[3].score or 0)
	end
end

function var_0_0.drillBtnStateUpdate(arg_33_0)
	arg_33_0:updateBackBtnState()
end

function var_0_0.freePlayerList(arg_34_0)
	if not arg_34_0.view.widgets.freeFight:isVisible() then
		roleDialogue.control.loadSpeak("yw215157")

		return
	end

	if var_0_4.drillInfo.startCd and var_0_4.drillInfo.startCd > 0 then
		if arg_34_0.nationFightTime == nil then
			local function var_34_0()
				arg_34_0:updateBackBtnState()

				if arg_34_0.nationFightTime then
					pcall(arg_34_0.nationFightTime.removeFromParentAndCleanup, arg_34_0.nationFightTime, true)

					arg_34_0.nationFightTime = nil
				end
			end

			local function var_34_1(arg_36_0)
				return
			end

			arg_34_0.nationFightTime = createTimerLabel(var_0_4.drillInfo.startCd, language.get(215140) .. "@H:@M:@S", "Thonburi-Bold", 24, var_34_0, nil, nil, colorTips.red, var_34_1)

			arg_34_0.nationFightTime:setPosition(ccp(0, 95))
			arg_34_0.view.widgets.root:addChild(arg_34_0.nationFightTime)
		else
			arg_34_0.nationFightTime:setTime(var_0_4.drillInfo.startCd)
		end
	else
		arg_34_0.view.widgets.nationTaskTimeInfoText:setString(language.get(215102))
	end

	arg_34_0:updateBackBtnState()
	arg_34_0:updateFressListView()
end

function var_0_0.updateReward(arg_37_0)
	if var_0_4.drillInfo.rewards then
		arg_37_0:updateRewardList(var_0_4.drillInfo.rewards)
		arg_37_0.view.widgets.rewardRank:setString(var_0_4.drillInfo.rank)

		if not var_0_4.drillInfo.isRewarded and var_0_4.drillInfo.canGetReward then
			arg_37_0.view.widgets.getBtn:setVisible(true)
		else
			arg_37_0.view.widgets.getBtn:setVisible(false)
		end
	end
end

function var_0_0.showMatchSuccess(arg_38_0)
	local var_38_0 = CCSprite:create("res/ui/ywTask/jbyw_word_ppcg.png")

	var_38_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 50))
	smgr.showTipSpriteText(var_38_0)
end

function var_0_0.updateFressListView(arg_39_0)
	if var_0_4.showFreeSuccess then
		arg_39_0:showMatchSuccess()

		var_0_4.showFreeSuccess = false
	end

	arg_39_0:updateFightInfoList(var_0_4.freePlayerList)

	if var_0_4.curJoinFreeFightNum >= 5 then
		arg_39_0.view.widgets.introText:setString(language.get(215105))
	else
		arg_39_0.view.widgets.introText:setString(language.get(215104))
	end
end

function var_0_0.onEnter(arg_40_0)
	local function var_40_0()
		if var_0_4.drillInfo.state > 1 then
			if var_0_4.drillInfo.battleKey > 0 then
				log.info("@@进入演武剧本")

				user.soId = var_0_4.drillInfo.soId
				user.ywData.battleKey = var_0_4.drillInfo.battleKey

				smgr.changeScene(SCENE_JUBEN, user.soId, 0, 0)
			else
				arg_40_0.view.widgets.nationFight:setVisible(false)
				cmgr.sendRequest(nil, actions.closeYwMainPanel)
				arg_40_0.view.widgets.freeFight:setVisible(true)

				local function var_41_0(arg_42_0)
					local var_42_0 = arg_42_0.action.data

					var_0_4.isSignUpFreeFight = false
					var_0_4.curJoinFreeFightNum = 0

					if var_0_4.drillInfo then
						var_0_4.drillInfo.startCd = var_42_0.startCd
					end

					for iter_42_0, iter_42_1 in pairs(var_42_0.playerList) do
						if iter_42_1.playerId then
							var_0_4.curJoinFreeFightNum = var_0_4.curJoinFreeFightNum + 1
						end

						if iter_42_1.playerId and iter_42_1.playerId == user.player.id then
							var_0_4.isSignUpFreeFight = true
						end
					end

					var_0_4.freePlayerList = var_42_0.playerList

					eventManager.dispatchEvent("freePlayerList")
				end

				cmgr.sendRequest(var_41_0, actions.getYwFreeMatchInfo)
				arg_40_0.view.widgets.nationTaskTimeInfoText:setString(language.get(215102))
			end
		end
	end

	local function var_40_1()
		if var_0_4.isSignUpFreeFight then
			local function var_43_0(arg_44_0)
				var_0_4.isSignUpFreeFight = false
			end

			cmgr.sendRequest(var_43_0, actions.quitFreeMatch)
		else
			arg_40_0.view.widgets.freeFight:setVisible(false)
			cmgr.sendRequest(nil, actions.closeYwFreePanel)
			arg_40_0.view.widgets.nationFight:setVisible(true)
			arg_40_0:updateBackBtnState()

			if var_0_4.drillInfo.allFightEnd then
				arg_40_0:clearNationTime()
				arg_40_0.view.widgets.nationTaskTimeInfoText:setString(language.get(215133))
			end
		end
	end

	local function var_40_2()
		local function var_45_0(arg_46_0)
			local var_46_0 = arg_46_0.action.data
			local var_46_1 = {}

			for iter_46_0, iter_46_1 in pairs(var_46_0.rewards) do
				if var_0_2[iter_46_1.type] then
					local var_46_2 = {
						id = var_0_2[iter_46_1.type].type,
						value = iter_46_1.value
					}

					table.insert(var_46_1, var_46_2)
				end
			end

			if var_46_0.hasExtra then
				for iter_46_2, iter_46_3 in pairs(var_46_0.extraRewards) do
					if var_0_2[iter_46_3.type] then
						local var_46_3 = {
							id = var_0_2[iter_46_3.type].type,
							value = iter_46_3.value
						}

						table.insert(var_46_1, var_46_3)
					end
				end
			end

			if var_46_0.indivRewards then
				for iter_46_4, iter_46_5 in pairs(var_46_0.indivRewards) do
					if var_0_2[iter_46_5.type] then
						local var_46_4 = {
							id = var_0_2[iter_46_5.type].type,
							value = iter_46_5.value
						}

						table.insert(var_46_1, var_46_4)
					end
				end
			end

			if var_46_0.predicateExtraRewards then
				for iter_46_6, iter_46_7 in pairs(var_46_0.predicateExtraRewards) do
					if var_0_2[iter_46_7.type] then
						local var_46_5 = {
							id = var_0_2[iter_46_7.type].type,
							value = iter_46_7.value
						}

						table.insert(var_46_1, var_46_5)
					end
				end
			end

			globalAction_gotResource(var_46_1)
			arg_40_0:refreshNationTask()
		end

		var_0_4.taskId = var_0_4.taskId or 3016

		cmgr.sendRequest(var_45_0, actions.getNationTaskReward, var_0_4.taskId)
	end

	arg_40_0.view.widgets.getBtn:addHandleOfControlEvent(var_40_2, CCControlEventTouchUpInside)
	arg_40_0.view.widgets.freeFightBtn:addHandleOfControlEvent(var_40_0, CCControlEventTouchUpInside)
	arg_40_0.view.widgets.backNationFightBtn:addHandleOfControlEvent(var_40_1, CCControlEventTouchUpInside)
	arg_40_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		arg_40_0:showHelpTip(true, "btn_tip", language.get(215134), ccp(320, -520))
	end, CCControlEventTouchUpInside)

	arg_40_0.nationDataUpdateRf = handler(arg_40_0, arg_40_0.nationDataUpdate)
	arg_40_0.scoreUpdateRf = handler(arg_40_0, arg_40_0.scoreUpdate)
	arg_40_0.drillBtnStateUpdateRf = handler(arg_40_0, arg_40_0.drillBtnStateUpdate)
	arg_40_0.freePlayerListRf = handler(arg_40_0, arg_40_0.freePlayerList)
	arg_40_0.refreshNationTaskRf = handler(arg_40_0, arg_40_0.refreshNationTask)

	eventManager.registerEvent("nationDataUpdate", arg_40_0.nationDataUpdateRf)
	eventManager.registerEvent("scoreUpdate", arg_40_0.scoreUpdateRf)
	eventManager.registerEvent("drillBtnStateUpdate", arg_40_0.drillBtnStateUpdateRf)
	eventManager.registerEvent("freePlayerList", arg_40_0.freePlayerListRf)
	eventManager.registerEvent("refreshNationTask", arg_40_0.refreshNationTaskRf)
end

function var_0_0.onExit(arg_48_0)
	cmgr.sendRequest(nil, actions.closeYwMainPanel)
	cmgr.sendRequest(nil, actions.closeYwFreePanel)
	eventManager.unregisterEvent("nationDataUpdate", arg_48_0.nationDataUpdateRf)
	eventManager.unregisterEvent("scoreUpdate", arg_48_0.scoreUpdateRf)
	eventManager.unregisterEvent("drillBtnStateUpdate", arg_48_0.drillBtnStateUpdateRf)
	eventManager.unregisterEvent("freePlayerList", arg_48_0.freePlayerListRf)
	eventManager.unregisterEvent("refreshNationTask", arg_48_0.refreshNationTaskRf)
end

return var_0_0
