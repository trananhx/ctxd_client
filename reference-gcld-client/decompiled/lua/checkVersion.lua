function checkVersion()
	log.info("@@ 检查更新!!!")
	require("lua/layer/versionUpdate/ui")

	local var_1_0 = createVersionUpdateLayer()
	local var_1_1 = CCScene:create()

	var_1_1:addChild(var_1_0)

	if CCApplication:sharedApplication():getTargetPlatform() == kTargetAndroid then
		local function var_1_2(arg_2_0)
			if arg_2_0 == "backClicked" then
				PlatformHelper:getInstance():ExitConfirm("testtitle", "testmsg")
			elseif arg_2_0 == "menuClicked" then
				-- block empty
			end
		end

		var_1_0:setKeypadEnabled(true)
		var_1_0:registerScriptKeypadHandler(var_1_2)
	end

	CCDirector:sharedDirector():runWithScene(var_1_1)
end
