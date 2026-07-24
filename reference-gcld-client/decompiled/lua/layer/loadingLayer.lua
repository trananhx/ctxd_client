loadingLayer = {}
loadingLayer["res_" .. SCENE_WORLD] = {
	"res/tiledmap/block1_1.jpg",
	"res/tiledmap/block1_2.jpg",
	"res/tiledmap/block1_3.jpg",
	"res/tiledmap/block1_4.jpg",
	"res/tiledmap/block1_5.jpg",
	"res/tiledmap/block1_6.jpg",
	"res/tiledmap/block2_1.jpg",
	"res/tiledmap/block2_2.jpg",
	"res/tiledmap/block2_3.jpg",
	"res/tiledmap/block2_4.jpg",
	"res/tiledmap/block2_5.jpg",
	"res/tiledmap/block2_6.jpg",
	"res/tiledmap/block3_1.jpg",
	"res/tiledmap/block3_2.jpg",
	"res/tiledmap/block3_3.jpg",
	"res/tiledmap/block3_4.jpg",
	"res/tiledmap/block3_5.jpg",
	"res/tiledmap/block3_6.jpg",
	"res/tiledmap/block4_1.jpg",
	"res/tiledmap/block4_2.jpg",
	"res/tiledmap/block4_3.jpg",
	"res/tiledmap/block4_4.jpg",
	"res/tiledmap/block4_5.jpg",
	"res/tiledmap/block4_6.jpg",
	"res/tiledmap/block5_1.jpg",
	"res/tiledmap/block5_2.jpg",
	"res/tiledmap/block5_3.jpg",
	"res/tiledmap/block5_4.jpg",
	"res/tiledmap/block5_5.jpg",
	"res/tiledmap/block5_6.jpg",
	"res/tiledmap/block6_1.jpg",
	"res/tiledmap/block6_2.jpg",
	"res/tiledmap/block6_3.jpg",
	"res/tiledmap/block6_4.jpg",
	"res/tiledmap/block6_5.jpg",
	"res/tiledmap/block6_6.jpg"
}
loadingLayer.loadList = {}
loadingLayer.updateSchedulerEntry = nil
loadingLayer.isUpdated = false
loadingLayer.visible = false
loadingLayer["res_load_" .. SCENE_WORLD] = false

function loadingLayer.setPercentage(arg_1_0)
	if loadingLayer.progress then
		loadingLayer.progress:setPercentage(arg_1_0)
		loadingLayer.loadingLight:setPosition(ccp(435 * arg_1_0 / 100, 8.5))
	end
end

local function var_0_0()
	if not loadingLayer.sceneName then
		return
	end

	local var_2_0 = loadingLayer["res_" .. loadingLayer.sceneName]

	if loadingLayer.index > #var_2_0 then
		smgr.changeScene(loadingLayer.sceneName, loadingLayer.params)

		if loadingLayer.updateSchedulerEntry then
			CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(loadingLayer.updateSchedulerEntry)

			loadingLayer.updateSchedulerEntry = nil
		end

		loadingLayer["res_load_" .. loadingLayer.sceneName] = true

		return
	end

	local var_2_1 = var_2_0[loadingLayer.index]

	if var_2_1 and not loadingLayer[var_2_1] then
		CCTextureCache:sharedTextureCache():addImage(var_2_1)

		loadingLayer.loadList[var_2_1] = true
	end

	loadingLayer.setPercentage(1 * loadingLayer.index / #var_2_0 * 100)

	loadingLayer.index = loadingLayer.index + 1
end

local function var_0_1()
	log.info("loading layer enter")
end

local function var_0_2()
	log.info("loading layer exit")
end

function loadingLayer.init()
	local var_5_0 = CCLayerColor:create(ccc4(0, 0, 0, 255))

	local function var_5_1(arg_6_0)
		if arg_6_0 == "enter" then
			var_0_1()
		elseif arg_6_0 == "exit" then
			var_0_2()
		end
	end

	var_5_0:registerScriptHandler(var_5_1)

	local var_5_2 = CCSprite:create("res/ui/loading/loading_view.png")

	var_5_2:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
	var_5_0:addChild(var_5_2)

	local var_5_3 = CCProgressTimer:create(CCSprite:create("res/ui/loading/loading_con.png"))

	var_5_3:setPosition(ccp(var_5_2:getContentSize().width / 2, 20))
	var_5_2:addChild(var_5_3)
	var_5_3:setType(kCCProgressTimerTypeBar)
	var_5_3:setMidpoint(ccp(0, 0))
	var_5_3:setBarChangeRate(ccp(1, 0))
	var_5_3:setPercentage(0)

	loadingLayer.progress = var_5_3

	local var_5_4 = CCSprite:create("res/ui/loading/loading_light.png")

	var_5_4:setPosition(ccp(0, 8.5))
	var_5_3:addChild(var_5_4)

	loadingLayer.loadingLight = var_5_4

	smgr.registerLayer(var_5_0, "loadingLayer")

	loadingLayer.visible = false

	var_5_0:setVisible(false)

	return var_5_0
end

function loadingLayer.show(arg_7_0, ...)
	if smgr.currentSceneTag == arg_7_0 and smgr.currentSceneTag == SCENE_WORLD then
		eventManager.dispatchEvent("moveToCity", ...)

		return
	end

	smgr.changeScene(arg_7_0, ...)

	do return end

	if loadingLayer.visible == true then
		return
	end

	CCTextureCache:sharedTextureCache():removeUnusedTextures()

	if smgr.currentSceneTag == arg_7_0 and smgr.currentSceneTag == SCENE_WORLD then
		eventManager.dispatchEvent("moveToCity", ...)

		return
	end

	eventManager.dispatchEvent("sceneWillChange")

	loadingLayer.sceneName = arg_7_0
	loadingLayer.params = ...
	loadingLayer.visible = true

	if loadingLayer["res_load_" .. loadingLayer.sceneName] then
		smgr.changeScene(loadingLayer.sceneName, loadingLayer.params)

		return
	end

	loadingLayer.setPercentage(0)

	local var_7_0 = smgr.getLayer("loadingLayer")

	eventManager.dispatchEvent("rightMenuSetVisible", false)
	var_7_0:setVisible(true)

	loadingLayer.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_0_0, 0, false)
	loadingLayer.index = 1
end

function loadingLayer.hide()
	loadingLayer.sceneName = nil

	local var_8_0 = smgr.getLayer("loadingLayer")

	loadingLayer.visible = false

	local var_8_1 = false

	if worldUI and worldUI.shouldHdieMenu then
		log.info("should hide menu")

		var_8_1 = true
		worldUI.shouldHdieMenu = false
	end

	eventManager.dispatchEvent("rightMenuSetVisible", not var_8_1)
	var_8_0:setVisible(false)

	if loadingLayer.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(loadingLayer.updateSchedulerEntry)

		loadingLayer.updateSchedulerEntry = nil
	end
end
