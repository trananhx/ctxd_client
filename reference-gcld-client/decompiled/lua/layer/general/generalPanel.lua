require("lua/component/timerLabel")

local var_0_0 = {
	strenthup = "yongmengli.png",
	zsup = "zhashujiaqiang.png",
	leadup = "tongshuaili.png",
	gbkz = "gongbingkezhi.png",
	bbkz = "bubingkezhi.png",
	qbkz = "qibingkezhi.png",
	hpup = "juexingxueliang.png",
	ssyz = "ssyz.png"
}
local var_0_1 = {
	[103] = {
		pic2 = "halfPic_zhouyujx.png",
		txtId = 490733,
		pic1 = "zhouyu2.png"
	},
	[202] = {
		pic1 = "zhangfei2.png",
		pic2 = "halfPic_zhangfeijx.png"
	},
	[203] = {
		pic1 = "guanyu2.png",
		pic2 = "halfPic_guanyujx.png"
	},
	[204] = {
		pic2 = "halfPic_zhaoyunjx.png",
		txtId = 490732,
		pic1 = "zhaoyun2.png"
	},
	[269] = {
		pic2 = "halfPic_zhugeliangjx.png",
		txtId = 490734,
		pic1 = "zhugeliang2.png"
	},
	[270] = {
		pic2 = "halfPic_zhenxiahoudunjx.png",
		txtId = 490732,
		pic1 = "zhenxiahoudunjx2.png"
	},
	[230] = {
		pic2 = "halfPic_zhenganningjx.png",
		txtId = 490735,
		pic1 = "zhenganningjx.png"
	},
	[224] = {
		pic2 = "halfPic_zhoutaijx.png",
		txtId = 490736,
		pic1 = "zhoutai2.png"
	},
	[201] = {
		pic2 = "halfPic_lvbujx.png",
		txtId = 490737,
		pic1 = "lvbu2.png"
	},
	[275] = {
		pic2 = "halfPic_huangyueyingjx.png",
		txtId = 490738,
		pic1 = "huangyueying2.png"
	}
}
local var_0_2 = {
	y = 19,
	name = "equipStoreView",
	type = "TableView",
	visible = false,
	x = 19,
	viewSize = CCSizeMake(405, 96),
	dirction = kCCScrollViewDirectionHorizontal
}
local var_0_3 = {
	y = 19,
	name = "equipStoreView",
	type = "TableView",
	visible = false,
	x = 19,
	viewSize = CCSizeMake(270, 96),
	dirction = kCCScrollViewDirectionHorizontal
}
local var_0_4 = {}

var_0_4.EquipTag = 1001
var_0_4.TipTag = 1002
var_0_4.DeputyTag = 1003
var_0_4.GenNameTipTag = 2000
var_0_4.GenTipsTag = 2001
var_0_4.generalState = {}
var_0_4.generalState.idle = 0
var_0_4.generalState.conscription = 1
var_0_4.generalState.instanceWar = 2
var_0_4.generalState.countryWar = 3
var_0_4.generalState.officialWar = 4
var_0_4.generalState.find = 5
var_0_4.generalState.move = 6
var_0_4.generalState.mineWar = 7
var_0_4.generalState.rankingWar = 8
var_0_4.generalState.cityWar = 10
var_0_4.generalState.pvpOne = 13
var_0_4.generalState.savageWar = 14
var_0_4.generalState.pvpSavage = 15
var_0_4.generalState.armyGroup = 16
var_0_4.generalState.biwu = 17
var_0_4.generalState.eventWar = 18
var_0_4.generalState.storyWar = 19
var_0_4.generalState.pvpOneInStory = 20
var_0_4.generalState.eventInStory = 21
var_0_4.generalState.prison = 22
var_0_4.generalState.escape = 23

local var_0_5 = false
local var_0_6 = false
local var_0_7 = false

