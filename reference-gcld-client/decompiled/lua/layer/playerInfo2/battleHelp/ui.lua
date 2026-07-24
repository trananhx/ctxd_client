battleHelp = {}

tool.requireRes("playerInfo2/battleHelp")

battleHelp.ui = {}
battleHelp.ui.table = {}
battleHelp.ui.displayCount = 16
battleHelp.ui.targetListCount = 0
battleHelp.ui.beginX = 0
battleHelp.ui.beginY = 0

function battleHelp.ui.onTouch(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0 == CCTOUCHBEGAN then
		battleHelp.ui.beginX = arg_1_1
		battleHelp.ui.beginY = arg_1_2
	elseif arg_1_0 == CCTOUCHENDED and math.abs(battleHelp.ui.beginX - arg_1_1) < 20 and math.abs(battleHelp.ui.beginY - arg_1_2) < 20 then
		local var_1_0 = battleHelp.ui.table.bg:getContentSize()
		local var_1_1, var_1_2 = battleHelp.ui.table.bg:getPosition()
		local var_1_3 = arg_1_1 - var_1_1 + var_1_0.width / 2
		local var_1_4 = arg_1_2 - var_1_2 + var_1_0.height / 2

		if var_1_3 > 10 and var_1_3 < 910 and var_1_4 > 320 and var_1_4 < 530 then
			local var_1_5 = battleHelp.ui.table.battle_list:getContentOffset().x
			local var_1_6 = math.floor((var_1_3 - 10 - var_1_5) / 459)

			if var_1_6 >= 0 and var_1_6 < battleHelp.ui.displayCount then
				battleHelp.ui.change_battle_select(var_1_6 + 1)

				if var_1_6 < battleHelp.control.battle_index_max then
					battleHelp.control.request_singleBattleInfo()
				else
					battleHelp.ui.create_keyTarget_list()
				end
			end
		elseif var_1_3 > 10 and var_1_3 < 615 and var_1_4 > 10 and var_1_4 < 265 then
			if battleHelp.ui.targetListCount == 0 then
				return true
			end

			local var_1_7 = battleHelp.ui.table.keytarget_list:getContentOffset()
			local var_1_8 = math.floor((var_1_3 - 10 - var_1_7.x) / 302)
			local var_1_9 = (math.floor((battleHelp.ui.targetListCount + 1) / 2) - math.floor((var_1_4 - 10 - var_1_7.y) / 137) - 1) * 2 + var_1_8

			if var_1_9 >= 0 and var_1_9 < battleHelp.ui.targetListCount then
				battleHelp.ui.change_keyTarget_select(var_1_9 + 1)

				local var_1_10 = battleHelp.keyTargetData.guides[battleHelp.control.keyTarget_index]

				battleHelp.ui.update_name_des(var_1_10)
			end
		end
	end

	return true
end

function battleHelp.ui.change_battle_select(arg_2_0)
	local var_2_0 = CCSprite:create("res/ui/playerInfo/battleHelp/ditu_di.png")

	battleHelp.ui.table["battle_bg_" .. battleHelp.control.battle_index]:setDisplayFrame(var_2_0:displayFrame())

	battleHelp.control.battle_index = arg_2_0

	local var_2_1 = CCSprite:create("res/ui/playerInfo/battleHelp/ditu_di_select.png")

	battleHelp.ui.table["battle_bg_" .. battleHelp.control.battle_index]:setDisplayFrame(var_2_1:displayFrame())
end

function battleHelp.ui.change_keyTarget_select(arg_3_0)
	local var_3_0 = CCSprite:create("res/ui/playerInfo/battleHelp/keyTarget_bg.jpg")

	battleHelp.ui.table["keyTarget_bg_" .. battleHelp.control.keyTarget_index]:setDisplayFrame(var_3_0:displayFrame())

	battleHelp.control.keyTarget_index = arg_3_0

	local var_3_1 = CCSprite:create("res/ui/playerInfo/battleHelp/keyTarget_bg_select.jpg")

	battleHelp.ui.table["keyTarget_bg_" .. battleHelp.control.keyTarget_index]:setDisplayFrame(var_3_1:displayFrame())
end

function battleHelp.ui.create_battleHelp_single(arg_4_0, arg_4_1)
	local var_4_0 = CCSprite:create("res/ui/playerInfo/battleHelp/ditu_di.png")

	if arg_4_1 == nil then
		return var_4_0
	end

	if tonumber(arg_4_1.state) == 1 or tonumber(arg_4_1.state) == 2 then
		local var_4_1 = CCSprite:create("res/ui/playerInfo/battleHelp/ditu_" .. arg_4_0 .. ".jpg")

		var_4_1:setPosition(ccp(230, 105))
		var_4_0:addChild(var_4_1, 1)

		local var_4_2 = CCSprite:create("res/ui/playerInfo/battleHelp/name_" .. arg_4_0 .. ".png")

		var_4_2:setPosition(ccp(25 + var_4_2:getContentSize().width / 2, 165))
		var_4_0:addChild(var_4_2, 2)

		local var_4_3 = CCSprite:create("res/ui/playerInfo/battleHelp/text_bg.png")

		var_4_3:setPosition(ccp(15 + var_4_3:getContentSize().width / 2, 120))
		var_4_0:addChild(var_4_3, 3)

		local var_4_4 = CCLabelTTF:create(language.get(143041, arg_4_1.beginLv, arg_4_1.endLv), "Thonburi", 20)

		var_4_4:setPosition(ccp(70, 18))
		var_4_3:addChild(var_4_4, 1)
	else
		local var_4_5 = GraySprite:create("res/ui/playerInfo/battleHelp/ditu_" .. arg_4_0 .. ".jpg")

		var_4_5:setPosition(ccp(230, 105))
		var_4_0:addChild(var_4_5, 1)

		local var_4_6 = CCLabelTTF:create(language.get(143047), "Thonburi", 20)

		var_4_6:setPosition(ccp(230, 105))
		var_4_0:addChild(var_4_6, 2)
	end

	if tonumber(arg_4_1.state) == 2 then
		battleHelp.control.battle_index = arg_4_0
		battleHelp.control.battle_index_max = battleHelp.control.battle_index

		battleHelp.control.request_singleBattleInfo()
	end

	if arg_4_0 == battleHelp.ui.displayCount and battleHelp.control.battle_index == 0 then
		battleHelp.control.battle_index = battleHelp.ui.displayCount
		battleHelp.control.battle_index_max = battleHelp.control.battle_index

		battleHelp.control.request_singleBattleInfo()
	end

	return var_4_0
end

function battleHelp.ui.create_battleHelp_list(arg_5_0)
	if battleHelp.ui.table.battle_list ~= nil then
		battleHelp.ui.table.bg:removeChild(battleHelp.ui.table.battle_list, true)

		battleHelp.ui.table.battle_list = nil
	end

	local var_5_0 = createBaseLayer()

	for iter_5_0 = 1, battleHelp.ui.displayCount do
		local var_5_1 = battleHelp.ui.create_battleHelp_single(iter_5_0, arg_5_0.guides[iter_5_0])

		var_5_1:setPosition(ccp(459 * (iter_5_0 - 1) + 230, 105))
		var_5_0:addChild(var_5_1)

		battleHelp.ui.table["battle_bg_" .. iter_5_0] = var_5_1
	end

	local var_5_2 = CCScrollView:create(CCSizeMake(900, 210))

	var_5_2:setContainer(var_5_0)
	var_5_2:setPosition(10, 320)
	var_5_2:setContentSize(CCSizeMake(459 * battleHelp.ui.displayCount, 210))
	var_5_2:setDirection(kCCScrollViewDirectionHorizontal)
	battleHelp.ui.table.bg:addChild(var_5_2, 10)

	battleHelp.ui.table.battle_list = var_5_2

	if battleHelp.control.battle_index < battleHelp.ui.displayCount then
		var_5_2:setContentOffset(ccp(-459 * battleHelp.control.battle_index + 450, 0))
	else
		var_5_2:setContentOffset(ccp(-459 * battleHelp.ui.displayCount + 900, 0))
	end

	battleHelp.ui.change_battle_select(battleHelp.control.battle_index)
end

function battleHelp.ui.update_name_des(arg_6_0)
	if arg_6_0 == nil then
		battleHelp.ui.table.none_des:setVisible(true)
		battleHelp.ui.table.des:setVisible(false)
		battleHelp.ui.table.name:setString(language.get(143046))
	else
		battleHelp.ui.table.none_des:setVisible(false)
		battleHelp.ui.table.des:setVisible(true)
		battleHelp.ui.table.name:setString(arg_6_0.target)
		battleHelp.ui.table.des:setString(arg_6_0.detail)
	end
end

function battleHelp.ui.create_keyTarget_single(arg_7_0)
	local var_7_0 = CCSprite:create("res/ui/playerInfo/battleHelp/keyTarget_bg.jpg")
	local var_7_1 = CCSprite:create("res/ui/playerInfo/battleHelp/icon_bg.png")

	var_7_1:setPosition(ccp(69, 69))
	var_7_0:addChild(var_7_1, 1)

	local var_7_2

	if arg_7_0.pic == "renwu" then
		var_7_2 = CCSprite:create("res/ui/playerInfo/battleHelp/renwu.png")
	else
		var_7_2 = CCSprite:create("res/ui/common/fightPic/fightPic_" .. arg_7_0.pic .. ".png")
	end

	var_7_2:setPosition(ccp(58, 46))
	var_7_1:addChild(var_7_2, 1)

	local var_7_3 = CCLabelAtlas:create(tostring(arg_7_0.lv), "res/ui/common/number/up_numb.png", 16, 21, 48)

	var_7_3:setAnchorPoint(ccp(0.5, 0.5))

	local var_7_4 = CCSprite:create("res/ui/playerInfo/battleHelp/ji.png")
	local var_7_5

	if conf.language == "vie" then
		var_7_5 = createRichNode({
			var_7_4,
			var_7_3
		})
	else
		var_7_5 = createRichNode({
			var_7_3,
			var_7_4
		})
	end

	var_7_5:setPosition(ccp(25, 20))
	var_7_1:addChild(var_7_5, 2)

	local var_7_6

	if conf.language == "vie" then
		var_7_6 = CCLabelTTF:create(arg_7_0.target, "Thonburi", 18)

		var_7_6:setDimensions(CCSizeMake(160, 0))
		var_7_6:setPosition(ccp(200, 84))
		var_7_0:addChild(var_7_6, 2)
	else
		var_7_6 = CCLabelTTF:create(arg_7_0.target, "Thonburi", 22)

		var_7_6:setPosition(ccp(200, 84))
		var_7_0:addChild(var_7_6, 2)
	end

	local var_7_7

	if conf.language == "vie" then
		var_7_7 = CCLabelTTF:create(arg_7_0.brief, "Thonburi", 16)

		var_7_7:setDimensions(CCSizeMake(160, 0))
		var_7_7:setPosition(ccp(200, 42))
		var_7_0:addChild(var_7_7, 3)
	else
		var_7_7 = CCLabelTTF:create(arg_7_0.brief, "Thonburi", 18)

		var_7_7:setPosition(ccp(200, 42))
		var_7_0:addChild(var_7_7, 3)
	end

	if tonumber(arg_7_0.state) == 1 then
		local var_7_8 = CCSprite:create("res/ui/playerInfo/battleHelp/zhang.png")

		var_7_8:setPosition(ccp(230, 50))
		var_7_0:addChild(var_7_8, 4)
		var_7_6:setColor(ccc3(155, 155, 155))
		var_7_7:setColor(ccc3(155, 155, 155))
	else
		var_7_6:setColor(ccc3(240, 160, 67))
		var_7_7:setColor(ccc3(245, 248, 182))
	end

	return var_7_0
end

function battleHelp.ui.create_keyTarget_list(arg_8_0)
	if battleHelp.ui.table.keytarget_list ~= nil then
		battleHelp.ui.table.bg:removeChild(battleHelp.ui.table.keytarget_list, true)

		battleHelp.ui.table.keytarget_list = nil
	end

	if arg_8_0 == nil then
		local var_8_0 = CCSprite:create("res/ui/playerInfo/battleHelp/mz.png")

		var_8_0:setPosition(ccp(305, 140))
		battleHelp.ui.table.bg:addChild(var_8_0, 1)

		battleHelp.ui.table.keytarget_list = var_8_0
		battleHelp.ui.targetListCount = 0

		battleHelp.ui.update_name_des(nil)

		return
	end

	local var_8_1 = createBaseLayer()
	local var_8_2 = #arg_8_0.guides
	local var_8_3 = math.floor((var_8_2 + 1) / 2)

	battleHelp.ui.targetListCount = var_8_2

	for iter_8_0 = 1, var_8_2 do
		local var_8_4 = arg_8_0.guides[iter_8_0]
		local var_8_5 = battleHelp.ui.create_keyTarget_single(var_8_4)

		var_8_5:setPosition(152 + 302 * math.mod(iter_8_0 + 1, 2), 137 * (var_8_3 - math.floor((iter_8_0 + 1) / 2)) + 68.5)

		battleHelp.ui.table["keyTarget_bg_" .. iter_8_0] = var_8_5

		var_8_1:addChild(var_8_5, 1)
	end

	local var_8_6 = CCScrollView:create(CCSizeMake(605, 255))

	var_8_6:setContainer(var_8_1)
	var_8_6:setPosition(10, 10)
	var_8_6:setContentSize(CCSizeMake(605, 137 * var_8_3))
	var_8_6:setDirection(kCCScrollViewDirectionVertical)
	battleHelp.ui.table.bg:addChild(var_8_6, 11)
	var_8_6:setContentOffset(ccp(0, -137 * var_8_3 + 255))

	battleHelp.ui.table.keytarget_list = var_8_6
	battleHelp.control.keyTarget_index = 1

	battleHelp.ui.change_keyTarget_select(battleHelp.control.keyTarget_index)
	battleHelp.ui.update_name_des(arg_8_0.guides[1])
end

function battleHelp.ui.init()
	battleHelp.control.battle_index = 0

	if conf.language == "cn" then
		battleHelp.ui.table.des:setDimensions(CCSizeMake(250, 120))
	else
		battleHelp.ui.table.des:setDimensions(CCSizeMake(250, 0))
	end

	battleHelp.ui.table.des:setHorizontalAlignment(kCCTextAlignmentLeft)
	battleHelp.ui.table.des:setVerticalAlignment(kCCVerticalTextAlignmentTop)
end

function battleHelp.ui.show()
	local var_10_0 = createBaseLayer()

	battleHelp.ui.table = autoUI.initUI(var_10_0, getBattleHelpData())
	battleHelp.ui.table.layer = var_10_0

	battleHelp.ui.init()
	var_10_0:registerScriptTouchHandler(battleHelp.ui.onTouch)
	var_10_0:setTouchEnabled(true)
	battleHelp.control.request_battleInfo()

	return var_10_0
end
