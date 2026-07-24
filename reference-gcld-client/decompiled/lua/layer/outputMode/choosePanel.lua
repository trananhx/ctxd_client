local var_0_0 = class("ChoosePanel", function()
	return createBaseLayer()
end)
local var_0_1 = {
	"res/ui/task/get_icon_silver.png",
	"res/ui/task/get_icon_wood.png",
	"res/ui/task/get_icon_food.png",
	"res/ui/task/get_icon_iron.png",
	"res/ui/task/get_icon_soldier.png"
}
local var_0_2 = {
	{
		"profit_1d_2.png",
		"profit_7d_2.png",
		"profit_30d_2.png"
	},
	{
		"profit_1d_3.png",
		"profit_7d_3.png",
		"profit_30d_3.png"
	},
	{
		"profit_1d_6.png",
		"profit_7d_6.png",
		"profit_30d_6.png"
	}
}
local var_0_3 = {
	language.get(250001),
	language.get(250002),
	language.get(250003),
	language.get(250004),
	(language.get(250005))
}
local var_0_4 = {
	[100] = colorText[10002],
	[150] = colorQuality[2],
	[200] = colorQuality[4],
	[300] = colorQuality[6]
}
local var_0_5 = {
	1,
	7,
	30
}
local var_0_6 = {
	"150%",
	"200%",
	"300%"
}
local var_0_7 = {
	{
		{
			8,
			44,
			168
		},
		{
			16,
			89,
			336
		},
		{
			40,
			224,
			840
		}
	},
	{
		{
			8,
			44,
			168
		},
		{
			16,
			89,
			336
		},
		{
			40,
			224,
			840
		}
	},
	{
		{
			8,
			44,
			168
		},
		{
			16,
			89,
			336
		},
		{
			40,
			224,
			840
		}
	},
	{
		{
			8,
			44,
			168
		},
		{
			16,
			89,
			336
		},
		{
			40,
			224,
			840
		}
	},
	{
		{
			4,
			22,
			84
		},
		{
			8,
			44,
			168
		}
	}
}

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.timeType = arg_2_1.timeType and arg_2_1.timeType > 0 and arg_2_1.timeType or 1
	arg_2_0.resType = arg_2_1.resType
	arg_2_0.additionMode = arg_2_1.additionMode and arg_2_1.additionMode > 0 and arg_2_1.additionMode or 1
	arg_2_0.additionCd = arg_2_1.additionCd
	arg_2_0.additionRate = arg_2_1.additionRate
	arg_2_0.tabNum = arg_2_0.resType == 5 and 2 or 3

	arg_2_0:setTouchEnabled(true)
	arg_2_0:registerScriptTouchHandler(function(arg_3_0, arg_3_1, arg_3_2)
		return arg_2_0:onTouch(arg_3_0, arg_3_1, arg_3_2)
	end)

	arg_2_0.uidata = require("lua/layer/outputMode/choosePanelUiData").new()

	arg_2_0:getAdditionPrice()
end

function var_0_0.init(arg_4_0)
	local function var_4_0(arg_5_0, arg_5_1)
		local var_5_0, var_5_1 = arg_5_1:getPosition()

		arg_5_1:setPosition(ccp(var_5_0 - 20, var_5_1))

		local var_5_2 = arg_5_0 / 1000

		if var_5_2 <= 0 then
			arg_5_1:setString(language.get(250006))
		elseif var_5_2 < 86400 then
			arg_5_1:setString("")

			local var_5_3 = createTimerLabel(var_5_2 * 1000, "@H:@M:@S", "Thonburi", 22, nil, nil, nil, colorQuality[5])

			var_5_3:setPosition(ccp(30, 0))
			arg_5_1:addChild(var_5_3)
		else
			local var_5_4 = var_5_2 / 3600 / 24
			local var_5_5 = math.ceil(var_5_4)

			arg_5_1:setString(language.get(250007, tool.toint(var_5_5)))
		end
	end

	arg_4_0.uiTable = autoUI.initUI(arg_4_0, arg_4_0.uidata:getData())

	for iter_4_0 = 1, arg_4_0.tabNum do
		arg_4_0.uiTable["resIcon_" .. iter_4_0]:setDisplayFrame(CCSprite:create(var_0_1[arg_4_0.resType]):displayFrame())
	end

	if arg_4_0.resType == 5 then
		arg_4_0.uiTable.tab_3:setVisible(false)
	end

	for iter_4_1 = 1, 3 do
		arg_4_0.uiTable["button_" .. iter_4_1]:registerScriptTapHandler(arg_4_0:chooseMode(iter_4_1))
	end

	arg_4_0:clickOnIndex(arg_4_0.additionMode)
	arg_4_0.uiTable.rate:setString(tostring(arg_4_0.additionRate * 100) .. "%↑")
	arg_4_0.uiTable.rate:setColor(var_0_4[arg_4_0.additionRate * 100])
	var_4_0(arg_4_0.additionCd, arg_4_0.uiTable.timer)
