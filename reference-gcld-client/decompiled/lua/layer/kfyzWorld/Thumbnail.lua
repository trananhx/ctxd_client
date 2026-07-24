local var_0_0 = {
	"thumbnailDian3.png",
	"thumbnailDian2.png",
	"thumbnailDian5.png",
	"thumbnailDian4.png",
	[1003] = "thumbnailDian6.png",
	[1001] = "thumbnailDian6.png",
	[1002] = "thumbnailDian6.png"
}
local var_0_1 = class("Thumbnail", function()
	return createBaseLayer()
end)

local function var_0_2(arg_2_0)
	local var_2_0 = ({
		350,
		285,
		220,
		85
	})[arg_2_0]
	local var_2_1 = arg_2_0 <= 3 and "kfyz_world_pb_def.png" or "kfyz_world_pb_att.png"
	local var_2_2 = {
		"zymz_pb_wei.png",
		"zymz_pb_shu.png",
		"zymz_pb_wu.png",
		"zymz_pb_zheng.png"
	}
	local var_2_3 = var_2_2[arg_2_0]
	local var_2_4 = arg_2_0 <= 3 and "kfyz_word_gpjw.png" or "kfyz_word_yzsl.png"

	if user.jpsIndex ~= 0 and arg_2_0 == 1 then
		if user.isKfdy then
			var_2_1 = "yzdy_world_icon_ying.png"
			var_2_3 = var_2_2[4]
		elseif user.isKfgl then
			var_2_3 = var_2_2[4]
		elseif user.isKfyn then
			var_2_3 = var_2_2[4]
		end
	end

	local var_2_5 = {
		x = 20,
		type = "sprite",
		visible = false,
		scale = 0.75,
		name = "icon" .. arg_2_0,
		y = var_2_0,
		pic = {
			path = "res/ui/kfyz/" .. var_2_1
		},
		children = {
			{
				y = 40,
				type = "progressbar",
				zorder = -1,
				visible = false,
				x = 46,
				name = "bar" .. arg_2_0 .. 1,
				anchorPoint = ccp(0, 0.5),
				pic = {
					path = "res/ui/kfyz/kfyz_world_pb.png"
				},
				children = {
					{
						h = 60,
						type = "button",
						w = 190,
						y = -25,
						x = 0,
						name = "btn_tip" .. arg_2_0,
						normal = {
							path = "res/default.png"
						},
						touched = {
							path = "res/default.png"
						},
						anchorPoint = ccp(0, 0)
					},
					{
						y = -9,
						type = "sprite",
						x = -4,
						anchorPoint = ccp(0, 0.5),
						pic = {
							path = "res/ui/world/manzu/zymz_pb_bg.png"
						}
					},
					{
						y = -9,
						type = "progressbar",
						x = -4,
						name = "bar" .. arg_2_0 .. 2,
						anchorPoint = ccp(0, 0.5),
						pic = {
							path = "res/ui/kfyz/" .. var_2_3
						}
					},
					{
						y = 5.0001,
						type = "sprite",
						x = 35,
						name = "army" .. arg_2_0 .. 1,
						pic = {
							path = "res/ui/kfyz/kfyz_icon_yu.png"
						}
					},
					{
						y = 5,
						type = "sprite",
						x = 93,
						name = "army" .. arg_2_0 .. 2,
						pic = {
							path = "res/ui/kfyz/kfyz_icon_min.png"
						}
					}
				}
			},
			{
				type = "sprite",
				y = 26,
				visible = false,
				x = 120,
				zorder = -1,
				name = "bg_fail" .. arg_2_0,
				pic = {
					path = "res/ui/kfyz/kfyz_word_bg.png"
				},
				children = {
					{
						y = 32,
						x = 135,
						type = "sprite",
						pic = {
							path = "res/ui/kfyz/" .. var_2_4
						}
					}
				}
			}
		}
	}

	if user.jpsIndex == 0 and arg_2_0 <= 3 then
		table.insert(var_2_5.children, {
			fontSize = 25,
			y = 31,
			type = "label",
			x = 30,
			name = "nationName" .. arg_2_0,
			color = colorForce[arg_2_0]
		})
	end

	return var_2_5
