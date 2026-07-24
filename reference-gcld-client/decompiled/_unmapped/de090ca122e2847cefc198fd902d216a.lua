local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = colorQuality[3]
local var_0_2 = colorQuality[2]
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[6]
local var_0_6 = class("CorpsPanel", function()
	return createBaseLayer()
end)

var_0_6.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			name = "panel",
			type = "sprite9",
			preferedSize = CCSizeMake(960, 580),
			middleRect = CCRectMake(30, 30, 45, 45),
			x = visibleSize.width / 2,
			y = visibleSize.height / 2 - 30,
			pic = {
				frame = true,
				path = "bigPanel.png"
			},
			children = {
				{
					x = 924,
					name = "btn_close",
					h = 33,
					type = "button",
					w = 32,
					y = 604,
					scale = 2,
					normal = {
						frame = true,
						path = "btn_close_a.png"
					},
					touched = {
						frame = true,
						path = "btn_close_c.png"
					}
				},
				{
					y = 290,
					name = "bg",
					type = "sprite9",
					x = 480,
					preferedSize = CCSizeMake(915, 532),
					middleRect = CCRectMake(10, 10, 70, 70),
					pic = {
						path = "res/ui/common/panel/comm_view.png"
					},
					children = {
						{
							y = 225,
							name = "bg1",
							type = "sprite",
							x = 185,
							pic = {
								path = "res/ui/corps/jtmj_bg1.png"
							},
							children = {
								{
									y = 360,
									type = "sprite",
									x = 70,
									pic = {
										path = "res/ui/tavern/gen_por_view_bg.jpg"
									},
									children = {
										{
											x = 39,
											name = "playerPic",
											y = 39,
											type = "sprite",
											scale = 0.8,
											pic = {
												path = "res/ui/common/playerHead/playerHead_icon_0.png"
											}
										}
									}
								},
								{
									y = 390,
									type = "sprite",
									x = 230,
									pic = {
										path = "res/ui/corps/jtmj_word_di.png"
									},
									children = {
										{
											fontSize = 23,
											name = "playerName",
											y = 21,
											type = "label",
											x = 101
										}
									}
								},
								{
									y = 350,
									type = "sprite",
									x = 230,
									pic = {
										path = "res/ui/corps/jtmj_word_di.png"
									},
									children = {
										{
											fontSize = 23,
											name = "donationNum",
											y = 21,
											type = "label",
											x = 101
										}
									}
								},
								{
									y = 310,
									type = "sprite",
									x = 230,
									pic = {
										path = "res/ui/corps/jtmj_word_di.png"
									},
									children = {
										{
											fontSize = 23,
											name = "otherNationNum",
											y = 21,
											type = "label",
											x = 101
										}
									}
								},
								{
									fontSize = 23,
									y = 230,
									type = "label",
									x = 10,
									textId = 136214,
									anchorPoint = ccp(0, 0.5)
								},
								{
									fontSize = 23,
									y = 140,
									type = "label",
									x = 10,
									textId = 136215,
									anchorPoint = ccp(0, 0.5)
								},
								{
									y = 301.3167,
									x = 70,
									type = "sprite",
									pic = {
										path = "res/ui/corps/jtmj_word_zhg.png"
									}
								},
								{
									name = "btn_transfer",
									h = 62,
									type = "button",
									w = 160,
									y = 40,
									visible = false,
									x = 90,
									normal = {
										path = "res/ui/common/button/public_btn_red.png"
									},
									touched = {
										path = "res/ui/common/button/public_btn_red_c.png"
									},
									disable = {
										path = "res/ui/common/button/public_btn_red_g.png"
									},
									children = {
										{
											fontSize = 25,
											y = 33,
											type = "label",
											x = 80,
											textId = 136230
										}
									}
								},
								{
									name = "btn_go",
									h = 62,
									type = "button",
									w = 160,
									y = 40,
									visible = false,
									x = 265,
									normal = {
										path = "res/ui/common/button/public_btn_green.png"
									},
									touched = {
										path = "res/ui/common/button/public_btn_green_c.png"
									},
									disable = {
										path = "res/ui/common/button/public_btn_green_g.png"
									},
									children = {
										{
											fontSize = 25,
											y = 33,
											type = "label",
											x = 80,
											textId = 135604
										}
									}
								}
							}
						},
						{
							y = 225,
							name = "bg2",
							type = "sprite",
							x = 637,
							pic = {
								path = "res/ui/corps/jtmj_bg2.png"
							},
							children = {
								{
									y = 392,
									type = "sprite",
									x = 271,
									pic = {
										path = "res/ui/corps/jtmj_word_di_l.png"
									},
									children = {
										{
											y = 32,
											name = "titleSp",
											type = "sprite",
											x = 269,
											pic = {
												path = "res/ui/corps/jumj_word_jrjt.png"
											}
										},
										{
											visible = false,
											name = "bg_selfDonationNum",
											type = "sprite9",
											y = 32,
											x = 60,
											preferedSize = CCSizeMake(100, 35),
											middleRect = CCRectMake(42, 17, 1, 1),
											pic = {
												path = "res/ui/corps/jtmj_word_di_s.png"
											},
											children = {
												{
													y = 18,
													x = 18,
													type = "sprite",
													scale = 0.26,
													pic = {
														path = "res/ui/activity/card/cjfp_jl_hy.png"
													}
												},
												{
													fontSize = 20,
													name = "selfDonationNum",
													y = 18,
													type = "label",
													x = 66
												}
											}
										},
										{
											fontSize = 20,
											name = "donationCd",
											y = 100,
											type = "label",
											x = 526,
											color = var_0_3,
											anchorPoint = ccp(1, 0.5)
										}
									}
								},
								{
									y = 150,
									name = "btn_create",
									h = 62,
									type = "button",
									w = 180,
									visible = false,
									x = 271,
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
											x = 90,
											textId = 136231
										},
										{
											y = 125,
											x = 90,
											type = "sprite",
											pic = {
												path = "res/ui/corps/jtmj_word_swcjjt.png"
											}
										}
									}
								},
								{
									type = "node",
									name = "node_phantom",
									y = 0,
									visible = false,
									x = 0,
									children = {
										{
											y = 340,
											type = "sprite",
											x = 270,
											pic = {
												path = "res/ui/corps/jtmj_tips_di.png"
											},
											children = {
												{
													y = 0,
													name = "view_msg",
													type = "scrollview",
													x = 0,
													viewSize = CCSizeMake(524, 61),
													children = {
														{
															height = 61,
															name = "layer_msg",
															x = 0,
															type = "layerColor",
															y = 0,
															width = 524,
															color = ccc4(0, 0, 0, 0)
														}
													}
												},
												{
													x = 490,
													name = "node_btnShow",
													y = 34,
													type = "node",
													scale = -1,
													children = {
														{
															zoomOnTouchDown = true,
															name = "btn_show",
															h = 50,
															type = "button",
															w = 50,
															y = 0,
															x = 0,
															normal = {
																path = "res/ui/common/button/gxb_btn_small.png"
															},
															touched = {
																path = "res/ui/common/button/gxb_btn_small_c.png"
															}
														}
													}
												}
											}
										},
										{
											fontSize = 25,
											name = "hasPhantomNum",
											y = 280,
											type = "label",
											x = 18,
											anchorPoint = ccp(0, 0.5)
										},
										{
											zoomOnTouchDown = true,
											name = "myNationBtn",
											h = 62,
											type = "button",
											w = 62,
											y = 400,
											visible = false,
											x = 500,
											normal = {
												path = "res/ui/corps/fsgjt_btn_bg.png"
											},
											touched = {
												path = "res/ui/corps/fsgjt_btn_bg_c.png"
											}
										},
										{
											zoomOnTouchDown = true,
											name = "otherNationBtn",
											h = 62,
											type = "button",
											w = 62,
											y = 400,
											visible = false,
											x = 500,
											normal = {
												path = "res/ui/corps/fsgjt_btn_fs.png"
											},
											touched = {
												path = "res/ui/corps/fsgjt_btn_fs_c.png"
											}
										}
									}
								}
							}
						},
						{
							y = 470,
							x = 458,
							type = "sprite",
							pic = {
								path = "res/ui/general/jailView/comm_list_laofang_3.png"
							}
						},
						{
							y = 490,
							name = "title",
							type = "sprite",
							x = 460,
							pic = {
								path = "res/ui/corps/jtmj_title.png"
							}
						},
						{
							x = 0,
							height = 450,
							visible = false,
							type = "layerColor",
							name = "maskLayer",
							y = 0,
							width = 915,
							color = ccc4(0, 0, 0, 180),
							children = {
								{
									y = 0,
									h = 450,
									type = "button",
									w = 915,
									x = 0,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									},
									anchorPoint = ccp(0, 0)
								}
							}
						},
						{
							visible = false,
							name = "bg_list",
							type = "sprite9",
							y = 266,
							x = 458,
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
						},
						{
							visible = false,
							name = "bg_list2",
							type = "sprite9",
							y = 176,
							x = 637,
							preferedSize = CCSizeMake(540, 320),
							middleRect = CCRectMake(24, 24, 1, 1),
							pic = {
								frame = true,
								path = "common_tip_frame_small.png"
							},
							children = {
								{
									y = 0,
									h = 320,
									type = "button",
									w = 540,
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
									y = 292,
									type = "sprite",
									scaleX = 0.585,
									x = 270,
									pic = {
										path = "res/ui/rankInfo/workerList/jzke_gjmc_list_up.png"
									}
								},
								{
									fontSize = 22,
									y = 292,
									type = "label",
									x = 10,
									textId = 136225,
									color = var_0_0,
									anchorPoint = ccp(0, 0.5)
								},
								{
									fontSize = 22,
									y = 292,
									type = "label",
									x = 190,
									textId = 136226,
									color = var_0_0,
									anchorPoint = ccp(0, 0.5)
								},
								{
									fontSize = 22,
									y = 292,
									type = "label",
									x = 370,
									textId = 85017,
									color = var_0_0,
									anchorPoint = ccp(0, 0.5)
								},
								{
									fontSize = 22,
									y = 292,
									type = "label",
									x = 490,
									textId = 136228,
									color = var_0_0
								}
							}
						},
						{
							visible = false,
							name = "bg_list3",
							type = "sprite9",
							y = 176,
							x = 637,
							preferedSize = CCSizeMake(540, 320),
							middleRect = CCRectMake(24, 24, 1, 1),
							pic = {
								frame = true,
								path = "common_tip_frame_small.png"
							},
							children = {
								{
									fontSize = 22,
									name = "otherMsgLb",
									y = 341,
									type = "label",
									x = 64,
									color = var_0_0,
									anchorPoint = ccp(0, 0.5)
								},
								{
									y = 0,
									h = 320,
									type = "button",
									w = 540,
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
									y = 292,
									type = "sprite",
									scaleX = 0.585,
									x = 270,
									pic = {
										path = "res/ui/rankInfo/workerList/jzke_gjmc_list_up.png"
									}
								},
								{
									fontSize = 22,
									y = 292,
									type = "label",
									x = 10,
									textId = 136235,
									color = var_0_0,
									anchorPoint = ccp(0, 0.5)
								},
								{
									fontSize = 22,
									y = 292,
									type = "label",
									x = 190,
									textId = 136236,
									color = var_0_0,
									anchorPoint = ccp(0, 0.5)
								},
								{
									fontSize = 22,
									y = 292,
									type = "label",
									x = 320,
									textId = 136237,
									color = var_0_0,
									anchorPoint = ccp(0, 0.5)
								},
								{
									fontSize = 22,
									y = 292,
									type = "label",
									x = 490,
									textId = 136238,
									color = var_0_0
								}
							}
						},
						{
							type = "sprite",
							name = "state",
							y = 250,
							visible = false,
							x = 458,
							pic = {
								path = "res/ui/corps/jt_word_dfqrzqsh.png"
							}
						},
						{
							name = "btn_cancel",
							h = 62,
							type = "button",
							w = 160,
							y = 140,
							visible = false,
							x = 458,
							normal = {
								path = "res/ui/common/button/public_btn_red.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_red_c.png"
							},
							disable = {
								path = "res/ui/common/button/public_btn_red_g.png"
							},
							children = {
								{
									fontSize = 25,
									y = 33,
									type = "label",
									x = 80,
									textId = 10002
								},
								{
									fontSize = 30,
									name = "responseCd",
									y = 85,
									type = "label",
									x = 80,
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
var_0_6.layout_skill = {
	zoomOnTouchDown = true,
	name = "btn_skill",
	h = 50,
	type = "button",
	w = 50,
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
			y = 25,
			name = "bg_skill",
			type = "sprite",
			x = 25,
			pic = {
				path = "res/ui/corps/jtmj_icon_di.png"
			},
			children = {
				{
					x = 26,
					name = "icon",
					y = 26,
					type = "sprite",
					scale = 0.58,
					pic = {
						path = "res/ui/corps/tujin.jpg"
					}
				}
			}
		}
	}
}
var_0_6.layout_general = {
	y = 0,
	name = "node",
	type = "node",
	x = 0,
	children = {
		{
			y = 0,
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/tavern/gen_por_view_bg.jpg"
			},
			children = {
				{
					y = 39,
					name = "icon",
					type = "sprite",
					x = 39,
					pic = {
						path = "res/ui/common/generalPic/generalPic_0.jpg"
					}
				}
			}
		},
		{
			y = -65,
			name = "bg_num",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/corps/jtmj_word_di_s.png"
			},
			children = {
				{
					y = 18,
					x = 18,
					type = "sprite",
					scale = 0.26,
					pic = {
						path = "res/ui/activity/card/cjfp_jl_hy.png"
					}
				},
				{
					fontSize = 23,
					name = "num",
					y = 18,
					type = "label",
					x = 60
				}
			}
		},
		{
			name = "btn_addPhantom",
			h = 58,
			type = "button",
			w = 97,
			y = -115,
			x = 0,
			normal = {
				frame = true,
				path = "btn1_yel_a.png"
			},
			touched = {
				frame = true,
				path = "btn1_yel_c.png"
			},
			disable = {
				frame = true,
				path = "btn1_yel_g.png"
			},
			children = {
				{
					fontSize = 25,
					y = 30,
					type = "label",
					x = 48,
					textId = 143010
				}
			}
		}
	}
}
var_0_6.layout_cell_candidate = {
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
			color = var_0_4,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 30,
			name = "playerName",
			y = 25,
			type = "label",
			x = 130,
			color = var_0_5,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 30,
			y = 60,
			type = "label",
			x = 420,
			textId = 136216,
			anchorPoint = ccp(1, 0.5)
		}
	}
}
var_0_6.layout_cell_phantom = {
	y = 0,
	name = "node",
	type = "node",
	x = 0,
	children = {
		{
			y = 0,
			name = "bg",
			type = "sprite",
			scaleX = 0.585,
			x = 270,
			anchorPoint = ccp(0.5, 0),
			pic = {
				path = "res/ui/rankInfo/workerList/jzke_gjmc_list_long01.png"
			}
		},
		{
			fontSize = 20,
			name = "playerName",
			y = 20,
			type = "label",
			x = 10,
			color = var_0_4,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 20,
			name = "generalName",
			y = 20,
			type = "label",
			x = 190,
			color = var_0_5,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 20,
			name = "generalLv",
			y = 20,
			type = "label",
			x = 370,
			anchorPoint = ccp(0, 0.5)
		},
		{
			zoomOnTouchDown = true,
			name = "btn_kick",
			h = 34,
			type = "button",
			w = 34,
			y = 20,
			x = 490,
			normal = {
				path = "res/ui/corps/djgl_jt_btn_ql.png"
			},
			touched = {
				path = "res/ui/corps/djgl_jt_btn_ql_c.png"
			}
		}
	}
}
var_0_6.layout_cell_phantom2 = {
	y = 0,
	name = "node",
	type = "node",
	x = 0,
	children = {
		{
			y = 0,
			name = "bg",
			type = "sprite",
			scaleX = 0.585,
			x = 270,
			anchorPoint = ccp(0.5, 0),
			pic = {
				path = "res/ui/rankInfo/workerList/jzke_gjmc_list_long01.png"
			}
		},
		{
			fontSize = 20,
			name = "playerName",
			y = 20,
			type = "label",
			x = 10,
			color = var_0_4,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 20,
			name = "mineNum",
			y = 20,
			type = "label",
			x = 190,
			color = var_0_5,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 20,
			name = "kingName",
			y = 20,
			type = "label",
			x = 320,
			anchorPoint = ccp(0, 0.5)
		},
		{
			x = 480,
			name = "btn_kick2",
			h = 179,
			type = "button",
			w = 206,
			y = 20,
			scale = 0.26,
			normal = {
				path = "res/ui/activity/card/cjfp_jl_hy.png"
			},
			touched = {
				path = "res/ui/activity/card/cjfp_jl_hy.png"
			}
		},
		{
			fontSize = 20,
			name = "phantomNum",
			y = 20,
			type = "label",
			x = 506,
			anchorPoint = ccp(0, 0.5)
		}
	}
}

