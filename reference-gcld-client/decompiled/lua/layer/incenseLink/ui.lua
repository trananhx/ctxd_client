incenseLink = {}

tool.requireRes("incenseLink")
require("lua/component/timerLabel")

incenseLink.ui = {}
incenseLink.ui.resourceType = 1

function incenseLink.ui.onTouch(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0 ~= CCTOUCHBEGAN or tool.checkIfTouch(incenseLink.ui.table.bg, arg_1_1, arg_1_2) then
		-- block empty
	else
		smgr.getLayer("topLayer"):removeChild(incenseLink.ui.table.layer, true)
	end

	return false
end

function incenseLink.ui.init()
	local var_2_0 = visibleSize.width + 150
	local var_2_1 = 100

	incenseLink.ui.table.layer:setPosition(ccp(var_2_0, var_2_1))

	local var_2_2 = CCMoveTo:create(1, ccp(visibleSize.width - 155, var_2_1))

	incenseLink.ui.table.layer:runAction(var_2_2)
	incenseLink.ui.table.btn_link:registerScriptTapHandler(incenseLink.control.click_incenseLink)

	local var_2_3 = {
		10101,
		10102,
		10103,
		10104,
		10106
	}
	local var_2_4 = var_2_3[incenseLink.ui.resourceType]

	if var_2_4 == nil then
		var_2_4 = var_2_3[1]
	end

	incenseLink.ui.table.buzu:setString(language.get(70006, language.get(var_2_4)))
end

function incenseLink.ui.show(arg_3_0)
	local var_3_0 = createBaseLayer()

	incenseLink.ui.table = autoUI.initUI(var_3_0, getIncenseLinkData())
	incenseLink.ui.table.layer = var_3_0

	var_3_0:registerScriptTouchHandler(incenseLink.ui.onTouch, false, false)
	var_3_0:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_3_0, 1000002)
	var_3_0:setVisible(true)

	incenseLink.ui.resourceType = arg_3_0

	incenseLink.ui.init()
end
