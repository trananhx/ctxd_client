blacksmithControl = {}

local var_0_0 = blacksmithControl
local var_0_1 = blacksmithConstant

var_0_0.blacksmithData = {}
var_0_0.itemsData = {}

local var_0_2 = true

function var_0_0.blacksmithGetBlacksmithInfo(arg_1_0)
	local function var_1_0(arg_2_0)
		local var_2_0 = arg_2_0.action.data

		var_0_0.blacksmithData = var_2_0

		if var_0_0.blacksmithData.type == 2 then
			blacksmithUI.createBlacksmithUi(var_2_0)
		else
			if var_0_2 then
				var_0_2 = false

				blacksmithUI.createBlacksmithUi(var_2_0)
			end

			if var_2_0.blacksmiths and #var_2_0.blacksmiths > 0 then
				for iter_2_0, iter_2_1 in ipairs(var_2_0.blacksmiths) do
					if iter_2_1.goodsType == 2 then
						local function var_2_1(arg_3_0, arg_3_1)
							return arg_3_0.quality < arg_3_1.quality
						end

						table.sort(iter_2_1.generalTreasures, var_2_1)
					elseif iter_2_1.goodsType == 3 then
						local function var_2_2(arg_4_0, arg_4_1)
							if #arg_4_0.refreshAttribute == #arg_4_1.refreshAttribute then
								return arg_4_0.refreshAttribute[1].attValue + arg_4_0.refreshAttribute[2].attValue + arg_4_0.refreshAttribute[3].attValue < arg_4_1.refreshAttribute[1].attValue + arg_4_1.refreshAttribute[2].attValue + arg_4_1.refreshAttribute[3].attValue
							else
								return #arg_4_0.refreshAttribute < #arg_4_1.refreshAttribute
							end
						end

						table.sort(iter_2_1.equipList, var_2_2)
					end
				end

				if arg_1_0 then
					local var_2_3 = var_2_0.blacksmiths[arg_1_0]

					if var_2_3 then
						blacksmithUI.updateSmithInfo(var_2_3)
					end
				else
					for iter_2_2 = 1, #var_2_0.blacksmiths do
						local var_2_4 = var_2_0.blacksmiths[iter_2_2]

						blacksmithUI.updateSmithInfo(var_2_4)
					end
				end
			end
		end
	end

	cmgr.sendRequest(var_1_0, actions.blacksmithGetBlacksmithInfo)
end

function var_0_0.blacksmithInvestCopper(arg_5_0)
	local function var_5_0(arg_6_0)
		if arg_6_0.action.state == 1 then
			var_0_0.blacksmithGetBlacksmithInfo()

			if arg_5_0 == 1 then
				blacksmithUI.showInvestCopperEffect(1)
			elseif arg_5_0 == 2 then
				blacksmithUI.showInvestCopperEffect(5)
			end
		end
	end

	cmgr.sendRequest(var_5_0, actions.blacksmithInvestCopper, arg_5_0)
end

function var_0_0.blacksmithUpgradeBlackSmith()
	cmgr.sendRequest(var_0_0.handlerBlacksmithUpgradeBlackSmith, actions.blacksmithUpgradeBlackSmith)
end

function var_0_0.handlerBlacksmithUpgradeBlackSmith(arg_8_0)
	if arg_8_0.action.state == 1 then
		var_0_2 = true

		if var_0_0.blacksmithData.blacksmiths then
			blacksmithUI.showUpgradeEffect()
			var_0_0.blacksmithGetBlacksmithInfo()
		else
			var_0_0.blacksmithGetBlacksmithInfo()
		end
	end
end

function var_0_0.blacksmithUpgradeSmith(arg_9_0)
	local function var_9_0(arg_10_0)
		blacksmithUI.showSmithUpgradeEffect()
		var_0_0.blacksmithGetBlacksmithInfo(arg_9_0)
	end

	cmgr.sendRequest(var_9_0, actions.blacksmithUpgradeSmith, arg_9_0)
end

function var_0_0.blacksmithDissolve(arg_11_0, arg_11_1)
	local function var_11_0(arg_12_0)
		local var_12_0 = var_0_0.blacksmithData.blacksmiths[arg_11_1]
		local var_12_1 = arg_12_0.action.data
		local var_12_2 = {}

		if var_12_1.divideNum then
			for iter_12_0 = 1, var_12_1.divideNum do
				local var_12_3 = {
					id = (var_12_0.type == 2 or var_12_0.type == 3) and 10033 or 4,
					value = var_12_1.output / var_12_1.divideNum
				}

				table.insert(var_12_2, var_12_3)
			end
		else
			local var_12_4 = {
				id = (var_12_0.type == 2 or var_12_0.type == 3) and 10033 or 4,
				value = var_12_1.output
			}

			table.insert(var_12_2, var_12_4)
		end

		globalAction_gotResource(var_12_2)
		var_0_0.blacksmithGetBlacksmithInfo(arg_11_1)
	end

	cmgr.sendRequest(var_11_0, actions.blacksmithDissolve, arg_11_0, arg_11_1)
end

function var_0_0.onExit()
	var_0_2 = true
end

function var_0_0.onEnter()
	blacksmithUI.resetFlag()

	var_0_2 = true
end
