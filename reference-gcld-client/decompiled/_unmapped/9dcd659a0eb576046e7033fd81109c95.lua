local var_0_0 = {}
local var_0_1 = {}

if conf.language == "kr" then
	var_0_1.amountTitleX = 20
	var_0_1.amountTitleTop = 0
	var_0_1.amountTitleFontSize = 0
	var_0_1.comboOccupyCountLabelLeft = 0
	var_0_1.comboOccupyCountLabelTop = 0
	var_0_1.occupyCountLabelLeft = 0
	var_0_1.occupyCountLabelTop = 0
	var_0_1.occupyMostGeneralFntSize = 0
	var_0_1.occupyMostGeneralY = 0
elseif conf.language == "vie" then
	var_0_1.amountTitleX = 0
	var_0_1.amountTitleTop = -10
	var_0_1.amountTitleFontSize = -4
	var_0_1.comboOccupyCountLabelLeft = 14
	var_0_1.comboOccupyCountLabelTop = -4
	var_0_1.occupyCountLabelLeft = 14
	var_0_1.occupyCountLabelTop = -4
	var_0_1.occupyMostGeneralFntSize = -4
	var_0_1.occupyMostGeneralY = -6
else
	var_0_1.amountTitleX = 0
	var_0_1.amountTitleTop = 0
	var_0_1.amountTitleFontSize = 0
	var_0_1.comboOccupyCountLabelLeft = 0
	var_0_1.comboOccupyCountLabelTop = -4
	var_0_1.occupyCountLabelLeft = 0
	var_0_1.occupyCountLabelTop = 0
	var_0_1.occupyMostGeneralFntSize = 0
	var_0_1.occupyMostGeneralY = 0
end

function getTwoRankInfoData()
	return var_0_0
end

var_0_0.amountBackground = {
	y = 463,
	name = "amountBackground",
	z = 50,
	type = "pic",
	pic = "res/ui/rankInfo/twoRankInfo/amount_bg_dan.jpg",
	x = 480,
	children = {
		{
			x = 145,
			name = "rankTitlePic",
			y = 105,
			type = "pic",
			pic = "res/ui/rankInfo/twoRankInfo/titles/wumingxiaozu.png"
		},
		{
			fontSize = 24,
			name = "reachValueTitle",
			type = "label",
			anchorPointX = 0,
			width = 350,
			height = 0,
			text = "",
			y = 95,
			anchorPointY = 0.5,
			x = 255,
			color = ccc3(235, 209, 167)
		},
		{
			x = 385,
			y = 37,
			pic = "res/ui/rankInfo/twoRankInfo/rank_progress_bar_bg.jpg",
			type = "pic"
		},
		{
			x = 385,
			name = "amountProgressBar",
			y = 37,
			type = "process",
			pic = "res/ui/rankInfo/twoRankInfo/rank_progress_bar.jpg"
		},
		{
			fontSize = 30,
			name = "amountValueLabel",
			text = "0/0",
			type = "label",
			y = 39,
			x = 385
		}
	}
}
var_0_0.playerListBackground = {
	y = 192,
	name = "playerListBackground",
	pic = "res/ui/rankInfo/twoRankInfo/player_list_bg.jpg",
	type = "pic",
	x = 305,
	children = {
		{
			fontSize = 22,
			type = "label",
			top = 8,
			left = 25,
			text = language.get(113005),
			color = colorText[10002]
		},
		{
			fontSize = 22,
			type = "label",
			top = 8,
			left = 145,
			text = language.get(113006),
			color = colorText[10002]
		},
		{
			fontSize = 22,
			type = "label",
			top = 8,
			left = 295,
			text = language.get(113007),
			color = colorText[10002]
		},
		{
			name = "rankListAmountTitle",
			type = "label",
			height = 0,
			width = 160,
			text = language.get(113001),
			fontSize = 22 + var_0_1.amountTitleFontSize,
			left = 400 + var_0_1.amountTitleX,
			top = 8 + var_0_1.amountTitleTop,
			color = colorText[10002]
		}
	}
}

