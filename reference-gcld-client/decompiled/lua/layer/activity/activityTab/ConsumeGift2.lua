local var_0_0 = colorQuality[4]
local var_0_1 = {
	[216] = {
		scale = 0.9,
		txt = 135218,
		pic = "res/ui/weapon/machine/zc_yt_icon.png",
		type = 216
	},
	[119] = {
		scale = 0.8,
		txt = 135217,
		pic = "res/ui/weapon/godWeapon/sbxt_icon_blg.png",
		type = 10033
	},
	[9] = {
		scale = 0.7,
		txt = 135210,
		pic = "res/ui/activity/consumeGift/xfsl_qqby_icon_02.png",
		type = 10058
	},
	[42] = {
		scale = 0.8,
		txt = 135212,
		pic = "res/ui/task/get_icon_mubingling.png",
		type = 5
	},
	[7] = {
		scale = 0.7,
		txt = 135210,
		pic = "res/ui/activity/consumeGift/xfsl_qqby_icon_01.png",
		type = 10058
	},
	[132] = {
		scale = 0.7,
		txt = 135211,
		pic = "res/ui/activity/muNiu/mnlm_icon_hy.png",
		type = 10057
	},
	[125] = {
		scale = 0.6,
		txt = 135210,
		pic = "res/ui/world/feud/sbxt_btn_zs.png",
		type = 10041
	},
	[116] = {
		scale = 0.7,
		txt = 135208,
		pic = "res/ui/resource/silkroad/sczl_sj_icon.png",
		type = 55
	},
	[126] = {
		scale = 0.55,
		txt = 135207,
		pic = "res/ui/resource/silkroad/sczldj_jn.png",
		type = 10030
	},
	[4] = {
		scale = 0.45,
		txt = 135204,
		pic = "res/ui/activity/moveMountain/btkd_icon_bt.png",
		type = 4
	},
	[21] = {
		scale = 0.7,
		txt = 135203,
		pic = "res/ui/activity/gemsActivity/icon_gem.png",
		type = 7
	}
}
local var_0_2 = class("ConsumeGift2", function()
	return createBaseLayer()
end)
local var_0_3 = {
	bg = {
		xcenter = 0,
		name = "bgyanhua",
		type = "pic",
		ycenter = -30,
		pic = "res/ui/playerInfo/invite/bg.jpg",
		children = {
			{
				xcenter = 354,
				z = 200,
				type = "pic",
				ycenter = 170,
				pic = "res/ui/activity/consumeGift/znq_jb.png"
			},
			{
				xcenter = 240,
				name = "leftTime",
				type = "label",
				ycenter = 205,
				fontSize = 28,
				font = "Thonburi-Bold",
				anchorPoint = ccp(0, 0),
				color = ccc3(253, 98, 98)
			},
			{
				xcenter = 0,
				z = 200,
				type = "pic",
				ycenter = 215,
				pic = "res/ui/activity/consumeGift/xfsl_title.png"
			},
			{
				xcenter = 60,
				z = 200,
				type = "pic",
				ycenter = 120,
				pic = "res/ui/activity/consumeGift/xfshl_tit_bg.png",
				children = {
					{
						xcenter = 0,
						z = 300,
						type = "pic",
						ycenter = 0,
						pic = "res/ui/activity/consumeGift/xfsl_word_xfjbwjlccjy.png"
					}
				}
			},
			{
				font = "Thonburi-Bold",
				fontSize = 20,
				type = "label",
				ycenter = 76,
				xcenter = 60,
				z = 400,
				text = language.get(135201, 0, 0),
				text = language.get("consumegift150"),
				color = var_0_0
			},
			{
				xcenter = 60,
				z = 400,
				name = "xiaofeijinbi",
				type = "label",
				ycenter = 30,
				fontSize = 25,
				font = "Thonburi-Bold",
				text = language.get(135201, 0, 0),
				color = var_0_0
			},
			{
				xcenter = 0,
				name = "middlePanel",
				z = 200,
				type = "pic",
				ycenter = -30,
				pic = "res/ui/activity/consumeGift/xfshl_bg_2.png",
				children = {
					{
						x = 120,
						scale = 0.9,
						type = "pic",
						ycenter = -3,
						pic = "res/ui/comment/xiaoqian.png"
					},
					{
						xcenter = 105,
						name = "processBarBackground",
						type = "pic",
						ycenter = -15,
						pic = "res/ui/activity/consumeGift/xfshl_pb_bg.png",
						children = {
							{
								x = 0,
								name = "processBar",
								anchorPointX = 0,
								type = "process",
								ycenter = 0,
								anchorPointY = 0.5,
								pic = "res/ui/activity/consumeGift/xfshl_pb.png",
								percentage = 80
							},
							{
								xcenter = -305,
								name = "yuanbao",
								scale = 1.4,
								type = "pic",
								ycenter = 0,
								z = 100,
								pic = "frame:icon_gold.png"
							},
							{
								xcenter = -194,
								name = "baoshi1",
								type = "pic",
								ycenter = 0,
								pic = "res/ui/activity/consumeGift/xfshl_gem_bg.png"
							},
							{
								xcenter = -97,
								name = "baoshi2",
								type = "pic",
								ycenter = 0,
								pic = "res/ui/activity/consumeGift/xfshl_gem_bg.png"
							},
							{
								xcenter = 0,
								name = "baoshi3",
								type = "pic",
								ycenter = 0,
								pic = "res/ui/activity/consumeGift/xfshl_gem_bg.png"
							},
							{
								xcenter = 97,
								name = "baoshi4",
								type = "pic",
								ycenter = 0,
								pic = "res/ui/activity/consumeGift/xfshl_gem_bg.png"
							},
							{
								xcenter = 194,
								name = "baoshi5",
								type = "pic",
								ycenter = 0,
								pic = "res/ui/activity/consumeGift/xfshl_gem_bg.png"
							},
							{
								xcenter = 291,
								name = "baoshi6",
								type = "pic",
								ycenter = 0,
								pic = "res/ui/activity/consumeGift/xfshl_gem_bg.png"
							},
							{
								xcenter = -194,
								height = 21,
								name = "goldnum1",
								type = "atlas",
								ycenter = -35,
								z = 500,
								pic = "res/ui/general/jailView/jail_flog_upgrade_numbers.png",
								text = "123",
								startChar = 48,
								width = 16
							},
							{
								xcenter = -97,
								height = 21,
								name = "goldnum2",
								type = "atlas",
								ycenter = -35,
								z = 500,
								pic = "res/ui/general/jailView/jail_flog_upgrade_numbers.png",
								text = "123",
								startChar = 48,
								width = 16
							},
							{
								xcenter = 0,
								height = 21,
								name = "goldnum3",
								type = "atlas",
								ycenter = -35,
								z = 500,
								pic = "res/ui/general/jailView/jail_flog_upgrade_numbers.png",
								text = "123",
								startChar = 48,
								width = 16
							},
							{
								xcenter = 97,
								height = 21,
								name = "goldnum4",
								type = "atlas",
								ycenter = -35,
								z = 500,
								pic = "res/ui/general/jailView/jail_flog_upgrade_numbers.png",
								text = "123",
								startChar = 48,
								width = 16
							},
							{
								xcenter = 194,
								height = 21,
								name = "goldnum5",
								type = "atlas",
								ycenter = -35,
								z = 500,
								pic = "res/ui/general/jailView/jail_flog_upgrade_numbers.png",
								text = "123",
								startChar = 48,
								width = 16
							},
							{
								xcenter = 291,
								height = 21,
								name = "goldnum6",
								type = "atlas",
								ycenter = -35,
								z = 500,
								pic = "res/ui/general/jailView/jail_flog_upgrade_numbers.png",
								text = "123",
								startChar = 48,
								width = 16
							},
							{
								xcenter = -194,
								z = 600,
								type = "button",
								ycenter = 0,
								scale = 0.5,
								buttons = {
									{
										pic2 = "res/ui/kfsy/150150.png",
										name = "kaigongButton1",
										pic1 = "res/ui/kfsy/150150.png"
									}
								}
							},
							{
								xcenter = -97,
								z = 600,
								type = "button",
								ycenter = 0,
								scale = 0.5,
								buttons = {
									{
										pic2 = "res/ui/kfsy/150150.png",
										name = "kaigongButton2",
										pic1 = "res/ui/kfsy/150150.png"
									}
								}
							},
							{
								xcenter = 0,
								z = 600,
								type = "button",
								ycenter = 0,
								scale = 0.5,
								buttons = {
									{
										pic2 = "res/ui/kfsy/150150.png",
										name = "kaigongButton3",
										pic1 = "res/ui/kfsy/150150.png"
									}
								}
							},
							{
								xcenter = 97,
								z = 600,
								type = "button",
								ycenter = 0,
								scale = 0.5,
								buttons = {
									{
										pic2 = "res/ui/kfsy/150150.png",
										name = "kaigongButton4",
										pic1 = "res/ui/kfsy/150150.png"
									}
								}
							},
							{
								xcenter = 194,
								z = 600,
								type = "button",
								ycenter = 0,
								scale = 0.5,
								buttons = {
									{
										pic2 = "res/ui/kfsy/150150.png",
										name = "kaigongButton5",
										pic1 = "res/ui/kfsy/150150.png"
									}
								}
							},
							{
								xcenter = 291,
								z = 600,
								type = "button",
								ycenter = 0,
								scale = 0.5,
								buttons = {
									{
										pic2 = "res/ui/kfsy/150150.png",
										name = "kaigongButton6",
										pic1 = "res/ui/kfsy/150150.png"
									}
								}
							}
						}
					}
				}
			}
		}
	}
}
local var_0_4 = 25
local var_0_5 = 25
local var_0_6 = {
	{}
}

