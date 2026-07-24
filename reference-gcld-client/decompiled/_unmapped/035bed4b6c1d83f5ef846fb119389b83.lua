local var_0_0 = class("LookThumbNailLayer", function()
	return createBaseLayer()
end)

var_0_0.uidata = {}
var_0_0.uidata.bg = {
	pic = "frame:cdsh_xiaoditu.png",
	type = "pic",
	x = visibleSize.width - 125,
	y = visibleSize.height - 125
}

function var_0_0.ctor(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.world = arg_2_1
	arg_2_0.control = arg_2_1.control
	arg_2_0.mapLayer = arg_2_2
	arg_2_0.uiTable = autoUI.initUI(arg_2_0, arg_2_0.uidata)

	arg_2_0:addCityFog()
	arg_2_0:updateThumbnail()

	arg_2_0.frame = CCSprite:createWithSpriteFrameName("cdsh_icon_xuanzhongqu.png")

	arg_2_0:addChild(arg_2_0.frame, 1000)
	arg_2_0:updateFrame()
end

function var_0_0.addCityFog(arg_3_0)
	arg_3_0.fogBatchNode = {}

	for iter_3_0 = 1, 3 do
		arg_3_0.fogBatchNode[iter_3_0] = CCSpriteBatchNode:create("res/ui/world/thumbnail.png", 100)

		arg_3_0.fogBatchNode[iter_3_0]:setPosition(ccp(visibleSize.width - 125, visibleSize.height - 125))
		arg_3_0:addChild(arg_3_0.fogBatchNode[iter_3_0], 800)

		for iter_3_1, iter_3_2 in pairs(arg_3_0.mapLayer.areaFog[iter_3_0]) do
			local var_3_0, var_3_1 = arg_3_0.mapLayer.cityTable[iter_3_2].sprite:getPosition()
			local var_3_2 = CCSprite:createWithSpriteFrameName("worldForg_small.png")

			var_3_2:setScale(0.27)
			arg_3_0:setPosInThumbnail(var_3_2, var_3_0, var_3_1)

			local var_3_3, var_3_4 = var_3_2:getPosition()

			var_3_2:setPosition(ccp(var_3_3 - arg_3_0.uiTable.bg:getContentSize().width * 0.5, var_3_4 - arg_3_0.uiTable.bg:getContentSize().height * 0.5))
			arg_3_0.fogBatchNode[iter_3_0]:addChild(var_3_2)
		end

		if iter_3_0 < arg_3_0.control.data.areaId then
			arg_3_0.fogBatchNode[iter_3_0]:setVisible(false)
		end
	end
end

function var_0_0.setPosInThumbnail(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	arg_4_1:setPosition(arg_4_2 / 6000 * 225 + 8, arg_4_3 / 3600 * 135 + 8)
end

function var_0_0.updateThumbnail(arg_5_0)
	arg_5_0.uiTable.bg:removeAllChildrenWithCleanup(true)

	for iter_5_0, iter_5_1 in pairs(arg_5_0.control.data.cities) do
		if arg_5_0.mapLayer.cityTable and arg_5_0.mapLayer.cityTable[iter_5_1.cityId] then
			local var_5_0, var_5_1 = arg_5_0.mapLayer.cityTable[iter_5_1.cityId].sprite:getPosition()

			if iter_5_1.status == 0 then
				-- block empty
			elseif iter_5_1.status == 1 then
				local var_5_2 = CCSprite:createWithSpriteFrameName("cdsh_icon_zhandoushanguang.png")

				arg_5_0:setPosInThumbnail(var_5_2, var_5_0, var_5_1)

				local var_5_3 = CCScaleTo:create(0.5, 0.5)
				local var_5_4 = CCCallFuncN:create(function()
					var_5_2:setScale(1)
				end)
				local var_5_5 = CCArray:create()

				var_5_5:addObject(var_5_4)
				var_5_5:addObject(var_5_3)
				var_5_5:addObject(CCDelayTime:create(0.5))
				var_5_2:runAction(CCRepeatForever:create(tolua.cast(CCSequence:create(var_5_5), "CCActionInterval")))
				arg_5_0.uiTable.bg:addChild(var_5_2)

				local var_5_6 = CCSprite:createWithSpriteFrameName("cdsh_icon_wu.png")

				arg_5_0:setPosInThumbnail(var_5_6, var_5_0, var_5_1)
				arg_5_0.uiTable.bg:addChild(var_5_6)
			elseif iter_5_1.status == 2 then
				local var_5_7 = CCSprite:createWithSpriteFrameName("cdsh_icon_shu.png")

				arg_5_0:setPosInThumbnail(var_5_7, var_5_0, var_5_1)
				arg_5_0.uiTable.bg:addChild(var_5_7)
			end
		end
	end

	local var_5_8 = arg_5_0.mapLayer.cityTable[arg_5_0.control.data.location]

	if var_5_8 == nil then
		return
	end

	local var_5_9, var_5_10 = var_5_8.sprite:getPosition()
	local var_5_11 = CCSprite:createWithSpriteFrameName("cdsh_icon_wei.png")

	arg_5_0:setPosInThumbnail(var_5_11, var_5_9, var_5_10)
	arg_5_0.uiTable.bg:addChild(var_5_11)
	arg_5_0:updateFog()
end

function var_0_0.updateFrame(arg_7_0)
	local var_7_0 = arg_7_0.mapLayer:getContentOffset()

	arg_7_0.frame:setPosition(-var_7_0.x / 6000 * 201 + 36 + visibleSize.width - 125 - arg_7_0.uiTable.bg:getContentSize().width * 0.5, -var_7_0.y / 3600 * 123 + 25 + visibleSize.height - 125 - arg_7_0.uiTable.bg:getContentSize().height * 0.5)
end

function var_0_0.updateFog(arg_8_0)
	for iter_8_0 = 1, 3 do
		if iter_8_0 < arg_8_0.control.data.areaId then
			arg_8_0.fogBatchNode[iter_8_0]:setVisible(false)
		end
	end
end

return var_0_0
