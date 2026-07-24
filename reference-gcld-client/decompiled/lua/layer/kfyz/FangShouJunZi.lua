local var_0_0 = class("FangShouJunzi", function()
	return createBaseLayer()
end)

var_0_0.layout = {}
var_0_0.layout.bg = {
	xcenter = 0,
	name = "bg",
	type = "pic_9",
	ycenter = -30,
	pic = "frame:bigPanel.png",
	middleRect = CCRectMake(30, 30, 45, 45),
	preferedSize = CCSizeMake(960, 580),
	children = {
		{
			xcenter = 0,
			z = 0,
			type = "pic",
			ycenter = 0,
			pic = "res/ui/comment/bg1.jpg"
		},
		{
			y = 480,
			pic = "res/ui/kfyz/junzi/fsjz_title.png",
			x = 480,
			type = "pic"
		},
		{
			y = 398,
			name = "upBg",
			pic = "res/ui/activity/generalDrink/zjlyx_zy_pb_bg.png",
			type = "pic",
			x = 480,
			children = {
				{
					xcenter = -30,
					name = "processBg",
					type = "pic",
					ycenter = 0,
					pic = "res/ui/activity/generalDrink/zjlyx_zy_pb_d.png",
					children = {
						{
							xcenter = 0,
							name = "process",
							percentage = 100,
							type = "process",
							ycenter = 0,
							pic = "res/ui/activity/generalDrink/zjlyx_zy_pb.png"
						}
					}
				},
				{
					scale = 0.6,
					name = "box",
					pic = "res/ui/activity/fishing/hjcd_box_01.png",
					type = "pic",
					ycenter = 15,
					x = 820,
					children = {}
				},
				{
					fontSize = 24,
					name = "boxNum",
					text = "x100",
					type = "label",
					ycenter = -5,
					x = 820,
					color = colorText[10002]
				},
				{
					xcenter = 0,
					name = "junziWord",
					type = "label",
					ycenter = 0,
					fontSize = 20,
					text = language.get("223904_junzi"),
					color = colorText[10002],
					anchorPoint = ccp(0.5, 0.5)
				}
			}
		},
		{
			y = 219,
			name = "resourcesBg",
			z = 50,
			type = "pic",
			pic = "res/ui/activity/consumeGift/xfshl_bg.png",
			x = 480,
			children = {
				{
					y = 130,
					name = "zhugong",
					pic = "res/ui/common/halfPic/halfPic_caocao.png",
					type = "pic",
					x = 126
				},
				{
					y = 136,
					name = "res1",
					pic = "res/ui/kfyz/junzi/fsjz_icon_bg.png",
					type = "pic",
					x = 382,
					children = {
						{
							xcenter = 0,
							ycenter = 0,
							pic = "frame:liang.jpg",
							type = "pic"
						},
						{
							xcenter = 0,
							type = "pic",
							ycenter = -70,
							pic = "res/ui/kfyz/junzi/fsjz_word_bg.png",
							children = {
								{
									fontSize = 24,
									name = "resNum1",
									text = "100",
									type = "label",
									ycenter = 0,
									xcenter = 0,
									color = colorText[10002]
								}
							}
						}
					}
				},
				{
					y = 136,
					name = "res2",
					pic = "res/ui/kfyz/junzi/fsjz_icon_bg.png",
					type = "pic",
					x = 551,
					children = {
						{
							xcenter = 0,
							name = "resIcon2",
							scale = 0.69,
							type = "pic",
							ycenter = 0,
							pic = "res/ui/weapon/godWeapon/huany_dt.jpg"
						},
						{
							xcenter = 0,
							type = "pic",
							ycenter = -70,
							pic = "res/ui/kfyz/junzi/fsjz_word_bg.png",
							children = {
								{
									fontSize = 24,
									name = "resNum2",
									text = "100",
									type = "label",
									ycenter = 0,
									xcenter = 0,
									color = colorText[10002]
								}
							}
						}
					}
				}
			}
		},
		{
			type = "button",
			buttons = {
				{
					pic2 = "res/ui/common/button/public_btn_green_g.png",
					name = "lingquJunzi",
					pic1 = "res/ui/common/button/public_btn_green.png",
					y = 75,
					x = 480
				}
			}
		},
		{
			fontSize = 22,
			y = 76,
			type = "label",
			x = 480,
			text = language.get("223901_junzi"),
			color = colorText[10002]
		},
		{
			fontSize = 22,
			name = "mplqLb",
			type = "label",
			y = 40,
			x = 480,
			text = language.get("223903_junzi"),
			color = colorText[10002]
		},
		{
			type = "button",
			buttons = {
				{
					pic2 = "frame:btn_close_c.png",
					name = "closeItem",
					pic1 = "frame:btn_close_a.png",
					y = 605,
					scale = 2,
					x = 930
				}
			}
		}
	}
}

