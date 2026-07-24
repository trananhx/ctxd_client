local var_0_0 = class("ChooseEquipPanel", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.filterType = arg_2_1

	local var_2_0 = CCScale9Sprite:createWithSpriteFrameName("bigPanel.png")

	var_2_0:setPreferredSize(CCSizeMake(390, 600))
	var_2_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))

	arg_2_0.bg = var_2_0

	arg_2_0:addChild(var_2_0)
	arg_2_0:registerScriptTouchHandler(handler(arg_2_0, arg_2_0.onTouch), false, true)
	arg_2_0:setTouchEnabled(true)

	if arg_2_2 then
		showTable(arg_2_2)
		arg_2_0:initPanel(arg_2_2)

		arg_2_0.funcTable = arg_2_3
	else
		arg_2_0:getEquips()
	end
end

function var_0_0.filter(arg_3_0, arg_3_1)
	if arg_3_0.filterType == 1 then
		for iter_3_0, iter_3_1 in pairs(arg_3_1.refreshAttribute) do
			if iter_3_1.attValue < 5 then
				return true
			end
		end
	elseif arg_3_0.filterType == 2 or arg_3_0.filterType == 3 then
		local var_3_0 = true

		for iter_3_2, iter_3_3 in pairs(arg_3_1.refreshAttribute) do
			if iter_3_3.attValue ~= 5 then
				var_3_0 = false
			end
		end

		return var_3_0
	end

	return false
end

