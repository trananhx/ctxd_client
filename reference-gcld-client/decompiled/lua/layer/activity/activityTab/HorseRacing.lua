local var_0_0 = tool.hexToRgb("#EADBBB")
local var_0_1 = colorQuality[3]
local var_0_2 = colorQuality[2]
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[6]
local var_0_6 = {
	y = 0,
	name = "Layer",
	type = "layer",
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
					y = 207,
					name = "s_bg",
					type = "sprite",
					x = 457.5,
					pic = {
						path = "res/ui/activity/horseRacing/bg.jpg"
					},
					children = {
						{
							y = 0,
							name = "horse_run_panel",
							type = "layer",
							x = 0,
							children = {
								{
									y = 320,
									name = "run_horse_1_1",
									type = "sprite",
									x = 135,
									pic = {
										path = "res/ui/activity/horseRacing/sm_m_01.png"
									}
								},
								{
									y = 280,
									name = "run_horse_1_2",
									type = "sprite",
									x = 120,
									pic = {
										path = "res/ui/activity/horseRacing/sm_m_01.png"
									}
								},
								{
									y = 230,
									name = "run_horse_2_1",
									type = "sprite",
									x = 105,
									pic = {
										path = "res/ui/activity/horseRacing/sm_m_01.png"
									}
								},
								{
									y = 195,
									name = "run_horse_2_2",
									type = "sprite",
									x = 90,
									pic = {
										path = "res/ui/activity/horseRacing/sm_m_01.png"
									}
								},
								{
									y = 140,
									name = "run_horse_3_1",
									type = "sprite",
									x = 75,
									pic = {
										path = "res/ui/activity/horseRacing/sm_m_01.png"
									}
								},
								{
									y = 100,
									name = "run_horse_3_2",
									type = "sprite",
									x = 60,
									pic = {
										path = "res/ui/activity/horseRacing/sm_m_01.png"
									}
								},
								{
									y = 288,
									name = "run_rate_1",
									type = "sprite",
									x = 270,
									pic = {
										path = "res/ui/activity/horseRacing/sm_word_sl_d.png"
									},
									children = {
										{
											y = 23,
											name = "run_s_rate_1",
											type = "sprite",
											x = 60,
											pic = {
												path = "res/ui/activity/horseRacing/sm_word_sl.png"
											}
										},
										{
											fontSize = 24,
											name = "run_sl_1",
											type = "label",
											y = 23,
											x = 120,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								},
								{
									y = 198,
									name = "run_rate_2",
									type = "sprite",
									x = 240,
									pic = {
										path = "res/ui/activity/horseRacing/sm_word_sl_d.png"
									},
									children = {
										{
											y = 23,
											name = "run_s_rate_2",
											type = "sprite",
											x = 60,
											pic = {
												path = "res/ui/activity/horseRacing/sm_word_sl.png"
											}
										},
										{
											fontSize = 24,
											name = "run_sl_2",
											type = "label",
											y = 23,
											x = 120,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								},
								{
									y = 108,
									name = "run_rate_3",
									type = "sprite",
									x = 210,
									pic = {
										path = "res/ui/activity/horseRacing/sm_word_sl_d.png"
									},
									children = {
										{
											y = 23,
											name = "run_s_rate_3",
											type = "sprite",
											x = 60,
											pic = {
												path = "res/ui/activity/horseRacing/sm_word_sl.png"
											}
										},
										{
											fontSize = 24,
											name = "run_sl_3",
											type = "label",
											y = 23,
											x = 120,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								},
								{
									y = 280,
									name = "run_result_1",
									visible = false,
									type = "sprite",
									x = 770,
									pic = {
										path = "res/ui/activity/horseRacing/sm_seal_1.png"
									}
								},
								{
									y = 190,
									name = "run_result_2",
									visible = false,
									type = "sprite",
									x = 770,
									pic = {
										path = "res/ui/activity/horseRacing/sm_seal_1.png"
									}
								},
								{
									y = 100,
									name = "run_result_3",
									visible = false,
									type = "sprite",
									x = 770,
									pic = {
										path = "res/ui/activity/horseRacing/sm_seal_1.png"
									}
								}
							}
						},
						{
							y = 0,
							name = "select_mask",
							type = "sprite",
							x = 457,
							pic = {
								path = "res/ui/activity/horseRacing/sm_sd_light.png"
							}
						}
					}
				},
				{
					x = 0,
					height = 412,
					visible = false,
					type = "layerColor",
					name = "layer_cd",
					y = 0,
					width = 915,
					color = ccc4(0, 0, 0, 180),
					children = {
						{
							fontSize = 50,
							name = "type",
							y = 260,
							type = "label",
							x = 458,
							textId = 136043,
							color = var_0_4
						},
						{
							fontSize = 50,
							name = "cd",
							y = 190,
							type = "label",
							x = 458,
							color = var_0_4
						},
						{
							rotate = 180,
							name = "btn_cd",
							h = 76,
							type = "button",
							w = 95,
							zoomOnTouchDown = true,
							y = 185,
							x = 635,
							normal = {
								path = "res/ui/nation/kingNotice/gwgg_btn_arrows.png"
							},
							touched = {
								path = "res/ui/nation/kingNotice/gwgg_btn_arrows_c.png"
							}
						}
					}
				},
				{
					x = 457.5,
					y = 434,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/general/jailView/comm_list_laofang_3.png"
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_tip",
					h = 50,
					rotate = 180,
					w = 50,
					type = "button",
					y = 432,
					x = 30,
					normal = {
						path = "res/ui/common/button/gxb_btn_small.png"
					},
					touched = {
						path = "res/ui/common/button/gxb_btn_small_c.png"
					}
				},
				{
					text = "",
					name = "type",
					y = 432,
					type = "label",
					fontSize = 22,
					x = 50,
					anchorPoint = ccp(0, 0.5)
				},
				{
					text = "",
					name = "times",
					y = 432,
					type = "label",
					fontSize = 22,
					x = 150,
					anchorPoint = ccp(0, 0.5),
					color = var_0_0
				},
				{
					y = 475,
					name = "s_title",
					type = "sprite",
					x = 457.5,
					pic = {
						path = "res/ui/activity/horseRacing/title.png"
					}
				},
				{
					fontSize = 28,
					name = "leftTime",
					y = 465,
					type = "label",
					text = "剩余5天",
					x = 800,
					color = colorQuality[5],
					halign = kCCTextAlignmentLeft,
					valign = kCCVerticalTextAlignmentBottom
				},
				{
					name = "ready",
					h = 62,
					type = "button",
					w = 195,
					y = 50,
					x = 450,
					normal = {
						path = "res/ui/common/button/public_btn_red.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_red_c.png"
					},
					children = {
						{
							fontSize = 24,
							style = "label_yellowish_24",
							name = "Text_ready",
							type = "label",
							y = 33,
							x = 98,
							textId = 430012
						}
					}
				},
				{
					name = "start",
					h = 62,
					type = "button",
					w = 195,
					y = 50,
					x = 450,
					normal = {
						path = "res/ui/common/button/public_btn_red.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_red_c.png"
					},
					children = {
						{
							fontSize = 24,
							style = "label_yellowish_24",
							name = "Text_start",
							type = "label",
							y = 33,
							x = 98,
							textId = 136041
						}
					}
				},
				{
					name = "quickStart",
					h = 62,
					type = "button",
					w = 195,
					y = 180,
					x = 770,
					normal = {
						path = "res/ui/common/button/public_btn_red.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_red_c.png"
					},
					children = {
						{
							fontSize = 24,
							style = "label_yellowish_24",
							name = "Text_quickStart",
							type = "label",
							y = 33,
							x = 98,
							textId = 136039
						}
					}
				},
				{
					name = "updateHorse",
					h = 56,
					type = "button",
					w = 212,
					y = 110,
					x = 770,
					normal = {
						frame = false,
						path = "res/ui/common/button/sdyjs_btn_02.png"
					},
					touched = {
						frame = false,
						path = "res/ui/common/button/sdyjs_btn_02_c.png"
					},
					children = {
						{
							fontSize = 24,
							style = "label_yellowish_24",
							name = "Text_updateHorse",
							type = "label",
							y = 32,
							x = 130,
							textId = 136040
						},
						{
							y = 40,
							x = 40,
							scale = 0.6,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/ironRotary/yuanbao.png"
							}
						},
						{
							text = "",
							name = "horse_updateGold",
							y = 22,
							type = "label",
							style = "label_warlock",
							x = 40,
							fontSize = 22,
							color = var_0_4
						}
					}
				},
				{
					name = "directHorseRacing",
					h = 56,
					type = "button",
					w = 212,
					y = 40,
					x = 770,
					normal = {
						frame = false,
						path = "res/ui/common/button/sdyjs_btn_02.png"
					},
					touched = {
						frame = false,
						path = "res/ui/common/button/sdyjs_btn_02_c.png"
					},
					children = {
						{
							fontSize = 24,
							style = "label_yellowish_24",
							y = 32,
							type = "label",
							x = 130,
							textId = 136042
						},
						{
							y = 40,
							x = 40,
							scale = 0.6,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/ironRotary/yuanbao.png"
							}
						},
						{
							text = "",
							name = "directGold",
							y = 22,
							type = "label",
							style = "label_warlock",
							x = 40,
							fontSize = 22,
							color = var_0_4
						}
					}
				},
				{
					y = 0,
					name = "horse_ready_panel",
					type = "layer",
					x = 0,
					children = {
						{
							y = 320,
							name = "my_horse_panel",
							type = "sprite",
							x = 454,
							pic = {
								path = "res/ui/activity/horseRacing/sm_mp_d.png"
							},
							children = {
								{
									y = 79,
									name = "my_horse_bg_1",
									type = "sprite",
									x = 136,
									pic = {
										path = "res/ui/activity/horseRacing/sm_m_d.png"
									},
									children = {
										{
											y = 52,
											name = "my_horse_pic_1",
											type = "sprite",
											x = 52,
											pic = {
												path = "res/ui/activity/horseRacing/sm_icon_m_00.jpg"
											}
										}
									}
								},
								{
									y = 24,
									name = "my_horse_text_1",
									type = "sprite",
									x = 136,
									pic = {
										path = "res/ui/activity/horseRacing/sm_word_mm_01.png"
									}
								},
								{
									y = 79,
									name = "my_horse_bg_2",
									type = "sprite",
									x = 236,
									pic = {
										path = "res/ui/activity/horseRacing/sm_m_d.png"
									},
									children = {
										{
											y = 52,
											name = "my_horse_pic_2",
											type = "sprite",
											x = 52,
											pic = {
												path = "res/ui/activity/horseRacing/sm_icon_m_00.jpg"
											}
										}
									}
								},
								{
									y = 24,
									name = "my_horse_text_2",
									type = "sprite",
									x = 236,
									pic = {
										path = "res/ui/activity/horseRacing/sm_word_mm_01.png"
									}
								},
								{
									y = 79,
									name = "my_horse_bg_3",
									type = "sprite",
									x = 336,
									pic = {
										path = "res/ui/activity/horseRacing/sm_m_d.png"
									},
									children = {
										{
											y = 52,
											name = "my_horse_pic_3",
											type = "sprite",
											x = 52,
											pic = {
												path = "res/ui/activity/horseRacing/sm_icon_m_00.jpg"
											}
										}
									}
								},
								{
									y = 24,
									name = "my_horse_text_3",
									type = "sprite",
									x = 336,
									pic = {
										path = "res/ui/activity/horseRacing/sm_word_mm_01.png"
									}
								},
								{
									y = 140,
									name = "my_whos",
									type = "sprite",
									x = 236,
									pic = {
										path = "res/ui/activity/horseRacing/sm_word_ndmp.png"
									}
								}
							}
						},
						{
							y = 150,
							name = "npc_horse_panel",
							type = "sprite",
							x = 454,
							pic = {
								path = "res/ui/activity/horseRacing/sm_mp_d.png"
							},
							children = {
								{
									y = 79,
									name = "npc_horse_bg_1",
									type = "sprite",
									x = 136,
									pic = {
										path = "res/ui/activity/horseRacing/sm_m_d.png"
									},
									children = {
										{
											y = 52,
											name = "npc_horse_pic_1",
											type = "sprite",
											x = 52,
											pic = {
												path = "res/ui/activity/horseRacing/sm_icon_m_00.jpg"
											}
										}
									}
								},
								{
									y = 24,
									name = "npc_horse_text_1",
									type = "sprite",
									x = 136,
									pic = {
										path = "res/ui/activity/horseRacing/sm_word_mm_01.png"
									}
								},
								{
									y = 79,
									name = "npc_horse_bg_2",
									type = "sprite",
									x = 236,
									pic = {
										path = "res/ui/activity/horseRacing/sm_m_d.png"
									},
									children = {
										{
											y = 52,
											name = "npc_horse_pic_2",
											type = "sprite",
											x = 52,
											pic = {
												path = "res/ui/activity/horseRacing/sm_icon_m_00.jpg"
											}
										}
									}
								},
								{
									y = 24,
									name = "npc_horse_text_2",
									type = "sprite",
									x = 236,
									pic = {
										path = "res/ui/activity/horseRacing/sm_word_mm_01.png"
									}
								},
								{
									y = 79,
									name = "npc_horse_bg_3",
									type = "sprite",
									x = 336,
									pic = {
										path = "res/ui/activity/horseRacing/sm_m_d.png"
									},
									children = {
										{
											y = 52,
											name = "npc_horse_pic_3",
											type = "sprite",
											x = 52,
											pic = {
												path = "res/ui/activity/horseRacing/sm_icon_m_00.jpg"
											}
										}
									}
								},
								{
									y = 24,
									name = "npc_horse_text_3",
									type = "sprite",
									x = 336,
									pic = {
										path = "res/ui/activity/horseRacing/sm_word_mm_01.png"
									}
								},
								{
									y = 140,
									name = "npc_whos",
									type = "sprite",
									x = 236,
									pic = {
										path = "res/ui/activity/horseRacing/sm_word_dsmp.png"
									}
								}
							}
						},
						{
							y = 150,
							name = "npc_title_drag",
							type = "sprite",
							x = 454,
							pic = {
								path = "res/ui/activity/horseRacing/sm_word_jmptzzsd.png"
							}
						}
					}
				},
				{
					y = 207,
					name = "remainTitle",
					type = "sprite",
					x = 457,
					pic = {
						path = "res/ui/activity/horseRacing/sm_mp_d.png"
					},
					children = {
						{
							y = 66,
							name = "activityOver",
							type = "sprite",
							x = 236,
							pic = {
								path = "res/ui/activity/horseRacing/sm_word_smcsbz.png"
							}
						},
						{
							y = 166,
							name = "reward_title",
							type = "sprite",
							x = 236,
							pic = {
								path = "res/ui/activity/horseRacing/sm_word_js_01.png"
							}
						}
					}
				}
			}
		}
	}
}
local var_0_7 = {
	name = "tipFrame",
	type = "sprite9",
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(0, 1),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(260, 130),
	children = {
		{
			fontSize = 22,
			name = "txt1",
			type = "label",
			y = 110,
			x = 15,
			textId = 136029,
			color = var_0_1,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 22,
			name = "txt2",
			type = "label",
			y = 80,
			x = 15,
			textId = 136030,
			color = var_0_4,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 22,
			name = "txt3",
			type = "label",
			y = 50,
			x = 15,
			textId = 136031,
			color = var_0_3,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 22,
			name = "txt4",
			type = "label",
			y = 20,
			x = 15,
			textId = 136032,
			color = var_0_5,
			anchorPoint = ccp(0, 0.5)
		}
	}
}
local var_0_8 = class("HorseRacing", function()
	return createBaseLayer()
end)

