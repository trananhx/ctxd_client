local var_0_0 = {}
local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.btnLbY = -20
else
	var_0_1.btnLbY = 0
end

local function var_0_2()
	local var_1_0 = {}
	local var_1_1 = {}
	local var_1_2 = {}
	local var_1_3 = {}

	for iter_1_0 = 1, 5 do
		var_1_1 = {
			y = -10,
			type = "label",
			fontSize = 20,
			name = "progressLabel" .. iter_1_0,
			left = (iter_1_0 - 1) * 152 + 140,
			text = 400 * iter_1_0,
			color = ccc3(255, 255, 205)
		}
		var_1_2 = {
			y = 70,
			type = "pic",
			z = 200,
			scale = 0.8,
			pic = "res/ui/rankInfo/DailyFeatView/gxb_pb_bx1.png",
			name = "progressBoxPic" .. iter_1_0,
			x = (iter_1_0 - 1) * 152 + 130,
			children = {
				{
					x = 70,
					y = 30,
					type = "pic",
					pic = "res/ui/rankInfo/DailyFeatView/icon_numb_multi_gray.png",
					name = "icon_multi" .. iter_1_0
				},
				{
					width = 16,
					height = 21,
					type = "atlas",
					visible = false,
					pic = "res/ui/common/number/up_numb_gray.png",
					text = "0",
					y = 32,
					startChar = 48,
					x = 90,
					name = "boxAtlasGray" .. iter_1_0
				},
				{
					width = 16,
					height = 21,
					type = "atlas",
					visible = false,
					pic = "res/ui/common/number/up_numb.png",
					text = "0",
					y = 32,
					startChar = 48,
					x = 90,
					name = "boxAtlas" .. iter_1_0
				},
				{
					x = 70,
					y = -15,
					type = "pic",
					visible = false,
					pic = "res/ui/rankInfo/DailyFeatView/gxb_jh_gray.png",
					name = "wine" .. iter_1_0
				}
			}
		}

		local var_1_4 = {
			down = 0,
			type = "process",
			pic = "res/ui/rankInfo/DailyFeatView/gxb_pb_single.png",
			name = "featProgressBar" .. iter_1_0,
			x = 152 * (iter_1_0 - 1) + 80
		}

		var_1_0[#var_1_0 + 1] = var_1_1
		var_1_0[#var_1_0 + 1] = var_1_2
		var_1_0[#var_1_0 + 1] = var_1_4
	end

	log.info("children :", var_1_0, var_1_1, var_1_2)

	return var_1_0
end

var_0_0.featBackground = {
	height = 523,
	name = "featBackground",
	x = 25,
	type = "layer_color",
	y = 30,
	width = 909,
	color = ccc4(0, 0, 255, 0),
	children = {
		{
			anchorPointX = 0,
			y = 70,
			type = "pic",
			anchorPointY = 0,
			pic = "res/ui/rankInfo/DailyFeatView/gxb_bg.jpg"
		},
		{
			left = 10,
			name = "todayFeatTitlePic",
			y = 485,
			type = "pic",
			pic = "res/ui/rankInfo/DailyFeatView/gxb_tit_jrgx.png"
		},
		{
			width = 32,
			height = 45,
			name = "featValueAtlas",
			type = "atlas",
			anchorPointX = 0,
			pic = "res/ui/rankInfo/DailyFeatView/gxb_tit_jrgx_digit.png",
			text = "0",
			y = 485,
			startChar = 48,
			anchorPointY = 0.5,
			x = 340
		},
		{
			y = 489,
			x = 593,
			type = "button",
			buttons = {
				{
					pic2 = "frame:DailyFeatView_kill_icon_pressed.png",
					pic1 = "frame:DailyFeatView_kill_icon_normal.png",
					name = "upperRightButton" .. 1,
					callBack = function()
						dailyFeatUI.showUpperRightTip(1)
					end
				}
			}
		},
		{
			text = "x0",
			name = "killNumLabel",
			y = 469,
			type = "label",
			fontSize = 20,
			x = 593,
			color = ccc3(255, 255, 205)
		},
		{
			y = 489,
			x = 685,
			type = "button",
			buttons = {
				{
					pic2 = "frame:DailyFeatView_city_icon_pressed.png",
					pic1 = "frame:DailyFeatView_city_icon_normal.png",
					name = "upperRightButton" .. 2,
					callBack = function()
						dailyFeatUI.showUpperRightTip(2)
					end
				}
			}
		},
		{
			text = "x0",
			name = "stormNumLabel",
			y = 469,
			type = "label",
			fontSize = 20,
			x = 685,
			color = ccc3(255, 255, 205)
		},
		{
			y = 489,
			x = 779,
			type = "button",
			buttons = {
				{
					pic2 = "frame:DailyFeatView_assist_icon_pressed.png",
					pic1 = "frame:DailyFeatView_assist_icon_normal.png",
					name = "upperRightButton" .. 3,
					callBack = function()
						dailyFeatUI.showUpperRightTip(3)
					end
				}
			}
		},
		{
			text = "x0",
			name = "assitNumLabel",
			y = 469,
			type = "label",
			fontSize = 20,
			x = 779,
			color = ccc3(255, 255, 205)
		},
		{
			y = 489,
			x = 873,
			type = "button",
			buttons = {
				{
					pic2 = "frame:DailyFeatView_flag_icon_pressed.png",
					pic1 = "frame:DailyFeatView_flag_icon_normal.png",
					name = "upperRightButton" .. 4,
					callBack = function()
						dailyFeatUI.showUpperRightTip(4)
					end
				}
			}
		},
		{
			text = "x0",
			name = "flagNumLabel",
			y = 469,
			type = "label",
			fontSize = 20,
			x = 873,
			color = ccc3(255, 255, 205)
		},
		{
			x = 60,
			name = "featIcon",
			y = 373,
			type = "pic",
			visible = false,
			pic = "res/ui/rankInfo/DailyFeatView/gxb_jx5.png"
		},
		{
			y = 353,
			x = 494,
			type = "pic",
			pic = "res/ui/rankInfo/DailyFeatView/gxb_pb_bg.png",
			children = var_0_2()
		},
		{
			y = 205,
			x = 480,
			type = "button",
			buttons = {
				{
					pic2 = "res/ui/rankInfo/DailyFeatView/gxb_bx_c.png",
					pic1 = "res/ui/rankInfo/DailyFeatView/gxb_bx.png",
					name = "openBoxButton",
					enable = false,
					callBack = function()
						dailyFeatUI.onOpenBoxButtonTap()
					end
				}
			}
		},
		{
			x = 470,
			name = "light",
			y = 300,
			type = "pic",
			visible = false,
			pic = "res/ui/rankInfo/DailyFeatView/gxb_bxop_h.png"
		},
		{
			x = 540,
			name = "mark",
			y = 170,
			type = "pic",
			visible = false,
			pic = "res/ui/rankInfo/DailyFeatView/gxb_bigbx_tit.png"
		},
		{
			xcenter = 560,
			height = 50,
			name = "boxNumLabel",
			type = "atlas",
			pic = "res/ui/rankInfo/DailyFeatView/gxb_bigbx_tit_digit.png",
			text = "0",
			y = 170,
			startChar = 48,
			width = 46
		},
		{
			x = 540,
			name = "boxMax",
			y = 170,
			type = "pic",
			visible = false,
			pic = "res/ui/rankInfo/DailyFeatView/gxb_bigbx_tit_man.png"
		},
		{
			y = 435,
			fontSize = 18,
			type = "label",
			left = 10,
			text = language.get(111015)
		},
		{
			name = "npcBg",
			z = 300,
			anchorPointX = 0,
			type = "pic",
			visible = false,
			pic = "res/ui/activity/consumeGift/xfshl_bg.png",
			y = 5,
			anchorPointY = 0,
			x = 0,
			children = {
				{
					fontSize = 22,
					name = "npcMsg",
					strokeSize = 2,
					anchorPointX = 0,
					type = "label",
					width = 500,
					height = 400,
					text = "",
					y = 170,
					anchorPointY = 1,
					x = 240
				},
				{
					scale = 0.5,
					name = "npcPic",
					anchorPointX = 0,
					type = "pic",
					x = 20,
					anchorPointY = 0,
					pic = "res/ui/comment/xiaoqian.png",
					y = 0
				},
				{
					type = "button",
					buttons = {
						{
							pic2 = "frame:btn3_gre_c.png",
							name = "getRewardButton",
							pic1 = "frame:btn3_gre_a.png",
							x = 480,
							y = 70 + var_0_1.btnLbY,
							callBack = function()
								dailyFeatUI.onGetRewardButtonTap()
							end
						},
						{
							pic2 = "frame:btn3_yel_c.png",
							name = "drinkButton",
							pic1 = "frame:btn3_yel_a.png",
							x = 480,
							y = 70 + var_0_1.btnLbY,
							callBack = function()
								dailyFeatUI.onDrinkButtonTap()
							end
						}
					}
				},
				{
					text = "",
					name = "btnLb",
					fontSize = 22,
					type = "label",
					x = 480,
					strokeSize = 2,
					y = 70 + var_0_1.btnLbY
				}
			}
		}
	}
}

function getFeatRankInfoTipFrameData(arg_9_0)
	return {
		name = "featRankInfoTipFrame",
		type = "pic_9",
		pic = "frame:DailyFeatView_background_tip.png",
		middleRect = CCRectMake(13, 10, 468, 35),
		preferedSize = arg_9_0,
		children = {
			{
				fontSize = 18,
				name = "featRankInfoTipLabel",
				text = "",
				type = "label",
				xcenter = 0,
				ycenter = 0,
				font = "Thonburi",
				color = ccc3(188, 167, 145)
			}
		}
	}
end

function getDailyFeatData()
	return var_0_0
end
