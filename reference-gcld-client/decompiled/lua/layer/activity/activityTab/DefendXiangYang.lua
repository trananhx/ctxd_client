local var_0_0 = colorQuality[0]
local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = ccc3(0, 180, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = colorQuality[6]
local var_0_7 = {
	[0] = "zsxy_word_door_dcm.png",
	"zsxy_word_door_xcm.png",
	"zsxy_word_door_ncm.png",
	"zsxy_word_door_bcm.png"
}
local var_0_8 = {
	ccp(430, 320),
	ccp(560, 260),
	ccp(690, 200)
}
local var_0_9 = {
	nil,
	nil,
	3,
	4,
	6,
	[113] = 2003,
	freeHuanyin = 41,
	[42] = 5,
	[102] = 41,
	[116] = 55,
	[101] = 15,
	[21] = 7,
	[100] = 100,
	[119] = 10033,
	xinlian = 15,
	[81] = 24,
	[47] = 10069,
	[126] = 10030,
	[216] = 216
}
local var_0_10 = class("DefendXiangYang", function()
	return createBaseLayer()
end)

var_0_10.layout = {
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
					y = 223,
					x = 457.5,
					type = "sprite",
					pic = {
						path = "res/ui/activity/defendXiangYang/zsxy_bg.jpg"
					}
				},
				{
					y = 407,
					x = 154,
					type = "sprite",
					pic = {
						path = "res/ui/activity/defendXiangYang/zsxy_word_di.png"
					}
				},
				{
					y = 223,
					x = 457.5,
					type = "sprite",
					pic = {
						path = "res/ui/activity/changbanSally/cbtw_frame.png"
					}
				},
				{
					y = 485,
					x = 457.5,
					type = "sprite",
					pic = {
						path = "res/ui/activity/defendXiangYang/zsxy_title_zsxy.png"
					}
				},
				{
					fontSize = 24,
					name = "leftTime",
					y = 475,
					type = "label",
					x = 705,
					color = var_0_3
				},
				{
					y = 485,
					name = "btn_tip",
					style = "button_tip",
					type = "button",
					x = 840
				},
				{
					fontSize = 25,
					y = 468,
					type = "label",
					x = 6,
					textId = "216327_zww1",
					color = var_0_1,
					anchorPoint = ccp(0, 0)
				},
				{
					y = 455,
					type = "sprite",
					x = 108,
					pic = {
						path = "res/ui/activity/defendXiangYang/zsxy_pb_bg.png"
					},
					children = {
						{
							y = 12,
							name = "bar",
							type = "progressbar",
							x = 105,
							pic = {
								path = "res/ui/activity/defendXiangYang/zsxy_pb.png"
							}
						},
						{
							fontSize = 20,
							name = "found",
							y = 12,
							type = "label",
							x = 105
						}
					}
				},
				{
					h = 60,
					name = "btn_reward",
					zoomOnTouchDown = true,
					type = "button",
					w = 60,
					y = 466,
					x = 236,
					children = {
						{
							y = 30,
							name = "light",
							type = "sprite",
							x = 30,
							pic = {
								path = "res/ui/instance/cbhs/light.png"
							}
						},
						{
							y = 30,
							type = "sprite9",
							x = 30,
							preferedSize = CCSizeMake(44, 44),
							middleRect = CCRectMake(5, 5, 66, 66),
							pic = {
								path = "res/ui/common/quailtyFrames/quality_frame_1.png"
							}
						},
						{
							x = 30,
							name = "icon_reward",
							y = 30,
							type = "sprite",
							scale = 0.55,
							pic = {
								frame = true,
								path = "kmssp.jpg"
							}
						}
					}
				},
				{
					y = 414,
					name = "gate",
					type = "sprite",
					x = 66,
					pic = {
						path = "res/ui/activity/defendXiangYang/zsxy_word_door_bcm.png"
					}
				},
				{
					fontSize = 25,
					name = "group",
					y = 414,
					type = "label",
					x = 146,
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = 0,
					name = "scrollview",
					type = "scrollview",
					x = 0,
					viewSize = CCSizeMake(909, 439),
					children = {
						{
							x = 0,
							height = 532,
							y = 0,
							type = "layerColor",
							width = 915,
							color = ccc4(0, 0, 0, 0),
							children = {
								{
									type = "node",
									name = "node_coach1",
									y = 320,
									visible = false,
									x = 430,
									children = {
										{
											zoomOnTouchDown = true,
											name = "btn_coach1",
											h = 120,
											type = "button",
											w = 120,
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
													x = 60,
													name = "coach1",
													y = 60,
													type = "sprite",
													scale = 1.5,
													pic = {
														path = "res/ui/activity/defendXiangYang/move50001.png"
													}
												},
												{
													type = "sprite",
													name = "finish1",
													y = 126,
													visible = false,
													x = 66,
													pic = {
														path = "res/ui/activity/defendXiangYang/zsxy_word_ysc.png"
													}
												},
												{
													type = "sprite",
													name = "type1",
													y = 126,
													visible = false,
													x = 66,
													pic = {
														path = "res/ui/activity/defendXiangYang/zsxy_word_dgjz.png"
													}
												}
											}
										}
									}
								},
								{
									type = "node",
									name = "node_coach2",
									y = 260,
									visible = false,
									x = 560,
									children = {
										{
											zoomOnTouchDown = true,
											name = "btn_coach2",
											h = 120,
											type = "button",
											w = 120,
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
													x = 60,
													name = "coach2",
													y = 60,
													type = "sprite",
													scale = 1.5,
													pic = {
														path = "res/ui/activity/defendXiangYang/move50001.png"
													}
												},
												{
													type = "sprite",
													name = "finish2",
													y = 126,
													visible = false,
													x = 66,
													pic = {
														path = "res/ui/activity/defendXiangYang/zsxy_word_ysc.png"
													}
												},
												{
													type = "sprite",
													name = "type2",
													y = 126,
													visible = false,
													x = 66,
													pic = {
														path = "res/ui/activity/defendXiangYang/zsxy_word_dgjz.png"
													}
												}
											}
										}
									}
								},
								{
									type = "node",
									name = "node_coach3",
									y = 200,
									visible = false,
									x = 690,
									children = {
										{
											zoomOnTouchDown = true,
											name = "btn_coach3",
											h = 120,
											type = "button",
											w = 120,
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
													x = 60,
													name = "coach3",
													y = 60,
													type = "sprite",
													scale = 1.5,
													pic = {
														path = "res/ui/activity/defendXiangYang/move50001.png"
													}
												},
												{
													type = "sprite",
													name = "finish3",
													y = 126,
													visible = false,
													x = 66,
													pic = {
														path = "res/ui/activity/defendXiangYang/zsxy_word_ysc.png"
													}
												},
												{
													type = "sprite",
													name = "type3",
													y = 126,
													visible = false,
													x = 66,
													pic = {
														path = "res/ui/activity/defendXiangYang/zsxy_word_dgjz.png"
													}
												}
											}
										}
									}
								}
							}
						}
					}
				},
				{
					visible = false,
					name = "arrow",
					type = "sprite",
					zorder = 10,
					y = 300,
					x = 560,
					anchorPoint = ccp(0.5, 0),
					pic = {
						path = "res/ui/activity/defendXiangYang/zsxy_icon_arrow.png"
					},
					children = {
						{
							y = 66,
							x = 29,
							type = "sprite",
							pic = {
								path = "res/ui/activity/defendXiangYang/zsxy_word_sc.png"
							}
						}
					}
				},
				{
					type = "sprite",
					name = "mark",
					y = 310,
					visible = false,
					x = 690,
					pic = {
						path = "res/ui/resource/silkroad/sczl_map_bubble_02.png"
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_addHelper",
					h = 62,
					type = "button",
					w = 195,
					y = 40,
					visible = false,
					x = 457.5,
					normal = {
						path = "res/ui/common/button/public_btn_orange.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_orange_c.png"
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
									name = "icon_addHelper",
									type = "sprite",
									x = 42,
									pic = {
										path = "res/ui/activity/ironRotary/yuanbao.png"
									}
								},
								{
									fontSize = 20,
									name = "addHelper",
									y = 15,
									type = "label",
									x = 42,
									color = var_0_1
								}
							}
						},
						{
							fontSize = 25,
							y = 34,
							type = "label",
							x = 125,
							textId = "216313_zww",
							color = var_0_1
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_serach",
					h = 62,
					type = "button",
					w = 195,
					y = 40,
					visible = false,
					x = 457.5,
					normal = {
						path = "res/ui/common/button/public_btn_orange.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_orange_c.png"
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
									name = "icon_serachGlod",
									type = "sprite",
									x = 42,
									pic = {
										path = "res/ui/activity/ironRotary/yuanbao.png"
									}
								},
								{
									fontSize = 20,
									name = "serachGlod",
									y = 15,
									type = "label",
									x = 42,
									color = var_0_1
								}
							}
						},
						{
							fontSize = 25,
							y = 34,
							type = "label",
							x = 125,
							textId = "216314_zww",
							color = var_0_1
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_nextGroup",
					h = 62,
					type = "button",
					w = 195,
					y = 40,
					visible = false,
					x = 800,
					normal = {
						path = "res/ui/common/button/public_btn_green.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_green_c.png"
					},
					children = {
						{
							fontSize = 25,
							y = 34,
							type = "label",
							x = 97,
							textId = "216329_zww1",
							color = var_0_1
						}
					}
				},
				{
					visible = false,
					name = "bg_reward",
					type = "sprite9",
					y = 210,
					x = 457.5,
					preferedSize = CCSizeMake(909, 320),
					middleRect = CCRectMake(450, 90, 9, 18),
					pic = {
						path = "res/ui/activity/godPaper/czzyb_longbg2.png"
					},
					children = {
						{
							y = 180,
							x = 454.5,
							type = "sprite",
							scale = 2,
							pic = {
								path = "res/ui/instance/cbhs/light.png"
							}
						},
						{
							y = 280,
							x = 454.5,
							type = "sprite",
							pic = {
								path = "res/ui/activity/defendXiangYang/zsxy_word_gxjjhdkmsspym.png"
							}
						},
						{
							y = 180,
							type = "sprite",
							x = 454.5,
							pic = {
								path = "res/ui/common/quailtyFrames/quality_frame_1.png"
							},
							children = {
								{
									y = 38,
									x = 38,
									type = "sprite",
									pic = {
										frame = true,
										path = "kmssp.jpg"
									}
								}
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_ok",
							h = 62,
							type = "button",
							w = 195,
							y = 60,
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
									y = 34,
									type = "label",
									x = 97,
									textId = 10001,
									color = var_0_1
								}
							}
						}
					}
				},
				{
					visible = false,
					name = "bg_npc",
					type = "sprite9",
					y = 120,
					x = 457.5,
					preferedSize = CCSizeMake(909, 250),
					middleRect = CCRectMake(450, 90, 9, 18),
					pic = {
						path = "res/ui/activity/godPaper/czzyb_longbg2.png"
					},
					children = {
						{
							y = 18,
							x = 0,
							type = "sprite",
							scale = 1.5,
							anchorPoint = ccp(0, 0),
							pic = {
								path = "res/ui/common/halfPic/halfPic_jinweijun.png"
							}
						},
						{
							fontSize = 25,
							y = 236,
							type = "label",
							x = 380,
							textId = "216300_zww",
							color = var_0_1,
							anchorPoint = ccp(0, 1)
						},
						{
							fontSize = 25,
							name = "msg",
							x = 660,
							type = "label",
							height = 0,
							y = 200,
							width = 440,
							color = var_0_1,
							anchorPoint = ccp(0.5, 1),
							halign = kCCTextAlignmentLeft
						},
						{
							zoomOnTouchDown = true,
							name = "btn_openGate1",
							h = 62,
							type = "button",
							w = 195,
							y = 50,
							visible = false,
							x = 620,
							normal = {
								path = "res/ui/common/button/public_btn_green.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_green_c.png"
							},
							children = {
								{
									fontSize = 25,
									y = 34,
									type = "label",
									x = 97,
									textId = "216328_zww1",
									color = var_0_1
								}
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_openGate2",
							h = 62,
							type = "button",
							w = 195,
							y = 50,
							visible = false,
							x = 620,
							normal = {
								path = "res/ui/common/button/public_btn_orange.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_orange_c.png"
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
											name = "icon_nextGateGold",
											type = "sprite",
											x = 42,
											pic = {
												path = "res/ui/activity/ironRotary/yuanbao.png"
											}
										},
										{
											fontSize = 20,
											name = "nextGateGold",
											y = 15,
											type = "label",
											x = 42,
											color = var_0_1
										}
									}
								},
								{
									fontSize = 25,
									y = 34,
									type = "label",
									x = 125,
									textId = 72005,
									color = var_0_1
								}
							}
						},
						{
							fontSize = 25,
							name = "haveReward",
							type = "label",
							visible = false,
							y = 50,
							x = 620,
							textId = "216323_zww",
							color = var_0_1
						}
					}
				}
			}
		}
	}
}
var_0_10.layout_talk = {
	y = 56,
	name = "bg",
	type = "sprite",
	x = 90,
	pic = {
		path = "res/ui/activity/defendXiangYang/zsxy_word_bubble.png"
	},
	children = {
		{
			fontSize = 20,
			height = 0,
			name = "talk",
			type = "label",
			width = 200,
			y = 40,
			x = 134,
			color = var_0_1,
			halign = kCCTextAlignmentLeft
		}
	}
}
var_0_10.tipFrame = {
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
			width = 400,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}

