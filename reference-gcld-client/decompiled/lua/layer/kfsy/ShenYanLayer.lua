local var_0_0 = class("KfsyShenYanLayer", function()
	return createBaseLayer()
end)

var_0_0.staticData = {
	isDrinkTipsOpen = false
}

local var_0_1
local var_0_2
local var_0_3

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0:init(arg_2_1)

	var_0_1 = 0
	var_0_2 = false
	var_0_3 = 0
end

function var_0_0.init(arg_3_0, arg_3_1)
	arg_3_0.backSprite = CCSprite:create("res/ui/kfsy/kfsy_ky1.jpg")
	arg_3_0.runActionSprite = CCSprite:create()
	arg_3_0.peopleSprite = CCSprite:create("res/ui/kfsy/150150.png")

	arg_3_0.peopleSprite:setPosition(ccp(-490, -305))
	arg_3_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
	arg_3_0:addChild(arg_3_0.backSprite, 0)
	arg_3_0:addChild(arg_3_0.runActionSprite, 2)
	arg_3_0:addChild(arg_3_0.peopleSprite, 1)
	arg_3_0:initDrinkTips()
	rmgr.loadResource("res/ui/juben/jbStart.plist")
	arg_3_0:yanhuiWait(arg_3_1)
end

function var_0_0.yanhuiFail(arg_4_0)
	arg_4_0.backSprite:removeAllChildrenWithCleanup(true)
end

function var_0_0.yanhuiWait(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1.action.data

	arg_5_0.backSprite:removeAllChildrenWithCleanup(true)

	local var_5_1
	local var_5_2
	local var_5_3
	local var_5_4, var_5_5, var_5_6 = arg_5_0:calcuInfo(arg_5_1)

	arg_5_0:addPeople(arg_5_1)
	arg_5_0:addTimer1(var_5_0.cd)

	local var_5_7 = CCLabelTTF:create(language.get(320418, var_5_4, var_5_5, var_5_6, var_5_4 + var_5_5 + var_5_6, 10), "Thonburi", 22)

	var_5_7:setColor(ccc3(0, 255, 0))
	var_5_7:setPosition(ccp(arg_5_0.backSprite:getContentSize().width / 2, arg_5_0.backSprite:getContentSize().height / 2 - 50))
	arg_5_0.backSprite:addChild(var_5_7)

	local var_5_8 = CCSprite:create("res/ui/kfsy/kfsy_jryt.png")

	var_5_8:setPosition(ccp(arg_5_0.backSprite:getContentSize().width / 2, arg_5_0.backSprite:getContentSize().height / 2 + 60))
	arg_5_0.backSprite:addChild(var_5_8)
end

function var_0_0.yanhuiUpdate(arg_6_0)
	return
end

function var_0_0.addTimer1(arg_7_0, arg_7_1)
	local function var_7_0()
		arg_7_0.backSprite:removeAllChildrenWithCleanup(true)
	end

	local var_7_1 = createTimerLabel(arg_7_1, language.get(320417), "Thonburi", 22, var_7_0, nil, nil, ccc3(0, 255, 0))

	var_7_1:setPosition(ccp(arg_7_0.backSprite:getContentSize().width / 2, arg_7_0.backSprite:getContentSize().height / 2))
	arg_7_0.backSprite:addChild(var_7_1)
end

function var_0_0.addTimer2(arg_9_0, arg_9_1)
	local function var_9_0()
		arg_9_0.backSprite:removeAllChildrenWithCleanup(true)
		smgr.changeScene(SCENE_KFSY)
	end

	return (createTimerLabel(arg_9_1, language.get(320420), "Thonburi", 22, var_9_0, nil, nil, ccc3(255, 248, 197)))
end

function var_0_0.handler_pushlayer(arg_11_0, arg_11_1)
	log.info("ShenYanLayer:handler_pushlayer()")
	showTable(arg_11_1)

	if arg_11_1.action.state == 3 and arg_11_1.action.data then
		if arg_11_1.action.data.update.kfzbFeastState == 3 then
			smgr.changeScene(SCENE_KFSY)
		end

		if arg_11_1.action.data.update.kfzbFeastState == 1 then
			if var_0_1 > 0 then
				smgr.changeScene(SCENE_KFSY)
			else
				var_0_1 = var_0_1 + 1
			end
		end

		if arg_11_1.action.data.update.kfzbFeastState == 2 then
			arg_11_0:yanhuiBegin(arg_11_1)
		end
	end
end

function var_0_0.request_roomInfo(arg_12_0)
	local function var_12_0(arg_13_0)
		log.info("Sreceive_roomInfo")
		arg_12_0:yanhuiWait(arg_13_0)

		var_0_3 = var_0_3 + 1
	end

	if var_0_2 ~= true then
		cmgr.sendRequest(var_12_0, actions.kfsyGetRoomInfo, 0, 0, 0)
	end
end

function var_0_0.onEnter(arg_14_0)
	function arg_14_0.handler_pushPlayer_ref(arg_15_0)
		arg_14_0:handler_pushlayer(arg_15_0)
	end

	cmgr.registerResponseHandler(actions.pushPlayer, arg_14_0.handler_pushPlayer_ref)

	local function var_14_0()
		arg_14_0:request_roomInfo()
	end

	arg_14_0.updateSchedulerEntry = arg_14_0.updateSchedulerEntry or nil
	arg_14_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_14_0, 5, false)