end

var_0_1.layout = {
	y = 0,
	name = "panel",
	type = "node",
	x = 0,
	children = {
		{
			w = 84,
			name = "btn_map",
			h = 84,
			type = "button",
			normal = {
				frame = true,
				path = "thumbnailClose.png"
			},
			touched = {
				frame = true,
				path = "thumbnailClose.png"
			},
			x = visibleSize.width - 50,
			y = visibleSize.height - 85
		},
		{
			type = "sprite",
			name = "icon_map",
			visible = false,
			x = visibleSize.width - 50,
			y = visibleSize.height - 85,
			pic = {
				frame = true,
				path = "thumbnailOpen.png"
			}
		},
		{
			type = "layer",
			name = "layer_map",
			y = 0,
			visible = false,
			x = 0,
			children = {
				{
					name = "bg_map",
					type = "sprite",
					x = visibleSize.width / 2,
					y = visibleSize.height / 2,
					pic = {
						frame = true,
						path = "thumbnailBackground.jpg"
					},
					children = {
						{
							y = 155,
							name = "icon_vs",
							type = "sprite",
							x = 90,
							pic = {
								path = "res/ui/kfzb/kfzbs_vs.png"
							}
						},
						var_0_2(1),
						var_0_2(2),
						var_0_2(3),
						var_0_2(4)
					}
				},
				{
					name = "map",
					type = "sprite",
					x = visibleSize.width / 2 + 35,
					y = visibleSize.height / 2,
					pic = {
						frame = true,
						path = "thumbnailXiaoditu.jpg"
					}
				}
			}
		}
	}
}
var_0_1.tipFrame = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(0, 0),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			height = 0,
			name = "tipMsg",
			type = "label",
			style = "label_warlock",
			width = 400,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = color_whi
		}
	}
}

function var_0_1.handlerGetWorldMapAction(arg_3_0, arg_3_1)
	arg_3_0:showPanel(arg_3_1.data)
end

