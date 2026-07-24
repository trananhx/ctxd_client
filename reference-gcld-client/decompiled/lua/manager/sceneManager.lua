if rmgr == nil or rmgr.isNotCompleteAndHighLevel == nil then
	reload("lua/manager/resourceManager")
end

s_tag_layer_root = 100000
s_tag_layer_scene = 100001
s_tag_layer_push = 100002
s_tag_layer_top = 100004
s_tag_layer_modal = 100005
SCENE_LOGIN = 200002
SCENE_SELECT_PLAYER = 200003
SCENE_SELECT_FORCE = 200004
SCENE_MAIN_CITY = 200005
SCENE_RES_JUMING = 200006
SCENE_RES_MUCHANG = 200007
SCENE_RES_BINGYING = 200008
SCENE_RES_NONGTIAN = 200009
SCENE_RES_BINGTIE = 200010
SCENE_INSTANCE = 200011
SCENE_BATTLE = 200012
SCENE_PANEL_RESOURCE = 200014
SCENE_WORLD = 200015
SCENE_PANEL_EQUIPMENT = 200016
SCENE_PANEL_TECHNOLOGY = 200017
SCENE_PANEL_RANK = 200018
SCENE_PANEL_NATION = 200019
SCENE_PANEL_PLAYERINFO = 200021
SCENE_PANEL_WEAPON = 200022
SCENE_RES_HUANGCHENG = 200023
SCENE_IRONMINE = 200024
SCENE_FARM = 200025
SCENE_DINNER_INROOM = 200026
SCENE_LOADING = 300001
SCENE_LOGIN_DEBUG = 300002
SCENE_JUBEN = 300003
SCENE_KFWORLD = 300004
SCENE_ADVENTURE = 300005
SCENE_KFZB_TABLE = 300006
SCENE_KFSY = 300007
SCENE_KFSY_INROOM = 300008
SCENE_GONGHE_INROOM = 300009
SCENE_KFYZ_WORLD = 300010
SCENE_SILK_POWER = 300011
SCENE_CBHS_POWER = 300012
SCENE_KB_FEAST = 300013
SCENE_LOGIN_WAP = 300014
SCENE_LOOKACTIVITY = 300015
SCENE_KFEXPEDITION = 400001
s_windows = {}
s_windows.tag = {
	activity = 100001
}
smgr = {}
smgr.rootLayer = nil
smgr.lastSceneTag = nil
smgr.lastSafeScene = nil
smgr.currentSceneTag = nil
smgr.nextSceneTag = nil
smgr.hadShowTask = false
smgr.layers = {}

function smgr.registerScene(arg_1_0, arg_1_1)
	if smgr.scenes == nil then
		smgr.scenes = {}
	end

	if smgr.scenes[arg_1_0] then
		log.debug("has same scene ", arg_1_0)

		return
	end

	smgr.scenes[arg_1_0] = arg_1_1
end

function smgr.registerLayer(arg_2_0, arg_2_1)
	if type(arg_2_1) ~= type("") then
		messageBox.error("name必须为字符串")
	end

	smgr.layers[arg_2_1] = arg_2_0
end

function smgr.unregisterLayer(arg_3_0)
	smgr.layers[arg_3_0] = nil
end

function smgr.getLayer(arg_4_0)
	return smgr.layers[arg_4_0]
end

local function var_0_0()
	if rmgr.isNotCompleteAndHighLevel() then
		return
	end

	if smgr.hadShowTask then
		return
	end

	local var_5_0 = smgr.getLayer("taskLayer")

	var_5_0:removeAllChildrenWithCleanup(true)
	taskUI.show(var_5_0)
	taskUI.showNewTaskEffect2()

	smgr.hadShowTask = true
end

