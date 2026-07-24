local var_0_0 = {}
local var_0_1 = {}
local var_0_2 = {}

if conf.language == "vie" then
	var_0_2.qinMiDuX = 18
	var_0_2.qinMiDuValueX = 30
	var_0_2.gotoLabelSize = -4
	var_0_2.gotoLabelX = 5
	var_0_2.occupyLabelX = -8
	var_0_2.cityLabelX = 8
	var_0_2.cityLabelY = 12
	var_0_2.fontSize = -2
	var_0_2.tipsLabelX = 30
elseif conf.language == "tha" then
	var_0_2.qinMiDuX = 0
	var_0_2.qinMiDuValueX = 0
	var_0_2.gotoLabelSize = 0
	var_0_2.gotoLabelX = 15
	var_0_2.occupyLabelX = -8
	var_0_2.cityLabelX = 62
	var_0_2.cityLabelY = 0
	var_0_2.fontSize = -2
	var_0_2.tipsLabelX = 0
elseif conf.language == "kr" then
	var_0_2.qinMiDuX = 0
	var_0_2.qinMiDuValueX = 0
	var_0_2.gotoLabelSize = 0
	var_0_2.gotoLabelX = 20
	var_0_2.occupyLabelX = 0
	var_0_2.cityLabelX = 0
	var_0_2.cityLabelY = 10
	var_0_2.fontSize = 0
	var_0_2.tipsLabelX = 0
else
	var_0_2.qinMiDuX = 0
	var_0_2.qinMiDuValueX = 0
	var_0_2.gotoLabelSize = 0
	var_0_2.gotoLabelX = 0
	var_0_2.occupyLabelX = 0
	var_0_2.cityLabelX = 0
	var_0_2.cityLabelY = 0
	var_0_2.fontSize = 0
	var_0_2.tipsLabelX = 0
end

local function var_0_3()
	return {
		left = 15,
		down = 15,
		z = 101,
		type = "pic",
		pic = "res/ui/equip/store/equipmentStore-di-chengchi.jpg",
		children = {
			{
				x = 94,
				y = 57,
				type = "pic",
				pic = "res/ui/equip/store/equipmentStore-chengchi.png",
				tag = storeConstant.TAG_STORE_CITY_NORMAL
			},
			{
				x = 94,
				name = "cityHighlight",
				y = 57,
				type = "pic",
				visible = false,
				pic = "res/ui/equip/store/equipmentStore-chengchi1.png",
				tag = storeConstant.TAG_STORE_CITY_HIGHLIGHT
			},
			{
				height = 0,
				name = "noSpecialCityLabel",
				type = "label",
				width = 190,
				y = 85,
				x = 270 + var_0_2.occupyLabelX,
				fontSize = 20 + var_0_2.fontSize,
				align = kCCTextAlignmentLeft,
				color = ccc3(236, 208, 168),
				text = language.get(101012),
				children = {
					{
						text = "",
						name = "specialCitieyNameLabel",
						type = "label",
						x = -15 + var_0_2.cityLabelX,
						y = 0 + var_0_2.cityLabelY,
						fontSize = 20 + var_0_2.fontSize,
						color = ccc3(133, 190, 109)
					}
				}
			},
			{
				name = "hasSpecialCityLabel",
				y = 85,
				type = "label",
				text = "",
				x = 200,
				fontSize = 20 + var_0_2.fontSize,
				color = ccc3(236, 208, 168)
			},
			{
				y = 36,
				x = 214,
				type = "button",
				buttons = {
					{
						pic2 = "frame:btn1_yel_c.png",
						pic3 = "frame:btn1_yel_g.png",
						pic1 = "frame:btn1_yel_a.png",
						name = "gotoSpecialCity",
						callBack = function()
							storeUI.gotoSpecialCity()
						end
					}
				}
			},
			{
				name = "gotoSpecialCityLb",
				x = 214,
				type = "label",
				height = 0,
				strokeSize = 2,
				font = "Thonburi",
				y = 36,
				width = 80,
				text = language.get(101013),
				fontSize = 20 + var_0_2.gotoLabelSize,
				x = 214 + var_0_2.gotoLabelX,
				color = colorText[10004],
				strokeColor = colorText[10005]
			}
		}
	}
