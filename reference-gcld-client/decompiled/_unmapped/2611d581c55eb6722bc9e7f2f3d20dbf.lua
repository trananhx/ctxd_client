function getKfzbTipFrame()
	local var_1_0
	local var_1_1 = user.kfzbZone > 0 and 490083 or 490002

	return {
		anchorPointX = 0.5,
		name = "kfzbTipFrame",
		type = "pic_9_tips",
		anchorPointY = 1,
		pic = "frame:common_tip_frame_small.png",
		middleRect = CCRectMake(24, 24, 1, 1),
		content = {
			{
				height = 0,
				width = 700,
				type = "label",
				ycenter = 0,
				left = 15,
				fontSize = 20,
				text = language.get(var_1_1),
				align = kCCTextAlignmentLeft
			}
		}
	}
end

function getIntroFrame(arg_2_0)
	return {
		anchorPointX = 0,
		name = "introFrame",
		type = "pic_9",
		anchorPointY = 1,
		pic = "frame:common_tip_frame_small.png",
		middleRect = CCRectMake(24, 24, 1, 1),
		preferedSize = CCSizeMake(200, 200),
		children = {
			{
				fontSize = 20,
				name = "intro",
				type = "label",
				anchorPointX = 0,
				y = 0,
				anchorPointY = 1,
				x = 0,
				text = arg_2_0,
				align = kCCTextAlignmentLeft
			}
		}
	}
end

function getUiDataGZT_YXT(arg_3_0)
	local var_3_0 = {}

	if conf.language == "vie" then
		var_3_0.tagLabelSize = -6
	else
		var_3_0.tagLabelSize = 0
	end

	local var_3_1
	local var_3_2

	if user.kfzbZone > 0 then
		var_3_1 = "jywdh_wdhyxt_title.png"
		var_3_2 = "jywdh_wdhyxt_word.png"
	elseif arg_3_0 then
		var_3_2 = "kfzbs_tzzt_gzt.png"

		if user.feastType == 1 then
			var_3_1 = "zyzbsgzt_title.png"
		else
			var_3_1 = "kfzbs_tzbtzt_gzt.png"
		end
	else
		var_3_2 = "kfzbs_tzzt_yxt.png"
		var_3_1 = user.feastType == 1 and "zyzbsyxt_title.png" or "kfzbs_tzbtzt_yxt.png"
	end

	return {
		kfzbViewBg = {
			xcenter = 0,
			name = "bg",
			type = "pic_9",
			ycenter = -28,
			pic = "frame:bigPanel.png",
			middleRect = CCRectMake(51, 51, 1, 1),
			preferedSize = CCSizeMake(960, 581),
			children = {
				{
					xcenter = 0,
					ycenter = 0,
					pic = "res/ui/kfzb/kfzbs_tz_bg.jpg",
					type = "pic"
				},
				{
					xcenter = 0,
					ycenter = 206,
					type = "pic",
					pic = "res/ui/kfzb/" .. var_3_1
				},
				{
					xcenter = 0,
					ycenter = 0,
					type = "pic",
					pic = "res/ui/kfzb/" .. var_3_2
				},
				{
					type = "button",
					buttons = {
						{
							pic2 = "frame:btnTip_c.png",
							name = "btn_tip",
							pic1 = "frame:btnTip_a.png",
							y = 495,
							x = 880
						},
						{
							pic2 = "frame:btn3_gre_c.png",
							name = "btn_green",
							pic1 = "frame:btn3_gre_a.png",
							y = 65,
							visible = false,
							x = 480
						}
					}
				},
				{
					fontSize = 22,
					name = "label_btn",
					text = "",
					type = "label",
					xcenter = 0,
					y = 65,
					strokeSize = 2,
					visible = false
				},
				{
					xcenter = 0,
					name = "label_info",
					y = 100,
					type = "label",
					fontSize = 20,
					text = "",
					visible = false,
					strokeSize = 2,
					color = ccc3(255, 114, 98)
				}
			}
		},
		closeMenu = {
			type = "button",
			buttons = {
				{
					pic2 = "frame:btn_close_c.png",
					name = "closeBtn",
					pic1 = "frame:btn_close_a.png",
					top = 5,
					right = 5
				}
			}
		}
	}
end

