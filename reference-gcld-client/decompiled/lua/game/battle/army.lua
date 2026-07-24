require("lua/component/CCStrokeLabelTTF")
require("lua/game/battle/widget/hpBar")

ARMY_TAG_CENTER = 1
ARMY_TAG_LEFT = 2
ARMY_TAG_RIGHT = 3
ARMY_TAG_TACTICS = 4
ARMY_TAG_LOSE_HP = 5
ARMY_TAG_HP_BAR = 6
ARMY_TAG_ANIM = 7
ARMY_TAG_BUFF = 8
ARMY_TAG_EVOKE = 9
ARMY_TAG_EXPLODE = 10
ARMY_TAG_SLOPE = 11
ARMY_TAG_SHIELD = 12
ARMY_TAG_JTZ_LIGHT = 13
ARMY_TAG_ZFSHIELD = 14
armyPosition = {}
armyPosition.tactics = ccp(-120, 120)
armyZorder = {}
armyZorder.shadow = 100
armyZorder.army = 200
armyZorder.buff = 250
armyZorder.resIcon = 300
armyZorder.hp = 400
armyZorder.evoke = 280
armyZorder.slope = 290
armyZorder.explode = 310
armyZorder.phantom = 410
armyZorder.shield = 510
armyZorder.jtzLight = 120
armyZorder.zfShield_att = 150
armyZorder.zfShield_def = 300
Army = class("Army", function()
	return CCNode:create()
end)
Army.__index = Army

