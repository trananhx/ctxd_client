require("lua/layer/kfsy/buyAndRule/player16/constant")
require("lua/layer/kfsy/buyAndRule/player16/control")
require("lua/layer/kfsy/buyAndRule/player16/uidata")

kfsyPlayer = {}
kfsyPlayer.uiTable = {}

local var_0_0 = {}

function kfsyPlayer.show()
	log.info("kfsyPlayer.show")

	local var_1_0 = createBaseLayer()

	kfsyPlayer.uiTable = autoUI.initUI(var_1_0, getkfsyPlayerData())

	require("lua/layer/kfsy/feastInfo")

	if kfsyInfo.feastInfo.response then
		local var_1_1 = kfsyInfo.feastInfo.response.action.data
		local var_1_2
		local var_1_3

		if user.feastType == 0 then
			var_1_2 = language.get(320415, language.get(131064), var_1_1.freeCard)
			var_1_3 = language.get(320416, "", var_1_1.goldCard)
		else
			var_1_2 = language.get(320415, language.get(320430), var_1_1.specialCard)
			var_1_3 = language.get(320416, language.get(320430), var_1_1.goldSpecialCard)
		end

		kfsyPlayer.uiTable.shiyongcard:setString(var_1_2)
		kfsyPlayer.uiTable.shiyongVipcard:setString(var_1_3)
	end

	kfsyPlayer.updateScrollView()

	return var_1_0
end

function kfsyPlayer.getRank(arg_2_0)
	if conf.language == "kr" or conf.language == "vie" or conf.language == "tha" then
		return kfsyPlayer.getRankDigit(arg_2_0)
	end

	if arg_2_0 == 1 then
		return CCSprite:create("res/ui/kfsy/kfsy_pmztgj.png")
	end

	if arg_2_0 == 2 then
		return CCSprite:create("res/ui/kfsy/kfsy_pmztyj.png")
	end

	if arg_2_0 == 3 then
		return CCSprite:create("res/ui/kfsy/kfsy_pmztjj.png")
	end

	if arg_2_0 <= 10 then
		return CCLabelAtlas:create(tostring(arg_2_0 - 1), "res/ui/kfsy/kfsy_pmzt2.png", 36, 32, 48), CCSprite:create("res/ui/kfsy/kfsy_pmzt1.png")
	end

	return CCLabelAtlas:create(tostring(9) .. tostring(arg_2_0 - 11), "res/ui/kfsy/kfsy_pmzt2.png", 36, 32, 48), CCSprite:create("res/ui/kfsy/kfsy_pmzt1.png")
end

function kfsyPlayer.getRankDigit(arg_3_0)
	if arg_3_0 == 1 then
		return CCSprite:create("res/ui/kfsy/kfsy_pmztgj.png")
	elseif arg_3_0 == 2 then
		return CCSprite:create("res/ui/kfsy/kfsy_pmztyj.png")
	elseif arg_3_0 == 3 then
		return CCSprite:create("res/ui/kfsy/kfsy_pmztjj.png")
	end

	return CCLabelAtlas:create(arg_3_0, "res/ui/kfsy/kfsy_pmzt2.png", 21, 25, 48), CCSprite:create("res/ui/kfsy/kfsy_pmzt1.png")
end

function kfsyPlayer.addRank(arg_4_0, arg_4_1)
	local var_4_0 = {}

	if conf.language == "vie" then
		var_4_0.numX = 50
	elseif conf.language == "tha" then
		var_4_0.numX = 50
	else
		var_4_0.numX = 0
	end

	local var_4_1, var_4_2 = kfsyPlayer.getRank(arg_4_1)

	arg_4_0:addChild(var_4_1)

	if var_4_2 then
		arg_4_0:addChild(var_4_2)
		var_4_2:setPosition(ccp(120, 254))
	end

	var_4_1:setPosition(ccp(123, 255))

	if arg_4_1 > 3 then
		var_4_1:setAnchorPoint(ccp(0.5, 0))
		var_4_1:setPosition(ccp(120 + var_4_0.numX, 243))
		var_4_1:setScale(0.8)
	end
end

function kfsyPlayer.tableCellHightLight(arg_5_0, arg_5_1)
	log.info("tableCellHightLight!")
end

function kfsyPlayer.tableCellUnHightLight(arg_6_0, arg_6_1)
	log.info("tableCellUnHightLight!")
end

