local var_0_0 = class("cityWindow", function()
	return CCLayer:create()
end)
local var_0_1 = 0
local var_0_2 = false
local var_0_3 = false
local var_0_4 = false
local var_0_5 = false
local var_0_6 = {}

var_0_6[1] = 123
var_0_6[2] = 19
var_0_6[3] = 207

function var_0_0.ctor(arg_2_0, arg_2_1)
	var_0_2 = false
	var_0_3 = false
	var_0_4 = false
	var_0_5 = false

	if smgr.currentSceneTag == SCENE_WORLD then
		local var_2_0 = user.corpsInfo[user.player.forceId]

		if var_2_0 and var_2_0.playerId == user.player.playerId and var_2_0.state == 2 then
			var_0_3 = true

			for iter_2_0 = 1, 3 do
				if var_0_6[iter_2_0] == tonumber(arg_2_1) then
					var_0_3 = false
				end
			end
		end

		if var_0_6[user.player.forceId] == tonumber(arg_2_1) and worldControl.corpsOpen then
			var_0_4 = true
		end

		if var_0_6[user.player.forceId] == tonumber(arg_2_1) and user.personalCorpsOpen and user.personalCorpsOpen == 1 and user.freePersonalCorpsTimes and user.freePersonalCorpsTimes > 0 then
			var_0_5 = true
		end
	elseif smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		local var_2_1 = user.kfCorpsInfo[user.player.kfgzForceId]

		if var_2_1 and var_2_1.playerId == user.player.kfgzCompetitorId and var_2_1.state == 2 then
			var_0_3 = true
		end
	end

	arg_2_0.cityId = tonumber(arg_2_1)
	arg_2_0.uidata = require("lua/layer/world/cityWindow2/uidata").new()
	arg_2_0.control = require("lua/layer/world/cityWindow2/control").new(arg_2_0)

	arg_2_0.control:getCityDetailInfo(arg_2_1)
	arg_2_0:registerScriptHandler(function(arg_3_0)
		if arg_3_0 == "enter" then
			arg_2_0.control:onEnter()
		elseif arg_3_0 == "exit" then
			arg_2_0.control:onExit()
		end
	end)

	if smgr.currentSceneTag == SCENE_JUBEN then
		-- block empty
	elseif smgr.currentSceneTag == SCENE_KFWORLD then
		-- block empty
	elseif smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		-- block empty
	elseif smgr.currentSceneTag == SCENE_KFEXPEDITION then
		-- block empty
	else
		local var_2_2 = smgr.getLayer("worldCamera")
		local var_2_3, var_2_4 = var_2_2.cityTable["world_building_" .. arg_2_1].sprite:getPosition()

		arg_2_0:setPosition(ccp(var_2_3, var_2_4))
		var_2_2.worldLayer:addChild(arg_2_0, 3000)
		eventManager.dispatchEvent("hideWorldElement", true, arg_2_0.cityId)
	end

	arg_2_0.menuLevel = 0
	arg_2_0.detailLevel = 0
end

