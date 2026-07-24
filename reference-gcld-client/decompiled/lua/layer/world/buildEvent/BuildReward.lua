local var_0_0 = {
	[112] = {
		pic = "icon_tj_h.png",
		type = 10001
	}
}
local var_0_1 = {
	{
		pic = "worldBuildingPingyuan.png",
		txt = 81109
	},
	[6] = {
		pic = "worldBuildingChengchi1.png",
		txt = 81112
	},
	[3] = {
		pic = "worldBuildingShandi.png",
		txt = 81110
	},
	[4] = {
		pic = "worldBuildingShuidi1.png",
		txt = 81111
	}
}
local var_0_2 = colorQuality[0]
local var_0_3 = tool.hexToRgb("#D9EDC5")
local var_0_4 = ccc3(0, 180, 0)
local var_0_5 = colorQuality[5]
local var_0_6 = colorQuality[4]
local var_0_7 = colorQuality[2]
local var_0_8 = class("BuildReward", function()
	return createBaseLayer()
end)

var_0_8.layout = {
	y = 0,
	name = "Scene",
	type = "node",
	x = 0,
	children = {
		{
			name = "panel",
			type = "sprite9",
			preferedSize = CCSizeMake(960, 580),
			middleRect = CCRectMake(30, 30, 45, 45),
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 - 30,
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
						path = "btn_close_click.png"
					}
				},
				{
					y = 290,
					type = "sprite9",
					x = 480,
					preferedSize = CCSizeMake(916, 532),
					middleRect = CCRectMake(10, 10, 70, 70),
					pic = {
						path = "res/ui/common/panel/comm_view.png"
					}
				},
				{
					y = 290,
					x = 480,
					type = "sprite",
					pic = {
						path = "res/ui/buildEvent/jzcl_bg.jpg"
					}
				},
				{
					y = 470,
					x = 479.9999,
					type = "sprite",
					pic = {
						path = "res/ui/activity/sevenCatch/qtmh_up_line.png"
					}
				},
				{
					y = 110,
					x = 480,
					type = "sprite",
					pic = {
						path = "res/ui/activity/sevenCatch/qtmh_up_line.png"
					}
				},
				{
					y = 510,
					x = 480,
					type = "sprite",
					pic = {
						path = "res/ui/buildEvent/jzcl_title.png"
					}
				},
				{
					y = 280,
					name = "city",
					type = "sprite",
					x = 190,
					pic = {
						path = "res/ui/world/farm_city_icon.png"
					}
				},
				{
					y = 200,
					name = "bg_info",
					type = "sprite",
					x = 190,
					pic = {
						path = "res/ui/buildEvent/jzsj_word_jzcbzwfjr_di.png"
					}
				},
				{
					fontSize = 22,
					name = "materialInfo",
					y = 160,
					type = "label",
					x = 190
				},
				{
					y = 220,
					type = "sprite",
					x = 560,
					pic = {
						path = "res/ui/buildEvent/jzcl_jl_di.png"
					},
					children = {
						{
							y = 0,
							name = "node1",
							type = "node",
							x = 115,
							children = {
								{
									w = 100,
									name = "btn_reward1",
									h = 80,
									type = "button",
									y = 60,
									x = 0,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									}
								},
								{
									y = 128,
									x = 0,
									type = "sprite",
									pic = {
										path = "res/ui/buildEvent/jzcl_word_jzjl.png"
									}
								},
								{
									y = 70,
									name = "icon1",
									type = "sprite",
									x = 0.0001,
									pic = {
										path = "res/ui/task/huangcheng.png"
									}
								},
								{
									y = 50,
									name = "txt1",
									type = "sprite",
									x = 0,
									pic = {
										path = "res/ui/buildEvent/jzcl_word_gx.png"
									}
								},
								{
									fontSize = 20,
									name = "num1",
									y = 60,
									type = "label",
									x = 25,
									anchorPoint = ccp(0, 0.5)
								},
								{
									fontSize = 20,
									name = "cond1",
									y = 30,
									type = "label",
									x = 0,
									color = var_0_6
								}
							}
						},
						{
							y = 0,
							name = "node2",
							type = "node",
							x = 325,
							children = {
								{
									w = 100,
									name = "btn_reward2",
									h = 80,
									type = "button",
									y = 60,
									x = 0,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									}
								},
								{
									y = 128,
									x = 0,
									type = "sprite",
									pic = {
										path = "res/ui/buildEvent/jzcl_word_ewjl.png"
									}
								},
								{
									y = 70,
									name = "icon2",
									type = "sprite",
									x = 0,
									pic = {
										path = "res/ui/task/huangcheng.png"
									}
								},
								{
									y = 50,
									name = "txt2",
									type = "sprite",
									x = 0,
									pic = {
										path = "res/ui/buildEvent/jzcl_word_gx.png"
									}
								},
								{
									fontSize = 20,
									name = "num2",
									y = 60,
									type = "label",
									x = 25,
									anchorPoint = ccp(0, 0.5)
								},
								{
									fontSize = 20,
									name = "cond2",
									y = 30,
									type = "label",
									x = 0,
									color = var_0_6
								}
							}
						}
					}
				}
			}
		}
	}
}

