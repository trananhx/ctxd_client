function createHpBar(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5, arg_1_6, arg_1_7, arg_1_8, arg_1_9)
	local var_1_0 = {
		curHp = arg_1_1,
		maxHp = arg_1_2,
		curShield = arg_1_3 or 0,
		maxShield = arg_1_4 or 1,
		carHp = arg_1_6 or 0,
		carMaxHp = arg_1_7 or 1,
		hasCar = arg_1_0.hasCar,
		carShiled = arg_1_9
	}

	if arg_1_5 > 0 and arg_1_5 < 1 then
		var_1_0.bsPro = arg_1_5
	end

	var_1_0.hpBar = nil
	var_1_0.progressTimer = nil
	var_1_0.shieldBar = nil
	var_1_0.shieldProgressTimer = nil
	var_1_0.carBar = nil
	var_1_0.carProgressTimer = nil

	function var_1_0.init()
		var_1_0.hpBar = CCSprite:createWithSpriteFrameName("armyHpBackground.png")

		var_1_0.hpBar:setPosition(ccp(0, 20))

		var_1_0.shieldBar = CCSprite:createWithSpriteFrameName("armyHpBackground.png")

		var_1_0.shieldBar:setPosition(ccp(0, 32))

		var_1_0.carBar = CCSprite:createWithSpriteFrameName("armyHpBackground.png")

		var_1_0.carBar:setPosition(ccp(0, 20))

		local var_2_0 = "armyAttHp.png"

		if arg_1_0.side == "def" then
			var_2_0 = "armyDefHp.png"
		end

		if var_1_0.bsPro and var_1_0.curHp < var_1_0.bsPro * var_1_0.maxHp then
			var_2_0 = "armyshieldHp.png"
		end

		local var_2_1 = CCSprite:createWithSpriteFrameName(var_2_0)

		var_1_0.progressTimer = CCProgressTimer:create(var_2_1)

		var_1_0.progressTimer:setType(kCCProgressTimerTypeBar)
		var_1_0.progressTimer:setMidpoint(CCPointMake(0, 0.5))
		var_1_0.progressTimer:setAnchorPoint(ccp(0, 0.5))
		var_1_0.progressTimer:setBarChangeRate(ccp(1, 0))
		var_1_0.progressTimer:setPosition(CCPointMake(0, var_1_0.hpBar:getContentSize().height * 0.5))
		var_1_0.hpBar:addChild(var_1_0.progressTimer)
		var_1_0.progressTimer:setPercentage(arg_1_1 / arg_1_2 * 100)

		local var_2_2 = CCSprite:createWithSpriteFrameName("armyshieldHp.png")

		var_1_0.shieldProgressTimer = CCProgressTimer:create(var_2_2)

		var_1_0.shieldProgressTimer:setType(kCCProgressTimerTypeBar)
		var_1_0.shieldProgressTimer:setMidpoint(CCPointMake(0, 0.5))
		var_1_0.shieldProgressTimer:setAnchorPoint(ccp(0, 0.5))
		var_1_0.shieldProgressTimer:setBarChangeRate(ccp(1, 0))
		var_1_0.shieldProgressTimer:setPosition(CCPointMake(0, var_1_0.shieldBar:getContentSize().height * 0.5))
		var_1_0.shieldBar:addChild(var_1_0.shieldProgressTimer)
		var_1_0.shieldProgressTimer:setPercentage(arg_1_3 / arg_1_4 * 100)

		local var_2_3 = CCSprite:createWithSpriteFrameName("armyshieldHp.png")

		var_1_0.carProgressTimer = CCProgressTimer:create(var_2_3)

		var_1_0.carProgressTimer:setType(kCCProgressTimerTypeBar)
		var_1_0.carProgressTimer:setMidpoint(CCPointMake(0, 0.5))
		var_1_0.carProgressTimer:setAnchorPoint(ccp(0, 0.5))
		var_1_0.carProgressTimer:setBarChangeRate(ccp(1, 0))
		var_1_0.carProgressTimer:setPosition(CCPointMake(0, var_1_0.shieldBar:getContentSize().height * 0.5))
		var_1_0.carBar:addChild(var_1_0.carProgressTimer)
		var_1_0.carProgressTimer:setPercentage(var_1_0.carHp / var_1_0.carMaxHp * 100)

		if arg_1_0.bigGzNum then
			for iter_2_0 = 1, arg_1_0.bigGzNum - 1 do
				local var_2_4 = CCSprite:create("res/ui/battle/gemEffect/zc_battle_bar_line.png")
				local var_2_5 = 100 / arg_1_0.bigGzNum

				var_2_4:setPosition(ccp(var_2_5 * iter_2_0, 6.5))
				var_1_0.carBar:addChild(var_2_4)
			end
		end

		var_1_0.hpLabel = CCStrokeLabelTTF:create(tostring(arg_1_1), "Thonburi", 14)

		var_1_0.hpLabel:setColor(ccc3(235, 135, 127))
		var_1_0.hpLabel:setPosition(ccp(var_1_0.hpBar:getContentSize().width * 0.5, var_1_0.hpBar:getContentSize().height * 0.5))
		var_1_0.hpBar:addChild(var_1_0.hpLabel)

		var_1_0.shieldLabel = CCStrokeLabelTTF:create(tostring(arg_1_4), "Thonburi", 14)

		var_1_0.shieldLabel:setColor(ccc3(235, 135, 127))
		var_1_0.shieldLabel:setPosition(ccp(var_1_0.shieldBar:getContentSize().width * 0.5, var_1_0.shieldBar:getContentSize().height * 0.5))
		var_1_0.shieldBar:addChild(var_1_0.shieldLabel)

		if arg_1_3 == 0 then
			var_1_0.shieldBar:setVisible(false)
		else
			var_1_0.shieldBar:setVisible(true)
		end

		if var_1_0.hasCar or var_1_0.carShiled then
			var_1_0.carBar:setVisible(true)
			var_1_0.hpBar:setVisible(false)
		else
			var_1_0.hpBar:setVisible(true)
			var_1_0.carBar:setVisible(false)
		end
	end

	function var_1_0.addToParent(arg_3_0, arg_3_1, arg_3_2)
		arg_3_1:addChild(arg_3_0.hpBar, arg_3_2)
		arg_3_1:addChild(arg_3_0.carBar, arg_3_2)
		arg_3_1:addChild(arg_3_0.shieldBar, arg_3_2)
	end

	function var_1_0.updateHp(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4, arg_4_5)
		if var_1_0.hasCar or var_1_0.carShiled then
			var_1_0.curShield = arg_4_2
			var_1_0.maxShield = arg_4_3

			var_1_0.shieldProgressTimer:setPercentage(var_1_0.curShield / var_1_0.maxShield * 100)
			var_1_0.shieldLabel:setString(tostring(arg_4_2))

			if arg_4_2 and arg_4_2 == 0 then
				var_1_0.shieldBar:setVisible(false)
			else
				var_1_0.shieldBar:setVisible(true)
			end

			if arg_4_4 and arg_4_4 > 0 then
				var_1_0.carProgressTimer:setPercentage(arg_4_4 / arg_4_5 * 100)
			else
				var_1_0.hasCar = false
				var_1_0.carShiled = false

				var_1_0.hpBar:setVisible(true)
				var_1_0.carBar:setVisible(false)
			end
		else
			var_1_0.hpBar:setVisible(true)
			var_1_0.carBar:setVisible(false)

			if var_1_0.bsPro and var_1_0.curHp >= var_1_0.bsPro * var_1_0.maxHp and arg_4_1 < var_1_0.bsPro * var_1_0.maxHp then
				var_1_0.progressTimer:setSprite(tool.spriteByName("armyshieldHp.png"))

				arg_1_0.huangyyState = 2
			end

			var_1_0.curHp = arg_4_1

			var_1_0.progressTimer:setPercentage(var_1_0.curHp / var_1_0.maxHp * 100)
			var_1_0.hpLabel:setString(tostring(arg_4_1))

			var_1_0.curShield = arg_4_2
			var_1_0.maxShield = arg_4_3

			var_1_0.shieldProgressTimer:setPercentage(var_1_0.curShield / var_1_0.maxShield * 100)
			var_1_0.shieldLabel:setString(tostring(arg_4_2))

			if arg_4_2 and arg_4_2 == 0 then
				var_1_0.shieldBar:setVisible(false)
			else
				var_1_0.shieldBar:setVisible(true)
			end
		end
	end

	var_1_0.init()

	return var_1_0
end
