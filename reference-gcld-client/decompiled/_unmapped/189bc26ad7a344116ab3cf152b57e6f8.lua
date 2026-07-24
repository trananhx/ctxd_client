local var_0_0 = {}
local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.zhanLingX = 0
	var_0_1.zhanLingY = 10
	var_0_1.cityNameX = 40
	var_0_1.cityNameY = 10
	var_0_1.doublePurchaseX = -52
	var_0_1.doublePurchaseY = -10
	var_0_1.exchangeDescX = 20
	var_0_1.exchangescale = 1.4
elseif conf.language == "tha" then
	var_0_1.zhanLingX = 0
	var_0_1.zhanLingY = 10
	var_0_1.cityNameX = 40
	var_0_1.cityNameY = 10
	var_0_1.doublePurchaseX = -52
	var_0_1.doublePurchaseY = -10
	var_0_1.exchangeDescX = 20
	var_0_1.exchangescale = 1
else
	var_0_1.zhanLingX = 0
	var_0_1.zhanLingY = 0
	var_0_1.cityNameX = 0
	var_0_1.cityNameY = 0
	var_0_1.doublePurchaseX = 0
	var_0_1.doublePurchaseY = 0
	var_0_1.exchangeDescX = 0
	var_0_1.exchangescale = 1
end

