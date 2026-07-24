local var_0_0 = {}
local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.state1FntSize = -4
	var_0_1.state2FntSize = -6
	var_0_1.tryFntSize = -6
else
	var_0_1.state1FntSize = 0
	var_0_1.state2FntSize = 0
	var_0_1.tryFntSize = 0
end

local var_0_2 = tool.hexToRgb("#D9EDC5")
local var_0_3 = ccc3(0, 180, 0)
local var_0_4 = colorQuality[5]
local var_0_5 = colorQuality[4]
local var_0_6 = colorQuality[2]
local var_0_7 = colorQuality[6]

local function var_0_8(arg_1_0)
	local var_1_0 = 0

	if arg_1_0.investCopper and arg_1_0.needCopper then
		var_1_0 = math.floor(100 * arg_1_0.investCopper / arg_1_0.needCopper)
	end

	local var_1_1 = {
		xcenter = 0,
		name = "notBuiltPanel",
		z = 300,
		type = "pic",
		ycenter = 0,
		pic = "res/ui/general/jailView/laofang_jianzao_view.jpg",
		children = {
			{
				top = 25,
				x = 48,
				pic = "res/ui/general/jailView/laofang_tit_jzlf.png",
				type = "pic"
			},
			{
				xcenter = 0,
				name = "light",
				z = 100,
				type = "pic",
				ycenter = 45,
				visible = false,
				pic = "res/ui/general/jailView/laofang_build_lig.png"
			},
			{
				xcenter = 0,
				z = 100,
				type = "pic",
				ycenter = 45,
				pic = "res/ui/general/jailView/laofang_build.png"
			},
			{
				xcenter = 0,
				z = 0,
				type = "button",
				ycenter = 45,
				buttons = {
					{
						pic2 = "res/ui/general/jailView/laofang_build_lig.png",
						name = "btn_building",
						pic1 = "res/ui/general/jailView/laofang_build.png",
						enable = false,
						callBack = jailUI.handleBuildJailButtonTap
					}
				}
			},
			{
				xcenter = 0,
				name = "pic_djjr",
				y = 145,
				type = "pic",
				visible = false,
				pic = "res/ui/general/jailView/laofang_tit_djjr.png"
			},
			{
				xcenter = 0,
				y = 95,
				pic = "res/ui/general/jailView/comm_list_laofang_3.png",
				type = "pic"
			},
			{
				x = 461,
				y = 37,
				pic = "res/ui/rankInfo/twoRankInfo/rank_progress_bar_bg.jpg",
				type = "pic"
			},
			{
				name = "amountProgressBar",
				x = 461,
				type = "process",
				y = 37,
				pic = "res/ui/general/jailView/laofang_load_con.png",
				percentage = var_1_0
			},
			{
				name = "amountValueLabel",
				fontSize = 50,
				type = "label",
				strokeSize = 2,
				y = 39,
				x = 461,
				text = var_1_0 .. "%",
				color = ccc3(235, 209, 167),
				strokeColor = ccc3(22, 18, 13)
			}
		}
	}

	if arg_1_0.buildLv and user.player.playerLv < arg_1_0.buildLv then
		local var_1_2 = {
			fontSize = 22,
			y = 120,
			type = "label",
			x = 800,
			strokeSize = 2,
			text = language.get(85063, tostring(arg_1_0.buildLv)),
			color = ccc3(235, 209, 167),
			strokeColor = ccc3(22, 18, 13)
		}

		table.insert(var_1_1.children, var_1_2)
	elseif arg_1_0.havePic ~= 1 then
		if arg_1_0.finished ~= 1 then
			local var_1_3 = {
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/general/jailView/laofang_btn_ljjc_c.png",
						pic1 = "res/ui/general/jailView/laofang_btn_ljjc_a.png",
						y = 260,
						x = 800,
						enable = true,
						callBack = jailUI.handleBuildBtnTap_LJ
					},
					{
						pic2 = "res/ui/general/jailView/laofang_btn_ksjz_c.png",
						pic1 = "res/ui/general/jailView/laofang_btn_ksjz_a.png",
						y = 190,
						x = 800,
						enable = true,
						callBack = jailUI.handleBuildBtnTap_KS
					},
					{
						pic2 = "res/ui/general/jailView/laofang_btn_ptjz_c.png",
						pic1 = "res/ui/general/jailView/laofang_btn_ptjz_a.png",
						y = 120,
						x = 800,
						enable = true,
						callBack = jailUI.handleBuildBtnTap_PT
					}
				}
			}
			local var_1_4 = {
				fontSize = 24,
				y = 170,
				type = "label",
				x = 740,
				strokeSize = 2,
				text = language.get(75021, math.floor(arg_1_0.keyNum / 10000)),
				color = ccc3(235, 209, 167),
				strokeColor = ccc3(22, 18, 13)
			}
			local var_1_5 = {
				fontSize = 24,
				y = 100,
				type = "label",
				x = 740,
				strokeSize = 2,
				text = language.get(75021, math.floor(arg_1_0.singleNum / 10000)),
				color = ccc3(235, 209, 167),
				strokeColor = ccc3(22, 18, 13)
			}

			table.insert(var_1_1.children, var_1_3)
			table.insert(var_1_1.children, var_1_4)
			table.insert(var_1_1.children, var_1_5)
		end
	else
		local var_1_6 = {
			type = "button",
			buttons = {
				{
					pic2 = "res/ui/general/jailView/laofang_btn_tzjz_c.png",
					name = "btn_build_TZ",
					pic1 = "res/ui/general/jailView/laofang_btn_tzjz_a.png",
					y = 120,
					x = 800,
					enable = true,
					callBack = jailUI.handleBuildBtnTap_TZ
				}
			}
		}

		table.insert(var_1_1.children, var_1_6)
	end

	return var_1_1
