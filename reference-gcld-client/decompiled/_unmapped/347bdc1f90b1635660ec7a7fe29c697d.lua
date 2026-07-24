local var_0_0 = {}

function getFarmAreaData()
	return var_0_0
end

local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.farmLevelX = 140
else
	var_0_1.farmLevelX = 0
end

var_0_0.farmBackground = {
	name = "farmBackground",
	type = "pic",
	pic = "res/ui/farm/farm_background.jpg",
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5
}
var_0_0.farmTitleAtlas = {
	name = "farmTitlePic",
	type = "pic",
	z = 200,
	pic = "res/ui/farm/farm_title_pic.png",
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.9,
	children = {
		{
			width = 25,
			height = 32,
			name = "farmTitleAtlas",
			type = "atlas",
			pic = "res/ui/farm/farm_title_numbers.png",
			text = "0",
			y = 20,
			startChar = 48,
			x = 195 + var_0_1.farmLevelX
		}
	}
}
var_0_0.remianToken = {
	z = 200,
	type = "pic",
	pic = "frame:res_icon_1701.png",
	x = visibleSize.width * 0.9 - 40,
	y = visibleSize.height * 0.9,
	children = {
		{
			text = "×",
			name = "remainTokenLabel",
			fontSize = 30,
			type = "label",
			ycenter = 0,
			x = 100,
			align = kCCTextAlignmentLeft
		}
	}
}

function getFarmButtonLayout(...)
	return {
		y = 20,
		name = "root",
		type = "node",
		x = visibleSize.width,
		children = {
			{
				w = 143,
				name = "back",
				h = 61,
				type = "button",
				y = 32.8572,
				x = -99.8848,
				normal = {
					path = "res/ui/farm/btn_back_a.png"
				},
				touched = {
					path = "res/ui/farm/btn_back_c.png"
				}
			},
			{
				name = "zhengchanglianbing",
				h = 61,
				type = "button",
				w = 197,
				y = 192.8573,
				x = -99.8851,
				normal = {
					path = "res/ui/farm/btn_zclb_a.png"
				},
				touched = {
					path = "res/ui/farm/btn_zclb_c.png"
				},
				children = {
					{
						fontSize = 22,
						name = "zclb",
						y = 60,
						type = "label",
						text = "x0",
						style = "label_white_20",
						x = 178,
						anchorPoint = ccp(1, 0.5),
						halign = kCCTextAlignmentLeft,
						valign = kCCVerticalTextAlignmentBottom
					}
				}
			},
			{
				name = "yezhanchuishi",
				h = 61,
				type = "button",
				w = 197,
				y = 192.8573,
				x = -99.8851,
				normal = {
					path = "res/ui/farm/ttq_btn.png"
				},
				touched = {
					path = "res/ui/farm/ttq_btn_c.png"
				},
				children = {
					{
						y = 32,
						name = "ttq_btn_word_04",
						type = "sprite",
						x = 116.9983,
						pic = {
							path = "res/ui/farm/ttq_btn_word_04.png"
						}
					},
					{
						y = 30.0002,
						name = "ttq_btn_icon_cs",
						type = "sprite",
						x = 35.7143,
						pic = {
							path = "res/ui/farm/ttq_btn_icon_cs.png"
						}
					},
					{
						fontSize = 22,
						name = "yzcs",
						y = 60,
						type = "label",
						text = "x0",
						style = "label_white_20",
						x = 178,
						anchorPoint = ccp(1, 0.5),
						halign = kCCTextAlignmentLeft,
						valign = kCCVerticalTextAlignmentBottom
					}
				}
			},
			{
				w = 197,
				name = "complete",
				h = 61,
				type = "button",
				y = 112.8569,
				x = -99.8851,
				normal = {
					path = "res/ui/farm/btn_ljwc_a.png"
				},
				touched = {
					path = "res/ui/farm/btn_ljwc_c.png"
				}
			},
			{
				name = "jianshaohaoliang",
				h = 61,
				type = "button",
				w = 197,
				y = 432.8572,
				x = -99.8851,
				normal = {
					path = "res/ui/farm/ttq_btn.png"
				},
				touched = {
					path = "res/ui/farm/ttq_btn_c.png"
				},
				children = {
					{
						y = 32,
						name = "Sprite_2",
						type = "sprite",
						x = 117,
						pic = {
							path = "res/ui/farm/ttq_btn_word_01.png"
						}
					},
					{
						y = 29.2855,
						name = "ttq_btn_icon_jh",
						type = "sprite",
						x = 37.1432,
						pic = {
							path = "res/ui/farm/ttq_btn_icon_jh.png"
						}
					},
					{
						fontSize = 22,
						name = "jshl",
						y = 60,
						type = "label",
						text = "x0",
						style = "label_white_20",
						x = 178,
						anchorPoint = ccp(1, 0.5),
						halign = kCCTextAlignmentLeft,
						valign = kCCVerticalTextAlignmentBottom
					}
				}
			},
			{
				name = "fanbeishadi",
				h = 61,
				type = "button",
				w = 197,
				y = 352.8572,
				x = -99.8851,
				normal = {
					path = "res/ui/farm/ttq_btn.png"
				},
				touched = {
					path = "res/ui/farm/ttq_btn_c.png"
				},
				children = {
					{
						y = 32,
						name = "Sprite_3",
						type = "sprite",
						x = 117,
						pic = {
							path = "res/ui/farm/ttq_btn_word_02.png"
						}
					},
					{
						y = 32.143,
						name = "ttq_btn_icon_fb",
						type = "sprite",
						x = 35.7144,
						pic = {
							path = "res/ui/farm/ttq_btn_icon_fb.png"
						}
					},
					{
						fontSize = 22,
						name = "fbsd",
						y = 60,
						type = "label",
						text = "x0",
						style = "label_white_20",
						x = 178,
						anchorPoint = ccp(1, 0.5),
						halign = kCCTextAlignmentLeft,
						valign = kCCVerticalTextAlignmentBottom
					}
				}
			},
			{
				name = "zengqiangzhanli",
				h = 61,
				type = "button",
				w = 197,
				y = 272.8571,
				x = -99.8851,
				normal = {
					path = "res/ui/farm/ttq_btn.png"
				},
				touched = {
					path = "res/ui/farm/ttq_btn_c.png"
				},
				children = {
					{
						y = 32,
						name = "Sprite_5",
						type = "sprite",
						x = 117,
						pic = {
							path = "res/ui/farm/ttq_btn_word_03.png"
						}
					},
					{
						y = 31.429,
						name = "ttq_btn_icon_qz",
						type = "sprite",
						x = 35.7143,
						pic = {
							path = "res/ui/farm/ttq_btn_icon_qz.png"
						}
					},
					{
						fontSize = 22,
						name = "zqzl",
						y = 60,
						type = "label",
						text = "x0",
						style = "label_white_20",
						x = 178,
						anchorPoint = ccp(1, 0.5),
						halign = kCCTextAlignmentLeft,
						valign = kCCVerticalTextAlignmentBottom
					}
				}
			}
		}
	}