function smgr.init()
	smgr.modalTimeOutCount = 0

	require("lua/layer/modal/ui")
	require("lua/common/tool")
	require("lua/game/battle/battleScene")
	require("lua/layer/task/ui")
	require("lua/roleDialogue/ui")

	if conf.language == "tw" then
		if channelMgr.getCurrentChannel() == channels.andTwPub or channelMgr.getCurrentChannel() == channels.andTwGo2Play or channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan or channelMgr.getCurrentChannel() == channels.andTwGo2PlayThird then
			require("lua/layer/login/ui")
		else
			require("lua/layer/loginWeb/ui")
		end
	elseif conf.language == "kr" then
		require("lua/layer/loginWebKorea/ui")
	else
		require("lua/layer/login/ui")
	end

	require("lua/layer/loginDebug/ui")
	require("lua/guide/ui")
	require("lua/layer/notice/ui")
	require("lua/layer/touchLayer")
	require("lua/layer/world/ui")

	smgr.rootLayer = createBaseLayer()

	smgr.rootLayer:addChild(CCLayer:create(), 0, s_tag_layer_scene)

	local var_6_0 = createBaseLayer()

	smgr.rootLayer:addChild(var_6_0, 1)
	smgr.registerLayer(var_6_0, "effectlayer")

	local var_6_1 = createBaseLayer()

	smgr.rootLayer:addChild(var_6_1, 2)
	smgr.registerLayer(var_6_1, "uiLayer")

	local var_6_2 = createBaseLayer()

	smgr.rootLayer:addChild(var_6_2, 3)
	smgr.registerLayer(var_6_2, "taskLayer")

	local var_6_3 = createBaseLayer()

	smgr.rootLayer:addChild(var_6_3, 4)
	smgr.registerLayer(var_6_3, "noticeLayer")

	local var_6_4 = createBaseLayer()

	smgr.rootLayer:addChild(var_6_4, 5, s_tag_layer_top)
	smgr.registerLayer(var_6_4, "topLayer")
	smgr.rootLayer:addChild(createPushLayer(), 6, s_tag_layer_push)
	require("lua/layer/loadingLayer")

	local var_6_5 = loadingLayer.init()

	smgr.rootLayer:addChild(var_6_5, 7)
	smgr.rootLayer:addChild(roleDialogue.ui.createLayer(), 8)

	local var_6_6 = guide.ui.createLayer()

	smgr.registerLayer(var_6_6, "guideLayer")
	smgr.rootLayer:addChild(var_6_6, 9)

	local var_6_7 = createBaseLayer()

	smgr.rootLayer:addChild(var_6_7, 10)
	smgr.registerLayer(var_6_7, "tipLayer")

	local var_6_8 = createBaseLayer()

	smgr.rootLayer:addChild(var_6_8, 11)
	smgr.registerLayer(var_6_8, "msgLayer")
	smgr.rootLayer:addChild(createTouchLayer(), 11)
	smgr.rootLayer:addChild(createModalLayer(), 12, s_tag_layer_modal)
end

