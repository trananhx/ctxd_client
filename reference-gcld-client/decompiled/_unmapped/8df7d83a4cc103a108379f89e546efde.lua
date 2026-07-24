require("lua/layer/world/cityWindow/control")

local var_0_0 = cityWindowControl

function getCityWindowUiData()
	local var_1_0 = smgr.getLayer("worldCamera")
	local var_1_1 = {}
	local var_1_2 = {}
	local var_1_3 = var_1_0.cityTable["world_building_" .. cityWindowControl.cityId]
	local var_1_4 = var_1_0.cityTable["world_building_" .. cityWindowControl.cityId].prop
	local var_1_5 = var_1_0.cityTable["world_building_" .. cityWindowControl.cityId].info
	local var_1_6
	local var_1_7
	local var_1_8
	local var_1_9 = tonumber(var_1_4[2])

	if var_1_9 == 0 then
		var_1_7 = language.get(200304)
		var_1_8 = ccc3(255, 255, 255)
	elseif var_1_9 == 1 then
		var_1_7 = language.get(200305)
		var_1_8 = ccc3(0, 0, 255)
		var_1_6 = "frame:cityWindowWei.png"
	elseif var_1_9 == 2 then
		var_1_7 = language.get(200306)
		var_1_8 = ccc3(255, 0, 0)
		var_1_6 = "frame:cityWindowShu.png"
	elseif var_1_9 == 3 then
		var_1_7 = language.get(200307)
		var_1_8 = ccc3(0, 255, 0)
		var_1_6 = "frame:cityWindowWu.png"
	elseif var_1_9 > 100 then
		var_1_7 = language.get(200308)
		var_1_8 = ccc3(255, 0, 255)
		var_1_6 = "frame:cityWindowMan.png"
	end

	local var_1_10
	local var_1_11

	if tonumber(var_1_4[3]) == 1 then
		var_1_11 = language.get(200309)
		var_1_10 = "(" .. tostring(cityWindowControl.defSide[1].num) .. ")"
	else
		var_1_11 = language.get(200310)
		var_1_10 = language.get(200311)
	end

	if var_1_6 ~= nil then
		var_1_2.nationBg = {
			x = 48,
			y = 279,
			pic = "frame:cityWindowNationBg.png",
			type = "pic"
		}
		var_1_2.nationBg.children = {
			{
				x = 20.5,
				name = "nactionIcon",
				y = 20.5,
				type = "pic",
				pic = var_1_6
			}
		}
	end

	var_1_2.cityNameLabel = {
		fontSize = 22,
		y = 279,
		type = "label",
		width = 96,
		x = 117,
		text = var_1_5.name,
		align = kCCTextAlignmentLeft
	}
	var_1_2.citySprite = {
		x = 137,
		y = 204,
		type = "pic",
		pic = "frame:" .. var_1_5.model
	}
	var_1_2.cityStateLabel = {
		fontSize = 22,
		x = 111,
		type = "label",
		y = 114,
		width = 192,
		text = var_1_11,
		align = kCCTextAlignmentLeft
	}
	var_1_2.cityDefLabel = {
		fontSize = 22,
		x = 111,
		type = "label",
		y = 88,
		width = 192,
		text = language.get(200312),
		align = kCCTextAlignmentLeft
	}
	var_1_2.cityDefLabel.children = {
		{
			fontSize = 22,
			y = 0,
			type = "label",
			x = -22,
			text = var_1_7,
			color = var_1_8
		},
		{
			fontSize = 22,
			y = 0,
			type = "label",
			x = 22,
			text = var_1_10
		}
	}
	var_1_2.cityAttLabel = {
		fontSize = 22,
		x = 111,
		type = "label",
		y = 62,
		width = 192,
		text = language.get(200313),
		align = kCCTextAlignmentLeft
	}

	if cityWindowControl.attSide then
		var_1_2.cityAttLabel.children = {}

		for iter_1_0, iter_1_1 in pairs(cityWindowControl.attSide) do
			local var_1_12
			local var_1_13
			local var_1_14 = "(" .. iter_1_1.num .. ")"

			if iter_1_1.forceId == 1 then
				var_1_12 = language.get(200305)
				var_1_13 = ccc3(0, 0, 255)
			elseif iter_1_1.forceId == 2 then
				var_1_12 = language.get(200306)
				var_1_13 = ccc3(255, 0, 0)
			elseif iter_1_1.forceId == 3 then
				var_1_12 = language.get(200307)
				var_1_13 = ccc3(0, 255, 0)
			elseif iter_1_1.forceId > 100 then
				var_1_12 = language.get(200308)
				var_1_13 = ccc3(255, 0, 255)
			end

			var_1_2.cityAttLabel.children[iter_1_0 * 2 - 1] = {
				fontSize = 22,
				type = "label",
				x = -22,
				text = var_1_12,
				color = var_1_13,
				y = -(iter_1_0 - 1) * 22
			}
			var_1_2.cityAttLabel.children[iter_1_0 * 2] = {
				fontSize = 22,
				type = "label",
				x = 22,
				text = var_1_14,
				y = -(iter_1_0 - 1) * 22
			}
		end
	end

	var_1_2.cityButton = {
		type = "button",
		buttons = {}
	}

	local var_1_15 = 1

	if cityWindowControl.inBattle == true then
		var_1_2.cityButton.buttons[var_1_15] = {
			pic2 = "frame:cityWindowButton1.png",
			name = "lookBattleButton",
			pic1 = "frame:cityWindowButton.png",
			x = 283,
			y = 100 - 80 * (var_1_15 - 1),
			children = {
				{
					fontSize = 22,
					y = 36.5,
					type = "label",
					x = 128,
					text = language.get(200314)
				}
			}
		}
		var_1_15 = var_1_15 + 1
		var_1_2.cityButton.buttons[var_1_15] = {
			pic2 = "frame:cityWindowButton1.png",
			name = "conveneButton",
			pic1 = "frame:cityWindowButton.png",
			x = 411,
			y = 100 - 80 * (var_1_15 - 1) + 36.5,
			children = {
				{
					fontSize = 22,
					y = 36.5,
					type = "label",
					x = 128,
					text = language.get(200315)
				}
			}
		}
		var_1_15 = var_1_15 + 1
	else
		if cityWindowControl.shouMaiInfo and cityWindowControl.shouMaiInfo.type ~= 4 then
			-- block empty
		else
			var_1_2.cityButton.buttons[var_1_15] = {
				pic2 = "frame:cityWindowButton1.png",
				name = "conveneButton",
				pic1 = "frame:cityWindowButton.png",
				x = 411,
				y = 100 - 80 * (var_1_15 - 1) + 36.5,
				children = {
					{
						fontSize = 22,
						y = 36.5,
						type = "label",
						x = 128,
						text = language.get(200315)
					}
				}
			}
			var_1_15 = var_1_15 + 1
		end

		if var_1_3.eventInfo then
			var_1_2.cityButton.buttons[var_1_15] = {
				pic2 = "frame:cityWindowButton1.png",
				name = "eventButton",
				pic1 = "frame:cityWindowButton.png",
				x = 283,
				y = 100 - 80 * (var_1_15 - 1),
				children = {
					{
						fontSize = 22,
						y = 36.5,
						type = "label",
						x = 128,
						text = language.get(200316)
					}
				}
			}
		end
	end

	var_1_1.cityWindowBg = {
		xcenter = 0,
		ycenter = 0,
		pic = "res/ui/world/cityWindowBg.jpg",
		type = "pic"
	}

	if tonumber(var_1_4[1]) == 19 or tonumber(var_1_4[1]) == 123 or tonumber(var_1_4[1]) == 207 then
		var_1_2.mainCityLabel = {
			fontSize = 26,
			y = 279,
			type = "label",
			x = 333,
			color = var_1_8
		}

		if tonumber(var_1_4[1]) == 19 then
			var_1_2.mainCityLabel.text = language.get(200317)
		elseif tonumber(var_1_4[1]) == 123 then
			var_1_2.mainCityLabel.text = language.get(200318)
		elseif tonumber(var_1_4[1]) == 207 then
			var_1_2.mainCityLabel.text = language.get(200319)
		end

		var_1_2.instruction = {
			name = "instruction",
			fontSize = 24,
			type = "label",
			y = 74,
			x = 411,
			text = language.get(200320)
		}
		var_1_2.nextYuanzhenjunLabel = {
			fontSize = 20,
			y = 239,
			type = "label",
			right = 105,
			text = language.get(200321)
		}
		var_1_2.nextJinweijunLabel = {
			fontSize = 20,
			y = 203,
			type = "label",
			right = 105,
			text = language.get(200322)
		}
		var_1_1.cityWindowBg.children = {
			var_1_2.nationBg,
			var_1_2.cityNameLabel,
			var_1_2.citySprite,
			var_1_2.mainCityLabel,
			var_1_2.instruction,
			var_1_2.nextYuanzhenjunLabel,
			var_1_2.nextJinweijunLabel
		}
	elseif tonumber(var_1_4[1]) >= 250 then
		local var_1_16 = cityWindowControl.shouMaiInfo
		local var_1_17

		for iter_1_2, iter_1_3 in pairs(worldControl.manzuInfo) do
			if iter_1_3.cityId == tonumber(var_1_4[1]) then
				var_1_17 = iter_1_3
			end
		end

		if var_1_16.ifOurs == true or var_1_16.type == 4 then
			var_1_1.cityWindowBg.children = {
				var_1_2.nationBg,
				var_1_2.cityNameLabel,
				var_1_2.citySprite,
				var_1_2.cityStateLabel,
				var_1_2.cityDefLabel,
				var_1_2.cityAttLabel,
				var_1_2.cityButton
			}
		else
			if var_1_16.qinMiDu then
				var_1_2.qinmiduLabel = {
					fontSize = 24,
					y = 203,
					type = "label",
					width = 192,
					right = 85,
					text = language.get(200323, var_1_16.qinMiDu),
					align = kCCTextAlignmentLeft
				}
				var_1_2.manzuLvLabel = {
					fontSize = 24,
					y = 177,
					type = "label",
					width = 192,
					right = 85,
					text = language.get(200324, var_1_16.manzuLv),
					align = kCCTextAlignmentLeft
				}
				var_1_2.leftCountLabel = {
					fontSize = 24,
					y = 151,
					type = "label",
					width = 192,
					right = 85,
					text = language.get(200325, var_1_16.leftCount),
					align = kCCTextAlignmentLeft
				}
				var_1_2.manzuIntroLabel = {
					height = 96,
					fontSize = 22,
					type = "label",
					y = 83,
					width = 272,
					right = 5,
					text = language.get(200326),
					align = kCCTextAlignmentLeft
				}
			end

			if var_1_17.canFadong == true then
				var_1_2.shoumaiBarBg = {
					x = 20,
					anchorPointX = 0,
					y = 99,
					type = "pic",
					pic = "frame:chengchicaozuoxuetiaodi.png"
				}
				var_1_2.shoumaiProgressBar = {
					anchorPointX = 0,
					percentage = 100,
					x = 20,
					type = "process",
					y = 99,
					pic = "frame:chengchicaozuoxuetiao.png"
				}
				var_1_2.processLabel = {
					fontSize = 22,
					text = "100%",
					y = 99,
					type = "label",
					x = 250
				}
				var_1_1.cityWindowBg.children = {
					var_1_2.nationBg,
					var_1_2.cityNameLabel,
					var_1_2.citySprite,
					var_1_2.qinmiduLabel,
					var_1_2.cityButton,
					var_1_2.manzuLvLabel,
					var_1_2.leftCountLabel,
					var_1_2.manzuIntroLabel,
					var_1_2.shoumaiBarBg,
					var_1_2.shoumaiProgressBar,
					var_1_2.processLabel
				}
				var_1_2.cityButton.buttons[1] = {
					pic2 = "frame:cityWindowButton1.png",
					name = "fadongButton",
					pic1 = "frame:cityWindowButton.png",
					y = 46.5,
					x = 141,
					children = {
						{
							fontSize = 22,
							y = 36.5,
							type = "label",
							x = 128,
							text = language.get(200327)
						}
					}
				}
			else
				if var_1_17.percent then
					var_1_2.shoumaiBarBg = {
						x = 20,
						anchorPointX = 0,
						y = 99,
						type = "pic",
						pic = "frame:chengchicaozuoxuetiaodi.png"
					}
					var_1_2.shoumaiProgressBar = {
						anchorPointX = 0,
						x = 20,
						type = "process",
						y = 99,
						pic = "frame:chengchicaozuoxuetiao.png",
						percentage = tonumber(var_1_17.percent)
					}
					var_1_2.processLabel = {
						fontSize = 22,
						y = 99,
						type = "label",
						x = 250,
						text = var_1_17.percent .. "%"
					}

					if var_1_17.cd < 3600000 then
						var_1_2.cityButton.buttons[1] = {
							pic2 = "frame:cityWindowButton1.png",
							name = "shoumaiButton",
							pic1 = "frame:cityWindowButton.png",
							y = 46.5,
							x = 141,
							children = {
								{
									fontSize = 22,
									y = 36.5,
									type = "label",
									x = 128,
									text = language.get(200328)
								}
							}
						}
					else
						var_1_2.cityButton.buttons[1] = {
							pic2 = "frame:cityWindowButton1.png",
							name = "coverCdButton",
							pic1 = "frame:cityWindowButton.png",
							y = 46.5,
							x = 141,
							children = {
								{
									fontSize = 22,
									y = 36.5,
									type = "label",
									x = 128,
									text = language.get(200329)
								}
							}
						}
					end
				end

				var_1_1.cityWindowBg.children = {
					var_1_2.nationBg,
					var_1_2.cityNameLabel,
					var_1_2.citySprite,
					var_1_2.qinmiduLabel,
					var_1_2.cityButton,
					var_1_2.manzuLvLabel,
					var_1_2.leftCountLabel,
					var_1_2.manzuIntroLabel,
					var_1_2.shoumaiBarBg,
					var_1_2.shoumaiProgressBar,
					var_1_2.processLabel
				}
			end
		end
	else
		var_1_1.cityWindowBg.children = {
			var_1_2.nationBg,
			var_1_2.cityNameLabel,
			var_1_2.citySprite,
			var_1_2.cityStateLabel,
			var_1_2.cityDefLabel,
			var_1_2.cityAttLabel,
			var_1_2.cityButton
		}
	end

	return var_1_1
