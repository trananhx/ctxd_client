tool.requireRes("resource/tickets")
require("lua/common/tool")

ticketUI = {}

local var_0_0 = ticketUI
local var_0_1 = ticketControl
local var_0_2 = ticketConstant
local var_0_3

function var_0_0.show()
	local var_1_0 = createBaseLayer()

	var_0_3 = nil

	smgr.registerLayer(var_1_0, "ticketLayer")

	var_0_0.uiTable = autoUI.initUI(var_1_0, getTicketsMarketData())

	var_0_1.ticketsGetMarket()

	var_1_0.onEnter = var_0_1.onEnter
	var_1_0.onExit = var_0_1.onExit

	var_1_0:setTouchEnabled(true)

	return var_1_0
end

function var_0_0.updateTicketView(arg_2_0, arg_2_1)
	var_0_0.uiTable.ticketNumberAtlas:setString(arg_2_0.myTickets)

	if arg_2_1 then
		if var_0_0.scrollView then
			pcall(var_0_0.scrollView.removeFromParentAndCleanup, var_0_0.scrollView, true)

			var_0_0.scrollView = nil
		end

		local var_2_0 = autoUI.renderList(var_0_0.uiTable, getTicketsMarketData().goodsList, arg_2_0.goods)
		local var_2_1 = var_0_0.uiTable.ticketMarketBackground
		local var_2_2 = CCSizeMake(#arg_2_0.goods * 244, var_2_0:getContentSize().height)
		local var_2_3 = CCSizeMake(var_2_1:getContentSize().width - 10, var_2_1:getContentSize().height - 10)
		local var_2_4 = CCScrollView:create(var_2_3)

		var_2_4:setContentSize(var_2_2)
		var_2_4:setContainer(var_2_0)

		if var_0_3 then
			var_2_4:setContentOffset(var_0_3)
		else
			var_2_4:setContentOffset(ccp(0, var_2_3.height - var_2_2.height))
		end

		var_2_4:setDirection(kCCScrollViewDirectionHorizontal)
		var_2_4:setBounceable(true)
		var_2_1:addChild(var_2_4)
		var_2_4:setPosition(ccp(5, 5))

		var_0_0.scrollView = var_2_4

		for iter_2_0 = 1, #arg_2_0.goods do
			local var_2_5 = var_0_0.uiTable["btn_pic" .. iter_2_0]

			var_2_5:setScale(3)
			var_2_5:setOpacity(0)
		end
	end
end

function var_0_0.handlePurchaseItemButtonTap(arg_3_0, arg_3_1, arg_3_2)
	var_0_3 = var_0_0.scrollView:getContentOffset()

	var_0_1.ticketsBuy(arg_3_0, arg_3_1, arg_3_2)
end

function var_0_0.handleItemPicTap(arg_4_0, arg_4_1)
	log.info("btn物品图片")

	local var_4_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_4_0:registerScriptTouchHandler(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == CCTOUCHBEGAN then
			return true
		elseif arg_5_0 == CCTOUCHMOVED then
			return true
		elseif arg_5_0 == CCTOUCHENDED then
			pcall(var_4_0.removeFromParentAndCleanup, var_4_0, true)

			return true
		end
	end, false, true)
	var_4_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_4_0, 60000)

	if arg_4_1.id == 51 then
		local var_4_1 = tool.hexToRgb("#D9EDC5")
		local var_4_2 = {
			xcenter = 0,
			name = "introFrame",
			anchorPointX = 0,
			type = "pic_9_tips",
			frameGap = 15,
			ycenter = 0,
			pic = "frame:common_tip_frame_small.png",
			anchorPointY = 0.5,
			middleRect = CCRectMake(0, 0, 0, 0),
			preferedSize = CCSizeMake(290, 300),
			content = {
				{
					fontSize = 24,
					height = 0,
					type = "label",
					width = 260,
					text = arg_4_1.itemName,
					color = colorQuality[6]
				},
				{
					fontSize = 20,
					height = 0,
					type = "label",
					width = 260,
					text = language.get(74049, arg_4_1.civilName),
					color = var_4_1
				},
				{
					pic = "res/ui/weapon/line.png",
					type = "pic"
				},
				{
					fontSize = 20,
					height = 0,
					type = "label",
					width = 260,
					text = language.get(74050, arg_4_1.intro),
					color = var_4_1
				},
				{
					pic = "res/ui/weapon/line.png",
					type = "pic"
				},
				{
					fontSize = 20,
					height = 0,
					type = "label",
					width = 260,
					text = language.get(74048, arg_4_1.validNum),
					color = var_4_1
				}
			}
		}

		autoUI.createUI(var_4_0, var_4_2, var_0_0.uiTable)

		local var_4_3 = 262
		local var_4_4, var_4_5 = tool.getPositionInScreen(var_0_0.uiTable["btn_pic" .. arg_4_0])

		if var_4_4 + var_4_3 <= visibleSize.width then
			var_0_0.uiTable.introFrame:setPosition(ccp(var_4_4 - 30, var_4_5 - 30))
		else
			var_0_0.uiTable.introFrame:setPosition(ccp(var_4_4 - var_4_3, var_4_5 - 30))
		end
	else
		local var_4_6 = ticketConstant.ticketPicToIntro[arg_4_1.pic] or ticketConstant.ticketPicToIntro.default

		autoUI.createUI(var_4_0, getIntroFrame(var_4_6), var_0_0.uiTable)

		local var_4_7, var_4_8 = tool.getPositionInScreen(var_0_0.uiTable["btn_pic" .. arg_4_0])
		local var_4_9 = var_0_0.uiTable.intro:getContentSize().width
		local var_4_10 = var_0_0.uiTable.intro:getContentSize().height

		var_0_0.uiTable.introFrame:setPreferredSize(CCSizeMake(var_4_9 + 30, var_4_10 + 30))
		var_0_0.uiTable.intro:setPosition(ccp(15, var_4_10 + 15))

		if var_4_7 + var_4_9 <= visibleSize.width then
			var_0_0.uiTable.introFrame:setPosition(ccp(var_4_7 - 30, var_4_8 - 30))
		else
			var_0_0.uiTable.introFrame:setPosition(ccp(var_4_7 - var_4_9, var_4_8 - 30))
		end
	end
end