function smgr.changeScene(arg_7_0, ...)
	log.info("[smgr] 切换场景 %s", arg_7_0)

	if (arg_7_0 == SCENE_WORLD or arg_7_0 == SCENE_KFYZ_WORLD) and rmgr.isNotComplete() then
		g_sub_package_argv = {
			...
		}

		if tool.cmpVersion("2.0.2.0", game.version.client) then
			smgr.showDownloadFullPackView()
		else
			function click_btn_yes()
				g_sub_package_status = 0

				require("lua/layer/versionUpdate/ui")

				local var_8_0 = createVersionUpdateLayer()

				var_8_0:registerScriptTouchHandler(function(arg_9_0, arg_9_1, arg_9_2)
					return true
				end, false, true)
				var_8_0:setTouchEnabled(true)
				smgr.rootLayer:addChild(var_8_0, 1000000)
			end

			messageBox.confirm("激情国战即将开始，请下载资源包！", click_btn_yes)
		end

		return
	end

	if arg_7_0 == SCENE_MAIN_CITY and rmgr.isNotComplete() and user.player.playerLv > 17 then
		if channelMgr.getCurrentChannel() == channels.iosplay800 or channelMgr.getCurrentChannel() == channels.iosAppstore or channelMgr.getCurrentChannel() == channels.iosappstore30lv or channelMgr.getCurrentChannel() == channels.iosmouding then
			local var_7_0 = versionUpdateConstant.file.version

			reload(var_7_0)

			local var_7_1 = sys_version

			print("game.newVersion.appStoreCode , localVersion.appStoreCode", game.newVersion.appStoreCode, var_7_1.appStoreCode)

			if game.newVersion.appStoreCode == var_7_1.appStoreCode then
				-- block empty
			elseif not user.haveShowDownloadDetailView then
				roleDialogue.control.loadSpeak(1504)
			end
		elseif not user.haveShowDownloadDetailView then
			roleDialogue.control.loadSpeak(1504)
		end
	end

	eventManager.dispatchEvent("sceneWillChange", arg_7_0)

	smgr.lastSceneTag = smgr.currentSceneTag

	if smgr.currentSceneTag ~= SCENE_BATTLE then
		smgr.lastSafeScene = smgr.currentSceneTag
		smgr.lastSceneArgs = smgr.currentSceneArgs
	end

	smgr.hideNotice()

	local var_7_2 = smgr.rootLayer:getChildByTag(s_tag_layer_scene)

	if not var_7_2 then
		log.error("can not found scene layer !!!")

		return
	end

	log.info("@@ 清理资源")
	rmgr.clearup()

	if smgr.currentSceneTag then
		var_7_2:removeChildByTag(smgr.currentSceneTag, true)
	end

	smgr.getLayer("uiLayer"):removeAllChildrenWithCleanup(true)
	smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)

	if needShowKaiguangAnimationBegin then
		log.info("开光开启动画")

		needShowKaiguangAnimationBegin = false

		require("lua/layer/equipment/kaiguang/ui")
		equipmentKaiguangUI.showKaiguangAnimation(0)
	end

	if taskUI and taskUI.uiTable and taskUI.uiTable.battleHelpLayer then
		taskUI.uiTable.battleHelpLayer:setVisible(false)
	end

	local var_7_3

	smgr.nextSceneTag = arg_7_0

	if arg_7_0 == SCENE_LOGIN then
		if conf.language == "tw" then
			if channelMgr.getCurrentChannel() == channels.andTwPub or channelMgr.getCurrentChannel() == channels.andTwGo2Play or channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan or channelMgr.getCurrentChannel() == channels.andTwGo2PlayThird then
				var_7_3 = createLoginLayer()
			else
				var_7_3 = createLoginWebLayer()
			end
		elseif conf.language == "kr" then
			var_7_3 = createLoginWebLayer()
		else
			var_7_3 = createLoginLayer()
		end

		amgr.stopMusic(true)
	elseif arg_7_0 == SCENE_SELECT_PLAYER then
		selectPlayerUI = require("lua/layer/selectPlayer/ui")
		var_7_3 = selectPlayer.ui.show()

		amgr.stopMusic(true)
	elseif arg_7_0 == SCENE_SELECT_FORCE then
		selectForceUI = require("lua/layer/selectForce/ui")
		var_7_3 = selectForceUI.show()

		amgr.stopMusic(true)
	elseif arg_7_0 == SCENE_MAIN_CITY then
		mainCityUI = require("lua/layer/mainCity/ui")
		var_7_3 = mainCity.ui.show()

		var_0_0()
		amgr.playMusic(enumAudioFile.bg_main_city, true)
	elseif arg_7_0 == SCENE_RES_JUMING then
		resourceAreaUI = require("lua/layer/resourceArea2/ui")
		var_7_3 = resourceAreaUI.show(1)

		var_0_0()
		amgr.playMusic(enumAudioFile.bg_main_city, true)
	elseif arg_7_0 == SCENE_RES_MUCHANG then
		resourceAreaUI = require("lua/layer/resourceArea2/ui")
		var_7_3 = resourceAreaUI.show(2)

		var_0_0()
		amgr.playMusic(enumAudioFile.bg_main_city, true)
	elseif arg_7_0 == SCENE_RES_NONGTIAN then
		resourceAreaUI = require("lua/layer/resourceArea2/ui")
		var_7_3 = resourceAreaUI.show(3)

		var_0_0()
		amgr.playMusic(enumAudioFile.bg_main_city, true)
	elseif arg_7_0 == SCENE_RES_BINGTIE then
		resourceAreaUI = require("lua/layer/resourceArea2/ui")
		var_7_3 = resourceAreaUI.show(4)

		var_0_0()
		amgr.playMusic(enumAudioFile.bg_main_city, true)
	elseif arg_7_0 == SCENE_RES_BINGYING then
		resourceAreaUI = require("lua/layer/resourceArea2/ui")
		var_7_3 = resourceAreaUI.show(5)

		var_0_0()
		amgr.playMusic(enumAudioFile.bg_main_city, true)
	elseif arg_7_0 == SCENE_RES_HUANGCHENG then
		require("lua/layer/empire/ui")

		var_7_3 = empire.ui.show()

		amgr.playMusic(enumAudioFile.bg_main_city, true)
	elseif arg_7_0 == SCENE_INSTANCE then
		require("lua/layer/selectInstance2/ui")

		var_7_3 = selectInstanceUI.show(...)

		amgr.playMusic(enumAudioFile.bg_fuben, true)

		if taskUI and taskUI.uiTable and taskUI.uiTable.battleHelpLayer and user and user.player and user.player.playerLv and tonumber(user.player.playerLv) >= 7 then
			taskUI.uiTable.battleHelpLayer:setVisible(true)
		end
	elseif arg_7_0 == SCENE_BATTLE then
		var_7_3 = createBattleScene(...)

		amgr.playMusic(enumAudioFile.bg_fight, true)
	elseif arg_7_0 == SCENE_WORLD then
		var_7_3 = worldUI.show(...)

		amgr.playMusic(enumAudioFile.bg_world, true)
	elseif arg_7_0 == SCENE_LOGIN_DEBUG then
		var_7_3 = createLoginDebugLayer()

		amgr.stopMusic(true)
	elseif arg_7_0 == SCENE_JUBEN then
		var_7_3 = require("lua/layer/juben/Juben").new(...)

		amgr.playMusic(enumAudioFile.bg_world, true)
	elseif arg_7_0 == SCENE_FARM then
		require("lua/layer/farm/ui")

		var_7_3 = farmUI.createFarmArea()

		amgr.playMusic(enumAudioFile.bg_world, true)
	elseif arg_7_0 == SCENE_IRONMINE then
		var_7_3 = require("lua/layer/ironMine/ui").new(...)

		amgr.playMusic(enumAudioFile.bg_main_city, true)
	elseif arg_7_0 == SCENE_KFWORLD then
		var_7_3 = require("lua/layer/kfworld/World").new(...)

		amgr.playMusic(enumAudioFile.bg_world, true)
	elseif arg_7_0 == SCENE_ADVENTURE then
		var_7_3 = require("lua/layer/activity/ancientCastle/Adventure").new(...)

		amgr.playMusic(enumAudioFile.bg_world, true)
	elseif arg_7_0 == SCENE_KFZB_TABLE then
		var_7_3 = require("lua/layer/kfzb/ui").show16Table(...)

		amgr.playMusic(enumAudioFile.bg_world, true)
	elseif arg_7_0 == SCENE_KFSY then
		var_7_3 = require("lua/layer/kfsy/ShenYan").new(...)

		amgr.playMusic(enumAudioFile.bg_world, true)
	elseif arg_7_0 == SCENE_KFSY_INROOM then
		var_7_3 = require("lua/layer/kfsy/ShenYanLayer").new(...)

		amgr.playMusic(enumAudioFile.bg_world, true)
	elseif arg_7_0 == SCENE_GONGHE_INROOM then
		var_7_3 = require("lua/layer/celebration/GongHeLayer").new(...)

		amgr.playMusic(enumAudioFile.bg_main_city, true)
	elseif arg_7_0 == SCENE_DINNER_INROOM then
		var_7_3 = require("lua/layer/general/dinner/huangchengDinner.lua").new(...)

		amgr.playMusic(enumAudioFile.bg_main_city, true)
	elseif arg_7_0 == SCENE_KFYZ_WORLD then
		var_7_3 = require("lua/layer/kfyzWorld/World").new(...)

		amgr.playMusic(enumAudioFile.bg_world, true)
	elseif arg_7_0 == SCENE_SILK_POWER then
		var_7_3 = require("lua/layer/silk/SilkPower").new(...)

		amgr.playMusic(enumAudioFile.bg_fuben, true)
	elseif arg_7_0 == SCENE_CBHS_POWER then
		var_7_3 = require("lua/layer/selectInstance2/CbhsPower").new(...)

		amgr.playMusic(enumAudioFile.bg_fuben, true)
	elseif arg_7_0 == SCENE_KB_FEAST then
		var_7_3 = require("lua/layer/nation/buildNation/Feast.lua").new(...)

		amgr.playMusic(enumAudioFile.bg_main_city, true)
	elseif arg_7_0 == SCENE_LOOKACTIVITY then
		var_7_3 = require("lua/layer/activity/lookActivity/world").new(...)

		amgr.playMusic(enumAudioFile.bg_world, true)
	elseif arg_7_0 == SCENE_KFEXPEDITION then
		var_7_3 = require("lua/layer/kfmg/world").new(...)

		amgr.playMusic(enumAudioFile.bg_world, true)
	else
		log.error("unknow scene ", arg_7_0)

		return
	end

	if var_7_3 == nil then
		log.debug("[ERROR] layer is nil")

		return
	end

	smgr.currentSceneTag = arg_7_0
	smgr.currentSceneArgs = {
		...
	}

	autoUI.scaleUI(var_7_3)
	var_7_2:addChild(var_7_3, 0, arg_7_0)
	log.debug("[smgr] end change scene >> %s ", arg_7_0)
	smgr.updateTaskLayer()

	if smgr.currentSceneTag == SCENE_INSTANCE or smgr.currentSceneTag == SCENE_FARM then
		smgr.hideNotice()
	end

	guide.control.setCurrentMarkTrace(nil)
