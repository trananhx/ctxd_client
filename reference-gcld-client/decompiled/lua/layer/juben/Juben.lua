local var_0_0 = class("Juben", function()
	return createBaseLayer()
end)
local var_0_1 = {
	infoLayer = 10,
	mapLayer = 1,
	guideLayer = 12
}
local var_0_2 = require("lua/layer/juben/ConfigureLoader")
local var_0_3 = require("lua/layer/juben/MapLayer")
local var_0_4 = require("lua/layer/juben/InfoLayer")
local var_0_5 = require("lua/layer/juben/GuideLayer")
local var_0_6 = require("lua/layer/juben/ywNotice/ywNotice")

function var_0_0.ctor(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	log.info("gId,grade,create,%s,%s,%s", arg_2_1, arg_2_2, arg_2_3)
	eventManager.dispatchEvent("taskButtonItemSetVisible", false)

	if arg_2_1 == 100 then
		user.isYw = true
	end

	juben = juben or {}
	arg_2_0.gId = arg_2_1
	arg_2_0.grade = arg_2_2
	arg_2_0.create = arg_2_3
	arg_2_0.followGeneral = 0
	arg_2_0.warOptionTable = arg_2_4

	rmgr.loadResource("res/ui/world/worldBuilding.plist")
	rmgr.loadResource("res/ui/world/cityWindow.plist")
	rmgr.loadResource("res/ui/world/convene.plist")
	rmgr.loadResource("res/ui/world/generalMove.plist")
	rmgr.loadResource("res/ui/jbName/jbName.plist")
	rmgr.loadResource("res/ui/juben/juben.plist")
	rmgr.loadResource("res/ui/juben/flag.plist")
	rmgr.loadResource("res/ui/juben/jbIcon.plist")
	rmgr.loadResource("res/ui/juben/jbStart.plist")
	rmgr.loadResource("res/ui/juben/jubenForceIcon.plist")
	rmgr.loadResource("res/ui/battle/fightResult/fightResult.plist")

	arg_2_0.config = var_0_2.new(arg_2_0)
	arg_2_0.mapLayer = var_0_3.new(arg_2_0)
	arg_2_0.infoLayer = var_0_4.new(arg_2_0)
	arg_2_0.guideLayer = var_0_5.new(arg_2_0)
	arg_2_0.warOptionLayer = CCLayer:create()

	arg_2_0:addChild(arg_2_0.mapLayer, var_0_1.mapLayer)
	arg_2_0:addChild(arg_2_0.infoLayer, var_0_1.infoLayer)
	arg_2_0.infoLayer:setVisible(false)
	smgr.getLayer("guideLayer"):addChild(arg_2_0.guideLayer)
	arg_2_0.mapLayer:addChild(arg_2_0.warOptionLayer, 200)
	smgr.hideNotice()
	eventManager.dispatchEvent("taskButtonItemSetVisible", false)

	local var_2_0 = smgr.getLayer("uiLayer")

	arg_2_0.generalPanelControl = showSimpleGeneralPanel(var_2_0, nil, true)

	if arg_2_0.create == 1 then
		arg_2_0:getJubenScene()
	else
		arg_2_0:enterJubenScene()
	end

	eventManager.dispatchEvent("taskButtonItemSetVisible", false)
end

function var_0_0.getJubenScene(arg_3_0)
	local function var_3_0(arg_4_0)
		arg_3_0.mapLayer:getJubenScene(arg_4_0)
		arg_3_0.guideLayer:startCreateGuide()
		arg_3_0.infoLayer:setStaticLeftTime(arg_4_0.action.data.time)
		arg_3_0.infoLayer:setTitle(arg_4_0.action.data.title)
		arg_3_0.infoLayer:setGrade(arg_4_0.action.data.grade)
	end

	cmgr.sendRequest(var_3_0, actions.getJuBenScene, arg_3_0.gId, arg_3_0.grade)
end

function var_0_0.enterJubenScene(arg_5_0, arg_5_1)
	local var_5_0 = user.ywData.battleKey or 0

	local function var_5_1(arg_6_0)
		log.info("enterJubenScene=%s", tool.tableToJson(arg_6_0))

		if var_5_0 > 0 then
			user.isYw = true
		end

		arg_5_0.mapLayer:enterJubenScene(arg_6_0, arg_5_1)
		arg_5_0.mapLayer:moveTo(arg_6_0.action.data.capital, false, arg_5_0.create == 0)
		arg_5_0.infoLayer:setLeftTime(arg_6_0.action.data.time)

		if not user.isYw and var_5_0 == 0 then
			arg_5_0.infoLayer:setVisible(true)
			arg_5_0.infoLayer:setTitle(arg_6_0.action.data.title)
			arg_5_0.infoLayer:setGrade(arg_6_0.action.data.grade)
			arg_5_0.infoLayer:setStarNum(arg_6_0.action.data.star)

			if arg_5_0.gId == 10 then
				arg_5_0.infoLayer:showYuxiInfo(arg_6_0.action.data.forceList)
			end
		end

		arg_5_0.create = 0

		arg_5_0.infoLayer:eventFinishTimeFly()

		if arg_5_0.warOptionTable and not arg_5_0.warOptionTable.isClosed then
			if user.isYw and arg_5_0.warOptionTable.cityId then
				arg_5_0.mapLayer:moveTo(tonumber(arg_5_0.warOptionTable.cityId))
			end

			arg_5_0.mapLayer.warOptionTable = arg_5_0.warOptionTable

			require("lua/layer/warOption/warOptionController")

			local var_6_0 = smgr.getLayer("generalMoveLayer")

			warOptionController.updateWarOptionLayer(arg_5_0.warOptionLayer, arg_5_0.warOptionTable, arg_5_0.mapLayer.cityTable, "", var_6_0)
		end

		if arg_6_0.action.data.type == 2 then
			arg_5_0:showDrillInfo(arg_6_0.action.data)
		end
	end

	if var_5_0 > 0 and (arg_5_0.gId < 100 or arg_5_0.gId >= 1000) then
		var_5_0 = 0
	end

	cmgr.sendRequest(var_5_1, actions.enterJuBenScene, arg_5_0.gId, var_5_0, arg_5_0.grade, arg_5_0.create, arg_5_0.followGeneral)
end

local var_0_7 = {
	name = "root",
	type = "node",
	x = visibleSize.width / 2,
	y = visibleSize.height / 2 - 100,
	children = {
		{
			y = 108,
			name = "bg2",
			type = "sprite9",
			scale = 0.875,
			x = 0,
			preferedSize = CCSizeMake(800, 80),
			middleRect = CCRectMake(40, 10, 780, 88),
			pic = {
				path = "res/ui/world/cityCombo/lxzc_bg4.png"
			}
		},
		{
			y = 193,
			name = "title",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/ywTask/jbyw_word_jbywjjks.png"
			}
		},
		{
			name = "time",
			type = "atlaslabel",
			pic = "res/ui/common/number/yxhd_time_digit.png",
			startCharMap = 47,
			text = "00:00",
			y = 113,
			itemWidth = 35,
			x = 0,
			itemHeight = 34
		},
		{
			w = 104,
			name = "backBtn",
			h = 50,
			type = "button",
			normal = {
				frame = true,
				path = "btn_back_a.png"
			},
			touched = {
				frame = true,
				path = "btn_back_c.png"
			},
			x = visibleSize.width * 0.5 - 70,
			y = visibleSize.height * 0.5 + 50
		}
	}
}

