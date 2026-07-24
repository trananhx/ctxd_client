local var_0_0 = {}
local var_0_1 = {}

if conf.language == "kr" then
	var_0_1.cityEventPannelY = 100
	var_0_1.playerEventPannelY = 100
	var_0_1.playerEventTitleW = 80
	var_0_1.playerEventTitleH = -50
	var_0_1.playerEventTitleFontSize = -4
	var_0_1.optionRewardFontSize = 22
	var_0_1.optionDescFntSize = 0
elseif conf.language == "vie" then
	var_0_1.cityEventPannelY = 0
	var_0_1.playerEventPannelY = 0
	var_0_1.playerEventTitleW = 0
	var_0_1.playerEventTitleH = 0
	var_0_1.playerEventTitleFontSize = -4
	var_0_1.optionRewardFontSize = 20
	var_0_1.optionDescFntSize = -4
else
	var_0_1.cityEventPannelY = 0
	var_0_1.playerEventPannelY = 0
	var_0_1.playerEventTitleW = 0
	var_0_1.playerEventTitleH = 0
	var_0_1.playerEventTitleFontSize = 0
	var_0_1.optionRewardFontSize = 22
	var_0_1.optionDescFntSize = 0
end

local var_0_2 = require("res/native/offset").get("layer.world.eventPannel.cityEventPanel")

var_0_0.cityEventBackground = {
	xcenter = 0,
	type = "pic_9",
	pic = "res/ui/activity/famous/gjms_sce_view_bg.png",
	down = 36 + var_0_1.cityEventPannelY,
	middleRect = CCRectMake(110, 36, 425, 175),
	preferedSize = CCSizeMake(654, 290),
	children = {
		{
			y = 123,
			height = 112,
			width = 404,
			type = "layer_color",
			x = 180,
			color = ccc4(0, 0, 255, 22),
			children = {
				{
					xcenter = 0,
					ycenter = 0,
					type = "button",
					buttons = {
						{
							pic2 = "res/ui/activity/famous/gjms_sce_list_on.jpg",
							pic1 = "res/ui/activity/famous/gjms_sce_list.jpg",
							name = "optionButton" .. 1,
							callBack = function()
								return
							end
						}
					}
				},
				{
					x = 58,
					z = 105,
					scale = 1.33,
					type = "pic",
					ycenter = 0,
					pic = "res/ui/activity/famous/gjms_icon_view.jpg",
					children = {
						{
							xcenter = 0,
							scale = 0.75,
							type = "pic",
							ycenter = 0,
							pic = "res/ui/common/ItemsPic/liang.jpg",
							name = "eventPic" .. 1
						}
					}
				},
				{
					type = "label",
					anchorPointX = 0,
					text = "",
					y = 75,
					anchorPointY = 0.5,
					x = 115,
					name = "optionDescriptionLabel" .. 1,
					fontSize = 22 + (var_0_2.fntSize or 0),
					align = kCCTextAlignmentLeft
				},
				{
					type = "label",
					anchorPointX = 0,
					text = "",
					y = 33,
					anchorPointY = 0.5,
					x = 115,
					name = "optionRewardLabel" .. 1,
					fontSize = 22 + (var_0_2.fntSize or 0),
					color = colorQuality[3],
					strokeColor = ccc3(22, 18, 13),
					align = kCCTextAlignmentLeft
				}
			}
		},
		{
			y = 8,
			name = "cityEventChoice2",
			width = 404,
			type = "layer_color",
			height = 112,
			x = 180,
			color = ccc4(0, 0, 255, 22),
			children = {
				{
					xcenter = 0,
					ycenter = 0,
					type = "button",
					buttons = {
						{
							pic2 = "res/ui/activity/famous/gjms_sce_list_on.jpg",
							pic1 = "res/ui/activity/famous/gjms_sce_list.jpg",
							name = "optionButton" .. 2,
							callBack = function()
								return
							end
						}
					}
				},
				{
					x = 58,
					z = 105,
					scale = 1.33,
					type = "pic",
					ycenter = 0,
					pic = "res/ui/activity/famous/gjms_icon_view.jpg",
					children = {
						{
							xcenter = 0,
							scale = 0.75,
							type = "pic",
							ycenter = 0,
							pic = "res/ui/common/ItemsPic/liang.jpg",
							name = "eventPic" .. 2
						}
					}
				},
				{
					type = "label",
					anchorPointX = 0,
					text = "",
					y = 75,
					anchorPointY = 0.5,
					x = 115,
					name = "optionDescriptionLabel" .. 2,
					fontSize = 22 + (var_0_2.fntSize or 0),
					align = kCCTextAlignmentLeft
				},
				{
					type = "label",
					anchorPointX = 0,
					text = "",
					y = 33,
					anchorPointY = 0.5,
					x = 115,
					name = "optionRewardLabel" .. 2,
					fontSize = 22 + (var_0_2.fntSize or 0),
					color = colorQuality[3],
					strokeColor = ccc3(22, 18, 13),
					align = kCCTextAlignmentLeft
				}
			}
		},
		{
			name = "eventDesLabel",
			type = "label",
			anchorPointX = 0,
			text = "",
			y = 258,
			anchorPointY = 0.5,
			x = 180,
			fontSize = 22 + (var_0_2.fntSize or 0),
			color = ccc3(235, 209, 167),
			strokeColor = ccc3(22, 18, 13),
			align = kCCTextAlignmentLeft
		},
		{
			x = 55,
			name = "generalPic",
			type = "pic",
			ycenter = 0,
			pic = "res/ui/common/halfPic/halfPic_dianwei.png"
		}
	}
}