function var_0_10.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getXiangYangActivity)
end

function var_0_10.onSearch(arg_4_0, arg_4_1)
	arg_4_0.view.widgets.arrow:setVisible(false)

	local function var_4_0(arg_5_0)
		arg_4_0.view.widgets.btn_addHelper:setVisible(false)

		local var_5_0 = arg_5_0.action.data

		if var_5_0.reset ~= true then
			arg_4_0.afterSearch = true
		end

		arg_4_0:showEffectSearch(var_5_0, arg_4_1)
	end

	cmgr.sendRequest(var_4_0, actions.xiangYangSearch, arg_4_1)
end

function var_0_10.onAddHelper(arg_6_0)
	arg_6_0.view.widgets.arrow:setVisible(false)

	local function var_6_0(arg_7_0)
		local var_7_0 = arg_7_0.action.data

		arg_6_0:showEffectSearch(var_7_0)
	end

	if arg_6_0.info.addHelper > 0 then
		messageBox.showChargeWin("", language.get("216316_zww", arg_6_0.info.addHelper), "xyHelper", function()
			cmgr.sendRequest(var_6_0, actions.xiangYangAddHelper)
		end)
	else
		cmgr.sendRequest(var_6_0, actions.xiangYangAddHelper)
	end
end

function var_0_10.onOpenGate(arg_9_0)
	local function var_9_0(arg_10_0)
		arg_9_0:refresh()
	end

	if arg_9_0.info.nextGateGold > 0 then
		messageBox.showChargeWin("", language.get("216315_zww", arg_9_0.info.nextGateGold), "xyGate", function()
			cmgr.sendRequest(var_9_0, actions.xiangYangOpenGate)
		end)
	else
		cmgr.sendRequest(var_9_0, actions.xiangYangOpenGate)
	end