end

function geteFarmGeneralMenuLayout()
	return {
		y = 0,
		name = "generalMenuLayout",
		type = "node",
		x = 0,
		children = {
			{
				name = "lianbing",
				h = 61,
				type = "button",
				w = 155,
				y = 94.4278,
				x = 78.88,
				normal = {
					path = "res/ui/farm/btn_a_lb_a.png"
				},
				touched = {
					path = "res/ui/farm/btn_a_lb_c.png"
				},
				children = {
					{
						fontSize = 20,
						name = "lb",
						y = 60,
						type = "label",
						text = "x0",
						style = "label_white_20",
						x = 140.31,
						halign = kCCTextAlignmentLeft,
						valign = kCCVerticalTextAlignmentBottom,
						anchorPoint = ccp(0, 0.5)
					}
				}
			},
			{
				name = "jianhao",
				h = 61,
				type = "button",
				w = 155,
				y = 271.4285,
				x = 78.8815,
				normal = {
					path = "res/ui/farm/ttq_btn_samll.png"
				},
				touched = {
					path = "res/ui/farm/ttq_btn_samll_c.png"
				},
				children = {
					{
						y = 32,
						name = "Sprite_2",
						type = "sprite",
						x = 93.9997,
						pic = {
							path = "res/ui/farm/ttq_btn_samll_word_01.png"
						}
					},
					{
						y = 29.2855,
						name = "ttq_btn_icon_jh",
						type = "sprite",
						x = 37.1432,
						pic = {
							path = "res/ui/farm/ttq_btn_icon_jh.png"
						}
					},
					{
						fontSize = 20,
						name = "jh",
						y = 62.7782,
						type = "label",
						text = "x0",
						style = "label_white_20",
						x = 135.8079,
						halign = kCCTextAlignmentLeft,
						valign = kCCVerticalTextAlignmentBottom,
						anchorPoint = ccp(0, 0.5)
					}
				}
			},
			{
				name = "fanbei",
				h = 61,
				type = "button",
				w = 155,
				y = 212.381,
				x = 78.8815,
				normal = {
					path = "res/ui/farm/ttq_btn_samll.png"
				},
				touched = {
					path = "res/ui/farm/ttq_btn_samll_c.png"
				},
				children = {
					{
						y = 32,
						name = "Sprite_3",
						type = "sprite",
						x = 93.9997,
						pic = {
							path = "res/ui/farm/ttq_btn_samll_word_02.png"
						}
					},
					{
						y = 32.143,
						name = "ttq_btn_icon_fb",
						type = "sprite",
						x = 35.7144,
						pic = {
							path = "res/ui/farm/ttq_btn_icon_fb.png"
						}
					},
					{
						fontSize = 20,
						name = "fb",
						y = 60.5562,
						type = "label",
						text = "x0",
						style = "label_white_20",
						x = 135.8079,
						halign = kCCTextAlignmentLeft,
						valign = kCCVerticalTextAlignmentBottom,
						anchorPoint = ccp(0, 0.5)
					}
				}
			},
			{
				name = "qiangzhan",
				h = 61,
				type = "button",
				w = 155,
				y = 153.3335,
				x = 78.8815,
				normal = {
					path = "res/ui/farm/ttq_btn_samll.png"
				},
				touched = {
					path = "res/ui/farm/ttq_btn_samll_c.png"
				},
				children = {
					{
						y = 32,
						name = "Sprite_5",
						type = "sprite",
						x = 93.9997,
						pic = {
							path = "res/ui/farm/ttq_btn_samll_word_03.png"
						}
					},
					{
						y = 31.429,
						name = "ttq_btn_icon_qz",
						type = "sprite",
						x = 35.7143,
						pic = {
							path = "res/ui/farm/ttq_btn_icon_qz.png"
						}
					},
					{
						fontSize = 20,
						name = "qz",
						y = 58.3334,
						type = "label",
						text = "x0",
						style = "label_white_20",
						x = 140.308,
						halign = kCCTextAlignmentLeft,
						valign = kCCVerticalTextAlignmentBottom,
						anchorPoint = ccp(0, 0.5)
					}
				}
			},
			{
				name = "chuishi",
				h = 61,
				type = "button",
				w = 155,
				y = 94.2858,
				x = 78.8815,
				normal = {
					path = "res/ui/farm/ttq_btn_samll.png"
				},
				touched = {
					path = "res/ui/farm/ttq_btn_samll_c.png"
				},
				children = {
					{
						y = 33.25,
						name = "ttq_btn_word_04",
						type = "sprite",
						x = 98.2483,
						pic = {
							path = "res/ui/farm/ttq_btn_samll_word_04.png"
						}
					},
					{
						y = 30.0002,
						name = "ttq_btn_icon_cs",
						type = "sprite",
						x = 35.7143,
						pic = {
							path = "res/ui/farm/ttq_btn_icon_cs.png"
						}
					},
					{
						fontSize = 20,
						name = "cs",
						y = 60.0001,
						type = "label",
						text = "x0",
						style = "label_white_20",
						x = 140.3088,
						halign = kCCTextAlignmentLeft,
						valign = kCCVerticalTextAlignmentBottom,
						anchorPoint = ccp(0, 0.5)
					}
				}
			},
			{
				w = 155,
				name = "complete1",
				h = 61,
				type = "button",
				y = 31.4276,
				x = 80.8833,
				normal = {
					path = "res/ui/farm/btn_a_wc_a.png"
				},
				touched = {
					path = "res/ui/farm/btn_a_wc_c.png"
				}
			}
		}
	}
