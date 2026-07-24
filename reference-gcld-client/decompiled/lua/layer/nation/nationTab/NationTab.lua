local var_0_0 = require("res/native/offset").get("layer.nation.nationTab")
local var_0_1 = tool.hexToRgb("#ECDEA7")
local var_0_2 = ccc3(0, 180, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = colorQuality[0]
local var_0_7 = {
	{
		color = "#6aff7f",
		txt1 = 136311,
		txt2 = 136316
	},
	{
		color = "#ffd940",
		txt1 = 136312,
		txt2 = 136317
	},
	{
		color = "#ff8a00",
		txt1 = 136313,
		txt2 = 136318
	},
	{
		color = "#ff4638",
		txt1 = 136314,
		txt2 = 136319
	}
}
local var_0_8 = 1
local var_0_9 = {
	"cd",
	"nextKbCd",
	"changeNameCd"
}
local var_0_10 = class("nationTab", function()
	return createBaseLayer()
end)

var_0_10.layout = {
	name = "panel",
	type = "sprite9",
	preferedSize = CCSizeMake(915, 532),
	middleRect = CCRectMake(10, 10, 70, 70),
	x = visibleSize.width / 2,
	y = visibleSize.height / 2 - 30,
	pic = {
		path = "res/ui/common/panel/comm_view.png"
	},
	children = {
		{
			name = "nationNameNextHalf",
			type = "sprite",
			x = 488 + (var_0_0.titleLevelFntX or 0),
			y = 480 + (var_0_0.titleLevelFntY or 0),
			pic = {
				frame = true,
				path = "nation_jiguojia.png"
			}
		},
		{
			y = 480,
			name = "btn_tip",
			style = "button_tip",
			type = "button",
			x = 860
		},
		{
			fontSize = 25,
			name = "type",
			y = 480,
			type = "label",
			x = 840,
			anchorPoint = ccp(1, 0.5),
			color = var_0_1
		},
		{
			y = 455,
			x = 458,
			type = "sprite",
			pic = {
				path = "res/ui/general/jailView/comm_list_laofang_3.png"
			}
		},
		{
			y = 480,
			name = "title_lv",
			type = "sprite",
			x = 388 + (var_0_0.titleLevelDigitX or 0),
			pic = {
				frame = true,
				path = "nation_lv_1.png"
			}
		},
		{
			y = 330,
			x = 180,
			type = "node",
			children = {
				{
					y = 0,
					x = 0,
					type = "sprite",
					scale = 3.6,
					pic = {
						path = "res/ui/kfyz/wait/yyyz_frd_icon.png"
					}
				},
				{
					y = 0,
					x = 0,
					type = "sprite",
					pic = {
						path = "res/ui/empire/offi_b01.png"
					}
				}
			}
		},
		{
			zoomOnTouchDown = true,
			name = "btn_population",
			h = 34,
			type = "button",
			w = 105,
			y = 402,
			x = 88,
			normal = {
				path = "res/ui/nation/gjrk_word_bg.png"
			},
			touched = {
				path = "res/ui/nation/gjrk_word_bg.png"
			},
			children = {
				{
					y = 24,
					x = 2,
					type = "sprite",
					pic = {
						path = "res/ui/nation/gjrk_icon.png"
					}
				},
				{
					fontSize = 22,
					name = "population",
					y = 17,
					type = "label",
					x = 28,
					anchorPoint = ccp(0, 0.5)
				}
			}
		},
		{
			zoomOnTouchDown = true,
			name = "btn_yzToken",
			h = 34,
			type = "button",
			w = 105,
			y = 475,
			x = 56,
			normal = {
				path = "res/ui/nation/gjrk_word_bg.png"
			},
			touched = {
				path = "res/ui/nation/gjrk_word_bg.png"
			},
			children = {
				{
					y = 24,
					x = 20,
					type = "sprite",
					scale = 0.7,
					pic = {
						path = "res/ui/kfyz/yuyue/yzxms_icon_czl.png"
					}
				},
				{
					fontSize = 22,
					name = "yzToken",
					y = 17,
					type = "label",
					x = 40,
					color = var_0_1,
					anchorPoint = ccp(0, 0.5)
				}
			}
		},
		{
			zoomOnTouchDown = true,
			name = "btn_yzEquip",
			h = 34,
			type = "button",
			w = 105,
			y = 475,
			x = 166,
			normal = {
				path = "res/ui/nation/gjrk_word_bg.png"
			},
			touched = {
				path = "res/ui/nation/gjrk_word_bg.png"
			},
			children = {
				{
					y = 24,
					x = 20,
					type = "sprite",
					pic = {
						path = "res/ui/kfyz/yuyue/frd_icon_zb.png"
					}
				},
				{
					fontSize = 22,
					name = "yzEquip",
					y = 17,
					type = "label",
					x = 40,
					color = var_0_1,
					anchorPoint = ccp(0, 0.5)
				}
			}
		},
		{
			y = 200,
			name = "bg_mine",
			type = "sprite",
			x = 180,
			pic = {
				path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
			},
			children = {
				{
					y = 35,
					name = "icon1",
					scale = 0.7,
					type = "sprite",
					x = 80,
					pic = {
						path = "res/ui/kfyz/wait/yyyz_frd_icon.png"
					}
				},
				{
					y = 35,
					name = "sprite1",
					type = "sprite",
					x = 160,
					pic = {
						path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
					}
				},
				{
					name = "mine1",
					type = "atlaslabel",
					pic = "res/ui/common/number/yyyz_word_frd_digit.png",
					startCharMap = 48,
					text = "0",
					y = 35,
					itemWidth = 18,
					x = 210,
					itemHeight = 26,
					anchorPoint = ccp(0, 0.5)
				},
				{
					fontSize = 25,
					name = "not_open1",
					visible = false,
					type = "label",
					textId = 143047,
					y = 35,
					x = 210,
					anchorPoint = ccp(0, 0.5),
					color = var_0_6
				}
			}
		},
		{
			y = 255,
			name = "bg_chuzheng",
			visible = false,
			type = "sprite",
			x = 180,
			pic = {
				path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
			},
			children = {
				{
					y = 35,
					x = 80,
					type = "sprite",
					pic = {
						path = "res/ui/kfyz/yuyue/yzxms_icon_czl.png"
					}
				},
				{
					y = 35,
					name = "progressbg_chuzheng",
					type = "sprite",
					x = 110,
					anchorPoint = ccp(0, 0.5),
					pic = {
						frame = true,
						path = "guojiajingdudi1.png"
					}
				},
				{
					y = 35,
					name = "progress_chuzheng",
					type = "progressbar",
					x = 110,
					anchorPoint = ccp(0, 0.5),
					progressType = kCCProgressTimerTypeBar,
					pic = {
						frame = true,
						path = "guojiajingdutiao1_4.png"
					}
				},
				{
					fontSize = 22,
					name = "word_chuzheng",
					y = 35,
					type = "label",
					text = "0/0",
					x = 200
				}
			}
		},
		{
			name = "bg_force",
			type = "sprite9",
			y = 435,
			x = 320,
			preferedSize = CCSizeMake(620, 250),
			middleRect = CCRectMake(10, 50, 569, 112),
			anchorPoint = ccp(0, 1),
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_jl_bg.png"
			},
			children = {
				{
					y = 130,
					x = 300,
					type = "sprite",
					scale = 0.5,
					pic = {
						path = "res/ui/nationTask/building/huawen_01.png"
					}
				}
			}
		},
		{
			x = 420,
			name = "flag",
			y = 310,
			type = "sprite",
			scale = 0.95,
			children = {
				{
					fontSize = 60,
					name = "force1",
					y = 130,
					type = "label",
					x = 85
				}
			}
		},
		{
			y = 230,
			name = "bg_honor",
			type = "sprite9",
			x = 420,
			preferedSize = CCSizeMake(200, 40),
			middleRect = CCRectMake(0, 15, 365, 20),
			pic = {
				path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
			},
			children = {
				{
					fontSize = 20,
					name = "honor",
					y = 25,
					type = "label",
					x = 100,
					color = var_0_4
				}
			}
		},
		{
			y = 45,
			name = "bg_npc",
			type = "sprite9",
			x = 180,
			preferedSize = CCSizeMake(400, 85),
			middleRect = CCRectMake(10, 50, 569, 112),
			anchorPoint = ccp(0.5, 0),
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_jl_bg.png"
			}
		},
		{
			y = 80,
			x = 458,
			type = "sprite",
			pic = {
				path = "res/ui/general/jailView/comm_list_laofang_3.png"
			}
		},
		{
			y = 330,
			name = "node1",
			type = "node",
			x = 500,
			children = {
				{
					y = 0,
					name = "bg_progress1",
					type = "sprite",
					x = 0,
					anchorPoint = ccp(0, 0.5),
					pic = {
						frame = true,
						path = "guojiajingdudi1.png"
					}
				},
				{
					y = 0,
					name = "progress1",
					type = "progressbar",
					x = 0,
					anchorPoint = ccp(0, 0.5),
					progressType = kCCProgressTimerTypeBar,
					pic = {
						frame = true,
						path = "guojiajingdutiao1_1.png"
					}
				},
				{
					fontSize = 23,
					name = "lbl_lv1",
					y = 13,
					type = "label",
					x = 0,
					anchorPoint = ccp(0, 0),
					color = var_0_1
				},
				{
					fontSize = 22,
					name = "lbl_num1",
					y = 0,
					type = "label",
					x = 195,
					zorder = 100
				}
			}
		},
		{
			y = 155,
			name = "node2",
			type = "node",
			x = 400,
			children = {
				{
					y = 0,
					x = 0,
					type = "sprite",
					scale = 0.6,
					pic = {
						path = "res/ui/playerInfo/role_nation_view.png"
					}
				},
				{
					fontSize = 26,
					name = "force2",
					y = 0,
					type = "label",
					x = 0
				},
				{
					y = -10,
					name = "bg_progress2",
					type = "sprite",
					x = 20,
					anchorPoint = ccp(0, 0.5),
					pic = {
						frame = true,
						path = "guojiajingdudi1.png"
					}
				},
				{
					y = -10,
					name = "progress2",
					type = "progressbar",
					x = 20,
					anchorPoint = ccp(0, 0.5),
					progressType = kCCProgressTimerTypeBar,
					pic = {
						frame = true,
						path = "guojiajingdutiao1_1.png"
					}
				},
				{
					fontSize = 23,
					name = "lbl_lv2",
					y = 0,
					type = "label",
					x = 25,
					anchorPoint = ccp(0, 0),
					color = var_0_1
				},
				{
					fontSize = 23,
					name = "lbl_num2",
					y = -10,
					type = "label",
					x = 250
				},
				{
					x = 340,
					name = "icon2",
					y = 15,
					type = "sprite",
					scale = 0.5,
					pic = {
						path = "res/ui/kfyz/wait/yyyz_frd_icon.png"
					}
				},
				{
					x = 400,
					name = "sprite2",
					y = 15,
					type = "sprite",
					scale = 0.8,
					pic = {
						path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
					}
				},
				{
					x = 440,
					name = "mine2",
					type = "atlaslabel",
					pic = "res/ui/common/number/yyyz_word_frd_digit.png",
					startCharMap = 48,
					text = "0",
					y = 15,
					itemWidth = 18,
					scale = 0.8,
					itemHeight = 26,
					anchorPoint = ccp(0, 0.5)
				}
			}
		},
		{
			y = 85,
			name = "node3",
			type = "node",
			x = 400,
			children = {
				{
					y = 0,
					x = 0,
					type = "sprite",
					scale = 0.6,
					pic = {
						path = "res/ui/playerInfo/role_nation_view.png"
					}
				},
				{
					fontSize = 26,
					name = "force3",
					y = 0,
					type = "label",
					x = 0
				},
				{
					y = -10,
					name = "bg_progress3",
					type = "sprite",
					x = 20,
					anchorPoint = ccp(0, 0.5),
					pic = {
						frame = true,
						path = "guojiajingdudi1.png"
					}
				},
				{
					y = -10,
					name = "progress3",
					type = "progressbar",
					x = 20,
					anchorPoint = ccp(0, 0.5),
					progressType = kCCProgressTimerTypeBar,
					pic = {
						frame = true,
						path = "guojiajingdutiao1_1.png"
					}
				},
				{
					fontSize = 23,
					name = "lbl_lv3",
					y = 0,
					type = "label",
					x = 25,
					anchorPoint = ccp(0, 0),
					color = var_0_1
				},
				{
					fontSize = 23,
					name = "lbl_num3",
					y = -10,
					type = "label",
					x = 250
				},
				{
					x = 340,
					name = "icon3",
					y = 15,
					type = "sprite",
					scale = 0.5,
					pic = {
						path = "res/ui/kfyz/wait/yyyz_frd_icon.png"
					}
				},
				{
					x = 400,
					name = "sprite3",
					y = 15,
					type = "sprite",
					scale = 0.8,
					pic = {
						path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
					}
				},
				{
					x = 440,
					name = "mine3",
					type = "atlaslabel",
					pic = "res/ui/common/number/yyyz_word_frd_digit.png",
					startCharMap = 48,
					text = "0",
					y = 15,
					itemWidth = 18,
					scale = 0.8,
					itemHeight = 26,
					anchorPoint = ccp(0, 0.5)
				}
			}
		},
		{
			y = 75,
			name = "node4",
			type = "node",
			x = 40,
			children = {
				{
					y = 0,
					name = "bg_progress4",
					type = "sprite",
					x = 0,
					anchorPoint = ccp(0, 0.5),
					pic = {
						frame = true,
						path = "guojiajingdudi1.png"
					}
				},
				{
					y = 0,
					name = "progress4",
					type = "progressbar",
					x = 0,
					anchorPoint = ccp(0, 0.5),
					progressType = kCCProgressTimerTypeBar,
					pic = {
						frame = true,
						path = "guojiajingdutiao1_4.png"
					}
				},
				{
					fontSize = 23,
					name = "lbl_lv4",
					y = 10,
					type = "label",
					x = 0,
					anchorPoint = ccp(0, 0),
					color = var_0_1
				},
				{
					fontSize = 23,
					name = "lbl_num4",
					y = 0,
					type = "label",
					x = 140
				}
			}
		},
		{
			fontSize = 25,
			name = "lbl_npcTopLv",
			y = 90,
			type = "label",
			x = 180,
			color = var_0_1
		},
		{
			fontSize = 25,
			name = "not_open2",
			type = "label",
			visible = false,
			y = 150,
			x = 180,
			textId = 91025,
			color = var_0_1
		},
		{
			name = "btn_try",
			h = 62,
			type = "button",
			w = 180,
			y = 270,
			x = 600,
			normal = {
				path = "res/ui/common/button/public_btn_red.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_red_c.png"
			},
			children = {
				{
					name = "try_name",
					width = 100,
					type = "label",
					height = 0,
					textId = 91005,
					style = "label_warlock",
					y = 34,
					x = 90,
					fontSize = 25 + (var_0_0.tryBtnFntSize or 0),
					color = var_0_1
				},
				{
					fontSize = 20,
					name = "try_info",
					y = 5,
					type = "label",
					x = 90,
					anchorPoint = ccp(0.5, 1),
					color = var_0_1
				}
			}
		},
		{
			name = "btn_upgrade",
			h = 62,
			type = "button",
			w = 180,
			y = 270,
			x = 800,
			normal = {
				path = "res/ui/common/button/public_btn_green.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_green_c.png"
			},
			children = {
				{
					name = "btn_upgrade_word",
					y = 34,
					type = "label",
					style = "label_warlock",
					x = 90,
					textId = 91007,
					fontSize = 25 + (var_0_0.upgradeBtnFntSize or 0),
					color = var_0_1
				},
				{
					fontSize = 20,
					name = "btn_upgrade_info",
					y = 0,
					type = "label",
					style = "label_warlock",
					x = 90,
					color = var_0_1
				}
			}
		},
		{
			y = 147,
			name = "btn_att",
			h = 62,
			type = "button",
			w = 180,
			visible = false,
			x = 180,
			normal = {
				path = "res/ui/common/button/public_btn_red.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_red_c.png"
			},
			children = {
				{
					height = 0,
					width = 100,
					type = "label",
					textId = 390540,
					style = "label_warlock",
					y = 34,
					x = 90,
					fontSize = 25 + (var_0_0.fqBtnSize or 0),
					color = var_0_1
				}
			}
		},
		{
			fontSize = 22,
			name = "buildNationRush",
			y = 30,
			type = "label",
			x = 480,
			visible = false,
			color = ccc3(255, 255, 0),
			text = language.get("222301_buildNationRush")
		}
	}
}
var_0_10.layout_btn = {
	w = 39,
	name = "btn",
	h = 42,
	type = "button",
	y = 0,
	x = 0,
	normal = {
		path = "res/ui/nation/buildNation/dongying/sjwc_pb_dao.png"
	},
	touched = {
		path = "res/ui/nation/buildNation/dongying/sjwc_pb_dao.png"
	}
}
var_0_10.kingNotice = {
	y = 0,
	name = "bg_notice",
	type = "sprite",
	x = 0,
	anchorPoint = ccp(0, 0),
	pic = {
		path = "res/ui/nation/kingNotice/gwgg_bg.png"
	},
	children = {
		{
			name = "btn_show",
			h = 76,
			type = "button",
			w = 95,
			y = 325,
			x = -40,
			normal = {
				path = "res/ui/nation/kingNotice/gwgg_btn_arrows.png"
			},
			touched = {
				path = "res/ui/nation/kingNotice/gwgg_btn_arrows_c.png"
			},
			children = {
				{
					y = 38,
					x = 48.5,
					type = "sprite",
					pic = {
						path = "res/ui/nation/kingNotice/gwgg_btn_pen.png"
					}
				}
			}
		},
		{
			w = 95,
			name = "btn_hide",
			h = 76,
			type = "button",
			y = 325,
			x = 50,
			normal = {
				path = "res/ui/nation/kingNotice/gwgg_btn_arrows.png"
			},
			touched = {
				path = "res/ui/nation/kingNotice/gwgg_btn_arrows_c.png"
			}
		},
		{
			w = 195,
			name = "btn_cancel",
			h = 62,
			type = "button",
			y = 45,
			x = 182,
			normal = {
				path = "res/ui/common/button/public_btn_red.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_red_c.png"
			}
		},
		{
			w = 195,
			name = "btn_update",
			h = 62,
			type = "button",
			y = 45,
			x = 462,
			normal = {
				path = "res/ui/common/button/public_btn_green.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_green_c.png"
			}
		},
		{
			y = 325,
			x = 50,
			type = "sprite",
			pic = {
				path = "res/ui/nation/kingNotice/gwgg_btn_pen.png"
			}
		},
		{
			fontSize = 30,
			y = 320,
			type = "label",
			x = 322,
			textId = 91019,
			color = var_0_1
		},
		{
			fontSize = 25,
			y = 48,
			type = "label",
			x = 182,
			textId = 10002,
			color = var_0_1
		},
		{
			fontSize = 25,
			y = 48,
			type = "label",
			x = 462,
			textId = 91022,
			color = var_0_1
		},
		{
			fontSize = 30,
			name = "lbl_input",
			y = 213,
			type = "label",
			x = 322,
			color = ccc3(235, 209, 167)
		}
	}
}