end

function var_0_0.onExit(arg_17_0)
	cmgr.unregisterResponseHandler(actions.pushPlayer, arg_17_0.handler_pushPlayer_ref)

	if arg_17_0.updateSchedulerEntry ~= nil then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_17_0.updateSchedulerEntry)

		arg_17_0.updateSchedulerEntry = nil
	end
end

function var_0_0.yanhuiBegin(arg_18_0, arg_18_1)
	var_0_2 = true

	arg_18_0.backSprite:removeAllChildrenWithCleanup(true)
	arg_18_0:addPeople(arg_18_1)

	local var_18_0 = CCSprite:create("res/ui/juben/jb_set.png")
	local var_18_1 = CCSprite:create()
	local var_18_2 = CCSprite:create("res/ui/kfsy/kfsy_ky.png")

	var_18_0:setPosition(ccp(arg_18_0.backSprite:getContentSize().width / 2, arg_18_0.backSprite:getContentSize().height / 2 + 100))

	local var_18_3 = CCLabelAtlas:create("2", "res/ui/common/number/battle_prepare_compo_red.png", 40, 48, 48)

	var_18_3:setAnchorPoint(ccp(0.5, 0.5))
	var_18_3:setPosition(ccp(var_18_0:getContentSize().width / 2, var_18_0:getContentSize().height / 2))
	var_18_2:setPosition(ccp(var_18_0:getContentSize().width / 2, var_18_0:getContentSize().height / 2))
	var_18_1:setPosition(ccp(var_18_0:getContentSize().width / 2, var_18_0:getContentSize().height / 2))
	arg_18_0.backSprite:addChild(var_18_0)
	var_18_0:addChild(var_18_3)
	var_18_0:addChild(var_18_1)
	var_18_0:addChild(var_18_2)
	var_18_2:setVisible(false)

	local var_18_4
	local var_18_5 = CCArray:create()

	var_18_5:addObject(CCCallFuncN:create(function()
		var_18_3:setString("2")
		var_18_3:setScale(2)
	end))
	var_18_5:addObject(CCEaseExponentialOut:create(CCScaleTo:create(0.8, 1)))
	var_18_5:addObject(CCCallFuncN:create(function()
		var_18_3:setString("1")
		var_18_3:setScale(2)
	end))
	var_18_5:addObject(CCEaseExponentialOut:create(CCScaleTo:create(0.8, 1)))
	var_18_5:addObject(CCCallFuncN:create(function()
		var_18_3:setString("0")
		var_18_3:setScale(2)
	end))
	var_18_5:addObject(CCEaseExponentialOut:create(CCScaleTo:create(0.8, 1)))
	var_18_5:addObject(CCCallFuncN:create(function()
		var_18_3:setVisible(false)
		var_18_2:setVisible(true)

		local var_22_0 = CCArray:create()

		for iter_22_0 = 10001, 10011 do
			local var_22_1 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("jb_start_" .. iter_22_0 .. ".png")

			if var_22_1 then
				var_22_0:addObject(var_22_1)
			end
		end

		local var_22_2 = CCAnimation:createWithSpriteFrames(var_22_0, 0.1)
		local var_22_3 = CCAnimate:create(var_22_2)

		var_18_1:runAction(var_22_3)
	end))
	var_18_5:addObject(CCDelayTime:create(1))
	var_18_5:addObject(CCCallFuncN:create(function()
		arg_18_0.backSprite:removeAllChildrenWithCleanup(true)
	end))
	var_18_5:addObject(CCCallFuncN:create(function()
		var_18_4 = arg_18_0:addCircleExp(arg_18_1)
	end))

	for iter_18_0 = 1, 30 do
		var_18_5:addObject(CCDelayTime:create(0.1))
		var_18_5:addObject(CCCallFuncN:create(function()
			var_18_4:setValue(iter_18_0 / 30)
		end))
	end

	var_18_5:addObject(CCDelayTime:create(0.5))
	var_18_5:addObject(CCCallFuncN:create(function()
		arg_18_0.backSprite:removeAllChildrenWithCleanup(true)
	end))
	var_18_5:addObject(CCCallFuncN:create(function()
		arg_18_0:yanhuiFinish(arg_18_1)
	end))
	arg_18_0.runActionSprite:runAction(CCSequence:create(var_18_5))