function var_0_1.handlerGetSTaskInfoAction(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1.data

	arg_4_0.task = var_4_0

	if var_4_0.endurances then
		for iter_4_0, iter_4_1 in pairs(var_4_0.endurances) do
			local var_4_1 = 0

			if iter_4_1.forceId == 1 or iter_4_1.forceId == 2 or iter_4_1.forceId == 3 then
				var_4_1 = iter_4_1.forceId
			elseif user.kfyzWorldId ~= 9 and iter_4_1.forceId > 1000 then
				var_4_1 = 4
			elseif user.kfyzWorldId == 9 and (iter_4_1.forceId == user.player.kfgzForceId or iter_4_1.forceId - 1000 == user.player.kfgzForceId) then
				var_4_1 = 4
			end

			if var_4_1 > 0 and (user.jpsIndex == 0 or var_4_1 == 1 or var_4_1 == 4) then
				arg_4_0.view.widgets["icon" .. var_4_1]:setVisible(true)

				local var_4_2 = iter_4_1.endurance
				local var_4_3 = var_4_2 == 0
				local var_4_4 = arg_4_0.view.widgets["bar" .. var_4_1 .. 1]

				arg_4_0.view.widgets["bg_fail" .. var_4_1]:setVisible(var_4_3)
				var_4_4:setVisible(not var_4_3)

				if not var_4_3 then
					var_4_4:setPercentage(var_4_2)
					arg_4_0.view.widgets["bar" .. var_4_1 .. 2]:setPercentage(var_4_2)

					local var_4_5

					var_4_5 = var_4_0.attType == 1

					local var_4_6 = var_4_2 > 20 and var_4_2 <= 50
					local var_4_7 = var_4_2 > 50

					if user.jpsIndex > 0 then
						var_4_6 = false
						var_4_7 = false
					end

					arg_4_0.view.widgets["army" .. var_4_1 .. 1]:setVisible(var_4_6)
					arg_4_0.view.widgets["army" .. var_4_1 .. 2]:setVisible(var_4_7)
				end
			end
		end
	end
end

function var_0_1.handlerPushKfGeneralAction(arg_5_0, arg_5_1)
	if not arg_5_0.info then
		return
	end

	local var_5_0 = arg_5_1.data.directMove
	local var_5_1 = arg_5_1.data.hp
	local var_5_2
	local var_5_3

	if var_5_0 then
		var_5_2 = var_5_0.cityId
		var_5_3 = var_5_0.gid
	end

	if var_5_1 then
		var_5_2 = var_5_1.cityId
		var_5_3 = var_5_1.gid
	end

	if var_5_2 and var_5_3 then
		for iter_5_0, iter_5_1 in ipairs(arg_5_0.info.general) do
			if var_5_3 == iter_5_1.gid then
				iter_5_1.cityId = var_5_2

				break
			end
		end

		if var_5_3 == arg_5_0.info.general[arg_5_0.touchedBtnGeneral].gid then
			arg_5_0:showLocationAt(var_5_2)
		end
	end
end

function var_0_1.addGeneral(arg_6_0, arg_6_1)
	if arg_6_0.generalNode then
		arg_6_0.generalNode:removeAllChildrenWithCleanup(true)
	else
		arg_6_0.generalNode = CCNode:create()

		arg_6_0.view.widgets.bg_map:addChild(arg_6_0.generalNode)
	end

	local var_6_0 = 907
	local var_6_1 = 378

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.info.general) do
		local var_6_2 = var_6_0
		local var_6_3 = var_6_1 - 82 * (iter_6_0 - 1)
		local var_6_4 = CCControlButton:create(CCScale9Sprite:createWithSpriteFrameName("thumbnailWujiangkuang.png"))

		arg_6_0.generalNode:addChild(var_6_4)
		var_6_4:setBackgroundSpriteForState(CCScale9Sprite:createWithSpriteFrameName("thumbnailWujiangkuang1.png"), CCControlStateHighlighted)
		var_6_4:setAdjustBackgroundImage(false)
		var_6_4:setPosition(ccp(var_6_2, var_6_3))
		var_6_4:setZoomOnTouchDown(false)
		var_6_4:addHandleOfControlEvent(function()
			log.info("btn_general" .. iter_6_0)

			local var_7_0 = arg_6_0["btn_general" .. arg_6_0.touchedBtnGeneral]
			local var_7_1 = arg_6_0["btn_general" .. iter_6_0]

			if var_7_0 then
				var_7_0:setHighlighted(false)
			end

			if var_7_1 then
				var_7_1:setHighlighted(true)
			end

			arg_6_0:showLocationAt(iter_6_1.cityId)

			arg_6_0.touchedBtnGeneral = iter_6_0
		end, CCControlEventTouchUpInside)

		local var_6_5 = CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", iter_6_1.pic))

		var_6_5:setPosition(ccp(var_6_2, var_6_3))
		arg_6_0.generalNode:addChild(var_6_5)

		if iter_6_0 == 1 then
			arg_6_0.touchedBtnGeneral = 1

			var_6_4:setHighlighted(true)
			arg_6_0:showLocationAt(iter_6_1.cityId)
		end

		arg_6_0["btn_general" .. iter_6_0] = var_6_4
	end
end