end

function getFarmGeneralControlPanelData(arg_4_0, arg_4_1, arg_4_2)
	return {
		height = 250,
		z = 202,
		type = "layer_color",
		name = "farmGeneralControlPanel",
		width = 125,
		color = ccc4(0, 0, 0, 0),
		x = arg_4_1,
		y = arg_4_2,
		children = {
			{
				xcenter = 0,
				ycenter = 0,
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/farm/btn_a_lb_c.png",
						name = "farmStartTrainBtn",
						pic1 = "res/ui/farm/btn_a_lb_a.png",
						y = 160,
						callBack = function()
							farmUI.farmStartButtonTap(1)
						end
					},
					{
						pic2 = "res/ui/farm/btn_a_gs_c.png",
						name = "farmStartQuickTrainBtn",
						pic1 = "res/ui/farm/btn_a_gs_a.png",
						y = 95,
						callBack = function()
							farmUI.farmStartButtonTap(2)
						end
					},
					{
						pic2 = "res/ui/farm/btn_a_js_c.png",
						name = "farmStartFastTrainBtn",
						pic1 = "res/ui/farm/btn_a_js_a.png",
						y = 30,
						callBack = function()
							farmUI.farmStartButtonTap(3)
						end
					},
					{
						pic2 = "res/ui/farm/btn_a_tt_c.png",
						name = "farmStartFarmBtn",
						pic1 = "res/ui/farm/btn_a_tt_a.png",
						y = -35,
						callBack = function()
							farmUI.farmStartButtonTap(0)
						end
					},
					{
						pic2 = "res/ui/farm/btn_a_wc_c.png",
						name = "farmStopBtn",
						pic1 = "res/ui/farm/btn_a_wc_a.png",
						y = -100,
						callBack = function()
							log.info("should farmStop")
							farmUI.farmStopButtonTap()
						end
					}
				}
			}
		}
	}
end
