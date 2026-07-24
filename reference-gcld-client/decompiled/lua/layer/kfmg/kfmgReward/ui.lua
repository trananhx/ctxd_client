local var_0_0 = class("kfmgReward", function()
	return CCLayer:create()
end)

function var_0_0.ctor(arg_2_0, ...)
	arg_2_0.uidata = require("lua/layer/kfmg/kfmgReward/uidata").new()
	arg_2_0.control = require("lua/layer/kfmg/kfmgReward/control").new(arg_2_0)

	arg_2_0:registerScriptHandler(function(arg_3_0)
		if arg_3_0 == "enter" then
			arg_2_0:onEnter()
		elseif arg_3_0 == "exit" then
			arg_2_0:onExit()
		end
	end)
	arg_2_0:setTouchEnabled(true)
	arg_2_0:registerScriptTouchHandler(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == CCTOUCHBEGAN then
			arg_2_0:onTouchBegan(arg_4_1, arg_4_2)

			return true
		elseif arg_4_0 == CCTOUCHMOVED then
			arg_2_0:onTouchMoved(arg_4_1, arg_4_2)

			return true
		elseif arg_4_0 == CCTOUCHENDED then
			arg_2_0:onTouchEnded(arg_4_1, arg_4_2)

			return true
		end
	end, false, true)
	arg_2_0:init()
end

function var_0_0.init(arg_5_0)
	arg_5_0.rewardPicNum = 0

	arg_5_0:removeAllChildrenWithCleanup(true)

	arg_5_0.uiTable = autoUI.initUI(arg_5_0, arg_5_0.uidata:getData())

	arg_5_0.uiTable.closeButton:registerScriptTapHandler(function()
		arg_5_0:close()
	end)
	arg_5_0.uiTable.rewardButton:registerScriptTapHandler(function()
		arg_5_0.control:getReward()
	end)
	arg_5_0.uiTable.tipsBtnReward:registerScriptTapHandler(function()
		tool.createTipsFrame(language.get("hw_kfmg_000037"), arg_5_0, arg_5_0.uiTable.tipsBtnReward, ccp(0, 1), ccp(1, 1))
	end)
	arg_5_0.control:refreshData()
end

