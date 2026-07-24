tool = {}

function tool.traceback()
	local var_1_0 = 1

	while true do
		local var_1_1 = debug.getinfo(var_1_0, "Sl")

		if not var_1_1 then
			break
		end

		if var_1_1.what == "C" then
			log.error(var_1_0, "Cfunction")
		else
			log.error("[%s]:%d", var_1_1.short_src, var_1_1.currentline)
		end

		var_1_0 = var_1_0 + 1
	end
end

function tool.toint(arg_2_0)
	local var_2_0 = tostring(arg_2_0)
	local var_2_1, var_2_2 = var_2_0:find("%.")

	if var_2_1 then
		return tonumber(var_2_0:sub(1, var_2_1 - 1))
	else
		return arg_2_0
	end
end

function tool.tofloat(arg_3_0, arg_3_1)
	local var_3_0 = tostring(arg_3_0)
	local var_3_1, var_3_2 = var_3_0:find("%.")

	if var_3_1 then
		return tonumber(var_3_0:sub(1, var_3_1 + arg_3_1))
	else
		return arg_3_0
	end
end

function tool.spriteByName(arg_4_0)
	local var_4_0, var_4_1 = pcall(function()
		return CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(arg_4_0))
	end)

	var_4_1 = var_4_0 ~= false and var_4_1 or CCSprite:create()

	return var_4_1
end

function tool.spriteFrameByName(arg_6_0)
	local var_6_0, var_6_1 = pcall(function()
		return CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(arg_6_0)
	end)

	var_6_1 = var_6_0 ~= false and var_6_1 or CCSprite:create():displayFrame()

	return var_6_1
end

function tool.assert(arg_8_0, arg_8_1)
	if arg_8_0 ~= arg_8_1 then
		log.error("value=", arg_8_0, "excpet=", excpet)
		tool.traceback()
	end
end

function load(arg_9_0)
	package.loaded[arg_9_0] = nil

	require(arg_9_0)
end

function tool.reload()
	for iter_10_0, iter_10_1 in pairs(package.loaded) do
		if string.find(iter_10_0, "lua") then
			package.loaded[iter_10_0] = nil

			require(iter_10_0)
		end
	end

	log.debug("reload over")
end

function copy(arg_11_0)
	local var_11_0 = {}

	if type(arg_11_0) ~= "table" then
		return arg_11_0
	end

	for iter_11_0, iter_11_1 in pairs(arg_11_0) do
		var_11_0[iter_11_0] = iter_11_1
	end

	return var_11_0
end

function deepcopy(arg_12_0)
	local var_12_0 = {}

	local function var_12_1(arg_13_0)
		if type(arg_13_0) ~= "table" then
			return arg_13_0
		elseif var_12_0[arg_13_0] then
			return var_12_0[arg_13_0]
		end

		local var_13_0 = {}

		var_12_0[arg_13_0] = var_13_0

		for iter_13_0, iter_13_1 in pairs(arg_13_0) do
			var_13_0[var_12_1(iter_13_0)] = var_12_1(iter_13_1)
		end

		return setmetatable(var_13_0, getmetatable(arg_13_0))
	end

	return var_12_1(arg_12_0)
end

function verticalString(arg_14_0)
	local var_14_0 = string.len(arg_14_0)
	local var_14_1 = 1
	local var_14_2 = ""

	while var_14_1 < var_14_0 do
		local var_14_3 = string.sub(arg_14_0, var_14_1, var_14_1 + 3)

		var_14_2 = string.format("%s\n%s", var_14_2, var_14_3)
		var_14_1 = var_14_1 + 3
	end

	log.debug(arg_14_0)
	log.debug(var_14_2)

	return var_14_2
end

