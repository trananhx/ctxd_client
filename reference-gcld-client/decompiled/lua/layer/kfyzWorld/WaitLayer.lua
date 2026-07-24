local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = class("kfyzWaitLayer", function()
	return createBaseLayer()
end)

var_0_1.layout = {
	name = "panel",
	scale = 0.8,
	type = "node",
	x = visibleSize.width / 2,
	y = visibleSize.height / 2,
	children = {
		{
			y = 0,
			name = "node_time",
			type = "node",
			x = 0,
			children = {
				{
					y = 188,
					name = "bg1",
					type = "sprite9",
					x = 0,
					preferedSize = CCSizeMake(1000, 95),
					middleRect = CCRectMake(40, 10, 780, 88),
					pic = {
						path = "res/ui/world/cityCombo/lxzc_bg4.png"
					}
				},
				{
					y = 108,
					name = "bg2",
					type = "sprite9",
					scale = 0.875,
					x = 0,
					preferedSize = CCSizeMake(800, 80),
					middleRect = CCRectMake(40, 10, 780, 88),
					pic = {
						path = "res/ui/world/cityCombo/lxzc_bg4.png"
					}
				},
				{
					type = "sprite",
					name = "title",
					y = 193,
					visible = false,
					x = 0,
					pic = {
						path = "res/ui/kfyz/wait/kfyz_await_word_01.png"
					}
				},
				{
					name = "time",
					type = "atlaslabel",
					pic = "res/ui/common/number/yxhd_time_digit.png",
					startCharMap = 47,
					text = "00:00",
					y = 113,
					itemWidth = 35,
					x = 0,
					itemHeight = 34
				},
				{
					y = 280,
					name = "horse1",
					type = "sprite",
					x = -320,
					pic = {
						frame = true,
						path = "kfyz_move40001.png"
					}
				},
				{
					y = 280,
					name = "horse2",
					type = "sprite",
					x = 320,
					pic = {
						frame = true,
						path = "kfyz_move40001.png"
					}
				}
			}
		},
		{
			y = -90,
			name = "node_info",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/world/cityCombo/lxzc_bg.png"
			},
			children = {
				{
					y = 260,
					name = "bg3",
					type = "sprite9",
					x = 482,
					preferedSize = CCSizeMake(1000, 120),
					middleRect = CCRectMake(40, 10, 780, 88),
					pic = {
						path = "res/ui/world/cityCombo/lxzc_bg4.png"
					}
				},
				{
					y = 290,
					x = 202,
					type = "sprite",
					pic = {
						path = "res/ui/kfyz/wait/kfyz_await_word_yzf.png"
					}
				},
				{
					y = 290,
					x = 762,
					type = "sprite",
					pic = {
						path = "res/ui/kfyz/wait/kfyz_await_word_fsf.png"
					}
				},
				{
					fontSize = 30,
					name = "name1",
					y = 240,
					type = "label",
					x = 202,
					color = var_0_0
				},
				{
					fontSize = 30,
					name = "name2",
					y = 240,
					type = "label",
					x = 762,
					color = var_0_0
				},
				{
					y = 165,
					name = "bg_att",
					type = "sprite",
					x = 202,
					zorder = 1,
					pic = {
						path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
					},
					children = {
						{
							scale = 0.65,
							y = 35,
							type = "sprite",
							x = 60,
							pic = {
								path = "res/ui/playerInfo/role_nation_view.png"
							}
						},
						{
							fontSize = 30,
							name = "force_att",
							y = 35,
							type = "label",
							x = 60
						},
						{
							y = 35,
							name = "frd_att",
							type = "sprite",
							x = 130,
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
							}
						},
						{
							name = "num_att",
							type = "atlaslabel",
							pic = "res/ui/common/number/yyyz_word_frd_digit.png",
							startCharMap = 48,
							text = "0",
							y = 35,
							itemWidth = 18,
							x = 180,
							itemHeight = 26,
							anchorPoint = ccp(0, 0.5)
						},
						{
							type = "sprite",
							name = "tally_att",
							x = 300,
							visible = false,
							y = 35,
							scale = 0.7,
							pic = {
								path = "res/default.png"
							}
						}
					}
				},
				{
					y = 165,
					name = "bg_def1",
					visible = false,
					type = "sprite",
					x = 762,
					pic = {
						path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
					},
					children = {
						{
							scale = 0.65,
							y = 35,
							type = "sprite",
							x = 60,
							pic = {
								path = "res/ui/playerInfo/role_nation_view.png"
							}
						},
						{
							fontSize = 30,
							name = "force_def1",
							y = 35,
							type = "label",
							x = 60,
							color = colorForce[1]
						},
						{
							y = 35,
							name = "frd_def1",
							type = "sprite",
							x = 130,
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
							}
						},
						{
							name = "num_def1",
							type = "atlaslabel",
							pic = "res/ui/common/number/yyyz_word_frd_digit.png",
							startCharMap = 48,
							text = "0",
							y = 35,
							itemWidth = 18,
							x = 180,
							itemHeight = 26,
							anchorPoint = ccp(0, 0.5)
						},
						{
							type = "sprite",
							name = "tally_def1",
							x = 300,
							visible = false,
							y = 35,
							scale = 0.7,
							pic = {
								path = "res/default.png"
							}
						}
					}
				},
				{
					y = 105,
					name = "bg_def2",
					visible = false,
					type = "sprite",
					x = 762,
					pic = {
						path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
					},
					children = {
						{
							scale = 0.65,
							y = 35,
							type = "sprite",
							x = 60,
							pic = {
								path = "res/ui/playerInfo/role_nation_view.png"
							}
						},
						{
							fontSize = 30,
							name = "force_def2",
							y = 35,
							type = "label",
							x = 60,
							color = colorForce[2]
						},
						{
							y = 35,
							name = "frd_def2",
							type = "sprite",
							x = 130,
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
							}
						},
						{
							name = "num_def2",
							type = "atlaslabel",
							pic = "res/ui/common/number/yyyz_word_frd_digit.png",
							startCharMap = 48,
							text = "0",
							y = 35,
							itemWidth = 18,
							x = 180,
							itemHeight = 26,
							anchorPoint = ccp(0, 0.5)
						},
						{
							type = "sprite",
							name = "tally_def2",
							x = 300,
							visible = false,
							y = 35,
							scale = 0.7,
							pic = {
								path = "res/default.png"
							}
						}
					}
				},
				{
					y = 45,
					name = "bg_def3",
					visible = false,
					type = "sprite",
					x = 762,
					pic = {
						path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
					},
					children = {
						{
							scale = 0.65,
							y = 35,
							type = "sprite",
							x = 60,
							pic = {
								path = "res/ui/playerInfo/role_nation_view.png"
							}
						},
						{
							fontSize = 30,
							name = "force_def3",
							y = 35,
							type = "label",
							x = 60,
							color = colorForce[3]
						},
						{
							y = 35,
							name = "frd_def3",
							type = "sprite",
							x = 130,
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
							}
						},
						{
							name = "num_def3",
							type = "atlaslabel",
							pic = "res/ui/common/number/yyyz_word_frd_digit.png",
							startCharMap = 48,
							text = "0",
							y = 35,
							itemWidth = 18,
							x = 180,
							itemHeight = 26,
							anchorPoint = ccp(0, 0.5)
						},
						{
							type = "sprite",
							name = "tally_def3",
							x = 300,
							visible = false,
							y = 35,
							scale = 0.7,
							pic = {
								path = "res/default.png"
							}
						}
					}
				},
				{
					visible = false,
					name = "light",
					type = "sprite",
					pic = {
						path = "res/ui/kfyz/wait/yyyz_zfrd_bg_light.png"
					}
				},
				{
					y = 170,
					x = 482,
					type = "sprite",
					pic = {
						path = "res/ui/world/cityCombo/lxzc_qz2.png"
					}
				},
				{
					type = "sprite",
					name = "icon",
					y = 180,
					visible = false,
					x = 482,
					pic = {
						path = "res/ui/kfyz/wait/kfyz_await_att.png"
					}
				}
			}
		}
	}
}
var_0_1.layout_npc = {
	name = "node_npc",
	type = "node",
	x = visibleSize.width / 2,
	y = visibleSize.height / 2,
	children = {
		{
			y = 150,
			name = "npc1",
			type = "sprite",
			x = -500,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "res/ui/common/halfPic/halfPic_xiahoumao.png"
			}
		},
		{
			y = 50,
			name = "npc2",
			type = "sprite",
			x = -540,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "res/ui/common/halfPic/halfPic_xiahoudun.png"
			}
		},
		{
			y = -50,
			name = "npc3",
			type = "sprite",
			x = -400,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "res/ui/common/halfPic/halfPic_taishici.png"
			}
		},
		{
			y = -150,
			name = "npc4",
			type = "sprite",
			x = -500,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "res/ui/common/halfPic/halfPic_jiaxu.png"
			}
		},
		{
			y = 150,
			name = "npc5",
			type = "sprite",
			x = 500,
			anchorPoint = ccp(1, 0.5),
			pic = {
				path = "res/ui/common/halfPic/halfPic_fazheng.png"
			}
		},
		{
			y = 50,
			name = "npc6",
			type = "sprite",
			x = 540,
			anchorPoint = ccp(1, 0.5),
			pic = {
				path = "res/ui/common/halfPic/halfPic_zhangfei.png"
			}
		},
		{
			y = -50,
			name = "npc7",
			type = "sprite",
			x = 400,
			anchorPoint = ccp(1, 0.5),
			pic = {
				path = "res/ui/common/halfPic/halfPic_zhurong.png"
			}
		},
		{
			y = -150,
			name = "npc8",
			type = "sprite",
			x = 500,
			anchorPoint = ccp(1, 0.5),
			pic = {
				path = "res/ui/common/halfPic/halfPic_zhoutai.png"
			}
		}
	}
}

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	arg_2_2 = arg_2_2 or 0.07

	local var_2_0 = CCArray:create()

	for iter_2_0 = 1, arg_2_1 do
		local var_2_1 = CCSprite:createWithSpriteFrameName(string.format(arg_2_0, iter_2_0))

		var_2_0:addObject(var_2_1:displayFrame())
	end

	local var_2_2 = CCAnimation:createWithSpriteFrames(var_2_0, arg_2_2)

	return (CCAnimate:create(var_2_2))
