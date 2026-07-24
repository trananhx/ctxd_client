local var_0_0 = {
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
							y = 290.5,
							name = "profit_view_bg",
							type = "sprite",
							x = 480,
							pic = {
								path = "res/ui/outputMode/profit_view_bg.jpg"
							}
						},
						{
							y = 204,
							name = "tsfx_bg",
							type = "sprite",
							x = 480,
							pic = {
								path = "res/ui/saotao/tsfx_bg.jpg"
							}
						},
						{
							y = 400,
							name = "stfx_long_bg",
							type = "sprite",
							x = 480.0001,
							pic = {
								path = "res/ui/saotao/stfx_long_bg.png"
							},
							children = {
								{
									name = "nextBtn",
									h = 91,
									type = "button",
									w = 94,
									y = 80,
									x = 844,
									normal = {
										path = "res/ui/saotao/stfx_btn_arrows.png"
									},
									touched = {
										path = "res/ui/saotao/stfx_btn_arrows_c.png"
									},
									disable = {
										path = "res/ui/saotao/stfx_btn_arrows_g.png"
									}
								},
								{
									name = "lastBtn",
									h = 91,
									type = "button",
									w = 94,
									y = 79.9992,
									scaleX = -1,
									x = 69,
									normal = {
										path = "res/ui/saotao/stfx_btn_arrows.png"
									},
									touched = {
										path = "res/ui/saotao/stfx_btn_arrows_c.png"
									},
									disable = {
										path = "res/ui/saotao/stfx_btn_arrows_g.png"
									}
								}
							}
						},
						{
							y = 519,
							name = "stfx_title",
							type = "sprite",
							x = 480,
							pic = {
								path = "res/ui/saotao/tcyh_tczlp_title.png"
							}
						},
						{
							y = 72,
							name = "qtmh_up_line_Copy_0",
							type = "sprite",
							x = 480,
							pic = {
								path = "res/ui/activity/sevenCatch/qtmh_up_line.png"
							}
						},
						{
							fontSize = 20,
							name = "desc",
							type = "label",
							y = 442.7062,
							x = 306.7651,
							halign = kCCTextAlignmentLeft,
							valign = kCCVerticalTextAlignmentBottom,
							anchorPoint = ccp(0, 1)
						},
						{
							y = 100,
							name = "stfx_cityname_bg",
							type = "sprite",
							x = 480,
							pic = {
								path = "res/ui/saotao/stfx_cityname_bg.png"
							},
							children = {
								{
									name = "desc3",
									type = "label",
									textId = 122107,
									style = "label_yellowish_24",
									y = 32.2218,
									x = 174.24,
									halign = kCCTextAlignmentCenter,
									valign = kCCVerticalTextAlignmentCenter,
									anchorPoint = ccp(1, 0.5)
								}
							}
						},
						{
							y = 405.397,
							name = "stfx_por_view",
							type = "sprite",
							x = 218.7142,
							pic = {
								path = "res/ui/saotao/stfx_por_view.png"
							},
							children = {
								{
									y = 50,
									name = "playerHead",
									type = "sprite",
									x = 50,
									pic = {
										path = "res/ui/common/playerHead/playerHead_icon_0.png"
									}
								}
							}
						},
						{
							y = 194.1667,
							name = "stfx_city",
							type = "sprite",
							x = 480,
							pic = {
								path = "res/ui/saotao/stfx_city.png"
							}
						},
						{
							y = 297.4385,
							name = "stfx_word_bg",
							type = "sprite",
							x = 480,
							pic = {
								path = "res/ui/saotao/stfx_word_bg.png"
							},
							children = {
								{
									name = "desc2",
									type = "label",
									text = "Text Label",
									style = "label_yellowish_24",
									y = 37.5,
									x = 205.16,
									halign = kCCTextAlignmentLeft,
									valign = kCCVerticalTextAlignmentBottom,
									anchorPoint = ccp(1, 0.5)
								}
							}
						},
						{
							name = "remainTimes",
							type = "label",
							text = "Text Label",
							style = "label_yellowish_24",
							y = 90,
							x = 910,
							halign = kCCTextAlignmentLeft,
							valign = kCCVerticalTextAlignmentBottom,
							anchorPoint = ccp(1, 0)
						}
					}
				}
			}
		}
	}
}
local var_0_1 = class("saotao", BaseLayOutLayer)

function var_0_1.ctor(arg_1_0)
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
	var_0_1.super.ctor(arg_1_0, var_0_0, handler(arg_1_0, arg_1_0.initLayout))
	arg_1_0:init()
end

