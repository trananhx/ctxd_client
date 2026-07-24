local var_0_0 = class("CastingPanel", function()
	return createBaseLayer()
end)
local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.fontSizeoffset = 18
	var_0_1.numSizeoffset = 13
elseif conf.language == "tha" then
	var_0_1.fontSizeoffset = 18
	var_0_1.numSizeoffset = 13
end

var_0_0.layout = {
	name = "root",
	type = "node",
	x = visibleSize.width / 2,
	y = visibleSize.height / 2 - 30,
	children = {
		{
			y = 0,
			name = "bg1",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/comment/bg1.jpg"
			}
		},
		{
			y = -40.0009,
			name = "zz_bg",
			type = "sprite",
			x = -0.004,
			pic = {
				path = "res/ui/weapon/casting/zz_bg.jpg"
			}
		},
		{
			y = 183,
			name = "zz_line",
			type = "sprite",
			x = -0.0004,
			pic = {
				path = "res/ui/weapon/casting/zz_line.png"
			}
		},
		{
			y = 0,
			name = "npcSp",
			type = "sprite",
			x = 0,
			anchorPoint = ccp(0, 0),
			pic = {
				path = "Default/Sprite.png"
			}
		},
		{
			y = -38.5,
			name = "castingBgSp",
			type = "sprite",
			x = -12,
			pic = {
				path = "res/ui/weapon/casting/luzi/zz_luzi_04.png"
			},
			children = {
				{
					y = 122,
					name = "upgradedMc",
					type = "sprite",
					x = 238,
					pic = {
						path = "res/ui/weapon/casting/luzi/zz_luzi_hy_1.png"
					}
				}
			}
		},
		{
			y = 100,
			name = "talkSp",
			type = "sprite",
			x = -161.0001,
			pic = {
				path = "res/ui/weapon/casting/zz_word_bg.png"
			},
			children = {
				{
					name = "talkLb",
					y = 30,
					type = "label",
					x = 30,
					textId = 213223,
					anchorPoint = ccp(0, 0.5),
					align = kCCTextAlignmentLeft,
					fontSize = var_0_1.fontSizeoffset or 18
				},
				{
					y = 67.5,
					name = "doType",
					type = "sprite",
					x = 22,
					anchorPoint = ccp(0, 0.5),
					pic = {
						path = "res/ui/weapon/casting/dotype/zz_word_1.png"
					}
				}
			}
		},
		{
			y = 223.3894,
			name = "title",
			type = "sprite",
			x = 0.0001,
			pic = {
				path = "res/ui/weapon/casting/title/zz_title_1.png"
			}
		},
		{
			y = 223,
			name = "btn_tip",
			style = "button_tip",
			type = "button",
			x = 410
		},
		{
			y = 206.9999,
			name = "zz_word_di",
			type = "sprite",
			x = -365,
			pic = {
				path = "res/ui/weapon/casting/zz_icon_mutan_bg.png"
			}
		},
		{
			y = 207.9952,
			name = "zz_icon_mutan",
			type = "sprite",
			x = -420.0001,
			pic = {
				path = "res/ui/weapon/casting/zz_icon_mutan.png"
			}
		},
		{
			fontSize = 22,
			name = "numLb",
			y = 207.9999,
			type = "label",
			x = -384,
			anchorPoint = ccp(0, 0.5)
		},
		{
			y = 27.6677,
			name = "btnSp",
			visible = false,
			type = "sprite",
			x = -288.4887,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "Default/Sprite.png"
			},
			children = {
				{
					y = 95,
					name = "zz_icon_di1",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/weapon/casting/zz_icon_di.png"
					}
				},
				{
					name = "buyProbBtn",
					h = 70,
					type = "button",
					w = 70,
					y = 94.5,
					x = -0.5,
					normal = {
						frame = true,
						path = "ds.jpg"
					},
					touched = {
						frame = true,
						path = "ds.jpg"
					},
					disable = {
						frame = true,
						path = "ds.jpg"
					}
				},
				{
					y = 34.9995,
					name = "icon_gold1",
					scale = 0.8,
					type = "sprite",
					x = -20,
					pic = {
						path = "res/ui/playerInfo/icon_gold.png"
					}
				},
				{
					fontSize = 22,
					name = "buyProbCoinLb",
					text = "100",
					type = "label",
					y = 36,
					x = 20
				}
			}
		},
		{
			y = 27.6677,
			name = "btnSp2",
			visible = false,
			type = "sprite",
			x = -288.4887,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "Default/Sprite.png"
			},
			children = {
				{
					y = 95,
					name = "zz_icon_di2",
					type = "sprite",
					x = 125,
					pic = {
						path = "res/ui/weapon/casting/zz_icon_di.png"
					}
				},
				{
					name = "buyCdBtn",
					h = 70,
					type = "button",
					w = 70,
					y = 94.5,
					x = 124.5,
					normal = {
						frame = true,
						path = "lqs.jpg"
					},
					touched = {
						frame = true,
						path = "lqs.jpg"
					},
					disable = {
						frame = true,
						path = "lqs.jpg"
					}
				},
				{
					y = 34.9991,
					name = "icon_gold2",
					scale = 0.8,
					type = "sprite",
					x = 103,
					pic = {
						path = "res/ui/playerInfo/icon_gold.png"
					}
				},
				{
					fontSize = 22,
					name = "buyCdCoinLb",
					text = "100",
					type = "label",
					y = 36,
					x = 140
				}
			}
		},
		{
			visible = false,
			name = "btnSp3",
			y = 27.6677,
			type = "sprite",
			x = -288.4887,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "Default/Sprite.png"
			},
			children = {
				{
					y = 95,
					name = "zz_icon_di3",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/weapon/casting/zz_icon_di.png"
					}
				},
				{
					name = "buyProbBtn3",
					h = 70,
					type = "button",
					w = 70,
					y = 94.5,
					x = -0.5,
					normal = {
						frame = true,
						path = "ds.jpg"
					},
					touched = {
						frame = true,
						path = "ds.jpg"
					},
					disable = {
						frame = true,
						path = "ds.jpg"
					}
				},
				{
					y = 34.9995,
					name = "icon_gold3",
					scale = 0.8,
					type = "sprite",
					x = -20,
					pic = {
						path = "res/ui/playerInfo/icon_gold.png"
					}
				},
				{
					fontSize = 22,
					name = "buyProbCoinLb3",
					text = "100",
					type = "label",
					y = 36,
					x = 20
				}
			}
		},
		{
			y = -76,
			name = "btnSp4",
			visible = false,
			type = "sprite",
			x = -360,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "Default/Sprite.png"
			},
			children = {
				{
					y = 95,
					name = "zz_icon_di2",
					type = "sprite",
					x = 125,
					pic = {
						path = "res/ui/weapon/casting/zz_icon_di.png"
					}
				},
				{
					name = "buyBLBtn",
					h = 70,
					type = "button",
					w = 70,
					y = 94.5,
					x = 124.5,
					normal = {
						frame = true,
						path = "baolu.jpg"
					},
					touched = {
						frame = true,
						path = "baolu.jpg"
					},
					disable = {
						frame = true,
						path = "baolu.jpg"
					}
				},
				{
					y = 34.9991,
					name = "icon_gold2",
					scale = 0.8,
					type = "sprite",
					x = 103,
					pic = {
						path = "res/ui/playerInfo/icon_gold.png"
					}
				},
				{
					fontSize = 22,
					name = "buyBLLb",
					text = "50",
					type = "label",
					y = 36,
					x = 140
				}
			}
		},
		{
			fontSize = 22,
			name = "ycbwEventInfo",
			visible = false,
			type = "label",
			y = 35,
			x = -220,
			textId = 213315
		},
		{
			y = -173.5834,
			name = "buyBtnSp",
			type = "sprite",
			x = -200,
			pic = {
				path = "res/ui/weapon/casting/zz_flag.png"
			},
			children = {
				{
					name = "buyBtn",
					h = 36,
					type = "button",
					w = 30,
					y = 45,
					x = 21,
					normal = {
						path = "res/ui/weapon/casting/zz_flag_npc.png"
					},
					touched = {
						path = "res/ui/weapon/casting/zz_flag_npc.png"
					},
					disable = {
						path = "res/ui/weapon/casting/zz_flag_npc.png"
					}
				},
				{
					visible = false,
					name = "buyC",
					y = 10,
					type = "sprite",
					x = 3,
					pic = {
						path = "Default/Sprite.png"
					},
					children = {
						{
							name = "buyOneBtn",
							h = 56,
							type = "button",
							w = 212,
							scale = 0.65,
							y = 43,
							x = -65,
							normal = {
								path = "res/ui/common/button/sdyjs_btn_02.png"
							},
							touched = {
								path = "res/ui/common/button/sdyjs_btn_02_c.png"
							},
							disable = {
								path = "res/ui/common/button/sdyjs_btn_02_g.png"
							}
						},
						{
							name = "buyMoreBtn",
							h = 56,
							type = "button",
							w = 212,
							scale = 0.65,
							y = 7,
							x = -65,
							normal = {
								path = "res/ui/common/button/sdyjs_btn_02.png"
							},
							touched = {
								path = "res/ui/common/button/sdyjs_btn_02_c.png"
							},
							disable = {
								path = "res/ui/common/button/sdyjs_btn_02_g.png"
							}
						},
						{
							y = 15,
							name = "icon_gold_Copy_0",
							scale = 0.5,
							type = "sprite",
							x = -108,
							pic = {
								path = "res/ui/playerInfo/icon_gold.png"
							}
						},
						{
							fontSize = 14,
							name = "buyOneLb",
							text = "100",
							type = "label",
							y = 41,
							x = -107
						},
						{
							fontSize = 20,
							name = "Text_7",
							type = "label",
							textId = 213351,
							style = "label_warlock",
							y = 47,
							x = -80,
							color = color_whi,
							anchorPoint = ccp(0, 0.5)
						},
						{
							y = 50,
							name = "icon_gold_Copy",
							scale = 0.5,
							type = "sprite",
							x = -108,
							pic = {
								path = "res/ui/playerInfo/icon_gold.png"
							}
						},
						{
							fontSize = 14,
							name = "buyMoreLb",
							text = "1000",
							type = "label",
							y = 3,
							x = -107
						},
						{
							fontSize = 20,
							name = "Text_7_Copy",
							type = "label",
							textId = 213352,
							style = "label_warlock",
							y = 10,
							x = -80,
							color = color_whi,
							anchorPoint = ccp(0, 0.5)
						}
					}
				}
			}
		},
		{
			name = "doBtn",
			h = 62,
			type = "button",
			w = 195,
			y = -225,
			visible = false,
			x = -10,
			normal = {
				path = "res/ui/common/button/public_btn_green.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_green_c.png"
			},
			disable = {
				path = "res/ui/common/button/public_btn_green_g.png"
			},
			children = {
				{
					fontSize = 25,
					name = "doBtnLb",
					style = "label_warlock",
					type = "label",
					y = 33,
					x = 100,
					textId = 213240,
					color = color_whi
				}
			}
		},
		{
			name = "guidBtn",
			h = 43,
			type = "button",
			w = 137,
			y = 40,
			visible = false,
			x = -12,
			normal = {
				path = "res/ui/common/button/public_btn_green70.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_green70_c.png"
			},
			disable = {
				path = "res/ui/common/button/public_btn_green70_c.png"
			},
			children = {
				{
					fontSize = 20,
					style = "label_warlock",
					y = 24,
					type = "label",
					x = 70,
					textId = 213350,
					color = color_whi
				},
				{
					fontSize = 20,
					name = "freePrimerLb",
					type = "label",
					visible = false,
					style = "label_warlock",
					x = 175,
					y = 24,
					color = colorQuality[4]
				}
			}
		},
		{
			y = -20,
			name = "mainMaterialSp1",
			type = "sprite",
			x = -12,
			pic = {
				path = "res/ui/weapon/casting/zz_icon_di.png"
			},
			children = {
				{
					y = 44,
					name = "mainMaterialIcon1",
					type = "sprite",
					x = 44,
					pic = {
						path = "Default/Sprite.png"
					}
				},
				{
					fontSize = 22,
					style = "label_warlock",
					name = "mainMaterialLb1",
					type = "label",
					y = 20,
					x = 45,
					anchorPoint = ccp(0, 0.5)
				},
				{
					name = "mainMaterialBtn1",
					h = 72,
					type = "button",
					w = 72,
					y = 44,
					x = 44,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					disable = {
						path = "res/default.png"
					}
				}
			}
		},
		{
			visible = false,
			name = "mainMaterialSp2",
			y = -115,
			type = "sprite",
			x = -129,
			pic = {
				path = "res/ui/weapon/casting/zz_icon_di_s.png"
			},
			children = {
				{
					y = 33,
					name = "mainMaterialIcon2",
					scale = 0.7,
					type = "sprite",
					x = 33,
					pic = {
						frame = true,
						path = "chitongkuai.jpg"
					}
				},
				{
					y = -17,
					name = "zz_word_di",
					type = "sprite",
					x = 33,
					pic = {
						path = "res/ui/weapon/casting/zz_word_di.png"
					}
				},
				{
					fontSize = 20,
					name = "mainMaterialLb2",
					y = -17,
					type = "label",
					x = 33
				},
				{
					name = "mainMaterialBtn2",
					h = 72,
					type = "button",
					w = 72,
					y = 44,
					x = 44,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					disable = {
						path = "res/default.png"
					}
				}
			}
		},
		{
			visible = false,
			name = "mainMaterialSp3",
			y = -115,
			type = "sprite",
			x = 110,
			pic = {
				path = "res/ui/weapon/casting/zz_icon_di_s.png"
			},
			children = {
				{
					y = 33,
					name = "mainMaterialIcon3",
					scale = 0.7,
					type = "sprite",
					x = 33,
					pic = {
						frame = true,
						path = "cd.jpg"
					}
				},
				{
					y = -17,
					name = "zz_word_di_Copy",
					type = "sprite",
					x = 33,
					pic = {
						path = "res/ui/weapon/casting/zz_word_di.png"
					}
				},
				{
					fontSize = 20,
					name = "mainMaterialLb3",
					y = -17,
					type = "label",
					x = 33
				},
				{
					name = "mainMaterialBtn3",
					h = 72,
					type = "button",
					w = 72,
					y = 44,
					x = 44,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					disable = {
						path = "res/default.png"
					}
				}
			}
		},
		{
			visible = false,
			name = "prossBg",
			y = -215,
			type = "sprite",
			x = -9.7778,
			pic = {
				path = "res/ui/weapon/casting/zz_bar_bg.png"
			},
			children = {
				{
					y = 12,
					name = "pross",
					type = "progressbar",
					x = 140,
					pic = {
						path = "res/ui/weapon/casting/zz_bar.png"
					}
				}
			}
		},
		{
			y = 49,
			name = "rightBg",
			type = "sprite",
			x = 314,
			pic = {
				path = "res/ui/weapon/casting/zz_zz_bg.png"
			}
		},
		{
			type = "sprite",
			name = "minMaterialSp",
			y = -175.4129,
			visible = false,
			x = 310.1899,
			anchorPoint = ccp(0.4792, 0.4752),
			pic = {
				path = "res/ui/weapon/casting/zz_zz_bg2.png"
			},
			children = {
				{
					fontSize = 22,
					name = "Text_13",
					style = "label_warlock",
					type = "label",
					y = 161,
					x = 45,
					textId = 213353
				},
				{
					y = 71,
					name = "zz_zz_line01",
					type = "sprite",
					x = 92,
					pic = {
						path = "res/ui/weapon/casting/zz_zz_line01.png"
					}
				},
				{
					y = 65,
					name = "zz_zz_line03",
					type = "sprite",
					x = 144,
					pic = {
						path = "res/ui/weapon/casting/zz_zz_line02.png"
					}
				},
				{
					y = 69,
					name = "zz_zz_line02",
					type = "sprite",
					x = 199,
					pic = {
						path = "res/ui/weapon/casting/zz_zz_line03.png"
					}
				},
				{
					name = "minItem",
					h = 88,
					type = "button",
					w = 88,
					y = 128,
					x = 145,
					normal = {
						path = "res/ui/weapon/casting/zz_icon_di.png"
					},
					touched = {
						path = "res/ui/weapon/casting/zz_icon_di.png"
					},
					disable = {
						path = "res/ui/weapon/casting/zz_icon_di.png"
					},
					children = {
						{
							y = 44,
							name = "qingtongjian",
							type = "sprite",
							x = 44,
							pic = {
								frame = true,
								path = "qingtongjian.jpg"
							}
						}
					}
				},
				{
					name = "minMaterialSp3",
					h = 42,
					type = "button",
					w = 42,
					y = 37,
					x = 145,
					normal = {
						path = "res/ui/weapon/casting/zz_icon_di_s2.png"
					},
					touched = {
						path = "res/ui/weapon/casting/zz_icon_di_s2.png"
					},
					children = {
						{
							y = 21,
							name = "minMaterialIcon3",
							scale = 0.5,
							type = "sprite",
							x = 21,
							pic = {
								frame = true,
								path = "shiying.jpg"
							}
						},
						{
							fontSize = 20,
							name = "minMaterialLb3",
							y = 0,
							type = "label",
							x = 21
						}
					}
				},
				{
					name = "minMaterialSp2",
					h = 42,
					type = "button",
					w = 42,
					y = 37,
					x = 217,
					normal = {
						path = "res/ui/weapon/casting/zz_icon_di_s2.png"
					},
					touched = {
						path = "res/ui/weapon/casting/zz_icon_di_s2.png"
					},
					children = {
						{
							y = 21,
							name = "minMaterialIcon2",
							scale = 0.5,
							type = "sprite",
							x = 21,
							pic = {
								frame = true,
								path = "shiying.jpg"
							}
						},
						{
							fontSize = 20,
							name = "minMaterialLb2",
							y = 0,
							type = "label",
							x = 21
						}
					}
				},
				{
					name = "minMaterialSp1",
					h = 42,
					type = "button",
					w = 42,
					y = 37,
					x = 73,
					normal = {
						path = "res/ui/weapon/casting/zz_icon_di_s2.png"
					},
					touched = {
						path = "res/ui/weapon/casting/zz_icon_di_s2.png"
					},
					children = {
						{
							y = 21,
							name = "minMaterialIcon1",
							scale = 0.5,
							type = "sprite",
							x = 21,
							pic = {
								frame = true,
								path = "shiying.jpg"
							}
						},
						{
							fontSize = 20,
							name = "minMaterialLb1",
							y = 0,
							type = "label",
							x = 21
						}
					}
				}
			}
		},
		{
			fontSize = 22,
			name = "numLb2",
			visible = false,
			type = "label",
			y = -45,
			x = -50,
			anchorPoint = ccp(0, 0.5)
		},
		{
			y = 0,
			name = "castBg",
			visible = false,
			type = "sprite",
			x = 0,
			pic = {
				path = "res/default.png"
			},
			children = {
				{
					x = -170,
					name = "prevBtn",
					h = 82,
					type = "button",
					w = 52,
					y = 0,
					scale = -1,
					normal = {
						path = "res/ui/weapon/casting/delbl_btn_arrow.png"
					},
					touched = {
						path = "res/ui/weapon/casting/delbl_btn_arrow_c.png"
					}
				},
				{
					w = 52,
					name = "nextBtn",
					h = 82,
					type = "button",
					y = 0,
					x = 150,
					normal = {
						path = "res/ui/weapon/casting/delbl_btn_arrow.png"
					},
					touched = {
						path = "res/ui/weapon/casting/delbl_btn_arrow_c.png"
					}
				},
				{
					y = -220,
					type = "sprite",
					x = -345,
					pic = {
						path = "res/ui/weapon/casting/delbl_baolu_word_di.png"
					},
					children = {
						{
							fontSize = 22,
							name = "castNumLb",
							y = 40,
							type = "label",
							x = 140,
							textId = 215621,
							color = colorQuality[4]
						}
					}
				}
			}
		},
		{
			y = -110,
			name = "successBg",
			visible = false,
			type = "sprite",
			x = -10,
			pic = {
				path = "res/ui/weapon/casting/zz_cgl_bg.png"
			},
			children = {
				{
					y = 18.5,
					name = "zz_word_cgl",
					type = "sprite",
					x = 64,
					pic = {
						path = "res/ui/weapon/casting/zz_word_cgl.png"
					}
				},
				{
					name = "successNum",
					type = "atlaslabel",
					pic = "res/ui/common/number/zz_word_number.png",
					startCharMap = 48,
					text = "80",
					y = 18.5,
					itemWidth = 18,
					itemHeight = 22,
					x = 135 + (var_0_1.numSizeoffset or 0),
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					y = 18.5,
					name = "zz_word_number_s",
					type = "sprite",
					x = 175,
					pic = {
						path = "res/ui/weapon/casting/zz_word_number_s.png"
					}
				}
			}
		},
		{
			y = 0,
			name = "animSp",
			type = "sprite",
			x = 0,
			pic = {
				path = "Default/Sprite.png"
			},
			children = {
				{
					y = -92,
					name = "fireAni",
					type = "sprite",
					x = -8,
					pic = {
						path = "Default.png"
					}
				},
				{
					y = -115,
					name = "addmaterialAni",
					type = "sprite",
					x = 113,
					pic = {
						path = "Default.png"
					}
				},
				{
					y = -113,
					name = "proAni",
					type = "sprite",
					x = 30,
					pic = {
						path = "Default.png"
					}
				}
			}
		}
	}
}

