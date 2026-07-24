tool.requireRes("resource/market")

marketUI = {}
marketUI.uiTable = {}

local var_0_0 = marketControl
local var_0_1 = marketConstant

function marketUI.flyGoodToPortrait()
	return
end

function marketUI.initUI()
	local var_2_0 = smgr.getLayer("marketLayer")

	marketUI.uiTable = autoUI.initUI(var_2_0, getMarketData())

	for iter_2_0 = 1, 3 do
		marketUI.uiTable["buy_" .. iter_2_0]:registerScriptTapHandler(var_0_0["marketButtonClick" .. iter_2_0])
	end

	marketUI.uiTable.gogo:registerScriptTapHandler(var_0_0.gotoClicked)
	marketUI.uiTable.gogo:setEnabled(user.getFunc(10))
	marketUI.uiTable.zhanling:setHorizontalAlignment(kCCTextAlignmentLeft)
	marketUI.uiTable.zhanling:setDimensions(CCSizeMake(60, 30))
	marketUI.uiTable.zhanling:setVerticalAlignment(kCCVerticalTextAlignmentCenter)

	local var_2_1 = createTimerLabel(61, "@M:@S", "Thonburi-Bold", 22, nil, nil)

	marketUI.uiTable.currentReflashCount:addChild(var_2_1, marketConstant.TIME_TAG, marketConstant.TIME_TAG)

	for iter_2_1 = 1, 10 do
		log.debug(iter_2_1, marketConstant.ROLL_LABEL_TAG + iter_2_1, marketConstant.ROLL_LABEL_TAG + iter_2_1 + 10)

		local var_2_2 = CCNode:create()
		local var_2_3 = CCLabelTTF:create("", "Thonburi", 20)

		var_2_2:addChild(var_2_3, marketConstant.ROLL_LABEL_TAG + iter_2_1, marketConstant.ROLL_LABEL_TAG + iter_2_1)

		marketUI.uiTable["label_name" .. iter_2_1] = var_2_3

		local var_2_4 = CCLabelTTF:create("", "Thonburi", 20)

		var_2_2:addChild(var_2_4, marketConstant.ROLL_LABEL_TAG + iter_2_1 + 10, marketConstant.ROLL_LABEL_TAG + iter_2_1 + 10)

		marketUI.uiTable["label_text" .. iter_2_1] = var_2_4

		marketUI.uiTable.textParent:addChild(var_2_2, marketConstant.ROLL_LABEL_TAG, marketConstant.ROLL_LABEL_TAG)
		log.debug(var_2_3, var_2_4)
	end

	require("lua/guide/control")

	guide.uiElementsTable[1008] = marketUI.uiTable.buy_1

	var_2_0:setVisible(false)
end

function marketUI.show()
	rmgr.loadTable(marketConstant.RES)

	local var_3_0 = createBaseLayer()

	smgr.registerLayer(var_3_0, "marketLayer")
	marketUI.initUI()
	var_0_0.getMarketInfo()

	var_3_0.onEnter = var_0_0.onEnter
	var_3_0.onExit = var_0_0.onExit

	return var_3_0
end
