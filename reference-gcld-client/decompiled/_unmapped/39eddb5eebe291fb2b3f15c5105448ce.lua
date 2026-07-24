local var_0_0 = {}
local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.cityNameX = -24
	var_0_1.totalLabelX = 0
	var_0_1.totalLabelY = -20
elseif conf.languge == "kr" then
	var_0_1.cityNameX = 0
	var_0_1.totalLabelX = 8
	var_0_1.totalLabelY = 0
else
	var_0_1.cityNameX = 0
	var_0_1.totalLabelX = 0
	var_0_1.totalLabelY = 0
end

var_0_0.thumbnailButton = {
	type = "pic",
	top = 43,
	pic = "frame:thumbnailClose.png",
	right = 8,
	children = {
		{
			left = -15,
			name = "eventNumCor",
			type = "pic",
			top = -15,
			pic = "res/ui/noticeIcon/icon_number_view.png",
			children = {
				{
					xcenter = 0,
					height = 21,
					name = "eventNum",
					type = "atlas",
					ycenter = 0,
					pic = "res/ui/common/number/up_numb.png",
					text = "1",
					startChar = 48,
					width = 16
				}
			}
		},
		{
			visible = false,
			name = "leagueInfo",
			type = "pic",
			top = -10,
			pic = "res/ui/world/league/league_1_2_flag.png",
			right = -10
		}
	}
}

function getUiData()
	return var_0_0
end

local var_0_2 = {
	thumbnailBackground = {
		xcenter = 0,
		ycenter = 0,
		pic = "frame:thumbnailBackground.jpg",
		type = "pic"
	},
	thumbnail = {
		xcenter = 35,
		ycenter = 0,
		pic = "frame:thumbnailXiaoditu.jpg",
		type = "pic"
	},
	leagueSprite = {
		xcenter = -390,
		ycenter = 185,
		visible = false,
		type = "pic"
	}
}

function getBatchNodeData()
	var_0_2.leagueSprite.pic = "frame:thumbnailSanguo.png"

	if worldControl.league then
		if worldControl.league.type == 1 then
			if worldControl.league.first == 1 then
				var_0_2.leagueSprite.pic = "frame:thumbnailShuwu.png"
			elseif worldControl.league.first == 2 then
				var_0_2.leagueSprite.pic = "frame:thumbnailWuwei.png"
			elseif worldControl.league.first == 3 then
				var_0_2.leagueSprite.pic = "frame:thumbnailShuwei.png"
			end
		elseif worldControl.league.type == 2 then
			if worldControl.league.third == 1 then
				var_0_2.leagueSprite.pic = "frame:jm_tit_zb03.png"
			elseif worldControl.league.third == 2 then
				var_0_2.leagueSprite.pic = "frame:jm_tit_zb02.png"
			elseif worldControl.league.third == 3 then
				var_0_2.leagueSprite.pic = "frame:jm_tit_zb01.png"
			end
		end
	end

	return var_0_2
end

