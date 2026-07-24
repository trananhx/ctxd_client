local var_0_0 = {
	[144] = 144,
	[102] = 41,
	[238] = 238,
	[50] = 10034,
	[3] = 3,
	[51] = 10035,
	[239] = 239,
	[132] = 10057
}
local var_0_1 = {
	"res/ui/task/get_icon_food.png",
	"res/ui/world/feud/sbxt_btn_hy.png",
	"res/ui/world/feud/sbxt_btn_zs.png",
	"res/ui/world/feud/sbxt_btn_nj.png",
	"res/ui/world/feud/sbxt_btn_caiji.png",
	[2002] = "res/ui/world/speicalCity/tscc_hy_xz.png",
	[2001] = "res/ui/world/speicalCity/tscc_hy_tj.png",
	[2004] = "res/ui/world/speicalCity/tscc_hy_jl.png",
	[2003] = "res/ui/world/speicalCity/tscc_hy_hb.png"
}
local var_0_2 = {
	"res/ui/world/feud/sbxt_btn_word_nl.png",
	"res/ui/world/feud/sbxt_btn_word_zb.png",
	"res/ui/world/feud/sbxt_btn_word_zs.png",
	"res/ui/world/feud/sbxt_btn_word_nj.png",
	"res/ui/world/feud/sbxt_btn_word_caiji.png",
	[2002] = "res/ui/world/speicalCity/tscc_hy_word_xz.png",
	[2001] = "res/ui/world/speicalCity/tscc_hy_word_tj.png",
	[2004] = "res/ui/world/speicalCity/tscc_hy_word_jl.png",
	[2003] = "res/ui/world/speicalCity/tscc_hy_word_hb.png"
}
local var_0_3 = tool.hexToRgb("#D9EDC5")
local var_0_4 = ccc3(0, 180, 0)
local var_0_5 = colorQuality[5]
local var_0_6 = colorQuality[4]
local var_0_7 = colorQuality[2]
local var_0_8 = class("FeudMenu", function()
	return CCNode:create()
end)