local function var_0_0(arg_4_0, arg_4_1)
	return {
		{
			xcenter = 0,
			type = "pic",
			ycenter = 0,
			visible = false,
			pic = "res/ui/kfzb/kfzbs_vs.png",
			name = "mmarkVS" .. arg_4_0,
			scale = arg_4_1 or 0.55
		},
		{
			xcenter = 0,
			visible = false,
			type = "pic",
			ycenter = 0,
			pic = "res/ui/kfzb/kfzbs_zc.png",
			name = "mmarkZC" .. arg_4_0
		},
		{
			xcenter = 6,
			visible = false,
			type = "pic",
			ycenter = -6,
			pic = "res/ui/kfzb/kfzbs_ck.png",
			name = "mmarkCK" .. arg_4_0
		},
		{
			xcenter = 0,
			visible = false,
			type = "pic",
			ycenter = 0,
			pic = "res/ui/kfzb/kfzbs_dj.png",
			name = "mmarkDZ" .. arg_4_0
		},
		{
			xcenter = 0,
			scale = 0.8,
			type = "pic",
			ycenter = 0,
			visible = false,
			pic = "frame:res_icon_1211.png",
			name = "mmarkQJ" .. arg_4_0
		},
		{
			xcenter = 0,
			scale = 0.8,
			type = "pic",
			ycenter = 0,
			visible = false,
			pic = "frame:res_icon_1211.png",
			name = "mmarkQJH" .. arg_4_0
		}
	}
end

local function var_0_1(arg_5_0)
	local var_5_0 = {
		type = "layer_color",
		x = 0,
		anchorPointX = 0,
		name = "tablePage1",
		visible = false,
		y = 0,
		anchorPointY = 0,
		color = ccc4(0, 0, 0, 0),
		height = visibleSize.height,
		width = visibleSize.width,
		children = {}
	}

	for iter_5_0 = 1, 16 do
		local var_5_1 = 0
		local var_5_2 = 0
		local var_5_3 = ""
		local var_5_4 = 0

		if iter_5_0 >= 1 and iter_5_0 <= 4 then
			var_5_1 = visibleSize.width * 0.9
			var_5_2 = -325 + iter_5_0 * 130
			var_5_3 = 16 - iter_5_0 .. "_2"
			var_5_4 = 18 - iter_5_0 * 2
		elseif iter_5_0 >= 5 and iter_5_0 <= 8 then
			var_5_1 = visibleSize.width * 0.74
			var_5_2 = -325 + (iter_5_0 - 4) * 130
			var_5_3 = 20 - iter_5_0 .. "_1"
			var_5_4 = 25 - iter_5_0 * 2
		elseif iter_5_0 >= 9 and iter_5_0 <= 12 then
			var_5_1 = visibleSize.width * 0.26
			var_5_2 = -325 + (iter_5_0 - 8) * 130
			var_5_3 = 20 - iter_5_0 .. "_2"
			var_5_4 = 26 - iter_5_0 * 2
		elseif iter_5_0 >= 13 and iter_5_0 <= 16 then
			var_5_1 = visibleSize.width * 0.1
			var_5_2 = -325 + (iter_5_0 - 12) * 130
			var_5_3 = 24 - iter_5_0 .. "_1"
			var_5_4 = 33 - iter_5_0 * 2
		end

		local var_5_5 = var_5_2 - 30

		if arg_5_0.phase == 1 then
			local var_5_6 = {
				z = 0,
				type = "pic",
				pic = "res/ui/kfzb/kfzbs_txdk72_02.png",
				name = "pSQ" .. var_5_4,
				x = var_5_1,
				ycenter = var_5_5
			}

			table.insert(var_5_0.children, var_5_6)
		else
			local var_5_7 = {
				z = 0,
				type = "pic",
				pic = "res/ui/kfzb/kfzbs_txdk72_02.png",
				name = "p" .. var_5_3,
				x = var_5_1,
				ycenter = var_5_5
			}
			local var_5_8 = {
				visible = false,
				type = "pic",
				pic = "res/ui/kfzb/kfzbs_txyzc_di.png",
				name = "pmarkZC" .. var_5_3,
				x = var_5_1 + 26,
				ycenter = var_5_5 - 26,
				children = {
					{
						xcenter = 0,
						ycenter = 0,
						pic = "res/ui/kfzb/kfzbs_txyzc_di1.png",
						type = "pic"
					}
				}
			}
			local var_5_9 = {
				scale = 1.1666666666666667,
				type = "pic",
				visible = false,
				pic = "res/ui/kfzb/kfzbs_txdk_jb.png",
				name = "pmarkJJ" .. var_5_3,
				x = var_5_1,
				ycenter = var_5_5
			}

			table.insert(var_5_0.children, var_5_7)
			table.insert(var_5_0.children, var_5_8)
			table.insert(var_5_0.children, var_5_9)
		end
	end

	for iter_5_1 = 1, 8 do
		local var_5_10 = 0
		local var_5_11 = 0
		local var_5_12 = ""

		if iter_5_1 >= 1 and iter_5_1 <= 4 then
			var_5_10 = visibleSize.width * 0.8200000000000001
			var_5_11 = -325 + iter_5_1 * 130
			var_5_12 = 16 - iter_5_1
		elseif iter_5_1 >= 5 and iter_5_1 <= 8 then
			var_5_10 = visibleSize.width * 0.18
			var_5_11 = -325 + (iter_5_1 - 4) * 130
			var_5_12 = 16 - iter_5_1
		end

		local var_5_13 = var_5_11 - 30
		local var_5_14 = {
			type = "button",
			buttons = {
				{
					pic2 = "res/ui/kfzb/kfzbs_vs_di.png",
					pic1 = "res/ui/kfzb/kfzbs_vs_di.png",
					name = "mmarkBtn" .. var_5_12,
					x = var_5_10,
					ycenter = var_5_13
				}
			}
		}
		local var_5_15 = {
			type = "pic",
			pic = "res/ui/kfzb/kfzbs_vs_di.png",
			x = var_5_10,
			ycenter = var_5_13,
			children = var_0_0(var_5_12)
		}

		table.insert(var_5_0.children, var_5_14)
		table.insert(var_5_0.children, var_5_15)
	end

	return var_5_0