function var_0_6.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		local var_3_0 = arg_3_0.data or arg_3_0.action.data

		arg_2_0:showPanel(var_3_0)
	end

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		kfcmgr.sendRequest(var_2_0, actions.getCorpsInfo, arg_2_0.info.cityId)
	else
		cmgr.sendRequest(var_2_0, actions.getCorpsInfo, 0)
	end
end

function var_0_6.onCreateCorps(arg_4_0)
	local function var_4_0(arg_5_0)
		arg_4_0:refresh()
	end

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		kfcmgr.sendRequest(var_4_0, actions.createCorps, arg_4_0.info.cityId)
	else
		cmgr.sendRequest(var_4_0, actions.createCorps, 0)
	end
end

function var_0_6.onAddPhantom(arg_6_0, arg_6_1, arg_6_2)
	local function var_6_0(arg_7_0)
		smgr.showProgramText("+1", colorTips.green, arg_6_2)
		arg_6_0:refresh()
	end

	local function var_6_1()
		local var_8_0 = arg_6_0.info.generals[arg_6_1]

		if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
			kfcmgr.sendRequest(var_6_0, actions.corpsAddPhantom, arg_6_0.info.corpsId, var_8_0.generalId)
		else
			cmgr.sendRequest(var_6_0, actions.corpsAddPhantom, arg_6_0.info.corpsId, var_8_0.generalId)
		end
	end

	if arg_6_0.info.needCost then
		messageBox.showChargeWin("", language.get(136222), "jiebingGold", var_6_1)
	else
		var_6_1()
	end
