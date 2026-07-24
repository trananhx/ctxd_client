local var_0_0 = {}

table.insert(var_0_0, {
	xcenter = 0,
	name = "bg",
	z = 1,
	type = "pic",
	ycenter = 0,
	pic = "res/ui/mainCity/background_main_city.jpg"
})
table.insert(var_0_0, {
	xcenter = 0,
	name = "bg2",
	z = 1,
	type = "pic",
	ycenter = 0,
	pic = "res/ui/mainCity/background_main_city2.jpg"
})
table.insert(var_0_0, {
	xcenter = 0,
	name = "wall",
	visible = false,
	type = "pic",
	ycenter = 0,
	z = 1,
	pic = "res/ui/mainCity/wall.png"
})
table.insert(var_0_0, {
	y = 0,
	name = "funcBtns",
	visible = false,
	type = "button",
	x = 0,
	buttons = {
		{
			pic2 = "res/ui/mainCity/zcgz_btn_bssh_c.png",
			name = "btnbssh",
			pic1 = "res/ui/mainCity/zcgz_btn_bssh.png",
			top = 185,
			left = platform.getSafeDistance(),
			callBack = function()
				weaponTab.ui.show(3)
			end
		},
		{
			pic2 = "res/ui/mainCity/zcgz_btn_tjp_c.png",
			name = "btntjp",
			pic1 = "res/ui/mainCity/zcgz_btn_tjp.png",
			top = 265,
			left = platform.getSafeDistance(),
			callBack = function()
				resourceUI.show(5)
			end
		},
		{
			pic2 = "res/ui/mainCity/zcgz_btn_lf_c.png",
			name = "btnlf",
			pic1 = "res/ui/mainCity/zcgz_btn_lf.png",
			top = 345,
			left = platform.getSafeDistance(),
			callBack = function()
				showGeneralPanel(5)
			end
		},
		{
			pic2 = "res/ui/mainCity/zcgz_btn_ssgf_c.png",
			name = "btnssgf",
			pic1 = "res/ui/mainCity/zcgz_btn_ssgf.png",
			top = 425,
			left = platform.getSafeDistance(),
			callBack = function()
				showGeneralPanel(6)
			end
		}
	}
})

local var_0_1 = {
	"res/ui/mainCity/sys_juming.png",
	"res/ui/mainCity/sys_muchang.png",
	"res/ui/mainCity/sys_nongchang.png",
	"res/ui/mainCity/sys_kuangchang.png",
	"res/ui/mainCity/sys_bingying.png",
	"res/ui/mainCity/sys_huangchen.png"
}
local var_0_2 = {
	"res/ui/mainCity/bui_minju.png",
	"res/ui/mainCity/bui_muchang.png",
	"res/ui/mainCity/bui_nongtian.png",
	"res/ui/mainCity/bui_kuangchang.png",
	"res/ui/mainCity/bui_binying.png",
	"res/ui/mainCity/bui_huangcheng.png"
}
local var_0_3 = {
	"res/ui/mainCity/zcgz_area_word_mj.png",
	"res/ui/mainCity/zcgz_area_word_mc.png",
	"res/ui/mainCity/zcgz_area_word_nt.png",
	"res/ui/mainCity/zcgz_area_word_kc.png",
	"res/ui/mainCity/zcgz_area_word_by.png",
	"res/ui/mainCity/zcgz_area_word_hc.png"
}
local var_0_4 = {
	"res/ui/mainCity/sys_juming_effect.png",
	"res/ui/mainCity/sys_muchang_effect.png",
	"res/ui/mainCity/sys_nongchang_effect.png",
	"res/ui/mainCity/sys_kuangchang_effect.png",
	"res/ui/mainCity/sys_bingying_effect.png",
	"res/ui/mainCity/sys_huangchen_effect.png"
}
local var_0_5 = {
	"res/ui/task/get_icon_silver.png",
	"res/ui/task/get_icon_wood.png",
	"res/ui/task/get_icon_food.png",
	"res/ui/task/get_icon_gem.png",
	"res/ui/task/get_icon_soldier.png",
	"res/ui/mainCity/zcgz_area_hc_icon.png"
}
local var_0_6 = {
	48,
	-215,
	-305,
	275,
	-120,
	240
}
local var_0_7 = {
	3,
	110,
	-88,
	-135,
	-200,
	115
}