var_0_6[1][1] = ccp(var_0_4, var_0_5)
var_0_6[2] = {}
var_0_6[2][1] = ccp(var_0_4 - 5, var_0_5 + 2)
var_0_6[2][2] = ccp(var_0_4 + 5, var_0_5 - 2)
var_0_6[3] = {}
var_0_6[3][3] = ccp(var_0_4 - 5, var_0_5 - 4)
var_0_6[3][2] = ccp(var_0_4 + 5, var_0_5 - 4)
var_0_6[3][1] = ccp(var_0_4 - 2, var_0_5 + 5)
var_0_6[4] = {}
var_0_6[4][1] = ccp(var_0_4 + 0, var_0_5 + 7)
var_0_6[4][2] = ccp(var_0_4 - 7, var_0_5 + 0)
var_0_6[4][3] = ccp(var_0_4 + 7, var_0_5 - 0)
var_0_6[4][4] = ccp(var_0_4 + 0, var_0_5 - 7)
var_0_6[5] = {}
var_0_6[5][1] = ccp(var_0_4 - 0, var_0_5 + 10)
var_0_6[5][2] = ccp(var_0_4 - 10, var_0_5 + 2)
var_0_6[5][3] = ccp(var_0_4 + 10, var_0_5 + 2)
var_0_6[5][4] = ccp(var_0_4 - 5, var_0_5 - 10)
var_0_6[5][5] = ccp(var_0_4 + 5, var_0_5 - 10)
var_0_6[6] = {}
var_0_6[6][1] = ccp(var_0_4, var_0_5 + 11)
var_0_6[6][2] = ccp(var_0_4 - 10, var_0_5 + 5)
var_0_6[6][3] = ccp(var_0_4 + 10, var_0_5 + 5)
var_0_6[6][4] = ccp(var_0_4 - 10, var_0_5 - 5)
var_0_6[6][5] = ccp(var_0_4 + 10, var_0_5 - 5)
var_0_6[6][6] = ccp(var_0_4, var_0_5 - 11)

