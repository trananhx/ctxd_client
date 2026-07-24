local var_0_0 = class("JubenGuideLayer", function()
	return createBaseLayer()
end)

function var_0_0.onTouch(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	if arg_2_1 == CCTOUCHBEGAN then
		return true
	elseif arg_2_1 == CCTOUCHENDED then
		if arg_2_0.inGuide == true and not arg_2_0.isEnded then
			arg_2_0:playGuide()
		end

		if arg_2_0.inDialog == true then
			arg_2_0:playDialog()
		end

		if arg_2_0.inResult == true then
			guide.ui.setVisible(false)
			arg_2_0:setTouchEnabled(false)
			arg_2_0:removeAllChildrenWithCleanup(true)
			smgr.changeScene(SCENE_MAIN_CITY)
		end
	end
end

function var_0_0.ctor(arg_3_0, arg_3_1)
	arg_3_0.juben = arg_3_1

	arg_3_0:registerScriptTouchHandler(function(arg_4_0, arg_4_1, arg_4_2)
		return arg_3_0:onTouch(arg_4_0, arg_4_1, arg_4_2)
	end, false, true)
	arg_3_0:setTouchEnabled(false)
end

function var_0_0.startCreateGuide(arg_5_0)
	arg_5_0.inGuide = true
	arg_5_0.guide = arg_5_0.juben.config:getGuide()
	arg_5_0.curGuideIdx = 1
	arg_5_0.curChatIdx = 1
	arg_5_0.maxGuide = #arg_5_0.guide

	guide.ui.setVisible(true)
	arg_5_0:setTouchEnabled(true)
	arg_5_0:playGuide()
end

function var_0_0.playGuide(arg_6_0)
	local var_6_0 = arg_6_0.guide[arg_6_0.curGuideIdx]

	arg_6_0.maxChat = #var_6_0.chat

	if arg_6_0.curChatIdx > arg_6_0.maxChat then
		arg_6_0.curGuideIdx = arg_6_0.curGuideIdx + 1
		arg_6_0.curChatIdx = 1
		var_6_0 = arg_6_0.guide[arg_6_0.curGuideIdx]
	end

	if var_6_0.start == 1 then
		arg_6_0:endGuide()

		arg_6_0.isEnded = true

		return
	elseif var_6_0.start == 2 then
		arg_6_0.juben.mapLayer:moveTo(var_6_0.cityId, true)
		arg_6_0:showFollowGeneralPanel()

		return
	end

	local var_6_1 = var_6_0.chat[arg_6_0.curChatIdx]

	if arg_6_0.curChatIdx == 1 then
		arg_6_0.juben.mapLayer:moveTo(var_6_0.cityId, true)

		local var_6_2 = {}

		var_6_2[#var_6_2 + 1] = var_6_0.cityId

		if var_6_0.focusCities ~= nil then
			for iter_6_0, iter_6_1 in pairs(var_6_0.focusCities) do
				var_6_2[#var_6_2 + 1] = iter_6_1
			end
		end

		arg_6_0.juben.mapLayer.effectLayer:focusOnCities(var_6_2)
	end

	local var_6_3 = {}

	if var_6_1.pic == "player" or var_6_1.pic == "~" then
		var_6_3.pic = "res/ui/common/playerPic/player" .. tostring(user.player.pic) .. ".png"
	elseif var_6_1.pic == "xiaoqian" then
		var_6_3.pic = "res/ui/guide/npc_xq.png"
	else
		var_6_3.pic = rmgr.getGeneralBust(var_6_1.pic)
	end

	var_6_3.side = var_6_1.side
	var_6_3.content = var_6_1.content

	arg_6_0:removeAllChildrenWithCleanup(true)

	arg_6_0.uiTable = autoUI.initUI(arg_6_0, arg_6_0:getHalfUiData(var_6_3))

	arg_6_0.uiTable.role:setDisplayFrame(CCSprite:create(var_6_3.pic):displayFrame())

	if conf.language == "kr" then
		arg_6_0.uiTable.text:setDimensions(CCSizeMake(280, 189))
	else
		arg_6_0.uiTable.text:setDimensions(CCSizeMake(280, 0))
	end

	arg_6_0.uiTable.text:setHorizontalAlignment(kCCTextAlignmentLeft)
	arg_6_0.uiTable.text:setVerticalAlignment(kCCVerticalTextAlignmentTop)

	if var_6_3.side == 2 then
		arg_6_0.uiTable.dialogueBox:setScaleX(-1)
		arg_6_0.uiTable.text:setScaleX(-1)
	end

	arg_6_0.curChatIdx = arg_6_0.curChatIdx + 1
end

function var_0_0.endGuide(arg_7_0)
	arg_7_0.guide = nil
	arg_7_0.curGuideIdx = nil
	arg_7_0.curChatIdx = nil
	arg_7_0.maxGuide = nil
	arg_7_0.maxChat = nil

	arg_7_0:removeAllChildrenWithCleanup(true)
	arg_7_0.juben.mapLayer.effectLayer:clear()

	local var_7_0 = CCSprite:create("res/ui/juben/jb_set.png")
	local var_7_1 = CCSprite:create()
	local var_7_2 = CCSprite:create("res/ui/juben/jb_jbks.png")

	var_7_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))

	local var_7_3 = CCLabelAtlas:create("2", "res/ui/common/number/battle_prepare_compo_red.png", 40, 48, 48)

	var_7_3:setAnchorPoint(ccp(0.5, 0.5))
	var_7_3:setPosition(ccp(var_7_0:getContentSize().width / 2, var_7_0:getContentSize().height / 2))
	var_7_2:setPosition(ccp(var_7_0:getContentSize().width / 2, var_7_0:getContentSize().height / 2))
	var_7_1:setPosition(ccp(var_7_0:getContentSize().width / 2, var_7_0:getContentSize().height / 2))
	arg_7_0:addChild(var_7_0)
	var_7_0:addChild(var_7_3)
	var_7_0:addChild(var_7_1)
	var_7_0:addChild(var_7_2)
	var_7_2:setVisible(false)

	local var_7_4 = CCArray:create()

	var_7_4:addObject(CCCallFuncN:create(function()
		var_7_3:setString("2")
		var_7_3:setScale(4)
	end))
	var_7_4:addObject(CCEaseExponentialOut:create(CCScaleTo:create(0.8, 1.5)))
	var_7_4:addObject(CCCallFuncN:create(function()
		var_7_3:setString("1")
		var_7_3:setScale(4)
	end))
	var_7_4:addObject(CCEaseExponentialOut:create(CCScaleTo:create(0.8, 1.5)))
	var_7_4:addObject(CCCallFuncN:create(function()
		var_7_3:setString("0")
		var_7_3:setScale(4)
	end))
	var_7_4:addObject(CCEaseExponentialOut:create(CCScaleTo:create(0.8, 1.5)))
	var_7_4:addObject(CCCallFuncN:create(function()
		var_7_3:setVisible(false)
		var_7_2:setVisible(true)

		local var_11_0 = CCArray:create()

		for iter_11_0 = 10001, 10011 do
			local var_11_1 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("jb_start_" .. iter_11_0 .. ".png")

			if var_11_1 then
				var_11_0:addObject(var_11_1)
			end
		end

		local var_11_2 = CCAnimation:createWithSpriteFrames(var_11_0, 0.1)
		local var_11_3 = CCAnimate:create(var_11_2)

		var_7_1:runAction(var_11_3)
	end))
	var_7_4:addObject(CCDelayTime:create(1.5))
	var_7_4:addObject(CCCallFuncN:create(function()
		arg_7_0.inGuide = false

		arg_7_0:removeAllChildrenWithCleanup(true)
		arg_7_0:setTouchEnabled(false)
		guide.ui.setVisible(false)
		arg_7_0.juben:enterJubenScene()
	end))
	var_7_3:runAction(CCSequence:create(var_7_4))
end

function var_0_0.startDialog(arg_13_0, arg_13_1)
	arg_13_0.dialog = arg_13_1
	arg_13_0.inDialog = true

	local var_13_0 = arg_13_1.id

	arg_13_0.curChatIdx = 1
	arg_13_0.chat = arg_13_0.juben.config:getChat(var_13_0)

	log.info("dialog:%s", tool.tableToJson(arg_13_0.chat))

	local function var_13_1(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == CCTOUCHBEGAN then
			return true
		elseif arg_14_0 == CCTOUCHENDED and not arg_13_0.isEnded then
			arg_13_0:playDialog(arg_13_1)
		end
	end

	guide.ui.setVisible(true)
	arg_13_0:setTouchEnabled(true)
	arg_13_0:playDialog(arg_13_1)
end

function var_0_0.playDialog(arg_15_0, arg_15_1)
	arg_15_0.maxChat = #arg_15_0.chat

	if arg_15_0.curChatIdx > arg_15_0.maxChat then
		if arg_15_0.chat[arg_15_0.maxChat].start == 1 then
			arg_15_0.juben.mapLayer.effectLayer:clear()
		end

		arg_15_0:endDialog()

		return
	end

	local var_15_0 = arg_15_0.chat[arg_15_0.curChatIdx]

	if var_15_0.cityId then
		arg_15_0.juben.mapLayer:moveTo(var_15_0.cityId, true)

		local var_15_1 = {}

		var_15_1[#var_15_1 + 1] = var_15_0.cityId

		arg_15_0.juben.mapLayer.effectLayer:focusOnCities(var_15_1)
	end

	local var_15_2 = {}

	if var_15_0.pic == "player" then
		var_15_2.pic = "res/ui/common/playerPic/player" .. tostring(user.player.pic) .. ".png"
	elseif var_15_0.pic == "xiaoqian" then
		var_15_2.pic = "res/ui/guide/npc_xq.png"
	elseif var_15_0.pic == "followGeneral" then
		local var_15_3 = eventManager.dispatchEvent("getControlGeneralInfo")
		local var_15_4 = eventManager.dispatchEvent("JubenFollowGeneral")

		var_15_2.pic = rmgr.getGeneralBust(var_15_3[var_15_4].pic)
	else
		var_15_2.pic = rmgr.getGeneralBust(var_15_0.pic)
	end

	var_15_2.side = var_15_0.side
	var_15_2.content = var_15_0.content

	if arg_15_1 and arg_15_1.arg and arg_15_1.arg ~= "" then
		var_15_2.content = string.gsub(var_15_2.content, "{0}", arg_15_1.arg)
	end

	arg_15_0:removeAllChildrenWithCleanup(true)

	arg_15_0.uiTable = autoUI.initUI(arg_15_0, arg_15_0:getHalfUiData(var_15_2))

	arg_15_0.uiTable.role:setDisplayFrame(CCSprite:create(var_15_2.pic):displayFrame())

	if conf.language == "kr" then
		arg_15_0.uiTable.text:setDimensions(CCSizeMake(280, 189))
	else
		arg_15_0.uiTable.text:setDimensions(CCSizeMake(280, 155))
	end

	arg_15_0.uiTable.text:setHorizontalAlignment(kCCTextAlignmentLeft)
	arg_15_0.uiTable.text:setVerticalAlignment(kCCVerticalTextAlignmentTop)

	if var_15_2.side == 2 then
		arg_15_0.uiTable.dialogueBox:setScaleX(-1)
		arg_15_0.uiTable.text:setScaleX(-1)
	end

	arg_15_0.curChatIdx = arg_15_0.curChatIdx + 1
end

function var_0_0.endDialog(arg_16_0)
	arg_16_0.chat = nil
	arg_16_0.curChatIdx = nil
	arg_16_0.maxChat = nil
	arg_16_0.inDialog = false

	arg_16_0:removeAllChildrenWithCleanup(true)
	arg_16_0:setTouchEnabled(false)
	guide.ui.setVisible(false)

	if not user.isYw then
		arg_16_0.juben:enterJubenScene(false)
	end
end

function var_0_0.getHalfUiData(arg_17_0, arg_17_1)
	local var_17_0 = {}

	if conf.language == "kr" then
		var_17_0.offset1 = 14
	else
		var_17_0.offset1 = 0
	end

	arg_17_1.pic = arg_17_1.pic or "res/ui/guide/npc_xq.png"
	arg_17_1.side = arg_17_1.side or 1
	arg_17_1.content = arg_17_1.content or "Unknow Content"

	local var_17_1 = {
		role = {
			z = 3,
			pic = "res/ui/guide/npc_xq.png",
			type = "pic"
		}
	}

	if conf.language == "kr" then
		var_17_1.dialogueBox = {
			z = 4,
			type = "pic_9",
			pic = "res/ui/guide/npc_chat_view.png",
			middleRect = CCRectMake(0, 0, 348, 189),
			preferedSize = CCSizeMake(348, 225),
			children = {}
		}
	else
		var_17_1.dialogueBox = {
			z = 4,
			pic = "res/ui/guide/npc_chat_view.png",
			type = "pic",
			children = {}
		}
	end

	local var_17_2 = {
		fontSize = 22,
		name = "text",
		type = "label",
		xcenter = 13,
		z = 5,
		text = arg_17_1.content,
		ycenter = -13 + var_17_0.offset1
	}

	var_17_1.dialogueBox.children[1] = var_17_2

	if arg_17_1.side == 1 then
		var_17_1.role.left = 30
		var_17_1.role.down = 0
		var_17_1.dialogueBox.left = 220
		var_17_1.dialogueBox.y = 130
	else
		var_17_1.role.right = 15
		var_17_1.role.down = 0
		var_17_1.dialogueBox.right = 220
		var_17_1.dialogueBox.y = 130
	end

	return var_17_1
end

local var_0_1 = {
	{
		head = "sunjian"
	},
	{
		head = "yuanshu"
	},
	{
		head = "liubiao"
	},
	{
		head = "dongzhuo"
	},
	{
		head = "caocao"
	}
}

function var_0_0.showChoice(arg_18_0, arg_18_1)
	local function var_18_0(arg_19_0)
		guide.ui.setVisible(true)
		arg_18_0:setTouchEnabled(true)
		arg_18_0:removeAllChildrenWithCleanup(true)

		arg_18_0.uiTable = autoUI.initUI(arg_18_0, arg_18_0:getChoiceWindowUiData(arg_18_1, arg_19_0.action.data))

		local var_19_0 = arg_19_0.action.data
		local var_19_1 = {}
		local var_19_2 = false
		local var_19_3 = false

		if var_19_0.left.type then
			var_19_1[#var_19_1 + 1] = var_19_0.left

			if var_19_0.left and var_19_0.left.type == "multichoice" then
				var_19_2 = true
			end

			if var_19_0.left and var_19_0.left.type == "dychoice" then
				var_19_3 = true
			end
		end

		if var_19_0.right.type then
			var_19_1[#var_19_1 + 1] = var_19_0.right
		end

		local var_19_4 = #var_19_1

		arg_18_0.uiTable.closeItem:registerScriptTapHandler(function()
			guide.ui.setVisible(false)
			arg_18_0:setTouchEnabled(false)
			arg_18_0:removeAllChildrenWithCleanup(true)
		end)

		if var_19_2 then
			for iter_19_0, iter_19_1 in pairs(tool.split(var_19_0.left.content, ",")) do
				arg_18_0.uiTable["specialButton_" .. iter_19_0]:registerScriptTapHandler(function()
					local function var_21_0(arg_22_0)
						guide.ui.setVisible(false)
						arg_18_0:setTouchEnabled(false)
						arg_18_0:removeAllChildrenWithCleanup(true)
						arg_18_0.juben.mapLayer:eventIconRemove(arg_18_1.eventId)
						arg_18_0.juben.mapLayer.effectLayer:yuxiJumpFromWell()
					end

					cmgr.sendRequest(var_21_0, actions.jubenMakeAChoice, arg_18_1.eventId, iter_19_0)
				end)
			end
		elseif var_19_3 then
			local var_19_5 = CCArray:create()

			for iter_19_2, iter_19_3 in pairs(var_19_0.left.cities) do
				arg_18_0.uiTable["specialButton_" .. iter_19_2]:registerScriptTapHandler(function()
					local function var_23_0()
						guide.ui.setVisible(false)
						arg_18_0:setTouchEnabled(false)
						arg_18_0:removeAllChildrenWithCleanup(true)
						arg_18_0.juben.mapLayer:eventIconRemove(arg_18_1.eventId)
					end

					cmgr.sendRequest(var_23_0, actions.jubenMakeAChoice, arg_18_1.eventId, iter_19_3.cityId)
				end)
			end
		else
			for iter_19_4, iter_19_5 in pairs(var_19_1) do
				if iter_19_5.reward and iter_19_5.reward[1] and iter_19_5.reward[1].rewardType == "scenario_finish" then
					arg_18_0.uiTable["choiceLabel_" .. iter_19_4]:setString(language.get(1449921))
				end

				arg_18_0.uiTable["choiceButton_" .. iter_19_4]:registerScriptTapHandler(function()
					local function var_25_0(arg_26_0)
						guide.ui.setVisible(false)
						arg_18_0:setTouchEnabled(false)
						arg_18_0:removeAllChildrenWithCleanup(true)

						if iter_19_5.type == "fight" then
							bmgr.tryEnterBattle(battleType.BATTLE_SCENARIO_EVENT, {
								targetId = iter_19_5.npc,
								terrain = iter_19_5.terrian
							})
						elseif iter_19_5.reward and iter_19_5.reward[1].rewardType == "general_add" then
							arg_18_0.juben.mapLayer:eventIconRemove(arg_18_1.eventId)
						elseif iter_19_5.reward and iter_19_5.reward[1].rewardType == "scenario_finish" then
							arg_18_0.juben.mapLayer:eventIconRemove(arg_18_1.eventId)
						else
							arg_18_0.juben.mapLayer:eventIconRemove(arg_18_1.eventId)
						end

						arg_18_0.juben.mapLayer.effectLayer:checkEventEffect(arg_18_1)

						if arg_18_0.juben.gId == 1 and arg_18_1.eventId == 5 then
							arg_18_0.juben.infoLayer:zhangfeiTrick()
						end
					end

					cmgr.sendRequest(var_25_0, actions.jubenMakeAChoice, arg_18_1.eventId, iter_19_4)
				end)
			end
		end
	end

	cmgr.sendRequest(var_18_0, actions.jubenGetChoice, arg_18_1.eventId)
end

function var_0_0.getChoiceWindowUiData(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = {}

	if conf.language == "kr" then
		var_27_0.offset1 = 100
		var_27_0.offset2 = -50
		var_27_0.offset3 = 100
		var_27_0.offset4 = -30
	else
		var_27_0.offset1 = 0
		var_27_0.offset2 = 0
		var_27_0.offset3 = 0
		var_27_0.offset4 = 0
	end

	local var_27_1 = {
		background = {
			xcenter = 0,
			type = "pic",
			ycenter = 0,
			pic = "res/ui/juben/event/tssj_view_bg.png",
			children = {
				{
					xcenter = 0,
					top = -26,
					pic = "res/ui/juben/event/sj_view_tit.png",
					type = "pic"
				},
				{
					fontSize = 24,
					height = 0,
					type = "label",
					x = 455,
					width = 480,
					text = arg_27_2.title,
					color = ccc3(255, 255, 204),
					y = 272 + var_27_0.offset2
				},
				{
					y = 263,
					x = 145,
					type = "pic",
					pic = "res/ui/juben/event/off_city_port_view.png",
					children = {
						{
							xcenter = 0,
							ycenter = 0,
							type = "pic",
							pic = "res/ui/common/generalPic/generalPic_" .. arg_27_1.pic1 .. ".jpg"
						}
					}
				},
				{
					top = 0,
					right = 18,
					type = "button",
					buttons = {
						{
							pic2 = "frame:btn_close_c.png",
							name = "closeItem",
							pic1 = "frame:btn_close_a.png"
						}
					}
				}
			}
		}
	}
	local var_27_2 = {}
	local var_27_3 = false
	local var_27_4 = false

	if arg_27_2.left.type then
		var_27_2[#var_27_2 + 1] = arg_27_2.left

		if arg_27_2.left and arg_27_2.left.type == "multichoice" then
			var_27_3 = true
		end

		if arg_27_2.left and arg_27_2.left.type == "dychoice" then
			var_27_4 = true
		end
	end

	if arg_27_2.right.type then
		var_27_2[#var_27_2 + 1] = arg_27_2.right
	end

	local var_27_5 = #var_27_2
	local var_27_6 = {
		{
			0
		},
		{
			-150,
			150
		}
	}

	if var_27_3 then
		local var_27_7 = tool.split(arg_27_2.left.content, ",")
		local var_27_8 = #var_27_7
		local var_27_9 = {
			xcenter = 0,
			y = 100,
			type = "pic_9",
			pic = "res/ui/juben/event/tssj_yx_view_bg.jpg",
			middleRect = CCRectMake(25, 25, 70, 70),
			preferedSize = CCSizeMake(580, 146),
			children = {
				{
					fontSize = 20,
					xcenter = 0,
					type = "label",
					top = 13,
					text = language.get(1449903),
					color = ccc3(227, 188, 70)
				}
			}
		}

		var_27_1.background.children[#var_27_1.background.children + 1] = var_27_9

		for iter_27_0, iter_27_1 in pairs(var_27_7) do
			var_27_9.children[#var_27_9.children + 1] = {
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/juben/event/wujiangkuaijielandi.png",
						pic1 = "res/ui/juben/event/wujiangkuaijielandi.png",
						y = 56,
						name = "specialButton_" .. iter_27_0,
						x = 290 - (var_27_8 - 1) / 2 * 105 + (iter_27_0 - 1) * 105,
						children = {
							{
								xcenter = 0,
								ycenter = 0,
								type = "pic",
								pic = "res/ui/common/generalPic/generalPic_" .. var_0_1[iter_27_0].head .. ".jpg"
							}
						}
					}
				}
			}
		end
	elseif var_27_4 then
		local var_27_10 = arg_27_2.left.cities
		local var_27_11 = #var_27_10
		local var_27_12 = {
			xcenter = 0,
			y = 100,
			type = "pic_9",
			pic = "res/ui/juben/event/tssj_yx_view_bg.jpg",
			middleRect = CCRectMake(25, 25, 70, 70),
			preferedSize = CCSizeMake(580, 146),
			children = {
				{
					fontSize = 20,
					xcenter = 0,
					type = "label",
					top = 13,
					text = language.get(400033),
					color = ccc3(227, 188, 70)
				}
			}
		}

		var_27_1.background.children[#var_27_1.background.children + 1] = var_27_12

		for iter_27_2, iter_27_3 in pairs(var_27_10) do
			var_27_12.children[#var_27_12.children + 1] = {
				type = "button",
				buttons = {
					{
						y = 56,
						pic1 = "frame:" .. arg_27_0.juben.config:getCity(iter_27_3.cityId).model,
						pic2 = "frame:" .. arg_27_0.juben.config:getCity(iter_27_3.cityId).model,
						name = "specialButton_" .. iter_27_2,
						x = 290 - (var_27_11 - 1) / 2 * 230 + (iter_27_2 - 1) * 230,
						children = {
							{
								xcenter = 0,
								fontSize = 20,
								type = "label",
								y = 30,
								text = iter_27_3.cityName
							}
						}
					}
				}
			}
		end
	else
		for iter_27_4, iter_27_5 in pairs(var_27_2) do
			local var_27_13 = language.get(1449905)

			if iter_27_5.reward and iter_27_5.reward[1].rewardType == "time" then
				local var_27_14 = iter_27_5.reward[1].value / 60

				var_27_13 = language.get(1449906, var_27_14)
			end

			local var_27_15 = -53
			local var_27_16 = 0

			if iter_27_5.type == "fight" then
				iter_27_5.content = language.get(1449907)
				var_27_16 = 10
			end

			var_27_1.background.children[#var_27_1.background.children + 1] = {
				xcenter = 0,
				name = "normalButton",
				y = 100,
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/juben/event/tssj_list_view_c.jpg",
						pic1 = "res/ui/juben/event/tssj_list_view_a.jpg",
						y = 0,
						name = "choiceButton_" .. iter_27_4,
						x = var_27_6[var_27_5][iter_27_4],
						children = {
							{
								xcenter = 0,
								fontSize = 24,
								type = "label",
								width = 250,
								text = iter_27_5.content,
								color = ccc3(255, 255, 204),
								height = 57 + var_27_0.offset3,
								align = kCCTextAlignmentCenter,
								ycenter = 20 - var_27_16 + var_27_0.offset4
							}
						}
					}
				}
			}
			var_27_1.background.children[#var_27_1.background.children + 1] = {
				fontSize = 20,
				type = "label",
				name = "choiceLabel_" .. iter_27_4,
				text = var_27_13,
				color = ccc3(227, 188, 70),
				x = 368.5 + var_27_6[var_27_5][iter_27_4],
				y = 100 + var_27_15
			}
		end
	end

	return var_27_1
end

local var_0_2 = {
	"jb_js_fail_djjzh.png",
	"jb_js_fail_cbzhzh.png",
	"jb_js_fail_syzhlb.png",
	"jb_js_fail_hjzhl.png",
	"jb_js_fail_gdzhzh.png",
	"jb_js_fail_gwgzlj.png",
	"jb_js_fail_shchshzhl.png",
	"jb_js_fail_lbrs.png",
	"jb_js_fail_bml.png",
	"jb_js_fail_yxzhdzh.png",
	"jb_js_fail_tgzhzh.png",
	"jb_js_fail_djjzh.png",
	[10007] = "jb_js_fail_nxjl.png",
	[10006] = "jb_js_fail_bydj.png",
	[10005] = "jb_js_fail_wczz.png",
	[10002] = "jb_js_fail_csdz.png",
	[10001] = "jb_js_fail_ymtx.png",
	[10003] = "jb_js_fail_zdjz.png",
	[10004] = "jb_js_fail_qdxc.png",
	[10009] = "jb_js_fail_ymsj.png",
	[10008] = "jb_js_fail_jzqs.png",
	[10010] = "jb_js_fail_hsly.png"
}

function var_0_0.showRewardPanel(arg_28_0)
	local function var_28_0(arg_29_0)
		juben = {}
		arg_28_0.inResult = true

		guide.ui.setVisible(true)
		arg_28_0:setTouchEnabled(true)
		arg_28_0:removeAllChildrenWithCleanup(true)
		arg_28_0.juben.infoLayer:stopLeftTime()

		arg_28_0.uiTable = autoUI.initUI(arg_28_0, arg_28_0:getJubenRewardUiData(arg_29_0.action.data))

		if arg_29_0.action.data.win == true then
			local var_29_0 = tool.formatTime(tonumber(arg_29_0.action.data.consumeTime) * 1000, "@M:@S")
			local var_29_1 = tool.split(var_29_0, ":")
			local var_29_2 = var_29_1[1]
			local var_29_3 = var_29_1[2]
			local var_29_4 = CCLabelAtlas:create(var_29_2, "res/ui/common/number/resou_up_numb.png", 20, 22, 48)
			local var_29_5 = CCSprite:create("res/ui/juben/result/settle_time_point.png")
			local var_29_6 = CCLabelAtlas:create(var_29_3, "res/ui/common/number/resou_up_numb.png", 20, 22, 48)
			local var_29_7 = CCNode:create()

			var_29_7:addChild(var_29_5)
			var_29_4:setPosition(ccp(-44, -11))
			var_29_7:addChild(var_29_4)
			var_29_6:setPosition(ccp(5, -11))
			var_29_7:addChild(var_29_6)
			var_29_7:setPosition(ccp(537, 250))
			arg_28_0.uiTable.background:addChild(var_29_7)

			local var_29_8 = 0

			for iter_29_0, iter_29_1 in pairs(arg_29_0.action.data.rewards) do
				if iter_29_1.star <= arg_29_0.action.data.curStar then
					local var_29_9 = 537
					local var_29_10 = 183

					for iter_29_2, iter_29_3 in pairs(iter_29_1.res) do
						if type(iter_29_3.type) == "string" then
							-- block empty
						else
							log.info("reward:", iter_29_3.type, iter_29_3.val)

							if iter_29_3.type == 5 then
								iter_29_3.type = 6
							end

							var_29_8 = var_29_8 + iter_29_3.val

							if iter_29_1.star == arg_29_0.action.data.curStar then
								local var_29_11 = CCSprite:create("res/ui/common/text/resource/res_title_" .. iter_29_3.type .. ".png")
								local var_29_12 = CCSprite:createWithSpriteFrameName("res_plus.png")
								local var_29_13 = CCLabelAtlas:create(tostring(var_29_8), "res/ui/common/number/get_numb.png", 29, 46, 48)
								local var_29_14 = var_29_11:getContentSize().width
								local var_29_15 = var_29_12:getContentSize().width
								local var_29_16 = var_29_13:getContentSize().width
								local var_29_17 = (var_29_14 + var_29_15 + var_29_16) / 2

								var_29_11:setPositionX(var_29_14 / 2 - var_29_17)
								var_29_12:setPositionX(var_29_14 + var_29_15 / 2 - var_29_17)
								var_29_13:setPositionX(var_29_14 + var_29_15 + var_29_16 / 2 - var_29_17 - var_29_16 / 2)
								var_29_13:setPositionY(-var_29_13:getContentSize().height / 2)

								local var_29_18 = CCNode:create()

								var_29_18:addChild(var_29_11)
								var_29_18:addChild(var_29_12)
								var_29_18:addChild(var_29_13)
								var_29_18:setPosition(ccp(var_29_9, var_29_10 - (iter_29_2 - 1) * 30))
								var_29_18:setScale(0.7)
								arg_28_0.uiTable.background:addChild(var_29_18)
							end
						end
					end
				end
			end
		else
			local var_29_19 = {}

			if conf.language == "vie" then
				var_29_19.nodeX = 120
				var_29_19.zjzlX = 120
			else
				var_29_19.nodeX = 0
				var_29_19.zjzlX = 0
			end

			local var_29_20 = {}

			if arg_28_0.juben.gId >= 12 then
				local var_29_21 = CCSprite:create("res/ui/juben/jubenSelect/btn_word_tx.png")

				table.insert(var_29_20, var_29_21)
			end

			local var_29_22 = CCSprite:create("res/ui/juben/result/" .. var_0_2[arg_28_0.juben.gId])

			table.insert(var_29_20, var_29_22)

			local var_29_23 = CCSprite:create("res/ui/juben/result/jb_js_fail_shb.png")

			table.insert(var_29_20, var_29_23)

			local var_29_24 = CCSprite:create("res/ui/juben/result/jb_js_fail_qzjzl.png")
			local var_29_25 = createRichNode(var_29_20, 0.5)

			var_29_25:setPosition(ccp(451 + var_29_19.nodeX, 247))
			var_29_24:setPosition(ccp(451 + var_29_19.zjzlX, 140))
			arg_28_0.uiTable.background:addChild(var_29_25)
			arg_28_0.uiTable.background:addChild(var_29_24)
		end
	end

	cmgr.sendRequest(var_28_0, actions.getJubenReward)
end

function var_0_0.getJubenRewardUiData(arg_30_0, arg_30_1)
	local var_30_0 = {}

	local function var_30_1(arg_31_0, arg_31_1)
		arg_31_0[#arg_31_0 + 1] = arg_31_1

		return arg_31_1
	end

	var_30_0.background = {
		xcenter = 0,
		type = "pic",
		ycenter = 0,
		pic = "frame:fightResultPanel.png",
		children = {}
	}

	var_30_1(var_30_0.background.children, {
		xcenter = 0,
		y = 392.35,
		type = "pic",
		pic = arg_30_1.win and "res/ui/common/text/battle/text_result_success.png" or "res/ui/common/text/battle/text_result_faild.png"
	})
	var_30_1(var_30_0.background.children, {
		anchorPointX = 0,
		scale = 0.7,
		x = 0,
		type = "pic",
		y = 65,
		anchorPointY = 0,
		pic = string.format("res/ui/common/playerPic/player%d.png", user.player.pic)
	})

	if arg_30_1.win == true then
		var_30_1(var_30_0.background.children, {
			x = 319,
			y = 300,
			pic = "res/ui/juben/result/jb_js_win_tgxj.png",
			type = "pic"
		})

		for iter_30_0 = 1, 5 do
			var_30_1(var_30_0.background.children, {
				y = 300,
				type = "pic",
				name = "star_" .. iter_30_0,
				pic = iter_30_0 <= arg_30_1.curStar and "res/ui/juben/jubenLevelSelect/jb_mode_star.png" or "res/ui/juben/jubenLevelSelect/jb_mode_star_gray.png",
				x = 467 + 35 * (iter_30_0 - 1)
			})
		end

		var_30_1(var_30_0.background.children, {
			x = 319,
			y = 250,
			pic = "res/ui/juben/result/jb_js_win_tgshj.png",
			type = "pic"
		})
		var_30_1(var_30_0.background.children, {
			x = 319,
			y = 180,
			pic = "res/ui/juben/result/jb_js_win_hdjl.png",
			type = "pic"
		})
	end

	return var_30_0
end

function var_0_0.showFollowGeneralPanel(arg_32_0)
	local var_32_0 = {
		y = 0,
		name = "Scene",
		type = "node",
		x = 0,
		children = {
			{
				name = "bg",
				type = "sprite",
				x = visibleSize.width * 0.5,
				y = visibleSize.height * 0.5 - 30,
				pic = {
					path = "res/ui/juben/jb_xzwj_bg.png"
				},
				children = {
					{
						y = 0,
						type = "sprite",
						x = 190,
						anchorPoint = ccp(0.5, 0),
						pic = {
							path = "res/ui/guide/npc_xq.png"
						}
					},
					{
						y = 195,
						name = "node1",
						type = "node",
						x = 300,
						children = {
							{
								x = 0,
								name = "btn1",
								h = 72,
								type = "button",
								w = 73,
								y = 0,
								scale = 1.5,
								normal = {
									path = "res/ui/resourceArea2/zcgz_btn_round.png"
								},
								touched = {
									path = "res/ui/resourceArea2/zcgz_btn_round_c.png"
								}
							},
							{
								y = 0,
								name = "icon1",
								x = 0,
								type = "sprite"
							},
							{
								y = -45,
								x = -0.0001,
								type = "sprite",
								pic = {
									path = "res/ui/juben/jb_wj_lv_d.png"
								}
							},
							{
								fontSize = 20,
								name = "info1",
								y = -45,
								type = "label",
								x = 0
							}
						}
					},
					{
						y = 195,
						name = "node2",
						type = "node",
						x = 470,
						children = {
							{
								x = 0,
								name = "btn2",
								h = 72,
								type = "button",
								w = 73,
								y = 0,
								scale = 1.5,
								normal = {
									path = "res/ui/resourceArea2/zcgz_btn_round.png"
								},
								touched = {
									path = "res/ui/resourceArea2/zcgz_btn_round_c.png"
								}
							},
							{
								y = 0,
								name = "icon2",
								x = 0,
								type = "sprite"
							},
							{
								y = -45,
								x = -0.0001,
								type = "sprite",
								pic = {
									path = "res/ui/juben/jb_wj_lv_d.png"
								}
							},
							{
								fontSize = 20,
								name = "info2",
								y = -45,
								type = "label",
								x = 0
							}
						}
					},
					{
						y = 195,
						name = "node3",
						type = "node",
						x = 640,
						children = {
							{
								x = 0,
								name = "btn3",
								h = 72,
								type = "button",
								w = 73,
								y = 0,
								scale = 1.5,
								normal = {
									path = "res/ui/resourceArea2/zcgz_btn_round.png"
								},
								touched = {
									path = "res/ui/resourceArea2/zcgz_btn_round_c.png"
								}
							},
							{
								y = 0,
								name = "icon3",
								x = 0,
								type = "sprite"
							},
							{
								y = -45,
								x = -0.0001,
								type = "sprite",
								pic = {
									path = "res/ui/juben/jb_wj_lv_d.png"
								}
							},
							{
								fontSize = 20,
								name = "info3",
								y = -45,
								type = "label",
								x = 0
							}
						}
					},
					{
						y = 70,
						name = "node4",
						type = "node",
						x = 300,
						children = {
							{
								x = 0,
								name = "btn4",
								h = 72,
								type = "button",
								w = 73,
								y = 0,
								scale = 1.5,
								normal = {
									path = "res/ui/resourceArea2/zcgz_btn_round.png"
								},
								touched = {
									path = "res/ui/resourceArea2/zcgz_btn_round_c.png"
								}
							},
							{
								y = 0,
								name = "icon4",
								x = 0,
								type = "sprite"
							},
							{
								y = -45,
								x = 0,
								type = "sprite",
								pic = {
									path = "res/ui/juben/jb_wj_lv_d.png"
								}
							},
							{
								fontSize = 20,
								name = "info4",
								y = -45,
								type = "label",
								x = 0
							}
						}
					},
					{
						fontSize = 22,
						name = "msg",
						height = 70,
						type = "label",
						x = 435,
						y = 290,
						textId = 1448193,
						style = "label_warlock",
						width = 500,
						color = ccc3(255, 255, 255),
						halign = kCCTextAlignmentLeft,
						valign = kCCVerticalTextAlignmentCenter
					}
				}
			}
		}
	}

	arg_32_0:removeAllChildrenWithCleanup(true)
	arg_32_0.juben.mapLayer.effectLayer:clear()

	local var_32_1 = {}

	uiutil.initWidgets(var_32_1, var_32_0)
	arg_32_0:addChild(var_32_1.widgets.Scene)

	local var_32_2 = eventManager.dispatchEvent("getControlGeneralInfo")
	local var_32_3 = 1

	for iter_32_0, iter_32_1 in pairs(var_32_2) do
		local var_32_4 = var_32_3

		var_32_1.widgets["icon" .. var_32_4]:setDisplayFrame(CCSprite:create(string.format("res/ui/common/fightPic/fightPic_%s.png", iter_32_1.pic)):displayFrame())
		var_32_1.widgets["info" .. var_32_4]:setString(language.get(1449925, iter_32_1.name, iter_32_1.lv))
		var_32_1.widgets["btn" .. var_32_4]:addHandleOfControlEvent(function()
			log.info("btn" .. var_32_4, iter_32_1.id)

			arg_32_0.juben.followGeneral = iter_32_1.id

			arg_32_0:endGuide()

			arg_32_0.isEnded = true
		end, CCControlEventTouchUpInside)

		var_32_3 = var_32_3 + 1
	end
end

return var_0_0
