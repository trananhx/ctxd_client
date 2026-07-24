local var_0_0 = true
local var_0_1 = 20
local var_0_2 = tool.hexToRgb("#D9EDC5")
local var_0_3 = ccc3(0, 180, 0)
local var_0_4 = colorQuality[5]
local var_0_5 = colorQuality[4]
local var_0_6 = colorQuality[2]
local var_0_7 = class("GemMine", function()
	return createBaseLayer()
end)

var_0_7.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			name = "panel",
			type = "sprite",
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 - 30,
			pic = {
				path = "res/ui/comment/bg1.jpg"
			},
			children = {
				{
					type = "node",
					name = "node_over",
					y = 0,
					visible = false,
					x = 0,
					children = {
						{
							y = 3,
							type = "sprite",
							x = 457.5,
							anchorPoint = ccp(0.5, 0),
							pic = {
								path = "res/ui/activity/gemsActivity/new/xsczbs_bg2.jpg"
							}
						},
						{
							y = 220,
							x = 458,
							type = "sprite",
							pic = {
								path = "res/ui/activity/gemMine/bskd_word_04.png"
							}
						}
					}
				},
				{
					type = "node",
					name = "node_mine",
					y = 0,
					visible = false,
					x = 0,
					children = {
						{
							x = 3,
							height = 415,
							name = "mask",
							type = "layerColor",
							y = 3,
							zorder = 300,
							visible = false,
							width = 909,
							color = ccc4(0, 0, 0, 150),
							children = {
								{
									name = "btn_mask",
									h = 415,
									type = "button",
									w = 909,
									y = 0,
									x = 0,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									},
									anchorPoint = ccp(0, 0)
								}
							}
						},
						{
							y = 241,
							name = "bg",
							type = "sprite",
							x = 457.5,
							pic = {
								path = "res/ui/activity/gemMine/bskd_bg1.jpg"
							}
						},
						{
							y = 415,
							name = "bar1",
							type = "sprite",
							x = 457.5,
							pic = {
								frame = true,
								path = "btkd_line.png"
							}
						},
						{
							y = 70,
							name = "bar2",
							type = "sprite",
							x = 457.5,
							pic = {
								frame = true,
								path = "btkd_line.png"
							}
						},
						{
							name = "btn_bombAll",
							h = 56,
							type = "button",
							w = 212,
							y = 32,
							x = 458,
							normal = {
								path = "res/ui/common/button/sdyjs_btn_02.png"
							},
							touched = {
								path = "res/ui/common/button/sdyjs_btn_02_c.png"
							},
							disable = {
								path = "res/ui/common/button/sdyjs_btn_02_g.png"
							},
							children = {
								{
									x = 40,
									name = "icon_gold2",
									y = 40,
									type = "sprite",
									scale = 0.6,
									pic = {
										path = "res/ui/activity/ironRotary/yuanbao.png"
									}
								},
								{
									fontSize = 22,
									name = "bombAllGold",
									y = 22,
									type = "label",
									x = 40,
									color = var_0_5
								},
								{
									fontSize = 25,
									y = 32,
									type = "label",
									x = 130,
									textId = 136083
								}
							}
						},
						{
							name = "btn_next",
							h = 56,
							type = "button",
							w = 189,
							y = 32,
							visible = false,
							x = 665,
							normal = {
								path = "res/ui/common/button/sdyjs_btn_03.png"
							},
							touched = {
								path = "res/ui/common/button/sdyjs_btn_03_c.png"
							},
							disable = {
								path = "res/ui/common/button/sdyjs_btn_03_g.png"
							},
							children = {
								{
									fontSize = 25,
									y = 32,
									type = "label",
									x = 92,
									textId = 136084
								}
							}
						},
						{
							y = 85,
							name = "icon_bomb",
							type = "sprite",
							x = 45,
							zorder = 310,
							pic = {
								frame = true,
								path = "btkd_icon_bomb.png"
							}
						},
						{
							fontSize = 22,
							name = "bombNum",
							y = 55,
							type = "label",
							x = 60,
							zorder = 310,
							anchorPoint = ccp(0, 0.5)
						},
						{
							y = 55,
							name = "icon_gold1",
							type = "sprite",
							x = 60,
							zorder = 310,
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/activity/ironRotary/yuanbao.png"
							},
							children = {
								{
									fontSize = 22,
									name = "buyBombGold",
									y = 20,
									type = "label",
									x = 50,
									anchorPoint = ccp(0, 0.5),
									color = var_0_5
								}
							}
						},
						{
							fontSize = 22,
							name = "info",
							y = 20,
							type = "label",
							x = 15,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					y = 460,
					name = "title",
					type = "sprite",
					x = 458,
					pic = {
						path = "res/ui/activity/gemMine/bskd_title.png"
					}
				},
				{
					y = 460,
					name = "btn_tip",
					style = "button_tip",
					type = "button",
					x = 840
				},
				{
					fontSize = 25,
					name = "leftTime",
					y = 450,
					type = "label",
					style = "label_warlock",
					x = 705,
					color = var_0_4
				}
			}
		}
	}
}