function var_0_10.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getNationInfo)
end

function var_0_10.onBtnTryTap(arg_4_0)
	local function var_4_0(arg_5_0)
		return
	end

	if user.kbLv and user.kbLv >= 1 then
		messageBox.confirm(language.get("221060_buildNation"), function()
			cmgr.sendRequest(var_4_0, actions.startBuildNation)
		end)
	else
		messageBox.confirm(language.get(91001), function()
			cmgr.sendRequest(var_4_0, actions.nationOpenTry)
		end)
	end
end

function var_0_10.onBtnUpgradeTap(arg_8_0)
	if var_0_8 == 1 then
		local function var_8_0(arg_9_0)
			smgr.showTipTextGreen(language.get(91003))
		end

		messageBox.confirm(language.get(91002), function()
			cmgr.sendRequest(var_8_0, actions.startNationTask, 1)
		end)
	elseif var_0_8 == 2 then
		local function var_8_1(arg_11_0)
			smgr.showTipTextGreen(language.get("220954_buildNation"))
		end

		messageBox.confirm(language.get("220953_buildNation"), function()
			cmgr.sendRequest(var_8_1, actions.startBuildNation)
		end)
	elseif var_0_8 == 3 then
		local var_8_2 = require("lua/layer/nation/nationTab/ChangeNationName").new(arg_8_0.info.changeNameGold)
		local var_8_3 = smgr.getLayer("topLayer")

		var_8_3:removeAllChildrenWithCleanup(true)
		var_8_3:addChild(var_8_2)
	end