function var_0_0.initData(arg_9_0, arg_9_1)
	arg_9_0.rewardData = arg_9_1

	local var_9_0 = arg_9_0.rewardData.notBeCrashed.reward

	if arg_9_0.rewardData.isBeCrashed == 1 then
		arg_9_0.uiTable.def_result:setDisplayFrame(CCSprite:createWithSpriteFrameName("nation_task_defe.png"):displayFrame())

		local var_9_1 = arg_9_0.rewardData.beCrashed.reward
	end

	if arg_9_0.rewardData.crashCities == 0 then
		arg_9_0.uiTable.reward_tile:setVisible(false)
		arg_9_0.uiTable.atk_result:setDisplayFrame(CCSprite:createWithSpriteFrameName("nation_task_defe.png"):displayFrame())
	elseif arg_9_0.rewardData.crashCities > 0 and arg_9_0.rewardData.crashCities < 4 then
		arg_9_0.uiTable.reward_tile:setDisplayFrame(CCSprite:create("res/ui/kfmg/kfmgReady/text/kfmgz_mgjl_meishuzi_jl_" .. arg_9_0.rewardData.crashCities .. ".png"):displayFrame())
	else
		log.info("error self.rewardData.crashCities = ", arg_9_0.rewardData.crashCities)
	end

	for iter_9_0 = 1, arg_9_0.rewardPicNum do
		if not tolua.isnull(arg_9_0.uiTable["rewardPic_" .. iter_9_0]) then
			arg_9_0.uiTable["rewardPic_" .. iter_9_0]:removeFromParentAndCleanup(true)
		end
	end

	arg_9_0.rewardPicNum = 0

	local var_9_2 = {
		[42] = "res_icon_5.png",
		[5] = "res_icon_6.png"
	}
	local var_9_3 = {
		[1] = 90,
		[2] = 200
	}

	for iter_9_1, iter_9_2 in ipairs(arg_9_0.rewardData.notBeCrashed.reward) do
		local var_9_4 = CCSprite:create("res/ui/kfmg/kfmgReady/kfmgz_cbyj_wupin_di.png")

		if #arg_9_0.rewardData.notBeCrashed.reward == 2 then
			var_9_4:setPosition(ccp(var_9_3[iter_9_1], 48))
		else
			var_9_4:setPosition(ccp(150, 48))
		end

		local var_9_5 = CCSprite:createWithSpriteFrameName(var_9_2[iter_9_2.type])

		var_9_5:setPosition(ccp(var_9_4:getContentSize().width / 2, var_9_4:getContentSize().height / 2))

		local var_9_6 = CCStrokeLabelTTF:create(iter_9_2.value, "Thonburi", 22, 2, colorText[10005])

		var_9_6:setPosition(ccp(var_9_4:getContentSize().width / 2, 24))

		local var_9_7 = CCSprite:createWithSpriteFrameName("jianglikuang1.png")

		var_9_7:setScale(0.8)
		var_9_7:setPosition(ccp(var_9_4:getContentSize().width / 2, var_9_4:getContentSize().height / 2))
		var_9_4:addChild(var_9_7, 1)
		var_9_4:addChild(var_9_5, 2)
		var_9_4:addChild(var_9_6, 3)
		arg_9_0.uiTable.maxReward_bg2:addChild(var_9_4)

		arg_9_0.rewardPicNum = arg_9_0.rewardPicNum + 1
		arg_9_0.uiTable["rewardPic_" .. arg_9_0.rewardPicNum] = var_9_4

		local var_9_8 = CCSprite:createWithSpriteFrameName("jianglikuang1.png")
		local var_9_9 = CCSprite:createWithSpriteFrameName(var_9_2[iter_9_2.type])

		var_9_9:setPosition(ccp(var_9_8:getContentSize().width / 2, var_9_8:getContentSize().height / 2))

		local var_9_10 = CCStrokeLabelTTF:create(iter_9_2.value, "Thonburi", 22, 2, colorText[10005])

		var_9_10:setPosition(ccp(var_9_8:getContentSize().width / 2, 24))

		if arg_9_0.rewardData.isRewarded == -1 or arg_9_0.rewardData.isBeCrashed == 1 then
			tool.spriteToGray(var_9_9)
		end

		var_9_8:setPosition(ccp(100 * iter_9_1 - 20, 273))
		var_9_8:addChild(var_9_9, 2)
		var_9_8:addChild(var_9_10, 3)
		arg_9_0.uiTable.getReward_panel:addChild(var_9_8)

		arg_9_0.rewardPicNum = arg_9_0.rewardPicNum + 1
		arg_9_0.uiTable["rewardPic_" .. arg_9_0.rewardPicNum] = var_9_8
	end

	for iter_9_3, iter_9_4 in ipairs(arg_9_0.rewardData.crashOtherCity.reward) do
		local var_9_11 = CCSprite:create("res/ui/kfmg/kfmgReady/kfmgz_cbyj_wupin_di.png")

		if #arg_9_0.rewardData.crashOtherCity.reward == 2 then
			var_9_11:setPosition(ccp(var_9_3[iter_9_3] + 255, 48))
		else
			var_9_11:setPosition(ccp(405, 48))
		end

		local var_9_12 = CCSprite:createWithSpriteFrameName(var_9_2[iter_9_4.type])

		var_9_12:setPosition(ccp(var_9_11:getContentSize().width / 2, var_9_11:getContentSize().height / 2))

		local var_9_13 = iter_9_4.value * 3
		local var_9_14 = CCStrokeLabelTTF:create(var_9_13, "Thonburi", 22, 2, colorText[10005])

		var_9_14:setPosition(ccp(var_9_11:getContentSize().width / 2, 24))

		local var_9_15 = CCSprite:createWithSpriteFrameName("jianglikuang1.png")

		var_9_15:setScale(0.8)
		var_9_15:setPosition(ccp(var_9_11:getContentSize().width / 2, var_9_11:getContentSize().height / 2))
		var_9_11:addChild(var_9_15, 1)
		var_9_11:addChild(var_9_12, 2)
		var_9_11:addChild(var_9_14, 3)
		arg_9_0.uiTable.maxReward_bg2:addChild(var_9_11)

		arg_9_0.rewardPicNum = arg_9_0.rewardPicNum + 1
		arg_9_0.uiTable["rewardPic_" .. arg_9_0.rewardPicNum] = var_9_11

		local var_9_16 = CCSprite:createWithSpriteFrameName("jianglikuang1.png")
		local var_9_17 = CCSprite:createWithSpriteFrameName(var_9_2[iter_9_4.type])

		var_9_17:setPosition(ccp(var_9_16:getContentSize().width / 2, var_9_16:getContentSize().height / 2))

		local var_9_18

		if arg_9_0.rewardData.crashCities and arg_9_0.rewardData.crashCities > 0 then
			var_9_18 = CCStrokeLabelTTF:create(iter_9_4.value * arg_9_0.rewardData.crashCities, "Thonburi", 22, 2, colorText[10005])
		else
			var_9_18 = CCStrokeLabelTTF:create(iter_9_4.value * 3, "Thonburi", 22, 2, colorText[10005])
		end

		var_9_18:setPosition(ccp(var_9_16:getContentSize().width / 2, 24))

		if arg_9_0.rewardData.isRewarded == -1 or arg_9_0.rewardData.crashCities == 0 then
			tool.spriteToGray(var_9_17)
		end

		var_9_16:setPosition(ccp(100 * iter_9_3 - 20, 109))
		var_9_16:addChild(var_9_17, 2)
		var_9_16:addChild(var_9_18, 3)
		arg_9_0.uiTable.getReward_panel:addChild(var_9_16)

		arg_9_0.rewardPicNum = arg_9_0.rewardPicNum + 1
		arg_9_0.uiTable["rewardPic_" .. arg_9_0.rewardPicNum] = var_9_16
	end

	if arg_9_0.rewardData.isRewarded == 0 then
		arg_9_0.uiTable.rewardButton:setVisible(true)
	elseif arg_9_0.rewardData.isRewarded == -1 then
		arg_9_0.uiTable.def_result:setVisible(false)
		arg_9_0.uiTable.atk_result:setVisible(false)
		arg_9_0.uiTable.rewardButton:setVisible(false)
	end
end

function var_0_0.refreshUi(arg_10_0)
	arg_10_0:init()
end

function var_0_0.close(arg_11_0)
	arg_11_0:removeFromParentAndCleanup(true)
end

function var_0_0.onEnter(arg_12_0)
	return
end

function var_0_0.onExit(arg_13_0)
	return
end

function var_0_0.onTouchBegan(arg_14_0, arg_14_1, arg_14_2)
	return true
end

function var_0_0.onTouchMoved(arg_15_0, arg_15_1, arg_15_2)
	return true
end

function var_0_0.onTouchEnded(arg_16_0, arg_16_1, arg_16_2)
	return true
end

return var_0_0
