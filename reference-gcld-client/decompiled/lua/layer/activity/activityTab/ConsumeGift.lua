local var_0_0 = {}

if conf.language == "kr" then
	var_0_0.leftTimeX = 100
elseif conf.language == "vie" then
	var_0_0.leftTimeX = 100
elseif conf.language == "tha" then
	var_0_0.leftTimeX = 40
else
	var_0_0.leftTimeX = 0
end

local var_0_1 = require("res/native/offset").get("layer.activity.consumeGift")
local var_0_2 = colorQuality[4]
local var_0_3 = {
	{
		scale = 0.45,
		txt = 135204,
		pic = "res/ui/activity/moveMountain/btkd_icon_bt.png",
		type = 4
	},
	{
		scale = 0.7,
		txt = 135203,
		pic = "res/ui/activity/gemsActivity/icon_gem.png",
		type = 7
	},
	{
		scale = 0.55,
		txt = 135207,
		pic = "res/ui/resource/silkroad/sczldj_jn.png",
		type = 10030
	},
	{
		scale = 0.7,
		txt = 135208,
		pic = "res/ui/resource/silkroad/sczl_sj_icon.png",
		type = 55
	},
	{
		scale = 0.6,
		txt = 135210,
		pic = "res/ui/world/feud/sbxt_btn_zs.png",
		type = 10041
	},
	{
		scale = 0.7,
		txt = 135211,
		pic = "res/ui/activity/muNiu/mnlm_icon_hy.png",
		type = 10057
	},
	{
		scale = 0.7,
		txt = 135210,
		pic = "res/ui/activity/consumeGift/xfsl_qqby_icon_01.png",
		type = 10058
	},
	{
		scale = 0.8,
		txt = 135212,
		pic = "res/ui/task/get_icon_mubingling.png",
		type = 5
	},
	{
		scale = 0.7,
		txt = 135210,
		pic = "res/ui/activity/consumeGift/xfsl_qqby_icon_02.png",
		type = 10058
	},
	[100] = {
		scale = 0.8,
		txt = 135217,
		pic = "res/ui/weapon/godWeapon/sbxt_icon_blg.png",
		type = 10033
	},
	[101] = {
		scale = 0.9,
		txt = 135218,
		pic = "res/ui/weapon/machine/zc_yt_icon.png",
		type = 216
	}
}
local var_0_4 = class("ConsumeGift", function()
	return createBaseLayer()
end)
local var_0_5 = {
	bg = {
		xcenter = 0,
		name = "bgyanhua",
		type = "pic",
		ycenter = -30,
		pic = "res/ui/playerInfo/invite/bg.jpg",
		children = {
			{
				name = "leftTime",
				type = "label",
				ycenter = 205,
				fontSize = 28,
				font = "Thonburi-Bold",
				xcenter = 240 + var_0_0.leftTimeX,
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
				xcenter = 400,
				z = 600,
				type = "button",
				ycenter = 215,
				buttons = {
					{
						pic2 = "frame:btnTip_c.png",
						name = "btn_tip",
						pic1 = "frame:btnTip_a.png"
					}
				}
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
				name = "xiaofeijinbi",
				type = "label",
				anchorPointX = 0,
				ycenter = 30,
				z = 400,
				font = "Thonburi-Bold",
				x = 250,
				fontSize = 25 + (var_0_1.consumeFntSize or 0),
				text = language.get(135201, 0, 0),
				color = var_0_2
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
local var_0_6 = 25
local var_0_7 = 25
local var_0_8 = {
	{}
}

var_0_8[1][1] = ccp(var_0_6, var_0_7)
var_0_8[2] = {}
var_0_8[2][1] = ccp(var_0_6 - 5, var_0_7 + 2)
var_0_8[2][2] = ccp(var_0_6 + 5, var_0_7 - 2)
var_0_8[3] = {}
var_0_8[3][3] = ccp(var_0_6 - 5, var_0_7 - 4)
var_0_8[3][2] = ccp(var_0_6 + 5, var_0_7 - 4)
var_0_8[3][1] = ccp(var_0_6 - 2, var_0_7 + 5)
var_0_8[4] = {}
var_0_8[4][1] = ccp(var_0_6 + 0, var_0_7 + 7)
var_0_8[4][2] = ccp(var_0_6 - 7, var_0_7 + 0)
var_0_8[4][3] = ccp(var_0_6 + 7, var_0_7 - 0)
var_0_8[4][4] = ccp(var_0_6 + 0, var_0_7 - 7)
var_0_8[5] = {}
var_0_8[5][1] = ccp(var_0_6 - 0, var_0_7 + 10)
var_0_8[5][2] = ccp(var_0_6 - 10, var_0_7 + 2)
var_0_8[5][3] = ccp(var_0_6 + 10, var_0_7 + 2)
var_0_8[5][4] = ccp(var_0_6 - 5, var_0_7 - 10)
var_0_8[5][5] = ccp(var_0_6 + 5, var_0_7 - 10)
var_0_8[6] = {}
var_0_8[6][1] = ccp(var_0_6, var_0_7 + 11)
var_0_8[6][2] = ccp(var_0_6 - 10, var_0_7 + 5)
var_0_8[6][3] = ccp(var_0_6 + 10, var_0_7 + 5)
var_0_8[6][4] = ccp(var_0_6 - 10, var_0_7 - 5)
var_0_8[6][5] = ccp(var_0_6 + 10, var_0_7 - 5)
var_0_8[6][6] = ccp(var_0_6, var_0_7 - 11)

function var_0_4.ctor(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_2 then
		arg_2_0.data = arg_2_2
	else
		return
	end

	arg_2_0.view = {}
	arg_2_0.view = autoUI.initUI(arg_2_0, var_0_5)

	arg_2_1:addChild(arg_2_0)
	arg_2_0.view.btn_tip:registerScriptTapHandler(function()
		arg_2_0:showTips()
	end)
	arg_2_0:setLayout(arg_2_0.data)

	arg_2_0.leftTime = arg_2_0.view.leftTime
end

function var_0_4.showTreeEffect(arg_4_0, arg_4_1)
	local var_4_0 = CCArray:create()

	var_4_0:addObject(CCRotateBy:create(0.1, -8))
	var_4_0:addObject(CCRotateBy:create(0.1, 16))
	var_4_0:addObject(CCRotateBy:create(0.05, -8))

	local var_4_1 = CCSequence:create(var_4_0)
	local var_4_2 = CCArray:create()

	var_4_2:addObject(CCRepeat:create(var_4_1, 3))
	var_4_2:addObject(CCDelayTime:create(0.5))

	local var_4_3 = CCSequence:create(var_4_2)

	arg_4_1:runAction(CCRepeatForever:create(var_4_3))
end

function var_0_4.setLayout(arg_5_0, arg_5_1)
	local var_5_0 = {}
	local var_5_1 = arg_5_1.lvs[1].type
	local var_5_2 = 0
	local var_5_3 = false
	local var_5_4 = 0

	for iter_5_0 = 1, 6 do
		local var_5_5 = arg_5_1.lvs[iter_5_0]

		arg_5_0.view["goldnum" .. iter_5_0]:setString(var_5_5.gold)
		arg_5_0.view["baoshi" .. iter_5_0]:removeAllChildrenWithCleanup(true)

		local var_5_6 = iter_5_0

		if var_5_5.type == 4 then
			var_5_6 = var_5_6 - 2
		end

		if var_5_5.type >= 5 then
			var_5_6 = 1
		end

		for iter_5_1 = 1, var_5_6 do
			local var_5_7 = var_0_3[var_5_5.type].pic
			local var_5_8
			local var_5_9 = var_0_3[var_5_5.type].scale

			if var_5_5.status == 0 then
				var_5_8 = GraySprite:create(var_5_7)
			else
				var_5_8 = CCSprite:create(var_5_7)
			end

			if var_5_5.status == 1 then
				var_5_9 = var_5_9 * 1.4

				arg_5_0:showTreeEffect(var_5_8)
			end

			var_5_8:setScale(var_5_9)
			var_5_8:setPosition(var_0_8[var_5_6][iter_5_1])
			arg_5_0.view["baoshi" .. iter_5_0]:addChild(var_5_8)
		end

		local var_5_10 = 0

		if iter_5_0 > 1 then
			var_5_10 = arg_5_1.lvs[iter_5_0 - 1].gold
		end

		if var_5_10 <= arg_5_1.costGold and arg_5_1.costGold < var_5_5.gold then
			var_5_4 = var_5_5.gold - arg_5_1.costGold
		end

		var_5_0[var_5_5.type] = var_5_0[var_5_5.type] or {
			num = 0
		}

		if var_5_5.gold <= arg_5_1.costGold then
			if var_5_5.status == 1 or var_5_5.status == 2 then
				var_5_0[var_5_5.type].num = var_5_0[var_5_5.type].num + var_5_5.num
			end

			var_5_2 = var_5_2 + 0.1666
		elseif var_5_3 ~= true then
			if iter_5_0 > 1 then
				var_5_2 = var_5_2 + 0.1666 * (arg_5_1.costGold - arg_5_1.lvs[iter_5_0 - 1].gold) / (arg_5_1.lvs[iter_5_0].gold - arg_5_1.lvs[iter_5_0 - 1].gold)
			else
				var_5_2 = var_5_2 + 0.1666 * arg_5_1.costGold / arg_5_1.lvs[iter_5_0].gold
			end

			var_5_3 = true
		end

		local function var_5_11(arg_6_0)
			arg_5_0.data = arg_6_0.action.data

			arg_5_0:setLayout(arg_5_0.data)
		end

		local function var_5_12()
			local function var_7_0(arg_8_0)
				local var_8_0 = {
					{}
				}

				var_8_0[1].id = var_0_3[arg_8_0.action.data.type].type
				var_8_0[1].value = arg_8_0.action.data.num

				globalAction_gotResource(var_8_0)
				cmgr.sendRequest(var_5_11, actions.consumeGiftActivity)
			end

			if arg_5_1.lvs[iter_5_0].status == 1 then
				log.info("get gem or iron!")
				cmgr.sendRequest(var_7_0, actions.getConsumeGiftReward, iter_5_0)
			else
				log.info("QQQ:show tips!")
				arg_5_0:showTips(iter_5_0)
			end
		end

		arg_5_0.view["kaigongButton" .. iter_5_0]:registerScriptTapHandler(var_5_12)
	end

	arg_5_0.view.processBar:setPercentage(var_5_2 * 100)

	local var_5_13

	if var_5_1 == 1 then
		var_5_13 = language.get(135202, arg_5_1.costGold, var_5_0[1].num / 10000)
	elseif var_5_1 == 2 then
		var_5_13 = language.get(135201, arg_5_1.costGold, var_5_0[2].num)
	elseif var_5_1 == 3 and var_5_0[4] then
		var_5_13 = language.get(135206, arg_5_1.costGold, var_5_0[4].num, var_5_0[3].num)
	elseif var_5_1 == 8 then
		if var_5_4 > 0 then
			var_5_13 = language.get(135209, arg_5_1.costGold, var_5_4)
		else
			var_5_13 = language.get(135214)
		end
	end

	var_5_13 = var_5_13 or language.get(135219, arg_5_1.costGold)

	arg_5_0.view.xiaofeijinbi:setString(var_5_13)
end

function var_0_4.onEnter(arg_9_0)
	arg_9_0.touchBeganRef = handler(arg_9_0, arg_9_0.onTouchBegan)
	arg_9_0.touchMovedRef = handler(arg_9_0, arg_9_0.onTouchMoved)
	arg_9_0.touchEndedRef = handler(arg_9_0, arg_9_0.onTouchEnded)
	arg_9_0.touchCancelledRef = handler(arg_9_0, arg_9_0.onTouchCancelled)

	eventManager.registerEvent("globalOnTouchBegan", arg_9_0.touchBeganRef)
	eventManager.registerEvent("globalOnTouchMoved", arg_9_0.touchMovedRef)
	eventManager.registerEvent("globalOnTouchEnded", arg_9_0.touchEndedRef)
	eventManager.registerEvent("globalOnTouchCancelled", arg_9_0.touchCancelledRef)
end

function var_0_4.onExit(arg_10_0)
	eventManager.unregisterEvent("globalOnTouchBegan", arg_10_0.touchBeganRef)
	eventManager.unregisterEvent("globalOnTouchMoved", arg_10_0.touchMovedRef)
	eventManager.unregisterEvent("globalOnTouchEnded", arg_10_0.touchEndedRef)
	eventManager.unregisterEvent("globalOnTouchCancelled", arg_10_0.touchCancelledRef)
end

function var_0_4.onTouchBegan(arg_11_0, arg_11_1, arg_11_2)
	return
end

function var_0_4.onTouchMoved(arg_12_0, arg_12_1, arg_12_2)
	return
end

function var_0_4.onTouchEnded(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.isTouchOn = false
end

function var_0_4.onTouchCancelled(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0.isTouchOn = false
end

function var_0_4.showTips(arg_15_0, arg_15_1)
	log.info("should show tips ")

	local var_15_0 = {
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
	local var_15_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_15_1:registerScriptTouchHandler(function(arg_16_0, arg_16_1, arg_16_2)
		if arg_16_0 == CCTOUCHBEGAN then
			return true
		elseif arg_16_0 == CCTOUCHMOVED then
			return true
		elseif arg_16_0 == CCTOUCHENDED then
			pcall(var_15_1.removeFromParentAndCleanup, var_15_1, true)

			return true
		end
	end, false, true)
	var_15_1:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_15_1, 60000)

	local var_15_2 = 0
	local var_15_3 = 0
	local var_15_4 = ""
	local var_15_5

	if arg_15_1 then
		local var_15_6 = arg_15_0.data.lvs[arg_15_1]
		local var_15_7 = language.get(var_0_3[var_15_6.type].txt, var_15_6.gold, var_15_6.num)

		var_15_5 = arg_15_0.view["kaigongButton" .. arg_15_1]

		if var_15_6.treasure then
			table.insert(var_15_0.content, {
				height = 0,
				type = "label",
				fontSize = 20,
				width = 0,
				style = "label_warlock",
				text = var_15_6.treasure.name,
				halign = kCCTextAlignmentLeft,
				color = colorQuality[6]
			})
			table.insert(var_15_0.content, {
				height = 0,
				type = "label",
				fontSize = 20,
				width = 0,
				style = "label_warlock",
				text = language.get(30201, var_15_6.treasure.lea),
				halign = kCCTextAlignmentLeft,
				color = colorQuality[2]
			})
			table.insert(var_15_0.content, {
				height = 0,
				type = "label",
				fontSize = 20,
				width = 0,
				style = "label_warlock",
				text = language.get(30202, var_15_6.treasure.str),
				halign = kCCTextAlignmentLeft,
				color = colorQuality[5]
			})
		else
			table.insert(var_15_0.content, {
				height = 0,
				type = "label",
				fontSize = 20,
				width = 0,
				style = "label_warlock",
				text = var_15_7,
				halign = kCCTextAlignmentLeft,
				color = ccc3(255, 255, 194)
			})
		end
	else
		local var_15_8 = language.get(135216)

		var_15_5 = arg_15_0.view.btn_tip

		table.insert(var_15_0.content, {
			height = 0,
			type = "label",
			fontSize = 20,
			width = 0,
			style = "label_warlock",
			text = var_15_8,
			halign = kCCTextAlignmentLeft,
			color = ccc3(255, 255, 194)
		})
	end

	local var_15_9 = {}

	uiutil.initWidgets(var_15_9, var_15_0)
	var_15_1:addChild(var_15_9.widgets.tipFrame)

	local var_15_10, var_15_11 = tool.getPositionInScreen(var_15_5)
	local var_15_12 = var_15_10 + 20
	local var_15_13 = var_15_11 - 20

	var_15_9.widgets.tipFrame:setPosition(ccp(var_15_12, var_15_13))
end

return var_0_4
