local var_0_0 = {
	chooseNation = {},
	agree = {}
}

if conf.language == "vie" then
	var_0_0.chooseNation.descFncSize = -3
	var_0_0.chooseNation.betrayedDescFntSize = -4
	var_0_0.chooseNation.leftTimeY = -24
	var_0_0.chooseNation.btnFntSize = -6
	var_0_0.chooseNation.joinNationX = -16
	var_0_0.chooseNation.goldValueX = 26
	var_0_0.chooseNation.goldValueScale = 1
	var_0_0.agree.joinNationX = 0
	var_0_0.agree.goldValueX = 60
	var_0_0.agree.progressBarX = 200
elseif conf.language == "tha" then
	var_0_0.chooseNation.descFncSize = 0
	var_0_0.chooseNation.leftTimeY = 0
	var_0_0.chooseNation.betrayedDescFntSize = 0
	var_0_0.chooseNation.btnFntSize = 0
	var_0_0.chooseNation.joinNationX = 70
	var_0_0.chooseNation.goldValueX = 30
	var_0_0.chooseNation.goldValueScale = 0.75
	var_0_0.agree.joinNationX = 70
	var_0_0.agree.goldValueX = 50
	var_0_0.agree.progressBarX = 0
else
	var_0_0.chooseNation.descFncSize = 0
	var_0_0.chooseNation.leftTimeY = 0
	var_0_0.chooseNation.betrayedDescFntSize = 0
	var_0_0.chooseNation.btnFntSize = 0
	var_0_0.chooseNation.joinNationX = 0
	var_0_0.chooseNation.goldValueX = 0
	var_0_0.chooseNation.goldValueScale = 1
	var_0_0.agree.joinNationX = 0
	var_0_0.agree.goldValueX = 0
	var_0_0.agree.progressBarX = 0
end

local var_0_1 = {
	{
		pic3 = "halfPic_caocao.png"
	},
	{
		pic3 = "halfPic_liubei.png"
	},
	{
		pic3 = "halfPic_sunquan.png"
	}
}
local var_0_2 = {}
local var_0_3 = {}
local var_0_4 = tool.hexToRgb("#D9EDC5")
local var_0_5 = ccc3(0, 180, 0)
local var_0_6 = colorQuality[5]
local var_0_7 = colorQuality[4]
local var_0_8 = colorQuality[2]
local var_0_9 = class("Betray", function()
	return createBaseLayer()
end)