end

function smgr.returnLastScene()
	if smgr.lastSafeScene then
		if smgr.lastSafeScene == SCENE_WORLD then
			smgr.lastSceneArgs = nil
		elseif smgr.lastSafeScene == SCENE_KFWORLD then
			-- block empty
		elseif smgr.lastSafeScene == SCENE_KFYZ_WORLD then
			smgr.lastSceneArgs = nil
		elseif smgr.lastSafeScene == SCENE_KFEXPEDITION then
			smgr.lastSceneArgs = nil
		end

		if smgr.lastSceneArgs then
			smgr.changeScene(smgr.lastSafeScene, unpack(smgr.lastSceneArgs))
		else
			smgr.changeScene(smgr.lastSafeScene)
		end
	end

	smgr.updateTaskLayer()
end

function smgr.refreshScene()
	if smgr.currentSceneTag then
		log.debug("[smgr] refresh scene")
		smgr.changeScene(smgr.currentSceneTag)
	end

	smgr.updateTaskLayer()
end

function smgr.updateTaskLayer()
	local var_12_0 = smgr.getLayer("taskLayer")

	if var_12_0 then
		if smgr.currentSceneTag == SCENE_BATTLE or smgr.currentSceneTag == SCENE_JUBEN or smgr.currentSceneTag == SCENE_KFWORLD or smgr.currentSceneTag == SCENE_FARM or smgr.currentSceneTag == SCENE_ADVENTURE or smgr.currentSceneTag == SCENE_KFZB_TABLE or smgr.currentSceneTag == SCENE_KFSY or smgr.currentSceneTag == SCENE_KFSY_INROOM or smgr.currentSceneTag == SCENE_DINNER_INROOM or smgr.currentSceneTag == SCENE_GONGHE_INROOM or smgr.currentSceneTag == SCENE_LOOKACTIVITY or smgr.currentSceneTag == SCENE_KFEXPEDITION or smgr.currentSceneTag == SCENE_KB_FEAST then
			log.debug("进入战斗场景,任务界面隐藏,任务弹出奖励延时")
			var_12_0:setVisible(false)

			dataCache.isDelayDispaly = true
		else
			log.debug("进入非战斗场景,任务界面显示,任务弹出奖励延时取消,并检查是否有任务完成")
			var_12_0:setVisible(true)

			dataCache.isDelayDispaly = false

			if dataCache.isNextDataNeedCache == false then
				dataCache.showNext()
			end

			globalAction_levelUp_delay()

			if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
				var_12_0:setVisible(false)
			end
		end

		if rmgr.isNotCompleteAndHighLevel() then
			smgr.getLayer("taskLayer"):setVisible(false)
		end
	end
