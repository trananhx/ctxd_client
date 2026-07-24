tool.requireRes("resource/blacksmith")
require("lua/common/tool")

blacksmithUI = {}

local var_0_0 = blacksmithUI
local var_0_1 = blacksmithControl
local var_0_2 = blacksmithConstant

var_0_0.currentSelectedSmithIndex = 1
var_0_0.currentSelectedItemVid = {}
var_0_0.currentSelectedItemTip = nil

local var_0_3 = false
local var_0_4 = -1
local var_0_5 = false
local var_0_6 = tool.hexToRgb("#D9EDC5")
local var_0_7 = colorQuality[5]
local var_0_8 = {
	{
		str = language.get(75052, language.get(75027)),
		color = colorQuality[4]
	},
	{
		str = language.get(75052, language.get(75028)),
		color = colorQuality[5]
	},
	{
		str = language.get(75052, language.get(75029)),
		color = colorQuality[6]
	}
}
local var_0_9 = {
	{
		pic = "xuantieshi.jpg",
		txt = 75062,
		msg = 75042,
		scale = 0.55
	},
	{
		scale = 0.55,
		txt = 75063,
		pic = ""
	},
	{
		scale = 0.55,
		txt = 75064,
		pic = ""
	},
	{
		pic = "xuantieyuanshi.jpg",
		txt = 75065,
		msg = 75043,
		scale = 0.55
	},
	{
		msg = 10101,
		scale = 0.55,
		pic = "ying.jpg"
	},
	{
		msg = 10104,
		scale = 1,
		pic = "res_icon_4.png"
	},
	{
		msg = 10100,
		scale = 1,
		pic = "res_icon_19.png"
	}
}

local function var_0_10(arg_1_0)
	local var_1_0

	if arg_1_0 < 10000 then
		var_1_0 = tostring(arg_1_0)
	elseif arg_1_0 < 10000000 then
		var_1_0 = language.get(75021, math.floor(arg_1_0 / 10000))
	elseif arg_1_0 < 100000000 then
		var_1_0 = language.get(75022, math.floor(arg_1_0 / 10000000))
	else
		var_1_0 = language.get(75023, math.floor(arg_1_0 / 100000000))
	end

	return var_1_0
end

function var_0_0.resetFlag()
	log.info("铁匠铺，resetFlag")

	var_0_4 = -1
	var_0_5 = false
end

function var_0_0.show()
	local var_3_0 = createBaseLayer()

	var_0_0.currentSelectedItemVid = {}

	smgr.registerLayer(var_3_0, "blacksmithLayer")
	var_3_0:setTouchEnabled(true)
	var_0_1.blacksmithGetBlacksmithInfo()

	var_3_0.onEnter = var_0_1.onEnter
	var_3_0.onExit = var_0_1.onExit

	return var_3_0
end

function var_0_0.createBlacksmithUi(arg_4_0)
	if var_0_0.uiTable then
		var_0_0.uiTable = nil
	end

	log.info("should create blacksmith")

	local var_4_0 = smgr.getLayer("blacksmithLayer")

	var_4_0:removeAllChildrenWithCleanup(true)

	var_0_0.uiTable = autoUI.initUI(var_4_0, getBlacksmithUiData(arg_4_0))

	if arg_4_0.type == 2 then
		if arg_4_0.buildLv and user.player.playerLv < arg_4_0.buildLv then
			var_0_0.uiTable.btn_building:setEnabled(true)
		elseif arg_4_0.havePic ~= 1 then
			if var_0_4 == -1 then
				var_0_4 = arg_4_0.finished
			elseif arg_4_0.finished == 1 and var_0_4 ~= 1 then
				var_0_5 = true
				var_0_4 = arg_4_0.finished
			end

			if arg_4_0.finished == 1 then
				if not var_0_5 then
					var_0_0.showBuildingLight()
				end

				var_0_0.uiTable.btn_building:setEnabled(true)
			else
				var_0_0.uiTable.btn_building:setEnabled(false)
			end
		else
			var_0_0.uiTable.btn_building:setEnabled(false)
		end
	else
		var_0_0.uiTable.buildButton:setScale(0.7)

		for iter_4_0 = 1, 5 do
			var_0_0.uiTable["btn_dissolve" .. iter_4_0]:setScaleX(0.64)
			var_0_0.uiTable["btn_dissolve" .. iter_4_0]:setScaleY(0.8)
			var_0_0.uiTable["card_bg" .. iter_4_0]:setDisplayFrame(CCSprite:create("res/ui/resource/blacksmith/new/tjp_samll_bg2.png"):displayFrame())
			var_0_0.uiTable["notOpen" .. iter_4_0]:setVisible(true)
			var_0_0.uiTable["smith_node" .. iter_4_0]:setVisible(false)
			var_0_0.uiTable["btn_node" .. iter_4_0]:setVisible(false)
			var_0_0.uiTable["inRest" .. iter_4_0]:setVisible(false)
		end

		local var_4_1 = string.format("res/ui/resource/blacksmith/tjp_grade_%s.png", arg_4_0.lv)

		var_0_0.uiTable.blacksmithLevelText:setDisplayFrame(CCSprite:create(var_4_1):displayFrame())

		if arg_4_0.canUpdate then
			var_0_0.uiTable.buildButton:setVisible(true)
			var_0_0.uiTable.buildButtonTextLabel:setVisible(true)

			if arg_4_0.havePic == 1 then
				var_0_0.uiTable.buildButtonTextLabel:setString(language.get(75016))
			else
				var_0_0.uiTable.buildButtonTextLabel:setString(language.get(75012))
			end
		else
			var_0_0.uiTable.buildButton:setVisible(false)
			var_0_0.uiTable.buildButtonTextLabel:setVisible(false)
		end
	end

	for iter_4_1 = 1, 5 do
		var_0_0.uiTable["info" .. iter_4_1]:setHorizontalAlignment(kCCTextAlignmentCenter)
		var_0_0.uiTable["info" .. iter_4_1]:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	end