function getRankListInfoCellData(arg_2_0)
	local var_2_0 = colorText[10003]

	if arg_2_0.playerId == user.player.id then
		var_2_0 = ccc3(255, 190, 33)
	end

	return {
		height = 39,
		type = "layer_color",
		width = 558,
		color = ccc4(0, 0, 128, 0),
		children = {
			{
				fontSize = 22,
				type = "label",
				top = 5,
				x = 40,
				text = arg_2_0.rank,
				color = var_2_0
			},
			{
				fontSize = 22,
				type = "label",
				top = 5,
				x = 160,
				text = arg_2_0.playerName,
				color = var_2_0
			},
			{
				fontSize = 22,
				type = "label",
				top = 5,
				x = 310,
				text = arg_2_0.playerLv,
				color = var_2_0
			},
			{
				fontSize = 22,
				type = "label",
				top = 5,
				x = 455,
				text = arg_2_0.value,
				color = var_2_0
			}
		}
	}
end

var_0_0.playerListBackground2 = {
	y = 192,
	name = "playerListBackground2",
	pic = "res/ui/rankInfo/twoRankInfo/player_list_bg.jpg",
	type = "pic",
	x = 305,
	children = {
		{
			fontSize = 22,
			type = "label",
			top = 8,
			left = 25,
			text = language.get(113005),
			color = colorText[10002]
		},
		{
			fontSize = 22,
			type = "label",
			top = 8,
			left = 125,
			text = language.get(113006),
			color = colorText[10002]
		},
		{
			fontSize = 22,
			type = "label",
			top = 8,
			left = 225,
			text = language.get(113007),
			color = colorText[10002]
		},
		{
			name = "rankListAmountTitle",
			type = "label",
			height = 0,
			width = 130,
			text = language.get(113002),
			fontSize = 22 + var_0_1.amountTitleFontSize,
			left = 415 + var_0_1.comboOccupyCountLabelLeft,
			top = 8 + var_0_1.comboOccupyCountLabelTop,
			color = colorText[10002]
		},
		{
			name = "cityCombo",
			type = "label",
			height = 0,
			width = 130,
			text = language.get(113016),
			fontSize = 22 + var_0_1.amountTitleFontSize,
			left = 290 + var_0_1.occupyCountLabelLeft,
			top = 8 + var_0_1.occupyCountLabelTop,
			color = colorText[10002]
		}
	}
}

function getRankListInfoCellData2(arg_3_0)
	local var_3_0 = colorText[10003]

	if arg_3_0.playerId == user.player.id then
		var_3_0 = ccc3(255, 190, 33)
	end

	return {
		height = 39,
		type = "layer_color",
		width = 558,
		color = ccc4(0, 0, 128, 0),
		children = {
			{
				fontSize = 22,
				type = "label",
				top = 5,
				x = 40,
				text = arg_3_0.rank,
				color = var_3_0
			},
			{
				fontSize = 22,
				type = "label",
				top = 5,
				x = 140,
				text = arg_3_0.playerName,
				color = var_3_0
			},
			{
				fontSize = 22,
				type = "label",
				top = 5,
				x = 240,
				text = arg_3_0.playerLv,
				color = var_3_0
			},
			{
				fontSize = 22,
				type = "label",
				top = 5,
				x = 470,
				text = arg_3_0.value,
				color = var_3_0
			},
			{
				fontSize = 22,
				type = "label",
				top = 5,
				x = 330,
				text = arg_3_0.cityCombo,
				color = var_3_0
			}
		}
	}
end

