welfareDetailControl = {}

local var_0_0 = welfareDetailControl

function var_0_0.onEnter()
	log.info("welfareDetailControl enter ")
	eventManager.registerEvent("welfareValueDidChanged", welfareDetailUI.updateWelfareButtonLayer)
end

function var_0_0.onExit()
	log.info("welfareDetailControl exit")
	eventManager.unregisterEvent("welfareValueDidChanged", welfareDetailUI.updateWelfareButtonLayer)
end

function var_0_0.getWelfareDetailInfo()
	return
end
