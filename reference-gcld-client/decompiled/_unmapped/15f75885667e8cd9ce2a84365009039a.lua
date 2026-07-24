local var_0_0 = {}

function getWelfareCellLayerData(arg_1_0)
	local var_1_0 = {}

	if conf.language == "vie" then
		var_1_0.welfareNameScale = 1
	else
		var_1_0.welfareNameScale = 1
	end

	local var_1_1 = {
		height = 440,
		name = "welfareCellLayer",
		x = 18,
		type = "layer_color",
		y = 6,
		color = ccc4(0, 0, 255, 0),
		width = 220 * math.ceil(arg_1_0 * 0.5),
		children = {}
	}

	log.info("welfareCount in getWelfareCellLayerData :", arg_1_0)

	local var_1_2 = math.ceil(arg_1_0 * 0.5)

	if var_1_2 < 4 then
		var_1_2 = 4
	end

	for iter_1_0 = 1, arg_1_0 do
		local var_1_3 = 117 + 215 * (iter_1_0 - 1)
		local var_1_4 = 330

		if var_1_2 < iter_1_0 then
			var_1_3 = 117 + 215 * (iter_1_0 - var_1_2 - 1)
			var_1_4 = 110
		end

		local var_1_5 = {
			type = "pic",
			pic = "res/ui/welfareNotice/sw_list_view_bg.jpg",
			name = "cell" .. iter_1_0,
			x = var_1_3,
			y = var_1_4,
			children = {
				{
					xcenter = 0,
					y = 32,
					type = "pic",
					visible = true,
					pic = "res/ui/welfareNotice/sw_list_t_mfjs.png",
					name = "welfareName" .. iter_1_0,
					scale = var_1_0.welfareNameScale
				},
				{
					xcenter = 0,
					y = 122,
					type = "button",
					name = "welfareButton" .. iter_1_0,
					buttons = {
						{
							pic2 = "res/ui/welfareNotice/sw_icon_view.png",
							pic1 = "res/ui/welfareNotice/sw_icon_view_lig.png",
							visible = true,
							callBack = function()
								welfareDetailUI.welfarePressAtIndex(iter_1_0)
							end
						}
					}
				},
				{
					xcenter = 0,
					z = 200,
					type = "pic",
					y = 122,
					visible = true,
					pic = "res/ui/welfareNotice/sw_icon_mfjs.png",
					name = "welfareIcon" .. iter_1_0
				}
			}
		}

		table.insert(var_1_1.children, var_1_5)
	end

	return var_1_1
end

var_0_0.welfareBackground = {
	y = 25,
	name = "welfareBackground",
	x = 22,
	type = "pic",
	anchorPointX = 0,
	anchorPointY = 0,
	pic = "res/ui/welfareNotice/sw_view.jpg",
	children = {
		{
			xcenter = 0,
			y = 488,
			pic = "res/ui/welfareNotice/sw_tit.png",
			type = "pic"
		}
	}
}

function getWelfareDetailData()
	return var_0_0
end
