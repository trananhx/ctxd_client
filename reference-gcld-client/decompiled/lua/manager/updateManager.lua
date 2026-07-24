updateManager = {}
updateManager.constant = {}
updateManager.constant.file = {}
updateManager.constant.file.version = "version.lua"
updateManager.constant.file.res = "res.lua"
updateManager.constant.file.res30lv = "res_30lv.lua"
updateManager.constant.file.updateAddress = "update.lua"
updateManager.constant.file.cdnlist = "cdnlist.lua"
updateManager.constant.file.index = "index.lua"
updateManager.constant.file.proxy = "proxy.lua"
updateManager.constant.state = {}
updateManager.constant.state.no = 0
updateManager.constant.state.start = 1
updateManager.constant.state.dowloading = 2
updateManager.constant.state.dowloadover = 3
updateManager.constant.state.dowloadFileList = 4
updateManager.constant.state.dowloadRes = 5
updateManager.constant.state.working = 6
updateManager.constant.state.over = 7
updateManager.constant.state.check_force = 8
updateManager.constant.state.check_dynamic = 9
updateManager.constant.state.update_percent = 10
updateManager.constant.state.show_layer = 11
updateManager.constant.state.download_update_address = 12
updateManager.constant.state.download_cdnlist = 13
updateManager.constant.state.download_zip_over = 14
updateManager.constant.state.download_zip_failed = 15
updateManager.constant.state.install_unzip = 16
updateManager.constant.state.install_percent = 17
updateManager.constant.state.install_over = 18
updateManager.constant.state.idle = 19
updateManager.constant.state.download_zip_over_wait = 20
updateManager.constant.state.wait_for_start_download = 21
updateManager.constant.prefix = {}
updateManager.constant.prefix.jailbreak = ""
updateManager.constant.prefix.appstore = ""
updateManager.constant.prefix.appstore64 = "gcmob-app64/"
updateManager.constant.prefix.wp8 = "gcmob-wp/"
updateManager.constant.prefix.andmouding = "gcmob-baidu-jailbreak/"
updateManager.constant.prefix.iosmouding = "gcmob-baidu-appstore/"
updateManager.constant.limitime = 30
updateManager.state = updateManager.constant.state.no

function updateManager.init()
	if updateManager.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(updateManager.updateSchedulerEntry)
	end

	updateManager.updateSchedulerEntry = nil
	updateManager.writablePath = CCFileUtils:sharedFileUtils():getWritablePath()
	updateManager.autoRetry = 3
	updateManager.request = nil
	updateManager.downloadThread = nil
	updateManager.needUpdate = false
	updateManager.isZipDownload = true
	updateManager.isNeedForceUpdate = false
	updateManager.isNeedDynamicUpdate = false
	updateManager.isZipFailed = false
	updateManager.downloadPercent = 0
	updateManager.downloadFileSize = 0
	updateManager.zipMd5Value = ""
	updateManager.localFileSize = 0
	updateManager.isDownloadDiffLuaFile = false
	updateManager.writablePath = CCFileUtils:sharedFileUtils():getWritablePath()
	updateManager.updateWay = 0
	updateManager.updateMethod = 0
	updateManager.versionKeywords = ""
	updateManager.channelPrefix = ""
	updateManager.localVersion = nil
	updateManager.newVersion = nil
	updateManager.zipFileSize = 0
	updateManager.zipFilePercent = 0
	updateManager.downloadThread = nil
	updateManager.zipThread = nil
	updateManager.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(updateManager.update, 0, false)
	updateManager.state = updateManager.constant.state.start
end

function updateManager.start()
	if updateManager.state == updateManager.constant.state.wait_for_start_download then
		updateManager.downloadstart()
	end
end

function updateManager.over()
	if updateManager.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(updateManager.updateSchedulerEntry)
	end
end

function updateManager.startInstall()
	updateManager.changeState(updateManager.constant.state.install_unzip)
	statMgr.update(statMgr.state.startInstall_30lv)
end

