local var_0_0 = class("KfRewardPanel", function()
	return createBaseLayer()
end)
local var_0_1 = require("lua/layer/kfworld/kfgzReward/rewardPanel/uidata")
local var_0_2 = require("lua/layer/kfworld/kfgzReward/rewardPanel/control")

function var_0_0.ctor(arg_2_0)
	arg_2_0.control = var_0_2.new(arg_2_0)

	arg_2_0.control:getKfgzEndRewardBoard()
end

local var_0_3 = {
	language.get(430012),
	language.get(430013)
}
local var_0_4 = {
	language.get(410101),
	language.get(410102),
	language.get(410103)
}

function var_0_0.init(arg_3_0)
	arg_3_0:removeAllChildrenWithCleanup(true)

	arg_3_0.uiTable = autoUI.initUI(arg_3_0, var_0_1.getUiData())

	local var_3_0 = CCScrollView:create(CCSizeMake(531, 265))

	var_3_0:setDirection(kCCScrollViewDirectionVertical)
	var_3_0:setBounceable(false)
	var_3_0:setPosition(ccp(14, 14))
	arg_3_0.uiTable.background:addChild(var_3_0)

	local var_3_1 = CCLayer:create()

	var_3_1:setContentSize(CCSizeMake(531, 738))
	var_3_0:setContainer(var_3_1)
	var_3_0:setContentOffset(ccp(0, -492), false)

	arg_3_0.leftUiTable = autoUI.initUI(var_3_1, var_0_1.getLeftBoard())

	local var_3_2 = CCScrollView:create(CCSizeMake(343, 265))

	var_3_2:setDirection(kCCScrollViewDirectionVertical)
	var_3_2:setBounceable(false)
	var_3_2:setPosition(ccp(560, 14))
	arg_3_0.uiTable.background:addChild(var_3_2)

	local var_3_3 = CCLayer:create()

	var_3_3:setContentSize(CCSizeMake(343, 442))
	var_3_2:setContainer(var_3_3)
	var_3_2:setContentOffset(ccp(0, -442), false)

	arg_3_0.rightUiTable = autoUI.initUI(var_3_3, var_0_1.getRightBoard())

	local var_3_4 = var_0_3[arg_3_0.control.data.layer]

	arg_3_0.uiTable.pos:setString(language.get(430011, var_3_4, arg_3_0.control.data.pos))

	local var_3_5 = arg_3_0.control.data.serverName .. "-" .. var_0_4[arg_3_0.control.data.nation]

	arg_3_0.uiTable.serverName:setString(var_3_5)
	arg_3_0.uiTable.occupyCity:setString(tostring(arg_3_0.control.data.occupyCity))

	local var_3_6 = {}

	for iter_3_0, iter_3_1 in pairs(tool.split(arg_3_0.control.data.reward, ",")) do
		local var_3_7 = tool.split(iter_3_1, ":")

		var_3_6[iter_3_0] = {
			tonumber(var_3_7[1]),
			tonumber(var_3_7[2])
		}
	end

	local var_3_8 = {}

	for iter_3_2, iter_3_3 in pairs(tool.split(arg_3_0.control.data.gold, ",")) do
		var_3_8[iter_3_2] = tonumber(iter_3_3)
	end

	local var_3_9 = arg_3_0.control.data.occupyCity
	local var_3_10 = 0

	for iter_3_4, iter_3_5 in pairs(var_3_6) do
		local var_3_11 = iter_3_5[1]

		if var_3_11 < var_3_9 then
			var_3_10 = var_3_10 + 100 / #var_3_6
		else
			local var_3_12 = 0

			if var_3_6[iter_3_4 - 1] ~= nil then
				var_3_12 = var_3_6[iter_3_4 - 1][1]
			end

			if var_3_12 < var_3_9 then
				local var_3_13 = var_3_9 - var_3_12
				local var_3_14 = var_3_11 - var_3_12

				var_3_10 = var_3_10 + var_3_13 * 100 / var_3_14 / #var_3_6
			end
		end

		arg_3_0.uiTable["cityNum_" .. iter_3_4]:setString(tostring(var_3_11))

		if var_3_11 <= var_3_9 then
			arg_3_0.uiTable["box_" .. iter_3_4]:setEnabled(true)
			arg_3_0.uiTable["box_" .. iter_3_4]:registerScriptTapHandler(arg_3_0.control:openBoxFunc(iter_3_4))
		else
			arg_3_0.uiTable["box_" .. iter_3_4]:setEnabled(false)
		end

		if var_3_8[iter_3_4] > 0 then
			arg_3_0.uiTable["gold_" .. iter_3_4]:setVisible(true)
			arg_3_0.uiTable["goldNum_" .. iter_3_4]:setVisible(true)
			arg_3_0.uiTable["goldNum_" .. iter_3_4]:setString(tostring(var_3_8[iter_3_4]))
		else
			arg_3_0.uiTable["gold_" .. iter_3_4]:setVisible(false)
			arg_3_0.uiTable["goldNum_" .. iter_3_4]:setVisible(false)
		end
	end

	arg_3_0.uiTable.progress:setPercentage(var_3_10)

	local var_3_15 = {
		{
			keyword = "firstKiller",
			valueKey = "killArmy",
			text = language.get(430014)
		},
		{
			keyword = "firstSolo",
			valueKey = "soloNum",
			text = language.get(430015)
		},
		{
			keyword = "firstOccupyCity",
			valueKey = "occupyCity",
			text = language.get(430016)
		}
	}

	for iter_3_6 = 1, 3 do
		local var_3_16 = var_3_15[iter_3_6]
		local var_3_17 = arg_3_0.control.data[var_3_16.keyword]

		arg_3_0.leftUiTable["serverName_" .. iter_3_6]:setString(language.get(430017, var_3_17.serverName, var_3_17.serverId, var_0_4[var_3_17.nation]))
		arg_3_0.leftUiTable["playerName_" .. iter_3_6]:setString(var_3_17.playerName)

		local var_3_18 = var_3_16.text .. var_3_17[var_3_16.valueKey]

		arg_3_0.leftUiTable["desc_" .. iter_3_6]:setString(var_3_18)

		for iter_3_7 = 1, 5 do
			local var_3_19 = var_3_17.generals[iter_3_7]

			if var_3_19 == nil then
				arg_3_0.leftUiTable["headBg_" .. iter_3_6 .. "_" .. iter_3_7]:setVisible(false)
			else
				arg_3_0.leftUiTable["head_" .. iter_3_6 .. "_" .. iter_3_7]:setDisplayFrame(CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", var_3_19.pic)):displayFrame())
				arg_3_0.leftUiTable["lv_" .. iter_3_6 .. "_" .. iter_3_7]:setString("Lv." .. var_3_19.lv)
			end
		end
	end

	local var_3_20 = {
		"upNations",
		"downNations"
	}

	for iter_3_8 = 1, 2 do
		local var_3_21 = var_3_20[iter_3_8]
		local var_3_22 = arg_3_0.control.data[var_3_21]

		for iter_3_9 = 1, 2 do
			local var_3_23 = var_3_22[iter_3_9]

			if var_3_23 ~= nil then
				arg_3_0.rightUiTable["serverName_" .. iter_3_8 .. "_" .. iter_3_9]:setString(var_3_23.serverName .. "-" .. var_0_4[var_3_23.nation])
				arg_3_0.rightUiTable["num_" .. iter_3_8 .. "_" .. iter_3_9]:setString("×" .. var_3_23.occupyCity)
			else
				arg_3_0.rightUiTable["serverName_" .. iter_3_8 .. "_" .. iter_3_9]:setVisible(false)
				arg_3_0.rightUiTable["num_" .. iter_3_8 .. "_" .. iter_3_9]:setVisible(false)
				arg_3_0.rightUiTable["cityIcon_" .. iter_3_8 .. "_" .. iter_3_9]:setVisible(false)
			end
		end
	end
end

return var_0_0
