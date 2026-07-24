require("lua/layer/selectInstance2/control")

local var_0_0 = selectInstanceControl
local var_0_1 = selectInstanceConstant
local var_0_2 = -1
local var_0_3 = 70
local var_0_4 = 55

local function var_0_5()
	local var_1_0 = 0
	local var_1_1 = 0

	for iter_1_0 = 1, #var_0_0.powerInfo.npcs do
		if selectInstanceUI.uiTable["zhenxing" .. iter_1_0] then
			var_1_0 = selectInstanceUI.uiTable["zhenxing" .. iter_1_0]:getContentSize().width
			var_1_1 = selectInstanceUI.uiTable["zhenxing" .. iter_1_0]:getContentSize().height

			break
		end
	end

	for iter_1_1 = 1, #var_0_0.powerInfo.npcs do
		if selectInstanceUI.uiTable["circle" .. iter_1_1] then
			selectInstanceUI.uiTable["circle" .. iter_1_1]:setVisible(true)

			if var_0_2 == 1 then
				selectInstanceUI.uiTable["circle" .. iter_1_1]:setPosition(ccp(math.cos(math.rad(90 + var_0_4 * 2)) * var_0_3 + var_1_0 / 2, math.sin(math.rad(90 + var_0_4 * 2)) * var_0_3 + var_1_1 / 2))
				selectInstanceUI.uiTable["xiaoguo" .. iter_1_1]:setString(language.get(490406))
			elseif var_0_2 == 2 then
				selectInstanceUI.uiTable["circle" .. iter_1_1]:setPosition(ccp(math.cos(math.rad(90 + var_0_4 * 1)) * var_0_3 + var_1_0 / 2, math.sin(math.rad(90 + var_0_4 * 1)) * var_0_3 + var_1_1 / 2))
				selectInstanceUI.uiTable["xiaoguo" .. iter_1_1]:setString(language.get(490407))
			elseif var_0_2 == 3 then
				selectInstanceUI.uiTable["circle" .. iter_1_1]:setPosition(ccp(math.cos(math.rad(90 + var_0_4 * 0)) * var_0_3 + var_1_0 / 2, math.sin(math.rad(90 + var_0_4 * 0)) * var_0_3 + var_1_1 / 2))
				selectInstanceUI.uiTable["xiaoguo" .. iter_1_1]:setString(language.get(490408))
			elseif var_0_2 == 4 then
				selectInstanceUI.uiTable["circle" .. iter_1_1]:setPosition(ccp(math.cos(math.rad(90 + var_0_4 * -1)) * var_0_3 + var_1_0 / 2, math.sin(math.rad(90 + var_0_4 * -1)) * var_0_3 + var_1_1 / 2))
				selectInstanceUI.uiTable["xiaoguo" .. iter_1_1]:setString(language.get(490409))
			elseif var_0_2 == 5 then
				selectInstanceUI.uiTable["circle" .. iter_1_1]:setPosition(ccp(math.cos(math.rad(90 + var_0_4 * -2)) * var_0_3 + var_1_0 / 2, math.sin(math.rad(90 + var_0_4 * -2)) * var_0_3 + var_1_1 / 2))
				selectInstanceUI.uiTable["xiaoguo" .. iter_1_1]:setString(language.get(490410))
			end
		end
	end
end

