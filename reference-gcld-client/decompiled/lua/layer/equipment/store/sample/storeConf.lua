return {
	storeLayer = {
		name = "storeLayer",
		type = "layer",
		childs = {
			{
				x = 480,
				name = "equipStoreMenu",
				y = 264,
				type = "sprite",
				pic = {
					frame = true,
					path = "equipmentStore-di.png"
				}
			},
			{
				fontSize = 22,
				name = "storeTipUpperRight",
				type = "label",
				text = "特定等级才开放",
				font = "Thonburi",
				y = 515,
				x = 646,
				color = ccc3(204, 185, 134),
				anchorPoint = {
					x = 0,
					y = 0.5
				},
				halign = kCCTextAlignmentLeft
			},
			{
				name = "tipButton",
				type = "button",
				y = 515,
				x = 915,
				pic1 = {
					frame = true,
					path = "btnTip_c.png"
				},
				pic2 = {
					frame = true,
					path = "btnTip_a.png"
				}
			},
			{
				name = "equipButton",
				type = "button",
				y = 522,
				x = 90,
				pic1 = {
					frame = true,
					path = "equipmentStore-yeqian-o2.png"
				},
				pic2 = {
					frame = true,
					path = "equipmentStore-yeqian-o1.png"
				}
			},
			{
				fontSize = 25,
				font = "Thonburi",
				text = "装备",
				type = "label",
				y = 522,
				x = 90
			},
			{
				y = 95,
				x = 220,
				type = "sprite",
				pic = {
					frame = true,
					path = "equipmentStore-di-chengchi.png"
				},
				childs = {
					{
						x = 94,
						y = 57,
						type = "sprite",
						tag = storeConstant.TAG_STORE_CITY_NORMAL,
						pic = {
							frame = true,
							path = "equipmentStore-chengchi.png"
						}
					},
					{
						x = 94,
						name = "cityHighlight",
						y = 57,
						type = "sprite",
						visible = false,
						tag = storeConstant.TAG_STORE_CITY_HIGHLIGHT,
						pic = {
							frame = true,
							path = "equipmentStore-chengchi1.png"
						}
					},
					{
						fontSize = 20,
						name = "noSpecialCityLabel",
						x = 270,
						type = "label",
						text = "占领              CD减半",
						font = "Thonburi",
						y = 85,
						width = 190,
						align = kCCTextAlignmentLeft,
						color = ccc3(236, 208, 168),
						childs = {
							{
								text = "特殊城市",
								name = "specialCitieyNameLabel",
								y = 0,
								type = "label",
								font = "Thonburi",
								x = -15,
								fontSize = 20,
								color = ccc3(133, 190, 109)
							}
						}
					},
					{
						fontSize = 20,
						name = "hasSpecialCityLabel",
						y = 85,
						type = "label",
						text = "已占领",
						x = 200,
						font = "Thonburi",
						color = ccc3(236, 208, 168)
					},
					{
						name = "gotoSpecialCity",
						type = "button",
						y = 36,
						x = 214,
						pic1 = {
							frame = true,
							path = "btn1_yel_a.png"
						},
						pic2 = {
							frame = true,
							path = "btn1_yel_c.png"
						}
					},
					{
						fontSize = 20,
						font = "Thonburi",
						text = "前往",
						type = "label",
						y = 36,
						x = 214
					}
				}
			},
			{
				x = 670,
				name = "intimacyBackground",
				y = 94,
				type = "sprite",
				pic = {
					frame = true,
					path = "equipmentStore-di-qinmidu.png"
				},
				childs = {
					{
						name = "equipmentRefreshItem",
						type = "button",
						y = 34,
						x = 425,
						pic1 = {
							frame = true,
							path = "btn3_yel_a.png"
						},
						pic2 = {
							frame = true,
							path = "btn3_yel_c.png"
						}
					},
					{
						fontSize = 20,
						name = "refreshButton",
						font = "Thonburi",
						type = "label",
						y = 34,
						text = "刷新",
						x = 425
					},
					{
						fontSize = 20,
						font = "Thonburi",
						y = 85,
						type = "label",
						text = "亲密度:",
						x = 50,
						color = ccc3(236, 208, 168)
					},
					{
						fontSize = 20,
						name = "intimacyValueLabel",
						y = 85,
						type = "label",
						font = "Thonburi",
						x = 120,
						text = "Lv20",
						color = ccc3(217, 152, 70)
					},
					{
						x = 180,
						y = 32,
						type = "sprite",
						pic = {
							frame = true,
							path = "equipmentStore-jingdutiao1.png"
						}
					},
					{
						x = 180,
						name = "intimacyProgressBar",
						y = 32,
						type = "process",
						pic = {
							frame = true,
							path = "equipmentStore-jingdutiao.png"
						}
					},
					{
						fontSize = 20,
						font = "Thonburi",
						y = 32,
						type = "label",
						name = "intimacyProgressLabel",
						text = "0/0",
						x = 175
					}
				}
			}
		}
	},
	equipmentList = {
		startY = 180,
		type = "list",
		startX = 69,
		listType = "hlist",
		parent = "storeLayer",
		y = 150,
		x = 36,
		xcelling = 150,
		itemRender = {
			name = "equipItem",
			type = "sprite",
			pic = {
				frame = true,
				path = "equipmentStore-di-zhuangbei.png"
			},
			childs = {
				{
					y = 213,
					name = "equipHightlight",
					type = "sprite",
					visible = false,
					z = 100,
					x = 75,
					pic = {
						frame = true,
						path = "equipmentStore-faguangkuang.png"
					}
				},
				{
					text = "",
					font = "Thonburi",
					name = "nameLabel",
					type = "label",
					fontSize = 20,
					y = 290,
					x = 75,
					renderHandler = "equipColorHandler"
				},
				{
					x = 40,
					name = "buySilver",
					y = 85,
					type = "sprite",
					visible = false,
					pic = {
						frame = true,
						path = "res_icon_1_ss.png"
					}
				},
				{
					text = "",
					font = "Thonburi",
					name = "numLabel",
					type = "label",
					fontSize = 18,
					y = 130,
					x = 85
				},
				{
					text = "",
					font = "Thonburi",
					name = "priceLabel",
					type = "label",
					fontSize = 18,
					y = 85,
					x = 85,
					visible = false
				},
				{
					renderHandler = "equipQualifyHandler",
					name = "equimentFrame",
					type = "sprite",
					y = 213,
					x = 75,
					pic = {
						frame = true,
						path = storeConstant.qualityFrame[2]
					}
				},
				{
					renderHandler = "equipPicHandler",
					name = "equipmentNormal",
					y = 213,
					type = "button",
					x = 75
				},
				{
					renderHandler = "equipBuyHandler",
					name = "equipBuyAlready",
					type = "sprite",
					y = 55,
					x = 75,
					pic = {
						frame = true,
						path = "equipmentStore-yigoumai.png"
					}
				},
				{
					name = "buyButton",
					type = "button",
					visible = false,
					y = 37,
					x = 75,
					pic1 = {
						frame = true,
						path = "btn2_gre_a.png"
					},
					pic2 = {
						frame = true,
						path = "btn2_gre_c.png"
					}
				},
				{
					text = "购买",
					font = "Thonburi",
					name = "buyLabel",
					type = "label",
					fontSize = 20,
					y = 37,
					x = 75,
					visible = false
				}
			}
		}
	},
	equipmentTipFrame = {
		name = "equipmentTipFrame",
		type = "layerColor",
		rect = ccc4(255, 255, 255, 0),
		itemRender = {
			name = "maskSprite",
			type = "sprite9",
			renderHandler = "maskRenderHandler",
			y = 365,
			x = 180,
			middleRect = CCRectMake(0, 128, 288, 125),
			preferedSize = CCSizeMake(288, 219),
			pic = {
				frame = true,
				path = "equipmentStore-tips-zhuangbei.png"
			},
			anchorPoint = {
				x = 0,
				y = 0
			},
			childs = {
				{
					fontSize = 20,
					name = "TipEquipmentName",
					x = 2,
					type = "label",
					y = 187,
					renderHandler = "maskRenderHandler",
					text = "装备名称",
					font = "Thonburi",
					width = 268,
					color = storeConstant.equipmentQualityColor[1],
					halign = kCCTextAlignmentLeft,
					anchorPoint = {
						x = 0,
						y = 0
					}
				},
				{
					fontSize = 20,
					name = "TipEquipmentEffect",
					x = 2,
					type = "label",
					y = 150,
					renderHandler = "maskRenderHandler",
					text = "装备加成",
					font = "Thonburi",
					width = 272,
					color = storeConstant.equipmentQualityColor[1],
					anchorPoint = {
						x = 0,
						y = 0
					},
					halign = kCCTextAlignmentLeft
				},
				{
					fontSize = 20,
					name = "TipEquipmentMaxLv",
					x = 2,
					type = "label",
					y = 70,
					renderHandler = "maskRenderHandler",
					text = "洗练上限",
					font = "Thonburi",
					width = 272,
					color = storeConstant.equipmentQualityColor[1],
					anchorPoint = {
						x = 0,
						y = 0
					},
					halign = kCCTextAlignmentLeft
				},
				{
					fontSize = 20,
					name = "TipEquipmentPrice",
					x = 2,
					type = "label",
					y = 20,
					renderHandler = "maskRenderHandler",
					text = "出售价格",
					font = "Thonburi",
					width = 272,
					anchorPoint = {
						x = 0,
						y = 0
					},
					color = storeConstant.equipmentQualityColor[1],
					halign = kCCTextAlignmentLeft
				}
			}
		}
	},
	starList = {
		name = "starList",
		startY = 8,
		type = "list",
		startX = 6,
		listType = "hlist",
		parent = "maskSprite",
		y = 187,
		x = 115,
		xcelling = 30,
		itemRender = {
			renderHandler = "starRenderHandler",
			name = "starSprite",
			type = "sprite"
		}
	},
	attributeList = {
		startY = 0,
		name = "attributeList",
		ycelling = 25,
		type = "list",
		startX = 0,
		listType = "vlist",
		parent = "maskSprite",
		y = 135,
		x = 5,
		itemRender = {
			name = "attribteLayer",
			type = "layer",
			childs = {
				{
					x = 10,
					y = 0,
					type = "sprite",
					pic = {
						frame = true,
						path = "star_light.png"
					}
				},
				{
					text = "",
					name = "nameLabel",
					y = 0,
					type = "label",
					font = "Thonburi",
					fontSize = 20,
					x = 75,
					renderHandler = "attributeRenderHandler"
				},
				{
					fontSize = 20,
					name = "introLabel",
					renderHandler = "attributeRenderHandler",
					type = "label",
					text = "",
					font = "Thonburi",
					y = 0,
					x = 200,
					align = kCCTextAlignmentLeft,
					color = ccc3(189, 167, 144)
				}
			}
		}
	}
}