end

function var_0_1.refresh(arg_3_0)
	local function var_3_0(arg_4_0)
		arg_3_0:showPanel(arg_4_0.action.data)
	end

	cmgr.sendRequest(var_3_0, actions.kfyzGetInvestInfo, user.kfRoadId)
end

function var_0_1.showEffectBegin(arg_5_0)
	if user.isKfdy then
		-- block empty
	elseif user.isKfgl then
		eventManager.dispatchEvent("moveToCity", 5001, true, false, 0.5)
	elseif user.isKfyn then
		eventManager.dispatchEvent("moveToCity", 6046, true, false, 0.5)
	elseif user.isKflq then
		eventManager.dispatchEvent("moveToCity", 7001, true, false, 0.5)
	elseif user.isKfnz then
		eventManager.dispatchEvent("moveToCity", 8050, true, false, 0.5)
	else
		eventManager.dispatchEvent("moveToCity", 105, true, false, 0.5)
	end

	local var_5_0 = {
		ccp(-500, 150),
		ccp(-540, 50),
		ccp(-400, -50),
		ccp(-500, -150),
		ccp(500, 150),
		ccp(540, 50),
		ccp(400, -50),
		ccp(500, -150)
	}

	arg_5_0.view.widgets.node_info:setVisible(false)

	for iter_5_0 = 1, 8 do
		local var_5_1 = iter_5_0 <= 4
		local var_5_2 = arg_5_0.view.widgets["npc" .. iter_5_0]
		local var_5_3 = arg_5_0.view.widgets["fog" .. iter_5_0]

		var_5_2:setPositionX((var_5_1 and -1 or 1) * (visibleSize.width / 2 + 250))

		local var_5_4 = CCArray:create()

		var_5_4:addObject(CCDelayTime:create(1 + 0.75 * (var_5_1 and 4 - iter_5_0 or 8 - iter_5_0)))
		var_5_4:addObject(CCEaseSineOut:create(CCMoveTo:create(0.5, var_5_0[iter_5_0])))

		local var_5_5 = CCSequence:create(var_5_4)

		var_5_2:runAction(var_5_5)
	end

	rmgr.loadResource("res/ui/juben/jbStart.plist")
	rmgr.loadResource("res/ui/activity/wish/wishLight.plist")

	for iter_5_1 = 1, 2 do
		local var_5_6 = iter_5_1 == 1
		local var_5_7 = arg_5_0.view.widgets["horse" .. iter_5_1]
		local var_5_8 = CCArray:create()

		var_5_8:addObject(CCMoveTo:create(8, ccp(var_5_6 and -50 or 50, 280)))

		if var_5_6 then
			var_5_8:addObject(CCCallFuncN:create(function()
				local var_6_0 = CCSprite:create()

				var_6_0:setPosition(ccp(0, 193))
				arg_5_0.view.widgets.panel:addChild(var_6_0, 100)

				local var_6_1 = CCArray:create()

				var_6_1:addObject(var_0_2("jb_start_100%02d.png", 11))
				var_6_1:addObject(CCFadeOut:create(0.2))

				local var_6_2 = CCSequence:create(var_6_1)

				var_6_0:runAction(var_6_2)
				var_6_0:setVisible(true)
			end))
			var_5_8:addObject(CCCallFuncN:create(function()
				arg_5_0:showEffectEnd()
			end))
		end

		local var_5_9 = CCSequence:create(var_5_8)

		var_5_7:runAction(var_5_9)
	end
