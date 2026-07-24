local var_0_0 = {}
local var_0_1 = {}
local var_0_2 = {}

if conf.language == "vie" then
	var_0_2.taskLableFontSize = -6
else
	var_0_2.taskLableFontSize = 0
end

var_0_1.taskButtonPic1 = {
	type = "pic",
	pics = {
		{
			pic = "res/ui/task/resou_task_view.png"
		}
	}
}
var_0_1.taskButtonPic2 = {
	type = "pic",
	pics = {
		{
			pic = "res/ui/task/resou_task_view_lig.png"
		}
	}
}
var_0_1.taskButton = {
	xcenter = 0,
	type = "button",
	ycenter = 0,
	buttons = {
		{
			pic2 = "res/ui/task/task_btn_view_c.png",
			name = "taskButtonItem",
			pic1 = "res/ui/task/task_btn_view_a.png"
		}
	},
	tag = taskConstant.TASK_BUTTON
}
var_0_1.weichengButton = {
	buttons = {
		{
			pic2 = "res/ui/task/task_btn_view_c.png",
			name = "weichengButtonItem",
			pic1 = "res/ui/task/task_btn_view_a.png"
		}
	},
	taskConstant.TASK_TYPE_ID_WEICHENG,
	ycenter = 0,
	xcenter = 0,
	type = "button"
}
var_0_1.buildNationButton = {
	buttons = {
		{
			pic2 = "res/ui/task/task_btn_view_c.png",
			name = "buildNationButtonItem",
			pic1 = "res/ui/task/task_btn_view_a.png"
		}
	},
	taskConstant.TASK_TYPE_ID_BUILDNATION,
	ycenter = 0,
	xcenter = 0,
	type = "button"
}
var_0_1.jungongButton = {
	buttons = {
		{
			pic2 = "res/ui/task/task_btn_view_c.png",
			name = "jungongButtonItem",
			pic1 = "res/ui/task/task_btn_view_a.png"
		}
	},
	taskConstant.TASK_TYPE_ID_JUNGONG,
	ycenter = 0,
	xcenter = 0,
	type = "button"
}
var_0_1.helpButton = {
	xcenter = 0,
	visible = false,
	type = "button",
	ycenter = 0,
	buttons = {
		{
			pic2 = "res/ui/task/task_btn_view_c.png",
			name = "helpButtonItem",
			pic1 = "res/ui/task/task_btn_view_a.png"
		}
	},
	tag = taskConstant.TASK_BUTTON
}
var_0_1.taskIcon = {
	z = 102,
	name = "taskIcon",
	x = 40,
	type = "pic",
	y = 44,
	pic = "res/ui/task/task1.png"
}

function getTaskDescriptionBackgroundData(arg_1_0)
	return {
		anchorPointX = 0,
		name = "taskDescriptionBg",
		type = "pic_9",
		anchorPointY = 1,
		pic = "res/ui/task/task_tips.png",
		middleRect = CCRectMake(25, 30, 153, 30),
		preferedSize = CCSizeMake(192, 108),
		children = {
			{
				fontSize = 22,
				height = 0,
				type = "label",
				anchorPointX = 0,
				name = "taskDescriptionLabel",
				x = 20,
				anchorPointY = 1,
				width = 200,
				text = arg_1_0.introLong .. arg_1_0.processStr
			}
		}
	}
end

