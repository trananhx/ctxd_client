fbBonus = {}

tool.requireRes("selectInstance2/fbBonus")

fbBonus.ui = {}

local var_0_0 = require("lua/common/json")

fbBonus.ui.data = {}
fbBonus.ui.npcid = nil

local var_0_1

function fbBonus.ui.init()
	fbBonus.ui.table.closeItem:setScale(2)
	fbBonus.ui.table.closeItem:registerScriptTapHandler(fbBonus.ui.clickCloseItem)

	for iter_1_0 = 1, 4 do
		fbBonus.ui.table["name_" .. iter_1_0]:setColor(ccc3(255, 255, 204))
		fbBonus.ui.table["value_" .. iter_1_0]:setColor(ccc3(255, 255, 204))
		fbBonus.ui.table["res_" .. iter_1_0]:setScale(25)
		fbBonus.ui.table["res_" .. iter_1_0]:registerScriptTapHandler(fbBonus.ui.clickGotRes)
	end

	fbBonus.ui.table.layer:setVisible(false)
end

function fbBonus.ui.onTouch(arg_2_0, arg_2_1, arg_2_2)
	return true
end

function fbBonus.ui.playKillAnimation(arg_3_0)
	local var_3_0 = rmgr.getAnimation("kill_effect")
	local var_3_1 = CCAnimation:createWithSpriteFrames(var_3_0, 0.03)
	local var_3_2 = CCAnimate:create(var_3_1)
	local var_3_3 = CCHide:create()
	local var_3_4 = CCArray:create()

	var_3_4:addObject(var_3_2)
	var_3_4:addObject(var_3_3)

	local var_3_5 = CCSequence:create(var_3_4)
	local var_3_6 = CCSprite:create()

	var_3_6:runAction(var_3_5)
	var_3_6:setPosition(ccp(47, 47))
	fbBonus.ui.table["bg_" .. arg_3_0]:addChild(var_3_6, 100)
end

function fbBonus.ui.calculateTotalNumber()
	local var_4_0 = 0

	for iter_4_0, iter_4_1 in ipairs(fbBonus.ui.data) do
		var_4_0 = var_4_0 + iter_4_1.freeCount
	end

	return var_4_0
end

function fbBonus.ui.clickGotRes(arg_5_0)
	if fbBonus.ui.data == nil then
		return
	end

	local var_5_0 = fbBonus.ui.data[arg_5_0]

	if tonumber(var_5_0.freeCount) == 0 then
		return
	end

	local function var_5_1(arg_6_0)
		local var_6_0 = arg_6_0.action.data

		var_5_0.freeCount = var_6_0.freeCount

		fbBonus.ui.update_single(arg_5_0, var_5_0)

		fbBonus.ui.data[arg_5_0] = var_5_0

		local var_6_1 = {
			{}
		}

		var_6_1[1].id = var_5_0.dropType
		var_6_1[1].value = var_5_0.dropNum

		if var_5_0.dropType == 5 then
			var_6_1[1].id = 6
		end

		if var_5_0.dropType == 46 then
			var_6_1[1].id = 40
		elseif var_5_0.dropType == 63 then
			var_6_1[1].id = 2003
		elseif var_5_0.dropType == 64 then
			var_6_1[1].id = 10033
		end

		globalAction_gotResource(var_6_1)
		fbBonus.ui.playKillAnimation(arg_5_0)

		if fbBonus.ui.calculateTotalNumber() == 0 then
			eventManager.dispatchEvent("refreshInstance")
			fbBonus.ui.clickCloseItem()

			local var_6_2 = CCSprite:create("res/ui/instance/bonus/fb_Bonus_tit_jm.png")

			var_6_2:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
			smgr.showTipSpriteText(var_6_2, nil)
		end
	end

	for iter_5_0 = 1, var_5_0.freeCount do
		cmgr.sendRequest(var_5_1, actions.recvBonusReward, fbBonus.ui.npcid, arg_5_0)
	end
