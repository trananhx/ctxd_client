local var_0_0 = {
	[3] = {
		id = 3,
		txt = 10103,
		pic = "res/ui/task/get_icon_food.png"
	},
	[4] = {
		id = 4,
		txt = 10104,
		pic = "res/ui/task/get_icon_iron.png"
	},
	[5] = {
		id = 6,
		txt = 10107,
		pic = "res/ui/task/get_icon_exp.png"
	},
	[21] = {
		id = 7,
		txt = 10106,
		pic = "res/ui/task/get_icon_gem.png"
	},
	[113] = {
		id = 2003,
		txt = 111041,
		pic = "res/ui/equip/quenching/acti_icon_xidfs.png"
	},
	[116] = {
		id = 55,
		txt = 310020,
		pic = "res/ui/task/get_icon_silk.png",
		scale = 0.8
	},
	[119] = {
		id = 10033,
		txt = 111044,
		pic = "res/ui/weapon/godWeapon/sbxt_icon_blg.png"
	},
	[126] = {
		id = 10030,
		txt = 111043,
		pic = "res/ui/resource/silkroad/sczldj_jn.png",
		scale = 0.7
	}
}
local var_0_1 = tool.hexToRgb("#EADBBB")
local var_0_2 = colorQuality[3]
local var_0_3 = colorQuality[2]
local var_0_4 = colorQuality[5]
local var_0_5 = colorQuality[4]
local var_0_6 = colorQuality[6]
local var_0_7 = class("MuNiu", function()
	return createBaseLayer()
end)