function var_0_0.ctor(arg_2_0)
	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("res/ui/resource/blackMarket_jpg.plist")

	arg_2_0.view = {}
	arg_2_0.data = {}

	local var_2_0 = smgr.getLayer("topLayer")

	var_2_0:removeAllChildrenWithCleanup(true)
	var_2_0:addChild(arg_2_0)

	arg_2_0.view = autoUI.initUI(arg_2_0, arg_2_0.layout)

	swallowTouch(arg_2_0.view.bg)

	if user.player.forceId == 1 then
		arg_2_0.view.zhugong:setDisplayFrame(CCSprite:create("res/ui/common/halfPic/halfPic_caocao.png"):displayFrame())
	elseif user.player.forceId == 2 then
		arg_2_0.view.zhugong:setDisplayFrame(CCSprite:create("res/ui/common/halfPic/halfPic_liubei.png"):displayFrame())
	else
		arg_2_0.view.zhugong:setDisplayFrame(CCSprite:create("res/ui/common/halfPic/halfPic_sunquan.png"):displayFrame())
	end

	local function var_2_1()
		smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
	end

	arg_2_0.view.closeItem:registerScriptTapHandler(var_2_1)

	local function var_2_2()
		local function var_4_0(arg_5_0)
			local var_5_0 = arg_5_0.data.rewards

			if var_5_0 then
				local var_5_1 = {}

				for iter_5_0 = 1, #var_5_0 do
					var_5_1[iter_5_0] = {}

					if tonumber(var_5_0[iter_5_0].type) == 102 or tonumber(var_5_0[iter_5_0].type) == 132 or tonumber(var_5_0[iter_5_0].type) == 144 or tonumber(var_5_0[iter_5_0].type) == 145 then
						var_5_1[iter_5_0].id = 41
					else
						var_5_1[iter_5_0].id = tonumber(var_5_0[iter_5_0].type)
					end

					var_5_1[iter_5_0].value = var_5_0[iter_5_0].value
				end

				globalAction_gotResource(var_5_1)
				arg_2_0:refresh()
			end
		end

		kfcmgr.sendRequest(var_4_0, actions.getGoods)
	end

	arg_2_0.view.lingquJunzi:registerScriptTapHandler(var_2_2)
	arg_2_0:refresh()
end

