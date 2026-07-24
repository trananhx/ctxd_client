tool.requireRes("selectForce")

selectForceUI = {}

local var_0_0 = selectForceControl
local var_0_1 = selectForceConstant

local function var_0_2(arg_1_0)
	local var_1_0 = {
		{
			200,
			130
		},
		{
			-250,
			50
		},
		{
			100,
			-100
		}
	}

	return (ccp(tool.getVisibleSize().width / 2 + var_1_0[arg_1_0][1], tool.getVisibleSize().height / 2 + var_1_0[arg_1_0][2]))
end

local function var_0_3(arg_2_0)
	local var_2_0 = arg_2_0.data
	local var_2_1 = arg_2_0.button
	local var_2_2 = smgr.getLayer("forceLayer")
	local var_2_3 = tolua.cast(var_2_2:getChildByTag(selectForceConstant.RECOMMENDLABEL_TAG), "CCSprite")
	local var_2_4 = tolua.cast(var_2_2:getChildByTag(selectForceConstant.RECOMMENDICON_TAG), "CCSprite")

	selectForceData.forceSelected = var_2_0.id

	log.debug("select data %d", var_2_0.id)

	if var_2_0.id == selectForceData.rewardTable.forceId then
		var_2_4:setVisible(false)
		var_2_3:setVisible(true)
	else
		var_2_4:setVisible(true)
		var_2_3:setVisible(false)
	end
end

local function var_0_4()
	local var_3_0 = smgr.getLayer("forceLayer")
	local var_3_1 = tolua.cast(var_3_0:getChildByTag(var_0_1.PLAYERNAMELABEL_1_TAG), "CCLabelTTF")
	local var_3_2 = language.get(270001, selectForceData.playerNameTable[selectForceData.playerNameIndex])

	var_3_1:setString(var_3_2)

	selectForceData.playerNameIndex = selectForceData.playerNameIndex + 1

	if selectForceData.playerNameIndex > table.getn(selectForceData.playerNameTable) then
		selectForceData.playerNameIndex = 1
	end

	local var_3_3 = tolua.cast(var_3_0:getChildByTag(var_0_1.PLAYERNAMELABEL_2_TAG), "CCLabelTTF")
	local var_3_4 = language.get(270001, selectForceData.playerNameTable[selectForceData.playerNameIndex])

	var_3_3:setString(var_3_4)

	selectForceData.playerNameIndex = selectForceData.playerNameIndex + 1

	if selectForceData.playerNameIndex > table.getn(selectForceData.playerNameTable) then
		selectForceData.playerNameIndex = 1
	end
end

local function var_0_5(arg_4_0)
	local var_4_0 = arg_4_0.reward
	local var_4_1 = smgr.getLayer("forceLayer")
	local var_4_2 = language.get(270002, var_4_0.value, var_4_0.kind)
	local var_4_3 = tolua.cast(var_4_1:getChildByTag(selectForceConstant.RECOMMENDICON_TAG), "CCSprite")
	local var_4_4 = tolua.cast(var_4_1:getChildByTag(selectForceConstant.RECOMMENDLABEL_TAG), "CCSprite")

	selectForceUI.uiTable.recommendLabel:setString(var_4_2)
	var_4_3:setPosition(var_0_2(var_4_0.forceId))
	var_4_4:setPosition(var_0_2(var_4_0.forceId))
	selectForceUI.uiTable.countryBtn_control.selectButtonById(var_4_0.forceId)
	require("lua/component/CCStrokeLabelTTF")

	local var_4_5 = selectForceData.playerNameTable

	selectForceData.playerNameIndex = 1
	selectForceData.playerNameScheduleEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_0_4, 3, false)
end

local function var_0_6()
	eventManager.registerEvent(selectForceConstant.EVENT_SELECT_FORCE, tool.notNil(var_0_3))
	eventManager.registerEvent(var_0_1.EVENT_GET_FORCE_DATA, tool.notNil(var_0_5))
	var_0_0.getForceInfo()
end

local function var_0_7()
	eventManager.unregisterEvent(selectForceConstant.EVENT_SELECT_FORCE, var_0_3)
	eventManager.unregisterEvent(var_0_1.EVENT_GET_FORCE_DATA, var_0_5)

	if selectForceData.playerNameScheduleEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(selectForceData.playerNameScheduleEntry)
	end

	eventManager.unregisterEvent(var_0_1.EVENT_GET_FORCE_DATA, var_0_5)
end

local function var_0_8(arg_7_0)
	local var_7_0 = {
		"weiguoGSprite",
		"shuguoGSprite",
		"wuguoGSprite"
	}

	for iter_7_0, iter_7_1 in pairs(var_7_0) do
		selectForceUI.uiTable[iter_7_1]:setVisible(false)
	end

	selectForceUI.uiTable[var_7_0[arg_7_0]]:setVisible(true)
	amgr.playEffect(enumAudioFile.ui_click_common, false, true)
end

function selectForceUI.show()
	rmgr.loadResource("res/ui/selectForce/forces.plist")
	rmgr.loadResource("res/ui/selectPlayer/playerList_force_Layer.plist")

	local var_8_0 = createBaseLayer()

	smgr.registerLayer(var_8_0, "forceLayer")

	selectForceUI.uiTable = autoUI.initUI(var_8_0, getSelectForceData())

	local function var_8_1(arg_9_0)
		arg_9_0:setScale(1)
	end

	local var_8_2 = CCArray:create()

	for iter_8_0 = 0, 6 do
		local var_8_3 = tool.spriteFrameByName(string.format("start_%05d.png", iter_8_0))

		var_8_2:addObject(var_8_3)
	end

	local var_8_4 = CCAnimation:createWithSpriteFrames(var_8_2, 0.1)
	local var_8_5 = CCAnimate:create(var_8_4)
	local var_8_6 = CCArray:create()

	var_8_6:addObject(var_8_5)

	local var_8_7 = CCSequence:create(var_8_6)
	local var_8_8 = CCRepeatForever:create(tolua.cast(var_8_7, "CCActionInterval"))

	selectForceUI.uiTable.ringSprite:runAction(var_8_8)
	selectForceUI.uiTable.startItem:registerScriptTapHandler(var_0_0.startCallbackSelected)
	selectForceUI.uiTable.countryBtn_control.registerCallBack(var_0_8)

	var_8_0.onEnter = tool.notNil(var_0_6)
	var_8_0.onExit = tool.notNil(var_0_7)

	return var_8_0
end

return selectForceUI
