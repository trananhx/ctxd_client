local var_0_0 = {}
local var_0_1 = {}

if conf.language == "kr" then
	var_0_1.tipsLabelY = 14

	if platform.getFlag() == "MOBILE_ANDROID" then
		var_0_1.tipsWidth = 0
		var_0_1.tipsHeight = 275
	else
		var_0_1.tipsWidth = 0
		var_0_1.tipsHeight = 100
	end

	var_0_1.tipsLabelWidth = 0
	var_0_1.tipsLabelHeight = -320
	var_0_1.rewardItemTipWidth = 0
elseif conf.language == "vie" then
	var_0_1.tipsLabelY = 14

	if platform.getFlag() == "MOBILE_ANDROID" then
		var_0_1.tipsWidth = 0
		var_0_1.tipsHeight = 325
	else
		var_0_1.tipsWidth = 0
		var_0_1.tipsHeight = 150
	end

	var_0_1.tipsLabelWidth = 0
	var_0_1.tipsLabelHeight = -320
	var_0_1.rewardItemTipWidth = 100
elseif conf.language == "tha" then
	if platform.getFlag() == "MOBILE_ANDROID" then
		var_0_1.tipsLabelY = 0
		var_0_1.tipsWidth = 150
		var_0_1.tipsHeight = 100
		var_0_1.tipsLabelWidth = 100
	else
		var_0_1.tipsLabelY = 14
		var_0_1.tipsWidth = 0
		var_0_1.tipsHeight = 50
		var_0_1.tipsLabelWidth = 0
	end

	var_0_1.tipsLabelHeight = -320
	var_0_1.rewardItemTipWidth = 100
else
	var_0_1.tipsLabelY = 0
	var_0_1.tipsWidth = 0
	var_0_1.tipsHeight = 0
	var_0_1.tipsLabelWidth = 0
	var_0_1.tipsLabelHeight = 0
	var_0_1.rewardItemTipWidth = 0
end

