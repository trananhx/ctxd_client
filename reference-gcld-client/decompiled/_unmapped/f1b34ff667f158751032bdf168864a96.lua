local var_0_0 = {}
local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.title1FontSize = -4
	var_0_1.title2FontSize = -4
	var_0_1.title3FontSize = -4
	var_0_1.title4FontSize = -4
	var_0_1.title5FontSize = -4
	var_0_1.rightDescX = -60
	var_0_1.rightContentX = 20
	var_0_1.rightContent1FntSize = -4
elseif conf.language == "tha" then
	var_0_1.title1FontSize = -4
	var_0_1.title2FontSize = -4
	var_0_1.title3FontSize = -4
	var_0_1.title4FontSize = -4
	var_0_1.title5FontSize = -4
	var_0_1.rightDescX = -60
	var_0_1.rightContentX = 20
	var_0_1.rightContent1FntSize = -4
elseif conf.language == "ina" then
	var_0_1.title1FontSize = -4
	var_0_1.title2FontSize = -4
	var_0_1.title3FontSize = -4
	var_0_1.title4FontSize = -4
	var_0_1.title5FontSize = -4
	var_0_1.rightDescX = -50
	var_0_1.rightContentX = 0
	var_0_1.rightContent1FntSize = -4
else
	var_0_1.title1FontSize = 0
	var_0_1.title2FontSize = 0
	var_0_1.title3FontSize = 0
	var_0_1.title4FontSize = 0
	var_0_1.title5FontSize = 0
	var_0_1.rightDescX = -25
	var_0_1.rightContentX = 0
	var_0_1.rightContent1FntSize = 0
end

var_0_0.bg = {
	y = 25,
	name = "bg",
	x = 17,
	type = "pic",
	anchorPointX = 0,
	anchorPointY = 0,
	pic = "res/ui/rankInfo/offic_view_bg.jpg",
	children = {
		{
			x = 740,
			name = "player_bg",
			y = 450,
			type = "pic",
			pic = "res/ui/rankInfo/player_view_bg.png"
		},
		{
			x = 740,
			name = "player",
			y = 450,
			type = "pic",
			pic = "res/ui/rankInfo/player_view_bg.png"
		},
		{
			x = 700,
			name = "icon_bg",
			y = 490,
			type = "pic",
			pic = "frame:guojia_di.png"
		},
		{
			fontSize = 26,
			name = "icon",
			y = 490,
			type = "label",
			x = 700
		},
		{
			name = "title_1",
			type = "label",
			y = 485,
			x = 40,
			text = language.get(112001),
			fontSize = 20 + var_0_1.title1FontSize,
			color = ccc3(227, 194, 152)
		},
		{
			name = "title_2",
			type = "label",
			y = 485,
			x = 150,
			text = language.get(112002),
			fontSize = 20 + var_0_1.title2FontSize,
			color = ccc3(227, 194, 152)
		},
		{
			name = "title_3",
			type = "label",
			y = 485,
			x = 300,
			text = language.get(112003),
			fontSize = 20 + var_0_1.title3FontSize,
			color = ccc3(227, 194, 152)
		},
		{
			name = "title_4",
			type = "label",
			y = 485,
			x = 410,
			text = language.get(112004),
			fontSize = 20 + var_0_1.title4FontSize,
			color = ccc3(227, 194, 152)
		},
		{
			name = "title_5",
			x = 490,
			type = "label",
			height = 0,
			y = 485,
			width = 100,
			text = language.get(112005),
			fontSize = 20 + var_0_1.title5FontSize,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 25,
			name = "nameLv",
			text = "",
			type = "label",
			y = 367,
			x = 740,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "title_currentOfficer",
			type = "label",
			anchorPointX = 0,
			y = 310,
			anchorPointY = 0.5,
			text = language.get(112006),
			x = 620 + var_0_1.rightDescX,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "title_resourceAdd",
			type = "label",
			anchorPointX = 0,
			y = 280,
			anchorPointY = 0.5,
			text = language.get(112007),
			x = 620 + var_0_1.rightDescX,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "title_currentRank",
			type = "label",
			anchorPointX = 0,
			y = 250,
			anchorPointY = 0.5,
			text = language.get(112008),
			x = 620 + var_0_1.rightDescX,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "title_nextOfficer",
			type = "label",
			anchorPointX = 0,
			y = 185,
			anchorPointY = 0.5,
			text = language.get(112009),
			x = 620 + var_0_1.rightDescX,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "title_resourceAdd2",
			type = "label",
			anchorPointX = 0,
			y = 155,
			anchorPointY = 0.5,
			text = language.get(112010),
			x = 620 + var_0_1.rightDescX,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "title_levelUpCondition",
			type = "label",
			anchorPointX = 0,
			y = 125,
			anchorPointY = 0.5,
			text = language.get(112011),
			x = 620 + var_0_1.rightDescX,
			color = ccc3(227, 194, 152)
		},
		{
			name = "value_currentOfficer",
			type = "label",
			anchorPointX = 0,
			text = "",
			y = 310,
			anchorPointY = 0.5,
			fontSize = 20 + var_0_1.rightContent1FntSize,
			x = 750 + var_0_1.rightContentX,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "value_resourceAdd",
			type = "label",
			anchorPointX = 0,
			text = "",
			y = 280,
			anchorPointY = 0.5,
			x = 750 + var_0_1.rightContentX,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "value_currentRank",
			type = "label",
			anchorPointX = 0,
			text = "",
			y = 250,
			anchorPointY = 0.5,
			x = 750 + var_0_1.rightContentX,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "value_nextOfficer",
			type = "label",
			anchorPointX = 0,
			text = "",
			y = 185,
			anchorPointY = 0.5,
			x = 750 + var_0_1.rightContentX,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "value_resourceAdd2",
			type = "label",
			anchorPointX = 0,
			text = "",
			y = 155,
			anchorPointY = 0.5,
			x = 750 + var_0_1.rightContentX,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "value_levelUpCondition",
			type = "label",
			anchorPointX = 0,
			text = "",
			y = 125,
			anchorPointY = 0.5,
			x = 750 + var_0_1.rightContentX,
			color = ccc3(227, 194, 152)
		},
		{
			type = "button",
			buttons = {
				{
					pic2 = "frame:btn2_gre_c.png",
					name = "btn_salary",
					pic1 = "frame:btn2_gre_a.png",
					y = 62,
					pic3 = "frame:btn2_gre_g.png",
					x = 650
				},
				{
					pic2 = "frame:btn2_gre_c.png",
					name = "btn_drop",
					pic1 = "frame:btn2_gre_a.png",
					y = 62,
					pic3 = "frame:btn2_gre_g.png",
					x = 810
				}
			}
		},
		{
			fontSize = 20,
			name = "title_hecheng",
			x = 650,
			type = "label",
			y = 62,
			strokeSize = 2,
			text = language.get(112012),
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			fontSize = 20,
			name = "title_chaijie",
			x = 810,
			type = "label",
			y = 62,
			strokeSize = 2,
			text = language.get(112013),
			color = colorText[10004],
			strokeColor = colorText[10005]
		}
	}
}

function getOfficerData()
	return var_0_0
end