function var_0_0.btn(arg_2_0, arg_2_1)
	return {
		h = 50,
		type = "button",
		w = 125,
		y = 26,
		x = 170,
		name = "Btn" .. arg_2_0,
		normal = {
			frame = true,
			path = "btn2_gre_a.png"
		},
		touched = {
			frame = true,
			path = "btn2_gre_c.png"
		},
		disable = {
			frame = true,
			path = "btn2_gre_g.png"
		},
		anchorPoint = ccp(0.5, 0.5),
		children = {
			{
				fontSize = 22,
				h = 50,
				type = "label",
				w = 125,
				style = "label_warlock",
				font = "Thonburi",
				y = 25,
				x = 62.5,
				name = "Label" .. arg_2_0,
				color = color_whi,
				textId = arg_2_1,
				align = kCCTextAlignmentLeft
			}
		}
	}
end

local var_0_2 = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(1, 1),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			name = "tipMsg",
			height = 0,
			type = "label",
			width = 300,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}

function var_0_0.ctor(arg_3_0, arg_3_1, arg_3_2)
	log.info("@@ 铸造界面")
	rmgr.loadResource("res/ui/weapon/casting/castingfire/castingfire.plist")
	rmgr.loadResource("res/ui/weapon/casting/addmaterial/addmaterial.plist")

	arg_3_0.data = {}
	arg_3_0.view = {}
	arg_3_0.vId = 0

	uiutil.initWidgets(arg_3_0.view, arg_3_0.layout)

	if arg_3_1 then
		arg_3_0:addChild(arg_3_0.view.widgets.root)
		arg_3_1:addChild(arg_3_0)
	end

	local var_3_0 = CCArray:create()

	var_3_0:addObject(CCCallFunc:create(function()
		arg_3_0.view.widgets.nextBtn:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/weapon/casting/delbl_btn_arrow_c.png"), CCControlStateNormal)
		arg_3_0.view.widgets.prevBtn:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/weapon/casting/delbl_btn_arrow_c.png"), CCControlStateNormal)
	end))
	var_3_0:addObject(CCDelayTime:create(0.6))
	var_3_0:addObject(CCCallFunc:create(function()
		arg_3_0.view.widgets.nextBtn:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/weapon/casting/delbl_btn_arrow.png"), CCControlStateNormal)
		arg_3_0.view.widgets.prevBtn:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/weapon/casting/delbl_btn_arrow.png"), CCControlStateNormal)
	end))
	var_3_0:addObject(CCDelayTime:create(0.6))

	local var_3_1 = CCSequence:create(var_3_0)

	arg_3_0.view.widgets.prevBtn:runAction(CCRepeatForever:create(var_3_1))

	local var_3_2 = CCSprite:create("res/ui/weapon/casting/zz_npc.png")

	var_3_2:setAnchorPoint(ccp(0, 0))
	var_3_2:setPosition(ccp(-455, -255))
	var_3_2:setTextureRect(CCRectMake(93, 0, 342, 408))
	arg_3_0.view.widgets.npcSp:addChild(var_3_2)
