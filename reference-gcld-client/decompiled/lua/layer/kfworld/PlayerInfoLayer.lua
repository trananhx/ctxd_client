local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.openTimeX = 40
else
	var_0_0.openTimeX = 0
end

local var_0_1 = class("KfPlayerInfoLayer", function()
	return createBaseLayer()
end)

function var_0_1.ctor(arg_2_0, arg_2_1)
	arg_2_0.world = arg_2_1
	arg_2_0.onEnter = handler(arg_2_0, arg_2_0.onEnter)
	arg_2_0.onExit = handler(arg_2_0, arg_2_0.onExit)
end

function var_0_1.handlerGetWorldMapAction(arg_3_0, arg_3_1)
	arg_3_0.data = arg_3_1.data
	arg_3_0.time = arg_3_0.data.cd

	arg_3_0:initExpand(false)
end

function var_0_1.initExpand(arg_4_0, arg_4_1)
	arg_4_0.isOpen = arg_4_1

	arg_4_0:removeAllChildrenWithCleanup(true)

	if arg_4_0.isOpen == true then
		playerInfoUI.show()
		smgr.hideNotice()

		arg_4_0.uiTable = autoUI.initUI(arg_4_0, arg_4_0:getUiDataExpand())
	else
		if playerInfoUI and playerInfoUI.uiTable and playerInfoUI.uiTable.layer and not tolua.isnull(playerInfoUI.uiTable.layer) then
			playerInfoUI.uiTable.layer:removeFromParentAndCleanup(true)

			playerInfoUI.uiTable.layer = nil
		end

		arg_4_0.uiTable = autoUI.initUI(arg_4_0, arg_4_0:getUiData())

		arg_4_0.uiTable.expandBtn:registerScriptTapHandler(function()
			eventManager.dispatchEvent("kfWorldExpandClick", true)
		end)
	end

	local var_4_0 = 0
	local var_4_1 = 0

	for iter_4_0, iter_4_1 in pairs(arg_4_0.data.city) do
		if iter_4_1.force == 1 then
			var_4_0 = var_4_0 + 1
		elseif iter_4_1.force == 2 then
			var_4_1 = var_4_1 + 1
		end
	end

	arg_4_0.uiTable.rightCityNum:setString(tostring(var_4_0 - 2))
	arg_4_0.uiTable.leftCityNum:setString(tostring(var_4_1 - 2))
	arg_4_0.uiTable.timeLabel:setString("")

	local var_4_2 = createTimerLabel(arg_4_0.time, "@M:@S", "Thonburi", 24, nil, nil, nil, ccc3(255, 0, 0))

	arg_4_0.uiTable.timeLabel:addChild(var_4_2)

	if arg_4_0.uiTable.rightServerName and arg_4_0.data.servers and arg_4_0.data.servers[2] and arg_4_0.data.nationNames and arg_4_0.data.nationNames[2] then
		arg_4_0.uiTable.rightServerName:setString(arg_4_0.data.servers[2].serverName .. " " .. arg_4_0.data.nationNames[2].nationName)
	end

	if arg_4_0.uiTable.leftServerName and arg_4_0.data.servers and arg_4_0.data.servers[1] and arg_4_0.data.nationNames and arg_4_0.data.nationNames[1] then
		arg_4_0.uiTable.leftServerName:setString(arg_4_0.data.servers[1].serverName .. " " .. arg_4_0.data.nationNames[1].nationName)
	end
end

function var_0_1.changeCity(arg_6_0, arg_6_1)
	if not arg_6_0.data then
		return
	end

	local var_6_0 = arg_6_1.id
	local var_6_1 = 0
	local var_6_2 = 0

	for iter_6_0, iter_6_1 in pairs(arg_6_0.data.city) do
		if iter_6_1.id == var_6_0 then
			iter_6_1.force = arg_6_1.force
		end

		if iter_6_1.force == 1 then
			var_6_1 = var_6_1 + 1
		elseif iter_6_1.force == 2 then
			var_6_2 = var_6_2 + 1
		end
	end

	arg_6_0.uiTable.rightCityNum:setString(tostring(var_6_1 - 2))
	arg_6_0.uiTable.leftCityNum:setString(tostring(var_6_2 - 2))
end

