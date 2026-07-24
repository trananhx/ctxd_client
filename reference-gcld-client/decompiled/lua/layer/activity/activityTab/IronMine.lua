local var_0_0 = {}

if conf.language == "tha" then
	var_0_0.cityBtnX = 40
	var_0_0.teamInfoX = 0
elseif conf.language == "vie" then
	var_0_0.cityBtnX = 50
	var_0_0.teamInfoX = -20
else
	var_0_0.cityBtnX = 0
	var_0_0.teamInfoX = 0
end

local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = ccc3(0, 255, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = 1
local var_0_6 = 2
local var_0_7 = 3
local var_0_8 = 4
local var_0_9 = {
	"btkd_box_word_lzbx.png",
	"btkd_box_word_ptbx.png",
	"btkd_box_word_yzbx.png",
	"btkd_box_word_jzbx.png",
	"btkd_box_word_xybx.png"
}
local var_0_10 = 250
local var_0_11 = {}

for iter_0_0 = 1, 3 do
	var_0_11[3 * iter_0_0] = ccp(458 + (-2 + iter_0_0) * var_0_10, 160)
	var_0_11[3 * iter_0_0 - 1] = ccp(458 + (-2 + iter_0_0) * var_0_10, 320)
	var_0_11[3 * iter_0_0 - 2] = ccp(458 + (-2.5 + iter_0_0) * var_0_10, 240)
end

var_0_11[10] = ccp(458 + 1.5 * var_0_10, 240)

local var_0_12 = {
	[1501] = {
		resId = 10005,
		pic = "btkd_icon_qcjs.png",
		name = language.get(135051)
	},
	[1503] = {
		resId = 10006,
		pic = "btkd_icon_tljs.png",
		name = language.get(135053)
	}
}
local var_0_13 = 1
local var_0_14 = 2
local var_0_15 = class("IronMine", function()
	return createBaseLayer()
end)

var_0_15.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = false,
		path = "res/ui/activity/midAutumn/ybjl_di.jpg"
	},
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			x = 458,
			y = 493,
			type = "sprite",
			pic = {
				frame = true,
				path = "btkd_title_btkd.png"
			}
		},
		{
			x = 458,
			name = "mineBg",
			y = 455,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/ironMine/btkd_bg.jpg"
			},
			anchorPoint = ccp(0.5, 1)
		},
		{
			x = 454,
			name = "stone",
			y = 455,
			type = "sprite",
			scale = 0.9900990099009901,
			pic = {
				frame = true,
				path = "btkd_up_stone.png"
			},
			anchorPoint = ccp(0.5, 1)
		},
		{
			x = 458,
			y = 453,
			type = "sprite",
			pic = {
				frame = true,
				path = "btkd_line.png"
			},
			anchorPoint = ccp(0.5, 0)
		},
		{
			x = 458,
			y = 102,
			type = "sprite",
			pic = {
				frame = true,
				path = "btkd_line.png"
			}
		},
		{
			x = 458,
			name = "shadow",
			y = 455,
			type = "sprite",
			zorder = 10,
			pic = {
				frame = true,
				path = "btkd_up_mask.png"
			},
			anchorPoint = ccp(0.5, 1)
		},
		{
			fontSize = 24,
			name = "leftTime",
			y = 485,
			type = "label",
			x = 730,
			style = "label_warlock",
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_3
		},
		{
			style = "button_tip",
			name = "btn_tip",
			y = 493,
			type = "button",
			x = 860
		},
		{
			fontSize = 24,
			name = "rewardIronNum",
			y = 130,
			type = "label",
			style = "label_warlock",
			x = 458,
			zorder = 40,
			color = var_0_2
		},
		{
			fontSize = 24,
			name = "rewardTokenNum",
			y = 130,
			type = "label",
			style = "label_warlock",
			x = 458,
			zorder = 40,
			color = var_0_2
		},
		{
			fontSize = 24,
			name = "infoLb1",
			type = "label",
			text = "",
			style = "label_warlock",
			y = 50,
			x = 60 + var_0_0.teamInfoX,
			anchorPoint = ccp(0, 0.5),
			color = var_0_1
		},
		{
			fontSize = 24,
			name = "infoLb2",
			width = 350,
			type = "label",
			height = 0,
			text = "",
			style = "label_warlock",
			y = 50,
			x = 900,
			anchorPoint = ccp(1, 0.5)
		},
		{
			x = 458,
			name = "openBoxEndTxt1",
			y = 266,
			type = "sprite",
			visible = false,
			zorder = 40,
			pic = {
				frame = true,
				path = "btkd_word_bxkwhdjs.png"
			}
		},
		{
			fontSize = 33,
			name = "openBoxEndLb",
			visible = false,
			type = "label",
			zorder = 40,
			style = "label_warlock",
			y = 290,
			x = 458,
			anchorPoint = ccp(0.5, 0),
			color = var_0_3
		},
		{
			x = 458,
			name = "openBoxEndTxt2",
			y = 266,
			type = "sprite",
			visible = false,
			zorder = 40,
			pic = {
				frame = true,
				path = "btkd_word_jxtskd.png"
			},
			children = {
				{
					type = "node",
					name = "node_clearCd",
					y = 26,
					visible = false,
					x = 295,
					children = {
						{
							x = 0,
							name = "btn_clearCd",
							h = 76,
							type = "button",
							w = 95,
							zoomOnTouchDown = false,
							y = 0,
							scale = 0.8,
							normal = {
								path = "res/ui/nation/kingNotice/gwgg_btn_arrows.png"
							},
							touched = {
								path = "res/ui/nation/kingNotice/gwgg_btn_arrows_c.png"
							}
						},
						{
							y = -8,
							x = 55,
							type = "sprite",
							pic = {
								frame = true,
								path = "res_icon_19.png"
							}
						},
						{
							fontSize = 22,
							name = "recoveryGold",
							y = -8,
							type = "label",
							style = "label_warlock",
							x = 77,
							anchorPoint = ccp(0, 0.5),
							color = var_0_4
						}
					}
				}
			}
		},
		{
			y = 50,
			name = "btn_putBomb",
			style = "button_gre3",
			type = "button",
			visible = false,
			x = 458,
			children = {
				{
					fontSize = 22,
					style = "label_warlock",
					y = 27,
					type = "label",
					x = 70,
					textId = 135037,
					color = var_0_1
				},
				{
					x = 0,
					y = 29,
					type = "sprite",
					pic = {
						frame = true,
						path = "btkd_btn_bomb.png"
					}
				},
				{
					fontSize = 22,
					name = "buyBombGoldLb",
					y = 15,
					type = "label",
					style = "label_warlock",
					visible = false,
					x = -5,
					color = var_0_4,
					children = {
						{
							x = -30,
							y = 0,
							type = "sprite",
							pic = {
								frame = true,
								path = "res_icon_19_small.png"
							}
						}
					}
				},
				{
					fontSize = 22,
					name = "bombNumLb1",
					y = 15,
					type = "label",
					style = "label_warlock",
					x = 0,
					visible = false,
					color = var_0_1
				}
			}
		},
		{
			y = 50,
			name = "node_buyKey",
			visible = false,
			type = "node",
			x = 458,
			zorder = 10,
			children = {
				{
					y = 355,
					x = 0,
					type = "sprite",
					pic = {
						path = "res/ui/world/flight_place_view.png"
					},
					children = {
						{
							name = "btn_buyKey",
							h = 51,
							type = "button",
							w = 51,
							y = 22,
							x = 162,
							normal = {
								path = "res/ui/common/button/btn_add.png"
							},
							touched = {
								path = "res/ui/common/button/btn_add_c.png"
							},
							disable = {
								path = "res/ui/common/button/btn_add_g.png"
							}
						},
						{
							x = 35,
							y = 30,
							type = "sprite",
							pic = {
								frame = true,
								path = "btkd_btn_key.png"
							}
						},
						{
							x = 210,
							y = 10,
							type = "sprite",
							pic = {
								frame = true,
								path = "res_icon_19_small.png"
							}
						},
						{
							y = 20,
							x = 75,
							type = "sprite",
							pic = {
								path = "res/ui/common/symbol/lvdqj_mul.png"
							}
						},
						{
							name = "keyNum",
							type = "atlaslabel",
							pic = "res/ui/common/number/lm_tit_num.png",
							startCharMap = 48,
							text = "88",
							y = 22,
							itemWidth = 22,
							x = 86,
							itemHeight = 32,
							anchorPoint = ccp(0, 0.5)
						},
						{
							fontSize = 22,
							name = "buyKeyGoldLb",
							y = 35,
							type = "label",
							style = "label_warlock",
							x = 210,
							color = var_0_4
						}
					}
				},
				{
					x = -350,
					y = 29,
					type = "sprite",
					pic = {
						frame = true,
						path = "btkd_btn_bomb.png"
					}
				},
				{
					fontSize = 22,
					name = "bombNumLb2",
					y = 15,
					type = "label",
					style = "label_warlock",
					x = -350,
					color = var_0_1
				},
				{
					fontSize = 24,
					name = "infoLb3",
					y = 0,
					type = "label",
					style = "label_warlock",
					x = 0
				}
			}
		},
		{
			y = 40,
			name = "btn_city",
			style = "button_yel1",
			type = "button",
			visible = false,
			x = 220 + var_0_0.cityBtnX,
			children = {
				{
					fontSize = 22,
					style = "label_warlock",
					y = 29,
					type = "label",
					x = 49,
					textId = 420008,
					color = var_0_1
				}
			}
		},
		{
			fontSize = 26,
			name = "Lb_cityName",
			y = 80,
			type = "label",
			style = "label_warlock",
			x = 220,
			visible = false,
			color = var_0_2
		}
	}
}
var_0_15.tipFrame = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(1, 1),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 22,
			height = 0,
			name = "tipMsg",
			type = "label",
			textId = 135045,
			style = "label_warlock",
			width = 600,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_1
		}
	}
}

