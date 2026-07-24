local var_0_0 = class("OutLineActivity3", function()
	return createBaseLayer()
end)

var_0_0.layout = {
	y = 0,
	name = "Node",
	type = "node",
	x = 0,
	children = {
		{
			name = "sckq_bg",
			type = "sprite",
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 - 30,
			pic = {
				path = "res/ui/silk/intro/sckq_bg.jpg"
			},
			children = {
				{
					fontSize = 36,
					name = "titleLb",
					y = 481.9977,
					type = "label",
					x = 455.4976
				},
				{
					y = 122.9678,
					name = "xxhd_bg_long",
					type = "sprite",
					x = 457.1393,
					pic = {
						path = "res/ui/activity/outline/xxhd_bg_long.jpg"
					}
				},
				{
					y = 338.1081,
					name = "xxhd_paper_bg",
					type = "sprite",
					x = 457.9961,
					pic = {
						path = "res/ui/activity/outline/xxhd_paper_bg.png"
					}
				},
				{
					y = 210.432,
					name = "xxhd_word_hdjd",
					type = "sprite",
					x = 83.0321,
					pic = {
						path = "res/ui/activity/outline/xxhd_word_hdjd.png"
					}
				},
				{
					fontSize = 20,
					name = "remindLb",
					y = 210.7177,
					type = "label",
					x = 782.0323
				},
				{
					fontSize = 24,
					name = "tipsLb",
					y = 125.8607,
					type = "label",
					x = 160.0321,
					anchorPoint = ccp(0, 0)
				},
				{
					y = 75.9136,
					name = "xfshl_pb_bg",
					type = "sprite",
					scaleX = 1.5,
					x = 457.7243,
					pic = {
						path = "res/ui/activity/consumeGift/xfshl_pb_bg.png"
					}
				},
				{
					y = 75.7178,
					name = "progress",
					type = "progressbar",
					scaleX = 1.5,
					x = 458.1758,
					pic = {
						path = "res/ui/activity/consumeGift/xfshl_pb.png"
					}
				},
				{
					y = 23,
					name = "giftSp",
					type = "sprite",
					x = 23,
					pic = {
						path = "Default/Sprite.png"
					},
					children = {
						{
							name = "giftBtn1",
							h = 114,
							type = "button",
							w = 109,
							y = 76.2469,
							x = 176.4589,
							normal = {
								path = "res/ui/noticeIcon/icon_gift.png"
							},
							touched = {
								path = "res/ui/noticeIcon/icon_gift.png"
							},
							disable = {
								path = "res/ui/noticeIcon/icon_gift.png"
							}
						},
						{
							fontSize = 20,
							name = "giftLb1",
							y = 42.6759,
							type = "label",
							x = 174.2456
						}
					}
				},
				{
					y = 256.3037,
					name = "infoScrollView",
					type = "scrollview",
					x = 31.2827,
					viewSize = CCSizeMake(850, 170),
					children = {
						{
							fontSize = 24,
							name = "contentLb",
							height = 0,
							type = "label",
							x = 30,
							y = 0,
							style = "label_warlock",
							width = 800,
							halign = kCCTextAlignmentLeft,
							valign = kCCVerticalTextAlignmentBottom,
							anchorPoint = ccp(0, 0)
						}
					}
				},
				{
					fontSize = 24,
					name = "leftTime",
					y = 480,
					type = "label",
					x = 705
				}
			}
		}
	}
}
var_0_0.tipFrame = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(1, 1),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			name = "tipMsg",
			height = 0,
			type = "label",
			width = 600,
			textId = 135536,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}

local var_0_1 = require("lua/component/Button")
local var_0_2 = require("lua/component/Label")
local var_0_3 = {
	name = "giftBtn",
	h = 114,
	type = "button",
	w = 109,
	normal = {
		path = "res/ui/noticeIcon/icon_gift.png"
	},
	touched = {
		path = "res/ui/noticeIcon/icon_gift.png"
	},
	disable = {
		path = "res/ui/noticeIcon/icon_gift.png"
	}
}
local var_0_4 = {
	fontSize = 20,
	name = "giftLb",
	type = "label",
	color = colorQuality[4]
}
local var_0_5 = 871.5

