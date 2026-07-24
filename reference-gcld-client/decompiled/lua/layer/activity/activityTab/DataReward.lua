local var_0_0 = colorQuality[5]
local var_0_1 = colorQuality[0]

local function var_0_2(arg_1_0)
	local var_1_0 = tostring(arg_1_0)
	local var_1_1, var_1_2 = string.find(var_1_0, "^%d+")

	if string.len(var_1_0) == 11 and var_1_2 and var_1_2 == 11 then
		return true
	end

	return false
end

local var_0_3 = class("DataReward", function()
	return createBaseLayer()
end)

var_0_3.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = false,
		path = "res/ui/comment/bg1.jpg"
	},
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			fontSize = 25,
			name = "leftTime",
			y = 460,
			type = "label",
			x = 770,
			style = "label_warlock",
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_0
		},
		{
			y = 3,
			x = -10,
			scale = 0.95,
			type = "sprite",
			zorder = 100,
			pic = {
				frame = false,
				path = "res/ui/comment/xiaoqian.png"
			},
			anchorPoint = ccp(0, 0)
		},
		{
			x = 540,
			y = 470,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/taxiFare/cjsll_title.png"
			}
		},
		{
			x = 550,
			y = 420,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/taxiFare/ddsq_reward_bg_line.png"
			}
		},
		{
			name = "btn_reward",
			h = 87,
			type = "button",
			w = 281,
			zoomOnTouchDown = false,
			y = 50,
			x = 540,
			normal = {
				frame = false,
				path = "res/ui/activity/taxiFare/ddsq_btn_lq.png"
			},
			touched = {
				frame = false,
				path = "res/ui/activity/taxiFare/ddsq_btn_lq_c.png"
			},
			disable = {
				frame = false,
				path = "res/ui/activity/taxiFare/ddsq_btn_lq_g.png"
			}
		}
	}
}

function var_0_3.getSingleRewardLayout(arg_3_0, arg_3_1)
	local var_3_0 = 450 - arg_3_1 * 60
	local var_3_1 = arg_3_1 % 2 == 1 and "ddsq_reward_bg01.png" or "ddsq_reward_bg02.png"
	local var_3_2 = arg_3_1 <= 2 and "ddsq_word_yllb.png" or "ddsq_word_dzsjyt.png"

	return {
		type = "node",
		x = 0,
		name = "node_reward" .. arg_3_1,
		y = var_3_0,
		children = {
			{
				x = 560,
				y = 0,
				type = "sprite",
				pic = {
					frame = false,
					path = "res/ui/activity/taxiFare/" .. var_3_1
				}
			},
			{
				x = 560,
				y = -30,
				type = "sprite",
				pic = {
					frame = false,
					path = "res/ui/activity/taxiFare/ddsq_reward_bg_line.png"
				}
			},
			{
				x = 310,
				y = 0,
				type = "sprite",
				name = "icon" .. arg_3_1,
				pic = {
					frame = true,
					path = "acti_icon_fini.png"
				}
			},
			{
				y = 0,
				anchorX = 0,
				type = "richLabel",
				x = 335,
				name = "cond" .. arg_3_1
			},
			{
				y = 0,
				style = "label_white_24",
				type = "label",
				x = 335,
				name = "cond_gray" .. arg_3_1,
				anchorPoint = ccp(0, 0.5),
				color = var_0_1
			},
			{
				x = 660,
				y = 0,
				type = "sprite",
				visible = false,
				name = "num" .. arg_3_1,
				pic = {
					frame = false,
					path = "res/ui/common/number/ddsq_word_digit.png"
				},
				anchorPoint = ccp(0, 0.5)
			},
			{
				y = 0,
				type = "sprite",
				name = "info" .. arg_3_1,
				pic = {
					frame = false,
					path = "res/ui/activity/taxiFare/" .. var_3_2
				},
				x = 660 + (arg_3_1 <= 2 and 23 or 0),
				anchorPoint = ccp(0, 0.5)
			}
		}
	}
end

