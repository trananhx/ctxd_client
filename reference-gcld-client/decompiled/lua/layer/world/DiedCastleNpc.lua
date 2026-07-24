local var_0_0 = {
	"perishCd",
	"nextProduceTroopCd"
}
local var_0_1 = colorQuality[1]
local var_0_2 = ccc3(0, 180, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = ccc3(255, 255, 0)
local var_0_5 = colorQuality[2]
local var_0_6 = colorQuality[6]
local var_0_7 = class("DiedCastleNpc", function()
	return CCNode:create()
end)

var_0_7.layout_arrow = {
	y = 0,
	name = "node_arrow",
	type = "node",
	x = 0,
	children = {
		{
			y = 0,
			name = "arrow",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/activity/goldActivity/myRedBag/wdhb_arrows.png"
			}
		},
		{
			fontSize = 20,
			name = "nextProduceTroopCd",
			style = "label_warlock",
			type = "label",
			y = 0,
			x = -70,
			color = var_0_4,
			anchorPoint = ccp(0, 0.5)
		}
	}
}
var_0_7.layout_bar = {
	y = 0,
	name = "node_bar",
	type = "node",
	x = 0,
	children = {
		{
			y = 22,
			name = "bg_title",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/weapon/godWeapon/sbxt_word_d.png"
			}
		},
		{
			y = 0,
			name = "bg_bar",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/world/manzu/zymz_pb_bg.png"
			},
			children = {
				{
					y = 0,
					name = "bar",
					type = "progressbar",
					x = 0,
					anchorPoint = ccp(0, 0),
					pic = {
						path = "res/ui/kfyz/zymz_pb_zheng.png"
					}
				},
				{
					fontSize = 20,
					name = "perishCd",
					style = "label_warlock",
					type = "label",
					y = 12,
					x = 97,
					color = var_0_1
				}
			}
		},
		{
			fontSize = 22,
			y = 24,
			type = "label",
			x = 0,
			textId = 491063,
			color = var_0_4
		}
	}
}

function var_0_7.showPanel(arg_2_0, arg_2_1)
	arg_2_0.info = arg_2_1

	local var_2_0 = smgr.getLayer("worldCamera")
	local var_2_1, var_2_2 = var_2_0.cityTable["world_building_" .. arg_2_1.cityId].sprite:getPosition()

	arg_2_0.view.widgets.node_bar:setPosition(var_2_1, var_2_2 + 70)
	arg_2_0.view.widgets.perishCd:stopAllActions()

	if arg_2_1.perishCd and arg_2_1.perishCd > 0 then
		local var_2_3 = CCArray:create()

		var_2_3:addObject(CCCallFuncN:create(function()
			if arg_2_1.perishCd <= 0 then
				arg_2_0.view.widgets.perishCd:stopAllActions()
				arg_2_0:removeFromParentAndCleanup(true)

				worldUI.diedCastleNpcTable[arg_2_1.cityId] = nil
			else
				arg_2_0.view.widgets.perishCd:setString(tool.getFormatTime(arg_2_1.perishCd))
				arg_2_0.view.widgets.bar:setPercentage(100 * (arg_2_1.perishCd / arg_2_1.totalExistTime))
			end
		end))
		var_2_3:addObject(CCDelayTime:create(0.5))

		local var_2_4 = CCSequence:create(var_2_3)

		arg_2_0.view.widgets.perishCd:runAction(CCRepeatForever:create(var_2_4))
	end

	arg_2_0.view.widgets.node_arrow:setVisible(false)
	arg_2_0.view.widgets.nextProduceTroopCd:stopAllActions()

	local var_2_5 = arg_2_1.produceTargetCityId ~= nil
	local var_2_6
	local var_2_7
	local var_2_8

	if var_2_5 then
		local var_2_9, var_2_10 = var_2_0.cityTable["world_building_" .. arg_2_1.produceTargetCityId].sprite:getPosition()

		var_2_6, var_2_7, var_2_8 = var_0_3, var_2_9, var_2_10

		if arg_2_1.nextProduceTroopCd and arg_2_1.nextProduceTroopCd > 0 then
			local var_2_11 = CCArray:create()

			var_2_11:addObject(CCCallFuncN:create(function()
				if arg_2_1.nextProduceTroopCd <= 0 then
					arg_2_0.view.widgets.nextProduceTroopCd:stopAllActions()
					arg_2_0.view.widgets.node_arrow:setVisible(false)
				else
					local var_4_0 = language.get(arg_2_1.forceId == user.player.forceId and 491067 or 491068, math.ceil(arg_2_1.nextProduceTroopCd / 1000))

					arg_2_0.view.widgets.nextProduceTroopCd:setString(var_4_0)
				end
			end))
			var_2_11:addObject(CCDelayTime:create(0.5))

			local var_2_12 = CCSequence:create(var_2_11)

			arg_2_0.view.widgets.nextProduceTroopCd:runAction(CCRepeatForever:create(var_2_12))
		end
	else
		var_2_6, var_2_7, var_2_8 = var_0_1, var_2_1, var_2_2

		arg_2_0.view.widgets.nextProduceTroopCd:setString(language.get(491069))
	end

	arg_2_0.view.widgets.arrow:setColor(var_2_6)
	arg_2_0.view.widgets.node_arrow:setPosition(var_2_7 + 220, var_2_8)
	arg_2_0.view.widgets.node_arrow:setVisible(true)
end

function var_0_7.ctor(arg_5_0, arg_5_1)
	log.info("@@ 死士")
	initScriptEventNode(arg_5_0)

	arg_5_0.view = {}

	uiutil.initWidgets(arg_5_0.view, arg_5_0.layout_arrow)
	arg_5_0:addChild(arg_5_0.view.widgets.node_arrow)
	uiutil.initWidgets(arg_5_0.view, arg_5_0.layout_bar)
	arg_5_0:addChild(arg_5_0.view.widgets.node_bar)
	arg_5_0.view.widgets.bg_title:setColor(var_0_6)
	arg_5_0.view.widgets.arrow:setScaleX(-0.9)
	arg_5_0.view.widgets.arrow:setScaleY(0.7)

	local var_5_0 = CCMoveBy:create(0.6, ccp(-30, 0))
	local var_5_1 = CCEaseOut:create(var_5_0, 1)
	local var_5_2 = CCMoveBy:create(0.6, ccp(30, 0))
	local var_5_3 = CCEaseIn:create(var_5_2, 1)
	local var_5_4 = CCArray:create()

	var_5_4:addObject(var_5_1)
	var_5_4:addObject(var_5_3)

	local var_5_5 = CCSequence:create(var_5_4)
	local var_5_6 = CCRepeatForever:create(var_5_5)

	arg_5_0.view.widgets.node_arrow:runAction(var_5_6)
	arg_5_0:showPanel(arg_5_1)
end

function var_0_7.onEnter(arg_6_0)
	arg_6_0.updateRef = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_6_0, arg_6_0.update), 0, false)
end

function var_0_7.onExit(arg_7_0)
	if arg_7_0.updateRef then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_7_0.updateRef)
	end
end

function var_0_7.update(arg_8_0, arg_8_1)
	if arg_8_0.info then
		for iter_8_0, iter_8_1 in ipairs(var_0_0) do
			if arg_8_0.info[iter_8_1] then
				if arg_8_0.info[iter_8_1] > 0 then
					arg_8_0.info[iter_8_1] = arg_8_0.info[iter_8_1] - 1000 * arg_8_1
				elseif arg_8_0.info[iter_8_1] <= 0 then
					arg_8_0.info[iter_8_1] = 0
				end
			end
		end
	end
end

return var_0_7