end

function var_0_0.updateSmithInfo(arg_5_0)
	local var_5_0 = arg_5_0.smithId
	local var_5_1 = arg_5_0.type == 2 or arg_5_0.type == 3

	var_0_0.uiTable["steel_node" .. var_5_0]:setVisible(var_5_1)

	if var_5_1 then
		local var_5_2 = var_0_0.uiTable["btn_dissolve" .. var_5_0]

		var_5_2:setNormalImage(tool.spriteByName("btn4_yel_a.png"))
		var_5_2:setSelectedImage(tool.spriteByName("btn4_yel_c.png"))

		if arg_5_0.type == 3 then
			var_0_0.uiTable["icon_type" .. var_5_0]:setDisplayFrame(CCSprite:create("res/ui/resource/blacksmith/new/tjpcblg_word_s.png"):displayFrame())
			var_0_0.uiTable["bg_npc" .. var_5_0]:setDisplayFrame(CCSprite:create("res/ui/resource/blacksmith/new/tjpcblg_sj_d.jpg"):displayFrame())
		end

		var_0_0.uiTable["pic_smith" .. var_5_0]:setDisplayFrame(CCSprite:create("res/ui/resource/blacksmith/new/tjpcblg_tj_0" .. var_5_0 .. ".png"):displayFrame())
	end

	local var_5_3 = var_0_9[arg_5_0.goodsType]

	if var_5_3 then
		var_0_0.uiTable["itemPic" .. var_5_0]:setScale(var_5_3.scale)
		var_0_0.uiTable["itemPic" .. var_5_0]:setDisplayFrame(tool.spriteFrameByName(var_5_3.pic))
	end

	local var_5_4 = arg_5_0.remainNum > 0 and "tjp_samll_bg.png" or "tjp_samll_bg2.png"

	var_0_0.uiTable["card_bg" .. var_5_0]:setDisplayFrame(CCSprite:create("res/ui/resource/blacksmith/new/" .. var_5_4):displayFrame())
	var_0_0.uiTable["notOpen" .. var_5_0]:setVisible(false)
	var_0_0.uiTable["smith_node" .. var_5_0]:setVisible(true)
	var_0_0.uiTable["txt_lv" .. var_5_0]:setString(var_0_8[arg_5_0.smithLv].str)
	var_0_0.uiTable["txt_lv" .. var_5_0]:setColor(var_0_8[arg_5_0.smithLv].color)
	var_0_0.uiTable["light" .. var_5_0]:stopAllActions()

	if arg_5_0.canUpdate then
		var_0_0.uiTable["btn_upSmith" .. var_5_0]:setVisible(true)
		var_0_0.uiTable["light" .. var_5_0]:setVisible(true)

		local var_5_5 = CCArray:create()

		var_5_5:addObject(CCFadeOut:create(0.4))
		var_5_5:addObject(CCFadeIn:create(0.4))

		local var_5_6 = CCSequence:create(var_5_5)

		var_0_0.uiTable["light" .. var_5_0]:runAction(CCRepeatForever:create(var_5_6))
	else
		var_0_0.uiTable["btn_upSmith" .. var_5_0]:setVisible(false)
		var_0_0.uiTable["light" .. var_5_0]:setVisible(false)
	end

	if arg_5_0.remainNum > 0 then
		var_0_0.uiTable["btn_node" .. var_5_0]:setVisible(true)

		local var_5_7

		if var_5_1 then
			if arg_5_0.remainNum > 5 then
				var_5_7 = language.get(75067)
			else
				var_5_7 = language.get(75072, arg_5_0.remainNum)
			end
		else
			var_5_7 = language.get(75015, arg_5_0.remainNum)
		end

		var_0_0.uiTable["remainNum" .. var_5_0]:setString(var_5_7)

		if arg_5_0.goodsType == 2 or arg_5_0.goodsType == 3 then
			var_0_0.uiTable["itemPic" .. var_5_0]:setVisible(false)
			var_0_0.uiTable["type" .. var_5_0]:setString(language.get(75053))
			var_0_0.uiTable["btn_dissolve" .. var_5_0]:setEnabled(false)
			var_0_0.uiTable["info" .. var_5_0]:setString(language.get(75066))
		else
			if arg_5_0.goodsType == 5 or arg_5_0.goodsType == 6 or arg_5_0.goodsType == 7 then
				var_0_0.uiTable["type" .. var_5_0]:setString(var_0_10(arg_5_0.num))
			elseif arg_5_0.goodsType == 1 or arg_5_0.goodsType == 4 then
				local var_5_8 = var_0_9[arg_5_0.goodsType]

				var_0_0.uiTable["type" .. var_5_0]:setString(language.get(var_5_8.txt))
				var_0_0.uiTable["haveNum" .. var_5_0]:setString(var_0_10(arg_5_0.haveNum))
				var_0_0.uiTable["haveNum" .. var_5_0]:setColor(arg_5_0.enough and var_0_6 or var_0_7)
			end

			var_0_0.uiTable["btn_dissolve" .. var_5_0]:setEnabled(arg_5_0.enough)

			local var_5_9 = var_5_1 and 75068 or 75035

			var_0_0.uiTable["info" .. var_5_0]:setString(language.get(var_5_9) .. arg_5_0.output)
		end
	else
		var_0_0.uiTable["btn_node" .. var_5_0]:setVisible(false)
		var_0_0.uiTable["inRest" .. var_5_0]:setVisible(true)
	end
