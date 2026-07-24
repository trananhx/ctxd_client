local var_0_0 = {
	{
		"zjlyx_pb_icon_g.png",
		"zjlyx_pb_icon_h.png"
	},
	{
		"zjlyx_pb_icon_jiu.png",
		"zjlyx_pb_icon_jiu_h.png"
	},
	{
		"zjlyx_pb_icon_zgl_g.png",
		"zjlyx_pb_icon_zgl.png"
	}
}
local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = colorQuality[3]
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = colorQuality[6]
local var_0_7 = {
	{
		pic2 = "lbg.jpg",
		txtId = "222106_juexingJiu",
		pic1 = "res_icon_58.png",
		color = var_0_4
	},
	{
		pic2 = "neh.jpg",
		txtId = "222107_juexingJiu",
		pic1 = "res_icon_59.png",
		color = var_0_3
	},
	{
		pic2 = "zyq.jpg",
		txtId = "222108_juexingJiu",
		pic1 = "res_icon_60.png",
		color = var_0_2
	},
	{
		pic2 = "lbg.jpg",
		txtId = "222106_juexingJiu",
		pic1 = "res_icon_58.png",
		color = var_0_4
	},
	{
		pic2 = "neh.jpg",
		txtId = "222107_juexingJiu",
		pic1 = "res_icon_59.png",
		color = var_0_3
	},
	{
		pic2 = "zyq.jpg",
		txtId = "222108_juexingJiu",
		pic1 = "res_icon_60.png",
		color = var_0_2
	},
	{
		pic2 = "xhj.jpg",
		txtId = 136512,
		pic1 = "res_icon_66.png",
		color = var_0_6
	}
}
local var_0_8 = class("HeroDrink", function()
	return createBaseLayer()
end)
local var_0_9 = {
	bg = {
		xcenter = 0,
		name = "bgyanhua",
		type = "pic",
		ycenter = -23,
		pic = "res/ui/playerInfo/invite/bg.jpg",
		children = {
			{
				fontSize = 25,
				name = "leftTime",
				type = "label",
				ycenter = 205,
				x = 710,
				font = "Thonburi-Bold",
				anchorPoint = ccp(0, 0),
				color = ccc3(253, 98, 98)
			},
			{
				xcenter = 0,
				z = 400,
				type = "pic",
				ycenter = 215,
				pic = "res/ui/activity/generalDrink/zjlyx_title.png"
			},
			{
				xcenter = 0,
				name = "middlePanel",
				z = 200,
				type = "pic",
				ycenter = 137,
				pic = "res/ui/activity/generalDrink/zjlyx_zy_pb_bg.png",
				children = {
					{
						xcenter = -410,
						z = 300,
						type = "pic",
						ycenter = 3,
						pic = "res/ui/activity/generalDrink/zjlyx_icon_zy.png"
					},
					{
						xcenter = 0,
						z = 300,
						type = "pic",
						ycenter = 0,
						pic = "res/ui/activity/generalDrink/zjlyx_zy_pb_d.png",
						children = {
							{
								x = 0,
								name = "processBar",
								anchorPointX = 0,
								type = "process",
								ycenter = 0,
								anchorPointY = 0.5,
								pic = "res/ui/activity/generalDrink/zjlyx_zy_pb.png",
								percentage = 0
							},
							{
								fontSize = 24,
								name = "processName",
								text = "0/0",
								type = "label",
								ycenter = 10,
								xcenter = -410
							}
						}
					},
					{
						x = 334,
						name = "juexingIcon1",
						z = 300,
						type = "pic",
						ycenter = 3,
						pic = "res/ui/activity/generalDrink/zjlyx_pb_icon_g.png",
						children = {
							{
								pic = "",
								name = "light1",
								x = 37,
								type = "pic",
								y = 35,
								scale = 0.6
							},
							{
								fontSize = 24,
								name = "num1",
								text = "0",
								type = "label",
								y = 20,
								x = 35
							}
						}
					},
					{
						x = 574,
						name = "juexingIcon2",
						z = 300,
						type = "pic",
						ycenter = 3,
						pic = "res/ui/activity/generalDrink/zjlyx_pb_icon_jiu.png",
						children = {
							{
								pic = "",
								name = "light2",
								x = 37,
								type = "pic",
								y = 35,
								scale = 0.6
							},
							{
								fontSize = 24,
								name = "num2",
								text = "0",
								type = "label",
								y = 20,
								x = 35
							}
						}
					},
					{
						x = 814,
						name = "juexingIcon3",
						z = 300,
						type = "pic",
						ycenter = 3,
						pic = "res/ui/activity/generalDrink/zjlyx_icon_zsms.png",
						children = {
							{
								pic = "",
								name = "light3",
								x = 37,
								type = "pic",
								y = 35,
								scale = 0.6
							},
							{
								fontSize = 24,
								name = "num3",
								text = "0",
								type = "label",
								y = 20,
								x = 35
							}
						}
					}
				}
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "frame:btnTip_c.png",
						name = "helpButton",
						pic1 = "frame:btnTip_a.png",
						y = 500,
						x = 885
					}
				}
			},
			{
				xcenter = 0,
				name = "DownPanel",
				z = 100,
				type = "pic",
				ycenter = -60,
				pic = "res/ui/activity/generalDrink/zjlyx_bg.jpg",
				children = {
					{
						x = 140,
						name = "buyDrinkBg",
						y = 309,
						type = "pic",
						z = 150,
						pic = "res/ui/activity/generalDrink/zjlyx_jtshuliang_d.png",
						children = {
							{
								x = 20,
								y = 30,
								pic = "res/ui/activity/generalDrink/zjlyx_jt.png",
								type = "pic"
							},
							{
								fontSize = 24,
								name = "beerNum",
								text = "0",
								type = "label",
								y = 30,
								x = 84
							},
							{
								type = "button",
								buttons = {
									{
										pic2 = "res/ui/activity/card/yxhd_btn_add_c.png",
										name = "addDrinkButton",
										pic1 = "res/ui/activity/card/yxhd_btn_add.png",
										y = 30,
										x = 142
									}
								}
							},
							{
								x = 180,
								y = 30,
								pic = "frame:res_icon_19_small.png",
								type = "pic"
							},
							{
								fontSize = 20,
								name = "goldNum",
								text = "200",
								type = "label",
								y = 32,
								x = 214,
								color = ccc3(255, 248, 197)
							}
						}
					},
					{
						x = 255,
						name = "peopleLeft",
						y = 169,
						type = "pic",
						scale = 0.6,
						z = 1,
						pic = "res/ui/common/playerPic/player1.png"
					},
					{
						x = 79,
						name = "BeerLeft",
						y = 230,
						type = "pic",
						pic = "res/ui/activity/generalDrink/zjlyx_j_d.png",
						children = {
							{
								x = 50,
								name = "BeerLeftIcon",
								y = 48,
								type = "pic",
								pic = "frame:res_icon_58.png",
								children = {
									{
										fontSize = 20,
										name = "BeerLeftName",
										type = "label",
										y = 10,
										x = 28,
										text = language.get("222106_juexingJiu")
									}
								}
							}
						}
					},
					{
						x = 700,
						name = "peopleRight",
						y = 169,
						type = "pic",
						scale = 0.6,
						z = 1,
						pic = "res/ui/common/playerPic/player1.png"
					},
					{
						fontSize = 24,
						name = "peopleNameRight",
						text = "",
						type = "label",
						y = 270,
						x = 700
					},
					{
						x = 800,
						name = "BeerRight",
						y = 230,
						type = "pic",
						rotate = 180,
						pic = "res/ui/activity/generalDrink/zjlyx_j_d.png",
						children = {
							{
								x = 50,
								name = "BeerRightIcon",
								y = 48,
								type = "pic",
								rotate = 180,
								pic = "frame:res_icon_58.png",
								children = {
									{
										fontSize = 20,
										name = "BeerRightName",
										type = "label",
										y = 10,
										x = 28,
										text = language.get("222106_juexingJiu")
									}
								}
							}
						}
					},
					{
						xcenter = 0,
						name = "centerWord",
						type = "pic",
						ycenter = 0,
						pic = "res/ui/activity/generalDrink/zjlyx_word_02.png"
					},
					{
						xcenter = 0,
						name = "xiangjianhengwan",
						type = "pic",
						ycenter = 70,
						pic = "res/ui/activity/generalDrink/zjlyx_word_xjhw.png"
					},
					{
						fontSize = 24,
						name = "endWord",
						type = "label",
						ycenter = -35,
						xcenter = 40,
						text = language.get("222113_juexingJiu")
					},
					{
						xcenter = -90,
						name = "gou",
						type = "pic",
						ycenter = -85,
						pic = "res/ui/playerInfo/setting/unite_view_on.png"
					},
					{
						fontSize = 22,
						name = "wordXiangtongMeijiu",
						type = "label",
						ycenter = -85,
						xcenter = 20,
						text = language.get("222112_juexingJiu")
					},
					{
						type = "button",
						buttons = {
							{
								pic2 = "res/ui/common/button/sdyjs_btn_04_c.png",
								name = "kaishiButton",
								pic1 = "res/ui/common/button/sdyjs_btn_04.png",
								y = 30,
								z = 100,
								x = 454
							}
						}
					},
					{
						fontSize = 22,
						name = "kaishiButtonName",
						type = "label",
						ycenter = -130,
						xcenter = 0,
						z = 101,
						text = language.get("222111_juexingJiu")
					},
					{
						type = "button",
						buttons = {
							{
								pic2 = "res/ui/common/button/sdyjs_btn_01_c.png",
								name = "yaoqinButton",
								pic1 = "res/ui/common/button/sdyjs_btn_01.png",
								y = 30,
								z = 100,
								x = 784
							}
						}
					},
					{
						fontSize = 22,
						name = "yaoqinButtonName",
						type = "label",
						ycenter = -130,
						xcenter = 355,
						z = 101,
						text = language.get("222110_juexingJiu"),
						children = {
							{
								x = -90,
								name = "yaoqinIcon",
								type = "pic",
								ycenter = -5,
								pic = "frame:res_icon_19_small.png"
							},
							{
								fontSize = 22,
								name = "yaoqinNum",
								text = "10",
								type = "label",
								ycenter = -20,
								x = -90
							}
						}
					},
					{
						type = "button",
						buttons = {
							{
								pic2 = "res/ui/common/button/public_btn_red_c.png",
								name = "leftButton",
								pic1 = "res/ui/common/button/public_btn_red.png",
								y = 30,
								z = 100,
								x = 354
							}
						}
					},
					{
						fontSize = 22,
						name = "leftButtonName",
						type = "label",
						ycenter = -130,
						xcenter = -100,
						z = 101,
						text = language.get("222115_juexingJiu")
					},
					{
						type = "button",
						buttons = {
							{
								pic2 = "res/ui/common/button/public_btn_green_c.png",
								name = "rightButton",
								pic1 = "res/ui/common/button/public_btn_green.png",
								y = 30,
								z = 100,
								x = 554
							}
						}
					},
					{
						fontSize = 22,
						name = "rightButtonName",
						type = "label",
						ycenter = -130,
						xcenter = 100,
						z = 101,
						text = language.get("222114_juexingJiu")
					},
					{
						x = 783,
						name = "yanhuilist",
						y = 197,
						type = "pic",
						pic = "res/ui/activity/generalDrink/zjlyx_yxlb_d.png",
						children = {
							{
								xcenter = 0,
								name = "yaoqinIcon",
								type = "pic",
								ycenter = 115,
								pic = "res/ui/activity/generalDrink/zjlyx_word_yxlb.png"
							},
							{
								xcenter = 0,
								name = "noPeople",
								type = "pic",
								ycenter = -20,
								pic = "res/ui/activity/generalDrink/zjlyx_word_dqwrjbyx.png"
							}
						}
					},
					{
						x = 465,
						name = "tableIcon",
						y = 60,
						type = "pic",
						z = 2,
						pic = "res/ui/activity/generalDrink/zjlyx_zhuozi.png"
					},
					{
						xcenter = 0,
						name = "juexingjiu",
						z = 100,
						type = "pic",
						ycenter = -40,
						pic = "res/ui/activity/generalDrink/jxj_2.png"
					}
				}
			},
			{
				xcenter = 0,
				name = "DownPanel",
				type = "pic",
				ycenter = -228,
				pic = "res/ui/activity/generalDrink/zjlyx_line.png"
			}
		}
	}
}
local var_0_10 = 0
local var_0_11 = 1
local var_0_12 = -1