end

function var_0_10.updateKingNotice(arg_13_0, arg_13_1)
	local function var_13_0(arg_14_0)
		arg_13_0.view.widgets.lbl_input:setString(arg_13_1)
		arg_13_0:effectHideKingNotice()

		local var_14_0 = CCSprite:create("res/ui/nation/kingNotice/gwgg_word_fzcg.png")
		local var_14_1 = visibleSize.width * 0.5
		local var_14_2 = visibleSize.height * 0.5

		var_14_0:setPosition(ccp(var_14_1, var_14_2))
		smgr.showTipSpriteText(var_14_0, nil)
	end

	cmgr.sendRequest(var_13_0, actions.updateKingNotice, arg_13_1)
end

function var_0_10.getKingNoticeInfo(arg_15_0)
	local function var_15_0(arg_16_0)
		arg_15_0.view.widgets.lbl_input:setString(arg_16_0.action.data.notice)
	end

	cmgr.sendRequest(var_15_0, actions.getKingNoticeInfo)
end

function var_0_10.effectShowKingNotice(arg_17_0)
	if arg_17_0.scrollLayer then
		arg_17_0.view.widgets.btn_show:setVisible(false)
		arg_17_0.view.widgets.btn_try:setEnabled(false)
		arg_17_0.view.widgets.btn_upgrade:setEnabled(false)

		local var_17_0 = CCArray:create()

		var_17_0:addObject(CCMoveTo:create(0.5, ccp(0, 0)))
		var_17_0:addObject(CCCallFuncN:create(function()
			return
		end))

		local var_17_1 = CCSequence:create(var_17_0)

		arg_17_0.scrollLayer:runAction(var_17_1)
	end