end

function var_0_6.onGetCandidate(arg_9_0)
	local function var_9_0(arg_10_0)
		local var_10_0 = arg_10_0.data or arg_10_0.action.data

		arg_9_0.view.widgets.bg_list:setVisible(true)
		arg_9_0:createCandidateList(var_10_0.candidates)
	end

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		kfcmgr.sendRequest(var_9_0, actions.corpsGetCandidate)
	else
		cmgr.sendRequest(var_9_0, actions.corpsGetCandidate)
	end
end

function var_0_6.onTransferCorps(arg_11_0, arg_11_1)
	local function var_11_0(arg_12_0)
		arg_11_0.view.widgets.bg_list:setVisible(false)
		arg_11_0:refresh()
	end

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		kfcmgr.sendRequest(var_11_0, actions.transferCorps, arg_11_1)
	else
		cmgr.sendRequest(var_11_0, actions.transferCorps, arg_11_1)
	end
end

function var_0_6.onCancelTransferCorps(arg_13_0)
	local function var_13_0(arg_14_0)
		arg_13_0:refresh()
	end

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		kfcmgr.sendRequest(var_13_0, actions.cancelTransferCorps)
	else
		cmgr.sendRequest(var_13_0, actions.cancelTransferCorps)
	end
end

function var_0_6.onGo(arg_15_0)
	local function var_15_0(arg_16_0)
		return
	end

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		kfcmgr.sendRequest(var_15_0, actions.corpsGo, arg_15_0.info.corpsId)
	else
		cmgr.sendRequest(var_15_0, actions.corpsGo, arg_15_0.info.corpsId)
	end
