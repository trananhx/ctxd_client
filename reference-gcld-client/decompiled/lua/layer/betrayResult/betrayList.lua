local var_0_0 = class("BetrayList", function()
	return createBaseLayer()
end)

var_0_0.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = false,
		path = "res/ui/activity/betray/zyzh_bg2.jpg"
	},
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {}
}

function var_0_0.getListCardUI(arg_2_0, arg_2_1)
	local var_2_0 = #arg_2_0.info.playerList
	local var_2_1 = arg_2_0.info.playerList[arg_2_1]

	if var_2_0 < 6 then
		var_2_0 = 6
	end

	local var_2_2 = 15 + (arg_2_1 % 2 == 0 and 447 or 0)
	local var_2_3 = 8 + 123 * (math.ceil(var_2_0 / 2) - math.ceil(arg_2_1 / 2))
	local var_2_4 = user.forceIdToName[arg_2_0.info.eventForceId]
	local var_2_5 = user.forceIdToName[var_2_1.toForceId]
	local var_2_6 = colorForce[arg_2_0.info.eventForceId]
	local var_2_7 = colorForce[var_2_1.toForceId]

	return {
		name = "card",
		type = "sprite",
		pic = {
			frame = false,
			path = "res/ui/rankInfo/DailyFeatView/gxb_ph_bg.png"
		},
		anchorPoint = ccp(0, 0),
		x = var_2_2,
		y = var_2_3,
		children = {
			{
				x = 274,
				y = 29,
				type = "sprite",
				pic = {
					frame = false,
					path = "res/ui/rankInfo/DailyFeatView/gxb_ph_bg2.png"
				}
			},
			{
				x = 59,
				y = 57,
				type = "sprite",
				pic = {
					frame = false,
					path = "res/ui/common/playerHead/playerHead_icon_" .. var_2_1.playerPic .. ".png"
				}
			},
			{
				y = 85,
				x = 145,
				scale = 0.6,
				type = "sprite",
				pic = {
					frame = false,
					path = "res/ui/playerInfo/role_nation_view.png"
				}
			},
			{
				fontSize = 25,
				y = 85,
				type = "label",
				x = 145,
				text = var_2_4,
				color = var_2_6
			},
			{
				y = 30,
				x = 210,
				scale = 0.6,
				type = "sprite",
				pic = {
					frame = false,
					path = "res/ui/playerInfo/role_nation_view.png"
				}
			},
			{
				fontSize = 25,
				y = 30,
				type = "label",
				x = 210,
				text = var_2_5,
				color = var_2_7
			}
		}
	}
end

function var_0_0.addList(arg_3_0)
	if arg_3_0.listLayer then
		arg_3_0.listLayer:removeAllChildrenWithCleanup(true)
	else
		local var_3_0 = CCLayerColor:create(ccc4(0, 255, 0, 0), 909, 370)
		local var_3_1 = CCScrollView:create(CCSizeMake(915, 370), var_3_0)

		var_3_1:setPosition(ccp(3, 5))
		var_3_1:setDirection(kCCScrollViewDirectionVertical)
		arg_3_0.view.widgets.panel:addChild(var_3_1, 200)

		arg_3_0.listLayer = var_3_0
		arg_3_0.scrollView = var_3_1
	end

	local var_3_2 = 123 * (#arg_3_0.info.playerList >= 5 and math.ceil(#arg_3_0.info.playerList / 2) or 3)

	arg_3_0.listLayer:setContentSize(CCSizeMake(909, var_3_2))
	arg_3_0.scrollView:setContentSize(CCSizeMake(909, var_3_2))
	arg_3_0.scrollView:setContentOffset(ccp(0, arg_3_0.scrollView:minContainerOffset().y))

	for iter_3_0 = 1, #arg_3_0.info.playerList do
		local var_3_3 = {}

		uiutil.initWidgets(var_3_3, arg_3_0:getListCardUI(iter_3_0))
		arg_3_0.listLayer:addChild(var_3_3.widgets.card)

		local var_3_4 = arg_3_0.info.playerList[iter_3_0]
		local var_3_5 = var_3_3.widgets.card
		local var_3_6 = CCLabelTTF:create(var_3_4.playerName, "", 24)

		var_3_6:setColor(tool.hexToRgb("#EBD1A7"))
		var_3_6:setAnchorPoint(ccp(0, 0.5))
		var_3_6:setPosition(ccp(170, 85))
		var_3_5:addChild(var_3_6)

		local var_3_7 = CCLabelTTF:create(language.get(111022, var_3_4.playerLevel), "", 24)

		var_3_7:setColor(tool.hexToRgb("#A69265"))
		var_3_7:setAnchorPoint(ccp(1, 0.5))
		var_3_7:setPosition(ccp(420, 85))
		var_3_5:addChild(var_3_7)

		local var_3_8 = CCLabelTTF:create(language.get(135405), "", 24)

		var_3_8:setColor(tool.hexToRgb("#A69265"))
		var_3_8:setAnchorPoint(ccp(0, 0.5))
		var_3_8:setPosition(ccp(130, 30))
		var_3_5:addChild(var_3_8)
	end
end

function var_0_0.showPanel(arg_4_0, arg_4_1)
	arg_4_0.info = arg_4_1

	arg_4_0:addList()
end

function var_0_0.ctor(arg_5_0, arg_5_1, arg_5_2)
	log.info("@@ 转换名单")

	arg_5_0.view = {}

	uiutil.initWidgets(arg_5_0.view, arg_5_0.layout)

	if arg_5_1 then
		arg_5_0:addChild(arg_5_0.view.widgets.panel)
		arg_5_1:addChild(arg_5_0)
	end

	arg_5_0:showPanel(arg_5_2)
end

function var_0_0.onEnter(arg_6_0)
	return
end

function var_0_0.onExit(arg_7_0)
	if user.alreadyShowBetrayResult then
		return
	end

	if arg_7_0.info.eventForceId == user.player.forceId then
		roleDialogue.control.loadSpeak(1515)

		user.alreadyShowBetrayResult = true
	end
end

return var_0_0
