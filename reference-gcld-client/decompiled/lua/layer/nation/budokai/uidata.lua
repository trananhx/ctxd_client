local var_0_0 = class("budokaiUiData")
local var_0_1 = {}

if conf.language == "kr" then
	var_0_1.winLoseFontSize = -3
	var_0_1.winLoseLabelStep = 2
	var_0_1.budokaiScoreX = 0
	var_0_1.budokaiWinX = 0
	var_0_1.budokaiRankX = 0
	var_0_1.budokaiLoseX = 0
elseif conf.language == "vie" then
	var_0_1.winLoseFontSize = 0
	var_0_1.winLoseLabelStep = 0
	var_0_1.budokaiScoreX = 40
	var_0_1.budokaiWinX = 40
	var_0_1.budokaiRankX = 40
	var_0_1.budokaiLoseX = 40
else
	var_0_1.winLoseFontSize = 0
	var_0_1.winLoseLabelStep = 0
	var_0_1.budokaiScoreX = 0
	var_0_1.budokaiWinX = 0
	var_0_1.budokaiRankX = 0
	var_0_1.budokaiLoseX = 0
end

function var_0_0.ctor(arg_1_0)
	local function var_1_0(arg_2_0, arg_2_1)
		arg_2_0[#arg_2_0 + 1] = arg_2_1

		return arg_2_1
	end

	arg_1_0.data = {}
	arg_1_0.data.background = {
		xcenter = 0,
		type = "pic",
		ycenter = -20,
		pic = "res/ui/nation/assa_view_bg.jpg",
		children = {}
	}

	var_1_0(arg_1_0.data.background.children, {
		y = 450,
		x = 164,
		type = "pic",
		pic = "frame:assa_player_view_bg.png",
		children = {
			{
				x = 50,
				name = "budokaiPlayerHead",
				y = 50,
				type = "pic",
				pic = "res/ui/nation/assa_general_view_emp.jpg"
			}
		}
	})
	var_1_0(arg_1_0.data.background.children, {
		x = 336,
		y = 450,
		pic = "frame:assa_vs.png",
		type = "pic"
	})

	for iter_1_0 = 1, 4 do
		var_1_0(arg_1_0.data.background.children, {
			y = 450,
			type = "pic",
			visible = false,
			pic = "frame:assa_general_view.png",
			name = "budokaiEnemyGeneral_" .. iter_1_0,
			x = 445 + (iter_1_0 - 1) * 120,
			children = {
				{
					x = 42,
					y = 42,
					type = "pic",
					pic = "frame:assa_general_view_emp.png",
					name = "budokaiEnemyGeneralHead_" .. iter_1_0
				},
				{
					fontSize = 22,
					text = "Lv:0",
					type = "label",
					visible = false,
					y = 15,
					x = 42,
					name = "budokaiEnemyGeneralLevel_" .. iter_1_0
				}
			}
		})
	end

	var_1_0(arg_1_0.data.background.children, {
		x = 625,
		name = "budokaiChoose",
		y = 450,
		type = "pic",
		pic = "frame:assa_choo_tit.png"
	})
	var_1_0(arg_1_0.data.background.children, {
		fontSize = 22,
		y = 369,
		type = "label",
		x = 53,
		text = language.get(93008),
		children = {
			{
				fontSize = 22,
				name = "budokaiScore",
				text = "0",
				type = "label",
				width = 100,
				y = 0,
				align = kCCTextAlignmentLeft,
				x = 80 + var_0_1.budokaiScoreX
			}
		}
	})
	var_1_0(arg_1_0.data.background.children, {
		fontSize = 22,
		y = 369,
		type = "label",
		x = 192,
		text = language.get(93009),
		children = {
			{
				fontSize = 22,
				name = "budokaiWin",
				width = 100,
				type = "label",
				text = "0",
				y = 0,
				color = ccc3(255, 0, 0),
				align = kCCTextAlignmentLeft,
				x = 80 + var_0_1.budokaiWinX
			}
		}
	})
	var_1_0(arg_1_0.data.background.children, {
		fontSize = 22,
		y = 330,
		type = "label",
		x = 53,
		text = language.get(93010),
		children = {
			{
				fontSize = 22,
				name = "budokaiRank",
				text = "0",
				type = "label",
				width = 100,
				y = 0,
				align = kCCTextAlignmentLeft,
				x = 80 + var_0_1.budokaiRankX
			}
		}
	})
	var_1_0(arg_1_0.data.background.children, {
		fontSize = 22,
		y = 330,
		type = "label",
		x = 192,
		text = language.get(93011),
		children = {
			{
				fontSize = 22,
				name = "budokaiLose",
				width = 100,
				type = "label",
				text = "0",
				y = 0,
				color = ccc3(0, 255, 0),
				align = kCCTextAlignmentLeft,
				x = 80 + var_0_1.budokaiLoseX
			}
		}
	})
	var_1_0(arg_1_0.data.background.children, {
		fontSize = 24,
		y = 280,
		type = "label",
		x = 164,
		text = language.get(93012)
	})

	for iter_1_1 = 1, 6 do
		var_1_0(arg_1_0.data.background.children, {
			height = 0,
			anchorPointX = 0,
			type = "label",
			x = 27,
			text = "",
			width = 290,
			name = "budokaiRecord_" .. iter_1_1,
			fontSize = 18 + var_0_1.winLoseFontSize,
			align = kCCTextAlignmentLeft,
			y = 230 - (iter_1_1 - 1) * (40 + var_0_1.winLoseLabelStep)
		})
	end

	for iter_1_2 = 1, 3 do
		var_1_0(arg_1_0.data.background.children, {
			y = 222,
			type = "pic",
			visible = false,
			pic = "frame:assa_player_list_bg.png",
			name = "budokaiPlayerCard_" .. iter_1_2,
			x = 450 + (iter_1_2 - 1) * 174,
			children = {
				{
					x = 82.5,
					y = 127.5,
					type = "pic",
					visible = false,
					pic = "frame:assa_player_list_lig.png",
					name = "budokaiPlayerHighlight_" .. iter_1_2
				},
				{
					fontSize = 22,
					text = "",
					type = "label",
					y = 220,
					x = 82,
					name = "budokaiPlayerName_" .. iter_1_2
				},
				{
					y = 137,
					x = 82,
					type = "pic",
					pic = "res/ui/nation/assa_player_view_bg.jpg",
					children = {
						{
							x = 50,
							y = 50,
							type = "pic",
							pic = "frame:assa_general_view_emp.png",
							name = "budokaiEnemyHead_" .. iter_1_2
						},
						{
							y = 92,
							x = 0,
							type = "pic",
							pic = "frame:guojia_di.png",
							children = {
								{
									xcenter = 0,
									fontSize = 25,
									type = "label",
									ycenter = 0,
									name = "budokaiEnemyForce_" .. iter_1_2
								}
							}
						}
					}
				},
				{
					x = 54,
					y = 37,
					pic = "frame:res_plus.png",
					type = "pic"
				},
				{
					width = 20,
					height = 22,
					type = "atlas",
					pic = "res/ui/common/number/resou_up_numb.png",
					y = 37,
					startChar = 48,
					x = 95,
					name = "budokaiEnemyScore_" .. iter_1_2,
					text = (function()
						if iter_1_2 == 1 then
							return "10"
						elseif iter_1_2 == 2 then
							return "15"
						else
							return "25"
						end
					end)()
				}
			}
		})
	end

	var_1_0(arg_1_0.data.background.children, {
		x = 627,
		name = "budokaiFighting",
		y = 231,
		type = "pic",
		visible = false,
		pic = "frame:assa_flighting.png",
		children = {
			{
				fontSize = 24,
				name = "budokaiEnemyName",
				text = "xxx",
				type = "label",
				y = 60,
				x = 211
			}
		}
	})
	var_1_0(arg_1_0.data.background.children, {
		type = "button",
		buttons = {
			{
				pic2 = "frame:assa_btn_green_a.png",
				name = "budokaiStart",
				pic1 = "frame:assa_btn_green_hover.png",
				y = 58,
				x = 624,
				children = {
					{
						fontSize = 24,
						name = "budokaiButtonLabel",
						type = "label",
						ycenter = 0,
						xcenter = 0,
						text = language.get(93013)
					}
				}
			}
		}
	})
end

function var_0_0.getData(arg_4_0)
	return arg_4_0.data or {}
end

return var_0_0