end

function getNormailCityWindowUiData()
	local var_2_0 = smgr.getLayer("worldCamera")
	local var_2_1 = {}
	local var_2_2 = var_2_0.cityTable["world_building_" .. cityWindowControl.cityId]
	local var_2_3 = var_2_0.cityTable["world_building_" .. cityWindowControl.cityId].prop
	local var_2_4 = var_2_0.cityTable["world_building_" .. cityWindowControl.cityId].info
	local var_2_5
	local var_2_6
	local var_2_7
	local var_2_8 = tonumber(var_2_3[2])

	if var_2_8 == 0 then
		var_2_6 = language.get(200304)
		var_2_7 = ccc3(255, 255, 255)
	elseif var_2_8 == 1 then
		var_2_6 = language.get(200305)
		var_2_7 = ccc3(0, 0, 255)
		var_2_5 = "frame:cityWindowWei.png"
	elseif var_2_8 == 2 then
		var_2_6 = language.get(200306)
		var_2_7 = ccc3(255, 0, 0)
		var_2_5 = "frame:cityWindowShu.png"
	elseif var_2_8 == 3 then
		var_2_6 = language.get(200307)
		var_2_7 = ccc3(0, 255, 0)
		var_2_5 = "frame:cityWindowWu.png"
	elseif var_2_8 > 100 then
		var_2_6 = language.get(200308)
		var_2_7 = ccc3(255, 0, 255)
		var_2_5 = "frame:cityWindowMan.png"
	end

	local var_2_9
	local var_2_10

	if tonumber(var_2_3[3]) == 1 then
		var_2_10 = language.get(200309)
		var_2_9 = "(" .. tostring(cityWindowControl.defSide[1].num) .. ")"
	else
		var_2_10 = language.get(200310)
		var_2_9 = language.get(200311)
	end

	var_2_1.cityWindowBg = {
		xcenter = 0,
		type = "pic",
		ycenter = 0,
		pic = "frame:cityWindowNormalBg.png",
		children = {}
	}

	local var_2_11 = 1

	var_2_1.cityWindowBg.children[var_2_11] = {
		y = 289,
		x = 41,
		type = "pic",
		pic = "frame:cityWindowNationBg.png",
		children = {
			{
				x = 20.5,
				y = 20.5,
				type = "pic",
				pic = var_2_5
			},
			{
				fontSize = 18,
				x = 83.5,
				type = "label",
				y = 20.5,
				width = 72,
				text = var_2_4.name,
				align = kCCTextAlignmentLeft
			}
		}
	}

	local var_2_12 = var_2_11 + 1

	var_2_1.cityWindowBg.children[var_2_12] = {
		x = 273,
		y = 214,
		type = "pic",
		pic = "frame:" .. var_2_4.model
	}

	local var_2_13 = var_2_12 + 1

	var_2_1.cityWindowBg.children[var_2_13] = {
		x = 273,
		name = "cityWindowVs",
		y = 214,
		type = "pic",
		pic = "frame:cityWindowVs.PNG"
	}

	local var_2_14 = var_2_13 + 1

	var_2_1.cityWindowBg.children[var_2_14] = {
		fontSize = 22,
		y = 291,
		type = "label",
		x = 268,
		text = var_2_10
	}

	local var_2_15 = var_2_14 + 1

	var_2_1.cityWindowBg.children[var_2_15] = {
		fontSize = 22,
		y = 210,
		type = "label",
		x = 42,
		text = language.get(200312),
		children = {
			{
				fontSize = 22,
				y = 0,
				type = "label",
				x = 41,
				text = var_2_6,
				color = var_2_7
			},
			{
				fontSize = 22,
				y = 0,
				type = "label",
				x = 85,
				text = var_2_9
			}
		}
	}

	local var_2_16 = var_2_15 + 1

	var_2_1.cityWindowBg.children[var_2_16] = {
		fontSize = 22,
		y = 210,
		type = "label",
		x = 380,
		text = language.get(200313)
	}

	if cityWindowControl.attSide then
		var_2_1.cityWindowBg.children[var_2_16].children = {}

		for iter_2_0, iter_2_1 in pairs(cityWindowControl.attSide) do
			local var_2_17
			local var_2_18
			local var_2_19 = "(" .. iter_2_1.num .. ")"

			if iter_2_1.forceId == 1 then
				var_2_17 = language.get(200305)
				var_2_18 = ccc3(0, 0, 255)
			elseif iter_2_1.forceId == 2 then
				var_2_17 = language.get(200306)
				var_2_18 = ccc3(255, 0, 0)
			elseif iter_2_1.forceId == 3 then
				var_2_17 = language.get(200307)
				var_2_18 = ccc3(0, 255, 0)
			elseif iter_2_1.forceId > 100 then
				var_2_17 = language.get(200308)
				var_2_18 = ccc3(255, 0, 255)
			end

			var_2_1.cityWindowBg.children[var_2_16].children[iter_2_0 * 2 - 1] = {
				fontSize = 22,
				type = "label",
				x = 41,
				text = var_2_17,
				color = var_2_18,
				y = -(iter_2_0 - 1) * 22
			}
			var_2_1.cityWindowBg.children[var_2_16].children[iter_2_0 * 2] = {
				fontSize = 22,
				type = "label",
				x = 85,
				text = var_2_19,
				y = -(iter_2_0 - 1) * 22
			}
		end
	end

	local var_2_20 = var_2_16 + 1

	var_2_1.cityWindowBg.children[var_2_20] = {
		type = "button",
		buttons = {
			{
				pic2 = "frame:cityWindowButton1.png",
				name = "conveneButton",
				pic1 = "frame:cityWindowButton.png",
				y = 66,
				x = 144,
				children = {
					{
						y = 36,
						fontSize = 20,
						type = "label",
						strokeSize = 2,
						x = 128,
						text = language.get(200315),
						color = colorText[10004],
						strokeColor = colorText[10005]
					}
				}
			}
		}
	}

	if cityWindowControl.inBattle == true then
		var_2_1.cityWindowBg.children[var_2_20].buttons[2] = {
			pic2 = "frame:cityWindowButton1.png",
			name = "lookBattleButton",
			pic1 = "frame:cityWindowButton.png",
			y = 66,
			x = 410,
			children = {
				{
					y = 36,
					fontSize = 20,
					type = "label",
					strokeSize = 2,
					x = 128,
					text = language.get(200314),
					color = colorText[10004],
					strokeColor = colorText[10005]
				}
			}
		}
	elseif var_2_2.eventInfo then
		var_2_1.cityWindowBg.children[var_2_20].buttons[2] = {
			pic2 = "frame:cityWindowButton1.png",
			name = "eventButton",
			pic1 = "frame:cityWindowButton.png",
			y = 66,
			x = 410,
			children = {
				{
					fontSize = 20,
					y = 36,
					type = "label",
					strokeSize = 2,
					x = 128,
					text = language.get(200316),
					color = colorText[10004],
					strokeColor = colorText[10005]
				}
			}
		}
	end

	if var_0_0.gIds and #var_0_0.gIds > 0 then
		for iter_2_2, iter_2_3 in pairs(var_0_0.gIds) do
			var_2_20 = var_2_20 + 1
			var_2_1.cityWindowBg.children[var_2_20] = {
				y = 152,
				type = "pic",
				pic = "frame:move_por_move_view.png",
				name = "conveneGeneral_" .. iter_2_2,
				x = 156 + (iter_2_2 - 1) * 80,
				children = {
					{
						y = 34.5,
						x = 34.5,
						scale = 0.6941176470588235,
						type = "pic",
						pic = "res/ui/common/fightPic/fightPic_" .. iter_2_3.gPic .. ".png"
					}
				}
			}
		end
	end

	return var_2_1
end
