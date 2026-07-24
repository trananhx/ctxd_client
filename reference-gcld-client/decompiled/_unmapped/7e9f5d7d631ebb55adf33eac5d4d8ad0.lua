local var_0_0 = {}
local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.priceX = 30
else
	var_0_1.priceX = 0
end

function getStoreHouseData()
	return var_0_0
end

var_0_0.storeHouseBackground = {
	anchorPointX = 0,
	name = "storeHouseBackground",
	x = 17,
	type = "pic",
	y = 25,
	anchorPointY = 0,
	pic = "res/ui/equip/storeHouse/wareh_view_bg.jpg",
	children = {
		{
			fontSize = 20,
			name = "storageContentNum",
			type = "label",
			anchorPointX = 1,
			font = "Thonburi",
			y = 500,
			anchorPointY = 0.5,
			x = 435,
			text = language.get(102008),
			align = kCCTextAlignmentRight
		},
		{
			fontSize = 20,
			name = "itemNameLabel",
			type = "label",
			text = "",
			font = "Thonburi",
			y = 495,
			x = 686,
			color = colorQuality[1],
			align = kCCTextAlignmentCenter
		},
		{
			y = 375,
			x = 686,
			type = "pic",
			pic = "res/ui/equip/storeHouse/wareh_suit_bg.jpg",
			children = {
				{
					xcenter = 0,
					name = "rightQuailtyFrame",
					type = "pic",
					ycenter = 0,
					pic = picQualityFrame[1],
					children = {
						{
							xcenter = 0,
							name = "rightItemPic",
							type = "pic",
							ycenter = 0,
							pic = picQualityFrame[1]
						}
					}
				}
			}
		}
	}
}

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	return {
		pic2 = "frame:btn3_gre_c.png",
		name = "buyBackButton",
		pic1 = "frame:btn3_gre_a.png",
		x = arg_2_2.x,
		y = arg_2_2.y,
		children = {
			{
				xcenter = 0,
				fontSize = 20,
				type = "label",
				ycenter = 0,
				text = arg_2_0
			}
		},
		callBack = arg_2_1
	}
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	return {
		pic2 = "frame:btn3_gre_c.png",
		pic1 = "frame:btn3_gre_a.png",
		x = arg_3_2.x,
		y = arg_3_2.y,
		children = {
			{
				xcenter = 0,
				fontSize = 20,
				type = "label",
				ycenter = 0,
				text = arg_3_0
			}
		},
		callBack = arg_3_1
	}
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	return {
		pic2 = "frame:btn3_yel_c.png",
		name = "sellButton",
		pic1 = "frame:btn3_yel_a.png",
		x = arg_4_2.x,
		y = arg_4_2.y,
		children = {
			{
				xcenter = 0,
				fontSize = 20,
				type = "label",
				ycenter = 0,
				strokeSize = 2,
				text = arg_4_0,
				color = colorText[10004],
				strokeColor = colorText[10005]
			}
		},
		callBack = arg_4_1
	}
end

