local var_0_0 = {
	rankPanel = {
		height = 177,
		name = "rankPanel",
		top = 250,
		type = "layer_color",
		width = 79,
		color = ccc4(0, 0, 128, 0),
		right = 50 + platform.getSafeDistance(),
		children = {
			{
				xcenter = 0,
				name = "rankFlag",
				visible = false,
				type = "pic",
				ycenter = 0,
				pic = "res/ui/world/hourRank/rank_view_" .. user.player.forceId .. ".png",
				children = {
					{
						xcenter = 0,
						height = 26,
						name = "rankValueAtlas",
						type = "atlas",
						ycenter = 75,
						pic = "res/ui/world/hourRank/rank_numb.png",
						text = "0",
						startChar = 48,
						width = 20
					},
					{
						xcenter = 20,
						name = "rankTitlePlus",
						type = "pic",
						ycenter = 75,
						pic = "res/ui/world/hourRank/rank_numb_plus.png"
					},
					{
						xcenter = 0,
						name = "rankTitlePic",
						type = "pic",
						ycenter = 0,
						pic = "res/ui/world/hourRank/rank_name_none.png"
					}
				}
			},
			{
				xcenter = 0,
				ycenter = 0,
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/world/hourRank/rank_reward_view.png",
						name = "rankRewardButton",
						pic1 = "res/ui/world/hourRank/rank_reward_view_lig.png",
						visible = false,
						children = {
							{
								xcenter = 0,
								ycenter = 5,
								pic = "res/ui/task/get_icon_food.png",
								type = "pic"
							},
							{
								xcenter = 0,
								ycenter = -15,
								pic = "res/ui/world/hourRank/rank_reward_draw.png",
								type = "pic"
							}
						},
						callBack = function()
							hourRankUI.rankRewardButtonTap()
						end
					}
				}
			}
		}
	}
}

local function var_0_1(arg_2_0)
	if arg_2_0 > 100000 then
		return math.floor(arg_2_0 / 10000) .. "万"
	else
		return tostring(arg_2_0)
	end
end

function getRankTipsData(arg_3_0)
	local var_3_0 = {
		nextKillNumLabel = {
			down = 45,
			fontSize = 22,
			type = "label",
			width = 200,
			left = 15,
			text = language.get(200601, tool.getFormatNum(arg_3_0.nextKillNum)),
			align = kCCTextAlignmentLeft
		},
		nextTitleTextLabel = {
			down = 15,
			fontSize = 22,
			type = "label",
			width = 200,
			left = 15,
			text = language.get(200602),
			align = kCCTextAlignmentLeft
		}
	}
	local var_3_1 = arg_3_0.nextTitle
	local var_3_2 = arg_3_0.titleName
	local var_3_3 = arg_3_0.title
	local var_3_4

	if var_3_3 == "sanguoshenjiang" then
		var_3_1 = ""

		if arg_3_0.rank == 1 then
			var_3_0.nextKillNumLabel = nil
			var_3_0.nextTitleTextLabel.text = language.get(200603)
			var_3_0.nextTitleTextLabel.down = 30
		else
			var_3_0.nextTitleTextLabel.text = language.get(200604)
		end
	elseif var_3_3 == "shadimengjiang" then
		var_3_4 = ccc3(209, 111, 242)
	elseif var_3_3 == "bingduojiangguang" then
		var_3_4 = ccc3(253, 98, 98)
	elseif var_3_3 == "zhengzhansifang" then
		var_3_4 = ccc3(255, 189, 66)
	elseif var_3_3 == "chongfengxianzhen" then
		var_3_4 = ccc3(114, 223, 55)
	else
		var_3_4 = ccc3(255, 255, 255)
	end

	return {
		name = "hourRankTipFrame",
		z = 101,
		anchorPointX = 1,
		type = "pic_9",
		pic = "frame:common_tip_frame_small.png",
		anchorPointY = 0.5,
		middleRect = CCRectMake(8, 8, 33, 33),
		preferedSize = CCSizeMake(250, 160),
		children = {
			{
				top = 15,
				fontSize = 22,
				type = "label",
				left = 15,
				width = 200,
				text = language.get(200605),
				color = colorText[10002],
				align = kCCTextAlignmentLeft
			},
			{
				height = 30,
				name = "rankTipsTimerLabelPanel",
				anchorPointX = 0.5,
				type = "layer_color",
				anchorPointY = 0.5,
				width = 250,
				top = 65,
				color = ccc4(0, 0, 128, 0)
			},
			var_3_0.nextKillNumLabel,
			var_3_0.nextTitleTextLabel,
			{
				down = 15,
				fontSize = 22,
				type = "label",
				left = 115,
				width = 200,
				text = var_3_1,
				color = var_3_4,
				align = kCCTextAlignmentLeft
			}
		}
	}
end

function getHourRankUiData()
	return var_0_0
end