end

function var_0_1.showEffectEnd(arg_8_0)
	local var_8_0 = {
		ccp(-500, 150),
		ccp(-540, 50),
		ccp(-400, -50),
		ccp(-500, -150),
		ccp(500, 150),
		ccp(540, 50),
		ccp(400, -50),
		ccp(500, -150)
	}

	for iter_8_0 = 1, 8 do
		local var_8_1 = iter_8_0 <= 4
		local var_8_2 = arg_8_0.view.widgets["npc" .. iter_8_0]
		local var_8_3 = arg_8_0.view.widgets["fog" .. iter_8_0]
		local var_8_4 = CCArray:create()

		var_8_4:addObject(CCDelayTime:create(0.5 * (var_8_1 and iter_8_0 or iter_8_0 - 4)))
		var_8_4:addObject(CCEaseSineOut:create(CCMoveTo:create(0.5, ccp((var_8_1 and -1 or 1) * (visibleSize.width / 2 + 250), var_8_0[iter_8_0].y))))

		local var_8_5 = CCSequence:create(var_8_4)

		var_8_2:runAction(var_8_5)

		local var_8_6 = CCEaseSineOut:create(CCMoveBy:create(2, ccp(var_8_1 and -400 or 400, 0)))
		local var_8_7 = CCFadeOut:create(2)
		local var_8_8 = CCArray:create()

		var_8_8:addObject(CCSpawn:createWithTwoActions(var_8_6, var_8_7))

		local var_8_9 = CCSequence:create(var_8_8)

		var_8_3:runAction(var_8_9)
	end

	for iter_8_1 = 1, 2 do
		local var_8_10 = iter_8_1 == 1
		local var_8_11 = arg_8_0.view.widgets["horse" .. iter_8_1]
		local var_8_12 = CCArray:create()

		var_8_12:addObject(CCMoveTo:create(2, ccp(var_8_10 and 320 or -320, 280)))

		if var_8_10 then
			var_8_12:addObject(CCCallFuncN:create(function()
				arg_8_0.view.widgets.node_time:setVisible(false)
				arg_8_0.view.widgets.node_info:setVisible(false)

				if user.jpsIndex == 0 then
					if user.kfyzWorldId == 9 then
						arg_8_0.world:changeMatchState(1)
						arg_8_0.world.waitLayer:setVisible(false)
						arg_8_0.world.menuLayer:setStateWait(false)

						if user.isSoldiersThreeRoad and user.kfRoadId and user.kfRoadId > 0 then
							roleDialogue.control.loadSpeak("kfbfsl" .. user.kfRoadId .. "001")
							roleDialogue.control.loadSpeak("kfbfsl" .. user.kfRoadId .. "002")
						end
					else
						eventManager.dispatchEvent("moveToCity", 45, true, false, 0.5)
						eventManager.dispatchEvent("npcMove", 1)
					end
				elseif user.isKfdy then
					arg_8_0.world:changeMatchState(1)
					arg_8_0.world.waitLayer:setVisible(false)
					arg_8_0.world.menuLayer:setStateWait(false)
					roleDialogue.control.loadSpeak(2105)
					roleDialogue.control.loadSpeak(2106)
					roleDialogue.control.loadSpeak(2107)
					roleDialogue.control.loadSpeak(2108)
					roleDialogue.control.loadSpeak(2109)
					roleDialogue.control.loadSpeak(2110)
				elseif user.jpsIndex >= 5 and user.jpsIndex <= 7 then
					arg_8_0.world:changeMatchState(1)
					arg_8_0.world.waitLayer:setVisible(false)
					arg_8_0.world.menuLayer:setStateWait(false)
					roleDialogue.control.loadSpeak("kfglState1")
					roleDialogue.control.loadSpeak("kfglState2")
					roleDialogue.control.loadSpeak("kfglState3")
					roleDialogue.control.loadSpeak("kfglState4")
					roleDialogue.control.loadSpeak("kfglState5")
					roleDialogue.control.loadSpeak("kfglState6")
				elseif user.isKfyn then
					arg_8_0.world:changeMatchState(1)
					arg_8_0.world.waitLayer:setVisible(false)
					arg_8_0.world.menuLayer:setStateWait(false)
					roleDialogue.control.loadSpeak("kfyn1001")
					roleDialogue.control.loadSpeak("kfyn1002")
					roleDialogue.control.loadSpeak("kfyn1003")
					roleDialogue.control.loadSpeak("kfyn1004")
					roleDialogue.control.loadSpeak("kfyn1005")
				elseif user.isKflq then
					arg_8_0.world:changeMatchState(1)
					arg_8_0.world.waitLayer:setVisible(false)
					arg_8_0.world.menuLayer:setStateWait(false)
					roleDialogue.control.loadSpeak("kflq1001")
					roleDialogue.control.loadSpeak("kflq1002")
					roleDialogue.control.loadSpeak("kflq1003")
					roleDialogue.control.loadSpeak("kflq1004")
					roleDialogue.control.loadSpeak("kflq1005")
				elseif user.isKfnz then
					arg_8_0.world:changeMatchState(1)
					arg_8_0.world.waitLayer:setVisible(false)
					arg_8_0.world.menuLayer:setStateWait(false)
					roleDialogue.control.loadSpeak("kfnzState1")
					roleDialogue.control.loadSpeak("kfnzState2")
					roleDialogue.control.loadSpeak("kfnzState2_1")
					roleDialogue.control.loadSpeak("kfnzState2_2")
					roleDialogue.control.loadSpeak("kfnzState3")
					roleDialogue.control.loadSpeak("kfnzState3_1")
					roleDialogue.control.loadSpeak("kfnzState3_2")
				end
			end))
		end

		local var_8_13 = CCSequence:create(var_8_12)

		var_8_11:runAction(var_8_13)
	end
