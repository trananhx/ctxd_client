require("lua/component/timerLabel")
tool.requireRes("world/thumbnail")

worldThumbnailUI = {}
worldThumbnailUI.uiTable = {}
worldThumbnailUI.batchUiTable = {}
worldThumbnailUI.otherUiTable = {}
worldThumbnailUI.pointTable = {}
worldThumbnailUI.fireTable = {}

local var_0_0 = worldThumbnailControl
local var_0_1 = worldThumbnailConstant
local var_0_2 = {
	"map_sma_yb.png",
	"map_sma_mc.png",
	"map_sma_ls.png",
	"map_sma_bt.png",
	"map_sma_jy.png",
	"map_sma_bs.png",
	"map_sma_fyss.png",
	"map_sma_xtys.png",
	"map_sma_sjjb.png",
	"map_sma_tf.png",
	"map_sma_lb.png",
	"map_sma_ms.png",
	"map_sma_sdhd.png",
	"map_sma_tdxy.png",
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	"map_sma_silk.png",
	"map_sma_nr.png",
	"map_sma_jiu.png",
	"map_sma_jiu.png",
	"map_sma_jiu.png",
	"map_sma_jiu.png",
	"map_sma_ss.png",
	[100001] = "map_sma_jzc1.png",
	[100002] = "map_sma_jzc2.png"
}

worldThumbnailUI.autoBattleMask = nil
worldThumbnailUI.abSprite = nil
worldThumbnailUI.abSpriteLight = nil

