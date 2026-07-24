local var_0_0 = {}
local var_0_1 = {}

if conf.language == "kr" then
	var_0_1.tit_gzjsX = 40
	var_0_1.occupyLabelNationX = 0
	var_0_1.nickNameValueX = 0
	var_0_1.duelCountX = 0
	var_0_1.occupyLabelX = 20
	var_0_1.rewardTitleScale = 1
	var_0_1.ticketsLabelX = 0
	var_0_1.multipleTipX = 0
	var_0_1.getRewardBtnLabelSize = 0
	var_0_1.titleGroupNumX = 0
	var_0_1.titleGroupLabelX = 0
elseif conf.language == "vie" then
	var_0_1.tit_gzjsX = 0
	var_0_1.occupyLabelNationX = 80
	var_0_1.nickNameValueX = 80
	var_0_1.duelCountX = 120
	var_0_1.occupyLabelX = 120
	var_0_1.rewardTitleScale = 1.3
	var_0_1.ticketsLabelX = 100
	var_0_1.multipleTipX = -80
	var_0_1.getRewardBtnLabelSize = -6
	var_0_1.titleGroupNumX = 0
	var_0_1.titleGroupLabelX = 0
elseif conf.language == "tha" then
	var_0_1.tit_gzjsX = 0
	var_0_1.occupyLabelNationX = 0
	var_0_1.nickNameValueX = 0
	var_0_1.duelCountX = 0
	var_0_1.occupyLabelX = 0
	var_0_1.rewardTitleScale = 1
	var_0_1.ticketsLabelX = 0
	var_0_1.multipleTipX = 0
	var_0_1.getRewardBtnLabelSize = 0
	var_0_1.titleGroupNumX = 90
	var_0_1.titleGroupLabelX = -70
else
	var_0_1.tit_gzjsX = 0
	var_0_1.occupyLabelNationX = 0
	var_0_1.nickNameValueX = 0
	var_0_1.duelCountX = 0
	var_0_1.occupyLabelX = 0
	var_0_1.rewardTitleScale = 1
	var_0_1.ticketsLabelX = 0
	var_0_1.multipleTipX = 0
	var_0_1.getRewardBtnLabelSize = 0
	var_0_1.titleGroupNumX = 0
	var_0_1.titleGroupLabelX = 0
end

local var_0_2 = false

local function var_0_3()
	if var_0_2 == true then
		return
	end

	if conf.language == "vie" then
		var_0_0.layout.widgets[1].children[2].visible = false
		var_0_0.layout.widgets[1].children[4].visible = false
		var_0_0.layout.widgets[1].children[5].visible = false
		title = {
			x = 418,
			name = "kfgz_over_title",
			y = 454.5,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/native/ui/kfworld/kfWorldRanking/kfgz_zbjd_tit_ybj_over.png"
			}
		}

		table.insert(var_0_0.layout.widgets[1].children, title)
	end

	var_0_2 = true
end

