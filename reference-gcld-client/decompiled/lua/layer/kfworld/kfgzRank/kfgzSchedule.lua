local var_0_0 = {}
local var_0_1 = {}

if conf.language == "kr" then
	var_0_1.tit_scbX = 40
	var_0_1.timerX = 40
	var_0_1.serverFontSize = 0
	var_0_1.nationFontSize = 0
	var_0_1.rankFontStyle = "label_yellowish_24"
	var_0_1.tipIconX = 0
	var_0_1.titleGroupNumX = 0
	var_0_1.titleGroupLabelX = 0
elseif conf.language == "vie" then
	var_0_1.tit_scbX = 0
	var_0_1.timerX = 40
	var_0_1.serverFontSize = -6
	var_0_1.nationFontSize = -6
	var_0_1.rankFontStyle = "label_yellowish_18"
	var_0_1.tipIconX = 60
	var_0_1.titleGroupNumX = 0
	var_0_1.titleGroupLabelX = 0
elseif conf.language == "tha" then
	var_0_1.tit_scbX = 100
	var_0_1.timerX = 0
	var_0_1.serverFontSize = 0
	var_0_1.nationFontSize = 0
	var_0_1.rankFontStyle = "label_yellowish_18"
	var_0_1.tipIconX = 0
	var_0_1.titleGroupNumX = 130
	var_0_1.titleGroupLabelX = -10
else
	var_0_1.tit_scbX = 0
	var_0_1.timerX = 0
	var_0_1.serverFontSize = 0
	var_0_1.nationFontSize = 0
	var_0_1.rankFontStyle = "label_yellowish_24"
	var_0_1.tipIconX = 0
	var_0_1.titleGroupNumX = 0
	var_0_1.titleGroupLabelX = 0
end

local var_0_2 = false