function var_0_0.init(arg_4_0, arg_4_1)
	local function var_4_0(arg_5_0)
		log.info("forceId", arg_5_0, smgr.currentSceneTag, SCENE_KFWORLD)
		log.info("forceId", type(arg_5_0), type(smgr.currentSceneTag), type(SCENE_KFWORLD))

		local var_5_0
		local var_5_1
		local var_5_2

		if smgr.currentSceneTag == SCENE_JUBEN then
			if arg_5_0 == 0 then
				var_5_0 = "guojia_dii.png"
			elseif arg_5_0 == 1 or arg_5_0 == 2 or arg_5_0 == 3 then
				var_5_1 = user.forceIdToName[arg_5_0]
				var_5_2 = colorForce[arg_5_0]
			elseif arg_5_0 == 4 then
				var_5_0 = "guojia_cao.png"
			elseif arg_5_0 == 101 then
				var_5_0 = "guojia_yuan.png"
			elseif arg_5_0 == 102 then
				var_5_0 = "guojia_liu.png"
			elseif arg_5_0 == 103 then
				var_5_0 = "guojia_dong.png"
			elseif arg_5_0 == 104 then
				var_5_0 = "guojia_cao.png"
			elseif arg_5_0 == 105 then
				var_5_0 = "guojia_cao.png"
			else
				var_5_0 = "guojia_dii.png"
			end
		elseif smgr.currentSceneTag == SCENE_KFWORLD then
			if arg_5_0 == 1 then
				var_5_0 = "guojia_hong.png"
			elseif arg_5_0 == 2 then
				var_5_0 = "guojia_lan.png"
			else
				var_5_0 = "cityWindowMan.png"
			end
		elseif smgr.currentSceneTag == SCENE_KFYZ_WORLD then
			if arg_5_0 == 1 or arg_5_0 == 2 or arg_5_0 == 3 then
				var_5_1 = user.forceIdToName_kfyz[arg_5_0]
				var_5_2 = colorForce[arg_5_0]
			else
				var_5_0 = arg_5_0 == 4 and "cityWindowMan.png" or arg_5_0 == 1001 and "cityWindowZheng.png" or arg_5_0 == 1002 and "cityWindowZheng.png" or arg_5_0 == 1003 and "cityWindowZheng.png" or "cityWindowMan.png"
			end

			if user.jpsIndex ~= 0 then
				if arg_5_0 == 1 then
					local var_5_3

					if user.isKfdy then
						var_5_3 = "222416_dongying"
					elseif user.isKfgl then
						var_5_3 = 136566
					elseif user.isKfyn then
						var_5_3 = 136819
					end

					var_5_1 = language.get(var_5_3)
					var_5_2 = colorForce[101]
				else
					var_5_0 = "cityWindowZheng.png"
				end
			end

			if user.isKfyn then
				if arg_5_0 > 1000 then
					var_5_1 = user.forceIdToName[user.player.forceId]
					var_5_2 = colorForce[user.player.forceId]
					var_5_0 = nil
				else
					var_5_0 = "cityWindowZheng.png"
				end
			elseif user.isKflq then
				if arg_5_0 < 1000 then
					var_5_0 = "yzlq_word_liu.png"
				end
			elseif user.isKfnz and arg_5_0 < 1000 then
				var_5_0 = "yznz_word_nan.png"
			end
		elseif smgr.currentSceneTag == SCENE_KFEXPEDITION then
			if arg_5_0 == 1 or arg_5_0 == 2 or arg_5_0 == 3 then
				var_5_1 = user.forceIdToName[arg_5_0]
				var_5_2 = colorForce[arg_5_0]
			else
				var_5_0 = "cityWindowhuang.png"
			end
		elseif arg_5_0 == 1 or arg_5_0 == 2 or arg_5_0 == 3 then
			var_5_1 = user.forceIdToName[arg_5_0]
			var_5_2 = colorForce[arg_5_0]
		else
			var_5_0 = arg_5_0 == 106 and "cityWindowYuan.png" or arg_5_0 == 104 and "cityWindowhuang.png" or arg_5_0 == 1001 and "cityWindowZheng.png" or "cityWindowMan.png"
		end

		return var_5_0, var_5_1, var_5_2
	end

	local function var_4_1()
		if smgr.currentSceneTag == SCENE_JUBEN then
			return false
		elseif smgr.currentSceneTag == SCENE_KFWORLD then
			return false
		elseif smgr.currentSceneTag == SCENE_KFYZ_WORLD then
			return false
		elseif smgr.currentSceneTag == SCENE_KFEXPEDITION then
			return false
		end

		return arg_4_0.cityId == 206 or arg_4_0.cityId == 253 or arg_4_0.cityId == 254
	end

	local function var_4_2()
		if smgr.currentSceneTag == SCENE_JUBEN then
			return false
		elseif smgr.currentSceneTag == SCENE_KFWORLD then
			return false
		elseif smgr.currentSceneTag == SCENE_KFYZ_WORLD then
			return false
		elseif smgr.currentSceneTag == SCENE_KFEXPEDITION then
			return false
		end

		return arg_4_0.cityId == 250 or arg_4_0.cityId == 251 or arg_4_0.cityId == 252
	end

	local function var_4_3()
		if smgr.currentSceneTag == SCENE_JUBEN then
			return false
		elseif smgr.currentSceneTag == SCENE_KFWORLD then
			return false
		elseif smgr.currentSceneTag == SCENE_KFYZ_WORLD then
			return false
		elseif smgr.currentSceneTag == SCENE_KFEXPEDITION then
			return false
		end

		return arg_4_0.cityId == 19 or arg_4_0.cityId == 123 or arg_4_0.cityId == 207
	end

	local function var_4_4()
		if smgr.currentSceneTag == SCENE_JUBEN then
			return false
		elseif smgr.currentSceneTag == SCENE_KFWORLD then
			return false
		elseif smgr.currentSceneTag == SCENE_KFYZ_WORLD then
			return false
		elseif smgr.currentSceneTag == SCENE_KFEXPEDITION then
			return false
		end

		local var_9_0 = smgr.getLayer("worldCamera").cityTable["world_building_" .. arg_4_0.cityId]

		return tonumber(var_9_0.prop[2]) == user.player.forceId
	end

	local function var_4_5()
		if smgr.currentSceneTag == SCENE_JUBEN then
			return false
		elseif smgr.currentSceneTag == SCENE_KFWORLD then
			return false
		elseif smgr.currentSceneTag == SCENE_KFYZ_WORLD then
			return false
		elseif smgr.currentSceneTag == SCENE_KFEXPEDITION then
			return false
		end

		local var_10_0 = smgr.getLayer("worldCamera")
		local var_10_1 = 0

		if var_10_0.worldFireTable["cityId_" .. arg_4_0.cityId] then
			for iter_10_0, iter_10_1 in pairs(var_10_0.worldFireTable["cityId_" .. arg_4_0.cityId]) do
				var_10_1 = var_10_1 + 1
			end
		end

		return var_10_1 == 0
	end

	arg_4_1 = arg_4_1 or false

	local var_4_6

	if arg_4_0.uiTable and arg_4_0.uiTable.background then
		arg_4_0.uiTable.background:removeFromParentAndCleanup(true)
	end

	arg_4_0.uiTable = autoUI.initUI(arg_4_0, arg_4_0.uidata:getData())

	if smgr.currentSceneTag == SCENE_WORLD then
		if arg_4_0.cityId == 38 or arg_4_0.cityId == 109 or arg_4_0.cityId == 227 then
			arg_4_0.uiTable.specialCityName:setVisible(true)
			arg_4_0.uiTable.specialCityName:setDisplayFrame(CCSprite:create("res/ui/world/tscc_tit_canyon.png"):displayFrame())
			arg_4_0.uiTable.specialCityExplain:setString(language.get(113027))
		elseif arg_4_0.cityId == 45 or arg_4_0.cityId == 110 or arg_4_0.cityId == 181 then
			arg_4_0.uiTable.specialCityName:setVisible(true)
			arg_4_0.uiTable.specialCityName:setDisplayFrame(CCSprite:create("res/ui/world/tscc_tit_alp.png"):displayFrame())
			arg_4_0.uiTable.specialCityExplain:setString(language.get(113028))
		elseif arg_4_0.cityId == 40 or arg_4_0.cityId == 116 or arg_4_0.cityId == 224 then
			arg_4_0.uiTable.specialCityName:setVisible(true)
			arg_4_0.uiTable.specialCityName:setDisplayFrame(CCSprite:create("res/ui/world/tscc_tit_jungle.png"):displayFrame())
			arg_4_0.uiTable.specialCityExplain:setString(language.get(113026))
		elseif arg_4_0.cityId == 134 or arg_4_0.cityId == 137 or arg_4_0.cityId == 101 or arg_4_0.cityId == 104 or arg_4_0.cityId == 56 or arg_4_0.cityId == 142 then
			arg_4_0.uiTable.specialCityName:setVisible(true)
			arg_4_0.uiTable.specialCityName:setDisplayFrame(CCSprite:create("res/ui/world/tscc_tit_slope.png"):displayFrame())
			arg_4_0.uiTable.specialCityExplain:setString(language.get(113034))
		else
			arg_4_0.uiTable.specialCityName:setVisible(false)
			arg_4_0.uiTable.specialCityExplain:setString("")
		end
	end

	log.info("cityInfo=%s", tool.tableToJson(arg_4_0.control.cityData))
	arg_4_0.uiTable.background:setVisible(true)

	if arg_4_0.control.cityData.inBattle then
		arg_4_0.uiTable.cityLook:setVisible(true)

		local var_4_7 = arg_4_0.uiTable.cityLook

		arg_4_0.uiTable.cityLook:registerScriptTapHandler(function()
			arg_4_0.control:showBattle()
		end)

		if arg_4_0.control.cityData.inBattle then
			arg_4_0.uiTable.cityWarInfo:setVisible(true)

			local var_4_8, var_4_9, var_4_10 = var_4_0(arg_4_0.control.cityData.defSide[1].forceId)

			if var_4_8 then
				arg_4_0.uiTable.cityDef:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_4_8))
			else
				arg_4_0.uiTable.cityDef:setVisible(false)

				local var_4_11 = CCLabelTTF:create(var_4_9, "", 25)

				var_4_11:setPosition(20.5, 20.5)
				var_4_11:setColor(var_4_10)
				arg_4_0.uiTable.cityDefBg:addChild(var_4_11)
			end

			arg_4_0.uiTable.cityDefNum:setString(arg_4_0.control.cityData.defSide[1].num)

			if arg_4_0.control.cityData.defSide[1].extraNum and arg_4_0.control.cityData.defSide[1].extraNum > 0 then
				arg_4_0.uiTable.cityExtraDefNum:setString("(" .. arg_4_0.control.cityData.defSide[1].extraNum .. ")")
			end

			for iter_4_0, iter_4_1 in pairs(arg_4_0.control.cityData.attSide) do
				arg_4_0.uiTable["cityAttBg_" .. iter_4_0]:setVisible(true)

				local var_4_12, var_4_13, var_4_14 = var_4_0(iter_4_1.forceId)

				if var_4_12 then
					arg_4_0.uiTable["cityAtt_" .. iter_4_0]:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_4_12))
				else
					arg_4_0.uiTable["cityAtt_" .. iter_4_0]:setVisible(false)

					local var_4_15 = CCLabelTTF:create(var_4_13, "", 25)

					var_4_15:setPosition(20.5, 20.5)
					var_4_15:setColor(var_4_14)
					arg_4_0.uiTable["cityAttBg_" .. iter_4_0]:addChild(var_4_15)
				end

				arg_4_0.uiTable["cityAttNum_" .. iter_4_0]:setString(iter_4_1.num)

				if iter_4_1.extraNum and iter_4_1.extraNum > 0 then
					arg_4_0.uiTable["cityExtraAttNum_" .. iter_4_0]:setString("(" .. iter_4_1.extraNum .. ")")
				end
			end
		end
	elseif var_4_1() then
		arg_4_0.uiTable.switchPage:setVisible(false)
		arg_4_0.uiTable.cityLook:setVisible(false)

		local var_4_16 = arg_4_0.control.farmData

		if var_4_16.cd > var_4_16.maxCd then
			arg_4_0.uiTable.farmJiasu:setVisible(true)
			arg_4_0.uiTable.farmJiasu:registerScriptTapHandler(function()
				arg_4_0.control:farmJiasu()
			end)
		else
			arg_4_0.uiTable.donate:setVisible(true)
			arg_4_0.uiTable.donate:registerScriptTapHandler(function()
				arg_4_0.control:farmDonate()
			end)
		end

		arg_4_0:calcProgress(var_4_16.percentage, arg_4_1)
		arg_4_0:calcLevel(var_4_16.lv)
	elseif var_4_2() then
		arg_4_0.uiTable.switchPage:setVisible(false)

		if arg_4_0.control.cityData.inBattle then
			arg_4_0.uiTable.cityLook:setVisible(true)
			arg_4_0.uiTable.cityLook:registerScriptTapHandler(function()
				arg_4_0.control:showBattle()
			end)
			arg_4_0.uiTable.cityWarInfo:setVisible(true)

			local var_4_17 = var_4_0(arg_4_0.control.cityData.defSide[1].forceId)

			arg_4_0.uiTable.cityDef:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_4_17))
			arg_4_0.uiTable.cityDefNum:setString(arg_4_0.control.cityData.defSide[1].num)

			if arg_4_0.control.cityData.defSide[1].extraNum and arg_4_0.control.cityData.defSide[1].extraNum > 0 then
				arg_4_0.uiTable.cityExtraDefNum:setString("(" .. arg_4_0.control.cityData.defSide[1].extraNum .. ")")
			end

			for iter_4_2, iter_4_3 in pairs(arg_4_0.control.cityData.attSide) do
				arg_4_0.uiTable["cityAttBg_" .. iter_4_2]:setVisible(true)

				local var_4_18 = var_4_0(iter_4_3.forceId)

				arg_4_0.uiTable["cityAtt_" .. iter_4_2]:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_4_18))
				arg_4_0.uiTable["cityAttNum_" .. iter_4_2]:setString(iter_4_3.num)

				if iter_4_3.extraNum and iter_4_3.extraNum > 0 then
					arg_4_0.uiTable["cityExtraAttNum_" .. iter_4_2]:setString("(" .. iter_4_3.extraNum .. ")")
				end
			end

			arg_4_0.uiTable.detail:setVisible(true)
			arg_4_0.uiTable.detail:registerScriptTapHandler(function()
				arg_4_0.control:detail()
			end)
		else
			arg_4_0.uiTable.cityLook:setPosition(ccp(-83, 0))
			arg_4_0.uiTable.cityLook:setVisible(false)

			local var_4_19 = false
			local var_4_20

			for iter_4_4, iter_4_5 in pairs(arg_4_0.control.manzuData.manzuInfo) do
				if iter_4_5.cityId == arg_4_0.cityId then
					var_4_19 = iter_4_5.isOurs
					var_4_20 = iter_4_5
				end
			end

			arg_4_0:calcProgress(var_4_20.percent, arg_4_1)

			if not var_4_19 then
				if var_4_20.canFadong then
					arg_4_0.uiTable.fadong:setVisible(true)
					arg_4_0.uiTable.fadong:registerScriptTapHandler(function()
						arg_4_0.control:manzuFadong(arg_4_0.cityId)
					end)
				elseif var_4_20.cd > 3600000 then
					arg_4_0.uiTable.mzJiasu:setVisible(true)
					arg_4_0.uiTable.mzJiasu:registerScriptTapHandler(function()
						arg_4_0.control:manzuJiasu(arg_4_0.cityId)
					end)
				else
					arg_4_0.uiTable.buy:setVisible(true)
					arg_4_0.uiTable.buy:registerScriptTapHandler(function()
						arg_4_0.control:manzuBuy(arg_4_0.cityId)
					end)
				end

				arg_4_0.uiTable.qingmidu:setString(language.get(200323, arg_4_0.control.cityData.shouMaiInfo.qinMiDu))
				arg_4_0.uiTable.bingdengji:setString(language.get(200324, arg_4_0.control.cityData.shouMaiInfo.manzuLv))
				arg_4_0.uiTable.nengfadong:setString(language.get(200325, arg_4_0.control.cityData.shouMaiInfo.leftCount))
			else
				arg_4_0.uiTable.qingmidu:setVisible(false)
				arg_4_0.uiTable.bingdengji:setVisible(false)
				arg_4_0.uiTable.nengfadong:setVisible(false)
			end

			arg_4_0.uiTable.cityConvene:setVisible(false)
			arg_4_0.uiTable.manzuInfo:setVisible(true)
		end
	elseif var_4_3() then
		arg_4_0.uiTable.switchPage:setVisible(false)
		arg_4_0.uiTable.cityLook:setVisible(false)
		arg_4_0.uiTable.cityConvene:setVisible(false)
		arg_4_0.uiTable.mainCityInfo:setVisible(true)
		arg_4_0.uiTable.mainCityLevel:setString(language.get(400011, arg_4_0.control.cityData.capitalCityInfo.nationLv))

		local var_4_21 = ({
			[19] = 2,
			[123] = 1,
			[207] = 3
		})[arg_4_0.cityId]

		arg_4_0.uiTable.mainCityName:setString(language.get(200330, user.forceIdToName[var_4_21]))
		arg_4_0.uiTable.mainCityName:setColor(colorForce[var_4_21])

		local var_4_22 = createTimerLabel(arg_4_0.control.cityData.capitalCityInfo.CountDown1, "@H:@M:@S", "Thonburi", 16)

		var_4_22:setPosition(ccp(80, 0))
		arg_4_0.uiTable.countDown1:addChild(var_4_22)

		local var_4_23 = createTimerLabel(arg_4_0.control.cityData.capitalCityInfo.CountDown2, "@H:@M:@S", "Thonburi", 16)

		var_4_23:setPosition(ccp(80, 0))
		arg_4_0.uiTable.countDown2:addChild(var_4_23)
	else
		local var_4_24 = CCSprite:createWithSpriteFrameName("city_btn_see_a.png")

		var_4_24:setPosition(ccp(var_4_24:getContentSize().width / 2, var_4_24:getContentSize().height / 2))
		arg_4_0.uiTable.cityLook:addChild(var_4_24)
		tool.spriteToGray(var_4_24)
	end

	arg_4_0.uiTable.cityConvene:registerScriptTapHandler(function()
		arg_4_0.control:convene()
	end)
	arg_4_0.uiTable.switchPage:registerScriptTapHandler(function()
		arg_4_0.control:switchPage()
	end)

	if smgr.currentSceneTag == SCENE_JUBEN or smgr.currentSceneTag == SCENE_KFWORLD or smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
		arg_4_0.uiTable.switchPage:setVisible(false)
	else
		arg_4_0.uiTable.cityOrder:registerScriptTapHandler(function()
			arg_4_0.control:showOrder()
		end)
		arg_4_0.uiTable.shaOrder:registerScriptTapHandler(function()
			arg_4_0.control:useKillToken()
		end)
		arg_4_0.uiTable.plan1:registerScriptTapHandler(function()
			arg_4_0.control:click_plan1()
		end)
		arg_4_0.uiTable.plan2:registerScriptTapHandler(function()
			arg_4_0.control:click_plan2()
		end)
		arg_4_0.uiTable.jianzaoyaosai:registerScriptTapHandler(function()
			arg_4_0.control:buildCastle()
		end)
		arg_4_0.uiTable.jiaguyaosai:registerScriptTapHandler(function()
			arg_4_0.control:buildCastle()
		end)
		arg_4_0.uiTable.tiyijianzao:registerScriptTapHandler(function()
			arg_4_0.control:adviseCastle()
		end)
		arg_4_0.uiTable.repairRoad:registerScriptTapHandler(function()
			arg_4_0.control:repairRoad()
		end)
		arg_4_0.uiTable.closeRoad:registerScriptTapHandler(function()
			arg_4_0.control:closeRoad()
		end)
		arg_4_0.uiTable.repairRoadFind:registerScriptTapHandler(function()
			arg_4_0.control:repairRoadFind()
		end)
		arg_4_0.uiTable.closeRoadFind:registerScriptTapHandler(function()
			arg_4_0.control:closeRoadFind()
		end)

		if worldControl.stratagem ~= nil then
			for iter_4_6 = 1, 2 do
				local var_4_25 = worldControl.stratagem[iter_4_6]

				if var_4_25 ~= nil then
					local var_4_26 = var_4_25.stratagemList[1].trickPic
					local var_4_27 = CCSprite:create("res/ui/world/operateIcon/city_btn_" .. var_4_26 .. "_a.png")
					local var_4_28 = CCSprite:create("res/ui/world/operateIcon/city_btn_" .. var_4_26 .. "_c.png")

					if var_4_25.cd ~= nil and var_4_25.cd > 0 then
						local var_4_29 = "@M:@S"

						if var_4_25.cd > 3600000 then
							var_4_29 = "@H:@M:@S"
						end

						local function var_4_30()
							arg_4_0.uiTable["plan" .. iter_4_6]:removeChild(arg_4_0.uiTable["timerLayer" .. iter_4_6], true)

							arg_4_0.uiTable["timerLayer" .. iter_4_6] = nil
						end

						local var_4_31 = createTimerLabel(var_4_25.cd, var_4_29, "Thonburi-Bold", 18, var_4_30, nil, nil, ccc3(255, 114, 98))
						local var_4_32, var_4_33 = arg_4_0.uiTable["plan" .. iter_4_6]:getPosition()

						var_4_31:setPosition(ccp(38, 55))

						arg_4_0.uiTable["timerLayer" .. iter_4_6] = var_4_31

						arg_4_0.uiTable["plan" .. iter_4_6]:addChild(var_4_31, 100)

						var_4_27 = GraySprite:create("res/ui/world/operateIcon/city_btn_" .. var_4_26 .. "_a.png")
						var_4_28 = GraySprite:create("res/ui/world/operateIcon/city_btn_" .. var_4_26 .. "_c.png")
					end

					arg_4_0.uiTable["plan" .. iter_4_6]:setNormalImage(var_4_27)
					arg_4_0.uiTable["plan" .. iter_4_6]:setSelectedImage(var_4_28)
				end
			end
		end

		require("lua/layer/world/control")

		if worldControl.canBuildCastle then
			if user.pin and user.pin <= 1 then
				if worldControl.nextCastleTime and tonumber(worldControl.nextCastleTime) > 0 then
					local var_4_34 = os.time()
					local var_4_35 = "@M:@S"

					if tonumber(worldControl.nextCastleTime) - var_4_34 * 1000 > 3600000 then
						var_4_35 = "@H:@M:@S"
					end

					if tonumber(worldControl.nextCastleTime) - var_4_34 * 1000 > 0 then
						local function var_4_36()
							arg_4_0.uiTable.jianzaoyaosai:removeChild(arg_4_0.uiTable.timerLayer_jianzao, true)

							arg_4_0.uiTable.timerLayer_jianzao = nil
						end

						local var_4_37 = createTimerLabel(tonumber(worldControl.nextCastleTime) - var_4_34 * 1000, var_4_35, "Thonburi-Bold", 18, var_4_36, nil, nil, ccc3(255, 114, 98))

						var_4_37:setPosition(ccp(52, 55))

						arg_4_0.uiTable.timerLayer_jianzao = var_4_37

						arg_4_0.uiTable.jianzaoyaosai:addChild(var_4_37, 100)

						cc1 = GraySprite:create("res/ui/world/buildNation/city_btn_fqjz.png")
						cc2 = GraySprite:create("res/ui/world/buildNation/city_btn_fqjz_c.png")

						arg_4_0.uiTable.jianzaoyaosai:setNormalImage(cc1)
						arg_4_0.uiTable.jianzaoyaosai:setSelectedImage(cc2)

						local function var_4_38()
							arg_4_0.uiTable.jiaguyaosai:removeChild(arg_4_0.uiTable.timerLayer_jianzao2, true)

							arg_4_0.uiTable.timerLayer_jianzao2 = nil
						end

						local var_4_39 = createTimerLabel(tonumber(worldControl.nextCastleTime) - var_4_34 * 1000, var_4_35, "Thonburi-Bold", 18, var_4_38, nil, nil, ccc3(255, 114, 98))

						var_4_39:setPosition(ccp(52, 55))

						arg_4_0.uiTable.timerLayer_jianzao2 = var_4_39

						arg_4_0.uiTable.jiaguyaosai:addChild(var_4_39, 100)

						cc1 = GraySprite:create("res/ui/world/buildNation/city_btn_fqjg.png")
						cc2 = GraySprite:create("res/ui/world/buildNation/city_btn_fqjg_c.png")

						arg_4_0.uiTable.jiaguyaosai:setNormalImage(cc1)
						arg_4_0.uiTable.jiaguyaosai:setSelectedImage(cc2)
					end
				end
			elseif worldControl.nextAdviceCd and worldControl.nextAdviceCd > 0 then
				local var_4_40 = "@M:@S"

				if worldControl.nextAdviceCd > 3600000 then
					var_4_40 = "@H:@M:@S"
				end

				local function var_4_41()
					arg_4_0.uiTable.tiyijianzao:removeChild(arg_4_0.uiTable.timerLayer_jianzao, true)

					arg_4_0.uiTable.timerLayer_jianzao = nil
				end

				local var_4_42 = createTimerLabel(worldControl.nextAdviceCd, var_4_40, "Thonburi-Bold", 18, var_4_41, nil, nil, ccc3(255, 114, 98))

				var_4_42:setPosition(ccp(52, 55))

				arg_4_0.uiTable.timerLayer_jianzao = var_4_42

				arg_4_0.uiTable.tiyijianzao:addChild(var_4_42, 100)

				cc1 = GraySprite:create("res/ui/world/buildNation/city_btn_tyjz.png")
				cc2 = GraySprite:create("res/ui/world/buildNation/city_btn_tyjz_c.png")

				arg_4_0.uiTable.tiyijianzao:setNormalImage(cc1)
				arg_4_0.uiTable.tiyijianzao:setSelectedImage(cc2)
			end
		end

		if not user.pin or not (user.pin <= 1) or worldControl.shaDiLingNum ~= nil and worldControl.shaDiLingNum > 0 then
			-- block empty
		else
			local var_4_43 = GraySprite:create("res/ui/world/operateIcon/city_btn_sdl_a.png")
			local var_4_44 = GraySprite:create("res/ui/world/operateIcon/city_btn_sdl_c.png")

			arg_4_0.uiTable.shaOrder:setNormalImage(var_4_43)
			arg_4_0.uiTable.shaOrder:setSelectedImage(var_4_44)
		end
	end

	if not arg_4_1 then
		arg_4_0.uiTable.cityBackground:setScale(0)
		arg_4_0.uiTable.cityBackground:runAction(CCFadeIn:create(0.4))
		arg_4_0.uiTable.cityBackground:runAction(CCEaseBackOut:create(CCScaleTo:create(0.4, 1)))

		local var_4_45 = {
			arg_4_0.uiTable.cityLook,
			arg_4_0.uiTable.cityLook2,
			arg_4_0.uiTable.farmJiasu,
			arg_4_0.uiTable.donate,
			arg_4_0.uiTable.cityLook,
			arg_4_0.uiTable.detail,
			arg_4_0.uiTable.fadong,
			arg_4_0.uiTable.mzJiasu,
			arg_4_0.uiTable.buy,
			arg_4_0.uiTable.manzuInfo,
			arg_4_0.uiTable.mainCityInfo,
			arg_4_0.uiTable.cityLook,
			arg_4_0.uiTable.xuezhan,
			arg_4_0.uiTable.jianshou,
			arg_4_0.uiTable.genghuanmubiao,
			arg_4_0.uiTable.cityConvene,
			arg_4_0.uiTable.switchPage
		}

		for iter_4_7, iter_4_8 in pairs(var_4_45) do
			if not tolua.isnull(iter_4_8) and iter_4_8:isVisible() then
				iter_4_8:setScale(0)
				iter_4_8:runAction(CCScaleTo:create(0.4, 1))
			end
		end
	end

	arg_4_0.gidTable = {}

	local var_4_46

	if smgr.currentSceneTag == SCENE_JUBEN then
		var_4_46 = eventManager.dispatchEvent("JubenGetGenerals", arg_4_0.cityId)
	elseif smgr.currentSceneTag == SCENE_KFWORLD or smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
		var_4_46 = arg_4_0.control.kfGeneral
	else
		var_4_46 = arg_4_0.control.generalData.gIds
	end

	if (smgr.currentSceneTag == SCENE_WORLD or smgr.currentSceneTag == SCENE_KFYZ_WORLD) and var_0_3 then
		arg_4_0.uiTable.juntuan:setVisible(true)
		arg_4_0.uiTable.juntuan:setScale(0)

		local var_4_47, var_4_48 = arg_4_0.uiTable.juntuan:getPosition()

		arg_4_0.uiTable.juntuan:setPosition(ccp(0, 0))
		arg_4_0.uiTable.juntuan:runAction(CCFadeIn:create(0.4))
		arg_4_0.uiTable.juntuan:runAction(CCEaseSineOut:create(CCScaleTo:create(0.4, 1)))
		arg_4_0.uiTable.juntuan:runAction(CCEaseSineOut:create(CCMoveTo:create(0.4, ccp(var_4_47, var_4_48))))

		if var_4_46 then
			local var_4_49 = 1

			for iter_4_9, iter_4_10 in pairs(var_4_46) do
				arg_4_0.gidTable[var_4_49] = {}
				arg_4_0.gidTable[var_4_49].info = iter_4_10
				var_4_49 = var_4_49 + 1
			end
		end
	elseif smgr.currentSceneTag == SCENE_WORLD and (var_0_4 or var_0_5) then
		if var_0_4 then
			arg_4_0.uiTable.juntuanEnter:setVisible(true)
			arg_4_0.uiTable.juntuanEnter:setScale(0)

			local var_4_50, var_4_51 = arg_4_0.uiTable.juntuanEnter:getPosition()

			arg_4_0.uiTable.juntuanEnter:setPosition(ccp(0, 0))
			arg_4_0.uiTable.juntuanEnter:runAction(CCFadeIn:create(0.4))
			arg_4_0.uiTable.juntuanEnter:runAction(CCEaseSineOut:create(CCScaleTo:create(0.4, 1)))
			arg_4_0.uiTable.juntuanEnter:runAction(CCEaseSineOut:create(CCMoveTo:create(0.4, ccp(var_4_50, var_4_51))))
		end

		if var_0_5 then
			arg_4_0.uiTable.personJTEnter:setVisible(true)
			arg_4_0.uiTable.personJTEnter:setScale(0)

			local var_4_52, var_4_53 = arg_4_0.uiTable.personJTEnter:getPosition()

			arg_4_0.uiTable.personJTEnter:setPosition(ccp(0, 0))
			arg_4_0.uiTable.personJTEnter:runAction(CCFadeIn:create(0.4))
			arg_4_0.uiTable.personJTEnter:runAction(CCEaseSineOut:create(CCScaleTo:create(0.4, 1)))
			arg_4_0.uiTable.personJTEnter:runAction(CCEaseSineOut:create(CCMoveTo:create(0.4, ccp(var_4_52, var_4_53))))
		end
	elseif var_4_46 then
		local var_4_54 = 1

		for iter_4_11, iter_4_12 in pairs(var_4_46) do
			iter_4_12.pic = iter_4_12.pic or iter_4_12.gPic

			if arg_4_1 then
				local var_4_55 = false

				for iter_4_13, iter_4_14 in pairs(arg_4_0.control.conveneGeneralTable) do
					if iter_4_12 and iter_4_12.id == iter_4_14 then
						var_4_55 = true
					end
				end

				if iter_4_12 and not var_4_55 then
					arg_4_0.gidTable[var_4_54] = {}
					arg_4_0.gidTable[var_4_54].info = iter_4_12

					arg_4_0.uiTable["cityGeneral_" .. var_4_54]:setVisible(true)
					arg_4_0.uiTable["cityGeneralHead_" .. var_4_54]:setDisplayFrame(CCSpriteFrame:create("res/ui/common/fightPic/fightPic_" .. iter_4_12.pic .. ".png", CCRectMake(0, 0, 85, 85)))

					var_4_54 = var_4_54 + 1
				end
			else
				arg_4_0.gidTable[var_4_54] = {}
				arg_4_0.gidTable[var_4_54].info = iter_4_12

				arg_4_0.uiTable["cityGeneral_" .. var_4_54]:setVisible(true)
				arg_4_0.uiTable["cityGeneralHead_" .. var_4_54]:setDisplayFrame(CCSpriteFrame:create("res/ui/common/fightPic/fightPic_" .. iter_4_12.pic .. ".png", CCRectMake(0, 0, 85, 85)))
				arg_4_0.uiTable["cityGeneral_" .. var_4_54]:setScale(0)

				local var_4_56, var_4_57 = arg_4_0.uiTable["cityGeneral_" .. var_4_54]:getPosition()

				arg_4_0.uiTable["cityGeneral_" .. var_4_54]:setPosition(ccp(0, 0))
				arg_4_0.uiTable["cityGeneral_" .. var_4_54]:runAction(CCFadeIn:create(0.4))
				arg_4_0.uiTable["cityGeneral_" .. var_4_54]:runAction(CCEaseSineOut:create(CCScaleTo:create(0.4, 1)))
				arg_4_0.uiTable["cityGeneral_" .. var_4_54]:runAction(CCEaseSineOut:create(CCMoveTo:create(0.4, ccp(var_4_56, var_4_57))))

				var_4_54 = var_4_54 + 1
			end
		end
	end

	if user.autoBattleTechGain and (smgr.currentSceneTag == SCENE_WORLD and user.autoBattleCityId == nil or smgr.currentSceneTag == SCENE_KFYZ_WORLD and user.kfAutoBattleCityId == nil or smgr.currentSceneTag == SCENE_KFEXPEDITION and user.kfAutoBattleCityId == nil) then
		log.info("isOurs()", var_4_4())

		local var_4_58

		arg_4_0.autoBattleType = nil

		if smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
			arg_4_0.uiTable.xuezhan:setPosition(ccp(-100, 20))
			arg_4_0.uiTable.jianshou:setPosition(ccp(-100, 20))
		else
			arg_4_0.uiTable.xuezhan:setPosition(ccp(100, 20))
			arg_4_0.uiTable.jianshou:setPosition(ccp(100, 20))
		end

		arg_4_0.uiTable.xuezhan:setVisible(false)
		arg_4_0.uiTable.jianshou:setVisible(false)
		arg_4_0.uiTable.genghuanmubiao:setVisible(false)

		if var_4_4() then
			if arg_4_0.control.cityData.inBattle then
				if #arg_4_0.gidTable <= 4 or smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
					arg_4_0.uiTable.xuezhan:setVisible(false)
					arg_4_0.uiTable.jianshou:setVisible(true)
					arg_4_0.uiTable.genghuanmubiao:setVisible(false)
					arg_4_0.uiTable.jianshou:setScale(0)

					local var_4_59, var_4_60 = arg_4_0.uiTable.jianshou:getPosition()

					arg_4_0.uiTable.jianshou:setPosition(ccp(0, 0))
					arg_4_0.uiTable.jianshou:runAction(CCFadeIn:create(0.4))
					arg_4_0.uiTable.jianshou:runAction(CCEaseSineOut:create(CCScaleTo:create(0.4, 1)))
					arg_4_0.uiTable.jianshou:runAction(CCEaseSineOut:create(CCMoveTo:create(0.4, ccp(var_4_59, var_4_60))))
				end

				var_4_58 = arg_4_0.uiTable.jianshou
				arg_4_0.autoBattleType = 2
			end
		else
			if #arg_4_0.gidTable <= 4 or smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
				arg_4_0.uiTable.xuezhan:setVisible(true)
				arg_4_0.uiTable.jianshou:setVisible(false)
				arg_4_0.uiTable.genghuanmubiao:setVisible(false)
				arg_4_0.uiTable.xuezhan:setScale(0)

				local var_4_61, var_4_62 = arg_4_0.uiTable.xuezhan:getPosition()

				arg_4_0.uiTable.xuezhan:setPosition(ccp(0, 0))
				arg_4_0.uiTable.xuezhan:runAction(CCFadeIn:create(0.4))
				arg_4_0.uiTable.xuezhan:runAction(CCEaseSineOut:create(CCScaleTo:create(0.4, 1)))
				arg_4_0.uiTable.xuezhan:runAction(CCEaseSineOut:create(CCMoveTo:create(0.4, ccp(var_4_61, var_4_62))))
			end

			var_4_58 = arg_4_0.uiTable.xuezhan
			arg_4_0.autoBattleType = 1
		end

		if var_4_58 then
			var_4_58:registerScriptTapHandler(function()
				arg_4_0.control:startAutoBattle(var_4_4())
			end)
		end
	end

	if user.autoBattleTechGain and (smgr.currentSceneTag == SCENE_WORLD and user.autoBattleCityId ~= nil or smgr.currentSceneTag == SCENE_KFYZ_WORLD and user.kfAutoBattleCityId ~= nil or smgr.currentSceneTag == SCENE_KFEXPEDITION and user.kfAutoBattleCityId ~= nil) then
		local var_4_63

		arg_4_0.autoBattleType = nil

		if smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
			arg_4_0.uiTable.genghuanmubiao:setPosition(ccp(-100, 20))
		else
			arg_4_0.uiTable.genghuanmubiao:setPosition(ccp(100, 20))
		end

		arg_4_0.uiTable.xuezhan:setVisible(false)
		arg_4_0.uiTable.jianshou:setVisible(false)
		arg_4_0.uiTable.genghuanmubiao:setVisible(false)

		if var_4_4() then
			if arg_4_0.control.cityData.inBattle then
				if #arg_4_0.gidTable <= 4 or smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
					arg_4_0.uiTable.xuezhan:setVisible(false)
					arg_4_0.uiTable.jianshou:setVisible(false)
					arg_4_0.uiTable.genghuanmubiao:setVisible(true)
					arg_4_0.uiTable.genghuanmubiao:setScale(0)

					local var_4_64, var_4_65 = arg_4_0.uiTable.genghuanmubiao:getPosition()

					arg_4_0.uiTable.genghuanmubiao:setPosition(ccp(0, 0))
					arg_4_0.uiTable.genghuanmubiao:runAction(CCFadeIn:create(0.4))
					arg_4_0.uiTable.genghuanmubiao:runAction(CCEaseSineOut:create(CCScaleTo:create(0.4, 1)))
					arg_4_0.uiTable.genghuanmubiao:runAction(CCEaseSineOut:create(CCMoveTo:create(0.4, ccp(var_4_64, var_4_65))))
				end

				var_4_63 = arg_4_0.uiTable.genghuanmubiao
				arg_4_0.autoBattleType = 4
			end
		else
			if #arg_4_0.gidTable <= 4 or smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
				arg_4_0.uiTable.xuezhan:setVisible(false)
				arg_4_0.uiTable.jianshou:setVisible(false)
				arg_4_0.uiTable.genghuanmubiao:setVisible(true)
				arg_4_0.uiTable.genghuanmubiao:setScale(0)

				local var_4_66, var_4_67 = arg_4_0.uiTable.genghuanmubiao:getPosition()

				arg_4_0.uiTable.genghuanmubiao:setPosition(ccp(0, 0))
				arg_4_0.uiTable.genghuanmubiao:runAction(CCFadeIn:create(0.4))
				arg_4_0.uiTable.genghuanmubiao:runAction(CCEaseSineOut:create(CCScaleTo:create(0.4, 1)))
				arg_4_0.uiTable.genghuanmubiao:runAction(CCEaseSineOut:create(CCMoveTo:create(0.4, ccp(var_4_66, var_4_67))))
			end

			var_4_63 = arg_4_0.uiTable.genghuanmubiao
			arg_4_0.autoBattleType = 3
		end

		if var_4_63 then
			var_4_63:registerScriptTapHandler(function()
				local function var_37_0(arg_38_0)
					arg_4_0:exit()

					if smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
						user.kfAutoBattleCityId = arg_4_0.cityId
					else
						user.autoBattleCityId = arg_4_0.cityId
					end

					eventManager.dispatchEvent("autoBattleCityEffect", arg_4_0.cityId)

					local function var_38_0(arg_39_0)
						local var_39_0 = arg_39_0.data or arg_39_0.action.data

						if var_39_0 and var_39_0.cd then
							eventManager.dispatchEvent("autoBattleCDchange", var_39_0.cd)
						end
					end

					if smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
						kfcmgr.sendRequest(var_38_0, actions.getAutoBattleDetail)
					else
						cmgr.sendRequest(var_38_0, actions.getAutoBattleDetail)
					end

					log.info("user.autoMode: ", user.autoMode)

					if user.autoMode and user.autoMode == 2 then
						local function var_38_1(arg_40_0)
							return
						end

						if smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
							kfcmgr.sendRequest(var_38_1, actions.changeAutoBattleMode, user.autoMode)
						else
							cmgr.sendRequest(var_38_1, actions.changeAutoBattleMode, user.autoMode)
						end
					end

					if smgr.currentSceneTag == SCENE_WORLD then
						log.info("user.mode: ", user.mode)

						if user.mode == 2 then
							local function var_38_2(arg_41_0)
								local var_41_0 = arg_41_0.action.data

								user.district = var_41_0.district
							end

							cmgr.sendRequest(var_38_2, actions.battleChangeMode, 2)
						end
					end
				end

				log.info("user.autoBattleGids")

				if user.autoBattleGids and user.autoBattleGids ~= "" then
					log.info("change.autoBattle")

					if smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
						kfcmgr.sendRequest(var_37_0, actions.startAutoBattle, arg_4_0.cityId, user.autoBattleGids, true)
					else
						local var_37_1 = worldConstant.BUILDING_INFO["world_building_" .. arg_4_0.cityId].model

						if user.mode == 2 and string.find(var_37_1, "worldBuildingGuanqia") ~= nil then
							smgr.showTipText(language.get(421033))
						else
							cmgr.sendRequest(var_37_0, actions.startAutoBattle, arg_4_0.cityId, user.autoBattleGids, true)
						end
					end
				end
			end)
		end
	end

	arg_4_0.jianzaoduiNum = 0
	arg_4_0.gongjiangId = -1
	arg_4_0.gongjiangPlace = -1

	if smgr.currentSceneTag == SCENE_WORLD then
		for iter_4_15, iter_4_16 in pairs(generalMoveLayer.gongjiangTable) do
			arg_4_0.jianzaoduiNum = arg_4_0.jianzaoduiNum + 1
			arg_4_0.gongjiangPlace = iter_4_16.locationId
			arg_4_0.gongjiangId = iter_4_16.vId
		end

		if arg_4_0.jianzaoduiNum > 0 and arg_4_0.gongjiangPlace ~= arg_4_0.cityId and var_4_4() and var_4_5() then
			var_0_2 = true

			arg_4_0.uiTable.jianzaodui:setVisible(false)

			if not arg_4_1 then
				arg_4_0.uiTable.jianzaodui:setScale(0)

				local var_4_68, var_4_69 = arg_4_0.uiTable.jianzaodui:getPosition()

				arg_4_0.uiTable.jianzaodui:setPosition(ccp(0, 0))
				arg_4_0.uiTable.jianzaodui:runAction(CCFadeIn:create(0.4))
				arg_4_0.uiTable.jianzaodui:runAction(CCEaseSineOut:create(CCScaleTo:create(0.4, 1)))
				arg_4_0.uiTable.jianzaodui:runAction(CCEaseSineOut:create(CCMoveTo:create(0.4, ccp(var_4_68, var_4_69))))
			end
		end
	end