var_0_8.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			zoomOnTouchDown = true,
			name = "btn_flag",
			h = 130,
			type = "button",
			w = 40,
			y = -20,
			visible = false,
			x = -60,
			normal = {
				path = "res/default.png"
			},
			touched = {
				path = "res/default.png"
			},
			children = {
				{
					x = 20,
					name = "flag",
					y = 85,
					type = "sprite",
					scale = 0.7
				},
				{
					text = "大熊",
					name = "name",
					height = 25,
					type = "label",
					fontSize = 25,
					x = 20,
					width = 40,
					y = 100
				}
			}
		},
		{
			type = "node",
			name = "node_select",
			x = 0,
			visible = false,
			y = 90,
			scale = 0.8,
			children = {
				{
					y = 0,
					name = "bg",
					type = "sprite9",
					x = 0,
					preferedSize = CCSizeMake(440, 110),
					middleRect = CCRectMake(200, 20, 32, 129),
					pic = {
						path = "res/ui/world/buildNation/jgdy_jzys_d.png"
					}
				},
				{
					y = 70,
					name = "title",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/world/feud/sbxt_w_word_qxznzcl.png"
					}
				},
				{
					y = 0,
					name = "preBtn",
					h = 72,
					type = "button",
					w = 96,
					visible = false,
					x = -250,
					normal = {
						path = "res/ui/world/speicalCity/tscc_arrow_l.png"
					},
					touched = {
						path = "res/ui/world/speicalCity/tscc_arrow_l_c.png"
					}
				},
				{
					y = 0,
					name = "nextBtn",
					h = 72,
					type = "button",
					w = 96,
					visible = false,
					x = 250,
					normal = {
						path = "res/ui/world/speicalCity/tscc_arrow_r.png"
					},
					touched = {
						path = "res/ui/world/speicalCity/tscc_arrow_r_c.png"
					}
				},
				{
					name = "btn1",
					h = 72,
					type = "button",
					w = 73,
					y = 0,
					x = -150,
					normal = {
						path = "res/ui/resourceArea2/zcgz_btn_round.png"
					},
					touched = {
						path = "res/ui/resourceArea2/zcgz_btn_round_c.png"
					},
					children = {
						{
							y = 36,
							name = "icon1",
							type = "sprite",
							x = 36,
							pic = {
								path = "res/ui/task/get_icon_food.png"
							}
						},
						{
							y = 10,
							name = "word1",
							type = "sprite",
							x = 36,
							pic = {
								path = "res/ui/world/feud/sbxt_btn_word_nl.png"
							}
						}
					}
				},
				{
					name = "btn2",
					h = 72,
					type = "button",
					w = 73,
					y = 0,
					x = -50,
					normal = {
						path = "res/ui/resourceArea2/zcgz_btn_round.png"
					},
					touched = {
						path = "res/ui/resourceArea2/zcgz_btn_round_c.png"
					},
					children = {
						{
							y = 36,
							name = "icon2",
							type = "sprite",
							x = 36,
							pic = {
								path = "res/ui/world/feud/sbxt_btn_hy.png"
							}
						},
						{
							y = 10,
							name = "word2",
							type = "sprite",
							x = 36,
							pic = {
								path = "res/ui/world/feud/sbxt_btn_word_zb.png"
							}
						}
					}
				},
				{
					name = "btn3",
					h = 72,
					type = "button",
					w = 73,
					y = 0,
					x = 50,
					normal = {
						path = "res/ui/resourceArea2/zcgz_btn_round.png"
					},
					touched = {
						path = "res/ui/resourceArea2/zcgz_btn_round_c.png"
					},
					children = {
						{
							y = 36,
							name = "icon3",
							type = "sprite",
							x = 36,
							pic = {
								path = "res/ui/world/feud/sbxt_btn_zs.png"
							}
						},
						{
							y = 10,
							name = "word3",
							type = "sprite",
							x = 36,
							pic = {
								path = "res/ui/world/feud/sbxt_btn_word_zs.png"
							}
						}
					}
				},
				{
					name = "btn4",
					h = 72,
					type = "button",
					w = 73,
					y = 0,
					x = 150,
					normal = {
						path = "res/ui/resourceArea2/zcgz_btn_round.png"
					},
					touched = {
						path = "res/ui/resourceArea2/zcgz_btn_round_c.png"
					},
					children = {
						{
							y = 36,
							name = "icon4",
							type = "sprite",
							x = 36,
							pic = {
								path = "res/ui/world/feud/sbxt_btn_nj.png"
							}
						},
						{
							y = 10,
							name = "word4",
							type = "sprite",
							x = 36,
							pic = {
								path = "res/ui/world/feud/sbxt_btn_word_nj.png"
							}
						}
					}
				}
			}
		},
		{
			type = "node",
			name = "node_produce",
			y = 90,
			visible = false,
			x = 0,
			children = {
				{
					y = 0,
					name = "bg_produce",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/activity/fishing/hjcd_time_line.png"
					}
				},
				{
					fontSize = 20,
					name = "lbl_num",
					y = 0,
					type = "label",
					x = -95,
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = -32,
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/world/feud/sbxt_w_pb_d.png"
					},
					children = {
						{
							y = 12.5,
							name = "bar",
							type = "progressbar",
							x = 122.5,
							pic = {
								path = "res/ui/world/feud/sbxt_w_pb.png"
							}
						},
						{
							fontSize = 20,
							name = "time",
							y = 12.5,
							type = "label",
							x = 122.5
						}
					}
				},
				{
					x = -120,
					name = "btn_reward1",
					h = 72,
					type = "button",
					w = 73,
					y = 0,
					scale = 0.8,
					normal = {
						path = "res/ui/resourceArea2/zcgz_btn_round.png"
					},
					touched = {
						path = "res/ui/resourceArea2/zcgz_btn_round_c.png"
					},
					children = {
						{
							y = 36,
							name = "icon",
							type = "sprite",
							x = 36,
							pic = {
								path = "res/ui/task/get_icon_food.png"
							}
						},
						{
							fontSize = 25,
							name = "lbl_state",
							y = 0,
							type = "label",
							x = 36
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_cd",
					h = 36,
					type = "button",
					w = 42,
					y = -2,
					x = 100,
					normal = {
						path = "res/ui/world/feud/sjwc_icon_js_arrow.png"
					},
					touched = {
						path = "res/ui/world/feud/sjwc_icon_js_arrow.png"
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_worker",
					h = 52,
					type = "button",
					w = 52,
					y = -2,
					x = 140,
					normal = {
						path = "res/ui/world/feud/sjwc_btn_chuizi.png"
					},
					touched = {
						path = "res/ui/world/feud/sjwc_btn_chuizi_c.png"
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_worker2",
					h = 52,
					type = "button",
					w = 52,
					y = -2,
					visible = false,
					x = 140,
					normal = {
						path = "res/ui/world/feud/fd_btn_jsc.png"
					},
					touched = {
						path = "res/ui/world/feud/fd_btn_jsc_c.png"
					},
					children = {
						{
							fontSize = 25,
							name = "fdNumLb",
							y = 8,
							type = "label",
							x = 27
						}
					}
				}
			}
		},
		{
			y = 90,
			name = "btn_reward2",
			h = 118,
			type = "button",
			w = 123,
			visible = false,
			x = 0,
			normal = {
				path = "res/ui/world/feud/sbxt_btn_lqjl.png"
			},
			touched = {
				path = "res/ui/world/feud/sbxt_btn_lqjl_c.png"
			}
		},
		{
			y = 90,
			name = "btn_seal",
			h = 118,
			type = "button",
			w = 123,
			visible = false,
			x = 0,
			normal = {
				path = "res/ui/world/feud/sbxt_btn_djjy.png"
			},
			touched = {
				path = "res/ui/world/feud/sbxt_btn_djjy_c.png"
			}
		}
	}
}
var_0_8.simplelayout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			zoomOnTouchDown = true,
			name = "btn_flag",
			h = 130,
			type = "button",
			w = 40,
			y = -20,
			visible = false,
			x = -60,
			normal = {
				path = "res/default.png"
			},
			touched = {
				path = "res/default.png"
			},
			children = {
				{
					x = 20,
					name = "flag",
					y = 85,
					type = "sprite",
					scale = 0.7
				},
				{
					text = "大熊",
					name = "name",
					height = 25,
					type = "label",
					fontSize = 25,
					x = 20,
					width = 40,
					y = 100
				}
			}
		}
	}
}
var_0_8.tipFrame = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(0, 1),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			name = "tipMsg",
			height = 0,
			type = "label",
			width = 400,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_3
		}
	}
}