function var_0_7.getLayout_btnMine(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_0.info.gemMines[arg_2_1] or {}
	local var_2_1 = 1
	local var_2_2 = 1

	if var_2_0.gemlv >= 1 and var_2_0.gemlv <= 16 then
		var_2_1 = math.ceil(var_2_0.gemlv / 4)
		var_2_2 = (var_2_0.gemlv - 1) % 4 + 1
	end

	return {
		type = "node",
		visible = var_2_0 and var_2_0.fallDown == 0,
		name = "node_btn" .. arg_2_1,
		x = arg_2_2.x,
		y = arg_2_2.y,
		children = {
			{
				w = 240,
				h = 108,
				type = "button",
				y = 0,
				x = 20,
				name = "btn_mine" .. arg_2_1,
				normal = {
					path = "res/ui/activity/gemMine/bskd_kuangkeng.png"
				},
				touched = {
					path = "res/ui/activity/gemMine/bskd_kuangkeng_c.png"
				}
			},
			{
				y = 0,
				type = "sprite",
				x = 0,
				name = "icon_gem" .. arg_2_1,
				pic = {
					path = string.format("res/ui/activity/gemMine/bskd_km_%02d.png", var_2_1)
				}
			},
			{
				fontSize = 25,
				type = "label",
				y = 50,
				x = 0,
				text = language.get(136072, var_2_0.deep),
				name = "deep" .. arg_2_1
			},
			{
				y = -40,
				type = "sprite",
				x = -45,
				name = string.format("star%s1", arg_2_1),
				pic = {
					frame = true,
					path = var_2_2 >= 1 and "star_light.png" or "star_dark.png"
				}
			},
			{
				y = -40,
				type = "sprite",
				x = -15,
				name = string.format("star%s2", arg_2_1),
				pic = {
					frame = true,
					path = var_2_2 >= 2 and "star_light.png" or "star_dark.png"
				}
			},
			{
				y = -40,
				type = "sprite",
				x = 15,
				name = string.format("star%s3", arg_2_1),
				pic = {
					frame = true,
					path = var_2_2 >= 3 and "star_light.png" or "star_dark.png"
				}
			},
			{
				y = -40,
				type = "sprite",
				x = 45,
				name = string.format("star%s4", arg_2_1),
				pic = {
					frame = true,
					path = var_2_2 >= 4 and "star_light.png" or "star_dark.png"
				}
			}
		}
	}
end

var_0_7.tipFrame = {
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
			fontSize = 20,
			height = 0,
			name = "tipMsg",
			type = "label",
			textId = 136080,
			style = "label_warlock",
			width = 400,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_2
		}
	}
}

function var_0_7.refresh(arg_3_0)
	local function var_3_0(arg_4_0)
		arg_3_0:showPanel(arg_4_0.action.data)
	end

	cmgr.sendRequest(var_3_0, actions.getGemMineActivity)
end

