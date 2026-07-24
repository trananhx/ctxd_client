offlineBuff = offlineBuff or {}

tool.requireRes("offlineBuff")

offlineBuff.ui = {}

function offlineBuff.ui.onTouch(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0 == CCTOUCHBEGAN then
		-- block empty
	elseif arg_1_0 == CCTOUCHENDED then
		local var_1_0 = arg_1_1 - visibleSize.width / 2
		local var_1_1 = arg_1_2 - visibleSize.height / 2

		if var_1_0 > -280 and var_1_0 < 280 and var_1_1 > -177 and var_1_1 < 177 then
			-- block empty
		else
			smgr.getLayer("topLayer"):removeChild(offlineBuff.ui.table.layer, true)
		end
	end

	return true
end

function offlineBuff.ui.init()
	offlineBuff.ui.table.btn_linqu:registerScriptTapHandler(function(...)
		cmgr.sendRequest(function(arg_4_0)
			if arg_4_0.action.state == 1 then
				user.player.hasOfflineBuff = arg_4_0.action.data.hasOfflineBuff
				user.player.offlineBuffId = arg_4_0.action.data.offlineBuffId
				user.player.offlineEndTime = arg_4_0.action.data.endTime

				user.welfare.setWelfareSimple("canGetOfflineBuff", 0)
				offlineBuff.ui.checkBuffState()

				local var_4_0 = CCSprite:create("res/ui/offlineBuff/lxjl_word_hdjyjc.png")

				var_4_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height * 0.4))

				local var_4_1 = CCMoveTo:create(0.3, ccp(visibleSize.width / 2, visibleSize.height * 0.6))
				local var_4_2 = CCDelayTime:create(0.3)
				local var_4_3 = CCMoveTo:create(0.5, ccp(visibleSize.width / 2, visibleSize.height))
				local var_4_4 = CCCallFuncN:create(function(arg_5_0)
					arg_5_0:removeFromParentAndCleanup(true)
				end)
				local var_4_5 = CCArray:create()

				var_4_5:addObject(var_4_1)
				var_4_5:addObject(var_4_2)
				var_4_5:addObject(var_4_3)
				var_4_5:addObject(var_4_4)

				local var_4_6 = CCSequence:create(var_4_5)

				var_4_0:runAction(var_4_6)
				offlineBuff.ui.table.layer:addChild(var_4_0, 101)
			end
		end, actions.getOfflineBuff)
	end)
	offlineBuff.ui.table.btn_yes:registerScriptTapHandler(function()
		smgr.getLayer("topLayer"):removeChild(offlineBuff.ui.table.layer, true)
	end)
	offlineBuff.ui.table.exp:setString(offlineBuff.constant[user.player.offlineBuffId] .. "%")
	offlineBuff.ui.table.expImage:setDisplayFrame(CCSprite:create("res/ui/offlineBuff/lx_buff_0" .. user.player.offlineBuffId .. ".jpg"):displayFrame())
	offlineBuff.ui.checkBuffState()
end

function offlineBuff.ui.checkBuffState()
	offlineBuff.ui.table.btn_linqu:setVisible(user.welfare.canGetOfflineBuff == 1)
	offlineBuff.ui.table.btn_yes:setVisible(user.welfare.canGetOfflineBuff == 0)

	if user.welfare.canGetOfflineBuff == 1 then
		offlineBuff.ui.table.title_btn:setString(language.get(230005))
	elseif user.welfare.canGetOfflineBuff == 0 then
		offlineBuff.ui.table.title_btn:setString(language.get(230002))
	else
		offlineBuff.ui.table.title_btn:setString("")
	end
end

function offlineBuff.ui.show()
	local var_8_0 = createBaseLayer()

	offlineBuff.ui.table = autoUI.initUI(var_8_0, getOfflineBuffData())
	offlineBuff.ui.table.layer = var_8_0

	var_8_0:registerScriptTouchHandler(offlineBuff.ui.onTouch, false, true)
	var_8_0:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_8_0, 10000)
	offlineBuff.ui.init()
	offlineBuff.ui.refineLayout(offlineBuff.ui.table)
end

function offlineBuff.ui.refineLayout(arg_9_0)
	arg_9_0.exp:setAnchorPoint(ccp(0, 0.5))
	arg_9_0.exp:setPositionX(arg_9_0.current_reward_time_title:getContentSize().width / 2 + 4)
end
