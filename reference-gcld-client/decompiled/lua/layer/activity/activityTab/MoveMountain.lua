local var_0_0 = {}

if conf.language == "tha" then
	var_0_0.leftTimeY = -30
	var_0_0.numX = 0
	var_0_0.wX = 20
	var_0_0.btnTabFntSize = 0
	var_0_0.word2Y = 0
elseif conf.language == "vie" then
	var_0_0.leftTimeY = -30
	var_0_0.numX = -10
	var_0_0.wX = 5
	var_0_0.btnTabFntSize = -6
	var_0_0.word2Y = 10
else
	var_0_0.leftTimeY = 0
	var_0_0.numX = 0
	var_0_0.wX = 0
	var_0_0.btnTabFntSize = 0
	var_0_0.word2Y = 0
end

local var_0_1 = class("MoveMountain", function()
	return createBaseLayer()
end)
local var_0_2 = {
	bg = {
		xcenter = 0,
		name = "bgyanhua",
		type = "pic",
		ycenter = -23,
		pic = "res/ui/playerInfo/invite/bg.jpg",
		children = {
			{
				xcenter = 220,
				name = "leftTime",
				type = "label",
				fontSize = 28,
				font = "Thonburi-Bold",
				ycenter = 205 + var_0_0.leftTimeY,
				anchorPoint = ccp(0, 0),
				color = ccc3(253, 98, 98)
			},
			{
				xcenter = 0,
				name = "middlePanel",
				z = 200,
				type = "pic",
				ycenter = 63,
				pic = "res/ui/activity/moveMountain/ygys_view_strip.png",
				children = {
					{
						x = 100,
						name = "headPic",
						type = "pic",
						ycenter = 0,
						pic = "res/ui/kfzb/kfzbs_txdk72_02.png",
						children = {
							{
								xcenter = 0,
								name = "people",
								type = "pic",
								ycenter = 0,
								pic = "res/ui/activity/moveMountain/farmer/0.jpg"
							}
						}
					},
					{
						xcenter = 0,
						name = "processBarBackground",
						type = "pic",
						ycenter = -5,
						pic = "res/ui/activity/moveMountain/ygys_pb_b.png",
						children = {
							{
								x = 0,
								name = "processBar",
								anchorPointX = 0,
								type = "process",
								ycenter = 0,
								anchorPointY = 0.5,
								pic = "res/ui/activity/moveMountain/ygys_pb.png",
								percentage = 80
							},
							{
								name = "word1",
								fontSize = 28,
								type = "label",
								ycenter = 33,
								xcenter = -205,
								font = "Thonburi-Bold",
								text = language.get(135084),
								color = ccc3(188, 167, 145)
							},
							{
								name = "word2",
								fontSize = 28,
								type = "label",
								xcenter = 185,
								font = "Thonburi-Bold",
								text = language.get(135075),
								ycenter = 33 + var_0_0.word2Y,
								color = ccc3(0, 255, 0)
							},
							{
								xcenter = -97,
								ycenter = 0,
								pic = "res/ui/activity/moveMountain/ygys_pb_bar.png",
								type = "pic"
							},
							{
								xcenter = 97,
								ycenter = 0,
								pic = "res/ui/activity/moveMountain/ygys_pb_bar.png",
								type = "pic"
							},
							{
								name = "wan1",
								type = "pic",
								ycenter = -23,
								pic = "res/ui/activity/moveMountain/ygys_word_wan.png",
								xcenter = -93 + var_0_0.wX
							},
							{
								name = "wan2",
								type = "pic",
								ycenter = -23,
								pic = "res/ui/activity/moveMountain/ygys_word_wan.png",
								xcenter = 101 + var_0_0.wX
							},
							{
								name = "wan3",
								type = "pic",
								ycenter = -23,
								pic = "res/ui/activity/moveMountain/ygys_word_wan.png",
								xcenter = 294 + var_0_0.wX
							}
						}
					},
					{
						xcenter = 370,
						ycenter = 0,
						type = "button",
						buttons = {
							{
								pic2 = "frame:btn_default_lighted.png",
								name = "kaigongButton",
								pic1 = "frame:btn_default_normal.png",
								children = {
									{
										xcenter = 0,
										font = "Thonburi-Bold",
										fontSize = 28,
										type = "label",
										ycenter = 0,
										text = language.get(135083),
										color = ccc3(255, 255, 255)
									},
									{
										xcenter = 60,
										ycenter = 20,
										pic = "res/ui/activity/moveMountain/ygys_btn_bg.png",
										type = "pic"
									}
								}
							}
						}
					},
					{
						text = "2",
						name = "kaigongNum",
						fontSize = 18,
						type = "label",
						ycenter = 20,
						xcenter = 430,
						z = 100
					},
					{
						xcenter = 185,
						name = "tiaozhuanButton",
						type = "pic",
						ycenter = 30,
						pic = "res/ui/kfsy/150150.png"
					}
				}
			},
			{
				xcenter = 0,
				name = "ygys",
				z = 200,
				type = "pic",
				ycenter = 215,
				pic = "res/ui/activity/moveMountain/ygys_title.png"
			},
			{
				xcenter = 0,
				name = "threeMountain",
				z = 201,
				type = "pic",
				ycenter = -127,
				pic = "res/ui/activity/moveMountain/ygys_bg.jpg",
				children = {
					{
						xcenter = -215,
						name = "box1",
						z = 100,
						type = "pic",
						ycenter = 46,
						pic = "res/ui/activity/moveMountain/ygys_box.png"
					},
					{
						xcenter = 5,
						name = "box2",
						z = 100,
						type = "pic",
						ycenter = 54,
						pic = "res/ui/activity/moveMountain/ygys_box.png"
					},
					{
						xcenter = 230,
						name = "box3",
						z = 100,
						type = "pic",
						ycenter = 56,
						pic = "res/ui/activity/moveMountain/ygys_box.png"
					},
					{
						xcenter = -278,
						name = "ygys_bg1",
						z = 0,
						type = "pic",
						ycenter = 0,
						pic = "res/ui/activity/moveMountain/ygys_bg1_3.jpg"
					},
					{
						xcenter = 7,
						name = "ygys_bg2",
						z = 0,
						type = "pic",
						ycenter = 0,
						pic = "res/ui/activity/moveMountain/ygys_bg2_3.jpg"
					},
					{
						xcenter = 283,
						name = "ygys_bg3",
						z = 0,
						type = "pic",
						ycenter = 0,
						pic = "res/ui/activity/moveMountain/ygys_bg3_3.jpg"
					}
				}
			},
			{
				xcenter = -386,
				name = "yugong_button",
				z = 210,
				type = "pic",
				ycenter = 135,
				pic = "frame:tavern_yeqian1_normal.png",
				children = {
					{
						xcenter = -10,
						font = "Thonburi-Bold",
						type = "label",
						ycenter = 0,
						fontSize = 28 + var_0_0.btnTabFntSize,
						text = language.get(135080),
						color = ccc3(255, 255, 255)
					}
				}
			},
			{
				xcenter = -266,
				name = "erzi_button",
				z = 209,
				type = "pic",
				ycenter = 135,
				pic = "frame:tavern_yeqian1_normal.png",
				children = {
					{
						xcenter = -10,
						font = "Thonburi-Bold",
						type = "label",
						ycenter = 0,
						fontSize = 28 + var_0_0.btnTabFntSize,
						text = language.get(135081),
						color = ccc3(255, 255, 255)
					}
				}
			},
			{
				xcenter = -146,
				name = "sunzi_button",
				z = 208,
				type = "pic",
				ycenter = 135,
				pic = "frame:tavern_yeqian1_normal.png",
				children = {
					{
						xcenter = -10,
						font = "Thonburi-Bold",
						type = "label",
						ycenter = 0,
						fontSize = 28 + var_0_0.btnTabFntSize,
						text = language.get(135082),
						color = ccc3(255, 255, 255)
					}
				}
			},
			{
				xcenter = -266,
				name = "light_button",
				z = 211,
				type = "pic",
				ycenter = 135,
				pic = "frame:tavern_yeqian1_light.png",
				children = {
					{
						name = "light_button_name",
						type = "label",
						ycenter = 0,
						xcenter = -10,
						font = "Thonburi-Bold",
						fontSize = 28 + var_0_0.btnTabFntSize,
						text = language.get(135081),
						color = ccc3(255, 255, 255)
					}
				}
			}
		}
	}
}
local var_0_3 = {
	ccp(175, 200),
	ccp(460, 200),
	(ccp(736, 200))
}
local var_0_4 = {
	ccp(130, 100),
	ccp(290, 75),
	ccp(170, 60),
	ccp(300, 45),
	ccp(210, 80),
	ccp(350, 85),
	ccp(440, 70),
	ccp(320, 90),
	ccp(410, 45),
	ccp(500, 120),
	ccp(830, 120),
	ccp(730, 90),
	ccp(680, 100),
	ccp(600, 75),
	(ccp(640, 45))
}
local var_0_5 = {}