function var_0_4.create(arg_1_0, arg_1_1)
	local var_1_0 = createBaseLayer()
	local var_1_1 = {}

	var_1_1.token = 0
	var_1_1.generalSelectorPanel = nil
	var_1_1.generals = nil
	var_1_1.selectGeneral = nil
	var_1_1.selectWearedEquip = nil
	var_1_1.equipToWear = nil
	var_1_1.selectEquipToWearIndex = nil
	var_1_1.equipHasWeared = nil
	var_1_1.treasure = nil
	var_1_1.storeItems = nil

	local var_1_2 = CCSprite:createWithSpriteFrameName("general_zhongdi.jpg")

	var_1_2:setPosition(ccp(var_1_2:getContentSize().width * 0.5 + 120, var_1_2:getContentSize().height * 0.5 + 15))
	var_1_0:addChild(var_1_2)

	local var_1_3 = require("res/layout/general/general")
	local var_1_4 = {}

	uiutil.initWidgets(var_1_4, var_1_3)
	var_1_2:addChild(var_1_4.widgets.root)

	if conf.language == "tha" then
		var_1_4.widgets.num_zgjn_bg:setPositionX(var_1_4.widgets.num_zgjn_bg:getPositionX() + 30)
	end

	local function var_1_5(arg_2_0, arg_2_1, arg_2_2)
		if var_1_4.widgets.equipTipPanel:isVisible() then
			if not tool.checkIfTouch(var_1_4.widgets.equipTipPanel, arg_2_1, arg_2_2) then
				return false
			else
				return true
			end
		else
			return false
		end
	end

	var_1_4.widgets.equipTipPanel:registerScriptTouchHandler(var_1_5, false, true)
	var_1_4.widgets.equipTipPanel:setTouchEnabled(true)

	local function var_1_6(arg_3_0, arg_3_1, arg_3_2)
		if var_1_4.widgets.strategyTipPanel:isVisible() then
			if not tool.checkIfTouch(var_1_4.widgets.strategyTipPanel, arg_3_1, arg_3_2) then
				var_1_4.widgets.strategyTipPanel:setVisible(false)
			end

			return true
		else
			return false
		end
	end

	var_1_4.widgets.strategyTipPanel:registerScriptTouchHandler(var_1_6, false, true)
	var_1_4.widgets.strategyTipPanel:setTouchEnabled(true)

	function var_1_1.createAttributeChangeTips(arg_4_0, arg_4_1)
		rmgr.loadResource("res/ui/common/attribute.plist")

		local var_4_0
		local var_4_1
		local var_4_2
		local var_4_3 = CCNode:create()
		local var_4_4

		if arg_4_1 > 0 then
			if arg_4_0 == "att" then
				var_4_0 = "res/ui/common/text/genealPanel/general_addAttribute_att.png"
			elseif arg_4_0 == "def" then
				var_4_0 = "res/ui/common/text/genealPanel/general_addAttribute_def.png"
			elseif arg_4_0 == "hp" then
				var_4_0 = "res/ui/common/text/genealPanel/general_addAttribute_hp.png"
			elseif arg_4_0 == "tong" then
				var_4_0 = "res/ui/common/text/genealPanel/general_addAttribute_tong.png"
			elseif arg_4_0 == "yong" then
				var_4_0 = "res/ui/common/text/genealPanel/general_addAttribute_yong.png"
			end

			var_4_1 = "res/ui/common/text/genealPanel/general_attribute_jiahao.png"
			var_4_4 = "res/ui/common/number/addAttributeNum.png"
		else
			if arg_4_0 == "att" then
				var_4_0 = "res/ui/common/text/genealPanel/general_decreaseAttribute_att.png"
			elseif arg_4_0 == "def" then
				var_4_0 = "res/ui/common/text/genealPanel/general_decreaseAttribute_def.png"
			elseif arg_4_0 == "hp" then
				var_4_0 = "res/ui/common/text/genealPanel/general_decreaseAttribute_hp.png"
			elseif arg_4_0 == "tong" then
				var_4_0 = "res/ui/common/text/genealPanel/general_decreaseAttribute_tong.png"
			elseif arg_4_0 == "yong" then
				var_4_0 = "res/ui/common/text/genealPanel/general_decreaseAttribute_yong.png"
			end

			var_4_1 = "res/ui/common/text/genealPanel/general_attribute_jianhao.png"
			var_4_4 = "res/ui/common/number/decreaseAttributeNum.png"
		end

		local var_4_5 = CCSprite:create(var_4_0)

		var_4_5:setPosition(ccp(var_4_5:getContentSize().width * 0.5, 0))

		local var_4_6 = CCSprite:create(var_4_1)

		var_4_6:setPosition(ccp(var_4_5:getContentSize().width + var_4_6:getContentSize().width * 0.5, 0))

		local var_4_7 = CCLabelAtlas:create(math.abs(arg_4_1), var_4_4, 29, 46, 48)

		var_4_7:setPosition(ccp(var_4_5:getContentSize().width + var_4_6:getContentSize().width, -var_4_7:getContentSize().height * 0.5))
		var_4_3:addChild(var_4_5)
		var_4_3:addChild(var_4_6)
		var_4_3:addChild(var_4_7)

		return var_4_3
	end

	function var_1_1.showAttributeChangeTip(arg_5_0)
		local var_5_0 = CCNode:create()
		local var_5_1 = 0

		if arg_5_0.attReduce or arg_5_0.att then
			local var_5_2 = arg_5_0.attReduce or arg_5_0.att - var_1_1.selectGeneral.att

			if var_5_2 ~= 0 then
				local var_5_3 = var_1_1.createAttributeChangeTips("att", var_5_2)

				var_5_3:setPosition(ccp(0, var_5_1 * 43))
				var_5_0:addChild(var_5_3)

				var_5_1 = var_5_1 + 1
			end
		end

		if arg_5_0.defReduce or arg_5_0.def then
			local var_5_4 = arg_5_0.defReduce or arg_5_0.def - var_1_1.selectGeneral.def

			if var_5_4 ~= 0 then
				local var_5_5 = var_1_1.createAttributeChangeTips("def", var_5_4)

				var_5_5:setPosition(ccp(0, var_5_1 * 43))
				var_5_0:addChild(var_5_5)

				var_5_1 = var_5_1 + 1
			end
		end

		if arg_5_0.bloodReduce or arg_5_0.forcesMax then
			local var_5_6 = arg_5_0.bloodReduce or arg_5_0.forcesMax - var_1_1.selectGeneral.forcesMax

			if var_5_6 ~= 0 then
				local var_5_7 = var_1_1.createAttributeChangeTips("hp", var_5_6)

				var_5_7:setPosition(ccp(0, var_5_1 * 43))
				var_5_0:addChild(var_5_7)

				var_5_1 = var_5_1 + 1
			end
		end

		if arg_5_0.att1 and arg_5_0.att1 ~= 0 then
			local var_5_8 = var_1_1.createAttributeChangeTips("tong", arg_5_0.att1)

			var_5_8:setPosition(ccp(0, var_5_1 * 43))
			var_5_0:addChild(var_5_8)

			var_5_1 = var_5_1 + 1
		end

		if arg_5_0.att2 and arg_5_0.att2 ~= 0 then
			local var_5_9 = var_1_1.createAttributeChangeTips("yong", arg_5_0.att2)

			var_5_9:setPosition(ccp(0, var_5_1 * 43))
			var_5_0:addChild(var_5_9)

			local var_5_10 = var_5_1 + 1
		end

		var_5_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))

		local var_5_11 = smgr.getLayer("tipLayer")

		local function var_5_12()
			var_5_11:removeChild(var_5_0, true)
		end

		local var_5_13 = CCArray:create()
		local var_5_14 = CCMoveBy:create(1, ccp(0, 30))
		local var_5_15 = CCCallFuncN:create(var_5_12)

		var_5_13:addObject(var_5_14)
		var_5_13:addObject(var_5_15)

		local var_5_16 = CCSequence:create(var_5_13)

		var_5_0:runAction(var_5_16)
		var_5_11:addChild(var_5_0)
	end

	function var_1_1.lostEquipItemForce()
		if var_1_1.selectEquipToWearIndex then
			local var_7_0 = var_1_4.widgets.equipStoreView:cellAtIndex(var_1_1.selectEquipToWearIndex)

			if var_7_0 then
				local var_7_1 = var_7_0:getChildByTag(101)

				if var_7_1 then
					var_7_1:setVisible(false)
				end
			end

			var_1_1.selectEquipToWearIndex = nil
		end

		if var_1_1.selectWearedEquip then
			var_1_4.widgets.juexingtackoffButton:setVisible(false)
			var_1_1.selectWearedEquip:setHighlighted(false)

			var_1_1.selectWearedEquip = nil
		end
	end

	function var_1_1.getEquipItemForce()
		if var_1_1.selectEquipToWearIndex then
			local var_8_0 = var_1_4.widgets.equipStoreView:cellAtIndex(var_1_1.selectEquipToWearIndex)

			if var_8_0 then
				local var_8_1 = var_8_0:getChildByTag(101)

				if var_8_1 then
					var_8_1:setVisible(true)
				end
			end
		end

		if var_1_1.selectWearedEquip then
			var_1_4.widgets.juexingtackoffButton:setVisible(true)
			var_1_1.selectWearedEquip:setHighlighted(true)
		end
	end

	function var_1_1.tableCellHightLight(arg_9_0, arg_9_1)
		local var_9_0 = arg_9_1:getChildByTag(101)

		if var_9_0 then
			var_9_0:setVisible(true)
		end
	end

	function var_1_1.tableCellUnHightLight(arg_10_0, arg_10_1)
		local var_10_0 = arg_10_1:getChildByTag(101)

		if var_10_0 then
			var_10_0:setVisible(false)
		end
	end

	function var_1_1.tableCellTouched(arg_11_0, arg_11_1)
		local var_11_0 = arg_11_1:getIdx()

		var_1_1.lostEquipItemForce()

		var_1_1.selectEquipToWearIndex = var_11_0

		var_1_1.getEquipItemForce()

		local var_11_1 = var_1_1.storeItems[var_11_0 + 1]

		if var_11_1 then
			if not var_11_1.isTreasure and var_1_1.selectGeneral.equips then
				local var_11_2 = var_11_1.type

				for iter_11_0, iter_11_1 in pairs(var_1_1.selectGeneral.equips) do
					if iter_11_1.vId == nil and iter_11_1.type == var_11_2 then
						var_1_1.changeEquip(false)

						return
					end
				end
			elseif var_1_1.selectGeneral.generalLv >= 35 and not var_1_1.treasure then
				var_1_1.changeTreasure2(var_11_1)
			end

			var_1_1.showEquipTip(var_1_1.selectGeneral, var_11_1, false, var_11_1.isTreasure == true, var_11_1.isYcbw == true)
		end
	end

	function var_1_1.cellSizeForTable(arg_12_0, arg_12_1)
		return 96, 96
	end

	function var_1_1.tableCellAtIndex(arg_13_0, arg_13_1)
		local var_13_0 = arg_13_0:dequeueCell()

		if var_13_0 then
			var_13_0:removeAllChildrenWithCleanup(true)
		else
			var_13_0 = CCTableViewCell:new()
		end

		local var_13_1 = CCSprite:createWithSpriteFrameName("general_depot_list_bg.jpg")

		var_13_1:setAnchorPoint(CCPointMake(0, 0))
		var_13_1:setPosition(CCPointMake(1, 0))

		local var_13_2 = CCSprite:createWithSpriteFrameName("general_depot_list_bg_on.jpg")

		var_13_2:setAnchorPoint(CCPointMake(0, 0))
		var_13_2:setPosition(CCPointMake(1, 0))
		var_13_2:setVisible(false)
		var_13_0:addChild(var_13_1)
		var_13_0:addChild(var_13_2, 0, 101)

		local var_13_3 = var_1_1.storeItems[arg_13_1 + 1]

		if var_13_3 then
			local var_13_4 = "qWhite.png"

			if var_13_3.quality == 2 then
				var_13_4 = "qBlue.png"
			elseif var_13_3.quality == 3 then
				var_13_4 = "qGreen.png"
			elseif var_13_3.quality == 4 then
				var_13_4 = "qYellow.png"
			elseif var_13_3.quality == 5 then
				var_13_4 = "qRed.png"
			elseif var_13_3.quality == 6 then
				var_13_4 = "qViolet.png"
			end

			local var_13_5 = CCSprite:createWithSpriteFrameName(var_13_4)

			var_13_5:setPosition(ccp(48, 48))
			var_13_0:addChild(var_13_5)

			local var_13_6 = CCSprite:createWithSpriteFrameName(string.format("%s.jpg", var_13_3.pic))

			var_13_6:setPosition(ccp(38, 38))
			var_13_5:addChild(var_13_6, 100)

			if var_13_3.maxSkillNum and var_13_3.maxSkillNum > 0 then
				local var_13_7 = 0
				local var_13_8 = var_13_3.maxSkillNum

				if var_13_3.refreshAttribute then
					var_13_7 = #var_13_3.refreshAttribute
					var_13_8 = var_13_8 - var_13_7
				end

				local var_13_9 = 9
				local var_13_10 = 9

				if var_13_8 > 0 or var_13_7 > 0 then
					local var_13_11 = CCLayerColor:create(ccc4(0, 0, 0, 175))

					var_13_11:setContentSize(CCSizeMake(72, 18))
					var_13_6:addChild(var_13_11)
				end

				for iter_13_0 = 1, var_13_7 do
					local var_13_12 = CCSprite:createWithSpriteFrameName("star_light.png")

					var_13_12:setPosition(ccp(var_13_9, var_13_10))
					var_13_12:setScale(0.75)
					var_13_6:addChild(var_13_12, 200)

					var_13_9 = var_13_9 + 18
				end

				for iter_13_1 = 1, var_13_8 do
					local var_13_13 = CCSprite:createWithSpriteFrameName("star_dark.png")

					var_13_13:setPosition(ccp(var_13_9, var_13_10))
					var_13_6:addChild(var_13_13, 200)
					var_13_13:setScale(0.75)

					var_13_9 = var_13_9 + 18
				end
			end
		end

		if arg_13_1 == 0 and (user.curMainTask.taskId == 30 or user.curMainTask.taskId == 24 or user.curMainTask.taskId == 48 or user.curMainTask.taskId == 60 or user.curMainTask.taskId == 690 or user.curMainTask.taskId == 860) and user.curMainTask.state == 1 then
			var_1_1.tempGuideCell = var_13_0
		end

		return var_13_0
	end

	function var_1_1.numberOfCellsInTableView(arg_14_0)
		local var_14_0 = #var_1_1.storeItems

		if var_14_0 then
			return var_14_0
		else
			return 0
		end
	end

	function var_1_1.handlerChangeTreasure(arg_15_0)
		local var_15_0 = arg_15_0.action.data

		var_1_1.showAttributeChangeTip(var_15_0)
		var_1_1.getGeneralInfo()
	end

	function var_1_1.takeOffTreasure()
		if arg_1_1.iskfgz then
			smgr.showTipTextGreen(language.get(410306))

			return
		end

		if var_1_1.treasure then
			cmgr.sendRequest(var_1_1.handlerChangeTreasure, actions.changeTreasure, var_1_1.selectGeneral.generalId, var_1_1.treasure.vId)
		end
	end

	function var_1_1.handlerChangeYcbw(arg_17_0)
		local var_17_0 = arg_17_0.action.data

		print("======handlerChangeYcbw================")
		showTable(var_17_0)

		if var_17_0.att then
			var_17_0.attReduce = var_17_0.att
			var_17_0.att = nil
		end

		if var_17_0.def then
			var_17_0.defReduce = var_17_0.def
			var_17_0.def = nil
		end

		if var_17_0.blood then
			var_17_0.bloodReduce = var_17_0.blood
			var_17_0.blood = nil
		end

		var_1_1.showAttributeChangeTip(var_17_0)
		var_1_1.getGeneralInfo()
	end

	function var_1_1.takeOffYcbw()
		if arg_1_1.iskfgz then
			smgr.showTipTextGreen(language.get(410306))

			return
		end

		local var_18_0 = var_1_1["ycbw" .. var_1_1.ycbwPos]

		if var_18_0 then
			cmgr.sendRequest(var_1_1.handlerChangeYcbw, actions.takeoffYcbw, var_18_0.vId)
		end
	end

	function var_1_1.changeYcbw()
		if arg_1_1.iskfgz then
			smgr.showTipTextGreen(language.get(410306))

			return
		end

		local var_19_0 = var_1_1.storeItems[var_1_1.selectEquipToWearIndex + 1]

		if var_19_0 then
			cmgr.sendRequest(var_1_1.handlerChangeYcbw, actions.wearYcbw, var_1_1.selectGeneral.generalId, var_1_1.ycbwPos, var_19_0.vId)
		end
	end

	function var_1_1.changeTreasure2(arg_20_0)
		if arg_1_1.iskfgz then
			smgr.showTipTextGreen(language.get(410306))

			return
		end

		if arg_20_0 then
			cmgr.sendRequest(var_1_1.handlerChangeTreasure, actions.changeTreasure, var_1_1.selectGeneral.generalId, arg_20_0.vId)
		end
	end

	function var_1_1.changeTreasure()
		local var_21_0 = var_1_1.storeItems[var_1_1.selectEquipToWearIndex + 1]

		var_1_1.changeTreasure2(var_21_0)
	end

	function var_1_1.handlerTakeOffEquip(arg_22_0)
		local var_22_0 = arg_22_0.action.data

		local function var_22_1()
			var_1_1.takeOffEquip(true)
		end

		if var_22_0.reload == false then
			messageBox.confirm(var_22_0.info, var_22_1, language.get(10001))
		else
			var_1_1.showAttributeChangeTip(var_22_0)
			var_1_1.getGeneralInfo()
		end
	end

	function var_1_1.takeOffEquip(arg_24_0)
		if arg_1_1.iskfgz then
			smgr.showTipTextGreen(language.get(410306))

			return
		end

		if var_1_1.equipHasWeared then
			cmgr.sendRequest(var_1_1.handlerTakeOffEquip, actions.unloadEquip, var_1_1.selectGeneral.generalId, var_1_1.equipHasWeared.vId, var_1_1.equipHasWeared.type, arg_24_0)
		end
	end

	function var_1_1.OnTakeOffEquip(arg_25_0, arg_25_1)
		var_1_1.takeOffEquip(false)
	end

	function var_1_1.handlerChangeEquip(arg_26_0)
		local var_26_0 = arg_26_0.action.data

		local function var_26_1()
			var_1_1.changeEquip(true)
		end

		if var_26_0.reload == false then
			messageBox.confirm(var_26_0.info, var_26_1, language.get(10001))
		else
			var_1_1.showAttributeChangeTip(var_26_0)
			var_1_1.getGeneralInfo()
		end
	end

	function var_1_1.changeEquip(arg_28_0)
		if arg_1_1.iskfgz then
			smgr.showTipTextGreen(language.get(410306))

			return
		end

		local var_28_0 = var_1_1.storeItems[var_1_1.selectEquipToWearIndex + 1]

		if var_28_0 then
			cmgr.sendRequest(var_1_1.handlerChangeEquip, actions.changeEquip, var_1_1.selectGeneral.generalId, var_28_0.vId, var_28_0.type, arg_28_0)
		end
	end

	function var_1_1.onChangeEquip(arg_29_0, arg_29_1)
		var_1_1.changeEquip(false)
	end

	function var_1_1.showEquips(arg_30_0, arg_30_1)
		var_1_1.storeItems = arg_30_0

		if var_1_1.selectGeneral.evoke == 2 and arg_30_1 == true then
			local var_30_0 = {}
			local var_30_1 = 1

			for iter_30_0, iter_30_1 in pairs(arg_30_0) do
				if iter_30_1.att and iter_30_1.def and iter_30_1.blood then
					var_30_0[var_30_1] = iter_30_1
					var_30_1 = var_30_1 + 1
				end
			end

			var_1_1.storeItems = var_30_0
		end

		var_1_4.widgets.equipStoreView:registerScriptHandler(var_1_1.tableCellHightLight, CCTableView.kTableCellHighLight)
		var_1_4.widgets.equipStoreView:registerScriptHandler(var_1_1.tableCellUnHightLight, CCTableView.kTableCellUnhighLight)
		var_1_4.widgets.equipStoreView:registerScriptHandler(var_1_1.tableCellTouched, CCTableView.kTableCellTouched)
		var_1_4.widgets.equipStoreView:registerScriptHandler(var_1_1.cellSizeForTable, CCTableView.kTableCellSizeForIndex)
		var_1_4.widgets.equipStoreView:registerScriptHandler(var_1_1.tableCellAtIndex, CCTableView.kTableCellSizeAtIndex)
		var_1_4.widgets.equipStoreView:registerScriptHandler(var_1_1.numberOfCellsInTableView, CCTableView.kNumberOfCellsInTableView)
		var_1_4.widgets.equipStoreView:reloadData()
	end

	function var_1_1.createSuitTips(arg_31_0, arg_31_1)
		local var_31_0 = require("res/layout/general/equipTips")
		local var_31_1 = {}

		uiutil.initUIComponent(nil, var_31_1, var_31_0.suitTip)
		var_31_1.suitAttAllLabel:setString(language.get(30103, arg_31_0.rewardAtt, arg_31_0.rewardDef, arg_31_0.rewardBlood))
		var_31_1.suitNameLabel:setString(arg_31_0.equipSuitName)

		if conf.language == "vie" then
			var_31_1.attr1Label4:setString(arg_31_1.refreshAttribute[4].attrName .. " Lv." .. arg_31_1.refreshAttribute[4].attValue)
			var_31_1.attr1Label4Desc:setString(arg_31_1.refreshAttribute[4].attIntro)
			var_31_1.attr1Label3:setString(arg_31_1.refreshAttribute[3].attrName .. " Lv." .. arg_31_1.refreshAttribute[3].attValue)
			var_31_1.attr1Label3Desc:setString(arg_31_1.refreshAttribute[3].attIntro)
			var_31_1.attr1Label2:setString(arg_31_1.refreshAttribute[2].attrName .. " Lv." .. arg_31_1.refreshAttribute[2].attValue)
			var_31_1.attr1Label2Desc:setString(arg_31_1.refreshAttribute[2].attIntro)
			var_31_1.attr1Label:setString(arg_31_1.refreshAttribute[1].attrName .. " Lv." .. arg_31_1.refreshAttribute[1].attValue)
			var_31_1.attr1LabelDesc:setString(arg_31_1.refreshAttribute[1].attIntro)
		else
			var_31_1.attr1Labe4:setString(language.get(30104, arg_31_1.refreshAttribute[4].attrName, arg_31_1.refreshAttribute[4].attValue, arg_31_1.refreshAttribute[4].attIntro))
			var_31_1.attr1Labe3:setString(language.get(30104, arg_31_1.refreshAttribute[3].attrName, arg_31_1.refreshAttribute[3].attValue, arg_31_1.refreshAttribute[3].attIntro))
			var_31_1.attr1Labe2:setString(language.get(30104, arg_31_1.refreshAttribute[2].attrName, arg_31_1.refreshAttribute[2].attValue, arg_31_1.refreshAttribute[2].attIntro))
			var_31_1.attr1Label:setString(language.get(30104, arg_31_1.refreshAttribute[1].attrName, arg_31_1.refreshAttribute[1].attValue, arg_31_1.refreshAttribute[1].attIntro))
		end

		var_31_1.xianlianLabel:setString(language.get(30105, arg_31_1.maxLv))

		local var_31_2

		if arg_31_1.type == 1 then
			var_31_2 = language.get(82002, arg_31_1.attribute)
		elseif arg_31_1.type == 2 then
			var_31_2 = language.get(82002, arg_31_1.attribute)
		elseif arg_31_1.type == 3 then
			var_31_2 = language.get(82003, arg_31_1.attribute)
		elseif arg_31_1.type == 4 then
			var_31_2 = language.get(82003, arg_31_1.attribute)
		elseif arg_31_1.type == 5 then
			var_31_2 = language.get(82004, arg_31_1.attribute)
		elseif arg_31_1.type == 6 then
			var_31_2 = language.get(82004, arg_31_1.attribute)
		end

		var_31_1.attributeLabel:setString(var_31_2)
		var_31_1.equipNameLabel:setString(arg_31_1.itemName)

		local var_31_3 = 0
		local var_31_4 = table.getn(arg_31_1.refreshAttribute)

		for iter_31_0 = 1, var_31_4 do
			local var_31_5 = CCSprite:createWithSpriteFrameName("star_light.png")

			var_31_5:setPosition(ccp(var_31_3, 0))

			var_31_3 = var_31_3 + var_31_5:getContentSize().width + 5

			var_31_1.starNode:addChild(var_31_5)
		end

		return var_31_1.tipPanel
	end

	function var_1_1.createYcbwTips(arg_32_0)
		local var_32_0 = require("res/layout/general/equipTips")
		local var_32_1 = {}

		uiutil.initUIComponent(nil, var_32_1, var_32_0.ycbwTip)

		local var_32_2 = colorQuality[arg_32_0.quality]

		var_32_1.ycbwName:setString(arg_32_0.name)
		var_32_1.ycbwName:setColor(var_32_2)
		var_32_1.infoLabel:setString(arg_32_0.attribute)

		return var_32_1.tipPanel
	end

	function var_1_1.createTreasureTips(arg_33_0)
		local var_33_0 = require("res/layout/general/equipTips")
		local var_33_1 = {}

		uiutil.initUIComponent(nil, var_33_1, var_33_0.treasureTip)

		local var_33_2 = colorQuality[arg_33_0.quality]

		var_33_1.treasureName:setString(arg_33_0.name)
		var_33_1.treasureName:setColor(var_33_2)
		var_33_1.attTongLabel:setString(language.get(30201, arg_33_0.att1))
		var_33_1.attYongLabel:setString(language.get(30202, arg_33_0.att2))

		return var_33_1.tipPanel
	end

	function var_1_1.createEquipTips(arg_34_0)
		local var_34_0 = require("res/layout/general/equipTips")
		local var_34_1 = {}

		uiutil.initUIComponent(nil, var_34_1, var_34_0.equipTip)
		var_34_1.equipNameLabel:setString(arg_34_0.itemName)
		var_34_1.equipNameLabel:setColor(colorQuality[arg_34_0.quality or 6])

		local var_34_2

		if arg_34_0.type == 1 then
			var_34_2 = language.get(82002, arg_34_0.attribute)
		elseif arg_34_0.type == 2 then
			var_34_2 = language.get(82002, arg_34_0.attribute)
		elseif arg_34_0.type == 3 then
			var_34_2 = language.get(82003, arg_34_0.attribute)
		elseif arg_34_0.type == 4 then
			var_34_2 = language.get(82003, arg_34_0.attribute)
		elseif arg_34_0.type == 5 then
			var_34_2 = language.get(82004, arg_34_0.attribute)
		elseif arg_34_0.type == 6 then
			var_34_2 = language.get(82004, arg_34_0.attribute)
		end

		var_34_1.attributeLabel:setString(var_34_2)

		if arg_34_0.maxLv then
			var_34_1.xianlianLabel:setString(language.get(30105, arg_34_0.maxLv))
		end

		if arg_34_0.refreshAttribute then
			if arg_34_0.refreshAttribute[1] then
				var_34_1.star1:setVisible(true)

				if conf.language == "vie" then
					var_34_1.attr1Label:setString(arg_34_0.refreshAttribute[1].attrName .. " Lv." .. arg_34_0.refreshAttribute[1].attValue)
					var_34_1.attr1LabelDesc:setString(arg_34_0.refreshAttribute[1].attIntro)
				else
					var_34_1.attr1Label:setString(language.get(30104, arg_34_0.refreshAttribute[1].attrName, arg_34_0.refreshAttribute[1].attValue, arg_34_0.refreshAttribute[1].attIntro))
				end
			end

			if arg_34_0.refreshAttribute[2] then
				var_34_1.star2:setVisible(true)

				if conf.language == "vie" then
					var_34_1.attr1Label2:setString(arg_34_0.refreshAttribute[2].attrName .. " Lv." .. arg_34_0.refreshAttribute[2].attValue)
					var_34_1.attr1Label2Desc:setString(arg_34_0.refreshAttribute[2].attIntro)
				else
					var_34_1.attr1Labe2:setString(language.get(30104, arg_34_0.refreshAttribute[2].attrName, arg_34_0.refreshAttribute[2].attValue, arg_34_0.refreshAttribute[2].attIntro))
				end
			end

			if arg_34_0.refreshAttribute[3] then
				var_34_1.star3:setVisible(true)

				if conf.language == "vie" then
					var_34_1.attr1Label3:setString(arg_34_0.refreshAttribute[3].attrName .. " Lv." .. arg_34_0.refreshAttribute[3].attValue)
					var_34_1.attr1Label3Desc:setString(arg_34_0.refreshAttribute[3].attIntro)
				else
					var_34_1.attr1Labe3:setString(language.get(30104, arg_34_0.refreshAttribute[3].attrName, arg_34_0.refreshAttribute[3].attValue, arg_34_0.refreshAttribute[3].attIntro))
				end
			end

			if arg_34_0.refreshAttribute[4] then
				var_34_1.star4:setVisible(true)

				if conf.language == "vie" then
					var_34_1.attr1Label4:setString(arg_34_0.refreshAttribute[4].attrName .. " Lv." .. arg_34_0.refreshAttribute[4].attValue)
					var_34_1.attr1Label4Desc:setString(arg_34_0.refreshAttribute[4].attIntro)
				else
					var_34_1.attr1Labe4:setString(language.get(30104, arg_34_0.refreshAttribute[4].attrName, arg_34_0.refreshAttribute[4].attValue, arg_34_0.refreshAttribute[4].attIntro))
				end
			end
		end

		local var_34_3 = 0
		local var_34_4 = 0

		if arg_34_0.refreshAttribute then
			var_34_4 = table.getn(arg_34_0.refreshAttribute)
		end

		for iter_34_0 = 1, var_34_4 do
			local var_34_5 = CCSprite:createWithSpriteFrameName("star_light.png")

			var_34_5:setPosition(ccp(var_34_3, 0))

			var_34_3 = var_34_3 + var_34_5:getContentSize().width + 5

			var_34_1.starNode:addChild(var_34_5)
		end

		if arg_34_0.maxSkillNum then
			local var_34_6 = arg_34_0.maxSkillNum - var_34_4

			for iter_34_1 = 1, var_34_6 do
				local var_34_7 = CCSprite:createWithSpriteFrameName("star_dark.png")

				var_34_7:setPosition(ccp(var_34_3, 0))

				var_34_3 = var_34_3 + var_34_7:getContentSize().width + 5

				var_34_1.starNode:addChild(var_34_7)
			end
		end

		return var_34_1.tipPanel
	end

	function var_1_1.createTipsForWearSuit(arg_35_0)
		local var_35_0 = require("res/layout/general/equipTips")
		local var_35_1 = {}

		uiutil.initUIComponent(nil, var_35_1, var_35_0.wearSuitTips)
		var_35_1.suitIntroLabel:setString(arg_35_0.suitIntro)
		var_35_1.equip1Label:setString(language.get(30302, arg_35_0.subEquips[1].equipName, arg_35_0.subEquips[1].skillName, arg_35_0.subEquips[1].skillLv))
		var_35_1.equip2Label:setString(language.get(30302, arg_35_0.subEquips[2].equipName, arg_35_0.subEquips[2].skillName, arg_35_0.subEquips[2].skillLv))
		var_35_1.equip3Label:setString(language.get(30302, arg_35_0.subEquips[3].equipName, arg_35_0.subEquips[3].skillName, arg_35_0.subEquips[3].skillLv))
		var_35_1.equip4Label:setString(language.get(30302, arg_35_0.subEquips[4].equipName, arg_35_0.subEquips[4].skillName, arg_35_0.subEquips[4].skillLv))
		var_35_1.equip5Label:setString(language.get(30302, arg_35_0.subEquips[5].equipName, arg_35_0.subEquips[5].skillName, arg_35_0.subEquips[5].skillLv))
		var_35_1.equip6Label:setString(language.get(30302, arg_35_0.subEquips[6].equipName, arg_35_0.subEquips[6].skillName, arg_35_0.subEquips[6].skillLv))
		var_35_1.suitAttAllLabel:setString(language.get(30103, arg_35_0.att, arg_35_0.def, arg_35_0.blood))
		var_35_1.suitNameLabel:setString(arg_35_0.itemName)

		return var_35_1.tipPanel
	end

	function var_1_1.createTipsForWearJiSuit(arg_36_0)
		local var_36_0 = require("res/layout/general/equipTips")
		local var_36_1 = {}

		uiutil.initUIComponent(nil, var_36_1, var_36_0.wearJiSuitTips)
		var_36_1.suitIntroLabel:setString(arg_36_0.suitIntro)
		var_36_1.suitIntroLabel:setColor(ccc3(255, 255, 255))
		var_36_1.suitIntroLabel:setPosition(ccp(17, 130))

		if var_36_1.fengexian and var_36_1.title4 then
			var_36_1.fengexian:setVisible(true)
			var_36_1.title4:setVisible(false)
		end

		if arg_36_0.bestSuitInfo then
			local var_36_2 = arg_36_0.bestSuitInfo

			var_36_1.suitIntroLabel:setColor(ccc3(255, 255, 0))
			var_36_1.suitIntroLabel:setAnchorPoint(ccp(0, 1))
			var_36_1.suitIntroLabel:setPosition(ccp(17, 200))
			var_36_1.suitIntroLabel:setString(language.get(30103, var_36_2.attAdd, var_36_2.defAdd, var_36_2.bloAdd) .. "\n" .. var_36_2.skillName1 .. "Lv." .. var_36_2.skillAdd1 .. " " .. var_36_2.skillName2 .. "Lv." .. var_36_2.skillAdd2)

			if var_36_1.fengexian and var_36_1.title4 then
				var_36_1.fengexian:setVisible(false)
				var_36_1.title4:setVisible(true)
			end
		end

		var_36_1.equip1Label:setString(language.get(30103, arg_36_0.sublimatedAtt, arg_36_0.sublimatedDef, arg_36_0.sublimatedBlood))
		var_36_1.equip2Label:setString(language.get(30308, arg_36_0.skillName1, arg_36_0.lightAddedNum1, arg_36_0.skillName2, arg_36_0.lightAddedNum2))
		var_36_1.equip3Label:setString(generalConstant.jiTaozhuangSource[arg_36_0.pic])
		var_36_1.suitAttAllLabel:setString(language.get(30103, arg_36_0.att, arg_36_0.def, arg_36_0.blood))
		var_36_1.equip1Label:setDimensions(CCSizeMake(300, 0))
		var_36_1.equip1Label:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_36_1.suitAttAllLabel:setDimensions(CCSizeMake(300, 0))
		var_36_1.suitAttAllLabel:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_36_1.equip2Label:setDimensions(CCSizeMake(300, 0))
		var_36_1.equip2Label:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_36_1.suitIntroLabel:setDimensions(CCSizeMake(300, 0))
		var_36_1.suitIntroLabel:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_36_1.suitNameLabel:setString(arg_36_0.itemName)

		if arg_36_0.effects then
			local var_36_3 = {}
			local var_36_4 = {
				Def = 2,
				Att = 1,
				Blood = 3
			}

			for iter_36_0, iter_36_1 in ipairs(arg_36_0.effects) do
				var_36_3[var_36_4[iter_36_1.type]] = iter_36_1.value
			end

			var_36_1.title3:setString(language.get(30316))
			var_36_1.equip3Label:setString(language.get(102026, var_36_3[1], var_36_3[2], var_36_3[3]))
			var_36_1.equip3Label:setColor(ccc3(92, 200, 125))
		end

		return var_36_1.tipPanel
	end

	function var_1_1.showEquipTip(arg_37_0, arg_37_1, arg_37_2, arg_37_3, arg_37_4)
		log.info("showEquipTip")
		var_1_4.widgets.equipTipPanel:setVisible(true)
		var_1_4.widgets.equipTipNode:removeAllChildrenWithCleanup(true)

		local var_37_0

		if arg_37_2 then
			if arg_37_3 then
				var_37_0 = var_1_1.createTreasureTips(arg_37_1)
			elseif arg_37_4 then
				var_37_0 = var_1_1.createYcbwTips(arg_37_1)
			elseif arg_37_0.equipWithSuit then
				var_37_0 = var_1_1.createSuitTips(arg_37_0, arg_37_1)
			else
				var_37_0 = var_1_1.createEquipTips(arg_37_1)
			end
		elseif arg_37_3 then
			var_37_0 = var_1_1.createTreasureTips(arg_37_1)
		elseif arg_37_4 then
			var_37_0 = var_1_1.createYcbwTips(arg_37_1)
		elseif arg_37_1.type == 10 or arg_37_1.type == 14 then
			var_37_0 = var_1_1.createTipsForWearSuit(arg_37_1)
		elseif arg_37_1.type == 25 then
			var_37_0 = var_1_1.createTipsForWearJiSuit(arg_37_1)
		elseif arg_37_1.type == 36 then
			var_37_0 = var_1_1.createTipsForWearJiSuit(arg_37_1)
		else
			var_37_0 = var_1_1.createEquipTips(arg_37_1)
		end

		if var_37_0 then
			var_1_4.widgets.equipTipNode:addChild(var_37_0)
		end

		if arg_37_3 then
			var_1_4.widgets.tackoffButton:addHandleOfControlEvent(var_1_1.takeOffTreasure, CCControlEventTouchUpInside)
			var_1_4.widgets.wearButton:addHandleOfControlEvent(var_1_1.changeTreasure, CCControlEventTouchUpInside)
		elseif arg_37_4 then
			var_1_4.widgets.tackoffButton:addHandleOfControlEvent(var_1_1.takeOffYcbw, CCControlEventTouchUpInside)
			var_1_4.widgets.wearButton:addHandleOfControlEvent(var_1_1.changeYcbw, CCControlEventTouchUpInside)
		else
			var_1_4.widgets.tackoffButton:addHandleOfControlEvent(var_1_1.OnTakeOffEquip, CCControlEventTouchUpInside)
			var_1_4.widgets.wearButton:addHandleOfControlEvent(var_1_1.onChangeEquip, CCControlEventTouchUpInside)
		end

		if user.curMainTask.taskId == 60 and user.curMainTask.state == 1 and var_1_4.widgets.wearButton then
			local var_37_1, var_37_2 = tool.getPositionInScreen(var_1_4.widgets.wearButton)

			guide.control.loadGuide2(7, var_37_1, var_37_2 + 100, true, user.curMainTask.introLong)
		end

		if arg_37_2 then
			var_1_4.widgets.tackoffButton:setVisible(true)
			var_1_4.widgets.wearButton:setVisible(false)
		else
			var_1_4.widgets.tackoffButton:setVisible(false)
			var_1_4.widgets.wearButton:setVisible(true)
		end
	end

	function var_1_1.onEquipClick(arg_38_0, arg_38_1)
		if var_1_4.widgets.generalJuexing then
			var_1_4.widgets.generalJuexing.jiexingMianban:setVisible(false)
		end

		var_0_6 = false

		local var_38_0 = tolua.cast(arg_38_1, "CCControlButton")

		if var_38_0 == var_1_1.selectWearedEquip then
			var_1_4.widgets.equipTipPanel:setVisible(false)
			var_1_1.lostEquipItemForce()

			var_1_1.selectWearedEquip = nil

			return
		end

		var_1_1.lostEquipItemForce()

		var_1_1.selectWearedEquip = var_38_0

		var_1_1.getEquipItemForce()

		if not var_38_0:getUserObject() then
			return
		end

		local var_38_1 = tolua.cast(var_38_0:getUserObject(), "CCInteger"):getValue()
		local var_38_2

		for iter_38_0, iter_38_1 in pairs(var_1_1.selectGeneral.equips) do
			if iter_38_1.type == var_38_1 then
				var_38_2 = iter_38_1

				break
			end
		end

		var_1_1.getEquip(var_1_1.selectGeneral.generalId, var_38_1)

		if var_1_1.selectGeneral and var_1_1.selectGeneral.equips then
			if var_38_2 and var_38_2.vId then
				if var_1_1.selectGeneral and var_1_1.selectGeneral.evoke ~= 2 and not user.getFunc(91) then
					local function var_38_3(arg_39_0)
						local var_39_0 = arg_39_0.action.data
						local var_39_1 = var_39_0.equips[1]

						if var_39_1.refreshAttributeNum and var_39_1.refreshAttributeNum > 0 and var_39_1.refreshAttribute then
							for iter_39_0 = 2, var_39_1.refreshAttributeNum do
								var_39_1.refreshAttribute[iter_39_0] = var_39_1.refreshAttribute[1]
							end
						end

						var_1_1.selectGeneral.equipSuitName = var_39_0.equipSuitName
						var_1_1.selectGeneral.rewardAtt = var_39_0.rewardAtt
						var_1_1.selectGeneral.rewardDef = var_39_0.rewardDef
						var_1_1.selectGeneral.rewardBlood = var_39_0.rewardBlood

						var_1_1.showEquipTip(var_1_1.selectGeneral, var_39_1, true)
					end

					local var_38_4 = 0

					if type(var_1_1.selectGeneral.vId) == "number" then
						var_38_4 = var_1_1.selectGeneral.vId
					end

					cmgr.sendRequest(var_38_3, actions.getEquipTips, var_1_1.selectGeneral.generalId, var_38_4, var_38_2.type)
				else
					var_1_4.widgets.equipTipPanel:setVisible(false)
					var_1_4.widgets.equipTipNode:removeAllChildrenWithCleanup(true)
				end
			else
				var_1_4.widgets.equipTipPanel:setVisible(false)
				var_1_4.widgets.juexingtackoffButton:setVisible(false)
			end
		end
	end

	function var_1_1.onYb1Click(arg_40_0, arg_40_1)
		var_1_1.ycbwPos = 1

		if var_1_4.widgets.generalJuexing then
			var_1_4.widgets.generalJuexing.jiexingMianban:setVisible(false)
		end

		var_0_6 = false

		local var_40_0 = tolua.cast(arg_40_1, "CCControlButton")

		if var_40_0 == var_1_1.selectWearedEquip then
			var_1_4.widgets.equipTipPanel:setVisible(false)

			var_1_1.selectWearedEquip = nil

			return
		end

		var_1_1.lostEquipItemForce()

		var_1_1.selectWearedEquip = var_40_0

		var_1_1.getEquipItemForce()
		var_1_4.widgets.juexingtackoffButton:setVisible(false)
		var_1_1.getYcbw(var_1_1.selectGeneral.generalId, 1)

		if var_1_1.selectGeneral and var_1_1.ycbw1 then
			var_1_1.showEquipTip(var_1_1.selectGeneral, var_1_1.ycbw1, true, false, true)
		end
	end

	function var_1_1.onYb2Click(arg_41_0, arg_41_1)
		var_1_1.ycbwPos = 2

		if var_1_4.widgets.generalJuexing then
			var_1_4.widgets.generalJuexing.jiexingMianban:setVisible(false)
		end

		var_0_6 = false

		local var_41_0 = tolua.cast(arg_41_1, "CCControlButton")

		if var_41_0 == var_1_1.selectWearedEquip then
			var_1_4.widgets.equipTipPanel:setVisible(false)

			var_1_1.selectWearedEquip = nil

			return
		end

		var_1_1.lostEquipItemForce()

		var_1_1.selectWearedEquip = var_41_0

		var_1_1.getEquipItemForce()
		var_1_4.widgets.juexingtackoffButton:setVisible(false)
		var_1_1.getYcbw(var_1_1.selectGeneral.generalId, 2)

		if var_1_1.selectGeneral and var_1_1.ycbw2 then
			var_1_1.showEquipTip(var_1_1.selectGeneral, var_1_1.ycbw2, true, false, true)
		end
	end

	function var_1_1.onTreasureClick(arg_42_0, arg_42_1)
		if var_1_4.widgets.generalJuexing then
			var_1_4.widgets.generalJuexing.jiexingMianban:setVisible(false)
		end

		var_0_6 = false

		local var_42_0 = tolua.cast(arg_42_1, "CCControlButton")

		if var_42_0 == var_1_1.selectWearedEquip then
			var_1_4.widgets.equipTipPanel:setVisible(false)

			var_1_1.selectWearedEquip = nil

			return
		end

		var_1_1.lostEquipItemForce()

		var_1_1.selectWearedEquip = var_42_0

		var_1_1.getEquipItemForce()
		var_1_4.widgets.juexingtackoffButton:setVisible(false)
		var_1_1.getTreasure(var_1_1.selectGeneral.generalId)

		if var_1_1.selectGeneral and var_1_1.treasure then
			var_1_1.showEquipTip(var_1_1.selectGeneral, var_1_1.treasure, true, true)
		end
	end

	function var_1_1.getStrategyType(arg_43_0)
		local var_43_0 = 1

		if arg_43_0 == 1110131 or arg_43_0 == 1110231 or arg_43_0 == 1110331 or arg_43_0 == 1110431 or arg_43_0 == 1110531 or arg_43_0 == 1210133 or arg_43_0 == 1210233 or arg_43_0 == 1210333 or arg_43_0 == 1210433 or arg_43_0 == 1210533 or arg_43_0 == 1410132 or arg_43_0 == 1410232 or arg_43_0 == 1410332 or arg_43_0 == 1410432 or arg_43_0 == 1410532 then
			var_43_0 = 1
		elseif arg_43_0 == 2210121 or arg_43_0 == 2210221 or arg_43_0 == 2210321 or arg_43_0 == 2210421 or arg_43_0 == 2210521 or arg_43_0 == 2310122 or arg_43_0 == 2310222 or arg_43_0 == 2310322 or arg_43_0 == 2310422 or arg_43_0 == 2310522 then
			var_43_0 = 2
		elseif arg_43_0 == 3110113 or arg_43_0 == 3110213 or arg_43_0 == 3110313 or arg_43_0 == 3110413 or arg_43_0 == 3110513 or arg_43_0 == 3310111 or arg_43_0 == 3310211 or arg_43_0 == 3310311 or arg_43_0 == 3310411 or arg_43_0 == 3310511 or arg_43_0 == 3410112 or arg_43_0 == 3410212 or arg_43_0 == 3410312 or arg_43_0 == 3410412 or arg_43_0 == 3410512 then
			var_43_0 = 3
		end

		return var_43_0
	end

	function var_1_1.getTerrainById(arg_44_0)
		local var_44_0 = language.get(81109)

		if arg_44_0 == 1 then
			local var_44_1 = language.get(81109)
		elseif arg_44_0 == 2 then
			var_44_0 = language.get(81110)
		elseif arg_44_0 == 3 then
			var_44_0 = language.get(81111)
		elseif arg_44_0 == 4 then
			var_44_0 = language.get(81112)
		end

		return var_44_0
	end

	function var_1_1.showTerrainTip(arg_45_0, arg_45_1)
		local var_45_0 = tolua.cast(arg_45_1, "CCControlButton")
		local var_45_1 = tolua.cast(var_45_0:getUserObject(), "CCInteger"):getValue()
		local var_45_2 = ""

		var_1_1.selectGeneral.tts = var_1_1.selectGeneral.tts or {}

		for iter_45_0, iter_45_1 in pairs(var_1_1.selectGeneral.tts) do
			if var_1_1.getStrategyType(iter_45_1.strategyId) == var_45_1 then
				local var_45_3 = var_1_1.getTerrainById(iter_45_1.terrainId)

				if string.len(var_45_2) > 0 then
					var_45_2 = var_45_2 .. "、" .. var_45_3
				else
					var_45_2 = var_45_2 .. var_45_3
				end
			end
		end

		var_1_4.widgets.strategyTipPanel:setVisible(true)
		var_1_4.widgets.strategyTipPanel:removeAllChildrenWithCleanup(true)

		local var_45_4

		if var_45_1 == 1 then
			var_45_2 = language.get(82018, var_45_2)
			var_45_4 = CCSprite:createWithSpriteFrameName("general_attrib_icontj.png")
		elseif var_45_1 == 2 then
			var_45_2 = language.get(82019, var_45_2)
			var_45_4 = CCSprite:createWithSpriteFrameName("general_attrib_iconfs.png")
		elseif var_45_1 == 3 then
			var_45_2 = language.get(82020, var_45_2)
			var_45_4 = CCSprite:createWithSpriteFrameName("general_attrib_icongj.png")
		end

		if var_45_4 then
			var_45_4:setPosition(ccp(35, 35))
			var_1_4.widgets.strategyTipPanel:addChild(var_45_4)

			local var_45_5 = CCStrokeLabelTTF:create(var_45_2, "Thonburi", 22)

			var_45_5:setAnchorPoint(ccp(0, 0.5))
			var_45_5:setPosition(ccp(68, 35))
			var_1_4.widgets.strategyTipPanel:addChild(var_45_5)
		end
	end

	function var_1_1.showTerrainShow(arg_46_0)
		var_1_4.widgets.generalStrategyAssButton:removeChildByTag(101, true)
		var_1_4.widgets.generalStrategyAttButton:removeChildByTag(101, true)
		var_1_4.widgets.generalStrategyDefButton:removeChildByTag(101, true)

		var_1_1.selectGeneral.tts = var_1_1.selectGeneral.tts or {}

		local var_46_0 = 0
		local var_46_1 = 0
		local var_46_2 = 0

		for iter_46_0, iter_46_1 in pairs(var_1_1.selectGeneral.tts) do
			local var_46_3 = var_1_1.getStrategyType(iter_46_1.strategyId)

			if var_46_3 == 1 then
				var_46_0 = var_46_0 + 1
			elseif var_46_3 == 2 then
				var_46_1 = var_46_1 + 1
			elseif var_46_3 == 3 then
				var_46_2 = var_46_2 + 1
			end
		end

		local var_46_4
		local var_46_5 = conf.language == "vie" and 140 or 80
		local var_46_6 = 0

		if var_46_0 > 0 then
			var_1_4.widgets.generalStrategyAssButton:setVisible(true)
			var_1_4.widgets.generalStrategyAssButton:setPosition(ccp(var_46_5, var_46_6))

			var_46_5 = var_46_5 + 60

			if var_46_0 > 1 then
				local var_46_7 = CCStrokeLabelTTF:create(string.format("×%s", var_46_0), "Thonburi", 18)

				var_46_7:setPosition(ccp(28, 15))
				var_1_4.widgets.generalStrategyAssButton:addChild(var_46_7, 2, 101)
			end
		else
			var_1_4.widgets.generalStrategyAssButton:setVisible(false)
		end

		if var_46_1 > 0 then
			var_1_4.widgets.generalStrategyDefButton:setVisible(true)
			var_1_4.widgets.generalStrategyDefButton:setPosition(ccp(var_46_5, var_46_6))

			var_46_5 = var_46_5 + 60

			if var_46_1 > 1 then
				local var_46_8 = CCStrokeLabelTTF:create(string.format("×%s", var_46_1), "Thonburi", 18)

				var_46_8:setPosition(ccp(28, 15))
				var_1_4.widgets.generalStrategyDefButton:addChild(var_46_8, 2, 101)
			end
		else
			var_1_4.widgets.generalStrategyDefButton:setVisible(false)
		end

		if var_46_2 > 0 then
			var_1_4.widgets.generalStrategyAttButton:setVisible(true)
			var_1_4.widgets.generalStrategyAttButton:setPosition(ccp(var_46_5, var_46_6))

			local var_46_9 = var_46_5 + 60

			if var_46_2 > 1 then
				local var_46_10 = CCStrokeLabelTTF:create(string.format("×%s", var_46_2), "Thonburi", 18)

				var_46_10:setPosition(ccp(28, 15))
				var_1_4.widgets.generalStrategyAttButton:addChild(var_46_10, 2, 101)
			end
		else
			var_1_4.widgets.generalStrategyAttButton:setVisible(false)
		end
	end

	function var_1_1.showTalent(arg_47_0)
		var_1_4.widgets.terrainAddAttLabel:removeAllChildrenWithCleanup(true)

		local var_47_0 = 0
		local var_47_1 = ""

		for iter_47_0, iter_47_1 in pairs(arg_47_0.terrain) do
			local var_47_2 = language.get(81109)

			if iter_47_1.tType == 1 then
				local var_47_3 = language.get(81109)
			elseif iter_47_1.tType == 2 then
				var_47_2 = language.get(81110)
			elseif iter_47_1.tType == 3 then
				var_47_2 = language.get(81111)
			elseif iter_47_1.tType == 4 then
				var_47_2 = language.get(81112)
			end

			var_47_1 = var_47_1 .. var_47_2

			if iter_47_0 ~= #arg_47_0.terrain then
				var_47_1 = var_47_1 .. "、"
			end

			var_47_0 = iter_47_1.tValue
		end

		if string.len(var_47_1) > 0 then
			local var_47_4 = language.get(81012, var_47_1, var_47_0)
			local var_47_5 = CCStrokeLabelTTF:create(var_47_4, "Thonburi", 20)

			var_47_5:setAnchorPoint(ccp(0, 0))

			if conf.language == "vie" then
				var_47_5:setAnchorPoint(ccp(0, 1))
				var_47_5:setHorizontalAlignment(kCCTextAlignmentLeft)
				var_47_5:setPosition(ccp(95, 22))
				var_47_5:setDimensions(CCSizeMake(230, 0))
			elseif conf.language == "tha" then
				var_47_5:setAnchorPoint(ccp(0, 1))
				var_47_5:setHorizontalAlignment(kCCTextAlignmentLeft)
				var_47_5:setPosition(ccp(145, 22))
				var_47_5:setDimensions(CCSizeMake(170, 0))
			else
				var_47_5:setPosition(ccp(55, 0))
			end

			var_1_4.widgets.terrainAddAttLabel:addChild(var_47_5)
		end
	end

	function var_1_1.handlerMubing(arg_48_0)
		if not arg_1_1.isKfgz and arg_48_0.action.data.start == true then
			var_1_1.getGeneralInfo()
		end
	end

	function var_1_1.mubing()
		if arg_1_1.iskfgz then
			kfcmgr.sendRequest(var_1_1.handlerMubing, actions.kfgzStartMubing, var_1_1.selectGeneral.generalId)
		else
			cmgr.sendRequest(var_1_1.handlerMubing, actions.startRecruitForces, var_1_1.selectGeneral.generalId)
		end
	end

	function var_1_1.handlerJiasumubing(arg_50_0)
		eventManager.dispatchEvent("generalStateChanged")
		var_1_1.getGeneralInfo()
	end

	function var_1_1.jiasumubing()
		local function var_51_0(arg_52_0)
			if arg_52_0.action.state == 1 then
				if arg_52_0.action.data.token and arg_52_0.action.data.token > 0 then
					cmgr.sendRequest(var_1_1.handlerJiasumubing, actions.generalRecover, var_1_1.selectGeneral.generalId)
				else
					messageBox.showChargeWin(language.get(10003), language.get(80007, arg_52_0.action.data.gold), "goldRecruit", function()
						cmgr.sendRequest(var_1_1.handlerJiasumubing, actions.generalRecover, var_1_1.selectGeneral.generalId)
					end)
				end
			end
		end

		log.info("@@ 武将面板 是否国战", arg_1_1.iskfgz)

		if arg_1_1.iskfgz then
			kfcmgr.sendRequest(var_1_1.handlerJiasumubing, actions.kfgzFastAddHp, var_1_1.selectGeneral.generalId)
		else
			cmgr.sendRequest(var_51_0, actions.generalRecoverInfo, var_1_1.selectGeneral.generalId)
		end
	end

	function var_1_1.showMubingTimer(arg_54_0)
		local function var_54_0(arg_55_0)
			if arg_55_0 <= 0 then
				var_1_1.getGeneralInfo()
			end
		end

		local var_54_1 = uiutil.initUIComponent(var_1_4.widgets.timerNode, nil, {
			y = 0,
			style = "label_timer",
			format = "%M:%S",
			type = "labelTimer",
			x = 0
		})

		var_54_1.displayObj:setTime(arg_54_0.needTime)
		var_54_1.displayObj:setCallBack(var_54_0, nil, 1, 0)
	end

	function var_1_1.handlerEscape(arg_56_0)
		var_1_1.getGeneralInfo()
		eventManager.dispatchEvent("generalStateChanged")
	end

	function var_1_1.handlerRedeemer(arg_57_0)
		var_1_1.getGeneralInfo()
	end

	function var_1_1.onEscape()
		cmgr.sendRequest(var_1_1.handlerEscape, actions.slaveEscape, var_1_1.selectGeneral.generalId)
	end

	function var_1_1.onRedeemer()
		messageBox.showChargeWin(language.get(10003), language.get(80008), "slaveFreedom", function()
			cmgr.sendRequest(var_1_1.handlerRedeemer, actions.slaveFreedom, var_1_1.selectGeneral.generalId)
		end)
	end

	function var_1_1.InPrison(arg_61_0)
		local var_61_0 = arg_61_0.cState == var_0_4.generalState.prison or arg_61_0.cState == var_0_4.generalState.escape
		local var_61_1 = arg_61_0.cState == var_0_4.generalState.escape

		var_1_4.widgets.escapeTimerNode:removeAllChildrenWithCleanup(true)

		if arg_61_0.evoke ~= 2 and not user.getFunc(91) then
			var_1_4.widgets.generalEquipNode:setVisible(not var_61_0)
		elseif var_1_4.widgets.generalJuexing and var_1_4.widgets.generalJuexing.generalJuexing then
			var_1_4.widgets.generalJuexing.generalJuexing:setVisible(not var_61_0)
		end

		if var_61_0 or var_61_1 then
			var_1_4.widgets.node_medal:setVisible(false)
		end

		var_1_4.widgets.equipStoreView:setVisible(not var_61_0)
		var_1_4.widgets.prisonNode:setVisible(var_61_0)
		var_1_4.widgets.inPrisonLabel:setVisible(not var_61_1)
		var_1_4.widgets.escapeLabel:setVisible(var_61_1)
		var_1_4.widgets.escapeButton:setVisible(not var_61_1)
		var_1_4.widgets.redeemerButton:setVisible(var_61_1)
		var_1_4.widgets.escapeButton:addHandleOfControlEvent(var_1_1.onEscape, CCControlEventTouchUpInside)
		var_1_4.widgets.redeemerButton:addHandleOfControlEvent(var_1_1.onRedeemer, CCControlEventTouchUpInside)

		if var_61_1 and arg_61_0.cTime then
			local function var_61_2()
				local var_62_0 = "res/ui/general/captive_escape_succ.png"
				local var_62_1 = CCSprite:create(var_62_0)

				var_62_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
				smgr.showTipSpriteText(var_62_1)
				var_1_1.getGeneralInfo()
			end

			local function var_61_3(arg_63_0)
				arg_61_0.cTime = arg_63_0 * 1000

				if arg_63_0 <= 0 then
					var_61_2()
				end
			end

			local var_61_4 = uiutil.initUIComponent(var_1_4.widgets.escapeTimerNode, nil, {
				y = 0,
				style = "label_timerGreen",
				format = "%M:%S",
				type = "labelTimer",
				x = 0
			})

			var_61_4.displayObj:setTime(arg_61_0.cTime)
			var_61_4.displayObj:setCallBack(var_61_3, nil, 1, 0)
		end

		swallowTouch(var_1_4.widgets.topPrisonMask)
		swallowTouch(var_1_4.widgets.rightPrisonMask)
		swallowTouch(var_1_4.widgets.bottomPrisonMask)
	end

	function var_1_1.showFujiangCaozuo(arg_64_0)
		local var_64_0 = {}
		local var_64_1 = {}

		for iter_64_0 = 1, 5 do
			var_64_0[iter_64_0] = {}
			var_64_1[iter_64_0] = {}

			var_1_4.widgets["generalPic" .. iter_64_0]:removeAllChildrenWithCleanup(true)
			var_1_4.widgets["fujiangGeneralPic" .. iter_64_0]:removeAllChildrenWithCleanup(true)
		end

		local function var_64_2()
			log.info("handlerSwitchGeneral success!")
			eventManager.dispatchEvent("recruitGeneral")
			var_1_1.getGeneralInfo()

			local var_65_0 = CCSprite:create("res/ui/general/deputy/fj_tit_hhcg.png")

			var_65_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
			smgr.showTipSpriteText(var_65_0)
		end

		local function var_64_3()
			log.info("handlerDeputyGeneral success!")
			eventManager.dispatchEvent("recruitGeneral")
			var_1_1.getGeneralInfo()

			local var_66_0 = CCSprite:create("res/ui/general/deputy/fj_tit_zjgh.png")

			var_66_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
			smgr.showTipSpriteText(var_66_0)
		end

		local var_64_4 = arg_64_0.action.data.military

		for iter_64_1 = 1, 5 do
			if var_64_4[iter_64_1] then
				var_64_0[iter_64_1].generalId = var_64_4[iter_64_1].generalId
				var_64_0[iter_64_1].pic = var_64_4[iter_64_1].pic

				local var_64_5 = CCSprite:create("res/ui/common/fightPic/fightPic_" .. var_64_4[iter_64_1].pic .. ".png")

				var_64_5:setScale(0.9)
				var_64_5:setPosition(ccp(var_1_4.widgets["generalPic" .. iter_64_1]:getContentSize().width / 2, var_1_4.widgets["generalPic" .. iter_64_1]:getContentSize().height / 2))
				var_1_4.widgets["generalPic" .. iter_64_1]:addChild(var_64_5)
				var_1_4.widgets["generalPic" .. iter_64_1]:setVisible(true)

				if var_64_4[iter_64_1].isChief then
					var_64_1[iter_64_1].generalId = var_64_4[iter_64_1].deputyGeneralId
					var_64_1[iter_64_1].pic = var_64_4[iter_64_1].deputyPic

					local var_64_6 = CCSprite:create("res/ui/common/fightPic/fightPic_" .. var_64_4[iter_64_1].deputyPic .. ".png")

					var_64_6:setScale(0.9)
					var_64_6:setPosition(ccp(var_1_4.widgets["fujiangGeneralPic" .. iter_64_1]:getContentSize().width / 2, var_1_4.widgets["fujiangGeneralPic" .. iter_64_1]:getContentSize().height / 2))
					var_1_4.widgets["fujiangGeneralPic" .. iter_64_1]:addChild(var_64_6)
					var_1_4.widgets["fujiangGeneralPic" .. iter_64_1]:setVisible(true)
					var_1_4.widgets["fujiangFollow" .. iter_64_1]:setVisible(false)
					var_1_4.widgets["generalExchange" .. iter_64_1]:setVisible(true)
					var_1_4.widgets["generalExchange" .. iter_64_1]:addHandleOfControlEvent(function()
						cmgr.sendRequest(var_64_2, actions.deputySwitch, var_64_0[iter_64_1].generalId, var_64_1[iter_64_1].generalId)
					end, CCControlEventTouchUpInside)
				else
					var_1_4.widgets["fujiangFollow" .. iter_64_1]:setVisible(true)
					var_1_4.widgets["generalExchange" .. iter_64_1]:setVisible(false)
					var_1_4.widgets["fujiangGeneralPic" .. iter_64_1]:setVisible(false)
					var_1_4.widgets["fujiangFollow" .. iter_64_1]:addHandleOfControlEvent(function()
						cmgr.sendRequest(var_64_3, actions.deputyGeneral, var_64_0[iter_64_1].generalId, var_1_1.selectGeneral.generalId)
					end, CCControlEventTouchUpInside)
				end
			else
				var_1_4.widgets["generalPic" .. iter_64_1]:setVisible(false)
				var_1_4.widgets["fujiangFollow" .. iter_64_1]:setVisible(false)
				var_1_4.widgets["generalExchange" .. iter_64_1]:setVisible(false)
				var_1_4.widgets["fujiangGeneralPic" .. iter_64_1]:setVisible(false)
			end
		end
	end

	local function var_1_7(arg_69_0)
		if var_1_4.widgets.equipStoreView then
			var_1_4.widgets.equipStoreView:removeFromParentAndCleanup(true)

			var_1_4.widgets.equipStoreView = nil
		end

		uiutil.initWidgets(var_1_4, arg_69_0)
		var_1_4.widgets.equipStoreNode:addChild(var_1_4.widgets.equipStoreView)
	end

	local function var_1_8(arg_70_0)
		local var_70_0 = {}

		if conf.language == "vie" then
			var_70_0.atkRowCntFntSize = -4
		else
			var_70_0.atkRowCntFntSize = 0
		end

		local var_70_1 = user.getFunc(91)

		if arg_70_0.isDeputy == true then
			arg_70_0.pic = arg_70_0.deputyPic
		end

		local var_70_2 = CCSprite:create(rmgr.getGeneralBust(arg_70_0.pic))

		if arg_70_0.evoke == 2 then
			local var_70_3 = var_0_1[arg_70_0.generalId]

			if var_70_3 then
				if arg_70_0.evokeSkillFinal and arg_70_0.evokeSkillFinal > 0 then
					var_70_2 = CCSprite:create("res/ui/common/halfPic/" .. var_70_3.pic2)
				elseif arg_70_0.evokeSkill1 > 0 or arg_70_0.evokeSkill2 > 0 or arg_70_0.evokeSkill3 > 0 or arg_70_0.evokeSkill4 > 0 then
					var_70_2 = CCSprite:create("res/ui/general/juexing/halfPic/" .. var_70_3.pic1)
				end
			end
		end

		var_1_4.widgets.btn_equip:addHandleOfControlEvent(function()
			log.info("btn_equip")

			local var_71_0 = {
				y = 0,
				name = "layer",
				type = "layer",
				x = 0,
				children = {
					{
						name = "bg",
						type = "sprite9Tips",
						frameGapHorizontal = 20,
						frameGapVertical = 20,
						lineGap = 10,
						x = visibleSize.width / 2,
						y = visibleSize.height / 2 - 30,
						pic = {
							frame = true,
							path = "bigPanel.png"
						},
						middleRect = CCRectMake(30, 30, 45, 45),
						content = {},
						children = {
							{
								x = 0,
								name = "btn_close",
								h = 33,
								type = "button",
								w = 32,
								y = 0,
								scale = 2,
								normal = {
									frame = true,
									path = "btn_close_a.png"
								},
								touched = {
									frame = true,
									path = "btn_close_c.png"
								}
							}
						}
					}
				}
			}
			local var_71_1 = {}
			local var_71_2 = 0

			for iter_71_0, iter_71_1 in ipairs(var_1_1.generals) do
				if var_1_1.selectGeneral.generalId ~= iter_71_1.generalId then
					var_71_2 = var_71_2 + 1

					table.insert(var_71_1, iter_71_1.generalId)
					table.insert(var_71_0.children[1].content, {
						type = "sprite9",
						pic = {
							path = "res/default.png"
						},
						preferedSize = CCSizeMake(220, 70),
						children = {
							{
								x = 35,
								scale = 0.9,
								y = 35,
								type = "sprite",
								pic = {
									frame = false,
									path = "res/ui/general/deputy/fj_btn_gs.png"
								},
								children = {
									{
										x = 41,
										scale = 0.9,
										y = 41,
										type = "sprite",
										pic = {
											frame = false,
											path = "res/ui/common/fightPic/fightPic_" .. iter_71_1.pic .. ".png"
										}
									}
								}
							},
							{
								h = 60,
								zoomOnTouchDown = true,
								type = "button",
								w = 60,
								y = 35,
								x = 140,
								name = "btn_change" .. var_71_2,
								normal = {
									frame = false,
									path = "res/ui/general/deputy/150150.png"
								},
								touched = {
									frame = false,
									path = "res/ui/general/deputy/150150.png"
								},
								label = {
									fontSize = 21,
									textId = 82023,
									type = "label",
									color = ccc3(227, 188, 70)
								}
							}
						}
					})
				end
			end

			uiutil.initWidgets(var_1_4, var_71_0)
			var_1_0:addChild(var_1_4.widgets.layer)
			swallowTouch(var_1_4.widgets.layer)

			local var_71_3 = var_1_4.widgets.bg:getContentSize()

			var_1_4.widgets.btn_close:setPosition(var_71_3.width - 30, var_71_3.height + 25)
			var_1_4.widgets.btn_close:addHandleOfControlEvent(function()
				log.info("btn_close")
				var_1_4.widgets.layer:removeFromParentAndCleanup(true)
			end, CCControlEventTouchUpInside)

			for iter_71_2, iter_71_3 in ipairs(var_71_1) do
				var_1_4.widgets["btn_change" .. iter_71_2]:addHandleOfControlEvent(function()
					log.info("btn_change" .. iter_71_2)

					local function var_73_0(arg_74_0)
						var_1_1.getSingleGeneralInfo(true)
						var_1_4.widgets.layer:removeFromParentAndCleanup(true)
					end

					cmgr.sendRequest(var_73_0, actions.changeAllEquip, arg_70_0.generalId, iter_71_3)
				end, CCControlEventTouchUpInside)
			end
		end, CCControlEventTouchUpInside)

		if arg_70_0.generalId == 269 and arg_70_0.evoke == 2 then
			var_1_4.widgets.num_zgjn_bg:setVisible(true)
			var_1_4.widgets.buy_zgjn:setVisible(true)
			var_1_4.widgets.num_zgjn:setString("x" .. var_1_1.zhugeWineNum)
			var_1_4.widgets.buy_zgjn_gold:setString(var_1_1.buyZhugeWinegold)

			local function var_70_4()
				local function var_75_0()
					log.info("购买佳酿")

					local function var_76_0(arg_77_0)
						local var_77_0 = arg_77_0.action.data or arg_77_0.data

						var_1_1.zhugeWineNum = var_77_0.zhugeWineNum or 0
						var_1_1.buyZhugeWinegold = var_77_0.buyZhugeWinegold or 1000
						var_1_1.evokeType = var_77_0.evokeType or var_1_1.evokeType

						local var_77_1 = {
							{}
						}

						var_77_1[1].id = 30011
						var_77_1[1].value = 1

						globalAction_gotResource(var_77_1)
						var_1_8(var_1_1.selectGeneral)
					end

					cmgr.sendRequest(var_76_0, actions.buyZhugeWine)
				end

				if var_1_4.widgets.generalJuexing.jiexingMianban:isVisible() ~= true then
					messageBox.showChargeWin("", language.get("223201_zgljx", var_1_1.buyZhugeWinegold), "zhugeWine", var_75_0)
				end
			end

			var_1_4.widgets.buy_zgjn:addHandleOfControlEvent(var_70_4, CCControlEventTouchUpInside)
		else
			var_1_4.widgets.num_zgjn_bg:setVisible(false)
			var_1_4.widgets.buy_zgjn:setVisible(false)
		end

		var_1_4.widgets.generalPicNode:removeAllChildrenWithCleanup(true)
		var_1_4.widgets.generalPicNode:addChild(var_70_2)
		var_1_4.widgets.generalAttValue:setString("+" .. arg_70_0.att)
		var_1_4.widgets.generalDefValue:setString("+" .. arg_70_0.def)
		var_1_4.widgets.generalHpValue:setString("+" .. arg_70_0.fMax)
		var_1_4.widgets.generalTongValue:setString(language.get(82011, arg_70_0.leader))
		var_1_4.widgets.generalYongValue:setString(language.get(82013, arg_70_0.strength))

		local function var_70_5()
			local var_78_0 = {
				{
					fontSize = 18,
					type = "label",
					text = language.get(490718, arg_70_0.att)
				},
				{
					fontSize = 18,
					type = "label",
					text = language.get(490704, arg_70_0.skill_force_att)
				},
				{
					fontSize = 18,
					type = "label",
					text = language.get(490705, arg_70_0.skill_strong)
				}
			}

			if arg_70_0.evoke == 2 then
				var_78_0[4] = {
					fontSize = 18,
					type = "label",
					text = language.get(490708, arg_70_0.evokeAtt, var_1_1.evokeAttMax)
				}

				if arg_70_0.evokeBuff and arg_70_0.evokeBuff > 0 then
					var_78_0[5] = {
						fontSize = 18,
						type = "label",
						text = language.get(490709, arg_70_0.evokeBuff)
					}
					var_78_0[6] = {
						fontSize = 18,
						type = "label",
						text = language.get(490714, math.ceil(var_1_1.evokeBuffCd / 1000 / 60))
					}
				end
			end

			var_1_1.showTips(var_78_0, -200, 150)
		end

		local function var_70_6()
			local var_79_0 = {
				{
					fontSize = 18,
					type = "label",
					text = language.get(490719, arg_70_0.def)
				},
				{
					fontSize = 18,
					type = "label",
					text = language.get(490706, arg_70_0.skill_force_def)
				},
				{
					fontSize = 18,
					type = "label",
					text = language.get(490707, arg_70_0.skill_control)
				}
			}

			if arg_70_0.evoke == 2 then
				var_79_0[4] = {
					fontSize = 18,
					type = "label",
					text = language.get(490708, arg_70_0.evokeDef, var_1_1.evokeDefMax)
				}
			end

			var_1_1.showTips(var_79_0, -100, 150)
		end

		local function var_70_7()
			local var_80_0 = {
				{
					fontSize = 18,
					type = "label",
					text = language.get(490720, arg_70_0.fMax)
				}
			}

			if arg_70_0.evoke == 2 then
				var_80_0[2] = {
					fontSize = 18,
					type = "label",
					text = language.get(490708, arg_70_0.evokeHp, var_1_1.evokeHpMax)
				}
			end

			var_1_1.showTips(var_80_0, 0, 150)
		end

		var_1_4.widgets.wujiangAtt:addHandleOfControlEvent(var_70_5, CCControlEventTouchUpInside)
		var_1_4.widgets.wujiangDef:addHandleOfControlEvent(var_70_6, CCControlEventTouchUpInside)
		var_1_4.widgets.wujiangHp:addHandleOfControlEvent(var_70_7, CCControlEventTouchUpInside)

		if var_1_1.evokeBuffCd and var_1_1.evokeBuffCd > 0 and arg_70_0.evokeBuff and arg_70_0.evokeBuff > 0 then
			var_1_4.widgets.wujiangEvokeTime:setVisible(true)
			var_1_4.widgets.wujiangEvokeTime:addHandleOfControlEvent(var_70_5, CCControlEventTouchUpInside)
		else
			var_1_4.widgets.wujiangEvokeTime:setVisible(false)
		end

		var_1_4.widgets.generalLvValue:setString("Lv." .. arg_70_0.generalLv)
		var_1_4.widgets.generalExpBarValue:setPercentage(arg_70_0.generalExp / arg_70_0.generalExpMax * 100)

		local var_70_8 = arg_70_0.generalExp
		local var_70_9 = arg_70_0.generalExpMax

		if arg_70_0.generalExpMax >= 10000000 then
			var_70_8 = language.get(75021, math.floor(arg_70_0.generalExp / 10000))
			var_70_9 = language.get(75021, math.floor(arg_70_0.generalExpMax / 10000))
		end

		var_1_4.widgets.generalExpValue:setString(string.format("%s/%s", var_70_8, var_70_9))

		if CCApplication:sharedApplication():getTargetPlatform() == kTargetWinRT then
			var_1_4.widgets.generalExpBarValue:setPosition(ccp(5, 5))
		end

		var_1_4.widgets.generalTroopName:setString(arg_70_0.troopName)
		var_1_4.widgets.generalTroopName:setColor(colorQuality[arg_70_0.troopQuality])

		local var_70_10 = rmgr.getSData("tactic")[tostring(arg_70_0.tacticId)]

		arg_70_0.tacName = ""

		if var_70_10 then
			arg_70_0.tacName = var_70_10.name
			arg_70_0.tacRange = var_70_10.range
		end

		var_1_4.widgets.generaltacName:setString(arg_70_0.tacName)
		var_1_4.widgets.generaltacName:setColor(colorQuality[arg_70_0.quality])
		var_1_4.widgets.generaltacName:removeAllChildrenWithCleanup(true)

		if string.len(arg_70_0.tacName) > 0 then
			local var_70_11 = CCStrokeLabelTTF:create(language.get(81007, arg_70_0.tacRange), "Thonburi", 18 + var_70_0.atkRowCntFntSize)

			var_70_11:setColor(ccc3(189, 167, 146))
			var_70_11:setAnchorPoint(ccp(0, 1))
			var_70_11:setPosition(ccp(0, 0))
			var_1_4.widgets.generaltacName:addChild(var_70_11)
		end

		var_1_4.widgets.generalStrategyAssButton:addHandleOfControlEvent(var_1_1.showTerrainTip, CCControlEventTouchUpInside)
		var_1_4.widgets.generalStrategyAttButton:addHandleOfControlEvent(var_1_1.showTerrainTip, CCControlEventTouchUpInside)
		var_1_4.widgets.generalStrategyDefButton:addHandleOfControlEvent(var_1_1.showTerrainTip, CCControlEventTouchUpInside)
		var_1_4.widgets.generalStrategyAssButton:setUserObject(CCInteger:create(1))
		var_1_4.widgets.generalStrategyDefButton:setUserObject(CCInteger:create(2))
		var_1_4.widgets.generalStrategyAttButton:setUserObject(CCInteger:create(3))
		var_1_1.showTerrainShow(arg_70_0)
		var_1_1.showTalent(arg_70_0)
		var_1_4.widgets.tokenNumLabel:setString(language.get(81022, var_1_1.token))
		var_1_4.widgets.generalTroopBarValue:setPercentage(arg_70_0.forces / arg_70_0.forcesMax * 100)
		var_1_4.widgets.generalTroopValue:setString(string.format("%s/%s", arg_70_0.forces, arg_70_0.forcesMax))

		if CCApplication:sharedApplication():getTargetPlatform() == kTargetWinRT then
			var_1_4.widgets.generalTroopBarValue:setPosition(ccp(5, 6))
		end

		var_1_4.widgets.timerNode:removeAllChildrenWithCleanup(true)
		var_1_4.widgets.speedAddHpButton:removeChildByTag(101, true)
		var_1_4.widgets.addHpButton:addHandleOfControlEvent(var_1_1.mubing, CCControlEventTouchUpInside)
		var_1_4.widgets.speedAddHpButton:addHandleOfControlEvent(var_1_1.jiasumubing, CCControlEventTouchUpInside)

		if arg_70_0.generalState == var_0_4.generalState.conscription then
			var_1_4.widgets.addHpButton:setVisible(false)
			var_1_4.widgets.speedAddHpButton:setVisible(true)
			var_1_1.showMubingTimer(arg_70_0)

			local var_70_12 = math.ceil(arg_70_0.needTime / 300000)
			local var_70_13 = CCSprite:createWithSpriteFrameName("general_token.png")

			if var_70_12 > var_1_1.token then
				var_70_13 = CCSprite:createWithSpriteFrameName("res_icon_19_small.png")
			end

			local var_70_14 = "res/ui/common/number/up_numb.png"
			local var_70_15 = CCLabelAtlas:create(string.format("%s", var_70_12), var_70_14, 16, 21, 48)

			var_70_15:setAnchorPoint(ccp(0.5, 0.5))

			local var_70_16 = createRichNode({
				var_70_13,
				var_70_15
			}, 0)

			var_70_16:setPosition(ccp(17, 37))
			var_1_4.widgets.speedAddHpButton:addChild(var_70_16, 1, 101)
		else
			var_1_4.widgets.speedAddHpButton:setVisible(false)
			var_1_4.widgets.addHpButton:setVisible(true)
		end

		var_1_4.widgets.juexingtackoffButton:addHandleOfControlEvent(var_1_1.OnTakeOffEquip, CCControlEventTouchUpInside)
		var_1_4.widgets.juexingtackoffButton:setVisible(false)
		var_1_7(var_0_2)
		var_1_4.widgets.startJuexingState:setVisible(false)

		if arg_70_0.evoke == 0 then
			var_1_4.widgets.generalEquipNode:setVisible(true)

			if var_1_4.widgets.generalJuexing then
				var_1_4.widgets.generalJuexing.generalJuexing:setVisible(false)
			end
		elseif arg_70_0.evoke == 1 then
			var_1_4.widgets.generalEquipNode:setVisible(true)

			if var_1_4.widgets.generalJuexing then
				var_1_4.widgets.generalJuexing.generalJuexing:setVisible(false)
			end

			var_1_4.widgets.startJuexingState:setVisible(true)

			local var_70_17 = var_0_1[arg_70_0.generalId]
			local var_70_18 = var_70_17 ~= nil and var_70_17.txtId ~= nil and language.get(var_70_17.txtId) or ""

			var_1_4.widgets.condtion:setString(var_70_18)

			local function var_70_19()
				local function var_81_0(arg_82_0)
					log.info("成功开启觉醒")
					var_1_1.getGeneralInfo()
				end

				messageBox.confirm(language.get(490701), function()
					cmgr.sendRequest(var_81_0, actions.openEvoke, arg_70_0.generalId)
				end)
			end

			var_1_4.widgets.startJuexingState:addHandleOfControlEvent(var_70_19, CCControlEventTouchUpInside)
		elseif arg_70_0.evoke == 2 then
			var_1_4.widgets.generalEquipNode:setVisible(false)

			if var_1_4.widgets.generalJuexing == nil then
				local var_70_20 = require("lua/layer/general/generalJuexingData")
				local var_70_21 = {}

				uiutil.initWidgets(var_70_21, var_70_20)
				var_1_4.widgets.root:addChild(var_70_21.widgets.generalJuexing)

				var_1_4.widgets.generalJuexing = var_70_21.widgets
			end

			if var_1_4.widgets.generalJuexing then
				var_1_4.widgets.generalJuexing.generalJuexing:setVisible(true)

				if var_70_1 then
					var_1_4.widgets.generalJuexing.evokeSp:setPosition(ccp(1, -93))
					var_1_4.widgets.generalJuexing.yuciSp:setVisible(true)
					var_1_7(var_0_3)
				else
					var_1_4.widgets.generalJuexing.yuciSp:setVisible(false)
				end

				var_1_4.widgets.generalJuexing.evokeSp:setVisible(true)
			end

			var_1_1.setJuexing(arg_70_0)
		end

		if var_70_1 and arg_70_0.evoke ~= 2 then
			var_1_4.widgets.generalEquipNode:setVisible(false)

			if var_1_4.widgets.generalJuexing == nil then
				local var_70_22 = require("lua/layer/general/generalJuexingData")
				local var_70_23 = {}

				uiutil.initWidgets(var_70_23, var_70_22)
				var_1_4.widgets.root:addChild(var_70_23.widgets.generalJuexing)

				var_1_4.widgets.generalJuexing = var_70_23.widgets
			end

			if var_1_4.widgets.generalJuexing then
				var_1_4.widgets.generalJuexing.yuciSp:setVisible(true)
				var_1_4.widgets.generalJuexing.generalJuexing:setVisible(true)
				var_1_4.widgets.generalJuexing.evokeSp:setVisible(false)
			end
		end

		var_1_4.widgets.btn_equip:setVisible(true)
		var_1_4.widgets.fujiangButton:setVisible(false)
		var_1_4.widgets.fujiangCancelButton:setVisible(false)
		var_1_4.widgets.fujiangMain:setVisible(false)
		var_1_4.widgets.bingli:setPosition(ccp(17, 165))
		var_1_4.widgets.tokenNumLabel:setVisible(true)
		var_1_4.widgets.timerNode:setPosition(ccp(170, 147))

		if arg_70_0.chiefId then
			var_1_4.widgets.timerNode:setPosition(ccp(170, 187))
			var_1_4.widgets.bingli:setPosition(ccp(17, 205))
			var_1_4.widgets.tokenNumLabel:setVisible(false)
			var_1_4.widgets.btn_equip:setVisible(false)
			var_1_4.widgets.fujiangButton:setVisible(true)
			var_1_4.widgets.fujiangCancelButton:setVisible(false)
			swallowTouch(var_1_4.widgets.fujiangMain)

			local function var_70_24()
				var_1_4.widgets.fujiangButton:setVisible(false)
				var_1_4.widgets.fujiangCancelButton:setVisible(true)
				var_1_4.widgets.fujiangMain:setVisible(true)
			end

			local function var_70_25()
				var_1_4.widgets.fujiangButton:setVisible(true)
				var_1_4.widgets.fujiangCancelButton:setVisible(false)
				var_1_4.widgets.fujiangMain:setVisible(false)
			end

			var_1_4.widgets.fujiangButton:addHandleOfControlEvent(var_70_24, CCControlEventTouchUpInside)
			var_1_4.widgets.fujiangCancelButton:addHandleOfControlEvent(var_70_25, CCControlEventTouchUpInside)
		end

		var_1_4.widgets.generalEquipWeapon:removeChildByTag(var_0_4.EquipTag, true)
		var_1_4.widgets.generalEquipArmor:removeChildByTag(var_0_4.EquipTag, true)
		var_1_4.widgets.generalEquipBingFu:removeChildByTag(var_0_4.EquipTag, true)
		var_1_4.widgets.generalEquipHorse:removeChildByTag(var_0_4.EquipTag, true)
		var_1_4.widgets.generalEquipCloak:removeChildByTag(var_0_4.EquipTag, true)
		var_1_4.widgets.generalEquipFlag:removeChildByTag(var_0_4.EquipTag, true)
		var_1_4.widgets.generalEquipTreasure:removeChildByTag(var_0_4.EquipTag, true)
		var_1_4.widgets.generalEquipWeapon:setUserObject(CCInteger:create(1))
		var_1_4.widgets.generalEquipHorse:setUserObject(CCInteger:create(2))
		var_1_4.widgets.generalEquipArmor:setUserObject(CCInteger:create(3))
		var_1_4.widgets.generalEquipCloak:setUserObject(CCInteger:create(4))
		var_1_4.widgets.generalEquipBingFu:setUserObject(CCInteger:create(5))
		var_1_4.widgets.generalEquipFlag:setUserObject(CCInteger:create(6))
		var_1_4.widgets.generalEquipWeapon:addHandleOfControlEvent(var_1_1.onEquipClick, CCControlEventTouchUpInside)
		var_1_4.widgets.generalEquipArmor:addHandleOfControlEvent(var_1_1.onEquipClick, CCControlEventTouchUpInside)
		var_1_4.widgets.generalEquipBingFu:addHandleOfControlEvent(var_1_1.onEquipClick, CCControlEventTouchUpInside)
		var_1_4.widgets.generalEquipHorse:addHandleOfControlEvent(var_1_1.onEquipClick, CCControlEventTouchUpInside)
		var_1_4.widgets.generalEquipCloak:addHandleOfControlEvent(var_1_1.onEquipClick, CCControlEventTouchUpInside)
		var_1_4.widgets.generalEquipFlag:addHandleOfControlEvent(var_1_1.onEquipClick, CCControlEventTouchUpInside)

		for iter_70_0 = 1, 2 do
			local var_70_26 = var_1_4.widgets["btn_medal" .. iter_70_0]

			var_70_26:setHighlighted(false)
			var_70_26:addHandleOfControlEvent(function()
				log.info("btn_medal" .. iter_70_0)

				for iter_86_0 = 1, 2 do
					var_1_4.widgets["btn_medal" .. iter_86_0]:setHighlighted(iter_70_0 == iter_86_0)
				end

				local function var_86_0(arg_87_0)
					local var_87_0 = {
						y = 0,
						name = "layer",
						type = "layer",
						x = 0,
						children = {
							{
								y = 290,
								name = "bg",
								type = "sprite9",
								x = 620,
								pic = {
									frame = true,
									path = "bigPanel.png"
								},
								middleRect = CCRectMake(30, 30, 45, 45),
								preferedSize = CCSizeMake(400, 560),
								children = {
									{
										x = 350,
										name = "btn_close",
										h = 33,
										type = "button",
										w = 32,
										y = 575,
										scale = 2,
										normal = {
											frame = true,
											path = "btn_close_a.png"
										},
										touched = {
											frame = true,
											path = "btn_close_c.png"
										}
									}
								}
							}
						}
					}
					local var_87_1 = {
						y = 0,
						name = "node",
						type = "node",
						x = 0,
						children = {
							{
								y = 0,
								x = 200,
								type = "sprite",
								scale = 0.85,
								anchorPoint = ccp(0.5, 0),
								pic = {
									path = "res/ui/rankInfo/DailyFeatView/gxb_ph_bg.png"
								}
							},
							{
								y = 48.5,
								name = "bg",
								type = "sprite",
								x = 66.5,
								pic = {
									path = picQualityFrame[0]
								},
								children = {
									{
										y = 38,
										name = "icon",
										x = 38,
										type = "sprite"
									}
								}
							},
							{
								fontSize = 22,
								name = "name",
								y = 96,
								type = "label",
								x = 120,
								anchorPoint = ccp(0, 1)
							},
							{
								fontSize = 19,
								name = "effect",
								y = 2,
								type = "label",
								x = 120,
								color = tool.hexToRgb("#FFFFCC"),
								anchorPoint = ccp(0, 0)
							},
							{
								fontSize = 28,
								name = "info",
								y = 2,
								type = "label",
								x = 376,
								anchorPoint = ccp(1, 0)
							}
						}
					}

					local function var_87_2(arg_88_0, arg_88_1)
						log.info("cell touched at : ", arg_88_1:getIdx())

						local var_88_0 = arg_87_0[arg_88_1:getIdx() + 1]
						local var_88_1 = {}

						for iter_88_0, iter_88_1 in ipairs(var_88_0.effects) do
							var_88_1[iter_88_1.type] = var_88_0.isOn and -1 * iter_88_1.value or iter_88_1.value
						end

						if not var_88_0.isOn then
							local var_88_2

							for iter_88_2, iter_88_3 in ipairs(arg_87_0) do
								if iter_88_3.isOn then
									var_88_2 = iter_88_3

									break
								end
							end

							if var_88_2 then
								for iter_88_4, iter_88_5 in ipairs(var_88_2.effects) do
									var_88_1[iter_88_5.type] = var_88_1[iter_88_5.type] - iter_88_5.value
								end
							end
						end

						local var_88_3 = {
							attReduce = var_88_1.Att,
							defReduce = var_88_1.Def,
							bloodReduce = var_88_1.Blood
						}

						local function var_88_4(arg_89_0)
							var_1_1.showAttributeChangeTip(var_88_3)
							var_1_1.getGeneralInfo()
							var_1_4.widgets.btn_medal1:setHighlighted(false)
							var_1_4.widgets.btn_medal2:setHighlighted(false)
							var_1_4.widgets.layer_medal:removeFromParentAndCleanup(true)

							local var_89_0

							if var_88_0.isOn then
								var_89_0 = CCSprite:create("res/ui/general/xz_btn_xunzhang_add.png"):displayFrame()
							else
								var_89_0 = tool.spriteFrameByName(var_88_0.pic .. ".jpg")
							end

							var_1_4.widgets["icon_medal" .. iter_70_0]:setDisplayFrame(var_89_0)
						end

						if var_88_0.isOn then
							cmgr.sendRequest(var_88_4, actions.equipUnloadMedal, arg_70_0.vId, iter_70_0)
						else
							cmgr.sendRequest(var_88_4, actions.equiUseMedal, arg_70_0.vId, iter_70_0, var_88_0.vId)
						end
					end

					local function var_87_3(arg_90_0, arg_90_1)
						return 105, 480
					end

					local function var_87_4(arg_91_0, arg_91_1)
						local var_91_0 = arg_91_0:dequeueCell()

						if var_91_0 then
							var_91_0:removeAllChildrenWithCleanup(true)
						else
							var_91_0 = CCTableViewCell:new()
						end

						local var_91_1 = arg_87_0[arg_91_1 + 1]

						if var_91_1 then
							local var_91_2 = {}

							uiutil.initWidgets(var_91_2, var_87_1)
							var_91_0:addChild(var_91_2.widgets.node)
							var_91_2.widgets.bg:setDisplayFrame(CCSprite:create(picQualityFrame[var_91_1.quality]):displayFrame())
							var_91_2.widgets.icon:setDisplayFrame(tool.spriteFrameByName(var_91_1.pic .. ".jpg"))
							var_91_2.widgets.name:setString(var_91_1.name)
							var_91_2.widgets.name:setColor(colorQuality[var_91_1.quality])

							local var_91_3 = {}

							for iter_91_0, iter_91_1 in ipairs(var_91_1.effects) do
								var_91_3[iter_91_1.type] = iter_91_1.value
							end

							var_91_2.widgets.effect:setString(language.get(102017, var_91_3.Att, var_91_3.Def, var_91_3.Blood))
							var_91_2.widgets.info:setString(language.get(var_91_1.isOn and 1060030 or 1060031))
							var_91_2.widgets.info:setColor(tool.hexToRgb(var_91_1.isOn and "#CCB986" or "#FFFFCC"))
						end

						return var_91_0
					end

					local function var_87_5()
						if arg_87_0 and #arg_87_0 > 0 then
							return #arg_87_0
						else
							return 0
						end
					end

					local var_87_6 = {}

					uiutil.initWidgets(var_87_6, var_87_0)
					var_1_0:addChild(var_87_6.widgets.layer)
					swallowTouch(var_87_6.widgets.layer)

					var_1_4.widgets.layer_medal = var_87_6.widgets.layer

					var_87_6.widgets.btn_close:addHandleOfControlEvent(function()
						log.info("btn_close")
						var_1_4.widgets.btn_medal1:setHighlighted(false)
						var_1_4.widgets.btn_medal2:setHighlighted(false)
						var_87_6.widgets.layer:removeFromParentAndCleanup(true)
					end, CCControlEventTouchUpInside)

					local var_87_7 = CCTableView:create(CCSizeMake(400, 540))

					var_87_7:setPosition(0, 10)
					var_87_7:setDirection(kCCScrollViewDirectionVertical)
					var_87_7:setVerticalFillOrder(kCCTableViewFillTopDown)
					var_87_6.widgets.bg:addChild(var_87_7)
					var_87_7:registerScriptHandler(var_87_2, CCTableView.kTableCellTouched)
					var_87_7:registerScriptHandler(var_87_3, CCTableView.kTableCellSizeForIndex)
					var_87_7:registerScriptHandler(var_87_4, CCTableView.kTableCellSizeAtIndex)
					var_87_7:registerScriptHandler(var_87_5, CCTableView.kNumberOfCellsInTableView)
					var_87_7:reloadData()
				end

				local function var_86_1(arg_94_0)
					local var_94_0 = arg_94_0.action.data

					var_86_0(var_94_0.medals)
				end

				cmgr.sendRequest(var_86_1, actions.equipGetMedals, arg_70_0.vId, iter_70_0)
			end, CCControlEventTouchUpInside)
		end

		if var_1_4.widgets.generalJuexing then
			var_1_4.widgets.generalJuexing.JuexingTaozhuang:removeChildByTag(var_0_4.EquipTag, true)
			var_1_4.widgets.generalJuexing.JuexingTaozhuang:setUserObject(CCInteger:create(1))
			var_1_4.widgets.generalJuexing.JuexingTaozhuang:addHandleOfControlEvent(var_1_1.onEquipClick, CCControlEventTouchUpInside)
			var_1_4.widgets.generalJuexing.JuexingBaowu:removeChildByTag(var_0_4.EquipTag, true)
			var_1_4.widgets.generalJuexing.yuciBaowu1:removeChildByTag(var_0_4.EquipTag, true)
			var_1_4.widgets.generalJuexing.yuciBaowu2:removeChildByTag(var_0_4.EquipTag, true)
		end

		local var_70_27

		if arg_70_0.equipWithSuit then
			var_70_27 = arg_70_0.suitPic
		end

		if arg_70_0.equips == nil and arg_70_0.chiefId then
			for iter_70_1, iter_70_2 in pairs(var_1_1.generals) do
				if iter_70_2.generalId == arg_70_0.chiefId then
					arg_70_0.equips = iter_70_2.equips
				end
			end
		end

		if arg_70_0.equips then
			for iter_70_3, iter_70_4 in pairs(arg_70_0.equips) do
				local var_70_28

				if iter_70_4.type == 1 then
					if arg_70_0.evoke ~= 2 and not var_70_1 then
						var_70_28 = var_1_4.widgets.generalEquipWeapon
					else
						var_70_28 = var_1_4.widgets.generalJuexing.JuexingTaozhuang
					end
				elseif iter_70_4.type == 2 then
					var_70_28 = var_1_4.widgets.generalEquipHorse
				elseif iter_70_4.type == 3 then
					var_70_28 = var_1_4.widgets.generalEquipArmor
				elseif iter_70_4.type == 4 then
					var_70_28 = var_1_4.widgets.generalEquipCloak
				elseif iter_70_4.type == 5 then
					var_70_28 = var_1_4.widgets.generalEquipBingFu
				elseif iter_70_4.type == 6 then
					var_70_28 = var_1_4.widgets.generalEquipFlag
				end

				if var_70_28 then
					var_70_28:removeChildByTag(var_0_4.TipTag, true)

					if iter_70_4.change then
						local var_70_29 = CCSprite:create("res/ui/equip/store/equipment_store_notice.png")

						var_70_29:setPosition(ccp(2, 100))
						var_70_28:addChild(var_70_29, 1, var_0_4.TipTag)
					end

					if iter_70_4.vId and iter_70_4.pic then
						iter_70_4.pic = var_70_27 or iter_70_4.pic

						local var_70_30 = CCSprite:createWithSpriteFrameName(string.format("%s.jpg", iter_70_4.pic))

						var_70_30:setPosition(ccp(51, 51))

						if iter_70_4.pic == "jfh" or iter_70_4.pic == "jqh" or iter_70_4.pic == "jbx" or iter_70_4.pic == "jlg" or iter_70_4.pic == "jzl" or iter_70_4.pic == "jfhtz" or iter_70_4.pic == "jqhtz" or iter_70_4.pic == "jbxtz" or iter_70_4.pic == "jlgtz" or iter_70_4.pic == "jzltz" then
							local var_70_31 = rmgr.getAnimation("jitaozhuang")

							if var_70_31 then
								local var_70_32 = CCAnimation:createWithSpriteFrames(var_70_31, 0.04)
								local var_70_33 = CCAnimate:create(var_70_32)
								local var_70_34 = CCRepeatForever:create(var_70_33)
								local var_70_35 = CCSprite:create()

								var_70_35:setScale(0.85)
								var_70_35:setPosition(var_70_30:getContentSize().width / 2, var_70_30:getContentSize().height / 2)
								var_70_35:runAction(var_70_34)
								var_70_30:addChild(var_70_35)
							end
						end

						var_70_28:addChild(var_70_30, 1, var_0_4.EquipTag)

						if iter_70_4.maxSkillNum and iter_70_4.maxSkillNum > 0 then
							local var_70_36 = 0
							local var_70_37 = iter_70_4.maxSkillNum

							if iter_70_4.refreshAttribute then
								var_70_36 = #iter_70_4.refreshAttribute
								var_70_37 = var_70_37 - var_70_36
							end

							if var_70_37 > 0 or var_70_36 > 0 then
								local var_70_38 = CCLayerColor:create(ccc4(0, 0, 0, 175))

								var_70_38:setContentSize(CCSizeMake(72, 18))
								var_70_30:addChild(var_70_38)
							end

							local var_70_39 = 9
							local var_70_40 = 9

							for iter_70_5 = 1, var_70_36 do
								local var_70_41 = CCSprite:createWithSpriteFrameName("star_light.png")

								var_70_41:setPosition(ccp(var_70_39, var_70_40))
								var_70_41:setScale(0.75)
								var_70_30:addChild(var_70_41, 200)

								var_70_39 = var_70_39 + 18
							end

							for iter_70_6 = 1, var_70_37 do
								local var_70_42 = CCSprite:createWithSpriteFrameName("star_dark.png")

								var_70_42:setPosition(ccp(var_70_39, var_70_40))
								var_70_30:addChild(var_70_42, 200)
								var_70_42:setScale(0.75)

								var_70_39 = var_70_39 + 18
							end
						end
					end
				end
			end
		end

		local var_70_43 = false

		if var_70_27 == "jfh" or var_70_27 == "jqh" or var_70_27 == "jbx" or var_70_27 == "jlg" or var_70_27 == "jzl" or var_70_27 == "jfhtz" or var_70_27 == "jqhtz" or var_70_27 == "jbxtz" or var_70_27 == "jlgtz" or var_70_27 == "jzltz" then
			var_70_43 = true
		end

		var_1_4.widgets.node_medal:setVisible(var_70_43)

		if var_70_43 then
			table.sort(arg_70_0.medals, function(arg_95_0, arg_95_1)
				return arg_95_0.index < arg_95_1.index
			end)

			for iter_70_7, iter_70_8 in ipairs(arg_70_0.medals) do
				local var_70_44

				if iter_70_8.pic then
					var_70_44 = tool.spriteFrameByName(iter_70_8.pic .. ".jpg")
				else
					var_70_44 = CCSprite:create("res/ui/general/xz_btn_xunzhang_add.png"):displayFrame()
				end

				var_1_4.widgets["icon_medal" .. iter_70_7]:setDisplayFrame(var_70_44)
			end
		end

		if var_1_1.selectGeneral.generalLv < 35 then
			local var_70_45 = CCStrokeLabelTTF:create(language.get(82015), "Thonburi-Bold", 22)

			var_70_45:setPosition(ccp(51, 51))
			var_1_4.widgets.generalEquipTreasure:addChild(var_70_45, 1, var_0_4.EquipTag)
			var_1_4.widgets.generalEquipTreasure:setEnabled(false)

			if var_1_4.widgets.generalJuexing then
				var_1_4.widgets.generalJuexing.JuexingBaowu:setEnabled(false)

				local var_70_46 = CCStrokeLabelTTF:create(language.get(82015), "Thonburi-Bold", 22)

				var_70_46:setPosition(ccp(51, 51))
				var_1_4.widgets.generalJuexing.JuexingBaowu:addChild(var_70_46, 1, var_0_4.EquipTag)
			end
		else
			var_1_4.widgets.generalEquipTreasure:setEnabled(true)
			var_1_4.widgets.generalEquipTreasure:addHandleOfControlEvent(var_1_1.onTreasureClick, CCControlEventTouchUpInside)

			if var_1_4.widgets.generalJuexing then
				var_1_4.widgets.generalJuexing.JuexingBaowu:setEnabled(true)
				var_1_4.widgets.generalJuexing.JuexingBaowu:addHandleOfControlEvent(var_1_1.onTreasureClick, CCControlEventTouchUpInside)
			end
		end

		if arg_70_0.goods == nil and arg_70_0.chiefId then
			for iter_70_9, iter_70_10 in pairs(var_1_1.generals) do
				if iter_70_10.generalId == arg_70_0.chiefId then
					arg_70_0.goods = iter_70_10.goods
				end
			end
		end

		if arg_70_0.goods then
			for iter_70_11, iter_70_12 in pairs(arg_70_0.goods) do
				local var_70_47 = CCSprite:createWithSpriteFrameName(string.format("%s.jpg", iter_70_12.pic))

				var_70_47:setPosition(ccp(51, 51))
				var_1_4.widgets.generalEquipTreasure:removeChildByTag(var_0_4.EquipTag, true)
				var_1_4.widgets.generalEquipTreasure:addChild(var_70_47, 1, var_0_4.EquipTag)

				local var_70_48 = CCSprite:createWithSpriteFrameName(string.format("%s.jpg", iter_70_12.pic))

				var_70_48:setPosition(ccp(51, 51))

				if var_1_4.widgets.generalJuexing and var_1_4.widgets.generalJuexing.JuexingBaowu then
					var_1_4.widgets.generalJuexing.JuexingBaowu:removeChildByTag(var_0_4.EquipTag, true)
					var_1_4.widgets.generalJuexing.JuexingBaowu:addChild(var_70_48, 1, var_0_4.EquipTag)
				end

				var_1_1.treasure = iter_70_12
			end
		end

		var_1_1.ycbw1 = nil
		var_1_1.ycbw2 = nil

		if arg_70_0.ycbwList then
			for iter_70_13, iter_70_14 in pairs(arg_70_0.ycbwList) do
				if iter_70_14.name ~= nil then
					local var_70_49 = CCSprite:createWithSpriteFrameName(string.format("%s.jpg", iter_70_14.pic))

					var_70_49:setPosition(ccp(51, 51))

					if var_1_4.widgets.generalJuexing and var_1_4.widgets.generalJuexing["yuciBaowu" .. iter_70_14.pos] then
						var_1_4.widgets.generalJuexing["yuciBaowu" .. iter_70_14.pos]:addChild(var_70_49, 1, var_0_4.EquipTag)
					end

					var_1_1["ycbw" .. iter_70_14.pos] = iter_70_14
				end
			end

			var_1_4.widgets.generalJuexing.yuciBaowu1:setEnabled(true)
			var_1_4.widgets.generalJuexing.yuciBaowu1:addHandleOfControlEvent(var_1_1.onYb1Click, CCControlEventTouchUpInside)
			var_1_4.widgets.generalJuexing.yuciBaowu2:setEnabled(true)
			var_1_4.widgets.generalJuexing.yuciBaowu2:addHandleOfControlEvent(var_1_1.onYb2Click, CCControlEventTouchUpInside)
		end

		var_1_4.widgets.fujiangKuang:removeChildByTag(var_0_4.DeputyTag, true)
		var_1_4.widgets.fujiangKuang:setEnabled(false)

		if arg_70_0.isDeputy == true then
			var_1_4.widgets.switchShowGeneralButton:setVisible(true)
			var_1_4.widgets.switchShowGeneralButtonText:setString(language.get(83034))
			var_1_4.widgets.switchShowGeneralButton:addHandleOfControlEvent(var_1_1.onZhuJiangClicked, CCControlEventTouchUpInside)
		elseif arg_70_0.isChief == true then
			var_1_4.widgets.switchShowGeneralButton:setVisible(true)
			var_1_4.widgets.switchShowGeneralButtonText:setString(language.get(83035))
			var_1_4.widgets.switchShowGeneralButton:addHandleOfControlEvent(var_1_1.onFuJiangClicked, CCControlEventTouchUpInside)
		else
			var_1_4.widgets.switchShowGeneralButton:setVisible(false)
		end

		if arg_70_0.deputyPic then
			local var_70_50 = CCSprite:create("res/ui/common/generalPic/generalPic_" .. arg_70_0.deputyPic .. ".jpg")

			var_70_50:setPosition(ccp(51, 51))
			var_1_4.widgets.fujiangKuang:setEnabled(true)
			var_1_4.widgets.fujiangKuang:addHandleOfControlEvent(var_1_1.onFuJiangClicked, CCControlEventTouchUpInside)
			var_1_4.widgets.fujiangKuang:addChild(var_70_50, 1, var_0_4.DeputyTag)
		else
			local var_70_51 = CCStrokeLabelTTF:create(language.get(82021), "Thonburi-Bold", 22)

			var_70_51:setPosition(ccp(51, 51))
			var_70_51:setDimensions(CCSizeMake(80, 0))
			var_1_4.widgets.fujiangKuang:addChild(var_70_51, 1, var_0_4.DeputyTag)
		end

		var_1_1.InPrison(arg_70_0)
	end

	local var_1_9 = var_1_8

	function var_1_8(arg_96_0)
		local function var_96_0(arg_97_0)
			local var_97_0 = arg_97_0.action.data

			arg_96_0.generalExp = var_97_0.generalExp
			arg_96_0.generalExpMax = var_97_0.generalExpMax
			arg_96_0.terrain = var_97_0.terrain
			arg_96_0.tacticId = var_97_0.tacticId
			arg_96_0.tts = var_97_0.tts
			arg_96_0.quality = var_97_0.quality

			var_1_9(arg_96_0)
		end

		cmgr.sendRequest(var_96_0, actions.getGeneralTips, arg_96_0.generalId)
	end

	local function var_1_10(arg_98_0)
		local var_98_0 = arg_98_0.action.data.ycbwList
		local var_98_1 = {}

		for iter_98_0, iter_98_1 in pairs(var_98_0) do
			iter_98_1.isYcbw = true

			if not iter_98_1.wearing then
				table.insert(var_98_1, iter_98_1)
			end
		end

		var_1_1.showEquips(var_98_1, false)
	end

	function var_1_1.getYcbw(arg_99_0, arg_99_1)
		cmgr.sendRequest(var_1_10, actions.getWearableYcbw, arg_99_0, arg_99_1)
	end

	local function var_1_11(arg_100_0)
		local var_100_0 = arg_100_0.action.data.generalTreasures

		for iter_100_0, iter_100_1 in pairs(var_100_0) do
			iter_100_1.isTreasure = true
		end

		var_1_1.showEquips(var_100_0, false)
	end

	function var_1_1.getTreasure(arg_101_0)
		cmgr.sendRequest(var_1_11, actions.getGeneralTreasureInfo, arg_101_0)
	end

	local function var_1_12(arg_102_0)
		var_1_1.equipToWear = arg_102_0.action.data.equips
		var_1_1.equipHasWeared = nil

		local var_102_0 = {}

		for iter_102_0, iter_102_1 in pairs(var_1_1.equipToWear) do
			if iter_102_1.generalId then
				var_1_1.equipHasWeared = iter_102_1
			else
				table.insert(var_102_0, iter_102_1)
			end
		end

		var_1_1.showEquips(var_102_0, true)

		if var_1_1.tempGuideCell then
			local var_102_1, var_102_2 = tool.getPositionInScreen(var_1_1.tempGuideCell)

			guide.control.loadGuide2(7, var_102_1 + 50, var_102_2 + 100, true, user.curMainTask.introLong)

			var_1_1.tempGuideCell = nil
		end
	end

	function var_1_1.getEquip(arg_103_0, arg_103_1)
		cmgr.sendRequest(var_1_12, actions.getWearEquip, arg_103_0, arg_103_1)
	end

	local function var_1_13(arg_104_0)
		var_1_4.widgets.equipStoreView:setVisible(false)
		var_1_4.widgets.equipTipPanel:setVisible(false)

		var_1_1.treasure = nil

		if var_1_1.selectWearedEquip then
			var_1_1.selectWearedEquip:setHighlighted(false)

			var_1_1.selectWearedEquip = nil
		end

		for iter_104_0, iter_104_1 in pairs(var_1_1.generals) do
			if arg_104_0 == iter_104_1.generalId then
				var_1_1.isShowFujiang = false
				var_1_1.selectGeneral = iter_104_1

				var_1_1.getSingleGeneralInfo()

				return
			end
		end

		for iter_104_2, iter_104_3 in pairs(var_1_1.deputyInfos) do
			iter_104_3.generalId = iter_104_3.deputyGeneralId

			if arg_104_0 == iter_104_3.generalId then
				var_1_1.isShowFujiang = true
				var_1_1.selectGeneral = iter_104_3

				var_1_1.getSingleGeneralInfo()

				return
			end
		end
	end

	local function var_1_14(arg_105_0)
		local var_105_0 = arg_105_0.action.data

		if var_105_0.evokeReward then
			user.evokeReward = var_105_0.evokeReward

			roleDialogue.control.loadSpeak(1960)
		else
			user.evokeReward = {}
		end

		var_1_1.generals = var_105_0.military
		var_1_1.deputyInfos = var_105_0.deputyInfos
		var_1_1.token = var_105_0.token
		var_1_1.evokeGemNum = var_105_0.evokeGemNum
		var_1_1.evokeGoldNum = var_105_0.evokeGoldNum
		var_1_1.evokeStoneNum = var_105_0.evokeStoneNum
		var_1_1.evokeDrink2302Num = var_105_0.evokeDrink2302Num
		var_1_1.evokeDukangNum = var_105_0.evokeDukangNum
		var_1_1.evokeType = var_105_0.evokeType
		var_1_1.evokeSkills = var_105_0.evokeSkills
		var_1_1.evokeAttMax = var_105_0.evokeAttMax
		var_1_1.evokeDefMax = var_105_0.evokeDefMax
		var_1_1.evokeHpMax = var_105_0.evokeHpMax
		var_1_1.evokeBuffCd = var_105_0.evokeBuffCd

		local var_105_1

		if var_1_1.selectGeneral then
			var_105_1 = var_1_1.selectGeneral.generalId
		end

		if var_1_1.generalSelectorPanel then
			var_1_0:removeChild(var_1_1.generalSelectorPanel, true)
		end

		if user.curMainTask.taskId == 48 then
			var_105_1 = 225
		elseif user.curMainTask.taskId == 60 then
			var_105_1 = 259
		elseif user.curMainTask.taskId == 690 then
			var_105_1 = 239
		elseif user.curMainTask.taskId == 860 then
			var_105_1 = 209
		end

		if arg_1_1.iskfgz and user.player.kfGenerals then
			for iter_105_0, iter_105_1 in pairs(var_1_1.generals) do
				for iter_105_2, iter_105_3 in pairs(user.player.kfGenerals) do
					if iter_105_1.generalId == iter_105_3.id then
						iter_105_1.generalState = iter_105_3.generalState
						iter_105_1.forcesMax = iter_105_3.forcesMax
						iter_105_1.forces = math.floor(iter_105_3.forces)

						break
					end
				end
			end
		end

		var_1_1.isDefaultPage = true

		if conf.language == "vie" or conf.language == "tha" then
			var_1_1.generalSelectorPanel = createGeneralSelectPanel2(var_1_1.generals, function(...)
				if var_1_1.isDefaultPage == false then
					var_1_1.isShowFujiang = false
				end

				var_1_13(...)

				if var_1_1.isDefaultPage == true then
					var_1_1.isDefaultPage = false
				end
			end, var_105_1, var_1_1.deputyInfo)
		else
			var_1_1.generalSelectorPanel = createGeneralSelectPanel(var_1_1.generals, function(...)
				if var_1_1.isDefaultPage == false then
					var_1_1.isShowFujiang = false
				end

				var_1_13(...)

				if var_1_1.isDefaultPage == true then
					var_1_1.isDefaultPage = false
				end
			end, var_105_1, var_1_1.deputyInfo)
		end

		var_1_0:addChild(var_1_1.generalSelectorPanel)
		var_1_1.showFujiangCaozuo(arg_105_0)
	end

	function var_1_1.getGeneralInfo()
		cmgr.sendRequest(var_1_14, actions.generalInfos2)
	end

	function var_1_1.getSingleGeneralInfo(arg_109_0)
		local function var_109_0(arg_110_0)
			local var_110_0 = arg_110_0.data or arg_110_0.action.data

			if var_110_0.evokeReward then
				user.evokeReward = var_110_0.evokeReward

				roleDialogue.control.loadSpeak(1960)
			else
				user.evokeReward = {}
			end

			var_1_1.evokeGemNum = var_110_0.evokeGemNum or var_1_1.evokeGemNum
			var_1_1.evokeGoldNum = var_110_0.evokeGoldNum or var_1_1.evokeGoldNum
			var_1_1.evokeStoneNum = var_110_0.evokeStoneNum or var_1_1.evokeStoneNum
			var_1_1.evokeDrink2302Num = var_110_0.evokeDrink2302Num or var_1_1.evokeDrink2302Num
			var_1_1.evokeDukangNum = var_110_0.evokeDukangNum or var_1_1.evokeDukangNum
			var_1_1.evokeType = var_110_0.evokeType or var_1_1.evokeType
			var_1_1.evokeSkills = var_110_0.evokeSkills or var_1_1.evokeSkills
			var_1_1.evokeAttMax = var_110_0.evokeAttMax or var_1_1.evokeAttMax
			var_1_1.evokeDefMax = var_110_0.evokeDefMax or var_1_1.evokeDefMax
			var_1_1.evokeHpMax = var_110_0.evokeHpMax or var_1_1.evokeHpMax
			var_1_1.evokeBuffCd = var_110_0.evokeBuffCd or var_1_1.evokeBuffCd
			var_1_1.zhugeWineNum = var_110_0.zhugeWineNum or 0
			var_1_1.buyZhugeWinegold = var_110_0.buyZhugeWinegold or 1000
			var_1_1.costZhugeWine = var_110_0.costZhugeWine or 1
			var_1_1.selectGeneral.equipWithSuit = false
			var_1_1.selectGeneral.vId = nil

			if var_110_0.deputyInfo then
				for iter_110_0, iter_110_1 in pairs(var_110_0.deputyInfo) do
					var_1_1.selectGeneral[iter_110_0] = iter_110_1
				end
			elseif var_110_0.chiefInfo then
				for iter_110_2, iter_110_3 in pairs(var_110_0.chiefInfo) do
					var_1_1.selectGeneral[iter_110_2] = iter_110_3
				end
			end

			var_1_8(var_1_1.selectGeneral)

			if arg_109_0 ~= true then
				var_1_1.getEquip(generalId, 0)
			end
		end

		if var_1_1.selectGeneral and var_1_1.selectGeneral.generalId then
			cmgr.sendRequest(var_109_0, actions.getSingleGeneralInfo, var_1_1.selectGeneral.generalId)
		end
	end

	function var_1_1.updateGeneral()
		var_1_8(var_1_1.selectGeneral)
	end

	function var_1_1.setJuexing(arg_112_0)
		local var_112_0 = 1234

		if var_1_4.widgets.generalJuexing == nil then
			return
		end

		if arg_112_0.evokeSkill1 and arg_112_0.evokeSkill1 >= GENERAL_JUEXING_SKILL_MAX and arg_112_0.evokeSkill2 and arg_112_0.evokeSkill2 >= GENERAL_JUEXING_SKILL_MAX and arg_112_0.evokeSkill3 and arg_112_0.evokeSkill3 >= GENERAL_JUEXING_SKILL_MAX and arg_112_0.evokeSkill4 and arg_112_0.evokeSkill4 >= GENERAL_JUEXING_SKILL_MAX and arg_112_0.evokeSkillFinal and arg_112_0.evokeSkillFinal > 0 and arg_112_0.evokeAtt and arg_112_0.evokeAtt >= var_1_1.evokeAttMax and arg_112_0.evokeDef and arg_112_0.evokeDef >= var_1_1.evokeDefMax and arg_112_0.evokeHp and arg_112_0.evokeHp >= var_1_1.evokeHpMax then
			var_0_7 = false
		else
			var_0_7 = false
		end

		var_1_4.widgets.generalJuexing.JuexingPic1:removeChildByTag(var_112_0, true)
		var_1_4.widgets.generalJuexing.JuexingPic2:removeChildByTag(var_112_0, true)
		var_1_4.widgets.generalJuexing.JuexingPic3:removeChildByTag(var_112_0, true)
		var_1_4.widgets.generalJuexing.JuexingPic4:removeChildByTag(var_112_0, true)
		var_1_4.widgets.generalJuexing.JuexingPic5:removeChildByTag(var_112_0, true)
		var_1_4.widgets.generalJuexing.DajuexingTips:removeChildByTag(var_112_0, true)

		local var_112_1 = rmgr.getSData("evoke_skill")
		local var_112_2 = rmgr.getSData("evoke_skill_on_pos")

		for iter_112_0 = 1, 4 do
			local var_112_3 = arg_112_0["evokeSkill" .. iter_112_0]
			local var_112_4 = var_1_1.selectGeneral.evokeSkills[iter_112_0]

			var_112_4.pic = var_112_2[tostring(var_112_4.esopId)].skill_pic
			var_112_4.name = var_112_2[tostring(var_112_4.esopId)].skill_name

			local var_112_5 = var_112_2[tostring(var_112_4.esopId)].type2

			if var_112_5 == "1" then
				var_112_4.intro = var_112_1[tostring(var_112_4.esId)].intro_bb
			elseif var_112_5 == "2" then
				var_112_4.intro = var_112_1[tostring(var_112_4.esId)].intro_qb
			elseif var_112_5 == "3" then
				var_112_4.intro = var_112_1[tostring(var_112_4.esId)].intro_qb2
			end

			local var_112_6 = "res/ui/general/juexing/" .. var_0_0[var_112_4.pic]

			if var_112_3 and var_112_3 > 0 then
				local var_112_7 = var_112_3 >= GENERAL_JUEXING_SKILL_MAX and "Lv.Max" or "Lv." .. var_112_3

				var_1_4.widgets.generalJuexing["JuexingLevel" .. iter_112_0]:setString(var_112_7)
				var_1_4.widgets.generalJuexing["JuexingPic" .. iter_112_0]:setDisplayFrame(CCSprite:create(var_112_6):displayFrame())
			else
				local var_112_8 = GraySprite:create(var_112_6)

				var_112_8:setPosition(ccp(36, 36))

				local var_112_9 = CCSprite:create("res/ui/general/juexing/chain.png")

				var_112_9:setPosition(ccp(36, 36))
				var_112_8:addChild(var_112_9)
				var_1_4.widgets.generalJuexing["JuexingPic" .. iter_112_0]:addChild(var_112_8, 0, var_112_0)
			end
		end

		if arg_112_0.evokeSkillFinal and arg_112_0.evokeSkillFinal > 0 then
			-- block empty
		else
			for iter_112_1 = 1, 2 do
				local var_112_10 = GraySprite:create("res/ui/general/juexing/dajuexing.png")

				var_112_10:setPosition(ccp(36, 36))

				local var_112_11 = CCSprite:create("res/ui/general/juexing/chain.png")

				var_112_11:setPosition(ccp(36, 36))
				var_112_10:addChild(var_112_11)

				if iter_112_1 == 1 then
					var_1_4.widgets.generalJuexing.JuexingPic5:addChild(var_112_10, 0, var_112_0)
				else
					var_1_4.widgets.generalJuexing.DajuexingTips:addChild(var_112_10, 0, var_112_0)
				end
			end
		end

		var_1_4.widgets.generalJuexing.dianjijuexing:addHandleOfControlEvent(var_1_1.callJuxing, CCControlEventTouchUpInside)

		if var_0_5 then
			var_1_4.widgets.generalJuexing.baoshigouOn:setVisible(false)
			var_1_4.widgets.generalJuexing.jingbigouOn:setVisible(true)
		else
			var_1_4.widgets.generalJuexing.baoshigouOn:setVisible(true)
			var_1_4.widgets.generalJuexing.jingbigouOn:setVisible(false)
		end

		if var_1_1.evokeGemNum and var_1_1.evokeGemNum > 0 then
			var_1_4.widgets.generalJuexing.baoshigouValue:setString(var_1_1.evokeGemNum)
		end

		var_1_4.widgets.generalJuexing.jingbigouValue:setVisible(true)
		var_1_4.widgets.generalJuexing.jingbiPic:setVisible(true)
		var_1_4.widgets.generalJuexing.jingbigou:setVisible(true)

		if var_1_1.evokeType and (var_1_1.evokeType == 0 or var_1_1.evokeType == 1) then
			var_1_4.widgets.generalJuexing.jingbigouValue:setString(var_1_1.evokeGoldNum)
			var_1_4.widgets.generalJuexing.jingbiPic:setDisplayFrame(tool.spriteFrameByName("res_icon_19.png"))
			var_1_4.widgets.generalJuexing.jingbigouValue:setVisible(false)
			var_1_4.widgets.generalJuexing.jingbiPic:setVisible(false)
			var_1_4.widgets.generalJuexing.jingbigou:setVisible(false)
		elseif var_1_1.evokeType and var_1_1.evokeType == 2 then
			var_1_4.widgets.generalJuexing.jingbigouValue:setString(var_1_1.evokeStoneNum)
			var_1_4.widgets.generalJuexing.jingbiPic:setDisplayFrame(tool.spriteFrameByName("res_icon_20.png"))
		elseif var_1_1.evokeType and var_1_1.evokeType == 3 then
			var_1_4.widgets.generalJuexing.jingbigouValue:setString(var_1_1.evokeDrink2302Num)
			var_1_4.widgets.generalJuexing.jingbiPic:setDisplayFrame(tool.spriteFrameByName("res_icon_114.png"))
		elseif var_1_1.evokeType and var_1_1.evokeType == 4 then
			var_1_4.widgets.generalJuexing.jingbigouValue:setString(var_1_1.evokeDukangNum)
			var_1_4.widgets.generalJuexing.jingbiPic:setDisplayFrame(CCSprite:create("res/ui/world/feud/sbxt_btn_nj.png"):displayFrame())
		elseif var_1_1.evokeType and var_1_1.evokeType == 5 then
			var_1_4.widgets.generalJuexing.jingbigouValue:setString(var_1_1.costZhugeWine)
			var_1_4.widgets.generalJuexing.jingbiPic:setDisplayFrame(CCSprite:create("res/ui/general/juexing/evokezgjl.png"):displayFrame())
		elseif var_1_1.evokeType and var_1_1.evokeType == 6 then
			var_1_4.widgets.generalJuexing.jingbigouValue:setString(1)
			var_1_4.widgets.generalJuexing.jingbiPic:setDisplayFrame(CCSprite:create("res/ui/activity/feteHero/dyqx_icon_jh.png"):displayFrame())
		end

		local function var_112_12()
			var_0_5 = true

			var_1_4.widgets.generalJuexing.baoshigouOn:setVisible(false)
			var_1_4.widgets.generalJuexing.jingbigouOn:setVisible(true)
		end

		local function var_112_13()
			var_0_5 = false

			var_1_4.widgets.generalJuexing.baoshigouOn:setVisible(true)
			var_1_4.widgets.generalJuexing.jingbigouOn:setVisible(false)
		end

		if var_1_1.evokeType and (var_1_1.evokeType == 0 or var_1_1.evokeType == 1) then
			var_112_13()
		end

		var_1_4.widgets.generalJuexing.baoshigou:addHandleOfControlEvent(var_112_13, CCControlEventTouchUpInside)
		var_1_4.widgets.generalJuexing.jingbigou:addHandleOfControlEvent(var_112_12, CCControlEventTouchUpInside)

		if var_0_6 then
			var_1_4.widgets.generalJuexing.jiexingMianban:setVisible(true)
		else
			var_1_4.widgets.generalJuexing.jiexingMianban:setVisible(false)
		end

		local function var_112_14()
			if var_0_6 == false and var_0_7 == false then
				var_0_6 = true

				var_1_4.widgets.generalJuexing.jiexingMianban:setVisible(true)
			end
		end

		local function var_112_15()
			local var_116_0 = {}
			local var_116_1 = rmgr.getSData("evoke_general")[tostring(arg_112_0.generalId)]

			arg_112_0.tacticTips = ""

			if var_116_1 then
				arg_112_0.tacticTips = var_116_1.tactic_tips
			end

			arg_112_0.tacticTips = string.gsub(arg_112_0.tacticTips, "%[br%]", "\n")
			var_116_0[1] = {
				fontSize = 18,
				height = 0,
				stroke = false,
				type = "label",
				width = 400,
				text = arg_112_0.tacticTips
			}

			var_1_1.showTips(var_116_0, 130, -110)
		end

		local function var_112_16()
			local var_117_0 = {
				{
					fontSize = 18,
					height = 0,
					type = "label",
					width = 250,
					text = language.get(490724)
				}
			}

			var_1_1.showTips(var_117_0, -210, -20)
		end

		local function var_112_17()
			local var_118_0 = {}
			local var_118_1 = var_1_1.selectGeneral.evokeSkills[1]

			var_118_0[1] = {
				fontSize = 18,
				stroke = false,
				type = "label",
				text = language.get(490731, var_118_1.name, arg_112_0.evokeSkill1)
			}
			var_118_0[2] = {
				fontSize = 18,
				stroke = false,
				type = "label",
				text = var_118_1.intro
			}

			var_1_1.showTips(var_118_0, -70, 80)
		end

		local function var_112_18()
			local var_119_0 = {}
			local var_119_1 = var_1_1.selectGeneral.evokeSkills[2]

			var_119_0[1] = {
				fontSize = 18,
				stroke = false,
				type = "label",
				text = language.get(490731, var_119_1.name, arg_112_0.evokeSkill2)
			}
			var_119_0[2] = {
				fontSize = 18,
				stroke = false,
				type = "label",
				text = var_119_1.intro
			}

			var_1_1.showTips(var_119_0, 100, 80)
		end

		local function var_112_19()
			local var_120_0 = {}
			local var_120_1 = var_1_1.selectGeneral.evokeSkills[3]

			var_120_0[1] = {
				fontSize = 18,
				stroke = false,
				type = "label",
				text = language.get(490731, var_120_1.name, arg_112_0.evokeSkill3)
			}
			var_120_0[2] = {
				fontSize = 18,
				stroke = false,
				type = "label",
				text = var_120_1.intro
			}

			var_1_1.showTips(var_120_0, -70, 0)
		end

		local function var_112_20()
			local var_121_0 = {}
			local var_121_1 = var_1_1.selectGeneral.evokeSkills[4]

			var_121_0[1] = {
				fontSize = 18,
				stroke = false,
				type = "label",
				text = language.get(490731, var_121_1.name, arg_112_0.evokeSkill4)
			}
			var_121_0[2] = {
				fontSize = 18,
				stroke = false,
				type = "label",
				text = var_121_1.intro
			}

			var_1_1.showTips(var_121_0, 100, 0)
		end

		var_1_4.widgets.generalJuexing.JueXingTipsBtn:addHandleOfControlEvent(var_112_16, CCControlEventTouchUpInside)
		var_1_4.widgets.generalJuexing.JunxingDajinengTips:addHandleOfControlEvent(var_112_15, CCControlEventTouchUpInside)
		var_1_4.widgets.generalJuexing.generalEquipJunxingDajineng:addHandleOfControlEvent(var_112_14, CCControlEventTouchUpInside)
		var_1_4.widgets.generalJuexing.JuexingXiaojineng1:addHandleOfControlEvent(var_112_17, CCControlEventTouchUpInside)
		var_1_4.widgets.generalJuexing.JuexingXiaojineng2:addHandleOfControlEvent(var_112_18, CCControlEventTouchUpInside)
		var_1_4.widgets.generalJuexing.JuexingXiaojineng3:addHandleOfControlEvent(var_112_19, CCControlEventTouchUpInside)
		var_1_4.widgets.generalJuexing.JuexingXiaojineng4:addHandleOfControlEvent(var_112_20, CCControlEventTouchUpInside)
	end

	function var_1_1.callJuxing()
		log.info("点击觉醒")

		local function var_122_0(arg_123_0)
			local var_123_0 = false
			local var_123_1 = 1
			local var_123_2 = true
			local var_123_3 = require("lua/layer/general/JuexingAnimation")
			local var_123_4 = false

			if arg_123_0.action.data and arg_123_0.action.data.effects then
				if #arg_123_0.action.data.effects > 5 then
					var_123_4 = true
				end

				for iter_123_0, iter_123_1 in pairs(arg_123_0.action.data.effects) do
					log.info(iter_123_0 .. " " .. iter_123_1.type .. " " .. iter_123_1.lv)

					if iter_123_1.type == 0 then
						local var_123_5 = iter_123_1.lv - var_1_1.selectGeneral.evokeBuff

						if var_123_5 > 0 then
							var_1_1.selectGeneral.evokeBuff = iter_123_1.lv

							var_123_3.showAnimation(var_1_0, iter_123_0, 7, 4, var_123_5, var_123_4)
						else
							local var_123_6 = {}
							local var_123_7 = 8

							for iter_123_2 = 2, 9 do
								var_123_6[iter_123_2] = 1
							end

							if var_1_1.selectGeneral.evokeSkill1 == GENERAL_JUEXING_SKILL_MAX then
								var_123_6[2] = nil
								var_123_7 = var_123_7 - 1
							end

							if var_1_1.selectGeneral.evokeSkill2 == GENERAL_JUEXING_SKILL_MAX then
								var_123_6[3] = nil
								var_123_7 = var_123_7 - 1
							end

							if var_1_1.selectGeneral.evokeSkill3 == GENERAL_JUEXING_SKILL_MAX then
								var_123_6[4] = nil
								var_123_7 = var_123_7 - 1
							end

							if var_1_1.selectGeneral.evokeSkill4 == GENERAL_JUEXING_SKILL_MAX then
								var_123_6[5] = nil
								var_123_7 = var_123_7 - 1
							end

							if var_1_1.selectGeneral.evokeSkillFinal > 0 then
								var_123_6[6] = nil
								var_123_7 = var_123_7 - 1
							end

							local var_123_8 = math.random(1, var_123_7)
							local var_123_9 = 0

							for iter_123_3 = 2, 9 do
								if var_123_6[iter_123_3] == 1 then
									var_123_9 = var_123_9 + 1

									if var_123_9 == var_123_8 then
										var_123_3.showAnimation(var_1_0, iter_123_0, iter_123_3, 3, nil, var_123_4)
									end
								end
							end
						end
					elseif iter_123_1.type == 1 then
						var_123_2 = true

						if iter_123_1.lv == 1 then
							var_123_0 = true
							var_123_1 = 1.3 + 0.4 * iter_123_0

							var_123_3.showAnimation(var_1_0, iter_123_0, 2, 1, nil, var_123_4)
						else
							var_123_3.showAnimation(var_1_0, iter_123_0, 2, 2, nil, var_123_4)
						end
					elseif iter_123_1.type == 2 then
						var_123_2 = true

						if iter_123_1.lv == 1 then
							var_123_0 = true
							var_123_1 = 1.3 + 0.4 * iter_123_0

							var_123_3.showAnimation(var_1_0, iter_123_0, 3, 1, nil, var_123_4)
						else
							var_123_3.showAnimation(var_1_0, iter_123_0, 3, 2, nil, var_123_4)
						end
					elseif iter_123_1.type == 3 then
						var_123_2 = true

						if iter_123_1.lv == 1 then
							var_123_0 = true
							var_123_1 = 1.3 + 0.4 * iter_123_0

							var_123_3.showAnimation(var_1_0, iter_123_0, 4, 1, nil, var_123_4)
						else
							var_123_3.showAnimation(var_1_0, iter_123_0, 4, 2, nil, var_123_4)
						end
					elseif iter_123_1.type == 4 then
						var_123_2 = true

						if iter_123_1.lv == 1 then
							var_123_0 = true
							var_123_1 = 1.3 + 0.4 * iter_123_0

							var_123_3.showAnimation(var_1_0, iter_123_0, 5, 1, nil, var_123_4)
						else
							var_123_3.showAnimation(var_1_0, iter_123_0, 5, 2, nil, var_123_4)
						end
					elseif iter_123_1.type == 5 then
						var_123_2 = true

						if iter_123_1.lv == 1 then
							var_123_0 = true
							var_123_1 = 1.3 + 0.4 * iter_123_0

							var_123_3.showAnimation(var_1_0, iter_123_0, 6, 1, nil, var_123_4)
						else
							var_123_3.showAnimation(var_1_0, iter_123_0, 6, 2, nil, var_123_4)
						end
					elseif iter_123_1.type == 6 then
						var_123_2 = true

						local var_123_10 = iter_123_1.lv - var_1_1.selectGeneral.evokeAtt

						var_123_3.showAnimation(var_1_0, iter_123_0, 7, 5, var_123_10, var_123_4)
					elseif iter_123_1.type == 7 then
						var_123_2 = true

						local var_123_11 = iter_123_1.lv - var_1_1.selectGeneral.evokeDef

						var_123_3.showAnimation(var_1_0, iter_123_0, 8, 6, var_123_11, var_123_4)
					elseif iter_123_1.type == 8 then
						var_123_2 = true

						local var_123_12 = iter_123_1.lv - var_1_1.selectGeneral.evokeHp

						var_123_3.showAnimation(var_1_0, iter_123_0, 9, 7, var_123_12, var_123_4)
					end
				end
			end

			if var_123_0 then
				local var_123_13 = createBaseLayer()

				local function var_123_14(arg_124_0, arg_124_1, arg_124_2)
					return true
				end

				var_123_13:registerScriptTouchHandler(var_123_14, false, true)
				var_123_13:setTouchEnabled(true)
				smgr.getLayer("tipLayer"):addChild(var_123_13, 10002)

				local var_123_15 = CCArray:create()

				var_123_15:addObject(CCDelayTime:create(var_123_1))
				var_123_15:addObject(CCCallFuncN:create(function()
					var_123_13:removeFromParentAndCleanup(true)
					var_1_1.getSingleGeneralInfo(true)
				end))
				var_123_13:runAction(CCSequence:create(var_123_15))
			elseif var_123_2 then
				var_1_1.getSingleGeneralInfo(true)
			end
		end

		local function var_122_1()
			cmgr.sendRequest(var_122_0, actions.goldEvoke, var_1_1.selectGeneral.generalId)
		end

		if var_1_1.evokeGoldNum and var_1_1.evokeGoldNum > 0 and var_1_1.selectGeneral and var_1_1.selectGeneral.generalId then
			if var_0_5 then
				if var_1_1.evokeType and var_1_1.evokeType == 2 then
					cmgr.sendRequest(var_122_0, actions.stoneEvoke, var_1_1.selectGeneral.generalId)
				elseif var_1_1.evokeType and var_1_1.evokeType == 3 then
					cmgr.sendRequest(var_122_0, actions.drinkEvokeWith2302, var_1_1.selectGeneral.generalId)
				elseif var_1_1.evokeType and var_1_1.evokeType == 4 then
					cmgr.sendRequest(var_122_0, actions.evokeWithDukang, var_1_1.selectGeneral.generalId)
				elseif var_1_1.evokeType and var_1_1.evokeType == 5 then
					cmgr.sendRequest(var_122_0, actions.evokeWithZhugeWine, var_1_1.selectGeneral.generalId)
				elseif var_1_1.evokeType and var_1_1.evokeType == 6 then
					cmgr.sendRequest(var_122_0, actions.jrclEvoke, var_1_1.selectGeneral.generalId)
				else
					messageBox.showChargeWinWithData(language.get(10003), language.get(490700, var_1_1.evokeGoldNum), "evokeGold", var_122_1)
				end
			else
				cmgr.sendRequest(var_122_0, actions.gemEvoke, var_1_1.selectGeneral.generalId)
			end
		end
	end

	function var_1_1.showTips(arg_127_0, arg_127_1, arg_127_2)
		if arg_127_1 == nil then
			arg_127_1 = 30
		end

		if arg_127_2 == nil then
			arg_127_2 = 30
		end

		local var_127_0 = createBaseLayer()

		local function var_127_1(arg_128_0, arg_128_1, arg_128_2)
			if arg_128_0 == CCTOUCHBEGAN then
				-- block empty
			elseif arg_128_0 == CCTOUCHENDED then
				smgr.getLayer("tipLayer"):removeChild(var_127_0, true)
			end

			return true
		end

		local var_127_2 = {
			tipsBg = {
				name = "smallTips",
				anchorPointX = 0.5,
				type = "pic_9_tips",
				pic = "frame:common_tip_frame_small.png",
				anchorPointY = 0.5,
				xcenter = arg_127_1,
				ycenter = arg_127_2,
				middleRect = CCRectMake(0, 0, 0, 0),
				tag = var_0_4.tipTag,
				content = {}
			}
		}

		for iter_127_0 = 1, #arg_127_0 do
			table.insert(var_127_2.tipsBg.content, arg_127_0[iter_127_0])
		end

		autoUI.initUI(var_127_0, var_127_2)
		var_127_0:registerScriptTouchHandler(var_127_1, false, true)
		var_127_0:setTouchEnabled(true)
		smgr.getLayer("tipLayer"):addChild(var_127_0, 10002)
		var_127_0:setVisible(true)
	end

	function var_1_1.handlerPushGeneral(arg_129_0)
		return
	end

	function var_1_1.update(arg_130_0)
		local var_130_0 = arg_130_0 * 1000

		if not var_1_1.generals then
			return
		end

		for iter_130_0, iter_130_1 in pairs(var_1_1.generals) do
			if iter_130_1.needTime and iter_130_1.needTime > 0 then
				iter_130_1.needTime = iter_130_1.needTime - var_130_0
			end
		end
	end

	function var_1_1.onFuJiangClicked()
		log.info("onFuJiangClicked")

		if var_1_1.selectGeneral and var_1_1.selectGeneral.deputyGeneralId then
			var_1_1.isShowFujiang = true

			var_1_13(var_1_1.selectGeneral.deputyGeneralId)
		end
	end

	function var_1_1.onZhuJiangClicked()
		log.info("onZhuJiangClicked")

		if var_1_1.selectGeneral and var_1_1.selectGeneral.chiefId then
			var_1_1.isShowFujiang = false

			var_1_13(var_1_1.selectGeneral.chiefId)
		end
	end

	function var_1_0.onEnter(arg_133_0)
		var_1_1.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_1_1.update, 1, false)

		if not arg_1_1.iskfgz then
			cmgr.registerResponseHandler(actions.pusGeneral, var_1_1.handlerPushGeneral)
		end
	end

	function var_1_0.onExit(arg_134_0)
		if not arg_1_1.iskfgz then
			cmgr.unregisterResponseHandler(actions.pusGeneral, var_1_1.handlerPushGeneral)
		end

		if var_1_1.updateSchedulerEntry then
			CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_1_1.updateSchedulerEntry)
		end
	end

	if conf.language == "vie" or conf.language == "tha" then
		local var_1_15 = CCSprite:create()

		var_1_15:setContentSize(CCSizeMake(200, 200))
		var_1_15:setPosition(ccp(var_1_4.widgets.genLeftBack:getContentSize().width * 0.5, var_1_4.widgets.genLeftBack:getContentSize().height * 0.6))
		var_1_4.widgets.genLeftBack:addChild(var_1_15)

		local var_1_16 = CCSprite:create()

		var_1_16:setContentSize(CCSizeMake(450, 86))
		var_1_16:setPosition(ccp(var_1_4.widgets.genLeftBack:getContentSize().width * 0.5, var_1_4.widgets.genLeftBack:getContentSize().height * 0.9 + 6))
		var_1_4.widgets.genLeftBack:addChild(var_1_16)

		local function var_1_17(arg_135_0, arg_135_1, arg_135_2)
			if arg_135_0 == CCTOUCHBEGAN then
				if var_0_6 ~= true or tool.checkIfTouch(var_1_4.widgets.generalJuexing.jiexingMianban, arg_135_1, arg_135_2) then
					-- block empty
				else
					var_0_6 = false

					var_1_4.widgets.generalJuexing.jiexingMianban:setVisible(false)

					return true
				end

				if tool.checkIfTouch(var_1_15, arg_135_1, arg_135_2) then
					local var_135_0 = CCStrokeLabelTTF:create(var_0_4.selectedGeneralName, "Thonburi-Bold", 26)

					var_135_0:setColor(colorText[10002])

					local var_135_1 = CCScale9Sprite:createWithSpriteFrameName("common_tip_frame_small.png")

					var_135_1:setPreferredSize(CCSizeMake(var_135_0:getContentSize().width + 20, var_135_0:getContentSize().height + 20))
					var_135_1:setPosition(arg_135_1, arg_135_2 + 120)
					var_135_0:setPosition(ccp(var_135_1:getPreferredSize().width * 0.5, var_135_1:getPreferredSize().height * 0.5))
					var_135_1:addChild(var_135_0)
					smgr.getLayer("tipLayer"):addChild(var_135_1, 0, var_0_4.GenNameTipTag)

					return true
				elseif tool.checkIfTouch(var_1_16, arg_135_1, arg_135_2) then
					local var_135_2 = CCScale9Sprite:createWithSpriteFrameName("common_tip_frame_small.png")

					var_135_2:setPreferredSize(CCSizeMake(280, 220))
					var_135_2:setPosition(ccp(arg_135_1, arg_135_2 - var_135_2:getPreferredSize().height * 0.5 - 50))

					local var_135_3 = 10
					local var_135_4 = var_135_2:getPreferredSize().height - 10
					local var_135_5 = 20
					local var_135_6 = CCStrokeLabelTTF:create(language.get(82005) .. ": " .. var_1_1.selectGeneral.att, "Thonburi", var_135_5)

					var_135_6:setColor(colorText[10002])
					var_135_6:setAnchorPoint(ccp(0, 1))
					var_135_6:setPosition(ccp(var_135_3, var_135_4))

					local var_135_7 = var_135_4 - var_135_6:getContentSize().height
					local var_135_8 = CCStrokeLabelTTF:create(language.get(82006) .. ": " .. var_1_1.selectGeneral.def, "Thonburi", var_135_5)

					var_135_8:setColor(colorText[10002])
					var_135_8:setAnchorPoint(ccp(0, 1))
					var_135_8:setPosition(ccp(var_135_3, var_135_7))

					local var_135_9 = var_135_7 - var_135_8:getContentSize().height
					local var_135_10 = CCStrokeLabelTTF:create(language.get(82007) .. ": " .. var_1_1.selectGeneral.forcesMax, "Thonburi", var_135_5)

					var_135_10:setColor(colorText[10002])
					var_135_10:setAnchorPoint(ccp(0, 1))
					var_135_10:setPosition(ccp(var_135_3, var_135_9))

					local var_135_11 = var_135_9 - var_135_10:getContentSize().height
					local var_135_12 = CCStrokeLabelTTF:create(language.get("vie_82011") .. ": " .. language.get("vie_82012"), "Thonburi", var_135_5)

					var_135_12:setColor(colorText[10002])
					var_135_12:setAnchorPoint(ccp(0, 1))
					var_135_12:setHorizontalAlignment(kCCTextAlignmentLeft)
					var_135_12:setDimensions(CCSizeMake(var_135_2:getContentSize().width - 10, 0))
					var_135_12:setPosition(ccp(var_135_3, var_135_11))

					local var_135_13 = var_135_11 - var_135_12:getContentSize().height
					local var_135_14 = CCStrokeLabelTTF:create(language.get("vie_82013") .. ": " .. language.get("vie_82014"), "Thonburi", var_135_5)

					var_135_14:setColor(colorText[10002])
					var_135_14:setAnchorPoint(ccp(0, 1))
					var_135_14:setHorizontalAlignment(kCCTextAlignmentLeft)
					var_135_14:setDimensions(CCSizeMake(var_135_2:getContentSize().width - 10, 0))
					var_135_14:setPosition(ccp(var_135_3, var_135_13))

					local var_135_15 = var_135_13 - var_135_14:getContentSize().height

					var_135_2:addChild(var_135_6)
					var_135_2:addChild(var_135_8)
					var_135_2:addChild(var_135_10)
					var_135_2:addChild(var_135_12)
					var_135_2:addChild(var_135_14)
					smgr.getLayer("tipLayer"):addChild(var_135_2, 0, var_0_4.GenTipsTag)

					return true
				end
			elseif arg_135_0 == CCTOUCHENDED then
				smgr.getLayer("tipLayer"):removeChildByTag(var_0_4.GenNameTipTag, true)
				smgr.getLayer("tipLayer"):removeChildByTag(var_0_4.GenTipsTag, true)

				return true
			end
		end

		var_1_0:setTouchEnabled(true)
		var_1_0:registerScriptTouchHandler(var_1_17, false, true)
	else
		local function var_1_18(arg_136_0, arg_136_1, arg_136_2)
			if arg_136_0 ~= CCTOUCHBEGAN or var_0_6 ~= true or tool.checkIfTouch(var_1_4.widgets.generalJuexing.jiexingMianban, arg_136_1, arg_136_2) then
				-- block empty
			else
				var_0_6 = false

				var_1_4.widgets.generalJuexing.jiexingMianban:setVisible(false)

				return true
			end
		end

		var_1_0:setTouchEnabled(true)
		var_1_0:registerScriptTouchHandler(var_1_18, false, true)
	end

	var_1_1.getGeneralInfo()

	return var_1_0
end

return var_0_4
