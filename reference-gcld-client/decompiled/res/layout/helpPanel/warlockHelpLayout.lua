return {
	name = "tipPanel",
	type = "sprite9Tips",
	y = 485,
	x = 115,
	middleRect = CCRectMake(0, 0, 0, 0),
	preferedSize = CCSizeMake(830, 165),
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(0, 1),
	content = {
		{
			style = "label_tip",
			type = "label",
			textId = 20041,
			anchorPoint = ccp(0, 0.5),
			color = ccc3(188, 167, 145),
			halign = kCCTextAlignmentLeft
		},
		{
			y = 125,
			x = 415,
			type = "sprite9",
			pic = {
				frame = true,
				path = "separateLine.png"
			},
			preferedSize = CCSizeMake(820, 6)
		},
		{
			style = "label_tip",
			type = "label",
			textId = 20042,
			anchorPoint = ccp(0, 0.5),
			color = colorQuality[3],
			halign = kCCTextAlignmentLeft
		},
		{
			style = "label_tip",
			type = "label",
			textId = 20043,
			anchorPoint = ccp(0, 0.5),
			color = colorQuality[4],
			halign = kCCTextAlignmentLeft
		},
		{
			style = "label_tip",
			type = "label",
			textId = 20044,
			anchorPoint = ccp(0, 0.5),
			color = colorQuality[5],
			halign = kCCTextAlignmentLeft
		},
		{
			style = "label_tip",
			type = "label",
			textId = 20045,
			anchorPoint = ccp(0, 0.5),
			color = colorQuality[6],
			halign = kCCTextAlignmentLeft
		},
		{
			type = "sprite",
			pic = {
				frame = true,
				path = "separateLine.png"
			}
		},
		{
			style = "label_tip",
			type = "label",
			textId = 20053,
			anchorPoint = ccp(0, 0.5),
			color = colorQuality[5],
			halign = kCCTextAlignmentLeft
		}
	}
}