local function var_0_3(arg_1_0)
	local var_1_0 = tolua.cast(arg_1_0:getChildByTag(var_0_1.THUMBNAIL_BOARD_BATCHNODE_TAG), "CCSpriteBatchNode")

	var_1_0:removeAllChildrenWithCleanup(true)
	var_1_0:setPosition(ccp(0, 0))
	var_1_0:setContentSize(visibleSize)

	worldThumbnailUI.batchUiTable = autoUI.initUI(var_1_0, getBatchNodeData())

	for iter_1_0, iter_1_1 in pairs(worldThumbnailUI.otherUiTable) do
		pcall(iter_1_1.removeFromParentAndCleanup, iter_1_1, true)

		worldThumbnailUI.otherUiTable[iter_1_0] = nil
	end

	worldThumbnailUI.otherUiTable = autoUI.initUI(arg_1_0, getOtherData())

	worldThumbnailUI.otherUiTable.drawButton:registerScriptTapHandler(var_0_0.drawCountryReward)

	worldThumbnailUI.fireTable = {}

	local var_1_1 = worldThumbnailUI.batchUiTable.thumbnail:getPositionX() - worldThumbnailUI.batchUiTable.thumbnail:getContentSize().width / 2
	local var_1_2 = worldThumbnailUI.batchUiTable.thumbnail:getPositionY() - worldThumbnailUI.batchUiTable.thumbnail:getContentSize().height / 2

	for iter_1_2, iter_1_3 in pairs(var_0_0.C.cityTable) do
		if iter_1_3 == nil or iter_1_3.prop == nil then
			-- block empty
		else
			local var_1_3 = iter_1_3.prop
			local var_1_4 = iter_1_3.info
			local var_1_5 = tonumber(var_1_3[2])
			local var_1_6 = tonumber(var_1_3[3])
			local var_1_7

			if var_1_5 == 0 then
				var_1_7 = CCSprite:createWithSpriteFrameName("thumbnailDian1.png")
			elseif var_1_5 == 1 then
				var_1_7 = CCSprite:createWithSpriteFrameName("thumbnailDian3.png")
			elseif var_1_5 == 2 then
				var_1_7 = CCSprite:createWithSpriteFrameName("thumbnailDian2.png")
			elseif var_1_5 == 3 then
				var_1_7 = CCSprite:createWithSpriteFrameName("thumbnailDian5.png")
			elseif var_1_5 == 106 then
				var_1_7 = CCSprite:createWithSpriteFrameName("thumbnailDian6.png")
			elseif var_1_5 == 104 then
				var_1_7 = CCSprite:createWithSpriteFrameName("thumbnailDian6.png")
			elseif var_1_5 == 1001 then
				var_1_7 = CCSprite:createWithSpriteFrameName("thumbnailDian6.png")
			elseif var_1_5 > 100 then
				var_1_7 = CCSprite:createWithSpriteFrameName("thumbnailDian4.png")
			end

			if var_1_6 == 1 then
				local var_1_8 = CCSprite:createWithSpriteFrameName("thumbnailQuan2.png")

				worldThumbnailUI.fireTable["cityId_" .. var_1_3[1]] = {}
				worldThumbnailUI.fireTable["cityId_" .. var_1_3[1]].sprite = var_1_8

				var_1_8:setPosition(ccp(var_1_7:getContentSize().width / 2, var_1_7:getContentSize().height / 2))

				local var_1_9 = CCScaleTo:create(0.4, 0.3)
				local var_1_10 = CCCallFuncN:create(function()
					var_1_8:setScale(1)
				end)
				local var_1_11 = CCArray:create()

				var_1_11:addObject(var_1_10)
				var_1_11:addObject(var_1_9)
				var_1_11:addObject(CCDelayTime:create(0.5))
				var_1_8:runAction(CCRepeatForever:create(tolua.cast(CCSequence:create(var_1_11), "CCActionInterval")))
				var_1_7:addChild(var_1_8, -1)
			end

			local var_1_12 = var_1_7:getContentSize()
			local var_1_13 = var_1_4.x
			local var_1_14 = var_0_0.C.height - var_1_4.y
			local var_1_15, var_1_16 = var_1_13 / var_0_0.C.width * 660, var_1_14 / var_0_0.C.height * 396

			var_1_7:setPosition(ccp(var_1_1 + var_1_15 + var_1_12.width / 3 * 2, var_1_2 + var_1_16 - var_1_12.height / 2))
			var_1_0:addChild(var_1_7, 102)

			worldThumbnailUI.pointTable["thumbnail_point_" .. var_1_3[1]] = var_1_7

			local var_1_17 = worldControl.thumbnailIconTable["city_" .. var_1_3[1]]

			if var_1_17 then
				local var_1_18 = tonumber(var_1_17)
				local var_1_19 = var_0_2[var_1_18]

				if var_1_19 then
					local var_1_20 = CCSprite:createWithSpriteFrameName(var_1_19)

					var_1_20:setPosition(ccp(var_1_7:getPosition()))

					if var_1_18 == 55 then
						var_1_20:setScale(0.6)
					elseif var_1_18 == 56 then
						var_1_20:setScale(0.7)
					elseif var_1_18 == 57 then
						var_1_20:setScale(0.7)
					elseif var_1_18 == 58 then
						var_1_20:setScale(0.7)
					elseif var_1_18 == 59 then
						var_1_20:setScale(0.7)
					elseif var_1_18 == 60 then
						var_1_20:setScale(0.7)
					end

					var_1_0:addChild(var_1_20, 103)
				end
			end

			if user.player.hasMzLeague and user.player.hasMzLeague[tonumber(var_1_3[1])] then
				local var_1_21 = CCSprite:createWithSpriteFrameName("map_sma_manzu.png")

				var_1_21:setPosition(ccp(var_1_7:getPosition()))
				var_1_21:setScale(0.6)
				var_1_0:addChild(var_1_21, 103)
			end

			if user.autoBattleCityId and user.autoBattleCityId == tonumber(var_1_3[1]) then
				local var_1_22
				local var_1_23 = var_1_5 == user.player.forceId and "city_js" or "city_xz"
				local var_1_24 = CCSprite:createWithSpriteFrameName(string.format("%s_a.png", var_1_23))
				local var_1_25 = CCSprite:createWithSpriteFrameName(string.format("%s_c.png", var_1_23))
				local var_1_26 = CCFadeIn:create(0.3)
				local var_1_27 = var_1_26:reverse()
				local var_1_28 = CCSequence:createWithTwoActions(var_1_26, var_1_27)

				var_1_25:runAction(CCRepeatForever:create(var_1_28))

				local var_1_29 = smgr.getLayer("thumbnailLayer")
				local var_1_30, var_1_31 = var_1_7:getPosition()

				var_1_24:setPosition(ccp(var_1_30, var_1_31))
				var_1_25:setPosition(ccp(var_1_30, var_1_31))
				var_1_29:addChild(var_1_25, 103)
				var_1_29:addChild(var_1_24, 104)

				worldThumbnailUI.abSprite = var_1_24
				worldThumbnailUI.abSpriteLight = var_1_25
				worldThumbnailUI.autoBattleMask = CCLayerColor:create(ccc4(0, 0, 0, 102))

				worldThumbnailUI.autoBattleMask:setContentSize(CCSizeMake(660, 396))
				worldThumbnailUI.autoBattleMask:setPosition(ccp(visibleSize.width / 2 + 35 - 330, visibleSize.height / 2 - 198))
				var_1_29:addChild(worldThumbnailUI.autoBattleMask, 102)
			end

			if worldConstant.FROG_CITY["frogCity_" .. var_1_3[1]] and tonumber(var_1_3[6]) == 0 then
				local var_1_32 = CCSprite:createWithSpriteFrameName("worldForg_small.png")

				var_1_32:setScale(0.8)
				var_1_32:setPosition(ccp(var_1_7:getPosition()))
				var_1_0:addChild(var_1_32, 113)
			end
		end
	end

	if user.mode == 2 and user.district >= 1 and user.district <= 7 then
		local var_1_33 = smgr.getLayer("thumbnailLayer")
		local var_1_34 = {
			ccp(134, 197),
			ccp(176, 315),
			ccp(442, 302),
			ccp(326, 208),
			ccp(288, 81),
			ccp(528, 222),
			ccp(489, 105)
		}
		local var_1_35 = CCSprite:create("res/ui/world/autoBattle/zdzd_map_mask_" .. user.district .. ".png")

		var_1_35:setPosition(var_1_1 + var_1_34[user.district].x, var_1_2 + var_1_34[user.district].y)
		var_1_33:addChild(var_1_35, 103)

		worldThumbnailUI.districtMask = var_1_35
	end