end

function var_0_0.clickOnIndex(arg_6_0, arg_6_1)
	arg_6_0.curIndex = arg_6_1

	for iter_6_0 = 1, arg_6_0.tabNum do
		if iter_6_0 == arg_6_1 then
			arg_6_0.uiTable["tab_" .. iter_6_0]:setDisplayFrame(tool.spriteFrameByName("profit_navi_view_on.png"))
		else
			arg_6_0.uiTable["tab_" .. iter_6_0]:setDisplayFrame(tool.spriteFrameByName("profit_navi_view_bg.png"))
		end
	end

	for iter_6_1 = 1, 3 do
		arg_6_0.uiTable["day_" .. iter_6_1]:setDisplayFrame(tool.spriteFrameByName(var_0_2[arg_6_1][iter_6_1]))
		arg_6_0.uiTable["day_on_" .. iter_6_1]:setDisplayFrame(tool.spriteFrameByName(var_0_2[arg_6_1][iter_6_1]))
		arg_6_0.uiTable["gold_" .. iter_6_1]:setString(tostring(var_0_7[arg_6_0.resType][arg_6_1][iter_6_1]))
		arg_6_0.uiTable["gold_on_" .. iter_6_1]:setString(tostring(var_0_7[arg_6_0.resType][arg_6_1][iter_6_1]))
	end

	arg_6_0.uiTable.desc:setString(language.get(250008, var_0_3[arg_6_0.resType], var_0_6[arg_6_1]))
end

function var_0_0.onTouch(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	if arg_7_1 == CCTOUCHBEGAN then
		for iter_7_0 = 1, arg_7_0.tabNum do
			if tool.checkIfTouch(arg_7_0.uiTable["tab_" .. iter_7_0], arg_7_2, arg_7_3) then
				arg_7_0:clickOnIndex(iter_7_0)

				return true
			end
		end

		return true
	end
end

function var_0_0.chooseMode(arg_8_0, arg_8_1)
	local function var_8_0(arg_9_0)
		local var_9_0 = smgr.getLayer("topLayer")
		local var_9_1 = smgr.getLayer("outputModeLayer")

		var_9_0:removeChild(var_9_1, true)
		eventManager.dispatchEvent("refreshResourceAreaLayer")
	end

	return function()
		if arg_8_0.additionRate > 1 then
			local var_10_0 = ""

			if arg_8_0.curIndex == arg_8_0.additionMode then
				var_10_0 = language.get(250009)
			else
				var_10_0 = language.get(250010)
			end

			messageBox.confirm(var_10_0, function()
				messageBox.confirm(language.get(250011, var_0_7[arg_8_0.resType][arg_8_0.curIndex][arg_8_1], var_0_5[arg_8_1], var_0_6[arg_8_0.curIndex]), function()
					cmgr.sendRequest(var_8_0, actions.addBuildingAddition, arg_8_1, arg_8_0.resType, arg_8_0.curIndex)
				end)
			end)
		else
			messageBox.confirm(language.get(250011, var_0_7[arg_8_0.resType][arg_8_0.curIndex][arg_8_1], var_0_5[arg_8_1], var_0_6[arg_8_0.curIndex]), function()
				cmgr.sendRequest(var_8_0, actions.addBuildingAddition, arg_8_1, arg_8_0.resType, arg_8_0.curIndex)
			end)
		end
	end
end

function var_0_0.getAdditionPrice(arg_14_0)
	local function var_14_0(arg_15_0)
		arg_14_0.data = arg_15_0.action.data

		arg_14_0:init()
	end

	cmgr.sendRequest(var_14_0, actions.getAdditionPrice, 1, arg_14_0.resType, arg_14_0.additionMode)
end

return var_0_0