function var_0_7.onBombGemMine(arg_5_0, arg_5_1)
	local function var_5_0(arg_6_0)
		local var_6_0 = arg_6_0.action.data

		arg_5_0.info.nextRound = var_6_0.nextRound

		arg_5_0:showEffectDropGem(var_6_0.gemMines)

		var_0_0 = false

		arg_5_0:addGuide()
	end

	if arg_5_0.info.bombNum > 0 then
		arg_5_0.view.widgets.btn_bombAll:setEnabled(false)
		cmgr.sendRequest(var_5_0, actions.bombGemMine, arg_5_1)
	else
		messageBox.showChargeWinWithData("", language.get(136076, arg_5_0.info.buyBombGold), "gemMineBuyBomb", function()
			arg_5_0.view.widgets.btn_bombAll:setEnabled(false)
			cmgr.sendRequest(var_5_0, actions.bombGemMine, arg_5_1)
		end)
	end
end

function var_0_7.onBombAllGemMine(arg_8_0)
	local function var_8_0(arg_9_0)
		local var_9_0 = arg_9_0.action.data

		arg_8_0.info.nextRound = var_9_0.nextRound

		arg_8_0:showEffectDropGem(var_9_0.gemMines)

		var_0_0 = false

		arg_8_0:addGuide()
	end

	if arg_8_0.info.bombAllGold == 0 then
		arg_8_0.view.widgets.btn_bombAll:setEnabled(false)
		cmgr.sendRequest(var_8_0, actions.bombAllGemMine)
	else
		messageBox.showChargeWinWithData("", language.get(136075, arg_8_0.info.bombAllGold), "gemMineAllBomb", function()
			arg_8_0.view.widgets.btn_bombAll:setEnabled(false)
			cmgr.sendRequest(var_8_0, actions.bombAllGemMine)
		end)
	end
end

function var_0_7.onGemMineNextRound(arg_11_0)
	local function var_11_0(arg_12_0)
		for iter_12_0, iter_12_1 in pairs(arg_11_0.info.gemMines) do
			arg_11_0.view.widgets["node_btn" .. iter_12_1.pos]:setVisible(false)
		end

		arg_11_0:showEffectNext(false)
	end

	messageBox.confirm(language.get(136074), function()
		cmgr.sendRequest(var_11_0, actions.gemMineNextRound)
	end)
end

function var_0_7.showTip(arg_14_0)
	log.info("should show tips ")

	local var_14_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_14_0:registerScriptTouchHandler(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == CCTOUCHBEGAN then
			return true
		elseif arg_15_0 == CCTOUCHMOVED then
			return true
		elseif arg_15_0 == CCTOUCHENDED then
			pcall(var_14_0.removeFromParentAndCleanup, var_14_0, true)

			return true
		end
	end, false, true)
	var_14_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_14_0, 60000)

	local var_14_1 = 0
	local var_14_2 = 0
	local var_14_3 = {}

	uiutil.initWidgets(var_14_3, arg_14_0.tipFrame)
	var_14_0:addChild(var_14_3.widgets.tipFrame)

	local var_14_4 = arg_14_0.view.widgets.btn_tip
	local var_14_5, var_14_6 = tool.getPositionInScreen(var_14_4)
	local var_14_7 = var_14_5 + 20
	local var_14_8 = var_14_6 - 20
	local var_14_9 = var_14_3.widgets.tipMsg:getContentSize().width
	local var_14_10 = var_14_3.widgets.tipMsg:getContentSize().height

	var_14_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_14_9 + 30, var_14_10 + 30))
	var_14_3.widgets.tipFrame:setPosition(ccp(var_14_7, var_14_8))
	var_14_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_14_3.widgets.tipFrame:setVisible(true)
end

function var_0_7.addGuide(arg_16_0)
	if var_0_0 then
		if arg_16_0.guideNode then
			arg_16_0.guideNode:removeAllChildrenWithCleanup(true)
		else
			arg_16_0.guideNode = CCNode:create()

			arg_16_0.view.widgets.node_mine:addChild(arg_16_0.guideNode, 200)
		end

		local var_16_0 = CCSprite:create("res/ui/activity/gemMine/bskd_word_01.png")

		var_16_0:setPosition(ccp(458, 370))
		arg_16_0.guideNode:addChild(var_16_0)

		for iter_16_0 = 1, 3 do
			local var_16_1 = CCSprite:create("res/ui/activity/gemMine/bskd_arrow.png")

			var_16_1:setPosition(ccp(130 + 330 * (iter_16_0 - 1), 250))

			local var_16_2 = CCStrokeLabelTTF:create(language.get(136079), "Thonburi", 22, 1)

			var_16_2:setColor(var_0_5)
			var_16_2:setPosition(ccp(38, 70))
			var_16_1:addChild(var_16_2)
			arg_16_0.guideNode:addChild(var_16_1)

			local var_16_3 = CCJumpBy:create(1, ccp(0, 0), 40, 1)

			var_16_1:runAction(CCRepeatForever:create(var_16_3))
		end
	elseif arg_16_0.guideNode then
		arg_16_0.guideNode:removeAllChildrenWithCleanup(true)
	end
