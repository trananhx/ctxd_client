local var_0_0 = colorQuality[0]
local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = ccc3(0, 180, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = {
	ccp(-80, 40),
	ccp(70, 50),
	ccp(80, -40),
	ccp(-70, -50)
}
local var_0_7 = {
	"daiji3%04d.png",
	"daiji5%04d.png",
	"daiji7%04d.png",
	"daiji1%04d.png"
}
local var_0_8 = {
	"cuizi3%04d.png",
	"cuizi5%04d.png",
	"cuizi7%04d.png",
	"cuizi1%04d.png"
}
local var_0_9 = class("BuildMenu", function()
	return CCNode:create()
end)

var_0_9.layout = {
	y = 0,
	name = "Scene",
	type = "node",
	x = 0,
	children = {
		{
			y = 0,
			name = "node_worker",
			x = 0,
			type = "node"
		},
		{
			fontSize = 20,
			name = "name1",
			y = 0,
			type = "label",
			x = 0
		},
		{
			fontSize = 20,
			name = "name2",
			y = 0,
			type = "label",
			x = 0
		},
		{
			fontSize = 20,
			name = "name3",
			y = 0,
			type = "label",
			x = 0
		},
		{
			fontSize = 20,
			name = "name4",
			y = 0,
			type = "label",
			x = 0
		},
		{
			type = "sprite",
			name = "bg_state",
			x = 0,
			visible = false,
			y = -15,
			scale = 0.6,
			pic = {
				path = "res/ui/activity/fishing/hjcd_time_line.png"
			},
			children = {
				{
					fontSize = 25,
					name = "state",
					y = 29,
					type = "label",
					x = 165
				}
			}
		},
		{
			x = 0,
			name = "btn_leave",
			h = 60,
			type = "button",
			w = 120,
			y = 20,
			visible = false,
			scale = 0.8,
			normal = {
				path = "res/ui/common/button/public_btn_red.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_red_c.png"
			},
			children = {
				{
					fontSize = 25,
					y = 32,
					type = "label",
					x = 60,
					textId = 84002
				}
			}
		},
		{
			type = "sprite",
			name = "bg_bar",
			x = 0,
			visible = false,
			y = -15,
			scale = 0.8,
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
					style = "label_warlock",
					type = "label",
					y = 12.5,
					x = 122.5,
					color = var_0_1
				}
			}
		},
		{
			type = "sprite",
			name = "underConstruction",
			x = 0,
			visible = false,
			y = 12,
			scale = 0.8,
			pic = {
				path = "res/ui/buildEvent/jzsj_word_jzjxz.png"
			}
		},
		{
			y = 90,
			name = "btn_event",
			h = 70,
			type = "button",
			w = 70,
			visible = false,
			x = 0,
			normal = {
				path = "res/ui/world/worldEventBtn1.png"
			},
			touched = {
				path = "res/ui/world/worldEventBtn1.png"
			},
			children = {
				{
					x = 35,
					name = "icon",
					y = 35,
					type = "sprite",
					scale = 0.85,
					pic = {
						path = "res/ui/buildEvent/jzsj_czx06.jpg"
					}
				}
			}
		}
	}
}

local var_0_10 = {
	y = 130,
	name = "bg_event",
	type = "sprite9",
	preferedSize = CCSizeMake(654, 190),
	middleRect = CCRectMake(110, 36, 434, 178),
	x = visibleSize.width * 0.5,
	pic = {
		path = "res/ui/activity/famous/gjms_sce_view_bg.png"
	},
	children = {
		{
			y = 8,
			name = "node",
			type = "node",
			x = 180,
			children = {
				{
					w = 404,
					name = "optionButton",
					h = 112,
					type = "button",
					y = 56,
					x = 202,
					normal = {
						path = "res/ui/activity/famous/gjms_sce_list.jpg"
					},
					touched = {
						path = "res/ui/activity/famous/gjms_sce_list_on.jpg"
					}
				},
				{
					y = 56,
					x = 58,
					type = "sprite",
					scale = 1.33,
					pic = {
						path = "res/ui/activity/famous/gjms_icon_view.jpg"
					},
					children = {
						{
							x = 30,
							name = "eventPic",
							y = 30,
							type = "sprite",
							scale = 0.75,
							pic = {
								path = "res/ui/common/ItemsPic/liang.jpg"
							}
						}
					}
				},
				{
					fontSize = 22,
					name = "optionDescriptionLabel",
					type = "label",
					x = 115,
					height = 0,
					y = 75,
					width = 270,
					halign = kCCTextAlignmentLeft,
					anchorPoint = ccp(0, 0.5)
				},
				{
					fontSize = 22,
					name = "optionCostLabel",
					type = "label",
					width = 270,
					height = 0,
					y = 35,
					x = 115,
					halign = kCCTextAlignmentLeft,
					color = var_0_2,
					anchorPoint = ccp(0, 0.5)
				}
			}
		},
		{
			fontSize = 22,
			name = "eventDesLabel",
			type = "label",
			x = 180,
			height = 0,
			y = 148,
			width = 400,
			halign = kCCTextAlignmentLeft,
			anchorPoint = ccp(0, 0.5)
		},
		{
			y = 115,
			name = "generalPic",
			type = "sprite",
			x = 55,
			pic = {
				path = "res/ui/common/halfPic/halfPic_caocao2.png"
			}
		}
	}
}

