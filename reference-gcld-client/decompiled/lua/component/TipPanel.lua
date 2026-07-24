local var_0_0 = {
	layout = {
		widgets = {
			{
				name = "panel",
				type = "sprite9",
				zorder = 10000,
				y = 340,
				x = 800,
				middleRect = CCRectMake(0, 0, 0, 0),
				preferedSize = CCSizeMake(750, 222),
				pic = {
					frame = true,
					path = "common_tip_frame_small.png"
				},
				anchorPoint = ccp(1, 1)
			}
		}
	},
	tipItem = {
		fontSize = 24,
		name = "tipItem",
		stroke = true,
		type = "label",
		strokeSize = 1,
		textId = 410401,
		y = 0,
		x = 17,
		color = ccc3(109, 225, 212),
		strokeColor = ccc3(33, 29, 23),
		anchorPoint = ccp(0, 0.5)
	},
	tipItem2 = {
		fontSize = 20,
		name = "tipItem",
		stroke = true,
		type = "label",
		strokeSize = 1,
		textId = 410401,
		y = 0,
		x = 17,
		color = ccc3(109, 225, 212),
		strokeColor = ccc3(33, 29, 23),
		anchorPoint = ccp(0, 0.5)
	}
}

function var_0_0.create(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0:destory()

	arg_1_0.view = {}

	uiutil.initLayout(arg_1_0.view, var_0_0.layout)

	local function var_1_0(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_0 == CCTOUCHBEGAN and not checkIfTouch(arg_1_0.view.widgets.panel, arg_2_1, arg_2_2) then
			arg_1_0:destory()
		end
	end

	local var_1_1 = 0
	local var_1_2 = #arg_1_2
	local var_1_3 = var_1_2 * 24 + (var_1_2 - 1) * 17 + 34
	local var_1_4 = 0

	if arg_1_2 and #arg_1_2 > 0 then
		local var_1_5 = 17
		local var_1_6 = var_1_3 - 17 - 12

		for iter_1_0, iter_1_1 in pairs(arg_1_2) do
			local var_1_7 = string.utf8len(iter_1_1)

			if var_1_1 < var_1_7 then
				var_1_1 = var_1_7
			end

			local var_1_8 = {}

			uiutil.initWidgets(var_1_8, arg_1_0.tipItem)
			var_1_8.widgets.tipItem:setString(iter_1_1)
			var_1_8.widgets.tipItem:setPosition(ccp(var_1_5, var_1_6))
			arg_1_0.view.widgets.panel:addChild(var_1_8.widgets.tipItem)

			if var_1_4 < var_1_8.widgets.tipItem:getContentSize().width then
				var_1_4 = var_1_8.widgets.tipItem:getContentSize().width
			end

			var_1_6 = var_1_6 - 24 - 17
		end
	end

	log.info("@@ 文字长度 ", var_1_1)

	local var_1_9 = var_1_4 + 34

	arg_1_0.view.widgets.panel:setPreferredSize(CCSizeMake(var_1_9, var_1_3))
	arg_1_0.view.widgets.panel:registerScriptTouchHandler(var_1_0)
	arg_1_0.view.widgets.panel:setTouchEnabled(true)

	if not tolua.isnull(arg_1_1) then
		arg_1_1:addChild(arg_1_0.view.widgets.panel)
	end
end

function var_0_0.createWithStyle(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if arg_3_3 == nil then
		var_0_0:create(arg_3_1, arg_3_2)
	end

	local var_3_0 = var_0_0["tipItem" .. arg_3_3]

	arg_3_0:destory()

	arg_3_0.view = {}

	uiutil.initLayout(arg_3_0.view, var_0_0.layout)

	local function var_3_1(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == CCTOUCHBEGAN and not checkIfTouch(arg_3_0.view.widgets.panel, arg_4_1, arg_4_2) then
			arg_3_0:destory()
		end
	end

	local var_3_2 = 0
	local var_3_3 = #arg_3_2
	local var_3_4 = var_3_3 * 24 + (var_3_3 - 1) * 17 + 34
	local var_3_5 = 0

	if arg_3_2 and #arg_3_2 > 0 then
		local var_3_6 = 17
		local var_3_7 = var_3_4 - 17 - 12

		for iter_3_0, iter_3_1 in pairs(arg_3_2) do
			local var_3_8 = string.utf8len(iter_3_1)

			if var_3_2 < var_3_8 then
				var_3_2 = var_3_8
			end

			local var_3_9 = {}

			uiutil.initWidgets(var_3_9, var_3_0)
			var_3_9.widgets.tipItem:setString(iter_3_1)
			var_3_9.widgets.tipItem:setPosition(ccp(var_3_6, var_3_7))
			arg_3_0.view.widgets.panel:addChild(var_3_9.widgets.tipItem)

			if var_3_5 < var_3_9.widgets.tipItem:getContentSize().width then
				var_3_5 = var_3_9.widgets.tipItem:getContentSize().width
			end

			var_3_7 = var_3_7 - 24 - 17
		end
	end

	log.info("@@ 文字长度 ", var_3_2)

	local var_3_10 = var_3_5 + 34

	arg_3_0.view.widgets.panel:setPreferredSize(CCSizeMake(var_3_10, var_3_4))
	arg_3_0.view.widgets.panel:registerScriptTouchHandler(var_3_1)
	arg_3_0.view.widgets.panel:setTouchEnabled(true)

	if not tolua.isnull(arg_3_1) then
		arg_3_1:addChild(arg_3_0.view.widgets.panel)
	end
end

function var_0_0.createWithStyleConf(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0:destory()

	arg_5_0.view = {}

	uiutil.initLayout(arg_5_0.view, var_0_0.layout)

	local var_5_0 = arg_5_2.name

	if arg_5_2 then
		local var_5_1 = {}

		uiutil.initWidgets(var_5_1, arg_5_2)
		arg_5_0.view.widgets.panel:addChild(var_5_1.widgets[var_5_0])
		arg_5_0.view.widgets.panel:setPreferredSize(CCSizeMake(var_5_1.widgets[var_5_0]:getContentSize().width, var_5_1.widgets[var_5_0]:getContentSize().height))
	end

	local function var_5_2(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == CCTOUCHBEGAN and not checkIfTouch(arg_5_0.view.widgets.panel, arg_6_1, arg_6_2) then
			arg_5_0:destory()
		end
	end

	arg_5_0.view.widgets.panel:registerScriptTouchHandler(var_5_2)
	arg_5_0.view.widgets.panel:setTouchEnabled(true)

	if not tolua.isnull(arg_5_1) then
		arg_5_1:addChild(arg_5_0.view.widgets.panel)
	end
end

function var_0_0.createEmpty(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	arg_7_0:destory()

	arg_7_0.view = {}

	uiutil.initLayout(arg_7_0.view, var_0_0.layout)

	local function var_7_0(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == CCTOUCHBEGAN and not checkIfTouch(arg_7_0.view.widgets.panel, arg_8_1, arg_8_2) then
			arg_7_0:destory()
		end
	end

	arg_7_0.view.widgets.panel:setPreferredSize(CCSizeMake(arg_7_2, arg_7_3))
	arg_7_0.view.widgets.panel:registerScriptTouchHandler(var_7_0)
	arg_7_0.view.widgets.panel:setTouchEnabled(true)

	if not tolua.isnull(arg_7_1) then
		arg_7_1:addChild(arg_7_0.view.widgets.panel)
	end
end

function var_0_0.addChild(arg_9_0, arg_9_1)
	if arg_9_0.view and arg_9_0.view.widgets and not tolua.isnull(arg_9_0.view.widgets.panel) and arg_9_1 then
		arg_9_0.view.widgets.panel:addChild(arg_9_1)
	end
end

function var_0_0.setPosition(arg_10_0, arg_10_1)
	if arg_10_0.view and arg_10_0.view.widgets then
		arg_10_0.view.widgets.panel:setPosition(arg_10_1)
	end
end

function var_0_0.destory(arg_11_0)
	if arg_11_0.view and arg_11_0.view.widgets and not tolua.isnull(arg_11_0.view.widgets.panel) then
		local var_11_0 = arg_11_0.view.widgets.panel:getParent()

		if not tolua.isnull(var_11_0) then
			var_11_0:removeChild(arg_11_0.view.widgets.panel, true)
		end
	end
end

return var_0_0