end

function var_0_0.calcLevel(arg_42_0, arg_42_1)
	if arg_42_1 then
		arg_42_0.uiTable.levelLabel:setVisible(true)
		arg_42_0.uiTable.levelLabel:setString(string.format("Lv.%s", arg_42_1))
	end
end

function var_0_0.calcProgress(arg_43_0, arg_43_1, arg_43_2)
	if arg_43_1 then
		arg_43_0.uiTable.progressBg:setVisible(true)
		arg_43_0.uiTable.progressValue:setPercentage(arg_43_1)
		arg_43_0.uiTable.progressLabel:setString(arg_43_1 .. "%")

		if arg_43_2 ~= true then
			arg_43_0.uiTable.progressBg:setScale(0)
			arg_43_0.uiTable.progressBg:runAction(CCScaleTo:create(0.4, 1))
		end
	end
end

function var_0_0.manzuDetail(arg_44_0)
	local var_44_0 = CCDelayTime:create(0.2)
	local var_44_1 = CCScaleTo:create(0.2, 1)
	local var_44_2 = CCShow:create()
	local var_44_3 = CCArray:create()

	var_44_3:addObject(var_44_0)
	var_44_3:addObject(var_44_2)
	var_44_3:addObject(var_44_1)

	local var_44_4 = CCSequence:create(var_44_3)

	if arg_44_0.detailLevel == 0 then
		arg_44_0.uiTable.cityConvene:runAction(CCScaleTo:create(0.2, 0))
		arg_44_0.uiTable.manzuInfo:setScale(0)
		arg_44_0.uiTable.manzuInfo:runAction(var_44_4)

		arg_44_0.detailLevel = 1

		arg_44_0.uiTable.qingmidu:setVisible(false)
		arg_44_0.uiTable.bingdengji:setVisible(false)
		arg_44_0.uiTable.nengfadong:setVisible(false)
	else
		arg_44_0.uiTable.manzuInfo:runAction(CCScaleTo:create(0.2, 0))
		arg_44_0.uiTable.cityConvene:setScale(0)
		arg_44_0.uiTable.cityConvene:runAction(var_44_4)

		arg_44_0.detailLevel = 0

		arg_44_0.uiTable.qingmidu:setVisible(false)
		arg_44_0.uiTable.bingdengji:setVisible(false)
		arg_44_0.uiTable.nengfadong:setVisible(false)
	end
