local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = colorQuality[3]
local var_0_2 = colorQuality[2]
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[6]
local var_0_6 = class("CorpsPanelNew", function()
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
					name = "Node",
					type = "node",
					x = 480,
					children = {
						{
							y = 0,
							name = "bg",
							type = "sprite",
							x = 0,
							pic = {
								path = "res/ui/corps/jttz_bg.jpg"
							}
						},
						{
							y = 219.9999,
							name = "title",
							type = "sprite",
							x = -0.0001,
							pic = {
								path = "res/ui/corps/sjwc_title_1.png"
							}
						},
						{
							y = -121.7264,
							name = "jttz_ground",
							type = "sprite",
							x = -177.9998,
							pic = {
								path = "res/ui/corps/jttz_ground.png"
							}
						},
						{
							y = -12,
							name = "jttz_light",
							type = "sprite",
							x = -178,
							pic = {
								path = "res/ui/corps/jttz_light.png"
							}
						},
						{
							y = -38.0004,
							name = "corpsUnit",
							type = "sprite",
							x = -159.9996,
							pic = {
								path = "res/ui/corps/corpsUnit.png"
							}
						},
						{
							y = 0,
							name = "startNode",
							type = "node",
							x = 0,
							children = {
								{
									y = 150,
									name = "jttz_word_di",
									type = "sprite",
									x = -345,
									pic = {
										path = "res/ui/corps/jttz_word_di.png"
									}
								},
								{
									y = 101,
									name = "fsBg",
									type = "sprite",
									x = -345,
									pic = {
										path = "res/ui/corps/jttz_word_di.png"
									}
								},
								{
									y = 50,
									name = "jttz_clock_di",
									type = "sprite",
									x = -365,
									pic = {
										path = "res/ui/corps/jttz_clock_di.png"
									}
								},
								{
									y = 50,
									name = "jttz_clock",
									type = "sprite",
									x = -422,
									pic = {
										path = "res/ui/corps/jttz_clock.png"
									}
								},
								{
									fontSize = 22,
									name = "Text_1",
									y = 150.9997,
									type = "label",
									x = -420.0005
								},
								{
									fontSize = 22,
									name = "Text_2",
									y = 102,
									type = "label",
									x = -425
								},
								{
									fontSize = 20,
									name = "donationNum",
									y = 151,
									type = "label",
									x = -345
								},
								{
									fontSize = 20,
									name = "otherNationNum",
									y = 102,
									type = "label",
									x = -350
								},
								{
									fontSize = 20,
									name = "donationCd",
									y = 50,
									type = "label",
									x = -330
								},
								{
									name = "btn_go",
									h = 62,
									type = "button",
									w = 195,
									y = -210,
									x = -278,
									normal = {
										path = "res/ui/common/button/public_btn_green.png"
									},
									touched = {
										path = "res/ui/common/button/public_btn_green_c.png"
									},
									children = {
										{
											fontSize = 26,
											name = "Text_7",
											y = 34,
											type = "label",
											x = 97.5,
											textId = 135604,
											color = var_0_0
										}
									}
								},
								{
									name = "btn_transfer",
									h = 62,
									type = "button",
									w = 195,
									y = -210,
									x = -78,
									normal = {
										path = "res/ui/common/button/public_btn_red.png"
									},
									touched = {
										path = "res/ui/common/button/public_btn_red_c.png"
									},
									children = {
										{
											fontSize = 26,
											name = "Text_8",
											y = 34,
											type = "label",
											x = 97.5,
											textId = 136230,
											color = var_0_0
										}
									}
								},
								{
									y = 0,
									name = "nameNode",
									type = "node",
									x = 0,
									children = {
										{
											y = 63,
											name = "jtsj_word_bg2",
											type = "sprite",
											x = -11,
											anchorPoint = ccp(1.2301, 0.8054),
											pic = {
												path = "res/ui/world/worldEventTimeBg.png"
											},
											children = {
												{
													fontSize = 20,
													name = "playerName",
													y = 20,
													type = "label",
													x = 110
												}
											}
										}
									}
								}
							}
						},
						{
							y = -39.0001,
							name = "jttz_di",
							type = "sprite",
							x = 274.9998,
							pic = {
								path = "res/ui/corps/jttz_di.png"
							}
						},
						{
							y = 0,
							name = "rightNode",
							type = "node",
							x = 0,
							children = {
								{
									y = 157.0001,
									name = "jttz_word_di2",
									type = "sprite",
									x = 270,
									pic = {
										path = "res/ui/corps/jttz_word_di2.png"
									}
								},
								{
									name = "generalPicBtn",
									h = 78,
									type = "button",
									w = 78,
									y = 135.0002,
									x = 150.0001,
									normal = {
										path = "res/ui/tavern/gen_por_view_bg.jpg"
									},
									touched = {
										path = "res/ui/tavern/gen_por_view_bg.jpg"
									},
									children = {
										{
											y = 40,
											name = "generalPic",
											type = "sprite",
											x = 39,
											pic = {
												path = "res/ui/common/generalPic/generalPic_0.jpg"
											}
										}
									}
								},
								{
									y = 115,
									name = "jttz_word_di",
									type = "sprite",
									scaleX = 0.7,
									x = 269.9999,
									pic = {
										path = "res/ui/corps/jttz_word_di.png"
									}
								},
								{
									y = 116,
									name = "cjfp_jl_hy",
									scale = 0.26,
									type = "sprite",
									x = 230,
									pic = {
										path = "res/ui/activity/card/cjfp_jl_hy.png"
									}
								},
								{
									fontSize = 20,
									name = "hasPhantomNum",
									y = 157,
									type = "label",
									x = 267
								},
								{
									fontSize = 20,
									name = "selfDonationNum",
									y = 116,
									type = "label",
									x = 290
								},
								{
									name = "btn_addPhantom",
									h = 58,
									type = "button",
									w = 140,
									y = 135,
									scaleX = 0.7,
									x = 400,
									normal = {
										frame = true,
										path = "btn3_yel_a.png"
									},
									touched = {
										frame = true,
										path = "btn3_yel_c.png"
									}
								},
								{
									fontSize = 22,
									name = "Text_12",
									y = 135,
									type = "label",
									x = 400,
									textId = 143010,
									color = var_0_0
								},
								{
									y = 70,
									name = "jttz_notice_word_di",
									type = "sprite",
									x = 275,
									pic = {
										path = "res/ui/corps/jttz_notice_word_di.png"
									}
								},
								{
									y = 70,
									name = "jttz_notice_icon",
									type = "sprite",
									x = 117,
									pic = {
										path = "res/ui/corps/jttz_notice_icon.png"
									}
								},
								{
									fontSize = 20,
									name = "noticeTips",
									y = 70,
									type = "label",
									x = 280
								},
								{
									y = 75,
									name = "myNationBtn",
									h = 62,
									type = "button",
									w = 62,
									visible = false,
									x = 424,
									normal = {
										path = "res/ui/corps/fsgjt_btn_bg.png"
									},
									touched = {
										path = "res/ui/corps/fsgjt_btn_bg_c.png"
									}
								},
								{
									y = 75,
									name = "otherNationBtn",
									h = 62,
									type = "button",
									w = 62,
									visible = false,
									x = 424,
									normal = {
										path = "res/ui/corps/fsgjt_btn_fs.png"
									},
									touched = {
										path = "res/ui/corps/fsgjt_btn_fs_c.png"
									}
								}
							}
						},
						{
							y = -85,
							name = "swcjTips",
							type = "sprite",
							x = 275,
							pic = {
								path = "res/ui/corps/jtmj_word_swcjjt.png"
							}
						},
						{
							name = "btn_create",
							h = 62,
							type = "button",
							w = 195,
							y = -210,
							x = -178,
							normal = {
								path = "res/ui/common/button/public_btn_green.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_green_c.png"
							},
							children = {
								{
									fontSize = 26,
									name = "Text_6",
									y = 34,
									type = "label",
									x = 97.5,
									textId = 136231,
									color = var_0_0
								},
								{
									fontSize = 20,
									name = "createInfo",
									y = 75.9993,
									type = "label",
									x = 97.5
								},
								{
									type = "sprite",
									name = "buyCreateGold",
									y = 75.9991,
									visible = false,
									scale = 0.8,
									x = 62.4994,
									pic = {
										path = "res/ui/playerInfo/icon_gold.png"
									}
								}
							}
						},
						{
							type = "node",
							name = "node_phantom",
							y = -302,
							visible = false,
							x = -185,
							children = {
								{
									y = 340,
									type = "sprite",
									x = 270,
									pic = {
										path = "res/default.png"
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
										}
									}
								}
							}
						},
						{
							type = "sprite9",
							name = "bg_list2",
							visible = false,
							y = -100,
							x = 280,
							preferedSize = CCSizeMake(540, 320),
							middleRect = CCRectMake(24, 24, 1, 1),
							pic = {
								path = "res/default.png"
							}
						},
						{
							visible = false,
							name = "bg_list3",
							type = "sprite9",
							y = -100,
							x = 280,
							preferedSize = CCSizeMake(540, 320),
							middleRect = CCRectMake(24, 24, 1, 1),
							pic = {
								path = "res/default.png"
							},
							children = {
								{
									fontSize = 20,
									name = "otherMsgLb",
									y = 330,
									type = "label",
									x = 150,
									color = var_0_0,
									anchorPoint = ccp(0, 0.5)
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
						},
						{
							x = -457.5,
							height = 450,
							visible = false,
							type = "layerColor",
							name = "maskLayer",
							y = -275,
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
							type = "sprite",
							name = "state",
							visible = false,
							pic = {
								path = "res/ui/corps/jt_word_dfqrzqsh.png"
							}
						},
						{
							name = "btn_cancel",
							h = 62,
							type = "button",
							w = 160,
							y = -100,
							visible = false,
							x = 0,
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
			x = 270,
			anchorPoint = ccp(0.5, 0),
			pic = {
				path = "res/default.png"
			}
		},
		{
			fontSize = 20,
			name = "playerName",
			y = 20,
			type = "label",
			x = 135,
			color = var_0_4,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 20,
			name = "generalLv",
			y = 20,
			type = "label",
			x = 280,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 20,
			name = "num",
			y = 20,
			type = "label",
			x = 400,
			anchorPoint = ccp(0, 0.5)
		},
		{
			zoomOnTouchDown = true,
			name = "btn_kick",
			h = 34,
			type = "button",
			w = 34,
			y = 18,
			x = 400,
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
			x = 270,
			anchorPoint = ccp(0.5, 0),
			pic = {
				path = "res/default.png"
			}
		},
		{
			fontSize = 20,
			name = "playerName",
			y = 20,
			type = "label",
			x = 130,
			color = var_0_4,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 20,
			name = "kingName",
			y = 20,
			type = "label",
			x = 320,
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
		kfcmgr.sendRequest(var_2_0, actions.getCorpsInfo, arg_2_0.info.cityId, 0)
	else
		cmgr.sendRequest(var_2_0, actions.getCorpsInfo, 0, arg_2_0.corpsType)
	end
end

function var_0_6.onCreateCorps(arg_4_0)
	local function var_4_0(arg_5_0)
		arg_4_0:refresh()
	end

	local function var_4_1()
		if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
			kfcmgr.sendRequest(var_4_0, actions.createCorps, arg_4_0.info.cityId, arg_4_0.corpsType)
		else
			cmgr.sendRequest(var_4_0, actions.createCorps, 0, arg_4_0.corpsType)
		end
	end

	if arg_4_0.createGold and arg_4_0.createGold > 0 then
		messageBox.showChargeWin("", language.get(215624, arg_4_0.createGold), "buyForceCorps", var_4_1)
	else
		var_4_1()
	end
end

function var_0_6.onAddPhantom(arg_7_0, arg_7_1, arg_7_2)
	local function var_7_0(arg_8_0)
		smgr.showProgramText("+" .. arg_7_0.addPhantomNum, colorTips.green, arg_7_2)
		arg_7_0:refresh()
	end

	local function var_7_1()
		local var_9_0 = arg_7_0.info.generals[arg_7_1]

		if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
			kfcmgr.sendRequest(var_7_0, actions.corpsAddPhantom, arg_7_0.info.corpsId, var_9_0.generalId, arg_7_0.addPhantomNum)
		else
			cmgr.sendRequest(var_7_0, actions.corpsAddPhantom, arg_7_0.info.corpsId, var_9_0.generalId, arg_7_0.addPhantomNum)
		end
	end

	if arg_7_0.info.needCost then
		messageBox.showChargeWin("", language.get(136222), "jiebingGold", var_7_1)
	else
		var_7_1()
	end
end

function var_0_6.onGetCandidate(arg_10_0)
	local function var_10_0(arg_11_0)
		local var_11_0 = arg_11_0.data or arg_11_0.action.data

		arg_10_0.view.widgets.bg_list:setVisible(true)
		arg_10_0:createCandidateList(var_11_0.candidates)
	end

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		kfcmgr.sendRequest(var_10_0, actions.corpsGetCandidate)
	else
		cmgr.sendRequest(var_10_0, actions.corpsGetCandidate)
	end
end

function var_0_6.onTransferCorps(arg_12_0, arg_12_1)
	local function var_12_0(arg_13_0)
		arg_12_0.view.widgets.bg_list:setVisible(false)
		arg_12_0:refresh()
	end

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		kfcmgr.sendRequest(var_12_0, actions.transferCorps, arg_12_1)
	else
		cmgr.sendRequest(var_12_0, actions.transferCorps, arg_12_1)
	end
end

function var_0_6.onCancelTransferCorps(arg_14_0)
	local function var_14_0(arg_15_0)
		if arg_14_0.info.responseCd and arg_14_0.info.responseCd > 0 then
			arg_14_0.info.responseCd = 0

			arg_14_0.view.widgets.responseCd:stopAllActions()
			arg_14_0.view.widgets.maskLayer:setVisible(false)
			arg_14_0.view.widgets.state:setVisible(false)
			arg_14_0.view.widgets.btn_cancel:setVisible(false)
		end
	end

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		kfcmgr.sendRequest(var_14_0, actions.cancelTransferCorps)
	else
		cmgr.sendRequest(var_14_0, actions.cancelTransferCorps)
	end
end

function var_0_6.onGo(arg_16_0)
	local function var_16_0(arg_17_0)
		return
	end

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		kfcmgr.sendRequest(var_16_0, actions.corpsGo, arg_16_0.info.corpsId)
	else
		cmgr.sendRequest(var_16_0, actions.corpsGo, arg_16_0.info.corpsId)
	end
end

function var_0_6.onGetPhantomList(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0:createPhantomList(arg_18_1.phantomList)

	if not arg_18_2 then
		arg_18_0.view.widgets.bg_list2:setVisible(true)
	end

	arg_18_0:createOtherNationList(arg_18_1.slaveNationInfo)
end

function var_0_6.onKickPhantom(arg_19_0, arg_19_1, arg_19_2)
	local function var_19_0(arg_20_0)
		local var_20_0 = arg_20_0.data or arg_20_0.action.data

		arg_19_0:createPhantomList(var_20_0.phantomList)
		arg_19_0:createOtherNationList(var_20_0.slaveNationInfo)

		arg_19_0.info.phantomList = var_20_0.phantomList
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

	if type(var_21_1) == "number" then
		arg_21_0:removeFromParentAndCleanup(true)
	end

	if var_21_1 and type(var_21_1) ~= "number" then
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

	if var_21_3 then
		if var_21_3.lpPlayerName ~= nil then
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

			local var_21_7 = CCLabelTTF:create(language.get(136229, var_21_3.lpPlayerName, var_21_3.lpGeneralName), "Thonburi", 20)

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

		if var_21_3.phantomChange then
			arg_21_0:refresh()
		end
	end
end

function var_0_6.addGeneralIcon(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0.info.generals[arg_23_1]

	arg_23_0.view.widgets.generalPic:setDisplayFrame(CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", var_23_0.pic)):displayFrame())

	arg_23_0.selectGeneralIndex = arg_23_1
end

function var_0_6.createCandidateList(arg_24_0, arg_24_1)
	local function var_24_0(arg_25_0, arg_25_1)
		log.info("cell touched at : ", arg_25_1:getIdx())

		local var_25_0 = arg_24_1[arg_25_1:getIdx() + 1]

		arg_24_0:onTransferCorps(var_25_0.playerId)
	end

	local function var_24_1(arg_26_0, arg_26_1)
		return 105, 480
	end

	local function var_24_2(arg_27_0, arg_27_1)
		local var_27_0 = arg_27_0:dequeueCell()

		if var_27_0 then
			var_27_0:removeAllChildrenWithCleanup(true)
		else
			var_27_0 = CCTableViewCell:new()
		end

		local var_27_1 = arg_24_1[arg_27_1 + 1]

		if var_27_1 then
			local var_27_2 = {}

			uiutil.initWidgets(var_27_2, arg_24_0.layout_cell_candidate)
			var_27_0:addChild(var_27_2.widgets.bg)
			var_27_2.widgets.weaponLv:setString(language.get(136217, var_27_1.weaponLv))
			var_27_2.widgets.playerName:setString(var_27_1.playerName)
			var_27_2.widgets.icon:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerHead/playerHead_icon_%s.png", var_27_1.pic)):displayFrame())
		end

		return var_27_0
	end

	local function var_24_3()
		if arg_24_1 and #arg_24_1 > 0 then
			return #arg_24_1
		else
			return 0
		end
	end

	local var_24_4 = CCTableView:create(CCSizeMake(400, 540))

	var_24_4:setPosition(0, 10)
	var_24_4:setDirection(kCCScrollViewDirectionVertical)
	var_24_4:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_24_0.view.widgets.bg_list:addChild(var_24_4)

	if arg_24_0.candidateList then
		arg_24_0.candidateList:removeFromParentAndCleanup(true)

		arg_24_0.candidateList = nil
	end

	arg_24_0.candidateList = var_24_4

	var_24_4:registerScriptHandler(var_24_0, CCTableView.kTableCellTouched)
	var_24_4:registerScriptHandler(var_24_1, CCTableView.kTableCellSizeForIndex)
	var_24_4:registerScriptHandler(var_24_2, CCTableView.kTableCellSizeAtIndex)
	var_24_4:registerScriptHandler(var_24_3, CCTableView.kNumberOfCellsInTableView)
	var_24_4:reloadData()
end

function var_0_6.createGeneralList(arg_29_0)
	if arg_29_0.info and arg_29_0.info.generals then
		local var_29_0 = arg_29_0.info.generals

		local function var_29_1(arg_30_0, arg_30_1)
			log.info("cell touched at : ", arg_30_1:getIdx())

			arg_29_0.selectGeneralIndex = arg_30_1:getIdx() + 1

			arg_29_0:addGeneralIcon(arg_29_0.selectGeneralIndex)
			arg_29_0.view.widgets.bg_list:setVisible(false)

			if arg_29_0.candidateList then
				arg_29_0.candidateList:removeFromParentAndCleanup(true)

				arg_29_0.candidateList = nil
			end
		end

		local function var_29_2(arg_31_0, arg_31_1)
			return 105, 480
		end

		local function var_29_3(arg_32_0, arg_32_1)
			local var_32_0 = arg_32_0:dequeueCell()

			if var_32_0 then
				var_32_0:removeAllChildrenWithCleanup(true)
			else
				var_32_0 = CCTableViewCell:new()
			end

			local var_32_1 = var_29_0[arg_32_1 + 1]

			if var_32_1 then
				local var_32_2 = {}

				uiutil.initWidgets(var_32_2, arg_29_0.layout_cell_candidate)
				var_32_0:addChild(var_32_2.widgets.bg)
				var_32_2.widgets.weaponLv:setString(language.get(450001, var_32_1.lv))

				local var_32_3 = var_32_1.name or ""

				var_32_2.widgets.playerName:setString(var_32_3)
				var_32_2.widgets.icon:setDisplayFrame(CCSprite:create("res/ui/common/generalPic/generalPic_" .. var_32_1.pic .. ".jpg"):displayFrame())
			end

			return var_32_0
		end

		local function var_29_4()
			if var_29_0 and #var_29_0 > 0 then
				return #var_29_0
			else
				return 0
			end
		end

		local var_29_5 = CCTableView:create(CCSizeMake(400, 540))

		var_29_5:setPosition(0, 10)
		var_29_5:setDirection(kCCScrollViewDirectionVertical)
		var_29_5:setVerticalFillOrder(kCCTableViewFillTopDown)
		arg_29_0.view.widgets.bg_list:addChild(var_29_5)

		if arg_29_0.candidateList then
			arg_29_0.candidateList:removeFromParentAndCleanup(true)

			arg_29_0.candidateList = nil
		end

		arg_29_0.candidateList = var_29_5

		var_29_5:registerScriptHandler(var_29_1, CCTableView.kTableCellTouched)
		var_29_5:registerScriptHandler(var_29_2, CCTableView.kTableCellSizeForIndex)
		var_29_5:registerScriptHandler(var_29_3, CCTableView.kTableCellSizeAtIndex)
		var_29_5:registerScriptHandler(var_29_4, CCTableView.kNumberOfCellsInTableView)
		var_29_5:reloadData()
	end
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
				var_37_2.widgets.bg:setDisplayFrame(CCSprite:create("res/ui/corps/jttz_list_01.png"):displayFrame())
			else
				var_37_2.widgets.bg:setDisplayFrame(CCSprite:create("res/ui/corps/jttz_list_02.png"):displayFrame())
			end

			if arg_34_0.corpsType == 0 then
				var_37_2.widgets.playerName:setString(var_37_1.playerName)
				var_37_2.widgets.generalLv:setString(var_37_1.num)
				var_37_2.widgets.btn_kick:addHandleOfControlEvent(function()
					log.info("btn_kick")
					arg_34_0:onKickPhantom(var_37_1.playerId)
				end, CCControlEventTouchUpInside)
			else
				var_37_2.widgets.playerName:setString(var_37_1.generalName)

				local var_37_3 = colorQuality[var_37_1.quality] or colorQuality[1]

				var_37_2.widgets.playerName:setColor(var_37_3)
				var_37_2.widgets.generalLv:setString("Lv." .. var_37_1.generalLv)
				var_37_2.widgets.num:setString(var_37_1.num)
				var_37_2.widgets.btn_kick:setVisible(false)
			end
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

	var_34_4:setPosition(-5, 50)
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
				var_43_2.widgets.bg:setDisplayFrame(CCSprite:create("res/ui/corps/jttz_list_01.png"):displayFrame())
			else
				var_43_2.widgets.bg:setDisplayFrame(CCSprite:create("res/ui/corps/jttz_list_02.png"):displayFrame())
			end

			var_43_2.widgets.playerName:setString(var_43_1.serverName .. "." .. var_43_1.nationName)
			var_43_2.widgets.kingName:setString(var_43_1.kingName)
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

	var_40_4:setPosition(-5, 50)
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
	arg_47_0.view.widgets.startNode:setVisible(var_47_1)
	arg_47_0.view.widgets.btn_go:setVisible(var_47_1)
	arg_47_0.view.widgets.btn_create:setVisible(not var_47_1)
	arg_47_0.view.widgets.maskLayer:setVisible(false)
	arg_47_0.view.widgets.state:setOpacity(255)
	arg_47_0.view.widgets.state:stopAllActions()
	arg_47_0.view.widgets.state:setVisible(false)
	arg_47_0.view.widgets.btn_cancel:setVisible(false)
	arg_47_0.view.widgets.swcjTips:setVisible(not var_47_1)

	if var_47_1 then
		arg_47_0.view.widgets.corpsUnit:removeAllChildrenWithCleanup(true)
		arg_47_0.view.widgets.hasPhantomNum:setString(language.get(136213, arg_47_1.hasPhantomNum))

		if not arg_47_0.selectGeneralIndex then
			arg_47_0:addGeneralIcon(1)
		end

		arg_47_0.view.widgets.donationCd:stopAllActions()

		if arg_47_1.donationCd > 0 then
			local var_47_2 = CCArray:create()

			var_47_2:addObject(CCCallFunc:create(function()
				if arg_47_1.donationCd <= 0 then
					arg_47_0:removeFromParentAndCleanup(true)
				else
					arg_47_0.view.widgets.donationCd:setString(language.get(131062, tool.getFormatTime(arg_47_1.donationCd)))
				end
			end))
			var_47_2:addObject(CCDelayTime:create(1))

			local var_47_3 = CCSequence:create(var_47_2)

			arg_47_0.view.widgets.donationCd:runAction(CCRepeatForever:create(var_47_3))
		end

		arg_47_0.view.widgets.responseCd:stopAllActions()

		if arg_47_1.responseCd > 0 then
			arg_47_0.view.widgets.maskLayer:setVisible(true)
			arg_47_0.view.widgets.state:setDisplayFrame(CCSprite:create("res/ui/corps/jt_word_dfqrzqsh.png"):displayFrame())
			arg_47_0.view.widgets.state:setVisible(true)
			arg_47_0.view.widgets.btn_cancel:setVisible(true)

			local var_47_4 = CCArray:create()

			var_47_4:addObject(CCCallFunc:create(function()
				if arg_47_1.responseCd <= 0 then
					-- block empty
				else
					arg_47_0.view.widgets.responseCd:setString(tool.getFormatTime(arg_47_1.responseCd))
				end
			end))
			var_47_4:addObject(CCDelayTime:create(1))

			local var_47_5 = CCSequence:create(var_47_4)

			arg_47_0.view.widgets.responseCd:runAction(CCRepeatForever:create(var_47_5))
		end

		if arg_47_0.msg == nil and arg_47_1.lpPlayerName ~= nil then
			local var_47_6 = CCLabelTTF:create(language.get(136229, arg_47_1.lpPlayerName, arg_47_1.lpGeneralName), "Thonburi", 22)

			var_47_6:setAnchorPoint(ccp(0, 0.5))
			var_47_6:setPosition(56, 14)
			var_47_6:setColor(var_0_0)
			arg_47_0.view.widgets.layer_msg:addChild(var_47_6)

			local var_47_7 = CCArray:create()

			var_47_7:addObject(CCMoveTo:create(0.3, ccp(56, 34)))

			local var_47_8 = CCSequence:create(var_47_7)

			var_47_6:runAction(var_47_8)

			arg_47_0.msg = var_47_6
		end

		if arg_47_0.corpsType == 0 then
			arg_47_0.view.widgets.btn_go:setEnabled(var_47_0)

			if arg_47_1.slavePhantomNum and arg_47_1.slavePhantomNum > 0 then
				arg_47_0.view.widgets.otherNationBtn:setVisible(not arg_47_0.isOther)
				arg_47_0.view.widgets.myNationBtn:setVisible(arg_47_0.isOther)
			end

			arg_47_0.view.widgets.btn_transfer:setEnabled(var_47_0)
			arg_47_0.view.widgets.selfDonationNum:setString(language.get(390478, arg_47_1.selfDonationNum, arg_47_1.phantomNum))

			if arg_47_0.isOther then
				arg_47_0:onGetPhantomList(arg_47_0.info, true)
			else
				arg_47_0:onGetPhantomList(arg_47_0.info, false)
			end
		else
			arg_47_0.view.widgets.selfDonationNum:setString(language.get(390478, arg_47_1.donationNum, arg_47_1.upperLimit))
			arg_47_0:onGetPhantomList(arg_47_0.info, false)
		end
	else
		tool.spriteToGray(arg_47_0.view.widgets.corpsUnit)

		if arg_47_0.corpsType == 0 then
			arg_47_0.createGold = arg_47_1.createGold

			if arg_47_0.createGold and arg_47_0.createGold > 0 then
				arg_47_0.view.widgets.buyCreateGold:setVisible(true)
				arg_47_0.view.widgets.createInfo:setString(arg_47_0.createGold)
			else
				arg_47_0.view.widgets.buyCreateGold:setVisible(false)
				arg_47_0.view.widgets.createInfo:setString(language.get(215623))
			end
		else
			arg_47_0.view.widgets.buyCreateGold:setVisible(false)
			arg_47_0.view.widgets.createInfo:setString(language.get(215623))
		end
	end

	local var_47_9 = arg_47_0.corpsType == 0 and "jttz_title_" .. arg_47_1.corpsLevel or "jttz_title_grjt"

	if var_47_9 then
		arg_47_0.view.widgets.title:setDisplayFrame(CCSprite:create("res/ui/corps/" .. var_47_9 .. ".png"):displayFrame())
	end

	if arg_47_0.corpsType == 0 then
		arg_47_0.view.widgets.btn_transfer:setVisible(var_47_1)
		arg_47_0.view.widgets.playerName:setString(arg_47_1.playerName)
		arg_47_0.view.widgets.donationNum:setString(language.get(136211, arg_47_1.donationNum, arg_47_1.lowerLimit))
		arg_47_0.view.widgets.otherNationNum:setString(language.get(136234, arg_47_1.slavePhantomNum or 0))
	else
		arg_47_0.view.widgets.btn_transfer:setVisible(false)
		arg_47_0.view.widgets.fsBg:setVisible(false)
		arg_47_0.view.widgets.jttz_clock_di:setPosition(ccp(-365, 95))
		arg_47_0.view.widgets.jttz_clock:setPosition(ccp(-422, 95))
		arg_47_0.view.widgets.donationCd:setPosition(ccp(-330, 95))
		arg_47_0.view.widgets.btn_go:setPosition(ccp(-178, -210))
		arg_47_0.view.widgets.playerName:setString(user.player.name)
		arg_47_0.view.widgets.donationNum:setString(language.get(136211, arg_47_1.donationNum, arg_47_1.upperLimit))
	end
end

function var_0_6.ctor(arg_50_0, arg_50_1, arg_50_2, arg_50_3)
	log.info("@@ 军团")

	arg_50_0.view = {}

	uiutil.initWidgets(arg_50_0.view, arg_50_0.layout)
	swallowTouch(arg_50_0)

	arg_50_0.corpsType = arg_50_3
	arg_50_0.addPhantomNum = 1

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

		if arg_50_0.corpsType == 0 then
			arg_50_0:onGo()
		elseif arg_50_0.info and arg_50_0.info.donationNum and (arg_50_0.info.donationNum == 0 or arg_50_0.info.upperLimit and arg_50_0.info.donationNum == arg_50_0.info.upperLimit) then
			arg_50_0:onGo()
		else
			messageBox.confirm(language.get(215627), function()
				arg_50_0:onGo()
			end)
		end
	end, CCControlEventTouchUpInside)
	arg_50_0.view.widgets.btn_cancel:addHandleOfControlEvent(function()
		log.info("btn_cancel")
		arg_50_0:onCancelTransferCorps()
	end, CCControlEventTouchUpInside)
	arg_50_0.view.widgets.view_msg:setTouchEnabled(false)
	arg_50_0.view.widgets.myNationBtn:addHandleOfControlEvent(function()
		arg_50_0:onGetPhantomList(arg_50_0.info, false)

		arg_50_0.isOther = false

		arg_50_0.view.widgets.myNationBtn:setVisible(false)
		arg_50_0.view.widgets.otherNationBtn:setVisible(true)
		arg_50_0.view.widgets.bg_list3:setVisible(false)
	end, CCControlEventTouchUpInside)
	arg_50_0.view.widgets.otherNationBtn:addHandleOfControlEvent(function()
		arg_50_0:onGetPhantomList(arg_50_0.info, true)

		arg_50_0.isOther = true

		arg_50_0.view.widgets.myNationBtn:setVisible(true)
		arg_50_0.view.widgets.otherNationBtn:setVisible(false)
		arg_50_0.view.widgets.bg_list2:setVisible(false)
		arg_50_0.view.widgets.bg_list3:setVisible(true)
	end, CCControlEventTouchUpInside)
	arg_50_0.view.widgets.generalPicBtn:addHandleOfControlEvent(function()
		log.info("generalPicBtn")
		arg_50_0.view.widgets.bg_list:setVisible(true)
		arg_50_0:createGeneralList()
	end, CCControlEventTouchUpInside)
	arg_50_0.view.widgets.btn_addPhantom:addHandleOfControlEvent(function()
		log.info("btn_addPhantom")

		arg_50_0.currentTime = 0
		arg_50_0.addPhantomNum = 1
		arg_50_0.touchAddPhantom = false

		if arg_50_0.info.exist then
			local var_61_0, var_61_1 = tool.getPositionInScreen(arg_50_0.view.widgets.selfDonationNum)

			arg_50_0:onAddPhantom(arg_50_0.selectGeneralIndex, ccp(var_61_0, var_61_1))
		end
	end, CCControlEventTouchUpInside)
	arg_50_0.view.widgets.btn_addPhantom:addHandleOfControlEvent(function()
		log.info("btn_addPhantom")

		arg_50_0.currentTime = 0
		arg_50_0.addPhantomNum = 1
		arg_50_0.touchAddPhantom = false
	end, CCControlEventTouchUpOutside)
	arg_50_0.view.widgets.btn_addPhantom:addHandleOfControlEvent(function()
		log.info("btn_addPhantom")

		if arg_50_0.info.exist then
			arg_50_0.currentTime = 0
			arg_50_0.touchAddPhantom = true
		end
	end, CCControlEventTouchDown)
	arg_50_0:showPanel(arg_50_2)
end

function var_0_6.onEnter(arg_64_0)
	arg_64_0.currentTime = 0
	arg_64_0.addPhantomNum = 1
	arg_64_0.touchAddPhantom = false
	arg_64_0.isOther = false
	arg_64_0.updateRef = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_64_0, arg_64_0.update), 0.5, false)
	arg_64_0.handlerPushCorpsActionRef = handler(arg_64_0, arg_64_0.handlerPushCorpsAction)

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		kfcmgr.registerResponseHandler(actions.pushCorps, arg_64_0.handlerPushCorpsActionRef)
	else
		cmgr.registerResponseHandler(actions.pushCorps, arg_64_0.handlerPushCorpsActionRef)
	end
end

function var_0_6.onExit(arg_65_0)
	if arg_65_0.updateRef then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_65_0.updateRef)
	end

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		kfcmgr.unregisterResponseHandler(actions.pushCorps, arg_65_0.handlerPushCorpsActionRef)
	else
		cmgr.unregisterResponseHandler(actions.pushCorps, arg_65_0.handlerPushCorpsActionRef)
	end
end

function var_0_6.update(arg_66_0, arg_66_1)
	if arg_66_0.info then
		if arg_66_0.info.donationCd and arg_66_0.info.donationCd > 0 then
			arg_66_0.info.donationCd = arg_66_0.info.donationCd - 1000 * arg_66_1
		else
			arg_66_0.info.donationCd = 0
		end

		if arg_66_0.info.responseCd and arg_66_0.info.responseCd > 0 then
			arg_66_0.info.responseCd = arg_66_0.info.responseCd - 1000 * arg_66_1
		else
			arg_66_0.info.responseCd = 0
		end

		arg_66_0.currentTime = arg_66_0.currentTime + arg_66_1

		if arg_66_0.info.exist and arg_66_0.touchAddPhantom and arg_66_0.currentTime > 1.5 then
			arg_66_0.addPhantomNum = 10

			local var_66_0, var_66_1 = tool.getPositionInScreen(arg_66_0.view.widgets.selfDonationNum)

			arg_66_0:onAddPhantom(arg_66_0.selectGeneralIndex, ccp(var_66_0, var_66_1))
		end
	end
end

return var_0_6
