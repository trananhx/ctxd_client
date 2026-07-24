tool.requireRes("world/cityCombo")
require("lua/component/timerLabel")

cityComboUI = {}

local var_0_0 = cityComboControl
local var_0_1 = cityComboConstant
local var_0_2 = cityComboUI
local var_0_3
local var_0_4
local var_0_5

cityComboUI.currentCityCombo = 0

local function var_0_6(arg_1_0)
	if arg_1_0 <= 1 then
		return ccc3(255, 255, 255)
	elseif arg_1_0 == 2 then
		return ccc3(0, 255, 0)
	elseif arg_1_0 == 3 then
		return ccc3(255, 255, 0)
	elseif arg_1_0 == 4 then
		return ccc3(255, 0, 0)
	else
		return ccc3(255, 0, 255)
	end
end

local function var_0_7(arg_2_0, arg_2_1)
	local var_2_0 = 1
	local var_2_1 = 1
	local var_2_2 = {}

	while true do
		local var_2_3 = string.find(arg_2_0, arg_2_1, var_2_0)

		if not var_2_3 then
			var_2_2[var_2_1] = string.sub(arg_2_0, var_2_0, string.len(arg_2_0))

			break
		end

		var_2_2[var_2_1] = string.sub(arg_2_0, var_2_0, var_2_3 - 1)
		var_2_0 = var_2_3 + string.len(arg_2_1)
		var_2_1 = var_2_1 + 1
	end

	return var_2_2
end

local function var_0_8(arg_3_0)
	var_0_3.cityComboBackground:removeChildByTag(cityComboConstant.timer, true)

	local var_3_0 = createTimerLabel(arg_3_0, language.get(113019), "Thonburi", 18, nil, nil, nil, ccc3(255, 255, 255))

	var_3_0:setPosition(ccp(32, 152))
	var_0_3.cityComboBackground:addChild(var_3_0, 100, cityComboConstant.timer)
end

local function var_0_9(arg_4_0)
	var_0_3.cityNumber:setString(arg_4_0)
	var_0_3.cityNumber:setColor(var_0_6(arg_4_0))
	var_0_3.lianxiacheng:setColor(var_0_6(arg_4_0))
end

local function var_0_10(arg_5_0, arg_5_1)
	var_0_3.rewardNum:setVisible(arg_5_0)
	var_0_3.rewardButton:setVisible(arg_5_0)

	if arg_5_1 then
		local var_5_0 = var_0_7(arg_5_1, ",")
		local var_5_1 = 0

		for iter_5_0, iter_5_1 in pairs(var_5_0) do
			var_5_1 = var_5_1 + 1
		end

		var_0_3.rewardNum:setString(var_5_1)
	end
end

