local var_0_0 = class("DrillTask", function()
	return createBaseLayer()
end)

var_0_0.layout = {
	name = "root",
	type = "node",
	x = visibleSize.width / 2,
	y = visibleSize.height / 2 - 30,
	children = {
		{
			y = 0,
			name = "bg",
			type = "sprite9",
			x = 0,
			preferedSize = CCSizeMake(960, 580),
			middleRect = CCRectMake(45, 30, 15, 45),
			pic = {
				frame = true,
				path = "bigPanel.png"
			},
			children = {
				{
					x = 924,
					name = "btn_close",
					h = 33,
					type = "button",
					w = 32,
					y = 604,
					scale = 2,
					normal = {
						frame = true,
						path = "btn_close_a.png"
					},
					touched = {
						frame = true,
						path = "btn_close_c.png"
					}
				}
			}
		},
		{
			y = -5.7143,
			name = "renwudi",
			type = "sprite",
			x = -2.8572,
			pic = {
				path = "res/ui/nation/renwudi.jpg"
			}
		},
		{
			y = 226.9999,
			name = "titleBg",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/ywTask/jbyw_word_jbyw.png"
			}
		},
		{
			y = -105,
			name = "rwyh_jl_bg",
			type = "sprite",
			x = 155.5714,
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_jl_bg.png"
			}
		},
		{
			y = 133.9997,
			name = "rwyh_small_bg",
			type = "sprite",
			x = 193.0001,
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_small_bg.png"
			}
		},
		{
			y = 25.9522,
			name = "jbyw_yanwu_map",
			type = "sprite",
			x = -273.272,
			pic = {
				path = "res/ui/ywTask/jbyw_yanwu_map.png"
			}
		},
		{
			y = -137,
			name = "rwyh_djs_bg",
			type = "sprite",
			x = -243,
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_djs_bg.png"
			}
		},
		{
			y = 39.9999,
			name = "Image_3",
			type = "sprite9",
			x = 171.5716,
			preferedSize = CCSizeMake(500, 80),
			middleRect = CCRectMake(70, 5, 223, 39),
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_djs_bg.png"
			}
		},
		{
			y = 136.4285,
			name = "rwyh_icon01",
			type = "sprite",
			x = -55,
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_icon01.png"
			}
		},
		{
			y = 44.9998,
			name = "rwyh_icon01",
			type = "sprite",
			x = -55.0001,
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_icon01.png"
			}
		},
		{
			y = -48.0004,
			name = "rwyh_icon03",
			type = "sprite",
			x = -55.0001,
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_icon03.png"
			}
		},
		{
			y = -226.0009,
			name = "getBtn",
			h = 62,
			type = "button",
			w = 195,
			visible = false,
			x = 168.9999,
			normal = {
				path = "res/ui/common/button/public_btn_green.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_green_c.png"
			},
			children = {
				{
					fontSize = 24,
					name = "Text_23",
					style = "label_warlock",
					type = "label",
					y = 33,
					x = 97.5,
					textId = 92013,
					color = color_whi
				}
			}
		},
		{
			fontSize = 22,
			name = "nationTargetText",
			y = 138.5714,
			type = "label",
			x = -18.7144,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 22,
			name = "timeText",
			y = -134,
			type = "label",
			x = -243
		},
		{
			y = 44.1427,
			name = "chenghaoTitle",
			type = "sprite",
			x = 31.1426,
			pic = {
				frame = true,
				path = "chenghao1.png"
			}
		},
		{
			y = -45,
			name = "rewardList",
			x = 40,
			type = "node"
		},
		{
			type = "sprite",
			name = "resultSp",
			y = 45.7116,
			visible = false,
			x = 227.8569,
			pic = {
				path = "res/ui/nationTask/arena/ltzbs_word_sl.png"
			}
		},
		{
			type = "sprite",
			name = "noReward",
			y = -120,
			visible = false,
			x = 180,
			pic = {
				frame = true,
				path = "nationZanwujianli.png"
			}
		}
	}
}

