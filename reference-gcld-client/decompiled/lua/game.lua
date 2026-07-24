game = {}
game.version = {}
game.newVersion = {}
game.useDomain = false

function game.init()
	game.server = {}
	game.server.name = nil
	game.server.address = nil
	game.server.port = nil
end

function game.startup()
	require("lua/requireAll")
	require("lua/manager/sceneManager")
	reload("lua/manager/resourceManager")
	require("lua/manager/connectManager")
	require("lua/manager/kfConnectManager")
	require("lua/manager/battleManager")
	require("lua/manager/voiceManager")
	require("lua/manager/gmManager")
	require("lua/manager/audioManager")
	require("lua/manager/channelManager")
	require("lua/manager/permissionManager")
	require("lua/manager/StatisticsManager")
	require("lua/layer/menu/ui")
	require("lua/layer/pushLayer")
	require("lua/ui/uiutil")
	require("lua/game/user/user")
	require("lua/game/general/generalState")
	game.init()
	rmgr.init()
	amgr.init()
	smgr.init()
	channelMgr.init()
	gmgr.init()

	if platform.platform == kTargetAndroid then
		smgr.rootLayer:setKeypadEnabled(true)

		local function var_2_0(arg_3_0)
			if arg_3_0 == "backClicked" then
				PlatformHelper:getInstance():ExitConfirm("testtitle", "testmsg")
			elseif arg_3_0 == "menuClicked" then
				-- block empty
			end
		end

		smgr.rootLayer:registerScriptKeypadHandler(var_2_0)
	end

	if not CCUserDefault:sharedUserDefault():getBoolForKey("hasOpenGame") then
		statMgr.update(statMgr.state.firstOpen)
		CCUserDefault:sharedUserDefault():setBoolForKey("hasOpenGame", true)
	end

	statMgr.update(statMgr.state.open)
	game.startScene()
end

function game.exit()
	CCDirector:sharedDirector():endToLua()
end

function game.startScene()
	log.info("-- start scene --")
	CCDirector:sharedDirector():replaceScene(smgr.startScene())
end