function Army.playerAnimation(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	if arg_2_0.data.huangyyState == 2 and (arg_2_1 == "attack" or arg_2_1 == "hitted" or arg_2_1 == "idle" or arg_2_1 == "move" or arg_2_1 == "win") then
		arg_2_1 = arg_2_1 .. "_2"
	end

	local function var_2_0()
		if arg_2_2 then
			arg_2_2()
		end

		if arg_2_0.curAnim and arg_2_0.curAnim ~= "idle" then
			arg_2_0:playerAnimation("idle")
		end

		if arg_2_1 == "win" then
			local var_3_0 = arg_2_0:getChildByTag(ARMY_TAG_TACTICS)

			if var_3_0 then
				var_3_0:setVisible(true)
			end
		end
	end

	local function var_2_1(arg_4_0)
		if arg_2_0.data and arg_2_0.data.hasCar then
			return 5
		end

		if arg_4_0 == 1 then
			return 1
		elseif arg_4_0 == 2 then
			return 1
		elseif arg_4_0 == 3 then
			return 1
		elseif arg_4_0 == 4 then
			return 1
		elseif arg_4_0 == 5 then
			return 1
		elseif arg_4_0 == 6 then
			return 2
		elseif arg_4_0 == 7 then
			return 2
		elseif arg_4_0 == 8 then
			return 2
		elseif arg_4_0 == 9 then
			return 2
		elseif arg_4_0 == 10 then
			return 2
		elseif arg_4_0 == 11 then
			return 1
		elseif arg_4_0 == 12 then
			return 1
		elseif arg_4_0 == 13 then
			return 1
		elseif arg_4_0 == 14 then
			return 1
		elseif arg_4_0 == 15 then
			return 1
		elseif arg_4_0 == 16 then
			return 4
		elseif arg_4_0 == 17 then
			return 4
		elseif arg_4_0 == 18 then
			return 4
		elseif arg_4_0 == 19 then
			return 4
		elseif arg_4_0 == 20 then
			return 4
		elseif arg_4_0 == 21 then
			return 2
		elseif arg_4_0 == 22 then
			return 3
		elseif arg_4_0 == 23 then
			return 3
		elseif arg_4_0 == 24 then
			return 1
		elseif arg_4_0 == 25 then
			return 1
		elseif arg_4_0 == 26 then
			return 1
		elseif arg_4_0 == 27 then
			return 1
		elseif arg_4_0 == 28 then
			return 4
		elseif arg_4_0 == 29 then
			return 4
		elseif arg_4_0 == 30 then
			return 5
		elseif arg_4_0 == 31 then
			return 1
		elseif arg_4_0 == 32 then
			return 2
		elseif arg_4_0 == 33 then
			return 1
		elseif arg_4_0 == 34 then
			return 2
		elseif arg_4_0 == 35 then
			return 6
		elseif arg_4_0 == 36 then
			return 5
		elseif arg_4_0 == 37 then
			return 1
		elseif arg_4_0 == 38 then
			return 5
		elseif arg_4_0 == 39 then
			return 5
		elseif arg_4_0 == 40 then
			return 2
		elseif arg_4_0 == 43 then
			return 7
		elseif arg_4_0 == 46 then
			return 4
		elseif arg_4_0 == 47 then
			return 4
		elseif arg_4_0 == 54 then
			return 5
		elseif arg_4_0 == 56 then
			return 5
		elseif arg_4_0 == 57 then
			return 2
		elseif arg_4_0 == "57_1" then
			return 4
		elseif arg_4_0 == 58 then
			return 7
		elseif arg_4_0 == 59 then
			return 2
		elseif arg_4_0 == 60 then
			return 5
		end

		return 1
	end

	local var_2_2 = arg_2_0.animArrays[arg_2_1]
	local var_2_3 = arg_2_0.animBatchImage
	local var_2_4
	local var_2_5

	if arg_2_0.animMainArrays and arg_2_0.animMainArrays[arg_2_1] then
		var_2_4 = arg_2_0.animMainArrays[arg_2_1]
	end

	if arg_2_0.animMainBatchImage then
		var_2_5 = arg_2_0.animMainBatchImage
	end

	arg_2_0.curAnim = arg_2_1
	arg_2_0.armySpriteRecord = {}

	if var_2_2 then
		for iter_2_0, iter_2_1 in pairs(arg_2_0.nodes) do
			if iter_2_1 then
				if iter_2_1:getChildByTag(ARMY_TAG_ANIM) then
					iter_2_1:removeChildByTag(ARMY_TAG_ANIM, true)
				end

				local var_2_6 = false

				if arg_2_0.data.troopType ~= 43 and arg_2_0.data.troopType ~= 58 and arg_2_0.nodes[ARMY_TAG_CENTER] == iter_2_1 and var_2_4 and var_2_5 then
					var_2_6 = true
				end

				local var_2_7 = CCNode:create()
				local var_2_8 = CCSpriteBatchNode:create(var_2_3)

				if var_2_6 then
					var_2_8 = CCSpriteBatchNode:create(var_2_5)
				end

				if (arg_2_0.data.troopType == 43 or arg_2_0.data.troopType == 58) and arg_2_0.nodes[ARMY_TAG_CENTER] ~= iter_2_1 then
					iter_2_1:setVisible(false)
				else
					iter_2_1:setVisible(true)
				end

				var_2_7:addChild(var_2_8)

				local var_2_9 = 24
				local var_2_10 = var_2_9 / 2
				local var_2_11 = var_2_1(arg_2_0.data.troopType)

				if arg_2_0.data.troopType == 55 and arg_2_0.data.buffBuQu ~= nil and not arg_2_0.data.hasCar then
					if arg_2_0.data.buffBuQu >= 5 and arg_2_0.data.buffBuQu < 10 then
						var_2_11 = "zhoutai1"
					elseif arg_2_0.data.buffBuQu >= 10 and arg_2_0.data.buffBuQu < 15 then
						var_2_11 = "zhoutai2"
					elseif arg_2_0.data.buffBuQu >= 15 then
						var_2_11 = "zhoutai3"
					end
				end

				if var_2_6 then
					var_2_11 = 5
				end

				for iter_2_2 = 1, 3 do
					local var_2_12 = (iter_2_2 - 1) * -var_2_9
					local var_2_13 = (iter_2_2 - 1) * -var_2_10

					if var_2_11 == 1 then
						if arg_2_0.data.side == "def" then
							var_2_12 = var_2_12 + var_2_9 * 0.5
							var_2_13 = var_2_13 + var_2_10 * 0.5
						else
							var_2_12 = var_2_12 - var_2_9 * 0.5
							var_2_13 = var_2_13 - var_2_10 * 0.5
						end
					end

					if var_2_11 == 4 or arg_2_0.data.troopType == 21 then
						var_2_12 = var_2_12 - var_2_9 * 0.3
						var_2_13 = var_2_13 + var_2_10 * 0.3

						if arg_2_0.data.side == "def" then
							var_2_12 = var_2_12 + var_2_9 * 0.5
							var_2_13 = var_2_13 + var_2_10 * 0.5
						else
							var_2_12 = var_2_12 - var_2_9 * 0.5
							var_2_13 = var_2_13 - var_2_10 * 0.5
						end

						var_2_9 = 20
						var_2_10 = var_2_9 / 2
					end

					if var_2_11 == 3 then
						var_2_12 = var_2_12 - var_2_9 * 0.2
						var_2_13 = var_2_13 + var_2_10 * 0.2

						if arg_2_0.data.side == "def" then
							var_2_12 = var_2_12 + var_2_9 * 0.2
							var_2_13 = var_2_13 + var_2_10 * 0.2
						else
							var_2_12 = var_2_12 - var_2_9 * 0.2
							var_2_13 = var_2_13 - var_2_10 * 0.2
						end

						var_2_9 = 20
						var_2_10 = var_2_9 / 2
					end

					if arg_2_0.data.troopType == 35 then
						if arg_2_0.data.side == "def" then
							var_2_13 = var_2_13 + 20
							var_2_12 = var_2_12 - 8
						else
							var_2_13 = var_2_13 + 18
							var_2_12 = var_2_12 - 1
						end
					end

					if arg_2_0.data.troopType == 37 then
						if arg_2_0.data.side == "def" then
							var_2_13 = var_2_13 + 24
							var_2_12 = var_2_12 - 15
						else
							var_2_13 = var_2_13 + 17
							var_2_12 = var_2_12 + 20
						end
					end

					if arg_2_0.data.troopType == 40 and not var_2_6 then
						if arg_2_0.data.side == "def" then
							var_2_13 = var_2_13 + 30
							var_2_12 = var_2_12 + 0
						else
							var_2_13 = var_2_13 + 25
							var_2_12 = var_2_12 + 5
						end
					end

					if arg_2_0.data.troopType == 36 then
						if arg_2_0.data.side == "att" then
							var_2_13 = var_2_13 + 18
							var_2_12 = var_2_12 + 10
						else
							var_2_13 = var_2_13 + 27
							var_2_12 = var_2_12 + 5
						end
					end

					if arg_2_0.data.troopType == 38 then
						if arg_2_0.data.side == "att" then
							var_2_13 = var_2_13 + 18
							var_2_12 = var_2_12 + 5
						else
							var_2_13 = var_2_13 + 27
							var_2_12 = var_2_12 + 5
						end
					end

					if arg_2_0.data.troopType == 39 then
						if arg_2_0.data.side == "att" then
							var_2_13 = var_2_13 + 14
							var_2_12 = var_2_12 + 10
						else
							var_2_13 = var_2_13 + 25
							var_2_12 = var_2_12 + 14
						end
					end

					if arg_2_0.data.troopType == 42 then
						if arg_2_0.data.side == "att" then
							var_2_13 = var_2_13 + 12
							var_2_12 = var_2_12 + 8
						else
							var_2_13 = var_2_13 + 16
							var_2_12 = var_2_12 - 8
						end
					end

					if arg_2_0.data.troopType == 43 then
						if arg_2_0.data.side == "att" then
							var_2_13 = var_2_13 + 35
							var_2_12 = var_2_12 + 3
						else
							var_2_13 = var_2_13 + 50
							var_2_12 = var_2_12 + 15
						end
					end

					if arg_2_0.data.troopType == 58 then
						if arg_2_0.data.side == "att" then
							var_2_13 = var_2_13 + 35
							var_2_12 = var_2_12 + 3
						else
							var_2_13 = var_2_13 + 75
							var_2_12 = var_2_12 + 80
						end
					end

					if arg_2_0.data.troopType == 45 then
						if arg_2_0.data.side == "att" then
							var_2_13 = var_2_13 + 25
							var_2_12 = var_2_12 + 10
						else
							var_2_13 = var_2_13 + 23
							var_2_12 = var_2_12 - 3
						end
					end

					if arg_2_0.data.troopType == 46 then
						if arg_2_0.data.side == "att" then
							var_2_13 = var_2_13 + 13
							var_2_12 = var_2_12 + 25
						else
							var_2_13 = var_2_13 + 10
							var_2_12 = var_2_12 - 3
						end
					end

					if arg_2_0.data.troopType == 47 then
						if arg_2_0.data.side == "att" then
							var_2_13 = var_2_13 + 10
							var_2_12 = var_2_12 + 20
						else
							var_2_13 = var_2_13 + 0
							var_2_12 = var_2_12 - 0
						end
					end

					if arg_2_0.data.troopType == 48 then
						if arg_2_0.data.side == "att" then
							var_2_13 = var_2_13 + 20
							var_2_12 = var_2_12 + 0
						else
							var_2_13 = var_2_13 + 23
							var_2_12 = var_2_12 - 5
						end
					end

					if arg_2_0.data.troopType == 54 then
						if arg_2_0.data.side == "att" then
							var_2_13 = var_2_13 + 23
							var_2_12 = var_2_12 + 18
						else
							var_2_13 = var_2_13 + 22
							var_2_12 = var_2_12 + 8
						end
					end

					if arg_2_0.data.troopType == 55 then
						if arg_2_0.data.side == "att" then
							var_2_13 = var_2_13 + 23
							var_2_12 = var_2_12 + 18
						else
							var_2_13 = var_2_13 + 12
							var_2_12 = var_2_12 - 10
						end
					end

					if arg_2_0.data.troopType == 56 then
						if arg_2_0.data.huangyyState == 1 then
							if arg_2_0.data.side == "att" then
								var_2_13 = var_2_13 + 30
								var_2_12 = var_2_12 + 10
							else
								var_2_13 = var_2_13 + 35
								var_2_12 = var_2_12 + 10
							end
						elseif arg_2_0.data.side == "att" then
							var_2_13 = var_2_13 + 2
							var_2_12 = var_2_12 + 2
						else
							var_2_13 = var_2_13 + 1
							var_2_12 = var_2_12 - 9
						end
					end

					if arg_2_0.data.troopType == 57 then
						if arg_2_0.data.side == "att" then
							var_2_13 = var_2_13 + 20
							var_2_12 = var_2_12 + 10
						else
							var_2_13 = var_2_13 + 20
							var_2_12 = var_2_12 + 10
						end
					end

					if arg_2_0.data.troopType == "57_1" and not arg_2_0.data.hasCar then
						if arg_2_0.data.side == "att" then
							var_2_13 = var_2_13 + 35
							var_2_12 = var_2_12 + 35
						else
							var_2_13 = var_2_13 + 20
							var_2_12 = var_2_12 - 10
						end
					end

					if arg_2_0.data.troopType == 59 then
						if arg_2_0.data.side == "att" then
							var_2_13 = var_2_13 + 30
							var_2_12 = var_2_12 + 10
						else
							var_2_13 = var_2_13 + 35
							var_2_12 = var_2_12 + 10
						end
					end

					if arg_2_0.data.troopType == 60 then
						if arg_2_0.data.side == "att" then
							var_2_13 = var_2_13 + 30
							var_2_12 = var_2_12 + 10
						else
							var_2_13 = var_2_13 + 35
							var_2_12 = var_2_12 + 10
						end
					end

					if var_2_6 then
						var_2_12 = (iter_2_2 - 1) * -var_2_9
						var_2_13 = (iter_2_2 - 1) * -var_2_10

						if arg_2_0.data.side == "def" then
							if arg_2_0.data.isMain == 1 then
								var_2_13 = var_2_13 + 50
								var_2_12 = var_2_12 + 10
							else
								var_2_13 = var_2_13 + 50
								var_2_12 = var_2_12 + 10
							end
						elseif arg_2_0.data.isMain == 1 then
							var_2_13 = var_2_13 + 35
							var_2_12 = var_2_12 + 7
						else
							var_2_13 = var_2_13 + 35
							var_2_12 = var_2_12 - 20
						end
					end

					for iter_2_3 = 1, 3 do
						local var_2_14
						local var_2_15

						if arg_2_0.data.side == "def" then
							var_2_14 = 4 - iter_2_2
							var_2_15 = iter_2_3
						else
							var_2_14 = iter_2_2
							var_2_15 = iter_2_3
						end

						if troopPattern[var_2_11][var_2_14][var_2_15] == 1 then
							local var_2_16 = CCAnimation:createWithSpriteFrames(var_2_2, 0.05)

							if var_2_6 then
								var_2_16 = CCAnimation:createWithSpriteFrames(var_2_4, 0.05)
							end

							local var_2_17 = CCAnimate:create(var_2_16)

							arg_2_3 = arg_2_3 or 1

							local var_2_18 = CCRepeat:create(var_2_17, arg_2_3)
							local var_2_19 = CCCallFuncN:create(var_2_0)
							local var_2_20 = CCArray:create()

							var_2_20:addObject(var_2_18)
							var_2_20:addObject(var_2_19)

							local var_2_21 = CCSequence:create(var_2_20)
							local var_2_22 = CCSprite:createWithSpriteFrame(tolua.cast(var_2_2:objectAtIndex(0), "CCSpriteFrame"))

							if var_2_6 then
								var_2_22 = CCSprite:createWithSpriteFrame(tolua.cast(var_2_4:objectAtIndex(0), "CCSpriteFrame"))
							end

							if arg_2_1 == "idle" and var_2_6 and var_2_4 and var_2_4:count() > 1 then
								log.info("animMainArray:count() ： " .. var_2_4:count())
								var_2_22:runAction(CCRepeatForever:create(var_2_17))
								var_2_0()
							else
								var_2_22:runAction(var_2_21)
							end

							var_2_22:setScale(0.7)

							if arg_2_0.data.troopType == 16 or arg_2_0.data.troopType == 17 or arg_2_0.data.troopType == 18 or arg_2_0.data.troopType == 19 or arg_2_0.data.troopType == 20 or arg_2_0.data.troopType == 29 then
								var_2_22:setScale(0.77)
							end

							if arg_2_0.data.troopType == 37 then
								var_2_22:setScale(0.63)
							end

							if arg_2_0.data.troopType == 40 then
								var_2_22:setScale(0.5)
							end

							if arg_2_0.data.troopType == 42 then
								var_2_22:setScale(0.85)
							end

							if arg_2_0.data.troopType == 36 or arg_2_0.data.troopType == 38 or arg_2_0.data.troopType == 39 then
								var_2_22:setScale(0.9)
							end

							if arg_2_0.data.troopType == 43 then
								var_2_22:setScale(1)
							end

							if arg_2_0.data.troopType == 58 then
								var_2_22:setScale(0.8)
							end

							if arg_2_0.data.troopType == 46 then
								var_2_22:setScale(0.45)
							end

							if arg_2_0.data.troopType == 47 then
								var_2_22:setScale(0.55)
							end

							if arg_2_0.data.troopType == 48 then
								var_2_22:setScale(0.33)
							end

							if var_2_6 then
								var_2_22:setScale(1)
							end

							if arg_2_0.data.hasCar then
								var_2_22:setScale(0.7)
							end

							var_2_22:setPosition(ccp(var_2_12, var_2_13))

							if arg_2_0.data.attack then
								local var_2_23 = ccc3(255, 255, 255)
								local var_2_24 = arg_2_0.data.attack > 0 and ccc3(255, 0, 0) or ccc3(0, 0, 153)
								local var_2_25 = 0.15 * math.abs(arg_2_0.data.attack)

								var_2_22:setColor(ccc3(var_2_23.r + var_2_25 * (var_2_24.r - var_2_23.r), var_2_23.g + var_2_25 * (var_2_24.g - var_2_23.g), var_2_23.b + var_2_25 * (var_2_24.b - var_2_23.b)))
							end

							if arg_2_0.data.troopType == 55 and arg_2_0.data.buffBuQu ~= nil and not arg_2_0.data.hasCar and arg_2_0.data.buffBuQu >= 15 then
								var_2_22:setScale(0.9)
							end

							if arg_2_0.data.side == "def" then
								var_2_8:addChild(var_2_22, troopPatternZOrderDef[var_2_14][var_2_15])
							else
								var_2_8:addChild(var_2_22, troopPatternZOrderAtt[var_2_14][var_2_15])
							end

							arg_2_0.armySpriteRecord[#arg_2_0.armySpriteRecord + 1] = var_2_22

							if arg_2_0.data.troopType == "57_1" and not var_2_6 and not arg_2_0.data.hasCar then
								local var_2_26 = arg_2_0.animArrays.light
								local var_2_27 = CCSprite:createWithSpriteFrame(tolua.cast(var_2_26:objectAtIndex(0), "CCSpriteFrame"))

								if arg_2_0.data.side == "def" then
									var_2_27:setPosition(var_2_12 + 54, var_2_13 + 24)
									var_2_8:addChild(var_2_27, troopPatternZOrderDef[var_2_14][var_2_15])
								else
									var_2_27:setPosition(var_2_12 - 64, var_2_13 - 50)
									var_2_8:addChild(var_2_27, troopPatternZOrderAtt[var_2_14][var_2_15])
								end

								local var_2_28 = CCAnimation:createWithSpriteFrames(var_2_26, 0.05)
								local var_2_29 = CCAnimate:create(var_2_28)

								var_2_27:runAction(CCRepeatForever:create(var_2_29))
							end
						end

						var_2_12 = var_2_12 + var_2_9
						var_2_13 = var_2_13 - var_2_10
					end
				end

				if arg_2_1 == "move" then
					local var_2_30 = "Land"

					if arg_2_0.battleControl.terrain == 4 then
						var_2_30 = "Water"
					end

					local var_2_31 = "walkOn" .. var_2_30 .. "_" .. arg_2_0.data.side
					local var_2_32 = rmgr.getAnimation(var_2_31)
					local var_2_33 = CCAnimation:createWithSpriteFrames(var_2_32, 0.08)
					local var_2_34 = CCAnimate:create(var_2_33)
					local var_2_35 = CCRepeat:create(var_2_34, 100)
					local var_2_36 = CCSprite:create()

					var_2_36:runAction(var_2_35)
					var_2_36:setScale(0.8)

					if arg_2_0.data.side == "def" then
						var_2_36:setPosition(ccp(25, -5))
					else
						var_2_36:setPosition(ccp(-10, -35))
					end

					var_2_7:addChild(var_2_36, -1)
				end

				iter_2_1:addChild(var_2_7, armyZorder.army, ARMY_TAG_ANIM)
			end
		end
	end
end

function Army.showAttack(arg_5_0, arg_5_1)
	if arg_5_1 == 0 then
		return
	end

	local var_5_0 = arg_5_1 > 0 and "xhdjx_numb_r.png" or "xhdjx_numb_b.png"
	local var_5_1 = arg_5_1 > 0 and "xhdjx_knife_r.png" or "xhdjx_knife_b.png"
	local var_5_2 = arg_5_1 > 0 and tostring(arg_5_1) or ":" .. math.abs(arg_5_1)

	if not arg_5_0.bg_attack then
		local var_5_3 = CCSprite:create("res/ui/battle/xiahoudun/" .. var_5_1)
		local var_5_4 = CCLabelAtlas:create(var_5_2, "res/ui/battle/xiahoudun/" .. var_5_0, 22, 28, 48)

		var_5_4:setAnchorPoint(ccp(0, 0.5))
		var_5_4:setPosition(50, 30)
		var_5_3:setScale(0.7)
		var_5_3:addChild(var_5_4)
		arg_5_0:addChild(var_5_3, 1)

		arg_5_0.bg_attack = var_5_3
		arg_5_0.num_attack = var_5_4
	else
		arg_5_0.num_attack:setString(var_5_2)
	end

	if arg_5_1 ~= arg_5_0.data.attack then
		local var_5_5 = CCLabelAtlas:create(":1", "res/ui/battle/xiahoudun/" .. var_5_0, 22, 28, 48)

		var_5_5:setAnchorPoint(ccp(0, 0.5))
		var_5_5:setPosition(50, 40)
		arg_5_0.bg_attack:addChild(var_5_5)

		local var_5_6 = CCArray:create()

		var_5_6:addObject(CCMoveBy:create(0.4, ccp(0, 30)))
		var_5_6:addObject(CCCallFunc:create(function()
			var_5_5:removeFromParentAndCleanup(true)
		end))

		local var_5_7 = CCSequence:create(var_5_6)

		var_5_5:runAction(var_5_7)
	end

	arg_5_0.data.attack = arg_5_1
end

function Army.showBuQu(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_1 == 0 then
		return
	end

	if arg_7_2 then
		if not arg_7_0.bg_buffBuQu and arg_7_1 >= 4 then
			local var_7_0 = CCSprite:create("res/ui/battle/zhoutai/ztjx_icon_01.png")

			var_7_0:setScale(0.7)
			var_7_0:setPosition(0, 45)

			local var_7_1 = CCSprite:create("res/ui/battle/zhoutai/ztjx_battle_bar_bg.png")

			var_7_1:setPosition(86, 18)
			var_7_0:addChild(var_7_1)

			local var_7_2 = CCProgressTimer:create(CCSprite:create("res/ui/battle/zhoutai/ztjx_battle_bar.png"))

			var_7_2:setType(kCCProgressTimerTypeBar)
			var_7_2:setMidpoint(ccp(0, 0.5))
			var_7_2:setBarChangeRate(ccp(1, 0))
			var_7_2:setAnchorPoint(ccp(0, 0))
			var_7_2:setPosition(0, 0)
			var_7_1:addChild(var_7_2)
			arg_7_0:addChild(var_7_0, 1)

			arg_7_0.bg_buffBuQu = var_7_0
			arg_7_0.bar_buffBuQu = var_7_2
		end

		if arg_7_0.bar_buffBuQu then
			if arg_7_1 ~= arg_7_0.data.buffBuQu and arg_7_1 % 5 == 0 then
				local var_7_3 = CCArray:create()

				var_7_3:addObject(CCProgressTo:create(0.5, 25 * math.floor(arg_7_1 / 5)))

				local var_7_4 = CCSequence:create(var_7_3)

				arg_7_0.bar_buffBuQu:runAction(var_7_4)
			else
				arg_7_0.bar_buffBuQu:setPercentage(25 * math.floor(arg_7_1 / 5))
			end
		end
	else
		arg_7_0:playerAnimation("idle")
	end

	arg_7_0.data.buffBuQu = arg_7_1
end

function Army.showTactics(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	arg_8_0.tacticsType = arg_8_1
	arg_8_0.tacticsId = arg_8_2

	tool.safeRemoveChildByTag(arg_8_0, ARMY_TAG_TACTICS)

	if arg_8_1 == 1 then
		local var_8_0 = CCSprite:createWithSpriteFrameName("stategyBackground.png")
		local var_8_1 = string.format("res/ui/common/fightPic/fightPic_%s.png", arg_8_3)
		local var_8_2 = CCSprite:create(var_8_1)

		var_8_2:setPosition(ccp(var_8_0:getContentSize().width * 0.5, var_8_0:getContentSize().height * 0.5))
		var_8_0:addChild(var_8_2)
		var_8_0:setScale(0.5)
		var_8_0:setPosition(armyPosition.tactics)
		arg_8_0:addChild(var_8_0, 1, ARMY_TAG_TACTICS)

		return
	end

	rmgr.loadResource("res/ui/battle/tractics/tractics.plist")

	local var_8_3 = "gongji"

	if arg_8_2 == 1000130 then
		var_8_3 = "tuji"
	elseif arg_8_2 == 1110131 or arg_8_2 == 1110231 or arg_8_2 == 1110331 or arg_8_2 == 1110431 or arg_8_2 == 1110531 or arg_8_2 == 1210133 or arg_8_2 == 1210233 or arg_8_2 == 1210333 or arg_8_2 == 1210433 or arg_8_2 == 1210533 or arg_8_2 == 1410132 or arg_8_2 == 1410232 or arg_8_2 == 1410332 or arg_8_2 == 1410432 or arg_8_2 == 1410532 then
		var_8_3 = "tujijiacheng"
	elseif arg_8_2 == 2000120 then
		var_8_3 = "fangshou"
	elseif arg_8_2 == 2210121 or arg_8_2 == 2210221 or arg_8_2 == 2210321 or arg_8_2 == 2210421 or arg_8_2 == 2210521 or arg_8_2 == 2310122 or arg_8_2 == 2310222 or arg_8_2 == 2310322 or arg_8_2 == 2310422 or arg_8_2 == 2310522 then
		var_8_3 = "fangshoujiacheng"
	elseif arg_8_2 == 3000110 then
		var_8_3 = "gongji"
	elseif arg_8_2 == 3110113 or arg_8_2 == 3110213 or arg_8_2 == 3110313 or arg_8_2 == 3110413 or arg_8_2 == 3110513 or arg_8_2 == 3310111 or arg_8_2 == 3310211 or arg_8_2 == 3310311 or arg_8_2 == 3310411 or arg_8_2 == 3310511 or arg_8_2 == 3410112 or arg_8_2 == 3410212 or arg_8_2 == 3410312 or arg_8_2 == 3410412 or arg_8_2 == 3410512 then
		var_8_3 = "gongjijiacheng"
	end

	local var_8_4 = CCSprite:createWithSpriteFrameName(string.format("%s.png", var_8_3))

	var_8_4:setPosition(armyPosition.tactics)
	var_8_4:setScale(0.5)
	arg_8_0:addChild(var_8_4, 1, ARMY_TAG_TACTICS)
end

function Army.updateTactics(arg_9_0, arg_9_1)
	if arg_9_0:getChildByTag(ARMY_TAG_TACTICS) and arg_9_0.tacticsType == 1 then
		tool.safeRemoveChildByTag(arg_9_0, ARMY_TAG_TACTICS)

		local var_9_0 = CCSprite:createWithSpriteFrameName("stategyBackground.png")
		local var_9_1 = string.format("res/ui/common/fightPic/fightPic_%s.png", arg_9_1)
		local var_9_2 = CCSprite:create(var_9_1)

		var_9_2:setPosition(ccp(var_9_0:getContentSize().width * 0.5, var_9_0:getContentSize().height * 0.5))
		var_9_0:addChild(var_9_2)
		var_9_0:setScale(0.5)
		var_9_0:setPosition(armyPosition.tactics)
		arg_9_0:addChild(var_9_0, 1, ARMY_TAG_TACTICS)
	end
end

function Army.removeTactics(arg_10_0)
	tool.safeRemoveChildByTag(arg_10_0, ARMY_TAG_TACTICS)
end

function Army.showTacticsWinEffect(arg_11_0, arg_11_1)
	local var_11_0
	local var_11_1

	if arg_11_1 == 1110131 or arg_11_1 == 1110231 or arg_11_1 == 1110331 or arg_11_1 == 1110431 or arg_11_1 == 1110531 or arg_11_1 == 1210133 or arg_11_1 == 1210233 or arg_11_1 == 1210333 or arg_11_1 == 1210433 or arg_11_1 == 1210533 or arg_11_1 == 1410132 or arg_11_1 == 1410232 or arg_11_1 == 1410332 or arg_11_1 == 1410432 or arg_11_1 == 1410532 then
		var_11_0 = "specialAssWin"

		local var_11_2 = enumAudioFile.battle_tactics_tuji
	elseif arg_11_1 == 1000130 then
		local var_11_3 = enumAudioFile.battle_tactics_tuji
	elseif arg_11_1 == 2210121 or arg_11_1 == 2210221 or arg_11_1 == 2210321 or arg_11_1 == 2210421 or arg_11_1 == 2210521 or arg_11_1 == 2310122 or arg_11_1 == 2310222 or arg_11_1 == 2310322 or arg_11_1 == 2310422 or arg_11_1 == 2310522 then
		var_11_0 = "specialDefWin"

		local var_11_4 = enumAudioFile.battle_tactics_fangshou
	elseif arg_11_1 == 2000120 then
		local var_11_5 = enumAudioFile.battle_tactics_fangshou
	elseif arg_11_1 == 3110113 or arg_11_1 == 3110213 or arg_11_1 == 3110313 or arg_11_1 == 3110413 or arg_11_1 == 3110513 or arg_11_1 == 3310111 or arg_11_1 == 3310211 or arg_11_1 == 3310311 or arg_11_1 == 3310411 or arg_11_1 == 3310511 or arg_11_1 == 3410112 or arg_11_1 == 3410212 or arg_11_1 == 3410312 or arg_11_1 == 3410412 or arg_11_1 == 3410512 then
		var_11_0 = "specialAttWin"

		local var_11_6 = enumAudioFile.battle_tactics_gongji
	elseif arg_11_1 == 3000110 then
		local var_11_7 = enumAudioFile.battle_tactics_gongji
	end

	if var_11_0 then
		local var_11_8 = arg_11_0:getChildByTag(ARMY_TAG_TACTICS)
		local var_11_9 = rmgr.getAnimation(var_11_0)
		local var_11_10 = CCAnimation:createWithSpriteFrames(var_11_9, 0.08)
		local var_11_11 = CCAnimate:create(var_11_10)
		local var_11_12 = CCRepeat:create(var_11_11, 1)
		local var_11_13 = visibleSize.width * 0.5 - 150
		local var_11_14 = visibleSize.height * 0.5 + 150

		arg_11_0.battleControl.showEffect(effectType.animArray, var_11_12, ccp(var_11_13, var_11_14))
	end
end

function Army.doTactics(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0:updataHp()

	local function var_12_0()
		if arg_12_1.result then
			local var_13_0 = arg_12_1.result
			local var_13_1 = false

			if var_13_0 == 1 and arg_12_0.data.side == "def" then
				var_13_1 = true
			elseif var_13_0 == 2 and arg_12_0.data.side == "att" then
				var_13_1 = true
			elseif var_13_0 == 3 then
				var_13_1 = true
			end

			local var_13_2 = arg_12_0:getChildByTag(ARMY_TAG_TACTICS)

			if var_13_1 and var_13_2 then
				var_13_2:setVisible(false)
			end
		end

		if arg_12_2 then
			arg_12_2()
		end
	end

	local var_12_1 = arg_12_0:getPositionX() + 10
	local var_12_2 = arg_12_0:getPositionY() + 10
	local var_12_3 = CCMoveBy:create(0.06, ccp(5, 5))
	local var_12_4 = var_12_3:reverse()
	local var_12_5 = CCMoveBy:create(0.04, ccp(4, 4))
	local var_12_6 = var_12_3:reverse()
	local var_12_7 = CCMoveBy:create(0.02, ccp(3, 3))
	local var_12_8 = var_12_3:reverse()
	local var_12_9 = CCCallFuncN:create(var_12_0)
	local var_12_10 = CCArray:create()

	var_12_10:addObject(var_12_3)
	var_12_10:addObject(var_12_4)
	var_12_10:addObject(var_12_5)
	var_12_10:addObject(var_12_6)
	var_12_10:addObject(var_12_7)
	var_12_10:addObject(var_12_8)
	var_12_10:addObject(var_12_9)

	local var_12_11 = CCSequence:create(var_12_10)
	local var_12_12 = arg_12_0:getChildByTag(ARMY_TAG_TACTICS)

	if var_12_12 then
		var_12_12:runAction(var_12_11)
	elseif arg_12_2 then
		arg_12_2()
	end

	local var_12_13 = arg_12_1.result

	if var_12_13 == 1 and arg_12_0.data.side == "att" or var_12_13 == 2 and arg_12_0.data.side == "def" or var_12_13 == 3 then
		local var_12_14 = arg_12_1.stategyShow[arg_12_0.data.side].tacticsId

		arg_12_0:showTacticsWinEffect(var_12_14)
	end
end

function Army.moveTo(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	arg_14_0:playerAnimation("move", nil, 3)

	local var_14_0 = CCMoveTo:create(arg_14_1, arg_14_2)
	local var_14_1 = CCCallFuncN:create(arg_14_3)
	local var_14_2 = CCArray:create()

	var_14_2:addObject(var_14_0)
	var_14_2:addObject(var_14_1)

	local var_14_3 = CCSequence:create(var_14_2)

	arg_14_0:runAction(var_14_3)
end

function Army.fight(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	local function var_15_0()
		if arg_15_3 then
			arg_15_3()
		end

		if arg_15_2 and arg_15_2.row == arg_15_0.data.row then
			arg_15_0:showTactics(2, arg_15_2.tacticsId)
		end

		arg_15_0:playerAnimation("idle")
	end

	local var_15_1 = 1

	local function var_15_2()
		if arg_15_0.data.side == "att" then
			for iter_17_0, iter_17_1 in pairs(arg_15_0.nodes) do
				if iter_17_1 then
					local var_17_0 = rmgr.getFightFireEffect()
					local var_17_1 = CCAnimation:createWithSpriteFrames(var_17_0, 0.05)
					local var_17_2 = CCAnimate:create(var_17_1)
					local var_17_3, var_17_4 = tool.getPositionInScreen(iter_17_1)

					if arg_15_0.battleControl then
						arg_15_0.battleControl.showEffect(effectType.animArray, var_17_2, ccp(var_17_3 + 45, var_17_4 + 45))
					end
				end
			end
		end

		arg_15_0:loseTroops({
			deadInfo = arg_15_1[var_15_1]
		})

		var_15_1 = var_15_1 + 1
	end

	local var_15_3 = CCArray:create()

	for iter_15_0, iter_15_1 in pairs(arg_15_1) do
		local var_15_4 = CCDelayTime:create(0.5)
		local var_15_5 = CCCallFuncN:create(var_15_2)

		var_15_3:addObject(var_15_4)
		var_15_3:addObject(var_15_5)
	end

	local var_15_6 = CCSequence:create(var_15_3)
	local var_15_7 = CCNode:create()

	var_15_7:runAction(var_15_6)
	arg_15_0:addChild(var_15_7)

	local var_15_8 = #arg_15_1

	if arg_15_0.data.troopType == 21 then
		var_15_8 = var_15_8 * 2
	end

	arg_15_0:playerAnimation("attack", var_15_0, var_15_8)
end

function Army.loseTroops(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	if arg_18_0:isVisible() == false then
		return
	end

	local var_18_0 = arg_18_0.data.hasCar
	local var_18_1 = arg_18_0.data.carShiled

	for iter_18_0, iter_18_1 in pairs(arg_18_0.nodes) do
		if arg_18_0.nodes[ARMY_TAG_CENTER] ~= iter_18_1 and (arg_18_0.data.troopType == 43 or arg_18_0.data.troopType == 58) then
			-- block empty
		elseif iter_18_1 then
			local var_18_2
			local var_18_3 = 0

			if arg_18_0.data.hasCar or arg_18_0.data.carShiled then
				if arg_18_1.deadInfo[iter_18_0] and arg_18_1.deadInfo[iter_18_0] <= -200000000 then
					arg_18_1.deadInfo[iter_18_0] = -200000000 - arg_18_1.deadInfo[iter_18_0]
				end

				if arg_18_1.deadInfo[iter_18_0] == -2 then
					if arg_18_0.data and arg_18_0.data.zfShield > 0 then
						arg_18_0.data.zfShield = 0
					end

					arg_18_0:deleteZfShield()
				elseif arg_18_0.hpInfo[iter_18_0].carHp % (arg_18_0.hpInfo[iter_18_0].carMaxHp / arg_18_0.data.bigGzNum) == 0 and arg_18_0.hpInfo[iter_18_0].carHp <= arg_18_0.hpInfo[iter_18_0].carMaxHp then
					if arg_18_1.deadInfo[iter_18_0] and arg_18_1.deadInfo[iter_18_0] <= -200000000 then
						arg_18_1.deadInfo[iter_18_0] = arg_18_0.hpInfo[iter_18_0].carMaxHp / arg_18_0.data.bigGzNum
						var_18_2 = CCSprite:create("res/ui/battle/gemEffect/gemEffect.png")

						local var_18_4 = CCSprite:create("res/ui/battle/gemEffect/baoji.png")

						var_18_4:setPosition(ccp(var_18_2:getContentSize().width / 2, var_18_2:getContentSize().height / 2))
						var_18_2:addChild(var_18_4)
					elseif arg_18_1.deadInfo[iter_18_0] and arg_18_1.deadInfo[iter_18_0] == -100000000 then
						arg_18_1.deadInfo[iter_18_0] = arg_18_0.hpInfo[iter_18_0].carMaxHp / arg_18_0.data.bigGzNum
						var_18_2 = CCSprite:create("res/ui/battle/gemEffect/gemEffect.png")

						local var_18_5 = CCSprite:create("res/ui/battle/gemEffect/zhansha.png")

						var_18_5:setPosition(ccp(var_18_2:getContentSize().width / 2, var_18_2:getContentSize().height / 2))
						var_18_2:addChild(var_18_5)
					else
						var_18_2 = CCSprite:create("res/ui/battle/gemEffect/gemEffect.png")

						local var_18_6 = CCSprite:create("res/ui/battle/gemEffect/zc_word_pj.png")

						var_18_6:setPosition(ccp(var_18_2:getContentSize().width / 2, var_18_2:getContentSize().height / 2))
						var_18_2:addChild(var_18_6)
					end
				elseif arg_18_1.deadInfo[iter_18_0] and arg_18_1.deadInfo[iter_18_0] <= -200000000 then
					arg_18_1.deadInfo[iter_18_0] = arg_18_0.hpInfo[iter_18_0].carHp % (arg_18_0.hpInfo[iter_18_0].carMaxHp / arg_18_0.data.bigGzNum)
					var_18_2 = CCSprite:create("res/ui/battle/gemEffect/gemEffect.png")

					local var_18_7 = CCSprite:create("res/ui/battle/gemEffect/baoji.png")

					var_18_7:setPosition(ccp(var_18_2:getContentSize().width / 2, var_18_2:getContentSize().height / 2))
					var_18_2:addChild(var_18_7)
				elseif arg_18_1.deadInfo[iter_18_0] and arg_18_1.deadInfo[iter_18_0] == -100000000 then
					arg_18_1.deadInfo[iter_18_0] = arg_18_0.hpInfo[iter_18_0].carHp % (arg_18_0.hpInfo[iter_18_0].carMaxHp / arg_18_0.data.bigGzNum)
					var_18_2 = CCSprite:create("res/ui/battle/gemEffect/gemEffect.png")

					local var_18_8 = CCSprite:create("res/ui/battle/gemEffect/zhansha.png")

					var_18_8:setPosition(ccp(var_18_2:getContentSize().width / 2, var_18_2:getContentSize().height / 2))
					var_18_2:addChild(var_18_8)
				else
					local var_18_9 = CCLabelAtlas:create(string.format("%s", arg_18_1.deadInfo[iter_18_0]), "res/ui/common/number/blood_ded_numb.png", 17, 22, 48)

					var_18_9:setAnchorPoint(ccp(0.5, 0.5))

					local var_18_10 = CCSprite:createWithSpriteFrameName("blood_ded_subt.png")
					local var_18_11 = CCSprite:create("res/ui/battle/gemEffect/zc_word_nj.png")

					var_18_2 = createRichNode({
						var_18_11,
						var_18_10,
						var_18_9
					}, 0.5)
					var_18_3 = arg_18_1.deadInfo[iter_18_0]
				end
			elseif arg_18_1.deadInfo[iter_18_0] == -100000000 then
				arg_18_1.deadInfo[iter_18_0] = arg_18_0.hpInfo[iter_18_0].hp
				var_18_2 = CCSprite:create("res/ui/battle/gemEffect/gemEffect.png")

				local var_18_12 = CCSprite:create("res/ui/battle/gemEffect/zhansha.png")

				var_18_12:setPosition(ccp(var_18_2:getContentSize().width / 2, var_18_2:getContentSize().height / 2))
				var_18_2:addChild(var_18_12)
			elseif arg_18_1.deadInfo[iter_18_0] == -1 or arg_18_1.deadInfo[iter_18_0] == nil then
				var_18_2 = CCSprite:create("res/ui/battle/caoren/caoren_word_gedang_bg.png")

				local var_18_13 = CCSprite:create("res/ui/battle/caoren/caoren_word_gedang.png")

				var_18_13:setPosition(ccp(var_18_2:getContentSize().width / 2, var_18_2:getContentSize().height / 2))
				var_18_2:addChild(var_18_13)

				if arg_18_0.data.defense and arg_18_0.data.defense > 0 then
					arg_18_0.data.defense = arg_18_0.data.defense - 1

					if arg_18_0.data.defense <= 0 then
						arg_18_0:deleteShield()
					end
				end

				if arg_18_1.deadInfo[iter_18_0] == -1 or arg_18_1.deadInfo[iter_18_0] == nil then
					arg_18_1.deadInfo[iter_18_0] = 0
				end
			elseif arg_18_1.deadInfo[iter_18_0] == -2 then
				if arg_18_0.data and arg_18_0.data.zfShield > 0 then
					arg_18_0.data.zfShield = 0
				end

				arg_18_0:deleteZfShield()
			elseif arg_18_1.deadInfo[iter_18_0] and arg_18_1.deadInfo[iter_18_0] <= -200000000 then
				arg_18_1.deadInfo[iter_18_0] = 0 - arg_18_1.deadInfo[iter_18_0] - 200000000
				var_18_2 = CCSprite:create("res/ui/battle/gemEffect/numberBg.png")

				local var_18_14 = CCLabelAtlas:create(string.format("%s", arg_18_1.deadInfo[iter_18_0]), "res/ui/common/number/battle_Bj_numb.png", 34, 52, 48)

				var_18_14:setAnchorPoint(ccp(0.5, 0.5))
				var_18_14:setPosition(ccp(79, 29))
				var_18_2:addChild(var_18_14)

				local var_18_15 = CCLabelAtlas:create(string.format("%s", ":"), "res/ui/common/number/battle_Bj_numb.png", 34, 52, 48)

				var_18_15:setPosition(ccp(79 - var_18_14:getContentSize().width / 2 - 30, 0))
				var_18_2:addChild(var_18_15)
			elseif arg_18_1.deadInfo[iter_18_0] == 0 and arg_18_0.data.troopType == 47 then
				var_18_2 = CCSprite:create("res/ui/battle/zglShanBi/shanbi_bg.png")

				local var_18_16 = CCSprite:create("res/ui/battle/zglShanBi/shanbi.png")

				var_18_16:setPosition(ccp(var_18_2:getContentSize().width / 2, var_18_2:getContentSize().height / 2))
				var_18_2:addChild(var_18_16)
			elseif arg_18_2 and arg_18_2 > 0 then
				var_18_2 = CCSprite:create("res/ui/battle/gemEffect/gemEffect.png")

				local var_18_17 = CCSprite:create("res/ui/battle/gemEffect/luanwu.png")

				var_18_17:setPosition(ccp(var_18_2:getContentSize().width / 2, var_18_2:getContentSize().height / 2))
				var_18_2:addChild(var_18_17)
			elseif arg_18_3 and arg_18_3 == loseTroopType.fire then
				local var_18_18 = CCSprite:create("res/ui/common/symbol/fire.png")
				local var_18_19 = CCLabelAtlas:create(string.format("%s", arg_18_1.deadInfo[iter_18_0]), "res/ui/common/number/blood_ded_numb.png", 17, 22, 48)

				var_18_19:setAnchorPoint(ccp(0.5, 0.5))

				local var_18_20 = CCSprite:createWithSpriteFrameName("blood_ded_subt.png")

				var_18_2 = createRichNode({
					var_18_18,
					var_18_20,
					var_18_19
				}, 0.5)
				var_18_3 = arg_18_1.deadInfo[iter_18_0]
			else
				local var_18_21 = CCLabelAtlas:create(string.format("%s", arg_18_1.deadInfo[iter_18_0]), "res/ui/common/number/blood_ded_numb.png", 17, 22, 48)

				var_18_21:setAnchorPoint(ccp(0.5, 0.5))

				local var_18_22 = CCSprite:createWithSpriteFrameName("blood_ded_subt.png")

				var_18_2 = createRichNode({
					var_18_22,
					var_18_21
				}, 0.5)
				var_18_3 = arg_18_1.deadInfo[iter_18_0]
			end

			if arg_18_0.data and var_18_3 > 0 then
				local var_18_23 = arg_18_0:resistPercentageAnim(var_18_3, arg_18_0.data.resistPercentage)

				if var_18_23 then
					var_18_23:setPosition(ccp(0, 30))
					var_18_2:addChild(var_18_23)
				end
			end

			local var_18_24, var_18_25 = tool.getPositionInScreen(iter_18_1)

			arg_18_0.battleControl.showEffect(effectType.lostHp, var_18_2, ccp(var_18_24, var_18_25))

			if arg_18_0.data.hasCar or arg_18_0.data.carShiled then
				if arg_18_0.hpInfo[iter_18_0].shield > 0 then
					if arg_18_0.hpInfo[iter_18_0].shield - arg_18_1.deadInfo[iter_18_0] > 0 then
						arg_18_0.hpInfo[iter_18_0].shield = arg_18_0.hpInfo[iter_18_0].shield - arg_18_1.deadInfo[iter_18_0]
					else
						arg_18_0.hpInfo[iter_18_0].carHp = arg_18_0.hpInfo[iter_18_0].carHp - arg_18_1.deadInfo[iter_18_0] + arg_18_0.hpInfo[iter_18_0].shield
						arg_18_0.hpInfo[iter_18_0].shield = 0

						arg_18_0:deleteShield()

						if arg_18_0.hpInfo[iter_18_0].carHp <= 0 then
							arg_18_0.hpInfo[iter_18_0].carHp = 0
							var_18_0 = false
							var_18_1 = false
						end
					end
				else
					if arg_18_1.deadInfo[iter_18_0] then
						arg_18_0.hpInfo[iter_18_0].carHp = arg_18_0.hpInfo[iter_18_0].carHp - arg_18_1.deadInfo[iter_18_0]
					end

					if arg_18_0.hpInfo[iter_18_0].carHp <= 0 then
						if arg_18_0.data.carShiled then
							arg_18_0:deleteShield()
						end

						arg_18_0.hpInfo[iter_18_0].carHp = 0
						var_18_0 = false
						var_18_1 = false
					end
				end
			elseif arg_18_0.hpInfo[iter_18_0].shield > 0 then
				if arg_18_0.hpInfo[iter_18_0].shield - arg_18_1.deadInfo[iter_18_0] > 0 then
					arg_18_0.hpInfo[iter_18_0].shield = arg_18_0.hpInfo[iter_18_0].shield - arg_18_1.deadInfo[iter_18_0]
				else
					arg_18_0.hpInfo[iter_18_0].hp = arg_18_0.hpInfo[iter_18_0].hp - arg_18_1.deadInfo[iter_18_0] + arg_18_0.hpInfo[iter_18_0].shield
					arg_18_0.hpInfo[iter_18_0].shield = 0

					arg_18_0:deleteShield()

					if arg_18_0.hpInfo[iter_18_0].hp < 0 then
						arg_18_0.hpInfo[iter_18_0].hp = 0
					end
				end
			else
				if arg_18_1.deadInfo[iter_18_0] then
					arg_18_0.hpInfo[iter_18_0].hp = arg_18_0.hpInfo[iter_18_0].hp - arg_18_1.deadInfo[iter_18_0]
				end

				if arg_18_0.hpInfo[iter_18_0].hp < 0 then
					arg_18_0.hpInfo[iter_18_0].hp = 0
				end
			end

			arg_18_0:updataHp()
		end
	end

	if arg_18_0.data.hasCar ~= var_18_0 then
		arg_18_0.data.hasCar = var_18_0
	end

	if arg_18_0.data.carShiled ~= var_18_1 then
		arg_18_0.data.carShiled = var_18_1
	end

	if not arg_18_0.data.hasCar then
		arg_18_0.animArrays, arg_18_0.animBatchImage = rmgr.getArmy(arg_18_0.data.side, arg_18_0.data.troopType)
	end

	arg_18_0:updataHp()
end

function Army.resistPercentageAnim(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0

	if arg_19_2 and arg_19_2 > 0 and arg_19_2 < 1 and arg_19_1 and arg_19_1 > 0 then
		local var_19_1 = CCSprite:create("res/ui/battle/resist/zz_battle_number_b01.png")
		local var_19_2 = CCSprite:create("res/ui/battle/resist/zz_battle_word_js.png")
		local var_19_3 = math.ceil(arg_19_1 / (1 - arg_19_2) * arg_19_2)
		local var_19_4 = CCLabelAtlas:create(string.format("%s", var_19_3), "res/ui/battle/resist/zz_battle_number.png", 20, 26, 48)

		var_19_4:setAnchorPoint(ccp(0.5, 0.5))

		local var_19_5 = CCSprite:create("res/ui/battle/resist/zz_battle_number_b02.png")

		var_19_0 = createRichNode({
			var_19_2,
			var_19_1,
			var_19_4,
			var_19_5
		}, 0.5)
	end

	return var_19_0
end

function Army.destory(arg_20_0, arg_20_1, arg_20_2)
	if arg_20_2 then
		arg_20_2(arg_20_0.data.side, arg_20_0.data.row)
	end

	arg_20_1:removeChild(arg_20_0, true)

	arg_20_0.armySpriteRecord = {}
end

function Army.win(arg_21_0, arg_21_1)
	arg_21_0:playerAnimation("win", arg_21_1)
end

function Army.hitted(arg_22_0, arg_22_1)
	arg_22_0:playerAnimation("hitted", arg_22_1)
end

function Army.showRewardIcon(arg_23_0, arg_23_1)
	local var_23_0

	if arg_23_1 == BATTLE_RES_SILVER then
		var_23_0 = "icon_silver.png"
	elseif arg_23_1 == BATTLE_RES_FOOD then
		var_23_0 = "icon_food.png"
	elseif arg_23_1 == BATTLE_RES_EXP then
		var_23_0 = "icon_exp.png"
	elseif arg_23_1 == BATTLE_RES_FERRUM then
		var_23_0 = "icon_iron.png"
	elseif arg_23_1 == BATTLE_RES_DOUBLE_TICKET then
		var_23_0 = "icon_ticket.png"
	elseif arg_23_1 == BATTLE_RES_MOONCAKE then
		var_23_0 = "icon_mooncake.png"
	elseif arg_23_1 == BATTLE_RES_BOMB then
		var_23_0 = "icon_bomb.png"
	elseif arg_23_1 == BATTLE_RES_XMAS_BOX then
		var_23_0 = "icon_xmas_box.png"
	elseif arg_23_1 == BATTLE_RES_XMAS_BALL then
		var_23_0 = "icon_xmas_ball.png"
	elseif arg_23_1 == BATTLE_RES_XMAS_SNOW then
		var_23_0 = "icon_xmas_snow.png"
	elseif arg_23_1 == BATTLE_RES_CRACKER then
		if conf.language == "tha" then
			var_23_0 = "icon_shuiqiang.png"
		else
			var_23_0 = "icon_cracker.png"
		end
	elseif arg_23_1 == BATTLE_RES_STONE then
		var_23_0 = "icon_stone.png"
	elseif arg_23_1 == BATTLE_RES_REDBAG then
		var_23_0 = "icon_hb.png"
	elseif arg_23_1 == BATTLE_RES_IRONTICKET then
		var_23_0 = "icon_iron_ticket.png"
	end

	if var_23_0 then
		for iter_23_0, iter_23_1 in pairs(arg_23_0.nodes) do
			if iter_23_1 then
				local var_23_1 = CCSprite:createWithSpriteFrameName("idio_soldi_view.png")
				local var_23_2 = CCSprite:createWithSpriteFrameName(var_23_0)

				var_23_2:setPosition(ccp(var_23_1:getContentSize().width * 0.5, var_23_1:getContentSize().height * 0.6))
				var_23_1:addChild(var_23_2)
				var_23_1:setScale(0.5)
				iter_23_1:addChild(var_23_1, armyZorder.resIcon)
			end
		end
	end
end

function Army.updataHp(arg_24_0)
	local var_24_0 = 0

	if arg_24_0.data.troopType == 56 then
		var_24_0 = arg_24_0.data.bsPro or 0
	end

	arg_24_0.hpController = arg_24_0.hpController or {}

	for iter_24_0, iter_24_1 in pairs(arg_24_0.nodes) do
		local var_24_1 = arg_24_0.hpInfo[iter_24_0].hp
		local var_24_2 = arg_24_0.hpInfo[iter_24_0].maxhp
		local var_24_3 = arg_24_0.hpInfo[iter_24_0].shield
		local var_24_4 = arg_24_0.hpInfo[iter_24_0].maxshield
		local var_24_5 = arg_24_0.hpInfo[iter_24_0].carHp
		local var_24_6 = arg_24_0.hpInfo[iter_24_0].carMaxHp
		local var_24_7 = arg_24_0.hpInfo[iter_24_0].hasCar

		if not arg_24_0.hpController[iter_24_0] then
			arg_24_0.hpController[iter_24_0] = createHpBar(arg_24_0.data, var_24_1, var_24_2, var_24_3, var_24_4, var_24_0, var_24_5, var_24_6, arg_24_0, arg_24_0.data.carShiled)

			arg_24_0.hpController[iter_24_0]:addToParent(iter_24_1, armyZorder.hp)
		else
			arg_24_0.hpController[iter_24_0]:updateHp(var_24_1, var_24_3, var_24_4, var_24_5, var_24_6)
		end

		if arg_24_0.data then
			arg_24_0.data.currentHp = var_24_1
			arg_24_0.data.currentShield = var_24_3
		end
	end
end

function Army.updataHp2(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4, arg_25_5, arg_25_6)
	local var_25_0 = 0

	if arg_25_0.data.troopType == 56 then
		var_25_0 = arg_25_0.data.bsPro or 0
	end

	arg_25_0.hpController = arg_25_0.hpController or {}

	for iter_25_0, iter_25_1 in pairs(arg_25_0.nodes) do
		arg_25_0.hpInfo[iter_25_0].hp = arg_25_1
		arg_25_0.hpInfo[iter_25_0].maxhp = arg_25_2
		arg_25_0.hpInfo[iter_25_0].shield = arg_25_3
		arg_25_0.hpInfo[iter_25_0].maxshield = arg_25_4
		arg_25_0.hpInfo[iter_25_0].carHp = arg_25_5
		arg_25_0.hpInfo[iter_25_0].carMaxHp = arg_25_6

		if not arg_25_0.hpController[iter_25_0] then
			arg_25_0.hpController[iter_25_0] = createHpBar(arg_25_0.data, arg_25_1, arg_25_2, arg_25_3, arg_25_4, var_25_0, arg_25_5, arg_25_6, arg_25_0)

			arg_25_0.hpController[iter_25_0]:addToParent(iter_25_1, armyZorder.hp)
		else
			arg_25_0.hpController[iter_25_0]:updateHp(arg_25_1, arg_25_3, arg_25_4, arg_25_5, arg_25_6)
		end

		if arg_25_0.data then
			arg_25_0.data.currentHp = arg_25_1
			arg_25_0.data.currentShield = arg_25_3
		end
	end
end

function Army.updataCarShiled(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = 0

	if arg_26_0.data.troopType == 56 then
		var_26_0 = arg_26_0.data.bsPro or 0
	end

	arg_26_0.shieldType = 2
	arg_26_0.hpController = arg_26_0.hpController or {}

	for iter_26_0, iter_26_1 in pairs(arg_26_0.nodes) do
		arg_26_0.hpInfo[iter_26_0].shield = arg_26_1
		arg_26_0.hpInfo[iter_26_0].maxshield = arg_26_2

		if not arg_26_0.hpController[iter_26_0] then
			arg_26_0.hpController[iter_26_0] = createHpBar(arg_26_0.data, arg_26_0.hpInfo[iter_26_0].hp, arg_26_0.hpInfo[iter_26_0].maxhp, arg_26_1, arg_26_2, var_26_0, arg_26_0.hpInfo[iter_26_0].carHp, arg_26_0.hpInfo[iter_26_0].carMaxHp, arg_26_0)

			arg_26_0.hpController[iter_26_0]:addToParent(iter_26_1, armyZorder.hp)
			arg_26_0:addShield({
				x = 0,
				y = 0
			}, nil, nil, arg_26_0.shieldType, arg_26_0.data.side)
		else
			arg_26_0.hpController[iter_26_0]:updateHp(arg_26_0.hpInfo[iter_26_0].hp, arg_26_1, arg_26_2, carHp, carMaxHp)
		end

		if arg_26_0.data then
			arg_26_0.data.currentHp = arg_26_0.hpInfo[iter_26_0].hp
			arg_26_0.data.currentShield = arg_26_0.hpInfo[iter_26_0].shield
		end
	end
end

function Army.updataJxShiled(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	local var_27_0 = 0

	if arg_27_0.data.troopType == 56 then
		var_27_0 = arg_27_0.data.bsPro or 0
	end

	arg_27_0.shieldType = 3
	arg_27_0.data.carShiled = true
	arg_27_0.data.bigGzNum = arg_27_3
	arg_27_0.hpController = arg_27_0.hpController or {}

	for iter_27_0, iter_27_1 in pairs(arg_27_0.nodes) do
		local var_27_1 = arg_27_0.hpInfo[iter_27_0].hp
		local var_27_2 = arg_27_0.hpInfo[iter_27_0].maxhp
		local var_27_3 = arg_27_0.hpInfo[iter_27_0].shield
		local var_27_4 = arg_27_0.hpInfo[iter_27_0].maxshield

		arg_27_0.hpInfo[iter_27_0].carHp = arg_27_1
		arg_27_0.hpInfo[iter_27_0].carMaxHp = arg_27_2

		if not arg_27_0.hpController[iter_27_0] then
			arg_27_0.hpController[iter_27_0] = createHpBar(arg_27_0.data, var_27_1, var_27_2, var_27_3, var_27_4, var_27_0, arg_27_1, arg_27_2, arg_27_0, arg_27_0.data.carShiled)

			arg_27_0.hpController[iter_27_0]:addToParent(iter_27_1, armyZorder.hp)
			arg_27_0:addShield({
				x = 0,
				y = 0
			}, nil, nil, arg_27_0.shieldType, arg_27_0.data.side)
		else
			arg_27_0.hpController[iter_27_0]:updateHp(var_27_1, var_27_3, var_27_4)
		end

		if arg_27_0.data then
			arg_27_0.data.currentHp = var_27_1
			arg_27_0.data.currentShield = var_27_3
		end
	end
end

function Army.parseHp(arg_28_0, arg_28_1)
	local var_28_0 = stringSplit(arg_28_1, ",")

	if table.getn(var_28_0) ~= 3 then
		return
	end

	arg_28_0.hpInfo = {}
	arg_28_0.needShield = false

	for iter_28_0, iter_28_1 in pairs(var_28_0) do
		local var_28_1 = stringSplit(iter_28_1, "*")
		local var_28_2 = tonumber(var_28_1[1])
		local var_28_3 = tonumber(var_28_1[2])
		local var_28_4 = tonumber(var_28_1[3])
		local var_28_5 = tonumber(var_28_1[4])
		local var_28_6 = tonumber(var_28_1[5])
		local var_28_7 = tonumber(var_28_1[6])
		local var_28_8 = tonumber(var_28_1[7])

		if iter_28_0 == 1 then
			arg_28_0.data.huangyyState = 0

			if arg_28_0.data.troopType == 56 and arg_28_0.data.bsPro then
				if var_28_2 >= arg_28_0.data.bsPro * var_28_3 then
					arg_28_0.data.huangyyState = 1
				else
					arg_28_0.data.huangyyState = 2
				end
			end

			if arg_28_0.data.carId and arg_28_0.data.carId > 0 then
				if arg_28_0.data.carId == 999 then
					arg_28_0.data.carShiled = true
				else
					arg_28_0.data.hasCar = var_28_6 > 0
				end
			else
				arg_28_0.data.hasCar = false
			end
		end

		arg_28_0.shieldType = var_28_8

		if arg_28_0.data.carShiled then
			arg_28_0.shieldType = 3
		end

		if arg_28_0.data.currentHp and arg_28_0.data.currentShield then
			arg_28_0.hpInfo[iter_28_0] = {
				hp = arg_28_0.data.currentHp,
				maxhp = var_28_3,
				shield = arg_28_0.data.currentShield,
				maxshield = var_28_5,
				carHp = var_28_6,
				carMaxHp = var_28_7,
				hasCar = arg_28_0.data.hasCar,
				carShiled = arg_28_0.data.carShiled
			}
		else
			arg_28_0.hpInfo[iter_28_0] = {
				hp = var_28_2,
				maxhp = var_28_3,
				shield = var_28_4,
				maxshield = var_28_5,
				carHp = var_28_6,
				carMaxHp = var_28_7,
				hasCar = arg_28_0.data.hasCar,
				carShiled = arg_28_0.data.carShiled
			}
		end

		if var_28_4 > 0 or arg_28_0.data.carShiled then
			arg_28_0.needShield = true
		end
	end
end

function Army.showShadow(arg_29_0)
	if tonumber(arg_29_0.data.troopType) >= 22 then
		return
	end

	local var_29_0
	local var_29_1

	if arg_29_0.data.troopSerial == 5 or arg_29_0.data.troopSerial == 7 then
		-- block empty
	elseif arg_29_0.data.troopSerial == 6 then
		-- block empty
	elseif arg_29_0.data.troopSerial == 8 then
		-- block empty
	elseif arg_29_0.data.troopSerial == 9 then
		-- block empty
	end

	if var_29_0 then
		for iter_29_0, iter_29_1 in pairs(arg_29_0.nodes) do
			if iter_29_1 then
				local var_29_2 = CCSprite:createWithSpriteFrameName(var_29_0)

				var_29_2:setPosition(var_29_1)
				iter_29_1:addChild(var_29_2, armyZorder.shadow)
			end
		end
	end
end

function Army.showBuff(arg_30_0, arg_30_1, arg_30_2)
	for iter_30_0, iter_30_1 in pairs(arg_30_0.nodes) do
		if iter_30_1 then
			if arg_30_1 == "slope_fire" then
				if iter_30_1:getChildByTag(ARMY_TAG_SLOPE) then
					iter_30_1:removeChildByTag(ARMY_TAG_SLOPE, true)
				end
			elseif arg_30_1 == "explodeEffect" then
				if iter_30_1:getChildByTag(ARMY_TAG_EXPLODE) then
					iter_30_1:removeChildByTag(ARMY_TAG_EXPLODE, true)
				end
			elseif arg_30_1 == "thunder" then
				if iter_30_1:getChildByTag(ARMY_TAG_EVOKE) then
					iter_30_1:removeChildByTag(ARMY_TAG_EVOKE, true)
				end
			elseif iter_30_1:getChildByTag(ARMY_TAG_BUFF) then
				iter_30_1:removeChildByTag(ARMY_TAG_BUFF, true)
			end

			if arg_30_1 ~= "slope_fire" or not arg_30_2.remove then
				local var_30_0 = rmgr.getAnimation(arg_30_1)

				if var_30_0 then
					local var_30_1

					if arg_30_2 and arg_30_2.interval then
						var_30_1 = CCAnimation:createWithSpriteFrames(var_30_0, arg_30_2.interval)
					else
						var_30_1 = CCAnimation:createWithSpriteFrames(var_30_0, 0.08)
					end

					local var_30_2 = CCAnimate:create(var_30_1)
					local var_30_3 = CCRepeatForever:create(var_30_2)
					local var_30_4 = CCSprite:create()

					if arg_30_1 == "explodeEffect" then
						var_30_4:runAction(var_30_2)
					else
						var_30_4:runAction(var_30_3)
					end

					if arg_30_2 and arg_30_2.x and arg_30_2.y then
						var_30_4:setPosition(ccp(arg_30_2.x, arg_30_2.y))
					end

					if arg_30_2 and arg_30_2.scale then
						var_30_4:setScale(arg_30_2.scale)
					end

					if arg_30_2 and arg_30_2.angle then
						var_30_4:setRotation(arg_30_2.angle)
					end

					if arg_30_1 == "slope_fire" then
						iter_30_1:addChild(var_30_4, armyZorder.slope, ARMY_TAG_SLOPE)

						local var_30_5 = CCArray:create()

						var_30_5:addObject(CCDelayTime:create(arg_30_2.time / 1000))
						var_30_5:addObject(CCCallFuncN:create(function()
							var_30_4:removeFromParentAndCleanup(true)
						end))
						var_30_4:runAction(CCSequence:create(var_30_5))
					elseif arg_30_1 == "explodeEffect" then
						iter_30_1:addChild(var_30_4, armyZorder.explode, ARMY_TAG_EXPLODE)
					elseif arg_30_1 == "thunder" then
						iter_30_1:addChild(var_30_4, armyZorder.evoke, ARMY_TAG_EVOKE)
					else
						iter_30_1:addChild(var_30_4, armyZorder.buff, ARMY_TAG_BUFF)
					end
				end
			end
		end
	end
end

function Army.addJTZlight(arg_32_0, arg_32_1)
	for iter_32_0, iter_32_1 in pairs(arg_32_0.nodes) do
		if iter_32_1 and iter_32_1:getChildByTag(ARMY_TAG_JTZ_LIGHT) == nil then
			local var_32_0 = rmgr.getAnimation("jtzLight")

			if var_32_0 then
				local var_32_1 = CCAnimation:createWithSpriteFrames(var_32_0, 0.08)
				local var_32_2 = CCAnimate:create(var_32_1)
				local var_32_3 = CCRepeatForever:create(var_32_2)
				local var_32_4 = CCSprite:create()

				var_32_4:runAction(var_32_3)

				if arg_32_1 and arg_32_1.x and arg_32_1.y then
					var_32_4:setPosition(ccp(arg_32_1.x, arg_32_1.y))
				end

				if arg_32_1 and arg_32_1.scale then
					var_32_4:setScale(arg_32_1.scale)
				end

				if arg_32_1 and arg_32_1.angle then
					var_32_4:setRotation(arg_32_1.angle)
				end

				iter_32_1:addChild(var_32_4, armyZorder.jtzLight, ARMY_TAG_JTZ_LIGHT)
			end
		end
	end
end

function Army.addShield(arg_33_0, arg_33_1, arg_33_2, arg_33_3, arg_33_4, arg_33_5)
	for iter_33_0, iter_33_1 in pairs(arg_33_0.nodes) do
		if arg_33_2 then
			arg_33_0.hpInfo[iter_33_0].shield = arg_33_2
		end

		if arg_33_3 then
			arg_33_0.hpInfo[iter_33_0].maxshield = arg_33_3
		end

		if arg_33_2 and arg_33_3 then
			arg_33_0:updataHp()
		end

		if iter_33_1 and iter_33_1:getChildByTag(ARMY_TAG_SHIELD) == nil then
			local var_33_0

			if arg_33_4 and arg_33_4 == 2 or arg_33_4 == 3 then
				var_33_0 = rmgr.getAnimation(arg_33_5 .. "_carShiled")
			else
				var_33_0 = rmgr.getAnimation("haolingtianxiaBuff")
			end

			if var_33_0 then
				local var_33_1 = CCAnimation:createWithSpriteFrames(var_33_0, 0.08)
				local var_33_2 = CCAnimate:create(var_33_1)
				local var_33_3 = CCRepeatForever:create(var_33_2)
				local var_33_4 = CCSprite:create()

				var_33_4:runAction(var_33_3)

				if arg_33_1 and arg_33_1.x and arg_33_1.y then
					var_33_4:setPosition(ccp(arg_33_1.x, arg_33_1.y))
				end

				if arg_33_1 and arg_33_1.scale then
					var_33_4:setScale(arg_33_1.scale)
				end

				if arg_33_1 and arg_33_1.angle then
					var_33_4:setRotation(arg_33_1.angle)
				end

				iter_33_1:addChild(var_33_4, armyZorder.shield, ARMY_TAG_SHIELD)
			end
		end
	end
end

function Army.deleteShield(arg_34_0)
	for iter_34_0, iter_34_1 in pairs(arg_34_0.nodes) do
		if iter_34_1 and iter_34_1:getChildByTag(ARMY_TAG_SHIELD) then
			iter_34_1:removeChildByTag(ARMY_TAG_SHIELD, true)
		end
	end
end

function Army.addZfShield(arg_35_0, arg_35_1, arg_35_2)
	for iter_35_0, iter_35_1 in pairs(arg_35_0.nodes) do
		if iter_35_1 and iter_35_1:getChildByTag(ARMY_TAG_ZFSHIELD) == nil then
			local var_35_0 = rmgr.getAnimation("zfShield_" .. arg_35_2)

			if var_35_0 then
				local var_35_1 = CCAnimation:createWithSpriteFrames(var_35_0, 0.08)
				local var_35_2 = CCAnimate:create(var_35_1)
				local var_35_3 = CCRepeatForever:create(var_35_2)
				local var_35_4 = CCSprite:create()

				var_35_4:runAction(var_35_3)

				if arg_35_1 and arg_35_1.x and arg_35_1.y then
					var_35_4:setPosition(ccp(arg_35_1.x, arg_35_1.y))
				end

				if arg_35_1 and arg_35_1.scale then
					var_35_4:setScale(arg_35_1.scale)
				end

				if arg_35_1 and arg_35_1.angle then
					var_35_4:setRotation(arg_35_1.angle)
				end

				iter_35_1:addChild(var_35_4, armyZorder["zfShield_" .. arg_35_2], ARMY_TAG_ZFSHIELD)
			end
		end
	end
end

function Army.deleteZfShield(arg_36_0)
	for iter_36_0, iter_36_1 in pairs(arg_36_0.nodes) do
		if iter_36_1 and iter_36_1:getChildByTag(ARMY_TAG_ZFSHIELD) then
			iter_36_1:removeChildByTag(ARMY_TAG_ZFSHIELD, true)
		end
	end
end

function Army.showZhurongHurt(arg_37_0)
	for iter_37_0, iter_37_1 in pairs(arg_37_0.nodes) do
		local var_37_0 = rmgr.getAnimation("zhurong_hurt")

		if var_37_0 then
			local var_37_1 = CCAnimation:createWithSpriteFrames(var_37_0, 0.05)
			local var_37_2 = CCAnimate:create(var_37_1)
			local var_37_3 = CCSprite:create()

			var_37_3:setScale(0.7)
			iter_37_1:addChild(var_37_3, armyZorder.shadow)

			local var_37_4 = CCArray:create()

			var_37_4:addObject(CCRepeat:create(var_37_2, 1))
			var_37_4:addObject(CCCallFuncN:create(function()
				var_37_3:removeFromParentAndCleanup(true)
			end))
			var_37_3:runAction(CCSequence:create(var_37_4))
		end
	end
end

function Army.showPhantom(arg_39_0, arg_39_1)
	for iter_39_0, iter_39_1 in pairs(arg_39_0.nodes) do
		local var_39_0

		if arg_39_1.specialPhantom == BATTLE_PHANTOM_TUJI then
			var_39_0 = CCSprite:createWithSpriteFrameName("tshy_icon_tu.png")
		elseif arg_39_1.specialPhantom == BATTLE_PHANTOM_DANTIAO then
			var_39_0 = CCSprite:createWithSpriteFrameName("tshy_icon_tiao.png")
		elseif arg_39_1.specialPhantom == BATTLE_PHANTOM_HUBAOQI then
			var_39_0 = CCSprite:createWithSpriteFrameName("tshy_icon_hu.png")
		elseif arg_39_1.specialPhantom == BATTLE_PHANTOM_JULI then
			var_39_0 = CCSprite:createWithSpriteFrameName("tshy_icon_ju.png")
		elseif arg_39_1.specialPhantom == BATTLE_PHANTOM_XIANZHENG then
			var_39_0 = CCSprite:createWithSpriteFrameName("tshy_icon_xian.png")

			local var_39_1 = CCSprite:create("res/ui/battle/specialPhantom/xzy_xing_bg.png")

			var_39_1:setScale(0.8)
			var_39_0:addChild(var_39_1)
			var_39_1:setPosition(ccp(23, -5))

			local var_39_2 = arg_39_1.xianzhengNum or 0

			for iter_39_2 = 1, 4 do
				local var_39_3

				if iter_39_2 <= var_39_2 then
					var_39_3 = CCSprite:create("res/ui/weapon/xing.png")
				else
					var_39_3 = CCSprite:create("res/ui/weapon/xing_dark.png")
				end

				var_39_3:setScale(0.8)
				var_39_3:setPosition(ccp(iter_39_2 * 30, 16))
				var_39_1:addChild(var_39_3)
			end
		end

		if var_39_0 then
			var_39_0:setScale(0.7)
			var_39_0:setPosition(ccp(-60, 20))
			iter_39_1:addChild(var_39_0, armyZorder.phantom)
		end
	end
end

function Army.create(arg_40_0, arg_40_1)
	local var_40_0 = Army.new()

	var_40_0.battleControl = arg_40_0
	var_40_0.data = arg_40_1
	var_40_0.armySpriteRecord = {}

	if var_40_0.data then
		var_40_0:parseHp(arg_40_1.hpList)

		var_40_0.nodes = {}

		if var_40_0.data.isMain then
			if var_40_0.data.isMain == 1 then
				var_40_0.animMainArrays, var_40_0.animMainBatchImage = rmgr.getArmy(var_40_0.data.side, 40)
			elseif var_40_0.data.isMain == 2 then
				var_40_0.animMainArrays, var_40_0.animMainBatchImage = rmgr.getArmy(var_40_0.data.side, 40, "_2")
			end
		end

		if var_40_0.data.zfShield and var_40_0.data.zfShield > 0 then
			var_40_0.animMainArrays, var_40_0.animMainBatchImage = rmgr.getArmy(var_40_0.data.side, 40, "_2")
		end

		var_40_0.animArrays, var_40_0.animBatchImage = rmgr.getArmy(var_40_0.data.side, var_40_0.data.troopType)

		if var_40_0.data.troopType == 48 then
			var_40_0.animArrays, var_40_0.animBatchImage = rmgr.getArmy(var_40_0.data.side, var_40_0.data.troopType, "_shield")
		end

		if var_40_0.data.carId > 0 and var_40_0.data.hasCar then
			var_40_0.animArrays, var_40_0.animBatchImage = rmgr.getArmy(var_40_0.data.side, var_40_0.data.carId, "_car")
		end

		if var_40_0.data.attack ~= nil then
			var_40_0:showAttack(var_40_0.data.attack)
		end

		local var_40_1 = CCNode:create()

		var_40_0:addChild(var_40_1, 0, ARMY_TAG_CENTER)

		var_40_0.nodes[ARMY_TAG_CENTER] = var_40_1

		local var_40_2 = -0.6
		local var_40_3 = 100
		local var_40_4 = CCNode:create()

		var_40_4:setPosition(ccp(-var_40_3, var_40_2 * -var_40_3))
		var_40_0:addChild(var_40_4, -1, ARMY_TAG_RIGHT)

		var_40_0.nodes[ARMY_TAG_RIGHT] = var_40_4

		local var_40_5 = CCNode:create()

		var_40_5:setPosition(ccp(var_40_3, var_40_2 * var_40_3))
		var_40_0:addChild(var_40_5, 1, ARMY_TAG_LEFT)

		var_40_0.nodes[ARMY_TAG_LEFT] = var_40_5

		var_40_0:playerAnimation("idle")

		if var_40_0.data.resType ~= 0 then
			var_40_0:showRewardIcon(var_40_0.data.resType)
		end

		if var_40_0.data.playerId == -1 and var_40_0.data.row == 0 then
			var_40_0:showTactics(2, var_40_0.data.tacticsId)
		end

		var_40_0:showShadow()

		if var_40_0.data.teamEffect == 3 then
			var_40_0:showBuff("buffWusheng", {
				x = 7,
				y = 15
			})
		end

		if var_40_0.data.isJuexing and var_40_0.data.isJuexing == 1 then
			if var_40_0.data.troopType == 43 and var_40_0.data.side == "def" then
				var_40_0:showBuff("thunder", {
					interval = 0.04,
					scale = 1,
					x = -35,
					y = -13
				})
			elseif var_40_0.data.troopType == 43 and var_40_0.data.side == "att" then
				var_40_0:showBuff("thunder", {
					interval = 0.04,
					scale = 1,
					x = 0,
					y = -10
				})
			elseif var_40_0.data.troopType == 58 and var_40_0.data.side == "def" then
				var_40_0:showBuff("thunder", {
					interval = 0.04,
					scale = 1,
					x = 35,
					y = 24
				})
			else
				var_40_0:showBuff("thunder", {
					interval = 0.04,
					scale = 0.7,
					x = 0,
					y = -10
				})
			end
		end

		if var_40_0.data.isChongfeng and var_40_0.data.isChongfeng > 0 then
			if var_40_0.data.side == "att" then
				var_40_0:showBuff("slope_fire", {
					scale = 0.7,
					x = -30,
					y = -25,
					time = var_40_0.data.isChongfeng
				})
			else
				var_40_0:showBuff("slope_fire", {
					scale = 0.7,
					angle = 180,
					y = -5,
					x = 30,
					time = var_40_0.data.isChongfeng
				})
			end
		end

		if var_40_0.data.specialPhantom and var_40_0.data.specialPhantom ~= 0 then
			var_40_0:showPhantom(var_40_0.data)
		end

		if var_40_0.needShield then
			if var_40_0.shieldType and var_40_0.shieldType == 2 or var_40_0.shieldType == 3 then
				var_40_0:addShield({
					x = 0,
					y = 0
				}, nil, nil, var_40_0.shieldType, var_40_0.data.side)
			else
				var_40_0:addShield({
					x = 0,
					y = 0
				})
			end
		end

		if var_40_0.data.defense and var_40_0.data.defense > 0 then
			var_40_0:addShield({
				x = 0,
				y = 0
			})
		end

		if var_40_0.data.jueEquip and var_40_0.data.jueEquip > 0 then
			if var_40_0.data.troopType == 43 and var_40_0.data.side == "def" then
				var_40_0:addJTZlight({
					scale = 0.9,
					x = -5,
					y = -45
				})
			elseif var_40_0.data.troopType == 58 and var_40_0.data.side == "def" then
				var_40_0:addJTZlight({
					scale = 0.9,
					x = 40,
					y = -30
				})
			elseif var_40_0.data.troopType == 43 and var_40_0.data.side == "att" then
				var_40_0:addJTZlight({
					scale = 0.9,
					x = 0,
					y = -40
				})
			elseif var_40_0.data.troopType == 35 and var_40_0.data.side == "def" then
				var_40_0:addJTZlight({
					scale = 0.8,
					x = 8,
					y = -20
				})
			elseif var_40_0.data.troopType == 35 and var_40_0.data.side == "att" then
				var_40_0:addJTZlight({
					scale = 0.8,
					x = -10,
					y = -30
				})
			elseif var_40_0.data.side == "def" then
				var_40_0:addJTZlight({
					scale = 0.7,
					x = 3,
					y = -29
				})
			elseif var_40_0.data.side == "att" then
				var_40_0:addJTZlight({
					scale = 0.7,
					x = 8,
					y = -29
				})
			end
		end

		if var_40_0.data.zfShield and var_40_0.data.zfShield > 0 then
			local var_40_6

			if var_40_0.data.side == "att" then
				var_40_6 = {
					x = 30,
					y = 20
				}
			else
				var_40_6 = {
					x = 0,
					y = 20
				}
			end

			var_40_0:addZfShield(var_40_6, var_40_0.data.side)
		end
	end

	var_40_0:setScale(1.4)

	return var_40_0
end
