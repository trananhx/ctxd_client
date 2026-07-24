local var_0_0 = {}
local var_0_1 = {}

function getQuenchingUIData()
	return var_0_0
end

local var_0_2 = {}

if conf.language == "vie" then
	var_0_2.qenchingDescTop = -25
	var_0_2.tzbjLabelScale = 1
	var_0_2.tzbjLabelX = 0
	var_0_2.zzxlFontSize = -4
	var_0_2.attInfoX = 90
elseif conf.language == "tha" then
	var_0_2.qenchingDescTop = 0
	var_0_2.tzbjLabelScale = 0.75
	var_0_2.tzbjLabelX = -15
	var_0_2.zzxlFontSize = 0
	var_0_2.attInfoX = 0
else
	var_0_2.qenchingDescTop = 0
	var_0_2.tzbjLabelScale = 1
	var_0_2.tzbjLabelX = 0
	var_0_2.zzxlFontSize = 0
	var_0_2.attInfoX = 0
end

function getAttributeLvLabel(arg_2_0)
	return {
		pic = "frame:star_light.png",
		type = "pic",
		name = "attributeLabel" .. arg_2_0,
		children = {
			{
				fontSize = 20,
				text = "Lv.0",
				type = "label",
				y = 15,
				font = "Thonburi",
				x = 50,
				name = "attributeLvLabel" .. arg_2_0
			}
		}
	}
end

function quenchingGetActivityProgressPanel(arg_3_0)
	return {
		height = 65,
		name = "activityProgressPanel",
		x = 560,
		type = "layer_color",
		y = 475,
		width = 360,
		color = ccc4(0, 0, 255, 0),
		children = {
			{
				fontSize = 22,
				font = "Thonburi",
				y = 22,
				type = "label",
				x = 90,
				text = language.get(400041),
				color = colorText[10001]
			},
			{
				x = 170,
				name = "quenchingRewardIcon",
				y = 30,
				type = "pic",
				z = 1000,
				pic = "res/ui/kfsy/150150.png",
				children = {
					{
						xcenter = 0,
						type = "pic",
						ycenter = 0,
						pic = "res/ui/equip/quenching/acti_icon_xidfs.png",
						children = {
							{
								fontSize = 22,
								name = "quenchingRewardNumberLabel",
								text = "0",
								type = "label",
								y = 40,
								x = 45,
								font = "Thonburi",
								color = colorQuality[4]
							}
						}
					}
				}
			},
			{
				x = 280,
				y = 20,
				pic = "res/ui/equip/quenching/progress_bar_bg.png",
				type = "pic"
			},
			{
				x = 280,
				name = "activityProgressBar",
				y = 20,
				type = "process",
				pic = "res/ui/equip/quenching/progress_bar.png"
			}
		}
	}
end

