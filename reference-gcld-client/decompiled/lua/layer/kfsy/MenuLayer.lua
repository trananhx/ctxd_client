require("lua/layer/general/ui")
require("lua/layer/kfsy/buyAndRule/ui")
require("lua/manager/kfConnectManager")

local var_0_0 = class("KfsyMenuLayer", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.uiTable = autoUI.initUI(arg_2_0, arg_2_0:getUiData())

	arg_2_0.uiTable.mainCity:registerScriptTapHandler(function()
		pcall(kfcmgr.disconnectFromServer)
		smgr.changeScene(SCENE_MAIN_CITY)
	end)
	arg_2_0.uiTable.rule:registerScriptTapHandler(function()
		buyAndRuleUI.show(1)
	end)
end

function var_0_0.getUiData(arg_5_0)
	local var_5_0 = {}

	local function var_5_1(arg_6_0, arg_6_1)
		arg_6_0[#arg_6_0 + 1] = arg_6_1

		return arg_6_1
	end

	var_5_0.background = {
		down = 0,
		type = "pic",
		pic = "res/ui/mainUI/footer_r_view.png",
		right = 0,
		children = {}
	}

	var_5_1(var_5_0.background.children, {
		z = -1,
		name = "openbar",
		x = 370,
		type = "pic",
		y = 23,
		pic = "res/ui/mainUI/footer_r_open_view.png"
	})
	var_5_1(var_5_0.background.children, {
		name = "menu",
		type = "button",
		buttons = {
			{
				pic2 = "res/ui/kfworld/kfgz_view_zc_btn_c.png",
				name = "mainCity",
				pic1 = "res/ui/kfworld/kfgz_view_zc_btn_a.png",
				y = 49,
				x = 94.5
			},
			{
				pic2 = "res/ui/kfsy/kfsy_btngzh.png",
				pic3 = "res/ui/kfsy/kfsy_btngz.png",
				pic1 = "res/ui/kfsy/kfsy_btngz.png",
				y = 45,
				name = "rule",
				x = -15
			}
		}
	})

	return var_5_0
end

function var_0_0.onEnter(arg_7_0)
	return
end

function var_0_0.onExit(arg_8_0)
	return
end

return var_0_0