function getCityEventPanelUiData()
	return var_0_0.cityEventBackground
end

var_0_0.playerEventBackground = {
	xcenter = 0,
	type = "pic_9",
	pic = "res/ui/activity/famous/gjms_sce_view_bg.png",
	down = 36 + var_0_1.playerEventPannelY,
	middleRect = CCRectMake(110, 36, 425, 165),
	preferedSize = CCSizeMake(654, 190),
	children = {
		{
			y = 8,
			height = 112,
			width = 404,
			type = "layer_color",
			x = 180,
			color = ccc4(0, 0, 255, 22),
			children = {
				{
					xcenter = 0,
					ycenter = 0,
					type = "button",
					buttons = {
						{
							pic2 = "res/ui/activity/famous/gjms_sce_list_on.jpg",
							name = "optionButton",
							pic1 = "res/ui/activity/famous/gjms_sce_list.jpg",
							callBack = function()
								return
							end
						}
					}
				},
				{
					x = 58,
					z = 105,
					scale = 1.33,
					type = "pic",
					ycenter = 0,
					pic = "res/ui/activity/famous/gjms_icon_view.jpg",
					children = {
						{
							xcenter = 0,
							name = "eventPic",
							scale = 0.75,
							type = "pic",
							ycenter = 0,
							pic = "res/ui/common/ItemsPic/liang.jpg"
						}
					}
				},
				{
					fontSize = 22,
					name = "optionDescriptionLabel",
					type = "label",
					anchorPointX = 0,
					text = "",
					y = 85,
					anchorPointY = 0.5,
					x = 115,
					align = kCCTextAlignmentLeft
				},
				{
					name = "optionRewardLabel",
					type = "label",
					anchorPointX = 0,
					text = "",
					y = 58,
					anchorPointY = 0.5,
					x = 115,
					fontSize = var_0_1.optionRewardFontSize,
					color = ccc3(235, 209, 167),
					strokeColor = ccc3(22, 18, 13),
					align = kCCTextAlignmentLeft
				},
				{
					name = "optionCostLabel",
					fontSize = 22,
					type = "label",
					anchorPointX = 0,
					text = "",
					y = 30,
					anchorPointY = 0.5,
					x = 115,
					color = colorQuality[5],
					strokeColor = ccc3(22, 18, 13),
					align = kCCTextAlignmentLeft
				}
			}
		},
		{
			name = "eventDesLabel",
			x = 180,
			type = "label",
			height = 0,
			anchorPointX = 0,
			text = "",
			y = 148,
			anchorPointY = 0.5,
			fontSize = 22 + var_0_1.playerEventTitleFontSize,
			color = ccc3(235, 209, 167),
			width = 400 + var_0_1.playerEventTitleW,
			strokeColor = ccc3(22, 18, 13),
			align = kCCTextAlignmentLeft
		},
		{
			x = 55,
			name = "generalPic",
			type = "pic",
			ycenter = 20,
			pic = "res/ui/common/halfPic/halfPic_dianwei.png"
		}
	}
}

function getPlayerEventPanelUiData()
	return var_0_0.playerEventBackground
end
