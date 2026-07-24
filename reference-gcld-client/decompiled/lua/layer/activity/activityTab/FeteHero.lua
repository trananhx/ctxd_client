local var_0_0 = class("FeteHero", function()
	return createBaseLayer()
end)

require("lua/layer/rankInfo/ui")

var_0_0.layout = {
	name = "root",
	type = "node",
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			y = 0,
			name = "bgView",
			type = "node",
			x = 0,
			children = {
				{
					y = 0,
					name = "bg1",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/comment/bg1.jpg"
					}
				},
				{
					y = 214.9995,
					name = "xhjy_title_bg",
					type = "sprite",
					x = -0.0001,
					pic = {
						path = "res/ui/activity/tsDrinking/xhjy_title_bg.png"
					}
				},
				{
					y = -84,
					name = "dyqx_bg",
					type = "sprite",
					x = -0.0052,
					pic = {
						path = "res/ui/activity/feteHero/dyqx_bg.jpg"
					}
				},
				{
					fontSize = 24,
					name = "leftTime",
					y = 210,
					type = "label",
					x = 300
				},
				{
					y = 123,
					name = "zjlyx_zy_pb_bg",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/activity/generalDrink/zjlyx_zy_pb_bg.png"
					}
				},
				{
					y = 125.9972,
					name = "zjlyx_zy_pb_d",
					type = "sprite",
					x = 69.9996,
					pic = {
						path = "res/ui/activity/generalDrink/zjlyx_zy_pb_d.png"
					}
				},
				{
					y = 125.9999,
					name = "dyqxxg_word_qifen",
					type = "sprite",
					x = -417.0004,
					pic = {
						path = "res/ui/activity/feteHero/dyqxxg_word_qifen.png"
					}
				},
				{
					y = 126,
					name = "pro",
					type = "progressbar",
					x = 70,
					pic = {
						path = "res/ui/activity/generalDrink/zjlyx_zy_pb.png"
					}
				},
				{
					name = "qifenNum",
					type = "atlaslabel",
					pic = "res/ui/common/number/gphb_word_digit.png",
					startCharMap = 48,
					text = "0",
					y = 126,
					itemWidth = 28,
					x = -335,
					itemHeight = 33
				},
				{
					y = 71.0005,
					name = "dyqxxg_word_bg",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/activity/feteHero/dyqxxg_word_bg.png"
					}
				},
				{
					y = 195,
					name = "dyqx_word_di",
					type = "sprite",
					x = -366.0001,
					pic = {
						path = "res/ui/activity/feteHero/dyqx_word_di.png"
					}
				},
				{
					name = "giftBtn",
					h = 38,
					type = "button",
					w = 122,
					y = 195,
					x = -350,
					normal = {
						path = "res/ui/activity/feteHero/dyqx_word_jrhl.png"
					},
					touched = {
						path = "res/ui/activity/feteHero/dyqx_word_jrhl.png"
					},
					children = {
						{
							y = 27,
							name = "dyqx_icon",
							scale = 0.3,
							type = "sprite",
							x = -15,
							pic = {
								path = "res/ui/rankInfo/DailyFeatView/gxb_bx1.png"
							}
						},
						{
							y = 25,
							name = "hasBg",
							visible = false,
							type = "sprite",
							x = 55,
							pic = {
								path = "res/ui/activity/feteHero/getRewardOver.png"
							}
						}
					}
				},
				{
					y = 210,
					name = "helpBtn",
					style = "button_tip",
					type = "button",
					x = 160
				},
				{
					fontSize = 20,
					name = "titleInfoLb",
					y = 76,
					type = "label",
					x = 0,
					textId = 215037,
					color = tool.hexToRgb("#ffa800")
				},
				{
					y = 210,
					name = "dyqx_title",
					type = "sprite",
					x = 1.25,
					pic = {
						path = "res/ui/activity/feteHero/dyqx_title.png"
					}
				}
			}
		},
		{
			y = 0,
			name = "iconList",
			type = "node",
			x = -1.25,
			children = {
				{
					name = "iconRenderer1",
					h = 97,
					type = "button",
					w = 97,
					y = 126,
					x = -66,
					normal = {
						path = "res/ui/activity/generalDrink/zjlyx_jx_icon_d.png"
					},
					touched = {
						path = "res/ui/activity/generalDrink/zjlyx_jx_icon_d.png"
					},
					children = {
						{
							y = 48.5,
							name = "dyqxxg_icon_01",
							type = "sprite",
							x = 48.5,
							pic = {
								path = "res/ui/activity/feteHero/dyqxxg_icon_01.jpg"
							}
						},
						{
							fontSize = 22,
							style = "label_warlock",
							name = "expNum1",
							type = "label",
							y = 30,
							x = 48.5,
							color = color_whi
						}
					}
				},
				{
					name = "iconRenderer2",
					h = 97,
					type = "button",
					w = 97,
					y = 126,
					x = 170,
					normal = {
						path = "res/ui/activity/generalDrink/zjlyx_jx_icon_d.png"
					},
					touched = {
						path = "res/ui/activity/generalDrink/zjlyx_jx_icon_d.png"
					},
					children = {
						{
							y = 48.5,
							name = "dyqxxg_icon_02",
							type = "sprite",
							x = 48.5,
							pic = {
								path = "res/ui/activity/feteHero/dyqxxg_icon_02.jpg"
							}
						},
						{
							fontSize = 22,
							style = "label_warlock",
							name = "expNum2",
							type = "label",
							y = 30,
							x = 48.5,
							color = color_whi
						}
					}
				},
				{
					name = "iconRenderer3",
					h = 97,
					type = "button",
					w = 97,
					y = 126,
					x = 406,
					normal = {
						path = "res/ui/activity/generalDrink/zjlyx_jx_icon_d.png"
					},
					touched = {
						path = "res/ui/activity/generalDrink/zjlyx_jx_icon_d.png"
					},
					children = {
						{
							y = 48.5,
							name = "dyqxxg_icon_03",
							type = "sprite",
							x = 48.5,
							pic = {
								path = "res/ui/activity/feteHero/dyqxxg_icon_03.jpg"
							}
						},
						{
							fontSize = 22,
							style = "label_warlock",
							name = "expNum3",
							type = "label",
							y = 30,
							x = 48.5,
							color = color_whi
						}
					}
				}
			}
		},
		{
			y = 50.9683,
			name = "syNode",
			type = "node",
			x = -203.9047,
			children = {
				{
					name = "feteBtn",
					h = 107,
					type = "button",
					w = 105,
					y = -228.0004,
					x = 585.9999,
					normal = {
						path = "res/ui/activity/feteHero/dyqx_btn_qj.png"
					},
					touched = {
						path = "res/ui/activity/feteHero/dyqx_btn_qj_c.png"
					},
					children = {
						{
							y = 28.9995,
							name = "icon_gold",
							scale = 0.7,
							type = "sprite",
							x = 44.9914,
							pic = {
								path = "res/ui/playerInfo/icon_gold.png"
							}
						},
						{
							fontSize = 22,
							name = "feteBtnGold",
							y = 29.8568,
							type = "label",
							x = 67.8536
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "gotoRankBtn",
					h = 24,
					type = "button",
					w = 192,
					y = -290,
					x = 540,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					children = {
						{
							fontSize = 24,
							name = "gotoRankLb",
							y = 12,
							type = "label",
							x = 96,
							textId = 215028,
							color = tool.hexToRgb("#00ff00")
						}
					}
				},
				{
					name = "goldFeteBtn",
					h = 56,
					type = "button",
					w = 212,
					y = -284,
					x = 203.9,
					normal = {
						path = "res/ui/common/button/sdyjs_btn_02.png"
					},
					touched = {
						path = "res/ui/common/button/sdyjs_btn_02_c.png"
					},
					children = {
						{
							y = 36.9996,
							name = "icon_gold_2",
							scale = 0.7,
							type = "sprite",
							x = 41.9997,
							pic = {
								path = "res/ui/playerInfo/icon_gold.png"
							}
						},
						{
							fontSize = 20,
							name = "goldFeteBtnLb",
							y = 21.9997,
							type = "label",
							x = 39.9986
						},
						{
							fontSize = 28,
							style = "label_warlock",
							name = "goldInfoLb",
							type = "label",
							y = 34.2848,
							x = 124.2843,
							textId = 215038,
							color = color_whi
						}
					}
				},
				{
					name = "freeFeteBtn",
					h = 56,
					type = "button",
					w = 212,
					y = -284,
					x = 203.9,
					normal = {
						path = "res/ui/common/button/sdyjs_btn_02.png"
					},
					touched = {
						path = "res/ui/common/button/sdyjs_btn_02_c.png"
					},
					children = {
						{
							fontSize = 20,
							name = "ferrFeteLb",
							y = 30.9995,
							type = "label",
							x = 39.9985
						},
						{
							fontSize = 28,
							style = "label_warlock",
							name = "freeInfoLb",
							type = "label",
							y = 34.2848,
							x = 124.2843,
							textId = 215038,
							color = color_whi
						}
					}
				}
			}
		},
		{
			y = 0,
			name = "generalNode",
			visible = false,
			type = "node",
			x = 0,
			children = {
				{
					y = -61.8891,
					name = "dyqx_js_di",
					type = "sprite",
					x = -3.3333,
					pic = {
						path = "res/ui/activity/feteHero/dyqx_js_di01.png"
					}
				},
				{
					y = -148.0002,
					name = "heli",
					type = "sprite",
					x = -146.0002,
					pic = {
						path = "res/ui/activity/feteHero/heli.png"
					}
				},
				{
					y = 0,
					name = "rewardList",
					type = "node",
					x = 0,
					children = {
						{
							y = -150.0004,
							name = "rewardIcon1",
							type = "sprite",
							x = -85.0006,
							pic = {
								path = "res/ui/resource/silkroad/sczl_sj_icon.png"
							},
							children = {
								{
									fontSize = 22,
									name = "rewardLb1",
									y = 25,
									type = "label",
									x = 80
								}
							}
						},
						{
							y = -150,
							name = "rewardIcon2",
							type = "sprite",
							x = 45,
							pic = {
								path = "res/ui/resource/silkroad/sczldj_pbjn.png"
							},
							children = {
								{
									fontSize = 22,
									name = "rewardLb2",
									y = 30,
									type = "label",
									x = 80
								},
								{
									y = 56.9994,
									name = "rewardTypeArt",
									type = "sprite",
									x = 81.0015,
									pic = {
										path = "res/ui/activity/feteHero/dyqxxg_word_ewjnjl.png"
									}
								}
							}
						}
					}
				},
				{
					y = 0,
					name = "generalList",
					type = "node",
					x = 0,
					children = {
						{
							y = -30.0012,
							name = "generalRenderer1",
							type = "sprite",
							x = -220,
							pic = {
								path = "res/ui/common/generalPic/generalPic_caocao2.jpg"
							},
							children = {
								{
									y = 36,
									name = "itemBg1",
									type = "sprite",
									x = 36,
									pic = {
										path = "res/ui/activity/feteHero/dyqx_icon_frame_01.png"
									}
								},
								{
									y = 70,
									name = "comboEtc1",
									type = "sprite",
									x = 36,
									pic = {
										path = "res/ui/activity/feteHero/dyqx_word_1.png"
									}
								},
								{
									fontSize = 20,
									name = "generalLb1",
									y = 11.9998,
									type = "label",
									x = 36
								}
							}
						},
						{
							y = -30,
							name = "generalRenderer2",
							type = "sprite",
							x = -70,
							pic = {
								path = "res/ui/common/generalPic/generalPic_caocao2.jpg"
							},
							children = {
								{
									y = 36,
									name = "itemBg2",
									type = "sprite",
									x = 36,
									pic = {
										path = "res/ui/activity/feteHero/dyqx_icon_frame_01.png"
									}
								},
								{
									y = 70,
									name = "comboEtc2",
									type = "sprite",
									x = 36,
									pic = {
										path = "res/ui/activity/feteHero/dyqx_word_1.png"
									}
								},
								{
									fontSize = 20,
									name = "generalLb2",
									y = 11.9998,
									type = "label",
									x = 36
								}
							}
						},
						{
							y = -30,
							name = "generalRenderer3",
							type = "sprite",
							x = 80,
							pic = {
								path = "res/ui/common/generalPic/generalPic_caocao2.jpg"
							},
							children = {
								{
									y = 36,
									name = "itemBg3",
									type = "sprite",
									x = 36,
									pic = {
										path = "res/ui/activity/feteHero/dyqx_icon_frame_01.png"
									}
								},
								{
									y = 70,
									name = "comboEtc3",
									type = "sprite",
									x = 36,
									pic = {
										path = "res/ui/activity/feteHero/dyqx_word_1.png"
									}
								},
								{
									fontSize = 20,
									name = "generalLb3",
									y = 11.9998,
									type = "label",
									x = 36
								}
							}
						},
						{
							y = -30,
							name = "generalRenderer4",
							type = "sprite",
							x = 230,
							pic = {
								path = "res/ui/common/generalPic/generalPic_caocao2.jpg"
							},
							children = {
								{
									y = 36,
									name = "itemBg4",
									type = "sprite",
									x = 36,
									pic = {
										path = "res/ui/activity/feteHero/dyqx_icon_frame_01.png"
									}
								},
								{
									y = 70,
									name = "comboEtc4",
									type = "sprite",
									x = 36,
									pic = {
										path = "res/ui/activity/feteHero/dyqx_word_1.png"
									}
								},
								{
									fontSize = 20,
									name = "generalLb4",
									y = 12,
									type = "label",
									x = 36
								}
							}
						}
					}
				},
				{
					visible = false,
					name = "fangqiBtn",
					h = 56,
					type = "button",
					w = 189,
					y = -230,
					x = -130,
					normal = {
						path = "res/ui/common/button/sdyjs_btn_03.png"
					},
					touched = {
						path = "res/ui/common/button/sdyjs_btn_03_c.png"
					},
					children = {
						{
							fontSize = 24,
							name = "fangqiLb",
							y = 33,
							type = "label",
							x = 94.5,
							textId = 215046
						}
					}
				},
				{
					visible = false,
					name = "yaoqingBtn",
					h = 56,
					type = "button",
					w = 212,
					y = -230,
					x = 150,
					normal = {
						path = "res/ui/common/button/sdyjs_btn_02.png"
					},
					touched = {
						path = "res/ui/common/button/sdyjs_btn_02_c.png"
					},
					children = {
						{
							y = 36.9996,
							name = "icon_gold_4",
							scale = 0.7,
							type = "sprite",
							x = 41.9997,
							pic = {
								path = "res/ui/playerInfo/icon_gold.png"
							}
						},
						{
							fontSize = 20,
							name = "yaoqingBtnLb",
							y = 21.9997,
							type = "label",
							x = 39.9986
						},
						{
							fontSize = 24,
							name = "yaoqingBtnInfoLb",
							y = 34.2848,
							type = "label",
							x = 124.2843,
							textId = 215047
						}
					}
				}
			}
		},
		{
			y = -128.7498,
			name = "bigRewardView",
			visible = false,
			type = "sprite",
			x = -0.0176,
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxbyh_dhk.png"
			},
			children = {
				{
					y = 133,
					name = "halfPic",
					type = "sprite",
					x = 130,
					pic = {
						path = "res/ui/common/halfPic/halfPic_diaochan.png"
					}
				},
				{
					fontSize = 24,
					name = "roleName",
					y = 232.0001,
					type = "label",
					x = 300
				},
				{
					fontSize = 22,
					name = "talkInfo",
					y = 140,
					type = "label",
					x = 500
				},
				{
					name = "rewardBtn",
					h = 62,
					type = "button",
					w = 195,
					y = 45,
					x = 505,
					normal = {
						path = "res/ui/common/button/public_btn_green.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_green_c.png"
					},
					children = {
						{
							fontSize = 24,
							name = "rewardBtnLb",
							style = "label_warlock",
							type = "label",
							y = 35,
							x = 97.5,
							textId = 92013,
							color = color_whi
						}
					}
				}
			}
		}
	}
}