function var_0_8.onTrigger(arg_2_0)
	local var_2_0 = arg_2_0.info[0].cityId

	local function var_2_1(arg_3_0)
		user.feudSealCities[var_2_0] = nil

		notice.control.refreshLayer()
	end

	cmgr.sendRequest(var_2_1, actions.feudTrigger, var_2_0)
end

function var_0_8.onStart(arg_4_0, arg_4_1)
	local function var_4_0(arg_5_0)
		return
	end

	local var_4_1 = arg_4_0.view.widgets["btn" .. arg_4_1].name

	cmgr.sendRequest(var_4_0, actions.feudStart, arg_4_0.info[0].cityId, var_4_1)
end

function var_0_8.recoverCd(arg_6_0)
	local function var_6_0(arg_7_0)
		return
	end

	local var_6_1 = arg_6_0.feud
	local var_6_2 = var_6_1.cityId

	messageBox.showChargeWin("", language.get(121071, var_6_1.gold), "feudCd", function()
		cmgr.sendRequest(var_6_0, actions.feudFastRecoverCd, var_6_2)
	end)
end

function var_0_8.fastWithWorker(arg_9_0)
	local var_9_0, var_9_1 = tool.getPositionInScreen(arg_9_0.view.widgets.root)

	local function var_9_2(arg_10_0)
		local var_10_0 = CCSprite:create("res/ui/world/feud/sjwc_word_scjsyfz.png")

		smgr.showTipFloatYSprite(var_10_0, 60, ccp(var_9_0, var_9_1 + 70))
	end

	local var_9_3 = arg_9_0.info[0].cityId

	cmgr.sendRequest(var_9_2, actions.feudFastWithWorker, var_9_3)
end

function var_0_8.getReward(arg_11_0)
	local var_11_0 = arg_11_0.feud

	local function var_11_1(arg_12_0)
		local var_12_0 = arg_12_0.action.data
		local var_12_1 = {}

		for iter_12_0, iter_12_1 in ipairs(var_12_0.rewards) do
			local var_12_2 = {
				id = var_0_0[iter_12_1.type] or iter_12_1.type,
				value = iter_12_1.num
			}

			table.insert(var_12_1, var_12_2)
		end

		globalAction_gotResource(var_12_1)

		if var_11_0.state == 2 or var_11_0.state == 3 then
			if var_11_0.state == 3 then
				user.feudCities[var_11_0.cityId] = nil

				notice.control.refreshLayer()
			end

			var_11_0.canGetRewardNum = 0
		end
	end

	cmgr.sendRequest(var_11_1, actions.feudGetReward, arg_11_0.info[0].cityId)