function var_0_1.initLayout(arg_3_0)
	arg_3_0.descRichNodeTag = 1000
	arg_3_0.timeOutTag = 1001

	arg_3_0.widgets.nextBtn:addHandleOfControlEvent(handler(arg_3_0, arg_3_0.showNext), CCControlEventTouchUpInside)
	arg_3_0.widgets.lastBtn:addHandleOfControlEvent(handler(arg_3_0, arg_3_0.showLast), CCControlEventTouchUpInside)
	arg_3_0.widgets.closeBtn:addHandleOfControlEvent(handler(arg_3_0, arg_3_0.close), CCControlEventTouchUpInside)
	arg_3_0.widgets.desc3:setString(language.get(122107))

	arg_3_0.widgets.cityName = CCMenuItemFont:create(" ")

	arg_3_0.widgets.cityName:setColor(ccc3(114, 223, 55))
	arg_3_0.widgets.cityName:setPosition(ccp(550, 103))
	arg_3_0.widgets.cityName:registerScriptTapHandler(handler(arg_3_0, arg_3_0.gotoCity))

	local var_3_0 = CCMenu:create()

	var_3_0:setPosition(ccp(0, 0))
	var_3_0:addChild(arg_3_0.widgets.cityName)
	arg_3_0.widgets.panel:addChild(var_3_0)

	arg_3_0.widgets.rewardsNode = CCNode:create()

	arg_3_0.widgets.rewardsNode:setPosition(ccp(480, 195))
	arg_3_0.widgets.panel:addChild(arg_3_0.widgets.rewardsNode)
	arg_3_0.widgets.rewardsNode:setTouchEnabled(true)
	arg_3_0.widgets.rewardsNode:registerScriptTouchHandler(handler(arg_3_0, arg_3_0.onTouchRewards), false, false)
end

function var_0_1.init(arg_4_0)
	arg_4_0.widgets.panel:setVisible(false)
	cmgr.sendRequest(handler(arg_4_0, arg_4_0.getSaoTaoPanelInfoHandler), actions.getSaoTaoPanelInfo)
end

function var_0_1.gotoCity(arg_5_0)
	log.info("gotoCity")
	smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
	loadingLayer.show(SCENE_WORLD, arg_5_0.__currentPanelInfo.slaughterCityId)
end

function var_0_1.getSaoTaoPanelInfoHandler(arg_6_0, arg_6_1)
	log.info("getSaoTaoPanelInfoHandler")

	if arg_6_1.action.state == 1 then
		arg_6_0.__panelInfo = arg_6_1.action.data

		if arg_6_0.__panelInfo.totalIndex > 0 then
			arg_6_0.widgets.panel:setVisible(true)
			arg_6_0:refreshPanel(arg_6_0._idx or 1)
		else
			arg_6_0:close()
		end
	end
end

