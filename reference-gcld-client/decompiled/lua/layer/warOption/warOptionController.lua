warOptionController = {}

function warOptionController.updateWarOptionLayer(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	if arg_1_1 then
		arg_1_1.isClosed = false

		eventManager.dispatchEvent("hideWorldElement", true, arg_1_1.cityId)

		function arg_1_1.optionClosed()
			log.info("should remove all children of war option layer !!!!!!!!!!")
			pcall(arg_1_0.removeAllChildrenWithCleanup, arg_1_0, true)

			if not tolua.isnull(arg_1_4) then
				arg_1_4:setVisible(true)
			end

			if arg_1_1 then
				log.info("warOptionTable :", arg_1_1)
				eventManager.dispatchEvent("hideWorldElement", false, arg_1_1.cityId)

				arg_1_1.isClosed = true
				arg_1_1 = nil
			end
		end

		function arg_1_1.doWarAction(arg_3_0)
			log.info("warOptionController do action city id : ", arg_3_0)

			if tonumber(arg_3_0) == tonumber(arg_1_1.cityId) then
				return
			end

			local var_3_0 = false

			showTable(arg_1_1.data.cityOptions)

			if arg_1_1.data.cityOptions and #arg_1_1.data.cityOptions > 0 then
				for iter_3_0, iter_3_1 in pairs(arg_1_1.data.cityOptions) do
					if tonumber(iter_3_1.cityId) == tonumber(arg_3_0) then
						var_3_0 = true
					end
				end
			end

			if var_3_0 then
				local var_3_1 = ""

				for iter_3_2, iter_3_3 in pairs(arg_1_1.generalButtonsSelectedTable) do
					if iter_3_3 == true then
						if var_3_1 == "" then
							var_3_1 = iter_3_2
						else
							var_3_1 = var_3_1 .. "#" .. iter_3_2
						end
					end
				end

				if arg_1_1.option == "retreat" then
					local function var_3_2(arg_4_0)
						require("lua/game/battle/widget/fightTip")
						require("lua/game/battle/uiConstant")

						local var_4_0 = smgr.getLayer("pushLayer")

						if arg_1_1.isKFWorld then
							showWarOptionTip(var_4_0, tipType.cheTuiSucc, {})

							for iter_4_0, iter_4_1 in pairs(arg_1_1.generalButtonsSelectedTable) do
								if iter_4_1 then
									if arg_1_1.isYz then
										eventManager.dispatchEvent("positionGeneral", iter_4_0, arg_3_0)
									else
										kfcmgr.sendRequest(nil, actions.kfworldMove, iter_4_0, arg_3_0)
									end
								end
							end
						else
							showWarOptionTip(var_4_0, tipType.cheTuiSucc, arg_4_0.action.data)
						end

						log.info("retreat succeed !!")
						arg_1_1.optionClosed()
					end

					if arg_1_1.isKFWorld then
						if arg_1_1.corpsId then
							messageBox.confirm(language.get("223600_juntuan"), function()
								kfcmgr.sendRequest(var_3_2, actions.corpsWithdraw, arg_1_1.corpsId, arg_3_0)
							end)
						else
							kfcmgr.sendRequest(var_3_2, actions.kfgzDoRetreat, arg_3_0, arg_1_1.cityId, var_3_1)
						end
					elseif arg_1_1.corpsId then
						messageBox.confirm(language.get("223600_juntuan"), function()
							cmgr.sendRequest(var_3_2, actions.corpsWithdraw, arg_1_1.corpsId, arg_3_0)
						end)
					else
						cmgr.sendRequest(var_3_2, actions.quitBattle, arg_1_1.battleId, var_3_1, arg_3_0)
					end
				elseif arg_1_1.option == "forward" then
					local function var_3_3(arg_7_0)
						require("lua/game/battle/widget/fightTip")
						require("lua/game/battle/uiConstant")

						local var_7_0 = smgr.getLayer("pushLayer")

						if arg_1_1.isKFWorld then
							showTable(arg_7_0)

							if arg_1_1.isYz and arg_7_0.data.backCapital then
								-- block empty
							else
								showWarOptionTip(var_7_0, tipType.tujinSucc, {})
								bmgr.enterKfgz(arg_3_0)
							end
						else
							showWarOptionTip(var_7_0, tipType.tujinSucc, arg_7_0.action.data)

							if arg_7_0.action.data.battleId then
								smgr.changeScene(SCENE_BATTLE, arg_7_0.action.data.battleType, {
									battleId = arg_7_0.action.data.battleId
								})
							end
						end

						arg_1_1.optionClosed()
					end

					if arg_1_1.isKFWorld then
						if arg_1_1.corpsId then
							messageBox.confirm(language.get("223600_juntuan"), function()
								kfcmgr.sendRequest(var_3_3, actions.corpsDash, arg_1_1.corpsId, arg_3_0)
							end)
						else
							kfcmgr.sendRequest(var_3_3, actions.kfgzDoForward, arg_3_0, arg_1_1.cityId, var_3_1)
						end
					elseif arg_1_1.corpsId then
						messageBox.confirm(language.get("223600_juntuan"), function()
							cmgr.sendRequest(var_3_3, actions.corpsDash, arg_1_1.corpsId, arg_3_0)
						end)
					else
						cmgr.sendRequest(var_3_3, actions.tujin, var_3_1, arg_1_1.battleId, arg_3_0)
					end
				end
			end
		end
	end

	if arg_1_1 then
		pcall(arg_1_0.removeAllChildrenWithCleanup, arg_1_0, true)

		local var_1_0 = arg_1_2[arg_1_3 .. arg_1_1.cityId]

		if arg_1_3 == "" then
			var_1_0 = arg_1_2[tonumber(arg_1_1.cityId)]
		end

		log.info("showTable(startCity)")
		showTable(var_1_0)

		local var_1_1, var_1_2 = var_1_0.sprite:getPosition()
		local var_1_3 = {}

		autoUI.createUI(arg_1_0, warOptionController.getWarOptionLayerData(arg_1_1), var_1_3)
		arg_1_4:setVisible(false)
		var_1_3.warOptionBackground:setPosition(ccp(var_1_1, var_1_2))

		arg_1_1.generalButtonsSelectedTable = {}

		if arg_1_1.data.gIds then
			for iter_1_0, iter_1_1 in pairs(arg_1_1.data.gIds) do
				arg_1_1.generalButtonsSelectedTable[iter_1_1.gId] = true

				var_1_3["generalPicHightlight" .. iter_1_1.gId]:setVisible(true)
				var_1_3["generalButton" .. iter_1_1.gId]:registerScriptTapHandler(function(arg_10_0)
					arg_1_1.generalButtonsSelectedTable[iter_1_1.gId] = not arg_1_1.generalButtonsSelectedTable[iter_1_1.gId]

					if arg_1_1.generalButtonsSelectedTable[iter_1_1.gId] then
						var_1_3["generalPicHightlight" .. iter_1_1.gId]:setVisible(true)
					else
						var_1_3["generalPicHightlight" .. iter_1_1.gId]:setVisible(false)
					end
				end)
			end
		end

		if arg_1_1.data.cityOptions then
			for iter_1_2, iter_1_3 in pairs(arg_1_1.data.cityOptions) do
				local var_1_4 = false

				showTable(iter_1_3)

				if arg_1_1.option == "retreat" then
					if tonumber(iter_1_3.state) == 1 then
						var_1_4 = true

						local var_1_5 = 15
						local var_1_6
						local var_1_7
						local var_1_8 = CCMoveBy:create(0.3, ccp(0, var_1_5))
						local var_1_9 = CCMoveBy:create(0.3, ccp(0, -var_1_5))
						local var_1_10 = CCArray:create()

						var_1_10:addObject(var_1_8)
						var_1_10:addObject(var_1_9)

						local var_1_11 = CCSequence:create(var_1_10)
						local var_1_12 = CCRepeatForever:create(tolua.cast(var_1_11, "CCActionInterval"))
						local var_1_13 = CCSprite:create("res/ui/world/curl_arrow.png")
						local var_1_14 = arg_1_2[arg_1_3 .. iter_1_3.cityId]

						if arg_1_3 == "" then
							var_1_14 = arg_1_2[tonumber(iter_1_3.cityId)]
						end

						local var_1_15, var_1_16 = var_1_14.sprite:getPosition()

						arg_1_0:addChild(var_1_13)
						var_1_13:runAction(var_1_12)
						var_1_13:setPosition(ccp(var_1_15, var_1_16))
					end
				elseif arg_1_1.option == "forward" and tonumber(iter_1_3.state) == 1 then
					var_1_4 = true

					local var_1_17 = rmgr.getAnimation("swordEffect")
					local var_1_18 = CCAnimation:createWithSpriteFrames(var_1_17, 0.08)
					local var_1_19 = CCAnimate:create(var_1_18)
					local var_1_20 = CCRepeatForever:create(var_1_19)
					local var_1_21 = CCSprite:create()
					local var_1_22 = arg_1_2[arg_1_3 .. iter_1_3.cityId]

					if arg_1_3 == "" then
						var_1_22 = arg_1_2[tonumber(iter_1_3.cityId)]
					end

					local var_1_23, var_1_24 = var_1_22.sprite:getPosition()

					arg_1_0:addChild(var_1_21)
					var_1_21:setPosition(ccp(var_1_23, var_1_24))
					var_1_21:runAction(var_1_20)

					if iter_1_3.distance and iter_1_3.distance > 1 then
						local var_1_25 = 10 * (iter_1_3.distance - 1)
						local var_1_26 = CCSprite:create("res/ui/silk/market/scpm_word_d.png")

						var_1_26:setPosition(var_1_23, var_1_24 + 40)
						arg_1_0:addChild(var_1_26)

						local var_1_27 = CCLabelAtlas:create(tostring(var_1_25), "res/ui/common/number/xflts_res_numb.png", 22, 33, 48)

						var_1_27:setAnchorPoint(ccp(0.5, 0.5))

						local var_1_28 = CCSprite:create("res/ui/battle/retreatForward/tujin_word_beibingli.png")
						local var_1_29 = createRichNode({
							var_1_27,
							var_1_28
						}, 0.5)

						var_1_29:setPosition(78, 20)
						var_1_26:addChild(var_1_29)
					end
				end

				if var_1_4 then
					if arg_1_1.option == "retreat" then
						log.info("should draw lines between : ", arg_1_1.cityId, iter_1_3.cityId)
						traceData.drawLineBetweenTwoCity(tonumber(arg_1_1.cityId), tonumber(iter_1_3.cityId), arg_1_0)
					elseif arg_1_1.option == "forward" then
						if iter_1_3.path and iter_1_3.path ~= "" then
							local var_1_30 = stringSplit(iter_1_3.path, ",")

							for iter_1_4 = 1, #var_1_30 - 1 do
								local var_1_31 = var_1_30[iter_1_4]
								local var_1_32 = var_1_30[iter_1_4 + 1]

								log.info("should draw lines between : ", var_1_31, var_1_32)
								traceData.drawLineBetweenTwoCity(tonumber(var_1_31), tonumber(var_1_32), arg_1_0)
							end
						else
							log.info("should draw lines between : ", arg_1_1.cityId, iter_1_3.cityId)
							traceData.drawLineBetweenTwoCity(tonumber(arg_1_1.cityId), tonumber(iter_1_3.cityId), arg_1_0)
						end
					end
				end
			end
		end
	end
end

function warOptionController.getWarOptionLayerData(arg_11_0)
	local var_11_0 = "res/ui/battle/retreatForward/chetui_tit_qxzctcd.png"

	if arg_11_0.option == "retreat" then
		var_11_0 = "res/ui/battle/retreatForward/chetui_tit_qxzctcd.png"
	elseif arg_11_0.option == "forward" then
		var_11_0 = "res/ui/battle/retreatForward/chetui_tit_qxztjcd.png"
	else
		log.erro("unrecognized war option !!", arg_11_0.option)
	end

	local var_11_1 = {}

	if arg_11_0.corpsId then
		local var_11_2 = "res/ui/world/juntuan/fightPic_juntuan.png"
		local var_11_3 = 170

		log.info("posX : ", var_11_3)

		local var_11_4 = {
			y = 50,
			type = "button",
			x = var_11_3,
			buttons = {
				{
					pic2 = "frame:move_por_move_view.png",
					name = "juntuanButton",
					pic1 = "frame:move_por_move_view.png"
				}
			}
		}
		local var_11_5 = {
			scale = 0.705,
			y = 50,
			type = "pic",
			pic = "res/ui/world/juntuan/fightPic_juntuan.png",
			x = var_11_3
		}
		local var_11_6 = {
			name = "juntuanHightlight",
			y = 50,
			type = "pic",
			pic = "res/ui/battle/retreatForward/chetui_peop_view_lig.png",
			x = var_11_3
		}

		table.insert(var_11_1, var_11_4)
		table.insert(var_11_1, var_11_5)
		table.insert(var_11_1, var_11_6)
	else
		local var_11_7 = 0

		for iter_11_0, iter_11_1 in pairs(arg_11_0.data.gIds) do
			local var_11_8 = (340 - 85 * #arg_11_0.data.gIds) * 0.5 + 42.5
			local var_11_9 = "res/ui/common/fightPic/fightPic_" .. iter_11_1.gPic .. ".png"
			local var_11_10 = var_11_8 + var_11_7 * 85

			var_11_7 = var_11_7 + 1

			log.info("posX : ", var_11_10)

			local var_11_11 = {
				y = 50,
				type = "button",
				x = var_11_10,
				buttons = {
					{
						pic2 = "frame:move_por_move_view.png",
						pic1 = "frame:move_por_move_view.png",
						name = "generalButton" .. iter_11_1.gId
					}
				}
			}
			local var_11_12 = {
				scale = 0.705,
				y = 50,
				type = "pic",
				pic = var_11_9,
				x = var_11_10
			}
			local var_11_13 = {
				y = 50,
				type = "pic",
				pic = "res/ui/battle/retreatForward/chetui_peop_view_lig.png",
				name = "generalPicHightlight" .. iter_11_1.gId,
				x = var_11_10
			}

			table.insert(var_11_1, var_11_11)
			table.insert(var_11_1, var_11_12)
			table.insert(var_11_1, var_11_13)
		end
	end

	return {
		name = "warOptionBackground",
		pic = "res/ui/battle/retreatForward/chetui_list.png",
		type = "pic",
		children = {
			{
				xcenter = 0,
				ycenter = 0,
				type = "pic",
				pic = var_11_0
			},
			{
				xcenter = 0,
				ycenter = -70,
				type = "button",
				buttons = {
					{
						pic2 = "frame:btn3_gre_c.png",
						name = "backButton",
						pic1 = "frame:btn3_gre_a.png",
						callBack = function()
							showTable(arg_11_0.data)
							log.info("warOptionTable.battleId : ", arg_11_0.battleId)

							if arg_11_0.isKFWorld then
								bmgr.enterKfgz(arg_11_0.cityId)
							else
								bmgr.tryEnterBattle(3, {
									battleId = arg_11_0.battleId
								})
							end

							arg_11_0.optionClosed()
						end
					}
				}
			},
			{
				fontSize = 22,
				name = "backButtonLabel",
				type = "label",
				ycenter = -70,
				xcenter = 0,
				text = language.get("202001_lxr"),
				color = colorText[10004]
			},
			{
				x = -30,
				height = 90,
				y = 40,
				type = "layer_color",
				width = 340,
				color = ccc4(0, 0, 255, 0),
				children = var_11_1
			}
		}
	}
end
