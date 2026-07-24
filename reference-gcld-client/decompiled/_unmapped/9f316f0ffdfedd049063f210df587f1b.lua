local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.leftTimeX = 100
else
	var_0_0.leftTimeX = 0
end

local var_0_1 = {
	bg = {
		xcenter = 0,
		name = "bg",
		type = "pic_9",
		ycenter = -28,
		pic = "frame:bigPanel.png",
		middleRect = CCRectMake(30, 30, 45, 45),
		preferedSize = CCSizeMake(960, 560),
		children = {
			{
				xcenter = 0,
				name = "bgyanhua",
				type = "pic",
				ycenter = 0,
				pic = "res/ui/playerInfo/invite/bg.jpg"
			},
			{
				xcenter = 0,
				name = "gonghejiangli",
				type = "pic",
				ycenter = 210,
				pic = "res/ui/gonghe/ghjl_title_ghjl.png"
			},
			{
				xcenter = 0,
				name = "fengexian1",
				type = "pic",
				ycenter = 160,
				pic = "res/ui/gonghe/ghjl_line.png"
			},
			{
				xcenter = 0,
				name = "fengexian2",
				type = "pic",
				ycenter = -160,
				pic = "res/ui/gonghe/ghjl_line.png"
			},
			{
				xcenter = 0,
				name = "gongheDesc1",
				type = "label",
				ycenter = -80,
				fontSize = 22,
				width = 800,
				height = 0,
				font = "Thonburi",
				strokeSize = 2,
				text = language.get(320505),
				color = colorText[10002],
				strokeColor = ccc3(22, 18, 13)
			},
			{
				xcenter = 0,
				name = "gongheDesc2",
				anchorPointX = 0.5,
				type = "label",
				ycenter = -120,
				fontSize = 22,
				width = 800,
				font = "Thonburi",
				height = 0,
				anchorPointY = 1,
				strokeSize = 2,
				text = language.get(320506),
				color = colorText[10002],
				strokeColor = ccc3(22, 18, 13)
			},
			{
				xcenter = 0,
				fontSize = 22,
				type = "label",
				ycenter = -140,
				font = "Thonburi",
				strokeSize = 2,
				text = language.get(320521),
				color = ccc3(255, 255, 0),
				strokeColor = ccc3(22, 18, 13)
			},
			{
				xcenter = 0,
				z = 200,
				name = "gonghebuttonName",
				type = "label",
				ycenter = -215,
				fontSize = 24,
				font = "Thonburi",
				strokeSize = 2,
				text = language.get(320500),
				color = ccc3(255, 255, 255),
				strokeColor = ccc3(22, 18, 13)
			},
			{
				xcenter = 0,
				z = 200,
				fontSize = 28,
				type = "label",
				font = "Thonburi-Bold",
				y = 350,
				strokeSize = 2,
				text = language.get(320504),
				color = ccc3(255, 255, 255),
				strokeColor = ccc3(13, 13, 13)
			},
			{
				xcenter = 0,
				ycenter = -215,
				type = "button",
				buttons = {
					{
						pic2 = "frame:btn_default_normal.png",
						name = "jinruyanhui",
						pic1 = "frame:btn_default_lighted.png"
					}
				}
			},
			{
				name = "leftTime",
				type = "label",
				ycenter = 205,
				fontSize = 24,
				font = "Thonburi-Bold",
				xcenter = 250 + var_0_0.leftTimeX,
				anchorPoint = ccp(0, 0),
				color = ccc3(253, 98, 98)
			}
		}
	},
	closeMenu = {
		type = "button",
		buttons = {
			{
				pic2 = "frame:btn_close_c.png",
				name = "closeItem",
				pic1 = "frame:btn_close_a.png",
				top = 5,
				right = 5
			}
		}
	}
}

function getCelebrationData()
	return var_0_1
end