end

function var_0_10.onNextGroup(arg_12_0)
	local function var_12_0(arg_13_0)
		arg_12_0:refresh()
	end

	cmgr.sendRequest(var_12_0, actions.xiangYangNextGroup)
end

function var_0_10.onResetSearch(arg_14_0)
	local function var_14_0(arg_15_0)
		local var_15_0 = arg_15_0.action.data

		arg_14_0.afterSearch = true

		arg_14_0:refresh()
	end

	if arg_14_0.info.serachGlod > 0 then
		messageBox.showChargeWin("", language.get("216317_zww", arg_14_0.info.serachGlod), "xySearch", function()
			cmgr.sendRequest(var_14_0, actions.xiangYangResetSearch)
		end)
	else
		cmgr.sendRequest(var_14_0, actions.xiangYangResetSearch)
	end
end

function var_0_10.onGetReward(arg_17_0)
	local function var_17_0(arg_18_0)
		local var_18_0 = {}
		local var_18_1 = {}

		var_18_1.id = 10078
		var_18_1.value = 1

		table.insert(var_18_0, var_18_1)
		globalAction_gotResource(var_18_0)
		arg_17_0:refresh()
	end

	cmgr.sendRequest(var_17_0, actions.getXiangYangReward)
end

function var_0_10.showEffectCoach(arg_19_0)
	local var_19_0 = 0

	for iter_19_0, iter_19_1 in ipairs(arg_19_0.info.coachs) do
		if not iter_19_1.isLive then
			var_19_0 = var_19_0 + 1
		end

		arg_19_0.view.widgets["coach" .. iter_19_0]:removeAllChildrenWithCleanup(true)
		arg_19_0.view.widgets["finish" .. iter_19_0]:setVisible(false)
		arg_19_0.view.widgets["type" .. iter_19_0]:setVisible(false)

		local var_19_1 = arg_19_0.view.widgets["node_coach" .. iter_19_0]

		var_19_1:stopAllActions()
		var_19_1:setVisible(true)
		var_19_1:setPosition(var_0_8[iter_19_0].x + 400, var_0_8[iter_19_0].y + 200)

		local var_19_2 = 0.1 * math.random(8, 12)
		local var_19_3 = CCArray:create()

		var_19_3:addObject(CCMoveTo:create(var_19_2, var_0_8[iter_19_0]))
		var_19_3:addObject(CCCallFunc:create(function()
			if not iter_19_1.isLive then
				tool.spriteToGray(arg_19_0.view.widgets["coach" .. iter_19_0])
				arg_19_0.view.widgets["finish" .. iter_19_0]:setVisible(true)
			end

			if iter_19_0 == 2 then
				local var_20_0 = arg_19_0.info.gate == 0 and arg_19_0.info.group == 1 and var_19_0 == 0

				arg_19_0.view.widgets.arrow:setVisible(var_20_0)
			end
		end))

		local var_19_4 = CCSequence:create(var_19_3)

		var_19_1:runAction(var_19_4)
	end