end

function var_0_1.showPanel(arg_10_0, arg_10_1)
	arg_10_0.info = arg_10_1

	if user.jpsIndex > 0 then
		arg_10_0.view.widgets.node_info:setVisible(false)
	end

	if arg_10_1.nationInfos then
		for iter_10_0, iter_10_1 in pairs(arg_10_1.nationInfos) do
			if iter_10_1.isAtt then
				if type(iter_10_1.serverName) == "userdata" then
					arg_10_0.view.widgets.name1:setString("NPC")
				else
					arg_10_0.view.widgets.name1:setString(iter_10_1.serverName)
				end

				arg_10_0.view.widgets.num_att:setString(iter_10_1.mine)

				local var_10_0 = rmgr.setTallyPic(iter_10_1.tally, arg_10_0.view.widgets.tally_att)

				arg_10_0.view.widgets.tally_att:setVisible(var_10_0)
				arg_10_0.view.widgets.force_att:setString(iter_10_1.nationName)
				arg_10_0.view.widgets.force_att:setColor(colorForce[iter_10_1.nation])
			else
				if type(iter_10_1.serverName) == "userdata" then
					arg_10_0.view.widgets.name2:setString("NPC")
				else
					arg_10_0.view.widgets.name2:setString(iter_10_1.serverName)
				end

				if iter_10_1.nation == 1 or iter_10_1.nation == 2 or iter_10_1.nation == 3 then
					local var_10_1 = iter_10_1.nation

					arg_10_0.view.widgets["bg_def" .. var_10_1]:setVisible(true)
					arg_10_0.view.widgets["num_def" .. var_10_1]:setString(iter_10_1.mine)

					if arg_10_1.isSxZb then
						arg_10_0.view.widgets["bg_def" .. var_10_1]:setPosition(ccp(762, 165))
					end

					local var_10_2 = rmgr.setTallyPic(iter_10_1.tally, arg_10_0.view.widgets["tally_def" .. var_10_1])

					arg_10_0.view.widgets["tally_def" .. var_10_1]:setVisible(var_10_2)

					if user.kfyzWorldId == 5 then
						arg_10_0.view.widgets["force_def" .. var_10_1]:setString(language.get(95015 + var_10_1))
					else
						arg_10_0.view.widgets["force_def" .. var_10_1]:setString(iter_10_1.nationName)
					end
				end
			end
		end
	end

	local var_10_3 = user.invastType == 1
	local var_10_4 = var_10_3 and "kfyz_await_word_01.png" or "kfyz_await_word_02.png"

	if user.isKfdy then
		var_10_4 = "yzdy_word_jjdddyzd.png"
	elseif user.isKfgl then
		var_10_4 = "djgl_word_jjddglbd.png"
	elseif user.isKfyn then
		var_10_4 = "swjz_word_jjddjz.png"
	elseif user.isKflq then
		var_10_4 = "yzlq_word_jjddlqzd.png"
	elseif user.isKfnz then
		var_10_4 = "yznz_word_jjddnz.png"
	end

	local var_10_5 = var_10_3 and "kfyz_await_att.png" or "kfyz_await_def.png"

	arg_10_0.view.widgets.title:setDisplayFrame(CCSprite:create("res/ui/kfyz/wait/" .. var_10_4):displayFrame())
	arg_10_0.view.widgets.icon:setDisplayFrame(CCSprite:create("res/ui/kfyz/wait/" .. var_10_5):displayFrame())
	arg_10_0.view.widgets.title:setVisible(true)
	arg_10_0.view.widgets.icon:setVisible(true)

	local var_10_6

	if var_10_3 then
		var_10_6 = arg_10_0.view.widgets.bg_att
	else
		var_10_6 = arg_10_0.view.widgets["bg_def" .. user.player.forceId]
	end

	if var_10_6 then
		local var_10_7, var_10_8 = var_10_6:getPosition()

		arg_10_0.view.widgets.light:setPosition(ccp(var_10_7, var_10_8 + 2.5))
		arg_10_0.view.widgets.light:setVisible(true)
	end

	if user.startTime <= 0 and user.isKfyn and user.firstInYn == nil then
		eventManager.dispatchEvent("moveToCity", 6001)

		user.firstInYn = true
	end

	if user.startTime <= 0 and user.isKflq and user.firstInYn == nil then
		eventManager.dispatchEvent("moveToCity", 7056)

		user.firstInYn = true
	end

	arg_10_0.view.widgets.time:setString(tool.getFormatTime(user.startTime))
	arg_10_0.view.widgets.time:stopAllActions()

	local var_10_9 = CCArray:create()

	var_10_9:addObject(CCDelayTime:create(1))
	var_10_9:addObject(CCCallFuncN:create(function()
		if user.startTime <= 0 then
			arg_10_0.view.widgets.time:setString(tool.getFormatTime(0))
			arg_10_0.view.widgets.time:stopAllActions()
		else
			arg_10_0.view.widgets.time:setString(tool.getFormatTime(user.startTime))

			if not arg_10_0.haveShowEffect and user.startTime < 8000 then
				arg_10_0.haveShowEffect = true

				arg_10_0:showEffectBegin()
			end
		end
	end))

	local var_10_10 = CCSequence:create(var_10_9)

	arg_10_0.view.widgets.time:runAction(CCRepeatForever:create(var_10_10))
	arg_10_0:refineLayout()
