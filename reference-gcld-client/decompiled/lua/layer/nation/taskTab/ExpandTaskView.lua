local var_0_0 = class("ExpandTaskView", function()
	return createBaseLayer()
end)
local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.sizeoffset = 15
else
	var_0_1.sizeoffset = 0
end

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
			}
		},
		{
			y = -3.8095,
			name = "renwudi",
			type = "sprite",
			x = -1.1905,
			pic = {
				path = "res/ui/nation/renwudi.jpg"
			}
		},
		{
			y = 154.9999,
			name = "ltzbs_word_zbf",
			type = "sprite",
			x = -367.9997,
			pic = {
				path = "res/ui/nationTask/arena/ltzbs_word_zbf.png"
			}
		},
		{
			y = 152,
			name = "ltzbs_word_di_ink",
			type = "sprite",
			x = -181.6649,
			pic = {
				path = "res/ui/nationTask/arena/ltzbs_word_di_ink.png"
			}
		},
		{
			y = 152,
			name = "ltzbs_word_di_ink_2",
			type = "sprite",
			x = 35.2837,
			pic = {
				path = "res/ui/nationTask/arena/ltzbs_word_di_ink.png"
			}
		},
		{
			y = 152,
			name = "ltzbs_word_di_ink_3",
			type = "sprite",
			x = 279.0292,
			pic = {
				path = "res/ui/nationTask/arena/ltzbs_word_di_ink.png"
			}
		},
		{
			y = 152,
			name = "role_nation_view",
			type = "sprite",
			x = -245,
			pic = {
				path = "res/ui/playerInfo/role_nation_view.png"
			}
		},
		{
			y = 152,
			name = "role_nation_view_2",
			type = "sprite",
			x = -20,
			pic = {
				path = "res/ui/playerInfo/role_nation_view.png"
			}
		},
		{
			y = 152,
			name = "role_nation_view_Copy_3",
			type = "sprite",
			x = 213.0024,
			pic = {
				path = "res/ui/playerInfo/role_nation_view.png"
			}
		},
		{
			name = "nationLb1",
			y = 153.9998,
			type = "label",
			x = -246.0001,
			color = colorForce[1],
			fontSize = 36 - (var_0_1.sizeoffset or 0)
		},
		{
			name = "score1",
			type = "atlaslabel",
			pic = "res/ui/common/number/mnlm_word_time_numb.png",
			startCharMap = 48,
			text = "0",
			y = 153.9998,
			itemWidth = 20,
			x = -190,
			itemHeight = 30,
			anchorPoint = ccp(0, 0.5)
		},
		{
			name = "nationLb2",
			y = 153.9999,
			type = "label",
			x = -20,
			color = colorForce[2],
			fontSize = 36 - (var_0_1.sizeoffset or 0)
		},
		{
			name = "score2",
			type = "atlaslabel",
			pic = "res/ui/common/number/mnlm_word_time_numb.png",
			startCharMap = 48,
			text = "0",
			y = 153.9998,
			itemWidth = 20,
			x = 36,
			itemHeight = 30,
			anchorPoint = ccp(0, 0.5)
		},
		{
			name = "nationLb3",
			y = 153.9999,
			type = "label",
			x = 212.9926,
			color = colorForce[3],
			fontSize = 36 - (var_0_1.sizeoffset or 0)
		},
		{
			name = "score3",
			type = "atlaslabel",
			pic = "res/ui/common/number/mnlm_word_time_numb.png",
			startCharMap = 48,
			text = "0",
			y = 153.9998,
			itemWidth = 20,
			x = 269,
			itemHeight = 30,
			anchorPoint = ccp(0, 0.5)
		},
		{
			y = 28.9999,
			name = "rwyh_jl_bg_Copy",
			type = "sprite",
			x = 155.57,
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_jl_bg.png"
			}
		},
		{
			y = -127.0001,
			name = "rwyh_jl_bg",
			type = "sprite",
			x = 155.57,
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_jl_bg.png"
			}
		},
		{
			y = -219.0003,
			name = "rwyh_djs_bg",
			type = "sprite",
			x = -269.9994,
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_djs_bg.png"
			}
		},
		{
			y = 82,
			name = "rwyh_icon01",
			type = "sprite",
			x = -55,
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_icon01.png"
			}
		},
		{
			y = -77.0005,
			name = "rwyh_icon03",
			type = "sprite",
			x = -55.0002,
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_icon03.png"
			}
		},
		{
			name = "getInvBtn",
			h = 62,
			type = "button",
			w = 195,
			y = -10,
			x = 335,
			normal = {
				path = "res/ui/common/button/public_btn_green.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_green_c.png"
			},
			children = {
				{
					fontSize = 28,
					name = "Text_23_Copy",
					style = "label_warlock",
					type = "label",
					y = 33,
					x = 97.5,
					textId = 95047,
					color = color_whi
				}
			}
		},
		{
			name = "getBtn",
			h = 62,
			type = "button",
			w = 195,
			y = -235.0009,
			x = 168.9997,
			normal = {
				path = "res/ui/common/button/public_btn_green.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_green_c.png"
			},
			children = {
				{
					fontSize = 28,
					style = "label_warlock",
					name = "Text_23",
					type = "label",
					y = 33,
					x = 97.5,
					textId = 95047,
					color = color_whi
				}
			}
		},
		{
			fontSize = 22,
			name = "timeText",
			y = -215.0002,
			type = "label",
			x = -281.9998
		},
		{
			y = -40.0005,
			name = "nationMap",
			type = "sprite",
			x = -280,
			pic = {
				frame = true,
				path = "nationMap.png"
			}
		},
		{
			y = 226,
			name = "word_xin",
			type = "sprite",
			x = -105,
			pic = {
				path = "res/ui/activity/ironSell/word_xin.png"
			}
		},
		{
			y = 226,
			name = "nation_kaijiangkuotu",
			type = "sprite",
			x = 25.0001,
			pic = {
				frame = true,
				path = "nation_kaijiangkuotu.png"
			}
		},
		{
			y = 0,
			name = "map1",
			visible = false,
			type = "node",
			x = 0,
			children = {
				{
					y = -40,
					name = "xkjtt_area_wei",
					type = "sprite",
					x = -280,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_area_wei.png"
					}
				},
				{
					y = 44.285,
					name = "xkjtt_word_di",
					type = "sprite",
					x = -184.2877,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_word_di.png"
					}
				},
				{
					y = 57,
					name = "xkjtt_word_01jf",
					type = "sprite",
					x = -186,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_word_01jf.png"
					}
				},
				{
					y = -2.8577,
					name = "xkjtt_word_di_Copy",
					type = "sprite",
					scaleX = -1,
					x = -394.291,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_word_di.png"
					}
				},
				{
					y = 9.9997,
					name = "xkjtt_word_02jf",
					type = "sprite",
					x = -391.0004,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_word_02jf.png"
					}
				},
				{
					y = -67.143,
					name = "xkjtt_word_di_Copy_0",
					type = "sprite",
					x = -270.0015,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_word_di.png"
					}
				},
				{
					y = -54.0001,
					name = "xkjtt_word_03jf",
					type = "sprite",
					x = -268.8574,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_word_03jf.png"
					}
				}
			}
		},
		{
			y = 0,
			name = "map2",
			visible = false,
			type = "node",
			x = 0,
			children = {
				{
					y = -40,
					name = "xkjtt_area_shu",
					type = "sprite",
					x = -280,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_area_shu.png"
					}
				},
				{
					y = -10.0006,
					name = "xkjtt_word_di",
					type = "sprite",
					scaleX = -1,
					x = -404.2881,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_word_di.png"
					}
				},
				{
					y = 1.8571,
					name = "xkjtt_word_01jf",
					type = "sprite",
					x = -405.4291,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_word_01jf.png"
					}
				},
				{
					y = 35.7138,
					name = "xkjtt_word_di_Copy",
					type = "sprite",
					x = -240.0022,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_word_di.png"
					}
				},
				{
					y = 47.8571,
					name = "xkjtt_word_02jf",
					type = "sprite",
					x = -238.0006,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_word_02jf.png"
					}
				},
				{
					y = -8.5718,
					name = "xkjtt_word_di_Copy_0",
					type = "sprite",
					x = -154.2867,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_word_di.png"
					}
				},
				{
					y = 4.4286,
					name = "xkjtt_word_03jf",
					type = "sprite",
					x = -154.143,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_word_03jf.png"
					}
				}
			}
		},
		{
			y = 0,
			name = "map3",
			visible = false,
			type = "node",
			x = 0,
			children = {
				{
					y = -40,
					name = "xkjtt_area_wu",
					type = "sprite",
					x = -280,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_area_wu.png"
					}
				},
				{
					y = -68.5715,
					name = "xkjtt_word_di",
					type = "sprite",
					x = -182.8574,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_word_di.png"
					}
				},
				{
					y = -55.0001,
					name = "xkjtt_word_01jf",
					type = "sprite",
					x = -184.5715,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_word_01jf.png"
					}
				},
				{
					y = 22.8569,
					name = "xkjtt_word_di_Copy",
					type = "sprite",
					x = -295.287,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_word_di.png"
					}
				},
				{
					y = 35.7143,
					name = "xkjtt_word_03jf",
					type = "sprite",
					x = -295.2864,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_word_03jf.png"
					}
				},
				{
					y = -48.7146,
					name = "xkjtt_word_di_Copy_0",
					type = "sprite",
					scaleX = -1,
					x = -405.859,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_word_di.png"
					}
				},
				{
					y = -36.0001,
					name = "xkjtt_word_02jf",
					type = "sprite",
					x = -404.715,
					pic = {
						path = "res/ui/nationTask/expand/xkjtt_word_02jf.png"
					}
				}
			}
		},
		{
			y = 0,
			name = "rewardList1",
			x = 0,
			type = "node"
		},
		{
			y = 0,
			name = "rewardList2",
			x = 0,
			type = "node"
		},
		{
			y = 84.9999,
			name = "xkjtt_word_gcdjf",
			type = "sprite",
			x = -282.0001,
			pic = {
				path = "res/ui/nationTask/expand/xkjtt_word_gcdjf.png"
			}
		},
		{
			fontSize = 24,
			name = "indivInfoLb",
			y = 90,
			type = "label",
			x = 100
		},
		{
			fontSize = 24,
			name = "indivIndexLb",
			y = 90,
			type = "label",
			x = 340
		},
		{
			type = "sprite",
			name = "indiv_finish",
			x = 180,
			visible = false,
			y = 10,
			pic = {
				path = "res/ui/nationTask/newPic/gzzl_word_ywcsyrw.png"
			}
		},
		{
			type = "sprite",
			name = "noReward",
			y = -142,
			visible = false,
			x = 120,
			pic = {
				frame = true,
				path = "nationZanwujianli.png"
			}
		},
		{
			y = -144,
			name = "resultSp",
			scale = 0.5,
			type = "sprite",
			x = 244,
			pic = {
				path = "res/ui/nationTask/arena/ltzbs_word_sl.png"
			}
		}
	}
}

