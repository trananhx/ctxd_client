require("lua/layer/nation/taskTab/constant")

local function var_0_0()
	return ({
		"caocao",
		"zhugeliang",
		"zhouyu"
	})[user.player.forceId]
end

local var_0_1 = {
	[4] = {
		txt = "get_rewa_iron.png",
		pic = "get_icon_iron.png",
		type = 4
	},
	[10] = {
		txt = "get_rewa_exp.png",
		pic = "get_icon_exp.png",
		type = 6
	},
	[17] = {
		txt = "get_rewa_gem.png",
		pic = "get_icon_gem.png",
		type = 7
	},
	[21] = {
		type = 55
	},
	[216] = {
		txt = "get_rewa_yuntie.png",
		pic = "get_icon_yt.png",
		type = 216
	},
	[237] = {
		txt = "get_rewa_js.png",
		pic = "get_icon_gemjs.png",
		type = 237
	},
	[1901] = {
		type = 1901
	},
	[1902] = {
		type = 1902
	},
	[1903] = {
		type = 1903
	},
	[1904] = {
		type = 1904
	},
	[1905] = {
		type = 1905
	}
}
local var_0_2 = colorQuality[0]
local var_0_3 = tool.hexToRgb("#D9EDC5")
local var_0_4 = ccc3(0, 180, 0)
local var_0_5 = colorQuality[5]
local var_0_6 = colorQuality[4]
local var_0_7 = colorQuality[2]
local var_0_8 = {
	"deadTime"
}
local var_0_9 = class("TaskKillAll", function()
	return createBaseLayer()
end)

var_0_9.layout = {
	name = "bg",
	type = "sprite",
	x = visibleSize.width / 2,
	y = visibleSize.height / 2 - 30,
	pic = {
		path = "res/ui/nation/renwudi.jpg"
	},
	children = {
		{
			y = 495,
			x = 457.5,
			type = "sprite",
			pic = {
				path = "res/ui/nationTask/strategy/gzxce_title_zccg.png"
			}
		},
		{
			x = 10,
			name = "npc",
			y = 10,
			type = "sprite",
			scale = 1.6,
			anchorPoint = ccp(0, 0),
			pic = {
				path = "res/ui/common/halfPic/halfPic_zhouyu.png"
			}
		},
		{
			y = 410,
			name = "icon1",
			type = "sprite",
			x = 380,
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_icon01.png"
			},
			children = {
				{
					y = 35,
					type = "sprite",
					x = 50,
					anchorPoint = ccp(0, 0.5),
					pic = {
						path = "res/ui/nationTask/newPic/rwyh_small_bg.png"
					},
					children = {
						{
							fontSize = 20,
							name = "target1",
							y = 36,
							type = "label",
							x = 20,
							color = var_0_3,
							anchorPoint = ccp(0, 0.5)
						}
					}
				}
			}
		},
		{
			y = 340,
			name = "icon2",
			type = "sprite",
			x = 380,
			pic = {
				path = "res/ui/kfyz/invest/kfyz_icon01.png"
			},
			children = {
				{
					y = 70,
					type = "sprite9",
					x = -15,
					preferedSize = CCSizeMake(589, 160),
					middleRect = CCRectMake(0, 20, 589, 112),
					anchorPoint = ccp(0, 1),
					pic = {
						path = "res/ui/nationTask/newPic/rwyh_jl_bg.png"
					},
					children = {
						{
							fontSize = 20,
							name = "target2",
							y = 110,
							type = "label",
							x = 85,
							color = var_0_3,
							anchorPoint = ccp(0, 0.5)
						},
						{
							fontSize = 20,
							name = "deadTime",
							y = 70,
							type = "label",
							x = 200,
							color = var_0_5
						},
						{
							type = "sprite",
							name = "finish",
							y = 55,
							visible = false,
							x = 460,
							pic = {
								path = "res/ui/task/finish.png"
							}
						}
					}
				}
			}
		},
		{
			y = 180,
			name = "icon3",
			type = "sprite",
			x = 380,
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_icon03.png"
			},
			children = {
				{
					y = 70,
					type = "sprite9",
					x = -15,
					preferedSize = CCSizeMake(589, 140),
					middleRect = CCRectMake(0, 20, 589, 112),
					anchorPoint = ccp(0, 1),
					pic = {
						path = "res/ui/nationTask/newPic/rwyh_jl_bg.png"
					},
					children = {
						{
							y = 0,
							name = "node_reward",
							x = 0,
							type = "node"
						}
					}
				}
			}
		},
		{
			y = 40,
			name = "btn_reward",
			h = 54,
			type = "button",
			w = 125,
			visible = false,
			x = 840,
			normal = {
				frame = true,
				path = "btn2_gre_a.png"
			},
			touched = {
				frame = true,
				path = "btn2_gre_c.png"
			},
			children = {
				{
					fontSize = 20,
					y = 27,
					type = "label",
					x = 63,
					textId = 92013,
					color = var_0_3
				}
			}
		}
	}
}
var_0_9.layout_reward = {
	y = 0,
	name = "bg",
	type = "sprite",
	x = 0,
	pic = {
		frame = true,
		path = "jianglikuang1.png"
	},
	children = {
		{
			y = 44,
			name = "icon",
			type = "sprite",
			x = 39.5,
			zorder = 10
		},
		{
			y = 20,
			name = "txt",
			type = "sprite",
			x = 39.5,
			zorder = 10
		},
		{
			type = "sprite",
			name = "corner",
			y = 54,
			visible = false,
			x = 23,
			zorder = 10,
			pic = {
				frame = true,
				path = "nation_task_win_icon.png"
			}
		},
		{
			fontSize = 20,
			name = "num",
			y = -10,
			type = "label",
			x = 39.5,
			color = var_0_6
		}
	}
}