function var_0_3.refresh(arg_4_0)
	local function var_4_0(arg_5_0)
		arg_4_0:showPanel(arg_5_0.action.data)
	end

	cmgr.sendRequest(var_4_0, actions.getDataRewardActivity)
end

function var_0_3.onGetDataRewardReward(arg_6_0)
	local var_6_0 = arg_6_0.editBox:getText()

	local function var_6_1(arg_7_0)
		local var_7_0 = arg_7_0.action.data.msg

		if var_7_0 and string.len(var_7_0) > 0 then
			messageBox.alert(language.get(190080), var_7_0)
		else
			arg_6_0:showRewardEffect()
		end

		CCUserDefault:sharedUserDefault():setStringForKey(arg_6_0.key, var_6_0)
		log.info("zhu@@@phone", var_6_0)
	end

	if var_0_2(var_6_0) then
		cmgr.sendRequest(var_6_1, actions.getDataReward, var_6_0)
	else
		messageBox.alert(language.get(190080), language.get(135579))
	end
end

function var_0_3.showRewardEffect(arg_8_0)
	local var_8_0 = rmgr.getAnimation("warlockUpgrade")
	local var_8_1 = CCAnimation:createWithSpriteFrames(var_8_0, 0.08)
	local var_8_2 = CCAnimate:create(var_8_1)
	local var_8_3 = CCRepeat:create(var_8_2, 1)
	local var_8_4 = CCSprite:create()
	local var_8_5 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_8_5:registerScriptTouchHandler(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == CCTOUCHBEGAN then
			return true
		elseif arg_9_0 == CCTOUCHMOVED then
			return true
		elseif arg_9_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)
	var_8_5:setTouchEnabled(true)
	var_8_5:addChild(var_8_4, 500)
	var_8_4:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))

	local var_8_6 = CCArray:create()

	var_8_6:addObject(var_8_3)

	local function var_8_7()
		pcall(var_8_4.removeFromParentAndCleanup, var_8_4, true)
		var_8_5:removeFromParentAndCleanup(true)
		arg_8_0:refresh()
	end

	smgr.rootLayer:addChild(var_8_5, 60000)
	var_8_6:addObject(CCCallFuncN:create(var_8_7))
	var_8_4:runAction(CCSequence:create(var_8_6))

	local var_8_8 = CCSprite:create("res/ui/activity/taxiFare/ddsq_word_lqcg.png")

	var_8_8:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 60))
	smgr.showTipSpriteText(var_8_8)
end

function var_0_3.showPanel(arg_11_0, arg_11_1)
	arg_11_0.info = arg_11_1

	local var_11_0 = {
		arg_11_1.haveRewardOne,
		arg_11_1.haveRewardTwo,
		arg_11_1.haveRewardFour
	}
	local var_11_1 = {
		arg_11_1.gotRewardOne,
		arg_11_1.gotRewardTwo
	}
	local var_11_2 = 0

	for iter_11_0 = 1, 3 do
		var_11_2 = var_11_2 + var_11_0[iter_11_0]
	end

	local var_11_3 = var_11_2 > 0

	arg_11_0.view.widgets.btn_reward:setEnabled(var_11_3)

	for iter_11_1 = 1, 3 do
		local var_11_4
		local var_11_5 = iter_11_1 <= 2 and (var_11_0[iter_11_1] == 1 and "acti_icon_fini.png" or var_11_1[iter_11_1] == 1 and "acti_icon_fini.png" or "acti_icon_unfini.png") or var_11_0[iter_11_1] == 1 and "acti_icon_fini.png" or "acti_icon_unfini.png"
		local var_11_6 = var_11_0[iter_11_1] ~= 1

		arg_11_0.view.widgets["icon" .. iter_11_1]:setDisplayFrame(tool.spriteFrameByName(var_11_5))
		arg_11_0.view.widgets["icon" .. iter_11_1]:setVisible(var_11_6)
		log.info("zhu@@@icon", iter_11_1, var_11_0[iter_11_1], var_11_6)

		local var_11_7 = var_11_0[iter_11_1] == 1 or var_11_1[iter_11_1] == 1

		arg_11_0.view.widgets["cond" .. iter_11_1]:setVisible(var_11_7)
		arg_11_0.view.widgets["cond_gray" .. iter_11_1]:setVisible(not var_11_7)

		local var_11_8 = arg_11_0.view.widgets["num" .. iter_11_1]
		local var_11_9 = arg_11_0.view.widgets["info" .. iter_11_1]

		if var_11_7 then
			var_11_8:removeAllChildrenWithCleanup(true)
			var_11_9:removeAllChildrenWithCleanup(true)
		else
			tool.spriteToGray(var_11_8)
			tool.spriteToGray(var_11_9)
		end
	end

	local var_11_10 = CCUserDefault:sharedUserDefault():getStringForKey(arg_11_0.key)
	local var_11_11 = var_0_2(var_11_10)

	arg_11_0.editBox:setEnabled(not var_11_11)

	if var_11_11 then
		arg_11_0.editBox:setText(var_11_10)
	end
