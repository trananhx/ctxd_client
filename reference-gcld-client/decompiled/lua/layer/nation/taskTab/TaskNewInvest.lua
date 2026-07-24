local var_0_0 = {
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
local var_0_1 = colorQuality[0]
local var_0_2 = tool.hexToRgb("#D9EDC5")
local var_0_3 = ccc3(0, 180, 0)
local var_0_4 = colorQuality[5]
local var_0_5 = colorQuality[4]
local var_0_6 = colorQuality[2]
local var_0_7 = class("TaskNewInvest", function()
	return createBaseLayer()
end)

if conf.language == "vie" or conf.language == "tha" then
	multiLangOffsetfontsize = 16
else
	multiLangOffsetfontsize = 18
end

var_0_7.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			name = "bg",
			type = "sprite9",
			preferedSize = CCSizeMake(916, 516),
			middleRect = CCRectMake(42, 42, 1, 1),
			x = visibleSize.width / 2,
			y = visibleSize.height / 2 - 30,
			pic = {
				path = "res/ui/nationTask/building/jzqj_view_01.png"
			},
			children = {
				{
					y = 456,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/general/jailView/comm_list_laofang_3.png"
					}
				},
				{
					y = 474,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/nationTask/invest/jzrw_title.png"
					}
				},
				{
					y = 220,
					type = "sprite",
					x = 170,
					pic = {
						path = "res/ui/nationTask/invest/jzrw_jzph_bg.png"
					},
					children = {
						{
							y = 352,
							x = 162,
							type = "sprite",
							pic = {
								path = "res/ui/nationTask/invest/jzrw_word_jzph.png"
							}
						},
						{
							y = 270,
							type = "sprite",
							x = 162,
							pic = {
								path = "res/ui/nationTask/invest/jzrw_bar_bg.png"
							},
							children = {
								{
									y = 24,
									name = "bar1",
									type = "progressbar",
									x = 33,
									anchorPoint = ccp(0, 0.5),
									pic = {
										path = "res/ui/nationTask/invest/jzrw_bar_b.png"
									}
								},
								{
									y = 30,
									x = 20,
									type = "sprite",
									scale = 0.7,
									pic = {
										path = "res/ui/resourceArea2/zcgz_btn_round.png"
									}
								},
								{
									fontSize = 26,
									name = "name1",
									y = 30,
									type = "label",
									x = 20
								},
								{
									fontSize = 22,
									name = "num1",
									y = 24,
									type = "label",
									x = 212,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							y = 200,
							type = "sprite",
							x = 162,
							pic = {
								path = "res/ui/nationTask/invest/jzrw_bar_bg.png"
							},
							children = {
								{
									y = 24,
									name = "bar2",
									type = "progressbar",
									x = 33,
									anchorPoint = ccp(0, 0.5),
									pic = {
										path = "res/ui/nationTask/invest/jzrw_bar_r.png"
									}
								},
								{
									y = 30,
									x = 20,
									type = "sprite",
									scale = 0.7,
									pic = {
										path = "res/ui/resourceArea2/zcgz_btn_round.png"
									}
								},
								{
									fontSize = 26,
									name = "name2",
									y = 30,
									type = "label",
									x = 20
								},
								{
									fontSize = 22,
									name = "num2",
									y = 24,
									type = "label",
									x = 212,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							y = 130,
							type = "sprite",
							x = 162,
							pic = {
								path = "res/ui/nationTask/invest/jzrw_bar_bg.png"
							},
							children = {
								{
									y = 24,
									name = "bar3",
									type = "progressbar",
									x = 33,
									anchorPoint = ccp(0, 0.5),
									pic = {
										path = "res/ui/nationTask/invest/jzrw_bar_g.png"
									}
								},
								{
									y = 30,
									x = 20,
									type = "sprite",
									scale = 0.7,
									pic = {
										path = "res/ui/resourceArea2/zcgz_btn_round.png"
									}
								},
								{
									fontSize = 26,
									name = "name3",
									y = 30,
									type = "label",
									x = 20
								},
								{
									fontSize = 22,
									name = "num3",
									y = 24,
									type = "label",
									x = 212,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							name = "target",
							y = 70,
							type = "label",
							x = 162,
							fontSize = multiLangOffsetfontsize
						},
						{
							fontSize = 18,
							y = 32,
							type = "label",
							x = 162,
							textId = 137007,
							color = var_0_5
						}
					}
				},
				{
					y = 380,
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
									color = var_0_2,
									anchorPoint = ccp(0, 0.5)
								}
							}
						}
					}
				},
				{
					y = 295,
					name = "icon2",
					type = "sprite",
					x = 380,
					pic = {
						path = "res/ui/nationTask/newPic/rwyh_icon02.png"
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
									y = 36,
									x = 40,
									type = "sprite",
									pic = {
										path = "res/ui/nationTask/invest/jzrw_flag_putong.png"
									}
								},
								{
									y = 36,
									x = 280,
									type = "sprite",
									pic = {
										path = "res/ui/nationTask/invest/jzrw_flag_gaoji.png"
									}
								},
								{
									y = 0,
									name = "node_btn",
									x = 0,
									type = "node"
								}
							}
						}
					}
				},
				{
					y = 210,
					name = "icon3",
					type = "sprite",
					x = 380,
					pic = {
						path = "res/ui/nationTask/newPic/rwyh_icon03.png"
					},
					children = {
						{
							y = -25,
							type = "sprite",
							x = 300,
							pic = {
								path = "res/ui/nationTask/newPic/rwyh_jl_bg.png"
							},
							children = {
								{
									type = "sprite",
									name = "noReward",
									y = 90,
									visible = false,
									x = 290,
									pic = {
										frame = true,
										path = "nationZanwujianli.png"
									}
								},
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
							color = var_0_2
						}
					}
				},
				{
					type = "sprite",
					name = "taskNext",
					y = 258,
					visible = false,
					x = 458,
					pic = {
						frame = true,
						path = "nation_fabudi.png"
					},
					children = {
						{
							anchorPointX = 0.5,
							name = "richLine_taskNext",
							y = 120,
							type = "richLine",
							gap = 0,
							x = 473.5,
							content = {
								{
									name = "taskNextHour",
									type = "atlaslabel",
									pic = "res/ui/common/number/jtj_general_num.png",
									startCharMap = 48,
									text = "0",
									y = 0,
									itemWidth = 29,
									x = 0,
									itemHeight = 49
								},
								{
									y = 0,
									x = 0,
									type = "sprite",
									pic = {
										frame = true,
										path = "nation_maohao.png"
									}
								},
								{
									text = "00",
									y = 0,
									startCharMap = 48,
									type = "atlaslabel",
									pic = "res/ui/common/number/jtj_general_num.png",
									itemWidth = 29,
									x = 0,
									itemHeight = 49
								},
								{
									y = 0,
									x = 0,
									type = "sprite",
									pic = {
										frame = true,
										path = "nation_next.png"
									}
								}
							}
						}
					}
				}
			}
		}
	}
}
var_0_7.layout_btnCity = {
	zoomOnTouchDown = true,
	name = "btn_city",
	h = 60,
	type = "button",
	w = 90,
	y = 0,
	x = 0,
	normal = {
		path = "res/default.png"
	},
	touched = {
		path = "res/default.png"
	},
	children = {
		{
			fontSize = 18,
			name = "city",
			y = 30,
			type = "label",
			x = 45,
			color = var_0_3
		}
	}
}
var_0_7.layout_reward = {
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
			color = var_0_5
		}
	}
}

