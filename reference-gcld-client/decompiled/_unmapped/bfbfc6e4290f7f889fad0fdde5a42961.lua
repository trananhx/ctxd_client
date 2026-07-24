function getSelectPlayerUiData()
	return {
		bg = {
			xcenter = 0,
			name = "bg",
			z = 1,
			type = "pic",
			ycenter = 0,
			pic = "res/ui/login/login_scene.jpg",
			children = {
				{
					xcenter = 0,
					name = "listBg",
					type = "pic",
					ycenter = 0,
					pic = "res/ui/selectPlayer/choi_view.png"
				},
				{
					type = "button",
					buttons = {
						{
							pic2 = "frame:btn_login_gre_hover.png",
							name = "start",
							pic1 = "frame:btn_login_gre.png",
							down = 125,
							x = 693
						}
					}
				},
				{
					xcenter = 0,
					name = "icon",
					down = 125,
					type = "pic",
					pic = "res/ui/common/text/login/text_login_begin.png"
				}
			}
		},
		["1"] = {
			xcenter = 0,
			name = "iconUp",
			type = "pic",
			top = 0,
			pic = rmgr.getLoginUpOnPic()
		},
		["2"] = {
			xcenter = 0,
			name = "iconDown",
			down = 0,
			type = "pic",
			z = 2,
			pic = "res/ui/login/login_down_on.png"
		},
		["3"] = {
			xcenter = 0,
			name = "title",
			type = "pic",
			top = 100,
			pic = "res/ui/selectPlayer/choi_tit.png"
		}
	}
end
