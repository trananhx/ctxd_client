local var_0_0 = require("lua/common/json")

voice_upload_url = "http://voice.gc.aoshitang.com/root/voice/write.action"
voice_download_url = "http://voice.gc.aoshitang.com/root/voice/read.action"
vmgr = vmgr or {}
vmgr.soundId = nil
vmgr.playFile = nil
vmgr.lastVolume = 0

function vmgr.upload(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0(arg_2_0)
		local var_2_0 = arg_2_0.name == "completed"
		local var_2_1 = arg_2_0.request

		if not var_2_1 then
			log.error("@@ no request ")

			return
		end

		if not var_2_0 then
			log.error("@@ not completed")

			return
		end

		local var_2_2 = var_2_1:getResponseStatusCode()

		if var_2_2 ~= 200 then
			log.error("@@ status error : %s", var_2_2)

			return
		end

		log.info("@@ upload ok !!!")

		local var_2_3 = var_2_1:getResponseString()
		local var_2_4 = var_0_0.decode(var_2_3)

		if var_2_4.state == 1 then
			arg_1_2(var_2_4.data.id, arg_1_0)
		else
			log.info(var_2_3)
		end
	end

	local var_1_1 = user.serverId or 0
	local var_1_2 = string.format("game=gcld&serverName=gcld&serverId=%s&playerId=%s&time=%s&platform=%s", var_1_1, user.player.id, arg_1_0, platform.getFlagSimple())

	VoiceManager:getInstance():upload(voice_upload_url, arg_1_1, var_1_2, var_1_0)
end

function vmgr.download(arg_3_0, arg_3_1, arg_3_2)
	vmgr.stop()

	local function var_3_0(arg_4_0)
		log.info("download ", arg_4_0)

		local var_4_0 = var_0_0.decode(arg_4_0)

		if var_4_0.state == 1 then
			if arg_3_2 then
				arg_3_2(var_4_0.data.time)
			end

			vmgr.play(arg_3_1)
		end
	end

	local var_3_1 = string.format("id=%s&platform=%s", arg_3_0, platform.getFlagSimple())

	VoiceManager:getInstance():download(voice_download_url, arg_3_1, var_3_1, var_3_0)
end

function vmgr.stop()
	if vmgr.soundId then
		SimpleAudioEngine:sharedEngine():stopEffect(vmgr.soundId)

		vmgr.soundId = nil
	end

	if vmgr.playFile then
		SimpleAudioEngine:sharedEngine():unloadEffect(vmgr.playFile)

		vmgr.playFile = nil
	end

	if vmgr.lastVolume then
		SimpleAudioEngine:sharedEngine():setEffectsVolume(vmgr.lastVolume)
	end
end

function vmgr.play(arg_6_0)
	log.info("@@ 播放声音文件：", arg_6_0)
	vmgr.stop()

	vmgr.lastVolume = SimpleAudioEngine:sharedEngine():getEffectsVolume()

	if vmgr.lastVolume and vmgr.lastVolume < 1 then
		SimpleAudioEngine:sharedEngine():setEffectsVolume(1)
	end

	SimpleAudioEngine:sharedEngine():playEffect(arg_6_0, false)

	vmgr.playFile = arg_6_0
end
