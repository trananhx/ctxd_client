require("lua/layer/nation/nationTab/control")

local var_0_0 = nationTabControl
local var_0_1 = {}

if conf.language == "kr" then
	var_0_1.nationX = 5
	var_0_1.nationExpTopX = 0
	var_0_1.nationExpX = 29
	var_0_1.nationTipTitleX = 16
	var_0_1.nationLevelX = 0
	var_0_1.nationTipFontSize = 22
	var_0_1.frameHeight = 0
	var_0_1.nationLabel3Y = 0
	var_0_1.nationLabel4Y = 0
	var_0_1.nationLabel5Y = 0
	var_0_1.nationLabel6Y = 0
elseif conf.language == "vie" then
	var_0_1.nationX = 20
	var_0_1.nationExpTopX = 20
	var_0_1.nationExpX = 80
	var_0_1.nationTipTitleX = 72
	var_0_1.nationLevelX = 200
	var_0_1.nationTipFontSize = 20
	var_0_1.frameHeight = 50
	var_0_1.nationLabel3Y = 20
	var_0_1.nationLabel4Y = 40
	var_0_1.nationLabel5Y = 50
	var_0_1.nationLabel6Y = 50
else
	var_0_1.nationX = 0
	var_0_1.nationExpTopX = 0
	var_0_1.nationExpX = 0
	var_0_1.nationTipTitleX = 0
	var_0_1.nationLevelX = 0
	var_0_1.nationTipFontSize = 22
	var_0_1.frameHeight = 0
	var_0_1.nationLabel3Y = 0
	var_0_1.nationLabel4Y = 0
	var_0_1.nationLabel5Y = 0
	var_0_1.nationLabel6Y = 0
end

