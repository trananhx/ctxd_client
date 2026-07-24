local var_0_0 = {
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
local var_0_1 = colorQuality[0]
local var_0_2 = tool.hexToRgb("#D9EDC5")
local var_0_3 = ccc3(0, 180, 0)
local var_0_4 = colorQuality[5]
local var_0_5 = colorQuality[4]
local var_0_6 = colorQuality[2]
local var_0_7 = {}

if conf.language == "vie" or conf.language == "tha" then
	multiLangOffsetfontsize = 7
	multiLangOffsetwordoffset = 50
else
	multiLangOffsetfontsize = 0
	multiLangOffsetwordoffset = 0
end

local var_0_8 = class("TaskArena", function()
	return createBaseLayer()
end)

var_0_8.layout = {
	y = 0,
	name = "root",
	type = "node",
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
					y = 488,
					x = 457.5,
					type = "sprite",
					pic = {
						path = "res/ui/activity/tsDrinking/xhjy_title_bg.png"
					}
				},
				{
					y = 485,
					name = "title",
					type = "sprite",
					x = 457.4976,
					pic = {
						path = "res/ui/nationTask/arena/ltzbs_title.png"
					}
				},
				{
					name = "btn_tip",
					style = "button_tip",
					y = 485,
					type = "button",
					x = 680
				},
				{
					y = 410,
					type = "sprite",
					x = 457.5015,
					pic = {
						path = "res/ui/nationTask/arena/ltzbs_bifen_di.png"
					},
					children = {
						{
							y = 44,
							x = 90,
							type = "sprite",
							pic = {
								path = "res/ui/nationTask/arena/ltzbs_word_zbf.png"
							}
						},
						{
							y = 40,
							type = "sprite",
							x = 270,
							pic = {
								path = "res/ui/nationTask/arena/ltzbs_word_di_ink.png"
							},
							children = {
								{
									y = 30,
									x = 40,
									type = "sprite",
									scale = 0.7,
									pic = {
										path = "res/ui/playerInfo/role_nation_view.png"
									}
								},
								{
									name = "name1",
									y = 30,
									type = "label",
									x = 40,
									fontSize = 32 - multiLangOffsetfontsize
								},
								{
									name = "score1",
									type = "atlaslabel",
									pic = "res/ui/common/number/mnlm_word_time_numb.png",
									startCharMap = 48,
									text = "0",
									y = 30,
									itemWidth = 20,
									itemHeight = 30,
									x = 70 + multiLangOffsetwordoffset,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							y = 40,
							type = "sprite",
							x = 470,
							pic = {
								path = "res/ui/nationTask/arena/ltzbs_word_di_ink.png"
							},
							children = {
								{
									y = 30,
									x = 40,
									type = "sprite",
									scale = 0.7,
									pic = {
										path = "res/ui/playerInfo/role_nation_view.png"
									}
								},
								{
									name = "name2",
									y = 30,
									type = "label",
									x = 40,
									fontSize = 32 - multiLangOffsetfontsize
								},
								{
									name = "score2",
									type = "atlaslabel",
									pic = "res/ui/common/number/mnlm_word_time_numb.png",
									startCharMap = 48,
									text = "0",
									y = 30,
									itemWidth = 20,
									itemHeight = 30,
									x = 70 + multiLangOffsetwordoffset,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							y = 40,
							type = "sprite",
							x = 670,
							pic = {
								path = "res/ui/nationTask/arena/ltzbs_word_di_ink.png"
							},
							children = {
								{
									y = 30,
									x = 40,
									type = "sprite",
									scale = 0.7,
									pic = {
										path = "res/ui/playerInfo/role_nation_view.png"
									}
								},
								{
									name = "name3",
									y = 30,
									type = "label",
									x = 40,
									fontSize = 32 - multiLangOffsetfontsize
								},
								{
									name = "score3",
									type = "atlaslabel",
									pic = "res/ui/common/number/mnlm_word_time_numb.png",
									startCharMap = 48,
									text = "0",
									y = 30,
									itemWidth = 20,
									itemHeight = 30,
									x = 70 + multiLangOffsetwordoffset,
									anchorPoint = ccp(0, 0.5)
								}
							}
						}
					}
				},
				{
					type = "node",
					name = "node1",
					y = 0,
					visible = false,
					x = 0,
					children = {
						{
							y = 192,
							type = "sprite",
							x = 457.5,
							pic = {
								path = "res/ui/nationTask/arena/ltzbs_bg.jpg"
							},
							children = {
								{
									y = 376,
									type = "sprite",
									x = 454.5,
									anchorPoint = ccp(0.5, 1),
									pic = {
										path = "res/ui/nationTask/arena/ltzbs_time_di.png"
									},
									children = {
										{
											fontSize = 20,
											name = "state",
											y = 32,
											type = "label",
											x = 137
										}
									}
								},
								{
									y = 180,
									type = "sprite",
									x = 210,
									pic = {
										path = "res/ui/nationTask/arena/ltzbs_leitai.png"
									},
									children = {
										{
											y = 250,
											type = "sprite",
											x = 180,
											pic = {
												path = "res/ui/nationTask/arena/ltzbs_vs_di.png"
											},
											children = {
												{
													y = 34,
													x = 154,
													type = "sprite",
													pic = {
														path = "res/ui/nationTask/arena/ltzbs_word_vs.png"
													}
												},
												{
													name = "forceName11",
													y = 34,
													type = "label",
													x = 124,
													fontSize = 32 - multiLangOffsetfontsize,
													anchorPoint = ccp(1, 0.5)
												},
												{
													name = "forceName12",
													y = 34,
													type = "label",
													x = 184,
													fontSize = 32 - multiLangOffsetfontsize,
													anchorPoint = ccp(0, 0.5)
												},
												{
													name = "score11",
													type = "atlaslabel",
													pic = "res/ui/common/number/mnlm_word_time_numb.png",
													startCharMap = 48,
													text = "0",
													y = 34,
													itemWidth = 20,
													x = 84,
													itemHeight = 30,
													anchorPoint = ccp(1, 0.5)
												},
												{
													name = "score12",
													type = "atlaslabel",
													pic = "res/ui/common/number/mnlm_word_time_numb.png",
													startCharMap = 48,
													text = "0",
													y = 34,
													itemWidth = 20,
													x = 224,
													itemHeight = 30,
													anchorPoint = ccp(0, 0.5)
												}
											}
										},
										{
											y = -40,
											name = "btn_signUp1",
											h = 62,
											type = "button",
											w = 195,
											visible = false,
											x = 180,
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
													textId = 390007,
													color = var_0_2
												}
											}
										},
										{
											y = -40,
											name = "btn_watch1",
											h = 62,
											type = "button",
											w = 195,
											visible = false,
											x = 180,
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
													textId = 137120,
													color = var_0_2
												}
											}
										},
										{
											y = -40,
											name = "btn_join1",
											h = 62,
											type = "button",
											w = 195,
											visible = false,
											x = 180,
											normal = {
												path = "res/ui/common/button/public_btn_orange.png"
											},
											touched = {
												path = "res/ui/common/button/public_btn_orange_c.png"
											},
											children = {
												{
													fontSize = 25,
													y = 33,
													type = "label",
													x = 98,
													textId = 137121,
													color = var_0_2
												}
											}
										},
										{
											fontSize = 25,
											name = "signed1",
											type = "label",
											visible = false,
											y = -20,
											x = 180,
											textId = 137107
										},
										{
											y = 0,
											name = "node_player1",
											x = 0,
											type = "node"
										},
										{
											type = "sprite",
											name = "result1",
											y = 120,
											visible = false,
											x = 180,
											pic = {
												path = "res/ui/nationTask/arena/ltzbs_word_sl.png"
											}
										}
									}
								},
								{
									y = 180,
									type = "sprite",
									x = 699,
									pic = {
										path = "res/ui/nationTask/arena/ltzbs_leitai.png"
									},
									children = {
										{
											y = 250,
											type = "sprite",
											x = 180,
											pic = {
												path = "res/ui/nationTask/arena/ltzbs_vs_di.png"
											},
											children = {
												{
													y = 34,
													x = 154,
													type = "sprite",
													pic = {
														path = "res/ui/nationTask/arena/ltzbs_word_vs.png"
													}
												},
												{
													name = "forceName21",
													y = 34,
													type = "label",
													x = 124,
													fontSize = 32 - multiLangOffsetfontsize,
													anchorPoint = ccp(1, 0.5)
												},
												{
													name = "forceName22",
													y = 34,
													type = "label",
													x = 184,
													fontSize = 32 - multiLangOffsetfontsize,
													anchorPoint = ccp(0, 0.5)
												},
												{
													name = "score21",
													type = "atlaslabel",
													pic = "res/ui/common/number/mnlm_word_time_numb.png",
													startCharMap = 48,
													text = "0",
													y = 34,
													itemWidth = 20,
													x = 84,
													itemHeight = 30,
													anchorPoint = ccp(1, 0.5)
												},
												{
													name = "score22",
													type = "atlaslabel",
													pic = "res/ui/common/number/mnlm_word_time_numb.png",
													startCharMap = 48,
													text = "0",
													y = 34,
													itemWidth = 20,
													x = 224,
													itemHeight = 30,
													anchorPoint = ccp(0, 0.5)
												}
											}
										},
										{
											y = -40,
											name = "btn_signUp2",
											h = 62,
											type = "button",
											w = 195,
											visible = false,
											x = 180,
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
													textId = 390007,
													color = var_0_2
												}
											}
										},
										{
											y = -40,
											name = "btn_watch2",
											h = 62,
											type = "button",
											w = 195,
											visible = false,
											x = 180,
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
													textId = 137120,
													color = var_0_2
												}
											}
										},
										{
											y = -40,
											name = "btn_join2",
											h = 62,
											type = "button",
											w = 195,
											visible = false,
											x = 180,
											normal = {
												path = "res/ui/common/button/public_btn_orange.png"
											},
											touched = {
												path = "res/ui/common/button/public_btn_orange_c.png"
											},
											children = {
												{
													fontSize = 25,
													y = 33,
													type = "label",
													x = 98,
													textId = 137121,
													color = var_0_2
												}
											}
										},
										{
											fontSize = 25,
											name = "signed2",
											type = "label",
											visible = false,
											y = -20,
											x = 180,
											textId = 137107
										},
										{
											y = 0,
											name = "node_player2",
											x = 0,
											type = "node"
										},
										{
											type = "sprite",
											name = "result2",
											y = 120,
											visible = false,
											x = 180,
											pic = {
												path = "res/ui/nationTask/arena/ltzbs_word_sl.png"
											}
										}
									}
								},
								{
									type = "sprite",
									name = "wait",
									y = 180,
									visible = false,
									x = 454.5,
									pic = {
										path = "res/ui/nationTask/arena/ltzbs_word_di.png"
									},
									children = {
										{
											y = 67,
											x = 228,
											type = "sprite",
											pic = {
												path = "res/ui/nationTask/arena/ltzbs_word_qddqtltbsjs.png"
											}
										},
										{
											zoomOnTouchDown = true,
											name = "btn_watch3",
											h = 59,
											type = "button",
											w = 52,
											y = -20,
											visible = false,
											x = 228,
											normal = {
												path = "res/ui/kfzb/kfzbs_ck.png"
											},
											touched = {
												path = "res/ui/kfzb/kfzbs_ck.png"
											}
										}
									}
								}
							}
						}
					}
				},
				{
					type = "node",
					name = "node2",
					y = 0,
					visible = false,
					x = 0,
					children = {
						{
							x = 150,
							name = "npc",
							y = 0,
							type = "sprite",
							scale = 0.7,
							anchorPoint = ccp(0.5, 0),
							pic = {
								path = "res/ui/comment/xiaoqian.png"
							}
						},
						{
							y = 220,
							name = "icon",
							type = "sprite",
							x = 320,
							pic = {
								path = "res/ui/nationTask/newPic/rwyh_icon03.png"
							},
							children = {
								{
									y = -25.0005,
									type = "sprite",
									x = 300,
									pic = {
										path = "res/ui/nationTask/newPic/rwyh_jl_bg.png"
									},
									children = {
										{
											y = 0,
											name = "node_reward",
											x = 0,
											type = "node"
										}
									}
								}
							}
						},
						{
							y = 340,
							x = 580,
							type = "sprite",
							pic = {
								path = "res/ui/nationTask/arena/ltzbs_word_zbcltzbsz.png"
							}
						},
						{
							anchorPointX = 0.5,
							name = "richLine",
							y = 290,
							type = "richLine",
							gap = 0,
							x = 580,
							content = {
								{
									y = 0,
									x = 0,
									type = "sprite",
									pic = {
										path = "res/ui/nationTask/arena/ltzbs_word_wgrhd.png"
									}
								},
								{
									name = "rank",
									type = "atlaslabel",
									pic = "res/ui/common/number/mnlm_word_time_numb.png",
									startCharMap = 48,
									text = "0",
									y = 0,
									itemWidth = 20,
									x = 0,
									itemHeight = 30,
									anchorPoint = ccp(0.5, 0.5)
								},
								{
									y = 0,
									x = 0,
									type = "sprite",
									pic = {
										path = "res/ui/nationTask/arena/ltzbs_word_mqjjzjzl.png"
									}
								}
							}
						},
						{
							y = 40,
							name = "btn_reward",
							h = 54,
							type = "button",
							w = 125,
							visible = false,
							x = 800,
							normal = {
								frame = true,
								path = "btn2_gre_a.png"
							},
							touched = {
								frame = true,
								path = "btn2_gre_c.png"
							},
							children = {
								{
									fontSize = 20,
									y = 27,
									type = "label",
									x = 63,
									textId = 92013
								}
							}
						}
					}
				},
				{
					type = "sprite",
					name = "taskNext",
					y = 258,
					visible = false,
					x = 458,
					pic = {
						frame = true,
						path = "nation_fabudi.png"
					},
					children = {
						{
							anchorPointX = 0.5,
							name = "richLine_taskNext",
							y = 120,
							type = "richLine",
							gap = 0,
							x = 473.5,
							content = {
								{
									name = "taskNextHour",
									type = "atlaslabel",
									pic = "res/ui/common/number/jtj_general_num.png",
									startCharMap = 48,
									text = "0",
									y = 0,
									itemWidth = 29,
									x = 0,
									itemHeight = 49
								},
								{
									y = 0,
									x = 0,
									type = "sprite",
									pic = {
										frame = true,
										path = "nation_maohao.png"
									}
								},
								{
									text = "00",
									y = 0,
									startCharMap = 48,
									type = "atlaslabel",
									pic = "res/ui/common/number/jtj_general_num.png",
									itemWidth = 29,
									x = 0,
									itemHeight = 49
								},
								{
									y = 0,
									x = 0,
									type = "sprite",
									pic = {
										frame = true,
										path = "nation_next.png"
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
var_0_8.layout_player = {
	x = 0,
	name = "bg",
	y = 0,
	type = "sprite",
	scale = 0.8,
	pic = {
		path = "res/ui/selectPlayer/vip_port_view.jpg"
	},
	children = {
		{
			y = 50,
			name = "head",
			type = "sprite",
			x = 50,
			pic = {
				path = "res/ui/common/playerHead/playerHead_icon_0.png"
			}
		},
		{
			fontSize = 20,
			name = "name",
			y = -10,
			type = "label",
			x = 50,
			color = var_0_2
		}
	}
}
var_0_8.layout_reward = {
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
			color = var_0_5
		}
	}
}
var_0_8.tipFrame = {
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
			fontSize = 18,
			name = "tipMsg",
			height = 0,
			type = "label",
			width = 600,
			textId = 137118,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}

function var_0_8.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getCurRankInfo, 1)
end

function var_0_8.handlerPushArenaMatch(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1.action.data.update

	if var_4_0 and var_4_0.arenaMatchInfo then
		arg_4_0.info.arenaMatchInfo = var_4_0.arenaMatchInfo

		arg_4_0:showPanel(arg_4_0.info)
	end
end

function var_0_8.onClosePanel(arg_5_0)
	local function var_5_0(arg_6_0)
		return
	end

	cmgr.sendRequest(var_5_0, actions.arenaMatchClosePanel)
end

function var_0_8.onSignUp(arg_7_0, arg_7_1)
	local function var_7_0(arg_8_0)
		arg_7_0:showEffectSignUp(arg_7_1)
		arg_7_0:refresh()
	end

	local var_7_1 = arg_7_0.info.arenaMatchInfo.arenaList[arg_7_1].arenaId

	cmgr.sendRequest(var_7_0, actions.arenaMatchSignUp, var_7_1)
end

function var_0_8.onGetNationTaskReward(arg_9_0)
	local function var_9_0(arg_10_0)
		local var_10_0 = arg_10_0.action.data
		local var_10_1 = {}

		for iter_10_0, iter_10_1 in pairs(var_10_0.rewards) do
			if var_0_0[iter_10_1.type] then
				local var_10_2 = {
					id = var_0_0[iter_10_1.type].type,
					value = iter_10_1.value
				}

				table.insert(var_10_1, var_10_2)
			end
		end

		if var_10_0.hasExtra then
			for iter_10_2, iter_10_3 in pairs(var_10_0.extraRewards) do
				if var_0_0[iter_10_3.type] then
					local var_10_3 = {
						id = var_0_0[iter_10_3.type].type,
						value = iter_10_3.value
					}

					table.insert(var_10_1, var_10_3)
				end
			end
		end

		if var_10_0.indivRewards then
			for iter_10_4, iter_10_5 in pairs(var_10_0.indivRewards) do
				if var_0_0[iter_10_5.type] then
					local var_10_4 = {
						id = var_0_0[iter_10_5.type].type,
						value = iter_10_5.value
					}

					table.insert(var_10_1, var_10_4)
				end
			end
		end

		if var_10_0.predicateExtraRewards then
			for iter_10_6, iter_10_7 in pairs(var_10_0.predicateExtraRewards) do
				if var_0_0[iter_10_7.type] then
					local var_10_5 = {
						id = var_0_0[iter_10_7.type].type,
						value = iter_10_7.value
					}

					table.insert(var_10_1, var_10_5)
				end
			end
		end

		globalAction_gotResource(var_10_1)
		arg_9_0:refresh()
	end

	local var_9_1 = arg_9_0.info.arenaMatchInfo.taskId

	cmgr.sendRequest(var_9_0, actions.getNationTaskReward, var_9_1)
end

function var_0_8.showBattle(arg_11_0, arg_11_1)
	local var_11_0

	if arg_11_1 == 3 then
		var_11_0 = arg_11_0.info.arenaMatchInfo.thirdBattleId
	else
		var_11_0 = arg_11_0.info.arenaMatchInfo.arenaList[arg_11_1].battleId
	end

	smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_LTZB, {
		terrain = 0,
		generalId = 0,
		prepare = true,
		target = var_11_0
	})
end

function var_0_8.showEffectSignUp(arg_12_0, arg_12_1)
	local var_12_0 = CCSprite:create("res/ui/nationTask/arena/ltzbs_word_bmcg.png")

	smgr.getLayer("tipLayer"):addChild(var_12_0)

	local var_12_1, var_12_2 = tool.getPositionInScreen(arg_12_0.view.widgets["btn_signUp" .. arg_12_1])

	var_12_0:setPosition(var_12_1, var_12_2)

	local var_12_3 = CCArray:create()

	var_12_3:addObject(CCMoveBy:create(0.6, ccp(0, 60)))
	var_12_3:addObject(CCDelayTime:create(0.6))
	var_12_3:addObject(CCCallFunc:create(function()
		var_12_0:removeFromParentAndCleanup(true)
	end))

	local var_12_4 = CCSequence:create(var_12_3)

	var_12_0:runAction(var_12_4)
end

function var_0_8.showTip(arg_14_0)
	log.info("should show tips ")

	local var_14_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_14_0:registerScriptTouchHandler(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == CCTOUCHBEGAN then
			return true
		elseif arg_15_0 == CCTOUCHMOVED then
			return true
		elseif arg_15_0 == CCTOUCHENDED then
			pcall(var_14_0.removeFromParentAndCleanup, var_14_0, true)

			return true
		end
	end, false, true)
	var_14_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_14_0, 60000)

	local var_14_1 = 0
	local var_14_2 = 0
	local var_14_3 = {}

	uiutil.initWidgets(var_14_3, arg_14_0.tipFrame)
	var_14_0:addChild(var_14_3.widgets.tipFrame)

	local var_14_4 = arg_14_0.view.widgets.btn_tip
	local var_14_5, var_14_6 = tool.getPositionInScreen(var_14_4)
	local var_14_7 = var_14_5 + 20
	local var_14_8 = var_14_6 - 20
	local var_14_9 = var_14_3.widgets.tipMsg:getContentSize().width
	local var_14_10 = var_14_3.widgets.tipMsg:getContentSize().height

	var_14_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_14_9 + 30, var_14_10 + 30))
	var_14_3.widgets.tipFrame:setPosition(ccp(var_14_7, var_14_8))
	var_14_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_14_3.widgets.tipFrame:setVisible(true)