var_0_0.layout = {
	parent = "topLayer",
	widgets = {
		{
			name = "panel",
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_view_bg.png"
			},
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 + 30,
			children = {
				{
					y = 450,
					name = "closeWindowButton",
					scale = 1.5,
					type = "button",
					style = "button_close",
					x = 900
				},
				{
					x = 283.5,
					name = "groupName",
					y = 454.5,
					type = "sprite",
					pic = {
						frame = true,
						path = "kfgz_zbjd_tit_ybj.png"
					}
				},
				{
					name = "groupLabel",
					type = "atlaslabel",
					pic = "res/ui/common/number/kfgz_zbjd-nb.png",
					startCharMap = 48,
					text = "0",
					y = 454.5,
					itemWidth = 43,
					itemHeight = 49,
					x = 424.5 + var_0_1.titleGroupNumX
				},
				{
					y = 454.5,
					type = "sprite",
					pic = {
						frame = true,
						path = "kfgz_zbjd_tit_z.png"
					},
					x = 513 + var_0_1.titleGroupLabelX
				},
				{
					y = 454.5,
					type = "sprite",
					pic = {
						frame = true,
						path = "kfgz_gzjs_tit_gzjs.png"
					},
					x = 637 + var_0_1.tit_gzjsX
				},
				{
					x = 472,
					y = 241,
					type = "sprite",
					pic = {
						frame = true,
						path = "kfgz_view_gzjs_list.png"
					}
				},
				{
					x = 472,
					y = 375,
					type = "sprite",
					pic = {
						frame = true,
						path = "kfgz_gzjs_up_vs.png"
					}
				},
				{
					x = 397,
					y = 375,
					type = "sprite",
					pic = {
						frame = true,
						path = "kfgz_gzjs_icon_blue.png"
					}
				},
				{
					x = 547,
					y = 375,
					type = "sprite",
					pic = {
						frame = true,
						path = "kfgz_gzjs_icon_red.png"
					}
				},
				{
					text = "奥食堂x服",
					name = "serverName1",
					y = 370,
					type = "label",
					style = "label_white_24",
					x = 270,
					anchorPoint = ccp(0.5, 0.5),
					color = colorText[10002]
				},
				{
					text = "奥食堂y服",
					name = "serverName2",
					y = 370,
					type = "label",
					style = "label_white_24",
					x = 660,
					anchorPoint = ccp(0.5, 0.5),
					color = colorText[10002]
				},
				{
					y = 310,
					x = 220,
					type = "sprite",
					pic = {
						frame = true,
						path = "kfgz_gzjs_tit_gjjl.png"
					},
					scale = var_0_1.rewardTitleScale
				},
				{
					y = 310,
					style = "label_white_24",
					type = "label",
					x = 330,
					textId = 410007,
					anchorPoint = ccp(0, 0.5)
				},
				{
					text = "",
					name = "cityRatio",
					y = 310,
					type = "label",
					style = "label_white_24",
					x = 445 + var_0_1.occupyLabelNationX,
					anchorPoint = ccp(0, 0.5),
					color = ccc3(89, 211, 68)
				},
				{
					text = "",
					name = "rewardNum1",
					anchorX = 0,
					type = "richLabel",
					y = 310,
					x = 530 + var_0_1.ticketsLabelX
				},
				{
					y = 240,
					x = 220,
					type = "sprite",
					pic = {
						frame = true,
						path = "kfgz_gzjs_tit_grjl.png"
					},
					scale = var_0_1.rewardTitleScale
				},
				{
					y = 265,
					style = "label_white_24",
					type = "label",
					x = 330,
					textId = 410205,
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = 265,
					name = "rankLabel",
					style = "label_white_24",
					type = "label",
					textId = 410205,
					x = 380 + var_0_1.nickNameValueX,
					anchorPoint = ccp(0, 0.5)
				},
				{
					text = "",
					name = "rewardNum2",
					anchorX = 0,
					type = "richLabel",
					y = 265,
					x = 530 + var_0_1.ticketsLabelX
				},
				{
					y = 235,
					style = "label_white_24",
					type = "label",
					x = 330,
					textId = 410206,
					anchorPoint = ccp(0, 0.5)
				},
				{
					text = "",
					name = "soloLabel",
					y = 235,
					type = "label",
					style = "label_white_24",
					x = 380 + var_0_1.duelCountX,
					anchorPoint = ccp(0, 0.5),
					color = ccc3(89, 211, 68)
				},
				{
					text = "",
					name = "rewardNum3",
					anchorX = 0,
					type = "richLabel",
					y = 235,
					x = 530 + var_0_1.ticketsLabelX
				},
				{
					y = 205,
					style = "label_white_24",
					type = "label",
					x = 330,
					textId = 410207,
					anchorPoint = ccp(0, 0.5)
				},
				{
					text = "",
					name = "occupyLabel",
					y = 205,
					type = "label",
					style = "label_white_24",
					x = 380 + var_0_1.occupyLabelX,
					anchorPoint = ccp(0, 0.5),
					color = ccc3(89, 211, 68)
				},
				{
					text = "",
					name = "rewardNum4",
					anchorX = 0,
					type = "richLabel",
					y = 205,
					x = 530 + var_0_1.ticketsLabelX
				},
				{
					x = 220,
					y = 135,
					type = "sprite",
					pic = {
						frame = true,
						path = "kfgz_gzjs_tit_zj.png"
					}
				},
				{
					x = 380,
					y = 135,
					type = "sprite",
					pic = {
						frame = true,
						path = "kfgz_gzjs_icon_dq.png"
					}
				},
				{
					x = 450,
					y = 135,
					type = "sprite",
					pic = {
						frame = true,
						path = "res_plus.png"
					}
				},
				{
					name = "rewardNum0",
					type = "atlaslabel",
					pic = "res/ui/common/number/get_numb.png",
					startCharMap = 48,
					text = "0",
					y = 135,
					itemWidth = 29,
					x = 470,
					itemHeight = 46,
					anchorPoint = ccp(0, 0.5)
				},
				{
					marginH = 10,
					name = "getRewardButton",
					h = 67,
					type = "button",
					w = 200,
					x = 472,
					zoomOnTouchDown = true,
					y = 50,
					marginV = 10,
					normal = {
						frame = true,
						path = "kfgz_view_btn_lqjl_a.png"
					},
					touched = {
						frame = true,
						path = "kfgz_view_btn_lqjl_c.png"
					},
					label = {
						type = "label",
						strokeSize = 2,
						textId = 410208,
						fontSize = 24 + var_0_1.getRewardBtnLabelSize,
						color = colorText[10004],
						strokeColor = colorText[10005]
					}
				},
				{
					text = "",
					name = "multipleNum",
					y = 50,
					type = "label",
					style = "label_white_24",
					x = 260 + var_0_1.multipleTipX,
					anchorPoint = ccp(0, 0.5),
					color = ccc3(89, 211, 68)
				},
				{
					text = "",
					name = "leftRewardNum",
					y = 50,
					type = "label",
					style = "label_white_24",
					x = 660,
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = 50,
					name = "goldNode",
					visible = false,
					type = "node",
					x = 600,
					children = {
						{
							x = 0,
							y = 0,
							type = "sprite",
							pic = {
								frame = true,
								path = "res_icon_19_small.png"
							}
						},
						{
							text = "",
							name = "goldNum",
							y = 0,
							type = "label",
							style = "label_white_24",
							x = 20,
							anchorPoint = ccp(0, 0.5),
							color = ccc3(255, 255, 91),
							anchorPoint = ccp(0, 0.5)
						}
					}
				}
			}
		}
	}
}