var_0_7.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			name = "panel",
			type = "sprite",
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 - 30,
			pic = {
				path = "res/ui/comment/bg1.jpg"
			},
			children = {
				{
					y = 490,
					name = "title",
					type = "sprite",
					x = 458,
					pic = {
						path = "res/ui/activity/muNiu/mnlm_title.png"
					}
				},
				{
					fontSize = 25,
					name = "leftTime",
					y = 480,
					type = "label",
					x = 705,
					color = var_0_4
				},
				{
					y = 490,
					name = "btn_tip",
					style = "button_tip",
					type = "button",
					x = 840
				},
				{
					type = "node",
					name = "node_camp",
					y = 0,
					visible = false,
					x = 0,
					children = {
						{
							y = 206,
							x = 457.5,
							type = "sprite",
							pic = {
								path = "res/ui/activity/muNiu/mnlm_bg.jpg"
							}
						},
						{
							y = 208,
							name = "light",
							type = "sprite",
							x = 201,
							pic = {
								path = "res/ui/activity/muNiu/mnlm_zhangpeng_mask.png"
							}
						},
						{
							w = 354,
							name = "btn_camp",
							h = 160,
							type = "button",
							y = 208,
							x = 201,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/ui/activity/muNiu/mnlm_zhangpeng_mask.png"
							}
						},
						{
							type = "sprite",
							name = "cattle1",
							x = 87,
							visible = false,
							y = 125,
							scale = 0.5,
							pic = {
								path = "res/ui/activity/muNiu/mnlm_muniu.png"
							}
						},
						{
							type = "sprite",
							name = "cattle2",
							x = 199,
							visible = false,
							y = 105,
							scale = 0.5,
							pic = {
								path = "res/ui/activity/muNiu/mnlm_muniu.png"
							}
						},
						{
							type = "sprite",
							name = "cattle3",
							x = 326,
							visible = false,
							y = 115,
							scale = 0.5,
							pic = {
								path = "res/ui/activity/muNiu/mnlm_muniu.png"
							}
						},
						{
							type = "sprite",
							name = "cattle4",
							x = 462,
							visible = false,
							y = 106,
							scale = 0.5,
							pic = {
								path = "res/ui/activity/muNiu/mnlm_muniu.png"
							}
						},
						{
							type = "sprite",
							name = "cattle5",
							x = 416,
							visible = false,
							y = 174,
							scale = 0.5,
							pic = {
								path = "res/ui/activity/muNiu/mnlm_muniu.png"
							}
						},
						{
							name = "btn_worship",
							h = 56,
							type = "button",
							w = 212,
							y = 60,
							x = 458,
							normal = {
								path = "res/ui/common/button/sdyjs_btn_02.png"
							},
							touched = {
								path = "res/ui/common/button/sdyjs_btn_02_c.png"
							},
							children = {
								{
									fontSize = 25,
									y = 32,
									type = "label",
									x = 130,
									textId = 136406
								},
								{
									y = 40,
									x = 40,
									type = "sprite",
									scale = 0.6,
									pic = {
										path = "res/ui/activity/ironRotary/yuanbao.png"
									}
								},
								{
									fontSize = 22,
									name = "worshipGold",
									y = 22,
									type = "label",
									x = 40
								}
							}
						}
					}
				},
				{
					type = "node",
					name = "node_reward",
					y = 0,
					visible = false,
					x = 0,
					children = {
						{
							y = 206,
							name = "bg_reward",
							type = "sprite",
							x = 457.5,
							pic = {
								path = "res/ui/activity/muNiu/mnlm_bg2.jpg"
							}
						},
						{
							y = 206,
							name = "btn_cattle1",
							h = 156,
							type = "button",
							w = 284,
							visible = false,
							x = 113,
							normal = {
								path = "res/ui/activity/muNiu/mnlm_muniu.png"
							},
							touched = {
								path = "res/ui/activity/muNiu/mnlm_muniu_c.png"
							},
							children = {
								{
									visible = false,
									name = "bg_reward1",
									type = "sprite9",
									y = 66,
									x = 187,
									preferedSize = CCSizeMake(300, 120),
									middleRect = CCRectMake(110, 16, 2, 2),
									pic = {
										path = "res/ui/buildEvent/jzcl_wjm_di.png"
									},
									children = {
										{
											y = 120,
											x = 150,
											type = "sprite",
											pic = {
												path = "res/ui/activity/muNiu/mnlm_jiaohuo_bg_ink.png"
											}
										},
										{
											y = 120,
											name = "baoji1",
											type = "sprite",
											x = 150,
											pic = {
												path = "res/ui/activity/muNiu/mnlm_jiaohuo_word_1x.png"
											}
										},
										{
											y = 0,
											name = "node_reward1",
											x = 0,
											type = "node"
										}
									}
								}
							}
						},
						{
							y = 206,
							name = "btn_cattle2",
							h = 156,
							type = "button",
							w = 284,
							visible = false,
							x = 413,
							normal = {
								path = "res/ui/activity/muNiu/mnlm_muniu.png"
							},
							touched = {
								path = "res/ui/activity/muNiu/mnlm_muniu_c.png"
							},
							children = {
								{
									visible = false,
									name = "bg_reward2",
									type = "sprite9",
									y = 66,
									x = 187,
									preferedSize = CCSizeMake(300, 120),
									middleRect = CCRectMake(110, 16, 2, 2),
									pic = {
										path = "res/ui/buildEvent/jzcl_wjm_di.png"
									},
									children = {
										{
											y = 120,
											x = 150,
											type = "sprite",
											pic = {
												path = "res/ui/activity/muNiu/mnlm_jiaohuo_bg_ink.png"
											}
										},
										{
											y = 120,
											name = "baoji2",
											type = "sprite",
											x = 150,
											pic = {
												path = "res/ui/activity/muNiu/mnlm_jiaohuo_word_1x.png"
											}
										},
										{
											y = 0,
											name = "node_reward2",
											x = 0,
											type = "node"
										}
									}
								}
							}
						},
						{
							y = 206,
							name = "btn_cattle3",
							h = 156,
							type = "button",
							w = 284,
							visible = false,
							x = 713,
							normal = {
								path = "res/ui/activity/muNiu/mnlm_muniu.png"
							},
							touched = {
								path = "res/ui/activity/muNiu/mnlm_muniu_c.png"
							},
							children = {
								{
									visible = false,
									name = "bg_reward3",
									type = "sprite9",
									y = 66,
									x = 187,
									preferedSize = CCSizeMake(300, 120),
									middleRect = CCRectMake(110, 16, 2, 2),
									pic = {
										path = "res/ui/buildEvent/jzcl_wjm_di.png"
									},
									children = {
										{
											y = 120,
											x = 150,
											type = "sprite",
											pic = {
												path = "res/ui/activity/muNiu/mnlm_jiaohuo_bg_ink.png"
											}
										},
										{
											y = 120,
											name = "baoji3",
											type = "sprite",
											x = 150,
											pic = {
												path = "res/ui/activity/muNiu/mnlm_jiaohuo_word_1x.png"
											}
										},
										{
											y = 0,
											name = "node_reward3",
											x = 0,
											type = "node"
										}
									}
								}
							}
						},
						{
							y = 60,
							name = "btn_open",
							h = 56,
							type = "button",
							w = 212,
							visible = false,
							x = 458,
							normal = {
								path = "res/ui/common/button/sdyjs_btn_02.png"
							},
							touched = {
								path = "res/ui/common/button/sdyjs_btn_02_c.png"
							},
							children = {
								{
									fontSize = 25,
									y = 32,
									type = "label",
									x = 130,
									textId = 131057
								},
								{
									x = 40,
									name = "icon_gold",
									y = 40,
									type = "sprite",
									scale = 0.7,
									pic = {
										path = "res/ui/activity/ironRotary/yuanbao.png"
									}
								},
								{
									fontSize = 22,
									name = "openGold",
									y = 22,
									type = "label",
									x = 40
								},
								{
									fontSize = 20,
									name = "freeTimes",
									y = 32,
									type = "label",
									x = 40
								}
							}
						},
						{
							visible = false,
							name = "bg_tuHao",
							type = "sprite9",
							y = 360,
							x = 458,
							preferedSize = CCSizeMake(600, 40),
							middleRect = CCRectMake(110, 16, 2, 2),
							pic = {
								path = "res/ui/buildEvent/jzcl_wjm_di.png"
							},
							children = {
								{
									fontSize = 22,
									name = "tuHao",
									y = 20,
									type = "label",
									x = 300
								}
							}
						}
					}
				},
				{
					y = 410,
					type = "sprite",
					x = 457.5,
					pic = {
						path = "res/ui/activity/generalDrink/zjlyx_zy_pb_bg.png"
					},
					children = {
						{
							type = "sprite",
							name = "bg_bar",
							y = 54,
							visible = false,
							x = 454,
							pic = {
								path = "res/ui/activity/generalDrink/zjlyx_zy_pb_d.png"
							},
							children = {
								{
									y = 0,
									name = "bar",
									type = "progressbar",
									x = 0,
									anchorPoint = ccp(0, 0),
									pic = {
										path = "res/ui/activity/generalDrink/zjlyx_zy_pb.png"
									}
								},
								{
									y = 15,
									x = -44,
									type = "sprite",
									pic = {
										path = "res/ui/activity/muNiu/mnlm_bar_word_muniu.png"
									}
								},
								{
									fontSize = 22,
									name = "happyInfo",
									y = 15,
									type = "label",
									x = 360
								}
							}
						},
						{
							visible = false,
							name = "bg_time",
							type = "sprite9",
							y = 54,
							x = 454,
							preferedSize = CCSizeMake(300, 64),
							middleRect = CCRectMake(80, 20, 15, 9),
							pic = {
								path = "res/ui/juben/jb_wj_lv_d.png"
							},
							children = {
								{
									anchorPointX = 0.5,
									name = "richLine",
									y = 32,
									type = "richLine",
									gap = 20,
									x = 150,
									content = {
										{
											y = 0,
											x = 0,
											type = "sprite",
											pic = {
												path = "res/ui/activity/muNiu/mnlm_word_djs.png"
											}
										},
										{
											name = "roundCd",
											type = "atlaslabel",
											pic = "res/ui/common/number/mnlm_word_time_numb.png",
											startCharMap = 48,
											text = "00:00",
											y = 0,
											itemWidth = 20,
											x = 0,
											itemHeight = 30,
											anchorPoint = ccp(0.5, 0.5)
										}
									}
								}
							}
						},
						{
							y = 54,
							x = 836,
							type = "sprite",
							scale = 0.35,
							pic = {
								path = "res/ui/activity/muNiu/mnlm_muniu.png"
							}
						},
						{
							fontSize = 22,
							name = "round",
							y = 39,
							type = "label",
							x = 852
						}
					}
				},
				{
					y = 32,
					x = 457.5,
					type = "sprite",
					pic = {
						path = "res/ui/activity/generalDrink/zjlyx_line.png"
					}
				},
				{
					y = 470,
					type = "sprite",
					x = 3,
					anchorPoint = ccp(0, 0.5),
					pic = {
						path = "res/ui/activity/muNiu/mnlm_word_xywz_bg.png"
					},
					children = {
						{
							y = 19,
							type = "sprite",
							x = 0,
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/activity/muNiu/mnlm_word_xywz.png"
							}
						},
						{
							type = "sprite",
							name = "specialReward",
							y = 19,
							visible = false,
							x = 160
						},
						{
							type = "sprite",
							name = "getSpecialReward",
							x = 160,
							visible = false,
							y = 19,
							scale = 0.7,
							pic = {
								path = "res/ui/kfyz/wait/kfyz_seal_get.png"
							}
						}
					}
				},
				{
					type = "sprite",
					name = "bg_treasure",
					y = 216,
					visible = false,
					x = 574,
					pic = {
						path = "res/ui/activity/muNiu/mnlm_smjz_bg.png"
					},
					children = {
						{
							y = 200,
							x = 183,
							type = "sprite",
							pic = {
								path = "res/ui/activity/muNiu/mnlm_smjz_title.png"
							}
						},
						{
							y = 146,
							x = 96,
							type = "sprite",
							pic = {
								path = "res/ui/activity/muNiu/mnlm_smjz_1d.png"
							}
						},
						{
							y = 146,
							x = 270,
							type = "sprite",
							pic = {
								path = "res/ui/activity/muNiu/mnlm_smjz_2d.png"
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_icon1",
							h = 90,
							type = "button",
							w = 90,
							y = 80,
							x = 96,
							normal = {
								path = "res/ui/activity/muNiu/mnlm_smjz_icon_bg.png"
							},
							touched = {
								path = "res/ui/activity/muNiu/mnlm_smjz_icon_bg.png"
							},
							children = {
								{
									x = 45,
									name = "icon1",
									y = 45,
									type = "sprite",
									scale = 0.68,
									pic = {
										path = "res/ui/weapon/godWeapon/huany_hbq.jpg"
									}
								}
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_icon2",
							h = 90,
							type = "button",
							w = 90,
							y = 80,
							x = 270,
							normal = {
								path = "res/ui/activity/muNiu/mnlm_smjz_icon_bg.png"
							},
							touched = {
								path = "res/ui/activity/muNiu/mnlm_smjz_icon_bg.png"
							},
							children = {
								{
									x = 45,
									name = "icon2",
									y = 45,
									type = "sprite",
									scale = 1.4,
									pic = {
										path = "res/ui/activity/muNiu/mnlm_icon_ban.png"
									}
								}
							}
						}
					}
				},
				{
					type = "scrollview",
					name = "ScrollView_rank",
					visible = false,
					y = 0,
					x = 3,
					viewSize = CCSizeMake(909, 380),
					children = {
						{
							height = 380,
							name = "layer_rank",
							x = 0,
							type = "layerColor",
							y = 0,
							width = 588,
							color = ccc4(0, 0, 0, 0),
							children = {
								{
									y = 206,
									name = "bg_rank",
									type = "sprite",
									x = 0,
									anchorPoint = ccp(0, 0.5),
									pic = {
										path = "res/ui/activity/muNiu/mnlm_phb_bg.png"
									},
									children = {
										{
											y = 146,
											x = 562,
											type = "sprite",
											pic = {
												path = "res/ui/activity/muNiu/mnlm_phb_title.png"
											}
										},
										{
											type = "button",
											name = "btn_show",
											h = 50,
											rotate = 90,
											w = 50,
											y = 32,
											x = 562,
											normal = {
												path = "res/ui/common/button/gxb_btn_small.png"
											},
											touched = {
												path = "res/ui/common/button/gxb_btn_small_c.png"
											}
										},
										{
											y = 268,
											x = 54,
											type = "sprite",
											pic = {
												path = "res/ui/activity/muNiu/mnlm_phb_word_pm.png"
											}
										},
										{
											y = 268,
											x = 202,
											type = "sprite",
											pic = {
												path = "res/ui/activity/muNiu/mnlm_phb_word_mh.png"
											}
										},
										{
											y = 268,
											x = 416,
											type = "sprite",
											pic = {
												path = "res/ui/activity/muNiu/mnlm_phb_word_jl.png"
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
	}
}
var_0_7.rankCell = {
	y = 0,
	name = "bg",
	type = "sprite",
	x = 0,
	anchorPoint = ccp(0, 0),
	pic = {
		path = "res/ui/activity/muNiu/mnlm_phb_list_01.png"
	},
	children = {
		{
			y = 22,
			name = "rank1st",
			type = "sprite",
			x = 54,
			pic = {
				path = "res/ui/kfyz/yuyue/kfyz_word_bs.png"
			}
		},
		{
			y = 22,
			name = "bg_rank",
			type = "sprite",
			x = 54,
			pic = {
				path = "res/ui/activity/muNiu/mnlm_phb_numb_bg.png"
			},
			children = {
				{
					fontSize = 22,
					name = "rank",
					y = 14,
					type = "label",
					x = 24
				}
			}
		},
		{
			fontSize = 22,
			name = "name",
			y = 22,
			type = "label",
			x = 202
		}
	}
}
var_0_7.tipFrame = {
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
			width = 600,
			textId = 136394,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}

function var_0_7.handlerPushNyRedPaper(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.action.data.update
	local var_2_1 = arg_2_0.info.state

	if var_2_0 then
		if arg_2_0.info.state == 4 then
			return
		end

		local var_2_2 = var_2_0.NyRedPaperUpdateInfo

		if var_2_2 then
			if var_2_2.happyInfo then
				arg_2_0.info.happyInfo = var_2_2.happyInfo
			end

			if var_2_2.state then
				arg_2_0.info.state = var_2_2.state
			end

			if var_2_2.tuHao then
				-- block empty
			end

			if var_2_2.roundCd then
				arg_2_0.info.roundCd = var_2_2.roundCd
			end

			if var_2_2.state ~= nil and var_2_2.state ~= var_2_1 then
				arg_2_0:refresh()
			else
				arg_2_0:showPanel(arg_2_0.info)
			end
		end
	end
end

function var_0_7.refresh(arg_3_0)
	local function var_3_0(arg_4_0)
		arg_3_0:showPanel(arg_4_0.action.data)
	end

	cmgr.sendRequest(var_3_0, actions.getNewYearRedPaperActivity)
end

function var_0_7.onWorshipGod(arg_5_0)
	local function var_5_0(arg_6_0)
		local var_6_0 = arg_6_0.action.data

		arg_5_0.info.state = var_6_0.state
		arg_5_0.info.roundCd = var_6_0.roundCd
		arg_5_0.info.happyInfo = var_6_0.happyInfo
		arg_5_0.info.redPaperRewardArrs = {
			{
				pos = 1
			},
			{
				pos = 2
			},
			{
				pos = 3
			}
		}

		arg_5_0:showPanel(arg_5_0.info)
	end

	messageBox.showChargeWin("", language.get(136388, arg_5_0.info.worshipGold), "nyRedPaperWorship", function()
		cmgr.sendRequest(var_5_0, actions.nyRedPaperWorshipGod)
	end)
end

function var_0_7.onOpenOne(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0.info.state

	local function var_8_1(arg_9_0)
		local var_9_0 = arg_9_0.action.data

		arg_8_0.info.state = var_9_0.state
		arg_8_0.info.roundCd = var_9_0.roundCd
		arg_8_0.info.freeTimes = var_9_0.freeTimes
		arg_8_0.info.openGold = var_9_0.openGold
		arg_8_0.info.curRoundNum = var_9_0.curRoundNum
		arg_8_0.isGettingReward = true

		local var_9_1

		if var_8_0 == 2 and var_9_0.state == 3 then
			function var_9_1()
				arg_8_0:showPanel(arg_8_0.info)
			end
		else
			arg_8_0:showPanel(arg_8_0.info)
		end

		arg_8_0:showEffectReward(var_9_0.rewards, arg_8_1, var_9_0.baoji, var_9_1, var_9_0)
	end

	if arg_8_1 == 0 and arg_8_0.info.freeTimes <= 0 then
		messageBox.showChargeWin("", language.get(136389, arg_8_0.info.openGold), "nyRedPaperOpen", function()
			cmgr.sendRequest(var_8_1, actions.nyRedPaperOpenOne, arg_8_1)
		end)
	else
		cmgr.sendRequest(var_8_1, actions.nyRedPaperOpenOne, arg_8_1)
	end
end

function var_0_7.onWelfareOpen(arg_12_0, arg_12_1)
	local function var_12_0(arg_13_0)
		local var_13_0 = arg_13_0.action.data

		arg_12_0.info.state = var_13_0.state
		arg_12_0.info.roundCd = var_13_0.roundCd
		arg_12_0.info.curBatchNo = var_13_0.curBatchNo
		arg_12_0.info.happyInfo = var_13_0.happyInfo
		arg_12_0.info.batchRewardArrs = var_13_0.batchRewardArrs
		arg_12_0.isGettingReward = true

		local var_13_1

		if var_13_0.next then
			function var_13_1()
				arg_12_0:showPanel(arg_12_0.info)
			end
		else
			arg_12_0:showPanel(arg_12_0.info)
		end

		arg_12_0:showEffectReward(var_13_0.rewards, arg_12_1, var_13_0.baoji, var_13_1)
	end

	cmgr.sendRequest(var_12_0, actions.nyRedPaperWelfareOpen, arg_12_1)
end

function var_0_7.onGetRankList(arg_15_0)
	local function var_15_0(arg_16_0)
		local var_16_0 = arg_16_0.action.data

		if var_16_0.rewardRankArrs then
			arg_15_0.info.rewardRankArrs = var_16_0.rewardRankArrs

			arg_15_0:createRankList()
		end
	end

	cmgr.sendRequest(var_15_0, actions.nyRedPaperGetRankList)
end

function var_0_7.createRankList(arg_17_0)
	local function var_17_0(arg_18_0, arg_18_1)
		log.info("cell touched at : ", arg_18_1:getIdx())
	end

	local function var_17_1(arg_19_0, arg_19_1)
		return 46, 532
	end

	local function var_17_2(arg_20_0, arg_20_1)
		local var_20_0 = arg_20_0:dequeueCell()

		if var_20_0 then
			var_20_0:removeAllChildrenWithCleanup(true)
		else
			var_20_0 = CCTableViewCell:new()
		end

		local var_20_1 = arg_17_0.info.rewardRankArrs[arg_20_1 + 1]

		if var_20_1 then
			local var_20_2 = {}

			uiutil.initWidgets(var_20_2, arg_17_0.rankCell)
			var_20_2.widgets.bg:setPosition(ccp(0, 2))

			if arg_20_1 % 2 == 1 then
				var_20_2.widgets.bg:setDisplayFrame(CCSprite:create("res/ui/activity/muNiu/mnlm_phb_list_02.png"):displayFrame())
			end

			var_20_0:addChild(var_20_2.widgets.bg)

			local var_20_3 = var_20_1.rank == 1

			var_20_2.widgets.rank1st:setVisible(var_20_3)
			var_20_2.widgets.bg_rank:setVisible(not var_20_3)

			if not var_20_3 then
				var_20_2.widgets.rank:setString(var_20_1.rank)
			end

			var_20_2.widgets.name:setString(var_20_1.playerName)

			local var_20_4 = #var_20_1.rewards

			for iter_20_0, iter_20_1 in ipairs(var_20_1.rewards) do
				local var_20_5 = arg_17_0:getSingleReward(iter_20_1)

				var_20_5:setPosition(310 + 130 * (iter_20_0 - 1), 22)
				var_20_2.widgets.bg:addChild(var_20_5)
			end
		end

		return var_20_0
	end

	local function var_17_3()
		local var_21_0 = arg_17_0.info.rewardRankArrs

		if var_21_0 and #var_21_0 > 0 then
			return #var_21_0
		else
			return 0
		end
	end

	local var_17_4 = CCTableView:create(CCSizeMake(535, 240))

	var_17_4:setPosition(0, 5)
	var_17_4:setDirection(kCCScrollViewDirectionVertical)
	var_17_4:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_17_0.view.widgets.bg_rank:addChild(var_17_4)

	if arg_17_0.rankList then
		arg_17_0.rankList:removeFromParentAndCleanup(true)
	end

	arg_17_0.rankList = var_17_4

	var_17_4:registerScriptHandler(var_17_0, CCTableView.kTableCellTouched)
	var_17_4:registerScriptHandler(var_17_1, CCTableView.kTableCellSizeForIndex)
	var_17_4:registerScriptHandler(var_17_2, CCTableView.kTableCellSizeAtIndex)
	var_17_4:registerScriptHandler(var_17_3, CCTableView.kNumberOfCellsInTableView)
	var_17_4:reloadData()
end

function var_0_7.showEffectMuNiu(arg_22_0)
	if arg_22_0.isShowingEffectMuNiu then
		return
	end

	arg_22_0.isShowingEffectMuNiu = true

	local var_22_0 = rmgr.getAnimation("warlockUpgrade")
	local var_22_1 = CCAnimation:createWithSpriteFrames(var_22_0, 0.08)
	local var_22_2 = CCAnimate:create(var_22_1)
	local var_22_3 = CCSprite:create()

	var_22_3:setPosition(visibleSize.width / 2, visibleSize.height / 2 - 60)
	arg_22_0:addChild(var_22_3)

	local var_22_4 = CCArray:create()

	var_22_4:addObject(var_22_2)
	var_22_4:addObject(CCCallFunc:create(function()
		var_22_3:removeFromParentAndCleanup(true)
	end))
	var_22_3:runAction(CCSequence:create(var_22_4))

	local function var_22_5()
		if not tolua.isnull(arg_22_0.view.widgets.btn_cattle1) then
			arg_22_0.view.widgets.btn_cattle1:setVisible(true)
			arg_22_0.view.widgets.btn_cattle2:setVisible(true)
			arg_22_0.view.widgets.btn_cattle3:setVisible(true)
		end

		arg_22_0.isShowingEffectMuNiu = false
	end

	local var_22_6 = CCSprite:create("res/ui/activity/muNiu/mnlm_word_ffjz.png")

	var_22_6:setPosition(visibleSize.width / 2, visibleSize.height / 2 - 90)
	smgr.showTipSpriteText(var_22_6, var_22_5, 0)
end

function var_0_7.showEffectReward(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4, arg_25_5)
	if arg_25_2 == 0 then
		arg_25_2 = 2
	end

	arg_25_3 = arg_25_3 or 1

	local var_25_0 = "mnlm_jiaohuo_word_1x.png"

	if arg_25_3 == 1 then
		var_25_0 = "mnlm_jiaohuo_word_1x.png"
	elseif arg_25_3 == 2 then
		var_25_0 = "mnlm_jiaohuo_word_2x.png"
	elseif arg_25_3 == 4 then
		var_25_0 = "mnlm_jiaohuo_word_4x.png"
	elseif arg_25_3 == 10 then
		var_25_0 = "mnlm_jiaohuo_word_10x.png"
	end

	arg_25_0.view.widgets["node_reward" .. arg_25_2]:removeAllChildrenWithCleanup(true)

	local var_25_1 = #arg_25_1

	for iter_25_0, iter_25_1 in ipairs(arg_25_1) do
		if iter_25_1.type == 132 or iter_25_1.type == 137 then
			var_25_0 = "mnlm_jiaohuo_word_tsjz.png"

			local var_25_2

			if iter_25_1.type == 137 then
				if arg_25_5.changeReward then
					if arg_25_5.changeReward.type == 116 then
						user.halfSilkTokenMsg = language.get(136401, arg_25_5.changeReward.num)
					else
						user.halfSilkTokenMsg = language.get(136402, arg_25_5.changeReward.num)
					end
				else
					user.halfSilkTokenMsg = language.get(136400)
				end

				function var_25_2()
					roleDialogue.control.loadSpeak(1585)
				end
			end

			arg_25_0:showEffectSpecialReward(var_25_2)
		end

		local var_25_3 = arg_25_0:getSingleReward(iter_25_1)

		var_25_3:setPosition(110, 55 - 50 * (iter_25_0 - 0.5 - 0.5 * var_25_1))
		arg_25_0.view.widgets["node_reward" .. arg_25_2]:addChild(var_25_3)
	end

	arg_25_0.view.widgets["baoji" .. arg_25_2]:setDisplayFrame(CCSprite:create("res/ui/activity/muNiu/" .. var_25_0):displayFrame())

	local var_25_4 = arg_25_0.view.widgets["bg_reward" .. arg_25_2]

	var_25_4:setVisible(true)
	var_25_4:setPosition(187, 36)

	local var_25_5 = CCArray:create()

	var_25_5:addObject(CCEaseSineOut:create(CCMoveTo:create(0.5, ccp(187, 66))))
	var_25_5:addObject(CCCallFunc:create(function()
		arg_25_0.isGettingReward = false

		if arg_25_4 then
			arg_25_4()
		end
	end))

	local var_25_6 = CCSequence:create(var_25_5)

	var_25_4:runAction(var_25_6)
end

function var_0_7.showEffectSpecialReward(arg_28_0, arg_28_1)
	local var_28_0 = false
	local var_28_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_28_1:registerScriptTouchHandler(function(arg_29_0, arg_29_1, arg_29_2)
		if arg_29_0 == CCTOUCHBEGAN then
			return true
		elseif arg_29_0 == CCTOUCHMOVED then
			return true
		elseif arg_29_0 == CCTOUCHENDED then
			if not var_28_0 then
				return
			end

			pcall(var_28_1.removeFromParentAndCleanup, var_28_1, true)

			if arg_28_1 then
				arg_28_1()
			end

			return true
		end
	end, false, true)
	var_28_1:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_28_1, 60000)

	local var_28_2 = rmgr.getAnimation("treasureLight")
	local var_28_3 = CCAnimation:createWithSpriteFrames(var_28_2, 0.1)
	local var_28_4 = CCAnimate:create(var_28_3)
	local var_28_5 = CCSprite:create()

	var_28_5:setPosition(visibleSize.width / 2, visibleSize.height / 2 - 60)
	var_28_1:addChild(var_28_5)
	var_28_5:runAction(CCRepeatForever:create(var_28_4))

	local var_28_6 = CCSprite:create("res/ui/rankInfo/DailyFeatView/gxb_bx.png")

	var_28_6:setPosition(visibleSize.width / 2, visibleSize.height / 2 - 60)
	var_28_1:addChild(var_28_6)

	local var_28_7 = CCSprite:create("res/ui/activity/muNiu/mnlm_word_cgkctsjz.png")

	var_28_7:setPosition(visibleSize.width / 2, visibleSize.height / 2 - 60 - 60)
	var_28_1:addChild(var_28_7)
	var_28_7:setScale(0.2)

	local var_28_8 = CCArray:create()

	var_28_8:addObject(CCMoveBy:create(1, ccp(0, 60)))
	var_28_8:addObject(CCScaleTo:create(0.05, 1.1, 1.1))
	var_28_8:addObject(CCScaleTo:create(0.05, 1, 1))
	var_28_8:addObject(CCCallFunc:create(function()
		var_28_0 = true
	end))

	local var_28_9 = CCSequence:create(var_28_8)

	var_28_7:runAction(var_28_9)
	var_28_7:runAction(CCScaleTo:create(0.5, 1, 1))
end

function var_0_7.getSingleReward(arg_31_0, arg_31_1)
	local var_31_0 = CCNode:create()
	local var_31_1

	if arg_31_1.type == 132 or arg_31_1.type == 137 then
		local var_31_2 = arg_31_1.type == 132 and "mnlm_icon_hy.png" or "mnlm_icon_ban_s.png"

		var_31_1 = CCSprite:create("res/ui/activity/muNiu/mnlm_icon_bg.png")

		local var_31_3 = CCSprite:create("res/ui/activity/muNiu/" .. var_31_2)

		var_31_3:setPosition(24, 24)
		var_31_1:addChild(var_31_3)

		local var_31_4 = CCSprite:create("res/ui/activity/muNiu/mnlm_star_s.png")

		var_31_4:setPosition(10, 40)
		var_31_1:addChild(var_31_4)
	else
		local var_31_5 = var_0_0[arg_31_1.type]

		if var_31_5 then
			var_31_1 = CCSprite:create(var_31_5.pic)

			if var_31_5.scale then
				var_31_1:setScale(var_31_5.scale)
			end
		else
			var_31_1 = CCSprite:create()
		end
	end

	var_31_0:addChild(var_31_1)

	local var_31_6 = arg_31_1.num

	if var_31_6 > 10000 then
		var_31_6 = language.get(75021, var_31_6 / 10000)
	end

	local var_31_7 = CCLabelTTF:create(language.get(135039, var_31_6), "Thonburi-Bold", 22)

	var_31_7:setAnchorPoint(ccp(0, 0.5))
	var_31_7:setPosition(25, 0)
	var_31_0:addChild(var_31_7)

	return var_31_0
end

function var_0_7.showPanel(arg_32_0, arg_32_1)
	arg_32_0.info = arg_32_1

	arg_32_0.view.widgets.node_camp:setVisible(false)
	arg_32_0.view.widgets.node_reward:setVisible(false)
	arg_32_0.view.widgets.btn_open:setVisible(false)
	arg_32_0.view.widgets.bg_bar:setVisible(false)
	arg_32_0.view.widgets.round:setString(language.get(390478, arg_32_1.curRoundNum, arg_32_1.maxRoundNum))

	if arg_32_0.isGettingReward ~= true then
		for iter_32_0 = 1, 3 do
			arg_32_0.view.widgets["btn_cattle" .. iter_32_0]:setEnabled(true)
			arg_32_0.view.widgets["btn_cattle" .. iter_32_0]:setVisible(false)
			arg_32_0.view.widgets["bg_reward" .. iter_32_0]:setVisible(false)
			arg_32_0.view.widgets["node_reward" .. iter_32_0]:removeAllChildrenWithCleanup(true)
		end
	end

	if arg_32_1.state == 0 then
		-- block empty
	elseif arg_32_1.state == 1 then
		arg_32_0.view.widgets.bg_bar:setVisible(true)
		arg_32_0.view.widgets.node_camp:setVisible(true)
		arg_32_0.view.widgets.bar:setPercentage(100 * arg_32_1.happyInfo.value / arg_32_1.happyInfo.maxValue)
		arg_32_0.view.widgets.happyInfo:setString(language.get(390478, arg_32_1.happyInfo.value, arg_32_1.happyInfo.maxValue))
		arg_32_0.view.widgets.worshipGold:setString(arg_32_1.worshipGold)
		arg_32_0.view.widgets.icon2:removeAllChildrenWithCleanup(true)

		for iter_32_1 = 1, 2 do
			local var_32_0 = arg_32_0.view.widgets["icon" .. iter_32_1]

			var_32_0:removeAllChildrenWithCleanup(true)

			local var_32_1 = arg_32_1.extraRewardArrs[iter_32_1]

			if var_32_1 ~= nil and var_32_1.state ~= 1 then
				tool.spriteToGray(var_32_0)
			end
		end
	elseif arg_32_1.state == 2 then
		arg_32_0.view.widgets.node_reward:setVisible(true)

		local var_32_2 = arg_32_1.redPaperRewardArrs
	elseif arg_32_1.state == 3 then
		arg_32_0.view.widgets.node_reward:setVisible(true)
		arg_32_0.view.widgets.btn_open:setVisible(true)

		local var_32_3 = arg_32_1.freeTimes > 0

		arg_32_0.view.widgets.freeTimes:setVisible(var_32_3)
		arg_32_0.view.widgets.icon_gold:setVisible(not var_32_3)
		arg_32_0.view.widgets.openGold:setVisible(not var_32_3)

		if var_32_3 then
			arg_32_0.view.widgets.freeTimes:setString(language.get(136204, arg_32_1.freeTimes))
		else
			arg_32_0.view.widgets.openGold:setString(arg_32_1.openGold)
		end

		arg_32_0.view.widgets.btn_cattle2:setVisible(true)
		arg_32_0.view.widgets.btn_cattle2:setEnabled(false)
	elseif arg_32_1.state == 4 then
		arg_32_0.view.widgets.bg_bar:setVisible(true)
		arg_32_0.view.widgets.node_reward:setVisible(true)
		arg_32_0.view.widgets.bar:setPercentage(100)
		arg_32_0.view.widgets.happyInfo:setString(language.get(390478, 8888, 8888))
	end

	if arg_32_1.state == 2 or arg_32_1.state == 4 then
		local var_32_4 = arg_32_1.state == 2 and arg_32_1.redPaperRewardArrs or arg_32_1.batchRewardArrs

		if var_32_4[1].rewards == nil and var_32_4[2].rewards == nil and var_32_4[3].rewards == nil then
			if arg_32_1.curBatchNo == 1 then
				roleDialogue.control.loadSpeak(1583)
			elseif arg_32_0.isGettingReward ~= true then
				arg_32_0:showEffectMuNiu()
			end
		else
			for iter_32_2, iter_32_3 in ipairs(var_32_4) do
				local var_32_5 = iter_32_3.rewards and #iter_32_3.rewards > 0
				local var_32_6 = arg_32_0.view.widgets["btn_cattle" .. iter_32_2]

				var_32_6:setVisible(true)
				var_32_6:setEnabled(not var_32_5)

				if arg_32_0.isGettingReward ~= true and var_32_5 then
					arg_32_0:showEffectReward(iter_32_3.rewards, iter_32_2)
				end
			end
		end
	end

	arg_32_0.view.widgets.specialReward:setVisible(false)
	arg_32_0.view.widgets.getSpecialReward:setVisible(false)

	if arg_32_1.todaySpecialRewardType and arg_32_1.todaySpecialRewardType > 0 then
		local var_32_7
		local var_32_8

		for iter_32_4, iter_32_5 in ipairs(arg_32_1.extraRewardArrs) do
			if arg_32_1.todaySpecialRewardType == iter_32_5.type then
				if iter_32_5.type == 132 then
					var_32_7 = "mnlm_icon_hy.png"
				elseif iter_32_5.type == 137 then
					var_32_7 = "mnlm_icon_ban_s.png"
				end

				var_32_8 = iter_32_5.state

				break
			end
		end

		if var_32_7 then
			arg_32_0.view.widgets.specialReward:setDisplayFrame(CCSprite:create("res/ui/activity/muNiu/" .. var_32_7):displayFrame())
			arg_32_0.view.widgets.specialReward:setVisible(true)
			arg_32_0.view.widgets.getSpecialReward:setVisible(var_32_8 == 1)
		end
	end

	arg_32_0.view.widgets.bg_tuHao:setVisible(false)
	arg_32_0.view.widgets.bg_time:setVisible(false)
	arg_32_0.view.widgets.roundCd:stopAllActions()

	if arg_32_1.state == 2 or arg_32_1.state == 3 then
		if user.tuHao ~= nil then
			arg_32_0.view.widgets.tuHao:setString(language.get(136399, user.tuHao))
			arg_32_0.view.widgets.bg_tuHao:setVisible(true)
		end

		if arg_32_1.roundCd and arg_32_1.roundCd > 0 then
			arg_32_0.view.widgets.bg_time:setVisible(true)
			arg_32_0.view.widgets.roundCd:setString(tool.getFormatTime(arg_32_1.roundCd))
			arg_32_0.view.widgets.richLine:reorder()

			local var_32_9 = CCArray:create()

			var_32_9:addObject(CCDelayTime:create(1))
			var_32_9:addObject(CCCallFunc:create(function()
				arg_32_1.roundCd = arg_32_1.roundCd - 1000

				if arg_32_1.roundCd <= 0 then
					arg_32_0:refresh()
				else
					arg_32_0.view.widgets.roundCd:setString(tool.getFormatTime(arg_32_1.roundCd))
				end
			end))

			local var_32_10 = CCSequence:create(var_32_9)

			arg_32_0.view.widgets.roundCd:runAction(CCRepeatForever:create(var_32_10))
		end
	else
		user.tuHao = nil
	end

	local var_32_11 = arg_32_1.rewardRankArrs and #arg_32_1.rewardRankArrs > 0

	arg_32_0.view.widgets.ScrollView_rank:setVisible(var_32_11)

	if var_32_11 then
		arg_32_0.view.widgets.btn_show:setScale(1)
		arg_32_0.view.widgets.layer_rank:setPositionX(-536)
		arg_32_0:createRankList()
	end
end

function var_0_7.ctor(arg_34_0, arg_34_1, arg_34_2)
	log.info("@@ 注册送礼活动")

	arg_34_0.view = {}

	uiutil.initWidgets(arg_34_0.view, arg_34_0.layout)

	arg_34_0.leftTime = arg_34_0.view.widgets.leftTime

	if arg_34_1 then
		arg_34_0:addChild(arg_34_0.view.widgets.root)
		arg_34_1:addChild(arg_34_0)
	end

	arg_34_0.view.widgets.layer_rank:setPositionX(-536)
	swallowTouch(arg_34_0.view.widgets.layer_rank)
	arg_34_0.view.widgets.ScrollView_rank:setTouchEnabled(false)
	arg_34_0.view.widgets.btn_show:addHandleOfControlEvent(function()
		log.info("btn_show")

		local var_35_0 = arg_34_0.view.widgets.btn_show:getScale()

		if var_35_0 > 0 and arg_34_0.rankList then
			arg_34_0.rankList:setContentOffset(ccp(0, arg_34_0.rankList:minContainerOffset().y))
			arg_34_0.rankList:setVisible(true)
			arg_34_0:onGetRankList()
		end

		local var_35_1 = CCArray:create()

		var_35_1:addObject(CCMoveTo:create(0.5, ccp(var_35_0 > 0 and 0 or -536, 0)))
		var_35_1:addObject(CCCallFuncN:create(function()
			arg_34_0.view.widgets.btn_show:setScale(-1 * var_35_0)
			arg_34_0.view.widgets.btn_show:setEnabled(true)

			if arg_34_0.rankList then
				arg_34_0.rankList:setVisible(var_35_0 > 0)
			end
		end))

		local var_35_2 = CCSequence:create(var_35_1)

		arg_34_0.view.widgets.layer_rank:runAction(var_35_2)
	end, CCControlEventTouchUpInside)
	arg_34_0.view.widgets.btn_camp:addHandleOfControlEvent(function()
		log.info("btn_camp")
		arg_34_0.view.widgets.bg_treasure:setVisible(not arg_34_0.view.widgets.bg_treasure:isVisible())
	end, CCControlEventTouchUpInside)

	local var_34_0 = CCArray:create()

	var_34_0:addObject(CCFadeIn:create(1))
	var_34_0:addObject(CCFadeOut:create(3))
	var_34_0:addObject(CCDelayTime:create(1))

	local var_34_1 = CCSequence:create(var_34_0)

	arg_34_0.view.widgets.light:runAction(CCRepeatForever:create(var_34_1))
	arg_34_0.view.widgets.btn_worship:addHandleOfControlEvent(function()
		log.info("btn_worship")
		arg_34_0:onWorshipGod()
	end, CCControlEventTouchUpInside)

	for iter_34_0 = 1, 3 do
		arg_34_0.view.widgets["btn_cattle" .. iter_34_0]:addHandleOfControlEvent(function()
			log.info("btn_cattle" .. iter_34_0)

			if arg_34_0.info.state == 2 then
				arg_34_0:onOpenOne(iter_34_0)
			elseif arg_34_0.info.state == 4 then
				arg_34_0:onWelfareOpen(iter_34_0)
			end
		end, CCControlEventTouchUpInside)
	end

	arg_34_0.view.widgets.btn_open:addHandleOfControlEvent(function()
		log.info("btn_open")
		arg_34_0:onOpenOne(0)
	end, CCControlEventTouchUpInside)
	arg_34_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_34_0:showTip()
	end, CCControlEventTouchUpInside)

	for iter_34_1 = 1, 2 do
		arg_34_0.view.widgets["btn_icon" .. iter_34_1]:addHandleOfControlEvent(function()
			log.info("btn_icon" .. iter_34_1)
			arg_34_0:showTip(iter_34_1)
		end, CCControlEventTouchUpInside)
	end

	arg_34_0:showPanel(arg_34_2)
end

function var_0_7.showTip(arg_43_0, arg_43_1)
	log.info("should show tips ")

	local var_43_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_43_0:registerScriptTouchHandler(function(arg_44_0, arg_44_1, arg_44_2)
		if arg_44_0 == CCTOUCHBEGAN then
			return true
		elseif arg_44_0 == CCTOUCHMOVED then
			return true
		elseif arg_44_0 == CCTOUCHENDED then
			pcall(var_43_0.removeFromParentAndCleanup, var_43_0, true)

			return true
		end
	end, false, true)
	var_43_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_43_0, 60000)

	local var_43_1 = 0
	local var_43_2 = 0
	local var_43_3 = {}

	uiutil.initWidgets(var_43_3, arg_43_0.tipFrame)
	var_43_0:addChild(var_43_3.widgets.tipFrame)

	local var_43_4 = arg_43_0.view.widgets.btn_tip

	if arg_43_1 then
		var_43_4 = arg_43_0.view.widgets["btn_icon" .. arg_43_1]

		local var_43_5 = arg_43_0.info.extraRewardArrs[arg_43_1]

		var_43_3.widgets.tipMsg:setDimensions(CCSizeMake(400, 0))
		var_43_3.widgets.tipMsg:setString(var_43_5.tips)
	end

	local var_43_6, var_43_7 = tool.getPositionInScreen(var_43_4)
	local var_43_8 = var_43_6 + 20
	local var_43_9 = var_43_7 - 20
	local var_43_10 = var_43_3.widgets.tipMsg:getContentSize().width
	local var_43_11 = var_43_3.widgets.tipMsg:getContentSize().height

	var_43_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_43_10 + 30, var_43_11 + 30))
	var_43_3.widgets.tipFrame:setPosition(ccp(var_43_8, var_43_9))
	var_43_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_43_3.widgets.tipFrame:setVisible(true)
end

function var_0_7.onEnter(arg_45_0)
	arg_45_0.handlerPushNyRedPaperRef = handler(arg_45_0, arg_45_0.handlerPushNyRedPaper)
	arg_45_0.showmuniuRef = handler(arg_45_0, arg_45_0.showEffectMuNiu)

	cmgr.registerResponseHandler(actions.pushNyRedPaper, arg_45_0.handlerPushNyRedPaperRef)
	eventManager.registerEvent("showmuniu", arg_45_0.showmuniuRef)
end

function var_0_7.onExit(arg_46_0)
	cmgr.unregisterResponseHandler(actions.pushNyRedPaper, arg_46_0.handlerPushNyRedPaperRef)
	eventManager.unregisterEvent("showmuniu", arg_46_0.showmuniuRef)
end

return var_0_7
