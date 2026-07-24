local var_0_0 = {}
local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.leftTopX1 = 10
	var_0_1.leftTopX2 = 14
	var_0_1.leftTopX3 = 40
	var_0_1.rightTopTimeX = 40
	var_0_1.zhanLingX = 0
	var_0_1.zhanLingY = 10
	var_0_1.cityNameX = 40
	var_0_1.cityNameY = 10
	var_0_1.doublePurchaseX = -60
	var_0_1.doublePurchaseY = -10
elseif conf.language == "tha" then
	var_0_1.leftTopX1 = 10
	var_0_1.leftTopX2 = 14
	var_0_1.leftTopX3 = 40
	var_0_1.rightTopTimeX = 40
	var_0_1.zhanLingX = 0
	var_0_1.zhanLingY = 10
	var_0_1.cityNameX = 40
	var_0_1.cityNameY = 10
	var_0_1.doublePurchaseX = -64
	var_0_1.doublePurchaseY = -10
elseif conf.language == "kr" then
	var_0_1.leftTopX1 = 0
	var_0_1.leftTopX2 = 0
	var_0_1.leftTopX3 = 20
	var_0_1.rightTopTimeX = 0
	var_0_1.zhanLingX = 0
	var_0_1.zhanLingY = 0
	var_0_1.cityNameX = 0
	var_0_1.cityNameY = 0
	var_0_1.doublePurchaseX = 0
	var_0_1.doublePurchaseY = 0
else
	var_0_1.leftTopX1 = 0
	var_0_1.leftTopX2 = 0
	var_0_1.leftTopX3 = 0
	var_0_1.rightTopTimeX = 0
	var_0_1.zhanLingX = 0
	var_0_1.zhanLingY = 0
	var_0_1.cityNameX = 0
	var_0_1.cityNameY = 0
	var_0_1.doublePurchaseX = 0
	var_0_1.doublePurchaseY = 0
end