function tool.formatTime(arg_15_0, arg_15_1)
	if not arg_15_0 then
		return "unknow time"
	end

	local var_15_0 = math.floor(arg_15_0 / 1000)
	local var_15_1 = var_15_0 % 60
	local var_15_2 = math.floor(var_15_0 / 60)
	local var_15_3 = var_15_2 % 60
	local var_15_4 = math.floor(var_15_2 / 60)
	local var_15_5 = string.format("%02d", var_15_1)
	local var_15_6 = string.format("%02d", var_15_3)
	local var_15_7 = string.format("%02d", var_15_4)
	local var_15_8 = string.gsub(arg_15_1, "@H", var_15_7)
	local var_15_9 = string.gsub(var_15_8, "@M", var_15_6)

	return (string.gsub(var_15_9, "@S", var_15_5))
end

function tool.getHMS(arg_16_0)
	local var_16_0 = math.floor(arg_16_0 / 3600)
	local var_16_1 = math.floor((arg_16_0 - var_16_0 * 3600) / 60)
	local var_16_2 = arg_16_0 - var_16_0 * 3600 - var_16_1 * 60

	return var_16_0, var_16_1, var_16_2
end

function tool.requireRes(arg_17_0)
	require("lua/layer/" .. arg_17_0 .. "/constant")
	require("lua/layer/" .. arg_17_0 .. "/uidata")
	require("lua/layer/" .. arg_17_0 .. "/control")
end

function tool.getVisibleSize()
	return visibleSize
end

function tool.getOrigin()
	return CCDirector:sharedDirector():getVisibleOrigin()
end

function tool.ccp(...)
	return ccp(...)
end

function tool.myccp(...)
	return myccp(...)
end

function tool.notNil(arg_22_0)
	if arg_22_0 == nil then
		messageBox.error("值为空")
		tool.traceback()
	end

	return arg_22_0
end