end

function smgr.startScene()
	local var_13_0 = CCScene:create()

	var_13_0:addChild(smgr.rootLayer)
	log.info("zhu@@@qianyi1002", game.transferState)

	if conf.debug then
		smgr.changeScene(SCENE_LOGIN_DEBUG)
	elseif game.transferState == 1 then
		smgr.changeScene(SCENE_LOGIN_WAP)
	else
		smgr.changeScene(SCENE_LOGIN)
	end

	return var_13_0
end

function smgr.returnToLogin()
	log.info("@@@ 返回到登录界面")
	eventManager.dispatchEvent("Disconnect")
	eventManager.dispatchEvent("GameOver")

	local var_14_0 = user.skipSDKStepFlag

	user.init()

	user.skipSDKStepFlag = var_14_0

	log.info("zhu@@@qianyi1001", game.transferState)

	if conf.debug then
		smgr.changeScene(SCENE_LOGIN_DEBUG)
	else
		smgr.changeScene(SCENE_LOGIN)
	end
end

function smgr.returnToPlayerList()
	log.info("@@@ 返回到选角界面")
	eventManager.dispatchEvent("GameOver")

	local var_15_0 = user.serverLoginName

	user.init()

	user.serverLoginName = var_15_0

	smgr.changeScene(SCENE_SELECT_PLAYER)