end

function fbBonus.ui.getIconFrom(arg_7_0)
	local var_7_0

	if tonumber(arg_7_0) == 1 then
		var_7_0 = CCSprite:createWithSpriteFrameName("fubenDituYingliang.PNG")
	elseif tonumber(arg_7_0) == 2 then
		var_7_0 = CCSprite:createWithSpriteFrameName("fubenDituMucai.PNG")
	elseif tonumber(arg_7_0) == 3 then
		var_7_0 = CCSprite:createWithSpriteFrameName("fubenDituLiangshi.PNG")
	elseif tonumber(arg_7_0) == 4 then
		var_7_0 = CCSprite:createWithSpriteFrameName("fubenDituBingtie.PNG")
	elseif tonumber(arg_7_0) == 5 then
		var_7_0 = CCSprite:createWithSpriteFrameName("fubenDituExp.png")
	elseif tonumber(arg_7_0) == 7 then
		var_7_0 = CCSprite:createWithSpriteFrameName("fubenDituGem.png")
	elseif tonumber(arg_7_0) == 46 then
		var_7_0 = CCSprite:createWithSpriteFrameName("fubenDituHuangJin.png")
	elseif tonumber(arg_7_0) == 63 then
		var_7_0 = CCSprite:createWithSpriteFrameName("fubenDituJinLian.png")
	elseif tonumber(arg_7_0) == 64 then
		var_7_0 = CCSprite:createWithSpriteFrameName("fubenDituBaiLianGang.png")
	end

	if var_7_0 == nil then
		var_7_0 = CCSprite:create()
	end

	return var_7_0
end

function fbBonus.ui.getBonusNpcInfo(arg_8_0)
	fbBonus.ui.data = arg_8_0.action.data.detailedNpcInfo

	for iter_8_0, iter_8_1 in ipairs(fbBonus.ui.data) do
		fbBonus.ui.update_single(iter_8_0, iter_8_1)
	end

	fbBonus.ui.table.layer:setVisible(true)
end

function fbBonus.ui.update_single(arg_9_0, arg_9_1)
	fbBonus.ui.table["value_" .. arg_9_0]:setString(arg_9_1.dropNum)
	fbBonus.ui.table["cishu_" .. arg_9_0]:setString(arg_9_1.freeCount)
	fbBonus.ui.table["name_" .. arg_9_0]:setString(arg_9_1.name)

	local var_9_0 = fbBonus.ui.getIconFrom(arg_9_1.dropType)

	fbBonus.ui.table["icon_" .. arg_9_0]:setDisplayFrame(var_9_0:displayFrame())

	local var_9_1 = CCSprite:create("res/ui/common/fightPic/fightPic_" .. arg_9_1.pic .. ".png")

	fbBonus.ui.table["general_" .. arg_9_0]:setDisplayFrame(var_9_1:displayFrame())

	if tonumber(arg_9_1.freeCount) == 0 then
		tool.spriteToGray(fbBonus.ui.table["general_" .. arg_9_0])
	end
end

function fbBonus.ui.clickCloseItem()
	fbBonus.ui.table.layer:removeFromParentAndCleanup(true)

	guide.isForceMarkTrace = var_0_1
end

function fbBonus.ui.show(arg_11_0)
	local var_11_0 = createBaseLayer()

	fbBonus.ui.table = autoUI.initUI(var_11_0, getfbBonusData())
	fbBonus.ui.table.layer = var_11_0

	fbBonus.ui.init()
	var_11_0:registerScriptTouchHandler(fbBonus.ui.onTouch, false, true)
	var_11_0:setTouchEnabled(true)

	var_0_1 = guide.isForceMarkTrace
	guide.isForceMarkTrace = false
	fbBonus.ui.npcid = arg_11_0

	cmgr.sendRequest(fbBonus.ui.getBonusNpcInfo, actions.getDetailedBonusNpcInfo, arg_11_0)

	return var_11_0
end