function getNationTabData()
	local var_1_0 = {
		nationBg = {
			xcenter = 0,
			type = "pic",
			ycenter = -60,
			pic = "res/ui/nation/nation_guojiadi.jpg",
			children = {}
		}
	}
	local var_1_1 = 1

	var_1_0.nationBg.children[var_1_1] = {
		fontSize = 22,
		top = -45,
		type = "label",
		fontName = "Thonburi-Bold",
		right = 90,
		text = language.get(91004),
		color = ccc3(204, 185, 134)
	}

	local var_1_2 = var_1_1 + 1

	var_1_0.nationBg.children[var_1_2] = {
		type = "button",
		buttons = {
			{
				pic2 = "frame:btnTip_c.png",
				name = "tipItem",
				pic1 = "frame:btnTip_a.png",
				y = 514,
				x = 870
			},
			{
				pic2 = "frame:btn3_gre_c.png",
				pic3 = "frame:btn3_gre_a.png",
				pic1 = "frame:btn3_gre_a.png",
				y = 305,
				name = "shilianItem",
				x = 346,
				children = {
					{
						fontSize = 20,
						y = 29,
						type = "label",
						strokeSize = 2,
						x = 70,
						text = var_0_0.name or language.get(91005),
						color = colorText[10004],
						strokeColor = colorText[10005]
					},
					{
						fontSize = 20,
						y = -20,
						type = "label",
						strokeSize = 2,
						x = 70,
						text = language.get(91006, var_0_0.times),
						color = colorText[10004],
						strokeColor = colorText[10005]
					}
				}
			},
			{
				pic2 = "frame:btn3_gre_c.png",
				pic3 = "frame:btn3_gre_a.png",
				pic1 = "frame:btn3_gre_a.png",
				y = 305,
				name = "shengjiItem",
				x = 561,
				children = {
					{
						fontSize = 20,
						y = 29,
						type = "label",
						strokeSize = 2,
						x = 70,
						text = language.get(91007),
						color = ccc3(204, 185, 134),
						color = colorText[10004],
						strokeColor = colorText[10005]
					}
				}
			}
		}
	}

	local var_1_3 = var_1_2 + 1

	var_1_0.nationBg.children[var_1_3] = {
		ycenter = 200,
		type = "pic",
		pic = "frame:nation_lv_" .. var_0_0.ourNation.forceLv .. ".png",
		xcenter = -70 + var_0_1.nationLevelX
	}

	local var_1_4 = var_1_3 + 1

	var_1_0.nationBg.children[var_1_4] = {
		xcenter = 30,
		ycenter = 200,
		pic = "frame:nation_jiguojia.png",
		type = "pic"
	}

	local var_1_5 = var_1_4 + 1
	local var_1_6

	if var_0_0.ourNation.forceId == 1 then
		var_1_6 = "cityWindowWei.png"
	elseif var_0_0.ourNation.forceId == 2 then
		var_1_6 = "cityWindowShu.png"
	elseif var_0_0.ourNation.forceId == 3 then
		var_1_6 = "cityWindowWu.png"
	end

	var_1_0.nationBg.children[var_1_5] = {
		y = 370,
		x = 100,
		type = "pic",
		pic = "frame:cityWindowNationBg.png",
		children = {
			{
				x = 20.5,
				y = 20.5,
				type = "pic",
				pic = "frame:" .. var_1_6
			}
		}
	}

	local var_1_7 = var_1_5 + 1

	var_1_0.nationBg.children[var_1_7] = {
		fontSize = 22,
		y = 370,
		type = "label",
		text = language.get(91008),
		color = ccc3(204, 185, 134),
		x = 170 + var_0_1.nationExpTopX
	}

	local var_1_8 = var_1_7 + 1

	var_1_0.nationBg.children[var_1_8] = {
		fontSize = 22,
		y = 344,
		type = "label",
		x = 148,
		text = "Lv." .. var_0_0.ourNation.forceLv,
		color = ccc3(204, 185, 134)
	}

	local var_1_9 = var_1_8 + 1

	var_1_0.nationBg.children[var_1_9] = {
		y = 344,
		x = 448,
		type = "pic",
		pic = "frame:guojiajingdudi1.png",
		children = {
			{
				x = 230,
				y = 10.5,
				type = "process",
				pic = "frame:guojiajingdutiao1_" .. var_0_0.ourNation.forceId .. ".png",
				percentage = 1 * var_0_0.ourNation.exp / var_0_0.ourNation.maxExp * 100
			},
			{
				fontSize = 22,
				y = 10.5,
				type = "label",
				x = 230,
				text = var_0_0.ourNation.exp .. "/" .. var_0_0.ourNation.maxExp,
				color = ccc3(204, 185, 134)
			}
		}
	}

	local var_1_10 = var_1_9 + 1

	var_1_0.nationBg.children[var_1_10] = {
		x = 786,
		y = 260,
		type = "pic",
		pic = "frame:nationForce" .. var_0_0.ourNation.forceId .. ".png"
	}

	for iter_1_0, iter_1_1 in pairs(var_0_0.nations) do
		var_1_10 = var_1_10 + 1

		local var_1_11

		if var_0_0.nations[iter_1_0].forceId == 1 then
			var_1_11 = language.get(91009)
		elseif var_0_0.nations[iter_1_0].forceId == 2 then
			var_1_11 = language.get(91010)
		elseif var_0_0.nations[iter_1_0].forceId == 3 then
			var_1_11 = language.get(91011)
		end

		var_1_0.nationBg.children[var_1_10] = {
			fontSize = 22,
			y = 98,
			type = "label",
			text = var_1_11,
			color = colorForce[var_0_0.nations[iter_1_0].forceId],
			x = 55 + 450 * (iter_1_0 - 1) + var_0_1.nationX
		}
		var_1_10 = var_1_10 + 1
		var_1_0.nationBg.children[var_1_10] = {
			fontSize = 22,
			y = 98,
			type = "label",
			text = language.get(91008),
			color = ccc3(204, 185, 134),
			x = 121 + 450 * (iter_1_0 - 1) + var_0_1.nationExpX
		}
		var_1_10 = var_1_10 + 1
		var_1_0.nationBg.children[var_1_10] = {
			fontSize = 22,
			y = 70,
			type = "label",
			text = "Lv." .. var_0_0.nations[iter_1_0].forceLv,
			color = ccc3(204, 185, 134),
			x = 55 + 450 * (iter_1_0 - 1)
		}
		var_1_10 = var_1_10 + 1
		var_1_0.nationBg.children[var_1_10] = {
			y = 70,
			type = "pic",
			pic = "frame:guojiajingdudi2.png",
			x = 255 + 450 * (iter_1_0 - 1),
			children = {
				{
					x = 168.5,
					y = 10.5,
					type = "process",
					pic = "frame:guojiajingdutiao2_" .. var_0_0.nations[iter_1_0].forceId .. ".png",
					percentage = 1 * var_0_0.nations[iter_1_0].exp / var_0_0.nations[iter_1_0].maxExp * 100
				},
				{
					fontSize = 22,
					y = 10.5,
					type = "label",
					x = 168.5,
					text = var_0_0.nations[iter_1_0].exp .. "/" .. var_0_0.nations[iter_1_0].maxExp,
					color = ccc3(204, 185, 134)
				}
			}
		}
	end

	return var_1_0
end

function getNationTipsData()
	local var_2_0 = {}
	local var_2_1 = ccc3(204, 185, 134)
	local var_2_2 = ccc3(102, 102, 102)

	var_2_0.tipsBg = {
		anchorPointX = 1,
		name = "tipsBg",
		z = 300,
		type = "pic_9_tips",
		pic = "frame:common_tip_frame_small.png",
		anchorPointY = 0.5,
		x = 820,
		middleRect = CCRectMake(0, 0, 0, 0),
		preferedSize = CCSizeMake(290, 300),
		y = visibleSize.height * 0.5,
		content = {
			{
				fontSize = 22,
				type = "label",
				top = 10,
				x = 76,
				text = language.get(91012)
			},
			{
				fontSize = 22,
				top = 40,
				type = "label",
				left = 15,
				text = language.get(91018),
				align = kCCTextAlignmentLeft,
				color = var_0_0.ourNation.forceLv > 1 and var_2_1 or var_2_2
			}
		}
	}

	return var_2_0
end
