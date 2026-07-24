local var_0_0 = class("KfPlayerInfoLayer", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.world = arg_2_1
	arg_2_0.onEnter = handler(arg_2_0, arg_2_0.onEnter)
	arg_2_0.onExit = handler(arg_2_0, arg_2_0.onExit)
	arg_2_0.once = true
end

function var_0_0.handlerGetWorldMapAction(arg_3_0, arg_3_1)
	arg_3_0.data = arg_3_1.data
	arg_3_0.time = arg_3_0.data.cd
	arg_3_0.startTime = arg_3_0.data.startTime

	showTable(arg_3_0.data.nationNames)

	if arg_3_0.once then
		arg_3_0:initExpand(false)

		arg_3_0.once = false
	end
end

function var_0_0.initExpand(arg_4_0, arg_4_1)
	arg_4_0.isOpen = arg_4_1
	arg_4_0.world.isShowCommand = false

	arg_4_0:removeAllChildrenWithCleanup(true)

	if arg_4_0.isOpen == true then
		playerInfoUI.show()
		smgr.hideNotice()

		arg_4_0.uiTable = autoUI.initUI(arg_4_0, arg_4_0:getUiData(false))
	else
		if playerInfoUI and playerInfoUI.uiTable and playerInfoUI.uiTable.layer and not tolua.isnull(playerInfoUI.uiTable.layer) then
			playerInfoUI.uiTable.layer:removeFromParentAndCleanup(true)

			playerInfoUI.uiTable.layer = nil
		end

		arg_4_0.uiTable = autoUI.initUI(arg_4_0, arg_4_0:getUiData(true))

		arg_4_0.world.kfmgNotice:setTokenVisible(true)
	end

	if not tolua.isnull(arg_4_0.uiTable.timeLabel) then
		local function var_4_0(arg_5_0, arg_5_1)
			return arg_5_0.matchNationId < arg_5_1.matchNationId
		end

		table.sort(arg_4_0.data.KfmgServerInfos, var_4_0)
		arg_4_0:setAttDefInfo(arg_4_0.data.KfmgServerInfos, arg_4_0.data.nationNames)
		arg_4_0:showBeginCountdown(arg_4_0.data.KfmgServerInfos, arg_4_0.data.nationNames)
	end
end

function var_0_0.setAttDefInfo(arg_6_0, arg_6_1, arg_6_2)
	local function var_6_0(arg_7_0)
		for iter_7_0, iter_7_1 in pairs(arg_6_2) do
			if arg_7_0 == iter_7_1.forceId then
				return iter_7_1.nationName
			end
		end
	end
end

local function var_0_1(arg_8_0, arg_8_1)
	arg_8_0[#arg_8_0 + 1] = arg_8_1

	return arg_8_1
end

function var_0_0.getUiData(arg_9_0, arg_9_1)
	local var_9_0 = {}
	local var_9_1 = 30
	local var_9_2 = 100
	local var_9_3 = 48

	if arg_9_1 then
		local var_9_4 = 60
		local var_9_5 = 15
	end

	var_9_0.background = {
		xcenter = 0,
		type = "pic",
		top = 50,
		pic = "res/ui/kfmg/kfmgz_sj_biaoti_di.png",
		children = {
			{
				xcenter = 0,
				ycenter = 15,
				pic = "res/ui/kfmg/text/kfmgz_sj_meishuzi_kfmgz.png",
				type = "pic"
			},
			{
				xcenter = 0,
				height = 18,
				name = "timeLabel",
				type = "atlas",
				pic = "res/ui/kfmg/text/kfmgz_sj_daojishi_1.png",
				text = "00/00/00",
				y = 20,
				startChar = 47,
				width = 14
			}
		}
	}

	if arg_9_1 then
		-- block empty
	end

	return var_9_0
end

function var_0_0.getBeginData(arg_10_0, arg_10_1)
	local var_10_0 = {
		name = "startBg",
		type = "pic",
		pic = "res/ui/kfmg/kfmgz_sj_tanchuang_2.png",
		x = visibleSize.width / 2,
		y = visibleSize.height / 2,
		children = {
			{
				xcenter = 0,
				ycenter = 103,
				pic = "res/ui/kfmg/text/kfmgz_sj_meishuzi_mgzjjks.png",
				type = "pic"
			},
			{
				xcenter = 0,
				height = 33,
				name = "beginCD",
				type = "atlas",
				ycenter = 50,
				pic = "res/ui/kfmg/text/kfmgz_sj_daojishi_2.png",
				text = "00/00/00",
				startChar = 47,
				width = 25
			},
			{
				xcenter = 0,
				ycenter = 5,
				pic = "res/ui/kfmg/text/kfmgz_sj_meishuzi_dzlb.png",
				type = "pic"
			},
			{
				xcenter = 0,
				y = -30,
				type = "button",
				buttons = {
					{
						pic2 = "frame:btn3_yel_c.png",
						name = "goBackMainCity",
						pic1 = "frame:btn3_yel_a.png",
						children = {
							{
								fontSize = 24,
								xcenter = 0,
								type = "label",
								ycenter = 0,
								text = language.get("hw_kfmg_000029"),
								color = colorText.TJ_Yellow
							}
						}
					}
				}
			}
		}
	}
	local var_10_1 = 130
	local var_10_2 = 47

	for iter_10_0 = 1, 3 do
		var_0_1(var_10_0.children, {
			xcenter = 0,
			type = "pic",
			pic = "res/ui/kfmg/kfmgz_sj_jianbiandi_1.png",
			name = "nationPic_" .. iter_10_0,
			y = var_10_1 - (iter_10_0 - 1) * var_10_2
		})
		var_0_1(var_10_0.children, {
			x = 170,
			type = "pic",
			pic = "res/ui/kfmg/kfmgz_sj_icon_shu.png",
			name = "nationPic_" .. iter_10_0,
			y = var_10_1 - (iter_10_0 - 1) * var_10_2 - 5
		})
		var_0_1(var_10_0.children, {
			x = 211,
			type = "pic",
			pic = "frame:guojia_di.png",
			y = var_10_1 - (iter_10_0 - 1) * var_10_2 + 2,
			children = {
				{
					fontSize = 23,
					text = "AA",
					type = "label",
					ycenter = 0,
					xcenter = 0,
					name = "nationName_" .. iter_10_0
				}
			}
		})
		var_0_1(var_10_0.children, {
			fontSize = 23,
			type = "label",
			anchorPointX = 0,
			text = "",
			anchorPointY = 0.5,
			x = 240,
			name = "serverName_" .. iter_10_0,
			color = colorText.TJ_Yellow,
			y = var_10_1 - (iter_10_0 - 1) * var_10_2 + 3
		})
		var_0_1(var_10_0.children, {
			x = 390,
			anchorPointX = 0,
			type = "pic",
			pic = "res/ui/kfmg/text/kfmgz_sj_meishuzi_frd.png",
			y = var_10_1 - (iter_10_0 - 1) * var_10_2 + 3
		})
		var_0_1(var_10_0.children, {
			type = "atlas",
			height = 26,
			anchorPointX = 0,
			x = 500,
			pic = "res/ui/kfmg/text/kfmgz_sj_shuzi.png",
			text = "",
			startChar = 46,
			width = 22,
			name = "mineNum_" .. iter_10_0,
			y = var_10_1 - (iter_10_0 - 1) * var_10_2 + 2
		})
	end

	return var_10_0
end

function var_0_0.showBeginCountdown(arg_11_0, arg_11_1, arg_11_2)
	if arg_11_0.startTime and arg_11_0.startTime > 0 then
		arg_11_0.world:setMgFunction(false)

		local var_11_0 = CCLayerColor:create(ccc4(0, 0, 0, 176))

		arg_11_0:addChild(var_11_0)

		arg_11_0.uiTable.startMask = var_11_0

		autoUI.createUI(var_11_0, arg_11_0:getBeginData(), arg_11_0.uiTable)
		arg_11_0.uiTable.background:setVisible(false)

		local var_11_1 = {
			"res/ui/kfmg/kfmgz_sj_icon_wei.png",
			"res/ui/kfmg/kfmgz_sj_icon_shu.png",
			"res/ui/kfmg/kfmgz_sj_icon_wu.png"
		}

		local function var_11_2(arg_12_0)
			for iter_12_0, iter_12_1 in pairs(arg_11_2) do
				if arg_12_0 == iter_12_1.forceId then
					return iter_12_1.nationName
				end
			end
		end

		for iter_11_0, iter_11_1 in ipairs(arg_11_1) do
			if iter_11_1.nation < 4 then
				arg_11_0.uiTable["nationPic_" .. iter_11_0]:setDisplayFrame(CCSprite:create(var_11_1[iter_11_1.matchNationId]):displayFrame())
				arg_11_0.uiTable["serverName_" .. iter_11_0]:setString("【" .. iter_11_1.serverName .. "】")
				arg_11_0.uiTable["serverName_" .. iter_11_0]:setColor(colorForce[iter_11_1.nation])
				arg_11_0.uiTable["nationName_" .. iter_11_0]:setString(var_11_2(iter_11_1.matchNationId))
				arg_11_0.uiTable["nationName_" .. iter_11_0]:setColor(colorForce[iter_11_1.nation])
				arg_11_0.uiTable["mineNum_" .. iter_11_0]:setString(iter_11_1.prosperous)
			end
		end

		arg_11_0.uiTable.goBackMainCity:registerScriptTapHandler(function()
			kfcmgr.sendRequest(nil, actions.kfLeave)
			pcall(kfcmgr.disconnectFromServer)
			smgr.changeScene(SCENE_MAIN_CITY)
		end)
	end
end

function var_0_0.update(arg_14_0, arg_14_1)
	if arg_14_0.startTime then
		arg_14_0.startTime = arg_14_0.startTime - arg_14_1 * 1000

		if arg_14_0.uiTable.beginCD and arg_14_0.startTime > 0 then
			arg_14_0.uiTable.beginCD:setString(string.format("%02d/%02d/%02d", tool.getHMS(math.floor(arg_14_0.startTime * 0.001))))
		else
			if not tolua.isnull(arg_14_0.uiTable.startBg) then
				arg_14_0.uiTable.background:setVisible(true)
				arg_14_0.uiTable.startMask:removeFromParentAndCleanup(true)
			end

			arg_14_0.world:setMgFunction(true)

			arg_14_0.startTime = nil
		end
	end

	if arg_14_0.time then
		arg_14_0.time = arg_14_0.time - arg_14_1 * 1000

		if arg_14_0.uiTable.timeLabel and arg_14_0.time > 0 then
			arg_14_0.uiTable.timeLabel:setString(string.format("%02d/%02d/%02d", tool.getHMS(math.floor(arg_14_0.time * 0.001))))
		else
			arg_14_0.uiTable.timeLabel:setString("00/00/00")
		end
	end
end

function var_0_0.onEnter(arg_15_0)
	log.info("PlayerInfoLayer onEnter")

	function arg_15_0.expandEventRef(arg_16_0)
		arg_15_0:initExpand(arg_16_0)
	end

	eventManager.registerEvent("kfWorldExpandClick", arg_15_0.expandEventRef)

	function arg_15_0.updateRef(arg_17_0)
		arg_15_0:update(arg_17_0)
	end

	arg_15_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(arg_15_0.updateRef, 1, false)
end

function var_0_0.onExit(arg_18_0)
	eventManager.unregisterEvent("kfWorldExpandClick", arg_18_0.expandEventRef)

	if arg_18_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_18_0.updateSchedulerEntry)

		arg_18_0.updateSchedulerEntry = nil
	end

	local var_18_0 = tolua.getpeer(arg_18_0)

	for iter_18_0, iter_18_1 in pairs(var_18_0) do
		arg_18_0[iter_18_0] = nil
	end
end

return var_0_0