end

function var_0_10.flyReward(arg_21_0)
	if arg_21_0.rewards then
		local var_21_0 = {}

		for iter_21_0, iter_21_1 in ipairs(arg_21_0.rewards) do
			local var_21_1 = var_0_9[iter_21_1.type]

			if var_21_1 then
				local var_21_2 = {
					id = var_21_1,
					value = iter_21_1.num
				}

				table.insert(var_21_0, var_21_2)
			end
		end

		globalAction_gotResource(var_21_0)

		arg_21_0.rewards = nil

		arg_21_0:refresh()
	end
end

function var_0_10.showEffectSearch(arg_22_0, arg_22_1, arg_22_2)
	if arg_22_0.effectNode then
		arg_22_0.effectNode:removeAllChildrenWithCleanup(true)
	else
		arg_22_0.effectNode = CCNode:create()

		arg_22_0.view.widgets.bg:addChild(arg_22_0.effectNode, 100)
	end

	arg_22_0:flyReward()

	arg_22_0.rewards = arg_22_1.rewards

	for iter_22_0 = 1, 3 do
		arg_22_0.view.widgets["btn_coach" .. iter_22_0]:setEnabled(false)
	end

	local var_22_0 = CCSpriteBatchNode:create("res/anim/avatar/att3.png")

	arg_22_0.effectNode:addChild(var_22_0)

	local var_22_1 = CCNode:create()

	arg_22_0.effectNode:addChild(var_22_1)

	local var_22_2 = arg_22_2 ~= nil and {
		arg_22_2
	} or {
		1,
		2,
		3
	}

	for iter_22_1, iter_22_2 in ipairs(var_22_2) do
		for iter_22_3 = 1, 2 do
			local var_22_3 = var_0_8[iter_22_2].x - 200 + 42 * (iter_22_3 - 1)
			local var_22_4 = var_0_8[iter_22_2].y - 110 - 24 * (iter_22_3 - 1)
			local var_22_5 = var_22_3 + 100
			local var_22_6 = var_22_4 + 50
			local var_22_7 = CCSprite:createWithSpriteFrame(tolua.cast(arg_22_0.animArrays.attack:objectAtIndex(0), "CCSpriteFrame"))

			var_22_7:setScale(1.5)
			var_22_7:setPosition(var_22_3, var_22_4)
			var_22_0:addChild(var_22_7)

			local var_22_8 = arg_22_0.animArrays.move
			local var_22_9 = CCAnimation:createWithSpriteFrames(var_22_8, 0.1)
			local var_22_10 = CCAnimate:create(var_22_9)

			var_22_7:runAction(CCRepeatForever:create(var_22_10))

			local var_22_11 = CCArray:create()

			var_22_11:addObject(CCMoveTo:create(0.5, ccp(var_22_5, var_22_6)))
			var_22_11:addObject(CCCallFunc:create(function()
				var_22_7:stopAllActions()
				var_22_7:setDisplayFrame(tolua.cast(arg_22_0.animArrays.attack:objectAtIndex(0), "CCSpriteFrame"))

				if iter_22_3 == 1 then
					local var_23_0 = arg_22_1.enemyId == iter_22_2 or arg_22_1.reset == true
					local var_23_1 = CCArray:create()

					var_23_1:addObject(CCCallFunc:create(function()
						arg_22_0.view.widgets["node_coach" .. iter_22_2]:setPosition(var_0_8[iter_22_2].x, var_0_8[iter_22_2].y)
						arg_22_0:showEffectShake(arg_22_0.view.widgets["coach" .. iter_22_2], var_23_0)

						if var_23_0 then
							arg_22_0.view.widgets.mark:setVisible(var_23_0)
							arg_22_0.view.widgets.mark:setPosition(var_0_8[iter_22_2].x, var_0_8[iter_22_2].y + 110)
						end
					end))
					var_23_1:addObject(CCDelayTime:create(1))
					var_23_1:addObject(CCCallFunc:create(function()
						arg_22_0.view.widgets.mark:setVisible(false)
						arg_22_0.view.widgets["coach" .. iter_22_2]:stopAllActions()
						arg_22_0.view.widgets["coach" .. iter_22_2]:setPosition(60, 60)

						local var_25_0 = {}

						uiutil.initWidgets(var_25_0, arg_22_0.layout_talk)
						var_25_0.widgets.bg:setPosition(var_0_8[iter_22_2].x + 30, var_0_8[iter_22_2].y - 4)
						var_22_1:addChild(var_25_0.widgets.bg)
						var_25_0.widgets.talk:setString(language.get(var_23_0 and "216309_zww" or "216308_zww"))
						var_25_0.widgets.talk:setColor(var_23_0 and var_0_3 or var_0_1)
					end))
					var_23_1:addObject(CCDelayTime:create(1))
					var_23_1:addObject(CCCallFunc:create(function()
						var_22_1:setVisible(false)

						local var_26_0

						if var_23_0 then
							var_26_0 = "zsxy_word_dgjz.png"
						elseif arg_22_0.info.gate == 0 then
							var_26_0 = "zsxy_word_pmmc.png"
						elseif arg_22_0.info.gate == 1 then
							var_26_0 = "zsxy_word_sfmc.png"
						elseif arg_22_0.info.gate == 2 then
							var_26_0 = "zsxy_word_dzmc.png"
						elseif arg_22_0.info.gate == 3 then
							var_26_0 = "zsxy_word_gzmc.png"
						end

						if var_26_0 then
							arg_22_0.view.widgets["type" .. iter_22_2]:setDisplayFrame(CCSprite:create("res/ui/activity/defendXiangYang/" .. var_26_0):displayFrame())
							arg_22_0.view.widgets["type" .. iter_22_2]:setVisible(true)
							arg_22_0.view.widgets["type" .. iter_22_2]:setPosition(66, 60)

							local var_26_1 = CCArray:create()

							var_26_1:addObject(CCMoveTo:create(0.5, ccp(66, 126)))

							local var_26_2 = CCSequence:create(var_26_1)

							arg_22_0.view.widgets["type" .. iter_22_2]:runAction(var_26_2)
						end
					end))
					var_23_1:addObject(CCDelayTime:create(0.8))
					var_23_1:addObject(CCCallFunc:create(function()
						if iter_22_1 == 1 then
							arg_22_0.effectNode:removeAllChildrenWithCleanup(true)
							arg_22_0:flyReward()
						end
					end))

					local var_23_2 = CCSequence:create(var_23_1)

					arg_22_0.view.widgets["node_coach" .. iter_22_2]:stopAllActions()
					arg_22_0.view.widgets["btn_coach" .. iter_22_2]:setEnabled(false)
					arg_22_0.view.widgets["coach" .. iter_22_2]:removeAllChildrenWithCleanup(true)
					arg_22_0.view.widgets["coach" .. iter_22_2]:stopAllActions()
					arg_22_0.view.widgets["coach" .. iter_22_2]:setPosition(60, 60)
					arg_22_0.view.widgets["node_coach" .. iter_22_2]:runAction(var_23_2)
				end
			end))

			local var_22_12 = CCSequence:create(var_22_11)

			var_22_7:runAction(var_22_12)
		end
	end