function var_0_2.ctor(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_2 then
		arg_2_0.data = arg_2_2
	else
		return
	end

	arg_2_0.view = {}
	arg_2_0.view = autoUI.initUI(arg_2_0, var_0_3)

	arg_2_1:addChild(arg_2_0)
	arg_2_0:setLayout(arg_2_0.data)

	arg_2_0.leftTime = arg_2_0.view.leftTime
end

function var_0_2.showTreeEffect(arg_3_0, arg_3_1)
	local var_3_0 = CCArray:create()

	var_3_0:addObject(CCRotateBy:create(0.1, -8))
	var_3_0:addObject(CCRotateBy:create(0.1, 16))
	var_3_0:addObject(CCRotateBy:create(0.05, -8))

	local var_3_1 = CCSequence:create(var_3_0)
	local var_3_2 = CCArray:create()

	var_3_2:addObject(CCRepeat:create(var_3_1, 3))
	var_3_2:addObject(CCDelayTime:create(0.5))

	local var_3_3 = CCSequence:create(var_3_2)

	arg_3_1:runAction(CCRepeatForever:create(var_3_3))
end

function var_0_2.setLayout(arg_4_0, arg_4_1)
	if not arg_4_1 or arg_4_1 and not arg_4_1.lvs or arg_4_1 and arg_4_1.lvs and #arg_4_1.lvs < 1 then
		return
	end

	local var_4_0 = {}
	local var_4_1 = arg_4_1.lvs[1].reward[1].type
	local var_4_2 = 0
	local var_4_3 = false
	local var_4_4 = 0

	for iter_4_0 = 1, 6 do
		local var_4_5 = arg_4_1.lvs[iter_4_0]

		var_4_5.type = var_4_5.reward[1].type
		var_4_5.num = var_4_5.reward[1].num

		arg_4_0.view["goldnum" .. iter_4_0]:setString(var_4_5.gold)
		arg_4_0.view["baoshi" .. iter_4_0]:removeAllChildrenWithCleanup(true)

		local var_4_6 = iter_4_0

		if var_4_5.type and var_4_5.type == 116 then
			var_4_6 = var_4_6 - 2
		end

		if var_4_5.type and var_4_5.type ~= 4 and var_4_5.type ~= 21 and var_4_5.type ~= 116 and var_4_5.type ~= 125 and var_4_5.type ~= 126 then
			var_4_6 = 1
		end

		for iter_4_1 = 1, var_4_6 do
			if var_0_1[var_4_5.type] then
				local var_4_7 = var_0_1[var_4_5.type].pic
				local var_4_8
				local var_4_9 = var_0_1[var_4_5.type].scale

				if var_4_5.status == 0 then
					var_4_8 = GraySprite:create(var_4_7)
				else
					var_4_8 = CCSprite:create(var_4_7)
				end

				if var_4_5.status == 1 then
					var_4_9 = var_4_9 * 1.4

					arg_4_0:showTreeEffect(var_4_8)
				end

				var_4_8:setScale(var_4_9)
				var_4_8:setPosition(var_0_6[var_4_6][iter_4_1])
				arg_4_0.view["baoshi" .. iter_4_0]:addChild(var_4_8)
			end
		end

		local var_4_10 = 0

		if iter_4_0 > 1 then
			var_4_10 = arg_4_1.lvs[iter_4_0 - 1].gold
		end

		if var_4_10 <= arg_4_1.costGold and arg_4_1.costGold < var_4_5.gold then
			var_4_4 = var_4_5.gold - arg_4_1.costGold
		end

		var_4_0[var_4_5.type] = var_4_0[var_4_5.type] or {
			num = 0
		}

		if var_4_5.gold <= arg_4_1.costGold then
			if var_4_5.status == 1 or var_4_5.status == 2 then
				var_4_0[var_4_5.type].num = var_4_0[var_4_5.type].num + var_4_5.num
			end

			var_4_2 = var_4_2 + 0.1666
		elseif var_4_3 ~= true then
			if iter_4_0 > 1 then
				var_4_2 = var_4_2 + 0.1666 * (arg_4_1.costGold - arg_4_1.lvs[iter_4_0 - 1].gold) / (arg_4_1.lvs[iter_4_0].gold - arg_4_1.lvs[iter_4_0 - 1].gold)
			else
				var_4_2 = var_4_2 + 0.1666 * arg_4_1.costGold / arg_4_1.lvs[iter_4_0].gold
			end

			var_4_3 = true
		end

		local function var_4_11(arg_5_0)
			arg_4_0.data = arg_5_0.action.data

			arg_4_0:setLayout(arg_4_0.data)
		end

		local function var_4_12()
			local function var_6_0(arg_7_0)
				local var_7_0 = arg_7_0.action.data.reward

				if var_7_0 and var_7_0[1] and var_0_1[var_7_0[1].type] then
					local var_7_1 = {
						{}
					}

					var_7_1[1].id = var_0_1[var_7_0[1].type].type
					var_7_1[1].value = var_7_0[1].num

					globalAction_gotResource(var_7_1)
				end

				cmgr.sendRequest(var_4_11, actions.consumeGift2Activity)
			end

			if arg_4_1.lvs[iter_4_0].status == 1 then
				log.info("get gem or iron!")
				cmgr.sendRequest(var_6_0, actions.getConsumeGift2Reward, iter_4_0)
			else
				log.info("QQQ:show tips!")
				arg_4_0:showTips(iter_4_0)
			end
		end

		arg_4_0.view["kaigongButton" .. iter_4_0]:registerScriptTapHandler(var_4_12)
	end

	arg_4_0.view.processBar:setPercentage(var_4_2 * 100)

	local var_4_13

	if var_4_1 == 1 then
		var_4_13 = language.get(135202, arg_4_1.costGold, var_4_0[1].num / 10000)
	elseif var_4_1 == 2 then
		var_4_13 = language.get(135201, arg_4_1.costGold, var_4_0[2].num)
	elseif var_4_1 == 3 and var_4_0[4] then
		var_4_13 = language.get(135206, arg_4_1.costGold, var_4_0[4].num, var_4_0[3].num)
	elseif var_4_1 == 8 then
		if var_4_4 > 0 then
			var_4_13 = language.get(135209, arg_4_1.costGold, var_4_4)
		else
			var_4_13 = language.get(135214)
		end
	elseif var_4_1 == 21 then
		var_4_13 = language.get(135201, arg_4_1.costGold, var_4_0[21].num)
	end

	var_4_13 = var_4_13 or language.get(135219, arg_4_1.costGold)

	arg_4_0.view.xiaofeijinbi:setString(var_4_13)
end

function var_0_2.onEnter(arg_8_0)
	arg_8_0.touchBeganRef = handler(arg_8_0, arg_8_0.onTouchBegan)
	arg_8_0.touchMovedRef = handler(arg_8_0, arg_8_0.onTouchMoved)
	arg_8_0.touchEndedRef = handler(arg_8_0, arg_8_0.onTouchEnded)
	arg_8_0.touchCancelledRef = handler(arg_8_0, arg_8_0.onTouchCancelled)

	eventManager.registerEvent("globalOnTouchBegan", arg_8_0.touchBeganRef)
	eventManager.registerEvent("globalOnTouchMoved", arg_8_0.touchMovedRef)
	eventManager.registerEvent("globalOnTouchEnded", arg_8_0.touchEndedRef)
	eventManager.registerEvent("globalOnTouchCancelled", arg_8_0.touchCancelledRef)
end

function var_0_2.onExit(arg_9_0)
	eventManager.unregisterEvent("globalOnTouchBegan", arg_9_0.touchBeganRef)
	eventManager.unregisterEvent("globalOnTouchMoved", arg_9_0.touchMovedRef)
	eventManager.unregisterEvent("globalOnTouchEnded", arg_9_0.touchEndedRef)
	eventManager.unregisterEvent("globalOnTouchCancelled", arg_9_0.touchCancelledRef)
end

function var_0_2.onTouchBegan(arg_10_0, arg_10_1, arg_10_2)
	return
end

function var_0_2.onTouchMoved(arg_11_0, arg_11_1, arg_11_2)
	return
end

function var_0_2.onTouchEnded(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.isTouchOn = false
end

function var_0_2.onTouchCancelled(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.isTouchOn = false
end

function var_0_2.showTips(arg_14_0, arg_14_1)
	log.info("should show tips ")

	local var_14_0 = {
		name = "tipFrame",
		frameGapHorizontal = 20,
		type = "sprite9Tips",
		frameGapVertical = 15,
		pic = {
			frame = true,
			path = "common_tip_frame_small.png"
		},
		anchorPoint = ccp(1, 1),
		middleRect = CCRectMake(24, 24, 1, 1),
		content = {}
	}
	local var_14_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_14_1:registerScriptTouchHandler(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == CCTOUCHBEGAN then
			return true
		elseif arg_15_0 == CCTOUCHMOVED then
			return true
		elseif arg_15_0 == CCTOUCHENDED then
			pcall(var_14_1.removeFromParentAndCleanup, var_14_1, true)

			return true
		end
	end, false, true)
	var_14_1:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_14_1, 60000)

	local var_14_2 = 0
	local var_14_3 = 0
	local var_14_4 = ""
	local var_14_5

	if arg_14_1 then
		local var_14_6 = arg_14_0.data.lvs[arg_14_1]

		var_14_6.type = var_14_6.reward[1].type
		var_14_6.num = var_14_6.reward[1].num

		if var_0_1[var_14_6.type] then
			var_14_4 = language.get(var_0_1[var_14_6.type].txt, var_14_6.gold, var_14_6.num)
		else
			var_14_4 = ""
		end

		var_14_5 = arg_14_0.view["kaigongButton" .. arg_14_1]

		if var_14_6.treasure then
			table.insert(var_14_0.content, {
				height = 0,
				type = "label",
				fontSize = 20,
				width = 0,
				style = "label_warlock",
				text = var_14_6.treasure.name,
				halign = kCCTextAlignmentLeft,
				color = colorQuality[6]
			})
			table.insert(var_14_0.content, {
				height = 0,
				type = "label",
				fontSize = 20,
				width = 0,
				style = "label_warlock",
				text = language.get(30201, var_14_6.treasure.lea),
				halign = kCCTextAlignmentLeft,
				color = colorQuality[2]
			})
			table.insert(var_14_0.content, {
				height = 0,
				type = "label",
				fontSize = 20,
				width = 0,
				style = "label_warlock",
				text = language.get(30202, var_14_6.treasure.str),
				halign = kCCTextAlignmentLeft,
				color = colorQuality[5]
			})
		else
			table.insert(var_14_0.content, {
				height = 0,
				type = "label",
				fontSize = 20,
				width = 0,
				style = "label_warlock",
				text = var_14_4,
				halign = kCCTextAlignmentLeft,
				color = ccc3(255, 255, 194)
			})
		end
	else
		local var_14_7 = language.get(135216)

		var_14_5 = arg_14_0.view.btn_tip

		table.insert(var_14_0.content, {
			height = 0,
			type = "label",
			fontSize = 20,
			width = 0,
			style = "label_warlock",
			text = var_14_7,
			halign = kCCTextAlignmentLeft,
			color = ccc3(255, 255, 194)
		})
	end

	local var_14_8 = {}

	uiutil.initWidgets(var_14_8, var_14_0)
	var_14_1:addChild(var_14_8.widgets.tipFrame)

	local var_14_9, var_14_10 = tool.getPositionInScreen(var_14_5)
	local var_14_11 = var_14_9 + 20
	local var_14_12 = var_14_10 - 20

	var_14_8.widgets.tipFrame:setPosition(ccp(var_14_11, var_14_12))
end

return var_0_2