end

function var_0_1.ctor(arg_12_0, arg_12_1)
	rmgr.loadResource("res/ui/kfyz/move1.plist")

	arg_12_0.world = arg_12_1
	arg_12_0.view = {}

	swallowTouch(arg_12_0)
	arg_12_0:setVisible(false)
	uiutil.initWidgets(arg_12_0.view, arg_12_0.layout)
	arg_12_0:addChild(arg_12_0.view.widgets.panel, 100)
	uiutil.initWidgets(arg_12_0.view, arg_12_0.layout_npc)
	arg_12_0:addChild(arg_12_0.view.widgets.node_npc, 200)

	local var_12_0 = CCSpriteBatchNode:create("res/ui/world/worldBuilding.png", 1500)

	var_12_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 + 40))
	arg_12_0:addChild(var_12_0, 0)

	local var_12_1 = {
		ccp(-400, 260),
		ccp(-180, 0),
		ccp(-560, -130),
		ccp(-340, -390),
		ccp(260, 260),
		ccp(450, 120),
		ccp(300, -120),
		ccp(340, -360)
	}

	for iter_12_0 = 1, 8 do
		local var_12_2 = CCSprite:createWithSpriteFrameName("worldForg.png")

		var_12_2:setPosition(var_12_1[iter_12_0])
		var_12_0:addChild(var_12_2)

		arg_12_0.view.widgets["fog" .. iter_12_0] = var_12_2
	end

	arg_12_0.view.widgets.npc4:setFlipX(true)

	for iter_12_1 = 1, 8 do
		local var_12_3 = iter_12_1 <= 4

		arg_12_0.view.widgets["npc" .. iter_12_1]:setPositionX((var_12_3 and -1 or 1) * (visibleSize.width / 2 + 250))
	end

	arg_12_0.view.widgets.horse2:setFlipX(true)

	for iter_12_2 = 1, 2 do
		arg_12_0.view.widgets["horse" .. iter_12_2]:runAction(CCRepeatForever:create(var_0_2("kfyz_move400%02d.png", 7, 0.05)))
	end

	arg_12_0:refresh()
