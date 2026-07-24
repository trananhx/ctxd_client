function createFightHelper(arg_1_0)
	if arg_1_0.layerTabel.uiLayer then
		tool.safeRemoveChildByTag(arg_1_0.layerTabel.uiLayer, uiTag.fightHelper)

		if arg_1_0.autoSt ~= -1 then
			local var_1_0 = CCNode:create()

			var_1_0:setPosition(ccp(visibleSize.width * 0.5, 125))

			local var_1_1 = ccp(105, -2)
			local var_1_2 = ccp(-105, -2)
			local var_1_3 = CCSprite:createWithSpriteFrameName("chos_gre.png")

			var_1_3:setVisible(false)

			local var_1_4 = CCSprite:createWithSpriteFrameName("chos_pur.png")

			var_1_4:setVisible(false)
			var_1_0:addChild(var_1_3)
			var_1_0:addChild(var_1_4)

			local var_1_5 = CCSprite:createWithSpriteFrameName("chos_arrow_right.png")

			var_1_5:setVisible(false)

			local var_1_6 = CCSprite:createWithSpriteFrameName("chos_arrow_left.png")

			var_1_6:setVisible(false)
			var_1_0:addChild(var_1_5)
			var_1_0:addChild(var_1_6)

			local var_1_7 = CCNode:create()

			var_1_7:setPosition(var_1_2)
			var_1_7:setVisible(false)
			var_1_0:addChild(var_1_7)

			local var_1_8 = CCSprite:createWithSpriteFrameName("chos_btn_gre_a.png")
			local var_1_9 = CCSprite:createWithSpriteFrameName("chos_btn_gre_c.png")

			var_1_9:setVisible(false)
			var_1_7:addChild(var_1_8)
			var_1_7:addChild(var_1_9)

			local var_1_10 = CCNode:create()

			var_1_10:setPosition(var_1_1)
			var_1_10:setVisible(false)
			var_1_0:addChild(var_1_10)

			local var_1_11 = CCSprite:createWithSpriteFrameName("chos_btn_pur_a.png")
			local var_1_12 = CCSprite:createWithSpriteFrameName("chos_btn_pur_c.png")

			var_1_12:setVisible(false)
			var_1_10:addChild(var_1_11)
			var_1_10:addChild(var_1_12)

			local function var_1_13()
				local function var_2_0()
					var_1_10:setVisible(true)
					var_1_7:setVisible(false)
					var_1_3:setVisible(false)
					var_1_4:setVisible(true)
					var_1_6:setVisible(false)
					var_1_5:setVisible(true)
					arg_1_0.autoUseStrategy()
				end

				local var_2_1 = CCArray:create()

				var_2_1:addObject(CCMoveTo:create(0.2, var_1_1))
				var_2_1:addObject(CCCallFuncN:create(var_2_0))

				local var_2_2 = CCSequence:create(var_2_1)

				var_1_7:runAction(var_2_2)
			end

			local function var_1_14()
				local function var_4_0()
					var_1_10:setVisible(false)
					var_1_7:setVisible(true)
					var_1_3:setVisible(true)
					var_1_4:setVisible(false)
					var_1_6:setVisible(true)
					var_1_5:setVisible(false)
					arg_1_0.cancelAutoStrategy()
				end

				local var_4_1 = CCArray:create()

				var_4_1:addObject(CCMoveTo:create(0.2, var_1_2))
				var_4_1:addObject(CCCallFuncN:create(var_4_0))

				local var_4_2 = CCSequence:create(var_4_1)

				var_1_10:runAction(var_4_2)
			end

			local var_1_15
			local var_1_16 = 0
			local var_1_17 = 0

			local function var_1_18(arg_6_0, arg_6_1)
				var_1_16 = arg_6_0
				var_1_17 = arg_6_0

				if var_1_8:isVisible() and tool.checkIfTouch(var_1_8, arg_6_0, arg_6_1) then
					var_1_9:setVisible(true)

					var_1_15 = var_1_7

					return true
				end

				if var_1_11:isVisible() and tool.checkIfTouch(var_1_11, arg_6_0, arg_6_1) then
					var_1_12:setVisible(true)

					var_1_15 = var_1_10

					return true
				end

				return false
			end

			local function var_1_19(arg_7_0, arg_7_1)
				local var_7_0 = arg_7_0 - var_1_16

				var_1_16 = arg_7_0

				if var_1_15 and var_7_0 ~= 0 and math.abs(var_1_17 - var_1_16) > 10 then
					local var_7_1 = var_1_15:getPositionX()
					local var_7_2 = var_1_15:getPositionY()
					local var_7_3 = var_7_1 + var_7_0

					if var_1_15 == var_1_10 and (var_7_0 > 0 or var_7_1 < var_1_2.x) then
						return
					end

					if var_1_15 == var_1_7 and (var_7_0 < 0 or var_7_1 > var_1_1.x) then
						return
					end

					var_1_15:setPosition(ccp(var_7_3, var_7_2))
				end
			end

			local function var_1_20(arg_8_0, arg_8_1)
				if var_1_15 then
					if var_1_15 == var_1_7 then
						var_1_9:setVisible(false)
						var_1_13()
					else
						var_1_12:setVisible(false)
						var_1_14()
					end
				end

				var_1_15 = nil
			end

			local function var_1_21(arg_9_0, arg_9_1, arg_9_2)
				if arg_9_0 == CCTOUCHBEGAN then
					return var_1_18(arg_9_1, arg_9_2)
				elseif arg_9_0 == CCTOUCHMOVED then
					return var_1_19(arg_9_1, arg_9_2)
				elseif arg_9_0 == CCTOUCHENDED then
					return var_1_20(arg_9_1, arg_9_2)
				end
			end

			var_1_0:registerScriptTouchHandler(var_1_21, false, true)
			var_1_0:setTouchEnabled(true)

			if arg_1_0.autoSt == 1 then
				var_1_10:setVisible(true)
				var_1_7:setVisible(false)
				var_1_3:setVisible(true)
				var_1_6:setVisible(true)
			else
				var_1_10:setVisible(false)
				var_1_7:setVisible(true)
				var_1_4:setVisible(true)
				var_1_5:setVisible(true)
			end

			arg_1_0.layerTabel.uiLayer:addChild(var_1_0, 1, uiTag.fightHelper)
		end
	end
end