end

function var_0_8.showPanel(arg_16_0, arg_16_1)
	arg_16_0.info = arg_16_1

	local var_16_0 = arg_16_1.arenaMatchInfo

	for iter_16_0, iter_16_1 in ipairs(var_16_0.scoreList) do
		arg_16_0.view.widgets["score" .. iter_16_0]:setString(tostring(iter_16_1.score))
	end

	arg_16_0.view.widgets.node1:setVisible(false)
	arg_16_0.view.widgets.node2:setVisible(false)
	arg_16_0.view.widgets.state:stopAllActions()
	arg_16_0.view.widgets.state:setColor(var_0_2)
	arg_16_0.view.widgets.node_player1:removeAllChildrenWithCleanup(true)
	arg_16_0.view.widgets.node_player2:removeAllChildrenWithCleanup(true)
	arg_16_0.view.widgets.result1:setVisible(false)
	arg_16_0.view.widgets.result2:setVisible(false)
	arg_16_0.view.widgets.wait:setVisible(false)

	if var_16_0.state == 1 then
		arg_16_0.view.widgets.node1:setVisible(true)

		if var_16_0.signUpCd and var_16_0.signUpCd > 0 then
			arg_16_0.view.widgets.state:setColor(var_0_4)
			arg_16_0.view.widgets.state:setString(language.get(137109, tool.getFormatTime(var_16_0.signUpCd)))

			local var_16_1 = CCArray:create()

			var_16_1:addObject(CCDelayTime:create(0.5))
			var_16_1:addObject(CCCallFuncN:create(function()
				var_16_0.signUpCd = var_16_0.signUpCd - 500

				if var_16_0.signUpCd <= 0 then
					arg_16_0.view.widgets.state:stopAllActions()
				else
					arg_16_0.view.widgets.state:setString(language.get(137109, tool.getFormatTime(var_16_0.signUpCd)))
				end
			end))

			local var_16_2 = CCSequence:create(var_16_1)

			arg_16_0.view.widgets.state:runAction(CCRepeatForever:create(var_16_2))
		end

		local var_16_3 = {
			{
				40,
				170
			},
			{
				180,
				170
			},
			{
				320,
				170
			},
			{
				110,
				60
			},
			{
				250,
				60
			}
		}

		for iter_16_2, iter_16_3 in ipairs(var_16_0.arenaList) do
			arg_16_0.view.widgets["btn_watch" .. iter_16_2]:setVisible(false)
			arg_16_0.view.widgets["btn_join" .. iter_16_2]:setVisible(false)
			arg_16_0.view.widgets["forceName" .. iter_16_2 .. "1"]:setString(user.forceIdToName[iter_16_3.selfForceId])
			arg_16_0.view.widgets["forceName" .. iter_16_2 .. "1"]:setColor(colorForce[iter_16_3.selfForceId])
			arg_16_0.view.widgets["forceName" .. iter_16_2 .. "2"]:setString(user.forceIdToName[iter_16_3.otherForceId])
			arg_16_0.view.widgets["forceName" .. iter_16_2 .. "2"]:setColor(colorForce[iter_16_3.otherForceId])
			arg_16_0.view.widgets["score" .. iter_16_2 .. "1"]:setString(tostring(iter_16_3.selfScore))
			arg_16_0.view.widgets["score" .. iter_16_2 .. "2"]:setString(tostring(iter_16_3.otherScore))

			local var_16_4 = arg_16_0.view.widgets["forceName" .. iter_16_2 .. "1"]:getPositionX() - arg_16_0.view.widgets["forceName" .. iter_16_2 .. "1"]:getContentSize().width
			local var_16_5 = arg_16_0.view.widgets["forceName" .. iter_16_2 .. "2"]:getPositionX() + arg_16_0.view.widgets["forceName" .. iter_16_2 .. "2"]:getContentSize().width

			arg_16_0.view.widgets["score" .. iter_16_2 .. "1"]:setPosition(ccp(var_16_4, arg_16_0.view.widgets["forceName" .. iter_16_2 .. "1"]:getPositionY()))
			arg_16_0.view.widgets["score" .. iter_16_2 .. "2"]:setPosition(ccp(var_16_5, arg_16_0.view.widgets["forceName" .. iter_16_2 .. "2"]:getPositionY()))

			local var_16_6 = false

			for iter_16_4 = 1, 5 do
				local var_16_7 = iter_16_3.playerList[iter_16_4]
				local var_16_8 = ""
				local var_16_9 = 0

				if var_16_7 then
					var_16_8 = var_16_7.playerName
					var_16_9 = var_16_7.pic

					if var_16_6 == false and var_16_7.playerId == user.player.playerId then
						var_16_6 = true
					end
				end

				local var_16_10 = {}

				uiutil.initWidgets(var_16_10, arg_16_0.layout_player)
				var_16_10.widgets.bg:setPosition(var_16_3[iter_16_4][1], var_16_3[iter_16_4][2])
				arg_16_0.view.widgets["node_player" .. iter_16_2]:addChild(var_16_10.widgets.bg)
				var_16_10.widgets.name:setString(var_16_8)
				var_16_10.widgets.head:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerHead/playerHead_icon_%s.png", var_16_9)):displayFrame())
			end

			arg_16_0.view.widgets["signed" .. iter_16_2]:setVisible(var_16_6)
			arg_16_0.view.widgets["btn_signUp" .. iter_16_2]:setVisible(not var_16_6)
		end
	elseif var_16_0.state == 2 then
		arg_16_0.view.widgets.node1:setVisible(true)
		arg_16_0.view.widgets.result1:setVisible(true)
		arg_16_0.view.widgets.result2:setVisible(true)
		arg_16_0.view.widgets.state:setColor(var_0_2)
		arg_16_0.view.widgets.state:setString(language.get(137110, var_16_0.roundNo))

		local var_16_11 = {
			{
				100,
				120
			},
			{
				260,
				120
			}
		}

		for iter_16_5, iter_16_6 in ipairs(var_16_0.arenaList) do
			arg_16_0.view.widgets["signed" .. iter_16_5]:setVisible(false)
			arg_16_0.view.widgets["btn_signUp" .. iter_16_5]:setVisible(false)
			arg_16_0.view.widgets["btn_join" .. iter_16_5]:setVisible(false)
			arg_16_0.view.widgets["btn_watch" .. iter_16_5]:setVisible(false)
			arg_16_0.view.widgets["forceName" .. iter_16_5 .. "1"]:setString(user.forceIdToName[iter_16_6.selfForceId])
			arg_16_0.view.widgets["forceName" .. iter_16_5 .. "1"]:setColor(colorForce[iter_16_6.selfForceId])
			arg_16_0.view.widgets["forceName" .. iter_16_5 .. "2"]:setString(user.forceIdToName[iter_16_6.otherForceId])
			arg_16_0.view.widgets["forceName" .. iter_16_5 .. "2"]:setColor(colorForce[iter_16_6.otherForceId])
			arg_16_0.view.widgets["score" .. iter_16_5 .. "1"]:setString(tostring(iter_16_6.selfScore))
			arg_16_0.view.widgets["score" .. iter_16_5 .. "2"]:setString(tostring(iter_16_6.otherScore))

			local var_16_12 = arg_16_0.view.widgets["forceName" .. iter_16_5 .. "1"]:getPositionX() - arg_16_0.view.widgets["forceName" .. iter_16_5 .. "1"]:getContentSize().width
			local var_16_13 = arg_16_0.view.widgets["forceName" .. iter_16_5 .. "2"]:getPositionX() + arg_16_0.view.widgets["forceName" .. iter_16_5 .. "2"]:getContentSize().width

			arg_16_0.view.widgets["score" .. iter_16_5 .. "1"]:setPosition(ccp(var_16_12, arg_16_0.view.widgets["forceName" .. iter_16_5 .. "1"]:getPositionY()))
			arg_16_0.view.widgets["score" .. iter_16_5 .. "2"]:setPosition(ccp(var_16_13, arg_16_0.view.widgets["forceName" .. iter_16_5 .. "2"]:getPositionY()))

			local var_16_14

			if iter_16_6.result == 1 then
				var_16_14 = "ltzbs_word_sl.png"
			elseif iter_16_6.result == -1 then
				var_16_14 = "ltzbs_word_sb.png"
			elseif iter_16_6.result == 0 then
				var_16_14 = "ltzbs_word_pj.png"
			else
				var_16_14 = "worldDaojian.png"

				local var_16_15 = {
					iter_16_6.selfPlayerInfo,
					iter_16_6.otherPlayerInfo
				}

				for iter_16_7 = 1, 2 do
					local var_16_16 = var_16_15[iter_16_7]
					local var_16_17 = var_16_16.playerName
					local var_16_18 = var_16_16.pic

					if var_16_17 then
						local var_16_19 = {}

						uiutil.initWidgets(var_16_19, arg_16_0.layout_player)
						var_16_19.widgets.bg:setPosition(var_16_11[iter_16_7][1], var_16_11[iter_16_7][2])
						arg_16_0.view.widgets["node_player" .. iter_16_5]:addChild(var_16_19.widgets.bg)
						var_16_19.widgets.name:setString(var_16_17)
						var_16_19.widgets.head:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerHead/playerHead_icon_%s.png", var_16_18)):displayFrame())
					end
				end

				local var_16_20 = iter_16_6.isPlayer == true

				arg_16_0.view.widgets["btn_join" .. iter_16_5]:setVisible(var_16_20)
				arg_16_0.view.widgets["btn_watch" .. iter_16_5]:setVisible(not var_16_20)
			end

			arg_16_0.view.widgets["result" .. iter_16_5]:setDisplayFrame(CCSprite:create("res/ui/nationTask/arena/" .. var_16_14):displayFrame())
		end

		arg_16_0.view.widgets.wait:setVisible(var_16_0.arenaList[1].result ~= nil and var_16_0.arenaList[2].result ~= nil)

		if arg_16_0.view.widgets.wait:isVisible() then
			arg_16_0.view.widgets.btn_watch3:setVisible(var_16_0.thirdBattleId ~= nil)
		end
	elseif var_16_0.state == 3 then
		arg_16_0.view.widgets.node2:setVisible(true)
		arg_16_0.view.widgets.rank:setString(tostring(var_16_0.rank))
		arg_16_0.view.widgets.richLine:reorder()
		arg_16_0.view.widgets.node_reward:removeAllChildrenWithCleanup(true)

		for iter_16_8, iter_16_9 in pairs(var_16_0.rewards) do
			local var_16_21 = {}

			uiutil.initWidgets(var_16_21, arg_16_0.layout_reward)
			arg_16_0.view.widgets.node_reward:addChild(var_16_21.widgets.bg)
			var_16_21.widgets.bg:setPosition(110 + 100 * (iter_16_8 - 1), 90)

			local var_16_22 = var_0_0[iter_16_9.type]

			if var_16_22 and var_16_22.pic then
				var_16_21.widgets.icon:setDisplayFrame(CCSprite:create("res/ui/task/" .. var_16_22.pic):displayFrame())
				var_16_21.widgets.txt:setDisplayFrame(CCSprite:create("res/ui/task/" .. var_16_22.txt):displayFrame())
			end

			var_16_21.widgets.num:setString(tool.getFormatNum(tonumber(iter_16_9.value)))
		end

		arg_16_0.view.widgets.btn_reward:setVisible(var_16_0.isRewarded == false)
	end

	if var_16_0.state == 3 and var_16_0.isRewarded == true and arg_16_1.nextTaskTime then
		arg_16_0.view.widgets.taskNext:setVisible(true)
		arg_16_0.view.widgets.taskNextHour:setString(arg_16_1.nextTaskTime)
		arg_16_0.view.widgets.richLine_taskNext:reorder()
	end
