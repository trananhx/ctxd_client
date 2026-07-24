local var_0_0 = class("LookActivityControl")

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.data = arg_1_1
	arg_1_0.idmap = {
		[21] = 7
	}
	arg_1_0.ismoving = false
end

function var_0_0.getActivityInfo(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0.data = arg_3_0.action.data

		arg_2_0.world:updateMenuLayer()
		arg_2_0.world:updateMapLayer()
		arg_2_0.world:updateThumbnail()
	end

	cmgr.sendRequest(var_2_0, actions.getLookActivity)
end

function var_0_0.clickLookButton(arg_4_0)
	local function var_4_0(arg_5_0)
		smgr.changeScene(SCENE_LOOKACTIVITY, arg_4_0)
	end

	cmgr.sendRequest(var_4_0, actions.clickLookButton)
end

function var_0_0.throwDiceLook(arg_6_0, arg_6_1, arg_6_2)
	local function var_6_0(arg_7_0)
		if arg_7_0.action.state == 1 then
			arg_6_0.data.leftDice = arg_7_0.action.data.leftDice
			arg_6_0.data.leftTimes = arg_7_0.action.data.step
			arg_6_0.data.lastHit = arg_7_0.action.data.lastHit

			arg_6_0.world:playShaiziAnim(arg_7_0.action.data.step, arg_7_0.action.data.lastHit)
		end
	end

	if user.lookActivityTip == true and arg_6_0.data.leftDice <= 0 then
		local var_6_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

		var_6_1:setTouchEnabled(true)
		var_6_1:registerScriptTouchHandler(function(arg_8_0, arg_8_1, arg_8_2)
			if arg_8_0 == CCTOUCHBEGAN then
				return true
			elseif arg_8_0 == CCTOUCHMOVED then
				return true
			elseif arg_8_0 == CCTOUCHENDED then
				return true
			end
		end, false, true)

		local function var_6_2()
			cmgr.sendRequest(var_6_0, actions.throwDiceLook, arg_6_1)
			var_6_1:removeFromParentAndCleanup(true)
		end

		local function var_6_3()
			user.lookActivityTip = false

			cmgr.sendRequest(var_6_0, actions.throwDiceLook, arg_6_1)
			var_6_1:removeFromParentAndCleanup(true)
		end

		local function var_6_4()
			var_6_1:removeFromParentAndCleanup(true)
		end

		local var_6_5 = messageBox.createMessageBox(language.get(10003), language.get("130058_gcldhw", arg_6_2), {
			{
				text = language.get(10001),
				callBack = var_6_2
			},
			{
				text = language.get(10201),
				callBack = var_6_3
			},
			{
				text = language.get(10002),
				callBack = var_6_4
			}
		})

		var_6_1:addChild(var_6_5)
		smgr.rootLayer:addChild(var_6_1, 60000)
	else
		cmgr.sendRequest(var_6_0, actions.throwDiceLook, arg_6_1)
	end
end

function var_0_0.lookWalk(arg_12_0, arg_12_1)
	if arg_12_0.ismoving == true then
		return
	end

	local function var_12_0(arg_13_0)
		arg_12_0.data.location = arg_13_0.action.data.location
		arg_12_0.data.leftDice = arg_13_0.action.data.leftDice
		arg_12_0.data.leftTimes = arg_13_0.action.data.leftTimes
		arg_12_0.data.areaId = arg_13_0.action.data.areaId

		arg_12_0.world:updateMenuLayer()

		arg_12_0.ismoving = true

		arg_12_0.world:playerMove(arg_13_0.action.data.roads, arg_13_0.action.data.canReceiveBigBox)
	end

	cmgr.sendRequest(var_12_0, actions.lookWalk, arg_12_1)
end

function var_0_0.lookSmallBox(arg_14_0)
	local function var_14_0(arg_15_0)
		arg_14_0.world:showCityRewards(arg_15_0.action.data.rewards)
		arg_14_0:getActivityInfo()
	end

	cmgr.sendRequest(var_14_0, actions.lookSmallBox)
end

function var_0_0.getRewardLook(arg_16_0)
	local function var_16_0(arg_17_0)
		arg_16_0.world:showCityRewards(arg_17_0.action.data.rewards)
		arg_16_0.world:openNextArea(arg_17_0.action.data.areaId)
	end

	cmgr.sendRequest(var_16_0, actions.getRewardLook)
end

return var_0_0