function var_0_1.addPoint(arg_8_0)
	if arg_8_0.pointNode then
		arg_8_0.pointNode:removeAllChildrenWithCleanup(true)
	else
		arg_8_0.pointNode = CCSpriteBatchNode:create("res/ui/world/thumbnail.png", 400)

		arg_8_0.view.widgets.layer_map:addChild(arg_8_0.pointNode, 100)
	end

	arg_8_0.fireTable = {}
	arg_8_0.pointTable = {}

	local var_8_0 = arg_8_0.view.widgets.map
	local var_8_1 = var_8_0:getPositionX() - var_8_0:getContentSize().width / 2
	local var_8_2 = var_8_0:getPositionY() - var_8_0:getContentSize().height / 2

	for iter_8_0, iter_8_1 in pairs(arg_8_0.info.city) do
		local var_8_3 = var_0_0[iter_8_1.force] or var_0_0[4]

		if user.jpsIndex ~= 0 and iter_8_1.force ~= 1001 then
			var_8_3 = var_0_0[4]
		end

		local var_8_4 = CCSprite:createWithSpriteFrameName(var_8_3)

		if iter_8_1.cityState == 1 then
			local var_8_5 = CCSprite:createWithSpriteFrameName("thumbnailQuan2.png")

			arg_8_0.fireTable["cityId_" .. iter_8_1.id] = {}
			arg_8_0.fireTable["cityId_" .. iter_8_1.id].sprite = var_8_5

			var_8_5:setPosition(ccp(var_8_4:getContentSize().width / 2, var_8_4:getContentSize().height / 2))

			local var_8_6 = CCScaleTo:create(0.4, 0.3)
			local var_8_7 = CCCallFuncN:create(function()
				var_8_5:setScale(1)
			end)
			local var_8_8 = CCArray:create()

			var_8_8:addObject(var_8_7)
			var_8_8:addObject(var_8_6)
			var_8_8:addObject(CCDelayTime:create(0.5))
			var_8_5:runAction(CCRepeatForever:create(tolua.cast(CCSequence:create(var_8_8), "CCActionInterval")))
			var_8_4:addChild(var_8_5, -1)
		end

		local var_8_9 = var_8_4:getContentSize()
		local var_8_10

		if user.jpsIndex == 0 then
			var_8_10 = worldConstant.BUILDING_INFO["world_building_" .. iter_8_1.id]
		else
			var_8_10 = worldDongyingConstant.BUILDING_INFO["world_building_" .. iter_8_1.id]
		end

		local var_8_11 = var_8_10.x
		local var_8_12 = arg_8_0.world.mapLayer.mapInfo.mapHeight - var_8_10.y
		local var_8_13 = var_8_11 / arg_8_0.world.mapLayer.mapInfo.mapWidth * 660
		local var_8_14 = var_8_12 / arg_8_0.world.mapLayer.mapInfo.mapHeight * 396

		var_8_4:setPosition(ccp(var_8_1 + var_8_13 + var_8_9.width / 3 * 2, var_8_2 + var_8_14 - var_8_9.height / 2))
		arg_8_0.pointNode:addChild(var_8_4, 102)

		arg_8_0.pointTable["thumbnail_point_" .. iter_8_1.id] = var_8_4

		if user.kfAutoBattleCityId and user.kfAutoBattleCityId == iter_8_1.id then
			local var_8_15
			local var_8_16 = forceId == user.player.forceId and "city_js" or "city_xz"
			local var_8_17 = CCSprite:createWithSpriteFrameName(string.format("%s_a.png", var_8_16))
			local var_8_18 = CCSprite:createWithSpriteFrameName(string.format("%s_c.png", var_8_16))
			local var_8_19 = CCFadeIn:create(0.3)
			local var_8_20 = var_8_19:reverse()
			local var_8_21 = CCSequence:createWithTwoActions(var_8_19, var_8_20)

			var_8_18:runAction(CCRepeatForever:create(var_8_21))

			local var_8_22, var_8_23 = var_8_4:getPosition()

			var_8_17:setPosition(ccp(var_8_22, var_8_23))
			var_8_18:setPosition(ccp(var_8_22, var_8_23))
			arg_8_0.pointNode:addChild(var_8_18, 103)
			arg_8_0.pointNode:addChild(var_8_17, 104)
		end
	end

	local var_8_24 = {
		[113] = "yuanzheng",
		[123] = "wei",
		[34] = "yuanzheng",
		[188] = "yuanzheng",
		[19] = "shu",
		[4012] = "yuanzheng",
		[105] = "yuanzheng",
		[207] = "wu"
	}

	for iter_8_2, iter_8_3 in pairs(var_8_24) do
		local var_8_25 = arg_8_0.pointTable["thumbnail_point_" .. iter_8_2]
		local var_8_26 = true

		if user.kfyzWorldId == 9 and iter_8_2 == 105 then
			var_8_26 = false
		elseif user.kfyzWorldId ~= 9 and (iter_8_2 == 188 or iter_8_2 == 34 or iter_8_2 == 113) then
			var_8_26 = false
		end

		if var_8_25 and var_8_26 then
			local var_8_27 = CCSprite:create(string.format("res/ui/kfyz/invest/kfyz_map_icon_%s.png", iter_8_3))

			var_8_27:setPosition(var_8_25:getPosition())
			var_8_27:setScale(0.4)
			arg_8_0.view.widgets.layer_map:addChild(var_8_27, 100)
		end
	end
