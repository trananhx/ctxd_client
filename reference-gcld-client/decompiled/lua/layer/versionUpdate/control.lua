require("lua/data/cantRemoveFiles")
require("lua/layer/versionUpdate/constant")
require("lua/manager/channelManager")
require("lua/game")
require("lua/manager/StatisticsManager")
require("lua/manager/permissionManager")

local var_0_0 = CCDirector:sharedDirector():getScheduler()
local var_0_1 = require("lua/component/MessageLayer")
local var_0_2 = 3

function createVersionUpdateControl(arg_1_0)
	local var_1_0 = {}

	var_1_0.updateSchedulerEntry = nil
	var_1_0.state = versionUpdateConstant.state.start
	var_1_0.cdnIndex = 1
	var_1_0.autoRetry = var_0_2
	var_1_0.forceUpdateInfo = nil
	var_1_0.needUpdate = false
	var_1_0.versionFile = nil
	var_1_0.localVersion = nil
	var_1_0.newVersion = nil
	var_1_0.downloadList = nil
	var_1_0.currentResPath = nil
	var_1_0.updateResPath = nil
	var_1_0.requestFilePath = nil
	var_1_0.resList = {}
	var_1_0.resSize = 0
	var_1_0.fileMd5 = {}
	var_1_0.lastFileList = {}
	var_1_0.hasDownloadSize = 0
	var_1_0.progressControl = nil
	var_1_0.hasProgress = true
	var_1_0.downloadTotle = 0
	var_1_0.downloadLastTotle = 0
	var_1_0.downloadSpeed = 0
	var_1_0.speedCountDown = versionUpdateConstant.limitime
	var_1_0.request = nil
	var_1_0.isNeedForceUpdate = false
	var_1_0.isNeedDynamicUpdate = false
	var_1_0.isSupportZipDownLoad = false
	var_1_0.isZipDownload = false
	var_1_0.isZipFialed = false
	var_1_0.downloadPercent = 0
	var_1_0.downloadFileSize = 0
	var_1_0.zipMd5Value = ""
	var_1_0.localFileSize = 0
	var_1_0.writablePath = CCFileUtils:sharedFileUtils():getWritablePath()
	var_1_0.updateMethod = 0
	var_1_0.cdnlist = nil
	var_1_0.selectCdn = nil

	function var_1_0.checkSupportZipDownload()
		if tool.cmpVersion("2.0.0.0", var_1_0.localVersion.client) then
			var_1_0.isSupportZipDownLoad = true
		end
	end

	function var_1_0.checkZipDownload()
		log.info("checkZipDownload: ", var_1_0.isZipDownload)

		if var_1_0.isSupportZipDownLoad == true and var_1_0.newVersion.isZipDownload ~= nil then
			var_1_0.isZipDownload = var_1_0.newVersion.isZipDownload
		end

		log.info("checkZipDownload: ", var_1_0.isZipDownload)
	end

	function var_1_0.getUrl(arg_4_0)
		local var_4_0 = channelMgr.getCurrentChannel()
		local var_4_1 = conf.address

		if platform.getFlag() == "MOBILE_IPHONE" then
			if CCUserDefault:sharedUserDefault():getIntegerForKey("inApp64Res") == 1 then
				var_1_0.updateMethod = 1

				return string.format("%sgcmob-app64/appstore64/%s", conf.address, arg_4_0)
			else
				var_1_0.updateMethod = 0

				return string.format("%sappstore/%s", var_4_1, arg_4_0)
			end
		else
			var_1_0.updateMethod = 0

			return string.format("%sjailbreak/%s", var_4_1, arg_4_0)
		end
	end

	function var_1_0.getTipText(arg_5_0, arg_5_1, arg_5_2)
		local var_5_0 = language.get(280006, tool.formatBytes(arg_5_0), tool.formatBytes(arg_5_1))

		if var_1_0.hasProgress then
			var_5_0 = var_5_0 .. string.format("(%s/s)", tool.formatBytes(arg_5_2))
		end

		return var_5_0
	end

	function var_1_0.getTipTextForDownloadFileList(arg_6_0, arg_6_1, arg_6_2)
		local var_6_0 = language.get(280008, tool.formatBytes(arg_6_0), tool.formatBytes(arg_6_1))

		if var_1_0.hasProgress then
			var_6_0 = var_6_0 .. string.format("(%s/s)", tool.formatBytes(arg_6_2))
		end

		return var_6_0
	end

	local function var_1_1()
		return
	end

	local function var_1_2(arg_8_0, arg_8_1)
		return
	end

	local function var_1_3(arg_9_0)
		log.info("change state: ", arg_9_0)

		var_1_0.state = arg_9_0
	end

	function var_1_0.updateCdnIndex()
		var_1_0.cdnIndex = var_1_0.cdnIndex - 1

		if var_1_0.cdnIndex <= 0 then
			var_1_0.cdnIndex = #var_1_0.cdnlist
		end
	end

	function var_1_0.requestFaild(arg_11_0, arg_11_1, arg_11_2)
		local var_11_0 = string.format("%sdownloadError?%s&%s&%s", conf.address, arg_11_0, arg_11_1, arg_11_2)

		local function var_11_1(arg_12_0)
			return
		end

		CCHttpClient:createHTTPRequestLua(var_11_1, var_11_0, kCCHTTPRequestMethodGET)
	end

	local function var_1_4(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
		local var_13_0 = false

		if arg_13_0 == nil then
			var_13_0 = true

			if var_1_0.cdnIndex <= 0 then
				var_1_0.cdnIndex = #var_1_0.cdnlist
			end

			arg_13_0 = var_1_0.cdnlist[var_1_0.cdnIndex].url .. arg_13_1
		end

		if arg_13_1 == versionUpdateConstant.file.version and string.endWith(arg_13_0, versionUpdateConstant.file.version) then
			arg_13_0 = string.format("%s?client=%s&res=%s", arg_13_0, game.version.client, game.version.game)
		end

		local function var_13_1()
			var_1_0.autoRetry = var_1_0.autoRetry - 1

			if var_13_0 then
				var_1_0.updateCdnIndex()
				var_1_4(nil, arg_13_1, arg_13_2, arg_13_3)
			elseif conf.domainAddress and channelMgr.currentChannel.appstore then
				local var_14_0, var_14_1 = string.gsub(arg_13_0, conf.address, conf.domainAddress)

				game.useDomain = true
				conf.address = conf.domainAddress

				var_1_4(var_14_0, arg_13_1, arg_13_2, arg_13_3)
			elseif conf.language == "xm" then
				log.info("xm https failed..try http")

				local var_14_2 = "http://gcmobpatch.ujoy.com/"
				local var_14_3, var_14_4 = string.gsub(arg_13_0, conf.address, var_14_2)

				conf.address = var_14_2

				var_1_4(var_14_3, arg_13_1, arg_13_2, arg_13_3)
			elseif conf.language == "tw" then
				local var_14_5
				local var_14_6 = channelMgr.getCurrentChannel() == channels.andTwPub and "http://patch.mgc.pubgame.tw/" or "http://patchftgc-gcmob.aoshitang.com/"
				local var_14_7, var_14_8 = string.gsub(arg_13_0, conf.address, var_14_6)

				conf.address = var_14_6

				var_1_4(var_14_7, arg_13_1, arg_13_2, arg_13_3)
			else
				var_1_4(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
			end
		end

		local function var_13_2(arg_15_0)
			local var_15_0 = arg_15_0.name == "completed"
			local var_15_1 = arg_15_0.request
			local var_15_2 = var_15_1:getErrorCode()
			local var_15_3 = var_15_1:getErrorMessage()

			if not var_15_0 then
				var_1_0.requestFaild(arg_13_1, var_15_2, var_15_3)

				if var_1_0.autoRetry <= 0 and (not var_1_0.cdnlist or var_1_0.cdnIndex == 0) then
					var_1_0.autoRetry = var_0_2

					var_0_1:create(arg_1_0, language.get(280001), var_13_1)
				else
					var_13_1()
				end

				return
			end

			local var_15_4 = var_15_1:getResponseStatusCode()

			if var_15_4 ~= 200 then
				var_1_0.requestFaild(arg_13_1, var_15_4, "http status is not 200")

				if var_1_0.autoRetry <= 0 and (not var_1_0.cdnlist or var_1_0.cdnIndex == 0) then
					var_1_0.autoRetry = var_0_2

					var_0_1:create(arg_1_0, language.get(280001), var_13_1)
				else
					var_13_1()
				end

				return
			end

			if arg_13_3 then
				arg_13_3(arg_13_1, var_15_1)
			end
		end

		local function var_13_3(arg_16_0)
			local var_16_0 = arg_16_0.request

			if var_16_0 then
				var_1_0.request = var_16_0
				var_1_0.downloadSpeed = arg_16_0.speed or 0
				var_1_0.downloadTotle = arg_16_0.download or 0
				var_1_0.exceptTotle = arg_16_0.exceptDownloadNum or 0
			end
		end

		log.info("[download] ", arg_13_0)

		if not pcall(CCHttpClient.createHTTPRequestLuaWithProgress, CCHttpClient, var_13_2, var_13_3, arg_13_0, kCCHTTPRequestMethodGET) then
			var_1_0.hasProgress = false

			CCHttpClient:createHTTPRequestLua(var_13_2, arg_13_0, kCCHTTPRequestMethodGET)
		end

		var_1_3(versionUpdateConstant.state.dowloading)
	end

	local function var_1_5()
		local var_17_0

		var_1_0.isNeedForceUpdate = false

		var_1_0.progressControl:showTip("")

		local function var_17_1()
			local var_18_0 = "http://gc.aoshitang.com/"

			if var_1_0.forceUpdateInfo.urlIndex == 0 then
				var_18_0 = var_1_0.forceUpdateInfo.url
			elseif var_1_0.forceUpdateInfo.urlIndex == 1 then
				var_18_0 = var_1_0.selectCdn.url .. var_1_0.forceUpdateInfo.cdnurl
			end

			CCApplication:sharedApplication():openURL(var_18_0)
		end

		local function var_17_2()
			log.info("messageBox cancel.")
			arg_1_0:removeChild(var_17_0, true)

			if var_1_0.isNeedDynamicUpdate == true then
				var_1_3(versionUpdateConstant.state.check_dynamic)
			else
				var_1_3(versionUpdateConstant.state.over)
			end
		end

		local function var_17_3()
			game.exit()
		end

		local var_17_4 = require("lua/layer/versionUpdate/updateMessageBox")

		if var_1_0.forceUpdateInfo then
			local var_17_5 = var_1_0.forceUpdateInfo.msg or language.get(280004)
			local var_17_6
			local var_17_7
			local var_17_8

			if var_1_0.forceUpdateInfo.urlIndex ~= nil then
				if (var_1_0.forceUpdateInfo.force or false) == false then
					var_17_0 = var_17_4:create(arg_1_0, var_17_5, var_17_1, var_17_2, nil)
				else
					var_17_0 = var_17_4:create(arg_1_0, var_17_5, var_17_1, nil, nil)
				end
			elseif var_1_0.isNeedDynamicUpdate == true then
				var_1_3(versionUpdateConstant.state.check_dynamic)
			else
				var_1_3(versionUpdateConstant.state.over)
			end
		elseif var_1_0.isNeedDynamicUpdate == true then
			var_1_3(versionUpdateConstant.state.check_dynamic)
		else
			var_1_3(versionUpdateConstant.state.over)
		end
	end

	local function var_1_6(arg_21_0, arg_21_1)
		local var_21_0 = arg_21_1:getResponseString()
		local var_21_1 = loadstring(var_21_0)()
		local var_21_2 = channelMgr.getCurrentChannel()

		if var_21_2 and var_21_2.flag then
			for iter_21_0, iter_21_1 in pairs(var_21_1) do
				if iter_21_0 == var_21_2.flag then
					var_1_0.forceUpdateInfo = iter_21_1

					break
				end
			end
		end

		var_1_3(versionUpdateConstant.state.download_cdnlist)
	end

	local function var_1_7(arg_22_0, arg_22_1)
		local var_22_0 = arg_22_1:getResponseString()

		var_1_0.cdnlist = loadstring(var_22_0)()
		var_1_0.cdnIndex = #var_1_0.cdnlist

		log.info("cndIndex is :", var_1_0.cdnIndex)
		var_1_3(versionUpdateConstant.state.check_dynamic)
	end

	local function var_1_8(arg_23_0, arg_23_1)
		local var_23_0 = arg_23_1:getResponseString()

		var_1_0.cdnlist = loadstring(var_23_0)()

		var_1_3(versionUpdateConstant.state.dowloadFileList)
	end

	local function var_1_9(arg_24_0)
		if arg_24_0.result == -1 then
			log.info("luxiaodong : ")
		elseif arg_24_0.result == 0 then
			log.info("luxiaodong 0: ", arg_24_0.percent)

			var_1_0.downloadPercent = math.floor(arg_24_0.percent)

			var_1_3(versionUpdateConstant.state.update_percent)
		elseif arg_24_0.result == 1 then
			log.info("luxiaodong 1: download is over.")
			var_1_3(versionUpdateConstant.state.download_zip_over)
		end
	end

	local function var_1_10(arg_25_0, arg_25_1)
		local var_25_0

		local function var_25_1()
			if var_1_0.isZipDownload == true then
				local var_26_0 = GResumeDownloadThread:create()

				arg_1_0:addChild(var_26_0, 2)

				local var_26_1

				if var_1_0.updateMethod == 0 then
					var_26_1 = var_1_0.selectCdn.url .. var_1_0.localVersion.game .. "/" .. var_1_0.newVersion.game .. ".zip"
				elseif var_1_0.updateMethod == 1 then
					var_26_1 = var_1_0.selectCdn.url .. "gcmob-app64/" .. var_1_0.localVersion.game .. "/" .. var_1_0.newVersion.game .. ".zip"
				end

				local var_26_2 = var_1_0.writablePath

				var_26_0:create_download_thread(var_26_1, var_26_2, var_1_9)
			else
				var_1_3(versionUpdateConstant.state.dowloadRes)
				var_1_0.progressControl:show()
			end
		end

		local function var_25_2()
			log.info("downloadFullPackage")
			arg_1_0:removeChild(var_25_0, true)

			local var_27_0 = "http://gc.aoshitang.com/"

			if var_1_0.forceUpdateInfo.urlIndex == 0 then
				var_27_0 = var_1_0.forceUpdateInfo.url
			elseif var_1_0.forceUpdateInfo.urlIndex == 1 then
				var_27_0 = var_1_0.selectCdn.url .. var_1_0.forceUpdateInfo.cdnurl
			end

			CCApplication:sharedApplication():openURL(var_27_0)
			game.exit()
		end

		local function var_25_3()
			log.info("donwloadNow")
			arg_1_0:removeChild(var_25_0, true)
			var_25_1()
			var_1_0.progressControl:showTip(language.get(300015))
		end

		if var_1_0.newVersion.versionRank == 5 then
			var_25_1()

			return
		end

		if var_1_0.isZipDownload == true then
			local var_25_4 = tonumber(arg_25_0) / 1048576
			local var_25_5 = tonumber(arg_25_1) / 1048576

			log.info("luxiaodong t:" .. arg_25_0 .. " " .. var_25_4)
			log.info("luxiaodong l:" .. arg_25_1 .. " " .. var_25_5)

			if (var_1_0.newVersion.versionRank == nil or var_1_0.newVersion.versionRank == 0) and var_25_4 - var_25_5 < 1 then
				var_25_1()

				return
			end

			local var_25_6 = language.get(440008, math.floor(var_25_4 * 10) / 10, math.floor(var_25_5 * 10) / 10)

			if arg_25_1 == 0 then
				var_1_0.newVersion.versionSize = string.format("%sM", math.floor(var_25_4 * 10) / 10)
				var_1_0.newVersion.isContinue = 0
				var_1_0.newVersion.fileSize = var_25_4
			else
				var_1_0.newVersion.versionSize = var_25_6
				var_1_0.newVersion.isContinue = 1
				var_1_0.newVersion.fileSize = var_25_4 - var_25_5
			end
		else
			local var_25_7 = tonumber(arg_25_0) / 1048576
			local var_25_8 = tonumber(arg_25_1) / 1048576

			if (var_1_0.newVersion.versionRank == nil or var_1_0.newVersion.versionRank == 0) and var_25_7 - var_25_8 < 1 then
				var_25_1()

				return
			end

			var_1_0.newVersion.versionSize = string.format("%sM", math.floor(var_25_7 * 10) / 10)
			var_1_0.newVersion.fileSize = var_25_7
		end

		require("lua/layer/versionUpdateNotice/ui")

		if var_1_0.forceUpdateInfo == nil then
			var_25_0 = versionUpdateNoticeCreate(arg_1_0, nil, var_25_3, var_1_0.newVersion)
		else
			var_25_0 = versionUpdateNoticeCreate(arg_1_0, var_25_2, var_25_3, var_1_0.newVersion)
		end

		var_1_0.progressControl:showTip("")
	end

	local function var_1_11(arg_29_0, arg_29_1)
		log.info("@@ 检查版本是否需要更新")

		local var_29_0 = sys_version.appStoreCode
		local var_29_1 = arg_29_1:getResponseString()

		loadstring(var_29_1)()

		var_1_0.newVersion = sys_version

		log.info("当前版本： ")
		log.info("==> game:", var_1_0.localVersion.game)
		log.info("==> client:", var_1_0.localVersion.client)
		log.info("==> appStoreCode:", var_29_0)
		log.info("更新版本：")
		log.info("==> game:", var_1_0.newVersion.game)
		log.info("==> client:", var_1_0.newVersion.client)
		log.info("==> appStoreCode:", var_1_0.newVersion.appStoreCode)

		game.newVersion = deepcopy(var_1_0.newVersion)

		if channelMgr.getCurrentChannel().appstore == true then
			if var_29_0 == game.newVersion.appStoreCode then
				var_1_3(versionUpdateConstant.state.over)

				return
			end

			var_1_3(versionUpdateConstant.state.check_force)
		else
			var_1_3(versionUpdateConstant.state.check_force)
		end
	end

	local function var_1_12()
		var_1_0.updateResPath = var_1_0.writablePath .. var_1_0.newVersion.game

		log.info("@@ 更新目录：", var_1_0.updateResPath)
		log.info("@@ 复制资源文件")

		if not Utils:IsDirExist(var_1_0.updateResPath) then
			local var_30_0 = var_1_0.updateResPath

			if not string.endWith(var_30_0, "/") then
				var_30_0 = var_30_0 .. "/"
			end

			Utils:CreatePath(var_30_0)
		end

		if Utils:IsDirExist(var_1_0.currentResPath) then
			tool.copyDir(var_1_0.currentResPath, var_1_0.updateResPath)
		end

		if var_1_0.updateMethod == 0 then
			var_1_0.requestFilePath = var_1_0.newVersion.game
		elseif var_1_0.updateMethod == 1 then
			var_1_0.requestFilePath = "gcmob-app64/" .. var_1_0.newVersion.game
		end

		var_1_0.needUpdate = true

		table.insert(var_1_0.downloadList, var_1_0.requestFilePath .. "/" .. versionUpdateConstant.file.res)
		var_1_3(versionUpdateConstant.state.dowloadFileList)
	end

	local function var_1_13()
		local var_31_0 = var_1_0.writablePath .. var_1_0.newVersion.game .. ".zip"
		local var_31_1 = var_1_0.writablePath .. var_1_0.newVersion.game .. "/"

		var_1_0.updateResPath = var_1_0.writablePath .. var_1_0.newVersion.game

		log.info("luxiaodong 1:", var_31_0)
		log.info("luxiaodong 3:", var_31_1)

		if not Utils:IsDirExist(var_31_1) then
			local var_31_2 = var_1_0.updateResPath

			if not string.endWith(var_31_2, "/") then
				var_31_2 = var_31_2 .. "/"
			end

			Utils:CreatePath(var_31_2)
		end

		if Utils:IsDirExist(var_1_0.currentResPath) then
			tool.copyDir(var_1_0.currentResPath, var_1_0.updateResPath)
		end

		local var_31_3 = Utils:md5File(var_31_0)
		local var_31_4 = false

		if var_1_0.zipMd5Value == var_31_3 then
			if GZipTools:zipFiles(var_31_0, var_31_1) == true then
				var_31_4 = true
			end
		else
			log.info("oh no, zip file md5 compare failed.")
			log.info("server :", var_1_0.zipMd5Value)
			log.info("client :", var_31_3)
		end

		if var_31_4 == true then
			log.info("unzip ok")

			var_1_0.needUpdate = true

			var_1_3(versionUpdateConstant.state.over)
			var_1_0.progressControl:showTip(language.get(300016))
		else
			log.info("zip解压缩包失败，转走的动更方式")

			var_1_0.isZipDownload = false
			var_1_0.isZipFialed = true

			var_1_12()
		end

		Utils:removeFile(var_31_0)
	end

	local function var_1_14(arg_32_0, arg_32_1)
		var_1_0.selectCdn = var_1_0.cdnlist[var_1_0.cdnIndex]

		log.info("cdn index :", var_1_0.cdnIndex)
		log.info("cdn url :", var_1_0.selectCdn.url)

		if var_1_0.isNeedForceUpdate == true then
			var_1_3(versionUpdateConstant.state.no)
			var_1_5()

			return
		end

		local var_32_0 = arg_32_1:getResponseString()
		local var_32_1 = loadstring(var_32_0)()
		local var_32_2 = var_1_0.selectCdn.url .. var_1_0.localVersion.game .. "/" .. var_1_0.newVersion.game .. ".zip"

		var_1_0.downloadFileSize = var_32_1.value
		var_1_0.zipMd5Value = var_32_1.md5

		local var_32_3 = var_1_0.writablePath .. var_1_0.newVersion.game .. ".zip"

		log.info("luxiaodong  url:", var_32_2)
		log.info("luxiaodong path:", var_32_3)

		if Utils:IsFileExist(var_32_3) then
			var_1_0.localFileSize = GResumeDownloadThread:getLocalFileSize(var_32_3)
		else
			var_1_0.localFileSize = 0
		end

		log.info("luxiaodong size: ", var_1_0.downloadFileSize, var_1_0.localFileSize)
		var_1_3(versionUpdateConstant.state.show_layer)
	end

	local function var_1_15()
		log.info("try_to_find_cdn")

		local var_33_0 = var_1_0.localVersion.game .. "/" .. var_1_0.newVersion.game .. ".lua"

		if var_1_0.updateMethod == 1 then
			var_33_0 = "gcmob-app64/" .. var_33_0
		end

		var_1_4(nil, var_33_0, false, var_1_14)
	end

	local function var_1_16(arg_34_0, arg_34_1, arg_34_2)
		for iter_34_0, iter_34_1 in pairs(arg_34_1) do
			if iter_34_1 == arg_34_0 then
				table.remove(arg_34_1, iter_34_0)

				break
			end
		end

		var_1_3(arg_34_2)
	end

	local function var_1_17(arg_35_0, arg_35_1)
		local var_35_0 = arg_35_1:getResponseString()

		loadstring(var_35_0)()

		var_1_0.lastFileList = data_res_info

		if not var_1_0.lastFileList or type(var_1_0.lastFileList) ~= "table" then
			log.error("[versionUpdate.downloadResFileListOver] 资源列表获取失败！！！")
			var_1_3(versionUpdateConstant.state.over)

			return
		end

		local var_35_1 = versionUpdateConstant.file.res

		platform.doLuaFile(var_35_1)

		local var_35_2 = data_res_info

		for iter_35_0, iter_35_1 in pairs(var_1_0.lastFileList) do
			local var_35_3 = false
			local var_35_4 = var_35_2[iter_35_0]
			local var_35_5 = var_1_0.updateResPath .. "/" .. iter_35_0

			if Utils:IsFileExist(var_35_5) then
				if Utils:md5File(var_35_5) ~= iter_35_1.md5 then
					var_35_3 = true
				end
			elseif not var_35_4 then
				var_35_3 = true
			elseif var_35_4.md5 ~= iter_35_1.md5 then
				var_35_3 = true
			end

			if var_35_3 then
				table.insert(var_1_0.resList, var_1_0.requestFilePath .. "/" .. iter_35_0)

				var_1_0.fileMd5[iter_35_0] = iter_35_1.md5
				var_1_0.resSize = var_1_0.resSize + iter_35_1.size
			end
		end

		log.info("@@ 更新资源文件数量：", table.getn(var_1_0.resList))
		var_1_16(arg_35_0, var_1_0.downloadList, versionUpdateConstant.state.dowloadFileList)
	end

	local function var_1_18(arg_36_0, arg_36_1)
		local var_36_0 = arg_36_0

		if var_1_0.updateMethod ~= 0 then
			local var_36_1 = string.split(var_36_0, "/")
			local var_36_2 = #var_36_1

			var_36_0 = var_36_1[var_36_2 - 1] .. "/" .. var_36_1[var_36_2]
		end

		local var_36_3 = arg_36_1:saveResponseData(var_36_0)
		local var_36_4 = string.split(arg_36_0, "/")[2]
		local var_36_5 = var_1_0.writablePath .. var_36_0

		if Utils:md5File(var_36_5) ~= var_1_0.lastFileList[var_36_4].md5 then
			var_1_3(versionUpdateConstant.state.dowloadRes)
			log.error("@@ 文件校验失败，重新下载", var_36_4)
		else
			var_1_0.hasDownloadSize = var_1_0.hasDownloadSize + var_36_3

			var_1_0.progressControl:update(var_1_0.hasDownloadSize / var_1_0.resSize * 100)
			var_1_0.progressControl:showTip(var_1_0.getTipText(var_1_0.hasDownloadSize, var_1_0.resSize, var_1_0.downloadSpeed))
			var_1_16(arg_36_0, var_1_0.resList, versionUpdateConstant.state.dowloadRes)
		end
	end

	local function var_1_19(arg_37_0)
		if conf.debug then
			game.startup()
		end

		if var_1_0.state == versionUpdateConstant.state.start then
			var_1_0:getLocalVersion()
			var_1_0.checkSupportZipDownload()

			local var_37_0 = var_1_0.getUrl(versionUpdateConstant.file.version)

			var_1_4(var_37_0, versionUpdateConstant.file.version, false, var_1_11)
		elseif var_1_0.state == versionUpdateConstant.state.check_force then
			log.info("@@isNeedForceUpdate ", var_1_0.isNeedForceUpdate)
			log.info("@@isNeedDynamicUpdate ", var_1_0.isNeedDynamicUpdate)

			var_1_0.downloadList = {}

			if tool.cmpVersion(var_1_0.localVersion.client, var_1_0.newVersion.client) then
				var_1_0.isNeedForceUpdate = true
			end

			if tool.cmpVersion(var_1_0.localVersion.game, var_1_0.newVersion.game) then
				var_1_0.isNeedDynamicUpdate = true
			end

			log.info("@@isNeedForceUpdate ", var_1_0.isNeedForceUpdate)
			log.info("@@isNeedDynamicUpdate ", var_1_0.isNeedDynamicUpdate)

			if var_1_0.isNeedForceUpdate == true or var_1_0.isNeedDynamicUpdate == true then
				var_1_0.checkZipDownload()
				var_1_3(versionUpdateConstant.state.download_update_address)

				if var_1_0.isNeedForceUpdate == false then
					var_1_0.progressControl:showTip(language.get(300012))
				end
			else
				var_1_3(versionUpdateConstant.state.over)
			end
		elseif var_1_0.state == versionUpdateConstant.state.download_update_address then
			var_1_3(versionUpdateConstant.state.no)

			local var_37_1 = var_1_0.getUrl(versionUpdateConstant.file.updateAddress)

			var_1_4(var_37_1, versionUpdateConstant.file.updateAddress, true, var_1_6)
		elseif var_1_0.state == versionUpdateConstant.state.download_cdnlist then
			local var_37_2 = var_1_0.getUrl(versionUpdateConstant.file.cdnlist)

			var_1_4(var_37_2, versionUpdateConstant.file.cdnlist, false, var_1_7)
		elseif var_1_0.state == versionUpdateConstant.state.check_dynamic then
			if var_1_0.isNeedForceUpdate == true then
				var_1_15()
			elseif var_1_0.isNeedDynamicUpdate == true then
				if var_1_0.isZipDownload == true then
					var_1_15()
				else
					var_1_12()
				end
			else
				var_1_3(versionUpdateConstant.state.over)
			end
		elseif var_1_0.state == versionUpdateConstant.state.update_percent then
			var_1_0.progressControl:update(var_1_0.downloadPercent)
			var_1_0.progressControl:showTip(language.get(300013, tostring(var_1_0.downloadPercent)))
			var_1_0.progressControl:show()
			var_1_3(versionUpdateConstant.state.no)
		elseif var_1_0.state == versionUpdateConstant.state.download_zip_over then
			var_1_0.progressControl:update(100)
			var_1_0.progressControl:showTip(language.get(300014))
			var_1_13()
		elseif var_1_0.state == versionUpdateConstant.state.show_layer then
			var_1_3(versionUpdateConstant.state.no)
			var_1_10(var_1_0.downloadFileSize, var_1_0.localFileSize)
		elseif var_1_0.state == versionUpdateConstant.state.dowloadFileList then
			if var_1_0.downloadList and table.getn(var_1_0.downloadList) > 0 then
				local var_37_3 = var_1_0.downloadList[1]

				var_1_4(nil, var_37_3, true, var_1_17)
			elseif var_1_0.isZipFialed == false then
				var_1_0.downloadFileSize = var_1_0.resSize
				var_1_0.localFileSize = 0

				var_1_3(versionUpdateConstant.state.show_layer)
			else
				var_1_3(versionUpdateConstant.state.dowloadRes)
				var_1_0.progressControl:show()
			end
		elseif var_1_0.state == versionUpdateConstant.state.dowloadRes then
			if var_1_0.resList and table.getn(var_1_0.resList) > 0 then
				local var_37_4 = var_1_0.resList[1]

				var_1_4(nil, var_37_4, true, var_1_18)
			else
				var_1_3(versionUpdateConstant.state.over)
			end
		elseif var_1_0.state == versionUpdateConstant.state.dowloading then
			if var_1_0.downloadTotle == var_1_0.downloadLastTotle and var_1_0.hasProgress then
				var_1_0.speedCountDown = var_1_0.speedCountDown - arg_37_0

				if var_1_0.speedCountDown < 0 then
					if not tolua.isnull(var_1_0.request) then
						var_1_0.request:cancel()
					end

					var_1_0.speedCountDown = versionUpdateConstant.limitime
				end
			else
				var_1_0.downloadLastTotle = var_1_0.downloadTotle
				var_1_0.speedCountDown = versionUpdateConstant.limitime
			end
		elseif var_1_0.state == versionUpdateConstant.state.over then
			log.info("@@ 资源更新结束")

			local var_37_5

			if var_1_0.needUpdate and var_1_0.newVersion then
				var_1_0:storeVersion(var_1_0.newVersion)
				log.info("更新资源路径： ", var_1_0.updateResPath)
				CCFileUtils:sharedFileUtils():addSearchPath(var_1_0.updateResPath)

				var_37_5 = var_1_0.updateResPath
			else
				log.info("更新资源路径： ", var_1_0.currentResPath)
				CCFileUtils:sharedFileUtils():addSearchPath(var_1_0.currentResPath)

				var_37_5 = var_1_0.currentResPath
			end

			if var_37_5 then
				CCUserDefault:sharedUserDefault():setStringForKey("currentResourcePath", var_37_5)
			end

			game.startup()
		end
	end

	function var_1_0.storeVersion(arg_38_0, arg_38_1)
		log.info("@@ 修改当前版本号")

		local var_38_0 = versionUpdateConstant.file.version

		package.loaded[var_38_0] = nil

		require(var_38_0)

		arg_38_1.client = sys_version.client
		arg_38_1.appStoreCode = sys_version.appStoreCode

		CCUserDefault:sharedUserDefault():setStringForKey("gameVersion", arg_38_1.game)
		CCUserDefault:sharedUserDefault():setStringForKey("clientVersion", arg_38_1.client)
		CCUserDefault:sharedUserDefault():flush()
		statMgr.update(string.format("%s#%s#%s", statMgr.state.version, arg_38_1.client, arg_38_1.game))

		local var_38_1 = string.format("[client = %s, game = %s, appStoreCode = %s]", arg_38_1.client, arg_38_1.game, arg_38_1.appStoreCode)

		log.info("@@ ", var_38_1)

		game.version = arg_38_1
	end

	function var_1_0.getLocalVersion(arg_39_0)
		log.info("获取当前版本号")

		local var_39_0 = CCUserDefault:sharedUserDefault():getStringForKey("gameVersion")
		local var_39_1 = CCUserDefault:sharedUserDefault():getStringForKey("clientVersion")

		if var_39_0 == nil or var_39_1 == nil or string.len(var_39_0) == 0 or string.len(var_39_1) == 0 then
			local var_39_2 = versionUpdateConstant.file.version

			platform.doLuaFile(var_39_2)

			arg_39_0.localVersion = sys_version

			arg_39_0:storeVersion(arg_39_0.localVersion)
		else
			arg_39_0.localVersion = {
				game = var_39_0,
				client = var_39_1
			}
		end

		game.version = arg_39_0.localVersion
		var_1_0.currentResPath = string.format("%s%s", var_1_0.writablePath, game.version.game)

		log.info("@@ 当前资源目录：", var_1_0.currentResPath)
	end

	function var_1_0.redirectAddress()
		if conf.language == "vie" then
			conf.address = "http://gcld-cdn.changicvn.com/"
		end

		if conf.language == "tha" then
			conf.address = "http://patch.gcldth.changicth.com/"
		end

		if conf.language == "tw" then
			if channelMgr.getCurrentChannel() == channels.andTwPub then
				conf.address = "http://27.105.85.79/"
			else
				conf.address = "http://211.72.254.240/"
			end

			log.info("台湾服务器新地址", conf.address)
		end

		if conf.language == "xm" then
			conf.address = "https://gcmobpatch.ujoy.com/"
		end
	end

	function var_1_0.start(arg_41_0, arg_41_1)
		var_1_0.redirectAddress()

		arg_41_0.progressControl = arg_41_1

		log.info("@@ 申请权限")
		ChannelManager:getInstance():registerListenter(channelMgr.listener)

		local function var_41_0()
			pmgr.requestPersmission(language.get(470001), function()
				var_1_0.updateSchedulerEntry = var_0_0:scheduleScriptFunc(var_1_19, 0, false)

				statMgr.update(statMgr.state.checkUpdate)
			end, function()
				var_0_1:create(arg_1_0, language.get(400043), function()
					var_41_0()
				end)
			end, PERMISSION.WRITE_EXTERNAL_STORAGE)
		end

		var_41_0()
	end

	function var_1_0.over(arg_46_0)
		if var_1_0.updateSchedulerEntry then
			var_0_0:unscheduleScriptEntry(var_1_0.updateSchedulerEntry)
		end
	end

	return var_1_0
end