function var_0_8.ctor(arg_2_0, arg_2_1)
	arg_2_0:init(arg_2_1)
end

function var_0_8.init(arg_3_0, arg_3_1)
	arg_3_0._layoutNode = LayoutNode.new()

	arg_3_0:addChild(arg_3_0._layoutNode)
	arg_3_0._layoutNode:setLoadFunc(handler(arg_3_0, arg_3_0.initLayout))
	arg_3_0._layoutNode:reload(var_0_6)
	arg_3_0:update_ui(arg_3_1)
end

function var_0_8.initLayout(arg_4_0, ...)
	arg_4_0._layoutNode:getWidget("s_bg"):registerScriptTouchHandler(handler(arg_4_0, arg_4_0.onDragClick), false, true)
	arg_4_0._layoutNode:getWidget("s_bg"):setTouchEnabled(true)
	arg_4_0._layoutNode:getWidget("start"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.click_start), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("ready"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.click_ready), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("quickStart"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.click_quickStart), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("updateHorse"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.click_updateHorse), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("directHorseRacing"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.click_directHorseRacing), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("btn_tip"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.click_btn_tip), CCControlEventTouchUpInside)
	arg_4_0._layoutNode:getWidget("btn_cd"):addHandleOfControlEvent(handler(arg_4_0, arg_4_0.click_btn_cd), CCControlEventTouchUpInside)
