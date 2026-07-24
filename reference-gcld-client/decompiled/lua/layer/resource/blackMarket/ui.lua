tool.requireRes("resource/blackMarket")

blackMarketUI = {}
blackMarketUI.uiTable = {}

local var_0_0 = blackMarketControl
local var_0_1 = blackMarketConstant

function blackMarketUI.initUI()
	local var_1_0 = smgr.getLayer("blackMarketLayer")

	var_1_0:setTouchEnabled(true)

	blackMarketUI.uiTable = autoUI.initUI(var_1_0, getBlackMarketData())

	for iter_1_0 = 1, 3 do
		blackMarketUI.uiTable["exchnage" .. iter_1_0]:registerScriptTapHandler(var_0_0["buttonExchange" .. iter_1_0])
	end

	blackMarketUI.uiTable.zhanling:setHorizontalAlignment(kCCTextAlignmentLeft)
	blackMarketUI.uiTable.zhanling:setDimensions(CCSizeMake(60, 30))
	blackMarketUI.uiTable.zhanling:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	blackMarketUI.uiTable.btn_clear:registerScriptTapHandler(var_0_0.clickSkipCD)
	blackMarketUI.uiTable.btn_go:registerScriptTapHandler(var_0_0.clickGoGo)
	blackMarketUI.uiTable.btn_go:setEnabled(user.getFunc(10))
	blackMarketUI.uiTable.chengchi_got:setVisible(false)
	blackMarketUI.uiTable.chengchi_ungot:setVisible(false)

	local function var_1_1()
		if var_0_0.data and var_0_0.data.cd and var_0_0.data.cdMax then
			local var_2_0 = blackMarketUI.uiTable.cooldown_parent:getChildByTag(blackMarketConstant.TIME_TAG)
			local var_2_1 = var_2_0:getTime()
			local var_2_2 = var_2_1 >= 1000 + var_0_0.data.cdMax and colorQuality[5] or colorQuality[1]

			var_2_0:setColor(var_2_2)
			var_2_0:setTriggerTime(var_2_1 - 1000)
		end
	end

	local var_1_2 = createTimerLabel(100, "@H:@M:@S", "Thonburi-Bold", 22, var_1_1, nil)

	var_1_2:setPosition(ccp(blackMarketUI.uiTable.tradeCdLabel:getPositionX() + blackMarketUI.uiTable.tradeCdLabel:getContentSize().width / 2 + var_1_2:getSize().width / 2 + 4, 40))
	blackMarketUI.uiTable.cooldown_parent:addChild(var_1_2, blackMarketConstant.TIME_TAG, blackMarketConstant.TIME_TAG)
	var_1_0:setVisible(false)
end

function blackMarketUI.show()
	rmgr.loadTable(blackMarketConstant.RES)

	local var_3_0 = createBaseLayer()

	smgr.registerLayer(var_3_0, "blackMarketLayer")
	blackMarketUI.initUI()

	var_3_0.onEnter = var_0_0.onEnter
	var_3_0.onExit = var_0_0.onExit

	var_0_0.getBlackMarketInfo()
	user.welfare.setWelfare("displayBlack", 0)

	return var_3_0
end
