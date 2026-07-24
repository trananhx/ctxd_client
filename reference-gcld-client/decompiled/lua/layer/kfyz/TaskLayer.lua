local var_0_0 = require("res/native/offset").get("layer.kfyz.task")
local var_0_1 = 9999
local var_0_2 = tool.hexToRgb("#ECDEA7")
local var_0_3 = ccc3(0, 180, 0)
local var_0_4 = colorQuality[5]
local var_0_5 = colorQuality[4]
local var_0_6 = colorQuality[2]
local var_0_7 = {
	[25] = 55,
	[10] = 6,
	[4] = 4,
	[17] = 7,
	[146] = 10052,
	[218] = 218,
	[13] = 10001
}
local var_0_8 = class("kfyzTaskLayer", function()
	return createBaseLayer()
end)

var_0_8.layout = {
	name = "panel",
	type = "sprite9",
	preferedSize = CCSizeMake(915, 532),
	middleRect = CCRectMake(10, 10, 70, 70),
	x = visibleSize.width / 2,
	y = visibleSize.height / 2 - 30,
	pic = {
		path = "res/ui/common/panel/comm_view.png"
	},
	children = {
		{
			y = 480,
			x = 458,
			type = "sprite",
			pic = {
				path = "res/ui/kfyz/kfyz_title.png"
			}
		},
		{
			y = 455,
			x = 458,
			type = "sprite",
			pic = {
				path = "res/ui/general/jailView/comm_list_laofang_3.png"
			}
		},
		{
			y = 270,
			type = "sprite",
			x = 180,
			pic = {
				frame = true,
				path = "nationMap.png"
			},
			children = {
				{
					visible = false,
					name = "wei_part",
					y = 137,
					type = "sprite",
					x = 153,
					pic = {
						path = "res/ui/kfyz/invest/yzxms_s_map_wei.png"
					}
				},
				{
					visible = false,
					name = "shu_part",
					y = 137,
					type = "sprite",
					x = 153,
					pic = {
						path = "res/ui/kfyz/invest/yzxms_s_map_shu.png"
					}
				},
				{
					visible = false,
					name = "wu_part",
					y = 137,
					type = "sprite",
					x = 153,
					pic = {
						path = "res/ui/kfyz/invest/yzxms_s_map_wu.png"
					}
				},
				{
					visible = false,
					name = "yuanzheng_icon",
					x = 150,
					type = "sprite",
					y = 120,
					scale = 0.5,
					pic = {
						path = "res/ui/kfyz/invest/kfyz_map_icon_yuanzheng.png"
					}
				},
				{
					visible = false,
					name = "yuanzheng1_icon",
					x = 205,
					type = "sprite",
					y = 140,
					scale = 0.5,
					pic = {
						path = "res/ui/kfyz/invest/kfyz_map_icon_yuanzheng.png"
					}
				},
				{
					visible = false,
					name = "yuanzheng2_icon",
					x = 100,
					type = "sprite",
					y = 160,
					scale = 0.5,
					pic = {
						path = "res/ui/kfyz/invest/kfyz_map_icon_yuanzheng.png"
					}
				},
				{
					visible = false,
					name = "yuanzheng3_icon",
					x = 140,
					type = "sprite",
					y = 80,
					scale = 0.5,
					pic = {
						path = "res/ui/kfyz/invest/kfyz_map_icon_yuanzheng.png"
					}
				},
				{
					visible = false,
					name = "wei_icon",
					x = 190,
					type = "sprite",
					y = 180,
					scale = 0.5,
					pic = {
						path = "res/ui/kfyz/invest/kfyz_map_icon_wei.png"
					}
				},
				{
					visible = false,
					name = "shu_icon",
					x = 80,
					type = "sprite",
					y = 110,
					scale = 0.5,
					pic = {
						path = "res/ui/kfyz/invest/kfyz_map_icon_shu.png"
					}
				},
				{
					visible = false,
					name = "wu_icon",
					x = 200,
					type = "sprite",
					y = 90,
					scale = 0.5,
					pic = {
						path = "res/ui/kfyz/invest/kfyz_map_icon_wu.png"
					}
				},
				{
					visible = false,
					name = "arrow1",
					x = 160,
					type = "sprite",
					y = 130,
					scale = 0.8,
					anchorPoint = ccp(1, 0.5),
					pic = {
						path = "res/ui/kfyz/invest/kfyz_map_arrows.png"
					}
				},
				{
					visible = false,
					name = "arrow2",
					x = 135,
					type = "sprite",
					y = 120,
					scale = 0.8,
					anchorPoint = ccp(1, 0.5),
					pic = {
						path = "res/ui/kfyz/invest/kfyz_map_arrows.png"
					}
				},
				{
					visible = false,
					name = "arrow3",
					x = 150,
					type = "sprite",
					y = 110,
					scale = 0.8,
					anchorPoint = ccp(1, 0.5),
					pic = {
						path = "res/ui/kfyz/invest/kfyz_map_arrows.png"
					}
				},
				{
					visible = false,
					name = "arrow4",
					x = 205,
					type = "sprite",
					y = 140,
					scale = 0.8,
					anchorPoint = ccp(1, 0.5),
					pic = {
						path = "res/ui/kfyz/invest/kfyz_map_arrows.png"
					}
				},
				{
					visible = false,
					name = "arrow5",
					x = 100,
					type = "sprite",
					y = 160,
					scale = 0.8,
					anchorPoint = ccp(1, 0.5),
					pic = {
						path = "res/ui/kfyz/invest/kfyz_map_arrows.png"
					}
				},
				{
					visible = false,
					name = "arrow6",
					x = 140,
					type = "sprite",
					y = 80,
					scale = 0.8,
					anchorPoint = ccp(1, 0.5),
					pic = {
						path = "res/ui/kfyz/invest/kfyz_map_arrows.png"
					}
				}
			}
		},
		{
			scale = 0.8,
			type = "sprite9",
			y = 15,
			x = 0,
			preferedSize = CCSizeMake(500, 130),
			middleRect = CCRectMake(10, 20, 569, 142),
			anchorPoint = ccp(0, 0),
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_jl_bg.png"
			},
			children = {
				{
					y = 95,
					name = "city0",
					type = "sprite",
					x = 50,
					pic = {
						path = "res/ui/kfyz/invest/kfyz_map_icon_yuanzheng.png"
					},
					children = {
						{
							y = 20,
							x = 38,
							type = "sprite",
							pic = {
								path = "res/ui/kfyz/invest/kfyz_word_yuanzheng.png"
							}
						},
						{
							name = "frd0",
							type = "sprite",
							x = 65 + (var_0_0.frdX or 0),
							y = 25 + (var_0_0.frdY or 0),
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
							}
						},
						{
							name = "mine0",
							type = "atlaslabel",
							pic = "res/ui/common/number/yyyz_word_frd_digit.png",
							startCharMap = 48,
							text = "0",
							itemWidth = 18,
							itemHeight = 26,
							x = 160 + (var_0_0.mineX or 0),
							y = 25 + (var_0_0.mineY or 0),
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					y = 45,
					name = "city1",
					type = "sprite",
					x = 50,
					pic = {
						path = "res/ui/kfyz/invest/kfyz_map_icon_wei.png"
					},
					children = {
						{
							fontSize = 25,
							name = "nationName1",
							y = 20,
							type = "label",
							style = "label_warlock",
							x = 38
						},
						{
							name = "frd1",
							type = "sprite",
							x = 65 + (var_0_0.frdX or 0),
							y = 25 + (var_0_0.frdY or 0),
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
							}
						},
						{
							name = "mine1",
							type = "atlaslabel",
							pic = "res/ui/common/number/yyyz_word_frd_digit.png",
							startCharMap = 48,
							text = "0",
							itemWidth = 18,
							itemHeight = 26,
							x = 160 + (var_0_0.mineX or 0),
							y = 25 + (var_0_0.mineY or 0),
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					y = 95,
					name = "city2",
					type = "sprite",
					x = 280,
					pic = {
						path = "res/ui/kfyz/invest/kfyz_map_icon_shu.png"
					},
					children = {
						{
							fontSize = 25,
							name = "nationName2",
							y = 20,
							type = "label",
							style = "label_warlock",
							x = 38
						},
						{
							name = "frd2",
							type = "sprite",
							x = 65 + (var_0_0.frdX or 0),
							y = 25 + (var_0_0.frdY or 0),
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
							}
						},
						{
							name = "mine2",
							type = "atlaslabel",
							pic = "res/ui/common/number/yyyz_word_frd_digit.png",
							startCharMap = 48,
							text = "0",
							itemWidth = 18,
							itemHeight = 26,
							x = 160 + (var_0_0.mineX or 0),
							y = 25 + (var_0_0.mineY or 0),
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					y = 45,
					name = "city3",
					type = "sprite",
					x = 280,
					pic = {
						path = "res/ui/kfyz/invest/kfyz_map_icon_wu.png"
					},
					children = {
						{
							fontSize = 25,
							name = "nationName3",
							y = 20,
							type = "label",
							style = "label_warlock",
							x = 38
						},
						{
							name = "frd3",
							type = "sprite",
							x = 65 + (var_0_0.frdX or 0),
							y = 25 + (var_0_0.frdY or 0),
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
							}
						},
						{
							name = "mine3",
							type = "atlaslabel",
							pic = "res/ui/common/number/yyyz_word_frd_digit.png",
							startCharMap = 48,
							text = "0",
							itemWidth = 18,
							itemHeight = 26,
							x = 160 + (var_0_0.mineX or 0),
							y = 25 + (var_0_0.mineY or 0),
							anchorPoint = ccp(0, 0.5)
						}
					}
				}
			}
		},
		{
			y = 420,
			type = "sprite9",
			x = 390,
			preferedSize = CCSizeMake(565, 100),
			middleRect = CCRectMake(280, 20, 5, 28),
			anchorPoint = ccp(0, 1),
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_small_bg.png"
			}
		},
		{
			y = 330,
			type = "sprite9",
			x = 350,
			preferedSize = CCSizeMake(589, 320),
			middleRect = CCRectMake(290, 50, 9, 112),
			anchorPoint = ccp(0, 1),
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_jl_bg.png"
			}
		},
		{
			fontSize = 25,
			name = "txt1",
			visible = false,
			type = "label",
			width = 400,
			textId = 390462,
			height = 0,
			y = 375,
			x = 430,
			anchorPoint = ccp(0, 0.5),
			color = var_0_2,
			halign = kCCTextAlignmentLeft
		},
		{
			y = 390,
			x = 390,
			type = "sprite",
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_icon01.png"
			}
		},
		{
			y = 300,
			x = 390,
			type = "sprite",
			pic = {
				path = "res/ui/nationTask/newPic/rwyh_icon03.png"
			}
		},
		{
			fontSize = 25,
			name = "txt2",
			visible = false,
			type = "label",
			textId = 390510,
			y = 310,
			x = 430,
			anchorPoint = ccp(0, 1),
			color = var_0_2
		},
		{
			fontSize = 25,
			name = "txt3",
			visible = false,
			type = "label",
			textId = 390511,
			y = 215,
			x = 430,
			anchorPoint = ccp(0, 1),
			color = var_0_2
		},
		{
			fontSize = 25,
			name = "txt4",
			visible = false,
			type = "label",
			textId = 390508,
			y = 120,
			x = 430,
			anchorPoint = ccp(0, 1),
			color = var_0_2
		},
		{
			type = "node",
			name = "node_reward"
		},
		{
			visible = false,
			name = "btn_reward",
			h = 56,
			type = "button",
			w = 180,
			y = 60,
			x = 800,
			normal = {
				path = "res/ui/common/button/sdyjs_btn_03.png"
			},
			touched = {
				path = "res/ui/common/button/sdyjs_btn_03_c.png"
			},
			children = {
				{
					fontSize = 25,
					style = "label_warlock",
					y = 33,
					type = "label",
					x = 90,
					textId = 92013,
					color = var_0_2
				}
			}
		},
		{
			y = 200,
			name = "bg_tally",
			visible = false,
			type = "sprite",
			x = 458,
			pic = {
				path = "res/ui/world/cityCombo/lxzc_bg4.png"
			},
			children = {
				{
					x = 320,
					name = "tally",
					y = 65,
					type = "sprite",
					scale = 1.2,
					pic = {
						path = "res/ui/kfyz/wait/icon_hf1.png"
					}
				},
				{
					y = 65,
					x = 320,
					type = "sprite",
					pic = {
						path = "res/ui/kfyz/wait/kfyz_seal_get.png"
					}
				},
				{
					y = 85,
					name = "name",
					type = "sprite",
					x = 370,
					anchorPoint = ccp(0, 0.5),
					pic = {
						path = "res/default.png"
					}
				},
				{
					fontSize = 25,
					name = "info",
					y = 33,
					type = "label",
					x = 390,
					anchorPoint = ccp(0, 0.5),
					color = var_0_2
				}
			}
		}
	}
}
var_0_8.rewardItem = {
	name = "bg",
	type = "sprite",
	anchorPoint = ccp(0.5, 1),
	pic = {
		path = "res/ui/task/get_rewa_icon.jpg"
	},
	children = {
		{
			y = 42,
			name = "icon",
			type = "sprite",
			x = 35,
			zorder = 100,
			pic = {
				path = "res/ui/task/bintie.png"
			}
		},
		{
			y = 22,
			name = "txt",
			type = "sprite",
			x = 35,
			zorder = 200,
			pic = {
				path = "res/ui/task/get_rewa_iron.png"
			}
		},
		{
			fontSize = 23,
			name = "num",
			y = 0,
			type = "label",
			x = 35,
			anchorPoint = ccp(0.5, 1),
			color = var_0_2
		}
	}
}