var_0_0.quenchingBackground = {
	y = 30,
	name = "quenchingBackground",
	x = 17,
	type = "pic",
	anchorPointX = 0,
	anchorPointY = 0,
	pic = "res/ui/equip/quenching/equipmentQuenchingView_background_basic.jpg",
	children = {
		{
			fontSize = 22,
			height = 0,
			type = "label",
			width = 600,
			left = 5,
			text = language.get(103011),
			color = ccc3(204, 185, 134),
			top = -25 + var_0_2.qenchingDescTop
		},
		{
			z = 1000,
			name = "kaiguangButton",
			visible = false,
			type = "pic",
			top = -90,
			pic = "res/ui/kfsy/150150.png",
			right = 0,
			children = {
				{
					xcenter = 0,
					font = "Thonburi-bold",
					type = "label",
					ycenter = 0,
					fontSize = 26,
					text = language.get(103040),
					color = ccc3(0, 255, 0)
				}
			}
		},
		{
			fontSize = 30,
			font = "Thonburi",
			type = "label",
			top = 15,
			left = 220,
			text = language.get(103012),
			color = ccc3(204, 185, 134)
		},
		{
			fontSize = 20,
			font = "Thonburi",
			name = "equipmentName",
			type = "label",
			x = 735,
			y = 439,
			text = language.get(103013),
			color = colorQuality[3]
		},
		{
			x = 280,
			name = "emptyTip",
			y = 250,
			type = "pic",
			visible = false,
			pic = "frame:equipmentQuenchingView_noEquipment.png"
		},
		{
			y = 358,
			name = "equimentFrame",
			type = "pic",
			x = 732,
			pic = picQualityFrame[3]
		},
		{
			x = 732,
			name = "equipmentPic",
			y = 358,
			type = "pic",
			pic = "frame:equipmentQuenchingView_background_equipment.png"
		},
		{
			x = 813,
			name = "goldPriceIcon2",
			y = 319,
			type = "pic",
			scale = 0.7,
			visible = false,
			pic = "frame:res_icon_4_56_46.png"
		},
		{
			fontSize = 20,
			font = "Thonburi",
			name = "equipmentironNum",
			type = "label",
			text = "",
			y = 319,
			x = 863,
			visible = false
		},
		{
			name = "equipmentCanSuitPic",
			y = 284,
			type = "pic",
			pic = "res/ui/equip/quenching/xl_tit_tzbj.png",
			x = 858 + var_0_2.tzbjLabelX,
			scale = var_0_2.tzbjLabelScale
		},
		{
			name = "equipmentCanSuitGrayPic",
			isGray = true,
			type = "pic",
			y = 284,
			pic = "res/ui/equip/quenching/xl_tit_tzbj.png",
			x = 858 + var_0_2.tzbjLabelX,
			scale = var_0_2.tzbjLabelScale
		},
		{
			y = 190,
			x = 603,
			type = "button",
			buttons = {
				{
					pic2 = "frame:equipmentQuenchingView_background_skill.png",
					pic1 = "frame:equipmentQuenchingView_background_skill.png",
					name = "attributePic" .. 1,
					callBack = function()
						log.debug(" button pressed ")
						equipmentQuenchingUI.showAttributeTip(1)
					end
				}
			}
		},
		{
			y = 190,
			x = 681,
			type = "button",
			buttons = {
				{
					pic2 = "frame:equipmentQuenchingView_background_skill.png",
					pic1 = "frame:equipmentQuenchingView_background_skill.png",
					name = "attributePic" .. 2,
					callBack = function()
						log.debug(" button pressed ")
						equipmentQuenchingUI.showAttributeTip(2)
					end
				}
			}
		},
		{
			y = 190,
			x = 758,
			type = "button",
			buttons = {
				{
					pic2 = "frame:equipmentQuenchingView_background_skill.png",
					pic1 = "frame:equipmentQuenchingView_background_skill.png",
					name = "attributePic" .. 3,
					callBack = function()
						log.debug(" button pressed ")
						equipmentQuenchingUI.showAttributeTip(3)
					end
				}
			}
		},
		{
			y = 190,
			x = 862,
			type = "button",
			buttons = {
				{
					pic2 = "frame:equipmentQuenchingView_button_recover_pressed.png",
					pic1 = "frame:equipmentQuenchingView_button_recover_normal.png",
					name = "attributePic" .. 4,
					callBack = function()
						log.debug("recover button pressed ")
						equipmentQuenchingControl.getRestoreInfo()
					end
				}
			}
		},
		{
			fontSize = 20,
			name = "recoverText",
			type = "label",
			y = 146,
			x = 868,
			text = language.get(103014),
			color = ccc3(255, 255, 205)
		},
		{
			y = 75,
			x = 650,
			type = "button",
			buttons = {
				{
					pic2 = "frame:equipmentQuenchingView_button_green_pressed.png",
					name = "freeQuenchingButton",
					pic1 = "frame:equipmentQuenchingView_button_green_normal.png",
					callBack = function()
						log.debug("free quenching button pressed ")
						equipmentQuenchingUI.doQuenchingEquipment(2)
					end
				}
			}
		},
		{
			fontSize = 20,
			x = 650,
			type = "label",
			font = "Thonburi",
			y = 75,
			strokeSize = 2,
			text = language.get(103015),
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			font = "Thonburi",
			name = "freeCountLabel",
			type = "label",
			fontSize = 16,
			y = 35,
			x = 650,
			text = language.get(103016)
		},
		{
			y = 75,
			name = "payQuenchingButton",
			type = "button",
			x = 830,
			buttons = {
				{
					pic2 = "frame:equipmentQuenchingView_button_green_pressed.png",
					pic1 = "frame:equipmentQuenchingView_button_green_normal.png",
					callBack = function()
						log.debug("pay quenching button pressed ")
						equipmentQuenchingUI.doQuenchingEquipment(1)
					end
				}
			}
		},
		{
			height = 0,
			width = 84,
			type = "label",
			strokeSize = 2,
			font = "Thonburi",
			y = 75,
			x = 830,
			text = language.get(103017),
			fontSize = 20 + var_0_2.zzxlFontSize,
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			text = "",
			name = "freeNiubiTimesLabel",
			fontSize = 18,
			type = "label",
			y = 107,
			x = 830,
			color = colorQuality[4]
		},
		{
			type = "button",
			buttons = {
				{
					name = "autoBuyBtn",
					x = 750,
					y = 28,
					pic1 = {
						pics = {
							{
								pic = "res/ui/messagebox/unite_view_a.png",
								children = {
									{
										x = 19,
										name = "checkedBtn",
										y = 19,
										type = "pic",
										pic = "res/ui/messagebox/unite_view_on.png"
									},
									{
										fontSize = 20,
										x = 106,
										type = "menu_label",
										font = "Thonburi",
										y = 19,
										strokeSize = 2,
										text = language.get(226065),
										color = ccc3(0, 0, 0),
										strokeColor = ccc3(204, 185, 134)
									}
								}
							}
						}
					}
				}
			}
		}
	}
}
var_0_0.attributeList = {
	name = "attributeList",
	ycelling = 35,
	type = "list",
	itemRender = function(arg_10_0, arg_10_1)
		return {
			uis = {
				{
					left = 10,
					pic = "frame:star_light.png",
					type = "pic"
				},
				{
					font = "Thonburi",
					fontSize = 20,
					type = "label",
					left = 40,
					text = arg_10_0.attrName .. " Lv." .. arg_10_0.attValue
				},
				{
					font = "Thonburi",
					fontSize = 20,
					type = "label",
					text = arg_10_0.attIntro,
					left = 130 + var_0_2.attInfoX,
					color = ccc3(189, 167, 144)
				}
			}
		}
	end
}

