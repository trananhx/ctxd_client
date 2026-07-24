local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = ccc3(0, 180, 0)
local var_0_2 = colorQuality[5]
local var_0_3 = colorQuality[4]
local var_0_4 = colorQuality[2]
local var_0_5 = {
	"cd",
	"nextRefreshTime"
}
local var_0_6 = class("NewInvestMenu", function()
	return CCNode:create()
end)

var_0_6.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			x = 0,
			name = "bg",
			y = 90,
			type = "sprite",
			scale = 0.9,
			pic = {
				path = "res/ui/nationTask/invest/jzrw_world_bg01.png"
			},
			children = {
				{
					y = 50,
					name = "icon",
					type = "sprite",
					x = 50,
					pic = {
						path = "res/ui/nationTask/invest/icon2.png"
					}
				},
				{
					y = 62,
					x = 124,
					type = "sprite",
					pic = {
						frame = true,
						path = "res_icon_1_small.png"
					}
				},
				{
					y = 30,
					x = 124,
					type = "sprite",
					pic = {
						path = "res/ui/nationTask/invest/jzrw_word_shuliang.png"
					}
				},
				{
					fontSize = 20,
					name = "copper",
					y = 66,
					type = "label",
					x = 156,
					anchorPoint = ccp(0, 0.5)
				},
				{
					fontSize = 20,
					name = "productNum",
					y = 30,
					type = "label",
					x = 156,
					anchorPoint = ccp(0, 0.5)
				},
				{
					name = "btn_invest",
					h = 58,
					type = "button",
					w = 97,
					y = 50,
					x = 270,
					normal = {
						frame = true,
						path = "btn1_gre_a.png"
					},
					touched = {
						frame = true,
						path = "btn1_gre_c.png"
					},
					disable = {
						frame = true,
						path = "btn1_gre_g.png"
					},
					children = {
						{
							fontSize = 24,
							y = 29,
							type = "label",
							x = 48,
							textId = 137018
						}
					}
				},
				{
					fontSize = 20,
					name = "cd",
					y = 16,
					type = "label",
					x = 270
				},
				{
					y = 100,
					name = "bg_cd",
					type = "sprite",
					x = 124,
					pic = {
						path = "res/ui/activity/gangMine/blgkd_number_bg2.png"
					},
					children = {
						{
							y = 14,
							x = 5,
							type = "sprite",
							pic = {
								path = "res/ui/arena/jzxt_icon_clock.png"
							}
						},
						{
							fontSize = 20,
							name = "nextRefreshTime",
							y = 14,
							type = "label",
							x = 20.2194,
							color = var_0_2,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_cd",
					h = 36,
					type = "button",
					w = 42,
					y = 14,
					x = 335,
					normal = {
						path = "res/ui/world/feud/sjwc_icon_js_arrow.png"
					},
					touched = {
						path = "res/ui/world/feud/sjwc_icon_js_arrow.png"
					}
				},
				{
					y = 125,
					name = "node_txt",
					x = 162,
					type = "node"
				}
			}
		}
	}
}

