local var_0_0 = {}

if conf.language == "kr" then
	var_0_0.cityNumY = 23
elseif conf.language == "tha" then
	var_0_0.cityNumY = -27
else
	var_0_0.cityNumY = 0
end

local var_0_1 = {
	cityComboMain = {
		height = 184,
		name = "cityComboPanel",
		top = 250,
		type = "layer_color",
		width = 64,
		color = ccc4(0, 0, 0, 0),
		right = 135 + platform.getSafeDistance(),
		children = {
			{
				xcenter = 0,
				name = "cityComboBackground",
				type = "pic",
				ycenter = 0,
				pic = "res/ui/world/cityCombo/cclp_count_bg.png",
				children = {
					{
						text = "0",
						name = "cityNumber",
						fontSize = 20,
						type = "label",
						fontName = "Thonburi-Bold",
						xcenter = 0,
						color = ccc3(255, 255, 204),
						ycenter = -38 + var_0_0.cityNumY
					},
					{
						name = "lianxiacheng",
						fontSize = 20,
						type = "label",
						fontName = "Thonburi-Bold",
						xcenter = 0,
						ycenter = -25,
						text = language.get(113020),
						color = ccc3(255, 255, 204)
					},
					{
						text = "0",
						name = "rewardNum",
						fontSize = 18,
						type = "label",
						y = 139,
						z = 1000,
						x = 48
					},
					{
						type = "button",
						buttons = {
							{
								pic2 = "res/ui/world/cityCombo/get_icon_gx.png",
								name = "rewardButton",
								pic1 = "res/ui/world/cityCombo/get_icon_gx.png",
								y = 150,
								x = 33,
								callBack = function()
									cityComboControl.requestCityComboReward()
								end
							}
						}
					}
				}
			}
		}
	}
}

function getCityComboUiData()
	return var_0_1
end