function var_0_1.onTouchRewards(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	if arg_7_1 == CCTOUCHBEGAN then
		return true
	elseif arg_7_1 == CCTOUCHMOVED then
		return true
	elseif arg_7_1 == CCTOUCHENDED then
		return true
	end
end

function var_0_1.getAwards(arg_8_0)
	log.info("getAwards")
	cmgr.sendRequest(handler(arg_8_0, arg_8_0.getAwardsHandler), actions.getCelSlaughterTaoAward, arg_8_0.__currentPanelInfo.battleId)
end

function var_0_1.getAwardsHandler(arg_9_0, arg_9_1)
	if arg_9_1.action.state == 1 then
		arg_9_0.widgets.rewardsNode:removeAllChildrenWithCleanup(true)

		local var_9_0 = {}

		for iter_9_0, iter_9_1 in pairs(arg_9_0.__currentPanelInfo.rewards) do
			var_9_0[#var_9_0 + 1] = {}

			if iter_9_1.type == 17 then
				var_9_0[#var_9_0].id = 7
			else
				var_9_0[#var_9_0].id = iter_9_1.type
			end

			var_9_0[#var_9_0].value = iter_9_1.value
			var_9_0[#var_9_0].gemLevel = 1
		end

		globalAction_gotResource(var_9_0)

		arg_9_0._idx = 1

		cmgr.sendRequest(handler(arg_9_0, arg_9_0.getSaoTaoPanelInfoHandler), actions.getSaoTaoPanelInfo)
	end
end

function var_0_1.refreshPanel(arg_10_0, arg_10_1)
	if arg_10_1 >= 1 and arg_10_1 <= arg_10_0.__panelInfo.totalIndex then
		arg_10_0._idx = arg_10_1

		arg_10_0.widgets.lastBtn:setEnabled(arg_10_1 ~= 1)
		arg_10_0.widgets.nextBtn:setEnabled(arg_10_1 ~= arg_10_0.__panelInfo.totalIndex)

		arg_10_0.__currentPanelInfo = arg_10_0.__panelInfo.infos[arg_10_1]

		local var_10_0 = arg_10_0.__currentPanelInfo
		local var_10_1 = CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. var_10_0.slaughterPlayerPic .. ".png"):displayFrame()

		arg_10_0.widgets.playerHead:setDisplayFrame(var_10_1)

		local var_10_2 = {
			(CCLabelTTF:create(language.get(122105), "Thonburi-Bold", 28))
		}

		var_10_2[1]:setColor(colorText[10002])

		var_10_2[2] = CCLabelTTF:create(var_10_0.slaughterPlayerName, "Thonburi-Bold", 28)
		var_10_2[3] = CCLabelTTF:create(language.get(122106), "Thonburi-Bold", 28)

		var_10_2[3]:setColor(colorText[10002])

		local var_10_3 = createMultiLineRichNode(var_10_2, {
			width = 500
		})

		var_10_3:setPosition(arg_10_0.widgets.desc:getPosition())
		var_10_3:setTag(arg_10_0.descRichNodeTag)
		arg_10_0.widgets.panel:removeChildByTag(arg_10_0.descRichNodeTag, true)
		arg_10_0.widgets.panel:removeChildByTag(arg_10_0.timeOutTag, true)
		arg_10_0.widgets.panel:addChild(var_10_3)

		local var_10_4 = ""

		if arg_10_0.__panelInfo.remainPlunderTimes then
			var_10_4 = var_10_4 .. "\n" .. language.get("122102_tucheng", arg_10_0.__panelInfo.remainPlunderTimes)
		end

		if arg_10_0.__panelInfo.remainSlaughterTimes then
			var_10_4 = var_10_4 .. "\n" .. language.get("122101_tucheng", arg_10_0.__panelInfo.remainSlaughterTimes)
		end

		if arg_10_0.__panelInfo.leftWeaponTimes then
			var_10_4 = var_10_4 .. "\n" .. language.get("122103_tucheng", arg_10_0.__panelInfo.leftWeaponTimes)
		end

		arg_10_0.widgets.remainTimes:setString(var_10_4)

		local var_10_5

		if var_10_0.inClean then
			if var_10_0.cleanOver then
				arg_10_0.widgets.desc2:setString(language.get(122108))

				var_10_5 = createTimerLabel(var_10_0.constructionTime, "@M:@S", "Thonburi", 22, handler(arg_10_0, arg_10_0.constructionTimeOutHandler), nil, nil, ccc3(255, 0, 0))
			else
				arg_10_0.widgets.desc2:setString(language.get(122109))

				var_10_5 = createTimerLabel(var_10_0.leftTime, "@M:@S", "Thonburi", 22, handler(arg_10_0, arg_10_0.leftTimeOutHandler), nil, nil, ccc3(255, 0, 0))
			end
		else
			arg_10_0.widgets.desc2:setString(language.get(122108))

			var_10_5 = createTimerLabel(var_10_0.constructionTime, "@M:@S", "Thonburi", 22, handler(arg_10_0, arg_10_0.constructionTimeOutHandler), nil, nil, ccc3(255, 0, 0))
		end

		for iter_10_0 = 1, 5 do
			-- block empty
		end

		var_10_5:setPosition(558, 300)
		var_10_5:setTag(arg_10_0.timeOutTag)
		arg_10_0.widgets.panel:addChild(var_10_5)
		arg_10_0.widgets.cityName:setString(var_10_0.slaughterCityName)
	end
end

function var_0_1.constructionTimeOutHandler(arg_11_0)
	return
end

function var_0_1.leftTimeOutHandler(arg_12_0)
	cmgr.sendRequest(handler(arg_12_0, arg_12_0.getSaoTaoPanelInfoHandler), actions.getSaoTaoPanelInfo)
end

function var_0_1.update(arg_13_0, arg_13_1)
	if arg_13_0.__panelInfo then
		for iter_13_0, iter_13_1 in pairs(arg_13_0.__panelInfo.infos) do
			if iter_13_1.constructionTime then
				iter_13_1.constructionTime = iter_13_1.constructionTime - arg_13_1 * 1000
			end

			if iter_13_1.leftTime then
				iter_13_1.leftTime = iter_13_1.leftTime - arg_13_1 * 1000
			end
		end
	end
end

function var_0_1.onEnter(arg_14_0)
	log.info("onEnter")

	arg_14_0.updateHandler = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_14_0, arg_14_0.update), 1, false)
end

function var_0_1.onExit(arg_15_0)
	log.info("onExit")

	if arg_15_0.updateHandler then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_15_0.updateHandler)
	end
end

function var_0_1.close(arg_16_0, arg_16_1, arg_16_2)
	amgr.playEffect(enumAudioFile.ui_dialog_close)
	smgr.getLayer("topLayer"):removeChild(arg_16_0, true)

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

function var_0_1.showNext(arg_17_0, ...)
	log.info("show next")
	arg_17_0:refreshPanel(arg_17_0._idx + 1)
end

function var_0_1.showLast(arg_18_0, ...)
	log.info("show last")
	arg_18_0:refreshPanel(arg_18_0._idx - 1)
end

return var_0_1
