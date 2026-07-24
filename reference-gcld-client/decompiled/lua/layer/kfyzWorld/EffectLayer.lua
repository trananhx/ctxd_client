local var_0_0 = {
	123,
	19,
	207,
	105,
	4012,
	6001,
	6046,
	[1003] = 113,
	[1001] = 188,
	[1002] = 34,
	[6002] = 105
}
local var_0_1 = {
	"222810_yuanzheng",
	"222810_yuanzheng",
	"222810_yuanzheng",
	"222814_yuanzheng",
	"222422_dongying",
	136822,
	"222422_dongying",
	[1003] = "222813_yuanzheng",
	[1001] = "222811_yuanzheng",
	[1002] = "222812_yuanzheng",
	[6002] = "222814_yuanzheng"
}
local var_0_2 = {
	123,
	19,
	207,
	[6002] = 105
}
local var_0_3 = {
	390512,
	390513,
	390514,
	[6002] = 390515
}

local function var_0_4(arg_1_0, arg_1_1)
	local var_1_0 = CCArray:create()

	for iter_1_0 = 1, arg_1_1 do
		local var_1_1 = CCSprite:createWithSpriteFrameName(string.format(arg_1_0, iter_1_0))

		var_1_0:addObject(var_1_1:displayFrame())
	end

	local var_1_2 = CCAnimation:createWithSpriteFrames(var_1_0, 0.1)

	return (CCAnimate:create(var_1_2))
end

local var_0_5 = class("KfEffectLayer", function()
	return createBaseLayer()
end)

local function var_0_6(arg_3_0)
	local var_3_0 = arg_3_0 <= 3 and "kfyz_world_pb_def.png" or "kfyz_world_pb_att.png"

	if user.jpsIndex ~= 0 and arg_3_0 == 5 then
		var_3_0 = "kfyz_world_pb_def.png"

		if user.isKflq then
			var_3_0 = "yzlq_world_icon_liu.png"
		elseif user.isKfnz then
			var_3_0 = "yznz_word_icon_nan.png"
		end
	end

	if arg_3_0 == 6 then
		var_3_0 = "kfyz_world_pb_def.png"
	end

	local var_3_1 = {
		"zymz_pb_wei.png",
		"zymz_pb_shu.png",
		"zymz_pb_wu.png",
		"zymz_pb_zheng.png",
		"zymz_pb_zheng.png",
		"zymz_pb_zheng.png",
		"zymz_pb_zheng.png"
	}

	var_3_1[1001] = "zymz_pb_zheng.png"
	var_3_1[1002] = "zymz_pb_zheng.png"
	var_3_1[1003] = "zymz_pb_zheng.png"

	if user.isSoldiersThreeRoad and user.player.kfgzForceId == arg_3_0 then
		var_3_0 = "bfslyz_icon_" .. tonumber(arg_3_0 - 1000) .. ".png"
	end

	local var_3_2 = var_3_1[arg_3_0]
	local var_3_3 = arg_3_0 <= 3 and "kfyz_word_gpjw.png" or "kfyz_word_yzsl.png"

	if user.jpsIndex > 0 or user.kfmgState == 2 or user.kfmgState == 3 then
		var_3_3 = "kfyz_word_gpjw.png"
	end

	local var_3_4 = {
		y = -500,
		type = "sprite",
		x = 0,
		name = "icon" .. arg_3_0,
		pic = {
			path = "res/ui/kfyz/" .. var_3_0
		},
		children = {
			{
				type = "sprite",
				y = 32,
				visible = false,
				x = 255,
				name = "icon_juma" .. arg_3_0,
				pic = {
					path = "res/ui/kfyz/kfyz_icon_jml.png"
				}
			},
			{
				visible = false,
				x = -14,
				type = "sprite",
				zorder = -1,
				y = 26,
				scale = 0.8,
				name = "bg_tally" .. arg_3_0,
				pic = {
					path = "res/ui/kfyz/kfyz_fu_bg.png"
				},
				children = {
					{
						x = 74,
						y = 35,
						type = "sprite",
						scale = 0.8,
						name = "tally" .. arg_3_0,
						pic = {
							path = "res/ui/kfyz/wait/icon_hf1.png"
						}
					}
				}
			},
			{
				y = 40,
				type = "progressbar",
				zorder = -1,
				visible = false,
				x = 46,
				name = "bar" .. arg_3_0 .. 1,
				anchorPoint = ccp(0, 0.5),
				pic = {
					path = "res/ui/kfyz/kfyz_world_pb.png"
				},
				children = {
					{
						h = 60,
						type = "button",
						w = 190,
						y = -25,
						x = 0,
						name = "btn_tip" .. arg_3_0,
						normal = {
							path = "res/default.png"
						},
						touched = {
							path = "res/default.png"
						},
						anchorPoint = ccp(0, 0)
					},
					{
						y = -9,
						type = "sprite",
						x = -4,
						anchorPoint = ccp(0, 0.5),
						pic = {
							path = "res/ui/world/manzu/zymz_pb_bg.png"
						}
					},
					{
						y = -9,
						type = "progressbar",
						x = -4,
						name = "bar" .. arg_3_0 .. 2,
						anchorPoint = ccp(0, 0.5),
						pic = {
							path = "res/ui/kfyz/" .. var_3_2
						}
					},
					{
						type = "sprite",
						y = 5.0001,
						visible = false,
						x = 35,
						name = "army" .. arg_3_0 .. 1,
						pic = {
							path = "res/ui/kfyz/kfyz_icon_yu.png"
						}
					},
					{
						type = "sprite",
						y = 5,
						visible = false,
						x = 93,
						name = "army" .. arg_3_0 .. 2,
						pic = {
							path = "res/ui/kfyz/kfyz_icon_min.png"
						}
					},
					{
						fontSize = 18,
						y = 15,
						type = "label",
						visible = false,
						x = 10,
						name = "words" .. arg_3_0,
						anchorPoint = ccp(0, 0.5),
						color = ccc3(0, 255, 0),
						text = language.get("222422_dongying")
					}
				}
			},
			{
				type = "sprite",
				y = 26,
				visible = false,
				x = 120,
				zorder = -1,
				name = "bg_fail" .. arg_3_0,
				pic = {
					path = "res/ui/kfyz/kfyz_word_bg.png"
				},
				children = {
					{
						y = 32,
						x = 135,
						type = "sprite",
						pic = {
							path = "res/ui/kfyz/" .. var_3_3
						}
					}
				}
			}
		}
	}

	if arg_3_0 <= 3 or arg_3_0 == 6 then
		table.insert(var_3_4.children, {
			fontSize = 25,
			y = 31,
			type = "label",
			x = 30,
			name = "nationName" .. arg_3_0,
			color = colorForce[arg_3_0]
		})
	end

	if user.jpsIndex ~= 0 and arg_3_0 == 5 then
		local var_3_5

		if user.isKfdy then
			var_3_5 = "222416_dongying"
		elseif user.isKfgl then
			var_3_5 = 136566
		end

		table.insert(var_3_4.children, {
			fontSize = 25,
			y = 31,
			type = "label",
			x = 30,
			textId = var_3_5,
			name = "nationName" .. arg_3_0,
			color = colorQuality[6]
		})
	end

	return var_3_4
