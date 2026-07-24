jubenLevelSelect = {}

tool.requireRes("juben/jubenLevelSelect")
require("lua/component/timerLabel")

jubenLevelSelect.ui = {}

local var_0_0 = require("lua/common/json")

jubenLevelSelect.ui.currentSelectIndex = 1
jubenLevelSelect.ui.cities = {}

function jubenLevelSelect.ui.onTouch(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0 == CCTOUCHBEGAN then
		jubenLevelSelect.ui.touch = {}
		jubenLevelSelect.ui.touch.x = arg_1_1
		jubenLevelSelect.ui.touch.y = arg_1_2

		local var_1_0 = arg_1_1 + 480 - visibleSize.width / 2 + 480 - 480
		local var_1_1 = arg_1_2 + 320 - visibleSize.height / 2 + 258 - 306

		for iter_1_0, iter_1_1 in ipairs(jubenLevelSelect.ui.cities) do
			local var_1_2 = jubenLevelSelect.ui.table["city_" .. iter_1_1]:getContentSize()
			local var_1_3, var_1_4 = jubenLevelSelect.ui.table["city_" .. iter_1_1]:getPosition()

			if math.abs(var_1_0 - var_1_3) < var_1_2.width / 2 * 0.5 and math.abs(var_1_1 - var_1_4) < var_1_2.height / 2 * 0.5 then
				jubenLevelSelect.ui.create_juben_select_dialogure(iter_1_1)
			end
		end
	elseif arg_1_0 == CCTOUCHENDED then
		local var_1_5 = arg_1_1 - jubenLevelSelect.ui.touch.x
		local var_1_6 = arg_1_2 - jubenLevelSelect.ui.touch.y

		if math.abs(var_1_5) < 20 and math.abs(var_1_6) < 20 then
			local var_1_7 = arg_1_1 + 480 - visibleSize.width / 2
			local var_1_8 = arg_1_2 + 320 - visibleSize.height / 2
			local var_1_9 = jubenLevelSelect.data.degrees

			if jubenLevelSelect.data.openPower == nil then
				for iter_1_2, iter_1_3 in ipairs(var_1_9) do
					local var_1_10 = var_1_7 - 860
					local var_1_11 = var_1_8 - (600 - 100 * iter_1_2)

					if math.abs(var_1_10) < 100 and math.abs(var_1_11) < 50 and iter_1_3.open == 1 then
						jubenLevelSelect.ui.table.btn_select:setPosition(ccp(860, 600 - 100 * iter_1_2))
						jubenLevelSelect.ui.table.btn_select:setVisible(true)

						jubenLevelSelect.ui.currentSelectIndex = iter_1_2

						jubenLevelSelect.ui.update_juben_select_mark()
						jubenLevelSelect.ui.update_target_information()
					end
				end
			end
		end

		local var_1_12 = jubenLevelSelect.ui.table.dialogureBg

		if var_1_12 ~= nil then
			var_1_12:setVisible(false)
		end
	end

	return true
end

function jubenLevelSelect.ui.update_target_information()
	local var_2_0 = {}

	if conf.language == "vie" then
		var_2_0.jbObjX = 30
		var_2_0.totalWidth = 100
	else
		var_2_0.jbObjX = 0
		var_2_0.totalWidth = 0
	end

	local var_2_1 = jubenLevelSelect.data.sId
	local var_2_2 = jubenLevelSelect.data.degrees[jubenLevelSelect.ui.currentSelectIndex]
	local var_2_3 = CCSprite:create("res/ui/juben/jubenLevelSelect/text/jb_obj_" .. var_2_1 .. ".png")
	local var_2_4 = var_2_3:getContentSize()

	jubenLevelSelect.ui.table.target:setDisplayFrame(var_2_3:displayFrame())
	jubenLevelSelect.ui.table.target:setPosition(ccp(60 + var_2_4.width / 2 + var_2_0.jbObjX, 25))

	if jubenLevelSelect.ui.table.reward1 ~= nil then
		jubenLevelSelect.ui.table.targetBg:removeChild(jubenLevelSelect.ui.table.reward1, true)
	end

	if jubenLevelSelect.ui.table.reward2 ~= nil then
		jubenLevelSelect.ui.table.targetBg:removeChild(jubenLevelSelect.ui.table.reward2, true)
	end

	if var_2_2.curStar == var_2_2.maxStar then
		jubenLevelSelect.ui.table.star:setVisible(false)
	else
		jubenLevelSelect.ui.table.star:setString(language.get(330022, var_2_2.nextStar))
		jubenLevelSelect.ui.table.star:setVisible(true)

		local var_2_5 = 300 + var_2_0.totalWidth

		for iter_2_0, iter_2_1 in ipairs(var_2_2.rewards) do
			local var_2_6 = CCSprite:create("res/ui/juben/jubenLevelSelect/text/jb_rewa_" .. iter_2_1.type .. ".png")
			local var_2_7 = CCSprite:create("res/ui/juben/jubenLevelSelect/jb_rewa_plus.png")
			local var_2_8 = var_2_6:getContentSize()
			local var_2_9 = var_2_7:getContentSize()

			if iter_2_1.val > 10000 then
				local var_2_10 = math.floor(iter_2_1.val / 10000)
				local var_2_11 = CCLabelAtlas:create(var_2_10, "res/ui/juben/jubenLevelSelect/jb_rewa_numb.png", 17, 29, 48)
				local var_2_12 = CCSprite:create("res/ui/juben/jubenLevelSelect/text/jb_rewa_wan.png")

				var_2_11:setAnchorPoint(ccp(0.5, 0.5))

				local var_2_13 = var_2_6:getContentSize()
				local var_2_14 = var_2_7:getContentSize()
				local var_2_15 = var_2_8.width + var_2_9.width + var_2_13.width + var_2_14.width

				var_2_5 = var_2_5 + var_2_15

				local var_2_16 = createRichNode({
					var_2_6,
					var_2_7,
					var_2_11,
					var_2_12
				})
				local var_2_17, var_2_18 = var_2_11:getPosition()

				var_2_16:setPosition(ccp(var_2_5 - var_2_15 / 2, 25))

				jubenLevelSelect.ui.table["reward" .. iter_2_0] = var_2_16

				jubenLevelSelect.ui.table.targetBg:addChild(var_2_16)
			else
				local var_2_19 = CCLabelAtlas:create(iter_2_1.val, "res/ui/juben/jubenLevelSelect/jb_rewa_numb.png", 17, 29, 48)
				local var_2_20 = var_2_6:getContentSize()
				local var_2_21 = var_2_8.width + var_2_9.width + var_2_20.width

				var_2_5 = var_2_5 + var_2_21

				var_2_19:setAnchorPoint(ccp(0.5, 0.5))

				local var_2_22 = createRichNode({
					var_2_6,
					var_2_7,
					var_2_19
				})
				local var_2_23, var_2_24 = var_2_19:getPosition()

				var_2_22:setPosition(ccp(var_2_5 - var_2_21 / 2, 25))

				jubenLevelSelect.ui.table["reward" .. iter_2_0] = var_2_22

				jubenLevelSelect.ui.table.targetBg:addChild(var_2_22)
			end

			var_2_5 = var_2_5 - 20
		end
	end
end

function jubenLevelSelect.ui.update_juben_select_mark()
	local var_3_0 = jubenLevelSelect.data.degrees[jubenLevelSelect.ui.currentSelectIndex]

	for iter_3_0, iter_3_1 in ipairs(jubenLevelSelect.ui.cities) do
		local var_3_1 = jubenLevelSelect.ui.table["event_city_" .. iter_3_1]

		if var_3_1 ~= nil then
			jubenLevelSelect.ui.table.map:removeChild(var_3_1, true)

			jubenLevelSelect.ui.table["event_city_" .. iter_3_1] = nil
		end
	end

	for iter_3_2, iter_3_3 in ipairs(var_3_0.events) do
		local var_3_2 = iter_3_3.cId
		local var_3_3 = iter_3_3.cCapital

		if jubenLevelSelect.ui.table["event_city_" .. var_3_2] == nil then
			local var_3_4 = "res/ui/juben/jubenLevelSelect/"

			if var_3_3 == 1 then
				var_3_4 = var_3_4 .. "jb_att_camp"
			else
				var_3_4 = var_3_4 .. "jb_att_excl"
			end

			local var_3_5 = {}

			var_3_5[1] = ".png"
			var_3_5[2] = "_lig.png"

			local var_3_6 = CCArray:create()

			for iter_3_4 = 1, 2 do
				local var_3_7 = CCSprite:create(var_3_4 .. var_3_5[iter_3_4])

				var_3_6:addObject(var_3_7:displayFrame())
			end

			local var_3_8 = CCAnimation:createWithSpriteFrames(var_3_6, 1)
			local var_3_9 = CCAnimate:create(var_3_8)
			local var_3_10 = CCArray:create()

			var_3_10:addObject(var_3_9)

			local var_3_11 = CCSequence:create(var_3_10)
			local var_3_12 = CCRepeatForever:create(tolua.cast(var_3_11, "CCActionInterval"))
			local var_3_13 = CCSprite:create()
			local var_3_14 = jubenLevelSelect.ui.table["city_" .. var_3_2]:getContentSize()
			local var_3_15, var_3_16 = jubenLevelSelect.ui.table["city_" .. var_3_2]:getPosition()

			if var_3_3 == 1 then
				var_3_13:setPosition(ccp(var_3_15 - var_3_14.width / 2 * 0.5, var_3_16 + 25))
			else
				var_3_13:setPosition(ccp(var_3_15, var_3_16 + var_3_14.height / 2 * 0.5))
			end

			jubenLevelSelect.ui.table.map:addChild(var_3_13)

			jubenLevelSelect.ui.table["event_city_" .. var_3_2] = var_3_13

			var_3_13:runAction(var_3_12)
		end
	end

	jubenLevelSelect.ui.table.liangcao:setString(tostring(var_3_0.food))
end

function jubenLevelSelect.ui.create_juben_select_dialogure(arg_4_0)
	local var_4_0 = jubenLevelSelect.ui.table.dialogureBg

	if var_4_0 == nil then
		var_4_0 = CCSprite:create("res/ui/juben/jubenLevelSelect/jb_tips_view_bg.png")

		jubenLevelSelect.ui.table.layer:addChild(var_4_0, 15)

		local var_4_1 = CCSprite:create("res/ui/juben/jubenLevelSelect/head_di.png")

		var_4_1:setPosition(ccp(75, 52))
		var_4_0:addChild(var_4_1)

		local var_4_2 = CCSprite:create()

		var_4_2:setPosition(ccp(40, 40))
		var_4_1:addChild(var_4_2)

		jubenLevelSelect.ui.table.head = var_4_2

		local var_4_3 = CCLabelTTF:create("", "", 20)

		var_4_3:setPosition(ccp(230, 52))
		var_4_3:setColor(ccc3(217, 204, 143))
		var_4_3:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_4_3:setDimensions(CCSizeMake(220, 90))
		var_4_0:addChild(var_4_3)

		jubenLevelSelect.ui.table.des = var_4_3
		jubenLevelSelect.ui.table.dialogureBg = var_4_0

		var_4_0:setVisible(false)
	end

	local var_4_4 = jubenLevelSelect.data.degrees[jubenLevelSelect.ui.currentSelectIndex]

	if var_4_4 ~= nil then
		for iter_4_0, iter_4_1 in ipairs(var_4_4.events) do
			if iter_4_1.cId == arg_4_0 then
				local var_4_5 = CCSprite:create("res/ui/common/generalPic/generalPic_" .. iter_4_1.cPic .. ".jpg")

				jubenLevelSelect.ui.table.head:setDisplayFrame(var_4_5:displayFrame())
				jubenLevelSelect.ui.table.des:setString(iter_4_1.cIntro)

				local var_4_6, var_4_7 = jubenLevelSelect.ui.table["city_" .. arg_4_0]:getPosition()
				local var_4_8 = var_4_0:getContentSize()
				local var_4_9 = jubenLevelSelect.ui.table.map:getContentSize()

				if var_4_6 < var_4_8.width / 2 then
					var_4_6 = var_4_8.width / 2
				end

				if var_4_6 > var_4_9.width - var_4_8.width / 2 then
					var_4_6 = var_4_9.width - var_4_8.width / 2
				end

				if var_4_7 < var_4_8.height / 2 then
					var_4_7 = var_4_8.height / 2
				end

				if var_4_7 > var_4_9.height - var_4_8.height / 2 then
					var_4_7 = var_4_9.height - var_4_8.height / 2
				end

				var_4_0:setPosition(ccp(var_4_6, var_4_7))
				var_4_0:setVisible(true)

				break
			end
		end
	end
end

function jubenLevelSelect.ui.create_juben_select_map(arg_5_0)
	local var_5_0 = require("lua/layer/juben/config/" .. arg_5_0.sId .. "/city")

	if var_5_0 ~= nil then
		local var_5_1 = CCSprite:create("res/ui/juben/jubenLevelSelect/map/jb_map_sid_" .. arg_5_0.sId .. ".jpg")

		jubenLevelSelect.ui.table.map:setDisplayFrame(var_5_1:displayFrame())

		local var_5_2 = "res/ui/juben/jubenLevelSelect/btn_jb_a.png"

		if arg_5_0.sId >= 12 then
			var_5_2 = "res/ui/juben/jubenLevelSelect/btn_jb_a1.png"
		end

		jubenLevelSelect.ui.table.btn_start:setNormalImage(CCSprite:create(var_5_2))
		jubenLevelSelect.ui.table.btn_start:setSelectedImage(CCSprite:create(var_5_2))

		local var_5_3 = {
			model503 = "worldBuildingGuanqia3.png",
			model101 = "worldBuildingPingyuan.png",
			model401 = "worldBuildingShuidi1.png",
			model601 = "worldBuildingZhucheng.png",
			model501 = "worldBuildingGuanqia1.png",
			model502 = "worldBuildingGuanqia2.png",
			slope1r = "worldBuildingXiepo3.png",
			model301 = "worldBuildingShandi.png",
			model604 = "worldBuildingChengchi1.png",
			model605 = "worldBuildingChengchi2.png",
			model403 = "worldBuildingShuidi2.png"
		}
		local var_5_4 = {
			model503 = 37,
			model101 = 27,
			model401 = 38,
			model601 = 1,
			model501 = 5,
			model502 = 18,
			model301 = 35,
			model604 = 4,
			model605 = 1,
			model403 = 32
		}
		local var_5_5 = {
			model503 = 70,
			model101 = 45,
			model401 = 31,
			model601 = 50,
			model501 = 64,
			model502 = 10,
			model301 = 45,
			model604 = 35,
			model605 = 40,
			model403 = 40
		}

		rmgr.loadResource("res/ui/world/worldBuilding.plist")
		rmgr.loadResource("res/ui/world/cityWindow.plist")
		rmgr.loadResource("res/ui/world/convene.plist")
		rmgr.loadResource("res/ui/world/generalMove.plist")

		jubenLevelSelect.ui.cities = {}

		for iter_5_0, iter_5_1 in pairs(var_5_0.cities) do
			local var_5_6 = iter_5_1.id
			local var_5_7 = var_5_3[iter_5_1.model] or var_5_3.model604
			local var_5_8 = CCSprite:createWithSpriteFrameName(var_5_7)

			var_5_8:setScale(0.5)

			local var_5_9 = jubenLevelSelect.constant.juben["" .. arg_5_0.sId].city["" .. iter_5_1.id].x
			local var_5_10 = jubenLevelSelect.constant.juben["" .. arg_5_0.sId].city["" .. iter_5_1.id].y
			local var_5_11 = jubenLevelSelect.constant.juben["" .. arg_5_0.sId].city["" .. iter_5_1.id].flag

			var_5_8:setPosition(ccp(var_5_9, var_5_10))
			jubenLevelSelect.ui.table.map:addChild(var_5_8)

			jubenLevelSelect.ui.table["city_" .. var_5_6] = var_5_8

			if var_5_11 == 0 then
				-- block empty
			else
				local var_5_12 = "res/ui/juben/jubenLevelSelect/flag_mz.png"

				if var_5_11 == 1 then
					var_5_12 = "res/ui/juben/jubenLevelSelect/flag_shu.png"
				end

				local var_5_13 = var_5_4[iter_5_1.model] or var_5_4.model604
				local var_5_14 = var_5_5[iter_5_1.model] or var_5_5.model604
				local var_5_15 = CCSprite:create(var_5_12)
				local var_5_16 = var_5_8:getContentSize()

				var_5_15:setPosition(ccp(var_5_9 + (-var_5_16.width / 2 + var_5_13) * 0.5 + 5, var_5_10 + (-var_5_16.height / 2 + var_5_14) * 0.5 + 26))
				jubenLevelSelect.ui.table.map:addChild(var_5_15)

				jubenLevelSelect.ui.table["city_flag_" .. iter_5_1.id] = var_5_15
			end

			table.insert(jubenLevelSelect.ui.cities, iter_5_1.id)
		end
	end
end

function jubenLevelSelect.ui.create_juben_select_item(arg_6_0)
	local var_6_0 = arg_6_0.grade
	local var_6_1 = arg_6_0.open
	local var_6_2 = {
		language.get(330003),
		language.get(330004),
		language.get(330005),
		language.get(330006),
		language.get(330007)
	}
	local var_6_3
	local var_6_4 = "res/ui/juben/jubenLevelSelect/jb_navi_a.png"

	if jubenLevelSelect.data.sId >= 12 then
		var_6_4 = "res/ui/juben/jubenLevelSelect/jb_navi_a1.png"
	end

	if var_6_1 == 1 then
		var_6_3 = CCSprite:create(var_6_4)

		for iter_6_0 = 1, arg_6_0.maxStar do
			local var_6_5

			if iter_6_0 <= arg_6_0.curStar then
				var_6_5 = CCSprite:create("res/ui/juben/jubenLevelSelect/jb_mode_star.png")
			else
				var_6_5 = CCSprite:create("res/ui/juben/jubenLevelSelect/jb_mode_star_gray.png")
			end

			var_6_5:setPosition(ccp(46 + 28 * (iter_6_0 - 1), 37))
			var_6_3:addChild(var_6_5)
		end
	elseif var_6_1 == 0 then
		var_6_3 = CCSprite:create("res/ui/juben/jubenLevelSelect/jb_navi_gray.png")

		local var_6_6 = CCLabelTTF:create(language.get(330008, var_6_2[var_6_0 - 1]), "", 18)

		var_6_6:setPosition(ccp(100, 37))
		var_6_6:setColor(ccc3(217, 84, 58))
		var_6_3:addChild(var_6_6)
	else
		var_6_3 = CCSprite:create("res/ui/juben/jubenLevelSelect/jb_navi_no.png")

		local var_6_7 = CCLabelTTF:create(var_6_2[var_6_0] .. ":", "", 18)

		var_6_7:setPosition(ccp(45, 60))
		var_6_7:setColor(ccc3(174, 167, 158))
		var_6_3:addChild(var_6_7)

		for iter_6_1, iter_6_2 in pairs(arg_6_0.totalRewards) do
			local var_6_8 = jubenLevelSelect.constant.text["" .. iter_6_2.type]

			if var_6_8 ~= nil then
				local var_6_9 = iter_6_2.val

				if tonumber(iter_6_2.val) > 10000 then
					var_6_9 = math.floor(var_6_9 / 10000) .. language.get(330020)
				end

				local var_6_10 = CCLabelTTF:create(var_6_8 .. "+" .. var_6_9, "", 18)

				var_6_10:setDimensions(CCSizeMake(150, 25))
				var_6_10:setHorizontalAlignment(kCCTextAlignmentRight)
				var_6_10:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
				var_6_10:setPosition(ccp(105, 85 - 25 * iter_6_1))
				var_6_10:setColor(ccc3(174, 167, 158))
				var_6_3:addChild(var_6_10)
			else
				print("error, can't find type -> ", iter_6_2.type)
			end
		end
	end

	if var_6_1 ~= nil then
		local var_6_11 = CCSprite:create("res/ui/juben/jubenLevelSelect/text/jb_mode_" .. var_6_0 .. ".png")

		var_6_11:setPosition(ccp(100, 60))
		var_6_3:addChild(var_6_11)
	end

	return var_6_3
end

function jubenLevelSelect.ui.init()
	if jubenLevelSelect.data.openPower == nil then
		local var_7_0 = jubenLevelSelect.data.degrees

		for iter_7_0, iter_7_1 in ipairs(var_7_0) do
			local var_7_1 = jubenLevelSelect.ui.create_juben_select_item(iter_7_1)

			jubenLevelSelect.ui.table.button_i = var_7_1

			var_7_1:setPosition(ccp(860, 600 - 100 * iter_7_0))
			jubenLevelSelect.ui.table.layer:addChild(var_7_1, 5)
		end

		jubenLevelSelect.ui.table.btn_select:setVisible(true)
	else
		jubenLevelSelect.ui.table.btn_select:setVisible(false)
	end

	jubenLevelSelect.ui.create_juben_select_map(jubenLevelSelect.data)

	jubenLevelSelect.ui.currentSelectIndex = 1

	jubenLevelSelect.ui.update_juben_select_mark()
	jubenLevelSelect.ui.update_target_information()
	jubenLevelSelect.ui.table.btn_start:registerScriptTapHandler(jubenLevelSelect.control.on_click_start)
	jubenLevelSelect.ui.table.btn_back:registerScriptTapHandler(jubenLevelSelect.control.on_click_back)
	jubenLevelSelect.ui.table.layer:setVisible(true)
end

function jubenLevelSelect.ui.show()
	local var_8_0 = createBaseLayer()

	jubenLevelSelect.ui.table = autoUI.initUI(var_8_0, getJubenLevelSelectData())
	jubenLevelSelect.ui.table.layer = var_8_0

	var_8_0:registerScriptTouchHandler(jubenLevelSelect.ui.onTouch, false, true)
	var_8_0:setTouchEnabled(true)
	var_8_0:setPosition(ccp(visibleSize.width / 2 - 480, visibleSize.height / 2 - 320))

	local var_8_1 = CCLayerColor:create(ccc4(0, 0, 0, 200))

	var_8_1:setContentSize(CCSizeMake(visibleSize.width, visibleSize.height))
	var_8_1:setPosition(ccp(0, 0))
	var_8_1:addChild(var_8_0, 1)
	smgr.getLayer("topLayer"):addChild(var_8_1, 2)
	jubenLevelSelect.ui.init()
end