end

local function var_0_9(arg_2_0)
	local var_2_0 = {
		height = 547,
		name = "haveBuiltPanel",
		x = 0,
		type = "layer_color",
		y = 0,
		width = 927,
		color = ccc4(0, 0, 0, 0),
		children = {
			{
				xcenter = 0,
				y = 500,
				type = "pic",
				pic = "res/ui/general/jailView/jail_grade_" .. arg_2_0.prisonLv .. ".png"
			},
			{
				xcenter = 0,
				y = 485,
				pic = "res/ui/general/jailView/comm_list_laofang_3.png",
				type = "pic"
			}
		}
	}

	if arg_2_0.canUpdate and arg_2_0.canUpdate == true then
		local var_2_1 = {
			y = 500,
			name = "buildButton",
			type = "button",
			x = 730,
			buttons = {
				{
					pic2 = "frame:btn3_yel_c.png",
					pic1 = "frame:btn3_yel_a.png",
					callBack = arg_2_0.havePic == 1 and jailUI.handleJailUpgradeButtonTap or jailUI.handlePurchasePicButtonTap
				}
			}
		}
		local var_2_2 = {
			fontSize = 20,
			y = 500,
			type = "label",
			x = 730,
			text = arg_2_0.havePic == 1 and language.get(85011) or language.get(85012)
		}

		table.insert(var_2_0.children, var_2_1)
		table.insert(var_2_0.children, var_2_2)
	end

	local var_2_3 = arg_2_0.tryLashLv and arg_2_0.tryLashLv > 0
	local var_2_4 = false

	if #arg_2_0.slaves > 0 then
		local var_2_5 = arg_2_0.slaves[1]
		local var_2_6 = arg_2_0.forceWorks[var_2_5.pos]

		if var_2_5.pos <= arg_2_0.lashLv then
			if var_2_6.status == 2 then
				var_2_4 = true
			end
		elseif var_2_3 and var_2_5.pos <= arg_2_0.tryLashLv then
			if var_2_6.status == 2 then
				var_2_4 = true
			end
		else
			var_2_4 = true
		end
	end

	if var_2_4 then
		local var_2_7 = arg_2_0.slaves[1]
		local var_2_8 = language.get(var_2_7.officerId == 1 and 200406 or 200407)
		local var_2_9 = jailConstant.forceIdToName[var_2_7.forceId] .. var_2_8 .. " " .. var_2_7.name .. " " .. language.get(220651)
		local var_2_10 = {
			x = 463.5,
			name = "lash_bg",
			y = 205,
			type = "pic",
			pic = "res/ui/general/jailView/new/lf_bc_bg.jpg",
			children = {
				{
					xcenter = 0,
					name = "player",
					y = 193,
					type = "pic",
					pic = "res/ui/general/jailView/new/lf_qf1.png"
				},
				{
					xcenter = 0,
					y = 60,
					pic = "res/ui/general/jailView/new/lf_name_bg.png",
					type = "pic"
				},
				{
					font = "Thonburi-Bold",
					fontSize = 25,
					type = "label",
					y = 63,
					xcenter = 0,
					text = var_2_7.name,
					color = var_0_5
				},
				{
					x = 170,
					name = "node_arrow",
					y = 250,
					type = "pic",
					pic = "",
					children = {
						{
							y = 0,
							x = 0,
							scale = 0.9,
							type = "pic",
							pic = "res/ui/general/jailView/new/lf_arrowhead.png"
						},
						{
							fontSize = 23,
							height = 0,
							width = 220,
							type = "label",
							font = "Thonburi-Bold",
							y = 0,
							x = -30,
							text = var_2_9,
							align = kCCTextAlignmentLeft,
							color = var_0_2
						}
					}
				},
				{
					xcenter = 0,
					ycenter = 45,
					type = "button",
					buttons = {
						{
							pic2 = "res/default.png",
							name = "btn_lash",
							pic1 = "res/default.png",
							callBack = jailUI.handleLashButtonTap
						}
					}
				}
			}
		}

		table.insert(var_2_0.children, var_2_10)
	else
		local var_2_11 = 0
		local var_2_12 = 200
		local var_2_13 = 5

		for iter_2_0 = 1, 5 do
			local var_2_14 = 100.5 + (iter_2_0 - 1) * 181.5
			local var_2_15 = arg_2_0.plainWorks[iter_2_0]
			local var_2_16 = arg_2_0.forceWorks[iter_2_0]
			local var_2_17

			if iter_2_0 <= arg_2_0.prisonLv then
				local var_2_18
				local var_2_19

				if var_2_15.status == 0 then
					var_2_18 = language.get(220629, var_2_15.num - arg_2_0.num)
					var_2_19 = var_0_4
				elseif var_2_15.status == 1 then
					var_2_18 = language.get(220638)
					var_2_19 = var_0_5
				elseif var_2_15.status == 2 then
					var_2_18 = language.get(220637)
					var_2_19 = var_0_4
				end

				var_2_17 = {
					type = "pic",
					anchorPointY = 0,
					pic = "res/ui/general/jailView/new/lf_job_bg.png",
					name = "work" .. iter_2_0,
					x = var_2_14,
					y = var_2_12,
					children = {
						{
							xcenter = 0,
							z = -1,
							type = "pic",
							y = 124,
							pic = "res/ui/general/jailView/new/plain_work" .. iter_2_0 .. ".png",
							isGray = var_2_15.status ~= 1
						},
						{
							x = 44,
							y = 32,
							pic = "res/ui/general/jailView/new/lf_word_exp.png",
							type = "pic"
						},
						{
							font = "Thonburi-Bold",
							stroke = false,
							type = "label",
							y = 32,
							fontSize = 20,
							x = 122.5,
							text = var_2_15.exp
						},
						{
							xcenter = 0,
							y = 55,
							type = "pic",
							anchorPointY = 0,
							pic = "res/ui/common/text/warlock/warlock_state_bg.png"
						},
						{
							height = 0,
							stroke = false,
							type = "label",
							xcenter = 0,
							font = "Thonburi-Bold",
							y = 75,
							width = 100,
							fontSize = 20 + var_0_1.state1FntSize,
							text = var_2_18,
							color = var_2_19
						},
						{
							font = "Thonburi-Bold",
							stroke = false,
							type = "label",
							top = 15,
							xcenter = 0,
							fontSize = 20,
							text = language.get(jailConstant.workTxtId[iter_2_0]),
							color = var_2_15.status == 1 and var_0_5 or nil
						}
					}
				}
			else
				var_2_17 = {
					type = "pic",
					anchorPointY = 0,
					pic = "res/ui/general/jailView/new/lf_job_lock.png",
					name = "work" .. iter_2_0,
					x = var_2_14,
					y = var_2_12,
					children = {
						{
							x = 31.5,
							y = 32,
							type = "pic",
							pic = "res/ui/general/jailView/new/lf_word_jlfkq0" .. iter_2_0 .. ".png"
						},
						{
							x = 105.5,
							y = 32,
							pic = "res/ui/general/jailView/new/lf_word_jlfkq.png",
							type = "pic"
						},
						{
							font = "Thonburi-Bold",
							stroke = false,
							type = "label",
							top = 15,
							xcenter = 0,
							fontSize = 20,
							text = language.get(jailConstant.workTxtId[iter_2_0])
						}
					}
				}
			end

			local var_2_20 = false

			if var_2_16.status == 1 then
				if iter_2_0 <= arg_2_0.lashLv then
					var_2_20 = true
				elseif iter_2_0 <= arg_2_0.tryLashLv then
					var_2_20 = true
				end
			end

			local var_2_21 = {
				type = "pic",
				anchorPointY = 0,
				pic = "res/ui/general/jailView/new/lf_job_bg2.png",
				name = "work" .. 5 + iter_2_0,
				x = var_2_14,
				y = var_2_13,
				children = {
					{
						xcenter = 0,
						z = -1,
						type = "pic",
						y = 124,
						pic = "res/ui/general/jailView/new/force_work" .. iter_2_0 .. ".png",
						isGray = not var_2_20
					},
					{
						font = "Thonburi-Bold",
						stroke = false,
						type = "label",
						top = 15,
						xcenter = 0,
						fontSize = 20,
						text = language.get(jailConstant.workTxtId[5 + iter_2_0]),
						color = var_2_20 and var_0_7 or nil
					}
				}
			}

			if iter_2_0 <= arg_2_0.lashLv then
				local var_2_22
				local var_2_23

				if var_2_16.status == 0 then
					var_2_22 = language.get(220629, var_2_16.num - arg_2_0.num)
					var_2_23 = var_0_4
				elseif var_2_16.status == 1 then
					var_2_22 = language.get(220638)
					var_2_23 = var_0_5
				elseif var_2_16.status == 2 then
					var_2_22 = language.get(220637)
					var_2_23 = var_0_4
				end

				local var_2_24 = {
					y = 0,
					x = 0,
					type = "pic",
					pic = "",
					children = {
						{
							x = 92.5,
							y = 55,
							type = "pic",
							anchorPointY = 0,
							pic = "res/ui/common/text/warlock/warlock_state_bg.png"
						},
						{
							height = 0,
							stroke = false,
							type = "label",
							width = 100,
							font = "Thonburi-Bold",
							y = 75,
							x = 92.5,
							fontSize = 20 + var_0_1.state1FntSize,
							text = var_2_22,
							color = var_2_23
						},
						{
							x = 44,
							y = 32,
							pic = "res/ui/general/jailView/new/lf_word_exp.png",
							type = "pic"
						},
						{
							font = "Thonburi-Bold",
							stroke = false,
							type = "label",
							y = 32,
							fontSize = 20,
							x = 119.5,
							text = var_2_16.exp
						}
					}
				}

				table.insert(var_2_21.children, var_2_24)
			elseif var_2_3 and iter_2_0 <= arg_2_0.tryLashLv then
				local var_2_25 = {
					x = 0,
					y = 0,
					type = "pic",
					pic = "",
					name = "node_normal" .. iter_2_0,
					children = {
						{
							y = 66,
							x = 92.5,
							scale = 0.83,
							type = "pic",
							pic = "res/ui/general/jailView/new/general_exp_view_bg.jpg",
							children = {
								{
									x = 94,
									y = 12,
									type = "process",
									pic = "res/ui/general/jailView/new/general_exp_view_con.png",
									percentage = 100 * var_2_16.fenzi / var_2_16.femmu
								}
							}
						},
						{
							fontSize = 20,
							stroke = false,
							type = "label",
							y = 66,
							x = 92.5,
							text = var_2_16.fenzi .. "/" .. var_2_16.femmu
						},
						{
							x = 92.5,
							y = 73,
							type = "pic",
							anchorPointY = 0,
							pic = "res/ui/common/text/warlock/warlock_state_bg.png"
						}
					}
				}

				table.insert(var_2_21.children, var_2_25)

				local var_2_26
				local var_2_27

				if var_2_16.status == 2 then
					var_2_26 = language.get(220637)
					var_2_27 = var_0_4
				else
					var_2_26 = language.get(85068)
					var_2_27 = var_0_3
				end

				local var_2_28 = {
					x = 0,
					y = 0,
					type = "pic",
					pic = "",
					name = "node_normal" .. iter_2_0,
					children = {
						{
							font = "Thonburi-Bold",
							stroke = false,
							type = "label",
							y = 93,
							x = 92.5,
							fontSize = 20,
							text = var_2_26,
							color = var_2_27
						},
						{
							x = 44,
							y = 28,
							pic = "res/ui/general/jailView/icon_clock.png",
							type = "pic"
						},
						{
							fontSize = 20,
							font = "Thonburi-Bold",
							stroke = false,
							type = "label",
							text = "99:99:99",
							y = 32,
							x = 119.5,
							name = "timer" .. iter_2_0
						}
					}
				}

				if var_2_16.status == 1 then
					var_2_26 = language.get(220638)
					var_2_27 = var_0_5
				else
					var_2_26 = language.get(220636)
					var_2_27 = var_0_4
				end

				local var_2_29 = {
					x = 0,
					y = 0,
					type = "pic",
					visible = false,
					pic = "",
					name = "node_touched" .. iter_2_0,
					children = {
						{
							font = "Thonburi-Bold",
							stroke = false,
							type = "label",
							y = 93,
							x = 92.5,
							fontSize = 20,
							text = var_2_26,
							color = var_2_27
						},
						{
							x = 44,
							y = 32,
							pic = "res/ui/general/jailView/new/lf_word_exp.png",
							type = "pic"
						},
						{
							font = "Thonburi-Bold",
							stroke = false,
							type = "label",
							y = 32,
							fontSize = 20,
							x = 119.5,
							text = var_2_16.exp
						}
					}
				}

				table.insert(var_2_25.children, var_2_28)
				table.insert(var_2_25.children, var_2_29)
			else
				local var_2_30 = iter_2_0 == 1 + arg_2_0.lashLv and arg_2_0.freeTryLashTimes == 1
				local var_2_31 = ""

				if var_2_30 then
					var_2_31 = language.get(220621, var_2_16.upGold)
				elseif var_2_16.tryGold > 0 then
					var_2_31 = language.get(220630, var_2_16.tryGold, var_2_16.upGold)
				elseif var_2_16.tryCopper > 0 then
					var_2_31 = language.get(220635, var_2_16.tryCopper, var_2_16.upGold)
				end

				local var_2_32 = {
					y = 0,
					x = 0,
					type = "pic",
					pic = "",
					children = {
						{
							x = 92.5,
							y = 55,
							type = "pic_9",
							anchorPointY = 0,
							pic = "res/ui/common/text/warlock/warlock_state_bg.png",
							middleRect = CCRectMake(0, 20, 157, 4),
							preferedSize = CCSizeMake(157, 60)
						},
						{
							stroke = false,
							type = "label",
							font = "Thonburi-Bold",
							y = 84,
							x = 92.5,
							fontSize = 20 + var_0_1.state2FntSize,
							text = var_2_31,
							color = var_0_5,
							align = kCCTextAlignmentLeft
						},
						{
							type = "button",
							buttons = {
								{
									pic2 = "frame:btn1_yel_c.png",
									pic1 = "frame:btn1_yel_a.png",
									y = 32,
									pic3 = "frame:btn1_yel_a.png",
									x = 52.5,
									name = "btnL" .. iter_2_0,
									callBack = function()
										log.info("btnL" .. iter_2_0)
										jailUI.handlerTrailButtonTap(iter_2_0, var_2_30, var_2_16.tryGold)
									end
								},
								{
									pic2 = "frame:btn1_gre_c.png",
									pic1 = "frame:btn1_gre_a.png",
									y = 32,
									pic3 = "frame:btn1_gre_a.png",
									x = 132.5,
									name = "btnR" .. iter_2_0,
									callBack = function()
										log.info("btnR" .. iter_2_0)
										jailUI.handleLashUpgradeButtonTap(iter_2_0, var_2_16.upGold)
									end
								}
							}
						},
						{
							stroke = false,
							type = "label",
							y = 32,
							x = 52.5,
							fontSize = 20 + var_0_1.tryFntSize,
							text = language.get(var_2_30 and 85060 or 220627)
						},
						{
							fontSize = 20,
							stroke = false,
							type = "label",
							y = 32,
							x = 132.5,
							text = language.get(220628)
						}
					}
				}

				table.insert(var_2_21.children, var_2_32)
			end

			table.insert(var_2_0.children, var_2_17)
			table.insert(var_2_0.children, var_2_21)
		end
	end

	return var_2_0
end

local function var_0_10(arg_5_0)
	if arg_5_0.type == 2 then
		return var_0_8(arg_5_0)
	else
		return var_0_9(arg_5_0)
	end
end

function getJailUiData(arg_6_0)
	var_0_0.jailBackground = {
		anchorPointX = 0,
		name = "jailViewBackground",
		type = "pic_9",
		pic = "res/ui/general/jailView/comm_view_2.png",
		y = 17,
		anchorPointY = 0,
		x = 16,
		middleRect = CCRectMake(51, 51, 1, 1),
		preferedSize = CCSizeMake(927, 547),
		children = {
			var_0_10(arg_6_0)
		}
	}

	return var_0_0
end
