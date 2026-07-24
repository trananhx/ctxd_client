jubenSelect = {}

tool.requireRes("juben/jubenSelect")
require("lua/component/timerLabel")

jubenSelect.ui = {}

local var_0_0 = require("lua/common/json")

jubenSelect.ui.currentIndex = 1
jubenSelect.ui.touchPos = {}
jubenSelect.ui.setOnlyOnce = false

function jubenSelect.ui.onTouch(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0 == CCTOUCHBEGAN then
		jubenSelect.ui.touchPos.x = arg_1_1
		jubenSelect.ui.touchPos.y = arg_1_2
		jubenSelect.ui.touchPos.index = jubenSelect.ui.currentIndex

		if jubenSelect.ui.table.high_bg ~= nil then
			jubenSelect.ui.table.high_bg:setVisible(false)
		end
	elseif arg_1_0 == CCTOUCHMOVED then
		local var_1_0 = 0 - jubenSelect.ui.table.scrollView:getContentOffset().x
		local var_1_1 = jubenSelect.control.calculate_scroll_index(var_1_0)

		if jubenSelect.ui.touchPos.index ~= var_1_1 + 1 then
			jubenSelect.ui.touchPos.index = var_1_1 + 1

			local var_1_2 = jubenSelect.data.jubens[var_1_1 + 1]
			local var_1_3 = CCSprite:create("res/ui/juben/jubenSelect/text/jb_jb_name_" .. var_1_2.sId .. ".png")

			jubenSelect.ui.table.text:setDisplayFrame(var_1_3:displayFrame())
			jubenSelect.ui.table.text_blood:setVisible(var_1_2.sId >= 12)
		end

		if math.abs(arg_1_1 - jubenSelect.ui.touchPos.x) > 15 and var_1_0 > 0 and jubenSelect.ui.setOnlyOnce == false then
			jubenSelect.ui.table.selectBg:setVisible(false)

			local var_1_4, var_1_5 = jubenSelect.ui.table["item" .. jubenSelect.ui.currentIndex]:getPosition()

			jubenSelect.ui.table["item" .. jubenSelect.ui.currentIndex]:setPosition(ccp(var_1_4, 270))

			jubenSelect.ui.setOnlyOnce = true
		end
	elseif arg_1_0 == CCTOUCHENDED then
		if jubenSelect.ui.setOnlyOnce == false then
			local var_1_6 = arg_1_1 - visibleSize.width / 2
			local var_1_7 = arg_1_2 - visibleSize.height / 2

			if math.abs(var_1_6) < 180 and math.abs(var_1_7) < 220 and jubenSelect.data.jubens[jubenSelect.ui.currentIndex].openPower == nil then
				jubenSelect.control.on_click_back()

				jubenLevelSelect.data = jubenSelect.data.jubens[jubenSelect.ui.currentIndex]

				jubenLevelSelect.ui.show()

				return
			end
		end

		local var_1_8 = 0 - jubenSelect.ui.table.scrollView:getContentOffset().x
		local var_1_9 = jubenSelect.control.calculate_scroll_index(var_1_8)

		jubenSelect.control.set_scroll_stop_position(var_1_9)

		jubenSelect.ui.currentIndex = var_1_9 + 1

		local var_1_10, var_1_11 = jubenSelect.ui.table["item" .. jubenSelect.ui.currentIndex]:getPosition()

		jubenSelect.ui.table["item" .. jubenSelect.ui.currentIndex]:setPosition(ccp(var_1_10, 373))

		local var_1_12 = CCArray:create()

		var_1_12:addObject(CCDelayTime:create(0.3))
		var_1_12:addObject(CCCallFuncN:create(jubenSelect.ui.set_scrollView_touchEnable))
		jubenSelect.ui.table.layer:runAction(CCSequence:create(var_1_12))

		if jubenSelect.ui.updateSchedulerEntry == nil then
			local var_1_13 = CCDirector:sharedDirector():getScheduler()

			jubenSelect.ui.updateSchedulerEntry = var_1_13:scheduleScriptFunc(jubenSelect.ui.set_position_forever, 0, false)
		end

		jubenSelect.control.showBestReward()
		jubenSelect.ui.table.selectBg:setVisible(true)

		jubenSelect.ui.setOnlyOnce = false
	end

	return true
end

function jubenSelect.ui.set_position_forever()
	jubenSelect.control.set_scroll_stop_position(jubenSelect.ui.currentIndex - 1)
end

function jubenSelect.ui.set_scrollView_touchEnable()
	if jubenSelect.ui.updateSchedulerEntry ~= nil then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(jubenSelect.ui.updateSchedulerEntry)

		jubenSelect.ui.updateSchedulerEntry = nil
	end
end

function jubenSelect.ui.init()
	jubenSelect.ui.table.btn_high:registerScriptTapHandler(jubenSelect.control.on_click_high)
	jubenSelect.ui.table.btn_back:registerScriptTapHandler(jubenSelect.control.on_click_back)

	if jubenLevelSelect.data.level_back == true then
		jubenLevelSelect.data.level_back = false
	else
		local var_4_0 = #jubenSelect.data.jubens

		jubenSelect.ui.currentIndex = var_4_0 - 1

		if jubenSelect.ui.currentIndex <= 0 then
			jubenSelect.ui.currentIndex = 1
		end
	end

	jubenSelect.control.showBestReward()
	jubenSelect.control.create_scroll_view()
	jubenSelect.control.set_scroll_stop_position(jubenSelect.ui.currentIndex - 1)

	local var_4_1, var_4_2 = jubenSelect.ui.table["item" .. jubenSelect.ui.currentIndex]:getPosition()

	jubenSelect.ui.table["item" .. jubenSelect.ui.currentIndex]:setPosition(ccp(var_4_1, var_4_2 + 103))
	jubenSelect.ui.table.layer:setVisible(true)
end

function jubenSelect.ui.show()
	local var_5_0 = createBaseLayer()

	jubenSelect.ui.table = autoUI.initUI(var_5_0, getJubenSelectData())
	jubenSelect.ui.table.layer = var_5_0

	var_5_0:registerScriptTouchHandler(jubenSelect.ui.onTouch, false, true)
	var_5_0:setTouchEnabled(true)
	var_5_0:setPosition(ccp(visibleSize.width / 2 - 568, visibleSize.height / 2 - 384))

	local var_5_1 = CCLayerColor:create(ccc4(0, 0, 0, 200))

	var_5_1:setContentSize(CCSizeMake(visibleSize.width, visibleSize.height))
	var_5_1:setPosition(ccp(0, 0))
	var_5_1:addChild(var_5_0, 1)

	function var_5_0.onExit()
		jubenSelect.ui.set_scrollView_touchEnable()
	end

	smgr.getLayer("topLayer"):addChild(var_5_1, 2)
	jubenSelect.control.request_jubenList()
end