end

function var_0_0.addCircleExp(arg_28_0, arg_28_1)
	log.info("ShenYanLayer:addCircleExp")

	local var_28_0 = CCControlPotentiometer:create("res/ui/threeColorBag/jingdudi.png", "res/ui/threeColorBag/jingdu.png", "res/ui/kfsy/150150.png")

	arg_28_0.backSprite:addChild(var_28_0, 100, 100)
	var_28_0:setValue(0)
	var_28_0:setPosition(ccp(arg_28_0.backSprite:getContentSize().width / 2, arg_28_0.backSprite:getContentSize().height / 2))
	var_28_0:setEnabled(false)
	var_28_0:setVisible(true)
	var_28_0:setScale(1.5)

	local var_28_1 = CCSprite:create("res/ui/kfsy/kfsy_btn_jj.png")

	var_28_1:setScale(0.7)
	var_28_1:setPosition(ccp(0, 10))
	var_28_0:addChild(var_28_1)
	arg_28_0:addForceLogo(var_28_0, arg_28_1)

	return var_28_0
end

function var_0_0.addForceLogo(arg_29_0, arg_29_1, arg_29_2)
	local function var_29_0(arg_30_0)
		if arg_30_0 == 1 then
			return "res/ui/kfsy/kfsy_pmwei.png"
		elseif arg_30_0 == 2 then
			return "res/ui/kfsy/kfsy_pmshu.png"
		elseif arg_30_0 == 3 then
			return "res/ui/kfsy/kfsy_wu.png"
		end
	end

	if arg_29_2.action.data then
		local var_29_1 = arg_29_2.action.data

		for iter_29_0 = 1, 10 do
			local var_29_2 = CCSprite:create(var_29_0(var_29_1.update.rooms[iter_29_0].forceId))

			var_29_2:setPosition(ccp(kfsyConstant.nation[iter_29_0].x, kfsyConstant.nation[iter_29_0].y))
			arg_29_1:addChild(var_29_2)
		end
	end
end