function var_0_6.onInvestCopper(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showEffectInvest(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.newInvestCopper, arg_2_0.info.cityId)
end

function var_0_6.onFastRecover(arg_4_0)
	local function var_4_0(arg_5_0)
		user.newInvestGold = arg_5_0.action.data.gold
		arg_4_0.info.cd = 0

		arg_4_0:showPanel(arg_4_0.info)
	end

	messageBox.showChargeWin("", language.get(137013, user.newInvestGold), "investTaskGold", function()
		cmgr.sendRequest(var_4_0, actions.newInvestCD, arg_4_0.info.cityId)
	end)
end

function var_0_6.showEffectInvest(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0.view.widgets.node_txt:getChildren()

	if var_7_0 ~= nil and var_7_0:count() > 0 then
		for iter_7_0 = 0, var_7_0:count() - 1 do
			local var_7_1 = tolua.cast(var_7_0:objectAtIndex(iter_7_0), "CCLabelTTF")
			local var_7_2 = var_7_1:getPositionY()

			var_7_1:setPositionY(var_7_2 + 25)
		end
	end

	local var_7_3 = {
		137001,
		137002,
		137003
	}
	local var_7_4 = CCLabelTTF:create(language.get(137019, language.get(var_7_3[user.player.forceId]), arg_7_0.info.productNum, arg_7_0.info.exp), "Thonburi", 20)

	var_7_4:setColor(ccc3(0, 255, 0))
	var_7_4:setPosition(0, 0)
	arg_7_0.view.widgets.node_txt:addChild(var_7_4)

	local var_7_5 = CCArray:create()

	var_7_5:addObject(CCDelayTime:create(1))
	var_7_5:addObject(CCFadeOut:create(1))
	var_7_5:addObject(CCCallFunc:create(function()
		var_7_4:removeFromParentAndCleanup(true)
	end))

	local var_7_6 = CCSequence:create(var_7_5)

	var_7_4:runAction(var_7_6)

	arg_7_0.info.exp = arg_7_1.exp
	arg_7_0.info.copper = arg_7_1.copper
	arg_7_0.info.cd = arg_7_1.cd

	arg_7_0:showPanel(arg_7_0.info)
end

function var_0_6.showPanel(arg_9_0, arg_9_1)
	arg_9_0.info = arg_9_1

	arg_9_0.view.widgets.copper:setString(tool.getFormatNum(arg_9_1.copper))
	arg_9_0.view.widgets.productNum:setString(arg_9_1.productNum)
	arg_9_0.view.widgets.nextRefreshTime:stopAllActions()

	if arg_9_1.nextRefreshTime and arg_9_1.nextRefreshTime > 0 then
		arg_9_0.view.widgets.nextRefreshTime:setString(tool.getFormatTime(arg_9_1.nextRefreshTime))

		local var_9_0 = CCArray:create()

		var_9_0:addObject(CCDelayTime:create(0.5))
		var_9_0:addObject(CCCallFuncN:create(function()
			if arg_9_1.nextRefreshTime <= 0 then
				arg_9_0.view.widgets.nextRefreshTime:stopAllActions()
			else
				arg_9_0.view.widgets.nextRefreshTime:setString(tool.getFormatTime(arg_9_1.nextRefreshTime))
			end
		end))

		local var_9_1 = CCSequence:create(var_9_0)

		arg_9_0.view.widgets.nextRefreshTime:runAction(CCRepeatForever:create(var_9_1))
	end

	arg_9_0.view.widgets.cd:stopAllActions()

	local var_9_2 = arg_9_1.cd ~= nil and arg_9_1.cd > 0
	local var_9_3 = arg_9_1.cd <= 600000

	arg_9_0.view.widgets.cd:setVisible(var_9_2)
	arg_9_0.view.widgets.btn_cd:setVisible(not var_9_3)
	arg_9_0.view.widgets.btn_invest:setEnabled(var_9_3)

	if var_9_2 then
		arg_9_0.view.widgets.cd:setColor(var_9_3 and var_0_0 or var_0_2)
		arg_9_0.view.widgets.cd:setString(string.format("CD:%s", tool.getFormatTime(arg_9_1.cd)))

		local var_9_4 = CCArray:create()

		var_9_4:addObject(CCDelayTime:create(0.5))
		var_9_4:addObject(CCCallFuncN:create(function()
			if arg_9_1.cd <= 0 then
				arg_9_0.view.widgets.cd:stopAllActions()
			else
				arg_9_0.view.widgets.cd:setString(string.format("CD:%s", tool.getFormatTime(arg_9_1.cd)))

				if arg_9_0.view.widgets.btn_cd:isVisible() and arg_9_1.cd < 600000 then
					arg_9_0.view.widgets.cd:setColor(var_0_0)
					arg_9_0.view.widgets.btn_cd:setVisible(false)
					arg_9_0.view.widgets.btn_invest:setEnabled(true)
				end
			end
		end))

		local var_9_5 = CCSequence:create(var_9_4)

		arg_9_0.view.widgets.cd:runAction(CCRepeatForever:create(var_9_5))
	end
end

function var_0_6.ctor(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.view = {}

	uiutil.initWidgets(arg_12_0.view, arg_12_0.layout)
	arg_12_0:addChild(arg_12_0.view.widgets.root)
	swallowTouch(arg_12_0)

	if arg_12_1.type == 2 then
		arg_12_0.view.widgets.bg:setDisplayFrame(CCSprite:create("res/ui/nationTask/invest/jzrw_world_bg02.png"):displayFrame())
	end

	arg_12_0.view.widgets.icon:setDisplayFrame(CCSprite:create(string.format("res/ui/nationTask/invest/icon%s.png", user.player.forceId)):displayFrame())
	arg_12_0.view.widgets.btn_invest:addHandleOfControlEvent(function()
		log.info("btn_invest")
		arg_12_0:onInvestCopper()
	end, CCControlEventTouchUpInside)
	arg_12_0.view.widgets.btn_cd:addHandleOfControlEvent(function()
		log.info("btn_cd")
		arg_12_0:onFastRecover()
	end, CCControlEventTouchUpInside)

	arg_12_2.bg = arg_12_0.view.widgets.bg
	arg_12_2.btn_invest = arg_12_0.view.widgets.btn_invest
	arg_12_2.btn_cd = arg_12_0.view.widgets.btn_cd

	arg_12_0:showPanel(arg_12_1)
	arg_12_0:registerScriptHandler(function(arg_15_0)
		if arg_15_0 == "enter" then
			arg_12_0:onEnter()
		elseif arg_15_0 == "exit" then
			arg_12_0:onExit()
		end
	end)
end

function var_0_6.onEnter(arg_16_0)
	arg_16_0.updateRef = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_16_0, arg_16_0.update), 0, false)
end

function var_0_6.onExit(arg_17_0)
	if arg_17_0.updateRef then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_17_0.updateRef)
	end
end

function var_0_6.update(arg_18_0, arg_18_1)
	if arg_18_0.info then
		for iter_18_0, iter_18_1 in ipairs(var_0_5) do
			if arg_18_0.info[iter_18_1] then
				if arg_18_0.info[iter_18_1] > 0 then
					arg_18_0.info[iter_18_1] = arg_18_0.info[iter_18_1] - 1000 * arg_18_1
				elseif arg_18_0.info[iter_18_1] <= 0 then
					arg_18_0.info[iter_18_1] = 0
				end
			end
		end
	end
end

return var_0_6