function var_0_8.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		local var_3_0

		if user.kfyzState == 2 then
			var_3_0 = arg_3_0.action.data
		else
			var_3_0 = arg_3_0.data
		end

		arg_2_0:showPanel(var_3_0)
	end

	if user.kfyzState == 2 then
		cmgr.sendRequest(var_2_0, actions.kfyzGetTaskRewardInfo)
	else
		kfcmgr.sendRequest(var_2_0, actions.kfyzGetTaskInfo)
	end
end

function var_0_8.onGetTaskReward(arg_4_0)
	local function var_4_0(arg_5_0)
		arg_4_0:refresh()

		local var_5_0 = {}

		for iter_5_0, iter_5_1 in pairs(arg_5_0.action.data.rewards) do
			local var_5_1 = {
				id = var_0_7[iter_5_1.type],
				value = iter_5_1.value
			}

			table.insert(var_5_0, var_5_1)
		end

		globalAction_gotResource(var_5_0)
	end

	cmgr.sendRequest(var_4_0, actions.kfyzGetTaskReward)
end

function var_0_8.showPanel(arg_6_0, arg_6_1)
	arg_6_0.info = arg_6_1

	if user.kfyzWorldId == 5 then
		local var_6_0 = {
			95016,
			95017,
			95018
		}

		for iter_6_0 = 1, 3 do
			arg_6_1["nationName" .. iter_6_0] = language.get(var_6_0[iter_6_0])
		end
	end

	local var_6_1 = arg_6_1.nationNames or arg_6_1.nationInfos

	if user.kfyzWorldId == 9 or arg_6_1.rewards and #arg_6_1.rewards == 1 then
		for iter_6_1, iter_6_2 in pairs(var_6_1) do
			if iter_6_2.forceId == user.player.kfgzForceId or user.player.kfgzForceId == nil then
				local var_6_2 = math.mod(tonumber(iter_6_2.forceId), 1000)

				arg_6_0.view.widgets["arrow" .. var_6_2 + 3]:setVisible(true)
				arg_6_0.view.widgets["yuanzheng" .. var_6_2 .. "_icon"]:setVisible(true)

				if var_6_2 == 1 then
					arg_6_0.view.widgets.wei_icon:setVisible(true)
					arg_6_0.view.widgets.wei_part:setVisible(true)
				elseif var_6_2 == 2 then
					arg_6_0.view.widgets.shu_icon:setVisible(true)
					arg_6_0.view.widgets.shu_part:setVisible(true)
				else
					arg_6_0.view.widgets.wu_icon:setVisible(true)
					arg_6_0.view.widgets.wu_part:setVisible(true)
				end
			end
		end
	else
		for iter_6_3 = 1, 3 do
			if arg_6_0.view.widgets["arrow" .. iter_6_3] then
				arg_6_0.view.widgets["arrow" .. iter_6_3]:setVisible(true)
			end
		end

		arg_6_0.view.widgets.yuanzheng_icon:setVisible(true)
		arg_6_0.view.widgets.wei_icon:setVisible(true)
		arg_6_0.view.widgets.shu_icon:setVisible(true)
		arg_6_0.view.widgets.wu_icon:setVisible(true)
	end

	local function var_6_3(arg_7_0, arg_7_1)
		return arg_7_0.forceId < arg_7_1.forceId
	end

	if arg_6_1.nationNames and arg_6_1.mines then
		table.sort(arg_6_1.nationNames, var_6_3)
		table.sort(arg_6_1.mines, var_6_3)

		for iter_6_4, iter_6_5 in pairs(arg_6_1.nationNames) do
			if arg_6_0.view.widgets["nationName" .. iter_6_4] then
				if type(iter_6_5.nationName) == "userdata" then
					arg_6_0.view.widgets["nationName" .. iter_6_4]:setString("NPC")
				else
					arg_6_0.view.widgets["nationName" .. iter_6_4]:setString(language.get(460037, iter_6_5.nationName))
				end
			end
		end

		for iter_6_6, iter_6_7 in pairs(arg_6_1.mines) do
			if arg_6_0.view.widgets["mine" .. iter_6_6] then
				arg_6_0.view.widgets["mine" .. iter_6_6]:setString(language.get(460037, iter_6_7.forceMine))
			elseif user.kfyzWorldId ~= 9 and iter_6_7.forceId > 1000 then
				arg_6_0.view.widgets.mine0:setString(language.get(460037, iter_6_7.forceMine))
			elseif user.kfyzWorldId == 9 and (iter_6_7.forceId == user.player.kfgzForceId or iter_6_7.forceId - 1000 == user.player.kfgzForceId) then
				arg_6_0.view.widgets.mine0:setString(language.get(460037, iter_6_7.forceMine))
			end
		end
	end

	local var_6_4 = arg_6_1.attType == 1

	arg_6_0.view.widgets.btn_reward:setVisible(arg_6_1.canGotRewards and user.kfyzState == 2)
	arg_6_0.view.widgets.node_reward:removeAllChildrenWithCleanup(true)

	if var_6_4 then
		if user.kfyzWorldId == 9 or arg_6_1.rewards and #arg_6_1.rewards == 1 then
			arg_6_0.view.widgets.txt1:setString(language.get(390475))

			if user.isSoldiersThreeRoad and var_6_1 then
				arg_6_0.view.widgets.txt1:setString(language.get(215222, var_6_1[1].nationName))

				if user.player.kfgzForceId == nil then
					user.player.kfgzForceId = var_6_1[2].forceId
				end
			end

			if user.player.kfgzForceId == 1001 then
				arg_6_0.view.widgets.txt2:setString(language.get(390506))
			elseif user.player.kfgzForceId == 1002 then
				arg_6_0.view.widgets.txt2:setString(language.get(390507))
			else
				arg_6_0.view.widgets.txt2:setString(language.get(390508))
			end

			arg_6_0.view.widgets.txt1:setVisible(true)
			arg_6_0.view.widgets.txt2:setVisible(true)
		else
			for iter_6_8 = 1, 3 do
				local var_6_5 = {
					390475,
					390506,
					390507
				}

				arg_6_0.view.widgets["txt" .. iter_6_8]:setString(language.get(var_6_5[iter_6_8]))
			end

			arg_6_0.view.widgets.txt4:setVisible(true)

			for iter_6_9 = 1, 3 do
				arg_6_0.view.widgets["txt" .. iter_6_9]:setVisible(true)
			end
		end
	else
		for iter_6_10 = 1, 3 do
			arg_6_0.view.widgets["txt" .. iter_6_10]:setVisible(true)
		end
	end

	local var_6_6 = {
		[25] = "silk",
		[10] = "exp",
		[4] = "iron",
		[17] = "gem",
		[146] = "gxczlsp",
		[218] = "zctz",
		[13] = "gongxun",
		[var_0_1] = "mine"
	}

	local function var_6_7(arg_8_0, arg_8_1)
		return arg_8_0.targetForceId < arg_8_1.targetForceId
	end

	table.sort(arg_6_1.rewards, var_6_7)

	for iter_6_11, iter_6_12 in ipairs(arg_6_1.rewards) do
		if not var_6_4 and (#arg_6_1.rewards ~= 4 or iter_6_12.targetForceId == user.player.forceId or iter_6_12.targetForceId > 1000) or var_6_4 and iter_6_12.targetForceId < 1000 then
			local var_6_8
			local var_6_9 = 310 - 95 * (iter_6_11 - 1)

			if iter_6_12.mineRewards and iter_6_12.mineRewards > 0 then
				table.insert(iter_6_12.subRewards, {
					type = var_0_1,
					value = iter_6_12.mineRewards
				})
			end

			for iter_6_13, iter_6_14 in ipairs(iter_6_12.subRewards) do
				local var_6_10 = 590 + 90 * (iter_6_13 - 1)
				local var_6_11 = {}

				uiutil.initWidgets(var_6_11, arg_6_0.rewardItem)
				var_6_11.widgets.bg:setPosition(ccp(var_6_10, var_6_9))
				arg_6_0.view.widgets.node_reward:addChild(var_6_11.widgets.bg)
				var_6_11.widgets.icon:setDisplayFrame(CCSprite:create(string.format("res/ui/task/get_icon_%s.png", var_6_6[iter_6_14.type])):displayFrame())
				var_6_11.widgets.txt:setDisplayFrame(CCSprite:create(string.format("res/ui/task/get_rewa_%s.png", var_6_6[iter_6_14.type])):displayFrame())
				var_6_11.widgets.num:setString(tool.getFormatNum(iter_6_14.value))

				if iter_6_14.type == var_0_1 then
					local var_6_12 = CCSprite:createWithSpriteFrameName("xzymz_jb_gj.png")

					var_6_12:setAnchorPoint(ccp(0, 1))
					var_6_12:setPosition(0, 70)
					var_6_12:setScale(0.8)
					var_6_11.widgets.bg:addChild(var_6_12, 300)
				end

				if not iter_6_12.selfRankFlag then
					tool.spriteToGray(var_6_11.widgets.bg, true)
				end
			end

			if iter_6_12.finished then
				local var_6_13 = CCSprite:create("res/ui/task/finish.png")

				var_6_13:setAnchorPoint(ccp(0, 0.5))
				var_6_13:setPosition(ccp(675, var_6_9 - 25))
				arg_6_0.view.widgets.node_reward:addChild(var_6_13, 100)
			end
		end
	end

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD and not user.isInSd and arg_6_1.nowTally and arg_6_1.orignTally and arg_6_1.nowTally > 0 and arg_6_1.nowTally ~= arg_6_1.orignTally then
		rmgr.setTallyPic(arg_6_1.nowTally, arg_6_0.view.widgets.tally)

		local var_6_14 = {
			390545,
			390546,
			390547,
			390548
		}

		arg_6_0.view.widgets.name:setDisplayFrame(CCSprite:create(string.format("res/ui/kfyz/wait/kfyz_word_hf%s.png", arg_6_1.nowTally)):displayFrame())
		arg_6_0.view.widgets.info:setString(language.get(var_6_14[arg_6_1.nowTally]))
		arg_6_0.view.widgets.bg_tally:setPositionY(200)
		arg_6_0.view.widgets.bg_tally:setVisible(true)

		local var_6_15 = CCArray:create()

		var_6_15:addObject(CCEaseSineInOut:create(CCMoveBy:create(0.5, ccp(0, 100))))
		var_6_15:addObject(CCDelayTime:create(1.5))
		var_6_15:addObject(CCHide:create())
		arg_6_0.view.widgets.bg_tally:runAction(CCSequence:create(var_6_15))
	end
end

function var_0_8.ctor(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.view = {}

	uiutil.initWidgets(arg_9_0.view, arg_9_0.layout)
	arg_9_0:addChild(arg_9_0.view.widgets.panel)

	if arg_9_1 then
		arg_9_1:addChild(arg_9_0)
	end

	local var_9_0 = {
		134,
		0,
		-140,
		80,
		-60,
		180
	}

	for iter_9_0 = 1, 6 do
		if arg_9_0.view.widgets["arrow" .. iter_9_0] then
			arg_9_0.view.widgets["arrow" .. iter_9_0]:setRotation(var_9_0[iter_9_0])
		end
	end

	arg_9_0.view.widgets.btn_reward:addHandleOfControlEvent(function()
		arg_9_0:onGetTaskReward()
	end, CCControlEventTouchUpInside)

	if arg_9_2 then
		arg_9_0:showPanel(arg_9_2)
	else
		arg_9_0:refresh()
	end
end

function var_0_8.onEnter(arg_11_0)
	function arg_11_0.kfyzStateChgRef()
		arg_11_0:refresh()
	end

	eventManager.registerEvent("kfyzStateChg", arg_11_0.kfyzStateChgRef)
end

function var_0_8.onExit(arg_13_0)
	eventManager.unregisterEvent("kfyzStateChg", arg_13_0.kfyzStateChgRef)
end

return var_0_8