function var_0_0.yanhuiFinish(arg_31_0, arg_31_1)
	local var_31_0 = {
		bg = {
			xcenter = 0,
			name = "yanhuiBack",
			type = "pic",
			ycenter = 50,
			pic = "res/ui/juben/jb_set.png",
			children = {
				{
					xcenter = -120,
					name = "qingtie",
					type = "pic",
					ycenter = 20,
					pic = "res/ui/kfsy/lvbu/lvdqj_qj.png"
				},
				{
					xcenter = 30,
					name = "chenghao",
					type = "pic",
					ycenter = 20,
					pic = arg_31_0:chenghao(arg_31_1)
				},
				{
					xcenter = 0,
					name = "dianquan",
					type = "pic",
					ycenter = -40,
					pic = "res/ui/kfsy/kfsy_js_dq.png"
				},
				{
					xcenter = -60,
					name = "huode",
					fontSize = 23,
					type = "label",
					ycenter = -40,
					font = "Thonburi",
					strokeSize = 2,
					text = language.get(320419),
					color = ccc3(0, 255, 0),
					strokeColor = ccc3(22, 18, 13)
				},
				{
					xcenter = 60,
					name = "dianquannum",
					fontSize = 23,
					type = "label",
					ycenter = -40,
					font = "Thonburi",
					strokeSize = 2,
					text = arg_31_1.action.data.update.ticket,
					color = ccc3(0, 255, 0),
					strokeColor = ccc3(22, 18, 13)
				},
				{
					xcenter = 0,
					name = "leave",
					type = "button",
					ycenter = -150,
					buttons = {
						{
							pic2 = "frame:btn_ok_lighted.png",
							name = "leaveButton",
							pic1 = "frame:btn_ok_normal.png",
							callBack = function()
								log.info("leaveButton")
								smgr.changeScene(SCENE_KFSY)
							end
						}
					}
				},
				{
					fontSize = 20,
					name = "leaveLabel",
					xcenter = 0,
					type = "label",
					ycenter = -150,
					font = "Thonburi",
					strokeSize = 2,
					text = language.get(320421),
					color = colorText[10004],
					strokeColor = colorText[10005]
				}
			}
		}
	}
	local var_31_1 = autoUI.initUI(arg_31_0.backSprite, var_31_0)
	local var_31_2 = arg_31_0:addTimer2(10000)

	var_31_2:setPosition(ccp(363, -30))
	var_31_1.yanhuiBack:addChild(var_31_2)

	local var_31_3 = arg_31_1.action.data.update.exReward

	if var_31_3 and #var_31_3 > 0 and var_31_3[1].pList > 0 then
		var_31_1.yanhuiBack:setPositionY(var_31_1.yanhuiBack:getPositionY() + 35)
		var_31_2:setPositionY(var_31_2:getPositionY() - 40)
		var_31_1.leaveButton:setPositionY(var_31_1.leaveButton:getPositionY() - 27)
		var_31_1.leaveLabel:setPositionY(var_31_1.leaveLabel:getPositionY() - 27)

		local var_31_4 = CCSprite:create("res/ui/kfsy/jxsy_js_di.png")

		var_31_4:setPosition(ccp(var_31_1.yanhuiBack:getPositionX(), var_31_1.yanhuiBack:getPositionY() - 100))
		arg_31_0.backSprite:addChild(var_31_4)
		arg_31_0:setExtraReward(var_31_3, var_31_4)
	end
end

