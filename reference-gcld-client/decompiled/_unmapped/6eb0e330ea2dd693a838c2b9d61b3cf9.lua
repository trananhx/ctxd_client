local var_0_0 = {}
local var_0_1 = {}

if conf.language == "kr" then
	var_0_1.comentFontSize = -4
else
	var_0_1.comentFontSize = 0
end

var_0_0.bg = {
	xcenter = 0,
	name = "bg",
	type = "pic_9",
	ycenter = 0,
	pic = "frame:bigPanel.png",
	middleRect = CCRectMake(30, 30, 45, 45),
	preferedSize = CCSizeMake(960, 580),
	children = {
		{
			x = 480,
			name = "bg1",
			y = 285,
			type = "pic",
			pic = "res/ui/comment/bg1.jpg"
		},
		{
			x = 480,
			name = "bg2",
			y = 280,
			type = "pic",
			pic = "res/ui/comment/bg2.jpg"
		},
		{
			left = 30,
			name = "xiaoqian",
			down = 0,
			type = "pic",
			pic = "res/ui/comment/xiaoqian.png"
		},
		{
			x = 560,
			name = "title",
			y = 475,
			type = "pic",
			pic = "res/ui/comment/title.png"
		},
		{
			x = 620,
			name = "des",
			y = 280,
			type = "pic",
			pic = "res/ui/comment/des.png"
		},
		{
			type = "button",
			buttons = {
				{
					pic2 = "frame:btn_ok_lighted.png",
					name = "btn_commit",
					pic1 = "frame:btn_ok_normal.png",
					y = 80,
					x = 500
				},
				{
					pic2 = "res/ui/comment/red_l.png",
					name = "btn_close",
					pic1 = "res/ui/comment/red_n.png",
					y = 80,
					x = 750
				}
			}
		},
		{
			name = "title_btn_commit",
			x = 500,
			type = "label",
			y = 80,
			strokeSize = 2,
			text = language.get(170015),
			fontSize = 20 + var_0_1.comentFontSize,
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			fontSize = 20,
			name = "title_close",
			x = 750,
			type = "label",
			y = 80,
			strokeSize = 2,
			text = language.get(170016),
			color = colorText[10004],
			strokeColor = colorText[10005]
		}
	}
}

function getCommentData()
	return var_0_0
end