local function var_0_8()
	cmgr.sendRequest(function(arg_8_0)
		var_0_6:showOfficeToken(true, {
			arg_8_0
		})
	end, actions.getJbOfficerTokenInfo, user.ywData.battleKey, 1)
end

local function var_0_9()
	cmgr.sendRequest(function(arg_10_0)
		var_0_6:showOrderToken(true, {
			arg_10_0
		})
	end, actions.getJbGoldTokenInfo, user.ywData.battleKey, 1)
end

function var_0_0.startTimeCount(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = {}

	uiutil.initWidgets(var_11_0, var_0_7)
	arg_11_1:addChild(var_11_0.widgets.root)
	var_11_0.widgets.time:setString(tool.getFormatTime(arg_11_2.startCd))
	var_11_0.widgets.time:stopAllActions()

	local var_11_1 = CCArray:create()

	var_11_1:addObject(CCDelayTime:create(1))
	var_11_1:addObject(CCCallFuncN:create(function()
		if arg_11_2.startCd <= 0 then
			var_11_0.widgets.time:setString(tool.getFormatTime(0))
			var_11_0.widgets.time:stopAllActions()

			if arg_11_1 then
				pcall(arg_11_1.removeFromParentAndCleanup, arg_11_1, true)

				arg_11_1 = nil
			end

			local var_12_0 = arg_11_0.mapLayer:getCityName(arg_11_2.targetCityId)

			if var_12_0 then
				user.ywData.cityName = var_12_0
				user.ywData.cityId = targetCityId

				guide.ui.disable_arrow_in_juben()

				if arg_11_2.attForceId == user.player.forceId then
					arg_11_0.guideLayer:startDialog({
						id = 100001,
						arg = user.ywData.cityName
					})
				else
					arg_11_0.guideLayer:startDialog({
						id = 100002,
						arg = user.ywData.cityName
					})
				end
			end

			menuUI.ui.show()
			eventManager.dispatchEvent("sceneWillChange")
			eventManager.dispatchEvent("taskButtonItemSetVisible", true)
			arg_11_0:showYWCityEvent(arg_11_2)
		else
			var_11_0.widgets.time:setString(tool.getFormatTime(arg_11_2.startCd))
		end
	end))

	local var_11_2 = CCSequence:create(var_11_1)

	var_11_0.widgets.time:runAction(CCRepeatForever:create(var_11_2))

	local function var_11_3(...)
		smgr.changeScene(SCENE_MAIN_CITY)
	end

	var_11_0.widgets.backBtn:addHandleOfControlEvent(var_11_3, CCControlEventTouchUpInside)
end

function var_0_0.showDrillInfo(arg_14_0, arg_14_1)
	log.info("@@@showDrillInfo")

	user.ywData.watch = arg_14_1.watch

	local var_14_0 = require("lua/layer/juben/ywNotice/ywPlayerList").new(arg_14_1, smgr.getLayer("uiLayer"))

	var_0_6:create(arg_14_0.generalPanelControl)

	if arg_14_1.officerTokenNum and arg_14_1.officerTokenNum > 0 then
		var_0_8()
	else
		var_0_6.resetOfficerToken()
	end

	if arg_14_1.goldTokenNum and arg_14_1.goldTokenNum > 0 then
		var_0_9()
	else
		var_0_6.resetOrderToken()
	end

	user.ywData.taskTime = arg_14_1.time

	local var_14_1 = smgr.getLayer("topLayer")

	var_14_1:removeAllChildrenWithCleanup(true)
	arg_14_0.mapLayer:getYWJubenScene(arg_14_1)

	if arg_14_1.startCd and arg_14_1.startCd > 0 then
		local function var_14_2(arg_15_0)
			arg_14_1.startCd = arg_14_1.startCd - arg_15_0 * 1000
		end

		if arg_14_0.timer then
			arg_14_0.timer.time = arg_14_1.startCd / 1000
		else
			arg_14_0.timer = FrameTimer(arg_14_1.startCd / 1000, var_14_2, nil, 0.2)
		end

		local var_14_3 = CCLayerColor:create(ccc4(0, 0, 0, 180), visibleSize.width, visibleSize.height)

		swallowTouch(var_14_3)
		arg_14_0.mapLayer:moveTo(arg_14_1.targetCityId, false, arg_14_0.create == 0)
		var_14_1:addChild(var_14_3)
		arg_14_0:startTimeCount(var_14_3, arg_14_1)
	else
		menuUI.ui.show()
		eventManager.dispatchEvent("sceneWillChange")
		eventManager.dispatchEvent("taskButtonItemSetVisible", true)
		arg_14_0:showYWCityEvent(arg_14_1)

		if arg_14_1.npcs then
			for iter_14_0, iter_14_1 in pairs(arg_14_1.npcs) do
				arg_14_0:addDrillGeneralMove(iter_14_1)
			end
		end
	end
end

function var_0_0.showYWCityEvent(arg_16_0, arg_16_1)
	if arg_16_1 and arg_16_1.time and arg_16_1.time > 0 and arg_16_1.type and arg_16_1.type == 2 then
		local var_16_0 = 0
		local var_16_1
		local var_16_2 = arg_16_1.attForceId == user.player.forceId and 0 or 1
		local var_16_3 = {
			endTime = arg_16_1.time,
			cityName = arg_16_0.mapLayer:getCityName(arg_16_1.targetCityId),
			attType = var_16_2,
			cityForceId = arg_16_0.mapLayer:getCityForceId(arg_16_1.targetCityId),
			cityId = arg_16_1.targetCityId
		}

		arg_16_0.mapLayer:updateYwEvent(arg_16_1.targetCityId, var_16_3)
		arg_16_0:addVitalCityBar(arg_16_1)
	end

	arg_16_0.mapLayer:updateTjBar()
end

function var_0_0.addVitalCityBar(arg_17_0, arg_17_1)
	local var_17_0 = 0
	local var_17_1
	local var_17_2 = arg_17_1.attForceId == user.player.forceId and 0 or 1
	local var_17_3 = {
		endTime = 0,
		barType = 1,
		cityName = arg_17_0.mapLayer:getCityName(arg_17_1.attVitalCityId),
		attType = var_17_2,
		cityForceId = arg_17_0.mapLayer:getCityForceId(arg_17_1.attVitalCityId),
		cityId = arg_17_1.attVitalCityId
	}

	arg_17_0.mapLayer:updateYwEvent(arg_17_1.attVitalCityId, var_17_3)
end

function var_0_0.drillCampVOUpdate(arg_18_0, arg_18_1)
	if arg_18_1.state == 1 and arg_18_1.forceId ~= user.player.forceId then
		local var_18_0 = arg_18_0.mapLayer:getCityName(arg_18_1.cityId)

		user.ywData.tjCityName = var_18_0

		if var_18_0 then
			roleDialogue.control.loadSpeak("yw215124")
		end
	end

	if arg_18_1.state == 2 or arg_18_1.cd <= 0 then
		arg_18_0.mapLayer:removeYwEvent(arg_18_1.cityId)
	else
		local var_18_1 = {
			barType = 2,
			endTime = arg_18_1.cd,
			cityName = arg_18_0.mapLayer:getCityName(arg_18_1.cityId),
			cityForceId = arg_18_1.forceId,
			cityId = arg_18_1.cityId
		}

		arg_18_0.mapLayer:updateYwEvent(arg_18_1.cityId, var_18_1)

		if arg_18_1.state ~= 1 then
			-- block empty
		end
	end
end

function var_0_0.addDrillGeneralMove(arg_19_0, arg_19_1)
	if arg_19_1.prevCityId == nil or arg_19_1.prevCityId == 0 then
		return
	end

	arg_19_1.pic = "zhurong"

	log.info("@@@@@@@addDrillGeneralMove")
	showTable(arg_19_1)

	if arg_19_1.state == 1 then
		local function var_19_0()
			if arg_19_0.mapLayer and arg_19_0.mapLayer.marchingLayer then
				arg_19_0.mapLayer.marchingLayer:eventRemove(arg_19_1.id)
			end
		end

		schedule(arg_19_0.mapLayer.marchingLayer, var_19_0, 5)
	end

	if arg_19_1.cityId == arg_19_1.prevCityId then
		if arg_19_1.state == 0 then
			arg_19_1.curCityId = arg_19_1.cityId
			arg_19_1.nextCityId = arg_19_1.nextCityId

			arg_19_0.mapLayer.marchingLayer:changeMarchingInfo(arg_19_1, arg_19_1.id)
		end
	else
		arg_19_1.curCityId = arg_19_1.cityId
		arg_19_1.nextCityId = arg_19_1.nextCityId

		arg_19_0.mapLayer.marchingLayer:changeMarchingInfo(arg_19_1, arg_19_1.id)
	end
end

function var_0_0.handlerPushMultiJuben(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_1.action.data

	if var_21_0.camp ~= nil then
		arg_21_0:drillCampVOUpdate(var_21_0.camp)
	end

	if var_21_0.token ~= nil then
		if var_21_0.token.officerTokenNum and var_21_0.token.officerTokenNum > 0 then
			var_0_8()
		else
			var_0_6.resetOfficerToken()
		end

		if var_21_0.token.goldTokenNum and var_21_0.token.goldTokenNum > 0 then
			var_0_9()
		else
			var_0_6.resetOrderToken()
		end
	end

	if var_21_0.info ~= nil then
		local var_21_1

		if var_21_0.info.killNum ~= nil then
			local var_21_2 = var_21_0.info

			if user.ywData.killInfo ~= nil then
				var_21_2.rank = user.ywData.killInfo.rank
			end

			user.ywData.killInfo = var_21_2
		end

		if var_21_0.info.rank then
			local var_21_3 = var_21_0.info

			if user.ywData.killInfo ~= nil then
				var_21_3.killNum = user.ywData.killInfo.killNum
			end

			user.ywData.killInfo = var_21_3
		end

		if var_21_0.info.tujinPhantomIcon ~= nil then
			user.ywData.showTuJinIcon = var_21_0.info.tujinPhantomIcon
		end
	end

	if var_21_0.npc then
		local var_21_4 = var_21_0.npc

		user.ywData.jbDirllNpcList = var_21_4

		arg_21_0:addDrillGeneralMove(var_21_4)
	end

	if var_21_0.moveMessage then
		user.ywData.drillOtherPlayerVO = var_21_0.moveMessage
	end
end

function var_0_0.handlerPushAction(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_1.action.data

	log.info("pushJubenData=%s", tool.tableToJson(var_22_0))

	if var_22_0.refresh and var_22_0.refresh.refresh == true then
		arg_22_0.create = 0

		arg_22_0:enterJubenScene(false)
	elseif var_22_0.flag then
		arg_22_0.mapLayer:changeEventState(var_22_0.flag)
	elseif var_22_0.attmov then
		if user.isYw then
			if var_22_0.attmov and var_22_0.attmov.orgCityId and arg_22_0.mapLayer:getCitySprite(var_22_0.attmov.orgCityId) then
				arg_22_0.mapLayer:generalMove(var_22_0.attmov)
			end
		else
			arg_22_0.mapLayer:generalMove(var_22_0.attmov)
		end
	elseif var_22_0.bat and var_22_0.bat.cities then
		for iter_22_0, iter_22_1 in pairs(var_22_0.bat.cities) do
			arg_22_0.mapLayer:changeCity(iter_22_1)
		end
	elseif var_22_0.info and var_22_0.info.star then
		arg_22_0.infoLayer:setStarNum(var_22_0.info.star)

		if juben.curStar == var_22_0.info.star and var_22_0.info.addTime and var_22_0.info.addTime > 0 then
			juben.eventFinishTime = var_22_0.info.addTime

			arg_22_0.infoLayer:eventFinishTimeFly()
		end

		juben.curStar = var_22_0.info.star

		arg_22_0.infoLayer:setLeftTime(var_22_0.info.time)
	elseif var_22_0.dialog then
		arg_22_0.guideLayer:startDialog(var_22_0.dialog)
	elseif var_22_0.eventOver then
		arg_22_0.mapLayer:eventOver(var_22_0.eventOver)
	elseif var_22_0.marching then
		arg_22_0.mapLayer:changeMarchingInfo(var_22_0.marching)
	elseif var_22_0.chasingInfo then
		arg_22_0.mapLayer:changeChasingInfo(var_22_0.chasingInfo)
	elseif var_22_0.mengdeInfo then
		arg_22_0.mapLayer:changeMengdeInfo(var_22_0.mengdeInfo)
	elseif var_22_0.generalAdd then
		arg_22_0.mapLayer:generalAdd(var_22_0.generalAdd)
	elseif var_22_0.npcTrick then
		arg_22_0.mapLayer:npcTrick(var_22_0.npcTrick)
	elseif var_22_0.allTrick then
		arg_22_0.infoLayer:showAllTrick(var_22_0.allTrick)
	elseif var_22_0.generalMove and (var_22_0.generalMove.autoMove == nil or var_22_0.generalMove.autoMove or true) then
		-- block empty
	else
		log.warn("receive a unknow push=%s", tool.tableToJson(arg_22_1))
	end

	if user.isYw and var_22_0.info then
		var_0_0:showYWCityEvent(var_22_0.info)
	end

	if user.isYw and var_22_0.res then
		notice.control.openMuilJbTask()
	end
end

function var_0_0.handlerPushPlayerAction(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_1.action.data

	if var_23_0.update and var_23_0.update.juBenOver then
		log.info("self.guideLayer.inDialog", arg_23_0.guideLayer.inDialog)

		if not arg_23_0.guideLayer.inDialog then
			arg_23_0:enterJubenScene()
		end
	end
end

function var_0_0.onEnter(arg_24_0)
	function arg_24_0.sceneWillChangeRef(arg_25_0)
		if smgr.currentSceneTag == SCENE_JUBEN and arg_25_0 ~= SCENE_BATTLE and arg_25_0 ~= SCENE_JUBEN and arg_24_0.gId == 100 then
			cmgr.sendRequest(nil, actions.leaveMultiJb, arg_24_0.gId)
		end
	end

	function arg_24_0.eventRef(arg_26_0)
		local var_26_0 = {}

		if user.ywData.isYw and user.ywData.watch then
			return var_26_0
		end

		for iter_26_0, iter_26_1 in pairs(arg_24_0.generalPanelControl.generals) do
			if iter_26_1.juBenLoId ~= arg_26_0 and (iter_26_1.generalState == 0 or iter_26_1.generalState == 1) then
				var_26_0[iter_26_0] = iter_26_1
			end
		end

		return var_26_0
	end

	function arg_24_0.handlerPushActionRef(arg_27_0)
		arg_24_0:handlerPushAction(arg_27_0)
	end

	function arg_24_0.handlerPushPlayerActionRef(arg_28_0)
		arg_24_0:handlerPushPlayerAction(arg_28_0)
	end

	function arg_24_0.handlerPushMultiJubenActionRef(arg_29_0)
		arg_24_0:handlerPushMultiJuben(arg_29_0)
	end

	function arg_24_0.gameOverRef()
		log.info("Game Over Juben Clear")
		guide.ui.setVisible(false)
		arg_24_0.guideLayer:setTouchEnabled(false)
		arg_24_0.guideLayer:removeAllChildrenWithCleanup(true)
	end

	eventManager.registerEvent("JubenGetGenerals", arg_24_0.eventRef)
	eventManager.registerEvent("GameOver", arg_24_0.gameOverRef)
	cmgr.registerResponseHandler(actions.pushJuBen, arg_24_0.handlerPushActionRef)
	cmgr.registerResponseHandler(actions.pushPlayer, arg_24_0.handlerPushPlayerActionRef)
	cmgr.registerResponseHandler(actions.pushMultiJuben, arg_24_0.handlerPushMultiJubenActionRef)
	eventManager.registerEvent("sceneWillChange", arg_24_0.sceneWillChangeRef)
end

function var_0_0.onExit(arg_31_0)
	eventManager.unregisterEvent("JubenGetGenerals", arg_31_0.eventRef)
	eventManager.unregisterEvent("GameOver", arg_31_0.gameOverRef)
	eventManager.unregisterEvent("sceneWillChange", arg_31_0.sceneWillChangeRef)
	cmgr.unregisterResponseHandler(actions.pushJuBen, arg_31_0.handlerPushActionRef)
	cmgr.unregisterResponseHandler(actions.pushPlayer, arg_31_0.handlerPushPlayerActionRef)
	cmgr.unregisterResponseHandler(actions.pushMultiJuben, arg_31_0.handlerPushMultiJubenActionRef)
	eventManager.dispatchEvent("taskButtonItemSetVisible", true)

	if arg_31_0.timer then
		arg_31_0.timer:clear()

		arg_31_0.timer = nil
	end

	if user.isYw and var_0_6 then
		var_0_6:clearup()
	end
end

return var_0_0
