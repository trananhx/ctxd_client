local var_0_0 = {
	bg = {
		xcenter = 0,
		name = "bg",
		type = "pic",
		ycenter = -30,
		pic = "res/ui/playerInfo/vip_view.jpg",
		children = {
			{
				x = 80,
				name = "iconBg",
				y = 430,
				type = "pic",
				pic = "res/ui/playerInfo/vip_port_view.jpg"
			},
			{
				x = 80,
				name = "icon",
				y = 430,
				type = "pic",
				pic = "res/ui/common/playerHead/playerHead_icon_1.png"
			},
			{
				x = 180,
				name = "vip",
				y = 450,
				type = "pic",
				pic = "res/ui/playerInfo/vip_tit.png"
			},
			{
				width = 29,
				height = 46,
				name = "vipValue",
				type = "atlas",
				pic = "res/ui/common/number/get_numb.png",
				text = "0",
				y = 450,
				startChar = 48,
				x = 240
			},
			{
				x = 470,
				name = "percentBg",
				y = 450,
				type = "pic",
				pic = "res/ui/playerInfo/role_deg_view.png"
			},
			{
				x = 470,
				name = "percent",
				y = 450,
				type = "process",
				pic = "res/ui/playerInfo/role_deg_c.png"
			},
			{
				fontSize = 30,
				name = "percentValue",
				text = "200000/500000",
				type = "label",
				y = 450,
				x = 830
			},
			{
				fontSize = 30,
				name = "shengjixuyao",
				type = "label",
				y = 390,
				x = 350,
				text = language.get(142010)
			},
			{
				x = 490,
				name = "gold_bg",
				y = 390,
				type = "pic",
				pic = "res/ui/playerInfo/icon_gold.png"
			},
			{
				x = 755,
				name = "gold_bg_vie",
				y = 390,
				type = "pic",
				visible = false,
				pic = "res/ui/playerInfo/icon_gold.png"
			},
			{
				fontSize = 30,
				name = "needValue",
				text = "500000",
				type = "label",
				y = 390,
				x = 720
			},
			{
				x = 820,
				name = "firstPayPic",
				y = 460,
				type = "pic",
				pic = "res/ui/firstPayActivity/delta_icon_bx.png"
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/playerInfo/anniu_buy_click.png",
						name = "btn_chongzhi",
						pic1 = "res/ui/playerInfo/anniu_buy.png",
						y = 390,
						x = 820
					},
					{
						pic2 = "res/ui/playerInfo/anniu_buy_click.png",
						name = "btn_tequan",
						pic1 = "res/ui/playerInfo/anniu_buy.png",
						y = 390,
						x = 820
					}
				}
			},
			{
				fontSize = 20,
				name = "title_chongzhi",
				x = 820,
				type = "label",
				y = 390,
				strokeSize = 2,
				text = language.get(142011),
				color = colorText[10004],
				strokeColor = colorText[10005]
			},
			{
				fontSize = 20,
				name = "title_tequan",
				x = 820,
				type = "label",
				y = 390,
				strokeSize = 2,
				text = language.get(142012),
				color = colorText[10004],
				strokeColor = colorText[10005]
			}
		}
	}
}

local function var_0_1()
	if conf.language == "kr" then
		var_0_0.bg.children[8].x = 425
		var_0_0.bg.children[9].x = 620
		var_0_0.bg.children[9].y = 360
		var_0_0.bg.children[10].x = 850
		var_0_0.bg.children[10].y = 360
	elseif conf.language == "vie" then
		var_0_0.bg.children[8].x = 425
		var_0_0.bg.children[9].x = 620
		var_0_0.bg.children[9].y = 360
		var_0_0.bg.children[10].x = 850
		var_0_0.bg.children[10].y = 360
	elseif conf.language == "tha" then
		var_0_0.bg.children[9].x = 530
		var_0_0.bg.children[10].x = 760
	end
end

function getRechargeData()
	var_0_1()

	return var_0_0
end