end

function var_0_1.onEnter(arg_13_0)
	function arg_13_0.attStart1Ref()
		eventManager.dispatchEvent("npcMove", 2)
	end

	function arg_13_0.attStart2Ref()
		eventManager.dispatchEvent("moveToCity", 105, true, false, 0.5)
	end

	function arg_13_0.defStart1Ref()
		eventManager.dispatchEvent("npcMove", 2)
	end

	function arg_13_0.defStart2Ref()
		local var_17_0 = {
			123,
			19,
			207
		}

		eventManager.dispatchEvent("moveToCity", var_17_0[user.player.forceId], true, false, 0.5)
	end

	function arg_13_0.kfyz_dongying1Ref()
		eventManager.dispatchEvent("moveToCity", 4002, true, false, 0.5)
	end

	function arg_13_0.kfyz_dongying2Ref()
		eventManager.dispatchEvent("moveToCity", 4012, true, false, 0.5)
	end

	function arg_13_0.kfyz_dongying3Ref()
		eventManager.dispatchEvent("moveToCity", 4020, true, false, 0.5)
	end

	function arg_13_0.kfyz_dongying4Ref()
		eventManager.dispatchEvent("moveToCity", 4044, true, false, 0.5)
	end

	function arg_13_0.kfyz_dongying5Ref()
		eventManager.dispatchEvent("moveToCity", 4012, true, false, 0.5)
	end

	function arg_13_0.kfyz_dongying6Ref()
		eventManager.dispatchEvent("moveToCity", 4002, true, false, 0.5)
	end

	function arg_13_0.kfyz_korea1Ref()
		eventManager.dispatchEvent("moveToCity", 5046, true, false, 0.5)
	end

	function arg_13_0.kfyz_korea2Ref()
		eventManager.dispatchEvent("moveToCity", 5028, true, false, 0.5)
	end

	function arg_13_0.kfyz_korea3Ref()
		eventManager.dispatchEvent("moveToCity", 5001, true, false, 0.5)
	end

	eventManager.registerEvent("kfyz_att_start1", arg_13_0.attStart1Ref)
	eventManager.registerEvent("kfyz_att_start2", arg_13_0.attStart2Ref)
	eventManager.registerEvent("kfyz_def_start1", arg_13_0.defStart1Ref)
	eventManager.registerEvent("kfyz_def_start2", arg_13_0.defStart2Ref)
	eventManager.registerEvent("kfyz_dongying1", arg_13_0.kfyz_dongying1Ref)
	eventManager.registerEvent("kfyz_dongying2", arg_13_0.kfyz_dongying2Ref)
	eventManager.registerEvent("kfyz_dongying3", arg_13_0.kfyz_dongying3Ref)
	eventManager.registerEvent("kfyz_dongying4", arg_13_0.kfyz_dongying4Ref)
	eventManager.registerEvent("kfyz_dongying5", arg_13_0.kfyz_dongying5Ref)
	eventManager.registerEvent("kfyz_dongying6", arg_13_0.kfyz_dongying6Ref)
	eventManager.registerEvent("kfyz_korea1", arg_13_0.kfyz_korea1Ref)
	eventManager.registerEvent("kfyz_korea2", arg_13_0.kfyz_korea2Ref)
	eventManager.registerEvent("kfyz_korea3", arg_13_0.kfyz_korea3Ref)