function var_0_8.ctor(arg_2_0, arg_2_1, arg_2_2)
	rmgr.loadResource("res/anim/weapon/itemLightBig.plist")

	if arg_2_2 then
		arg_2_0.data = arg_2_2
	else
		return
	end

	arg_2_0.countTime = 0
	arg_2_0.hejiuTime = 0
	arg_2_0.view = {}
	arg_2_0.view = autoUI.initUI(arg_2_0, var_0_9)

	arg_2_1:addChild(arg_2_0)

	local var_2_0 = CCArray:create()

	var_2_0:addObject(CCFadeOut:create(0.3))
	var_2_0:addObject(CCFadeIn:create(0.3))
	var_2_0:addObject(CCDelayTime:create(0.2))

	local var_2_1 = CCSequence:create(var_2_0)

	arg_2_0.view.juexingjiu:runAction(CCRepeatForever:create(var_2_1))

	for iter_2_0 = 1, 3 do
		local var_2_2 = CCSprite:create()

		var_2_2:setScale(0.6)
		var_2_2:setPosition(ccp(37, 35))

		local var_2_3 = CCArray:create()

		for iter_2_1 = 1, 32 do
			local var_2_4 = CCSprite:createWithSpriteFrameName("itemLightBig_" .. iter_2_1 .. ".png")

			var_2_3:addObject(var_2_4:displayFrame())
		end

		local var_2_5 = CCAnimation:createWithSpriteFrames(var_2_3, 0.04)
		local var_2_6 = CCAnimate:create(var_2_5)

		arg_2_0.view["light" .. iter_2_0]:runAction(CCRepeatForever:create(var_2_6))
	end

	local function var_2_7(arg_3_0)
		if arg_3_0.action.data then
			arg_2_0:refresh()
		end
	end

	local var_2_8 = CCArray:create()

	var_2_8:addObject(CCFadeIn:create(0.3))
	var_2_8:addObject(CCDelayTime:create(0.4))
	var_2_8:addObject(CCFadeOut:create(0.3))

	local var_2_9 = CCRepeatForever:create(CCSequence:create(var_2_8))

	arg_2_0.view.xiangjianhengwan:runAction(var_2_9)
	arg_2_0.view.addDrinkButton:registerScriptTapHandler(function()
		messageBox.showChargeWinWithData(language.get(10003), language.get("222109_juexingJiu", arg_2_0.data.buyGold), "heroBuyDrink", function()
			cmgr.sendRequest(var_2_7, actions.buyDrink)
		end)
	end)
	arg_2_0.view.kaishiButton:registerScriptTapHandler(function()
		cmgr.sendRequest(var_2_7, actions.junket)
	end)
	arg_2_0.view.yaoqinButton:registerScriptTapHandler(function()
		if arg_2_0.data.state == 3 then
			local function var_7_0(arg_8_0)
				if arg_8_0.action.data then
					local var_8_0 = arg_8_0.action.data

					arg_2_0:showEffectBaoji(var_8_0.baoji)

					local var_8_1 = {}

					for iter_8_0 = 1, #var_8_0.rewards do
						var_8_1[iter_8_0] = {}
						var_8_1[iter_8_0].id = var_8_0.rewards[iter_8_0].type
						var_8_1[iter_8_0].value = var_8_0.rewards[iter_8_0].value
					end

					globalAction_gotResource(var_8_1)
					messageBox.showChargeWinWithData(language.get(10003), language.get("222118_juexingJiu", arg_2_0.data.drinkAloneGold), "heroDrinkAlone", function()
						cmgr.sendRequest(var_2_7, actions.drinkAlone)
					end)
				end
			end

			cmgr.sendRequest(var_7_0, actions.getAdditionDrink2, 0)
		else
			messageBox.showChargeWinWithData(language.get(10003), language.get("222118_juexingJiu", arg_2_0.data.drinkAloneGold), "heroDrinkAlone", function()
				cmgr.sendRequest(var_2_7, actions.drinkAlone)
			end)
		end
	end)
	arg_2_0.view.leftButton:registerScriptTapHandler(function()
		cmgr.sendRequest(var_2_7, actions.farewell)
	end)
	arg_2_0.view.rightButton:registerScriptTapHandler(function()
		cmgr.sendRequest(var_2_7, actions.drinkTogether)
	end)
	arg_2_0.view.helpButton:registerScriptTapHandler(function()
		arg_2_0:showTips()
	end)

	local var_2_10 = CCMenu:create()

	var_2_10:setPosition(0, 0)
	arg_2_0.view.DownPanel:addChild(var_2_10)

	local var_2_11 = CCLabelTTF:create(language.get(136521), "", 25)

	var_2_11:setColor(ccc3(0, 255, 0))

	local var_2_12 = CCMenuItemLabel:create(var_2_11)

	var_2_12:setPosition(454.5, 136)
	var_2_10:addChild(var_2_12)
	var_2_12:registerScriptTapHandler(function()
		log.info("kick cityButton")

		if arg_2_0.data and arg_2_0.data.cityId and arg_2_0.data.cityId > 0 then
			smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
			loadingLayer.show(SCENE_WORLD, arg_2_0.data.cityId)
		end
	end)

	arg_2_0.view.cityButton = var_2_12

	arg_2_0:setVisibleState(arg_2_0.data)
	arg_2_0:setData(arg_2_0.data)
	arg_2_0:updateYanhuiListLayer(arg_2_0.data.feasts)

	arg_2_0.leftTime = arg_2_0.view.leftTime
	var_0_10 = arg_2_0.data.drinkNum
	var_0_12 = arg_2_0.data.otherDrinkType or -1
	var_0_11 = arg_2_0.data.drinkType
