local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = ccc3(0, 180, 0)
local var_0_2 = colorQuality[5]
local var_0_3 = colorQuality[4]
local var_0_4 = colorQuality[2]
local var_0_5 = class("FarmPanel", function()
	return createBaseLayer()
end)

var_0_5.layout = {
	name = "Scene",
	type = "node",
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5,
	children = {
		{
			y = 0,
			name = "bg",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/world/buildNation/jgdy_jzys_d.png"
			},
			children = {
				{
					y = 30,
					name = "bg1",
					type = "sprite",
					x = 216,
					pic = {
						path = "res/ui/world/buildNation/jgdy_bd_d.png"
					}
				},
				{
					fontSize = 25,
					name = "info",
					y = 30,
					type = "label",
					x = 216,
					color = var_0_0
				},
				{
					y = 95,
					name = "btn0",
					h = 93,
					type = "button",
					w = 100,
					visible = false,
					x = 216,
					normal = {
						path = "res/ui/world/farm/ttq_btn_lb.png"
					},
					touched = {
						path = "res/ui/world/farm/ttq_btn_lb_c.png"
					},
					children = {
						{
							fontSize = 25,
							name = "num0",
							y = 95,
							type = "label",
							x = 50,
							color = var_0_0
						}
					}
				},
				{
					y = 100,
					name = "btn1",
					h = 72,
					type = "button",
					w = 73,
					visible = false,
					x = 96,
					normal = {
						path = "res/ui/resourceArea2/zcgz_btn_round.png"
					},
					touched = {
						path = "res/ui/resourceArea2/zcgz_btn_round_c.png"
					},
					children = {
						{
							y = 36,
							name = "icon1",
							type = "sprite",
							x = 36,
							pic = {
								path = "res/ui/world/farm/ttq_btn_icon_jh.png"
							}
						},
						{
							y = 10,
							name = "txt1",
							type = "sprite",
							x = 36,
							pic = {
								path = "res/ui/world/farm/ttq_word_jh.png"
							}
						},
						{
							fontSize = 25,
							name = "num1",
							y = 80,
							type = "label",
							x = 36,
							color = var_0_0
						}
					}
				},
				{
					y = 100,
					name = "btn2",
					h = 72,
					type = "button",
					w = 73,
					visible = false,
					x = 216,
					normal = {
						path = "res/ui/resourceArea2/zcgz_btn_round.png"
					},
					touched = {
						path = "res/ui/resourceArea2/zcgz_btn_round_c.png"
					},
					children = {
						{
							y = 36,
							name = "icon2",
							type = "sprite",
							x = 36,
							pic = {
								path = "res/ui/world/farm/ttq_btn_icon_fb.png"
							}
						},
						{
							y = 10,
							name = "txt2",
							type = "sprite",
							x = 36,
							pic = {
								path = "res/ui/world/farm/ttq_word_fb.png"
							}
						},
						{
							fontSize = 25,
							name = "num2",
							y = 80,
							type = "label",
							x = 36,
							color = var_0_0
						}
					}
				},
				{
					y = 100,
					name = "btn3",
					h = 72,
					type = "button",
					w = 73,
					visible = false,
					x = 336,
					normal = {
						path = "res/ui/resourceArea2/zcgz_btn_round.png"
					},
					touched = {
						path = "res/ui/resourceArea2/zcgz_btn_round_c.png"
					},
					children = {
						{
							y = 36,
							name = "icon3",
							type = "sprite",
							x = 36,
							pic = {
								path = "res/ui/world/farm/ttq_btn_icon_yc.png"
							}
						},
						{
							y = 10,
							name = "txt3",
							type = "sprite",
							x = 36,
							pic = {
								path = "res/ui/world/farm/ttq_word_yc.png"
							}
						},
						{
							fontSize = 25,
							name = "num3",
							y = 80,
							type = "label",
							x = 36,
							color = var_0_0
						}
					}
				}
			}
		}
	}
}

function var_0_5.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel2(arg_3_0.action.data)
	end

	local function var_2_1(arg_4_0)
		arg_2_0:showPanel(arg_4_0.action.data)
		cmgr.sendRequest(var_2_0, actions.farmLbGetInfo)
	end

	cmgr.sendRequest(var_2_1, actions.farmGetInfo)
end