end

function smgr.showModal(arg_16_0, arg_16_1)
	local var_16_0 = smgr.rootLayer:getChildByTag(s_tag_layer_modal)

	if var_16_0 then
		var_16_0:setVisible(true)
		var_16_0:setTimeout(arg_16_0)
		var_16_0:show(arg_16_1)
	end
end

function smgr.hideModal()
	smgr.modalTimeOutCount = 0

	local var_17_0 = smgr.rootLayer:getChildByTag(s_tag_layer_modal)

	if var_17_0 then
		var_17_0:setVisible(false)
		var_17_0:setTimeout(5)
		var_17_0:hide()
	end
end

function smgr.showNotice()
	log.info("currentSceneTag:", smgr.currentSceneTag, SCENE_INSTANCE)

	if smgr.currentSceneTag == SCENE_INSTANCE or smgr.currentSceneTag == SCENE_FARM or smgr.currentSceneTag == SCENE_RES_HUANGCHENG or smgr.currentSceneTag == SCENE_RES_JUMING or smgr.currentSceneTag == SCENE_RES_MUCHANG or smgr.currentSceneTag == SCENE_RES_BINGYING or smgr.currentSceneTag == SCENE_RES_NONGTIAN or smgr.currentSceneTag == SCENE_RES_BINGTIE or smgr.currentSceneTag == SCENE_CBHS_POWER then
		smgr.hideNotice()

		return
	end

	local var_18_0 = smgr.getLayer("noticeLayer")

	if not smgr.hasInitNotice then
		showNoticeLayer(var_18_0)

		smgr.hasInitNotice = true
	end

	var_18_0:setVisible(true)

	smgr.isShowNotice = true
end

function smgr.hideNotice()
	smgr.getLayer("noticeLayer"):setVisible(false)

	smgr.isShowNotice = false
end