end

function var_0_8.showEffectBaoji(arg_15_0, arg_15_1)
	if arg_15_1 == 2 or arg_15_1 == 4 or arg_15_1 == 10 then
		local var_15_0 = "res/ui/activity/ironReward/js_bj_" .. arg_15_1 .. ".png"
		local var_15_1 = CCSprite:create(var_15_0)

		var_15_1:setPosition(454.5, 196)
		arg_15_0.view.DownPanel:addChild(var_15_1, 200)

		local var_15_2 = CCArray:create()

		var_15_2:addObject(CCDelayTime:create(1))
		var_15_2:addObject(CCFadeOut:create(0.4))
		var_15_2:addObject(CCCallFunc:create(function()
			var_15_1:removeFromParentAndCleanup(true)
		end))

		local var_15_3 = CCSequence:create(var_15_2)

		var_15_1:runAction(var_15_3)
	end
end

function var_0_8.allVisibleFalse(arg_17_0)
	arg_17_0.view.buyDrinkBg:setVisible(false)
	arg_17_0.view.peopleLeft:setVisible(false)
	arg_17_0.view.BeerLeft:setVisible(false)
	arg_17_0.view.peopleRight:setVisible(false)
	arg_17_0.view.BeerRight:setVisible(false)
	arg_17_0.view.peopleNameRight:setVisible(false)
	arg_17_0.view.centerWord:setVisible(false)
	arg_17_0.view.endWord:setVisible(false)
	arg_17_0.view.xiangjianhengwan:setVisible(false)
	arg_17_0.view.gou:setVisible(false)
	arg_17_0.view.wordXiangtongMeijiu:setVisible(false)
	arg_17_0.view.kaishiButton:setVisible(false)
	arg_17_0.view.kaishiButtonName:setVisible(false)
	arg_17_0.view.yaoqinButton:setVisible(false)
	arg_17_0.view.yaoqinButtonName:setVisible(false)
	arg_17_0.view.leftButton:setVisible(false)
	arg_17_0.view.leftButtonName:setVisible(false)
	arg_17_0.view.rightButton:setVisible(false)
	arg_17_0.view.rightButtonName:setVisible(false)
	arg_17_0.view.yanhuilist:setVisible(false)
	arg_17_0.view.noPeople:setVisible(false)
	arg_17_0.view.juexingjiu:setVisible(false)