end

function var_0_6.onGetPhantomList(arg_17_0, arg_17_1)
	local function var_17_0(arg_18_0)
		local var_18_0 = arg_18_0.data or arg_18_0.action.data

		arg_17_0:createPhantomList(var_18_0.phantomlist)

		if not arg_17_1 then
			arg_17_0.view.widgets.bg_list2:setVisible(true)
		end

		arg_17_0:createOtherNationList(var_18_0.slaveNationInfo)
	end

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		kfcmgr.sendRequest(var_17_0, actions.corpsGetPhantomList, arg_17_0.info.corpsId)
	else
		cmgr.sendRequest(var_17_0, actions.corpsGetPhantomList, arg_17_0.info.corpsId)
	end
end

function var_0_6.onKickPhantom(arg_19_0, arg_19_1, arg_19_2)
	local function var_19_0(arg_20_0)
		local var_20_0 = arg_20_0.data or arg_20_0.action.data

		arg_19_0:createPhantomList(var_20_0.phantomlist)
		arg_19_0:createOtherNationList(var_20_0.slaveNationInfo)
	end

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		kfcmgr.sendRequest(var_19_0, actions.corpsKickPhantom, arg_19_0.info.corpsId, arg_19_1, arg_19_2)
	else
		cmgr.sendRequest(var_19_0, actions.corpsKickPhantom, arg_19_0.info.corpsId, arg_19_1, arg_19_2)
	end
end

function var_0_6.handlerPushCorpsAction(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_1.data or arg_21_1.action.data
	local var_21_1 = var_21_0.state

	if var_21_1 then
		if var_21_1.noResponse == true then
			arg_21_0:showEffectState("res/ui/corps/jt_word_dfwxyqzcyq.png")
		end

		if var_21_1.agree ~= nil then
			if arg_21_0.info.playerId == user.player.playerId then
				local var_21_2 = var_21_1.agree == true and "jt_word_dfytyzhqgh.png" or "jt_word_dfjjlndyq.png"

				arg_21_0:showEffectState("res/ui/corps/" .. var_21_2)
			else
				arg_21_0:refresh()
			end
		end

		if var_21_1.donationState == false then
			arg_21_0:removeFromParentAndCleanup(true)
		end
	end

	local var_21_3 = var_21_0.corpsInfo

	if var_21_3 and var_21_3.lpPlayerName ~= nil then
		if arg_21_0.msg ~= nil then
			local var_21_4 = arg_21_0.msg
			local var_21_5 = CCArray:create()

			var_21_5:addObject(CCMoveTo:create(0.3, ccp(56, 54)))
			var_21_5:addObject(CCCallFunc:create(function()
				var_21_4:removeFromParentAndCleanup(true)
			end))

			local var_21_6 = CCSequence:create(var_21_5)

			var_21_4:runAction(var_21_6)
		end

		local var_21_7 = CCLabelTTF:create(language.get(136229, var_21_3.lpPlayerName, var_21_3.lpGeneralName), "Thonburi", 22)

		var_21_7:setAnchorPoint(ccp(0, 0.5))
		var_21_7:setPosition(56, 14)
		var_21_7:setColor(var_0_0)
		var_21_7:setVisible(false)
		arg_21_0.view.widgets.layer_msg:addChild(var_21_7)

		local var_21_8 = CCArray:create()

		var_21_8:addObject(CCDelayTime:create(0.5))
		var_21_8:addObject(CCShow:create())
		var_21_8:addObject(CCMoveTo:create(0.3, ccp(56, 34)))

		local var_21_9 = CCSequence:create(var_21_8)

		var_21_7:runAction(var_21_9)

		arg_21_0.msg = var_21_7
	end
end

function var_0_6.addSkillIcon(arg_23_0)
	if arg_23_0.skillNode then
		arg_23_0.skillNode:removeAllChildrenWithCleanup(true)
	else
		arg_23_0.skillNode = CCNode:create()

		arg_23_0.view.widgets.bg1:addChild(arg_23_0.skillNode, 100)
	end

	local var_23_0 = 180
	local var_23_1 = 230
	local var_23_2 = 180
	local var_23_3 = 140

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.info.skills) do
		local var_23_4 = {}

		uiutil.initWidgets(var_23_4, arg_23_0.layout_skill)
		arg_23_0.skillNode:addChild(var_23_4.widgets.btn_skill)
		var_23_4.widgets.icon:setDisplayFrame(CCSprite:create(string.format("res/ui/corps/%s.jpg", iter_23_1.pic)):displayFrame())

		if iter_23_1.hadOpen then
			var_23_4.widgets.btn_skill:setPosition(var_23_0, var_23_1)

			var_23_0 = var_23_0 + 60
		else
			var_23_4.widgets.btn_skill:setPosition(var_23_2, var_23_3)
			tool.spriteToGray(var_23_4.widgets.icon)

			var_23_2 = var_23_2 + 60
		end

		var_23_4.widgets.btn_skill:addHandleOfControlEvent(function()
			log.info("btn_skill", iter_23_0)
			arg_23_0:showTip(iter_23_0, var_23_4.widgets.btn_skill)
		end, CCControlEventTouchUpInside)
	end