end

function worldThumbnailUI.setThumbnailFire(arg_3_0, arg_3_1)
	if not var_0_0.visible then
		return
	end

	if not worldThumbnailUI.fireTable["cityId_" .. arg_3_0] then
		worldThumbnailUI.fireTable["cityId_" .. arg_3_0] = {}
	end

	local var_3_0 = worldThumbnailUI.fireTable["cityId_" .. arg_3_0].sprite

	worldThumbnailUI.fireTable["cityId_" .. arg_3_0] = {}

	local var_3_1 = worldThumbnailUI.pointTable["thumbnail_point_" .. arg_3_0]

	if var_3_0 then
		pcall(var_3_0.removeFromParentAndCleanup, var_3_0, true)
	end

	if arg_3_1 == 1 and var_3_1 then
		local var_3_2 = CCSprite:createWithSpriteFrameName("thumbnailQuan2.png")

		worldThumbnailUI.fireTable["cityId_" .. arg_3_0].sprite = var_3_2

		var_3_2:setPosition(ccp(var_3_1:getContentSize().width / 2, var_3_1:getContentSize().height / 2))

		local var_3_3 = CCScaleTo:create(0.4, 0.3)
		local var_3_4 = CCCallFuncN:create(function()
			var_3_2:setScale(1)
		end)
		local var_3_5 = CCArray:create()

		var_3_5:addObject(var_3_4)
		var_3_5:addObject(var_3_3)
		var_3_5:addObject(CCDelayTime:create(0.5))
		var_3_2:runAction(CCRepeatForever:create(tolua.cast(CCSequence:create(var_3_5), "CCActionInterval")))
		var_3_1:addChild(var_3_2, -1)
	end
end

function worldThumbnailUI.setThumbnailPointBelong(arg_5_0, arg_5_1)
	if not var_0_0.visible then
		return
	end

	local var_5_0 = worldThumbnailUI.pointTable["thumbnail_point_" .. arg_5_0]

	if var_5_0 then
		local var_5_1 = CCSpriteFrameCache:sharedSpriteFrameCache()
		local var_5_2

		if tonumber(arg_5_1) == 1 then
			var_5_2 = "thumbnailDian3.png"
		elseif tonumber(arg_5_1) == 2 then
			var_5_2 = "thumbnailDian2.png"
		elseif tonumber(arg_5_1) == 3 then
			var_5_2 = "thumbnailDian5.png"
		elseif tonumber(arg_5_1) == 106 then
			var_5_2 = "thumbnailDian6.png"
		elseif tonumber(arg_5_1) == 104 then
			var_5_2 = "thumbnailDian6.png"
		elseif tonumber(arg_5_1) > 100 then
			var_5_2 = "thumbnailDian4.png"
		end

		if var_5_2 ~= nil then
			local var_5_3 = var_5_1:spriteFrameByName(var_5_2)

			var_5_0:setDisplayFrame(var_5_3)
		end
	end