function kfsyPlayer.tableCellTouched(arg_7_0, arg_7_1)
	for iter_7_0 = 0, 15 do
		local var_7_0 = kfsyPlayer.tableview:cellAtIndex(iter_7_0)
		local var_7_1

		if var_7_0 then
			var_7_1 = var_7_0:getChildByTag(101)
		end

		if var_7_1 then
			var_7_1:setVisible(false)
		end
	end

	local var_7_2 = arg_7_1:getChildByTag(101)

	if var_7_2 then
		var_7_2:setVisible(true)
	end

	log.info("cell:getIdx() " .. arg_7_1:getIdx())

	if kfsyInfo.feastInfo.response then
		kfsyInfo.RoomInfo.pos = kfsyInfo.feastInfo.response.action.data.rooms[arg_7_1:getIdx() + 1].pos
		kfsyInfo.RoomInfo.jiu = kfsyInfo.feastInfo.response.action.data.rooms[arg_7_1:getIdx() + 1].haveDrink

		if kfsyInfo.RoomInfo.jiu > 0 then
			kfsyInfo.RoomInfo.jiu = 1
		end
	end
end

function kfsyPlayer.cellSizeForTable(arg_8_0, arg_8_1)
	log.info("cellSizeForTable!")

	return 300, 247
end

function kfsyPlayer.tableCellAtIndex(arg_9_0, arg_9_1)
	log.info("tableCellAtIndex!")

	local var_9_0 = arg_9_0:dequeueCell()

	if var_9_0 then
		var_9_0:removeAllChildrenWithCleanup(true)
	else
		var_9_0 = CCTableViewCell:new()
	end

	local var_9_1 = CCSprite:create("res/ui/kfsy/kfsy_pmndi.png")

	var_9_1:setPosition(ccp(0, kfsyPlayerConstant.currentY - 70))
	var_9_1:setAnchorPoint(ccp(0, 0.5))

	local var_9_2 = CCSprite:create("res/ui/kfsy/kfsy_pmndih.png")

	var_9_2:setPosition(ccp(0, kfsyPlayerConstant.currentY - 70))
	var_9_2:setVisible(false)
	var_9_2:setAnchorPoint(ccp(0, 0.5))
	var_9_0:addChild(var_9_1)
	var_9_0:addChild(var_9_2, 10, 101)
	require("lua/layer/kfsy/feastInfo")

	if kfsyInfo.feastInfo.response then
		kfsyPlayer.updateRoom(var_9_1, arg_9_1 + 1)
	end

	return var_9_0
end

function kfsyPlayer.numberOfCellsInTableView(arg_10_0)
	log.info("numberOfCellsInTableView!")

	return kfsyPlayerConstant.playerNum
end