end

function var_0_8.update_ui(arg_5_0, arg_5_1)
	if arg_5_1 then
		arg_5_0._data = arg_5_1

		arg_5_0:getKeyInfo()

		local var_5_0
		local var_5_1

		if arg_5_1.type == 1 then
			var_5_0 = 490007
			var_5_1 = var_0_1
		elseif arg_5_1.type == 2 then
			var_5_0 = 490008
			var_5_1 = var_0_4
		elseif arg_5_1.type == 3 then
			var_5_0 = 490009
			var_5_1 = var_0_5
		end

		arg_5_0._layoutNode:getWidget("type"):setString(language.get(var_5_0))
		arg_5_0._layoutNode:getWidget("type"):setColor(var_5_1)
		arg_5_0._layoutNode:getWidget("times"):setString(language.get(136033, arg_5_1.times - 8 * (arg_5_1.type - 1)))
		arg_5_0._layoutNode:getWidget("horse_updateGold"):setString(tostring(arg_5_0._data.upgradeGold))
		arg_5_0._layoutNode:getWidget("directGold"):setString(tostring(arg_5_0._data.directGold))
		arg_5_0._layoutNode:getWidget("horse_ready_panel"):setVisible(false)
		arg_5_0._layoutNode:getWidget("npc_title_drag"):setVisible(false)
		arg_5_0._layoutNode:getWidget("quickStart"):setVisible(false)
		arg_5_0._layoutNode:getWidget("horse_run_panel"):setVisible(false)
		arg_5_0._layoutNode:getWidget("ready"):setVisible(false)
		arg_5_0._layoutNode:getWidget("npc_horse_panel"):setVisible(false)
		arg_5_0._layoutNode:getWidget("updateHorse"):setVisible(false)
		arg_5_0._layoutNode:getWidget("directHorseRacing"):setVisible(false)
		arg_5_0._layoutNode:getWidget("remainTitle"):setVisible(false)
		arg_5_0._layoutNode:getWidget("select_mask"):setVisible(false)
		arg_5_0._layoutNode:getWidget("start"):setVisible(false)
		arg_5_0._layoutNode:getWidget("reward_title"):setVisible(false)
		arg_5_0._layoutNode:getWidget("layer_cd"):setVisible(false)
		arg_5_0._layoutNode:getWidget("cd"):stopAllActions()

		if arg_5_1.status == 0 then
			if arg_5_0._data.remainTimes == 0 then
				arg_5_0._layoutNode:getWidget("remainTitle"):setVisible(true)

				local var_5_2 = CCSprite:create("res/ui/activity/horseRacing/sm_word_smcsbz.png")

				arg_5_0._layoutNode:getWidget("activityOver"):setDisplayFrame(var_5_2:displayFrame())
			elseif arg_5_1.cd and arg_5_1.cd > 0 then
				arg_5_0._layoutNode:getWidget("layer_cd"):setVisible(true)
				arg_5_0._layoutNode:getWidget("cd"):setString(tool.formatTime(arg_5_1.cd, "@H:@M:@S"))

				local var_5_3 = CCArray:create()

				var_5_3:addObject(CCDelayTime:create(0.5))
				var_5_3:addObject(CCCallFunc:create(function()
					arg_5_0._data.cd = arg_5_0._data.cd - 500

					if arg_5_0._data.cd <= 0 then
						arg_5_0:getHorseRacingInfo()
					else
						arg_5_0._layoutNode:getWidget("cd"):setString(tool.formatTime(arg_5_1.cd, "@H:@M:@S"))
					end
				end))

				local var_5_4 = CCSequence:create(var_5_3)

				arg_5_0._layoutNode:getWidget("cd"):runAction(CCRepeatForever:create(var_5_4))
			else
				arg_5_0._layoutNode:getWidget("horse_ready_panel"):setVisible(true)
				arg_5_0._layoutNode:getWidget("quickStart"):setVisible(true)
				arg_5_0._layoutNode:getWidget("ready"):setVisible(true)
				arg_5_0._layoutNode:getWidget("npc_horse_panel"):setVisible(true)
				arg_5_0._layoutNode:getWidget("updateHorse"):setVisible(true)
				arg_5_0._layoutNode:getWidget("directHorseRacing"):setVisible(true)
				arg_5_0:update_ready_panel()
			end
		elseif arg_5_1.status == 1 then
			if arg_5_0:checkMyHorseReady() == false then
				arg_5_0._layoutNode:getWidget("horse_ready_panel"):setVisible(true)
				arg_5_0._layoutNode:getWidget("quickStart"):setVisible(true)
				arg_5_0._layoutNode:getWidget("updateHorse"):setVisible(true)
				arg_5_0._layoutNode:getWidget("directHorseRacing"):setVisible(true)
			else
				arg_5_0._layoutNode:getWidget("updateHorse"):setVisible(true)
				arg_5_0._layoutNode:getWidget("directHorseRacing"):setVisible(true)
				arg_5_0._layoutNode:getWidget("start"):setVisible(true)
			end

			arg_5_0._layoutNode:getWidget("npc_title_drag"):setVisible(true)
			arg_5_0._layoutNode:getWidget("horse_run_panel"):setVisible(true)
			arg_5_0:update_ready_panel()
			arg_5_0:update_run_panel()
		elseif arg_5_1.status == 2 then
			if arg_5_0._isPlayAnimation == true then
				arg_5_0._layoutNode:getWidget("horse_run_panel"):setVisible(true)
			end

			arg_5_0:update_result_panel()
		elseif arg_5_1.status == 3 then
			arg_5_0._layoutNode:getWidget("remainTitle"):setVisible(true)

			local var_5_5 = CCSprite:create("res/ui/activity/horseRacing/sm_word_bchdyjs.png")

			arg_5_0._layoutNode:getWidget("activityOver"):setDisplayFrame(var_5_5:displayFrame())
		end
	end
