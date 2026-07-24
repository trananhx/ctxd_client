local var_0_0 = class("HuizhanGather", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0)
	require("lua/common/CCBNode"):create(arg_2_0)

	arg_2_0.generalControl = {}

	arg_2_0:getInfo()
	swallowTouch(arg_2_0)

	if conf.language ~= "xm" then
		tool.redefineCCControlButtonText(arg_2_0.gatherConfirm, language.get(10001))
		tool.redefineCCControlButtonText(arg_2_0.gatherCancel, language.get(10002))
	end
end

function var_0_0.getInfo(arg_3_0)
	local function var_3_0(arg_4_0)
		local var_4_0 = arg_4_0.data or arg_4_0.action.data
		local var_4_1 = createTimerLabel(var_4_0.countDown, "@M:@S", "Thonburi", 24, nil, nil, nil, colorTips.red)

		arg_3_0.timer:addChild(var_4_1)

		if var_4_0.level == "" or not var_4_0.level then
			var_4_0.level = language.get(460034)
		end

		arg_3_0.huizhanLvLabel:setString(language.get(460024, var_4_0.level))

		if var_4_0.generalInfo then
			for iter_4_0, iter_4_1 in pairs(var_4_0.generalInfo) do
				local var_4_2, var_4_3 = getGeneralTipState(iter_4_1.state)

				arg_3_0.generalControl[iter_4_1.generalId] = {}
				arg_3_0.generalControl[iter_4_1.generalId].selected = var_4_2

				local var_4_4 = arg_3_0["general_" .. iter_4_0]

				if var_4_4 then
					var_4_4:setVisible(true)

					arg_3_0.generalControl[iter_4_1.generalId].rootNode = var_4_4
				end

				local var_4_5 = arg_3_0["general_btn_" .. iter_4_0]

				if var_4_5 then
					var_4_5:setHighlighted(arg_3_0.generalControl[iter_4_1.generalId].selected)
					var_4_5:setUserObject(CCString:create(iter_4_1.generalId))

					arg_3_0.generalControl[iter_4_1.generalId].btn = var_4_5

					if not var_4_2 then
						var_4_5:setEnabled(false)
					end
				end

				local var_4_6 = arg_3_0["general_head_" .. iter_4_0]

				if var_4_6 then
					local var_4_7 = CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", iter_4_1.generalPic))

					if var_4_7 then
						var_4_6:setDisplayFrame(var_4_7:displayFrame())
					end
				end

				local var_4_8 = arg_3_0["general_check_" .. iter_4_0]

				if var_4_8 then
					arg_3_0.generalControl[iter_4_1.generalId].checkSprite = var_4_8

					var_4_8:setVisible(arg_3_0.generalControl[iter_4_1.generalId].selected)
				end

				if var_4_3 then
					local var_4_9 = arg_3_0["state" .. iter_4_0]

					if var_4_9 then
						local var_4_10 = CCStrokeLabelTTF:create(tostring(var_4_3), "Thonburi", 20)

						var_4_10:setColor(ccc3(253, 98, 98))
						var_4_9:addChild(var_4_10)
					end
				end
			end
		end
	end

	cmgr.sendRequest(var_3_0, actions.huizhanGatherInfo)
end

function var_0_0.onGeneralSelect(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = tolua.cast(arg_5_2, "CCControlButton")

	if var_5_0 then
		local var_5_1 = tolua.cast(var_5_0:getUserObject(), "CCString")

		if not var_5_1 then
			return
		end

		local var_5_2 = tonumber(var_5_1:getCString())

		if arg_5_0.generalControl[var_5_2] and arg_5_0.generalControl[var_5_2].checkSprite then
			arg_5_0.generalControl[var_5_2].selected = not arg_5_0.generalControl[var_5_2].selected

			arg_5_0.generalControl[var_5_2].checkSprite:setVisible(arg_5_0.generalControl[var_5_2].selected)
			var_5_0:setHighlighted(arg_5_0.generalControl[var_5_2].selected)
		end
	end
end

function var_0_0.ok(arg_6_0)
	log.info("@@ 确定")

	local function var_6_0(arg_7_0)
		arg_6_0:close()
	end

	local var_6_1 = ""

	for iter_6_0, iter_6_1 in pairs(arg_6_0.generalControl) do
		if iter_6_1.selected then
			var_6_1 = var_6_1 .. tostring(iter_6_0)
			var_6_1 = var_6_1 .. "#"
		end
	end

	if var_6_1 ~= "" then
		log.info("@@ gids ", var_6_1)
		cmgr.sendRequest(var_6_0, actions.huizhanJoin, var_6_1)
	end
end

function var_0_0.cancel(arg_8_0)
	log.info("@@ 取消")
	arg_8_0:close()
end

function var_0_0.close(arg_9_0)
	log.info("@@ 关闭")
	arg_9_0:removeFromParentAndCleanup(true)
end

return var_0_0