end

function var_0_0.updateSmithSelection(arg_6_0)
	local var_6_0 = var_0_0.currentSelectedSmithIndex
	local var_6_1 = var_0_1.blacksmithData.blacksmiths[var_6_0]

	var_0_0.currentSelectedItemVid[var_6_0] = arg_6_0.vId

	if var_6_1.goodsType == 3 then
		var_0_0.currentSelectedItemTip = arg_6_0.tips
	end

	var_0_0.uiTable["itemPic" .. var_6_0]:setDisplayFrame(tool.spriteFrameByName(arg_6_0.pic .. ".jpg"))
	var_0_0.uiTable["itemPic" .. var_6_0]:setVisible(true)

	local var_6_2 = var_0_9[var_6_1.goodsType]

	if var_6_2 then
		var_0_0.uiTable["type" .. var_6_0]:setString(language.get(var_6_2.txt))
	end

	local var_6_3 = (var_6_1.type == 2 or var_6_1.type == 3) and 75068 or 75035

	var_0_0.uiTable["info" .. var_6_0]:setString(language.get(var_6_3) .. arg_6_0.output)
	var_0_0.uiTable["btn_dissolve" .. var_6_0]:setEnabled(true)
end

function var_0_0.handleBuildBtnTap_LJ()
	log.info("btn立即建成")
	messageBox.confirm(language.get(85062), function()
		require("lua/layer/resource/ui")
		resourceUI.show(4)
	end)
end

function var_0_0.handleBuildBtnTap_KS()
	log.info("btn快速建造")
	var_0_1.blacksmithInvestCopper(2)
end

function var_0_0.handleBuildBtnTap_PT()
	log.info("btn普通建造")
	var_0_1.blacksmithInvestCopper(1)
end

