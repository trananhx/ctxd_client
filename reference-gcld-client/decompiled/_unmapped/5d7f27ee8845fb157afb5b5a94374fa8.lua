require("lua/component/timerLabel")
require("lua/component/CCNumberSprite")

marketControl = {}

local var_0_0 = marketControl

var_0_0.buyCountMax = 25
var_0_0.currentBuyCount = 0
var_0_0.godsInfo = {}
var_0_0.isFlip = false
var_0_0.cityId = 0

local function var_0_1(arg_1_0)
	if arg_1_0.action.state == 1 then
		local var_1_0 = arg_1_0.action.data

		user.welfare.setWelfare("marketCanBuyNum", var_1_0.nowBuyNum)
		;(function()
			local function var_2_0(arg_3_0)
				local function var_3_0(arg_4_0)
					local var_4_0 = {
						["0"] = 0,
						C = 12,
						B = 11,
						["2"] = 2,
						["7"] = 7,
						["3"] = 4,
						F = 15,
						D = 13,
						E = 14,
						A = 10,
						["6"] = 6,
						["9"] = 9,
						["5"] = 5,
						["1"] = 1,
						["8"] = 8,
						["4"] = 4
					}
					local var_4_1 = tostring(var_4_0[string.sub(arg_4_0, 1, 1)])
					local var_4_2 = tostring(var_4_0[string.sub(arg_4_0, 2, 2)])
					local var_4_3 = tostring(var_4_0[string.sub(arg_4_0, 3, 3)])
					local var_4_4 = tostring(var_4_0[string.sub(arg_4_0, 4, 4)])
					local var_4_5 = tostring(var_4_0[string.sub(arg_4_0, 5, 5)])
					local var_4_6 = tostring(var_4_0[string.sub(arg_4_0, 6, 6)])

					return var_4_1 * 16 + var_4_2, var_4_3 * 16 + var_4_4, var_4_5 * 16 + var_4_6
				end

				local var_3_1 = 0
				local var_3_2 = 0
				local var_3_3 = 0
				local var_3_4 = string.find(arg_3_0, "#", 0)
				local var_3_5 = string.find(arg_3_0, ">", var_3_4)

				if var_3_4 ~= nil then
					var_3_1, var_3_2, var_3_3 = var_3_0(string.sub(arg_3_0, var_3_4 + 1, var_3_4 + 6))

					local var_3_6 = string.find(arg_3_0, "#", var_3_4 + 1)

					if var_3_6 ~= nil then
						local var_3_7 = string.find(arg_3_0, "<", var_3_6 + 1)
						local var_3_8 = string.find(arg_3_0, "▪", var_3_7 + 1)

						arg_3_0 = string.sub(arg_3_0, 1, var_3_5 + 3) .. string.sub(arg_3_0, var_3_8)
					end
				end

				local var_3_9 = string.find(arg_3_0, "<", var_3_5)
				local var_3_10 = string.find(arg_3_0, ">", var_3_9)

				return var_3_1, var_3_2, var_3_3, string.sub(arg_3_0, var_3_5 + 1, var_3_9 - 1), string.sub(arg_3_0, var_3_10 + 1)
			end

			local function var_2_1(arg_5_0, arg_5_1)
				local function var_5_0(arg_6_0)
					local var_6_0 = arg_6_0:getPositionX()
					local var_6_1 = arg_6_0:getPositionY()

					arg_6_0:setPosition(ccp(var_6_0, var_6_1 - 100))
				end

				local var_5_1 = arg_5_0:getPositionX()
				local var_5_2 = arg_5_0:getPositionY()
				local var_5_3 = CCShow:create()
				local var_5_4 = CCDelayTime:create(2)
				local var_5_5 = CCHide:create()
				local var_5_6 = CCMoveTo:create(3, ccp(var_5_1, var_5_2 + 100))
				local var_5_7 = CCArray:create()

				var_5_7:addObject(var_5_3)
				var_5_7:addObject(var_5_4)
				var_5_7:addObject(var_5_5)

				local var_5_8 = CCSequence:create(var_5_7)
				local var_5_9 = CCSpawn:createWithTwoActions(var_5_8, var_5_6)
				local var_5_10 = CCDelayTime:create(arg_5_1)
				local var_5_11 = CCCallFuncN:create(var_5_0)
				local var_5_12 = CCDelayTime:create(8)
				local var_5_13 = CCArray:create()

				var_5_13:addObject(var_5_9)
				var_5_13:addObject(var_5_11)
				var_5_13:addObject(var_5_12)

				local var_5_14 = CCSequence:create(var_5_13)
				local var_5_15 = CCRepeat:create(tolua.cast(var_5_14, "CCActionInterval"), 100)
				local var_5_16 = CCArray:create()

				var_5_16:addObject(var_5_10)
				var_5_16:addObject(var_5_15)

				local var_5_17 = CCSequence:create(var_5_16)

				arg_5_0:setVisible(false)
				arg_5_0:runAction(var_5_17)
			end

			for iter_2_0, iter_2_1 in pairs(var_1_0.forcast) do
				local var_2_2, var_2_3, var_2_4, var_2_5, var_2_6 = var_2_0(iter_2_1.content)
				local var_2_7 = marketUI.uiTable["label_name" .. iter_2_0]
				local var_2_8 = marketUI.uiTable["label_text" .. iter_2_0]

				var_2_7:stopAllActions()
				var_2_8:stopAllActions()
				var_2_7:setString(var_2_5)
				var_2_8:setString(var_2_6)

				local var_2_9 = var_2_7:getContentSize()

				var_2_7:setPosition(ccp(10 + var_2_9.width / 2, 15))
				var_2_7:setColor(ccc3(var_2_2, var_2_3, var_2_4))

				local var_2_10 = var_2_8:getContentSize()

				var_2_8:setPosition(ccp(10 + var_2_9.width + var_2_10.width / 2 + 5, 15))
				var_2_1(var_2_7, 0.8 * iter_2_0)
				var_2_1(var_2_8, 0.8 * iter_2_0)
			end
		end)()

		local function var_1_1()
			if var_1_0.specialCities == nil then
				marketUI.uiTable.chengchi:setVisible(false)
				marketUI.uiTable.zhanling:setVisible(false)
				marketUI.uiTable.cityName:setVisible(false)
				marketUI.uiTable.goumailiangfanbei:setVisible(false)
				marketUI.uiTable.go_btn:setVisible(false)
				marketUI.uiTable.go_label:setVisible(false)
			else
				marketUI.uiTable.cityName:setString(var_1_0.specialCities[1].cityName)

				var_0_0.cityId = var_1_0.specialCities[1].cityId

				if var_1_0.specialCities[1].hasSpecialCity == 0 then
					marketUI.uiTable.chengchi:setDisplayFrame(tool.spriteFrameByName("chengchi.png"))
					marketUI.uiTable.zhanling:setString(language.get(72002))
					marketUI.uiTable.zhanling:setHorizontalAlignment(1)
					marketUI.uiTable.chengchi:setVisible(true)
					marketUI.uiTable.zhanling:setVisible(true)
					marketUI.uiTable.cityName:setVisible(true)
					marketUI.uiTable.goumailiangfanbei:setVisible(true)
					marketUI.uiTable.go_btn:setVisible(true)
					marketUI.uiTable.go_label:setVisible(true)
				else
					marketUI.uiTable.chengchi:setDisplayFrame(tool.spriteFrameByName("chengchi1.png"))
					marketUI.uiTable.zhanling:setString(language.get(72010))

					if conf.language == "kr" then
						marketUI.uiTable.zhanling:setDimensions(CCSizeMake(80, 30))
					end

					marketUI.uiTable.zhanling:setHorizontalAlignment(2)
					marketUI.uiTable.chengchi:setVisible(true)
					marketUI.uiTable.zhanling:setVisible(true)
					marketUI.uiTable.cityName:setVisible(false)
					marketUI.uiTable.goumailiangfanbei:setVisible(false)
					marketUI.uiTable.go_btn:setVisible(false)
					marketUI.uiTable.go_label:setVisible(false)
				end
			end

			if user.kbLv >= 1 then
				marketUI.uiTable.chengchi:setVisible(false)
				marketUI.uiTable.zhanling:setVisible(false)
				marketUI.uiTable.cityName:setVisible(false)
				marketUI.uiTable.goumailiangfanbei:setVisible(false)
				marketUI.uiTable.go_btn:setVisible(false)
				marketUI.uiTable.go_label:setVisible(false)
				marketUI.uiTable.chengchi:setVisible(true)
				marketUI.uiTable.chengchi:setDisplayFrame(tool.spriteFrameByName("chengchi1.png"))
				marketUI.uiTable.zhanling:setVisible(true)
				marketUI.uiTable.zhanling:setString(language.get("speicalBuffInfo1"))
				marketUI.uiTable.zhanling:setPositionX(200)
				marketUI.uiTable.go_label:setVisible(true)
				marketUI.uiTable.go_label:setString(language.get("speicalBuffInfo2"))
				marketUI.uiTable.go_label:setPositionX(270)
			end
		end

		local function var_1_2()
			marketUI.uiTable.currentBuyCount:setString(tostring(var_1_0.nowBuyNum) .. "/" .. tostring(var_1_0.maxBuyNum))
			marketUI.uiTable.currentBuyCycle:setString(tostring(var_1_0.cycle))
			marketUI.uiTable.currentReflashCount:getChildByTag(marketConstant.TIME_TAG):setTime(var_1_0.refreshCD)

			for iter_8_0, iter_8_1 in pairs(var_1_0.products) do
				marketUI.uiTable["tip_" .. iter_8_0 .. "1"]:setString("")
				marketUI.uiTable["tip_" .. iter_8_0 .. "2"]:setString("")

				if iter_8_1.itemType == "lumber" then
					marketUI.uiTable["title_" .. iter_8_0 .. "1"]:setString(language.get(10102) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["title_" .. iter_8_0 .. "2"]:setString(language.get(10102) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["icon_" .. iter_8_0 .. "1"]:setDisplayFrame(tool.spriteFrameByName("mucai.jpg"))
					marketUI.uiTable["icon_" .. iter_8_0 .. "2"]:setDisplayFrame(tool.spriteFrameByName("mucai.jpg"))
				elseif iter_8_1.itemType == "food" then
					marketUI.uiTable["title_" .. iter_8_0 .. "1"]:setString(language.get(10103) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["title_" .. iter_8_0 .. "2"]:setString(language.get(10103) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["icon_" .. iter_8_0 .. "1"]:setDisplayFrame(tool.spriteFrameByName("liang.jpg"))
					marketUI.uiTable["icon_" .. iter_8_0 .. "2"]:setDisplayFrame(tool.spriteFrameByName("liang.jpg"))
				elseif iter_8_1.itemType == "recruit_token" then
					marketUI.uiTable["title_" .. iter_8_0 .. "1"]:setString(language.get(10105) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["title_" .. iter_8_0 .. "2"]:setString(language.get(10105) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["icon_" .. iter_8_0 .. "1"]:setDisplayFrame(tool.spriteFrameByName("mubingling.jpg"))
					marketUI.uiTable["icon_" .. iter_8_0 .. "2"]:setDisplayFrame(tool.spriteFrameByName("mubingling.jpg"))
				elseif iter_8_1.itemType == "iron" then
					marketUI.uiTable["title_" .. iter_8_0 .. "1"]:setString(language.get(10104) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["title_" .. iter_8_0 .. "2"]:setString(language.get(10104) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["icon_" .. iter_8_0 .. "1"]:setDisplayFrame(tool.spriteFrameByName("kuang.jpg"))
					marketUI.uiTable["icon_" .. iter_8_0 .. "2"]:setDisplayFrame(tool.spriteFrameByName("kuang.jpg"))
				elseif iter_8_1.itemType == "copper" then
					marketUI.uiTable["title_" .. iter_8_0 .. "1"]:setString(language.get(10101) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["title_" .. iter_8_0 .. "2"]:setString(language.get(10101) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["icon_" .. iter_8_0 .. "1"]:setDisplayFrame(tool.spriteFrameByName("ying.jpg"))
					marketUI.uiTable["icon_" .. iter_8_0 .. "2"]:setDisplayFrame(tool.spriteFrameByName("ying.jpg"))
				elseif iter_8_1.itemType == "gem" then
					marketUI.uiTable["title_" .. iter_8_0 .. "1"]:setString(language.get(10106) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["title_" .. iter_8_0 .. "2"]:setString(language.get(10106) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["icon_" .. iter_8_0 .. "1"]:setDisplayFrame(tool.spriteFrameByName("baoshi1.jpg"))
					marketUI.uiTable["icon_" .. iter_8_0 .. "2"]:setDisplayFrame(tool.spriteFrameByName("baoshi1.jpg"))
				elseif iter_8_1.itemType == "item_1901" then
					marketUI.uiTable["title_" .. iter_8_0 .. "1"]:setString(language.get(122041) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["title_" .. iter_8_0 .. "2"]:setString(language.get(122041) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["icon_" .. iter_8_0 .. "1"]:setDisplayFrame(tool.spriteFrameByName("yingxiongtie.jpg"))
					marketUI.uiTable["icon_" .. iter_8_0 .. "2"]:setDisplayFrame(tool.spriteFrameByName("yingxiongtie.jpg"))
				elseif iter_8_1.itemType == "item_1902" then
					marketUI.uiTable["title_" .. iter_8_0 .. "1"]:setString(language.get(122042) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["title_" .. iter_8_0 .. "2"]:setString(language.get(122042) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["icon_" .. iter_8_0 .. "1"]:setDisplayFrame(tool.spriteFrameByName("jinchengling.jpg"))
					marketUI.uiTable["icon_" .. iter_8_0 .. "2"]:setDisplayFrame(tool.spriteFrameByName("jinchengling.jpg"))
				elseif iter_8_1.itemType == "item_1903" then
					marketUI.uiTable["title_" .. iter_8_0 .. "1"]:setString(language.get(122043) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["title_" .. iter_8_0 .. "2"]:setString(language.get(122043) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["icon_" .. iter_8_0 .. "1"]:setDisplayFrame(tool.spriteFrameByName("tongxingtie.jpg"))
					marketUI.uiTable["icon_" .. iter_8_0 .. "2"]:setDisplayFrame(tool.spriteFrameByName("tongxingtie.jpg"))
				elseif iter_8_1.itemType == "item_1904" then
					marketUI.uiTable["title_" .. iter_8_0 .. "1"]:setString(language.get(122044) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["title_" .. iter_8_0 .. "2"]:setString(language.get(122044) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["icon_" .. iter_8_0 .. "1"]:setDisplayFrame(tool.spriteFrameByName("waizushangquan.jpg"))
					marketUI.uiTable["icon_" .. iter_8_0 .. "2"]:setDisplayFrame(tool.spriteFrameByName("waizushangquan.jpg"))
				elseif iter_8_1.itemType == "item_1905" then
					marketUI.uiTable["title_" .. iter_8_0 .. "1"]:setString(language.get(122070) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["title_" .. iter_8_0 .. "2"]:setString(language.get(122070) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["icon_" .. iter_8_0 .. "1"]:setDisplayFrame(tool.spriteFrameByName("baoshishangquan.jpg"))
					marketUI.uiTable["icon_" .. iter_8_0 .. "2"]:setDisplayFrame(tool.spriteFrameByName("baoshishangquan.jpg"))
				elseif iter_8_1.itemType == "merchant_piece" then
					marketUI.uiTable["title_" .. iter_8_0 .. "1"]:setString(language.get(213404) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["title_" .. iter_8_0 .. "2"]:setString(language.get(213404) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["icon_" .. iter_8_0 .. "1"]:setDisplayFrame(tool.spriteFrameByName("zslsp.jpg"))
					marketUI.uiTable["icon_" .. iter_8_0 .. "2"]:setDisplayFrame(tool.spriteFrameByName("zslsp.jpg"))
				elseif iter_8_1.itemType == "forge_hammer_2" then
					marketUI.uiTable["title_" .. iter_8_0 .. "1"]:setString(language.get(213405) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["title_" .. iter_8_0 .. "2"]:setString(language.get(213405) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["icon_" .. iter_8_0 .. "1"]:setDisplayFrame(tool.spriteFrameByName("chuizi02.jpg"))
					marketUI.uiTable["icon_" .. iter_8_0 .. "2"]:setDisplayFrame(tool.spriteFrameByName("chuizi02.jpg"))
					marketUI.uiTable["tip_" .. iter_8_0 .. "1"]:setString(language.get(213402))
					marketUI.uiTable["tip_" .. iter_8_0 .. "2"]:setString(language.get(213402))
				elseif iter_8_1.itemType == "accel_hammer" then
					marketUI.uiTable["title_" .. iter_8_0 .. "1"]:setString(language.get(213406) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["title_" .. iter_8_0 .. "2"]:setString(language.get(213406) .. " X " .. tostring(iter_8_1.itemNum))
					marketUI.uiTable["icon_" .. iter_8_0 .. "1"]:setDisplayFrame(tool.spriteFrameByName("chuiz01.jpg"))
					marketUI.uiTable["icon_" .. iter_8_0 .. "2"]:setDisplayFrame(tool.spriteFrameByName("chuiz01.jpg"))
					marketUI.uiTable["tip_" .. iter_8_0 .. "1"]:setString(language.get(213402))
					marketUI.uiTable["tip_" .. iter_8_0 .. "2"]:setString(language.get(213402))
				end

				if iter_8_1.costType == "copper" then
					marketUI.uiTable["cost_" .. iter_8_0 .. "1"]:setString(tostring(tool.getFormatNum(iter_8_1.costNum)))
					marketUI.uiTable["cost_" .. iter_8_0 .. "2"]:setString(tostring(tool.getFormatNum(iter_8_1.costNum)))
					marketUI.uiTable["gold_" .. iter_8_0 .. "1"]:setDisplayFrame(tool.spriteFrameByName("icon_silver.png"))
					marketUI.uiTable["gold_" .. iter_8_0 .. "2"]:setDisplayFrame(tool.spriteFrameByName("icon_silver.png"))
				elseif iter_8_1.costType == "iron" then
					marketUI.uiTable["cost_" .. iter_8_0 .. "1"]:setString(tostring(iter_8_1.costNum))
					marketUI.uiTable["cost_" .. iter_8_0 .. "2"]:setString(tostring(iter_8_1.costNum))
					marketUI.uiTable["gold_" .. iter_8_0 .. "1"]:setDisplayFrame(tool.spriteFrameByName("icon_iron.png"))
					marketUI.uiTable["gold_" .. iter_8_0 .. "2"]:setDisplayFrame(tool.spriteFrameByName("icon_iron.png"))
				elseif iter_8_1.costType == "lumber" then
					marketUI.uiTable["cost_" .. iter_8_0 .. "1"]:setString(tostring(iter_8_1.costNum))
					marketUI.uiTable["cost_" .. iter_8_0 .. "2"]:setString(tostring(iter_8_1.costNum))
					marketUI.uiTable["gold_" .. iter_8_0 .. "1"]:setDisplayFrame(tool.spriteFrameByName("icon_wood.png"))
					marketUI.uiTable["gold_" .. iter_8_0 .. "2"]:setDisplayFrame(tool.spriteFrameByName("icon_wood.png"))
				end

				marketUI.uiTable["title_" .. iter_8_0 .. "1"]:setColor(colorQuality[iter_8_1.quality])
				marketUI.uiTable["title_" .. iter_8_0 .. "2"]:setColor(colorQuality[iter_8_1.quality])
			end
		end

		var_1_1()

		if var_0_0.isFlip == false then
			var_0_0.isFlip = true

			var_1_2()
		else
			for iter_1_0 = 1, 3 do
				CCDirector:sharedDirector():setProjection(kCCDirectorProjection2D)

				local var_1_3 = CCOrbitCamera:create(0.3, 1, 0, 0, 90, 0, 0)
				local var_1_4 = CCSequence:createWithTwoActions(var_1_3, var_1_3:reverse())

				marketUI.uiTable["buy_" .. iter_1_0]:runAction(var_1_4)
			end

			local var_1_5 = CCDelayTime:create(0.3)
			local var_1_6 = CCCallFuncN:create(var_1_2)
			local var_1_7 = CCArray:create()

			var_1_7:addObject(var_1_5)
			var_1_7:addObject(var_1_6)

			local var_1_8 = CCSequence:create(var_1_7)

			marketUI.uiTable.currentBuyCount:runAction(var_1_8)
		end

		smgr.getLayer("marketLayer"):setVisible(true)
	end
end

local function var_0_2(arg_9_0)
	if arg_9_0.action.state == 1 then
		local var_9_0 = arg_9_0.action.data
		local var_9_1 = ""
		local var_9_2 = ""
		local var_9_3 = "get_numb_plus.png"

		if var_9_0.type == "food" then
			var_9_1 = "icon_liang.png"
			var_9_2 = "get_reso_food.png"
		elseif var_9_0.type == "lumber" then
			var_9_1 = "icon_mucai.png"
			var_9_2 = "get_reso_wood.png"
		elseif var_9_0.type == "recruit_token" then
			var_9_1 = "icon_mubingling.png"
			var_9_2 = "get_reso_recru.png"
		elseif var_9_0.type == "iron" then
			var_9_1 = "icon_iron.png"
			var_9_2 = "get_reso_iron.png"
		elseif var_9_0.type == "copper" then
			var_9_1 = "icon_ying.png"
			var_9_2 = "get_reso_silver.png"
		elseif var_9_0.type == "gem" then
			var_9_1 = "icon_gem.png"
			var_9_2 = "res/ui/common/text/resource/res_title_7.png"
		elseif var_9_0.type == "item_1901" then
			var_9_1 = "res_icon_1901.png"
			var_9_2 = "res/ui/common/text/resource/res_title_1901.png"
		elseif var_9_0.type == "item_1902" then
			var_9_1 = "res_icon_1902.png"
			var_9_2 = "res/ui/common/text/resource/res_title_1902.png"
		elseif var_9_0.type == "item_1903" then
			var_9_1 = "res_icon_1903.png"
			var_9_2 = "res/ui/common/text/resource/res_title_1903.png"
		elseif var_9_0.type == "item_1904" then
			var_9_1 = "res_icon_1904.png"
			var_9_2 = "res/ui/common/text/resource/res_title_1904.png"
		elseif var_9_0.type == "item_1905" then
			var_9_1 = "res_icon_1904.png"
			var_9_2 = "res/ui/common/text/resource/res_title_1905.png"
		elseif var_9_0.type == "merchant_piece" then
			var_9_2 = "res/ui/common/text/resource/res_title_10034.png"
		elseif var_9_0.type == "forge_hammer_2" then
			var_9_2 = "res/ui/common/text/resource/res_title_91002.png"
		elseif var_9_0.type == "accel_hammer" then
			var_9_2 = "res/ui/common/text/resource/res_title_fdjsc.png"
		end

		local function var_9_4(arg_10_0)
			local var_10_0 = smgr.getLayer("marketLayer")

			arg_10_0:setVisible(false)
			var_10_0:removeChild(arg_10_0, true)
		end

		local var_9_5 = CCNode:create()
		local var_9_6 = tool.spriteByName(var_9_1)
		local var_9_7 = tool.spriteByName(var_9_2)

		if var_9_0.type == "gem" or var_9_0.type == "item_1901" or var_9_0.type == "item_1902" or var_9_0.type == "item_1903" or var_9_0.type == "item_1904" or var_9_0.type == "item_1905" or var_9_0.type == "merchant_piece" or var_9_0.type == "forge_hammer_2" or var_9_0.type == "accel_hammer" then
			var_9_7 = CCSprite:create(var_9_2)
		end

		local var_9_8 = tool.spriteByName(var_9_3)
		local var_9_9, var_9_10 = CCNumberSprite:create("get_numb_%d.png", tostring(var_9_0.addNum))
		local var_9_11 = var_9_6:getContentSize().width
		local var_9_12 = var_9_7:getContentSize().width
		local var_9_13 = var_9_8:getContentSize().width
		local var_9_14 = var_9_10.content_width
		local var_9_15 = (var_9_11 + var_9_12 + var_9_13 + var_9_14) / 2

		var_9_6:setPositionX(var_9_11 / 2 - var_9_15)
		var_9_7:setPositionX(var_9_11 + var_9_12 / 2 - var_9_15)
		var_9_8:setPositionX(var_9_11 + var_9_12 + var_9_13 / 2 - var_9_15)
		var_9_9:setPositionX(var_9_11 + var_9_12 + var_9_13 + var_9_14 / 2 - var_9_15)
		var_9_5:addChild(var_9_6)
		var_9_5:addChild(var_9_7)
		var_9_5:addChild(var_9_8)
		var_9_5:addChild(var_9_9)
		var_9_5:setPosition(ccp(visibleSize.width / 2, visibleSize.height * 0.4))
		smgr.getLayer("marketLayer"):addChild(var_9_5, 101, 10001)

		local var_9_16 = CCMoveTo:create(0.3, ccp(visibleSize.width / 2, visibleSize.height * 0.6))
		local var_9_17 = CCDelayTime:create(0.3)
		local var_9_18 = CCMoveTo:create(0.5, ccp(0, visibleSize.height))
		local var_9_19 = CCCallFuncN:create(var_9_4)
		local var_9_20 = CCArray:create()

		var_9_20:addObject(var_9_16)
		var_9_20:addObject(var_9_17)
		var_9_20:addObject(var_9_18)
		var_9_20:addObject(var_9_19)

		local var_9_21 = CCSequence:create(var_9_20)

		var_9_5:runAction(var_9_21)
		var_0_0.getMarketInfo()
	end
end

function var_0_0.marketButtonClick1()
	var_0_0.marketButtonClick(1)
end

function var_0_0.marketButtonClick2()
	var_0_0.marketButtonClick(2)
end

function var_0_0.marketButtonClick3()
	var_0_0.marketButtonClick(3)
end

function var_0_0.marketButtonClick(arg_14_0)
	local function var_14_0()
		marketUI.uiTable.buy_parent:setTouchEnabled(false)
	end

	local function var_14_1()
		marketUI.uiTable.buy_parent:setTouchEnabled(true)
	end

	local var_14_2 = CCCallFuncN:create(var_14_0)
	local var_14_3 = CCDelayTime:create(0.8)
	local var_14_4 = CCCallFuncN:create(var_14_1)
	local var_14_5 = CCArray:create()

	var_14_5:addObject(var_14_2)
	var_14_5:addObject(var_14_3)
	var_14_5:addObject(var_14_4)

	local var_14_6 = CCSequence:create(var_14_5)

	marketUI.uiTable.buy_parent:runAction(var_14_6)
	cmgr.sendRequest(var_0_2, actions.buyMarketProduct, tostring(arg_14_0))
end

function var_0_0.gotoClicked()
	smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
	loadingLayer.show(SCENE_WORLD, var_0_0.cityId)
end

function var_0_0.getMarketInfo()
	cmgr.sendRequest(var_0_1, actions.getMarketInfo)
end

function var_0_0.onEnter()
	return
end

function var_0_0.onExit()
	var_0_0.isFlip = false
	resourceUI.uiTable = {}
end
