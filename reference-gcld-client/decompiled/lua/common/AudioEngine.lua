local var_0_0 = {}
local var_0_1 = SimpleAudioEngine:sharedEngine()

function var_0_0.stopAllEffects()
	var_0_1:stopAllEffects()
end

function var_0_0.getMusicVolume()
	return var_0_1:getBackgroundMusicVolume()
end

function var_0_0.isMusicPlaying()
	return var_0_1:isBackgroundMusicPlaying()
end

function var_0_0.getEffectsVolume()
	return var_0_1:getEffectsVolume()
end

function var_0_0.setMusicVolume(arg_5_0)
	var_0_1:setBackgroundMusicVolume(arg_5_0)
end

function var_0_0.stopEffect(arg_6_0)
	var_0_1:stopEffect(arg_6_0)
end

function var_0_0.stopMusic(arg_7_0)
	local var_7_0 = false

	if arg_7_0 ~= nil then
		var_7_0 = arg_7_0
	end

	var_0_1:stopBackgroundMusic(var_7_0)
end

function var_0_0.playMusic(arg_8_0, arg_8_1)
	local var_8_0 = false

	if arg_8_1 ~= nil then
		var_8_0 = arg_8_1
	end

	var_0_1:playBackgroundMusic(arg_8_0, var_8_0)
end

function var_0_0.pauseAllEffects()
	var_0_1:pauseAllEffects()
end

function var_0_0.preloadMusic(arg_10_0)
	var_0_1:preloadBackgroundMusic(arg_10_0)
end

function var_0_0.resumeMusic()
	var_0_1:resumeBackgroundMusic()
end

function var_0_0.playEffect(arg_12_0, arg_12_1)
	local var_12_0 = false

	if arg_12_1 ~= nil then
		var_12_0 = arg_12_1
	end

	return var_0_1:playEffect(arg_12_0, var_12_0)
end

function var_0_0.rewindMusic()
	var_0_1:rewindBackgroundMusic()
end

function var_0_0.willPlayMusic()
	return var_0_1:willPlayBackgroundMusic()
end

function var_0_0.unloadEffect(arg_15_0)
	var_0_1:unloadEffect(arg_15_0)
end

function var_0_0.preloadEffect(arg_16_0)
	var_0_1:preloadEffect(arg_16_0)
end

function var_0_0.setEffectsVolume(arg_17_0)
	var_0_1:setEffectsVolume(arg_17_0)
end

function var_0_0.pauseEffect(arg_18_0)
	var_0_1:pauseEffect(arg_18_0)
end

function var_0_0.resumeAllEffects(arg_19_0)
	var_0_1:resumeAllEffects()
end

function var_0_0.pauseMusic()
	var_0_1:pauseBackgroundMusic()
end

function var_0_0.resumeEffect(arg_21_0)
	var_0_1:resumeEffect(arg_21_0)
end

local var_0_2 = "AudioEngine"
local var_0_3 = {}
local var_0_4 = {
	__index = var_0_0,
	__newindex = function(arg_22_0, arg_22_1, arg_22_2)
		log.debug("attemp to update a read-only table")
	end
}

setmetatable(var_0_3, var_0_4)

_G[var_0_2] = var_0_3
package.loaded[var_0_2] = var_0_3
