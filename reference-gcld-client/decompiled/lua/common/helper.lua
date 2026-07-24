function CC_CONTENT_SCALE_FACTOR()
	return CCDirector:sharedDirector():getContentScaleFactor()
end

function CC_POINT_PIXELS_TO_POINTS(arg_2_0)
	return ccp(arg_2_0.x / CC_CONTENT_SCALE_FACTOR(), arg_2_0.y / CC_CONTENT_SCALE_FACTOR())
end

function CC_POINT_POINTS_TO_PIXELS(arg_3_0)
	return ccp(arg_3_0.x * CC_CONTENT_SCALE_FACTOR(), arg_3_0.y * CC_CONTENT_SCALE_FACTOR())
end

visibleSize = CCDirector:sharedDirector():getVisibleSize()

function autoPosition(arg_4_0, arg_4_1)
	return CCPoint(arg_4_0, arg_4_1)
end

function autoPositionX(arg_5_0)
	return arg_5_0
end

function autoPositionY(arg_6_0)
	return arg_6_0
end

function myccp(arg_7_0, arg_7_1)
	return ccp(arg_7_0, visibleSize.height - arg_7_1)
end

function cccp(arg_8_0, arg_8_1, arg_8_2)
	return ccp(arg_8_0, arg_8_2 - arg_8_1)
end

function showTable(arg_9_0)
	if conf.debug == true then
		log.info("@@@@@@@@@@@@@@@@@@@@@")

		local var_9_0 = require("lua/common/json")

		log.info(var_9_0.encode(arg_9_0))
		log.info("@@@@@@@@@@@@@@@@@@@@@")
	end
end

