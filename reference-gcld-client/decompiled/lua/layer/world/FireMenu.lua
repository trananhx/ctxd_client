local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = ccc3(0, 180, 0)
local var_0_2 = colorQuality[5]
local var_0_3 = colorQuality[4]
local var_0_4 = colorQuality[2]
local var_0_5 = class("FireMenu", function()
	return CCNode:create()
end)

var_0_5.layout1 = {
	x = 0,
	name = "node",
	y = 0,
	type = "node",
	scale = 0.8,
	children = {
		{
			zoomOnTouchDown = true,
			name = "btn",
			h = 72,
			type = "button",
			w = 73,
			y = 0,
			x = 0,
			normal = {
				path = "res/ui/resourceArea2/zcgz_btn_round.png"
			},
			touched = {
				path = "res/ui/resourceArea2/zcgz_btn_round_c.png"
			},
			children = {
				{
					y = 36,
					name = "icon",
					type = "sprite",
					x = 36,
					pic = {
						path = "res/ui/world/fire/gzjc_btn_icon_h.png"
					}
				},
				{
					fontSize = 22,
					name = "num",
					y = 15,
					type = "label",
					x = 36
				}
			}
		}
	}
}
var_0_5.layout2 = {
	x = 0,
	name = "node",
	y = 0,
	type = "node",
	scale = 0.8,
	children = {
		{
			zoomOnTouchDown = true,
			name = "btn",
			h = 72,
			type = "button",
			w = 73,
			y = 0,
			x = 0,
			normal = {
				path = "res/ui/resourceArea2/zcgz_btn_round.png"
			},
			touched = {
				path = "res/ui/resourceArea2/zcgz_btn_round_c.png"
			},
			children = {
				{
					x = 36,
					name = "bar",
					y = 36,
					type = "progressbar",
					progressType = kCCProgressTimerTypeRadial,
					pic = {
						path = "res/ui/world/fire/gzjc_btn_bar.png"
					}
				},
				{
					y = 36,
					name = "icon",
					type = "sprite",
					x = 36,
					pic = {
						path = "res/ui/world/fire/gzjc_btn_icon_s.png"
					}
				},
				{
					y = -8,
					name = "bg_num",
					type = "sprite",
					scaleX = 0.8,
					x = 36,
					pic = {
						frame = true,
						path = "cc_view_bg.png"
					}
				},
				{
					fontSize = 22,
					name = "num",
					y = -8,
					type = "label",
					x = 36
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
			width = 400,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_0
		}
	}
}

function var_0_5.showTip(arg_2_0)
	log.info("should show tips ")

	local var_2_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_2_0:registerScriptTouchHandler(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == CCTOUCHBEGAN then
			return true
		elseif arg_3_0 == CCTOUCHMOVED then
			return true
		elseif arg_3_0 == CCTOUCHENDED then
			pcall(var_2_0.removeFromParentAndCleanup, var_2_0, true)

			return true
		end
	end, false, true)
	var_2_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_2_0, 60000)

	local var_2_1 = 0
	local var_2_2 = 0
	local var_2_3 = {}

	uiutil.initWidgets(var_2_3, arg_2_0.tipFrame)
	var_2_0:addChild(var_2_3.widgets.tipFrame)

	local var_2_4 = arg_2_0.view.widgets.btn
	local var_2_5
	local var_2_6 = arg_2_0.info.leftLitFireTimes and 490126 or 490127

	var_2_3.widgets.tipMsg:setString(language.get(var_2_6))

	local var_2_7, var_2_8 = tool.getPositionInScreen(var_2_4)
	local var_2_9 = var_2_7 + 20
	local var_2_10 = var_2_8 + 20
	local var_2_11 = var_2_3.widgets.tipMsg:getContentSize().width
	local var_2_12 = var_2_3.widgets.tipMsg:getContentSize().height

	var_2_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_2_11 + 30, var_2_12 + 30))
	var_2_3.widgets.tipFrame:setPosition(ccp(var_2_9, var_2_10))
	var_2_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_2_3.widgets.tipFrame:setVisible(true)
end

function var_0_5.showPanel(arg_4_0, arg_4_1)
	arg_4_0.info = arg_4_1

	if arg_4_1.leftLitFireTimes then
		arg_4_0.view.widgets.num:setString(language.get(490026, arg_4_1.leftLitFireTimes))
	else
		local var_4_0 = arg_4_1.maxHp - arg_4_1.hp

		arg_4_0.view.widgets.num:setString(language.get(390478, var_4_0, arg_4_1.maxHp))

		local var_4_1 = 100 * (var_4_0 / arg_4_1.maxHp)

		if var_4_1 <= 2 then
			var_4_1 = 2
		end

		arg_4_0.view.widgets.bar:setPercentage(var_4_1)
	end
end

function var_0_5.ctor(arg_5_0, arg_5_1)
	log.info("@@ 火计")

	arg_5_0.view = {}

	if arg_5_1.leftLitFireTimes then
		uiutil.initWidgets(arg_5_0.view, arg_5_0.layout1)
	else
		uiutil.initWidgets(arg_5_0.view, arg_5_0.layout2)
		arg_5_0.view.widgets.bar:setMidpoint(ccp(0.5, 0.5))
	end

	arg_5_0:addChild(arg_5_0.view.widgets.node)
	arg_5_0.view.widgets.btn:addHandleOfControlEvent(function()
		log.info("btn")
		arg_5_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_5_0:showPanel(arg_5_1)
end

return var_0_5