var_0_0.rewardBackground = {
	y = 192,
	z = 100,
	pic = "res/ui/rankInfo/twoRankInfo/reward_panel_bg.jpg",
	type = "pic",
	x = 770,
	children = {
		{
			fontSize = 22,
			name = "rankRewardTitle",
			type = "label",
			top = 8,
			xcenter = 0,
			text = language.get(113008),
			color = colorText[10002]
		},
		{
			xcenter = 0,
			name = "rewardIcon",
			y = 205,
			type = "pic",
			pic = "res/ui/rankInfo/twoRankInfo/exp_reward_icon.jpg"
		},
		{
			fontSize = 30,
			name = "rankRewardNumber",
			text = "",
			type = "label",
			xcenter = 0,
			y = 140
		},
		{
			xcenter = 0,
			name = "rewardSplitPic",
			y = 100,
			type = "pic",
			pic = "res/ui/rankInfo/twoRankInfo/reward_panel_split.png"
		},
		{
			xcenter = 0,
			name = "rewardSplitPic2",
			y = 196,
			type = "pic",
			pic = "res/ui/rankInfo/twoRankInfo/reward_panel_split.png"
		},
		{
			xcenter = 0,
			name = "zhancheng",
			type = "label",
			height = 0,
			width = 270,
			text = language.get(113017),
			fontSize = 22 + var_0_1.occupyMostGeneralFntSize,
			align = kCCTextAlignmentCenter,
			top = 8 + var_0_1.occupyMostGeneralY,
			color = colorText[10002],
			align = kCCTextAlignmentLeft
		},
		{
			xcenter = 0,
			name = "allRewardReceivedLabel",
			visible = false,
			type = "label",
			fontSize = 30,
			y = 55,
			text = language.get(113009),
			align = kCCTextAlignmentCenter,
			color = ccc3(214, 85, 64)
		},
		{
			xcenter = 0,
			y = 55,
			type = "button",
			buttons = {
				{
					pic2 = "frame:btn3_gre_c.png",
					pic3 = "frame:btn3_gre_g.png",
					pic1 = "frame:btn3_gre_a.png",
					name = "getRewardButton",
					callBack = function()
						twoRankInfoUI.getRankReward()
					end
				}
			}
		},
		{
			fontSize = 22,
			name = "getRewardButtonLabel",
			type = "label",
			y = 55,
			xcenter = 0,
			text = language.get(113010),
			color = colorText[10004]
		},
		{
			xcenter = -95,
			name = "generalHead1",
			y = 244,
			type = "pic",
			pic = "res/ui/common/quailtyFrames/quality_frame_1.png",
			children = {
				{
					xcenter = 0,
					name = "head1",
					type = "pic",
					ycenter = 0,
					pic = "res/ui/common/generalPic/generalPic_0.jpg"
				},
				{
					xcenter = -30,
					ycenter = 30,
					pic = "res/ui/world/cityCombo/cclp_no_1.png",
					type = "pic"
				},
				{
					xcenter = 55,
					name = "zhanCheng1",
					type = "label",
					anchorPointX = 0,
					ycenter = -20,
					fontSize = 22,
					height = 0,
					width = 200,
					text = language.get(113018, 0),
					color = colorText[10004]
				},
				{
					fontSize = 22,
					name = "generalName1",
					text = "???",
					type = "label",
					ycenter = 20,
					xcenter = 55,
					anchorPointX = 0,
					color = colorText[10004]
				}
			}
		},
		{
			xcenter = -95,
			name = "generalHead2",
			y = 148,
			type = "pic",
			pic = "res/ui/common/quailtyFrames/quality_frame_1.png",
			children = {
				{
					xcenter = 0,
					name = "head2",
					type = "pic",
					ycenter = 0,
					pic = "res/ui/common/generalPic/generalPic_0.jpg"
				},
				{
					xcenter = -30,
					ycenter = 30,
					pic = "res/ui/world/cityCombo/cclp_no_2.png",
					type = "pic"
				},
				{
					xcenter = 55,
					name = "zhanCheng2",
					type = "label",
					anchorPointX = 0,
					ycenter = -20,
					fontSize = 22,
					height = 0,
					width = 200,
					text = language.get(113018, 0),
					color = colorText[10004]
				},
				{
					fontSize = 22,
					name = "generalName2",
					text = "???",
					type = "label",
					ycenter = 20,
					xcenter = 55,
					anchorPointX = 0,
					color = colorText[10004]
				}
			}
		},
		{
			xcenter = -95,
			name = "generalHead3",
			y = 52,
			type = "pic",
			pic = "res/ui/common/quailtyFrames/quality_frame_1.png",
			children = {
				{
					xcenter = 0,
					name = "head3",
					type = "pic",
					ycenter = 0,
					pic = "res/ui/common/generalPic/generalPic_0.jpg"
				},
				{
					xcenter = -30,
					ycenter = 30,
					pic = "res/ui/world/cityCombo/cclp_no_3.png",
					type = "pic"
				},
				{
					xcenter = 55,
					name = "zhanCheng3",
					type = "label",
					anchorPointX = 0,
					ycenter = -20,
					fontSize = 22,
					height = 0,
					width = 200,
					text = language.get(113018, 0),
					color = colorText[10004]
				},
				{
					fontSize = 22,
					name = "generalName3",
					text = "???",
					type = "label",
					ycenter = 20,
					xcenter = 55,
					anchorPointX = 0,
					color = colorText[10004]
				}
			}
		}
	}
}