function var_0_1.getUiData(arg_7_0)
	local var_7_0 = {}

	local function var_7_1(arg_8_0, arg_8_1)
		arg_8_0[#arg_8_0 + 1] = arg_8_1

		return arg_8_1
	end

	var_7_0.background = {
		left = 0,
		type = "pic",
		top = 0,
		pic = "res/ui/kfworld/kfgz_jxjd_bg_ss.png",
		children = {}
	}

	var_7_1(var_7_0.background.children, {
		type = "button",
		buttons = {
			{
				pic2 = "res/ui/kfworld/kfgz_jxjd_btn_open_c.png",
				name = "expandBtn",
				pic1 = "res/ui/kfworld/kfgz_jxjd_btn_open_a.png",
				y = 56.5,
				x = 35.5
			}
		}
	})
	var_7_1(var_7_0.background.children, {
		x = 120,
		y = 56.5,
		pic = "res/ui/kfworld/kfgz_gzjs_icon_red.png",
		type = "pic"
	})
	var_7_1(var_7_0.background.children, {
		x = 325,
		y = 56.5,
		pic = "res/ui/kfworld/kfgz_gzjs_icon_blue.png",
		type = "pic"
	})
	var_7_1(var_7_0.background.children, {
		width = 29,
		height = 36,
		name = "rightCityNum",
		type = "atlas",
		pic = "res/ui/kfworld/kfgz_jxjd_zk_nb.png",
		text = "10",
		y = 56.5,
		startChar = 48,
		x = 190
	})
	var_7_1(var_7_0.background.children, {
		x = 227,
		y = 56.5,
		pic = "res/ui/kfworld/kfgz_jxjd_zk_pzh.png",
		type = "pic"
	})
	var_7_1(var_7_0.background.children, {
		width = 29,
		height = 36,
		name = "leftCityNum",
		type = "atlas",
		pic = "res/ui/kfworld/kfgz_jxjd_zk_nb.png",
		text = "10",
		y = 56.5,
		startChar = 48,
		x = 260
	})
	var_7_1(var_7_0.background.children, {
		fontSize = 24,
		name = "timeLabel",
		text = "00:00",
		type = "label",
		y = 56.5,
		x = 420,
		color = ccc3(255, 0, 0)
	})

	return var_7_0
end

function var_0_1.getUiDataExpand(arg_9_0)
	local var_9_0 = {}

	local function var_9_1(arg_10_0, arg_10_1)
		arg_10_0[#arg_10_0 + 1] = arg_10_1

		return arg_10_1
	end

	var_9_0.background = {
		xcenter = 0,
		type = "pic",
		top = 70,
		pic = "res/ui/kfworld/kfgz_jxjd_qk_bg.png",
		children = {}
	}

	var_9_1(var_9_0.background.children, {
		xcenter = -100,
		y = 68,
		pic = "res/ui/kfworld/kfgz_gzjs_icon_red.png",
		type = "pic"
	})
	var_9_1(var_9_0.background.children, {
		xcenter = 100,
		y = 68,
		pic = "res/ui/kfworld/kfgz_gzjs_icon_blue.png",
		type = "pic"
	})
	var_9_1(var_9_0.background.children, {
		xcenter = 0,
		y = 68,
		pic = "res/ui/kfworld/kfgz_jxjd_zk_pzh.png",
		type = "pic"
	})
	var_9_1(var_9_0.background.children, {
		xcenter = -40,
		height = 36,
		name = "rightCityNum",
		type = "atlas",
		pic = "res/ui/kfworld/kfgz_jxjd_zk_nb.png",
		text = "10",
		y = 68,
		startChar = 48,
		width = 29
	})
	var_9_1(var_9_0.background.children, {
		xcenter = 40,
		height = 36,
		name = "leftCityNum",
		type = "atlas",
		pic = "res/ui/kfworld/kfgz_jxjd_zk_nb.png",
		text = "10",
		y = 68,
		startChar = 48,
		width = 29
	})
	var_9_1(var_9_0.background.children, {
		xcenter = -200,
		name = "rightServerName",
		type = "label",
		fontSize = 24,
		y = 68,
		strokeSize = 2,
		text = language.get(430002),
		color = ccc3(235, 209, 167),
		strokeColor = ccc3(22, 18, 13)
	})
	var_9_1(var_9_0.background.children, {
		xcenter = 200,
		name = "leftServerName",
		type = "label",
		fontSize = 22,
		y = 68,
		strokeSize = 2,
		text = language.get(430002),
		color = ccc3(235, 209, 167),
		strokeColor = ccc3(22, 18, 13)
	})
	var_9_1(var_9_0.background.children, {
		fontSize = 24,
		type = "label",
		x = 220,
		strokeSize = 2,
		y = 26,
		text = language.get(430001),
		color = ccc3(235, 209, 167),
		strokeColor = ccc3(22, 18, 13)
	})
	var_9_1(var_9_0.background.children, {
		fontSize = 24,
		name = "timeLabel",
		text = "00:00",
		type = "label",
		y = 26,
		color = ccc3(255, 0, 0),
		x = 320 + var_0_0.openTimeX
	})

	return var_9_0
end

function var_0_1.update(arg_11_0, arg_11_1)
	if arg_11_0.time then
		arg_11_0.time = arg_11_0.time - arg_11_1 * 1000
		kfworld.leftTime = arg_11_0.time
	end
end

function var_0_1.onEnter(arg_12_0)
	function arg_12_0.expandEventRef(arg_13_0)
		arg_12_0:initExpand(arg_13_0)
	end

	eventManager.registerEvent("kfWorldExpandClick", arg_12_0.expandEventRef)

	function arg_12_0.updateRef(arg_14_0)
		arg_12_0:update(arg_14_0)
	end

	arg_12_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(arg_12_0.updateRef, 0.1, false)
end

function var_0_1.onExit(arg_15_0)
	eventManager.unregisterEvent("kfWorldExpandClick", arg_15_0.expandEventRef)

	if arg_15_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_15_0.updateSchedulerEntry)
	end
end

return var_0_1
