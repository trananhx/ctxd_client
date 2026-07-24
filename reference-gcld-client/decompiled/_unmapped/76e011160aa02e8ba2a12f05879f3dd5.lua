function getWarOptionLayerData(arg_1_0)
	local var_1_0 = "res/ui/battle/retreatForward/chetui_tit_qxzctcd.png"

	if arg_1_0.option == "retreat" then
		var_1_0 = "res/ui/battle/retreatForward/chetui_tit_qxzctcd.png"
	elseif arg_1_0.option == "forward" then
		var_1_0 = "res/ui/battle/retreatForward/chetui_tit_qxztjcd.png"
	else
		log.erro("unrecognized war option !!", arg_1_0.option)
	end

	local var_1_1 = {}
	local var_1_2 = 0

	for iter_1_0, iter_1_1 in pairs(arg_1_0.data.gIds) do
		local var_1_3 = (340 - 85 * #arg_1_0.data.gIds) * 0.5 + 42.5
		local var_1_4 = "res/ui/common/fightPic/fightPic_" .. iter_1_1.gPic .. ".png"
		local var_1_5 = var_1_3 + var_1_2 * 85

		var_1_2 = var_1_2 + 1

		log.info("posX : ", var_1_5)

		local var_1_6 = {
			y = 50,
			type = "button",
			x = var_1_5,
			buttons = {
				{
					pic2 = "frame:move_por_move_view.png",
					pic1 = "frame:move_por_move_view.png",
					name = "generalButton" .. iter_1_1.gId
				}
			}
		}
		local var_1_7 = {
			scale = 0.705,
			y = 50,
			type = "pic",
			pic = var_1_4,
			x = var_1_5
		}
		local var_1_8 = {
			y = 50,
			type = "pic",
			pic = "res/ui/battle/retreatForward/chetui_peop_view_lig.png",
			name = "generalPicHightlight" .. iter_1_1.gId,
			x = var_1_5
		}

		table.insert(var_1_1, var_1_6)
		table.insert(var_1_1, var_1_7)
		table.insert(var_1_1, var_1_8)
	end

	return {
		name = "warOptionBackground",
		pic = "res/ui/battle/retreatForward/chetui_list.png",
		type = "pic",
		children = {
			{
				xcenter = 0,
				ycenter = 0,
				type = "pic",
				pic = var_1_0
			},
			{
				xcenter = 0,
				ycenter = -70,
				type = "button",
				buttons = {
					{
						pic2 = "frame:btn3_gre_c.png",
						name = "backButton",
						pic1 = "frame:btn3_gre_a.png",
						callBack = function()
							showTable(arg_1_0.data)
							log.info("warOptionTable.battleId : ", arg_1_0.battleId)
							bmgr.tryEnterBattle(3, {
								battleId = arg_1_0.battleId
							})
						end
					}
				}
			},
			{
				fontSize = 22,
				name = "backButtonLabel",
				type = "label",
				ycenter = -70,
				xcenter = 0,
				text = language.get("202001_lxr"),
				color = colorText[10004]
			},
			{
				x = -30,
				height = 90,
				y = 40,
				type = "layer_color",
				width = 340,
				color = ccc4(0, 0, 255, 0),
				children = var_1_1
			}
		}
	}
end