end

function var_0_1.showLocationAt(arg_10_0, arg_10_1)
	if arg_10_0.hintSprite then
		arg_10_0.hintSprite:removeFromParentAndCleanup(true)

		arg_10_0.hintSprite = nil
	end

	local var_10_0 = CCSprite:createWithSpriteFrameName("thumbnailQuan1.png")

	arg_10_0.hintSprite = var_10_0

	local var_10_1 = arg_10_0.pointTable["thumbnail_point_" .. arg_10_1]

	var_10_0:setPosition(ccp(var_10_1:getPosition()))
	arg_10_0.view.widgets.layer_map:addChild(var_10_0, 200)

	local var_10_2 = CCScaleTo:create(0.4, 0.3)
	local var_10_3 = CCCallFuncN:create(function()
		var_10_0:setScale(1)
	end)
	local var_10_4 = CCArray:create()

	var_10_4:addObject(var_10_3)
	var_10_4:addObject(var_10_2)
	var_10_4:addObject(CCDelayTime:create(0.5))
	var_10_0:runAction(CCRepeatForever:create(tolua.cast(CCSequence:create(var_10_4), "CCActionInterval")))
end

function var_0_1.shotAt(arg_12_0, arg_12_1, arg_12_2)
	if arg_12_0.shot == nil then
		arg_12_0.shot = CCScale9Sprite:createWithSpriteFrameName("thumbnailKuang.png", CCRectMake(5, 5, 136, 71))

		arg_12_0.shot:setPreferredSize(CCSizeMake(visibleSize.width * 0.11, visibleSize.height * 0.11))
		arg_12_0.view.widgets.layer_map:addChild(arg_12_0.shot, 300)
	end

	local var_12_0 = arg_12_0.shot:getContentSize()
	local var_12_1 = arg_12_0.view.widgets.map
	local var_12_2 = var_12_1:getContentSize().width
	local var_12_3 = var_12_1:getContentSize().height
	local var_12_4 = var_12_1:getPositionX() - var_12_2 / 2
	local var_12_5 = var_12_1:getPositionY() - var_12_3 / 2
	local var_12_6 = var_12_0.width
	local var_12_7 = var_12_0.height
	local var_12_8 = true

	if arg_12_1 == nil or arg_12_2 == nil then
		var_12_8 = false

		local var_12_9 = arg_12_0.world.mapLayer:getContentOffset()
		local var_12_10 = -var_12_9.x + visibleSize.width / 2
		local var_12_11 = -var_12_9.y + visibleSize.height / 2

		arg_12_1, arg_12_2 = var_12_10 * 0.11 + var_12_4, var_12_11 * 0.11 + var_12_5
	end

	if arg_12_1 < var_12_4 + var_12_6 / 2 then
		arg_12_1 = var_12_4 + var_12_6 / 2
	end

	if arg_12_2 < var_12_5 + var_12_7 / 2 then
		arg_12_2 = var_12_5 + var_12_7 / 2
	end

	if arg_12_1 > var_12_4 + var_12_2 - var_12_6 / 2 then
		arg_12_1 = var_12_4 + var_12_2 - var_12_6 / 2
	end

	if arg_12_2 > var_12_5 + var_12_3 - var_12_7 / 2 then
		arg_12_2 = var_12_5 + var_12_3 - var_12_7 / 2
	end

	arg_12_0.shot:setPosition(ccp(arg_12_1, arg_12_2))

	local var_12_12 = (arg_12_1 - var_12_4) / 660 * arg_12_0.world.mapLayer.mapInfo.mapWidth
	local var_12_13 = (arg_12_2 - var_12_5) / 396 * arg_12_0.world.mapLayer.mapInfo.mapHeight
	local var_12_14 = ccp(-var_12_12 + visibleSize.width / 2, -var_12_13 + visibleSize.height / 2)

	if var_12_8 then
		eventManager.dispatchEvent("worldSetOffet", var_12_14)
	end