end

function var_0_6.addGeneralIcon(arg_25_0)
	if arg_25_0.generalNode then
		arg_25_0.generalNode:removeAllChildrenWithCleanup(true)
	else
		arg_25_0.generalNode = CCNode:create()

		arg_25_0.view.widgets.bg2:addChild(arg_25_0.generalNode, 100)
	end

	local var_25_0 = 0
	local var_25_1 = 190

	for iter_25_0 = 1, 5 do
		local var_25_2 = 100 * iter_25_0 - 30
		local var_25_3 = arg_25_0.info.generals[iter_25_0]
		local var_25_4 = {}

		uiutil.initWidgets(var_25_4, arg_25_0.layout_general)
		arg_25_0.generalNode:addChild(var_25_4.widgets.node)
		var_25_4.widgets.node:setPosition(var_25_2, var_25_1)

		if var_25_3 then
			var_25_4.widgets.icon:setDisplayFrame(CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", var_25_3.pic)):displayFrame())
			var_25_4.widgets.num:setString(var_25_3.num)
			var_25_4.widgets.btn_addPhantom:addHandleOfControlEvent(function()
				log.info("btn_addPhantom", iter_25_0)

				local var_26_0, var_26_1 = tool.getPositionInScreen(var_25_4.widgets.num)

				arg_25_0:onAddPhantom(iter_25_0, ccp(var_26_0, var_26_1))
			end, CCControlEventTouchUpInside)
		else
			var_25_4.widgets.btn_addPhantom:setEnabled(false)
		end
	end
end

function var_0_6.showTip(arg_27_0, arg_27_1, arg_27_2)
	log.info("should show tips ")

	local var_27_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_27_0:registerScriptTouchHandler(function(arg_28_0, arg_28_1, arg_28_2)
		if arg_28_0 == CCTOUCHBEGAN then
			return true
		elseif arg_28_0 == CCTOUCHMOVED then
			return true
		elseif arg_28_0 == CCTOUCHENDED then
			pcall(var_27_0.removeFromParentAndCleanup, var_27_0, true)

			return true
		end
	end, false, true)
	var_27_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_27_0, 60000)

	local var_27_1 = arg_27_0.info.skills[arg_27_1]
	local var_27_2 = language.get(136220, var_27_1.name, var_27_1.needLv, var_27_1.tips)
	local var_27_3 = {
		name = "tipFrame",
		type = "sprite9Tips",
		pic = {
			frame = true,
			path = "common_tip_frame_small.png"
		},
		anchorPoint = ccp(0, 0),
		middleRect = CCRectMake(24, 24, 1, 1),
		content = {
			{
				fontSize = 20,
				height = 0,
				type = "label",
				width = 0,
				text = var_27_2,
				halign = kCCTextAlignmentLeft
			}
		}
	}
	local var_27_4 = 0
	local var_27_5 = 0
	local var_27_6 = {}

	uiutil.initWidgets(var_27_6, var_27_3)
	var_27_0:addChild(var_27_6.widgets.tipFrame)

	local var_27_7, var_27_8 = tool.getPositionInScreen(arg_27_2)
	local var_27_9 = var_27_7
	local var_27_10 = var_27_8

	var_27_6.widgets.tipFrame:setPosition(ccp(var_27_9, var_27_10))
end

function var_0_6.createCandidateList(arg_29_0, arg_29_1)
	local function var_29_0(arg_30_0, arg_30_1)
		log.info("cell touched at : ", arg_30_1:getIdx())

		local var_30_0 = arg_29_1[arg_30_1:getIdx() + 1]

		arg_29_0:onTransferCorps(var_30_0.playerId)
	end

	local function var_29_1(arg_31_0, arg_31_1)
		return 105, 480
	end

	local function var_29_2(arg_32_0, arg_32_1)
		local var_32_0 = arg_32_0:dequeueCell()

		if var_32_0 then
			var_32_0:removeAllChildrenWithCleanup(true)
		else
			var_32_0 = CCTableViewCell:new()
		end

		local var_32_1 = arg_29_1[arg_32_1 + 1]

		if var_32_1 then
			local var_32_2 = {}

			uiutil.initWidgets(var_32_2, arg_29_0.layout_cell_candidate)
			var_32_0:addChild(var_32_2.widgets.bg)
			var_32_2.widgets.weaponLv:setString(language.get(136217, var_32_1.weaponLv))
			var_32_2.widgets.playerName:setString(var_32_1.playerName)
			var_32_2.widgets.icon:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerHead/playerHead_icon_%s.png", var_32_1.pic)):displayFrame())
		end

		return var_32_0
	end

	local function var_29_3()
		if arg_29_1 and #arg_29_1 > 0 then
			return #arg_29_1
		else
			return 0
		end
	end

	local var_29_4 = CCTableView:create(CCSizeMake(400, 540))

	var_29_4:setPosition(0, 10)
	var_29_4:setDirection(kCCScrollViewDirectionVertical)
	var_29_4:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_29_0.view.widgets.bg_list:addChild(var_29_4)

	if arg_29_0.candidateList then
		arg_29_0.candidateList:removeFromParentAndCleanup(true)

		arg_29_0.candidateList = nil
	end

	arg_29_0.candidateList = var_29_4

	var_29_4:registerScriptHandler(var_29_0, CCTableView.kTableCellTouched)
	var_29_4:registerScriptHandler(var_29_1, CCTableView.kTableCellSizeForIndex)
	var_29_4:registerScriptHandler(var_29_2, CCTableView.kTableCellSizeAtIndex)
	var_29_4:registerScriptHandler(var_29_3, CCTableView.kNumberOfCellsInTableView)
	var_29_4:reloadData()