var_0_9.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = false,
		path = "res/ui/activity/betray/zyzh_bg.jpg"
	},
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			y = 0,
			name = "node_info",
			visible = false,
			type = "node",
			x = 0,
			children = {
				{
					x = 458,
					name = "paper",
					y = 235,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_jz_01.png"
					}
				},
				{
					x = 885,
					name = "paper_stick",
					y = 233,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_jz_02.png"
					}
				},
				{
					x = 458,
					y = 472,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_title_sklx.png"
					}
				},
				{
					style = "label_warlock",
					y = 412,
					type = "label",
					x = 458,
					textId = 135406,
					fontSize = 25 + var_0_0.chooseNation.descFncSize,
					color = var_0_4
				},
				{
					fontSize = 25,
					name = "leftTime",
					type = "label",
					text = "99:99:99",
					style = "label_warlock",
					x = 810,
					y = 412 + var_0_0.chooseNation.leftTimeY,
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_6
				},
				{
					y = 492,
					name = "btn_tips",
					style = "button_tip",
					type = "button",
					x = 870
				}
			}
		},
		{
			y = 0,
			name = "node_panel1",
			visible = false,
			type = "node",
			x = 0,
			children = {
				{
					x = 160,
					name = "npcL",
					y = 240,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/halfPic/halfPic_caocao.png"
					}
				},
				{
					x = 230,
					y = 190,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_bg3.png"
					}
				},
				{
					x = 110,
					name = "boxL",
					y = 200,
					type = "sprite",
					scale = 0.8,
					pic = {
						frame = false,
						path = "res/ui/activity/ancientCastle/big_2.png"
					}
				},
				{
					x = 270,
					y = 220,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_tit_04.png"
					}
				},
				{
					x = 300,
					y = 180,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_tit_05.png"
					}
				},
				{
					fontSize = 30,
					name = "forceL",
					y = 222,
					type = "label",
					style = "label_warlock",
					x = 314,
					color = var_0_4
				},
				{
					name = "goldL",
					type = "atlaslabel",
					pic = "res/ui/common/number/resou_up_numb.png",
					startCharMap = 48,
					text = "999",
					y = 180,
					itemWidth = 20,
					itemHeight = 22,
					x = 295 + var_0_0.chooseNation.goldValueX,
					anchorPoint = ccp(0.5, 0.5),
					scale = var_0_0.chooseNation.goldValueScale
				},
				{
					x = 570,
					name = "npcR",
					y = 240,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/halfPic/halfPic_sunquan.png"
					}
				},
				{
					x = 660,
					y = 190,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_bg3.png"
					}
				},
				{
					x = 540,
					name = "boxR",
					y = 200,
					type = "sprite",
					scale = 0.8,
					pic = {
						frame = false,
						path = "res/ui/activity/ancientCastle/big_2.png"
					}
				},
				{
					x = 700,
					y = 220,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_tit_04.png"
					}
				},
				{
					x = 730,
					y = 180,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_tit_05.png"
					}
				},
				{
					fontSize = 30,
					name = "forceR",
					y = 222,
					type = "label",
					style = "label_warlock",
					x = 742,
					color = var_0_4
				},
				{
					name = "goldR",
					type = "atlaslabel",
					pic = "res/ui/common/number/resou_up_numb.png",
					startCharMap = 48,
					text = "999",
					y = 180,
					itemWidth = 20,
					itemHeight = 22,
					x = 725 + var_0_0.chooseNation.goldValueX,
					anchorPoint = ccp(0.5, 0.5),
					scale = var_0_0.chooseNation.goldValueScale
				},
				{
					x = 458,
					y = 235,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_jz_03.png"
					}
				},
				{
					y = 48,
					name = "btn_forceL",
					style = "button_yel3",
					type = "button",
					x = 240,
					children = {
						{
							fontSize = 22,
							name = "btn_txtL",
							y = 27,
							type = "label",
							style = "label_warlock",
							x = 70,
							color = var_0_4
						}
					}
				},
				{
					y = 48,
					name = "btn_forceR",
					style = "button_yel3",
					type = "button",
					x = 676,
					children = {
						{
							fontSize = 22,
							name = "btn_txtR",
							y = 27,
							type = "label",
							style = "label_warlock",
							x = 70,
							color = var_0_4
						}
					}
				}
			}
		},
		{
			y = 0,
			name = "node_panel2",
			visible = false,
			type = "node",
			x = 0,
			children = {
				{
					x = 310,
					y = 340,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_tit_bg.png"
					}
				},
				{
					x = 458,
					y = 245,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_bg1.png"
					}
				},
				{
					x = 160,
					name = "npcSel",
					y = 240,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/halfPic/halfPic_caocao.png"
					}
				},
				{
					x = 458,
					y = 135,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_bg2.png"
					}
				},
				{
					x = 250,
					y = 290,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_tit_01.png"
					},
					anchorPoint = ccp(0, 0.5)
				},
				{
					x = 250,
					y = 250,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_tit_02.png"
					},
					anchorPoint = ccp(0, 0.5)
				},
				{
					x = 250,
					y = 210,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_tit_03.png"
					},
					anchorPoint = ccp(0, 0.5)
				},
				{
					x = 120,
					name = "joinCntLabel",
					y = 142,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_tit_ycjrs.png"
					}
				},
				{
					fontSize = 30,
					name = "forceSel1",
					y = 340,
					type = "label",
					x = 290
				},
				{
					fontSize = 30,
					name = "forceSel2",
					y = 292,
					type = "label",
					style = "label_warlock",
					x = 402,
					color = var_0_4
				},
				{
					name = "goldSel",
					type = "atlaslabel",
					pic = "res/ui/common/number/resou_up_numb.png",
					startCharMap = 48,
					text = "999",
					y = 290,
					itemWidth = 20,
					itemHeight = 22,
					x = 695 + var_0_0.agree.goldValueX,
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					x = 690,
					name = "rank_p1",
					y = 142,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_tit_ndpm.png"
					},
					anchorPoint = ccp(0, 0.5)
				},
				{
					name = "rank_p2",
					type = "atlaslabel",
					pic = "res/ui/common/number/lm_tit_num.png",
					startCharMap = 48,
					text = "999",
					y = 142,
					itemWidth = 22,
					x = 790,
					itemHeight = 32,
					anchorPoint = ccp(0, 0.5)
				},
				{
					x = 843,
					name = "rank_p3",
					y = 142,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_tit_m.png"
					},
					anchorPoint = ccp(0, 0.5)
				},
				{
					x = 410,
					name = "progressBg",
					y = 142,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_pb_bg.png"
					},
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = 142,
					name = "progress",
					type = "progressbar",
					x = 410,
					anchorPoint = ccp(0, 0.5),
					progressType = kCCProgressTimerTypeBar,
					pic = {
						frame = true,
						path = "zyzh_pb.png"
					}
				},
				{
					fontSize = 24,
					name = "numLb",
					y = 142,
					type = "label",
					style = "label_warlock",
					x = 410,
					color = var_0_4
				},
				{
					y = 48,
					name = "btn_ok",
					style = "button_yel3",
					type = "button",
					visible = false,
					x = 308,
					children = {
						{
							style = "label_warlock",
							y = 27,
							type = "label",
							x = 70,
							textId = 240001,
							fontSize = 22 + var_0_0.chooseNation.btnFntSize,
							color = var_0_4
						}
					}
				},
				{
					y = 48,
					name = "btn_cancel",
					style = "button_yel3",
					type = "button",
					visible = false,
					x = 608,
					children = {
						{
							style = "label_warlock",
							y = 27,
							type = "label",
							x = 70,
							textId = 135434,
							fontSize = 22 + var_0_0.chooseNation.btnFntSize,
							color = var_0_4
						}
					}
				},
				{
					name = "info",
					y = 48,
					type = "label",
					style = "label_warlock",
					x = 458,
					visible = false,
					fontSize = 30 + var_0_0.chooseNation.betrayedDescFntSize,
					color = var_0_4
				}
			}
		}
	}
}

