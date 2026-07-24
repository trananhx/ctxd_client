local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = tool.hexToRgb("#B23924")
local var_0_2 = tradeConstant
local var_0_3 = {}
local var_0_4 = {}

if conf.language == "vie" then
	var_0_4.nameScale = 0.75
	var_0_4.btnFontSize = -6
else
	var_0_4.nameScale = 1
	var_0_4.btnFontSize = 0
end

function getTradeTipFrame()
	local var_1_0 = user.getFunc(80) and 490142 or 490136

	return {
		anchorPointX = 0.5,
		name = "tradeTipFrame",
		type = "pic_9_tips",
		anchorPointY = 1,
		pic = "frame:common_tip_frame_small.png",
		middleRect = CCRectMake(24, 24, 1, 1),
		preferedSize = CCSizeMake(800, 150),
		content = {
			{
				height = 0,
				width = 600,
				type = "label",
				ycenter = 0,
				left = 15,
				fontSize = 20,
				text = language.get(var_1_0),
				align = kCCTextAlignmentLeft
			}
		}
	}
end

local function var_0_5(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = {
		language.get(10101),
		language.get(490132),
		language.get(10102),
		language.get(490133),
		language.get(10106),
		language.get(490143),
		language.get(310020),
		language.get("224309_jiaotaozhuang"),
		language.get(491047),
		language.get(10111),
		[11] = "",
		[12] = "",
		[13] = ""
	}

	if arg_2_1 then
		local var_2_1 = 0
		local var_2_2 = 0

		if arg_2_0 then
			var_2_1 = math.floor(100 * arg_2_0.haveTimes / arg_2_1.needTimes)
			var_2_2 = arg_2_0.haveTimes
		end

		return {
			type = "pic_9",
			pic = "res/ui/equip/trade/smsr_js_view.jpg",
			y = 52,
			anchorPointY = 0,
			name = "card" .. arg_2_2,
			middleRect = CCRectMake(0, 0, 175, 140),
			preferedSize = CCSizeMake(175, 370),
			x = arg_2_2 * 180 - 82.5,
			children = {
				{
					xcenter = 0,
					top = 10,
					type = "pic",
					pic = "frame:" .. var_0_2.manInfo[arg_2_2].name
				},
				{
					xcenter = 0,
					y = 138,
					type = "pic",
					anchorPointY = 0,
					name = "trade_" .. arg_2_2,
					pic = var_0_2.manInfo[arg_2_2].pic
				},
				{
					xcenter = 0,
					name = "amountValueLabel",
					fontSize = 26,
					type = "label",
					ycenter = 0,
					font = "Thonburi-Bold",
					strokeSize = 2,
					text = language.get(150002, arg_2_1.openLv),
					color = var_0_1,
					visible = not arg_2_0 and arg_2_2 ~= 5
				},
				{
					xcenter = 0,
					z = 200,
					type = "pic",
					ycenter = 0,
					pic = "res/ui/equip/trade/smsr_word_kqtcgn.png",
					name = "noOpenPic" .. arg_2_2,
					visible = not arg_2_0 and arg_2_2 == 5
				},
				{
					xcenter = 0,
					z = 100,
					type = "pic",
					ycenter = 30,
					visible = false,
					pic = "res/ui/resource/blacksmith/new/tjp_weikaiqi.png",
					name = "lianzi" .. arg_2_2
				},
				{
					xcenter = 0,
					z = 200,
					type = "pic",
					ycenter = 0,
					visible = false,
					pic = "res/ui/equip/trade/smsr_word_jzbkq.png",
					name = "guanbi" .. arg_2_2
				},
				{
					xcenter = 0,
					y = 122,
					type = "pic",
					pic = "frame:smsr_pb_bg.png",
					name = "processBackGround" .. arg_2_2,
					children = {
						{
							xcenter = 0,
							type = "process",
							ycenter = 0,
							pic = "frame:smsr_pb.png",
							name = "processBar" .. arg_2_2,
							percentage = var_2_1,
							visible = arg_2_2 ~= 5
						},
						{
							xcenter = 0,
							fontSize = 22,
							type = "label",
							ycenter = 0,
							strokeSize = 2,
							name = "processWord" .. arg_2_2,
							text = var_2_2 .. "/" .. arg_2_1.needTimes,
							color = var_0_0,
							visible = arg_2_2 ~= 5
						}
					}
				},
				{
					visible = true,
					type = "button",
					name = "myButton" .. arg_2_2,
					buttons = {
						{
							pic2 = "frame:btn3_gre_c.png",
							pic1 = "frame:btn3_gre_a.png",
							y = 83,
							x = 85.5,
							name = "btn_touzi" .. arg_2_2,
							enable = arg_2_0 and true or false,
							callBack = function()
								tradeControl.tradeInvest(arg_2_2)
							end,
							children = {
								{
									height = 0,
									width = 120,
									type = "label",
									ycenter = 0,
									xcenter = 0,
									strokeSize = 2,
									fontSize = 24 + var_0_4.btnFontSize,
									text = var_2_0[arg_2_1.singleType] .. " " .. arg_2_1.singleVaue,
									color = var_0_0,
									align = kCCTextAlignmentCenter
								}
							}
						},
						{
							pic2 = "frame:btn_close_c.png",
							pic1 = "frame:btn_close_a.png",
							y = 230,
							pic3 = "frame:btn_close_a.png",
							x = 85.5,
							name = "btn_getReward" .. arg_2_2,
							enable = arg_2_0 and arg_2_0.finished == 1 and true or false,
							callBack = function()
								tradeControl.tradeGetReward(arg_2_2)
							end
						}
					}
				},
				{
					x = 36,
					y = 30,
					type = "pic",
					pic = "frame:smsr_icon_view.png",
					name = "icon_bg" .. arg_2_2,
					children = {
						{
							xcenter = 0,
							scale = 0.5555555555555556,
							type = "pic",
							ycenter = 0,
							name = "icon" .. arg_2_2,
							pic = "frame:" .. var_0_2.manInfo[arg_2_2].icon
						},
						{
							x = 100,
							type = "pic",
							ycenter = 0,
							name = "icon_info" .. arg_2_2,
							pic = "frame:" .. var_0_2.manInfo[arg_2_2].info,
							scale = (function()
								if conf.language == "tha" then
									return 0.5
								elseif conf.language == "vie" then
									return 0.38
								else
									return arg_2_2 <= 3 and 0.6 or 1
								end
							end)()
						}
					}
				}
			}
		}
	else
		return {
			type = "pic_9",
			pic = "res/ui/equip/trade/smsr_js_view_wkq.jpg",
			y = 52,
			anchorPointY = 0,
			name = "card" .. arg_2_2,
			middleRect = CCRectMake(0, 0, 175, 60),
			preferedSize = CCSizeMake(175, 370),
			x = arg_2_2 * 180 - 82.5,
			children = {
				{
					font = "Thonburi-Bold",
					fontSize = 26,
					type = "label",
					ycenter = 0,
					xcenter = 0,
					strokeSize = 2,
					text = language.get(490141),
					color = var_0_1
				}
			}
		}
	end
end

function getTradeUiData(arg_6_0)
	var_0_3.tradeBackground = {
		anchorPointX = 0,
		name = "tradeViewBackground",
		x = 22.5,
		type = "pic",
		y = 24,
		anchorPointY = 0,
		pic = "res/ui/weapon/diamondShop/warlock_view1.jpg",
		children = {
			{
				xcenter = 0,
				top = 10,
				pic = "frame:smsr_tit_name.png",
				type = "pic"
			},
			{
				xcenter = 200,
				top = 25,
				type = "button",
				buttons = {
					{
						pic2 = "frame:btnTip_c.png",
						name = "btn_tip",
						pic1 = "frame:btnTip_a.png",
						callBack = function()
							tradeUI.handleTipsBtnTap()
						end
					}
				}
			}
		}
	}

	for iter_6_0 = 1, 5 do
		local var_6_0 = var_0_5(arg_6_0.myTrades[iter_6_0], arg_6_0.trades[iter_6_0], iter_6_0)

		table.insert(var_0_3.tradeBackground.children, var_6_0)
	end

	return var_0_3
end
