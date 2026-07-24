return {
	extend = function(arg_1_0)
		function arg_1_0.initBaseUI(arg_2_0, arg_2_1)
			if arg_2_1.x and arg_2_1.y then
				local var_2_0 = arg_2_1.x
				local var_2_1 = arg_2_1.y

				if arg_2_1.x < 1 and arg_2_1.x > 0 then
					var_2_0 = visibleSize.width * arg_2_1.x
				end

				if arg_2_1.y < 1 and arg_2_1.y > 0 then
					var_2_1 = visibleSize.height * arg_2_1.y
				end

				local var_2_2 = arg_2_1.hAlign or "left"
				local var_2_3 = arg_2_1.vAlign or "bottom"

				if var_2_2 == "right" then
					var_2_0 = visibleSize.width - var_2_0
				end

				if var_2_3 == "top" then
					var_2_1 = visibleSize.height - var_2_1
				end

				arg_1_0.displayObj:setPosition(ccp(var_2_0, var_2_1))
			end

			if arg_2_1.scale then
				arg_1_0.displayObj:setScale(arg_2_1.scale)
			end

			if arg_2_1.scaleX then
				arg_1_0.displayObj:setScaleX(arg_2_1.scaleX)
			end

			if arg_2_1.scaleY then
				arg_1_0.displayObj:setScaleY(arg_2_1.scaleY)
			end

			if arg_2_1.rotate then
				arg_1_0.displayObj:setRotation(arg_2_1.rotate)
			end

			if arg_2_1.visible ~= nil then
				arg_1_0.displayObj:setVisible(arg_2_1.visible)
			end

			if arg_2_1.anchorPoint ~= nil then
				arg_1_0.displayObj:setAnchorPoint(ccp(arg_2_1.anchorPoint.x, arg_2_1.anchorPoint.y))
			end

			if arg_2_1.swallowTouch then
				local function var_2_4(arg_3_0, arg_3_1, arg_3_2)
					if arg_3_0 == CCTOUCHBEGAN then
						if not arg_1_0.displayObj:isVisible() then
							return false
						end

						local var_3_0 = arg_1_0.displayObj:getParent()

						while var_3_0 do
							if not var_3_0:isVisible() then
								return false
							end

							var_3_0 = var_3_0:getParent()
						end

						return true
					end
				end

				arg_1_0.displayObj:registerScriptTouchHandler(var_2_4, false, true)
				arg_1_0.displayObj:setTouchEnabled(true)
			end
		end

		function arg_1_0.getDisplayObj(arg_4_0)
			return arg_1_0.displayObj
		end

		function arg_1_0.addChild(arg_5_0, arg_5_1, arg_5_2)
			if arg_5_2 then
				arg_1_0.displayObj:addChild(arg_5_1:getDisplayObj(), arg_5_2)
			else
				arg_1_0.displayObj:addChild(arg_5_1:getDisplayObj())
			end
		end

		function arg_1_0.addToParent(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
			if arg_6_2 then
				if arg_6_3 then
					arg_6_1:addChild(arg_1_0.displayObj, arg_6_2, arg_6_3)
				else
					arg_6_1:addChild(arg_1_0.displayObj, arg_6_2)
				end
			else
				arg_6_1:addChild(arg_1_0.displayObj)
			end
		end

		function arg_1_0.clear(arg_7_0)
			pcall(arg_1_0.displayObj.removeFromParentAndCleanup, arg_1_0.displayObj, true)
		end
	end,
	createSpriteFromPic = function(arg_8_0)
		if arg_8_0.frame ~= nil and arg_8_0.frame == true then
			local var_8_0 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(arg_8_0.path)

			if not var_8_0 then
				log.error("@@ 资源不存在:", arg_8_0.path)

				return nil
			end

			return CCSprite:createWithSpriteFrame(var_8_0)
		else
			return CCSprite:create(arg_8_0.path)
		end
	end,
	createSprite9FromPic = function(arg_9_0, arg_9_1, arg_9_2)
		local var_9_0

		if arg_9_0.frame ~= nil and arg_9_0.frame == true then
			var_9_0 = CCScale9Sprite:createWithSpriteFrameName(arg_9_0.path, arg_9_1)
		else
			var_9_0 = CCScale9Sprite:create(arg_9_0.path)

			var_9_0:setCapInsets(arg_9_1)
		end

		var_9_0:setPreferredSize(arg_9_2)

		return var_9_0
	end
}