var_0_0.jungongButtonLayer = {
	width = 87,
	height = 88,
	name = "jungongButtonLayer",
	type = "layer_color",
	top = 130,
	visible = false,
	color = ccc4(20, 212, 129, 0),
	x = 132 + platform.getSafeDistance(),
	children = {
		var_0_1.jungongButton,
		{
			z = 110,
			name = "jungongWord",
			x = 66,
			type = "pic",
			y = 46,
			pic = "res/ui/jungong/mrjw_task_word_xjw.png"
		},
		{
			xcenter = -3,
			name = "jungongPic",
			z = 105,
			type = "pic",
			ycenter = 0,
			pic = "res/ui/task/nation_task.png"
		},
		{
			text = "0/0",
			font = "Thonburi-Blod",
			name = "jungongTaskProcess",
			type = "label",
			ycenter = 5,
			xcenter = -7,
			z = 200,
			fontSize = 22
		}
	}
}
var_0_0.buildNationButtonLayer = {
	width = 87,
	height = 88,
	name = "buildNationButtonLayer",
	type = "layer_color",
	top = 130,
	visible = false,
	color = ccc4(20, 212, 129, 0),
	x = 132 + platform.getSafeDistance(),
	children = {
		var_0_1.buildNationButton,
		{
			z = 110,
			name = "buildNaitonWord",
			x = 66,
			type = "pic",
			y = 73,
			pic = "res/ui/nation/buildNation/mainTask/task_icon_jg.png"
		},
		{
			xcenter = -3,
			name = "buildNaitonPic",
			z = 105,
			type = "pic",
			ycenter = 0,
			pic = "res/ui/task/nation_task.png"
		}
	}
}
var_0_0.weichengButtonLayer = {
	width = 87,
	height = 88,
	name = "weichengButtonLayer",
	type = "layer_color",
	top = 130,
	visible = false,
	color = ccc4(20, 212, 129, 0),
	x = 132 + platform.getSafeDistance(),
	children = {
		var_0_1.weichengButton,
		{
			z = 110,
			name = "weichengTaskTitleTexturePic",
			x = 66,
			type = "pic",
			y = 73,
			pic = "res/ui/task/task_icon_rw.png"
		},
		{
			xcenter = -3,
			name = "weichengtaskIcon",
			z = 105,
			type = "pic",
			ycenter = 0,
			pic = "res/ui/task/nation_task.png"
		},
		{
			text = "56/89",
			font = "Thonburi-Blod",
			name = "bstaskNumberLabel",
			type = "label",
			ycenter = 5,
			xcenter = -7,
			z = 106,
			fontSize = 22
		}
	}
}
var_0_0.killAllButtonLayer = {
	width = 87,
	height = 88,
	top = 130,
	type = "layer_color",
	name = "killAllButtonLayer",
	visible = false,
	color = ccc4(20, 212, 129, 0),
	x = 12 + platform.getSafeDistance(),
	children = {
		{
			xcenter = 0,
			ycenter = 0,
			type = "button",
			buttons = {
				{
					pic2 = "res/ui/task/task_btn_view_c.png",
					name = "killAllButtonItem",
					pic1 = "res/ui/task/task_btn_view_a.png"
				}
			}
		},
		{
			xcenter = -3,
			name = "killAllTaskIcon",
			z = 105,
			type = "pic",
			ycenter = 0,
			pic = "res/ui/task/nation_task.png"
		},
		{
			xcenter = 0,
			z = 105,
			type = "pic",
			ycenter = 0,
			pic = "res/ui/task/task_btn_view_mask.png"
		},
		{
			x = 75,
			z = 110,
			y = 45,
			type = "pic",
			pic = "res/ui/task/task_zccg.png"
		},
		{
			text = "0/0",
			name = "killAllTaskNumberLabel",
			xcenter = -7,
			type = "label",
			ycenter = 5,
			z = 106,
			fontSize = 22,
			align = kCCTextAlignmentRight
		}
	}
}
var_0_0.taskButtonLayer = {
	top = 130,
	name = "taskButtonLayer",
	width = 87,
	type = "layer_color",
	height = 88,
	color = ccc4(20, 212, 129, 0),
	x = 12 + platform.getSafeDistance(),
	children = {
		var_0_1.taskButton,
		var_0_1.taskIcon,
		{
			xcenter = 0,
			z = 105,
			type = "pic",
			ycenter = 0,
			pic = "res/ui/task/task_btn_view_mask.png"
		},
		{
			z = 110,
			name = "taskTitleTexturePic",
			x = 66,
			type = "pic",
			y = 73,
			pic = "res/ui/task/task_icon_rw.png"
		},
		{
			fontSize = 22,
			name = "taskNumberLabel",
			z = 105,
			type = "label",
			anchorPointX = 1,
			text = "123",
			down = 3,
			visible = false,
			anchorPointY = 0,
			right = 3,
			align = kCCTextAlignmentRight
		},
		{
			name = "taskTitleLabel",
			anchorPointX = 0,
			type = "label",
			strokeSize = 2,
			z = 120,
			text = "",
			font = "Verdana-Blod",
			y = -5,
			anchorPointY = 0.5,
			x = 0,
			fontSize = 26 + var_0_2.taskLableFontSize,
			color = ccc3(255, 255, 207),
			align = kCCTextAlignmentCenter
		}
	}
}
var_0_0.battleHelpLayer = {
	top = 260,
	name = "battleHelpLayer",
	width = 87,
	type = "layer_color",
	height = 88,
	x = 12,
	color = ccc4(20, 212, 129, 0),
	children = {
		var_0_1.helpButton,
		{
			xcenter = 0,
			z = 105,
			visible = false,
			type = "pic",
			ycenter = 0,
			pic = "res/ui/instance/fbmj/task_icon_10.png"
		},
		{
			visible = false,
			z = 110,
			x = 75,
			type = "pic",
			y = 50,
			pic = "res/ui/instance/fbmj/task_fbmj.png"
		}
	}
}