end

function worldThumbnailUI.setThumbnailVisible(arg_6_0)
	if not arg_6_0 then
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.showNotice()
	else
		amgr.playEffect(enumAudioFile.ui_dialog_open)
		smgr.hideNotice()
	end

	if worldThumbnailUI.autoBattleMask and not tolua.isnull(worldThumbnailUI.autoBattleMask) then
		worldThumbnailUI.autoBattleMask:removeFromParentAndCleanup(true)
	end

	worldThumbnailUI.autoBattleMask = nil

	if worldThumbnailUI.districtMask and not tolua.isnull(worldThumbnailUI.districtMask) then
		worldThumbnailUI.districtMask:removeFromParentAndCleanup(true)
	end

	worldThumbnailUI.districtMask = nil

	if worldThumbnailUI.abSprite and not tolua.isnull(worldThumbnailUI.abSprite) then
		worldThumbnailUI.abSprite:removeFromParentAndCleanup(true)
	end

	worldThumbnailUI.abSprite = nil

	if worldThumbnailUI.abSpriteLight and not tolua.isnull(worldThumbnailUI.abSpriteLight) then
		worldThumbnailUI.abSpriteLight:removeFromParentAndCleanup(true)
	end

	worldThumbnailUI.abSpriteLight = nil

	local var_6_0 = smgr.getLayer("thumbnailLayer")
	local var_6_1

	eventManager.dispatchEvent("rightMenuSetVisible", not arg_6_0)
	log.info("dispatchEvent hourRankSetVisible")
	eventManager.dispatchEvent("hourRankSetVisible", not arg_6_0)

	if arg_6_0 == true then
		var_0_0.getGeneralSimpleInfo()

		var_6_1 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("thumbnailOpen.png")

		var_0_0.C.scrollLayer:setTouchEnabled(false)

		local var_6_2 = var_6_0:getChildByTag(var_0_1.THUMBNAIL_BOARD_TAG)

		if var_6_2 then
			var_6_2 = tolua.cast(var_6_2, "CCLayer")

			var_0_3(var_6_2)
			var_6_2:setVisible(true)
		else
			var_6_2 = createBaseLayer()

			local var_6_3 = CCSpriteBatchNode:create("res/ui/world/thumbnail.png", 400)

			var_6_2:addChild(var_6_3, 100, var_0_1.THUMBNAIL_BOARD_BATCHNODE_TAG)
			var_0_3(var_6_2)
			var_6_0:addChild(var_6_2, 101, var_0_1.THUMBNAIL_BOARD_TAG)
		end

		worldThumbnailUI.leftTimeLabel = createTimerLabel(worldControl.leftTime, "@M:@S", "Thonburi-Bold", 22, nil, nil, nil, ccc3(255, 0, 0))

		if conf.language == "vie" then
			worldThumbnailUI.leftTimeLabel:setPosition(ccp(worldThumbnailUI.otherUiTable.nextLabel:getPositionX() + 80 - 30, worldThumbnailUI.otherUiTable.nextLabel:getPositionY() - 20))
			var_6_2:addChild(worldThumbnailUI.leftTimeLabel, 101)
		else
			worldThumbnailUI.leftTimeLabel:setPosition(ccp(worldThumbnailUI.otherUiTable.nextLabel:getPositionX() + 80 - 30, worldThumbnailUI.otherUiTable.nextLabel:getPositionY()))
			var_6_2:addChild(worldThumbnailUI.leftTimeLabel, 101)
		end

		worldThumbnailUI.shotAt(nil, nil)
		var_0_0.getRewardInfo()
	else
		var_6_1 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("thumbnailClose.png")

		var_0_0.C.scrollLayer:setTouchEnabled(true)

		local var_6_4 = var_6_0:getChildByTag(var_0_1.THUMBNAIL_BOARD_TAG)

		if var_6_4 then
			local var_6_5 = tolua.cast(var_6_4, "CCLayer")

			var_6_5:setVisible(false)
			var_6_5:removeChild(worldThumbnailUI.leftTimeLabel, true)

			worldThumbnailUI.leftTimeLabel = nil
		end
	end

	worldThumbnailUI.uiTable.thumbnailButton:setDisplayFrame(var_6_1)

	var_0_0.visible = arg_6_0
end