end

function var_0_6.createPhantomList(arg_34_0, arg_34_1)
	local function var_34_0(arg_35_0, arg_35_1)
		log.info("cell touched at : ", arg_35_1:getIdx())
	end

	local function var_34_1(arg_36_0, arg_36_1)
		return 40, 540
	end

	local function var_34_2(arg_37_0, arg_37_1)
		local var_37_0 = arg_37_0:dequeueCell()

		if var_37_0 then
			var_37_0:removeAllChildrenWithCleanup(true)
		else
			var_37_0 = CCTableViewCell:new()
		end

		local var_37_1 = arg_34_1[arg_37_1 + 1]

		if var_37_1 then
			local var_37_2 = {}

			uiutil.initWidgets(var_37_2, arg_34_0.layout_cell_phantom)
			var_37_0:addChild(var_37_2.widgets.node)

			if arg_37_1 % 2 == 1 then
				var_37_2.widgets.bg:setDisplayFrame(CCSprite:create("res/ui/rankInfo/workerList/jzke_gjmc_list_long02.png"):displayFrame())
			end

			var_37_2.widgets.playerName:setString(var_37_1.playerName)
			var_37_2.widgets.generalName:setString(var_37_1.generalName)
			var_37_2.widgets.generalName:setColor(colorQuality[var_37_1.quality])
			var_37_2.widgets.generalLv:setString(language.get(83027, var_37_1.generalLv))
			var_37_2.widgets.btn_kick:addHandleOfControlEvent(function()
				log.info("btn_kick")
				arg_34_0:onKickPhantom(var_37_1.playerId, var_37_1.generalId)
			end, CCControlEventTouchUpInside)
		end

		return var_37_0
	end

	local function var_34_3()
		if arg_34_1 and #arg_34_1 > 0 then
			return #arg_34_1
		else
			return 0
		end
	end

	local var_34_4 = CCTableView:create(CCSizeMake(540, 262))

	var_34_4:setPosition(0, 5)
	var_34_4:setDirection(kCCScrollViewDirectionVertical)
	var_34_4:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_34_0.view.widgets.bg_list2:addChild(var_34_4)

	if arg_34_0.phantomList then
		arg_34_0.phantomList:removeFromParentAndCleanup(true)

		arg_34_0.phantomList = nil
	end

	arg_34_0.phantomList = var_34_4

	var_34_4:registerScriptHandler(var_34_0, CCTableView.kTableCellTouched)
	var_34_4:registerScriptHandler(var_34_1, CCTableView.kTableCellSizeForIndex)
	var_34_4:registerScriptHandler(var_34_2, CCTableView.kTableCellSizeAtIndex)
	var_34_4:registerScriptHandler(var_34_3, CCTableView.kNumberOfCellsInTableView)
	var_34_4:reloadData()
end

function var_0_6.createOtherNationList(arg_40_0, arg_40_1)
	local function var_40_0(arg_41_0, arg_41_1)
		log.info("cell touched at : ", arg_41_1:getIdx())
	end

	local function var_40_1(arg_42_0, arg_42_1)
		return 40, 540
	end

	local function var_40_2(arg_43_0, arg_43_1)
		local var_43_0 = arg_43_0:dequeueCell()

		if var_43_0 then
			var_43_0:removeAllChildrenWithCleanup(true)
		else
			var_43_0 = CCTableViewCell:new()
		end

		local var_43_1 = arg_40_1[arg_43_1 + 1]

		if var_43_1 then
			local var_43_2 = {}

			uiutil.initWidgets(var_43_2, arg_40_0.layout_cell_phantom2)
			var_43_0:addChild(var_43_2.widgets.node)

			if arg_43_1 % 2 == 1 then
				var_43_2.widgets.bg:setDisplayFrame(CCSprite:create("res/ui/rankInfo/workerList/jzke_gjmc_list_long02.png"):displayFrame())
			end

			var_43_2.widgets.playerName:setString(var_43_1.serverName .. "." .. var_43_1.nationName)
			var_43_2.widgets.mineNum:setString(var_43_1.mineNum)

			local var_43_3 = user.getMineIdx(var_43_1.mineNum)

			if var_43_3 then
				var_43_2.widgets.mineNum:setColor(mineColor[var_43_3])
			else
				var_43_2.widgets.mineNum:setColor(mineColor[0])
			end

			var_43_2.widgets.kingName:setString(var_43_1.kingName)
			var_43_2.widgets.phantomNum:setString("x" .. 1)
		end

		return var_43_0
	end

	local function var_40_3()
		if arg_40_1 and #arg_40_1 > 0 then
			return #arg_40_1
		else
			return 0
		end
	end

	local var_40_4 = CCTableView:create(CCSizeMake(540, 262))

	var_40_4:setPosition(0, 5)
	var_40_4:setDirection(kCCScrollViewDirectionVertical)
	var_40_4:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_40_0.view.widgets.bg_list3:addChild(var_40_4)

	if arg_40_0.phantomList2 then
		arg_40_0.phantomList2:removeFromParentAndCleanup(true)

		arg_40_0.phantomList2 = nil
	end

	arg_40_0.phantomList2 = var_40_4

	var_40_4:registerScriptHandler(var_40_0, CCTableView.kTableCellTouched)
	var_40_4:registerScriptHandler(var_40_1, CCTableView.kTableCellSizeForIndex)
	var_40_4:registerScriptHandler(var_40_2, CCTableView.kTableCellSizeAtIndex)
	var_40_4:registerScriptHandler(var_40_3, CCTableView.kNumberOfCellsInTableView)
	var_40_4:reloadData()
end

