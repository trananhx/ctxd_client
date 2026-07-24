tool.requireRes("equipment/store")
require("lua/component/timerLabel")
require("lua/common/tool")
require("lua/ui/uiutil")

local var_0_0 = {}

var_0_0.uiTable = nil
var_0_0.control = require("lua/layer/equipment/store/sample/storeControl")

function var_0_0.refreshHandler()
	var_0_0.control.storeRefreshItem()
end

function var_0_0.show()
	log.info("storeView.storeLayer", var_0_0.storeLayer)
	rmgr.loadTable(storeConstant.RES)

	var_0_0.config = require("lua/layer/equipment/store/sample/storeConf")

	uiutil.initUI(var_0_0, var_0_0.config.storeLayer)

	var_0_0.control.view = var_0_0

	var_0_0.control.storeGetItems(var_0_0)
	var_0_0.storeLayer:setTouchEnabled(true)
	var_0_0.storeLayer:registerScriptTouchHandler(var_0_0.onTouch)
	log.info("storeView.equipmentRefreshItem", var_0_0.refreshHandler, var_0_0.refreshButton)
	var_0_0.equipmentRefreshItem:registerScriptTapHandler(var_0_0.refreshHandler)

	return var_0_0.storeLayer
end

function var_0_0.onTouch()
	return
end

return var_0_0
