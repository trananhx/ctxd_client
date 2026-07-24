local var_0_0 = class("MessageBox", function()
	return createBaseLayer()
end)

function var_0_0.onAgreeTransferCorps(arg_2_0, arg_2_1)
	arg_2_0:removeFromParentAndCleanup(true)

	local function var_2_0(arg_3_0)
		if arg_2_1 == 0 then
			smgr.showTipTextGreen(language.get(136232))
		elseif arg_2_1 == 1 then
			smgr.showTipText(language.get(136233))
		end
	end

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD or arg_2_0.isKf then
		kfcmgr.sendRequest(var_2_0, actions.agreeTransferCorps, arg_2_1)
	else
		cmgr.sendRequest(var_2_0, actions.agreeTransferCorps, arg_2_1)
	end
end

function var_0_0.handlerPushCorpsAction(arg_4_0, arg_4_1)
	local var_4_0 = (arg_4_1.data or arg_4_1.action.data).state

	if var_4_0 and type(var_4_0) ~= "number" and (var_4_0.donationState == false or var_4_0.transfer == false) then
		arg_4_0:removeFromParentAndCleanup(true)
	end
end

function var_0_0.ctor(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	log.info("@@ 候选者确认框")

	arg_5_0.view = {}

	uiutil.initWidgets(arg_5_0.view, arg_5_0.layout)
	swallowTouch(arg_5_0)

	if arg_5_1 then
		arg_5_1:addChild(arg_5_0)
	end

	arg_5_0.isKf = arg_5_3

	local var_5_0 = {
		{
			text = language.get(10001),
			callBack = function()
				arg_5_0:onAgreeTransferCorps(0)
			end
		},
		{
			text = language.get(10002),
			callBack = function()
				arg_5_0:onAgreeTransferCorps(1)
			end
		}
	}
	local var_5_1 = messageBox.createMessageBox(language.get(10003), language.get(136219, arg_5_2.commanderName), var_5_0)

	var_5_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
	arg_5_0:addChild(var_5_1)
end

function var_0_0.onEnter(arg_8_0)
	arg_8_0.handlerPushCorpsActionRef = handler(arg_8_0, arg_8_0.handlerPushCorpsAction)

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		kfcmgr.registerResponseHandler(actions.pushCorps, arg_8_0.handlerPushCorpsActionRef)
	else
		cmgr.registerResponseHandler(actions.pushCorps, arg_8_0.handlerPushCorpsActionRef)
	end
end

function var_0_0.onExit(arg_9_0)
	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		kfcmgr.unregisterResponseHandler(actions.pushCorps, arg_9_0.handlerPushCorpsActionRef)
	else
		cmgr.unregisterResponseHandler(actions.pushCorps, arg_9_0.handlerPushCorpsActionRef)
	end
end

return var_0_0