end

function var_0_10.showEffectShake(arg_28_0, arg_28_1, arg_28_2)
	if not arg_28_1 or tolua.isnull(arg_28_1) then
		return
	end

	local var_28_0 = CCArray:create()

	if arg_28_2 then
		var_28_0:addObject(CCMoveBy:create(0.08, ccp(-16, -8)))
		var_28_0:addObject(CCMoveBy:create(0.08, ccp(16, 8)))
	else
		var_28_0:addObject(CCMoveBy:create(0.08, ccp(-8, 0)))
		var_28_0:addObject(CCMoveBy:create(0.08, ccp(8, 0)))
	end

	local var_28_1 = CCSequence:create(var_28_0)
	local var_28_2 = CCArray:create()

	var_28_2:addObject(CCRepeat:create(var_28_1, 3))

	local var_28_3 = CCSequence:create(var_28_2)

	arg_28_1:stopAllActions()
	arg_28_1:runAction(CCRepeatForever:create(var_28_3))
end

function var_0_10.showTip(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_29_0:registerScriptTouchHandler(function(arg_30_0, arg_30_1, arg_30_2)
		if arg_30_0 == CCTOUCHBEGAN then
			return true
		elseif arg_30_0 == CCTOUCHMOVED then
			return true
		elseif arg_30_0 == CCTOUCHENDED then
			pcall(var_29_0.removeFromParentAndCleanup, var_29_0, true)

			return true
		end
	end, false, true)
	var_29_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_29_0, 60000)

	local var_29_1 = 0
	local var_29_2 = 0
	local var_29_3 = {}

	uiutil.initWidgets(var_29_3, arg_29_0.tipFrame)
	var_29_0:addChild(var_29_3.widgets.tipFrame)
	var_29_3.widgets.tipMsg:setDimensions(CCSizeMake(0, 0))

	local var_29_4, var_29_5 = tool.getPositionInScreen(arg_29_2)
	local var_29_6 = var_29_4 + 20
	local var_29_7 = var_29_5 - 20

	if arg_29_2 == arg_29_0.view.widgets.btn_tip then
		var_29_3.widgets.tipFrame:setAnchorPoint(ccp(0.5, 1))

		var_29_6 = visibleSize.width / 2
	elseif arg_29_2 == arg_29_0.view.widgets.btn_reward then
		var_29_3.widgets.tipFrame:setAnchorPoint(ccp(0, 1))

		var_29_6 = var_29_4 - 20
	end

	local var_29_8 = arg_29_1 or ""

	var_29_3.widgets.tipMsg:setString(var_29_8)

	local var_29_9 = var_29_3.widgets.tipMsg:getContentSize().width
	local var_29_10 = var_29_3.widgets.tipMsg:getContentSize().height

	var_29_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_29_9 + 30, var_29_10 + 30))
	var_29_3.widgets.tipFrame:setPosition(ccp(var_29_6, var_29_7))
	var_29_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_29_3.widgets.tipFrame:setVisible(true)
