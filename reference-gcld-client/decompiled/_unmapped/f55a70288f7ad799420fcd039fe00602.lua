local var_0_0 = {}

multiLangOffset = {}

if conf.language == "kr" then
	multiLangOffset.incenseTipsX1 = 50
	multiLangOffset.incenseTipsX2 = 65
	multiLangOffset.incenseTipsX3 = 80
	multiLangOffset.freeIncenseDescX = -30
	multiLangOffset.freeIncenseCntX = 0
	multiLangOffset.freeIncenseCntMaxX = 10
	multiLangOffset.incenseFontSize = 20
elseif conf.language == "vie" then
	multiLangOffset.incenseTipsX1 = 120
	multiLangOffset.incenseTipsX2 = 140
	multiLangOffset.incenseTipsX3 = 110
	multiLangOffset.freeIncenseDescX = -70
	multiLangOffset.freeIncenseCntX = 50
	multiLangOffset.freeIncenseCntMaxX = 54
	multiLangOffset.incenseFontSize = 17
elseif conf.language == "tha" then
	multiLangOffset.incenseTipsX1 = 0
	multiLangOffset.incenseTipsX2 = 27
	multiLangOffset.incenseTipsX3 = 50
	multiLangOffset.freeIncenseDescX = 0
	multiLangOffset.freeIncenseCntX = 0
	multiLangOffset.freeIncenseCntMaxX = 0
	multiLangOffset.incenseFontSize = 20
else
	multiLangOffset.incenseTipsX1 = 0
	multiLangOffset.incenseTipsX2 = 0
	multiLangOffset.incenseTipsX3 = 0
	multiLangOffset.freeIncenseDescX = 0
	multiLangOffset.freeIncenseCntX = 0
	multiLangOffset.freeIncenseCntMaxX = 0
end

if conf.language == "vie" then
	var_0_0.incenseTips = {
		fontSize = 22,
		type = "label",
		ycenter = 192,
		text = language.get("vn_71001"),
		xcenter = -368 + multiLangOffset.incenseTipsX1,
		color = ccc3(204, 185, 134),
		children = {
			{
				fontSize = 22,
				y = 0,
				type = "label",
				text = language.get(71002),
				color = ccc3(94, 207, 64),
				x = 120 + multiLangOffset.incenseTipsX2
			}
		}
	}
else
	var_0_0.incenseTips = {
		fontSize = 22,
		type = "label",
		ycenter = 192,
		text = language.get(71001),
		xcenter = -368 + multiLangOffset.incenseTipsX1,
		color = ccc3(204, 185, 134),
		children = {
			{
				fontSize = 22,
				y = 0,
				type = "label",
				text = language.get(71002),
				color = ccc3(94, 207, 64),
				x = 120 + multiLangOffset.incenseTipsX2
			},
			{
				fontSize = 22,
				y = 0,
				type = "label",
				text = language.get(71003),
				color = ccc3(204, 185, 134),
				x = 197 + multiLangOffset.incenseTipsX3
			}
		}
	}
end