end

local function var_0_4()
	return {
		down = 15,
		name = "intimacyBackground",
		z = 101,
		type = "pic",
		pic = "res/ui/equip/store/equipmentStore-di-qinmidu.jpg",
		right = 15,
		children = {
			{
				y = 34,
				x = 425,
				type = "button",
				buttons = {
					{
						pic2 = "frame:btn3_yel_c.png",
						name = "equipmentRefreshItem",
						pic1 = "frame:btn3_yel_a.png",
						pic3 = "frame:btn3_yel_g.png"
					}
				}
			},
			{
				fontSize = 20,
				name = "refreshButton",
				strokeSize = 2,
				type = "label",
				font = "Thonburi",
				y = 34,
				x = 425,
				text = language.get(101014),
				color = colorText[10004],
				strokeColor = colorText[10005]
			},
			{
				fontSize = 20,
				y = 85,
				type = "label",
				x = 50 + var_0_2.qinMiDuX,
				color = ccc3(236, 208, 168),
				text = language.get(101015)
			},
			{
				fontSize = 20,
				name = "intimacyValueLabel",
				y = 85,
				type = "label",
				text = "Lv0",
				x = 120 + var_0_2.qinMiDuValueX,
				color = ccc3(217, 152, 70)
			},
			{
				x = 180,
				y = 32,
				pic = "res/ui/equip/store/equipmentStore-jingdutiao1.png",
				type = "pic"
			},
			{
				x = 180,
				name = "intimacyProgressBar",
				y = 32,
				type = "process",
				pic = "res/ui/equip/store/equipmentStore-jingdutiao.png"
			},
			{
				fontSize = 20,
				name = "intimacyProgressLabel",
				y = 32,
				type = "label",
				text = "0/0",
				x = 175
			}
		}
	}
end

var_0_0.equipStoreMenu = {
	anchorPointX = 0,
	name = "equipStoreMenu",
	x = 17,
	type = "pic",
	y = 25,
	anchorPointY = 0,
	pic = "res/ui/equip/store/equipmentStore-di.jpg",
	children = {
		{
			fontSize = 22,
			top = -25,
			type = "label",
			right = 80,
			text = language.get(101016),
			color = ccc3(204, 185, 134)
		},
		{
			top = -20,
			right = 50,
			type = "button",
			buttons = {
				{
					pic2 = "frame:btnTip_a.png",
					name = "tipItem",
					pic1 = "frame:btnTip_c.png"
				}
			}
		},
		{
			name = "equipButtons",
			type = "button",
			buttons = {
				{
					pic2 = "res/ui/equip/store/equipmentStore-yeqian-o1.png",
					name = "equipItem",
					pic1 = "res/ui/equip/store/equipmentStore-yeqian-o2.png",
					y = 495,
					x = 72,
					children = {
						{
							font = "Thonburi",
							name = "equipItemLabel",
							type = "label",
							ycenter = 0,
							xcenter = 0,
							fontSize = 25,
							text = language.get(101017)
						}
					}
				}
			}
		},
		var_0_4(),
		var_0_3()
	}
}

local function var_0_5(arg_4_0, arg_4_1)
	if arg_4_0.bought then
		return
	else
		return
	end
end

local function var_0_6(arg_5_0, arg_5_1)
	if arg_5_0.bought then
		return
	else
		return
	end
end

local function var_0_7(arg_6_0, arg_6_1)
	if arg_6_0.bought then
		return {
			y = 55,
			pic = "res/ui/equip/store/equipmentStore-yigoumai.png",
			type = "pic",
			x = 75,
			name = "itemBoughtPic" .. arg_6_1
		}
	else
		return {
			visible = false,
			y = 55,
			type = "pic",
			pic = "res/ui/equip/store/equipmentStore-yigoumai.png",
			x = 75,
			name = "itemBoughtPic" .. arg_6_1
		}
	end
