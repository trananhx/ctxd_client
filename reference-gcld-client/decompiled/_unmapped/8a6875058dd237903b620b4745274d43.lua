local var_0_0 = {}
local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.targetLabelX = 20
	var_0_1.rewardLabelX = 50
else
	var_0_1.targetLabelX = 0
	var_0_1.rewardLabelX = 0
end

var_0_0.bg = {
	x = 480,
	name = "bg",
	y = 320,
	type = "pic",
	z = 0,
	pic = "res/ui/juben/jubenLevelSelect/jb_mode_up.png",
	children = {
		{
			x = 480,
			name = "map",
			y = 306,
			type = "pic",
			z = -1,
			pic = "res/ui/juben/jubenLevelSelect/map/jb_map_sid_3.jpg",
			children = {
				{
					x = 80,
					name = "tishi",
					y = 60,
					type = "pic",
					pic = "res/ui/juben/jubenLevelSelect/jb_exe_view.png"
				},
				{
					x = 40,
					name = "flag_1",
					y = 75,
					type = "pic",
					pic = "res/ui/juben/jubenLevelSelect/flag_shu.png"
				},
				{
					x = 40,
					name = "flag_2",
					y = 45,
					type = "pic",
					pic = "res/ui/juben/jubenLevelSelect/flag_mz.png"
				},
				{
					name = "title_1",
					y = 75,
					type = "label",
					fontSize = 20,
					x = 100,
					text = language.get(330001),
					color = ccc3(217, 204, 143)
				},
				{
					name = "title_2",
					y = 45,
					type = "label",
					fontSize = 20,
					x = 100,
					text = language.get(330002),
					color = ccc3(217, 204, 143)
				}
			}
		},
		{
			x = 860,
			name = "btn_select",
			y = 500,
			type = "pic",
			pic = "res/ui/juben/jubenLevelSelect/jb_navi_on.png"
		},
		{
			x = 370,
			name = "targetBg",
			y = 610,
			type = "pic",
			pic = "res/ui/juben/jubenLevelSelect/jb_mode_up_view_bg.png",
			children = {
				{
					name = "title_1",
					y = 25,
					type = "label",
					fontSize = 20,
					text = language.get(330021),
					x = 30 + var_0_1.targetLabelX,
					color = ccc3(217, 204, 143)
				},
				{
					x = 140,
					name = "target",
					y = 25,
					type = "pic",
					pic = "res/ui/juben/jubenLevelSelect/text/jb_obj_1.png"
				},
				{
					name = "star",
					y = 25,
					type = "label",
					fontSize = 20,
					text = language.get(330022, 1),
					x = 330 + var_0_1.rewardLabelX,
					color = ccc3(217, 204, 143)
				}
			}
		},
		{
			type = "button",
			buttons = {
				{
					pic2 = "res/ui/juben/jubenLevelSelect/btn_jb_back_h.png",
					name = "btn_back",
					pic1 = "res/ui/juben/jubenLevelSelect/btn_jb_back_n.png",
					y = 603,
					x = 888
				},
				{
					pic2 = "res/ui/juben/jubenLevelSelect/btn_jb_a.png",
					name = "btn_start",
					pic1 = "res/ui/juben/jubenLevelSelect/btn_jb_a.png",
					y = 60,
					x = 480
				}
			}
		},
		{
			x = 440,
			name = "xiaohao",
			y = 25,
			type = "pic",
			pic = "frame:res_icon_3.png"
		},
		{
			text = "2000",
			name = "liangcao",
			y = 25,
			type = "label",
			fontSize = 30,
			x = 510,
			color = ccc3(217, 204, 143)
		}
	}
}

function getJubenLevelSelectData()
	return var_0_0
end
