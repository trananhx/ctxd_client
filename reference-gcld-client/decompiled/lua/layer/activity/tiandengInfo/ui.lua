local var_0_0 = class("TianDengInfo", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.cityId = arg_2_1
	arg_2_0.control = require("lua/layer/activity/tiandengInfo/control").new(arg_2_0)

	arg_2_0:registerScriptTouchHandler(handler(arg_2_0.control, arg_2_0.control.onTouch), false, true)
	arg_2_0:setTouchEnabled(true)
	arg_2_0.control:getPanelInfo()
	smgr.getLayer("topLayer"):addChild(arg_2_0, 10001)
end

function var_0_0.init(arg_3_0)
	local var_3_0 = arg_3_0.control.data.playerEvent

	log.info("PE", tool.tableToJson(var_3_0))
	arg_3_0:removeAllChildrenWithCleanup(true)

	arg_3_0.uiTable = autoUI.initUI(arg_3_0, require("lua/layer/activity/tiandengInfo/uidata"))

	arg_3_0.uiTable.general:setDisplayFrame(CCSprite:create("res/ui/common/halfPic/halfPic_" .. var_3_0.pic .. ".png"):displayFrame())

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
		[1000] = language.get(135909)
	}

	arg_3_0.uiTable.plot1:setString(string.gsub(var_3_0.plot1, "(%(.*%))", ""))
	arg_3_0.uiTable.plot2:setString(string.gsub(var_3_0.plot2, "(%(.*%))", ""))

	local var_3_3 = var_3_0.cost[1]

	if var_3_3 then
		arg_3_0.uiTable.cost1:setString(language.get(131090, var_3_1[var_3_3.costType].text, var_3_3.costNum))
	else
		arg_3_0.uiTable.cost1:setString("")
	end

	local var_3_4 = var_3_0.cost2[1]

	if var_3_4 then
		arg_3_0.uiTable.cost2:setString(language.get("200122_zww", var_3_4.costNum))
	else
		arg_3_0.uiTable.cost2:setString("")
	end

	local var_3_5 = var_3_0.gain
	local var_3_6 = ""

	for iter_3_0, iter_3_1 in pairs(var_3_5) do
		var_3_6 = var_3_6 .. var_3_2[iter_3_1.gainType] .. "X" .. iter_3_1.gainNum .. " "
	end

	local var_3_7 = language.get(135908, var_3_6)

	arg_3_0.uiTable.reward1:setString(var_3_7)

	local var_3_8 = var_3_0.gain2
	local var_3_9 = ""

	for iter_3_2, iter_3_3 in pairs(var_3_8) do
		var_3_9 = var_3_9 .. var_3_2[iter_3_3.gainType] .. "X" .. iter_3_3.gainNum .. " "
	end

	local var_3_10 = language.get(135908, var_3_9)

	arg_3_0.uiTable.reward2:setString(var_3_10)
	arg_3_0.uiTable.button1:registerScriptTapHandler(function()
		arg_3_0.control:dealPlayerEvent(1)
	end)
	arg_3_0.uiTable.button2:registerScriptTapHandler(function()
		arg_3_0.control:dealPlayerEvent(2)
	end)
end

return var_0_0