local function var_0_3(arg_2_0, arg_2_1)
	if arg_2_0.taskTypeId == taskConstant.TASK_TYPE_ID_NATION then
		local var_2_0 = "res/ui/task/nation_task.png"

		if arg_2_0.taskState ~= 0 then
			var_2_0 = "res/ui/task/nation_task_finished.png"
		end

		local var_2_1 = {
			{
				left = 0,
				scale = 0.7,
				type = "pic",
				ycenter = 0,
				name = "taskIcon" .. arg_2_1,
				pic = var_2_0
			},
			{
				left = 55,
				type = "label",
				ycenter = 0,
				width = 300,
				fontSize = 22,
				name = "taskNameLabel" .. arg_2_1,
				text = arg_2_0.taskName,
				align = kCCTextAlignmentLeft
			}
		}

		if arg_2_0.taskType == 0 then
			var_2_1[2].text = language.get(60001)
		elseif arg_2_0.taskType == 1 then
			if arg_2_0.attType == 0 then
				var_2_1[2].text = language.get(60002, arg_2_0.cityName)
			else
				var_2_1[2].text = language.get(60003, arg_2_0.cityName)
			end
		elseif arg_2_0.taskType == 2 then
			-- block empty
		elseif arg_2_0.taskType == 3 then
			-- block empty
		elseif arg_2_0.taskType == 4 then
			var_2_1[2].text = language.get(60004)
		elseif arg_2_0.taskType == 5 then
			var_2_1[2].text = language.get(60005)
		elseif arg_2_0.taskType == 6 then
			var_2_1[2].text = language.get(60006)
		elseif arg_2_0.taskType == 7 then
			var_2_1[2].text = language.get(60007)
		elseif arg_2_0.taskType == 8 then
			var_2_1[2].text = language.get(60008)
		elseif arg_2_0.taskType == 9 then
			var_2_1[2].text = language.get(60009)
		elseif arg_2_0.taskType == 10 then
			var_2_1[2].text = language.get(60010)
		elseif arg_2_0.taskType == 12 then
			var_2_1[2].text = language.get(60013)
		end

		return var_2_1
	elseif arg_2_0.taskTypeId == taskConstant.TASK_TYPE_ID_MAIN_BRANCH then
		return {
			{
				left = 0,
				scale = 0.7,
				type = "pic",
				ycenter = 0,
				name = "taskIcon" .. arg_2_1,
				pic = "res/ui/task/" .. arg_2_0.pic .. ".png"
			},
			{
				left = 55,
				type = "label",
				ycenter = 0,
				width = 300,
				fontSize = 22,
				name = "taskNameLabel" .. arg_2_1,
				text = arg_2_0.introLong .. arg_2_0.processStr,
				align = kCCTextAlignmentLeft
			}
		}
	elseif arg_2_0.taskTypeId == taskConstant.TASK_TYPE_ID_TRY then
		local var_2_2 = "res/ui/task/try_task.png"

		if arg_2_0.state ~= 0 then
			var_2_2 = "res/ui/task/try_task_comp.png"
		end

		return {
			{
				left = 0,
				scale = 0.7,
				type = "pic",
				ycenter = 0,
				name = "taskIcon" .. arg_2_1,
				pic = var_2_2
			},
			{
				left = 55,
				type = "label",
				ycenter = 0,
				width = 300,
				fontSize = 22,
				name = "taskNameLabel" .. arg_2_1,
				text = language.get(60012),
				align = kCCTextAlignmentLeft
			}
		}
	elseif arg_2_0.taskTypeId == taskConstant.TASK_TYPE_ID_PROTECT then
		local var_2_3 = "res/ui/task/baohumanwang.png"

		if arg_2_0.state ~= 0 then
			var_2_3 = "res/ui/task/baohumanwang_comp.png"
		end

		log.info(" task.state == taskConstant.TASK_TYPE_ID_PROTECT")

		return {
			{
				left = 0,
				scale = 0.7,
				type = "pic",
				ycenter = 0,
				name = "taskIcon" .. arg_2_1,
				pic = var_2_3
			},
			{
				left = 55,
				type = "label",
				ycenter = 0,
				width = 300,
				fontSize = 22,
				name = "taskNameLabel" .. arg_2_1,
				text = language.get(60011),
				align = kCCTextAlignmentLeft
			}
		}
	end
