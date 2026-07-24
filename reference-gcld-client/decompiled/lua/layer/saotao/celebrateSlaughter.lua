local var_0_0 = require("res/native/offset").get("layer.saotao.celebrateSlaughter")
local var_0_1 = {
	y = 0,
	name = "root",
	type = "layer",
	x = 0,
	children = {
		{
			name = "frame",
			type = "sprite9",
			preferedSize = CCSizeMake(960, 581),
			middleRect = CCRectMake(52, 52, 1, 1),
			x = visibleSize.width / 2,
			y = visibleSize.height / 2 - 28,
			pic = {
				frame = true,
				path = "bigPanel.png"
			},
			children = {
				{
					name = "closeBtn",
					h = 33,
					type = "button",
					w = 32,
					scaleY = 2,
					y = 602.8595,
					scaleX = 2,
					x = 922.8773,
					normal = {
						frame = true,
						path = "btn_close_a.png"
					},
					touched = {
						frame = true,
						path = "btn_close_c.png"
					}
				},
				{
					y = 0,
					name = "panel",
					type = "layer",
					x = 0,
					children = {
						{
							y = 269.569,
							name = "dinnerBackground1",
							type = "sprite",
							x = 480,
							pic = {
								path = "res/ui/dinner/dinnerBackground1.jpg"
							},
							children = {
								{
									y = 385.5913,
									name = "my",
									type = "sprite",
									x = 277.911,
									pic = {
										path = "res/ui/kfsy/dinnerChiefRole.png"
									}
								},
								{
									y = 226.7744,
									name = "player1",
									type = "sprite",
									x = 233.2738,
									pic = {
										path = "res/ui/kfsy/dinnerGeneralRole1.png"
									},
									children = {
										{
											fontSize = 20,
											name = "name1",
											y = 60,
											type = "label",
											text = "Text Label",
											style = "label_warlock",
											x = 20,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								},
								{
									y = 393.86,
									name = "player2",
									type = "sprite",
									x = 563.1129,
									pic = {
										path = "res/ui/kfsy/dinnerGeneralRole2.png"
									},
									children = {
										{
											fontSize = 20,
											name = "name2",
											y = 57.6,
											type = "label",
											text = "Text Label",
											style = "label_warlock",
											x = 20,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								},
								{
									y = 183.0244,
									name = "player3",
									type = "sprite",
									x = 322.0238,
									pic = {
										path = "res/ui/kfsy/dinnerGeneralRole1.png"
									},
									children = {
										{
											fontSize = 20,
											name = "name3",
											y = 60,
											type = "label",
											text = "Text Label",
											style = "label_warlock",
											x = 20,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								},
								{
									y = 353.8598,
									name = "player4",
									type = "sprite",
									x = 654.0215,
									pic = {
										path = "res/ui/kfsy/dinnerGeneralRole2.png"
									},
									children = {
										{
											fontSize = 20,
											name = "name4",
											y = 57.6,
											type = "label",
											text = "Text Label",
											style = "label_warlock",
											x = 20,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								},
								{
									y = 282.951,
									name = "player5",
									type = "sprite",
									x = 788.5662,
									pic = {
										path = "res/ui/kfsy/dinnerGeneralRole2.png"
									},
									children = {
										{
											fontSize = 20,
											name = "name5",
											y = 57.6,
											type = "label",
											text = "Text Label",
											style = "label_warlock",
											x = 20,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								},
								{
									y = 240.9055,
									name = "player6",
									type = "sprite",
									x = 871.5223,
									pic = {
										path = "res/ui/kfsy/dinnerGeneralRole2.png"
									},
									children = {
										{
											fontSize = 20,
											name = "name6",
											y = 57.6,
											type = "label",
											text = "Text Label",
											style = "label_warlock",
											x = 20,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								},
								{
									y = 311.8145,
									name = "player7",
									type = "sprite",
									x = 735.1577,
									pic = {
										path = "res/ui/kfsy/dinnerGeneralRole2.png"
									},
									children = {
										{
											fontSize = 20,
											name = "name7",
											y = 57.6,
											type = "label",
											text = "Text Label",
											style = "label_warlock",
											x = 20,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								}
							}
						},
						{
							y = 475.7507,
							name = "tcqg_long_bg",
							type = "sprite",
							x = 480,
							pic = {
								path = "res/ui/celSlaughter/tcqg_long_bg.png"
							},
							children = {
								{
									name = "Text_5",
									y = 31.2,
									type = "label",
									textId = 122110,
									style = "label_yellowish_24",
									x = 423,
									fontSize = var_0_0.titleFntSize or 24,
									halign = kCCTextAlignmentLeft,
									valign = kCCVerticalTextAlignmentBottom
								}
							}
						},
						{
							y = 414.1423,
							name = "show3",
							type = "sprite",
							x = 761.5712,
							pic = {
								path = "res/ui/celSlaughter/tcqg_name_bg.png"
							}
						},
						{
							y = 373.8564,
							name = "show2",
							type = "sprite",
							x = 761.5712,
							pic = {
								path = "res/ui/celSlaughter/tcqg_name_bg.png"
							}
						},
						{
							y = 329.5707,
							name = "show1",
							type = "sprite",
							x = 761.5712,
							pic = {
								path = "res/ui/celSlaughter/tcqg_name_bg.png"
							}
						},
						{
							y = 246.1038,
							name = "tcqg_reward_bg",
							type = "sprite",
							x = 800.8506,
							pic = {
								path = "res/ui/celSlaughter/tcqg_reward_bg.png"
							},
							children = {
								{
									y = 56.3805,
									name = "tcqg_word_symbol",
									type = "sprite",
									x = 130.6216,
									pic = {
										path = "res/ui/celSlaughter/tcqg_word_symbol.png"
									}
								},
								{
									y = 60,
									name = "numNode",
									x = 203,
									type = "node"
								},
								{
									y = 59.9999,
									name = "Sprite_35",
									type = "sprite",
									x = 61.2503,
									pic = {
										path = "res/ui/equip/storeHouse/wareh_suit_bg.jpg"
									},
									children = {
										{
											y = 44,
											name = "rewardIcon",
											type = "sprite",
											x = 44,
											pic = {
												frame = true,
												path = "res_icon_7.png"
											}
										},
										{
											fontSize = 20,
											name = "rewardValue",
											text = "0",
											type = "label",
											y = 17.1422,
											x = 44.284,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								}
							}
						},
						{
							y = 246.1038,
							name = "tcqg_reward_bg2",
							type = "sprite",
							x = 530.8506,
							pic = {
								path = "res/ui/celSlaughter/tcqg_reward_bg.png"
							},
							children = {
								{
									y = 56.3805,
									name = "tcqg_word_symbol2",
									type = "sprite",
									x = 130.6216,
									pic = {
										path = "res/ui/celSlaughter/tcqg_word_symbol.png"
									}
								},
								{
									y = 60,
									name = "numNode2",
									x = 203,
									type = "node"
								},
								{
									y = 59.9999,
									name = "Sprite_36",
									type = "sprite",
									x = 61.2503,
									pic = {
										path = "res/ui/equip/storeHouse/wareh_suit_bg.jpg"
									},
									children = {
										{
											y = 44,
											name = "rewardIcon2",
											type = "sprite",
											x = 44,
											pic = {
												frame = true,
												path = "res_icon_3.png"
											}
										},
										{
											fontSize = 20,
											name = "rewardValue2",
											text = "0",
											type = "label",
											y = 17.1422,
											x = 44.284,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentBottom
										}
									}
								}
							}
						},
						{
							y = 536.3257,
							name = "tcqg_title",
							type = "sprite",
							x = 480.9615,
							pic = {
								path = "res/ui/celSlaughter/tcqg_title.png"
							}
						},
						{
							fontSize = 20,
							name = "celebrateNum",
							y = 161.9051,
							type = "label",
							text = "textId=122112",
							style = "label_yellowish_20",
							x = 480,
							halign = kCCTextAlignmentLeft,
							valign = kCCVerticalTextAlignmentBottom
						},
						{
							name = "btnGetAward",
							h = 58,
							type = "button",
							w = 140,
							y = 105.1727,
							x = 480,
							normal = {
								frame = true,
								path = "btn_default_normal.png"
							},
							touched = {
								frame = true,
								path = "btn_default_lighted.png"
							},
							children = {
								{
									fontSize = 20,
									name = "textGet",
									y = 30.0775,
									type = "label",
									textId = 122111,
									style = "label_greyish_22",
									x = 68.6194,
									halign = kCCTextAlignmentLeft,
									valign = kCCVerticalTextAlignmentBottom
								}
							}
						}
					}
				}
			}
		}
	}
}
local var_0_2 = class("celebrateSlaughter", BaseLayOutLayer)

function var_0_2.ctor(arg_1_0)
	amgr.playEffect(enumAudioFile.ui_dialog_open)

	local function var_1_0(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_0 == CCTOUCHBEGAN then
			return true
		elseif arg_2_0 == CCTOUCHMOVED then
			return true
		elseif arg_2_0 == CCTOUCHENDED then
			return true
		end
	end

	arg_1_0:setTouchEnabled(true)
	arg_1_0:registerScriptTouchHandler(var_1_0, false, true)
	var_0_2.super.ctor(arg_1_0, var_0_1, handler(arg_1_0, arg_1_0.initLayout))
	arg_1_0:init()
end

function var_0_2.initLayout(arg_3_0)
	arg_3_0.widgets.closeBtn:addHandleOfControlEvent(handler(arg_3_0, arg_3_0.close), CCControlEventTouchUpInside)
	arg_3_0.widgets.btnGetAward:addHandleOfControlEvent(handler(arg_3_0, arg_3_0.getAwards), CCControlEventTouchUpInside)
end

function var_0_2.init(arg_4_0)
	arg_4_0.widgets.panel:setVisible(false)
	cmgr.sendRequest(handler(arg_4_0, arg_4_0.getPanelInfoHandler), actions.getCelSlaughterPanelInfo)
end

function var_0_2.getPanelInfoHandler(arg_5_0, arg_5_1)
	log.info("getPanelInfoHandler")

	if arg_5_1.action.state == 1 then
		if arg_5_1.action.data and arg_5_1.action.data.nxInfo then
			arg_5_0.__panelInfo = arg_5_1.action.data

			arg_5_0.widgets.panel:setVisible(true)
			arg_5_0:refreshPanel()
		else
			arg_5_0:close()
		end
	end
end

function var_0_2.getAwards(arg_6_0)
	log.info("getAwards")

	if arg_6_0.__panelInfo.nxInfo.nxNum - arg_6_0.__panelInfo.nxInfo.nxRewardedNum <= 0 and arg_6_0.__panelInfo.leftNum <= 0 then
		arg_6_0:close()

		return
	end

	if arg_6_0.__panelInfo.leftNum > 0 then
		cmgr.sendRequest(handler(arg_6_0, arg_6_0.getAwardsHandler), actions.getCoopSlaughterReward, arg_6_0.__panelInfo.cityId, false)
	else
		cmgr.sendRequest(handler(arg_6_0, arg_6_0.getAwardsHandler), actions.getCoopSlaughterReward, arg_6_0.__panelInfo.cityId, true)
	end
end

function var_0_2.getAwardsHandler(arg_7_0, arg_7_1)
	if arg_7_1.action.state == 1 then
		local var_7_0 = arg_7_1.action.data
		local var_7_1 = {}

		for iter_7_0, iter_7_1 in pairs(var_7_0.rewards) do
			var_7_1[#var_7_1 + 1] = {}

			if iter_7_1.type == 17 then
				var_7_1[#var_7_1].id = 7
			else
				var_7_1[#var_7_1].id = iter_7_1.type
			end

			var_7_1[#var_7_1].value = iter_7_1.value
			var_7_1[#var_7_1].gemLevel = 1
		end

		globalAction_gotResource(var_7_1)
		cmgr.sendRequest(handler(arg_7_0, arg_7_0.getPanelInfoHandler), actions.getCelSlaughterPanelInfo)
	end
end

function var_0_2.refreshPanel(arg_8_0)
	arg_8_0.widgets.numNode:removeAllChildrenWithCleanup(true)

	local var_8_0 = CCLabelAtlas:create(arg_8_0.__panelInfo.nxInfo.nxNum - arg_8_0.__panelInfo.nxInfo.nxRewardedNum, "res/ui/world/cityCombo/lxzc_time_digit.png", 68, 76, 48)

	var_8_0:setAnchorPoint(ccp(0.5, 0.5))
	arg_8_0.widgets.numNode:addChild(var_8_0)

	if arg_8_0.__panelInfo.nxInfo.nxNum - arg_8_0.__panelInfo.nxInfo.nxRewardedNum <= 0 then
		arg_8_0.widgets.tcqg_reward_bg:setVisible(false)

		if arg_8_0.__panelInfo.leftNum and arg_8_0.__panelInfo.leftNum <= 0 then
			arg_8_0.widgets.textGet:setString(language.get(83037))
		end
	else
		arg_8_0.widgets.tcqg_reward_bg:setVisible(true)
		arg_8_0.widgets.textGet:setString(language.get(122111))
	end

	arg_8_0.widgets.celebrateNum:setString(language.get(122112, arg_8_0.__panelInfo.nxInfo.nxNum))

	local var_8_1 = arg_8_0.__panelInfo.nxInfo.rewards[1]

	if var_8_1 then
		local var_8_2 = var_8_1.type

		if var_8_1.type == 17 then
			var_8_2 = 7
		end

		arg_8_0.widgets.rewardIcon:setDisplayFrame(CCSprite:createWithSpriteFrameName("res_icon_" .. var_8_2 .. ".png"):displayFrame())
		arg_8_0.widgets.rewardValue:setString(var_8_1.value)
	end

	if arg_8_0.__panelInfo.leftNum and arg_8_0.__panelInfo.leftNum > 0 then
		arg_8_0.widgets.tcqg_reward_bg2:setVisible(true)

		if arg_8_0.__panelInfo.rewards and arg_8_0.__panelInfo.rewards[1] then
			arg_8_0.widgets.rewardIcon2:setDisplayFrame(CCSprite:createWithSpriteFrameName("res_icon_" .. arg_8_0.__panelInfo.rewards[1].type .. ".png"):displayFrame())
			arg_8_0.widgets.rewardValue2:setString(arg_8_0.__panelInfo.rewards[1].value)
		end

		arg_8_0.widgets.numNode2:removeAllChildrenWithCleanup(true)

		local var_8_3 = CCLabelAtlas:create(arg_8_0.__panelInfo.leftNum, "res/ui/world/cityCombo/lxzc_time_digit.png", 68, 76, 48)

		var_8_3:setAnchorPoint(ccp(0.5, 0.5))
		arg_8_0.widgets.numNode2:addChild(var_8_3)
	else
		arg_8_0.widgets.tcqg_reward_bg2:setVisible(false)
	end

	if arg_8_0.__panelInfo.slaughters then
		for iter_8_0 = 1, 7 do
			if arg_8_0.__panelInfo.slaughters[iter_8_0] then
				arg_8_0.widgets["player" .. iter_8_0]:setVisible(true)
				arg_8_0.widgets["name" .. iter_8_0]:setString(arg_8_0.__panelInfo.slaughters[iter_8_0].playerName)
			else
				arg_8_0.widgets["player" .. iter_8_0]:setVisible(false)
			end
		end

		for iter_8_1 = 1, 3 do
			if arg_8_0.__panelInfo.slaughters[iter_8_1] then
				arg_8_0.widgets["show" .. iter_8_1]:setVisible(true)
				arg_8_0.widgets["show" .. iter_8_1]:removeAllChildrenWithCleanup(true)

				local var_8_4 = {
					(CCStrokeLabelTTF:create(arg_8_0.__panelInfo.slaughters[iter_8_1].playerName, "Thonburi-Bold", 20, 2))
				}

				if user.player.id == arg_8_0.__panelInfo.slaughters[iter_8_1].playerId then
					var_8_4[2] = CCStrokeLabelTTF:create(language.get(122117), "Thonburi-Bold", 20, 2)
				else
					var_8_4[2] = CCStrokeLabelTTF:create(language.get(122116), "Thonburi-Bold", 20, 2)
				end

				var_8_4[2]:setColor(colorText[10002])

				local var_8_5 = createRichNode(var_8_4, 0.5)

				var_8_5:setPosition(ccp(171, 21))
				arg_8_0.widgets["show" .. iter_8_1]:addChild(var_8_5)
			else
				arg_8_0.widgets["show" .. iter_8_1]:setVisible(false)
			end
		end
	end
end

function var_0_2.onEnter(arg_9_0)
	log.info("onEnter")
end

function var_0_2.onExit(arg_10_0)
	log.info("onExit")
end

function var_0_2.close(arg_11_0, arg_11_1, arg_11_2)
	amgr.playEffect(enumAudioFile.ui_dialog_close)
	smgr.getLayer("topLayer"):removeChild(arg_11_0, true)

	if guide.control.isHideByTemp == true then
		guide.control.isHideByTemp = false

		guide.ui.setVisible(true)
	end

	guide.control.setCurrentMarkTrace(nil)
	CCTextureCache:sharedTextureCache():removeUnusedTextures()

	if globalAction_updateSpecialEffect then
		globalAction_updateSpecialEffect()
	end
end

return var_0_2
