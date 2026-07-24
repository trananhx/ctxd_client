function getEquipmentTipFrameData(arg_1_0)
	return {
		delay = true,
		name = "equipmentTipFrame",
		type = "pic_9",
		pic = "res/ui/equip/tips-zhuangbei.png",
		middleRect = CCRectMake(0, 128, 288, 125),
		preferedSize = arg_1_0,
		children = {
			{
				fontSize = 20,
				name = "TipEquipmentName",
				top = 15,
				type = "label",
				left = 10,
				font = "Thonburi",
				width = 268,
				text = language.get(100005),
				color = colorQuality[1],
				align = kCCTextAlignmentCenter
			},
			{
				fontSize = 20,
				name = "TipEquipmentEffect",
				top = 50,
				type = "label",
				left = 10,
				font = "Thonburi",
				width = 272,
				text = language.get(100006),
				color = colorQuality[1],
				align = kCCTextAlignmentLeft,
				align = kCCTextAlignmentLeft
			},
			{
				fontSize = 20,
				name = "TipEquipmentEffect2",
				type = "label",
				anchorPointX = 0,
				height = 70,
				left = 10,
				top = 50,
				text = "",
				font = "Thonburi",
				y = 90,
				anchorPointY = 0,
				width = 272,
				color = colorQuality[1],
				align = kCCTextAlignmentLeft
			},
			{
				fontSize = 20,
				name = "TipEquipmentMaxLv",
				top = 128,
				type = "label",
				left = 10,
				font = "Thonburi",
				width = 272,
				text = language.get(100007),
				color = colorQuality[1],
				align = kCCTextAlignmentLeft
			},
			{
				fontSize = 20,
				name = "TipEquipmentPrice",
				down = 15,
				type = "label",
				left = 10,
				font = "Thonburi",
				width = 272,
				text = language.get(100008),
				color = colorQuality[1],
				align = kCCTextAlignmentLeft
			}
		}
	}
end
