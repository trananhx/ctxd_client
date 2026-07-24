incenseControl = {}

local var_0_0 = incenseControl

var_0_0.incenseMax = 25
var_0_0.currentIncenseNum = 0
var_0_0.godsInfo = {}
var_0_0.isPlayingAnim = {
	false,
	false,
	false,
	false,
	false
}
var_0_0.workshopTimes = 0

local function var_0_1(arg_1_0)
	if arg_1_0.action.state == 1 and incenseUI.uiTable then
		local var_1_0 = arg_1_0.action.data
		local var_1_1 = var_1_0.resourceGot[1].resourceType

		if var_1_1 == 119 then
			var_1_1 = 4
		elseif var_1_1 == 216 then
			var_1_1 = 5
		end

		incenseUI.playXianglu(var_1_1)
		incenseUI.flyItem(arg_1_0.action.data)

		var_0_0.workshopTimes = var_0_0.workshopTimes - 1

		var_0_0.getIncenseInfo(function()
			if var_0_0.workshopTimes > 0 then
				var_0_0["incenseButtonClick" .. tostring(var_1_1)](true)
			end
		end)

		if var_1_0.extraIron and var_1_0.extraIron > 0 then
			local var_1_2 = {}
			local var_1_3 = {}

			var_1_3.id = 4
			var_1_3.value = var_1_0.extraIron

			table.insert(var_1_2, var_1_3)
			globalAction_gotResource(var_1_2)
		end

		if var_1_0.extraGang and var_1_0.extraGang > 0 then
			local var_1_4 = {}
			local var_1_5 = {}

			var_1_5.id = 10033
			var_1_5.value = var_1_0.extraGang

			table.insert(var_1_4, var_1_5)
			globalAction_gotResource(var_1_4)
		end

		if var_1_0.ex and var_1_0.ex.resourceType == 216 and var_1_0.ex.addNum > 0 then
			local var_1_6 = {}
			local var_1_7 = {}

			var_1_7.id = 216
			var_1_7.value = var_1_0.ex.addNum

			table.insert(var_1_6, var_1_7)
			globalAction_gotResource(var_1_6)
		end
	end
end

function var_0_0.incenseButtonClick1(arg_3_0)
	if arg_3_0 ~= true then
		if incenseUI.uiTable.checkedBtn:isVisible() then
			var_0_0.workshopTimes = 10

			if user.player.playerLv < 30 then
				var_0_0.workshopTimes = 1
			end
		else
			var_0_0.workshopTimes = 1
		end
	end

	if user.chargeItems.incenseGold.noDisturb or var_0_0.godsInfo[1].gold == 0 then
		cmgr.sendRequest(var_0_1, actions.doWorship, "1")
	else
		require("lua/component/messageBox")
		messageBox.showChargeWin(language.get(10003), language.get(71010, var_0_0.godsInfo[1].gold), "incenseGold", function()
			cmgr.sendRequest(var_0_1, actions.doWorship, "1")
		end)
	end
end

function var_0_0.incenseButtonClick2(arg_5_0)
	if arg_5_0 ~= true then
		if incenseUI.uiTable.checkedBtn:isVisible() then
			var_0_0.workshopTimes = 10

			if user.player.playerLv < 30 then
				var_0_0.workshopTimes = 1
			end
		else
			var_0_0.workshopTimes = 1
		end
	end

	if user.chargeItems.incenseGold.noDisturb or var_0_0.godsInfo[2].gold == 0 then
		cmgr.sendRequest(var_0_1, actions.doWorship, "2")
	else
		require("lua/component/messageBox")
		messageBox.showChargeWin(language.get(10003), language.get(71010, var_0_0.godsInfo[2].gold), "incenseGold", function()
			cmgr.sendRequest(var_0_1, actions.doWorship, "2")
		end)
	end
end

function var_0_0.incenseButtonClick3(arg_7_0)
	if arg_7_0 ~= true then
		if incenseUI.uiTable.checkedBtn:isVisible() then
			var_0_0.workshopTimes = 10

			if user.player.playerLv < 30 then
				var_0_0.workshopTimes = 1
			end
		else
			var_0_0.workshopTimes = 1
		end
	end

	if user.chargeItems.incenseGold.noDisturb or var_0_0.godsInfo[3].gold == 0 then
		cmgr.sendRequest(var_0_1, actions.doWorship, "3")
	else
		require("lua/component/messageBox")
		messageBox.showChargeWin(language.get(10003), language.get(71010, var_0_0.godsInfo[3].gold), "incenseGold", function()
			cmgr.sendRequest(var_0_1, actions.doWorship, "3")
		end)
	end