function var_0_9.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getBetrayActivity)
end

function var_0_9.onDoBetray(arg_4_0, arg_4_1)
	local function var_4_0(arg_5_0)
		arg_4_0:refresh()
	end

	local var_4_1 = user.forceIdToName[user.player.forceId]
	local var_4_2 = user.forceIdToName[arg_4_1]

	messageBox.confirm(language.get(135438, var_4_2), function()
		messageBox.confirm(language.get(135439, var_4_1, var_4_2), function()
			cmgr.sendRequest(var_4_0, actions.doBetray, arg_4_1)
		end)
	end)
end

function var_0_9.showBetrayInfo(arg_8_0, arg_8_1)
	local var_8_0 = var_0_3[arg_8_1]
	local var_8_1 = arg_8_0.info.rewards[arg_8_1].forceId

	arg_8_0.view.widgets.forceSel1:setString(language.get(135446, user.forceIdToName[var_8_1]))
	arg_8_0.view.widgets.forceSel2:setString(user.forceIdToName[var_8_1])
	arg_8_0.view.widgets.forceSel2:setColor(colorForce[var_8_1])
	arg_8_0.view.widgets.npcSel:setDisplayFrame(CCSprite:create("res/ui/common/halfPic/" .. var_8_0.pic3):displayFrame())
	arg_8_0.view.widgets.goldSel:setString(var_0_2[arg_8_1])

	local var_8_2 = arg_8_0.info.rewards[arg_8_1].currentNum
	local var_8_3 = arg_8_0.info.rewards[arg_8_1].levels[4].num

	arg_8_0.view.widgets.numLb:setString(var_8_2 .. "/" .. var_8_3)
	arg_8_0.view.widgets.progress:setPercentage(math.floor(100 * var_8_2 / var_8_3))
	arg_8_0.view.widgets.btn_ok:addHandleOfControlEvent(function()
		log.info("btn_ok")
		arg_8_0:onDoBetray(arg_8_0.info.rewards[arg_8_1].forceId)
	end, CCControlEventTouchUpInside)
	arg_8_0.view.widgets.node_panel1:setVisible(false)
	arg_8_0.view.widgets.node_panel2:setVisible(true)
