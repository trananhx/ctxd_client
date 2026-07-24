local var_0_0 = class("JubenInfoLayer", function()
	return createBaseLayer()
end)
local var_0_1 = {
	language.get(1449908),
	language.get(1449909),
	language.get(1449910),
	language.get(1449911),
	language.get(1449912)
}

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.juben = arg_2_1
	arg_2_0.uiTable = autoUI.initUI(arg_2_0, arg_2_0:getUiData())

	arg_2_0.uiTable.giveUpButton:registerScriptTapHandler(function()
		messageBox.confirm(language.get(1449902), function()
			arg_2_0:giveUpJuben()
		end)
	end)
end

function var_0_0.eventFinishTimeFly(arg_5_0)
	if juben.eventFinishTime then
		local var_5_0 = CCSprite:create()

		var_5_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))

		local var_5_1 = CCSprite:create("res/ui/juben/event/jb_hide_award_jlshj.png")
		local var_5_2 = tool.formatTime(juben.eventFinishTime * 1000, "@M:@S")
		local var_5_3 = tool.split(var_5_2, ":")
		local var_5_4 = CCLabelAtlas:create(tostring(var_5_3[1]), "res/ui/common/number/resou_up_numb.png", 20, 22, 48)

		var_5_4:setAnchorPoint(ccp(0.5, 0.5))

		local var_5_5 = CCSprite:create("res/ui/juben/result/settle_time_point.png")
		local var_5_6 = CCLabelAtlas:create(tostring(var_5_3[2]), "res/ui/common/number/resou_up_numb.png", 20, 22, 48)

		var_5_6:setAnchorPoint(ccp(0.5, 0.5))
		var_5_1:setPosition(ccp(-65, 0))
		var_5_4:setPosition(ccp(53, 0))
		var_5_5:setPosition(ccp(78, 0))
		var_5_6:setPosition(ccp(103, 0))
		var_5_0:addChild(var_5_1)
		var_5_0:addChild(var_5_4)
		var_5_0:addChild(var_5_5)
		var_5_0:addChild(var_5_6)
		arg_5_0:addChild(var_5_0, 101)

		local var_5_7 = CCEaseExponentialOut:create(CCMoveTo:create(2, ccp(visibleSize.width - 118, visibleSize.height - 146)))
		local var_5_8 = CCCallFuncN:create(function()
			var_5_0:removeFromParentAndCleanup(true)
		end)

		var_5_0:runAction(CCSequence:createWithTwoActions(var_5_7, var_5_8))

		juben.eventFinishTime = nil
	end
end

function var_0_0.giveUpJuben(arg_7_0)
	local function var_7_0(arg_8_0)
		smgr.changeScene(SCENE_MAIN_CITY)
	end

	cmgr.sendRequest(var_7_0, actions.quitJuBen)
end

function var_0_0.setStarNum(arg_9_0, arg_9_1)
	for iter_9_0 = 1, 5 do
		if iter_9_0 <= arg_9_1 then
			arg_9_0.uiTable["star_" .. iter_9_0]:setDisplayFrame(CCSprite:create("res/ui/juben/jubenLevelSelect/jb_mode_star.png"):displayFrame())
		else
			arg_9_0.uiTable["star_" .. iter_9_0]:setDisplayFrame(CCSprite:create("res/ui/juben/jubenLevelSelect/jb_mode_star_gray.png"):displayFrame())
		end
	end
end

function var_0_0.setLeftTime(arg_10_0, arg_10_1)
	if arg_10_0.timelabel then
		arg_10_0.timelabel:removeFromParentAndCleanup(true)
	end

	arg_10_0.timelabel = createTimerLabel(arg_10_1, "@M:@S", "Thonburi", 22)

	arg_10_0.timelabel:setPosition(ccp(94, 24))
	arg_10_0.uiTable.starBoard:addChild(arg_10_0.timelabel)
end

function var_0_0.setStaticLeftTime(arg_11_0, arg_11_1)
	if arg_11_0.timelabel then
		arg_11_0.timelabel:removeFromParentAndCleanup(true)
	end

	arg_11_0.timelabel = CCStrokeLabelTTF:create(tool.formatTime(arg_11_1, "@M:@S"), "Thonburi", 22)

	arg_11_0.timelabel:setPosition(ccp(94, 24))
	arg_11_0.uiTable.starBoard:addChild(arg_11_0.timelabel)
