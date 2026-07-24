styles = {}

function styles.getStyle(arg_1_0)
	if styles[arg_1_0] then
		return styles[arg_1_0]
	else
		log.error("@@@ 未知的style : ", arg_1_0)
	end
end

styles.Clipping_default = {
	alphaThreshold = 0.05,
	inverted = false,
	stencil = {
		frame = true,
		path = "stencilCircle.png"
	}
}
styles.label_default = {
	shadow = false,
	font = "Thonburi",
	stroke = false,
	fontSize = 22,
	strokeSize = 1,
	align = kCCTextAlignmentLeft,
	strokeColor = ccc3(255, 255, 255)
}
styles.label_warlock = {
	shadow = false,
	font = "Thonburi",
	stroke = true,
	strokeSize = 1,
	color = ccc3(235, 209, 167),
	strokeColor = ccc3(22, 18, 13)
}
styles.label_nation_wei = {
	fontSize = 24,
	font = "Thonburi",
	stroke = true,
	shadow = false,
	strokeSize = 1,
	align = kCCTextAlignmentLeft,
	color = ccc3(144, 200, 248),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_nation_shu = {
	fontSize = 24,
	font = "Thonburi",
	stroke = true,
	shadow = false,
	strokeSize = 1,
	align = kCCTextAlignmentLeft,
	color = ccc3(235, 150, 66),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_nation_wu = {
	fontSize = 24,
	font = "Thonburi",
	stroke = true,
	shadow = false,
	strokeSize = 1,
	align = kCCTextAlignmentLeft,
	color = ccc3(136, 212, 66),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_tip = {
	shadow = false,
	font = "Thonburi",
	stroke = true,
	fontSize = 18,
	strokeSize = 1,
	align = kCCTextAlignmentLeft,
	strokeColor = ccc3(33, 29, 23)
}
styles.label_yellowish_18 = {
	fontSize = 18,
	font = "Thonburi",
	stroke = true,
	shadow = false,
	strokeSize = 1,
	align = kCCTextAlignmentLeft,
	color = ccc3(237, 209, 169),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_yellowish_22 = {
	fontSize = 22,
	font = "Thonburi",
	stroke = true,
	shadow = false,
	strokeSize = 1,
	align = kCCTextAlignmentLeft,
	color = ccc3(237, 209, 169),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_yellowish_24 = {
	fontSize = 24,
	font = "Thonburi",
	stroke = true,
	shadow = false,
	strokeSize = 1,
	align = kCCTextAlignmentLeft,
	color = ccc3(237, 209, 169),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_yellowish_20 = {
	fontSize = 20,
	font = "Thonburi",
	stroke = true,
	shadow = false,
	strokeSize = 1,
	align = kCCTextAlignmentLeft,
	color = ccc3(188, 167, 145),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_greyish_22 = {
	fontSize = 22,
	font = "Thonburi",
	stroke = true,
	shadow = false,
	strokeSize = 1,
	align = kCCTextAlignmentLeft,
	color = ccc3(193, 184, 178),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_red_18 = {
	fontSize = 18,
	font = "Thonburi",
	stroke = true,
	shadow = false,
	strokeSize = 1,
	align = kCCTextAlignmentLeft,
	color = ccc3(234, 126, 93),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_white_18 = {
	fontSize = 18,
	font = "Thonburi",
	stroke = true,
	shadow = false,
	strokeSize = 0,
	align = kCCTextAlignmentLeft,
	color = ccc3(255, 255, 255),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_white_20 = {
	fontSize = 20,
	font = "Thonburi",
	stroke = true,
	shadow = false,
	strokeSize = 1,
	align = kCCTextAlignmentLeft,
	color = ccc3(255, 255, 205),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_white_22 = {
	fontSize = 22,
	font = "Thonburi",
	stroke = true,
	shadow = false,
	strokeSize = 1,
	align = kCCTextAlignmentLeft,
	color = ccc3(255, 255, 205),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_white_24 = {
	fontSize = 22,
	font = "Thonburi",
	stroke = true,
	shadow = false,
	strokeSize = 1,
	align = kCCTextAlignmentLeft,
	color = ccc3(255, 248, 179),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_gray_20 = {
	shadow = false,
	font = "Thonburi",
	stroke = true,
	fontSize = 20,
	strokeSize = 1,
	color = ccc3(106, 105, 103),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_timer = {
	shadow = false,
	font = "Thonburi",
	stroke = true,
	fontSize = 22,
	strokeSize = 1,
	color = ccc3(201, 74, 42),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_timerGreen = {
	shadow = false,
	font = "Thonburi",
	stroke = true,
	fontSize = 42,
	strokeSize = 1,
	color = ccc3(125, 217, 68),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_Violet_20 = {
	shadow = false,
	font = "Thonburi",
	stroke = true,
	fontSize = 20,
	strokeSize = 1,
	color = ccc3(209, 111, 242),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_orange_24 = {
	shadow = false,
	font = "Thonburi",
	stroke = true,
	fontSize = 24,
	strokeSize = 1,
	color = ccc3(255, 178, 57),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_green_24 = {
	shadow = false,
	font = "Thonburi",
	stroke = true,
	fontSize = 24,
	strokeSize = 1,
	color = ccc3(114, 223, 55),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_white_24_2 = {
	fontSize = 22,
	font = "Thonburi",
	stroke = false,
	shadow = false,
	strokeSize = 1,
	align = kCCTextAlignmentLeft,
	color = ccc3(255, 248, 179),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_orange_24_2 = {
	shadow = false,
	font = "Thonburi",
	stroke = false,
	fontSize = 24,
	strokeSize = 1,
	color = ccc3(255, 178, 57),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_green_24_2 = {
	shadow = false,
	font = "Thonburi",
	stroke = false,
	fontSize = 24,
	strokeSize = 1,
	color = ccc3(114, 223, 55),
	strokeColor = ccc3(33, 29, 23)
}
styles.edit_default = {
	fontSize = 22,
	font = "Thonburi",
	background = {
		frame = true,
		path = "editbox1.png"
	}
}
styles.button_default = {
	zoomOnTouchDown = false,
	marginH = 10,
	marginV = 10,
	normal = {
		frame = true,
		path = "btn_default_normal.png"
	},
	touched = {
		frame = true,
		path = "btn_default_lighted.png"
	}
}
styles.button_tip = {
	height = 42,
	zoomOnTouchDown = false,
	width = 42,
	marginH = 10,
	marginV = 10,
	normal = {
		frame = true,
		path = "btnTip_a.png"
	},
	touched = {
		frame = true,
		path = "btnTip_c.png"
	}
}
styles.button_close = {
	height = 42,
	zoomOnTouchDown = false,
	width = 42,
	marginH = 10,
	marginV = 10,
	normal = {
		frame = true,
		path = "btn_close_a.png"
	},
	touched = {
		frame = true,
		path = "btn_close_c.png"
	}
}
styles.button_gre1 = {
	height = 58,
	zoomOnTouchDown = false,
	width = 97,
	marginH = 10,
	marginV = 10,
	normal = {
		frame = true,
		path = "btn1_gre_c.png"
	},
	touched = {
		frame = true,
		path = "btn1_gre_a.png"
	},
	disable = {
		frame = true,
		path = "btn1_gre_g.png"
	}
}
styles.button_yel1 = {
	height = 58,
	zoomOnTouchDown = false,
	width = 97,
	marginH = 10,
	marginV = 10,
	normal = {
		frame = true,
		path = "btn1_yel_c.png"
	},
	touched = {
		frame = true,
		path = "btn1_yel_a.png"
	},
	disable = {
		frame = true,
		path = "btn1_yel_g.png"
	}
}
styles.button_gre2 = {
	height = 54,
	zoomOnTouchDown = false,
	width = 125,
	marginH = 10,
	marginV = 10,
	normal = {
		frame = true,
		path = "btn2_gre_c.png"
	},
	touched = {
		frame = true,
		path = "btn2_gre_a.png"
	},
	disable = {
		frame = true,
		path = "btn2_gre_g.png"
	}
}
styles.button_yel2 = {
	height = 54,
	zoomOnTouchDown = false,
	width = 125,
	marginH = 10,
	marginV = 10,
	normal = {
		frame = true,
		path = "btn2_yel_a.png"
	},
	touched = {
		frame = true,
		path = "btn2_yel_c.png"
	},
	disable = {
		frame = true,
		path = "btn2_yel_g.png"
	}
}
styles.button_gre3 = {
	height = 54,
	zoomOnTouchDown = false,
	width = 140,
	marginH = 10,
	marginV = 10,
	normal = {
		frame = true,
		path = "btn3_gre_a.png"
	},
	touched = {
		frame = true,
		path = "btn3_gre_c.png"
	},
	disable = {
		frame = true,
		path = "btn3_gre_g.png"
	}
}
styles.button_yel3 = {
	height = 54,
	zoomOnTouchDown = false,
	width = 140,
	marginH = 10,
	marginV = 10,
	normal = {
		frame = true,
		path = "btn3_yel_a.png"
	},
	touched = {
		frame = true,
		path = "btn3_yel_c.png"
	},
	disable = {
		frame = true,
		path = "btn3_yel_g.png"
	}
}
styles.button_gre4 = {
	height = 75,
	zoomOnTouchDown = false,
	width = 258,
	marginH = 10,
	marginV = 10,
	normal = {
		frame = true,
		path = "btn4_gre_a.png"
	},
	touched = {
		frame = true,
		path = "btn4_gre_c.png"
	},
	disable = {
		frame = true,
		path = "btn4_gre_g.png"
	}
}
styles.button_yel4 = {
	height = 75,
	zoomOnTouchDown = false,
	width = 258,
	marginH = 10,
	marginV = 10,
	normal = {
		frame = true,
		path = "btn4_yel_a.png"
	},
	touched = {
		frame = true,
		path = "btn4_yel_c.png"
	}
}
styles.label_white_18_2 = {
	fontSize = 18,
	font = "Thonburi",
	stroke = false,
	shadow = false,
	strokeSize = 1,
	align = kCCTextAlignmentLeft,
	color = ccc3(255, 248, 179),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_orange_18_2 = {
	shadow = false,
	font = "Thonburi",
	stroke = false,
	fontSize = 18,
	strokeSize = 1,
	color = ccc3(255, 178, 57),
	strokeColor = ccc3(33, 29, 23)
}
styles.label_green_18_2 = {
	shadow = false,
	font = "Thonburi",
	stroke = false,
	fontSize = 18,
	strokeSize = 1,
	color = ccc3(114, 223, 55),
	strokeColor = ccc3(33, 29, 23)
}