end

function var_0_1.onExit(arg_27_0)
	eventManager.unregisterEvent("kfyz_att_start1", arg_27_0.attStart1Ref)
	eventManager.unregisterEvent("kfyz_att_start2", arg_27_0.attStart2Ref)
	eventManager.unregisterEvent("kfyz_def_start1", arg_27_0.defStart1Ref)
	eventManager.unregisterEvent("kfyz_def_start2", arg_27_0.defStart2Ref)
	eventManager.unregisterEvent("kfyz_dongying1", arg_27_0.kfyz_dongying1Ref)
	eventManager.unregisterEvent("kfyz_dongying2", arg_27_0.kfyz_dongying2Ref)
	eventManager.unregisterEvent("kfyz_dongying3", arg_27_0.kfyz_dongying3Ref)
	eventManager.unregisterEvent("kfyz_dongying4", arg_27_0.kfyz_dongying4Ref)
	eventManager.unregisterEvent("kfyz_dongying5", arg_27_0.kfyz_dongying5Ref)
	eventManager.unregisterEvent("kfyz_dongying6", arg_27_0.kfyz_dongying6Ref)
	eventManager.unregisterEvent("kfyz_korea1", arg_27_0.kfyz_korea1Ref)
	eventManager.unregisterEvent("kfyz_korea2", arg_27_0.kfyz_korea2Ref)
	eventManager.unregisterEvent("kfyz_korea3", arg_27_0.kfyz_korea3Ref)