end

function var_0_9.showPanel(arg_10_0, arg_10_1)
	arg_10_0.info = arg_10_1

	for iter_10_0 = 1, 2 do
		local var_10_0 = arg_10_1.rewards[iter_10_0]

		for iter_10_1 = 1, 4 do
			if var_10_0.currentNum < var_10_0.levels[iter_10_1].num then
				var_0_2[iter_10_0] = var_10_0.levels[iter_10_1].gold

				break
			elseif iter_10_1 == 4 then
				var_0_2[iter_10_0] = var_10_0.levels[iter_10_1].gold
			end
		end
	end

	local var_10_1 = arg_10_1.rewards[1].forceId
	local var_10_2 = arg_10_1.rewards[2].forceId

	var_0_3[1] = var_0_1[var_10_1]
	var_0_3[2] = var_0_1[var_10_2]

	arg_10_0.view.widgets.node_info:setVisible(true)
	arg_10_0.view.widgets.btn_ok:setVisible(false)
	arg_10_0.view.widgets.btn_cancel:setVisible(false)
	arg_10_0.view.widgets.info:setVisible(false)
	arg_10_0.view.widgets.rank_p1:setVisible(false)
	arg_10_0.view.widgets.rank_p2:setVisible(false)
	arg_10_0.view.widgets.rank_p3:setVisible(false)

	if arg_10_1.alreadyForceId == 0 then
		arg_10_0.view.widgets.node_panel1:setVisible(true)
		arg_10_0.view.widgets.btn_ok:setVisible(true)
		arg_10_0.view.widgets.btn_cancel:setVisible(true)
		arg_10_0.view.widgets.btn_txtL:setString(language.get(135445, user.forceIdToName[var_10_1]))
		arg_10_0.view.widgets.btn_txtR:setString(language.get(135445, user.forceIdToName[var_10_2]))
		arg_10_0.view.widgets.forceL:setString(user.forceIdToName[var_10_1])
		arg_10_0.view.widgets.forceL:setColor(colorForce[var_10_1])
		arg_10_0.view.widgets.forceR:setString(user.forceIdToName[var_10_2])
		arg_10_0.view.widgets.forceR:setColor(colorForce[var_10_2])
		arg_10_0.view.widgets.npcL:setDisplayFrame(CCSprite:create("res/ui/common/halfPic/" .. var_0_3[1].pic3):displayFrame())
		arg_10_0.view.widgets.npcR:setDisplayFrame(CCSprite:create("res/ui/common/halfPic/" .. var_0_3[2].pic3):displayFrame())
		arg_10_0.view.widgets.goldL:setString(var_0_2[1])
		arg_10_0.view.widgets.goldR:setString(var_0_2[2])
	else
		local var_10_3
		local var_10_4 = arg_10_1.alreadyForceId == arg_10_1.rewards[1].forceId and 1 or 2

		arg_10_0:showBetrayInfo(var_10_4)
		arg_10_0.view.widgets.info:setString(language.get(135435, user.forceIdToName[arg_10_1.alreadyForceId]))
		arg_10_0.view.widgets.info:setVisible(true)
		arg_10_0.view.widgets.rank_p2:setString(arg_10_1.rank)

		local var_10_5, var_10_6 = arg_10_0.view.widgets.rank_p1:getPosition()
		local var_10_7 = arg_10_0.view.widgets.rank_p1:getContentSize().width
		local var_10_8 = arg_10_0.view.widgets.rank_p2:getContentSize().width
		local var_10_9 = arg_10_0.view.widgets.rank_p3:getContentSize().width

		if conf.language == "vie" then
			arg_10_0.view.widgets.rank_p3:setPositionX(var_10_5 + var_10_7 + 4)
			arg_10_0.view.widgets.rank_p2:setPositionX(var_10_5 + var_10_7 + 4 + var_10_9 + 4)
		else
			arg_10_0.view.widgets.rank_p2:setPositionX(var_10_5 + var_10_7 + 4)
			arg_10_0.view.widgets.rank_p3:setPositionX(var_10_5 + var_10_7 + 4 + var_10_8 + 4)
		end

		arg_10_0.view.widgets.rank_p1:setVisible(true)
		arg_10_0.view.widgets.rank_p2:setVisible(true)

		if conf.language ~= "tha" then
			arg_10_0.view.widgets.rank_p3:setVisible(true)
		end
	end