function smgr.showTipText(arg_20_0)
	local var_20_0 = CCStrokeLabelTTF:create(arg_20_0, "Thonburi", 22, 2)

	var_20_0:setColor(colorTips.red)
	var_20_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))

	local var_20_1 = smgr.getLayer("tipLayer")

	var_20_1:addChild(var_20_0)

	local function var_20_2()
		var_20_1:removeChild(var_20_0, true)
	end

	local var_20_3 = CCArray:create()

	var_20_3:addObject(CCMoveBy:create(0.5, ccp(0, 30)))
	var_20_3:addObject(CCDelayTime:create(1.5))
	var_20_3:addObject(CCCallFuncN:create(var_20_2))

	local var_20_4 = CCSequence:create(var_20_3)

	var_20_0:runAction(var_20_4)
end

function smgr.showTipTextGreen(arg_22_0)
	local var_22_0 = CCStrokeLabelTTF:create(arg_22_0, "Thonburi", 22, 2)

	var_22_0:setColor(colorTips.green)
	var_22_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))

	local var_22_1 = smgr.getLayer("tipLayer")

	var_22_1:addChild(var_22_0)

	local function var_22_2()
		var_22_1:removeChild(var_22_0, true)
	end

	local var_22_3 = CCArray:create()

	var_22_3:addObject(CCMoveBy:create(0.5, ccp(0, 30)))
	var_22_3:addObject(CCDelayTime:create(1.5))
	var_22_3:addObject(CCCallFuncN:create(var_22_2))

	local var_22_4 = CCSequence:create(var_22_3)

	var_22_0:runAction(var_22_4)
end

function smgr.showTipTextGreen2(arg_24_0)
	local var_24_0 = CCStrokeLabelTTF:create(arg_24_0, "Thonburi", 22, 2)

	var_24_0:setColor(colorTips.green)
	var_24_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))

	local var_24_1 = smgr.getLayer("tipLayer")

	var_24_1:addChild(var_24_0)

	local function var_24_2()
		var_24_1:removeChild(var_24_0, true)
	end

	local var_24_3 = CCArray:create()

	var_24_3:addObject(CCMoveBy:create(0.5, ccp(0, 30)))
	var_24_3:addObject(CCDelayTime:create(0.2))
	var_24_3:addObject(CCCallFuncN:create(var_24_2))

	local var_24_4 = CCSequence:create(var_24_3)

	var_24_0:runAction(var_24_4)
end