end

function var_0_8.setVisibleState(arg_18_0, arg_18_1)
	arg_18_0:allVisibleFalse()
	arg_18_0.view.cityButton:setVisible(arg_18_1.state == 0 and arg_18_1.drinkNum == 0 and arg_18_1.cityId ~= nil and arg_18_1.cityId > 0)

	if arg_18_1.state == 0 or arg_18_1.state == 3 then
		if arg_18_1.drinkNum == 0 then
			arg_18_0.view.buyDrinkBg:setVisible(true)
			arg_18_0.view.centerWord:setVisible(true)
		else
			arg_18_0.view.buyDrinkBg:setVisible(true)
			arg_18_0.view.peopleLeft:setVisible(true)
			arg_18_0.view.BeerLeft:setVisible(true)
			arg_18_0.view.gou:setVisible(true)
			arg_18_0.view.wordXiangtongMeijiu:setVisible(true)
			arg_18_0.view.kaishiButton:setVisible(true)
			arg_18_0.view.kaishiButtonName:setVisible(true)
			arg_18_0.view.yaoqinButton:setVisible(true)
			arg_18_0.view.yaoqinButtonName:setVisible(true)
			arg_18_0.view.yanhuilist:setVisible(true)
		end

		if arg_18_1.state == 3 then
			arg_18_0.view.juexingjiu:setVisible(true)
		end

		if arg_18_1.feasts and #arg_18_1.feasts <= 0 then
			arg_18_0.view.noPeople:setVisible(true)
		end
	elseif arg_18_1.state == 1 then
		arg_18_0.view.buyDrinkBg:setVisible(true)
		arg_18_0.view.peopleLeft:setVisible(true)
		arg_18_0.view.BeerLeft:setVisible(true)
		arg_18_0.view.leftButton:setVisible(true)
		arg_18_0.view.leftButtonName:setVisible(true)
		arg_18_0.view.rightButton:setVisible(true)
		arg_18_0.view.rightButtonName:setVisible(true)
		arg_18_0.view.centerWord:setVisible(true)
		arg_18_0.view.endWord:setVisible(true)

		if arg_18_1.additionsState == 1 then
			-- block empty
		else
			arg_18_0.view.peopleRight:setVisible(true)
			arg_18_0.view.BeerRight:setVisible(true)
		end

		if arg_18_1.drinkType and arg_18_1.otherDrinkType and arg_18_1.drinkType == arg_18_1.otherDrinkType then
			arg_18_0.view.xiangjianhengwan:setVisible(true)
		end
	elseif arg_18_1.state == 2 then
		arg_18_0.view.buyDrinkBg:setVisible(true)
		arg_18_0.view.peopleLeft:setVisible(true)
		arg_18_0.view.BeerLeft:setVisible(true)
		arg_18_0.view.peopleRight:setVisible(true)
		arg_18_0.view.BeerRight:setVisible(true)
		arg_18_0.view.peopleNameRight:setVisible(true)
		arg_18_0.view.leftButton:setVisible(true)
		arg_18_0.view.leftButtonName:setVisible(true)
		arg_18_0.view.rightButton:setVisible(true)
		arg_18_0.view.rightButtonName:setVisible(true)
		arg_18_0.view.centerWord:setVisible(true)
		arg_18_0.view.endWord:setVisible(true)

		if arg_18_1.drinkType and arg_18_1.otherDrinkType and arg_18_1.drinkType == arg_18_1.otherDrinkType then
			arg_18_0.view.xiangjianhengwan:setVisible(true)
		end
	else
		log.info("煮酒论英雄： nothing to do!")
	end
end

