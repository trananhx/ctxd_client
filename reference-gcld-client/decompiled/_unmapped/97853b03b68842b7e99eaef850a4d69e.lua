require("lua/layer/general/dinner/control")

local var_0_0 = dinnerControl

function getDinnerData()
	local var_1_0 = {}

	if conf.language == "kr" then
		var_1_0.offsetNextDinnerX = 40
		var_1_0.offsetDinnerDescX = 40
		var_1_0.offsetIsFullDescX = 125
		var_1_0.dinnerCntX = 0
		var_1_0.gen3AbsentY = 0
		var_1_0.gen4AbsentY = 0
	elseif conf.language == "vie" then
		var_1_0.offsetNextDinnerX = 0
		var_1_0.offsetDinnerDescX = 0
		var_1_0.offsetIsFullDescX = 125
		var_1_0.dinnerCntX = 20
		var_1_0.gen3AbsentY = -50
		var_1_0.gen4AbsentY = -40
	else
		var_1_0.offsetNextDinnerX = 0
		var_1_0.offsetDinnerDescX = 0
		var_1_0.offsetIsFullDescX = 0
		var_1_0.dinnerCntX = 0
		var_1_0.gen3AbsentY = 0
		var_1_0.gen4AbsentY = 0
	end

	local var_1_1 = {
		dinnerBackround1 = {
			y = 270,
			x = 480,
			type = "pic",
			pic = "res/ui/dinner/dinnerBackground1.jpg",
			children = {}
		}
	}

	table.insert(var_1_1.dinnerBackround1.children, {
		fontSize = 24,
		z = 104,
		name = "dinnerButton1Label",
		type = "label",
		strokeSize = 2,
		font = "Thonburi-Bold",
		y = 80,
		x = 470,
		text = language.get(84002),
		color = colorText[10004],
		strokeColor = colorText[10005]
	})
	table.insert(var_1_1.dinnerBackround1.children, {
		name = "dinnerButton1",
		z = 103,
		type = "button",
		buttons = {
			{
				pic2 = "frame:dinnerButton1.png",
				name = "tipItem",
				pic1 = "frame:dinnerButton.png",
				y = 80,
				x = 470
			}
		}
	})

	if var_0_0.dinnerNum == 0 then
		table.insert(var_1_1.dinnerBackround1.children, {
			fontSize = 25,
			name = "dinnerUpdataLabel",
			z = 101,
			type = "label",
			font = "Thonburi-Bold",
			y = 500,
			text = language.get(84003),
			color = ccc3(204, 185, 134),
			x = 80 + var_1_0.offsetNextDinnerX
		})
	elseif var_0_0.isFull == 1 then
		table.insert(var_1_1.dinnerBackround1.children, {
			fontSize = 25,
			name = "dinnerLabel",
			z = 103,
			type = "label",
			font = "Thonburi-Bold",
			y = 500,
			text = language.get(84004),
			color = ccc3(204, 185, 134),
			x = 155 + var_1_0.offsetIsFullDescX
		})
		table.insert(var_1_1.dinnerBackround1.children, {
			x = 457.5,
			name = "dinnerBackround2",
			y = 233.5,
			type = "pic",
			z = 102,
			pic = "res/ui/dinner/dinnerBackground2.jpg"
		})
	else
		table.insert(var_1_1.dinnerBackround1.children, {
			name = "dinnerGeneralRoleTalkTable",
			z = 110,
			type = "pic_9",
			pic = "frame:dinnerTalkViewTable.png",
			y = 190,
			x = 620,
			middleRect = CCRectMake(40, 35, 210, 110),
			preferedSize = CCSizeMake(560, 120),
			children = {
				{
					xcenter = 20,
					name = "dinnerGeneralRoleTalk",
					fontSize = 18,
					type = "label",
					ycenter = 0,
					height = 0,
					width = 510,
					text = language.get(84005),
					color = colorText[10002]
				}
			}
		})
		table.insert(var_1_1.dinnerBackround1.children, {
			name = "dinnerGeneralRoleTalkTable2",
			z = 110,
			type = "pic_9",
			pic = "frame:dinnerTalkViewTable2.png",
			y = 390,
			x = 285,
			middleRect = CCRectMake(40, 35, 210, 110),
			preferedSize = CCSizeMake(560, 120),
			children = {
				{
					xcenter = 20,
					name = "dinnerGeneralRoleTalk2",
					fontSize = 18,
					type = "label",
					ycenter = 0,
					height = 0,
					width = 510,
					text = language.get(84005),
					color = colorText[10002]
				}
			}
		})
		table.insert(var_1_1.dinnerBackround1.children, {
			fontSize = 30,
			name = "dinnerButton2Label",
			type = "label",
			font = "Thonburi-Bold",
			y = 80,
			x = 470,
			z = 104,
			text = language.get(84006)
		})
		table.insert(var_1_1.dinnerBackround1.children, {
			fontSize = 25,
			name = "dinnerStart",
			z = 101,
			type = "label",
			width = 850,
			height = 0,
			font = "Thonburi-Bold",
			y = 500,
			text = language.get(84007),
			color = ccc3(204, 185, 134),
			x = 430 + var_1_0.offsetDinnerDescX
		})
		table.insert(var_1_1.dinnerBackround1.children, {
			fontSize = 25,
			name = "dinnerStart1",
			z = 101,
			type = "label",
			font = "Thonburi-Bold",
			y = 135,
			x = 460,
			text = language.get(84008),
			color = ccc3(204, 185, 134)
		})
		table.insert(var_1_1.dinnerBackround1.children, {
			fontSize = 25,
			name = "dinnerStart2",
			type = "label",
			y = 135,
			z = 101,
			text = string.format("%d/6", var_0_0.dinnerNum),
			x = 540 + var_1_0.dinnerCntX
		})
		table.insert(var_1_1.dinnerBackround1.children, {
			x = 280,
			name = "dinnerChiefRole",
			y = 395,
			type = "pic",
			z = 102,
			pic = "frame:dinnerChiefRole.png",
			children = {
				{
					fontSize = 25,
					name = "dinnerChiefRoleNameLabel",
					type = "label",
					font = "Thonburi-Bold",
					y = 75,
					x = 20,
					z = 101,
					text = user.player.name
				},
				{
					name = "dinnerChiefRoleTalkTable",
					z = 110,
					type = "pic_9",
					pic = "frame:dinnerTalkViewTable.png",
					y = 25,
					x = 325,
					middleRect = CCRectMake(40, 35, 210, 110),
					preferedSize = CCSizeMake(600, 120),
					children = {
						{
							xcenter = 20,
							name = "dinnerChiefRoleTalk",
							fontSize = 20,
							type = "label",
							ycenter = 0,
							height = 0,
							width = 550,
							text = language.get(84009),
							color = colorText[10002]
						}
					}
				}
			}
		})

		local var_1_2 = {
			ccp(545, 395),
			ccp(245, 230),
			ccp(630, 350),
			ccp(330, 185),
			ccp(715, 310)
		}

		for iter_1_0, iter_1_1 in ipairs(var_0_0.generalInfos) do
			table.insert(var_1_1.dinnerBackround1.children, {
				z = 101,
				type = "pic",
				pic = iter_1_0 % 2 == 0 and "frame:dinnerGeneralRole1.png" or "frame:dinnerGeneralRole2.png",
				x = var_1_2[iter_1_0].x,
				y = var_1_2[iter_1_0].y,
				children = {
					{
						fontSize = 25,
						font = "Thonburi-Bold",
						type = "label",
						name = "dinnerRole01NameLabel",
						y = 55,
						x = 30,
						text = iter_1_1.type ~= 0 and iter_1_1.name or language.get(84010, iter_1_1.name, iter_1_1.reason)
					}
				}
			})
			table.insert(var_1_1.dinnerBackround1.children, {
				type = "pic",
				z = 102,
				pic = "",
				name = "expRewardLabel_" .. iter_1_0,
				x = var_1_2[iter_1_0].x,
				y = var_1_2[iter_1_0].y,
				children = {}
			})
		end

		table.insert(var_1_1.dinnerBackround1.children, {
			x = 310,
			name = "dinnerProcessAnimation11",
			y = 100,
			type = "pic",
			z = 102,
			pic = "frame:dinnerArrow1.png",
			children = {
				{
					x = 60,
					name = "dinnerProcessAnimation12",
					y = 20,
					type = "pic",
					z = 102,
					pic = "frame:dinnerArrow2.png"
				},
				{
					x = 100,
					name = "dinnerProcessAnimation13",
					y = 20,
					type = "pic",
					z = 102,
					pic = "frame:dinnerArrow3.png"
				}
			}
		})
		table.insert(var_1_1.dinnerBackround1.children, {
			x = 650,
			name = "dinnerProcessAnimation21",
			y = 100,
			type = "pic",
			z = 102,
			pic = "frame:dinnerArrow1.png",
			children = {
				{
					x = 60,
					name = "dinnerProcessAnimation22",
					y = 20,
					type = "pic",
					z = 102,
					pic = "frame:dinnerArrow2.png"
				},
				{
					x = 100,
					name = "dinnerProcessAnimation23",
					y = 20,
					type = "pic",
					z = 102,
					pic = "frame:dinnerArrow3.png"
				}
			}
		})
		table.insert(var_1_1.dinnerBackround1.children, {
			fontSize = 25,
			name = "dinnerProcessLabel",
			z = 102,
			type = "label",
			font = "Thonburi-Bold",
			y = 100,
			x = 480,
			text = language.get(84011),
			color = ccc3(204, 185, 134)
		})
	end

	table.insert(var_1_1.dinnerBackround1.children, {
		xcenter = 0,
		z = 200,
		scale = 0.7,
		type = "pic",
		ycenter = 100,
		pic = "res/ui/juben/jb_set.png"
	})
	table.insert(var_1_1.dinnerBackround1.children, {
		xcenter = 0,
		z = 201,
		scale = 0.7,
		type = "pic",
		ycenter = 150,
		pic = "res/ui/dinner/jxsy_word_yhz.png"
	})
	table.insert(var_1_1.dinnerBackround1.children, {
		fontSize = 25,
		name = "leftAutoSupplyCnt",
		type = "label",
		ycenter = 100,
		xcenter = 0,
		z = 201,
		text = language.get(84014, 0),
		children = {}
	})

	return var_1_1
end