var_0_0.blackMarketMain = {
	xcenter = 0,
	name = "scrollView_parent",
	type = "pic",
	ycenter = -30,
	pic = "res/ui/resource/view_heishi.jpg",
	children = {
		{
			x = 660,
			y = 480,
			pic = "frame:tit_dedao.png",
			type = "pic"
		},
		{
			x = 180,
			y = 480,
			pic = "frame:tit_huanchu.png",
			type = "pic"
		},
		{
			type = "button",
			buttons = {
				{
					name = "exchnage1",
					y = 300,
					x = 180,
					pic1 = {
						pics = {
							{
								pic = "res/ui/resource/list_heishi_bg.jpg",
								children = {
									{
										fontSize = 20,
										font = "Thonburi",
										name = "title_11",
										type = "label",
										y = 265,
										x = 111,
										text = language.get(10102)
									},
									{
										fontSize = 20,
										font = "Thonburi",
										name = "value_11",
										type = "label",
										text = "100",
										y = 100,
										x = 111
									},
									{
										x = 111,
										name = "icon_11",
										y = 170,
										type = "pic",
										pic = "frame:mucai.jpg"
									},
									{
										x = 111,
										y = 30,
										pic = "frame:btn_duihuan.png",
										type = "pic"
									},
									{
										font = "Thonburi",
										fontSize = 20,
										type = "menu_label",
										y = 30,
										x = 111,
										text = language.get(73004),
										color = colorText[10004]
									}
								}
							}
						}
					},
					pic2 = {
						pics = {
							{
								pic = "res/ui/resource/list_heishi_bg.jpg",
								children = {
									{
										fontSize = 20,
										font = "Thonburi",
										name = "title_12",
										type = "label",
										y = 265,
										x = 111,
										text = language.get(10102)
									},
									{
										fontSize = 20,
										font = "Thonburi",
										name = "value_12",
										type = "label",
										text = "100",
										y = 100,
										x = 111
									},
									{
										x = 111,
										name = "icon_12",
										y = 170,
										type = "pic",
										pic = "frame:mucai.jpg"
									},
									{
										x = 111,
										y = 30,
										pic = "frame:btn_duihuan_click.png",
										type = "pic"
									},
									{
										font = "Thonburi",
										fontSize = 20,
										type = "menu_label",
										y = 30,
										x = 111,
										text = language.get(73004),
										color = colorText[10004]
									}
								}
							}
						}
					}
				},
				{
					name = "exchnage2",
					y = 300,
					x = 530,
					pic1 = {
						pics = {
							{
								pic = "res/ui/resource/list_heishi_bg.jpg",
								children = {
									{
										fontSize = 20,
										font = "Thonburi",
										name = "title_21",
										type = "label",
										y = 265,
										x = 111,
										text = language.get(10102)
									},
									{
										fontSize = 20,
										font = "Thonburi",
										name = "value_21",
										type = "label",
										text = "100",
										y = 100,
										x = 111
									},
									{
										x = 111,
										name = "icon_21",
										y = 170,
										type = "pic",
										pic = "frame:mucai.jpg"
									},
									{
										x = 111,
										y = 30,
										pic = "frame:btn_duihuan.png",
										type = "pic"
									},
									{
										font = "Thonburi",
										fontSize = 20,
										type = "menu_label",
										y = 30,
										x = 111,
										text = language.get(73005),
										color = colorText[10004]
									}
								}
							}
						}
					},
					pic2 = {
						pics = {
							{
								pic = "res/ui/resource/list_heishi_bg.jpg",
								children = {
									{
										fontSize = 20,
										font = "Thonburi",
										name = "title_22",
										type = "label",
										y = 265,
										x = 111,
										text = language.get(10102)
									},
									{
										fontSize = 20,
										font = "Thonburi",
										name = "value_22",
										type = "label",
										text = "100",
										y = 100,
										x = 111
									},
									{
										x = 111,
										name = "icon_22",
										y = 170,
										type = "pic",
										pic = "frame:mucai.jpg"
									},
									{
										x = 111,
										y = 30,
										pic = "frame:btn_duihuan_click.png",
										type = "pic"
									},
									{
										font = "Thonburi",
										fontSize = 20,
										type = "menu_label",
										y = 30,
										x = 111,
										text = language.get(73005),
										color = colorText[10004]
									}
								}
							}
						}
					}
				},
				{
					name = "exchnage3",
					y = 300,
					x = 780,
					pic1 = {
						pics = {
							{
								pic = "res/ui/resource/list_heishi_bg.jpg",
								children = {
									{
										fontSize = 20,
										font = "Thonburi",
										name = "title_31",
										type = "label",
										y = 265,
										x = 111,
										text = language.get(10102)
									},
									{
										fontSize = 20,
										font = "Thonburi",
										name = "value_31",
										type = "label",
										text = "100",
										y = 100,
										x = 111
									},
									{
										x = 111,
										name = "icon_31",
										y = 170,
										type = "pic",
										pic = "frame:mucai.jpg"
									},
									{
										x = 111,
										y = 30,
										pic = "frame:btn_duihuan.png",
										type = "pic"
									},
									{
										font = "Thonburi",
										fontSize = 20,
										type = "menu_label",
										y = 30,
										x = 111,
										text = language.get(73005),
										color = colorText[10004]
									}
								}
							}
						}
					},
					pic2 = {
						pics = {
							{
								pic = "res/ui/resource/list_heishi_bg.jpg",
								children = {
									{
										fontSize = 20,
										font = "Thonburi",
										name = "title_32",
										type = "label",
										y = 265,
										x = 111,
										text = language.get(10102)
									},
									{
										fontSize = 20,
										font = "Thonburi",
										name = "value_32",
										type = "label",
										text = "100",
										y = 100,
										x = 111
									},
									{
										x = 111,
										name = "icon_32",
										y = 170,
										type = "pic",
										pic = "frame:mucai.jpg"
									},
									{
										x = 111,
										y = 30,
										pic = "frame:btn_duihuan_click.png",
										type = "pic"
									},
									{
										font = "Thonburi",
										fontSize = 20,
										type = "menu_label",
										y = 30,
										x = 111,
										text = language.get(73005),
										color = colorText[10004]
									}
								}
							}
						}
					}
				}
			}
		},
		{
			xcenter = -258,
			type = "pic",
			ycenter = -193,
			pic = "res/ui/resource/di-chengchi.png",
			children = {
				{
					x = 85,
					name = "chengchi",
					y = 55,
					type = "pic",
					pic = "frame:chengchi.png"
				},
				{
					fontSize = 20,
					font = "Thonburi",
					name = "zhanling",
					type = "label",
					text = language.get(73001),
					x = 200 + var_0_1.zhanLingX,
					y = 85 + var_0_1.zhanLingY,
					color = ccc3(227, 251, 195)
				},
				{
					fontSize = 20,
					font = "Thonburi",
					name = "cityName",
					type = "label",
					text = language.get(73006),
					x = 240 + var_0_1.cityNameX,
					y = 85 + var_0_1.cityNameY,
					color = ccc3(94, 207, 64)
				},
				{
					fontSize = 20,
					font = "Thonburi",
					name = "goumailiangfanbei",
					type = "label",
					text = language.get(73007),
					x = 310 + var_0_1.doublePurchaseX,
					y = 85 + var_0_1.doublePurchaseY,
					color = ccc3(227, 251, 195)
				},
				{
					type = "button",
					buttons = {
						{
							pic2 = "frame:anniu-qianwang1.png",
							name = "btn_go",
							pic1 = "frame:anniu-qianwang.png",
							y = 40,
							pic3 = "res/ui/resource/btn1_yel_g.png",
							x = 220,
							enable = true
						}
					}
				},
				{
					fontSize = 20,
					name = "go_label",
					strokeSize = 2,
					type = "label",
					font = "Thonburi",
					y = 40,
					x = 220,
					text = language.get(73008),
					color = colorText[10004],
					strokeColor = colorText[10005]
				}
			}
		},
		{
			xcenter = 192,
			name = "cooldown_parent",
			type = "pic",
			ycenter = -193,
			pic = "res/ui/resource/di-qinmidu.png",
			children = {
				{
					fontSize = 20,
					name = "chengchi_got",
					type = "label",
					height = 0,
					font = "Thonburi",
					y = 85,
					width = 450,
					text = language.get(73009),
					x = 230 + var_0_1.exchangeDescX
				},
				{
					fontSize = 20,
					name = "chengchi_ungot",
					type = "label",
					height = 0,
					font = "Thonburi",
					y = 125,
					width = 450,
					text = language.get(73010),
					x = 230 + var_0_1.exchangeDescX
				},
				{
					fontSize = 20,
					font = "Thonburi",
					name = "tradeCdLabel",
					type = "label",
					y = 40,
					x = 142,
					text = language.get(73011)
				},
				{
					type = "button",
					buttons = {
						{
							pic2 = "frame:anniu-qianwang1.png",
							name = "btn_clear",
							pic1 = "frame:anniu-qianwang.png",
							y = 40,
							x = 410,
							enable = true
						}
					}
				},
				{
					fontSize = 20,
					font = "Thonburi",
					name = "text_clear",
					type = "label",
					y = 40,
					x = 410,
					text = language.get(73012)
				}
			}
		}
	}
}

function getBlackMarketData()
	return var_0_0
end
