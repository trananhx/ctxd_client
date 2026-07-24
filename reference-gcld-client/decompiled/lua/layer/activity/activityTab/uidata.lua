local var_0_0 = class("activityTabUiData")
local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.cjExpOffset1 = 50
else
	var_0_1.cjExpOffset1 = 0
end

function var_0_0.ctor(arg_1_0, arg_1_1)
	local function var_1_0(arg_2_0, arg_2_1)
		arg_2_0[#arg_2_0 + 1] = arg_2_1

		return arg_2_1
	end

	arg_1_0.data = {}

	if arg_1_1 == activityConstant.TYPES.ACTIVITY_ZIYUAN.tag then
		arg_1_0.data.background = {
			xcenter = 0,
			name = "bgPic",
			type = "pic",
			ycenter = -30,
			pic = "res/ui/activity/ziyuan/zyfb_view_bg.jpg",
			children = {}
		}
	elseif arg_1_1 == activityConstant.TYPES.ACTIVITY_REDBOMB.tag then
		arg_1_0.data.background = {
			xcenter = 0,
			name = "bgPic",
			type = "pic",
			ycenter = -30,
			pic = "res/ui/activity/redBomb/czshb_view.jpg",
			children = {}
		}
	else
		arg_1_0.data.background = {
			xcenter = 0,
			name = "bgPic",
			type = "pic",
			ycenter = -30,
			pic = "res/ui/activity/acti_view_bg.jpg",
			children = {}
		}
	end

	if arg_1_1 == activityConstant.TYPES.ACTIVITY_LV_EXP.tag then
		var_1_0(arg_1_0.data.background.children, {
			x = 575,
			y = 500,
			pic = "frame:acti_tit_cjsjy.png",
			type = "pic"
		})

		local var_1_1 = var_1_0(arg_1_0.data.background.children, {
			name = "actRewardFalse",
			visible = false,
			type = "pic",
			pic = "",
			children = {}
		})

		var_1_0(var_1_1.children, {
			fontSize = 22,
			name = "actLefttime",
			type = "label",
			y = 413,
			x = 424,
			text = language.get(131022),
			color = ccc3(255, 0, 0)
		})
		var_1_0(var_1_1.children, {
			fontSize = 22,
			y = 413,
			type = "label",
			x = 510,
			text = language.get(131023)
		})
		var_1_0(var_1_1.children, {
			y = 413,
			pic = "res/ui/task/get_icon_exp.png",
			type = "pic",
			x = 560 + var_0_1.cjExpOffset1
		})
		var_1_0(var_1_1.children, {
			width = 16,
			height = 21,
			name = "actRewardExp",
			type = "atlas",
			pic = "res/ui/common/number/up_numb.png",
			text = "400",
			y = 413,
			startChar = 48,
			x = 635 + var_0_1.cjExpOffset1
		})
		var_1_0(var_1_1.children, {
			name = "actWan",
			y = 413,
			type = "pic",
			pic = "frame:up_numb_ten_thous.png",
			x = 695 + var_0_1.cjExpOffset1
		})
		var_1_0(var_1_1.children, {
			x = 363,
			name = "actCurArrow",
			y = 340,
			type = "pic",
			pic = "frame:acti_cjsjy_degr_now.png",
			children = {
				{
					fontSize = 22,
					name = "actCurLv",
					text = "Lv.100.00",
					type = "label",
					xcenter = 0,
					y = 30
				}
			}
		})
		var_1_0(var_1_1.children, {
			y = 316,
			x = 595,
			type = "pic",
			pic = "frame:acti_cjsjy_degr_view.png",
			children = {
				{
					xcenter = 0,
					name = "actExpBar",
					percentage = 20,
					type = "process",
					ycenter = 0,
					pic = "frame:acti_cjsjy_degr_con.png"
				},
				{
					fontSize = 22,
					name = "actStartLv",
					text = "Lv.99.00",
					type = "label",
					y = -20,
					x = 0
				},
				{
					fontSize = 22,
					name = "actEndLv",
					text = "Lv.101.00",
					type = "label",
					y = -20,
					x = 468
				}
			}
		})

		local var_1_2 = var_1_0(var_1_1.children, {
			y = 147,
			x = 607,
			type = "pic",
			pic = "res/ui/activity/acti_cjsjy_list_bg.jpg",
			children = {}
		})
		local var_1_3 = {}

		if conf.language == "kr" then
			var_1_3.offset0 = 0
			var_1_3.offset1 = 0
			var_1_3.offset2 = 0
			var_1_3.offset3 = 0
			var_1_3.offset4 = 0
			var_1_3.offset5 = 0
			var_1_3.offset6 = 0
			var_1_3.needFontSize = 0
			var_1_3.needFontWidth = 0
		elseif conf.language == "vie" then
			var_1_3.offset0 = 0
			var_1_3.offset1 = 0
			var_1_3.offset2 = 0
			var_1_3.offset3 = -15
			var_1_3.offset4 = 0
			var_1_3.offset5 = 0
			var_1_3.offset6 = 0
			var_1_3.needFontSize = -2
			var_1_3.needFontWidth = -50
		else
			var_1_3.offset0 = 0
			var_1_3.offset1 = 0
			var_1_3.offset2 = 0
			var_1_3.offset3 = 0
			var_1_3.offset4 = 0
			var_1_3.offset5 = 0
			var_1_3.offset6 = 0
			var_1_3.needFontSize = 0
			var_1_3.needFontWidth = 0
		end

		for iter_1_0 = 1, 5 do
			local var_1_4 = var_1_0(var_1_2.children, {
				type = "pic",
				visible = false,
				pic = "frame:acti_icon_fini.png",
				name = "actRewardStateIcon_" .. iter_1_0,
				x = 30 + var_1_3.offset0,
				y = 192 - (iter_1_0 - 1) * 41,
				children = {}
			})

			var_1_0(var_1_4.children, {
				fontSize = 22,
				type = "label",
				ycenter = 0,
				width = 150,
				name = "actRewardDesc_" .. iter_1_0,
				text = language.get(131035),
				align = kCCTextAlignmentLeft,
				left = 50 + var_1_3.offset4
			})
			var_1_0(var_1_4.children, {
				fontSize = 22,
				type = "label",
				ycenter = 0,
				width = 50,
				text = language.get(131024),
				align = kCCTextAlignmentLeft,
				left = 200 + var_1_3.offset5
			})
			var_1_0(var_1_4.children, {
				ycenter = 0,
				pic = "res/ui/task/get_icon_exp.png",
				type = "pic",
				left = 250 + var_1_3.offset6
			})
			var_1_0(var_1_4.children, {
				pic = "res/ui/common/number/up_numb.png",
				height = 21,
				type = "atlas",
				ycenter = 0,
				text = "400",
				startChar = 48,
				width = 16,
				name = "actRewardExp_" .. iter_1_0,
				left = 335 + var_1_3.offset1
			})
			var_1_0(var_1_4.children, {
				type = "pic",
				ycenter = 0,
				pic = "frame:up_numb_ten_thous.png",
				name = "actRewardExpWan_" .. iter_1_0,
				left = 410 + var_1_3.offset2
			})
			var_1_0(var_1_4.children, {
				height = 0,
				type = "label",
				ycenter = 0,
				visible = false,
				name = "actNeed_" .. iter_1_0,
				text = language.get(131025),
				fontSize = 20 + var_1_3.needFontSize,
				width = 180 + var_1_3.needFontWidth,
				align = kCCTextAlignmentLeft,
				x = 532 + var_1_3.offset3
			})
		end

		local var_1_5 = var_1_0(arg_1_0.data.background.children, {
			name = "actRewardTrue",
			pic = "",
			type = "pic",
			children = {}
		})

		var_1_0(var_1_5.children, {
			fontSize = 22,
			y = 413,
			type = "label",
			x = 575,
			text = language.get(131026),
			color = ccc3(255, 0, 0)
		})
		var_1_0(var_1_5.children, {
			fontSize = 22,
			name = "actDesc",
			type = "label",
			y = 343,
			x = 575,
			text = language.get(131027)
		})
		var_1_0(var_1_5.children, {
			type = "button",
			buttons = {
				{
					pic2 = "frame:nationButtonGreen1.png",
					name = "actDrawReward",
					pic1 = "frame:nationButtonGreen.png",
					y = 119,
					x = 575,
					children = {
						{
							xcenter = 0,
							fontSize = 22,
							type = "label",
							ycenter = 0,
							strokeSize = 2,
							text = language.get(131028),
							color = colorText[10004],
							strokeColor = colorText[10005]
						}
					}
				}
			}
		})
	elseif arg_1_1 == activityConstant.TYPES.ACTIVITY_IRON.tag then
		local var_1_6 = {}

		if conf.language == "kr" then
			var_1_6.offset1 = 0
			var_1_6.offset2 = 0
			var_1_6.offset3 = 30
			var_1_6.offset4 = 0
			var_1_6.offset5 = 0
			var_1_6.offset6 = -50
		elseif conf.language == "vie" then
			var_1_6.offset1 = 0
			var_1_6.offset2 = 0
			var_1_6.offset3 = 10
			var_1_6.offset4 = 80
			var_1_6.offset5 = 80
			var_1_6.offset6 = 0
		else
			var_1_6.offset1 = 0
			var_1_6.offset2 = 0
			var_1_6.offset3 = 0
			var_1_6.offset4 = 0
			var_1_6.offset5 = 0
			var_1_6.offset6 = 0
		end

		var_1_0(arg_1_0.data.background.children, {
			x = 575,
			y = 500,
			pic = "frame:acti_tit_btdhk.png",
			type = "pic"
		})
		var_1_0(arg_1_0.data.background.children, {
			y = 495,
			type = "button",
			x = 770 + var_1_6.offset6,
			buttons = {
				{
					pic2 = "frame:btnTip_a.png",
					name = "tipItem",
					pic1 = "frame:btnTip_c.png"
				}
			}
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			name = "actLefttime",
			type = "label",
			y = 413,
			x = 444,
			text = language.get(131022),
			color = ccc3(255, 0, 0)
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			y = 413,
			type = "label",
			x = 510,
			text = language.get(131029)
		})
		var_1_0(arg_1_0.data.background.children, {
			x = 560,
			y = 413,
			pic = "res/ui/task/get_icon_iron.png",
			type = "pic"
		})
		var_1_0(arg_1_0.data.background.children, {
			width = 16,
			height = 21,
			name = "actSurplus",
			type = "atlas",
			pic = "res/ui/common/number/up_numb.png",
			text = "180000",
			y = 413,
			startChar = 48,
			x = 630
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			y = 413,
			type = "label",
			x = 720,
			text = language.get(131030)
		})
		var_1_0(arg_1_0.data.background.children, {
			x = 363,
			name = "actCurArrow",
			y = 340,
			type = "pic",
			pic = "frame:acti_cjsjy_degr_now.png"
		})
		var_1_0(arg_1_0.data.background.children, {
			y = 318,
			x = 538,
			type = "pic",
			pic = "frame:acti_btdhk_degr_view.png",
			children = {
				{
					xcenter = 0,
					name = "actIronBar",
					percentage = 20,
					type = "process",
					ycenter = 0,
					pic = "frame:acti_btdhk_degr_con.png"
				}
			}
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			name = "actCurIron",
			type = "label",
			y = 360,
			x = 835,
			text = language.get(131036)
		})
		var_1_0(arg_1_0.data.background.children, {
			type = "button",
			buttons = {
				{
					pic2 = "frame:nationButtonGreen1.png",
					name = "actDrawIron",
					pic1 = "frame:nationButtonGreen.png",
					y = 320,
					x = 835,
					children = {
						{
							xcenter = 0,
							fontSize = 22,
							type = "label",
							ycenter = 0,
							strokeSize = 2,
							text = language.get(131037),
							color = colorText[10004],
							strokeColor = colorText[10005]
						}
					}
				}
			}
		})

		local var_1_7 = var_1_0(arg_1_0.data.background.children, {
			y = 147,
			x = 607,
			type = "pic",
			pic = "res/ui/activity/acti_btdhk_list_bg.jpg",
			children = {}
		})

		for iter_1_1 = 1, 6 do
			local var_1_8 = var_1_0(var_1_7.children, {
				type = "pic",
				visible = false,
				pic = "frame:acti_icon_fini.png",
				name = "actRewardStateIcon_" .. iter_1_1,
				x = 60 + var_1_6.offset2,
				y = 233 - (iter_1_1 - 1) * 41,
				children = {}
			})

			var_1_0(var_1_8.children, {
				fontSize = 22,
				type = "label",
				ycenter = 0,
				width = 300,
				name = "actRewardDesc_" .. iter_1_1,
				text = language.get(131038),
				align = kCCTextAlignmentLeft,
				left = 50 + var_1_6.offset1
			})
			var_1_0(var_1_8.children, {
				fontSize = 22,
				type = "label",
				ycenter = 0,
				width = 300,
				text = language.get(131023),
				align = kCCTextAlignmentLeft,
				left = 200 + var_1_6.offset3
			})
			var_1_0(var_1_8.children, {
				ycenter = 0,
				pic = "res/ui/task/get_icon_iron.png",
				type = "pic",
				left = 250 + var_1_6.offset4
			})
			var_1_0(var_1_8.children, {
				type = "atlas",
				height = 21,
				anchorPointX = 0,
				ycenter = 0,
				pic = "res/ui/common/number/up_numb.png",
				text = "400",
				startChar = 48,
				width = 16,
				name = "actRewardIron_" .. iter_1_1,
				left = 280 + var_1_6.offset5
			})
			var_1_0(var_1_8.children, {
				fontSize = 20,
				width = 180,
				type = "label",
				ycenter = 0,
				visible = false,
				name = "actNeed_" .. iter_1_1,
				text = language.get(131039),
				align = kCCTextAlignmentLeft,
				x = 477 + var_1_6.offset5
			})
		end
	elseif arg_1_1 == activityConstant.TYPES.ACTIVITY_QUENCHING.tag then
		var_1_0(arg_1_0.data.background.children, {
			x = 575,
			y = 500,
			pic = "frame:acti_tit_xlhd.png",
			type = "pic"
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			name = "actLefttime",
			type = "label",
			y = 413,
			x = 575,
			text = language.get(131022),
			color = ccc3(255, 0, 0)
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 24,
			y = 346,
			type = "label",
			x = 575,
			text = language.get(131040)
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			y = 296,
			type = "label",
			x = 575,
			text = language.get(131041)
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			y = 246,
			type = "label",
			x = 499,
			text = language.get(131042)
		})
		var_1_0(arg_1_0.data.background.children, {
			type = "button",
			buttons = {
				{
					pic2 = "frame:nationButtonGreen1.png",
					name = "actGoToQuenching",
					pic1 = "frame:nationButtonGreen.png",
					y = 119,
					x = 575,
					children = {
						{
							xcenter = 0,
							fontSize = 20,
							type = "label",
							ycenter = 0,
							strokeSize = 2,
							text = language.get(131043),
							color = colorText[10004],
							strokeColor = colorText[10005]
						}
					}
				}
			}
		})
	elseif arg_1_1 == activityConstant.TYPES.ACTIVITY_DRAGON.tag then
		local var_1_9 = {}

		if conf.language == "kr" then
			var_1_9.offset1 = 22
			var_1_9.offset2 = 18
			var_1_9.offset3 = 5
			var_1_9.leftX = 0
			var_1_9.entryLineFntSize = 0
		elseif conf.language == "vie" then
			var_1_9.offset1 = 0
			var_1_9.offset2 = 0
			var_1_9.offset3 = 0
			var_1_9.leftX = -50
			var_1_9.entryLineFntSize = -10
		else
			var_1_9.offset1 = 0
			var_1_9.offset2 = 0
			var_1_9.offset3 = 0
			var_1_9.leftX = 0
			var_1_9.entryLineFntSize = 0
		end

		var_1_0(arg_1_0.data.background.children, {
			x = 475,
			y = 500,
			pic = "frame:acti_tit_gcqbx.png",
			type = "pic"
		})
		var_1_0(arg_1_0.data.background.children, {
			x = 676,
			name = "actDragonIcon_1",
			y = 500,
			type = "pic",
			pic = "frame:acti_gcqbx_icon_gc.png",
			children = {
				{
					fontSize = 18,
					name = "actDragonNum1",
					text = "x1",
					type = "label",
					down = 5,
					right = 5
				}
			}
		})
		var_1_0(arg_1_0.data.background.children, {
			x = 766,
			name = "actDragonIcon_2",
			y = 500,
			type = "pic",
			pic = "frame:acti_gcqbx_icon_zg'.png",
			children = {
				{
					fontSize = 18,
					name = "actDragonNum2",
					text = "x1",
					type = "label",
					down = 5,
					right = 5
				}
			}
		})
		var_1_0(arg_1_0.data.background.children, {
			x = 856,
			name = "actDragonIcon_3",
			y = 500,
			type = "pic",
			pic = "frame:acti_gcqbx_icon_zz.png",
			children = {
				{
					fontSize = 18,
					name = "actDragonNum3",
					text = "x1",
					type = "label",
					down = 5,
					right = 5
				}
			}
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			name = "actLefttime",
			type = "label",
			y = 413,
			text = language.get(131022),
			color = ccc3(255, 0, 0),
			x = 444 + var_1_9.leftX
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			name = "actDesc",
			type = "label",
			y = 413,
			x = 630,
			text = language.get(131044)
		})
		var_1_0(arg_1_0.data.background.children, {
			x = 338,
			name = "actCurArrow",
			y = 355,
			type = "pic",
			pic = "frame:acti_cjsjy_degr_now.png"
		})
		var_1_0(arg_1_0.data.background.children, {
			y = 332,
			x = 570,
			type = "pic",
			pic = "frame:acti_cjsjy_degr_view.png",
			children = {
				{
					xcenter = 0,
					name = "actDragonBar",
					percentage = 20,
					type = "process",
					ycenter = 0,
					pic = "frame:acti_cjsjy_degr_con.png"
				},
				{
					ycenter = 0,
					x = 66.85714285714286,
					pic = "frame:acti_cjsjy_degr_div.png",
					type = "pic"
				},
				{
					ycenter = 0,
					x = 133.71428571428572,
					pic = "frame:acti_cjsjy_degr_div.png",
					type = "pic"
				},
				{
					ycenter = 0,
					x = 200.57142857142858,
					pic = "frame:acti_cjsjy_degr_div.png",
					type = "pic"
				},
				{
					ycenter = 0,
					x = 267.42857142857144,
					pic = "frame:acti_cjsjy_degr_div.png",
					type = "pic"
				},
				{
					ycenter = 0,
					x = 334.28571428571433,
					pic = "frame:acti_cjsjy_degr_div.png",
					type = "pic"
				},
				{
					ycenter = 0,
					x = 401.14285714285717,
					pic = "frame:acti_cjsjy_degr_div.png",
					type = "pic"
				}
			}
		})
		var_1_0(arg_1_0.data.background.children, {
			x = 850,
			name = "actBox",
			y = 342,
			type = "pic",
			pic = "frame:web_shine0001.png",
			children = {
				{
					x = 29,
					y = 13,
					pic = "frame:resou_up_muiti.png",
					type = "pic"
				},
				{
					type = "atlas",
					height = 22,
					name = "actDragonMulti",
					anchorPointX = 0,
					x = 40,
					pic = "res/ui/common/number/resou_up_numb.png",
					text = "100",
					y = 13,
					startChar = 48,
					width = 20
				}
			}
		})

		local var_1_10 = var_1_0(arg_1_0.data.background.children, {
			y = 162,
			x = 607,
			type = "pic",
			pic = "res/ui/activity/acti_list8_bg.jpg",
			children = {}
		})

		for iter_1_2 = 1, 8 do
			var_1_0(var_1_10.children, {
				x = 36,
				type = "pic",
				pic = "frame:acti_icon_fini.png",
				name = "actRewardStateIcon_" .. iter_1_2,
				y = 264 - (iter_1_2 - 1) * 34,
				children = {
					{
						type = "label",
						ycenter = 0,
						width = 400,
						x = 240,
						name = "actRewardDesc_" .. iter_1_2,
						text = language.get(131045),
						fontSize = 24 + var_1_9.entryLineFntSize,
						align = kCCTextAlignmentLeft
					},
					{
						type = "label",
						ycenter = 0,
						x = 290,
						text = language.get(131046),
						fontSize = 24 + var_1_9.entryLineFntSize
					},
					{
						type = "atlas",
						height = 21,
						anchorPointX = 0,
						ycenter = 0,
						pic = "res/ui/common/number/up_numb.png",
						text = "100",
						startChar = 48,
						width = 16,
						name = "actDragonRewardNum_" .. iter_1_2,
						x = 345 + var_1_9.offset1
					},
					{
						ycenter = 0,
						pic = "frame:up_numb_n.png",
						type = "pic",
						x = 390 + var_1_9.offset2
					},
					{
						height = 0,
						type = "label",
						ycenter = 0,
						width = 130,
						visible = false,
						name = "actNeed_" .. iter_1_2,
						text = language.get(131047),
						fontSize = 24 + var_1_9.entryLineFntSize,
						align = kCCTextAlignmentLeft,
						x = 477 + var_1_9.offset3
					}
				}
			})
		end
	elseif arg_1_1 == activityConstant.TYPES.ACTIVITY_DSTQ.tag then
		local var_1_11 = {}

		if conf.language == "vie" then
			var_1_11.remainLabelX = 22
			var_1_11.advX = 50
			var_1_11.advY = 15
			var_1_11.btnFntSize = -4
		else
			var_1_11.remainLabelX = 0
			var_1_11.advX = 0
			var_1_11.advY = 0
			var_1_11.btnFntSize = 0
		end

		var_1_0(arg_1_0.data.background.children, {
			x = 575,
			y = 500,
			pic = "frame:acti_tit_dstj.png",
			type = "pic"
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			name = "actLefttime",
			type = "label",
			y = 413,
			x = 294,
			text = language.get(131022),
			color = ccc3(255, 0, 0)
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			y = 413,
			type = "label",
			text = language.get(131048),
			x = 394 + var_1_11.remainLabelX
		})
		var_1_0(arg_1_0.data.background.children, {
			type = "pic",
			pic = "frame:icon_dstj_yell.png",
			x = 474 + var_1_11.advX,
			y = 413 + var_1_11.advY,
			children = {
				{
					fontSize = 22,
					name = "actDstqNum1",
					type = "label",
					ycenter = 0,
					left = 40,
					text = language.get(131049)
				}
			}
		})
		var_1_0(arg_1_0.data.background.children, {
			type = "pic",
			pic = "frame:icon_dstj_yell.png",
			x = (function()
				if conf.language == "vie" then
					return 474 + var_1_11.advX
				else
					return 704
				end
			end)(),
			y = (function()
				if conf.language == "vie" then
					return 413 + var_1_11.advY - 22
				else
					return 413
				end
			end)(),
			children = {
				{
					fontSize = 22,
					name = "actDstqNum2",
					type = "label",
					ycenter = 0,
					left = 40,
					text = language.get(131050)
				}
			}
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			name = "actDesc",
			type = "label",
			x = 474,
			width = 250,
			y = 343,
			text = language.get(131051),
			align = kCCTextAlignmentLeft
		})
		var_1_0(arg_1_0.data.background.children, {
			type = "button",
			buttons = {
				{
					pic2 = "frame:nationButtonGreen1.png",
					name = "actGoToInstance",
					pic1 = "frame:nationButtonGreen.png",
					y = 343,
					x = 729,
					children = {
						{
							height = 0,
							xcenter = 0,
							type = "label",
							ycenter = 0,
							width = 140,
							strokeSize = 2,
							text = language.get(131052),
							fontSize = 20 + var_1_11.btnFntSize,
							color = colorText[10004],
							strokeColor = colorText[10005]
						}
					}
				}
			}
		})

		local var_1_12 = var_1_0(arg_1_0.data.background.children, {
			y = 172,
			x = 607,
			type = "pic",
			pic = "res/ui/activity/acti_cjsjy_list_bg.jpg",
			children = {}
		})
		local var_1_13 = {}

		if conf.language == "kr" then
			var_1_13.fntSize = 0
			var_1_13.offset1 = 45
			var_1_13.offset2 = 245
			var_1_13.offset3 = -20
			var_1_13.offset4 = 0
			var_1_13.offset5 = 4
			var_1_13.offset6 = 40
		elseif conf.language == "vie" then
			var_1_13.fntSize = -4
			var_1_13.offset1 = -72
			var_1_13.offset2 = 0
			var_1_13.offset3 = 0
			var_1_13.offset4 = 42
			var_1_13.offset5 = 40
			var_1_13.offset6 = 0
		else
			var_1_13.fntSize = 0
			var_1_13.offset1 = 0
			var_1_13.offset2 = 0
			var_1_13.offset3 = 0
			var_1_13.offset4 = 0
			var_1_13.offset5 = 0
			var_1_13.offset6 = 0
		end

		for iter_1_3 = 1, 5 do
			local var_1_14 = var_1_0(var_1_12.children, {
				type = "pic",
				pic = "frame:acti_icon_fini.png",
				name = "actRewardStateIcon_" .. iter_1_3,
				x = 30 + var_1_13.offset3,
				y = 192 - (iter_1_3 - 1) * 41,
				children = {}
			})

			var_1_0(var_1_14.children, {
				type = "label",
				ycenter = 0,
				width = 150,
				left = 35,
				name = "actRewardDesc_" .. iter_1_3,
				text = language.get(131033),
				fontSize = 20 + var_1_13.fntSize,
				align = kCCTextAlignmentLeft
			})
			var_1_0(var_1_14.children, {
				type = "label",
				ycenter = 0,
				width = 150,
				text = language.get(131024),
				fontSize = 20 + var_1_13.fntSize,
				align = kCCTextAlignmentLeft,
				left = 145 + var_1_13.offset2
			})
			var_1_0(var_1_14.children, {
				pic = "res/ui/common/number/up_numb.png",
				height = 21,
				type = "atlas",
				ycenter = 0,
				text = "40",
				startChar = 48,
				width = 16,
				name = "actRewardDstq_" .. iter_1_3,
				left = 195 + var_1_13.offset4
			})
			var_1_0(var_1_14.children, {
				ycenter = 0,
				pic = "frame:up_numb_n.png",
				type = "pic",
				left = 230 + var_1_13.offset4
			})
			var_1_0(var_1_14.children, {
				type = "label",
				name = "actRewardDesc2_" .. iter_1_3,
				text = language.get(131018),
				fontSize = 20 + var_1_13.fntSize,
				left = 270 + var_1_13.offset5,
				ycenter = (function()
					if conf.language == "vie" then
						return 10
					else
						return 0
					end
				end)()
			})
			var_1_0(var_1_14.children, {
				type = "label",
				visible = false,
				name = "actNeed_" .. iter_1_3,
				text = language.get(131053),
				fontSize = 20 + var_1_13.fntSize,
				width = 180 + var_1_13.offset6,
				align = kCCTextAlignmentLeft,
				x = 502 + var_1_13.offset1,
				ycenter = (function()
					if conf.language == "vie" then
						return -10
					else
						return 0
					end
				end)()
			})
		end
	elseif arg_1_1 == activityConstant.TYPES.ACTIVITY_51.tag then
		arg_1_0.data.background.pic = "res/ui/activity/acti_jyjc_view_bg.jpg"

		var_1_0(arg_1_0.data.background.children, {
			x = 617,
			y = 480,
			pic = "frame:acti_tit_jyjc.png",
			type = "pic"
		})
		var_1_0(arg_1_0.data.background.children, {
			x = 617,
			name = "act51Pic",
			y = 237,
			type = "pic",
			pic = "frame:acti_jyjc_10.png"
		})
		var_1_0(arg_1_0.data.background.children, {
			type = "button",
			buttons = {
				{
					pic2 = "frame:nationButtonGreen1.png",
					name = "actDrawReward",
					pic1 = "frame:nationButtonGreen.png",
					y = 99,
					x = 617,
					children = {
						{
							xcenter = 0,
							fontSize = 20,
							type = "label",
							ycenter = 0,
							strokeSize = 2,
							text = language.get(131028),
							color = colorText[10004],
							strokeColor = colorText[10005]
						}
					}
				}
			}
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			name = "actDesc",
			type = "label",
			y = 49,
			x = 617,
			text = language.get(131054)
		})
	elseif arg_1_1 == activityConstant.TYPES.ACTIVITY_TICKET.tag then
		local var_1_15 = {}

		if conf.language == "kr" then
			var_1_15.titleNumX = 0
			var_1_15.offset1 = 0
			var_1_15.offset2 = 0
			var_1_15.offset3 = 20
			var_1_15.offset4 = 20
			var_1_15.offset5 = 20
			var_1_15.offset6 = 0
			var_1_15.offset7 = 0
			var_1_15.offset8 = 0
		elseif conf.language == "vie" then
			var_1_15.titleNumX = -15
			var_1_15.offset1 = 0
			var_1_15.offset2 = 0
			var_1_15.offset3 = 0
			var_1_15.offset4 = 80
			var_1_15.offset5 = 80
			var_1_15.offset6 = 0
			var_1_15.offset7 = 85
			var_1_15.offset8 = 65
		else
			var_1_15.titleNumX = 0
			var_1_15.offset1 = 0
			var_1_15.offset2 = 0
			var_1_15.offset3 = 0
			var_1_15.offset4 = 0
			var_1_15.offset5 = 0
			var_1_15.offset6 = 0
			var_1_15.offset7 = 0
			var_1_15.offset8 = 0
		end

		var_1_0(arg_1_0.data.background.children, {
			x = 575,
			y = 500,
			pic = "frame:acti_tit_czsdq.png",
			type = "pic"
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			name = "actLefttime",
			type = "label",
			y = 413,
			x = 444,
			text = language.get(131022),
			color = ccc3(255, 0, 0)
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			y = 413,
			type = "label",
			x = 510,
			text = language.get(131029)
		})
		var_1_0(arg_1_0.data.background.children, {
			x = 560,
			y = 413,
			pic = "frame:icon_dianq.png",
			type = "pic"
		})
		var_1_0(arg_1_0.data.background.children, {
			width = 16,
			height = 21,
			name = "actSurplus",
			type = "atlas",
			pic = "res/ui/common/number/up_numb.png",
			text = "180000",
			y = 413,
			startChar = 48,
			x = 630 + var_1_15.titleNumX
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			y = 413,
			type = "label",
			x = 720,
			text = language.get(131030)
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			name = "actTotalPay",
			type = "label",
			x = 535,
			width = 400,
			y = 344,
			text = language.get(131031),
			align = kCCTextAlignmentLeft
		})
		var_1_0(arg_1_0.data.background.children, {
			type = "button",
			buttons = {
				{
					pic2 = "frame:nationButtonGreen1.png",
					name = "actPay",
					pic1 = "frame:nationButtonGreen.png",
					y = 344,
					x = 785,
					children = {
						{
							xcenter = 0,
							fontSize = 20,
							type = "label",
							ycenter = 0,
							strokeSize = 2,
							text = language.get(131032),
							color = colorText[10004],
							strokeColor = colorText[10005]
						}
					}
				}
			}
		})

		local var_1_16 = var_1_0(arg_1_0.data.background.children, {
			y = 172,
			x = 607,
			type = "pic",
			pic = "res/ui/activity/acti_czsj_list_bg.jpg",
			children = {}
		})

		for iter_1_4 = 1, 7 do
			local var_1_17 = var_1_0(var_1_16.children, {
				type = "pic",
				pic = "frame:acti_icon_fini.png",
				name = "actRewardStateIcon_" .. iter_1_4,
				x = 60 + var_1_15.offset1,
				y = 274 - (iter_1_4 - 1) * 41,
				children = {}
			})

			var_1_0(var_1_17.children, {
				fontSize = 22,
				type = "label",
				ycenter = 0,
				width = 300,
				name = "actRewardDesc_" .. iter_1_4,
				text = language.get(131033),
				align = kCCTextAlignmentLeft,
				left = 50 + var_1_15.offset2
			})
			var_1_0(var_1_17.children, {
				fontSize = 22,
				type = "label",
				ycenter = 0,
				width = 300,
				text = language.get(131023),
				align = kCCTextAlignmentLeft,
				left = 200 + var_1_15.offset3
			})
			var_1_0(var_1_17.children, {
				visible = false,
				type = "pic",
				ycenter = 0,
				pic = "frame:icon_dianq.png",
				name = "icon_ticket_" .. iter_1_4,
				x = 267 + var_1_15.offset7
			})
			var_1_0(var_1_17.children, {
				visible = false,
				type = "pic",
				ycenter = 0,
				pic = "res/ui/activity/icon_czl.png",
				name = "icon_token_" .. iter_1_4,
				x = 267 + var_1_15.offset7
			})
			var_1_0(var_1_17.children, {
				type = "atlas",
				height = 21,
				anchorPointX = 0,
				ycenter = 0,
				pic = "res/ui/common/number/up_numb.png",
				text = "400",
				visible = false,
				startChar = 48,
				width = 16,
				name = "actRewardTicket_" .. iter_1_4,
				left = 280 + var_1_15.offset5
			})
			var_1_0(var_1_17.children, {
				type = "label",
				anchorPointX = 0,
				ycenter = 0,
				width = 180,
				height = 0,
				visible = false,
				name = "actRewardToken_" .. iter_1_4,
				text = language.get(131190),
				fontSize = (function()
					if conf.language == "vie" then
						return 16
					else
						return 22
					end
				end)(),
				x = 305 + var_1_15.offset8,
				color = colorQuality[4]
			})
			var_1_0(var_1_17.children, {
				fontSize = 20,
				width = 180,
				type = "label",
				ycenter = 0,
				visible = false,
				name = "actNeed_" .. iter_1_4,
				text = language.get(131034),
				align = kCCTextAlignmentLeft,
				x = 477 + var_1_15.offset6
			})
		end
	elseif arg_1_1 == activityConstant.TYPES.ACTIVITY_PAY.tag then
		local var_1_18 = {}

		if conf.language == "kr" then
			var_1_18.offset1 = 20
			var_1_18.offset2 = 20
			var_1_18.offset3 = 20
			var_1_18.offset4 = 20
		elseif conf.language == "vie" then
			var_1_18.offset1 = 0
			var_1_18.offset2 = 80
			var_1_18.offset3 = 80
			var_1_18.offset4 = 0
		else
			var_1_18.offset1 = 0
			var_1_18.offset2 = 0
			var_1_18.offset3 = 0
			var_1_18.offset4 = 0
		end

		var_1_0(arg_1_0.data.background.children, {
			x = 575,
			y = 500,
			type = "pic",
			pic = (function()
				if conf.language == "vie" then
					return "res/native/ui/activity/czsj/acti_tit_znq_czfl.png"
				else
					return "frame:acti_tit_czsj.png"
				end
			end)()
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			name = "actLefttime",
			type = "label",
			y = 413,
			x = 444,
			text = language.get(131022),
			color = ccc3(255, 0, 0)
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			y = 413,
			type = "label",
			x = 510,
			text = language.get(131029)
		})
		var_1_0(arg_1_0.data.background.children, {
			x = 560,
			y = 413,
			pic = "frame:res_icon_19_small.png",
			type = "pic"
		})
		var_1_0(arg_1_0.data.background.children, {
			width = 16,
			height = 21,
			name = "actSurplus",
			type = "atlas",
			pic = "res/ui/common/number/up_numb.png",
			text = "180000",
			y = 413,
			startChar = 48,
			x = 630
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			y = 413,
			type = "label",
			x = 720,
			text = language.get(131030)
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			name = "actTotalPay",
			type = "label",
			x = 535,
			width = 400,
			y = 344,
			text = language.get(131031),
			align = kCCTextAlignmentLeft
		})
		var_1_0(arg_1_0.data.background.children, {
			type = "button",
			buttons = {
				{
					pic2 = "frame:nationButtonGreen1.png",
					name = "actPay",
					pic1 = "frame:nationButtonGreen.png",
					y = 344,
					x = 785,
					children = {
						{
							xcenter = 0,
							fontSize = 22,
							type = "label",
							ycenter = 0,
							strokeSize = 2,
							text = language.get(131032),
							color = colorText[10004],
							strokeColor = colorText[10005]
						}
					}
				}
			}
		})

		local var_1_19 = var_1_0(arg_1_0.data.background.children, {
			y = 172,
			x = 607,
			type = "pic",
			pic = "res/ui/activity/acti_czsj_list_bg.jpg",
			children = {}
		})

		for iter_1_5 = 1, 7 do
			local var_1_20 = var_1_0(var_1_19.children, {
				x = 60,
				type = "pic",
				pic = "frame:acti_icon_fini.png",
				name = "actRewardStateIcon_" .. iter_1_5,
				y = 274 - (iter_1_5 - 1) * 41,
				children = {}
			})

			var_1_0(var_1_20.children, {
				fontSize = 22,
				type = "label",
				ycenter = 0,
				width = 300,
				left = 50,
				name = "actRewardDesc_" .. iter_1_5,
				text = language.get(131033),
				align = kCCTextAlignmentLeft
			})
			var_1_0(var_1_20.children, {
				fontSize = 22,
				type = "label",
				ycenter = 0,
				width = 300,
				text = language.get(131023),
				align = kCCTextAlignmentLeft,
				left = 200 + var_1_18.offset1
			})
			var_1_0(var_1_20.children, {
				ycenter = 0,
				pic = "frame:res_icon_19_small.png",
				type = "pic",
				left = 250 + var_1_18.offset2
			})
			var_1_0(var_1_20.children, {
				type = "atlas",
				height = 21,
				anchorPointX = 0,
				ycenter = 0,
				pic = "res/ui/common/number/up_numb.png",
				text = "400",
				startChar = 48,
				width = 16,
				name = "actRewardGold_" .. iter_1_5,
				left = 280 + var_1_18.offset3
			})
			var_1_0(var_1_20.children, {
				fontSize = 20,
				width = 180,
				type = "label",
				ycenter = 0,
				visible = false,
				name = "actNeed_" .. iter_1_5,
				text = language.get(131034),
				align = kCCTextAlignmentLeft,
				x = 477 + var_1_18.offset4
			})
		end
	elseif arg_1_1 == activityConstant.TYPES.ACTIVITY_7DAY_LOGIN.tag then
		arg_1_0.data.background.pic = "res/ui/comment/bg1.jpg"

		var_1_0(arg_1_0.data.background.children, {
			left = 0,
			down = -10,
			scale = 0.95,
			type = "pic",
			pic = "res/ui/comment/xiaoqian.png"
		})
		var_1_0(arg_1_0.data.background.children, {
			y = 460,
			pic = "res/ui/activity/weekActivity/acti_tit_lxdl.png",
			x = 560,
			type = "pic"
		})
		var_1_0(arg_1_0.data.background.children, {
			y = 450,
			pic = "res/ui/activity/weekActivity/acti_icon_gold_3.png",
			x = 790,
			type = "pic"
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 26,
			name = "title",
			x = 610,
			type = "label",
			width = 400,
			height = 0,
			y = 405,
			strokeSize = 2,
			text = language.get(360001),
			color = ccc3(20, 230, 40),
			strokeColor = colorText[10005]
		})
		var_1_0(arg_1_0.data.background.children, {
			y = 210,
			name = "awardsBg",
			type = "pic_9",
			pic = "res/ui/activity/weekActivity/acti_lxdl_awards_bg.png",
			x = 605,
			middleRect = CCRectMake(10, 10, 10, 10),
			preferedSize = CCSizeMake(550, 310)
		})
	elseif arg_1_1 == activityConstant.TYPES.ACTIVITY_NOVICEWANTED.tag then
		var_1_0(arg_1_0.data.background.children, {
			xcenter = 0,
			name = "bg2",
			type = "pic_9",
			ycenter = 0,
			pic = "res/ui/noviceWanted/xs_view_1.png",
			middleRect = CCRectMake(30, 30, 45, 45),
			preferedSize = CCSizeMake(930, 550),
			children = {
				{
					x = 480,
					name = "title",
					y = 500,
					type = "pic",
					pic = "res/ui/noviceWanted/xs_xssj.png"
				},
				{
					xcenter = 0,
					name = "scroll_bg",
					type = "pic_9",
					ycenter = -100,
					pic = "res/ui/noviceWanted/xs_view_2.png",
					middleRect = CCRectMake(30, 30, 45, 45),
					preferedSize = CCSizeMake(875, 310)
				},
				{
					fontSize = 22,
					name = "title_timedown",
					x = 100,
					type = "label",
					y = 450,
					strokeSize = 2,
					text = language.get(131057),
					color = ccc3(166, 146, 101),
					strokeColor = ccc3(22, 18, 13)
				},
				{
					x = 850,
					name = "xiangzi",
					y = 450,
					type = "pic",
					pic = "res/ui/noviceWanted/xs_loading_bx.png"
				},
				{
					xcenter = 0,
					name = "bar_bg",
					type = "pic_9",
					ycenter = 130,
					pic = "res/ui/noviceWanted/xs_loading_di.png",
					middleRect = CCRectMake(25, 16, 6, 1),
					preferedSize = CCSizeMake(860, 33)
				}
			}
		})
	elseif arg_1_1 == activityConstant.TYPES.ACTIVITY_ZIYUAN.tag then
		var_1_0(arg_1_0.data.background.children, {
			x = 480,
			name = "title",
			y = 490,
			type = "pic",
			pic = "res/ui/activity/ziyuan/txt_zyfb_tit.png"
		})
		var_1_0(arg_1_0.data.background.children, {
			xcenter = 0,
			name = "remainDay",
			type = "label",
			fontSize = 30,
			text = "0",
			y = 426,
			strokeSize = 2,
			color = ccc3(235, 46, 11),
			strokeColor = ccc3(22, 18, 13)
		})
		var_1_0(arg_1_0.data.background.children, {
			y = 490,
			x = 850,
			type = "button",
			buttons = {
				{
					pic2 = "frame:btnTip_a.png",
					name = "title",
					pic1 = "frame:btnTip_c.png"
				}
			}
		})
	elseif arg_1_1 == activityConstant.TYPES.ACTIVITY_REDBOMB.tag then
		var_1_0(arg_1_0.data.background.children, {
			x = 457,
			name = "title",
			y = 490,
			type = "pic",
			pic = (function()
				return "res/ui/activity/redBomb/acti_tit_czshb.png"
			end)(),
			scale = (function()
				if conf.language == "vie" then
					return 0.75
				else
					return 1
				end
			end)()
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 20,
			y = 475,
			type = "label",
			x = 75,
			text = language.get(131101),
			color = ccc3(240, 205, 158)
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 20,
			name = "currentGold",
			type = "label",
			y = 473,
			x = 183,
			text = language.get(131102, 0),
			color = ccc3(240, 205, 158)
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 20,
			y = 100,
			type = "label",
			x = 440,
			text = language.get(131104),
			color = ccc3(168, 145, 101)
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 20,
			name = "openCount",
			text = "0",
			type = "label",
			y = 98,
			x = 560,
			color = ccc3(168, 145, 101)
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 26,
			name = "remainTime",
			type = "label",
			y = 490,
			right = 100,
			text = language.get(131103, 1),
			color = ccc3(208, 49, 45)
		})
		var_1_0(arg_1_0.data.background.children, {
			top = 40,
			right = 50,
			type = "button",
			buttons = {
				{
					pic2 = "frame:btnTip_c.png",
					name = "wenhao",
					pic1 = "frame:btnTip_a.png"
				}
			}
		})
		var_1_0(arg_1_0.data.background.children, {
			y = 50,
			x = 457,
			type = "button",
			buttons = {
				{
					pic2 = "frame:btn2_gre_g.png",
					name = "open",
					pic1 = "frame:btn2_gre_a.png"
				}
			}
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 20,
			name = "openBomb",
			x = 457,
			type = "label",
			y = 50,
			strokeSize = 2,
			text = language.get(131106),
			color = colorText[10004],
			strokeColor = colorText[10005]
		})
		var_1_0(arg_1_0.data.background.children, {
			xcenter = 0,
			name = "bar_bg",
			type = "pic_9",
			y = 342,
			pic = "res/ui/noviceWanted/xs_loading_di.png",
			z = 5,
			middleRect = CCRectMake(25, 16, 6, 1),
			preferedSize = CCSizeMake(862, 33)
		})
		var_1_0(arg_1_0.data.background.children, {
			x = 457,
			name = "sanbao",
			y = 200,
			type = "pic",
			pic = "res/ui/activity/redBomb/sanbao.png"
		})
		var_1_0(arg_1_0.data.background.children, {
			x = 457,
			name = "shibao",
			y = 165,
			type = "pic",
			pic = "res/ui/activity/redBomb/shibao.png"
		})

		for iter_1_6 = 1, 7 do
			local var_1_21 = 52 + 116 * iter_1_6
			local var_1_22 = 342

			var_1_0(arg_1_0.data.background.children, {
				fontSize = 20,
				text = "X",
				type = "label",
				name = "index_" .. iter_1_6,
				color = ccc3(120, 106, 78),
				x = var_1_21,
				y = var_1_22 + 32
			})
			var_1_0(arg_1_0.data.background.children, {
				fontSize = 20,
				text = "Y",
				type = "label",
				name = "goldIndex_" .. iter_1_6,
				color = ccc3(120, 106, 78),
				x = var_1_21,
				y = var_1_22 - 30
			})
			var_1_0(arg_1_0.data.background.children, {
				pic = "res/ui/activity/redBomb/czshb_deg_icon.png",
				type = "pic",
				x = var_1_21,
				y = var_1_22 + 70
			})
			var_1_0(arg_1_0.data.background.children, {
				type = "pic",
				pic = "res/ui/noviceWanted/nation_task_draw.png",
				name = "lingqu_" .. iter_1_6,
				x = var_1_21,
				y = var_1_22 + 70
			})

			if iter_1_6 < 7 then
				var_1_0(arg_1_0.data.background.children, {
					z = 9,
					type = "pic",
					pic = "res/ui/noviceWanted/xs_loading_strip.jpg",
					x = var_1_21,
					y = var_1_22
				})
			end
		end

		var_1_0(arg_1_0.data.background.children, {
			x = 0,
			name = "bar",
			y = 342,
			type = "pic",
			z = 7,
			pic = "res/ui/noviceWanted/xs_loading_con.jpg"
		})
	elseif arg_1_1 == activityConstant.TYPES.ACTIVITY_XILIAN.tag then
		arg_1_0.data.background = {
			xcenter = 0,
			type = "pic_9",
			ycenter = -30,
			pic = "res/ui/activity/xilian/xs_view_1.png",
			middleRect = CCRectMake(10, 10, 60, 60),
			preferedSize = CCSizeMake(927, 544),
			children = {}
		}

		var_1_0(arg_1_0.data.background.children, {
			top = 60,
			left = 60,
			type = "button",
			buttons = {
				{
					pic2 = "frame:btnTip_c.png",
					name = "wenhao",
					pic1 = "frame:btnTip_a.png"
				}
			}
		})
		var_1_0(arg_1_0.data.background.children, {
			xcenter = 0,
			top = 25,
			pic = "res/ui/activity/xilian/acti_tit_xldfs.png",
			type = "pic"
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			name = "actLefttime",
			type = "label",
			top = 50,
			right = 185,
			text = language.get(131022),
			color = ccc3(255, 0, 0)
		})
		var_1_0(arg_1_0.data.background.children, {
			left = 15,
			type = "pic",
			top = 122,
			pic = "res/ui/activity/xilian/progress_bg.png",
			children = {
				{
					xcenter = -225,
					name = "progress_1",
					percentage = 100,
					type = "process",
					ycenter = 1,
					pic = "res/ui/activity/xilian/progress_bar.jpg"
				},
				{
					xcenter = -1,
					name = "progress_2",
					percentage = 100,
					type = "process",
					ycenter = 1,
					pic = "res/ui/activity/xilian/progress_bar.jpg"
				},
				{
					xcenter = 224,
					name = "progress_3",
					percentage = 100,
					type = "process",
					ycenter = 1,
					pic = "res/ui/activity/xilian/progress_bar.jpg"
				},
				{
					fontSize = 20,
					type = "label",
					x = 248,
					strokeSize = 2,
					y = -20,
					color = ccc3(235, 209, 167),
					strokeColor = ccc3(22, 18, 13),
					text = language.get(131166)
				},
				{
					fontSize = 20,
					type = "label",
					x = 472,
					strokeSize = 2,
					y = -20,
					color = ccc3(235, 209, 167),
					strokeColor = ccc3(22, 18, 13),
					text = language.get(131167)
				},
				{
					fontSize = 20,
					type = "label",
					x = 696,
					strokeSize = 2,
					y = -20,
					color = ccc3(235, 209, 167),
					strokeColor = ccc3(22, 18, 13),
					text = language.get(131168)
				}
			}
		})
		var_1_0(arg_1_0.data.background.children, {
			type = "button",
			buttons = {
				{
					pic2 = "frame:btn3_gre_c.png",
					name = "actGoToQuenching",
					pic1 = "frame:btn3_gre_a.png",
					y = 406,
					x = 837,
					children = {
						{
							fontSize = 20,
							type = "label",
							xcenter = 0,
							strokeSize = 2,
							ycenter = 0,
							color = ccc3(188, 183, 183),
							text = language.get(131169),
							strokeColor = ccc3(22, 18, 13)
						}
					}
				}
			}
		})

		local var_1_23 = var_1_0(arg_1_0.data.background.children, {
			xcenter = 0,
			down = 15,
			type = "pic_9",
			pic = "res/ui/activity/xilian/xs_view_2.png",
			middleRect = CCRectMake(10, 10, 60, 60),
			preferedSize = CCSizeMake(880, 313),
			children = {}
		})

		local function var_1_24(arg_11_0)
			if arg_11_0 == 1 then
				return language.get(131166)
			elseif arg_11_0 == 2 then
				return language.get(131167)
			else
				return language.get(131168)
			end
		end

		for iter_1_7 = 1, 3 do
			var_1_0(var_1_23.children, {
				type = "pic",
				ycenter = 0,
				pic = "res/ui/activity/xilian/acti_xldfs_view.jpg",
				name = "blockbg_" .. iter_1_7,
				xcenter = -538 + iter_1_7 * 269,
				children = {
					{
						xcenter = 0,
						type = "pic",
						ycenter = 25,
						pic = "frame:general_treasureBackground.png",
						name = "clickToChoose_" .. iter_1_7,
						children = {
							{
								xcenter = 0,
								fontSize = 28,
								type = "label",
								ycenter = 0,
								text = language.get(400038),
								color = colorText[10003]
							}
						}
					},
					{
						xcenter = 0,
						type = "label",
						fontSize = 20,
						y = 78,
						strokeSize = 2,
						text = language.get(400039),
						name = "nextLabel_" .. iter_1_7,
						color = ccc3(188, 183, 183),
						strokeColor = ccc3(22, 18, 13)
					},
					{
						xcenter = 0,
						y = 25,
						type = "button",
						buttons = {
							{
								pic2 = "frame:btn5_gre_c.png",
								pic1 = "frame:btn5_gre_a.png",
								enable = false,
								name = "xilian_" .. iter_1_7,
								children = {
									{
										xcenter = 0,
										fontSize = 20,
										type = "label",
										ycenter = 0,
										strokeSize = 2,
										text = var_1_24(iter_1_7),
										color = ccc3(188, 183, 183),
										strokeColor = ccc3(22, 18, 13)
									}
								}
							}
						}
					},
					{
						top = 5,
						right = 5,
						type = "button",
						buttons = {
							{
								pic2 = "frame:btnTip_c.png",
								pic1 = "frame:btnTip_a.png",
								name = "blockWenhao_" .. iter_1_7
							}
						}
					}
				}
			})
		end
	elseif arg_1_1 == activityConstant.TYPES.ACTIVITY_FAMOUS.tag then
		local var_1_25 = {}

		if conf.language == "tha" then
			var_1_25.leftTimeXCenter = 0
			var_1_25.leftTimeYTop = 0
			var_1_25.tongYongScale = 0.75
			var_1_25.tongYongDigitY = -5
			var_1_25.tongYongTextY = 5
			var_1_25.equipNameFntSize = 0
			var_1_25.pickFntSize = 0
		elseif conf.language == "vie" then
			var_1_25.leftTimeXCenter = 60
			var_1_25.leftTimeYTop = 14
			var_1_25.tongYongScale = 0.75
			var_1_25.tongYongDigitY = 0
			var_1_25.tongYongTextY = 0
			var_1_25.equipNameFntSize = -4
			var_1_25.pickFntSize = -6
		else
			var_1_25.leftTimeXCenter = 0
			var_1_25.leftTimeYTop = 0
			var_1_25.tongYongScale = 1
			var_1_25.tongYongDigitY = 0
			var_1_25.tongYongTextY = 0
			var_1_25.equipNameFntSize = 0
			var_1_25.pickFntSize = 0
		end

		arg_1_0.data.background = {
			xcenter = 0,
			type = "pic",
			ycenter = -30,
			pic = "res/ui/activity/famous/gjms_view.jpg",
			children = {
				{
					xcenter = 0,
					z = 200,
					name = "giftPanel",
					type = "pic_9",
					pic = "res/ui/general/jailView/comm_tanchu_view_laofang_1.png",
					visible = false,
					top = 0,
					middleRect = CCRectMake(100, 92, 1, 1),
					preferedSize = CCSizeMake(298, 496),
					children = {
						{
							xcenter = 0,
							z = 0,
							type = "pic_9",
							top = 4,
							pic = "res/ui/general/jailView/comm_tanchu_view_laofang_2.png",
							middleRect = CCRectMake(15, 15, 72, 72),
							preferedSize = CCSizeMake(286, 67)
						},
						{
							type = "button",
							buttons = {
								{
									pic2 = "frame:btn_close_c.png",
									name = "btn_close",
									pic1 = "frame:btn_close_a.png",
									y = 455,
									x = 260
								},
								{
									pic2 = "frame:btn3_gre_c.png",
									name = "btn_getGift",
									pic1 = "frame:btn3_gre_a.png",
									y = 75,
									x = 150,
									enable = false,
									children = {
										{
											font = "Thonburi-Bold",
											fontSize = 26,
											type = "label",
											ycenter = 0,
											xcenter = 0,
											text = language.get(132003),
											color = tool.hexToRgb("#D9EDC5")
										}
									}
								}
							}
						},
						{
							xcenter = 0,
							down = 8,
							z = 0,
							type = "pic",
							pic = "res/ui/activity/famous/gjms_small_view.png"
						},
						{
							x = 148,
							name = "itemPic",
							y = 316,
							type = "pic",
							pic = "frame:byzg.jpg"
						},
						{
							fontSize = 22,
							font = "Thonburi-Bold",
							name = "itemName",
							type = "label",
							xcenter = 0,
							y = 255,
							text = language.get(132005),
							color = tool.hexToRgb("#D9EDC5")
						},
						{
							left = 97,
							name = "tongNum",
							visible = false,
							type = "atlas",
							height = 27,
							pic = "res/ui/common/number/gjms_tit_tong_digit.png",
							text = "00",
							startChar = 48,
							width = 22,
							y = 180 + var_1_25.tongYongDigitY,
							align = kCCTextAlignmentLeft,
							children = {
								{
									x = 0,
									anchorPointX = 1,
									type = "pic",
									pic = "res/ui/activity/famous/gjms_tit_tong.png",
									y = 13.5 + var_1_25.tongYongTextY,
									scale = var_1_25.tongYongScale
								}
							}
						},
						{
							left = 227,
							name = "yongNum",
							visible = false,
							type = "atlas",
							height = 27,
							pic = "res/ui/common/number/gjms_tit_yong_digit.png",
							text = "00",
							startChar = 48,
							width = 22,
							y = 180 + var_1_25.tongYongDigitY,
							align = kCCTextAlignmentLeft,
							children = {
								{
									x = 0,
									anchorPointX = 1,
									type = "pic",
									pic = "res/ui/activity/famous/gjms_tit_yong.png",
									y = 13.5 + var_1_25.tongYongTextY,
									scale = var_1_25.tongYongScale
								}
							}
						},
						{
							xcenter = 0,
							name = "tipsRange",
							y = 180,
							type = "pic",
							visible = false,
							pic = "res/ui/activity/famous/gjms_xyjn.png",
							children = {
								{
									type = "atlas",
									height = 27,
									x = 0,
									anchorPointX = 1,
									pic = "res/ui/common/number/gjms_tit_tong_digit.png",
									text = "1",
									y = 13.5,
									startChar = 48,
									width = 22,
									align = kCCTextAlignmentLeft
								},
								{
									type = "atlas",
									height = 27,
									x = 27,
									anchorPointX = 0,
									pic = "res/ui/common/number/gjms_tit_tong_digit.png",
									text = "50",
									y = 13.5,
									startChar = 48,
									width = 22,
									align = kCCTextAlignmentLeft
								}
							}
						},
						{
							xcenter = 0,
							name = "tipsNum",
							visible = false,
							type = "atlas",
							height = 27,
							pic = "res/ui/common/number/gjms_tit_tong_digit.png",
							text = "00",
							y = 180,
							startChar = 48,
							width = 22,
							align = kCCTextAlignmentLeft
						},
						{
							xcenter = 0,
							name = "msProcessBg",
							type = "pic_9",
							y = 140,
							pic = "res/ui/rankInfo/twoRankInfo/rank_progress_bar_bg.jpg",
							middleRect = CCRectMake(10, 0, 663, 24),
							preferedSize = CCSizeMake(258, 24),
							children = {
								{
									xcenter = 0,
									name = "msProcess",
									type = "process",
									ycenter = 0,
									pic = "res/ui/general/jailView/laofang_load_con.png"
								}
							}
						},
						{
							fontSize = 22,
							font = "Thonburi-Bold",
							name = "itemInfo",
							type = "label",
							xcenter = 0,
							y = 30,
							text = language.get(132004),
							color = tool.hexToRgb("#D9EDC5")
						}
					}
				}
			}
		}

		var_1_0(arg_1_0.data.background.children, {
			xcenter = 0,
			top = 25,
			pic = "res/ui/activity/famous/gjms_tit.png",
			type = "pic"
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			name = "actLefttime",
			type = "label",
			text = language.get(131022),
			color = ccc3(255, 0, 0),
			xcenter = 175 + var_1_25.leftTimeXCenter,
			top = 25 + var_1_25.leftTimeYTop
		})
		var_1_0(arg_1_0.data.background.children, {
			top = 30,
			right = 30,
			type = "button",
			buttons = {
				{
					pic2 = "frame:btnTip_c.png",
					name = "wenhao",
					pic1 = "frame:btnTip_a.png"
				}
			}
		})
		var_1_0(arg_1_0.data.background.children, {
			left = 48,
			type = "pic",
			top = 136,
			pic = "res/ui/activity/famous/gjms_deg_view.png",
			children = {
				{
					xcenter = 0,
					name = "actFamousBar",
					percentage = 20,
					type = "process",
					ycenter = 0,
					pic = "res/ui/activity/famous/gjms_deg_con.png"
				},
				{
					xcenter = -153,
					ycenter = 0,
					pic = "res/ui/activity/famous/gjms_deg_div.png",
					type = "pic"
				},
				{
					xcenter = 0,
					ycenter = 0,
					pic = "res/ui/activity/famous/gjms_deg_div.png",
					type = "pic"
				},
				{
					xcenter = 153,
					ycenter = 0,
					pic = "res/ui/activity/famous/gjms_deg_div.png",
					type = "pic"
				},
				{
					xcenter = -153,
					name = "giftLabel1",
					type = "label",
					ycenter = 40,
					fontSize = 24,
					text = "165",
					strokeSize = 2,
					color = ccc3(235, 209, 167),
					strokeColor = ccc3(22, 18, 13)
				},
				{
					xcenter = 0,
					name = "giftLabel2",
					type = "label",
					ycenter = 40,
					fontSize = 24,
					text = "375",
					strokeSize = 2,
					color = ccc3(235, 209, 167),
					strokeColor = ccc3(22, 18, 13)
				},
				{
					xcenter = 153,
					name = "giftLabel3",
					type = "label",
					ycenter = 40,
					fontSize = 24,
					text = "630",
					strokeSize = 2,
					color = ccc3(235, 209, 167),
					strokeColor = ccc3(22, 18, 13)
				},
				{
					xcenter = 306,
					name = "giftLabel4",
					type = "label",
					ycenter = 40,
					fontSize = 24,
					text = "1000",
					strokeSize = 2,
					color = ccc3(235, 209, 167),
					strokeColor = ccc3(22, 18, 13)
				},
				{
					y = 20,
					name = "light_tips1",
					pic = "res/ui/resource/silkroad/sczldj_pbjn_h.png",
					type = "pic",
					visible = false,
					x = 176
				},
				{
					y = 20,
					name = "light_tips2",
					pic = "res/ui/resource/silkroad/sczldj_pbjn_h.png",
					type = "pic",
					visible = false,
					x = 329
				},
				{
					y = 20,
					name = "light_tips3",
					pic = "res/ui/resource/silkroad/sczldj_pbjn_h.png",
					type = "pic",
					visible = false,
					x = 482
				},
				{
					y = 20,
					name = "light_tips4",
					pic = "res/ui/resource/silkroad/sczldj_pbjn_h.png",
					type = "pic",
					visible = false,
					x = 635
				},
				{
					y = 0,
					x = 0,
					type = "button",
					buttons = {
						{
							pic2 = "res/ui/resource/silkroad/sczldj_pbjn_h.png",
							name = "btn_tips1",
							pic1 = "res/ui/resource/silkroad/sczldj_pbjn.png",
							y = 20,
							pic3 = "res/ui/resource/silkroad/sczldj_pbjn_g.png",
							x = 176
						},
						{
							pic2 = "res/ui/resource/silkroad/sczldj_pbjn_h.png",
							name = "btn_tips2",
							pic1 = "res/ui/resource/silkroad/sczldj_pbjn.png",
							y = 20,
							pic3 = "res/ui/resource/silkroad/sczldj_pbjn_g.png",
							x = 329
						},
						{
							pic2 = "res/ui/resource/silkroad/sczldj_pbjn_h.png",
							name = "btn_tips3",
							pic1 = "res/ui/resource/silkroad/sczldj_pbjn.png",
							y = 20,
							pic3 = "res/ui/resource/silkroad/sczldj_pbjn_g.png",
							x = 482
						},
						{
							pic2 = "res/ui/resource/silkroad/sczldj_pbjn_h.png",
							name = "btn_tips4",
							pic1 = "res/ui/resource/silkroad/sczldj_pbjn.png",
							y = 20,
							pic3 = "res/ui/resource/silkroad/sczldj_pbjn_g.png",
							x = 635
						}
					}
				},
				{
					fontSize = 22,
					name = "num_tips1",
					y = 10,
					type = "label",
					x = 176
				},
				{
					fontSize = 22,
					name = "num_tips2",
					y = 10,
					type = "label",
					x = 329
				},
				{
					fontSize = 22,
					name = "num_tips3",
					y = 10,
					type = "label",
					x = 482
				},
				{
					fontSize = 22,
					name = "num_tips4",
					y = 10,
					type = "label",
					x = 635
				},
				{
					y = 0,
					x = 0,
					type = "button",
					buttons = {
						{
							pic2 = "res/ui/activity/famous/gjms_deg_icon.png",
							name = "lantern1",
							pic1 = "res/ui/activity/famous/gjms_deg_icon.png",
							y = -20,
							pic3 = "res/ui/activity/famous/gjms_deg_icon_gray.png",
							x = 176
						},
						{
							pic2 = "res/ui/activity/famous/gjms_deg_icon.png",
							name = "lantern2",
							pic1 = "res/ui/activity/famous/gjms_deg_icon.png",
							y = -20,
							pic3 = "res/ui/activity/famous/gjms_deg_icon_gray.png",
							x = 329
						},
						{
							pic2 = "res/ui/activity/famous/gjms_deg_icon.png",
							name = "lantern3",
							pic1 = "res/ui/activity/famous/gjms_deg_icon.png",
							y = -20,
							pic3 = "res/ui/activity/famous/gjms_deg_icon_gray.png",
							x = 482
						},
						{
							pic2 = "res/ui/activity/famous/gjms_deg_icon.png",
							name = "lantern4",
							pic1 = "res/ui/activity/famous/gjms_deg_icon.png",
							y = -20,
							pic3 = "res/ui/activity/famous/gjms_deg_icon_gray.png",
							x = 635
						}
					}
				}
			}
		})
		var_1_0(arg_1_0.data.background.children, {
			type = "pic",
			top = 108,
			pic = "res/ui/activity/famous/gjms_hsb_view.png",
			right = 53,
			children = {
				{
					xcenter = 0,
					name = "hsbPic",
					type = "pic",
					ycenter = 0,
					pic = "frame:heshibi.jpg"
				},
				{
					xcenter = 0,
					name = "hsbBg",
					z = -1,
					type = "pic",
					ycenter = 0,
					visible = false,
					pic = "res/ui/activity/famous/gjms_hsb_view_lig.png"
				},
				{
					xcenter = -20,
					name = "goldLabel",
					visible = false,
					type = "pic",
					top = -40,
					pic = "frame:res_icon_19.png",
					children = {
						{
							fontSize = 24,
							name = "goldNum",
							type = "label",
							x = 80,
							strokeSize = 2,
							ycenter = 0,
							color = ccc3(235, 209, 167),
							strokeColor = ccc3(22, 18, 13)
						}
					}
				},
				{
					name = "canReceived",
					fontSize = 20,
					type = "label",
					xcenter = 0,
					top = -3,
					visible = false,
					anchorPointY = 0,
					strokeSize = 2,
					color = colorQuality[4],
					strokeColor = ccc3(22, 18, 13)
				}
			}
		})
		var_1_0(arg_1_0.data.background.children, {
			name = "finalRecvBg",
			type = "pic",
			top = 215,
			pic = "res/ui/activity/famous/gjms_xyjn_word_di.png",
			right = 3
		})
		var_1_0(arg_1_0.data.background.children, {
			visible = false,
			name = "famousFinish",
			x = 182,
			type = "pic",
			y = 169,
			pic = "res/ui/activity/famous/gjms_qbjs.png"
		})
		var_1_0(arg_1_0.data.background.children, {
			left = 68,
			name = "famousHead",
			down = 29,
			type = "pic",
			pic = "res/ui/common/halfPic/halfPic_huangzhong.png",
			children = {
				{
					xcenter = -100,
					name = "guoshi",
					z = -1,
					type = "pic",
					ycenter = 80,
					pic = "res/ui/activity/famous/gjmsyh_word_gs.png"
				},
				{
					xcenter = 0,
					z = -1,
					name = "famousLight",
					type = "pic",
					ycenter = 0,
					pic = "res/ui/activity/famous/gjms_ms_lig_bg.png"
				},
				{
					xcenter = 0,
					name = "famousBg",
					y = 44,
					type = "pic",
					pic = "res/ui/activity/famous/gjms_ms_tit_view.png",
					children = {
						{
							left = 38,
							down = 11,
							type = "pic",
							pic = "res/ui/activity/famous/gjms_icon_view.jpg",
							children = {
								{
									xcenter = 0,
									name = "dropItemIcon",
									scale = 0.6944444444444444,
									type = "pic",
									ycenter = 0,
									pic = "res/ui/activity/famous/gjms_icon_bm.jpg"
								}
							}
						},
						{
							name = "npcName",
							strokeSize = 2,
							type = "label",
							fontSize = 24,
							left = 112,
							top = 15,
							text = "黄忠",
							width = 140,
							color = ccc3(235, 209, 167),
							strokeColor = ccc3(22, 18, 13),
							align = kCCTextAlignmentLeft
						},
						{
							name = "npcFavor",
							strokeSize = 2,
							type = "label",
							fontSize = 24,
							left = 112,
							top = 45,
							text = "爱好:宝马",
							width = 140,
							color = ccc3(235, 209, 167),
							strokeColor = ccc3(22, 18, 13),
							align = kCCTextAlignmentLeft
						}
					}
				}
			}
		})

		local var_1_26 = {
			"res/ui/activity/famous/gjms_b_bm.png",
			"res/ui/activity/famous/gjms_b_mj.png",
			"res/ui/activity/famous/gjms_b_sh.png"
		}

		for iter_1_8 = 1, 3 do
			var_1_0(arg_1_0.data.background.children, {
				x = 469,
				type = "pic",
				pic = var_1_26[iter_1_8],
				name = "famousItem" .. iter_1_8,
				y = 238 - (iter_1_8 - 1) * 82
			})
			var_1_0(arg_1_0.data.background.children, {
				strokeSize = 2,
				type = "label",
				fontSize = 24,
				text = "×20",
				x = 536,
				name = "famousItemNum" .. iter_1_8,
				color = ccc3(235, 209, 167),
				strokeColor = ccc3(22, 18, 13),
				y = 238 - (iter_1_8 - 1) * 82
			})
			var_1_0(arg_1_0.data.background.children, {
				strokeSize = 2,
				type = "label",
				fontSize = 24,
				width = 200,
				height = 0,
				x = 676,
				text = language.get(131085, "襄阳"),
				name = "teamCityName" .. iter_1_8,
				color = ccc3(235, 209, 167),
				strokeColor = ccc3(22, 18, 13),
				y = 238 - (iter_1_8 - 1) * 82
			})
			var_1_0(arg_1_0.data.background.children, {
				x = 836,
				type = "button",
				y = 238 - (iter_1_8 - 1) * 82,
				buttons = {
					{
						pic2 = "res/ui/activity/famous/gjms_fig_icon_lig.png",
						pic1 = "res/ui/activity/famous/gjms_fig_icon.png",
						name = "teamAttackBtn" .. iter_1_8
					}
				}
			})
		end
	elseif arg_1_1 == activityConstant.TYPES.ACTIVITY_WUSEGEM.tag then
		local var_1_27 = {}

		if conf.language == "vie" then
			var_1_27.leftTime = -110
			var_1_27.hamerGemLeft = 42
			var_1_27.numTitX = 106
			var_1_27.numTitY = 0
			var_1_27.numLeftX = 140
		elseif conf.language == "tha" then
			var_1_27.leftTime = 0
			var_1_27.hamerGemLeft = 10
			var_1_27.numTitX = 40
			var_1_27.numTitY = -5
			var_1_27.numLeftX = 65
		else
			var_1_27.leftTime = 0
			var_1_27.hamerGemLeft = 0
			var_1_27.numTitX = 0
			var_1_27.numTitY = 0
			var_1_27.numLeftX = 0
		end

		arg_1_0.data.background = {
			xcenter = 0,
			type = "pic_9",
			ycenter = -30,
			pic = "res/ui/activity/xilian/xs_view_1.png",
			middleRect = CCRectMake(10, 10, 60, 60),
			preferedSize = CCSizeMake(927, 544),
			children = {}
		}

		var_1_0(arg_1_0.data.background.children, {
			xcenter = 0,
			top = 25,
			pic = "res/ui/activity/gemsActivity/acti_tit_wsgem.png",
			type = "pic"
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			xcenter = 0,
			type = "label",
			top = 90,
			color = ccc3(255, 0, 0),
			text = language.get(135005)
		})
		var_1_0(arg_1_0.data.background.children, {
			xcenter = 0,
			z = 200,
			type = "pic",
			top = 275,
			pic = "res/ui/activity/gemsActivity/acti_baoshi_di.png"
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			name = "actLefttime",
			type = "label",
			top = 50,
			text = language.get(131022),
			color = ccc3(255, 0, 0),
			right = 185 + var_1_27.leftTime
		})
		var_1_0(arg_1_0.data.background.children, {
			fontSize = 22,
			xcenter = 0,
			type = "label",
			top = 90,
			visible = false,
			text = language.get(135004),
			color = ccc3(255, 0, 0)
		})

		local var_1_28 = var_1_0(arg_1_0.data.background.children, {
			x = 0,
			z = 150,
			name = "GemMineNumBoard",
			type = "layer_color",
			height = 560,
			visible = false,
			y = 0,
			width = 930,
			color = ccc4(0, 0, 0, 180),
			children = {}
		})

		var_1_0(var_1_28.children, {
			left = 107,
			name = "ClickGemMine",
			type = "pic",
			top = 90,
			pic = "res/ui/activity/gemsActivity/mz1.png"
		})
		var_1_0(var_1_28.children, {
			name = "ClickGemMineNumTit",
			type = "pic",
			pic = "res/ui/activity/gemsActivity/mz2.png",
			left = 557 + var_1_27.numTitX,
			top = 90 + var_1_27.numTitY
		})
		var_1_0(var_1_28.children, {
			name = "ClickGemMineNumleft",
			height = 37,
			type = "atlas",
			startChar = 48,
			pic = "res/ui/activity/gemsActivity/mz3.png",
			text = "0",
			top = 108,
			width = 28,
			left = 672 + var_1_27.numLeftX,
			align = kCCTextAlignmentLeft
		})
		var_1_0(var_1_28.children, {
			left = 252,
			name = "PickupGemTit",
			visible = false,
			type = "pic",
			top = 90,
			pic = "res/ui/activity/gemsActivity/mz4.png"
		})

		local var_1_29 = var_1_0(arg_1_0.data.background.children, {
			xcenter = 0,
			name = "GemMineBoard",
			top = 120,
			type = "pic_9",
			pic = "res/ui/activity/ironReward/xs_view_2.png",
			visible = true,
			middleRect = CCRectMake(10, 10, 60, 60),
			preferedSize = CCSizeMake(880, 150),
			children = {}
		})

		var_1_0(var_1_29.children, {
			top = 33,
			x = 103,
			pic = "res/ui/activity/gemsActivity/mz_hdbs.png",
			type = "pic"
		})
		var_1_0(var_1_29.children, {
			x = 518,
			name = "GemsProgressBg",
			type = "pic_9",
			top = 33,
			pic = "res/ui/activity/gemsActivity/jdt_di.png",
			middleRect = CCRectMake(15, 0, 3, 33),
			preferedSize = CCSizeMake(630, 33),
			children = {
				{
					xcenter = 0,
					name = "actGemActivityBar",
					percentage = 20,
					type = "process",
					ycenter = 0,
					pic = "res/ui/activity/gemsActivity/jdt_1.png"
				},
				{
					xcenter = -300,
					name = "GemProgressLevel_1",
					type = "pic_9",
					anchorPointX = 0,
					ycenter = 1,
					pic = "res/ui/activity/gemsActivity/jdt_1.png",
					anchorPointY = 0.5,
					middleRect = CCRectMake(0, 0, 1, 13),
					preferedSize = CCSizeMake(0, 13)
				},
				{
					xcenter = -100,
					name = "GemProgressLevel_2",
					type = "pic_9",
					anchorPointX = 0,
					ycenter = 1,
					pic = "res/ui/activity/gemsActivity/jdt_2.png",
					anchorPointY = 0.5,
					middleRect = CCRectMake(0, 0, 1, 13),
					preferedSize = CCSizeMake(0, 13)
				},
				{
					xcenter = 100,
					name = "GemProgressLevel_3",
					type = "pic_9",
					anchorPointX = 0,
					ycenter = 1,
					pic = "res/ui/activity/gemsActivity/jdt_3.png",
					anchorPointY = 0.5,
					middleRect = CCRectMake(0, 0, 1, 13),
					preferedSize = CCSizeMake(0, 13)
				},
				{
					ycenter = 0,
					xcenter = -100,
					pic = "res/ui/activity/gemsActivity/jdt_fg.png",
					type = "pic"
				},
				{
					ycenter = 0,
					xcenter = 100,
					pic = "res/ui/activity/gemsActivity/jdt_fg.png",
					type = "pic"
				},
				{
					name = "NeedGemNum1",
					xcenter = -105,
					type = "label",
					ycenter = 30,
					fontSize = 28,
					text = "",
					strokeSize = 2,
					color = ccc3(204, 185, 134),
					strokeColor = ccc3(22, 18, 13)
				},
				{
					name = "NeedGemNum2",
					xcenter = 105,
					type = "label",
					ycenter = 30,
					fontSize = 28,
					text = "",
					strokeSize = 2,
					color = ccc3(204, 185, 134),
					strokeColor = ccc3(22, 18, 13)
				},
				{
					name = "NeedGemNum3",
					xcenter = 305,
					type = "label",
					ycenter = 30,
					fontSize = 28,
					text = "",
					strokeSize = 2,
					color = ccc3(204, 185, 134),
					strokeColor = ccc3(22, 18, 13)
				},
				{
					xcenter = -100,
					name = "actShenChuiIcon1",
					scale = 0.75,
					type = "pic",
					ycenter = -50,
					pic = "res/ui/activity/gemsActivity/acti_shenchui_icon.png",
					children = {
						{
							xcenter = 70,
							name = "HammerLeft_1",
							type = "label",
							fontSize = 26,
							text = "",
							y = 10,
							strokeSize = 2,
							color = ccc3(188, 183, 183),
							strokeColor = ccc3(22, 18, 13)
						},
						{
							xcenter = 0,
							name = "animSprite1",
							type = "pic",
							ycenter = 0,
							pic = ""
						}
					}
				},
				{
					xcenter = 100,
					name = "actShenChuiIcon2",
					scale = 0.75,
					type = "pic",
					ycenter = -50,
					pic = "res/ui/activity/gemsActivity/acti_shenchui_icon.png",
					children = {
						{
							xcenter = 70,
							name = "HammerLeft_2",
							type = "label",
							fontSize = 26,
							text = "",
							y = 10,
							strokeSize = 2,
							color = ccc3(188, 183, 183),
							strokeColor = ccc3(22, 18, 13)
						},
						{
							xcenter = 0,
							name = "animSprite2",
							type = "pic",
							ycenter = 0,
							pic = ""
						}
					}
				},
				{
					xcenter = 295,
					name = "actShenChuiIcon3",
					scale = 0.75,
					type = "pic",
					ycenter = -50,
					pic = "res/ui/activity/gemsActivity/acti_shenchui_icon.png",
					children = {
						{
							xcenter = 70,
							name = "HammerLeft_3",
							type = "label",
							fontSize = 26,
							text = "",
							y = 10,
							strokeSize = 2,
							color = ccc3(188, 183, 183),
							strokeColor = ccc3(22, 18, 13)
						},
						{
							xcenter = 0,
							name = "animSprite3",
							type = "pic",
							ycenter = 0,
							pic = ""
						}
					}
				}
			}
		})
		var_1_0(arg_1_0.data.background.children, {
			type = "pic",
			z = 200,
			name = "HammerClick",
			anchorPointX = 0,
			x = 545,
			pic = "res/ui/activity/gemsActivity/shengchui.png",
			visible = false,
			top = 300,
			anchorPointY = 0,
			scale = 0.8
		})
		var_1_0(arg_1_0.data.background.children, {
			x = 145,
			name = "GemMine_1",
			z = 200,
			type = "pic",
			top = 325,
			pic = "res/ui/activity/gemsActivity/gem/greengem1.png"
		})
		var_1_0(arg_1_0.data.background.children, {
			x = 145,
			name = "MineIntro_1",
			z = 200,
			type = "pic",
			top = 420,
			pic = "res/ui/activity/gemsActivity/gemmine_chuji.png",
			children = {
				{
					xcenter = 0,
					ycenter = 10,
					pic = "res/ui/activity/gemsActivity/gemmine_chuji1.png",
					type = "pic"
				},
				{
					xcenter = 0,
					type = "pic",
					ycenter = -13,
					pic = "res/ui/activity/gemsActivity/gemmine_chuji2.png",
					children = {
						{
							name = "HammerGemLeft_1",
							height = 19,
							type = "atlas",
							pic = "res/ui/activity/gemsActivity/gemmine_chuji3.png",
							text = "0",
							y = 13,
							startChar = 48,
							width = 16,
							x = 73 + var_1_27.hamerGemLeft,
							align = kCCTextAlignmentLeft
						}
					}
				}
			}
		})
		var_1_0(arg_1_0.data.background.children, {
			x = 345,
			name = "GemMine_2",
			z = 200,
			type = "pic",
			top = 325,
			pic = "res/ui/activity/gemsActivity/gem/yellowgem1.png"
		})
		var_1_0(arg_1_0.data.background.children, {
			x = 345,
			name = "MineIntro_2",
			z = 200,
			type = "pic",
			top = 420,
			pic = "res/ui/activity/gemsActivity/gemmine_zhongji.png",
			children = {
				{
					xcenter = 0,
					ycenter = 10,
					pic = "res/ui/activity/gemsActivity/gemmine_zhongji1.png",
					type = "pic"
				},
				{
					xcenter = 0,
					type = "pic",
					ycenter = -13,
					pic = "res/ui/activity/gemsActivity/gemmine_zhongji2.png",
					children = {
						{
							name = "HammerGemLeft_2",
							height = 19,
							type = "atlas",
							pic = "res/ui/activity/gemsActivity/gemmine_zhongji3.png",
							text = "0",
							y = 13,
							startChar = 48,
							width = 16,
							x = 73 + var_1_27.hamerGemLeft,
							align = kCCTextAlignmentLeft
						}
					}
				}
			}
		})
		var_1_0(arg_1_0.data.background.children, {
			x = 545,
			name = "GemMine_3",
			z = 200,
			type = "pic",
			top = 325,
			pic = "res/ui/activity/gemsActivity/gem/redgem1.png"
		})
		var_1_0(arg_1_0.data.background.children, {
			x = 545,
			name = "MineIntro_3",
			z = 200,
			type = "pic",
			top = 420,
			pic = "res/ui/activity/gemsActivity/gemmine_gaoji.png",
			children = {
				{
					xcenter = 0,
					ycenter = 10,
					pic = "res/ui/activity/gemsActivity/gemmine_gaoji1.png",
					type = "pic"
				},
				{
					xcenter = 0,
					type = "pic",
					ycenter = -13,
					pic = "res/ui/activity/gemsActivity/gemmine_gaoji2.png",
					children = {
						{
							name = "HammerGemLeft_3",
							height = 19,
							type = "atlas",
							pic = "res/ui/activity/gemsActivity/gemmine_gaoji3.png",
							text = "0",
							y = 13,
							startChar = 48,
							width = 16,
							x = 73 + var_1_27.hamerGemLeft,
							align = kCCTextAlignmentLeft
						}
					}
				}
			}
		})
		var_1_0(arg_1_0.data.background.children, {
			x = 745,
			name = "GemMine_4",
			z = 200,
			type = "pic",
			top = 325,
			pic = "res/ui/activity/gemsActivity/gem/purplegem1.png"
		})
		var_1_0(arg_1_0.data.background.children, {
			x = 745,
			name = "MineIntro_4",
			z = 200,
			type = "pic",
			top = 420,
			pic = "res/ui/activity/gemsActivity/gemmine_teji.png",
			children = {
				{
					xcenter = 0,
					ycenter = 10,
					pic = "res/ui/activity/gemsActivity/gemmine_teji1.png",
					type = "pic"
				},
				{
					xcenter = 0,
					type = "pic",
					ycenter = -13,
					pic = "res/ui/activity/gemsActivity/gemmine_teji2.png",
					children = {
						{
							name = "HammerGemLeft_4",
							height = 19,
							type = "atlas",
							pic = "res/ui/activity/gemsActivity/gemmine_teji3.png",
							text = "0",
							y = 13,
							startChar = 48,
							width = 16,
							x = 73 + var_1_27.hamerGemLeft,
							align = kCCTextAlignmentLeft
						}
					}
				}
			}
		})
	end
end

function getIronActDescData()
	return {
		x = 800,
		name = "actIronTipFrame",
		type = "pic_9",
		y = 400,
		pic = "frame:common_tip_frame_small.png",
		middleRect = CCRectMake(0, 0, 0, 0),
		preferedSize = CCSizeMake(300, 150),
		children = {
			{
				fontSize = 22,
				height = 130,
				type = "label",
				ycenter = 0,
				xcenter = 0,
				width = 280,
				text = language.get(400042)
			}
		}
	}
end

function var_0_0.getData(arg_13_0)
	return arg_13_0.data or {}
end

return var_0_0