end

function var_0_1.setThumbnailFire(arg_13_0, arg_13_1, arg_13_2)
	if not arg_13_0.fireTable["cityId_" .. arg_13_1] then
		arg_13_0.fireTable["cityId_" .. arg_13_1] = {}
	end

	local var_13_0 = arg_13_0.fireTable["cityId_" .. arg_13_1].sprite

	arg_13_0.fireTable["cityId_" .. arg_13_1] = {}

	if var_13_0 then
		pcall(var_13_0.removeFromParentAndCleanup, var_13_0, true)
	end

	local var_13_1 = arg_13_0.pointTable["thumbnail_point_" .. arg_13_1]

	if arg_13_2 == 1 and var_13_1 then
		local var_13_2 = CCSprite:createWithSpriteFrameName("thumbnailQuan2.png")

		arg_13_0.fireTable["cityId_" .. arg_13_1].sprite = var_13_2

		var_13_2:setPosition(ccp(var_13_1:getContentSize().width / 2, var_13_1:getContentSize().height / 2))

		local var_13_3 = CCScaleTo:create(0.4, 0.3)
		local var_13_4 = CCCallFuncN:create(function()
			var_13_2:setScale(1)
		end)
		local var_13_5 = CCArray:create()

		var_13_5:addObject(var_13_4)
		var_13_5:addObject(var_13_3)
		var_13_5:addObject(CCDelayTime:create(0.5))
		var_13_2:runAction(CCRepeatForever:create(tolua.cast(CCSequence:create(var_13_5), "CCActionInterval")))
		var_13_1:addChild(var_13_2, -1)
	end
end