function tool.axisGlobalToLocal(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	return ccp(arg_23_0 - arg_23_2, arg_23_1 - arg_23_3)
end

function tool.getPositionFromUpperNode(arg_24_0, arg_24_1)
	if not arg_24_0 then
		return 0, 0
	end

	local var_24_0, var_24_1 = arg_24_0:getPosition()
	local var_24_2 = arg_24_0:getParent()

	while var_24_2 and var_24_2 ~= arg_24_1 do
		local var_24_3, var_24_4 = var_24_2:getPosition()

		if not var_24_2:isIgnoreAnchorPointForPosition() then
			local var_24_5 = var_24_2:getAnchorPointInPoints()

			var_24_3 = var_24_3 - var_24_5.x
			var_24_4 = var_24_4 - var_24_5.y
		end

		var_24_0 = var_24_0 + var_24_3
		var_24_1 = var_24_1 + var_24_4
		var_24_2 = var_24_2:getParent()
	end

	return var_24_0, var_24_1
end

function tool.getPositionInScreen(arg_25_0)
	if not arg_25_0 then
		return 0, 0
	end

	local var_25_0, var_25_1 = arg_25_0:getPosition()
	local var_25_2 = arg_25_0:getParent()

	while var_25_2 do
		local var_25_3, var_25_4 = var_25_2:getPosition()

		if not var_25_2:isIgnoreAnchorPointForPosition() then
			local var_25_5 = var_25_2:getAnchorPointInPoints()

			var_25_3 = var_25_3 - var_25_5.x
			var_25_4 = var_25_4 - var_25_5.y
		end

		var_25_0 = var_25_0 + var_25_3
		var_25_1 = var_25_1 + var_25_4
		var_25_2 = var_25_2:getParent()
	end

	return var_25_0, var_25_1
end

function tool.getBoundingBoxInScreen(arg_26_0)
	local var_26_0, var_26_1 = tool.getPositionInScreen(arg_26_0)
	local var_26_2 = arg_26_0:getAnchorPointInPoints()
	local var_26_3 = var_26_0 - var_26_2.x
	local var_26_4 = var_26_1 - var_26_2.y
	local var_26_5 = arg_26_0:getContentSize().width
	local var_26_6 = arg_26_0:getContentSize().height

	return (CCRect:new(var_26_3, var_26_4, var_26_5, var_26_6))
end

function tool.checkIfTouch(arg_27_0, arg_27_1, arg_27_2)
	if not arg_27_0 then
		return false
	end

	local var_27_0, var_27_1 = tool.getPositionInScreen(arg_27_0)
	local var_27_2 = arg_27_0:getAnchorPointInPoints()
	local var_27_3 = var_27_0 - var_27_2.x
	local var_27_4 = var_27_1 - var_27_2.y
	local var_27_5 = arg_27_0:getContentSize().width
	local var_27_6 = arg_27_0:getContentSize().height

	if CCRect:new(var_27_3, var_27_4, var_27_5, var_27_6):containsPoint(ccp(arg_27_1, arg_27_2)) then
		return true
	else
		return false
	end
end

function tool.checkIfTouch2(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_0:convertToNodeSpace(ccp(arg_28_1, arg_28_2))

	if CCRectMake(0, 0, arg_28_0:getContentSize().width, arg_28_0:getContentSize().height):containsPoint(var_28_0) then
		return true
	end

	return false
end

function tool.split(arg_29_0, arg_29_1, arg_29_2)
	if string.find(arg_29_0, arg_29_1) == nil then
		return {
			arg_29_0
		}
	end

	if arg_29_2 == nil or arg_29_2 < 1 then
		arg_29_2 = 0
	end

	local var_29_0 = {}
	local var_29_1 = "(.-)" .. arg_29_1 .. "()"
	local var_29_2 = 0
	local var_29_3

	for iter_29_0, iter_29_1 in string.gfind(arg_29_0, var_29_1) do
		var_29_2 = var_29_2 + 1
		var_29_0[var_29_2] = iter_29_0
		var_29_3 = iter_29_1

		if var_29_2 == arg_29_2 then
			break
		end
	end

	if var_29_2 ~= arg_29_2 then
		var_29_0[var_29_2 + 1] = string.sub(arg_29_0, var_29_3)
	end

	return var_29_0
end

function tool.traceDict(arg_30_0, arg_30_1)
	for iter_30_0, iter_30_1 in pairs(arg_30_0) do
		log.info(arg_30_1, iter_30_0, iter_30_1)
	end
end

function tool.safeRemoveChildByTag(arg_31_0, arg_31_1)
	if arg_31_0 and not tolua.isnull(arg_31_0) then
		local var_31_0 = arg_31_0:getChildByTag(arg_31_1)

		while var_31_0 do
			arg_31_0:removeChildByTag(arg_31_1, true)

			var_31_0 = arg_31_0:getChildByTag(arg_31_1)
		end
	end
end

function tool.getAngle(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_0
	local var_32_1 = arg_32_1
	local var_32_2 = 0
	local var_32_3 = {
		x = var_32_1.x - var_32_0.x,
		y = var_32_1.y - var_32_0.y
	}

	if var_32_3.x >= 0 and var_32_3.y >= 0 then
		var_32_2 = math.deg(math.atan(var_32_3.x / var_32_3.y))
	elseif var_32_3.x >= 0 and var_32_3.y < 0 then
		var_32_2 = 90 + math.deg(math.atan(-var_32_3.y / var_32_3.x))
	elseif var_32_3.x < 0 and var_32_3.y < 0 then
		var_32_2 = 180 + math.deg(math.atan(var_32_3.x / var_32_3.y))
	elseif var_32_3.x < 0 and var_32_3.y >= 0 then
		var_32_2 = 270 + math.deg(math.atan(-var_32_3.y / var_32_3.x))
	end

	return var_32_2
end

function tool.readCookie(arg_33_0, arg_33_1)
	local var_33_0 = CCFileUtils:sharedFileUtils():getWritablePath() .. "cookies.txt"
	local var_33_1 = io.open(var_33_0, "r")
	local var_33_2

	for iter_33_0 in var_33_1:lines() do
		local var_33_3 = tool.split(iter_33_0, "\t")

		if table.getn(var_33_3) == 7 then
			local var_33_4 = var_33_3[1]
			local var_33_5 = var_33_3[6]
			local var_33_6 = var_33_3[7]

			if var_33_4 == arg_33_0 and arg_33_1 == var_33_5 then
				var_33_2 = var_33_6
			end
		end
	end

	var_33_1:close()

	return var_33_2
end

function tool.scaleTo(arg_34_0, arg_34_1, arg_34_2)
	arg_34_0:setScale(1)

	local var_34_0 = arg_34_0:getContentSize()
	local var_34_1 = arg_34_1 / var_34_0.width
	local var_34_2 = arg_34_2 / var_34_0.height

	arg_34_0:setScaleX(var_34_1)
	arg_34_0:setScaleY(var_34_2)
end

function tool.cmpVersion(arg_35_0, arg_35_1)
	local var_35_0 = tool.split(arg_35_0, "%.")
	local var_35_1 = tool.split(arg_35_1, "%.")

	if table.getn(var_35_0) ~= 4 or table.getn(var_35_1) ~= 4 then
		log.error("version file is error!!!")

		return false
	end

	for iter_35_0 = 1, 4 do
		local var_35_2 = tonumber(var_35_0[iter_35_0])
		local var_35_3 = tonumber(var_35_1[iter_35_0])

		if var_35_2 < var_35_3 then
			return true
		elseif var_35_3 < var_35_2 then
			return false
		end
	end

	return false
end

function tool.cmpVersion2(arg_36_0, arg_36_1)
	local var_36_0 = tool.split(arg_36_0, "%.")
	local var_36_1 = tool.split(arg_36_1, "%.")

	if table.getn(var_36_0) ~= 4 or table.getn(var_36_1) ~= 4 then
		log.error("version file is error!!!")

		return -1
	end

	for iter_36_0 = 1, 4 do
		local var_36_2 = tonumber(var_36_0[iter_36_0])
		local var_36_3 = tonumber(var_36_1[iter_36_0])

		if var_36_2 < var_36_3 then
			return 2
		elseif var_36_3 < var_36_2 then
			return 1
		end
	end

	return 0
end

function tool.formatBytes(arg_37_0)
	local var_37_0 = 0
	local var_37_1 = "Byte"

	if arg_37_0 > 1024 then
		var_37_0 = arg_37_0 / 1024
		var_37_1 = "KB"
	end

	if var_37_0 > 1024 then
		var_37_0 = var_37_0 / 1024
		var_37_1 = "MB"
	end

	if var_37_0 > 1024 then
		var_37_0 = var_37_0 / 1024
		var_37_1 = "GB"
	end

	local var_37_2 = var_37_0 - var_37_0 % 0.01

	return string.format("%s %s", var_37_2, var_37_1)
end

function tool.spriteToGray(arg_38_0, arg_38_1)
	local var_38_0 = GraySprite:createWithSpriteFrame(arg_38_0:displayFrame())

	var_38_0:setPosition(ccp(arg_38_0:getContentSize().width / 2, arg_38_0:getContentSize().height / 2))
	arg_38_0:addChild(var_38_0)

	if arg_38_1 then
		local var_38_1 = arg_38_0:getChildren()

		for iter_38_0 = 0, var_38_1:count() - 1 do
			if tolua.type(var_38_1:objectAtIndex(iter_38_0)) == "CCSprite" then
				tool.spriteToGray(var_38_1:objectAtIndex(iter_38_0), arg_38_1)
			end
		end
	end
end

function tool.spriteToGray2(arg_39_0, arg_39_1)
	local var_39_0 = GraySprite:createWithSpriteFrame(arg_39_0:displayFrame())

	var_39_0:setPosition(ccp(arg_39_0:getContentSize().width / 2, arg_39_0:getContentSize().height / 2))
	arg_39_0:addChild(var_39_0)

	if arg_39_1 then
		local var_39_1 = arg_39_0:getChildren()

		for iter_39_0 = 0, var_39_1:count() - 1 do
			if tolua.type(var_39_1:objectAtIndex(iter_39_0)) == "CCSprite" then
				tool.spriteToGray(var_39_1:objectAtIndex(iter_39_0), arg_39_1)
			end
		end
	end

	return var_39_0
end

function tool.showEffectShake(arg_40_0)
	if not arg_40_0 or tolua.isnull(arg_40_0) then
		return
	end

	local var_40_0 = CCArray:create()

	var_40_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_40_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_40_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_40_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_40_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_40_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_40_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_40_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_40_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_40_0:addObject(CCDelayTime:create(0.4))

	local var_40_1 = CCSequence:create(var_40_0)

	arg_40_0:stopAllActions()
	arg_40_0:runAction(CCRepeatForever:create(var_40_1))
end

function tool.hexToRgb(arg_41_0)
	if string.find(arg_41_0, "#") then
		local var_41_0 = string.sub(arg_41_0, 2, 3)
		local var_41_1 = string.sub(arg_41_0, 4, 5)
		local var_41_2 = string.sub(arg_41_0, 6, 7)

		return ccc3(tonumber(var_41_0, 16), tonumber(var_41_1, 16), tonumber(var_41_2, 16))
	end
end

function tool.urlencode(arg_42_0)
	if arg_42_0 then
		arg_42_0 = string.gsub(arg_42_0, "\n", "\r\n")
		arg_42_0 = string.gsub(arg_42_0, "([^%w ])", function(arg_43_0)
			return string.format("%%%02X", string.byte(arg_43_0))
		end)
		arg_42_0 = string.gsub(arg_42_0, " ", "+")
	end

	return arg_42_0
end

function tool.jsonToTable(arg_44_0)
	return require("lua/common/json").decode(arg_44_0)
end

function tool.tableToJson(arg_45_0)
	return require("lua/common/json").encode(arg_45_0)
end

function tool.utfstrlen(arg_46_0)
	local var_46_0 = #arg_46_0
	local var_46_1 = 0
	local var_46_2 = {
		0,
		192,
		224,
		240,
		248,
		252
	}

	while var_46_0 ~= 0 do
		local var_46_3 = string.byte(arg_46_0, -var_46_0)
		local var_46_4 = #var_46_2

		while var_46_2[var_46_4] do
			if var_46_3 >= var_46_2[var_46_4] then
				var_46_0 = var_46_0 - var_46_4

				break
			end

			var_46_4 = var_46_4 - 1
		end

		var_46_1 = var_46_1 + 1
	end

	return var_46_1
end

function handler(arg_47_0, arg_47_1)
	return function(...)
		return arg_47_1(arg_47_0, ...)
	end
end

function hex(arg_49_0)
	arg_49_0 = string.gsub(arg_49_0, "(.)", function(arg_50_0)
		return string.format("%02X", string.byte(arg_50_0))
	end)

	return arg_49_0
end

function tool.setShade(arg_51_0, arg_51_1)
	arg_51_1 = arg_51_1 or false

	local var_51_0 = CCSprite:createWithSpriteFrame(arg_51_0:displayFrame())

	var_51_0:setAnchorPoint(arg_51_0:getAnchorPoint())
	var_51_0:setPosition(ccp(arg_51_0:getPosition()))

	local var_51_1 = ccBlendFunc:new()

	var_51_1.src = GL_ZERO
	var_51_1.dst = GL_ONE_MINUS_SRC_ALPHA

	var_51_0:setBlendFunc(var_51_1)

	local var_51_2 = CCLayerColor:create(ccc4(0, 0, 0, 178.5))
	local var_51_3 = CCRenderTexture:create(visibleSize.width, visibleSize.height)

	var_51_3:setPosition(visibleSize.width / 2, visibleSize.height / 2)
	var_51_3:begin()
	var_51_2:visit()
	var_51_0:visit()
	var_51_3:endToLua()

	if arg_51_1 then
		local var_51_4 = var_51_0:boundingBox()

		var_51_3:setTouchEnabled(true)
		var_51_3:registerScriptTouchHandler(function(arg_52_0, arg_52_1, arg_52_2)
			log.info("touch", arg_52_0, arg_52_1, arg_52_2)

			if var_51_4:containsPoint(ccp(arg_52_1, arg_52_2)) then
				return false
			end

			return true
		end, false, true)
	end

	return var_51_3
end

function tool.copyDir(arg_53_0, arg_53_1)
	log.info("@@ 源目录: ", arg_53_0)
	log.info("@@ 目标目录: ", arg_53_1)

	if not string.endWith(arg_53_0, "/") then
		arg_53_0 = arg_53_0 .. "/"
	end

	if not string.endWith(arg_53_1, "/") then
		arg_53_1 = arg_53_1 .. "/"
	end

	local var_53_0 = Utils:getAllFileInPath(arg_53_0)

	if not var_53_0 then
		log.info("@@ file array is nil")

		return
	end

	log.info("@@ 复制文件数量：", var_53_0:count())

	if var_53_0 and var_53_0:count() > 0 then
		for iter_53_0 = 1, var_53_0:count() do
			local var_53_1 = tolua.cast(var_53_0:objectAtIndex(iter_53_0 - 1), "CCString"):getCString()

			if var_53_1 then
				local var_53_2 = arg_53_0 .. var_53_1
				local var_53_3 = arg_53_1 .. var_53_1

				log.info("[copy] ", var_53_2, var_53_3)

				if not Utils:MyCopyFile(var_53_2, var_53_3) then
					log.error("@@ copy file faild in update version , ", var_53_2, var_53_3)
				end
			end
		end
	end
end

function tool.clearDir(arg_54_0)
	log.info("@@ 源目录: ", arg_54_0)

	if not string.endWith(arg_54_0, "/") then
		arg_54_0 = arg_54_0 .. "/"
	end

	if not Utils:IsDirExist(arg_54_0) then
		log.info("@@ folder not exist")

		return
	end

	local var_54_0 = Utils:getAllFileInPath(arg_54_0)

	if not var_54_0 then
		log.info("@@ file array is nil")

		return
	end

	log.info("@@ 删除文件数量：", var_54_0:count())

	if var_54_0 and var_54_0:count() > 0 then
		for iter_54_0 = 1, var_54_0:count() do
			local var_54_1 = tolua.cast(var_54_0:objectAtIndex(iter_54_0 - 1), "CCString"):getCString()

			if var_54_1 then
				local var_54_2 = arg_54_0 .. var_54_1

				log.info("[remove] ", var_54_2)

				if not Utils:removeFile(var_54_2) then
					log.error("@@ remove file faild, ", var_54_2)
				end
			end
		end
	end
end

function tool.redefineCCControlButtonText(arg_55_0, arg_55_1)
	arg_55_0:setTitleForState(CCString:create(arg_55_1), CCControlStateNormal)
	arg_55_0:setTitleForState(CCString:create(arg_55_1), CCControlStateHighlighted)
	arg_55_0:setTitleForState(CCString:create(arg_55_1), CCControlStateDisabled)
	arg_55_0:setTitleForState(CCString:create(arg_55_1), CCControlStateSelected)
end

function tool.redefineCCControlButtenTextSize(arg_56_0, arg_56_1)
	arg_56_0:setTitleTTFSizeForState(arg_56_1, CCControlStateNormal)
	arg_56_0:setTitleTTFSizeForState(arg_56_1, CCControlStateHighlighted)
	arg_56_0:setTitleTTFSizeForState(arg_56_1, CCControlStateDisabled)
	arg_56_0:setTitleTTFSizeForState(arg_56_1, CCControlStateSelected)
end

math.randomseed(os.time())

function tool.random(arg_57_0, arg_57_1)
	return math.random(arg_57_0, arg_57_1)
end

function tool.reOrderNode(arg_58_0)
	local var_58_0 = arg_58_0:getChildren()

	if var_58_0 and var_58_0:count() > 0 then
		for iter_58_0 = 0, var_58_0:count() - 1 do
			local var_58_1 = tolua.cast(var_58_0:objectAtIndex(iter_58_0), "CCNode")

			arg_58_0:reorderChild(var_58_1, iter_58_0 + 1)
		end
	end
end

function tool.getFormatNum(arg_59_0)
	if type(arg_59_0) ~= "number" or type(arg_59_0) == "number" and arg_59_0 <= 0 then
		return "0"
	end

	local function var_59_0(arg_60_0)
		if arg_60_0 > math.floor(arg_60_0) then
			if arg_60_0 < 10 then
				arg_60_0 = string.format("%.1f", arg_60_0)
			else
				arg_60_0 = math.floor(arg_60_0)
			end
		end

		return arg_60_0
	end

	local var_59_1

	if arg_59_0 < 10000 then
		var_59_1 = tostring(arg_59_0)
	elseif arg_59_0 < 1000000000 then
		local var_59_2 = arg_59_0 / 10000

		var_59_1 = language.get(75021, var_59_0(var_59_2))
	else
		local var_59_3 = arg_59_0 / 100000000

		var_59_1 = language.get(75023, var_59_0(var_59_3))
	end

	return var_59_1
end

function tool.getFormatTime(arg_61_0)
	return tool.formatTime(arg_61_0, arg_61_0 > 3600000 and "@H:@M:@S" or "@M:@S")
end

function tool.getServerName(arg_62_0)
	local var_62_0 = string.match(tostring(arg_62_0), "^([^-]+)")

	if var_62_0 then
		if var_62_0 == string.match(var_62_0, "^(%w+)") then
			var_62_0 = language.get(390469, var_62_0)
		else
			local var_62_1 = string.match(var_62_0, "[^%d]+(%d+)")

			if var_62_1 and #var_62_1 == 1 then
				var_62_0 = language.get(390469, var_62_0)
			end
		end
	end

	return var_62_0
end

function tool.getRoundIcon(arg_63_0, arg_63_1)
	local var_63_0 = CCClippingNode:create()
	local var_63_1 = CCSprite:create("res/ui/common/ItemsPic/circle400.png")

	tool.scaleTo(var_63_1, arg_63_1, arg_63_1)
	var_63_0:setStencil(var_63_1)
	var_63_0:setInverted(false)
	var_63_0:setAlphaThreshold(0)
	var_63_0:addChild(arg_63_0)

	return var_63_0
end

function tool.deleteDir(arg_64_0)
	log.info("@@ 源目录: ", arg_64_0)

	if not string.endWith(arg_64_0, "/") then
		arg_64_0 = arg_64_0 .. "/"
	end

	if not Utils:IsDirExist(arg_64_0) then
		return
	end

	local var_64_0 = Utils:getAllFileInPath(arg_64_0)

	if not var_64_0 then
		log.info("@@ file array is nil")

		return
	end

	log.info("@@ 删除文件数量：", var_64_0:count())

	if var_64_0 and var_64_0:count() > 0 then
		for iter_64_0 = 1, var_64_0:count() do
			local var_64_1 = tolua.cast(var_64_0:objectAtIndex(iter_64_0 - 1), "CCString"):getCString()

			if var_64_1 then
				local var_64_2 = arg_64_0 .. var_64_1

				if not Utils:removeFile(var_64_2) then
					log.error("@@ delete file faild in update version , ", var_64_2)
				end
			end
		end
	end
end

function tool.getStringWithParams(arg_65_0, ...)
	arg_65_0 = arg_65_0 or ""

	local var_65_0 = {
		...
	}

	for iter_65_0, iter_65_1 in ipairs(var_65_0) do
		arg_65_0 = string.gsub(arg_65_0, string.format("{%d}", iter_65_0 - 1), iter_65_1)
	end

	return arg_65_0
end

function tool.fixLabelByWidth(arg_66_0, arg_66_1)
	while arg_66_1 < arg_66_0:getContentSize().width do
		if arg_66_0:getFontSize() == 1 then
			break
		end

		arg_66_0:setFontSize(arg_66_0:getFontSize() - 1)
	end
end

function tool.fixNodePosByMid(arg_67_0, arg_67_1)
	local var_67_0 = 0

	for iter_67_0, iter_67_1 in pairs(arg_67_0) do
		var_67_0 = var_67_0 + iter_67_1:getContentSize().width
	end

	local var_67_1 = arg_67_1 - var_67_0 * 0.5

	for iter_67_2, iter_67_3 in pairs(arg_67_0) do
		iter_67_3:setAnchorPoint(ccp(0, iter_67_3:getAnchorPoint().y))
		iter_67_3:setPositionX(var_67_1)

		var_67_1 = var_67_1 + iter_67_3:getContentSize().width
	end
end

function tool.createTipsFrame(arg_68_0, arg_68_1, arg_68_2, arg_68_3, arg_68_4, arg_68_5)
	local var_68_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_68_0:setContentSize(visibleSize)
	var_68_0:setTouchEnabled(true)
	var_68_0:registerScriptTouchHandler(function(arg_69_0, arg_69_1, arg_69_2)
		if arg_69_0 == CCTOUCHBEGAN then
			return true
		elseif arg_69_0 == CCTOUCHMOVED then
			return true
		elseif arg_69_0 == CCTOUCHENDED then
			var_68_0:removeFromParentAndCleanup(true)

			return true
		end
	end, false, true)
	arg_68_1:addChild(var_68_0, 60000)

	local var_68_1 = CCLabelTTF:create(arg_68_0, "Thonburi", 20)

	if var_68_1:getContentSize().width > 740 then
		var_68_1:setDimensions(CCSizeMake(740, 0))
	end

	var_68_1:setHorizontalAlignment(kCCTextAlignmentLeft)
	var_68_1:setVerticalAlignment(kCCVerticalTextAlignmentTop)

	local var_68_2 = CCScale9Sprite:createWithSpriteFrameName("common_tip_frame_small.png", CCRectMake(24, 24, 1, 1))

	var_68_2:setPreferredSize(CCSizeMake(var_68_1:getContentSize().width + 25, var_68_1:getContentSize().height + 20))
	var_68_1:setAnchorPoint(arg_68_3)
	var_68_1:setPosition(ccp(10, var_68_2:getContentSize().height - 10))
	var_68_2:setAnchorPoint(arg_68_4)

	if arg_68_5 then
		var_68_2:setPosition(arg_68_5)
	else
		var_68_2:setPosition(tool.getPositionInScreen(arg_68_2))
	end

	var_68_2:addChild(var_68_1)
	var_68_0:addChild(var_68_2)
end

function tool.getChineseNum(arg_70_0)
	local var_70_0 = arg_70_0

	if arg_70_0 == 1 then
		var_70_0 = "一"
	elseif arg_70_0 == 2 then
		var_70_0 = "二"
	elseif arg_70_0 == 3 then
		var_70_0 = "三"
	elseif arg_70_0 == 4 then
		var_70_0 = "四"
	elseif arg_70_0 == 5 then
		var_70_0 = "五"
	elseif arg_70_0 == 6 then
		var_70_0 = "六"
	elseif arg_70_0 == 7 then
		var_70_0 = "七"
	elseif arg_70_0 == 8 then
		var_70_0 = "八"
	elseif arg_70_0 == 9 then
		var_70_0 = "九"
	elseif arg_70_0 == 10 then
		var_70_0 = "十"
	end

	return var_70_0
end

function tool.getPosTransparentCheck(arg_71_0, arg_71_1)
	local var_71_0, var_71_1 = tool.getPositionInScreen(arg_71_0)

	return (ccp(arg_71_1.x - var_71_0, arg_71_1.y - var_71_1))
end

return tool