local var_0_1 = {
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
local var_0_2 = {
	[125] = 10041,
	[42] = 5,
	[17] = 7,
	[116] = 55,
	[126] = 10030
}

function var_0_0.showHelpTip(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	log.info("should show tips ")

	local var_2_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_2_0:registerScriptTouchHandler(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == CCTOUCHBEGAN then
			return true
		elseif arg_3_0 == CCTOUCHMOVED then
			return true
		elseif arg_3_0 == CCTOUCHENDED then
			pcall(var_2_0.removeFromParentAndCleanup, var_2_0, true)

			arg_2_0.view.widgets.tipFrame = nil

			return true
		end
	end, false, true)
	var_2_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_2_0, 60000)

	if arg_2_1 then
		local var_2_1 = 0
		local var_2_2 = 0

		if arg_2_0.view == nil then
			arg_2_0.view = {}
		end

		uiutil.initWidgets(arg_2_0.view, var_0_1)
		arg_2_0.view.widgets.tipFrame:setAnchorPoint(ccp(1, 0))
		var_2_0:addChild(arg_2_0.view.widgets.tipFrame)

		local var_2_3, var_2_4 = tool.getPositionInScreen(arg_2_0.view.widgets[arg_2_2])
		local var_2_5 = var_2_3 + 20
		local var_2_6 = var_2_4 + 20

		if arg_2_4 then
			var_2_5 = var_2_5 + arg_2_4.x
			var_2_6 = var_2_6 + arg_2_4.y
		end

		arg_2_0.view.widgets.tipMsg:setString(arg_2_3)

		local var_2_7 = arg_2_0.view.widgets.tipMsg:getContentSize().width
		local var_2_8 = arg_2_0.view.widgets.tipMsg:getContentSize().height

		arg_2_0.view.widgets.tipFrame:setPreferredSize(CCSizeMake(var_2_7 + 30, var_2_8 + 30))
		arg_2_0.view.widgets.tipFrame:setPosition(ccp(var_2_5, var_2_6))
		arg_2_0.view.widgets.tipMsg:setPosition(ccp(15, 15))
		arg_2_0.view.widgets.tipFrame:setVisible(true)
	end
end

function var_0_0.showTips(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	if arg_4_0.view and arg_4_0.view.widgets.tipFrame then
		arg_4_0.view.widgets.tipFrame:removeFromParentAndCleanup(true)

		arg_4_0.view.widgets.tipFrame = nil
	end

	if arg_4_1 then
		local var_4_0 = 0
		local var_4_1 = 0

		if arg_4_0.view == nil then
			arg_4_0.view = {}
		end

		uiutil.initWidgets(arg_4_0.view, var_0_1)
		arg_4_0.view.widgets.tipFrame:setAnchorPoint(ccp(1, 0))
		arg_4_0:addChild(arg_4_0.view.widgets.tipFrame)

		local var_4_2, var_4_3 = tool.getPositionInScreen(arg_4_0.view.widgets[arg_4_2])
		local var_4_4 = var_4_2 + 20
		local var_4_5 = var_4_3 + 20

		if arg_4_4 then
			var_4_4 = var_4_4 + arg_4_4.x
			var_4_5 = var_4_5 + arg_4_4.y
		end

		arg_4_0.view.widgets.tipMsg:setString(arg_4_3)

		local var_4_6 = arg_4_0.view.widgets.tipMsg:getContentSize().width
		local var_4_7 = arg_4_0.view.widgets.tipMsg:getContentSize().height

		arg_4_0.view.widgets.tipFrame:setPreferredSize(CCSizeMake(var_4_6 + 30, var_4_7 + 30))
		arg_4_0.view.widgets.tipFrame:setPosition(ccp(var_4_4, var_4_5))
		arg_4_0.view.widgets.tipMsg:setPosition(ccp(15, 15))
		arg_4_0.view.widgets.tipFrame:setVisible(true)
	end
end

local function var_0_3(arg_5_0)
	if not arg_5_0 or tolua.isnull(arg_5_0) then
		return
	end

	local var_5_0 = CCArray:create()

	var_5_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_5_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_5_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_5_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_5_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_5_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_5_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_5_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_5_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_5_0:addObject(CCDelayTime:create(0.4))

	local var_5_1 = CCSequence:create(var_5_0)

	arg_5_0:stopAllActions()
	arg_5_0:runAction(CCRepeatForever:create(var_5_1))
end

function var_0_0.ctor(arg_6_0, arg_6_1, arg_6_2)
	log.info("@@ 大宴群雄")

	arg_6_0.view = {}

	uiutil.initWidgets(arg_6_0.view, arg_6_0.layout)

	arg_6_0.leftTime = arg_6_0.view.widgets.leftTime

	if arg_6_1 then
		arg_6_0:addChild(arg_6_0.view.widgets.root)
		arg_6_1:addChild(arg_6_0)
	end

	arg_6_0:update(arg_6_2)
end

local var_0_4 = {
	-66,
	170,
	406
}

function var_0_0.update(arg_7_0, arg_7_1)
	arg_7_0.info = arg_7_1
	arg_7_0.giftTips = ""

	local var_7_0 = ""
	local var_7_1 = ""

	if arg_7_1.comboGold then
		arg_7_0.comboGold = arg_7_1.comboGold
	end

	if arg_7_1.specialRewardsGenerals then
		for iter_7_0, iter_7_1 in pairs(arg_7_1.specialRewardsGenerals) do
			local var_7_2 = var_7_0 == "" and "" or "、"

			var_7_0 = var_7_0 .. var_7_2 .. iter_7_1.name
		end
	end

	if arg_7_1.specialRewards and arg_7_1.specialRewards[arg_7_1.day] then
		local var_7_3 = arg_7_1.specialRewards[arg_7_1.day].rewards[1].tips

		arg_7_0.giftTips = language.get(215021, var_7_3, var_7_0)
	end

	arg_7_0.view.widgets.qifenNum:setString(tostring(arg_7_1.lvExp))

	local var_7_4 = 0

	if arg_7_1.lvs then
		for iter_7_2, iter_7_3 in ipairs(arg_7_1.lvs) do
			iter_7_3.currentExp = arg_7_1.lvExp

			if iter_7_2 == 1 then
				iter_7_3.preExp = 0
			else
				iter_7_3.preExp = arg_7_1.lvs[iter_7_2 - 1].exp
			end
		end

		for iter_7_4, iter_7_5 in ipairs(arg_7_1.lvs) do
			local var_7_5 = false

			arg_7_0.view.widgets["iconRenderer" .. iter_7_4]:stopAllActions()
			arg_7_0.view.widgets["iconRenderer" .. iter_7_4]:setPositionX(var_0_4[iter_7_4])

			if iter_7_5.currentExp >= iter_7_5.exp and not iter_7_5.rewarded then
				var_7_5 = true

				var_0_3(arg_7_0.view.widgets["iconRenderer" .. iter_7_4])
			end

			local function var_7_6()
				cmgr.sendRequest(function(arg_9_0)
					local var_9_0 = arg_9_0.action.data

					if var_9_0.rewards then
						local var_9_1 = {}

						for iter_9_0, iter_9_1 in pairs(var_9_0.rewards) do
							if iter_9_1 then
								local var_9_2 = {}

								if iter_9_1.type == 117 or iter_9_1.id == 117 then
									iter_9_1.type = 1005
									iter_9_1.id = 1005
								end

								var_9_2.id = iter_9_1.type or iter_9_1.id
								var_9_2.value = iter_9_1.num or iter_9_1.value

								if var_9_2.value > 0 then
									var_9_2.id = var_0_2[var_9_2.id] or var_9_2.id

									table.insert(var_9_1, var_9_2)
								end
							end
						end

						globalAction_gotResource(var_9_1)
					end

					arg_7_0:refresh()
				end, actions.getLvRewardFeteHero, iter_7_4)
			end

			local function var_7_7(...)
				if var_7_5 then
					var_7_6()
				else
					arg_7_0:showTips(true, "iconRenderer" .. iter_7_4, iter_7_5.tips, ccp(0, -0))
				end
			end

			local function var_7_8(...)
				arg_7_0:showTips(false)
			end

			arg_7_0.view.widgets["expNum" .. iter_7_4]:setString(iter_7_5.exp)
			arg_7_0.view.widgets["iconRenderer" .. iter_7_4]:addHandleOfControlEvent(var_7_7, CCControlEventTouchDown)
			arg_7_0.view.widgets["iconRenderer" .. iter_7_4]:addHandleOfControlEvent(var_7_8, CCControlEventTouchUpInside)
			arg_7_0.view.widgets["iconRenderer" .. iter_7_4]:addHandleOfControlEvent(var_7_8, CCControlEventTouchUpOutside)

			local var_7_9 = (iter_7_5.currentExp - iter_7_5.preExp) / (iter_7_5.exp - iter_7_5.preExp)

			if var_7_9 > 1 then
				var_7_9 = 1
			end

			local var_7_10 = var_7_9 * 100 / 3

			if var_7_10 > 0 then
				var_7_4 = var_7_4 + var_7_10
			end
		end
	end

	arg_7_0.view.widgets.pro:setPercentage(var_7_4)
	arg_7_0.view.widgets.goldFeteBtnLb:setString(arg_7_1.grandBqtGold)
	arg_7_0.view.widgets.ferrFeteLb:setString(language.get(215035, arg_7_1.freeGrandBqtNum))

	if arg_7_1.freeGrandBqtNum > 0 then
		arg_7_0.view.widgets.freeFeteBtn:setVisible(true)
		arg_7_0.view.widgets.goldFeteBtn:setVisible(false)
	else
		arg_7_0.view.widgets.freeFeteBtn:setVisible(false)
		arg_7_0.view.widgets.goldFeteBtn:setVisible(true)
	end

	if not arg_7_1.freeIvtNum or arg_7_1.freeIvtNum <= 0 then
		arg_7_0.view.widgets.icon_gold:setVisible(true)
		arg_7_0.view.widgets.feteBtnGold:setString(arg_7_1.ivtGold)
	else
		arg_7_0.view.widgets.icon_gold:setVisible(false)
		arg_7_0.view.widgets.feteBtnGold:setString("x" .. arg_7_1.freeIvtNum)
	end

	if arg_7_1.specialRewards and arg_7_1.specialRewards[arg_7_1.day] and arg_7_1.specialRewards[arg_7_1.day].rewards then
		arg_7_0.view.widgets.hasBg:setVisible(arg_7_1.specialRewards[arg_7_1.day].received)
	end

	if arg_7_1.bqtType and arg_7_1.bqtType > 0 then
		arg_7_0:feteUpdate(arg_7_1)
	end
end

function var_0_0.feteUpdate(arg_12_0, arg_12_1)
	arg_12_0.view.widgets.syNode:setVisible(true)
	arg_12_0.view.widgets.generalNode:setVisible(true)
	arg_12_0.view.widgets.fangqiBtn:setVisible(false)
	arg_12_0.view.widgets.yaoqingBtn:setVisible(false)

	if arg_12_1.comboType == 3 then
		arg_12_0:resetReward()
		arg_12_0:resetGenral()
		arg_12_0.view.widgets.syNode:setVisible(false)
		arg_12_0.view.widgets.fangqiBtn:setVisible(true)
		arg_12_0.view.widgets.yaoqingBtn:setVisible(true)
	elseif arg_12_1.comboType == 2 then
		if arg_12_0.info.specialRewardsGenerals and arg_12_0.info.specialRewardsGenerals[1] then
			local var_12_0 = arg_12_0.info.specialRewardsGenerals[1]

			arg_12_0.view.widgets.roleName:setString(var_12_0.name)
			arg_12_0.view.widgets.talkInfo:setString(language.get(215048))
			arg_12_0.view.widgets.halfPic:setDisplayFrame(CCSprite:create("res/ui/common/halfPic/halfPic_" .. var_12_0.pic .. ".png"):displayFrame())
			arg_12_0.view.widgets.bigRewardView:setVisible(true)
		end
	else
		arg_12_0:resetReward()
		arg_12_0:resetGenral()
	end

	if arg_12_1.comboGold then
		arg_12_0.comboGold = arg_12_1.comboGold
	end

	if arg_12_0.comboGold then
		arg_12_0.view.widgets.yaoqingBtnLb:setString(arg_12_0.comboGold)
	end

	if arg_12_1.generals then
		for iter_12_0, iter_12_1 in ipairs(arg_12_1.generals) do
			if iter_12_1.combo and arg_12_1.rewards then
				arg_12_0.view.widgets["comboEtc" .. iter_12_0]:setVisible(true)
			else
				arg_12_0.view.widgets["comboEtc" .. iter_12_0]:setVisible(false)
			end

			arg_12_0.view.widgets["itemBg" .. iter_12_0]:setDisplayFrame(CCSprite:create("res/ui/activity/feteHero/dyqx_icon_frame_0" .. iter_12_1.quality .. ".png"):displayFrame())
			arg_12_0.view.widgets["comboEtc" .. iter_12_0]:setDisplayFrame(CCSprite:create("res/ui/activity/feteHero/dyqx_word_" .. iter_12_1.quality .. ".png"):displayFrame())
			arg_12_0.view.widgets["generalLb" .. iter_12_0]:setString(iter_12_1.name)
			arg_12_0.view.widgets["generalRenderer" .. iter_12_0]:setDisplayFrame(CCSprite:create("res/ui/common/generalPic/generalPic_" .. iter_12_1.pic .. ".jpg"):displayFrame())

			if iter_12_1.missing then
				arg_12_0.view.widgets["generalRenderer" .. iter_12_0]:setOpacity(50)
			else
				arg_12_0.view.widgets["generalRenderer" .. iter_12_0]:setOpacity(255)
			end

			arg_12_0.view.widgets["generalRenderer" .. iter_12_0]:setVisible(true)
		end

		if #arg_12_1.generals == 3 then
			arg_12_0.view.widgets.generalList:setPosition(ccp(80, 0))
		else
			arg_12_0.view.widgets.generalList:setPosition(ccp(0, 0))
		end
	end

	if arg_12_1.rewards then
		local var_12_1 = {}

		for iter_12_2, iter_12_3 in pairs(arg_12_1.rewards) do
			if iter_12_3 then
				local var_12_2 = {
					id = iter_12_3.type or iter_12_3.id,
					value = iter_12_3.num or iter_12_3.value
				}

				if var_12_2.id == 116 then
					arg_12_0.view.widgets.rewardIcon1:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/sczl_sj_icon.png"):displayFrame())
					arg_12_0.view.widgets.rewardIcon1:setVisible(true)
					arg_12_0.view.widgets.rewardLb1:setString(var_12_2.value)
				elseif var_12_2.id == 17 then
					arg_12_0.view.widgets.rewardTypeArt:setDisplayFrame(CCSprite:create("res/ui/activity/gemsActivity/new/gem_a1.png"):displayFrame())
					arg_12_0.view.widgets.rewardIcon2:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/sczl_sj_icon.png"):displayFrame())
					arg_12_0.view.widgets.rewardIcon2:setVisible(true)
					arg_12_0.view.widgets.rewardLb2:setString(var_12_2.value)
				elseif var_12_2.id == 126 then
					arg_12_0.view.widgets.rewardTypeArt:setDisplayFrame(CCSprite:create("res/ui/activity/feteHero/dyqxxg_word_ewjnjl.png"):displayFrame())
					arg_12_0.view.widgets.rewardIcon2:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/sczldj_pbjn.png"):displayFrame())
					arg_12_0.view.widgets.rewardIcon2:setVisible(true)
					arg_12_0.view.widgets.rewardLb2:setString(var_12_2.value)
				end

				if var_12_2.value > 0 then
					var_12_2.id = var_0_2[var_12_2.id] or var_12_2.id

					table.insert(var_12_1, var_12_2)
				end
			end
		end

		if arg_12_1.lvExpUp and arg_12_1.lvExpUp > 0 then
			local var_12_3 = {}

			var_12_3.id = 50001
			var_12_3.value = arg_12_1.lvExpUp

			table.insert(var_12_1, var_12_3)
		end

		globalAction_gotResource(var_12_1)
	end
end

function var_0_0.resetGenral(arg_13_0)
	for iter_13_0 = 1, 4 do
		arg_13_0.view.widgets["comboEtc" .. iter_13_0]:setVisible(false)
		arg_13_0.view.widgets["generalRenderer" .. iter_13_0]:setVisible(false)
	end
end

function var_0_0.resetReward(arg_14_0)
	for iter_14_0 = 1, 2 do
		arg_14_0.view.widgets["rewardIcon" .. iter_14_0]:setVisible(false)
	end
end

function var_0_0.runFete(arg_15_0, arg_15_1)
	local function var_15_0(arg_16_0)
		arg_15_0:feteUpdate(arg_16_0.action.data)
		arg_15_0:refresh()
	end

	local var_15_1 = ""
	local var_15_2 = 0
	local var_15_3 = ""

	if arg_15_1 == 1 or arg_15_1 == 2 and arg_15_0.info.freeGrandBqtNum > 0 then
		if arg_15_0.info.freeIvtNum > 0 or arg_15_0.info.freeGrandBqtNum then
			cmgr.sendRequest(var_15_0, actions.feteHeroGetReward, arg_15_1)

			return
		end

		var_15_1 = "entertainWarlordIvt"

		local var_15_4 = arg_15_0.info.ivtGold

		var_15_3 = language.get(215040, var_15_4)
	else
		var_15_1 = "entertainWarlordGrandBqt"

		local var_15_5 = arg_15_0.info.grandBqtGold

		var_15_3 = language.get(215041, var_15_5)
	end

	messageBox.showChargeWin("", var_15_3, var_15_1, function()
		cmgr.sendRequest(var_15_0, actions.feteHeroGetReward, arg_15_1)
	end)
end

function var_0_0.feteHeroBuyCombo(arg_18_0, arg_18_1)
	local function var_18_0(arg_19_0)
		arg_18_0:feteUpdate(arg_19_0.action.data)
		arg_18_0:refresh()
	end

	if not arg_18_1 then
		messageBox.showChargeWin("", language.get(215045, arg_18_0.comboGold), "entertainWarlordBuyCombo", function()
			cmgr.sendRequest(var_18_0, actions.feteHeroBuyCombo, false)
		end)
	else
		cmgr.sendRequest(var_18_0, actions.feteHeroBuyCombo, true)
	end
end

function var_0_0.refresh(arg_21_0)
	cmgr.sendRequest(function(arg_22_0)
		arg_21_0:update(arg_22_0.action.data)
	end, actions.getDYQX)
end

function var_0_0.onEnter(arg_23_0)
	local function var_23_0()
		cmgr.sendRequest(function(arg_25_0)
			local var_25_0 = arg_25_0.action.data

			if arg_23_0.info.specialRewards and arg_23_0.info.specialRewards[var_25_0.day] then
				local var_25_1 = arg_23_0.info.specialRewards[var_25_0.day].rewards

				if var_25_1 then
					local var_25_2 = {}

					for iter_25_0, iter_25_1 in pairs(var_25_1) do
						if iter_25_1 then
							local var_25_3 = {
								id = iter_25_1.type or iter_25_1.id,
								value = iter_25_1.num or iter_25_1.value
							}

							if var_25_3.value > 0 then
								var_25_3.id = var_0_2[var_25_3.id] or var_25_3.id

								table.insert(var_25_2, var_25_3)
							end
						end
					end

					globalAction_gotResource(var_25_2)
				end
			end

			arg_23_0.view.widgets.bigRewardView:setVisible(false)
			arg_23_0:refresh()
		end, actions.feteHeroGetSpecialRewards)
	end

	local function var_23_1()
		arg_23_0:runFete(1)
	end

	local function var_23_2(...)
		arg_23_0:feteHeroBuyCombo(true)
	end

	local function var_23_3(...)
		arg_23_0:feteHeroBuyCombo(false)
	end

	local function var_23_4(...)
		arg_23_0:runFete(2)
	end

	local function var_23_5(...)
		rankInfoUI.show()
	end

	local function var_23_6(...)
		arg_23_0:showTips(true, "giftBtn", arg_23_0.giftTips, ccp(205, -160))
	end

	local function var_23_7(...)
		arg_23_0:showTips(false)
	end

	arg_23_0.view.widgets.rewardBtn:addHandleOfControlEvent(var_23_0, CCControlEventTouchDown)
	arg_23_0.view.widgets.feteBtn:addHandleOfControlEvent(var_23_1, CCControlEventTouchDown)
	arg_23_0.view.widgets.goldFeteBtn:addHandleOfControlEvent(var_23_4, CCControlEventTouchDown)
	arg_23_0.view.widgets.freeFeteBtn:addHandleOfControlEvent(var_23_4, CCControlEventTouchDown)
	arg_23_0.view.widgets.fangqiBtn:addHandleOfControlEvent(var_23_2, CCControlEventTouchDown)
	arg_23_0.view.widgets.yaoqingBtn:addHandleOfControlEvent(var_23_3, CCControlEventTouchDown)
	arg_23_0.view.widgets.gotoRankBtn:addHandleOfControlEvent(var_23_5, CCControlEventTouchDown)
	arg_23_0.view.widgets.giftBtn:addHandleOfControlEvent(var_23_6, CCControlEventTouchDown)
	arg_23_0.view.widgets.giftBtn:addHandleOfControlEvent(var_23_7, CCControlEventTouchUpInside)
	arg_23_0.view.widgets.giftBtn:addHandleOfControlEvent(var_23_7, CCControlEventTouchUpOutside)
	arg_23_0.view.widgets.helpBtn:addHandleOfControlEvent(function()
		arg_23_0:showHelpTip(true, "helpBtn", language.get(215036), ccp(-50, -500))
	end, CCControlEventTouchUpInside)
end

function var_0_0.onExit(arg_34_0)
	return
end

return var_0_0