function var_0_0.handleBuildBtnTap_TZ()
	log.info("btn图纸建造")
	var_0_0.uiTable.btn_build_TZ:setVisible(false)
	var_0_0.showUpgradeEffect("res/ui/resource/blacksmith/tjp_build.png", var_0_0.showBuildingLight)
end

function var_0_0.blacksmithBuildButtonTap()
	if var_0_1.blacksmithData.havePic == 1 then
		var_0_1.blacksmithUpgradeBlackSmith()
	else
		require("lua/layer/resource/ui")
		resourceUI.show(4)
	end
end

function var_0_0.itemButtonTap(arg_13_0)
	var_0_0.currentSelectedSmithIndex = arg_13_0

	local var_13_0 = var_0_1.blacksmithData.blacksmiths[arg_13_0]

	if var_13_0.goodsType == 2 or var_13_0.goodsType == 3 then
		if var_13_0.goodsType == 2 then
			var_0_1.itemsData = var_13_0.generalTreasures
		elseif var_13_0.goodsType == 3 then
			var_0_1.itemsData = var_13_0.equipList
		end

		if var_0_1.itemsData then
			var_0_0.showSelectionList(arg_13_0, var_0_1.itemsData)
		end
	else
		var_0_0.showBlacksmithItemTipFrame(arg_13_0)
	end
end

function var_0_0.handleDissolveButtonTap(arg_14_0)
	local var_14_0
	local var_14_1 = var_0_1.blacksmithData.blacksmiths[arg_14_0]

	local function var_14_2()
		var_0_1.blacksmithDissolve(var_14_0, arg_14_0)

		if var_14_1.goodsType == 2 or var_14_1.goodsType == 3 then
			var_0_0.selectedItemIndex = nil
			var_0_0.currentSelectedItemVid[arg_14_0] = nil
		end
	end

	if var_14_1.goodsType == 2 then
		var_14_0 = var_0_0.currentSelectedItemVid[arg_14_0]

		if var_14_0 then
			messageBox.confirm(language.get(75061), var_14_2)
		end
	elseif var_14_1.goodsType == 3 then
		var_14_0 = var_0_0.currentSelectedItemVid[arg_14_0]

		if var_14_0 then
			if var_0_0.currentSelectedItemTip then
				messageBox.confirm(language.get(75051), var_14_2)
			else
				var_14_2()
			end
		end
	elseif var_14_1.goodsType == 7 then
		messageBox.showChargeWin("", language.get(75074, var_14_1.num), "buyBlackSmithNum", function()
			var_14_0 = 0

			var_14_2()
		end)
	else
		var_14_0 = 0

		var_14_2()
	end
end

function var_0_0.handleTipsButtonTap()
	var_0_0.showBlacksmithTipFrame()
end

function var_0_0.showBlacksmithTipFrame()
	local var_18_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_18_0:registerScriptTouchHandler(function(arg_19_0, arg_19_1, arg_19_2)
		if arg_19_0 == CCTOUCHBEGAN then
			return true
		elseif arg_19_0 == CCTOUCHMOVED then
			return true
		elseif arg_19_0 == CCTOUCHENDED then
			var_0_0.uiTable.blacksmithTipFrame:setVisible(false)
			var_18_0:removeFromParentAndCleanup(true)

			return true
		end
	end, false, true)
	var_18_0:setTouchEnabled(true)
	autoUI.createUI(var_18_0, getBlacksmithTipFrame(var_0_1.blacksmithData), var_0_0.uiTable)
	var_0_0.uiTable.blacksmithTipFrame:setVisible(true)

	local var_18_1, var_18_2 = tool.getPositionInScreen(var_0_0.uiTable.tipButton)

	var_0_0.uiTable.blacksmithTipFrame:setPosition(ccp(var_18_1 + 50, var_18_2 - 30))
	smgr.rootLayer:addChild(var_18_0, 60000)
end