end

function var_0_7.addBtnMine(arg_17_0)
	if arg_17_0.btnNode then
		arg_17_0.btnNode:removeAllChildrenWithCleanup(true)
	else
		arg_17_0.btnNode = CCNode:create()

		arg_17_0.view.widgets.node_mine:addChild(arg_17_0.btnNode, 100)
	end

	local var_17_0 = #arg_17_0.info.gemMines

	if var_17_0 > 5 then
		var_17_0 = 5
	end

	local var_17_1

	if var_17_0 == 3 then
		var_17_1 = {
			ccp(130, 150),
			ccp(460, 150),
			ccp(790, 150)
		}
	else
		var_17_1 = {
			ccp(170, 260),
			ccp(750, 260),
			ccp(130, 130),
			ccp(460, 180),
			ccp(790, 130)
		}
	end

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.info.gemMines) do
		local var_17_2 = iter_17_1.pos
		local var_17_3 = var_17_1[var_17_2]

		uiutil.initWidgets(arg_17_0.view, arg_17_0:getLayout_btnMine(var_17_2, var_17_3))
		arg_17_0.btnNode:addChild(arg_17_0.view.widgets["node_btn" .. var_17_2])
		arg_17_0.view.widgets["btn_mine" .. var_17_2]:addHandleOfControlEvent(function()
			log.info("btn_mine" .. var_17_2)
			arg_17_0:onBombGemMine(var_17_2)
		end, CCControlEventTouchUpInside)
	end
end

function var_0_7.showEffectNext(arg_19_0, arg_19_1)
	arg_19_0.view.widgets.btn_bombAll:setEnabled(false)
	arg_19_0.view.widgets.btn_next:setEnabled(false)

	local var_19_0 = CCSprite:create()

	var_19_0:setPosition(ccp(457.5, 241))
	var_19_0:setDisplayFrame(arg_19_0.view.widgets.bg:displayFrame())
	arg_19_0.bgLayer:addChild(var_19_0)
	arg_19_0.view.widgets.bg:setDisplayFrame(CCSprite:create(string.format("res/ui/activity/gemMine/bskd_bg%d.jpg", arg_19_0.info.round % 3 + 1)):displayFrame())
	arg_19_0.view.widgets.bg:setOpacity(0)

	local var_19_1 = CCMoveBy:create(0.6, ccp(-400, 0))
	local var_19_2 = CCFadeOut:create(0.6)
	local var_19_3 = CCArray:create()

	var_19_3:addObject(CCDelayTime:create(0.3))

	if arg_19_1 then
		var_19_3:addObject(CCCallFuncN:create(function()
			local var_20_0 = CCSprite:create("res/ui/activity/gemMine/bskd_word_05.png")

			var_20_0:setPosition(ccp(457.5, 241))
			arg_19_0.bgLayer:addChild(var_20_0)

			local var_20_1 = CCArray:create()

			var_20_1:addObject(CCDelayTime:create(0.5))
			var_20_1:addObject(CCFadeOut:create(0.5))
			var_20_1:addObject(CCCallFuncN:create(function()
				var_20_0:removeFromParentAndCleanup(true)
			end))
			var_20_0:runAction(CCSequence:create(var_20_1))
		end))
		var_19_3:addObject(CCDelayTime:create(0.8))
	end

	var_19_3:addObject(CCSpawn:createWithTwoActions(var_19_1, var_19_2))
	var_19_3:addObject(CCCallFuncN:create(function()
		arg_19_0.view.widgets.bg:runAction(CCFadeIn:create(0.6))
	end))
	var_19_3:addObject(CCDelayTime:create(0.6))
	var_19_3:addObject(CCCallFuncN:create(function()
		var_19_0:removeFromParentAndCleanup(true)
		arg_19_0:refresh()
	end))
	var_19_0:runAction(CCSequence:create(var_19_3))