local var_0_9 = {
	y = 0,
	name = "node_npc",
	type = "node",
	x = 0,
	children = {
		{
			y = 0,
			name = "npc",
			type = "sprite",
			x = 0,
			pic = {
				frame = true,
				path = "daiji60001.png"
			}
		},
		{
			y = 50,
			name = "bg_name",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/buildEvent/jzcl_wjm_di.png"
			}
		},
		{
			fontSize = 22,
			name = "name",
			y = 50,
			type = "label",
			x = 0
		}
	}
}

function var_0_8.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getBuildRewardInfo)
end

function var_0_8.onRecvBuildReward(arg_4_0, arg_4_1)
	local function var_4_0(arg_5_0)
		local var_5_0 = arg_5_0.action.data
		local var_5_1 = {}

		for iter_5_0, iter_5_1 in ipairs(var_5_0.rewards) do
			local var_5_2 = {}

			if var_0_0[iter_5_1.type] then
				var_5_2.id = var_0_0[iter_5_1.type].type
			else
				var_5_2.id = iter_5_1.type
			end

			var_5_2.value = iter_5_1.num

			table.insert(var_5_1, var_5_2)
		end

		globalAction_gotResource(var_5_1)
		arg_4_0:showPanel(var_5_0.info)
	end

	cmgr.sendRequest(var_4_0, actions.recvBuildReward, arg_4_1)
end

function var_0_8.showEffectShake(arg_6_0, arg_6_1)
	if not arg_6_1 or tolua.isnull(arg_6_1) then
		return
	end

	local var_6_0 = CCArray:create()

	var_6_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_6_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_6_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_6_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_6_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_6_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_6_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_6_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_6_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_6_0:addObject(CCDelayTime:create(0.4))

	local var_6_1 = CCSequence:create(var_6_0)

	arg_6_1:stopAllActions()
	arg_6_1:runAction(CCRepeatForever:create(var_6_1))
end

function var_0_8.showPanel(arg_7_0, arg_7_1)
	arg_7_0.info = arg_7_1

	local var_7_0 = 0
	local var_7_1 = {}
	local var_7_2 = 0
	local var_7_3 = ""

	for iter_7_0, iter_7_1 in pairs(arg_7_1.rewardList) do
		if iter_7_1.type == 112 then
			table.insert(var_7_1, iter_7_1)
		else
			var_7_2 = iter_7_1.num
			var_7_3 = iter_7_1.name
		end
	end

	for iter_7_2, iter_7_3 in ipairs(var_7_1) do
		local var_7_4 = arg_7_0.view.widgets["icon" .. iter_7_2]
		local var_7_5 = arg_7_0.view.widgets["txt" .. iter_7_2]
		local var_7_6 = arg_7_0.view.widgets["num" .. iter_7_2]
		local var_7_7 = iter_7_3.num > 0 and iter_7_3.gained == false

		var_7_4:stopAllActions()
		var_7_5:stopAllActions()
		var_7_4:setPositionX(0)
		var_7_5:setPositionX(0)
		arg_7_0.view.widgets["btn_reward" .. iter_7_2]:setEnabled(var_7_7)

		if var_7_7 then
			var_7_0 = var_7_0 + 1

			arg_7_0:showEffectShake(var_7_4)
			arg_7_0:showEffectShake(var_7_5)
		else
			tool.spriteToGray(var_7_4)
			tool.spriteToGray(var_7_5)
		end

		var_7_6:setString(var_7_7 and language.get(135039, iter_7_3.num) or "")

		if iter_7_2 == 1 then
			arg_7_0.view.widgets.cond1:setString(language.get(92150, arg_7_0.star))
		elseif iter_7_2 == 2 then
			arg_7_0.view.widgets.cond2:setString(var_7_7 and language.get(92150, arg_7_0.star) or language.get(92151))
		end
	end

	arg_7_0.view.widgets.materialInfo:setString(var_7_2 > 0 and language.get(213215, var_7_3, var_7_2) or "")

	if var_7_0 == 0 then
		arg_7_0:removeFromParentAndCleanup(true)
	end