end

local function var_0_2(arg_6_0)
	local var_6_0 = {
		type = "layer_color",
		x = 0,
		anchorPointX = 0,
		name = "tablePage2",
		visible = false,
		y = 0,
		anchorPointY = 0,
		color = ccc4(0, 0, 0, 0),
		height = visibleSize.height,
		width = visibleSize.width,
		children = {
			{
				z = 0,
				scale = -1,
				type = "pic",
				ycenter = -160,
				pic = "res/ui/kfzb/kfzbs_line04.png",
				x = visibleSize.width * 0.17
			},
			{
				z = 0,
				scale = -1,
				type = "pic",
				ycenter = 100,
				pic = "res/ui/kfzb/kfzbs_line04.png",
				x = visibleSize.width * 0.17
			},
			{
				z = 0,
				type = "pic",
				ycenter = -160,
				pic = "res/ui/kfzb/kfzbs_line04.png",
				x = visibleSize.width * 0.83
			},
			{
				z = 0,
				type = "pic",
				ycenter = 100,
				pic = "res/ui/kfzb/kfzbs_line04.png",
				x = visibleSize.width * 0.83
			},
			{
				z = 0,
				type = "pic",
				ycenter = -30,
				pic = "res/ui/kfzb/kfzbs_line03.png",
				x = visibleSize.width * 0.26
			},
			{
				z = 0,
				scale = -1,
				type = "pic",
				ycenter = -30,
				pic = "res/ui/kfzb/kfzbs_line03.png",
				x = visibleSize.width * 0.74
			}
		}
	}

	for iter_6_0 = 1, 14 do
		local var_6_1 = 0
		local var_6_2 = 0
		local var_6_3 = ""

		if iter_6_0 >= 1 and iter_6_0 <= 4 then
			var_6_1 = visibleSize.width * 0.9
			var_6_2 = -325 + iter_6_0 * 130
			var_6_3 = 8 - math.ceil(iter_6_0 / 2) .. "_" .. 1 + math.mod(iter_6_0, 2)
		elseif iter_6_0 >= 5 and iter_6_0 <= 8 then
			var_6_1 = visibleSize.width * 0.1
			var_6_2 = -325 + (iter_6_0 - 4) * 130
			var_6_3 = 8 - math.ceil(iter_6_0 / 2) .. "_" .. 1 + math.mod(iter_6_0, 2)
		elseif iter_6_0 >= 9 and iter_6_0 <= 10 then
			var_6_1 = visibleSize.width * 0.76
			var_6_2 = -390 + (iter_6_0 - 8) * 260
			var_6_3 = "3_" .. 1 + math.mod(iter_6_0, 2)
		elseif iter_6_0 >= 11 and iter_6_0 <= 12 then
			var_6_1 = visibleSize.width * 0.24
			var_6_2 = -390 + (iter_6_0 - 10) * 260
			var_6_3 = "2_" .. 1 + math.mod(iter_6_0, 2)
		elseif iter_6_0 == 13 then
			var_6_1 = visibleSize.width * 0.32
			var_6_2 = 0
			var_6_3 = "1_1"
		elseif iter_6_0 == 14 then
			var_6_1 = visibleSize.width * 0.6799999999999999
			var_6_2 = 0
			var_6_3 = "1_2"
		end

		local var_6_4 = var_6_2 - 30
		local var_6_5 = {
			z = 0,
			type = "pic",
			pic = "res/ui/kfzb/kfzbs_txdk72_02.png",
			name = "p" .. var_6_3,
			x = var_6_1,
			ycenter = var_6_4
		}
		local var_6_6 = {
			visible = false,
			type = "pic",
			pic = "res/ui/kfzb/kfzbs_txyzc_di.png",
			name = "pmarkZC" .. var_6_3,
			x = var_6_1 + 26,
			ycenter = var_6_4 - 26,
			children = {
				{
					xcenter = 0,
					ycenter = 0,
					pic = "res/ui/kfzb/kfzbs_txyzc_di1.png",
					type = "pic"
				}
			}
		}
		local var_6_7 = {
			scale = 1.1666666666666667,
			type = "pic",
			visible = false,
			pic = "res/ui/kfzb/kfzbs_txdk_jb.png",
			name = "pmarkJJ" .. var_6_3,
			x = var_6_1,
			ycenter = var_6_4
		}

		table.insert(var_6_0.children, var_6_5)
		table.insert(var_6_0.children, var_6_6)
		table.insert(var_6_0.children, var_6_7)
	end

	for iter_6_1 = 1, 7 do
		local var_6_8 = 0
		local var_6_9 = 0
		local var_6_10 = ""
		local var_6_11 = 0.55

		if iter_6_1 >= 1 and iter_6_1 <= 2 then
			var_6_8 = visibleSize.width * 0.83
			var_6_9 = -390 + iter_6_1 * 260
			var_6_10 = 8 - iter_6_1
		elseif iter_6_1 >= 3 and iter_6_1 <= 4 then
			var_6_8 = visibleSize.width * 0.17
			var_6_9 = -390 + (iter_6_1 - 2) * 260
			var_6_10 = 8 - iter_6_1
		elseif iter_6_1 == 5 then
			var_6_8 = visibleSize.width * 0.245
			var_6_9 = 0
			var_6_10 = 2
		elseif iter_6_1 == 6 then
			var_6_8 = visibleSize.width * 0.755
			var_6_9 = 0
			var_6_10 = 3
		elseif iter_6_1 == 7 then
			var_6_8 = visibleSize.width * 0.5
			var_6_9 = 0
			var_6_10 = 1
			var_6_11 = 1
		end

		local var_6_12 = var_6_9 - 30
		local var_6_13 = {
			type = "button",
			buttons = {
				{
					pic2 = "res/ui/kfzb/kfzbs_vs_di.png",
					pic1 = "res/ui/kfzb/kfzbs_vs_di.png",
					name = "mmarkBtn" .. var_6_10,
					x = var_6_8,
					ycenter = var_6_12
				}
			}
		}
		local var_6_14 = {
			type = "pic",
			pic = "res/ui/kfzb/kfzbs_vs_di.png",
			x = var_6_8,
			ycenter = var_6_12,
			children = var_0_0(var_6_10, var_6_11)
		}

		table.insert(var_6_0.children, var_6_13)
		table.insert(var_6_0.children, var_6_14)
	end

	return var_6_0