function worldThumbnailUI.initMilitaryUI()
	local var_7_0 = smgr.getLayer("thumbnailLayer"):getChildByTag(var_0_1.THUMBNAIL_BOARD_TAG)
	local var_7_1 = var_7_0:getChildByTag(var_0_1.THUMBNAIL_BOARD_BATCHNODE_TAG)

	if var_7_0 and var_7_0:isVisible() then
		local var_7_2 = var_7_0:getChildByTag(var_0_1.GENERAL_BOARD_TAG)

		if not var_7_2 then
			var_7_2 = CCLayer:create()

			var_7_0:addChild(var_7_2, 105)
		end

		for iter_7_0, iter_7_1 in pairs(var_0_0.generalTable) do
			local var_7_3 = iter_7_1.sprite

			pcall(var_7_3.removeFromParentAndCleanup, var_7_3, true)
		end

		var_0_0.generalTable = {}

		local var_7_4 = visibleSize.width / 2 + 430 - 3
		local var_7_5 = visibleSize.height / 2 + 140 + 12 + 13

		for iter_7_2, iter_7_3 in pairs(var_0_0.military) do
			var_0_0.generalTable["general_" .. iter_7_3.generalId] = {}

			log.info("init control.generalTable[%s]", "general_" .. iter_7_3.generalId)

			local var_7_6 = var_7_4
			local var_7_7 = var_7_5 - 83 * (iter_7_2 - 1)

			var_0_0.generalTable["general_" .. iter_7_3.generalId].info = iter_7_3

			local var_7_8 = CCSprite:createWithSpriteFrameName("thumbnailWujiangkuang.png")

			var_7_8:setPosition(ccp(var_7_6, var_7_7))
			var_7_1:addChild(var_7_8, 101)

			local var_7_9 = CCSprite:createWithSpriteFrameName("thumbnailWujiangkuang1.png")

			var_0_0.generalTable["general_" .. iter_7_3.generalId].highlight = var_7_9

			var_7_9:setVisible(iter_7_2 == 1 and true or false)
			var_7_9:setPosition(ccp(var_7_6, var_7_7))
			var_7_1:addChild(var_7_9, 102)

			local var_7_10 = CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", iter_7_3.pic))

			var_0_0.generalTable["general_" .. iter_7_3.generalId].sprite = var_7_10

			var_7_10:setPosition(ccp(var_7_6, var_7_7))
			var_7_2:addChild(var_7_10)

			if iter_7_2 == 1 then
				worldThumbnailUI.showLocationAt(iter_7_3.generalLocationId)
			end
		end

		for iter_7_4, iter_7_5 in pairs(user.corpsInfo) do
			if iter_7_5.forceId and iter_7_5.locationId then
				worldThumbnailUI.showJuntuanLocationAt(iter_7_5.forceId, iter_7_5.locationId)
			end
		end
	end
end

function worldThumbnailUI.showLocationAt(arg_8_0)
	local var_8_0 = smgr.getLayer("thumbnailLayer"):getChildByTag(var_0_1.THUMBNAIL_BOARD_TAG):getChildByTag(var_0_1.THUMBNAIL_BOARD_BATCHNODE_TAG)
	local var_8_1 = var_8_0:getChildByTag(var_0_1.LOCATION_HINT_TAG)

	if var_8_1 then
		var_8_0:removeChild(var_8_1, true)
	end

	local var_8_2 = CCSprite:createWithSpriteFrameName("thumbnailQuan1.png")
	local var_8_3 = CCScaleTo:create(0.4, 0.3)
	local var_8_4 = CCCallFuncN:create(function()
		var_8_2:setScale(1)
	end)
	local var_8_5 = CCArray:create()

	var_8_5:addObject(var_8_4)
	var_8_5:addObject(var_8_3)
	var_8_5:addObject(CCDelayTime:create(0.5))
	var_8_2:runAction(CCRepeatForever:create(tolua.cast(CCSequence:create(var_8_5), "CCActionInterval")))

	local var_8_6 = var_0_0.C.cityTable["world_building_" .. arg_8_0].info
	local var_8_7 = var_0_0.C.cityTable["world_building_" .. arg_8_0].prop
	local var_8_8 = worldThumbnailUI.batchUiTable.thumbnail:getPositionX() - worldThumbnailUI.batchUiTable.thumbnail:getContentSize().width / 2
	local var_8_9 = worldThumbnailUI.batchUiTable.thumbnail:getPositionY() - worldThumbnailUI.batchUiTable.thumbnail:getContentSize().height / 2
	local var_8_10 = var_8_2:getContentSize()
	local var_8_11 = var_8_6.x
	local var_8_12 = var_0_0.C.height - var_8_6.y
	local var_8_13 = var_8_11 / var_0_0.C.width * 660, var_8_12 / var_0_0.C.height * 396
	local var_8_14 = worldThumbnailUI.pointTable["thumbnail_point_" .. var_8_7[1]]

	var_8_2:setPosition(ccp(var_8_14:getPosition()))
	var_8_0:addChild(var_8_2, 103, var_0_1.LOCATION_HINT_TAG)