end

function var_0_3.ctor(arg_12_0, arg_12_1, arg_12_2)
	log.info("@@ 领取流量活动")

	arg_12_0.view = {}

	uiutil.initWidgets(arg_12_0.view, arg_12_0.layout)

	arg_12_0.leftTime = arg_12_0.view.widgets.leftTime

	if arg_12_1 then
		arg_12_0:addChild(arg_12_0.view.widgets.panel)
		arg_12_1:addChild(arg_12_0)
	end

	arg_12_0.key = string.format("e%s_phone%s", arg_12_2.eventId, user.player.playerId)

	local var_12_0 = {
		135571,
		135572,
		135573
	}
	local var_12_1 = {
		135575,
		135576,
		135577
	}

	for iter_12_0 = 1, 3 do
		uiutil.initWidgets(arg_12_0.view, arg_12_0:getSingleRewardLayout(iter_12_0))
		arg_12_0.view.widgets.panel:addChild(arg_12_0.view.widgets["node_reward" .. iter_12_0])
		arg_12_0.view.widgets["cond" .. iter_12_0]:setString(language.get(var_12_0[iter_12_0]))
		arg_12_0.view.widgets["cond_gray" .. iter_12_0]:setString(language.get(var_12_1[iter_12_0]))
		arg_12_0.view.widgets["num" .. iter_12_0]:setTextureRect(CCRectMake(23 * (2 * iter_12_0 + 1), 0, 23, 25))
		arg_12_0.view.widgets["num" .. iter_12_0]:setVisible(iter_12_0 <= 3)
	end

	local var_12_2 = CCScale9Sprite:create("res/ui/activity/taxiFare/ddsq_number_bg.png")
	local var_12_3 = CCEditBox:create(CCSizeMake(440, 64), var_12_2)

	var_12_3:setPosition(ccp(540, 130))
	var_12_3:setMaxLength(20)
	var_12_3:setReturnType(1)
	var_12_3:setPlaceHolder(language.get(135578))
	var_12_3:setInputMode(kEditBoxInputModePhoneNumber)
	var_12_3:registerScriptEditBoxHandler(handler(arg_12_0, arg_12_0.clickEditBoxHandle))
	arg_12_0.view.widgets.panel:addChild(var_12_3)

	arg_12_0.editBox = var_12_3

	arg_12_0.view.widgets.btn_reward:addHandleOfControlEvent(function()
		log.info("btn_reward")
		arg_12_0:onGetDataRewardReward()
	end, CCControlEventTouchUpInside)
	arg_12_0:showPanel(arg_12_2)
end

function var_0_3.clickEditBoxHandle(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = tolua.cast(arg_14_2, "CCEditBox")

	log.info("editbox click", arg_14_1)

	if arg_14_1 == "began" then
		-- block empty
	elseif arg_14_1 == "changed" then
		-- block empty
	elseif arg_14_1 == "ended" then
		-- block empty
	end
end

return var_0_3