function var_0_8.setData(arg_19_0, arg_19_1)
	if arg_19_1.zuiyi and arg_19_1.zuiyis then
		local var_19_0 = 0
		local var_19_1 = #arg_19_1.zuiyis

		for iter_19_0, iter_19_1 in ipairs(arg_19_1.zuiyis) do
			local var_19_2 = arg_19_1.zuiyi >= iter_19_1.zuiyi

			if var_19_2 then
				var_19_0 = var_19_0 + 100 / var_19_1
			else
				local var_19_3 = iter_19_0 == 1 and 0 or arg_19_1.zuiyis[iter_19_0 - 1].zuiyi

				if var_19_3 <= arg_19_1.zuiyi then
					var_19_0 = var_19_0 + 100 / var_19_1 * (arg_19_1.zuiyi - var_19_3) / (iter_19_1.zuiyi - var_19_3)
				end
			end

			if iter_19_0 == 2 then
				var_19_2 = var_19_2 and iter_19_1.received == 0
			elseif iter_19_0 ~= 3 or arg_19_0.data.zglJxStatus == 0 or arg_19_0.data.zglJxStatus == 1 then
				-- block empty
			else
				var_19_2 = var_19_2 and iter_19_1.received == 0
			end

			local var_19_4 = var_0_0[iter_19_0][var_19_2 and 2 or 1]

			arg_19_0.view["juexingIcon" .. iter_19_0]:setDisplayFrame(CCSprite:create("res/ui/activity/generalDrink/" .. var_19_4):displayFrame())
			arg_19_0.view["light" .. iter_19_0]:setVisible(var_19_2)
			arg_19_0.view["num" .. iter_19_0]:setString(iter_19_1.zuiyi)
		end

		arg_19_0.view.processBar:setPercentage(var_19_0)
		arg_19_0.view.processName:setString(arg_19_1.zuiyi .. "/" .. arg_19_1.zuiyis[#arg_19_1.zuiyis].zuiyi)
	end

	if arg_19_1.drinkNum then
		arg_19_0.view.beerNum:setString(arg_19_1.drinkNum)
	end

	if arg_19_1.buyGold then
		arg_19_0.view.goldNum:setString(arg_19_1.buyGold)
	end

	if arg_19_1.drinkType then
		local var_19_5 = var_0_7[arg_19_1.drinkType]

		if var_19_5 then
			arg_19_0.view.BeerLeftIcon:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_19_5.pic1))
			arg_19_0.view.BeerLeftName:setString(language.get(var_19_5.txtId))
			arg_19_0.view.BeerLeftName:setColor(var_19_5.color)
		end
	end

	arg_19_0.view.peopleLeft:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerPic/player%d.png", user.player.pic)):displayFrame())

	if arg_19_1.otherPlayerName then
		arg_19_0.view.peopleNameRight:setString(arg_19_1.otherPlayerName)
	end

	if arg_19_1.otherPic then
		arg_19_0.view.peopleRight:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerPic/player%d.png", arg_19_1.otherPic)):displayFrame())
		arg_19_0.view.peopleRight:setScale(0.6)
		arg_19_0.view.peopleRight:setPosition(ccp(700, 169))
	end

	if arg_19_1.otherDrinkType then
		local var_19_6 = var_0_7[arg_19_1.otherDrinkType]

		if var_19_6 then
			arg_19_0.view.BeerRightIcon:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_19_6.pic1))
			arg_19_0.view.BeerRightName:setString(language.get(var_19_6.txtId))
			arg_19_0.view.BeerRightName:setColor(var_19_6.color)
		end
	end

	if arg_19_1.drinkAloneGold then
		arg_19_0.view.yaoqinNum:setString(arg_19_1.drinkAloneGold)
	end

	if arg_19_1.autoDrink then
		if arg_19_1.autoDrink == 1 then
			arg_19_0.view.gou:setDisplayFrame(CCSprite:create("res/ui/playerInfo/setting/unite_view_on.png"):displayFrame())
		else
			arg_19_0.view.gou:setDisplayFrame(CCSprite:create("res/ui/playerInfo/setting/unite_view_a.png"):displayFrame())
		end
	end

	if arg_19_1.drinkCd and arg_19_1.drinkCd > 0 then
		local function var_19_7()
			arg_19_0.timer:removeFromParentAndCleanup(true)
			arg_19_0:refresh()
		end

		arg_19_0.timer = createTimerLabel(arg_19_1.drinkCd, "@M:@S", "Thonburi", 22, var_19_7, nil, nil, colorTips.red)

		arg_19_0.timer:setPosition(ccp(-90, 0))
		arg_19_0.view.endWord:removeChildByTag(101, true)
		arg_19_0.view.endWord:addChild(arg_19_0.timer, 1, 101)
	end

	if arg_19_1.state == 1 then
		arg_19_0.view.leftButtonName:setString(language.get("222115_juexingJiu"))
		arg_19_0.view.rightButtonName:setString(language.get("222114_juexingJiu"))
	elseif arg_19_1.state == 2 then
		arg_19_0.view.leftButtonName:setString(language.get("222117_juexingJiu"))
		arg_19_0.view.rightButtonName:setString(language.get("222116_juexingJiu"))
	end

	if arg_19_1.state == 0 then
		if arg_19_1.drinkNum == 0 then
			arg_19_0.view.centerWord:setDisplayFrame(CCSprite:create("res/ui/activity/generalDrink/zjlyx_word_02.png"):displayFrame())
		end
	elseif arg_19_1.state == 1 then
		if arg_19_1.additionsState == 1 then
			arg_19_0.view.centerWord:setDisplayFrame(CCSprite:create("res/ui/activity/generalDrink/zjlyx_word_06.png"):displayFrame())
		elseif arg_19_1.additionsState == 2 or arg_19_1.additionsState == 4 then
			arg_19_0.view.centerWord:setDisplayFrame(CCSprite:create("res/ui/activity/generalDrink/zjlyx_word_03.png"):displayFrame())
		else
			arg_19_0.view.centerWord:setDisplayFrame(CCSprite:create("res/ui/activity/generalDrink/zjlyx_word_05.png"):displayFrame())
		end
	elseif arg_19_1.state == 2 then
		if arg_19_1.additionsState == 1 then
			arg_19_0.view.centerWord:setDisplayFrame(CCSprite:create("res/ui/activity/generalDrink/zjlyx_word_06.png"):displayFrame())
		elseif arg_19_1.additionsState == 2 or arg_19_1.additionsState == 4 then
			arg_19_0.view.centerWord:setDisplayFrame(CCSprite:create("res/ui/activity/generalDrink/zjlyx_word_01.png"):displayFrame())
		else
			arg_19_0.view.centerWord:setDisplayFrame(CCSprite:create("res/ui/activity/generalDrink/zjlyx_word_04.png"):displayFrame())
		end
	end
end

