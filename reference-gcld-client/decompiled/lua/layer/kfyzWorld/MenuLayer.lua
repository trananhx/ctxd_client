local var_0_0 = require("res/native/offset").get("layer.kfyzWorld.menuLayer")
local var_0_1 = tool.hexToRgb("#ECDEA7")
local var_0_2 = {
	{
		textId = 390512,
		cityId = 123
	},
	{
		textId = 390513,
		cityId = 19
	},
	{
		textId = 390514,
		cityId = 207
	}
}
local var_0_3 = {
	[8025] = 4,
	[8023] = 2,
	[8024] = 3,
	[8037] = 3,
	[8039] = 4,
	[8036] = 2
}
local var_0_4 = {}
local var_0_5 = class("KfMenuLayer", function()
	return createBaseLayer()
end)
local var_0_6 = {}

if conf.language == "ina" then
	var_0_6.taskoffset = 0
	var_0_6.zjoffset = 110
elseif conf.language == "vie" then
	var_0_6.taskoffset = 0
	var_0_6.zjoffset = 110
elseif conf.language == "tha" then
	var_0_6.taskoffset = 0
	var_0_6.zjoffset = 110
else
	var_0_6.taskoffset = 32
	var_0_6.zjoffset = 142
end

var_0_5.layout = {
	y = 0,
	name = "panel",
	type = "layer",
	x = 0,
	children = {
		{
			name = "node0",
			type = "node",
			x = 56 + platform.getSafeDistance(),
			y = visibleSize.height - 130,
			children = {
				{
					type = "sprite",
					name = "icon_podi",
					x = 90,
					visible = false,
					y = 30,
					scale = 0.56,
					pic = {
						path = "res/ui/kfyz/junku/pdl.jpg"
					}
				},
				{
					w = 87,
					name = "btn_task",
					h = 88,
					type = "button",
					y = 0,
					x = 0,
					normal = {
						path = "res/ui/task/task_btn_view_a.png"
					},
					touched = {
						path = "res/ui/task/task_btn_view_c.png"
					}
				},
				{
					y = 0,
					name = "icon_task",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/task/nation_task.png"
					}
				},
				{
					y = 3,
					name = "title_task",
					type = "sprite",
					x = var_0_6.taskoffset,
					pic = {
						path = "res/ui/kfyz/task_dyyz.png"
					}
				},
				{
					w = 87,
					name = "btn_zhanjiang",
					h = 88,
					type = "button",
					y = 0,
					x = 110,
					normal = {
						path = "res/ui/task/task_btn_view_a.png"
					},
					touched = {
						path = "res/ui/task/task_btn_view_c.png"
					}
				},
				{
					y = 0,
					name = "icon_zhanjiang",
					type = "sprite",
					x = 110,
					pic = {
						path = "res/ui/task/nation_task.png"
					}
				},
				{
					y = 3,
					name = "title_zhanjiang",
					type = "sprite",
					x = var_0_6.zjoffset,
					pic = {
						path = "res/ui/kfyz/yzdy_task_word_zjpm.png"
					}
				},
				{
					y = -60,
					name = "btn_fangshouJunzi",
					h = 78,
					type = "button",
					w = 134,
					visible = false,
					x = 240,
					normal = {
						path = "res/ui/kfyz/junzi/fsjz_icon.png"
					},
					touched = {
						path = "res/ui/kfyz/junzi/fsjz_icon.png"
					}
				}
			}
		},
		{
			name = "node1",
			type = "node",
			x = visibleSize.width - 50 - platform.getSafeDistance(),
			y = visibleSize.height - 180,
			children = {
				{
					type = "sprite",
					name = "light1",
					y = 0,
					visible = false,
					x = 0,
					pic = {
						path = "res/ui/world/nationChallenges/task_challenge_btn_lig.png"
					}
				},
				{
					w = 75,
					name = "btn_task1",
					h = 75,
					type = "button",
					y = 0,
					x = 0,
					normal = {
						path = "res/ui/world/nationChallenges/task_challenge_btn_view.png"
					},
					touched = {
						path = "res/ui/world/nationChallenges/task_challenge_btn_view.png"
					}
				},
				{
					x = 0,
					name = "progress1",
					y = 0,
					type = "progressbar",
					progressType = kCCProgressTimerTypeRadial,
					pic = {
						path = "res/ui/world/nationChallenges/task_challenge_btn_con.png"
					}
				},
				{
					type = "sprite",
					name = "complete1",
					y = 0,
					visible = false,
					x = 0,
					pic = {
						path = "res/ui/world/nationChallenges/task_challenge_btn_con_2.png"
					}
				},
				{
					x = 0,
					name = "icon_task1",
					y = -5,
					type = "sprite",
					scale = 0.6,
					pic = {
						path = "res/ui/kfyz/zhaoling/yzzl_btn_sd.png"
					}
				},
				{
					y = -250,
					name = "myJunzi",
					visible = false,
					type = "sprite",
					x = -40,
					pic = {
						path = "res/ui/kfyz/junzi/wdzy_bg.png"
					},
					children = {
						{
							y = 201,
							x = 83,
							type = "sprite",
							pic = {
								path = "res/ui/kfyz/junzi/wdzy_title.png"
							}
						},
						{
							y = 159,
							type = "sprite",
							x = 84,
							pic = {
								path = "res/ui/kfyz/junzi/wdzy_icon_bg.png"
							},
							children = {
								{
									y = 22,
									name = "liangIcon",
									type = "sprite",
									x = 22,
									pic = {
										frame = true,
										path = "res_icon_3.png"
									}
								},
								{
									fontSize = 22,
									style = "label_green_24",
									name = "liangNum",
									type = "label",
									text = "0",
									x = 80,
									y = 22,
									color = ccc3(255, 0, 0)
								}
							}
						},
						{
							y = 115,
							type = "sprite",
							x = 84,
							pic = {
								path = "res/ui/kfyz/junzi/wdzy_icon_bg.png"
							},
							children = {
								{
									y = 22,
									name = "phantomIcon",
									type = "sprite",
									x = 22,
									pic = {
										path = "res/ui/kfyz/junzi/wdzy_icon_hy.png"
									}
								},
								{
									fontSize = 22,
									style = "label_green_24",
									name = "phantomNum",
									type = "label",
									text = "0",
									x = 80,
									y = 22,
									color = ccc3(255, 0, 0)
								}
							}
						},
						{
							y = 71,
							type = "sprite",
							x = 84,
							pic = {
								path = "res/ui/kfyz/junzi/wdzy_icon_bg.png"
							},
							children = {
								{
									y = 22,
									name = "phantomtjIcon",
									type = "sprite",
									x = 22,
									pic = {
										path = "res/ui/kfyz/junzi/wdzy_icon_hytj.png"
									}
								},
								{
									fontSize = 22,
									style = "label_green_24",
									name = "phantomtjNum",
									type = "label",
									text = "0",
									x = 80,
									y = 22,
									color = ccc3(255, 0, 0)
								}
							}
						},
						{
							y = 27,
							type = "sprite",
							x = 84,
							pic = {
								path = "res/ui/kfyz/junzi/wdzy_icon_bg.png"
							},
							children = {
								{
									y = 22,
									name = "phantomdtIcon",
									type = "sprite",
									x = 22,
									pic = {
										path = "res/ui/kfyz/junzi/wdzy_icon_hydt.png"
									}
								},
								{
									fontSize = 22,
									style = "label_green_24",
									name = "phantomdtNum",
									type = "label",
									text = "0",
									x = 80,
									y = 22,
									color = ccc3(255, 0, 0)
								}
							}
						}
					}
				}
			}
		},
		{
			name = "node2",
			type = "node",
			x = visibleSize.width - 50 - platform.getSafeDistance(),
			y = visibleSize.height - 265,
			children = {
				{
					type = "sprite",
					name = "light2",
					y = 0,
					visible = false,
					x = 0,
					pic = {
						path = "res/ui/world/nationChallenges/task_challenge_btn_lig.png"
					}
				},
				{
					w = 75,
					name = "btn_task2",
					h = 75,
					type = "button",
					y = 0,
					x = 0,
					normal = {
						path = "res/ui/world/nationChallenges/task_challenge_btn_view.png"
					},
					touched = {
						path = "res/ui/world/nationChallenges/task_challenge_btn_view.png"
					}
				},
				{
					x = 0,
					name = "progress2",
					y = 0,
					type = "progressbar",
					progressType = kCCProgressTimerTypeRadial,
					pic = {
						path = "res/ui/world/nationChallenges/task_challenge_btn_con.png"
					}
				},
				{
					type = "sprite",
					name = "complete2",
					y = 0,
					visible = false,
					x = 0,
					pic = {
						path = "res/ui/world/nationChallenges/task_challenge_btn_con_2.png"
					}
				},
				{
					x = 0,
					name = "icon_task2",
					y = -5,
					type = "sprite",
					scale = 0.6,
					pic = {
						path = "res/ui/kfyz/zhaoling/yzzl_btn_zz.png"
					}
				}
			}
		},
		{
			y = 0,
			name = "node_menu",
			type = "node",
			x = visibleSize.width,
			children = {
				{
					y = 0,
					type = "sprite",
					x = 17,
					anchorPoint = ccp(0.5, 0),
					pic = {
						path = "res/ui/mainUI/footer_r_open_view.png"
					}
				},
				{
					y = 0,
					name = "bg",
					type = "sprite",
					x = 0,
					anchorPoint = ccp(1, 0),
					pic = {
						path = "res/ui/mainUI/footer_r_view.png"
					}
				},
				{
					w = 79,
					name = "btn_mainCity",
					h = 82,
					type = "button",
					y = 49,
					x = -48.5,
					normal = {
						path = "res/ui/kfworld/kfgz_view_zc_btn_a.png"
					},
					touched = {
						path = "res/ui/kfworld/kfgz_view_zc_btn_c.png"
					}
				},
				{
					name = "btn_general",
					type = "button",
					y = 45,
					x = -363,
					normal = {
						path = "res/ui/mainUI/navi_l_wj_a.png"
					},
					touched = {
						path = "res/ui/mainUI/navi_l_wj_click.png"
					},
					w = var_0_0.btnWidth or 80,
					h = var_0_0.btnHeight or 90
				},
				{
					name = "btn_armyBase",
					type = "button",
					y = 45,
					x = -158,
					normal = {
						path = "res/ui/kfyz/navi_l_jk_a.png"
					},
					touched = {
						path = "res/ui/kfyz/navi_l_jk_click.png"
					},
					w = var_0_0.btnWidth or 80,
					h = var_0_0.btnHeight or 90
				},
				{
					name = "btn_resource",
					type = "button",
					y = 45,
					x = -258,
					normal = {
						path = "res/ui/mainUI/navi_l_zy_a.png"
					},
					touched = {
						path = "res/ui/mainUI/navi_l_zy_click.png"
					},
					w = var_0_0.btnWidth or 80,
					h = var_0_0.btnHeight or 90
				}
			}
		},
		{
			type = "node",
			name = "node_army",
			y = 0,
			visible = false,
			x = 0,
			children = {
				{
					name = "btn_back",
					h = 50,
					type = "button",
					w = 104,
					scale = 1.2,
					normal = {
						frame = true,
						path = "btn_back_a.png"
					},
					touched = {
						frame = true,
						path = "btn_back_c.png"
					},
					x = visibleSize.width - 10,
					y = visibleSize.height - 10,
					anchorPoint = ccp(1, 1)
				},
				{
					x = 0,
					name = "btn_force1",
					h = 51,
					type = "button",
					w = 123,
					scale = 1.2,
					normal = {
						path = "res/ui/kfyz/dima.png"
					},
					touched = {
						path = "res/ui/kfyz/dima1.png"
					},
					y = visibleSize.height / 2,
					anchorPoint = ccp(0, 0.5)
				},
				{
					name = "btn_force2",
					h = 51,
					type = "button",
					w = 123,
					scale = 1.2,
					normal = {
						path = "res/ui/kfyz/dima.png"
					},
					touched = {
						path = "res/ui/kfyz/dima1.png"
					},
					x = visibleSize.width,
					y = visibleSize.height / 2,
					anchorPoint = ccp(0, 0.5)
				},
				{
					fontSize = 30,
					name = "name_force1",
					type = "label",
					style = "label_warlock",
					x = 67,
					y = visibleSize.height / 2 + 5,
					color = var_0_1
				},
				{
					fontSize = 30,
					name = "name_force2",
					type = "label",
					style = "label_warlock",
					x = visibleSize.width - 67,
					y = visibleSize.height / 2 + 5,
					color = var_0_1
				}
			}
		},
		{
			name = "buluo1",
			visible = false,
			type = "node",
			x = visibleSize.width - 50 - platform.getSafeDistance(),
			y = visibleSize.height - 170,
			children = {
				{
					w = 75,
					name = "btn_buluo1",
					h = 75,
					type = "button",
					y = 0,
					x = 0,
					normal = {
						path = "res/ui/world/nationChallenges/task_challenge_btn_view.png"
					},
					touched = {
						path = "res/ui/world/nationChallenges/task_challenge_btn_view.png"
					}
				},
				{
					y = 0,
					name = "buluoIcon1",
					z = 1000,
					type = "sprite",
					x = 0,
					pic = {
						frame = true,
						path = "move_por_move_view.png"
					},
					children = {
						{
							y = 34,
							name = "buluoGeneral1",
							scale = 0.7,
							type = "sprite",
							x = 34,
							pic = {
								path = "res/ui/common/fightPic/fightPic_jushimalv.png"
							}
						},
						{
							fontSize = 18,
							style = "label_green_24",
							name = "buluoWord1",
							type = "label",
							x = 34,
							y = 10,
							text = language.get(1449922, 0),
							color = ccc3(0, 255, 0)
						},
						{
							fontSize = 18,
							name = "buluoName1",
							visible = false,
							type = "label",
							style = "label_green_24",
							y = 30,
							x = 34,
							text = language.get(226040, language.get(136573)),
							color = colorQuality[6]
						},
						{
							y = 0,
							name = "buluoTime1",
							x = 0,
							type = "node"
						}
					}
				}
			}
		},
		{
			name = "buluo2",
			visible = false,
			type = "node",
			x = visibleSize.width - 50 - platform.getSafeDistance(),
			y = visibleSize.height - 255,
			children = {
				{
					w = 75,
					name = "btn_buluo2",
					h = 75,
					type = "button",
					y = 0,
					x = 0,
					normal = {
						path = "res/ui/world/nationChallenges/task_challenge_btn_view.png"
					},
					touched = {
						path = "res/ui/world/nationChallenges/task_challenge_btn_view.png"
					}
				},
				{
					y = 0,
					name = "buluoIcon2",
					z = 1000,
					type = "sprite",
					x = 0,
					pic = {
						frame = true,
						path = "move_por_move_view.png"
					},
					children = {
						{
							y = 34,
							name = "buluoGeneral2",
							scale = 0.7,
							type = "sprite",
							x = 34,
							pic = {
								path = "res/ui/common/fightPic/fightPic_beimihu.png"
							}
						},
						{
							fontSize = 18,
							style = "label_green_24",
							name = "buluoWord2",
							type = "label",
							x = 34,
							y = 10,
							text = language.get(1449922, 0),
							color = ccc3(0, 255, 0)
						},
						{
							fontSize = 18,
							name = "buluoName2",
							visible = false,
							type = "label",
							style = "label_green_24",
							y = 30,
							x = 34,
							text = language.get(226040, language.get(136574)),
							color = colorQuality[6]
						},
						{
							y = 0,
							name = "buluoTime2",
							x = 0,
							type = "node"
						}
					}
				}
			}
		},
		{
			name = "buluo3",
			visible = false,
			type = "node",
			x = visibleSize.width - 50 - platform.getSafeDistance(),
			y = visibleSize.height - 340,
			children = {
				{
					w = 75,
					name = "btn_buluo3",
					h = 75,
					type = "button",
					y = 0,
					x = 0,
					normal = {
						path = "res/ui/world/nationChallenges/task_challenge_btn_view.png"
					},
					touched = {
						path = "res/ui/world/nationChallenges/task_challenge_btn_view.png"
					}
				},
				{
					y = 0,
					name = "buluoIcon3",
					z = 1000,
					type = "sprite",
					x = 0,
					pic = {
						frame = true,
						path = "move_por_move_view.png"
					},
					children = {
						{
							y = 34,
							name = "buluoGeneral3",
							scale = 0.7,
							type = "sprite",
							x = 34,
							pic = {
								path = "res/ui/common/fightPic/fightPic_suworulu.png"
							}
						},
						{
							fontSize = 18,
							style = "label_green_24",
							name = "buluoWord3",
							type = "label",
							x = 34,
							y = 10,
							text = language.get(1449922, 0),
							color = ccc3(0, 255, 0)
						},
						{
							fontSize = 18,
							name = "buluoName3",
							visible = false,
							type = "label",
							style = "label_green_24",
							y = 30,
							x = 34,
							text = language.get(226040, language.get(136575)),
							color = colorQuality[6]
						},
						{
							y = 0,
							name = "buluoTime3",
							x = 0,
							type = "node"
						}
					}
				}
			}
		},
		{
			name = "buluo4",
			visible = false,
			type = "node",
			x = visibleSize.width - 50 - platform.getSafeDistance(),
			y = visibleSize.height - 425,
			children = {
				{
					w = 75,
					name = "btn_buluo4",
					h = 75,
					type = "button",
					y = 0,
					x = 0,
					normal = {
						path = "res/ui/world/nationChallenges/task_challenge_btn_view.png"
					},
					touched = {
						path = "res/ui/world/nationChallenges/task_challenge_btn_view.png"
					}
				},
				{
					y = 0,
					name = "buluoIcon4",
					z = 1000,
					type = "sprite",
					x = 0,
					pic = {
						frame = true,
						path = "move_por_move_view.png"
					},
					children = {
						{
							y = 34,
							name = "buluoGeneral4",
							scale = 0.7,
							type = "sprite",
							x = 34,
							pic = {
								path = "res/ui/common/fightPic/fightPic_xuzuozhinan.png"
							}
						},
						{
							fontSize = 18,
							style = "label_green_24",
							name = "buluoWord4",
							type = "label",
							x = 34,
							y = 10,
							text = language.get(1449922, 0),
							color = ccc3(0, 255, 0)
						},
						{
							fontSize = 18,
							style = "label_green_24",
							name = "buluoName4",
							type = "label",
							y = 30,
							x = 34,
							color = colorForce[101]
						},
						{
							y = 0,
							name = "buluoTime4",
							x = 0,
							type = "node"
						}
					}
				}
			}
		},
		{
			name = "buluo5",
			visible = false,
			type = "node",
			x = visibleSize.width - 50 - platform.getSafeDistance(),
			y = visibleSize.height - 510,
			children = {
				{
					w = 75,
					name = "btn_buluo5",
					h = 75,
					type = "button",
					y = 0,
					x = 0,
					normal = {
						path = "res/ui/world/nationChallenges/task_challenge_btn_view.png"
					},
					touched = {
						path = "res/ui/world/nationChallenges/task_challenge_btn_view.png"
					}
				},
				{
					y = 0,
					name = "buluoIcon5",
					z = 1000,
					type = "sprite",
					x = 0,
					pic = {
						frame = true,
						path = "move_por_move_view.png"
					},
					children = {
						{
							y = 41,
							name = "buluoGeneral5",
							scale = 1.2,
							type = "sprite",
							x = 35,
							pic = {
								path = "res/ui/nation/buildNation/dongying/djgl_world_icon_city.png"
							}
						},
						{
							scale = 1.2,
							y = 36,
							type = "sprite",
							x = 36,
							pic = {
								path = "res/ui/world/nationChallenges/task_challenge_btn_con.png"
							}
						},
						{
							scale = 1.2,
							name = "buluoBar5",
							x = 36,
							type = "progressbar",
							y = 36,
							progressType = kCCProgressTimerTypeRadial,
							pic = {
								path = "res/ui/world/nationChallenges/task_challenge_btn_con_3.png"
							}
						},
						{
							fontSize = 18,
							style = "label_green_24",
							name = "buluoInfo5",
							type = "label",
							x = 34,
							y = 10,
							text = language.get(136829),
							color = ccc3(255, 255, 255)
						},
						{
							fontSize = 24,
							style = "label_green_24",
							name = "buluoState5",
							type = "label",
							y = 36,
							x = 36
						}
					}
				}
			}
		}
	}
}

