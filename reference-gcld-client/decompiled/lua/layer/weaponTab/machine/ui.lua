machine = {}

tool.requireRes("weaponTab/machine")

machine.ui = {}
machine.ui.table = {}

function machine.ui.onTouch(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0 == CCTOUCHBEGAN then
		-- block empty
	elseif arg_1_0 == CCTOUCHENDED then
		-- block empty
	end

	return true
end

local var_0_0 = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(1, 1),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			name = "tipMsg",
			height = 0,
			type = "label",
			width = 300,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}

function machine.ui.showTips(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	arg_2_3 = arg_2_3 or ""

	local var_2_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_2_0:registerScriptTouchHandler(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == CCTOUCHBEGAN then
			return true
		elseif arg_3_0 == CCTOUCHMOVED then
			return true
		elseif arg_3_0 == CCTOUCHENDED then
			pcall(var_2_0.removeFromParentAndCleanup, var_2_0, true)

			if machine.ui.view and machine.ui.view.widgets.tipFrame and not tolua.isnull(machine.ui.view.widgets.tipFrame) then
				machine.ui.view.widgets.tipFrame:removeFromParentAndCleanup(true)

				machine.ui.view.widgets.tipFrame = nil
			end

			return true
		end
	end, false, true)
	var_2_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_2_0, 60000)

	if machine.ui.view and machine.ui.view.widgets.tipFrame and not tolua.isnull(machine.ui.view.widgets.tipFrame) then
		machine.ui.view.widgets.tipFrame:removeFromParentAndCleanup(true)

		machine.ui.view.widgets.tipFrame = nil
	end

	if arg_2_1 then
		local var_2_1 = 0
		local var_2_2 = 0

		if machine.ui.view == nil then
			machine.ui.view = {}
		end

		uiutil.initWidgets(machine.ui.view, var_0_0)
		machine.ui.view.widgets.tipFrame:setAnchorPoint(ccp(1, 0))
		machine.ui.table.tipBg:addChild(machine.ui.view.widgets.tipFrame)

		local var_2_3, var_2_4 = tool.getPositionInScreen(machine.ui.table[arg_2_2])
		local var_2_5 = var_2_3 + 20
		local var_2_6 = var_2_4 + 20

		if arg_2_4 then
			var_2_5 = var_2_5 + arg_2_4.x
			var_2_6 = var_2_6 + arg_2_4.y
		end

		machine.ui.view.widgets.tipMsg:setString(arg_2_3)

		local var_2_7 = machine.ui.view.widgets.tipMsg:getContentSize().width
		local var_2_8 = machine.ui.view.widgets.tipMsg:getContentSize().height

		machine.ui.view.widgets.tipFrame:setPreferredSize(CCSizeMake(var_2_7 + 30, var_2_8 + 30))
		machine.ui.view.widgets.tipFrame:setPosition(ccp(var_2_5, var_2_6))
		machine.ui.view.widgets.tipMsg:setPosition(ccp(15, 15))
		machine.ui.view.widgets.tipFrame:setVisible(true)
	end
end

function machine.ui.init()
	rmgr.loadResource("res/anim/machine/machine1.plist")
	rmgr.loadResource("res/anim/machine/machine2.plist")
	rmgr.loadResource("res/anim/machine/machine3.plist")

	machine.ui.currentIdx = nil
end

