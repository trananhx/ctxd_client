local var_0_0 = {}

function getStorageData()
	return var_0_0
end

var_0_0.storageBackground = {
	anchorPointX = 0,
	name = "storageBackground",
	x = 17,
	type = "pic",
	y = 45,
	anchorPointY = 0,
	pic = "res/ui/equip/storage/equipmentStorageView-background.jpg",
	children = {
		{
			text = "0",
			name = "storageStatus",
			font = "Thonburi",
			type = "label",
			top = -20,
			fontSize = 20,
			right = 110
		}
	}
}

function getStorageButtonData()
	return {
		top = -15,
		right = 60,
		type = "button",
		buttons = {
			{
				pic2 = "frame:equipmentStorageView-button-add-storage-s.png",
				name = "addStorageButton",
				pic1 = "frame:equipmentStorageView-button-add-storage-n.png",
				callBack = function()
					log.debug("addStorageButton click!!!")
					storageControl.storageBuyStorageSize()
				end
			}
		}
	}
end

function getFlyText(arg_4_0)
	return {
		fontSize = 20,
		font = "Thonburi",
		name = "storageFlyText",
		type = "label",
		text = arg_4_0,
		align = kCCTextAlignmentCenter
	}
end

function getSuitTipFrameData(arg_5_0, arg_5_1)
	return {
		name = "suitTipFrame",
		type = "pic_9",
		pic = "frame:equipmentStorageView-tip-small.png",
		middleRect = CCRectMake(5, 52, 211, 70),
		preferedSize = arg_5_1,
		children = {
			{
				fontSize = 20,
				name = "SuitItemName",
				top = 15,
				type = "label",
				left = 10,
				font = "Thonburi",
				text = arg_5_0.itemName,
				color = colorQuality[6],
				align = kCCTextAlignmentCenter,
				width = arg_5_1.width - 20
			},
			{
				fontSize = 18,
				height = 60,
				name = "SuitItemIntro",
				type = "label",
				left = 10,
				font = "Thonburi",
				top = 100,
				text = "适用范围\n" .. arg_5_0.suitIntro,
				align = kCCTextAlignmentLeft,
				width = arg_5_1.width - 20
			},
			{
				fontSize = 18,
				name = "SuitAttribute",
				top = 60,
				type = "label",
				left = 10,
				font = "Thonburi",
				width = 0,
				text = "攻击+" .. arg_5_0.att .. " 防御+" .. arg_5_0.def .. " 带兵+" .. arg_5_0.blood,
				color = colorQuality[3],
				align = kCCTextAlignmentLeft
			}
		}
	}
end

function getGemTipFrameData(arg_6_0, arg_6_1)
	return {
		delay = true,
		name = "gemTipFrame",
		type = "pic_9",
		pic = "frame:equipmentStorageView-tip-small.png",
		middleRect = CCRectMake(5, 52, 211, 70),
		preferedSize = arg_6_1,
		children = {
			{
				fontSize = 20,
				name = "GemItemName",
				top = 15,
				type = "label",
				left = 10,
				font = "Thonburi",
				text = arg_6_0.itemName,
				color = colorQuality[arg_6_0.gemLv + 1],
				align = kCCTextAlignmentCenter,
				width = arg_6_1.width - 20
			},
			{
				fontSize = 18,
				name = "GemItemIntro",
				top = 60,
				type = "label",
				left = 10,
				text = "镶嵌在不同兵器上效果不同:\n\n乌蚕鞭:\n修罗盾:\n护军符:\n血滴子:\n八卦带:\n禁军令:",
				font = "Thonburi",
				color = colorQuality[1],
				align = kCCTextAlignmentLeft,
				width = arg_6_1.width - 20
			},
			{
				fontSize = 18,
				name = "GemAttribute",
				top = 82,
				type = "label",
				left = 85,
				font = "Thonburi",
				width = 0,
				text = "\n攻击+" .. arg_6_0.att .. "\n防御+" .. arg_6_0.def .. "\n带兵+" .. arg_6_0.blood .. "\n攻击+" .. arg_6_0.att .. "\n防御+" .. arg_6_0.def .. "\n带兵+" .. arg_6_0.blood,
				color = colorQuality[3],
				align = kCCTextAlignmentLeft
			},
			{
				fontSize = 20,
				name = "GemItemPrice",
				down = 15,
				type = "label",
				left = 10,
				font = "Thonburi",
				width = 272,
				text = "出售价格:" .. arg_6_0.copper,
				color = colorQuality[1],
				align = kCCTextAlignmentLeft
			}
		}
	}