function getSelectInstanceData()
	local var_2_0 = {}

	if conf.language == "kr" then
		var_2_0.tipsY = 28
		var_2_0.tipsW = 0
		var_2_0.tipsH = 30
		var_2_0.recuitLabelX = 0
		var_2_0.labelSize = 0
	elseif conf.language == "vie" then
		var_2_0.tipsY = 0
		var_2_0.tipsW = 40
		var_2_0.tipsH = 0
		var_2_0.recuitLabelX = 50
		var_2_0.labelSize = -10
	else
		var_2_0.tipsY = 0
		var_2_0.tipsW = 0
		var_2_0.tipsH = 0
		var_2_0.recuitLabelX = 0
		var_2_0.labelSize = 0
	end

	local var_2_1 = {
		curBackground = {
			type = "pic",
			pic = "res/ui/instance/instance_" .. var_0_0.powerInfo.powerId .. ".jpg",
			x = visibleSize.width / 2,
			y = visibleSize.height / 2,
			children = {}
		}
	}

	if var_0_0.powerInfo.prePowerId then
		var_2_1.preBackground = {
			type = "pic",
			pic = "res/ui/instance/instance_" .. var_0_0.powerInfo.prePowerId .. ".jpg",
			x = visibleSize.width / 2 - 1386,
			y = visibleSize.height / 2
		}
	end

	if var_0_0.powerInfo.attackable and var_0_0.powerInfo.nextPowerId then
		var_2_1.nextBackground = {
			type = "pic",
			pic = "res/ui/instance/instance_" .. var_0_0.powerInfo.nextPowerId .. ".jpg",
			x = visibleSize.width / 2 + 1386,
			y = visibleSize.height / 2
		}
	end

	local var_2_2 = 1
	local var_2_3 = {
		"fubenDituDiming9.png",
		"fubenDituDiming8.png",
		"fubenDituDiming10.png",
		"fubenDituDiming7.png",
		"fubenDituDiming6.png",
		"fubenDituDiming5.png",
		"fubenDituDiming4.png",
		"fubenDituDiming3.png",
		"fubenDituDiming2.png",
		"fubenDituDiming1.PNG",
		"fubenDituDiming11.png",
		"fubenDituDiming12.png",
		"fubenDituDiming13.png",
		"fubenDituDiming14.png",
		"fubenDituDiming15.png",
		"fubenDituDiming16.png",
		"fubenDituDiming17.png",
		"fubenDituDiming18.png",
		"fubenDituDiming19.png",
		"fubenDituDiming20.png",
		"fubenDituDiming21.png",
		"fubenDituDiming22.png",
		"fubenDituDiming23.png",
		"fubenDituDiming24.png",
		"fubenDituDiming25.png"
	}

	var_2_1.curBackground.children[var_2_2] = {
		x = 693,
		name = "fbTitleBgSprite",
		type = "pic",
		pic = "frame:fubenDituBiaotidi.png",
		y = (768 - visibleSize.height) / 2 + 45,
		children = {
			{
				x = 158,
				y = 37.5,
				type = "pic",
				pic = "frame:" .. var_2_3[var_0_0.powerInfo.powerId]
			}
		}
	}

	local var_2_4 = rmgr.isNotComplete()

	for iter_2_0 = 1, #var_0_0.powerInfo.npcs do
		local var_2_5 = var_0_0.powerInfo.npcs[iter_2_0]
		local var_2_6 = selectInstanceConstant.NPC_POSITION[iter_2_0]

		if var_2_5 and var_2_5.pic == "wulan" then
			var_2_5.pic = "lintong"
		end

		if var_2_5 and var_2_5.pic == "leitong" then
			var_2_5.pic = "chengyu"
		end

		local var_2_7 = false

		if var_2_5.npcId == 129 and var_2_5.attackable and user.player.playerLv >= var_2_5.attLv then
			if var_0_0.powerInfo.npcs[iter_2_0 - 1].attacked and var_0_0.powerInfo.npcs[iter_2_0 - 2].attacked and var_0_0.powerInfo.npcs[iter_2_0 - 3].attacked and var_0_0.powerInfo.npcs[iter_2_0 - 4].attacked and var_0_0.powerInfo.npcs[iter_2_0 - 5].attacked then
				log.info("五关已过！！！可以攻打周瑜")
			else
				var_2_7 = true

				log.info("没过5关，尽管等级已到，还是不允许攻打！")

				var_2_2 = var_2_2 + 1
				var_2_1.curBackground.children[var_2_2] = {
					type = "pic",
					pic = "frame:fubenDituXiaodi5.png",
					x = (1386 - visibleSize.width) / 2 + var_2_6.x,
					y = (768 - visibleSize.height) / 2 + var_2_6.y,
					children = {}
				}

				local var_2_8 = 0
				local var_2_9 = var_2_8 + 1

				var_2_1.curBackground.children[var_2_2].children[var_2_9] = {
					font = "Thonburi-Bold",
					type = "label",
					xcenter = 0,
					y = 33,
					text = language.get(490414),
					fontSize = 26 + var_2_0.labelSize,
					color = selectInstanceConstant.NEXT_NPC_NAME_COLOR6
				}

				local var_2_10 = var_2_9 + 1

				var_2_1.curBackground.children[var_2_2].children[var_2_10] = {
					xcenter = 0,
					y = 95,
					pic = "frame:fubenDituRecru.png",
					type = "pic"
				}
			end
		end

		if var_2_7 == false then
			if var_2_5.attackable and user.player.playerLv >= var_2_5.attLv then
				var_2_2 = var_2_2 + 1
				var_2_1.curBackground.children[var_2_2] = {
					type = "pic",
					pic = "frame:fubenDituXiaodi4.png",
					name = "npc_" .. iter_2_0,
					x = (1386 - visibleSize.width) / 2 + var_2_6.x,
					y = (768 - visibleSize.height) / 2 + var_2_6.y,
					children = {}
				}

				local var_2_11 = 0

				if var_0_0.powerInfo.powerId == 13 and var_2_5.pic == "zhugeliang" then
					var_2_5.pic = "zhugeliang1"
				end

				local var_2_12 = var_2_11 + 1

				var_2_5.pic = var_2_5.pic or ""
				var_2_1.curBackground.children[var_2_2].children[var_2_12] = {
					x = 61,
					y = 110,
					type = "pic",
					pic = "res/ui/common/generalHead/generalHead_" .. var_2_5.pic .. ".png"
				}

				if var_2_5.dropPro and var_2_5.dropPro == 1 then
					var_2_12 = var_2_12 + 1
					var_2_1.curBackground.children[var_2_2].children[var_2_12] = {
						font = "Thonburi-Bold",
						type = "label",
						y = 51,
						x = 78,
						text = language.get(150007),
						fontSize = 26 + var_2_0.labelSize,
						color = selectInstanceConstant.NEXT_NPC_NAME_COLOR4
					}
					var_2_12 = var_2_12 + 1

					local var_2_13 = selectInstanceConstant["NEXT_NPC_NAME_COLOR" .. var_2_5.dropQa] or ccc3(255, 255, 255, 255)

					var_2_1.curBackground.children[var_2_2].children[var_2_12] = {
						font = "Thonburi-Bold",
						type = "label",
						y = 23,
						x = 78,
						text = var_2_5.dropGName,
						fontSize = 26 + var_2_0.labelSize,
						color = var_2_13
					}
				else
					var_2_12 = var_2_12 + 1
					var_2_1.curBackground.children[var_2_2].children[var_2_12] = {
						font = "Thonburi-Bold",
						type = "label",
						y = 51,
						x = 78,
						text = var_2_5.npcName,
						fontSize = 26 + var_2_0.labelSize,
						color = selectInstanceConstant.NPC_NAME_COLOR
					}
					var_2_12 = var_2_12 + 1
					var_2_1.curBackground.children[var_2_2].children[var_2_12] = {
						x = 78,
						y = 23,
						type = "pic",
						pic = "frame:" .. selectInstanceConstant.TERRAIN_LABEL[var_2_5.terrain]
					}
				end

				local var_2_14 = var_2_5.attacked and "fubenDituBaiqi.png" or "fubenDituDaojian.png"
				local var_2_15 = var_2_12 + 1

				var_2_1.curBackground.children[var_2_2].children[var_2_15] = {
					x = 137,
					y = 105,
					type = "pic",
					pic = "frame:" .. var_2_14
				}

				if not var_2_5.attacked and var_2_5.dropPro == 1 then
					local var_2_16 = var_2_15 + 1

					var_2_1.curBackground.children[var_2_2].children[var_2_16] = {
						x = 30,
						y = 95,
						pic = "frame:fubenDituRecru.png",
						type = "pic"
					}
				end
			else
				var_2_2 = var_2_2 + 1
				var_2_1.curBackground.children[var_2_2] = {
					type = "pic",
					pic = "frame:fubenDituXiaodi5.png",
					x = (1386 - visibleSize.width) / 2 + var_2_6.x,
					y = (768 - visibleSize.height) / 2 + var_2_6.y,
					children = {}
				}

				local var_2_17 = 0

				if var_2_5.attLv > 0 then
					var_2_17 = var_2_17 + 1
					var_2_1.curBackground.children[var_2_2].children[var_2_17] = {
						font = "Thonburi-Bold",
						type = "label",
						y = 51,
						x = 78,
						text = language.get(150002, var_2_5.attLv),
						fontSize = 26 + var_2_0.labelSize,
						color = selectInstanceConstant.NEXT_LEVEL_COLOR
					}
					var_2_1.curBackground.children[var_2_2].z = 101
					var_2_17 = var_2_17 + 1
					var_2_1.curBackground.children[var_2_2].children[var_2_17] = {
						x = 250,
						name = "tipBg",
						y = 13,
						type = "pic",
						scale = 0.7,
						visible = false,
						pic = "res/ui/guide/npc_chat_view.png",
						children = {
							{
								x = 88,
								name = "tipHead",
								y = 115,
								type = "pic",
								pic = "res/ui/common/generalHead/generalHead_" .. var_2_5.pic .. ".png"
							},
							(function()
								if conf.language == "vie" then
									return {
										fontSize = 24,
										name = "tipLabel",
										x = 250,
										type = "label",
										height = 0,
										text = "去世界打迷雾，\n升了级再来！",
										y = 100,
										width = 230,
										align = kCCTextAlignmentLeft
									}
								else
									return {
										fontSize = 30,
										name = "tipLabel",
										x = 250,
										type = "label",
										height = 0,
										text = "去世界打迷雾，\n升了级再来！",
										y = 67,
										width = 230,
										align = kCCTextAlignmentLeft
									}
								end
							end)()
						}
					}

					local var_2_18 = false

					if var_2_5.dropPro == 1 then
						var_2_18 = true
						var_2_17 = var_2_17 + 1
						var_2_1.curBackground.children[var_2_2].children[var_2_17] = {
							font = "Thonburi-Bold",
							type = "label",
							y = 23,
							text = language.get(150003),
							fontSize = 26 + var_2_0.labelSize,
							color = selectInstanceConstant.KEZHAOMU_COLOR,
							x = 39 + var_2_0.recuitLabelX
						}
						var_2_17 = var_2_17 + 1
						var_2_1.curBackground.children[var_2_2].children[var_2_17] = {
							xcenter = 0,
							y = 95,
							pic = "frame:fubenDituRecru.png",
							type = "pic"
						}
					end

					var_2_17 = var_2_17 + 1
					var_2_1.curBackground.children[var_2_2].children[var_2_17] = {
						font = "Thonburi-Bold",
						type = "label",
						y = 23,
						x = 78,
						text = var_2_5.dropGName or var_2_5.npcName,
						fontSize = 26 + var_2_0.labelSize,
						color = selectInstanceConstant["NEXT_NPC_NAME_COLOR" .. (var_2_5.dropQa or var_2_5.quality)]
					}

					if var_2_18 then
						var_2_1.curBackground.children[var_2_2].children[var_2_17].x = 117

						if conf.language == "vie" then
							var_2_1.curBackground.children[var_2_2].children[var_2_17].x = 88
							var_2_1.curBackground.children[var_2_2].children[var_2_17].y = 0
						end
					end
				else
					if var_2_5.type == 2 and (not var_2_5.dropPro or var_2_5.dropPro ~= 1) then
						var_2_17 = var_2_17 + 1
						var_2_1.curBackground.children[var_2_2].children[var_2_17] = {
							font = "Thonburi-Bold",
							type = "label",
							y = 23,
							x = 78,
							text = language.get(150004),
							fontSize = 26 + var_2_0.labelSize,
							color = selectInstanceConstant.MULTI_COLOR
						}
					end

					if var_2_5.dropPro and var_2_5.dropPro == 1 then
						local var_2_19 = var_2_17 + 1

						var_2_1.curBackground.children[var_2_2].children[var_2_19] = {
							font = "Thonburi-Bold",
							type = "label",
							y = 51,
							x = 78,
							text = language.get(150007),
							fontSize = 26 + var_2_0.labelSize,
							color = selectInstanceConstant.NEXT_NPC_NAME_COLOR4
						}

						local var_2_20 = var_2_19 + 1
						local var_2_21 = selectInstanceConstant["NEXT_NPC_NAME_COLOR" .. var_2_5.dropQa] or ccc3(255, 255, 255, 255)

						var_2_1.curBackground.children[var_2_2].children[var_2_20] = {
							font = "Thonburi-Bold",
							type = "label",
							y = 23,
							x = 78,
							text = var_2_5.dropGName,
							fontSize = 26 + var_2_0.labelSize,
							color = var_2_21
						}

						local var_2_22 = var_2_20 + 1

						var_2_1.curBackground.children[var_2_2].children[var_2_22] = {
							x = 78,
							y = 100,
							pic = "frame:fubenDituRecru.png",
							type = "pic"
						}
					end
				end
			end
		end

		if var_2_4 and var_2_5.type == 2 then
			var_2_1.curBackground.children[var_2_2].visible = false
		end
	end

	var_0_0.powerInfo.rewardNpcsPos = var_0_0.powerInfo.rewardNpcsPos or {}

	for iter_2_1 = 1, #var_0_0.powerInfo.rewardNpcsPos do
		local var_2_23 = var_0_0.powerInfo.rewardNpcsPos[iter_2_1]
		local var_2_24 = 10 + iter_2_1

		if var_2_23 == 503 then
			var_2_24 = 13
		end

		local var_2_25

		log.info(tool.tableToJson(var_0_0.powerInfo.rewardNpcsRight))

		if var_0_0.powerInfo.rewardNpcsRight then
			for iter_2_2, iter_2_3 in pairs(var_0_0.powerInfo.rewardNpcsRight) do
				if iter_2_3.id == var_2_23 then
					var_2_25 = iter_2_3
				end
			end
		end

		log.info(tool.tableToJson(var_0_0.powerInfo.rewardNpcs))

		if var_0_0.powerInfo.rewardNpcs then
			for iter_2_4, iter_2_5 in pairs(var_0_0.powerInfo.rewardNpcs) do
				if iter_2_5.pos == var_2_23 then
					var_2_25 = iter_2_5
				end
			end
		end

		local var_2_26 = selectInstanceConstant.NPC_POSITION[var_2_24]

		log.info("bnpc::" .. tool.tableToJson(var_2_25))

		if var_2_25 then
			local var_2_27
			local var_2_28 = var_2_25.gold and "fubenDituXiaodi7.png" or "fubenDituXiaodi2.png"

			var_2_2 = var_2_2 + 1
			var_2_1.curBackground.children[var_2_2] = {
				type = "pic",
				name = "npc_" .. var_2_24,
				pic = "frame:" .. var_2_28,
				x = (1386 - visibleSize.width) / 2 + var_2_26.x,
				y = (768 - visibleSize.height) / 2 + var_2_26.y,
				children = {}
			}

			local var_2_29 = 0

			if var_2_25.isCbhs then
				var_2_29 = var_2_29 + 1
				var_2_1.curBackground.children[var_2_2].children[var_2_29] = {
					x = 61,
					y = 110,
					type = "pic",
					pic = "res/ui/common/generalHead/generalHead_" .. var_2_25.pic .. ".png"
				}
				var_2_29 = var_2_29 + 1
				var_2_1.curBackground.children[var_2_2].children[var_2_29] = {
					fontSize = 26,
					font = "Thonburi-Bold",
					type = "label",
					y = 51,
					x = 78,
					text = var_2_25.name,
					color = selectInstanceConstant.NPC_NAME_COLOR
				}
			elseif var_2_25.gold then
				var_2_29 = var_2_29 + 1
				var_2_1.curBackground.children[var_2_2].children[var_2_29] = {
					x = 50,
					y = 23,
					pic = "frame:icon_gold.png",
					type = "pic"
				}
				var_2_29 = var_2_29 + 1
				var_2_1.curBackground.children[var_2_2].children[var_2_29] = {
					type = "atlas",
					height = 21,
					width = 16,
					anchorPointX = 0,
					pic = "res/ui/common/number/up_numb.png",
					y = 23,
					startChar = 48,
					x = 72,
					text = var_2_25.gold
				}
				var_2_29 = var_2_29 + 1
				var_2_1.curBackground.children[var_2_2].children[var_2_29] = {
					font = "Thonburi-Bold",
					type = "label",
					y = 51,
					x = 78,
					text = var_2_25.name,
					fontSize = 26 + var_2_0.labelSize,
					color = selectInstanceConstant.NPC_NAME_COLOR
				}
			else
				if var_2_25.pos == 503 then
					var_2_29 = var_2_29 + 1
					var_2_1.curBackground.children[var_2_2].children[var_2_29] = {
						y = 53,
						z = 100,
						x = 78,
						type = "pic",
						pic = "res/ui/playerInfo/vip_tit.png"
					}
					var_2_29 = var_2_29 + 1
					var_2_1.curBackground.children[var_2_2].children[var_2_29] = {
						y = 23,
						z = 100,
						x = 78,
						type = "pic",
						pic = "res/ui/playerInfo/vip_tequan.png"
					}
				else
					var_2_29 = var_2_29 + 1
					var_2_1.curBackground.children[var_2_2].children[var_2_29] = {
						x = 78,
						y = 23,
						type = "pic",
						pic = "frame:" .. selectInstanceConstant.TERRAIN_LABEL[var_2_25.terrian]
					}
				end

				var_2_29 = var_2_29 + 1
				var_2_1.curBackground.children[var_2_2].children[var_2_29] = {
					font = "Thonburi-Bold",
					type = "label",
					y = 80,
					x = 121,
					z = 101,
					text = tool.toint((var_2_25.maxHp - var_2_25.hp) * 100 / var_2_25.maxHp) .. "%",
					fontSize = 26 + var_2_0.labelSize,
					color = selectInstanceConstant.EXP_PROCESS_COLOR
				}
			end

			local var_2_30 = var_2_29 + 1

			var_2_1.curBackground.children[var_2_2].children[var_2_30] = {
				x = 61,
				y = 110,
				type = "pic",
				pic = "res/ui/common/generalHead/generalHead_" .. var_2_25.pic .. ".png"
			}

			local var_2_31 = var_2_30 + 1
			local var_2_32 = selectInstanceConstant.DROP_ITEM_ICON[var_2_25.type] or ""

			var_2_1.curBackground.children[var_2_2].children[var_2_31] = {
				x = 121,
				y = 108,
				type = "pic",
				pic = "frame:" .. var_2_32
			}
		end
	end

	return var_2_1
end
