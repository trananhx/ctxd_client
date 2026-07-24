local var_0_0 = {
	bg = {
		xcenter = 0,
		name = "bg",
		type = "pic",
		ycenter = -30,
		pic = "res/ui/weapon/silkTreasure/zb_view.jpg",
		children = {
			{
				y = 268,
				x = 767,
				type = "pic",
				pic = "res/ui/weapon/silkTreasure/zb_attribute_view.png",
				children = {
					{
						x = 51,
						y = 414,
						pic = "res/ui/weapon/silkTreasure/zb_attribute_gj.png",
						type = "pic"
					},
					{
						fontSize = 22,
						z = 10,
						name = "att_num",
						type = "label",
						font = "Thonburi-Bold",
						y = 414,
						x = 165,
						text = language.get(490718, "0   "),
						color = ccc3(188, 167, 145),
						align = kCCTextAlignmentLeft,
						anchorPoint = ccp(0, 0.5)
					},
					{
						x = 51,
						y = 321,
						pic = "res/ui/weapon/silkTreasure/zb_attribute_fy.png",
						type = "pic"
					},
					{
						fontSize = 22,
						z = 10,
						name = "def_num",
						type = "label",
						font = "Thonburi-Bold",
						y = 321,
						x = 165,
						text = language.get(490719, "0   "),
						color = ccc3(188, 167, 145),
						align = kCCTextAlignmentLeft,
						anchorPoint = ccp(0, 0.5)
					},
					{
						x = 51,
						y = 226,
						pic = "res/ui/weapon/silkTreasure/zb_attribute_xl.png",
						type = "pic"
					},
					{
						fontSize = 22,
						z = 10,
						name = "hp_num",
						type = "label",
						font = "Thonburi-Bold",
						y = 226,
						x = 165,
						text = language.get(490720, "0   "),
						color = ccc3(188, 167, 145),
						align = kCCTextAlignmentLeft,
						anchorPoint = ccp(0, 0.5)
					},
					{
						x = 143,
						name = "treasure_teji",
						y = 78,
						type = "pic",
						pic = "res/ui/weapon/silkTreasure/zb_tj_name_01.png"
					},
					{
						fontSize = 22,
						z = 10,
						type = "label",
						font = "Thonburi-Bold",
						y = 133,
						x = 48,
						text = language.get(122090),
						color = ccc3(188, 167, 145),
						align = kCCTextAlignmentLeft,
						anchorPoint = ccp(0, 0.5)
					},
					{
						fontSize = 22,
						z = 10,
						type = "label",
						font = "Thonburi-Bold",
						y = 500,
						x = 148,
						text = language.get(122091),
						color = ccc3(188, 167, 145),
						align = kCCTextAlignmentLeft,
						anchorPoint = ccp(0, 0.5)
					}
				}
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/weapon/silkTreasure/zb_btn_sign_c.png",
						pic3 = "res/ui/weapon/silkTreasure/zb_btn_sign_g.png",
						pic1 = "res/ui/weapon/silkTreasure/zb_btn_sign.png",
						rotate = 180,
						name = "upButton",
						y = 496,
						x = 62
					}
				}
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/weapon/silkTreasure/zb_btn_sign_c.png",
						pic3 = "res/ui/weapon/silkTreasure/zb_btn_sign_g.png",
						pic1 = "res/ui/weapon/silkTreasure/zb_btn_sign.png",
						y = 40,
						name = "downButton",
						x = 62
					}
				}
			},
			{
				x = 62,
				name = "icon_1",
				y = 418,
				type = "pic",
				pic = "res/ui/weapon/silkTreasure/zb_icon.png",
				children = {
					{
						xcenter = 0,
						name = "treasure_icon_1",
						type = "pic",
						ycenter = 0,
						pic = "res/ui/weapon/silkTreasure/zb_lock.jpg"
					}
				}
			},
			{
				x = 62,
				name = "icon_2",
				y = 317,
				type = "pic",
				pic = "res/ui/weapon/silkTreasure/zb_icon.png",
				children = {
					{
						xcenter = 0,
						name = "treasure_icon_2",
						type = "pic",
						ycenter = 0,
						pic = "res/ui/weapon/silkTreasure/zb_lock.jpg"
					}
				}
			},
			{
				x = 62,
				name = "icon_3",
				y = 216,
				type = "pic",
				pic = "res/ui/weapon/silkTreasure/zb_icon.png",
				children = {
					{
						xcenter = 0,
						name = "treasure_icon_3",
						type = "pic",
						ycenter = 0,
						pic = "res/ui/weapon/silkTreasure/zb_lock.jpg"
					}
				}
			},
			{
				x = 62,
				name = "icon_4",
				y = 115,
				type = "pic",
				pic = "res/ui/weapon/silkTreasure/zb_icon.png",
				children = {
					{
						xcenter = 0,
						name = "treasure_icon_4",
						type = "pic",
						ycenter = 0,
						pic = "res/ui/weapon/silkTreasure/zb_lock.jpg"
					}
				}
			},
			{
				x = 62,
				name = "icon_lignt",
				y = 418,
				type = "pic",
				z = 100,
				pic = "res/ui/weapon/silkTreasure/zb_icon_light.png"
			},
			{
				x = 367,
				name = "treasure_name",
				y = 484,
				type = "pic",
				z = 200,
				pic = "res/ui/weapon/silkTreasure/zb_zb_name_01.png"
			},
			{
				x = 378,
				name = "treasure_center",
				y = 280,
				type = "pic",
				z = 200,
				pic = "res/ui/weapon/silkTreasure/treasure/zb_1_l.png"
			},
			{
				x = 378,
				name = "treasure_center_light",
				y = 280,
				type = "pic",
				z = 199,
				pic = "res/default.png"
			},
			{
				x = 181,
				name = "piece_1",
				y = 275,
				type = "pic",
				z = 200,
				pic = "res/ui/weapon/silkTreasure/treasure_piece/zb_s1.png",
				children = {
					{
						fontSize = 20,
						font = "Thonburi-bold",
						name = "piece_num_1",
						type = "label",
						ycenter = -48,
						xcenter = 0,
						text = "0/100"
					}
				}
			},
			{
				x = 219,
				name = "piece_2",
				y = 145,
				type = "pic",
				z = 200,
				pic = "res/ui/weapon/silkTreasure/treasure_piece/zb_s2.png",
				children = {
					{
						fontSize = 20,
						font = "Thonburi-bold",
						name = "piece_num_2",
						type = "label",
						ycenter = -48,
						xcenter = 0,
						text = "0/100"
					}
				}
			},
			{
				x = 369,
				name = "piece_3",
				y = 78,
				type = "pic",
				z = 200,
				pic = "res/ui/weapon/silkTreasure/treasure_piece/zb_s3.png",
				children = {
					{
						fontSize = 20,
						font = "Thonburi-bold",
						name = "piece_num_3",
						type = "label",
						ycenter = -48,
						xcenter = 0,
						text = "0/100"
					}
				}
			},
			{
				x = 517,
				name = "piece_4",
				y = 145,
				type = "pic",
				z = 200,
				pic = "res/ui/weapon/silkTreasure/treasure_piece/zb_s4.png",
				children = {
					{
						fontSize = 20,
						font = "Thonburi-bold",
						name = "piece_num_4",
						type = "label",
						ycenter = -48,
						xcenter = 0,
						text = "0/100"
					}
				}
			},
			{
				x = 555,
				name = "piece_5",
				y = 275,
				type = "pic",
				z = 200,
				pic = "res/ui/weapon/silkTreasure/treasure_piece/zb_s5.png",
				children = {
					{
						fontSize = 20,
						font = "Thonburi-bold",
						name = "piece_num_5",
						type = "label",
						ycenter = -48,
						xcenter = 0,
						text = "0/100"
					}
				}
			},
			{
				x = 0,
				name = "tenTreasureSp",
				y = -30,
				type = "pic",
				visible = false,
				pic = "res/default.png",
				children = {
					{
						x = 81,
						name = "tenpiece_1",
						y = 289,
						type = "pic",
						z = 200,
						pic = "res/ui/weapon/silkTreasure/treasure_piece/zb_s2.png",
						children = {
							{
								y = -48,
								name = "tenpiece_num_bg1",
								pic = "res/ui/weapon/casting/zz_word_di.png",
								type = "pic",
								x = 36
							},
							{
								fontSize = 22,
								font = "Thonburi-bold",
								name = "tenpiece_num_1",
								type = "label",
								ycenter = -82,
								xcenter = 0,
								text = "0/100"
							}
						}
					},
					{
						x = 545,
						name = "tenpiece_2",
						y = 289,
						type = "pic",
						z = 200,
						pic = "res/ui/weapon/silkTreasure/treasure_piece/zb_s2.png",
						children = {
							{
								y = -48,
								name = "tenpiece_num_bg2",
								pic = "res/ui/weapon/casting/zz_word_di.png",
								type = "pic",
								x = 36
							},
							{
								fontSize = 22,
								font = "Thonburi-bold",
								name = "tenpiece_num_2",
								type = "label",
								ycenter = -82,
								xcenter = 0,
								text = "0/100"
							}
						}
					},
					{
						y = 110,
						name = "treasureListBg",
						pic = "res/ui/weapon/silkTreasure/dszb_icon_bg.png",
						type = "pic",
						x = 315,
						children = {
							{
								xcenter = 0,
								name = "tenTreasureBigIcon",
								scale = 1,
								type = "pic",
								ycenter = 37,
								pic = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
							},
							{
								x = 50,
								name = "tenTreasureIconBg_1",
								y = 42,
								type = "pic",
								pic = "res/ui/weapon/silkTreasure/dszb_s_icon_bg.png",
								children = {
									{
										xcenter = 0,
										name = "tenTreasureIcon_1",
										scale = 0.75,
										type = "pic",
										ycenter = 0,
										pic = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
									},
									{
										xcenter = -2,
										name = "treasureLight_1",
										scale = 0.75,
										type = "pic",
										ycenter = 2,
										pic = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
									}
								}
							},
							{
								x = 115,
								name = "tenTreasureIconBg_2",
								y = 42,
								type = "pic",
								pic = "res/ui/weapon/silkTreasure/dszb_s_icon_bg.png",
								children = {
									{
										xcenter = 0,
										name = "tenTreasureIcon_2",
										scale = 0.75,
										type = "pic",
										ycenter = 0,
										pic = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
									},
									{
										xcenter = -2,
										name = "treasureLight_2",
										scale = 0.75,
										type = "pic",
										ycenter = 2,
										pic = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
									}
								}
							},
							{
								x = 180,
								name = "tenTreasureIconBg_3",
								y = 42,
								type = "pic",
								pic = "res/ui/weapon/silkTreasure/dszb_s_icon_bg.png",
								children = {
									{
										xcenter = 0,
										name = "tenTreasureIcon_3",
										scale = 0.75,
										type = "pic",
										ycenter = 0,
										pic = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
									},
									{
										xcenter = -2,
										name = "treasureLight_3",
										scale = 0.75,
										type = "pic",
										ycenter = 2,
										pic = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
									}
								}
							},
							{
								x = 245,
								name = "tenTreasureIconBg_4",
								y = 42,
								type = "pic",
								pic = "res/ui/weapon/silkTreasure/dszb_s_icon_bg.png",
								children = {
									{
										xcenter = 0,
										name = "tenTreasureIcon_4",
										scale = 0.75,
										type = "pic",
										ycenter = 0,
										pic = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
									},
									{
										xcenter = -2,
										name = "treasureLight_4",
										scale = 0.75,
										type = "pic",
										ycenter = 2,
										pic = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
									}
								}
							},
							{
								x = 310,
								name = "tenTreasureIconBg_5",
								y = 42,
								type = "pic",
								pic = "res/ui/weapon/silkTreasure/dszb_s_icon_bg.png",
								children = {
									{
										xcenter = 0,
										name = "tenTreasureIcon_5",
										scale = 0.75,
										type = "pic",
										ycenter = 0,
										pic = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
									},
									{
										xcenter = -2,
										name = "treasureLight_5",
										scale = 0.75,
										type = "pic",
										ycenter = 2,
										pic = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
									}
								}
							},
							{
								x = 375,
								name = "tenTreasureIconBg_6",
								y = 42,
								type = "pic",
								pic = "res/ui/weapon/silkTreasure/dszb_s_icon_bg.png",
								children = {
									{
										xcenter = 0,
										name = "tenTreasureIcon_6",
										scale = 0.75,
										type = "pic",
										ycenter = 0,
										pic = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
									},
									{
										xcenter = -2,
										name = "treasureLight_6",
										scale = 0.75,
										type = "pic",
										ycenter = 2,
										pic = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
									}
								}
							},
							{
								x = 440,
								name = "tenTreasureIconBg_7",
								y = 42,
								type = "pic",
								pic = "res/ui/weapon/silkTreasure/dszb_s_icon_bg.png",
								children = {
									{
										xcenter = 0,
										name = "tenTreasureIcon_7",
										scale = 0.75,
										type = "pic",
										ycenter = 0,
										pic = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
									},
									{
										xcenter = -2,
										name = "treasureLight_7",
										scale = 0.75,
										type = "pic",
										ycenter = 2,
										pic = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
									}
								}
							},
							{
								x = 505,
								name = "tenTreasureIconBg_8",
								y = 42,
								type = "pic",
								pic = "res/ui/weapon/silkTreasure/dszb_s_icon_bg.png",
								children = {
									{
										xcenter = 0,
										name = "tenTreasureIcon_8",
										scale = 0.75,
										type = "pic",
										ycenter = 0,
										pic = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
									},
									{
										xcenter = -2,
										name = "treasureLight_8",
										scale = 0.75,
										type = "pic",
										ycenter = 2,
										pic = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
									}
								}
							},
							{
								x = 570,
								name = "tenTreasureIconBg_9",
								y = 42,
								type = "pic",
								pic = "res/ui/weapon/silkTreasure/dszb_s_icon_bg.png",
								children = {
									{
										xcenter = 0,
										name = "tenTreasureIcon_9",
										scale = 0.75,
										type = "pic",
										ycenter = 0,
										pic = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
									},
									{
										xcenter = -2,
										name = "treasureLight_9",
										scale = 0.75,
										type = "pic",
										ycenter = 2,
										pic = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

function getSilkTreasureData()
	return var_0_0
end