local var_0_1 = {
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
			color = color_yel
		}
	}
}
local var_0_2 = {
	[4] = {
		txt = "get_rewa_iron.png",
		pic = "get_icon_iron.png",
		type = 4
	},
	[5] = {
		txt = "get_rewa_exp.png",
		pic = "get_icon_exp.png",
		type = 6
	},
	[21] = {
		txt = "get_rewa_gem.png",
		pic = "get_icon_gem.png",
		type = 7
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
local var_0_3 = {
	[0] = 1,
	11,
	9,
	8,
	6,
	2
}

function var_0_0.ctor(arg_2_0)
	log.info("@@ 演武任务")
	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("res/ui/nation/nation.plist")

	arg_2_0.view = {}

	uiutil.initWidgets(arg_2_0.view, arg_2_0.layout)
	arg_2_0:addChild(arg_2_0.view.widgets.root)
	swallowTouch(arg_2_0)
	arg_2_0:refresh()
end

function var_0_0.update(arg_3_0, arg_3_1)
	if arg_3_1 then
		if user.player.forceId == arg_3_1.attForceId then
			arg_3_0.view.widgets.nationTargetText:setString(language.get(215116, arg_3_1.attVitalCityName, arg_3_1.targetCityName))
		else
			arg_3_0.view.widgets.nationTargetText:setString(language.get(215135, arg_3_1.targetCityName, arg_3_1.attVitalCityName))
		end

		if arg_3_1.state == 1 then
			arg_3_0.view.widgets.resultSp:setVisible(false)
			arg_3_0.view.widgets.getBtn:setVisible(false)
			arg_3_0.view.widgets.timeText:setString("")

			if arg_3_1.time and arg_3_1.time > 0 then
				if arg_3_0.timeLb == nil then
					local function var_3_0()
						if arg_3_0.timeLb then
							pcall(arg_3_0.timeLb.removeFromParentAndCleanup, arg_3_0.timeLb, true)

							arg_3_0.timeLb = nil
						end
					end

					arg_3_0.timeLb = createTimerLabel(arg_3_1.time, "@H:@M:@S", "Thonburi-Bold", 24, var_3_0, nil, nil, colorTips.red)

					arg_3_0.timeLb:setPosition(ccp(-243, -134))
					arg_3_0.view.widgets.root:addChild(arg_3_0.timeLb)
				else
					arg_3_0.timeLb:setTime(arg_3_1.time)
				end
			end
		else
			arg_3_0.view.widgets.timeText:setString(language.get(215126))
			arg_3_0.view.widgets.resultSp:setVisible(true)

			if arg_3_1.isWin then
				arg_3_0.view.widgets.resultSp:setDisplayFrame(CCSprite:create("res/ui/nationTask/arena/ltzbs_word_sl.png"):displayFrame())
			else
				arg_3_0.view.widgets.resultSp:setDisplayFrame(CCSprite:create("res/ui/nationTask/arena/ltzbs_word_sb.png"):displayFrame())
			end

			if not arg_3_1.rewarded and arg_3_1.rewards and #arg_3_1.rewards > 0 then
				arg_3_0.view.widgets.getBtn:setVisible(true)
			else
				arg_3_0.view.widgets.getBtn:setVisible(false)
			end
		end

		local var_3_1 = var_0_3[arg_3_1.rank] or arg_3_1.rank

		arg_3_0.view.widgets.chenghaoTitle:setDisplayFrame(CCSprite:createWithSpriteFrameName("chenghao" .. var_3_1 .. ".png"):displayFrame())

		if arg_3_1.rewards then
			arg_3_0:updateRewardList(arg_3_1.rewards)
		end

		local var_3_2 = not arg_3_1.rewards or not (#arg_3_1.rewards > 0)

		arg_3_0.view.widgets.noReward:setVisible(var_3_2)
	end
end

function var_0_0.updateRewardList(arg_5_0, arg_5_1)
	arg_5_0.view.widgets.rewardList:removeAllChildrenWithCleanup(true)

	for iter_5_0, iter_5_1 in pairs(arg_5_1) do
		local var_5_0 = {}

		uiutil.initWidgets(var_5_0, var_0_1)
		arg_5_0.view.widgets.rewardList:addChild(var_5_0.widgets.bg)
		var_5_0.widgets.bg:setPosition(100 * (iter_5_0 - 1), -68)

		local var_5_1 = var_0_2[iter_5_1.type]

		if var_5_1 and var_5_1.pic then
			var_5_0.widgets.icon:setDisplayFrame(CCSprite:create("res/ui/task/" .. var_5_1.pic):displayFrame())
			var_5_0.widgets.txt:setDisplayFrame(CCSprite:create("res/ui/task/" .. var_5_1.txt):displayFrame())
		end

		var_5_0.widgets.num:setString(tool.getFormatNum(tonumber(iter_5_1.num)))
	end
end

function var_0_0.refresh(arg_6_0)
	cmgr.sendRequest(function(arg_7_0)
		arg_6_0:update(arg_7_0.action.data)
	end, actions.getMultiJubenTask)
end

function var_0_0.onEnter(arg_8_0)
	local function var_8_0(...)
		arg_8_0:removeFromParentAndCleanup(true)
	end

	local function var_8_1()
		local function var_10_0(arg_11_0)
			local var_11_0 = arg_11_0.action.data
			local var_11_1 = {}

			for iter_11_0, iter_11_1 in pairs(var_11_0.rewards) do
				if var_0_2[iter_11_1.type] then
					local var_11_2 = {
						id = var_0_2[iter_11_1.type].type,
						value = iter_11_1.num
					}

					table.insert(var_11_1, var_11_2)
				end
			end

			if var_11_0.hasExtra then
				for iter_11_2, iter_11_3 in pairs(var_11_0.extraRewards) do
					if var_0_2[iter_11_3.type] then
						local var_11_3 = {
							id = var_0_2[iter_11_3.type].type,
							value = iter_11_3.num
						}

						table.insert(var_11_1, var_11_3)
					end
				end
			end

			if var_11_0.indivRewards then
				for iter_11_4, iter_11_5 in pairs(var_11_0.indivRewards) do
					if var_0_2[iter_11_5.type] then
						local var_11_4 = {
							id = var_0_2[iter_11_5.type].type,
							value = iter_11_5.num
						}

						table.insert(var_11_1, var_11_4)
					end
				end
			end

			if var_11_0.predicateExtraRewards then
				for iter_11_6, iter_11_7 in pairs(var_11_0.predicateExtraRewards) do
					if var_0_2[iter_11_7.type] then
						local var_11_5 = {
							id = var_0_2[iter_11_7.type].type,
							value = iter_11_7.num
						}

						table.insert(var_11_1, var_11_5)
					end
				end
			end

			globalAction_gotResource(var_11_1)
			var_8_0()

			if smgr.currentSceneTag == SCENE_JUBEN then
				smgr.changeScene(SCENE_MAIN_CITY)
			end
		end

		cmgr.sendRequest(var_10_0, actions.getMultiJuBenReward)
	end

	arg_8_0.view.widgets.getBtn:addHandleOfControlEvent(var_8_1, CCControlEventTouchUpInside)
	arg_8_0.view.widgets.btn_close:addHandleOfControlEvent(var_8_0, CCControlEventTouchDown)
end

function var_0_0.onExit(arg_12_0)
	return
end

return var_0_0
