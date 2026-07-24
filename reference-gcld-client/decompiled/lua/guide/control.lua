guide.control = {}
guide.control.type = 0
guide.control.isHideByTemp = false
guide.uiElementsTable = {}
guide.curMenuItems = {}
guide.isForceMarkTrace = true
guide.forceMarkTrace = nil
guide.currentMarkTrace = nil
guide.forceMarkTraceDescription = nil
guide.callback = nil
guide.forceMarkTraceTaskId = 50
guide.forceMarkTraceLevel = 30

function guide.control.handler_pushPlayer(arg_1_0)
	if arg_1_0.action.state == 3 then
		-- block empty
	end
end

function guide.control.setCurrentMarkTrace(arg_2_0)
	guide.currentMarkTrace = arg_2_0

	if guide.isForceMarkTrace then
		log.info("guide.forceMarkTraceDescription : ", guide.forceMarkTraceDescription, "guide.forceMarkTrace:", guide.forceMarkTrace)
		log.info("guide.isForceMarkTrace :", guide.isForceMarkTrace)
		guide.control.forceGuideByMarkTrace(guide.forceMarkTrace, guide.forceMarkTraceDescription)
	end
end

function guide.control.forceGuideByMarkTrace(arg_3_0, arg_3_1)
	log.info("markTrace: ", arg_3_0)

	if arg_3_0 == nil or #arg_3_0 == 0 then
		return
	end

	local var_3_0 = string.split(arg_3_0, ":")
	local var_3_1 = guide.currentMarkTrace

	log.info("guide.currentMarkTrace : ", guide.currentMarkTrace)

	if not var_3_1 then
		if smgr.currentSceneTag == SCENE_WORLD then
			var_3_1 = "world"
		elseif smgr.currentSceneTag == SCENE_INSTANCE then
			log.info("selectInstanceControl.curPowerId : ", selectInstanceControl.curPowerId)

			selectInstanceControl.curPowerId = selectInstanceControl.curPowerId or 1
			var_3_1 = "instance:" .. selectInstanceControl.curPowerId

			log.info("currentMarkTrace :", var_3_1)
		elseif smgr.currentSceneTag == SCENE_MAIN_CITY then
			var_3_1 = "city"
		elseif smgr.currentSceneTag == SCENE_BATTLE then
			return
		elseif smgr.currentSceneTag == SCENE_LOGIN then
			return
		elseif smgr.currentSceneTag == SCENE_JUBEN then
			return
		elseif smgr.currentSceneTag == SCENE_LOADING then
			return
		elseif smgr.currentSceneTag == SCENE_RES_NONGTIAN then
			var_3_1 = "city:3"
			guide.currentMarkTrace = var_3_1
		elseif smgr.currentSceneTag == SCENE_RES_MUCHANG then
			var_3_1 = "city:2"
			guide.currentMarkTrace = var_3_1
		elseif smgr.currentSceneTag == SCENE_RES_JUMING then
			var_3_1 = "city:1"
			guide.currentMarkTrace = var_3_1
		elseif smgr.currentSceneTag == SCENE_RES_BINGYING then
			var_3_1 = "city:4"
			guide.currentMarkTrace = var_3_1
		elseif smgr.currentSceneTag == SCENE_RES_BINGTIE then
			var_3_1 = "city:6"
			guide.currentMarkTrace = var_3_1
		elseif smgr.currentSceneTag == SCENE_RES_HUANGCHENG then
			var_3_1 = "city:5"
			guide.currentMarkTrace = var_3_1
		else
			return
		end
	end

	local var_3_2 = string.split(var_3_1, ":")

	log.info("currentMarkTrace :", var_3_1)

	local var_3_3 = #var_3_0 - 1

	if #var_3_0 == 2 and #var_3_2 == 2 and var_3_0[1] == "city" and var_3_2[1] == "city" then
		var_3_3 = #var_3_0
	end

	for iter_3_0 = 1, var_3_3 do
		log.info("currentMarkTraceTable[index] : ", var_3_2[iter_3_0])
		log.info(" markTraceTable[index] :", var_3_0[iter_3_0])

		if var_3_2[iter_3_0] and var_3_0[iter_3_0] == var_3_2[iter_3_0] or var_3_0[1] == "menu" then
			if iter_3_0 == var_3_3 then
				log.info("mark trace completed : ", var_3_1, guide.forceMarkTrace)

				if guide.forceMarkTrace == "panel:2:1:1029" then
					guide.forceMarkTrace = "panel:2:1"

					log.info("panel:2:1:1029 to panel:2:1")
				end

				if guide.forceMarkTrace == "panel:4:1:1023" then
					log.info("QQQQQQQQ  markTraceTable[4] = 1023")
					log.info("panel:4:1:1023 得华雄后买装备")

					function guide.callback()
						log.info("should show arrow QQQ 1023")
						require("lua/guide/control")

						local var_4_0

						log.info("非tabItem")

						local var_4_1 = guide.uiElementsTable[1023]

						log.info("ui element :", var_4_1)

						if var_4_1 then
							pcall(function(...)
								local var_5_0, var_5_1 = tool.getPositionInScreen(var_4_1)
								local var_5_2 = var_5_1 + var_4_1:getContentSize().height * 2

								log.info("position :", var_5_0, var_5_2, var_4_1:getContentSize().height)
								guide.control.loadGuide2(7, var_5_0, var_5_2 + 20, true, language.get(200130))
							end)
						else
							log.error("guide/control no such ui element Id : ", var_3_0[4])
						end
					end
				end

				log.info("qymqqq 进入 guide.control.showArrowByMarkTrace！！！")
				guide.control.showArrowByMarkTrace(guide.forceMarkTrace, arg_3_1)
				log.info("user.curMainTask.taskId ", user.curMainTask.taskId)

				if (user.curMainTask.taskId == 29 or user.curMainTask.taskId == 23) and user.curMainTask.state == 1 then
					log.info("mark trace not end...")
				else
					log.info("mark trace set to end  ")

					if user.player.playerLv > guide.forceMarkTraceLevel then
						guide.isForceMarkTrace = false
						guide.forceMarkTrace = nil
					end
				end
			end
		else
			log.info("return at index : ", iter_3_0)

			local var_3_4 = ""

			for iter_3_1 = 1, iter_3_0 do
				if iter_3_1 ~= 1 then
					var_3_0[iter_3_1] = tonumber(var_3_0[iter_3_1])

					log.info("markTraceTable[i] to number :", iter_3_1, var_3_0[iter_3_1])
				end

				if iter_3_1 ~= iter_3_0 then
					var_3_4 = var_3_4 .. var_3_0[iter_3_1] .. ":"
				else
					var_3_4 = var_3_4 .. var_3_0[iter_3_1]

					if var_3_0[1] == "panel" and iter_3_0 == 1 then
						var_3_0[iter_3_1 + 1] = tonumber(var_3_0[iter_3_1 + 1])
						var_3_4 = var_3_4 .. ":" .. var_3_0[iter_3_1 + 1]
					end
				end
			end

			if iter_3_0 == 2 and var_3_0[1] == "city" and var_3_2[2] then
				var_3_4 = "city"
			end

			if iter_3_0 == 1 and var_3_2[1] == "instance" and var_3_0[1] ~= "instance" and var_3_0[1] ~= "panel" then
				var_3_4 = var_3_0[1]
			end

			log.info("tmpMarkTrace : ", var_3_4)
			guide.control.showArrowByMarkTrace(var_3_4, arg_3_1)

			return
		end
	end
