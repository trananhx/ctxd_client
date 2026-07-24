require("lua/layer/nation/taskTab/constant")
require("lua/layer/world/constant")
require("lua/component/timerLabel")

local var_0_0 = require("lua/common/json")
local var_0_1 = class("taskTab", function()
	return createBaseLayer()
end)

currentGongshouCityPage = 1

function var_0_1.ctor(arg_2_0, arg_2_1)
	local var_2_0

	local function var_2_1(arg_3_0)
		if arg_2_1 == nil then
			if arg_3_0.taskType == 8 then
				local var_3_0 = tostring(arg_3_0.data.tasks[1].taskId)

				if tonumber(string.sub(var_3_0, 2, 2)) > 3 then
					arg_2_1 = taskTabConstant.TYPES.NATION_HELP_BAR_TASK
				else
					arg_2_1 = taskTabConstant.TYPES.NATION_PROTECT_TASK
				end
			elseif arg_3_0.taskType == 4 then
				arg_2_1 = taskTabConstant.TYPES.NATION_DONATION_TASK
			elseif arg_3_0.taskType == 5 then
				arg_2_1 = taskTabConstant.TYPES.NATION_BUDOKAI_TASK
			elseif arg_3_0.taskType == 1 then
				arg_2_1 = taskTabConstant.TYPES.NATION_ATTACK_DEFENSE_TASK
			elseif arg_3_0.taskType == 6 then
				arg_2_1 = taskTabConstant.TYPES.NATION_EXPAND_TASK
			elseif arg_3_0.taskType == 7 then
				arg_2_1 = taskTabConstant.TYPES.NATION_ATTACK_BAR_TASK
			elseif arg_3_0.taskType == 9 then
				arg_2_1 = taskTabConstant.TYPES.NATION_ATTACK_THIEF_TASK
			elseif arg_3_0.taskType == 10 then
				arg_2_1 = taskTabConstant.TYPES.NATION_BUILDING_TASK
			elseif arg_3_0.taskType == 12 then
				arg_2_1 = taskTabConstant.TYPES.NATION_LANTERN_TASK
			elseif arg_3_0.taskType == 13 then
				arg_2_1 = taskTabConstant.TYPES.NATION_ATTACK_DEFENSE_TASK
			elseif arg_3_0.taskType == 16 then
				arg_2_1 = taskTabConstant.TYPES.NATION_JBYW_TASK
			end
		end

		arg_2_0:removeAllChildrenWithCleanup(true)

		var_2_0 = require("lua/layer/nation/taskTab/uidata").new(arg_2_1)
		arg_2_0.uiTable = autoUI.initUI(arg_2_0, var_2_0:getData())

		if arg_2_1 == nil then
			arg_2_0.uiTable.bar1:setScaleX(0.6)
			arg_2_0.uiTable.bar2:setScaleX(0.6)
			arg_2_0.uiTable.bar1:setVisible(true)
			arg_2_0.uiTable.bar2:setVisible(true)

			local var_3_1 = arg_2_0.uiTable.txt1:getContentSize().width
			local var_3_2, var_3_3 = arg_2_0.uiTable.txt1:getPosition()

			arg_2_0.uiTable.txt2:setPositionX(var_3_2 + var_3_1)
			arg_2_0.uiTable.txt2:setVisible(true)
		elseif arg_2_1 == taskTabConstant.TYPES.NATION_TRY_TASK then
			if arg_3_0.data.rank == 0 then
				arg_2_0.uiTable.taskNoReward:setVisible(true)
			else
				arg_2_0.uiTable.taskExp:setString(arg_3_0.data.exp)
				arg_2_0.uiTable.taskIron:setString(arg_3_0.data.iron)
				arg_2_0.uiTable.taskWinExp:setString(arg_3_0.data.winExp)
				arg_2_0.uiTable.taskWinIron:setString(arg_3_0.data.winIron)
				arg_2_0.uiTable.taskKuangExp:setVisible(true)
				arg_2_0.uiTable.taskKuangIron:setVisible(true)
				arg_2_0.uiTable.taskKuangWinExp:setVisible(true)
				arg_2_0.uiTable.taskKuangWinIron:setVisible(true)
			end

			if arg_3_0.data.stage == 4 then
				arg_2_0.uiTable.drawReward:setVisible(true)
				arg_2_0.uiTable.drawReward:registerScriptTapHandler(function()
					arg_3_0:getTryTaskReward()
				end)
			end

			if arg_3_0.data.rate < 100 then
				tool.spriteToGray(arg_2_0.uiTable.taskKuangWinExp, true)
				tool.spriteToGray(arg_2_0.uiTable.taskKuangWinIron, true)
			end

			arg_2_0.uiTable.rankText:setString(language.get(95001) .. arg_3_0.data.rank)

			if arg_3_0.data.title == "" then
				arg_3_0.data.title = nil
			end

			arg_3_0.data.title = arg_3_0.data.title or "chenghao1"

			arg_2_0.uiTable.title:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(arg_3_0.data.title .. ".png"))
		elseif arg_2_1 == taskTabConstant.TYPES.NATION_UPGRADE_TASK then
			arg_2_0.uiTable.taskDetail:setString(language.get(95027, arg_3_0.data.tasks[1].cityName, arg_3_0.data.tasks[1].requestKillNum))
			arg_2_0.uiTable.taskPercentage:setString(arg_3_0.data.tasks[1].percentage or "0")
		elseif arg_2_1 == taskTabConstant.TYPES.NATION_PROTECT_TASK then
			arg_2_0.uiTable.taskDetail:setString(language.get(95002))

			local var_3_4 = 0

			if arg_3_0.data.tasks[1].warInfo then
				for iter_3_0, iter_3_1 in pairs(arg_3_0.data.tasks[1].warInfo) do
					var_3_4 = var_3_4 + iter_3_1.sdCitySize
				end
			end

			arg_2_0.uiTable.taskCityInWar:setString(language.get(95028, var_3_4))
			arg_2_0.uiTable.taskKill:setString(language.get(95003) .. arg_3_0.data.tasks[1].nationKill)
		elseif arg_2_1 == taskTabConstant.TYPES.NATION_HELP_BAR_TASK then
			arg_2_0.uiTable.taskDetail:setString(language.get(95004))

			local var_3_5 = 0

			if arg_3_0.data.tasks[1].warInfo then
				for iter_3_2, iter_3_3 in pairs(arg_3_0.data.tasks[1].warInfo) do
					var_3_5 = var_3_5 + iter_3_3.sdCitySize
				end
			end

			arg_2_0.uiTable.taskCityInWar:setString(language.get(95028, var_3_5))
			arg_2_0.uiTable.taskKill:setString(language.get(95005) .. arg_3_0.data.tasks[1].nationKill)
		elseif arg_2_1 == taskTabConstant.TYPES.NATION_ATTACK_DEFENSE_TASK then
			if arg_3_0.data.tasks then
				arg_2_0.localTaskData = arg_3_0.data.tasks
			end

			if arg_3_0.data.tasks[1].canGetReward == true then
				currentGongshouCityPage = 1
			elseif arg_3_0.data.tasks[2] and arg_3_0.data.tasks[2].canGetReward == true then
				currentGongshouCityPage = 2
			end

			local var_3_6 = createTimerLabel(0, "@H:@M:@S", "Thonburi-bold", 24, nil, nil, nil, ccc3(255, 248, 197))

			arg_2_0.uiTable.daojishi:removeChildByTag(2345, true)
			arg_2_0.uiTable.daojishi:addChild(var_3_6, 100, 2345)

			local var_3_7 = arg_2_0.uiTable.daojishi:getContentSize().width

			var_3_6:setPosition(ccp(var_3_7 / 2, -15))

			arg_2_0.uiTable.gongshourenwu_timer = var_3_6

			arg_2_0:setNationMap(arg_3_0.data.tasks, arg_3_0.data.granary)

			local var_3_8 = createBaseLayer()
			local var_3_9 = CCScrollView:create(CCSizeMake(550, 380))

			var_3_9:setContainer(var_3_8)
			var_3_9:setPosition(300, 70)
			var_3_9:setContentSize(CCSizeMake(1300, 380))
			var_3_9:setDirection(kCCScrollViewDirectionHorizontal)
			var_3_9:setTouchEnabled(false)
			arg_2_0.uiTable.background:addChild(var_3_9, 10)

			arg_2_0.uiTable.gongshourenwu_scoll = var_3_9
			arg_2_0.uiTable.gongshourenwu_scoll_layer = var_3_8

			if currentGongshouCityPage == 1 then
				arg_2_0.uiTable.gongshourenwu_scoll_layer:setPosition(ccp(0, 0))
			else
				arg_2_0.uiTable.gongshourenwu_scoll_layer:setPosition(ccp(-750, 0))
			end

			arg_2_0:setArrow()

			local var_3_10 = autoUI.initUI(var_3_8, var_2_0:getNewNationTaskData())

			for iter_3_4, iter_3_5 in pairs(arg_3_0.data.tasks) do
				local var_3_11 = iter_3_5.attType == 0 and language.get(95007) or language.get(95008)

				if iter_3_5.attType == nil then
					var_3_11 = language.get(95007)
				end

				if currentGongshouCityPage == iter_3_4 then
					var_3_6:setTime(iter_3_5.deadTime)
				end

				if iter_3_5.continentType and iter_3_5.continentType == 0 then
					if currentGongshouCityPage == iter_3_4 and iter_3_5.attType then
						arg_2_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nationTask/thunder/lxgs_title_0000s_0004_shandianzhan.png"):displayFrame())
					end

					if iter_3_5.attType == 0 then
						var_3_11 = language.get(92019)
					elseif iter_3_5.attType == 1 then
						var_3_11 = language.get(92020)
					end
				elseif iter_3_5.continentType and iter_3_5.continentType == 1 then
					if currentGongshouCityPage == iter_3_4 then
						if iter_3_5.attType == 0 then
							arg_2_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nationTask/thunder/lxgs_title_0000s_0001_zhanlingchengchi.png"):displayFrame())
						elseif iter_3_5.attType == 1 then
							arg_2_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nationTask/thunder/lxgs_title_0000s_0005_jianshouchengchi.png"):displayFrame())
						end
					end
				elseif iter_3_5.continentType and iter_3_5.continentType == 2 then
					if currentGongshouCityPage == iter_3_4 then
						if iter_3_5.attType == 0 then
							arg_2_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nationTask/thunder/lxgs_title_0000s_0000_zaixiayicheng.png"):displayFrame())
						elseif iter_3_5.attType == 1 then
							arg_2_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nationTask/thunder/lxgs_title_0000s_0007_beishuiyizhan.png"):displayFrame())
						end
					end

					var_3_11 = iter_3_5.attType == 0 and language.get(92021) or language.get(92022)
				elseif iter_3_5.continentType and iter_3_5.continentType == 3 then
					if currentGongshouCityPage == iter_3_4 then
						if iter_3_5.attType == 0 then
							arg_2_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nationTask/thunder/lxgs_title_0000s_0002_fanshouweigong.png"):displayFrame())
						elseif iter_3_5.attType == 1 then
							arg_2_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nationTask/thunder/lxgs_title_0000s_0006_diyufanji.png"):displayFrame())
						end
					end

					var_3_11 = iter_3_5.attType == 0 and language.get(92023) or language.get(92024)
				elseif currentGongshouCityPage == iter_3_4 then
					arg_2_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nationTask/thunder/lxgs_title_0000s_0008_gongshouchengchi.png"):displayFrame())
				end

				var_3_10["cityLink_" .. iter_3_4]:registerScriptTapHandler(function()
					smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
					loadingLayer.show(SCENE_WORLD, iter_3_5.cityId)
				end)

				local var_3_12 = false

				if iter_3_5.taskState ~= 0 then
					var_3_12 = true
				end

				local var_3_13 = language.get(460037, user.forceIdToName[iter_3_5.cityForceId])

				var_3_10["taskAttType_" .. iter_3_4]:setString(var_3_11 .. "(" .. var_3_13 .. "):")

				if iter_3_5.continentType and (iter_3_5.continentType == 2 or iter_3_5.continentType == 3) then
					var_3_10["taskAttType_" .. iter_3_4]:setString(var_3_11 .. ":")
				end

				var_3_10["taskCityTarget_" .. iter_3_4]:setString(tostring(iter_3_5.cityName))

				if iter_3_5.rankNum > 0 then
					var_3_10["taskRankNum_" .. iter_3_4]:setString(language.get(92017, iter_3_5.rankNum))
				else
					var_3_10["taskRankNum_" .. iter_3_4]:setString(language.get(95035))
				end

				if iter_3_5.isSpecailCity == true then
					var_3_10["specialCity_" .. iter_3_4]:setVisible(true)
				else
					var_3_10["specialCity_" .. iter_3_4]:setVisible(false)
				end

				if var_3_12 == true and iter_3_5.taskState ~= 0 then
					local var_3_14
					local var_3_15 = iter_3_5.taskState == 1 and "nation_task_defe.png" or "tuzhang_yiwancheng.png"

					var_3_10["taskStateFrame_" .. iter_3_4]:setVisible(true)
					var_3_10["taskStateFrame_" .. iter_3_4]:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_3_15))
				end

				if var_3_12 == true and iter_3_5.isRewarded ~= 0 then
					var_3_10["taskIsRewarded_" .. iter_3_4]:setVisible(true)
				end

				iter_3_5.titlePic = iter_3_5.titlePic or "chenghao1"

				var_3_10["taskTitle_" .. iter_3_4]:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(iter_3_5.titlePic .. ".png"))

				if iter_3_5.rankNum == 0 then
					var_3_10["taskNoReward_" .. iter_3_4]:setVisible(true)
				else
					local var_3_16 = 120

					if #iter_3_5.rewards + #iter_3_5.extraRewards == 5 then
						var_3_16 = 55
					elseif #iter_3_5.rewards + #iter_3_5.extraRewards == 4 then
						var_3_16 = 90
					end

					for iter_3_6, iter_3_7 in pairs(iter_3_5.rewards) do
						local var_3_17 = iter_3_6

						var_3_10["taskRewardBlock_" .. iter_3_4 .. "_" .. var_3_17]:setVisible(true)
						var_3_10["taskRewardBlock_" .. iter_3_4 .. "_" .. var_3_17]:setPosition(ccp(var_3_16 + (iter_3_6 - 1) * 90 + 40, -35))
						var_3_10["taskRewardValue_" .. iter_3_4 .. "_" .. var_3_17]:setString(iter_3_7.value)

						if iter_3_7.type == 17 then
							var_3_10["gerenjiangli_" .. iter_3_4 .. "_" .. var_3_17]:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/task/get_icon_gem.png"))
						elseif iter_3_7.type == 4 then
							var_3_10["gerenjiangli_" .. iter_3_4 .. "_" .. var_3_17]:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/task/get_icon_iron.png"))
						elseif iter_3_7.type == 21 then
							var_3_10["gerenjiangli_" .. iter_3_4 .. "_" .. var_3_17]:setDisplayFrame(CCSprite:create("res/ui/task/get_icon_silk.png"):displayFrame())
						elseif iter_3_7.type == 1905 then
							var_3_10["gerenjiangli_" .. iter_3_4 .. "_" .. var_3_17]:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/weapon/diamondShop/bssh_icon_bssq.png"))
						end
					end

					for iter_3_8, iter_3_9 in pairs(iter_3_5.extraRewards) do
						local var_3_18 = iter_3_8 + 3

						var_3_10["taskRewardBlock_" .. iter_3_4 .. "_" .. var_3_18]:setVisible(true)
						var_3_10["taskRewardBlock_" .. iter_3_4 .. "_" .. var_3_18]:setPosition(ccp(var_3_16 + (iter_3_8 - 1 + #iter_3_5.rewards) * 90 + 40, -35))

						if iter_3_9.type == 17 then
							var_3_10["gerenjiangli_" .. iter_3_4 .. "_" .. var_3_18]:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/task/get_icon_gem.png"))
						elseif iter_3_9.type == 4 then
							var_3_10["gerenjiangli_" .. iter_3_4 .. "_" .. var_3_18]:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/task/get_icon_iron.png"))
						elseif iter_3_9.type == 21 then
							var_3_10["gerenjiangli_" .. iter_3_4 .. "_" .. var_3_18]:setDisplayFrame(CCSprite:create("res/ui/task/get_icon_silk.png"):displayFrame())
						elseif iter_3_9.type == 216 then
							var_3_10["gerenjiangli_" .. iter_3_4 .. "_" .. var_3_18]:setDisplayFrame(CCSprite:create("res/ui/weapon/machine/zc_yt_icon.png"):displayFrame())
						elseif iter_3_9.type == 1905 then
							var_3_10["gerenjiangli_" .. iter_3_4 .. "_" .. var_3_18]:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/weapon/diamondShop/bssh_icon_bssq.png"))
						end

						if iter_3_5.taskState ~= 2 then
							tool.spriteToGray(var_3_10["taskRewardBlock_" .. iter_3_4 .. "_" .. var_3_18], true)
						end

						var_3_10["taskRewardValue_" .. iter_3_4 .. "_" .. var_3_18]:setString(iter_3_9.value)

						if iter_3_5.hasPredicateRewards then
							var_3_10["taskCorner_" .. iter_3_4 .. "_" .. var_3_18]:setDisplayFrame(CCSprite:create("res/ui/nationTask/strategy/gzxce_word_jb_jc.png"):displayFrame())
							var_3_10["taskCorner_" .. iter_3_4 .. "_" .. var_3_18]:setPosition(ccp(22, 55))
							var_3_10["taskCorner_" .. iter_3_4 .. "_" .. var_3_18]:removeAllChildrenWithCleanup(true)
						elseif iter_3_5.leagueForce and iter_3_5.leagueForce > 0 then
							var_3_10["taskCorner_" .. iter_3_4 .. "_" .. var_3_18]:setDisplayFrame(CCSprite:create("res/ui/nationTask/attdefzhiyuanling/gsrw_tmjb.png"):displayFrame())
							var_3_10["taskCorner_" .. iter_3_4 .. "_" .. var_3_18]:setPosition(ccp(39, 39))
							var_3_10["taskCorner_" .. iter_3_4 .. "_" .. var_3_18]:removeAllChildrenWithCleanup(true)

							if iter_3_5.taskState == 1 then
								tool.spriteToGray(var_3_10["taskCorner_" .. iter_3_4 .. "_" .. var_3_18], false)
							end
						elseif iter_3_5.taskState == 1 then
							var_3_10["taskCorner_" .. iter_3_4 .. "_" .. var_3_18]:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("nation_task_win_icon_gray.png"))
						end
					end
				end

				if iter_3_5.canGetReward == true then
					var_3_10["drawReward_" .. iter_3_4]:setVisible(true)
					var_3_10["drawReward_" .. iter_3_4]:registerScriptTapHandler(function()
						arg_3_0:getNationTaskReward(iter_3_5.taskId)
					end)
				end
			end

			local var_3_19 = false

			if arg_3_0.data.tasks[1].canGetReward == false and arg_3_0.data.tasks[1].nextTaskTime then
				if arg_3_0.data.tasks[2] then
					if arg_3_0.data.tasks[2].canGetReward == false and arg_3_0.data.tasks[2].nextTaskTime then
						var_3_19 = true
					end
				else
					var_3_19 = true
				end
			end

			if var_3_19 then
				arg_2_0.uiTable.taskNext:setVisible(true)
				arg_2_0.uiTable.taskNextHour:setString(arg_3_0.data.tasks[1].nextTaskTime)
				arg_2_0.uiTable.gongshourenwu_timer:setTime(0)
			end

			local var_3_20 = arg_3_0.data.tasks[1]

			for iter_3_10, iter_3_11 in ipairs(arg_3_0.data.tasks) do
				if iter_3_11.canGetReward then
					var_3_20 = iter_3_11
				end
			end

			local var_3_21 = var_3_20.indivTasks
			local var_3_22 = false
			local var_3_23 = true
			local var_3_24 = ""
			local var_3_25 = ""
			local var_3_26 = ""

			if var_3_20.special then
				var_3_24 = language.get(92126)
				var_3_25 = language.get(92115)
			elseif var_3_20.strategy then
				if var_3_20.strategy.strategy == "drawBack" then
					var_3_24 = language.get("205528_zww")
					var_3_25 = language.get(205525, var_3_20.strategy.nowCityName)
				elseif var_3_20.strategy.strategy == "surround" then
					var_3_24 = language.get("205529_zww")
					var_3_25 = language.get(205524, var_3_20.strategy.nowCityName)
				elseif var_3_20.strategy.strategy == "killAll" then
					var_3_24 = language.get(205516)
					var_3_25 = language.get(205526, language.get(460037, user.forceIdToName[var_3_20.strategy.concernNation]), var_3_20.strategy.target)
				elseif var_3_20.strategy.strategy == "ysProvoke" then
					var_3_24 = language.get(205531)
					var_3_25 = language.get(219101)
					var_3_26 = language.get(219111)
					var_3_22 = true
				elseif var_3_20.strategy.strategy == "hjRebel" then
					var_3_24 = language.get(205532)
					var_3_25 = language.get(219100)
					var_3_26 = language.get(219110)
					var_3_22 = true
				elseif var_3_20.strategy.strategy == "barInvade" then
					var_3_24 = language.get(205533)
					var_3_25 = language.get(219102)
					var_3_26 = language.get(219112)
					var_3_22 = true
				end

				if var_3_22 then
					local var_3_27 = var_3_20.strategy.targetCity or var_3_20.strategy.fromCityId

					if var_3_27 and var_3_27 > 0 then
						local var_3_28 = 48
						local var_3_29 = 79
						local var_3_30 = 191
						local var_3_31 = 123
						local var_3_32 = worldConstant.BUILDING_INFO["world_building_" .. var_3_27]
						local var_3_33 = var_3_32.x + 90.5
						local var_3_34 = 3600 - var_3_32.y - 64
						local var_3_35 = var_3_33 / 6000 * var_3_30
						local var_3_36 = var_3_34 / 3600 * var_3_31
						local var_3_37 = CCSprite:create("res/ui/nationTask/strategy/zqcl_flag_" .. var_3_20.strategy.strategy .. ".png")

						var_3_37:setPosition(ccp(var_3_28 + var_3_35, var_3_29 + var_3_36))
						arg_2_0.uiTable.taskMap:addChild(var_3_37, 100)

						arg_2_0.uiTable["dot_" .. var_3_27] = var_3_37
					end

					if var_3_20.predicateDecision and var_3_20.predicateDecision > 0 and var_3_20.votes then
						local var_3_38 = {
							[1905] = "res/ui/weapon/diamondShop/bssh_icon_bssq.png",
							[10] = "res/ui/task/get_icon_exp.png",
							[4] = "res/ui/task/get_icon_iron.png",
							[17] = "res/ui/task/get_icon_gem.png",
							[216] = "res/ui/weapon/machine/zc_yt_icon.png",
							[21] = "res/ui/task/get_icon_silk.png"
						}
						local var_3_39 = CCLabelTTF:create(var_3_26, "Thonburi", 22)

						var_3_39:setColor(colorQuality[4])
						var_3_39:setPosition(ccp(90, -25))
						arg_2_0.uiTable.taskMap:addChild(var_3_39)

						local var_3_40 = var_3_20.votes[var_3_20.predicateDecision] and var_3_20.votes[var_3_20.predicateDecision].rewards

						if var_3_40 then
							for iter_3_12, iter_3_13 in pairs(var_3_40) do
								local var_3_41 = tool.spriteByName("jianglikuang1.png")

								var_3_41:setPosition(ccp(var_3_39:getPositionX() + 20 + iter_3_12 * 90, var_3_39:getPositionY()))

								local var_3_42 = var_3_38[iter_3_13.type] or ""
								local var_3_43 = CCSprite:create(var_3_42)

								var_3_43:setPosition(ccp(40, 40))
								var_3_41:addChild(var_3_43, 10)

								local var_3_44 = CCLabelTTF:create(iter_3_13.value, "Thonburi", 22)

								var_3_44:setPosition(ccp(40, 20))
								var_3_41:addChild(var_3_44, 20)
								arg_2_0.uiTable.taskMap:addChild(var_3_41)
							end
						end
					end
				end
			elseif var_3_20.predicateDecision == 1 then
				var_3_24 = language.get(92127)
				var_3_25 = language.get(205500)
			elseif var_3_20.predicateDecision == 2 then
				var_3_24 = language.get(92128)
				var_3_25 = language.get(92114)

				if var_3_20.relativeState == "STRONG" then
					var_3_25 = language.get(205501)
				end
			end

			local var_3_45 = var_3_20.predicateExtraRewards

			if var_3_20.predicateRewarded then
				var_3_45 = nil
			end

			if var_3_20.predicateState == 0 or user.taskDecide then
				var_3_23 = false

				var_3_9:setVisible(false)
				arg_2_0.uiTable.arrow1:removeFromParentAndCleanup(true)
				arg_2_0.uiTable.arrow2:removeFromParentAndCleanup(true)

				arg_2_0.uiTable.arrow1 = nil
				arg_2_0.uiTable.arrow2 = nil

				arg_2_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nationTask/strategy/gzxce_title_clxz.png"):displayFrame())

				local var_3_46 = arg_2_0.uiTable.gongshou_title:getParent()
				local var_3_47 = require("lua/layer/nation/taskTab/VotePanel").new(var_3_46, var_3_20, arg_3_0)
			elseif not var_3_19 and arg_3_0.data.needTransfer and var_3_21 and #var_3_21 > 0 then
				local var_3_48
				local var_3_49 = false
				local var_3_50 = false

				for iter_3_14, iter_3_15 in ipairs(var_3_21) do
					if iter_3_15.taskIndex then
						if iter_3_15.process >= iter_3_15.goal then
							if iter_3_15.hasRewarded then
								if iter_3_15.taskIndex == iter_3_15.taskTotalIndex then
									var_3_48 = iter_3_15
									var_3_50 = true

									break
								end
							else
								var_3_48 = iter_3_15
								var_3_49 = true

								break
							end
						else
							var_3_48 = iter_3_15

							break
						end
					end
				end

				if var_3_48 then
					local var_3_51 = {
						[1905] = "res/ui/weapon/diamondShop/bssh_icon_bssq.png",
						[10] = "res/ui/task/get_icon_exp.png",
						[4] = "res/ui/task/get_icon_iron.png",
						[17] = "res/ui/task/get_icon_gem.png",
						[216] = "res/ui/weapon/machine/zc_yt_icon.png",
						[21] = "res/ui/task/get_icon_silk.png"
					}

					var_3_9:setVisible(false)
					arg_2_0.uiTable.arrow1:removeFromParentAndCleanup(true)
					arg_2_0.uiTable.arrow2:removeFromParentAndCleanup(true)

					arg_2_0.uiTable.arrow1 = nil
					arg_2_0.uiTable.arrow2 = nil

					arg_2_0.uiTable.bg_indiv2:setVisible(true)
					arg_2_0.uiTable.bg_indiv3:setVisible(true)
					arg_2_0.uiTable.process_indiv:setPercentage(100 * var_3_48.process / var_3_48.goal)
					arg_2_0.uiTable.num_indiv:setString(language.get(390478, tool.getFormatNum(var_3_48.process), tool.getFormatNum(var_3_48.goal)))
					arg_2_0.uiTable.idx_indiv:setString(language.get(390478, var_3_48.taskIndex, var_3_48.taskTotalIndex))
					arg_2_0.uiTable.name_indiv:setString(var_3_48.name)
					arg_2_0.uiTable.indiv_finish:setVisible(var_3_50)
					arg_2_0.uiTable.lbl_indiv:setVisible(not var_3_50)
					arg_2_0.uiTable.btn_reward_indiv1:setVisible(var_3_49)

					if var_3_45 then
						arg_2_0.uiTable.bg_process_indiv:setVisible(false)
						arg_2_0.uiTable.process_indiv:setVisible(false)
						arg_2_0.uiTable.num_indiv:setVisible(false)
						arg_2_0.uiTable.icon_indiv:setDisplayFrame(CCSprite:create("res/ui/task/task1.png"):displayFrame())
						arg_2_0.uiTable.idx_indiv:setString(language.get(92121))
						arg_2_0.uiTable.btn_reward_indiv1:registerScriptTapHandler(function()
							arg_3_0:getExtraReward()
						end)

						local var_3_52 = CCLabelTTF:create(var_3_24, "Thonburi", 28)

						var_3_52:setColor(colorQuality[4])

						local var_3_53 = CCLabelTTF:create(language.get(92132), "Thonburi", 28)

						var_3_53:setColor(colorQuality[5])

						local var_3_54 = createRichNode({
							var_3_52,
							var_3_53
						}, 0)

						var_3_54:setPosition(ccp(105, -5))
						arg_2_0.uiTable.bg_indiv2:addChild(var_3_54)
					else
						if var_3_48.innerType == 1 and var_3_48.indivLeftTime and var_3_48.indivLeftTime > 0 and var_3_48.innerType == 1 and var_3_48.indivLeftTime and var_3_48.indivLeftTime > 0 then
							local var_3_55 = createTimerLabel(var_3_48.indivLeftTime, "@M:@S", "Thonburi", 22, function()
								arg_3_0:getTaskInfo(nil)
								arg_2_0.uiTable.timer:removeFromParentAndCleanup(true)

								arg_2_0.uiTable.timer = nil
							end, nil, nil, colorTips.red)

							var_3_55:setPosition(ccp(210, 30))
							arg_2_0.uiTable.bg_indiv2:addChild(var_3_55, 200)

							arg_2_0.uiTable.timer = var_3_55
						end

						if var_3_49 then
							arg_2_0.uiTable.btn_reward_indiv1:registerScriptTapHandler(function()
								arg_3_0:getIndivReward(var_3_48)
							end)
						end
					end

					arg_2_0.uiTable.btn_reward_indiv2:setVisible(var_3_20.canGetReward)

					if var_3_20.canGetReward then
						arg_2_0.uiTable.btn_reward_indiv2:registerScriptTapHandler(function()
							arg_3_0:getNationTaskReward(var_3_20.taskId)
						end)
					end

					if not var_3_50 then
						local var_3_56 = var_3_45 and var_3_45 or var_3_48.rewards

						for iter_3_16, iter_3_17 in pairs(var_3_56) do
							local var_3_57 = tool.spriteByName("jianglikuang1.png")

							var_3_57:setPosition(ccp(90 + iter_3_16 * 90, -90))
							arg_2_0.uiTable.bg_indiv2:addChild(var_3_57, 200)

							local var_3_58 = var_3_51[iter_3_17.rewardType or iter_3_17.type] or ""
							local var_3_59 = CCSprite:create(var_3_58)

							var_3_59:setPosition(ccp(40, 40))
							var_3_57:addChild(var_3_59, 10)

							local var_3_60 = CCLabelTTF:create(iter_3_17.rewardNum or iter_3_17.value, "Thonburi", 22)

							var_3_60:setPosition(ccp(40, 20))
							var_3_57:addChild(var_3_60, 20)
						end
					end

					for iter_3_18, iter_3_19 in pairs(var_3_20.rewards) do
						local var_3_61 = tool.spriteByName("jianglikuang1.png")

						var_3_61:setPosition(ccp(30 + iter_3_18 * 90, 0))
						arg_2_0.uiTable.bg_indiv3:addChild(var_3_61, 200)

						local var_3_62 = var_3_51[iter_3_19.type] or ""
						local var_3_63 = CCSprite:create(var_3_62)

						var_3_63:setPosition(ccp(40, 40))
						var_3_61:addChild(var_3_63, 10)

						local var_3_64 = CCLabelTTF:create(iter_3_19.value, "Thonburi", 22)

						var_3_64:setPosition(ccp(40, 20))
						var_3_61:addChild(var_3_64, 20)
					end

					local var_3_65 = #var_3_20.rewards

					if var_3_20.extraRewards then
						for iter_3_20, iter_3_21 in pairs(var_3_20.extraRewards) do
							local var_3_66 = tool.spriteByName("jianglikuang1.png")

							var_3_66:setPosition(ccp(30 + (var_3_65 + iter_3_20) * 90, 0))
							arg_2_0.uiTable.bg_indiv3:addChild(var_3_66, 200)

							local var_3_67 = var_3_51[iter_3_21.type] or ""
							local var_3_68 = CCSprite:create(var_3_67)

							var_3_68:setPosition(ccp(40, 40))
							var_3_66:addChild(var_3_68, 10)

							local var_3_69 = CCLabelTTF:create(iter_3_21.value, "Thonburi", 22)

							var_3_69:setPosition(ccp(40, 20))
							var_3_66:addChild(var_3_69, 20)

							local var_3_70

							if var_3_20.leagueForce and var_3_20.leagueForce > 0 then
								var_3_70 = CCSprite:create("res/ui/nationTask/attdefzhiyuanling/gsrw_tmjb.png")

								var_3_70:setPosition(ccp(39, 39))
							else
								var_3_70 = tool.spriteByName("nation_task_win_icon.png")

								var_3_70:setPosition(ccp(23, 54))
							end

							var_3_66:addChild(var_3_70, 30)

							if var_3_20.taskState ~= 2 or var_3_20.taskState == 1 then
								tool.spriteToGray(var_3_66, true)
							end
						end
					end
				end

				arg_2_0.uiTable.bg_indiv1:setVisible(var_3_48 == nil)
			end

			if var_3_19 then
				var_3_23 = false
			end

			var_3_9:setPositionY(var_3_23 and 40 or 70)
			arg_2_0.uiTable.bg_decide:setVisible(var_3_23)

			if var_3_23 and var_3_24 then
				arg_2_0.uiTable.decide_type:setString(var_3_24)
				arg_2_0.uiTable.decide_info:setString(var_3_25)
			end
		elseif arg_2_1 == taskTabConstant.TYPES.NATION_EXPAND_TASK then
			arg_2_0.uiTable.taskDetail:setString(language.get(95029, arg_3_0.data.tasks[1].target, arg_3_0.data.tasks[1].serial))
			arg_2_0.uiTable.taskKill:setString(language.get(95013) .. arg_3_0.data.tasks[1].curCityNum)
		elseif arg_2_1 == taskTabConstant.TYPES.NATION_ATTACK_BAR_TASK then
			arg_2_0.uiTable.taskDetail:setString(language.get("222704_seasilk"))
			arg_2_0.uiTable.taskKill:setString(language.get(95014) .. arg_3_0.data.tasks[1].nationKill)

			local var_3_71 = 0

			if arg_3_0.data.tasks[1].warInfo then
				arg_2_0.uiTable.weiCityNum:setString(language.get("222700_seasilk", user.forceIdToName[1], arg_3_0.data.tasks[1].warInfo[1].sdCitySize))
				arg_2_0.uiTable.shuCityNum:setString(language.get("222700_seasilk", user.forceIdToName[2], arg_3_0.data.tasks[1].warInfo[2].sdCitySize))
				arg_2_0.uiTable.wuCityNum:setString(language.get("222700_seasilk", user.forceIdToName[3], arg_3_0.data.tasks[1].warInfo[3].sdCitySize))

				for iter_3_22, iter_3_23 in pairs(arg_3_0.data.tasks[1].warInfo) do
					var_3_71 = var_3_71 + iter_3_23.sdCitySize
				end
			end

			arg_2_0.uiTable.taskCityInWar:setString(language.get(95028, var_3_71))
		elseif arg_2_1 == taskTabConstant.TYPES.NATION_BUDOKAI_TASK then
			arg_2_0.uiTable.taskDetail:setString(language.get(95015))

			if arg_3_0.data.tasks[1].nationExp then
				local var_3_72 = user.forceIdToName[arg_3_0.data.tasks[1].forceId] or ""

				arg_2_0.uiTable.taskExtraInfo:setString(language.get(95031, var_3_72, arg_3_0.data.tasks[1].playerName, arg_3_0.data.tasks[1].nationRank, arg_3_0.data.tasks[1].nationExp))
			else
				arg_2_0.uiTable.taskExtraInfo:setString("")
			end

			local var_3_73 = arg_3_0.data.tasks[1]

			arg_2_0.uiTable.taskKill:setString(language.get(95019) .. var_3_73.killNum)

			if arg_3_0.data.tasks[1].rankNum > 0 then
				arg_2_0.uiTable.taskTryHard:setVisible(false)

				local var_3_74 = var_3_73.nationsort[1].value

				for iter_3_24 = 1, 3 do
					local var_3_75 = var_3_73.nationsort[iter_3_24]

					if var_3_75 ~= nil then
						arg_2_0.uiTable["taskForceNameBg_" .. iter_3_24]:setVisible(true)
						arg_2_0.uiTable["taskPlayerName_" .. iter_3_24]:setVisible(true)
						arg_2_0.uiTable["taskProgress_" .. iter_3_24]:setVisible(true)
						arg_2_0.uiTable["taskForceName_" .. iter_3_24]:setString(user.forceIdToName[var_3_75.forceId])
						arg_2_0.uiTable["taskForceName_" .. iter_3_24]:setColor(colorForce[var_3_75.forceId])
						arg_2_0.uiTable["taskPlayerName_" .. iter_3_24]:setString(language.get(95032, var_3_75.playerName, var_3_75.value))

						local var_3_76, var_3_77 = arg_2_0.uiTable["taskPlayerName_" .. iter_3_24]:getPosition()
						local var_3_78 = 85 + arg_2_0.uiTable["taskPlayerName_" .. iter_3_24]:getContentSize().width / 2

						arg_2_0.uiTable["taskPlayerName_" .. iter_3_24]:setPosition(ccp(var_3_78, var_3_77))

						local var_3_79

						if var_3_75.forceId == 1 then
							var_3_79 = "nation_degr_x_wei.png"
						elseif var_3_75.forceId == 2 then
							var_3_79 = "nation_degr_x_shu.png"
						elseif var_3_75.forceId == 3 then
							var_3_79 = "nation_degr_x_wu.png"
						end

						arg_2_0.uiTable["taskProgress_" .. iter_3_24]:setSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_3_79))
						arg_2_0.uiTable["taskProgress_" .. iter_3_24]:setPreferredSize(CCSizeMake(80 + var_3_75.value / var_3_74 * 134, 38))
					end
				end
			else
				arg_2_0.uiTable.taskTryHard:setVisible(true)
			end
		elseif arg_2_1 == taskTabConstant.TYPES.NATION_DONATION_TASK then
			local var_3_80 = {
				3,
				126,
				249,
				372,
				495,
				618,
				741,
				864
			}
			local var_3_81 = arg_3_0.data.tasks[1]
			local var_3_82 = require("lua/common/json")

			log.info("task:%s", var_3_82.encode(var_3_81))

			local function var_3_83()
				local var_11_0 = var_3_81.curNum
				local var_11_1 = 1
				local var_11_2 = 1
				local var_11_3 = 0
				local var_11_4 = 0
				local var_11_5 = var_11_0
				local var_11_6 = {}

				for iter_11_0, iter_11_1 in pairs(var_3_81.serials) do
					var_11_6[iter_11_1.serial] = iter_11_1.target
				end

				for iter_11_2, iter_11_3 in pairs(var_11_6) do
					if var_11_5 < iter_11_3 then
						var_11_1 = iter_11_2

						local var_11_7 = iter_11_2 + 1

						if iter_11_2 > 1 then
							var_11_3 = var_11_6[iter_11_2 - 1]
						else
							var_11_3 = 0
						end

						var_11_4 = iter_11_3

						break
					end
				end

				local var_11_8 = 1 * (var_11_5 - var_11_3) / (var_11_4 - var_11_3)
				local var_11_9 = 1 * (var_3_80[var_11_1] + 123 * var_11_8) / 855 - 0.01

				return var_11_9 > 0 and var_11_9 or 0
			end

			arg_2_0.uiTable.donateEventPic:setDisplayFrame(CCSprite:create("res/ui/nation/" .. var_3_81.pic .. ".jpg"):displayFrame())

			local var_3_84 = var_3_81.nationsort[1].value == 0 and 10 or var_3_81.nationsort[1].value

			for iter_3_25 = 1, 3 do
				local var_3_85 = var_3_81.nationsort[iter_3_25]
				local var_3_86 = var_3_85.value

				arg_2_0.uiTable["taskProgress_" .. var_3_85.forceId]:setPreferredSize(CCSizeMake(10 + var_3_86 / var_3_84 * 134, 38))
				arg_2_0.uiTable["donateForce_" .. iter_3_25]:setString(user.forceIdToName[iter_3_25])
			end

			arg_2_0.uiTable.donateCost:setString(var_3_81.copper)

			if var_3_81.taskState == 0 then
				arg_2_0.uiTable.donateRewardBoard:setVisible(false)
				arg_2_0.uiTable.donateProgressBg:setVisible(true)

				if var_3_81.percentage < 100 then
					if var_3_81.cd > var_3_81.cdToUnable then
						arg_2_0.uiTable.donateButtonText:setString(language.get(94005))
						arg_2_0.uiTable.donateTicket:setVisible(false)
					elseif var_3_81.couponNum > 0 then
						arg_2_0.uiTable.donateTicket:setVisible(true)
						arg_2_0.uiTable.donateDoubleNum:setString(tostring(var_3_81.couponNum))
					else
						arg_2_0.uiTable.donateTicket:setVisible(false)
					end

					arg_2_0.uiTable.donateButton:registerScriptTapHandler(function()
						arg_3_0:investCopper()
					end)

					if var_3_81.cd > 0 then
						local function var_3_87()
							arg_3_0:getTaskInfo(nil)
						end

						local var_3_88 = createTimerLabel(var_3_81.cd, "CD:  @M:@S", "Thonburi-Bold", 14, var_3_87)

						if var_3_81.cd > var_3_81.cdToUnable then
							var_3_88:setTriggerTime(var_3_81.cdToUnable)
						else
							var_3_88:setTriggerTime(0)
						end

						var_3_88:setPosition(ccp(0, -20))
						arg_2_0.uiTable.donateCost:addChild(var_3_88)
					end
				else
					local function var_3_89()
						local var_14_0 = smgr.getLayer("pushLayer")
						local var_14_1 = CCSprite:createWithSpriteFrameName("invest_new.png")

						var_14_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
						var_14_0:addChild(var_14_1, 100)

						local var_14_2 = CCArray:create()
						local var_14_3 = CCMoveBy:create(1, ccp(0, 100))
						local var_14_4 = CCFadeOut:create(0.3)

						var_14_2:addObject(var_14_3)
						var_14_2:addObject(var_14_4)
						var_14_2:addObject(CCCallFuncN:create(function()
							var_14_1:removeFromParentAndCleanup(true)
						end))
						var_14_1:runAction(CCSequence:create(var_14_2))
						arg_3_0:getTaskInfo(nil)
					end

					local var_3_90 = createTimerLabel(var_3_81.nextTime, language.get(94002) .. ":@M:@S", "Thonburi", 22, var_3_89)

					var_3_90:setPosition(ccp(674, 46))
					arg_2_0.uiTable.background:addChild(var_3_90, 101)
					arg_2_0.uiTable.donateSilverIcon:setVisible(false)
					arg_2_0.uiTable.donateCost:setVisible(false)
					arg_2_0.uiTable.donateButton:setVisible(false)
					arg_2_0.uiTable.donateButtonText:setVisible(false)
					arg_2_0.uiTable.donateDoubleNum:setVisible(false)
					arg_2_0.uiTable.donateTicket:setVisible(false)
				end

				local var_3_91 = var_3_83()

				arg_2_0.uiTable.donateProgess:setPercentage(var_3_91 * 100)
				arg_2_0.uiTable.donateLock:setPosition(ccp(var_3_80[var_3_81.curSerial + 1], 50))

				var_3_81.titlePic = var_3_81.titlePic or "chenghao1"

				arg_2_0.uiTable.taskTitleOutBoard:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_3_81.titlePic .. ".png"))
			else
				arg_2_0.uiTable.donateRewardBoard:setVisible(true)
				arg_2_0.uiTable.donateProgressBg:setVisible(false)

				var_3_81.titlePic = var_3_81.titlePic or "chenghao1"

				arg_2_0.uiTable.taskTitleInBoard:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_3_81.titlePic .. ".png"))

				if var_3_81.rankNum == 0 then
					arg_2_0.uiTable.taskNoReward:setVisible(true)
				else
					for iter_3_26, iter_3_27 in pairs(var_3_81.rewards) do
						if iter_3_27.type == 10 then
							arg_2_0.uiTable.taskRewardBlock_1:setVisible(true)
							arg_2_0.uiTable.taskRewardValue_1:setString(iter_3_27.value)
						elseif iter_3_27.type == 4 or iter_3_27.type == 17 then
							arg_2_0.uiTable.taskRewardBlock_2:setVisible(true)
							arg_2_0.uiTable.taskRewardValue_2:setString(iter_3_27.value)

							if iter_3_27.type == 17 then
								arg_2_0.uiTable.taskRewardBlock_icon_2:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/task/get_icon_gem.png"))
							end
						end
					end

					for iter_3_28, iter_3_29 in pairs(var_3_81.extraRewards) do
						if iter_3_29.type == 10 then
							arg_2_0.uiTable.taskRewardBlock_3:setVisible(true)

							if var_3_81.hasExtra == false then
								tool.spriteToGray(arg_2_0.uiTable.taskRewardBlock_3, true)
							end

							arg_2_0.uiTable.taskRewardValue_3:setString(iter_3_29.value)
						elseif iter_3_29.type == 4 or iter_3_29.type == 17 then
							arg_2_0.uiTable.taskRewardBlock_4:setVisible(true)

							if iter_3_29.type == 17 then
								arg_2_0.uiTable.taskRewardBlock_icon_4:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/task/get_icon_gem.png"))
							end

							if var_3_81.hasExtra == false then
								tool.spriteToGray(arg_2_0.uiTable.taskRewardBlock_4, true)
							end

							arg_2_0.uiTable.taskRewardValue_4:setString(iter_3_29.value)
						end
					end
				end

				if var_3_81.canGetReward == true then
					arg_2_0.uiTable.drawReward:setVisible(true)
					arg_2_0.uiTable.drawReward:registerScriptTapHandler(function()
						arg_3_0:getNationTaskReward(var_3_81.taskId)
					end)
				end
			end

			if var_3_81.rankNum == 0 then
				-- block empty
			else
				local var_3_92 = {}

				table.insert(var_3_92, language.get(95062, var_3_81.selfInvestment))

				for iter_3_30, iter_3_31 in pairs(var_3_81.rewards) do
					if iter_3_31.type == 10 or iter_3_31.type == 4 or iter_3_31.type == 17 then
						local var_3_93 = language.get(10104)

						if iter_3_31.type == 10 then
							var_3_93 = language.get(10107)
						elseif iter_3_31.type == 17 then
							var_3_93 = language.get(10106)
						end

						if iter_3_30 == 1 then
							var_3_93 = language.get(95057) .. var_3_93 .. "+" .. iter_3_31.value
						else
							var_3_93 = "                " .. var_3_93 .. "+" .. iter_3_31.value
						end

						table.insert(var_3_92, var_3_93)
					end
				end

				for iter_3_32, iter_3_33 in pairs(var_3_81.extraRewards) do
					if iter_3_33.type == 10 or iter_3_33.type == 4 then
						local var_3_94 = language.get(10104)

						if iter_3_33.type == 10 then
							var_3_94 = language.get(10107)
						end

						if iter_3_32 == 1 then
							var_3_94 = language.get(95061) .. var_3_94 .. "+" .. iter_3_33.value
						else
							var_3_94 = "                " .. var_3_94 .. "+" .. iter_3_33.value
						end

						table.insert(var_3_92, var_3_94)
					end
				end

				local var_3_95 = #var_3_92
				local var_3_96 = var_3_95 * 25 - 12 + 4

				for iter_3_34, iter_3_35 in pairs(var_3_92) do
					label = CCLabelTTF:create(iter_3_35, "", 20)

					label:setPosition(110, var_3_96)
					label:setHorizontalAlignment(kCCTextAlignmentLeft)
					label:setDimensions(CCSizeMake(200, 30))
					arg_2_0.uiTable.jiangli_tips:addChild(label, 1)

					var_3_96 = var_3_96 - 25
				end

				arg_2_0.uiTable.jiangli_tips:setPreferredSize(CCSizeMake(250, var_3_95 * 25 + 14))
			end

			local var_3_97 = {}

			for iter_3_36, iter_3_37 in pairs(var_3_81.nationsort) do
				if iter_3_37.forceId == user.player.forceId then
					table.insert(var_3_97, language.get(94007, iter_3_37.value))
				end
			end

			table.insert(var_3_97, language.get(94008, var_3_81.selfInvestment))

			local var_3_98 = #var_3_97
			local var_3_99 = var_3_98 * 25 - 12 + 4

			for iter_3_38, iter_3_39 in pairs(var_3_97) do
				label = CCLabelTTF:create(iter_3_39, "", 20)

				label:setPosition(110, var_3_99)
				label:setHorizontalAlignment(kCCTextAlignmentLeft)
				label:setDimensions(CCSizeMake(200, 30))
				arg_2_0.uiTable.info_tips:addChild(label, 1)

				var_3_99 = var_3_99 - 25
			end

			arg_2_0.uiTable.info_tips:setPreferredSize(CCSizeMake(250, var_3_98 * 25 + 14))

			if var_3_81.canGetReward == false and var_3_81.nextTaskTime then
				arg_2_0.uiTable.taskNext:setVisible(true)
				arg_2_0.uiTable.taskNextHour:setString(var_3_81.nextTaskTime)
			end
		elseif arg_2_1 == taskTabConstant.TYPES.NATION_BAR_PROTECT_TASK then
			local var_3_100

			if arg_3_0.data.defForceId == 1 then
				var_3_100 = language.get(95023)
			elseif arg_3_0.data.defForceId == 1 then
				var_3_100 = language.get(95024)
			else
				var_3_100 = language.get(95025)
			end

			arg_2_0.uiTable.taskDetail:setString(language.get(var_3_100, arg_3_0.data.targetNum))

			if arg_3_0.data.isWin ~= 0 then
				arg_2_0.uiTable.isFinished:setVisible(true)
			end
		elseif arg_2_1 == taskTabConstant.TYPES.NATION_ATTACK_THIEF_TASK then
			arg_2_0.uiTable.nationLv:setString(arg_3_0.data.nationLv)

			if arg_3_0.data.tasks[1].serial == 1 then
				arg_2_0.uiTable.taskDetail:setString(language.get(95063))
				arg_2_0.uiTable.taskThiefMap:setVisible(true)
				arg_2_0.uiTable.taskMap:setVisible(false)
			else
				arg_2_0.uiTable.taskDetail:setString(language.get(95064))
				arg_2_0.uiTable.taskTitle:setDisplayFrame(CCSprite:create("res/ui/nationTask/thief/zyhj_tit_tmzj.png"):displayFrame())
				arg_2_0.uiTable.taskThiefMap:setVisible(false)
				arg_2_0.uiTable.taskMap:setVisible(true)
			end
		elseif arg_2_1 == taskTabConstant.TYPES.NATION_BUILDING_TASK then
			arg_2_0.uiTable.bg_middle:setScaleY(4.789)

			for iter_3_40 = 1, 3 do
				arg_2_0.uiTable["bg_bar" .. iter_3_40]:setScaleX(0.62)
				arg_2_0.uiTable["bg_titBg" .. iter_3_40]:setScaleX(1.387)
				arg_2_0.uiTable["bg_titBg" .. iter_3_40]:setScaleY(0.816)
			end

			arg_2_0.uiTable.nationLv:setString(arg_3_0.data.nationLv)

			local var_3_101 = arg_3_0.data.tasks[1]

			var_3_101.titlePic = var_3_101.titlePic or "chenghao1"

			arg_2_0.uiTable.title:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_3_101.titlePic .. ".png"))
			log.info(tolua.type(arg_2_0.uiTable.nationPercent1st))
			arg_2_0.uiTable.nationPercent1st:setString(var_3_101.pct1st)
			arg_2_0.uiTable.nation1stIcon:setString(user.forceIdToName[var_3_101.force1st])
			arg_2_0.uiTable.nation1stIcon:setColor(colorForce[var_3_101.force1st])

			local var_3_102 = 0
			local var_3_103

			for iter_3_41, iter_3_42 in pairs(var_3_101.warInfo) do
				if iter_3_42.forceId == user.player.forceId then
					var_3_102 = iter_3_42.totalPct
					var_3_103 = iter_3_42
				end
			end

			arg_2_0.uiTable.materialPercent1:setPercentage(var_3_103.lumber)
			arg_2_0.uiTable.materialPercent2:setPercentage(var_3_103.stone)
			arg_2_0.uiTable.materialPercent3:setPercentage(var_3_103.soil)
			arg_2_0.uiTable.materialPercentNum1:setString(var_3_103.lumber .. "%")
			arg_2_0.uiTable.materialPercentNum2:setString(var_3_103.stone .. "%")
			arg_2_0.uiTable.materialPercentNum3:setString(var_3_103.soil .. "%")

			if tonumber(var_3_103.lumber) == 100 then
				arg_2_0.uiTable.fullIcon1:setVisible(true)
			else
				arg_2_0.uiTable.marchingIcon1:setVisible(true)
			end

			if tonumber(var_3_103.stone) == 100 then
				arg_2_0.uiTable.fullIcon2:setVisible(true)
			else
				arg_2_0.uiTable.marchingIcon2:setVisible(true)
			end

			if tonumber(var_3_103.soil) == 100 then
				arg_2_0.uiTable.fullIcon3:setVisible(true)
			else
				arg_2_0.uiTable.marchingIcon3:setVisible(true)
			end

			arg_2_0.uiTable.nationPercent:setString(var_3_102)
		elseif arg_2_1 == taskTabConstant.TYPES.NATION_LANTERN_TASK then
			local var_3_104 = arg_3_0.data.tasks[1]
			local var_3_105 = 0
			local var_3_106
			local var_3_107 = {}

			for iter_3_43, iter_3_44 in pairs(var_3_104.warInfo) do
				if iter_3_44.forceId == user.player.forceId then
					local var_3_108 = iter_3_44.totalPct

					var_3_106 = iter_3_44
				end

				var_3_107[iter_3_44.forceId] = iter_3_44.serial
			end

			local var_3_109 = false

			if var_3_104.canGetReward == false and var_3_104.nextTaskTime then
				arg_2_0.uiTable.taskNext:setVisible(true)
				arg_2_0.uiTable.taskNextHour:setString(var_3_104.nextTaskTime)

				var_3_109 = true
			end

			arg_2_0.uiTable.task_title_p2:setString(tonumber(var_3_104.serial))
			arg_2_0.uiTable.task_title_p3:setVisible(var_3_104.is14th)

			local var_3_110 = arg_2_0.uiTable.task_title_p1:getContentSize().width
			local var_3_111 = arg_2_0.uiTable.task_title_p2:getContentSize().width
			local var_3_112 = var_3_104.is14th and arg_2_0.uiTable.task_title_p3:getContentSize().width or 0
			local var_3_113 = var_3_110 + var_3_111 + var_3_112

			arg_2_0.uiTable.task_title_p1:setPositionX(458 - var_3_113 / 2 + var_3_110 / 2)
			arg_2_0.uiTable.task_title_p2:setPositionX(458 - var_3_113 / 2 + var_3_110 + var_3_111 / 2)
			arg_2_0.uiTable.task_title_p3:setPositionX(458 - var_3_113 / 2 + var_3_110 + var_3_111 + var_3_112 / 2)
			arg_2_0.uiTable.mask_tips:setScaleX(60)
			arg_2_0.uiTable.mask_tips:setScaleY(20)
			arg_2_0.uiTable.mask_tips:setContentSize(CCSizeMake(240, 80))

			if #var_3_104.investGolds > 0 then
				for iter_3_45 = 1, #var_3_104.investGolds do
					local var_3_114 = var_3_104.investGolds[iter_3_45]
					local var_3_115 = var_3_107[var_3_114.forceId]
					local var_3_116 = language.get(taskTabConstant.LANTERN_RES[var_3_115][var_3_114.type + 1])
					local var_3_117 = language.get(135327, var_3_114.gold, var_3_116)
					local var_3_118 = CCLabelTTF:create(var_3_114.name, "", (function()
						if conf.language == "vie" then
							return 16
						else
							return 18
						end
					end)())

					var_3_118:setColor(colorForce[var_3_114.forceId])

					local var_3_119 = CCLabelTTF:create(var_3_117, "", (function()
						if conf.language == "vie" then
							return 16
						else
							return 18
						end
					end)())

					var_3_119:setDimensions(CCSizeMake(220, 0))
					var_3_119:setHorizontalAlignment(kCCTextAlignmentLeft)

					local var_3_120 = createRichNode({
						var_3_118,
						var_3_119
					}, 0.5)

					var_3_120:setPosition(ccp(167, 25))
					arg_2_0.uiTable.bg_invest:addChild(var_3_120)
					var_3_120:setVisible(false)

					local var_3_121 = CCArray:create()

					var_3_121:addObject(CCDelayTime:create((iter_3_45 - 1) * 2.6))
					var_3_121:addObject(CCCallFuncN:create(function()
						var_3_120:setVisible(true)
					end))
					var_3_121:addObject(CCDelayTime:create(2))
					var_3_121:addObject(CCSpawn:createWithTwoActions(CCMoveBy:create(0.3, ccp(0, 20)), CCFadeOut:create(0.3)))
					var_3_121:addObject(CCCallFuncN:create(function()
						var_3_120:removeFromParentAndCleanup(true)
					end))
					var_3_120:runAction(CCSequence:create(var_3_121))
				end
			end

			local var_3_122
			local var_3_123 = var_3_106.totalPct == 0 and "res/ui/nationTask/lantern/yxhd_tyzz1.png" or var_3_104.serial == 5 and var_3_106.totalPct >= 100 and "res/ui/nationTask/lantern/yxhd_tyzz3.png" or "res/ui/nationTask/lantern/yxhd_tyzz2.png"

			arg_2_0.uiTable.bowl:setDisplayFrame(CCSprite:create(var_3_123):displayFrame())
			arg_2_0.uiTable.name_bowl:setDisplayFrame(CCSprite:create(string.format("res/ui/nationTask/lantern/yxhd_ty%s.png", var_3_104.serial)):displayFrame())
			arg_2_0.uiTable.name_bowl:setVisible(true)
			arg_2_0.uiTable.totalPct:setString(var_3_106.totalPct .. "%")

			if var_3_106.totalPct > 0 then
				rmgr.loadResource("res/ui/activity/lantern/steam.plist")

				local var_3_124 = CCSprite:create()

				arg_2_0.uiTable.bowl:addChild(var_3_124)
				var_3_124:setPosition(ccp(167, 210))

				local var_3_125 = CCArray:create()

				for iter_3_46 = 1, 9 do
					local var_3_126 = CCSprite:createWithSpriteFrameName(string.format("yxhd_rq%02d.png", iter_3_46))

					var_3_125:addObject(var_3_126:displayFrame())
				end

				local var_3_127 = CCAnimation:createWithSpriteFrames(var_3_125, 0.1)
				local var_3_128 = CCAnimate:create(var_3_127)

				var_3_128:retain()
				var_3_124:runAction(CCRepeatForever:create(var_3_128))
			end

			for iter_3_47 = 1, 3 do
				local var_3_129 = language.get(taskTabConstant.LANTERN_RES[var_3_104.serial][iter_3_47])
				local var_3_130 = string.format("res/ui/nationTask/lantern/yxhd_res%s%s.png", var_3_104.serial, iter_3_47)
				local var_3_131 = var_3_106["Pct" .. iter_3_47]

				arg_2_0.uiTable["res_name" .. iter_3_47]:setString(var_3_129)
				arg_2_0.uiTable["res_pic" .. iter_3_47]:setDisplayFrame(CCSprite:create(var_3_130):displayFrame())
				arg_2_0.uiTable["res_pic" .. iter_3_47]:setVisible(true)

				if var_3_131 >= 100 then
					arg_2_0.uiTable["res_full" .. iter_3_47]:setVisible(true)
				else
					arg_2_0.uiTable["res_process" .. iter_3_47]:setVisible(true)
					arg_2_0.uiTable["res_pct" .. iter_3_47]:setString(var_3_131 .. "%")
					arg_2_0.uiTable["res_process" .. iter_3_47]:setPercentage(var_3_131)
					arg_2_0.uiTable["arrow" .. iter_3_47]:setPositionX(4 + 176 * var_3_131 / 100)
					arg_2_0.uiTable["arrow" .. iter_3_47]:setVisible(true)

					if not var_3_104.nextTaskTime then
						local var_3_132 = arg_2_0.uiTable["btn_invest" .. iter_3_47]:getNormalImage()
						local var_3_133 = CCSprite:create("res/ui/nationTask/lantern/yxhd_ah_1.png")

						var_3_132:addChild(var_3_133)
						var_3_133:setPosition(ccp(31.5, 21))

						local var_3_134 = CCArray:create()

						for iter_3_48 = 1, 5 do
							local var_3_135 = CCSprite:create(string.format("res/ui/nationTask/lantern/yxhd_ah_%s.png", iter_3_48))

							var_3_134:addObject(var_3_135:displayFrame())
						end

						local var_3_136 = CCAnimation:createWithSpriteFrames(var_3_134, 0.06)
						local var_3_137 = CCAnimate:create(var_3_136)

						var_3_137:retain()
						var_3_133:runAction(CCRepeatForever:create(var_3_137))
						arg_2_0.uiTable["btn_invest" .. iter_3_47]:setVisible(true)
						arg_2_0.uiTable["btn_invest" .. iter_3_47]:registerScriptTapHandler(function()
							local var_21_0 = var_3_104.yxGold * (100 - var_3_131)

							messageBox.confirm(language.get(135328, var_21_0, var_3_129), function()
								arg_3_0:investLantern(iter_3_47 - 1)
							end)
						end)
					end
				end
			end

			if var_3_109 or var_3_104.canGetReward then
				arg_2_0.uiTable.nationPercent1st:setString(var_3_104.pct1st)

				local var_3_138 = {
					"cityWindowWei.png",
					"cityWindowShu.png",
					"cityWindowWu.png"
				}

				arg_2_0.uiTable.nation1stIcon:setDisplayFrame(CCSprite:createWithSpriteFrameName(var_3_138[var_3_104.force1st]):displayFrame())

				if var_3_104.extraRewards then
					for iter_3_49, iter_3_50 in pairs(var_3_104.extraRewards) do
						if iter_3_50.type == 10 then
							arg_2_0.uiTable.taskKuangWinExp:setVisible(true)
							arg_2_0.uiTable.taskWinExp:setString(iter_3_50.value)

							if var_3_104.taskState ~= 2 then
								tool.spriteToGray(arg_2_0.uiTable.taskKuangWinExp, true)
							end
						elseif iter_3_50.type == 4 then
							arg_2_0.uiTable.taskKuangWinIron:setVisible(true)
							arg_2_0.uiTable.taskWinIron:setString(iter_3_50.value)

							if var_3_104.taskState ~= 2 then
								tool.spriteToGray(arg_2_0.uiTable.taskKuangWinIron, true)
							end
						end
					end
				end

				if var_3_104.rankNum == 0 and arg_2_0.uiTable.taskNoReward then
					arg_2_0.uiTable.taskNoReward:setVisible(true)
				else
					for iter_3_51, iter_3_52 in pairs(var_3_104.rewards) do
						if iter_3_52.type == 10 then
							arg_2_0.uiTable.taskKuangExp:setVisible(true)
							arg_2_0.uiTable.taskExp:setString(iter_3_52.value)
						elseif iter_3_52.type == 4 then
							arg_2_0.uiTable.taskKuangIron:setVisible(true)
							arg_2_0.uiTable.taskIron:setString(iter_3_52.value)
						elseif iter_3_52.type == 17 then
							if arg_2_0.uiTable.taskKuangIron_realIron then
								arg_2_0.uiTable.taskKuangIron_realIron:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/task/get_icon_gem.png"))
							elseif arg_2_0.uiTable.privateImageIron then
								arg_2_0.uiTable.privateImageIron:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/task/get_icon_gem.png"))
							end

							arg_2_0.uiTable.taskKuangIron:setVisible(true)
							arg_2_0.uiTable.taskIron:setString(iter_3_52.value)
						end
					end
				end

				var_3_104.titlePic = var_3_104.titlePic or "chenghao1"

				arg_2_0.uiTable.title:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_3_104.titlePic .. ".png"))

				if var_3_104.rankNum and arg_2_0.uiTable.rankText then
					arg_2_0.uiTable.rankText:setString(language.get(95026) .. var_3_104.rankNum)
				end

				if var_3_104.isRewarded == 1 and arg_2_0.uiTable.isRewarded then
					arg_2_0.uiTable.isRewarded:setVisible(true)
				end

				if var_3_104.taskState and var_3_104.taskState ~= 0 and arg_2_0.uiTable.isFinished then
					arg_2_0.uiTable.isFinished:setVisible(true)

					if var_3_104.taskState == 1 then
						arg_2_0.uiTable.isFinished:setDisplayFrame(tool.spriteFrameByName("nation_task_defe.png"))
					end
				end

				if var_3_104.canGetReward == true then
					arg_2_0.uiTable.drawReward:setVisible(true)
					arg_2_0.uiTable.drawReward:registerScriptTapHandler(function()
						arg_3_0:getNationTaskReward(var_3_104.taskId)
					end)
				end
			else
				arg_2_0.uiTable.rightBg:setVisible(true)

				local var_3_139 = 3 + var_3_104.hunger
				local var_3_140 = 10

				arg_2_0.uiTable.hungerNum:setString(language.get(135331, var_3_139))
				arg_2_0.uiTable.processHunger:setPercentage(100 * (var_3_139 / var_3_140))

				for iter_3_53 = 1, 5 do
					arg_2_0.uiTable["small_mask" .. iter_3_53]:setVisible(iter_3_53 ~= var_3_104.serial)
				end
			end
		end

		if arg_2_1 == taskTabConstant.TYPES.NATION_BUDOKAI_TASK or arg_2_1 == taskTabConstant.TYPES.NATION_EXPAND_TASK or arg_2_1 == taskTabConstant.TYPES.NATION_PROTECT_TASK or arg_2_1 == taskTabConstant.TYPES.NATION_HELP_BAR_TASK or arg_2_1 == taskTabConstant.TYPES.NATION_ATTACK_BAR_TASK or arg_2_1 == taskTabConstant.TYPES.NATION_UPGRADE_TASK or arg_2_1 == taskTabConstant.TYPES.NATION_BAR_PROTECT_TASK or arg_2_1 == taskTabConstant.TYPES.NATION_ATTACK_THIEF_TASK or arg_2_1 == taskTabConstant.TYPES.NATION_BUILDING_TASK then
			local var_3_141 = arg_3_0.data

			if arg_2_1 ~= taskTabConstant.TYPES.NATION_BAR_PROTECT_TASK then
				var_3_141 = arg_3_0.data.tasks[1]
			end

			if var_3_141.rankNum == 0 and arg_2_0.uiTable.taskNoReward then
				arg_2_0.uiTable.taskNoReward:setVisible(true)
			else
				for iter_3_54, iter_3_55 in pairs(var_3_141.rewards) do
					if iter_3_55.type == 10 then
						arg_2_0.uiTable.taskKuangExp:setVisible(true)
						arg_2_0.uiTable.taskExp:setString(iter_3_55.value)
					elseif iter_3_55.type == 4 then
						arg_2_0.uiTable.taskKuangIron:setVisible(true)
						arg_2_0.uiTable.taskIron:setString(iter_3_55.value)
					elseif iter_3_55.type == 17 then
						if arg_2_0.uiTable.taskKuangIron_realIron then
							arg_2_0.uiTable.taskKuangIron_realIron:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/task/get_icon_gem.png"))
						elseif arg_2_0.uiTable.privateImageIron then
							arg_2_0.uiTable.privateImageIron:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/task/get_icon_gem.png"))
						end

						arg_2_0.uiTable.taskKuangIron:setVisible(true)
						arg_2_0.uiTable.taskIron:setString(iter_3_55.value)
					end
				end

				if var_3_141.extraRewards then
					for iter_3_56, iter_3_57 in pairs(var_3_141.extraRewards) do
						if iter_3_57.type == 10 then
							arg_2_0.uiTable.taskKuangWinExp:setVisible(true)
							arg_2_0.uiTable.taskWinExp:setString(iter_3_57.value)

							if var_3_141.taskState ~= 2 then
								tool.spriteToGray(arg_2_0.uiTable.taskKuangWinExp, true)
							end
						elseif iter_3_57.type == 4 then
							arg_2_0.uiTable.taskKuangWinIron:setVisible(true)
							arg_2_0.uiTable.taskWinIron:setString(iter_3_57.value)

							if var_3_141.taskState ~= 2 then
								tool.spriteToGray(arg_2_0.uiTable.taskKuangWinIron, true)
							end
						end
					end
				end

				if var_3_141.firstRewards then
					for iter_3_58, iter_3_59 in pairs(var_3_141.firstRewards) do
						if iter_3_59.type == 4 then
							arg_2_0.uiTable.taskKuangFirstKillIron:setVisible(true)
							arg_2_0.uiTable.taskFirstKillIron:setString(iter_3_59.value)

							if var_3_141.hasFirstRewards then
								-- block empty
							else
								tool.spriteToGray(arg_2_0.uiTable.taskKuangFirstKillIron, true)
							end
						end
					end
				end
			end

			var_3_141.titlePic = var_3_141.titlePic or "chenghao1"

			arg_2_0.uiTable.title:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_3_141.titlePic .. ".png"))

			if var_3_141.rankNum and arg_2_0.uiTable.rankText then
				arg_2_0.uiTable.rankText:setString(language.get(95026) .. var_3_141.rankNum)
			end

			if var_3_141.isRewarded == 1 and arg_2_0.uiTable.isRewarded then
				arg_2_0.uiTable.isRewarded:setVisible(true)
			end

			if var_3_141.taskState and var_3_141.taskState ~= 0 and arg_2_0.uiTable.isFinished then
				arg_2_0.uiTable.isFinished:setVisible(true)

				if var_3_141.taskState == 1 then
					arg_2_0.uiTable.isFinished:setDisplayFrame(tool.spriteFrameByName("nation_task_defe.png"))
				end
			end

			if var_3_141.canGetReward == true then
				arg_2_0.uiTable.drawReward:setVisible(true)
				arg_2_0.uiTable.drawReward:registerScriptTapHandler(function()
					arg_3_0:getNationTaskReward(var_3_141.taskId)
				end)
			end

			if var_3_141.nationsort and var_3_141.taskType == 6 then
				local var_3_142 = var_3_141.nationsort[1].value

				for iter_3_60, iter_3_61 in pairs(var_3_141.nationsort) do
					arg_2_0.uiTable["taskForce_" .. iter_3_61.forceId]:setPreferredSize(CCSizeMake(38, iter_3_61.value / var_3_142 * 196))

					local var_3_143, var_3_144 = arg_2_0.uiTable["taskCityNum_" .. iter_3_61.forceId]:getPosition()

					arg_2_0.uiTable["taskCityNum_" .. iter_3_61.forceId]:setString(iter_3_61.value)
					arg_2_0.uiTable["taskCityNum_" .. iter_3_61.forceId]:setPosition(ccp(var_3_143, 175 + iter_3_61.value / var_3_142 * 196 + 10 - 80))
					arg_2_0.uiTable["taskForceName_" .. iter_3_61.forceId]:setString(user.forceIdToName[iter_3_61.forceId])
					arg_2_0.uiTable["taskForceName_" .. iter_3_61.forceId]:setPosition(ccp(var_3_143, 175 + iter_3_61.value / var_3_142 * 196 + 43 - 80))
				end
			elseif var_3_141.nationsort and var_3_141.taskType == 5 then
				-- block empty
			end

			if arg_2_0.uiTable.taskMap and arg_2_0.uiTable.taskMap:isVisible() then
				local var_3_145 = tool.split(arg_3_0.data.cities, "#")
				local var_3_146 = 48
				local var_3_147 = 79
				local var_3_148 = 191
				local var_3_149 = 123

				for iter_3_62, iter_3_63 in pairs(var_3_145) do
					if #iter_3_63 > 0 then
						local var_3_150 = worldConstant.BUILDING_INFO["world_building_" .. iter_3_63]
						local var_3_151 = var_3_150.x + 90.5
						local var_3_152 = 3600 - var_3_150.y - 64
						local var_3_153 = var_3_151 / 6000 * var_3_148
						local var_3_154 = var_3_152 / 3600 * var_3_149
						local var_3_155

						if user.player.forceId == 1 then
							var_3_155 = "nation_map_wei.png"
						elseif user.player.forceId == 2 then
							var_3_155 = "nation_map_shu.png"
						elseif user.player.forceId == 3 then
							var_3_155 = "nation_map_wu.png"
						end

						local var_3_156 = CCSprite:createWithSpriteFrameName(var_3_155)

						var_3_156:setPosition(ccp(var_3_146 + var_3_153, var_3_147 + var_3_154))
						arg_2_0.uiTable.taskMap:addChild(var_3_156)
					end
				end
			end

			local var_3_157 = {
				"res/ui/nationTask/thief/zyhj_map_wei.png",
				"res/ui/nationTask/thief/zyhj_map_shu.png",
				"res/ui/nationTask/thief/zyhj_map_wu.png",
				[104] = "res/ui/nationTask/thief/zyhj_map_hj.png",
				[1001] = "res/ui/nationTask/thief/zyhj_map_hj.png"
			}

			if arg_2_0.uiTable.taskThiefMap and arg_2_0.uiTable.taskThiefMap:isVisible() then
				local var_3_158 = tool.split(arg_3_0.data.cities, "#")
				local var_3_159 = {}

				for iter_3_64, iter_3_65 in pairs(var_3_158) do
					local var_3_160 = tool.split(iter_3_65, ",")
					local var_3_161 = tonumber(var_3_160[1])
					local var_3_162 = tonumber(var_3_160[2])

					var_3_159[var_3_161] = var_3_162

					local var_3_163 = taskTabConstant.THIEF_MAP[var_3_161]

					if var_3_163 then
						local var_3_164 = var_3_163.x + 8
						local var_3_165 = 216 - var_3_163.y - 8
						local var_3_166 = CCSprite:create(var_3_157[var_3_162])

						var_3_166:setPosition(ccp(var_3_164, var_3_165))
						arg_2_0.uiTable.taskThiefMap:addChild(var_3_166)
					else
						log.warn("pos not found", var_3_161, var_3_162)
					end
				end
			end

			if var_3_141.canGetReward == false and var_3_141.nextTaskTime then
				arg_2_0.uiTable.taskNext:setVisible(true)
				arg_2_0.uiTable.taskNextHour:setString(var_3_141.nextTaskTime)
			end
		end
	end

	local var_2_2 = require("lua/layer/nation/taskTab/control").new(arg_2_1, var_2_1)

	arg_2_0.onEnter = var_2_2.onEnter
	arg_2_0.onExit = var_2_2.onExit

	arg_2_0:setTouchEnabled(true)
	arg_2_0:registerScriptTouchHandler(function(arg_25_0, arg_25_1, arg_25_2)
		return var_2_2:onTouch(arg_2_0, arg_25_0, arg_25_1, arg_25_2)
	end)
