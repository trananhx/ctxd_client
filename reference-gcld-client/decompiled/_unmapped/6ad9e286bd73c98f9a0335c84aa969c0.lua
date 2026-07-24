local var_0_0 = {}
local var_0_1 = {}

if conf.language == "tw" then
	var_0_1.btnBackX = -50
else
	var_0_1.btnBackX = 0
end

local var_0_2 = {
	213,
	820,
	720
}
local var_0_3 = {
	278,
	400,
	309
}
local var_0_4 = {
	y = 430,
	name = "snsShareLayer",
	visible = false,
	type = "layer_color",
	width = 280,
	x = 620,
	height = 70,
	color = ccc4(20, 212, 129, 0)
}

if conf.language == "tw" or conf.language == "kr" then
	var_0_4 = {
		width = 280,
		height = 70,
		name = "snsShareLayer",
		type = "layer_color",
		y = 430,
		visible = true,
		x = 520,
		color = ccc4(20, 212, 129, 0),
		children = {
			{
				fontSize = 26,
				font = "Thonburi",
				type = "label",
				x = 35,
				ycenter = 0,
				text = language.get("500001_lxr"),
				color = ccc3(255, 255, 207),
				align = kCCTextAlignmentLeft
			},
			{
				ycenter = 0,
				x = 105,
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/playerInfo/btn_js_face_c.png",
						name = "shareButton",
						pic1 = "res/ui/playerInfo/btn_js_face_a.png",
						callBack = function()
							log.info("show share ")
							actorInfo.control.shareButtonTap()
						end
					}
				}
			},
			{
				fontSize = 26,
				name = "shareRewardLabel",
				anchorPointX = 0,
				type = "label",
				ycenter = 0,
				font = "Thonburi",
				anchorPointY = 0.5,
				x = 145,
				text = language.get("500011_lxr") .. "+" .. user.shareRewardWoodNum,
				color = ccc3(255, 255, 207),
				align = kCCTextAlignmentLeft
			}
		}
	}
end

var_0_0.bg = {
	xcenter = 0,
	type = "pic",
	ycenter = -30,
	pic = "res/ui/playerInfo/role_view.jpg",
	children = {
		{
			name = "actor",
			type = "pic",
			z = 1,
			pic = "res/ui/common/playerPic/player1.png",
			x = var_0_2[1],
			y = var_0_3[1]
		},
		{
			z = 4,
			type = "pic",
			pic = "res/ui/playerInfo/role_deg_view_2.png",
			x = var_0_2[3],
			y = var_0_3[3]
		},
		{
			name = "exp",
			type = "process",
			percentage = 0.5,
			z = 5,
			pic = "res/ui/playerInfo/role_deg_c_2.png",
			x = var_0_2[3],
			y = var_0_3[3],
			midPoint = ccp(0.5, 0)
		},
		{
			name = "name",
			stroke = false,
			type = "label",
			ycenter = 0,
			xcenter = 0,
			fontSize = 35,
			text = language.get(141002)
		},
		{
			text = "vip",
			name = "vip",
			stroke = false,
			type = "label",
			fontSize = 26,
			xcenter = 0,
			ycenter = 0,
			color = colorText[10002]
		},
		{
			name = "guanzhiValue",
			stroke = false,
			type = "label",
			fontSize = 26,
			xcenter = 0,
			ycenter = 0,
			text = language.get(141004),
			color = colorText[10002]
		},
		{
			text = "104",
			name = "dengjiValue",
			stroke = false,
			type = "label",
			fontSize = 26,
			xcenter = 0,
			ycenter = 0,
			color = colorText[10002]
		},
		{
			name = "jingyan",
			stroke = false,
			type = "label",
			fontSize = 26,
			xcenter = 0,
			ycenter = 0,
			text = language.get(141006),
			color = colorText[10002]
		},
		{
			text = "1000/20000",
			name = "jingyanValue",
			fontSize = 22,
			type = "label",
			xcenter = 0,
			ycenter = 0,
			color = colorText[10002]
		},
		{
			name = "undisplay",
			stroke = false,
			type = "label",
			ycenter = 0,
			xcenter = 0,
			fontSize = 26,
			text = language.get(141007)
		},
		{
			name = "fuwuqi",
			stroke = false,
			type = "label",
			fontSize = 26,
			xcenter = 0,
			ycenter = 0,
			text = language.get(141011),
			color = colorText[10002],
			color = colorText[10002]
		},
		{
			name = "xuhao",
			stroke = false,
			type = "label",
			fontSize = 26,
			xcenter = 0,
			ycenter = 0,
			text = language.get(141012),
			color = colorText[10002]
		},
		{
			name = "jiaoseID",
			stroke = false,
			type = "label",
			fontSize = 26,
			xcenter = 0,
			ycenter = 0,
			text = language.get(141013),
			color = colorText[10002]
		},
		{
			type = "button",
			buttons = {
				{
					pic2 = "frame:btn2_gre_c.png",
					name = "btn_back_player",
					pic1 = "frame:btn2_gre_a.png",
					y = 70,
					pic3 = "frame:btn2_gre_g.png",
					x = 500
				},
				{
					pic2 = "frame:btn2_gre_c.png",
					name = "btn_back_server",
					pic1 = "frame:btn2_gre_a.png",
					y = 70,
					pic3 = "frame:btn2_gre_g.png",
					x = 650
				},
				{
					pic2 = "frame:btn2_gre_c.png",
					name = "btn_back",
					pic1 = "frame:btn2_gre_a.png",
					y = 70,
					pic3 = "frame:btn2_gre_g.png",
					x = 800
				},
				{
					pic2 = "frame:btn2_gre_c.png",
					name = "btn_player_center",
					pic1 = "frame:btn2_gre_a.png",
					y = 50,
					pic3 = "frame:btn2_gre_g.png",
					x = 700
				},
				{
					pic2 = "frame:btn2_yel_c.png",
					name = "btn_renzheng",
					pic1 = "frame:btn2_yel_a.png",
					y = 148,
					pic3 = "frame:btn2_yel_g.png",
					x = 800
				},
				{
					pic2 = "frame:btn2_gre_c.png",
					name = "btn_secret_tips",
					pic1 = "frame:btn2_gre_a.png",
					visible = false,
					y = 110,
					pic3 = "frame:btn2_gre_g.png",
					x = 800
				}
			}
		},
		{
			fontSize = 20,
			name = "title_back_player",
			x = 500,
			type = "label",
			y = 70,
			strokeSize = 2,
			text = language.get(141015),
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			fontSize = 20,
			name = "title_back_server",
			x = 650,
			type = "label",
			y = 70,
			strokeSize = 2,
			text = language.get(141016),
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		var_0_4,
		{
			fontSize = 20,
			name = "title_back",
			x = 800,
			type = "label",
			y = 70,
			strokeSize = 2,
			text = language.get(141017),
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			fontSize = 20,
			name = "title_player_center",
			x = 700,
			type = "label",
			y = 50,
			strokeSize = 2,
			text = language.get(141010),
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			fontSize = 20,
			name = "title_renzheng",
			x = 800,
			type = "label",
			y = 148,
			strokeSize = 2,
			text = language.get(141020),
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			fontSize = 20,
			name = "title_secret_tips",
			visible = false,
			type = "label",
			strokeSize = 2,
			text = "\xB9\xA5\xC2\xD4",
			y = 110,
			x = 800,
			color = colorText[10004],
			strokeColor = colorText[10005]
		}
	}
}

function getActorInfoData()
	return var_0_0
end
