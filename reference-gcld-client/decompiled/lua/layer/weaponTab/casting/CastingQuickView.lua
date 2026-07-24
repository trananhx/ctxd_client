local var_0_0 = class("CastingQuickView", function()
	return createBaseLayer()
end)

var_0_0.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			y = 0,
			name = "proNode",
			visible = false,
			type = "node",
			x = 0,
			children = {
				{
					y = 0,
					name = "tksj_bar_bg",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/weapon/casting/tksj_bar_bg.png"
					}
				},
				{
					y = 0,
					name = "progress",
					type = "progressbar",
					x = 0,
					pic = {
						path = "res/ui/weapon/casting/tksj_bar.png"
					}
				}
			}
		},
		{
			fontSize = 22,
			name = "titleLb",
			style = "label_warlock",
			type = "label",
			y = 20,
			x = 0,
			visible = false,
			color = ccc3(255, 255, 150)
		},
		{
			fontSize = 15,
			style = "label_warlock",
			name = "proLb",
			type = "label",
			y = 0,
			x = 0
		},
		{
			y = 0,
			name = "giftNode",
			visible = false,
			type = "node",
			x = 0,
			children = {
				{
					w = 28,
					name = "giftBtn",
					h = 32,
					type = "button",
					y = 60,
					x = 40,
					normal = {
						path = "res/ui/weapon/casting/tksj_gift.png"
					},
					touched = {
						path = "res/ui/weapon/casting/tksj_gift.png"
					}
				},
				{
					fontSize = 18,
					style = "label_warlock",
					name = "numLb",
					type = "label",
					y = 48,
					x = 40,
					color = ccc3(0, 255, 0)
				}
			}
		}
	}
}

local function var_0_1(...)
	local function var_2_0(arg_3_0)
		local var_3_0 = arg_3_0.action.data

		if var_3_0 then
			user.castingAddNum = var_3_0.num

			local var_3_1 = {}
			local var_3_2 = {
				id = var_3_0.type,
				value = var_3_0.num
			}

			table.insert(var_3_1, var_3_2)
			globalAction_gotResource(var_3_1)
		end
	end

	cmgr.sendRequest(var_2_0, actions.recvExMaterial)
end

function var_0_0.ctor(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.data = {}
	arg_4_0.view = {}

	uiutil.initWidgets(arg_4_0.view, arg_4_0.layout)

	if arg_4_1 then
		arg_4_0.view.widgets.root:setPosition(ccp(53, -5))
		arg_4_0:addChild(arg_4_0.view.widgets.root)
		arg_4_1:addChild(arg_4_0)
	end

	arg_4_0:updatePanel(arg_4_2)
	arg_4_0.view.widgets.giftBtn:addHandleOfControlEvent(var_0_1, CCControlEventTouchDown)
end

local function var_0_2(arg_5_0)
	if not arg_5_0 or tolua.isnull(arg_5_0) then
		return
	end

	local var_5_0 = CCArray:create()

	var_5_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_5_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_5_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_5_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_5_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_5_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_5_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_5_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_5_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_5_0:addObject(CCDelayTime:create(0.4))

	local var_5_1 = CCSequence:create(var_5_0)

	arg_5_0:stopAllActions()
	arg_5_0:runAction(CCRepeatForever:create(var_5_1))
end

function var_0_0.updatePanel(arg_6_0, arg_6_1)
	arg_6_0.info = arg_6_1

	if arg_6_1 then
		arg_6_0:resertUI()

		if arg_6_1.state == 0 then
			arg_6_0.view.widgets.titleLb:setString(language.get(215001))
		elseif arg_6_1.state == 1 then
			if arg_6_1.curNum and arg_6_1.maxNum then
				arg_6_0.view.widgets.proLb:setString(arg_6_1.curNum .. "/" .. arg_6_1.maxNum)

				local var_6_0 = arg_6_1.curNum / arg_6_1.maxNum * 100

				arg_6_0.view.widgets.progress:setPercentage(var_6_0)
				arg_6_0.view.widgets.proNode:setVisible(true)
			end

			arg_6_0.view.widgets.titleLb:setString(language.get(215002, arg_6_1.name))

			if arg_6_1.exNum and arg_6_1.exNum > 0 then
				arg_6_0.view.widgets.giftNode:setVisible(true)

				if arg_6_1.exNum >= arg_6_1.exMaxNum then
					arg_6_0.view.widgets.numLb:setString(language.get(215003, arg_6_1.exNum))
					var_0_2(arg_6_0.view.widgets.giftNode)
				else
					arg_6_0.view.widgets.numLb:setString(arg_6_1.exNum)
				end
			end
		elseif arg_6_1.state == 2 then
			if arg_6_1.remainCdInMillis and arg_6_1.remainCdInMillis > 0 then
				if arg_6_0.timerLayer == nil then
					local function var_6_1()
						if arg_6_0.timerLayer then
							arg_6_0.timerLayer:removeFromParentAndCleanup(true)

							arg_6_0.timerLayer = nil
						end
					end

					local function var_6_2(arg_8_0)
						arg_6_0.info.remainCdInMillis = arg_8_0
					end

					if arg_6_1.remainCdInMillis > 0 then
						arg_6_0.timerLayer = createTimerLabel(arg_6_1.remainCdInMillis, "@H:@M:@S", "Thonburi-Bold", 24, var_6_1, nil, nil, colorTips.red, var_6_2)

						arg_6_0.timerLayer:setPosition(ccp(0, 0))
						arg_6_0.view.widgets.root:addChild(arg_6_0.timerLayer, 999, 1000)
					end
				else
					arg_6_0.timerLayer:setTime(arg_6_1.remainCdInMillis)
				end
			end

			arg_6_0.view.widgets.titleLb:setString(language.get(215004))
		elseif arg_6_1.state == 3 then
			arg_6_0.view.widgets.titleLb:setString(language.get(215004))
			arg_6_0.view.widgets.proLb:setString(language.get(215005))
			arg_6_0.view.widgets.progress:setPercentage(100)
			arg_6_0.view.widgets.proNode:setVisible(true)
		elseif arg_6_1.state == 4 then
			arg_6_0.view.widgets.titleLb:setString(language.get(215006))
			arg_6_0.view.widgets.progress:setPercentage(100)
			arg_6_0.view.widgets.proNode:setVisible(true)
		end
	end
end

function var_0_0.resertUI(arg_9_0)
	arg_9_0.view.widgets.proNode:setVisible(false)
	arg_9_0.view.widgets.giftNode:setVisible(false)
	arg_9_0.view.widgets.titleLb:setString("")
	arg_9_0.view.widgets.proLb:setString("")
end

function var_0_0.onEnter(arg_10_0)
	return
end

function var_0_0.onExit(arg_11_0)
	return
end

return var_0_0