end

local var_0_7 = {
	{
		[178] = 178,
		[93] = 93
	},
	{
		[52] = 52,
		[68] = 68
	},
	{
		[148] = 148,
		[179] = 179
	}
}
local var_0_8 = {
	{
		[78] = 78,
		[133] = 133,
		[177] = 177
	},
	{
		[102] = 102,
		[41] = 41,
		[70] = 70
	},
	{
		[144] = 144,
		[189] = 189,
		[149] = 149
	}
}

function var_0_0.switchPage(arg_45_0)
	local var_45_0 = {}
	local var_45_1 = {}

	if user.kbLv >= 1 and user.pin < 2 and arg_45_0.menuLevel == 1 and not arg_45_0.pagebuild then
		table.insert(var_45_0, arg_45_0.uiTable.jianzaodui)
		table.insert(var_45_0, arg_45_0.uiTable.xuezhan)
		table.insert(var_45_0, arg_45_0.uiTable.jianshou)
		table.insert(var_45_0, arg_45_0.uiTable.genghuanmubiao)
		table.insert(var_45_0, arg_45_0.uiTable.cityOrder)
		table.insert(var_45_0, arg_45_0.uiTable.tiyijianzao)
		table.insert(var_45_0, arg_45_0.uiTable.jianzaoyaosai)
		table.insert(var_45_0, arg_45_0.uiTable.jiaguyaosai)
		table.insert(var_45_0, arg_45_0.uiTable.plan1)
		table.insert(var_45_0, arg_45_0.uiTable.plan2)
		table.insert(var_45_0, arg_45_0.uiTable.shaOrder)

		if var_0_7[user.player.forceId][arg_45_0.cityId] or var_0_8[user.player.forceId][arg_45_0.cityId] then
			if var_0_7[user.player.forceId][arg_45_0.cityId] then
				table.insert(var_45_1, arg_45_0.uiTable.repairRoad)
			elseif var_0_8[user.player.forceId][arg_45_0.cityId] then
				table.insert(var_45_1, arg_45_0.uiTable.closeRoad)
			end
		else
			table.insert(var_45_1, arg_45_0.uiTable.repairRoadFind)
			table.insert(var_45_1, arg_45_0.uiTable.closeRoadFind)
		end

		arg_45_0.pagebuild = true
	elseif arg_45_0.menuLevel == 1 then
		arg_45_0.pagebuild = false

		if smgr.currentSceneTag == SCENE_JUBEN then
			local var_45_2 = 1
			local var_45_3 = eventManager.dispatchEvent("JubenGetGenerals", arg_45_0.cityId)

			for iter_45_0, iter_45_1 in pairs(var_45_3) do
				table.insert(var_45_1, arg_45_0.uiTable["cityGeneral_" .. var_45_2])

				var_45_2 = var_45_2 + 1
			end
		elseif arg_45_0.control.generalData.gIds == nil or smgr.currentSceneTag == SCENE_WORLD and var_0_3 then
			-- block empty
		else
			for iter_45_2 = 1, 5 do
				if arg_45_0.control.generalData.gIds[iter_45_2] then
					table.insert(var_45_1, arg_45_0.uiTable["cityGeneral_" .. iter_45_2])
				end
			end
		end

		if var_0_2 then
			table.insert(var_45_0, arg_45_0.uiTable.jianzaodui)
		end

		if smgr.currentSceneTag == SCENE_WORLD and var_0_3 then
			table.insert(var_45_1, arg_45_0.uiTable.juntuan)
		end

		if smgr.currentSceneTag == SCENE_WORLD and var_0_5 then
			table.insert(var_45_1, arg_45_0.uiTable.personJTEnter)
		end

		if smgr.currentSceneTag == SCENE_WORLD and var_0_4 then
			table.insert(var_45_1, arg_45_0.uiTable.juntuanEnter)
		end

		if arg_45_0.autoBattleType == 1 then
			if #arg_45_0.gidTable <= 4 then
				table.insert(var_45_1, arg_45_0.uiTable.xuezhan)
			else
				table.insert(var_45_0, arg_45_0.uiTable.xuezhan)
			end
		elseif arg_45_0.autoBattleType == 2 then
			if #arg_45_0.gidTable <= 4 then
				table.insert(var_45_1, arg_45_0.uiTable.jianshou)
			else
				table.insert(var_45_0, arg_45_0.uiTable.jianshou)
			end
		elseif arg_45_0.autoBattleType == 3 then
			if #arg_45_0.gidTable <= 4 then
				table.insert(var_45_1, arg_45_0.uiTable.genghuanmubiao)
			else
				table.insert(var_45_0, arg_45_0.uiTable.genghuanmubiao)
			end
		elseif arg_45_0.autoBattleType == 4 then
			table.insert(var_45_0, arg_45_0.uiTable.genghuanmubiao)
		end

		if var_0_1 == 0 then
			table.insert(var_45_0, arg_45_0.uiTable.cityOrder)
		elseif var_0_1 == 1 then
			table.insert(var_45_0, arg_45_0.uiTable.tiyijianzao)
		elseif var_0_1 == 2 then
			table.insert(var_45_0, arg_45_0.uiTable.jianzaoyaosai)
		elseif var_0_1 == 3 then
			table.insert(var_45_0, arg_45_0.uiTable.jiaguyaosai)
		end

		table.insert(var_45_0, arg_45_0.uiTable.plan1)
		table.insert(var_45_0, arg_45_0.uiTable.plan2)
		table.insert(var_45_0, arg_45_0.uiTable.shaOrder)
		table.insert(var_45_0, arg_45_0.uiTable.repairRoad)
		table.insert(var_45_0, arg_45_0.uiTable.closeRoad)
		table.insert(var_45_0, arg_45_0.uiTable.repairRoadFind)
		table.insert(var_45_0, arg_45_0.uiTable.closeRoadFind)

		arg_45_0.menuLevel = 0
	elseif arg_45_0.menuLevel == 0 then
		if smgr.currentSceneTag == SCENE_JUBEN then
			local var_45_4 = 1
			local var_45_5 = eventManager.dispatchEvent("JubenGetGenerals", arg_45_0.cityId)

			for iter_45_3, iter_45_4 in pairs(var_45_5) do
				table.insert(var_45_0, arg_45_0.uiTable["cityGeneral_" .. var_45_4])

				var_45_4 = var_45_4 + 1
			end
		elseif arg_45_0.control.generalData.gIds == nil or smgr.currentSceneTag == SCENE_WORLD and var_0_3 then
			-- block empty
		else
			for iter_45_5 = 1, 5 do
				if arg_45_0.control.generalData.gIds[iter_45_5] then
					table.insert(var_45_0, arg_45_0.uiTable["cityGeneral_" .. iter_45_5])
				end
			end
		end

		if var_0_2 then
			table.insert(var_45_1, arg_45_0.uiTable.jianzaodui)
		end

		if smgr.currentSceneTag == SCENE_WORLD and var_0_3 then
			table.insert(var_45_0, arg_45_0.uiTable.juntuan)
		end

		if smgr.currentSceneTag == SCENE_WORLD and var_0_5 then
			table.insert(var_45_1, arg_45_0.uiTable.personJTEnter)
		end

		if smgr.currentSceneTag == SCENE_WORLD and var_0_4 then
			table.insert(var_45_0, arg_45_0.uiTable.juntuanEnter)
		end

		if arg_45_0.autoBattleType == 1 then
			table.insert(var_45_1, arg_45_0.uiTable.xuezhan)
		elseif arg_45_0.autoBattleType == 2 then
			table.insert(var_45_1, arg_45_0.uiTable.jianshou)
		elseif arg_45_0.autoBattleType == 3 then
			table.insert(var_45_1, arg_45_0.uiTable.genghuanmubiao)
		elseif arg_45_0.autoBattleType == 4 then
			table.insert(var_45_1, arg_45_0.uiTable.genghuanmubiao)
		end

		require("lua/layer/world/control")

		if worldControl.canBuildCastle then
			local var_45_6 = smgr.getLayer("worldCamera")
			local var_45_7 = 0

			if var_45_6.worldFireTable["cityId_" .. arg_45_0.cityId] then
				for iter_45_6, iter_45_7 in pairs(var_45_6.worldFireTable["cityId_" .. arg_45_0.cityId]) do
					var_45_7 = var_45_7 + 1
				end
			end

			var_0_1 = 0

			if var_45_7 == 0 and var_45_6.cityTable["world_building_" .. arg_45_0.cityId] then
				local var_45_8 = var_45_6.cityTable["world_building_" .. arg_45_0.cityId].prop

				if tonumber(var_45_8[2]) == user.player.forceId and (worldConstant.BUILDING_INFO["world_building_" .. arg_45_0.cityId].model == "worldBuildingGuanqia1.png" or worldConstant.BUILDING_INFO["world_building_" .. arg_45_0.cityId].model == "worldBuildingGuanqia2.png" or worldConstant.BUILDING_INFO["world_building_" .. arg_45_0.cityId].model == "worldBuildingGuanqia3.png" or worldConstant.BUILDING_INFO["world_building_" .. arg_45_0.cityId].model == "worldBuildingChengchi1.png" or worldConstant.BUILDING_INFO["world_building_" .. arg_45_0.cityId].model == "worldBuildingChengchi2.png" or worldConstant.BUILDING_INFO["world_building_" .. arg_45_0.cityId].model == "worldBuildingTesechengchi.png") then
					if user.pin and user.pin <= 1 then
						if worldControl.castles[arg_45_0.cityId] and worldControl.castles[arg_45_0.cityId].state == 3 and worldControl.castles[arg_45_0.cityId].index < 3 then
							table.insert(var_45_1, arg_45_0.uiTable.jiaguyaosai)

							var_0_1 = 3
						elseif worldControl.castles[arg_45_0.cityId] and worldControl.castles[arg_45_0.cityId].state == 3 and worldControl.castles[arg_45_0.cityId].index >= 3 then
							var_0_1 = 0
						else
							table.insert(var_45_1, arg_45_0.uiTable.jianzaoyaosai)

							var_0_1 = 2
						end
					elseif worldControl.castles[arg_45_0.cityId] and worldControl.castles[arg_45_0.cityId].state == 3 then
						-- block empty
					else
						table.insert(var_45_1, arg_45_0.uiTable.tiyijianzao)

						var_0_1 = 1
					end
				end
			end
		end

		if user.pin and user.pin <= 1 then
			if var_0_1 == 0 then
				table.insert(var_45_1, arg_45_0.uiTable.cityOrder)
			end

			table.insert(var_45_1, arg_45_0.uiTable.shaOrder)
		end

		if user.isOpenWenguan() == true then
			table.insert(var_45_1, arg_45_0.uiTable.plan1)
			table.insert(var_45_1, arg_45_0.uiTable.plan2)
		end

		table.insert(var_45_0, arg_45_0.uiTable.repairRoad)
		table.insert(var_45_0, arg_45_0.uiTable.closeRoad)
		table.insert(var_45_0, arg_45_0.uiTable.repairRoadFind)
		table.insert(var_45_0, arg_45_0.uiTable.closeRoadFind)

		arg_45_0.menuLevel = 1
	end

	for iter_45_8, iter_45_9 in pairs(var_45_0) do
		iter_45_9:runAction(CCScaleTo:create(0.2, 0))
	end

	for iter_45_10, iter_45_11 in pairs(var_45_1) do
		local var_45_9 = CCDelayTime:create(0.2)
		local var_45_10 = CCScaleTo:create(0.2, 1)
		local var_45_11 = CCShow:create()
		local var_45_12 = CCArray:create()

		var_45_12:addObject(var_45_9)
		var_45_12:addObject(var_45_11)
		var_45_12:addObject(var_45_10)

		local var_45_13 = CCSequence:create(var_45_12)

		iter_45_11:runAction(var_45_13)
		iter_45_11:setScale(0)
	end