function var_0_5.handlerGetSIndivTaskAction(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.data.indiv

	for iter_2_0 = 1, 2 do
		arg_2_0.view.widgets["progress" .. iter_2_0]:setPercentage(100 * var_2_0[iter_2_0].value / var_2_0[iter_2_0].goal)

		local var_2_1 = var_2_0[iter_2_0].isFinish and not var_2_0[iter_2_0].isReward

		arg_2_0.view.widgets["complete" .. iter_2_0]:setVisible(var_2_0[iter_2_0].isFinish)

		local var_2_2 = arg_2_0.view.widgets["light" .. iter_2_0]

		var_2_2:stopAllActions()
		var_2_2:setVisible(var_2_1)

		if var_2_1 then
			var_2_2:setOpacity(0)

			local var_2_3 = CCArray:create()

			var_2_3:addObject(CCFadeIn:create(0.3))
			var_2_3:addObject(CCFadeOut:create(0.7))

			local var_2_4 = CCSequence:create(var_2_3)
			local var_2_5 = CCRepeatForever:create(tolua.cast(var_2_4, "CCActionInterval"))

			var_2_2:runAction(var_2_5)
		end
	end
end

function var_0_5.setResState(arg_3_0, arg_3_1)
	arg_3_0.view.widgets.myJunzi:setVisible(true)

	if arg_3_1.leftHbqNum and arg_3_1.openHbq then
		arg_3_0.view.widgets.phantomdtNum:setString(arg_3_1.leftHbqNum)
		arg_3_0.view.widgets.phantomdtIcon:setDisplayFrame(CCSprite:create("res/ui/kfyz/junzi/wdzy_icon_hbq.png"):displayFrame())

		if arg_3_1.leftHbqNum > 0 then
			arg_3_0.view.widgets.phantomdtNum:setColor(ccc3(0, 255, 0))
		else
			arg_3_0.view.widgets.phantomdtNum:setColor(ccc3(255, 0, 0))
		end
	end

	if arg_3_1.leftSoloNum and arg_3_1.openHbq ~= true then
		arg_3_0.view.widgets.phantomdtNum:setString(arg_3_1.leftSoloNum)

		if arg_3_1.leftSoloNum > 0 then
			arg_3_0.view.widgets.phantomdtNum:setColor(ccc3(0, 255, 0))
		else
			arg_3_0.view.widgets.phantomdtNum:setColor(ccc3(255, 0, 0))
		end
	end

	if arg_3_1.leftTujinNum then
		arg_3_0.view.widgets.phantomtjNum:setString(arg_3_1.leftTujinNum)

		if arg_3_1.leftTujinNum > 0 then
			arg_3_0.view.widgets.phantomtjNum:setColor(ccc3(0, 255, 0))
		else
			arg_3_0.view.widgets.phantomtjNum:setColor(ccc3(255, 0, 0))
		end
	end

	if arg_3_1.freeBuyPhantom then
		arg_3_0.view.widgets.phantomNum:setString(arg_3_1.freeBuyPhantom)

		if arg_3_1.freeBuyPhantom > 0 then
			arg_3_0.view.widgets.phantomNum:setColor(ccc3(0, 255, 0))
		else
			arg_3_0.view.widgets.phantomNum:setColor(ccc3(255, 0, 0))
		end
	end

	if arg_3_1.goodsFood then
		arg_3_0.view.widgets.liangNum:setString(tool.getFormatNum(arg_3_1.goodsFood))

		if arg_3_1.goodsFood > 0 then
			arg_3_0.view.widgets.liangNum:setColor(ccc3(0, 255, 0))
		else
			arg_3_0.view.widgets.liangNum:setColor(ccc3(255, 0, 0))
		end
	end
end

function var_0_5.setGoodsState(arg_4_0, arg_4_1)
	arg_4_0.goodsState = arg_4_1

	arg_4_0:setGoodsButton()
end

function var_0_5.setGoodsButton(arg_5_0)
	local function var_5_0(arg_6_0)
		if not arg_6_0 or tolua.isnull(arg_6_0) then
			return
		end

		local var_6_0 = CCArray:create()

		var_6_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
		var_6_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
		var_6_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
		var_6_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
		var_6_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
		var_6_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
		var_6_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
		var_6_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
		var_6_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
		var_6_0:addObject(CCDelayTime:create(0.4))

		local var_6_1 = CCSequence:create(var_6_0)

		arg_6_0:stopAllActions()
		arg_6_0:runAction(CCRepeatForever:create(var_6_1))
	end

	arg_5_0.view.widgets.btn_fangshouJunzi:stopAllActions()
	arg_5_0.view.widgets.btn_fangshouJunzi:setVisible(false)

	if arg_5_0.goodsState == 0 then
		arg_5_0.view.widgets.btn_fangshouJunzi:setVisible(true)
	elseif arg_5_0.goodsState == 1 then
		var_5_0(arg_5_0.view.widgets.btn_fangshouJunzi)
		arg_5_0.view.widgets.btn_fangshouJunzi:setVisible(true)
	end
end

function var_0_5.handlerGetWorldMapAction(arg_7_0, arg_7_1)
	if user.isKflq then
		local var_7_0 = arg_7_1.data

		if var_7_0.palaces then
			user.kflqData.lqEventList = {}
			user.kflqData.rightEventList = {}

			for iter_7_0, iter_7_1 in pairs(var_7_0.palaces) do
				if iter_7_1.nowPalace then
					if user.kflqData.curSuoCityNum and user.kflqData.curSuoCityNum > 0 and (iter_7_1.guardCities and #iter_7_1.guardCities == 0 or not iter_7_1.guardCities) then
						iter_7_1.isGuardCitiesOver = true
					end

					if user.kflqData.curKingCityId and user.kflqData.curKingCityId > 0 and user.kflqData.curKingCityId ~= iter_7_1.palaceCityId then
						user.kflqData.sCityId = user.kflqData.curKingCityId
						user.kflqData.eCityId = iter_7_1.palaceCityId
						user.kflqData.joinFun = "kflqState4"

						eventManager.dispatchEvent("moveToCity", user.kflqData.curKingCityId)
					end

					table.insert(user.kflqData.rightEventList, iter_7_1)

					user.kflqData.curKingCityId = iter_7_1.palaceCityId
					user.kflqData.curSuoCityNum = iter_7_1.guardCities and #iter_7_1.guardCities or 0
				end

				table.insert(user.kflqData.lqEventList, iter_7_1)
			end

			if #user.kflqData.rightEventList == 0 then
				v = {}
				v.isOver = true
				v.palaceCityId = user.kflqData.curKingCityId

				if user.kflqData.curKingCityId and user.kflqData.curKingCityId > 0 then
					user.kflqData.isPlayKing = true

					eventManager.dispatchEvent("moveToCity", user.kflqData.curKingCityId)

					if user.kfyzWorldId < 19 then
						user.kflqData.joinFun = "kflqState3"
					else
						user.kflqData.joinFun = "kflqState6"
					end
				end

				table.insert(user.kflqData.rightEventList, v)

				user.kflqData.curKingCityId = 0
			end
		end

		eventManager.dispatchEvent("rightEventListUpdate")
	end

	local var_7_1 = arg_7_1.data.pdlLastTime

	if var_7_1 and var_7_1 > 0 then
		arg_7_0:showEffectPoDi(var_7_1)
	end

	arg_7_0.goodsState = arg_7_1.data.goodsState

	arg_7_0:setGoodsButton()

	if arg_7_1.data.rights then
		arg_7_0.rights = arg_7_1.data.rights
		arg_7_0.vietrights = arg_7_1.data.vietrights

		table.sort(arg_7_0.rights, function(arg_8_0, arg_8_1)
			return arg_8_0.cityId < arg_8_1.cityId
		end)
		table.sort(arg_7_0.vietrights, function(arg_9_0, arg_9_1)
			return arg_9_0.cityId < arg_9_1.cityId
		end)

		for iter_7_2, iter_7_3 in ipairs(arg_7_0.rights) do
			if user.isKfdy then
				if iter_7_3.firstBloodName then
					arg_7_0.view.widgets["buluoGeneral" .. iter_7_2]:setDisplayFrame(CCSprite:create("res/ui/common/fightPic/fightPic_" .. iter_7_3.pic .. ".png"):displayFrame())
					arg_7_0.view.widgets["buluoGeneral" .. iter_7_2]:removeAllChildrenWithCleanup(true)
					tool.spriteToGray(arg_7_0.view.widgets["buluoGeneral" .. iter_7_2])
					arg_7_0.view.widgets["buluoWord" .. iter_7_2]:setString(language.get("222417_dongying", iter_7_3.firstBloodName))
					arg_7_0.view.widgets["buluoWord" .. iter_7_2]:setColor(ccc3(255, 0, 0))
				else
					arg_7_0.view.widgets["buluoGeneral" .. iter_7_2]:setDisplayFrame(CCSprite:create("res/ui/common/fightPic/fightPic_" .. iter_7_3.pic .. ".png"):displayFrame())
					arg_7_0.view.widgets["buluoWord" .. iter_7_2]:setString(language.get(1449922, iter_7_3.supportTimes))
					arg_7_0.view.widgets["buluoWord" .. iter_7_2]:setColor(ccc3(0, 255, 0))
				end
			elseif user.isKfgl then
				local var_7_2
				local var_7_3

				if iter_7_3.serial == 0 then
					var_7_2 = language.get(1449922, iter_7_3.supportTimes)
					var_7_3 = ccc3(0, 255, 0)
				elseif iter_7_3.serial == 1 then
					var_7_2 = language.get(226041)
					var_7_3 = ccc3(255, 0, 0)
				elseif iter_7_3.serial == 2 then
					var_7_2 = language.get(136576)
					var_7_3 = ccc3(255, 0, 0)
				end

				arg_7_0.view.widgets["buluoWord" .. iter_7_2]:setString(var_7_2)
				arg_7_0.view.widgets["buluoWord" .. iter_7_2]:setColor(var_7_3)
				eventManager.dispatchEvent("showEffectArrow", iter_7_3.cityId, iter_7_3.serial)
			end
		end

		for iter_7_4, iter_7_5 in ipairs(arg_7_0.vietrights) do
			if user.isKfyn then
				local var_7_4 = not iter_7_5.isSlow and iter_7_5.npcName or iter_7_5.npcName .. language.get(136824)

				arg_7_0.view.widgets["buluoName" .. iter_7_4]:setAnchorPoint(ccp(1, 0.5))
				arg_7_0.view.widgets["buluoName" .. iter_7_4]:setPositionX(75)
				arg_7_0.view.widgets["buluoName" .. iter_7_4]:setString(var_7_4)
				arg_7_0.view.widgets["buluoName" .. iter_7_4]:setColor(tool.hexToRgb("#e379e7"))

				local var_7_5 = ""

				if iter_7_5.state == 2 then
					local var_7_6 = language.get(136825)

					arg_7_0.view.widgets["buluoWord" .. iter_7_4]:setString(var_7_6)
				elseif iter_7_5.state == 3 then
					arg_7_0.view.widgets["buluoWord" .. iter_7_4]:setString("")
					arg_7_0:showCdTimerLable(iter_7_4, iter_7_5)
				elseif iter_7_5.state == 4 then
					arg_7_0.view.widgets["buluoWord" .. iter_7_4]:setString("")
					arg_7_0:showCdTimerLable(iter_7_4, iter_7_5)
				elseif iter_7_5.state == 5 then
					local var_7_7 = language.get(136826)

					arg_7_0.view.widgets["buluoWord" .. iter_7_4]:setString(var_7_7)
				end
			end
		end
	end

	if user.isKfnz then
		local var_7_8 = arg_7_1.data

		user.kfnzData.keyCityState = var_7_8.keyCityState

		arg_7_0.view.widgets.buluoName1:setString("")
		arg_7_0.view.widgets.buluoWord1:setPositionY(30)
		arg_7_0.view.widgets.buluo1:setVisible(true)
		arg_7_0.view.widgets.buluoName1:setVisible(true)
		arg_7_0.view.widgets.buluoGeneral1:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/dongying/djgl_world_icon_city.png"):displayFrame())
		arg_7_0.view.widgets.buluoGeneral1:setScale(1.2)
		arg_7_0.view.widgets.buluoGeneral1:setPosition(35, 41)

		if user.kfnzData.keyCityState == 0 then
			arg_7_0.view.widgets.buluoWord1:setColor(ccc3(255, 0, 0))
			arg_7_0.view.widgets.buluoWord1:setString(language.get(218007))

			user.kfnzData.chainCities = var_7_8.chainCities

			for iter_7_6, iter_7_7 in ipairs(user.kfnzData.chainCities) do
				arg_7_0.view.widgets["buluoGeneral" .. var_0_3[iter_7_7.keyCityId]]:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/dongying/djgl_world_icon_city.png"):displayFrame())
				arg_7_0.view.widgets["buluoGeneral" .. var_0_3[iter_7_7.keyCityId]]:setScale(1.2)
				arg_7_0.view.widgets["buluoGeneral" .. var_0_3[iter_7_7.keyCityId]]:setPosition(35, 41)
				arg_7_0.view.widgets["buluo" .. var_0_3[iter_7_7.keyCityId]]:setVisible(true)
				arg_7_0.view.widgets["buluoName" .. var_0_3[iter_7_7.keyCityId]]:setString(iter_7_7.keyCityName or "")
				arg_7_0.view.widgets["buluoName" .. var_0_3[iter_7_7.keyCityId]]:setVisible(true)
				arg_7_0.view.widgets["buluoWord" .. var_0_3[iter_7_7.keyCityId]]:setPositionX(34)

				if iter_7_7.isClosed then
					arg_7_0.view.widgets["buluoWord" .. var_0_3[iter_7_7.keyCityId]]:setColor(ccc3(255, 0, 0))
					arg_7_0.view.widgets["buluoWord" .. var_0_3[iter_7_7.keyCityId]]:setString(language.get(218008))
				elseif iter_7_7.chainSize == 0 then
					arg_7_0.view.widgets["buluoWord" .. var_0_3[iter_7_7.keyCityId]]:setColor(ccc3(0, 255, 0))
					arg_7_0.view.widgets["buluoWord" .. var_0_3[iter_7_7.keyCityId]]:setString(language.get(218009))
				else
					arg_7_0.view.widgets["buluoWord" .. var_0_3[iter_7_7.keyCityId]]:setPositionX(25)
					arg_7_0.view.widgets["buluoWord" .. var_0_3[iter_7_7.keyCityId]]:setColor(ccc3(255, 0, 0))
					arg_7_0.view.widgets["buluoWord" .. var_0_3[iter_7_7.keyCityId]]:setString(language.get(218010, iter_7_7.chainSize))
				end

				var_0_4[var_0_3[iter_7_7.keyCityId]] = iter_7_7.keyCityId
			end
		elseif user.kfnzData.keyCityState == 1 then
			for iter_7_8 = 2, 4 do
				arg_7_0.view.widgets["buluo" .. iter_7_8]:setVisible(false)
			end

			arg_7_0.view.widgets.buluoWord1:setColor(ccc3(0, 255, 0))
			arg_7_0.view.widgets.buluoWord1:setString(language.get(218006))

			user.kfnzData.keyEvents = var_7_8.keyEvents

			for iter_7_9, iter_7_10 in ipairs(user.kfnzData.keyEvents) do
				arg_7_0.view.widgets["buluoGeneral" .. var_0_3[iter_7_10.cityId]]:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/dongying/djgl_world_icon_city.png"):displayFrame())
				arg_7_0.view.widgets["buluoGeneral" .. var_0_3[iter_7_10.cityId]]:setScale(1.2)
				arg_7_0.view.widgets["buluoGeneral" .. var_0_3[iter_7_10.cityId]]:setPosition(35, 41)
				arg_7_0.view.widgets["buluo" .. var_0_3[iter_7_10.cityId]]:setVisible(true)
				arg_7_0.view.widgets["buluoName" .. var_0_3[iter_7_10.cityId]]:setString(iter_7_10.keyCityName or "")
				arg_7_0.view.widgets["buluoName" .. var_0_3[iter_7_10.cityId]]:setVisible(true)
				arg_7_0.view.widgets["buluoWord" .. var_0_3[iter_7_10.cityId]]:setPositionX(34)

				if iter_7_10.type == "fytj" then
					arg_7_0.view.widgets["buluoName" .. var_0_3[iter_7_10.cityId]]:setString(language.get(218014, arg_7_0:getJiang(iter_7_10.cityId)))
					arg_7_0.view.widgets["buluoWord" .. var_0_3[iter_7_10.cityId]]:setString("")

					if iter_7_10.nextTime and iter_7_10.nextTime > 0 then
						arg_7_0:showCdTimerLableNz(var_0_3[iter_7_10.cityId], iter_7_10)
					end
				elseif iter_7_10.type == "tsdc" then
					arg_7_0.view.widgets["buluoWord" .. var_0_3[iter_7_10.cityId]]:setPositionX(20)
					arg_7_0.view.widgets["buluoName" .. var_0_3[iter_7_10.cityId]]:setString(language.get(218014, arg_7_0:getJiang(iter_7_10.cityId)))
					arg_7_0.view.widgets["buluoWord" .. var_0_3[iter_7_10.cityId]]:setString(language.get(218015))
					arg_7_0.view.widgets["buluoWord" .. var_0_3[iter_7_10.cityId]]:setColor(ccc3(0, 255, 0))
				else
					arg_7_0.view.widgets["buluoName" .. var_0_3[iter_7_10.cityId]]:setString(arg_7_0:getJiang(iter_7_10.cityId))
					arg_7_0.view.widgets["buluoWord" .. var_0_3[iter_7_10.cityId]]:setString(language.get(218008))
					arg_7_0.view.widgets["buluoWord" .. var_0_3[iter_7_10.cityId]]:setColor(ccc3(0, 255, 0))
				end

				var_0_4[var_0_3[iter_7_10.cityId]] = iter_7_10.cityId
			end
		end
	end
end

function var_0_5.handlerPushNanZhao(arg_10_0, arg_10_1)
	if arg_10_1.tujin and user.kfnzData.keyEvents and #user.kfnzData.keyEvents > 0 then
		for iter_10_0, iter_10_1 in pairs(user.kfnzData.keyEvents) do
			if iter_10_1.cityId == arg_10_1.tujin.tujinCity then
				iter_10_1.nextTime = arg_10_1.tujin.nextTime

				if iter_10_1.nextTime and iter_10_1.nextTime > 0 then
					arg_10_0:showCdTimerLableNz(var_0_3[iter_10_1.cityId], iter_10_1)
				end
			end
		end
	end
end

function var_0_5.showCdTimerLableNz(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0
	local var_11_1 = arg_11_2.nextTime
	local var_11_2 = var_11_1 and var_11_1 > 0
	local var_11_3 = arg_11_0.view.widgets["buluoTime" .. arg_11_1]

	var_11_3:removeAllChildrenWithCleanup(true)

	if var_11_2 then
		local var_11_4 = createTimerLabel(var_11_1, "@M:@S" .. language.get(218016), "Thonburi", 18, function()
			return
		end, nil, nil, ccc3(0, 255, 0))

		var_11_4:setAnchorPoint(ccp(1, 0.5))
		var_11_4:setPositionX(75)
		var_11_3:addChild(var_11_4)
	end
end

function var_0_5.getJiang(arg_13_0, arg_13_1)
	local var_13_0 = ""

	if arg_13_1 == 8036 or arg_13_1 == 8023 then
		var_13_0 = language.get(218012)
	elseif arg_13_1 == 8037 or arg_13_1 == 8024 then
		var_13_0 = language.get(218011)
	elseif arg_13_1 == 8039 or arg_13_1 == 8025 then
		var_13_0 = language.get(218013)
	end

	return var_13_0
end

function var_0_5.showCdTimerLable(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0
	local var_14_1 = ""

	if arg_14_2.state == 3 then
		var_14_0 = arg_14_2.nextTime
		var_14_1 = language.get(136827)
	elseif arg_14_2.state == 4 then
		var_14_0 = arg_14_2.nextMoveTime
		var_14_1 = language.get(136828, arg_14_2.nextCity)
	end

	local var_14_2 = var_14_0 and var_14_0 > 0
	local var_14_3 = arg_14_0.view.widgets["buluoTime" .. arg_14_1]

	var_14_3:removeAllChildrenWithCleanup(true)

	if var_14_2 then
		local var_14_4 = createTimerLabel(var_14_0, "@M:@S" .. var_14_1, "Thonburi", 18, function()
			return
		end, nil, nil, ccc3(0, 255, 0))

		var_14_4:setAnchorPoint(ccp(1, 0.5))
		var_14_4:setPositionX(75)
		var_14_3:addChild(var_14_4)
	end
end

function var_0_5.handlerRightBarAction(arg_16_0, arg_16_1)
	if arg_16_0.rights then
		for iter_16_0, iter_16_1 in ipairs(arg_16_0.rights) do
			if iter_16_1 and iter_16_1.cityId == arg_16_1.cityId then
				if user.isKfdy then
					if arg_16_1.firstBloodName then
						arg_16_0.view.widgets["buluoGeneral" .. iter_16_0]:setDisplayFrame(CCSprite:create("res/ui/common/fightPic/fightPic_" .. arg_16_1.pic .. ".png"):displayFrame())
						arg_16_0.view.widgets["buluoGeneral" .. iter_16_0]:removeAllChildrenWithCleanup(true)
						tool.spriteToGray(arg_16_0.view.widgets["buluoGeneral" .. iter_16_0])
						arg_16_0.view.widgets["buluoWord" .. iter_16_0]:setString(language.get("222417_dongying", arg_16_1.firstBloodName))
						arg_16_0.view.widgets["buluoWord" .. iter_16_0]:setColor(ccc3(255, 0, 0))

						if arg_16_1.pic == "suworulu" then
							roleDialogue.control.loadSpeak(2101)
						elseif arg_16_1.pic == "xuzuozhinan" then
							roleDialogue.control.loadSpeak(2102)
						elseif arg_16_1.pic == "beimihu" then
							roleDialogue.control.loadSpeak(2103)
						elseif arg_16_1.pic == "jushimalv" then
							roleDialogue.control.loadSpeak(2104)
						end
					else
						arg_16_0.view.widgets["buluoGeneral" .. iter_16_0]:setDisplayFrame(CCSprite:create("res/ui/common/fightPic/fightPic_" .. arg_16_1.pic .. ".png"):displayFrame())
						arg_16_0.view.widgets["buluoWord" .. iter_16_0]:setString(language.get(1449922, arg_16_1.supportTimes))
						arg_16_0.view.widgets["buluoWord" .. iter_16_0]:setColor(ccc3(0, 255, 0))
					end
				elseif user.isKfgl then
					local var_16_0
					local var_16_1

					if iter_16_1.serial == 0 then
						var_16_0 = language.get(1449922, iter_16_1.supportTimes)
						var_16_1 = ccc3(0, 255, 0)
					elseif iter_16_1.serial == 1 then
						var_16_0 = language.get(226041)
						var_16_1 = ccc3(255, 0, 0)
					elseif iter_16_1.serial == 2 then
						var_16_0 = language.get(136576)
						var_16_1 = ccc3(255, 0, 0)
					end

					arg_16_0.view.widgets["buluoWord" .. iter_16_0]:setString(var_16_0)
					arg_16_0.view.widgets["buluoWord" .. iter_16_0]:setColor(var_16_1)
					eventManager.dispatchEvent("showEffectArrow", iter_16_1.cityId, iter_16_1.serial)
				end
			end
		end
	end

	if user.isKfyn and arg_16_1 and arg_16_0.vietrights then
		local var_16_2 = arg_16_1
		local var_16_3 = 1

		for iter_16_2, iter_16_3 in ipairs(arg_16_0.vietrights) do
			if iter_16_3.cityId == var_16_2.cityId then
				var_16_3 = iter_16_2

				break
			end
		end

		local var_16_4 = not var_16_2.isSlow and var_16_2.npcName or var_16_2.npcName .. language.get(136824)

		arg_16_0.view.widgets["buluoName" .. var_16_3]:setAnchorPoint(ccp(1, 0.5))
		arg_16_0.view.widgets["buluoName" .. var_16_3]:setPositionX(75)
		arg_16_0.view.widgets["buluoName" .. var_16_3]:setString(var_16_4)
		arg_16_0.view.widgets["buluoName" .. var_16_3]:setColor(tool.hexToRgb("#e379e7"))

		local var_16_5 = ""

		if var_16_2.state == 2 then
			local var_16_6 = language.get(136825)

			arg_16_0.view.widgets["buluoWord" .. var_16_3]:setString(var_16_6)
		elseif var_16_2.state == 3 then
			arg_16_0.view.widgets["buluoWord" .. var_16_3]:setString("")
			arg_16_0:showCdTimerLable(var_16_3, var_16_2)
		elseif var_16_2.state == 4 then
			arg_16_0.view.widgets["buluoWord" .. var_16_3]:setString("")
			arg_16_0:showCdTimerLable(var_16_3, var_16_2)
		elseif var_16_2.state == 5 then
			local var_16_7 = language.get(136826)

			arg_16_0.view.widgets["buluoWord" .. var_16_3]:setString(var_16_7)
		end
	end
end

function var_0_5.setStateWait(arg_17_0, arg_17_1)
	local var_17_0 = not arg_17_1

	arg_17_0.view.widgets.node0:setVisible(var_17_0)

	if user.jpsIndex == 0 then
		arg_17_0.view.widgets.node1:setVisible(var_17_0)
		arg_17_0.view.widgets.node2:setVisible(var_17_0)
		arg_17_0.view.widgets.btn_armyBase:setVisible(var_17_0)
	elseif not user.isKflq then
		arg_17_0.view.widgets.buluo1:setVisible(var_17_0)
		arg_17_0.view.widgets.buluo2:setVisible(var_17_0)
		arg_17_0.view.widgets.buluo3:setVisible(var_17_0)
		arg_17_0.view.widgets.buluo4:setVisible(var_17_0)
	else
		arg_17_0.view.widgets.buluo4:setVisible(var_17_0)
	end

	arg_17_0.view.widgets.buluo5:setVisible(false)
	arg_17_0.view.widgets.btn_general:setVisible(var_17_0)
	arg_17_0.view.widgets.btn_resource:setVisible(var_17_0)
	arg_17_0.world.thumbnail:setVisible(var_17_0)
end

function var_0_5.showEffectPoDi(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1 and arg_18_1 > 0
	local var_18_1 = arg_18_0.view.widgets.icon_podi

	var_18_1:removeAllChildrenWithCleanup(true)
	var_18_1:setVisible(var_18_0)

	if var_18_0 then
		local var_18_2 = createTimerLabel(arg_18_1, "@M:@S", "Thonburi", 35, function()
			var_18_1:setVisible(false)
		end, nil, nil, colorTips.red)

		var_18_2:setPosition(ccp(36, 0))
		var_18_1:addChild(var_18_2)
	end
end

function var_0_5.setVisibleArmyBase(arg_20_0, arg_20_1)
	if arg_20_1 then
		arg_20_0:changeForceToAtt()
	end

	arg_20_0.view.widgets.node_army:setVisible(arg_20_1)
	eventManager.dispatchEvent("sideGeneralSetVisible", not arg_20_1)

	if user.jpsIndex == 0 then
		arg_20_0.view.widgets.node1:setVisible(not arg_20_1)
		arg_20_0.view.widgets.node2:setVisible(not arg_20_1)
	end

	arg_20_0.world.thumbnail:setVisible(not arg_20_1)

	if arg_20_0.chat_panel then
		arg_20_0.chat_panel:setVisible(not arg_20_1)
	end

	arg_20_0.world.mapLayer:setTouchEnabled(not arg_20_1)
end

function var_0_5.changeForceToAtt(arg_21_0)
	arg_21_0.forceToAtt = arg_21_0.forceToAtt or 1

	eventManager.dispatchEvent("moveToCity", var_0_2[arg_21_0.forceToAtt].cityId, true)

	local var_21_0 = {
		(arg_21_0.forceToAtt - 1) % 3,
		(arg_21_0.forceToAtt + 1) % 3
	}

	for iter_21_0 = 1, 2 do
		if var_21_0[iter_21_0] == 0 then
			var_21_0[iter_21_0] = 3
		end

		arg_21_0.view.widgets["name_force" .. iter_21_0]:setString(language.get(var_0_2[var_21_0[iter_21_0]].textId))
	end
end

function var_0_5.showPanel(arg_22_0)
	return
end

function var_0_5.ctor(arg_23_0, arg_23_1)
	arg_23_0.world = arg_23_1
	arg_23_0.view = {}

	uiutil.initWidgets(arg_23_0.view, arg_23_0.layout)
	arg_23_0:addChild(arg_23_0.view.widgets.panel)

	local var_23_0 = user.invastType == 1 and "task_zftx.png" or "task_dyyz.png"

	if user.jpsIndex ~= 0 then
		if user.isKfdy then
			var_23_0 = "yzdy_task_word_yzdy.png"

			arg_23_0.view.widgets.buluo1:setVisible(true)
			arg_23_0.view.widgets.buluo2:setVisible(true)
			arg_23_0.view.widgets.buluo3:setVisible(true)
			arg_23_0.view.widgets.buluo4:setVisible(true)
		elseif user.isKfgl then
			var_23_0 = "djgl_task_word_yzgl.png"

			for iter_23_0 = 1, 3 do
				arg_23_0.view.widgets["buluo" .. iter_23_0]:setVisible(true)
				arg_23_0.view.widgets["buluoName" .. iter_23_0]:setVisible(true)
				arg_23_0.view.widgets["buluoGeneral" .. iter_23_0]:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/dongying/djgl_world_icon_city.png"):displayFrame())
				arg_23_0.view.widgets["buluoGeneral" .. iter_23_0]:setScale(1.2)
				arg_23_0.view.widgets["buluoGeneral" .. iter_23_0]:setPosition(35, 41)
			end
		elseif user.isKfyn then
			var_23_0 = "task_swjz.png"

			for iter_23_1 = 1, 4 do
				arg_23_0.view.widgets["buluo" .. iter_23_1]:setVisible(true)
				arg_23_0.view.widgets["buluoName" .. iter_23_1]:setVisible(true)
				arg_23_0.view.widgets["buluoGeneral" .. iter_23_1]:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/dongying/djgl_world_icon_city.png"):displayFrame())
				arg_23_0.view.widgets["buluoGeneral" .. iter_23_1]:setScale(1.2)
				arg_23_0.view.widgets["buluoGeneral" .. iter_23_1]:setPosition(35, 41)
			end

			if user.jpsIndex > 8 then
				arg_23_0.view.widgets.buluo5:setVisible(true)
			end
		elseif user.isKflq then
			for iter_23_2 = 1, 3 do
				arg_23_0.view.widgets["buluo" .. iter_23_2]:setVisible(false)
			end

			var_23_0 = "task_yzlq.png"

			arg_23_0.view.widgets.buluo4:setVisible(true)
			arg_23_0.view.widgets.buluoWord4:setString(language.get(215605))
			arg_23_0.view.widgets.buluoGeneral4:setDisplayFrame(CCSprite:create("res/ui/common/fightPic/fightPic_liuqiuwang.png"):displayFrame())
			arg_23_0.view.widgets.buluoGeneral4:setScale(0.7)
			arg_23_0.view.widgets.buluoGeneral4:setPosition(34, 35)
		end

		arg_23_0.view.widgets.node1:setVisible(false)
		arg_23_0.view.widgets.node2:setVisible(false)
		arg_23_0.view.widgets.btn_armyBase:setVisible(false)
	else
		arg_23_0.view.widgets.title_zhanjiang:setDisplayFrame(CCSprite:create("res/ui/kfyz/mrjw_task_word_sdpm.png"):displayFrame())
	end

	arg_23_0.view.widgets.title_task:setDisplayFrame(CCSprite:create("res/ui/kfyz/" .. var_23_0):displayFrame())

	for iter_23_3 = 1, 2 do
		arg_23_0.view.widgets["progress" .. iter_23_3]:setMidpoint(ccp(0.5, 0.5))
	end

	arg_23_0.view.widgets.btn_general:addHandleOfControlEvent(function()
		require("lua/layer/general/ui")
		showGeneralPanel(1, true)
	end, CCControlEventTouchUpInside)
	arg_23_0.view.widgets.btn_resource:addHandleOfControlEvent(function()
		require("lua/layer/resource/ui")
		resourceUI.show(1)
	end, CCControlEventTouchUpInside)
	arg_23_0.view.widgets.btn_armyBase:addHandleOfControlEvent(function()
		local var_26_0 = smgr.getLayer("topLayer")

		require("lua/layer/kfyz/JunkuLayer").new(var_26_0)
	end, CCControlEventTouchUpInside)
	arg_23_0.view.widgets.btn_mainCity:addHandleOfControlEvent(function()
		smgr.changeScene(SCENE_MAIN_CITY)
	end, CCControlEventTouchUpInside)
	arg_23_0.view.widgets.btn_task:addHandleOfControlEvent(function()
		require("lua/layer/nation/ui")
		nationUI.show(10)
	end, CCControlEventTouchUpInside)
	arg_23_0.view.widgets.btn_zhanjiang:addHandleOfControlEvent(function()
		require("lua/layer/kfyz/DongYingRank").new()
	end, CCControlEventTouchUpInside)
	arg_23_0.view.widgets.btn_fangshouJunzi:addHandleOfControlEvent(function()
		require("lua/layer/kfyz/FangShouJunZi").new()
	end, CCControlEventTouchUpInside)
	arg_23_0.view.widgets.btn_task1:addHandleOfControlEvent(function()
		local var_31_0 = smgr.getLayer("topLayer")

		require("lua/layer/kfyz/IndivTaskLayer").new(var_31_0, arg_23_0.world, 1)
	end, CCControlEventTouchUpInside)
	arg_23_0.view.widgets.btn_task2:addHandleOfControlEvent(function()
		local var_32_0 = smgr.getLayer("topLayer")

		require("lua/layer/kfyz/IndivTaskLayer").new(var_32_0, arg_23_0.world, 2)
	end, CCControlEventTouchUpInside)
	arg_23_0.view.widgets.btn_force1:addHandleOfControlEvent(function()
		arg_23_0.forceToAtt = (arg_23_0.forceToAtt - 1) % 3

		if arg_23_0.forceToAtt == 0 then
			arg_23_0.forceToAtt = 3
		end

		log.info("btn_force1", arg_23_0.forceToAtt)
		arg_23_0:changeForceToAtt()
	end, CCControlEventTouchUpInside)
	arg_23_0.view.widgets.btn_force2:setScaleX(-1.2)
	arg_23_0.view.widgets.btn_force2:addHandleOfControlEvent(function()
		arg_23_0.forceToAtt = (arg_23_0.forceToAtt + 1) % 3

		if arg_23_0.forceToAtt == 0 then
			arg_23_0.forceToAtt = 3
		end

		log.info("btn_force2", arg_23_0.forceToAtt)
		arg_23_0:changeForceToAtt()
	end, CCControlEventTouchUpInside)
	arg_23_0.view.widgets.btn_back:addHandleOfControlEvent(function()
		eventManager.dispatchEvent("armyBaseSetVisible", false)
	end, CCControlEventTouchUpInside)

	if user.getFunc(15) then
		local var_23_1 = require("lua/layer/chat/chatWindow")

		var_23_1:showFastChatPanel(arg_23_0)
		var_23_1.widgets.panel:setVisible(true)

		arg_23_0.chat_panel = var_23_1.widgets.panel
	end

	for iter_23_4 = 1, 4 do
		arg_23_0.view.widgets["btn_buluo" .. iter_23_4]:addHandleOfControlEvent(function()
			if arg_23_0.rights and arg_23_0.rights[iter_23_4] then
				local var_36_0 = arg_23_0.rights[iter_23_4].cityId

				if user.isKfdy then
					-- block empty
				else
					var_36_0 = user.isKfgl and ({
						[5031] = 5035,
						[5032] = 5036,
						[5040] = 5039
					})[var_36_0] or var_36_0
				end

				eventManager.dispatchEvent("moveToCity", var_36_0, true, nil, nil, true)
			end

			if arg_23_0.vietrights and user.isKfyn then
				local var_36_1 = arg_23_0.vietrights[iter_23_4].cityId

				eventManager.dispatchEvent("moveToCity", var_36_1, true, nil, nil, true)
			end

			if user.isKflq then
				eventManager.dispatchEvent("moveToCity", user.kflqData.curKingCityId or 7001, true, nil, nil, true)
			end

			if user.isKfnz and iter_23_4 > 1 and var_0_4[iter_23_4] then
				eventManager.dispatchEvent("moveToCity", var_0_4[iter_23_4], true, nil, nil, true)
			end
		end, CCControlEventTouchUpInside)
	end

	arg_23_0.view.widgets.btn_buluo5:addHandleOfControlEvent(function()
		eventManager.dispatchEvent("moveToCity", 6030, true, nil, nil, true)
	end, CCControlEventTouchUpInside)
	arg_23_0:showPanel()
end

function var_0_5.lqwXZ(arg_38_0)
	arg_38_0.view.widgets.buluoWord4:setString(language.get(215611))
end

function var_0_5.kfntTaskInfoUpdate(arg_39_0, arg_39_1)
	if arg_39_1 then
		if arg_39_1.sosCityState and arg_39_1.sosCityState.sosCityState > 0 then
			arg_39_0.view.widgets.buluoState5:setString(language.get(136829 + arg_39_1.sosCityState.sosCityState))

			if arg_39_1.sosCityState.sosCityState == 3 then
				arg_39_0.view.widgets.buluoState5:setColor(ccc3(255, 0, 0))
			else
				arg_39_0.view.widgets.buluoState5:setColor(ccc3(0, 255, 0))
			end

			local var_39_0 = 0

			if arg_39_1.sosCityState.selfNum then
				var_39_0 = tonumber(arg_39_1.sosCityState.oppNum / (arg_39_1.sosCityState.selfNum + arg_39_1.sosCityState.oppNum) * 100)
			end

			arg_39_0.view.widgets.buluoBar5:setMidpoint(ccp(0.5, 0.5))
			arg_39_0.view.widgets.buluoBar5:setBarChangeRate(ccp(1, 0))
			arg_39_0.view.widgets.buluoBar5:setPercentage(var_39_0)

			if user.jpsIndex > 8 then
				arg_39_0.view.widgets.buluo5:setVisible(true)
			end
		else
			arg_39_0.view.widgets.buluo5:setVisible(false)
		end
	end
end

function var_0_5.onEnter(arg_40_0)
	arg_40_0.setVisibleRef = handler(arg_40_0, arg_40_0.setVisible)
	arg_40_0.setVisibleArmyBaseRef = handler(arg_40_0, arg_40_0.setVisibleArmyBase)
	arg_40_0.showEffectPoDiRef = handler(arg_40_0, arg_40_0.showEffectPoDi)

	eventManager.registerEvent("kfyzMenuSetVisible", arg_40_0.setVisibleRef)
	eventManager.registerEvent("armyBaseSetVisible", arg_40_0.setVisibleArmyBaseRef)
	eventManager.registerEvent("showEffectPoDi", arg_40_0.showEffectPoDiRef)
end

function var_0_5.onExit(arg_41_0)
	eventManager.unregisterEvent("kfyzMenuSetVisible", arg_41_0.setVisibleRef)
	eventManager.unregisterEvent("armyBaseSetVisible", arg_41_0.setVisibleArmyBaseRef)
	eventManager.unregisterEvent("showEffectPoDi", arg_41_0.showEffectPoDiRef)
end

return var_0_5