end

function var_0_10.showPanel(arg_31_0, arg_31_1)
	arg_31_0.info = arg_31_1

	local var_31_0 = 0

	for iter_31_0, iter_31_1 in ipairs(arg_31_1.coachs) do
		if not iter_31_1.isLive then
			var_31_0 = var_31_0 + 1
		end
	end

	local var_31_1 = arg_31_1.showButton == 0
	local var_31_2 = arg_31_1.showButton == 1
	local var_31_3 = arg_31_1.showButton == 2
	local var_31_4 = arg_31_1.found >= arg_31_1.foundMax
	local var_31_5 = arg_31_1.group == 0 and arg_31_1.gate == 0
	local var_31_6 = arg_31_1.group == arg_31_1.maxGroup and var_31_1 and var_31_0 == 0
	local var_31_7 = var_31_4 or var_31_5 or var_31_6

	arg_31_0.view.widgets.bg_reward:setVisible(false)
	arg_31_0.view.widgets.arrow:setVisible(false)
	arg_31_0.view.widgets.mark:setVisible(false)
	arg_31_0.view.widgets.found:setString(language.get(213297, arg_31_1.found, arg_31_1.foundMax))
	arg_31_0.view.widgets.bar:setPercentage(100 * arg_31_1.found / arg_31_1.foundMax)
	arg_31_0.view.widgets.light:setVisible(var_31_4)
	arg_31_0.view.widgets.icon_reward:removeAllChildrenWithCleanup(true)

	if not var_31_4 then
		tool.spriteToGray(arg_31_0.view.widgets.icon_reward)
	end

	arg_31_0.view.widgets.gate:setDisplayFrame(CCSprite:create("res/ui/activity/defendXiangYang/" .. var_0_7[arg_31_1.gate]):displayFrame())
	arg_31_0.view.widgets.group:setString(language.get("216301_zww", arg_31_1.group, arg_31_1.maxGroup))
	arg_31_0.view.widgets.bg_npc:setVisible(var_31_7)
	arg_31_0.view.widgets.haveReward:setVisible(var_31_4)
	arg_31_0.view.widgets.btn_openGate1:setVisible(var_31_5)
	arg_31_0.view.widgets.btn_openGate2:setVisible(not var_31_4 and var_31_6)

	if var_31_7 then
		if arg_31_0.effectNode then
			arg_31_0.effectNode:removeAllChildrenWithCleanup(true)
			arg_31_0:flyReward()
		end

		local var_31_8

		if var_31_4 then
			var_31_8 = language.get("216320_zww")
		else
			if var_31_5 then
				var_31_8 = language.get("216302_zww")
			end

			if var_31_6 then
				if arg_31_1.gate == 0 then
					var_31_8 = language.get("216303_zww", language.get("216304_zww"), language.get("216305_zww"))
				elseif arg_31_1.gate == 1 then
					var_31_8 = language.get("216303_zww", language.get("216305_zww"), language.get("216306_zww"))
				elseif arg_31_1.gate == 2 then
					var_31_8 = language.get("216303_zww", language.get("216306_zww"), language.get("216307_zww"))
				elseif arg_31_1.gate == 3 then
					var_31_8 = language.get("216318_zww")
				end

				arg_31_0.view.widgets.nextGateGold:setString(arg_31_1.nextGateGold)
			end
		end

		if var_31_8 then
			arg_31_0.view.widgets.msg:setString(var_31_8)
		end
	end

	for iter_31_2, iter_31_3 in ipairs(arg_31_1.coachs) do
		arg_31_0.view.widgets["node_coach" .. iter_31_2]:stopAllActions()
		arg_31_0.view.widgets["node_coach" .. iter_31_2]:setVisible(false)
		arg_31_0.view.widgets["btn_coach" .. iter_31_2]:setEnabled(iter_31_3.isLive)
		arg_31_0.view.widgets["coach" .. iter_31_2]:removeAllChildrenWithCleanup(true)
		arg_31_0.view.widgets["coach" .. iter_31_2]:stopAllActions()
		arg_31_0.view.widgets["coach" .. iter_31_2]:setPosition(60, 60)
		arg_31_0.view.widgets["finish" .. iter_31_2]:setVisible(false)
		arg_31_0.view.widgets["type" .. iter_31_2]:setVisible(false)
	end

	if arg_31_0.afterSearch then
		for iter_31_4, iter_31_5 in ipairs(arg_31_1.coachs) do
			arg_31_0.view.widgets["node_coach" .. iter_31_4]:setVisible(true)

			if not iter_31_5.isLive then
				tool.spriteToGray(arg_31_0.view.widgets["coach" .. iter_31_4])
				arg_31_0.view.widgets["finish" .. iter_31_4]:setVisible(true)
			end
		end
	elseif not var_31_7 and (var_31_1 and var_31_0 > 0 or not var_31_1) then
		arg_31_0:showEffectCoach()
	end

	arg_31_0.view.widgets.btn_nextGroup:setVisible(not var_31_7 and var_31_0 > 0)

	if var_31_7 then
		var_31_2 = false
		var_31_3 = false
	end

	arg_31_0.view.widgets.btn_serach:setVisible(var_31_2)

	if var_31_2 then
		local var_31_9 = arg_31_1.serachGlod == 0

		arg_31_0.view.widgets.icon_serachGlod:setVisible(not var_31_9)
		arg_31_0.view.widgets.serachGlod:setString(var_31_9 and language.get(136204, arg_31_1.serachNum) or arg_31_1.serachGlod)
		arg_31_0.view.widgets.serachGlod:setPositionY(var_31_9 and 25 or 15)
	end

	arg_31_0.view.widgets.btn_addHelper:setVisible(var_31_3)

	if var_31_3 then
		local var_31_10 = arg_31_1.addHelper == 0

		arg_31_0.view.widgets.icon_addHelper:setVisible(not var_31_10)
		arg_31_0.view.widgets.addHelper:setString(var_31_10 and language.get(136204, 1) or arg_31_1.addHelper)
		arg_31_0.view.widgets.addHelper:setPositionY(var_31_10 and 25 or 15)
	end

	arg_31_0.afterSearch = false