local function var_0_3()
	if var_0_2 == true then
		return
	end

	if conf.language == "vie" then
		var_0_0.layout.widgets[1].children[3].visible = false
		var_0_0.layout.widgets[1].children[5].visible = false
		var_0_0.layout.widgets[1].children[6].visible = false
		title = {
			x = 400,
			name = "kfgz_schedule_title",
			y = 454.5,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/native/ui/kfworld/kfWorldRanking/kfgz_zbjd_tit_ybj_schedule.png"
			}
		}

		table.insert(var_0_0.layout.widgets[1].children, title)

		var_0_0.layout.widgets[1].children[4].x = var_0_0.layout.widgets[1].children[4].x + 260
		dzqk = {
			x = 400,
			name = "vieDzqk",
			y = 454.5,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/native/ui/kfworld/kfWorldRanking/kfgz_view_zbjd_up_tit_dzqk.png"
			}
		}
		slash = {
			name = "vieSlashSprite",
			type = "sprite",
			pic = {
				frame = false,
				path = "res/native/ui/kfworld/kfWorldRanking/kfgz_view_zbjd_up_tit_date_slash.png"
			}
		}, table.insert(var_0_0.dateLayout.widgets, dzqk)

		table.insert(var_0_0.dateLayout.widgets, slash)
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
					style = "button_tip",
					name = "tipButton",
					y = 360,
					type = "button",
					x = 800 + var_0_1.tipIconX
				},
				{
					x = 338,
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
					x = 450 + var_0_1.titleGroupNumX
				},
				{
					y = 454.5,
					type = "sprite",
					pic = {
						frame = true,
						path = "kfgz_zbjd_tit_z.png"
					},
					x = 510 + var_0_1.titleGroupLabelX
				},
				{
					y = 454.5,
					type = "sprite",
					pic = {
						frame = true,
						path = "kfgz_zbjd_tit_scb.png"
					},
					x = 608 + var_0_1.tit_scbX
				},
				{
					y = 360,
					name = "dateNode",
					x = 472,
					type = "node"
				},
				{
					x = 472,
					name = "panel",
					y = 398,
					type = "sprite",
					pic = {
						frame = true,
						path = "kfgz_btn_zbjd_c.png"
					},
					children = {
						{
							text = "",
							name = "roundLabel",
							y = 24,
							type = "label",
							size = 32,
							x = 89.5,
							style = "label_white_24",
							color = ccc3(225, 202, 3)
						}
					}
				},
				{
					x = 472,
					name = "panel",
					y = 200,
					type = "sprite",
					pic = {
						frame = true,
						path = "kfgz_view_zbjd_list.png"
					}
				},
				{
					text = "",
					name = "startTipLabel",
					y = 50,
					type = "label",
					style = "label_white_24",
					x = 410
				},
				{
					y = 50,
					name = "timerNode",
					type = "node",
					x = 540 + var_0_1.timerX
				}
			}
		}
	}
}
var_0_0.scheduleItemLayout = {
	name = "scheduleItem",
	type = "node",
	children = {
		{
			x = 0,
			name = "hightlight",
			y = 0,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "kfgz_view_zbjd_list_lig.png"
			},
			anchorPoint = ccp(0, 0.5),
			children = {
				{
					x = 348,
					name = "selfFlag1",
					y = 22,
					type = "sprite",
					visible = false,
					pic = {
						frame = true,
						path = "kfgz_icon_self.png"
					}
				},
				{
					x = 468,
					name = "selfFlag2",
					y = 22,
					type = "sprite",
					visible = false,
					pic = {
						frame = true,
						path = "kfgz_icon_self.png"
					}
				}
			}
		},
		{
			text = "",
			name = "rankLabel1",
			y = 0,
			type = "label",
			x = 73,
			style = var_0_1.rankFontStyle
		},
		{
			text = "",
			name = "rankLabel2",
			y = 0,
			type = "label",
			x = 743,
			style = var_0_1.rankFontStyle
		},
		{
			name = "serverLabel1",
			stroke = true,
			type = "label",
			strokeSize = 1,
			text = "",
			y = 0,
			x = 208,
			color = ccc3(109, 225, 212),
			fontSize = 24 + var_0_1.serverFontSize,
			strokeColor = ccc3(33, 29, 23)
		},
		{
			name = "serverLabel2",
			stroke = true,
			type = "label",
			strokeSize = 1,
			text = "",
			y = 0,
			x = 608,
			color = ccc3(109, 225, 212),
			fontSize = 24 + var_0_1.serverFontSize,
			strokeColor = ccc3(33, 29, 23)
		},
		{
			name = "countryLabel1",
			stroke = true,
			type = "label",
			strokeSize = 1,
			text = "",
			y = 0,
			x = 308,
			fontSize = 24 + var_0_1.nationFontSize,
			strokeColor = ccc3(33, 29, 23)
		},
		{
			name = "countryLabel2",
			stroke = true,
			type = "label",
			strokeSize = 1,
			text = "",
			y = 0,
			x = 508,
			fontSize = 24 + var_0_1.nationFontSize,
			strokeColor = ccc3(33, 29, 23)
		},
		{
			x = 408,
			y = 0,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_view_zbjd_up_vs.png"
			}
		},
		{
			fontSize = 24,
			name = "byeLabel1",
			stroke = true,
			type = "label",
			strokeSize = 1,
			visible = false,
			textId = 410002,
			y = 0,
			x = 196,
			color = ccc3(109, 225, 212),
			strokeColor = ccc3(33, 29, 23)
		},
		{
			fontSize = 24,
			name = "byeLabel2",
			stroke = true,
			type = "label",
			strokeSize = 1,
			visible = false,
			textId = 410002,
			y = 0,
			x = 586,
			color = ccc3(109, 225, 212),
			strokeColor = ccc3(33, 29, 23)
		}
	}
}
var_0_0.dateLayout = {
	widgets = {
		{
			text = "0",
			name = "mouthLabel",
			startCharMap = 48,
			type = "atlaslabel",
			itemWidth = 21,
			pic = "res/ui/common/number/kfgz_view_zbjd_up_nb.png",
			itemHeight = 20
		},
		{
			name = "mouthSprite",
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_view_zbjd_up_tit_yue.png"
			}
		},
		{
			text = "0",
			name = "dayLabel",
			startCharMap = 48,
			type = "atlaslabel",
			itemWidth = 21,
			pic = "res/ui/common/number/kfgz_view_zbjd_up_nb.png",
			itemHeight = 20
		},
		{
			name = "daySprite",
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_view_zbjd_up_tit_ri.png"
			}
		},
		(function()
			if conf.language == "tha" then
				return {
					visible = false,
					name = "space",
					type = "sprite",
					pic = {
						frame = true,
						path = "kfgz_view_zbjd_up_tit_mh.png"
					}
				}
			else
				return {}
			end
		end)(),
		{
			text = "0",
			name = "hourLabel1",
			startCharMap = 48,
			type = "atlaslabel",
			itemWidth = 21,
			pic = "res/ui/common/number/kfgz_view_zbjd_up_nb.png",
			itemHeight = 20
		},
		{
			name = "splitSprite1",
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_view_zbjd_up_tit_mh.png"
			}
		},
		{
			text = "0",
			name = "minLabel1",
			startCharMap = 48,
			type = "atlaslabel",
			itemWidth = 21,
			pic = "res/ui/common/number/kfgz_view_zbjd_up_nb.png",
			itemHeight = 20
		},
		{
			name = "splitSprite2",
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_view_zbjd_up_tit_pzh.png"
			}
		},
		{
			text = "0",
			name = "hourLabel2",
			startCharMap = 48,
			type = "atlaslabel",
			itemWidth = 21,
			pic = "res/ui/common/number/kfgz_view_zbjd_up_nb.png",
			itemHeight = 20
		},
		{
			name = "splitSprite3",
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_view_zbjd_up_tit_mh.png"
			}
		},
		{
			text = "0",
			name = "minLabel2",
			startCharMap = 48,
			type = "atlaslabel",
			itemWidth = 21,
			pic = "res/ui/common/number/kfgz_view_zbjd_up_nb.png",
			itemHeight = 20
		},
		{
			name = "textSprite",
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_view_zbjd_up_tit_dzqk.png"
			}
		}
	}
}

