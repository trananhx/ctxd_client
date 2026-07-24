empire = {}

tool.requireRes("empire")

empire.ui = {}
empire.ui.table = {}
empire.ui.pageIndex = 0
empire.ui.touch = {}
empire.ui.currentSelectBuilding = 0
empire.ui.isExpand = true
empire.ui.scale_bg_height = 0
empire.ui.isFirstTimeEnter = false

function empire.ui.updateSingleBuild(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if arg_1_1 == 2 then
		local var_1_0 = CCSprite:create("res/ui/empire/off_city_name_full.png")

		empire.ui.table["build_state_" .. arg_1_0]:setDisplayFrame(var_1_0:displayFrame())
	elseif arg_1_1 == 0 then
		local var_1_1 = CCSprite:create("res/ui/empire/off_city_name_city_empty.png")

		empire.ui.table["build_state_" .. arg_1_0]:setDisplayFrame(var_1_1:displayFrame())
	else
		local var_1_2 = CCSprite:create("res/ui/empire/off_city_name_emp.png")

		empire.ui.table["build_state_" .. arg_1_0]:setDisplayFrame(var_1_2:displayFrame())
	end

	if arg_1_3 == 1 then
		local var_1_3 = CCArray:create()

		for iter_1_0 = 0, 4 do
			local var_1_4 = CCSprite:create("res/ui/empire/fire/" .. string.format("worldFire_%05d.png", iter_1_0))

			var_1_3:addObject(var_1_4:displayFrame())
		end

		local var_1_5 = CCAnimation:createWithSpriteFrames(var_1_3, 0.1)
		local var_1_6 = CCAnimate:create(var_1_5)
		local var_1_7 = CCArray:create()

		var_1_7:addObject(var_1_6)

		local var_1_8 = CCSequence:create(var_1_7)
		local var_1_9 = CCRepeatForever:create(tolua.cast(var_1_8, "CCActionInterval"))
		local var_1_10 = CCSprite:create("res/ui/empire/fire/worldFire_00000.png")
		local var_1_11 = empire.ui.table["build_" .. arg_1_0]:getContentSize()

		var_1_10:setPosition(ccp(var_1_11.width / 2, var_1_11.height))
		empire.ui.table["build_" .. arg_1_0]:addChild(var_1_10)

		empire.ui.table["fire_" .. arg_1_0] = var_1_10

		var_1_10:runAction(var_1_9)
	elseif empire.ui.table["fire_" .. arg_1_0] ~= nil then
		empire.ui.table["build_" .. arg_1_0]:removeChild(empire.ui.table["fire_" .. arg_1_0], true)
	end

	empire.ui.table["build_name_" .. arg_1_0]:setString(arg_1_2)
	empire.ui.table["build_name_bg_" .. arg_1_0]:setVisible(true)
end

function empire.ui.updateBuildingInfo(arg_2_0)
	for iter_2_0, iter_2_1 in pairs(arg_2_0) do
		local var_2_0 = iter_2_1.buildingId
		local var_2_1 = 1

		if tonumber(iter_2_1.currentMemberNum) == 0 then
			var_2_1 = 0
		elseif tonumber(iter_2_1.currentMemberNum) > tonumber(iter_2_1.maxMemberNum) then
			var_2_1 = 2
		end

		empire.ui.updateSingleBuild(var_2_0, var_2_1, iter_2_1.occupyBuildingName, iter_2_1.inBattle)

		empire.data.buildings[var_2_0] = iter_2_1

		if var_2_0 == 18 then
			empire.data.buildings[18] = iter_2_1
		end

		if var_2_0 == 19 then
			empire.data.buildings[41] = iter_2_1
		end
	end

	empire.ui.table.layer:setVisible(true)
end

function empire.ui.updateHeadFrame(arg_3_0)
	empire.ui.table["Portrait_bg_" .. 1]:setVisible(false)
	empire.ui.table["Portrait_" .. 1]:setVisible(false)
	empire.ui.table["Portrait_bg_" .. 2]:setVisible(false)
	empire.ui.table["Portrait_" .. 2]:setVisible(false)

	if arg_3_0 ~= nil then
		local var_3_0, var_3_1 = empire.ui.table["build_" .. arg_3_0]:getPosition()
		local var_3_2 = 1

		if arg_3_0 > 20 then
			var_3_2 = 2
		end

		local var_3_3 = "res/ui/common/playerHead/playerHead_icon_" .. user.player.pic .. ".png"
		local var_3_4 = CCSprite:create(var_3_3)

		empire.ui.table["Portrait_" .. var_3_2]:setDisplayFrame(var_3_4:displayFrame())
		empire.ui.table["Portrait_bg_" .. var_3_2]:setPosition(var_3_0, var_3_1 + 10)
		empire.ui.table["Portrait_" .. var_3_2]:setPosition(var_3_0, var_3_1 + 10)
		empire.ui.table["Portrait_bg_" .. var_3_2]:setVisible(true)
		empire.ui.table["Portrait_" .. var_3_2]:setVisible(true)
	end
end

function empire.ui.showTips()
	if empire.ui.table.scale_bg ~= nil then
		empire.ui.table.tips_bg:removeChild(empire.ui.table.scale_bg, true)

		empire.ui.table.scale_bg = nil
	end

	local var_4_0 = CCSprite:create("res/ui/empire/officer_name/" .. empire.data.myOfficerName .. ".png")

	if var_4_0 == nil then
		print("bug a bug --->, empire.ui.showTips ", empire.data.myOfficerName)
	else
		empire.ui.table.tips_name:setDisplayFrame(var_4_0:displayFrame())
	end

	if empire.ui.isExpand == true then
		empire.ui.table.arraw_down:setVisible(true)
		empire.ui.table.arraw_up:setVisible(false)
	else
		empire.ui.table.arraw_down:setVisible(false)
		empire.ui.table.arraw_up:setVisible(true)
	end

	if empire.ui.isExpand == true then
		local var_4_1 = {}

		for iter_4_0, iter_4_1 in ipairs(empire.data.resourceAddition) do
			if iter_4_1.count > 0 then
				table.insert(var_4_1, iter_4_1)
			end
		end

		local var_4_2 = 40
		local var_4_3 = #var_4_1 * var_4_2 + 10

		if empire.data.applyInfo ~= nil then
			var_4_3 = #var_4_1 * var_4_2 + 10 + #empire.data.applyInfo * 48
		end

		empire.ui.scale_bg_height = var_4_3

		local var_4_4 = 187
		local var_4_5 = CCScale9Sprite:create("res/ui/empire/off_state_evol_view_bg.png", CCRectMake(0, 0, 188, 69), CCRectMake(20, 20, 148, 29))

		var_4_5:setContentSize(CCSizeMake(var_4_4, var_4_3))
		var_4_5:setPosition(ccp(var_4_4 / 2, -var_4_3 / 2))

		empire.ui.table.scale_bg = var_4_5

		local var_4_6 = var_4_3 - 10

		for iter_4_2, iter_4_3 in ipairs(var_4_1) do
			if iter_4_3.resourceType <= 4 then
				local var_4_7 = CCSprite:create("res/ui/empire/off_state_evol_list_bg.png")

				var_4_7:setPosition(ccp(94, var_4_6 - var_4_2 / 2 - 5))
				var_4_5:addChild(var_4_7)

				local var_4_8 = CCSprite:create("res/ui/empire/off_state_evol_icon_bg.png")

				var_4_8:setPosition(ccp(30, var_4_6 - var_4_2 / 2 + 4))
				var_4_5:addChild(var_4_8)

				local var_4_9 = CCSprite:createWithSpriteFrameName("res_icon_" .. tostring(iter_4_3.resourceType) .. ".png")

				var_4_9:setPosition(ccp(30, var_4_6 - var_4_2 / 2 + 4))
				var_4_9:setScale(0.7)
				var_4_5:addChild(var_4_9)

				local var_4_10 = language.get(180001, iter_4_3.count)
				local var_4_11 = CCLabelTTF:create(var_4_10, "", "20")

				var_4_11:setAnchorPoint(ccp(0, 0.5))
				var_4_11:setPosition(ccp(70, var_4_6 - var_4_2 / 2 + 4))
				var_4_5:addChild(var_4_11)
			elseif iter_4_3.resourceType == 5 then
				local var_4_12 = CCSprite:create("res/ui/empire/off_state_evol_list_bg.png")

				var_4_12:setPosition(ccp(94, var_4_6 - var_4_2 / 2 - 5))
				var_4_5:addChild(var_4_12)

				local var_4_13 = CCSprite:create("res/ui/empire/off_state_evol_icon_bg.png")

				var_4_13:setPosition(ccp(30, var_4_6 - var_4_2 / 2 + 4))
				var_4_5:addChild(var_4_13)

				local var_4_14 = CCSprite:create("res/ui/empire/off_state_evol_icon_yz.png")

				var_4_14:setPosition(ccp(30, var_4_6 - var_4_2 / 2 + 4))
				var_4_5:addChild(var_4_14)

				local var_4_15 = language.get(180002, iter_4_3.count)
				local var_4_16 = CCLabelTTF:create(var_4_15, "", "20")

				var_4_16:setAnchorPoint(ccp(0, 0.5))
				var_4_16:setPosition(ccp(70, var_4_6 - var_4_2 / 2 + 4))
				var_4_5:addChild(var_4_16)
			elseif iter_4_3.resourceType == 6 then
				local var_4_17 = CCSprite:create("res/ui/empire/off_state_evol_list_bg.png")

				var_4_17:setPosition(ccp(94, var_4_6 - var_4_2 / 2 - 5))
				var_4_5:addChild(var_4_17)

				local var_4_18 = CCSprite:create("res/ui/empire/off_state_evol_icon_bg.png")

				var_4_18:setPosition(ccp(30, var_4_6 - var_4_2 / 2 + 4))
				var_4_5:addChild(var_4_18)

				local var_4_19 = CCSprite:create("res/ui/empire/off_state_evol_icon_chop.png")

				var_4_19:setPosition(ccp(30, var_4_6 - var_4_2 / 2 + 4))
				var_4_5:addChild(var_4_19)

				local var_4_20 = iter_4_3.count / 1000 / 3600
				local var_4_21 = math.floor(var_4_20 / 24)
				local var_4_22 = math.floor(var_4_20 - var_4_21 * 24)
				local var_4_23 = ""

				if var_4_21 == 0 then
					if var_4_22 == 0 then
						var_4_23 = language.get(180003, "1")
					else
						var_4_23 = language.get(180003, var_4_22)
					end
				elseif var_4_22 == 0 then
					var_4_23 = language.get(180004, var_4_21)
				else
					var_4_23 = language.get(180005, var_4_21, var_4_22)
				end

				local var_4_24 = CCLabelTTF:create(var_4_23, "", "20")

				var_4_24:setAnchorPoint(ccp(0, 0.5))
				var_4_24:setPosition(ccp(70, var_4_6 - var_4_2 / 2 + 4))
				var_4_5:addChild(var_4_24)
			end

			var_4_6 = var_4_6 - var_4_2
		end

		if empire.data.applyInfo ~= nil then
			for iter_4_4 = 1, 2 do
				local var_4_25 = empire.data.applyInfo[iter_4_4]

				if var_4_25 ~= nil then
					local var_4_26 = CCSprite:create("res/ui/empire/off_state_evol_seco_view.png")

					var_4_26:setPosition(ccp(94, var_4_6 - var_4_2 / 2))
					var_4_5:addChild(var_4_26)

					local var_4_27 = CCLabelTTF:create(var_4_25.playerName, "", "20")

					var_4_27:setAnchorPoint(ccp(0, 0.5))
					var_4_27:setPosition(ccp(20, var_4_6 - var_4_2 / 2))
					var_4_5:addChild(var_4_27)

					local var_4_28 = CCSprite:createWithSpriteFrameName("choi_close_a.png")
					local var_4_29 = CCSprite:createWithSpriteFrameName("choi_close_click.png")
					local var_4_30 = CCMenuItemSprite:create(var_4_28, var_4_29)

					var_4_30:registerScriptTapHandler(empire.control.click_tick)
					var_4_30:setPosition(ccp(163, var_4_6 - var_4_2 / 2))

					local var_4_31 = CCMenu:create()

					var_4_31:setPosition(ccp(0, 0))
					var_4_31:addChild(var_4_30, 1, iter_4_4)
					var_4_5:addChild(var_4_31)
				end

				var_4_6 = var_4_6 - 45
			end
		end

		empire.ui.table.tips_bg:addChild(var_4_5)
	end

	empire.ui.table.tips_bg:setVisible(true)
end

function empire.ui.updateClickInfo(arg_5_0)
	local var_5_0, var_5_1 = empire.ui.table["build_" .. arg_5_0]:getPosition()

	if var_5_0 + 249 > visibleSize.width then
		var_5_0 = var_5_0 - 249
	end

	if var_5_1 + 220 > visibleSize.height then
		var_5_1 = var_5_1 - 222
	end

	if empire.ui.pageIndex == 1 then
		var_5_0 = var_5_0 + 1386
	end

	empire.ui.table.info_bg:setPosition(ccp(var_5_0 + 50, var_5_1 + 50))
	empire.ui.table.info_bg:setVisible(true)

	local var_5_2 = empire.data.buildings[arg_5_0]
	local var_5_3 = false

	if arg_5_0 == 18 or arg_5_0 == 20 or arg_5_0 == 19 or arg_5_0 == 41 then
		var_5_3 = true
	end

	local var_5_4 = tonumber(var_5_2.currentMemberNum) - 1

	if var_5_4 < 0 then
		var_5_4 = 0
	end

	local var_5_5 = CCSprite:create("res/ui/empire/off_city_view_list_bg.png")
	local var_5_6 = CCSprite:create("res/ui/empire/off_city_view_list_mine.png")

	empire.ui.table.key_11:setColor(colorQuality[tonumber(var_5_2.pin)])
	empire.ui.table.key_21:setColor(colorQuality[tonumber(var_5_2.pin)])

	if var_5_3 == true then
		empire.ui.table.key_11:setPosition(ccp(15, 175))
		empire.ui.table.key_22:setPosition(ccp(15, 108))
		empire.ui.table.key_11:setString(var_5_2.officerName .. ": " .. var_5_2.owner)
		empire.ui.table.key_12:setVisible(false)
		empire.ui.table.key_21:setVisible(false)

		if empire.data.myBuildingId ~= nil and empire.data.myBuildingId == arg_5_0 then
			empire.ui.table.key_22:setString(language.get(180006, var_5_2.maxAddition))
		else
			empire.ui.table.key_22:setString(language.get(180006, var_5_2.maxAddition))
		end

		empire.ui.table.area1:setDisplayFrame(var_5_5:displayFrame())
		empire.ui.table.area2:setDisplayFrame(var_5_5:displayFrame())
	else
		empire.ui.table.key_11:setPosition(ccp(15, 190))
		empire.ui.table.key_22:setPosition(ccp(15, 93))
		empire.ui.table.key_11:setString(var_5_2.officerName .. ": " .. var_5_2.owner)
		empire.ui.table.key_12:setString(language.get(180006, var_5_2.maxAddition))
		empire.ui.table.key_21:setString(var_5_2.normalOfficerName .. ": " .. var_5_4 .. "/" .. var_5_2.maxMemberNum)
		empire.ui.table.key_22:setString(language.get(180006, var_5_2.normalAddition))
		empire.ui.table.key_12:setVisible(true)
		empire.ui.table.key_21:setVisible(true)

		if empire.data.myBuildingId ~= nil and empire.data.myBuildingId == arg_5_0 then
			if var_5_2.owner == user.player.name then
				empire.ui.table.area1:setDisplayFrame(var_5_6:displayFrame())
				empire.ui.table.area2:setDisplayFrame(var_5_5:displayFrame())
			else
				empire.ui.table.area1:setDisplayFrame(var_5_5:displayFrame())
				empire.ui.table.area2:setDisplayFrame(var_5_6:displayFrame())
			end
		else
			empire.ui.table.area1:setDisplayFrame(var_5_5:displayFrame())
			empire.ui.table.area2:setDisplayFrame(var_5_5:displayFrame())
		end
	end

	empire.ui.table.btn_zhanling:setVisible(false)
	empire.ui.table.btn_shenqing:setVisible(false)
	empire.ui.table.btn_xiangqing:setVisible(false)
	empire.ui.table.btn_fangqi:setVisible(false)
	empire.ui.table.title_zhanling:setVisible(false)
	empire.ui.table.title_shenqing:setVisible(false)
	empire.ui.table.title_xiangqing:setVisible(false)
	empire.ui.table.title_fangqi:setVisible(false)

	if empire.data.myBuildingId ~= nil and empire.data.myBuildingId == arg_5_0 then
		empire.ui.table.btn_xiangqing:setPosition(ccp(125, 40))
		empire.ui.table.title_xiangqing:setPosition(ccp(125, 40))
		empire.ui.table.btn_xiangqing:setVisible(true)
		empire.ui.table.title_xiangqing:setVisible(true)
	elseif empire.data.canQuit == true then
		empire.ui.table.btn_zhanling:setPosition(ccp(70, 40))
		empire.ui.table.title_zhanling:setPosition(ccp(70, 40))
		empire.ui.table.btn_fangqi:setPosition(ccp(180, 40))
		empire.ui.table.title_fangqi:setPosition(ccp(180, 40))
		empire.ui.table.btn_zhanling:setVisible(true)
		empire.ui.table.title_zhanling:setVisible(true)
		empire.ui.table.btn_fangqi:setVisible(true)
		empire.ui.table.title_fangqi:setVisible(true)
	elseif empire.data.canApply == true then
		empire.ui.table.btn_zhanling:setPosition(ccp(70, 40))
		empire.ui.table.title_zhanling:setPosition(ccp(70, 40))
		empire.ui.table.btn_shenqing:setPosition(ccp(180, 40))
		empire.ui.table.title_shenqing:setPosition(ccp(180, 40))
		empire.ui.table.btn_zhanling:setVisible(true)
		empire.ui.table.title_zhanling:setVisible(true)
		empire.ui.table.btn_shenqing:setVisible(true)
		empire.ui.table.title_shenqing:setVisible(true)
	else
		if empire.data.buildings[arg_5_0].inBattle == 1 then
			empire.ui.table.title_zhanling:setString(language.get(180008))
		else
			empire.ui.table.title_zhanling:setString(language.get(180009))
		end

		empire.ui.table.btn_zhanling:setPosition(ccp(125, 40))
		empire.ui.table.title_zhanling:setPosition(ccp(125, 40))
		empire.ui.table.btn_zhanling:setVisible(true)
		empire.ui.table.title_zhanling:setVisible(true)
	end
end

function empire.ui.isInBuilding(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = empire.ui.table["build_" .. arg_6_0]:getContentSize()
	local var_6_1 = var_6_0.width * var_6_0.height / 2
	local var_6_2 = var_6_0.height * arg_6_1 - var_6_0.width * arg_6_2
	local var_6_3 = var_6_0.height * arg_6_1 + var_6_0.width * arg_6_2

	if var_6_2 > -var_6_1 and var_6_2 < var_6_1 and var_6_3 > -var_6_1 and var_6_3 < var_6_1 then
		return true
	end

	return false
end

function empire.ui.onTouch(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_0 == CCTOUCHBEGAN then
		empire.ui.touch.x = arg_7_1
		empire.ui.touch.y = arg_7_2

		return true
	elseif arg_7_0 == CCTOUCHENDED and math.abs(empire.ui.touch.x - arg_7_1) < 20 and math.abs(empire.ui.touch.y - arg_7_2) < 20 then
		local var_7_0, var_7_1 = empire.ui.table.tips_bg:getPosition()
		local var_7_2 = empire.ui.table.tips_bg:getContentSize()
		local var_7_3 = arg_7_1 - var_7_0
		local var_7_4 = arg_7_2 - var_7_1

		if empire.ui.pageIndex == 0 then
			if var_7_3 > -var_7_2.width / 2 and var_7_3 < var_7_2.width / 2 and var_7_4 > -var_7_2.height / 2 and var_7_4 < var_7_2.height / 2 then
				empire.ui.isExpand = not empire.ui.isExpand

				empire.ui.showTips()

				return
			end

			if empire.ui.isExpand == true and var_7_3 > -var_7_2.width / 2 and var_7_3 < var_7_2.width / 2 and var_7_4 > -var_7_2.height / 2 - empire.ui.scale_bg_height and var_7_4 < var_7_2.height / 2 then
				return true
			end
		elseif empire.ui.pageIndex == 1 then
			if var_7_3 + 1386 > -var_7_2.width / 2 and var_7_3 + 1386 < var_7_2.width / 2 and var_7_4 > -var_7_2.height / 2 and var_7_4 < var_7_2.height / 2 then
				empire.ui.isExpand = not empire.ui.isExpand

				empire.ui.showTips()

				return
			end

			if empire.ui.isExpand == true and var_7_3 + 1386 > -var_7_2.width / 2 and var_7_3 + 1386 < var_7_2.width / 2 and var_7_4 > -var_7_2.height / 2 - empire.ui.scale_bg_height and var_7_4 < var_7_2.height / 2 then
				return true
			end
		end

		local var_7_5 = empire.ui.table.bg_1:getContentSize()
		local var_7_6 = var_7_5.width / 2 - visibleSize.width / 2 + arg_7_1
		local var_7_7 = var_7_5.height / 2 - visibleSize.height / 2 + arg_7_2

		empire.ui.currentSelectBuilding = -1

		if empire.ui.pageIndex == 0 then
			for iter_7_0 = 1, 19 do
				local var_7_8, var_7_9 = empire.ui.table["build_" .. iter_7_0]:getPosition()

				if empire.ui.isInBuilding(iter_7_0, var_7_6 - var_7_8, var_7_7 - var_7_9) == true then
					empire.ui.currentSelectBuilding = iter_7_0

					empire.control.request_operate()
				end
			end
		end

		if empire.ui.pageIndex == 1 then
			for iter_7_1 = 21, 40 do
				local var_7_10, var_7_11 = empire.ui.table["build_" .. iter_7_1]:getPosition()

				if empire.ui.isInBuilding(iter_7_1, var_7_6 - var_7_10, var_7_7 - var_7_11) == true then
					empire.ui.currentSelectBuilding = iter_7_1

					empire.control.request_operate()
				end
			end
		end

		if empire.ui.currentSelectBuilding == -1 then
			empire.ui.table.info_bg:setVisible(false)
		end
	end
end

function empire.ui.init()
	for iter_8_0 = 1, 41 do
		local var_8_0, var_8_1 = empire.ui.table["build_" .. iter_8_0]:getPosition()
		local var_8_2

		if conf.language == "vie" then
			var_8_2 = CCScale9Sprite:create("res/ui/empire/off_city_name_view.png")

			var_8_2:setPreferredSize(CCSizeMake(220, 41))
		elseif conf.language == "tha" then
			var_8_2 = CCScale9Sprite:create("res/ui/empire/off_city_name_view.png")

			var_8_2:setPreferredSize(CCSizeMake(150, 41))
		else
			var_8_2 = CCSprite:create("res/ui/empire/off_city_name_view.png")
		end

		var_8_2:setPosition(ccp(var_8_0, var_8_1 - 40))

		empire.ui.table["build_name_bg_" .. iter_8_0] = var_8_2

		local var_8_3 = CCSprite:create("res/ui/empire/off_city_name_emp.png")

		if conf.language == "vie" or conf.language == "tha" then
			var_8_3:setScale(0.75)
		end

		var_8_3:setPosition(ccp(20, 20))
		var_8_2:addChild(var_8_3)

		empire.ui.table["build_state_" .. iter_8_0] = var_8_3

		local var_8_4 = CCLabelTTF:create("", "", 20)

		if conf.language == "vie" then
			var_8_4:setPosition(ccp(125, 20))
		elseif conf.language == "tha" then
			var_8_4:setPosition(ccp(95, 20))
		else
			var_8_4:setPosition(ccp(75, 20))
		end

		var_8_4:setColor(ccc3(188, 167, 145))
		var_8_2:addChild(var_8_4)

		empire.ui.table["build_name_" .. iter_8_0] = var_8_4

		if iter_8_0 <= 19 then
			empire.ui.table.bg_1:addChild(var_8_2, 10000)
		else
			empire.ui.table.bg_2:addChild(var_8_2, 10000)
		end

		var_8_2:setVisible(false)
	end

	empire.ui.table.Portrait_bg_1:setScale(0.6)
	empire.ui.table.Portrait_1:setScale(0.6)
	empire.ui.table.Portrait_bg_2:setScale(0.6)
	empire.ui.table.Portrait_2:setScale(0.6)
	empire.ui.table.Portrait_bg_1:setVisible(false)
	empire.ui.table.Portrait_1:setVisible(false)
	empire.ui.table.Portrait_bg_2:setVisible(false)
	empire.ui.table.Portrait_2:setVisible(false)
	empire.ui.table.key_11:setAnchorPoint(ccp(0, 0.5))
	empire.ui.table.key_12:setAnchorPoint(ccp(0, 0.5))
	empire.ui.table.key_21:setAnchorPoint(ccp(0, 0.5))
	empire.ui.table.key_22:setAnchorPoint(ccp(0, 0.5))
	empire.ui.table.info_bg:setVisible(false)
	empire.ui.table.btn_zhanling:registerScriptTapHandler(empire.control.clicked_zhanling)
	empire.ui.table.btn_shenqing:registerScriptTapHandler(empire.control.clicked_shenqing)
	empire.ui.table.btn_xiangqing:registerScriptTapHandler(empire.control.clicked_xiangqing)
	empire.ui.table.btn_fangqi:registerScriptTapHandler(empire.control.request_drop)
	empire.ui.table["build_name_bg_" .. 20]:setVisible(false)
	empire.ui.table["build_name_bg_" .. 41]:setVisible(false)

	empire.ui.isExpand = false

	empire.ui.table.tips_bg:setVisible(false)
	empire.ui.table.layer:setVisible(false)

	empire.ui.isFirstTimeEnter = true
end

function empire.ui.switchMyPosition()
	if empire.data.myBuildingId ~= nil then
		if tonumber(empire.data.myBuildingId) < 20 then
			empire.ui.pageIndex = 0
		else
			empire.ui.pageIndex = 1
		end
	else
		empire.ui.pageIndex = 0
	end

	if empire.ui.pageIndex == 1 then
		empire.ui.table.layer:setPosition(ccp(-1386, 0))

		local var_9_0, var_9_1 = empire.ui.table.tips_bg:getPosition()

		empire.ui.table.tips_bg:setPosition(ccp(var_9_0 + 1386, var_9_1))
	end

	empire.ui.table.layer:setVisible(true)
end

function empire.ui.slideLeft()
	if empire.ui.pageIndex == 0 then
		empire.ui.pageIndex = 1

		local var_10_0, var_10_1 = empire.ui.table.layer:getPosition()
		local var_10_2 = CCMoveTo:create(0.5, ccp(-1386, 0))

		empire.ui.table.layer:runAction(var_10_2)

		local var_10_3, var_10_4 = empire.ui.table.tips_bg:getPosition()
		local var_10_5 = CCMoveTo:create(0.5, ccp(var_10_3 + 1386, var_10_4))

		empire.ui.table.tips_bg:runAction(var_10_5)
	end
end

function empire.ui.slideRight()
	if empire.ui.pageIndex == 1 then
		empire.ui.pageIndex = 0

		local var_11_0, var_11_1 = empire.ui.table.layer:getPosition()
		local var_11_2 = CCMoveTo:create(0.5, ccp(0, 0))

		empire.ui.table.layer:runAction(var_11_2)

		local var_11_3, var_11_4 = empire.ui.table.tips_bg:getPosition()
		local var_11_5 = CCMoveTo:create(0.5, ccp(var_11_3 - 1386, var_11_4))

		empire.ui.table.tips_bg:runAction(var_11_5)
	end
end

function empire.ui.show()
	local var_12_0 = createBaseLayer()

	empire.ui.table = autoUI.initUI(var_12_0, getEmpireData())
	empire.ui.table.layer = var_12_0

	function var_12_0.onEnter()
		eventManager.registerEvent("touch_move_left", empire.ui.slideLeft)
		eventManager.registerEvent("touch_move_right", empire.ui.slideRight)
		menuUI.ui.show()
		playerInfoUI.show()
		empire.control.onEnter()
	end

	function var_12_0.onExit()
		eventManager.unregisterEvent("touch_move_left", empire.ui.slideLeft)
		eventManager.unregisterEvent("touch_move_right", empire.ui.slideRight)
		empire.control.onExit()
	end

	var_12_0:registerScriptTouchHandler(empire.ui.onTouch)
	var_12_0:setTouchEnabled(true)
	empire.ui.init()
	var_12_0:setVisible(false)
	empire.control.request_officerBuildingInfo()

	if user.player.hasOfficialBuildingOthers == true then
		empire.control.request_applyInfo()
	end

	require("lua/guide/control")

	guide.uiElementsTable[1014] = empire.ui.table.build_19
	guide.uiElementsTable[1016] = empire.ui.table.build_18

	return var_12_0
end