var_0_5[1] = true
var_0_5[2] = true
var_0_5[3] = true
var_0_5[4] = true
var_0_5[5] = true

local var_0_6 = 1
local var_0_7 = false
local var_0_8 = 0
local var_0_9 = {
	ccp(150, 100),
	ccp(470, 100),
	(ccp(750, 100))
}
local var_0_10 = {
	ccp(239, 183),
	ccp(459, 191),
	(ccp(684, 193))
}

local function var_0_11(arg_2_0, arg_2_1)
	local var_2_0 = CCArray:create()

	var_2_0:addObject(CCCallFuncN:create(function()
		arg_2_1:setVisible(false)
	end))
	var_2_0:addObject(CCDelayTime:create(1.5))
	var_2_0:addObject(CCCallFuncN:create(function()
		arg_2_1:setVisible(true)
	end))
	var_2_0:addObject(CCJumpBy:create(0.35, arg_2_0, 50, 1))
	var_2_0:addObject(CCJumpBy:create(0.11666666666666665, ccp(0, 0), 16.666666666666668, 1))
	var_2_0:addObject(CCJumpBy:create(0.05833333333333333, ccp(0, 0), 8.333333333333334, 1))

	return var_2_0
end

local function var_0_12()
	local function var_5_0(arg_6_0, arg_6_1)
		arg_6_0[#arg_6_0 + 1] = arg_6_1

		return arg_6_1
	end
end

function var_0_1.ctor(arg_7_0, arg_7_1, arg_7_2)
	log.info("MoveMountain:ctor")
	rmgr.loadResource("res/ui/tavern/tavern.plist")

	if arg_7_2 then
		arg_7_0.data = arg_7_2
	end

	arg_7_0.view = {}
	arg_7_0.view = autoUI.initUI(arg_7_0, var_0_2)

	arg_7_1:addChild(arg_7_0)

	local var_7_0 = CCLabelAtlas:create(tostring(70), "res/ui/common/number/lm_tit_num.png", 22, 32, 48)

	arg_7_0.view.processBarBackground:addChild(var_7_0)
	var_7_0:setPosition(ccp(arg_7_0.view.processBarBackground:getContentSize().width / 2 - 137 + var_0_0.numX, arg_7_0.view.processBarBackground:getContentSize().height / 2 - 33))
	var_7_0:setScale(0.7)

	arg_7_0.view.value1 = var_7_0

	local var_7_1 = CCLabelAtlas:create(tostring(70), "res/ui/common/number/lm_tit_num.png", 22, 32, 48)

	arg_7_0.view.processBarBackground:addChild(var_7_1)
	var_7_1:setPosition(ccp(arg_7_0.view.processBarBackground:getContentSize().width / 2 + 57 + var_0_0.numX, arg_7_0.view.processBarBackground:getContentSize().height / 2 - 33))
	var_7_1:setScale(0.7)

	arg_7_0.view.value2 = var_7_1

	local var_7_2 = CCLabelAtlas:create(tostring(70), "res/ui/common/number/lm_tit_num.png", 22, 32, 48)

	arg_7_0.view.processBarBackground:addChild(var_7_2)
	var_7_2:setPosition(ccp(arg_7_0.view.processBarBackground:getContentSize().width / 2 + 251 + var_0_0.numX, arg_7_0.view.processBarBackground:getContentSize().height / 2 - 33))
	var_7_2:setScale(0.7)

	arg_7_0.view.value3 = var_7_2
	arg_7_0.view.bingtie = {}

	for iter_7_0 = 1, 5 do
		local var_7_3 = CCSprite:create("res/ui/activity/moveMountain/btkd_icon_bt_light.png")

		arg_7_0.view.threeMountain:addChild(var_7_3, 300, 100 + iter_7_0)

		arg_7_0.view.bingtie[iter_7_0] = var_7_3
	end

	arg_7_0.leftTime = arg_7_0.view.leftTime
	arg_7_0.currentState = 1

	arg_7_0:showImage()

	local function var_7_4(arg_8_0)
		arg_7_0.data = arg_8_0.action.data

		for iter_8_0 = 1, arg_7_0.data.copiesIron do
			var_0_5[iter_8_0] = true
		end

		var_0_6 = arg_7_0.currentState
		var_0_7 = true

		arg_7_0:showDialogue(135079, 1.5)
		arg_7_0:setAnimation(arg_7_0.currentState)
		arg_7_0:showImage()
	end

	local function var_7_5()
		log.info("kaigong")

		local function var_9_0(arg_10_0)
			log.info("kaigong success!")
			cmgr.sendRequest(var_7_4, actions.getMoveMountainActivity)
		end

		cmgr.sendRequest(var_9_0, actions.mrFoolWork, arg_7_0.currentState)
	end

	if arg_7_0.view.kaigongButton ~= nil then
		arg_7_0.view.kaigongButton:registerScriptTapHandler(var_7_5)
	end

	arg_7_0.spriteFrames = {}

	arg_7_0:addFarmer("res/ui/activity/moveMountain/work/back.plist", "qqq_", 10, 2)
	arg_7_0:addFarmer("res/ui/activity/moveMountain/work/left.plist", "qqq_l_", 10, 1)
	arg_7_0:addFarmer("res/ui/activity/moveMountain/work/right.plist", "qqq_r_", 10, 3)
end

function var_0_1.onEnter(arg_11_0)
	log.info("MoveMountain:onEnter()")

	arg_11_0.touchBeganRef = handler(arg_11_0, arg_11_0.onTouchBegan)
	arg_11_0.touchMovedRef = handler(arg_11_0, arg_11_0.onTouchMoved)
	arg_11_0.touchEndedRef = handler(arg_11_0, arg_11_0.onTouchEnded)
	arg_11_0.touchCancelledRef = handler(arg_11_0, arg_11_0.onTouchCancelled)

	eventManager.registerEvent("globalOnTouchBegan", arg_11_0.touchBeganRef)
	eventManager.registerEvent("globalOnTouchMoved", arg_11_0.touchMovedRef)
	eventManager.registerEvent("globalOnTouchEnded", arg_11_0.touchEndedRef)
	eventManager.registerEvent("globalOnTouchCancelled", arg_11_0.touchCancelledRef)
end

function var_0_1.onExit(arg_12_0)
	log.info("MoveMountain:onExit()")
	eventManager.unregisterEvent("globalOnTouchBegan", arg_12_0.touchBeganRef)
	eventManager.unregisterEvent("globalOnTouchMoved", arg_12_0.touchMovedRef)
	eventManager.unregisterEvent("globalOnTouchEnded", arg_12_0.touchEndedRef)
	eventManager.unregisterEvent("globalOnTouchCancelled", arg_12_0.touchCancelledRef)
end

function var_0_1.onTouchBegan(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = 1

	local function var_13_1(arg_14_0)
		arg_13_0.data = arg_14_0.action.data
		var_0_7 = false

		local var_14_0 = {
			{}
		}

		var_14_0[1].id = 4
		var_14_0[1].value = var_0_8

		globalAction_gotResource(var_14_0)
		arg_13_0:showImage()
	end

	local function var_13_2(arg_15_0)
		log.info("success getIcon")
		cmgr.sendRequest(var_13_1, actions.getMoveMountainActivity)
	end

	if tool.checkIfTouch(arg_13_0.view.tiaozhuanButton, arg_13_1, arg_13_2) then
		log.info("tiaozhuan!!!")

		if arg_13_0.currentState == 1 then
			require("lua/layer/weaponTab/ui")
			weaponTab.ui.show(1)
		elseif arg_13_0.currentState == 2 then
			smgr.changeScene(SCENE_INSTANCE)
		elseif arg_13_0.currentState == 3 then
			require("lua/layer/resource/ui")
			resourceUI.show(1)
		end

		return
	end

	for iter_13_0 = 1, 5 do
		if tool.checkIfTouch(arg_13_0.view.bingtie[iter_13_0], arg_13_1, arg_13_2) and var_0_5[iter_13_0] then
			log.info("self.view.bingtie " .. iter_13_0)

			var_0_5[iter_13_0] = false

			cmgr.sendRequest(var_13_2, actions.receivedMrFoolIron)

			return
		end
	end

	if tool.checkIfTouch(arg_13_0.view.yugong_button, arg_13_1, arg_13_2) then
		arg_13_0.currentState = 1
		var_0_7 = false

		arg_13_0:showDialogue(135070, 0)
		arg_13_0:showImage()

		return
	elseif tool.checkIfTouch(arg_13_0.view.erzi_button, arg_13_1, arg_13_2) then
		arg_13_0.currentState = 2
		var_0_7 = false

		arg_13_0:showDialogue(135073, 0)
		arg_13_0:showImage()

		return
	elseif tool.checkIfTouch(arg_13_0.view.sunzi_button, arg_13_1, arg_13_2) then
		arg_13_0.currentState = 3
		var_0_7 = false

		arg_13_0:showDialogue(135076, 0)
		arg_13_0:showImage()

		return
	end

	local function var_13_3(arg_16_0)
		log.info("success getBox")
		arg_13_0:setBox(var_13_0)

		var_0_8 = arg_16_0.action.data.iron

		cmgr.sendRequest(var_13_1, actions.getMoveMountainActivity)
	end

	for iter_13_1 = 1, 3 do
		if tool.checkIfTouch(arg_13_0.view["box" .. iter_13_1], arg_13_1, arg_13_2) and arg_13_0.view["box" .. iter_13_1]:isVisible() then
			cmgr.sendRequest(var_13_3, actions.getMoveMountainReward, iter_13_1)

			var_13_0 = iter_13_1

			break
		end
	end
end

function var_0_1.onTouchMoved(arg_17_0, arg_17_1, arg_17_2)
	return
end

function var_0_1.onTouchEnded(arg_18_0, arg_18_1, arg_18_2)
	return
end

function var_0_1.onTouchCancelled(arg_19_0, arg_19_1, arg_19_2)
	return
end

function var_0_1.showBackground(arg_20_0)
	local var_20_0 = {}

	for iter_20_0 = 1, 3 do
		if arg_20_0.data.works[iter_20_0].haveNum < arg_20_0.data.works[iter_20_0].lvs[1].needNum then
			var_20_0[iter_20_0] = 0
		elseif arg_20_0.data.works[iter_20_0].haveNum < arg_20_0.data.works[iter_20_0].lvs[2].needNum then
			var_20_0[iter_20_0] = 1
		elseif arg_20_0.data.works[iter_20_0].haveNum < arg_20_0.data.works[iter_20_0].lvs[3].needNum then
			var_20_0[iter_20_0] = 2
		else
			var_20_0[iter_20_0] = 3
		end

		var_20_0[iter_20_0] = var_20_0[iter_20_0] - arg_20_0.data.works[iter_20_0].times

		if var_20_0[iter_20_0] == 0 then
			arg_20_0.view["ygys_bg" .. iter_20_0]:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/activity/moveMountain/ygys_bg" .. iter_20_0 .. "_1.jpg"))
			arg_20_0.view["ygys_bg" .. iter_20_0]:setVisible(true)
		elseif var_20_0[iter_20_0] == 1 then
			arg_20_0.view["ygys_bg" .. iter_20_0]:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/activity/moveMountain/ygys_bg" .. iter_20_0 .. "_2.jpg"))
			arg_20_0.view["ygys_bg" .. iter_20_0]:setVisible(true)
		elseif var_20_0[iter_20_0] == 2 then
			arg_20_0.view["ygys_bg" .. iter_20_0]:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/activity/moveMountain/ygys_bg" .. iter_20_0 .. "_3.jpg"))
			arg_20_0.view["ygys_bg" .. iter_20_0]:setVisible(true)
		elseif var_20_0[iter_20_0] == 3 then
			arg_20_0.view["ygys_bg" .. iter_20_0]:setVisible(false)
		end
	end
end

function var_0_1.calcuExpPercetage(arg_21_0)
	local var_21_0 = arg_21_0.currentState

	if arg_21_0.data.works[var_21_0].haveNum < arg_21_0.data.works[var_21_0].lvs[1].needNum then
		return arg_21_0.data.works[var_21_0].haveNum / arg_21_0.data.works[var_21_0].lvs[1].needNum / 3 * 100
	elseif arg_21_0.data.works[var_21_0].haveNum < arg_21_0.data.works[var_21_0].lvs[2].needNum then
		return ((arg_21_0.data.works[var_21_0].haveNum - arg_21_0.data.works[var_21_0].lvs[1].needNum) / (arg_21_0.data.works[var_21_0].lvs[2].needNum - arg_21_0.data.works[var_21_0].lvs[1].needNum) / 3 + 0.3333333333333333) * 100
	elseif arg_21_0.data.works[var_21_0].haveNum < arg_21_0.data.works[var_21_0].lvs[3].needNum then
		return ((arg_21_0.data.works[var_21_0].haveNum - arg_21_0.data.works[var_21_0].lvs[2].needNum) / (arg_21_0.data.works[var_21_0].lvs[3].needNum - arg_21_0.data.works[var_21_0].lvs[2].needNum) / 3 + 0.6666666666666666) * 100
	else
		return 100
	end
end

function var_0_1.showNumAboveBar(arg_22_0)
	local function var_22_0(arg_23_0)
		if arg_23_0 > 10000 then
			arg_22_0.view.wan1:setVisible(true)
			arg_22_0.view.wan2:setVisible(true)
			arg_22_0.view.wan3:setVisible(true)

			return arg_23_0 / 10000
		else
			arg_22_0.view.wan1:setVisible(false)
			arg_22_0.view.wan2:setVisible(false)
			arg_22_0.view.wan3:setVisible(false)

			return arg_23_0
		end
	end

	if arg_22_0.currentState == 1 then
		arg_22_0.view.value1:setString(tostring(var_22_0(arg_22_0.data.works[1].lvs[1].needNum)))
		arg_22_0.view.value2:setString(tostring(var_22_0(arg_22_0.data.works[1].lvs[2].needNum)))
		arg_22_0.view.value3:setString(tostring(var_22_0(arg_22_0.data.works[1].lvs[3].needNum)))
	elseif arg_22_0.currentState == 2 then
		arg_22_0.view.value1:setString(tostring(var_22_0(arg_22_0.data.works[2].lvs[1].needNum)))
		arg_22_0.view.value2:setString(tostring(var_22_0(arg_22_0.data.works[2].lvs[2].needNum)))
		arg_22_0.view.value3:setString(tostring(var_22_0(arg_22_0.data.works[2].lvs[3].needNum)))
	elseif arg_22_0.currentState == 3 then
		arg_22_0.view.value1:setString(tostring(var_22_0(arg_22_0.data.works[3].lvs[1].needNum)))
		arg_22_0.view.value2:setString(tostring(var_22_0(arg_22_0.data.works[3].lvs[2].needNum)))
		arg_22_0.view.value3:setString(tostring(var_22_0(arg_22_0.data.works[3].lvs[3].needNum)))
	end
end

function var_0_1.showImage(arg_24_0)
	local var_24_0 = arg_24_0.view.bgyanhua:getContentSize().width
	local var_24_1 = arg_24_0.view.bgyanhua:getContentSize().height

	if arg_24_0.currentState == 1 then
		arg_24_0.view.light_button:setPosition(ccp(var_24_0 / 2 - 386, var_24_1 / 2 + 135))
		arg_24_0.view.light_button_name:setString(language.get(135080))
		arg_24_0.view.people:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/activity/moveMountain/farmer/0.jpg"))
		arg_24_0.view.word1:setString(language.get(135084))
		arg_24_0.view.word2:setString(language.get(135072))
	elseif arg_24_0.currentState == 2 then
		arg_24_0.view.light_button:setPosition(ccp(var_24_0 / 2 - 266, var_24_1 / 2 + 135))
		arg_24_0.view.light_button_name:setString(language.get(135081))
		arg_24_0.view.people:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/activity/moveMountain/farmer/1.jpg"))
		arg_24_0.view.word1:setString(language.get(135085))
		arg_24_0.view.word2:setString(language.get(135074))
	else
		arg_24_0.view.light_button:setPosition(ccp(var_24_0 / 2 - 146, var_24_1 / 2 + 135))
		arg_24_0.view.light_button_name:setString(language.get(135082))
		arg_24_0.view.people:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/activity/moveMountain/farmer/3.jpg"))
		arg_24_0.view.word1:setString(language.get(135086))
		arg_24_0.view.word2:setString(language.get(135077))
	end

	arg_24_0:showNumAboveBar()
	arg_24_0.view.processBar:setPercentage(arg_24_0:calcuExpPercetage())
	arg_24_0.view.kaigongNum:setString(arg_24_0.data.works[arg_24_0.currentState].times)

	if arg_24_0.data.copiesIron then
		var_0_8 = arg_24_0.data.singleIron
	end

	local var_24_2 = 1

	for iter_24_0 = 1, 5 do
		if var_24_2 > arg_24_0.data.copiesIron or not var_0_5[iter_24_0] then
			arg_24_0.view.bingtie[iter_24_0]:setVisible(false)
		else
			var_24_2 = var_24_2 + 1
		end

		if var_0_7 and arg_24_0.data.copiesIron and arg_24_0.data.copiesIron > 0 then
			arg_24_0.view.bingtie[iter_24_0]:setPosition(var_0_3[var_0_6])

			local var_24_3 = var_0_11(ccp(var_0_4[iter_24_0 + 5 * (var_0_6 - 1)].x - var_0_3[var_0_6].x, var_0_4[iter_24_0 + 5 * (var_0_6 - 1)].y - var_0_3[var_0_6].y), arg_24_0.view.bingtie[iter_24_0])

			arg_24_0.view.bingtie[iter_24_0]:runAction(CCSequence:create(var_24_3))
		else
			arg_24_0.view.bingtie[iter_24_0]:setPosition(var_0_4[iter_24_0 + 5 * (var_0_6 - 1)])
		end
	end

	for iter_24_1 = 1, 3 do
		if arg_24_0.data.works[iter_24_1].status == 1 then
			arg_24_0.view["box" .. iter_24_1]:setVisible(true)
		else
			arg_24_0.view["box" .. iter_24_1]:setVisible(false)
		end
	end

	arg_24_0:showBackground()
end

function var_0_1.getFrameEffect(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	log.info(arg_25_1)

	local var_25_0 = CCSpriteFrameCache:sharedSpriteFrameCache()

	var_25_0:addSpriteFramesWithFile(string.format(arg_25_1))

	local var_25_1 = CCArray:create()

	for iter_25_0 = 1, arg_25_3 do
		local var_25_2 = var_25_0:spriteFrameByName(arg_25_2 .. tostring(iter_25_0) .. ".png")

		if var_25_2 then
			var_25_1:addObject(var_25_2)
		end
	end

	var_25_1:retain()
	var_25_0:removeSpriteFramesFromFile(arg_25_1)

	return var_25_1
end

function var_0_1.addFarmer(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4)
	arg_26_0.spriteFrames[arg_26_4] = arg_26_0:getFrameEffect(arg_26_1, arg_26_2, arg_26_3)

	local var_26_0 = CCAnimation:createWithSpriteFrames(arg_26_0.spriteFrames[arg_26_4])
	local var_26_1 = CCAnimate:create(var_26_0)

	if arg_26_4 == 1 then
		arg_26_0.left = CCSprite:createWithSpriteFrame(arg_26_0.spriteFrames[arg_26_4]:objectAtIndex(1))

		arg_26_0.left:setPosition(var_0_9[arg_26_4])
		arg_26_0.left:setScale(1.4)
		arg_26_0.view.threeMountain:addChild(arg_26_0.left, 250)
	elseif arg_26_4 == 2 then
		arg_26_0.back = CCSprite:createWithSpriteFrame(arg_26_0.spriteFrames[arg_26_4]:objectAtIndex(1))

		arg_26_0.back:setPosition(var_0_9[arg_26_4])
		arg_26_0.back:setScale(1.4)
		arg_26_0.view.threeMountain:addChild(arg_26_0.back, 250)
	elseif arg_26_4 == 3 then
		arg_26_0.right = CCSprite:createWithSpriteFrame(arg_26_0.spriteFrames[arg_26_4]:objectAtIndex(1))

		arg_26_0.right:setPosition(var_0_9[arg_26_4])
		arg_26_0.right:setScale(1.4)
		arg_26_0.view.threeMountain:addChild(arg_26_0.right, 250)
	end
end

function var_0_1.setBox(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_0:getFrameEffect("res/ui/activity/moveMountain/box/flash.plist", "qqq_", 13)
	local var_27_1 = CCAnimation:createWithSpriteFrames(var_27_0, 0.1)
	local var_27_2 = CCAnimate:create(var_27_1)
	local var_27_3 = CCSprite:create()

	var_27_3:setPosition(var_0_10[arg_27_1])
	var_27_3:setScale(1.8)
	arg_27_0.view.threeMountain:addChild(var_27_3, 400)

	local var_27_4 = CCSprite:create("res/ui/activity/moveMountain/ygys_box_open.png")

	arg_27_0.view.threeMountain:addChild(var_27_4, 401)
	var_27_4:setPosition(var_0_10[arg_27_1])

	local var_27_5 = CCArray:create()

	var_27_5:addObject(var_27_2)
	var_27_5:addObject(CCCallFuncN:create(function()
		var_27_3:removeFromParentAndCleanup(true)
		var_27_4:removeFromParentAndCleanup(true)
	end))
	var_27_3:runAction(CCSequence:create(var_27_5))
end

function var_0_1.setAnimation(arg_29_0, arg_29_1)
	local var_29_0 = CCAnimation:createWithSpriteFrames(arg_29_0.spriteFrames[arg_29_1], 0.1)
	local var_29_1 = CCAnimate:create(var_29_0)
	local var_29_2 = CCArray:create()

	var_29_2:addObject(var_29_1)
	var_29_2:addObject(var_29_1)

	if arg_29_1 == 1 then
		arg_29_0.left:runAction(CCSequence:create(var_29_2))
	elseif arg_29_1 == 2 then
		arg_29_0.back:runAction(CCSequence:create(var_29_2))
	elseif arg_29_1 == 3 then
		arg_29_0.right:runAction(CCSequence:create(var_29_2))
	end
end

function var_0_1.showDialogue(arg_30_0, arg_30_1, arg_30_2)
	if conf.language ~= "cn" then
		arg_30_0:showDialogueInt(arg_30_1, arg_30_2)

		return
	end

	arg_30_0.view.threeMountain:removeChildByTag(1001, true)

	local var_30_0 = CCSprite:create("res/ui/activity/moveMountain/dinnerTalkViewTable.png")

	var_30_0:setPosition(ccp(280, 220))
	var_30_0:setVisible(false)
	arg_30_0.view.threeMountain:addChild(var_30_0, 1000, 1001)

	local var_30_1 = CCLabelTTF:create(language.get(arg_30_1), "Thonburi", 22)

	var_30_1:setPosition(ccp(var_30_0:getContentSize().width / 2 + 10, var_30_0:getContentSize().height / 2 + 5))
	var_30_0:addChild(var_30_1)

	local var_30_2 = CCArray:create()

	var_30_2:addObject(CCDelayTime:create(arg_30_2))
	var_30_2:addObject(CCCallFuncN:create(function()
		var_30_0:setVisible(true)
	end))
	var_30_2:addObject(CCDelayTime:create(2.8))
	var_30_2:addObject(CCCallFuncN:create(function()
		var_30_0:removeFromParentAndCleanup(true)
	end))
	var_30_0:runAction(CCSequence:create(var_30_2))
end

function var_0_1.showDialogueInt(arg_33_0, arg_33_1, arg_33_2)
	arg_33_0.view.threeMountain:removeChildByTag(1001, true)

	local var_33_0 = {
		{
			y = 220,
			name = "dialogueFrame",
			anchorPointX = 0,
			type = "pic_9_tips",
			frameGap = 36,
			pic = "res/ui/activity/moveMountain/dinnerTalkViewTable.png",
			visible = false,
			anchorPointY = 0.5,
			x = 150,
			middleRect = CCRectMake(42, 24, 208, 108),
			content = {
				{
					fontSize = 22,
					type = "label",
					text = language.get(arg_33_1),
					align = kCCTextAlignmentLeft
				}
			}
		}
	}
	local var_33_1 = autoUI.initUI(nil, var_33_0)

	arg_33_0.view.threeMountain:addChild(var_33_1.dialogueFrame, 1000, 1001)

	local var_33_2 = CCArray:create()

	var_33_2:addObject(CCDelayTime:create(arg_33_2))
	var_33_2:addObject(CCCallFuncN:create(function()
		var_33_1.dialogueFrame:setVisible(true)
	end))
	var_33_2:addObject(CCDelayTime:create(2.8))
	var_33_2:addObject(CCCallFuncN:create(function()
		var_33_1.dialogueFrame:removeFromParentAndCleanup(true)
	end))
	var_33_1.dialogueFrame:runAction(CCSequence:create(var_33_2))
end

return var_0_1