end

var_0_5.layout = {
	y = 0,
	name = "panel",
	type = "node",
	x = 0,
	children = {
		var_0_6(1),
		var_0_6(2),
		var_0_6(3),
		var_0_6(4),
		var_0_6(5),
		var_0_6(6),
		var_0_6(7),
		var_0_6(1001),
		var_0_6(1002),
		var_0_6(1003),
		{
			type = "node",
			name = "node_army",
			y = 0,
			visible = false,
			x = 0,
			children = {
				{
					w = 110,
					name = "btn_att1",
					h = 112,
					type = "button",
					y = -500,
					x = 0,
					normal = {
						path = "res/ui/kfyz/kfyz_btn_zj.png"
					},
					touched = {
						path = "res/ui/kfyz/kfyz_btn_zj_c.png"
					}
				},
				{
					w = 110,
					name = "btn_att2",
					h = 112,
					type = "button",
					y = -500,
					x = 0,
					normal = {
						path = "res/ui/kfyz/kfyz_btn_zj.png"
					},
					touched = {
						path = "res/ui/kfyz/kfyz_btn_zj_c.png"
					}
				},
				{
					w = 110,
					name = "btn_att3",
					h = 112,
					type = "button",
					y = -500,
					x = 0,
					normal = {
						path = "res/ui/kfyz/kfyz_btn_zj.png"
					},
					touched = {
						path = "res/ui/kfyz/kfyz_btn_zj_c.png"
					}
				}
			}
		}
	}
}
var_0_5.tipFrame = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(0, 0),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			height = 0,
			name = "tipMsg",
			type = "label",
			style = "label_warlock",
			width = 400,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = color_whi
		}
	}
}

function var_0_5.updateForceInfo(arg_4_0, arg_4_1)
	if not arg_4_1 then
		return
	end

	if arg_4_1.endurances then
		for iter_4_0, iter_4_1 in pairs(arg_4_1.endurances) do
			for iter_4_2 = 1, #arg_4_0.task.endurances do
				if iter_4_1.forceId == arg_4_0.task.endurances[iter_4_2].forceId then
					arg_4_0.task.endurances[iter_4_2].tally = iter_4_1.tally
					arg_4_0.task.endurances[iter_4_2].endurance = iter_4_1.endurance
					arg_4_0.task.endurances[iter_4_2].enduranceState = iter_4_1.enduranceState
					needRefresh = true
				end
			end
		end
	end

	if arg_4_1.jmlLastTimes then
		for iter_4_3, iter_4_4 in pairs(arg_4_1.jmlLastTimes) do
			for iter_4_5 = 1, #arg_4_0.task.jmlLastTimes do
				if iter_4_4.forceId == arg_4_0.task.jmlLastTimes[iter_4_5].forceId then
					arg_4_0.task.jmlLastTimes[iter_4_5].jmlLastTime = iter_4_4.jmlLastTime
					needRefresh = true
				end
			end
		end
	end

	if arg_4_1.forceNums then
		for iter_4_6, iter_4_7 in pairs(arg_4_1.forceNums) do
			for iter_4_8 = 1, #arg_4_0.task.forceNums do
				if iter_4_7.forceId == arg_4_0.task.forceNums[iter_4_8].forceId and arg_4_0.task.forceNums[iter_4_8].forceNum ~= iter_4_7.forceNum then
					arg_4_0.task.forceNums[iter_4_8].forceNum = iter_4_7.forceNum
					needRefresh = true
				end
			end
		end
	end

	if user.kfmgState == 2 or user.kfmgState == 3 then
		arg_4_0.task = arg_4_1

		arg_4_0:showPanelKfmg(arg_4_0.task)
		arg_4_0.world.thumbnail:handlerGetSTaskInfoAction({
			data = arg_4_0.task
		})
	end

	if needRefresh then
		arg_4_0:showPanel(arg_4_0.task)
		arg_4_0.world.thumbnail:handlerGetSTaskInfoAction({
			data = arg_4_0.task
		})
	end
end

