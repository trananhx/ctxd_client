local var_0_0 = {}

var_0_0.idle = 0
var_0_0.conscription = 1
var_0_0.instanceWar = 2
var_0_0.countryWar = 3
var_0_0.officialWar = 4
var_0_0.find = 5
var_0_0.move = 6
var_0_0.mineWar = 7
var_0_0.rankingWar = 8
var_0_0.cityWar = 10
var_0_0.pvpOne = 13
var_0_0.savageWar = 14
var_0_0.pvpSavage = 15
var_0_0.armyGroup = 16
var_0_0.biwu = 17
var_0_0.eventWar = 18
var_0_0.storyWar = 19
var_0_0.pvpOneInStory = 20
var_0_0.eventInStory = 21
var_0_0.prison = 22
var_0_0.escape = 23
var_0_0.sleep = 24
var_0_0.farm = 25
var_0_0.training1 = 26
var_0_0.training2 = 27
var_0_0.training3 = 28
var_0_0.training4 = 29
var_0_0.training5 = 30
var_0_0.weicheng = 50
var_0_0.kfgzWar = 1003
var_0_0.kfgzSolo = 1013
var_0_0.kfyzDongying = 1014
var_0_0.kfgzArmyGroup = 1015
var_0_0.jbyw = 2001
var_0_0.ywwar = 2002
var_0_0.ywdt = 2003

function getGeneralTipState(arg_1_0)
	if arg_1_0 == var_0_0.idle then
		return true, language.get(10301)
	elseif arg_1_0 == var_0_0.conscription then
		return true, language.get(10302)
	elseif arg_1_0 == var_0_0.instanceWar then
		return false, language.get(10303)
	elseif arg_1_0 == var_0_0.countryWar then
		return false, language.get(10304)
	elseif arg_1_0 == var_0_0.officialWar then
		return false, language.get(10305)
	elseif arg_1_0 == var_0_0.find then
		return false, language.get(10306)
	elseif arg_1_0 == var_0_0.move then
		return true, language.get(10307)
	elseif arg_1_0 == var_0_0.mineWar then
		return false, language.get(10308)
	elseif arg_1_0 == var_0_0.rankingWar then
		return false, language.get(10309)
	elseif arg_1_0 == var_0_0.cityWar then
		return false, language.get(10310)
	elseif arg_1_0 == var_0_0.pvpOne or arg_1_0 == var_0_0.pvpSavage or arg_1_0 == var_0_0.pvpOneInStory then
		return false, language.get(10311)
	elseif arg_1_0 == var_0_0.savageWar then
		return false, language.get(10321)
	elseif arg_1_0 == var_0_0.armyGroup then
		return false, language.get(10312)
	elseif arg_1_0 == var_0_0.biwu then
		return false, language.get(10313)
	elseif arg_1_0 == var_0_0.eventWar or arg_1_0 == var_0_0.eventInStory then
		return false, language.get(10314)
	elseif arg_1_0 == var_0_0.storyWar then
		if user.isYw then
			return false, language.get(10324)
		else
			return false, language.get(10315)
		end
	elseif arg_1_0 == var_0_0.prison then
		return false, language.get(10316)
	elseif arg_1_0 == var_0_0.escape then
		return false, language.get(10317)
	elseif arg_1_0 == var_0_0.sleep then
		return false, language.get(10318)
	elseif arg_1_0 == var_0_0.farm then
		return false, language.get(10319)
	elseif arg_1_0 == var_0_0.training1 then
		return false, language.get(10320)
	elseif arg_1_0 == var_0_0.training2 then
		return false, language.get(10320)
	elseif arg_1_0 == var_0_0.training3 then
		return false, language.get(10320)
	elseif arg_1_0 == var_0_0.training4 then
		return false, language.get(10320)
	elseif arg_1_0 == var_0_0.training5 then
		return false, language.get(10320)
	elseif arg_1_0 == var_0_0.kfgzWar then
		return false, language.get(10322)
	elseif arg_1_0 == var_0_0.kfgzSolo then
		return false, language.get(10311)
	elseif arg_1_0 == var_0_0.kfgzArmyGroup then
		return false, language.get(10312)
	elseif arg_1_0 == var_0_0.weicheng then
		return false, language.get(10323)
	elseif arg_1_0 == var_0_0.kfyzDongying then
		return false, language.get(10313)
	else
		return false, language.get(190031)
	end
end