function var_0_0.refreshGetRewardInfo()
	var_0_0.view.widgets.rewardNum0:setString(var_0_0.tickNum * var_0_0.xs)
	var_0_0.view.widgets.multipleNum:setString(language.get(410010, var_0_0.xs))
	var_0_0.view.widgets.leftRewardNum:setString(language.get(410011, var_0_0.maxTimes - var_0_0.rewardTime))

	if var_0_0.gold == 0 then
		var_0_0.view.widgets.goldNode:setVisible(false)
	elseif var_0_0.maxTimes == var_0_0.rewardTimes then
		var_0_0.view.widgets.getRewardButton:setEnable(false)
		var_0_0.view.widgets.goldNode:setVisible(false)
	else
		var_0_0.view.widgets.goldNum:setString(var_0_0.gold)
		var_0_0.view.widgets.goldNode:setVisible(true)
	end
end

function var_0_0.handlerGetReward(arg_3_0)
	local var_3_0 = arg_3_0.action.data

	var_0_0.xs = var_3_0.xs
	var_0_0.rewardTime = var_3_0.rewardTimes
	var_0_0.gold = var_3_0.gold

	var_0_0.refreshGetRewardInfo()

	local var_3_1 = {}

	table.insert(var_3_1, {
		id = 100,
		value = var_0_0.tickNum * var_0_0.xs
	})
	globalAction_gotResource(var_3_1)