end

function getUiDataDZB(arg_7_0)
	local var_7_0 = {}

	if conf.language == "vie" then
		var_7_0.picLayerX = -10
		var_7_0.tipBtnX = 40
	elseif conf.language == "tha" then
		var_7_0.picLayerX = -40
		var_7_0.tipBtnX = 10
	else
		var_7_0.picLayerX = 0
		var_7_0.tipBtnX = 0
	end

	return {
		{
			x = 0,
			z = 200,
			name = "bg",
			type = "layer_color",
			y = 0,
			color = ccc4(0, 0, 0, 0),
			width = visibleSize.width,
			height = visibleSize.height,
			children = {
				{
					xcenter = 190,
					name = "pic_layer",
					visible = false,
					type = "pic",
					top = 35,
					pic = "res/ui/kfzb/kfzbs_zt_zjs.png"
				},
				{
					xcenter = 0,
					ycenter = -200,
					pic = "res/ui/kfzb/kfzbs_view_bg.png",
					type = "pic"
				},
				{
					type = "button",
					buttons = {
						{
							xcenter = 270,
							name = "btn_tip",
							pic1 = "frame:btnTip_a.png",
							pic2 = "frame:btnTip_c.png",
							top = 25
						},
						{
							pic2 = "frame:btn_close_c.png",
							name = "closeBtn",
							pic1 = "frame:btn_close_a.png",
							top = 5,
							right = 5
						},
						{
							xcenter = 0,
							name = "myMatchBtn",
							pic1 = "frame:btn3_gre_a.png",
							down = 100,
							pic2 = "frame:btn3_gre_c.png",
							children = {
								{
									xcenter = 0,
									fontSize = 20,
									type = "label",
									ycenter = 0,
									text = language.get(490036)
								}
							}
						},
						{
							xcenter = 0,
							name = "qinggongBtn",
							pic1 = "frame:btn3_yel_a.png",
							down = 50,
							pic2 = "frame:btn3_yel_c.png",
							children = {
								{
									xcenter = 0,
									fontSize = 20,
									type = "label",
									ycenter = 0,
									text = language.get(490035)
								}
							}
						},
						{
							xcenter = 0,
							name = "rewardBtn",
							pic1 = "frame:btn3_gre_a.png",
							down = 100,
							pic2 = "frame:btn3_gre_c.png",
							children = {
								{
									xcenter = 0,
									fontSize = 20,
									type = "label",
									ycenter = 0,
									text = language.get(113010)
								}
							}
						},
						{
							xcenter = 0,
							name = "shiftBtn",
							pic1 = "frame:btn2_yel_a.png",
							y = 20,
							pic2 = "frame:btn2_yel_c.png",
							visible = false
						}
					}
				},
				{
					text = "",
					name = "shiftBtnLb",
					fontSize = 20,
					type = "label",
					xcenter = 0,
					y = 20,
					visible = false
				},
				{
					xcenter = 0,
					name = "headWin",
					z = 0,
					type = "pic",
					ycenter = 130,
					pic = "res/ui/kfzb/kfzbs_txdk72_01.png"
				},
				{
					xcenter = 0,
					name = "generalPic",
					z = 0,
					type = "pic",
					ycenter = 130,
					visible = false,
					pic = "frame:yemingzhu.jpg"
				},
				{
					xcenter = 0,
					name = "ticketIcon",
					z = 0,
					type = "pic",
					ycenter = -140,
					visible = false,
					pic = "frame:res_icon_100.png"
				},
				var_0_1(arg_7_0),
				var_0_2(arg_7_0)
			}
		}
	}