end

function getItemTipFrameData(arg_7_0)
	return {
		name = "itemTipFrame",
		type = "pic_9",
		pic = "frame:equipmentStorageView-tip-small.png",
		middleRect = CCRectMake(5, 52, 211, 70),
		preferedSize = arg_7_0,
		children = {
			{
				fontSize = 20,
				name = "TipItemName",
				top = 25,
				type = "label",
				xcenter = 0,
				text = "物品名称",
				font = "Thonburi",
				color = colorQuality[1],
				align = kCCTextAlignmentCenter,
				width = arg_7_0.width
			},
			{
				fontSize = 20,
				name = "TipItemIntro",
				top = 60,
				type = "label",
				left = 10,
				text = "装备加成",
				font = "Thonburi",
				color = colorQuality[1],
				align = kCCTextAlignmentLeft,
				width = arg_7_0.width
			},
			{
				fontSize = 20,
				name = "TipItemPrice",
				down = 15,
				type = "label",
				left = 10,
				text = "出售价格",
				font = "Thonburi",
				width = 272,
				color = colorQuality[1],
				align = kCCTextAlignmentLeft
			}
		}
	}
end

local function var_0_1(arg_8_0, arg_8_1)
	log.debug("should add description :", arg_8_1)

	if arg_8_1 then
		return
	end

	local var_8_0 = arg_8_0.kind

	log.debug("should add description :", arg_8_1)

	if var_8_0 == 1 then
		local function var_8_1()
			if arg_8_0.type == 5 or arg_8_0.type == 6 then
				return "带兵上限+" .. arg_8_0.attribute
			end

			if arg_8_0.type == 3 or arg_8_0.type == 4 then
				return "防御+" .. arg_8_0.attribute
			end

			if arg_8_0.type == 1 or arg_8_0.type == 2 then
				return "攻击+" .. arg_8_0.attribute
			end

			return ""
		end

		return {
			font = "Thonburi",
			fontSize = 17,
			type = "label",
			y = 100,
			x = 175,
			width = 140,
			text = var_8_1(),
			align = kCCTextAlignmentLeft
		}
	elseif var_8_0 == 2 then
		return {
			font = "Thonburi",
			fontSize = 17,
			type = "label",
			y = 83,
			x = 175,
			width = 140,
			text = "数量:" .. arg_8_0.num .. "\n增加兵器属性",
			align = kCCTextAlignmentLeft
		}
	elseif var_8_0 == 3 then
		return {
			font = "Thonburi",
			fontSize = 17,
			type = "label",
			y = 83,
			x = 175,
			width = 140,
			text = "统+" .. arg_8_0.att1 .. " 勇+" .. arg_8_0.att2 .. "\n武将" .. arg_8_0.minLv .. "级佩戴",
			align = kCCTextAlignmentLeft
		}
	elseif var_8_0 == 4 then
		return {
			font = "Thonburi",
			fontSize = 17,
			type = "label",
			y = 83,
			x = 175,
			width = 140,
			text = "数量:" .. arg_8_0.num,
			align = kCCTextAlignmentLeft
		}
	elseif var_8_0 == 5 then
		return {
			font = "Thonburi",
			fontSize = 17,
			type = "label",
			y = 83,
			x = 175,
			width = 140,
			text = "数量:" .. arg_8_0.num,
			align = kCCTextAlignmentLeft
		}
	elseif var_8_0 == 6 then
		return {
			font = "Thonburi",
			fontSize = 17,
			type = "label",
			y = 83,
			x = 175,
			width = 140,
			text = "数量:" .. arg_8_0.num,
			align = kCCTextAlignmentLeft
		}
	elseif var_8_0 == 7 then
		return {
			font = "Thonburi",
			fontSize = 17,
			type = "label",
			y = 83,
			x = 175,
			width = 140,
			text = "数量:" .. arg_8_0.num,
			align = kCCTextAlignmentLeft
		}
	elseif var_8_0 == 8 then
		return {
			font = "Thonburi",
			fontSize = 17,
			type = "label",
			y = 83,
			x = 175,
			width = 140,
			text = "数量:" .. arg_8_0.num,
			align = kCCTextAlignmentLeft
		}
	elseif var_8_0 == 9 then
		return {
			font = "Thonburi",
			fontSize = 17,
			type = "label",
			y = 83,
			x = 175,
			width = 140,
			text = "数量:" .. arg_8_0.num,
			align = kCCTextAlignmentLeft
		}
	elseif var_8_0 == 10 then
		return {
			fontSize = 17,
			font = "Thonburi",
			y = 83,
			type = "label",
			width = 140,
			x = 175,
			align = kCCTextAlignmentLeft
		}
	elseif var_8_0 == 11 then
		return {
			font = "Thonburi",
			fontSize = 17,
			type = "label",
			y = 83,
			x = 175,
			width = 140,
			text = "数量:" .. arg_8_0.num,
			align = kCCTextAlignmentLeft
		}
	elseif var_8_0 == 12 then
		-- block empty
	elseif var_8_0 == 13 then
		-- block empty
	elseif var_8_0 == 14 then
		-- block empty
	end