function var_0_0.onTimerOver()
	return
end

function var_0_0.handlerScheduleInfo(arg_4_0)
	log.info("kfgzSchedule.handlerScheduleInfo", tool.tableToJson(arg_4_0))

	local var_4_0 = arg_4_0.action.data.round

	var_0_0.view.widgets.roundLabel:setString(language.get(410001, var_4_0))
	var_0_0.view.widgets.groupLabel:setString(tostring(arg_4_0.action.data.group))

	if arg_4_0.action.data.layer == 1 then
		var_0_0.view.widgets.groupName:setDisplayFrame(CCSprite:createWithSpriteFrameName("kfgz_zbjd_tit_ybj.png"):displayFrame())
	elseif arg_4_0.action.data.layer == 2 then
		var_0_0.view.widgets.groupName:setDisplayFrame(CCSprite:createWithSpriteFrameName("kf_tit_xf.png"):displayFrame())
	elseif arg_4_0.action.data.layer == 3 then
		var_0_0.view.widgets.groupName:setDisplayFrame(CCSprite:createWithSpriteFrameName("kfjrj_jrj.png"):displayFrame())
	elseif arg_4_0.action.data.layer == 4 then
		var_0_0.view.widgets.groupName:setDisplayFrame(CCSprite:createWithSpriteFrameName("kf_tit_zz.png"):displayFrame())
	end

	eventManager.dispatchEvent("changeWorldMap", arg_4_0.action.data.layer)

	local var_4_1 = arg_4_0.action.data.startTime
	local var_4_2 = arg_4_0.action.data.endTime
	local var_4_3 = arg_4_0.action.data.remainTime
	local var_4_4 = os.date("*t", var_4_1 / 1000)
	local var_4_5 = os.date("*t", var_4_2 / 1000)

	if var_4_4.year == var_4_5.year or var_4_4.month == var_4_5.month or var_4_4.day == var_4_5.day then
		local var_4_6 = {}

		uiutil.initLayout(var_4_6, var_0_0.dateLayout)
		var_4_6.widgets.mouthLabel:setString(string.format("%02d", var_4_4.month))
		var_4_6.widgets.dayLabel:setString(string.format("%02d", var_4_4.day))
		var_4_6.widgets.hourLabel1:setString(string.format("%02d", var_4_4.hour))
		var_4_6.widgets.minLabel1:setString(string.format("%02d", var_4_4.min))
		var_4_6.widgets.hourLabel2:setString(string.format("%02d", var_4_5.hour))
		var_4_6.widgets.minLabel2:setString(string.format("%02d", var_4_5.min))

		if conf.language == "vie" then
			local var_4_7 = createRichNode({
				var_4_6.widgets.vieDzqk,
				var_4_6.widgets.hourLabel1,
				var_4_6.widgets.splitSprite1,
				var_4_6.widgets.minLabel1,
				var_4_6.widgets.splitSprite2,
				var_4_6.widgets.hourLabel2,
				var_4_6.widgets.splitSprite3,
				var_4_6.widgets.minLabel2,
				var_4_6.widgets.daySprite,
				var_4_6.widgets.dayLabel,
				var_4_6.widgets.vieSlashSprite,
				var_4_6.widgets.mouthLabel
			}, 0.5)

			var_0_0.view.widgets.dateNode:addChild(var_4_7)
		elseif conf.language == "tha" then
			local var_4_8 = createRichNode({
				var_4_6.widgets.mouthLabel,
				var_4_6.widgets.daySprite,
				var_4_6.widgets.dayLabel,
				var_4_6.widgets.mouthSprite,
				var_4_6.widgets.hourLabel1,
				var_4_6.widgets.splitSprite1,
				var_4_6.widgets.minLabel1,
				var_4_6.widgets.splitSprite2,
				var_4_6.widgets.hourLabel2,
				var_4_6.widgets.splitSprite3,
				var_4_6.widgets.minLabel2,
				var_4_6.widgets.textSprite
			}, 0.5)

			var_0_0.view.widgets.dateNode:addChild(var_4_8)
		else
			local var_4_9 = createRichNode({
				var_4_6.widgets.mouthLabel,
				var_4_6.widgets.mouthSprite,
				var_4_6.widgets.dayLabel,
				var_4_6.widgets.daySprite,
				var_4_6.widgets.hourLabel1,
				var_4_6.widgets.splitSprite1,
				var_4_6.widgets.minLabel1,
				var_4_6.widgets.splitSprite2,
				var_4_6.widgets.hourLabel2,
				var_4_6.widgets.splitSprite3,
				var_4_6.widgets.minLabel2,
				var_4_6.widgets.textSprite
			}, 0.5)

			var_0_0.view.widgets.dateNode:addChild(var_4_9)
		end
	end

	var_0_0.view.widgets.startTipLabel:setString(language.get(410004, var_4_0))

	local var_4_10 = createTimerLabel(var_4_3, "@H:@M:@S", "Thonburi", 24, var_0_0.onTimerOver, nil, nil, colorTips.red)

	var_0_0.view.widgets.timerNode:addChild(var_4_10)

	local var_4_11 = arg_4_0.action.data.scheduleInfo

	if var_4_11 then
		local var_4_12 = 64
		local var_4_13 = 300

		for iter_4_0, iter_4_1 in pairs(var_4_11) do
			local var_4_14 = {}

			uiutil.initWidgets(var_4_14, var_0_0.scheduleItemLayout)
			var_0_0.view.widgets.panel:addChild(var_4_14.widgets.scheduleItem)
			var_4_14.widgets.scheduleItem:setPosition(ccp(var_4_12, var_4_13))

			var_4_13 = var_4_13 - 50

			if iter_4_1.nation1 == 0 then
				var_4_14.widgets.byeLabel1:setVisible(true)
				var_4_14.widgets.rankLabel1:setVisible(false)
				var_4_14.widgets.serverLabel1:setVisible(false)
				var_4_14.widgets.countryLabel1:setVisible(false)
			else
				var_4_14.widgets.serverLabel1:setString(tostring(iter_4_1.serverName1))
				var_4_14.widgets.countryLabel1:setString(language.get(460037, iter_4_1.nationName1))
				var_4_14.widgets.countryLabel1:setColor(colorForce[iter_4_1.nation1])

				if iter_4_1.rank1 == 0 then
					var_4_14.widgets.rankLabel1:setVisible(false)
				else
					var_4_14.widgets.rankLabel1:setString(language.get(410003, iter_4_1.rank1))
				end
			end

			if iter_4_1.nation2 == 0 then
				var_4_14.widgets.byeLabel2:setVisible(true)
				var_4_14.widgets.rankLabel2:setVisible(false)
				var_4_14.widgets.serverLabel2:setVisible(false)
				var_4_14.widgets.countryLabel2:setVisible(false)
			else
				var_4_14.widgets.serverLabel2:setString(tostring(iter_4_1.serverName2))
				var_4_14.widgets.countryLabel2:setString(language.get(460037, iter_4_1.nationName2))
				var_4_14.widgets.countryLabel2:setColor(colorForce[iter_4_1.nation2])

				if iter_4_1.rank1 == 0 then
					var_4_14.widgets.rankLabel2:setVisible(false)
				else
					var_4_14.widgets.rankLabel2:setString(language.get(410003, iter_4_1.rank2))
				end
			end

			if iter_4_1.self and iter_4_1.self == 1 then
				var_4_14.widgets.hightlight:setVisible(true)
			end
		end
	end

	if conf.language == "vie" then
		if arg_4_0.action.data.layer == 3 then
			var_0_0.view.widgets.kfgz_schedule_title:setDisplayFrame(CCSprite:create("res/native/ui/kfworld/kfWorldRanking/kfgz_zbjd_tit_jrj_schedule.png"):displayFrame())
		elseif arg_4_0.action.data.layer == 4 then
			var_0_0.view.widgets.kfgz_schedule_title:setDisplayFrame(CCSprite:create("res/native/ui/kfworld/kfWorldRanking/kfgz_zbjd_tit_zzj_schedule.png"):displayFrame())
		end
	end