end

function var_0_8.onDragClick(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	if arg_7_1 == CCTOUCHBEGAN then
		if arg_7_0._hasReward == true then
			local var_7_0 = arg_7_0._layoutNode:getWidget("activityOver")

			if tool.checkIfTouch(var_7_0, arg_7_2, arg_7_3) == true then
				arg_7_0:click_reward()

				arg_7_0._hasReward = false

				arg_7_0._layoutNode:getWidget("remainTitle"):setVisible(true)

				local var_7_1 = CCSprite:create("res/ui/activity/horseRacing/sm_jsbx_0" .. arg_7_0._rewardIndex .. "_c.png")

				arg_7_0._layoutNode:getWidget("activityOver"):setDisplayFrame(var_7_1:displayFrame())
			end
		end

		if arg_7_0._data.status == 1 and arg_7_0._myPosition ~= nil then
			for iter_7_0 = 1, 3 do
				if arg_7_0._myPosition[iter_7_0] == 0 or arg_7_0._myPosition[iter_7_0] == 4 then
					local var_7_2 = arg_7_0._layoutNode:getWidget("my_horse_pic_" .. iter_7_0)

					if tool.checkIfTouch(var_7_2, arg_7_2, arg_7_3) == true then
						var_7_2:setVisible(false)
						arg_7_0._layoutNode:getWidget("my_horse_text_" .. iter_7_0):setVisible(false)

						local var_7_3 = CCSprite:create()

						var_7_3:setDisplayFrame(var_7_2:displayFrame())

						local var_7_4 = visibleSize.width / 2 - 457.5 + 457 - 453.5
						local var_7_5 = visibleSize.height / 2 - 266 + 207 - 203.5 - 30

						var_7_3:setPosition(ccp(arg_7_2 - var_7_4, arg_7_3 - var_7_5))
						arg_7_0._layoutNode:getWidget("bg"):addChild(var_7_3, 100)

						arg_7_0._touchSprite = var_7_3
						arg_7_0._touchIndex = iter_7_0

						return true
					end
				else
					local var_7_6 = arg_7_0._layoutNode:getWidget("run_horse_" .. arg_7_0._myPosition[iter_7_0] .. "_2")

					if var_7_6:isVisible() == true and tool.checkIfTouch(var_7_6, arg_7_2, arg_7_3) == true then
						var_7_6:setVisible(false)

						local var_7_7 = CCSprite:create()

						var_7_7:setDisplayFrame(var_7_6:displayFrame())

						local var_7_8 = visibleSize.width / 2 - 457.5 + 457 - 453.5
						local var_7_9 = visibleSize.height / 2 - 266 + 207 - 203.5 - 30

						var_7_7:setPosition(ccp(arg_7_2 - var_7_8, arg_7_3 - var_7_9))
						arg_7_0._layoutNode:getWidget("bg"):addChild(var_7_7, 100)

						arg_7_0._touchSprite = var_7_7
						arg_7_0._touchIndex = iter_7_0

						return true
					end
				end
			end
		end

		return false
	elseif arg_7_1 == CCTOUCHMOVED then
		if arg_7_0._touchSprite ~= nil then
			local var_7_10 = visibleSize.width / 2 - 457.5 + 457 - 453.5
			local var_7_11 = visibleSize.height / 2 - 266 + 207 - 203.5 - 30

			arg_7_0._touchSprite:setPosition(ccp(arg_7_2 - var_7_10, arg_7_3 - var_7_11))

			local var_7_12 = 457
			local var_7_13 = arg_7_3 - var_7_11

			if var_7_13 < 165 then
				arg_7_0._touchPosition = 3

				arg_7_0._layoutNode:getWidget("select_mask"):setPosition(ccp(var_7_12, 90))
			elseif var_7_13 > 285 then
				arg_7_0._touchPosition = 1

				arg_7_0._layoutNode:getWidget("select_mask"):setPosition(ccp(var_7_12, 290))
			else
				arg_7_0._touchPosition = 2

				arg_7_0._layoutNode:getWidget("select_mask"):setPosition(ccp(var_7_12, 200))
			end

			arg_7_0._layoutNode:getWidget("select_mask"):setScaleX(5)
			arg_7_0._layoutNode:getWidget("select_mask"):setVisible(true)
		end
	elseif arg_7_1 == CCTOUCHENDED and arg_7_0._touchSprite ~= nil then
		arg_7_0._touchSprite:removeFromParentAndCleanup(true)

		arg_7_0._touchSprite = nil

		local var_7_14 = {
			135,
			120,
			105,
			90,
			75,
			60
		}
		local var_7_15 = {
			320,
			280,
			230,
			195,
			140,
			100
		}
		local var_7_16 = arg_7_0._myHorse[arg_7_0._touchIndex]
		local var_7_17 = CCSprite:create("res/ui/activity/horseRacing/sm_m_0" .. var_7_16 .. ".png")

		arg_7_0._layoutNode:getWidget("run_horse_" .. arg_7_0._touchPosition .. "_2"):setDisplayFrame(var_7_17:displayFrame())
		arg_7_0._layoutNode:getWidget("run_horse_" .. arg_7_0._touchPosition .. "_2"):setPosition(ccp(var_7_14[arg_7_0._touchPosition * 2], var_7_15[arg_7_0._touchPosition * 2]))
		arg_7_0._layoutNode:getWidget("run_horse_" .. arg_7_0._touchPosition .. "_2"):setVisible(true)
		arg_7_0._layoutNode:getWidget("select_mask"):setVisible(false)

		if arg_7_0._myPosition[arg_7_0._touchIndex] == arg_7_0._touchPosition then
			-- block empty
		else
			arg_7_0:click_dragHorse(arg_7_0._touchPosition, arg_7_0._touchIndex)
		end
	end
end

function var_0_8.update_result_panel(arg_8_0)
	local var_8_0 = arg_8_0._data.boxes[1].id

	arg_8_0._layoutNode:getWidget("remainTitle"):setVisible(true)

	local var_8_1 = CCSprite:create("res/ui/activity/horseRacing/sm_jsbx_0" .. var_8_0 .. ".png")

	arg_8_0._layoutNode:getWidget("activityOver"):setDisplayFrame(var_8_1:displayFrame())

	local var_8_2 = CCSprite:create("res/ui/activity/horseRacing/sm_word_js_0" .. var_8_0 .. ".png")

	arg_8_0._layoutNode:getWidget("reward_title"):setDisplayFrame(var_8_2:displayFrame())
	arg_8_0._layoutNode:getWidget("reward_title"):setVisible(true)

	arg_8_0._hasReward = true
	arg_8_0._rewardIndex = var_8_0
end

function var_0_8.update_ready_panel(arg_9_0)
	local var_9_0 = arg_9_0._data.npcHorses
	local var_9_1 = arg_9_0._data.playerHorses

	for iter_9_0 = 1, 3 do
		local var_9_2 = var_9_0[iter_9_0]
		local var_9_3 = arg_9_0._layoutNode:getWidget("npc_horse_pic_" .. var_9_2.position)
		local var_9_4 = CCSprite:create("res/ui/activity/horseRacing/sm_icon_m_0" .. var_9_2.quality .. ".jpg")

		var_9_3:setDisplayFrame(var_9_4:displayFrame())

		local var_9_5 = arg_9_0._layoutNode:getWidget("npc_horse_text_" .. var_9_2.position)
		local var_9_6 = CCSprite:create("res/ui/activity/horseRacing/sm_word_mm_0" .. var_9_2.quality .. ".png")

		if conf.language == "vie" then
			var_9_5:setScale(0.8)
		end

		var_9_5:setDisplayFrame(var_9_6:displayFrame())

		local var_9_7 = var_9_1[iter_9_0]
		local var_9_8 = arg_9_0._layoutNode:getWidget("my_horse_pic_" .. var_9_7.id)

		if var_9_7.position == 4 or var_9_7.position == 0 then
			local var_9_9 = CCSprite:create("res/ui/activity/horseRacing/sm_icon_m_0" .. var_9_7.quality .. ".jpg")

			var_9_8:setDisplayFrame(var_9_9:displayFrame())
			var_9_8:setVisible(true)
		else
			var_9_8:setVisible(false)
		end

		local var_9_10 = arg_9_0._layoutNode:getWidget("my_horse_text_" .. var_9_7.id)

		if var_9_7.position == 4 or var_9_7.position == 0 then
			local var_9_11 = CCSprite:create("res/ui/activity/horseRacing/sm_word_mm_0" .. var_9_7.quality .. ".png")

			if conf.language == "vie" then
				var_9_10:setScale(0.8)
			end

			var_9_10:setDisplayFrame(var_9_11:displayFrame())
			var_9_10:setVisible(true)
		else
			var_9_10:setVisible(false)
		end
	end
end

function var_0_8.calculateSL(arg_10_0)
	local var_10_0 = {
		0,
		0,
		0
	}
	local var_10_1 = arg_10_0._data.npcHorses
	local var_10_2 = arg_10_0._data.playerHorses

	for iter_10_0 = 1, 3 do
		local var_10_3 = var_10_2[iter_10_0].position

		if var_10_3 >= 1 and var_10_3 <= 3 then
			if var_10_2[iter_10_0].quality > var_10_1[var_10_3].quality then
				var_10_0[var_10_3] = 100
			elseif var_10_2[iter_10_0].quality < var_10_1[var_10_3].quality then
				var_10_0[var_10_3] = 0
			else
				var_10_0[var_10_3] = 50
			end
		end
	end

	return var_10_0
end

function var_0_8.update_run_panel(arg_11_0)
	local var_11_0 = {
		135,
		120,
		105,
		90,
		75,
		60
	}
	local var_11_1 = arg_11_0._data.npcHorses
	local var_11_2 = arg_11_0._data.playerHorses
	local var_11_3 = {
		135,
		120,
		105,
		90,
		75,
		60
	}
	local var_11_4 = {
		320,
		280,
		230,
		195,
		140,
		100
	}
	local var_11_5 = arg_11_0:calculateSL()

	for iter_11_0 = 1, 3 do
		arg_11_0._layoutNode:getWidget("run_rate_" .. iter_11_0):setVisible(false)
		arg_11_0._layoutNode:getWidget("run_horse_" .. iter_11_0 .. "_2"):setVisible(false)
		arg_11_0._layoutNode:getWidget("run_horse_" .. iter_11_0 .. "_2"):setPosition(ccp(var_11_3[iter_11_0 * 2], var_11_4[iter_11_0 * 2]))
	end

	for iter_11_1 = 1, 3 do
		local var_11_6 = var_11_1[iter_11_1]

		arg_11_0._layoutNode:getWidget("run_result_" .. iter_11_1):setVisible(false)

		local var_11_7 = arg_11_0._layoutNode:getWidget("run_horse_" .. var_11_6.position .. "_1")
		local var_11_8 = var_11_7:getPositionY()

		var_11_7:setPosition(ccp(var_11_0[2 * iter_11_1 - 1], var_11_8))

		local var_11_9 = CCSprite:create("res/ui/activity/horseRacing/sm_m_0" .. var_11_6.quality .. ".png")

		var_11_7:setDisplayFrame(var_11_9:displayFrame())

		local var_11_10 = var_11_2[iter_11_1]

		if var_11_10.position == 4 or var_11_10.position == 0 then
			-- block empty
		else
			local var_11_11 = arg_11_0._layoutNode:getWidget("run_horse_" .. var_11_10.position .. "_2")
			local var_11_12 = var_11_11:getPositionY()

			var_11_11:setPosition(ccp(var_11_0[2 * var_11_10.position], var_11_12))

			local var_11_13 = CCSprite:create("res/ui/activity/horseRacing/sm_m_0" .. var_11_10.quality .. ".png")

			var_11_11:setDisplayFrame(var_11_13:displayFrame())
			var_11_11:setVisible(true)
			arg_11_0._layoutNode:getWidget("run_sl_" .. var_11_10.position):setString("" .. var_11_5[var_11_10.position] .. "%")
			arg_11_0._layoutNode:getWidget("run_rate_" .. var_11_10.position):setVisible(true)
		end
	end
end

function var_0_8.checkMyHorseReady(arg_12_0)
	local var_12_0 = arg_12_0._data.playerHorses

	for iter_12_0 = 1, 3 do
		local var_12_1 = var_12_0[iter_12_0]

		if var_12_1.position == 4 or var_12_1.position == 0 then
			return false
		end
	end

	return true
end

function var_0_8.runHorsePlay(arg_13_0)
	local var_13_0 = arg_13_0._resultData.results
	local var_13_1 = {
		0,
		0,
		0
	}
	local var_13_2 = {
		4.5,
		4,
		3.5,
		3,
		2.5,
		2
	}

	for iter_13_0 = 1, 3 do
		local var_13_3 = var_13_0[iter_13_0]

		var_13_1[var_13_3.position] = var_13_3.result
	end

	local var_13_4 = 0
	local var_13_5 = {}

	for iter_13_1, iter_13_2 in ipairs(arg_13_0._data.playerHorses) do
		var_13_5[arg_13_0._myPosition[iter_13_2.id]] = iter_13_2.quality
	end

	for iter_13_3 = 1, 3 do
		if var_13_4 < var_13_2[arg_13_0._npcHorse[iter_13_3]] then
			var_13_4 = var_13_2[arg_13_0._npcHorse[iter_13_3]]
		end

		if var_13_4 < var_13_2[arg_13_0._myHorse[iter_13_3]] then
			var_13_4 = var_13_2[arg_13_0._myHorse[iter_13_3]]
		end

		arg_13_0:runAnimation(2 * iter_13_3 - 1, arg_13_0._npcHorse[iter_13_3], var_13_2[arg_13_0._npcHorse[iter_13_3]])
		arg_13_0:runAnimation(2 * iter_13_3, var_13_5[iter_13_3], var_13_2[var_13_5[iter_13_3]])

		local var_13_6 = var_13_0[iter_13_3].position * 2
		local var_13_7 = CCSprite:create("res/ui/activity/horseRacing/sm_seal_" .. var_13_1[iter_13_3] .. ".png")
		local var_13_8 = arg_13_0._layoutNode:getWidget("run_result_" .. iter_13_3)

		var_13_8:setDisplayFrame(var_13_7:displayFrame())
		var_13_8:setVisible(false)

		local function var_13_9()
			var_13_8:setScale(2)

			local var_14_0 = CCScaleTo:create(0.5, 1)

			var_13_8:setVisible(true)
			var_13_8:runAction(var_14_0)
		end

		local var_13_10 = var_13_4
		local var_13_11 = CCDelayTime:create(var_13_2[arg_13_0._myHorse[iter_13_3]])
		local var_13_12 = CCCallFunc:create(var_13_9)
		local var_13_13 = CCSequence:createWithTwoActions(var_13_11, var_13_12)

		var_13_8:runAction(var_13_13)
	end

	local function var_13_14()
		arg_13_0:getHorseRacingInfo()
	end

	local var_13_15 = var_13_4 + 0.5
	local var_13_16 = CCDelayTime:create(var_13_15)
	local var_13_17 = CCCallFunc:create(var_13_14)
	local var_13_18 = CCSequence:createWithTwoActions(var_13_16, var_13_17)

	arg_13_0._layoutNode:getWidget("s_bg"):runAction(var_13_18)

	arg_13_0._isPlayAnimation = true
end

function var_0_8.runAnimation(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = {
		135,
		120,
		105,
		90,
		75,
		60
	}
	local var_16_1 = {
		660,
		688,
		715,
		743,
		777,
		790
	}
	local var_16_2 = {
		"run_horse_1_1",
		"run_horse_1_2",
		"run_horse_2_1",
		"run_horse_2_2",
		"run_horse_3_1",
		"run_horse_3_2"
	}
	local var_16_3 = arg_16_0._layoutNode:getWidget(var_16_2[arg_16_1])

	var_16_3:setPositionX(var_16_0[arg_16_1])
	var_16_3:setVisible(true)

	local var_16_4 = ({
		1,
		1,
		1,
		2,
		3,
		4
	})[arg_16_2]

	local function var_16_5()
		var_16_3:stopAllActions()

		local var_17_0 = CCSprite:create("res/ui/activity/horseRacing/sm_m_0" .. arg_16_2 .. ".png"):displayFrame()

		var_16_3:setDisplayFrame(var_17_0)
	end

	local var_16_6 = var_16_3:getPositionX()
	local var_16_7 = var_16_3:getPositionY()
	local var_16_8 = CCMoveTo:create(arg_16_3, ccp(var_16_6 + var_16_1[arg_16_1], var_16_7))
	local var_16_9 = CCCallFuncN:create(var_16_5)
	local var_16_10 = CCArray:create()

	var_16_10:addObject(var_16_8)
	var_16_10:addObject(var_16_9)

	local var_16_11 = CCSequence:create(var_16_10)

	var_16_3:runAction(var_16_11)

	local var_16_12 = CCArray:create()

	for iter_16_0 = 1, 5 do
		local var_16_13 = CCSprite:create("res/ui/activity/horseRacing/anim/sm" .. var_16_4 .. "_move0" .. iter_16_0 .. ".png"):displayFrame()

		var_16_12:addObject(var_16_13)
	end

	local var_16_14 = CCAnimation:createWithSpriteFrames(var_16_12, 0.1)
	local var_16_15 = CCAnimate:create(var_16_14)
	local var_16_16 = CCArray:create()

	var_16_16:addObject(var_16_15)

	local var_16_17 = CCSequence:create(var_16_16)
	local var_16_18 = CCRepeatForever:create(tolua.cast(var_16_17, "CCActionInterval"))

	var_16_3:runAction(var_16_18)
end

function var_0_8.getLeftTimeLabel(arg_18_0)
	if arg_18_0._layoutNode then
		return arg_18_0._layoutNode:getWidget("leftTime")
	else
		return nil
	end
end

function var_0_8.getKeyInfo(arg_19_0)
	local var_19_0 = arg_19_0._data

	if var_19_0.npcHorses ~= nil and var_19_0.playerHorses ~= nil then
		arg_19_0._myHorse = {}
		arg_19_0._npcHorse = {}
		arg_19_0._myPosition = {}

		for iter_19_0 = 1, 3 do
			arg_19_0._myHorse[var_19_0.playerHorses[iter_19_0].id] = var_19_0.playerHorses[iter_19_0].quality
			arg_19_0._npcHorse[var_19_0.npcHorses[iter_19_0].position] = var_19_0.npcHorses[iter_19_0].quality
			arg_19_0._myPosition[var_19_0.playerHorses[iter_19_0].id] = var_19_0.playerHorses[iter_19_0].position
		end
	end
end

function var_0_8.getHorseRacingInfo(arg_20_0)
	local function var_20_0(arg_21_0)
		local var_21_0 = arg_21_0.action.data

		arg_20_0:update_ui(var_21_0)
		arg_20_0:getKeyInfo()
	end

	cmgr.sendRequest(var_20_0, actions.getHorseRacingActivity)
end

function var_0_8.click_ready(arg_22_0)
	local function var_22_0(arg_23_0)
		for iter_23_0 = 1, 3 do
			arg_22_0._layoutNode:getWidget(string.format("run_horse_%s_1", iter_23_0)):setVisible(true)
		end

		arg_22_0:getHorseRacingInfo()
	end

	cmgr.sendRequest(var_22_0, actions.setHorseReady)
end

function var_0_8.click_start(arg_24_0)
	local function var_24_0(arg_25_0)
		arg_24_0._resultData = arg_25_0.action.data

		arg_24_0:runHorsePlay()
	end

	arg_24_0._layoutNode:getWidget("start"):setVisible(false)
	arg_24_0._layoutNode:getWidget("updateHorse"):setVisible(false)
	arg_24_0._layoutNode:getWidget("directHorseRacing"):setVisible(false)

	for iter_24_0 = 1, 3 do
		arg_24_0._layoutNode:getWidget("run_rate_" .. iter_24_0):setVisible(false)
	end

	cmgr.sendRequest(var_24_0, actions.startHorseRacing)
end

function var_0_8.click_quickStart(arg_26_0)
	local var_26_0 = {
		0,
		0,
		0
	}
	local var_26_1 = {
		0,
		0,
		0
	}

	for iter_26_0 = 1, 3 do
		if arg_26_0._myPosition[iter_26_0] == 0 or arg_26_0._myPosition[iter_26_0] == 4 then
			-- block empty
		else
			var_26_1[iter_26_0] = arg_26_0._myPosition[iter_26_0]
			var_26_0[arg_26_0._myPosition[iter_26_0]] = iter_26_0
		end
	end

	for iter_26_1 = 1, 3 do
		if var_26_1[iter_26_1] == 0 then
			for iter_26_2 = 1, 3 do
				if var_26_0[iter_26_2] == 0 then
					cmgr.sendRequest(nil, actions.setHorsePosition, iter_26_2, iter_26_1)

					var_26_0[iter_26_2] = iter_26_1
					arg_26_0._myPosition[iter_26_1] = iter_26_2

					break
				end
			end
		end
	end

	arg_26_0._layoutNode:getWidget("horse_ready_panel"):setVisible(false)
	arg_26_0._layoutNode:getWidget("quickStart"):setVisible(false)
	arg_26_0._layoutNode:getWidget("updateHorse"):setVisible(false)
	arg_26_0._layoutNode:getWidget("directHorseRacing"):setVisible(false)
	arg_26_0._layoutNode:getWidget("ready"):setVisible(false)
	arg_26_0._layoutNode:getWidget("horse_run_panel"):setVisible(true)

	for iter_26_3 = 1, 3 do
		arg_26_0._layoutNode:getWidget("run_result_" .. iter_26_3):setVisible(false)
	end

	local var_26_2 = {
		135,
		120,
		105,
		90,
		75,
		60
	}
	local var_26_3 = {
		"run_horse_1_1",
		"run_horse_1_2",
		"run_horse_2_1",
		"run_horse_2_2",
		"run_horse_3_1",
		"run_horse_3_2"
	}

	for iter_26_4 = 1, 6 do
		arg_26_0._layoutNode:getWidget(var_26_3[iter_26_4]):setPositionX(var_26_2[iter_26_4])
	end

	for iter_26_5, iter_26_6 in ipairs(arg_26_0._data.playerHorses) do
		iter_26_6.position = arg_26_0._myPosition[iter_26_6.id]
	end

	local var_26_4 = arg_26_0._data.npcHorses
	local var_26_5 = arg_26_0._data.playerHorses

	for iter_26_7 = 1, 3 do
		local var_26_6 = var_26_4[iter_26_7]
		local var_26_7 = arg_26_0._layoutNode:getWidget("run_horse_" .. var_26_6.position .. "_1")
		local var_26_8 = CCSprite:create("res/ui/activity/horseRacing/sm_m_0" .. var_26_6.quality .. ".png")

		var_26_7:setDisplayFrame(var_26_8:displayFrame())

		local var_26_9 = var_26_5[iter_26_7]
		local var_26_10 = arg_26_0._layoutNode:getWidget("run_horse_" .. var_26_9.position .. "_2")
		local var_26_11 = CCSprite:create("res/ui/activity/horseRacing/sm_m_0" .. var_26_9.quality .. ".png")

		var_26_10:setDisplayFrame(var_26_11:displayFrame())
	end

	arg_26_0:click_start()
end

function var_0_8.click_dragHorse(arg_27_0, arg_27_1, arg_27_2)
	cmgr.sendRequest(handler(arg_27_0, arg_27_0.getHorseRacingInfo), actions.setHorsePosition, arg_27_1, arg_27_2)
end

function var_0_8.click_reward(arg_28_0)
	local function var_28_0(arg_29_0)
		local var_29_0 = arg_29_0.action.data
		local var_29_1 = {}

		for iter_29_0, iter_29_1 in ipairs(var_29_0.rewards) do
			local var_29_2 = {}

			if iter_29_1.type == 21 then
				var_29_2.id = 7
				var_29_2.gemLevel = iter_29_1.lv
			elseif iter_29_1.type == 5 then
				var_29_2.id = 6
			elseif iter_29_1.type == 102 then
				var_29_2.id = 41
			elseif iter_29_1.type == 116 then
				var_29_2.id = 55
			end

			var_29_2.value = iter_29_1.value

			table.insert(var_29_1, var_29_2)
		end

		globalAction_gotResource(var_29_1)

		local function var_29_3()
			arg_28_0:getHorseRacingInfo()
		end

		local var_29_4 = 2
		local var_29_5 = CCDelayTime:create(var_29_4)
		local var_29_6 = CCCallFunc:create(var_29_3)
		local var_29_7 = CCSequence:createWithTwoActions(var_29_5, var_29_6)

		arg_28_0._layoutNode:getWidget("s_bg"):runAction(var_29_7)
	end

	cmgr.sendRequest(var_28_0, actions.getHorseRacingReward)
end

function var_0_8.click_updateHorse(arg_31_0)
	local function var_31_0()
		local function var_32_0(arg_33_0)
			local var_33_0 = "res/anim/stategyEffect/att_jitui/att_jitui.plist"

			rmgr.loadResource(var_33_0)

			for iter_33_0 = 1, 3 do
				local var_33_1 = arg_31_0._layoutNode:getWidget("my_horse_pic_" .. iter_33_0)

				if var_33_1:isVisible() == true then
					local var_33_2 = CCSprite:create()
					local var_33_3 = CCArray:create()

					for iter_33_1 = 1, 10 do
						iter_33_1 = iter_33_1 == 10 and 15 or iter_33_1

						local var_33_4 = CCSprite:createWithSpriteFrameName(string.format("%d.png", iter_33_1))

						var_33_3:addObject(var_33_4:displayFrame())
					end

					local var_33_5 = CCAnimation:createWithSpriteFrames(var_33_3, 0.08)
					local var_33_6 = CCAnimate:create(var_33_5)
					local var_33_7 = CCArray:create()

					var_33_7:addObject(var_33_6)

					local var_33_8 = CCSequence:create(var_33_7)

					var_33_2:runAction(var_33_8)
					var_33_2:setPosition(ccp(36, 36))
					var_33_1:addChild(var_33_2)
				end
			end

			arg_31_0:getHorseRacingInfo()
		end

		cmgr.sendRequest(var_32_0, actions.upgradeHorse)
	end

	messageBox.showChargeWin("", language.get(136024, arg_31_0._data.upgradeGold), "hrUpgrade", var_31_0)
end

function var_0_8.click_directHorseRacing(arg_34_0)
	local function var_34_0(arg_35_0)
		for iter_35_0 = 1, 3 do
			arg_34_0._layoutNode:getWidget("run_rate_" .. iter_35_0):setVisible(false)
			arg_34_0._layoutNode:getWidget("run_result_" .. iter_35_0):setVisible(false)
		end

		local var_35_0 = {
			"run_horse_1_1",
			"run_horse_1_2",
			"run_horse_2_1",
			"run_horse_2_2",
			"run_horse_3_1",
			"run_horse_3_2"
		}

		for iter_35_1 = 1, 6 do
			arg_34_0._layoutNode:getWidget(var_35_0[iter_35_1]):setVisible(false)
		end

		arg_34_0:getHorseRacingInfo()
	end

	messageBox.showChargeWin("", language.get(136036, arg_34_0._data.directGold), "horseWinGold", function()
		cmgr.sendRequest(var_34_0, actions.directHorseRacing)
	end)
end

function var_0_8.click_btn_tip(arg_37_0)
	log.info("btn_tip")

	local var_37_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_37_0:registerScriptTouchHandler(function(arg_38_0, arg_38_1, arg_38_2)
		if arg_38_0 == CCTOUCHBEGAN then
			return true
		elseif arg_38_0 == CCTOUCHMOVED then
			return true
		elseif arg_38_0 == CCTOUCHENDED then
			pcall(var_37_0.removeFromParentAndCleanup, var_37_0, true)

			return true
		end
	end, false, true)
	var_37_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_37_0, 60000)

	local var_37_1 = 0
	local var_37_2 = 0
	local var_37_3 = {}

	uiutil.initWidgets(var_37_3, var_0_7)
	var_37_0:addChild(var_37_3.widgets.tipFrame)

	local var_37_4, var_37_5 = tool.getPositionInScreen(arg_37_0._layoutNode:getWidget("btn_tip"))
	local var_37_6 = var_37_4 - 25
	local var_37_7 = var_37_5 - 20

	var_37_3.widgets.tipFrame:setPosition(ccp(var_37_6, var_37_7))
	table.sort(arg_37_0._data.gems, function(arg_39_0, arg_39_1)
		return arg_39_0.winNum < arg_39_1.winNum
	end)

	local var_37_8 = 0

	for iter_37_0 = 1, 4 do
		local var_37_9 = var_37_3.widgets["txt" .. iter_37_0]:getContentSize()

		if var_37_8 < var_37_9.width then
			var_37_8 = var_37_9.width
		end
	end

	for iter_37_1, iter_37_2 in ipairs(arg_37_0._data.gems) do
		local var_37_10, var_37_11 = var_37_3.widgets["txt" .. iter_37_1]:getPosition()
		local var_37_12 = ""
		local var_37_13 = ""

		if user.player.playerLv >= 150 then
			var_37_12 = "res/ui/resource/silkroad/sczl_sj_icon.png"
			var_37_13 = iter_37_2.gemNum
		elseif iter_37_2.gemLv >= 1 and iter_37_2.gemLv <= 16 then
			local var_37_14 = math.ceil(iter_37_2.gemLv / 4)

			var_37_12 = string.format("res/ui/activity/gemsActivity/new/gem_a%d.png", var_37_14)
			var_37_13 = string.format("%s %s", language.get(111022, iter_37_2.gemLv), iter_37_2.gemNum)
		end

		local var_37_15 = CCSprite:create(var_37_12)

		var_37_15:setScale(0.6)
		var_37_15:setPosition(var_37_10 + var_37_8 + 30, var_37_11)
		var_37_3.widgets.tipFrame:addChild(var_37_15)

		local var_37_16 = CCLabelTTF:create(var_37_13, "Thonburi", 20)

		var_37_16:setAnchorPoint(ccp(0, 0.5))
		var_37_16:setPosition(var_37_10 + var_37_8 + 60, var_37_11)
		var_37_3.widgets.tipFrame:addChild(var_37_16)
	end

	var_37_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_37_8 + 170, 130))
end

function var_0_8.click_btn_cd(arg_40_0)
	log.info("btn_cd")

	local function var_40_0(arg_41_0)
		arg_40_0:getHorseRacingInfo()
	end

	messageBox.confirm(language.get(136037, arg_40_0._data.cdGold), function()
		cmgr.sendRequest(var_40_0, actions.horseRacingCd)
	end)
end

return var_0_8