end

local function var_0_2(arg_10_0, arg_10_1)
	if arg_10_1 then
		return
	elseif arg_10_0 == 1 then
		return {
			x = 172,
			y = 85,
			pic = "frame:equipmentStorageView-separater.png",
			type = "pic"
		}
	end
end

local function var_0_3(arg_11_0, arg_11_1)
	if arg_11_1.kind == 4 then
		return arg_11_0 and "点击回购" or "点击使用"
	else
		return arg_11_0 and "点击回购" or "点击出售"
	end
end

function getSotrageListData(arg_12_0, arg_12_1)
	log.debug("getSotrageListData : isBuyBack", arg_12_1)

	return {
		listWidth = 261,
		ycelling = 150,
		type = "list",
		top = 0,
		name = "storageList" .. arg_12_0,
		itemRender = function(arg_13_0, arg_13_1)
			return {
				uis = {
					{
						pic = "frame:equipmentStorageView-v-cell-background.png",
						type = "pic",
						name = "storageCell" .. 3 * (arg_12_0 - 1) + arg_13_1,
						children = {
							{
								fontSize = 18,
								x = 175,
								type = "label",
								font = "Thonburi",
								y = 120,
								width = 140,
								name = "itemNameLabel" .. 3 * (arg_12_0 - 1) + arg_13_1,
								text = arg_13_0.itemName,
								align = kCCTextAlignmentLeft,
								color = colorQuality[arg_13_0.quality or 0]
							},
							var_0_1(arg_13_0, arg_12_1),
							var_0_2(arg_13_0.kind, arg_12_1),
							{
								y = 95,
								type = "pic",
								x = 55,
								name = "itemFrame" .. 3 * (arg_12_0 - 1) + arg_13_1,
								pic = picQualityFrame[arg_13_0.quality or 0]
							},
							{
								y = 95,
								pic = "frame:faguangkuang.png",
								type = "pic",
								visible = false,
								x = 55,
								name = "itemHighlight" .. 3 * (arg_12_0 - 1) + arg_13_1
							},
							{
								y = 95,
								x = 55,
								type = "button",
								buttons = {
									{
										align = "center",
										name = "itemButton" .. 3 * (arg_12_0 - 1) + arg_13_1,
										pic1 = "frame:" .. arg_13_0.pic .. ".jpg",
										pic2 = "frame:" .. arg_13_0.pic .. ".jpg",
										callBack = function()
											log.info("equipmentStorageShowTips")
											equipmentStorageShowTips(3 * (arg_12_0 - 1) + arg_13_1, arg_13_0.kind)
										end
									}
								}
							},
							{
								y = 30,
								x = 130,
								type = "button",
								buttons = {
									{
										pic2 = "frame:equipmentStorageView-button-sell-s.png",
										pic1 = "frame:equipmentStorageView-button-sell-n.png",
										align = "center",
										name = "itemSellButton" .. 3 * (arg_12_0 - 1) + arg_13_1,
										children = {
											{
												fontSize = 21,
												font = "Thonburi",
												type = "label",
												y = 18,
												x = 117,
												text = var_0_3(arg_12_1, arg_13_0)
											}
										},
										callBack = function()
											if arg_12_1 then
												storageControl.onBuyBackItemButtonTap(3 * (arg_12_0 - 1) + arg_13_1)
												log.debug("item to buy back :", arg_13_0.vId)
											else
												storageControl.onStorageItemButtonTap(3 * (arg_12_0 - 1) + arg_13_1)
											end
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