function var_0_5.onStartAll(arg_5_0, arg_5_1)
	local function var_5_0(arg_6_0)
		if not tolua.isnull(arg_5_0.view.widgets.Scene) then
			local var_6_0, var_6_1 = tool.getPositionInScreen(arg_5_0.view.widgets.Scene)
			local var_6_2 = CCSprite:create("res/ui/world/farm/ttq_word_kslb.png")

			var_6_2:setPosition(ccp(var_6_0, var_6_1))
			smgr.showTipSpriteText(var_6_2, function()
				pcall(arg_5_0.removeFromParentAndCleanup, arg_5_0, true)
			end)
		end

		eventManager.dispatchEvent("setFarm", 3)
	end

	local var_5_1 = {
		[0] = 5,
		1,
		2,
		4
	}

	cmgr.sendRequest(var_5_0, actions.farmStartAll, var_5_1[arg_5_1])
end

function var_0_5.showPanel(arg_8_0, arg_8_1)
	arg_8_0.normalItemNum = arg_8_1.normalItemNum
end

function var_0_5.showPanel2(arg_9_0, arg_9_1)
	local var_9_0 = {
		[0] = arg_9_0.normalItemNum or 0,
		arg_9_1.farmItem.reduceCostItemNum or 0,
		arg_9_1.farmItem.doubleKillItemNum or 0,
		arg_9_1.farmItem.attackAdderItemNum or 0
	}
	local var_9_1 = var_9_0[0]

	if arg_9_0.normalItemNum then
		arg_9_0.view.widgets.num0:setString(language.get(191003, var_9_0[0]))
		arg_9_0.view.widgets.btn0:setVisible(true)
	else
		var_9_1 = var_9_0[1] + var_9_0[2] + var_9_0[3]

		for iter_9_0 = 1, 3 do
			arg_9_0.view.widgets["num" .. iter_9_0]:setString(language.get(191003, var_9_0[iter_9_0]))
			arg_9_0.view.widgets["btn" .. iter_9_0]:setVisible(true)
		end
	end

	arg_9_0.view.widgets.info:setString(language.get(190305, var_9_1, arg_9_1.limitNum))
end

function var_0_5.ctor(arg_10_0, arg_10_1)
	arg_10_0.view = {}

	uiutil.initWidgets(arg_10_0.view, arg_10_0.layout)
	arg_10_0:addChild(arg_10_0.view.widgets.Scene)

	if arg_10_1 then
		arg_10_1:addChild(arg_10_0)
	end

	swallowTouch(arg_10_0)

	for iter_10_0 = 0, 3 do
		arg_10_0.view.widgets["btn" .. iter_10_0]:addHandleOfControlEvent(function()
			log.info("btn%s", iter_10_0)
			arg_10_0:onStartAll(iter_10_0)
		end, CCControlEventTouchUpInside)
	end

	arg_10_0:refresh()
end

function var_0_5.onEnter(arg_12_0)
	arg_12_0.touchBeganRef = handler(arg_12_0, arg_12_0.onTouchBegan)
	arg_12_0.touchMovedRef = handler(arg_12_0, arg_12_0.onTouchMoved)
	arg_12_0.touchEndedRef = handler(arg_12_0, arg_12_0.onTouchEnded)
	arg_12_0.touchCancelledRef = handler(arg_12_0, arg_12_0.onTouchCancelled)

	eventManager.registerEvent("globalOnTouchBegan", arg_12_0.touchBeganRef)
	eventManager.registerEvent("globalOnTouchMoved", arg_12_0.touchMovedRef)
	eventManager.registerEvent("globalOnTouchEnded", arg_12_0.touchEndedRef)
	eventManager.registerEvent("globalOnTouchCancelled", arg_12_0.touchCancelledRef)
end

function var_0_5.onExit(arg_13_0)
	eventManager.unregisterEvent("globalOnTouchBegan", arg_13_0.touchBeganRef)
	eventManager.unregisterEvent("globalOnTouchMoved", arg_13_0.touchMovedRef)
	eventManager.unregisterEvent("globalOnTouchEnded", arg_13_0.touchEndedRef)
	eventManager.unregisterEvent("globalOnTouchCancelled", arg_13_0.touchCancelledRef)
end

function var_0_5.onTouchBegan(arg_14_0, arg_14_1, arg_14_2)
	if not tool.checkIfTouch(arg_14_0.view.widgets.bg, arg_14_1, arg_14_2) then
		arg_14_0:removeFromParentAndCleanup(true)
	end
end

function var_0_5.onTouchMoved(arg_15_0, arg_15_1, arg_15_2)
	return
end

function var_0_5.onTouchEnded(arg_16_0, arg_16_1, arg_16_2)
	return
end

function var_0_5.onTouchCancelled(arg_17_0, arg_17_1, arg_17_2)
	return
end

return var_0_5
