local var_0_0 = {}

function getIntroFrame(arg_1_0)
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
				text = arg_1_0,
				align = kCCTextAlignmentLeft
			}
		}
	}
end

function getTicketsMarketData()
	return var_0_0
end

local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.leftTopX = 90
	var_0_1.conjunction = " x "
else
	var_0_1.leftTopX = 0
	var_0_1.conjunction = "x"
end

var_0_0.ticketMarketBackground = {
	xcenter = 0,
	name = "ticketMarketBackground",
	type = "pic",
	ycenter = -50,
	pic = "res/ui/resource/tickets/ticket_view_bg.png",
	children = {
		{
			type = "pic",
			top = -50,
			pic = "res/ui/resource/tickets/ticket_icon_big.png",
			x = 126 + var_0_1.leftTopX,
			children = {
				{
					fontSize = 22,
					anchorPointX = 1,
					type = "label",
					ycenter = 0,
					anchorPointY = 0.5,
					x = -5,
					text = language.get(74017),
					align = kCCTextAlignmentRight,
					color = colorText[10002]
				},
				{
					xcenter = 40,
					ycenter = 0,
					pic = "res/ui/resource/tickets/resou_up_numb_multip.png",
					type = "pic"
				},
				{
					anchorPointX = 0,
					name = "ticketNumberAtlas",
					width = 20,
					type = "atlas",
					ycenter = 0,
					pic = "res/ui/common/number/resou_up_numb.png",
					height = 22,
					text = "0",
					startChar = 48,
					anchorPointY = 0.5,
					x = 80,
					align = kCCTextAlignmentLeft
				}
			}
		},
		{
			fontSize = 22,
			type = "label",
			anchorPointX = 1,
			font = "Thonburi",
			top = -38,
			anchorPointY = 0.5,
			x = 908,
			text = language.get(74018),
			align = kCCTextAlignmentRight,
			color = colorText[10002]
		}
	}
}
var_0_0.goodsList = {
	name = "goodsList",
	listHeight = 450,
	xcelling = 244,
	type = "list",
	listType = "hlist",
	itemRender = function(arg_3_0, arg_3_1)
		return {
			uis = {
				{
					pic = "res/ui/resource/tickets/ticket_list_view_bg.png",
					type = "pic",
					name = "goodsListCell" .. arg_3_1,
					children = {
						{
							xcenter = 0,
							height = 0,
							fontSize = 20,
							anchorPointX = 0.5,
							type = "label",
							font = "Thonburi",
							y = 396,
							anchorPointY = 0.5,
							width = 160,
							text = ticketConstant.ticketPicToName[arg_3_0.pic] .. var_0_1.conjunction .. arg_3_0.reward,
							align = kCCTextAlignmentCenter
						},
						{
							xcenter = 0,
							y = 270,
							anchorPointX = 0.5,
							type = "pic",
							anchorPointY = 0.5,
							pic = "res/ui/resource/tickets/ticket_icon_view_bg.png",
							children = {
								{
									xcenter = 0,
									type = "pic",
									ycenter = 0,
									pic = "res/ui/resource/tickets/" .. ticketConstant.ticketPicToPic[arg_3_0.pic],
									children = {
										ticketConstant.ticketPicToLevelPic[arg_3_0.pic] and {
											xcenter = 0,
											ycenter = 0,
											type = "pic",
											pic = "res/ui/resource/tickets/" .. ticketConstant.ticketPicToLevelPic[arg_3_0.pic]
										} or nil
									}
								}
							}
						},
						{
							xcenter = 0,
							y = 270,
							type = "button",
							buttons = {
								{
									pic2 = "frame:btn_close_c.png",
									pic3 = "frame:btn_close_c.png",
									pic1 = "frame:btn_close_a.png",
									name = "btn_pic" .. arg_3_1,
									callBack = function()
										log.info("should 物品简介" .. arg_3_1)
										ticketUI.handleItemPicTap(arg_3_1, arg_3_0)
									end
								}
							}
						},
						{
							y = 155,
							x = 110,
							type = "pic",
							pic = "res/ui/resource/tickets/ticket_icon_small.png",
							children = {
								{
									fontSize = 20,
									type = "label",
									anchorPointX = 1,
									ycenter = 3,
									font = "Thonburi",
									anchorPointY = 0.5,
									x = -5,
									text = language.get(74019),
									align = kCCTextAlignmentRight,
									color = colorText[10002]
								},
								{
									fontSize = 20,
									anchorPointX = 0,
									type = "label",
									ycenter = 3,
									anchorPointY = 0.5,
									x = 40,
									text = "x" .. arg_3_0.tickets,
									align = kCCTextAlignmentLeft,
									color = ticketControl.ticketData.myTickets < arg_3_0.tickets and colorTips.red or colorTips.green
								}
							}
						},
						arg_3_0.buyLv <= user.player.playerLv and {
							xcenter = 0,
							y = 53,
							type = "button",
							buttons = {
								{
									pic2 = "frame:btn5_gre_c.png",
									pic1 = "frame:btn5_gre_a.png",
									children = {
										{
											xcenter = 0,
											fontSize = 20,
											type = "label",
											ycenter = 0,
											strokeSize = 2,
											color = colorText[10004],
											strokeColor = colorText[10005],
											text = language.get(74020)
										}
									},
									callBack = function()
										ticketUI.handlePurchaseItemButtonTap(arg_3_0, arg_3_0.num or 1, arg_3_0.reward)
										log.info("should 兑换物品")
									end
								}
							}
						} or {
							xcenter = 0,
							type = "label",
							fontSize = 20,
							anchorPointX = 0.5,
							font = "Thonburi",
							y = 53,
							anchorPointY = 0.5,
							text = arg_3_0.buyLv .. language.get(74021),
							align = kCCTextAlignmentCenter
						}
					}
				}
			}
		}
	end
}
