local var_0_0 = {}
local var_0_1 = 270
local var_0_2 = 290
local var_0_3 = user.getFunc(91) and -50 or 0

var_0_0.position = {}
var_0_0.position[1] = ccp(var_0_1, var_0_2 + 60)
var_0_0.position[2] = ccp(var_0_1 + 174, var_0_2 + 55 + var_0_3)
var_0_0.position[3] = ccp(var_0_1 + 251, var_0_2 + 55 + var_0_3)
var_0_0.position[4] = ccp(var_0_1 + 174, var_0_2 - 21 + var_0_3)
var_0_0.position[5] = ccp(var_0_1 + 251, var_0_2 - 21 + var_0_3)
var_0_0.position[6] = ccp(var_0_1 + 95, var_0_2 - 130)
var_0_0.position[7] = ccp(var_0_1 - 100, var_0_2 + 230)
var_0_0.position[8] = ccp(var_0_1 + 40, var_0_2 + 230)
var_0_0.position[9] = ccp(var_0_1 + 180, var_0_2 + 230)
var_0_0.openskill = 1
var_0_0.skillup = 2
var_0_0.failure = 3
var_0_0.tempbuff = 4
var_0_0.att = 5
var_0_0.def = 6
var_0_0.hp = 7

function var_0_0.showAnimation(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5)
	local var_1_0 = var_0_0.getFrameAnimation("fireball")

	var_1_0:setScale(0.8)
	var_1_0:setRotation(90)

	local var_1_1 = var_0_0.getMoveAnimation(arg_1_1, var_1_0, arg_1_2, arg_1_5)

	var_1_1:addChild(var_1_0)
	var_1_1:setPosition(var_0_0.position[1])
	arg_1_0:addChild(var_1_1, 1500)

	if arg_1_4 == nil then
		arg_1_4 = 1
	end

	local var_1_2 = var_0_0.effectAnimation(arg_1_3, arg_1_4, 1.5 + arg_1_1 * 0.4, arg_1_0, arg_1_2)

	var_1_2:setPosition(var_0_0.position[arg_1_2])
	arg_1_0:addChild(var_1_2, 1500)
end

function var_0_0.getFrameAnimation(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = rmgr.getAnimation(arg_2_0)

	if var_2_0 then
		if arg_2_2 == nil then
			arg_2_2 = 0.04
		end

		local var_2_1 = CCAnimation:createWithSpriteFrames(var_2_0, arg_2_2)
		local var_2_2 = CCAnimate:create(var_2_1)
		local var_2_3

		if arg_2_1 then
			var_2_3 = CCRepeat:create(var_2_2, arg_2_1)
		else
			var_2_3 = CCRepeatForever:create(var_2_2)
		end

		local var_2_4 = CCSprite:create()

		var_2_4:runAction(var_2_3)

		return var_2_4
	end
end

function var_0_0.getMoveAnimation(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0 = 72

	if arg_3_3 == true then
		var_3_0 = 36
	end

	local var_3_1 = CCSprite:create()

	local function var_3_2()
		if arg_3_1 then
			arg_3_1:setVisible(false)
		end
	end

	local function var_3_3()
		if arg_3_1 then
			arg_3_1:setVisible(true)
		end
	end

	local function var_3_4()
		var_3_1:removeFromParentAndCleanup(true)
	end

	local var_3_5 = CCArray:create()

	var_3_5:addObject(CCMoveBy:create(0.5, ccp(math.sin(math.rad(arg_3_0 * var_3_0 - var_3_0)) * 100, math.cos(math.rad(arg_3_0 * var_3_0 - var_3_0)) * 100)))
	var_3_5:addObject(CCDelayTime:create(0.5 + arg_3_0 * 0.4))
	var_3_5:addObject(CCMoveTo:create(0.3, var_0_0.position[arg_3_2]))
	var_3_5:addObject(CCCallFuncN:create(var_3_4))

	local var_3_6 = CCSequence:create(var_3_5)

	var_3_1:runAction(var_3_6)

	return var_3_1
end

function var_0_0.effectAnimation(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
	if arg_7_1 == nil then
		arg_7_1 = 1
	end

	if arg_7_2 == nil then
		arg_7_2 = 3
	end

	local var_7_0
	local var_7_1

	if arg_7_0 == 1 then
		var_7_0 = CCSprite:create("res/ui/general/juexing/jx_tit_cg.png")

		var_7_0:setScale(0.5)

		var_7_1 = var_0_0.getFrameAnimation("chain", 1, 0.05)

		var_7_1:setPosition(var_0_0.position[arg_7_4])

		if arg_7_4 ~= 6 then
			var_7_1:setScale(0.8)
		end
	elseif arg_7_0 == 2 then
		var_7_0 = CCSprite:create("res/ui/general/juexing/jx_tit_cg.png")

		var_7_0:setScale(0.5)
	elseif arg_7_0 == 3 then
		var_7_0 = CCSprite:create("res/ui/general/juexing/jx_tit_sb.png")

		var_7_0:setScale(0.5)
	elseif arg_7_0 == 4 then
		var_7_0 = CCStrokeLabelTTF:create(language.get(490723, arg_7_1), "Thonburi-Bold", 20, 1, ccc3(15, 15, 15))

		var_7_0:setColor(ccc3(0, 255, 0))
	elseif arg_7_0 == 5 then
		var_7_0 = CCStrokeLabelTTF:create(language.get(490715, arg_7_1), "Thonburi-Bold", 20, 1, ccc3(15, 15, 15))

		var_7_0:setColor(ccc3(0, 255, 0))
	elseif arg_7_0 == 6 then
		var_7_0 = CCStrokeLabelTTF:create(language.get(490716, arg_7_1), "Thonburi-Bold", 20, 1, ccc3(15, 15, 15))

		var_7_0:setColor(ccc3(0, 255, 0))
	elseif arg_7_0 == 7 then
		var_7_0 = CCStrokeLabelTTF:create(language.get(490717, arg_7_1), "Thonburi-Bold", 20, 1, ccc3(15, 15, 15))

		var_7_0:setColor(ccc3(0, 255, 0))
	end

	local function var_7_2()
		if var_7_0 then
			var_7_0:setVisible(true)
		end

		if arg_7_0 == 1 then
			arg_7_3:addChild(var_7_1, 1400)
		end
	end

	local function var_7_3()
		if var_7_0 then
			var_7_0:removeFromParentAndCleanup(true)
		end

		if var_7_1 then
			var_7_1:removeFromParentAndCleanup(true)
		end
	end

	if var_7_0 then
		var_7_0:setAnchorPoint(ccp(0.5, 0.5))
		var_7_0:setVisible(false)

		local var_7_4 = CCArray:create()
		local var_7_5 = CCMoveBy:create(1, ccp(0, 40))
		local var_7_6 = CCEaseExponentialOut:create(tolua.cast(var_7_5:copy(), "CCActionInterval"))
		local var_7_7 = CCScaleBy:create(0.2, 1.3)
		local var_7_8 = var_7_7:reverse()
		local var_7_9 = CCArray:create()

		var_7_9:addObject(CCDelayTime:create(arg_7_2))
		var_7_9:addObject(CCCallFuncN:create(var_7_2))
		var_7_9:addObject(var_7_7)
		var_7_9:addObject(var_7_8)
		var_7_9:addObject(var_7_6)
		var_7_9:addObject(CCCallFuncN:create(var_7_3))

		local var_7_10 = CCSequence:create(var_7_9)

		var_7_0:runAction(var_7_10)

		return var_7_0
	end
end

return var_0_0