function getDescriptionWithItem(arg_5_0)
	local var_5_0 = {
		height = 165,
		name = "descriptionLayer",
		x = 477,
		type = "layer_color",
		y = 90,
		width = 415,
		color = ccc4(0, 0, 255, 0),
		children = {}
	}
	local var_5_1 = {
		fontSize = 20,
		type = "label",
		anchorPointX = 0,
		font = "Thonburi",
		y = 130,
		anchorPointY = 0.5,
		x = 25,
		text = language.get(102009),
		align = kCCTextAlignmentLeft,
		color = colorText[10002]
	}
	local var_5_2 = arg_5_0.copper

	if arg_5_0.num and arg_5_0.num ~= 0 then
		var_5_2 = arg_5_0.copper * arg_5_0.num
	end

	local var_5_3

	if var_5_2 > 0 then
		var_5_3 = language.get(102011, var_5_2 or 0)
	else
		var_5_3 = language.get(131007, arg_5_0.iron)
	end

	local var_5_4 = {
		fontSize = 20,
		type = "label",
		anchorPointX = 0,
		font = "Thonburi",
		y = 130,
		anchorPointY = 0.5,
		text = language.get(102010) .. var_5_3,
		x = 75 + var_0_1.priceX,
		align = kCCTextAlignmentLeft
	}

	if conf.language == "kr" then
		var_5_4.x = 125
	end

	local var_5_5 = {
		fontSize = 20,
		height = 0,
		anchorPointX = 0,
		type = "label",
		x = 25,
		font = "Thonburi",
		y = 100,
		anchorPointY = 1,
		width = 370,
		text = arg_5_0.intro or arg_5_0.suitIntro or "",
		color = colorQuality[1],
		align = kCCTextAlignmentLeft
	}
	local var_5_6 = arg_5_0.kind

	if var_5_6 == 1 then
		local var_5_7 = {}

		if conf.language == "vie" then
			var_5_7.quenchingMaxValueX = 70
		else
			var_5_7.quenchingMaxValueX = 0
		end

		local function var_5_8()
			if arg_5_0.type == 5 or arg_5_0.type == 6 then
				return language.get(102012, arg_5_0.attribute)
			end

			if arg_5_0.type == 3 or arg_5_0.type == 4 then
				return language.get(102013, arg_5_0.attribute)
			end

			if arg_5_0.type == 1 or arg_5_0.type == 2 then
				return language.get(102014, arg_5_0.attribute)
			end

			return ""
		end

		local var_5_9 = {
			fontSize = 20,
			type = "label",
			anchorPointX = 1,
			font = "Thonburi",
			y = 130,
			anchorPointY = 0.5,
			x = 390,
			text = var_5_8(),
			align = kCCTextAlignmentRight
		}
		local var_5_10 = {
			fontSize = 20,
			type = "label",
			anchorPointX = 0,
			font = "Thonburi",
			y = 87,
			anchorPointY = 0.5,
			x = 25,
			text = language.get(102015),
			align = kCCTextAlignmentLeft,
			color = colorText[10002]
		}
		local var_5_11 = {
			fontSize = 20,
			type = "label",
			anchorPointX = 0,
			font = "Thonburi",
			y = 87,
			anchorPointY = 0.5,
			text = "Lv." .. arg_5_0.maxLv,
			x = 120 + var_5_7.quenchingMaxValueX,
			align = kCCTextAlignmentLeft
		}

		if arg_5_0.refreshAttribute and #arg_5_0.refreshAttribute > 0 then
			for iter_5_0 = 1, #arg_5_0.refreshAttribute do
				local var_5_12 = {
					type = "pic",
					pic = "frame:star_light.png",
					x = (iter_5_0 == 1 or iter_5_0 == 3) and 37 or 240,
					y = (iter_5_0 == 1 or iter_5_0 == 2) and 55 or 25,
					children = {
						{
							fontSize = 20,
							type = "label",
							anchorPointX = 0,
							ycenter = -2,
							font = "Thonburi",
							anchorPointY = 0.5,
							x = 35,
							text = string.format("%s Lv.%s", arg_5_0.refreshAttribute[iter_5_0].attrName, arg_5_0.refreshAttribute[iter_5_0].attValue),
							align = kCCTextAlignmentLeft
						}
					}
				}

				table.insert(var_5_0.children, var_5_12)
			end
		end

		table.insert(var_5_0.children, var_5_4)
		table.insert(var_5_0.children, var_5_9)
		table.insert(var_5_0.children, var_5_10)
		table.insert(var_5_0.children, var_5_11)
	elseif var_5_6 == 2 then
		local var_5_13 = {
			fontSize = 18,
			anchorPointX = 0,
			type = "label",
			y = 100,
			anchorPointY = 1,
			x = 25,
			text = language.get(102016),
			color = colorQuality[1],
			align = kCCTextAlignmentLeft
		}
		local var_5_14 = {
			fontSize = 18,
			anchorPointX = 0,
			type = "label",
			y = 78,
			anchorPointY = 1,
			x = 95,
			text = language.get(102017, arg_5_0.att, arg_5_0.def, arg_5_0.blood),
			color = colorQuality[3],
			align = kCCTextAlignmentLeft
		}
		local var_5_15 = {
			fontSize = 18,
			anchorPointX = 0,
			type = "label",
			y = 78,
			anchorPointY = 1,
			x = 290,
			text = language.get(102017, arg_5_0.att, arg_5_0.def, arg_5_0.blood),
			color = colorQuality[3],
			align = kCCTextAlignmentLeft
		}

		if conf.language == "kr" then
			var_5_14.x = 110
			var_5_15.x = 305
		end

		table.insert(var_5_0.children, itemCopperTitle)
		table.insert(var_5_0.children, var_5_4)
		table.insert(var_5_0.children, var_5_13)
		table.insert(var_5_0.children, var_5_14)
		table.insert(var_5_0.children, var_5_15)
	elseif var_5_6 == 3 then
		local var_5_16 = {
			fontSize = 20,
			type = "label",
			anchorPointX = 1,
			font = "Thonburi",
			y = 130,
			anchorPointY = 0.5,
			x = 390,
			text = language.get(102018, arg_5_0.att1, arg_5_0.att2),
			align = kCCTextAlignmentRight
		}
		local var_5_17 = {
			fontSize = 20,
			height = 95,
			anchorPointX = 0,
			type = "label",
			x = 25,
			font = "Thonburi",
			y = 100,
			anchorPointY = 1,
			width = 370,
			text = language.get(102019, arg_5_0.minLv, arg_5_0.intro),
			color = colorQuality[1],
			align = kCCTextAlignmentLeft
		}

		table.insert(var_5_0.children, var_5_4)
		table.insert(var_5_0.children, var_5_16)
		table.insert(var_5_0.children, var_5_17)
	elseif var_5_6 == 17 then
		table.insert(var_5_0.children, var_5_4)

		local var_5_18 = {
			language.get(102020),
			language.get(102021),
			language.get(102022),
			language.get(102023),
			language.get(102024)
		}
		local var_5_19 = {
			fontSize = 20,
			height = 95,
			anchorPointX = 0,
			type = "label",
			x = 25,
			font = "Thonburi",
			y = 100,
			anchorPointY = 1,
			width = 370,
			text = language.get(102025, var_5_18[arg_5_0.effectType], arg_5_0.effectNum, arg_5_0.effectDay),
			color = colorQuality[1],
			align = kCCTextAlignmentLeft
		}

		table.insert(var_5_0.children, var_5_19)
	elseif var_5_6 == 4 or var_5_6 == 5 or var_5_6 == 6 or var_5_6 == 11 then
		table.insert(var_5_0.children, var_5_4)
		table.insert(var_5_0.children, var_5_5)
	elseif var_5_6 == 9 or var_5_6 == 12 or var_5_6 == 8 or var_5_6 == 15 or var_5_6 == 13 or var_5_6 == -1 or var_5_6 == 27 or var_5_6 == 33 or var_5_6 == 38 or var_5_6 == 39 or var_5_6 == 40 or var_5_6 == 41 or var_5_6 == 42 or var_5_6 == 46 or var_5_6 == 47 then
		if var_5_6 == 47 and arg_5_0.itemId == 8001 then
			local var_5_20 = {}

			for iter_5_1 in string.gfind(arg_5_0.intro, "[^<br>]+") do
				table.insert(var_5_20, iter_5_1)
			end

			table.remove(var_5_20)

			var_5_5.text = table.concat(var_5_20, "\n")
		end

		table.insert(var_5_0.children, var_5_1)
		table.insert(var_5_0.children, var_5_5)
	elseif var_5_6 == 10 or var_5_6 == 14 then
		local var_5_21 = {
			fontSize = 20,
			type = "label",
			anchorPointX = 0.5,
			font = "Thonburi",
			y = 130,
			anchorPointY = 0.5,
			x = 200,
			text = language.get(102026, arg_5_0.att, arg_5_0.def, arg_5_0.blood),
			color = colorQuality[3],
			align = kCCTextAlignmentCenter
		}
		local var_5_22 = {}
		local var_5_23 = {}

		for iter_5_2 = 1, #arg_5_0.subEquips do
			local var_5_24 = arg_5_0.subEquips[iter_5_2].skillName

			if var_5_22[var_5_24] then
				var_5_22[var_5_24] = var_5_22[var_5_24] + 1
			else
				var_5_22[var_5_24] = 1
				var_5_23[#var_5_23 + 1] = var_5_24
			end
		end

		local var_5_25 = ""

		for iter_5_3 = 1, #var_5_23 do
			var_5_25 = var_5_25 .. var_5_22[var_5_23[iter_5_3]] .. var_5_23[iter_5_3] .. "  "
		end

		local var_5_26 = {
			fontSize = 20,
			type = "label",
			anchorPointX = 0,
			font = "Thonburi",
			y = 100,
			anchorPointY = 1,
			x = 25,
			text = language.get(102027),
			color = colorQuality[1],
			align = kCCTextAlignmentLeft
		}
		local var_5_27 = {
			fontSize = 20,
			type = "label",
			anchorPointX = 0,
			font = "Thonburi",
			y = 100,
			anchorPointY = 1,
			x = 130,
			text = var_5_25,
			align = kCCTextAlignmentLeft,
			color = colorQuality[3]
		}
		local var_5_28 = {
			fontSize = 20,
			height = 60,
			anchorPointX = 0,
			type = "label",
			x = 25,
			font = "Thonburi",
			y = 70,
			anchorPointY = 1,
			width = 370,
			text = language.get(102028, arg_5_0.suitIntro),
			color = colorQuality[1],
			align = kCCTextAlignmentLeft
		}

		table.insert(var_5_0.children, var_5_21)
		table.insert(var_5_0.children, var_5_26)
		table.insert(var_5_0.children, var_5_27)
		table.insert(var_5_0.children, var_5_28)
	elseif var_5_6 == 32 then
		local var_5_29 = {}
		local var_5_30 = {
			Def = 2,
			Att = 1,
			Blood = 3
		}

		for iter_5_4, iter_5_5 in ipairs(arg_5_0.effects) do
			var_5_29[var_5_30[iter_5_5.type]] = iter_5_5.value
		end

		var_5_5.text = arg_5_0.intro .. "\n" .. language.get(102026, var_5_29[1], var_5_29[2], var_5_29[3])

		table.insert(var_5_0.children, var_5_1)
		table.insert(var_5_0.children, var_5_5)
	elseif var_5_6 == 18 then
		if arg_5_0.openType == 0 and arg_5_0.steelNum then
			local var_5_31 = {
				font = "Thonburi",
				fontSize = 20,
				type = "label",
				anchorPointX = 1,
				anchorPointY = 0.5,
				x = 395,
				y = 130,
				text = language.get(102055, arg_5_0.steelNum)
			}

			table.insert(var_5_0.children, var_5_31)
		end

		table.insert(var_5_0.children, var_5_4)
		table.insert(var_5_0.children, var_5_5)
	else
		table.insert(var_5_0.children, var_5_4)
		table.insert(var_5_0.children, var_5_5)
	end

	return var_5_0
end

function getStorageButtonWithItem(arg_7_0)
	local var_7_0 = ccp(567, 45)
	local var_7_1 = ccp(805, 45)
	local var_7_2 = ccp(686, 45)
	local var_7_3 = {
		name = "itemButtons",
		type = "button",
		buttons = {}
	}

	local function var_7_4()
		storeHouseUI.sellItemButtonTap(arg_7_0)
	end

	local function var_7_5()
		storeHouseUI.getEquippedButtonTap(arg_7_0)
	end

	local function var_7_6()
		storeHouseUI.buyBackItemButtonTap(arg_7_0)
	end

	if storeHouseUI.isBuyBack then
		table.insert(var_7_3.buttons, var_0_2(language.get(102029), var_7_6, var_7_2))
	else
		local var_7_7 = arg_7_0.kind

		if var_7_7 == 1 or var_7_7 == 3 or var_7_7 == 44 then
			table.insert(var_7_3.buttons, var_0_3(language.get(102030), var_7_5, var_7_0))
			table.insert(var_7_3.buttons, var_0_4(language.get(102034), var_7_4, var_7_1))
		elseif var_7_7 == 2 then
			local function var_7_8()
				storeHouseUI.gemComposeButtonTap(arg_7_0)
			end

			table.insert(var_7_3.buttons, var_0_3(language.get(102031), var_7_8, var_7_0))
			table.insert(var_7_3.buttons, var_0_4(language.get(102034), var_7_4, var_7_1))
		elseif var_7_7 == 4 then
			local function var_7_9()
				storeHouseUI.useExpCardButtonTap(arg_7_0)
			end

			table.insert(var_7_3.buttons, var_0_3(language.get(102032), var_7_9, var_7_0))
			table.insert(var_7_3.buttons, var_0_4(language.get(102034), var_7_4, var_7_1))
		elseif var_7_7 == 5 then
			table.insert(var_7_3.buttons, var_0_4(language.get(102034), var_7_4, var_7_1))
		elseif var_7_7 == 6 or var_7_7 == 7 or var_7_7 == 11 then
			table.insert(var_7_3.buttons, var_0_4(language.get(102034), var_7_4, var_7_1))
		elseif var_7_7 == 8 then
			local function var_7_10()
				storeHouseUI.useJailPicButtonTap(arg_7_0)
			end

			table.insert(var_7_3.buttons, var_0_3(language.get(102032), var_7_10, var_7_1))
		elseif var_7_7 == 9 or var_7_7 == 13 then
			local function var_7_11()
				if var_7_7 == 9 then
					storeHouseUI.showSuitCompoundPanelButtonTap(arg_7_0)
				else
					storeHouseUI.showProsetCompoundPanelButtonTap(arg_7_0)
				end
			end

			table.insert(var_7_3.buttons, var_0_3(language.get(102032), var_7_11, var_7_1))
		elseif var_7_7 == 10 or var_7_7 == 14 then
			local function var_7_12()
				if var_7_7 == 10 then
					storeHouseUI.demountSuitButtonTap(arg_7_0)
				else
					storeHouseUI.demountProsetButtonTap(arg_7_0)
				end
			end

			table.insert(var_7_3.buttons, var_0_3(language.get(102030), var_7_5, var_7_0))
			table.insert(var_7_3.buttons, var_0_3(language.get(102033), var_7_12, var_7_1))
		elseif var_7_7 == 12 then
			local function var_7_13()
				storeHouseUI.useWarlockPicButtonTap(arg_7_0)
			end

			table.insert(var_7_3.buttons, var_0_3(language.get(102032), var_7_13, var_7_1))
		elseif var_7_7 == 17 then
			local function var_7_14()
				storeHouseUI.useResourceTokenButtonTap(arg_7_0)
			end

			table.insert(var_7_3.buttons, var_0_4(language.get(102034), var_7_4, var_7_1))
			table.insert(var_7_3.buttons, var_0_3(language.get(102032), var_7_14, var_7_0))
		elseif var_7_7 == 18 then
			local function var_7_15()
				if arg_7_0.openType == 0 then
					storeHouseUI.useIronRewardToken(arg_7_0)
				else
					require("lua/layer/activity/activityTab/ui")
					globalAction_showSpecialWindow(arg_7_0)
				end
			end

			table.insert(var_7_3.buttons, var_0_4(language.get(102034), var_7_4, var_7_1))

			local var_7_16 = arg_7_0.openType == 0 and 102054 or 102032

			table.insert(var_7_3.buttons, var_0_3(language.get(var_7_16), var_7_15, var_7_0))
		elseif var_7_7 == 15 then
			local function var_7_17()
				storeHouseUI.useBlackSmithPicButtonTap(arg_7_0)
			end

			table.insert(var_7_3.buttons, var_0_3(language.get(102032), var_7_17, var_7_1))
		elseif var_7_7 == 19 then
			local function var_7_18()
				storeHouseUI.useEquipOrder(arg_7_0.openType)
			end

			table.insert(var_7_3.buttons, var_0_4(language.get(102034), var_7_4, var_7_1))
			table.insert(var_7_3.buttons, var_0_3(language.get(102032), var_7_18, var_7_0))
		elseif var_7_7 == 24 then
			local function var_7_19()
				smgr.changeScene(SCENE_INSTANCE)
			end

			table.insert(var_7_3.buttons, var_0_4(language.get(102034), var_7_4, var_7_1))
			table.insert(var_7_3.buttons, var_0_3(language.get(102032), var_7_19, var_7_0))
		elseif var_7_7 == -1 or var_7_7 == 38 or var_7_7 == 40 then
			-- block empty
		elseif var_7_7 == 23 then
			table.insert(var_7_3.buttons, var_0_4(language.get(102034), var_7_4, var_7_1))
		elseif var_7_7 == 25 then
			table.insert(var_7_3.buttons, var_0_3(language.get(102030), var_7_5, var_7_0))
		elseif var_7_7 == 26 then
			local function var_7_20()
				require("lua/layer/activity/activityTab/ui")

				arg_7_0.openType = arg_7_0.itemId

				globalAction_showSpecialWindow(arg_7_0)
			end

			table.insert(var_7_3.buttons, var_0_3(language.get(102032), var_7_20, var_7_0))
			table.insert(var_7_3.buttons, var_0_4(language.get(102034), var_7_4, var_7_1))
		elseif var_7_7 == 27 then
			local function var_7_21()
				require("lua/layer/general/ui")
				showGeneralPanel(1)
			end

			table.insert(var_7_3.buttons, var_0_3(language.get(102032), var_7_21, var_7_0))
		elseif var_7_7 == 31 then
			local function var_7_22()
				storeHouseUI.useJingLian(arg_7_0)
			end

			table.insert(var_7_3.buttons, var_0_4(language.get(102034), var_7_4, var_7_1))
			table.insert(var_7_3.buttons, var_0_3(language.get(102032), var_7_22, var_7_0))
		elseif var_7_7 == 32 then
			table.insert(var_7_3.buttons, var_0_3(language.get(102032), function()
				showGeneralPanel(1)
			end, var_7_0))
		elseif var_7_7 == 33 then
			local var_7_23

			if arg_7_0.itemId == 2704 then
				function var_7_23()
					require("lua/layer/general/ui")
					showGeneralPanel(1)
				end
			elseif arg_7_0.itemId == 2705 then
				function var_7_23()
					require("lua/layer/resource/ui")
					resourceUI.show(7)
				end
			elseif arg_7_0.itemId == 2706 then
				-- block empty
			end

			if var_7_23 then
				table.insert(var_7_3.buttons, var_0_3(language.get(102032), var_7_23, var_7_0))
			end
		elseif var_7_7 == 39 then
			if arg_7_0.itemId == 2802 then
				local function var_7_24()
					storeHouseUI.useFeatTokenButtonTap()
				end

				table.insert(var_7_3.buttons, var_0_3(language.get(102032), var_7_24, var_7_0))
			end
		elseif var_7_7 == 41 then
			if arg_7_0.itemId == 3101 then
				local function var_7_25()
					storeHouseUI.useFeatResetTokenButtonTap()
				end

				table.insert(var_7_3.buttons, var_0_3(language.get(102032), var_7_25, var_7_0))
			end
		elseif var_7_7 == 42 then
			local function var_7_26()
				storeHouseUI.useLianBingFuButtonTap(arg_7_0)
			end

			table.insert(var_7_3.buttons, var_0_3(language.get(102032), var_7_26, var_7_0))
		elseif var_7_7 == 46 then
			local function var_7_27()
				if arg_7_0.itemId == 5001 then
					weaponTab.ui.show(6)
				elseif arg_7_0.itemId == 6001 then
					storeHouseUI.scoutMeteor()
				end
			end

			table.insert(var_7_3.buttons, var_0_3(language.get(102032), var_7_27, var_7_0))
		elseif var_7_7 == 47 then
			if arg_7_0.itemId == 8001 then
				local function var_7_28()
					weaponTab.ui.show(4)
				end

				table.insert(var_7_3.buttons, var_0_3(language.get(102032), var_7_28, var_7_0))
			end
		else
			table.insert(var_7_3.buttons, var_0_4(language.get(102034), var_7_4, var_7_1))
		end
	end

	return var_7_3
end

function getGeneralListBackground()
	return {
		name = "generalListBackground",
		type = "pic_9",
		pic = "frame:commanWindow.png",
		middleRect = CCRectMake(52, 85, 1, 1),
		preferedSize = CCSizeMake(380, 610),
		children = {
			{
				fontSize = 23,
				font = "Thonburi",
				type = "label",
				top = 20,
				xcenter = 0,
				text = language.get(102035),
				color = colorQuality[1]
			}
		}
	}
end

function getStorageGeneralListPanelData()
	return {
		listWidth = 361,
		name = "storageGeneralList",
		ycelling = 147,
		type = "list",
		top = 0,
		itemRender = function(arg_35_0, arg_35_1)
			return {
				uis = {
					{
						pic = "res/ui/equip/storeHouse/wareh_use_list_view_bg.jpg",
						type = "pic",
						name = "generalListCell" .. arg_35_0.generalId,
						children = {
							{
								y = 90,
								x = 55,
								type = "pic",
								pic = picQualityFrame[arg_35_0.quality or 0]
							},
							{
								y = 90,
								type = "pic",
								x = 55,
								pic = "res/ui/common/generalPic/generalPic_" .. arg_35_0.pic .. ".jpg",
								children = {
									{
										xcenter = 0,
										down = 0,
										type = "pic",
										pic = "frame:gray_text_background.png",
										children = {
											{
												xcenter = 0,
												fontSize = 18,
												type = "label",
												ycenter = 0,
												font = "Thonburi",
												name = "generalLvText" .. arg_35_0.generalId,
												text = "Lv." .. arg_35_0.lv,
												align = kCCTextAlignmentCenter,
												color = colorQuality[1]
											}
										}
									}
								}
							},
							{
								xcenter = 0,
								y = 25,
								type = "button",
								buttons = {
									{
										pic2 = "res/ui/equip/storeHouse/wareh_use_btn_c.jpg",
										pic1 = "res/ui/equip/storeHouse/wareh_use_btn_a.jpg",
										children = {
											{
												xcenter = 0,
												fontSize = 20,
												type = "label",
												ycenter = 0,
												text = language.get(102036)
											}
										},
										callBack = function()
											if storeHouseUI.generalListMask then
												pcall(storeHouseUI.generalListMask.removeFromParentAndCleanup, storeHouseUI.generalListMask, true)
												pcall(storeHouseUI.uiTable.storageGeneralList.removeFromParentAndCleanup, storeHouseUI.uiTable.storageGeneralList, true)

												storeHouseUI.uiTable.storageGeneralList = nil
												storeHouseUI.generalListMask = nil
												storeHouseUI.generals = nil
											end

											storeHouseUI.showExpCardUsePanel(arg_35_0)
										end
									}
								}
							},
							{
								fontSize = 20,
								type = "label",
								anchorPointX = 0,
								font = "Thonburi",
								y = 115,
								anchorPointY = 0.5,
								x = 110,
								text = arg_35_0.name,
								color = colorQuality[arg_35_0.quality or 0]
							},
							{
								fontSize = 20,
								type = "label",
								anchorPointX = 0,
								font = "Thonburi",
								y = 71,
								anchorPointY = 0.5,
								x = 110,
								text = language.get(102037),
								color = colorQuality[1]
							},
							{
								x = 250,
								y = 71,
								pic = "res/ui/equip/storeHouse/wareh_gene_exp_view.png",
								type = "pic"
							},
							{
								x = 250,
								y = 71,
								type = "process",
								pic = "res/ui/equip/storeHouse/wareh_gene_exp_con.png",
								name = "generalExpProgressBar" .. arg_35_0.generalId,
								percentage = arg_35_0.exp / arg_35_0.expMax * 100
							},
							{
								font = "Thonburi",
								type = "label",
								fontSize = 18,
								x = 250,
								y = 71,
								name = "generalExpText" .. arg_35_0.generalId,
								text = arg_35_0.exp .. "/" .. arg_35_0.expMax,
								align = kCCTextAlignmentCenter
							}
						}
					}
				}
			}
		end
	}
end

function getSuitCompoundBackground(arg_37_0)
	local var_37_0 = {
		name = "suitCompoundBackground",
		type = "pic_9",
		pic = "frame:commanWindow.png",
		middleRect = CCRectMake(20, 85, 1, 1),
		preferedSize = CCSizeMake(725, 610),
		children = {
			{
				fontSize = 23,
				font = "Thonburi",
				type = "label",
				top = 20,
				xcenter = 0,
				text = language.get(102038),
				color = colorQuality[1]
			},
			{
				xcenter = 0,
				y = 50,
				type = "button",
				buttons = {
					{
						pic2 = "frame:btn3_gre_c.png",
						pic3 = "frame:btn3_yel_g.png",
						pic1 = "frame:btn3_gre_a.png",
						name = "compoundSuitButton",
						children = {
							{
								xcenter = 0,
								fontSize = 20,
								type = "label",
								ycenter = 0,
								text = language.get(102031)
							}
						},
						enable = arg_37_0.num == arg_37_0.curNum,
						callBack = function()
							storeHouseUI.doCompoundSuitButtonTap(arg_37_0)
						end
					}
				}
			}
		}
	}
	local var_37_1 = {
		type = "layer_color",
		name = "suitCompoundLayer",
		x = 15,
		anchorPointX = 0,
		height = 445,
		y = 87,
		anchorPointY = 0,
		width = 695,
		color = ccc4(0, 0, 128, 0),
		children = {}
	}
	local var_37_2 = {
		xcenter = 0,
		y = 380,
		anchorPointX = 0.5,
		type = "pic",
		anchorPointY = 0.5,
		pic = "res/ui/equip/storeHouse/wareh_suit_view_bg.jpg",
		children = {
			{
				y = 60,
				x = 60,
				type = "pic",
				pic = "res/ui/equip/storeHouse/wareh_suit_bg.jpg",
				children = {
					{
						xcenter = 0,
						type = "pic",
						ycenter = 0,
						pic = picQualityFrame[1],
						children = {
							{
								xcenter = 0,
								ycenter = 0,
								type = "pic",
								pic = "frame:" .. arg_37_0.suitPic .. ".jpg"
							}
						}
					}
				}
			},
			{
				fontSize = 23,
				type = "label",
				anchorPointX = 0,
				font = "Thonburi",
				y = 85,
				anchorPointY = 0.5,
				x = 140,
				text = arg_37_0.suitName,
				align = kCCTextAlignmentLeft,
				color = colorQuality[6]
			},
			{
				fontSize = 23,
				type = "label",
				anchorPointX = 0,
				font = "Thonburi",
				y = 85,
				anchorPointY = 0.5,
				x = 265,
				text = string.format("(%s/%s)", arg_37_0.curNum, arg_37_0.num),
				align = kCCTextAlignmentLeft,
				color = colorQuality[1]
			},
			{
				fontSize = 23,
				type = "label",
				anchorPointX = 0,
				font = "Thonburi",
				y = 35,
				anchorPointY = 0.5,
				x = 140,
				text = language.get(102039),
				align = kCCTextAlignmentLeft,
				color = colorQuality[1]
			},
			{
				fontSize = 23,
				type = "label",
				anchorPointX = 0,
				font = "Thonburi",
				y = 35,
				anchorPointY = 0.5,
				x = 255,
				text = language.get(102040, arg_37_0.att, arg_37_0.def, arg_37_0.blood),
				align = kCCTextAlignmentLeft,
				color = colorQuality[2]
			}
		}
	}

	table.insert(var_37_1.children, var_37_2)
	table.insert(var_37_0.children, var_37_1)

	return var_37_0
end

function getSuitEquipmentCell(arg_39_0, arg_39_1)
	return {
		pic = "res/ui/equip/storeHouse/wareh_suit_list_view_bg.jpg",
		type = "pic",
		isGray = not arg_39_0.isOwn,
		children = {
			{
				x = 50,
				y = 50,
				type = "pic",
				pic = picQualityFrame[1],
				isGray = not arg_39_0.isOwn,
				children = {
					{
						xcenter = 0,
						type = "pic",
						ycenter = 0,
						isGray = not arg_39_0.isOwn,
						pic = "frame:" .. arg_39_0.equipPic .. ".jpg",
						children = {
							{
								xcenter = 0,
								y = 11,
								type = "pic",
								pic = "frame:gray_text_background.png",
								isGray = not arg_39_0.isOwn,
								children = {
									{
										xcenter = 0,
										type = "pic",
										ycenter = 0,
										pic = "res/ui/equip/storeHouse/wareh_equi_star4.png",
										isGray = not arg_39_0.isOwn
									}
								}
							}
						}
					}
				}
			},
			{
				fontSize = 23,
				type = "label",
				anchorPointX = 0,
				font = "Thonburi",
				y = 73,
				anchorPointY = 0.5,
				x = 115,
				text = arg_39_0.equipName,
				align = kCCTextAlignmentLeft,
				color = arg_39_0.isOwn and colorQuality[arg_39_0.quality] or colorQuality[0]
			},
			{
				fontSize = 23,
				type = "label",
				anchorPointX = 0,
				font = "Thonburi",
				y = 27,
				anchorPointY = 0.5,
				x = 115,
				text = language.get(102041),
				align = kCCTextAlignmentLeft,
				color = arg_39_0.isOwn and colorText[10002] or colorQuality[0]
			},
			{
				fontSize = 23,
				type = "label",
				anchorPointX = 0,
				font = "Thonburi",
				y = 27,
				anchorPointY = 0.5,
				x = 230,
				text = string.format("%s Lv.%s", arg_39_0.skillName, arg_39_0.skillLv),
				align = kCCTextAlignmentLeft,
				color = arg_39_0.isOwn and colorText[10002] or colorQuality[0]
			},
			{
				y = 46,
				x = 276,
				type = "pic",
				pic = "res/ui/equip/storeHouse/seal_obtain.png",
				visible = arg_39_0.isOwn
			}
		}
	}
end

function getProsetCompoundBackground(arg_40_0)
	return {
		name = "prosetCompoundBackground",
		type = "pic_9",
		pic = "frame:commanWindow.png",
		middleRect = CCRectMake(20, 85, 1, 1),
		preferedSize = CCSizeMake(580, 610),
		children = {
			{
				fontSize = 23,
				font = "Thonburi",
				type = "label",
				top = 20,
				xcenter = 0,
				text = language.get(102038),
				color = colorQuality[1]
			},
			{
				xcenter = 0,
				name = "prosetCompoundLayer",
				y = 310,
				type = "pic",
				pic = "res/ui/equip/storeHouse/wareh_suit_zh_view.jpg",
				children = {
					{
						fontSize = 23,
						font = "Thonburi",
						type = "label",
						y = 380,
						xcenter = 0,
						text = arg_40_0.itemName,
						color = colorQuality[6]
					},
					{
						y = 293,
						x = 270,
						type = "pic",
						pic = picQualityFrame[6],
						children = {
							{
								xcenter = 0,
								ycenter = 0,
								type = "pic",
								pic = "frame:" .. arg_40_0.pic .. ".jpg"
							}
						}
					},
					{
						y = 135,
						x = 155,
						type = "pic",
						pic = picQualityFrame[6],
						isGray = not arg_40_0.equipProsets[1].owned,
						children = {
							{
								xcenter = 0,
								type = "pic",
								ycenter = 0,
								pic = "frame:" .. arg_40_0.equipProsets[1].pic .. ".jpg",
								isGray = not arg_40_0.equipProsets[1].owned
							},
							{
								fontSize = 23,
								font = "Thonburi",
								type = "label",
								ycenter = -67,
								xcenter = 0,
								text = arg_40_0.equipProsets[1].itemName,
								color = arg_40_0.equipProsets[1].owned and colorQuality[6] or colorQuality[0]
							},
							{
								y = 55,
								x = 55,
								type = "pic",
								pic = "res/ui/equip/storeHouse/seal_obtain.png",
								visible = arg_40_0.equipProsets[1].owned
							}
						}
					},
					{
						y = 135,
						x = 390,
						type = "pic",
						pic = picQualityFrame[6],
						isGray = not arg_40_0.equipProsets[2].owned,
						children = {
							{
								xcenter = 0,
								type = "pic",
								ycenter = 0,
								pic = "frame:" .. arg_40_0.equipProsets[2].pic .. ".jpg",
								isGray = not arg_40_0.equipProsets[2].owned
							},
							{
								fontSize = 23,
								font = "Thonburi",
								type = "label",
								ycenter = -67,
								xcenter = 0,
								text = arg_40_0.equipProsets[2].itemName,
								color = arg_40_0.equipProsets[2].owned and colorQuality[6] or colorQuality[0]
							},
							{
								y = 55,
								x = 55,
								type = "pic",
								pic = "res/ui/equip/storeHouse/seal_obtain.png",
								visible = arg_40_0.equipProsets[2].owned
							}
						}
					}
				}
			},
			{
				xcenter = 0,
				y = 50,
				type = "button",
				buttons = {
					{
						pic2 = "frame:btn3_gre_c.png",
						pic3 = "frame:btn3_yel_g.png",
						pic1 = "frame:btn3_gre_a.png",
						name = "compoundProsetButton",
						children = {
							{
								xcenter = 0,
								fontSize = 20,
								type = "label",
								ycenter = 0,
								text = language.get(102031)
							}
						},
						enable = arg_40_0.num == arg_40_0.curNum,
						callBack = function()
							storeHouseUI.doCompoundProsetButtonTap(arg_40_0)
						end
					}
				}
			}
		}
	}
end

function getUseExpPanelLayout(...)
	return {
		y = 0,
		name = "root",
		type = "node",
		x = 0,
		children = {
			{
				y = 297.8564,
				name = "tjsj_bg",
				type = "sprite",
				x = 226.8549,
				pic = {
					path = "res/ui/equip/storeHouse/tjsj_bg.jpg"
				}
			},
			{
				y = 103.5285,
				name = "jsjh_jjpb_bg",
				type = "sprite",
				x = 228.6195,
				pic = {
					path = "res/ui/equip/storeHouse/jsjh_jjpb_bg.png"
				},
				children = {
					{
						y = 28.2275,
						name = "tjsj_word_sj",
						type = "sprite",
						x = 27.3942,
						pic = {
							path = "res/ui/equip/storeHouse/tjsj_word_sj.png"
						}
					},
					{
						y = 13,
						name = "nextProcess",
						type = "progressbar",
						x = 236.9999,
						pic = {
							path = "res/ui/equip/storeHouse/jsjh_jjpb_g.png"
						}
					},
					{
						y = 13,
						name = "currentProcess",
						type = "progressbar",
						x = 237,
						pic = {
							path = "res/ui/equip/storeHouse/jsjh_jjpb_y.png"
						}
					}
				}
			},
			{
				y = 477.5572,
				name = "jsjh_name_bg",
				type = "sprite",
				x = 220.5024,
				pic = {
					path = "res/ui/weapon/diamond/jsjh_name_bg.png"
				}
			},
			{
				y = 476.3148,
				name = "tjsj_word_wjsj",
				type = "sprite",
				x = 217.5251,
				pic = {
					path = "res/ui/equip/storeHouse/tjsj_word_wjsj.png"
				}
			},
			{
				y = 304.5529,
				name = "halfPic",
				type = "sprite",
				x = 223.7635,
				pic = {
					path = "res/ui/common/halfPic/halfPic_zhaoyun.png"
				}
			},
			{
				y = 206.9616,
				name = "ticket_icon_view_bg",
				type = "sprite",
				x = 222.4525,
				pic = {
					path = "res/ui/resource/tickets/ticket_icon_view_bg.png"
				},
				children = {
					{
						y = 42,
						name = "item",
						x = 42,
						type = "node"
					}
				}
			},
			{
				y = 142.6403,
				name = "tjsj_word_bg",
				type = "sprite",
				x = 242.8266,
				pic = {
					path = "res/ui/equip/storeHouse/tjsj_word_bg.png"
				},
				children = {
					{
						fontSize = 22,
						name = "Text_1",
						type = "label",
						y = 22.5297,
						x = 130.5909,
						textId = 102051,
						halign = kCCTextAlignmentLeft,
						valign = kCCVerticalTextAlignmentBottom
					},
					{
						y = 22,
						name = "input",
						x = 282.7656,
						type = "node"
					}
				}
			},
			{
				name = "btnUse",
				h = 58,
				type = "button",
				w = 140,
				y = 44.8539,
				x = 136.8176,
				normal = {
					frame = true,
					path = "btn3_gre_a.png"
				},
				touched = {
					frame = true,
					path = "btn3_gre_c.png"
				},
				disable = {
					frame = true,
					path = "btn3_gre_g.png"
				},
				children = {
					{
						fontSize = 20,
						name = "Text_2",
						type = "label",
						y = 29,
						x = 70,
						textId = 102052,
						halign = kCCTextAlignmentLeft,
						valign = kCCVerticalTextAlignmentBottom
					}
				}
			},
			{
				name = "btnCancel",
				h = 58,
				type = "button",
				w = 140,
				y = 43.5206,
				x = 340.4843,
				normal = {
					frame = true,
					path = "btn3_yel_a.png"
				},
				touched = {
					frame = true,
					path = "btn3_yel_c.png"
				},
				disable = {
					frame = true,
					path = "btn3_yel_g.png"
				},
				children = {
					{
						fontSize = 20,
						name = "Text_3",
						type = "label",
						y = 29,
						x = 70,
						textId = 102053,
						halign = kCCTextAlignmentLeft,
						valign = kCCVerticalTextAlignmentBottom
					}
				}
			},
			{
				fontSize = 20,
				name = "level",
				type = "label",
				text = "",
				y = 113.1555,
				x = 77.8927,
				halign = kCCTextAlignmentLeft,
				valign = kCCVerticalTextAlignmentBottom,
				anchorPoint = ccp(0, 0.5)
			}
		}
	}
end