function var_0_6.showEffectState(arg_45_0, arg_45_1)
	arg_45_0.view.widgets.maskLayer:setVisible(true)
	arg_45_0.view.widgets.state:setDisplayFrame(CCSprite:create(arg_45_1):displayFrame())
	arg_45_0.view.widgets.state:setOpacity(0)
	arg_45_0.view.widgets.state:stopAllActions()
	arg_45_0.view.widgets.state:setVisible(true)

	local var_45_0 = CCArray:create()

	var_45_0:addObject(CCFadeIn:create(0.5))
	var_45_0:addObject(CCDelayTime:create(0.5))
	var_45_0:addObject(CCCallFunc:create(function()
		arg_45_0:refresh()
	end))

	local var_45_1 = CCSequence:create(var_45_0)

	arg_45_0.view.widgets.state:runAction(var_45_1)
end

function var_0_6.showPanel(arg_47_0, arg_47_1)
	arg_47_0.info = arg_47_1

	local var_47_0 = false

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		var_47_0 = arg_47_1.playerId == user.player.kfgzCompetitorId
	else
		var_47_0 = arg_47_1.playerId == user.player.playerId
	end

	local var_47_1 = arg_47_1.exist

	arg_47_0.view.widgets.node_phantom:setVisible(var_47_1)
	arg_47_0.view.widgets.bg_selfDonationNum:setVisible(var_47_1)
	arg_47_0.view.widgets.btn_transfer:setVisible(var_47_1)
	arg_47_0.view.widgets.btn_go:setVisible(var_47_1)
	arg_47_0.view.widgets.btn_create:setVisible(not var_47_1)
	arg_47_0.view.widgets.maskLayer:setVisible(false)
	arg_47_0.view.widgets.state:setOpacity(255)
	arg_47_0.view.widgets.state:stopAllActions()
	arg_47_0.view.widgets.state:setVisible(false)
	arg_47_0.view.widgets.btn_cancel:setVisible(false)

	if var_47_1 then
		local var_47_2 = arg_47_0.isOther and "fsgjt_word_fsgjt" or "fsgjt_word_bgjt"

		arg_47_0.view.widgets.titleSp:setDisplayFrame(CCSprite:create("res/ui/corps/" .. var_47_2 .. ".png"):displayFrame())

		if arg_47_1.slavePhantomNum and arg_47_1.slavePhantomNum > 0 then
			arg_47_0.view.widgets.otherNationBtn:setVisible(not arg_47_0.isOther)
			arg_47_0.view.widgets.myNationBtn:setVisible(arg_47_0.isOther)
		end

		arg_47_0.view.widgets.btn_transfer:setEnabled(var_47_0)
		arg_47_0.view.widgets.btn_go:setEnabled(var_47_0)
		arg_47_0.view.widgets.hasPhantomNum:setString(language.get(136213, arg_47_1.hasPhantomNum))
		arg_47_0:addGeneralIcon()
		arg_47_0.view.widgets.donationCd:stopAllActions()

		if arg_47_1.donationCd > 0 then
			local var_47_3 = CCArray:create()

			var_47_3:addObject(CCCallFunc:create(function()
				if arg_47_1.donationCd <= 0 then
					arg_47_0:removeFromParentAndCleanup(true)
				else
					arg_47_0.view.widgets.donationCd:setString(language.get(131062, tool.getFormatTime(arg_47_1.donationCd)))
				end
			end))
			var_47_3:addObject(CCDelayTime:create(1))

			local var_47_4 = CCSequence:create(var_47_3)

			arg_47_0.view.widgets.donationCd:runAction(CCRepeatForever:create(var_47_4))
		end

		arg_47_0.view.widgets.responseCd:stopAllActions()

		if arg_47_1.responseCd > 0 then
			arg_47_0.view.widgets.maskLayer:setVisible(true)
			arg_47_0.view.widgets.state:setDisplayFrame(CCSprite:create("res/ui/corps/jt_word_dfqrzqsh.png"):displayFrame())
			arg_47_0.view.widgets.state:setVisible(true)
			arg_47_0.view.widgets.btn_cancel:setVisible(true)

			local var_47_5 = CCArray:create()

			var_47_5:addObject(CCCallFunc:create(function()
				if arg_47_1.responseCd <= 0 then
					-- block empty
				else
					arg_47_0.view.widgets.responseCd:setString(tool.getFormatTime(arg_47_1.responseCd))
				end
			end))
			var_47_5:addObject(CCDelayTime:create(1))

			local var_47_6 = CCSequence:create(var_47_5)

			arg_47_0.view.widgets.responseCd:runAction(CCRepeatForever:create(var_47_6))
		end

		arg_47_0.view.widgets.selfDonationNum:setString(language.get(390478, arg_47_1.selfDonationNum, arg_47_1.phantomNum))

		if arg_47_0.msg == nil and arg_47_1.lpPlayerName ~= nil then
			local var_47_7 = CCLabelTTF:create(language.get(136229, arg_47_1.lpPlayerName, arg_47_1.lpGeneralName), "Thonburi", 22)

			var_47_7:setAnchorPoint(ccp(0, 0.5))
			var_47_7:setPosition(56, 14)
			var_47_7:setColor(var_0_0)
			arg_47_0.view.widgets.layer_msg:addChild(var_47_7)

			local var_47_8 = CCArray:create()

			var_47_8:addObject(CCMoveTo:create(0.3, ccp(56, 34)))

			local var_47_9 = CCSequence:create(var_47_8)

			var_47_7:runAction(var_47_9)

			arg_47_0.msg = var_47_7
		end
	else
		arg_47_0.view.widgets.titleSp:setDisplayFrame(CCSprite:create("res/ui/corps/jumj_word_jrjt.png"):displayFrame())
	end

	local var_47_10

	if arg_47_1.corpsLevel == 1 then
		var_47_10 = "sjwc_title_yjjt.png"
	elseif arg_47_1.corpsLevel == 2 then
		var_47_10 = "sjwc_title_ejjt.png"
	end

	if var_47_10 then
		arg_47_0.view.widgets.title:setDisplayFrame(CCSprite:create("res/ui/corps/" .. var_47_10):displayFrame())
	end

	arg_47_0.view.widgets.playerPic:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerHead/playerHead_icon_%s.png", arg_47_1.playerPic)):displayFrame())
	arg_47_0.view.widgets.playerName:setString(arg_47_1.playerName)
	arg_47_0.view.widgets.donationNum:setString(language.get(136211, arg_47_1.donationNum, arg_47_1.lowerLimit))
	arg_47_0.view.widgets.otherNationNum:setString(language.get(136234, arg_47_1.slavePhantomNum or 0))
	arg_47_0:addSkillIcon()
