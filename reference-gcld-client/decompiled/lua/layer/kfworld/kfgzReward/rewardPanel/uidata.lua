local var_0_0 = {}

local function var_0_1(arg_1_0, arg_1_1)
	arg_1_0[#arg_1_0 + 1] = arg_1_1

	return arg_1_1
end

function var_0_0.getUiData()
	local var_2_0 = {}

	if conf.language == "kr" then
		var_2_0.occupyCityNumX = 30
	elseif conf.language == "vie" then
		var_2_0.occupyCityNumX = 30
	else
		var_2_0.occupyCityNumX = 0
	end

	local var_2_1 = {
		background = {
			xcenter = 0,
			type = "pic",
			ycenter = -30,
			pic = "res/ui/kfworld/reward/kfgz_qg_view.jpg",
			children = {}
		}
	}

	var_0_1(var_2_1.background.children, {
		xcenter = -20,
		top = 10,
		pic = "res/ui/kfworld/reward/kfgz_qg_icon_zzc.png",
		type = "pic"
	})
	var_0_1(var_2_1.background.children, {
		height = 46,
		name = "occupyCity",
		type = "atlas",
		top = 23,
		pic = "res/ui/common/number/get_numb.png",
		text = "10",
		startChar = 48,
		width = 29,
		xcenter = 80 + var_2_0.occupyCityNumX
	})
	var_0_1(var_2_1.background.children, {
		name = "serverName",
		type = "label",
		anchorPointX = 0,
		fontSize = 24,
		x = 5,
		top = 10,
		text = "傲世堂123服",
		strokeSize = 2,
		color = ccc3(235, 209, 167),
		strokeColor = ccc3(22, 18, 13)
	})
	var_0_1(var_2_1.background.children, {
		name = "pos",
		type = "label",
		anchorPointX = 0,
		fontSize = 24,
		x = 5,
		top = 40,
		strokeSize = 2,
		text = language.get(430011, language.get(430012), 1),
		color = ccc3(235, 209, 167),
		strokeColor = ccc3(22, 18, 13)
	})

	local var_2_2 = var_0_1(var_2_1.background.children, {
		xcenter = 0,
		y = 405,
		type = "pic",
		pic = "res/ui/activity/ironReward/btjs_degr_view_bg.png",
		children = {}
	})
	local var_2_3 = var_0_1(var_2_2.children, {
		xcenter = 0,
		name = "progress",
		percentage = 20,
		type = "process",
		ycenter = 0,
		pic = "res/ui/activity/ironReward/btjs_degr_con.png",
		children = {}
	})
	local var_2_4 = var_0_1(var_2_3.children, {
		type = "button",
		buttons = {}
	})

	for iter_2_0 = 1, 3 do
		var_0_1(var_2_3.children, {
			ycenter = 0,
			pic = "res/ui/activity/ironReward/btjs_degr_con_div.png",
			type = "pic",
			x = 197.5 * iter_2_0
		})
	end

	for iter_2_1 = 1, 4 do
		var_0_1(var_2_3.children, {
			strokeSize = 2,
			type = "label",
			ycenter = 30,
			fontSize = 24,
			text = "15",
			name = "cityNum_" .. iter_2_1,
			color = ccc3(235, 209, 167),
			strokeColor = ccc3(22, 18, 13),
			x = 197.5 * iter_2_1
		})
		var_0_1(var_2_4.buttons, {
			pic2 = "res/ui/kfworld/reward/kfgz_qg_bx_icon_c.png",
			pic3 = "res/ui/kfworld/reward/kfgz_qg_bx_icon_h.png",
			pic1 = "res/ui/kfworld/reward/kfgz_qg_bx_icon_a.png",
			y = -41.5,
			name = "box_" .. iter_2_1,
			x = 197.5 * iter_2_1
		})
		var_0_1(var_2_3.children, {
			type = "pic",
			ycenter = -92,
			pic = "res/ui/playerInfo/icon_gold.png",
			name = "gold_" .. iter_2_1,
			x = 197.5 * iter_2_1 - 20
		})
		var_0_1(var_2_3.children, {
			strokeSize = 2,
			type = "label",
			ycenter = -92,
			fontSize = 24,
			text = "10",
			name = "goldNum_" .. iter_2_1,
			color = ccc3(235, 209, 167),
			strokeColor = ccc3(22, 18, 13),
			x = 197.5 * iter_2_1 + 20
		})
	end

	return var_2_1
end

local var_0_2 = {
	language.get(430006),
	language.get(430007),
	language.get(430008)
}

function var_0_0.getLeftBoard()
	local var_3_0 = {}

	for iter_3_0 = 1, 3 do
		var_3_0["board_" .. iter_3_0] = {
			x = 265.5,
			type = "pic",
			pic = "res/ui/kfworld/reward/kfgz_qg_view_up_l.jpg",
			y = 246 * (3.5 - iter_3_0),
			children = {}
		}

		var_0_1(var_3_0["board_" .. iter_3_0].children, {
			type = "label",
			strokeSize = 2,
			anchorPointX = 0,
			fontSize = 22,
			top = 5,
			x = 5,
			text = var_0_2[iter_3_0],
			color = ccc3(235, 209, 167),
			strokeColor = ccc3(22, 18, 13)
		})
		var_0_1(var_3_0["board_" .. iter_3_0].children, {
			strokeSize = 2,
			type = "label",
			fontSize = 22,
			anchorPointX = 1,
			x = 515,
			text = "傲世堂123服-魏国",
			top = 5,
			width = 400,
			name = "serverName_" .. iter_3_0,
			color = ccc3(235, 209, 167),
			strokeColor = ccc3(22, 18, 13),
			align = kCCTextAlignmentRight
		})
		var_0_1(var_3_0["board_" .. iter_3_0].children, {
			type = "label",
			anchorPointX = 0,
			fontSize = 22,
			x = 165,
			text = "玩家名字七个字",
			y = 180,
			strokeSize = 2,
			name = "playerName_" .. iter_3_0,
			color = ccc3(235, 209, 167),
			strokeColor = ccc3(22, 18, 13)
		})
		var_0_1(var_3_0["board_" .. iter_3_0].children, {
			type = "label",
			anchorPointX = 0,
			fontSize = 22,
			x = 165,
			text = "杀敌总数:1234567890",
			y = 130,
			strokeSize = 2,
			name = "desc_" .. iter_3_0,
			color = ccc3(235, 209, 167),
			strokeColor = ccc3(22, 18, 13)
		})
		var_0_1(var_3_0["board_" .. iter_3_0].children, {
			y = 150,
			left = 20,
			type = "pic",
			pic = "res/ui/nation/assa_player_view_bg.jpg",
			children = {
				{
					xcenter = 0,
					ycenter = 0,
					pic = "res/ui/common/playerHead/playerHead_icon_1.png",
					type = "pic"
				}
			}
		})

		for iter_3_1 = 1, 5 do
			var_0_1(var_3_0["board_" .. iter_3_0].children, {
				down = 12,
				type = "pic",
				pic = "res/ui/kfworld/reward/assa_general_view.png",
				name = "headBg_" .. iter_3_0 .. "_" .. iter_3_1,
				left = 20 + 105 * (iter_3_1 - 1),
				children = {
					{
						xcenter = 0,
						type = "pic",
						ycenter = 0,
						pic = "res/ui/common/generalPic/generalPic_0.jpg",
						name = "head_" .. iter_3_0 .. "_" .. iter_3_1
					},
					{
						fontSize = 22,
						text = "Lv:0",
						type = "label",
						y = 15,
						x = 42,
						name = "lv_" .. iter_3_0 .. "_" .. iter_3_1
					}
				}
			})
		end
	end

	return var_3_0
end

local var_0_3 = {
	language.get(430009),
	language.get(430010)
}

function var_0_0.getRightBoard()
	local var_4_0 = {}

	for iter_4_0 = 1, 2 do
		var_4_0["board_" .. iter_4_0] = {
			x = 171.5,
			type = "pic",
			pic = "res/ui/kfworld/reward/kfgz_qg_view_up_r.jpg",
			y = 221 * (2.5 - iter_4_0),
			children = {}
		}

		var_0_1(var_4_0["board_" .. iter_4_0].children, {
			type = "label",
			strokeSize = 2,
			anchorPointX = 0,
			fontSize = 22,
			top = 5,
			x = 5,
			text = var_0_3[iter_4_0],
			color = ccc3(235, 209, 167),
			strokeColor = ccc3(22, 18, 13)
		})

		for iter_4_1 = 1, 2 do
			var_0_1(var_4_0["board_" .. iter_4_0].children, {
				type = "label",
				anchorPointX = 0,
				fontSize = 22,
				x = 77,
				text = "傲世堂123服-魏国",
				strokeSize = 2,
				name = "serverName_" .. iter_4_0 .. "_" .. iter_4_1,
				color = ccc3(235, 209, 167),
				strokeColor = ccc3(22, 18, 13),
				y = 150 - 90 * (iter_4_1 - 1)
			})
			var_0_1(var_4_0["board_" .. iter_4_0].children, {
				x = 100,
				type = "pic",
				pic = "res/ui/kfworld/reward/kfgz_qg_icon_cheng.png",
				name = "cityIcon_" .. iter_4_0 .. "_" .. iter_4_1,
				y = 120 - 90 * (iter_4_1 - 1),
				children = {
					{
						type = "label",
						anchorPointX = 0,
						ycenter = 0,
						x = 50,
						fontSize = 22,
						text = "×15",
						strokeSize = 2,
						name = "num_" .. iter_4_0 .. "_" .. iter_4_1,
						color = ccc3(235, 209, 167),
						strokeColor = ccc3(22, 18, 13)
					}
				}
			})
		end
	end

	return var_4_0
end

return var_0_0