function kfsyPlayer.updateRoom(arg_11_0, arg_11_1)
	local var_11_0 = kfsyInfo.feastInfo.response.action.data

	arg_11_0:removeAllChildrenWithCleanup(true)
	kfsyPlayer.addRank(arg_11_0, var_11_0.rooms[arg_11_1].pos)

	local var_11_1 = false

	if var_11_0.rooms[arg_11_1].haveDrink > 0 then
		var_11_1 = true
	end

	local var_11_2 = 10

	if var_11_2 < var_11_0.rooms[arg_11_1].weiNum then
		var_11_2 = var_11_0.rooms[arg_11_1].weiNum
	end

	if var_11_2 < var_11_0.rooms[arg_11_1].shuNum then
		var_11_2 = var_11_0.rooms[arg_11_1].shuNum
	end

	if var_11_2 < var_11_0.rooms[arg_11_1].wuNum then
		var_11_2 = var_11_0.rooms[arg_11_1].wuNum
	end

	local var_11_3 = {
		bg = {
			xcenter = 0,
			name = "namekuang",
			type = "pic",
			ycenter = 65,
			pic = "res/ui/kfsy/kfsy_mzdi.png",
			children = {
				{
					xcenter = 0,
					z = 10,
					fontSize = 21,
					type = "label",
					ycenter = 0,
					font = "Thonburi",
					strokeSize = 2,
					text = var_11_0.rooms[arg_11_1].playerName,
					color = ccc3(255, 248, 197),
					strokeColor = ccc3(22, 18, 13)
				},
				{
					xcenter = 80,
					name = "jiulogo",
					type = "pic",
					ycenter = 40,
					pic = "res/ui/kfsy/kfsy_fgjh.png",
					visible = var_11_1
				}
			}
		},
		wu = {
			xcenter = 20,
			name = "back1",
			type = "pic",
			ycenter = 10,
			pic = "res/ui/kfsy/kfsy_back.png",
			children = {
				{
					name = "wunum",
					type = "pic_9",
					ycenter = 0,
					pic = "res/ui/kfsy/kfsy_pmjdt_wu.png",
					middleRect = CCRectMake(1, 1, 1, 12),
					preferedSize = CCSizeMake(150 / var_11_2 * var_11_0.rooms[arg_11_1].wuNum + 3, 12),
					x = (150 / var_11_2 * var_11_0.rooms[arg_11_1].wuNum + 3) / 2,
					anchorPoint = ccp(0, 0)
				},
				{
					x = -30,
					name = "wulogo",
					type = "pic",
					ycenter = 0,
					pic = "res/ui/kfsy/kfsy_wu.png"
				},
				{
					font = "Thonburi",
					fontSize = 22,
					type = "label",
					ycenter = 0,
					xcenter = 0,
					text = var_11_0.rooms[arg_11_1].wuNum,
					color = ccc3(255, 248, 197)
				}
			}
		},
		shu = {
			xcenter = 20,
			name = "back2",
			type = "pic",
			ycenter = -40,
			pic = "res/ui/kfsy/kfsy_back.png",
			children = {
				{
					name = "shunum",
					type = "pic_9",
					ycenter = 0,
					pic = "res/ui/kfsy/kfsy_pmjdt_shu.png",
					middleRect = CCRectMake(1, 1, 1, 12),
					preferedSize = CCSizeMake(150 / var_11_2 * var_11_0.rooms[arg_11_1].shuNum + 3, 12),
					x = (150 / var_11_2 * var_11_0.rooms[arg_11_1].shuNum + 3) / 2,
					anchorPoint = ccp(0, 0)
				},
				{
					x = -30,
					name = "wulogo",
					type = "pic",
					ycenter = 0,
					pic = "res/ui/kfsy/kfsy_pmshu.png"
				},
				{
					font = "Thonburi",
					fontSize = 22,
					type = "label",
					ycenter = 0,
					xcenter = 0,
					text = var_11_0.rooms[arg_11_1].shuNum,
					color = ccc3(255, 248, 197)
				}
			}
		},
		wei = {
			xcenter = 20,
			name = "back3",
			type = "pic",
			ycenter = -90,
			pic = "res/ui/kfsy/kfsy_back.png",
			children = {
				{
					name = "weinum",
					type = "pic_9",
					ycenter = 0,
					pic = "res/ui/kfsy/kfsy_pmjdt_wei.png",
					middleRect = CCRectMake(1, 1, 1, 12),
					preferedSize = CCSizeMake(150 / var_11_2 * var_11_0.rooms[arg_11_1].weiNum + 3, 12),
					x = (150 / var_11_2 * var_11_0.rooms[arg_11_1].weiNum + 3) / 2,
					anchorPoint = ccp(0, 0)
				},
				{
					x = -30,
					name = "wulogo",
					type = "pic",
					ycenter = 0,
					pic = "res/ui/kfsy/kfsy_pmwei.png"
				},
				{
					font = "Thonburi",
					fontSize = 22,
					type = "label",
					ycenter = 0,
					xcenter = 0,
					text = var_11_0.rooms[arg_11_1].weiNum,
					color = ccc3(255, 248, 197)
				}
			}
		}
	}

	autoUI.initUI(arg_11_0, var_11_3)
end

function kfsyPlayer.updateScrollView()
	local var_12_0 = CCSizeMake(590, 360)

	kfsyPlayer.tableview = CCTableView:create(var_12_0)

	kfsyPlayer.tableview:setDirection(kCCScrollViewDirectionHorizontal)
	kfsyPlayer.tableview:setAnchorPoint(ccp(0, 0))
	kfsyPlayer.tableview:setPosition(ccp(15, 0))
	kfsyPlayer.uiTable.playerBackground:addChild(kfsyPlayer.tableview)
	kfsyPlayer.tableview:registerScriptHandler(kfsyPlayer.tableCellHightLight, CCTableView.kTableCellHighLight)
	kfsyPlayer.tableview:registerScriptHandler(kfsyPlayer.tableCellUnHightLight, CCTableView.kTableCellUnhighLight)
	kfsyPlayer.tableview:registerScriptHandler(kfsyPlayer.tableCellTouched, CCTableView.kTableCellTouched)
	kfsyPlayer.tableview:registerScriptHandler(kfsyPlayer.cellSizeForTable, CCTableView.kTableCellSizeForIndex)
	kfsyPlayer.tableview:registerScriptHandler(kfsyPlayer.tableCellAtIndex, CCTableView.kTableCellSizeAtIndex)
	kfsyPlayer.tableview:registerScriptHandler(kfsyPlayer.numberOfCellsInTableView, CCTableView.kNumberOfCellsInTableView)
	kfsyPlayer.tableview:reloadData()
	log.info("scorllview up to date")
end

function kfsyPlayer.updateBar(arg_13_0)
	return
end
