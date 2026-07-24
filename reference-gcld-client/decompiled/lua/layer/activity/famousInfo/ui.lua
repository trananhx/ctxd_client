local var_0_0 = class("FamousInfo", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.cityId = arg_2_1
	arg_2_0.control = require("lua/layer/activity/famousInfo/control").new(arg_2_0)

	arg_2_0:registerScriptTouchHandler(handler(arg_2_0.control, arg_2_0.control.onTouch), false, true)
	arg_2_0:setTouchEnabled(true)
	arg_2_0.control:getPanelInfo()
	smgr.getLayer("topLayer"):addChild(arg_2_0, 10001)
end

function var_0_0.init(arg_3_0)
	local var_3_0 = arg_3_0.control.data.playerEvent

	log.info("PE", tool.tableToJson(var_3_0))
	arg_3_0:removeAllChildrenWithCleanup(true)

	arg_3_0.uiTable = autoUI.initUI(arg_3_0, require("lua/layer/activity/famousInfo/uidata"))

	arg_3_0.uiTable.general:setDisplayFrame(CCSprite:create("res/ui/common/halfPic/halfPic_" .. var_3_0.pic .. ".png"):displayFrame())

	if var_3_0.isAdvanced then
		arg_3_0.uiTable.guoshi:setVisible(true)
	else
		arg_3_0.uiTable.guoshi:setVisible(false)
	end

	local var_3_1 = {
		[11] = {
			pic = "res/ui/activity/famous/icon_jb.jpg",
			text = language.get(310001)
		},
		[31] = {
			pic = "res/ui/activity/famous/gjms_icon_bm.jpg",
			text = language.get(131087)
		},
		[32] = {
			pic = "res/ui/activity/famous/gjms_icon_mj.jpg",
			text = language.get(131088)
		},
		[33] = {
			pic = "res/ui/activity/famous/gjms_icon_sh.jpg",
			text = language.get(131089)
		}
	}
	local var_3_2 = {
		language.get(310002),
		language.get(310003),
		language.get(310004),
		language.get(310005),
		language.get(10107),
		[21] = language.get(10106),
		[81] = language.get(131092),
		[84] = language.get(131093),
		[85] = language.get(131094),
		[116] = language.get(310020),
		[126] = language.get(111043)
	}

	arg_3_0.uiTable.plot1:setString(var_3_0.plot1)
	arg_3_0.uiTable.plot2:setString(var_3_0.plot2)

	local var_3_3 = var_3_0.cost[1]

	arg_3_0.uiTable.needItemPic1:setDisplayFrame(CCSprite:create(var_3_1[var_3_3.costType].pic):displayFrame())
	arg_3_0.uiTable.cost1:setString(language.get(131090, var_3_1[var_3_3.costType].text, var_3_3.costNum))

	local var_3_4 = var_3_0.cost2[1]

	arg_3_0.uiTable.needItemPic2:setDisplayFrame(CCSprite:create(var_3_1[var_3_4.costType].pic):displayFrame())
	arg_3_0.uiTable.cost2:setString(language.get(131097, var_3_1[var_3_4.costType].text, var_3_4.costNum))

	local var_3_5 = var_3_0.gain
	local var_3_6 = language.get(131091, var_3_5[1].gainNum, var_3_2[var_3_5[1].gainType], var_3_5[2].gainNum, var_3_2[var_3_5[2].gainType])

	arg_3_0.uiTable.reward1:setString(var_3_6)

	local var_3_7 = var_3_0.gain2
	local var_3_8 = language.get(131091, var_3_7[1].gainNum, var_3_2[var_3_7[1].gainType], var_3_7[2].gainNum, var_3_2[var_3_7[2].gainType])

	arg_3_0.uiTable.reward2:setString(var_3_8)

	if var_3_0.isAdvanced then
		arg_3_0.uiTable.reward1:setColor(ccc3(255, 0, 0))
		arg_3_0.uiTable.reward2:setColor(ccc3(255, 0, 0))
	end

	arg_3_0.uiTable.button1:registerScriptTapHandler(function()
		arg_3_0.control:dealPlayerEvent(1)
	end)
	arg_3_0.uiTable.button2:registerScriptTapHandler(function()
		arg_3_0.control:dealPlayerEvent(2)
	end)
end

return var_0_0
