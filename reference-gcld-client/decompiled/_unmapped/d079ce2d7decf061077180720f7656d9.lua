local var_0_0 = {}
local var_0_1 = {}

if conf.language == "kr" then
	var_0_1.desX = -130
	var_0_1.detailX = 50
	var_0_1.key_1X = 0
	var_0_1.key_2X = 10
	var_0_1.key_3X = 0
	var_0_1.key_4X = 0
	var_0_1.key_5X = 20
	var_0_1.key_6X = 0
	var_0_1.value_1X = 30
	var_0_1.value_2X = 30
	var_0_1.value_3X = 30
	var_0_1.value_4X = 30
	var_0_1.value_5X = 30
	var_0_1.value_6X = 30
	var_0_1.fontsize = 25
elseif conf.language == "vie" then
	var_0_1.desX = -80
	var_0_1.detailX = 40
	var_0_1.key_1X = 22
	var_0_1.key_2X = 22
	var_0_1.key_3X = 22
	var_0_1.key_4X = 22
	var_0_1.key_5X = 22
	var_0_1.key_6X = 22
	var_0_1.value_1X = 60
	var_0_1.value_2X = 60
	var_0_1.value_3X = 60
	var_0_1.value_4X = 60
	var_0_1.value_5X = 60
	var_0_1.value_6X = 60
	var_0_1.fontsize = 15
else
	var_0_1.desX = 0
	var_0_1.detailX = 0
	var_0_1.key_1X = 0
	var_0_1.key_2X = 0
	var_0_1.key_3X = 0
	var_0_1.key_4X = 0
	var_0_1.key_5X = 0
	var_0_1.key_6X = 0
	var_0_1.value_1X = 0
	var_0_1.value_2X = 0
	var_0_1.value_3X = 0
	var_0_1.value_4X = 0
	var_0_1.value_5X = 0
	var_0_1.value_6X = 0
	var_0_1.fontsize = 25
end

var_0_0.bg = {
	xcenter = 0,
	name = "bg",
	type = "pic",
	ycenter = -30,
	pic = "res/ui/weapon/gem_view_bg.jpg",
	children = {
		{
			x = 300,
			name = "title_bg",
			y = 400,
			type = "pic",
			pic = "res/ui/weapon/gem_now_tit_bg.png",
			children = {
				{
					fontSize = 25,
					name = "title",
					type = "label",
					y = 32,
					x = 150,
					text = language.get(122018)
				}
			}
		},
		{
			x = 685,
			name = "gem",
			y = 290,
			type = "pic",
			pic = "res/ui/weapon/gem_now_view_bg.jpg",
			children = {
				{
					x = 40,
					name = "icon",
					y = 40,
					type = "pic",
					pic = "res/ui/weapon/star.png"
				},
				{
					fontSize = 18,
					name = "num",
					text = "99",
					type = "label",
					y = 15,
					x = 65
				},
				{
					x = 40,
					name = "effect",
					y = 40,
					type = "pic",
					pic = "res/ui/weapon/star.png"
				},
				{
					x = -9,
					name = "star_1",
					y = -58,
					type = "pic",
					pic = "res/ui/weapon/star.png"
				},
				{
					x = 17,
					name = "star_2",
					y = -58,
					type = "pic",
					pic = "res/ui/weapon/star.png"
				},
				{
					x = 43,
					name = "star_3",
					y = -58,
					type = "pic",
					pic = "res/ui/weapon/star.png"
				},
				{
					x = 69,
					name = "star_4",
					y = -58,
					type = "pic",
					pic = "res/ui/weapon/star.png"
				}
			}
		},
		{
			name = "title_select",
			type = "label",
			y = 440,
			x = 80,
			text = language.get(122019),
			fontSize = var_0_1.fontsize,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "des",
			type = "label",
			y = 485,
			text = language.get(122020),
			x = 740 + var_0_1.desX,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "detail",
			type = "label",
			y = 350,
			text = language.get(122021),
			x = 300 + var_0_1.detailX,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "key_1",
			type = "label",
			y = 300,
			text = language.get(122022),
			x = 210 + var_0_1.key_1X,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "key_2",
			type = "label",
			y = 270,
			text = language.get(122023),
			x = 210 + var_0_1.key_2X,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "key_3",
			type = "label",
			y = 240,
			text = language.get(122024),
			x = 210 + var_0_1.key_3X,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "key_4",
			type = "label",
			y = 210,
			text = language.get(122025),
			x = 210 + var_0_1.key_4X,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "key_5",
			type = "label",
			y = 180,
			text = language.get(122026),
			x = 210 + var_0_1.key_5X,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "key_6",
			type = "label",
			y = 150,
			text = language.get(122027),
			x = 210 + var_0_1.key_6X,
			color = ccc3(227, 194, 152)
		},
		{
			fontSize = 20,
			name = "value_1",
			text = "",
			type = "label",
			y = 298,
			x = 330 + var_0_1.value_1X,
			color = ccc3(152, 127, 82)
		},
		{
			fontSize = 20,
			name = "value_2",
			text = "",
			type = "label",
			y = 268,
			x = 330 + var_0_1.value_2X,
			color = ccc3(152, 127, 82)
		},
		{
			fontSize = 20,
			name = "value_3",
			text = "",
			type = "label",
			y = 238,
			x = 330 + var_0_1.value_3X,
			color = ccc3(152, 127, 82)
		},
		{
			fontSize = 20,
			name = "value_4",
			text = "",
			type = "label",
			y = 208,
			x = 330 + var_0_1.value_4X,
			color = ccc3(152, 127, 82)
		},
		{
			fontSize = 20,
			name = "value_5",
			text = "",
			type = "label",
			y = 178,
			x = 330 + var_0_1.value_5X,
			color = ccc3(152, 127, 82)
		},
		{
			fontSize = 20,
			name = "value_6",
			text = "",
			type = "label",
			y = 148,
			x = 330 + var_0_1.value_6X,
			color = ccc3(152, 127, 82)
		},
		{
			type = "button",
			buttons = {
				{
					pic2 = "frame:btn2_gre_c.png",
					name = "btn_hecheng",
					pic1 = "frame:btn2_gre_a.png",
					y = 57,
					x = 620
				},
				{
					pic2 = "frame:btn2_gre_c.png",
					name = "btn_chaijie",
					pic1 = "frame:btn2_gre_a.png",
					y = 57,
					x = 780
				}
			}
		},
		{
			fontSize = 20,
			name = "title_hecheng",
			x = 620,
			type = "label",
			y = 57,
			strokeSize = 2,
			text = language.get(122028),
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			fontSize = 20,
			name = "title_chaijie",
			x = 780,
			type = "label",
			y = 57,
			strokeSize = 2,
			text = language.get(122029),
			color = colorText[10004],
			strokeColor = colorText[10005]
		}
	}
}

function getGemData()
	return var_0_0
end
