return {
	create = function(arg_1_0, arg_1_1)
		local var_1_0 = {}

		var_1_0.event = nil
		var_1_0.buildId = nil

		function var_1_0.close(...)
			smgr.getLayer("topLayer"):removeChild(arg_1_1.widgets.window, true)
			eventManager.dispatchEvent("zhwnWindowClose")
		end

		function var_1_0.handlerEventInfo(arg_3_0)
			var_1_0.event = arg_3_0.action.data

			var_1_0.updateZhenwuUi()
		end

		function var_1_0.updateZhenwuUi()
			if not var_1_0.event then
				return
			end

			arg_1_1.widgets.eventNode:removeAllChildrenWithCleanup(true)

			local var_4_0 = CCSprite:create(string.format("res/ui/mainCityEvent/event/%s.jpg", var_1_0.event.eventPic))

			arg_1_1.widgets.eventNode:addChild(var_4_0)
			arg_1_1.widgets.eventNum:setString(string.format("%s/24", var_1_0.event.currentEventNum))
			arg_1_1.widgets.eventNameLabel:setString(string.format("<%s>", var_1_0.event.eventName))
			arg_1_1.widgets.eventDesc:setString(var_1_0.event.eventDisc)

			local var_4_1 = CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", var_1_0.event.general1))

			var_4_1:setPosition(ccp(41, 41))
			arg_1_1.widgets.generalHeadNode1:addChild(var_4_1)
			arg_1_1.widgets.generalSayLabel1:setString(var_1_0.event.eventOption1)
			arg_1_1.widgets.rewardLabel1:setString(language.get(340002, var_1_0.event.rewardDisc1))

			if var_1_0.event.goldConsume1 > 0 then
				arg_1_1.widgets.goldConsum1:setVisible(true)
				arg_1_1.widgets.goldConsum1:setString(language.get(340005, var_1_0.event.goldConsume1))
			else
				arg_1_1.widgets.goldConsum1:setVisible(false)
			end

			arg_1_1.widgets.accept1:setVisible(false)

			local var_4_2 = CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", var_1_0.event.general2))

			var_4_2:setPosition(ccp(41, 41))
			arg_1_1.widgets.generalHeadNode2:addChild(var_4_2)
			arg_1_1.widgets.generalSayLabel2:setString(var_1_0.event.eventOption2)
			arg_1_1.widgets.rewardLabel2:setString(language.get(340002, var_1_0.event.rewardDisc2))

			if var_1_0.event.goldConsume2 > 0 then
				arg_1_1.widgets.goldConsum2:setVisible(true)
				arg_1_1.widgets.goldConsum2:setString(language.get(340005, var_1_0.event.goldConsume2))
			else
				arg_1_1.widgets.goldConsum2:setVisible(false)
			end

			arg_1_1.widgets.accept2:setVisible(false)
			arg_1_1.widgets.progressNumLabel:setString(string.format("%s/%s", var_1_0.event.peopleLoyal, var_1_0.event.peopleLoyalMax))

			if var_1_0.event.peopleLoyal == var_1_0.event.peopleLoyalMax then
				arg_1_1.widgets.getRewardButton:setVisible(true)
				arg_1_1.widgets.progressBarSprite:setVisible(false)
			else
				arg_1_1.widgets.getRewardButton:setVisible(false)
				arg_1_1.widgets.progressBarSprite:setVisible(true)
				arg_1_1.widgets.progressBarNode:removeAllChildrenWithCleanup(true)

				local var_4_3 = math.ceil(var_1_0.event.peopleLoyal / var_1_0.event.peopleLoyalMax * 10)
				local var_4_4 = 4

				for iter_4_0 = 1, var_4_3 do
					local var_4_5 = CCSprite:createWithSpriteFrameName("zhw_load_con.png")

					var_4_5:setAnchorPoint(ccp(0, 0.5))
					var_4_5:setPosition(ccp(var_4_4, 0))
					arg_1_1.widgets.progressBarNode:addChild(var_4_5)

					var_4_4 = var_4_4 + var_4_5:getContentSize().width + 2
				end
			end
		end

		function var_1_0.getRewardInfo(arg_5_0)
			var_1_0.buildId = arg_5_0

			cmgr.sendRequest(var_1_0.handlerEventInfo, actions.politicsEventInfo, arg_5_0)
		end

		function var_1_0.showReward(arg_6_0)
			local var_6_0 = {}

			for iter_6_0, iter_6_1 in pairs(arg_6_0) do
				if iter_6_1.type == 23 then
					iter_6_1.type = 0
				end

				table.insert(var_6_0, {
					id = iter_6_1.type,
					value = iter_6_1.value
				})
			end

			globalAction_gotResource(var_6_0)
		end

		function var_1_0.handlerReward(arg_7_0)
			var_1_0.showReward(arg_7_0.action.data.rewards)

			if var_1_0.buildId then
				var_1_0.getRewardInfo(var_1_0.buildId)
			end
		end

		function var_1_0.getReward()
			cmgr.sendRequest(var_1_0.handlerReward, actions.politicsGetReward)
		end

		function var_1_0.handlerDoOption(arg_9_0)
			var_1_0.showReward(arg_9_0.action.data.eventReward)

			if var_1_0.event.nextBuildingWithEvent then
				var_1_0.getRewardInfo(var_1_0.event.nextBuildingWithEvent)
			else
				arg_1_1.widgets.eventNum:setString("0/24")
				arg_1_1.widgets.option1:setEnabled(false)
				arg_1_1.widgets.option2:setEnabled(false)
			end
		end

		function var_1_0.doOption(arg_10_0)
			cmgr.sendRequest(var_1_0.handlerDoOption, actions.politicsChooseEventOption, arg_10_0, var_1_0.buildId, 0)
		end

		function var_1_0.doOption1()
			if var_1_0.event.goldConsume1 > 0 then
				messageBox.showChargeWin(language.get(190080), language.get(340006, var_1_0.event.goldConsume1), "politicsEvent", function()
					var_1_0.doOption(1)
					arg_1_1.widgets.accept1:setVisible(true)
				end)
			else
				var_1_0.doOption(1)
				arg_1_1.widgets.accept1:setVisible(true)
			end
		end

		function var_1_0.doOption2()
			if var_1_0.event.goldConsume2 > 0 then
				messageBox.showChargeWin(language.get(190080), language.get(340006, var_1_0.event.goldConsume2), "politicsEvent", function()
					var_1_0.doOption(2)
					arg_1_1.widgets.accept2:setVisible(true)
				end)
			else
				var_1_0.doOption(2)
				arg_1_1.widgets.accept2:setVisible(true)
			end
		end

		return var_1_0
	end
}
