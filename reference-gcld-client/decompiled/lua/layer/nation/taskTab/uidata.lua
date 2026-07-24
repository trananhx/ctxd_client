local var_0_0 = class("taskTabUiData")

function var_0_0.ctor(arg_1_0, arg_1_1)
	local var_1_0 = {}

	if conf.language == "kr" then
		var_1_0.biwuLeftTitleY = 22
		var_1_0.biwuTryHardY = -30
		var_1_0.curNickNameScale = 1
		var_1_0.curNickNameY = 0
		var_1_0.curRankX = 0
		var_1_0.curRankBonusX = 0
		var_1_0.yellowLevelX = 0
		var_1_0.wonderLevelX = 0
		var_1_0.progressValueX = 0
		var_1_0.materialLabelX = 0
		var_1_0.rewardIconX = 0
		var_1_0.bottomLableX = 0
		var_1_0.nickNameScale = 1
		var_1_0.taskCityInWarLabelSize = 0
		var_1_0.subTitle1 = 0
		var_1_0.subTitle2 = 0
		var_1_0.taskDescLabelY = 0
		var_1_0.taskExtraInfoX = 0
		var_1_0.lanternDescFntSize = -4
	elseif conf.language == "vie" then
		var_1_0.biwuLeftTitleY = 0
		var_1_0.biwuTryHardY = 0
		var_1_0.curNickNameScale = 1.5
		var_1_0.curNickNameY = -16
		var_1_0.curRankX = -80
		var_1_0.curRankBonusX = 80
		var_1_0.yellowLevelX = 50
		var_1_0.wonderLevelX = -30
		var_1_0.progressValueX = 40
		var_1_0.materialLabelX = 20
		var_1_0.rewardIconX = 60
		var_1_0.bottomLableX = 50
		var_1_0.nickNameScale = 1.5
		var_1_0.taskCityInWarLabelSize = -4
		var_1_0.subTitle1 = 60
		var_1_0.subTitle2 = 60
		var_1_0.taskDescLabelY = -20
		var_1_0.taskExtraInfoX = 90
		var_1_0.lanternDescFntSize = -4
	elseif conf.language == "tha" then
		var_1_0.biwuLeftTitleY = 0
		var_1_0.biwuTryHardY = 0
		var_1_0.curNickNameScale = 1
		var_1_0.curNickNameY = 0
		var_1_0.curRankX = 0
		var_1_0.curRankBonusX = 0
		var_1_0.yellowLevelX = 40
		var_1_0.wonderLevelX = 50
		var_1_0.progressValueX = 0
		var_1_0.materialLabelX = 0
		var_1_0.rewardIconX = 0
		var_1_0.bottomLableX = 0
		var_1_0.nickNameScale = 1
		var_1_0.taskCityInWarLabelSize = 0
		var_1_0.subTitle1 = 0
		var_1_0.subTitle2 = 0
		var_1_0.taskDescLabelY = 0
		var_1_0.taskExtraInfoX = 0
		var_1_0.lanternDescFntSize = 0
	else
		var_1_0.biwuLeftTitleY = 0
		var_1_0.biwuTryHardY = 0
		var_1_0.curNickNameScale = 1
		var_1_0.curNickNameY = 0
		var_1_0.curRankX = 0
		var_1_0.curRankBonusX = 0
		var_1_0.yellowLevelX = 0
		var_1_0.wonderLevelX = 0
		var_1_0.progressValueX = 0
		var_1_0.materialLabelX = 0
		var_1_0.rewardIconX = 0
		var_1_0.bottomLableX = 0
		var_1_0.nickNameScale = 1
		var_1_0.taskCityInWarLabelSize = 0
		var_1_0.subTitle1 = 0
		var_1_0.subTitle2 = 0
		var_1_0.taskDescLabelY = 0
		var_1_0.taskExtraInfoX = 0
		var_1_0.lanternDescFntSize = 0
	end

	local function var_1_1(arg_2_0, arg_2_1)
		arg_2_0[#arg_2_0 + 1] = arg_2_1

		return arg_2_1
	end

	arg_1_0.data = {}

	if arg_1_1 == nil then
		arg_1_0.data.background = {
			xcenter = 0,
			type = "pic",
			ycenter = -20,
			pic = "res/ui/nation/renwudi.jpg",
			children = {
				{
					x = 458,
					y = 493,
					pic = "res/ui/nationTask/kfyz_title_rwwfb.png",
					type = "pic"
				},
				{
					x = 180,
					name = "taskMap",
					y = 270,
					type = "pic",
					pic = "frame:nationMap.png"
				},
				{
					anchorPointX = 0,
					x = 360,
					y = 405,
					type = "pic",
					anchorPointY = 1,
					pic = "res/ui/general/jailView/comm_list_laofang_2.png",
					children = {
						{
							type = "pic",
							name = "bar1",
							anchorPointX = 0,
							visible = false,
							x = -10,
							anchorPointY = 0,
							pic = "res/ui/general/jailView/comm_list_laofang_3.png",
							y = 33
						},
						{
							fontSize = 25,
							anchorPointX = 0,
							type = "label",
							anchorPointY = 1,
							x = 5,
							y = 33,
							text = language.get(95101),
							color = tool.hexToRgb("#95855E")
						}
					}
				},
				{
					anchorPointX = 0,
					x = 360,
					y = 225,
					type = "pic",
					anchorPointY = 1,
					pic = "res/ui/general/jailView/comm_list_laofang_2.png",
					children = {
						{
							type = "pic",
							name = "bar2",
							anchorPointX = 0,
							visible = false,
							x = -10,
							anchorPointY = 0,
							pic = "res/ui/general/jailView/comm_list_laofang_3.png",
							y = 33
						},
						{
							fontSize = 25,
							anchorPointX = 0,
							type = "label",
							anchorPointY = 1,
							x = 5,
							y = 33,
							text = language.get(95102),
							color = tool.hexToRgb("#95855E")
						}
					}
				},
				{
					fontSize = 25,
					name = "txt1",
					type = "label",
					anchorPointX = 0,
					x = 430,
					y = 315,
					text = language.get(95103),
					color = tool.hexToRgb("#95855E")
				},
				{
					fontSize = 25,
					name = "txt2",
					type = "label",
					anchorPointX = 0,
					y = 315,
					visible = false,
					x = 570,
					text = language.get(95104),
					color = tool.hexToRgb("#609D4E")
				},
				{
					fontSize = 25,
					height = 0,
					y = 115,
					type = "label",
					width = 430,
					anchorPointX = 0,
					x = 430,
					text = language.get(95105),
					color = tool.hexToRgb("#95855E"),
					halign = kCCTextAlignmentLeft
				}
			}
		}
	elseif arg_1_1 ~= taskTabConstant.TYPES.NATION_ATTACK_DEFENSE_TASK and arg_1_1 ~= taskTabConstant.TYPES.NATION_DONATION_TASK and arg_1_1 ~= taskTabConstant.TYPES.NATION_LANTERN_TASK then
		arg_1_0.data.background = {
			xcenter = 0,
			type = "pic",
			ycenter = -30,
			pic = "res/ui/nation/nationOtherBg.jpg",
			children = {}
		}

		var_1_1(arg_1_0.data.background.children, {
			fontSize = 24,
			name = "text1",
			stroke = false,
			type = "label",
			y = 396,
			text = language.get(95034),
			color = ccc3(204, 185, 134),
			x = 372 + var_1_0.subTitle1
		})
		var_1_1(arg_1_0.data.background.children, {
			fontSize = 20,
			name = "taskDetail",
			text = "",
			type = "label",
			x = 580,
			color = ccc3(204, 185, 134),
			y = 362 + var_1_0.taskDescLabelY
		})
		var_1_1(arg_1_0.data.background.children, {
			fontSize = 24,
			name = "taskKill",
			text = "",
			type = "label",
			y = 396,
			x = 795,
			color = ccc3(204, 185, 134)
		})
		var_1_1(arg_1_0.data.background.children, {
			x = 805,
			name = "isFinished",
			y = 380,
			type = "pic",
			visible = false,
			pic = "frame:tuzhang_yiwancheng.png"
		})
		var_1_1(arg_1_0.data.background.children, {
			fontSize = 24,
			name = "text2",
			stroke = false,
			type = "label",
			y = 296,
			text = language.get(95035),
			color = ccc3(204, 185, 134),
			x = 372 + var_1_0.subTitle2
		})
		var_1_1(arg_1_0.data.background.children, {
			name = "title",
			x = 484,
			type = "pic",
			pic = "frame:nationWeishangbang.png",
			scale = var_1_0.curNickNameScale,
			y = 279 + var_1_0.curNickNameY
		})
		var_1_1(arg_1_0.data.background.children, {
			fontSize = 24,
			name = "rankText",
			type = "label",
			y = 296,
			text = language.get(95036),
			color = ccc3(204, 185, 134),
			x = 803 + var_1_0.curRankX
		})
		var_1_1(arg_1_0.data.background.children, {
			fontSize = 24,
			stroke = false,
			type = "label",
			y = 222,
			text = language.get(95037),
			color = ccc3(204, 185, 134),
			x = 372 + var_1_0.curRankBonusX
		})
		var_1_1(arg_1_0.data.background.children, {
			x = 450,
			name = "taskKuangExp",
			y = 165,
			type = "pic",
			visible = false,
			pic = "frame:jianglikuang.png",
			children = {
				{
					x = 39.5,
					y = 39.5,
					pic = "res/ui/task/get_icon_exp.png",
					type = "pic"
				},
				{
					fontSize = 18,
					name = "taskExp",
					text = "0",
					type = "label",
					y = 19.5,
					x = 39.5,
					color = ccc3(255, 255, 255)
				}
			}
		})
		var_1_1(arg_1_0.data.background.children, {
			x = 550,
			name = "taskKuangIron",
			y = 165,
			type = "pic",
			visible = false,
			pic = "frame:jianglikuang.png",
			children = {
				{
					x = 39.5,
					name = "taskKuangIron_realIron",
					y = 39.5,
					type = "pic",
					pic = "res/ui/task/get_icon_iron.png"
				},
				{
					fontSize = 18,
					name = "taskIron",
					text = "0",
					type = "label",
					y = 19.5,
					x = 39.5,
					color = ccc3(255, 255, 255)
				}
			}
		})
		var_1_1(arg_1_0.data.background.children, {
			x = 650,
			name = "taskKuangWinExp",
			y = 165,
			type = "pic",
			visible = false,
			pic = "frame:jianglikuang.png",
			children = {
				{
					x = 39.5,
					y = 39.5,
					pic = "res/ui/task/get_icon_exp.png",
					type = "pic"
				},
				{
					fontSize = 18,
					name = "taskWinExp",
					text = "0",
					type = "label",
					y = 19.5,
					x = 39.5,
					color = ccc3(255, 255, 255)
				},
				{
					x = 22,
					y = 56,
					pic = "frame:nation_task_extra_icon1.png",
					type = "pic"
				}
			}
		})
		var_1_1(arg_1_0.data.background.children, {
			x = 750,
			name = "taskKuangWinIron",
			y = 165,
			type = "pic",
			visible = false,
			pic = "frame:jianglikuang.png",
			children = {
				{
					x = 39.5,
					y = 39.5,
					pic = "res/ui/task/get_icon_iron.png",
					type = "pic"
				},
				{
					fontSize = 18,
					name = "taskWinIron",
					text = "0",
					type = "label",
					y = 19.5,
					x = 39.5,
					color = ccc3(255, 255, 255)
				},
				{
					x = 22,
					y = 56,
					pic = "frame:nation_task_extra_icon1.png",
					type = "pic"
				}
			}
		})
		var_1_1(arg_1_0.data.background.children, {
			x = 750,
			name = "taskKuangFirstKillIron",
			y = 165,
			type = "pic",
			visible = false,
			pic = "frame:jianglikuang.png",
			children = {
				{
					x = 39.5,
					y = 39.5,
					pic = "res/ui/task/get_icon_iron.png",
					type = "pic"
				},
				{
					fontSize = 18,
					name = "taskFirstKillIron",
					text = "0",
					type = "label",
					y = 19.5,
					x = 39.5,
					color = ccc3(255, 255, 255)
				},
				{
					y = 57,
					x = 22,
					scale = 0.65,
					type = "pic",
					pic = "frame:xzymz_jb_ss.png"
				}
			}
		})
		var_1_1(arg_1_0.data.background.children, {
			x = 805,
			name = "isRewarded",
			y = 215,
			type = "pic",
			visible = false,
			pic = "frame:nation_task_draw.png"
		})
		var_1_1(arg_1_0.data.background.children, {
			fontSize = 30,
			name = "taskNoReward",
			type = "label",
			y = 166,
			visible = false,
			x = 548,
			text = language.get(95038)
		})

		if arg_1_1 == taskTabConstant.TYPES.NATION_TRY_TASK then
			var_1_1(arg_1_0.data.background.children, {
				top = 23,
				xcenter = 0,
				pic = "frame:guojiashilian.png",
				type = "pic"
			})
			var_1_1(arg_1_0.data.background.children, {
				x = 160,
				y = 250,
				pic = "frame:nationManwang.png",
				type = "pic"
			})
			var_1_1(arg_1_0.data.background.children, {
				fontSize = 20,
				y = 362,
				type = "label",
				x = 580,
				text = language.get(95039),
				color = ccc3(204, 185, 134)
			})
		elseif arg_1_1 == taskTabConstant.TYPES.NATION_BAR_PROTECT_TASK then
			var_1_1(arg_1_0.data.background.children, {
				top = 23,
				xcenter = 0,
				pic = "frame:nationBaohumanwang.png",
				type = "pic"
			})
			var_1_1(arg_1_0.data.background.children, {
				x = 160,
				y = 250,
				pic = "frame:nationManwang.png",
				type = "pic"
			})
		elseif arg_1_1 == taskTabConstant.TYPES.NATION_UPGRADE_TASK then
			var_1_1(arg_1_0.data.background.children, {
				top = 23,
				xcenter = 0,
				pic = "frame:guojiashengji.png",
				type = "pic"
			})
			var_1_1(arg_1_0.data.background.children, {
				x = 160,
				y = 250,
				pic = "frame:nationTaishici.png",
				type = "pic"
			})
			var_1_1(arg_1_0.data.background.children, {
				width = 29,
				height = 46,
				name = "taskPercentage",
				type = "atlas",
				pic = "res/ui/common/number/get_numb.png",
				text = "0",
				y = 480,
				startChar = 48,
				x = 588
			})
			var_1_1(arg_1_0.data.background.children, {
				x = 645,
				y = 480,
				pic = "frame:get_numb_perce.png",
				type = "pic"
			})
		elseif arg_1_1 == taskTabConstant.TYPES.NATION_DONATION_TASK then
			-- block empty
		elseif arg_1_1 == taskTabConstant.TYPES.NATION_PROTECT_TASK then
			var_1_1(arg_1_0.data.background.children, {
				top = 23,
				xcenter = 0,
				pic = "frame:nationJianshoubianjiang.png",
				type = "pic"
			})
			var_1_1(arg_1_0.data.background.children, {
				x = 152,
				name = "taskMap",
				y = 247,
				type = "pic",
				pic = "frame:nationMap.png"
			})
			var_1_1(arg_1_0.data.background.children, {
				y = 392,
				x = 150,
				type = "pic",
				pic = "frame:nation_sma_view_bg.png",
				children = {
					{
						fontSize = 22,
						name = "taskCityInWar",
						type = "label",
						ycenter = 0,
						xcenter = 0,
						text = language.get(95041)
					}
				}
			})
		elseif arg_1_1 == taskTabConstant.TYPES.NATION_HELP_BAR_TASK then
			var_1_1(arg_1_0.data.background.children, {
				top = 23,
				xcenter = 0,
				pic = "frame:nation_tit_zmfd.png",
				type = "pic"
			})
			var_1_1(arg_1_0.data.background.children, {
				x = 152,
				name = "taskMap",
				y = 247,
				type = "pic",
				pic = "frame:nationMap.png"
			})
			var_1_1(arg_1_0.data.background.children, {
				y = 392,
				x = 150,
				type = "pic",
				pic = "frame:nation_sma_view_bg.png",
				children = {
					{
						fontSize = 22,
						name = "taskCityInWar",
						type = "label",
						ycenter = 0,
						xcenter = 0,
						text = language.get(95042)
					}
				}
			})
		elseif arg_1_1 == taskTabConstant.TYPES.NATION_EXPAND_TASK then
			var_1_1(arg_1_0.data.background.children, {
				top = 23,
				xcenter = 0,
				pic = "frame:nationKaijiangkuotu.png",
				type = "pic"
			})
			var_1_1(arg_1_0.data.background.children, {
				y = 392,
				x = 150,
				type = "pic",
				pic = "frame:nation_sma_view_bg.png",
				children = {
					{
						xcenter = 0,
						fontSize = 22,
						stroke = false,
						type = "label",
						ycenter = 0,
						text = language.get(95043)
					}
				}
			})

			local var_1_2 = {
				"wei",
				"shu",
				"wu"
			}

			for iter_1_0 = 1, 3 do
				local var_1_3 = 70 + 73 * (iter_1_0 - 1)

				var_1_1(arg_1_0.data.background.children, {
					type = "pic_9",
					anchorPointY = 0,
					y = 95,
					name = "taskForce_" .. iter_1_0,
					middleRect = CCRectMake(5, 5, 28, 185),
					preferedSize = CCSizeMake(38, 196),
					pic = "frame:nation_degr_y_" .. var_1_2[iter_1_0] .. ".png",
					x = var_1_3
				})
				var_1_1(arg_1_0.data.background.children, {
					fontSize = 35,
					stroke = false,
					type = "label",
					y = 337,
					name = "taskForceName_" .. iter_1_0,
					color = colorForce[iter_1_0],
					x = var_1_3
				})
				var_1_1(arg_1_0.data.background.children, {
					fontSize = 22,
					stroke = false,
					type = "label",
					y = 304,
					text = "100",
					name = "taskCityNum_" .. iter_1_0,
					x = var_1_3
				})
			end
		elseif arg_1_1 == taskTabConstant.TYPES.NATION_ATTACK_BAR_TASK then
			var_1_1(arg_1_0.data.background.children, {
				top = 23,
				xcenter = 0,
				pic = "frame:xzymz_title.png",
				type = "pic"
			})
			var_1_1(arg_1_0.data.background.children, {
				y = 392,
				x = 150,
				type = "pic",
				pic = "frame:nation_sma_view_bg.png",
				children = {
					{
						fontSize = 22,
						name = "taskCityInWar",
						type = "label",
						ycenter = 0,
						xcenter = 0,
						text = language.get(95044)
					}
				}
			})
			var_1_1(arg_1_0.data.background.children, {
				x = 152,
				name = "taskMap",
				y = 247,
				type = "pic",
				pic = "frame:nationMap.png",
				children = {
					{
						y = 210,
						x = 194,
						type = "pic",
						pic = "res/ui/nation/xzymz_map_word_di.png",
						children = {
							{
								fontSize = 18,
								name = "weiCityNum",
								text = "",
								type = "label",
								xcenter = 0,
								ycenter = 2,
								color = ccc3(144, 200, 248)
							}
						}
					},
					{
						y = 140,
						x = 90,
						type = "pic",
						pic = "res/ui/nation/xzymz_map_word_di.png",
						children = {
							{
								fontSize = 18,
								name = "shuCityNum",
								text = "",
								type = "label",
								xcenter = 0,
								ycenter = 2,
								color = ccc3(235, 150, 66)
							}
						}
					},
					{
						y = 70,
						x = 192,
						type = "pic",
						pic = "res/ui/nation/xzymz_map_word_di.png",
						children = {
							{
								fontSize = 18,
								name = "wuCityNum",
								text = "",
								type = "label",
								xcenter = 0,
								ycenter = 2,
								color = ccc3(136, 212, 66)
							}
						}
					},
					{
						y = 0,
						x = 150,
						type = "pic",
						pic = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png",
						children = {
							{
								xcenter = 0,
								fontSize = 24,
								type = "label",
								ycenter = 5,
								text = language.get("222701_seasilk")
							}
						}
					}
				}
			})
		elseif arg_1_1 == taskTabConstant.TYPES.NATION_BUDOKAI_TASK then
			var_1_1(arg_1_0.data.background.children, {
				top = 23,
				xcenter = 0,
				pic = "frame:nationBiwu.png",
				type = "pic"
			})
			var_1_1(arg_1_0.data.background.children, {
				x = 150,
				type = "pic",
				pic = "frame:nation_sma_view_bg.png",
				y = 392 + var_1_0.biwuLeftTitleY,
				children = {
					{
						xcenter = 0,
						fontSize = 22,
						type = "label",
						ycenter = 0,
						text = language.get(95045)
					}
				}
			})

			for iter_1_1 = 1, 3 do
				var_1_1(arg_1_0.data.background.children, {
					visible = false,
					x = 60,
					type = "pic",
					pic = "frame:guojia_di.png",
					name = "taskForceNameBg_" .. iter_1_1,
					y = 380 - (iter_1_1 - 1) * 80 - 60,
					children = {
						{
							xcenter = 0,
							fontSize = 25,
							type = "label",
							ycenter = 0,
							name = "taskForceName_" .. iter_1_1
						}
					}
				})
				var_1_1(arg_1_0.data.background.children, {
					fontSize = 18,
					text = "",
					type = "label",
					visible = false,
					x = 88,
					name = "taskPlayerName_" .. iter_1_1,
					y = 412 - (iter_1_1 - 1) * 80 - 60
				})
				var_1_1(arg_1_0.data.background.children, {
					anchorPointX = 0,
					type = "pic_9",
					pic = "frame:nation_degr_x_wu.png",
					visible = false,
					x = 85,
					name = "taskProgress_" .. iter_1_1,
					middleRect = CCRectMake(5, 5, 204, 28),
					preferedSize = CCSizeMake(214, 38),
					y = 380 - (iter_1_1 - 1) * 80 - 60
				})
			end

			var_1_1(arg_1_0.data.background.children, {
				x = 150,
				name = "taskTryHard",
				type = "pic",
				pic = "frame:nationTryHard.png",
				y = 254 + var_1_0.biwuTryHardY
			})
			var_1_1(arg_1_0.data.background.children, {
				fontSize = 20,
				name = "taskExtraInfo",
				text = "",
				type = "label",
				y = 55,
				align = kCCTextAlignmentCenter,
				x = 136 + var_1_0.taskExtraInfoX
			})

			if conf.language == "kr" then
				var_1_1(arg_1_0.data.background.children, {
					fontSize = 20,
					name = "taskJumpToBudokai",
					type = "label",
					y = 362,
					x = 370,
					text = language.get(95046),
					color = ccc3(0, 255, 0)
				})
			else
				var_1_1(arg_1_0.data.background.children, {
					fontSize = 20,
					name = "taskJumpToBudokai",
					type = "label",
					y = 362,
					x = 430,
					text = language.get(95046),
					color = ccc3(0, 255, 0)
				})
			end
		elseif arg_1_1 == taskTabConstant.TYPES.NATION_ATTACK_THIEF_TASK then
			var_1_1(arg_1_0.data.background.children, {
				height = 46,
				name = "nationLv",
				type = "atlas",
				startChar = 48,
				pic = "res/ui/common/number/get_numb.png",
				text = "2",
				top = 19,
				width = 29,
				xcenter = -125 + var_1_0.yellowLevelX
			})
			var_1_1(arg_1_0.data.background.children, {
				xcenter = 10,
				name = "taskTitle",
				type = "pic",
				top = 23,
				pic = "res/ui/nationTask/thief/zyhj_tit.png"
			})
			var_1_1(arg_1_0.data.background.children, {
				x = 152,
				name = "taskThiefMap",
				y = 307,
				type = "pic",
				pic = "res/ui/nationTask/thief/zyhj_map_bg.png"
			})
			var_1_1(arg_1_0.data.background.children, {
				visible = false,
				name = "taskMap",
				x = 152,
				type = "pic",
				y = 247,
				pic = "frame:nationMap.png"
			})
		elseif arg_1_1 == taskTabConstant.TYPES.NATION_BUILDING_TASK then
			arg_1_0.data.background = {}
			arg_1_0.data.background = {
				xcenter = 0,
				anchorPointX = 0.5,
				type = "pic_9",
				ycenter = -30,
				pic = "res/ui/nationTask/building/jzqj_view_01.png",
				anchorPointY = 0.5,
				middleRect = CCRectMake(42, 42, 1, 1),
				preferedSize = CCSizeMake(915, 516),
				children = {
					{
						xcenter = 0,
						z = 0,
						type = "pic",
						top = 5,
						pic = "res/ui/nationTask/building/jzqj_view_08.png"
					},
					{
						xcenter = 0,
						name = "bg_middle",
						anchorPointX = 0.5,
						type = "pic",
						down = 65,
						anchorPointY = 0,
						pic = "res/ui/nationTask/building/jzqj_view_07.png",
						z = 0
					},
					{
						xcenter = 0,
						down = 5,
						z = 0,
						type = "pic",
						pic = "res/ui/nationTask/building/jzqj_view_06.png"
					},
					{
						x = 150,
						z = 5,
						y = 300,
						type = "pic",
						scale = 0.48,
						pic = "res/ui/nationTask/building/huawen_01.png"
					},
					{
						x = 369,
						name = "bg_titBg1",
						y = 408,
						type = "pic",
						z = 5,
						pic = "res/ui/general/jailView/comm_list_laofang_2.png"
					},
					{
						x = 369,
						name = "bg_titBg2",
						y = 267,
						type = "pic",
						z = 5,
						pic = "res/ui/general/jailView/comm_list_laofang_2.png"
					},
					{
						x = 369,
						name = "bg_titBg3",
						y = 173,
						type = "pic",
						z = 5,
						pic = "res/ui/general/jailView/comm_list_laofang_2.png"
					},
					{
						xcenter = 0,
						z = 15,
						y = 460,
						type = "pic",
						pic = "res/ui/general/jailView/comm_list_laofang_3.png"
					},
					{
						x = 590,
						name = "bg_bar1",
						y = 445,
						type = "pic",
						z = 10,
						pic = "res/ui/general/jailView/comm_list_laofang_3.png"
					},
					{
						x = 590,
						name = "bg_bar2",
						y = 304,
						type = "pic",
						z = 10,
						pic = "res/ui/general/jailView/comm_list_laofang_3.png"
					},
					{
						x = 590,
						name = "bg_bar3",
						y = 210,
						type = "pic",
						z = 10,
						pic = "res/ui/general/jailView/comm_list_laofang_3.png"
					},
					{
						xcenter = 0,
						z = 15,
						y = 115,
						type = "pic",
						pic = "res/ui/general/jailView/comm_list_laofang_3.png"
					}
				}
			}

			var_1_1(arg_1_0.data.background.children, {
				height = 46,
				name = "nationLv",
				type = "atlas",
				startChar = 48,
				pic = "res/ui/common/number/get_numb.png",
				text = "2",
				top = 19,
				width = 29,
				xcenter = -125 + var_1_0.wonderLevelX
			})
			var_1_1(arg_1_0.data.background.children, {
				xcenter = 10,
				name = "taskTitle",
				type = "pic",
				top = 23,
				pic = "res/ui/nationTask/building/jzqj_tit.png"
			})
			var_1_1(arg_1_0.data.background.children, {
				fontSize = 22,
				type = "label",
				x = 369,
				strokeSize = 2,
				y = 408,
				text = language.get(95065),
				color = ccc3(188, 183, 183),
				strokeColor = ccc3(22, 18, 13)
			})
			var_1_1(arg_1_0.data.background.children, {
				fontSize = 22,
				type = "label",
				x = 369,
				strokeSize = 2,
				y = 267,
				text = language.get(95066),
				color = ccc3(188, 183, 183),
				strokeColor = ccc3(22, 18, 13)
			})
			var_1_1(arg_1_0.data.background.children, {
				fontSize = 22,
				type = "label",
				x = 369,
				strokeSize = 2,
				y = 173,
				text = language.get(95067),
				color = ccc3(188, 183, 183),
				strokeColor = ccc3(22, 18, 13)
			})
			var_1_1(arg_1_0.data.background.children, {
				y = 360,
				x = 160,
				type = "pic",
				pic = "frame:cc_manzu_bg.png",
				children = {
					{
						xcenter = -30,
						ycenter = 0,
						pic = "res/ui/nationTask/building/jzqj_wcjd.png",
						type = "pic"
					},
					{
						height = 24,
						name = "nationPercent",
						type = "atlas",
						ycenter = 0,
						pic = "res/ui/nationTask/building/jzqj_jz_numb.png",
						text = "20",
						startChar = 48,
						width = 15,
						xcenter = 35 + var_1_0.progressValueX
					},
					{
						ycenter = 0,
						pic = "res/ui/nationTask/building/jzqj_jz_colon.png",
						type = "pic",
						xcenter = 70 + var_1_0.progressValueX
					}
				}
			})
			var_1_1(arg_1_0.data.background.children, {
				x = 160,
				y = 250,
				pic = "res/ui/nationTask/building/jzqj_city_icon.png",
				type = "pic"
			})
			var_1_1(arg_1_0.data.background.children, {
				fontSize = 22,
				type = "label",
				strokeSize = 2,
				y = 135,
				text = language.get(95068),
				color = ccc3(188, 183, 183),
				strokeColor = ccc3(22, 18, 13),
				x = 160 + var_1_0.bottomLableX
			})

			local var_1_4 = {
				{
					label = language.get(95089)
				},
				{
					label = language.get(95090)
				},
				{
					label = language.get(95091)
				}
			}

			for iter_1_2 = 1, 3 do
				var_1_1(arg_1_0.data.background.children, {
					fontSize = 22,
					type = "label",
					strokeSize = 2,
					text = var_1_4[iter_1_2].label,
					color = ccc3(188, 183, 183),
					strokeColor = ccc3(22, 18, 13),
					x = 478 + var_1_0.materialLabelX,
					y = 393 - (iter_1_2 - 1) * 43
				})
				var_1_1(arg_1_0.data.background.children, {
					x = 658,
					type = "pic",
					pic = "res/ui/nationTask/building/jzqj_degr_bg.png",
					y = 393 - (iter_1_2 - 1) * 43,
					children = {
						{
							xcenter = 0,
							percentage = 20,
							type = "process",
							ycenter = 0,
							pic = "res/ui/nationTask/building/jzqj_degr_gre.png",
							name = "materialPercent" .. iter_1_2
						},
						{
							xcenter = 0,
							type = "label",
							ycenter = 0,
							fontSize = 20,
							text = "20%",
							strokeSize = 2,
							name = "materialPercentNum" .. iter_1_2,
							color = ccc3(188, 183, 183),
							strokeColor = ccc3(22, 18, 13)
						}
					}
				})
				var_1_1(arg_1_0.data.background.children, {
					visible = false,
					x = 833,
					type = "pic",
					pic = "res/ui/nationTask/building/jzqj_yszy_full.png",
					name = "fullIcon" .. iter_1_2,
					y = 393 - (iter_1_2 - 1) * 43
				})
			end

			var_1_1(arg_1_0.data.background.children, {
				visible = false,
				name = "marchingIcon1",
				x = 833,
				type = "pic",
				y = 393,
				pic = "res/ui/nationTask/building/jzqj_carr_mc.png"
			})
			var_1_1(arg_1_0.data.background.children, {
				visible = false,
				name = "marchingIcon2",
				x = 833,
				type = "pic",
				y = 350,
				pic = "res/ui/nationTask/building/jzqj_carr_sc.png"
			})
			var_1_1(arg_1_0.data.background.children, {
				visible = false,
				name = "marchingIcon3",
				x = 833,
				type = "pic",
				y = 307,
				pic = "res/ui/nationTask/building/jzqj_carr_nt.png"
			})

			for iter_1_3 = 1, 2 do
				local var_1_5 = var_1_1(arg_1_0.data.background.children, {
					y = 234,
					type = "pic",
					visible = false,
					pic = "frame:jianglikuang1.png",
					name = iter_1_3 % 2 == 1 and "taskKuangWinExp" or "taskKuangWinIron",
					x = 305 + (iter_1_3 - 1) * 100 + 190 + var_1_0.rewardIconX,
					children = {}
				})

				var_1_1(var_1_5.children, {
					x = 39.5,
					y = 39.5,
					type = "pic",
					pic = iter_1_3 % 2 == 1 and "res/ui/task/get_icon_exp.png" or "res/ui/task/get_icon_iron.png"
				})
				var_1_1(var_1_5.children, {
					fontSize = 18,
					text = "0",
					type = "label",
					y = 19.5,
					x = 39.5,
					name = iter_1_3 % 2 == 1 and "taskWinExp" or "taskWinIron",
					color = ccc3(255, 255, 255)
				})
			end

			var_1_1(arg_1_0.data.background.children, {
				y = 256,
				x = 800,
				type = "pic",
				pic = "res/ui/nationTask/building/jzqj_view_att_bg.png",
				children = {
					{
						x = 65,
						type = "pic",
						ycenter = 0,
						pic = "frame:cityWindowNationBg.png",
						children = {
							{
								xcenter = 0,
								name = "nation1stIcon",
								stroke = false,
								type = "label",
								ycenter = 0,
								fontSize = 25
							}
						}
					},
					{
						xcenter = 25,
						height = 24,
						name = "nationPercent1st",
						type = "atlas",
						ycenter = 0,
						pic = "res/ui/nationTask/building/jzqj_jz_numb.png",
						text = "20",
						startChar = 48,
						width = 15
					},
					{
						xcenter = 60,
						ycenter = 0,
						pic = "res/ui/nationTask/building/jzqj_jz_colon.png",
						type = "pic"
					}
				}
			})

			for iter_1_4 = 1, 2 do
				local var_1_6 = var_1_1(arg_1_0.data.background.children, {
					y = 139,
					type = "pic",
					visible = false,
					pic = "frame:jianglikuang1.png",
					name = iter_1_4 % 2 == 1 and "taskKuangExp" or "taskKuangIron",
					x = 305 + (iter_1_4 - 1) * 100 + 190,
					children = {}
				})

				var_1_1(var_1_6.children, {
					x = 39.5,
					y = 39.5,
					type = "pic",
					name = iter_1_4 % 2 == 1 and "privateImageExp" or "privateImageIron",
					pic = iter_1_4 % 2 == 1 and "res/ui/task/get_icon_exp.png" or "res/ui/task/get_icon_iron.png"
				})
				var_1_1(var_1_6.children, {
					fontSize = 18,
					text = "0",
					type = "label",
					y = 19.5,
					x = 39.5,
					name = iter_1_4 % 2 == 1 and "taskExp" or "taskIron",
					color = ccc3(255, 255, 255)
				})
			end

			var_1_1(arg_1_0.data.background.children, {
				y = 161,
				x = 800,
				type = "pic",
				pic = "res/ui/nationTask/building/jzqj_view_att_bg.png",
				children = {
					{
						xcenter = 0,
						name = "title",
						type = "pic",
						ycenter = 0,
						pic = "frame:chenghao1.png",
						scale = var_1_0.nickNameScale
					}
				}
			})
		end

		var_1_1(arg_1_0.data.background.children, {
			type = "button",
			buttons = {
				{
					pic2 = "frame:btn2_gre_c.png",
					name = "drawReward",
					pic1 = "frame:btn2_gre_a.png",
					y = 44,
					visible = false,
					x = 778,
					children = {
						{
							fontSize = 20,
							y = 27,
							type = "label",
							x = 62.5,
							text = language.get(95047)
						}
					}
				}
			}
		})
	elseif arg_1_1 == taskTabConstant.TYPES.NATION_ATTACK_DEFENSE_TASK then
		arg_1_0.data.background = {
			xcenter = 0,
			type = "pic",
			ycenter = -30,
			pic = "res/ui/nation/renwudi.jpg",
			children = {}
		}

		var_1_1(arg_1_0.data.background.children, {
			xcenter = 0,
			name = "gongshou_title",
			type = "pic",
			top = 23,
			pic = "res/ui/nationTask/thunder/lxgs_title_0000s_0008_gongshouchengchi.png"
		})
		var_1_1(arg_1_0.data.background.children, {
			x = 165,
			name = "daojishi",
			y = 392,
			type = "pic",
			pic = "frame:nation_sma_view_bg.png",
			children = {
				{
					xcenter = 0,
					fontSize = 22,
					type = "label",
					ycenter = 0,
					text = language.get(490550)
				}
			}
		})
		var_1_1(arg_1_0.data.background.children, {
			x = 167,
			name = "taskMap",
			y = 247,
			type = "pic",
			pic = "frame:nationMap.png"
		})
		var_1_1(arg_1_0.data.background.children, {
			anchorPointX = 0,
			name = "bg_indiv1",
			visible = false,
			type = "pic_9",
			pic = "res/ui/nationTask/newPic/rwyh_small_bg.png",
			y = 480,
			x = 630,
			middleRect = CCRectMake(0, 20, 565, 28),
			preferedSize = CCSizeMake(300, 55),
			children = {
				{
					x = 10,
					y = 30,
					pic = "res/ui/nationTask/newPic/gzzl_task_zl.png",
					type = "pic"
				},
				{
					fontSize = 22,
					height = 0,
					stroke = false,
					anchorPointX = 0,
					width = 240,
					type = "label",
					y = 30,
					x = 35,
					text = language.get(92026),
					color = tool.hexToRgb("#D9EDC5")
				}
			}
		})
		var_1_1(arg_1_0.data.background.children, {
			anchorPointX = 0,
			name = "bg_decide",
			visible = false,
			type = "pic_9",
			pic = "res/ui/juben/jb_wj_lv_d.png",
			y = 430,
			x = 318,
			middleRect = CCRectMake(80, 20, 15, 9),
			preferedSize = CCSizeMake(550, 60),
			children = {
				{
					fontSize = 28,
					name = "decide_type",
					stroke = false,
					type = "label",
					anchorPointX = 1,
					x = 100,
					y = 30,
					color = tool.hexToRgb("#FFF890")
				},
				{
					fontSize = 23,
					name = "decide_info",
					stroke = false,
					type = "label",
					anchorPointX = 0,
					x = 110,
					y = 30,
					color = tool.hexToRgb("#CCB986")
				}
			}
		})
		var_1_1(arg_1_0.data.background.children, {
			x = 358,
			name = "bg_indiv2",
			y = 375,
			type = "pic",
			visible = false,
			pic = "res/ui/nationTask/newPic/rwyh_icon01.png",
			children = {
				{
					anchorPointX = 0,
					x = 35,
					type = "pic_9",
					anchorPointY = 1,
					pic = "res/ui/nationTask/newPic/rwyh_small_bg.png",
					y = 70,
					middleRect = CCRectMake(0, 20, 565, 28),
					preferedSize = CCSizeMake(565, 220)
				},
				{
					anchorPointX = 0,
					x = 430,
					type = "pic_9",
					y = 30,
					pic = "res/ui/nationTask/newPic/rwyh_small_bg.png",
					middleRect = CCRectMake(0, 20, 565, 28),
					preferedSize = CCSizeMake(120, 55),
					children = {
						{
							x = 10,
							name = "icon_indiv",
							y = 30,
							type = "pic",
							pic = "res/ui/nationTask/newPic/gzzl_task_zl.png"
						},
						{
							fontSize = 22,
							name = "idx_indiv",
							stroke = false,
							type = "label",
							text = "0/0",
							y = 30,
							x = 60
						}
					}
				},
				{
					fontSize = 22,
					name = "name_indiv",
					stroke = false,
					type = "label",
					anchorPointX = 0,
					x = 75,
					y = 30,
					color = ccc3(204, 185, 134)
				},
				{
					fontSize = 22,
					name = "lbl_indiv",
					stroke = false,
					anchorPointX = 0,
					type = "label",
					y = -40,
					x = 75,
					text = language.get(390456),
					color = ccc3(204, 185, 134)
				},
				{
					anchorPointX = 0,
					name = "bg_process_indiv",
					x = 75,
					type = "pic",
					y = -5,
					pic = "frame:guojiajingdudi1.png"
				},
				{
					anchorPointX = 0,
					name = "process_indiv",
					x = 75,
					type = "process",
					y = -5,
					pic = "frame:guojiajingdutiao1_4.png"
				},
				{
					fontSize = 22,
					name = "num_indiv",
					text = "0/0",
					type = "label",
					y = -5,
					x = 305
				},
				{
					type = "button",
					buttons = {
						{
							pic2 = "frame:btn2_gre_c.png",
							name = "btn_reward_indiv1",
							pic1 = "frame:btn2_gre_a.png",
							y = -105,
							x = 480,
							children = {
								{
									fontSize = 20,
									y = 27,
									type = "label",
									x = 62.5,
									text = language.get(95047)
								}
							}
						}
					}
				},
				{
					x = 305,
					name = "indiv_finish",
					y = -90,
					type = "pic",
					visible = false,
					pic = "res/ui/nationTask/newPic/gzzl_word_ywcsyrw.png"
				}
			}
		})
		var_1_1(arg_1_0.data.background.children, {
			x = 358,
			name = "bg_indiv3",
			y = 165,
			type = "pic",
			visible = false,
			pic = "res/ui/nationTask/newPic/rwyh_icon03.png",
			children = {
				{
					anchorPointX = 0,
					x = -15,
					type = "pic_9",
					anchorPointY = 1,
					pic = "res/ui/nationTask/newPic/rwyh_jl_bg.png",
					y = 70,
					middleRect = CCRectMake(0, 20, 589, 112),
					preferedSize = CCSizeMake(600, 150)
				},
				{
					type = "button",
					buttons = {
						{
							pic2 = "frame:btn2_gre_c.png",
							name = "btn_reward_indiv2",
							pic1 = "frame:btn2_gre_a.png",
							y = -95,
							x = 480,
							children = {
								{
									fontSize = 20,
									y = 27,
									type = "label",
									x = 62.5,
									text = language.get(95047)
								}
							}
						}
					}
				}
			}
		})
	elseif arg_1_1 == taskTabConstant.TYPES.NATION_DONATION_TASK then
		arg_1_0.data.background = {
			xcenter = 0,
			type = "pic",
			ycenter = -30,
			pic = "res/ui/nation/nationOtherBg.jpg",
			children = {}
		}

		var_1_1(arg_1_0.data.background.children, {
			top = 23,
			xcenter = 0,
			pic = "frame:invest_tit.png",
			type = "pic"
		})
		var_1_1(arg_1_0.data.background.children, {
			xcenter = 0,
			name = "donateEventPic",
			y = 291,
			type = "pic",
			pic = "res/ui/nation/101.jpg"
		})
		var_1_1(arg_1_0.data.background.children, {
			xcenter = 0,
			name = "donateProgressBg",
			y = 115,
			type = "pic",
			pic = "frame:invest_degr_view_new.png",
			children = {
				{
					xcenter = 0,
					name = "donateProgess",
					percentage = 20,
					type = "process",
					ycenter = 0,
					pic = "frame:invest_degr_shu_new.jpg"
				},
				{
					xcenter = 0,
					ycenter = 0,
					pic = "frame:invest_degr_up_new.png",
					type = "pic"
				},
				{
					x = 0,
					y = 50,
					pic = "frame:silver.png",
					type = "pic"
				},
				{
					xcenter = 20,
					name = "donateLock",
					y = 50,
					type = "pic",
					pic = "frame:invest_degr_icon_lock.png"
				}
			}
		})
		var_1_1(arg_1_0.data.background.children, {
			x = 74,
			y = 410,
			pic = "frame:invest_rank_tit.png",
			type = "pic"
		})
		var_1_1(arg_1_0.data.background.children, {
			fontSize = 24,
			anchorPointX = 0,
			type = "label",
			x = 20,
			width = 177,
			y = 50,
			text = language.get(92009),
			color = ccc3(255, 255, 255)
		})
		var_1_1(arg_1_0.data.background.children, {
			x = 170,
			name = "taskTitleOutBoard",
			y = 50,
			type = "pic",
			pic = "frame:chenghao1.png"
		})
		var_1_1(arg_1_0.data.background.children, {
			x = 670,
			name = "donateSilverIcon",
			y = 50,
			type = "pic",
			pic = "frame:silver.png"
		})
		var_1_1(arg_1_0.data.background.children, {
			fontSize = 18,
			name = "donateCost",
			type = "label",
			anchorPointX = 0,
			width = 177,
			text = "10000",
			y = 50,
			x = 695,
			color = ccc3(255, 255, 255)
		})
		var_1_1(arg_1_0.data.background.children, {
			type = "button",
			buttons = {
				{
					pic2 = "frame:btn_default_lighted.png",
					name = "donateButton",
					pic1 = "frame:btn_default_normal.png",
					y = 50,
					x = 815
				}
			}
		})
		var_1_1(arg_1_0.data.background.children, {
			fontSize = 20,
			name = "donateButtonText",
			type = "label",
			y = 50,
			x = 815,
			text = language.get(94006)
		})
		var_1_1(arg_1_0.data.background.children, {
			fontSize = 14,
			name = "donateDoubleNum",
			text = "",
			type = "label",
			y = 38,
			x = 859
		})
		var_1_1(arg_1_0.data.background.children, {
			x = 788,
			name = "donateTicket",
			y = 50,
			type = "pic",
			pic = "frame:btn_icon_double.png"
		})

		local var_1_7 = {
			"wei",
			"shu",
			"wu"
		}

		for iter_1_5 = 1, 3 do
			var_1_1(arg_1_0.data.background.children, {
				x = 74,
				type = "pic",
				pic = "frame:guojia_di.png",
				y = 250 + 60 * (iter_1_5 - 1),
				children = {
					{
						xcenter = 0,
						stroke = false,
						type = "label",
						ycenter = 0,
						fontSize = 25,
						name = "donateForce_" .. iter_1_5,
						color = colorForce[iter_1_5]
					}
				}
			})
			var_1_1(arg_1_0.data.background.children, {
				anchorPointX = 0,
				type = "pic_9",
				x = 99,
				name = "taskProgress_" .. iter_1_5,
				middleRect = CCRectMake(5, 5, 204, 28),
				preferedSize = CCSizeMake(214, 38),
				pic = "frame:nation_degr_x_" .. var_1_7[iter_1_5] .. ".png",
				y = 250 + 60 * (iter_1_5 - 1)
			})
		end

		local var_1_8 = var_1_1(arg_1_0.data.background.children, {
			xcenter = 0,
			name = "donateRewardBoard",
			z = 101,
			type = "pic",
			ycenter = -150,
			pic = "frame:invest_award_view.jpg",
			children = {}
		})

		var_1_1(var_1_8.children, {
			x = 170,
			name = "taskTitleInBoard",
			y = 84,
			type = "pic",
			pic = "frame:chenghao1.png"
		})
		var_1_1(var_1_8.children, {
			fontSize = 30,
			name = "taskNoReward",
			type = "label",
			y = 84,
			visible = false,
			x = 555,
			text = language.get(95038)
		})

		for iter_1_6 = 1, 4 do
			local var_1_9 = var_1_1(var_1_8.children, {
				y = 84,
				type = "pic",
				visible = false,
				pic = "frame:jianglikuang1.png",
				name = "taskRewardBlock_" .. iter_1_6,
				x = 305 + (iter_1_6 - 1) * 100,
				children = {}
			})

			var_1_1(var_1_9.children, {
				x = 39.5,
				y = 39.5,
				type = "pic",
				name = "taskRewardBlock_icon_" .. iter_1_6,
				pic = iter_1_6 % 2 == 1 and "res/ui/task/get_icon_exp.png" or "res/ui/task/get_icon_iron.png"
			})
			var_1_1(var_1_9.children, {
				fontSize = 18,
				text = "0",
				type = "label",
				y = 19.5,
				x = 39.5,
				name = "taskRewardValue_" .. iter_1_6,
				color = ccc3(255, 255, 255)
			})

			if iter_1_6 > 2 then
				var_1_1(var_1_9.children, {
					x = 20,
					y = 59,
					type = "pic",
					pic = "frame:nation_task_win_icon.png",
					name = "taskCorner_" .. iter_1_6
				})
			end
		end

		var_1_1(var_1_8.children, {
			type = "button",
			buttons = {
				{
					pic2 = "frame:btn2_gre_c.png",
					name = "drawReward",
					pic1 = "frame:btn2_gre_a.png",
					y = 15,
					visible = false,
					x = 460,
					children = {
						{
							fontSize = 20,
							y = 27,
							type = "label",
							x = 62.5,
							text = language.get(95047)
						}
					}
				}
			}
		})
		var_1_1(arg_1_0.data.background.children, {
			anchorPointX = 1,
			name = "info_tips",
			visible = false,
			type = "pic_9",
			z = 101,
			pic = "frame:common_tip_frame_small.png",
			y = 76,
			anchorPointY = 0.5,
			x = 476,
			middleRect = CCRectMake(8, 8, 33, 33),
			preferedSize = CCSizeMake(200, 55)
		})
		var_1_1(arg_1_0.data.background.children, {
			anchorPointX = 1,
			name = "jiangli_tips",
			visible = false,
			type = "pic_9",
			z = 101,
			pic = "frame:common_tip_frame_small.png",
			y = 76,
			anchorPointY = 0.5,
			x = 476,
			middleRect = CCRectMake(8, 8, 33, 33),
			preferedSize = CCSizeMake(200, 55)
		})
	elseif arg_1_1 == taskTabConstant.TYPES.NATION_LANTERN_TASK then
		arg_1_0.data.background = {
			xcenter = 0,
			type = "pic",
			ycenter = -30,
			pic = "res/ui/nationTask/lantern/yxhd_bg1.jpg",
			children = {
				{
					x = 458,
					name = "task_title_p1",
					y = 480,
					type = "pic",
					pic = "res/ui/nationTask/lantern/yxhd_title1.png"
				},
				{
					width = 28,
					height = 33,
					name = "task_title_p2",
					type = "atlas",
					pic = "res/ui/common/number/yxhd_title_digit.png",
					text = "1",
					y = 480,
					startChar = 48,
					x = 458
				},
				{
					x = 458,
					name = "task_title_p3",
					y = 480,
					type = "pic",
					visible = false,
					pic = "res/ui/nationTask/lantern/yxhd_title2.png"
				},
				{
					height = 50,
					name = "bg_invest",
					x = 337,
					type = "layer_color",
					y = 360,
					width = 335,
					color = ccc4(0, 0, 0, 150)
				},
				{
					x = 504,
					name = "bowl",
					y = 230,
					type = "pic",
					pic = "res/ui/nationTask/lantern/yxhd_tyzz1.png"
				},
				{
					x = 500,
					name = "name_bowl",
					y = 73,
					type = "pic",
					visible = false,
					pic = "res/ui/nationTask/lantern/yxhd_ty1.png"
				},
				{
					anchorPointX = 1,
					fontSize = 22,
					type = "label",
					strokeSize = 2,
					y = 28,
					x = 500,
					text = language.get(135326),
					color = ccc3(235, 209, 167),
					strokeColor = ccc3(22, 18, 13)
				},
				{
					name = "totalPct",
					anchorPointX = 0,
					type = "label",
					fontSize = 22,
					strokeSize = 2,
					y = 28,
					x = 500,
					color = ccc3(0, 209, 0),
					strokeColor = ccc3(22, 18, 13)
				},
				{
					x = 793,
					name = "mask_tips",
					y = 386,
					type = "pic",
					pic = "res/default.png"
				},
				{
					fontSize = 20,
					y = 408,
					type = "label",
					left = 680,
					strokeSize = 2,
					text = language.get(95066),
					color = ccc3(235, 209, 167),
					strokeColor = ccc3(22, 18, 13)
				},
				{
					fontSize = 20,
					y = 226,
					type = "label",
					left = 680,
					strokeSize = 2,
					text = language.get(95067),
					color = ccc3(235, 209, 167),
					strokeColor = ccc3(22, 18, 13)
				},
				{
					fontSize = 25,
					name = "nation1stIcon",
					stroke = false,
					type = "label",
					y = 365,
					x = 735
				},
				{
					width = 15,
					height = 24,
					name = "nationPercent1st",
					type = "atlas",
					pic = "res/ui/nationTask/building/jzqj_jz_numb.png",
					text = "0",
					y = 365,
					startChar = 48,
					x = 815
				},
				{
					x = 845,
					y = 365,
					pic = "res/ui/nationTask/building/jzqj_jz_colon.png",
					type = "pic"
				},
				{
					x = 793,
					name = "title",
					y = 185,
					type = "pic",
					pic = "frame:chenghao1.png"
				},
				{
					x = 793,
					name = "taskNoReward",
					y = 110,
					type = "pic",
					visible = false,
					pic = "frame:nationZanwujianli.png"
				},
				{
					type = "button",
					buttons = {
						{
							pic2 = "frame:btn2_gre_c.png",
							name = "drawReward",
							pic1 = "frame:btn2_gre_a.png",
							y = 35,
							visible = false,
							x = 793,
							children = {
								{
									fontSize = 20,
									y = 27,
									type = "label",
									x = 62.5,
									text = language.get(95059)
								}
							}
						}
					}
				},
				rightBg = {
					y = 3,
					name = "rightBg",
					anchorPointX = 0,
					type = "pic",
					pic = "res/ui/nationTask/lantern/yxhd_bg2.jpg",
					visible = false,
					anchorPointY = 0,
					x = 673,
					children = {
						{
							fontSize = 20,
							y = 405,
							type = "label",
							left = 5,
							strokeSize = 2,
							text = language.get(135329),
							color = ccc3(235, 209, 167),
							strokeColor = ccc3(22, 18, 13)
						},
						{
							height = 0,
							width = 240,
							type = "label",
							left = 5,
							y = 370,
							strokeSize = 2,
							text = language.get(135330),
							fontSize = 20 + var_1_0.lanternDescFntSize,
							color = ccc3(235, 209, 167),
							strokeColor = ccc3(22, 18, 13)
						},
						{
							name = "hungerNum",
							anchorPointX = 0,
							type = "label",
							fontSize = 20,
							strokeSize = 2,
							y = 345,
							x = 5,
							color = ccc3(235, 209, 167),
							strokeColor = ccc3(22, 18, 13)
						},
						{
							x = 150,
							y = 345,
							pic = "res/ui/nationTask/lantern/yxhd_jedpb_bg.png",
							type = "pic"
						},
						{
							percentage = 0,
							name = "processHunger",
							x = 150,
							type = "process",
							y = 345,
							pic = "res/ui/nationTask/lantern/yxhd_jedpb.png"
						}
					}
				},
				{
					anchorPointX = 0.5,
					name = "info_tips",
					z = 101,
					type = "pic_9",
					visible = false,
					pic = "frame:common_tip_frame_small.png",
					y = 350,
					anchorPointY = 0.5,
					x = 458,
					middleRect = CCRectMake(24, 24, 1, 1),
					preferedSize = CCSizeMake(200, 80),
					children = {
						{
							fontSize = 22,
							height = 0,
							name = "info_msg",
							anchorPointX = 0,
							type = "label",
							x = 100,
							text = "",
							y = 40,
							anchorPointY = 0,
							width = 180,
							align = kCCTextAlignmentLeft
						}
					}
				}
			}
		}

		for iter_1_7 = 1, 3 do
			var_1_1(arg_1_0.data.background.children, {
				x = 0,
				type = "pic",
				pic = "",
				y = 285 - 140 * (iter_1_7 - 1),
				children = {
					{
						anchorPointX = 0,
						type = "label",
						fontSize = 20,
						strokeSize = 2,
						y = 123,
						x = 10,
						name = "res_name" .. iter_1_7,
						color = ccc3(235, 209, 167),
						strokeColor = ccc3(22, 18, 13)
					},
					{
						x = 50,
						y = 50,
						type = "pic",
						visible = false,
						pic = "res/ui/nationTask/lantern/yxhd_res11.png",
						name = "res_pic" .. iter_1_7
					},
					{
						x = 180,
						y = 20,
						pic = "res/ui/nationTask/lantern/yxhd_pb_bg.png",
						type = "pic"
					},
					{
						percentage = 0,
						x = 180,
						type = "process",
						y = 20,
						visible = false,
						pic = "res/ui/nationTask/lantern/yxhd_pb.png",
						name = "res_process" .. iter_1_7,
						children = {
							{
								fontSize = 20,
								y = 12,
								type = "label",
								x = 92,
								name = "res_pct" .. iter_1_7,
								color = ccc3(235, 209, 0),
								strokeColor = ccc3(22, 18, 13)
							},
							{
								x = 92,
								y = 30,
								type = "pic",
								visible = false,
								pic = "res/ui/nationTask/lantern/yxhd_ah_small.png",
								name = "arrow" .. iter_1_7
							},
							{
								type = "button",
								buttons = {
									{
										pic2 = "res/ui/nationTask/lantern/yxhd_ah_h.png",
										pic1 = "res/ui/nationTask/lantern/yxhd_ah.png",
										y = 11.5,
										visible = false,
										x = 213,
										name = "btn_invest" .. iter_1_7
									}
								}
							}
						}
					},
					{
						x = 180,
						y = 20,
						type = "pic",
						visible = false,
						pic = "res/ui/nationTask/lantern/yxhd_pb2.png",
						name = "res_full" .. iter_1_7,
						children = {
							{
								x = 213,
								y = 16,
								pic = "res/ui/nationTask/building/jzqj_yszy_full.png",
								type = "pic"
							}
						}
					},
					{
						x = 180,
						y = 80,
						pic = "res/ui/nationTask/lantern/yxhd_mache.png",
						type = "pic"
					}
				}
			})
		end

		for iter_1_8 = 1, 2 do
			local var_1_10 = var_1_1(arg_1_0.data.background.children, {
				y = 290,
				type = "pic",
				visible = false,
				pic = "frame:jianglikuang1.png",
				name = iter_1_8 % 2 == 1 and "taskKuangWinExp" or "taskKuangWinIron",
				x = 743 + (iter_1_8 - 1) * 100,
				children = {
					{
						x = 39.5,
						y = 39.5,
						type = "pic",
						pic = iter_1_8 % 2 == 1 and "res/ui/task/get_icon_exp.png" or "res/ui/task/get_icon_iron.png"
					},
					{
						fontSize = 18,
						text = "0",
						type = "label",
						y = 19.5,
						x = 39.5,
						name = iter_1_8 % 2 == 1 and "taskWinExp" or "taskWinIron",
						color = ccc3(255, 255, 255)
					}
				}
			})
		end

		for iter_1_9 = 1, 2 do
			local var_1_11 = var_1_1(arg_1_0.data.background.children, {
				y = 110,
				type = "pic",
				visible = false,
				pic = "frame:jianglikuang1.png",
				name = iter_1_9 % 2 == 1 and "taskKuangExp" or "taskKuangIron",
				x = 743 + (iter_1_9 - 1) * 100,
				children = {}
			})

			var_1_1(var_1_11.children, {
				x = 39.5,
				y = 39.5,
				type = "pic",
				name = iter_1_9 % 2 == 1 and "privateImageExp" or "privateImageIron",
				pic = iter_1_9 % 2 == 1 and "res/ui/task/get_icon_exp.png" or "res/ui/task/get_icon_iron.png"
			})
			var_1_1(var_1_11.children, {
				fontSize = 18,
				text = "0",
				type = "label",
				y = 19.5,
				x = 39.5,
				name = iter_1_9 % 2 == 1 and "taskExp" or "taskIron",
				color = ccc3(255, 255, 255)
			})
		end

		var_1_1(arg_1_0.data.background.children, {
			x = 793,
			name = "isFinished",
			y = 290,
			type = "pic",
			visible = false,
			pic = "frame:tuzhang_yiwancheng.png"
		})
		var_1_1(arg_1_0.data.background.children, {
			x = 793,
			name = "isRewarded",
			y = 110,
			type = "pic",
			visible = false,
			pic = "frame:nation_task_draw.png"
		})

		local var_1_12 = {
			colorQuality[2],
			colorQuality[3],
			colorQuality[4],
			colorQuality[5],
			colorQuality[6]
		}
		local var_1_13 = {
			135301,
			135302,
			135303,
			135304,
			135305
		}

		for iter_1_10 = 1, 5 do
			local var_1_14 = {}

			for iter_1_11 = 1, 3 do
				var_1_14[iter_1_11] = language.get(taskTabConstant.LANTERN_RES[iter_1_10][iter_1_11])
			end

			var_1_1(arg_1_0.data.background.children.rightBg.children, {
				anchorPointX = 0,
				x = 5,
				type = "pic",
				anchorPointY = 0,
				pic = "res/ui/nationTask/lantern/yxhd_small_bg.png",
				y = (5 - iter_1_10) * 66,
				children = {
					{
						fontSize = 20,
						y = 50,
						type = "label",
						left = 10,
						strokeSize = 2,
						text = language.get(var_1_13[iter_1_10]),
						color = var_1_12[iter_1_10],
						strokeColor = ccc3(22, 18, 13)
					},
					(function()
						if conf.language == "vie" then
							return {
								fontSize = 20,
								text = "",
								y = 20,
								type = "label",
								left = 10,
								strokeSize = 2,
								color = ccc3(235, 209, 167),
								strokeColor = ccc3(22, 18, 13)
							}
						elseif conf.language == "kr" then
							return {
								fontSize = 16,
								y = 20,
								type = "label",
								left = 10,
								strokeSize = 2,
								text = language.get(135313, var_1_14[1], var_1_14[2], var_1_14[3]),
								color = ccc3(235, 209, 167),
								strokeColor = ccc3(22, 18, 13)
							}
						else
							return {
								fontSize = 20,
								y = 20,
								type = "label",
								left = 10,
								strokeSize = 2,
								text = language.get(135313, var_1_14[1], var_1_14[2], var_1_14[3]),
								color = ccc3(235, 209, 167),
								strokeColor = ccc3(22, 18, 13)
							}
						end
					end)(),
					{
						height = 69,
						x = 0,
						type = "layer_color",
						y = 0,
						width = 231,
						name = "small_mask" .. iter_1_10,
						color = ccc4(0, 0, 0, 150)
					}
				}
			})
		end
	end

	local var_1_15 = var_1_1(arg_1_0.data.background.children, {
		xcenter = 0,
		name = "taskNext",
		visible = false,
		type = "pic",
		ycenter = 0,
		z = 100,
		pic = "frame:nation_fabudi.png",
		children = {}
	})

	var_1_1(var_1_15.children, {
		width = 29,
		height = 49,
		name = "taskNextHour",
		type = "atlas",
		pic = "res/ui/common/number/jtj_general_num.png",
		text = "10",
		y = 120,
		startChar = 48,
		x = 120
	})
	var_1_1(var_1_15.children, {
		x = 163.5,
		y = 120,
		pic = "frame:nation_maohao.png",
		type = "pic"
	})
	var_1_1(var_1_15.children, {
		text = "00",
		height = 49,
		width = 29,
		type = "atlas",
		startChar = 48,
		x = 207,
		pic = "res/ui/common/number/jtj_general_num.png",
		y = 120
	})
	var_1_1(var_1_15.children, {
		x = 511.5,
		y = 120,
		pic = "frame:nation_next.png",
		type = "pic"
	})
end

function var_0_0.getData(arg_4_0)
	return arg_4_0.data or {}
end

function var_0_0.getNewNationTaskData(arg_5_0)
	local function var_5_0(arg_6_0, arg_6_1)
		arg_6_0[#arg_6_0 + 1] = arg_6_1

		return arg_6_1
	end

	local var_5_1 = {
		background = {
			y = 0,
			x = 0,
			type = "pic",
			pic = "res/default.png",
			children = {}
		}
	}

	for iter_5_0 = 1, 2 do
		local var_5_2 = 60 + 750 * (iter_5_0 - 1)

		var_5_0(var_5_1.background.children, {
			y = 330,
			type = "pic",
			pic = "res/ui/nationTask/newPic/rwyh_icon01.png",
			name = "target_" .. iter_5_0,
			x = var_5_2,
			children = {
				{
					xcenter = 300,
					type = "pic",
					ycenter = -4,
					pic = "res/ui/nationTask/newPic/rwyh_small_bg.png",
					children = {
						{
							xcenter = -150,
							fontSize = 22,
							type = "label",
							ycenter = 2,
							width = 220,
							name = "taskAttType_" .. iter_5_0,
							text = language.get(92016, "--"),
							color = ccc3(204, 185, 134),
							align = kCCTextAlignmentLeft
						},
						{
							fontSize = 24,
							text = "--",
							type = "label",
							xcenter = -20,
							ycenter = 2,
							name = "taskCityTarget_" .. iter_5_0,
							color = ccc3(0, 255, 0)
						},
						{
							type = "button",
							buttons = {
								{
									pic2 = "res/default.png",
									pic1 = "res/default.png",
									y = 34,
									scale = 24,
									x = 270,
									name = "cityLink_" .. iter_5_0
								}
							}
						},
						{
							fontSize = 22,
							type = "label",
							xcenter = 90,
							ycenter = 2,
							visible = false,
							name = "specialCity_" .. iter_5_0,
							text = language.get(113029),
							color = ccc3(0, 255, 0)
						},
						{
							xcenter = 30,
							visible = false,
							type = "pic",
							ycenter = 2,
							pic = "frame:tuzhang_yiwancheng.png",
							name = "taskStateFrame_" .. iter_5_0
						}
					}
				}
			}
		})
		var_5_0(var_5_1.background.children, {
			y = 260,
			type = "pic",
			pic = "res/ui/nationTask/newPic/rwyh_icon02.png",
			name = "chenghao_" .. iter_5_0,
			x = var_5_2,
			children = {
				{
					xcenter = 300,
					type = "pic",
					ycenter = -4,
					pic = "res/ui/nationTask/newPic/rwyh_small_bg.png",
					children = {
						{
							xcenter = -155,
							fontSize = 22,
							type = "label",
							ycenter = 2,
							width = 220,
							name = "taskRankNum_" .. iter_5_0,
							text = language.get(92017, 0),
							color = ccc3(204, 185, 134),
							align = kCCTextAlignmentLeft
						},
						{
							xcenter = -20,
							type = "pic",
							ycenter = 2,
							pic = "frame:chenghao1.png",
							name = "taskTitle_" .. iter_5_0
						}
					}
				}
			}
		})

		local var_5_3 = var_5_0(var_5_1.background.children, {
			y = 190,
			type = "pic",
			pic = "res/ui/nationTask/newPic/rwyh_icon03.png",
			name = "jiangli_" .. iter_5_0,
			x = var_5_2,
			children = {
				{
					xcenter = 300,
					z = 10,
					type = "pic",
					ycenter = -65,
					pic = "res/ui/nationTask/newPic/rwyh_jl_bg.png",
					children = {
						{
							fontSize = 22,
							xcenter = -155,
							type = "label",
							width = 220,
							ycenter = 63,
							text = language.get(92011),
							color = ccc3(204, 185, 134),
							align = kCCTextAlignmentLeft
						},
						{
							xcenter = -55,
							visible = false,
							type = "pic",
							ycenter = -5,
							pic = "frame:nationZanwujianli.png",
							name = "taskNoReward_" .. iter_5_0
						},
						{
							type = "button",
							buttons = {
								{
									pic2 = "frame:btn2_gre_c.png",
									pic1 = "frame:btn2_gre_a.png",
									y = -10,
									visible = false,
									x = 400,
									name = "drawReward_" .. iter_5_0,
									children = {
										{
											fontSize = 20,
											y = 27,
											type = "label",
											x = 62.5,
											text = language.get(95047)
										}
									}
								}
							}
						}
					}
				}
			}
		})

		for iter_5_1 = 1, 6 do
			local var_5_4 = var_5_0(var_5_3.children, {
				visible = false,
				type = "pic",
				ycenter = -75,
				pic = "frame:jianglikuang1.png",
				name = "taskRewardBlock_" .. iter_5_0 .. "_" .. iter_5_1,
				xcenter = 55 + (iter_5_1 - 1) * 90,
				children = {}
			})

			var_5_0(var_5_4.children, {
				x = 39.5,
				y = 39.5,
				type = "pic",
				pic = "res/ui/task/get_icon_exp.png",
				name = "gerenjiangli_" .. iter_5_0 .. "_" .. iter_5_1
			})
			var_5_0(var_5_4.children, {
				fontSize = 18,
				text = "0",
				type = "label",
				y = 19.5,
				x = 39.5,
				name = "taskRewardValue_" .. iter_5_0 .. "_" .. iter_5_1,
				color = ccc3(255, 255, 255)
			})

			if iter_5_1 > 3 then
				var_5_0(var_5_4.children, {
					x = 23,
					y = 56,
					type = "pic",
					pic = "frame:nation_task_win_icon.png",
					name = "taskCorner_" .. iter_5_0 .. "_" .. iter_5_1
				})
			end
		end

		var_5_0(var_5_3.children, {
			xcenter = 330,
			visible = false,
			type = "pic",
			ycenter = -55,
			pic = "frame:nation_task_draw.png",
			name = "taskIsRewarded_" .. iter_5_0
		})
	end

	return var_5_1
end

return var_0_0