end

function worldThumbnailUI.showJuntuanLocationAt(arg_10_0, arg_10_1)
	local var_10_0 = smgr.getLayer("thumbnailLayer"):getChildByTag(var_0_1.THUMBNAIL_BOARD_TAG)

	if var_10_0 == nil then
		return
	end

	local var_10_1 = var_10_0:getChildByTag(var_0_1.THUMBNAIL_BOARD_BATCHNODE_TAG)
	local var_10_2 = var_10_1:getChildByTag(var_0_1.LOCATION_JUNTUAN_TAG + arg_10_0)

	if var_10_2 then
		var_10_1:removeChild(var_10_2, true)
	end

	local var_10_3 = CCSprite:createWithSpriteFrameName("jt_map_flag_" .. arg_10_0 .. ".png")
	local var_10_4 = CCScaleTo:create(0.4, 0.7)
	local var_10_5 = CCCallFuncN:create(function()
		var_10_3:setScale(1)
	end)
	local var_10_6 = CCArray:create()

	var_10_6:addObject(var_10_5)
	var_10_6:addObject(var_10_4)
	var_10_6:addObject(CCDelayTime:create(0.5))
	var_10_3:runAction(CCRepeatForever:create(tolua.cast(CCSequence:create(var_10_6), "CCActionInterval")))

	local var_10_7 = var_0_0.C.cityTable["world_building_" .. arg_10_1].info
	local var_10_8 = var_0_0.C.cityTable["world_building_" .. arg_10_1].prop
	local var_10_9 = worldThumbnailUI.batchUiTable.thumbnail:getPositionX() - worldThumbnailUI.batchUiTable.thumbnail:getContentSize().width / 2
	local var_10_10 = worldThumbnailUI.batchUiTable.thumbnail:getPositionY() - worldThumbnailUI.batchUiTable.thumbnail:getContentSize().height / 2
	local var_10_11 = var_10_3:getContentSize()
	local var_10_12 = var_10_7.x
	local var_10_13 = var_0_0.C.height - var_10_7.y
	local var_10_14 = var_10_12 / var_0_0.C.width * 660, var_10_13 / var_0_0.C.height * 396
	local var_10_15 = worldThumbnailUI.pointTable["thumbnail_point_" .. var_10_8[1]]

	var_10_3:setPosition(ccp(var_10_15:getPosition()))
	var_10_1:addChild(var_10_3, 105, var_0_1.LOCATION_JUNTUAN_TAG + arg_10_0)
end