end

function guide.control.showArrowByMarkTrace(arg_6_0, arg_6_1)
	local var_6_0 = true
	local var_6_1 = string.split(arg_6_0, ":")
	local var_6_2 = 0

	if arg_6_1 then
		var_6_2 = 4
	end

	if guide.currentMarkTrace and var_6_1[1] ~= "panel" and string.split(guide.currentMarkTrace, ":")[1] == "panel" then
		return
	end

	log.info("guide.currentMarkTrace : ", guide.currentMarkTrace)

	if guide.currentMarkTrace then
		local var_6_3 = string.split(guide.currentMarkTrace, ":")

		if var_6_3[2] and var_6_3[1] == "panel" and var_6_1[2] ~= var_6_3[2] then
			log.info("should return")

			return
		end

		if var_6_3[1] == "city" and var_6_3[2] and var_6_3[2] == "5" and var_6_1[1] == "instance" and menuUI.ui.isOpen == false then
			menuUI.ui.clickedMainItem(nil, nil, nil)
		end
	end

	for iter_6_0 = 2, #var_6_1 do
		var_6_1[iter_6_0] = tonumber(var_6_1[iter_6_0])
	end

	amgr.playEffect(enumAudioFile.ui_guide, false)
	log.info("show arrow marktrace : ", arg_6_0)

	if var_6_1[1] == "city" then
		if var_6_1[2] then
			if var_6_1[3] then
				require("lua/guide/control")

				var_6_1[3] = tonumber(var_6_1[3])

				if guide.uiElementsTable[var_6_1[3]] then
					local var_6_4, var_6_5 = tool.getPositionInScreen(guide.uiElementsTable[var_6_1[3]])

					if var_6_1[3] == 1014 or var_6_1[3] == 1016 then
						var_6_5 = var_6_5 + guide.uiElementsTable[var_6_1[3]]:getContentSize().height

						guide.control.loadGuide2(var_6_2 + 3, var_6_4, var_6_5, var_6_0, arg_6_1)
					else
						local var_6_6 = var_6_4 - guide.uiElementsTable[var_6_1[3]]:getContentSize().width - 30

						guide.control.loadGuide2(var_6_2 + 2, var_6_6, var_6_5, var_6_0, arg_6_1)
					end
				end

				if var_6_1[3] < 100 then
					require("lua/layer/resourceArea2/uidata")

					local var_6_7 = getResourceUiData()["building_" .. var_6_1[2] .. "_" .. var_6_1[3]]

					if var_6_7 then
						require("lua/guide/control")

						local var_6_8 = var_6_7.x
						local var_6_9 = var_6_7.y + 50

						guide.control.loadGuide2(var_6_2 + 3, var_6_8, var_6_9, var_6_0, arg_6_1)
					end
				end
			else
				require("lua/guide/control")

				if guide.uiElementsTable.city[var_6_1[2]] then
					local var_6_10, var_6_11 = pcall(function()
						local var_7_0, var_7_1 = tool.getPositionInScreen(guide.uiElementsTable.city[var_6_1[2]])
						local var_7_2 = var_7_1 + guide.uiElementsTable.city[var_6_1[2]]:getContentSize().height * 0.3

						guide.control.loadGuide2(var_6_2 + 3, var_7_0, var_7_2, var_6_0, arg_6_1)

						return true
					end)

					if not var_6_10 or not var_6_11 then
						var_6_1[1] = "menu"
						var_6_1[2] = 2
					end
				end
			end
		else
			var_6_1[1] = "menu"
			var_6_1[2] = 2
		end
	elseif var_6_1[1] == "instance" then
		log.info("markTraceTable[1] == instance")

		if var_6_1[2] then
			log.info("markTraceTable[2] :", var_6_1[2])

			if var_6_1[3] then
				log.info("markTraceTable[3] : ", var_6_1[3])
				require("lua/layer/selectInstance2/ui")
				require("lua/layer/selectInstance2/constant")
				log.info("should show instance ", var_6_1[2], var_6_1[3])
				require("lua/guide/control")

				if var_6_1[3] and var_6_1[3] ~= 0 and selectInstanceConstant.NPC_POSITION[tonumber(var_6_1[3])] then
					local var_6_12 = selectInstanceConstant.NPC_POSITION[tonumber(var_6_1[3])]
					local var_6_13 = var_6_12.x
					local var_6_14 = var_6_12.y + 60

					if var_6_12 then
						log.info("guide.control.loadGuide2(arrowTypeOffset+3, x, y, true)", arg_6_1)
						guide.control.loadGuide2(var_6_2 + 3, var_6_13, var_6_14, var_6_0, arg_6_1)
					else
						log.error("taks/ui: no such position found")
					end
				end
			end
		else
			var_6_1[1] = "menu"
			var_6_1[2] = 3
		end
	elseif var_6_1[1] == "world" then
		var_6_1[1] = "menu"
		var_6_1[2] = 1
	elseif var_6_1[1] == "panel" then
		local var_6_15 = true
		local var_6_16 = 3
		local var_6_17 = true
		local var_6_18 = 0
		local var_6_19 = 0

		local function var_6_20()
			log.info("should show arrow", var_6_1[4])

			if var_6_1[4] then
				require("lua/guide/control")

				local var_8_0
				local var_8_1 = 0

				if string.sub(var_6_1[4], 1, 7) == "tabItem" then
					log.info("指向tabItem")

					local var_8_2 = tonumber(string.sub(var_6_1[4], 8, #var_6_1[4]))

					log.info("elementIndex : ", var_8_2, #guide.curMenuItems)

					for iter_8_0, iter_8_1 in pairs(guide.curMenuItems) do
						log.info("element index , value ", iter_8_0, iter_8_1)
					end

					var_8_0 = guide.curMenuItems[var_8_2]

					log.info("uiElement = guide.curMenuItems[elementIndex] : ", var_8_0, guide.curMenuItems[var_8_2])

					var_6_16 = 1
					var_6_15 = true
					var_8_1 = 90

					if var_8_0 then
						local var_8_3, var_8_4 = tool.getPositionInScreen(var_8_0)

						if var_6_15 then
							if var_6_16 == 3 then
								var_8_4 = var_8_4 + var_8_0:getContentSize().height
							elseif var_6_16 == 1 then
								var_8_4 = var_8_4 - var_8_0:getContentSize().height - var_8_1
							end
						end

						guide.control.loadGuide2(var_6_2 + var_6_16, var_8_3, var_8_4, var_6_0, arg_6_1)
					else
						log.info("no such uiElement!")
					end
				else
					log.info("非tabItem")

					var_8_0 = guide.uiElementsTable[var_6_1[4]]

					log.info("ui element :", var_8_0)

					if var_8_0 then
						pcall(function(...)
							local var_9_0, var_9_1 = tool.getPositionInScreen(var_8_0)

							if var_6_15 then
								if var_6_16 == 3 then
									var_9_1 = var_9_1 + var_8_0:getContentSize().height
								elseif var_6_16 == 1 then
									var_9_1 = var_9_1 - var_8_0:getContentSize().height - var_8_1
								end
							end

							log.info("position :", var_9_0, var_9_1, var_8_0:getContentSize().height)
							guide.control.loadGuide2(var_6_2 + var_6_16, var_9_0 + var_6_19, var_9_1 + var_6_18, var_6_0, arg_6_1)
						end)
					else
						log.error("guide/control no such ui element Id : ", var_6_1[4])
					end
				end
			end
		end

		if not var_6_1[3] then
			var_6_1[1] = "menu"

			log.info(" markTraceTable[2] :", var_6_1[2], guide.constant.panelToMenu[tonumber(var_6_1[2])])

			var_6_1[2] = guide.constant.panelToMenu[tonumber(var_6_1[2])]

			log.info(" markTraceTable[2] :", var_6_1[2])
		elseif not var_6_1[4] and var_6_1[3] ~= 1 then
			log.info("tabItem : ", var_6_1[3])

			var_6_1[4] = "tabItem" .. var_6_1[3]

			log.info(" markTraceTable[4] :", var_6_1[4])

			var_6_1[3] = 1
		elseif var_6_1[4] then
			if var_6_1[2] == 1 then
				if var_6_1[3] <= 2 then
					var_6_15 = false
				end
			elseif var_6_1[2] == 2 then
				if var_6_1[3] == 1 or var_6_1[3] == 4 then
					var_6_15 = true
					var_6_17 = false
					guide.callback = var_6_20
				end

				if var_6_1[3] == 3 then
					if var_6_1[4] == 1013 then
						var_6_15 = false

						if guide.uiElementsTable[1013] then
							var_6_17 = true
						else
							guide.callback = var_6_20
							var_6_17 = false
						end
					else
						var_6_15 = true
						var_6_17 = false
						guide.callback = var_6_20
					end
				end
			elseif var_6_1[2] == 3 then
				-- block empty
			elseif var_6_1[2] == 4 then
				if var_6_1[3] == 2 then
					guide.callback = var_6_20
					var_6_17 = false
				end

				if var_6_1[3] == 1 then
					if var_6_1[4] == 1023 then
						var_6_15 = true
						var_6_18 = 60

						log.info("guide.uiElementsTable[1023]", guide.uiElementsTable[1023])

						if guide.uiElementsTable[1023] then
							var_6_17 = true
						else
							guide.callback = var_6_20
							var_6_17 = false
						end
					end

					if var_6_1[4] == 1026 then
						var_6_15 = true
						var_6_18 = 60

						log.info("guide.uiElementsTable[1026]", guide.uiElementsTable[1026])

						if guide.uiElementsTable[1026] then
							var_6_17 = true
						else
							guide.callback = var_6_20
							var_6_17 = false
						end
					end
				end
			elseif var_6_1[2] == 5 then
				-- block empty
			elseif var_6_1[2] == 6 then
				-- block empty
			elseif var_6_1[2] == 7 then
				-- block empty
			end
		end

		if var_6_17 then
			var_6_20()
		end
	end

	log.info("markTraceTable[1] : ", var_6_1[1], var_6_1[2])

	if var_6_1[1] == "menu" then
		log.info("markTraceTable[1] == ", var_6_1[1])

		if var_6_1[2] then
			local var_6_21 = 3

			require("lua/layer/menu/ui")

			local function var_6_22()
				require("lua/guide/control")

				if guide.uiElementsTable[var_6_1[2]] and not tolua.isnull(guide.uiElementsTable[var_6_1[2]]) then
					local var_10_0, var_10_1 = tool.getPositionInScreen(guide.uiElementsTable[var_6_1[2]])

					if var_6_21 == 3 then
						var_10_1 = var_10_1 + guide.uiElementsTable[var_6_1[2]]:getContentSize().height
					elseif var_6_21 == 2 then
						var_10_0 = var_10_0 - guide.uiElementsTable[var_6_1[2]]:getContentSize().width - 20
					end

					guide.control.loadGuide2(var_6_2 + var_6_21, var_10_0, var_10_1, var_6_0, arg_6_1)
				else
					log.error("guide/control: no such ui element Id : ", var_6_1[2])
				end
			end

			var_6_21 = var_6_1[2] > 3 and 3 or 2

			if not menuUI.ui.isOpen and var_6_1[2] > 3 then
				log.info("menuUI.ui.isOpen :", menuUI.ui.isOpen)
				menuUI.ui.clickedMainItem(nil, nil, var_6_22)
			else
				log.info("menuUI.ui.isOpen :", menuUI.ui.isOpen)
				var_6_22()
			end
		end
	end
end

function guide.control.loadGuideByMarkTrace(arg_11_0, arg_11_1)
	local var_11_0 = 0

	if arg_11_1 then
		var_11_0 = 4
	end

	amgr.playEffect(enumAudioFile.ui_guide, false)
	require("lua/layer/general/ui")
	require("lua/layer/resource/ui")
	require("lua/layer/nation/ui")
	require("lua/layer/rankInfo/ui")
	require("lua/layer/technology/ui")
	require("lua/layer/equipment/ui")
	require("lua/layer/weaponTab/ui")

	local var_11_1 = {
		200006,
		200007,
		200009,
		200008,
		200023,
		200010
	}

	if arg_11_0 == nil or #arg_11_0 == 0 then
		return
	end

	local var_11_2 = string.split(arg_11_0, ":")

	for iter_11_0 = 2, #var_11_2 do
		var_11_2[iter_11_0] = tonumber(var_11_2[iter_11_0])
	end

	if var_11_2[1] == "city" then
		log.info("should goto 资源区")

		if var_11_2[2] == 0 then
			smgr.changeScene(SCENE_MAIN_CITY)

			if var_11_2[3] then
				require("lua/guide/control")

				if guide.uiElementsTable.city[var_11_2[3]] then
					local var_11_3, var_11_4 = tool.getPositionInScreen(guide.uiElementsTable.city[var_11_2[3]])
					local var_11_5 = var_11_4 + guide.uiElementsTable.city[var_11_2[3]]:getContentSize().height * 0.3

					guide.control.loadGuide2(var_11_0 + 3, var_11_3, var_11_5, true, arg_11_1)
				end
			end
		elseif var_11_2[2] == 5 then
			smgr.changeScene(var_11_1[var_11_2[2]])

			if var_11_2[3] and var_11_2[3] > 100 then
				require("lua/guide/control")

				if guide.uiElementsTable[var_11_2[3]] then
					local var_11_6, var_11_7 = tool.getPositionInScreen(guide.uiElementsTable[var_11_2[3]])
					local var_11_8 = var_11_7 + guide.uiElementsTable[var_11_2[3]]:getContentSize().height * 0.5

					guide.control.loadGuide2(var_11_0 + 3, var_11_6, var_11_8, true, arg_11_1)
				end
			end
		else
			log.info("cityMarkTrace ", var_11_1[var_11_2[2]])
			smgr.changeScene(var_11_1[var_11_2[2]])

			if var_11_2[3] then
				require("lua/guide/control")

				if guide.uiElementsTable[var_11_2[3]] then
					local var_11_9, var_11_10 = tool.getPositionInScreen(guide.uiElementsTable[var_11_2[3]])
					local var_11_11 = var_11_9 - guide.uiElementsTable[var_11_2[3]]:getContentSize().width - 30

					guide.control.loadGuide2(var_11_0 + 2, var_11_11, var_11_10, true, arg_11_1)
				end

				if var_11_2[3] < 100 then
					require("lua/layer/resourceArea2/uidata")

					local var_11_12 = getResourceUiData()["building_" .. var_11_2[2] .. "_" .. var_11_2[3]]

					if var_11_12 then
						require("lua/guide/control")

						local var_11_13 = var_11_12.x
						local var_11_14 = var_11_12.y + 50

						guide.control.loadGuide2(var_11_0 + 3, var_11_13, var_11_14, true, arg_11_1)
					end
				end
			end
		end
	elseif var_11_2[1] == "world" then
		if var_11_2[2] and var_11_2[2] ~= 0 then
			loadingLayer.show(SCENE_WORLD, var_11_2[2])
		else
			loadingLayer.show(SCENE_WORLD)
		end
	elseif var_11_2[1] == "instance" then
		require("lua/layer/selectInstance2/ui")
		require("lua/layer/selectInstance2/constant")
		log.info("should show instance ", var_11_2[2], var_11_2[3])
		smgr.changeScene(SCENE_INSTANCE, var_11_2[2])
		require("lua/guide/control")

		if var_11_2[3] and var_11_2[3] ~= 0 and selectInstanceConstant.NPC_POSITION[var_11_2[3]] then
			local var_11_15 = selectInstanceConstant.NPC_POSITION[var_11_2[3]]
			local var_11_16 = var_11_15.x
			local var_11_17 = var_11_15.y + 60

			if var_11_15 then
				guide.control.loadGuide2(var_11_0 + 3, var_11_16, var_11_17, true, arg_11_1)
			else
				log.error("taks/ui: no such position found")
			end
		end
	elseif var_11_2[1] == "panel" then
		local var_11_18 = true
		local var_11_19 = 3
		local var_11_20 = true

		local function var_11_21()
			log.info("should show arrow", var_11_2[4])

			if var_11_2[4] then
				require("lua/guide/control")

				local var_12_0
				local var_12_1 = 0

				if string.sub(var_11_2[4], 1, 7) == "tabItem" then
					local var_12_2 = tonumber(string.sub(var_11_2[4], 8, #var_11_2[4]))

					log.info("elementIndex : ", var_12_2, string.sub(var_11_2[4], 1, 7))

					var_12_0 = guide.curMenuItems[var_12_2]
					var_11_19 = 1
					var_11_18 = true
					var_12_1 = 90
				else
					var_12_0 = guide.uiElementsTable[var_11_2[4]]
				end

				log.info("ui element :", var_12_0)

				if var_12_0 then
					local var_12_3, var_12_4 = tool.getPositionInScreen(var_12_0)

					if var_11_18 then
						if var_11_19 == 3 then
							var_12_4 = var_12_4 + var_12_0:getContentSize().height
						elseif var_11_19 == 1 then
							var_12_4 = var_12_4 - var_12_0:getContentSize().height - var_12_1
						end
					end

					log.info("position :", var_12_3, var_12_4, var_12_0:getContentSize().height)
					guide.control.loadGuide2(var_11_0 + var_11_19, var_12_3, var_12_4, true, arg_11_1)
				else
					log.error("guide/control no such ui element Id : ", var_11_2[4])
				end
			end
		end

		if not var_11_2[4] then
			var_11_2[4] = "tabItem" .. var_11_2[3]
		end

		if var_11_2[2] == 1 then
			resourceUI.show(var_11_2[3], var_11_2[4])

			if var_11_2[3] <= 2 then
				var_11_18 = false
			end
		elseif var_11_2[2] == 2 then
			if var_11_2[3] == 1 or var_11_2[3] == 4 then
				var_11_18 = true
				var_11_20 = false
				guide.callback = var_11_21
			end

			if var_11_2[3] == 3 then
				var_11_18 = false
				var_11_20 = false
				guide.callback = var_11_21
			end

			showGeneralPanel(var_11_2[3], var_11_2[4])
		elseif var_11_2[2] == 3 then
			nationUI.show(var_11_2[3], var_11_2[4])
		elseif var_11_2[2] == 4 then
			if var_11_2[3] == 2 then
				require("lua/layer/equipment/storeHouse/ui")

				guide.callback = var_11_21
				var_11_20 = false
			end

			equipmentUI.show(var_11_2[3], var_11_2[4])
		elseif var_11_2[2] == 5 then
			technologyUI.show(var_11_2[3], var_11_2[4])
		elseif var_11_2[2] == 6 then
			rankInfoUI.show(var_11_2[3], var_11_2[4])
		elseif var_11_2[2] == 7 then
			weaponTab.ui.show(var_11_2[3], var_11_2[4])
		end

		if var_11_20 then
			var_11_21()
		end
	elseif var_11_2[1] == "menu" then
		if var_11_2[2] then
			if var_11_2[2] > 3 and (var_11_2[2] ~= 1005 and var_11_2[2] ~= 1018 or smgr.currentSceneTag == SCENE_INSTANCE) then
				require("lua/layer/menu/ui")

				local function var_11_22()
					require("lua/guide/control")

					if guide.uiElementsTable[var_11_2[2]] then
						local var_13_0, var_13_1 = tool.getPositionInScreen(guide.uiElementsTable[var_11_2[2]])
						local var_13_2 = var_13_1 + guide.uiElementsTable[var_11_2[2]]:getContentSize().height

						guide.control.loadGuide2(var_11_0 + 3, var_13_0, var_13_2, true, arg_11_1)
					else
						log.error("guide/control: no such ui element Id : ", var_11_2[2])
					end
				end

				if not menuUI.ui.isOpen then
					menuUI.ui.clickedMainItem(nil, nil, var_11_22)
				else
					var_11_22()
				end
			elseif var_11_2[2] == 1 and smgr.currentSceneTag == SCENE_WORLD or var_11_2[2] == 2 and smgr.currentSceneTag == SCENE_MAIN_CITY or var_11_2[2] == 3 and smgr.currentSceneTag == SCENE_INSTANCE then
				-- block empty
			else
				require("lua/guide/control")

				if guide.uiElementsTable[var_11_2[2]] then
					local var_11_23 = 3
					local var_11_24, var_11_25 = tool.getPositionInScreen(guide.uiElementsTable[var_11_2[2]])
					local var_11_26

					if var_11_2[2] > 5 then
						var_11_25 = var_11_25 + guide.uiElementsTable[var_11_2[2]]:getContentSize().height
						var_11_26 = 3
					else
						var_11_24 = var_11_24 - guide.uiElementsTable[var_11_2[2]]:getContentSize().width
						var_11_26 = 2
					end

					guide.control.loadGuide2(var_11_0 + var_11_26, var_11_24, var_11_25, true, arg_11_1)
				else
					log.error("guide/control: no such ui element Id : ", var_11_2[2])
				end
			end
		end
	elseif var_11_2[1] == "0" then
		log.info("dont need link")
	end
end

function guide.control.loadGuide2(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4)
	local var_14_0 = {}

	if conf.language == "kr" then
		var_14_0.w = 20
		var_14_0.h = 20
		var_14_0.fontY = 0
		var_14_0.fontSize = -1
	elseif conf.language == "vie" then
		var_14_0.w = 20
		var_14_0.h = 40
		var_14_0.fontY = -6
		var_14_0.fontSize = -2
	elseif conf.language == "tha" then
		var_14_0.w = 18
		var_14_0.h = 40
		var_14_0.fontY = -6
		var_14_0.fontSize = -1
	else
		var_14_0.w = 0
		var_14_0.h = 0
		var_14_0.fontY = 0
		var_14_0.fontSize = 0
	end

	local var_14_1 = {
		"up",
		"right",
		"down",
		"left",
		"text_up",
		"text_right",
		"text_down",
		"text_left"
	}
	local var_14_2 = tonumber(arg_14_0)

	if guide.ui.table[var_14_1[var_14_2]]:isVisible() and guide.ui.isVisible() then
		local var_14_3, var_14_4 = guide.ui.table[var_14_1[var_14_2]]:getPosition()

		log.info("x1,x;y1,y", var_14_3, arg_14_1, var_14_4, arg_14_2)

		if math.abs(var_14_3 - arg_14_1) <= 20 and math.abs(var_14_4 - arg_14_2) <= 20 then
			log.info("是重复箭头")

			return
		end
	end

	for iter_14_0, iter_14_1 in pairs(var_14_1) do
		guide.ui.table[iter_14_1]:stopAllActions()
		guide.ui.table[iter_14_1]:setVisible(false)
	end

	amgr.playEffect(enumAudioFile.ui_guide, false)
	log.info("fuck you,", arg_14_4)
	log.info("fuck you end", arg_14_4)

	if arg_14_4 then
		if arg_14_0 == 5 then
			local var_14_5 = CCStrokeLabelTTF:create(arg_14_4, "Thonburi-Bold", 20 + var_14_0.fontSize)

			var_14_5:setDimensions(CCSizeMake(160 + var_14_0.w, 80 + var_14_0.h))
			guide.ui.table[var_14_1[var_14_2]]:removeAllChildrenWithCleanup(true)
			guide.ui.table[var_14_1[var_14_2]]:addChild(var_14_5)
			var_14_5:setPosition(ccp(95, 35 + var_14_0.fontY))
		elseif arg_14_0 == 6 then
			local var_14_6 = CCStrokeLabelTTF:create(arg_14_4, "Thonburi-Bold", 20 + var_14_0.fontSize)

			var_14_6:setDimensions(CCSizeMake(160 + var_14_0.w, 80 + var_14_0.h))
			guide.ui.table[var_14_1[var_14_2]]:removeAllChildrenWithCleanup(true)
			guide.ui.table[var_14_1[var_14_2]]:addChild(var_14_6)
			var_14_6:setPosition(ccp(95, 35 + var_14_0.fontY))
		elseif arg_14_0 == 7 then
			local var_14_7 = CCStrokeLabelTTF:create(arg_14_4, "Thonburi-Bold", 20 + var_14_0.fontSize)

			var_14_7:setDimensions(CCSizeMake(160 + var_14_0.w, 80 + var_14_0.h))
			guide.ui.table[var_14_1[var_14_2]]:removeAllChildrenWithCleanup(true)
			guide.ui.table[var_14_1[var_14_2]]:addChild(var_14_7)
			var_14_7:setPosition(ccp(95, 65 + var_14_0.fontY))
		elseif arg_14_0 == 8 then
			local var_14_8 = CCStrokeLabelTTF:create(arg_14_4, "Thonburi-Bold", 20 + var_14_0.fontSize)

			var_14_8:setDimensions(CCSizeMake(160 + var_14_0.w, 80 + var_14_0.h))
			guide.ui.table[var_14_1[var_14_2]]:removeAllChildrenWithCleanup(true)
			guide.ui.table[var_14_1[var_14_2]]:addChild(var_14_8)
			var_14_8:setPosition(ccp(125, 35 + var_14_0.fontY))
		end
	end

	guide.ui.table[var_14_1[var_14_2]]:setPosition(ccp(arg_14_1, arg_14_2))
	guide.ui.table[var_14_1[var_14_2]]:setVisible(true)
	guide.control.actionShake(var_14_1[var_14_2], math.mod(var_14_2, 2))
	guide.ui.setVisible(true)

	guide.control.type = 2

	if arg_14_3 then
		log.info("registerScriptTouchHandler on guide layer")
		guide.ui.table.layer:registerScriptTouchHandler(function(arg_15_0, arg_15_1, arg_15_2)
			log.info("should hide guide layer")
			guide.ui.setVisible(false)
			guide.ui.table.layer:unregisterScriptTouchHandler()
		end)
		guide.ui.table.layer:setTouchEnabled(true)
	end
end

function guide.control.loadGuide(arg_16_0, arg_16_1)
	amgr.playEffect(enumAudioFile.ui_guide, false)

	local var_16_0 = guide.constant.guideFrame(arg_16_0, arg_16_1)

	if var_16_0 ~= nil then
		guide.control.calculatePosition(var_16_0)
		guide.ui.setVisible(true)

		guide.control.type = 1
	end
end

function guide.control.calculatePosition(arg_17_0)
	local var_17_0 = visibleSize.width * arg_17_0.centerX + arg_17_0.offsetX
	local var_17_1 = visibleSize.height * arg_17_0.centerY + arg_17_0.offsetY
	local var_17_2 = arg_17_0.width
	local var_17_3 = arg_17_0.height
	local var_17_4 = {
		"up",
		"right",
		"down",
		"left",
		"text_up",
		"text_right",
		"text_down",
		"text_left"
	}

	for iter_17_0, iter_17_1 in pairs(var_17_4) do
		guide.ui.table[iter_17_1]:stopAllActions()
		guide.ui.table[iter_17_1]:setVisible(false)
	end

	local var_17_5 = tonumber(arg_17_0.arrow) + 1
	local var_17_6 = guide.ui.table[var_17_4[var_17_5]]:getContentSize()
	local var_17_7 = {
		0,
		-var_17_6.width / 2 - var_17_2 / 2 - arg_17_0.space,
		0,
		var_17_6.width / 2 + var_17_2 / 2 + arg_17_0.space
	}
	local var_17_8 = {
		-var_17_6.height / 2 - var_17_3 / 2 - arg_17_0.space,
		0,
		var_17_6.height / 2 + var_17_3 / 2 + arg_17_0.space,
		0
	}

	guide.ui.table[var_17_4[var_17_5]]:setPosition(ccp(var_17_0 + var_17_7[var_17_5], var_17_1 + var_17_8[var_17_5]))
	guide.ui.table[var_17_4[var_17_5]]:setVisible(true)
	guide.control.actionShake(var_17_4[var_17_5], math.mod(var_17_5, 2))
end

function guide.control.actionShake(arg_18_0, arg_18_1)
	local var_18_0 = 20
	local var_18_1
	local var_18_2

	if arg_18_1 == 1 then
		var_18_1 = CCMoveBy:create(0.3, ccp(0, var_18_0))
		var_18_2 = CCMoveBy:create(0.3, ccp(0, -var_18_0))
	else
		var_18_1 = CCMoveBy:create(0.3, ccp(var_18_0, 0))
		var_18_2 = CCMoveBy:create(0.3, ccp(-var_18_0, 0))
	end

	local var_18_3 = CCArray:create()

	var_18_3:addObject(var_18_1)
	var_18_3:addObject(var_18_2)

	local var_18_4 = CCSequence:create(var_18_3)
	local var_18_5 = CCRepeatForever:create(tolua.cast(var_18_4, "CCActionInterval"))

	guide.ui.table[arg_18_0]:runAction(var_18_5)
end

function guide.control.game_exit()
	guide.constant.area = {}
	guide.constant.area[1] = false
	guide.constant.area[2] = false
	guide.constant.area[3] = false
	guide.constant.city = {}
	guide.constant.city[1] = false
	guide.constant.city[2] = false
	guide.constant.city[3] = false
	guide.constant.city[4] = false
	guide.constant.city[5] = false
	guide.constant.city[6] = false
	guide.constant.button = {}
	guide.constant.button[1] = false
	guide.constant.button[2] = false
	guide.constant.button[3] = false
	guide.constant.button[4] = false
	guide.constant.button[5] = false
	guide.constant.button[6] = false
	guide.constant.button[7] = false
	guide.constant.popui = {}
	guide.constant.popui[1] = {}
	guide.constant.popui[1][1] = false
	guide.constant.popui[1][2] = false
	guide.constant.popui[1][3] = false
	guide.constant.popui[1][4] = false
	guide.constant.popui[1][5] = false
	guide.constant.popui[2] = {}
	guide.constant.popui[2][1] = false
	guide.constant.popui[2][2] = false
	guide.constant.popui[2][3] = false
	guide.constant.popui[2][4] = false
	guide.constant.popui[2][5] = false
	guide.constant.popui[2][6] = false
	guide.constant.popui[3] = {}
	guide.constant.popui[3][1] = false
	guide.constant.popui[3][2] = false
	guide.constant.popui[3][3] = false
	guide.constant.popui[3][4] = false
	guide.constant.popui[3][5] = false
	guide.constant.popui[3][6] = false
	guide.constant.popui[3][7] = false
	guide.constant.popui[4] = {}
	guide.constant.popui[4][1] = false
	guide.constant.popui[4][2] = false
	guide.constant.popui[4][3] = false
	guide.constant.popui[4][4] = false
	guide.constant.popui[4][5] = false
	guide.constant.popui[5] = {}
	guide.constant.popui[5][1] = false
	guide.constant.popui[5][2] = false
	guide.constant.popui[6] = {}
	guide.constant.popui[6][1] = false
	guide.constant.popui[6][2] = false
	guide.constant.popui[6][3] = false
	guide.constant.popui[6][4] = false
	guide.constant.popui[6][5] = false
	guide.constant.popui[7] = {}
	guide.constant.popui[7][1] = false
	guide.constant.popui[7][2] = false
	guide.constant.other = {}
	guide.constant.other[1] = false
	guide.constant.other[2] = false
	guide.constant.other[3] = false
	guide.constant.other[4] = false
	guide.constant.other[5] = false
end
