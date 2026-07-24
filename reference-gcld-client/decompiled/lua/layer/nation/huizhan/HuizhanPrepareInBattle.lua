local var_0_0 = class("HuizhanPrepareInBattle", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.hzAttForce = arg_2_1.hzAttForce or 197
	arg_2_0.hzAttForce1 = arg_2_1.hzAttForce1 or 197
	arg_2_0.hzAttForce2 = arg_2_1.hzAttForce2 or 0
	arg_2_0.hzAttForceId1 = arg_2_1.hzAttForceId1 or 2
	arg_2_0.hzAttForceId2 = arg_2_1.hzAttForceId2 or 3
	arg_2_0.hzCityId = arg_2_1.hzCityId or 132
	arg_2_0.hzDefForce = arg_2_1.hzDefForce or 0
	arg_2_0.hzDefForceId = arg_2_1.hzDefForceId or 1
	arg_2_0.hzLv = arg_2_1.hzLv or 0
	arg_2_0.hzState = arg_2_1.hzState or 1

	require("lua/common/CCBNode"):create(arg_2_0)

	local var_2_0 = {
		arg_2_0.hzAttForceId1,
		arg_2_0.hzAttForceId2,
		arg_2_0.hzDefForceId
	}

	for iter_2_0 = 1, 3 do
		local var_2_1 = arg_2_0["forceSprite" .. iter_2_0]
		local var_2_2 = var_2_1:getContentSize()

		var_2_1:setOpacity(0)

		local var_2_3 = CCLabelTTF:create(user.forceIdToName[var_2_0[iter_2_0]], "", 25)

		var_2_3:setColor(colorForce[var_2_0[iter_2_0]])
		var_2_3:setPosition(var_2_2.width * 0.5, var_2_2.height * 0.5)
		var_2_1:addChild(var_2_3)
	end

	arg_2_0:update({
		hzAttForce = arg_2_0.hzAttForce,
		hzDefForce = arg_2_0.hzDefForce
	})
end

function var_0_0.update(arg_3_0, arg_3_1)
	if arg_3_1.hzAttForce and arg_3_1.hzDefForce then
		arg_3_0.attForceLabel:setString(language.get(460033, arg_3_1.hzAttForce))
		arg_3_0.defForceLabel:setString(language.get(460033, arg_3_1.hzDefForce))
	end
end

return var_0_0