var_0_0.incenseNum = {
	fontSize = 24,
	name = "freeIncenseDesc",
	type = "label",
	ycenter = 222,
	text = language.get(71004),
	xcenter = -377 + multiLangOffset.freeIncenseDescX,
	color = ccc3(204, 185, 134),
	children = {
		{
			text = "0",
			name = "currentIncenseNum",
			fontSize = 24,
			type = "label",
			y = 0,
			color = ccc3(255, 204, 0),
			x = 88 + multiLangOffset.freeIncenseCntX
		},
		{
			fontSize = 24,
			name = "incenseMax",
			y = 0,
			type = "label",
			color = ccc3(255, 255, 204),
			x = 118 + multiLangOffset.freeIncenseCntMaxX
		}
	}
}
var_0_0.tenTimesMenu = {
	type = "button",
	buttons = {
		{
			xcenter = 310,
			name = "tenTimesBtn",
			ycenter = 212,
			pic1 = {
				pics = {
					{
						pic = "res/ui/messagebox/unite_view_a.png",
						children = {
							{
								x = 19,
								name = "checkedBtn",
								y = 19,
								type = "pic",
								pic = "res/ui/messagebox/unite_view_on.png"
							},
							{
								fontSize = 20,
								x = 103,
								type = "menu_label",
								font = "Thonburi",
								y = 19,
								strokeSize = 2,
								text = language.get(71011),
								color = ccc3(0, 0, 0),
								strokeColor = ccc3(204, 185, 134)
							}
						}
					}
				}
			}
		}
	}
}
var_0_0.incenseMenu = {
	type = "button",
	buttons = {
		{
			xcenter = -384,
			name = "resourceIncense_1",
			ycenter = -35,
			enable = false,
			pic1 = {
				pics = {
					{
						pic = "frame:js_view_bg.png",
						children = {
							{
								x = 86,
								y = 227,
								pic = "res/ui/resource/js_01.jpg",
								type = "pic"
							},
							{
								x = 87.5,
								y = 205,
								pic = "frame:btn_js_on.png",
								type = "pic"
							},
							{
								x = 23,
								y = 23,
								pic = "frame:icon_silver.png",
								type = "pic"
							},
							{
								fontSize = 20,
								x = 103,
								type = "menu_label",
								font = "Thonburi",
								y = 23,
								strokeSize = 2,
								text = language.get(71005),
								color = ccc3(227, 251, 195),
								strokeColor = ccc3(43, 73, 0)
							}
						}
					}
				}
			},
			pic2 = {
				pics = {
					{
						pic = "frame:js_view_bg.png",
						children = {
							{
								x = 86,
								y = 227,
								pic = "res/ui/resource/js_01.jpg",
								type = "pic"
							},
							{
								x = 87.5,
								y = 205,
								pic = "frame:btn_js_click.png",
								type = "pic"
							},
							{
								x = 23,
								y = 23,
								pic = "frame:icon_silver.png",
								type = "pic"
							},
							{
								fontSize = 20,
								x = 103,
								type = "menu_label",
								font = "Thonburi",
								y = 23,
								strokeSize = 2,
								text = language.get(71005),
								color = ccc3(227, 251, 195),
								strokeColor = ccc3(43, 73, 0)
							}
						}
					}
				}
			},
			pic3 = {
				pics = {
					{
						pic = "frame:js_view_none.png",
						children = {
							{
								x = 87.5,
								y = 205,
								pic = "frame:btn_js_on_gray.png",
								type = "pic"
							}
						}
					}
				}
			}
		},
		{
			xcenter = -192,
			name = "resourceIncense_2",
			ycenter = -35,
			enable = false,
			pic1 = {
				pics = {
					{
						pic = "frame:js_view_bg.png",
						children = {
							{
								x = 86,
								y = 227,
								pic = "res/ui/resource/js_02.jpg",
								type = "pic"
							},
							{
								x = 87.5,
								y = 205,
								pic = "frame:btn_js_on.png",
								type = "pic"
							},
							{
								x = 23,
								y = 23,
								pic = "frame:icon_wood.png",
								type = "pic"
							},
							{
								fontSize = 20,
								x = 103,
								type = "menu_label",
								font = "Thonburi",
								y = 23,
								strokeSize = 2,
								text = language.get(71006),
								color = ccc3(227, 251, 195),
								strokeColor = ccc3(43, 73, 0)
							}
						}
					}
				}
			},
			pic2 = {
				pics = {
					{
						pic = "frame:js_view_bg.png",
						children = {
							{
								x = 86,
								y = 227,
								pic = "res/ui/resource/js_02.jpg",
								type = "pic"
							},
							{
								x = 87.5,
								y = 205,
								pic = "frame:btn_js_click.png",
								type = "pic"
							},
							{
								x = 23,
								y = 23,
								pic = "frame:icon_wood.png",
								type = "pic"
							},
							{
								fontSize = 20,
								x = 103,
								type = "menu_label",
								font = "Thonburi",
								y = 23,
								strokeSize = 2,
								text = language.get(71006),
								color = ccc3(227, 251, 195),
								strokeColor = ccc3(43, 73, 0)
							}
						}
					}
				}
			},
			pic3 = {
				pics = {
					{
						pic = "frame:js_view_none.png",
						children = {
							{
								x = 87.5,
								y = 205,
								pic = "frame:btn_js_on_gray.png",
								type = "pic"
							}
						}
					}
				}
			}
		},
		{
			xcenter = 0,
			name = "resourceIncense_3",
			ycenter = -35,
			enable = false,
			pic1 = {
				pics = {
					{
						pic = "frame:js_view_bg.png",
						children = {
							{
								x = 86,
								y = 227,
								pic = "res/ui/resource/js_03.jpg",
								type = "pic"
							},
							{
								x = 87.5,
								y = 205,
								pic = "frame:btn_js_on.png",
								type = "pic"
							},
							{
								x = 23,
								y = 23,
								pic = "frame:icon_food.png",
								type = "pic"
							},
							{
								fontSize = 20,
								x = 103,
								type = "menu_label",
								font = "Thonburi",
								y = 23,
								strokeSize = 2,
								text = language.get(71007),
								color = ccc3(227, 251, 195),
								strokeColor = ccc3(43, 73, 0)
							}
						}
					}
				}
			},
			pic2 = {
				pics = {
					{
						pic = "frame:js_view_bg.png",
						children = {
							{
								x = 86,
								y = 227,
								pic = "res/ui/resource/js_03.jpg",
								type = "pic"
							},
							{
								x = 87.5,
								y = 205,
								pic = "frame:btn_js_click.png",
								type = "pic"
							},
							{
								x = 23,
								y = 23,
								pic = "frame:icon_food.png",
								type = "pic"
							},
							{
								fontSize = 20,
								x = 103,
								type = "menu_label",
								font = "Thonburi",
								y = 23,
								strokeSize = 2,
								text = language.get(71007),
								color = ccc3(227, 251, 195),
								strokeColor = ccc3(43, 73, 0)
							}
						}
					}
				}
			},
			pic3 = {
				pics = {
					{
						pic = "frame:js_view_none.png",
						children = {
							{
								x = 87.5,
								y = 205,
								pic = "frame:btn_js_on_gray.png",
								type = "pic"
							}
						}
					}
				}
			}
		},
		{
			xcenter = 192,
			name = "resourceIncense_4",
			ycenter = -35,
			enable = false,
			pic1 = {
				pics = {
					{
						pic = "frame:js_view_bg.png",
						children = {
							{
								x = 86,
								y = 227,
								pic = "res/ui/resource/js_04.jpg",
								type = "pic"
							},
							{
								x = 87.5,
								y = 205,
								pic = "frame:btn_js_on.png",
								type = "pic"
							},
							{
								x = 23,
								name = "icon41",
								y = 23,
								type = "pic",
								pic = "frame:icon_iron.png"
							},
							{
								fontSize = 20,
								name = "info41",
								strokeSize = 2,
								type = "menu_label",
								font = "Thonburi",
								y = 23,
								x = 103,
								text = language.get(71008),
								color = ccc3(227, 251, 195),
								strokeColor = ccc3(43, 73, 0)
							}
						}
					}
				}
			},
			pic2 = {
				pics = {
					{
						pic = "frame:js_view_bg.png",
						children = {
							{
								x = 86,
								y = 227,
								pic = "res/ui/resource/js_04.jpg",
								type = "pic"
							},
							{
								x = 87.5,
								y = 205,
								pic = "frame:btn_js_click.png",
								type = "pic"
							},
							{
								x = 23,
								name = "icon42",
								y = 23,
								type = "pic",
								pic = "frame:icon_iron.png"
							},
							{
								fontSize = 20,
								name = "info42",
								strokeSize = 2,
								type = "menu_label",
								font = "Thonburi",
								y = 23,
								x = 103,
								text = language.get(71008),
								color = ccc3(227, 251, 195),
								strokeColor = ccc3(43, 73, 0)
							}
						}
					}
				}
			},
			pic3 = {
				pics = {
					{
						pic = "frame:js_view_none.png",
						children = {
							{
								x = 87.5,
								y = 205,
								pic = "frame:btn_js_on_gray.png",
								type = "pic"
							}
						}
					}
				}
			}
		},
		{
			xcenter = 384,
			name = "resourceIncense_5",
			ycenter = -35,
			enable = false,
			pic1 = {
				pics = {
					{
						pic = "frame:js_view_bg.png",
						children = {
							{
								x = 86,
								y = 227,
								pic = "res/ui/resource/js_05.jpg",
								type = "pic"
							},
							{
								x = 87.5,
								y = 205,
								pic = "frame:btn_js_on.png",
								type = "pic"
							},
							{
								x = 23,
								name = "icon51",
								y = 23,
								type = "pic",
								pic = "frame:icon_gem.png"
							},
							{
								fontSize = 20,
								name = "info51",
								strokeSize = 2,
								type = "menu_label",
								font = "Thonburi",
								y = 23,
								x = 103,
								text = language.get(71009),
								color = ccc3(227, 251, 195),
								strokeColor = ccc3(43, 73, 0)
							}
						}
					}
				}
			},
			pic2 = {
				pics = {
					{
						pic = "frame:js_view_bg.png",
						children = {
							{
								x = 86,
								y = 227,
								pic = "res/ui/resource/js_05.jpg",
								type = "pic"
							},
							{
								x = 87.5,
								y = 205,
								pic = "frame:btn_js_click.png",
								type = "pic"
							},
							{
								x = 23,
								name = "icon52",
								y = 23,
								type = "pic",
								pic = "frame:icon_gem.png"
							},
							{
								fontSize = 20,
								name = "info52",
								strokeSize = 2,
								type = "menu_label",
								font = "Thonburi",
								y = 23,
								x = 103,
								text = language.get(71009),
								color = ccc3(227, 251, 195),
								strokeColor = ccc3(43, 73, 0)
							}
						}
					}
				}
			},
			pic3 = {
				pics = {
					{
						pic = "frame:js_view_none.png",
						children = {
							{
								x = 87.5,
								y = 205,
								pic = "frame:btn_js_on_gray.png",
								type = "pic"
							}
						}
					}
				}
			}
		}
	}
}
var_0_0.incenseGold1 = {
	xcenter = -384,
	fontSize = 20,
	text = "",
	type = "label",
	ycenter = -250,
	color = ccc3(255, 204, 0)
}
var_0_0.incenseGold2 = {
	xcenter = -192,
	fontSize = 20,
	text = "",
	type = "label",
	ycenter = -250,
	color = ccc3(255, 204, 0)
}
var_0_0.incenseGold3 = {
	xcenter = 0,
	fontSize = 20,
	text = "",
	type = "label",
	ycenter = -250,
	color = ccc3(255, 204, 0)
}
var_0_0.incenseGold4 = {
	xcenter = 192,
	fontSize = 20,
	text = "",
	type = "label",
	ycenter = -250,
	color = ccc3(255, 204, 0)
}
var_0_0.incenseGold5 = {
	xcenter = 384,
	fontSize = 20,
	text = "",
	type = "label",
	ycenter = -250,
	color = ccc3(255, 204, 0)
}
var_0_0.bigIncense = {
	xcenter = 370,
	name = "bigIncense",
	z = 1001,
	type = "button",
	ycenter = -287,
	visible = true,
	buttons = {
		{
			pic2 = "res/ui/common/button/public_btn_green_c.png",
			pic1 = "res/ui/common/button/public_btn_green.png",
			name = "btnBigIncense",
			callBack = function()
				incenseControl.getBigIncenseAwards()
			end,
			children = {
				{
					fontSize = 24,
					xcenter = 0,
					type = "label",
					ycenter = 5,
					text = language.get(490929),
					color = ccc3(204, 185, 134)
				}
			}
		}
	}
}
var_0_0.bigIncenseNum = {
	xcenter = 250,
	name = "bigIncenseNum",
	anchorPointX = 1,
	type = "label",
	ycenter = -280,
	fontSize = 22,
	color = ccc3(204, 185, 134),
	text = language.get(490930, 0)
}

function getIncenseData()
	return var_0_0
end