function var_0_5.handlerGetSTaskInfoAction(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1.data

	if user.kfmgState == 2 or user.kfmgState == 3 then
		arg_5_0:showPanelKfmg(var_5_0)
	else
		arg_5_0:showPanel(var_5_0)
	end
end

function var_0_5.onBtnAttTap(arg_6_0, arg_6_1)
	local function var_6_0(arg_7_0)
		arg_6_0:showEffectGongCheng(arg_6_1, arg_7_0.data.effect)
	end

	messageBox.showChargeWin("", language.get(390539), "armybase", function()
		eventManager.dispatchEvent("armyBaseSetVisible", false)
		kfcmgr.sendRequest(var_6_0, actions.kfyzUseArmyBaseInfo, 1, arg_6_1)
	end)
end

function var_0_5.setStateWait(arg_9_0, arg_9_1)
	if arg_9_1 then
		for iter_9_0 = 1, 4 do
			local var_9_0 = arg_9_0.view.widgets["bar" .. iter_9_0 .. 1]

			var_9_0:setVisible(true)
			var_9_0:setPercentage(100)
			arg_9_0.view.widgets["bar" .. iter_9_0 .. 2]:setPercentage(100)
		end
	end
end

function var_0_5.showPanelKfmg(arg_10_0, arg_10_1)
	log.info("EffectLayer:showPanelKfmg")
	showTable(arg_10_1)

	for iter_10_0 = 1, 4 do
		local var_10_0 = arg_10_1["enduranceState" .. iter_10_0]

		if var_10_0 and var_10_0 >= 2 then
			arg_10_0.world.mapLayer:changeCity({
				cityState = 1,
				id = var_0_0[iter_10_0]
			})
		end

		local var_10_1 = arg_10_1["endurance" .. iter_10_0] or 100
		local var_10_2 = var_10_1 == 0
		local var_10_3 = arg_10_0.view.widgets["bar" .. iter_10_0 .. 1]

		arg_10_0.view.widgets["bg_fail" .. iter_10_0]:setVisible(var_10_2)
		var_10_3:setVisible(not var_10_2)

		if not var_10_2 then
			var_10_3:setPercentage(var_10_1)
			arg_10_0.view.widgets["bar" .. iter_10_0 .. 2]:setPercentage(var_10_1)

			local var_10_4 = var_10_1 > 20 and var_10_1 <= 50
			local var_10_5 = var_10_1 > 50

			if user.jpsIndex > 0 then
				var_10_4 = false
				var_10_5 = false
			end

			arg_10_0.view.widgets["army" .. iter_10_0 .. 1]:setVisible(var_10_4)
			arg_10_0.view.widgets["army" .. iter_10_0 .. 2]:setVisible(var_10_5)
		else
			log.info("nothing")
		end

		local var_10_6 = rmgr.setTallyPic(arg_10_1["tally" .. iter_10_0], arg_10_0.view.widgets["tally" .. iter_10_0])

		arg_10_0.view.widgets["bg_tally" .. iter_10_0]:setVisible(var_10_6)

		local var_10_7 = arg_10_1["jmlLastTime" .. iter_10_0] or 0
		local var_10_8 = var_10_7 and var_10_7 > 0
		local var_10_9 = arg_10_0.view.widgets["icon_juma" .. iter_10_0]

		var_10_9:removeAllChildrenWithCleanup(true)
		var_10_9:setVisible(var_10_8)

		if var_10_8 then
			local var_10_10 = createTimerLabel(var_10_7, "@M:@S", "Thonburi", 20, function()
				var_10_9:setVisible(false)

				jmlLastTime.jmlLastTime = 0
			end, nil, nil, colorTips.red)

			var_10_10:setPosition(ccp(20, 0))
			var_10_9:addChild(var_10_10)
		end
	end
end

function var_0_5.showPanel(arg_12_0, arg_12_1)
	arg_12_0.task = arg_12_1

	local var_12_0

	var_12_0 = arg_12_1.attType == 1

	for iter_12_0, iter_12_1 in pairs(arg_12_0.task.endurances) do
		local var_12_1 = 0

		if iter_12_1.forceId == 1 or iter_12_1.forceId == 2 or iter_12_1.forceId == 3 then
			var_12_1 = iter_12_1.forceId
		elseif user.kfyzWorldId ~= 9 and iter_12_1.forceId > 1000 then
			var_12_1 = 4
		elseif user.kfyzWorldId == 9 then
			var_12_1 = iter_12_1.forceId
		end

		if iter_12_1.tally and iter_12_1.tally >= 1 and iter_12_1.tally <= 4 and iter_12_1.talllyWarCd and iter_12_1.talllyWarCd <= 1810000 and iter_12_1.talllyWarCd >= 1790000 then
			if user.player.kfgzForceId > 1000 and user.player.kfgzForceId == iter_12_1.forceId + 1000 then
				roleDialogue.control.loadSpeak(2340)
			end

			if user.player.kfgzForceId < 1000 and user.player.kfgzForceId == iter_12_1.forceId then
				roleDialogue.control.loadSpeak(2350)
			end
		end

		local var_12_2 = var_12_1

		if user.jpsIndex ~= 0 and var_12_1 == 1 then
			var_12_2 = 5
		end

		if var_12_1 > 0 and (user.jpsIndex == 0 or var_12_1 == 1) then
			local var_12_3 = iter_12_1.enduranceState

			if var_12_3 and var_12_3 >= 2 then
				arg_12_0.world.mapLayer:changeCity({
					cityState = 1,
					id = var_0_0[var_12_2]
				})
			end

			local var_12_4 = iter_12_1.endurance or 100
			local var_12_5 = var_12_4 == 0
			local var_12_6 = arg_12_0.view.widgets["bar" .. var_12_2 .. 1]

			arg_12_0.view.widgets["bg_fail" .. var_12_2]:setVisible(var_12_5)
			var_12_6:setVisible(not var_12_5)

			if not var_12_5 then
				var_12_6:setPercentage(var_12_4)
				arg_12_0.view.widgets["bar" .. var_12_2 .. 2]:setPercentage(var_12_4)

				local var_12_7 = var_12_4 > 20 and var_12_4 <= 50
				local var_12_8 = var_12_4 > 50

				if user.jpsIndex > 0 then
					var_12_7 = false
					var_12_8 = false
				end

				arg_12_0.view.widgets["words" .. var_12_2]:setVisible(true)

				if user.isKflq then
					arg_12_0.view.widgets["words" .. var_12_2]:setString(language.get(215610))
				elseif user.isKfnz then
					arg_12_0.view.widgets["words" .. var_12_2]:setString(language.get(218005))
				else
					arg_12_0.view.widgets["words" .. var_12_2]:setString(language.get(var_0_1[var_12_2]))
				end

				if user.isSoldiersThreeRoad and user.player.kfgzForceId == var_12_1 then
					arg_12_0.view.widgets["words" .. var_12_2]:setVisible(false)
				end

				if var_12_2 <= 3 and var_12_2 >= 1 then
					for iter_12_2, iter_12_3 in pairs(arg_12_0.task.forceNums) do
						if iter_12_3.forceId == iter_12_1.forceId then
							arg_12_0.view.widgets["words" .. var_12_2]:setString(language.get("222815_yuanzheng", iter_12_3.forceNum))
						end
					end
				end

				arg_12_0.view.widgets["army" .. var_12_2 .. 1]:setVisible(var_12_7)
				arg_12_0.view.widgets["army" .. var_12_2 .. 2]:setVisible(var_12_8)
			elseif user.jpsIndex ~= 0 then
				arg_12_0.world.mapLayer:changeCity({
					cityState = 1,
					ruined = true,
					force = 4,
					id = var_0_0[5]
				})
			end

			local var_12_9 = rmgr.setTallyPic(iter_12_1.tally, arg_12_0.view.widgets["tally" .. var_12_2])

			arg_12_0.view.widgets["bg_tally" .. var_12_2]:setVisible(var_12_9)

			if iter_12_1.tally >= 1 and iter_12_1.tally <= 4 and iter_12_1.talllyWarCd and iter_12_1.talllyWarCd > 0 then
				local function var_12_10()
					if arg_12_0.view.widgets["bg_tally" .. var_12_2] then
						arg_12_0.view.widgets["bg_tally" .. var_12_2]:removeChildByTag(123, true)
					end
				end

				local var_12_11 = createTimerLabel(iter_12_1.talllyWarCd, "@M:@S", "Thonburi", 24, var_12_10, nil, nil, colorTips.red)

				var_12_11:setPosition(ccp(65, 15))
				arg_12_0.view.widgets["bg_tally" .. var_12_2]:removeChildByTag(123, true)
				arg_12_0.view.widgets["bg_tally" .. var_12_2]:addChild(var_12_11, 0, 123)
			end
		end

		if user.isKfyn then
			local var_12_12 = iter_12_1.endurance or 100

			arg_12_0:updateYnHp(var_12_12, iter_12_1.forceId)
		end
	end

	for iter_12_4, iter_12_5 in pairs(arg_12_0.task.jmlLastTimes) do
		local var_12_13 = 0

		if iter_12_5.forceId == 1 or iter_12_5.forceId == 2 or iter_12_5.forceId == 3 then
			var_12_13 = iter_12_5.forceId
		elseif user.kfyzWorldId ~= 9 and iter_12_5.forceId > 1000 then
			var_12_13 = 4
		elseif user.kfyzWorldId == 9 then
			var_12_13 = iter_12_5.forceId
		end

		local var_12_14 = var_12_13

		if user.jpsIndex ~= 0 and var_12_13 == 1 then
			var_12_14 = 5
		end

		if var_12_13 > 0 and (user.jpsIndex == 0 or var_12_13 == 1) then
			local var_12_15 = iter_12_5.jmlLastTime or 0
			local var_12_16 = var_12_15 and var_12_15 > 0
			local var_12_17 = arg_12_0.view.widgets["icon_juma" .. var_12_14]

			var_12_17:removeAllChildrenWithCleanup(true)
			var_12_17:setVisible(var_12_16)

			if var_12_16 then
				local var_12_18 = createTimerLabel(var_12_15, "@M:@S", "Thonburi", 20, function()
					var_12_17:setVisible(false)

					iter_12_5.jmlLastTime = 0
				end, nil, nil, colorTips.red)

				var_12_18:setPosition(ccp(20, 0))
				var_12_17:addChild(var_12_18)
			end
		end
	end
end

function var_0_5.ctor(arg_15_0, arg_15_1, arg_15_2)
	if user.isKfdy then
		var_0_0[5] = 4012
	elseif user.isKfgl then
		var_0_0[5] = 5046
	elseif user.isKfyn then
		-- block empty
	elseif user.isKflq then
		var_0_0[5] = 7001
	elseif user.isKfnz then
		var_0_0[5] = 8050
	end

	arg_15_0.view = {}
	arg_15_0.view.widgets = {}

	uiutil.initUIComponent(arg_15_0, arg_15_0.view.widgets, arg_15_0.layout)

	arg_15_0.world = arg_15_1
	arg_15_0.mapLayer = arg_15_2
	arg_15_0.effectTable = {}
	arg_15_0.arrowTable = {}

	arg_15_0:registerScriptTouchHandler(function(arg_16_0, arg_16_1, arg_16_2)
		return arg_15_0:onTouch(arg_16_0, arg_16_1, arg_16_2)
	end)
	arg_15_0:setTouchEnabled(true)

	for iter_15_0, iter_15_1 in pairs(var_0_0) do
		local var_15_0 = arg_15_0.mapLayer.cityTable[iter_15_1]

		if var_15_0 and iter_15_0 ~= 6002 then
			local var_15_1, var_15_2 = var_15_0.sprite:getPosition()

			arg_15_0.view.widgets["icon" .. iter_15_0]:setPosition(ccp(var_15_1 - 90, var_15_2 + 100))

			if user.isSoldiersThreeRoad and user.invastType == 1 then
				arg_15_0.view.widgets["icon" .. iter_15_0]:setVisible(false)

				if iter_15_0 > 1000 then
					if iter_15_0 == user.player.kfgzForceId then
						arg_15_0.view.widgets["icon" .. iter_15_0]:setVisible(true)
					end
				elseif iter_15_0 == tonumber(user.player.kfgzForceId - 1000) then
					arg_15_0.view.widgets["icon" .. iter_15_0]:setVisible(true)
				end
			elseif user.kfyzWorldId == 9 and iter_15_0 == 4 then
				arg_15_0.view.widgets["icon" .. iter_15_0]:setVisible(false)
			elseif user.kfyzWorldId ~= 9 and iter_15_0 > 1000 then
				arg_15_0.view.widgets["icon" .. iter_15_0]:setVisible(false)
			elseif iter_15_0 == 6 or iter_15_0 == 7 then
				arg_15_0.view.widgets["icon" .. iter_15_0]:setVisible(true)
			end

			if user.kfmgState == 2 or user.kfmgState == 3 then
				-- block empty
			elseif iter_15_0 <= 3 then
				arg_15_0.view.widgets["btn_att" .. iter_15_0]:setPosition(ccp(var_15_1, var_15_2))
				arg_15_0.view.widgets["btn_att" .. iter_15_0]:addHandleOfControlEvent(function()
					arg_15_0:onBtnAttTap(iter_15_0)
				end, CCControlEventTouchUpInside)
			end
		end
	end

	if user.kfmgState == 2 or user.kfmgState == 3 then
		local var_15_3 = {
			123,
			19,
			207
		}
		local var_15_4 = {}

		if user.player.kfForceId == 1 then
			var_15_3 = {
				19,
				207,
				105
			}
			var_15_4 = {
				2,
				3,
				6002
			}
		elseif user.player.kfForceId == 2 then
			var_15_3 = {
				123,
				207,
				105
			}
			var_15_4 = {
				1,
				3,
				6002
			}
		elseif user.player.kfForceId == 3 then
			var_15_3 = {
				123,
				19,
				105
			}
			var_15_4 = {
				1,
				2,
				6002
			}
		end

		for iter_15_2 = 1, 3 do
			local var_15_5 = arg_15_0.mapLayer.cityTable[var_15_3[iter_15_2]]

			if var_15_5 then
				local var_15_6, var_15_7 = var_15_5.sprite:getPosition()

				arg_15_0.view.widgets["btn_att" .. iter_15_2]:setPosition(ccp(var_15_6, var_15_7))
				arg_15_0.view.widgets["btn_att" .. iter_15_2]:addHandleOfControlEvent(function()
					arg_15_0:onBtnAttTap(var_15_4[iter_15_2])
				end, CCControlEventTouchUpInside)
			end
		end
	end

	for iter_15_3 = 1, 4 do
		local var_15_8 = arg_15_0.view.widgets["btn_tip" .. iter_15_3]

		var_15_8:addHandleOfControlEvent(function()
			log.info("show tip")
			arg_15_0:showTip(true, var_15_8, iter_15_3)
		end, CCControlEventTouchDown)
		var_15_8:addHandleOfControlEvent(function()
			log.info("hide tip")
			arg_15_0:showTip(false)
		end, CCControlEventTouchUpInside)
		var_15_8:addHandleOfControlEvent(function()
			log.info("hide tip")
			arg_15_0:showTip(false)
		end, CCControlEventTouchUpOutside)
	end

	if user.isKfyn then
		local var_15_9 = arg_15_0.view.widgets.bar61

		var_15_9:setVisible(true)
		var_15_9:setPercentage(100)
		arg_15_0.view.widgets.bar62:setPercentage(100)
		arg_15_0.view.widgets.words6:setVisible(true)
		arg_15_0.view.widgets.words6:setFontSize(20)
		arg_15_0.view.widgets.words6:setPositionX(92)
		arg_15_0.view.widgets.words6:setAnchorPoint(ccp(0.5, 0.5))
		arg_15_0.view.widgets.words6:setColor(ccc3(0, 255, 0))
		arg_15_0.view.widgets.words6:setString(language.get(var_0_1[6]))
		arg_15_0.view.widgets.nationName6:setColor(colorForce[user.player.forceId])
		arg_15_0.view.widgets.nationName6:setString(user.forceIdToName[user.player.forceId])

		local var_15_10 = arg_15_0.view.widgets.bar71

		var_15_10:setVisible(true)
		var_15_10:setPercentage(100)
		arg_15_0.view.widgets.bar72:setPercentage(100)
		arg_15_0.view.widgets.words7:setVisible(true)
		arg_15_0.view.widgets.words7:setFontSize(20)
		arg_15_0.view.widgets.words7:setPositionX(92)
		arg_15_0.view.widgets.words7:setAnchorPoint(ccp(0.5, 0.5))
		arg_15_0.view.widgets.words7:setColor(ccc3(0, 255, 0))
		arg_15_0.view.widgets.words7:setString(language.get(var_0_1[7]))
	end
end

function var_0_5.updateYnHp(arg_22_0, arg_22_1, arg_22_2)
	if arg_22_2 > 1000 then
		arg_22_0.view.widgets.bar62:setPercentage(arg_22_1)
	else
		arg_22_0.view.widgets.bar72:setPercentage(arg_22_1)
	end
end

function var_0_5.showTip(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	if not arg_23_0.task then
		return
	end

	if arg_23_0.view.widgets.tipFrame then
		arg_23_0.view.widgets.tipFrame:removeFromParentAndCleanup(true)

		arg_23_0.view.widgets.tipFrame = nil
	end

	if arg_23_1 then
		local var_23_0, var_23_1 = tool.getPositionInScreen(arg_23_2)

		uiutil.initWidgets(arg_23_0.view, arg_23_0.tipFrame)
		smgr.rootLayer:addChild(arg_23_0.view.widgets.tipFrame, 60000)
		arg_23_0.view.widgets.tipMsg:setDimensions(CCSizeMake(200, 0))

		local var_23_2 = language.get(390434, arg_23_0.task["endurance" .. arg_23_3])

		arg_23_0.view.widgets.tipMsg:setString(var_23_2)

		local var_23_3 = arg_23_0.view.widgets.tipMsg:getContentSize().width
		local var_23_4 = arg_23_0.view.widgets.tipMsg:getContentSize().height

		arg_23_0.view.widgets.tipFrame:setPreferredSize(CCSizeMake(var_23_3 + 30, var_23_4 + 30))
		arg_23_0.view.widgets.tipFrame:setPosition(ccp(var_23_0, var_23_1 + 50))
		arg_23_0.view.widgets.tipMsg:setPosition(ccp(15, 15))
		arg_23_0.view.widgets.tipFrame:setVisible(true)
	end
end

function var_0_5.showEffectStart(arg_24_0)
	return
end

function var_0_5.showEffectMapShake(arg_25_0)
	local var_25_0 = CCArray:create()

	var_25_0:addObject(CCMoveBy:create(0.1, ccp(0, 15)))
	var_25_0:addObject(CCEaseElasticOut:create(CCMoveBy:create(1, ccp(0, -15)), 0.2))

	local var_25_1 = CCSequence:create(var_25_0)

	arg_25_0.world.mapLayer:getContainer():runAction(var_25_1)
end

function var_0_5.showEffectEnduranceChange(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = arg_26_0.mapLayer.cityTable[var_0_0[arg_26_1]]

	if user.jpsIndex > 0 and arg_26_1 == 1 then
		var_26_0 = arg_26_0.mapLayer.cityTable[var_0_0[5]]
	end

	if user.isKfyn then
		var_26_0 = arg_26_0.mapLayer.cityTable[6046]
	elseif user.isKflq then
		var_26_0 = arg_26_0.mapLayer.cityTable[7001]
	elseif user.isKfnz then
		var_26_0 = arg_26_0.mapLayer.cityTable[8050]
	end

	local var_26_1, var_26_2 = var_26_0.sprite:getPosition()
	local var_26_3 = CCSprite:create("res/ui/kfyz/kfyz_word_nj.png")
	local var_26_4 = CCLabelAtlas:create(string.format("%s", arg_26_2), "res/ui/common/number/blood_ded_numb.png", 17, 22, 48)

	var_26_4:setAnchorPoint(ccp(0.5, 0.5))

	local var_26_5 = CCSprite:createWithSpriteFrameName("blood_ded_subt.png")
	local var_26_6 = createRichNode({
		var_26_3,
		var_26_5,
		var_26_4
	}, 0)

	var_26_6:setPosition(ccp(var_26_1 + 115, var_26_2 + 80))
	arg_26_0:addChild(var_26_6, 100)

	local var_26_7 = CCArray:create()

	var_26_7:addObject(CCMoveBy:create(0.7, ccp(0, 30)))
	var_26_7:addObject(CCDelayTime:create(0.5))
	var_26_7:addObject(CCCallFuncN:create(function()
		var_26_6:removeFromParentAndCleanup(true)
	end))

	local var_26_8 = CCSequence:create(var_26_7)

	var_26_6:runAction(var_26_8)
end

function var_0_5.showEffectGongCheng(arg_28_0, arg_28_1, arg_28_2)
	eventManager.dispatchEvent("showEffectMapShake")
	rmgr.loadResource("res/ui/kfyz/machine.plist")
	rmgr.loadResource("res/ui/kfyz/light.plist")
	rmgr.loadResource("res/ui/kfyz/spark.plist")

	local var_28_0, var_28_1 = arg_28_0.mapLayer.cityTable[var_0_0[arg_28_1]].sprite:getPosition()
	local var_28_2 = CCNode:create()

	var_28_2:setPosition(ccp(var_28_0 - 100, var_28_1 - 50))
	var_28_2:setScale(0.8)
	arg_28_0:addChild(var_28_2, 100)

	local var_28_3 = CCSprite:create()

	var_28_2:addChild(var_28_3)

	local var_28_4 = CCArray:create()

	var_28_4:addObject(var_0_4("kfyz_light%02d.png", 10))
	var_28_4:addObject(CCFadeOut:create(0.2))

	local var_28_5 = CCSequence:create(var_28_4)

	var_28_3:runAction(CCSpeed:create(var_28_5, 1.5))

	local var_28_6 = CCSprite:createWithSpriteFrameName("kfyz_move01.png")

	var_28_6:setOpacity(0)
	var_28_6:setScaleX(-1)
	var_28_2:addChild(var_28_6)

	local var_28_7 = CCArray:create()

	var_28_7:addObject(CCDelayTime:create(1))
	var_28_7:addObject(CCFadeIn:create(0.2))
	var_28_7:addObject(var_0_4("kfyz_move%02d.png", 6))
	var_28_7:addObject(var_0_4("kfyz_attack%02d.png", 14))
	var_28_7:addObject(var_0_4("kfyz_attack%02d.png", 14))

	local var_28_8 = CCSequence:create(var_28_7)

	var_28_6:runAction(CCSpeed:create(var_28_8, 1.5))

	local var_28_9 = CCArray:create()

	var_28_9:addObject(CCDelayTime:create(1.2))
	var_28_9:addObject(CCMoveBy:create(0.6, ccp(30, 20)))
	var_28_9:addObject(CCDelayTime:create(3))
	var_28_9:addObject(CCCallFuncN:create(function()
		var_28_2:removeFromParentAndCleanup(true)
		arg_28_0:showEffectEnduranceChange(arg_28_1, arg_28_2)
	end))

	local var_28_10 = CCSequence:create(var_28_9)

	var_28_2:runAction(CCSpeed:create(var_28_10, 1.5))

	local var_28_11 = CCSprite:create()

	var_28_11:setPosition(ccp(90, 40))
	var_28_2:addChild(var_28_11)

	local var_28_12 = CCArray:create()

	var_28_12:addObject(CCDelayTime:create(2.8))
	var_28_12:addObject(CCCallFuncN:create(function()
		var_28_11:runAction(var_0_4("kfyz_spark%02d.png", 7))
	end))
	var_28_12:addObject(CCDelayTime:create(1.4))
	var_28_12:addObject(CCCallFuncN:create(function()
		var_28_11:runAction(var_0_4("kfyz_spark%02d.png", 7))
	end))

	local var_28_13 = CCSequence:create(var_28_12)

	var_28_11:runAction(CCSpeed:create(var_28_13, 1.5))
end

function var_0_5.showEffectJuMa(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = {
		jmlLastTimes = {}
	}

	var_32_0.jmlLastTimes[1] = {}
	var_32_0.jmlLastTimes[1].forceId = arg_32_1
	var_32_0.jmlLastTimes[1].jmlLastTime = arg_32_2

	arg_32_0:updateForceInfo(var_32_0)

	if user.kfyzWorldId ~= 9 and arg_32_1 > 1000 then
		arg_32_1 = 4
	end

	eventManager.dispatchEvent("moveToCity", var_0_0[arg_32_1], true)

	local var_32_1, var_32_2 = arg_32_0.mapLayer.cityTable[var_0_0[arg_32_1]].sprite:getPosition()
	local var_32_3 = CCNode:create()

	var_32_3:setPosition(ccp(var_32_1, var_32_2))
	arg_32_0:addChild(var_32_3, 100)
	rmgr.loadResource("res/ui/kfyz/light.plist")

	local var_32_4 = {
		ccp(55, 0),
		ccp(120, 35),
		ccp(120, 90),
		ccp(55, 125),
		ccp(-55, 125),
		ccp(-120, 90),
		ccp(-120, 35),
		ccp(-55, 0)
	}
	local var_32_5 = CCSpriteBatchNode:create("res/ui/kfyz/light.png")

	var_32_3:addChild(var_32_5)

	for iter_32_0 = 1, 8 do
		local var_32_6 = CCSprite:createWithSpriteFrameName("kfyz_light01.png")

		var_32_6:setPosition(var_32_4[iter_32_0])
		var_32_5:addChild(var_32_6)
		var_32_6:setVisible(false)

		local var_32_7 = CCArray:create()

		var_32_7:addObject(CCDelayTime:create(0.4 * (iter_32_0 / 2)))
		var_32_7:addObject(CCCallFuncN:create(function()
			var_32_6:setVisible(true)
		end))
		var_32_7:addObject(var_0_4("kfyz_light%02d.png", 18))
		var_32_7:addObject(CCCallFuncN:create(function()
			var_32_6:setVisible(false)
		end))

		local var_32_8 = CCSequence:create(var_32_7)

		var_32_6:runAction(CCSpeed:create(var_32_8, 1.5))
	end

	local var_32_9 = CCSprite:create("res/ui/kfyz/juma.png")
	local var_32_10 = CCSprite:create("res/ui/kfyz/juma_light.png")

	var_32_3:addChild(var_32_9)
	var_32_3:addChild(var_32_10)
	var_32_9:setOpacity(0)
	var_32_10:setOpacity(0)

	local var_32_11 = CCArray:create()

	var_32_11:addObject(CCDelayTime:create(1.6))
	var_32_11:addObject(CCFadeIn:create(0.3))

	local var_32_12 = CCSequence:create(var_32_11)

	var_32_9:runAction(CCSpeed:create(var_32_12, 1.5))

	local var_32_13 = CCArray:create()

	var_32_13:addObject(CCDelayTime:create(1.6))
	var_32_13:addObject(CCFadeIn:create(0.4))
	var_32_13:addObject(CCDelayTime:create(0.4))
	var_32_13:addObject(CCFadeOut:create(0.6))
	var_32_13:addObject(CCFadeIn:create(0.4))
	var_32_13:addObject(CCFadeOut:create(0.6))
	var_32_13:addObject(CCFadeIn:create(0.4))
	var_32_13:addObject(CCFadeOut:create(0.6))
	var_32_13:addObject(CCCallFuncN:create(function()
		var_32_3:removeFromParentAndCleanup(true)
	end))

	local var_32_14 = CCSequence:create(var_32_13)

	var_32_10:runAction(CCSpeed:create(var_32_14, 1.5))
end

function var_0_5.showEffectArrow(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = {
		[5031] = 5035,
		[5032] = 5036,
		[5040] = 5039
	}

	if not arg_36_0.arrowTable[arg_36_1] then
		local var_36_1 = CCSpriteBatchNode:create("res/ui/kfyz/arrow.png")

		for iter_36_0 = 1, 6 do
			local var_36_2 = CCSprite:create("res/ui/kfyz/arrow.png")

			var_36_2:setPosition(0, 16 * (iter_36_0 - 3.5))
			var_36_2:setOpacity(0)
			var_36_1:addChild(var_36_2)

			local var_36_3 = CCArray:create()

			var_36_3:addObject(CCDelayTime:create(0.1 * iter_36_0))
			var_36_3:addObject(CCFadeIn:create(0.2))
			var_36_3:addObject(CCFadeOut:create(0.2))
			var_36_3:addObject(CCDelayTime:create(1 - 0.1 * iter_36_0))

			local var_36_4 = CCSequence:create(var_36_3)

			var_36_2:runAction(CCRepeatForever:create(var_36_4))
		end

		local var_36_5
		local var_36_6
		local var_36_7
		local var_36_8 = worldDongyingConstant.BUILDING_INFO["world_building_" .. arg_36_1]
		local var_36_9 = worldDongyingConstant.BUILDING_INFO["world_building_" .. var_36_0[arg_36_1]]
		local var_36_10 = 0.5 * (var_36_8.x + var_36_9.x)
		local var_36_11 = 1800 - 0.5 * (var_36_8.y + var_36_9.y)
		local var_36_12 = math.deg(math.atan((var_36_9.y - var_36_8.y) / (var_36_9.x - var_36_8.x)))

		var_36_1:setPosition(var_36_10, var_36_11)
		var_36_1:setRotation(var_36_12 - 90)
		arg_36_0:addChild(var_36_1, 100)

		arg_36_0.arrowTable[arg_36_1] = {}
		arg_36_0.arrowTable[arg_36_1].sprite = var_36_1
	end

	arg_36_0.arrowTable[arg_36_1].sprite:setVisible(arg_36_2 == 0)
end

function var_0_5.handlerGetWorldMapAction(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_1.data

	if user.kfyzWorldId == 5 then
		local var_37_1 = {
			95016,
			95017,
			95018
		}

		for iter_37_0 = 1, 3 do
			var_37_0["nationName" .. iter_37_0] = language.get(var_37_1[iter_37_0])
		end
	end

	for iter_37_1, iter_37_2 in pairs(var_37_0.nationNames) do
		if iter_37_2.forceId == 1 or iter_37_2.forceId == 2 or iter_37_2.forceId == 3 then
			if type(iter_37_2.nationName) == "userdata" then
				arg_37_0.view.widgets["nationName" .. iter_37_2.forceId]:setString("NPC")
			else
				arg_37_0.view.widgets["nationName" .. iter_37_2.forceId]:setString(iter_37_2.nationName)
			end
		end
	end
end

function var_0_5.npcMove(arg_38_0, arg_38_1)
	local var_38_0 = {
		{
			97,
			103,
			106
		},
		{
			98,
			135,
			138
		},
		{
			105,
			139
		}
	}
	local var_38_1 = user.invastType == 1

	rmgr.loadResource("res/ui/kfyz/move.plist")

	if arg_38_0.node_walk then
		arg_38_0.node_walk:removeAllChildrenWithCleanup(true)
	else
		arg_38_0.node_walk = CCSpriteBatchNode:create("res/ui/kfyz/move.png", 10)

		arg_38_0:addChild(arg_38_0.node_walk)
	end

	local var_38_2 = 0
	local var_38_3 = 0
	local var_38_4
	local var_38_5 = 0
	local var_38_6 = 0

	if arg_38_1 == 1 then
		var_38_4 = 45
	elseif arg_38_1 == 2 then
		var_38_4 = 105
	end

	if var_38_4 then
		var_38_2, var_38_3 = arg_38_0.mapLayer.cityTable[var_38_4].sprite:getPosition()
		var_38_6 = visibleSize.height / 2

		if arg_38_1 == 2 then
			var_38_6 = var_38_6 + 240
		end

		var_38_5 = var_38_6 * 7 / 9
	end

	local var_38_7 = {
		ccp(-300, -160),
		ccp(-90, -120),
		ccp(0, 0),
		ccp(200, 90),
		ccp(-380, -75),
		ccp(-200, 15),
		ccp(-90, 80),
		ccp(90, 150),
		ccp(-170, 150)
	}
	local var_38_8 = {}
	local var_38_9 = {}

	for iter_38_0 = 1, 9 do
		var_38_8[iter_38_0] = ccp(var_38_2 + var_38_7[iter_38_0].x - var_38_5, var_38_3 + var_38_7[iter_38_0].y + var_38_6)
		var_38_9[iter_38_0] = ccp(var_38_2 + var_38_7[iter_38_0].x, var_38_3 + var_38_7[iter_38_0].y)

		if arg_38_1 == 2 then
			var_38_9[iter_38_0].x = var_38_9[iter_38_0].x + 185
			var_38_9[iter_38_0].y = var_38_9[iter_38_0].y - 240
		end
	end

	for iter_38_1 = 1, 9 do
		local var_38_10 = tool.spriteByName("kfyz_move01.png")

		var_38_10:setPosition(var_38_8[iter_38_1])
		arg_38_0.node_walk:addChild(var_38_10)

		local var_38_11 = CCArray:create()

		for iter_38_2 = 1, 6 do
			local var_38_12 = CCSprite:createWithSpriteFrameName(string.format("kfyz_move%02d.png", iter_38_2))

			var_38_11:addObject(var_38_12:displayFrame())
		end

		local var_38_13 = CCAnimation:createWithSpriteFrames(var_38_11, 0.1)
		local var_38_14 = CCAnimate:create(var_38_13)

		var_38_10:runAction(CCRepeatForever:create(var_38_14))

		local var_38_15 = math.sqrt(var_38_5^2 + var_38_6^2) / (120 - math.floor(iter_38_1 / 4) * 20)

		var_38_10:runAction(CCMoveTo:create(var_38_15, var_38_9[iter_38_1]))

		if iter_38_1 == 1 then
			local var_38_16 = CCArray:create()

			var_38_16:addObject(CCDelayTime:create(var_38_15 - 0.2))

			if arg_38_1 == 1 then
				var_38_16:addObject(CCCallFuncN:create(function()
					eventManager.dispatchEvent("moveToCity", 105, true, false, 0.5)

					if var_38_1 then
						roleDialogue.control.loadSpeak(1531)
					else
						roleDialogue.control.loadSpeak(1533)
					end
				end))
			elseif arg_38_1 == 2 then
				local var_38_17 = {
					97,
					98,
					99,
					103,
					105,
					106,
					135,
					138,
					139,
					140,
					143
				}

				var_38_16:addObject(CCCallFuncN:create(function()
					for iter_40_0, iter_40_1 in ipairs(var_38_17) do
						arg_38_0.world.mapLayer:changeCity({
							cityState = 1,
							id = iter_40_1
						})
						arg_38_0.node_walk:setVisible(false)
					end
				end))
				var_38_16:addObject(CCDelayTime:create(2))
				var_38_16:addObject(CCCallFuncN:create(function()
					for iter_41_0, iter_41_1 in ipairs(var_38_17) do
						arg_38_0.world.mapLayer:changeCity({
							cityState = 0,
							id = iter_41_1
						})
						arg_38_0.node_walk:removeAllChildrenWithCleanup(true)
						arg_38_0.node_walk:setVisible(true)
					end

					arg_38_0.world:changeMatchState(1)
					arg_38_0.world.waitLayer:setVisible(false)
					arg_38_0.world.menuLayer:setStateWait(false)

					if var_38_1 then
						eventManager.dispatchEvent("moveToCity", var_0_0[1 + user.player.forceId % 3], true, false, 0.5)
						roleDialogue.control.loadSpeak(1532)
					else
						roleDialogue.control.loadSpeak(1534)
					end
				end))
			end

			local var_38_18 = CCSequence:create(var_38_16)

			var_38_10:runAction(var_38_18)
		end
	end
end

function var_0_5.autoBattleEffect(arg_42_0, arg_42_1)
	if arg_42_0.abEffectSprite ~= nil and not tolua.isnull(arg_42_0.abEffectSprite) then
		arg_42_0.abEffectSprite:removeFromParentAndCleanup(true)
	end

	if arg_42_1 ~= nil then
		local var_42_0, var_42_1 = arg_42_0.mapLayer.cityTable[arg_42_1].sprite:getPosition()
		local var_42_2 = CCSprite:create("res/ui/world/autoBattle/zdgz_city_xz.png")

		arg_42_0.abEffectSprite = var_42_2

		var_42_2:setPosition(ccp(var_42_0, var_42_1))
		arg_42_0:addChild(var_42_2, 100)
	end
end

function var_0_5.onTouch(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	if arg_43_0.data and arg_43_0.data.officeId >= 3 then
		return true
	end

	if arg_43_1 == CCTOUCHBEGAN then
		arg_43_0.touchLocation = ccp(arg_43_2, arg_43_3)
	elseif arg_43_1 == CCTOUCHENDED and (not (ccpDistance(arg_43_0.touchLocation, ccp(arg_43_2, arg_43_3)) < 50) or true) then
		arg_43_0.touchLocation = nil
	end

	return true
end

function var_0_5.onEnter(arg_44_0)
	arg_44_0.npcMoveRef = handler(arg_44_0, arg_44_0.npcMove)
	arg_44_0.showEffectMapShakeRef = handler(arg_44_0, arg_44_0.showEffectMapShake)

	function arg_44_0.setVisibleArmyBaseRef(arg_45_0)
		arg_44_0.view.widgets.node_army:setVisible(arg_45_0)
	end

	arg_44_0.showEffectJuMaRef = handler(arg_44_0, arg_44_0.showEffectJuMa)
	arg_44_0.updateForceInfoRef = handler(arg_44_0, arg_44_0.updateForceInfo)
	arg_44_0.showEffectEnduranceChangeRef = handler(arg_44_0, arg_44_0.showEffectEnduranceChange)
	arg_44_0.autoBattleEffectRef = handler(arg_44_0, arg_44_0.autoBattleEffect)
	arg_44_0.showEffectArrowRef = handler(arg_44_0, arg_44_0.showEffectArrow)

	eventManager.registerEvent("npcMove", arg_44_0.npcMoveRef)
	eventManager.registerEvent("showEffectMapShake", arg_44_0.showEffectMapShakeRef)
	eventManager.registerEvent("armyBaseSetVisible", arg_44_0.setVisibleArmyBaseRef)
	eventManager.registerEvent("showEffectJuMa", arg_44_0.showEffectJuMaRef)
	eventManager.registerEvent("updateForceInfo", arg_44_0.updateForceInfoRef)
	eventManager.registerEvent("showEffectEnduranceChange", arg_44_0.showEffectEnduranceChangeRef)
	eventManager.registerEvent("autoBattleCityEffect", arg_44_0.autoBattleEffectRef)
	eventManager.registerEvent("showEffectArrow", arg_44_0.showEffectArrowRef)
end

function var_0_5.onExit(arg_46_0)
	eventManager.unregisterEvent("npcMove", arg_46_0.npcMoveRef)
	eventManager.unregisterEvent("showEffectMapShake", arg_46_0.showEffectMapShakeRef)
	eventManager.unregisterEvent("armyBaseSetVisible", arg_46_0.setVisibleArmyBaseRef)
	eventManager.unregisterEvent("showEffectJuMa", arg_46_0.showEffectJuMaRef)
	eventManager.unregisterEvent("updateForceInfo", arg_46_0.updateForceInfoRef)
	eventManager.unregisterEvent("showEffectEnduranceChange", arg_46_0.showEffectEnduranceChangeRef)
	eventManager.unregisterEvent("autoBattleCityEffect", arg_46_0.autoBattleEffectRef)
	eventManager.unregisterEvent("showEffectArrow", arg_46_0.showEffectArrowRef)
end

return var_0_5
