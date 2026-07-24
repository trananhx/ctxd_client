function getshenjiangUIData()
	return {
		y = 0,
		name = "Scene",
		type = "node",
		x = 0,
		children = {
			{
				y = 290,
				name = "Sprite_1",
				type = "sprite",
				x = 480,
				pic = {
					path = "res/ui/equip/shenjiang/jtz_bg.jpg"
				},
				children = {
					{
						y = 501.4962,
						name = "Sprite_2",
						type = "sprite",
						x = 454.4996,
						pic = {
							path = "res/ui/equip/shenjiang/jtz_title_oyztjp.png"
						}
					},
					{
						y = 286.166,
						name = "Sprite_3",
						type = "sprite",
						x = 152.8316,
						pic = {
							path = "res/ui/equip/shenjiang/jtz_ouyezi.png"
						},
						children = {
							{
								y = 207.8332,
								name = "Sprite_4",
								type = "sprite",
								x = 26.166,
								pic = {
									path = "res/ui/equip/shenjiang/jtz_name_ouyezi.png"
								}
							}
						}
					},
					{
						y = 357.8311,
						name = "Sprite_5",
						visible = false,
						type = "sprite",
						x = 517.8317,
						zorder = 300,
						pic = {
							path = "res/ui/equip/shenjiang/jtz_bubble.png"
						},
						children = {
							{
								fontSize = 20,
								height = 60,
								name = "Text_1_Copy",
								type = "label",
								width = 480,
								y = 68.7493,
								x = 325.0005,
								text = language.get("224306_jiaotaozhuang"),
								halign = kCCTextAlignmentLeft,
								valign = kCCVerticalTextAlignmentCenter
							}
						}
					},
					{
						y = 76.1651,
						name = "Sprite_6",
						visible = false,
						type = "sprite",
						x = 454.4977,
						pic = {
							path = "res/ui/equip/shenjiang/jtz_bg_long.png"
						},
						children = {
							{
								y = 102.8336,
								name = "Sprite_8",
								type = "sprite",
								x = 527.8323,
								pic = {
									path = "res/ui/equip/shenjiang/jtz_bar_bg.png"
								},
								children = {
									{
										y = 14.1678,
										name = "LoadingBar_1",
										type = "progressbar",
										x = 293.1679,
										pic = {
											path = "res/ui/equip/shenjiang/jtz_bar.png"
										}
									}
								}
							},
							{
								y = 106,
								name = "Sprite_bg",
								type = "sprite",
								x = 222,
								pic = {
									path = "res/ui/nation/buildNation/mainTask/jgdy_gcqz_res_bg.png"
								},
								children = {
									{
										y = 23,
										name = "Sprite_7",
										type = "sprite",
										x = 23,
										pic = {
											path = "res/ui/technology/buildTech/jzke_icon_fz.png"
										}
									}
								}
							},
							{
								name = "Button_1",
								h = 62,
								type = "button",
								w = 195,
								y = 54.5,
								x = 326.1664,
								normal = {
									path = "res/ui/common/button/public_btn_green.png"
								},
								touched = {
									path = "res/ui/common/button/public_btn_green_c.png"
								},
								disable = {
									path = "res/ui/common/button/public_btn_green_g.png"
								}
							},
							{
								name = "Button_2",
								h = 62,
								type = "button",
								w = 195,
								y = 54.5,
								x = 535.8324,
								normal = {
									path = "res/ui/common/button/public_btn_orange.png"
								},
								touched = {
									path = "res/ui/common/button/public_btn_orange_c.png"
								},
								disable = {
									path = "res/ui/common/button/public_btn_orange_g.png"
								}
							},
							{
								name = "Button_3",
								h = 62,
								type = "button",
								w = 195,
								y = 54.5,
								x = 738.1657,
								normal = {
									path = "res/ui/common/button/public_btn_red.png"
								},
								touched = {
									path = "res/ui/common/button/public_btn_red_c.png"
								},
								disable = {
									path = "res/ui/common/button/public_btn_red_g.png"
								}
							},
							{
								fontSize = 20,
								name = "down_1",
								type = "label",
								y = 24.5,
								x = 326,
								text = language.get("224312_jiaotaozhuang", 0)
							},
							{
								fontSize = 20,
								name = "down_2",
								type = "label",
								y = 24.5,
								x = 536,
								text = language.get("224312_jiaotaozhuang", 0)
							},
							{
								fontSize = 20,
								name = "down_3",
								type = "label",
								y = 24.5,
								x = 738,
								text = language.get("224312_jiaotaozhuang", 0)
							},
							{
								y = 57,
								name = "source_1",
								type = "sprite",
								x = 273,
								pic = {
									path = "res/ui/common/button/public_btn_gold.png"
								},
								children = {
									{
										y = 30,
										name = "icon_1",
										type = "sprite",
										x = 42,
										pic = {
											path = "res/ui/resource/silkroad/sczldj_pbjn.png"
										}
									},
									{
										fontSize = 20,
										name = "num_1",
										text = "50",
										type = "label",
										y = 10,
										x = 42
									}
								}
							},
							{
								y = 57,
								name = "source_2",
								type = "sprite",
								x = 483,
								pic = {
									path = "res/ui/common/button/public_btn_gold.png"
								},
								children = {
									{
										y = 30,
										name = "icon_2",
										scale = 0.65,
										type = "sprite",
										x = 42,
										pic = {
											path = "res/ui/equip/shenjiang/jtz_icon_baoshi.png"
										}
									},
									{
										fontSize = 20,
										name = "num_2",
										text = "100",
										type = "label",
										y = 10,
										x = 42
									}
								}
							},
							{
								y = 57,
								name = "source_3",
								type = "sprite",
								x = 690,
								pic = {
									path = "res/ui/common/button/public_btn_gold.png"
								},
								children = {
									{
										y = 30,
										name = "icon_3",
										scale = 0.6,
										type = "sprite",
										x = 42,
										pic = {
											path = "res/ui/equip/shenjiang/jtz_icon_jueshi_big.png"
										}
									},
									{
										fontSize = 20,
										name = "num_3",
										text = "100",
										type = "label",
										y = 10,
										x = 42
									}
								}
							},
							{
								fontSize = 24,
								name = "name_1",
								type = "label",
								y = 56,
								x = 341,
								text = language.get("224309_jiaotaozhuang")
							},
							{
								fontSize = 24,
								name = "name_2",
								type = "label",
								y = 56,
								x = 551,
								text = language.get("224310_jiaotaozhuang")
							},
							{
								fontSize = 24,
								name = "name_3",
								type = "label",
								y = 56,
								x = 753,
								text = language.get("224311_jiaotaozhuang")
							},
							{
								fontSize = 20,
								name = "word_process",
								text = "0/3000",
								type = "label",
								y = 105,
								x = 527
							},
							{
								fontSize = 20,
								name = "Text_1",
								type = "label",
								y = 68.7498,
								x = 112.7502,
								text = language.get("224304_jiaotaozhuang"),
								halign = kCCTextAlignmentLeft,
								valign = kCCVerticalTextAlignmentCenter
							},
							{
								name = "Button_10",
								h = 39,
								type = "button",
								w = 39,
								y = 154,
								x = 716,
								normal = {
									frame = true,
									path = "btn_check_1_a.png"
								},
								touched = {
									frame = true,
									path = "btn_check_1_a.png"
								},
								disable = {
									frame = true,
									path = "btn_check_1_a.png"
								}
							},
							{
								fontSize = 22,
								name = "word_10",
								type = "label",
								y = 154,
								x = 805,
								text = language.get("224321_jiaotaozhuang")
							},
							{
								y = 154,
								name = "gou_10",
								visible = false,
								type = "sprite",
								x = 716,
								pic = {
									frame = true,
									path = "btn_check_1_on.png"
								}
							}
						}
					},
					{
						y = 76.1651,
						name = "Sprite_6_2",
						visible = false,
						type = "sprite",
						x = 454.4977,
						pic = {
							path = "res/ui/equip/shenjiang/jtz_bg_long.png"
						},
						children = {
							{
								y = 66,
								name = "bg_1",
								type = "sprite",
								x = 300,
								pic = {
									path = "res/ui/equip/shenjiang/jtz_icon_bg.png"
								},
								children = {
									{
										y = 44,
										name = "equip_1",
										type = "sprite",
										x = 44,
										pic = {
											frame = true,
											path = "jbxtz.jpg"
										}
									}
								}
							},
							{
								y = 66,
								name = "bg_2",
								type = "sprite",
								x = 410,
								pic = {
									path = "res/ui/equip/shenjiang/jtz_icon_bg.png"
								},
								children = {
									{
										y = 44,
										name = "equip_2",
										type = "sprite",
										x = 44,
										pic = {
											frame = true,
											path = "jbxtz.jpg"
										}
									}
								}
							},
							{
								y = 66,
								name = "bg_3",
								type = "sprite",
								x = 520,
								pic = {
									path = "res/ui/equip/shenjiang/jtz_icon_bg.png"
								},
								children = {
									{
										y = 44,
										name = "equip_3",
										type = "sprite",
										x = 44,
										pic = {
											frame = true,
											path = "jbxtz.jpg"
										}
									}
								}
							},
							{
								y = 66,
								name = "bg_4",
								type = "sprite",
								x = 630,
								pic = {
									path = "res/ui/equip/shenjiang/jtz_icon_bg.png"
								},
								children = {
									{
										y = 44,
										name = "equip_4",
										type = "sprite",
										x = 44,
										pic = {
											frame = true,
											path = "jbxtz.jpg"
										}
									}
								}
							},
							{
								y = 66,
								name = "bg_5",
								type = "sprite",
								x = 740,
								pic = {
									path = "res/ui/equip/shenjiang/jtz_icon_bg.png"
								},
								children = {
									{
										y = 44,
										name = "equip_5",
										type = "sprite",
										x = 44,
										pic = {
											frame = true,
											path = "jbxtz.jpg"
										}
									}
								}
							},
							{
								y = 66,
								name = "bg_light",
								visible = false,
								type = "sprite",
								x = 300,
								zorder = 1000,
								pic = {
									path = "res/ui/equip/shenjiang/jtz_icon_bg_l.png"
								}
							},
							{
								fontSize = 20,
								height = 80,
								name = "word2",
								type = "label",
								width = 200,
								y = 68.7498,
								x = 112.7502,
								text = language.get("224313_jiaotaozhuang"),
								halign = kCCTextAlignmentLeft,
								valign = kCCVerticalTextAlignmentCenter
							}
						}
					},
					{
						y = 306,
						name = "sichou",
						type = "sprite",
						x = 384,
						pic = {
							path = "res/ui/equip/shenjiang/jtz_icon_sichou_big.png"
						},
						children = {
							{
								y = 28,
								name = "sichou_light",
								visible = false,
								type = "sprite",
								x = 85,
								pic = {
									path = "res/ui/equip/shenjiang/jtz_icon_sichou_big_l.png"
								}
							}
						}
					},
					{
						y = 331,
						name = "baoshi",
						type = "sprite",
						x = 615,
						pic = {
							path = "res/ui/equip/shenjiang/jtz_icon_baoshi_big.png"
						},
						children = {
							{
								y = 34,
								name = "baoshi_light",
								visible = false,
								type = "sprite",
								x = 42,
								pic = {
									path = "res/ui/equip/shenjiang/jtz_icon_baoshi_big_l.png"
								}
							}
						}
					},
					{
						y = 313,
						name = "jiaoshi",
						type = "sprite",
						x = 789,
						pic = {
							path = "res/ui/equip/shenjiang/jtz_icon_jueshi_big.png"
						},
						children = {
							{
								y = 25,
								name = "jiaoshi_light",
								visible = false,
								type = "sprite",
								x = 30,
								pic = {
									path = "res/ui/equip/shenjiang/jtz_icon_jueshi_big_l.png"
								}
							}
						}
					},
					{
						y = 223,
						name = "completeNode",
						visible = false,
						type = "sprite",
						x = 613,
						pic = {
							path = "res/ui/equip/shenjiang/jtz_icon_bg.png"
						},
						children = {
							{
								y = 64,
								name = "fireNode",
								type = "sprite",
								x = 30,
								pic = {
									path = "res/default.png"
								}
							},
							{
								y = 44,
								x = 44,
								type = "sprite",
								pic = {
									path = "res/ui/equip/shenjiang/jtz_icon_bg.png"
								}
							},
							{
								y = 44,
								name = "equip_complete_1",
								type = "sprite",
								x = 44,
								pic = {
									frame = true,
									path = "jbx.jpg"
								}
							},
							{
								y = 44,
								name = "equip_complete_2",
								type = "sprite",
								x = 44,
								pic = {
									frame = true,
									path = "jbx.jpg"
								}
							},
							{
								fontSize = 26,
								name = "word_complete_1",
								type = "label",
								y = 150,
								x = 44,
								text = language.get(30103, 0, 0, 0)
							},
							{
								fontSize = 26,
								name = "word_complete_2",
								text = "xxx lv.xx xxx lv.xx",
								type = "label",
								y = 120,
								x = 44
							},
							{
								y = 210,
								name = "word_complete",
								type = "sprite",
								x = 44,
								pic = {
									path = "res/ui/equip/shenjiang/jtz_word_jtzqhwc.png"
								}
							},
							{
								y = 44,
								name = "animationNode",
								type = "sprite",
								x = 44,
								pic = {
									path = "res/default.png"
								}
							}
						}
					}
				}
			}
		}
	}
end