function var_0_1.setThumbnailPointBelong(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.pointTable["thumbnail_point_" .. arg_15_1]

	if var_15_0 then
		local var_15_1 = var_0_0[arg_15_2] or var_0_0[4]

		if user.jpsIndex ~= 0 and arg_15_2 ~= 1001 then
			var_15_1 = var_0_0[4]
		end

		var_15_0:setDisplayFrame(tool.spriteFrameByName(var_15_1))
	end
end

function var_0_1.changeCity(arg_16_0, arg_16_1)
	arg_16_0:setThumbnailFire(arg_16_1.id, arg_16_1.cityState)
	arg_16_0:setThumbnailPointBelong(arg_16_1.id, arg_16_1.force)
end

function var_0_1.showPanel(arg_17_0, arg_17_1)
	arg_17_0.info = arg_17_1

	arg_17_0:shotAt(nil, nil)
	arg_17_0:addPoint()
	arg_17_0:addGeneral()

	user.forceIdToName_kfyz = {}

	if user.jpsIndex == 0 then
		if user.kfyzWorldId == 5 then
			local var_17_0 = {
				95016,
				95017,
				95018
			}

			for iter_17_0 = 1, 3 do
				arg_17_1["nationName" .. iter_17_0] = language.get(var_17_0[iter_17_0])
			end
		end

		for iter_17_1 = 1, 3 do
			for iter_17_2, iter_17_3 in pairs(arg_17_1.nationNames) do
				if iter_17_3.forceId == iter_17_1 then
					if type(iter_17_3.nationName) == "userdata" then
						user.forceIdToName_kfyz[iter_17_1] = "NPC"

						arg_17_0.view.widgets["nationName" .. iter_17_1]:setString("NPC")
					else
						user.forceIdToName_kfyz[iter_17_1] = iter_17_3.nationName

						arg_17_0.view.widgets["nationName" .. iter_17_1]:setString(iter_17_3.nationName)
					end
				end
			end
		end
	end
end

function var_0_1.ctor(arg_18_0, arg_18_1)
	rmgr.loadResource("res/ui/world/thumbnail.plist")

	arg_18_0.world = arg_18_1
	arg_18_0.view = {}
	arg_18_0.view.widgets = {}

	uiutil.initUIComponent(arg_18_0, arg_18_0.view.widgets, arg_18_0.layout)

	local var_18_0

	if user.jpsIndex == 0 then
		-- block empty
	elseif user.isKfdy then
		var_18_0 = "thumbnailXiaodituDongying.jpg"
	elseif user.isKfgl then
		var_18_0 = "djgl_map.jpg"
	elseif user.isKfyn then
		var_18_0 = "yn_smallmap.jpg"
	elseif user.isKflq then
		var_18_0 = "lq_smallmap.jpg"
	elseif user.isKfnz then
		var_18_0 = "nz_smallmap.jpg"
	end

	if var_18_0 then
		arg_18_0.view.widgets.map:setDisplayFrame(tool.spriteFrameByName(var_18_0))
	end

	if user.jpsIndex == 0 and user.kfyzWorldId == 9 and user.player.kfgzForceId then
		for iter_18_0 = 1, 4 do
			if math.mod(user.player.kfgzForceId, 1000) ~= iter_18_0 then
				local var_18_1

				if iter_18_0 ~= 4 then
					var_18_1 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("yzxms_map_" .. iter_18_0 .. ".png"))
				else
					var_18_1 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("yzxms_map_zhong.png"))
				end

				var_18_1:setPosition(ccp(330, 198))
				arg_18_0.view.widgets.map:addChild(var_18_1, 1000)
			end
		end
	end

	swallowTouch(arg_18_0)
	arg_18_0:setTouchEnabled(false)
	arg_18_0.view.widgets.btn_map:addHandleOfControlEvent(function()
		log.info("btn_map")

		local var_19_0 = arg_18_0.view.widgets.icon_map:isVisible()

		arg_18_0.view.widgets.icon_map:setVisible(not var_19_0)
		arg_18_0.view.widgets.layer_map:setVisible(not var_19_0)
		arg_18_0:setTouchEnabled(not var_19_0)
		eventManager.dispatchEvent("sideGeneralSetVisible", var_19_0)
		eventManager.dispatchEvent("kfyzMenuSetVisible", var_19_0)
		eventManager.dispatchEvent("kfyzNoticeSetVisible", var_19_0)
		arg_18_0:shotAt(nil, nil)
	end, CCControlEventTouchUpInside)

	for iter_18_1 = 1, 4 do
		local var_18_2 = arg_18_0.view.widgets["btn_tip" .. iter_18_1]

		var_18_2:addHandleOfControlEvent(function()
			log.info("show tip")
			arg_18_0:showTip(true, var_18_2, iter_18_1)
		end, CCControlEventTouchDown)
		var_18_2:addHandleOfControlEvent(function()
			log.info("hide tip")
			arg_18_0:showTip(false)
		end, CCControlEventTouchUpInside)
		var_18_2:addHandleOfControlEvent(function()
			log.info("hide tip")
			arg_18_0:showTip(false)
		end, CCControlEventTouchUpOutside)
	end
end