function var_0_7.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getCurRankInfo, 1)
end

function var_0_7.onGetNationTaskReward(arg_4_0)
	local function var_4_0(arg_5_0)
		local var_5_0 = arg_5_0.action.data
		local var_5_1 = {}

		for iter_5_0, iter_5_1 in pairs(var_5_0.rewards) do
			if var_0_0[iter_5_1.type] then
				local var_5_2 = {
					id = var_0_0[iter_5_1.type].type,
					value = iter_5_1.value
				}

				table.insert(var_5_1, var_5_2)
			end
		end

		if var_5_0.hasExtra then
			for iter_5_2, iter_5_3 in pairs(var_5_0.extraRewards) do
				if var_0_0[iter_5_3.type] then
					local var_5_3 = {
						id = var_0_0[iter_5_3.type].type,
						value = iter_5_3.value
					}

					table.insert(var_5_1, var_5_3)
				end
			end
		end

		if var_5_0.indivRewards then
			for iter_5_4, iter_5_5 in pairs(var_5_0.indivRewards) do
				if var_0_0[iter_5_5.type] then
					local var_5_4 = {
						id = var_0_0[iter_5_5.type].type,
						value = iter_5_5.value
					}

					table.insert(var_5_1, var_5_4)
				end
			end
		end

		if var_5_0.predicateExtraRewards then
			for iter_5_6, iter_5_7 in pairs(var_5_0.predicateExtraRewards) do
				if var_0_0[iter_5_7.type] then
					local var_5_5 = {
						id = var_0_0[iter_5_7.type].type,
						value = iter_5_7.value
					}

					table.insert(var_5_1, var_5_5)
				end
			end
		end

		globalAction_gotResource(var_5_1)
		arg_4_0:refresh()
	end

	local var_4_1 = arg_4_0.info.tasks[1].taskId

	cmgr.sendRequest(var_4_0, actions.getNationTaskReward, var_4_1)
