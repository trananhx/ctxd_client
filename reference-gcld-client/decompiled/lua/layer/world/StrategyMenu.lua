local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = ccc3(0, 180, 0)
local var_0_2 = colorQuality[5]
local var_0_3 = colorQuality[4]
local var_0_4 = colorQuality[2]
local var_0_5 = class("StrategyMenu", function()
	return CCNode:create()
end)

var_0_5.layout = {
	y = 0,
	name = "node",
	type = "node",
	x = 0,
	children = {
		{
			zoomOnTouchDown = true,
			name = "btn",
			h = 60,
			type = "button",
			w = 60,
			y = 0,
			x = 0,
			normal = {
				path = "res/default.png"
			},
			touched = {
				path = "res/default.png"
			},
			children = {
				{
					y = 30,
					name = "icon",
					type = "sprite",
					x = 30,
					pic = {
						path = "res/ui/nationTask/strategy/gzxce_world_icon_ts.png"
					}
				}
			}
		}
	}
}
var_0_5.tipFrame = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(0, 1),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			name = "tipMsg",
			height = 0,
			type = "label",
			width = 0,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_0
		}
	}
}

function var_0_5.getTipMsg(arg_2_0)
	local var_2_0
	local var_2_1 = language.get(460037, user.forceIdToName[arg_2_0.info.selfNation])

	if arg_2_0.info.strategy == "surround" then
		var_2_0 = language.get(205520, var_2_1, arg_2_0.info.interval, arg_2_0.info.npcNum, tool.getFormatTime(arg_2_0.info.nextTime))
	else
		var_2_0 = language.get(205521, var_2_1, arg_2_0.info.preCityName, arg_2_0.info.nowCityName)
	end

	if arg_2_0.info.concernNation == user.player.forceId then
		var_2_0 = var_2_0 .. language.get(205527)
	end

	return var_2_0
end

function var_0_5.showTip(arg_3_0)
	log.info("should show tips ")

	local var_3_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_3_0:registerScriptTouchHandler(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == CCTOUCHBEGAN then
			return true
		elseif arg_4_0 == CCTOUCHMOVED then
			return true
		elseif arg_4_0 == CCTOUCHENDED then
			pcall(var_3_0.removeFromParentAndCleanup, var_3_0, true)

			return true
		end
	end, false, true)
	var_3_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_3_0, 60000)

	local var_3_1 = 0
	local var_3_2 = 0
	local var_3_3 = {}

	uiutil.initWidgets(var_3_3, arg_3_0.tipFrame)
	var_3_0:addChild(var_3_3.widgets.tipFrame)

	local var_3_4 = arg_3_0.view.widgets.btn

	var_3_3.widgets.tipMsg:setString(arg_3_0:getTipMsg())

	local var_3_5, var_3_6 = tool.getPositionInScreen(var_3_4)
	local var_3_7 = var_3_5 + 20
	local var_3_8 = var_3_6 + 20
	local var_3_9 = var_3_3.widgets.tipMsg:getContentSize().width
	local var_3_10 = var_3_3.widgets.tipMsg:getContentSize().height

	var_3_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_3_9 + 30, var_3_10 + 30))
	var_3_3.widgets.tipFrame:setPosition(ccp(var_3_7, var_3_8))
	var_3_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_3_3.widgets.tipFrame:setVisible(true)

	if arg_3_0.info.strategy == "surround" then
		local var_3_11 = CCArray:create()

		var_3_11:addObject(CCDelayTime:create(0.5))
		var_3_11:addObject(CCCallFuncN:create(function()
			if arg_3_0.info.nextTime <= 0 then
				pcall(var_3_0.removeFromParentAndCleanup, var_3_0, true)
			else
				var_3_3.widgets.tipMsg:setString(arg_3_0:getTipMsg())
			end
		end))

		local var_3_12 = CCSequence:create(var_3_11)

		var_3_3.widgets.tipMsg:runAction(CCRepeatForever:create(var_3_12))
	end
end

function var_0_5.showPanel(arg_6_0, arg_6_1)
	arg_6_0.info = arg_6_1
end

function var_0_5.ctor(arg_7_0, arg_7_1)
	log.info("@@ 火计")

	arg_7_0.view = {}

	uiutil.initWidgets(arg_7_0.view, arg_7_0.layout)
	arg_7_0:addChild(arg_7_0.view.widgets.node)

	if arg_7_1.strategy == "surround" then
		arg_7_0.view.widgets.icon:setDisplayFrame(CCSprite:create("res/ui/nationTask/strategy/gzxce_world_icon_yj.png"):displayFrame())
	end

	arg_7_0.view.widgets.btn:addHandleOfControlEvent(function()
		log.info("btn")
		arg_7_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_7_0:showPanel(arg_7_1)
	arg_7_0:registerScriptHandler(function(arg_9_0)
		if arg_9_0 == "enter" then
			arg_7_0:onEnter()
		elseif arg_9_0 == "exit" then
			arg_7_0:onExit()
		end
	end)
end

function var_0_5.onEnter(arg_10_0)
	function arg_10_0.handlerPredicatePush_addNpcRef(arg_11_0)
		if arg_10_0.info.nowCity == arg_11_0.cityId then
			arg_10_0.info.nextTime = arg_11_0.nextTime

			local var_11_0 = smgr.getLayer("worldCamera").cityTable["world_building_" .. arg_10_0.info.nowCity]
			local var_11_1, var_11_2 = tool.getPositionInScreen(var_11_0.sprite)
			local var_11_3 = CCSprite:create("res/ui/nationTask/strategy/gzxce_word_yjrc.png")

			var_11_3:setPosition(var_11_1, var_11_2)
			smgr.showTipSpriteText(var_11_3)
		end
	end

	eventManager.registerEvent("handlerPredicatePush_addNpc", arg_10_0.handlerPredicatePush_addNpcRef)

	arg_10_0.updateRef = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_10_0, arg_10_0.update), 0, false)
end

function var_0_5.onExit(arg_12_0)
	eventManager.unregisterEvent("handlerPredicatePush_addNpc", arg_12_0.handlerPredicatePush_addNpcRef)

	if arg_12_0.updateRef then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_12_0.updateRef)
	end
end

function var_0_5.update(arg_13_0, arg_13_1)
	if arg_13_0.info and arg_13_0.info.nextTime then
		if arg_13_0.info.nextTime > 0 then
			arg_13_0.info.nextTime = arg_13_0.info.nextTime - 1000 * arg_13_1
		elseif arg_13_0.info.nextTime <= 0 then
			arg_13_0.info.nextTime = 0
		end
	end
end

return var_0_5