end

function var_0_10.ctor(arg_32_0, arg_32_1, arg_32_2)
	log.info("@@ 镇守襄阳活动")
	math.randomseed(os.time())

	arg_32_0.view = {}

	uiutil.initWidgets(arg_32_0.view, arg_32_0.layout)

	arg_32_0.leftTime = arg_32_0.view.widgets.leftTime

	if arg_32_1 then
		arg_32_0:addChild(arg_32_0.view.widgets.root)
		arg_32_1:addChild(arg_32_0)
	end

	arg_32_0.view.widgets.scrollview:setTouchEnabled(false)
	arg_32_0.view.widgets.mark:setColor(ccc3(255, 128, 128))

	local var_32_0 = CCArray:create()

	var_32_0:addObject(CCScaleTo:create(0.3, 1.5))
	var_32_0:addObject(CCScaleTo:create(0.7, 1))

	local var_32_1 = CCSequence:create(var_32_0)

	arg_32_0.view.widgets.light:runAction(CCRepeatForever:create(var_32_1))

	local var_32_2 = CCArray:create()

	var_32_2:addObject(CCEaseOut:create(CCMoveBy:create(0.5, ccp(0, 30)), 1))
	var_32_2:addObject(CCEaseIn:create(CCMoveBy:create(0.5, ccp(0, -30)), 1))

	local var_32_3 = CCSequence:create(var_32_2)

	arg_32_0.view.widgets.arrow:runAction(CCRepeatForever:create(var_32_3))
	arg_32_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_32_0:showTip(language.get("216324_zww"), arg_32_0.view.widgets.btn_tip)
	end, CCControlEventTouchUpInside)
	arg_32_0.view.widgets.btn_reward:addHandleOfControlEvent(function()
		log.info("btn_reward")

		if arg_32_0.info.found >= arg_32_0.info.foundMax then
			arg_32_0.view.widgets.bg_npc:setVisible(false)
			arg_32_0.view.widgets.bg_reward:setVisible(true)
		else
			arg_32_0:showTip(language.get("216321_zww"), arg_32_0.view.widgets.btn_reward)
		end
	end, CCControlEventTouchUpInside)
	arg_32_0.view.widgets.btn_ok:addHandleOfControlEvent(function()
		log.info("btn_ok")
		arg_32_0:onGetReward()
	end, CCControlEventTouchUpInside)
	arg_32_0.view.widgets.btn_openGate1:addHandleOfControlEvent(function()
		log.info("btn_openGate1")
		arg_32_0:onOpenGate()
	end, CCControlEventTouchUpInside)
	arg_32_0.view.widgets.btn_openGate2:addHandleOfControlEvent(function()
		log.info("btn_openGate2")
		arg_32_0:onOpenGate()
	end, CCControlEventTouchUpInside)
	arg_32_0.view.widgets.btn_nextGroup:addHandleOfControlEvent(function()
		log.info("btn_nextGroup")
		arg_32_0:onNextGroup()
	end, CCControlEventTouchUpInside)
	arg_32_0.view.widgets.btn_serach:addHandleOfControlEvent(function()
		log.info("btn_serach")
		arg_32_0:onResetSearch()
	end, CCControlEventTouchUpInside)
	arg_32_0.view.widgets.btn_addHelper:addHandleOfControlEvent(function()
		log.info("btn_addHelper")
		arg_32_0:onAddHelper()
	end, CCControlEventTouchUpInside)

	for iter_32_0 = 1, 3 do
		arg_32_0.view.widgets["btn_coach" .. iter_32_0]:addHandleOfControlEvent(function()
			log.info("btn_coach" .. iter_32_0)
			arg_32_0:onSearch(iter_32_0)
		end, CCControlEventTouchUpInside)
	end

	arg_32_0.animArrays = rmgr.getArmy("att", 3)

	arg_32_0:showPanel(arg_32_2)
end

return var_0_10
