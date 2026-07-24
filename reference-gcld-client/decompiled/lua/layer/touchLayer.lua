require("lua/common/eventManager")

local var_0_0 = {}

touchLayer = {}
touchLayer.dir = {
	move_left = "in_move_left",
	up = "touch_move_up",
	down = "touch_move_down",
	has_moved = "has_moved",
	move_right = "in_move_right",
	left = "touch_move_left",
	right = "touch_move_right"
}

local var_0_1 = 200
local var_0_2 = 20
local var_0_3 = 20

local function var_0_4(arg_1_0, arg_1_1)
	eventManager.dispatchEvent("globalOnTouchBegan", arg_1_0, arg_1_1)

	var_0_0.startPos = ccp(arg_1_0, arg_1_1)
	var_0_0.movePos = nil

	if touchLayer.parentControl ~= nil and touchLayer.parentControl.onTouchBegan then
		touchLayer.parentControl.onTouchBegan(arg_1_0, arg_1_1)
	end

	return true
end

local function var_0_5(arg_2_0, arg_2_1)
	eventManager.dispatchEvent("globalOnTouchMoved", arg_2_0, arg_2_1)

	if var_0_0.movePos then
		local var_2_0 = var_0_0.movePos
		local var_2_1 = ccp(arg_2_0, arg_2_1)

		if ccpDistance(var_2_0, var_2_1) > var_0_2 then
			var_0_0.movePos = ccp(arg_2_0, arg_2_1)

			local var_2_2 = 0
			local var_2_3 = {
				x = var_2_1.x - var_2_0.x,
				y = var_2_1.y - var_2_0.y
			}

			if var_2_3.x >= 0 and var_2_3.y >= 0 then
				var_2_2 = math.deg(math.atan(var_2_3.x / var_2_3.y))
			elseif var_2_3.x >= 0 and var_2_3.y < 0 then
				var_2_2 = 90 + math.deg(math.atan(-var_2_3.y / var_2_3.x))
			elseif var_2_3.x < 0 and var_2_3.y < 0 then
				var_2_2 = 180 + math.deg(math.atan(var_2_3.x / var_2_3.y))
			elseif var_2_3.x < 0 and var_2_3.y >= 0 then
				var_2_2 = 270 + math.deg(math.atan(-var_2_3.y / var_2_3.x))
			end

			if var_2_2 > 45 and var_2_2 < 135 then
				log.debug("右")
				eventManager.dispatchEvent(touchLayer.dir.move_right, math.abs(var_2_0.x - var_2_1.x))
			elseif var_2_2 > 225 and var_2_2 < 315 then
				log.debug("左")
				eventManager.dispatchEvent(touchLayer.dir.move_left, math.abs(var_2_0.x - var_2_1.x))
			end
		end
	else
		var_0_0.movePos = ccp(arg_2_0, arg_2_1)
	end

	if touchLayer.parentControl ~= nil and touchLayer.parentControl.onTouchMoved then
		touchLayer.parentControl.onTouchMoved(arg_2_0, arg_2_1)
	end
end

local function var_0_6(arg_3_0, arg_3_1)
	eventManager.dispatchEvent("globalOnTouchEnded", arg_3_0, arg_3_1)
	eventManager.dispatchEvent("tapOnScreen", arg_3_0, arg_3_1)

	var_0_0.endPos = ccp(arg_3_0, arg_3_1)
	var_0_0.movePos = nil

	local var_3_0 = var_0_0.startPos
	local var_3_1 = var_0_0.endPos

	if var_3_0 == nil or var_3_1 == nil then
		return
	end

	local var_3_2 = ccpDistance(var_3_0, var_3_1)

	if var_3_2 > var_0_2 and math.abs(var_3_1.x - var_3_0.x) > var_0_2 then
		eventManager.dispatchEvent(touchLayer.dir.has_moved)
	end

	if var_3_2 < var_0_1 then
		if var_3_2 < var_0_3 and touchLayer.parentControl ~= nil and touchLayer.parentControl.onTouchEnded then
			touchLayer.parentControl.onTouchEnded(arg_3_0, arg_3_1)
		end

		return
	end

	local var_3_3 = 0
	local var_3_4 = {
		x = var_3_1.x - var_3_0.x,
		y = var_3_1.y - var_3_0.y
	}

	if var_3_4.x >= 0 and var_3_4.y >= 0 then
		var_3_3 = math.deg(math.atan(var_3_4.x / var_3_4.y))
	elseif var_3_4.x >= 0 and var_3_4.y < 0 then
		var_3_3 = 90 + math.deg(math.atan(-var_3_4.y / var_3_4.x))
	elseif var_3_4.x < 0 and var_3_4.y < 0 then
		var_3_3 = 180 + math.deg(math.atan(var_3_4.x / var_3_4.y))
	elseif var_3_4.x < 0 and var_3_4.y >= 0 then
		var_3_3 = 270 + math.deg(math.atan(-var_3_4.y / var_3_4.x))
	end

	if var_3_3 > 315 and var_3_3 < 360 or var_3_3 >= 0 and var_3_3 < 45 then
		log.debug("上")
		eventManager.dispatchEvent(touchLayer.dir.up)
	elseif var_3_3 > 45 and var_3_3 < 135 then
		log.debug("右")
		eventManager.dispatchEvent(touchLayer.dir.right)
	elseif var_3_3 > 135 and var_3_3 < 225 then
		log.debug("下")
		eventManager.dispatchEvent(touchLayer.dir.down)
	elseif var_3_3 > 225 and var_3_3 < 315 then
		log.debug("左")
		eventManager.dispatchEvent(touchLayer.dir.left)
	end

	var_0_0 = {}
end

local function var_0_7(arg_4_0, arg_4_1)
	eventManager.dispatchEvent("globalOnTouchCancelled", arg_4_0, arg_4_1)
end

local function var_0_8(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_0 == CCTOUCHBEGAN then
		return var_0_4(arg_5_1, arg_5_2)
	elseif arg_5_0 == CCTOUCHMOVED then
		return var_0_5(arg_5_1, arg_5_2)
	elseif arg_5_0 == CCTOUCHENDED then
		return var_0_6(arg_5_1, arg_5_2)
	elseif arg_5_0 == CCTOUCHCANCELLED then
		return var_0_7(arg_5_1, arg_5_2)
	end
end

function createTouchLayer(arg_6_0)
	touchLayer.parentControl = arg_6_0

	local var_6_0 = CCLayer:create()

	var_6_0:registerScriptTouchHandler(var_0_8)
	var_6_0:setTouchEnabled(true)

	return var_6_0
end