function var_0_9.onCastleAutoMove(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0, var_2_1 = tool.getPositionInScreen(arg_2_0.view.widgets.Scene)

	local function var_2_2(arg_3_0)
		arg_2_0:showEffectTxtFly("res/ui/buildEvent/jzsj_word_jzdksqw.png", ccp(var_2_0, var_2_1 + 70))
	end

	cmgr.sendRequest(var_2_2, actions.castleAutoMove, arg_2_1, arg_2_2)
end

function var_0_9.onDealForceEvent(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local var_4_0, var_4_1 = tool.getPositionInScreen(arg_4_0.view.widgets.Scene)

	local function var_4_2(arg_5_0)
		if arg_4_2 == 1 then
			pcall(arg_4_3.removeFromParentAndCleanup, arg_4_3, true)
		end

		local var_5_0 = arg_4_2 == 1 and "jzsj_word_cgjrjz.png" or "jzsj_word_nytcjz.png"

		arg_4_0:showEffectTxtFly("res/ui/buildEvent/" .. var_5_0, ccp(var_4_0, var_4_1 + 70))
	end

	cmgr.sendRequest(var_4_2, actions.dealForceEvent, arg_4_1, arg_4_2)
end

function var_0_9.onBtnEventTap(arg_6_0)
	for iter_6_0, iter_6_1 in pairs(generalMoveLayer.gongjiangTable) do
		arg_6_0.gongjiangPlace = iter_6_1.locationId
		arg_6_0.gongjiangId = iter_6_1.vId
	end

	if arg_6_0.gongjiangPlace == arg_6_0.info.cityId then
		arg_6_0:showEvent()
	else
		arg_6_0:onCastleAutoMove(arg_6_0.gongjiangId, arg_6_0.info.cityId)
	end
end

function var_0_9.showEffectTxtFly(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = CCSprite:create(arg_7_1)

	smgr.showTipFloatYSprite(var_7_0, 60, arg_7_2)
end

function var_0_9.addWorker(arg_8_0)
	arg_8_0.view.widgets.node_worker:removeAllChildrenWithCleanup(true)

	local var_8_0 = CCSpriteBatchNode:create("res/ui/buildEvent/worker.png")

	arg_8_0.view.widgets.node_worker:addChild(var_8_0, 100)

	local var_8_1 = arg_8_0.info.state == 2

	arg_8_0.isJoined = false

	if var_8_1 then
		local var_8_2 = CCSprite:create()

		var_8_2:setPosition(ccp(-10, 10))

		local var_8_3 = rmgr.getAnimation("buildCastleAnimation")
		local var_8_4 = CCAnimation:createWithSpriteFrames(var_8_3, 0.1)
		local var_8_5 = CCAnimate:create(var_8_4)

		var_8_2:runAction(CCRepeatForever:create(var_8_5))
		arg_8_0.view.widgets.node_worker:addChild(var_8_2, 0)
	end

	for iter_8_0 = 1, 4 do
		local var_8_6 = arg_8_0.info.joiners[iter_8_0]
		local var_8_7 = var_0_6[iter_8_0].x
		local var_8_8 = var_0_6[iter_8_0].y
		local var_8_9 = tool.spriteByName(string.format(var_0_7[iter_8_0], 1))

		var_8_9:setPosition(var_8_7, var_8_8)
		var_8_0:addChild(var_8_9)

		if var_8_6 then
			if not arg_8_0.isJoined then
				arg_8_0.isJoined = user.player.playerId == var_8_6.playerId
			end

			arg_8_0.view.widgets["name" .. iter_8_0]:setString(var_8_6.playerName)

			for iter_8_1 = 1, 5 do
				local var_8_10 = iter_8_1 <= var_8_6.star and "jb_mode_star.png" or "jb_mode_star_gray.png"
				local var_8_11 = tool.spriteByName(var_8_10)

				var_8_11:setScale(0.5)
				var_8_11:setPosition(var_8_7 + 12 * (iter_8_1 - 3), var_8_8 + 55)
				var_8_0:addChild(var_8_11)
			end

			local var_8_12 = CCArray:create()

			if var_8_1 then
				var_8_9:setPosition(var_8_7, var_8_8 + 30)

				for iter_8_2 = 1, 10 do
					local var_8_13 = CCSprite:createWithSpriteFrameName(string.format(var_0_8[iter_8_0], iter_8_2))

					var_8_12:addObject(var_8_13:displayFrame())
				end
			else
				for iter_8_3 = 1, 6 do
					local var_8_14 = CCSprite:createWithSpriteFrameName(string.format(var_0_7[iter_8_0], iter_8_3))

					var_8_12:addObject(var_8_14:displayFrame())
				end
			end

			local var_8_15 = CCAnimation:createWithSpriteFrames(var_8_12, 0.08)
			local var_8_16 = CCAnimate:create(var_8_15)
			local var_8_17 = CCRepeatForever:create(var_8_16)

			var_8_9:runAction(var_8_17)
		else
			arg_8_0.view.widgets["name" .. iter_8_0]:setString(language.get(92142))
		end
	end
end

function var_0_9.showEvent(arg_9_0)
	local var_9_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_9_0:registerScriptTouchHandler(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == CCTOUCHBEGAN then
			pcall(var_9_0.removeFromParentAndCleanup, var_9_0, true)

			return true
		elseif arg_10_0 == CCTOUCHMOVED then
			return true
		elseif arg_10_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)
	var_9_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_9_0, 60000)

	local var_9_1 = {}

	uiutil.initWidgets(var_9_1, var_0_10)
	var_9_0:addChild(var_9_1.widgets.bg_event)
	var_9_1.widgets.eventDesLabel:setString(arg_9_0.info.desc)
	var_9_1.widgets.optionDescriptionLabel:setString(language.get(92144, arg_9_0.info.reqDesc))
	var_9_1.widgets.optionCostLabel:setString(language.get(92145, arg_9_0.info.cost.costNum))

	local var_9_2 = arg_9_0.info.type <= 1 and "jzsj_czx06.jpg" or "jzsj_czx05.jpg"

	var_9_1.widgets.eventPic:setDisplayFrame(CCSprite:create("res/ui/buildEvent/" .. var_9_2):displayFrame())
	var_9_1.widgets.optionButton:addHandleOfControlEvent(function()
		log.info("btn_event")
		arg_9_0:onDealForceEvent(arg_9_0.info.cityId, 1, var_9_0)
	end, CCControlEventTouchUpInside)
end

function var_0_9.showPanel(arg_12_0, arg_12_1)
	arg_12_0.info = arg_12_1

	arg_12_0:addWorker()
	arg_12_0.view.widgets.underConstruction:setVisible(arg_12_1.state == 2)

	if arg_12_1.state == 0 then
		arg_12_0.view.widgets.bg_state:setVisible(arg_12_0.isJoined)
		arg_12_0.view.widgets.btn_leave:setVisible(arg_12_0.isJoined)
		arg_12_0.view.widgets.btn_event:setVisible(not arg_12_0.isJoined)

		if arg_12_0.isJoined then
			arg_12_0.view.widgets.state:setString(language.get(92148))
			arg_12_0.view.widgets.state:setColor(var_0_3)
		else
			local var_12_0 = ""
			local var_12_1 = arg_12_0.info.type <= 1 and (user.isPro > 0 and "sjwc_icon_chuizi.png" or "jzsj_czx06.jpg") or "jzsj_czx05.jpg"

			arg_12_0.view.widgets.icon:setDisplayFrame(CCSprite:create("res/ui/buildEvent/" .. var_12_1):displayFrame())
		end
	elseif arg_12_1.state == 1 then
		arg_12_0.view.widgets.bg_state:setVisible(arg_12_0.isJoined)
		arg_12_0.view.widgets.btn_leave:setVisible(arg_12_0.isJoined)

		if arg_12_0.isJoined then
			local var_12_2 = CCArray:create()

			var_12_2:addObject(CCCallFunc:create(function()
				arg_12_1.startCd = arg_12_1.startCd - 1000

				if arg_12_1.startCd < 0 then
					arg_12_1.startCd = 0

					arg_12_0.view.widgets.bg_state:stopAllActions()
				end

				arg_12_0.view.widgets.state:setString(language.get(92141, tool.getFormatTime(arg_12_1.startCd)))
			end))
			var_12_2:addObject(CCDelayTime:create(1))

			local var_12_3 = CCSequence:create(var_12_2)

			arg_12_0.view.widgets.bg_state:runAction(CCRepeatForever:create(var_12_3))
		end
	elseif arg_12_1.state == 2 then
		arg_12_0.view.widgets.bg_state:setVisible(arg_12_0.isJoined)
		arg_12_0.view.widgets.bg_bar:setVisible(arg_12_0.isJoined)

		if arg_12_0.isJoined then
			local var_12_4 = CCArray:create()

			var_12_4:addObject(CCCallFunc:create(function()
				arg_12_1.endCd = arg_12_1.endCd - 1000

				if arg_12_1.endCd < 0 then
					arg_12_1.endCd = 0

					arg_12_0.view.widgets.bg_bar:stopAllActions()
				end

				arg_12_0.view.widgets.time:setString(tool.getFormatTime(arg_12_1.endCd))

				local var_14_0 = 100 * (arg_12_1.totalTime - arg_12_1.endCd) / arg_12_1.totalTime

				arg_12_0.view.widgets.bar:setPercentage(var_14_0)
			end))
			var_12_4:addObject(CCDelayTime:create(1))

			local var_12_5 = CCSequence:create(var_12_4)

			arg_12_0.view.widgets.bg_bar:runAction(CCRepeatForever:create(var_12_5))
		end
	else
		arg_12_0:removeFromParentAndCleanup(true)
	end
end

function var_0_9.ctor(arg_15_0, arg_15_1, arg_15_2)
	log.info("@@ 建造事件")
	rmgr.loadResource("res/ui/buildEvent/worker.plist")

	arg_15_0.view = {}

	uiutil.initWidgets(arg_15_0.view, arg_15_0.layout)
	arg_15_0:addChild(arg_15_0.view.widgets.Scene)
	arg_15_0.view.widgets.btn_event:addHandleOfControlEvent(function()
		log.info("btn_event")
		arg_15_0:onBtnEventTap()
	end, CCControlEventTouchUpInside)
	arg_15_0.view.widgets.btn_leave:addHandleOfControlEvent(function()
		log.info("btn_leave")
		arg_15_0:onDealForceEvent(arg_15_0.info.cityId, 0)
	end, CCControlEventTouchUpInside)

	for iter_15_0 = 1, 4 do
		local var_15_0 = var_0_6[iter_15_0].x
		local var_15_1 = var_0_6[iter_15_0].y

		arg_15_0.view.widgets["name" .. iter_15_0]:setPosition(var_15_0, var_15_1 + 35)
	end

	arg_15_2.btn_event = arg_15_0.view.widgets.btn_event
	arg_15_2.btn_leave = arg_15_0.view.widgets.btn_leave

	arg_15_0:showPanel(arg_15_1)
	arg_15_0:registerScriptHandler(function(arg_18_0)
		if arg_18_0 == "enter" then
			arg_15_0:onEnter()
		elseif arg_18_0 == "exit" then
			arg_15_0:onExit()
		end
	end)
end

function var_0_9.onEnter(arg_19_0)
	function arg_19_0.changeWorkerIsProRef()
		arg_19_0:showPanel(arg_19_0.info)
	end

	eventManager.registerEvent("changeWorkerIsPro", arg_19_0.changeWorkerIsProRef)
end

function var_0_9.onExit(arg_21_0)
	eventManager.unregisterEvent("changeWorkerIsPro", arg_21_0.changeWorkerIsProRef)
end

return var_0_9
