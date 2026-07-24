local var_0_0 = {}
local var_0_1 = menuConstant

var_0_0.mainFooterFrameSprite = {
	pic = "res/ui/mainUI/footer_r_open_view.png",
	z = 97,
	y = 0,
	type = "pic",
	x = 0
}
var_0_0.mainMenuFrameSprite = {
	z = 98,
	down = 0,
	type = "pic",
	pic = "res/ui/mainUI/footer_r_view.png",
	right = 0
}
var_0_0.mainMenu = {
	type = "button",
	tag = var_0_1.MAINMENU_TAG,
	buttons = {
		{
			pic2 = "res/ui/mainUI/navi_add_click.png",
			name = "mainMenuItem",
			pic1 = "res/ui/mainUI/navi_add_a.png",
			down = 5,
			right = 7,
			tag = var_0_1.MAINMENUITEM_TAG
		}
	}
}
var_0_0.areaMenu = {
	y = 120,
	ypadding = 65,
	ydirection = -1,
	type = "button",
	listType = "vlist",
	x = -20 - platform.getSafeDistance(),
	buttons = {
		{
			pic2 = "res/ui/mainUI/btn_zc_click.png",
			name = "mainCityItem",
			pic1 = "res/ui/mainUI/btn_zc_a.png"
		},
		{
			pic2 = "res/ui/mainUI/btn_fb_click.png",
			name = "fubenItem",
			pic1 = "res/ui/mainUI/btn_fb_a.png"
		},
		{
			pic2 = "res/ui/mainUI/btn_sj_click.png",
			name = "shijieItem",
			pic1 = "res/ui/mainUI/btn_sj_a.png"
		},
		{
			pic2 = "res/ui/mainUI/btn_jb_click.png",
			name = "jubenItem",
			pic1 = "res/ui/mainUI/btn_jb_a.png"
		}
	}
}
var_0_0.buttonMenu = {
	xdirection = -1,
	y = 0,
	xpadding = 105,
	type = "button",
	x = 0,
	listType = "hlist",
	buttons = {
		{
			pic2 = "res/ui/mainUI/navi_l_zy_click.png",
			name = "ziyuanItem",
			pic1 = "res/ui/mainUI/navi_l_zy_a.png",
			pic3 = "res/ui/mainUI/navi_l_zy_gray.png"
		},
		{
			pic2 = "res/ui/mainUI/navi_l_wj_click.png",
			name = "wujiangItem",
			pic1 = "res/ui/mainUI/navi_l_wj_a.png",
			pic3 = "res/ui/mainUI/navi_l_wj_gray.png"
		},
		{
			pic2 = "res/ui/mainUI/navi_l_gj_click.png",
			name = "guojiaItem",
			pic1 = "res/ui/mainUI/navi_l_gj_a.png",
			pic3 = "res/ui/mainUI/navi_l_gj_gray.png"
		},
		{
			pic2 = "res/ui/mainUI/navi_l_zb_click.png",
			name = "zhuangbeiItem",
			pic1 = "res/ui/mainUI/navi_l_zb_a.png",
			pic3 = "res/ui/mainUI/navi_l_zb_gray.png"
		},
		{
			pic2 = "res/ui/mainUI/navi_l_kj_click.png",
			name = "kejiItem",
			pic1 = "res/ui/mainUI/navi_l_kj_a.png",
			pic3 = "res/ui/mainUI/navi_l_kj_gray.png"
		},
		{
			pic2 = "res/ui/mainUI/navi_l_ph_click.png",
			name = "paihangItem",
			pic1 = "res/ui/mainUI/navi_l_ph_a.png",
			pic3 = "res/ui/mainUI/navi_l_ph_gray.png"
		},
		{
			pic2 = "res/ui/mainUI/navi_l_bq_click.png",
			name = "bingqi",
			pic1 = "res/ui/mainUI/navi_l_bq_a.png",
			pic3 = "res/ui/mainUI/navi_l_bq_gray.png"
		}
	}
}
var_0_0.officerMarkMenu = {
	type = "button",
	buttons = {
		{
			pic2 = "res/ui/mainUI/promp/promp0001.png",
			name = "officierMark",
			pic1 = "res/ui/mainUI/promp/promp0001.png"
		}
	}
}
var_0_0.officerMarkSprite = {
	pic = "res/ui/mainUI/promp/promp0001.png",
	type = "pic"
}

function getMenuData()
	return var_0_0
end

return var_0_0