end

local function var_0_8(arg_7_0, arg_7_1)
	if arg_7_0.bought then
		return
	else
		return {
			font = "Thonburi",
			name = "equipmentBuyLabel",
			type = "label",
			fontSize = 20,
			y = 37,
			x = 75,
			text = language.get(101018)
		}
	end
end

var_0_0.equipmentList = {
	name = "equipmentList",
	down = 300,
	xcelling = 150,
	type = "list",
	left = 15,
	listType = "hlist",
	itemRender = function(arg_8_0, arg_8_1)
		local var_8_0 = {}

		if conf.language == "vie" then
			var_8_0.equipNamefontSize = -4
			var_8_0.equipNameX = 0
			var_8_0.equipNameY = 10
		else
			var_8_0.equipNamefontSize = 0
			var_8_0.equipNameX = 0
			var_8_0.equipNameY = 0
		end

		local var_8_1 = ""

		if arg_8_0.rewardNum then
			var_8_1 = language.get(213401, arg_8_0.rewardNum)
		else
			var_8_1 = ""
		end

		if arg_8_0.itemType and (arg_8_0.itemType == "forge_hammer_2" or arg_8_0.itemType == "accel_hammer") then
			var_8_1 = language.get(213402)

			storeUI.uiTable["equimentNumLabel" .. arg_8_1]:setString(var_8_1)
		end

		return {
			uis = {
				{
					pic = "res/ui/equip/store/equipmentStore-di-zhuangbei.jpg",
					type = "pic",
					name = "equipment" .. arg_8_1,
					children = {
						{
							y = 213,
							pic = "frame:faguangkuang.png",
							type = "pic",
							visible = false,
							x = 75,
							z = 100,
							name = "equipmentHighlight" .. arg_8_1,
							tag = storeConstant.TAG_STORE_EQUIPMENT_HIGHLIGHT
						},
						{
							width = 140,
							type = "label",
							height = 0,
							font = "Thonburi",
							name = "equipmentName" .. arg_8_1,
							fontSize = 22 + var_8_0.equipNamefontSize,
							text = arg_8_0.name,
							color = storeConstant.equipmentQualityColor[arg_8_0.quality or 1],
							x = 75 + var_8_0.equipNameX,
							y = 290 + var_8_0.equipNameY,
							align = kCCTextAlignmentCenter
						},
						{
							x = 35,
							y = 85,
							type = "pic",
							pic = "frame:res_icon_1_ss.png",
							name = "silverPic" .. arg_8_1,
							visible = not arg_8_0.bought
						},
						{
							font = "Thonburi",
							type = "label",
							fontSize = 22,
							y = 128,
							x = 78,
							visible = true,
							name = "equimentNumLabel" .. arg_8_1,
							text = var_8_1
						},
						{
							font = "Thonburi",
							type = "label",
							fontSize = 22,
							y = 85,
							x = 85,
							name = "equimentPriceLabel" .. arg_8_1,
							text = arg_8_0.price,
							visible = not arg_8_0.bought
						},
						{
							x = 35,
							y = 125,
							type = "pic",
							scale = 0.7,
							visible = false,
							pic = "frame:res_icon_55.png",
							name = "silkPic" .. arg_8_1
						},
						{
							text = "0",
							font = "Thonburi",
							type = "label",
							fontSize = 20,
							y = 125,
							x = 90,
							visible = false,
							name = "silkOutputLabel" .. arg_8_1
						},
						{
							y = 213,
							type = "pic",
							x = 75,
							name = "equimentFrame" .. arg_8_1,
							tag = storeConstant.TAG_STORE_EQUIPMENT_FRAME,
							pic = picQualityFrame[arg_8_0.quality or 1]
						},
						{
							y = 213,
							z = 800,
							type = "button",
							x = 75,
							name = "equipmentNormal" .. arg_8_1,
							buttons = {
								{
									name = "equipmentButton" .. arg_8_1,
									pic1 = "frame:" .. arg_8_0.pic .. ".jpg",
									pic2 = "frame:" .. arg_8_0.pic .. ".jpg",
									callBack = function()
										onEquipmentButtonTap(arg_8_1)
									end
								}
							}
						},
						{
							fontSize = 22,
							z = 900,
							strokeSize = 2,
							type = "label",
							font = "Thonburi",
							y = 237,
							x = 88,
							name = "curItemNum" .. arg_8_1,
							text = (not arg_8_0.curItemNum and "" or arg_8_0.curItemNum .. "/") .. (arg_8_0.maxGeneralNum or "")
						},
						{
							x = 38,
							y = 240,
							type = "pic",
							z = 901,
							pic = "res/ui/equip/store/equipment_store_notice.png",
							name = "noticePic" .. arg_8_1,
							visible = arg_8_0.notice or false
						},
						var_0_7(arg_8_0, arg_8_1),
						{
							y = 37,
							type = "button",
							x = 75,
							name = "eqpuipmentBuyButton" .. arg_8_1,
							visible = not arg_8_0.bought,
							buttons = {
								{
									pic2 = "frame:btn2_gre_c.png",
									pic1 = "frame:btn2_gre_a.png",
									callBack = function()
										onBuyEquipmentButtonTap(arg_8_1)
									end
								}
							}
						},
						{
							font = "Thonburi",
							type = "label",
							fontSize = 20,
							y = 37,
							x = 75,
							name = "equipmentBuyLabel" .. arg_8_1,
							text = language.get(101018),
							visible = not arg_8_0.bought
						}
					}
				}
			}
		}
	end
}
var_0_0.attributeList = {
	name = "attributeList",
	ycelling = 35,
	type = "list",
	itemRender = function(arg_11_0, arg_11_1)
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
					text = arg_11_0.attrName .. " Lv." .. arg_11_0.attValue
				},
				{
					font = "Thonburi",
					fontSize = 20,
					type = "label",
					left = 130,
					text = arg_11_0.attIntro,
					color = ccc3(189, 167, 144)
				}
			}
		}
	end
}
var_0_1.tipsLabel1 = {
	fontSize = 24,
	y = 231,
	type = "label",
	x = 114,
	text = language.get(101019),
	color = ccc3(236, 208, 168)
}
var_0_1.tipsLabel2 = {
	fontSize = 22,
	type = "label",
	text = language.get(101020),
	color = storeConstant.equipmentQualityColor[1],
	x = 114 + var_0_2.tipsLabelX,
	y = var_0_1.tipsLabel1.y - 40
}
var_0_1.tipsLabel3 = {
	fontSize = 22,
	type = "label",
	text = language.get(101021),
	color = storeConstant.equipmentQualityColor[2],
	x = 114 + var_0_2.tipsLabelX,
	y = var_0_1.tipsLabel2.y - 33
}
var_0_1.tipsLabel4 = {
	fontSize = 22,
	type = "label",
	text = language.get(101022),
	color = storeConstant.equipmentQualityColor[3],
	x = 114 + var_0_2.tipsLabelX,
	y = var_0_1.tipsLabel3.y - 33
}
var_0_1.tipsLabel5 = {
	fontSize = 22,
	type = "label",
	text = language.get(101023),
	color = storeConstant.equipmentQualityColor[4],
	x = 114 + var_0_2.tipsLabelX,
	y = var_0_1.tipsLabel4.y - 33
}
var_0_1.tipsLabel6 = {
	fontSize = 22,
	type = "label",
	text = language.get(101024),
	color = storeConstant.equipmentQualityColor[5],
	x = 114 + var_0_2.tipsLabelX,
	y = var_0_1.tipsLabel5.y - 33
}
var_0_1.tipsLabel7 = {
	fontSize = 22,
	type = "label",
	text = language.get(101025),
	color = storeConstant.equipmentQualityColor[6],
	x = 114 + var_0_2.tipsLabelX,
	y = var_0_1.tipsLabel6.y - 33
}

