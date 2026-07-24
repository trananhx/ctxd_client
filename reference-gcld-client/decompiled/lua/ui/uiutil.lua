uiutil = {}
uiutil.reuseableUI = {}

local var_0_0 = require("lua/component/Node")
local var_0_1 = require("lua/component/Label")
local var_0_2 = require("lua/component/Layer")
local var_0_3 = require("lua/component/LayerColor")
local var_0_4 = require("lua/component/Sprite")
local var_0_5 = require("lua/component/Sprite9")
local var_0_6 = require("lua/component/Sprite9Tips")
local var_0_7 = require("lua/component/LuaButton")
local var_0_8 = require("lua/component/Button")
local var_0_9 = require("lua/component/EditBox")
local var_0_10 = require("lua/component/Progressbar")
local var_0_11 = require("lua/component/TabView")
local var_0_12 = require("lua/component/RichLabel")
local var_0_13 = require("lua/component/AtlasLabel")
local var_0_14 = require("lua/component/LabelTimer")
local var_0_15 = require("lua/component/ScrollView")
local var_0_16 = require("lua/component/TableView")
local var_0_17 = require("lua/component/RichLine")

function uiutil.initUIComponent(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0
	local var_1_1 = false
	local var_1_2 = arg_1_2

	var_1_2.zorder = var_1_2.zorder or 0
	var_1_2.tag = var_1_2.tag or 0

	if arg_1_1 and var_1_2.renderHandler ~= nil then
		arg_1_1[var_1_2.renderHandler](arg_1_2)
	end

	if var_1_2.noRender then
		return
	end

	if var_1_2.type == "node" then
		var_1_0 = var_0_0.create(var_1_2)
	elseif var_1_2.type == "layer" then
		var_1_0 = var_0_2.create(var_1_2)
	elseif var_1_2.type == "layerColor" then
		var_1_0 = var_0_3.create(var_1_2)
	elseif var_1_2.type == "label" then
		var_1_0 = var_0_1.create(var_1_2)
	elseif var_1_2.type == "sprite" then
		var_1_0 = var_0_4.create(var_1_2)
	elseif var_1_2.type == "sprite9" then
		var_1_0 = var_0_5.create(var_1_2)
	elseif var_1_2.type == "sprite9Tips" then
		local var_1_3 = {}

		if var_1_2.content then
			for iter_1_0, iter_1_1 in pairs(var_1_2.content) do
				var_1_3[#var_1_3 + 1] = uiutil.initUIComponent(nil, arg_1_1, iter_1_1):getDisplayObj()
			end
		end

		var_1_0 = var_0_6.create(var_1_2, var_1_3)
	elseif var_1_2.type == "editBox" then
		var_1_0 = var_0_9.create(var_1_2)
	elseif var_1_2.type == "button" then
		if var_1_2.label then
			local var_1_4 = {}
			local var_1_5 = uiutil.initUIComponent(nil, arg_1_1, var_1_2.label)

			var_1_0 = var_0_8.create(var_1_2, var_1_5.displayObj)
		else
			var_1_0 = var_0_8.create(var_1_2)
		end
	elseif var_1_2.type == "progressbar" then
		var_1_0 = var_0_10.create(var_1_2)
	elseif var_1_2.type == "tabView" then
		var_1_0 = var_0_11.create(var_1_2)
	elseif var_1_2.type == "richLabel" then
		var_1_0 = var_0_12.create(var_1_2)
	elseif var_1_2.type == "atlaslabel" then
		var_1_0 = var_0_13.create(var_1_2)
	elseif var_1_2.type == "labelTimer" then
		var_1_0 = var_0_14.create(var_1_2)
	elseif var_1_2.type == "scrollview" then
		local var_1_6

		if var_1_2.layer then
			var_1_6 = uiutil.initUIComponent(nil, arg_1_1, var_1_2.layer)
		end

		var_1_0 = var_0_15.create(var_1_2, var_1_6)
	elseif var_1_2.type == "TableView" then
		var_1_0 = var_0_16.create(var_1_2)
	elseif var_1_2.type == "menu" then
		var_1_0 = var_0_7.create(var_1_2)

		if arg_1_1 and var_1_2.name ~= nil then
			arg_1_1[var_1_2.name] = var_1_0:getButtonObj()
			arg_1_1[var_1_2.name .. "_menu"] = var_1_0:getDisplayObj()
			var_1_1 = true
		end
	elseif var_1_2.type == "richLine" then
		local var_1_7 = {}

		for iter_1_2, iter_1_3 in pairs(var_1_2.content) do
			var_1_7[#var_1_7 + 1] = uiutil.initUIComponent(nil, arg_1_1, iter_1_3):getDisplayObj()
		end

		var_1_0 = var_0_17.create(var_1_7, var_1_2)
	end

	if var_1_0 == nil then
		return var_1_0
	end

	if var_1_2.children ~= nil then
		for iter_1_4, iter_1_5 in pairs(var_1_2.children) do
			uiutil.initUIComponent(var_1_0:getDisplayObj(), arg_1_1, iter_1_5)
		end
	end

	if arg_1_1 and var_1_2.name ~= nil and not var_1_1 then
		arg_1_1[var_1_2.name] = var_1_0:getDisplayObj()
	end

	if arg_1_0 then
		var_1_0:addToParent(arg_1_0, var_1_2.zorder, var_1_2.tag)
	end

	return var_1_0
end

function uiutil.initUI(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_1.type ~= nil then
		uiutil.initUIComponent(arg_2_2, arg_2_0, arg_2_1)

		return
	end

	for iter_2_0, iter_2_1 in pairs(arg_2_1) do
		iter_2_1.name = iter_2_0

		uiutil.initUIComponent(arg_2_2, arg_2_0, iter_2_1)
	end
end

function uiutil.initLayout(arg_3_0, arg_3_1)
	if not arg_3_1 then
		return
	end

	if arg_3_1.parent then
		arg_3_0.parent = smgr.getLayer(arg_3_1.parent)
	end

	arg_3_0.widgets = arg_3_0.widgets or {}

	for iter_3_0 = 1, #arg_3_1.widgets do
		uiutil.initUIComponent(arg_3_0.parent, arg_3_0.widgets, arg_3_1.widgets[iter_3_0])
	end

	if arg_3_1.background then
		local var_3_0 = smgr.getLayer("background")

		arg_3_0.background = {}

		uiutil.initUIComponent(arg_3_0.background, arg_3_1.background, var_3_0)
	end
end

function uiutil.initWidgets(arg_4_0, arg_4_1)
	if not arg_4_1 then
		return
	end

	arg_4_0.widgets = arg_4_0.widgets or {}

	uiutil.initUIComponent(nil, arg_4_0.widgets, arg_4_1)
end