end

function var_0_7.showEffectGetGem(arg_24_0)
	if arg_24_0.isInEffect then
		return
	else
		arg_24_0.isInEffect = true
	end

	arg_24_0.gemTable = arg_24_0.gemTable or {}

	local var_24_0 = 0

	for iter_24_0, iter_24_1 in pairs(arg_24_0.gemTable) do
		var_24_0 = var_24_0 + 1
	end

	local var_24_1 = 0
	local var_24_2 = 0.3
	local var_24_3 = 0

	for iter_24_2, iter_24_3 in pairs(arg_24_0.gemTable) do
		local var_24_4 = arg_24_0.view.widgets["node_btn" .. iter_24_2]
		local var_24_5, var_24_6 = tool.getPositionInScreen(var_24_4)
		local var_24_7 = arg_24_0.info.gemMines[iter_24_2]
		local var_24_8 = {}

		for iter_24_4 = 1, var_24_7.copies do
			local var_24_9 = {}

			var_24_9.id = 7
			var_24_9.value = var_24_7.gemNum
			var_24_9.gemLevel = var_24_7.dropGemLv

			table.insert(var_24_8, var_24_9)
		end

		var_24_3 = var_24_3 + 1

		local var_24_10 = CCArray:create()

		var_24_10:addObject(CCDelayTime:create(var_24_1))
		var_24_10:addObject(CCCallFuncN:create(function()
			for iter_25_0, iter_25_1 in pairs(iter_24_3) do
				pcall(iter_25_1.removeFromParentAndCleanup, iter_25_1, true)
			end

			globalAction_gotResource(var_24_8)
		end))

		if var_24_3 == var_24_0 then
			var_24_10:addObject(CCCallFuncN:create(function()
				arg_24_0.isInEffect = false

				arg_24_0.view.widgets.btn_bombAll:setEnabled(false)
				arg_24_0.view.widgets.mask:setVisible(false)

				if arg_24_0.info.nextRound == 1 then
					arg_24_0:showEffectNext(true)
				elseif arg_24_0.info.nextRound == 0 then
					arg_24_0:refresh()
				end
			end))
		end

		local var_24_11 = CCSequence:create(var_24_10)

		var_24_4:runAction(var_24_11)

		var_24_1 = var_24_1 + var_24_2
	end
end