function var_0_0.setExtraReward(arg_33_0, arg_33_1, arg_33_2)
	local var_33_0 = {}

	if #arg_33_1[1].pList == 10 then
		local var_33_1 = CCLabelTTF:create(language.get(320449), "Thonburi", 20)

		var_33_0[#var_33_0 + 1] = var_33_1

		local var_33_2 = CCSprite:createWithSpriteFrameName("res_icon_114.png")

		var_33_2:setScale(0.7)

		var_33_0[#var_33_0 + 1] = var_33_2

		local var_33_3 = CCLabelTTF:create("+" .. arg_33_1[1].drinkNum, "Thonburi", 20)

		var_33_3:setColor(colorQuality[3])

		var_33_0[#var_33_0 + 1] = var_33_3
	elseif #arg_33_1[1].pList == 9 or #arg_33_1[1].pList == 1 then
		local var_33_4
		local var_33_5
		local var_33_6

		if #arg_33_1[1].pList == 9 then
			var_33_4 = arg_33_1[2].pList[1]
			var_33_5 = arg_33_1[2].drinkNum
			var_33_6 = arg_33_1[1].drinkNum
		else
			var_33_4 = arg_33_1[1].pList[1]
			var_33_5 = arg_33_1[1].drinkNum
			var_33_6 = arg_33_1[2].drinkNum
		end

		local var_33_7 = CCLabelTTF:create(language.get(320450), "Thonburi", 18)

		var_33_0[#var_33_0 + 1] = var_33_7
		var_33_0[#var_33_0 + 1] = CCLabelTTF:create(tostring(var_33_4), "Thonburi", 18)
		var_33_0[#var_33_0 + 1] = CCLabelTTF:create(language.get(320452), "Thonburi", 18)

		local var_33_8 = CCSprite:createWithSpriteFrameName("res_icon_114.png")

		var_33_8:setScale(0.7)

		var_33_0[#var_33_0 + 1] = var_33_8

		local var_33_9 = CCLabelTTF:create("+" .. var_33_5, "Thonburi", 18)

		var_33_9:setColor(colorQuality[3])

		var_33_0[#var_33_0 + 1] = var_33_9

		local var_33_10 = CCLabelTTF:create(language.get(320453), "Thonburi", 18)

		var_33_0[#var_33_0 + 1] = var_33_10

		local var_33_11 = CCSprite:createWithSpriteFrameName("res_icon_114.png")

		var_33_11:setScale(0.7)

		var_33_0[#var_33_0 + 1] = var_33_11

		local var_33_12 = CCLabelTTF:create("+" .. var_33_6, "Thonburi", 18)

		var_33_12:setColor(colorQuality[3])

		var_33_0[#var_33_0 + 1] = var_33_12
	else
		local var_33_13 = CCLabelTTF:create(language.get(320450), "Thonburi", 18)

		var_33_0[#var_33_0 + 1] = var_33_13
		var_33_0[#var_33_0 + 1] = CCLabelTTF:create(table.concat(arg_33_1[1].pList, language.get(320451)), "Thonburi", 18)
		var_33_0[#var_33_0 + 1] = CCLabelTTF:create(language.get(320452), "Thonburi", 18)

		local var_33_14 = CCSprite:createWithSpriteFrameName("res_icon_114.png")

		var_33_14:setScale(0.7)

		var_33_0[#var_33_0 + 1] = var_33_14

		local var_33_15 = CCLabelTTF:create("+" .. arg_33_1[1].drinkNum, "Thonburi", 18)

		var_33_15:setColor(colorQuality[3])

		var_33_0[#var_33_0 + 1] = var_33_15
	end

	local var_33_16 = createRichNode(var_33_0, 0.5)

	var_33_16:setPosition(ccp(393, 31.5))
	arg_33_2:addChild(var_33_16)
end

function var_0_0.chenghao(arg_34_0, arg_34_1)
	if arg_34_1 then
		local var_34_0 = arg_34_1.action.data
		local var_34_1 = 0

		for iter_34_0 = 1, 10 do
			if var_34_0.update.rooms[iter_34_0].forceId == user.player.forceId then
				var_34_1 = var_34_1 + 1
			end
		end

		log.info("user.player.forceId: " .. user.player.forceId)
		log.info("nation num: " .. var_34_1)

		if var_34_1 == 1 then
			return "res/ui/kfsy/kfsy_chyzdx.png"
		elseif var_34_1 >= 2 and var_34_1 <= 5 then
			return "res/ui/kfsy/kfsy_chqlrr.png"
		elseif var_34_1 == 6 then
			return "res/ui/kfsy/kfsy_chlhtf.png"
		elseif var_34_1 == 7 then
			return "res/ui/kfsy/kfsy_chqxjh.png"
		elseif var_34_1 == 8 then
			return "res/ui/kfsy/kfsy_chbxgh.png"
		elseif var_34_1 == 9 then
			return "res/ui/kfsy/kfsy_chjzyt.png"
		elseif var_34_1 == 10 then
			return "res/ui/kfsy/kfsy_chsqsm.png"
		end
	end

	return "res/ui/kfsy/kfsy_chyzdx.png"
end

function var_0_0.addPeople(arg_35_0, arg_35_1)
	arg_35_0.peopleSprite:removeAllChildrenWithCleanup(true)

	local var_35_0 = arg_35_1.action.data

	require("lua/layer/kfsy/constant")

	local var_35_1 = CCSprite:create("res/ui/kfsy/dinnerChiefRole.png")

	var_35_1:setPosition(kfsyConstant.king)
	arg_35_0.peopleSprite:addChild(var_35_1)
	require("lua/layer/kfsy/feastInfo")

	local function var_35_2(arg_36_0)
		if kfsyInfo.feastInfo.response.action.data.rooms then
			local var_36_0 = kfsyInfo.feastInfo.response.action.data.rooms

			for iter_36_0 = 1, #var_36_0 do
				if var_36_0[iter_36_0].pos == arg_36_0 then
					return iter_36_0
				end
			end
		end

		return 1
	end

	if var_35_0.pos then
		local var_35_3 = CCStrokeLabelTTF:create(kfsyInfo.feastInfo.response.action.data.rooms[var_35_2(var_35_0.pos)].playerName, "Thonburi", 30, 1, ccc3(0, 0, 0))

		var_35_3:setColor(ccc3(255, 248, 197))
		var_35_3:setPosition(15, 80)
		var_35_1:addChild(var_35_3)
	elseif var_35_0.update and var_35_0.update.pos then
		local var_35_4 = CCStrokeLabelTTF:create(kfsyInfo.feastInfo.response.action.data.rooms[var_35_2(var_35_0.update.pos)].playerName, "Thonburi", 30, 1, ccc3(0, 0, 0))

		var_35_4:setColor(ccc3(255, 248, 197))
		var_35_4:setPosition(15, 80)
		var_35_1:addChild(var_35_4)
	end

	local function var_35_5(arg_37_0)
		if arg_37_0 == 1 then
			return "res/ui/kfsy/kfsy_pmwei.png"
		elseif arg_37_0 == 2 then
			return "res/ui/kfsy/kfsy_pmshu.png"
		elseif arg_37_0 == 3 then
			return "res/ui/kfsy/kfsy_wu.png"
		end
	end

	for iter_35_0 = 1, 10 do
		if var_35_0.rooms and var_35_0.rooms[iter_35_0] then
			local var_35_6

			if kfsyConstant.people[iter_35_0].side == 1 then
				var_35_6 = CCSprite:create("res/ui/kfsy/dinnerGeneralRole1.png")
			else
				var_35_6 = CCSprite:create("res/ui/kfsy/dinnerGeneralRole2.png")
			end

			var_35_6:setPosition(kfsyConstant.people[iter_35_0].pos)

			local var_35_7 = CCStrokeLabelTTF:create(var_35_0.rooms[iter_35_0].playerName, "Thonburi", 22, 1, ccc3(0, 0, 0))

			var_35_7:setColor(ccc3(255, 255, 255))

			local var_35_8 = CCSprite:create(var_35_5(var_35_0.rooms[iter_35_0].forceId))

			var_35_7:setPosition(50, 60)
			var_35_8:setPosition(-15, 60)
			var_35_6:addChild(var_35_7)
			var_35_6:addChild(var_35_8)
			arg_35_0.peopleSprite:addChild(var_35_6)

			if var_35_0.drink > 0 then
				local var_35_9 = CCSprite:create("res/ui/kfsy/kfsy_fgjh.png")

				var_35_9:setScale(0.7)
				var_35_9:setPosition(kfsyConstant.yanjiu[(iter_35_0 + 1) % 2 + 1].x, kfsyConstant.yanjiu[(iter_35_0 + 1) % 2 + 1].y)
				var_35_6:addChild(var_35_9, -10)
			end
		elseif var_35_0.update and var_35_0.update.rooms and var_35_0.update.rooms[iter_35_0] then
			local var_35_10

			if kfsyConstant.people[iter_35_0].side == 1 then
				var_35_10 = CCSprite:create("res/ui/kfsy/dinnerGeneralRole1.png")
			else
				var_35_10 = CCSprite:create("res/ui/kfsy/dinnerGeneralRole2.png")
			end

			var_35_10:setPosition(kfsyConstant.people[iter_35_0].pos)

			local var_35_11 = CCStrokeLabelTTF:create(var_35_0.update.rooms[iter_35_0].playerName, "Thonburi", 22, 1, ccc3(0, 0, 0))

			var_35_11:setColor(ccc3(255, 255, 255))

			local var_35_12 = CCSprite:create(var_35_5(var_35_0.update.rooms[iter_35_0].forceId))

			var_35_11:setPosition(50, 60)
			var_35_12:setPosition(-15, 60)
			var_35_10:addChild(var_35_11)
			var_35_10:addChild(var_35_12)
			arg_35_0.peopleSprite:addChild(var_35_10)

			if var_35_0.update.drink > 0 then
				local var_35_13 = CCSprite:create("res/ui/kfsy/kfsy_fgjh.png")

				var_35_13:setScale(0.7)
				var_35_13:setPosition(kfsyConstant.yanjiu[(iter_35_0 + 1) % 2 + 1].x, kfsyConstant.yanjiu[(iter_35_0 + 1) % 2 + 1].y)
				var_35_10:addChild(var_35_13, -10)
			end
		end
	end
end

function var_0_0.calcuInfo(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_1.action.data
	local var_38_1 = 0
	local var_38_2 = 0
	local var_38_3 = 0

	for iter_38_0 = 1, 10 do
		if var_38_0.rooms[iter_38_0] then
			if var_38_0.rooms[iter_38_0].forceId == 1 then
				var_38_1 = var_38_1 + 1
			elseif var_38_0.rooms[iter_38_0].forceId == 2 then
				var_38_2 = var_38_2 + 1
			elseif var_38_0.rooms[iter_38_0].forceId == 3 then
				var_38_3 = var_38_3 + 1
			end
		end
	end

	return var_38_1, var_38_2, var_38_3
end

function var_0_0.initDrinkTips(arg_39_0)
	if user.evokeOpen ~= true then
		return
	end

	local var_39_0 = {}

	uiutil.initWidgets(var_39_0, require("lua/layer/kfsy/DrinkTipsLayout"))
	arg_39_0:addChild(var_39_0.widgets.drinkTipsFrame, 100)
	var_39_0.widgets.drinkTipsFrame:setTouchEnabled(false)
	swallowTouch(var_39_0.widgets.drinkTipsBg)

	if var_0_0.staticData.isDrinkTipsOpen then
		var_39_0.widgets.drinkTipsBg:setPositionX(0)
		var_39_0.widgets.listBtnArrow:setDisplayFrame(CCSprite:create("res/ui/activity/MulNation/wblc_arrow_02.png"):displayFrame())
	else
		var_39_0.widgets.drinkTipsBg:setPositionX(-390)
		var_39_0.widgets.listBtnArrow:setDisplayFrame(CCSprite:create("res/ui/activity/MulNation/wblc_arrow_01.png"):displayFrame())
	end

	var_39_0.widgets.listBtn:addHandleOfControlEvent(function()
		local var_40_0 = CCArray:create()

		if var_0_0.staticData.isDrinkTipsOpen then
			var_39_0.widgets.listBtn:setEnabled(false)

			local var_40_1 = CCEaseExponentialOut:create(CCMoveBy:create(1, ccp(-390, 0)))
			local var_40_2 = CCCallFunc:create(function()
				var_39_0.widgets.listBtnArrow:setDisplayFrame(CCSprite:create("res/ui/activity/MulNation/wblc_arrow_01.png"):displayFrame())
				var_39_0.widgets.listBtn:setEnabled(true)

				var_0_0.staticData.isDrinkTipsOpen = false
			end)

			var_40_0:addObject(var_40_1)
			var_40_0:addObject(var_40_2)
		else
			var_39_0.widgets.listBtn:setEnabled(false)

			local var_40_3 = CCEaseExponentialIn:create(CCMoveBy:create(1, ccp(390, 0)))
			local var_40_4 = CCCallFunc:create(function()
				var_39_0.widgets.listBtnArrow:setDisplayFrame(CCSprite:create("res/ui/activity/MulNation/wblc_arrow_02.png"):displayFrame())
				var_39_0.widgets.listBtn:setEnabled(true)

				var_0_0.staticData.isDrinkTipsOpen = true
			end)

			var_40_0:addObject(var_40_3)
			var_40_0:addObject(var_40_4)
		end

		local var_40_5 = CCSequence:create(var_40_0)

		var_39_0.widgets.drinkTipsBg:runAction(var_40_5)
	end, CCControlEventTouchUpInside)
end

return var_0_0