local function var_0_3(arg_11_0)
	if arg_11_0.owner then
		return {
			fontSize = 19,
			x = 180,
			type = "label",
			font = "Thonburi",
			y = 65,
			width = 135,
			text = arg_11_0.owner,
			align = kCCTextAlignmentLeft,
			color = colorQuality[arg_11_0.generalQuality]
		}
	end
end

function getQuenchingBlockData(arg_12_0)
	local var_12_0 = 2 * (arg_12_0 - 1)

	return {
		listType = "hlist",
		listHeight = 111,
		type = "list",
		xcelling = 269,
		name = "quenchingBlock" .. arg_12_0,
		itemRender = function(arg_13_0, arg_13_1)
			return {
				uis = {
					{
						type = "pic",
						pic = arg_13_0.owner and "frame:equipmentQuenchingView_cell_owner_normal.png" or "frame:equipmentQuenchingView_cell_none_normal.png",
						name = "quenchingCell" .. 2 * (arg_12_0 - 1) + arg_13_1,
						children = {
							{
								visible = false,
								z = 0,
								type = "pic",
								top = 0,
								left = 0,
								name = "quenchingHighlightCell" .. var_12_0 + arg_13_1,
								pic = arg_13_0.owner and "frame:equipmentQuenchingView_cell_owner_normal_pressed.png" or "frame:equipmentQuenchingView_cell_none_pressed.png"
							},
							{
								fontSize = 19,
								x = 180,
								type = "label",
								font = "Thonburi",
								y = 90,
								width = 135,
								name = "itemNameLabel" .. 2 * (arg_12_0 - 1) + arg_13_1,
								text = arg_13_0.name,
								align = kCCTextAlignmentLeft,
								color = colorQuality[arg_13_0.quality]
							},
							var_0_3(arg_13_0),
							{
								y = 60,
								type = "pic",
								x = 55,
								name = "itemFrame" .. 2 * (arg_12_0 - 1) + arg_13_1,
								pic = picQualityFrame[arg_13_0.quality]
							},
							{
								y = 60,
								pic = "frame:faguangkuang.png",
								type = "pic",
								visible = false,
								x = 55,
								name = "itemHighlight" .. 2 * (arg_12_0 - 1) + arg_13_1
							},
							{
								y = 60,
								x = 55,
								type = "button",
								buttons = {
									{
										align = "center",
										name = "itemButton" .. 2 * (arg_12_0 - 1) + arg_13_1,
										pic1 = "frame:" .. arg_13_0.pic .. ".jpg",
										pic2 = "frame:" .. arg_13_0.pic .. ".jpg",
										callBack = function()
											onQuenchingEquipmentButtonTap(2 * (arg_12_0 - 1) + arg_13_1)
										end
									}
								}
							}
						}
					}
				}
			}
		end
	}
end

function getCanSuitTipFrameData(arg_15_0)
	local var_15_0 = {
		{
			fontSize = 24,
			name = "attributeTipLabel",
			type = "label",
			left = 20,
			font = "Thonburi",
			top = 15,
			text = language.get("103038_lxr"),
			color = ccc3(188, 167, 145),
			align = kCCTextAlignmentLeft
		}
	}
	local var_15_1 = 0

	for iter_15_0, iter_15_1 in pairs(arg_15_0) do
		local var_15_2 = {
			x = 50,
			scale = 0.65,
			type = "pic",
			pic = "frame:" .. iter_15_1.pic .. ".jpg",
			top = 50 + var_15_1
		}
		local var_15_3 = {
			fontSize = 24,
			font = "Thonburi",
			type = "label",
			x = 130,
			text = iter_15_1.name,
			color = colorQuality[6],
			top = 70 + var_15_1,
			align = kCCTextAlignmentLeft
		}

		table.insert(var_15_0, var_15_2)
		table.insert(var_15_0, var_15_3)

		var_15_1 = var_15_1 + 65
	end

	return {
		name = "canSuitTipFrame",
		type = "pic_9",
		pic = "frame:common_tip_frame_small.png",
		middleRect = CCRectMake(24, 24, 1, 1),
		preferedSize = CCSizeMake(200, 80 + var_15_1),
		children = var_15_0
	}
end

function getAttributeTipFrameData(arg_16_0)
	return {
		name = "attributeTipFrame",
		type = "pic_9",
		pic = "frame:equipmentQuenchingView_background_attributeTip.png",
		middleRect = CCRectMake(13, 10, 468, 35),
		preferedSize = arg_16_0,
		children = {
			{
				fontSize = 18,
				name = "attributeTipLabel",
				text = "",
				type = "label",
				xcenter = 0,
				ycenter = 0,
				font = "Thonburi",
				color = ccc3(188, 167, 145)
			}
		}
	}
end