function smgr.showProgramText(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = CCStrokeLabelTTF:create(arg_26_0, "Thonburi", 22, 2)

	var_26_0:setColor(arg_26_1)
	var_26_0:setPosition(arg_26_2)

	local var_26_1 = smgr.getLayer("tipLayer")

	var_26_1:addChild(var_26_0)

	local function var_26_2()
		var_26_1:removeChild(var_26_0, true)
	end

	local var_26_3 = CCArray:create()

	var_26_3:addObject(CCMoveBy:create(0.5, ccp(0, 30)))
	var_26_3:addObject(CCDelayTime:create(1.5))
	var_26_3:addObject(CCCallFuncN:create(var_26_2))

	local var_26_4 = CCSequence:create(var_26_3)

	var_26_0:runAction(var_26_4)
end

function smgr.showSpriteText(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	if arg_28_1 then
		arg_28_0:addChild(arg_28_1)
		arg_28_1:setScale(0.2)

		local function var_28_0()
			if arg_28_0 and arg_28_1 and not tolua.isnull(arg_28_1) then
				arg_28_0:removeChild(arg_28_1, true)
			end

			if arg_28_2 then
				arg_28_2()
			end
		end

		local var_28_1 = CCArray:create()

		var_28_1:addObject(CCMoveBy:create(1, ccp(0, 60)))
		var_28_1:addObject(CCScaleTo:create(0.05, 1.1, 1.1))
		var_28_1:addObject(CCScaleTo:create(0.05, 1, 1))
		var_28_1:addObject(CCDelayTime:create(0.4))

		if type(arg_28_3) == "number" and arg_28_3 > 0 then
			var_28_1:addObject(CCDelayTime:create(arg_28_3))
		end

		var_28_1:addObject(CCCallFuncN:create(var_28_0))

		local var_28_2 = CCSequence:create(var_28_1)

		arg_28_1:runAction(var_28_2)
		arg_28_1:runAction(CCScaleTo:create(0.5, 1, 1))
	end
end

function smgr.showTipSpriteText(arg_30_0, arg_30_1, arg_30_2)
	if arg_30_0 then
		local var_30_0 = smgr.getLayer("tipLayer")

		var_30_0:addChild(arg_30_0)
		arg_30_0:setScale(0.2)

		local function var_30_1()
			if arg_30_0 and not tolua.isnull(arg_30_0) then
				var_30_0:removeChild(arg_30_0, true)
			end

			if arg_30_1 then
				arg_30_1()
			end
		end

		local var_30_2 = CCArray:create()

		var_30_2:addObject(CCMoveBy:create(1, ccp(0, 60)))
		var_30_2:addObject(CCScaleTo:create(0.05, 1.1, 1.1))
		var_30_2:addObject(CCScaleTo:create(0.05, 1, 1))
		var_30_2:addObject(CCDelayTime:create(0.4))

		if type(arg_30_2) == "number" and arg_30_2 > 0 then
			var_30_2:addObject(CCDelayTime:create(arg_30_2))
		end

		var_30_2:addObject(CCCallFuncN:create(var_30_1))

		local var_30_3 = CCSequence:create(var_30_2)

		arg_30_0:runAction(var_30_3)
		arg_30_0:runAction(CCScaleTo:create(0.5, 1, 1))
	end
end

function smgr.showTipFloatYSprite(arg_32_0, arg_32_1, arg_32_2, arg_32_3, arg_32_4, arg_32_5)
	arg_32_1 = arg_32_1 or 60
	arg_32_4 = arg_32_4 or 0.6
	arg_32_5 = arg_32_5 or 1

	if arg_32_0 then
		local var_32_0 = smgr.getLayer("tipLayer")

		var_32_0:addChild(arg_32_0)

		if arg_32_2 then
			arg_32_0:setPosition(arg_32_2)
		end

		arg_32_0:setScale(arg_32_4)

		local function var_32_1()
			var_32_0:removeChild(arg_32_0, true)

			if arg_32_3 then
				arg_32_3()
			end
		end

		local var_32_2 = CCArray:create()

		var_32_2:addObject(CCMoveBy:create(1, ccp(0, arg_32_1)))
		var_32_2:addObject(CCScaleTo:create(0.05, arg_32_5, arg_32_5))
		var_32_2:addObject(CCDelayTime:create(0.2))
		var_32_2:addObject(CCCallFuncN:create(var_32_1))

		local var_32_3 = CCSequence:create(var_32_2)

		arg_32_0:runAction(var_32_3)
		arg_32_0:runAction(CCScaleTo:create(0.2, arg_32_5, arg_32_5))
	end
end

function smgr.showScoreResult(arg_34_0)
	if arg_34_0.result == 0 then
		CCUserDefault:sharedUserDefault():setIntegerForKey("APPSTORE_SCORE", 1)
	elseif arg_34_0.result == 1 then
		CCUserDefault:sharedUserDefault():setIntegerForKey("APPSTORE_SCORE", 1)
	elseif arg_34_0.result == 2 then
		-- block empty
	end
end

function smgr.showScoreTips()
	if conf.supportScoring == true and CCUserDefault:sharedUserDefault():getIntegerForKey("APPSTORE_SCORE") == 0 then
		GScoring:openScoringItem(smgr.showScoreResult)
	end
end

function smgr.showMessageLayer(arg_36_0, arg_36_1)
	local var_36_0 = require("lua/component/MessageLayer")
	local var_36_1 = smgr.getLayer("msgLayer")

	var_36_1:removeAllChildrenWithCleanup(true)
	var_36_0:create(var_36_1, arg_36_0, arg_36_1)
end

function smgr.showDownloadFullPackView()
	if tool.cmpVersion("2.0.2.0", game.version.client) then
		log.info("should show download view.")

		local var_37_0 = require("lua/layer/downloadViewer/downloadDetailView/ui").new()
		local var_37_1 = smgr.getLayer("topLayer")

		var_37_1:removeAllChildrenWithCleanup(true)
		var_37_1:addChild(var_37_0)
	end
end