end

function getTaskDescriptionList()
	return
end

var_0_0.taskList = {
	name = "taskList",
	ycelling = 61,
	type = "list",
	listWidth = 391,
	itemRender = function(arg_4_0, arg_4_1)
		local var_4_0 = true

		log.info("isArrowVisible :", arg_4_0.iosMarktrace)

		if arg_4_0.taskTypeId == taskConstant.TASK_TYPE_ID_MAIN_BRANCH and (not arg_4_0.iosMarktrace or tostring(arg_4_0.iosMarktrace) == "0" or arg_4_0.iosMarktrace == "") then
			var_4_0 = false
		end

		return {
			uis = {
				{
					pic = "res/ui/task/resouTaskViewListBg.jpg",
					type = "pic",
					name = "TaskCell" .. arg_4_1,
					children = {
						{
							xcenter = 0,
							type = "button",
							ycenter = 0,
							name = "taskListButton" .. arg_4_1,
							buttons = {
								{
									pic2 = "res/ui/task/resouTaskViewListOn.jpg",
									pic1 = "res/ui/task/resouTaskViewListBg.jpg",
									children = var_0_3(arg_4_0, arg_4_1),
									callBack = function()
										taskUI.taskListButtonTap(arg_4_1, arg_4_0)
									end
								}
							}
						},
						{
							z = 110,
							type = "pic",
							ycenter = 0,
							pic = "res/ui/task/resou_task_list_arrow.png",
							right = 10,
							visible = var_4_0
						}
					}
				}
			}
		}
	end
}