end

function var_0_8.ctor(arg_8_0, arg_8_1, arg_8_2)
	log.info("@@ 建造酬劳")
	rmgr.loadResource("res/ui/world/worldBuilding.plist")
	rmgr.loadResource("res/ui/buildEvent/worker.plist")
	swallowTouch(arg_8_0)

	arg_8_0.view = {}

	uiutil.initWidgets(arg_8_0.view, arg_8_0.layout)

	if arg_8_1 then
		arg_8_0:addChild(arg_8_0.view.widgets.Scene)
		arg_8_1:addChild(arg_8_0)
	end

	arg_8_0.view.widgets.btn_close:addHandleOfControlEvent(function()
		log.info("btn_close")
		arg_8_0:removeFromParentAndCleanup(true)
	end, CCControlEventTouchUpInside)

	for iter_8_0 = 1, 2 do
		arg_8_0.view.widgets["btn_reward" .. iter_8_0]:addHandleOfControlEvent(function()
			log.info("btn_reward" .. iter_8_0)
			arg_8_0:onRecvBuildReward(iter_8_0)
		end, CCControlEventTouchUpInside)
	end

	local var_8_0 = var_0_1[arg_8_2.terrain]
	local var_8_1 = ""
	local var_8_2 = ""

	if var_8_0 then
		var_8_1 = language.get(var_8_0.txt)
		var_8_2 = var_8_0.pic
	else
		var_8_1 = ""
		var_8_2 = "worldBuildingChengchi1.png"
	end

	arg_8_0.view.widgets.city:setDisplayFrame(tool.spriteFrameByName(var_8_2))

	local var_8_3 = CCLabelTTF:create(arg_8_2.cityName, "", 22)
	local var_8_4 = CCLabelTTF:create(var_8_1, "", 22)
	local var_8_5 = CCLabelTTF:create(language.get(92143), "", 22)

	var_8_3:setColor(var_0_4)
	var_8_4:setColor(var_0_3)
	var_8_5:setColor(var_0_6)

	local var_8_6 = createRichNode({
		var_8_3,
		var_8_4,
		var_8_5
	}, 0.5)
	local var_8_7, var_8_8 = arg_8_0.view.widgets.bg_info:getPosition()

	var_8_6:setPosition(ccp(var_8_7, var_8_8))
	arg_8_0.view.widgets.panel:addChild(var_8_6)

	local var_8_9 = {
		ccp(400, 360),
		ccp(550, 300),
		ccp(700, 360),
		ccp(850, 300)
	}

	for iter_8_1, iter_8_2 in ipairs(arg_8_2.joiners) do
		local var_8_10 = {}

		uiutil.initWidgets(var_8_10, var_0_9)
		var_8_10.widgets.node_npc:setPosition(var_8_9[iter_8_1])
		arg_8_0.view.widgets.panel:addChild(var_8_10.widgets.node_npc)
		var_8_10.widgets.name:setString(iter_8_2.playerName)

		for iter_8_3 = 1, 5 do
			local var_8_11 = iter_8_3 <= iter_8_2.star and "jb_mode_star.png" or "jb_mode_star_gray.png"
			local var_8_12 = CCSprite:create("res/ui/juben/jubenLevelSelect/" .. var_8_11)

			var_8_12:setPosition(25 * (iter_8_3 - 3), 80)
			var_8_10.widgets.node_npc:addChild(var_8_12)
		end

		if iter_8_2.playerId == user.player.playerId then
			arg_8_0.star = iter_8_2.star
		end
	end

	arg_8_0:showPanel(arg_8_2)
end

return var_0_8