end

function var_0_6.ctor(arg_50_0, arg_50_1, arg_50_2)
	log.info("@@ 军团募集")

	arg_50_0.view = {}

	uiutil.initWidgets(arg_50_0.view, arg_50_0.layout)
	swallowTouch(arg_50_0)

	if arg_50_1 then
		arg_50_0:addChild(arg_50_0.view.widgets.root)
		arg_50_1:addChild(arg_50_0)
	end

	arg_50_0.view.widgets.btn_close:addHandleOfControlEvent(function()
		log.info("btn_close")
		arg_50_0:removeFromParentAndCleanup(true)
	end, CCControlEventTouchUpInside)
	arg_50_0.view.widgets.btn_closeList:addHandleOfControlEvent(function()
		log.info("btn_closeList")
		arg_50_0.view.widgets.bg_list:setVisible(false)

		if arg_50_0.candidateList then
			arg_50_0.candidateList:removeFromParentAndCleanup(true)

			arg_50_0.candidateList = nil
		end
	end, CCControlEventTouchUpInside)
	arg_50_0.view.widgets.btn_create:addHandleOfControlEvent(function()
		log.info("btn_create")
		arg_50_0:onCreateCorps()
	end, CCControlEventTouchUpInside)
	arg_50_0.view.widgets.btn_transfer:addHandleOfControlEvent(function()
		log.info("btn_transfer")
		arg_50_0:onGetCandidate()
	end, CCControlEventTouchUpInside)
	arg_50_0.view.widgets.btn_go:addHandleOfControlEvent(function()
		log.info("btn_go")
		arg_50_0:onGo()
	end, CCControlEventTouchUpInside)
	arg_50_0.view.widgets.btn_cancel:addHandleOfControlEvent(function()
		log.info("btn_cancel")
		arg_50_0:onCancelTransferCorps()
	end, CCControlEventTouchUpInside)
	arg_50_0.view.widgets.btn_show:addHandleOfControlEvent(function()
		log.info("btn_show")

		local var_57_0 = arg_50_0.view.widgets.node_btnShow:getScale()

		if var_57_0 < 0 then
			arg_50_0:onGetPhantomList()
		else
			arg_50_0.view.widgets.bg_list2:setVisible(false)
		end

		arg_50_0.view.widgets.node_btnShow:setScale(-1 * var_57_0)
	end, CCControlEventTouchUpInside)
	arg_50_0.view.widgets.view_msg:setTouchEnabled(false)
	arg_50_0.view.widgets.myNationBtn:addHandleOfControlEvent(function()
		arg_50_0.isOther = false

		arg_50_0.view.widgets.titleSp:setDisplayFrame(CCSprite:create("res/ui/corps/fsgjt_word_bgjt.png"):displayFrame())
		arg_50_0.view.widgets.myNationBtn:setVisible(false)
		arg_50_0.view.widgets.otherNationBtn:setVisible(true)
		arg_50_0.view.widgets.btn_show:setVisible(true)
		arg_50_0.view.widgets.layer_msg:setVisible(true)

		if arg_50_0.generalNode then
			arg_50_0.generalNode:setVisible(true)
		end

		arg_50_0.view.widgets.bg_list3:setVisible(false)
	end, CCControlEventTouchUpInside)
	arg_50_0.view.widgets.otherNationBtn:addHandleOfControlEvent(function()
		arg_50_0:onGetPhantomList(true)

		arg_50_0.isOther = true

		arg_50_0.view.widgets.titleSp:setDisplayFrame(CCSprite:create("res/ui/corps/fsgjt_word_fsgjt.png"):displayFrame())
		arg_50_0.view.widgets.myNationBtn:setVisible(true)
		arg_50_0.view.widgets.otherNationBtn:setVisible(false)
		arg_50_0.view.widgets.btn_show:setVisible(false)
		arg_50_0.view.widgets.bg_list2:setVisible(false)
		arg_50_0.view.widgets.layer_msg:setVisible(false)

		if arg_50_0.generalNode then
			arg_50_0.generalNode:setVisible(false)
		end

		arg_50_0.view.widgets.bg_list3:setVisible(true)
		arg_50_0.view.widgets.otherMsgLb:setString(language.get(136239, 1))
	end, CCControlEventTouchUpInside)
	arg_50_0:showPanel(arg_50_2)
end

function var_0_6.onEnter(arg_60_0)
	arg_60_0.isOther = false
	arg_60_0.updateRef = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_60_0, arg_60_0.update), 0.5, false)
	arg_60_0.handlerPushCorpsActionRef = handler(arg_60_0, arg_60_0.handlerPushCorpsAction)

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		kfcmgr.registerResponseHandler(actions.pushCorps, arg_60_0.handlerPushCorpsActionRef)
	else
		cmgr.registerResponseHandler(actions.pushCorps, arg_60_0.handlerPushCorpsActionRef)
	end
end

function var_0_6.onExit(arg_61_0)
	if arg_61_0.updateRef then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_61_0.updateRef)
	end

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		kfcmgr.unregisterResponseHandler(actions.pushCorps, arg_61_0.handlerPushCorpsActionRef)
	else
		cmgr.unregisterResponseHandler(actions.pushCorps, arg_61_0.handlerPushCorpsActionRef)
	end
end

function var_0_6.update(arg_62_0, arg_62_1)
	if arg_62_0.info then
		if arg_62_0.info.donationCd and arg_62_0.info.donationCd > 0 then
			arg_62_0.info.donationCd = arg_62_0.info.donationCd - 1000 * arg_62_1
		else
			arg_62_0.info.donationCd = 0
		end

		if arg_62_0.info.responseCd and arg_62_0.info.responseCd > 0 then
			arg_62_0.info.responseCd = arg_62_0.info.responseCd - 1000 * arg_62_1
		else
			arg_62_0.info.responseCd = 0
		end
	end
end

return var_0_6