end

function var_0_0.getScheduleInfo()
	cmgr.sendRequest(var_0_0.handlerScheduleInfo, actions.kfgzScheduleInfo)
end

function var_0_0.close()
	var_0_0:destory()
end

function var_0_0.showTip()
	require("lua/layer/kfworld/kfgzRank/KfgzTipPanel"):create(var_0_0.view.widgets.panel)
end

function var_0_0.create(arg_8_0)
	var_0_3()
	arg_8_0:destory()
	log.info("@@ 跨服国战赛程")
	rmgr.loadResource("res/ui/kfworld/kfWorldRanking.plist")

	arg_8_0.view = {}

	uiutil.initLayout(arg_8_0.view, arg_8_0.layout)
	arg_8_0.view.widgets.closeWindowButton:addHandleOfControlEvent(arg_8_0.close, CCControlEventTouchUpInside)
	arg_8_0.view.widgets.tipButton:addHandleOfControlEvent(arg_8_0.showTip, CCControlEventTouchUpInside)
	arg_8_0.getScheduleInfo()
end

function var_0_0.destory(arg_9_0)
	if arg_9_0.view and arg_9_0.view.widgets then
		smgr.getLayer("topLayer"):removeChild(arg_9_0.view.widgets.panel, true)

		arg_9_0.view = {}
	end
end

return var_0_0