local var_0_2 = {
	[1905] = "res/ui/weapon/diamondShop/bssh_icon_bssq.png",
	[10] = "res/ui/task/get_icon_exp.png",
	[4] = "res/ui/task/get_icon_iron.png",
	[17] = "res/ui/task/get_icon_gem.png",
	[237] = "res/ui/task/get_icon_gemjs.png",
	[216] = "res/ui/weapon/machine/zc_yt_icon.png",
	[21] = "res/ui/task/get_icon_silk.png"
}
local var_0_3 = {
	[1901] = 1901,
	[4] = 4,
	[1903] = 1903,
	[17] = 7,
	[1905] = 1905,
	[21] = 55,
	[1904] = 1904,
	[10] = 6,
	[237] = 237,
	[1902] = 1902,
	[216] = 216
}
local var_0_4

function var_0_0.ctor(arg_2_0, arg_2_1)
	log.info("@@ 新开疆拓土")

	arg_2_0.view = {}

	uiutil.initWidgets(arg_2_0.view, arg_2_0.layout)
	arg_2_0:addChild(arg_2_0.view.widgets.root)

	var_0_4 = user.NationData

	arg_2_0:resetVisible()
	arg_2_0:nationDataUpdate()
end

function var_0_0.nationDataUpdate(arg_3_0)
	local var_3_0 = var_0_4.expandTaskVo

	arg_3_0.view.widgets.nationLb1:setString(user.forceIdToName[1])
	arg_3_0.view.widgets.nationLb2:setString(user.forceIdToName[2])
	arg_3_0.view.widgets.nationLb3:setString(user.forceIdToName[3])
	arg_3_0.view.widgets["map" .. user.player.forceId]:setVisible(true)

	for iter_3_0, iter_3_1 in pairs(var_3_0.nationRanks) do
		arg_3_0.view.widgets["score" .. iter_3_1.nation]:setString(iter_3_1.num)
	end

	if var_3_0.rewards then
		for iter_3_2, iter_3_3 in pairs(var_3_0.rewards) do
			local var_3_1 = tool.spriteByName("jianglikuang1.png")

			var_3_1:setPosition(ccp(-70 + iter_3_2 * 90, -140))
			arg_3_0.view.widgets.rewardList1:addChild(var_3_1, 200)

			local var_3_2 = var_0_2[iter_3_3.type] or ""
			local var_3_3 = CCSprite:create(var_3_2)

			var_3_3:setPosition(ccp(40, 40))
			var_3_1:addChild(var_3_3, 10)

			local var_3_4 = CCLabelTTF:create(iter_3_3.value, "Thonburi", 22)

			var_3_4:setPosition(ccp(40, 20))
			var_3_1:addChild(var_3_4, 20)
		end
	end

	if var_3_0.extraRewards then
		local var_3_5 = #var_3_0.rewards

		for iter_3_4, iter_3_5 in pairs(var_3_0.extraRewards) do
			local var_3_6 = tool.spriteByName("jianglikuang1.png")

			var_3_6:setPosition(ccp(-70 + (var_3_5 + iter_3_4) * 90, -140))
			arg_3_0.view.widgets.rewardList1:addChild(var_3_6, 200)

			local var_3_7 = var_0_2[iter_3_5.type] or ""
			local var_3_8 = CCSprite:create(var_3_7)

			var_3_8:setPosition(ccp(40, 40))
			var_3_6:addChild(var_3_8, 10)

			local var_3_9 = CCLabelTTF:create(iter_3_5.value, "Thonburi", 22)

			var_3_9:setPosition(ccp(40, 20))
			var_3_6:addChild(var_3_9, 20)

			local var_3_10

			if var_3_0.leagueForce and var_3_0.leagueForce > 0 then
				var_3_10 = CCSprite:create("res/ui/nationTask/attdefzhiyuanling/gsrw_tmjb.png")

				var_3_10:setPosition(ccp(39, 39))
			else
				var_3_10 = tool.spriteByName("nation_task_win_icon.png")

				var_3_10:setPosition(ccp(23, 54))
			end

			var_3_6:addChild(var_3_10, 30)

			if not var_3_0.hasExtra then
				tool.spriteToGray(var_3_6, true)
			end
		end
	end

	if var_3_0.indivTasks and var_3_0.indivTasks[1] and var_3_0.indivTasks[1].rewards then
		for iter_3_6, iter_3_7 in pairs(var_3_0.indivTasks[1].rewards) do
			local var_3_11 = tool.spriteByName("jianglikuang1.png")

			var_3_11:setPosition(ccp(-70 + iter_3_6 * 90, 10))
			arg_3_0.view.widgets.rewardList2:addChild(var_3_11, 200)

			local var_3_12 = var_0_2[iter_3_7.rewardType] or ""
			local var_3_13 = CCSprite:create(var_3_12)

			var_3_13:setPosition(ccp(40, 40))
			var_3_11:addChild(var_3_13, 10)

			local var_3_14 = CCLabelTTF:create(iter_3_7.rewardNum, "Thonburi", 22)

			var_3_14:setPosition(ccp(40, 20))
			var_3_11:addChild(var_3_14, 20)
		end
	end

	if var_3_0.indivTasks and var_3_0.indivTasks[1] then
		var_3_0.indivCanGetReward = var_3_0.indivTasks[1].process >= var_3_0.indivTasks[1].goal
		var_3_0.indivIsReward = var_3_0.indivTasks[1].hasRewarded

		arg_3_0.view.widgets.indivInfoLb:setString(language.get(215315, var_3_0.indivTasks[1].process, var_3_0.indivTasks[1].goal))
		arg_3_0.view.widgets.indivIndexLb:setString(language.get(215313, var_3_0.indivTasks[1].taskIndex, var_3_0.indivTasks[1].taskTotalIndex))
	end

	if var_3_0.indivCanGetReward and not var_3_0.indivIsReward then
		arg_3_0.view.widgets.getInvBtn:setVisible(true)
	else
		arg_3_0.view.widgets.getInvBtn:setVisible(false)
	end

	showTable(var_3_0)

	if var_3_0.canGetReward and var_3_0.isRewarded and var_3_0.isRewarded == 0 then
		arg_3_0.view.widgets.getBtn:setVisible(true)
	else
		arg_3_0.view.widgets.getBtn:setVisible(false)
	end

	if var_3_0.indivTasks and var_3_0.indivTasks[1] then
		if var_3_0.indivTasks[1].taskIndex >= var_3_0.indivTasks[1].taskTotalIndex and var_3_0.indivIsReward then
			arg_3_0.view.widgets.indivInfoLb:setString("")
			arg_3_0.view.widgets.indivIndexLb:setString("")
			arg_3_0.view.widgets.indiv_finish:setVisible(true)
			pcall(arg_3_0.view.widgets.rewardList2.removeAllChildrenWithCleanup, arg_3_0.view.widgets.rewardList2, true)
		else
			arg_3_0.view.widgets.indiv_finish:setVisible(false)
		end
	end

	if var_3_0.taskState == 0 then
		arg_3_0.view.widgets.resultSp:setVisible(false)
	else
		arg_3_0.view.widgets.resultSp:setVisible(true)

		if var_3_0.taskState == 2 then
			arg_3_0.view.widgets.resultSp:setDisplayFrame(CCSprite:create("res/ui/nationTask/arena/ltzbs_word_sl.png"):displayFrame())
		else
			arg_3_0.view.widgets.resultSp:setDisplayFrame(CCSprite:create("res/ui/nationTask/arena/ltzbs_word_sb.png"):displayFrame())
		end
	end

	local var_3_15 = not var_3_0.rewards or not (#var_3_0.rewards > 0)

	arg_3_0.view.widgets.noReward:setVisible(var_3_15)

	if var_3_15 then
		pcall(arg_3_0.view.widgets.rewardList1.removeAllChildrenWithCleanup, arg_3_0.view.widgets.rewardList1, true)
	end

	if var_3_0.deadTime and var_3_0.deadTime > 0 then
		if arg_3_0.nationFightTime == nil then
			local function var_3_16()
				if arg_3_0.nationFightTime then
					pcall(arg_3_0.nationFightTime.removeFromParentAndCleanup, arg_3_0.nationFightTime, true)

					arg_3_0.nationFightTime = nil
				end
			end

			local function var_3_17(arg_5_0)
				return
			end

			arg_3_0.nationFightTime = createTimerLabel(var_3_0.deadTime, "@H:@M:@S" .. language.get(215314), "Thonburi-Bold", 24, var_3_16, nil, nil, colorTips.red, var_3_17)

			arg_3_0.nationFightTime:setPosition(ccp(-282, -215))
			arg_3_0.view.widgets.root:addChild(arg_3_0.nationFightTime)
		else
			arg_3_0.nationFightTime:setTime(var_3_0.deadTime)
		end
	end
end

function var_0_0.resetVisible(arg_6_0)
	arg_6_0.view.widgets.indivInfoLb:setString("")
	arg_6_0.view.widgets.indivIndexLb:setString("")
	arg_6_0.view.widgets.resultSp:setVisible(false)
	arg_6_0.view.widgets.getBtn:setVisible(false)
	arg_6_0.view.widgets.getInvBtn:setVisible(false)
	arg_6_0.view.widgets.map1:setVisible(false)
	arg_6_0.view.widgets.map2:setVisible(false)
	arg_6_0.view.widgets.map3:setVisible(false)
	pcall(arg_6_0.view.widgets.rewardList1.removeAllChildrenWithCleanup, arg_6_0.view.widgets.rewardList1, true)
	pcall(arg_6_0.view.widgets.rewardList2.removeAllChildrenWithCleanup, arg_6_0.view.widgets.rewardList2, true)

	if arg_6_0.nationFightTime then
		pcall(arg_6_0.nationFightTime.removeFromParentAndCleanup, arg_6_0.nationFightTime, true)

		arg_6_0.nationFightTime = nil
	end
end

function var_0_0.getInvBtnHandel(arg_7_0)
	local var_7_0 = var_0_4.expandTaskVo

	local function var_7_1(arg_8_0)
		local var_8_0 = {}

		for iter_8_0, iter_8_1 in ipairs(var_7_0.indivTasks[1].rewards) do
			local var_8_1 = {
				id = var_0_3[iter_8_1.rewardType or iter_8_1.type],
				value = iter_8_1.value or iter_8_1.rewardNum
			}

			table.insert(var_8_0, var_8_1)
		end

		globalAction_gotResource(var_8_0)
		arg_7_0:refreshNationTask()
		eventManager.dispatchEvent("nationTaskDidChanged")
	end

	if var_7_0 and var_7_0.indivTasks and var_7_0.indivTasks[1] then
		cmgr.sendRequest(var_7_1, actions.getIndivReward, var_7_0.indivTasks[1].id)
	end
end

function var_0_0.getBtnHandel(arg_9_0)
	local function var_9_0(arg_10_0)
		local var_10_0 = arg_10_0.action.data

		log.info("开疆扩土领奖@@@")
		showTable(var_10_0)

		local var_10_1 = {}

		for iter_10_0, iter_10_1 in pairs(var_10_0.rewards) do
			if var_0_3[iter_10_1.type] then
				local var_10_2 = {
					id = var_0_3[iter_10_1.type],
					value = iter_10_1.num or iter_10_1.value
				}

				table.insert(var_10_1, var_10_2)
			end
		end

		if var_10_0.hasExtra then
			for iter_10_2, iter_10_3 in pairs(var_10_0.extraRewards) do
				if var_0_3[iter_10_3.type] then
					local var_10_3 = {
						id = var_0_3[iter_10_3.type],
						value = iter_10_3.num or iter_10_3.value
					}

					table.insert(var_10_1, var_10_3)
				end
			end
		end

		if var_10_0.indivRewards then
			for iter_10_4, iter_10_5 in pairs(var_10_0.indivRewards) do
				if var_0_3[iter_10_5.type] then
					local var_10_4 = {
						id = var_0_3[iter_10_5.type],
						value = iter_10_5.num or iter_10_5.value
					}

					table.insert(var_10_1, var_10_4)
				end
			end
		end

		if var_10_0.predicateExtraRewards then
			for iter_10_6, iter_10_7 in pairs(var_10_0.predicateExtraRewards) do
				if var_0_3[iter_10_7.type] then
					local var_10_5 = {
						id = var_0_3[iter_10_7.type],
						value = iter_10_7.num or iter_10_7.value
					}

					table.insert(var_10_1, var_10_5)
				end
			end
		end

		globalAction_gotResource(var_10_1)
		arg_9_0:refreshNationTask()
	end

	if var_0_4 and var_0_4.expandTaskVo then
		cmgr.sendRequest(var_9_0, actions.getNationTaskReward, var_0_4.expandTaskVo.taskId)
	end
end

function var_0_0.refreshNationTask(arg_11_0)
	local function var_11_0(arg_12_0)
		local var_12_0 = arg_12_0.action.data

		log.info("ExpandTaskView refreshNationTask@@")
		showTable(var_12_0)

		if var_12_0.tasks and var_12_0.tasks[1] then
			var_0_4.expandTaskVo = var_12_0.tasks[1]

			arg_11_0:nationDataUpdate()
		end
	end

	cmgr.sendRequest(var_11_0, actions.getCurRankInfo, 1)
end

function var_0_0.onEnter(arg_13_0)
	arg_13_0.getBtnHandelRef = handler(arg_13_0, arg_13_0.getBtnHandel)
	arg_13_0.getInvBtnHandelRef = handler(arg_13_0, arg_13_0.getInvBtnHandel)
	arg_13_0.expandTaskUpdateRf = handler(arg_13_0, arg_13_0.refreshNationTask)

	arg_13_0.view.widgets.getBtn:addHandleOfControlEvent(arg_13_0.getBtnHandelRef, CCControlEventTouchUpInside)
	arg_13_0.view.widgets.getInvBtn:addHandleOfControlEvent(arg_13_0.getInvBtnHandelRef, CCControlEventTouchUpInside)
	eventManager.registerEvent("expandTaskUpdate", arg_13_0.expandTaskUpdateRf)
end

function var_0_0.onExit(arg_14_0)
	eventManager.unregisterEvent("expandTaskUpdate", arg_14_0.expandTaskUpdateRf)
end

return var_0_0