function var_0_2.onTouch(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_0 == CCTOUCHBEGAN then
		return true
	elseif arg_6_0 == CCTOUCHMOVED then
		return true
	elseif arg_6_0 == CCTOUCHENDED then
		return true
	end

	log.info("layer on touched")
end

function var_0_2.showCityComboLayer()
	local var_7_0 = createBaseLayer()

	log.info("ui.showCityComboLayer")

	var_7_0.onEnter = var_0_0.onEnter
	var_7_0.onExit = var_0_0.onExit

	if var_0_3 then
		var_0_3 = nil
	end

	var_0_3 = autoUI.initUI(var_7_0, getCityComboUiData())

	var_0_3.cityComboPanel:setVisible(false)
	rmgr.loadResource("res/ui/equip/trade/smsr_light.plist")

	var_0_4 = CCSprite:create()

	var_0_3.cityComboPanel:addChild(var_0_4, 1000)
	var_0_4:setPosition(ccp(33, 93))

	local var_7_1 = CCArray:create()

	for iter_7_0 = 1, 12 do
		local var_7_2 = CCSprite:createWithSpriteFrameName(string.format("smsr_light_%02d.png", iter_7_0))

		var_7_1:addObject(var_7_2:displayFrame())
	end

	local var_7_3 = CCAnimation:createWithSpriteFrames(var_7_1, 0.1)
	local var_7_4 = CCAnimate:create(var_7_3)

	var_0_4:runAction(CCRepeatForever:create(var_7_4))
	var_0_4:setScaleX(0.40860215053763443)
	var_0_4:setScaleY(0.29545454545454547)
	var_0_4:setRotation(90)
	var_0_4:setVisible(false)
	rmgr.loadResource("res/anim/sdtj/itemLight.plist")

	var_0_5 = CCSprite:create()

	var_0_3.cityComboPanel:addChild(var_0_5, 1000)
	var_0_5:setPosition(ccp(32, 157))

	local var_7_5 = CCArray:create()

	for iter_7_1 = 1, 16 do
		local var_7_6 = CCSprite:createWithSpriteFrameName(string.format("itemLight_%s.png", iter_7_1))

		var_7_5:addObject(var_7_6:displayFrame())
	end

	local var_7_7 = CCAnimation:createWithSpriteFrames(var_7_5, 0.1)
	local var_7_8 = CCAnimate:create(var_7_7)

	var_0_5:runAction(CCRepeatForever:create(var_7_8))
	var_0_5:setScaleX(0.9)
	var_0_5:setScaleY(0.9)
	var_0_5:setVisible(false)

	return var_7_0
end

function var_0_2.setGetReward(arg_8_0)
	var_0_2.setCityComboPush(arg_8_0)
end

function var_0_2.setCityComboWorld(arg_9_0)
	if arg_9_0.num and arg_9_0.num < cityComboUI.currentCityCombo then
		arg_9_0.num = cityComboUI.currentCityCombo
	end

	if arg_9_0.flag == 1 then
		var_0_2.showCityComboSelect(arg_9_0.needNum, arg_9_0.totalCd, arg_9_0.feat, arg_9_0.cd, arg_9_0.nextRabbits)
		var_0_3.cityComboPanel:setVisible(false)
	elseif arg_9_0.flag == 2 then
		var_0_3.cityComboPanel:setVisible(true)
		var_0_8(arg_9_0.cd)
		var_0_9(arg_9_0.num)
		var_0_10(false)
		var_0_4:setVisible(true)
		var_0_5:setVisible(false)
	elseif arg_9_0.flag == 0 then
		if arg_9_0.feats == "null" or arg_9_0.feats == nil then
			var_0_3.cityComboPanel:setVisible(false)
		else
			var_0_3.cityComboPanel:setVisible(true)
		end

		var_0_3.cityComboBackground:removeChildByTag(cityComboConstant.timer, true)
		var_0_9(arg_9_0.num)
		var_0_10(true, arg_9_0.feats)
		var_0_4:setVisible(false)
		var_0_5:setVisible(true)
	else
		var_0_3.cityComboPanel:setVisible(false)
	end
end

function var_0_2.setCityComboPush(arg_10_0)
	if var_0_3 == nil or var_0_3.cityComboPanel == nil then
		return
	end

	if arg_10_0.flag == 1 then
		var_0_3.cityComboPanel:setVisible(false)
	elseif arg_10_0.flag == 2 then
		var_0_3.cityComboPanel:setVisible(true)
		var_0_8(arg_10_0.cd)
		var_0_10(false)
		var_0_4:setVisible(true)
		var_0_5:setVisible(false)
	elseif arg_10_0.flag == 0 then
		if arg_10_0.feats == "null" or arg_10_0.feats == nil then
			var_0_3.cityComboPanel:setVisible(false)
		else
			var_0_3.cityComboPanel:setVisible(true)
			var_0_3.cityComboBackground:removeChildByTag(cityComboConstant.timer, true)
			var_0_10(true, arg_10_0.feats)
		end

		var_0_4:setVisible(false)
		var_0_5:setVisible(true)
	end

	var_0_9(arg_10_0.num)
end

function var_0_2.cityComboBuildNum(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5)
	local var_11_0 = {}
	local var_11_1 = 76
	local var_11_2 = 85
	local var_11_3 = 1

	var_11_0[var_11_3] = CCSprite:create(arg_11_1)

	local var_11_4 = var_11_3 + 1

	if arg_11_0 < 0 or arg_11_0 > 999 then
		arg_11_0 = 999
	end

	if arg_11_0 >= 100 then
		local var_11_5 = math.floor(arg_11_0 / 100)

		var_11_0[var_11_4] = CCLabelAtlas:create(tostring(var_11_5), arg_11_2, var_11_1, var_11_2, 49)

		var_11_0[var_11_4]:setAnchorPoint(ccp(0.5, 0.5))

		var_11_4 = var_11_4 + 1
		var_11_0[var_11_4] = CCSprite:create(arg_11_4)
		var_11_4 = var_11_4 + 1
		arg_11_0 = math.mod(arg_11_0, 100)

		if arg_11_0 < 10 and arg_11_0 > 0 then
			var_11_0[var_11_4] = CCSprite:create(arg_11_5)
			var_11_4 = var_11_4 + 1
		end
	end

	if arg_11_0 >= 10 then
		local var_11_6 = math.floor(arg_11_0 / 10)

		if var_11_6 ~= 1 then
			var_11_0[var_11_4] = CCLabelAtlas:create(tostring(var_11_6), arg_11_2, var_11_1, var_11_2, 49)

			var_11_0[var_11_4]:setAnchorPoint(ccp(0.5, 0.5))

			var_11_4 = var_11_4 + 1
		end

		var_11_0[var_11_4] = CCLabelAtlas:create(":", arg_11_2, var_11_1, var_11_2, 49)

		var_11_0[var_11_4]:setAnchorPoint(ccp(0.5, 0.5))

		var_11_4 = var_11_4 + 1
		arg_11_0 = math.mod(arg_11_0, 10)
	end

	if arg_11_0 > 0 then
		var_11_0[var_11_4] = CCLabelAtlas:create(tostring(arg_11_0), arg_11_2, var_11_1, var_11_2, 49)

		var_11_0[var_11_4]:setAnchorPoint(ccp(0.5, 0.5))

		var_11_4 = var_11_4 + 1
	end

	var_11_0[var_11_4] = CCSprite:create(arg_11_3)

	return (createRichNode(var_11_0, 0.5))
end

function var_0_2.showCityComboAction(arg_12_0, arg_12_1)
	local var_12_0 = smgr.getLayer("topLayer")
	local var_12_1 = CCSprite:create("res/ui/battle/stategyPic/4.png")

	var_12_1:setPosition(ccp(visibleSize.width + var_12_1:getContentSize().width * 0.5, visibleSize.height * 0.5))
	var_12_0:addChild(var_12_1)

	if arg_12_1 == true then
		local var_12_2 = CCSprite:create("res/ui/world/cityCombo/cclp_tit_end_js.png")

		var_12_2:setPosition(ccp(var_12_1:getContentSize().width * 0.5, var_12_1:getContentSize().height * 0.75))
		var_12_1:addChild(var_12_2, 10)
	else
		local var_12_3 = CCSprite:create("res/ui/world/cityCombo/cclp_tit_cclp.png")

		var_12_3:setPosition(ccp(var_12_1:getContentSize().width * 0.6, var_12_1:getContentSize().height * 0.75))
		var_12_1:addChild(var_12_3, 10)
	end

	if arg_12_1 == true then
		-- block empty
	elseif arg_12_0 < 1 then
		local var_12_4 = CCSprite:create("res/ui/world/cityCombo/cclp_tit_cclpycrw.png")

		var_12_4:setPosition(ccp(var_12_1:getContentSize().width * 0.8, var_12_1:getContentSize().height * 0.4))
		var_12_1:addChild(var_12_4)
	elseif arg_12_0 == 1 then
		local var_12_5 = var_0_2.cityComboBuildNum(arg_12_0, "res/ui/world/cityCombo/cclp_tit_lx.png", "res/ui/world/cityCombo/cclp_tit_digit.png", "res/ui/world/cityCombo/cclp_tit_lxc.png", "res/ui/world/cityCombo/cclp_tit_digithd.png", "res/ui/world/cityCombo/cclp_tit_digitzero.png")

		var_12_5:setScale(0.8)
		var_12_5:setPosition(ccp(var_12_1:getContentSize().width * 0.8, var_12_1:getContentSize().height * 0.4))
		var_12_1:addChild(var_12_5)
	elseif arg_12_0 == 2 then
		local var_12_6 = CCSprite:create("res/ui/world/cityCombo/cclp_tit_combo2.png")

		var_12_6:setPosition(ccp(var_12_1:getContentSize().width * 0.8, var_12_1:getContentSize().height * 0.4))
		var_12_6:setScale(0.8)
		var_12_1:addChild(var_12_6)
	elseif arg_12_0 == 3 then
		local var_12_7 = CCSprite:create("res/ui/world/cityCombo/cclp_tit_combo3.png")

		var_12_7:setPosition(ccp(var_12_1:getContentSize().width * 0.8, var_12_1:getContentSize().height * 0.4))
		var_12_7:setScale(0.8)
		var_12_1:addChild(var_12_7)
	elseif arg_12_0 == 4 then
		local var_12_8 = CCSprite:create("res/ui/world/cityCombo/cclp_tit_combo4.png")

		var_12_8:setPosition(ccp(var_12_1:getContentSize().width * 0.8, var_12_1:getContentSize().height * 0.4))
		var_12_8:setScale(0.8)
		var_12_1:addChild(var_12_8)
	else
		local var_12_9 = var_0_2.cityComboBuildNum(arg_12_0, "res/ui/world/cityCombo/cclp_tit_lx.png", "res/ui/world/cityCombo/cclp_tit_digit.png", "res/ui/world/cityCombo/cclp_tit_lxc.png", "res/ui/world/cityCombo/cclp_tit_digithd.png", "res/ui/world/cityCombo/cclp_tit_digitzero.png")

		var_12_9:setScale(0.8)
		var_12_9:setPosition(ccp(var_12_1:getContentSize().width * 0.8, var_12_1:getContentSize().height * 0.4))
		var_12_1:addChild(var_12_9)
	end

	if arg_12_1 ~= true then
		local var_12_10 = CCSprite:create("res/ui/world/cityCombo/cclp_gcc.png")

		var_12_10:setPosition(ccp(var_12_1:getContentSize().width * 0.25, var_12_1:getContentSize().height * 0.5))
		var_12_1:addChild(var_12_10)
	end

	local function var_12_11()
		var_12_0:removeChild(var_12_1, true)
	end

	local var_12_12 = rmgr.getSpeedEffectAnimation()
	local var_12_13 = CCAnimation:createWithSpriteFrames(var_12_12, 0.08)
	local var_12_14 = CCAnimate:create(var_12_13)
	local var_12_15 = CCRepeatForever:create(var_12_14)
	local var_12_16 = CCSprite:create()

	var_12_16:runAction(var_12_15)
	var_12_16:setPosition(ccp(var_12_1:getContentSize().width * 0.5, var_12_1:getContentSize().height * 0.5))
	var_12_1:addChild(var_12_16)

	local var_12_17 = CCArray:create()

	var_12_17:addObject(CCMoveTo:create(0.3, ccp(visibleSize.width * 0.5, visibleSize.height * 0.5)))
	var_12_17:addObject(CCDelayTime:create(0.8))
	var_12_17:addObject(CCMoveTo:create(0.3, ccp(0 - var_12_1:getContentSize().width * 0.5, visibleSize.height * 0.5)))
	var_12_17:addObject(CCCallFuncN:create(var_12_11))

	local var_12_18 = CCSequence:create(var_12_17)

	var_12_1:runAction(var_12_18)
end

function var_0_2.showCityComboSelect(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4)
	local var_14_0 = smgr.getLayer("topLayer")
	local var_14_1 = CCLayerColor:create(ccc4(0, 0, 0, 125))

	var_14_1:registerScriptTouchHandler(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == CCTOUCHBEGAN then
			return true
		elseif arg_15_0 == CCTOUCHMOVED then
			return true
		elseif arg_15_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)
	var_14_1:setTouchEnabled(true)
	var_14_0:addChild(var_14_1)

	local var_14_2 = CCSprite:create("res/ui/world/cityCombo/lxzc_bg.png")

	var_14_2:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
	var_14_1:addChild(var_14_2, 1000)

	local var_14_3 = CCSprite:create("res/ui/world/cityCombo/lxzc_bg4.png")

	var_14_3:setPosition(ccp(var_14_2:getContentSize().width * 0.5, var_14_2:getContentSize().height * 0.78))
	var_14_2:addChild(var_14_3, 2)

	local var_14_4 = CCSprite:create("res/ui/world/cityCombo/lxzc_qz2.png")

	var_14_4:setPosition(ccp(var_14_2:getContentSize().width * 0.5, var_14_2:getContentSize().height * 0.5))
	var_14_2:addChild(var_14_4, 1)

	local var_14_5 = CCSprite:create("res/ui/world/cityCombo/lxzc_title.png")

	var_14_5:setPosition(ccp(var_14_2:getContentSize().width * 0.5, var_14_2:getContentSize().height * 1.04))
	var_14_2:addChild(var_14_5, 10)

	local var_14_6 = CCSprite:create("res/ui/world/cityCombo/lxzc_btn_ksrw.png")
	local var_14_7 = CCSprite:create("res/ui/world/cityCombo/lxzc_btn_ksrw_c.png")
	local var_14_8 = GraySprite:createWithSpriteFrame(var_14_6:displayFrame())

	local function var_14_9()
		log.info("callBack1")
		var_0_0.startCityCombo()
		cityComboUI.showCityComboAction(0, false)
		var_14_1:removeFromParentAndCleanup(true)
	end

	local var_14_10 = CCMenuItemSprite:create(var_14_6, var_14_7, var_14_8)

	var_14_10:setPosition(ccp(0, 0))
	var_14_10:registerScriptTapHandler(var_14_9)

	local var_14_11 = CCSprite:create("res/ui/world/cityCombo/lxzc_btn_fqrw.png")
	local var_14_12 = CCSprite:create("res/ui/world/cityCombo/lxzc_btn_fqrw_c.png")
	local var_14_13 = GraySprite:createWithSpriteFrame(var_14_11:displayFrame())

	local function var_14_14()
		log.info("callBack2")
		cmgr.sendRequest(function(...)
			log.info("@@ 结束连续攻城")
			var_14_1:removeFromParentAndCleanup(true)
		end, actions.endConquer)
	end

	local var_14_15 = CCMenuItemSprite:create(var_14_11, var_14_12, var_14_13)

	var_14_15:setPosition(ccp(0, 0))
	var_14_15:registerScriptTapHandler(var_14_14)

	local var_14_16 = CCArray:create()

	var_14_16:addObject(var_14_10)

	local var_14_17 = CCMenu:createWithArray(var_14_16)

	var_14_17:setPosition(ccp(var_14_2:getContentSize().width * 0.25, var_14_2:getContentSize().height * 0.25))
	var_14_2:addChild(var_14_17, 1)

	local var_14_18 = CCArray:create()

	var_14_18:addObject(var_14_15)

	local var_14_19 = CCMenu:createWithArray(var_14_18)

	var_14_19:setPosition(ccp(var_14_2:getContentSize().width * 0.75, var_14_2:getContentSize().height * 0.25))
	var_14_2:addChild(var_14_19, 1)

	local var_14_20 = CCSprite:create("res/ui/world/cityCombo/lxzcsyd.png")

	var_14_20:setPosition(ccp(var_14_2:getContentSize().width * 0.5, var_14_2:getContentSize().height * 0.79))
	var_14_2:addChild(var_14_20, 4)

	if arg_14_3 > 0 then
		local function var_14_21()
			smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
		end

		local var_14_22 = createTimerLabel(arg_14_3, "@S", "Thonburi", 52, var_14_21, nil, nil, colorText[10001])

		var_14_22:setPosition(ccp(var_14_2:getContentSize().width * 0.5, var_14_2:getContentSize().height * 0.45))
		var_14_2:addChild(var_14_22, 4)
	end
end

function var_0_2.setcityComboTable(arg_20_0)
	var_0_3.cityComboPanel:setVisible(arg_20_0)
end