end

function var_0_0.getReward()
	local function var_4_0()
		cmgr.sendRequest(var_0_0.handlerGetReward, actions.kfgzGetReward, var_0_0.rewardTime)
	end

	local function var_4_1()
		return
	end

	if var_0_0.gold == 0 then
		var_4_0()
	else
		messageBox.confirm(language.get(410012, var_0_0.gold, var_0_0.xs), var_4_0, language.get(10001), var_4_1)
	end
end

function var_0_0.handlerResultInfo(arg_7_0)
	log.info("kfgzOver.handlerResultInfo", tool.tableToJson(arg_7_0))

	local var_7_0 = arg_7_0.action.data
	local var_7_1 = var_7_0.isWin
	local var_7_2 = var_7_0.isFinal
	local var_7_3 = stringSplit(var_7_0.reward, ":")

	var_0_0.rewardTime = var_7_0.rewardTimes
	var_0_0.maxTimes = var_7_0.maxTimes
	var_0_0.xs = var_7_0.xs
	var_0_0.gold = var_7_0.gold

	if var_7_2 and var_0_0.matchFinalCallback then
		var_0_0.matchFinalCallback()
	end

	var_0_0.view.widgets.groupLabel:setString(tostring(arg_7_0.action.data.group))

	var_0_0.tickNum = 0

	for iter_7_0, iter_7_1 in pairs(var_7_3) do
		local var_7_4 = tonumber(iter_7_1)

		var_0_0.tickNum = var_0_0.tickNum + var_7_4
	end

	if tolua.type(var_7_0.serverName1) == "[undefined]" then
		var_7_0.serverName1 = language.get(410209)
	end

	if tolua.type(var_7_0.serverName2) == "[undefined]" then
		var_7_0.serverName2 = language.get(410209)
	end

	if conf.language == "vie" then
		local var_7_5 = string.match(var_7_0.serverName1, "%d+") or var_7_0.serverName1
		local var_7_6 = string.match(var_7_0.serverName2, "%d+") or var_7_0.serverName2

		var_0_0.view.widgets.serverName1:setString("S" .. var_7_5)
		var_0_0.view.widgets.serverName2:setString("S" .. var_7_6)
	else
		var_0_0.view.widgets.serverName1:setString(var_7_0.serverName1)
		var_0_0.view.widgets.serverName2:setString(var_7_0.serverName2)
	end

	var_0_0.view.widgets.cityRatio:setString(string.format("%s:%s", var_7_0.cityNum1, var_7_0.cityNum2))
	var_0_0.view.widgets.rewardNum1:setString(language.get(410008, var_7_3[2]))
	log.info("@@ 玩家称号 ", var_7_0.playerKillRank)

	if var_7_0.playerKillRank == 0 then
		var_0_0.view.widgets.rankLabel:setString(language.get(410130))
		var_0_0.view.widgets.rankLabel:setColor(colorQuality[0])
	elseif var_7_0.playerKillRank <= 5 then
		var_0_0.view.widgets.rankLabel:setString(language.get(410135))
		var_0_0.view.widgets.rankLabel:setColor(colorQuality[6])
	elseif var_7_0.playerKillRank <= 10 then
		var_0_0.view.widgets.rankLabel:setString(language.get(410134))
		var_0_0.view.widgets.rankLabel:setColor(colorQuality[5])
	elseif var_7_0.playerKillRank <= 20 then
		var_0_0.view.widgets.rankLabel:setString(language.get(410133))
		var_0_0.view.widgets.rankLabel:setColor(colorQuality[3])
	elseif var_7_0.playerKillRank <= 30 then
		var_0_0.view.widgets.rankLabel:setString(language.get(410132))
		var_0_0.view.widgets.rankLabel:setColor(colorQuality[2])
	elseif var_7_0.playerKillRank <= 40 then
		var_0_0.view.widgets.rankLabel:setString(language.get(410131))
		var_0_0.view.widgets.rankLabel:setColor(colorQuality[1])
	else
		var_0_0.view.widgets.rankLabel:setString(language.get(410130))
		var_0_0.view.widgets.rankLabel:setColor(colorQuality[0])
	end

	var_0_0.view.widgets.rewardNum2:setString(language.get(410008, var_7_3[3]))
	var_0_0.view.widgets.soloLabel:setString(language.get(410009, var_7_0.soloWinNum))
	var_0_0.view.widgets.rewardNum3:setString(language.get(410008, var_7_3[4]))
	var_0_0.view.widgets.occupyLabel:setString(language.get(410009, var_7_0.occupyCity))
	var_0_0.view.widgets.rewardNum4:setString(language.get(410008, var_7_3[5]))

	if arg_7_0.action.data.layer == 1 then
		var_0_0.view.widgets.groupName:setDisplayFrame(CCSprite:createWithSpriteFrameName("kfgz_zbjd_tit_ybj.png"):displayFrame())
	elseif arg_7_0.action.data.layer == 2 then
		var_0_0.view.widgets.groupName:setDisplayFrame(CCSprite:createWithSpriteFrameName("kf_tit_xf.png"):displayFrame())
	elseif arg_7_0.action.data.layer == 3 then
		var_0_0.view.widgets.groupName:setDisplayFrame(CCSprite:createWithSpriteFrameName("kfjrj_jrj.png"):displayFrame())
	elseif arg_7_0.action.data.layer == 4 then
		var_0_0.view.widgets.groupName:setDisplayFrame(CCSprite:createWithSpriteFrameName("kf_tit_zz.png"):displayFrame())
	end

	eventManager.dispatchEvent("changeWorldMap", arg_7_0.action.data.layer)
	var_0_0.refreshGetRewardInfo()

	if conf.language == "vie" then
		if var_7_0.layer == 3 then
			var_0_0.view.widgets.kfgz_over_title:setDisplayFrame(CCSprite:create("res/native/ui/kfworld/kfWorldRanking/kfgz_zbjd_tit_jrj_over.png"):displayFrame())
		elseif var_7_0.layer == 4 then
			var_0_0.view.widgets.kfgz_over_title:setDisplayFrame(CCSprite:create("res/native/ui/kfworld/kfWorldRanking/kfgz_zbjd_tit_zzj_over.png"):displayFrame())
		end
	end