local var_0_3 = {
	nationInfoLabel = {
		text = "",
		fontSize = 24,
		type = "label",
		width = 170,
		ycenter = 142,
		align = kCCTextAlignmentLeft,
		color = colorText[10002],
		xcenter = -354 + var_0_1.cityNameX
	},
	cityPic = {
		xcenter = -388,
		ycenter = 70,
		pic = "frame:icon_world_city.png",
		type = "pic"
	},
	cityNum = {
		text = "×10",
		fontSize = 26,
		xcenter = -363,
		type = "label",
		ycenter = 45,
		color = ccc3(238, 216, 91)
	},
	nextLabel = {
		fontSize = 22,
		xcenter = -384,
		type = "label",
		width = 170,
		ycenter = 3,
		text = language.get(200701),
		color = colorText[10002],
		align = kCCTextAlignmentLeft
	},
	totalLabel = {
		fontSize = 22,
		type = "label",
		text = "0/24",
		visible = false,
		width = 170,
		color = colorText[10002],
		align = kCCTextAlignmentLeft,
		xcenter = -284 + var_0_1.totalLabelX,
		ycenter = 3 + var_0_1.totalLabelY
	},
	rewardSilver = {
		xcenter = -433,
		scale = 0.9,
		visible = false,
		type = "pic",
		ycenter = -72,
		pic = "frame:jianglikuang.png",
		children = {
			{
				x = 39.5,
				y = 39.5,
				pic = "res/ui/task/get_icon_silver.png",
				type = "pic"
			},
			{
				x = 39.5,
				y = 14.5,
				pic = "res/ui/task/get_rewa_silver.png",
				type = "pic"
			},
			{
				fontSize = 22,
				name = "rewardSilverNum",
				text = "0",
				type = "label",
				y = -13.5,
				x = 39.5,
				color = ccc3(255, 255, 255)
			}
		}
	},
	rewardIron = {
		xcenter = -343,
		scale = 0.9,
		visible = false,
		type = "pic",
		ycenter = -72,
		pic = "frame:jianglikuang.png",
		children = {
			{
				x = 39.5,
				y = 39.5,
				pic = "res/ui/task/get_icon_iron.png",
				type = "pic"
			},
			{
				x = 39.5,
				y = 14.5,
				pic = "res/ui/task/get_rewa_iron.png",
				type = "pic"
			},
			{
				fontSize = 22,
				name = "rewardIronNum",
				text = "0",
				type = "label",
				y = -13.5,
				x = 39.5,
				color = ccc3(255, 255, 255)
			}
		}
	},
	drawMenu = {
		type = "button",
		buttons = {
			{
				xcenter = -384,
				name = "drawButton",
				pic1 = "frame:thumbnailLingqu.png",
				pic2 = "frame:thumbnailLingqu1.png",
				ycenter = -177
			}
		}
	},
	drawLabel = {
		xcenter = -384,
		z = 101,
		fontSize = 20,
		type = "label",
		ycenter = -176,
		strokeSize = 2,
		text = language.get(200702),
		color = colorText[10004],
		strokeColor = colorText[10005]
	},
	leagueLabel = {
		xcenter = -390,
		z = 101,
		fontSize = 25,
		type = "label",
		ycenter = 185,
		text = "",
		strokeSize = 2,
		color = colorText[10004],
		strokeColor = colorText[10005]
	}
}

function getOtherData()
	var_0_3.nationInfoLabel.text = language.get(200706, user.forceIdToName[user.player.forceId])
	var_0_3.cityNum.text = "×" .. worldControl.cityNum
	var_0_3.totalLabel.text = worldControl.rewardNum .. "/" .. worldControl.maxNum

	local var_3_0 = language.get(200707)
	local var_3_1 = colorQuality[2]

	if worldControl.league then
		if worldControl.league.type == 1 then
			var_3_1 = colorQuality[5]

			local var_3_2 = {}

			for iter_3_0 = 1, 3 do
				if iter_3_0 ~= worldControl.league.first then
					table.insert(var_3_2, user.forceIdToName[iter_3_0])
				end
			end

			log.info("zhu@@@force", worldControl.league.first)
			showTable(user.forceIdToName)
			showTable(var_3_2)

			var_3_0 = language.get(200708, var_3_2[1], var_3_2[2])
		elseif worldControl.league.type == 2 then
			var_3_1 = colorQuality[6]

			local var_3_3 = {}

			for iter_3_1 = 1, 3 do
				if iter_3_1 ~= worldControl.league.third then
					table.insert(var_3_3, user.forceIdToName[iter_3_1])
				end
			end

			var_3_0 = language.get(200709, var_3_3[1], var_3_3[2])
		end
	end

	var_0_3.leagueLabel.text = var_3_0
	var_0_3.leagueLabel.color = var_3_1

	return var_0_3
end