end

function var_0_0.stopLeftTime(arg_12_0)
	if arg_12_0.timelabel then
		pcall(arg_12_0.timelabel.onExit(), arg_12_0.timelabel)
	end
end

function var_0_0.setTitle(arg_13_0, arg_13_1)
	arg_13_0.uiTable.jubenTitle:setString(arg_13_1)
end

function var_0_0.setGrade(arg_14_0, arg_14_1)
	arg_14_0.uiTable.jubenGrade:setString(var_0_1[arg_14_1])
end

function var_0_0.showAllTrick(arg_15_0, arg_15_1)
	if arg_15_0.uiTable.allTrickNode then
		pcall(arg_15_0.uiTable.allTrickNode.removeFromParentAndCleanup, arg_15_0.uiTable.allTrickNode, true)
	end

	arg_15_0.uiTable.trickName:setString(arg_15_1.stratagemName)

	local var_15_0 = CCNode:create()

	arg_15_0.uiTable.allTrickNode = var_15_0

	local var_15_1 = createTimerLabel(arg_15_1.nextTrickTime, "@M:@S", "Thonburi", 20, function()
		var_15_0:removeFromParentAndCleanup(true)

		arg_15_0.uiTable.allTrickNode = nil

		arg_15_0.uiTable.trickBoard:setVisible(false)
	end, nil, nil, colorQuality[5])

	var_15_0:setPosition(ccp(100, 20))
	var_15_0:addChild(var_15_1)
	arg_15_0.uiTable.trickBoard:addChild(var_15_0)
	arg_15_0.uiTable.trickBoard:setVisible(true)
end

function var_0_0.zhangfeiTrick(arg_17_0)
	local var_17_0 = CCSprite:create("res/ui/battle/stategyPic/5.png")

	var_17_0:setPosition(ccp(visibleSize.width + var_17_0:getContentSize().width / 2, visibleSize.height / 2))

	local var_17_1 = CCSprite:create(rmgr.getGeneralBust("zhangfei"))
	local var_17_2 = ccp(var_17_1:getContentSize().width * 0.5 - 50, var_17_1:getContentSize().height * 0.5 + 10)

	var_17_1:setPosition(var_17_2)
	var_17_0:addChild(var_17_1)

	local var_17_3 = CCSprite:create("res/ui/juben/event/jb_dqjz_ztpx.png")
	local var_17_4 = CCSprite:create("res/ui/juben/event/jb_dqjz_htdjzhtq.png")

	var_17_3:setPosition(ccp(520, 160))
	var_17_4:setPosition(ccp(520, 75))
	var_17_0:addChild(var_17_3)
	var_17_0:addChild(var_17_4)
	arg_17_0:addChild(var_17_0)

	local var_17_5 = CCArray:create()

	var_17_5:addObject(CCEaseExponentialOut:create(CCMoveTo:create(0.5, ccp(visibleSize.width / 2, visibleSize.height / 2))))
	var_17_5:addObject(CCDelayTime:create(1))
	var_17_5:addObject(CCMoveTo:create(0.5, ccp(-var_17_0:getContentSize().width / 2, visibleSize.height / 2)))
	var_17_5:addObject(CCCallFuncN:create(function()
		var_17_0:removeFromParentAndCleanup(true)
	end))
	var_17_0:runAction(CCSequence:create(var_17_5))
end