end

function var_0_1.setNationMap(arg_26_0, arg_26_1, arg_26_2)
	log.info("taskTab：缩略图")
	require("lua/layer/world/control")

	for iter_26_0, iter_26_1 in pairs(arg_26_1) do
		if iter_26_1.cityId and iter_26_1.cityId > 0 then
			local var_26_0 = 48
			local var_26_1 = 79
			local var_26_2 = 191
			local var_26_3 = 123
			local var_26_4 = worldConstant.BUILDING_INFO["world_building_" .. iter_26_1.cityId]
			local var_26_5 = var_26_4.x + 90.5
			local var_26_6 = 3600 - var_26_4.y - 64
			local var_26_7 = var_26_5 / 6000 * var_26_2
			local var_26_8 = var_26_6 / 3600 * var_26_3
			local var_26_9 = CCSprite:createWithSpriteFrameName("nation_map_man.png")

			var_26_9:setPosition(ccp(var_26_0 + var_26_7, var_26_1 + var_26_8))
			var_26_9:setScale(2)
			arg_26_0.uiTable.taskMap:addChild(var_26_9, 100)

			arg_26_0.uiTable["dot_" .. iter_26_1.cityId] = var_26_9

			local var_26_10 = arg_26_0:addCircle()

			var_26_10:setPosition(ccp(var_26_0 + var_26_7, var_26_1 + var_26_8))
			arg_26_0.uiTable.taskMap:addChild(var_26_10, 100)
		end
	end

	if arg_26_2 then
		for iter_26_2, iter_26_3 in pairs(arg_26_2) do
			if iter_26_3.cityId then
				local var_26_11 = 48
				local var_26_12 = 79
				local var_26_13 = 191
				local var_26_14 = 123
				local var_26_15 = worldConstant.BUILDING_INFO["world_building_" .. iter_26_3.cityId]
				local var_26_16 = var_26_15.x + 90.5
				local var_26_17 = 3600 - var_26_15.y - 64
				local var_26_18 = var_26_16 / 6000 * var_26_13
				local var_26_19 = var_26_17 / 3600 * var_26_14
				local var_26_20 = CCSprite:create("res/ui/nationTask/newPic/hyzy_map_icon_" .. iter_26_3.forceId .. ".png")

				var_26_20:setPosition(ccp(var_26_11 + var_26_18, var_26_12 + var_26_19))
				arg_26_0.uiTable.taskMap:addChild(var_26_20, 90)
			end
		end
	end

	if worldControl.cities and arg_26_0.uiTable.taskMap then
		local var_26_21 = tool.split(worldControl.cities, "#")
		local var_26_22 = 48
		local var_26_23 = 79
		local var_26_24 = 191
		local var_26_25 = 123

		for iter_26_4, iter_26_5 in pairs(var_26_21) do
			local var_26_26 = tool.split(iter_26_5, "|")

			if tonumber(var_26_26[1]) > 0 then
				local var_26_27 = worldConstant.BUILDING_INFO["world_building_" .. tonumber(var_26_26[1])]
				local var_26_28 = var_26_27.x + 90.5
				local var_26_29 = 3600 - var_26_27.y - 64
				local var_26_30 = var_26_28 / 6000 * var_26_24
				local var_26_31 = var_26_29 / 3600 * var_26_25
				local var_26_32

				if tonumber(var_26_26[2]) == 1 then
					var_26_32 = "nation_map_wei.png"
				elseif tonumber(var_26_26[2]) == 2 then
					var_26_32 = "nation_map_shu.png"
				elseif tonumber(var_26_26[2]) == 3 then
					var_26_32 = "nation_map_wu.png"
				end

				if var_26_32 ~= nil then
					local var_26_33 = CCSprite:createWithSpriteFrameName(var_26_32)

					var_26_33:setPosition(ccp(var_26_22 + var_26_30, var_26_23 + var_26_31))
					arg_26_0.uiTable.taskMap:addChild(var_26_33)
				end
			end
		end
	end