function var_0_8.onEnter(arg_21_0)
	arg_21_0.touchBeganRef = handler(arg_21_0, arg_21_0.onTouchBegan)
	arg_21_0.touchMovedRef = handler(arg_21_0, arg_21_0.onTouchMoved)
	arg_21_0.touchEndedRef = handler(arg_21_0, arg_21_0.onTouchEnded)
	arg_21_0.touchCancelledRef = handler(arg_21_0, arg_21_0.onTouchCancelled)
	arg_21_0.refreshRef = handler(arg_21_0, arg_21_0.refresh)

	eventManager.registerEvent("globalOnTouchBegan", arg_21_0.touchBeganRef)
	eventManager.registerEvent("globalOnTouchMoved", arg_21_0.touchMovedRef)
	eventManager.registerEvent("globalOnTouchEnded", arg_21_0.touchEndedRef)
	eventManager.registerEvent("globalOnTouchCancelled", arg_21_0.touchCancelledRef)
	eventManager.registerEvent("HeroDrinkRefresh", arg_21_0.refreshRef)

	arg_21_0.drinkScheduler = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_21_0, arg_21_0.checkRefresh), 0.2, false)
end

function var_0_8.onExit(arg_22_0)
	eventManager.unregisterEvent("globalOnTouchBegan", arg_22_0.touchBeganRef)
	eventManager.unregisterEvent("globalOnTouchMoved", arg_22_0.touchMovedRef)
	eventManager.unregisterEvent("globalOnTouchEnded", arg_22_0.touchEndedRef)
	eventManager.unregisterEvent("globalOnTouchCancelled", arg_22_0.touchCancelledRef)
	eventManager.unregisterEvent("HeroDrinkRefresh", arg_22_0.refreshRef)

	if arg_22_0.drinkScheduler then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_22_0.drinkScheduler)
	end
end

function var_0_8.checkRefresh(arg_23_0)
	log.info("1111")

	if arg_23_0.countTime % 25 == 0 and arg_23_0.hejiuTime < arg_23_0.countTime - 8 then
		arg_23_0:refresh()
	end

	if arg_23_0.hejiuTime == arg_23_0.countTime - 9 then
		arg_23_0:refresh()
	end

	arg_23_0.countTime = arg_23_0.countTime + 1
end

function var_0_8.refresh(arg_24_0)
	local function var_24_0(arg_25_0)
		if arg_25_0.action.data then
			arg_24_0.data = arg_25_0.action.data

			table.sort(arg_24_0.data.zuiyis, function(arg_26_0, arg_26_1)
				return arg_26_0.id < arg_26_1.id
			end)

			if arg_24_0.data.drinkNum < var_0_10 then
				arg_24_0:showDrinkWord()
				arg_24_0:showDrinkPeopleAnimation()

				arg_24_0.hejiuTime = arg_24_0.countTime
			else
				arg_24_0:setVisibleState(arg_24_0.data)
				arg_24_0:setData(arg_24_0.data)
				arg_24_0:updateYanhuiListLayer(arg_24_0.data.feasts)
			end

			var_0_10 = arg_24_0.data.drinkNum
			var_0_12 = arg_24_0.data.otherDrinkType or -1
			var_0_11 = arg_24_0.data.drinkType
		end
	end

	cmgr.sendRequest(var_24_0, actions.getHeroDrinkInfo2)
end

function var_0_8.onTouchBegan(arg_27_0, arg_27_1, arg_27_2)
	local function var_27_0(arg_28_0)
		local function var_28_0(arg_29_0)
			if arg_29_0.action.data then
				local var_29_0 = arg_29_0.action.data

				arg_27_0:showEffectBaoji(var_29_0.baoji)

				if var_29_0.rewards then
					local var_29_1 = {}

					for iter_29_0, iter_29_1 in ipairs(var_29_0.rewards) do
						local var_29_2 = {}

						if iter_29_1.type == 141 then
							var_29_2.id = 30011
						else
							var_29_2.id = iter_29_1.type
						end

						var_29_2.value = iter_29_1.value

						table.insert(var_29_1, var_29_2)
					end

					globalAction_gotResource(var_29_1)
				end

				arg_27_0:refresh()

				if arg_28_0 == 2 and (arg_27_0.data.zglJxStatus == 0 or arg_27_0.data.zglJxStatus == 1) then
					user.heroEventZglIcon = 1

					notice.control.refreshLayer()
				end
			end
		end

		cmgr.sendRequest(var_28_0, actions.getAdditionDrink2, arg_28_0)
	end

	local function var_27_1(arg_30_0)
		if arg_30_0.action.data then
			arg_27_0:refresh()
		end
	end

	if tool.checkIfTouch(arg_27_0.view.juexingjiu, arg_27_1, arg_27_2) and arg_27_0.view.juexingjiu:isVisible() then
		var_27_0(0)
	end

	if tool.checkIfTouch(arg_27_0.view.gou, arg_27_1, arg_27_2) and arg_27_0.view.gou:isVisible() then
		cmgr.sendRequest(var_27_1, actions.setAutoDrink, 1 - arg_27_0.data.autoDrink)
	end

	if tool.checkIfTouch(arg_27_0.view.juexingIcon1, arg_27_1, arg_27_2) then
		arg_27_0:showBuffTips(1)
	elseif tool.checkIfTouch(arg_27_0.view.juexingIcon2, arg_27_1, arg_27_2) then
		arg_27_0:showBuffTips(2)

		if arg_27_0.data.zuiyis[2] and arg_27_0.data.zuiyi >= arg_27_0.data.zuiyis[2].zuiyi and arg_27_0.data.zuiyis[2].received == 0 then
			var_27_0(1)
		end
	elseif tool.checkIfTouch(arg_27_0.view.juexingIcon3, arg_27_1, arg_27_2) then
		arg_27_0:showBuffTips(3)

		if arg_27_0.data.zuiyis[3] and arg_27_0.data.zuiyi >= arg_27_0.data.zuiyis[3].zuiyi and arg_27_0.data.zuiyis[3].received == 0 then
			var_27_0(2)
		end
	end
end

function var_0_8.onTouchMoved(arg_31_0, arg_31_1, arg_31_2)
	return
end

function var_0_8.onTouchEnded(arg_32_0, arg_32_1, arg_32_2)
	arg_32_0.isTouchOn = false
end

function var_0_8.onTouchCancelled(arg_33_0, arg_33_1, arg_33_2)
	arg_33_0.isTouchOn = false