end

function var_0_10.effectHideKingNotice(arg_19_0)
	if arg_19_0.scrollLayer then
		local var_19_0 = CCArray:create()

		var_19_0:addObject(CCMoveTo:create(0.5, ccp(644, 0)))
		var_19_0:addObject(CCCallFuncN:create(function()
			arg_19_0.view.widgets.btn_show:setVisible(true)
			arg_19_0.view.widgets.btn_try:setEnabled(true)
			arg_19_0.view.widgets.btn_upgrade:setEnabled(true)
		end))

		local var_19_1 = CCSequence:create(var_19_0)

		arg_19_0.scrollLayer:runAction(var_19_1)
	end
end

function var_0_10.initKingNotice(arg_21_0)
	local var_21_0 = CCLayerColor:create(ccc4(0, 255, 0, 0), 644, 359)
	local var_21_1 = CCScrollView:create(CCSizeMake(644, 359), var_21_0)

	var_21_1:setPosition(ccp(268, 60))
	var_21_1:setDirection(kCCScrollViewDirectionHorizontal)
	var_21_1:setTouchEnabled(false)
	arg_21_0.view.widgets.panel:addChild(var_21_1, 200)
	uiutil.initWidgets(arg_21_0.view, arg_21_0.kingNotice)
	var_21_0:addChild(arg_21_0.view.widgets.bg_notice)
	arg_21_0.view.widgets.btn_hide:setScaleX(-1)
	arg_21_0.view.widgets.lbl_input:setDimensions(CCSizeMake(610, 150))
	arg_21_0.view.widgets.lbl_input:setHorizontalAlignment(kCCTextAlignmentLeft)
	arg_21_0.view.widgets.lbl_input:setVerticalAlignment(kCCVerticalTextAlignmentTop)
	var_21_0:setPosition(ccp(644, 0))

	arg_21_0.scrollLayer = var_21_0

	arg_21_0.view.widgets.btn_show:addHandleOfControlEvent(function()
		arg_21_0:effectShowKingNotice()
		arg_21_0:getKingNoticeInfo()

		if user.isNewKing then
			arg_21_0.arrow:removeFromParentAndCleanup(true)
			roleDialogue.control.loadSpeak(1523)

			user.isNewKing = nil
		end
	end, CCControlEventTouchUpInside)
	arg_21_0.view.widgets.btn_hide:addHandleOfControlEvent(function()
		arg_21_0:effectHideKingNotice()
	end, CCControlEventTouchUpInside)
	arg_21_0.view.widgets.btn_cancel:addHandleOfControlEvent(function()
		arg_21_0:effectHideKingNotice()
	end, CCControlEventTouchUpInside)
	arg_21_0.view.widgets.btn_update:addHandleOfControlEvent(function()
		local var_25_0 = arg_21_0.view.widgets.lbl_input:getString()

		if string.len(var_25_0) > 0 then
			arg_21_0:updateKingNotice(var_25_0)
		end
	end, CCControlEventTouchUpInside)

	local var_21_2 = CCScale9Sprite:create("res/ui/playerInfo/setting/set_fk_input_bg_small.jpg")
	local var_21_3 = CCEditBox:create(CCSizeMake(620, 50), var_21_2)

	var_21_3:setPosition(ccp(322, 105))
	var_21_3:setMaxLength(100)
	var_21_3:setReturnType(1)
	var_21_3:setPlaceHolder(language.get(91024))
	var_21_3:setInputMode(kEditBoxInputModeAny)
	var_21_3:setFontSize(25)
	arg_21_0.view.widgets.bg_notice:addChild(var_21_3)

	arg_21_0.editBox = var_21_3

	local function var_21_4(arg_26_0, arg_26_1)
		local var_26_0 = tolua.cast(arg_26_1, "CCEditBox")

		log.info("editBox", arg_26_0)

		if arg_26_0 == "began" then
			arg_21_0.isPrinting = true

			var_26_0:setText(arg_21_0.view.widgets.lbl_input:getString())
		elseif arg_26_0 == "changed" then
			if arg_21_0.isPrinting == true then
				arg_21_0.view.widgets.lbl_input:setString(var_26_0:getText())
			end
		elseif arg_26_0 == "ended" then
			arg_21_0.isPrinting = false

			var_26_0:setText("")
			var_26_0:setPlaceHolder(language.get(91024))
		end
	end

	arg_21_0.isPrinting = false

	var_21_3:registerScriptEditBoxHandler(var_21_4)

	if user.isNewKing then
		local var_21_5 = CCSprite:create("res/ui/guide/jiantou-xia.png")
		local var_21_6, var_21_7 = arg_21_0.view.widgets.btn_tip:getPosition()

		var_21_5:setPosition(ccp(var_21_6 + 20, var_21_7 - 50))
		arg_21_0.view.widgets.panel:addChild(var_21_5, 400)

		arg_21_0.arrow = var_21_5

		local var_21_8 = CCJumpBy:create(1, ccp(0, 0), 40, 1)

		var_21_5:runAction(CCRepeatForever:create(var_21_8))
	end
end

