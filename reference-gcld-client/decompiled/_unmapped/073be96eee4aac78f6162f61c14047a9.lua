require("lua/common/tool")

buildTechControl = {}

local var_0_0 = buildTechControl

function var_0_0.onEnter()
	eventManager.registerEvent("learnFirstSkill", var_0_0.learnFirstSkill)
end

function var_0_0.onExit()
	eventManager.unregisterEvent("learnFirstSkill", var_0_0.learnFirstSkill)
end

function var_0_0.learnFirstSkill()
	local function var_3_0(arg_4_0)
		if arg_4_0.action.data then
			local function var_4_0(arg_5_0)
				if arg_5_0.action.data then
					buildTechUI.data = arg_5_0.action.data

					buildTechUI.setBuildingTechData()
				end
			end

			cmgr.sendRequest(var_4_0, actions.getWorkerTechInfo)
		end
	end

	cmgr.sendRequest(var_3_0, actions.learnSkill, 1, buildTechUI.data.vId)
end

function var_0_0.onTouch(arg_6_0, arg_6_1, arg_6_2)
	log.debug("touched  at " .. arg_6_1 .. ", " .. arg_6_2)

	if arg_6_0 == CCTOUCHBEGAN then
		for iter_6_0 = 1, 9 do
			if buildTechUI.uiTable["buildTech_" .. iter_6_0] and tool.checkIfTouch(buildTechUI.uiTable["buildTech_" .. iter_6_0], arg_6_1, arg_6_2) then
				local var_6_0 = buildTechUI.data.techs[iter_6_0 - 1]

				if var_6_0 and var_6_0.learned == false and var_6_0.canLearn == true then
					local function var_6_1(arg_7_0)
						if arg_7_0.action.data then
							local function var_7_0(arg_8_0)
								if arg_8_0.action.data then
									buildTechUI.data = arg_8_0.action.data

									buildTechUI.setBuildingTechData()
								end
							end

							cmgr.sendRequest(var_7_0, actions.getWorkerTechInfo)
						end
					end

					var_6_0.intro = string.gsub(var_6_0.intro, "<!%[CDATA%[", "")
					var_6_0.intro = string.gsub(var_6_0.intro, "]]>", "")
					var_6_0.intro = string.gsub(var_6_0.intro, "<font color=\"#%w+\">", "")
					var_6_0.intro = string.gsub(var_6_0.intro, "</font>", "")
					var_6_0.intro = string.gsub(var_6_0.intro, "<br>", "\n")

					if var_6_0.type == 3 then
						messageBox.confirm(language.get("222005_buildingTech", var_6_0.gold, var_6_0.name, var_6_0.intro), function()
							cmgr.sendRequest(var_6_1, actions.learnSkill, var_6_0.id, buildTechUI.data.vId)
						end)
					elseif var_6_0.type == 4 then
						messageBox.confirm(var_6_0.intro, function()
							cmgr.sendRequest(var_6_1, actions.learnSkill, var_6_0.id, buildTechUI.data.vId)
						end)
					else
						messageBox.confirm(language.get("222004_buildingTech", var_6_0.num, var_6_0.name, var_6_0.intro), function()
							cmgr.sendRequest(var_6_1, actions.learnSkill, var_6_0.id, buildTechUI.data.vId)
						end)
					end
				elseif var_6_0 == nil or var_6_0.isLocked == false then
					buildTechUI.handleTipsButtonTap(iter_6_0)
				end
			end
		end

		return true
	elseif arg_6_0 == CCTOUCHMOVED then
		return true
	elseif arg_6_0 == CCTOUCHENDED then
		return true
	end
end