function var_0_9.refresh(arg_3_0)
	local function var_3_0(arg_4_0)
		arg_3_0:showPanel(arg_4_0.action.data)
	end

	cmgr.sendRequest(var_3_0, actions.getCurRankInfo, 1)
end

function var_0_9.onGetNationTaskReward(arg_5_0)
	local function var_5_0(arg_6_0)
		local var_6_0 = arg_6_0.action.data
		local var_6_1 = {}

		for iter_6_0, iter_6_1 in pairs(var_6_0.rewards) do
			if var_0_1[iter_6_1.type] then
				local var_6_2 = {
					id = var_0_1[iter_6_1.type].type,
					value = iter_6_1.value
				}

				table.insert(var_6_1, var_6_2)
			end
		end

		if var_6_0.hasExtra then
			for iter_6_2, iter_6_3 in pairs(var_6_0.extraRewards) do
				if var_0_1[iter_6_3.type] then
					local var_6_3 = {
						id = var_0_1[iter_6_3.type].type,
						value = iter_6_3.value
					}

					table.insert(var_6_1, var_6_3)
				end
			end
		end

		if var_6_0.indivRewards then
			for iter_6_4, iter_6_5 in pairs(var_6_0.indivRewards) do
				if var_0_1[iter_6_5.type] then
					local var_6_4 = {
						id = var_0_1[iter_6_5.type].type,
						value = iter_6_5.value
					}

					table.insert(var_6_1, var_6_4)
				end
			end
		end

		if var_6_0.predicateExtraRewards then
			for iter_6_6, iter_6_7 in pairs(var_6_0.predicateExtraRewards) do
				if var_0_1[iter_6_7.type] then
					local var_6_5 = {
						id = var_0_1[iter_6_7.type].type,
						value = iter_6_7.value
					}

					table.insert(var_6_1, var_6_5)
				end
			end
		end

		globalAction_gotResource(var_6_1)
		arg_5_0:refresh()

		user.hasKillAllTask = false
	end

	local var_5_1 = arg_5_0.info.taskId

	cmgr.sendRequest(var_5_0, actions.getNationTaskReward, var_5_1)
end