function updateManager.update()
	if updateManager.state == updateManager.constant.state.idle then
		-- block empty
	elseif updateManager.state == updateManager.constant.state.start then
		updateManager.localVersion = {}

		local var_5_0 = CCUserDefault:sharedUserDefault():getStringForKey("gameVersion")

		updateManager.localVersion.game = var_5_0
		updateManager.localVersion.client = CCUserDefault:sharedUserDefault():getStringForKey("clientVersion")
		updateManager.currentResPath = string.format("%s%s", updateManager.writablePath, var_5_0)

		local var_5_1 = updateManager.getUrl(updateManager.constant.file.version)

		updateManager.dowloadFile(var_5_1, updateManager.constant.file.version, updateManager.download_version_file_over)
	elseif updateManager.state == updateManager.constant.state.check_force then
		if tool.cmpVersion(updateManager.localVersion.client, updateManager.newVersion.client) then
			updateManager.isNeedForceUpdate = true
		end

		updateManager.isNeedDynamicUpdate = true
		updateManager.updateWay = 1

		updateManager.changeState(updateManager.constant.state.download_cdnlist)
	elseif updateManager.state == updateManager.constant.state.download_cdnlist then
		local var_5_2 = updateManager.getUrl(updateManager.constant.file.cdnlist)

		updateManager.dowloadFile(var_5_2, updateManager.constant.file.cdnlist, updateManager.download_cdnlist_over)
	elseif updateManager.state == updateManager.constant.state.wait_for_start_download then
		-- block empty
	elseif updateManager.state == updateManager.constant.state.update_percent then
		eventManager.dispatchEvent("downloadProgressDidChanged", updateManager.downloadPercent)
		updateManager.changeState(updateManager.constant.state.idle)
	elseif updateManager.state == updateManager.constant.state.install_unzip then
		updateManager.download_zip_over_and_unzip()
	elseif updateManager.state == updateManager.constant.state.install_percent then
		updateManager.zipFileSize = updateManager.zipThread:getFileCount()

		local var_5_3 = updateManager.zipThread:getFileIndex()
		local var_5_4 = math.floor(var_5_3 * 100 / updateManager.zipFileSize)

		log.info("xxxxxxxx -> ", updateManager.zipFileSize, var_5_3, var_5_4)

		if updateManager.zipFilePercent ~= var_5_4 then
			updateManager.zipFilePercent = var_5_4

			eventManager.dispatchEvent("installProgressDidChanged", var_5_4)

			if var_5_4 == 100 then
				updateManager.changeState(updateManager.constant.state.install_over)
			end
		end
	elseif updateManager.state == updateManager.constant.state.download_zip_over then
		eventManager.dispatchEvent("downloadProgressDidChanged", updateManager.downloadPercent)
		eventManager.dispatchEvent("fullPackDownloadCompleted")
		updateManager.changeState(updateManager.constant.state.download_zip_over_wait)
	elseif updateManager.state == updateManager.constant.state.download_zip_over_wait then
		-- block empty
	elseif updateManager.state == updateManager.constant.state.download_zip_failed then
		-- block empty
	elseif updateManager.state == updateManager.constant.state.install_over then
		eventManager.dispatchEvent("fullPackInstallCompleted")
		updateManager.changeState(updateManager.constant.state.over)
	elseif updateManager.state == updateManager.constant.state.over then
		CCUserDefault:sharedUserDefault():setStringForKey("gameVersion", updateManager.newVersion.game)
		CCFileUtils:sharedFileUtils():addSearchPath(updateManager.updateResPath)
		CCUserDefault:sharedUserDefault():setStringForKey("currentResourcePath", updateManager.updateResPath)

		local var_5_5 = CCUserDefault:sharedUserDefault():getIntegerForKey("inComplete")

		log.info("the package is completed. ", var_5_5)

		if var_5_5 == 1 then
			local var_5_6 = CCUserDefault:sharedUserDefault():getIntegerForKey("packageStatus")

			log.info("the packageStatus is :", var_5_6)

			if var_5_6 == 0 then
				CCUserDefault:sharedUserDefault():setIntegerForKey("packageStatus", 1)
				CCUserDefault:sharedUserDefault():flush()

				if user ~= nil and user.player ~= nil and user.player.playerLv ~= nil and user.player.playerLv >= 35 then
					smgr.changeScene(SCENE_WORLD)
				end

				updateManager.changeState(updateManager.constant.state.no)

				local var_5_7 = updateManager.writablePath .. updateManager.newVersion.game

				if updateManager.updateWay == 1 then
					var_5_7 = var_5_7 .. "_30lv"

					statMgr.update(statMgr.state.installOver_30lv)
				end

				local var_5_8 = var_5_7 .. ".zip"

				log.info("luxiaodong path:", var_5_8)

				if Utils:IsFileExist(var_5_8) then
					log.info("remove file:", var_5_8)
					Utils:removeFile(var_5_8)
				end
			end
		end
	end
end