for iter_0_0 = 1, 6 do
	table.insert(var_0_0, {
		z = 10,
		type = "pic",
		name = "city_" .. tostring(iter_0_0),
		xcenter = var_0_6[iter_0_0],
		ycenter = var_0_7[iter_0_0],
		pic = var_0_1[iter_0_0],
		tag = 1000 + iter_0_0
	})
	table.insert(var_0_0, {
		z = 9,
		type = "pic",
		name = "city_effect_" .. tostring(iter_0_0),
		xcenter = var_0_6[iter_0_0],
		ycenter = var_0_7[iter_0_0],
		pic = var_0_4[iter_0_0]
	})
	table.insert(var_0_0, {
		z = 11,
		type = "pic",
		name = "city_icon_" .. tostring(iter_0_0),
		xcenter = var_0_6[iter_0_0],
		ycenter = var_0_7[iter_0_0] + 50,
		pic = var_0_2[iter_0_0]
	})
	table.insert(var_0_0, {
		z = 11,
		type = "pic",
		pic = "res/ui/mainCity/zcgz_area.png",
		name = "city_icon2_" .. tostring(iter_0_0),
		xcenter = var_0_6[iter_0_0] - 20,
		ycenter = var_0_7[iter_0_0] + 55,
		children = {
			{
				xcenter = 22,
				ycenter = 0,
				type = "pic",
				pic = var_0_3[iter_0_0]
			},
			{
				xcenter = -43,
				ycenter = 2,
				type = "pic",
				pic = var_0_5[iter_0_0]
			}
		}
	})

	if iter_0_0 == 6 then
		table.insert(var_0_0, {
			name = "city_title_bg_61",
			z = 11,
			type = "pic",
			pic = "res/ui/mainCity/bui_prof_view.png",
			xcenter = var_0_6[iter_0_0] + 15,
			ycenter = var_0_7[iter_0_0] + 25
		})
		table.insert(var_0_0, {
			name = "city_title_61",
			text = "1",
			type = "label",
			fontSize = 20,
			z = 11,
			xcenter = var_0_6[iter_0_0] + 15,
			ycenter = var_0_7[iter_0_0] + 25
		})
		table.insert(var_0_0, {
			name = "city_title_bg_62",
			z = 11,
			type = "pic",
			pic = "res/ui/mainCity/bui_prof_view.png",
			xcenter = var_0_6[iter_0_0] + 15,
			ycenter = var_0_7[iter_0_0]
		})
		table.insert(var_0_0, {
			name = "city_title_62",
			text = "2",
			type = "label",
			fontSize = 20,
			z = 11,
			xcenter = var_0_6[iter_0_0] + 15,
			ycenter = var_0_7[iter_0_0]
		})
		table.insert(var_0_0, {
			name = "city_title_bg_63",
			z = 11,
			type = "pic",
			pic = "res/ui/mainCity/bui_prof_view.png",
			xcenter = var_0_6[iter_0_0] + 15,
			ycenter = var_0_7[iter_0_0] - 25
		})
		table.insert(var_0_0, {
			name = "city_title_63",
			text = "3",
			type = "label",
			fontSize = 20,
			z = 11,
			xcenter = var_0_6[iter_0_0] + 15,
			ycenter = var_0_7[iter_0_0] - 25
		})
		table.insert(var_0_0, {
			name = "city_title_bg_64",
			z = 11,
			type = "pic",
			pic = "res/ui/mainCity/bui_prof_view.png",
			xcenter = var_0_6[iter_0_0] + 15,
			ycenter = var_0_7[iter_0_0] - 50
		})
		table.insert(var_0_0, {
			name = "city_title_64",
			text = "4",
			type = "label",
			fontSize = 20,
			z = 11,
			xcenter = var_0_6[iter_0_0] + 15,
			ycenter = var_0_7[iter_0_0] - 50
		})
		table.insert(var_0_0, {
			name = "investment",
			type = "pic",
			visible = false,
			z = 12,
			pic = "res/ui/mainCity/zcgz_area_gzhc.png",
			xcenter = var_0_6[iter_0_0],
			ycenter = var_0_7[iter_0_0] + 100,
			children = {
				{
					xcenter = 0,
					name = "investLayer",
					height = 0,
					type = "layer_color",
					ycenter = 0,
					width = 0,
					color = ccc4(0, 0, 255, 0),
					children = {
						{
							xcenter = 0,
							ycenter = -20,
							type = "button",
							buttons = {
								{
									pic2 = "res/ui/resourceArea2/zcgz_btn_round_c.png",
									name = "invest1",
									pic1 = "res/ui/resourceArea2/zcgz_btn_round.png",
									y = -60,
									x = -110,
									callBack = function()
										mainCity.control.Invest(1)
									end
								},
								{
									pic2 = "res/ui/resourceArea2/zcgz_btn_round_c.png",
									name = "invest2",
									pic1 = "res/ui/resourceArea2/zcgz_btn_round.png",
									y = -60,
									x = 0,
									callBack = function()
										mainCity.control.Invest(2)
									end
								},
								{
									pic2 = "res/ui/resourceArea2/zcgz_btn_round_c.png",
									name = "invest3",
									pic1 = "res/ui/resourceArea2/zcgz_btn_round.png",
									y = -60,
									x = 110,
									callBack = function()
										mainCity.control.Invest(3)
									end
								}
							}
						},
						{
							xcenter = -110,
							height = 0,
							ycenter = -80,
							type = "layer_color",
							width = 0,
							color = ccc4(0, 0, 255, 0),
							children = {
								{
									xcenter = 0,
									name = "rmProgress1",
									percentage = 0,
									type = "process",
									ycenter = 0,
									reverse = true,
									pic = "res/ui/resourceArea2/zcgz_area_gzhc_mj1.png",
									midPoint = ccp(0.5, 0.5),
									barType = kCCProgressTimerTypeRadial
								},
								{
									xcenter = 0,
									name = "investResource1",
									type = "pic",
									ycenter = 0,
									pic = "res/ui/task/get_icon_silver.png"
								},
								{
									xcenter = 0,
									ycenter = -35,
									pic = "res/ui/mainCity/zcgz_area_gzhc_mj_word.png",
									type = "pic"
								},
								{
									xcenter = 0,
									type = "pic_9",
									ycenter = -60,
									pic = "res/ui/mainCity/bui_prof_view.png",
									middleRect = CCRectMake(0, 0, 212, 26),
									preferedSize = CCSizeMake(100, 26)
								},
								{
									xcenter = 0,
									name = "investNum1",
									text = "12",
									type = "label",
									ycenter = -60,
									fontSize = 20
								}
							}
						},
						{
							xcenter = 0,
							height = 0,
							ycenter = -80,
							type = "layer_color",
							width = 0,
							color = ccc4(0, 0, 255, 0),
							children = {
								{
									xcenter = 0,
									name = "rmProgress2",
									percentage = 0,
									type = "process",
									ycenter = 0,
									reverse = true,
									pic = "res/ui/resourceArea2/zcgz_area_gzhc_mj1.png",
									midPoint = ccp(0.5, 0.5),
									barType = kCCProgressTimerTypeRadial
								},
								{
									xcenter = 0,
									name = "investResource2",
									type = "pic",
									ycenter = 0,
									pic = "res/ui/task/get_icon_wood.png"
								},
								{
									xcenter = 0,
									ycenter = -35,
									pic = "res/ui/mainCity/zcgz_area_gzhc_mj_word.png",
									type = "pic"
								},
								{
									xcenter = 0,
									type = "pic_9",
									ycenter = -60,
									pic = "res/ui/mainCity/bui_prof_view.png",
									middleRect = CCRectMake(0, 0, 212, 26),
									preferedSize = CCSizeMake(100, 26)
								},
								{
									xcenter = 0,
									name = "investNum2",
									text = "13",
									type = "label",
									ycenter = -60,
									fontSize = 20
								}
							}
						},
						{
							xcenter = 110,
							height = 0,
							ycenter = -80,
							type = "layer_color",
							width = 0,
							color = ccc4(0, 0, 255, 0),
							children = {
								{
									xcenter = 0,
									name = "rmProgress3",
									percentage = 0,
									type = "process",
									ycenter = 0,
									reverse = true,
									pic = "res/ui/resourceArea2/zcgz_area_gzhc_mj1.png",
									midPoint = ccp(0.5, 0.5),
									barType = kCCProgressTimerTypeRadial
								},
								{
									xcenter = 0,
									name = "investResource3",
									type = "pic",
									ycenter = 0,
									pic = "res/ui/task/get_icon_food.png"
								},
								{
									xcenter = 0,
									ycenter = -35,
									pic = "res/ui/mainCity/zcgz_area_gzhc_mj_word.png",
									type = "pic"
								},
								{
									xcenter = 0,
									type = "pic_9",
									ycenter = -60,
									pic = "res/ui/mainCity/bui_prof_view.png",
									middleRect = CCRectMake(0, 0, 212, 26),
									preferedSize = CCSizeMake(100, 26)
								},
								{
									xcenter = 0,
									name = "investNum3",
									text = "14",
									type = "label",
									ycenter = -60,
									fontSize = 20
								}
							}
						}
					}
				},
				{
					xcenter = 0,
					name = "remouldLayer",
					height = 0,
					type = "layer_color",
					ycenter = 0,
					width = 0,
					color = ccc4(0, 0, 255, 0),
					children = {}
				},
				{
					xcenter = 0,
					type = "pic",
					ycenter = -33,
					pic = "res/ui/mainCity/bui_prof_view.png",
					children = {
						{
							xcenter = 0,
							name = "totleProgress",
							text = "1",
							type = "label",
							ycenter = 0,
							fontSize = 20,
							z = 11
						}
					}
				}
			}
		})
	else
		table.insert(var_0_0, {
			z = 11,
			type = "pic",
			pic = "res/ui/mainCity/bui_prof_view.png",
			name = "city_title_bg_" .. tostring(iter_0_0),
			xcenter = var_0_6[iter_0_0],
			ycenter = var_0_7[iter_0_0] + 25
		})
		table.insert(var_0_0, {
			text = "",
			type = "label",
			fontSize = 20,
			z = 11,
			name = "city_title_" .. tostring(iter_0_0),
			xcenter = var_0_6[iter_0_0],
			ycenter = var_0_7[iter_0_0] + 25
		})
		table.insert(var_0_0, {
			z = 11,
			type = "pic",
			pic = "res/ui/mainCity/prof_150.png",
			name = "city_icon_up_" .. tostring(iter_0_0),
			xcenter = var_0_6[iter_0_0] + 60,
			ycenter = var_0_7[iter_0_0] + 50
		})
	end

	if iter_0_0 == 2 then
		table.insert(var_0_0, {
			name = "city_title_bg_silk",
			visible = false,
			type = "pic",
			z = 11,
			pic = "res/ui/mainCity/bui_prof_view.png",
			xcenter = var_0_6[iter_0_0],
			ycenter = var_0_7[iter_0_0]
		})
		table.insert(var_0_0, {
			name = "city_title_silk",
			visible = false,
			type = "label",
			text = "",
			fontSize = 20,
			z = 11,
			xcenter = var_0_6[iter_0_0],
			ycenter = var_0_7[iter_0_0]
		})
	end

	if iter_0_0 == 4 then
		table.insert(var_0_0, {
			name = "city_title_bg_gem",
			visible = false,
			type = "pic",
			z = 11,
			pic = "res/ui/mainCity/bui_prof_view.png",
			xcenter = var_0_6[iter_0_0],
			ycenter = var_0_7[iter_0_0]
		})
		table.insert(var_0_0, {
			name = "city_title_gem",
			visible = false,
			type = "label",
			text = "",
			fontSize = 20,
			z = 11,
			xcenter = var_0_6[iter_0_0],
			ycenter = var_0_7[iter_0_0]
		})
	end
end

function getMainCityUiData()
	return var_0_0
end