end

function var_0_0.getResultInfo()
	cmgr.sendRequest(var_0_0.handlerResultInfo, actions.kfgzResultInfo)
end

function var_0_0.close()
	var_0_0:destory()
end

function var_0_0.create(arg_10_0, arg_10_1)
	var_0_3()
	arg_10_0:destory()
	rmgr.loadResource("res/ui/kfworld/kfWorldRanking.plist")

	arg_10_0.matchFinalCallback = arg_10_1
	arg_10_0.rewardTime = 0
	arg_10_0.maxTimes = 0
	arg_10_0.xs = 0
	arg_10_0.gold = 0
	arg_10_0.tickNum = 0
	arg_10_0.view = {}

	uiutil.initLayout(arg_10_0.view, var_0_0.layout)
	arg_10_0.view.widgets.getRewardButton:addHandleOfControlEvent(arg_10_0.getReward, CCControlEventTouchUpInside)
	arg_10_0.view.widgets.closeWindowButton:addHandleOfControlEvent(arg_10_0.close, CCControlEventTouchUpInside)
	arg_10_0.getResultInfo()
end

function var_0_0.destory(arg_11_0)
	if arg_11_0.view and arg_11_0.view.widgets then
		smgr.getLayer("topLayer"):removeChild(arg_11_0.view.widgets.panel, true)

		arg_11_0.view = {}
	end
end

return var_0_0