function machine.ui.setData(arg_5_0, arg_5_1)
	local var_5_0 = false
	local var_5_1 = true

	if machine.ui.currentIdx == nil then
		machine.ui.currentIdx = arg_5_1
	end

	if arg_5_0 == nil then
		return
	end

	if arg_5_1 == nil and machine.ui.currentIdx == nil then
		for iter_5_0 = 1, 3 do
			if arg_5_0[iter_5_0] and arg_5_0[iter_5_0].haveCatapult == false then
				machine.ui.currentIdx = iter_5_0
				var_5_1 = false

				break
			end

			machine.ui.currentIdx = 3
		end
	end

	for iter_5_1, iter_5_2 in ipairs(arg_5_0) do
		if iter_5_2.haveCatapult == false then
			var_5_1 = false

			break
		end
	end

	if machine.ui.currentIdx > 3 or machine.ui.currentIdx < 1 then
		return
	end

	machine.ui.table.machine_name:setDisplayFrame(CCSprite:create("res/ui/weapon/machine/tsc_tiele0" .. machine.ui.currentIdx .. ".png"):displayFrame())
	machine.ui.table.machine_word:setDisplayFrame(CCSprite:create("res/ui/weapon/machine/tsc_word_0" .. machine.ui.currentIdx .. ".png"):displayFrame())

	if machine.ui.currentIdx == 1 then
		machine.ui.table.btn_left:setVisible(false)
	else
		machine.ui.table.btn_left:setVisible(true)
	end

	if machine.ui.currentIdx == 3 then
		machine.ui.table.btn_right:setVisible(false)
	else
		machine.ui.table.btn_right:setVisible(true)
	end

	if arg_5_0[machine.ui.currentIdx].haveCatapult == true then
		machine.ui.table.need_level:setVisible(false)
		machine.ui.table.btn_buy:setVisible(false)
		machine.ui.table.word_buy:setVisible(false)
		machine.ui.table.icon_buy:setVisible(false)
		machine.ui.table.logo_buy:setVisible(true)
		machine.ui.table.animation_sprite:setVisible(true)
		machine.ui.table.animation_sprite:removeAllChildrenWithCleanup(true)
		machine.ui.table.animation_sprite:stopAllActions()

		local var_5_2 = rmgr.getAnimation("machine" .. machine.ui.currentIdx)
		local var_5_3 = CCAnimation:createWithSpriteFrames(var_5_2, 0.1)
		local var_5_4 = CCAnimate:create(var_5_3)

		machine.ui.table.animation_sprite:runAction(CCRepeatForever:create(var_5_4))
		machine.ui.table.machine_car:setVisible(false)
	else
		machine.ui.table.logo_buy:setVisible(false)
		machine.ui.table.animation_sprite:setVisible(false)
		machine.ui.table.machine_car:setVisible(true)
		machine.ui.table.machine_car:removeAllChildrenWithCleanup(true)
		machine.ui.table.machine_car:setDisplayFrame(tool.spriteFrameByName("machine" .. machine.ui.currentIdx .. "_1.png"))
		tool.spriteToGray(machine.ui.table.machine_car)

		if user.player.playerLv < arg_5_0[machine.ui.currentIdx].lv then
			machine.ui.table.need_level:setVisible(true)
			machine.ui.table.need_level:setString(language.get("220702_qixie", arg_5_0[machine.ui.currentIdx].lv))
			machine.ui.table.btn_buy:setVisible(false)
			machine.ui.table.word_buy:setVisible(false)
			machine.ui.table.icon_buy:setVisible(false)
		else
			machine.ui.table.need_level:setVisible(false)

			if machine.ui.currentIdx - 1 > 0 and arg_5_0[machine.ui.currentIdx - 1].haveCatapult ~= true then
				machine.ui.table.btn_buy:setVisible(false)
				machine.ui.table.word_buy:setVisible(false)
				machine.ui.table.icon_buy:setVisible(false)
			else
				machine.ui.table.btn_buy:setVisible(true)
				machine.ui.table.word_buy:setVisible(true)
				machine.ui.table.icon_buy:setVisible(true)

				var_5_0 = true
			end

			machine.ui.table.num_buy:setString(arg_5_0[machine.ui.currentIdx].gold)

			if machine.ui.currentIdx == 1 then
				machine.ui.table.word_buy:setString(language.get(101018))
			else
				machine.ui.table.word_buy:setString(language.get(20003))
			end
		end
	end

	if machine.ui.data.state and machine.ui.data.state > 0 then
		if user.firstOpenChariotTech then
			user.firstOpenChariotTech = false

			if var_5_1 then
				roleDialogue.control.loadSpeak("chariot1")
			else
				roleDialogue.control.loadSpeak("chariot3")
			end
		end

		machine.ui.table.processBg:setVisible(false)
		machine.ui.table.btn_build1:setVisible(false)
		machine.ui.table.btn_build2:setVisible(false)
		machine.ui.table.btn_build3:setVisible(false)
		machine.ui.table.icon_buyNew:setVisible(false)
		machine.ui.table.icon_build1:setVisible(false)
		machine.ui.table.word_build2:setVisible(false)
		machine.ui.table.word_build3:setVisible(false)
		machine.ui.table.btn_buyNew:setVisible(false)
		machine.ui.table.btn_lock:setVisible(false)
		machine.ui.table.icon_lock:setVisible(false)

		if var_5_0 then
			machine.ui.table.btn_buy:setVisible(false)
			machine.ui.table.word_buy:setVisible(false)
			machine.ui.table.icon_buy:setVisible(false)
			machine.ui.table.btn_yt:setVisible(true)
			machine.ui.table.icon_yt:setVisible(true)
			machine.ui.table.num_yt:setString(machine.ui.data.meteoriteNum)
			machine.ui.table.num_yt:setColor(machine.ui.data.meteoriteNum >= machine.ui.data.meteoriteNumMax and colorQuality[5] or colorText[10001])

			machine.ui.tipsStr[4] = language.get(216117, machine.ui.data.meteoriteNumMax)

			if machine.ui.data.state < 3 then
				for iter_5_3, iter_5_4 in ipairs(machine.ui.data.lvs) do
					machine.ui.tipsStr[iter_5_3] = language.get(216112, iter_5_4.needExp, iter_5_4.reduceGold)

					machine.ui.table["lvBtn" .. iter_5_3]:setPositionX(832 * iter_5_4.needExp / machine.ui.data.expMax)
					machine.ui.table["lvBtnT" .. iter_5_3]:setPositionX(832 * iter_5_4.needExp / machine.ui.data.expMax)

					if machine.ui.data.exp >= iter_5_4.needExp then
						machine.ui.table["lvBtn" .. iter_5_3]:setEnabled(true)
					else
						machine.ui.table["lvBtn" .. iter_5_3]:setEnabled(false)
					end
				end

				if machine.ui.data.state == 1 then
					machine.ui.table.blueprintBtn:setEnabled(false)
					machine.ui.table.blueprintLb:setVisible(false)
					machine.ui.table.btn_build1:setVisible(true)
					machine.ui.table.icon_build1:setVisible(true)
					machine.ui.table.num_build1:setString(machine.ui.data.costMeteoriteNum)

					machine.ui.tipsStr[3] = language.get(216114, arg_5_0[machine.ui.currentIdx].name)

					if tonumber(machine.ui.data.zhugeLockNum) > 0 and tonumber(machine.ui.data.zhugeLockCD) > 0 then
						machine.ui.table.btn_lock:setVisible(true)
						machine.ui.table.icon_lock:setVisible(true)
						machine.ui.table.num_lock:setString(machine.ui.data.zhugeLockNum)

						if not machine.ui.table.timer then
							local var_5_5 = createTimerLabel(machine.ui.data.zhugeLockCD, "@H:@M:@S", "Thonburi-Bold", 20, nil, nil, nil, colorQuality[5])

							machine.ui.table.timer = var_5_5

							machine.ui.table.icon_lock:addChild(var_5_5, 100)
							var_5_5:setPosition(90, 22)
						end
					end
				elseif machine.ui.data.state == 2 then
					machine.ui.table.btn_build2:setVisible(true)
					machine.ui.table.word_build2:setVisible(true)
					machine.ui.table.blueprintBtn:setEnabled(true)
					machine.ui.table.blueprintLb:setVisible(true)
					machine.ui.table.blueprintLb:setString(machine.ui.data.blueprintNum .. "/" .. machine.ui.data.blueprintNeedNum)

					machine.ui.tipsStr[3] = language.get(216113, arg_5_0[machine.ui.currentIdx].name)
				end

				local var_5_6 = machine.ui.data.exp / machine.ui.data.expMax * 100
				local var_5_7 = var_5_6 - var_5_6 % 0.01

				machine.ui.table.processLb:setString(machine.ui.data.exp .. "/" .. machine.ui.data.expMax)
				machine.ui.table.process:setPercentage(var_5_7)
				machine.ui.table.processBg:setVisible(true)
				machine.ui.table.machine_word_bg:setPosition(ccp(467, 140))
				machine.ui.table.btn_buyNew:setVisible(true)
				machine.ui.table.icon_buyNew:setVisible(true)
				machine.ui.table.num_buyNew:setString(arg_5_0[machine.ui.currentIdx].gold)
			else
				machine.ui.table.processBg:setVisible(false)

				if var_5_1 and machine.ui.currentIdx == 3 then
					machine.ui.table.btn_build3:setVisible(true)
					machine.ui.table.word_build3:setVisible(true)
				end
			end
		elseif var_5_1 and machine.ui.currentIdx == 3 then
			machine.ui.table.btn_build3:setVisible(true)
			machine.ui.table.word_build3:setVisible(true)
		end
	end
