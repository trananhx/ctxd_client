return {
	name = "root",
	type = "node",
	children = {
		{
			x = 240,
			name = "genLeftBack",
			y = 275,
			type = "sprite",
			pic = {
				frame = true,
				path = "general_left_view_bg.jpg"
			}
		},
		{
			y = 285,
			name = "generalPicNode",
			scale = 1.2,
			type = "node",
			x = 165
		},
		{
			name = "switchShowGeneralButton",
			h = 114,
			type = "button",
			w = 74,
			y = 387,
			x = 50,
			normal = {
				frame = true,
				path = "p-huang.png"
			},
			touched = {
				frame = true,
				path = "p-huang.png"
			},
			anchorPoint = ccp(0.5, 0.5),
			children = {
				{
					fontSize = 24,
					name = "switchShowGeneralButtonText",
					strokeSize = 2,
					type = "label",
					style = "label_white_20",
					textId = 83035,
					width = 50,
					font = "Thonburi",
					height = 0,
					y = 53,
					zorder = 1,
					x = 37,
					anchorPoint = ccp(0.5, 0.5),
					halign = kCCVerticalTextAlignmentCenter,
					valign = kCCVerticalTextAlignmentCenter
				}
			}
		},
		{
			x = 70,
			name = "num_zgjn_bg",
			y = 420,
			type = "sprite",
			visible = false,
			pic = {
				frame = false,
				path = "res/ui/general/juexing/evokezgjl.png"
			},
			children = {
				{
					text = "x0",
					name = "num_zgjn",
					y = 5,
					type = "label",
					style = "label_yellowish_22",
					x = 34,
					fontSize = 22,
					anchorPoint = ccp(0, 0)
				}
			}
		},
		{
			x = 160,
			name = "btn_equip",
			h = 56,
			type = "button",
			w = 189,
			y = 140,
			scale = 0.8,
			normal = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_04.png"
			},
			touched = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_04_c.png"
			},
			children = {
				{
					fontSize = 24,
					y = 32,
					type = "label",
					x = 92,
					textId = 82022,
					color = ccc3(217, 237, 197)
				}
			}
		},
		{
			x = 160,
			name = "startJuexingState",
			h = 47,
			type = "button",
			w = 151,
			visible = false,
			y = 184,
			scale = 0.9,
			normal = {
				frame = false,
				path = "res/ui/general/juexing/wjjx_btn_kqjx.png"
			},
			touched = {
				frame = false,
				path = "res/ui/general/juexing/wjjx_btn_kqjx_c.png"
			},
			anchorPoint = ccp(0.5, 0.5),
			children = {
				{
					fontSize = 24,
					name = "condtion",
					y = 60,
					type = "label",
					x = 75,
					color = ccc3(217, 237, 197)
				}
			}
		},
		{
			x = 160,
			name = "buy_zgjn",
			h = 56,
			type = "button",
			w = 212,
			visible = false,
			y = 184,
			scale = 0.8,
			normal = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_01.png"
			},
			touched = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_01_c.png"
			},
			anchorPoint = ccp(0.5, 0.5),
			children = {
				{
					x = 42,
					y = 38,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/general/juexing/evokezgjl.png"
					}
				},
				{
					y = 16,
					x = 32,
					scale = 0.85,
					type = "sprite",
					pic = {
						frame = true,
						path = "res_icon_19_small.png"
					}
				},
				{
					text = "100",
					name = "buy_zgjn_gold",
					y = 16,
					type = "label",
					x = 46,
					fontSize = 20,
					anchorPoint = ccp(0, 0.5),
					color = ccc3(255, 189, 66)
				},
				{
					fontSize = 24,
					y = 32,
					type = "label",
					x = 130,
					textId = "223200_zgljx",
					color = ccc3(217, 237, 197)
				}
			}
		},
		{
			y = 515,
			x = 45,
			type = "node",
			children = {
				{
					x = 0,
					y = -13,
					type = "sprite",
					pic = {
						frame = true,
						path = "general_attribute_shadow.png"
					}
				},
				{
					name = "wujiangAtt",
					h = 39,
					type = "button",
					w = 35,
					y = 0,
					x = 0,
					normal = {
						frame = true,
						path = "general_attribute_att.png"
					},
					touched = {
						frame = true,
						path = "general_attribute_att.png"
					},
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					scale = 0.8,
					name = "wujiangEvokeTime",
					h = 39,
					type = "button",
					w = 35,
					y = 10,
					x = 14,
					normal = {
						frame = false,
						path = "res/ui/general/juexing/wjjx_clock.png"
					},
					touched = {
						frame = false,
						path = "res/ui/general/juexing/wjjx_clock.png"
					},
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					text = "+1234",
					name = "generalAttValue",
					y = 0,
					type = "label",
					style = "label_yellowish_24",
					x = 25,
					anchorPoint = ccp(0, 0.5)
				}
			}
		},
		{
			y = 515,
			x = 185,
			type = "node",
			children = {
				{
					x = 0,
					y = -13,
					type = "sprite",
					pic = {
						frame = true,
						path = "general_attribute_shadow.png"
					}
				},
				{
					name = "wujiangDef",
					h = 39,
					type = "button",
					w = 35,
					y = 0,
					x = 0,
					normal = {
						frame = true,
						path = "general_attriubte_def.png"
					},
					touched = {
						frame = true,
						path = "general_attriubte_def.png"
					},
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					text = "+1234",
					name = "generalDefValue",
					y = 0,
					type = "label",
					style = "label_yellowish_24",
					x = 25,
					anchorPoint = ccp(0, 0.5)
				}
			}
		},
		{
			y = 515,
			x = 330,
			type = "node",
			children = {
				{
					x = 0,
					y = -13,
					type = "sprite",
					pic = {
						frame = true,
						path = "general_attribute_shadow.png"
					}
				},
				{
					name = "wujiangHp",
					h = 39,
					type = "button",
					w = 35,
					y = 0,
					x = 0,
					normal = {
						frame = true,
						path = "general_attribute_hp.png"
					},
					touched = {
						frame = true,
						path = "general_attribute_hp.png"
					},
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					text = "+1234",
					name = "generalHpValue",
					y = 0,
					type = "label",
					style = "label_yellowish_24",
					x = 25,
					anchorPoint = ccp(0, 0.5)
				}
			}
		},
		{
			text = "xx",
			name = "generalTongValue",
			y = 470,
			type = "label",
			fontSize = 22,
			x = 30,
			anchorPoint = ccp(0, 0.5),
			color = ccc3(102, 156, 186)
		},
		{
			text = "xx",
			name = "generalYongValue",
			y = 470,
			type = "label",
			fontSize = 22,
			x = 250,
			anchorPoint = ccp(0, 0.5),
			color = ccc3(183, 91, 67)
		},
		{
			y = 275,
			x = 642,
			type = "sprite",
			pic = {
				frame = true,
				path = "general_right_view_bg.jpg"
			},
			children = {
				{
					y = 500,
					x = 17,
					type = "node",
					children = {
						{
							y = 0,
							style = "label_yellowish_22",
							type = "label",
							x = 0,
							textId = 81004,
							anchorPoint = ccp(0, 0.5)
						},
						{
							y = 0,
							x = 150,
							type = "sprite",
							pic = {
								frame = true,
								path = "general_exp_view_bg.jpg"
							},
							children = {
								{
									y = 0,
									name = "generalExpBarValue",
									type = "progressbar",
									x = 0,
									anchorPoint = ccp(0, 0),
									progressType = kCCProgressTimerTypeBar,
									pic = {
										frame = true,
										path = "general_exp_view_con.png"
									}
								},
								{
									fontSize = 20,
									name = "generalExpValue",
									y = 2,
									type = "label",
									x = 85,
									anchorPoint = ccp(0.5, 0),
									color = ccc3(214, 244, 178)
								}
							}
						},
						{
							fontSize = 20,
							name = "generalLvValue",
							y = 0,
							type = "label",
							x = 250,
							anchorPoint = ccp(0, 0.5),
							color = ccc3(203, 173, 139)
						}
					}
				},
				{
					fontSize = 20,
					y = 440,
					type = "label",
					x = 17,
					textId = 81005,
					anchorPoint = ccp(0, 0.5),
					color = ccc3(203, 173, 139),
					children = {
						{
							fontSize = 20,
							name = "generalTroopName",
							y = 0,
							type = "label",
							x = 105,
							anchorPoint = ccp(0, 0)
						}
					}
				},
				{
					fontSize = 20,
					y = 400,
					type = "label",
					x = 17,
					textId = 81006,
					anchorPoint = ccp(0, 0.5),
					color = ccc3(203, 173, 139),
					children = {
						{
							fontSize = 14,
							name = "generaltacName",
							y = 0,
							type = "label",
							x = 105,
							anchorPoint = ccp(0, 0),
							color = ccc3(189, 167, 146)
						}
					}
				},
				{
					fontSize = 20,
					y = 350,
					type = "label",
					x = 17,
					textId = 81013,
					anchorPoint = ccp(0, 0.5),
					color = ccc3(203, 173, 139),
					children = {
						{
							name = "generalStrategyDefButton",
							h = 50,
							type = "button",
							w = 50,
							visible = true,
							y = 10,
							x = 80,
							normal = {
								frame = true,
								path = "general_attrib_icon_bg.jpg"
							},
							touched = {
								frame = true,
								path = "general_attrib_icon_on.jpg"
							},
							anchorPoint = ccp(0.5, 0.5),
							children = {
								{
									y = 25,
									x = 25,
									type = "sprite",
									zorder = 1,
									pic = {
										frame = true,
										path = "general_attrib_iconfs.png"
									}
								}
							}
						},
						{
							name = "generalStrategyAttButton",
							h = 50,
							type = "button",
							w = 50,
							visible = true,
							y = 10,
							x = 80,
							normal = {
								frame = true,
								path = "general_attrib_icon_bg.jpg"
							},
							touched = {
								frame = true,
								path = "general_attrib_icon_on.jpg"
							},
							anchorPoint = ccp(0.5, 0.5),
							children = {
								{
									y = 25,
									x = 25,
									type = "sprite",
									zorder = 1,
									pic = {
										frame = true,
										path = "general_attrib_icongj.png"
									}
								}
							}
						},
						{
							name = "generalStrategyAssButton",
							h = 50,
							type = "button",
							w = 50,
							visible = true,
							y = 10,
							x = 80,
							normal = {
								frame = true,
								path = "general_attrib_icon_bg.jpg"
							},
							touched = {
								frame = true,
								path = "general_attrib_icon_on.jpg"
							},
							anchorPoint = ccp(0.5, 0.5),
							children = {
								{
									y = 25,
									x = 25,
									type = "sprite",
									zorder = 1,
									pic = {
										frame = true,
										path = "general_attrib_icontj.png"
									}
								}
							}
						}
					}
				},
				{
					fontSize = 20,
					name = "terrainAddAttLabel",
					y = 280,
					type = "label",
					x = 17,
					textId = 81008,
					anchorPoint = ccp(0, 0.5),
					color = ccc3(203, 173, 139)
				},
				{
					text = "",
					name = "tokenNumLabel",
					y = 205,
					type = "label",
					fontSize = 20,
					x = 17,
					anchorPoint = ccp(0, 0.5),
					color = ccc3(203, 173, 139)
				},
				{
					fontSize = 20,
					name = "bingli",
					type = "label",
					textId = 81017,
					y = 165,
					x = 17,
					anchorPoint = ccp(0, 0.5),
					color = ccc3(203, 173, 139),
					children = {
						{
							y = 10,
							x = 83,
							type = "sprite",
							pic = {
								frame = true,
								path = "general_troo_view_bg.jpg"
							},
							anchorPoint = ccp(0, 0.5),
							children = {
								{
									y = 0,
									name = "generalTroopBarValue",
									type = "progressbar",
									x = 0,
									anchorPoint = ccp(0, 0),
									progressType = kCCProgressTimerTypeBar,
									pic = {
										frame = true,
										path = "general_troo_view_con.png"
									}
								},
								{
									fontSize = 22,
									name = "generalTroopValue",
									y = 7,
									type = "label",
									x = 103,
									anchorPoint = ccp(0.5, 0),
									color = ccc3(226, 197, 165)
								}
							}
						}
					}
				},
				{
					y = 147,
					name = "timerNode",
					x = 170,
					type = "node"
				},
				{
					style = "button_gre4",
					name = "speedAddHpButton",
					y = 65,
					type = "button",
					visible = false,
					x = 170,
					children = {
						{
							fontSize = 24,
							y = 37,
							type = "label",
							x = 183,
							textId = 81018,
							color = ccc3(217, 234, 196)
						}
					}
				},
				{
					style = "button_gre4",
					name = "addHpButton",
					y = 65,
					type = "button",
					visible = false,
					x = 170,
					label = {
						fontSize = 24,
						textId = 81019,
						type = "label",
						color = ccc3(217, 234, 196)
					}
				},
				{
					style = "button_gre4",
					name = "fujiangButton",
					y = 140,
					type = "button",
					visible = false,
					x = 170,
					label = {
						fontSize = 24,
						textId = 83036,
						type = "label",
						color = ccc3(217, 234, 196)
					}
				},
				{
					style = "button_gre4",
					name = "fujiangCancelButton",
					y = 65,
					type = "button",
					z = 10,
					x = 170,
					visible = false,
					label = {
						fontSize = 24,
						textId = 83037,
						type = "label",
						color = ccc3(217, 234, 196)
					}
				},
				{
					style = "button_yel4",
					name = "juexingtackoffButton",
					y = 65,
					type = "button",
					visible = false,
					x = 170,
					label = {
						fontSize = 24,
						textId = 82016,
						type = "label",
						color = ccc3(217, 234, 196)
					}
				}
			}
		},
		{
			name = "fujiangMain",
			z = 10,
			visible = false,
			type = "sprite9",
			y = 335,
			x = 642,
			middleRect = CCRectMake(30, 30, 45, 45),
			preferedSize = CCSizeMake(338, 437),
			pic = {
				frame = true,
				path = "bigPanel.png"
			},
			children = {
				{
					x = 70,
					name = "generalPic1",
					y = 380,
					type = "sprite",
					scale = 0.9,
					pic = {
						frame = false,
						path = "res/ui/general/deputy/fj_btn_gs.png"
					}
				},
				{
					x = 70,
					name = "generalPic2",
					y = 300,
					type = "sprite",
					scale = 0.9,
					pic = {
						frame = false,
						path = "res/ui/general/deputy/fj_btn_gs.png"
					}
				},
				{
					x = 70,
					name = "generalPic3",
					y = 220,
					type = "sprite",
					scale = 0.9,
					pic = {
						frame = false,
						path = "res/ui/general/deputy/fj_btn_gs.png"
					}
				},
				{
					x = 70,
					name = "generalPic4",
					y = 140,
					type = "sprite",
					scale = 0.9,
					pic = {
						frame = false,
						path = "res/ui/general/deputy/fj_btn_gs.png"
					}
				},
				{
					x = 70,
					name = "generalPic5",
					y = 60,
					type = "sprite",
					scale = 0.9,
					pic = {
						frame = false,
						path = "res/ui/general/deputy/fj_btn_gs.png"
					}
				},
				{
					x = 280,
					name = "fujiangGeneralPic1",
					y = 380,
					type = "sprite",
					scale = 0.9,
					pic = {
						frame = false,
						path = "res/ui/general/deputy/fj_btn_gs.png"
					}
				},
				{
					x = 280,
					name = "fujiangGeneralPic2",
					y = 300,
					type = "sprite",
					scale = 0.9,
					pic = {
						frame = false,
						path = "res/ui/general/deputy/fj_btn_gs.png"
					}
				},
				{
					x = 280,
					name = "fujiangGeneralPic3",
					y = 220,
					type = "sprite",
					scale = 0.9,
					pic = {
						frame = false,
						path = "res/ui/general/deputy/fj_btn_gs.png"
					}
				},
				{
					x = 280,
					name = "fujiangGeneralPic4",
					y = 140,
					type = "sprite",
					scale = 0.9,
					pic = {
						frame = false,
						path = "res/ui/general/deputy/fj_btn_gs.png"
					}
				},
				{
					x = 280,
					name = "fujiangGeneralPic5",
					y = 60,
					type = "sprite",
					scale = 0.9,
					pic = {
						frame = false,
						path = "res/ui/general/deputy/fj_btn_gs.png"
					}
				},
				{
					h = 60,
					name = "generalExchange1",
					zoomOnTouchDown = true,
					type = "button",
					w = 60,
					y = 380,
					x = 175,
					normal = {
						frame = false,
						path = "res/ui/general/deputy/150150.png"
					},
					touched = {
						frame = false,
						path = "res/ui/general/deputy/150150.png"
					},
					label = {
						fontSize = 21,
						textId = 83038,
						type = "label",
						color = ccc3(227, 188, 70)
					}
				},
				{
					h = 60,
					name = "generalExchange2",
					zoomOnTouchDown = true,
					type = "button",
					w = 60,
					y = 300,
					x = 175,
					normal = {
						frame = false,
						path = "res/ui/general/deputy/150150.png"
					},
					touched = {
						frame = false,
						path = "res/ui/general/deputy/150150.png"
					},
					label = {
						fontSize = 21,
						textId = 83038,
						type = "label",
						color = ccc3(227, 188, 70)
					}
				},
				{
					h = 60,
					name = "generalExchange3",
					zoomOnTouchDown = true,
					type = "button",
					w = 60,
					y = 220,
					x = 175,
					normal = {
						frame = false,
						path = "res/ui/general/deputy/150150.png"
					},
					touched = {
						frame = false,
						path = "res/ui/general/deputy/150150.png"
					},
					label = {
						fontSize = 21,
						textId = 83038,
						type = "label",
						color = ccc3(227, 188, 70)
					}
				},
				{
					h = 60,
					name = "generalExchange4",
					zoomOnTouchDown = true,
					type = "button",
					w = 60,
					y = 140,
					x = 175,
					normal = {
						frame = false,
						path = "res/ui/general/deputy/150150.png"
					},
					touched = {
						frame = false,
						path = "res/ui/general/deputy/150150.png"
					},
					label = {
						fontSize = 21,
						textId = 83038,
						type = "label",
						color = ccc3(227, 188, 70)
					}
				},
				{
					h = 60,
					name = "generalExchange5",
					zoomOnTouchDown = true,
					type = "button",
					w = 60,
					y = 60,
					x = 175,
					normal = {
						frame = false,
						path = "res/ui/general/deputy/150150.png"
					},
					touched = {
						frame = false,
						path = "res/ui/general/deputy/150150.png"
					},
					label = {
						fontSize = 21,
						textId = 83038,
						type = "label",
						color = ccc3(227, 188, 70)
					}
				},
				{
					scale = 0.9,
					name = "fujiangFollow1",
					h = 83,
					type = "button",
					w = 83,
					y = 380,
					x = 280,
					normal = {
						frame = false,
						path = "res/ui/general/deputy/fj_btn_gs.png"
					},
					touched = {
						frame = false,
						path = "res/ui/general/deputy/fj_btn_gs_c.png"
					}
				},
				{
					scale = 0.9,
					name = "fujiangFollow2",
					h = 82,
					type = "button",
					w = 83,
					y = 300,
					x = 280,
					normal = {
						frame = false,
						path = "res/ui/general/deputy/fj_btn_gs.png"
					},
					touched = {
						frame = false,
						path = "res/ui/general/deputy/fj_btn_gs_c.png"
					}
				},
				{
					scale = 0.9,
					name = "fujiangFollow3",
					h = 82,
					type = "button",
					w = 83,
					y = 220,
					x = 280,
					normal = {
						frame = false,
						path = "res/ui/general/deputy/fj_btn_gs.png"
					},
					touched = {
						frame = false,
						path = "res/ui/general/deputy/fj_btn_gs_c.png"
					}
				},
				{
					scale = 0.9,
					name = "fujiangFollow4",
					h = 82,
					type = "button",
					w = 83,
					y = 140,
					x = 280,
					normal = {
						frame = false,
						path = "res/ui/general/deputy/fj_btn_gs.png"
					},
					touched = {
						frame = false,
						path = "res/ui/general/deputy/fj_btn_gs_c.png"
					}
				},
				{
					scale = 0.9,
					name = "fujiangFollow5",
					h = 82,
					type = "button",
					w = 83,
					y = 60,
					x = 280,
					normal = {
						frame = false,
						path = "res/ui/general/deputy/fj_btn_gs.png"
					},
					touched = {
						frame = false,
						path = "res/ui/general/deputy/fj_btn_gs_c.png"
					}
				}
			}
		},
		{
			y = 0,
			name = "equipStoreNode",
			type = "node",
			x = 0,
			children = {
				{
					y = 19,
					name = "equipStoreView",
					type = "TableView",
					visible = false,
					x = 19,
					viewSize = CCSizeMake(405, 96),
					dirction = kCCScrollViewDirectionHorizontal
				}
			}
		},
		{
			y = 285,
			name = "generalEquipNode",
			type = "node",
			x = 260,
			children = {
				{
					scale = 0.8,
					name = "generalEquipWeapon",
					h = 102,
					type = "button",
					w = 102,
					y = 127,
					x = 82,
					normal = {
						frame = true,
						path = "general_now_list_bg.jpg"
					},
					touched = {
						frame = true,
						path = "general_now_list_bg_on.jpg"
					},
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							y = 51,
							x = 51,
							type = "sprite",
							zorder = 1,
							pic = {
								frame = true,
								path = "general_equipType1.png"
							}
						}
					}
				},
				{
					scale = 0.8,
					name = "generalEquipArmor",
					h = 102,
					type = "button",
					w = 102,
					y = 44,
					x = 82,
					normal = {
						frame = true,
						path = "general_now_list_bg.jpg"
					},
					touched = {
						frame = true,
						path = "general_now_list_bg_on.jpg"
					},
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							y = 51,
							x = 51,
							type = "sprite",
							zorder = 1,
							pic = {
								frame = true,
								path = "general_equipType3.png"
							}
						}
					}
				},
				{
					scale = 0.8,
					name = "generalEquipBingFu",
					h = 102,
					type = "button",
					w = 102,
					y = -39,
					x = 82,
					normal = {
						frame = true,
						path = "general_now_list_bg.jpg"
					},
					touched = {
						frame = true,
						path = "general_now_list_bg_on.jpg"
					},
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							y = 51,
							x = 51,
							type = "sprite",
							zorder = 1,
							pic = {
								frame = true,
								path = "general_equipType5.png"
							}
						}
					}
				},
				{
					scale = 0.8,
					name = "generalEquipHorse",
					h = 102,
					type = "button",
					w = 102,
					y = 127,
					x = 165,
					normal = {
						frame = true,
						path = "general_now_list_bg.jpg"
					},
					touched = {
						frame = true,
						path = "general_now_list_bg_on.jpg"
					},
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							y = 51,
							x = 51,
							type = "sprite",
							zorder = 1,
							pic = {
								frame = true,
								path = "general_equipType2.png"
							}
						}
					}
				},
				{
					scale = 0.8,
					name = "generalEquipCloak",
					h = 102,
					type = "button",
					w = 102,
					y = 44,
					x = 165,
					normal = {
						frame = true,
						path = "general_now_list_bg.jpg"
					},
					touched = {
						frame = true,
						path = "general_now_list_bg_on.jpg"
					},
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							y = 51,
							x = 51,
							type = "sprite",
							zorder = 1,
							pic = {
								frame = true,
								path = "general_equipType4.png"
							}
						}
					}
				},
				{
					scale = 0.8,
					name = "generalEquipFlag",
					h = 102,
					type = "button",
					w = 102,
					y = -39,
					x = 165,
					normal = {
						frame = true,
						path = "general_now_list_bg.jpg"
					},
					touched = {
						frame = true,
						path = "general_now_list_bg_on.jpg"
					},
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							y = 51,
							x = 51,
							type = "sprite",
							zorder = 1,
							pic = {
								frame = true,
								path = "general_equipType6.png"
							}
						}
					}
				},
				{
					scale = 0.8,
					name = "generalEquipTreasure",
					h = 102,
					type = "button",
					w = 102,
					y = -122,
					x = 82,
					normal = {
						frame = true,
						path = "general_now_list_bg.jpg"
					},
					touched = {
						frame = true,
						path = "general_now_list_bg_on.jpg"
					},
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							y = 51,
							x = 51,
							type = "sprite",
							zorder = 1,
							pic = {
								frame = true,
								path = "general_treasureBackground.png"
							}
						}
					}
				},
				{
					scale = 0.8,
					name = "fujiangKuang",
					h = 102,
					type = "button",
					w = 102,
					y = -122,
					x = 165,
					normal = {
						frame = true,
						path = "general_now_list_bg.jpg"
					},
					touched = {
						frame = true,
						path = "general_now_list_bg_on.jpg"
					},
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							y = 51,
							x = 51,
							type = "sprite",
							zorder = 1,
							pic = {
								frame = true,
								path = "general_treasureBackground.png"
							}
						}
					}
				}
			}
		},
		{
			type = "node",
			name = "node_medal",
			y = 285,
			visible = false,
			x = 260,
			children = {
				{
					scale = 0.8,
					name = "btn_medal1",
					h = 50,
					type = "button",
					w = 50,
					y = 147,
					x = 18,
					normal = {
						frame = true,
						path = "general_attrib_icon_bg.jpg"
					},
					touched = {
						frame = true,
						path = "general_attrib_icon_on.jpg"
					},
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							x = 25,
							name = "icon_medal1",
							y = 25,
							type = "sprite",
							scale = 0.56,
							pic = {
								path = "res/ui/general/xz_btn_xunzhang_add.png"
							}
						}
					}
				},
				{
					scale = 0.8,
					name = "btn_medal2",
					h = 50,
					type = "button",
					w = 50,
					y = 107,
					x = 18,
					normal = {
						frame = true,
						path = "general_attrib_icon_bg.jpg"
					},
					touched = {
						frame = true,
						path = "general_attrib_icon_on.jpg"
					},
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							x = 25,
							name = "icon_medal2",
							y = 25,
							type = "sprite",
							scale = 0.56,
							pic = {
								path = "res/ui/general/xz_btn_xunzhang_add.png"
							}
						}
					}
				}
			}
		},
		{
			x = 642,
			name = "equipTipPanel",
			y = 275,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "general_right_view_bg2.jpg"
			},
			children = {
				{
					y = 0,
					name = "equipTipNode",
					x = 0,
					type = "node"
				},
				{
					style = "button_gre4",
					name = "wearButton",
					y = 65,
					type = "button",
					visible = false,
					x = 170,
					label = {
						fontSize = 24,
						textId = 82017,
						type = "label",
						color = ccc3(217, 234, 196)
					}
				},
				{
					style = "button_yel4",
					name = "tackoffButton",
					y = 65,
					type = "button",
					visible = false,
					x = 170,
					label = {
						fontSize = 24,
						textId = 82016,
						type = "label",
						color = ccc3(217, 234, 196)
					}
				}
			}
		},
		{
			x = 645,
			name = "strategyTipPanel",
			y = 415,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "general_tips_view_bg.png"
			}
		},
		{
			y = 0,
			name = "prisonNode",
			visible = false,
			type = "node",
			x = 0,
			children = {
				{
					height = 95,
					name = "topPrisonMask",
					x = 5,
					type = "layerColor",
					y = 450,
					width = 465,
					color = ccc4(0, 0, 0, 180)
				},
				{
					height = 540,
					name = "rightPrisonMask",
					x = 470,
					type = "layerColor",
					y = 5,
					width = 345,
					color = ccc4(0, 0, 0, 180)
				},
				{
					height = 115,
					name = "bottomPrisonMask",
					x = 5,
					type = "layerColor",
					y = 5,
					width = 465,
					color = ccc4(0, 0, 0, 180)
				},
				{
					y = 285,
					x = 240,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/general/captive_cage.png"
					},
					children = {
						{
							x = 223,
							name = "inPrisonLabel",
							y = 165,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/general/captive_cell.png"
							}
						},
						{
							x = 223,
							name = "escapeLabel",
							y = 165,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/general/captive_escape.png"
							}
						},
						{
							y = 115,
							name = "escapeTimerNode",
							x = 223,
							type = "node"
						}
					}
				},
				{
					style = "button_gre4",
					name = "escapeButton",
					y = 65,
					type = "button",
					x = 223,
					label = {
						fontSize = 24,
						textId = 81002,
						type = "label",
						color = ccc3(217, 234, 196)
					}
				},
				{
					style = "button_gre4",
					name = "redeemerButton",
					y = 65,
					type = "button",
					x = 223,
					children = {
						{
							x = 45,
							y = 37,
							type = "sprite",
							pic = {
								frame = true,
								path = "res_icon_19_small.png"
							}
						},
						{
							text = "5",
							startCharMap = 48,
							x = 75,
							type = "atlaslabel",
							y = 37,
							itemWidth = 16,
							pic = "res/ui/common/number/up_numb.png",
							itemHeight = 21
						},
						{
							fontSize = 24,
							y = 38,
							type = "label",
							x = 185,
							textId = 81003,
							color = ccc3(217, 234, 196)
						}
					}
				}
			}
		}
	}
}