function var_0_10.showTip(arg_27_0, arg_27_1)
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

	local function var_27_1()
		local var_29_0 = 91018

		if arg_27_0.info.forceLv and arg_27_0.info.forceLv >= 9 then
			var_29_0 = "91018_wangchao"
		end

		local var_29_1 = {}
		local var_29_2 = ccc3(204, 185, 134)
		local var_29_3 = ccc3(102, 102, 102)

		var_29_1.tipsBg = {
			anchorPointX = 1,
			name = "tipsBg",
			z = 300,
			type = "pic_9_tips",
			pic = "frame:common_tip_frame_small.png",
			anchorPointY = 0.5,
			middleRect = CCRectMake(0, 0, 0, 0),
			preferedSize = CCSizeMake(290, 300),
			x = visibleSize.width - 100,
			y = visibleSize.height * 0.5,
			content = {
				{
					fontSize = 22,
					type = "label",
					top = 10,
					x = 76,
					text = language.get(91012, language.get(arg_27_0.info.forceLv >= 9 and 90012 or 90001))
				},
				{
					fontSize = 22,
					top = 40,
					type = "label",
					left = 15,
					text = language.get(var_29_0),
					align = kCCTextAlignmentLeft,
					color = arg_27_0.info.forceLv > 1 and var_29_2 or var_29_3
				}
			}
		}

		return var_29_1
	end

	local var_27_2 = {}
	local var_27_3 = autoUI.initUI(var_27_0, var_27_1())
	local var_27_4 = var_27_3.tipsBg:getContentSize().height

	if var_27_4 > visibleSize.height then
		var_27_3.tipsBg:setScale(visibleSize.height / var_27_4)
	end
end

function var_0_10.showTipDongying(arg_30_0, arg_30_1)
	log.info("should show tips ")

	local var_30_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_30_0:registerScriptTouchHandler(function(arg_31_0, arg_31_1, arg_31_2)
		if arg_31_0 == CCTOUCHBEGAN then
			return true
		elseif arg_31_0 == CCTOUCHMOVED then
			return true
		elseif arg_31_0 == CCTOUCHENDED then
			pcall(var_30_0.removeFromParentAndCleanup, var_30_0, true)

			return true
		end
	end, false, true)
	var_30_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_30_0, 60000)

	local function var_30_1()
		local var_32_0 = ({
			[2] = {
				{
					"222404_dongying",
					"222490_dongying"
				},
				{
					"222405_dongying",
					"222491_dongying"
				},
				{
					"222406_dongying",
					"222492_dongying"
				}
			},
			[3] = {
				{
					"222493_dongying",
					"222494_dongying"
				},
				{
					136552,
					136551
				},
				{
					136553,
					136551
				},
				{
					136554,
					136551
				}
			},
			[4] = {
				{
					136803,
					136800
				},
				{
					136804,
					136801
				},
				{
					136805,
					136802
				}
			},
			[5] = {
				{
					136851,
					136861
				},
				{
					136852,
					136862
				},
				{
					136853,
					136863
				}
			},
			[6] = {
				{
					218100,
					218103
				},
				{
					218101,
					218104
				},
				{
					218102,
					218105
				}
			}
		})[user.kbLv][arg_30_1]
		local var_32_1 = language.get(var_32_0[1])
		local var_32_2 = language.get(var_32_0[2], user.jpsStages[arg_30_1])
		local var_32_3 = {}
		local var_32_4 = ccc3(204, 185, 134)
		local var_32_5 = ccc3(102, 102, 102)

		var_32_3.tipsBg = {
			anchorPointX = 1,
			name = "tipsBg",
			z = 300,
			type = "pic_9_tips",
			pic = "frame:common_tip_frame_small.png",
			lineGap = 10,
			anchorPointY = 0.5,
			middleRect = CCRectMake(0, 0, 0, 0),
			preferedSize = CCSizeMake(290, 300),
			x = visibleSize.width - 100,
			y = visibleSize.height * 0.5,
			content = {
				{
					fontSize = 22,
					type = "label",
					text = var_32_1,
					align = kCCTextAlignmentLeft
				},
				{
					fontSize = 22,
					type = "label",
					text = var_32_2,
					align = kCCTextAlignmentLeft,
					color = var_32_4
				}
			}
		}

		return var_32_3
	end

	local var_30_2 = {}
	local var_30_3 = autoUI.initUI(var_30_0, var_30_1())
	local var_30_4 = var_30_3.tipsBg:getContentSize().height

	if var_30_4 > visibleSize.height then
		var_30_3.tipsBg:setScale(visibleSize.height / var_30_4)
	end
end

function var_0_10.showTipPopulation(arg_33_0)
	log.info("should show tips ")

	local var_33_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_33_0:registerScriptTouchHandler(function(arg_34_0, arg_34_1, arg_34_2)
		if arg_34_0 == CCTOUCHBEGAN then
			return true
		elseif arg_34_0 == CCTOUCHMOVED then
			return true
		elseif arg_34_0 == CCTOUCHENDED then
			pcall(var_33_0.removeFromParentAndCleanup, var_33_0, true)

			return true
		end
	end, false, true)
	var_33_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_33_0, 60000)

	local function var_33_1()
		return {
			tipsBg = {
				anchorPointX = 0,
				name = "tipsBg",
				z = 300,
				type = "pic_9_tips",
				pic = "frame:common_tip_frame_small.png",
				anchorPointY = 1,
				middleRect = CCRectMake(0, 0, 0, 0),
				preferedSize = CCSizeMake(290, 300),
				x = visibleSize.width - 100,
				y = visibleSize.height * 0.5,
				content = {
					{
						fontSize = 22,
						type = "label",
						text = language.get(var_0_7[arg_33_0.info.yzInfo.population].txt2),
						align = kCCTextAlignmentLeft,
						color = tool.hexToRgb(var_0_7[arg_33_0.info.yzInfo.population].color)
					},
					{
						fontSize = 22,
						type = "label",
						text = language.get(136320),
						align = kCCTextAlignmentLeft
					}
				}
			}
		}
	end

	local var_33_2 = {}
	local var_33_3 = autoUI.initUI(var_33_0, var_33_1())
	local var_33_4, var_33_5 = tool.getPositionInScreen(arg_33_0.view.widgets.btn_population)

	var_33_3.tipsBg:setPosition(var_33_4 - 50, var_33_5 - 16)
end

function var_0_10.showTipEquip(arg_36_0, arg_36_1, arg_36_2)
	log.info("should show tips ")

	local var_36_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_36_0:registerScriptTouchHandler(function(arg_37_0, arg_37_1, arg_37_2)
		if arg_37_0 == CCTOUCHBEGAN then
			return true
		elseif arg_37_0 == CCTOUCHMOVED then
			return true
		elseif arg_37_0 == CCTOUCHENDED then
			pcall(var_36_0.removeFromParentAndCleanup, var_36_0, true)

			return true
		end
	end, false, true)
	var_36_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_36_0, 60000)

	local function var_36_1()
		return {
			tipsBg = {
				anchorPointX = 0,
				name = "tipsBg",
				z = 300,
				type = "pic_9_tips",
				pic = "frame:common_tip_frame_small.png",
				anchorPointY = 1,
				middleRect = CCRectMake(0, 0, 0, 0),
				preferedSize = CCSizeMake(290, 300),
				x = visibleSize.width - 100,
				y = visibleSize.height * 0.5,
				content = {
					{
						fontSize = 22,
						type = "label",
						text = arg_36_1,
						align = kCCTextAlignmentLeft
					}
				}
			}
		}
	end

	local var_36_2 = {}
	local var_36_3 = autoUI.initUI(var_36_0, var_36_1())
	local var_36_4, var_36_5 = tool.getPositionInScreen(arg_36_2)

	var_36_3.tipsBg:setPosition(var_36_4 - 50, var_36_5 - 16)