end

function var_0_0.incenseButtonClick4(arg_9_0)
	if arg_9_0 ~= true then
		if incenseUI.uiTable.checkedBtn:isVisible() then
			var_0_0.workshopTimes = 10

			if user.player.playerLv < 30 then
				var_0_0.workshopTimes = 1
			end
		else
			var_0_0.workshopTimes = 1
		end
	end

	local var_9_0 = var_0_0.incenseInfo.specialId == 3 and var_0_0.incenseInfo.specialLimit and var_0_0.incenseInfo.specialLimit > 0

	if user.chargeItems.incenseGold.noDisturb or var_0_0.godsInfo[4].gold == 0 or var_9_0 then
		cmgr.sendRequest(var_0_1, actions.doWorship, "4")
	else
		require("lua/component/messageBox")
		messageBox.showChargeWin(language.get(10003), language.get(71010, var_0_0.godsInfo[4].gold), "incenseGold", function()
			cmgr.sendRequest(var_0_1, actions.doWorship, "4")
		end)
	end
end

function var_0_0.incenseButtonClick5(arg_11_0)
	if arg_11_0 ~= true then
		if incenseUI.uiTable.checkedBtn:isVisible() then
			var_0_0.workshopTimes = 10

			if user.player.playerLv < 30 then
				var_0_0.workshopTimes = 1
			end
		else
			var_0_0.workshopTimes = 1
		end
	end

	local var_11_0 = (var_0_0.incenseInfo.gemId == 1 or var_0_0.incenseInfo.gemId == 2) and var_0_0.incenseInfo.gemLimit and var_0_0.incenseInfo.gemLimit > 0 and var_0_0.godsInfo[5].resourceType == 5

	if user.chargeItems.incenseGold.noDisturb or var_0_0.godsInfo[5].gold == 0 or var_11_0 then
		cmgr.sendRequest(var_0_1, actions.doWorship, "5")
	else
		require("lua/component/messageBox")
		messageBox.showChargeWin(language.get(10003), language.get(71010, var_0_0.godsInfo[5].gold), "incenseGold", function()
			cmgr.sendRequest(var_0_1, actions.doWorship, "5")
		end)
	end
end

function var_0_0.onTenTimesBtnTouched()
	local var_13_0 = not CCUserDefault:sharedUserDefault():getBoolForKey(incenseConstant.IS_TEN_TIMES_SELECTED_KEY)

	incenseUI.uiTable.checkedBtn:setVisible(var_13_0)
	CCUserDefault:sharedUserDefault():setBoolForKey(incenseConstant.IS_TEN_TIMES_SELECTED_KEY, var_13_0)
	CCUserDefault:sharedUserDefault():flush()
end

function var_0_0.getBigIncenseAwards(...)
	cmgr.sendRequest(function(arg_15_0)
		var_0_0.getIncenseInfo()

		if arg_15_0.action.data.resourceGot then
			incenseUI.showBigIncenseAwards(arg_15_0.action.data.resourceGot)
		end
	end, actions.doBigIncense)
end

local function var_0_2()
	for iter_16_0 = 1, 5 do
		var_0_0.isPlayingAnim[iter_16_0] = false
	end
end