end

function var_0_1.refineLayout(arg_28_0)
	arg_28_0.view.widgets.frd_att:setAnchorPoint(ccp(0, 0.5))
	arg_28_0.view.widgets.frd_att:setPositionX(arg_28_0.view.widgets.force_att:getPositionX() + arg_28_0.view.widgets.force_att:getContentSize().width / 2 * arg_28_0.view.widgets.force_att:getScale())
	arg_28_0.view.widgets.num_att:setPositionX(arg_28_0.view.widgets.frd_att:getPositionX() + arg_28_0.view.widgets.frd_att:getContentSize().width)
	arg_28_0.view.widgets.tally_att:setAnchorPoint(ccp(0, 0.5))
	arg_28_0.view.widgets.tally_att:setPositionX(arg_28_0.view.widgets.num_att:getPositionX() + arg_28_0.view.widgets.num_att:getContentSize().width * arg_28_0.view.widgets.num_att:getScale())

	for iter_28_0 = 1, 3 do
		arg_28_0.view.widgets["frd_def" .. iter_28_0]:setAnchorPoint(ccp(0, 0.5))
		arg_28_0.view.widgets["frd_def" .. iter_28_0]:setPositionX(arg_28_0.view.widgets["force_def" .. iter_28_0]:getPositionX() + arg_28_0.view.widgets["force_def" .. iter_28_0]:getContentSize().width / 2 * arg_28_0.view.widgets["force_def" .. iter_28_0]:getScale())
		arg_28_0.view.widgets["num_def" .. iter_28_0]:setPositionX(arg_28_0.view.widgets["frd_def" .. iter_28_0]:getPositionX() + arg_28_0.view.widgets["frd_def" .. iter_28_0]:getContentSize().width)
	end
end

return var_0_1
