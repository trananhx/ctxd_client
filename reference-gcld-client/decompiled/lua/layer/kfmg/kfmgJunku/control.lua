local var_0_0 = class("kfmgJunkuControl")

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.ui = arg_1_1
end

function var_0_0.refreshData(arg_2_0)
	local function var_2_0(arg_3_0)
		local var_3_0 = arg_3_0.data or arg_3_0.action.data

		log.info("军库界面")
		showTable(var_3_0)
		arg_2_0.ui:initData(var_3_0)
	end

	kfcmgr.sendRequest(var_2_0, actions.kfyzGetArmyBaseInfo)
end

function var_0_0.useItemWithId(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if arg_4_1 == 1 then
		arg_4_0.ui:removeFromParentAndCleanup(true)
		eventManager.dispatchEvent("armyBaseSetVisible", true)
	else
		messageBox.confirm(language.get("hw_kfmg_000013", arg_4_2, arg_4_3), function()
			local function var_5_0(arg_6_0)
				if arg_6_0.state == 1 then
					local var_6_0 = arg_6_0.data or arg_6_0.action.data

					log.info("使用道具")
					showTable(var_6_0)
					arg_4_0:showUseSucceedText()
					arg_4_0.ui:getWorldMap(var_6_0)
					arg_4_0:refreshData()
				end
			end

			kfcmgr.sendRequest(var_5_0, actions.kfyzUseArmyBaseInfo, arg_4_1, 0)
		end)
	end
end

function var_0_0.showUseSucceedText(arg_7_0)
	smgr.showTipTextGreen(language.get("hw_kfmg_000032"))
end

return var_0_0