function var_0_9.showPanel(arg_7_0, arg_7_1)
	local var_7_0

	for iter_7_0, iter_7_1 in ipairs(arg_7_1.tasks) do
		if iter_7_1.taskType == taskTabConstant.TYPES.NATION_TASK_ZCCG then
			var_7_0 = iter_7_1

			if var_7_0.canGetReward == true or var_7_0.deadTime > 0 then
				-- block empty
			else
				user.hasKillAllTask = false
			end

			taskUI.setkillAllTaskSide(var_7_0)

			break
		end
	end

	if var_7_0 then
		arg_7_0.info = var_7_0

		arg_7_0.view.widgets.npc:setDisplayFrame(CCSprite:create(string.format("res/ui/common/halfPic/halfPic_%s.png", var_0_0())):displayFrame())

		local var_7_1 = language.get(460037, user.forceIdToName[var_7_0.concernNation])

		arg_7_0.view.widgets.target1:setString(language.get(205518, var_7_1, var_7_0.winNums))
		arg_7_0.view.widgets.target2:setString(language.get(205519, var_7_1, var_7_0.currentNum, var_7_0.target))
		arg_7_0.view.widgets.deadTime:stopAllActions()
		arg_7_0.view.widgets.deadTime:setVisible(true)

		local var_7_2 = CCArray:create()

		var_7_2:addObject(CCCallFuncN:create(function()
			if var_7_0.deadTime <= 0 then
				arg_7_0.view.widgets.deadTime:stopAllActions()
			else
				arg_7_0.view.widgets.deadTime:setString(tool.getFormatTime(var_7_0.deadTime))
			end
		end))
		var_7_2:addObject(CCDelayTime:create(0.5))

		local var_7_3 = CCSequence:create(var_7_2)

		arg_7_0.view.widgets.deadTime:runAction(CCRepeatForever:create(var_7_3))
		arg_7_0.view.widgets.node_reward:removeAllChildrenWithCleanup(true)

		for iter_7_2, iter_7_3 in pairs(var_7_0.rewards) do
			local var_7_4 = {}

			uiutil.initWidgets(var_7_4, arg_7_0.layout_reward)
			arg_7_0.view.widgets.node_reward:addChild(var_7_4.widgets.bg)
			var_7_4.widgets.bg:setPosition(130 + 100 * (iter_7_2 - 1), 80)

			local var_7_5 = var_0_1[iter_7_3.type]

			if var_7_5 and var_7_5.pic then
				var_7_4.widgets.icon:setDisplayFrame(CCSprite:create("res/ui/task/" .. var_7_5.pic):displayFrame())
				var_7_4.widgets.txt:setDisplayFrame(CCSprite:create("res/ui/task/" .. var_7_5.txt):displayFrame())
			end

			var_7_4.widgets.num:setString(tool.getFormatNum(tonumber(iter_7_3.value)))
		end

		arg_7_0.view.widgets.finish:setVisible(var_7_0.taskState == 2)
		arg_7_0.view.widgets.btn_reward:setVisible(var_7_0.canGetReward == true and var_7_0.isRewarded == false)
	end
end

function var_0_9.ctor(arg_9_0, arg_9_1, arg_9_2)
	log.info("@@ 斩草除根")

	arg_9_0.view = {}

	uiutil.initWidgets(arg_9_0.view, arg_9_0.layout)

	if arg_9_1 then
		arg_9_0:addChild(arg_9_0.view.widgets.bg)
		arg_9_1:addChild(arg_9_0)
	end

	arg_9_0.view.widgets.btn_reward:addHandleOfControlEvent(function()
		log.info("btn_reward")
		arg_9_0:onGetNationTaskReward()
	end, CCControlEventTouchUpInside)
	arg_9_0:refresh()
end

function var_0_9.onEnter(arg_11_0)
	arg_11_0.updateRef = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_11_0, arg_11_0.update), 0, false)
end

function var_0_9.onExit(arg_12_0)
	if arg_12_0.updateRef then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_12_0.updateRef)
	end
end

function var_0_9.update(arg_13_0, arg_13_1)
	if arg_13_0.info then
		for iter_13_0, iter_13_1 in ipairs(var_0_8) do
			if arg_13_0.info[iter_13_1] then
				if arg_13_0.info[iter_13_1] > 0 then
					arg_13_0.info[iter_13_1] = arg_13_0.info[iter_13_1] - 1000 * arg_13_1
				elseif arg_13_0.info[iter_13_1] <= 0 then
					arg_13_0.info[iter_13_1] = 0
				end
			end
		end
	end
end

return var_0_9
