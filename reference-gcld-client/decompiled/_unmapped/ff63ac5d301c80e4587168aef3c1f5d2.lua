taskConstant = {}
taskConstant.TASKVIEWFRAME_TAG = 1001
taskConstant.TASKLABEL_TAG = 1101
taskConstant.TASKREWARD_TAG = 1201
taskConstant.TASK_BUTTON = 2001
taskConstant.TASK_TYPE_ID_MAIN_BRANCH = 1
taskConstant.TASK_TYPE_ID_NATION = 2
taskConstant.TASK_TYPE_ID_TRY = 3
taskConstant.TASK_TYPE_ID_PROTECT = 4
taskConstant.TASK_TYPE_ID_WEICHENG = 5
taskConstant.TASK_TYPE_ID_BUILDNATION = 6
taskConstant.TASK_TYPE_ID_JUNGONG = 7
taskConstant.cityMarkTrace = {
	200006,
	200007,
	200009,
	200008,
	200023,
	200010
}
taskConstant.rewardTypeToName = {}

if conf.language == "tw" or conf.language == "kr" then
	taskConstant.rewardTypeToName[1] = language.get("500010_lxr")
	taskConstant.rewardTypeToName[2] = language.get("500011_lxr")
	taskConstant.rewardTypeToName[3] = language.get("500012_lxr")
	taskConstant.rewardTypeToName[4] = language.get("500013_lxr")
	taskConstant.rewardTypeToName[5] = language.get("500014_lxr")
	taskConstant.rewardTypeToName[19] = language.get("500015_lxr")
	taskConstant.rewardTypeToName[11] = language.get("500016_lxr")
	taskConstant.rewardTypeToName[22] = language.get("500017_lxr")
	taskConstant.rewardTypeToName[40] = language.get("500018_lxr")
	taskConstant.rewardTypeToName[42] = language.get("500019_lxr")
	taskConstant.rewardTypeToName[81] = language.get("500020_lxr")
	taskConstant.rewardTypeToName[85] = language.get("500021_lxr")
	taskConstant.rewardTypeToName[86] = language.get("500022_lxr")
	taskConstant.rewardTypeToName[87] = language.get("500023_lxr")
	taskConstant.rewardTypeToName[88] = language.get("500024_lxr")
	taskConstant.rewardTypeToName[80] = language.get("500025_lxr")
	taskConstant.rewardTypeToName[100] = language.get("500026_lxr")
	taskConstant.rewardTypeToName[24] = language.get("500027_lxr")
	taskConstant.rewardTypeToName[101] = language.get("500028_lxr")
	taskConstant.rewardTypeToName[102] = language.get("500029_lxr")
end

taskConstant.rewardTypeToId = {}
taskConstant.rewardTypeToId[1] = 1
taskConstant.rewardTypeToId[2] = 2
taskConstant.rewardTypeToId[3] = 3
taskConstant.rewardTypeToId[4] = 4
taskConstant.rewardTypeToId[5] = 6
taskConstant.rewardTypeToId[19] = 19
taskConstant.rewardTypeToId[40] = 40
taskConstant.rewardTypeToId[42] = 5
taskConstant.rewardTypeToId[81] = 24
taskConstant.rewardTypeToId[100] = 100
taskConstant.rewardTypeToId[24] = 23
taskConstant.rewardTypeToId[102] = 41