function var_0_0.showBlacksmithItemTipFrame(arg_20_0)
	local var_20_0 = var_0_1.blacksmithData.blacksmiths[arg_20_0]
	local var_20_1 = var_0_9[var_20_0.goodsType]

	if not var_20_1 then
		return
	end

	local var_20_2 = language.get(var_20_1.msg)
	local var_20_3 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_20_3:registerScriptTouchHandler(function(arg_21_0, arg_21_1, arg_21_2)
		if arg_21_0 == CCTOUCHBEGAN then
			return true
		elseif arg_21_0 == CCTOUCHMOVED then
			return true
		elseif arg_21_0 == CCTOUCHENDED then
			var_0_0.uiTable.blacksmithItemTipFrame:setVisible(false)
			var_20_3:removeFromParentAndCleanup(true)

			return true
		end
	end, false, true)
	var_20_3:setTouchEnabled(true)
	autoUI.createUI(var_20_3, getBlacksmithItemTipFrame(var_20_2), var_0_0.uiTable)
	var_0_0.uiTable.blacksmithItemTipFrame:setVisible(true)

	local var_20_4, var_20_5 = tool.getPositionInScreen(var_0_0.uiTable["btn_select" .. arg_20_0])

	var_0_0.uiTable.blacksmithItemTipFrame:setPosition(ccp(var_20_4 - 100, var_20_5 + 90))
	smgr.rootLayer:addChild(var_20_3, 60000)
end

function var_0_0.handleUpgradeSmithButtonTap(arg_22_0)
	local var_22_0 = var_0_1.blacksmithData.blacksmiths[arg_22_0]
	local var_22_1 = (var_22_0.type == 2 or var_22_0.type == 3) and 75071 or 75024

	messageBox.confirm(language.get(var_22_1, var_22_0.gold), function()
		var_0_1.blacksmithUpgradeSmith(var_22_0.smithId)
	end)
end

function var_0_0.showSelectionList(arg_24_0, arg_24_1)
	local var_24_0 = {
		selectedCallback = function(arg_25_0, arg_25_1)
			blacksmithUI.selectionListDidSelected(arg_25_0, arg_25_1)
		end
	}
	local var_24_1 = 10
	local var_24_2 = var_0_1.blacksmithData.blacksmiths[arg_24_0]

	if var_24_2.goodsType == 3 then
		var_24_1 = 10
	elseif var_24_2.goodsType == 2 then
		var_24_1 = 11
	end

	local var_24_3 = require("lua/layer/activity/activityTab/ChooseEquipPanel").new(var_24_1, arg_24_1, var_24_0)

	var_0_0.selectingPanel = var_24_3

	smgr.getLayer("blacksmithLayer"):addChild(var_24_3, 60000)
end

function var_0_0.selectionListDidSelected(arg_26_0, arg_26_1)
	log.info("selected item :", arg_26_0.pic)

	var_0_0.selectedItemIndex = arg_26_1

	var_0_0.updateSmithSelection(arg_26_0)

	if var_0_0.selectingPanel then
		pcall(var_0_0.selectingPanel.removeFromParentAndCleanup, var_0_0.selectingPanel, true)
	end
end

function var_0_0.onTouchBegin(arg_27_0, arg_27_1)
	if var_0_0.selectionListMask then
		for iter_27_0 = 1, #var_0_1.itemsData do
			var_0_0.uiTable["itemCellBackgroundHighlight" .. iter_27_0]:setVisible(false)

			if tool.checkIfTouch(var_0_0.uiTable["itemCellBackground" .. iter_27_0], arg_27_0, arg_27_1) then
				var_0_0.uiTable["itemCellBackgroundHighlight" .. iter_27_0]:setVisible(true)
			end
		end
	end
end

function var_0_0.onTouchMoved(arg_28_0, arg_28_1)
	return
end

function var_0_0.onTouchEnded(arg_29_0, arg_29_1)
	if var_0_0.selectionListMask then
		for iter_29_0 = 1, #var_0_1.itemsData do
			var_0_0.uiTable["itemCellBackgroundHighlight" .. iter_29_0]:setVisible(false)

			if not var_0_3 and tool.checkIfTouch(var_0_0.uiTable["itemCellBackground" .. iter_29_0], arg_29_0, arg_29_1) then
				var_0_0.uiTable["itemCellBackgroundHighlight" .. iter_29_0]:setVisible(true)
				var_0_0.selectionListDidSelected(var_0_1.itemsData[iter_29_0], iter_29_0)
			end

			if var_0_3 and var_0_0.selectedItemIndex then
				var_0_0.uiTable["itemCellBackgroundHighlight" .. var_0_0.selectedItemIndex]:setVisible(true)
			end
		end
	end
end