end

function var_0_8.updateYanhuiListLayer(arg_34_0, arg_34_1)
	if arg_34_0.view.peopleList then
		pcall(arg_34_0.view.peopleList.removeFromParentAndCleanup, arg_34_0.view.peopleList, true)
	end

	arg_34_0.view.peopleList = arg_34_0:createYanhuiListTableView(arg_34_1)

	arg_34_0.view.peopleList:setPosition(2, 2)
	arg_34_0.view.yanhuilist:addChild(arg_34_0.view.peopleList)
end

function var_0_8.showDrinkWord(arg_35_0)
	arg_35_0.view.DownPanel:removeChildByTag(101, true)
	arg_35_0.view.DownPanel:removeChildByTag(102, true)
	arg_35_0.view.DownPanel:removeChildByTag(103, true)

	local var_35_0 = CCSprite:create("res/ui/activity/generalDrink/zjlyx_word_sp_gb.png")

	local function var_35_1()
		var_35_0:removeFromParentAndCleanup(true)
	end

	local function var_35_2()
		var_35_0:setDisplayFrame(CCSprite:create("res/ui/activity/generalDrink/zjlyx_word_sp_jx.png"):displayFrame())
	end

	local var_35_3 = CCArray:create()

	var_35_3:addObject(CCFadeIn:create(0.06))
	var_35_3:addObject(CCDelayTime:create(1))
	var_35_3:addObject(CCFadeOut:create(0.06))
	var_35_3:addObject(CCCallFuncN:create(var_35_2))
	var_35_3:addObject(CCFadeIn:create(0.06))
	var_35_3:addObject(CCDelayTime:create(1))
	var_35_3:addObject(CCFadeOut:create(0.06))
	var_35_3:addObject(CCCallFuncN:create(var_35_1))
	var_35_0:runAction(CCSequence:create(var_35_3))
	var_35_0:setPosition(454, 300)
	arg_35_0.view.DownPanel:addChild(var_35_0, 100, 101)

	local var_35_4 = {
		ccp(329, 200),
		ccp(579, 200)
	}
	local var_35_5 = 90

	for iter_35_0 = 1, 2 do
		local var_35_6 = CCSprite:create("res/ui/activity/generalDrink/zjlyx_wan.png")

		var_35_6:setVisible(false)
		var_35_6:stopAllActions()
		var_35_6:setOpacity(255)
		var_35_6:setPosition(var_35_4[iter_35_0])
		var_35_6:setVisible(true)

		local var_35_7 = CCEaseElasticOut:create(CCMoveBy:create(0.8, ccp(var_35_5 * (iter_35_0 == 1 and 1 or -1), 0)), 0.8)
		local var_35_8 = CCFadeOut:create(0.5)
		local var_35_9 = CCMoveBy:create(0.5, ccp(var_35_5 * (iter_35_0 == 1 and -1 or 1), 0))
		local var_35_10 = CCArray:create()

		var_35_10:addObject(var_35_7)
		var_35_10:addObject((CCSpawn:createWithTwoActions(var_35_8, var_35_9)))
		var_35_10:addObject(CCCallFuncN:create(function()
			var_35_6:removeFromParentAndCleanup(true)
		end))

		local var_35_11 = CCSequence:create(var_35_10)

		var_35_6:runAction(var_35_11)
		arg_35_0.view.DownPanel:addChild(var_35_6, 100, 101 + iter_35_0)
	end
end

function var_0_8.showDrinkPeopleAnimation(arg_39_0)
	arg_39_0:allVisibleFalse()
	arg_39_0.view.peopleLeft:setVisible(true)
	arg_39_0.view.BeerLeft:setVisible(true)
	arg_39_0.view.peopleRight:setVisible(true)
	arg_39_0.view.BeerRight:setVisible(true)
	arg_39_0.view.yaoqinButtonName:setVisible(true)
	arg_39_0.view.yaoqinButton:setVisible(true)

	if var_0_12 == -1 then
		arg_39_0.view.peopleRight:setDisplayFrame(CCSprite:create("res/ui/common/halfPic/halfPic_zhugeliang.png"):displayFrame())
		arg_39_0.view.peopleRight:setScale(1.05)
		arg_39_0.view.peopleRight:setPosition(ccp(700, 159))

		local var_39_0 = var_0_7[var_0_11]

		if var_39_0 then
			arg_39_0.view.BeerRightIcon:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_39_0.pic1))
			arg_39_0.view.BeerRightName:setString(language.get(var_39_0.txtId))
			arg_39_0.view.BeerRightName:setColor(var_39_0.color)
		end
	end
end

function var_0_8.createYanhuiListTableView(arg_40_0, arg_40_1)
	local var_40_0 = CCTableView:create(CCSizeMake(238, 230))

	var_40_0:setDirection(kCCScrollViewDirectionVertical)
	var_40_0:setVerticalFillOrder(kCCTableViewFillTopDown)

	local function var_40_1(arg_41_0, arg_41_1)
		local var_41_0 = arg_41_1:getChildByTag(101)

		if var_41_0 then
			var_41_0:setVisible(true)
		end
	end

	local function var_40_2(arg_42_0, arg_42_1)
		local var_42_0 = arg_42_1:getChildByTag(101)

		if var_42_0 then
			var_42_0:setVisible(false)
		end
	end

	local function var_40_3(arg_43_0, arg_43_1)
		local var_43_0 = arg_40_1[arg_43_1:getIdx() + 1]

		if var_43_0.playerId then
			log.info(var_43_0.playerId)

			local function var_43_1(arg_44_0)
				if arg_44_0.action.data then
					arg_40_0:refresh()
				end
			end

			cmgr.sendRequest(var_43_1, actions.banquet, var_43_0.playerId)
		end
	end

	local function var_40_4(arg_45_0, arg_45_1)
		return 78, 236
	end

	local function var_40_5(arg_46_0, arg_46_1)
		local var_46_0 = arg_40_1[arg_46_1 + 1]
		local var_46_1 = arg_46_0:dequeueCell()

		if var_46_1 then
			var_46_1:removeAllChildrenWithCleanup(true)
		else
			var_46_1 = CCTableViewCell:new()
		end

		local var_46_2 = CCSprite:create(string.format("res/ui/activity/generalDrink/zjlyx_yxlb_%s.png", arg_46_1 % 2 + 1))

		var_46_2:setAnchorPoint(CCPointMake(0, 0))
		var_46_2:setPosition(CCPointMake(3, 0))

		local var_46_3 = autoUI.createUI(var_46_2, getYanhuiListInfoCellData(var_46_0), nil)

		var_46_1:addChild(var_46_2)

		local var_46_4 = CCSprite:create("res/ui/activity/generalDrink/zjlyx_yxlb_c.png")

		var_46_4:setPosition(ccp(118, 39))
		var_46_4:setVisible(false)
		var_46_1:addChild(var_46_4, 100, 101)

		return var_46_1
	end

	local function var_40_6()
		if arg_40_1 then
			return #arg_40_1
		else
			return 0
		end
	end

	var_40_0:registerScriptHandler(var_40_1, CCTableView.kTableCellHighLight)
	var_40_0:registerScriptHandler(var_40_2, CCTableView.kTableCellUnhighLight)
	var_40_0:registerScriptHandler(var_40_3, CCTableView.kTableCellTouched)
	var_40_0:registerScriptHandler(var_40_4, CCTableView.kTableCellSizeForIndex)
	var_40_0:registerScriptHandler(var_40_5, CCTableView.kTableCellSizeAtIndex)
	var_40_0:registerScriptHandler(var_40_6, CCTableView.kNumberOfCellsInTableView)
	var_40_0:reloadData()

	return var_40_0
