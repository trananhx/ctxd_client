local var_0_0 = class("Invite", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0)
	arg_2_0.control = require("lua/layer/playerInfo2/invite/control").new(arg_2_0)
	arg_2_0.uiTable = autoUI.initUI(arg_2_0, require("lua/layer/playerInfo2/invite/uidata"))

	arg_2_0.uiTable.copy:registerScriptTapHandler(function()
		arg_2_0.control:copyToClipboard()
	end)
	arg_2_0.uiTable.share:registerScriptTapHandler(function()
		arg_2_0.control:share()
	end)
	arg_2_0.control:getInviteInfo()
end

local var_0_1 = {
	"icon_silver.png",
	"icon_wood.png",
	"icon_food.png",
	"icon_iron.png",
	[19] = "icon_gold.png"
}

local function var_0_2(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0 / 1000

	if var_5_0 < 3600 then
		arg_5_1:setString("")

		local var_5_1 = createTimerLabel(var_5_0 * 1000, language.get(131003), "Thonburi", 28, nil, nil, nil, ccc3(255, 0, 0))

		arg_5_1:addChild(var_5_1)
	elseif var_5_0 < 86400 then
		local var_5_2 = var_5_0 / 3600

		arg_5_1:setString(language.get(131001, tool.toint(var_5_2)))
	else
		local var_5_3 = var_5_0 / 3600 / 24

		arg_5_1:setString(language.get(131002, tool.toint(var_5_3)))
	end
end

function var_0_0.init(arg_6_0)
	if arg_6_0.control.data.activityLastTime and arg_6_0.control.data.activityLastTime > 0 then
		var_0_2(arg_6_0.control.data.activityLastTime, arg_6_0.uiTable.leftTime)
	end

	arg_6_0.uiTable.code:setString(arg_6_0.control.inviteCode)

	local var_6_0 = {}
	local var_6_1 = {
		19,
		1,
		2,
		3,
		4
	}

	for iter_6_0, iter_6_1 in pairs(var_6_1) do
		for iter_6_2, iter_6_3 in pairs(arg_6_0.control.data.rewards) do
			if iter_6_3.type == iter_6_1 then
				var_6_0[#var_6_0 + 1] = iter_6_3
			end
		end
	end

	for iter_6_4, iter_6_5 in pairs(var_6_0) do
		arg_6_0.uiTable["rewardIcon_" .. iter_6_4]:setDisplayFrame(CCSprite:createWithSpriteFrameName(var_0_1[iter_6_5.type]):displayFrame())
		arg_6_0.uiTable["rewardValue_" .. iter_6_4]:setString(tostring(iter_6_5.value))
	end
end

return var_0_0