function var_0_15.close(arg_2_0)
	local var_2_0 = smgr.getLayer("topLayer")

	tool.safeRemoveChildByTag(var_2_0, s_windows.tag.activity)
end

function var_0_15.refresh(arg_3_0)
	local function var_3_0(arg_4_0)
		arg_3_0:showPanel(arg_4_0.action.data)
	end

	cmgr.sendRequest(var_3_0, actions.getIronMineActivity)
end

function var_0_15.onReceivedBombIron(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = 0
	local var_5_1 = {}

	local function var_5_2(arg_6_0)
		local var_6_0 = {}

		var_6_0.id = 4
		var_6_0.value = arg_6_0.action.data.iron

		table.insert(var_5_1, var_6_0)

		var_5_0 = var_5_0 + 1

		if var_5_0 == 1 then
			tolua.cast(table.remove(arg_5_0.bombIron, arg_5_1), "CCSprite"):removeFromParentAndCleanup(true)
		else
			tolua.cast(table.remove(arg_5_0.bombIron), "CCSprite"):removeFromParentAndCleanup(true)
		end

		if var_5_0 < arg_5_2 then
			cmgr.sendRequest(var_5_2, actions.receivedBombIron)
		else
			globalAction_gotResource(var_5_1)

			if arg_5_3 then
				arg_5_0:refresh()
			end
		end
	end

	cmgr.sendRequest(var_5_2, actions.receivedBombIron)
end

function var_0_15.onReceivedIronMineBox(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = 0
	local var_7_1 = {}

	local function var_7_2(arg_8_0)
		local var_8_0 = {}

		if arg_8_0.action.data.iron > 0 then
			var_8_0.id = 4
			var_8_0.value = arg_8_0.action.data.iron
		elseif arg_8_0.action.data.token > 0 then
			var_8_0.id = var_0_12[arg_8_0.action.data.itemId].resId
			var_8_0.value = arg_8_0.action.data.token
		end

		table.insert(var_7_1, var_8_0)

		var_7_0 = var_7_0 + 1

		if var_7_0 == 1 then
			tolua.cast(table.remove(arg_7_0.boxReward, arg_7_1).obj, "CCSprite"):removeFromParentAndCleanup(true)
		else
			tolua.cast(table.remove(arg_7_0.boxReward).obj, "CCSprite"):removeFromParentAndCleanup(true)
		end

		if var_7_0 < arg_7_2 then
			cmgr.sendRequest(var_7_2, actions.receivedIronMineBox, arg_7_0.boxReward[#arg_7_0.boxReward].type)
		else
			globalAction_gotResource(var_7_1)

			if arg_7_3 then
				arg_7_0.rewardNode:removeAllChildrenWithCleanup(true)
				arg_7_0:refresh()
			end
		end
	end

	cmgr.sendRequest(var_7_2, actions.receivedIronMineBox, arg_7_0.boxReward[arg_7_1].type)
end

function var_0_15.onPutIronMineBomb(arg_9_0)
	local function var_9_0(arg_10_0)
		arg_9_0.putBombNum = arg_9_0.putBombNum + 1
		arg_9_0.info.bombNum = arg_9_0.info.bombNum + 1

		arg_9_0:addBomb()
	end

	local function var_9_1()
		cmgr.sendRequest(var_9_0, actions.buyIronMineBomb)
	end

	if arg_9_0.putBombNum < arg_9_0.info.bombNum then
		arg_9_0.putBombNum = arg_9_0.putBombNum + 1

		arg_9_0:addBomb()
	else
		messageBox.showChargeWin(language.get(10003), language.get(135030, arg_9_0.info.buyBombGold), "mrIronMineBombGold", var_9_1)
	end
end

function var_0_15.onBombIronMine(arg_12_0)
	local function var_12_0(arg_13_0)
		arg_12_0:refresh()
	end

	cmgr.sendRequest(var_12_0, actions.bombIronMine)
end

function var_0_15.onBuyIronMineKey(arg_14_0)
	local function var_14_0(arg_15_0)
		arg_14_0.isBuyKey = true

		arg_14_0:refresh()
	end

	messageBox.showChargeWin("", language.get(135034, arg_14_0.info.openBoxGold), "mrIronMineBoxGold", function()
		cmgr.sendRequest(var_14_0, actions.buyIronMineKey)
	end)
end

function var_0_15.onGetIronMineReward(arg_17_0, arg_17_1)
	local function var_17_0(arg_18_0)
		arg_17_0:refresh()
	end

	cmgr.sendRequest(var_17_0, actions.getIronMineReward, arg_17_1)
end

function var_0_15.onGoToCity(arg_19_0, arg_19_1)
	smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
	loadingLayer.show(SCENE_WORLD, arg_19_1)
end

function var_0_15.onClearCd(arg_20_0)
	local function var_20_0(arg_21_0)
		arg_20_0:refresh()
	end

	messageBox.confirm(language.get(135057, arg_20_0.info.recoveryGold), function()
		cmgr.sendRequest(var_20_0, actions.clearIronMineRecoveryCd)
		arg_20_0.view.widgets.panel:setVisible(false)
	end)
end

function var_0_15.addMask(arg_23_0, arg_23_1)
	if arg_23_0.maskNode then
		arg_23_0.maskNode:removeAllChildrenWithCleanup(true)
	else
		arg_23_0.maskNode = CCNode:create()

		arg_23_0.view.widgets.panel:addChild(arg_23_0.maskNode, 10)
	end

	if arg_23_1 == var_0_6 then
		local var_23_0 = CCLayerColor:create(ccc4(0, 0, 0, 180), 910, 353)

		var_23_0:setPosition(ccp(3, 102))
		arg_23_0.maskNode:addChild(var_23_0)
	elseif arg_23_1 == var_0_7 then
		local var_23_1 = CCLayerColor:create(ccc4(0, 0, 0, 180), 910, 526)

		var_23_1:setPosition(ccp(3, 3))
		arg_23_0.maskNode:addChild(var_23_1)
	elseif arg_23_1 == var_0_5 then
		local var_23_2 = CCLayerColor:create(ccc4(0, 0, 0, 180), 910, 74)

		var_23_2:setPosition(ccp(3, 455))
		arg_23_0.maskNode:addChild(var_23_2)

		local var_23_3 = CCLayerColor:create(ccc4(0, 0, 0, 180), 910, 100)

		var_23_3:setPosition(ccp(3, 3))
		arg_23_0.maskNode:addChild(var_23_3)
	end

	local var_23_4 = arg_23_1 == var_0_8

	arg_23_0.view.widgets.btn_city:setEnabled(var_23_4)
	arg_23_0.view.widgets.btn_tip:setEnabled(var_23_4)
	arg_23_0.view.widgets.btn_buyKey:setEnabled(var_23_4)
	arg_23_0.view.widgets.btn_putBomb:setEnabled(var_23_4)

	if arg_23_0.maskLayer then
		arg_23_0.maskLayer:setTouchEnabled(var_23_4)
	end
end

function var_0_15.addBomb(arg_24_0)
	if arg_24_0.bombNode then
		arg_24_0.bombNode:removeAllChildrenWithCleanup(true)
	else
		arg_24_0.bombNode = CCNode:create()

		arg_24_0.view.widgets.panel:addChild(arg_24_0.bombNode)
	end

	local var_24_0 = arg_24_0.info.bombNum > arg_24_0.putBombNum

	arg_24_0.view.widgets.bombNumLb1:setString(language.get(135039, arg_24_0.info.bombNum - arg_24_0.putBombNum))
	arg_24_0.view.widgets.bombNumLb1:setVisible(var_24_0)
	arg_24_0.view.widgets.buyBombGoldLb:setVisible(not var_24_0)

	if arg_24_0.info.alreadyMine == 0 then
		arg_24_0.view.widgets.infoLb2:setString(language.get(135050, arg_24_0.info.singleBombNum - arg_24_0.putBombNum))
	end

	local var_24_1 = {
		ccp(170, 120),
		ccp(440, 180),
		ccp(720, 150)
	}

	for iter_24_0 = 1, arg_24_0.putBombNum do
		local var_24_2 = CCSprite:createWithSpriteFrameName("btkd_icon_bomb.png")

		var_24_2:setAnchorPoint(ccp(0.5, 0))
		var_24_2:setPosition(var_24_1[iter_24_0])
		arg_24_0.bombNode:addChild(var_24_2)
	end

	if arg_24_0.putBombNum >= arg_24_0.info.singleBombNum then
		arg_24_0:addMask(var_0_5)
		arg_24_0:showBombEffect()
	end
end

function var_0_15.addIron(arg_25_0)
	if arg_25_0.ironNode then
		arg_25_0.ironNode:removeAllChildrenWithCleanup(true)
	else
		arg_25_0.ironNode = CCSpriteBatchNode:create("res/ui/activity/ironMine/ironMinePic.png")

		arg_25_0.view.widgets.panel:addChild(arg_25_0.ironNode)
	end

	local var_25_0 = 19
	local var_25_1 = {}

	for iter_25_0 = 1, var_25_0 do
		var_25_1[iter_25_0] = true
	end

	local var_25_2 = {
		{},
		{
			2,
			6,
			10
		},
		{
			4,
			8
		},
		{
			12,
			16
		},
		{
			11,
			19
		},
		{
			1,
			9
		},
		{
			13,
			18
		},
		{
			3,
			17
		},
		{
			7,
			14
		},
		{
			5,
			15
		}
	}

	if arg_25_0.info.alreadyMine > 0 then
		for iter_25_1 = 1, arg_25_0.info.alreadyMine do
			local var_25_3 = var_25_2[iter_25_1]

			for iter_25_2 = 1, #var_25_3 do
				var_25_1[var_25_3[iter_25_2]] = false
			end
		end
	end

	math.randomseed(1)

	for iter_25_3 = 1, var_25_0 do
		if var_25_1[iter_25_3] then
			local var_25_4 = CCSprite:createWithSpriteFrameName("btkd_icon_bt.png")

			var_25_4:setScaleY(-1)

			local var_25_5 = 36 + (iter_25_3 - 1) * 836 / math.floor(var_25_0 / 2)
			local var_25_6 = 426

			if iter_25_3 > math.ceil(var_25_0 / 2) then
				var_25_4:setOpacity(160)

				var_25_5 = var_25_5 - var_25_0 / 2 * 836 / math.floor(var_25_0 / 2)
				var_25_5 = var_25_5 + math.random(-20, 20)
				var_25_6 = var_25_6 + math.random(-10, 0)

				arg_25_0.ironNode:addChild(var_25_4, 0)
			else
				arg_25_0.ironNode:addChild(var_25_4, 1)
			end

			var_25_4:setPosition(ccp(var_25_5, var_25_6))
		end
	end

	if arg_25_0.info.copiesBombIron > 0 then
		arg_25_0.view.widgets.rewardIronNum:setString(language.get(135043, arg_25_0.info.singleBombIron * arg_25_0.info.copiesBombIron))
		arg_25_0.view.widgets.rewardIronNum:setPosition(ccp(458, 130))
		arg_25_0.view.widgets.rewardIronNum:setVisible(true)
		arg_25_0:addMask(var_0_5)
		math.randomseed(os.time())

		arg_25_0.bombIron = {}

		for iter_25_4 = 1, arg_25_0.info.copiesBombIron do
			local var_25_7 = CCSprite:createWithSpriteFrameName("btkd_icon_bt_light.png")

			arg_25_0.ironNode:addChild(var_25_7)

			local var_25_8 = math.random(90, 820)
			local var_25_9 = math.random(160, 240)

			var_25_7:setPosition(ccp(var_25_8, 420))
			var_25_7:runAction(CCEaseBounceOut:create(CCMoveTo:create(1, ccp(var_25_8, var_25_9))))
			table.insert(arg_25_0.bombIron, var_25_7)
		end

		local var_25_10 = CCLayerColor:create(ccc4(255, 255, 255, 0))

		var_25_10:registerScriptTouchHandler(function(arg_26_0, arg_26_1, arg_26_2)
			if arg_26_0 == CCTOUCHBEGAN then
				log.info("CCTOUCH_BEGAN", arg_26_1, arg_26_2)

				if arg_25_0.bombIron and #arg_25_0.bombIron > 0 then
					for iter_26_0 = 1, #arg_25_0.bombIron do
						local var_26_0 = tolua.cast(arg_25_0.bombIron[iter_26_0], "CCSprite")

						if tool.checkIfTouch(var_26_0, arg_26_1, arg_26_2) then
							if #arg_25_0.bombIron <= 3 then
								arg_25_0:onReceivedBombIron(iter_26_0, #arg_25_0.bombIron, true)
							else
								arg_25_0:onReceivedBombIron(iter_26_0, 3, false)
							end

							return true
						end
					end
				end

				return false
			elseif arg_26_0 == CCTOUCHMOVED then
				log.info("CCTOUCH_MOVED", arg_26_1, arg_26_2)

				return true
			elseif arg_26_0 == CCTOUCHENDED then
				log.info("CCTOUCH_ENDED", arg_26_1, arg_26_2)

				return true
			end
		end, false, true)
		var_25_10:setTouchEnabled(true)
		arg_25_0.view.widgets.panel:addChild(var_25_10)

		if arg_25_0.maskLayer then
			arg_25_0.maskLayer:removeFromParentAndCleanup(true)
		end

		arg_25_0.maskLayer = var_25_10
	end
end

function var_0_15.addBox(arg_27_0)
	if arg_27_0.boxNode then
		arg_27_0.boxNode:removeAllChildrenWithCleanup(true)
	else
		arg_27_0.boxNode = CCSpriteBatchNode:create("res/ui/activity/ironMine/ironMinePic.png")

		arg_27_0.view.widgets.panel:addChild(arg_27_0.boxNode)
	end

	arg_27_0.view.widgets.stone:setVisible(false)

	local var_27_0 = false

	for iter_27_0 = 1, #arg_27_0.info.boxs do
		if arg_27_0.info.boxs[iter_27_0].id == 0 then
			var_27_0 = true

			break
		end
	end

	if not var_27_0 and arg_27_0.info.copiesBoxIron == 0 and arg_27_0.info.copiesBoxToken == 0 then
		arg_27_0:addMask(var_0_7)
		arg_27_0.view.widgets.node_buyKey:setVisible(false)
		arg_27_0.view.widgets.btn_putBomb:setVisible(false)
		arg_27_0.view.widgets.infoLb1:setVisible(false)
		arg_27_0.view.widgets.infoLb2:setVisible(false)
		arg_27_0.view.widgets.btn_city:setVisible(false)
		arg_27_0.view.widgets.Lb_cityName:setVisible(false)

		local var_27_1 = arg_27_0.info.roundNo and arg_27_0.info.roundNo == 0

		if not var_27_1 and (arg_27_0.info.nextDayCd >= arg_27_0.info.eventCd or arg_27_0.info.nextDayCd == 0) then
			arg_27_0.view.widgets.openBoxEndTxt1:setVisible(true)
		else
			arg_27_0.view.widgets.openBoxEndTxt2:setVisible(true)

			local var_27_2 = math.floor(arg_27_0.info.nextDayCd / 3600000)
			local var_27_3 = math.floor(arg_27_0.info.nextDayCd / 60000) - 60 * var_27_2

			arg_27_0.view.widgets.openBoxEndLb:setString(language.get(135056, var_27_2, var_27_3))
			arg_27_0.view.widgets.openBoxEndLb:setVisible(true)
			arg_27_0.view.widgets.node_clearCd:setVisible(var_27_1)

			if var_27_1 then
				arg_27_0.view.widgets.recoveryGold:setString(arg_27_0.info.recoveryGold)

				local var_27_4 = arg_27_0.view.widgets.openBoxEndTxt2:getContentSize().width

				arg_27_0.view.widgets.node_clearCd:setPositionX(var_27_4 + 30)
				arg_27_0.view.widgets.openBoxEndTxt2:setPositionX(383)
			else
				arg_27_0.view.widgets.openBoxEndTxt2:setPositionX(458)
			end
		end

		return
	end

	local var_27_5

	if arg_27_0.isBuyKey then
		var_27_5 = false
		arg_27_0.isBuyKey = false
	elseif arg_27_0.info.lastBoxId == 0 then
		var_27_5 = true
	else
		var_27_5 = true

		for iter_27_1 = 1, #arg_27_0.info.boxs do
			if arg_27_0.info.boxs[iter_27_1].id ~= 0 then
				var_27_5 = false

				break
			end
		end
	end

	if var_27_5 then
		local var_27_6 = CCSprite:createWithSpriteFrameName("btkd_word_sdtt.png")

		var_27_6:setPosition(ccp(458, 255))
		arg_27_0.boxNode:addChild(var_27_6)

		local var_27_7 = CCArray:create()

		var_27_7:addObject(CCDelayTime:create(0.5))
		var_27_7:addObject(CCFadeOut:create(0.5))
		var_27_7:addObject(CCCallFuncN:create(function()
			var_27_6:removeFromParentAndCleanup(true)
		end))

		local var_27_8 = CCSequence:create(var_27_7)

		var_27_6:runAction(var_27_8)
	end

	arg_27_0.ironMineBox = {}

	for iter_27_2 = 1, #arg_27_0.info.boxs do
		local var_27_9 = arg_27_0.info.boxs[iter_27_2]
		local var_27_10

		if var_27_9.id == 0 then
			var_27_10 = CCSprite:createWithSpriteFrameName("btkd_box.png")
		else
			var_27_10 = CCSprite:createWithSpriteFrameName("btkd_box_open.png")

			var_27_10:setColor(ccc3(80, 80, 150))

			local var_27_11 = CCSprite:createWithSpriteFrameName(var_0_9[var_27_9.quality])

			var_27_11:setScale(0.7)
			var_27_11:setPosition(ccp(var_0_11[iter_27_2].x - 10, var_0_11[iter_27_2].y - 15))
			arg_27_0.boxNode:addChild(var_27_11, 1)
		end

		var_27_10:setPosition(var_0_11[iter_27_2])
		arg_27_0.boxNode:addChild(var_27_10, 0)
		table.insert(arg_27_0.ironMineBox, var_27_10)

		if var_27_5 then
			var_27_10:setVisible(false)

			local var_27_12 = CCArray:create()

			var_27_12:addObject(CCDelayTime:create(1))
			var_27_12:addObject(CCCallFuncN:create(function()
				var_27_10:setVisible(true)
			end))

			if iter_27_2 == #arg_27_0.info.boxs then
				arg_27_0.view.widgets.node_buyKey:setVisible(false)
				var_27_12:addObject(CCCallFuncN:create(function()
					arg_27_0.view.widgets.node_buyKey:setVisible(true)
				end))
			end

			local var_27_13 = CCSequence:create(var_27_12)

			var_27_10:runAction(var_27_13)
		end
	end

	if arg_27_0.info.copiesBoxIron > 0 or arg_27_0.info.copiesBoxToken > 0 then
		arg_27_0:addBoxReward()
	else
		if arg_27_0.info.keyNum > 0 then
			-- block empty
		end

		local var_27_14 = 0
		local var_27_15 = CCLayerColor:create(ccc4(255, 255, 255, 0))

		var_27_15:registerScriptTouchHandler(function(arg_31_0, arg_31_1, arg_31_2)
			if arg_31_0 == CCTOUCHBEGAN then
				log.info("CCTOUCH_BEGAN", arg_31_1, arg_31_2)

				for iter_31_0 = 1, #arg_27_0.ironMineBox do
					local var_31_0 = tolua.cast(arg_27_0.ironMineBox[iter_31_0], "CCSprite")

					if tool.checkIfTouch(var_31_0, arg_31_1, arg_31_2) and arg_27_0.info.boxs[iter_31_0].id == 0 then
						var_27_14 = iter_31_0

						var_31_0:setPosition(ccp(var_0_11[var_27_14].x, var_0_11[var_27_14].y - 10))

						return true
					end
				end

				return false
			elseif arg_31_0 == CCTOUCHMOVED then
				log.info("CCTOUCH_MOVED", arg_31_1, arg_31_2)

				local var_31_1 = tolua.cast(arg_27_0.ironMineBox[var_27_14], "CCSprite")

				if not tool.checkIfTouch(var_31_1, arg_31_1, arg_31_2) then
					var_31_1:setPosition(var_0_11[var_27_14])

					return false
				end

				return true
			elseif arg_31_0 == CCTOUCHENDED then
				log.info("CCTOUCH_ENDED", arg_31_1, arg_31_2)

				local var_31_2 = tolua.cast(arg_27_0.ironMineBox[var_27_14], "CCSprite")

				if tool.checkIfTouch(var_31_2, arg_31_1, arg_31_2) then
					var_31_2:setPosition(var_0_11[var_27_14])

					if arg_27_0.info.keyNum > 0 then
						arg_27_0:showOpenBoxEffect(var_27_14)
					else
						messageBox.alert(nil, language.get(135036))
					end

					return true
				end

				return false
			end
		end, false, true)
		var_27_15:setTouchEnabled(true)
		arg_27_0.view.widgets.panel:addChild(var_27_15)

		if arg_27_0.maskLayer then
			arg_27_0.maskLayer:removeFromParentAndCleanup(true)
		end

		arg_27_0.maskLayer = var_27_15
	end
end

function var_0_15.addBoxReward(arg_32_0)
	if arg_32_0.rewardNode then
		arg_32_0.rewardNode:removeAllChildrenWithCleanup(true)
	else
		arg_32_0.rewardNode = CCSpriteBatchNode:create("res/ui/activity/ironMine/ironMinePic.png")

		arg_32_0.view.widgets.panel:addChild(arg_32_0.rewardNode, 30)
	end

	arg_32_0:addMask(var_0_7)

	local var_32_0

	for iter_32_0 = 1, #arg_32_0.info.boxs do
		if arg_32_0.info.lastBoxId == arg_32_0.info.boxs[iter_32_0].id then
			var_32_0 = arg_32_0.info.boxs[iter_32_0].pos

			break
		end
	end

	local var_32_1 = var_0_11[var_32_0]
	local var_32_2 = CCSprite:createWithSpriteFrameName("btkd_box_open.png")

	var_32_2:setPosition(var_32_1)
	arg_32_0.rewardNode:addChild(var_32_2)

	local var_32_3 = arg_32_0.info.boxs[var_32_0].quality
	local var_32_4 = CCSprite:createWithSpriteFrameName(var_0_9[var_32_3])

	var_32_4:setPosition(ccp(var_32_1.x, var_32_1.y - 20))
	var_32_4:setScale(0.7)
	arg_32_0.rewardNode:addChild(var_32_4)

	if arg_32_0.info.copiesBoxIron > 0 then
		arg_32_0.view.widgets.rewardIronNum:setString(language.get(135049, arg_32_0.info.singleBoxIron * arg_32_0.info.copiesBoxIron))
		arg_32_0.view.widgets.rewardIronNum:setPosition(ccp(var_32_1.x, var_32_1.y + 40))
		arg_32_0.view.widgets.rewardIronNum:setVisible(true)
	end

	if arg_32_0.info.copiesBoxToken > 0 then
		arg_32_0.view.widgets.rewardTokenNum:setString(var_0_12[arg_32_0.info.copiesBoxItemId].name .. language.get(135039, arg_32_0.info.copiesBoxToken))
		arg_32_0.view.widgets.rewardTokenNum:setPosition(ccp(var_32_1.x, var_32_1.y + 10))
		arg_32_0.view.widgets.rewardTokenNum:setVisible(true)
	end

	arg_32_0.boxReward = {}

	for iter_32_1 = 1, arg_32_0.info.copiesBoxIron + arg_32_0.info.copiesBoxToken do
		local var_32_5

		if iter_32_1 <= arg_32_0.info.copiesBoxIron then
			var_32_5 = CCSprite:createWithSpriteFrameName("btkd_icon_bt_light.png")

			table.insert(arg_32_0.boxReward, {
				obj = var_32_5,
				type = var_0_13
			})
		else
			var_32_5 = CCSprite:createWithSpriteFrameName(var_0_12[arg_32_0.info.copiesBoxItemId].pic)

			table.insert(arg_32_0.boxReward, {
				obj = var_32_5,
				type = var_0_14
			})
		end

		arg_32_0.rewardNode:addChild(var_32_5)

		local var_32_6 = math.random(90, 820)
		local var_32_7 = math.random(160, 240)

		var_32_5:setPosition(ccp(455, 450))
		var_32_5:runAction(CCEaseBounceOut:create(CCMoveTo:create(1, ccp(var_32_6, var_32_7))))
	end

	local var_32_8 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_32_8:registerScriptTouchHandler(function(arg_33_0, arg_33_1, arg_33_2)
		if arg_33_0 == CCTOUCHBEGAN then
			log.info("CCTOUCH_BEGAN", arg_33_1, arg_33_2)

			if arg_32_0.boxReward and #arg_32_0.boxReward > 0 then
				for iter_33_0 = 1, #arg_32_0.boxReward do
					local var_33_0 = tolua.cast(arg_32_0.boxReward[iter_33_0].obj, "CCSprite")

					if tool.checkIfTouch(var_33_0, arg_33_1, arg_33_2) then
						if #arg_32_0.boxReward <= 3 then
							arg_32_0:onReceivedIronMineBox(iter_33_0, #arg_32_0.boxReward, true)
						else
							arg_32_0:onReceivedIronMineBox(iter_33_0, 3, false)
						end

						return true
					end
				end
			end

			return false
		elseif arg_33_0 == CCTOUCHMOVED then
			log.info("CCTOUCH_MOVED", arg_33_1, arg_33_2)

			return true
		elseif arg_33_0 == CCTOUCHENDED then
			log.info("CCTOUCH_ENDED", arg_33_1, arg_33_2)

			return true
		end
	end, false, true)
	var_32_8:setTouchEnabled(true)
	arg_32_0.view.widgets.panel:addChild(var_32_8)

	if arg_32_0.maskLayer then
		arg_32_0.maskLayer:removeFromParentAndCleanup(true)
	end

	arg_32_0.maskLayer = var_32_8
end

function var_0_15.showBombEffect(arg_34_0)
	local var_34_0 = arg_34_0.bombNode:getChildren()

	if var_34_0 and var_34_0:count() > 0 then
		for iter_34_0 = 1, var_34_0:count() do
			local var_34_1 = tolua.cast(var_34_0:objectAtIndex(iter_34_0 - 1), "CCSprite")
			local var_34_2 = CCArray:create()
			local var_34_3 = CCRotateBy:create(0.1, 10)
			local var_34_4 = CCRotateBy:create(0.2, -20)
			local var_34_5 = CCRotateBy:create(0.1, 10)

			var_34_2:addObject(var_34_3)
			var_34_2:addObject(var_34_4)
			var_34_2:addObject(var_34_5)

			local var_34_6 = CCRepeat:create(CCSequence:create(var_34_2), 3)
			local var_34_7 = CCSprite:create()

			var_34_1:addChild(var_34_7)
			var_34_7:setPosition(ccp(35, 97))

			local var_34_8 = CCArray:create()

			for iter_34_1 = 1, 5 do
				local var_34_9 = CCSprite:createWithSpriteFrameName(string.format("btkt_huohua%04d.png", iter_34_1))

				var_34_8:addObject(var_34_9:displayFrame())
			end

			local var_34_10 = CCAnimation:createWithSpriteFrames(var_34_8, 0.1)
			local var_34_11 = CCAnimate:create(var_34_10)

			var_34_7:runAction(CCRepeatForever:create(var_34_11))

			local var_34_12 = CCArray:create()

			for iter_34_2 = 1, 14 do
				local var_34_13 = CCSprite:createWithSpriteFrameName(string.format("btkd_fire%02d.png", iter_34_2))

				var_34_12:addObject(var_34_13:displayFrame())
			end

			local var_34_14 = CCAnimation:createWithSpriteFrames(var_34_12, 0.1)
			local var_34_15 = CCAnimate:create(var_34_14)
			local var_34_16 = CCArray:create()

			var_34_16:addObject(var_34_6)
			var_34_16:addObject(CCCallFuncN:create(function()
				var_34_7:removeFromParentAndCleanup(true)

				local var_35_0, var_35_1 = var_34_1:getPosition()

				var_34_1:setPosition(var_35_0, var_35_1 - 100)
			end))
			var_34_16:addObject(var_34_15)
			var_34_16:addObject(CCCallFuncN:create(function()
				var_34_1:removeFromParentAndCleanup(true)
			end))

			if iter_34_0 == 3 then
				var_34_16:addObject(CCCallFuncN:create(function()
					arg_34_0:showStoneEffect()
				end))
			end

			local var_34_17 = CCSequence:create(var_34_16)

			var_34_1:runAction(CCSpeed:create(var_34_17, 2))
		end
	end
end

function var_0_15.showStoneEffect(arg_38_0)
	if arg_38_0.stoneNode then
		arg_38_0.stoneNode:removeAllChildrenWithCleanup(true)
	else
		arg_38_0.stoneNode = CCSpriteBatchNode:create("res/ui/activity/ironMine/ironMinePic.png")

		arg_38_0.view.widgets.panel:addChild(arg_38_0.stoneNode)
	end

	local function var_38_0()
		local var_39_0 = CCArray:create()

		var_39_0:addObject(CCMoveBy:create(0.12, ccp(10, 0)))
		var_39_0:addObject(CCMoveBy:create(0.12, ccp(-10, 0)))

		return CCSequence:create(var_39_0)
	end

	arg_38_0.view.widgets.stone:stopAllActions()
	arg_38_0.view.widgets.stone:setPosition(ccp(454, 455))
	arg_38_0.view.widgets.stone:runAction(CCRepeat:create(var_38_0(), 6))

	local var_38_1 = CCSprite:createWithSpriteFrameName("btkd_word_ddsy.png")

	var_38_1:setPosition(ccp(458, 255))
	arg_38_0.stoneNode:addChild(var_38_1)
	var_38_1:runAction(CCRepeat:create(var_38_0(), 5))

	local var_38_2 = 30

	for iter_38_0 = 1, var_38_2 do
		math.mod(iter_38_0, 4)

		local var_38_3 = CCSprite:createWithSpriteFrameName(string.format("btkt_ss%03d.png", 1 + math.mod(iter_38_0, 4)))

		arg_38_0.stoneNode:addChild(var_38_3)

		local var_38_4 = math.random(90, 820)
		local var_38_5 = math.random(240, 320)
		local var_38_6 = CCArray:create()

		var_38_6:addObject(CCCallFuncN:create(function()
			var_38_3:setPosition(ccp(var_38_4, 440))
			var_38_3:setOpacity(0)
		end))
		var_38_6:addObject(CCDelayTime:create(math.random(0, 0.5)))
		var_38_6:addObject(CCFadeIn:create(0.3))
		var_38_6:addObject(CCMoveTo:create(0.5, ccp(var_38_4, var_38_5)))
		var_38_6:addObject(CCFadeOut:create(0.3))

		if iter_38_0 == var_38_2 then
			var_38_6:addObject(CCCallFuncN:create(function()
				arg_38_0.stoneNode:removeAllChildrenWithCleanup(true)
				arg_38_0:onBombIronMine()
			end))
		end

		local var_38_7 = CCSequence:create(var_38_6)

		var_38_3:runAction(CCSpeed:create(var_38_7, 1.6))
	end
end

function var_0_15.showOpenBoxEffect(arg_42_0, arg_42_1)
	if arg_42_0.progNode then
		arg_42_0.progNode:removeAllChildrenWithCleanup(true)
	else
		arg_42_0.progNode = CCNode:create()

		arg_42_0.view.widgets.panel:addChild(arg_42_0.progNode, 20)
	end

	arg_42_0:addMask(var_0_7)

	local var_42_0 = CCSprite:create("res/ui/threeColorBag/jingdudi.png")

	var_42_0:setPosition(var_0_11[arg_42_1])
	var_42_0:setScale(1.2)
	arg_42_0.progNode:addChild(var_42_0)

	local var_42_1 = CCSprite:createWithSpriteFrameName("btkd_box.png")

	var_42_1:setPosition(var_0_11[arg_42_1])
	arg_42_0.progNode:addChild(var_42_1)

	local var_42_2 = CCProgressTimer:create(CCSprite:create("res/ui/threeColorBag/jingdu.png"))

	var_42_2:setScale(1.2)
	var_42_2:setType(kCCProgressTimerTypeRadial)
	var_42_2:setMidpoint(ccp(0.5, 0.5))
	var_42_2:setBarChangeRate(ccp(1, 0))
	var_42_2:setPercentage(0)
	var_42_2:setPosition(var_0_11[arg_42_1])
	arg_42_0.progNode:addChild(var_42_2)

	local var_42_3 = CCArray:create()

	var_42_3:addObject(CCProgressTo:create(0.8, 100))
	var_42_3:addObject(CCCallFuncN:create(function()
		arg_42_0.progNode:removeAllChildrenWithCleanup(true)
		arg_42_0:onGetIronMineReward(arg_42_1)
	end))

	local var_42_4 = CCSequence:create(var_42_3)

	var_42_2:runAction(var_42_4)
end

function var_0_15.showPanel(arg_44_0, arg_44_1)
	arg_44_0.info = arg_44_1

	arg_44_0.view.widgets.panel:setVisible(true)
	arg_44_0.view.widgets.stone:setVisible(true)
	arg_44_0.view.widgets.openBoxEndTxt1:setVisible(false)
	arg_44_0.view.widgets.openBoxEndTxt2:setVisible(false)
	arg_44_0.view.widgets.openBoxEndLb:setVisible(false)
	arg_44_0.view.widgets.rewardIronNum:setVisible(false)
	arg_44_0.view.widgets.rewardTokenNum:setVisible(false)
	arg_44_0.view.widgets.buyBombGoldLb:setString(arg_44_1.buyBombGold)
	arg_44_0.view.widgets.bombNumLb1:setString(language.get(135039, arg_44_1.bombNum))
	arg_44_0.view.widgets.bombNumLb2:setString(language.get(135039, arg_44_1.bombNum))
	arg_44_0.view.widgets.buyKeyGoldLb:setString(arg_44_1.openBoxGold)

	local var_44_0 = arg_44_1.bombNum > 0

	arg_44_0.view.widgets.bombNumLb1:setVisible(var_44_0)
	arg_44_0.view.widgets.buyBombGoldLb:setVisible(not var_44_0)

	local var_44_1 = arg_44_1.alreadyMine >= arg_44_1.totalMine

	arg_44_0.view.widgets.node_buyKey:setVisible(var_44_1)
	arg_44_0.view.widgets.btn_putBomb:setVisible(not var_44_1)

	local var_44_2 = "res/ui/activity/ironMine/btkd_bg_pit.jpg"

	if var_44_1 then
		var_44_2 = "res/ui/activity/ironMine/btkd_bg.jpg"
	end

	arg_44_0.view.widgets.mineBg:setDisplayFrame(CCSprite:create(var_44_2):displayFrame())
	arg_44_0.view.widgets.btn_city:setVisible(false)
	arg_44_0.view.widgets.Lb_cityName:setVisible(false)

	if arg_44_0.armyTimerLabel then
		arg_44_0.armyTimerLabel:removeFromParentAndCleanup(true)

		arg_44_0.armyTimerLabel = nil
	end

	arg_44_0.view.widgets.infoLb1:setVisible(true)
	arg_44_0.view.widgets.infoLb2:setVisible(true)

	if arg_44_1.cities and #arg_44_1.cities >= 1 then
		arg_44_0.view.widgets.infoLb1:setString(language.get(135041))
		arg_44_0.view.widgets.btn_city:addHandleOfControlEvent(function()
			arg_44_0:onGoToCity(arg_44_1.cities[1].cityId)
		end, CCControlEventTouchUpInside)
		arg_44_0.view.widgets.btn_city:setEnabled(true)
		arg_44_0.view.widgets.btn_city:setVisible(true)
		arg_44_0.view.widgets.Lb_cityName:setVisible(true)
		arg_44_0.view.widgets.Lb_cityName:setString(arg_44_1.cities[1].cityName)
	elseif arg_44_1.cd and arg_44_1.cd > 0 then
		arg_44_0.view.widgets.infoLb1:setString(language.get(135048))

		local function var_44_3()
			if arg_44_0.armyTimerLabel then
				arg_44_0.armyTimerLabel:removeFromParentAndCleanup(true)

				arg_44_0.armyTimerLabel = nil
			end

			arg_44_0:refresh()
		end

		local var_44_4 = createTimerLabel(arg_44_1.cd + 5000, "@M:@S", "Thonburi", 26, var_44_3, nil, nil, ccc3(255, 0, 0))

		arg_44_0.armyTimerLabel = var_44_4

		var_44_4:setPosition(ccp(arg_44_0.view.widgets.infoLb1:getContentSize().width + var_44_4:getSize().width / 2 + 4, 0))
		arg_44_0.view.widgets.infoLb1:addChild(var_44_4)
	else
		arg_44_0.view.widgets.infoLb1:setString("")
	end

	arg_44_0.view.widgets.infoLb2:setVisible(not var_44_1)
	arg_44_0.view.widgets.infoLb3:setVisible(var_44_1)

	if var_44_1 then
		arg_44_0.view.widgets.keyNum:setString(arg_44_1.keyNum)

		local var_44_5 = ""

		if arg_44_1.nextDayCd > 0 then
			local var_44_6 = math.floor(arg_44_1.nextDayCd / 3600000)
			local var_44_7 = math.floor(arg_44_1.nextDayCd / 60000) - 60 * var_44_6

			var_44_5 = language.get(135040, var_44_6, var_44_7)
		end

		arg_44_0.view.widgets.infoLb3:setString(var_44_5)
	else
		arg_44_0.putBombNum = 0

		if arg_44_1.alreadyMine == 0 then
			arg_44_0.view.widgets.infoLb2:setString(language.get(135050, arg_44_1.singleBombNum))
		elseif arg_44_1.alreadyMine < arg_44_1.totalMine - 1 then
			arg_44_0.view.widgets.infoLb2:setString(language.get(135031, arg_44_1.totalMine - arg_44_1.alreadyMine))
		elseif arg_44_1.alreadyMine == arg_44_1.totalMine - 1 then
			arg_44_0.view.widgets.infoLb2:setString(language.get(135032))
		end
	end

	arg_44_0:addMask(var_0_8)

	if var_44_1 and arg_44_1.copiesBombIron == 0 then
		arg_44_0:addBox()
	else
		arg_44_0:addIron()
	end
end

function var_0_15.ctor(arg_47_0, arg_47_1, arg_47_2)
	log.info("@@ 镔铁矿洞活动")
	rmgr.loadResource("res/ui/activity/ironMine/ironMinePic.plist")
	rmgr.loadResource("res/ui/activity/ironMine/btkd_fire.plist")

	arg_47_0.view = {}

	uiutil.initWidgets(arg_47_0.view, arg_47_0.layout)

	arg_47_0.leftTime = arg_47_0.view.widgets.leftTime

	if arg_47_1 then
		arg_47_0:addChild(arg_47_0.view.widgets.panel)
		arg_47_1:addChild(arg_47_0)
	end

	arg_47_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_47_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_47_0.view.widgets.btn_putBomb:addHandleOfControlEvent(function()
		log.info("btn_putBomb")
		arg_47_0:onPutIronMineBomb()
	end, CCControlEventTouchUpInside)
	arg_47_0.view.widgets.btn_buyKey:addHandleOfControlEvent(function()
		log.info("btn_buyKey")
		arg_47_0:onBuyIronMineKey()
	end, CCControlEventTouchUpInside)
	arg_47_0.view.widgets.shadow:setScaleX(181.8)
	arg_47_0.view.widgets.btn_clearCd:setScaleX(-1)
	arg_47_0.view.widgets.btn_clearCd:addHandleOfControlEvent(function()
		log.info("btn_clearCd")
		arg_47_0:onClearCd()
	end, CCControlEventTouchUpInside)
	arg_47_0:showPanel(arg_47_2)
end

function var_0_15.showTip(arg_52_0)
	local var_52_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_52_0:registerScriptTouchHandler(function(arg_53_0, arg_53_1, arg_53_2)
		if arg_53_0 == CCTOUCHBEGAN then
			return true
		elseif arg_53_0 == CCTOUCHMOVED then
			return true
		elseif arg_53_0 == CCTOUCHENDED then
			pcall(var_52_0.removeFromParentAndCleanup, var_52_0, true)

			return true
		end
	end, false, true)
	var_52_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_52_0, 60000)

	local var_52_1 = 0
	local var_52_2 = 0
	local var_52_3 = {}

	uiutil.initWidgets(var_52_3, var_0_15.tipFrame)
	var_52_0:addChild(var_52_3.widgets.tipFrame)

	local var_52_4, var_52_5 = tool.getPositionInScreen(arg_52_0.view.widgets.btn_tip)
	local var_52_6 = var_52_4 + 20
	local var_52_7 = var_52_5 - 20
	local var_52_8 = var_52_3.widgets.tipMsg:getContentSize().width
	local var_52_9 = var_52_3.widgets.tipMsg:getContentSize().height

	var_52_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_52_8 + 30, var_52_9 + 30))
	var_52_3.widgets.tipFrame:setPosition(ccp(var_52_6, var_52_7))
	var_52_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_52_3.widgets.tipFrame:setVisible(true)
end

return var_0_15
