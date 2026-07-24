local var_0_0 = require("res/native/offset").get("layer.rankInfo.workerList")

function getWorkerListUIData()
	return {
		BuildTechBackground = {
			anchorPointX = 0,
			name = "BuildTechViewBackground",
			x = 22.5,
			type = "pic",
			y = 30,
			anchorPointY = 0,
			pic = "res/ui/technology/buildTech/jzkj_bg.jpg",
			children = {
				{
					height = 521,
					name = "oneTechPanel",
					x = 0,
					type = "layer_color",
					y = 0,
					width = 915,
					color = ccc4(0, 0, 255, 0),
					children = {
						{
							x = 457,
							y = 477,
							pic = "res/ui/rankInfo/workerList/jzke_title_gjmc.png",
							type = "pic"
						},
						{
							type = "button",
							buttons = {
								{
									pic2 = "res/ui/rankInfo/workerList/jzke_btn_jzkj_c.png",
									name = "btn_open",
									pic1 = "res/ui/rankInfo/workerList/jzke_btn_jzkj.png",
									y = 407,
									x = 845
								}
							}
						},
						{
							y = 357,
							x = 457,
							type = "pic",
							pic = "res/ui/rankInfo/workerList/jzke_gjmc_list_up.png",
							children = {
								{
									ycenter = 0,
									x = 220,
									pic = "res/ui/rankInfo/workerList/jzke_gjmc_list_line.png",
									type = "pic"
								},
								{
									ycenter = 0,
									x = 360,
									pic = "res/ui/rankInfo/workerList/jzke_gjmc_list_line.png",
									type = "pic"
								},
								{
									ycenter = 0,
									x = 540,
									pic = "res/ui/rankInfo/workerList/jzke_gjmc_list_line.png",
									type = "pic"
								},
								{
									ycenter = 0,
									x = 720,
									pic = "res/ui/rankInfo/workerList/jzke_gjmc_list_line.png",
									type = "pic"
								},
								{
									fontSize = 22,
									ycenter = 0,
									type = "label",
									strokeSize = 1,
									x = 110,
									text = language.get("222024_buildingTech"),
									color = ccc3(204, 185, 134),
									strokeColor = ccc3(17, 22, 14)
								},
								{
									fontSize = 22,
									ycenter = 0,
									type = "label",
									strokeSize = 1,
									x = 290,
									text = language.get("222025_buildingTech"),
									color = ccc3(204, 185, 134),
									strokeColor = ccc3(17, 22, 14)
								},
								{
									fontSize = 22,
									name = "baseTechNum",
									x = 450,
									type = "label",
									ycenter = 0,
									strokeSize = 1,
									text = language.get("222022_buildingTech", 0),
									color = ccc3(204, 185, 134),
									strokeColor = ccc3(17, 22, 14)
								},
								{
									fontSize = 22,
									name = "armyTechNum",
									x = 630,
									type = "label",
									ycenter = 0,
									strokeSize = 1,
									text = language.get("222021_buildingTech", 0),
									color = ccc3(204, 185, 134),
									strokeColor = ccc3(17, 22, 14)
								},
								{
									fontSize = 22,
									name = "deathTechNum",
									x = 810,
									type = "label",
									ycenter = 0,
									strokeSize = 1,
									text = language.get(491070, 0),
									color = ccc3(204, 185, 134),
									strokeColor = ccc3(17, 22, 14)
								}
							}
						},
						{
							x = 71,
							name = "mujiang",
							y = 412,
							type = "pic",
							z = 208,
							pic = "frame:tavern_yeqian1_normal.png",
							children = {
								{
									xcenter = -10,
									font = "Thonburi-Bold",
									fontSize = 28,
									type = "label",
									ycenter = 0,
									text = language.get("222020_buildingTech"),
									color = ccc3(255, 255, 255)
								}
							}
						},
						{
							x = 190,
							name = "tiejiang",
							y = 412,
							type = "pic",
							z = 211,
							pic = "frame:tavern_yeqian1_light.png",
							children = {
								{
									name = "light_button_name",
									fontSize = 28,
									type = "label",
									ycenter = 0,
									xcenter = -10,
									font = "Thonburi-Bold",
									text = language.get("222019_buildingTech"),
									color = ccc3(255, 255, 255)
								}
							}
						}
					}
				}
			}
		}
	}
end

function getWorkerListInfoCellData(arg_2_0)
	local var_2_0 = ccc3(255, 248, 197)
	local var_2_1 = language.get("222023_buildingTech")
	local var_2_2 = language.get("222023_buildingTech")
	local var_2_3 = language.get("222023_buildingTech")
	local var_2_4 = ccc3(255, 34, 34)
	local var_2_5 = ccc3(255, 34, 34)
	local var_2_6 = ccc3(255, 34, 34)

	if arg_2_0.baseOpen == true then
		var_2_1 = language.get("222016_buildingTech")
		var_2_4 = ccc3(114, 223, 55)
	elseif arg_2_0.baseOpen == nil then
		var_2_1 = ""
	end

	if arg_2_0.armyOpen == true then
		var_2_2 = language.get("222016_buildingTech")
		var_2_5 = ccc3(114, 223, 55)
	elseif arg_2_0.armyOpen == nil then
		var_2_2 = ""
	end

	if arg_2_0.deathOpen == true then
		var_2_3 = language.get("222016_buildingTech")
		var_2_6 = ccc3(114, 223, 55)
	elseif arg_2_0.armyOpen == nil then
		var_2_3 = ""
	end

	return {
		height = 40,
		type = "layer_color",
		width = 905,
		color = ccc4(0, 0, 128, 0),
		children = {
			{
				fontSize = 22,
				type = "label",
				top = 5,
				x = 110,
				text = arg_2_0.name,
				color = var_2_0
			},
			{
				fontSize = 22,
				type = "label",
				top = 5,
				x = 290,
				text = arg_2_0.lv,
				color = var_2_0
			},
			{
				fontSize = 22,
				type = "label",
				top = 5,
				x = 450,
				text = var_2_1,
				color = var_2_4
			},
			{
				fontSize = 22,
				type = "label",
				top = 5,
				x = 630,
				text = var_2_2,
				color = var_2_5
			},
			{
				fontSize = 22,
				type = "label",
				top = 5,
				x = 810,
				text = var_2_3,
				color = var_2_6
			}
		}
	}
end