function stringSplit(arg_10_0, arg_10_1)
	local var_10_0 = {}

	while true do
		local var_10_1 = string.find(arg_10_0, arg_10_1)

		if not var_10_1 then
			var_10_0[#var_10_0 + 1] = arg_10_0

			break
		end

		local var_10_2 = string.sub(arg_10_0, 1, var_10_1 - 1)

		var_10_0[#var_10_0 + 1] = var_10_2
		arg_10_0 = string.sub(arg_10_0, var_10_1 + 1, #arg_10_0)
	end

	return var_10_0
end

function getBuildingCoordByPos(arg_11_0)
	local var_11_0 = 485.5
	local var_11_1 = 162.5

	if tonumber(arg_11_0) > 0 and tonumber(arg_11_0) <= 4 then
		var_11_0 = var_11_0 + (arg_11_0 - 1) * autoPositionX(110)
		var_11_1 = var_11_1 + (arg_11_0 - 1) * autoPositionY(50)
	elseif arg_11_0 > 4 and arg_11_0 <= 8 then
		var_11_0 = var_11_0 - autoPositionX(110) + (arg_11_0 - 5) * autoPositionX(110)
		var_11_1 = var_11_1 + autoPositionY(50) + (arg_11_0 - 5) * autoPositionY(50)
	elseif arg_11_0 > 8 and arg_11_0 <= 12 then
		var_11_0 = var_11_0 - 2 * autoPositionX(110) + (arg_11_0 - 9) * autoPositionX(110)
		var_11_1 = var_11_1 + 2 * autoPositionY(50) + (arg_11_0 - 9) * autoPositionY(50)
	elseif arg_11_0 > 12 and arg_11_0 <= 16 then
		var_11_0 = var_11_0 - 3 * autoPositionX(110) + (arg_11_0 - 13) * autoPositionX(110)
		var_11_1 = var_11_1 + 3 * autoPositionY(50) + (arg_11_0 - 13) * autoPositionY(50)
	end

	return var_11_0, visibleSize.height - var_11_1
end

function createBaseLayer()
	local var_12_0 = CCLayer:create()

	local function var_12_1(arg_13_0)
		if arg_13_0 == "enter" then
			if var_12_0.onEnter then
				var_12_0:onEnter()
			end
		elseif arg_13_0 == "exit" and var_12_0.onExit then
			var_12_0:onExit()
		end
	end

	var_12_0:registerScriptHandler(var_12_1)

	return var_12_0
end

BaseLayOutLayer = class("BaseLayOutLayer", function()
	return createBaseLayer()
end)

function BaseLayOutLayer.ctor(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.initCCSFinished = false

	arg_15_0:setLayoutData(arg_15_1)

	arg_15_0.callBackFunc = arg_15_2

	arg_15_0:_init()
end

function BaseLayOutLayer.setLayoutData(arg_16_0, arg_16_1)
	arg_16_0._layoutData = arg_16_1
end

function BaseLayOutLayer._init(arg_17_0)
	arg_17_0:removeAllChildrenWithCleanup(true)

	arg_17_0.initCCSFinished = false

	uiutil.initWidgets(arg_17_0, arg_17_0._layoutData or {})

	if arg_17_0.widgets.root then
		arg_17_0:addChild(arg_17_0.widgets.root)
	else
		log.info("rootNode name error")

		return
	end

	if arg_17_0.callBackFunc then
		arg_17_0.callBackFunc()
	end

	arg_17_0.initCCSFinished = true
end

function BaseLayOutLayer.reloadLayer(arg_18_0)
	arg_18_0:_init()
end

LayoutNode = class("LayoutNode", function()
	return CCNode:create()
end)

function LayoutNode.ctor(arg_20_0)
	return
end

function LayoutNode.getWidget(arg_21_0, arg_21_1)
	if arg_21_0._widgets then
		return arg_21_0._widgets[arg_21_1]
	else
		return nil
	end
end

function LayoutNode.setLoadFunc(arg_22_0, arg_22_1)
	arg_22_0._callback = arg_22_1
end

function LayoutNode.reload(arg_23_0, arg_23_1)
	if arg_23_1 then
		arg_23_0:_setLayoutData(arg_23_1)
	end

	arg_23_0:_unloadLayout()
	arg_23_0:_loadLayout()
end

function LayoutNode.onLoadLayout(arg_24_0)
	if arg_24_0._callback then
		arg_24_0._callback()
	end
end

function LayoutNode._setLayoutData(arg_25_0, arg_25_1)
	arg_25_0._layoutData = arg_25_1
end

function LayoutNode._loadLayout(arg_26_0)
	arg_26_0._widgets = arg_26_0._widgets or {}
	arg_26_0._initCCSFinished = false

	if tolua.isnull(arg_26_0._rootNode) then
		arg_26_0._rootNode = CCNode:create()

		arg_26_0:addChild(arg_26_0._rootNode)
	end

	uiutil.initUIComponent(arg_26_0._rootNode, arg_26_0._widgets, arg_26_0._layoutData or {})
	arg_26_0:onLoadLayout()

	arg_26_0._initCCSFinished = true
end

function LayoutNode._unloadLayout(arg_27_0)
	if arg_27_0._widgets and not tolua.isnull(arg_27_0._rootNode) then
		arg_27_0._rootNode:removeAllChildrenWithCleanup(true)

		arg_27_0._widgets = nil
	end
end

function initScriptEventNode(arg_28_0)
	if not arg_28_0 then
		return
	end

	local function var_28_0(arg_29_0)
		if arg_29_0 == "enter" then
			if arg_28_0.onEnter then
				arg_28_0:onEnter()
			end
		elseif arg_29_0 == "exit" and arg_28_0.onExit then
			arg_28_0:onExit()
		end
	end

	arg_28_0:registerScriptHandler(var_28_0)
end

function moveFile(arg_30_0, arg_30_1)
	local var_30_0 = string.format("mv -f \"%s\" \"%s\"", arg_30_0, arg_30_1)
	local var_30_1 = os.execute(var_30_0)

	if var_30_1 ~= 0 then
		log.error(string.format("@@@ move file %s to %s result is %s ", arg_30_0, arg_30_1, var_30_1))

		return false
	end

	return true
end

function dump(arg_31_0, arg_31_1, arg_31_2)
	if type(arg_31_2) ~= "number" then
		arg_31_2 = 3
	end

	local var_31_0 = {}
	local var_31_1 = {}

	local function var_31_2(arg_32_0)
		if type(arg_32_0) == "string" then
			arg_32_0 = "\"" .. arg_32_0 .. "\""
		end

		return tostring(arg_32_0)
	end

	local var_31_3 = string.split(debug.traceback("", 2), "\n")

	log.debug("dump from: " .. string.trim(var_31_3[2]))

	local function var_31_4(arg_33_0, arg_33_1, arg_33_2, arg_33_3, arg_33_4)
		arg_33_1 = arg_33_1 or "<var>"
		spc = ""

		if type(arg_33_4) == "number" then
			spc = string.rep(" ", arg_33_4 - string.len(var_31_2(arg_33_1)))
		end

		if type(arg_33_0) ~= "table" then
			var_31_1[#var_31_1 + 1] = string.format("%s%s%s = %s", arg_33_2, var_31_2(arg_33_1), spc, var_31_2(arg_33_0))
		elseif var_31_0[arg_33_0] then
			var_31_1[#var_31_1 + 1] = string.format("%s%s%s = *REF*", arg_33_2, arg_33_1, spc)
		else
			var_31_0[arg_33_0] = true

			if arg_33_3 > arg_31_2 then
				var_31_1[#var_31_1 + 1] = string.format("%s%s = *MAX NESTING*", arg_33_2, arg_33_1)
			else
				var_31_1[#var_31_1 + 1] = string.format("%s%s = {", arg_33_2, var_31_2(arg_33_1))

				local var_33_0 = arg_33_2 .. "    "
				local var_33_1 = {}
				local var_33_2 = 0
				local var_33_3 = {}

				for iter_33_0, iter_33_1 in pairs(arg_33_0) do
					var_33_1[#var_33_1 + 1] = iter_33_0

					local var_33_4 = var_31_2(iter_33_0)
					local var_33_5 = string.len(var_33_4)

					if var_33_2 < var_33_5 then
						var_33_2 = var_33_5
					end

					var_33_3[iter_33_0] = iter_33_1
				end

				table.sort(var_33_1, function(arg_34_0, arg_34_1)
					if type(arg_34_0) == "number" and type(arg_34_1) == "number" then
						return arg_34_0 < arg_34_1
					else
						return tostring(arg_34_0) < tostring(arg_34_1)
					end
				end)

				for iter_33_2, iter_33_3 in ipairs(var_33_1) do
					var_31_4(var_33_3[iter_33_3], iter_33_3, var_33_0, arg_33_3 + 1, var_33_2)
				end

				var_31_1[#var_31_1 + 1] = string.format("%s}", arg_33_2)
			end
		end
	end

	var_31_4(arg_31_0, arg_31_1, "- ", 1)

	for iter_31_0, iter_31_1 in ipairs(var_31_1) do
		log.info(iter_31_1)
	end
end

function showFpsStats(arg_35_0)
	if conf.debug == true then
		CCDirector:sharedDirector():setDisplayStats(arg_35_0)
	end
end
