amgr = amgr or {}

local var_0_0 = SimpleAudioEngine:sharedEngine()

enumAudioFile = {
	battle_wujiang_didang = "res/audio/battle_wujiang_didang.mp3",
	wujiang_zunming = "res/audio/wujiang_zunming.mp3",
	battle_wujiang_skill = "res/audio/battle_wujiang_skill.mp3",
	ui_award_popup = "res/audio/ui_tanchu.mp3",
	ui_guide = "res/audio/ui_zhiyin.mp3",
	ui_get_award = "res/audio/ui_get.mp3",
	battle_result_lose = "res/audio/battle_lose.mp3",
	ui_minju_jiasu = "res/audio/ui_minju_jiasu.mp3",
	ui_click_award = "res/audio/ui_click_jiangli.mp3",
	ui_dialog_close = "res/audio/ui_duihua_close.mp3",
	ui_jisi = "res/audio/ui_jisi.mp3",
	bg_world = "res/audio/loading.mp3",
	ui_task_finish = "res/audio/ui_renwu_wancheng.mp3",
	bg_main_city = "res/audio/main_city03.mp3",
	ui_minju_shengji = "res/audio/ui_minju_shengji.mp3",
	ui_levelup = "res/audio/ui_click_start.mp3",
	ui_click_common = "res/audio/ui_click_tongyong.mp3",
	ui_click_error = "res/audio/ui_click_cuowu.mp3",
	ui_dialog_open = "res/audio/ui_duihua_open.mp3",
	battle_tactics_tuji = "res/audio/battle_tactics.wav",
	battle_result_win = "res/audio/battle_win.mp3",
	wujiang_shi = "res/audio/wujiang_shi.mp3",
	ui_click_start = "res/audio/ui_click_start.mp3",
	bg_fuben = "res/audio/battle_1.mp3",
	bg_fight = "res/audio/battle_2.mp3",
	battle_tactics_gongji = "res/audio/battle_tactics.wav",
	battle_tactics_fangshou = "res/audio/battle_tactics.wav",
	battle_effect_fight = "res/audio/battle_jiaofeng.mp3"
}

function amgr.init()
	amgr.lastMusic = nil
	amgr.curMusic = nil
	amgr.canPlayeMusic = true
	amgr.canPlayeEffect = true

	CCMenuItem:setAudioScriptHandler(amgr.commonButtonEffect)
	CCControlButton:setAudioScriptHandler(amgr.commonButtonEffect)

	local var_1_0 = CCUserDefault:sharedUserDefault():getIntegerForKey("SETTTING_NOT_SAVED")
	local var_1_1 = 1
	local var_1_2 = 1
	local var_1_3 = 1
	local var_1_4 = 1

	if var_1_0 == 1 then
		var_1_1 = CCUserDefault:sharedUserDefault():getDoubleForKey("EFFECT_VOLUME")
		var_1_2 = CCUserDefault:sharedUserDefault():getDoubleForKey("MUSIC_VOLUME")
		var_1_3 = CCUserDefault:sharedUserDefault():getIntegerForKey("EFFECT_MUTE")
		var_1_4 = CCUserDefault:sharedUserDefault():getIntegerForKey("MUSIC_MUTE")
	end

	amgr.setEffectsVolume(var_1_1)
	amgr.setMusicVolume(var_1_2)

	if var_1_3 ~= 1 then
		amgr.setEffectEnable(false)
	else
		amgr.setEffectEnable(true)
	end

	if var_1_4 ~= 1 then
		amgr.setMusicEnable(false)
	else
		amgr.setMusicEnable(true)
	end

	log.info("背景音量: ", amgr.getMusicVolume())
	log.info("特效音量: ", amgr.getEffectVolume())
end

function amgr.commonButtonEffect()
	amgr.playEffect(enumAudioFile.ui_click_common)
end

function amgr.setMusicEnable(arg_3_0)
	arg_3_0 = arg_3_0 or false

	log.info(arg_3_0, amgr.curMusic)

	amgr.canPlayeMusic = arg_3_0

	if arg_3_0 == false then
		amgr.stopMusic(true)
	elseif amgr.curMusic then
		amgr.playMusic(amgr.curMusic, true)
	end
end

function amgr.setEffectEnable(arg_4_0)
	arg_4_0 = arg_4_0 or false
	amgr.canPlayeEffect = arg_4_0
end

function amgr.pauseMusic()
	var_0_0:pauseBackgroundMusic()
end

function amgr.resumeMusic()
	var_0_0:resumeBackgroundMusic()
end

function amgr.getMusicVolume()
	return var_0_0:getBackgroundMusicVolume()
end

function amgr.getEffectVolume()
	return var_0_0:getEffectsVolume()
end

function amgr.setMusicVolume(arg_9_0)
	var_0_0:setBackgroundMusicVolume(arg_9_0)
end

function amgr.setEffectsVolume(arg_10_0)
	var_0_0:setEffectsVolume(arg_10_0)
end

function amgr.playMusic(arg_11_0, arg_11_1)
	if arg_11_0 == nil or arg_11_0 == amgr.curMusic and amgr.isMusicPlaying() then
		return
	end

	amgr.lastMusic = amgr.curMusic
	amgr.curMusic = arg_11_0

	if not amgr.canPlayeMusic then
		return
	end

	local var_11_0 = false

	if arg_11_1 ~= nil then
		var_11_0 = arg_11_1
	end

	if amgr.isMusicPlaying() then
		amgr.stopMusic(true)
	end

	var_0_0:playBackgroundMusic(amgr.curMusic, var_11_0)
end

function amgr.stopMusic(arg_12_0)
	local var_12_0 = false

	if arg_12_0 ~= nil then
		var_12_0 = arg_12_0
	end

	var_0_0:stopBackgroundMusic(var_12_0)
end

function amgr.isMusicPlaying()
	return var_0_0:isBackgroundMusicPlaying()
end

function amgr.playEffect(arg_14_0, arg_14_1, arg_14_2)
	if conf.language == "kr" and (arg_14_0 == enumAudioFile.wujiang_shi or arg_14_0 == enumAudioFile.wujiang_zunming) then
		return
	end

	if not amgr.canPlayeEffect then
		return
	end

	if not arg_14_0 then
		return
	end

	local var_14_0 = false

	if arg_14_2 ~= nil then
		var_14_0 = arg_14_2
	end

	if var_14_0 then
		amgr.stopAllEffect()
	end

	local var_14_1 = false

	if arg_14_1 ~= nil then
		var_14_1 = arg_14_1
	end

	return var_0_0:playEffect(arg_14_0, var_14_1)
end

function amgr.stopEffect(arg_15_0)
	var_0_0:stopEffect(arg_15_0)
end

function amgr.stopAllEffect()
	var_0_0:stopAllEffects()
end