function var_0_0.refresh(arg_6_0)
	local function var_6_0(arg_7_0)
		showTable(arg_7_0.data)

		arg_6_0.data = arg_7_0.data

		if arg_6_0.data.nextCd and arg_6_0.data.nextCd > 0 then
			arg_6_0.view.process:setPercentage((arg_6_0.data.roundMaxTime - arg_6_0.data.nextCd) / arg_6_0.data.roundMaxTime * 100)

			local function var_7_0()
				arg_6_0:refresh()
			end

			local var_7_1 = createTimerLabel(arg_6_0.data.nextCd, language.get("223902_junzi"), "Thonburi", 24, var_7_0, nil, nil, colorTips.red)

			arg_6_0.view.upBg:removeChildByTag(123, true)
			var_7_1:setPosition(ccp(750, 105))
			arg_6_0.view.upBg:addChild(var_7_1, 0, 123)
		else
			arg_6_0.view.upBg:removeChildByTag(123, true)
			arg_6_0.view.process:setPercentage(100)
		end

		if arg_6_0.data.isFirstRound then
			arg_6_0.view.processBg:setVisible(false)
			arg_6_0.view.box:setVisible(false)
			arg_6_0.view.boxNum:setVisible(false)
			arg_6_0.view.junziWord:setVisible(true)
		else
			arg_6_0.view.processBg:setVisible(true)
			arg_6_0.view.box:setVisible(true)
			arg_6_0.view.boxNum:setVisible(true)
			arg_6_0.view.junziWord:setVisible(false)
		end

		if arg_6_0.data.leftPiece and arg_6_0.data.leftPiece > 0 then
			arg_6_0.view.boxNum:setString("x" .. arg_6_0.data.leftPiece)
		end

		if arg_6_0.data.canGetRewards then
			arg_6_0.view.lingquJunzi:setEnabled(true)
		else
			arg_6_0.view.lingquJunzi:setEnabled(false)
		end

		if arg_6_0.data.delayCd and arg_6_0.data.delayCd > 0 then
			arg_6_0.view.mplqLb:setVisible(false)
			arg_6_0.view.lingquJunzi:setEnabled(false)

			local function var_7_2()
				arg_6_0:refresh()
			end

			local var_7_3 = createTimerLabel(arg_6_0.data.delayCd, language.get("223905_junzi", arg_6_0.data.delayRank), "Thonburi", 22, var_7_2, nil, nil, colorTips.red)

			arg_6_0.view.resourcesBg:removeChildByTag(666, true)
			var_7_3:setPosition(ccp(460, -58))
			arg_6_0.view.resourcesBg:addChild(var_7_3, 0, 666)
		else
			arg_6_0.view.resourcesBg:removeChildByTag(666, true)
			arg_6_0.view.mplqLb:setVisible(true)
		end

		if arg_6_0.data.rewards then
			for iter_7_0, iter_7_1 in pairs(arg_6_0.data.rewards) do
				if tonumber(iter_7_1.type) == 3 then
					arg_6_0.view.resNum1:setString(tool.getFormatNum(iter_7_1.value))
				elseif tonumber(iter_7_1.type) == 102 then
					arg_6_0.view.resIcon2:setDisplayFrame(CCSprite:create("res/ui/kfyz/junzi/huanying.jpg"):displayFrame())
					arg_6_0.view.resIcon2:setScale(1)
					arg_6_0.view.resNum2:setString(tool.getFormatNum(iter_7_1.value))
				elseif tonumber(iter_7_1.type) == 132 then
					arg_6_0.view.resIcon2:setDisplayFrame(CCSprite:create("res/ui/weapon/godWeapon/huany_hbq.jpg"):displayFrame())
					arg_6_0.view.resIcon2:setScale(0.69)
					arg_6_0.view.resNum2:setString(tool.getFormatNum(iter_7_1.value))
				elseif tonumber(iter_7_1.type) == 144 then
					arg_6_0.view.resIcon2:setDisplayFrame(CCSprite:create("res/ui/weapon/godWeapon/huany_juli.jpg"):displayFrame())
					arg_6_0.view.resIcon2:setScale(0.69)
					arg_6_0.view.resNum2:setString(tool.getFormatNum(iter_7_1.value))
				elseif tonumber(iter_7_1.type) == 145 then
					arg_6_0.view.resIcon2:setDisplayFrame(CCSprite:create("res/ui/weapon/godWeapon/huany_dt.jpg"):displayFrame())
					arg_6_0.view.resIcon2:setScale(0.69)
					arg_6_0.view.resNum2:setString(tool.getFormatNum(iter_7_1.value))
				end
			end
		end
	end

	kfcmgr.sendRequest(var_6_0, actions.getGoodsInfo)
end

function var_0_0.update(arg_10_0)
	if arg_10_0.data.nextCd and arg_10_0.data.nextCd > 0 then
		arg_10_0.data.nextCd = arg_10_0.data.nextCd - 1000

		arg_10_0.view.process:setPercentage((arg_10_0.data.roundMaxTime - arg_10_0.data.nextCd) / arg_10_0.data.roundMaxTime * 100)
	else
		arg_10_0.view.process:setPercentage(100)
	end
end

function var_0_0.onEnter(arg_11_0)
	arg_11_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_11_0, arg_11_0.update), 1, false)
end

function var_0_0.onExit(arg_12_0)
	if arg_12_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_12_0.updateSchedulerEntry)
	end
end

return var_0_0