end

function var_0_0.chooseCastingQuality(arg_6_0, arg_6_1)
	local function var_6_0(arg_7_0)
		local var_7_0 = arg_7_0.action.data

		if var_7_0.drawingList then
			arg_6_0:updateDrawingList(var_7_0.drawingList)
		end
	end

	cmgr.sendRequest(var_6_0, actions.chooseCastingQuality, arg_6_1)
end

function var_0_0.updateTypeList(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0.view.widgets.rightBg:getChildByTag(666)

	if var_8_0 then
		var_8_0:removeFromParentAndCleanup(true)

		local var_8_1
	end

	local var_8_2 = 0

	local function var_8_3(arg_9_0, arg_9_1)
		log.info("cell touched at : ", arg_9_1:getIdx())

		local var_9_0 = arg_8_1[arg_9_1:getIdx() + 1]
		local var_9_1

		if var_8_2 > 0 then
			local var_9_2 = arg_9_0:cellAtIndex(var_8_2 - 1)

			if var_9_2 then
				local var_9_3 = tolua.cast(var_9_2:getChildByTag(tonumber(var_8_2)), "CCSprite")

				if var_9_3 then
					var_9_3:setDisplayFrame(CCSprite:create("res/ui/weapon/casting/choosebtn/zz_btn_0" .. var_8_2 .. "_c.png"):displayFrame())
				end
			end
		end

		tolua.cast(arg_9_1:getChildByTag(tonumber(var_9_0.quality)), "CCSprite"):setDisplayFrame(CCSprite:create("res/ui/weapon/casting/choosebtn/zz_btn_0" .. var_9_0.quality .. ".png"):displayFrame())

		var_8_2 = var_9_0.quality

		arg_8_0:chooseCastingQuality(var_9_0.quality)
	end

	if arg_8_2 == nil or #arg_8_2 == 0 then
		arg_8_0:chooseCastingQuality(1)
	end

	local function var_8_4(arg_10_0, arg_10_1)
		return 54, 54
	end

	local function var_8_5(arg_11_0, arg_11_1)
		local var_11_0 = arg_11_0:dequeueCell()

		if var_11_0 then
			var_11_0:removeAllChildrenWithCleanup(true)
		else
			var_11_0 = CCTableViewCell:new()
		end

		local var_11_1 = arg_8_1[arg_11_1 + 1]

		if var_11_1 then
			local var_11_2

			if arg_8_2 and #arg_8_2 > 0 and arg_8_2[1].quality == var_11_1.quality then
				var_11_2 = CCSprite:create("res/ui/weapon/casting/choosebtn/zz_btn_0" .. var_11_1.quality .. ".png")
			else
				var_11_2 = CCSprite:create("res/ui/weapon/casting/choosebtn/zz_btn_0" .. var_11_1.quality .. "_c.png")
			end

			var_11_2:setPosition(ccp(27, 27))
			var_11_0:addChild(var_11_2, 1, var_11_1.quality)
		end

		return var_11_0
	end

	local function var_8_6()
		local var_12_0 = arg_8_1

		if var_12_0 and #var_12_0 > 0 then
			return #var_12_0
		else
			return 0
		end
	end

	local var_8_7 = CCTableView:create(CCSizeMake(260, 55))

	var_8_7:setPosition(10, 205)
	var_8_7:setDirection(kCCScrollViewDirectionHorizontal)
	var_8_7:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_8_0.view.widgets.rightBg:addChild(var_8_7, 1, 666)
	var_8_7:registerScriptHandler(var_8_3, CCTableView.kTableCellTouched)
	var_8_7:registerScriptHandler(var_8_4, CCTableView.kTableCellSizeForIndex)
	var_8_7:registerScriptHandler(var_8_5, CCTableView.kTableCellSizeAtIndex)
	var_8_7:registerScriptHandler(var_8_6, CCTableView.kNumberOfCellsInTableView)
	var_8_7:reloadData()
end

function var_0_0.chooseItem(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4)
	arg_13_0.view.widgets.minMaterialSp:setVisible(true)
	arg_13_0.view.widgets.minItem:setVisible(false)
	arg_13_0.view.widgets.zz_zz_line01:setVisible(false)
	arg_13_0.view.widgets.zz_zz_line02:setVisible(false)
	arg_13_0.view.widgets.zz_zz_line03:setVisible(false)
	arg_13_0.view.widgets.minMaterialSp1:setVisible(false)
	arg_13_0.view.widgets.minMaterialSp2:setVisible(false)
	arg_13_0.view.widgets.minMaterialSp3:setVisible(false)

	local var_13_0 = ""

	for iter_13_0, iter_13_1 in pairs(arg_13_1) do
		print(iter_13_0, iter_13_1)

		var_13_0 = var_13_0 .. "\n" .. language.get(213225, iter_13_1.name, iter_13_1.needNum)
	end

	arg_13_0.minItemTips = arg_13_4.name .. "\n" .. arg_13_4.intro .. "\n\n" .. language.get(213224) .. var_13_0

	arg_13_0.view.widgets.qingtongjian:setDisplayFrame(CCSprite:createWithSpriteFrameName(arg_13_2 .. ".jpg"):displayFrame())
	arg_13_0.view.widgets.minItem:setVisible(true)

	local function var_13_1(arg_14_0, arg_14_1)
		arg_13_0.view.widgets["minMaterialIcon" .. arg_14_0]:setDisplayFrame(CCSprite:createWithSpriteFrameName(arg_14_1.pic .. ".jpg"):displayFrame())
		arg_13_0.view.widgets["minMaterialLb" .. arg_14_0]:setString(tool.getFormatNum(arg_14_1.needNum))

		if (arg_14_1.type == 1 or arg_14_1.type == 2) and arg_13_3 == arg_13_0.info.drawingId then
			if arg_13_0.info.stageType == arg_14_1.type then
				arg_13_0.view.widgets["minMaterialLb" .. arg_14_0]:setString(arg_13_0.info.haveNum .. "/" .. arg_14_1.needNum)
			else
				arg_13_0.view.widgets["minMaterialLb" .. arg_14_0]:setString(tool.getFormatNum(arg_14_1.needNum))
			end
		end

		arg_13_0.view.widgets["zz_zz_line0" .. arg_14_0]:setVisible(true)
		arg_13_0.view.widgets["minMaterialSp" .. arg_14_0]:setVisible(true)

		local var_14_0 = ""

		if arg_14_1.baseMaterialList and #arg_14_1.baseMaterialList > 0 then
			arg_13_0:materialFormat(arg_14_1.baseMaterialList[1])

			var_14_0 = var_14_0 .. language.get(213281, arg_14_1.name, arg_14_1.baseMaterialList[1].needNum, arg_14_1.baseMaterialList[1].name)
			var_14_0 = var_14_0 .. "\n" .. language.get(213294, arg_14_1.baseMaterialList[1].taskStr)
		end

		arg_13_0["minMaterialTips" .. arg_14_0] = arg_14_1.name .. "\n" .. var_14_0
	end

	local var_13_2 = #arg_13_1

	if var_13_2 == 1 then
		var_13_1(3, arg_13_1[1])
	elseif var_13_2 == 2 then
		var_13_1(1, arg_13_1[1])
		var_13_1(2, arg_13_1[2])
	elseif var_13_2 == 3 then
		var_13_1(1, arg_13_1[1])
		var_13_1(2, arg_13_1[2])
		var_13_1(3, arg_13_1[3])
	end
end

function var_0_0.updateDrawingList(arg_15_0, arg_15_1)
	local var_15_0 = {}
	local var_15_1 = 0
	local var_15_2
	local var_15_3 = 0
	local var_15_4 = arg_15_0.view.widgets.rightBg:getChildByTag(777)

	if var_15_4 then
		var_15_4:removeFromParentAndCleanup(true)

		local var_15_5
	end

	local function var_15_6(arg_16_0, arg_16_1)
		log.info("cell touched at!!!!!!!!!!!!!!! : ", arg_16_1:getIdx())

		local var_16_0 = arg_15_1[arg_16_1:getIdx() + 1]

		if var_15_2 then
			pcall(var_15_2.setDisplayFrame, var_15_2, CCSprite:create("res/ui/weapon/casting/zz_btn_di2.png"):displayFrame())
		end

		typeBtn = tolua.cast(arg_16_1:getChildByTag(tonumber(var_16_0.drawingId)), "CCSprite")

		typeBtn:setDisplayFrame(CCSprite:create("res/ui/weapon/casting/zz_btn_di.png"):displayFrame())

		var_15_2 = typeBtn
		var_15_3 = var_16_0.drawingId

		arg_15_0:chooseItem(var_16_0.materialList, var_16_0.pic, var_16_0.drawingId, var_16_0)
	end

	local var_15_7

	if arg_15_0.info.drawingId and arg_15_0.info.drawingId > 0 then
		var_15_7 = arg_15_0:getDrawVoById(arg_15_0.info.drawingId)
	end

	if var_15_7 then
		if #arg_15_1 > 0 and arg_15_1[1] and var_15_7.quality == arg_15_1[1].quality then
			local var_15_8 = var_15_7.materialList

			arg_15_0:chooseItem(var_15_8, var_15_7.pic, var_15_7.drawingId, var_15_7)
		elseif #arg_15_1 > 0 and arg_15_1[1].materialList then
			arg_15_0:chooseItem(arg_15_1[1].materialList, arg_15_1[1].pic, arg_15_1[1].drawingId, arg_15_1[1])
		end
	elseif #arg_15_1 > 0 and arg_15_1[1].materialList then
		arg_15_0:chooseItem(arg_15_1[1].materialList, arg_15_1[1].pic, arg_15_1[1].drawingId, arg_15_1[1])
	end

	local function var_15_9(arg_17_0, arg_17_1)
		return 82, 280
	end

	local function var_15_10(arg_18_0, arg_18_1)
		local var_18_0 = arg_18_0:dequeueCell()

		if var_18_0 then
			var_18_0:removeAllChildrenWithCleanup(true)
		else
			var_18_0 = CCTableViewCell:new()
		end

		local var_18_1 = arg_15_1[arg_18_1 + 1]

		if var_18_1 then
			local var_18_2

			if arg_18_1 == 0 and var_15_2 == nil and var_15_7 and var_15_7.quality ~= var_18_1.quality or var_15_3 == var_18_1.drawingId or arg_15_0.info.drawingId == var_18_1.drawingId then
				var_18_2 = CCSprite:create("res/ui/weapon/casting/zz_btn_di.png")
				var_15_3 = var_18_1.drawingId
				var_15_2 = var_18_2
			else
				var_18_2 = CCSprite:create("res/ui/weapon/casting/zz_btn_di2.png")
			end

			local var_18_3 = CCSprite:create("res/ui/weapon/casting/zz_icon_mutan_s.png")

			var_18_3:setPosition(ccp(28, 67))
			var_18_2:addChild(var_18_3)

			local var_18_4 = 0
			local var_18_5 = (var_18_1.drawingId == 7 or var_18_1.drawingId == 8) and 0 or var_18_1.needCoalNum
			local var_18_6 = CCLabelTTF:create(var_18_5, "", 20)

			var_18_6:setAnchorPoint(ccp(0, 0.5))

			if var_18_5 > arg_15_0.info.playerCoalNum then
				var_18_6:setColor(ccc3(253, 0, 0))
			else
				var_18_6:setColor(colorQuality[1])
			end

			var_18_6:setPosition(ccp(46, 67))
			var_18_2:addChild(var_18_6)

			local var_18_7 = CCSprite:create("res/ui/weapon/casting/zz_icon_di_s2.png")

			var_18_7:setPosition(ccp(36, 28))
			var_18_2:addChild(var_18_7)

			local var_18_8 = CCSprite:createWithSpriteFrameName(var_18_1.pic .. ".jpg")

			var_18_8:setScale(0.5)
			var_18_8:setPosition(ccp(36, 28))
			var_18_2:addChild(var_18_8)

			local var_18_9 = CCStrokeLabelTTF:create(var_18_1.name, "Thonburi-Bold", 22, 1, ccc3(0, 0, 0))

			var_18_9:setPosition(ccp(170, 62))
			var_18_2:addChild(var_18_9)

			local var_18_10 = 213240
			local var_18_11 = var_18_1.drawingId ~= arg_15_0.info.drawingId
			local var_18_12 = arg_15_0.info.drawingId and arg_15_0.info.drawingId > 0 and (var_18_11 and 213292 or 213262) or 213240

			uiutil.initUI(var_15_0, arg_15_0.btn(var_18_1.drawingId, var_18_12), var_18_2)
			var_15_0["Btn" .. var_18_1.drawingId]:setEnabled(var_18_11)

			local function var_18_13(arg_19_0)
				local function var_19_0(arg_20_0)
					arg_15_0:refresh()
				end

				cmgr.sendRequest(var_19_0, actions.chooseCastingDrawing, arg_19_0)
			end

			local function var_18_14(...)
				if arg_15_0.info.drawingId ~= 7 and arg_15_0.info.drawingId ~= 8 and arg_15_0.info.drawingId ~= 0 then
					messageBox.confirm(language.get(213232), function()
						var_18_13(var_18_1.drawingId)
					end)
				else
					var_18_13(var_18_1.drawingId)
				end
			end

			var_15_0["Btn" .. var_18_1.drawingId]:addHandleOfControlEvent(var_18_14, CCControlEventTouchUpInside)
			var_18_2:setPosition(ccp(138, 42))
			var_18_0:addChild(var_18_2, 1, var_18_1.drawingId)
		end

		return var_18_0
	end

	local function var_15_11()
		local var_23_0 = arg_15_1

		if var_23_0 and #var_23_0 > 0 then
			return #var_23_0
		else
			return 0
		end
	end

	local var_15_12 = CCTableView:create(CCSizeMake(276, 200))

	var_15_12:setPosition(4, 4)
	var_15_12:setDirection(kCCScrollViewDirectionVertical)
	var_15_12:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_15_0.view.widgets.rightBg:addChild(var_15_12, 2, 777)
	var_15_12:registerScriptHandler(var_15_6, CCTableView.kTableCellTouched)
	var_15_12:registerScriptHandler(var_15_9, CCTableView.kTableCellSizeForIndex)
	var_15_12:registerScriptHandler(var_15_10, CCTableView.kTableCellSizeAtIndex)
	var_15_12:registerScriptHandler(var_15_11, CCTableView.kNumberOfCellsInTableView)
	var_15_12:reloadData()
end

function var_0_0.materialFormat(arg_24_0, arg_24_1)
	if arg_24_1 and arg_24_1.taskObj and arg_24_1.taskObj.intro then
		arg_24_1.taskObj.intro = string.gsub(arg_24_1.taskObj.intro, ",", "、")

		if arg_24_1.taskObj.linkArrs and arg_24_1.taskObj.linkArrs[1] then
			local var_24_0 = arg_24_1.taskObj.linkArrs[1].linkType

			arg_24_1.taskObj.intro = string.gsub(arg_24_1.taskObj.intro, "#", language.get(213281 + var_24_0))
		end

		arg_24_1.taskStr = arg_24_1.taskObj.intro
	end
end

function var_0_0.updatePanel(arg_25_0, arg_25_1)
	arg_25_0.info = arg_25_1
	arg_25_0.materialOk = true

	arg_25_0.view.widgets.talkSp:setVisible(true)
	arg_25_0.view.widgets.btnSp:setVisible(false)
	arg_25_0.view.widgets.btnSp2:setVisible(false)
	arg_25_0.view.widgets.btnSp3:setVisible(false)
	arg_25_0.view.widgets.btnSp4:setVisible(false)
	arg_25_0.view.widgets.ycbwEventInfo:setVisible(false)

	if arg_25_0.timerLayer then
		arg_25_0.timerLayer:removeFromParentAndCleanup(true)

		arg_25_0.timerLayer = nil
	end

	if arg_25_1.stoveList then
		for iter_25_0, iter_25_1 in ipairs(arg_25_1.stoveList) do
			print("##################", iter_25_0, iter_25_1)

			if iter_25_1.vId == arg_25_1.vId then
				arg_25_0.nowShowIndex = iter_25_0
			end
		end

		if #arg_25_1.stoveList > 1 then
			arg_25_0.nowShowIndex = arg_25_0.nowShowIndex or 1

			arg_25_0.view.widgets.castNumLb:setString(language.get(215620 + arg_25_0.nowShowIndex))
			arg_25_0.view.widgets.castBg:setVisible(true)
		end
	end

	arg_25_0.vId = arg_25_1.vId or 0

	if arg_25_1.baseMaterials then
		for iter_25_2, iter_25_3 in pairs(arg_25_1.baseMaterials) do
			if iter_25_3.haveNum < iter_25_3.needNum then
				arg_25_0.materialOk = false
			end
		end

		arg_25_1.materialList = arg_25_1.baseMaterials
	elseif arg_25_1.stageType > 0 and (arg_25_1.drawingId == 7 or arg_25_1.drawingId == 8) then
		arg_25_1.materialList = {}

		if arg_25_0:getDrawVoById(arg_25_1.drawingId) and arg_25_0:getDrawVoById(arg_25_1.drawingId).materialList then
			local var_25_0 = arg_25_0:getDrawVoById(arg_25_1.drawingId).materialList[1]

			var_25_0.haveNum = arg_25_1.playerWoodNum

			table.insert(arg_25_1.materialList, var_25_0)
		end
	else
		arg_25_1.materialList = nil
	end

	if arg_25_1.materialList then
		local var_25_1 = arg_25_1.materialList[1]

		arg_25_0:materialFormat(var_25_1)
	end

	if arg_25_1.stageType == 4 and not arg_25_1.finished then
		arg_25_0.materialOk = false
	end

	if arg_25_1.openQualityList then
		arg_25_0:updateTypeList(arg_25_1.openQualityList, arg_25_1.drawingList)
	end

	if arg_25_1.drawingList then
		arg_25_0:updateDrawingList(arg_25_1.drawingList)
	end

	arg_25_0.view.widgets.title:setDisplayFrame(CCSprite:create("res/ui/weapon/casting/title/zz_title_" .. arg_25_1.upgradeLv .. ".png"):displayFrame())
	arg_25_0.view.widgets.numLb:setString(arg_25_1.playerCoalNum)
	arg_25_0.view.widgets.doType:setDisplayFrame(CCSprite:create("res/ui/weapon/casting/dotype/zz_word_" .. tonumber(arg_25_1.stageType + 1) .. ".png"):displayFrame())
	arg_25_0.view.widgets.buyCdCoinLb:setString(arg_25_1.goldSilverHammer or 0)
	arg_25_0.view.widgets.buyProbCoinLb:setString(arg_25_1.goldOutput or 0)
	arg_25_0.view.widgets.buyProbCoinLb3:setString(arg_25_1.goldBuyProb or 0)
	arg_25_0.view.widgets.mainMaterialIcon3:setDisplayFrame(CCSprite:createWithSpriteFrameName("cd.jpg"):displayFrame())

	if user.ycbwEvent then
		if arg_25_1.stageType > 0 and (arg_25_1.drawingId == 7 or arg_25_1.drawingId == 8) then
			arg_25_0.view.widgets.doType:setDisplayFrame(CCSprite:create("res/ui/activity/ybcc/ybcc_word_bljz.png"):displayFrame())
		end

		if arg_25_1.stageType > 0 and (arg_25_1.drawingId == 7 or arg_25_1.drawingId == 8) and arg_25_1.cd and arg_25_1.cd > 0 then
			if arg_25_1.eventObj and arg_25_1.eventObj.eventGoldReduceCd then
				arg_25_0.view.widgets.buyBLLb:setString(arg_25_1.eventObj.eventGoldReduceCd)

				arg_25_0.eventGoldReduceCd = arg_25_1.eventObj.eventGoldReduceCd
			end

			arg_25_0.view.widgets.btnSp4:setVisible(true)
		end

		if arg_25_1.drawingId > 14 then
			if arg_25_1.stageType == 1 then
				arg_25_0.view.widgets.doType:setDisplayFrame(CCSprite:create("res/ui/activity/ybcc/ybcc_word_mgkc.png"):displayFrame())
			elseif arg_25_1.stageType == 2 then
				arg_25_0.view.widgets.doType:setDisplayFrame(CCSprite:create("res/ui/activity/ybcc/ybcc_word_sjxz.png"):displayFrame())
			end
		end
	end

	local function var_25_2()
		if arg_25_1.stageType == 1 then
			arg_25_0.view.widgets.talkSp:setVisible(false)
			arg_25_0.view.widgets.btnSp3:setVisible(false)
			arg_25_0.view.widgets.btnSp:setVisible(true)
			arg_25_0.view.widgets.btnSp2:setVisible(true)
		elseif arg_25_1.stageType == 2 then
			arg_25_0.view.widgets.btnSp:setVisible(false)
			arg_25_0.view.widgets.btnSp2:setVisible(false)
			arg_25_0.view.widgets.talkSp:setVisible(false)
			arg_25_0.view.widgets.btnSp3:setVisible(true)
		else
			arg_25_0.view.widgets.talkSp:setVisible(true)
			arg_25_0.view.widgets.btnSp:setVisible(false)
			arg_25_0.view.widgets.btnSp2:setVisible(false)
			arg_25_0.view.widgets.btnSp3:setVisible(false)
		end
	end

	if arg_25_1.stageType == 0 then
		if arg_25_1.finished then
			arg_25_0.view.widgets.talkLb:setString(language.get(213228))
		else
			arg_25_0.view.widgets.talkLb:setString(language.get(213223))
		end
	end

	if arg_25_1.stageType == 1 or arg_25_1.stageType == 2 then
		if user.ycbwEvent and arg_25_1.drawingId > 14 then
			arg_25_0.view.widgets.ycbwEventInfo:setVisible(true)
		end

		if arg_25_0.isUpdateTalk or arg_25_0.materialOkTalk then
			arg_25_0.materialOkTalk = false
			arg_25_0.isUpdateTalk = true

			if arg_25_1.materialList then
				if arg_25_0.materialOk then
					if not arg_25_0.materialOk or arg_25_1.drawingId == 7 or arg_25_1.drawingId == 8 or arg_25_1.stageType ~= 1 and arg_25_1.stageType ~= 2 then
						-- block empty
					else
						var_25_2()
					end

					if arg_25_1.stageType == 2 then
						arg_25_0.view.widgets.talkLb:setString(language.get(213298))
					else
						arg_25_0.view.widgets.talkLb:setString(language.get(213288))
					end
				else
					local var_25_3 = arg_25_1.materialList[1]

					if var_25_3 then
						if not arg_25_0.materialOk or arg_25_1.drawingId == 7 or arg_25_1.drawingId == 8 or arg_25_1.stageType ~= 1 and arg_25_1.stageType ~= 2 then
							print("material not ok!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						else
							print("material  ok show !!!!!!!!!!!!!!!!!!!!!!!!!!!!")
							var_25_2()
						end

						arg_25_0.view.widgets.talkLb:setString(language.get(213293, var_25_3.taskStr, var_25_3.name, language.get(213259 + arg_25_1.stageType)))
					end
				end
			end

			if arg_25_1.drawingId == 7 or arg_25_1.drawingId == 8 then
				if user.ycbwEvent then
					arg_25_0.view.widgets.talkLb:setString(language.get(214304))
				else
					arg_25_0.view.widgets.talkLb:setString(language.get(213241))
				end
			end
		else
			if arg_25_1.drawingId ~= 7 and arg_25_1.drawingId ~= 8 and arg_25_0.materialOk then
				var_25_2()
			end

			arg_25_0.isUpdateTalk = true
		end
	end

	if arg_25_1.stageType == 3 then
		arg_25_0.view.widgets.talkLb:setString(language.get(213242))
	end

	if arg_25_1.stageType == 4 then
		if arg_25_1.finished then
			arg_25_0.view.widgets.talkLb:setString(language.get(213305))
		else
			arg_25_0.view.widgets.talkLb:setString(language.get(213296))
		end
	end

	if arg_25_1.materialList and #arg_25_1.materialList > 0 then
		local var_25_4 = 0

		if arg_25_1.cdInMinutes >= 60 then
			var_25_4 = language.get(213265, arg_25_1.cdInMinutes / 60)
		else
			var_25_4 = language.get(213264, arg_25_1.cdInMinutes)
		end

		arg_25_0.view.widgets.mainMaterialLb3:setString(var_25_4)

		local function var_25_5(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4)
			if arg_25_1.cd and arg_25_1.cd > 0 then
				arg_27_1:setString(arg_27_3.needNum .. "/" .. arg_27_3.needNum)
			elseif arg_25_1.stageType == 3 then
				arg_27_1:setString(arg_27_3.needNum .. "/" .. arg_27_3.needNum)
			else
				arg_27_1:setString(arg_27_3.haveNum .. "/" .. arg_27_3.needNum)

				if arg_27_3.haveNum < arg_27_3.needNum then
					arg_27_1:setColor(ccc3(255, 0, 0))
				else
					arg_27_1:setColor(ccc3(255, 255, 255))
				end
			end

			if arg_25_1.drawingId == 7 or arg_25_1.drawingId == 8 then
				arg_27_1:setString(tool.getFormatNum(arg_27_3.needNum))
			end

			arg_27_2:setDisplayFrame(CCSprite:createWithSpriteFrameName(arg_27_3.pic .. ".jpg"):displayFrame())

			local var_27_0 = language.get(213230, tool.getFormatNum(arg_27_3.needNum), arg_27_3.name)

			if arg_27_3.taskStr then
				var_27_0 = var_27_0 .. "\n" .. language.get(213294, arg_27_3.taskStr)
			end

			var_0_0["mainMaterialTips" .. arg_27_4] = var_27_0

			arg_27_0:setVisible(true)
		end

		local var_25_6 = 2

		for iter_25_4, iter_25_5 in pairs(arg_25_1.materialList) do
			var_25_5(arg_25_0.view.widgets["mainMaterialSp" .. var_25_6], arg_25_0.view.widgets["mainMaterialLb" .. var_25_6], arg_25_0.view.widgets["mainMaterialIcon" .. var_25_6], iter_25_5, var_25_6)

			var_25_6 = var_25_6 + 1
		end
	else
		arg_25_0.view.widgets.mainMaterialSp2:setVisible(false)
	end

	arg_25_0.view.widgets.prossBg:setVisible(false)

	local var_25_7 = not arg_25_0.materialOk and arg_25_1.stageType ~= 4

	arg_25_0.view.widgets.buyBtnSp:setVisible(var_25_7)
	arg_25_0.view.widgets.buyOneLb:setString(arg_25_1.goldBuyMaterial or 0)

	local var_25_8 = 0

	if arg_25_1.goldBuyMaterial then
		var_25_8 = arg_25_1.goldBuyMaterial * 10
	end

	arg_25_0.view.widgets.buyMoreLb:setString(var_25_8)

	local var_25_9 = arg_25_1.stageType == 2 and arg_25_0.materialOk

	arg_25_0.view.widgets.successBg:setVisible(var_25_9)

	local var_25_10 = 0

	if arg_25_1.prob then
		var_25_10 = arg_25_1.prob * 100
	end

	arg_25_0.view.widgets.successNum:setString(var_25_10)
	arg_25_0.view.widgets.numLb2:setVisible(arg_25_1.stageType == 4)
	arg_25_0.view.widgets.guidBtn:setVisible(arg_25_1.stageType == 4)
	arg_25_0.view.widgets.freePrimerLb:setVisible(false)

	if arg_25_1.freePrimer and arg_25_1.freePrimer > 0 then
		arg_25_0.view.widgets.freePrimerLb:setVisible(true)
		arg_25_0.view.widgets.freePrimerLb:setString(language.get(215035, arg_25_1.freePrimer))
	end

	arg_25_0.mainMaterialTips1 = nil
	var_0_0.mainMaterialTips3 = nil

	if arg_25_1.stageType ~= 4 and arg_25_1.minOutput and arg_25_1.maxOutput then
		if arg_25_1.minOutput == arg_25_1.maxOutput then
			arg_25_0.mainMaterialTips1 = language.get(213291, arg_25_1.haveNum .. "/" .. arg_25_1.needNum, arg_25_1.minOutput)
		else
			arg_25_0.mainMaterialTips1 = language.get(213291, arg_25_1.haveNum .. "/" .. arg_25_1.needNum, arg_25_1.minOutput .. "-" .. arg_25_1.maxOutput)
		end
	end

	if arg_25_1.drawingId > 0 then
		if arg_25_0.timerLayer == nil then
			local function var_25_11()
				if arg_25_0.timerLayer then
					arg_25_0.timerLayer:removeFromParentAndCleanup(true)

					arg_25_0.timerLayer = nil
				end

				arg_25_0:refresh()
			end

			local function var_25_12(arg_29_0)
				local var_29_0 = tonumber(100 - arg_29_0 / (arg_25_0.info.cdInMinutes * 60000) * 100)

				arg_25_0.view.widgets.pross:setPercentage(math.ceil(var_29_0))
			end

			if arg_25_1.cd > 0 then
				arg_25_0.timerLayer = createTimerLabel(arg_25_1.cd, "@H:@M:@S", "Thonburi-Bold", 24, var_25_11, nil, nil, colorTips.red, var_25_12)

				arg_25_0.timerLayer:setPosition(ccp(140, 12))
				arg_25_0.view.widgets.prossBg:addChild(arg_25_0.timerLayer, 999, 1000)
			end
		elseif arg_25_1.cd > 0 then
			arg_25_0.timerLayer:setTime(arg_25_1.cd)
		end

		if arg_25_1.cd and arg_25_1.cd > 0 then
			arg_25_0.view.widgets.doBtn:setVisible(false)
			arg_25_0.view.widgets.prossBg:setVisible(true)

			local var_25_13 = tonumber(100 - arg_25_1.cd / (arg_25_1.cdInMinutes * 60000) * 100)

			arg_25_0.view.widgets.pross:setPercentage(math.ceil(var_25_13))
		else
			arg_25_0.view.widgets.doBtn:setEnabled(arg_25_0.materialOk)

			if arg_25_1.finished then
				if arg_25_1.stageType == 1 then
					arg_25_0.view.widgets.doBtnLb:setString(language.get(213268))
				elseif arg_25_1.stageType == 2 then
					arg_25_0.view.widgets.doBtnLb:setString(language.get(213268))
				elseif arg_25_1.stageType == 3 then
					arg_25_0.view.widgets.doBtnLb:setString(language.get(213280))
				elseif arg_25_1.stageType == 4 then
					arg_25_0.view.widgets.doBtnLb:setString(language.get(213270))
				end
			elseif arg_25_1.stageType == 1 or arg_25_1.stageType == 4 then
				arg_25_0.view.widgets.doBtnLb:setString(language.get(213270))
			else
				arg_25_0.view.widgets.doBtnLb:setString(language.get(213271))
			end

			arg_25_0.view.widgets.doBtn:setVisible(true)
		end

		arg_25_0.view.widgets.castingBgSp:setDisplayFrame(CCSprite:create("res/ui/weapon/casting/luzi/zz_luzi_0" .. tonumber(arg_25_1.upgradeLv) .. ".png"):displayFrame())

		local var_25_14 = 0

		if arg_25_1.upgradedTimes then
			var_25_14 = arg_25_1.upgradedTimes
		end

		arg_25_0.view.widgets.upgradedMc:setDisplayFrame(CCSprite:create("res/ui/weapon/casting/luzi/zz_luzi_hy_" .. tonumber(var_25_14 + 1) .. ".png"):displayFrame())

		local var_25_15 = ""
		local var_25_16 = arg_25_0:getDrawVoById(arg_25_1.drawingId)
		local var_25_17

		if var_25_16 then
			var_25_17 = arg_25_0:getMaterialVoByType(var_25_16, arg_25_1.stageType)
		end

		if var_25_17 and arg_25_1.drawingId ~= 7 and arg_25_1.drawingId ~= 8 then
			arg_25_0.view.widgets.mainMaterialIcon1:setDisplayFrame(CCSprite:createWithSpriteFrameName(var_25_17.pic .. ".jpg"):displayFrame())
		else
			arg_25_0.mainMaterialTips1 = arg_25_1.name .. "\n" .. arg_25_1.intro

			arg_25_0.view.widgets.mainMaterialIcon1:setDisplayFrame(CCSprite:createWithSpriteFrameName(arg_25_1.pic .. ".jpg"):displayFrame())
		end

		local var_25_18 = (arg_25_1.stageType == 1 or arg_25_1.stageType == 2) and arg_25_1.drawingId ~= 7 and arg_25_1.drawingId ~= 8

		arg_25_0.view.widgets.mainMaterialLb1:setVisible(var_25_18)

		local var_25_19 = 0

		if arg_25_1.minOutput == arg_25_1.maxOutput then
			var_25_19 = arg_25_1.minOutput
		else
			var_25_19 = arg_25_1.minOutput .. "-" .. arg_25_1.maxOutput
		end

		arg_25_0.view.widgets.mainMaterialLb1:setString(var_25_19 or 0)
		arg_25_0.view.widgets.mainMaterialSp3:setVisible(arg_25_1.stageType ~= 4)
		arg_25_0.view.widgets.numLb2:setString(language.get(213297, arg_25_1.haveNum, arg_25_1.needNum))

		if arg_25_1.stageType == 3 then
			local var_25_20 = {}
			local var_25_21 = arg_25_0:getDrawVoById(arg_25_1.drawingId).materialList

			for iter_25_6, iter_25_7 in pairs(var_25_21) do
				if iter_25_7.type > 0 and iter_25_7.type ~= 4 then
					table.insert(var_25_20, iter_25_7)
				end
			end

			arg_25_0.view.widgets.mainMaterialSp3:setVisible(false)

			if #var_25_20 > 0 then
				local function var_25_22(arg_30_0, arg_30_1, arg_30_2, arg_30_3, arg_30_4)
					if arg_25_1.cd and arg_25_1.cd > 0 then
						arg_30_1:setString(arg_30_3.needNum .. "/" .. arg_30_3.needNum)
					elseif arg_25_1.stageType == 3 then
						arg_30_1:setString(arg_30_3.needNum .. "/" .. arg_30_3.needNum)
					else
						arg_30_1:setString(arg_30_3.haveNum .. "/" .. arg_30_3.needNum)

						if arg_30_3.haveNum < arg_30_3.needNum then
							arg_30_1:setColor(ccc3(255, 0, 0))
						else
							arg_30_1:setColor(ccc3(255, 255, 255))
						end
					end

					if arg_25_1.drawingId == 7 or arg_25_1.drawingId == 8 then
						arg_30_1:setString(tool.getFormatNum(arg_30_3.needNum))
					end

					arg_30_2:setDisplayFrame(CCSprite:createWithSpriteFrameName(arg_30_3.pic .. ".jpg"):displayFrame())

					local var_30_0 = language.get(213230, tool.getFormatNum(arg_30_3.needNum), arg_30_3.name)

					if arg_30_3.taskStr then
						var_30_0 = var_30_0 .. "\n" .. language.get(213294, arg_30_3.taskStr)
					end

					var_0_0["mainMaterialTips" .. arg_30_4] = var_30_0

					arg_30_0:setVisible(true)
				end

				local var_25_23 = 2

				for iter_25_8, iter_25_9 in pairs(var_25_20) do
					var_25_22(arg_25_0.view.widgets["mainMaterialSp" .. var_25_23], arg_25_0.view.widgets["mainMaterialLb" .. var_25_23], arg_25_0.view.widgets["mainMaterialIcon" .. var_25_23], iter_25_9, var_25_23)

					var_25_23 = var_25_23 + 1
				end
			else
				arg_25_0.view.widgets.mainMaterialSp2:setVisible(false)
			end
		end
	else
		arg_25_0.mainMaterialTips1 = nil

		arg_25_0.view.widgets.mainMaterialSp3:setVisible(false)
		arg_25_0.view.widgets.doBtn:setVisible(false)
		arg_25_0.view.widgets.mainMaterialLb1:setVisible(false)
		arg_25_0.view.widgets.mainMaterialIcon1:setDisplayFrame(CCSprite:create("Default/Sprite.png"):displayFrame())
	end
end

function var_0_0.getDrawVoById(arg_31_0, arg_31_1)
	for iter_31_0, iter_31_1 in pairs(arg_31_0.info.drawingList) do
		if iter_31_1.drawingId == arg_31_1 then
			return iter_31_1
		end
	end

	return nil
end

function var_0_0.getMaterialVoByType(arg_32_0, arg_32_1, arg_32_2)
	for iter_32_0, iter_32_1 in pairs(arg_32_1.materialList) do
		if iter_32_1.type == arg_32_2 then
			return iter_32_1
		end
	end

	return nil
end

function var_0_0.refresh(arg_33_0, arg_33_1)
	local function var_33_0(arg_34_0)
		arg_33_0:updatePanel(arg_34_0.action.data)

		if arg_33_1 then
			arg_33_1()
		end
	end

	cmgr.sendRequest(var_33_0, actions.getCastingInfo, arg_33_0.vId)
end

function var_0_0.onEnter(arg_35_0)
	arg_35_0:refresh()

	local function var_35_0(...)
		messageBox.showChargeWin(language.get(190080), language.get(213273, arg_35_0.info.goldOutput or 0), "ycbwGoldOutput", function(...)
			cmgr.sendRequest(function()
				arg_35_0.view.widgets.fireAni:stopAllActions()
				arg_35_0.view.widgets.fireAni:setVisible(false)

				local var_38_0 = CCArray:create()

				for iter_38_0 = 1, 12 do
					local var_38_1 = CCSprite:createWithSpriteFrameName(string.format("castingfire%02d.png", iter_38_0))

					var_38_0:addObject(var_38_1:displayFrame())
				end

				local function var_38_2(...)
					if arg_35_0.view.widgets.fireAni and not tolua.isnull(arg_35_0.view.widgets.fireAni) then
						arg_35_0.view.widgets.fireAni:stopAllActions()
						arg_35_0.view.widgets.fireAni:setVisible(false)
						arg_35_0:refresh()
					end
				end

				local var_38_3 = CCAnimation:createWithSpriteFrames(var_38_0, 0.08)
				local var_38_4 = CCAnimate:create(var_38_3)
				local var_38_5 = CCCallFunc:create(var_38_2)
				local var_38_6 = CCSequence:createWithTwoActions(var_38_4, var_38_5)

				arg_35_0.view.widgets.fireAni:runAction(var_38_6)
				arg_35_0.view.widgets.fireAni:setVisible(true)

				local var_38_7 = CCSprite:create("res/ui/weapon/casting/tips/zz_word_clts.png")

				var_38_7:setPosition(ccp(visibleSize.width * 0.5 - 10, visibleSize.height * 0.5 - 110))
				smgr.showTipSpriteText(var_38_7, var_38_2, 0.1)
			end, actions.buyOutPut)
		end)
	end

	local function var_35_1(...)
		messageBox.showChargeWin(language.get(190080), language.get(213274, arg_35_0.info.goldSilverHammer or 0, arg_35_0.info.reduceMinutes or 0), "ycbwGoldReduceCd", function(...)
			cmgr.sendRequest(function()
				arg_35_0.view.widgets.addmaterialAni:stopAllActions()
				arg_35_0.view.widgets.addmaterialAni:setVisible(false)

				local var_42_0 = CCArray:create()

				for iter_42_0 = 1, 27 do
					local var_42_1 = CCSprite:createWithSpriteFrameName(string.format("addmaterial%02d.png", iter_42_0))

					var_42_0:addObject(var_42_1:displayFrame())
				end

				local function var_42_2(...)
					if arg_35_0.view.widgets.addmaterialAni and not tolua.isnull(arg_35_0.view.widgets.addmaterialAni) then
						arg_35_0.view.widgets.addmaterialAni:stopAllActions()
						arg_35_0.view.widgets.addmaterialAni:setVisible(false)
					end
				end

				local var_42_3 = CCAnimation:createWithSpriteFrames(var_42_0, 0.06)
				local var_42_4 = CCAnimate:create(var_42_3)
				local var_42_5 = CCCallFunc:create(var_42_2)
				local var_42_6 = CCSequence:createWithTwoActions(var_42_4, var_42_5)

				arg_35_0.view.widgets.addmaterialAni:runAction(var_42_6)
				arg_35_0.view.widgets.addmaterialAni:setVisible(true)

				local var_42_7 = CCSprite:create("res/ui/weapon/casting/tips/zz_word_dzjs.png")

				var_42_7:setPosition(ccp(visibleSize.width * 0.5 + 130, visibleSize.height * 0.5 - 110))
				smgr.showTipSpriteText(var_42_7, var_42_2, 0.1)
				arg_35_0:refresh()
			end, actions.reduceCd)
		end)
	end

	local function var_35_2(...)
		messageBox.showChargeWin(language.get(190080), language.get(213299, arg_35_0.info.goldBuyProb or 0), "ycbwGoldBuyProb", function(...)
			cmgr.sendRequest(function()
				arg_35_0.view.widgets.proAni:stopAllActions()
				arg_35_0.view.widgets.proAni:setVisible(false)

				local var_46_0 = CCArray:create()

				for iter_46_0 = 1, 27 do
					local var_46_1 = CCSprite:createWithSpriteFrameName(string.format("addmaterial%02d.png", iter_46_0))

					var_46_0:addObject(var_46_1:displayFrame())
				end

				local function var_46_2(...)
					if arg_35_0.view.widgets.proAni and not tolua.isnull(arg_35_0.view.widgets.proAni) then
						arg_35_0.view.widgets.proAni:stopAllActions()
						arg_35_0.view.widgets.proAni:setVisible(false)
					end
				end

				local var_46_3 = CCAnimation:createWithSpriteFrames(var_46_0, 0.03)
				local var_46_4 = CCAnimate:create(var_46_3)
				local var_46_5 = CCCallFunc:create(var_46_2)
				local var_46_6 = CCSequence:createWithTwoActions(var_46_4, var_46_5)

				arg_35_0.view.widgets.proAni:runAction(var_46_6)
				arg_35_0.view.widgets.proAni:setVisible(true)
				arg_35_0:refresh()
			end, actions.buyProb)
		end)
	end

	local function var_35_3(...)
		if arg_35_0.materialOk or arg_35_0.info.stageType == 3 or arg_35_0.info.finished then
			arg_35_0.view.widgets.doBtn:setVisible(false)
		end

		if arg_35_0.info.finished then
			local function var_48_0(arg_49_0)
				local var_49_0 = arg_49_0.action.data

				print("@@@@@@@@@globalAction_gotResource@@@@@@@@@")
				showTable(arg_49_0)
				print("@@@@@@@@@globalAction_gotResource@@@@@@@@@")

				if var_49_0.rewards then
					local var_49_1 = {}

					for iter_49_0, iter_49_1 in pairs(var_49_0.rewards) do
						if iter_49_1 then
							local var_49_2 = {}

							if iter_49_1.type == 5 then
								iter_49_1.type = 6
							end

							var_49_2.id = iter_49_1.type
							var_49_2.value = iter_49_1.num

							table.insert(var_49_1, var_49_2)
						end
					end

					globalAction_gotResource(var_49_1)
				end

				if var_49_0.type then
					local var_49_3 = {}
					local var_49_4 = {
						id = var_49_0.type,
						value = var_49_0.num
					}

					table.insert(var_49_3, var_49_4)
					globalAction_gotResource(var_49_3)
				end

				if var_49_0.outputPic then
					local var_49_5 = {}
					local var_49_6 = {
						id = var_49_0.outputPic,
						value = var_49_0.outputNum or 1
					}

					table.insert(var_49_5, var_49_6)
					globalAction_gotResource(var_49_5)
				end

				if arg_35_0.info.stageType == 3 then
					local function var_49_7(...)
						arg_35_0:refresh()
					end

					local var_49_8 = CCSprite:create("res/ui/weapon/casting/tips/zz_word_bwcl.png")

					var_49_8:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
					smgr.showTipSpriteText(var_49_8, var_49_7, 0.1)
				else
					arg_35_0.view.widgets.fireAni:stopAllActions()
					arg_35_0.view.widgets.fireAni:setVisible(false)

					local var_49_9 = CCArray:create()

					for iter_49_2 = 1, 12 do
						local var_49_10 = CCSprite:createWithSpriteFrameName(string.format("castingfire%02d.png", iter_49_2))

						var_49_9:addObject(var_49_10:displayFrame())
					end

					local function var_49_11(...)
						if arg_35_0.view.widgets.fireAni and not tolua.isnull(arg_35_0.view.widgets.fireAni) then
							arg_35_0.view.widgets.fireAni:stopAllActions()
							arg_35_0.view.widgets.fireAni:setVisible(false)
						end
					end

					local var_49_12 = CCAnimation:createWithSpriteFrames(var_49_9, 0.06)
					local var_49_13 = CCAnimate:create(var_49_12)
					local var_49_14 = CCCallFunc:create(var_49_11)
					local var_49_15 = CCSequence:createWithTwoActions(var_49_13, var_49_14)

					arg_35_0.view.widgets.fireAni:runAction(var_49_15)
					arg_35_0.view.widgets.fireAni:setVisible(true)
					arg_35_0:refresh()
				end
			end

			cmgr.sendRequest(var_48_0, actions.finishMake)
		else
			if arg_35_0.info.stageType == 1 then
				arg_35_0.isUpdateTalk = false
			end

			local function var_48_1(arg_52_0)
				local var_52_0 = 0
				local var_52_1 = arg_35_0.info.stageType == 4 and 6 or 2

				local function var_52_2(...)
					return
				end

				local var_52_3 = CCSprite:create("res/ui/weapon/casting/tips/" .. var_52_1 .. ".png")

				var_52_3:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
				smgr.showTipSpriteText(var_52_3, var_52_2, 0.1)
				arg_35_0:refresh()
			end

			cmgr.sendRequest(var_48_1, actions.startMake)
		end
	end

	local function var_35_4(...)
		local function var_54_0(arg_55_0)
			local var_55_0 = 0
			local var_55_1 = arg_35_0.info.stageType == 4 and 6 or 2

			local function var_55_2(...)
				return
			end

			local var_55_3 = CCSprite:create("res/ui/weapon/casting/tips/" .. var_55_1 .. ".png")

			var_55_3:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
			smgr.showTipSpriteText(var_55_3, var_55_2, 0.1)
			arg_35_0:refresh()
		end

		cmgr.sendRequest(var_54_0, actions.fillPrimer)
	end

	local function var_35_5(...)
		arg_35_0:showTips(false)

		if arg_35_0.info.canBuyMaterial then
			arg_35_0.view.widgets.buyC:setVisible(true)
		else
			arg_35_0.view.widgets.buyC:setVisible(false)
			smgr.showTipTextGreen(language.get(213302))
		end
	end

	local function var_35_6(...)
		if arg_35_0.info.canBuyMaterial then
			arg_35_0.view.widgets.buyC:setVisible(true)
		else
			arg_35_0.view.widgets.buyC:setVisible(false)
		end

		messageBox.showChargeWin(language.get(190080), language.get(213272, arg_35_0.info.goldBuyMaterial or 0, 1), "ycbwGoldBuyMaterial", function(...)
			cmgr.sendRequest(function(arg_60_0)
				local var_60_0 = arg_60_0.action.data

				print("@@@@@@@@@globalAction_gotResource@@@@@@@@@")
				showTable(arg_60_0)
				print("@@@@@@@@@globalAction_gotResource@@@@@@@@@")

				if var_60_0.type then
					local var_60_1 = {}
					local var_60_2 = {
						id = var_60_0.type,
						value = var_60_0.num
					}

					table.insert(var_60_1, var_60_2)
					globalAction_gotResource(var_60_1)
				end

				if var_60_0.outputPic then
					local var_60_3 = CCSprite:createWithSpriteFrameName(var_60_0.outputPic .. ".jpg")

					var_60_3:setPosition(ccp(visibleSize.width * 0.5 - 10, visibleSize.height * 0.5))
					smgr.showTipSpriteText(var_60_3, callback, 0.1)
				end

				arg_35_0.isUpdateTalk = false
				arg_35_0.info.hasBuyMaterial = true

				arg_35_0:refresh()
			end, actions.buyMaterial, 1)
		end)
	end

	local function var_35_7(...)
		if arg_35_0.info.canBuyMaterial then
			arg_35_0.view.widgets.buyC:setVisible(true)
		else
			arg_35_0.view.widgets.buyC:setVisible(false)
		end

		local var_61_0 = 0

		if arg_35_0.info.goldBuyMaterial then
			var_61_0 = arg_35_0.info.goldBuyMaterial * 10
		end

		messageBox.showChargeWin(language.get(190080), language.get(213272, var_61_0, 10), "ycbwGoldBuyMaterial", function(...)
			cmgr.sendRequest(function(arg_63_0)
				local var_63_0 = arg_63_0.action.data

				print("@@@@@@@@@globalAction_gotResource@@@@@@@@@")
				showTable(arg_63_0)
				print("@@@@@@@@@globalAction_gotResource@@@@@@@@@")

				if var_63_0.type then
					local var_63_1 = {}
					local var_63_2 = {
						id = var_63_0.type,
						value = var_63_0.num
					}

					table.insert(var_63_1, var_63_2)
					globalAction_gotResource(var_63_1)
				end

				if var_63_0.outputPic then
					local var_63_3 = CCSprite:createWithSpriteFrameName(var_63_0.outputPic .. ".jpg")

					var_63_3:setPosition(ccp(visibleSize.width * 0.5 - 10, visibleSize.height * 0.5))
					smgr.showTipSpriteText(var_63_3, callback, 0.1)
				end

				arg_35_0.isUpdateTalk = false
				arg_35_0.info.hasBuyMaterial = true

				arg_35_0:refresh()
			end, actions.buyMaterial, 10)
		end)
	end

	local function var_35_8(...)
		arg_35_0:showTips(true, "minItem", arg_35_0.minItemTips)
	end

	local function var_35_9(...)
		arg_35_0:showTips(false)
	end

	local function var_35_10(...)
		arg_35_0:showTips(true, "minMaterialSp1", arg_35_0.minMaterialTips1)
	end

	local function var_35_11(...)
		arg_35_0:showTips(true, "minMaterialSp2", arg_35_0.minMaterialTips2)
	end

	local function var_35_12(...)
		arg_35_0:showTips(true, "minMaterialSp3", arg_35_0.minMaterialTips3)
	end

	local function var_35_13(...)
		if arg_35_0.mainMaterialTips1 then
			arg_35_0:showTips(true, "mainMaterialBtn1", arg_35_0.mainMaterialTips1)
		end
	end

	local function var_35_14(...)
		if var_0_0.mainMaterialTips2 then
			arg_35_0:showTips(true, "mainMaterialBtn2", var_0_0.mainMaterialTips2)
		end
	end

	local function var_35_15(...)
		if var_0_0.mainMaterialTips3 then
			arg_35_0:showTips(true, "mainMaterialBtn3", var_0_0.mainMaterialTips3)
		end
	end

	local function var_35_16(...)
		arg_35_0:showTips(true, "buyBtn", language.get(213301), ccp(295, 0))
	end

	local function var_35_17(...)
		arg_35_0:showTips(false)
	end

	local function var_35_18(...)
		messageBox.showChargeWin(language.get(190080), language.get(213319, arg_35_0.eventGoldReduceCd or 300), "goldReduceCoal", function(...)
			cmgr.sendRequest(function()
				arg_35_0.view.widgets.addmaterialAni:stopAllActions()
				arg_35_0.view.widgets.addmaterialAni:setVisible(false)

				local var_76_0 = CCArray:create()

				for iter_76_0 = 1, 27 do
					local var_76_1 = CCSprite:createWithSpriteFrameName(string.format("addmaterial%02d.png", iter_76_0))

					var_76_0:addObject(var_76_1:displayFrame())
				end

				local function var_76_2(...)
					if arg_35_0.view.widgets.addmaterialAni and not tolua.isnull(arg_35_0.view.widgets.addmaterialAni) then
						arg_35_0.view.widgets.addmaterialAni:stopAllActions()
						arg_35_0.view.widgets.addmaterialAni:setVisible(false)
					end
				end

				local var_76_3 = CCAnimation:createWithSpriteFrames(var_76_0, 0.06)
				local var_76_4 = CCAnimate:create(var_76_3)
				local var_76_5 = CCCallFunc:create(var_76_2)
				local var_76_6 = CCSequence:createWithTwoActions(var_76_4, var_76_5)

				arg_35_0.view.widgets.addmaterialAni:runAction(var_76_6)
				arg_35_0.view.widgets.addmaterialAni:setVisible(true)

				local var_76_7 = CCSprite:create("res/ui/weapon/casting/tips/zz_word_dzjs.png")

				var_76_7:setPosition(ccp(visibleSize.width * 0.5 + 130, visibleSize.height * 0.5 - 110))
				smgr.showTipSpriteText(var_76_7, var_76_2, 0.1)
				arg_35_0:refresh()
			end, actions.reduceCd)
		end)
	end

	local function var_35_19()
		if arg_35_0.nowShowIndex and arg_35_0.nowShowIndex > 1 and arg_35_0.info and arg_35_0.info.stoveList then
			arg_35_0.vId = arg_35_0.info.stoveList[1].vId

			function callBack()
				arg_35_0.view.widgets.castNumLb:setString(language.get(215621))
			end

			arg_35_0:refresh(callBack)
		end
	end

	local function var_35_20()
		if arg_35_0.nowShowIndex and arg_35_0.nowShowIndex < 2 and arg_35_0.info and arg_35_0.info.stoveList then
			arg_35_0.vId = arg_35_0.info.stoveList[2].vId

			function callBack()
				arg_35_0.view.widgets.castNumLb:setString(language.get(215622))
			end

			arg_35_0:refresh(callBack)
		end
	end

	arg_35_0.view.widgets.prevBtn:addHandleOfControlEvent(var_35_19, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.nextBtn:addHandleOfControlEvent(var_35_20, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.buyBLBtn:addHandleOfControlEvent(var_35_18, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.buyProbBtn:addHandleOfControlEvent(var_35_0, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.buyCdBtn:addHandleOfControlEvent(var_35_1, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.buyProbBtn3:addHandleOfControlEvent(var_35_2, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.doBtn:addHandleOfControlEvent(var_35_3, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.guidBtn:addHandleOfControlEvent(var_35_4, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.buyBtn:addHandleOfControlEvent(var_35_16, CCControlEventTouchDown)
	arg_35_0.view.widgets.buyBtn:addHandleOfControlEvent(var_35_5, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.buyBtn:addHandleOfControlEvent(var_35_17, CCControlEventTouchUpOutside)
	arg_35_0.view.widgets.buyOneBtn:addHandleOfControlEvent(var_35_6, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.buyMoreBtn:addHandleOfControlEvent(var_35_7, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.minItem:addHandleOfControlEvent(var_35_8, CCControlEventTouchDown)
	arg_35_0.view.widgets.minItem:addHandleOfControlEvent(var_35_9, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.minItem:addHandleOfControlEvent(var_35_9, CCControlEventTouchUpOutside)
	arg_35_0.view.widgets.minMaterialSp1:addHandleOfControlEvent(var_35_10, CCControlEventTouchDown)
	arg_35_0.view.widgets.minMaterialSp1:addHandleOfControlEvent(var_35_9, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.minMaterialSp1:addHandleOfControlEvent(var_35_9, CCControlEventTouchUpOutside)
	arg_35_0.view.widgets.minMaterialSp2:addHandleOfControlEvent(var_35_11, CCControlEventTouchDown)
	arg_35_0.view.widgets.minMaterialSp2:addHandleOfControlEvent(var_35_9, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.minMaterialSp2:addHandleOfControlEvent(var_35_9, CCControlEventTouchUpOutside)
	arg_35_0.view.widgets.minMaterialSp3:addHandleOfControlEvent(var_35_12, CCControlEventTouchDown)
	arg_35_0.view.widgets.minMaterialSp3:addHandleOfControlEvent(var_35_9, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.minMaterialSp3:addHandleOfControlEvent(var_35_9, CCControlEventTouchUpOutside)
	arg_35_0.view.widgets.mainMaterialBtn1:addHandleOfControlEvent(var_35_13, CCControlEventTouchDown)
	arg_35_0.view.widgets.mainMaterialBtn1:addHandleOfControlEvent(var_35_9, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.mainMaterialBtn1:addHandleOfControlEvent(var_35_9, CCControlEventTouchUpOutside)
	arg_35_0.view.widgets.mainMaterialBtn2:addHandleOfControlEvent(var_35_14, CCControlEventTouchDown)
	arg_35_0.view.widgets.mainMaterialBtn2:addHandleOfControlEvent(var_35_9, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.mainMaterialBtn2:addHandleOfControlEvent(var_35_9, CCControlEventTouchUpOutside)
	arg_35_0.view.widgets.mainMaterialBtn3:addHandleOfControlEvent(var_35_15, CCControlEventTouchDown)
	arg_35_0.view.widgets.mainMaterialBtn3:addHandleOfControlEvent(var_35_9, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.mainMaterialBtn3:addHandleOfControlEvent(var_35_9, CCControlEventTouchUpOutside)
	arg_35_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		arg_35_0:showHelpTip(true, "btn_tip", language.get(213307), ccp(0, -250))
	end, CCControlEventTouchUpInside)

	arg_35_0.isUpdateTalk = true
	arg_35_0.materialOk = false
	arg_35_0.materialOkTalk = false

	eventManager.unregisterEvent("ycbwMaterialReady", var_0_0.ycbwMaterialReady)
end

function var_0_0.showTips(arg_83_0, arg_83_1, arg_83_2, arg_83_3, arg_83_4)
	if arg_83_0.view and arg_83_0.view.widgets.tipFrame then
		arg_83_0.view.widgets.tipFrame:removeFromParentAndCleanup(true)

		arg_83_0.view.widgets.tipFrame = nil
	end

	if arg_83_1 then
		local var_83_0 = 0
		local var_83_1 = 0

		if arg_83_0.view == nil then
			arg_83_0.view = {}
		end

		uiutil.initWidgets(arg_83_0.view, var_0_2)
		arg_83_0.view.widgets.tipFrame:setAnchorPoint(ccp(1, 0))
		arg_83_0:addChild(arg_83_0.view.widgets.tipFrame)

		local var_83_2, var_83_3 = tool.getPositionInScreen(arg_83_0.view.widgets[arg_83_2])
		local var_83_4 = var_83_2 + 20
		local var_83_5 = var_83_3 + 20

		if arg_83_4 then
			var_83_4 = var_83_4 + arg_83_4.x
			var_83_5 = var_83_5 + arg_83_4.y
		end

		arg_83_0.view.widgets.tipMsg:setString(arg_83_3)

		local var_83_6 = arg_83_0.view.widgets.tipMsg:getContentSize().width
		local var_83_7 = arg_83_0.view.widgets.tipMsg:getContentSize().height

		arg_83_0.view.widgets.tipFrame:setPreferredSize(CCSizeMake(var_83_6 + 30, var_83_7 + 30))
		arg_83_0.view.widgets.tipFrame:setPosition(ccp(var_83_4, var_83_5))
		arg_83_0.view.widgets.tipMsg:setPosition(ccp(15, 15))
		arg_83_0.view.widgets.tipFrame:setVisible(true)
	end
end

function var_0_0.showHelpTip(arg_84_0, arg_84_1, arg_84_2, arg_84_3, arg_84_4)
	log.info("should show tips ")

	local var_84_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_84_0:registerScriptTouchHandler(function(arg_85_0, arg_85_1, arg_85_2)
		if arg_85_0 == CCTOUCHBEGAN then
			return true
		elseif arg_85_0 == CCTOUCHMOVED then
			return true
		elseif arg_85_0 == CCTOUCHENDED then
			pcall(var_84_0.removeFromParentAndCleanup, var_84_0, true)

			arg_84_0.view.widgets.tipFrame = nil

			return true
		end
	end, false, true)
	var_84_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_84_0, 60000)

	if arg_84_1 then
		local var_84_1 = 0
		local var_84_2 = 0

		if arg_84_0.view == nil then
			arg_84_0.view = {}
		end

		uiutil.initWidgets(arg_84_0.view, var_0_2)
		arg_84_0.view.widgets.tipFrame:setAnchorPoint(ccp(1, 0))
		var_84_0:addChild(arg_84_0.view.widgets.tipFrame)

		local var_84_3, var_84_4 = tool.getPositionInScreen(arg_84_0.view.widgets[arg_84_2])
		local var_84_5 = var_84_3 + 20
		local var_84_6 = var_84_4 + 20

		if arg_84_4 then
			var_84_5 = var_84_5 + arg_84_4.x
			var_84_6 = var_84_6 + arg_84_4.y
		end

		arg_84_0.view.widgets.tipMsg:setString(arg_84_3)

		local var_84_7 = arg_84_0.view.widgets.tipMsg:getContentSize().width
		local var_84_8 = arg_84_0.view.widgets.tipMsg:getContentSize().height

		arg_84_0.view.widgets.tipFrame:setPreferredSize(CCSizeMake(var_84_7 + 30, var_84_8 + 30))
		arg_84_0.view.widgets.tipFrame:setPosition(ccp(var_84_5, var_84_6))
		arg_84_0.view.widgets.tipMsg:setPosition(ccp(15, 15))
		arg_84_0.view.widgets.tipFrame:setVisible(true)
	end
end

function var_0_0.ycbwMaterialReady()
	self.materialOkTalk = true
end

function var_0_0.onExit(arg_87_0)
	eventManager.unregisterEvent("ycbwMaterialReady", var_0_0.ycbwMaterialReady)
end

return var_0_0