function var_0_0.getIncenseInfo(arg_17_0)
	local function var_17_0(arg_18_0)
		if arg_18_0.action.state == 1 and incenseUI.uiTable then
			local var_18_0 = arg_18_0.action.data

			var_0_0.incenseInfo = arg_18_0.action.data
			var_0_0.incenseMax = var_18_0.incenseMax
			var_0_0.currentIncenseNum = var_18_0.currentIncenseNum

			user.welfare.setWelfare("freeIncenseNum", var_18_0.currentIncenseNum)
			incenseUI.uiTable.currentIncenseNum:setString(tostring(var_0_0.currentIncenseNum))
			incenseUI.uiTable.incenseMax:setString("/" .. var_18_0.incenseMax)

			if var_18_0.bigIncense == true then
				incenseUI.uiTable.bigIncenseNum:setString(language.get(490930, var_18_0.freeBigIncenseNum))
				incenseUI.uiTable.btnBigIncense:setEnabled(var_18_0.freeBigIncenseNum > 0)
				incenseUI.uiTable.bigIncense:setVisible(true)
				incenseUI.uiTable.bigIncenseNum:setVisible(true)
			else
				incenseUI.uiTable.bigIncense:setVisible(false)
				incenseUI.uiTable.bigIncenseNum:setVisible(false)
			end

			for iter_18_0 = 1, 5 do
				incenseUI.uiTable["resourceIncense_" .. iter_18_0]:setEnabled(false)
				incenseUI.uiTable["incenseGold" .. iter_18_0]:setVisible(false)
			end

			for iter_18_1, iter_18_2 in pairs(var_18_0.gods) do
				incenseUI.uiTable["resourceIncense_" .. iter_18_2.godId]:setEnabled(true)
				incenseUI.uiTable["incenseGold" .. iter_18_2.godId]:setVisible(true)
				incenseUI.uiTable["incenseGold" .. iter_18_2.godId]:setString(iter_18_2.gold .. language.get(10100))

				var_0_0.godsInfo[iter_18_2.godId] = iter_18_2

				if iter_18_1 == 4 then
					local var_18_1
					local var_18_2
					local var_18_3
					local var_18_4

					if iter_18_2.resourceType == 119 then
						var_18_1 = CCSprite:create("res/ui/weapon/godWeapon/sbxt_icon_blg.png")
						var_18_2 = 0.7
						var_18_4 = 71012
					else
						var_18_1 = tool.spriteByName("icon_iron.png")
						var_18_2 = 1
						var_18_4 = 71008
					end

					for iter_18_3 = 1, 2 do
						incenseUI.uiTable["icon4" .. iter_18_3]:setDisplayFrame(var_18_1:displayFrame())
						incenseUI.uiTable["icon4" .. iter_18_3]:setScale(var_18_2)
						incenseUI.uiTable["info4" .. iter_18_3]:setString(language.get(var_18_4))
					end
				end

				if iter_18_1 == 5 then
					local var_18_5
					local var_18_6
					local var_18_7
					local var_18_8

					if iter_18_2.resourceType == 216 then
						var_18_5 = CCSprite:create("res/ui/weapon/machine/zc_yt_icon.png")
						var_18_6 = 0.85
						var_18_8 = 71013
					else
						var_18_5 = tool.spriteByName("icon_gem.png")
						var_18_6 = 1
						var_18_8 = 71009
					end

					for iter_18_4 = 1, 2 do
						incenseUI.uiTable["icon5" .. iter_18_4]:setDisplayFrame(var_18_5:displayFrame())
						incenseUI.uiTable["icon5" .. iter_18_4]:setScale(var_18_6)
						incenseUI.uiTable["info5" .. iter_18_4]:setString(language.get(var_18_8))
					end
				end
			end

			if var_18_0.gods[5].resourceType == 5 then
				require("lua/layer/activity/activityTab/ui")

				local var_18_9 = var_18_0.specialId
				local var_18_10 = var_18_0.specialMulti
				local var_18_11 = var_18_0.specialLimit

				incenseUI.addSpecialEffect(var_18_9, var_18_11, var_18_10)
				globalAction_updateSpecialEffect(var_18_9, var_18_11, var_18_10)
				incenseUI.updateGemTokenEffect(var_18_0.gemId, var_18_0.gemLimit)
			end

			if arg_17_0 then
				arg_17_0()
			end
		end
	end

	cmgr.sendRequest(var_17_0, actions.getIncenseInfo)
end

function var_0_0.onEnter()
	eventManager.registerEvent("chargeWinCancel", var_0_2)
	eventManager.registerEvent("refreshSpecialWindow", var_0_0.getIncenseInfo)
end

function var_0_0.onExit()
	eventManager.unregisterEvent("chargeWinCancel", var_0_2)
	eventManager.unregisterEvent("refreshSpecialWindow", var_0_0.getIncenseInfo)

	incenseUI.uiTable = {}
end