function var_0_0.showUpgradeEffect(arg_30_0, arg_30_1)
	if var_0_0.upgradeAnimNode then
		pcall(var_0_0.upgradeAnimNode.removeFromParentAndCleanup, var_0_0.upgradeAnimNode, true)

		var_0_0.upgradeAnimNode = nil
	end

	local var_30_0 = rmgr.getAnimation("warlockUpgrade")
	local var_30_1 = CCAnimation:createWithSpriteFrames(var_30_0, 0.08)
	local var_30_2 = CCAnimate:create(var_30_1)
	local var_30_3 = CCRepeat:create(var_30_2, 1)
	local var_30_4 = CCSprite:create()

	var_0_0.upgradeAnimNode = var_30_4

	local var_30_5 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_30_5:registerScriptTouchHandler(function(arg_31_0, arg_31_1, arg_31_2)
		if arg_31_0 == CCTOUCHBEGAN then
			return true
		elseif arg_31_0 == CCTOUCHMOVED then
			return true
		elseif arg_31_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)
	var_30_5:setTouchEnabled(true)
	var_30_5:addChild(var_30_4, 500)
	var_30_4:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))

	local var_30_6 = CCArray:create()

	var_30_6:addObject(var_30_3)

	local function var_30_7()
		if arg_30_1 then
			arg_30_1()
		end

		pcall(var_30_4.removeFromParentAndCleanup, var_30_4, true)

		var_30_4 = nil

		var_30_5:removeFromParentAndCleanup(true)
	end

	smgr.rootLayer:addChild(var_30_5, 60000)
	var_30_6:addObject(CCCallFuncN:create(var_30_7))
	var_30_4:runAction(CCSequence:create(var_30_6))

	arg_30_0 = arg_30_0 or "res/ui/resource/blacksmith/tjp_upgr.png"

	local var_30_8 = CCSprite:create(arg_30_0)
	local var_30_9, var_30_10 = tool.getPositionInScreen(var_30_4)

	var_30_8:setPosition(ccp(var_30_9, var_30_10 - 50))
	smgr.showTipSpriteText(var_30_8)
end

function var_0_0.showSmithUpgradeEffect()
	local var_33_0 = "res/ui/resource/blacksmith/tjp_char_upgr.png"
	local var_33_1 = CCSprite:create(var_33_0)
	local var_33_2 = visibleSize.width * 0.5
	local var_33_3 = visibleSize.height * 0.5

	var_33_1:setPosition(ccp(var_33_2, var_33_3 - 50))
	smgr.showTipSpriteText(var_33_1)
end

function var_0_0.showBuildingLight()
	var_0_0.uiTable.btn_building:setEnabled(true)
	var_0_0.uiTable.pic_djjr:setVisible(true)
	var_0_0.uiTable.light:setVisible(true)
	var_0_0.uiTable.amountProgressBar:setPercentage(100)
	var_0_0.uiTable.amountValueLabel:setString("100%")

	local var_34_0 = CCArray:create()

	var_34_0:addObject(CCFadeOut:create(0.6))
	var_34_0:addObject(CCFadeIn:create(0.4))

	local var_34_1 = CCSequence:create(var_34_0)

	var_0_0.uiTable.light:runAction(CCRepeatForever:create(var_34_1))
end

function var_0_0.showInvestCopperEffect(arg_35_0)
	local var_35_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_35_0:registerScriptTouchHandler(function(arg_36_0, arg_36_1, arg_36_2)
		if arg_36_0 == CCTOUCHBEGAN then
			return true
		elseif arg_36_0 == CCTOUCHMOVED then
			return true
		elseif arg_36_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)
	var_35_0:setTouchEnabled(arg_35_0 > 1)
	smgr.rootLayer:addChild(var_35_0, 60000)

	for iter_35_0 = 1, arg_35_0 do
		local var_35_1 = CCSprite:create("res/ui/general/jailView/laofang_tit_jzjd.png")

		var_35_0:addChild(var_35_1)
		var_35_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 60))
		var_35_1:setOpacity(0)

		local var_35_2 = CCArray:create()

		var_35_2:addObject(CCDelayTime:create((iter_35_0 - 1) * 0.3))
		var_35_2:addObject(CCFadeIn:create(0.1))
		var_35_2:addObject(CCMoveBy:create(0.6, ccp(0, 120)))
		var_35_2:addObject(CCFadeOut:create(0.5))
		var_35_2:addObject(CCCallFunc:create(function()
			if iter_35_0 == arg_35_0 then
				var_35_0:removeFromParentAndCleanup(true)

				if var_0_5 then
					var_0_0.showUpgradeEffect("res/ui/resource/blacksmith/tjp_build.png", var_0_0.showBuildingLight)

					var_0_5 = false
				end
			end
		end))
		var_35_1:runAction(CCSequence:create(var_35_2))
	end
end