end

function var_0_10.showPanel(arg_39_0, arg_39_1)
	if arg_39_1.yzInfo and arg_39_1.yzInfo.population and arg_39_1.yzInfo.population > 4 then
		arg_39_1.yzInfo.population = 4
	end

	arg_39_0.info = arg_39_1

	if user.player.forceId and arg_39_1.nations and arg_39_1.forceLv >= 9 then
		arg_39_0.view.widgets.nationNameNextHalf:setDisplayFrame(CCSprite:create("res/ui/nation/nation_jiwangchao.png"):displayFrame())
		arg_39_0.view.widgets.title_lv:setDisplayFrame(tool.spriteByName(string.format("nation_lv_%s.png", arg_39_1.nations[user.player.forceId].kbLv)):displayFrame())
		arg_39_0.view.widgets.nationNameNextHalf:setScale(var_0_0.jiWangChaoLabelScale or 1)
	else
		arg_39_0.view.widgets.title_lv:setDisplayFrame(tool.spriteByName(string.format("nation_lv_%s.png", arg_39_1.forceLv)):displayFrame())
		arg_39_0.view.widgets.nationNameNextHalf:setDisplayFrame(tool.spriteByName("nation_jiguojia.png"):displayFrame())
		arg_39_0.view.widgets.nationNameNextHalf:setScale(1)
	end

	arg_39_0.view.widgets.type:setString(language.get(91004, language.get(arg_39_0.info.forceLv >= 9 and 90012 or 90001)))

	if arg_39_1.yzInfo and arg_39_1.yzInfo.fbTokenNum then
		user.fbTokenNum = arg_39_1.yzInfo.fbTokenNum
	end

	if arg_39_1.forceLv >= 9 and arg_39_1.nations[user.player.forceId].exp >= arg_39_1.nations[user.player.forceId].maxExp and arg_39_1.nations[user.player.forceId].maxExp > 0 then
		arg_39_0.view.widgets.try_name:setString(language.get("221040_buildNation"))
		arg_39_0.view.widgets.try_info:stopAllActions()

		if arg_39_1.nextKbCd and arg_39_1.nextKbCd > 0 then
			arg_39_0.view.widgets.try_info:setVisible(true)
			arg_39_0.view.widgets.try_info:setColor(var_0_3)
			arg_39_0.view.widgets.try_info:setString(tool.getFormatTime(arg_39_1.nextKbCd))

			local var_39_0 = CCArray:create()

			var_39_0:addObject(CCDelayTime:create(0.5))
			var_39_0:addObject(CCCallFuncN:create(function()
				if arg_39_1.nextKbCd <= 0 then
					arg_39_0.view.widgets.try_info:stopAllActions()
					arg_39_0:refresh()
				else
					arg_39_0.view.widgets.try_info:setString(tool.getFormatTime(arg_39_1.nextKbCd))
				end
			end))

			local var_39_1 = CCSequence:create(var_39_0)

			arg_39_0.view.widgets.try_info:runAction(CCRepeatForever:create(var_39_1))
		else
			arg_39_0.view.widgets.try_info:setVisible(true)
			arg_39_0.view.widgets.try_info:setColor(var_0_1)
			arg_39_0.view.widgets.try_info:setString(language.get("220951_buildNation"))
		end
	else
		arg_39_0.view.widgets.try_name:setString(arg_39_1.name or language.get(91005))
		arg_39_0.view.widgets.try_info:stopAllActions()

		local var_39_2
		local var_39_3

		if arg_39_1.cd > 0 then
			var_39_3 = var_0_3

			arg_39_0.view.widgets.try_info:setString(language.get(91028, tool.getFormatTime(arg_39_1.cd)))

			local var_39_4 = CCArray:create()

			var_39_4:addObject(CCDelayTime:create(0.5))
			var_39_4:addObject(CCCallFuncN:create(function()
				if arg_39_1.cd <= 0 then
					arg_39_0.view.widgets.try_info:stopAllActions()
					arg_39_0:refresh()
				else
					arg_39_0.view.widgets.try_info:setString(language.get(91028, tool.getFormatTime(arg_39_1.cd)))
				end
			end))

			local var_39_5 = CCSequence:create(var_39_4)

			arg_39_0.view.widgets.try_info:runAction(CCRepeatForever:create(var_39_5))
		else
			if arg_39_1.times > 0 then
				var_39_2 = language.get(91006, arg_39_1.times)
				var_39_3 = var_0_4
			else
				if arg_39_1.totalNeedExp > 0 then
					var_39_2 = language.get(91027, arg_39_1.forceLv, arg_39_1.needExp, arg_39_1.totalExp)
				else
					var_39_2 = language.get(143047)
				end

				var_39_3 = var_0_1
			end

			arg_39_0.view.widgets.try_info:setString(var_39_2)
		end

		arg_39_0.view.widgets.try_info:setColor(var_39_3)
	end

	var_0_8 = 1

	if arg_39_1.forceLv >= 8 and user.player.forceId and arg_39_1.nations then
		if arg_39_1.forceLv == 8 or arg_39_1.forceLv == 9 and arg_39_1.nations[user.player.forceId].kbTaskState ~= 1 and arg_39_1.nations[user.player.forceId].kbTaskState ~= 0 and arg_39_1.nations[user.player.forceId].exp >= arg_39_1.nations[user.player.forceId].maxExp then
			var_0_8 = 2

			arg_39_0.view.widgets.btn_upgrade_word:setString(language.get("220952_buildNation"))

			if arg_39_1.nextKbCd and arg_39_1.nextKbCd > 0 then
				arg_39_0.view.widgets.btn_upgrade_info:setVisible(true)
				arg_39_0.view.widgets.btn_upgrade_info:setColor(var_0_3)
				arg_39_0.view.widgets.btn_upgrade_info:setString(tool.getFormatTime(arg_39_1.nextKbCd))

				local var_39_6 = CCArray:create()

				var_39_6:addObject(CCDelayTime:create(0.5))
				var_39_6:addObject(CCCallFuncN:create(function()
					if arg_39_1.nextKbCd <= 0 then
						arg_39_0.view.widgets.btn_upgrade_info:stopAllActions()
						arg_39_0:refresh()
					else
						arg_39_0.view.widgets.btn_upgrade_info:setString(tool.getFormatTime(arg_39_1.nextKbCd))
					end
				end))

				local var_39_7 = CCSequence:create(var_39_6)

				arg_39_0.view.widgets.btn_upgrade_info:runAction(CCRepeatForever:create(var_39_7))
			else
				arg_39_0.view.widgets.btn_upgrade_info:setVisible(true)
				arg_39_0.view.widgets.btn_upgrade_info:setColor(var_0_1)
				arg_39_0.view.widgets.btn_upgrade_info:setString(language.get("220951_buildNation"))
			end
		elseif arg_39_1.forceLv >= 9 then
			var_0_8 = 3

			arg_39_0.view.widgets.btn_upgrade_word:setString(language.get("220950_buildNation"))

			if arg_39_1.changeNameCd and arg_39_1.changeNameCd > 0 then
				arg_39_0.view.widgets.btn_upgrade_info:setVisible(true)
				arg_39_0.view.widgets.btn_upgrade_info:setColor(var_0_3)
				arg_39_0.view.widgets.btn_upgrade_info:setString(tool.getFormatTime(arg_39_1.changeNameCd))

				local var_39_8 = CCArray:create()

				var_39_8:addObject(CCDelayTime:create(0.5))
				var_39_8:addObject(CCCallFuncN:create(function()
					if arg_39_1.changeNameCd <= 0 then
						arg_39_0.view.widgets.btn_upgrade_info:stopAllActions()
						arg_39_0:refresh()
					else
						arg_39_0.view.widgets.btn_upgrade_info:setString(tool.getFormatTime(arg_39_1.changeNameCd))
					end
				end))

				local var_39_9 = CCSequence:create(var_39_8)

				arg_39_0.view.widgets.btn_upgrade_info:runAction(CCRepeatForever:create(var_39_9))
			else
				arg_39_0.view.widgets.btn_upgrade_info:setVisible(false)
			end
		end
	end

	local var_39_10 = arg_39_1.curHonor and arg_39_1.curHonor > 0

	arg_39_0.view.widgets.bg_honor:setVisible(var_39_10)

	if var_39_10 then
		arg_39_0.view.widgets.honor:setString(language.get(91029, arg_39_1.curHonor))
	end

	local var_39_11 = {}

	for iter_39_0, iter_39_1 in ipairs(arg_39_1.nations) do
		if iter_39_1.forceId == user.player.forceId then
			table.insert(var_39_11, 1, iter_39_1)
		else
			table.insert(var_39_11, iter_39_1)
		end
	end

	arg_39_1.nations = var_39_11

	local var_39_12 = {
		"blue",
		"red",
		"green"
	}

	for iter_39_2, iter_39_3 in ipairs(arg_39_1.nations) do
		arg_39_0.view.widgets["lbl_lv" .. iter_39_2]:setString(language.get(83027, iter_39_3.forceLv))

		if iter_39_2 == 1 then
			local var_39_13 = string.format("res/ui/playerInfo/nation_flag_%s.png", var_39_12[iter_39_3.forceId])

			arg_39_0.view.widgets.flag:setDisplayFrame(CCSprite:create(var_39_13):displayFrame())
		else
			arg_39_0.view.widgets["force" .. iter_39_2]:setColor(colorForce[iter_39_3.forceId])
		end

		arg_39_0.view.widgets["force" .. iter_39_2]:setString(user.forceIdToName[iter_39_3.forceId])

		local var_39_14 = 50

		if iter_39_2 == 1 then
			var_39_14 = 100
		end

		local var_39_15 = arg_39_0.view.widgets["force" .. iter_39_2]

		tool.fixLabelByWidth(var_39_15, var_39_14)
		arg_39_0.view.widgets["lbl_num" .. iter_39_2]:setString(language.get(390478, iter_39_3.exp, iter_39_3.maxExp))

		local var_39_16 = tool.spriteByName(string.format("guojiajingdutiao1_%s.png", iter_39_3.forceId))

		arg_39_0.view.widgets["progress" .. iter_39_2]:setSprite(var_39_16)
		arg_39_0.view.widgets["progress" .. iter_39_2]:setPercentage(100 * iter_39_3.exp / iter_39_3.maxExp)
		arg_39_0.view.widgets["mine" .. iter_39_2]:setString(iter_39_3.mineNum)
		rmgr.setTallyPic(iter_39_3.tally, arg_39_0.view.widgets["icon" .. iter_39_2])
	end

	if #user.jpsStages > 0 and (user.kbLv == 2 or user.kbLv == 3 or user.kbLv == 4 or user.kbLv == 5 or user.kbLv == 6) then
		local var_39_17 = {}
		local var_39_18 = user.jpsStages[#user.jpsStages]

		for iter_39_4, iter_39_5 in ipairs(user.jpsStages) do
			local var_39_19 = {}
			local var_39_20 = iter_39_5 / var_39_18 * 460 * 0.85

			table.insert(var_39_17, var_39_20)
			uiutil.initWidgets(var_39_19, arg_39_0.layout_btn)
			var_39_19.widgets.btn:setPositionX(var_39_20)
			arg_39_0.view.widgets.node1:addChild(var_39_19.widgets.btn)
			var_39_19.widgets.btn:addHandleOfControlEvent(function()
				arg_39_0:showTipDongying(iter_39_4)
			end, CCControlEventTouchUpInside)
		end

		if user.kbLv == 2 then
			arg_39_0.view.widgets.lbl_num1:setPositionX((var_39_17[1] + var_39_17[2]) / 2)
		elseif user.kbLv == 3 then
			arg_39_0.view.widgets.lbl_num1:setPositionX((var_39_17[2] + var_39_17[3]) / 2)
		end
	end

	if arg_39_1.yzInfo.yzExp and arg_39_1.yzInfo.maxYzExp then
		arg_39_0.view.widgets.bg_chuzheng:setVisible(true)
		arg_39_0.view.widgets.progress_chuzheng:setPercentage(100 * arg_39_1.yzInfo.yzExp / arg_39_1.yzInfo.maxYzExp)
		arg_39_0.view.widgets.word_chuzheng:setString(arg_39_1.yzInfo.yzExp .. "/" .. arg_39_1.yzInfo.maxYzExp)

		if arg_39_1.yzInfo.yzExp == arg_39_1.yzInfo.maxYzExp then
			arg_39_0.view.widgets.word_chuzheng:setString(language.get("222820_yuanzheng"))
			arg_39_0.view.widgets.word_chuzheng:setFontSize(18)
		end

		arg_39_0.view.widgets.population:setString(language.get(var_0_7[arg_39_1.yzInfo.population].txt1))
		arg_39_0.view.widgets.population:setColor(tool.hexToRgb(var_0_7[arg_39_1.yzInfo.population].color))
		arg_39_0.view.widgets.yzToken:setString(language.get(490026, arg_39_1.yzInfo.yzToken))
		arg_39_0.view.widgets.yzEquip:setString(language.get(490026, arg_39_1.yzInfo.loseTime))
	end

	local var_39_21 = arg_39_1.isTopdefNpcLv

	arg_39_0.view.widgets.lbl_npcTopLv:setVisible(var_39_21)
	arg_39_0.view.widgets.node4:setVisible(not var_39_21)

	if var_39_21 then
		arg_39_0.view.widgets.lbl_npcTopLv:setString(language.get(91031, arg_39_1.defNpcLv))
	else
		arg_39_0.view.widgets.lbl_lv4:setString(language.get(91026, arg_39_1.defNpcLv))
		arg_39_0.view.widgets.lbl_num4:setString(language.get(390478, arg_39_1.currentPoint, arg_39_1.totalPoint))
		arg_39_0.view.widgets.progress4:setPercentage(100 * arg_39_1.currentPoint / arg_39_1.totalPoint)
	end

	arg_39_0.view.widgets.btn_att:setVisible(arg_39_1.kfyzOpen)
	arg_39_0.view.widgets.mine1:setVisible(arg_39_1.kfyzOpen)
	arg_39_0.view.widgets.not_open1:setVisible(not arg_39_1.kfyzOpen)
	arg_39_0.view.widgets.not_open2:setVisible(not arg_39_1.kfyzOpen)
	arg_39_0.view.widgets.btn_population:setVisible(arg_39_1.kfyzOpen)
	arg_39_0.view.widgets.btn_yzToken:setVisible(arg_39_1.kfyzOpen)
	arg_39_0.view.widgets.btn_yzEquip:setVisible(arg_39_1.kfyzOpen)

	if arg_39_1.isKing and arg_39_1.canEditKingNotice then
		arg_39_0:initKingNotice()
	end

	if user.haveKindomBuildSprint and user.haveKindomBuildSprint == 1 then
		arg_39_0.view.widgets.buildNationRush:setVisible(true)
	end

	arg_39_0:refineLayout()
end

function var_0_10.ctor(arg_45_0, arg_45_1, arg_45_2)
	arg_45_0.view = {}

	uiutil.initWidgets(arg_45_0.view, arg_45_0.layout)
	arg_45_0:addChild(arg_45_0.view.widgets.panel)

	if arg_45_1 then
		arg_45_1:addChild(arg_45_0)
	end

	arg_45_0.view.widgets.bg_progress1:setScaleX(0.85)
	arg_45_0.view.widgets.bg_progress1:setScaleY(1.3)
	arg_45_0.view.widgets.progress1:setScaleX(0.85)
	arg_45_0.view.widgets.progress1:setScaleY(1.3)
	arg_45_0.view.widgets.progressbg_chuzheng:setScaleX(0.4)
	arg_45_0.view.widgets.progress_chuzheng:setScaleX(0.4)
	arg_45_0.view.widgets.bg_progress4:setScaleX(0.6)
	arg_45_0.view.widgets.progress4:setScaleX(0.6)
	arg_45_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		arg_45_0:showTip(language.get(390479))
	end, CCControlEventTouchUpInside)
	arg_45_0.view.widgets.btn_population:addHandleOfControlEvent(function()
		arg_45_0:showTipPopulation()
	end, CCControlEventTouchUpInside)
	arg_45_0.view.widgets.btn_yzToken:addHandleOfControlEvent(function()
		log.info("btn_yzToken")
		arg_45_0:showTipEquip(language.get(490153, arg_45_0.info.yzInfo.maxYzExp), arg_45_0.view.widgets.btn_yzToken)
	end, CCControlEventTouchUpInside)
	arg_45_0.view.widgets.btn_yzEquip:addHandleOfControlEvent(function()
		log.info("btn_yzEquip")
		arg_45_0:showTipEquip(language.get(490164, arg_45_0.info.yzInfo.loseTime, arg_45_0.info.yzInfo.bombNum, arg_45_0.info.deliverGoodsRank, arg_45_0.info.yzInfo.trapNum, user.fbTokenNum or 0), arg_45_0.view.widgets.btn_yzEquip)
	end, CCControlEventTouchUpInside)
	arg_45_0.view.widgets.btn_try:addHandleOfControlEvent(function()
		arg_45_0:onBtnTryTap()
	end, CCControlEventTouchUpInside)
	arg_45_0.view.widgets.btn_upgrade:addHandleOfControlEvent(function()
		arg_45_0:onBtnUpgradeTap()
	end, CCControlEventTouchUpInside)
	arg_45_0.view.widgets.btn_att:addHandleOfControlEvent(function()
		local var_52_0 = smgr.getLayer("topLayer")

		var_52_0:removeAllChildrenWithCleanup(true)
		require("lua/layer/kfyz/YuyueLayer").new(var_52_0)
	end, CCControlEventTouchUpInside)

	if arg_45_2 then
		arg_45_0:showPanel(arg_45_2)
	else
		arg_45_0:refresh()
	end