function var_0_7.showEffectDropGem(arg_27_0, arg_27_1)
	if arg_27_0.gemNode then
		arg_27_0.gemNode:removeAllChildrenWithCleanup(true)
	else
		arg_27_0.gemNode = CCNode:create()

		arg_27_0.view.widgets.node_mine:addChild(arg_27_0.gemNode, 400)
	end

	arg_27_0.gemTable = {}
	arg_27_0.isInEffect = false

	for iter_27_0, iter_27_1 in ipairs(arg_27_1) do
		for iter_27_2, iter_27_3 in pairs(arg_27_0.info.gemMines) do
			if iter_27_3.pos == iter_27_1.pos then
				arg_27_0.info.gemMines[iter_27_1.pos] = iter_27_1
				arg_27_0.info.gemMines[iter_27_1.pos].fallDown = iter_27_1.thisTimesFallDown

				break
			end
		end

		arg_27_0.gemTable[iter_27_1.pos] = {}

		local var_27_0, var_27_1 = arg_27_0.view.widgets["node_btn" .. iter_27_1.pos]:getPosition()
		local var_27_2, var_27_3 = tool.getPositionInScreen(arg_27_0.view.widgets["node_btn" .. iter_27_1.pos])
		local var_27_4 = iter_27_0 == #arg_27_1

		arg_27_0:showBombEffect(iter_27_1.pos, var_27_4)

		if iter_27_1.updateGem == 1 then
			local var_27_5 = rmgr.getAnimation("warlockUpgrade")
			local var_27_6 = CCAnimation:createWithSpriteFrames(var_27_5, 0.08)
			local var_27_7 = CCAnimate:create(var_27_6)
			local var_27_8 = CCRepeat:create(var_27_7, 1)
			local var_27_9 = CCSprite:create()

			var_27_9:setPosition(ccp(var_27_0, var_27_1 + 30))
			arg_27_0.gemNode:addChild(var_27_9)

			local var_27_10 = CCArray:create()

			var_27_10:addObject(CCDelayTime:create(0.3))
			var_27_10:addObject(var_27_8)
			var_27_10:addObject(CCCallFuncN:create(function()
				var_27_9:removeFromParentAndCleanup(true)
			end))
			var_27_9:runAction(CCSequence:create(var_27_10))

			local var_27_11 = CCSprite:create("res/ui/activity/gemMine/bskd_word_bsdjts.png")

			var_27_11:setPosition(ccp(var_27_0, var_27_1 + 30))
			var_27_11:setVisible(false)
			arg_27_0.gemNode:addChild(var_27_11)

			local var_27_12 = CCArray:create()

			var_27_12:addObject(CCDelayTime:create(0.6))
			var_27_12:addObject(CCShow:create())
			var_27_12:addObject(CCDelayTime:create(0.3))
			var_27_12:addObject(CCMoveBy:create(0.6, ccp(0, 30)))
			var_27_12:addObject(CCCallFuncN:create(function()
				var_27_11:removeFromParentAndCleanup(true)
			end))
			var_27_11:runAction(CCSequence:create(var_27_12))
		end

		if iter_27_1.fallDown == 1 then
			local var_27_13 = CCSprite:create("res/ui/activity/gemMine/bskd_kuangkeng_c.png")

			var_27_13:setPosition(ccp(120, 54))
			var_27_13:setVisible(false)
			arg_27_0.view.widgets["btn_mine" .. iter_27_1.pos]:addChild(var_27_13)

			local var_27_14 = CCArray:create()

			var_27_14:addObject(CCDelayTime:create(0.3))
			var_27_14:addObject(CCBlink:create(0.6, 3))
			var_27_14:addObject(CCCallFuncN:create(function()
				var_27_13:removeFromParentAndCleanup(true)
			end))
			var_27_13:runAction(CCSequence:create(var_27_14))

			local var_27_15 = CCSprite:create("res/ui/activity/gemMine/bskd_word_kdtt.png")

			var_27_15:setPosition(ccp(var_27_0, var_27_1 + 30))
			var_27_15:setVisible(false)
			arg_27_0.gemNode:addChild(var_27_15)

			local var_27_16 = CCArray:create()

			var_27_16:addObject(CCDelayTime:create(0.6))
			var_27_16:addObject(CCShow:create())
			var_27_16:addObject(CCDelayTime:create(0.3))
			var_27_16:addObject(CCMoveBy:create(0.6, ccp(0, 30)))
			var_27_16:addObject(CCCallFuncN:create(function()
				var_27_15:removeFromParentAndCleanup(true)
				arg_27_0.view.widgets["node_btn" .. iter_27_1.pos]:setVisible(false)
			end))
			var_27_15:runAction(CCSequence:create(var_27_16))
		end

		for iter_27_4 = 1, iter_27_1.copies do
			local var_27_17 = math.ceil(iter_27_1.gemlv / 4)
			local var_27_18 = CCSprite:create(string.format("res/ui/activity/gemsActivity/new/gem_a%d.png", var_27_17))

			var_27_18:setVisible(false)
			var_27_18:setPosition(ccp(var_27_0, var_27_1 + 50))
			arg_27_0.gemNode:addChild(var_27_18)
			table.insert(arg_27_0.gemTable[iter_27_1.pos], var_27_18)

			local var_27_19 = var_27_0 + math.random(-80, 80)
			local var_27_20 = var_27_1 + math.random(-50, 50)
			local var_27_21 = CCArray:create()

			var_27_21:addObject(CCDelayTime:create(iter_27_1.fallDown == 1 and 1.5 or 0.6))
			var_27_21:addObject(CCShow:create())
			var_27_21:addObject(CCEaseBounceOut:create(CCMoveTo:create(0.6, ccp(var_27_19, var_27_20))))

			if iter_27_4 == iter_27_1.copies then
				iter_27_1.dropGemLv = iter_27_1.gemlv
				iter_27_1.gemlv = iter_27_1.nextGemLv

				local var_27_22 = 1
				local var_27_23 = 1

				if iter_27_1.gemlv >= 1 and iter_27_1.gemlv <= 16 then
					var_27_22 = math.ceil(iter_27_1.gemlv / 4)
					var_27_23 = (iter_27_1.gemlv - 1) % 4 + 1
				end

				arg_27_0.view.widgets["icon_gem" .. iter_27_1.pos]:setDisplayFrame(CCSprite:create(string.format("res/ui/activity/gemMine/bskd_km_%02d.png", var_27_22)):displayFrame())
				arg_27_0.view.widgets["deep" .. iter_27_1.pos]:setString(language.get(136072, iter_27_1.deep))

				for iter_27_5 = 1, 4 do
					arg_27_0.view.widgets["star" .. iter_27_1.pos .. iter_27_5]:setDisplayFrame(tool.spriteFrameByName(iter_27_5 <= var_27_23 and "star_light.png" or "star_dark.png"))
				end
			end

			local var_27_24 = CCSequence:create(var_27_21)

			var_27_18:runAction(var_27_24)
		end

		if var_27_4 then
			arg_27_0.view.widgets.mask:setVisible(true)
		end
	end

	arg_27_0.view.widgets.mask:setVisible(true)
