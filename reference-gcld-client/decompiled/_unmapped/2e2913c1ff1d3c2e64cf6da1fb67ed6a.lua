local var_0_0 = {}
local var_0_1 = {}

table.insert(var_0_0, {
	xcenter = 0,
	name = "selectForceBgSprite",
	type = "pic",
	ycenter = 0,
	pic = "res/ui/selectForce/bg.jpg"
})
table.insert(var_0_0, {
	name = "countryBtn",
	type = "group_button",
	click_event = selectForceConstant.EVENT_SELECT_FORCE,
	buttons = {
		{
			pic2 = "frame:power_wei_a.png",
			name = "abc1",
			pic1 = "frame:power_wei_a.png",
			xcenter = 130,
			id = 1,
			ycenter = 100,
			selectedPic = "frame:power_wei_click.png"
		},
		{
			pic2 = "frame:power_shu_a.png",
			name = "abc2",
			pic1 = "frame:power_shu_a.png",
			xcenter = -215,
			id = 2,
			ycenter = -5,
			selectedPic = "frame:power_shu_click.png"
		},
		{
			pic2 = "frame:power_wu_a.png",
			name = "abc3",
			pic1 = "frame:power_wu_a.png",
			xcenter = 200,
			id = 3,
			ycenter = -85,
			selectedPic = "frame:power_wu_click.png"
		}
	}
})

var_0_0.bg_top = {
	xcenter = 0,
	name = "bg_down",
	type = "pic",
	top = 0,
	pic = "res/ui/selectForce/power_up_top.png"
}
var_0_0.bg_down = {
	xcenter = 0,
	down = 0,
	name = "bg_down",
	type = "pic",
	pic = "res/ui/selectForce/power_up_footer.png"
}
var_0_0.startMenu = {
	xcenter = 0,
	down = 0,
	name = "startMenu",
	type = "button",
	z = 101,
	buttons = {
		{
			pic2 = "frame:btn_power_play_click.png",
			name = "startItem",
			pic1 = "frame:btn_power_play_a.png",
			down = 30,
			x = 0
		}
	}
}

table.insert(var_0_0, {
	xcenter = 0,
	down = 30,
	name = "ringSprite",
	type = "pic",
	z = 103,
	pic = "frame:btn_power_play_click.png"
})

var_0_1.recommendLabel = {
	fontSize = 18,
	name = "recommendLabel",
	text = "34343333333334",
	type = "label",
	ycenter = 0,
	x = 160,
	z = 102,
	tag = selectForceConstant.RECOMMENDLABEL_TEXT_TAG
}

table.insert(var_0_0, {
	name = "recommendLabel2",
	z = 102,
	type = "pic",
	pic = "frame:recommendLabel.png",
	tag = selectForceConstant.RECOMMENDLABEL_TAG,
	child = var_0_1.recommendLabel
})
table.insert(var_0_0, {
	z = 101,
	name = "recommendIcon",
	type = "pic",
	pic = "frame:power_recom.png",
	tag = selectForceConstant.RECOMMENDICON_TAG
})
table.insert(var_0_0, {
	fontSize = 20,
	name = "playerNameLabel1",
	text = "                     ",
	type = "label",
	y = 170,
	xcenter = -200,
	z = 101,
	tag = selectForceConstant.PLAYERNAMELABEL_1_TAG
})
table.insert(var_0_0, {
	fontSize = 20,
	name = "playerNameLabel2",
	text = "                     ",
	type = "label",
	y = 150,
	xcenter = -200,
	z = 101,
	tag = selectForceConstant.PLAYERNAMELABEL_2_TAG
})
table.insert(var_0_0, {
	xcenter = 200,
	name = "wuguoGSprite",
	ycenter = 0,
	type = "pic",
	visible = false,
	pic = "frame:power_wu_zy.png",
	z = 101,
	tag = selectForceConstant.SELECTED_FORCE_GENERAL_TAG
})
table.insert(var_0_0, {
	xcenter = -250,
	name = "shuguoGSprite",
	ycenter = 50,
	type = "pic",
	visible = false,
	pic = "frame:power_shu_zgl.png",
	z = 101,
	tag = selectForceConstant.SELECTED_FORCE_GENERAL_TAG
})
table.insert(var_0_0, {
	xcenter = 200,
	name = "weiguoGSprite",
	fontSize = 20,
	type = "pic",
	ycenter = 130,
	z = 101,
	pic = "frame:power_wei_cc.png",
	visible = false,
	tag = selectForceConstant.SELECTED_FORCE_GENERAL_TAG
})

function getSelectForceData()
	return var_0_0
end