var_0_0.marketMenu = {
	xcenter = 0,
	type = "pic",
	ycenter = -50,
	pic = "res/ui/resource/di2.jpg",
	children = {
		{
			name = "buy_parent",
			type = "button",
			buttons = {
				{
					name = "buy_1",
					y = 300,
					x = 185.4,
					enable = true,
					pic1 = {
						pics = {
							{
								pic = "res/ui/resource/js_list_bg.jpg",
								children = {
									{
										fontSize = 20,
										font = "Thonburi",
										name = "title_11",
										type = "label",
										y = 270,
										x = 110,
										text = language.get(10102) .. "x700",
										color = ccc3(227, 251, 195)
									},
									{
										x = 108,
										name = "icon_11",
										y = 180,
										type = "pic",
										pic = "frame:mucai.jpg"
									},
									{
										fontSize = 20,
										font = "Thonburi",
										name = "tip_11",
										type = "label",
										y = 155,
										x = 107,
										text = "",
										color = ccc3(255, 255, 0)
									},
									{
										font = "Thonburi",
										fontSize = 20,
										type = "label",
										y = 120,
										x = 110,
										text = language.get(72001),
										color = ccc3(227, 251, 195)
									},
									{
										x = 90,
										name = "gold_11",
										y = 80,
										type = "pic",
										pic = "frame:icon_silver.png"
									},
									{
										fontSize = 20,
										font = "Thonburi",
										name = "cost_11",
										type = "label",
										y = 80,
										x = 130,
										text = "800000",
										color = ccc3(227, 251, 195)
									},
									{
										x = 110,
										y = 29,
										pic = "frame:btn_goumai_a.png",
										type = "pic"
									}
								}
							}
						}
					},
					pic2 = {
						pics = {
							{
								pic = "res/ui/resource/js_list_bg.jpg",
								children = {
									{
										fontSize = 20,
										font = "Thonburi",
										name = "title_12",
										type = "label",
										y = 270,
										x = 110,
										text = language.get(10102) .. "x400",
										color = ccc3(227, 251, 195)
									},
									{
										x = 108,
										name = "icon_12",
										y = 180,
										type = "pic",
										pic = "frame:mucai.jpg"
									},
									{
										fontSize = 20,
										font = "Thonburi",
										name = "tip_12",
										type = "label",
										y = 155,
										x = 107,
										text = "",
										color = ccc3(255, 255, 0)
									},
									{
										font = "Thonburi",
										fontSize = 20,
										type = "label",
										y = 120,
										x = 110,
										text = language.get(72001),
										color = ccc3(227, 251, 195)
									},
									{
										x = 90,
										name = "gold_12",
										y = 80,
										type = "pic",
										pic = "frame:icon_silver.png"
									},
									{
										fontSize = 20,
										font = "Thonburi",
										name = "cost_12",
										type = "label",
										y = 80,
										x = 130,
										text = "800000",
										color = ccc3(227, 251, 195)
									},
									{
										x = 110,
										y = 29,
										pic = "frame:btn_goumai_click.png",
										type = "pic"
									}
								}
							}
						}
					}
				},
				{
					name = "buy_2",
					y = 300,
					x = 463.5,
					enable = true,
					pic1 = {
						pics = {
							{
								pic = "res/ui/resource/js_list_bg.jpg",
								children = {
									{
										fontSize = 20,
										font = "Thonburi",
										name = "title_21",
										type = "label",
										y = 270,
										x = 110,
										text = language.get(10102) .. "x500",
										color = ccc3(227, 251, 195)
									},
									{
										x = 108,
										name = "icon_21",
										y = 180,
										type = "pic",
										pic = "frame:mucai.jpg"
									},
									{
										fontSize = 20,
										font = "Thonburi",
										name = "tip_21",
										type = "label",
										y = 155,
										x = 107,
										text = "",
										color = ccc3(255, 255, 0)
									},
									{
										font = "Thonburi",
										fontSize = 20,
										type = "label",
										y = 120,
										x = 110,
										text = language.get(72001),
										color = ccc3(227, 251, 195)
									},
									{
										x = 90,
										name = "gold_21",
										y = 80,
										type = "pic",
										pic = "frame:icon_silver.png"
									},
									{
										fontSize = 20,
										font = "Thonburi",
										name = "cost_21",
										type = "label",
										y = 80,
										x = 130,
										text = "800000",
										color = ccc3(227, 251, 195)
									},
									{
										x = 110,
										y = 29,
										pic = "frame:btn_goumai_a.png",
										type = "pic"
									}
								}
							}
						}
					},
					pic2 = {
						pics = {
							{
								pic = "res/ui/resource/js_list_bg.jpg",
								children = {
									{
										fontSize = 20,
										font = "Thonburi",
										name = "title_22",
										type = "label",
										y = 270,
										x = 110,
										text = language.get(10102) .. "x500",
										color = ccc3(227, 251, 195)
									},
									{
										x = 108,
										name = "icon_22",
										y = 180,
										type = "pic",
										pic = "frame:mucai.jpg"
									},
									{
										fontSize = 20,
										font = "Thonburi",
										name = "tip_22",
										type = "label",
										y = 155,
										x = 107,
										text = "",
										color = ccc3(255, 255, 0)
									},
									{
										font = "Thonburi",
										fontSize = 20,
										type = "label",
										y = 120,
										x = 110,
										text = language.get(72001),
										color = ccc3(227, 251, 195)
									},
									{
										x = 90,
										name = "gold_22",
										y = 80,
										type = "pic",
										pic = "frame:icon_silver.png"
									},
									{
										fontSize = 20,
										font = "Thonburi",
										name = "cost_22",
										type = "label",
										y = 80,
										x = 130,
										text = "800000",
										color = ccc3(227, 251, 195)
									},
									{
										x = 110,
										y = 29,
										pic = "frame:btn_goumai_click.png",
										type = "pic"
									}
								}
							}
						}
					}
				},
				{
					name = "buy_3",
					y = 300,
					x = 741.6,
					enable = true,
					pic1 = {
						pics = {
							{
								pic = "res/ui/resource/js_list_bg.jpg",
								children = {
									{
										fontSize = 20,
										font = "Thonburi",
										name = "title_31",
										type = "label",
										y = 270,
										x = 110,
										text = language.get(10102) .. "x500",
										color = ccc3(227, 251, 195)
									},
									{
										x = 108,
										name = "icon_31",
										y = 180,
										type = "pic",
										pic = "frame:mucai.jpg"
									},
									{
										fontSize = 20,
										font = "Thonburi",
										name = "tip_31",
										type = "label",
										y = 155,
										x = 107,
										text = "",
										color = ccc3(255, 255, 0)
									},
									{
										font = "Thonburi",
										fontSize = 20,
										type = "label",
										y = 120,
										x = 110,
										text = language.get(72001),
										color = ccc3(227, 251, 195)
									},
									{
										x = 90,
										name = "gold_31",
										y = 80,
										type = "pic",
										pic = "frame:icon_silver.png"
									},
									{
										fontSize = 20,
										font = "Thonburi",
										name = "cost_31",
										type = "label",
										y = 80,
										x = 130,
										text = "800000",
										color = ccc3(227, 251, 195)
									},
									{
										x = 110,
										y = 29,
										pic = "frame:btn_goumai_a.png",
										type = "pic"
									}
								}
							}
						}
					},
					pic2 = {
						pics = {
							{
								pic = "res/ui/resource/js_list_bg.jpg",
								children = {
									{
										fontSize = 20,
										font = "Thonburi",
										name = "title_32",
										type = "label",
										y = 270,
										x = 110,
										text = language.get(10102) .. "x500",
										color = ccc3(227, 251, 195)
									},
									{
										x = 108,
										name = "icon_32",
										y = 180,
										type = "pic",
										pic = "frame:mucai.jpg"
									},
									{
										fontSize = 20,
										font = "Thonburi",
										name = "tip_32",
										type = "label",
										y = 155,
										x = 107,
										text = "",
										color = ccc3(255, 255, 0)
									},
									{
										font = "Thonburi",
										fontSize = 20,
										type = "label",
										y = 120,
										x = 110,
										text = language.get(72001),
										color = ccc3(227, 251, 195)
									},
									{
										x = 90,
										name = "gold_32",
										y = 80,
										type = "pic",
										pic = "frame:icon_silver.png"
									},
									{
										fontSize = 20,
										font = "Thonburi",
										name = "cost_32",
										type = "label",
										y = 80,
										x = 130,
										text = "800000",
										color = ccc3(227, 251, 195)
									},
									{
										x = 110,
										y = 29,
										pic = "frame:btn_goumai_click.png",
										type = "pic"
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
			ycenter = -170,
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
					text = language.get(72002),
					x = 190 + var_0_1.zhanLingX,
					y = 85 + var_0_1.zhanLingY,
					color = ccc3(227, 251, 195)
				},
				{
					fontSize = 20,
					font = "Thonburi",
					name = "cityName",
					type = "label",
					text = language.get(72003),
					x = 230 + var_0_1.cityNameX,
					y = 85 + var_0_1.cityNameY,
					color = ccc3(94, 207, 64)
				},
				{
					fontSize = 20,
					font = "Thonburi",
					name = "goumailiangfanbei",
					type = "label",
					text = language.get(72004),
					x = 310 + var_0_1.doublePurchaseX,
					y = 85 + var_0_1.doublePurchaseY,
					color = ccc3(227, 251, 195)
				},
				{
					name = "go_btn",
					type = "button",
					buttons = {
						{
							pic2 = "frame:anniu-qianwang1.png",
							name = "gogo",
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
					text = language.get(72005),
					color = colorText[10004],
					strokeColor = colorText[10005]
				}
			}
		},
		{
			xcenter = 192,
			name = "textParent",
			type = "pic",
			ycenter = -170,
			pic = "res/ui/resource/di-qinmidu.png"
		},
		{
			fontSize = 22,
			ycenter = 265,
			type = "label",
			left = 20,
			text = language.get(72006),
			color = ccc3(204, 185, 134),
			children = {
				{
					text = "0/24",
					name = "currentBuyCount",
					fontSize = 22,
					type = "label",
					y = 0,
					x = 85,
					color = ccc3(94, 207, 64)
				},
				{
					fontSize = 22,
					y = 0,
					type = "label",
					text = language.get(72008),
					color = ccc3(204, 185, 134),
					x = 130 + var_0_1.leftTopX1
				},
				{
					text = "60",
					name = "currentBuyCycle",
					fontSize = 22,
					type = "label",
					y = 0,
					color = ccc3(94, 207, 64),
					x = 160 + var_0_1.leftTopX2
				},
				{
					fontSize = 22,
					y = 0,
					type = "label",
					text = language.get(72007),
					color = ccc3(204, 185, 134),
					x = 230 + var_0_1.leftTopX3
				}
			}
		},
		{
			fontSize = 24,
			ycenter = 265,
			type = "label",
			right = 80,
			text = language.get(72009),
			color = ccc3(204, 185, 134),
			children = {
				{
					text = "",
					name = "currentReflashCount",
					fontSize = 24,
					type = "label",
					y = 0,
					color = ccc3(255, 204, 0),
					x = 88 + var_0_1.rightTopTimeX
				}
			}
		}
	}
}

function getMarketData()
	return var_0_0
end