end

local function var_0_3(arg_8_0)
	return {
		anchorPointX = 0.5,
		name = "giveWayTips",
		type = "pic_9_tips",
		anchorPointY = 1,
		pic = "frame:common_tip_frame_small.png",
		middleRect = CCRectMake(24, 24, 1, 1),
		preferedSize = CCSizeMake(800, 150),
		content = {
			{
				fontSize = 20,
				type = "label",
				ycenter = 0,
				left = 15,
				text = arg_8_0,
				align = kCCTextAlignmentLeft
			}
		}
	}
end

local function var_0_4(arg_9_0, arg_9_1, arg_9_2)
	log.info("should show tips ")

	local var_9_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	autoUI.createUI(var_9_0, var_0_3(arg_9_0), arg_9_2.uiTable)

	local var_9_1, var_9_2 = tool.getPositionInScreen(arg_9_1)

	arg_9_2.uiTable.giveWayTips:setPosition(ccp(visibleSize.width * 0.5, var_9_2 - 20))
	smgr.rootLayer:addChild(var_9_0, 60000)
end

function showGiveWayFirst(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_1
	local var_10_1 = CCSprite:create()
	local var_10_2 = var_10_0[1]
	local var_10_3 = CCSprite:create("res/ui/kfGive/kf_rz_word_zltsb.png")
	local var_10_4 = CCSprite:create("res/ui/kfGive/kf_rz_title_bg.png")
	local var_10_5 = CCSprite:create("res/ui/kfGive/kf_rz_numb_bg.png")
	local var_10_6 = CCLabelAtlas:create(var_10_2.rank, "res/ui/common/number/scpm_word_digit.png", 21, 32, 48)

	var_10_6:setAnchorPoint(ccp(0.5, 0.5))

	local var_10_7 = CCLabelTTF:create(var_10_2.playerName, "", 20)

	var_10_7:setAnchorPoint(ccp(0, 0.5))
	var_10_7:setColor(colorForce[tonumber(var_10_2.nationId)])

	local var_10_8 = CCSprite:create("res/ui/kfGive/kf_rz_icon_buff.png")
	local var_10_9 = CCLabelTTF:create(var_10_2.buffNum, "", 20)

	var_10_9:setAnchorPoint(ccp(0, 0.5))

	local var_10_10 = CCControlButton:create(CCScale9Sprite:create("res/ui/kfGive/kf_rz_list_btn_open.png"))

	var_10_10:setAdjustBackgroundImage(false)
	var_10_10:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/kfGive/kf_rz_list_btn_open.png"), CCControlStateHighlighted)
	var_10_10:setZoomOnTouchDown(false)

	local function var_10_11()
		if arg_10_2.showGiveWayList then
			pcall(arg_10_2.showGiveWayList.removeFromParentAndCleanup, arg_10_2.showGiveWayList, true)

			arg_10_2.showGiveWayList = nil
		else
			arg_10_2.showGiveWayList = showGiveWayList(arg_10_0, var_10_0, arg_10_2)
		end
	end

	var_10_10:addHandleOfControlEvent(var_10_11, CCControlEventTouchUpInside)

	local var_10_12 = CCControlButton:create(CCScale9Sprite:create("res/ui/kfsy/150150.png"))

	var_10_12:setAdjustBackgroundImage(false)
	var_10_12:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/kfsy/150150.png"), CCControlStateHighlighted)
	var_10_12:setZoomOnTouchDown(false)
	tool.scaleTo(var_10_12, 334, 50)

	local function var_10_13()
		local var_12_0 = language.get(226012, var_10_2.yx, var_10_2.serverId, var_10_2.nationName)

		var_0_4(var_12_0, var_10_1, arg_10_2)
	end

	local function var_10_14()
		if arg_10_2.uiTable.giveWayTips then
			arg_10_2.uiTable.giveWayTips:removeFromParentAndCleanup(true)
		end
	end

	var_10_12:addHandleOfControlEvent(var_10_13, CCControlEventTouchDown)
	var_10_12:addHandleOfControlEvent(var_10_14, CCControlEventTouchUpInside)
	var_10_12:addHandleOfControlEvent(var_10_14, CCControlEventTouchUpOutside)
	var_10_1:addChild(var_10_3)
	var_10_4:setPosition(ccp(0, -40))
	var_10_1:addChild(var_10_4)
	var_10_12:setPosition(ccp(0, -40))
	var_10_1:addChild(var_10_12)
	var_10_5:setPosition(ccp(-100, -40))
	var_10_1:addChild(var_10_5)
	var_10_6:setPosition(ccp(-106, -40))
	var_10_1:addChild(var_10_6)
	var_10_7:setPosition(ccp(-66, -40))
	var_10_1:addChild(var_10_7)
	var_10_8:setPosition(ccp(85, -40))
	var_10_1:addChild(var_10_8)
	var_10_9:setPosition(ccp(110, -40))
	var_10_1:addChild(var_10_9)
	var_10_10:setPosition(ccp(145, -40))
	var_10_1:addChild(var_10_10)
	var_10_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 + 30))
	arg_10_0:addChild(var_10_1, 6667)

	return var_10_1