var_0_0.kfwdEntranceBackground = {
	y = 25,
	name = "kfwdEntranceBackground",
	x = 22,
	type = "pic",
	anchorPointX = 0,
	anchorPointY = 0,
	pic = "res/ui/kfwd/xflts_view_bg.png",
	children = {
		{
			xcenter = 0,
			name = "kfwdEntranceTitlePic",
			y = 488,
			type = "pic",
			pic = "res/ui/kfwd/xflts_tit.png"
		},
		{
			top = 50,
			right = 50,
			type = "button",
			buttons = {
				{
					pic2 = "frame:btnTip_a.png",
					name = "kfwdTipsButton",
					pic1 = "frame:btnTip_c.png",
					callBack = function()
						kfwdEntranceUI.showKfwdTipsView()
					end
				}
			}
		},
		{
			xcenter = 0,
			y = 340,
			type = "pic",
			pic = "res/ui/kfwd/xflts_list_bg.jpg",
			name = "rewardFrame" .. 1,
			children = {
				{
					xcenter = 0,
					visible = false,
					type = "pic",
					ycenter = 0,
					pic = "frame:heshibi.jpg",
					name = "itemPic" .. 1
				},
				{
					xcenter = 0,
					name = "itemFlag1",
					type = "pic",
					ycenter = 0,
					pic = "res/ui/kfwd/xflts_reward_tit1.png"
				},
				{
					xcenter = 0,
					ycenter = -85,
					pic = "res/ui/kfwd/xflts_list_tit_bg.png",
					type = "pic"
				},
				{
					xcenter = 0,
					fontSize = 26,
					type = "label",
					ycenter = -85,
					text = "",
					name = "rewardTitleLabel" .. 1,
					color = ccc3(255, 255, 205)
				}
			}
		},
		{
			xcenter = -270,
			y = 340,
			type = "pic",
			pic = "res/ui/kfwd/xflts_list_bg.jpg",
			name = "rewardFrame" .. 2,
			children = {
				{
					xcenter = 0,
					visible = false,
					type = "pic",
					ycenter = 0,
					pic = "frame:heshibi.jpg",
					name = "itemPic" .. 2
				},
				{
					xcenter = 0,
					name = "itemFlag2",
					type = "pic",
					ycenter = 0,
					pic = "res/ui/kfwd/xflts_reward_tit2.png"
				},
				{
					xcenter = 0,
					ycenter = -85,
					pic = "res/ui/kfwd/xflts_list_tit_bg.png",
					type = "pic"
				},
				{
					xcenter = 0,
					fontSize = 26,
					type = "label",
					ycenter = -85,
					text = "",
					name = "rewardTitleLabel" .. 2,
					color = ccc3(255, 255, 205)
				}
			}
		},
		{
			xcenter = 270,
			y = 340,
			type = "pic",
			pic = "res/ui/kfwd/xflts_list_bg.jpg",
			name = "rewardFrame" .. 3,
			children = {
				{
					xcenter = 0,
					visible = false,
					type = "pic",
					ycenter = 0,
					pic = "frame:heshibi.jpg",
					name = "itemPic" .. 3
				},
				{
					xcenter = 0,
					name = "itemFlag3",
					type = "pic",
					ycenter = 0,
					pic = "res/ui/kfwd/xflts_reward_tit3.png"
				},
				{
					xcenter = 0,
					ycenter = -85,
					pic = "res/ui/kfwd/xflts_list_tit_bg.png",
					type = "pic"
				},
				{
					xcenter = 0,
					fontSize = 26,
					type = "label",
					ycenter = -85,
					text = "",
					name = "rewardTitleLabel" .. 3,
					color = ccc3(255, 255, 205)
				}
			}
		},
		{
			xcenter = 0,
			y = 182,
			type = "pic",
			scale = 0.8,
			pic = "res/ui/kfwd/xflts_list_bg2.png",
			visible = false,
			name = "rewardFrame" .. 4,
			children = {
				{
					xcenter = 0,
					visible = false,
					type = "pic",
					ycenter = 0,
					pic = "frame:yemingzhu.jpg",
					name = "itemPic" .. 4
				},
				{
					xcenter = 0,
					name = "itemFlag4",
					type = "pic",
					ycenter = 0,
					pic = "res/ui/kfwd/xflts_reward_tit4.png"
				},
				{
					xcenter = 0,
					ycenter = -70,
					pic = "res/ui/kfwd/xflts_list_tit_bg.png",
					type = "pic"
				},
				{
					xcenter = 0,
					fontSize = 26,
					type = "label",
					ycenter = -70,
					text = "",
					name = "rewardTitleLabel" .. 4,
					color = ccc3(255, 255, 205)
				}
			}
		},
		{
			xcenter = -180,
			y = 182,
			type = "pic",
			scale = 0.8,
			pic = "res/ui/kfwd/xflts_list_bg2.png",
			visible = false,
			name = "rewardFrame" .. 5,
			children = {
				{
					xcenter = 0,
					visible = false,
					type = "pic",
					ycenter = 0,
					pic = "frame:yemingzhu.jpg",
					name = "itemPic" .. 5
				},
				{
					xcenter = 0,
					name = "itemFlag5",
					type = "pic",
					ycenter = 0,
					pic = "res/ui/kfwd/xflts_reward_tit5.png"
				},
				{
					xcenter = 0,
					ycenter = -70,
					pic = "res/ui/kfwd/xflts_list_tit_bg.png",
					type = "pic"
				},
				{
					xcenter = 0,
					fontSize = 26,
					type = "label",
					ycenter = -70,
					text = "",
					name = "rewardTitleLabel" .. 5,
					color = ccc3(255, 255, 205)
				}
			}
		},
		{
			xcenter = 180,
			y = 182,
			type = "pic",
			scale = 0.8,
			pic = "res/ui/kfwd/xflts_list_bg2.png",
			visible = false,
			name = "rewardFrame" .. 6,
			children = {
				{
					xcenter = 0,
					visible = false,
					type = "pic",
					ycenter = 0,
					pic = "frame:yemingzhu.jpg",
					name = "itemPic" .. 6
				},
				{
					xcenter = 0,
					name = "itemFlag6",
					type = "pic",
					ycenter = 0,
					pic = "res/ui/kfwd/xflts_reward_tit6.png"
				},
				{
					xcenter = 0,
					ycenter = -70,
					pic = "res/ui/kfwd/xflts_list_tit_bg.png",
					type = "pic"
				},
				{
					xcenter = 0,
					fontSize = 26,
					type = "label",
					ycenter = -70,
					text = "",
					name = "rewardTitleLabel" .. 6,
					color = ccc3(255, 255, 205)
				}
			}
		},
		{
			xcenter = 0,
			y = 70,
			type = "button",
			buttons = {
				{
					pic2 = "frame:btn2_gre_c.png",
					pic3 = "frame:btn2_gre_g.png",
					pic1 = "frame:btn2_gre_a.png",
					visible = false,
					name = "signButton",
					callBack = function()
						kfwdEntranceUI.signButtonDidTouched()
					end
				},
				{
					pic2 = "frame:btn2_gre_c.png",
					pic3 = "frame:btn2_gre_g.png",
					pic1 = "frame:btn2_gre_a.png",
					visible = false,
					name = "knownButton",
					callBack = function()
						kfwdEntranceUI.knownButtonDidTouched()
					end
				},
				{
					pic2 = "frame:btn2_gre_c.png",
					pic3 = "frame:btn2_gre_g.png",
					pic1 = "frame:btn2_gre_a.png",
					visible = false,
					name = "enterButton",
					callBack = function()
						kfwdEntranceUI.enterButtonDidTouched()
					end
				},
				{
					pic2 = "frame:btn2_gre_c.png",
					pic3 = "frame:btn2_gre_g.png",
					pic1 = "frame:btn2_gre_a.png",
					visible = false,
					name = "getRewardButton",
					callBack = function()
						kfwdEntranceUI.getRewardButtonDidTouched()
					end
				}
			}
		},
		{
			xcenter = 0,
			name = "buttonTextLabel",
			fontSize = 22,
			type = "label",
			text = " ",
			y = 70,
			strokeSize = 2,
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			xcenter = -230,
			name = "signLimitLabel",
			fontSize = 22,
			type = "label",
			text = "",
			y = 70,
			strokeSize = 2,
			color = colorText[10002],
			strokeColor = colorText[10005]
		},
		{
			xcenter = -50,
			name = "timerMsgLabel",
			y = 70,
			type = "label",
			fontSize = 22,
			visible = false,
			strokeSize = 2,
			text = language.get(390003),
			color = colorText[10004],
			strokeColor = colorText[10005]
		},
		{
			xcenter = 0,
			name = "signOverPic",
			visible = false,
			type = "pic",
			z = 205,
			y = 430,
			pic = "res/ui/kfwd/xflts_bmjs.png"
		},
		{
			xcenter = 0,
			z = 206,
			visible = false,
			type = "label",
			name = "kfwdResultLabel",
			fontSize = 22,
			text = "",
			y = 155,
			strokeSize = 2,
			color = colorText[10002],
			strokeColor = colorText[10005]
		}
	}
}
var_0_0.itemTipsFrame = {
	type = "pic_9",
	name = "itemTipsFrame",
	z = 201,
	anchorPointX = 0,
	pic = "frame:common_tip_frame_small.png",
	visible = false,
	anchorPointY = 0,
	middleRect = CCRectMake(8, 8, 33, 33),
	preferedSize = CCSizeMake(180 + var_0_1.rewardItemTipWidth, 40),
	children = {
		{
			fontSize = 22,
			name = "tipTextLabel",
			anchorPointX = 0,
			type = "label",
			text = "",
			y = 10,
			anchorPointY = 0,
			x = 10,
			color = colorText[10002]
		}
	}
}

function getKfwdEntranceTipsUiData()
	return {
		name = "kfwdTipsFrame",
		z = 200,
		anchorPointX = 1,
		type = "pic_9",
		pic = "frame:common_tip_frame_small.png",
		anchorPointY = 1,
		middleRect = CCRectMake(8, 8, 33, 33),
		preferedSize = CCSizeMake(300 + var_0_1.tipsWidth, 350 + var_0_1.tipsHeight),
		children = {
			{
				fontSize = 22,
				xcenter = 0,
				type = "label",
				text = language.get(390000),
				color = colorText[10002],
				ycenter = 0 + var_0_1.tipsLabelY,
				width = 270 + var_0_1.tipsLabelWidth,
				height = 320 + var_0_1.tipsLabelHeight,
				align = kCCTextAlignmentLeft
			}
		}
	}
end

function getKfwdEntranceDetailData()
	return var_0_0
end
