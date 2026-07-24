local var_0_0 = class("kfmgReadyControl")

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.ui = arg_1_1
end

function var_0_0.refreshData(arg_2_0)
	local function var_2_0(arg_3_0)
		log.info("kfmg筹备界面")
		showTable(arg_3_0)

		local var_3_0 = arg_3_0.action.data

		arg_2_0.ui:initData(var_3_0)
	end

	cmgr.sendRequest(var_2_0, actions.getKfmgShowTipsInfo)
end

function var_0_0.investGoods(arg_4_0, arg_4_1)
	local function var_4_0(arg_5_0)
		local var_5_0 = arg_5_0.data or arg_5_0.action.data

		showTable(var_5_0)

		if var_5_0.needRefresh then
			-- block empty
		else
			local var_5_1 = CCSprite:create("ui/kfyz/ready/jzcg.png")

			var_5_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
			smgr.showTipSpriteText(var_5_1, nil)

			if var_5_0.addExp > 0 then
				local var_5_2 = {
					{}
				}

				var_5_2[1].id = 6
				var_5_2[1].value = var_5_0.addExp

				globalAction_gotResource(var_5_2)
			end
		end

		arg_4_0:refreshData()
	end

	cmgr.sendRequest(var_4_0, actions.investGoodsForKfmg, arg_4_1, 1)
end

function var_0_0.continuousInvestGoods(arg_6_0, arg_6_1, arg_6_2)
	local function var_6_0(arg_7_0)
		local var_7_0 = arg_7_0.data or arg_7_0.action.data

		showTable(var_7_0)

		if var_7_0.needRefresh then
			-- block empty
		else
			local var_7_1 = CCSprite:create("ui/kfyz/ready/jzcg.png")

			var_7_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
			smgr.showTipSpriteText(var_7_1, nil)

			if var_7_0.addExp > 0 then
				local var_7_2 = {
					{}
				}

				var_7_2[1].id = 6
				var_7_2[1].value = var_7_0.addExp

				globalAction_gotResource(var_7_2)
			end
		end

		arg_6_0:refreshData()
	end

	cmgr.sendContinuousRequest(arg_6_2, 0.1, var_6_0, actions.investGoodsForKfmg, arg_6_1, 1)
end

return var_0_0
