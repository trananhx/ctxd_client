local var_0_0 = require("res/native/offset").get("layer.activity.GemBonus.GemBonusTab")
local var_0_1 = colorQuality[0]
local var_0_2 = tool.hexToRgb("#D9EDC5")
local var_0_3 = ccc3(0, 180, 0)
local var_0_4 = colorQuality[5]
local var_0_5 = colorQuality[4]
local var_0_6 = colorQuality[2]
local var_0_7 = class("GemBonus", function()
	return createBaseLayer()
end)

var_0_7.layout = {
	y = 0,
	name = "Scene",
	type = "node",
	x = 0,
	children = {
		{
			name = "bg",
			type = "sprite9",
			preferedSize = CCSizeMake(960, 580),
			middleRect = CCRectMake(30, 30, 45, 45),
			x = visibleSize.width / 2,
			y = visibleSize.height / 2 - 30,
			pic = {
				frame = true,
				path = "bigPanel.png"
			},
			children = {
				{
					y = 290,
					name = "panel",
					type = "sprite",
					x = 480,
					pic = {
						path = "res/ui/comment/bg1.jpg"
					},
					children = {
						{
							y = 190,
							x = 580,
							type = "sprite",
							scale = 0.7,
							pic = {
								path = "res/ui/nationTask/building/huawen_01.png"
							}
						},
						{
							y = 385,
							type = "sprite9",
							x = 460,
							preferedSize = CCSizeMake(1000, 80),
							middleRect = CCRectMake(200, 20, 460, 78),
							pic = {
								path = "res/ui/world/cityCombo/lxzc_bg4.png"
							}
						},
						{
							y = 265,
							x = 140,
							type = "sprite",
							pic = {
								path = "res/ui/comment/xiaoqian.png"
							}
						},
						{
							y = 475,
							x = 520,
							type = "sprite",
							pic = {
								path = "res/ui/activity/gemBonus/zydfs_title.png"
							}
						},
						{
							y = 390,
							x = 520,
							type = "sprite",
							pic = {
								path = "res/ui/activity/gemBonus/zydfs_word_01.png"
							}
						},
						{
							fontSize = 25,
							name = "leftTime",
							type = "label",
							x = 790,
							color = var_0_4,
							y = 470 + (var_0_0.timeLeftY or 0)
						}
					}
				},
				{
					x = 924,
					name = "btn_close",
					h = 33,
					type = "button",
					w = 32,
					y = 604,
					scale = 2,
					normal = {
						frame = true,
						path = "btn_close_a.png"
					},
					touched = {
						frame = true,
						path = "btn_close_click.png"
					}
				}
			}
		}
	}
}
var_0_7.layout_army = {
	zoomOnTouchDown = true,
	name = "btn_army",
	h = 70,
	type = "button",
	w = 190,
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
			y = 35,
			name = "node",
			type = "node",
			x = 20,
			children = {
				{
					y = 0,
					name = "icon",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/activity/gemsActivity/new/gem_a1.png"
					}
				},
				{
					y = 0,
					name = "mark",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/activity/gemBonus/zydfs_icon_symbol.png"
					}
				},
				{
					height = 0,
					name = "info",
					type = "label",
					width = 150,
					y = 0,
					x = 25,
					fontSize = 22 + (var_0_0.infoFntSize or 0),
					anchorPoint = ccp(0, 0.5),
					halign = kCCTextAlignmentLeft
				}
			}
		}
	}
}

local function var_0_8(arg_2_0, arg_2_1)
	local var_2_0, var_2_1 = arg_2_1:getPosition()

	arg_2_1:setPosition(ccp(var_2_0 - 20, var_2_1))

	local var_2_2 = arg_2_0 / 1000

	if var_2_2 < 3600 then
		arg_2_1:setString("")

		local var_2_3 = createTimerLabel(var_2_2 * 1000, language.get(131003), "Thonburi", 25, nil, nil, nil, var_0_4)

		arg_2_1:addChild(var_2_3)
	elseif var_2_2 < 86400 then
		local var_2_4 = var_2_2 / 3600

		arg_2_1:setString(language.get(131001, tool.toint(var_2_4)))
	else
		local var_2_5 = var_2_2 / 3600 / 24

		arg_2_1:setString(language.get(131002, tool.toint(var_2_5)))
	end
end

function var_0_7.refresh(arg_3_0)
	local function var_3_0(arg_4_0)
		arg_3_0:showPanel(arg_4_0.action.data)
	end

	cmgr.sendRequest(var_3_0, actions.getGemBonusInfo)
end

function var_0_7.showPanel(arg_5_0, arg_5_1)
	arg_5_0.info = arg_5_1

	var_0_8(arg_5_1.leftTime, arg_5_0.view.widgets.leftTime)

	if arg_5_0.armyNode then
		arg_5_0.armyNode:removeAllChildrenWithCleanup(true)
	else
		arg_5_0.armyNode = CCNode:create()

		arg_5_0.view.widgets.panel:addChild(arg_5_0.armyNode, 100)
	end

	table.sort(arg_5_1.gemBonuses, function(arg_6_0, arg_6_1)
		return arg_6_0.openLv < arg_6_1.openLv
	end)

	for iter_5_0 = 1, 9 do
		local var_5_0 = arg_5_1.gemBonuses[iter_5_0]

		if var_5_0 then
			local var_5_1 = 400 + 200 * ((iter_5_0 - 1) % 3)
			local var_5_2 = 280 - 100 * math.floor((iter_5_0 - 1) / 3)
			local var_5_3 = {}

			uiutil.initWidgets(var_5_3, arg_5_0.layout_army)
			var_5_3.widgets.btn_army:setPosition(ccp(var_5_1, var_5_2))
			arg_5_0.view.widgets.panel:addChild(var_5_3.widgets.btn_army)
			var_5_3.widgets.mark:setVisible(var_5_0.canAttack)
			var_5_3.widgets.btn_army:addHandleOfControlEvent(function()
				log.info("btn_army" .. iter_5_0)
				smgr.changeScene(SCENE_INSTANCE, var_5_0.powerId)
			end, CCControlEventTouchUpInside)

			local var_5_4 = string.format("%s-%s", var_5_0.powerName, var_5_0.armyName)
			local var_5_5 = var_0_3

			if user.player.playerLv >= var_5_0.openLv or var_5_0.canAttack then
				var_5_3.widgets.btn_army:setEnabled(true)
			else
				var_5_3.widgets.btn_army:setEnabled(false)

				var_5_4 = var_5_4 .. "\n" .. language.get(135660, var_5_0.openLv)
				var_5_5 = var_0_1
			end

			var_5_3.widgets.info:setString(var_5_4)
			var_5_3.widgets.info:setColor(var_5_5)
		end
	end
end

function var_0_7.ctor(arg_8_0, arg_8_1)
	arg_8_0.view = {}

	uiutil.initWidgets(arg_8_0.view, arg_8_0.layout)
	arg_8_0:addChild(arg_8_0.view.widgets.Scene)

	if arg_8_1 then
		arg_8_1:addChild(arg_8_0)
	end

	swallowTouch(arg_8_0)
	arg_8_0.view.widgets.btn_close:addHandleOfControlEvent(function()
		log.info("btn_close")
		arg_8_0:removeFromParentAndCleanup(true)
	end, CCControlEventTouchUpInside)
	arg_8_0:refresh()
end

return var_0_7