function var_0_0.zhugeliangTrick(arg_19_0)
	local var_19_0 = CCSprite:create("res/ui/battle/stategyPic/5.png")

	var_19_0:setPosition(ccp(visibleSize.width + var_19_0:getContentSize().width / 2, visibleSize.height / 2))

	local var_19_1 = CCSprite:create(rmgr.getGeneralBust("zhugeliang"))
	local var_19_2 = ccp(var_19_1:getContentSize().width * 0.5 - 50, var_19_1:getContentSize().height * 0.5 + 10)

	var_19_1:setPosition(var_19_2)
	var_19_0:addChild(var_19_1)

	local var_19_3 = CCSprite:create("res/ui/juben/event/jb_ccjj_chjjcg.png")
	local var_19_4 = CCSprite:create("res/ui/juben/event/jb_ccjj_wjzdlfb.png")

	var_19_3:setPosition(ccp(520, 160))
	var_19_4:setPosition(ccp(520, 75))
	var_19_0:addChild(var_19_3)
	var_19_0:addChild(var_19_4)
	arg_19_0:addChild(var_19_0)

	local var_19_5 = CCArray:create()

	var_19_5:addObject(CCEaseExponentialOut:create(CCMoveTo:create(0.5, ccp(visibleSize.width / 2, visibleSize.height / 2))))
	var_19_5:addObject(CCDelayTime:create(1))
	var_19_5:addObject(CCMoveTo:create(0.5, ccp(-var_19_0:getContentSize().width / 2, visibleSize.height / 2)))
	var_19_5:addObject(CCCallFuncN:create(function()
		var_19_0:removeFromParentAndCleanup(true)
	end))
	var_19_0:runAction(CCSequence:create(var_19_5))
end

local var_0_2 = {
	[102] = {
		head = "liubiao",
		name = language.get(1449913)
	},
	[101] = {
		head = "yuanshu",
		name = language.get(1449914)
	},
	[104] = {
		head = "caocao",
		name = language.get(1449915)
	},
	[0] = {
		head = "sunjian",
		name = language.get(1449916)
	},
	[103] = {
		head = "dongzhuo",
		name = language.get(1449917)
	}
}