function var_0_0.ctor(arg_2_0, arg_2_1, arg_2_2)
	log.info("@@ 线下活动")

	arg_2_0.view = {}

	uiutil.initWidgets(arg_2_0.view, arg_2_0.layout)

	arg_2_0.info = arg_2_2
	arg_2_0.leftTime = arg_2_0.view.widgets.leftTime
	arg_2_0.cuttrentNum = arg_2_2.totalNum

	if arg_2_1 then
		arg_2_0:addChild(arg_2_0.view.widgets.Node)
		arg_2_1:addChild(arg_2_0)
	end

	arg_2_0.view.widgets.titleLb:setString(arg_2_2.title)
	arg_2_0.view.widgets.contentLb:setString(language.get(226001, arg_2_2.range) .. "\n" .. language.get(226002, arg_2_2.content))
	arg_2_0.view.widgets.infoScrollView:setContentSize(CCSizeMake(850, arg_2_0.view.widgets.contentLb:getContentSize().height + 20))
	arg_2_0.view.widgets.infoScrollView:setContentOffset(arg_2_0.view.widgets.infoScrollView:minContainerOffset())
	arg_2_0.view.widgets.infoScrollView:setDirection(kCCScrollViewDirectionVertical)
	arg_2_0.view.widgets.remindLb:setString(language.get(226003, arg_2_2.refreshCd / 3600000))
	arg_2_0.view.widgets.tipsLb:setString(arg_2_2.tips)
	arg_2_0.view.widgets.giftSp:removeAllChildrenWithCleanup(true)
	arg_2_0.view.widgets.progress:setPercentage(0)

	local var_2_0 = #arg_2_2.arrs
	local var_2_1 = var_0_5 / var_2_0
	local var_2_2 = 0
	local var_2_3 = 0
	local var_2_4 = 0

	if arg_2_2.arrs and var_2_0 > 0 then
		local var_2_5
		local var_2_6

		for iter_2_0, iter_2_1 in ipairs(arg_2_2.arrs) do
			local var_2_7 = arg_2_2.arrs[iter_2_0]

			if var_2_7.finished == 1 then
				var_2_4 = iter_2_0
			elseif var_2_4 > 0 and var_2_4 + 1 == iter_2_0 then
				local var_2_8 = arg_2_2.arrs[var_2_4]

				if var_2_8 then
					var_2_2 = arg_2_0.cuttrentNum - var_2_8.needNum
					var_2_3 = var_2_7.needNum - var_2_8.needNum
				end
			elseif iter_2_0 == 1 then
				var_2_2 = arg_2_0.cuttrentNum
				var_2_3 = var_2_7.needNum
			end

			local var_2_9 = var_0_1.create(var_0_3).displayObj

			var_2_9:setPosition(ccp(var_2_1 * iter_2_0 - 16, 60))
			var_2_9:setScale(0.25 * iter_2_0)

			if var_2_7.finished == 0 then
				local var_2_10 = GraySprite:create("res/ui/noticeIcon/icon_gift.png")

				var_2_10:setAnchorPoint(ccp(0, 0))
				var_2_9:addChild(var_2_10)
			end

			if iter_2_0 == 1 then
				var_2_9:setScale(0.5)
			elseif iter_2_0 >= 4 then
				var_2_9:setScale(0.75)
			end

			local var_2_11 = var_0_2.create(var_0_4).displayObj

			var_2_11:setString(var_2_7.needNum)
			var_2_11:setPosition(ccp(var_2_1 * iter_2_0 - 16, 20))
			arg_2_0.view.widgets.giftSp:addChild(var_2_9)
			arg_2_0.view.widgets.giftSp:addChild(var_2_11)
			var_2_9:addHandleOfControlEvent(function()
				arg_2_0:showTip(var_2_7, var_2_9)
			end, CCControlEventTouchDown)
			var_2_9:addHandleOfControlEvent(function()
				arg_2_0:hideTip()
			end, CCControlEventTouchUpInside)
			var_2_9:addHandleOfControlEvent(function()
				arg_2_0:hideTip()
			end, CCControlEventTouchUpOutside)
		end
	end

	local var_2_12 = (var_2_1 * var_2_4 + var_2_1 * var_2_2 / var_2_3) / var_0_5 * 100

	arg_2_0.view.widgets.progress:setPercentage(math.ceil(var_2_12))
end

function var_0_0.hideTip(arg_6_0)
	if arg_6_0.tipsView and arg_6_0.tipsView.widgets.tipFrame then
		arg_6_0.tipsView.widgets.tipFrame:removeFromParentAndCleanup(true)
	end
end

function var_0_0.showTip(arg_7_0, arg_7_1, arg_7_2)
	log.info("show tips ")

	local var_7_0 = 0
	local var_7_1 = 0

	arg_7_0.tipsView = {}

	uiutil.initWidgets(arg_7_0.tipsView, arg_7_0.tipFrame)
	smgr.rootLayer:addChild(arg_7_0.tipsView.widgets.tipFrame, 60000)
	arg_7_0.tipsView.widgets.tipMsg:setDimensions(CCSizeMake(0, 0))
	arg_7_0.tipsView.widgets.tipMsg:setString(language.get(226004, arg_7_0.cuttrentNum) .. "\n" .. arg_7_1.rewards)

	local var_7_2, var_7_3 = tool.getPositionInScreen(arg_7_2)
	local var_7_4 = var_7_2 + 20
	local var_7_5 = var_7_3 - 20
	local var_7_6 = arg_7_0.tipsView.widgets.tipMsg:getContentSize().width
	local var_7_7 = arg_7_0.tipsView.widgets.tipMsg:getContentSize().height

	arg_7_0.tipsView.widgets.tipFrame:setPreferredSize(CCSizeMake(var_7_6 + 30, var_7_7 + 30))
	arg_7_0.tipsView.widgets.tipFrame:setPosition(ccp(var_7_4, var_7_5))
	arg_7_0.tipsView.widgets.tipMsg:setPosition(ccp(15, 15))
	arg_7_0.tipsView.widgets.tipFrame:setVisible(true)
end

function var_0_0.onEnter(arg_8_0)
	return
end

function var_0_0.onExit(arg_9_0)
	arg_9_0:hideTip()
end

return var_0_0