end

function showGiveWayList(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = clone(arg_14_1)

	table.remove(var_14_0, 1)

	local var_14_1 = CCScale9Sprite:create("res/ui/kfGive/kf_rz_list_bg.png"):getContentSize()
	local var_14_2 = CCRectMake(0, 0, var_14_1.width, var_14_1.height)
	local var_14_3 = CCRectMake(5, 5, var_14_1.width - 10, var_14_1.height - 10)
	local var_14_4 = CCScale9Sprite:create("res/ui/kfGive/kf_rz_list_bg.png", var_14_2, var_14_3)

	var_14_4:setContentSize(CCSizeMake(334, 288))

	local var_14_5 = var_14_0

	local function var_14_6(arg_15_0, arg_15_1)
		log.info("cell touched at : ", arg_15_1:getIdx())

		local var_15_0 = var_14_5[arg_15_1:getIdx() + 1]
	end

	local function var_14_7(arg_16_0, arg_16_1)
		return 40, 283
	end

	local function var_14_8(arg_17_0, arg_17_1)
		local var_17_0 = arg_17_0:dequeueCell()

		if var_17_0 then
			var_17_0:removeAllChildrenWithCleanup(true)
		else
			var_17_0 = CCTableViewCell:new()
		end

		local var_17_1 = var_14_5[arg_17_1 + 1]

		if var_17_1 then
			local var_17_2
			local var_17_3 = CCLabelAtlas:create(var_17_1.rank, "res/ui/common/number/scpm_word_digit.png", 21, 32, 48)

			var_17_3:setAnchorPoint(ccp(0.5, 0.5))

			local var_17_4 = CCLabelTTF:create(var_17_1.playerName, "", 20)
			local var_17_5 = CCLabelTTF:create(var_17_1.buffNum, "", 20)

			var_17_4:setAnchorPoint(ccp(0, 0.5))

			local var_17_6 = CCSprite:create("res/ui/kfGive/kf_rz_icon_buff.png")

			if arg_17_1 % 2 == 1 then
				var_17_2 = CCSprite:create("res/ui/kfGive/kf_rz_list_long01.png")
			else
				var_17_2 = CCSprite:create("res/ui/kfGive/kf_rz_list_long02.png")
			end

			var_17_4:setColor(colorForce[tonumber(var_17_1.nationId)])
			var_17_2:setPosition(ccp(183, 19))
			var_17_0:addChild(var_17_2)
			var_17_0:addChild(var_17_3)
			var_17_3:setPosition(ccp(60, 18))
			var_17_0:addChild(var_17_4)
			var_17_4:setPosition(ccp(100, 18))
			var_17_0:addChild(var_17_6)
			var_17_6:setPosition(ccp(250, 18))
			var_17_0:addChild(var_17_5)
			var_17_5:setPosition(ccp(275, 18))
			var_17_5:setAnchorPoint(ccp(0, 0.5))

			local var_17_7 = CCControlButton:create(CCScale9Sprite:create("res/ui/kfsy/150150.png"))

			var_17_7:setAdjustBackgroundImage(false)
			var_17_7:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/kfsy/150150.png"), CCControlStateHighlighted)
			var_17_7:setZoomOnTouchDown(false)
			tool.scaleTo(var_17_7, 283, 40)
			var_17_7:setPosition(ccp(183, 19))
			var_17_0:addChild(var_17_7)

			local function var_17_8()
				local var_18_0 = language.get(226012, var_17_1.yx, var_17_1.serverId, var_17_1.nationName)

				var_0_4(var_18_0, var_17_2, arg_14_2)
			end

			local function var_17_9()
				if arg_14_2.uiTable.giveWayTips then
					arg_14_2.uiTable.giveWayTips:removeFromParentAndCleanup(true)
				end
			end

			var_17_7:addHandleOfControlEvent(var_17_8, CCControlEventTouchDown)
			var_17_7:addHandleOfControlEvent(var_17_9, CCControlEventTouchUpInside)
			var_17_7:addHandleOfControlEvent(var_17_9, CCControlEventTouchUpOutside)
		end

		return var_17_0
	end

	local function var_14_9()
		local var_20_0 = var_14_5

		if var_20_0 and #var_20_0 > 0 then
			return #var_20_0
		else
			return 0
		end
	end

	local var_14_10 = CCTableView:create(CCSizeMake(330, 270))

	var_14_10:setPosition(2, 15)
	var_14_10:setDirection(kCCScrollViewDirectionVertical)
	var_14_10:setVerticalFillOrder(kCCTableViewFillTopDown)
	var_14_4:addChild(var_14_10)
	var_14_10:registerScriptHandler(var_14_6, CCTableView.kTableCellTouched)
	var_14_10:registerScriptHandler(var_14_7, CCTableView.kTableCellSizeForIndex)
	var_14_10:registerScriptHandler(var_14_8, CCTableView.kTableCellSizeAtIndex)
	var_14_10:registerScriptHandler(var_14_9, CCTableView.kNumberOfCellsInTableView)
	var_14_10:reloadData()
	var_14_4:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 170))
	arg_14_0:addChild(var_14_4, 6666)

	return var_14_4
end