end

function var_0_0.showOrder(arg_46_0)
	local var_46_0 = require("lua/layer/world/cityWindow2/CityOrderLayer").new(arg_46_0.cityId)
	local var_46_1 = smgr.getLayer("topLayer")

	var_46_1:removeAllChildrenWithCleanup(true)
	var_46_1:addChild(var_46_0)
end

function var_0_0.hide(arg_47_0)
	local var_47_0 = CCScaleTo:create(0.4, 0)

	arg_47_0.uiTable.background:runAction(var_47_0)
end

function var_0_0.exit(arg_48_0, arg_48_1)
	arg_48_1 = arg_48_1 or false

	if arg_48_1 then
		arg_48_0:removeFromParentAndCleanup(true)
		eventManager.dispatchEvent("hideWorldElement", false, arg_48_0.cityId)
	else
		local var_48_0 = CCArray:create()
		local var_48_1 = CCScaleTo:create(0.4, 0)

		var_48_0:addObject(var_48_1)
		var_48_0:addObject(CCCallFuncN:create(function()
			arg_48_0:removeFromParentAndCleanup(true)
		end))

		if arg_48_0.uiTable and arg_48_0.uiTable.background then
			arg_48_0.uiTable.background:runAction(CCSequence:create(var_48_0))
		end

		eventManager.dispatchEvent("hideWorldElement", false, arg_48_0.cityId)
	end

	log.info("city %s exit", arg_48_0.cityId)
end

return var_0_0