end

function machine.ui.left()
	if machine.ui.currentIdx then
		machine.ui.currentIdx = machine.ui.currentIdx - 1

		machine.ui.setData(machine.ui.tank, machine.ui.currentIdx)
	end
end

function machine.ui.right()
	if machine.ui.currentIdx then
		machine.ui.currentIdx = machine.ui.currentIdx + 1

		machine.ui.setData(machine.ui.tank, machine.ui.currentIdx)
	end
end

function machine.ui.lvBtn1()
	machine.ui:showTips(true, "lvBtn1", machine.ui.tipsStr[1])
end

function machine.ui.lvBtn2()
	machine.ui:showTips(true, "lvBtn2", machine.ui.tipsStr[2])
end

function machine.ui.blueprintBtn()
	machine.ui:showTips(true, "blueprintBtn", machine.ui.tipsStr[3])
end

function machine.ui.btn_yt()
	machine.ui:showTips(true, "btn_yt", machine.ui.tipsStr[4], ccp(200, -20))
end

function machine.ui.btn_lock()
	local function var_12_0()
		local var_13_0 = rmgr.getAnimation("fireball")
		local var_13_1 = CCAnimation:createWithSpriteFrames(var_13_0, 0.04)
		local var_13_2 = CCAnimate:create(var_13_1)
		local var_13_3 = CCRepeatForever:create(var_13_2)
		local var_13_4 = CCSprite:create()

		var_13_4:setRotation(90)
		var_13_4:runAction(var_13_3)

		return var_13_4
	end

	local function var_12_1(arg_14_0)
		local var_14_0 = arg_14_0.action.data
		local var_14_1 = CCLayerColor:create(ccc4(0, 0, 0, 0), 915, 530)

		machine.ui.table.bg:addChild(var_14_1, 100)
		swallowTouch(var_14_1)

		local var_14_2 = var_12_0()

		var_14_2:setScale(2)
		var_14_2:setPosition(457.5, 370)
		var_14_1:addChild(var_14_2)

		local var_14_3 = var_12_0()

		var_14_3:setPosition(457.5, 370)
		var_14_1:addChild(var_14_3)

		local var_14_4 = CCArray:create()

		for iter_14_0, iter_14_1 in ipairs(var_14_0.addExpList) do
			var_14_4:addObject(CCCallFunc:create(function()
				var_14_3:setPosition(457.5, 370)
			end))
			var_14_4:addObject(CCShow:create())
			var_14_4:addObject(CCMoveTo:create(0.3, ccp(457.5, 130)))
			var_14_4:addObject(CCCallFunc:create(function()
				machine.ui.data.exp = machine.ui.data.exp + iter_14_1.addExp

				machine.ui.setData(machine.ui.tank)
			end))
			var_14_4:addObject(CCDelayTime:create(0.3))
			var_14_4:addObject(CCHide:create())
		end

		var_14_4:addObject(CCCallFunc:create(function()
			var_14_1:removeFromParentAndCleanup(true)
			machine.control.request_machineInfo()
		end))

		local var_14_5 = CCSequence:create(var_14_4)

		var_14_3:runAction(var_14_5)
	end

	messageBox.confirm(language.get(215746), function()
		cmgr.sendRequest(var_12_1, actions.catapultSuperForge)
	end)