end

function var_0_1.addCircle(arg_27_0)
	local var_27_0 = CCSprite:create("res/ui/threeColorBag/jingdu.png")

	var_27_0:setScale(0.1)

	local function var_27_1()
		if var_27_0 then
			var_27_0:setScale(0.1)
		end
	end

	local var_27_2 = CCFadeOut:create(0.9)
	local var_27_3 = CCScaleTo:create(0.9, 0.8)
	local var_27_4 = CCArray:create()

	var_27_4:addObject(CCSpawn:createWithTwoActions(var_27_2, var_27_3))
	var_27_4:addObject(CCCallFunc:create(var_27_1))

	local var_27_5 = CCSequence:create(var_27_4)

	var_27_0:runAction(CCRepeatForever:create(var_27_5))

	return var_27_0
end

function var_0_1.setTitle(arg_29_0)
	if arg_29_0.localTaskData then
		local var_29_0 = arg_29_0.localTaskData[currentGongshouCityPage]

		if arg_29_0.localTaskData[1].canGetReward == false and arg_29_0.localTaskData[2].canGetReward == false and arg_29_0.localTaskData[1].nextTaskTime and arg_29_0.localTaskData[2].nextTaskTime then
			arg_29_0.uiTable.gongshourenwu_timer:setTime(0)
		else
			arg_29_0.uiTable.gongshourenwu_timer:setTime(var_29_0.deadTime)
		end

		arg_29_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nationTask/thunder/lxgs_title_0000s_0008_gongshouchengchi.png"):displayFrame())

		if var_29_0.continentType and var_29_0.continentType == 0 then
			if var_29_0.attType then
				arg_29_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nationTask/thunder/lxgs_title_0000s_0004_shandianzhan.png"):displayFrame())
			end
		elseif var_29_0.continentType and var_29_0.continentType == 1 then
			if var_29_0.attType == 0 then
				arg_29_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nationTask/thunder/lxgs_title_0000s_0001_zhanlingchengchi.png"):displayFrame())
			elseif var_29_0.attType == 1 then
				arg_29_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nationTask/thunder/lxgs_title_0000s_0005_jianshouchengchi.png"):displayFrame())
			end
		elseif var_29_0.continentType and var_29_0.continentType == 2 then
			if var_29_0.attType == 0 then
				arg_29_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nationTask/thunder/lxgs_title_0000s_0000_zaixiayicheng.png"):displayFrame())
			elseif var_29_0.attType == 1 then
				arg_29_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nationTask/thunder/lxgs_title_0000s_0007_beishuiyizhan.png"):displayFrame())
			end
		elseif var_29_0.continentType and var_29_0.continentType == 3 then
			if var_29_0.attType == 0 then
				arg_29_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nationTask/thunder/lxgs_title_0000s_0002_fanshouweigong.png"):displayFrame())
			elseif var_29_0.attType == 1 then
				arg_29_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nationTask/thunder/lxgs_title_0000s_0006_diyufanji.png"):displayFrame())
			end
		end
	end
end

function var_0_1.setArrow(arg_30_0)
	local function var_30_0()
		return
	end

	local var_30_1 = CCSprite:create("res/ui/nationTask/thunder/lxgs_btn.png")

	var_30_1:setPosition(arg_30_0.uiTable.background:getContentSize().width * 0.9, arg_30_0.uiTable.background:getContentSize().height / 2 + 23)
	arg_30_0.uiTable.background:addChild(var_30_1, 80)

	arg_30_0.uiTable.arrow1 = var_30_1

	local var_30_2 = CCSprite:create("res/ui/nationTask/thunder/lxgs_btn.png")

	var_30_2:setPosition(arg_30_0.uiTable.background:getContentSize().width * 0.9, arg_30_0.uiTable.background:getContentSize().height / 2 + 25)
	var_30_2:setRotation(180)
	arg_30_0.uiTable.background:addChild(var_30_2, 80)

	arg_30_0.uiTable.arrow2 = var_30_2

	if currentGongshouCityPage == 1 then
		var_30_1:setVisible(true)
		var_30_2:setVisible(false)
	else
		var_30_1:setVisible(false)
		var_30_2:setVisible(true)
	end
end

return var_0_1