end

function getYanhuiListInfoCellData(arg_48_0)
	local var_48_0 = var_0_7[arg_48_0.drinkType] or var_0_7[1]
	local var_48_1 = "frame:" .. var_48_0.pic2
	local var_48_2 = language.get(var_48_0.txtId)
	local var_48_3 = var_48_0.color

	return {
		height = 78,
		type = "layer_color",
		width = 236,
		color = ccc4(0, 0, 128, 0),
		children = {
			{
				x = 40,
				y = 38,
				type = "pic",
				pic = var_48_1
			},
			{
				fontSize = 22,
				y = 21,
				type = "label",
				x = 140,
				text = var_48_2,
				color = var_48_3
			},
			{
				fontSize = 22,
				y = 57,
				type = "label",
				x = 155,
				text = arg_48_0.playerName,
				color = ccc3(237, 209, 169)
			}
		}
	}
end

function var_0_8.showTips(arg_49_0)
	local var_49_0 = createBaseLayer()

	local function var_49_1(arg_50_0, arg_50_1, arg_50_2)
		if arg_50_0 == CCTOUCHBEGAN then
			-- block empty
		elseif arg_50_0 == CCTOUCHENDED then
			smgr.getLayer("topLayer"):removeChild(var_49_0, true)
		end

		return true
	end

	local var_49_2 = {
		tipsBg = {
			xcenter = 0,
			anchorPointX = 0.5,
			type = "pic_9_tips",
			ycenter = 0,
			pic = "frame:common_tip_frame_small.png",
			anchorPointY = 0.5,
			middleRect = CCRectMake(0, 0, 0, 0),
			preferedSize = CCSizeMake(290, 300),
			content = {
				{
					fontSize = 22,
					type = "label",
					text = language.get(136510),
					color = var_0_1
				}
			}
		}
	}

	autoUI.initUI(var_49_0, var_49_2)
	var_49_0:registerScriptTouchHandler(var_49_1, false, true)
	var_49_0:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_49_0)
	var_49_0:setVisible(true)
end

function var_0_8.showBuffTips(arg_51_0, arg_51_1)
	local var_51_0 = createBaseLayer()

	local function var_51_1(arg_52_0, arg_52_1, arg_52_2)
		if arg_52_0 == CCTOUCHBEGAN then
			-- block empty
		elseif arg_52_0 == CCTOUCHENDED then
			smgr.getLayer("topLayer"):removeChild(var_51_0, true)
		end

		return true
	end

	local var_51_2 = ""
	local var_51_3 = ""
	local var_51_4 = arg_51_0.data.zuiyis[arg_51_1]
	local var_51_5 = stringSplit(stringSplit(var_51_4.rewards, ";")[1], ",")

	if arg_51_1 == 1 then
		var_51_2 = language.get("222143_juexingJiu")
		var_51_3 = language.get("222144_juexingJiu")

		if arg_51_0.data.zuiyi < var_51_4.zuiyi then
			var_51_3 = string.format("%s\n(%s)", var_51_3, language.get(143047))
		end
	elseif arg_51_1 == 2 then
		var_51_2 = language.get("222145_juexingJiu")

		if var_51_4.received == 0 then
			var_51_3 = language.get("222146_juexingJiu", var_51_5[2])
		else
			var_51_3 = language.get(111007)
		end
	elseif arg_51_1 == 3 then
		var_51_2 = language.get(136516)

		if var_51_5[1] == "2302" then
			var_51_3 = language.get("222146_juexingJiu", var_51_5[2])
		elseif var_51_5[1] == "zgl_wine" then
			var_51_3 = language.get("222148_juexingJiu", var_51_5[2])
		end

		if var_51_4.received == 1 then
			var_51_3 = string.format("%s(%s)", var_51_3, language.get(111007))
		end

		if arg_51_0.data.zglJxStatus == 0 or arg_51_0.data.zglJxStatus == 1 then
			var_51_3 = var_51_3 .. language.get(136519, arg_51_0.data.buff3)
		end
	end

	local var_51_6 = {
		tipsBg = {
			xcenter = 200,
			anchorPointX = 0.5,
			type = "pic_9_tips",
			ycenter = 200,
			pic = "frame:common_tip_frame_small.png",
			anchorPointY = 0.5,
			middleRect = CCRectMake(0, 0, 0, 0),
			preferedSize = CCSizeMake(290, 300),
			content = {
				{
					fontSize = 22,
					type = "label",
					text = var_51_2,
					color = var_0_4
				},
				{
					fontSize = 22,
					type = "label",
					text = var_51_3,
					color = var_0_1
				}
			}
		}
	}

	autoUI.initUI(var_51_0, var_51_6)
	var_51_0:registerScriptTouchHandler(var_51_1, false, true)
	var_51_0:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_51_0)
	var_51_0:setVisible(true)
end

return var_0_8