function worldThumbnailUI.shotAt(arg_12_0, arg_12_1)
	local var_12_0 = smgr.getLayer("thumbnailLayer"):getChildByTag(var_0_1.THUMBNAIL_BOARD_TAG)
	local var_12_1 = var_12_0:getChildByTag(worldThumbnailConstant.SHOT_TAG)

	if var_12_1 == nil then
		var_12_1 = CCScale9Sprite:createWithSpriteFrameName("thumbnailKuang.png", CCRectMake(5, 5, 136, 71))

		var_12_1:setPreferredSize(CCSizeMake(visibleSize.width * 0.11, visibleSize.height * 0.11))
		var_12_0:addChild(var_12_1, 104, worldThumbnailConstant.SHOT_TAG)
	end

	local var_12_2 = var_12_1:getContentSize()
	local var_12_3 = worldThumbnailUI.batchUiTable.thumbnail
	local var_12_4 = var_12_3:getContentSize().width
	local var_12_5 = var_12_3:getContentSize().height
	local var_12_6 = var_12_3:getPositionX() - var_12_4 / 2
	local var_12_7 = var_12_3:getPositionY() - var_12_5 / 2
	local var_12_8 = var_12_2.width
	local var_12_9 = var_12_2.height

	if arg_12_0 == nil or arg_12_1 == nil then
		local var_12_10 = var_0_0.C.scrollLayer:getContentOffset()
		local var_12_11 = -var_12_10.x + visibleSize.width / 2
		local var_12_12 = -var_12_10.y + visibleSize.height / 2

		arg_12_0, arg_12_1 = var_12_11 * 0.11 + var_12_6, var_12_12 * 0.11 + var_12_7
	end

	if arg_12_0 < var_12_6 + var_12_8 / 2 then
		arg_12_0 = var_12_6 + var_12_8 / 2
	end

	if arg_12_1 < var_12_7 + var_12_9 / 2 then
		arg_12_1 = var_12_7 + var_12_9 / 2
	end

	if arg_12_0 > var_12_6 + var_12_4 - var_12_8 / 2 then
		arg_12_0 = var_12_6 + var_12_4 - var_12_8 / 2
	end

	if arg_12_1 > var_12_7 + var_12_5 - var_12_9 / 2 then
		arg_12_1 = var_12_7 + var_12_5 - var_12_9 / 2
	end

	var_12_1:setPosition(ccp(arg_12_0, arg_12_1))

	local var_12_13 = (arg_12_0 - var_12_6) / 660 * var_0_0.C.width
	local var_12_14 = (arg_12_1 - var_12_7) / 396 * var_0_0.C.height

	eventManager.dispatchEvent("moveWorldMapTo", var_12_13, var_12_14)
end

function worldThumbnailUI.initBasicUI()
	local var_13_0 = smgr.getLayer("thumbnailLayer")

	worldThumbnailUI.uiTable = autoUI.initUI(var_13_0, getUiData())
end

function worldThumbnailUI.updateEventNum()
	if not worldControl.thumbnailIconTable then
		return
	end

	local var_14_0 = (function(arg_15_0)
		local var_15_0 = 0

		for iter_15_0, iter_15_1 in pairs(arg_15_0) do
			var_15_0 = var_15_0 + 1
		end

		return var_15_0
	end)(worldControl.thumbnailIconTable)

	log.info("worldThumbnailUI.updateEventNum,%s", var_14_0)

	if var_14_0 == 0 then
		worldThumbnailUI.uiTable.eventNumCor:setVisible(false)
	else
		worldThumbnailUI.uiTable.eventNumCor:setVisible(true)
		worldThumbnailUI.uiTable.eventNum:setString(tostring(var_14_0))
	end
end

function worldThumbnailUI.checkLeagueInfo()
	log.info("小地图结盟标志")
	showTable(worldControl.league)

	if worldControl.league then
		if worldControl.league.type == 1 then
			worldThumbnailUI.uiTable.leagueInfo:setVisible(true)

			if worldControl.league.second < worldControl.league.third then
				worldThumbnailUI.uiTable.leagueInfo:setDisplayFrame(CCSprite:create("res/ui/world/league/league_" .. worldControl.league.second .. "_" .. worldControl.league.third .. "_flag.png"):displayFrame())
			else
				worldThumbnailUI.uiTable.leagueInfo:setDisplayFrame(CCSprite:create("res/ui/world/league/league_" .. worldControl.league.third .. "_" .. worldControl.league.second .. "_flag.png"):displayFrame())
			end
		elseif worldControl.league.type == 2 then
			worldThumbnailUI.uiTable.leagueInfo:setVisible(true)

			if worldControl.league.first < worldControl.league.second then
				worldThumbnailUI.uiTable.leagueInfo:setDisplayFrame(CCSprite:create("res/ui/world/league/shuangxiong_" .. worldControl.league.first .. "_" .. worldControl.league.second .. "_flag.png"):displayFrame())
			else
				worldThumbnailUI.uiTable.leagueInfo:setDisplayFrame(CCSprite:create("res/ui/world/league/shuangxiong_" .. worldControl.league.second .. "_" .. worldControl.league.first .. "_flag.png"):displayFrame())
			end
		end
	end
end

function worldThumbnailUI.show(arg_17_0)
	var_0_0.C = arg_17_0

	local var_17_0 = createBaseLayer()

	smgr.registerLayer(var_17_0, "thumbnailLayer")

	var_17_0.onEnter = var_0_0.onEnter
	var_17_0.onExit = var_0_0.onExit

	worldThumbnailUI.initBasicUI()
	var_17_0:setTouchEnabled(true)
	var_17_0:registerScriptTouchHandler(var_0_0.onTouch)

	return var_17_0
end