local function var_0_4(arg_6_0)
	local var_6_0 = {}
	local var_6_1 = {}

	var_6_1[1] = "silver"
	var_6_1[2] = "wood"
	var_6_1[3] = "food"
	var_6_1[4] = "iron"
	var_6_1[5] = "exp"
	var_6_1[6] = "exp"
	var_6_1[40] = "huangjinchui"
	var_6_1[42] = "mubingling"
	var_6_1[112] = "gongxun"
	var_6_1[149] = "suipian"
	var_6_1[215] = "doubleling"
	var_6_1[999] = "jinglandao"

	local function var_6_2(arg_7_0, arg_7_1)
		basicIcon = {
			x = 125,
			type = "pic",
			ycenter = 0,
			pic = "res/ui/task/get_rewa_icon.jpg",
			children = {
				{
					xcenter = 0,
					ycenter = 7,
					type = "pic",
					pic = "res/ui/task/get_icon_" .. var_6_1[arg_7_0] .. ".png"
				},
				{
					xcenter = 0,
					ycenter = -13,
					type = "pic",
					pic = "res/ui/task/get_rewa_" .. var_6_1[arg_7_0] .. ".png"
				},
				{
					fontSize = 26,
					font = "Thonburi",
					type = "label",
					down = -30,
					xcenter = 0,
					text = arg_7_1,
					color = ccc3(255, 255, 207)
				}
			}
		}

		return basicIcon
	end

	local var_6_3 = 1
	local var_6_4 = false

	for iter_6_0, iter_6_1 in pairs(arg_6_0.resource) do
		local var_6_5 = var_6_2(iter_6_1.type, iter_6_1.value)

		var_6_5.x = var_6_5.x + 85 * (var_6_3 - 1)
		var_6_0[#var_6_0 + 1] = var_6_5
		var_6_3 = var_6_3 + 1

		if iter_6_1.type == 6 then
			var_6_4 = true
		end
	end

	if arg_6_0.chiefExp and not var_6_4 then
		local var_6_6 = var_6_2(6, arg_6_0.chiefExp)

		var_6_6.x = var_6_6.x + 85 * (var_6_3 - 1)
		var_6_0[#var_6_0 + 1] = var_6_6
	end

	return var_6_0
end

function getTaskRewardPanel(arg_8_0)
	local var_8_0 = {}

	if conf.language == "vie" then
		var_8_0.menuPosY = -30
		var_8_0.taskDescWidth = -100
	else
		var_8_0.menuPosY = 0
		var_8_0.taskDescWidth = 0
	end

	local var_8_1 = false
	local var_8_2 = {}

	for iter_8_0, iter_8_1 in pairs(user.shareRewardTask) do
		if iter_8_1.taskId == arg_8_0.taskId then
			if conf.language == "tw" or conf.language == "kr" then
				var_8_1 = true
			end

			taskUI.shareTaskId = iter_8_1.taskId
			var_8_2 = iter_8_1.rewards[1]

			break
		end
	end

	local var_8_3 = 0
	local var_8_4

	if var_8_1 then
		var_8_3 = 210
		var_8_4 = {
			y = 15,
			name = "snsShareOptionLayer",
			width = 400,
			type = "layer_color",
			height = 70,
			x = 60,
			color = ccc4(20, 212, 129, 0),
			children = {
				{
					fontSize = 26,
					font = "Thonburi",
					type = "label",
					x = 35,
					ycenter = 0,
					text = language.get("500001_lxr"),
					color = ccc3(255, 255, 207),
					align = kCCTextAlignmentLeft
				},
				{
					ycenter = 0,
					x = 95,
					type = "button",
					buttons = {
						{
							pic2 = "frame:btn_check_1_on.png",
							name = "shareSelectButton",
							pic1 = "frame:btn_check_1_a.png",
							callBack = function()
								showTable(user.shareRewardTask)

								taskUI.shareSelectButtonSelected = not taskUI.shareSelectButtonSelected

								if taskUI.shareSelectButtonSelected then
									taskUI.uiTable.shareSelectButton:selected()
								else
									taskUI.uiTable.shareSelectButton:unselected()
								end
							end
						}
					}
				},
				{
					ycenter = 0,
					x = 155,
					pic = "res/ui/task/zxrw_facebook.png",
					type = "pic"
				},
				{
					fontSize = 26,
					type = "label",
					anchorPointX = 0,
					ycenter = 0,
					font = "Thonburi",
					anchorPointY = 0.5,
					x = 195,
					text = taskConstant.rewardTypeToName[var_8_2.type] .. "+" .. var_8_2.value,
					color = ccc3(255, 255, 207),
					align = kCCTextAlignmentLeft
				}
			}
		}
	end

	if arg_8_0.taskId == 1 then
		arg_8_0.introLong = language.get("220008_zww")
	end

	return {
		xcenter = 0,
		name = "taskRewardPanel",
		type = "pic",
		pic = "res/ui/task/task_background.png",
		ycenter = 0 + var_8_0.menuPosY,
		children = {
			{
				xcenter = 0,
				name = "taskTopTitle",
				type = "pic",
				top = -42,
				pic = "res/ui/task/task_title.png"
			},
			{
				x = 368.5,
				name = "taskMiddleBackground",
				y = 195,
				type = "pic",
				pic = "res/ui/task/task_view_c.jpg",
				children = {
					{
						fontSize = 28,
						name = "taskNameLabel",
						anchorPointX = 1,
						type = "label",
						width = 300,
						visible = false,
						font = "Verdana-Blod",
						y = 165,
						anchorPointY = 0.5,
						x = 250,
						text = arg_8_0.taskName,
						color = ccc3(255, 255, 207),
						align = kCCTextAlignmentRight
					},
					{
						fontSize = 26,
						name = "taskIntroLongLabel",
						anchorPointX = 0,
						type = "label",
						height = 0,
						font = "Thonburi",
						y = 160,
						anchorPointY = 0.5,
						x = 160,
						text = arg_8_0.introLong,
						color = ccc3(255, 255, 207),
						width = 500 + var_8_0.taskDescWidth,
						align = kCCTextAlignmentLeft
					},
					{
						y = 85,
						x = 105,
						type = "pic",
						pic = "res/ui/task/task_rea_tit.png",
						children = var_0_4(arg_8_0)
					},
					{
						x = 74,
						name = "taskRewardIcon",
						y = 169,
						type = "pic",
						pic = "res/ui/task/task4.png"
					},
					{
						x = 510,
						y = 145,
						pic = "res/ui/task/finish.png",
						type = "pic"
					}
				}
			},
			var_8_4,
			{
				name = "getRewardButton",
				y = 51,
				type = "button",
				xcenter = var_8_3,
				buttons = {
					{
						pic2 = "res/ui/task/btn_draw_click.png",
						pic1 = "res/ui/task/btn_draw_a.png",
						callBack = function()
							taskControl.taskGainMenuItemSelected()
						end
					}
				}
			}
		}
	}
end

function getJungongPanel(arg_11_0)
	return {
		xcenter = 0,
		name = "jungongPanel",
		type = "pic",
		ycenter = 0,
		pic = "res/ui/task/task_background.png",
		children = {
			{
				xcenter = 0,
				name = "jungongTitle",
				type = "pic",
				top = -42,
				pic = "res/ui/jungong/junwu_title.png"
			},
			{
				x = 368.5,
				name = "jungongMiddleBackground",
				y = 195,
				type = "pic",
				pic = "res/ui/task/task_view_c.jpg",
				children = {
					{
						fontSize = 28,
						name = "jungongNameLabel",
						anchorPointX = 1,
						type = "label",
						width = 100,
						height = 0,
						text = "军功",
						font = "Verdana-Blod",
						y = 160,
						anchorPointY = 0.5,
						x = 185,
						color = ccc3(255, 255, 207),
						align = kCCTextAlignmentRight
					},
					{
						fontSize = 22,
						name = "jungongIntroLongLabel",
						anchorPointX = 0,
						type = "label",
						width = 400,
						height = 0,
						text = "任务",
						font = "Thonburi",
						y = 160,
						anchorPointY = 0.5,
						x = 190,
						color = ccc3(255, 255, 207),
						align = kCCTextAlignmentLeft
					},
					{
						y = 85,
						x = 105,
						type = "pic",
						pic = "res/ui/task/task_rea_tit.png",
						children = var_0_4(arg_11_0)
					},
					{
						x = 50,
						name = "jungongRewardIcon",
						y = 160,
						type = "pic",
						pic = "res/ui/jungong/mrjw_task_icon.png"
					},
					{
						x = 510,
						name = "jungongFinished",
						y = 145,
						type = "pic",
						pic = "res/ui/task/finish.png"
					}
				}
			},
			{
				xcenter = 0,
				name = "jungongRewardButton",
				y = 51,
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/task/btn_draw_click.png",
						pic1 = "res/ui/task/btn_draw_a.png",
						callBack = function()
							taskControl.getJungongReward()
						end
					}
				}
			},
			{
				xcenter = 0,
				name = "jungongBeginButton",
				y = 51,
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/jungong/mrjw_btn_lqrw_c.png",
						pic1 = "res/ui/jungong/mrjw_btn_lqrw.png",
						callBack = function()
							taskControl.startJungongTask()
						end
					}
				}
			},
			{
				xcenter = -110,
				name = "jungongCancelButton",
				y = 51,
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/common/button/public_btn_red_c.png",
						pic1 = "res/ui/common/button/public_btn_red.png",
						callBack = function()
							taskControl.cancelJungongTask()
						end
					}
				}
			},
			{
				fontSize = 26,
				name = "jungongCancelLb",
				type = "label",
				font = "Thonburi",
				xcenter = -110,
				y = 53,
				text = language.get(226300),
				color = ccc3(255, 255, 207)
			},
			{
				xcenter = 110,
				name = "jungongQuickFinishButton",
				y = 51,
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/common/button/public_btn_green_c.png",
						pic1 = "res/ui/common/button/public_btn_green.png",
						callBack = function()
							taskControl.quickFinishJungong()
						end
					}
				}
			},
			{
				fontSize = 26,
				name = "jungongQuickLb",
				type = "label",
				font = "Thonburi",
				xcenter = 110,
				y = 53,
				text = language.get(226302),
				color = ccc3(255, 255, 207)
			},
			{
				x = 460,
				name = "goldIcon",
				y = 90,
				type = "pic",
				pic = "frame:icon_gold.png",
				children = {
					{
						fontSize = 20,
						name = "goldNumLb",
						anchorPointX = 0,
						type = "label",
						width = 100,
						text = "",
						font = "Thonburi",
						y = 15,
						anchorPointY = 0.5,
						x = -34,
						color = ccc3(255, 255, 207),
						align = kCCTextAlignmentRight
					}
				}
			}
		}
	}
end

function getTaskBoard(arg_16_0)
	return {
		name = "taskBoardBg",
		type = "pic_9",
		pic = "res/ui/task/resouViewBg.png",
		middleRect = CCRectMake(12, 12, 232, 94),
		preferedSize = arg_16_0
	}
end

function getTaskUiData()
	return var_0_0
end