end

function var_0_7.showBombEffect(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = CCSprite:createWithSpriteFrameName("btkd_icon_bomb.png")

	var_32_0:setAnchorPoint(ccp(0.5, 0))
	arg_32_0.view.widgets["node_btn" .. arg_32_1]:addChild(var_32_0)

	local var_32_1 = CCArray:create()
	local var_32_2 = CCRotateBy:create(0.05, 10)
	local var_32_3 = CCRotateBy:create(0.1, -20)
	local var_32_4 = CCRotateBy:create(0.05, 10)

	var_32_1:addObject(var_32_2)
	var_32_1:addObject(var_32_3)
	var_32_1:addObject(var_32_4)

	local var_32_5 = CCRepeat:create(CCSequence:create(var_32_1), 2)
	local var_32_6 = CCSprite:create()

	var_32_0:addChild(var_32_6)
	var_32_6:setPosition(ccp(35, 97))

	local var_32_7 = CCArray:create()

	for iter_32_0 = 1, 5 do
		local var_32_8 = CCSprite:createWithSpriteFrameName(string.format("btkt_huohua%04d.png", iter_32_0))

		var_32_7:addObject(var_32_8:displayFrame())
	end

	local var_32_9 = CCAnimation:createWithSpriteFrames(var_32_7, 0.08)
	local var_32_10 = CCAnimate:create(var_32_9)

	var_32_6:runAction(CCRepeatForever:create(var_32_10))

	local var_32_11 = CCArray:create()

	for iter_32_1 = 1, 14 do
		local var_32_12 = CCSprite:createWithSpriteFrameName(string.format("btkd_fire%02d.png", iter_32_1))

		var_32_11:addObject(var_32_12:displayFrame())
	end

	local var_32_13 = CCAnimation:createWithSpriteFrames(var_32_11, 0.08)
	local var_32_14 = CCAnimate:create(var_32_13)
	local var_32_15 = CCArray:create()

	var_32_15:addObject(var_32_5)
	var_32_15:addObject(CCCallFuncN:create(function()
		var_32_6:removeFromParentAndCleanup(true)

		local var_33_0, var_33_1 = var_32_0:getPosition()

		var_32_0:setPosition(var_33_0, var_33_1 - 100)

		if arg_32_2 then
			local var_33_2 = CCArray:create()

			var_33_2:addObject(CCMoveBy:create(0.1, ccp(15, 0)))
			var_33_2:addObject(CCEaseElasticOut:create(CCMoveBy:create(1, ccp(-15, 0)), 0.2))

			local var_33_3 = CCSequence:create(var_33_2)

			arg_32_0.view.widgets.node_mine:runAction(var_33_3)
		end
	end))
	var_32_15:addObject(var_32_14)
	var_32_15:addObject(CCCallFuncN:create(function()
		var_32_0:removeFromParentAndCleanup(true)
	end))

	local var_32_16 = CCSequence:create(var_32_15)

	var_32_0:runAction(var_32_16)
end

function var_0_7.showPanel(arg_35_0, arg_35_1)
	arg_35_0.info = arg_35_1

	local var_35_0 = arg_35_1.isOver == 1

	arg_35_0.view.widgets.node_over:setVisible(var_35_0)
	arg_35_0.view.widgets.node_mine:setVisible(not var_35_0)
	arg_35_0.view.widgets.mask:setVisible(false)

	if not var_35_0 then
		arg_35_0.view.widgets.bg:setDisplayFrame(CCSprite:create(string.format("res/ui/activity/gemMine/bskd_bg%d.jpg", (arg_35_0.info.round - 1) % 3 + 1)):displayFrame())
		arg_35_0:addGuide()

		local var_35_1 = arg_35_1.bombNum > 0

		if var_35_1 then
			arg_35_0.view.widgets.bombNum:setString(language.get(135039, arg_35_1.bombNum))
		else
			arg_35_0.view.widgets.buyBombGold:setString(arg_35_1.buyBombGold)
		end

		arg_35_0.view.widgets.bombNum:setVisible(var_35_1)
		arg_35_0.view.widgets.icon_gold1:setVisible(not var_35_1)
		arg_35_0.view.widgets.buyBombGold:setVisible(not var_35_1)
		arg_35_0.view.widgets.info:setString(language.get(136081, arg_35_1.round))

		local var_35_2 = arg_35_1.bombAllGold == 0

		arg_35_0.view.widgets.bombAllGold:setString(var_35_2 and language.get(85060) or arg_35_1.bombAllGold)
		arg_35_0.view.widgets.btn_bombAll:setEnabled(true)
		arg_35_0:addBtnMine()

		local var_35_3 = false

		for iter_35_0, iter_35_1 in pairs(arg_35_1.gemMines) do
			if not var_35_3 and iter_35_1.fallDown == 1 then
				var_35_3 = true
			end
		end

		if var_35_3 and arg_35_1.round >= var_0_1 then
			var_35_3 = false
		end

		arg_35_0.view.widgets.btn_next:setVisible(var_35_3)
		arg_35_0.view.widgets.btn_next:setEnabled(true)
	end
end

function var_0_7.ctor(arg_36_0, arg_36_1, arg_36_2)
	log.info("@@ 宝石矿脉活动")
	rmgr.loadResource("res/ui/activity/ironMine/ironMinePic.plist")
	rmgr.loadResource("res/ui/activity/ironMine/btkd_fire.plist")
	math.randomseed(os.time())

	arg_36_0.view = {}

	uiutil.initWidgets(arg_36_0.view, arg_36_0.layout)

	arg_36_0.leftTime = arg_36_0.view.widgets.leftTime

	if arg_36_1 then
		arg_36_0:addChild(arg_36_0.view.widgets.root)
		arg_36_1:addChild(arg_36_0)
	end

	arg_36_0.view.widgets.btn_bombAll:addHandleOfControlEvent(function()
		log.info("btn_bombAll")
		arg_36_0:onBombAllGemMine()
	end, CCControlEventTouchUpInside)
	arg_36_0.view.widgets.btn_next:addHandleOfControlEvent(function()
		log.info("btn_next")
		arg_36_0:onGemMineNextRound()
	end, CCControlEventTouchUpInside)
	arg_36_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_36_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_36_0.view.widgets.btn_mask:addHandleOfControlEvent(function()
		log.info("btn_mask")
		arg_36_0:showEffectGetGem()
	end, CCControlEventTouchUpInside)

	local var_36_0 = CCLayerColor:create(ccc4(0, 0, 0, 0), 915, 532)
	local var_36_1 = CCScrollView:create(CCSizeMake(915, 532), var_36_0)

	var_36_1:setPosition(ccp(0, 0))
	var_36_1:setTouchEnabled(false)
	arg_36_0.view.widgets.node_mine:addChild(var_36_1, 50)

	arg_36_0.bgLayer = var_36_0

	arg_36_0:showPanel(arg_36_2)
end

return var_0_7
