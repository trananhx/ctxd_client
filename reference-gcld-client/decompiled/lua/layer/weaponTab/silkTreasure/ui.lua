silkTreasure = {}

tool.requireRes("weaponTab/silkTreasure")

silkTreasure.ui = {}
silkTreasure.ui.table = {}

local var_0_0
local var_0_1 = 1
local var_0_2 = 1
local var_0_3

function silkTreasure.ui.onTouch(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0 == CCTOUCHBEGAN then
		-- block empty
	elseif arg_1_0 == CCTOUCHENDED then
		log.info("silkTreasure CCTOUCHENDED ", arg_1_1, arg_1_2)

		if var_0_0 then
			if var_0_3 and var_0_3:isVisible() then
				silkTreasure.removeTips()

				return true
			end

			if not silkTreasure.data.tenTreasure then
				for iter_1_0 = 1, 4 do
					if tool.checkIfTouch(silkTreasure.ui.table["icon_" .. iter_1_0], arg_1_1, arg_1_2) and var_0_0[iter_1_0 + 4 * (var_0_1 - 1)] and var_0_0[iter_1_0 + 4 * (var_0_1 - 1)].have ~= 0 and silkTreasure.constant.name[iter_1_0 + 4 * (var_0_1 - 1)] then
						silkTreasure.ui.setCurrentData(iter_1_0)

						return true
					end
				end

				for iter_1_1 = 1, 5 do
					if tool.checkIfTouch(silkTreasure.ui.table["piece_" .. iter_1_1], arg_1_1, arg_1_2) then
						silkTreasure.showTips(iter_1_1)

						return true
					end
				end

				if tool.checkIfTouch(silkTreasure.ui.table.treasure_teji, arg_1_1, arg_1_2) then
					silkTreasure.showTips()

					return true
				end
			else
				for iter_1_2 = 1, 9 do
					if tool.checkIfTouch(silkTreasure.ui.table["tenTreasureIconBg_" .. iter_1_2], arg_1_1, arg_1_2) then
						silkTreasure.showTips(1, iter_1_2)

						return true
					end
				end

				for iter_1_3 = 1, 2 do
					if tool.checkIfTouch(silkTreasure.ui.table["tenpiece_" .. iter_1_3], arg_1_1, arg_1_2) then
						silkTreasure.showTips(iter_1_3)

						return true
					end
				end

				if tool.checkIfTouch(silkTreasure.ui.table.treasure_teji, arg_1_1, arg_1_2) then
					silkTreasure.showTips()

					return true
				end
			end
		end
	end

	return true
end

function silkTreasure.ui.init()
	local function var_2_0()
		var_0_1 = var_0_1 - 1

		silkTreasure.ui.setData()
	end

	silkTreasure.ui.table.upButton:registerScriptTapHandler(var_2_0)

	local function var_2_1()
		var_0_1 = var_0_1 + 1

		silkTreasure.ui.setData()
	end

	silkTreasure.ui.table.downButton:registerScriptTapHandler(var_2_1)
	silkTreasure.addLight(silkTreasure.ui.table.treasure_center_light)
end

function silkTreasure.ui.resetUI(arg_5_0)
	local var_5_0 = arg_5_0 and arg_5_0 > 0

	for iter_5_0 = 1, 4 do
		silkTreasure.ui.table["icon_" .. iter_5_0]:setVisible(not var_5_0)
	end

	for iter_5_1 = 1, 5 do
		silkTreasure.ui.table["piece_" .. iter_5_1]:setVisible(not var_5_0)
	end

	silkTreasure.ui.table.icon_lignt:setVisible(not var_5_0)
	silkTreasure.ui.table.upButton:setVisible(not var_5_0)
	silkTreasure.ui.table.downButton:setVisible(not var_5_0)
end

function silkTreasure.ui.addEffect(arg_6_0)
	local var_6_0 = silkTreasure.ui.table["treasureLight_" .. arg_6_0]

	var_6_0:setVisible(true)

	local var_6_1 = CCArray:create()

	for iter_6_0 = 1, 16 do
		local var_6_2 = CCSprite:createWithSpriteFrameName("itemLight_" .. iter_6_0 .. ".png")

		var_6_1:addObject(var_6_2:displayFrame())
	end

	local var_6_3 = CCAnimation:createWithSpriteFrames(var_6_1, 0.04)
	local var_6_4 = CCAnimate:create(var_6_3)

	var_6_0:runAction(CCRepeatForever:create(var_6_4))
end

function silkTreasure.ui.setData(arg_7_0, arg_7_1)
	var_0_0 = arg_7_0 or var_0_0

	local var_7_0 = false
	local var_7_1 = silkTreasure.data.tenTreasure
	local var_7_2 = silkTreasure.data.progress

	silkTreasure.ui.resetUI(var_7_1)

	if var_7_1 then
		var_0_2 = 10

		silkTreasure.ui.table.tenTreasureSp:setVisible(true)
		silkTreasure.ui.table.treasure_center_light:setVisible(false)
		silkTreasure.ui.table.treasure_name:setPositionX(310)
		silkTreasure.ui.table.treasure_center:setPositionX(300)
		silkTreasure.ui.table.treasure_center_light:setPositionX(328)
		silkTreasure.ui.table.bg:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/dszb_bg01.jpg"):displayFrame())

		if var_7_2 then
			silkTreasure.ui.table.treasure_name:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/zb_zb_name_10.png"):displayFrame())
			silkTreasure.ui.table.treasure_center:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/treasure/zb_10_p.png"):displayFrame())

			local var_7_3 = var_0_0[10]

			if var_7_3 and var_7_3.components then
				for iter_7_0 = 1, #var_7_3.components do
					silkTreasure.ui.table["tenpiece_" .. iter_7_0]:removeChildByTag(123, true)

					if var_7_3.components[iter_7_0].finished == 1 then
						silkTreasure.ui.table["tenpiece_" .. iter_7_0]:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/treasure_piece/" .. var_7_3.components[iter_7_0].pic .. ".png"):displayFrame())
						silkTreasure.ui.table["tenpiece_num_bg" .. iter_7_0]:setVisible(false)
						silkTreasure.ui.table["tenpiece_num_" .. iter_7_0]:setVisible(false)
					else
						silkTreasure.ui.table["tenpiece_" .. iter_7_0]:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/treasure_piece/" .. var_7_3.components[iter_7_0].pic .. ".png"):displayFrame())

						local var_7_4 = GraySprite:createWithSpriteFrame(silkTreasure.ui.table["tenpiece_" .. iter_7_0]:displayFrame())

						var_7_4:setPosition(ccp(silkTreasure.ui.table["tenpiece_" .. iter_7_0]:getContentSize().width / 2, silkTreasure.ui.table["tenpiece_" .. iter_7_0]:getContentSize().height / 2))
						silkTreasure.ui.table["tenpiece_" .. iter_7_0]:addChild(var_7_4, 10, 123)
						silkTreasure.ui.table["tenpiece_num_" .. iter_7_0]:setVisible(true)
						silkTreasure.ui.table["tenpiece_num_" .. iter_7_0]:setString(var_7_3.components[iter_7_0].haveNum .. "/" .. var_7_3.components[iter_7_0].needNum)
					end
				end
			end

			if var_0_0[10] then
				silkTreasure.ui.setGeneralNum(490718, "att_num", var_0_0[10].att or 0)
				silkTreasure.ui.setGeneralNum(490719, "def_num", var_0_0[10].def or 0)
				silkTreasure.ui.setGeneralNum(490720, "hp_num", var_0_0[10].hp or 0)

				if var_0_0[10].have == 1 then
					silkTreasure.ui.table.tenTreasureBigIcon:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/treasure_icon/" .. silkTreasure.constant.name[var_7_2] .. "tu.png"):displayFrame())
					silkTreasure.ui.table.treasure_center_light:setVisible(false)
					silkTreasure.ui.table.treasure_teji:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/zb_tj_name_10.png"):displayFrame())
				elseif var_0_0[10].have == 2 then
					silkTreasure.ui.table.treasure_name:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/zb_zb_name_l_10.png"):displayFrame())
					silkTreasure.ui.table.treasure_center_light:setVisible(true)
					silkTreasure.ui.table.bg:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/dszb_bg02.jpg"):displayFrame())
					silkTreasure.ui.table.treasure_center:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/treasure/zb_10_l.png"):displayFrame())
					silkTreasure.ui.table.treasure_teji:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/zb_tj_name_l_10.png"):displayFrame())
					silkTreasure.ui.table.tenpiece_1:setVisible(false)
					silkTreasure.ui.table.tenpiece_2:setVisible(false)
					silkTreasure.ui.table.tenTreasureBigIcon:setVisible(false)
					silkTreasure.ui.table.treasureListBg:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/dszb_icon_bg2.png"):displayFrame())
				end
			end

			for iter_7_1 = 1, 9 do
				silkTreasure.ui.table["treasureLight_" .. iter_7_1]:setVisible(false)

				if iter_7_1 <= var_7_2 - 1 then
					silkTreasure.ui.table["tenTreasureIcon_" .. iter_7_1]:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/treasure_icon/" .. silkTreasure.constant.name[iter_7_1] .. "tu.png"):displayFrame())
					silkTreasure.ui.addEffect(iter_7_1)
				elseif var_7_2 == iter_7_1 then
					silkTreasure.ui.table["tenTreasureIcon_" .. iter_7_1]:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/treasure_icon/" .. silkTreasure.constant.name[iter_7_1] .. "tu.png"):displayFrame())
				else
					silkTreasure.ui.table["tenTreasureIcon_" .. iter_7_1]:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/treasure_icon/" .. silkTreasure.constant.name[iter_7_1] .. "tuh.png"):displayFrame())
				end
			end
		end
	else
		if arg_7_1 then
			local var_7_5 = 0

			for iter_7_2 = 1, #var_0_0 do
				if var_0_0[iter_7_2].have == 1 or var_0_0[iter_7_2].have == 2 then
					var_7_5 = var_7_5 + 1
				end
			end

			var_0_1 = math.ceil(var_7_5 / 4)
		end

		for iter_7_3 = 1, 4 do
			local var_7_6 = iter_7_3 + 4 * (var_0_1 - 1)

			if var_0_0[var_7_6] and silkTreasure.constant.name[var_7_6] then
				if var_0_0[var_7_6].have == 1 then
					silkTreasure.ui.setCurrentData(iter_7_3)

					var_7_0 = true

					silkTreasure.ui.table["treasure_icon_" .. iter_7_3]:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/treasure_icon/" .. silkTreasure.constant.name[var_7_6] .. "tu.png"):displayFrame())
				elseif var_0_0[var_7_6].have == 2 then
					silkTreasure.ui.table["treasure_icon_" .. iter_7_3]:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/treasure_icon/" .. silkTreasure.constant.name[var_7_6] .. "tu.png"):displayFrame())
				else
					silkTreasure.ui.table["treasure_icon_" .. iter_7_3]:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/zb_lock.jpg"):displayFrame())
				end
			else
				silkTreasure.ui.table["treasure_icon_" .. iter_7_3]:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/zb_lock.jpg"):displayFrame())
			end
		end

		if var_0_1 == 1 then
			silkTreasure.ui.table.upButton:setEnabled(false)
		else
			silkTreasure.ui.table.upButton:setEnabled(true)
		end

		local var_7_7 = 0

		for iter_7_4 = 1, #var_0_0 do
			if var_0_0[iter_7_4].have == 1 or var_0_0[iter_7_4].have == 2 then
				var_7_7 = var_7_7 + 1
			end
		end

		if var_7_7 <= 4 * var_0_1 then
			silkTreasure.ui.table.downButton:setEnabled(false)
		else
			silkTreasure.ui.table.downButton:setEnabled(true)
		end

		if var_7_0 == false then
			silkTreasure.ui.setCurrentData(1)
		end
	end
end

function silkTreasure.ui.setCurrentData(arg_8_0)
	var_0_2 = arg_8_0 + 4 * (var_0_1 - 1)

	local var_8_0 = var_0_0[var_0_2]

	if var_8_0 == nil then
		return
	end

	var_8_0.have = var_8_0.have or 0

	if var_8_0.have == 0 then
		return
	end

	if var_0_2 > 5 then
		silkTreasure.ui.table.bg:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/zb_view_bg2.jpg"):displayFrame())
	else
		silkTreasure.ui.table.bg:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/zb_view.jpg"):displayFrame())
	end

	silkTreasure.ui.table.icon_lignt:setPosition(silkTreasure.ui.table["icon_" .. arg_8_0]:getPosition())
	silkTreasure.ui.setGeneralNum(490718, "att_num", var_8_0.att or 0)
	silkTreasure.ui.setGeneralNum(490719, "def_num", var_8_0.def or 0)
	silkTreasure.ui.setGeneralNum(490720, "hp_num", var_8_0.hp or 0)

	if var_8_0.have == 1 then
		silkTreasure.ui.table.treasure_center_light:setVisible(false)
		silkTreasure.ui.table.treasure_name:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/zb_zb_name_0" .. var_0_2 .. ".png"):displayFrame())
		silkTreasure.ui.table.treasure_center:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/treasure/zb_" .. var_0_2 .. "_p.png"):displayFrame())
		silkTreasure.ui.table.treasure_teji:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/zb_tj_name_0" .. var_0_2 .. ".png"):displayFrame())
	elseif var_8_0.have == 2 then
		silkTreasure.ui.table.treasure_center_light:setVisible(true)
		silkTreasure.ui.table.treasure_name:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/zb_zb_name_l_0" .. var_0_2 .. ".png"):displayFrame())
		silkTreasure.ui.table.treasure_center:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/treasure/zb_" .. var_0_2 .. "_l.png"):displayFrame())
		silkTreasure.ui.table.treasure_teji:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/zb_tj_name_l_0" .. var_0_2 .. ".png"):displayFrame())
	end

	if var_8_0.components then
		for iter_8_0 = 1, #var_8_0.components do
			silkTreasure.ui.table["piece_" .. iter_8_0]:removeChildByTag(123, true)

			if var_8_0.components[iter_8_0].finished == 1 then
				silkTreasure.ui.table["piece_" .. iter_8_0]:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/treasure_piece/zb_" .. silkTreasure.constant.piece[var_0_2] .. iter_8_0 .. ".png"):displayFrame())
				silkTreasure.ui.table["piece_num_" .. iter_8_0]:setVisible(false)
			else
				silkTreasure.ui.table["piece_" .. iter_8_0]:setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/treasure_piece/zb_" .. silkTreasure.constant.piece[var_0_2] .. iter_8_0 .. ".png"):displayFrame())

				local var_8_1 = GraySprite:createWithSpriteFrame(silkTreasure.ui.table["piece_" .. iter_8_0]:displayFrame())

				var_8_1:setPosition(ccp(silkTreasure.ui.table["piece_" .. iter_8_0]:getContentSize().width / 2, silkTreasure.ui.table["piece_" .. iter_8_0]:getContentSize().height / 2))
				silkTreasure.ui.table["piece_" .. iter_8_0]:addChild(var_8_1, 10, 123)
				silkTreasure.ui.table["piece_num_" .. iter_8_0]:setVisible(true)
				silkTreasure.ui.table["piece_num_" .. iter_8_0]:setString(var_8_0.components[iter_8_0].haveNum .. "/" .. var_8_0.components[iter_8_0].needNum)
			end
		end
	end
end

function silkTreasure.ui.setGeneralNum(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = ""

	if arg_9_2 >= 1000 then
		var_9_0 = arg_9_2
	elseif arg_9_2 >= 100 then
		var_9_0 = arg_9_2 .. " "
	elseif arg_9_2 >= 10 then
		var_9_0 = arg_9_2 .. "  "
	else
		var_9_0 = arg_9_2 .. "   "
	end

	silkTreasure.ui.table[arg_9_1]:setString(language.get(arg_9_0, var_9_0))
end

function silkTreasure.ui.show()
	rmgr.loadResource("res/anim/sdtj/itemLight.plist")

	local var_10_0 = createBaseLayer()

	silkTreasure.ui.table = autoUI.initUI(var_10_0, getSilkTreasureData())
	silkTreasure.ui.table.layer = var_10_0

	var_10_0:registerScriptTouchHandler(silkTreasure.ui.onTouch)
	var_10_0:setTouchEnabled(true)
	silkTreasure.ui.table.treasure_center_light:setVisible(false)
	silkTreasure.ui.resetUI(1)
	silkTreasure.ui.init()
	silkTreasure.control.request_treasereInfo()

	return var_10_0
end

function silkTreasure.showTips(arg_11_0, arg_11_1)
	silkTreasure.removeTips()

	local var_11_0 = {}

	if arg_11_0 and not arg_11_1 then
		var_11_0 = var_0_0[var_0_2].components[arg_11_0]

		showTable(var_11_0)
	end

	if arg_11_1 then
		var_11_0 = var_0_0[arg_11_1]
		var_11_0.treasureIndex = arg_11_1
	end

	local var_11_1 = {}
	local var_11_2 = ""

	if arg_11_0 then
		if var_11_0.att ~= 0 then
			var_11_2 = language.get("122098_treasure", var_11_0.att)
		elseif var_11_0.def ~= 0 then
			var_11_2 = language.get("122099_treasure", var_11_0.def)
		elseif var_11_0.hp ~= 0 then
			var_11_2 = language.get("122100_treasure", var_11_0.hp)
		end

		if var_11_0.finished == 1 then
			var_11_1 = {
				{
					anchorPointX = 0.5,
					name = "tipsFrame",
					type = "pic_9_tips",
					pic = "frame:autoSizePanel.png",
					y = 280,
					anchorPointY = 0.5,
					x = 378,
					middleRect = CCRectMake(6, 6, 68, 68),
					content = {
						{
							height = 0,
							fontSize = 20,
							type = "label",
							width = 0,
							text = var_11_0.name,
							color = ccc3(255, 0, 255),
							align = kCCTextAlignmentLeft
						},
						{
							height = 0,
							fontSize = 20,
							type = "label",
							width = 0,
							text = language.get("122092_treasure"),
							color = colorText[10002],
							align = kCCTextAlignmentLeft
						},
						{
							height = 0,
							fontSize = 20,
							type = "label",
							width = 0,
							text = var_11_2,
							align = kCCTextAlignmentLeft
						}
					}
				}
			}
		elseif var_11_0.treasureIndex then
			var_11_1 = {
				{
					anchorPointX = 0.5,
					name = "tipsFrame",
					type = "pic_9_tips",
					pic = "frame:autoSizePanel.png",
					y = 280,
					anchorPointY = 0.5,
					x = 378,
					middleRect = CCRectMake(6, 6, 68, 68),
					content = {
						{
							height = 0,
							fontSize = 20,
							type = "label",
							width = 0,
							text = var_11_0.name,
							color = ccc3(255, 0, 255),
							align = kCCTextAlignmentLeft
						},
						{
							height = 0,
							fontSize = 20,
							type = "label",
							width = 0,
							text = language.get(122090) .. ":" .. var_11_0.skill,
							color = colorText[10002],
							align = kCCTextAlignmentLeft
						},
						{
							height = 0,
							fontSize = 20,
							type = "label",
							width = 0,
							text = var_11_0.skillIntro,
							align = kCCTextAlignmentLeft
						}
					}
				}
			}
		else
			var_11_1 = {
				{
					anchorPointX = 0.5,
					name = "tipsFrame",
					type = "pic_9_tips",
					pic = "frame:autoSizePanel.png",
					y = 280,
					anchorPointY = 0.5,
					x = 378,
					middleRect = CCRectMake(6, 6, 68, 68),
					content = {
						{
							height = 0,
							fontSize = 20,
							type = "label",
							width = 0,
							text = var_11_0.name,
							color = ccc3(255, 0, 255),
							align = kCCTextAlignmentLeft
						},
						{
							height = 0,
							fontSize = 20,
							type = "label",
							width = 0,
							text = language.get("122092_treasure"),
							color = colorText[10002],
							align = kCCTextAlignmentLeft
						},
						{
							height = 0,
							fontSize = 20,
							type = "label",
							width = 0,
							text = var_11_2,
							align = kCCTextAlignmentLeft
						},
						{
							height = 0,
							fontSize = 20,
							type = "label",
							width = 0,
							text = language.get("122093_treasure"),
							color = colorText[10002],
							align = kCCTextAlignmentLeft
						},
						{
							height = 0,
							fontSize = 20,
							type = "label",
							width = 0,
							text = language.get("122096_treasure"),
							align = kCCTextAlignmentLeft
						}
					}
				}
			}
		end
	elseif var_0_0[var_0_2].have == 2 then
		var_11_1 = {
			{
				anchorPointX = 0.5,
				name = "tipsFrame",
				type = "pic_9_tips",
				pic = "frame:autoSizePanel.png",
				y = 280,
				anchorPointY = 0.5,
				x = 378,
				middleRect = CCRectMake(6, 6, 68, 68),
				content = {
					{
						height = 0,
						fontSize = 20,
						type = "label",
						width = 0,
						text = var_0_0[var_0_2].skill,
						color = ccc3(255, 0, 255),
						align = kCCTextAlignmentLeft
					},
					{
						height = 0,
						fontSize = 20,
						type = "label",
						width = 0,
						text = language.get("122094_treasure"),
						color = colorText[10002],
						align = kCCTextAlignmentLeft
					},
					{
						height = 0,
						fontSize = 20,
						type = "label",
						width = 0,
						text = var_0_0[var_0_2].skillIntro,
						align = kCCTextAlignmentLeft
					}
				}
			}
		}
	else
		var_11_1 = {
			{
				anchorPointX = 0.5,
				name = "tipsFrame",
				type = "pic_9_tips",
				pic = "frame:autoSizePanel.png",
				y = 280,
				anchorPointY = 0.5,
				x = 378,
				middleRect = CCRectMake(6, 6, 68, 68),
				content = {
					{
						height = 0,
						fontSize = 20,
						type = "label",
						width = 0,
						text = var_0_0[var_0_2].skill,
						color = ccc3(255, 0, 255),
						align = kCCTextAlignmentLeft
					},
					{
						height = 0,
						fontSize = 20,
						type = "label",
						width = 0,
						text = language.get("122094_treasure"),
						color = colorText[10002],
						align = kCCTextAlignmentLeft
					},
					{
						height = 0,
						fontSize = 20,
						type = "label",
						width = 0,
						text = var_0_0[var_0_2].skillIntro,
						align = kCCTextAlignmentLeft
					},
					{
						height = 0,
						fontSize = 20,
						type = "label",
						width = 0,
						text = language.get("122095_treasure"),
						color = colorText[10002],
						align = kCCTextAlignmentLeft
					},
					{
						height = 0,
						fontSize = 20,
						type = "label",
						width = 0,
						text = language.get("122097_treasure"),
						align = kCCTextAlignmentLeft
					}
				}
			}
		}
	end

	local var_11_3 = autoUI.initUI(nil, var_11_1)

	silkTreasure.ui.table.bg:addChild(var_11_3.tipsFrame, 1001)

	var_0_3 = var_11_3.tipsFrame
end

function silkTreasure.removeTips()
	if var_0_3 and not tolua.isnull(var_0_3) then
		var_0_3:removeFromParentAndCleanup(true)

		var_0_3 = nil
	end
end

function silkTreasure.simpleRotate(arg_13_0)
	arg_13_0:runAction(CCRepeatForever:create(CCRotateBy:create(0.6, -360)))
end

function silkTreasure.addLight(arg_14_0)
	local var_14_0 = rmgr.getAnimation("treasureLight")
	local var_14_1 = CCAnimation:createWithSpriteFrames(var_14_0, 0.1)
	local var_14_2 = CCAnimate:create(var_14_1)

	arg_14_0:runAction(CCRepeatForever:create(var_14_2))
end
