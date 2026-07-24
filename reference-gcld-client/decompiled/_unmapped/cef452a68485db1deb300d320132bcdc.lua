gem = {}

tool.requireRes("weaponTab/gem")

gem.ui = {}
gem.ui.table = {}
gem.ui.selectIndex = 0
gem.ui.x = 0
gem.ui.y = 0
gem.ui.isInEffect = false

function gem.ui.onTouch(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0 == CCTOUCHBEGAN then
		gem.ui.x = arg_1_1
		gem.ui.y = arg_1_2

		return true
	elseif arg_1_0 == CCTOUCHENDED and math.abs(gem.ui.x - arg_1_1) < 20 and math.abs(gem.ui.y - arg_1_2) < 20 and gem.ui.table.scrollView ~= nil then
		local var_1_0 = gem.ui.table.bg:getContentSize()
		local var_1_1, var_1_2 = gem.ui.table.bg:getPosition()

		if arg_1_1 > var_1_1 - var_1_0.width / 2 + 40 and arg_1_1 < var_1_1 - var_1_0.width / 2 + 40 + 80 and arg_1_2 > var_1_2 - var_1_0.height / 2 + 10 and arg_1_2 < var_1_2 - var_1_0.height / 2 + 400 then
			local var_1_3 = arg_1_2 - (var_1_2 - var_1_0.height / 2 + 10)
			local var_1_4 = gem.ui.table.scrollView:getContentOffset().y
			local var_1_5 = math.floor((var_1_3 - var_1_4) / 90)

			if var_1_5 >= 0 and var_1_5 < gem.count and gem.ui.selectIndex ~= gem.count - var_1_5 then
				gem.ui.selectIndex = gem.count - var_1_5

				gem.ui.table.select_icon:setPosition(ccp(40, 90 * (gem.count - gem.ui.selectIndex) + 40))
				gem.ui.update_text()
			end
		end
	end
end

function gem.ui.effect_end()
	gem.ui.table.effect:setVisible(false)

	gem.ui.isInEffect = false

	gem.ui.update_text()
end

function gem.ui.action_effect()
	local var_3_0 = rmgr.getAnimation("fireEffect")
	local var_3_1 = CCAnimation:createWithSpriteFrames(var_3_0, 0.1)
	local var_3_2 = CCAnimate:create(var_3_1)
	local var_3_3 = CCCallFuncN:create(gem.ui.effect_end)
	local var_3_4 = CCArray:create()

	var_3_4:addObject(var_3_2)
	var_3_4:addObject(var_3_3)

	local var_3_5 = CCSequence:create(var_3_4)
	local var_3_6 = CCRepeat:create(tolua.cast(var_3_5, "CCActionInterval"), 2)

	gem.ui.table.effect:stopAllActions()
	gem.ui.table.effect:runAction(var_3_6)
	gem.ui.table.effect:setVisible(true)

	gem.ui.isInEffect = true
end

function gem.ui.update_text()
	if gem.ui.isInEffect == true then
		return
	end

	local var_4_0 = gem.data[gem.ui.selectIndex]

	gem.ui.table["value_" .. 1]:setString(language.get(122001, var_4_0.att))
	gem.ui.table["value_" .. 2]:setString(language.get(122002, var_4_0.def))
	gem.ui.table["value_" .. 3]:setString(language.get(122003, var_4_0.blood))
	gem.ui.table["value_" .. 4]:setString(language.get(122004, var_4_0.att))
	gem.ui.table["value_" .. 5]:setString(language.get(122005, var_4_0.def))
	gem.ui.table["value_" .. 6]:setString(language.get(122006, var_4_0.blood))

	for iter_4_0 = 1, 6 do
		gem.ui.table["value_" .. iter_4_0]:setVisible(true)
	end

	local var_4_1 = math.mod(var_4_0.gemLv, 4)

	if var_4_1 == 0 then
		var_4_1 = 4
	end

	for iter_4_1 = 1, 4 do
		if iter_4_1 <= var_4_1 then
			gem.ui.table["star_" .. iter_4_1]:setVisible(true)
		else
			gem.ui.table["star_" .. iter_4_1]:setVisible(false)
		end
	end

	local var_4_2 = CCSprite:create("res/ui/weapon/" .. var_4_0.gemPic .. ".jpg")

	gem.ui.table.icon:setDisplayFrame(var_4_2:displayFrame())
	gem.ui.table.icon:setVisible(true)

	if tonumber(var_4_0.num) > 1 then
		gem.ui.table.num:setString(tostring(var_4_0.num))
		gem.ui.table.num:setVisible(true)
	else
		gem.ui.table.num:setVisible(false)
	end

	local var_4_3 = {
		language.get(122007),
		language.get(122008),
		language.get(122009),
		language.get(122010),
		language.get(122011),
		language.get(122012),
		language.get(122013),
		language.get(122014),
		language.get(122015),
		language.get(122016)
	}
	local var_4_4 = ""
	local var_4_5 = math.mod(tonumber(var_4_0.gemLv), 10)
	local var_4_6 = (tonumber(var_4_0.gemLv) - var_4_5) / 10

	if var_4_6 > 0 then
		if var_4_6 == 1 then
			var_4_4 = language.get(122016)
		else
			var_4_4 = var_4_4 .. var_4_3[var_4_6] .. language.get(122016)
		end
	end

	if var_4_5 > 0 then
		var_4_4 = var_4_4 .. var_4_3[var_4_5]
	end

	local var_4_7 = language.get(122017, var_4_4)

	gem.ui.table.title:setString(var_4_7)
	gem.ui.table.title:setVisible(true)
end

function gem.ui.createGemList()
	if gem.ui.table.scrollView ~= nil then
		gem.ui.table.bg:removeChild(gem.ui.table.scrollView, true)
	end

	local var_5_0 = createBaseLayer()

	for iter_5_0 = 1, gem.count do
		local var_5_1 = gem.data[iter_5_0]
		local var_5_2 = CCSprite:create("res/ui/weapon/" .. var_5_1.gemPic .. ".jpg")

		var_5_2:setPosition(ccp(40, 90 * (gem.count - iter_5_0) + 40))
		var_5_0:addChild(var_5_2)

		if var_5_1.num > 1 then
			local var_5_3 = CCLabelTTF:create(var_5_1.num, "", "20")

			var_5_3:setHorizontalAlignment(kCCTextAlignmentRight)
			var_5_3:setDimensions(CCSizeMake(60, 30))
			var_5_3:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
			var_5_3:setPosition(ccp(40, 12))
			var_5_2:addChild(var_5_3)
		end

		local var_5_4 = math.mod(var_5_1.gemLv, 4)

		if var_5_4 == 0 then
			var_5_4 = 4
		end

		for iter_5_1 = 1, var_5_4 do
			local var_5_5 = CCSprite:create("res/ui/weapon/xing.png")

			var_5_5:setPosition(15 * iter_5_1, 62)
			var_5_5:setScale(0.5)
			var_5_2:addChild(var_5_5)
		end
	end

	local var_5_6 = CCSprite:create("res/ui/weapon/gem_now_view_lig.png")

	var_5_6:setPosition(ccp(40, 90 * (gem.count - gem.ui.selectIndex) + 40))

	gem.ui.table.select_icon = var_5_6

	var_5_0:addChild(var_5_6)

	local var_5_7 = CCScrollView:create(CCSizeMake(80, 400))

	var_5_7:setContainer(var_5_0)
	var_5_7:setPosition(40, 10)
	var_5_7:setContentSize(CCSizeMake(145, 90 * gem.count))
	var_5_7:setDirection(kCCScrollViewDirectionVertical)
	var_5_7:setContentOffset(ccp(0, -90 * gem.count + 400))

	gem.ui.table.scrollView = var_5_7

	gem.ui.table.bg:addChild(var_5_7, 1000)
	gem.ui.table.layer:setVisible(true)
	gem.ui.update_text()
end

function gem.ui.init()
	for iter_6_0 = 1, 6 do
		gem.ui.table["value_" .. iter_6_0]:setDimensions(CCSizeMake(150, 40))
		gem.ui.table["value_" .. iter_6_0]:setHorizontalAlignment(kCCTextAlignmentLeft)
		gem.ui.table["value_" .. iter_6_0]:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		gem.ui.table["value_" .. iter_6_0]:setVisible(false)
	end

	for iter_6_1 = 1, 4 do
		gem.ui.table["star_" .. iter_6_1]:setVisible(false)
	end

	gem.ui.table.btn_hecheng:registerScriptTapHandler(gem.control.clicked_hecheng)
	gem.ui.table.btn_chaijie:registerScriptTapHandler(gem.control.clicked_chaijie)
	gem.ui.table.num:setVisible(false)
	gem.ui.table.icon:setVisible(false)
	gem.ui.table.effect:setVisible(false)
	gem.ui.table.title:setVisible(false)
	gem.ui.table.layer:setVisible(true)

	gem.ui.selectIndex = 1
end

function gem.ui.show()
	local var_7_0 = createBaseLayer()

	gem.ui.table = autoUI.initUI(var_7_0, getGemData())
	gem.ui.table.layer = var_7_0

	var_7_0:registerScriptTouchHandler(gem.ui.onTouch)
	var_7_0:setTouchEnabled(true)
	gem.ui.init()
	gem.control.request_gemInfo()

	return var_7_0
end