end

function var_0_9.showTips(arg_11_0)
	local var_11_0 = createBaseLayer()

	local function var_11_1(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == CCTOUCHBEGAN then
			-- block empty
		elseif arg_12_0 == CCTOUCHENDED then
			smgr.getLayer("topLayer"):removeChild(var_11_0, true)
		end

		return true
	end

	local var_11_2 = {
		tipsBg = {
			xcenter = 0,
			anchorPointX = 0.5,
			type = "pic_9_tips",
			ycenter = 50,
			pic = "frame:common_tip_frame_small.png",
			anchorPointY = 0.5,
			middleRect = CCRectMake(0, 0, 0, 0),
			preferedSize = CCSizeMake(290, 300),
			content = {
				{
					fontSize = 22,
					type = "label",
					text = language.get(135415, arg_11_0.info.levelLimit or 1)
				}
			}
		}
	}

	autoUI.initUI(var_11_0, var_11_2)
	var_11_0:registerScriptTouchHandler(var_11_1, false, true)
	var_11_0:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_11_0, 10002)
	var_11_0:setVisible(true)
end

function var_0_9.ctor(arg_13_0, arg_13_1, arg_13_2)
	log.info("@@ 阵营转换")
	rmgr.loadResource("res/ui/activity/betray/betrayPic.plist")

	arg_13_0.view = {}

	uiutil.initWidgets(arg_13_0.view, arg_13_0.layout)

	arg_13_0.leftTime = arg_13_0.view.widgets.leftTime

	if arg_13_1 then
		arg_13_0:addChild(arg_13_0.view.widgets.panel)
		arg_13_1:addChild(arg_13_0)
	end

	arg_13_0.view.widgets.npcL:setScaleX(-1)
	arg_13_0.view.widgets.npcR:setScaleX(-1)
	arg_13_0.view.widgets.npcSel:setScaleX(-1)
	arg_13_0.view.widgets.boxL:setScaleX(-0.8)
	arg_13_0.view.widgets.boxR:setScaleX(-0.8)
	arg_13_0.view.widgets.btn_forceL:addHandleOfControlEvent(function()
		log.info("btn_forceL")
		arg_13_0:showBetrayInfo(1)
	end, CCControlEventTouchUpInside)
	arg_13_0.view.widgets.btn_forceR:addHandleOfControlEvent(function()
		log.info("btn_forceR")
		arg_13_0:showBetrayInfo(2)
	end, CCControlEventTouchUpInside)
	arg_13_0.view.widgets.btn_cancel:addHandleOfControlEvent(function()
		log.info("btn_cancel")
		arg_13_0.view.widgets.node_panel1:setVisible(true)
		arg_13_0.view.widgets.node_panel2:setVisible(false)
	end, CCControlEventTouchUpInside)
	arg_13_0.view.widgets.btn_tips:addHandleOfControlEvent(function()
		log.info("btn_tips")
		arg_13_0:showTips()
	end, CCControlEventTouchUpInside)

	local var_13_0 = arg_13_0.view.widgets.joinCntLabel:getPositionX() + arg_13_0.view.widgets.joinCntLabel:getContentSize().width / 2 + 4

	arg_13_0.view.widgets.progress:setPositionX(var_13_0)
	arg_13_0.view.widgets.progressBg:setPositionX(var_13_0)
	arg_13_0.view.widgets.rank_p1:setPositionX(arg_13_0.view.widgets.progressBg:getPositionX() + 423 + 4)
	arg_13_0:showPanel(arg_13_2)
end

return var_0_9
