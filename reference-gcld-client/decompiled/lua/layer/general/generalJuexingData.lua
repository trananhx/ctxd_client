return {
	y = 285,
	name = "generalJuexing",
	visible = false,
	type = "node",
	x = 260,
	children = {
		{
			scale = 0.8,
			name = "JuexingTaozhuang",
			h = 102,
			type = "button",
			w = 102,
			y = 127,
			x = 82,
			normal = {
				frame = true,
				path = "general_now_list_bg.jpg"
			},
			touched = {
				frame = true,
				path = "general_now_list_bg_on.jpg"
			},
			anchorPoint = ccp(0.5, 0.5),
			children = {
				{
					y = 51,
					x = 51,
					type = "sprite",
					zorder = 1,
					pic = {
						frame = true,
						path = "general_equipType1.png"
					}
				}
			}
		},
		{
			scale = 0.8,
			name = "JuexingBaowu",
			h = 102,
			type = "button",
			w = 102,
			y = 127,
			x = 165,
			normal = {
				frame = true,
				path = "general_now_list_bg.jpg"
			},
			touched = {
				frame = true,
				path = "general_now_list_bg_on.jpg"
			},
			anchorPoint = ccp(0.5, 0.5),
			children = {
				{
					y = 51,
					x = 51,
					type = "sprite",
					zorder = 1,
					pic = {
						frame = true,
						path = "general_treasureBackground.png"
					}
				}
			}
		},
		{
			visible = false,
			name = "yuciSp",
			x = 124,
			type = "sprite",
			y = 38,
			pic = {
				frame = false,
				path = "res/ui/general/yuci/ycbw_icon_bg.png"
			},
			children = {
				{
					scale = 0.8,
					name = "yuciBaowu1",
					h = 102,
					type = "button",
					w = 102,
					y = 45,
					x = 45,
					normal = {
						frame = true,
						path = "general_now_list_bg.jpg"
					},
					touched = {
						frame = true,
						path = "general_now_list_bg_on.jpg"
					},
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							y = 51,
							x = 51,
							type = "sprite",
							zorder = 1,
							pic = {
								frame = true,
								path = "general_treasureBackground.png"
							}
						}
					}
				},
				{
					scale = 0.8,
					name = "yuciBaowu2",
					h = 102,
					type = "button",
					w = 102,
					y = 45,
					x = 125,
					normal = {
						frame = true,
						path = "general_now_list_bg.jpg"
					},
					touched = {
						frame = true,
						path = "general_now_list_bg_on.jpg"
					},
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							y = 51,
							x = 51,
							type = "sprite",
							zorder = 1,
							pic = {
								frame = true,
								path = "general_treasureBackground.png"
							}
						}
					}
				},
				{
					x = 86,
					y = 90,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/general/yuci/ycbw_word_ycbw.png"
					}
				}
			}
		},
		{
			x = 1,
			name = "evokeSp",
			y = 3,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/default.png"
			},
			children = {
				{
					x = 124,
					y = -44,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/general/juexing/wjjx_bg.png"
					}
				},
				{
					scale = 0.8,
					name = "JuexingXiaojineng1",
					h = 90,
					type = "button",
					w = 90,
					y = 39,
					x = 87,
					normal = {
						frame = false,
						path = "res/ui/general/juexing/wjjx_icon_bg.png"
					},
					touched = {
						frame = false,
						path = "res/ui/general/juexing/wjjx_icon_bg.png"
					},
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							x = 45,
							name = "JuexingPic1",
							y = 45,
							type = "sprite",
							zorder = 1,
							pic = {
								frame = false,
								path = "res/ui/general/juexing/zhashujiaqiang.png"
							},
							children = {
								{
									text = "Lv 0",
									name = "JuexingLevel1",
									y = 10,
									type = "label",
									fontSize = 20,
									x = 36,
									color = ccc3(255, 255, 255)
								}
							}
						}
					}
				},
				{
					scale = 0.8,
					name = "JuexingXiaojineng2",
					h = 90,
					type = "button",
					w = 90,
					y = 39,
					x = 160,
					normal = {
						frame = false,
						path = "res/ui/general/juexing/wjjx_icon_bg.png"
					},
					touched = {
						frame = false,
						path = "res/ui/general/juexing/wjjx_icon_bg.png"
					},
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							x = 45,
							name = "JuexingPic2",
							y = 45,
							type = "sprite",
							zorder = 1,
							pic = {
								frame = false,
								path = "res/ui/general/juexing/juexingxueliang.png"
							},
							children = {
								{
									text = "Lv 0",
									name = "JuexingLevel2",
									y = 10,
									type = "label",
									fontSize = 20,
									x = 36,
									color = ccc3(255, 255, 255)
								}
							}
						}
					}
				},
				{
					scale = 0.8,
					name = "JuexingXiaojineng3",
					h = 90,
					type = "button",
					w = 90,
					y = -34,
					x = 87,
					normal = {
						frame = false,
						path = "res/ui/general/juexing/wjjx_icon_bg.png"
					},
					touched = {
						frame = false,
						path = "res/ui/general/juexing/wjjx_icon_bg.png"
					},
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							x = 45,
							name = "JuexingPic3",
							y = 45,
							type = "sprite",
							zorder = 1,
							pic = {
								frame = false,
								path = "res/ui/general/juexing/bubingkezhi.png"
							},
							children = {
								{
									text = "Lv 0",
									name = "JuexingLevel3",
									y = 10,
									type = "label",
									fontSize = 20,
									x = 36,
									color = ccc3(255, 255, 255)
								}
							}
						}
					}
				},
				{
					scale = 0.8,
					name = "JuexingXiaojineng4",
					h = 90,
					type = "button",
					w = 90,
					y = -34,
					x = 160,
					normal = {
						frame = false,
						path = "res/ui/general/juexing/wjjx_icon_bg.png"
					},
					touched = {
						frame = false,
						path = "res/ui/general/juexing/wjjx_icon_bg.png"
					},
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							x = 45,
							name = "JuexingPic4",
							y = 45,
							type = "sprite",
							zorder = 1,
							pic = {
								frame = false,
								path = "res/ui/general/juexing/tongshuaili.png"
							},
							children = {
								{
									text = "Lv 0",
									name = "JuexingLevel4",
									y = 10,
									type = "label",
									fontSize = 20,
									x = 36,
									color = ccc3(255, 255, 255)
								}
							}
						}
					}
				},
				{
					name = "generalEquipJunxingDajineng",
					h = 82,
					type = "button",
					w = 82,
					y = -124,
					x = 124,
					normal = {
						frame = false,
						path = "res/ui/general/juexing/wjjx_icon_bg.png"
					},
					touched = {
						frame = false,
						path = "res/ui/general/juexing/wjjx_icon_bg.png"
					},
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							x = 41,
							name = "JuexingPic5",
							y = 41,
							type = "sprite",
							zorder = 1,
							pic = {
								frame = false,
								path = "res/ui/general/juexing/dajuexing.png"
							}
						}
					}
				}
			}
		},
		{
			x = 0,
			name = "jiexingMianban",
			y = -176,
			type = "sprite",
			visible = false,
			pic = {
				frame = false,
				path = "res/ui/general/juexing/wjjx_bg2.png"
			},
			children = {
				{
					w = 460,
					h = 197,
					type = "button",
					zorder = -1,
					y = 0,
					x = 0,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					anchorPoint = ccp(0, 0)
				},
				{
					name = "dianjijuexing",
					h = 52,
					type = "button",
					w = 169,
					y = 50,
					x = 230,
					normal = {
						frame = false,
						path = "res/ui/general/juexing/wjjx_btn_jx.png"
					},
					touched = {
						frame = false,
						path = "res/ui/general/juexing/wjjx_btn_jx_c.png"
					},
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					name = "JueXingTipsBtn",
					h = 42,
					type = "button",
					w = 42,
					y = 100,
					x = 70,
					normal = {
						frame = true,
						path = "btnTip_a.png"
					},
					touched = {
						frame = true,
						path = "btnTip_c.png"
					},
					visible = (function()
						if conf.language == "vie" then
							return true
						else
							return false
						end
					end)()
				},
				{
					fontSize = 18,
					height = 0,
					name = "juexingInfo",
					type = "label",
					width = 100,
					y = 100,
					x = 70,
					text = language.get(490724),
					anchorPoint = ccp(0.5, 0.5),
					color = ccc3(217, 234, 196),
					halign = kCCTextAlignmentLeft,
					visible = (function()
						if conf.language == "vie" then
							return false
						else
							return true
						end
					end)()
				},
				{
					name = "JunxingDajinengTips",
					h = 82,
					type = "button",
					w = 82,
					y = 135,
					x = 230,
					normal = {
						frame = false,
						path = "res/ui/general/juexing/wjjx_icon_bg.png"
					},
					touched = {
						frame = false,
						path = "res/ui/general/juexing/wjjx_icon_bg.png"
					},
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							x = 41,
							name = "DajuexingTips",
							y = 41,
							type = "sprite",
							zorder = 1,
							pic = {
								frame = false,
								path = "res/ui/general/juexing/dajuexing.png"
							}
						}
					}
				},
				{
					name = "baoshigou",
					h = 39,
					type = "button",
					w = 39,
					y = 50,
					x = 390,
					normal = {
						frame = true,
						path = "btn_check_1_a.png"
					},
					touched = {
						frame = true,
						path = "btn_check_1_a.png"
					},
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							x = 19,
							name = "baoshigouOn",
							y = 19,
							type = "sprite",
							zorder = 1,
							pic = {
								frame = true,
								path = "btn_check_1_on.png"
							}
						}
					}
				},
				{
					x = 335,
					name = "baoshiPic",
					y = 50,
					type = "sprite",
					zorder = 1,
					pic = {
						frame = true,
						path = "res_icon_7.png"
					},
					children = {
						{
							text = "100",
							name = "baoshigouValue",
							y = 10,
							type = "label",
							style = "label_yellowish_24",
							x = 28,
							anchorPoint = ccp(0.5, 0.5)
						}
					}
				},
				{
					visible = false,
					name = "jingbigou",
					h = 39,
					type = "button",
					w = 39,
					y = 150,
					x = 390,
					normal = {
						frame = true,
						path = "btn_check_1_a.png"
					},
					touched = {
						frame = true,
						path = "btn_check_1_a.png"
					},
					anchorPoint = ccp(0.5, 0.5),
					children = {
						{
							x = 19,
							name = "jingbigouOn",
							y = 19,
							type = "sprite",
							zorder = 1,
							pic = {
								frame = true,
								path = "btn_check_1_on.png"
							}
						}
					}
				},
				{
					x = 335,
					name = "jingbiPic",
					y = 150,
					type = "sprite",
					visible = false,
					zorder = 1,
					pic = {
						frame = true,
						path = "res_icon_19.png"
					},
					children = {
						{
							text = "100",
							name = "jingbigouValue",
							y = 10,
							type = "label",
							style = "label_yellowish_24",
							x = 28,
							anchorPoint = ccp(0.5, 0.5)
						}
					}
				}
			}
		}
	}
}
