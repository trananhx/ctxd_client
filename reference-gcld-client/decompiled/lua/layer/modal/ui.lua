require("lua/layer/modal/constant")
require("lua/manager/StatisticsManager")

function createModalLayer(arg_1_0)
	arg_1_0 = arg_1_0 or 5

	local var_1_0 = createBaseLayer()

	var_1_0:setVisible(false)

	local var_1_1 = modalState.disable
	local var_1_2

	local function var_1_3()
		var_1_1 = modalState.disable

		var_1_0:removeAllChildrenWithCleanup(true)
		var_1_0:setVisible(false)
	end

	local function var_1_4()
		var_1_1 = modalState.timeOut

		var_1_0:removeAllChildrenWithCleanup(true)

		local var_3_0 = CCLayerColor:create(ccc4(0, 0, 0, 180), visibleSize.width, visibleSize.height)

		var_1_0:addChild(var_3_0)

		local var_3_1 = CCStrokeLabelTTF:create(language.get(260001), "Thonburi-Bold", 26)

		var_3_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
		var_1_0:addChild(var_3_1)
		eventManager.dispatchEvent("sendTimeOut")
	end

	local function var_1_5()
		var_1_1 = modalState.loading

		var_1_0:removeAllChildrenWithCleanup(true)

		local var_4_0 = CCLayerColor:create(ccc4(0, 0, 0, 180), visibleSize.width, visibleSize.height)

		var_1_0:addChild(var_4_0)

		local var_4_1 = rmgr.getModalAnimation()
		local var_4_2 = CCAnimation:createWithSpriteFrames(var_4_1, 0.08)
		local var_4_3 = CCAnimate:create(var_4_2)
		local var_4_4 = CCRepeat:create(var_4_3, arg_1_0)
		local var_4_5 = CCCallFuncN:create(var_1_4)
		local var_4_6 = CCArray:create()

		var_4_6:addObject(var_4_4)
		var_4_6:addObject(var_4_5)

		local var_4_7 = CCSequence:create(var_4_6)
		local var_4_8 = CCSprite:create()

		var_4_8:runAction(var_4_7)
		var_4_8:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.6))
		var_1_0:addChild(var_4_8)

		local var_4_9 = CCStrokeLabelTTF:create(language.get(260003), "Thonburi-Bold", 26)

		var_4_9:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.55))
		var_1_0:addChild(var_4_9)

		if var_1_2 ~= nil then
			emgr.report(var_1_2)
		end
	end

	function var_1_0.show(arg_5_0, arg_5_1)
		var_1_2 = arg_5_1
		var_1_1 = modalState.normal

		arg_5_0:removeAllChildrenWithCleanup(true)

		local var_5_0 = CCDelayTime:create(conf.modal.requestTime)
		local var_5_1 = CCCallFuncN:create(var_1_5)
		local var_5_2 = CCArray:create()

		var_5_2:addObject(var_5_0)
		var_5_2:addObject(var_5_1)

		local var_5_3 = CCSequence:create(var_5_2)
		local var_5_4 = CCSprite:create()

		var_5_4:runAction(var_5_3)
		var_5_4:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.6))
		arg_5_0:addChild(var_5_4)
	end

	function var_1_0.setTimeout(arg_6_0, arg_6_1)
		arg_1_0 = arg_6_1 or 5
	end

	function var_1_0.hide(arg_7_0)
		var_1_1 = modalState.disable

		arg_7_0:removeAllChildrenWithCleanup(true)
	end

	function var_1_0.onEnter(arg_8_0)
		log.info("### on modal enter ...")
	end

	function var_1_0.onExit(arg_9_0)
		log.info("### on modal enter ...")
	end

	var_1_0:registerScriptTouchHandler(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == CCTOUCHBEGAN then
			if var_1_1 == modalState.disable then
				return false
			else
				if var_1_1 == modalState.timeOut then
					var_1_3()

					smgr.modalTimeOutCount = smgr.modalTimeOutCount + 1

					if user and user.sessionId and smgr.modalTimeOutCount >= 2 then
						smgr.modalTimeOutCount = 0

						channelMgr.renewSocketAndReconnect()
					end
				end

				return true
			end
		elseif arg_10_0 == CCTOUCHMOVED then
			return true
		elseif arg_10_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)
	var_1_0:setTouchEnabled(true)

	return var_1_0
end