function var_0_0.getEquips(arg_4_0)
	local function var_4_0(arg_5_0)
		local var_5_0 = {}

		for iter_5_0, iter_5_1 in pairs(arg_5_0.action.data.equips) do
			if iter_5_1.quality == 6 and #iter_5_1.refreshAttribute >= 3 and arg_4_0:filter(iter_5_1) then
				var_5_0[#var_5_0 + 1] = iter_5_1
			end
		end

		arg_4_0:initPanel(var_5_0)
	end

	cmgr.sendRequest(var_4_0, actions.quenchingGetEquips)
end

local function var_0_1(arg_6_0)
	showTable(arg_6_0)

	local var_6_0 = "res/ui/activity/xilian/acti_text_jnsj.png"

	if arg_6_0.action.data.result ~= 0 then
		var_6_0 = "res/ui/activity/xilian/acti_text_hdmj.png"
	end

	local var_6_1 = CCSprite:create(var_6_0)
	local var_6_2 = visibleSize.width * 0.5
	local var_6_3 = visibleSize.height * 0.5

	var_6_1:setPosition(ccp(var_6_2, var_6_3 - 50))
	smgr.showTipSpriteText(var_6_1)
end

function var_0_0.useOnEquip(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_0.filterType == 1 then
		log.info("使用 ", arg_7_0.filterType, "on 装备", arg_7_1.id)

		local function var_7_0(arg_8_0)
			if arg_8_0 then
				cmgr.sendRequest(var_0_1, actions.useQuenchingToken, arg_8_0, arg_7_1.id, 0)
			else
				cmgr.sendRequest(var_0_1, actions.useQuenchingOrder, arg_7_1.id, 0, 1)
			end
		end

		eventManager.dispatchEvent("quenchingOrderReady", arg_7_1, 0, 1, var_7_0)
	elseif arg_7_0.filterType == 2 then
		log.info("使用 ", arg_7_0.filterType, "on 装备", arg_7_1.id)

		local function var_7_1(arg_9_0)
			if arg_9_0 then
				cmgr.sendRequest(var_0_1, actions.useQuenchingToken, arg_9_0, arg_7_1.id, 0)
			else
				cmgr.sendRequest(var_0_1, actions.useQuenchingOrder, arg_7_1.id, 0, 2)
			end
		end

		eventManager.dispatchEvent("quenchingOrderReady", arg_7_1, 0, 2, var_7_1)
	elseif arg_7_0.filterType == 3 then
		log.info("使用 ", arg_7_0.filterType, "on 装备", arg_7_1.id)

		local var_7_2 = {}
		local var_7_3 = CCLayerColor:create(ccc4(255, 0, 255, 0))

		var_7_3:registerScriptTouchHandler(function(arg_10_0, arg_10_1, arg_10_2)
			if arg_10_0 == CCTOUCHBEGAN then
				return true
			elseif arg_10_0 == CCTOUCHMOVED then
				return true
			elseif arg_10_0 == CCTOUCHENDED then
				if tool.checkIfTouch(var_7_2.skillPanel, arg_10_1, arg_10_2) then
					-- block empty
				else
					var_7_2 = nil

					var_7_3:removeFromParentAndCleanup(true)
				end

				return true
			end
		end, false, true)
		var_7_3:setTouchEnabled(true)
		autoUI.createUI(var_7_3, arg_7_0:getSkillPanelData(arg_7_1), var_7_2)
		arg_7_0.bg:addChild(var_7_3, 2000)
	elseif (arg_7_0.filterType == 10 or arg_7_0.filterType == 11) and arg_7_0.funcTable.selectedCallback then
		log.info("should call back , index:", arg_7_2)
		showTable(arg_7_1)
		arg_7_0.funcTable.selectedCallback(arg_7_1, arg_7_2)
	end
end

function var_0_0.skillDidSelected(arg_11_0, arg_11_1, arg_11_2)
	local function var_11_0(arg_12_0)
		if arg_12_0 then
			cmgr.sendRequest(var_0_1, actions.useQuenchingToken, arg_12_0, arg_11_1.id, arg_11_2)
		else
			cmgr.sendRequest(var_0_1, actions.useQuenchingOrder, arg_11_1.id, arg_11_2, 3)
		end
	end

	eventManager.dispatchEvent("quenchingOrderReady", arg_11_1, arg_11_2, 3, var_11_0)
end

function var_0_0.initPanel(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0.bg:getContentSize()
	local var_13_1 = CCTableView:create(CCSizeMake(var_13_0.width - 30, var_13_0.height - 30))

	var_13_1:setDirection(kCCScrollViewDirectionVertical)
	var_13_1:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_13_0.bg:addChild(var_13_1)
	var_13_1:setPosition(ccp(15, 15))

	if arg_13_1 and #arg_13_1 > 0 then
		if arg_13_0.noEquipTip then
			pcall(arg_13_0.noEquipTip.removeFromParentAndCleanup, arg_13_0.noEquipTip, true)
		end
	else
		log.info("显示无符合条件装备提示")

		local var_13_2 = CCSprite:create("res/ui/activity/xilian/acti_text_myzz.png")

		if arg_13_0.filterType == 10 then
			var_13_2 = CCSprite:create("res/ui/resource/blacksmith/tjp_att_zz.png")
		elseif arg_13_0.filterType == 11 then
			var_13_2 = CCSprite:create("res/ui/resource/blacksmith/tjp_att_bw.png")
		end

		arg_13_0.noEquipTip = var_13_2

		local var_13_3 = arg_13_0.bg:getContentSize()

		arg_13_0.bg:addChild(var_13_2)
		var_13_2:setPosition(ccp(var_13_3.width * 0.5, var_13_3.height * 0.5))
	end

	local function var_13_4(arg_14_0, arg_14_1)
		return
	end

	local function var_13_5(arg_15_0, arg_15_1)
		return
	end

	local function var_13_6(arg_16_0, arg_16_1)
		arg_13_0:useOnEquip(arg_13_1[arg_16_1:getIdx() + 1], arg_16_1:getIdx() + 1)
		log.info("cell touched at : ", arg_16_1:getIdx() + 1)
	end

	local function var_13_7(arg_17_0, arg_17_1)
		return 155, 361
	end

	local function var_13_8(arg_18_0, arg_18_1)
		local var_18_0 = arg_13_1[arg_18_1 + 1]

		log.info("equip  : ", arg_18_1)

		local var_18_1 = arg_18_0:dequeueCell()

		if var_18_1 then
			var_18_1:removeAllChildrenWithCleanup(true)
		else
			var_18_1 = CCTableViewCell:new()
		end

		local var_18_2 = autoUI.createUI(nil, arg_13_0:getEquipCellData(var_18_0, arg_18_1 + 1), nil)

		var_18_2:setAnchorPoint(CCPointMake(0, 0))
		var_18_2:setPosition(CCPointMake(0, 0))
		var_18_1:addChild(var_18_2)

		return var_18_1
	end

	local function var_13_9()
		if arg_13_1 then
			return #arg_13_1
		else
			return 0
		end
	end

	var_13_1:registerScriptHandler(var_13_4, CCTableView.kTableCellHighLight)
	var_13_1:registerScriptHandler(var_13_5, CCTableView.kTableCellUnhighLight)
	var_13_1:registerScriptHandler(var_13_6, CCTableView.kTableCellTouched)
	var_13_1:registerScriptHandler(var_13_7, CCTableView.kTableCellSizeForIndex)
	var_13_1:registerScriptHandler(var_13_8, CCTableView.kTableCellSizeAtIndex)
	var_13_1:registerScriptHandler(var_13_9, CCTableView.kNumberOfCellsInTableView)
	var_13_1:reloadData()

	arg_13_0.equipListTableView = var_13_1

	log.info("show tableview !!!")
end

function var_0_0.onTouch(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	if arg_20_1 == CCTOUCHBEGAN then
		return true
	elseif arg_20_1 == CCTOUCHENDED and not tool.checkIfTouch(arg_20_0.bg, arg_20_2, arg_20_3) then
		arg_20_0:removeFromParentAndCleanup(true)
	end
end

function var_0_0.getSkillPanelData(arg_21_0, arg_21_1)
	local var_21_0 = {
		x = 300,
		name = "skillPanel",
		type = "pic_9",
		ycenter = 0,
		pic = "frame:bigPanel.png",
		middleRect = CCRectMake(25, 25, 25, 25),
		preferedSize = CCSizeMake(405, 210),
		children = {}
	}
	local var_21_1 = {
		"qianggong",
		"qiangfang",
		"gongji",
		"fangyu",
		"xueliang",
		"qiangzhuang",
		"zhangkong"
	}

	for iter_21_0 = 1, 7 do
		local var_21_2 = 25 + (iter_21_0 - 1) * 93
		local var_21_3 = 110

		if iter_21_0 > 4 then
			var_21_2 = 25 + (iter_21_0 - 5) * 93
			var_21_3 = 20
		end

		local var_21_4 = {
			height = 80,
			type = "layer_color",
			width = 80,
			color = ccc4(0, 0, 255, 0),
			x = var_21_2,
			y = var_21_3,
			children = {
				{
					xcenter = 0,
					name = "itemButtons",
					type = "button",
					ycenter = 0,
					buttons = {
						{
							pic2 = "frame:general_background_light.png",
							name = "actDrawReward",
							pic1 = "frame:general_background.png",
							callBack = function()
								arg_21_0:skillDidSelected(arg_21_1, iter_21_0)
							end
						}
					}
				},
				{
					xcenter = 0,
					scale = 1.384,
					type = "pic",
					ycenter = 0,
					pic = "res/ui/equip/quenching/" .. var_21_1[iter_21_0] .. ".jpg"
				}
			}
		}

		table.insert(var_21_0.children, var_21_4)
	end

	return var_21_0
end

function var_0_0.getEquipCellData(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = {
		pic = "res/ui/equip/storeHouse/wareh_use_list_view_bg.jpg",
		type = "pic",
		children = {
			{
				y = 90,
				x = 55,
				type = "pic",
				pic = picQualityFrame[arg_23_1.quality or 0]
			},
			{
				y = 90,
				x = 55,
				type = "pic",
				pic = "frame:" .. arg_23_1.pic .. ".jpg"
			},
			{
				xcenter = 0,
				y = 25,
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/equip/storeHouse/wareh_use_btn_c.jpg",
						pic1 = "res/ui/equip/storeHouse/wareh_use_btn_a.jpg",
						children = {
							{
								xcenter = 0,
								fontSize = 20,
								type = "label",
								ycenter = 0,
								text = language.get(103019)
							}
						},
						callBack = function()
							arg_23_0:useOnEquip(arg_23_1, arg_23_2)
						end
					}
				}
			},
			{
				fontSize = 20,
				type = "label",
				anchorPointX = 0,
				font = "Thonburi",
				y = 115,
				anchorPointY = 0.5,
				x = 110,
				text = arg_23_1.name or arg_23_1.itemName,
				color = colorQuality[arg_23_1.quality or 0]
			},
			{
				fontSize = 20,
				type = "label",
				visible = false,
				anchorPointX = 0,
				font = "Thonburi",
				y = 75,
				anchorPointY = 0.5,
				x = 110,
				text = language.get(75041, arg_23_1.att1, arg_23_1.att2),
				color = colorText[10002]
			}
		}
	}
	local var_23_1 = {
		x = 100,
		height = 45,
		y = 48,
		type = "layer_color",
		width = 245,
		color = ccc4(0, 0, 255, 0),
		children = {}
	}

	local function var_23_2(arg_25_0, arg_25_1)
		return {
			height = 45,
			y = 0,
			type = "layer_color",
			width = 45,
			color = ccc4(0, 0, 255, 0),
			x = 15 + (arg_25_1 - 1) * 58,
			children = {
				{
					xcenter = 0,
					scale = 0.5625,
					type = "pic",
					ycenter = 0,
					pic = "frame:item_background.jpg"
				},
				{
					xcenter = 0,
					scale = 0.7123287671232876,
					type = "pic",
					ycenter = 0,
					pic = "res/ui/equip/quenching/" .. arg_25_0.skillPic .. ".jpg"
				},
				{
					fontSize = 26,
					y = 10,
					type = "label",
					x = 40,
					text = arg_25_0.attValue
				}
			}
		}
	end

	if arg_23_1.refreshAttribute then
		for iter_23_0 = 1, #arg_23_1.refreshAttribute do
			table.insert(var_23_1.children, var_23_2(arg_23_1.refreshAttribute[iter_23_0], iter_23_0))
		end
	end

	table.insert(var_23_0.children, var_23_1)

	return var_23_0
end

return var_0_0