function var_0_0.showYuxiInfo(arg_21_0, arg_21_1)
	arg_21_0.uiTable.yuxiBoard:setVisible(true)

	local function var_21_0(arg_22_0, arg_22_1)
		arg_22_0[#arg_22_0 + 1] = arg_22_1
	end

	if arg_21_0.needToRemoveTable then
		for iter_21_0, iter_21_1 in pairs(arg_21_0.needToRemoveTable) do
			iter_21_1:removeFromParentAndCleanup(true)
		end
	end

	arg_21_0.needToRemoveTable = {}

	local var_21_1 = arg_21_0.uiTable.yuxiBoard
	local var_21_2 = var_21_1:getContentSize()
	local var_21_3 = CCSprite:createWithSpriteFrameName("jb_rk_cyyx.png")

	var_21_3:setPosition(ccp(var_21_2.width / 2, var_21_2.height - 20))
	var_21_0(arg_21_0.needToRemoveTable, var_21_3)
	var_21_1:addChild(var_21_3)

	local var_21_4 = var_21_2.width / 2
	local var_21_5 = var_21_2.height - 32
	local var_21_6 = 50

	for iter_21_2, iter_21_3 in pairs(arg_21_1) do
		local var_21_7 = CCSprite:createWithSpriteFrameName("jb_rk_list.png")

		var_21_7:setPosition(ccp(var_21_4, var_21_5 - (iter_21_2 - 1) * var_21_6))
		var_21_0(arg_21_0.needToRemoveTable, var_21_7)
		var_21_1:addChild(var_21_7)

		local var_21_8 = CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", var_0_2[iter_21_3.forceId].head))

		tool.scaleTo(var_21_8, 48, 48)
		var_21_8:setPosition(ccp(28, var_21_5 - 25 - (iter_21_2 - 1) * var_21_6))
		var_21_0(arg_21_0.needToRemoveTable, var_21_8)
		var_21_1:addChild(var_21_8, 2)

		local var_21_9 = CCStrokeLabelTTF:create(var_0_2[iter_21_3.forceId].name, "Thonburi", 22, 2, ccc3(22, 18, 13))

		var_21_9:setColor(ccc3(197, 171, 141))
		var_21_9:setPosition(ccp(88, var_21_5 - 25 - (iter_21_2 - 1) * var_21_6))
		var_21_0(arg_21_0.needToRemoveTable, var_21_9)
		var_21_1:addChild(var_21_9, 2)

		if iter_21_3.hasRoyalJade == true then
			local var_21_10 = CCSprite:createWithSpriteFrameName("jb_rk_list_r.png")

			var_21_10:setPosition(ccp(var_21_4, var_21_5 - 25 - (iter_21_2 - 1) * var_21_6))
			var_21_0(arg_21_0.needToRemoveTable, var_21_10)
			var_21_1:addChild(var_21_10, 1)

			local var_21_11 = CCSprite:createWithSpriteFrameName("jb_rk_icon_yx.png")

			var_21_11:setPosition(ccp(147, 25))
			var_21_10:addChild(var_21_11)

			if iter_21_3.leftTime > 0 then
				local var_21_12 = createTimerLabel(iter_21_3.leftTime, "@M:@S", "Thonburi", 18, nil, nil, nil, ccc3(235, 209, 176))

				var_21_12:setPosition(ccp(147, 25))
				var_21_10:addChild(var_21_12)
			end
		end
	end
end

function var_0_0.getUiData(arg_23_0)
	local var_23_0 = {}

	local function var_23_1(arg_24_0, arg_24_1)
		arg_24_0[#arg_24_0 + 1] = arg_24_1

		return arg_24_1
	end

	var_23_0.background = {
		top = 20,
		type = "pic_9",
		pic = "frame:jb_rk_set.png",
		middleRect = CCRectMake(0, 14, 197, 1),
		preferedSize = CCSizeMake(197, 207),
		right = 20 + 0.6 * platform.getSafeDistance(),
		children = {
			{
				fontSize = 20,
				name = "jubenTitle",
				width = 130,
				type = "label",
				top = 13,
				height = 0,
				text = "0",
				x = 130,
				color = ccc3(255, 255, 204),
				align = kCCTextAlignmentLeft
			},
			{
				fontSize = 20,
				name = "jubenGrade",
				width = 130,
				type = "label",
				top = 48,
				text = "0",
				x = 130,
				color = ccc3(255, 255, 204),
				align = kCCTextAlignmentLeft
			},
			{
				x = 33,
				y = 166,
				pic = "res/ui/juben/jubenLevelSelect/jb_att_camp.png",
				type = "pic"
			},
			{
				x = 98.5,
				name = "starBoard",
				y = 93,
				type = "pic",
				pic = "frame:jb_rk_list_ms.png",
				children = {
					{
						x = 34,
						name = "star_1",
						y = 45,
						type = "pic",
						pic = "res/ui/juben/jubenLevelSelect/jb_mode_star.png"
					},
					{
						x = 64,
						name = "star_2",
						y = 45,
						type = "pic",
						pic = "res/ui/juben/jubenLevelSelect/jb_mode_star.png"
					},
					{
						x = 94,
						name = "star_3",
						y = 45,
						type = "pic",
						pic = "res/ui/juben/jubenLevelSelect/jb_mode_star.png"
					},
					{
						x = 124,
						name = "star_4",
						y = 45,
						type = "pic",
						pic = "res/ui/juben/jubenLevelSelect/jb_mode_star.png"
					},
					{
						x = 154,
						name = "star_5",
						y = 45,
						type = "pic",
						pic = "res/ui/juben/jubenLevelSelect/jb_mode_star.png"
					}
				}
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "frame:btn3_yel_c.png",
						name = "giveUpButton",
						pic1 = "frame:btn3_yel_a.png",
						y = 35,
						x = 98.5,
						children = {
							{
								xcenter = 0,
								fontSize = 20,
								type = "label",
								ycenter = 0,
								text = language.get(1449901)
							}
						}
					}
				}
			}
		}
	}

	var_23_1(var_23_0.background.children, {
		xcenter = 0,
		name = "trickBoard",
		visible = false,
		type = "pic",
		top = 230,
		pic = "res/ui/juben/event/jb_dqjz_view.png",
		children = {
			{
				x = 193,
				name = "trickHead",
				y = 22.5,
				type = "pic",
				pic = "res/ui/juben/event/jb_dqjz_peop.png"
			},
			{
				fontSize = 20,
				name = "trickName",
				text = "火攻",
				type = "label",
				y = 20,
				x = 40
			}
		}
	})
	var_23_1(var_23_0.background.children, {
		xcenter = 0,
		name = "yuxiBoard",
		type = "pic_9",
		top = 207,
		pic = "frame:jb_rk_set.png",
		visible = false,
		middleRect = CCRectMake(0, 14, 197, 1),
		preferedSize = CCSizeMake(197, 286)
	})

	return var_23_0
end

return var_0_0
