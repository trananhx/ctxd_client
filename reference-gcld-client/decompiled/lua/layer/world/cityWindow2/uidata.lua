local var_0_0 = require("res/native/offset").get("layer.world.cityWindow2")
local var_0_1 = class("cityWindowUiData")

function var_0_1.ctor(arg_1_0)
	local function var_1_0(arg_2_0, arg_2_1)
		arg_2_0[#arg_2_0 + 1] = arg_2_1

		return arg_2_1
	end

	arg_1_0.data = {}
	arg_1_0.data.background = {
		y = 0,
		x = 0,
		visible = false,
		type = "pic",
		pic = "",
		children = {}
	}

	local var_1_1 = var_1_0(arg_1_0.data.background.children, {
		x = 0,
		name = "cityBackground",
		y = 0,
		type = "pic",
		pic = "frame:city_view_bg.png",
		children = {}
	})
	local var_1_2 = var_1_0(var_1_1.children, {
		xcenter = 0,
		name = "cityWarInfo",
		y = -30,
		type = "pic",
		visible = false,
		pic = "res/ui/world/operateIcon/city_foot_view_bg.png",
		children = {}
	})

	var_1_0(var_1_1.children, {
		xcenter = 0,
		name = "specialCityExplain",
		type = "label",
		ycenter = -55,
		z = 100,
		height = 0,
		text = "",
		fontName = "Thonburi-Bold",
		width = 120,
		color = ccc3(255, 255, 204),
		fontSize = 18 + (var_0_0.explainFntSz or 0),
		color = ccc3(0, 255, 0)
	})
	var_1_0(var_1_1.children, {
		xcenter = 0,
		name = "specialCityName",
		z = 100,
		type = "pic",
		ycenter = 50,
		visible = false,
		pic = "res/ui/world/tscc_tit_alp.png"
	})
	var_1_0(var_1_2.children, {
		xcenter = 0,
		scale = 0.5,
		type = "pic",
		ycenter = 0,
		pic = "frame:city_vs.png"
	})
	var_1_0(var_1_2.children, {
		xcenter = 45,
		name = "cityDefBg",
		type = "pic",
		ycenter = 0,
		pic = "frame:cityWindowNationBg.png",
		children = {
			{
				xcenter = 0,
				name = "cityDef",
				type = "pic",
				ycenter = 0,
				pic = "frame:cityWindowWei.png"
			},
			{
				fontSize = 20,
				name = "cityDefNum",
				text = "100",
				type = "label",
				ycenter = -13,
				xcenter = 0
			},
			{
				text = "",
				name = "cityExtraDefNum",
				fontSize = 20,
				type = "label",
				xcenter = 0,
				ycenter = 24,
				color = colorQuality[7]
			}
		}
	})

	for iter_1_0 = 1, 3 do
		var_1_0(var_1_2.children, {
			visible = false,
			type = "pic",
			ycenter = 0,
			pic = "frame:cityWindowNationBg.png",
			name = "cityAttBg_" .. iter_1_0,
			xcenter = -45 - (iter_1_0 - 1) * 45,
			children = {
				{
					xcenter = 0,
					type = "pic",
					ycenter = 0,
					pic = "frame:cityWindowWei.png",
					name = "cityAtt_" .. iter_1_0
				},
				{
					fontSize = 20,
					text = "100",
					type = "label",
					ycenter = -13,
					xcenter = 0,
					name = "cityAttNum_" .. iter_1_0
				},
				{
					text = "",
					fontSize = 20,
					type = "label",
					xcenter = 0,
					ycenter = 24,
					color = colorQuality[7],
					name = "cityExtraAttNum_" .. iter_1_0
				}
			}
		})
	end

	local var_1_3 = var_1_0(arg_1_0.data.background.children, {
		xcenter = 0,
		name = "manzuInfo",
		fontSize = 20,
		type = "pic",
		ycenter = 0,
		visible = false,
		pic = "",
		children = {}
	})

	var_1_0(var_1_3.children, {
		x = 0,
		y = 60,
		pic = "res/ui/world/sl_mz_dc.png",
		type = "pic"
	})

	if conf.language == "kr" then
		var_1_0(var_1_3.children, {
			fontSize = 16,
			name = "qingmidu",
			type = "label",
			y = 35,
			x = 0,
			text = language.get(400012)
		})
		var_1_0(var_1_3.children, {
			fontSize = 16,
			name = "bingdengji",
			type = "label",
			y = 15,
			x = 0,
			text = language.get(400013)
		})
		var_1_0(var_1_3.children, {
			fontSize = 16,
			name = "nengfadong",
			type = "label",
			y = -5,
			x = 0,
			text = language.get(400014)
		})
		var_1_0(var_1_3.children, {
			fontSize = 16,
			y = -41,
			type = "label",
			x = 0,
			text = language.get(400015),
			align = kCCTextAlignmentCenter,
			color = colorQuality[4]
		})
	else
		var_1_0(var_1_3.children, {
			fontSize = 18,
			name = "qingmidu",
			type = "label",
			y = 25,
			x = 0,
			text = language.get(400012)
		})
		var_1_0(var_1_3.children, {
			fontSize = 18,
			name = "bingdengji",
			type = "label",
			y = 5,
			x = 0,
			text = language.get(400013)
		})
		var_1_0(var_1_3.children, {
			fontSize = 18,
			name = "nengfadong",
			type = "label",
			y = -15,
			x = 0,
			text = language.get(400014)
		})
		var_1_0(var_1_3.children, {
			fontSize = 18,
			y = -50,
			type = "label",
			x = 0,
			text = language.get(400015),
			align = kCCTextAlignmentCenter,
			color = colorQuality[4]
		})
	end

	local var_1_4 = var_1_0(arg_1_0.data.background.children, {
		xcenter = 0,
		name = "mainCityInfo",
		fontSize = 20,
		type = "pic",
		ycenter = 0,
		visible = false,
		pic = "",
		children = {}
	})

	var_1_0(var_1_4.children, {
		fontSize = 24,
		name = "mainCityName",
		y = 60,
		type = "label",
		x = 0
	})
	var_1_0(var_1_4.children, {
		fontSize = 20,
		name = "mainCityLevel",
		type = "label",
		y = 30,
		x = 0,
		text = language.get(400016),
		color = colorForce[2]
	})
	var_1_0(var_1_4.children, {
		fontSize = 16,
		name = "countDown1",
		type = "label",
		y = 0,
		x = -40,
		text = language.get(400017)
	})
	var_1_0(var_1_4.children, {
		fontSize = 16,
		name = "countDown2",
		type = "label",
		y = -30,
		x = -40,
		text = language.get(400018)
	})

	local var_1_5 = {
		{
			x = -118.88,
			y = 38.62
		},
		{
			x = -50.84,
			y = 114.19
		},
		{
			x = 50.84,
			y = 114.19
		},
		{
			x = 118.88,
			y = 38.62
		},
		{
			x = 100,
			y = -67
		}
	}

	for iter_1_1 = 1, 5 do
		var_1_0(arg_1_0.data.background.children, {
			visible = false,
			type = "pic",
			pic = "frame:city_gene_btn_a.png",
			name = "cityGeneral_" .. iter_1_1,
			x = var_1_5[iter_1_1].x,
			y = var_1_5[iter_1_1].y,
			children = {
				{
					xcenter = 0,
					scale = 0.7,
					type = "pic",
					ycenter = 0,
					pic = "",
					name = "cityGeneralHead_" .. iter_1_1
				}
			}
		})
	end

	var_1_0(arg_1_0.data.background.children, {
		visible = false,
		name = "juntuan",
		x = -118.88,
		type = "pic",
		y = 38.62,
		pic = "frame:city_gene_btn_a.png",
		children = {
			{
				xcenter = 0,
				name = "juntuan_head",
				scale = 0.7,
				type = "pic",
				ycenter = 0,
				pic = "res/ui/world/juntuan/fightPic_juntuan.png"
			}
		}
	})
	var_1_0(arg_1_0.data.background.children, {
		visible = false,
		name = "juntuanEnter",
		x = -118.88,
		type = "pic",
		y = 38.62,
		pic = "frame:city_gene_btn_a.png",
		children = {
			{
				xcenter = 0,
				scale = 0.7,
				type = "pic",
				ycenter = 0,
				pic = "res/ui/world/juntuan/fightPic_juntuan.png",
				children = {
					{
						xcenter = 0,
						y = 10,
						scale = 1.4,
						type = "pic",
						pic = "res/ui/world/juntuan/jtsj_word_zjjt.png"
					}
				}
			}
		}
	})
	var_1_0(arg_1_0.data.background.children, {
		visible = false,
		name = "personJTEnter",
		x = -118.88,
		type = "pic",
		y = -50,
		pic = "frame:city_gene_btn_a.png",
		children = {
			{
				xcenter = 0,
				scale = 0.7,
				type = "pic",
				ycenter = 0,
				pic = "res/ui/world/juntuan/fightPic_juntuan.png",
				children = {
					{
						xcenter = 0,
						y = 10,
						scale = 1.4,
						type = "pic",
						pic = "res/ui/world/juntuan/jttz_word_grjt.png"
					}
				}
			}
		}
	})
	var_1_0(arg_1_0.data.background.children, {
		visible = false,
		name = "jianzaodui",
		x = 100,
		type = "pic",
		y = -67,
		pic = "frame:city_gene_btn_a.png",
		children = {
			{
				xcenter = 0,
				name = "jianzaodui_head",
				scale = 0.7,
				type = "pic",
				ycenter = 0,
				pic = "res/ui/common/fightPic/fightPic_jianzaodui.png"
			}
		}
	})

	local var_1_6 = var_1_0(arg_1_0.data.background.children, {
		x = 0,
		name = "progressBg",
		y = -167,
		type = "pic",
		visible = false,
		pic = "frame:cc_manzu_bg.png",
		children = {}
	})

	var_1_0(var_1_6.children, {
		text = "Lv.5",
		name = "levelLabel",
		visible = false,
		type = "label",
		fontSize = 24,
		y = 50,
		left = 30
	})
	var_1_0(var_1_6.children, {
		xcenter = -20,
		y = 25,
		type = "pic",
		pic = "frame:shoumaijingdudi.png",
		children = {
			{
				xcenter = 0,
				name = "progressValue",
				percentage = 20,
				type = "process",
				ycenter = 0,
				pic = "frame:shoumaijingdutiao.png"
			},
			{
				fontSize = 18,
				name = "progressLabel",
				text = "20%",
				type = "label",
				ycenter = 0,
				xcenter = 95
			}
		}
	})
	var_1_0(arg_1_0.data.background.children, {
		xcenter = 0,
		name = "cityButtons",
		type = "button",
		ycenter = -90,
		buttons = {
			{
				pic2 = "frame:city_btn_see_c.png",
				name = "cityLook",
				pic1 = "frame:city_btn_see_a.png",
				y = -15,
				x = 0
			},
			{
				pic2 = "res/ui/world/operateIcon/city_btn_view_c.png",
				name = "cityLook2",
				pic1 = "res/ui/world/operateIcon/city_btn_view_a.png",
				y = 20,
				visible = false,
				x = -100
			},
			{
				pic2 = "frame:city_event_btn_c.png",
				name = "cityEvent",
				pic1 = "frame:city_event_btn_a.png",
				visible = false
			},
			{
				pic2 = "frame:city_btn_conve_c.png",
				name = "cityConvene",
				pic1 = "frame:city_btn_conve_a.png",
				y = 83,
				x = 0
			},
			{
				pic2 = "res/ui/world/operateIcon/city_btn_hy_c.png",
				name = "switchPage",
				pic1 = "res/ui/world/operateIcon/city_btn_hy_a.png",
				y = 20,
				x = -100
			},
			{
				pic2 = "frame:city_btn_order_c.png",
				name = "cityOrder",
				pic1 = "frame:city_btn_order_a.png",
				y = 122,
				visible = false,
				x = -119
			},
			{
				pic2 = "res/ui/world/operateIcon/city_btn_zmwg_c.png",
				name = "plan1",
				pic1 = "res/ui/world/operateIcon/city_btn_zmwg_a.png",
				y = 197,
				visible = false,
				x = -51
			},
			{
				pic2 = "res/ui/world/operateIcon/city_btn_zmwg_c.png",
				name = "plan2",
				pic1 = "res/ui/world/operateIcon/city_btn_zmwg_a.png",
				y = 197,
				visible = false,
				x = 50
			},
			{
				pic2 = "res/ui/world/operateIcon/city_btn_sdl_c.png",
				name = "shaOrder",
				pic1 = "res/ui/world/operateIcon/city_btn_sdl_a.png",
				y = 121,
				visible = false,
				x = 118
			},
			{
				pic2 = "res/ui/world/operateIcon/city_btn_jz_c.png",
				name = "donate",
				pic1 = "res/ui/world/operateIcon/city_btn_jz_a.png",
				y = -15,
				visible = false,
				x = 0
			},
			{
				pic2 = "res/ui/world/operateIcon/city_btn_sm_c.png",
				name = "buy",
				pic1 = "res/ui/world/operateIcon/city_btn_sm_a.png",
				y = -15,
				visible = false,
				x = 0
			},
			{
				pic2 = "res/ui/world/operateIcon/city_btn_fd_c.png",
				name = "fadong",
				pic1 = "res/ui/world/operateIcon/city_btn_fd_a.png",
				y = -15,
				visible = false,
				x = 0
			},
			{
				pic2 = "res/ui/world/operateIcon/city_btn_js_c.png",
				name = "mzJiasu",
				pic1 = "res/ui/world/operateIcon/city_btn_js_a.png",
				y = -15,
				visible = false,
				x = 0
			},
			{
				pic2 = "res/ui/world/operateIcon/city_btn_js_c.png",
				name = "farmJiasu",
				pic1 = "res/ui/world/operateIcon/city_btn_js_a.png",
				y = -15,
				visible = false,
				x = 0
			},
			{
				pic2 = "res/ui/world/operateIcon/city_btn_xq_c.png",
				name = "detail",
				pic1 = "res/ui/world/operateIcon/city_btn_xq_a.png",
				y = 20,
				visible = false,
				x = -100
			},
			{
				pic2 = "res/ui/world/autoBattle/city_btn_xz_c.png",
				name = "xuezhan",
				pic1 = "res/ui/world/autoBattle/city_btn_xz_a.png",
				y = 20,
				visible = false,
				x = 100
			},
			{
				pic2 = "res/ui/world/autoBattle/city_btn_stan_c.png",
				name = "jianshou",
				pic1 = "res/ui/world/autoBattle/city_btn_stan_a.png",
				y = 20,
				visible = false,
				x = 100
			},
			{
				pic2 = "res/ui/world/autoBattle/city_btn_ghmu_c.png",
				name = "genghuanmubiao",
				pic1 = "res/ui/world/autoBattle/city_btn_ghmu_a.png",
				y = 20,
				visible = false,
				x = 100
			},
			{
				pic2 = "res/ui/world/buildNation/city_btn_fqjz_c.png",
				name = "jianzaoyaosai",
				pic1 = "res/ui/world/buildNation/city_btn_fqjz.png",
				y = 121,
				visible = false,
				x = -119
			},
			{
				pic2 = "res/ui/world/buildNation/city_btn_fqjg_c.png",
				name = "jiaguyaosai",
				pic1 = "res/ui/world/buildNation/city_btn_fqjg.png",
				y = 121,
				visible = false,
				x = -119
			},
			{
				pic2 = "res/ui/world/buildNation/city_btn_tyjz_c.png",
				name = "tiyijianzao",
				pic1 = "res/ui/world/buildNation/city_btn_tyjz.png",
				y = 121,
				visible = false,
				x = -119
			},
			{
				pic2 = "res/ui/world/operateIcon/city_btn_xiulu_c.png",
				name = "repairRoad",
				pic1 = "res/ui/world/operateIcon/city_btn_xiulu.png",
				y = 121,
				visible = false,
				x = -119
			},
			{
				pic2 = "res/ui/world/operateIcon/city_btn_biguan_c.png",
				name = "closeRoad",
				pic1 = "res/ui/world/operateIcon/city_btn_biguan.png",
				y = 121,
				visible = false,
				x = -119
			},
			{
				pic2 = "res/ui/world/operateIcon/gjgs_world_btn_xlcx_c.png",
				name = "repairRoadFind",
				pic1 = "res/ui/world/operateIcon/gjgs_world_btn_xlcx.png",
				y = 121,
				visible = false,
				x = -119
			},
			{
				pic2 = "res/ui/world/operateIcon/gjgs_world_btn_bgcx_c.png",
				name = "closeRoadFind",
				pic1 = "res/ui/world/operateIcon/gjgs_world_btn_bgcx.png",
				y = 197,
				visible = false,
				x = -51
			}
		}
	})
end

function var_0_1.getData(arg_3_0)
	return arg_3_0.data or {}
end

return var_0_1