end

function machine.ui.flyBuildBaoji()
	if machine.ui.addExp and machine.ui.addExp > 0 and (machine.ui.addExp == 2 or machine.ui.addExp == 4 or machine.ui.addExp == 10) then
		local var_19_0 = CCSprite:createWithSpriteFrameName("js_bj_" .. machine.ui.addExp .. ".png")

		var_19_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 + 50))
		smgr.showTipSpriteText(var_19_0)
	end

	machine.control.request_machineInfo()
end

function machine.ui.catapultUpgrade(arg_20_0)
	local var_20_0 = arg_20_0.action.data

	machine.ui.addExp = var_20_0.addExp

	if machine.ui.data and machine.ui.data.state then
		if machine.ui.data.state == 1 then
			machine.ui.flyBuildBaoji()
		elseif machine.ui.data.state == 2 then
			smgr.showTipTextGreen(language.get(216118))
			machine.control.request_machineInfo()
		elseif machine.ui.data.state == 3 then
			user.isShowRebuild = true

			weaponTab.ui.show(4)
		end
	end
end

function machine.ui.btn_build1()
	cmgr.sendRequest(machine.ui.catapultUpgrade, actions.catapultUpgrade, 1)
end

function machine.ui.btn_build2()
	cmgr.sendRequest(machine.ui.catapultUpgrade, actions.catapultUpgrade, 2)