end

function var_0_8.onCastleAutoMove(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0, var_13_1 = tool.getPositionInScreen(arg_13_0.view.widgets.root)

	local function var_13_2(arg_14_0)
		local var_14_0 = CCSprite:create("res/ui/buildEvent/jzsj_word_jzdksqw.png")

		smgr.showTipFloatYSprite(var_14_0, 60, ccp(var_13_0, var_13_1 + 70))
	end

	cmgr.sendRequest(var_13_2, actions.castleAutoMove, arg_13_1, arg_13_2)
end

function var_0_8.onGetCityFeudInfo(arg_15_0)
	local function var_15_0(arg_16_0)
		local var_16_0 = arg_16_0.action.data

		if var_16_0.feuds then
			for iter_16_0, iter_16_1 in ipairs(var_16_0.feuds) do
				local var_16_1 = stringSplit(iter_16_1.a, "|")

				iter_16_1.playerName = var_16_1[1]
				iter_16_1.forceId = tonumber(var_16_1[2])
				iter_16_1.cityId = tonumber(var_16_1[3])
				iter_16_1.state = tonumber(var_16_1[4])
				iter_16_1.index = tonumber(var_16_1[5])
			end
		end

		arg_15_0:showTip(true, var_16_0.feuds)
	end

	cmgr.sendRequest(var_15_0, actions.getCityFeudInfo, arg_15_0.info[0].cityId)
end

function var_0_8.showEffectTrigger(arg_17_0)
	arg_17_0.view.widgets.btn_seal:setVisible(false)

	local var_17_0 = rmgr.getAnimation("warlockUpgrade")
	local var_17_1 = CCAnimation:createWithSpriteFrames(var_17_0, 0.05)
	local var_17_2 = CCAnimate:create(var_17_1)
	local var_17_3 = CCSprite:create()

	arg_17_0.view.widgets.root:addChild(var_17_3, 200)
	var_17_3:runAction(var_17_2)

	local var_17_4 = 0.4

	arg_17_0.view.widgets.btn_flag:setVisible(false)
	arg_17_0.view.widgets.btn_flag:setPosition(ccp(-60, 180))

	local var_17_5 = CCArray:create()

	var_17_5:addObject(CCDelayTime:create(var_17_4))
	var_17_5:addObject(CCShow:create())
	var_17_5:addObject(CCEaseSineOut:create(CCMoveTo:create(var_17_4, ccp(-60, -20))))
	var_17_5:addObject(CCCallFunc:create(function()
		arg_17_0:onTrigger()
	end))

	local var_17_6 = CCSequence:create(var_17_5)

	arg_17_0.view.widgets.btn_flag:runAction(var_17_6)
end

function var_0_8.showEffectStart(arg_19_0, arg_19_1)
	arg_19_0.view.widgets.node_select:setVisible(false)

	local var_19_0 = CCSprite:create("res/ui/world/feud/sbxt_w_word_kssc.png")

	arg_19_0.view.widgets.root:addChild(var_19_0, 200)

	local var_19_1 = CCArray:create()

	var_19_1:addObject(CCEaseSineOut:create(CCMoveTo:create(0.5, ccp(0, 100))))
	var_19_1:addObject(CCCallFunc:create(function()
		var_19_0:removeFromParentAndCleanup(true)
		arg_19_0:onStart(arg_19_1)
	end))

	local var_19_2 = CCSequence:create(var_19_1)

	var_19_0:runAction(var_19_2)
end

function var_0_8.showTip(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_0.view.widgets.tipFrame then
		arg_21_0.view.widgets.tipFrame:removeFromParentAndCleanup(true)

		arg_21_0.view.widgets.tipFrame = nil
	end

	if arg_21_1 then
		if arg_21_2 then
			table.sort(arg_21_2, function(arg_22_0, arg_22_1)
				return arg_22_0.index < arg_22_1.index
			end)
		else
			arg_21_0:onGetCityFeudInfo()

			return
		end

		uiutil.initWidgets(arg_21_0.view, arg_21_0.tipFrame)
		arg_21_0.view.widgets.btn_flag:addChild(arg_21_0.view.widgets.tipFrame)
		arg_21_0.view.widgets.tipMsg:setDimensions(CCSizeMake(0, 0))

		local var_21_0 = ""

		for iter_21_0, iter_21_1 in ipairs(arg_21_2) do
			local var_21_1 = arg_21_2[iter_21_0]

			if not var_21_1 then
				break
			end

			local var_21_2 = stringSplit(var_21_1.a, "|")

			var_21_1.playerName = var_21_2[1]
			var_21_1.forceId = tonumber(var_21_2[2])
			var_21_1.cityId = tonumber(var_21_2[3])
			var_21_1.state = tonumber(var_21_2[4])
			var_21_1.index = tonumber(var_21_2[5])

			if iter_21_0 ~= 1 then
				var_21_0 = var_21_0 .. "\n"
			end

			if var_21_1.state == 1 or var_21_1.state == 2 or var_21_1.state == 3 then
				var_21_0 = var_21_0 .. language.get(121066, user.forceIdToName[var_21_1.forceId], var_21_1.playerName)
			end

			if var_21_1.forceId == user.player.forceId then
				if var_21_1.state == 2 and var_21_1.totalLeftTime then
					var_21_0 = var_21_0 .. language.get(226009, tool.formatTime(var_21_1.totalLeftTime, "@M:@S"))
				elseif var_21_1.state == 3 then
					var_21_0 = var_21_0 .. language.get(226008)
				end
			end
		end

		arg_21_0.view.widgets.tipMsg:setString(var_21_0)

		local var_21_3 = arg_21_0.view.widgets.tipMsg:getContentSize().width
		local var_21_4 = arg_21_0.view.widgets.tipMsg:getContentSize().height

		arg_21_0.view.widgets.tipFrame:setPreferredSize(CCSizeMake(var_21_3 + 30, var_21_4 + 30))
		arg_21_0.view.widgets.tipFrame:setPosition(ccp(20, 85))
		arg_21_0.view.widgets.tipMsg:setPosition(ccp(15, 15))
		arg_21_0.view.widgets.tipFrame:setVisible(true)
	end
end

function var_0_8.onBtnCooperateTap(arg_23_0)
	for iter_23_0, iter_23_1 in pairs(generalMoveLayer.gongjiangTable) do
		arg_23_0.gongjiangPlace = iter_23_1.locationId
		arg_23_0.gongjiangId = iter_23_1.vId
	end

	if arg_23_0.gongjiangPlace == arg_23_0.info[0].cityId then
		messageBox.confirm(language.get(491046), function()
			arg_23_0:showEffectTrigger()
		end)
	else
		arg_23_0:onCastleAutoMove(arg_23_0.gongjiangId, arg_23_0.info[0].cityId)
	end
end

function var_0_8.onBtnWorkerTap(arg_25_0)
	for iter_25_0, iter_25_1 in pairs(generalMoveLayer.gongjiangTable) do
		arg_25_0.gongjiangPlace = iter_25_1.locationId
		arg_25_0.gongjiangId = iter_25_1.vId
	end

	if arg_25_0.gongjiangPlace == arg_25_0.info[0].cityId then
		arg_25_0:fastWithWorker()
	else
		arg_25_0:onCastleAutoMove(arg_25_0.gongjiangId, arg_25_0.info[0].cityId)
	end
end

function var_0_8.showPanel(arg_26_0, arg_26_1)
	arg_26_0.info = arg_26_1

	local var_26_0 = false

	if arg_26_0.isSelf and arg_26_0.feud.index == 0 then
		var_26_0 = arg_26_0.feud.state == 1 or arg_26_0.feud.state == 2 or arg_26_0.feud.state == 3
	else
		var_26_0 = true
	end

	arg_26_0.view.widgets.name:setString(arg_26_1[0].playerName)
	arg_26_0.view.widgets.flag:setDisplayFrame(CCSprite:create(string.format("res/ui/world/feud/sbxt_qz%02d.png", arg_26_1[0].forceId)):displayFrame())
	arg_26_0.view.widgets.btn_flag:setVisible(var_26_0)

	if arg_26_0.isSelf then
		local var_26_1 = {
			[0] = arg_26_0.view.widgets.btn_seal,
			arg_26_0.view.widgets.node_select,
			arg_26_0.view.widgets.node_produce,
			arg_26_0.view.widgets.btn_reward2
		}
		local var_26_2 = arg_26_0.feud

		for iter_26_0, iter_26_1 in pairs(var_26_1) do
			iter_26_1:setVisible(iter_26_0 == var_26_2.state)
		end

		if var_26_2.types then
			if #var_26_2.types > 4 then
				arg_26_0.view.widgets.preBtn:setVisible(true)
				arg_26_0.view.widgets.nextBtn:setVisible(true)
			else
				arg_26_0.view.widgets.preBtn:setVisible(false)
				arg_26_0.view.widgets.nextBtn:setVisible(false)
			end

			local var_26_3 = 1

			for iter_26_2, iter_26_3 in pairs(var_26_2.types) do
				if var_26_3 > 4 then
					return
				end

				local var_26_4 = iter_26_3.type

				if var_26_4 > 4 and var_26_4 < 2000 then
					var_26_4 = 5
				end

				arg_26_0.view.widgets["btn" .. var_26_3].name = iter_26_3.type

				arg_26_0.view.widgets["icon" .. var_26_3]:setDisplayFrame(CCSprite:create(var_0_1[var_26_4]):displayFrame())
				arg_26_0.view.widgets["word" .. var_26_3]:setDisplayFrame(CCSprite:create(var_0_2[var_26_4]):displayFrame())

				var_26_3 = var_26_3 + 1
			end
		end

		arg_26_0.view.widgets.node_produce:stopAllActions()

		if var_26_2.state == 2 then
			arg_26_0.view.widgets.btn_worker:setVisible(user.isPro > 0 and var_26_2.isAcc ~= true)

			local var_26_5 = arg_26_0.view.widgets.btn_worker:isVisible()

			if user.feudAccNum and user.feudAccNum > 0 and not var_26_5 then
				arg_26_0.view.widgets.fdNumLb:setString(user.feudAccNum)
				arg_26_0.view.widgets.btn_worker2:setVisible(true)
			else
				arg_26_0.view.widgets.btn_worker2:setVisible(false)
			end

			local var_26_6 = {
				"res/ui/task/get_icon_food.png",
				"res/ui/world/feud/sbxt_btn_hy.png",
				"res/ui/world/feud/sbxt_btn_zs.png",
				"res/ui/world/feud/sbxt_btn_nj.png",
				[1015] = "res/ui/world/feud/sbxt_btn_caiji.png",
				[2001] = "res/ui/world/speicalCity/tscc_hy_tj.png",
				[1011] = "res/ui/world/feud/sbxt_btn_caiji.png",
				[1013] = "res/ui/world/feud/sbxt_btn_caiji.png",
				[1009] = "res/ui/world/feud/sbxt_btn_caiji.png",
				[1002] = "res/ui/world/feud/sbxt_btn_caiji.png",
				[1006] = "res/ui/world/feud/sbxt_btn_caiji.png",
				[1005] = "res/ui/world/feud/sbxt_btn_caiji.png",
				[1010] = "res/ui/world/feud/sbxt_btn_caiji.png",
				[1008] = "res/ui/world/feud/sbxt_btn_caiji.png",
				[1014] = "res/ui/world/feud/sbxt_btn_caiji.png",
				[2002] = "res/ui/world/speicalCity/tscc_hy_xz.png",
				[2003] = "res/ui/world/speicalCity/tscc_hy_hb.png",
				[2004] = "res/ui/world/speicalCity/tscc_hy_jl.png",
				[1004] = "res/ui/world/feud/sbxt_btn_caiji.png",
				[1007] = "res/ui/world/feud/sbxt_btn_caiji.png",
				[1001] = "res/ui/world/feud/sbxt_btn_caiji.png",
				[1003] = "res/ui/world/feud/sbxt_btn_caiji.png",
				[1012] = "res/ui/world/feud/sbxt_btn_caiji.png"
			}
			local var_26_7 = var_26_6[var_26_2.type] or var_26_6[1]

			arg_26_0.view.widgets.icon:setDisplayFrame(CCSprite:create(var_26_7):displayFrame())
			arg_26_0.view.widgets.lbl_num:setString(language.get(121064, var_26_2.totalTimes - var_26_2.curTimes))

			local var_26_8

			if var_26_2.canGetRewardNum > 0 then
				var_26_8 = language.get(135039, var_26_2.canGetRewardNum * var_26_2.rewardsT[1].num)
			else
				var_26_8 = language.get(121065)
			end

			arg_26_0.view.widgets.lbl_state:setString(var_26_8)
			arg_26_0.view.widgets.btn_reward1:stopAllActions()
			arg_26_0.view.widgets.btn_reward1:setPosition(ccp(-120, 0))

			if var_26_2.canGetRewardNum > 0 then
				local var_26_9 = 0.1
				local var_26_10 = 6
				local var_26_11 = CCArray:create()

				var_26_11:addObject(CCMoveBy:create(var_26_9, ccp(-1 * var_26_10, 0)))
				var_26_11:addObject(CCMoveBy:create(var_26_9, ccp(1 * var_26_10, 0)))
				var_26_11:addObject(CCMoveBy:create(var_26_9, ccp(-1 * var_26_10, 0)))
				var_26_11:addObject(CCMoveBy:create(var_26_9, ccp(1 * var_26_10, 0)))
				var_26_11:addObject(CCMoveBy:create(var_26_9, ccp(-1 * var_26_10, 0)))
				var_26_11:addObject(CCMoveBy:create(var_26_9, ccp(1 * var_26_10, 0)))
				var_26_11:addObject(CCDelayTime:create(1))

				local var_26_12 = CCSequence:create(var_26_11)

				arg_26_0.view.widgets.btn_reward1:runAction(CCRepeatForever:create(var_26_12))
			end

			local var_26_13 = CCArray:create()

			var_26_13:addObject(CCCallFunc:create(function()
				arg_26_0.view.widgets.time:setString(tool.getFormatTime(var_26_2.leftTime))

				local var_27_0 = 100 * ((var_26_2.maxTimes * 60 * 1000 - var_26_2.leftTime) / (var_26_2.maxTimes * 60 * 1000))

				arg_26_0.view.widgets.bar:setPercentage(var_27_0)
			end))
			var_26_13:addObject(CCDelayTime:create(1))

			local var_26_14 = CCSequence:create(var_26_13)

			arg_26_0.view.widgets.node_produce:runAction(CCRepeatForever:create(var_26_14))
		end

		if var_26_2.state == 3 then
			arg_26_0.view.widgets.btn_reward2:setVisible(var_26_2.canGetRewardNum ~= nil and var_26_2.canGetRewardNum > 0)
		end
	end
end

function var_0_8.pageHandel(arg_28_0, arg_28_1)
	if arg_28_0.feud then
		for iter_28_0 = 1, 4 do
			local var_28_0 = arg_28_0.feud.types[arg_28_1 + iter_28_0]

			if var_28_0 then
				local var_28_1 = var_28_0.type

				if var_28_1 > 4 and var_28_1 < 2000 then
					var_28_1 = 5
				end

				arg_28_0.view.widgets["btn" .. iter_28_0].name = var_28_0.type

				arg_28_0.view.widgets["icon" .. iter_28_0]:setDisplayFrame(CCSprite:create(var_0_1[var_28_1]):displayFrame())
				arg_28_0.view.widgets["word" .. iter_28_0]:setDisplayFrame(CCSprite:create(var_0_2[var_28_1]):displayFrame())
				arg_28_0.view.widgets["btn" .. iter_28_0]:setVisible(true)
			else
				arg_28_0.view.widgets["btn" .. iter_28_0]:setVisible(false)
			end
		end
	end
end

function var_0_8.ctor(arg_29_0, arg_29_1, arg_29_2)
	arg_29_0.view = {}
	arg_29_0.currentPage = 1
	arg_29_0.is0th = arg_29_1[0].playerName == user.player.name
	arg_29_0.isSelf = false

	for iter_29_0, iter_29_1 in pairs(arg_29_1) do
		if iter_29_1.playerName == user.player.name then
			arg_29_0.feud = iter_29_1
			arg_29_0.isSelf = true

			break
		end
	end

	if arg_29_0.isSelf then
		uiutil.initWidgets(arg_29_0.view, arg_29_0.layout)
	else
		uiutil.initWidgets(arg_29_0.view, arg_29_0.simplelayout)
	end

	arg_29_0:addChild(arg_29_0.view.widgets.root)
	swallowTouch(arg_29_0)

	if arg_29_0.isSelf then
		local var_29_0 = arg_29_0.is0th and "sbxt_btn_djjy.png" or "world_btn_xtsc.png"
		local var_29_1 = arg_29_0.is0th and "sbxt_btn_djjy_c.png" or "world_btn_xtsc_c.png"
		local var_29_2 = CCSprite:create("res/ui/world/feud/" .. var_29_0):getContentSize()

		arg_29_0.view.widgets.btn_seal:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/world/feud/" .. var_29_0), CCControlStateNormal)
		arg_29_0.view.widgets.btn_seal:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/world/feud/" .. var_29_1), CCControlStateHighlighted)
		arg_29_0.view.widgets.btn_seal:setPreferredSize(var_29_2)
		arg_29_0.view.widgets.btn_seal:addHandleOfControlEvent(function()
			log.info("btn_seal")

			if arg_29_0.is0th then
				arg_29_0:showEffectTrigger()
			else
				arg_29_0:onBtnCooperateTap()
			end
		end, CCControlEventTouchUpInside)

		for iter_29_2 = 1, 4 do
			arg_29_0.view.widgets["btn" .. iter_29_2]:addHandleOfControlEvent(function()
				log.info("btn%s", iter_29_2)
				arg_29_0:showEffectStart(iter_29_2)
			end, CCControlEventTouchUpInside)
		end

		arg_29_0.view.widgets.btn_reward1:addHandleOfControlEvent(function()
			log.info("btn_reward1")
			arg_29_0:getReward()
		end, CCControlEventTouchUpInside)
		arg_29_0.view.widgets.btn_cd:addHandleOfControlEvent(function()
			log.info("btn_cd")
			arg_29_0:recoverCd()
		end, CCControlEventTouchUpInside)
		arg_29_0.view.widgets.btn_worker:addHandleOfControlEvent(function()
			log.info("btn_worker")
			arg_29_0:onBtnWorkerTap()
		end, CCControlEventTouchUpInside)
		arg_29_0.view.widgets.btn_worker2:addHandleOfControlEvent(function()
			log.info("btn_worker2")
			arg_29_0:onBtnWorkerTap()
		end, CCControlEventTouchUpInside)
		arg_29_0.view.widgets.btn_reward2:addHandleOfControlEvent(function()
			log.info("btn_reward2")
			arg_29_0:getReward()
		end, CCControlEventTouchUpInside)
		arg_29_0.view.widgets.preBtn:addHandleOfControlEvent(function()
			if arg_29_0.currentPage == 2 then
				arg_29_0:pageHandel(0)

				arg_29_0.currentPage = 1
			end
		end, CCControlEventTouchUpInside)
		arg_29_0.view.widgets.nextBtn:addHandleOfControlEvent(function()
			if arg_29_0.currentPage == 1 then
				arg_29_0:pageHandel(4)

				arg_29_0.currentPage = 2
			end
		end, CCControlEventTouchUpInside)
	end

	local var_29_3 = arg_29_0.view.widgets.btn_flag

	var_29_3:addHandleOfControlEvent(function()
		log.info("btn_flag TouchDown")
		arg_29_0:showTip(true)
	end, CCControlEventTouchDown)
	var_29_3:addHandleOfControlEvent(function()
		log.info("btn_flagTouchUpInside")
		arg_29_0:showTip(false)
	end, CCControlEventTouchUpInside)
	var_29_3:addHandleOfControlEvent(function()
		log.info("btn_flag TouchUpOutside")
		arg_29_0:showTip(false)
	end, CCControlEventTouchUpOutside)

	arg_29_2.btn_seal = arg_29_0.view.widgets.btn_seal
	arg_29_2.node_select = arg_29_0.view.widgets.node_select
	arg_29_2.bg_select = arg_29_0.view.widgets.bg_select
	arg_29_2.node_produce = arg_29_0.view.widgets.node_produce
	arg_29_2.bg_produce = arg_29_0.view.widgets.bg_produce
	arg_29_2.btn_reward2 = arg_29_0.view.widgets.btn_reward2
	arg_29_2.btn_flag = arg_29_0.view.widgets.btn_flag

	arg_29_0:showPanel(arg_29_1)
	arg_29_0:registerScriptHandler(function(arg_42_0)
		if arg_42_0 == "enter" then
			arg_29_0:onEnter()
		elseif arg_42_0 == "exit" then
			arg_29_0:onExit()
		end
	end)
end

function var_0_8.onEnter(arg_43_0)
	function arg_43_0.changeWorkerIsProRef()
		arg_43_0:showPanel(arg_43_0.info)
	end

	eventManager.registerEvent("changeWorkerIsPro", arg_43_0.changeWorkerIsProRef)
	eventManager.registerEvent("feudAccNum", arg_43_0.changeWorkerIsProRef)
end

function var_0_8.onExit(arg_45_0)
	eventManager.unregisterEvent("changeWorkerIsPro", arg_45_0.changeWorkerIsProRef)
	eventManager.unregisterEvent("feudAccNum", arg_45_0.changeWorkerIsProRef)
end

return var_0_8
