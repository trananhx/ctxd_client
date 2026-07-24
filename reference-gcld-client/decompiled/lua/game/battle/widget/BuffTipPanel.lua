local var_0_0 = {}

var_0_0.buffHeight = 24
var_0_0.layout = {
	parent = "uiLayer",
	widgets = {
		{
			name = "panel",
			type = "sprite9",
			zorder = 10000,
			y = 485,
			x = 315,
			middleRect = CCRectMake(0, 0, 0, 0),
			preferedSize = CCSizeMake(550, 165),
			pic = {
				frame = true,
				path = "common_tip_frame_small.png"
			},
			anchorPoint = ccp(0, 1),
			children = {}
		}
	}
}

function var_0_0.create(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {}

	if conf.language == "vie" then
		var_1_0.panelSize = 120
		var_1_0.bufFontSize = -4
		var_1_0.defenseTipFramePosX = -25
	else
		var_1_0.panelSize = 0
		var_1_0.bufFontSize = 0
		var_1_0.defenseTipFramePosX = 0
	end

	arg_1_0:destory()

	arg_1_0.view = {}

	if arg_1_1 and #arg_1_1 > 0 then
		uiutil.initLayout(arg_1_0.view, var_0_0.layout)

		if arg_1_2 == "att" then
			arg_1_0.view.widgets.panel:setAnchorPoint(ccp(0, 1))
			arg_1_0.view.widgets.panel:setPosition(ccp(75, visibleSize.height - 75))
		else
			arg_1_0.view.widgets.panel:setAnchorPoint(ccp(1, 0))
			arg_1_0.view.widgets.panel:setPosition(ccp(visibleSize.width - 75 + var_1_0.defenseTipFramePosX, 75))
		end

		local var_1_1 = #arg_1_1 + 1
		local var_1_2 = 520 + var_1_0.panelSize
		local var_1_3 = var_1_1 * 22 + 34 + (var_1_1 - 1) * 5
		local var_1_4 = 28
		local var_1_5 = var_1_3 - 17 - 11

		arg_1_0.view.widgets.panel:setPreferredSize(CCSizeMake(var_1_2, var_1_3))

		local var_1_6 = CCStrokeLabelTTF:create(language.get(190500), "Thonburi", 22)

		var_1_6:setAnchorPoint(ccp(0, 0.5))
		var_1_6:setPosition(ccp(var_1_4, var_1_5))

		local var_1_7 = var_1_5 - 22 - 5

		arg_1_0.view.widgets.panel:addChild(var_1_6)

		for iter_1_0, iter_1_1 in pairs(arg_1_1) do
			local var_1_8 = string.format("fightBuff_%s.png", iter_1_1.id)
			local var_1_9 = CCSprite:createWithSpriteFrameName(var_1_8)

			if tonumber(iter_1_1.id) >= 62 and tonumber(iter_1_1.id) <= 65 then
				var_1_9 = CCSprite:create("res/ui/farm/tuntian_buff.jpg")
			end

			if tonumber(iter_1_1.id) >= 70 and tonumber(iter_1_1.id) <= 73 then
				iter_1_1.tip = string.gsub(iter_1_1.tip, "\n", "：")
			end

			if tonumber(iter_1_1.id) == 74 then
				var_1_9 = CCSprite:createWithSpriteFrameName("fightBuff_fc3.png")
			end

			if tonumber(iter_1_1.id) >= 81 and tonumber(iter_1_1.id) <= 84 then
				var_1_9 = CCSprite:create("res/ui/offlineBuff/lx_buff_fight_0" .. tonumber(iter_1_1.id) - 80 .. ".png")
			end

			var_1_9:setPosition(ccp(var_1_4, var_1_7))

			local var_1_10 = CCStrokeLabelTTF:create(tostring(iter_1_1.tip), "Thonburi", 22 + var_1_0.bufFontSize)

			var_1_10:setAnchorPoint(ccp(0, 0.5))
			var_1_10:setPosition(ccp(var_1_4 + 11 + 17, var_1_7))

			var_1_7 = var_1_7 - 22 - 5

			arg_1_0.view.widgets.panel:addChild(var_1_9)
			arg_1_0.view.widgets.panel:addChild(var_1_10)
		end

		local function var_1_11(arg_2_0, arg_2_1, arg_2_2)
			if arg_2_0 == CCTOUCHBEGAN and not checkIfTouch(arg_1_0.view.widgets.panel, arg_2_1, arg_2_2) then
				arg_1_0:destory()
			end
		end

		arg_1_0.view.widgets.panel:registerScriptTouchHandler(var_1_11)
		arg_1_0.view.widgets.panel:setTouchEnabled(true)
	end
end

function var_0_0.destory(arg_3_0)
	if arg_3_0.view and arg_3_0.view.widgets then
		smgr.getLayer("uiLayer"):removeChild(arg_3_0.view.widgets.panel, true)
	end
end

return var_0_0