end

function var_0_10.onEnter(arg_53_0)
	arg_53_0.updateRef = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_53_0, arg_53_0.update), 0, false)
end

function var_0_10.onExit(arg_54_0)
	if arg_54_0.updateRef then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_54_0.updateRef)
	end
end

function var_0_10.update(arg_55_0, arg_55_1)
	if arg_55_0.info then
		for iter_55_0, iter_55_1 in ipairs(var_0_9) do
			if arg_55_0.info[iter_55_1] then
				if arg_55_0.info[iter_55_1] > 0 then
					arg_55_0.info[iter_55_1] = arg_55_0.info[iter_55_1] - 1000 * arg_55_1
				elseif arg_55_0.info[iter_55_1] <= 0 then
					arg_55_0.info[iter_55_1] = 0
				end
			end
		end
	end
end

function var_0_10.refineLayout(arg_56_0)
	arg_56_0.view.widgets.mine1:setAnchorPoint(ccp(0, 0.5))
	arg_56_0.view.widgets.mine1:setPositionX(arg_56_0.view.widgets.sprite1:getPositionX() + arg_56_0.view.widgets.sprite1:getContentSize().width / 2)

	for iter_56_0 = 2, 3 do
		arg_56_0.view.widgets["mine" .. iter_56_0]:setAnchorPoint(ccp(1, 0.5))
		arg_56_0.view.widgets["mine" .. iter_56_0]:setPositionX(500)
		arg_56_0.view.widgets["sprite" .. iter_56_0]:setAnchorPoint(ccp(1, 0.5))
		arg_56_0.view.widgets["sprite" .. iter_56_0]:setPositionX(arg_56_0.view.widgets["mine" .. iter_56_0]:getPositionX() - arg_56_0.view.widgets["mine" .. iter_56_0]:getContentSize().width * arg_56_0.view.widgets["mine" .. iter_56_0]:getScale())
		arg_56_0.view.widgets["icon" .. iter_56_0]:setAnchorPoint(ccp(1, 0.5))
		arg_56_0.view.widgets["icon" .. iter_56_0]:setPositionX(arg_56_0.view.widgets["sprite" .. iter_56_0]:getPositionX() - arg_56_0.view.widgets["sprite" .. iter_56_0]:getContentSize().width * arg_56_0.view.widgets["sprite" .. iter_56_0]:getScale())
	end
end

return var_0_10
