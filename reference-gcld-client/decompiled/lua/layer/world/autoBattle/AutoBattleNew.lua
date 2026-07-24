local var_0_0 = require("res/native/offset").get("layer.world.autoBattleNew")
local var_0_1 = {
	[62] = {
		pic = "ttq_btn_icon_jh.png",
		txt = "ttq_word_jh.png"
	},
	[63] = {
		pic = "ttq_btn_icon_fb.png",
		txt = "ttq_word_fb.png"
	},
	[65] = {
		pic = "ttq_btn_icon_yc.png",
		txt = "ttq_word_yc.png"
	}
}
local var_0_2 = tool.hexToRgb("#D9EDC5")
local var_0_3 = ccc3(0, 180, 0)
local var_0_4 = colorQuality[5]
local var_0_5 = colorQuality[4]
local var_0_6 = colorQuality[2]
local var_0_7 = class("AutoBattle", function()
	return createBaseLayer()
end)

var_0_7.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			name = "bg",
			type = "sprite9",
			preferedSize = CCSizeMake(780, 360),
			middleRect = CCRectMake(300, 150, 179, 56),
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 + 40,
			pic = {
				path = "res/ui/world/autoBattle/zdgz_view_bg.png"
			},
			children = {
				{
					y = 213,
					x = 390,
					type = "sprite",
					pic = {
						path = "res/ui/world/autoBattle/xz_lbl_d.png"
					}
				},
				{
					fontSize = 20,
					name = "lbl_info",
					y = 257,
					type = "label",
					x = 390
				},
				{
					y = 200,
					name = "generalBg1",
					type = "sprite",
					x = 240,
					pic = {
						frame = true,
						path = "general_background_light.png"
					},
					children = {
						{
							y = 41,
							name = "generalHead1",
							type = "sprite",
							x = 41,
							pic = {
								path = "res/ui/common/generalPic/generalPic_0.jpg"
							}
						},
						{
							y = 66,
							type = "sprite",
							x = 16,
							pic = {
								frame = true,
								path = "conveneGouBg.png"
							},
							children = {
								{
									y = 12,
									name = "generalGou1",
									type = "sprite",
									x = 12,
									pic = {
										frame = true,
										path = "conveneGou.png"
									}
								}
							}
						},
						{
							type = "node",
							name = "node_buff1",
							y = 0,
							visible = false,
							x = 0,
							children = {
								{
									y = 16,
									x = 16,
									type = "sprite",
									scale = 0.4,
									pic = {
										path = "res/ui/resourceArea2/zcgz_btn_round.png"
									}
								},
								{
									x = 16,
									name = "icon_buff1",
									y = 16,
									type = "sprite",
									scale = 0.6,
									pic = {
										path = "res/ui/world/farm/ttq_btn_icon_jh.png"
									}
								},
								{
									x = 54,
									name = "txt_buff1",
									y = 16,
									type = "sprite",
									scale = 0.8,
									pic = {
										path = "res/ui/world/farm/ttq_word_jh.png"
									}
								}
							}
						}
					}
				},
				{
					y = 200,
					name = "generalBg2",
					type = "sprite",
					x = 340,
					pic = {
						frame = true,
						path = "general_background_light.png"
					},
					children = {
						{
							y = 41,
							name = "generalHead2",
							type = "sprite",
							x = 41,
							pic = {
								path = "res/ui/common/generalPic/generalPic_0.jpg"
							}
						},
						{
							y = 66,
							type = "sprite",
							x = 16,
							pic = {
								frame = true,
								path = "conveneGouBg.png"
							},
							children = {
								{
									y = 12,
									name = "generalGou2",
									type = "sprite",
									x = 12,
									pic = {
										frame = true,
										path = "conveneGou.png"
									}
								}
							}
						},
						{
							type = "node",
							name = "node_buff2",
							y = 0,
							visible = false,
							x = 0,
							children = {
								{
									y = 16,
									x = 16,
									type = "sprite",
									scale = 0.4,
									pic = {
										path = "res/ui/resourceArea2/zcgz_btn_round.png"
									}
								},
								{
									x = 16,
									name = "icon_buff2",
									y = 16,
									type = "sprite",
									scale = 0.6,
									pic = {
										path = "res/ui/world/farm/ttq_btn_icon_jh.png"
									}
								},
								{
									x = 54,
									name = "txt_buff2",
									y = 16,
									type = "sprite",
									scale = 0.8,
									pic = {
										path = "res/ui/world/farm/ttq_word_jh.png"
									}
								}
							}
						}
					}
				},
				{
					y = 200,
					name = "generalBg3",
					type = "sprite",
					x = 440,
					pic = {
						frame = true,
						path = "general_background_light.png"
					},
					children = {
						{
							y = 41,
							name = "generalHead3",
							type = "sprite",
							x = 41,
							pic = {
								path = "res/ui/common/generalPic/generalPic_0.jpg"
							}
						},
						{
							y = 66,
							type = "sprite",
							x = 16,
							pic = {
								frame = true,
								path = "conveneGouBg.png"
							},
							children = {
								{
									y = 12,
									name = "generalGou3",
									type = "sprite",
									x = 12,
									pic = {
										frame = true,
										path = "conveneGou.png"
									}
								}
							}
						},
						{
							type = "node",
							name = "node_buff3",
							y = 0,
							visible = false,
							x = 0,
							children = {
								{
									y = 16,
									x = 16,
									type = "sprite",
									scale = 0.4,
									pic = {
										path = "res/ui/resourceArea2/zcgz_btn_round.png"
									}
								},
								{
									x = 16,
									name = "icon_buff3",
									y = 16,
									type = "sprite",
									scale = 0.6,
									pic = {
										path = "res/ui/world/farm/ttq_btn_icon_jh.png"
									}
								},
								{
									x = 54,
									name = "txt_buff3",
									y = 16,
									type = "sprite",
									scale = 0.8,
									pic = {
										path = "res/ui/world/farm/ttq_word_jh.png"
									}
								}
							}
						}
					}
				},
				{
					y = 200,
					name = "generalBg4",
					type = "sprite",
					x = 540,
					pic = {
						frame = true,
						path = "general_background_light.png"
					},
					children = {
						{
							y = 41,
							name = "generalHead4",
							type = "sprite",
							x = 41,
							pic = {
								path = "res/ui/common/generalPic/generalPic_0.jpg"
							}
						},
						{
							y = 66,
							type = "sprite",
							x = 16,
							pic = {
								frame = true,
								path = "conveneGouBg.png"
							},
							children = {
								{
									y = 12,
									name = "generalGou4",
									type = "sprite",
									x = 12,
									pic = {
										frame = true,
										path = "conveneGou.png"
									}
								}
							}
						},
						{
							type = "node",
							name = "node_buff4",
							y = 0,
							visible = false,
							x = 0,
							children = {
								{
									y = 16,
									x = 16,
									type = "sprite",
									scale = 0.4,
									pic = {
										path = "res/ui/resourceArea2/zcgz_btn_round.png"
									}
								},
								{
									x = 16,
									name = "icon_buff4",
									y = 16,
									type = "sprite",
									scale = 0.6,
									pic = {
										path = "res/ui/world/farm/ttq_btn_icon_jh.png"
									}
								},
								{
									x = 54,
									name = "txt_buff4",
									y = 16,
									type = "sprite",
									scale = 0.8,
									pic = {
										path = "res/ui/world/farm/ttq_word_jh.png"
									}
								}
							}
						}
					}
				},
				{
					y = 200,
					name = "generalBg5",
					type = "sprite",
					x = 640,
					pic = {
						frame = true,
						path = "general_background_light.png"
					},
					children = {
						{
							y = 41,
							name = "generalHead5",
							type = "sprite",
							x = 41,
							pic = {
								path = "res/ui/common/generalPic/generalPic_0.jpg"
							}
						},
						{
							y = 66,
							type = "sprite",
							x = 16,
							pic = {
								frame = true,
								path = "conveneGouBg.png"
							},
							children = {
								{
									y = 12,
									name = "generalGou5",
									type = "sprite",
									x = 12,
									pic = {
										frame = true,
										path = "conveneGou.png"
									}
								}
							}
						},
						{
							type = "node",
							name = "node_buff5",
							y = 0,
							visible = false,
							x = 0,
							children = {
								{
									y = 16,
									x = 16,
									type = "sprite",
									scale = 0.4,
									pic = {
										path = "res/ui/resourceArea2/zcgz_btn_round.png"
									}
								},
								{
									x = 16,
									name = "icon_buff5",
									y = 16,
									type = "sprite",
									scale = 0.6,
									pic = {
										path = "res/ui/world/farm/ttq_btn_icon_jh.png"
									}
								},
								{
									x = 54,
									name = "txt_buff5",
									y = 16,
									type = "sprite",
									scale = 0.8,
									pic = {
										path = "res/ui/world/farm/ttq_word_jh.png"
									}
								}
							}
						}
					}
				},
				{
					y = 0,
					name = "node_farm",
					type = "node",
					x = 0,
					children = {
						{
							name = "btn_farm0",
							h = 93,
							type = "button",
							w = 100,
							y = 80,
							visible = false,
							x = 390.0001,
							normal = {
								path = "res/ui/world/farm/ttq_btn_lb.png"
							},
							touched = {
								path = "res/ui/world/farm/ttq_btn_lb_c.png"
							},
							disable = {
								path = "res/ui/world/farm/ttq_btn_lb_g.png"
							},
							children = {
								{
									fontSize = 20,
									name = "num0",
									y = 30,
									type = "label",
									x = 85,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							name = "btn_farm1",
							h = 72,
							type = "button",
							w = 73,
							y = 85,
							visible = false,
							x = 260,
							normal = {
								path = "res/ui/resourceArea2/zcgz_btn_round.png"
							},
							touched = {
								path = "res/ui/resourceArea2/zcgz_btn_round_c.png"
							},
							disable = {
								path = "res/ui/resourceArea2/zcgz_btn_round_g.png"
							},
							children = {
								{
									y = 36,
									name = "btn_farm_icon1",
									type = "sprite",
									x = 36,
									pic = {
										path = "res/ui/world/farm/ttq_btn_icon_jh.png"
									}
								},
								{
									y = 0,
									x = 36,
									type = "sprite",
									pic = {
										path = "res/ui/world/farm/ttq_word_jh.png"
									}
								},
								{
									fontSize = 20,
									name = "num1",
									y = 15,
									type = "label",
									x = 70,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							name = "btn_farm2",
							h = 72,
							type = "button",
							w = 73,
							y = 85,
							visible = false,
							x = 390,
							normal = {
								path = "res/ui/resourceArea2/zcgz_btn_round.png"
							},
							touched = {
								path = "res/ui/resourceArea2/zcgz_btn_round_c.png"
							},
							disable = {
								path = "res/ui/resourceArea2/zcgz_btn_round_g.png"
							},
							children = {
								{
									y = 36,
									name = "btn_farm_icon2",
									type = "sprite",
									x = 36,
									pic = {
										path = "res/ui/world/farm/ttq_btn_icon_fb.png"
									}
								},
								{
									y = 0,
									x = 36,
									type = "sprite",
									pic = {
										path = "res/ui/world/farm/ttq_word_fb.png"
									}
								},
								{
									fontSize = 20,
									name = "num2",
									y = 15,
									type = "label",
									x = 70,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							name = "btn_farm3",
							h = 72,
							type = "button",
							w = 73,
							y = 85,
							visible = false,
							x = 520,
							normal = {
								path = "res/ui/resourceArea2/zcgz_btn_round.png"
							},
							touched = {
								path = "res/ui/resourceArea2/zcgz_btn_round_c.png"
							},
							disable = {
								path = "res/ui/resourceArea2/zcgz_btn_round_g.png"
							},
							children = {
								{
									y = 36,
									name = "btn_farm_icon3",
									type = "sprite",
									x = 36,
									pic = {
										path = "res/ui/world/farm/ttq_btn_icon_yc.png"
									}
								},
								{
									y = 0,
									x = 36,
									type = "sprite",
									pic = {
										path = "res/ui/world/farm/ttq_word_yc.png"
									}
								},
								{
									fontSize = 20,
									name = "num3",
									y = 15,
									type = "label",
									x = 70,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							fontSize = 20,
							y = 20,
							type = "label",
							x = 395,
							textId = 421022
						}
					}
				},
				{
					w = 42,
					name = "tokenCheckBox",
					h = 39,
					type = "button",
					y = -25,
					x = 80,
					normal = {
						frame = true,
						path = "btn_check_1_a.png"
					},
					touched = {
						frame = true,
						path = "btn_check_1_on.png"
					}
				},
				{
					fontSize = 20,
					style = "label_warlock",
					y = -25,
					type = "label",
					x = 105,
					textId = 420004,
					color = var_0_5,
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = -25,
					name = "tokenCheckBox2",
					h = 39,
					type = "button",
					w = 42,
					visible = false,
					x = 360,
					normal = {
						frame = true,
						path = "btn_check_1_a.png"
					},
					touched = {
						frame = true,
						path = "btn_check_1_on.png"
					}
				},
				{
					fontSize = 20,
					visible = false,
					type = "label",
					textId = 421030,
					style = "label_warlock",
					y = -25,
					x = 385,
					color = var_0_5,
					anchorPoint = ccp(0, 0.5)
				},
				{
					w = 42,
					name = "tokenCheckBox3",
					h = 39,
					type = "button",
					y = -25,
					x = 360,
					normal = {
						frame = true,
						path = "btn_check_1_a.png"
					},
					touched = {
						frame = true,
						path = "btn_check_1_on.png"
					}
				},
				{
					fontSize = 20,
					style = "label_warlock",
					y = -25,
					type = "label",
					x = 385,
					textId = 421035,
					color = var_0_5,
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = -80,
					name = "leftButton",
					h = 62,
					type = "button",
					w = 190,
					visible = false,
					x = 290,
					normal = {
						path = "res/ui/common/button/public_btn_green.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_green_c.png"
					},
					children = {
						{
							fontSize = 25,
							name = "lbl_leftBtn",
							y = 33,
							type = "label",
							x = 95
						}
					}
				},
				{
					name = "rightButton",
					h = 62,
					type = "button",
					w = 190,
					y = -80,
					visible = false,
					x = 490,
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
							x = 95,
							textId = 420002
						}
					}
				},
				{
					y = -80,
					name = "fightButton",
					h = 62,
					type = "button",
					w = 190,
					visible = false,
					x = 390,
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
							x = 95,
							textId = 421014
						}
					}
				},
				{
					x = 660,
					name = "closeButton",
					h = 33,
					type = "button",
					w = 32,
					y = 370,
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
					type = "sprite",
					name = "endJianshou",
					y = 75,
					visible = false,
					x = 390,
					pic = {
						path = "res/ui/world/autoBattle/zdgz_end_js.png"
					}
				},
				{
					type = "sprite",
					name = "endXuezhan",
					y = 75,
					visible = false,
					x = 388,
					pic = {
						path = "res/ui/world/autoBattle/zdgz_end_xzjs.png"
					}
				},
				{
					type = "node",
					name = "node_lose",
					y = 320,
					visible = false,
					x = 370,
					children = {
						{
							x = 0,
							name = "bg_icon1",
							y = 0,
							type = "sprite",
							scale = 0.7,
							pic = {
								path = "res/ui/resourceArea2/zcgz_btn_round.png"
							}
						},
						{
							y = 0,
							name = "icon1",
							type = "sprite",
							x = 0,
							pic = {
								path = "res/ui/world/autoBattle/zdgz_icon_bl.png"
							}
						},
						{
							fontSize = 25,
							name = "lostLabel",
							y = 0,
							type = "label",
							x = 30,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					type = "node",
					name = "node_exp",
					y = 320,
					visible = false,
					x = 500,
					children = {
						{
							x = 0,
							name = "bg_icon2",
							y = 0,
							type = "sprite",
							scale = 0.7,
							pic = {
								path = "res/ui/resourceArea2/zcgz_btn_round.png"
							}
						},
						{
							y = -4,
							x = -0.0001,
							type = "sprite",
							scale = 0.8,
							pic = {
								path = "res/ui/task/get_icon_exp.png"
							}
						},
						{
							fontSize = 25,
							name = "expLabel",
							y = 0,
							type = "label",
							x = 30,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					y = 320,
					name = "reportNode",
					x = 270,
					type = "node"
				},
				{
					y = 328,
					name = "btn_mode1",
					h = 102,
					type = "button",
					w = 100,
					visible = false,
					x = 75,
					normal = {
						path = "res/ui/world/autoBattle/zdzd_btn01.png"
					},
					touched = {
						path = "res/ui/world/autoBattle/zdzd_btn01_c.png"
					},
					children = {
						{
							y = 60,
							x = 50,
							type = "sprite",
							pic = {
								path = "res/ui/world/autoBattle/zdzd_btn_word_gj.png"
							}
						}
					}
				},
				{
					name = "btn_mode2",
					h = 102,
					type = "button",
					w = 100,
					y = 322,
					visible = false,
					x = 165,
					normal = {
						path = "res/ui/world/autoBattle/zdzd_btn02.png"
					},
					touched = {
						path = "res/ui/world/autoBattle/zdzd_btn02_c.png"
					},
					disable = {
						path = "res/ui/world/autoBattle/zdzd_btn02_g.png"
					},
					children = {
						{
							y = 60,
							x = 50,
							type = "sprite",
							pic = {
								path = "res/ui/world/autoBattle/zdzd_btn_word_sc.png"
							}
						}
					}
				}
			}
		}
	}
}
var_0_7.STATE = {}
var_0_7.STATE.BEFORE_BATTLE = 1
var_0_7.STATE.IN_BATTLE = 2
var_0_7.STATE.AFTER_BATTLE = 3

function var_0_7.ctor(arg_2_0, arg_2_1)
	arg_2_0.view = {}

	uiutil.initWidgets(arg_2_0.view, arg_2_0.layout)
	arg_2_0:addChild(arg_2_0.view.widgets.root)
	swallowTouch(arg_2_0)

	local var_2_0 = smgr.getLayer("topLayer")

	var_2_0:removeAllChildrenWithCleanup(true)
	var_2_0:addChild(arg_2_0)

	arg_2_0.cityId = arg_2_1.cityId
	arg_2_0.anim = arg_2_1.anim
	arg_2_0.state = arg_2_1.state
	arg_2_0.response = arg_2_1.response
	arg_2_0.cityIsOurs = arg_2_1.cityIsOurs

	arg_2_0.view.widgets.closeButton:addHandleOfControlEvent(function()
		log.info("closeButton")
		arg_2_0:onCloseButtonClick()
	end, CCControlEventTouchUpInside)
	arg_2_0.view.widgets.tokenCheckBox:addHandleOfControlEvent(function()
		log.info("tokenCheckBox")
		arg_2_0:onTokenCheckBoxClick()
	end, CCControlEventTouchUpInside)
	arg_2_0.view.widgets.tokenCheckBox2:addHandleOfControlEvent(function()
		log.info("tokenCheckBox2")
		arg_2_0:onTokenCheckBoxClick2()
	end, CCControlEventTouchUpInside)
	arg_2_0.view.widgets.tokenCheckBox3:addHandleOfControlEvent(function()
		log.info("tokenCheckBox3")
		arg_2_0:onTokenCheckBoxClick3()
	end, CCControlEventTouchUpInside)
	arg_2_0.view.widgets.leftButton:addHandleOfControlEvent(function()
		log.info("leftButton")
		arg_2_0:onLeftButtonClick()
	end, CCControlEventTouchUpInside)
	arg_2_0.view.widgets.rightButton:addHandleOfControlEvent(function()
		log.info("rightButton")
		arg_2_0:onRightButtonClick()
	end, CCControlEventTouchUpInside)
	arg_2_0.view.widgets.fightButton:addHandleOfControlEvent(function()
		log.info("fightButton")
		arg_2_0:onFightButtonClick()
	end, CCControlEventTouchUpInside)

	for iter_2_0 = 0, 3 do
		arg_2_0.view.widgets["btn_farm" .. iter_2_0]:addHandleOfControlEvent(function()
			log.info("btn_farm%s", iter_2_0)
			arg_2_0:onFarmGetReward(iter_2_0)
		end, CCControlEventTouchUpInside)
	end

	for iter_2_1 = 1, 2 do
		arg_2_0.view.widgets["btn_mode" .. iter_2_1]:addHandleOfControlEvent(function()
			log.info("btn_mode%s", iter_2_1)

			if iter_2_1 == 1 then
				arg_2_0.view.widgets.btn_mode1:setPositionY(328)
				arg_2_0.view.widgets.btn_mode2:setPositionY(322)
				arg_2_0.view.widgets.bg:setColor(var_0_2)
			else
				arg_2_0.view.widgets.btn_mode1:setPositionY(322)
				arg_2_0.view.widgets.btn_mode2:setPositionY(328)
				arg_2_0.view.widgets.bg:setColor(var_0_4)
			end

			arg_2_0:onChangeMode(iter_2_1)
		end, CCControlEventTouchUpInside)
	end

	arg_2_0:setVisible(false)

	if arg_2_0.anim then
		arg_2_0.view.widgets.bg:setScale(0)
		arg_2_0.view.widgets.bg:setPosition(ccp(0, visibleSize.height / 2 + 40))

		local var_2_1 = CCScaleTo:create(1, 1)
		local var_2_2 = CCMoveTo:create(1, ccp(visibleSize.width / 2, visibleSize.height / 2 + 40))

		arg_2_0.view.widgets.bg:runAction(var_2_1)
		arg_2_0.view.widgets.bg:runAction(var_2_2)
	end

	arg_2_0:getAutoBattleSimpleInfo()
	arg_2_0:getFarmInfo()
end

function var_0_7.init(arg_12_0)
	arg_12_0.generalInfoTable = {}

	local var_12_0 = 0

	for iter_12_0 = 1, 5 do
		local var_12_1 = arg_12_0.generalMilitary[iter_12_0]

		if var_12_1 == nil then
			arg_12_0.view.widgets["generalBg" .. iter_12_0]:setVisible(false)
		else
			arg_12_0.generalInfoTable[iter_12_0] = {}
			arg_12_0.generalInfoTable[iter_12_0].gid = var_12_1.generalId or var_12_1.gid
			arg_12_0.generalInfoTable[iter_12_0].check = true

			arg_12_0.view.widgets["generalBg" .. iter_12_0]:setVisible(true)
			arg_12_0.view.widgets["generalHead" .. iter_12_0]:setDisplayFrame(CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", var_12_1.pic)):displayFrame())

			local var_12_2 = var_0_1[var_12_1.extraBuffId]

			if var_12_2 and var_12_1.buffCd and var_12_1.buffCd > 0 then
				arg_12_0.view.widgets["icon_buff" .. iter_12_0]:setDisplayFrame(CCSprite:create("res/ui/world/farm/" .. var_12_2.pic):displayFrame())
				arg_12_0.view.widgets["txt_buff" .. iter_12_0]:setDisplayFrame(CCSprite:create("res/ui/world/farm/" .. var_12_2.txt):displayFrame())
				arg_12_0.view.widgets["node_buff" .. iter_12_0]:setVisible(true)
			else
				arg_12_0.view.widgets["node_buff" .. iter_12_0]:setVisible(false)
			end

			var_12_0 = var_12_0 + 1
		end
	end

	if #arg_12_0.generalMilitary >= 5 then
		for iter_12_1 = 1, 5 do
			arg_12_0.view.widgets["generalBg" .. iter_12_1]:setPosition(ccp(75 + iter_12_1 * 100, 200))
		end
	end

	if arg_12_0.state == var_0_7.STATE.BEFORE_BATTLE then
		arg_12_0.view.widgets.leftButton:setVisible(false)
		arg_12_0.view.widgets.rightButton:setVisible(false)
		arg_12_0.view.widgets.fightButton:setVisible(true)
		arg_12_0.view.widgets.node_lose:setVisible(false)
		arg_12_0.view.widgets.node_exp:setVisible(false)
		arg_12_0.view.widgets.node_farm:setVisible(true)
		arg_12_0.view.widgets.lbl_info:setString(language.get(421021))

		local var_12_3 = CCStrokeLabelTTF:create(language.get(421015), "Thonburi", 25 + (var_0_0.titleFntSize or 0))

		if arg_12_0.cityIsOurs then
			var_12_3:setString(language.get(421018))
		end

		local var_12_4

		if smgr.currentSceneTag == SCENE_KFYZ_WORLD and user.jpsIndex > 0 then
			var_12_4 = CCStrokeLabelTTF:create(worldDongyingConstant.BUILDING_INFO["world_building_" .. arg_12_0.cityId].name, "Thonburi", 25)
		else
			var_12_4 = CCStrokeLabelTTF:create(worldConstant.BUILDING_INFO["world_building_" .. arg_12_0.cityId].name, "Thonburi", 25)
		end

		var_12_4:setColor(ccc3(0, 255, 0))

		local var_12_5 = CCSprite:create("res/ui/task/get_icon_food.png")

		arg_12_0.consumeLabel = CCStrokeLabelTTF:create("-50000", "Thonburi", 25 + (var_0_0.titleFntSize or 0))

		arg_12_0.consumeLabel:setColor(ccc3(255, 0, 0))

		arg_12_0.richNode = createRichNode({
			var_12_3,
			var_12_4,
			var_12_5,
			arg_12_0.consumeLabel
		})

		arg_12_0.richNode:setPosition(arg_12_0.view.widgets.bg:getContentSize().width / 2 - 200 + (var_0_0.titleX or 0), arg_12_0.view.widgets.bg:getContentSize().height - 40)
		arg_12_0.view.widgets.bg:addChild(arg_12_0.richNode)

		local var_12_6 = arg_12_0.totalFood - (4 - var_12_0) * arg_12_0.eachReduce

		arg_12_0.view.widgets.lostLabel:setString("0")
		arg_12_0.view.widgets.expLabel:setString("0")
		arg_12_0.consumeLabel:setString(string.format("-%s", var_12_6))

		arg_12_0.mode = false
		arg_12_0.replyToken = false

		arg_12_0.view.widgets.closeButton:setVisible(true)
		arg_12_0.view.widgets.closeButton:setEnabled(true)
	elseif arg_12_0.state == var_0_7.STATE.IN_BATTLE then
		if arg_12_0.isShownText ~= true then
			local var_12_7

			if smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
				var_12_7 = arg_12_0.cityId or user.kfAutoBattleCityId
			else
				var_12_7 = arg_12_0.cityId or user.autoBattleCityId
			end

			if var_12_7 then
				local var_12_8 = language.get(421025)

				if arg_12_0.cityIsOurs then
					var_12_8 = language.get(421026)
				end

				local var_12_9

				if smgr.currentSceneTag == SCENE_KFYZ_WORLD and user.jpsIndex > 0 then
					var_12_9 = worldDongyingConstant.BUILDING_INFO["world_building_" .. var_12_7].name
				else
					var_12_9 = worldConstant.BUILDING_INFO["world_building_" .. var_12_7].name
				end

				arg_12_0:showReport({
					{
						text = var_12_8,
						color = var_0_2
					},
					{
						text = var_12_9,
						color = var_0_3
					}
				})

				arg_12_0.isShownText = true
			end
		end

		arg_12_0.view.widgets.leftButton:setVisible(true)
		arg_12_0.view.widgets.rightButton:setVisible(true)
		arg_12_0.view.widgets.fightButton:setVisible(false)
		arg_12_0.view.widgets.node_lose:setVisible(true)
		arg_12_0.view.widgets.node_exp:setVisible(true)
		arg_12_0.view.widgets.node_farm:setVisible(true)
		arg_12_0.view.widgets.lbl_info:setString(language.get(421024))
		arg_12_0.view.widgets.lbl_leftBtn:setString(language.get(420001))

		if arg_12_0.richNode then
			arg_12_0.richNode:removeFromParentAndCleanup(true)

			arg_12_0.richNode = nil
		end

		arg_12_0.mode = arg_12_0.autoBattleData.autoMode == 1
		arg_12_0.mode = not arg_12_0.mode

		arg_12_0.view.widgets.tokenCheckBox:setHighlighted(arg_12_0.mode)

		arg_12_0.replyToken = arg_12_0.autoBattleData.replyToken

		arg_12_0.view.widgets.tokenCheckBox2:setHighlighted(arg_12_0.replyToken)

		local var_12_10 = arg_12_0.autoBattleData.lost

		if var_12_10 > 10000 then
			var_12_10 = language.get(420005, tool.toint(var_12_10 / 10000))
		else
			var_12_10 = tostring(var_12_10)
		end

		local var_12_11 = arg_12_0.autoBattleData.exp

		if var_12_11 > 10000 then
			var_12_11 = language.get(420005, tool.toint(var_12_11 / 10000))
		else
			var_12_11 = tostring(var_12_11)
		end

		arg_12_0.view.widgets.lostLabel:setString(var_12_10)
		arg_12_0.view.widgets.expLabel:setString(var_12_11)

		if not arg_12_0.timeLabel then
			local var_12_12 = createTimerLabel(arg_12_0.autoBattleData.cd, "@M:@S", "Thonburi", 22, nil, nil, nil, ccc3(255, 0, 0))

			arg_12_0.timeLabel = var_12_12

			var_12_12:setPosition(640, 320)
			arg_12_0.view.widgets.bg:addChild(var_12_12)
		end

		for iter_12_2, iter_12_3 in pairs(arg_12_0.generalInfoTable) do
			iter_12_3.check = false

			if arg_12_0.autoBattleData.gIds == nil then
				iter_12_3.check = true
			else
				for iter_12_4, iter_12_5 in pairs(tool.split(arg_12_0.autoBattleData.gIds, "#")) do
					if iter_12_3.gid == tonumber(iter_12_5) then
						iter_12_3.check = true
					end
				end
			end

			arg_12_0.view.widgets["generalGou" .. iter_12_2]:setVisible(iter_12_3.check)
		end

		arg_12_0.view.widgets.closeButton:setVisible(false)
		arg_12_0.view.widgets.closeButton:setEnabled(false)
	elseif arg_12_0.state == var_0_7.STATE.AFTER_BATTLE then
		arg_12_0.view.widgets.fightButton:setVisible(false)
		arg_12_0.view.widgets.leftButton:setVisible(true)
		arg_12_0.view.widgets.rightButton:setVisible(true)
		arg_12_0.view.widgets.rightButton:setEnabled(false)
		arg_12_0.view.widgets.node_lose:setVisible(true)
		arg_12_0.view.widgets.node_exp:setVisible(true)
		arg_12_0.view.widgets.node_farm:setVisible(false)

		local var_12_13 = arg_12_0.autoBattleData.lost

		if var_12_13 > 10000 then
			var_12_13 = language.get(420005, tool.toint(var_12_13 / 10000))
		else
			var_12_13 = tostring(var_12_13)
		end

		local var_12_14 = arg_12_0.autoBattleData.exp

		if var_12_14 > 10000 then
			var_12_14 = language.get(420005, tool.toint(var_12_14 / 10000))
		else
			var_12_14 = tostring(var_12_14)
		end

		arg_12_0.view.widgets.lostLabel:setString(var_12_13)
		arg_12_0.view.widgets.expLabel:setString(var_12_14)
		arg_12_0.view.widgets.lbl_leftBtn:setString(language.get(420003))
		log.info("user.autoDefMode@@@@@@@@@@@@@@", user.autoDefMode)

		if arg_12_0.autoBattleData.result == 1 or arg_12_0.autoBattleData.result == 2 or arg_12_0.autoBattleData.result == 6 then
			arg_12_0.view.widgets.endXuezhan:setVisible(true)
			arg_12_0.view.widgets.endJianshou:setVisible(false)
		else
			arg_12_0.view.widgets.endXuezhan:setVisible(false)
			arg_12_0.view.widgets.endJianshou:setVisible(true)
		end

		if arg_12_0.autoBattleData.result == 7 then
			if user.autoDefMode and user.autoDefMode == 1 then
				arg_12_0.view.widgets.endXuezhan:setDisplayFrame(CCSprite:create("res/ui/world/autoBattle/smsr_word_gzmbksjs.png"):displayFrame())
			else
				arg_12_0.view.widgets.endXuezhan:setDisplayFrame(CCSprite:create("res/ui/world/autoBattle/zdgz_end_xzjs.png"):displayFrame())
			end

			arg_12_0.view.widgets.endXuezhan:setVisible(true)
			arg_12_0.view.widgets.endJianshou:setVisible(false)
		else
			eventManager.dispatchEvent("autoBattle", {
				stop = true
			})
			eventManager.dispatchEvent("autoBattleCityEffect")
			arg_12_0.view.widgets.closeButton:setVisible(false)
			arg_12_0.view.widgets.closeButton:setEnabled(false)
		end
	end

	arg_12_0:updateMode()
	arg_12_0:setVisible(true)

	arg_12_0.response = nil
end

function var_0_7.updateMode(arg_13_0)
	if smgr.currentSceneTag == SCENE_WORLD and user.proAutoBlood then
		user.selectedMode = user.selectedMode or 1

		if user.mode == 1 or user.mode == 2 then
			user.selectedMode = user.mode
		end

		if arg_13_0.state == var_0_7.STATE.AFTER_BATTLE then
			user.mode = 0
		end

		local var_13_0 = arg_13_0.cityId or user.autoBattleCityId

		arg_13_0.view.widgets.btn_mode1:setVisible(true)
		arg_13_0.view.widgets.btn_mode2:setVisible(true)

		if var_13_0 ~= nil then
			local var_13_1 = worldConstant.BUILDING_INFO["world_building_" .. var_13_0].model
			local var_13_2 = string.find(var_13_1, "worldBuildingGuanqia") ~= nil

			if user.selectedMode == 2 and var_13_2 then
				user.selectedMode = 1
			end

			arg_13_0.view.widgets.btn_mode2:setEnabled(not var_13_2)
		end

		arg_13_0.view.widgets.btn_mode1:setPositionY(user.selectedMode == 1 and 328 or 322)
		arg_13_0.view.widgets.btn_mode2:setPositionY(user.selectedMode == 1 and 322 or 328)
		arg_13_0.view.widgets.bg:setColor(user.selectedMode == 1 and var_0_2 or var_0_4)

		local var_13_3
		local var_13_4
		local var_13_5 = user.selectedMode == 1 and "zdgz_icon_bl.png" or "zdgz_icon_cc.png"

		if arg_13_0.state == var_0_7.STATE.BEFORE_BATTLE then
			var_13_4 = 0
		elseif arg_13_0.state == var_0_7.STATE.IN_BATTLE then
			if user.selectedMode == 1 then
				var_13_4 = arg_13_0.autoBattleData.lost
			else
				var_13_4 = arg_13_0.autoBattleData.city
			end

			var_13_4 = var_13_4 or 0

			if var_13_4 > 10000 then
				var_13_4 = language.get(420005, tool.toint(var_13_4 / 10000))
			else
				var_13_4 = tostring(var_13_4)
			end
		elseif arg_13_0.state == var_0_7.STATE.AFTER_BATTLE then
			if user.selectedMode == 1 then
				var_13_4 = arg_13_0.autoBattleData.lost
			else
				var_13_4 = arg_13_0.autoBattleData.city
			end

			var_13_4 = var_13_4 or 0

			if var_13_4 > 10000 then
				var_13_4 = language.get(420005, tool.toint(var_13_4 / 10000))
			else
				var_13_4 = tostring(var_13_4)
			end
		end

		arg_13_0.view.widgets.lostLabel:setString(var_13_4)
		arg_13_0.view.widgets.icon1:setDisplayFrame(CCSprite:create("res/ui/world/autoBattle/" .. var_13_5):displayFrame())
	end
end

function var_0_7.updateFarmInfo(arg_14_0, arg_14_1)
	if smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
		for iter_14_0 = 0, 3 do
			arg_14_0.view.widgets["btn_farm" .. iter_14_0]:setEnabled(false)

			if arg_14_0.view.widgets["btn_farm_icon" .. iter_14_0] then
				tool.spriteToGray(arg_14_0.view.widgets["btn_farm_icon" .. iter_14_0], true)
			end
		end
	else
		arg_14_0.bloodFarmGold = arg_14_1.bloodFarmGold

		local var_14_0 = {
			[0] = arg_14_1.farmItem.normalItemNum or 0,
			arg_14_1.farmItem.reduceCostItemNum or 0,
			arg_14_1.farmItem.doubleKillItemNum or 0,
			arg_14_1.farmItem.attackAdderItemNum or 0
		}
		local var_14_1 = var_14_0[0]

		if arg_14_1.farmItem.normalItemNum then
			arg_14_0.view.widgets.num0:setString(language.get(191003, var_14_0[0]))
			arg_14_0.view.widgets.btn_farm0:setVisible(true)
		else
			local var_14_2 = var_14_0[1] + var_14_0[2] + var_14_0[3]

			for iter_14_1 = 1, 3 do
				arg_14_0.view.widgets["num" .. iter_14_1]:setString(language.get(191003, var_14_0[iter_14_1]))
				arg_14_0.view.widgets["btn_farm" .. iter_14_1]:setVisible(true)
			end
		end
	end
end

function var_0_7.updateFarmInfo2(arg_15_0, arg_15_1)
	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		for iter_15_0 = 0, 3 do
			arg_15_0.view.widgets["btn_farm" .. iter_15_0]:setEnabled(false)

			if arg_15_0.view.widgets["btn_farm_icon" .. iter_15_0] then
				tool.spriteToGray(arg_15_0.view.widgets["btn_farm_icon" .. iter_15_0], true)
			end
		end

		if arg_15_1.farmItem.normalItemNum then
			arg_15_0.view.widgets.btn_farm0:setVisible(true)
		else
			for iter_15_1 = 1, 3 do
				arg_15_0.view.widgets["btn_farm" .. iter_15_1]:setVisible(true)
			end
		end
	else
		arg_15_0.bloodFarmGold = arg_15_1.bloodFarmGold

		local var_15_0 = {
			[0] = arg_15_1.farmItem.normalItemNum or 0,
			arg_15_1.farmItem.reduceCostItemNum or 0,
			arg_15_1.farmItem.doubleKillItemNum or 0,
			arg_15_1.farmItem.attackAdderItemNum or 0
		}
		local var_15_1 = var_15_0[0]

		if arg_15_1.farmItem.normalItemNum then
			arg_15_0.view.widgets.num0:setString(language.get(191003, var_15_0[0]))
			arg_15_0.view.widgets.btn_farm0:setVisible(true)
		else
			local var_15_2 = var_15_0[1] + var_15_0[2] + var_15_0[3]

			for iter_15_2 = 1, 3 do
				arg_15_0.view.widgets["num" .. iter_15_2]:setString(language.get(191003, var_15_0[iter_15_2]))
				arg_15_0.view.widgets["btn_farm" .. iter_15_2]:setVisible(true)
			end
		end
	end
end

function var_0_7.getAutoBattleSimpleInfo(arg_16_0)
	local function var_16_0(arg_17_0)
		local var_17_0 = arg_17_0.data or arg_17_0.action.data

		arg_16_0.totalFood = var_17_0.totalFood
		arg_16_0.eachReduce = var_17_0.eachReduce

		if arg_16_0.state == var_0_7.STATE.BEFORE_BATTLE then
			arg_16_0:getSimpleGeneralInfo()
		elseif arg_16_0.state == var_0_7.STATE.IN_BATTLE then
			arg_16_0:getAutoBattleDetail()
		elseif arg_16_0.state == var_0_7.STATE.AFTER_BATTLE then
			arg_16_0:getAutoBattleDetail()

			if arg_16_0.autoBattleData and arg_16_0.autoBattleData.result and arg_16_0.autoBattleData.result == 7 then
				-- block empty
			elseif smgr.currentSceneTag == SCENE_KFYZ_WORLD then
				user.kfAutoBattleCityId = nil
			else
				user.autoBattleCityId = nil
			end
		end
	end

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
		kfcmgr.sendRequest(var_16_0, actions.getAutoBattleSimpleInfo)
	else
		cmgr.sendRequest(var_16_0, actions.getAutoBattleSimpleInfo)
	end
end

function var_0_7.handlerGetSimpleGeneralInfo(arg_18_0, arg_18_1)
	if smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
		arg_18_0.generalMilitary = user.kfyzGeneral
	else
		arg_18_0.generalMilitary = arg_18_1.action.data.military
	end

	if arg_18_0.state ~= var_0_7.STATE.BEFORE_BATTLE and arg_18_0.autoBattleData == nil then
		arg_18_0:getAutoBattleDetail()
	else
		arg_18_0:init()
	end
end

function var_0_7.getSimpleGeneralInfo(arg_19_0)
	if smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
		arg_19_0:handlerGetSimpleGeneralInfo()
	else
		cmgr.sendRequest(handler(arg_19_0, arg_19_0.handlerGetSimpleGeneralInfo), actions.generalSimpleInfo)
	end
end

function var_0_7.handlerGetAutoBattleDetail(arg_20_0, arg_20_1)
	arg_20_0.autoBattleData = arg_20_1.data or arg_20_1.action.data

	if arg_20_0.autoBattleData.autoBattle then
		arg_20_0.autoBattleData = arg_20_0.autoBattleData.autoBattle
	end

	if arg_20_0.autoBattleData.result == nil then
		arg_20_0.state = var_0_7.STATE.IN_BATTLE

		if arg_20_0.cityId ~= nil then
			if smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
				user.kfAutoBattleCityId = arg_20_0.cityId
			else
				user.autoBattleCityId = arg_20_0.cityId
			end
		end
	else
		arg_20_0.state = var_0_7.STATE.AFTER_BATTLE

		if arg_20_0.autoBattleData.result ~= 7 then
			if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
				user.kfAutoBattleCityId = nil
			else
				user.autoBattleCityId = nil
			end
		end
	end

	if arg_20_0.generalMilitary == nil then
		arg_20_0:getSimpleGeneralInfo()
	else
		arg_20_0:init()
	end

	if arg_20_0.cityId then
		eventManager.dispatchEvent("autoBattleCityEffect", arg_20_0.cityId)
	end
end

function var_0_7.handlerChangeAutoBattleMode(arg_21_0, arg_21_1)
	arg_21_0:getAutoBattleDetail()
end

function var_0_7.getAutoBattleDetail(arg_22_0)
	if arg_22_0.response then
		arg_22_0:handlerGetAutoBattleDetail(arg_22_0.response)
	elseif smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
		kfcmgr.sendRequest(handler(arg_22_0, arg_22_0.handlerGetAutoBattleDetail), actions.getAutoBattleDetail)
	else
		cmgr.sendRequest(handler(arg_22_0, arg_22_0.handlerGetAutoBattleDetail), actions.getAutoBattleDetail)
	end
end

function var_0_7.changeAutoBattleMode(arg_23_0)
	local var_23_0 = arg_23_0.mode and 2 or 1

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
		kfcmgr.sendRequest(handler(arg_23_0, arg_23_0.handlerChangeAutoBattleMode), actions.changeAutoBattleMode, var_23_0)
	else
		cmgr.sendRequest(handler(arg_23_0, arg_23_0.handlerChangeAutoBattleMode), actions.changeAutoBattleMode, var_23_0)
	end
end

function var_0_7.changeReplyToken(arg_24_0)
	local function var_24_0(arg_25_0)
		if (arg_25_0.data or arg_25_0.action.data).state == 1 then
			log.info("change replyToken succeeded!")
			arg_24_0.view.widgets.tokenCheckBox2:setHighlighted(arg_24_0.replyToken)
		end
	end

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
		kfcmgr.sendRequest(var_24_0, actions.changeReplyToken, arg_24_0.replyToken)
	else
		cmgr.sendRequest(var_24_0, actions.changeReplyToken, arg_24_0.replyToken)
	end
end

function var_0_7.changeMode(arg_26_0)
	local var_26_0

	if smgr.currentSceneTag == SCENE_WORLD then
		var_26_0 = arg_26_0.cityId or user.autoBattleCityId
	end

	if user.proAutoBlood and var_26_0 ~= nil and user.selectedMode ~= user.mode then
		arg_26_0:onChangeMode(user.selectedMode)
	end
end

function var_0_7.handlerStartAutoBattle(arg_27_0, arg_27_1)
	arg_27_0:changeAutoBattleMode()
	arg_27_0:changeReplyToken()
	arg_27_0:changeMode()

	if arg_27_0.autoJS then
		function handlerCheckBox()
			user.autoDefMode = 1

			print("handlerStartAutoBattle@@@@@@@@@@@@@@ autoDefMode1")
		end

		if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
			kfcmgr.sendRequest(handlerCheckBox, actions.battleSetDefend, 1)
		else
			cmgr.sendRequest(handlerCheckBox, actions.battleSetDefend, 1)
		end
	end
end

function var_0_7.handlerStopAutoBattle(arg_29_0, arg_29_1)
	arg_29_0.state = var_0_7.STATE.AFTER_BATTLE

	eventManager.dispatchEvent("autoBattle", {
		stop = true
	})
end

function var_0_7.stopAutoBattle(arg_30_0)
	messageBox.confirm(language.get(421012), function()
		if smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
			kfcmgr.sendRequest(handler(arg_30_0, arg_30_0.handlerStopAutoBattle), actions.stopAutoBattle)
		else
			cmgr.sendRequest(handler(arg_30_0, arg_30_0.handlerStopAutoBattle), actions.stopAutoBattle)
		end
	end)
end

function var_0_7.startAutoBattle(arg_32_0)
	local var_32_0 = ""

	for iter_32_0, iter_32_1 in pairs(arg_32_0.generalInfoTable) do
		if iter_32_1.check then
			var_32_0 = var_32_0 .. iter_32_1.gid .. "#"
		end
	end

	if var_32_0 ~= "" then
		user.autoBattleGids = var_32_0

		if smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
			kfcmgr.sendRequest(handler(arg_32_0, arg_32_0.handlerStartAutoBattle), actions.startAutoBattle, arg_32_0.cityId, var_32_0, false)
		else
			cmgr.sendRequest(handler(arg_32_0, arg_32_0.handlerStartAutoBattle), actions.startAutoBattle, arg_32_0.cityId, var_32_0, false)
		end
	end
end

function var_0_7.showReport(arg_33_0, arg_33_1)
	arg_33_0.view.widgets.reportNode:removeAllChildrenWithCleanup(true)

	local var_33_0 = {}

	for iter_33_0, iter_33_1 in pairs(arg_33_1) do
		local var_33_1 = CCStrokeLabelTTF:create(iter_33_1.text, "Thonburi", 24 + (var_0_0.titleBattleFntSize or 0))

		var_33_1:setColor(iter_33_1.color)

		var_33_0[#var_33_0 + 1] = var_33_1
	end

	arg_33_0.view.widgets.reportNode:addChild(createRichNode(var_33_0, 0.5))
end

function var_0_7.update(arg_34_0, arg_34_1)
	if arg_34_0.autoBattleData == nil then
		return
	end

	if arg_34_0.autoBattleData.result == nil then
		arg_34_0.refreshCount = arg_34_0.refreshCount or 0
		arg_34_0.refreshCount = arg_34_0.refreshCount + arg_34_1

		if arg_34_0.refreshCount > 10 then
			arg_34_0.refreshCount = 0

			arg_34_0:getAutoBattleDetail()
		end
	end
end

function var_0_7.minimize(arg_35_0)
	local var_35_0 = CCScaleTo:create(1, 0)
	local var_35_1 = CCMoveTo:create(1, ccp(0, visibleSize.height / 2))

	arg_35_0.view.widgets.bg:runAction(var_35_0)
	arg_35_0.view.widgets.bg:runAction(CCSequence:createWithTwoActions(var_35_1, CCCallFunc:create(function()
		arg_35_0:removeFromParentAndCleanup(true)
	end)))
end

function var_0_7.onLeftButtonClick(arg_37_0)
	if arg_37_0.state == var_0_7.STATE.IN_BATTLE then
		arg_37_0:stopAutoBattle()
	elseif arg_37_0.state == var_0_7.STATE.AFTER_BATTLE then
		if user.autoDefMode and user.autoDefMode == 1 and arg_37_0.autoBattleData and arg_37_0.autoBattleData.result and arg_37_0.autoBattleData.result == 7 then
			eventManager.dispatchEvent("autoBattle", {
				autoJS = true
			})
		end

		arg_37_0:removeFromParentAndCleanup(true)
	end
end

function var_0_7.onRightButtonClick(arg_38_0)
	if arg_38_0.state == var_0_7.STATE.IN_BATTLE then
		arg_38_0:minimize()
		eventManager.dispatchEvent("autoBattle", {
			min = true,
			time = arg_38_0.timeLabel:getTime()
		})
	end
end

function var_0_7.onFightButtonClick(arg_39_0)
	arg_39_0:startAutoBattle()
end

function var_0_7.onTokenCheckBoxClick(arg_40_0)
	local function var_40_0()
		log.info("success changeMode")

		arg_40_0.mode = not arg_40_0.mode

		arg_40_0.view.widgets.tokenCheckBox:setHighlighted(arg_40_0.mode)

		if arg_40_0.mode == true then
			user.autoMode = 2
		else
			user.autoMode = 1
		end

		log.info("user.autoMode", user.autoMode)
	end

	if arg_40_0.state == var_0_7.STATE.IN_BATTLE then
		if arg_40_0.mode == true then
			if smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
				kfcmgr.sendRequest(var_40_0, actions.changeAutoBattleMode, 1)
			else
				cmgr.sendRequest(var_40_0, actions.changeAutoBattleMode, 1)
			end
		elseif smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
			kfcmgr.sendRequest(var_40_0, actions.changeAutoBattleMode, 2)
		else
			cmgr.sendRequest(var_40_0, actions.changeAutoBattleMode, 2)
		end
	else
		arg_40_0.mode = not arg_40_0.mode

		arg_40_0.view.widgets.tokenCheckBox:setHighlighted(arg_40_0.mode)
	end
end

function var_0_7.onTokenCheckBoxClick2(arg_42_0)
	local function var_42_0()
		log.info("change replyToken succeeded!")

		arg_42_0.replyToken = not arg_42_0.replyToken

		arg_42_0.view.widgets.tokenCheckBox2:setHighlighted(arg_42_0.replyToken)
	end

	if arg_42_0.state == var_0_7.STATE.IN_BATTLE then
		if arg_42_0.replyToken == true then
			if smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
				kfcmgr.sendRequest(var_42_0, actions.changeReplyToken, not arg_42_0.replyToken)
			else
				cmgr.sendRequest(var_42_0, actions.changeReplyToken, not arg_42_0.replyToken)
			end
		elseif smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
			kfcmgr.sendRequest(var_42_0, actions.changeReplyToken, not arg_42_0.replyToken)
		else
			cmgr.sendRequest(var_42_0, actions.changeReplyToken, not arg_42_0.replyToken)
		end
	else
		arg_42_0.replyToken = not arg_42_0.replyToken

		arg_42_0.view.widgets.tokenCheckBox2:setHighlighted(arg_42_0.replyToken)
	end
end

function var_0_7.onTokenCheckBoxClick3(arg_44_0)
	local var_44_0 = 0

	local function var_44_1(arg_45_0)
		log.info("change onTokenCheckBoxClick3 succeeded!")

		if not arg_45_0.data then
			local var_45_0 = arg_45_0.action.data
		end

		user.autoDefMode = var_44_0
		arg_44_0.autoJS = user.autoDefMode == 1

		arg_44_0.view.widgets.tokenCheckBox3:setHighlighted(arg_44_0.autoJS)
	end

	user.autoDefMode = user.autoDefMode or 0

	if arg_44_0.state == var_0_7.STATE.IN_BATTLE then
		var_44_0 = user.autoDefMode == 0 and 1 or 0

		if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
			kfcmgr.sendRequest(var_44_1, actions.battleSetDefend, var_44_0)
		else
			cmgr.sendRequest(var_44_1, actions.battleSetDefend, var_44_0)
		end
	else
		arg_44_0.autoJS = not arg_44_0.autoJS

		arg_44_0.view.widgets.tokenCheckBox3:setHighlighted(arg_44_0.autoJS)
	end
end

function var_0_7.getFarmInfo(arg_46_0)
	local function var_46_0(arg_47_0)
		arg_46_0:updateFarmInfo2(arg_47_0.action.data)
	end

	cmgr.sendRequest(var_46_0, actions.farmLbGetInfo)
end

function var_0_7.onFarmGetReward(arg_48_0, arg_48_1)
	local var_48_0 = {
		[0] = 5,
		1,
		2,
		4
	}
	local var_48_1 = 0

	for iter_48_0, iter_48_1 in pairs(arg_48_0.generalInfoTable) do
		if iter_48_1.check == true then
			var_48_1 = var_48_1 + 1
		end
	end

	local function var_48_2(arg_49_0)
		local var_49_0 = arg_49_0.action.data

		arg_48_0:getFarmInfo()

		for iter_49_0 = 1, 5 do
			local var_49_1 = arg_48_0.generalMilitary[iter_49_0]

			if var_49_1 and var_49_1.generalId == var_49_0.generalId then
				var_49_1.extraBuffId = var_49_0.farmType
				var_49_1.buffCd = var_49_0.buffCd

				local var_49_2 = var_0_1[var_49_1.extraBuffId]

				if var_49_2 and var_49_1.buffCd and var_49_1.buffCd > 0 then
					arg_48_0.view.widgets["icon_buff" .. iter_49_0]:setDisplayFrame(CCSprite:create("res/ui/world/farm/" .. var_49_2.pic):displayFrame())
					arg_48_0.view.widgets["txt_buff" .. iter_49_0]:setDisplayFrame(CCSprite:create("res/ui/world/farm/" .. var_49_2.txt):displayFrame())
					arg_48_0.view.widgets["node_buff" .. iter_49_0]:setVisible(true)
				else
					arg_48_0.view.widgets["node_buff" .. iter_49_0]:setVisible(false)
				end
			end
		end

		local var_49_3 = {}

		if var_49_0.foodReward and var_49_0.foodReward > 0 then
			local var_49_4 = {}

			var_49_4.id = 3
			var_49_4.value = var_49_0.foodReward

			table.insert(var_49_3, var_49_4)
		end

		if var_49_0.chiefExpReward and var_49_0.chiefExpReward > 0 then
			local var_49_5 = {}

			var_49_5.id = 6
			var_49_5.value = var_49_0.chiefExpReward

			table.insert(var_49_3, var_49_5)
		end

		globalAction_gotResource(var_49_3)

		local var_49_6 = arg_49_0.action.data.buffCd

		if var_49_6 and var_49_6 > 0 then
			local var_49_7 = smgr.getLayer("topLayer")
			local var_49_8 = CCSprite:createWithSpriteFrameName("lb_buff_sqgz_big.png")
			local var_49_9 = CCSprite:create("res/ui/common/text/resource/lb_tit_sqgzssfz.png")
			local var_49_10 = CCLabelAtlas:create(tostring(var_49_6 / 60000), "res/ui/common/text/resource/res_title_num.png", 30, 45, 48)

			var_49_10:setAnchorPoint(ccp(0.5, 0.5))

			local var_49_11 = CCSprite:create("res/ui/common/text/resource/lb_tit_sqgzssfz1.png")
			local var_49_12 = createRichNode({
				var_49_8,
				var_49_9,
				var_49_10,
				var_49_11
			}, 0.5)

			var_49_12:setVisible(false)
			var_49_12:setPosition(ccp(visibleSize.width / 2, visibleSize.height * 0.4))
			var_49_7:addChild(var_49_12)

			local function var_49_13()
				var_49_12:setVisible(true)
			end

			local function var_49_14()
				var_49_7:removeChild(var_49_12, true)
			end

			local var_49_15 = CCArray:create()

			var_49_15:addObject(CCDelayTime:create(0.6))
			var_49_15:addObject(CCCallFuncN:create(var_49_13))
			var_49_15:addObject(CCMoveTo:create(0.3, ccp(visibleSize.width / 2, visibleSize.height * 0.6)))
			var_49_15:addObject(CCDelayTime:create(0.1))
			var_49_15:addObject(CCSpawn:createWithTwoActions(CCMoveTo:create(0.8, ccp(0, visibleSize.height)), CCScaleTo:create(0.8, 0.1)))
			var_49_15:addObject(CCCallFuncN:create(var_49_14))

			local var_49_16 = CCSequence:create(var_49_15)

			var_49_12:runAction(var_49_16)
		end

		if var_49_0.farmType then
			local var_49_17 = smgr.getLayer("topLayer")
			local var_49_18 = var_49_0.farmType
			local var_49_19 = CCSprite:createWithSpriteFrameName("lb_buff_sqgz_big.png")

			if var_49_18 == 62 then
				var_49_19 = CCSprite:create("res/ui/farm/ttq_word_get_02.png")
			elseif var_49_18 == 63 then
				var_49_19 = CCSprite:create("res/ui/farm/ttq_word_get_01.png")
			elseif var_49_18 == 64 then
				var_49_19 = CCSprite:create("res/ui/farm/ttq_word_get_03.png")
			elseif var_49_18 == 65 then
				var_49_19 = CCSprite:create("res/ui/farm/mzdhy1.png")
			elseif var_49_18 == 66 then
				var_49_19 = CCSprite:create("res/ui/farm/mzdhy.png")
			end

			var_49_19:setVisible(false)
			var_49_19:setPosition(ccp(visibleSize.width / 2, visibleSize.height * 0.4))
			var_49_17:addChild(var_49_19)

			local function var_49_20()
				var_49_19:setVisible(true)
			end

			local function var_49_21()
				var_49_17:removeChild(var_49_19, true)
			end

			local var_49_22 = CCArray:create()

			var_49_22:addObject(CCDelayTime:create(1.2))
			var_49_22:addObject(CCCallFuncN:create(var_49_20))
			var_49_22:addObject(CCMoveTo:create(0.3, ccp(visibleSize.width / 2, visibleSize.height * 0.6)))
			var_49_22:addObject(CCDelayTime:create(0.1))
			var_49_22:addObject(CCSpawn:createWithTwoActions(CCMoveTo:create(0.8, ccp(0, visibleSize.height)), CCScaleTo:create(0.8, 0.1)))
			var_49_22:addObject(CCCallFuncN:create(var_49_21))

			local var_49_23 = CCSequence:create(var_49_22)

			var_49_19:runAction(var_49_23)
		end

		eventManager.dispatchEvent("farmOver")
	end

	messageBox.showChargeWin("", language.get(421023, var_48_1 * arg_48_0.bloodFarmGold), "bloodFarmGold", function()
		local var_54_0 = 0

		for iter_54_0, iter_54_1 in pairs(arg_48_0.generalInfoTable) do
			if iter_54_1.check then
				local var_54_1 = CCArray:create()

				var_54_1:addObject(CCDelayTime:create(var_54_0))
				var_54_1:addObject(CCCallFunc:create(function()
					cmgr.sendRequest(var_48_2, actions.farmGetReward, iter_54_1.gid, var_48_0[arg_48_1])
				end))

				local var_54_2 = CCSequence:create(var_54_1)

				arg_48_0:runAction(var_54_2)

				var_54_0 = var_54_0 + 0.5
			end
		end
	end)
end

function var_0_7.onChangeMode(arg_56_0, arg_56_1)
	local function var_56_0()
		smgr.showTipTextGreen(language.get(arg_56_1 == 1 and 421031 or 421032))
		arg_56_0:updateMode()
	end

	local function var_56_1(arg_58_0)
		local var_58_0 = arg_58_0.action.data

		user.mode = arg_56_1
		user.district = var_58_0.district

		var_56_0()
	end

	user.selectedMode = arg_56_1

	cmgr.sendRequest(var_56_1, actions.battleChangeMode, arg_56_1)
end

function var_0_7.onCloseButtonClick(arg_59_0)
	arg_59_0:removeFromParentAndCleanup(true)
end

function var_0_7.changeAutoBattleGeneral(arg_60_0, arg_60_1)
	local var_60_0 = arg_60_1.check and language.get(421016, arg_60_0.eachReduce) or language.get(421017)

	messageBox.confirm(var_60_0, function()
		arg_60_0:startAutoBattle()
	end, nil, function()
		arg_60_1.check = not arg_60_1.check
	end)
end

function var_0_7.onTouchEnded(arg_63_0, arg_63_1, arg_63_2)
	if arg_63_0.state == var_0_7.STATE.BEFORE_BATTLE then
		local var_63_0 = 0
		local var_63_1 = 0

		for iter_63_0, iter_63_1 in pairs(arg_63_0.generalInfoTable) do
			if iter_63_1.check == true then
				var_63_1 = var_63_1 + 1
			end
		end

		for iter_63_2, iter_63_3 in pairs(arg_63_0.generalInfoTable) do
			if tool.checkIfTouch(arg_63_0.view.widgets["generalBg" .. iter_63_2], arg_63_1, arg_63_2) then
				if iter_63_3.check == true then
					if var_63_1 <= 1 then
						smgr.showTipText(language.get(421029))
						amgr.playEffect(enumAudioFile.ui_click_error, false, true)

						return
					else
						iter_63_3.check = false
					end
				else
					iter_63_3.check = true
				end

				arg_63_0.view.widgets["generalGou" .. iter_63_2]:setVisible(iter_63_3.check)
			end

			if iter_63_3.check == true then
				var_63_0 = var_63_0 + 1
			end
		end

		local var_63_2 = arg_63_0.totalFood - (4 - var_63_0) * arg_63_0.eachReduce

		arg_63_0.consumeLabel:setString(string.format("-%s", var_63_2))
	elseif arg_63_0.state == var_0_7.STATE.IN_BATTLE then
		local var_63_3 = 0

		for iter_63_4, iter_63_5 in pairs(arg_63_0.generalInfoTable) do
			if iter_63_5.check == true then
				var_63_3 = var_63_3 + 1
			end
		end

		for iter_63_6, iter_63_7 in pairs(arg_63_0.generalInfoTable) do
			if tool.checkIfTouch(arg_63_0.view.widgets["generalBg" .. iter_63_6], arg_63_1, arg_63_2) then
				if iter_63_7.check == true then
					if var_63_3 <= 1 then
						smgr.showTipText(language.get(421029))
						amgr.playEffect(enumAudioFile.ui_click_error, false, true)

						return
					else
						iter_63_7.check = false
					end
				else
					iter_63_7.check = true
				end

				arg_63_0:changeAutoBattleGeneral(iter_63_7)

				return
			end
		end
	end
end

function var_0_7.autoDefModeUpdate(arg_64_0)
	if user.autoDefMode == 1 then
		arg_64_0.autoJS = true
	end

	arg_64_0.view.widgets.tokenCheckBox3:setHighlighted(user.autoDefMode == 1)
end

function var_0_7.onEnter(arg_65_0)
	arg_65_0.autoDefModeUpdateRef = handler(arg_65_0, arg_65_0.autoDefModeUpdate)
	arg_65_0.touchEndedRef = handler(arg_65_0, arg_65_0.onTouchEnded)

	eventManager.registerEvent("autoDefModeUpdate", arg_65_0.autoDefModeUpdateRef)
	eventManager.registerEvent("globalOnTouchEnded", arg_65_0.touchEndedRef)

	if arg_65_0.updateSchedulerEntry == nil then
		arg_65_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_65_0, arg_65_0.update), 0.5, false)
	end

	arg_65_0:autoDefModeUpdate()
end

function var_0_7.onExit(arg_66_0)
	eventManager.unregisterEvent("autoDefModeUpdate", arg_66_0.autoDefModeUpdateRef)
	eventManager.unregisterEvent("globalOnTouchEnded", arg_66_0.touchEndedRef)

	if arg_66_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_66_0.updateSchedulerEntry)

		arg_66_0.updateSchedulerEntry = nil
	end
end

return var_0_7
