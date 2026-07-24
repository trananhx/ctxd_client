local var_0_0 = class("BuildCastleLayer", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.cityId = arg_2_1

	arg_2_0:setTouchEnabled(true)
	arg_2_0:registerScriptTouchHandler(function(arg_3_0, arg_3_1, arg_3_2)
		return arg_2_0:onTouch(arg_3_0, arg_3_1, arg_3_2)
	end, false, true)

	arg_2_0.maxLevel = 4

	table.sort(arg_2_2, function(arg_4_0, arg_4_1)
		return arg_4_0.index * 10 + arg_4_0.category < arg_4_1.index * 10 + arg_4_1.category
	end)

	arg_2_0.fortresses = arg_2_2
	arg_2_0.selectedHouse = 0
	arg_2_0.selectedLevel = 1

	arg_2_0:setData(arg_2_2)
end

function var_0_0.setData(arg_5_0, arg_5_1)
	arg_5_0:removeAllChildrenWithCleanup(true)

	arg_5_0.castle = {}
	arg_5_0.people = {}
	arg_5_0.level = {}
	arg_5_0.jianzaoButton = nil

	for iter_5_0 = 1, arg_5_0.maxLevel do
		arg_5_0.people[iter_5_0] = {}
	end

	for iter_5_1 = 1, arg_5_0.maxLevel do
		arg_5_0.level[iter_5_1] = {}
	end

	local var_5_0 = CCSprite:create("res/ui/world/fortress/panel/jzd_bg.png")

	var_5_0:setPosition(visibleSize.width / 2, visibleSize.height / 2)
	arg_5_0:addChild(var_5_0)

	arg_5_0.bg = var_5_0

	local var_5_1 = {
		{
			normal = "yaosai/yaosai_1.png",
			light = "yaosai/yaosai_%s_l.png",
			name = "jgdy_ys_word_lv%s.png",
			grey = "yaosai/yaosai_1_g.png"
		},
		{
			normal = "jianshi/jianshi_1.png",
			light = "jianshi/jianshi_%s_l.png",
			name = "jsl_word_lv%s.png",
			grey = "jianshi/jianshi_1_g.png"
		},
		{
			normal = "junhuo/junhuo_1.png",
			light = "junhuo/junhuo_%s_l.png",
			name = "jhk_word_lv%s.png",
			grey = "junhuo/junhuo_1_g.png"
		},
		{
			normal = "sishi/sishi_1.png",
			light = "sishi/sishi_%s_l.png",
			name = "ssy_word_name_lv%s.png",
			grey = "sishi/sishi_1_g.png"
		}
	}

	for iter_5_2 = 1, arg_5_0.maxLevel do
		local var_5_2 = arg_5_1[iter_5_2]
		local var_5_3 = CCNode:create()

		var_5_3:setPosition(visibleSize.width / 2 + 230 * (iter_5_2 - 2.5), visibleSize.height / 2 + 35)
		arg_5_0:addChild(var_5_3)

		local var_5_4
		local var_5_5
		local var_5_6

		if var_5_2.canBuild then
			if arg_5_0.selectedHouse == iter_5_2 then
				var_5_6 = true
				var_5_4 = string.format(var_5_1[iter_5_2].light, arg_5_0.selectedLevel)
			else
				var_5_4 = var_5_1[iter_5_2].normal
			end
		else
			var_5_4 = var_5_1[iter_5_2].grey
		end

		arg_5_0.castle[iter_5_2] = CCSprite:create("res/ui/world/fortress/panel/" .. var_5_4)

		arg_5_0.castle[iter_5_2]:setPosition(0, 0)
		var_5_3:addChild(arg_5_0.castle[iter_5_2])
		var_5_3:setPositionY(var_5_6 and visibleSize.height / 2 + 35 or visibleSize.height / 2)

		local var_5_7 = string.format(var_5_1[iter_5_2].name, 1)

		if arg_5_0.selectedHouse == iter_5_2 then
			var_5_7 = string.format(var_5_1[iter_5_2].name, arg_5_0.selectedLevel)
		end

		local var_5_8 = CCSprite:create("res/ui/world/buildNation/" .. var_5_7)

		for iter_5_3 = 1, 3 do
			if arg_5_0.selectedHouse == iter_5_2 then
				if arg_5_0.selectedLevel == iter_5_3 then
					arg_5_0.level[iter_5_2][iter_5_3] = CCSprite:create("res/ui/world/fortress/panel/jzke_ys_lv" .. iter_5_3 .. ".png")
				else
					arg_5_0.level[iter_5_2][iter_5_3] = GraySprite:create("res/ui/world/fortress/panel/jzke_ys_lv" .. iter_5_3 .. ".png")
				end

				arg_5_0.level[iter_5_2][iter_5_3]:setPosition(70 * (iter_5_3 - 2), 120 - 25 * math.mod(iter_5_3, 2))
				var_5_3:addChild(arg_5_0.level[iter_5_2][iter_5_3])
			end
		end

		var_5_8:setPosition(0, -56)
		var_5_3:addChild(var_5_8)

		if var_5_6 then
			local var_5_9 = CCSprite:create("res/ui/kfyz/kfyz_word_bg.png")

			var_5_9:setPosition(0, -96)
			var_5_3:addChild(var_5_9)

			arg_5_0.people[iter_5_2][1] = CCLabelTTF:create("x" .. var_5_2.needNums[1].value, "Thonburi", 18)

			arg_5_0.people[iter_5_2][1]:setPosition(ccp(198, 32))

			arg_5_0.people[iter_5_2][2] = CCLabelTTF:create("x" .. var_5_2.needNums[2].value, "Thonburi", 18)

			arg_5_0.people[iter_5_2][2]:setPosition(ccp(108, 32))

			if arg_5_0.selectedHouse == iter_5_2 then
				arg_5_0.people[iter_5_2][1]:setString("x" .. arg_5_1[iter_5_2 + arg_5_0.maxLevel * (arg_5_0.selectedLevel - 1)].needNums[1].value)
				arg_5_0.people[iter_5_2][2]:setString("x" .. arg_5_1[iter_5_2 + arg_5_0.maxLevel * (arg_5_0.selectedLevel - 1)].needNums[1].value)
			end

			local var_5_10 = CCSprite:create("res/ui/nation/buildNation/mainTask/jgdy_gcqz_res_bg.png")
			local var_5_11 = CCSprite:create("res/ui/technology/buildTech/jzke_icon_fz.png")

			var_5_11:setPosition(var_5_10:getContentSize().width / 2, var_5_10:getContentSize().height / 2)
			var_5_10:addChild(var_5_11)
			var_5_10:setScale(0.7)
			var_5_10:setPosition(ccp(168, 32))

			local var_5_12 = CCSprite:create("res/ui/nation/buildNation/mainTask/jgdy_gcqz_res_bg.png")
			local var_5_13 = CCSprite:create("res/ui/technology/buildTech/jzke_icon_cz.png")

			var_5_13:setPosition(var_5_12:getContentSize().width / 2, var_5_12:getContentSize().height / 2)
			var_5_12:addChild(var_5_13)
			var_5_12:setScale(0.7)
			var_5_12:setPosition(ccp(78, 32))
			var_5_9:addChild(var_5_10)
			var_5_9:addChild(var_5_12)
			var_5_9:addChild(arg_5_0.people[iter_5_2][1])
			var_5_9:addChild(arg_5_0.people[iter_5_2][2])
		end

		if arg_5_0.selectedHouse ~= 0 then
			arg_5_0.jianzaoButton = CCSprite:create("res/ui/common/button/sdyjs_btn_04.png")

			arg_5_0.jianzaoButton:setPosition(ccp(var_5_0:getContentSize().width / 2, 40))

			local var_5_14 = CCLabelTTF:create(language.get("222026_buildingTech"), "Thonburi", 24)

			var_5_14:setPosition(ccp(arg_5_0.jianzaoButton:getContentSize().width / 2, arg_5_0.jianzaoButton:getContentSize().height / 2 + 4))
			arg_5_0.jianzaoButton:addChild(var_5_14)
			var_5_0:addChild(arg_5_0.jianzaoButton)
		end
	end
end

function var_0_0.onTouch(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	if arg_6_1 == CCTOUCHBEGAN then
		for iter_6_0 = 1, arg_6_0.maxLevel do
			for iter_6_1 = 1, 3 do
				if arg_6_0.level[iter_6_0][iter_6_1] and arg_6_0.level[iter_6_0][iter_6_1]:isVisible() and tool.checkIfTouch(arg_6_0.level[iter_6_0][iter_6_1], arg_6_2, arg_6_3) and arg_6_0.fortresses[iter_6_0].canBuild then
					arg_6_0.selectedHouse = iter_6_0
					arg_6_0.selectedLevel = iter_6_1

					arg_6_0:setData(arg_6_0.fortresses)

					return true
				end
			end

			if tool.checkIfTouch(arg_6_0.castle[iter_6_0], arg_6_2, arg_6_3) and arg_6_0.fortresses[iter_6_0].canBuild then
				arg_6_0.selectedHouse = iter_6_0

				arg_6_0:setData(arg_6_0.fortresses)
			end
		end

		if arg_6_0.jianzaoButton and tool.checkIfTouch(arg_6_0.jianzaoButton, arg_6_2, arg_6_3) then
			local var_6_0 = arg_6_0.fortresses[arg_6_0.selectedHouse + arg_6_0.maxLevel * (arg_6_0.selectedLevel - 1)]

			messageBox.confirm(language.get("221020_buildNation", var_6_0.name) .. "(" .. var_6_0.intro .. ")", function()
				local function var_7_0(arg_8_0)
					return
				end

				cmgr.sendRequest(var_7_0, actions.buildCastle, arg_6_0.selectedHouse, arg_6_0.selectedLevel, arg_6_0.cityId)
				smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
			end)
		end

		if tool.checkIfTouch(arg_6_0.bg, arg_6_2, arg_6_3) == false then
			smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
		end

		return true
	elseif arg_6_1 == CCTOUCHENDED then
		return true
	end

	return true
end

return var_0_0