end

function var_0_8.ctor(arg_18_0, arg_18_1)
	log.info("@@ 擂台")

	arg_18_0.view = {}

	uiutil.initWidgets(arg_18_0.view, arg_18_0.layout)
	arg_18_0:addChild(arg_18_0.view.widgets.root)

	for iter_18_0 = 1, 3 do
		arg_18_0.view.widgets["name" .. iter_18_0]:setString(user.forceIdToName[iter_18_0])
		arg_18_0.view.widgets["name" .. iter_18_0]:setColor(colorForce[iter_18_0])
	end

	for iter_18_1 = 1, 2 do
		arg_18_0.view.widgets["btn_signUp" .. iter_18_1]:addHandleOfControlEvent(function()
			log.info("btn_signUp" .. iter_18_1)
			arg_18_0:onSignUp(iter_18_1)
		end, CCControlEventTouchUpInside)
		arg_18_0.view.widgets["btn_watch" .. iter_18_1]:addHandleOfControlEvent(function()
			log.info("btn_watch" .. iter_18_1)
			arg_18_0:showBattle(iter_18_1)
		end, CCControlEventTouchUpInside)
		arg_18_0.view.widgets["btn_join" .. iter_18_1]:addHandleOfControlEvent(function()
			log.info("btn_join" .. iter_18_1)
			arg_18_0:showBattle(iter_18_1)
		end, CCControlEventTouchUpInside)
	end

	arg_18_0.view.widgets.btn_watch3:addHandleOfControlEvent(function()
		log.info("btn_watch3")
		arg_18_0:showBattle(3)
	end, CCControlEventTouchUpInside)
	arg_18_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_18_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_18_0.view.widgets.btn_reward:addHandleOfControlEvent(function()
		log.info("btn_reward")
		arg_18_0:onGetNationTaskReward()
	end, CCControlEventTouchUpInside)
	arg_18_0:showPanel(arg_18_1)
end

function var_0_8.onEnter(arg_25_0)
	arg_25_0.handlerPushArenaMatchRef = handler(arg_25_0, arg_25_0.handlerPushArenaMatch)

	cmgr.registerResponseHandler(actions.pushArenaMatch, arg_25_0.handlerPushArenaMatchRef)
end

function var_0_8.onExit(arg_26_0)
	arg_26_0:onClosePanel()
	cmgr.unregisterResponseHandler(actions.pushArenaMatch, arg_26_0.handlerPushArenaMatchRef)
end

return var_0_8