function updateManager.getUrl(arg_6_0)
	local var_6_0 = channelMgr.getCurrentChannel()

	if var_6_0 == channels.iosAppstore or var_6_0 == channels.iosas2 or var_6_0 == channels.iosas_30 or var_6_0 == channels.iosxy_30 or var_6_0 == channels.iosHaima_30 then
		if CCUserDefault:sharedUserDefault():getIntegerForKey("inApp64Res") == 1 then
			updateManager.updateMethod = 1
			updateManager.channelPrefix = updateManager.constant.prefix.appstore64

			return string.format("%sgcmob-app64/appstore64/%s", conf.address, arg_6_0)
		else
			updateManager.channelPrefix = updateManager.constant.prefix.appstore

			return string.format("%sappstore/%s", conf.address, arg_6_0)
		end
	elseif var_6_0 == channels.iosappstore30lv then
		updateManager.updateMethod = 1
		updateManager.channelPrefix = updateManager.constant.prefix.appstore64

		return string.format("%sgcmob-app64/feiliu30lv/%s", conf.address, arg_6_0)
	elseif var_6_0 == channels.iosplay800 then
		updateManager.updateMethod = 1
		updateManager.channelPrefix = updateManager.constant.prefix.appstore64

		return string.format("%sgcmob-app64/play800/%s", conf.address, arg_6_0)
	elseif var_6_0 == channels.andyulong or var_6_0 == channels.andyulongHD then
		updateManager.channelPrefix = updateManager.constant.prefix.jailbreak

		return string.format("%syulong/%s", conf.address, arg_6_0)
	elseif var_6_0 == channels.wp8WPStore then
		updateManager.channelPrefix = updateManager.constant.prefix.wp8

		return string.format("%swpstore/%s", conf.address, arg_6_0)
	elseif var_6_0 == channels.wp8Tbl then
		updateManager.channelPrefix = updateManager.constant.prefix.wp8
		updateManager.updateMethod = 2

		return string.format("%sgcmob-wp/wp/%s", conf.address, arg_6_0)
	elseif var_6_0 == channels.andmouding then
		updateManager.channelPrefix = updateManager.constant.prefix.andmouding
		updateManager.updateMethod = 0

		return string.format("%sgcmob-baidu-jailbreak/mdsg/%s", conf.address, arg_6_0)
	elseif var_6_0 == channels.iosmouding then
		updateManager.updateMethod = 1
		updateManager.channelPrefix = updateManager.constant.prefix.iosmouding

		return string.format("%sgcmob-baidu-appstore/mdsg/%s", conf.address, arg_6_0)
	else
		updateManager.channelPrefix = updateManager.constant.prefix.jailbreak

		return string.format("%sjailbreak/%s", conf.address, arg_6_0)
	end
end