end

function var_0_7.showPanel(arg_6_0, arg_6_1)
	arg_6_0.info = arg_6_1

	local var_6_0 = arg_6_1.tasks[1]
	local var_6_1 = math.max(var_6_0.nationRanks[1].num, var_6_0.nationRanks[2].num, var_6_0.nationRanks[3].num)

	for iter_6_0 = 1, 3 do
		local var_6_2 = var_6_0.nationRanks[iter_6_0].num

		if var_6_2 > 10000 then
			var_6_2 = math.floor(var_6_2 / 10000)
			var_6_2 = language.get(75021, var_6_2)
		end

		arg_6_0.view.widgets["num" .. iter_6_0]:setString(var_6_2)
		arg_6_0.view.widgets["bar" .. iter_6_0]:setPercentage(100 * var_6_0.nationRanks[iter_6_0].num / var_6_1)
	end

	local var_6_3 = {
		137001,
		137002,
		137003
	}

	arg_6_0.view.widgets.target:setString(language.get(137005, tool.getFormatNum(var_6_0.target)))
	arg_6_0.view.widgets.target1:setString(language.get(137004, language.get(var_6_3[user.player.forceId])))

	var_6_0.cities = var_6_0.cities or {}

	table.sort(var_6_0.cities, function(arg_7_0, arg_7_1)
		return arg_7_0.type < arg_7_1.type
	end)
	arg_6_0.view.widgets.node_btn:removeAllChildrenWithCleanup(true)

	for iter_6_1, iter_6_2 in ipairs(var_6_0.cities) do
		local var_6_4 = {}

		uiutil.initWidgets(var_6_4, arg_6_0.layout_btnCity)
		arg_6_0.view.widgets.node_btn:addChild(var_6_4.widgets.btn_city)
		var_6_4.widgets.btn_city:addHandleOfControlEvent(function()
			log.info("btn_city")
			smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
			loadingLayer.show(SCENE_WORLD, iter_6_2.cityId)
		end, CCControlEventTouchUpInside)
		var_6_4.widgets.city:setString(iter_6_2.cityName)

		local var_6_5

		if iter_6_1 <= 2 then
			var_6_5 = 100 + 100 * (iter_6_1 - 1)
		else
			var_6_5 = 340 + 100 * (iter_6_1 - 3)
		end

		var_6_4.widgets.btn_city:setPosition(var_6_5, 38)
	end

	arg_6_0.view.widgets.node_reward:removeAllChildrenWithCleanup(true)

	local var_6_6 = var_6_0.rankNum == 0

	arg_6_0.view.widgets.noReward:setVisible(var_6_6)

	if not var_6_6 then
		for iter_6_3, iter_6_4 in pairs(var_6_0.rewards) do
			local var_6_7 = {}

			uiutil.initWidgets(var_6_7, arg_6_0.layout_reward)
			arg_6_0.view.widgets.node_reward:addChild(var_6_7.widgets.bg)
			var_6_7.widgets.bg:setPosition(110 + 100 * (iter_6_3 - 1), 90)

			local var_6_8 = var_0_0[iter_6_4.type]

			if var_6_8 and var_6_8.pic then
				var_6_7.widgets.icon:setDisplayFrame(CCSprite:create("res/ui/task/" .. var_6_8.pic):displayFrame())
				var_6_7.widgets.txt:setDisplayFrame(CCSprite:create("res/ui/task/" .. var_6_8.txt):displayFrame())
			end

			var_6_7.widgets.num:setString(tool.getFormatNum(tonumber(iter_6_4.value)))
		end

		for iter_6_5, iter_6_6 in pairs(var_6_0.extraRewards) do
			local var_6_9 = {}

			uiutil.initWidgets(var_6_9, arg_6_0.layout_reward)
			arg_6_0.view.widgets.node_reward:addChild(var_6_9.widgets.bg)
			var_6_9.widgets.bg:setPosition(110 + 100 * (iter_6_5 + 1), 90)
			var_6_9.widgets.corner:setVisible(true)

			local var_6_10 = var_0_0[iter_6_6.type]

			if var_6_10 and var_6_10.pic then
				var_6_9.widgets.icon:setDisplayFrame(CCSprite:create("res/ui/task/" .. var_6_10.pic):displayFrame())
				var_6_9.widgets.txt:setDisplayFrame(CCSprite:create("res/ui/task/" .. var_6_10.txt):displayFrame())
			end

			var_6_9.widgets.num:setString(tool.getFormatNum(tonumber(iter_6_6.value)))

			if var_6_0.hasExtra == false then
				tool.spriteToGray(var_6_9.widgets.bg, true)
				var_6_9.widgets.num:setColor(var_0_1)
			end
		end
	end

	arg_6_0.view.widgets.btn_reward:setVisible(var_6_0.canGetReward == true)

	if var_6_0.taskState ~= 0 and var_6_0.canGetReward == false and var_6_0.nextTaskTime then
		arg_6_0.view.widgets.taskNext:setVisible(true)
		arg_6_0.view.widgets.taskNextHour:setString(var_6_0.nextTaskTime)
		arg_6_0.view.widgets.richLine_taskNext:reorder()
	end
end

function var_0_7.ctor(arg_9_0, arg_9_1)
	log.info("@@ 新投资")

	arg_9_0.view = {}

	uiutil.initWidgets(arg_9_0.view, arg_9_0.layout)
	arg_9_0:addChild(arg_9_0.view.widgets.root)

	for iter_9_0 = 1, 3 do
		local var_9_0 = arg_9_0.view.widgets["name" .. iter_9_0]

		var_9_0:setString(user.forceIdToName[iter_9_0])
		var_9_0:setColor(colorForce[iter_9_0])
	end

	arg_9_0.view.widgets.btn_reward:addHandleOfControlEvent(function()
		log.info("btn_reward")
		arg_9_0:onGetNationTaskReward()
	end, CCControlEventTouchUpInside)
	arg_9_0:showPanel(arg_9_1)
end

return var_0_7