end

function machine.ui.btn_build3()
	cmgr.sendRequest(machine.ui.catapultUpgrade, actions.catapultUpgrade, 3)
end

function machine.ui.show()
	rmgr.loadTable({
		"res/ui/resource/incense/incense.plist"
	})
	machine.ui.init()

	machine.ui.tipsStr = {}

	local var_24_0 = createBaseLayer()

	machine.ui.table = autoUI.initUI(var_24_0, getMachinePanelData())
	machine.ui.table.layer = var_24_0

	var_24_0:registerScriptTouchHandler(machine.ui.onTouch)
	var_24_0:setTouchEnabled(true)
	machine.ui.table.btn_left:registerScriptTapHandler(machine.ui.left)
	machine.ui.table.btn_right:registerScriptTapHandler(machine.ui.right)
	machine.ui.table.btn_buy:registerScriptTapHandler(machine.control.request_buyMachine_showChargeWin)
	machine.ui.table.lvBtnT1:registerScriptTapHandler(machine.ui.lvBtn1)
	machine.ui.table.lvBtnT2:registerScriptTapHandler(machine.ui.lvBtn2)
	machine.ui.table.blueprintBtnT:registerScriptTapHandler(machine.ui.blueprintBtn)
	machine.ui.table.btn_yt:registerScriptTapHandler(machine.ui.btn_yt)
	machine.ui.table.btn_build1:registerScriptTapHandler(machine.ui.btn_build1)
	machine.ui.table.btn_build2:registerScriptTapHandler(machine.ui.btn_build2)
	machine.ui.table.btn_build3:registerScriptTapHandler(machine.ui.btn_build3)
	machine.ui.table.btn_buyNew:registerScriptTapHandler(machine.control.request_buyMachine_showChargeWin)
	machine.ui.table.btn_lock:registerScriptTapHandler(machine.ui.btn_lock)
	machine.control.request_machineInfo()

	return var_24_0
end