function updateManager.dowloadFile(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = false

	if arg_7_0 == nil then
		var_7_0 = true

		if updateManager.cdnIndex <= 0 then
			updateManager.cdnIndex = #updateManager.cdnlist
		end

		arg_7_0 = updateManager.cdnlist[updateManager.cdnIndex].url .. arg_7_1
	end

	if arg_7_1 == updateManager.constant.file.version and string.endWith(arg_7_0, updateManager.constant.file.version) then
		local var_7_1 = channelMgr.getCurrentChannel()

		arg_7_0 = string.format("%s?client=%s&res=%s&yx=%s", arg_7_0, game.version.client, game.version.game, var_7_1.flag)
	end

	local function var_7_2()
		updateManager.autoRetry = updateManager.autoRetry - 1

		if updateManager.autoRetry == 0 and updateManager.isDownloadDiffLuaFile == true then
			updateManager.changeState(updateManager.constant.state.download_zip_failed)

			return
		end

		if var_7_0 then
			if string.find(arg_7_0, "http://%d+%.%d+%.%d+%.%d+") ~= nil then
				local var_8_0, var_8_1 = string.gsub(arg_7_0, conf.address, conf.domainAddress)

				updateManager.dowloadFile(var_8_0, arg_7_1, arg_7_2)
			else
				updateManager.updateCdnIndex()
				updateManager.dowloadFile(nil, arg_7_1, arg_7_2)
			end
		elseif conf.domainAddress then
			local var_8_2, var_8_3 = string.gsub(arg_7_0, conf.address, conf.domainAddress)

			game.useDomain = true
			conf.address = conf.domainAddress

			updateManager.dowloadFile(var_8_2, arg_7_1, arg_7_2)
		else
			updateManager.dowloadFile(arg_7_0, arg_7_1, arg_7_2)
		end
	end

	local function var_7_3(arg_9_0)
		local var_9_0 = arg_9_0.name == "completed"
		local var_9_1 = arg_9_0.request
		local var_9_2 = var_9_1:getErrorCode()
		local var_9_3 = var_9_1:getErrorMessage()

		if not var_9_0 then
			var_7_2()

			return
		end

		local var_9_4 = var_9_1:getResponseStatusCode()

		if var_9_4 ~= 200 then
			updateManager.requestFaild(arg_7_1, var_9_4, "http status is not 200")
			var_7_2()

			return
		end

		if arg_7_2 then
			arg_7_2(arg_7_1, var_9_1)
		end
	end

	local function var_7_4(arg_10_0)
		local var_10_0 = arg_10_0.request

		if var_10_0 then
			updateManager.request = var_10_0
			updateManager.downloadSpeed = arg_10_0.speed or 0
			updateManager.downloadTotle = arg_10_0.download or 0
			updateManager.exceptTotle = arg_10_0.exceptDownloadNum or 0
		end
	end

	log.info("[download] ", arg_7_0)

	local var_7_5 = CCHttpClient:createHttpRequestWithoutStart(var_7_3, arg_7_0, kCCHTTPRequestMethodGET)

	if string.find(arg_7_0, "http://%d+%.%d+%.%d+%.%d+") ~= nil then
		var_7_5:addRequestHeader("Host:patch.gcmob.aoshitang.com")
	end

	var_7_5:start()
	updateManager.changeState(updateManager.constant.state.dowloading)
end

function updateManager.download_cdnlist_over(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_1:getResponseString()

	updateManager.cdnlist = loadstring(var_11_0)()
	updateManager.cdnIndex = #updateManager.cdnlist

	log.info("cndIndex is :", updateManager.cdnIndex)
	updateManager.try_to_find_cdn()
end

function updateManager.try_to_find_cdn()
	log.info("try_to_find_cdn")

	local var_12_0 = updateManager.channelPrefix .. updateManager.versionKeywords

	if updateManager.updateWay == 1 then
		var_12_0 = var_12_0 .. "_30lv"
	end

	local var_12_1 = var_12_0 .. ".lua"

	updateManager.isDownloadDiffLuaFile = true

	updateManager.dowloadFile(nil, var_12_1, updateManager.try_to_find_cdn_over)
end

function updateManager.try_to_find_cdn_over(arg_13_0, arg_13_1)
	updateManager.isDownloadDiffLuaFile = false
	updateManager.selectCdn = updateManager.cdnlist[updateManager.cdnIndex]

	log.info("cdn index :", updateManager.cdnIndex)
	log.info("cdn url :", updateManager.selectCdn.url)

	local var_13_0 = arg_13_1:getResponseString()
	local var_13_1 = loadstring(var_13_0)()

	updateManager.downloadFileSize = var_13_1.value
	updateManager.zipMd5Value = var_13_1.md5

	local var_13_2 = updateManager.writablePath .. updateManager.newVersion.game

	if updateManager.updateWay == 1 then
		var_13_2 = var_13_2 .. "_30lv"
	end

	local var_13_3 = var_13_2 .. ".zip"

	log.info("luxiaodong path:", var_13_3)

	if Utils:IsFileExist(var_13_3) then
		updateManager.localFileSize = GResumeDownloadThread:getLocalFileSize(var_13_3)
	else
		updateManager.localFileSize = 0
	end

	log.info("luxiaodong size: ", updateManager.downloadFileSize, updateManager.localFileSize)

	if updateManager.localFileSize == updateManager.downloadFileSize then
		updateManager.downloadPercent = 100
		updateManager.localFileSize = updateManager.downloadFileSize

		updateManager.changeState(updateManager.constant.state.download_zip_over)
	else
		updateManager.downloadPercent = math.floor(updateManager.localFileSize * 100 / updateManager.downloadFileSize)

		eventManager.dispatchEvent("downloadProgressDidChanged", updateManager.downloadPercent)
		updateManager.changeState(updateManager.constant.state.wait_for_start_download)
	end
end

function updateManager.downloadThreadResult(arg_14_0)
	if arg_14_0.result == -1 then
		log.info("zip动更网络异常. 重新动更")
		updateManager.changeState(updateManager.constant.state.download_zip_failed)
	elseif arg_14_0.result == 0 then
		log.info("luxiaodong 0: ", arg_14_0.percent)

		updateManager.downloadPercent = math.floor(arg_14_0.percent)
		updateManager.localFileSize = updateManager.downloadFileSize * arg_14_0.percent / 100

		updateManager.changeState(updateManager.constant.state.update_percent)
	elseif arg_14_0.result == 1 then
		log.info("luxiaodong 1: download is over.")

		updateManager.downloadPercent = 100
		updateManager.localFileSize = updateManager.downloadFileSize

		updateManager.changeState(updateManager.constant.state.download_zip_over)
	end
end

function updateManager.downloadstart()
	updateManager.downloadThread = GResumeDownloadThread:create()

	updateManager.downloadThread:retain()

	local var_15_0 = updateManager.selectCdn.url .. updateManager.channelPrefix .. updateManager.versionKeywords

	if updateManager.updateWay == 1 then
		var_15_0 = var_15_0 .. "_30lv"

		statMgr.update(statMgr.state.startDownload_30lv)
	end

	local var_15_1 = var_15_0 .. ".zip"

	updateManager.downloadThread:create_download_thread(var_15_1, updateManager.writablePath, updateManager.downloadThreadResult)
	updateManager.changeState(updateManager.constant.state.idle)
end

function updateManager.download_version_file_over(arg_16_0, arg_16_1)
	log.info("@@ 检查版本是否需要更新")

	local var_16_0 = arg_16_1:getResponseString()

	loadstring(var_16_0)()

	updateManager.newVersion = sys_version

	log.info("当前版本： ")
	log.info("==> game:", updateManager.localVersion.game)
	log.info("==> client:", updateManager.localVersion.client)
	log.info("更新版本：")
	log.info("==> game:", updateManager.newVersion.game)
	log.info("==> client:", updateManager.newVersion.client)

	updateManager.versionKeywords = updateManager.localVersion.game .. "/" .. updateManager.newVersion.game

	updateManager.changeState(updateManager.constant.state.check_force)
end

function updateManager.download_zip_over_and_unzip()
	local var_17_0 = updateManager.writablePath .. updateManager.newVersion.game

	if updateManager.updateWay == 1 then
		var_17_0 = var_17_0 .. "_30lv"
	end

	local var_17_1 = var_17_0 .. ".zip"
	local var_17_2 = updateManager.writablePath .. updateManager.newVersion.game .. "/"

	updateManager.updateResPath = updateManager.writablePath .. updateManager.newVersion.game

	log.info("luxiaodong 1:", var_17_1)
	log.info("luxiaodong 2:", var_17_2)
	log.info("luxiaodong 3:", updateManager.currentResPath)
	log.info("luxiaodong 4:", updateManager.updateResPath)

	if not Utils:IsDirExist(var_17_2) then
		local var_17_3 = updateManager.updateResPath

		if not string.endWith(var_17_3, "/") then
			var_17_3 = var_17_3 .. "/"
		end

		Utils:CreatePath(var_17_3)
	end

	local var_17_4 = Utils:md5File(var_17_1)

	if updateManager.zipMd5Value == var_17_4 then
		updateManager.zipThread = GZipToolsThread:zipFiles(var_17_1, updateManager.updateResPath, updateManager.currentResPath)

		updateManager.changeState(updateManager.constant.state.install_percent)
	else
		log.info("oh no, zip file md5 compare failed.")
		log.info("server :", updateManager.zipMd5Value)
		log.info("client :", var_17_4)
		updateManager.changeState(updateManager.constant.state.download_zip_failed)
	end
end

function updateManager.updateCdnIndex()
	updateManager.cdnIndex = updateManager.cdnIndex - 1

	if updateManager.cdnIndex <= 0 then
		updateManager.cdnIndex = #updateManager.cdnlist
	end
end

function updateManager.changeState(arg_19_0)
	log.info("change state: ", arg_19_0)

	updateManager.state = arg_19_0
end

function updateManager.requestFaild(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = string.format("%sdownloadError?%s&%s&%s", conf.address, arg_20_0, arg_20_1, arg_20_2)

	local function var_20_1(arg_21_0)
		log.info("requestFaild: ", arg_20_0)
	end

	CCHttpClient:createHTTPRequestLua(var_20_1, var_20_0, kCCHTTPRequestMethodGET)
end

function updateManager.getTotalFileSize()
	return updateManager.downloadFileSize
end

function updateManager.getLocalFileSize()
	return updateManager.localFileSize
end

function updateManager.getDownloadPercent()
	return updateManager.downloadPercent
end

function updateManager.getZipFileCount()
	return updateManager.zipFileSize
end

function updateManager.getZipFilePercent()
	return updateManager.zipFilePercent
end

function updateManager.getState()
	if updateManager.state == updateManager.constant.state.no then
		return 1
	elseif updateManager.state == updateManager.constant.state.wait_for_start_download then
		return 3
	elseif updateManager.state == updateManager.constant.state.download_zip_over then
		return 4
	elseif updateManager.state == updateManager.constant.state.download_zip_over_wait then
		return 4
	elseif updateManager.state == updateManager.constant.state.install_unzip then
		return 5
	elseif updateManager.state == updateManager.constant.state.install_over then
		return 5
	elseif updateManager.state == updateManager.constant.state.over then
		return 6
	end

	return 2
end