function getStoreTipFrameDataByLevel(arg_12_0)
	if arg_12_0 < 19 then
		var_0_1.tipsLabel2.color = colorQuality[1]
		var_0_1.tipsLabel3.color = colorQuality[0]
		var_0_1.tipsLabel4.color = colorQuality[0]
		var_0_1.tipsLabel5.color = colorQuality[0]
		var_0_1.tipsLabel6.color = colorQuality[0]
		var_0_1.tipsLabel7.color = colorQuality[0]
	elseif arg_12_0 < 28 then
		var_0_1.tipsLabel2.color = colorQuality[1]
		var_0_1.tipsLabel3.color = colorQuality[2]
		var_0_1.tipsLabel4.color = colorQuality[0]
		var_0_1.tipsLabel5.color = colorQuality[0]
		var_0_1.tipsLabel6.color = colorQuality[0]
		var_0_1.tipsLabel7.color = colorQuality[0]
	elseif arg_12_0 < 36 then
		var_0_1.tipsLabel2.color = colorQuality[1]
		var_0_1.tipsLabel3.color = colorQuality[2]
		var_0_1.tipsLabel4.color = colorQuality[3]
		var_0_1.tipsLabel5.color = colorQuality[0]
		var_0_1.tipsLabel6.color = colorQuality[0]
		var_0_1.tipsLabel7.color = colorQuality[0]
	elseif arg_12_0 < 53 then
		var_0_1.tipsLabel2.color = colorQuality[1]
		var_0_1.tipsLabel3.color = colorQuality[2]
		var_0_1.tipsLabel4.color = colorQuality[3]
		var_0_1.tipsLabel5.color = colorQuality[4]
		var_0_1.tipsLabel6.color = colorQuality[0]
		var_0_1.tipsLabel7.color = colorQuality[0]
	elseif arg_12_0 < 70 then
		var_0_1.tipsLabel2.color = colorQuality[1]
		var_0_1.tipsLabel3.color = colorQuality[2]
		var_0_1.tipsLabel4.color = colorQuality[3]
		var_0_1.tipsLabel5.color = colorQuality[4]
		var_0_1.tipsLabel6.color = colorQuality[5]
		var_0_1.tipsLabel7.color = colorQuality[0]
	else
		var_0_1.tipsLabel2.color = colorQuality[1]
		var_0_1.tipsLabel3.color = colorQuality[2]
		var_0_1.tipsLabel4.color = colorQuality[3]
		var_0_1.tipsLabel5.color = colorQuality[4]
		var_0_1.tipsLabel6.color = colorQuality[5]
		var_0_1.tipsLabel7.color = colorQuality[6]
	end

	if conf.language == "vie" then
		return {
			name = "tipFrame",
			type = "pic_9",
			delay = true,
			pic = "res/ui/equip/store/equipmentStore-tips-wenhao.png",
			top = 150,
			right = 20,
			middleRect = CCRectMake(0, 0, 0, 0),
			preferedSize = CCSizeMake(320, 254),
			children = {
				var_0_1.tipsLabel1,
				var_0_1.tipsLabel2,
				var_0_1.tipsLabel3,
				var_0_1.tipsLabel4,
				var_0_1.tipsLabel5,
				var_0_1.tipsLabel6,
				var_0_1.tipsLabel7
			}
		}
	else
		return {
			top = 150,
			name = "tipFrame",
			type = "pic",
			delay = true,
			pic = "res/ui/equip/store/equipmentStore-tips-wenhao.png",
			right = 20,
			children = {
				var_0_1.tipsLabel1,
				var_0_1.tipsLabel2,
				var_0_1.tipsLabel3,
				var_0_1.tipsLabel4,
				var_0_1.tipsLabel5,
				var_0_1.tipsLabel6,
				var_0_1.tipsLabel7
			}
		}
	end
end

function getStoreData()
	return var_0_0
end