function var_0_1.showTip(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	if arg_23_0.view.widgets.tipFrame then
		arg_23_0.view.widgets.tipFrame:removeFromParentAndCleanup(true)

		arg_23_0.view.widgets.tipFrame = nil
	end

	if arg_23_1 then
		local var_23_0, var_23_1 = tool.getPositionInScreen(arg_23_2)

		uiutil.initWidgets(arg_23_0.view, arg_23_0.tipFrame)
		smgr.rootLayer:addChild(arg_23_0.view.widgets.tipFrame, 60000)
		arg_23_0.view.widgets.tipMsg:setDimensions(CCSizeMake(200, 0))

		local var_23_2 = language.get(390434, arg_23_0.task["endurance" .. arg_23_3])

		arg_23_0.view.widgets.tipMsg:setString(var_23_2)

		local var_23_3 = arg_23_0.view.widgets.tipMsg:getContentSize().width
		local var_23_4 = arg_23_0.view.widgets.tipMsg:getContentSize().height

		arg_23_0.view.widgets.tipFrame:setPreferredSize(CCSizeMake(var_23_3 + 30, var_23_4 + 30))
		arg_23_0.view.widgets.tipFrame:setPosition(ccp(var_23_0, var_23_1 + 40))
		arg_23_0.view.widgets.tipMsg:setPosition(ccp(15, 15))
		arg_23_0.view.widgets.tipFrame:setVisible(true)
	end
end

function var_0_1.onEnter(arg_24_0)
	function arg_24_0.isOpenRef()
		return arg_24_0.view.widgets.layer_map:isVisible()
	end

	arg_24_0.touchBeganRef = handler(arg_24_0, arg_24_0.onTouchBegan)
	arg_24_0.touchMovedRef = handler(arg_24_0, arg_24_0.onTouchMoved)
	arg_24_0.touchEndedRef = handler(arg_24_0, arg_24_0.onTouchEnded)
	arg_24_0.touchCancelledRef = handler(arg_24_0, arg_24_0.onTouchCancelled)

	eventManager.registerEvent("kfyzMapIsOpen", arg_24_0.isOpenRef)
	eventManager.registerEvent("globalOnTouchBegan", arg_24_0.touchBeganRef)
	eventManager.registerEvent("globalOnTouchMoved", arg_24_0.touchMovedRef)
	eventManager.registerEvent("globalOnTouchEnded", arg_24_0.touchEndedRef)
	eventManager.registerEvent("globalOnTouchCancelled", arg_24_0.touchCancelledRef)
end

function var_0_1.onExit(arg_26_0)
	eventManager.unregisterEvent("kfyzMapIsOpen", arg_26_0.isOpenRef)
	eventManager.unregisterEvent("globalOnTouchBegan", arg_26_0.touchBeganRef)
	eventManager.unregisterEvent("globalOnTouchMoved", arg_26_0.touchMovedRef)
	eventManager.unregisterEvent("globalOnTouchEnded", arg_26_0.touchEndedRef)
	eventManager.unregisterEvent("globalOnTouchCancelled", arg_26_0.touchCancelledRef)
end

function var_0_1.checkTouchOnMap(arg_27_0, arg_27_1, arg_27_2)
	if arg_27_0.view.widgets.layer_map:isVisible() and tool.checkIfTouch(arg_27_0.view.widgets.map, arg_27_1, arg_27_2) then
		arg_27_0:shotAt(arg_27_1, arg_27_2)
	end
end

function var_0_1.onTouchBegan(arg_28_0, arg_28_1, arg_28_2)
	arg_28_0:checkTouchOnMap(arg_28_1, arg_28_2)
end

function var_0_1.onTouchMoved(arg_29_0, arg_29_1, arg_29_2)
	arg_29_0:checkTouchOnMap(arg_29_1, arg_29_2)
end

function var_0_1.onTouchEnded(arg_30_0, arg_30_1, arg_30_2)
	arg_30_0:checkTouchOnMap(arg_30_1, arg_30_2)
end

function var_0_1.onTouchCancelled(arg_31_0, arg_31_1, arg_31_2)
	return
end

return var_0_1
