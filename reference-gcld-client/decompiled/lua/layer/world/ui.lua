require("lua/layer/menu/ui")
require("lua/layer/world/thumbnail/ui")
require("lua/layer/task/ui")
require("lua/layer/world/cityWindow/ui")
require("lua/layer/notice/ui")
require("lua/game/battle/widget/simpleGeneralPanel")

local var_0_0 = require("res/native/offset").get("layer.world.ui")
local var_0_1 = require("lua/layer/world/generalMoveLayer")

worldUI = {}
worldUI.fog = nil
worldUI.fogDuihuakuang = nil
worldUI.nationTaskTable = {}
worldUI.castleTable = {}

tool.requireRes("world")

local var_0_2 = worldControl
local var_0_3
local var_0_4 = {
	[25] = 55,
	[10] = 6,
	[4] = 4,
	[17] = 7,
	[146] = 10052,
	[216] = 216,
	[13] = 10001,
	[218] = 218
}
local var_0_5 = {
	{
		"block1_1.jpg",
		"block1_2.jpg",
		"block1_3.jpg",
		"block1_4.jpg",
		"block1_5.jpg",
		"block1_6.jpg"
	},
	{
		"block2_1.jpg",
		"block2_2.jpg",
		"block2_3.jpg",
		"block2_4.jpg",
		"block2_5.jpg",
		"block2_6.jpg"
	},
	{
		"block3_1.jpg",
		"block3_2.jpg",
		"block3_3.jpg",
		"block3_4.jpg",
		"block3_5.jpg",
		"block3_6.jpg"
	},
	{
		"block4_1.jpg",
		"block4_2.jpg",
		"block4_3.jpg",
		"block4_4.jpg",
		"block4_5.jpg",
		"block4_6.jpg"
	},
	{
		"block5_1.jpg",
		"block5_2.jpg",
		"block5_3.jpg",
		"block5_4.jpg",
		"block5_5.jpg",
		"block5_6.jpg"
	},
	{
		"block6_1.jpg",
		"block6_2.jpg",
		"block6_3.jpg",
		"block6_4.jpg",
		"block6_5.jpg",
		"block6_6.jpg"
	}
}

function worldUI.addMoveLayer()
	local var_1_0 = smgr.getLayer("worldCamera")

	if var_1_0.worldLayer:getChildByTag(107) == nil then
		local var_1_1 = var_0_1.show()

		var_1_0.worldLayer:addChild(var_1_1, 107, 107)
	end
end

function worldUI.initManzu()
	log.info("worldUI.initManzu")
end

function worldUI.initFarm()
	return
end

function worldUI.addSougua(arg_4_0)
	local var_4_0 = smgr.getLayer("worldCamera")
	local var_4_1 = var_4_0.cityTable["world_building_" .. arg_4_0.cityId]
	local var_4_2 = arg_4_0.cityId

	if var_4_1 and var_4_1.sprite then
		var_4_0.shenshiSkillNode:removeChildByTag(worldConstant.TUCHENG_BASE + arg_4_0.cityId, true)

		if arg_4_0.state == 0 then
			local var_4_3 = CCSprite:create()
			local var_4_4, var_4_5 = var_4_1.sprite:getPosition()

			var_4_3:setPosition(ccp(var_4_4, var_4_5))
			var_4_0.shenshiSkillNode:addChild(var_4_3, 1000, worldConstant.TUCHENG_BASE + arg_4_0.cityId)

			local var_4_6 = CCMenu:create()

			var_4_3:addChild(var_4_6)
			var_4_6:setPosition(ccp(55, 45))

			local var_4_7 = CCSprite:create("res/ui/world/sougua/sgcc_city_btn.png")
			local var_4_8 = CCSprite:create("res/ui/world/sougua/sgcc_city_btn_c.png")
			local var_4_9 = CCMenuItemSprite:create(var_4_7, var_4_8)

			var_4_9:setPosition(ccp(-65, 55))
			var_4_9:setScale(1.2)
			var_4_6:addChild(var_4_9, 10)
			var_4_9:registerScriptTapHandler(function()
				log.info("kick sougua")

				local function var_5_0(arg_6_0)
					local var_6_0 = arg_6_0.data or arg_6_0.action.data

					if var_6_0 then
						var_4_0.shenshiSkillNode:removeChildByTag(worldConstant.TUCHENG_BASE + var_4_2, true)

						local var_6_1 = {
							{}
						}

						if var_6_0.type == 17 then
							var_6_1[1].id = 7
						else
							var_6_1[1].id = var_6_0.type
						end

						var_6_1[1].value = var_6_0.value
						var_6_1[1].gemLevel = 1

						globalAction_gotResource(var_6_1)
					end
				end

				cmgr.sendRequest(var_5_0, actions.cityRob, arg_4_0.cityId)
			end)
		elseif arg_4_0.state == 1 then
			local function var_4_10(arg_7_0)
				local var_7_0 = {
					91009,
					91010,
					91011
				}

				return language.get(var_7_0[arg_7_0])
			end

			local function var_4_11(arg_8_0)
				if arg_8_0 == 1 then
					return ccc3(0, 0, 255)
				elseif arg_8_0 == 2 then
					return ccc3(255, 0, 0)
				else
					return ccc3(0, 255, 0)
				end
			end

			local var_4_12 = CCStrokeLabelTTF:create(language.get(122100, var_4_10(arg_4_0.forceId), arg_4_0.playerName), "Thonburi", 20, 1, colorText[10005])

			var_4_12:setColor(var_4_11(arg_4_0.forceId))

			local var_4_13, var_4_14 = var_4_1.sprite:getPosition()

			var_4_12:setPosition(ccp(var_4_13, var_4_14 + 45))
			var_4_0.shenshiSkillNode:addChild(var_4_12, 1000, worldConstant.TUCHENG_BASE + arg_4_0.cityId)
		end
	end
end

function worldUI.addTucheng(arg_9_0)
	if arg_9_0.cityId == nil then
		log.info("tucheng, cityId nil !!!!")

		return
	end

	local var_9_0 = smgr.getLayer("worldCamera")
	local var_9_1 = var_9_0.cityTable["world_building_" .. arg_9_0.cityId]
	local var_9_2 = arg_9_0.cityId

	if var_9_1 and var_9_1.sprite then
		var_9_0.shenshiSkillNode:removeChildByTag(worldConstant.TUCHENG_BASE + arg_9_0.cityId, true)

		local function var_9_3(arg_10_0)
			local var_10_0 = rmgr.getAnimation("tucheng")
			local var_10_1 = CCAnimation:createWithSpriteFrames(var_10_0, 0.05)
			local var_10_2 = CCAnimate:create(var_10_1)
			local var_10_3 = CCRepeat:create(var_10_2, 1)
			local var_10_4 = CCSprite:create()

			var_10_4:setPosition(ccp(20, 20))
			var_10_4:runAction(var_10_3)

			local var_10_5 = var_9_0.shenshiSkillNode:getChildByTag(worldConstant.TUCHENG_BASE + arg_10_0)

			if var_10_5 then
				var_10_5:addChild(var_10_4)
			end
		end

		if arg_9_0.canSlaughterTime and arg_9_0.canSlaughterTime > 0 then
			local var_9_4 = CCSprite:create()
			local var_9_5, var_9_6 = var_9_1.sprite:getPosition()

			var_9_4:setPosition(ccp(var_9_5, var_9_6))
			var_9_0.shenshiSkillNode:addChild(var_9_4, 1000, worldConstant.TUCHENG_BASE + arg_9_0.cityId)

			local var_9_7 = CCMenu:create()

			var_9_4:addChild(var_9_7)
			var_9_7:setPosition(ccp(55, 45))

			local var_9_8 = CCSprite:create("res/ui/world/tucheng/tcxg_city_btn.png")
			local var_9_9 = CCSprite:create("res/ui/world/tucheng/tcxg_city_btn_c.png")
			local var_9_10 = CCMenuItemSprite:create(var_9_8, var_9_9)

			var_9_10:setPosition(ccp(-55, 55))
			var_9_7:addChild(var_9_10, 10)
			var_9_10:registerScriptTapHandler(function()
				if worldThumbnailControl.thumbnailIsVisible == true then
					log.info("not kick tucheng")

					return
				end

				log.info("kick tucheng")

				local function var_11_0(arg_12_0)
					local var_12_0 = arg_12_0.data or arg_12_0.action.data

					var_9_3(var_9_2)

					if var_12_0.rewards then
						local var_12_1 = {}

						for iter_12_0 = 1, #var_12_0.rewards do
							var_12_1[iter_12_0] = {}

							if var_12_0.rewards[iter_12_0].type == 17 then
								var_12_1[iter_12_0].id = 7
							else
								var_12_1[iter_12_0].id = var_12_0.rewards[iter_12_0].type
							end

							var_12_1[iter_12_0].value = var_12_0.rewards[iter_12_0].value
							var_12_1[iter_12_0].gemLevel = 1
						end

						globalAction_gotResource(var_12_1)
					end
				end

				cmgr.sendRequest(var_11_0, actions.citySlaughter, arg_9_0.battleId)
			end)

			local function var_9_11()
				var_9_0.shenshiSkillNode:removeChildByTag(worldConstant.TUCHENG_BASE + var_9_2, true)
			end

			local var_9_12 = createTimerLabel(arg_9_0.canSlaughterTime, "@M:@S", "Thonburi", 22, var_9_11, nil, nil, ccc3(255, 0, 0))

			var_9_12:setPosition(50, 30)

			local var_9_13 = CCStrokeLabelTTF:create(language.get(122101), "Thonburi", 22)

			var_9_13:setColor(ccc3(255, 0, 0))
			var_9_13:setPosition(-30, 30)

			if arg_9_0.slaughterCd and arg_9_0.slaughterCd > 0 then
				var_9_12:setVisible(false)

				local var_9_14 = createTimerLabel(arg_9_0.slaughterCd, "@M:@S", "Thonburi", 22, nil, nil, nil, ccc3(255, 255, 0))

				var_9_14:setPosition(50, 30)
				var_9_4:addChild(var_9_14)
				var_9_13:setString(language.get("122100_tucheng"))
				var_9_13:setColor(ccc3(255, 255, 0))
			end

			var_9_12:setPositionX(var_9_13:getPositionX() + var_9_13:getContentSize().width / 2 + 4 + var_9_12:getSize().width / 2)
			var_9_4:addChild(var_9_12)
			var_9_4:addChild(var_9_13)
		elseif arg_9_0.constructionTime and arg_9_0.constructionTime > 0 then
			local var_9_15 = CCSprite:create()
			local var_9_16, var_9_17 = var_9_1.sprite:getPosition()

			var_9_15:setPosition(ccp(var_9_16, var_9_17))

			local var_9_18 = worldConstant.BUILDING_INFO["world_building_" .. var_9_2]

			if var_9_18 then
				local var_9_19 = var_9_18.model

				var_9_19 = var_9_19 == "worldBuildingPingyuan.png" and "worldBuildingTuCheng_pingyuan.png" or var_9_19 == "worldBuildingShandi.png" and "worldBuildingTuCheng_shandi.png" or var_9_19 == "worldBuildingShuidi1.png" and "worldBuildingTuCheng_shuiyu.png" or var_9_19 == "worldBuildingGuanqia1.png" and "worldBuildingTuCheng1.png" or var_9_19 == "worldBuildingGuanqia2.png" and "worldBuildingTuCheng2.png" or var_9_19 == "worldBuildingGuanqia3.png" and "worldBuildingTuCheng3.png" or "worldBuildingTuCheng4.png"

				var_9_1.sprite:setDisplayFrame(tool.spriteFrameByName(var_9_19))
			end

			local function var_9_20()
				var_9_1.sprite:setDisplayFrame(tool.spriteFrameByName(var_9_18.model))
				var_9_0.shenshiSkillNode:removeChildByTag(worldConstant.TUCHENG_BASE + var_9_2, true)
			end

			local var_9_21 = CCSprite:create("res/ui/world/tucheng/tcyh_city_d.png")

			var_9_21:setPosition(ccp(0, 90))

			local var_9_22 = createTimerLabel(arg_9_0.constructionTime, "@M:@S", "Thonburi", 22, var_9_20, nil, nil, ccc3(255, 0, 0))

			var_9_22:setPosition(ccp(80 + (var_0_0.slaughterCDTimeOffsetX or 0), 22))

			local var_9_23 = CCStrokeLabelTTF:create(language.get(122118), "Thonburi", 22)
			local var_9_24 = CCSprite:create("res/ui/world/tucheng/tcyh_icon_dao.png")
			local var_9_25 = arg_9_0.slaughterSize or 0
			local var_9_26 = CCStrokeLabelTTF:create(var_9_25 .. "/6", "Thonburi", 22)
			local var_9_27 = CCControlButton:create(CCScale9Sprite:create("res/ui/world/tucheng/tcyh_city_jt.png"))

			var_9_27:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/world/tucheng/tcyh_city_jt.png"), CCControlStateHighlighted)
			var_9_27:setAdjustBackgroundImage(false)
			var_9_27:setZoomOnTouchDown(false)

			local var_9_28 = createRichNode({
				var_9_23,
				var_9_24,
				var_9_26,
				var_9_27
			}, 0.5)

			var_9_28:setPosition(ccp(220, 22))
			var_9_21:addChild(var_9_28)
			var_9_21:addChild(var_9_22)
			var_9_15:addChild(var_9_21)

			local var_9_29 = {
				bg = {
					x = 0,
					name = "tuchengPeopleList",
					y = -37,
					type = "pic",
					visible = false,
					pic = "res/ui/world/tucheng/tcyh_city_d2.png",
					children = {
						{
							xcenter = 0,
							name = "tuchengTitle",
							fontSize = 20,
							type = "label",
							font = "Thonburi",
							y = 191,
							text = language.get(122119, worldConstant.BUILDING_INFO["world_building_" .. var_9_2].name),
							color = ccc3(233, 197, 77),
							halign = kCCTextAlignmentLeft
						},
						{
							rotate = 180,
							type = "button",
							buttons = {
								{
									pic2 = "res/ui/world/tucheng/tcyh_city_arrow2_c.png",
									name = "leftArrow",
									pic1 = "res/ui/world/tucheng/tcyh_city_arrow2.png",
									y = 87,
									x = 20
								}
							}
						},
						{
							type = "button",
							buttons = {
								{
									pic2 = "res/ui/world/tucheng/tcyh_city_arrow_c.png",
									name = "rightArrow",
									pic1 = "res/ui/world/tucheng/tcyh_city_arrow.png",
									y = 87,
									x = 333
								}
							}
						},
						{
							x = 120,
							name = "people1bg",
							type = "pic",
							ycenter = 23,
							pic = "res/ui/task/get_rewa_icon.jpg",
							children = {
								{
									xcenter = 0,
									name = "peopleHead1",
									scale = 0.6,
									type = "pic",
									ycenter = 0,
									pic = "res/ui/common/playerHead/playerHead_icon_0.png"
								},
								{
									xcenter = 100,
									name = "peopleName1",
									fontSize = 22,
									type = "label",
									ycenter = 15,
									text = "",
									font = "Thonburi",
									color = ccc3(204, 185, 134),
									halign = kCCTextAlignmentLeft
								},
								{
									xcenter = 100,
									name = "peopleLv1",
									fontSize = 20,
									type = "label",
									ycenter = -15,
									text = "",
									font = "Thonburi",
									color = ccc3(204, 185, 134),
									halign = kCCTextAlignmentLeft
								}
							}
						},
						{
							x = 120,
							name = "people2bg",
							type = "pic",
							ycenter = -59,
							pic = "res/ui/task/get_rewa_icon.jpg",
							children = {
								{
									xcenter = 0,
									name = "peopleHead2",
									scale = 0.6,
									type = "pic",
									ycenter = 0,
									pic = "res/ui/common/playerHead/playerHead_icon_0.png"
								},
								{
									xcenter = 100,
									name = "peopleName2",
									fontSize = 22,
									type = "label",
									ycenter = 15,
									text = "",
									font = "Thonburi",
									color = ccc3(204, 185, 134),
									halign = kCCTextAlignmentLeft
								},
								{
									xcenter = 100,
									name = "peopleLv2",
									fontSize = 20,
									type = "label",
									ycenter = -15,
									text = "",
									font = "Thonburi",
									color = ccc3(204, 185, 134),
									halign = kCCTextAlignmentLeft
								}
							}
						}
					}
				}
			}
			local var_9_30 = autoUI.initUI(var_9_15, var_9_29)
			local var_9_31 = {}

			local function var_9_32()
				for iter_15_0 = 1, 2 do
					if var_9_31[iter_15_0] then
						var_9_30["peopleHead" .. iter_15_0]:setDisplayFrame(CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. var_9_31[iter_15_0].playerPic .. ".png"):displayFrame())
						var_9_30["peopleName" .. iter_15_0]:setString(var_9_31[iter_15_0].playerName)
						var_9_30["peopleLv" .. iter_15_0]:setString("Lv." .. var_9_31[iter_15_0].playerLv)
					else
						var_9_30["peopleHead" .. iter_15_0]:setDisplayFrame(CCSprite:create("res/ui/common/playerHead/playerHead_icon_0.png"):displayFrame())
						var_9_30["peopleName" .. iter_15_0]:setString("")
						var_9_30["peopleLv" .. iter_15_0]:setString("")
					end
				end

				var_9_30.leftArrow:setVisible(false)
				var_9_30.rightArrow:setVisible(true)
			end

			local function var_9_33()
				for iter_16_0 = 3, 4 do
					if var_9_31[iter_16_0] then
						var_9_30["peopleHead" .. iter_16_0 - 2]:setDisplayFrame(CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. var_9_31[iter_16_0].playerPic .. ".png"):displayFrame())
						var_9_30["peopleName" .. iter_16_0 - 2]:setString(var_9_31[iter_16_0].playerName)
						var_9_30["peopleLv" .. iter_16_0 - 2]:setString("Lv." .. var_9_31[iter_16_0].playerLv)
					else
						var_9_30["peopleHead" .. iter_16_0 - 2]:setDisplayFrame(CCSprite:create("res/ui/common/playerHead/playerHead_icon_0.png"):displayFrame())
						var_9_30["peopleName" .. iter_16_0 - 2]:setString("")
						var_9_30["peopleLv" .. iter_16_0 - 2]:setString("")
					end
				end

				var_9_30.leftArrow:setVisible(true)
				var_9_30.rightArrow:setVisible(false)
			end

			var_9_30.leftArrow:registerScriptTapHandler(var_9_32)
			var_9_30.rightArrow:registerScriptTapHandler(var_9_33)
			var_9_27:addHandleOfControlEvent(function()
				if var_9_30.tuchengPeopleList and var_9_30.tuchengPeopleList:isVisible() then
					var_9_30.tuchengPeopleList:setVisible(false)

					return
				end

				cmgr.sendRequest(function(arg_18_0)
					if arg_18_0.action.state == 1 then
						if arg_18_0.action.data.slaughters then
							var_9_31 = arg_18_0.action.data.slaughters
						end

						if var_9_30 and var_9_30.tuchengPeopleList then
							var_9_30.tuchengPeopleList:setVisible(true)

							for iter_18_0 = 1, 2 do
								if var_9_31[iter_18_0] then
									var_9_30["peopleHead" .. iter_18_0]:setDisplayFrame(CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. var_9_31[iter_18_0].playerPic .. ".png"):displayFrame())
									var_9_30["peopleName" .. iter_18_0]:setString(var_9_31[iter_18_0].playerName)
									var_9_30["peopleLv" .. iter_18_0]:setString("Lv." .. var_9_31[iter_18_0].playerLv)
								end
							end

							if #var_9_31 >= 3 then
								var_9_30.leftArrow:setVisible(false)
								var_9_30.rightArrow:setVisible(true)
							else
								var_9_30.leftArrow:setVisible(false)
								var_9_30.rightArrow:setVisible(false)
							end
						end
					end
				end, actions.getCitySlaughters, arg_9_0.cityId)
			end, CCControlEventTouchUpInside)

			local var_9_34 = CCMenu:create()

			var_9_34:setPosition(ccp(55, 95))

			local var_9_35 = CCSprite:create("res/ui/world/tucheng/tcxg_city_btn.png")
			local var_9_36 = CCSprite:create("res/ui/world/tucheng/tcxg_city_btn_c.png")

			if arg_9_0.sweepRewardNum and arg_9_0.sweepRewardNum > 0 then
				var_9_35 = CCSprite:create("res/ui/world/tucheng/tcyh_city_btn_zlp.png")
				var_9_36 = CCSprite:create("res/ui/world/tucheng/tcyh_city_btn_zlp_c.png")

				var_9_15:addChild(var_9_34)
			elseif arg_9_0.slaughterAgain then
				var_9_35 = CCSprite:create("res/ui/world/tucheng/tcxg_city_btn_hltc1.png")
				var_9_36 = CCSprite:create("res/ui/world/tucheng/tcxg_city_btn_hltc1_c.png")

				var_9_15:addChild(var_9_34)
			elseif arg_9_0.weaponRobFood then
				var_9_35 = CCSprite:create("res/ui/world/tucheng/sbxt_btn_djjy_ld.png")
				var_9_36 = CCSprite:create("res/ui/world/tucheng/sbxt_btn_djjy_ld_c.png")

				var_9_15:addChild(var_9_34)
			end

			local var_9_37 = CCMenuItemSprite:create(var_9_35, var_9_36)

			var_9_37:setPosition(ccp(-55, 55))
			var_9_34:addChild(var_9_37, 10)
			var_9_37:registerScriptTapHandler(function()
				if worldThumbnailControl.thumbnailIsVisible == true then
					log.info("not kick heli tucheng")

					return
				end

				log.info("kick heli tucheng")

				local function var_19_0(arg_20_0)
					local var_20_0 = arg_20_0.data or arg_20_0.action.data

					var_9_3(var_9_2)

					if var_20_0.rewards then
						local var_20_1 = {}

						for iter_20_0 = 1, #var_20_0.rewards do
							var_20_1[iter_20_0] = {}

							if var_20_0.rewards[iter_20_0].type == 17 then
								var_20_1[iter_20_0].id = 7
							else
								var_20_1[iter_20_0].id = var_20_0.rewards[iter_20_0].type
							end

							var_20_1[iter_20_0].value = var_20_0.rewards[iter_20_0].value
							var_20_1[iter_20_0].gemLevel = 1
						end

						globalAction_gotResource(var_20_1)
					end
				end

				if arg_9_0.sweepRewardNum and arg_9_0.sweepRewardNum > 0 then
					cmgr.sendRequest(var_19_0, actions.celSlaughter, arg_9_0.battleId)
				elseif arg_9_0.slaughterAgain then
					cmgr.sendRequest(var_19_0, actions.citySlaughter, arg_9_0.battleId)
				elseif arg_9_0.weaponRobFood then
					cmgr.sendRequest(var_19_0, actions.robReward4Weapon, arg_9_0.battleId)
				end
			end)

			local function var_9_38(...)
				for iter_21_0, iter_21_1 in pairs(user.sadStoryCities) do
					if iter_21_1 == var_9_2 then
						local var_21_0 = CCLayer:create()
						local var_21_1 = CCSprite:create("res/ui/saotao/meishuz.png")

						var_21_1:setPosition(ccp(127, 106))

						local var_21_2 = CCControlButton:create(CCScale9Sprite:create("res/ui/common/button/public_btn_red.png"))

						var_21_2:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/common/button/public_btn_red_c.png"), CCControlStateHighlighted)
						var_21_2:setAdjustBackgroundImage(false)
						var_21_2:setPosition(ccp(127, 37))
						var_21_2:setZoomOnTouchDown(false)
						var_21_2:setScale(0.872)
						var_21_2:addHandleOfControlEvent(function()
							cmgr.sendRequest(function(arg_23_0)
								if arg_23_0.action.state == 1 then
									var_21_0:removeFromParentAndCleanup(true)

									for iter_23_0 = 1, #user.sadStoryCities do
										if user.sadStoryCities[iter_23_0] == iter_21_1 then
											table.remove(user.sadStoryCities, iter_23_0)
										end
									end

									eventManager.dispatchEvent("slaughterConfirmNotify")
									notice.control.update()
									notice.ui.update()
								end
							end, actions.slaughterConfirmNotify, iter_21_1)
						end, CCControlEventTouchUpInside)

						local var_21_3 = CCSprite:create("res/ui/world/tucheng/tc_btn_word_jxgz.png")
						local var_21_4 = var_21_2:getContentSize()

						var_21_3:setPosition(ccp(var_21_4.width / 2, var_21_4.height / 2 + 3))
						var_21_3:setScale(1.15)
						var_21_2:addChild(var_21_3)
						var_21_0:setContentSize(CCSizeMake(250, 150))
						var_21_0:addChild(var_21_1)
						var_21_0:addChild(var_21_2)
						var_21_0:ignoreAnchorPointForPosition(false)
						var_21_0:setTag(10101)
						var_9_15:removeChildByTag(10101, true)
						var_9_15:addChild(var_21_0)

						var_9_1.cleanBtn = var_21_0

						break
					end
				end
			end

			local function var_9_39(arg_24_0)
				if arg_24_0 == "enter" then
					eventManager.registerEvent("guoshang" .. var_9_2, var_9_38)
				elseif arg_24_0 == "exit" then
					eventManager.unregisterEvent("guoshang" .. var_9_2, var_9_38)
				end
			end

			var_9_15:registerScriptHandler(var_9_39)
			var_9_0.shenshiSkillNode:addChild(var_9_15, 1000, worldConstant.TUCHENG_BASE + arg_9_0.cityId)
			var_9_38()
		end
	end
end

function worldUI.addNewManzu(arg_25_0)
	local var_25_0 = smgr.getLayer("worldCamera")
	local var_25_1 = var_25_0.cityTable["world_building_" .. arg_25_0.city]
	local var_25_2 = arg_25_0.city

	if var_25_1 and var_25_1.sprite then
		var_25_0.newManzuNode:removeChildByTag(worldConstant.NEWMANZU_BASE + arg_25_0.city, true)

		if arg_25_0.state == 0 and arg_25_0.isCapital then
			local var_25_3 = CCSprite:create("res/ui/kfyz/kfyz_word_bg.png")
			local var_25_4, var_25_5 = var_25_1.sprite:getPosition()

			var_25_3:setPosition(ccp(var_25_4, var_25_5 + 50))

			local var_25_6 = CCSprite:createWithSpriteFrameName("move_por_move_view.png")

			var_25_6:setScale(0.7)
			var_25_6:setPosition(ccp(20, 31))
			var_25_3:addChild(var_25_6)

			local var_25_7 = CCSprite:create("res/ui/common/fightPic/fightPic_manzu.png")

			var_25_7:setPosition(ccp(34, 34))
			var_25_7:setScale(0.7)
			var_25_6:addChild(var_25_7)

			local var_25_8 = createTimerLabel(arg_25_0.nextPitchTime, "@M:@S", "Thonburi", 22, nil, nil, nil, colorTips.red)
			local var_25_9 = CCStrokeLabelTTF:create(language.get("222702_seasilk"), "Thonburi", 20, 1)

			var_25_8:setPosition(ccp(80, 31))
			var_25_9:setPosition(ccp(195, 31))
			var_25_3:addChild(var_25_8)
			var_25_3:addChild(var_25_9)
			var_25_0.newManzuNode:addChild(var_25_3, 1000, worldConstant.NEWMANZU_BASE + arg_25_0.city)

			local var_25_10 = CCSprite:create("res/ui/kfyz/kfyz_word_bg.png")

			var_25_10:setPosition(ccp(137, -9))
			var_25_3:addChild(var_25_10)

			local var_25_11 = CCStrokeLabelTTF:create(language.get("222703_seasilk"), "Thonburi", 18)

			var_25_11:setPosition(ccp(157, 31))
			var_25_10:addChild(var_25_11)
		elseif arg_25_0.state == 1 and arg_25_0.playerName then
			local var_25_12 = CCSprite:create("res/ui/kfyz/kfyz_word_bg.png")
			local var_25_13, var_25_14 = var_25_1.sprite:getPosition()

			var_25_12:setPosition(ccp(var_25_13, var_25_14 + 50))
			var_25_0.newManzuNode:addChild(var_25_12, 1000, worldConstant.NEWMANZU_BASE + arg_25_0.city)

			local var_25_15 = CCSprite:createWithSpriteFrameName("move_por_move_view.png")

			var_25_15:setScale(0.7)
			var_25_15:setPosition(ccp(20, 31))
			var_25_12:addChild(var_25_15)

			local var_25_16 = CCSprite:create("res/ui/common/playerHead/playerHead_icon_1" .. arg_25_0.pic .. ".png")

			var_25_16:setPosition(ccp(34, 34))
			var_25_16:setScale(0.9)
			var_25_15:addChild(var_25_16)

			local var_25_17 = CCStrokeLabelTTF:create(language.get("222705_seasilk"), "Thonburi", 22, 1)
			local var_25_18 = CCStrokeLabelTTF:create(arg_25_0.playerName, "Thonburi", 22, 1)

			var_25_18:setColor(colorTips.red)

			local var_25_19 = CCStrokeLabelTTF:create(language.get("222706_seasilk"), "Thonburi", 22, 1)
			local var_25_20 = createRichNode({
				var_25_17,
				var_25_18,
				var_25_19
			}, 0.5)

			var_25_20:setPosition(ccp(150, 31))
			var_25_12:addChild(var_25_20)
		end
	end
end

function worldUI.addNewHuangjin(arg_26_0)
	local var_26_0 = smgr.getLayer("worldCamera")
	local var_26_1 = var_26_0.cityTable["world_building_" .. arg_26_0.cityId]
	local var_26_2 = arg_26_0.cityId

	if var_26_1 and var_26_1.sprite then
		var_26_0.newManzuNode:removeChildByTag(worldConstant.NEWMANZU_BASE + arg_26_0.cityId, true)

		if arg_26_0.state == 0 and arg_26_0.nextNpcTime then
			local var_26_3 = CCSprite:create("res/ui/kfyz/kfyz_word_bg.png")
			local var_26_4, var_26_5 = var_26_1.sprite:getPosition()

			var_26_3:setPosition(ccp(var_26_4, var_26_5 + 50))

			local var_26_6 = CCSprite:createWithSpriteFrameName("move_por_move_view.png")

			var_26_6:setScale(0.7)
			var_26_6:setPosition(ccp(20, 31))
			var_26_3:addChild(var_26_6)

			local var_26_7 = CCSprite:create("res/ui/common/fightPic/fightPic_zhangjiao.png")

			var_26_7:setPosition(ccp(34, 34))
			var_26_7:setScale(0.7)
			var_26_6:addChild(var_26_7)

			local var_26_8 = createTimerLabel(arg_26_0.nextNpcTime, "@M:@S", "Thonburi", 22, nil, nil, nil, colorTips.red)
			local var_26_9 = CCStrokeLabelTTF:create(language.get("222702_seasilk"), "Thonburi", 20, 1)

			var_26_8:setPosition(ccp(80, 31))
			var_26_9:setPosition(ccp(195, 31))
			var_26_3:addChild(var_26_8)
			var_26_3:addChild(var_26_9)
			var_26_0.newManzuNode:addChild(var_26_3, 1000, worldConstant.NEWMANZU_BASE + arg_26_0.cityId)
		elseif arg_26_0.state == 1 and arg_26_0.playerName then
			local var_26_10 = CCSprite:create("res/ui/kfyz/kfyz_word_bg.png")
			local var_26_11, var_26_12 = var_26_1.sprite:getPosition()

			var_26_10:setPosition(ccp(var_26_11, var_26_12 + 50))
			var_26_0.newManzuNode:addChild(var_26_10, 1000, worldConstant.NEWMANZU_BASE + arg_26_0.cityId)

			local var_26_13 = CCSprite:createWithSpriteFrameName("move_por_move_view.png")

			var_26_13:setScale(0.7)
			var_26_13:setPosition(ccp(20, 31))
			var_26_10:addChild(var_26_13)

			local var_26_14 = CCSprite:create("res/ui/common/playerHead/playerHead_icon_1" .. arg_26_0.playerPic .. ".png")

			var_26_14:setPosition(ccp(34, 34))
			var_26_14:setScale(0.9)
			var_26_13:addChild(var_26_14)

			local var_26_15 = CCStrokeLabelTTF:create(language.get("222705_seasilk"), "Thonburi", 22, 1)
			local var_26_16 = CCStrokeLabelTTF:create(arg_26_0.playerName, "Thonburi", 22, 1)

			var_26_16:setColor(colorTips.red)

			local var_26_17 = CCStrokeLabelTTF:create(language.get("222706_seasilk"), "Thonburi", 22, 1)
			local var_26_18 = createRichNode({
				var_26_15,
				var_26_16,
				var_26_17
			}, 0.5)

			var_26_18:setPosition(ccp(150, 31))
			var_26_10:addChild(var_26_18)
		end
	end
end

function worldUI.addJunliangku(arg_27_0)
	local var_27_0 = smgr.getLayer("worldCamera")

	var_27_0.junliangkuNode:removeAllChildrenWithCleanup(true)

	for iter_27_0, iter_27_1 in pairs(arg_27_0) do
		local var_27_1 = var_27_0.cityTable["world_building_" .. iter_27_1.cityId]
		local var_27_2 = iter_27_1.cityId

		if var_27_1 and var_27_1.sprite then
			local var_27_3 = CCSprite:create("res/ui/nationTask/newPic/world_granary.png")
			local var_27_4, var_27_5 = var_27_1.sprite:getPosition()

			var_27_3:setPosition(ccp(var_27_4 - 65, var_27_5 + 15))
			var_27_0.junliangkuNode:addChild(var_27_3)

			local var_27_6
			local var_27_7

			if iter_27_1.size == 0 then
				var_27_6 = "jlktz_world_xxjlk.png"
				var_27_7 = tool.hexToRgb("#fff461")
			elseif iter_27_1.size == 1 then
				var_27_6 = "jlktz_world_zxjlk.png"
				var_27_7 = tool.hexToRgb("#ff8c7f")
			elseif iter_27_1.size == 2 then
				var_27_6 = "jlktz_world_dxjlk.png"
				var_27_7 = tool.hexToRgb("#e57fff")
			end

			if var_27_6 then
				local var_27_8 = CCSprite:create("res/ui/nationTask/newPic/" .. var_27_6)

				var_27_8:setPosition(ccp(40, 18))
				var_27_3:addChild(var_27_8)

				local var_27_9 = CCSprite:create("res/ui/activity/MulNation/wblcyh_word_bg.png")

				var_27_9:setScale(0.7)
				var_27_9:setPosition(40, -7)
				var_27_3:addChild(var_27_9)

				local var_27_10 = CCLabelTTF:create(iter_27_1.npcNum, "Thonburi", 20)

				var_27_10:setPosition(40, -7)
				var_27_10:setColor(var_27_7)
				var_27_3:addChild(var_27_10)
			end

			local var_27_11 = {
				ccc3(0, 0, 255),
				ccc3(255, 0, 0),
				ccc3(0, 255, 0)
			}
			local var_27_12 = {
				tipsBg = {
					xcenter = 0,
					anchorPointX = 0.5,
					type = "pic_9_tips",
					ycenter = 80,
					pic = "frame:common_tip_frame_small.png",
					anchorPointY = 0.5,
					middleRect = CCRectMake(0, 0, 0, 0),
					preferedSize = CCSizeMake(290, 300),
					content = {
						{
							fontSize = 18,
							stroke = false,
							type = "label",
							text = language.get("223101_junliangku", user.forceIdToName[iter_27_1.forceId or 1]),
							color = var_27_11[iter_27_1.forceId or 1]
						},
						{
							fontSize = 18,
							stroke = false,
							type = "label",
							text = language.get("223102_junliangku", iter_27_1.nCityName)
						},
						{
							fontSize = 18,
							stroke = false,
							type = "label",
							text = language.get("223104_junliangku", iter_27_1.npcNum)
						}
					}
				}
			}

			autoUI.initUI(var_27_3, var_27_12)
		end
	end
end

function worldUI.addPhantomMp()
	if user.phantomMp then
		for iter_28_0, iter_28_1 in pairs(user.phantomMp) do
			local var_28_0 = smgr.getLayer("worldCamera")
			local var_28_1 = var_28_0.cityTable["world_building_" .. iter_28_1.cityId]

			if var_28_1.sprite then
				local var_28_2 = CCSprite:createWithSpriteFrameName("move_por_move_view.png")
				local var_28_3 = CCSprite:create(string.format("res/ui/common/fightPic/fightPic_%s.png", iter_28_1.pic))
				local var_28_4 = CCSprite:create("res/ui/world/tshy_world_word_tjj.png")

				var_28_3:setPosition(ccp(var_28_2:getContentSize().width / 2, var_28_2:getContentSize().height / 2))
				tool.scaleTo(var_28_3, 59, 59)
				var_28_2:addChild(var_28_3)
				var_28_4:setPosition(ccp(var_28_2:getContentSize().width / 2, 15))
				var_28_2:addChild(var_28_4)

				local function var_28_5()
					var_28_2:removeFromParentAndCleanup(true)
				end

				local var_28_6 = CCCallFuncN:create(var_28_5)
				local var_28_7 = CCArray:create()

				var_28_7:addObject(CCDelayTime:create(3))
				var_28_7:addObject(var_28_6)

				local var_28_8 = CCSequence:create(var_28_7)

				var_28_2:runAction(var_28_8)

				local var_28_9, var_28_10 = var_28_1.sprite:getPosition()

				var_28_2:setPosition(ccp(var_28_9, var_28_10))
				var_28_0.tujiPhantomNode:addChild(var_28_2)
			end
		end
	end
end

function worldUI.addArena(arg_30_0)
	if arg_30_0 == nil then
		return
	end

	if arg_30_0.cityId == nil then
		return
	end

	user.championList = user.championList or {}
	worldUI.arenaTable = worldUI.arenaTable or {}

	local var_30_0 = worldUI.arenaTable[arg_30_0.cityId]

	if var_30_0 then
		var_30_0:removeFromParentAndCleanup(true)

		user.championList[arg_30_0.cityId] = nil
		worldUI.arenaTable[arg_30_0.cityId] = nil
	end

	if arg_30_0.id ~= nil and arg_30_0.id > 0 then
		local var_30_1 = smgr.getLayer("worldCamera")
		local var_30_2, var_30_3 = var_30_1.cityTable["world_building_" .. arg_30_0.cityId].sprite:getPosition()
		local var_30_4 = CCSprite:create("res/ui/arena/jzxt_word_bg.png")
		local var_30_5 = CCSprite:create("res/ui/arena/jzxt_icon_bg.png")

		var_30_5:setPosition(12, 17)
		var_30_4:addChild(var_30_5)

		local var_30_6 = CCSprite:create("res/ui/arena/jzxt_icon_01.png")

		var_30_6:setPosition(18, 36)
		var_30_5:addChild(var_30_6)

		local var_30_7 = CCLabelTTF:create(arg_30_0.forceName .. "·" .. arg_30_0.name, "Thonburi", 20)

		var_30_7:setColor(colorForce[arg_30_0.forceId])

		local var_30_8 = CCLabelTTF:create(language.get(225003), "Thonburi", 20)
		local var_30_9 = createRichNode({
			var_30_7,
			var_30_8
		}, 0)

		var_30_9:setPosition(ccp(34, 17))
		var_30_4:addChild(var_30_9)
		var_30_4:setPosition(ccp(var_30_2, var_30_3 + 60))
		var_30_1.worldLayer:addChild(var_30_4, 110)

		worldUI.arenaTable[arg_30_0.cityId] = var_30_4
		user.championList[arg_30_0.cityId] = arg_30_0
	end
end

function worldUI.addCock()
	if user.haveBetterPigCityId ~= nil and user.haveBetterPigCityId > 0 then
		local var_31_0 = smgr.getLayer("worldCamera")
		local var_31_1, var_31_2 = var_31_0.cityTable["world_building_" .. user.haveBetterPigCityId].sprite:getPosition()
		local var_31_3 = CCControlButton:create(CCScale9Sprite:create("res/ui/world/worldEventBtn1.png"))

		var_31_3:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/world/worldEventBtn1.png"), CCControlStateHighlighted)
		var_31_3:setAdjustBackgroundImage(false)
		var_31_3:setZoomOnTouchDown(true)
		var_31_3:addHandleOfControlEvent(function()
			local var_32_0 = CCSprite:create("res/ui/activity/tomb/qmjb_world_icon_xiaoji.jpg")
			local var_32_1, var_32_2 = tool.getPositionInScreen(var_31_3)

			var_32_0:setPosition(var_32_1, var_32_2 - 20)
			smgr.showTipSpriteText(var_32_0)
			var_31_3:removeFromParentAndCleanup(true)

			user.haveBetterPigCityId = nil
		end, CCControlEventTouchUpInside)
		var_31_3:setPosition(ccp(var_31_1, var_31_2 + 90))
		var_31_0.worldLayer:addChild(var_31_3, 110)

		local var_31_4 = CCSprite:create("res/ui/activity/tomb/qmjb_world_icon_xiaoji.jpg")

		var_31_4:setScale(0.85)
		var_31_4:setPosition(35, 35)
		var_31_3:addChild(var_31_4)
	end
end

function worldUI.addNationTask(arg_33_0)
	local function var_33_0(arg_34_0)
		pcall(worldUI.nationTaskTable["idx_" .. arg_34_0].removeFromParentAndCleanup, worldUI.nationTaskTable["idx_" .. arg_34_0], true)

		worldUI.nationTaskTable["idx_" .. arg_34_0] = nil
		user.noticeList.attTokenNum = 0

		eventManager.dispatchEvent("JoinzhiyuanToken")
	end

	local var_33_1 = CCSprite:create("res/ui/world/flight_place_view.png")
	local var_33_2 = createTimerLabel(arg_33_0.endTime, "@H:@M:@S", "Thonburi", 22, var_33_0, arg_33_0.target)

	var_33_2:setPosition(ccp(194, 22))
	var_33_1:addChild(var_33_2)

	local var_33_3 = (arg_33_0.attType == 0 and language.get(200003) or language.get(200004)) .. arg_33_0.cityName
	local var_33_4 = CCStrokeLabelTTF:create(var_33_3, "Thonburi", 22)

	var_33_4:setPosition(ccp(-var_33_4:getContentSize().width / 2 + 130 + 20, 22))
	var_33_1:addChild(var_33_4)

	local var_33_5 = smgr.getLayer("worldCamera")
	local var_33_6, var_33_7 = var_33_5.cityTable["world_building_" .. arg_33_0.target].sprite:getPosition()

	var_33_1:setPosition(ccp(var_33_6, var_33_7 + 30))

	local var_33_8 = CCSprite:createWithSpriteFrameName("cityWindowNationBg.png")
	local var_33_9 = CCLabelTTF:create(user.forceIdToName[user.player.forceId], "", 26)

	var_33_9:setColor(colorForce[user.player.forceId])
	var_33_9:setPosition(ccp(20, 20))
	var_33_8:addChild(var_33_9)
	var_33_8:setPosition(ccp(15, 22))
	var_33_1:addChild(var_33_8)
	var_33_5.worldLayer:removeChildByTag(20000 + arg_33_0.target, true)
	var_33_5.worldLayer:addChild(var_33_1, 1050, 20000 + arg_33_0.target)

	worldUI.nationTaskTable["idx_" .. arg_33_0.target] = var_33_1

	if arg_33_0.strategies then
		for iter_33_0, iter_33_1 in ipairs(arg_33_0.strategies) do
			if iter_33_1.strategy == "drawBack" or iter_33_1.strategy == "surround" then
				local var_33_10 = require("lua/layer/world/StrategyMenu").new(iter_33_1)

				var_33_10:setPosition(-25, 19)
				var_33_1:addChild(var_33_10)

				if iter_33_1.strategy == "drawBack" and worldUI.nationTaskTable["idx_" .. iter_33_1.preCity] then
					worldUI.nationTaskTable["idx_" .. iter_33_1.preCity]:removeFromParentAndCleanup(true)

					worldUI.nationTaskTable["idx_" .. iter_33_1.preCity] = nil
				end
			end
		end
	end

	if arg_33_0.continentType and arg_33_0.continentType == 0 then
		local var_33_11 = CCSprite:create("res/ui/nationTask/thunder/lxgs_world_sdz_bg.png")

		var_33_11:setPosition(var_33_1:getContentSize().width / 2 - 10, var_33_1:getContentSize().height / 2 + 50)
		var_33_11:setScale(0.95)
		var_33_1:addChild(var_33_11)

		local var_33_12 = CCSprite:create("res/ui/nationTask/thunder/lxgs_world_sdz_icon.png")

		var_33_12:setPosition(var_33_11:getContentSize().width / 2 - 80, var_33_11:getContentSize().height / 2 + 5)
		var_33_11:addChild(var_33_12)

		local var_33_13 = CCSprite:create("res/ui/nationTask/thunder/lxgs_world_word_sdz.png")

		var_33_13:setPosition(var_33_11:getContentSize().width / 2 + 10, var_33_11:getContentSize().height / 2 + 3)
		var_33_11:addChild(var_33_13)
	end
end

function worldUI.addNationTaskzhiyuanling(arg_35_0)
	local function var_35_0(arg_36_0)
		local var_36_0 = CCLabelTTF:create(tostring(user.forceIdToName[arg_36_0]), "", 26)

		var_36_0:setColor(colorForce[arg_36_0])

		return var_36_0
	end

	if worldUI.nationTaskTable["idx_" .. arg_35_0.cityId] then
		worldUI.nationTaskTable["idx_" .. arg_35_0.cityId]:removeChildByTag(1245, true)
		worldUI.nationTaskTable["idx_" .. arg_35_0.cityId]:removeChildByTag(1246, true)
		log.info("城市正确")

		local var_35_1 = CCSprite:create("res/ui/nationTask/attdefzhiyuanling/gsrw_yuan_bg.png")
		local var_35_2 = CCSprite:createWithSpriteFrameName("cityWindowNationBg.png")
		local var_35_3 = CCSprite:createWithSpriteFrameName("cityWindowNationBg.png")
		local var_35_4 = var_35_0(arg_35_0.supportForce)
		local var_35_5 = var_35_0(arg_35_0.forceId)

		var_35_4:setPosition(20, 20)
		var_35_5:setPosition(20, 20)
		var_35_2:addChild(var_35_4)
		var_35_3:addChild(var_35_5)
		var_35_1:addChild(var_35_2)
		var_35_1:addChild(var_35_3)
		var_35_2:setPosition(148, 23)
		var_35_3:setPosition(49, 23)
		worldUI.nationTaskTable["idx_" .. arg_35_0.cityId]:addChild(var_35_1, 0, 1245)
		var_35_1:setPosition(ccp(worldUI.nationTaskTable["idx_" .. arg_35_0.cityId]:getContentSize().width / 2, worldUI.nationTaskTable["idx_" .. arg_35_0.cityId]:getContentSize().height / 2 + 90))

		local var_35_6 = CCSprite:create("res/ui/world/flight_place_view.png")
		local var_35_7 = CCSprite:create("res/ui/nationTask/attdefzhiyuanling/mzwc.png")

		var_35_6:addChild(var_35_7)
		var_35_7:setPosition(10, 22)

		local var_35_8 = CCStrokeLabelTTF:create(language.get(60016), "Thonburi", 22)

		var_35_8:setPosition(ccp(100, 22))
		var_35_6:addChild(var_35_8)

		local var_35_9 = createTimerLabel(arg_35_0.nextTime, "@M:@S", "Thonburi", 22, nil)

		var_35_9:setPosition(ccp(205, 22))
		var_35_6:addChild(var_35_9)
		worldUI.nationTaskTable["idx_" .. arg_35_0.cityId]:addChild(var_35_6, 0, 1246)
		var_35_6:setPosition(ccp(worldUI.nationTaskTable["idx_" .. arg_35_0.cityId]:getContentSize().width / 2, worldUI.nationTaskTable["idx_" .. arg_35_0.cityId]:getContentSize().height / 2 + 48))
	end
end

function worldUI.addNationTaskNewInvest(arg_37_0)
	worldUI.investTable = worldUI.investTable or {}

	for iter_37_0, iter_37_1 in pairs(worldUI.investTable) do
		pcall(iter_37_1.removeFromParentAndCleanup, iter_37_1, true)
	end

	worldUI.investTable = {}

	if arg_37_0.taskState == 0 then
		local var_37_0 = smgr.getLayer("worldCamera")

		for iter_37_2, iter_37_3 in pairs(arg_37_0.cities) do
			local var_37_1 = var_37_0.cityTable["world_building_" .. iter_37_3.cityId]
			local var_37_2, var_37_3 = var_37_1.sprite:getPosition()
			local var_37_4 = require("lua/layer/world/NewInvestMenu").new(iter_37_3, var_37_1)

			var_37_4:setPosition(ccp(var_37_2, var_37_3))
			var_37_0.worldLayer:addChild(var_37_4, 110)

			worldUI.investTable[iter_37_3.cityId] = var_37_4
		end
	end
end

function worldUI.addweichengTask(arg_38_0)
	if user.player.forceId == arg_38_0.defForceId or arg_38_0.state == 1 or arg_38_0.serial == 3 then
		return
	end

	for iter_38_0 = 1, 2 do
		if arg_38_0["supportTarget" .. iter_38_0] then
			local var_38_0 = CCSprite:create("res/ui/world/flight_place_view.png")
			local var_38_1 = createTimerLabel(arg_38_0.leftTime, "@H:@M:@S", "Thonburi", 22, nil, nil)

			var_38_1:setPosition(ccp(194, 22))
			var_38_0:addChild(var_38_1)

			local var_38_2

			if user.player.forceId == arg_38_0.attForceId then
				var_38_2 = language.get(200004)
			else
				var_38_2 = language.get(200003)
			end

			local var_38_3 = var_38_2 .. arg_38_0["supportTarget" .. iter_38_0 .. "Name"]
			local var_38_4 = CCStrokeLabelTTF:create(var_38_3, "Thonburi", 22)

			var_38_4:setPosition(ccp(-var_38_4:getContentSize().width / 2 + 130 + 20, 22))
			var_38_0:addChild(var_38_4)

			local var_38_5 = smgr.getLayer("worldCamera")
			local var_38_6, var_38_7 = var_38_5.cityTable["world_building_" .. arg_38_0["supportTarget" .. iter_38_0]].sprite:getPosition()

			var_38_0:setPosition(ccp(var_38_6, var_38_7 + 30))

			local var_38_8 = CCSprite:createWithSpriteFrameName("cityWindowNationBg.png")
			local var_38_9 = CCLabelTTF:create(user.forceIdToName[user.player.forceId], "", 26)

			var_38_9:setColor(colorForce[user.player.forceId])
			var_38_9:setPosition(ccp(20, 20))
			var_38_8:addChild(var_38_9)
			var_38_8:setPosition(ccp(5, 22))
			var_38_0:addChild(var_38_8)

			if iter_38_0 == 1 then
				var_38_5.worldLayer:addChild(var_38_0, 105, worldConstant.weichengTag1)
			else
				var_38_5.worldLayer:addChild(var_38_0, 105, worldConstant.weichengTag2)
			end
		end
	end
end

function worldUI.removeWeichengTask()
	local var_39_0 = smgr.getLayer("worldCamera")

	if var_39_0 then
		var_39_0.worldLayer:removeChildByTag(worldConstant.weichengTag1, true)
		var_39_0.worldLayer:removeChildByTag(worldConstant.weichengTag2, true)
	end
end

function worldUI.addNationUpgradeTask(arg_40_0)
	local function var_40_0()
		local var_41_0 = camera.worldLayer:getChildByTag(1000 + arg_40_0.cityId)

		if var_41_0 then
			pcall(var_41_0.removeFromParentAndCleanup, var_41_0, true)
		end
	end

	local var_40_1 = smgr.getLayer("worldCamera")
	local var_40_2 = var_40_1.worldLayer:getChildByTag(1000 + arg_40_0.cityId)

	if var_40_2 then
		pcall(var_40_2.removeFromParentAndCleanup, var_40_2, true)
	end

	local var_40_3 = CCSprite:createWithSpriteFrameName("cc_manzu_bg.png")
	local var_40_4 = CCSprite:createWithSpriteFrameName("shoumaijingdudi.png")

	var_40_4:setPosition(ccp(96.5, 44))

	local var_40_5 = CCProgressTimer:create(CCSprite:createWithSpriteFrameName("shoumaijingdutiao.png"))

	var_40_5:setPosition(ccp(71, 10.5))
	var_40_4:addChild(var_40_5)
	var_40_5:setType(kCCProgressTimerTypeBar)
	var_40_5:setMidpoint(ccp(0, 0))
	var_40_5:setBarChangeRate(ccp(1, 0))
	var_40_5:setPercentage(100 - arg_40_0.percentage)

	local var_40_6 = CCStrokeLabelTTF:create(tostring(arg_40_0.percentage) .. "%", "Thonburi", 18)

	var_40_6:setPosition(ccp(164, 10.5))
	var_40_4:addChild(var_40_6)

	local var_40_7 = createTimerLabel(arg_40_0.endTime, "@H:@M:@S", "Thonburi-Bold", 20, var_40_0, nil, nil, ccc3(217, 87, 74))

	var_40_7:setPosition(ccp(116.5, 20))
	var_40_3:addChild(var_40_7)
	var_40_3:addChild(var_40_4)

	local var_40_8 = var_40_1.cityTable["world_building_" .. arg_40_0.cityId]

	if var_40_8.sprite then
		local var_40_9, var_40_10 = var_40_8.sprite:getPosition()

		var_40_3:setPosition(ccp(var_40_9, var_40_10 + 70))
		var_40_1.worldLayer:addChild(var_40_3, 105, 1000 + arg_40_0.cityId)
	end
end

local function var_0_6(arg_42_0, arg_42_1)
	local var_42_0 = smgr.getLayer("worldCamera")
	local var_42_1 = var_42_0.cityTable["world_building_" .. arg_42_0]
	local var_42_2 = var_42_0.cityTable["world_building_" .. arg_42_1]
	local var_42_3 = ccp(var_42_1.sprite:getPosition())
	local var_42_4 = ccp(var_42_2.sprite:getPosition())

	return (ccpMidpoint(var_42_3, var_42_4))
end

function worldUI.addNationThiefTask(arg_43_0)
	log.info("nationTask", tool.tableToJson(arg_43_0))

	local var_43_0 = smgr.getLayer("worldCamera")

	for iter_43_0, iter_43_1 in pairs(var_43_0.chainTable) do
		if not tolua.isnull(iter_43_1) then
			iter_43_1:removeFromParentAndCleanup(true)
		end
	end

	local var_43_1 = arg_43_0.warInfo
	local var_43_2 = {
		[103] = "res/ui/nationTask/thief/zyhj_tl001.png",
		[135] = "res/ui/nationTask/thief/zyhj_tl003.png",
		[139] = "res/ui/nationTask/thief/zyhj_tl002.png"
	}

	for iter_43_2, iter_43_3 in pairs(var_43_1) do
		if iter_43_3.forceId == 104 then
			local var_43_3 = var_0_6(iter_43_3.cityId, 105)

			if var_43_2[iter_43_3.cityId] ~= nil then
				local var_43_4 = CCSprite:create(var_43_2[iter_43_3.cityId])

				var_43_4:setPosition(var_43_3)
				var_43_0.worldLayer:addChild(var_43_4, 106)

				var_43_0.chainTable[iter_43_3.cityId] = var_43_4
			end
		end
	end
end

function worldUI.addNationBuildingTask(arg_44_0)
	log.info(tool.tableToJson(arg_44_0))

	for iter_44_0, iter_44_1 in pairs(arg_44_0.workerInfo) do
		eventManager.dispatchEvent("updateWorker", iter_44_1)
	end

	worldControl.forcePct = {}

	local var_44_0 = {
		123,
		19,
		207
	}
	local var_44_1 = smgr.getLayer("worldCamera")

	for iter_44_2, iter_44_3 in pairs(arg_44_0.miracle) do
		worldControl.forcePct[iter_44_3.forceId] = {}

		local var_44_2 = CCScale9Sprite:createWithSpriteFrameName("cc_manzu_bg.png")

		var_44_2:setPreferredSize(CCSizeMake(233, 45))

		local var_44_3 = var_44_1.cityTable["world_building_" .. var_44_0[iter_44_3.forceId]]

		if var_44_3.sprite then
			local var_44_4, var_44_5 = var_44_3.sprite:getPosition()

			var_44_2:setPosition(ccp(var_44_4, var_44_5 + 70))
			var_44_1.worldLayer:addChild(var_44_2, 105)

			worldControl.forcePct[iter_44_3.forceId].sprite = var_44_2

			local var_44_6 = CCSprite:createWithSpriteFrameName("shoumaijingdudi.png")

			var_44_6:setPosition(ccp(96.5, 22.5))
			var_44_2:addChild(var_44_6)

			local var_44_7 = CCProgressTimer:create(CCSprite:createWithSpriteFrameName("shoumaijingdutiao.png"))

			var_44_7:setPosition(ccp(71, 10.5))
			var_44_6:addChild(var_44_7)
			var_44_7:setType(kCCProgressTimerTypeBar)
			var_44_7:setMidpoint(ccp(0, 0))
			var_44_7:setBarChangeRate(ccp(1, 0))
			var_44_7:setPercentage(iter_44_3.totalPct)

			local var_44_8 = CCStrokeLabelTTF:create(tostring(iter_44_3.totalPct) .. "%", "Thonburi", 18)

			var_44_8:setPosition(ccp(164, 10.5))
			var_44_6:addChild(var_44_8)

			worldControl.forcePct[iter_44_3.forceId].progress = var_44_7
			worldControl.forcePct[iter_44_3.forceId].label = var_44_8
			worldControl.forcePct[iter_44_3.forceId].info = iter_44_3
		end
	end
end

function worldUI.updateManzuTaskStone(arg_45_0, arg_45_1)
	local var_45_0 = var_0_2.sdManzuAttachedTaskInfo[arg_45_0]

	if not var_45_0 then
		return
	end

	local var_45_1 = {
		{
			pic2 = "zymz_road_wei1.png",
			pic1 = "zymz_road_wei.png",
			pos = ccp(4355, 3410)
		},
		{
			pic2 = "zymz_road_shu1.png",
			pic1 = "zymz_road_shu.png",
			pos = ccp(290, 1150)
		},
		{
			pic2 = "zymz_road_wu1.png",
			pic1 = "zymz_road_wu.png",
			pos = ccp(4990, 255)
		}
	}
	local var_45_2 = smgr.getLayer("worldCamera")
	local var_45_3 = var_45_2.cityTable["world_building_" .. worldConstant.MANZU_CITY[arg_45_0]]
	local var_45_4, var_45_5 = var_45_3.sprite:getPosition()

	if var_45_3.manzuTaskRoad then
		var_45_3.manzuTaskRoad:removeFromParentAndCleanup(true)

		var_45_3.manzuTaskRoad = nil
	end

	local var_45_6

	if var_45_0.status == 1 then
		var_45_6 = CCSprite:create("res/ui/world/manzu/" .. var_45_1[arg_45_0].pic1)
	elseif var_45_0.status == 2 then
		var_45_6 = CCSprite:create("res/ui/world/manzu/" .. var_45_1[arg_45_0].pic2)
	end

	if var_45_6 then
		var_45_2.worldLayer:addChild(var_45_6, 104)
		var_45_6:setPosition(var_45_1[arg_45_0].pos)

		var_45_3.manzuTaskRoad = var_45_6
	end

	if arg_45_0 == user.player.forceId then
		local function var_45_7(arg_46_0)
			if arg_46_0 == 1 or arg_46_0 == 2 then
				local var_46_0 = {
					{
						txt = "zymz_tit_slysdcx.png",
						bg = "zymz_bg1.png"
					},
					{
						txt = "zymz_tit_mzccdlylt.png",
						bg = "zymz_bg2.png"
					}
				}
				local var_46_1 = CCNode:create()

				var_46_1:setPosition(ccp(visibleSize.width, visibleSize.height / 2))
				smgr.rootLayer:addChild(var_46_1, 60000)

				local var_46_2 = CCSprite:create("res/ui/world/manzu/" .. var_46_0[arg_46_0].bg)
				local var_46_3 = CCSprite:create("res/ui/world/manzu/" .. var_46_0[arg_46_0].txt)
				local var_46_4 = rmgr.getSpeedEffectAnimation()
				local var_46_5 = CCAnimation:createWithSpriteFrames(var_46_4, 0.08)
				local var_46_6 = CCAnimate:create(var_46_5)
				local var_46_7 = CCRepeatForever:create(var_46_6)
				local var_46_8 = CCSprite:create()

				var_46_8:runAction(var_46_7)
				var_46_1:addChild(var_46_2)
				var_46_1:addChild(var_46_8)
				var_46_1:addChild(var_46_3)

				if arg_46_0 == 1 then
					eventManager.dispatchEvent("moveToCity", worldConstant.MANZU_CITY[user.player.forceId], false)

					var_45_0.myStoneNum = 0
				end

				local var_46_9 = CCArray:create()

				var_46_9:addObject(CCMoveTo:create(0.3, ccp(visibleSize.width / 2, visibleSize.height / 2)))
				var_46_9:addObject(CCDelayTime:create(2))
				var_46_9:addObject(CCSpawn:createWithTwoActions(CCScaleTo:create(0.3, 0.1), CCMoveTo:create(0.3, ccp(0, visibleSize.height))))
				var_46_9:addObject(CCCallFuncN:create(function()
					var_46_1:removeFromParentAndCleanup(true)

					if arg_46_0 == 1 then
						local var_47_0 = {
							143,
							98,
							106,
							135,
							103,
							139,
							105
						}

						for iter_47_0, iter_47_1 in ipairs(var_47_0) do
							eventManager.dispatchEvent("setManzuTaskStone", iter_47_1)
						end

						roleDialogue.control.loadSpeak(1517)
						roleDialogue.control.loadSpeak(1518)
					elseif arg_46_0 == 2 then
						roleDialogue.control.loadSpeak(1519)
					end
				end))
				var_46_1:runAction(CCSequence:create(var_46_9))
			elseif arg_46_0 == 0 and tonumber(var_45_3.prop[3]) == 1 then
				roleDialogue.control.loadSpeak(1520)
			end
		end

		local function var_45_8(arg_48_0)
			local var_48_0 = CCSprite:create("res/ui/world/manzu/zymz_xjdltxmc_bg.png")

			var_48_0:setPosition(ccp(20, 60))
			arg_48_0:addChild(var_48_0)

			local var_48_1 = CCSprite:create("res/ui/world/manzu/zymz_xjdltxmc.png")

			var_48_1:setPosition(ccp(20, 60))
			arg_48_0:addChild(var_48_1)

			local var_48_2 = CCSprite:create("res/ui/world/manzu/zymz_pb_bg.png")

			var_48_2:setPosition(ccp(20, 35))
			arg_48_0:addChild(var_48_2)

			local var_48_3 = CCProgressTimer:create(CCSprite:create("res/ui/world/manzu/zymz_pb.png"))

			var_48_3:setType(kCCProgressTimerTypeBar)
			var_48_3:setMidpoint(ccp(0.5, 0.5))
			var_48_3:setBarChangeRate(ccp(1, 0))
			var_48_3:setPercentage(0)
			var_48_3:setPosition(ccp(20, 35))
			arg_48_0:addChild(var_48_3)

			local var_48_4 = CCLabelTTF:create(var_45_0.curStoneNum .. "/" .. var_45_0.totalStoneNum, "Thonburi-Bold", 22)

			var_48_4:setPosition(ccp(20, 35))
			arg_48_0:addChild(var_48_4)

			local var_48_5 = CCMenu:create()

			arg_48_0:addChild(var_48_5)
			var_48_5:setPosition(ccp(0, 0))

			local var_48_6 = CCSprite:create("res/ui/world/manzu/zymz_xjc_bg.png")

			var_48_6:setColor(ccc3(128, 128, 128))

			local var_48_7 = CCSprite:create("res/ui/world/manzu/zymz_xjc_bg.png")
			local var_48_8 = CCMenuItemSprite:create(var_48_6, var_48_7)

			var_48_8:setPosition(ccp(-100, 50))
			var_48_5:addChild(var_48_8)
			var_48_8:registerScriptTapHandler(function()
				log.info("btn_buildMZRoad")
				var_0_2.worldRepairManzuRoad()
			end)

			local var_48_9 = CCSprite:create("res/ui/world/manzu/zymz_xjc_bg.png")

			var_48_9:setScale(1.5)
			var_48_9:setOpacity(0)
			var_48_9:setPosition(ccp(-100, 50))
			arg_48_0:addChild(var_48_9)

			local var_48_10 = CCSprite:create("res/ui/world/manzu/zymz_sl.png")

			arg_48_0:addChild(var_48_10)
			var_48_10:setPosition(ccp(-95, 50))

			local var_48_11 = CCLabelAtlas:create("/" .. var_45_0.myStoneNum, "res/ui/world/manzu/zymz_xjc_digit.png", 15, 20, 47)

			var_48_11:setPosition(ccp(-100, 40))
			var_48_11:setAnchorPoint(ccp(0.5, 0.5))
			arg_48_0:addChild(var_48_11)

			local var_48_12 = CCSprite:create("res/ui/guide/jiantou-xia.png")

			var_48_12:setPosition(ccp(-100, 120))
			arg_48_0:addChild(var_48_12)

			local var_48_13 = CCJumpBy:create(0.6, ccp(0, 0), 30, 1)

			var_48_12:runAction(CCRepeatForever:create(var_48_13))

			var_45_3.manzuTaskBtn = var_48_9
			var_45_3.manzuTaskStoneNum = var_48_11
		end

		local function var_45_9(arg_50_0)
			local var_50_0 = CCSprite:create("res/ui/world/manzu/zymz_dljy_bg.png")

			var_50_0:setPosition(ccp(0, 60))
			arg_50_0:addChild(var_50_0)

			local var_50_1 = CCSprite:create("res/ui/world/manzu/zymz_dljy.png")

			var_50_1:setPosition(ccp(160, 16))
			var_50_0:addChild(var_50_1)

			local var_50_2 = createTimerLabel(var_45_0.countDown, "@M:@S", "Thonburi-Bold", 20, nil, nil, nil, ccc3(217, 87, 74))

			var_50_2:setPosition(ccp(148, 16))
			var_50_0:addChild(var_50_2)
		end

		if arg_45_1 then
			var_45_7(var_45_0.status)
		end

		if var_45_3.manzuTaskNode then
			var_45_3.manzuTaskNode:removeFromParentAndCleanup(true)

			var_45_3.manzuTaskNode = nil
			var_45_3.manzuTaskBtn = nil
			var_45_3.manzuTaskStoneNum = nil
		end

		local var_45_10 = CCNode:create()

		var_45_10:setPosition(ccp(var_45_4, var_45_5 - 10))
		var_45_2.worldLayer:addChild(var_45_10, 105)

		var_45_3.manzuTaskNode = var_45_10

		if var_45_0.status == 1 then
			var_45_8(var_45_10)
		elseif var_45_0.status == 2 then
			var_45_9(var_45_10)
		end
	end
end

function worldUI.addManzuTaskStone(arg_51_0)
	for iter_51_0 = 1, 3 do
		worldUI.updateManzuTaskStone(iter_51_0)
	end
end

function worldUI.addRuinedCitySingle(arg_52_0)
	local var_52_0 = smgr.getLayer("worldCamera")
	local var_52_1 = var_52_0.cityTable["world_building_" .. arg_52_0.cityId]
	local var_52_2, var_52_3 = var_52_1.sprite:getPosition()

	if not var_52_1.kfyzRebuildNode and arg_52_0.isRuined then
		local var_52_4 = worldConstant.BUILDING_INFO["world_building_" .. arg_52_0.cityId].model

		var_52_4 = var_52_4 == "worldBuildingPingyuan.png" and "worldBuildingTuCheng_pingyuan.png" or var_52_4 == "worldBuildingShandi.png" and "worldBuildingTuCheng_shandi.png" or var_52_4 == "worldBuildingShuidi1.png" and "worldBuildingTuCheng_shuiyu.png" or var_52_4 == "worldBuildingGuanqia1.png" and "worldBuildingTuCheng1.png" or var_52_4 == "worldBuildingGuanqia2.png" and "worldBuildingTuCheng2.png" or var_52_4 == "worldBuildingGuanqia3.png" and "worldBuildingTuCheng3.png" or "worldBuildingTuCheng4.png"

		var_52_1.sprite:setDisplayFrame(tool.spriteFrameByName(var_52_4))

		local var_52_5 = CCNode:create()

		var_52_5:setPosition(ccp(var_52_2, var_52_3))
		var_52_0.worldLayer:addChild(var_52_5, 106)

		local var_52_6 = CCSprite:create("res/ui/kfyz/kfyz_word_bg.png")

		var_52_6:setPosition(ccp(0, 55))
		var_52_5:addChild(var_52_6)

		local var_52_7 = CCSprite:create("res/ui/world/manzu/zymz_pb_bg.png")

		var_52_7:setPosition(ccp(0, 60))
		var_52_7:setScale(0.8)
		var_52_5:addChild(var_52_7)

		local var_52_8 = CCMenu:create()

		var_52_5:addChild(var_52_8)
		var_52_8:setPosition(ccp(0, 0))

		local var_52_9 = CCSprite:create("res/ui/world/manzu/zymz_xjc_bg.png")

		var_52_9:setColor(ccc3(128, 128, 128))

		local var_52_10 = CCSprite:create("res/ui/world/manzu/zymz_xjc_bg.png")
		local var_52_11 = CCMenuItemSprite:create(var_52_9, var_52_10)

		var_52_11:setPosition(ccp(-105, 57))
		var_52_8:addChild(var_52_11)
		var_52_11:registerScriptTapHandler(function()
			log.info("btn_kfyzRebuild")
			var_0_2.kfyzRebuild(arg_52_0.cityId)
		end)

		local var_52_12 = CCSprite:create("res/ui/world/manzu/zymz_xjc_bg.png")

		var_52_12:setScale(1.5)
		var_52_12:setOpacity(0)
		var_52_12:setPosition(ccp(-105, 57))
		var_52_5:addChild(var_52_12)

		local var_52_13 = CCSprite:create("res/ui/resourceArea2/resou_gra_cz_g.png")

		var_52_13:setScale(0.8)
		var_52_13:setPosition(ccp(-105, 60))
		var_52_5:addChild(var_52_13)

		var_52_1.kfyzRebuildNode = var_52_5
		var_52_1.kfyzRebuildBtn = var_52_11
		var_52_1.kfyzRebuildBtnBg = var_52_12

		local var_52_14 = CCNode:create()

		var_52_14:setPosition(ccp(0, -20))
		var_52_1.kfyzRebuildNode:addChild(var_52_14)
		var_52_14:setVisible(false)

		var_52_1.kfyzRebuildHammer = var_52_14

		local var_52_15 = CCSprite:create()

		var_52_14:addChild(var_52_15)

		local var_52_16 = CCSprite:create("res/ui/resourceArea2/resou_gra_cz_g.png")

		var_52_16:setPosition(ccp(60, -10))
		var_52_16:setAnchorPoint(ccp(1, 0))
		var_52_16:setRotation(90)
		var_52_14:addChild(var_52_16)

		local var_52_17 = CCArray:create()

		for iter_52_0 = 1, 2 do
			var_52_17:addObject(CCRotateBy:create(0.15, -90))
			var_52_17:addObject(CCCallFuncN:create(function()
				local var_54_0 = CCArray:create()

				for iter_54_0 = 1, 5 do
					local var_54_1 = CCSprite:create(string.format("res/ui/world/manzu/zymz_light%s.png", iter_54_0))

					var_54_0:addObject(var_54_1:displayFrame())
				end

				local var_54_2 = CCAnimation:createWithSpriteFrames(var_54_0, 0.1)
				local var_54_3 = CCAnimate:create(var_54_2)

				var_52_15:runAction(var_54_3)
			end))
			var_52_17:addObject(CCRotateBy:create(0.3, 90))

			if iter_52_0 == 2 then
				var_52_17:addObject(CCDelayTime:create(0.5))
			end
		end

		var_52_16:runAction(CCRepeatForever:create(CCSequence:create(var_52_17)))
	end

	if arg_52_0.leftTime and arg_52_0.leftTime > 0 then
		var_52_1.kfyzRebuildBtnBg = nil

		var_52_1.kfyzRebuildBtn:setEnabled(false)
		var_52_1.kfyzRebuildHammer:setVisible(true)

		local var_52_18 = createTimerLabel(arg_52_0.leftTime, "@M:@S", "Thonburi-Bold", 20, function()
			var_52_1.kfyzRebuildNode:removeFromParentAndCleanup(true)

			var_52_1.kfyzRebuildNode = nil

			local var_55_0 = worldConstant.BUILDING_INFO["world_building_" .. arg_52_0.cityId].model

			var_52_1.sprite:setDisplayFrame(tool.spriteFrameByName(var_55_0))
		end, nil, nil, ccc3(217, 87, 74))

		var_52_18:setPosition(ccp(105, 60))
		var_52_1.kfyzRebuildNode:addChild(var_52_18)
	end
end

function worldUI.addRuinedCity(arg_56_0)
	for iter_56_0, iter_56_1 in ipairs(arg_56_0) do
		worldUI.addRuinedCitySingle(iter_56_1)
	end
end

function worldUI.addBtnSilkPower()
	local var_57_0 = {
		123,
		19,
		207
	}
	local var_57_1 = smgr.getLayer("worldCamera")
	local var_57_2 = var_57_1.cityTable["world_building_" .. var_57_0[user.player.forceId]]
	local var_57_3, var_57_4 = var_57_2.sprite:getPosition()
	local var_57_5 = CCNode:create()

	var_57_5:setPosition(ccp(var_57_3, var_57_4))
	var_57_1.worldLayer:addChild(var_57_5, 106)

	local var_57_6 = CCMenu:create()

	var_57_5:addChild(var_57_6)
	var_57_6:setPosition(ccp(0, 0))

	local var_57_7 = CCSprite:create("res/ui/silk/power/sjfb_btn_dzjlx_c.png")
	local var_57_8 = CCSprite:create("res/ui/silk/power/sjfb_btn_dzjlx.png")
	local var_57_9 = CCMenuItemSprite:create(var_57_7, var_57_8)

	var_57_9:setPosition(ccp(0, 90))
	var_57_6:addChild(var_57_9)
	var_57_9:registerScriptTapHandler(function()
		log.info("btn_silkPower")

		local var_58_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

		smgr.rootLayer:addChild(var_58_0, 60000)

		local var_58_1 = CCSprite:create("res/ui/silk/power/sjfb.png")
		local var_58_2, var_58_3 = tool.getPositionInScreen(var_57_2.sprite)

		var_58_1:setPosition(ccp(var_58_2, var_58_3))
		var_58_0:addChild(var_58_1)

		local var_58_4 = CCSprite:create("res/ui/world/jubenEnter/jb_jb_list_cishu.png")

		var_58_4:setScaleX(1.4)
		var_58_4:setScaleY(0.8)
		var_58_4:setPosition(ccp(182, 110))
		var_58_1:addChild(var_58_4)

		local var_58_5 = CCSprite:create("res/ui/world/jubenEnter/jb_jb_list_cishu.png")

		var_58_5:setScaleX(1.4)
		var_58_5:setPosition(ccp(182, -30))
		var_58_1:addChild(var_58_5)

		local var_58_6 = CCLabelTTF:create(language.get(135636), "Thonburi-Bold", 30 + (var_0_0.silkPowerBtnFntSz or 0))

		var_58_6:setAnchorPoint(ccp(0, 0.5))
		var_58_6:setPosition(ccp(18, 148))
		var_58_6:setColor(colorQuality[4])
		var_58_1:addChild(var_58_6)

		local var_58_7 = CCLabelTTF:create(language.get(135638), "Thonburi-Bold", 25 + (var_0_0.silkPowerBtnFntSz or 0))

		var_58_7:setAnchorPoint(ccp(0, 0.5))
		var_58_7:setPosition(ccp(18, 110))
		var_58_1:addChild(var_58_7)
		var_58_7:setDimensions(CCSizeMake(320, 0))
		var_58_7:setHorizontalAlignment(kCCTextAlignmentLeft)

		local var_58_8 = CCLabelTTF:create(language.get(135637), "Thonburi-Bold", 25 + (var_0_0.silkPowerBtnFntSz or 0))

		var_58_8:setPosition(ccp(182, -30))
		var_58_8:setColor(colorQuality[4])
		var_58_1:addChild(var_58_8)

		local var_58_9 = CCMenu:create()

		var_58_1:addChild(var_58_9)
		var_58_9:setPosition(ccp(0, 0))

		local var_58_10 = CCSprite:create("res/ui/juben/jubenLevelSelect/btn_jb_a.png")
		local var_58_11 = CCSprite:create("res/ui/juben/jubenLevelSelect/btn_jb_a.png")

		var_58_11:setColor(ccc3(200, 200, 200))

		local var_58_12 = CCMenuItemSprite:create(var_58_10, var_58_11)

		var_58_12:setPosition(ccp(182, 42))
		var_58_9:addChild(var_58_12)
		var_58_12:registerScriptTapHandler(function()
			log.info("btn_att")
			var_58_0:removeFromParentAndCleanup(true)

			if smgr.currentSceneTag ~= SCENE_SILK_POWER then
				smgr.changeScene(SCENE_SILK_POWER)
			end
		end)
		var_58_0:registerScriptTouchHandler(function(arg_60_0, arg_60_1, arg_60_2)
			if arg_60_0 == CCTOUCHBEGAN then
				if not tool.checkIfTouch(var_58_1, arg_60_1, arg_60_2) and not tool.checkIfTouch(var_58_5, arg_60_1, arg_60_2) then
					var_58_0:removeFromParentAndCleanup(true)
				end

				return true
			elseif arg_60_0 == CCTOUCHMOVED then
				return true
			elseif arg_60_0 == CCTOUCHENDED then
				return true
			end
		end, false, true)
		var_58_0:setTouchEnabled(true)
	end)

	local var_57_10 = CCSprite:create("res/ui/silk/power/sjfb_btn_dzjlx.png")

	var_57_10:setOpacity(0)
	var_57_10:setPosition(ccp(0, 90))
	var_57_5:addChild(var_57_10)

	var_57_2.silkPowerBtnBg = var_57_10
end

function worldUI.addBtnFarm()
	local var_61_0 = {
		254,
		253,
		206
	}
	local var_61_1 = smgr.getLayer("worldCamera")
	local var_61_2 = var_61_1.cityTable["world_building_" .. var_61_0[user.player.forceId]]
	local var_61_3, var_61_4 = var_61_2.sprite:getPosition()
	local var_61_5 = CCNode:create()

	var_61_5:setPosition(ccp(var_61_3, var_61_4))
	var_61_1.worldLayer:addChild(var_61_5, 108)

	local var_61_6 = CCSprite:create()

	var_61_5:addChild(var_61_6)

	local var_61_7 = CCMenu:create()

	var_61_5:addChild(var_61_7)
	var_61_7:setPosition(ccp(0, 0))

	local var_61_8 = CCSprite:create("res/ui/world/farm/ttq_btn_lb.png")
	local var_61_9 = CCSprite:create("res/ui/world/farm/ttq_btn_lb_c.png")
	local var_61_10 = CCMenuItemSprite:create(var_61_8, var_61_9)

	var_61_10:setPosition(ccp(0, 90))
	var_61_10:setVisible(false)
	var_61_7:addChild(var_61_10)
	var_61_10:registerScriptTapHandler(function()
		log.info("btn_farm")

		local var_62_0 = smgr.getLayer("topLayer")
		local var_62_1 = require("lua/layer/farm/FarmPanel").new()

		var_62_0:removeAllChildrenWithCleanup(true)
		var_62_0:addChild(var_62_1)
	end)

	local var_61_11 = CCSprite:create("res/ui/silk/power/sjfb_btn_dzjlx.png")

	var_61_11:setOpacity(0)
	var_61_11:setPosition(ccp(0, 90))
	var_61_11:setVisible(false)
	var_61_5:addChild(var_61_11)

	var_61_2.farmNode = var_61_5
	var_61_2.farmBtnBg = var_61_11
	var_61_2.farmBtn = var_61_10
	var_61_2.farmEffect = var_61_6
end

local var_0_7 = {
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

function worldUI.showTips(arg_63_0, arg_63_1, arg_63_2, arg_63_3, arg_63_4)
	local var_63_0 = smgr.getLayer("topLayer")

	if worldUI.tipsview and worldUI.tipsview.widgets.tipFrame then
		worldUI.tipsview.widgets.tipFrame:removeFromParentAndCleanup(true)

		worldUI.tipsview.widgets.tipFrame = nil
	end

	if arg_63_1 then
		local var_63_1 = 0
		local var_63_2 = 0

		if worldUI.tipsview == nil then
			worldUI.tipsview = {}
		end

		uiutil.initWidgets(worldUI.tipsview, var_0_7)
		worldUI.tipsview.widgets.tipFrame:setAnchorPoint(ccp(1, 0))
		var_63_0:addChild(worldUI.tipsview.widgets.tipFrame)

		local var_63_3, var_63_4 = tool.getPositionInScreen(arg_63_2)
		local var_63_5 = var_63_3 + 20
		local var_63_6 = var_63_4 + 20

		if arg_63_4 then
			var_63_5 = var_63_5 + arg_63_4.x
			var_63_6 = var_63_6 + arg_63_4.y
		end

		worldUI.tipsview.widgets.tipMsg:setString(arg_63_3)

		local var_63_7 = worldUI.tipsview.widgets.tipMsg:getContentSize().width
		local var_63_8 = worldUI.tipsview.widgets.tipMsg:getContentSize().height

		worldUI.tipsview.widgets.tipFrame:setPreferredSize(CCSizeMake(var_63_7 + 30, var_63_8 + 30))
		worldUI.tipsview.widgets.tipFrame:setPosition(ccp(var_63_5, var_63_6))
		worldUI.tipsview.widgets.tipMsg:setPosition(ccp(15, 15))
		worldUI.tipsview.widgets.tipFrame:setVisible(true)
	end
end

local var_0_8 = {
	[238] = {
		tip = 215500,
		pic = "res/ui/world/speicalCity/tscc_hy_jl.png"
	},
	[239] = {
		tip = 215501,
		pic = "res/ui/world/speicalCity/tscc_hy_xz.png"
	},
	[132] = {
		tip = 215502,
		pic = "res/ui/world/speicalCity/tscc_hy_hb.png"
	},
	[144] = {
		tip = 215503,
		pic = "res/ui/world/speicalCity/tscc_hy_tj.png"
	}
}

local function var_0_9(arg_64_0)
	local var_64_0 = {
		name = "iconBtn",
		h = 72,
		type = "button",
		w = 73,
		y = 0,
		x = 0,
		normal = {
			path = "res/ui/resourceArea2/zcgz_btn_round.png"
		},
		touched = {
			path = "res/ui/resourceArea2/zcgz_btn_round_c.png"
		},
		children = {
			{
				y = 36,
				name = "icon",
				type = "sprite",
				x = 36,
				pic = {
					path = "res/ui/task/get_icon_food.png"
				}
			}
		}
	}
	local var_64_1 = {}

	uiutil.initWidgets(var_64_1, var_64_0)
	var_64_1.widgets.icon:setDisplayFrame(CCSprite:create(var_0_8[arg_64_0.rewardType].pic):displayFrame())

	local function var_64_2()
		worldUI:showTips(true, var_64_1.widgets.iconBtn, language.get(var_0_8[arg_64_0.rewardType].tip), ccp(0, -0))
	end

	local function var_64_3()
		worldUI:showTips(false)
	end

	var_64_1.widgets.iconBtn:addHandleOfControlEvent(var_64_2, CCControlEventTouchDown)
	var_64_1.widgets.iconBtn:addHandleOfControlEvent(var_64_3, CCControlEventTouchUpInside)
	var_64_1.widgets.iconBtn:addHandleOfControlEvent(var_64_3, CCControlEventTouchUpOutside)

	return var_64_1.widgets.iconBtn
end

function worldUI.updateShogun(arg_67_0)
	local var_67_0 = smgr.getLayer("worldCamera")

	worldUI.shogunTable = worldUI.shogunTable or {}

	for iter_67_0, iter_67_1 in pairs(arg_67_0) do
		if iter_67_1 then
			local var_67_1 = var_67_0.cityTable["world_building_" .. iter_67_1.cityId]
			local var_67_2 = worldUI.shogunTable[cityId]

			if var_67_2 then
				pcall(var_67_2.removeFromParentAndCleanup, var_67_2, true)
			end

			local var_67_3, var_67_4 = var_67_1.sprite:getPosition()
			local var_67_5 = var_0_9(iter_67_1)

			var_67_5:setScale(0.8)
			var_67_5:setPosition(ccp(var_67_3 + 100, var_67_4 - 36))
			var_67_0.worldLayer:addChild(var_67_5, 110)

			worldUI.shogunTable[iter_67_1.cityId] = var_67_5
		end
	end
end

function worldUI.updateExpandState()
	if user.expandState then
		local var_68_0 = smgr.getLayer("worldCamera")

		worldUI.expandStateTable = worldUI.expandStateTable or {}

		for iter_68_0, iter_68_1 in pairs(worldConstant.BUILDING_INFO) do
			if iter_68_1 then
				local var_68_1 = var_68_0.cityTable[iter_68_0]

				if var_68_1 and var_68_1.prop and var_68_1.prop[2] and tonumber(var_68_1.prop[2]) > 0 and tonumber(var_68_1.prop[2]) == user.player.forceId then
					-- block empty
				else
					local var_68_2 = var_68_0.cityTable[iter_68_0]
					local var_68_3 = stringSplit(iter_68_1.point, ",")

					if iter_68_1.point ~= "" then
						local var_68_4 = worldUI.expandStateTable[iter_68_0]

						if var_68_4 then
							pcall(var_68_4.removeFromParentAndCleanup, var_68_4, true)
						end

						local var_68_5, var_68_6 = var_68_2.sprite:getPosition()
						local var_68_7 = CCSprite:create("res/ui/world/speicalCity/xkjtt_world_numb_di.png")
						local var_68_8 = CCSprite:create("res/ui/world/speicalCity/xkjtt_world_numb_0" .. var_68_3[user.player.forceId] .. ".png")

						var_68_8:setPosition(ccp(19, 20))
						var_68_7:addChild(var_68_8)
						var_68_7:setPosition(ccp(var_68_5 - 80, var_68_6 - 48))
						var_68_0.worldLayer:addChild(var_68_7, 110)

						worldUI.expandStateTable[iter_68_0] = var_68_7
					end
				end
			end
		end
	else
		for iter_68_2, iter_68_3 in pairs(worldConstant.BUILDING_INFO) do
			if iter_68_3 then
				local var_68_9 = camera.cityTable[iter_68_2]
				local var_68_10 = worldUI.expandStateTable[iter_68_2]

				if var_68_10 then
					pcall(var_68_10.removeFromParentAndCleanup, var_68_10, true)
				end
			end
		end
	end
end

function worldUI.addStrategyEvent(arg_69_0)
	log.info("addStrategyEvent", tool.tableToJson(arg_69_0))

	local var_69_0 = smgr.getLayer("cityEventLayer")
	local var_69_1 = smgr.getLayer("worldCamera")

	worldUI.strategyEventTable = worldUI.strategyEventTable or {}

	if arg_69_0.strategy then
		local var_69_2 = var_69_1.cityTable["world_building_" .. arg_69_0.npcCityId]

		if var_69_2 == nil then
			return
		end

		if var_69_2.strategyEventSprite then
			pcall(var_69_2.strategyEventSprite.removeFromParentAndCleanup, var_69_2.strategyEventSprite, true)
		end

		local var_69_3 = var_69_2.sprite
		local var_69_4 = CCSprite:create("res/ui/world/worldEventBtn1.png")

		if arg_69_0.strategy == "hjRebelAtt" then
			var_69_2.strategyEventSprite = var_69_4

			local var_69_5, var_69_6 = var_69_3:getPosition()

			var_69_4:setPosition(ccp(var_69_5, var_69_6 + 100))

			local var_69_7 = CCSprite:create("res/ui/common/generalPic/generalPic_zhangjiao.jpg")

			var_69_7:setPosition(var_69_4:getContentSize().width / 2, var_69_4:getContentSize().height / 2)
			var_69_7:setScale(0.8)
			var_69_4:addChild(var_69_7, 100)

			local var_69_8 = CCStrokeLabelTTF:create(language.get(219109), "Thonburi-Bold", 20)

			var_69_8:setPosition(ccp(var_69_4:getContentSize().width / 2, var_69_8:getContentSize().height / 2 - 10))
			var_69_4:addChild(var_69_8, 101)
		elseif arg_69_0.strategy == "ysProvoke" then
			var_69_2.strategyEventSprite = var_69_4

			local var_69_9, var_69_10 = var_69_3:getPosition()

			var_69_4:setPosition(ccp(var_69_9, var_69_10 + 90))

			local var_69_11 = CCSprite:create("res/ui/common/generalPic/generalPic_yuanshao.jpg")

			var_69_11:setPosition(var_69_4:getContentSize().width / 2, var_69_4:getContentSize().height / 2)
			var_69_11:setScale(0.8)
			var_69_4:addChild(var_69_11, 100)

			local var_69_12 = CCStrokeLabelTTF:create(language.get(219108), "Thonburi-Bold", 20)

			var_69_12:setPosition(ccp(var_69_4:getContentSize().width / 2, var_69_12:getContentSize().height / 2 - 10))
			var_69_4:addChild(var_69_12, 101)

			if arg_69_0.suc then
				var_69_4:setVisible(false)
			end
		elseif arg_69_0.strategy == "hjRebel" then
			var_69_2.strategyEventSprite = var_69_4

			local var_69_13, var_69_14 = var_69_3:getPosition()

			var_69_4:setPosition(ccp(var_69_13, var_69_14 + 100))

			local var_69_15 = CCSprite:create("res/ui/common/generalPic/generalPic_zhangjiao.jpg")

			var_69_15:setPosition(var_69_4:getContentSize().width / 2, var_69_4:getContentSize().height / 2)
			var_69_15:setScale(0.8)
			var_69_4:addChild(var_69_15, 100)

			local var_69_16 = CCStrokeLabelTTF:create(language.get(219106), "Thonburi-Bold", 20)

			var_69_16:setPosition(ccp(var_69_4:getContentSize().width / 2, var_69_16:getContentSize().height / 2 - 10))
			var_69_4:addChild(var_69_16, 101)
		elseif arg_69_0.strategy == "barInvade" then
			var_69_4 = CCSprite:create("res/ui/world/worldBuild/gjgs_world_word_di.png")
			var_69_2.strategyEventSprite = var_69_4

			local var_69_17, var_69_18 = var_69_3:getPosition()

			var_69_4:setPosition(ccp(var_69_17, var_69_18 + 90))

			local var_69_19 = createTimerLabel(arg_69_0.nextManzuTime - os.time() * 1000, "@H:@M:@S" .. language.get(219107), "Thonburi-Bold", 22, nil, nil, nil, ccc3(255, 255, 255))

			var_69_19:setPosition(ccp(var_69_4:getContentSize().width / 2, 32))
			var_69_4:addChild(var_69_19, 100)
		end

		var_69_0:addChild(var_69_4, 100)

		worldUI.strategyEventTable[arg_69_0.npcCityId] = var_69_4
	end
end

function worldUI.removeStrategyEvent()
	if worldUI.strategyEventTable then
		for iter_70_0, iter_70_1 in pairs(worldUI.strategyEventTable) do
			if iter_70_1 and not tolua.isnull(iter_70_1) then
				iter_70_1:removeFromParentAndCleanup(true)

				worldUI.strategyEventTable[iter_70_0] = nil
			end
		end
	end
end

function worldUI.addBtnNationReward(arg_71_0)
	worldUI.nationRewardBtnTable = worldUI.nationRewardBtnTable or {}

	local var_71_0 = smgr.getLayer("worldCamera")
	local var_71_1 = var_71_0.cityTable["world_building_" .. arg_71_0.npcCityId]

	if var_71_1.sprite then
		local var_71_2 = {
			y = 0,
			name = "root",
			scale = 1,
			type = "node",
			x = 0,
			children = {
				{
					zoomOnTouchDown = true,
					name = "rewardBtn",
					h = 118,
					type = "button",
					w = 123,
					y = 0,
					x = 0,
					normal = {
						path = "res/ui/world/feud/sbxt_btn_lqjl.png"
					},
					touched = {
						path = "res/ui/world/feud/sbxt_btn_lqjl_c.png"
					}
				}
			}
		}
		local var_71_3, var_71_4 = var_71_1.sprite:getPosition()
		local var_71_5 = {}

		uiutil.initWidgets(var_71_5, var_71_2)
		var_71_0.worldLayer:addChild(var_71_5.widgets.root, 110)
		var_71_5.widgets.root:setPosition(ccp(var_71_3, var_71_4 + 100))

		worldUI.nationRewardBtnTable[arg_71_0.npcCityId] = var_71_5.widgets.root

		var_71_5.widgets.rewardBtn:addHandleOfControlEvent(function()
			local function var_72_0(arg_73_0)
				worldUI.removeBtnNationReward(arg_71_0.npcCityId)

				if user.worldData.nationNpcCityList then
					user.worldData.nationNpcCityList[arg_71_0.npcCityId] = nil
				end

				local var_73_0 = arg_73_0.action.data
				local var_73_1 = {}

				for iter_73_0, iter_73_1 in pairs(var_73_0.rewards) do
					local var_73_2 = {
						id = var_0_4[iter_73_1.type],
						value = iter_73_1.value
					}

					table.insert(var_73_1, var_73_2)
				end

				globalAction_gotResource(var_73_1)
			end

			cmgr.sendRequest(var_72_0, actions.getNationTaskReward, arg_71_0.taskType)
		end, CCControlEventTouchUpInside)
	end
end

function worldUI.removeBtnNationReward(arg_74_0)
	if worldUI.nationRewardBtnTable then
		if arg_74_0 then
			local var_74_0 = worldUI.nationRewardBtnTable[arg_74_0]

			if var_74_0 and not tolua.isnull(var_74_0) then
				var_74_0:removeFromParentAndCleanup(true)

				worldUI.nationRewardBtnTable[arg_74_0] = nil
			end
		else
			for iter_74_0, iter_74_1 in pairs(worldUI.nationRewardBtnTable) do
				if iter_74_1 and not tolua.isnull(iter_74_1) then
					iter_74_1:removeFromParentAndCleanup(true)

					worldUI.nationRewardBtnTable[iter_74_0] = nil
				end
			end
		end
	end
end

function worldUI.addBtnFeud()
	local var_75_0 = smgr.getLayer("worldCamera")

	for iter_75_0, iter_75_1 in pairs(user.feuds) do
		if iter_75_1 and iter_75_1[0] then
			local var_75_1 = var_75_0.cityTable["world_building_" .. iter_75_0]
			local var_75_2 = worldUI.feudTable[iter_75_0]

			if var_75_2 then
				pcall(var_75_2.removeFromParentAndCleanup, var_75_2, true)
			end

			local var_75_3, var_75_4 = var_75_1.sprite:getPosition()
			local var_75_5 = require("lua/layer/world/FeudMenu").new(iter_75_1, var_75_1)

			var_75_5:setPosition(ccp(var_75_3, var_75_4))
			var_75_0.worldLayer:addChild(var_75_5, 110)

			worldUI.feudTable[iter_75_0] = var_75_5
		end
	end
end

function worldUI.removeBtnFeud(arg_76_0)
	if arg_76_0 == nil then
		return
	end

	user.feuds = user.feuds or {}
	user.feudCities = user.feudCities or {}
	user.feudSealCities = user.feudSealCities or {}
	worldUI.feudTable = worldUI.feudTable or {}
	user.feuds[arg_76_0] = nil
	user.feudCities[arg_76_0] = nil
	user.feudSealCities[arg_76_0] = nil

	local var_76_0 = smgr.getLayer("worldCamera").cityTable["world_building_" .. arg_76_0]
	local var_76_1 = worldUI.feudTable[arg_76_0]

	if var_76_1 then
		worldUI.feudTable[arg_76_0] = nil
		var_76_0.btn_seal = nil
		var_76_0.node_select = nil
		var_76_0.bg_select = nil
		var_76_0.node_produce = nil
		var_76_0.bg_produce = nil
		var_76_0.btn_reward2 = nil
		var_76_0.btn_flag = nil

		var_76_1:removeFromParentAndCleanup(true)
	end

	notice.control.refreshLayer()
end

function worldUI.addChampion(arg_77_0)
	if not arg_77_0.kfzbeliteChampion and not arg_77_0.kfwdeliteChampion then
		return
	end

	local var_77_0 = {
		ccp(3545, 3225),
		ccp(385, 1800),
		ccp(4610, 525)
	}
	local var_77_1 = smgr.getLayer("worldCamera")
	local var_77_2 = require("lua/layer/kfzb/CurrChampion").new(arg_77_0)

	var_77_2:setPosition(var_77_0[user.player.forceId])
	var_77_1.worldLayer:addChild(var_77_2, 110)
end

function worldUI.addBtnGoHome(arg_78_0)
	local var_78_0 = {
		123,
		19,
		207
	}
	local var_78_1 = smgr.getLayer("worldCamera")
	local var_78_2 = var_78_1.cityTable["world_building_" .. var_78_0[user.player.forceId]]

	if var_78_2.sprite then
		local var_78_3 = {
			y = 0,
			name = "root",
			scale = 0.8,
			type = "node",
			x = 0,
			children = {
				{
					zoomOnTouchDown = true,
					name = "btn_back",
					h = 72,
					type = "button",
					w = 73,
					y = 0,
					x = 0,
					normal = {
						path = "res/ui/resourceArea2/zcgz_btn_round.png"
					},
					touched = {
						path = "res/ui/resourceArea2/zcgz_btn_round_c.png"
					},
					children = {
						{
							y = 36,
							x = 36,
							type = "sprite",
							pic = {
								path = "res/ui/world/hc_btn.png"
							}
						},
						{
							y = 15,
							x = 36,
							type = "sprite",
							pic = {
								path = "res/ui/world/hc_btn_word.png"
							}
						}
					}
				}
			}
		}
		local var_78_4, var_78_5 = var_78_2.sprite:getPosition()
		local var_78_6 = {}

		uiutil.initWidgets(var_78_6, var_78_3)
		var_78_1.worldLayer:addChild(var_78_6.widgets.root, 105)
		var_78_6.widgets.root:setPosition(ccp(var_78_4 + 120, var_78_5 - 50))
		var_78_6.widgets.btn_back:addHandleOfControlEvent(function()
			log.info("btn_back")
			messageBox.showChargeWin("", language.get(490124, arg_78_0.quickGoHomeCost), "quickGoHome", function()
				local function var_80_0(arg_81_0)
					return
				end

				cmgr.sendRequest(var_80_0, actions.generalGoHome)
			end)
		end, CCControlEventTouchUpInside)
	end
end

function worldUI.addBtnLitFire(arg_82_0)
	worldUI.litFireTable = worldUI.litFireTable or {}

	local var_82_0 = arg_82_0.cityId
	local var_82_1 = smgr.getLayer("worldCamera")
	local var_82_2 = var_82_1.cityTable["world_building_" .. var_82_0]

	if worldUI.litFireTable[var_82_0] then
		-- block empty
	else
		local var_82_3, var_82_4 = var_82_2.sprite:getPosition()
		local var_82_5 = require("lua/layer/world/FireMenu").new(arg_82_0)

		var_82_5:setPosition(ccp(var_82_3 + 120, var_82_4 - 50))
		var_82_1.worldLayer:addChild(var_82_5, 110)

		worldUI.litFireTable[var_82_0] = var_82_5
	end
end

function worldUI.addDiedCastleNpc(arg_83_0)
	worldUI.diedCastleNpcTable = worldUI.diedCastleNpcTable or {}

	local var_83_0 = arg_83_0.cityId
	local var_83_1 = worldUI.diedCastleNpcTable[var_83_0]

	if var_83_1 then
		var_83_1:showPanel(arg_83_0)
	else
		local var_83_2 = smgr.getLayer("worldCamera")
		local var_83_3 = require("lua/layer/world/DiedCastleNpc").new(arg_83_0)

		var_83_3:setPosition(ccp(0, 0))
		var_83_2.worldLayer:addChild(var_83_3, 110)

		worldUI.diedCastleNpcTable[var_83_0] = var_83_3
	end
end

function worldUI.addBtnExtinguish(arg_84_0)
	worldUI.extinguishTable = worldUI.extinguishTable or {}

	local var_84_0 = arg_84_0.cityId
	local var_84_1 = smgr.getLayer("worldCamera")
	local var_84_2 = var_84_1.cityTable["world_building_" .. var_84_0]
	local var_84_3 = worldUI.extinguishTable[var_84_0]

	if arg_84_0.hp > 0 then
		if var_84_3 then
			var_84_3:showPanel(arg_84_0)
		else
			local var_84_4, var_84_5 = var_84_2.sprite:getPosition()
			local var_84_6 = require("lua/layer/world/FireMenu").new(arg_84_0)

			var_84_6:setPosition(ccp(var_84_4 + 120, var_84_5 - 50))
			var_84_1.worldLayer:addChild(var_84_6, 110)

			worldUI.extinguishTable[var_84_0] = var_84_6
		end
	elseif var_84_3 then
		worldUI.extinguishTable[var_84_0] = nil

		var_84_3:removeFromParentAndCleanup(true)
	end
end

function worldUI.addTryTask(arg_85_0)
	local function var_85_0()
		local var_86_0 = camera.worldLayer:getChildByTag(1000 + arg_85_0.cityId)

		if var_86_0 then
			pcall(var_86_0.removeFromParentAndCleanup, var_86_0, true)
		end
	end

	local var_85_1 = smgr.getLayer("worldCamera")
	local var_85_2 = var_85_1.worldLayer:getChildByTag(1000 + arg_85_0.cityId)

	if var_85_2 then
		pcall(var_85_2.removeFromParentAndCleanup, var_85_2, true)
	end

	local var_85_3 = CCSprite:createWithSpriteFrameName("cc_manzu_bg.png")
	local var_85_4 = CCSprite:createWithSpriteFrameName("shoumaijingdudi.png")

	var_85_4:setPosition(ccp(96.5, 44))

	local var_85_5 = CCProgressTimer:create(CCSprite:createWithSpriteFrameName("shoumaijingdutiao.png"))

	var_85_5:setPosition(ccp(71, 10.5))
	var_85_4:addChild(var_85_5)
	var_85_5:setType(kCCProgressTimerTypeBar)
	var_85_5:setMidpoint(ccp(0, 0))
	var_85_5:setBarChangeRate(ccp(1, 0))

	local var_85_6 = 100 * arg_85_0.killNum / arg_85_0.requestKillNum
	local var_85_7 = tool.toint(var_85_6)

	var_85_5:setPercentage(100 - var_85_7)

	local var_85_8 = CCStrokeLabelTTF:create(tostring(var_85_7) .. "%", "Thonburi", 18)

	var_85_8:setPosition(ccp(164, 10.5))
	var_85_4:addChild(var_85_8)

	local var_85_9 = createTimerLabel(arg_85_0.endTime, "@H:@M:@S", "Thonburi-Bold", 20, var_85_0, nil, nil, ccc3(217, 87, 74))

	var_85_9:setPosition(ccp(116.5, 20))
	var_85_3:addChild(var_85_9)
	var_85_3:addChild(var_85_4)

	local var_85_10 = var_85_1.cityTable["world_building_" .. arg_85_0.cityId]

	if var_85_10.sprite then
		local var_85_11, var_85_12 = var_85_10.sprite:getPosition()

		var_85_3:setPosition(ccp(var_85_11, var_85_12 + 70))
		var_85_1.worldLayer:addChild(var_85_3, 105, 1000 + arg_85_0.cityId)
	end
end

function worldUI.maskFog(arg_87_0)
	local var_87_0 = {}

	if conf.language == "vie" then
		var_87_0.talkLabelFntSize = -6
	else
		var_87_0.talkLabelFntSize = 0
	end

	local var_87_1 = arg_87_0.maskCity
	local var_87_2 = arg_87_0.gPic
	local var_87_3 = arg_87_0.rewardType
	local var_87_4 = worldConstant.FOG_WIN_DIALOG[1]
	local var_87_5 = smgr.getLayer("worldCamera")
	local var_87_6, var_87_7 = var_87_5.cityTable["world_building_" .. var_87_1].sprite:getPosition()
	local var_87_8 = CCSprite:createWithSpriteFrameName("worldForg.png")

	var_87_8:setPosition(ccp(var_87_6, var_87_7))

	local var_87_9 = CCSprite:createWithSpriteFrameName("worldDaojian.png")

	var_87_9:setPosition(ccp(var_87_8:getContentSize().width / 2, var_87_8:getContentSize().height / 2))
	var_87_8:addChild(var_87_9)

	local var_87_10 = CCSprite:createWithSpriteFrameName("worldForgReward" .. var_87_3 .. ".png")

	var_87_10:setPosition(ccp(var_87_9:getContentSize().width / 2 - 60, var_87_9:getContentSize().height * 1.1))
	var_87_9:addChild(var_87_10)

	local var_87_11 = CCSprite:createWithSpriteFrameName("worldForgXuetiaodi.png")

	var_87_11:setPosition(ccp(var_87_9:getContentSize().width / 2 + 15, var_87_9:getContentSize().height * 1.1))
	var_87_9:addChild(var_87_11)

	local var_87_12 = CCSprite:createWithSpriteFrameName("worldFogDuihuakuang.png")

	var_87_12:setPosition(var_87_8:getContentSize().width / 2 - var_87_12:getContentSize().width / 2 - 40, var_87_8:getContentSize().height / 2 - 20)
	var_87_8:addChild(var_87_12)

	local var_87_13 = CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", var_87_2))

	var_87_13:setPosition(ccp(76, 75))
	var_87_12:addChild(var_87_13)

	local var_87_14 = CCStrokeLabelTTF:create(var_87_4, "Thonburi", 22 + var_87_0.talkLabelFntSize)

	var_87_14:setDimensions(CCSizeMake(208, 120))
	var_87_14:setHorizontalAlignment(kCCTextAlignmentLeft)

	if conf.language == "kr" then
		var_87_14:setPosition(ccp(226, 68))
	elseif conf.language == "vie" then
		var_87_14:setPosition(ccp(226, 68))
		var_87_14:setDimensions(CCSizeMake(215, 0))
	else
		var_87_14:setPosition(ccp(226, 54))
	end

	var_87_12:addChild(var_87_14)
	var_87_5.worldLayer:addChild(var_87_8, 106)

	worldUI.fog = var_87_8
	worldUI.fogDuihuakuang = var_87_12
end

function worldUI.hideFog()
	local var_88_0 = CCFadeOut:create(1)
	local var_88_1 = CCArray:create()

	var_88_1:addObject(CCCallFuncN:create(function()
		if worldUI.fogDuihuakuang then
			pcall(worldUI.fogDuihuakuang.removeFromParentAndCleanup, worldUI.fogDuihuakuang, true)

			worldUI.fogDuihuakuang = nil
		end

		pcall(worldUI.fog.removeAllChildrenWithCleanup, worldUI.fog, true)
	end))
	var_88_1:addObject(var_88_0)
	var_88_1:addObject(CCCallFuncN:create(function()
		pcall(worldUI.fog.removeFromParentAndCleanup, worldUI.fog, true)

		worldUI.fog = nil
	end))

	local var_88_2 = CCSequence:create(var_88_1)

	if not tolua.isnull(worldUI.fog) then
		worldUI.fog:runAction(var_88_2)
	else
		worldUI.fog = nil
	end
end

function worldUI.showFortressCity(arg_91_0)
	local var_91_0 = smgr.getLayer("worldCamera")
	local var_91_1 = var_91_0.cityTable["world_building_" .. arg_91_0.cityId].sprite

	var_91_0.castleNode:removeChildByTag(worldConstant.CASTLE_BASE + arg_91_0.cityId, true)

	worldUI.castleTable[arg_91_0.cityId] = {}

	if arg_91_0.state == 3 and arg_91_0.category == 3 and type(arg_91_0.leftLitFireTimes == "number") and arg_91_0.leftLitFireTimes > 0 then
		worldUI.addBtnLitFire(arg_91_0)
	end

	if arg_91_0.state == 3 and arg_91_0.category == 4 and type(arg_91_0.perishCd == "number") and arg_91_0.perishCd > 0 then
		worldUI.addDiedCastleNpc(arg_91_0)
	end

	if (arg_91_0.state == 0 or arg_91_0.state == 1 or arg_91_0.state == 2) and user.player.forceId == arg_91_0.forceId then
		local var_91_2 = CCSprite:create()
		local var_91_3, var_91_4 = var_91_1:getPosition()

		var_91_2:setPosition(ccp(var_91_3, var_91_4))
		var_91_0.castleNode:addChild(var_91_2, 1000, worldConstant.CASTLE_BASE + arg_91_0.cityId)

		local var_91_5 = {
			background = {
				xcenter = 0,
				name = "mainBack",
				type = "pic",
				ycenter = 170,
				pic = "res/ui/world/buildNation/jgdy_jzys_d.png",
				children = {
					{
						xcenter = 0,
						name = "building_category",
						y = 190,
						type = "pic",
						pic = "res/ui/world/buildNation/jgdy_word_jzys.png"
					},
					{
						xcenter = 0,
						name = "title",
						y = 135,
						type = "pic",
						scale = 0.85,
						pic = "res/ui/world/buildNation/jgdy_bd_d.png",
						children = {
							{
								x = 20,
								scale = 1.1,
								type = "pic",
								ycenter = 0,
								pic = "res/ui/world/buildNation/jgdy_bd_lb.png"
							}
						}
					},
					{
						xcenter = 40,
						name = "people",
						y = 85,
						type = "pic",
						pic = "res/ui/world/manzu/zymz_pb_bg.png",
						children = {
							{
								x = -10,
								z = 200,
								type = "pic",
								ycenter = 0,
								pic = "res/ui/nation/buildNation/mainTask/jgdy_gcqz_res_bg.png",
								children = {
									{
										xcenter = 0,
										name = "up_icon",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/world/buildNation/jgdy_icon_rs.png"
									}
								}
							},
							{
								xcenter = 0,
								name = "numOfPeople",
								fontSize = 22,
								type = "label",
								ycenter = 0,
								z = 200,
								text = "0/0",
								font = "Thonburi",
								color = ccc3(204, 185, 134),
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								halign = kCCTextAlignmentLeft
							},
							{
								xcenter = 0,
								name = "peopleProcess",
								type = "process",
								ycenter = 0,
								pic = "res/ui/world/manzu/zymz_pb.png"
							}
						}
					},
					{
						xcenter = 40,
						name = "time",
						y = 45,
						type = "pic",
						pic = "res/ui/world/manzu/zymz_pb_bg.png",
						children = {
							{
								x = -10,
								z = 200,
								type = "pic",
								ycenter = 0,
								pic = "res/ui/nation/buildNation/mainTask/jgdy_gcqz_res_bg.png",
								children = {
									{
										xcenter = 0,
										name = "down_icon",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/world/buildNation/jgdy_icon_sj.png"
									}
								}
							},
							{
								xcenter = 0,
								name = "timeProcess",
								type = "process",
								ycenter = 0,
								pic = "res/ui/world/manzu/zymz_pb.png"
							}
						}
					},
					{
						x = 85,
						name = "zhaojiButton",
						y = 65,
						type = "pic",
						pic = "res/ui/world/buildNation/jgdy_jzys_btn_qw.png"
					},
					{
						xcenter = 0,
						name = "canyurenshu",
						y = -15,
						type = "pic",
						pic = "res/ui/world/buildNation/jgdy_word_dqcyrs_d.png",
						children = {
							{
								xcenter = -50,
								ycenter = 0,
								pic = "res/ui/world/buildNation/jgdy_word_dqcyrs.png",
								type = "pic"
							},
							{
								height = 26,
								name = "peopleTotalNum",
								type = "atlas",
								ycenter = 0,
								z = 500,
								pic = "res/ui/common/number/jgdy_jzd_word_digit.png",
								text = "0",
								startChar = 48,
								width = 20,
								xcenter = 80 + (var_0_0.peopleTotalNumOffsetX or 0)
							},
							{
								xcenter = 120,
								name = "showPeopleButton",
								type = "pic",
								ycenter = 0,
								pic = "res/ui/world/buildNation/jgdy_arrow.png"
							}
						}
					},
					{
						xcenter = 0,
						name = "peopleList",
						y = -130,
						type = "pic",
						visible = false,
						pic = "res/ui/world/buildNation/jgdy_list_d.png",
						children = {
							{
								x = 50,
								name = "leftArrow",
								rotate = 180,
								type = "pic",
								ycenter = 0,
								pic = "res/ui/world/buildNation/jgdy_jzd_arrow.png"
							},
							{
								x = 382,
								name = "rightArrow",
								type = "pic",
								ycenter = 0,
								pic = "res/ui/world/buildNation/jgdy_jzd_arrow.png"
							},
							{
								x = 150,
								name = "people1bg",
								type = "pic",
								ycenter = 45,
								pic = "res/ui/task/get_rewa_icon.jpg",
								children = {
									{
										xcenter = 0,
										name = "peopleHead1",
										scale = 0.6,
										type = "pic",
										ycenter = 0,
										pic = "res/ui/common/playerHead/playerHead_icon_0.png"
									},
									{
										xcenter = -15,
										name = "peopleWork1",
										type = "pic",
										ycenter = -25,
										pic = "res/ui/world/buildNation/jgdy_jzd_word_qj.png"
									},
									{
										xcenter = 100,
										name = "peopleName1",
										fontSize = 22,
										type = "label",
										ycenter = 15,
										text = "",
										font = "Thonburi",
										color = ccc3(204, 185, 134),
										halign = kCCTextAlignmentLeft
									},
									{
										xcenter = 100,
										name = "peopleLv1",
										fontSize = 20,
										type = "label",
										ycenter = -15,
										text = "",
										font = "Thonburi",
										color = ccc3(204, 185, 134),
										halign = kCCTextAlignmentLeft
									}
								}
							},
							{
								x = 150,
								name = "people2bg",
								type = "pic",
								ycenter = -45,
								pic = "res/ui/task/get_rewa_icon.jpg",
								children = {
									{
										xcenter = 0,
										name = "peopleHead2",
										scale = 0.6,
										type = "pic",
										ycenter = 0,
										pic = "res/ui/common/playerHead/playerHead_icon_0.png"
									},
									{
										xcenter = -15,
										name = "peopleWork2",
										type = "pic",
										ycenter = -25,
										pic = "res/ui/world/buildNation/jgdy_jzd_word_qj.png"
									},
									{
										xcenter = 100,
										name = "peopleName2",
										fontSize = 22,
										type = "label",
										ycenter = 15,
										text = "",
										font = "Thonburi",
										color = ccc3(204, 185, 134),
										halign = kCCTextAlignmentLeft
									},
									{
										xcenter = 100,
										name = "peopleLv2",
										fontSize = 20,
										type = "label",
										ycenter = -15,
										text = "",
										font = "Thonburi",
										color = ccc3(204, 185, 134),
										halign = kCCTextAlignmentLeft
									}
								}
							}
						}
					}
				}
			}
		}
		local var_91_6 = autoUI.initUI(var_91_2, var_91_5)

		if arg_91_0.state == 1 then
			local var_91_7 = CCSprite:create()

			var_91_7:setPosition(ccp(216, -80))

			local var_91_8 = rmgr.getAnimation("buildCastleAnimation")
			local var_91_9 = CCAnimation:createWithSpriteFrames(var_91_8, 0.1)
			local var_91_10 = CCAnimate:create(var_91_9)

			var_91_7:runAction(CCRepeatForever:create(var_91_10))
			var_91_6.mainBack:addChild(var_91_7)
		end

		if arg_91_0.state ~= 0 then
			local var_91_11 = CCLabelTTF:create(" ", "Thonburi", 20)

			var_91_11:setColor(ccc3(204, 185, 134))

			local var_91_12 = CCLabelTTF:create(" ", "Thonburi", 20)

			var_91_12:setColor(ccc3(0, 255, 0))

			local var_91_13 = CCArray:create()

			var_91_13:addObject(CCFadeIn:create(0.2))
			var_91_13:addObject(CCDelayTime:create(2))
			var_91_13:addObject(CCFadeOut:create(0.2))

			local function var_91_14()
				local function var_92_0(arg_93_0, arg_93_1)
					if arg_93_0:getContentSize().width / 2 + arg_93_1:getContentSize().width / 2 ~= arg_93_1:getPositionX() - arg_93_0:getPositionX() then
						local var_93_0 = arg_93_0:getContentSize().width / 2 + arg_93_1:getContentSize().width / 2 - (arg_93_1:getPositionX() - arg_93_0:getPositionX())
						local var_93_1, var_93_2 = arg_93_0:getPosition()

						arg_93_0:setPosition(ccp(var_93_1 - var_93_0 / 2, var_93_2))

						local var_93_3, var_93_4 = arg_93_1:getPosition()

						arg_93_1:setPosition(ccp(var_93_3 + var_93_0 / 2, var_93_4))
					end
				end

				if arg_91_0.state == 0 then
					var_91_11:setString(language.get("220983_buildNation", arg_91_0.index))
					var_91_12:setString(arg_91_0.fireName or language.get(200406))
					var_91_12:setColor(ccc3(0, 255, 0))
				elseif arg_91_0.state == 1 then
					if arg_91_0.workers then
						local var_92_1 = #arg_91_0.workers
						local var_92_2 = math.random(1, var_92_1)

						var_91_12:setString(arg_91_0.workers[var_92_2].name or language.get(200406))
						var_91_12:setColor(ccc3(0, 255, 0))

						local var_92_3 = math.random(1, 6)

						var_91_11:setString(language.get(220983 + var_92_3 .. "_buildNation"))
					end
				else
					var_91_11:setString(language.get("220990_buildNation"))
					var_91_12:setString(language.get("220959_buildNation"))
					var_91_12:setColor(ccc3(255, 0, 0))
				end

				var_92_0(var_91_12, var_91_11)
			end

			var_91_13:addObject(CCCallFuncN:create(var_91_14))
			var_91_13:addObject(CCDelayTime:create(0.2))

			local var_91_15 = CCSequence:create(var_91_13)

			var_91_11:runAction(CCRepeatForever:create(CCSequence:create(var_91_13)))

			local var_91_16 = createRichNode({
				var_91_12,
				var_91_11
			}, 0.5)

			var_91_16:setPosition(ccp(var_91_6.title:getContentSize().width / 2, var_91_6.title:getContentSize().height / 2))
			var_91_6.title:addChild(var_91_16)
		else
			local var_91_17 = CCLabelTTF:create(language.get("222027_buildingTech"), "Thonburi", 20)

			var_91_17:setColor(ccc3(204, 185, 134))

			local var_91_18 = createTimerLabel(arg_91_0.endTime, "@M:@S", "Thonburi", 22, nil, nil, nil, ccc3(255, 0, 0))

			var_91_17:setPosition(ccp(var_91_6.title:getContentSize().width / 2 + 40, var_91_6.title:getContentSize().height / 2))
			var_91_18:setPosition(ccp(var_91_6.title:getContentSize().width / 2 - 40 + (var_0_0.peopeNameOffsetX or 0), var_91_6.title:getContentSize().height / 2))
			var_91_6.title:addChild(var_91_17)
			var_91_6.title:addChild(var_91_18)
		end

		if arg_91_0.category then
			if arg_91_0.category == 1 then
				var_91_6.building_category:setDisplayFrame(CCSprite:create("res/ui/world/buildNation/jgdy_word_jzys.png"):displayFrame())

				if arg_91_0.state == 0 then
					var_91_6.up_icon:setDisplayFrame(CCSprite:create("res/ui/technology/buildTech/jzke_icon_cz.png"):displayFrame())
					var_91_6.down_icon:setDisplayFrame(CCSprite:create("res/ui/technology/buildTech/jzke_icon_fz.png"):displayFrame())
				end
			elseif arg_91_0.category == 2 then
				var_91_6.building_category:setDisplayFrame(CCSprite:create("res/ui/world/buildNation/jzke_ys_word_jsl01.png"):displayFrame())

				if arg_91_0.state == 0 then
					var_91_6.up_icon:setDisplayFrame(CCSprite:create("res/ui/technology/buildTech/jzke_icon_cz.png"):displayFrame())
					var_91_6.down_icon:setDisplayFrame(CCSprite:create("res/ui/technology/buildTech/jzke_icon_fz.png"):displayFrame())
				end
			elseif arg_91_0.category == 3 then
				var_91_6.building_category:setDisplayFrame(CCSprite:create("res/ui/world/buildNation/jzke_ys_word_jhk01.png"):displayFrame())

				if arg_91_0.state == 0 then
					var_91_6.up_icon:setDisplayFrame(CCSprite:create("res/ui/technology/buildTech/jzke_icon_cz.png"):displayFrame())
					var_91_6.down_icon:setDisplayFrame(CCSprite:create("res/ui/technology/buildTech/jzke_icon_fz.png"):displayFrame())
				end
			elseif arg_91_0.category == 4 then
				var_91_6.building_category:setDisplayFrame(CCSprite:create("res/ui/world/buildNation/ssy_word_jzssy.png"):displayFrame())

				if arg_91_0.state == 0 then
					var_91_6.up_icon:setDisplayFrame(CCSprite:create("res/ui/technology/buildTech/jzke_icon_cz.png"):displayFrame())
					var_91_6.down_icon:setDisplayFrame(CCSprite:create("res/ui/technology/buildTech/jzke_icon_fz.png"):displayFrame())
				end
			end
		end

		if arg_91_0.state == 0 then
			if arg_91_0.requires then
				if arg_91_0.requires[1] then
					var_91_6.peopleProcess:setPercentage(arg_91_0.requires[1].nowNum * 100 / arg_91_0.requires[1].maxNum)
					var_91_6.numOfPeople:setString(arg_91_0.requires[1].nowNum .. "/" .. arg_91_0.requires[1].maxNum)
				end

				if arg_91_0.requires[2] then
					var_91_6.timeProcess:setPercentage(arg_91_0.requires[2].nowNum * 100 / arg_91_0.requires[2].maxNum)

					local var_91_19 = CCStrokeLabelTTF:create(arg_91_0.requires[2].nowNum .. "/" .. arg_91_0.requires[2].maxNum, "Thonburi", 22)

					var_91_19:setPosition(ccp(var_91_6.time:getContentSize().width / 2, var_91_6.time:getContentSize().height / 2))
					var_91_6.time:addChild(var_91_19, 300)
				else
					var_91_6.time:setVisible(false)
				end
			end
		else
			var_91_6.peopleProcess:setPercentage(arg_91_0.nowNum * 100 / arg_91_0.maxNum)
			var_91_6.numOfPeople:setString(arg_91_0.nowNum .. "/" .. arg_91_0.maxNum)
			var_91_6.timeProcess:setPercentage(arg_91_0.endTime * 100 / arg_91_0.lastTime)

			local var_91_20 = CCParticleSystemQuad:create("res/ui/world/fortress/pb.plist")

			var_91_6.time:addChild(var_91_20, 299)
			var_91_20:setScale(0.5)
			var_91_20:setRotation(-90)
			var_91_20:setPosition(ccp(arg_91_0.endTime * 197 / arg_91_0.lastTime, 12))

			if arg_91_0.state == 2 then
				local var_91_21 = CCStrokeLabelTTF:create(tool.formatTime(arg_91_0.endTime, "@M:@S"), "Thonburi", 22)

				var_91_21:setPosition(ccp(var_91_6.time:getContentSize().width / 2, var_91_6.time:getContentSize().height / 2))
				var_91_6.time:addChild(var_91_21, 300)
			else
				local var_91_22 = createTimerLabel(arg_91_0.endTime, "@M:@S", "Thonburi", 22, nil, nil, nil, ccc3(255, 255, 255))

				var_91_22:setPosition(ccp(var_91_6.time:getContentSize().width / 2, var_91_6.time:getContentSize().height / 2))
				var_91_6.time:addChild(var_91_22, 300)
			end

			local var_91_23 = createBaseLayer()
			local var_91_24 = arg_91_0.endTime

			local function var_91_25(arg_94_0)
				if var_91_24 > 0 then
					if arg_91_0.state == 2 then
						-- block empty
					else
						var_91_24 = var_91_24 - 1000
					end

					var_91_6.timeProcess:setPercentage(var_91_24 * 100 / arg_91_0.lastTime)

					if var_91_20 then
						var_91_20:setPosition(ccp(var_91_24 * 197 / arg_91_0.lastTime, 12))
					end
				end
			end

			local var_91_26

			function var_91_23.onEnter(arg_95_0)
				var_91_26 = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_91_25, 1, false)
			end

			function var_91_23.onExit(arg_96_0)
				if var_91_26 then
					CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_91_26)
				end
			end

			var_91_2:addChild(var_91_23)
		end

		var_91_6.peopleTotalNum:setString(arg_91_0.nowNum)

		if arg_91_0.workers then
			for iter_91_0 = 1, 2 do
				if arg_91_0.workers[iter_91_0] then
					var_91_6["peopleHead" .. iter_91_0]:setDisplayFrame(CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. arg_91_0.workers[iter_91_0].pic .. ".png"):displayFrame())
					var_91_6["peopleName" .. iter_91_0]:setString(arg_91_0.workers[iter_91_0].name)
					var_91_6["peopleLv" .. iter_91_0]:setString("Lv." .. arg_91_0.workers[iter_91_0].lv)
				end
			end
		end

		worldUI.castleTable[arg_91_0.cityId].currentButtonState = 4

		if arg_91_0.state == 0 then
			if arg_91_0.canBuild ~= 1 and arg_91_0.participate ~= true then
				worldUI.castleTable[arg_91_0.cityId].currentButtonState = 1

				var_91_6.zhaojiButton:setDisplayFrame(CCSprite:create("res/ui/world/buildNation/jgdy_jzys_btn_qw.png"):displayFrame())
			elseif arg_91_0.participate ~= true then
				worldUI.castleTable[arg_91_0.cityId].currentButtonState = 2

				var_91_6.zhaojiButton:setDisplayFrame(CCSprite:create("res/ui/world/buildNation/jgdy_jzys_btn_cy.png"):displayFrame())
			else
				worldUI.castleTable[arg_91_0.cityId].currentButtonState = 3

				var_91_6.zhaojiButton:setDisplayFrame(CCSprite:create("res/ui/world/buildNation/jgdy_jzys_btn_mj.png"):displayFrame())
			end
		elseif arg_91_0.state == 2 then
			worldUI.castleTable[arg_91_0.cityId].currentButtonState = 5

			var_91_6.zhaojiButton:setDisplayFrame(CCSprite:create("res/ui/world/buildNation/jgdy_jzys_btn_ztz.png"):displayFrame())
		elseif arg_91_0.canBuild ~= 2 and arg_91_0.participate ~= true then
			worldUI.castleTable[arg_91_0.cityId].currentButtonState = 1

			var_91_6.zhaojiButton:setDisplayFrame(CCSprite:create("res/ui/world/buildNation/jgdy_jzys_btn_qw.png"):displayFrame())
		elseif arg_91_0.participate ~= true then
			worldUI.castleTable[arg_91_0.cityId].currentButtonState = 2

			var_91_6.zhaojiButton:setDisplayFrame(CCSprite:create("res/ui/world/buildNation/jgdy_jzys_btn_xz.png"):displayFrame())
		else
			worldUI.castleTable[arg_91_0.cityId].currentButtonState = 4

			var_91_6.zhaojiButton:setDisplayFrame(CCSprite:create("res/ui/world/buildNation/jgdy_jzys_btn_jzz.png"):displayFrame())
		end

		worldUI.castleTable[arg_91_0.cityId].castle = arg_91_0
		worldUI.castleTable[arg_91_0.cityId].castleTable = var_91_6
		worldUI.castleTable[arg_91_0.cityId].currentPage = 1
	elseif (arg_91_0.state == 0 or arg_91_0.state == 1 or arg_91_0.state == 2) and user.player.forceId ~= arg_91_0.forceId then
		local var_91_27 = CCSprite:create()
		local var_91_28, var_91_29 = var_91_1:getPosition()

		var_91_27:setPosition(ccp(var_91_28, var_91_29))
		var_91_0.castleNode:addChild(var_91_27, 1000, worldConstant.CASTLE_BASE + arg_91_0.cityId)

		local var_91_30 = "jgdy_word_jzys.png"

		if arg_91_0.category == 2 then
			var_91_30 = "jzke_ys_word_jsl01.png"
		elseif arg_91_0.category == 3 then
			var_91_30 = "jzke_ys_word_jhk01.png"
		elseif arg_91_0.category == 3 then
			var_91_30 = "ssy_word_jzssy.png"
		elseif arg_91_0.category == 4 then
			var_91_30 = "ssy_word_jzssy.png"
		end

		local var_91_31 = CCSprite:create("res/ui/world/buildNation/" .. var_91_30)

		var_91_31:setPosition(ccp(0, 100))
		var_91_27:addChild(var_91_31)

		local var_91_32 = CCArray:create()

		var_91_32:addObject(CCFadeIn:create(0.2))
		var_91_32:addObject(CCDelayTime:create(1))
		var_91_32:addObject(CCFadeOut:create(0.2))

		local var_91_33 = CCSequence:create(var_91_32)

		var_91_31:runAction(CCRepeatForever:create(CCSequence:create(var_91_32)))

		if arg_91_0.state == 1 then
			local var_91_34 = CCSprite:create()

			var_91_34:setPosition(ccp(-10, 10))

			local var_91_35 = rmgr.getAnimation("buildCastleAnimation")
			local var_91_36 = CCAnimation:createWithSpriteFrames(var_91_35, 0.1)
			local var_91_37 = CCAnimate:create(var_91_36)

			var_91_34:runAction(CCRepeatForever:create(var_91_37))
			var_91_27:addChild(var_91_34)
		end
	elseif arg_91_0.state == 3 then
		if user.inkbtask == true and user.kbLv <= 0 then
			return
		end

		if user.player.forceId == arg_91_0.forceId and (arg_91_0.participate == true or user.player.playerId == arg_91_0.firePlayerId) and arg_91_0.rewarded == false then
			local var_91_38 = CCSprite:create()
			local var_91_39, var_91_40 = var_91_1:getPosition()

			var_91_38:setPosition(ccp(var_91_39, var_91_40))
			var_91_0.castleNode:addChild(var_91_38, 1000, worldConstant.CASTLE_BASE + arg_91_0.cityId)

			local var_91_41 = CCMenu:create()

			var_91_38:addChild(var_91_41)
			var_91_41:setPosition(ccp(55, 45))

			local var_91_42 = CCSprite:create("res/ui/world/buildNation/jgdy_btn_lqcl.png")
			local var_91_43 = CCSprite:create("res/ui/world/buildNation/jgdy_btn_lqcl_c.png")
			local var_91_44 = CCMenuItemSprite:create(var_91_42, var_91_43)

			var_91_44:setPosition(ccp(-50, 55))
			var_91_41:addChild(var_91_44, 10)
			var_91_44:registerScriptTapHandler(function()
				log.info("kick castle build reward")

				local function var_97_0(arg_98_0)
					local var_98_0 = arg_98_0.data or arg_98_0.action.data

					if var_98_0 and var_98_0.rewards then
						local var_98_1 = {}
						local var_98_2 = 1

						for iter_98_0, iter_98_1 in pairs(var_98_0.rewards) do
							var_98_1[var_98_2] = {}

							if iter_98_1.type == 21 then
								var_98_1[var_98_2].id = 7
							else
								var_98_1[var_98_2].id = iter_98_1.type
							end

							var_98_1[var_98_2].value = iter_98_1.num
							var_98_1[var_98_2].gemLevel = iter_98_1.lv or 1
							var_98_2 = var_98_2 + 1
						end

						globalAction_gotResource(var_98_1)
					end
				end

				cmgr.sendRequest(var_97_0, actions.castleReward, arg_91_0.cityId)
			end)
		end

		local var_91_45 = worldConstant.castle[worldConstant.BUILDING_INFO["world_building_" .. arg_91_0.cityId].model]

		if var_91_45 == nil then
			if arg_91_0.category then
				var_91_1:setDisplayFrame(tool.spriteFrameByName(worldConstant.castle.other[arg_91_0.index + 3 * (arg_91_0.category - 1)].model))
			else
				var_91_1:setDisplayFrame(tool.spriteFrameByName(worldConstant.castle.other[arg_91_0.index].model))
			end
		else
			var_91_1:setDisplayFrame(tool.spriteFrameByName(var_91_45[arg_91_0.index].model))
		end

		if arg_91_0.armyLeftTime and arg_91_0.armyLeftTime > 0 then
			local var_91_46 = math.modf(arg_91_0.armyLeftTime / 1000) + 1

			if var_91_46 > 20 then
				var_91_46 = 20
			end

			local var_91_47 = CCSprite:create()
			local var_91_48, var_91_49 = var_91_1:getPosition()

			var_91_47:setPosition(ccp(var_91_48 - 90, var_91_49 - 60))
			var_91_0.castleNode:addChild(var_91_47, 1000, worldConstant.CASTLE_BASE + arg_91_0.cityId)

			local var_91_50 = CCSprite:create("res/ui/battle/junhuoku/jhk_word_d_s.png")

			var_91_50:setPosition(ccp(var_91_1:getContentSize().width * 0.5, var_91_1:getContentSize().height * 0.5))
			var_91_47:addChild(var_91_50, 100, worldConstant.CASTLE_BOMB)

			local var_91_51 = CCLabelAtlas:create(tostring(var_91_46), "res/ui/battle/junhuoku/jhk_word_djs_digit.png", 36, 54, 48)

			var_91_51:setPosition(ccp(var_91_50:getContentSize().width * 0.5 + 50, 3))
			var_91_50:addChild(var_91_51)

			local var_91_52 = CCSprite:create("res/ui/battle/junhuoku/jhk_word_bzdjs.png")

			var_91_52:setPosition(ccp(-100, 26))
			var_91_51:addChild(var_91_52)

			local function var_91_53()
				var_91_46 = var_91_46 - 1

				if var_91_46 > 0 then
					var_91_51:setString(tostring(var_91_46))
				else
					tool.safeRemoveChildByTag(var_91_47, worldConstant.CASTLE_BOMB)
				end
			end

			local var_91_54 = CCArray:create()

			for iter_91_1 = 1, var_91_46 + 1 do
				var_91_54:addObject(CCFadeIn:create(0.2))
				var_91_54:addObject(CCDelayTime:create(0.6))
				var_91_54:addObject(CCFadeOut:create(0.2))
				var_91_54:addObject(CCCallFuncN:create(var_91_53))
			end

			local var_91_55 = CCSequence:create(var_91_54)

			var_91_50:runAction(CCSequence:create(var_91_54))
		end

		if arg_91_0.isKbTarget then
			local var_91_56 = CCSprite:create()
			local var_91_57, var_91_58 = var_91_1:getPosition()

			var_91_56:setPosition(ccp(var_91_57, var_91_58))
			var_91_0.castleNode:addChild(var_91_56, 1000, worldConstant.CASTLE_BASE + arg_91_0.cityId)

			local var_91_59 = rmgr.getAnimation("shield")
			local var_91_60 = CCAnimation:createWithSpriteFrames(var_91_59, 0.05)
			local var_91_61 = CCAnimate:create(var_91_60)
			local var_91_62 = CCRepeatForever:create(var_91_61)

			var_91_56:runAction(var_91_62)
		end
	elseif arg_91_0.state == 4 then
		if user.inkbtask == true and user.kbLv <= 0 then
			return
		end

		if user.player.forceId ~= arg_91_0.forceId and arg_91_0.winner == true and arg_91_0.rewarded == false and arg_91_0.fireName ~= "王" then
			local var_91_63 = CCSprite:create()
			local var_91_64, var_91_65 = var_91_1:getPosition()

			var_91_63:setPosition(ccp(var_91_64, var_91_65))
			var_91_0.castleNode:addChild(var_91_63, 1000, worldConstant.CASTLE_BASE + arg_91_0.cityId)

			local var_91_66 = CCMenu:create()

			var_91_63:addChild(var_91_66)
			var_91_66:setPosition(ccp(55, 45))

			local var_91_67 = "jzkj_btn_gpys.png"
			local var_91_68 = "jzkj_btn_gpys_c.png"

			if arg_91_0.category == 2 then
				var_91_67 = "jzkj_btn_gpjsl.png"
				var_91_68 = "jzkj_btn_gpjsl_c.png"
			elseif arg_91_0.category == 3 then
				var_91_67 = "jzkj_btn_gpjhk.png"
				var_91_68 = "jzkj_btn_gpjhk_c.png"
			elseif arg_91_0.category == 4 then
				var_91_67 = "ssy_btn_gpssy.png"
				var_91_68 = "ssy_btn_gpssy_c.png"
			end

			local var_91_69 = CCSprite:create("res/ui/world/fortress/" .. var_91_67)
			local var_91_70 = CCSprite:create("res/ui/world/fortress/" .. var_91_68)
			local var_91_71 = CCMenuItemSprite:create(var_91_69, var_91_70)

			var_91_71:setPosition(ccp(-50, 55))
			var_91_66:addChild(var_91_71, 10)
			var_91_71:registerScriptTapHandler(function()
				log.info("kick castle build reward")

				local function var_100_0(arg_101_0)
					local var_101_0 = arg_101_0.data or arg_101_0.action.data

					if var_101_0 and var_101_0.rewards then
						local var_101_1 = {}
						local var_101_2 = 1

						for iter_101_0, iter_101_1 in pairs(var_101_0.rewards) do
							var_101_1[var_101_2] = {}

							if iter_101_1.type == 21 then
								var_101_1[var_101_2].id = 7
							else
								var_101_1[var_101_2].id = iter_101_1.type
							end

							var_101_1[var_101_2].value = iter_101_1.num
							var_101_1[var_101_2].gemLevel = iter_101_1.lv or 1
							var_101_2 = var_101_2 + 1
						end

						globalAction_gotResource(var_101_1)
					end
				end

				cmgr.sendRequest(var_100_0, actions.castleReward, arg_91_0.cityId)
			end)
		end

		if var_91_0.shenshiSkillNode:getChildByTag(worldConstant.TUCHENG_BASE + arg_91_0.cityId) then
			log.info("还在屠城状态中，不需要恢复原来样子")
		else
			var_91_1:setDisplayFrame(tool.spriteFrameByName(worldConstant.BUILDING_INFO["world_building_" .. arg_91_0.cityId].model))
		end
	end
end

function worldUI.changeWorkers(arg_102_0, arg_102_1)
	if worldUI.castleTable[arg_102_0] then
		local var_102_0 = worldUI.castleTable[arg_102_0]

		if var_102_0.castle.workers and var_102_0.currentPage then
			local var_102_1 = var_102_0.currentPage + arg_102_1

			for iter_102_0 = 1, 2 do
				if var_102_0.castle.workers[var_102_1 * 2 - 2 + iter_102_0] then
					local var_102_2 = var_102_0.castle.workers[var_102_1 * 2 - 2 + iter_102_0]

					var_102_0.castleTable["peopleHead" .. iter_102_0]:setDisplayFrame(CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. var_102_2.pic .. ".png"):displayFrame())
					var_102_0.castleTable["peopleName" .. iter_102_0]:setString(var_102_2.name)
					var_102_0.castleTable["peopleLv" .. iter_102_0]:setString("Lv." .. var_102_2.lv)

					worldUI.castleTable[arg_102_0].currentPage = var_102_1

					if var_102_1 <= 1 then
						var_102_0.castleTable.leftArrow:setVisible(false)
					else
						var_102_0.castleTable.leftArrow:setVisible(true)
					end

					if var_102_1 * 2 >= var_102_0.castle.nowNum then
						var_102_0.castleTable.rightArrow:setVisible(false)
					else
						var_102_0.castleTable.rightArrow:setVisible(true)
					end
				elseif iter_102_0 == 1 then
					return
				else
					var_102_0.castleTable["peopleHead" .. iter_102_0]:setDisplayFrame(CCSprite:create("res/ui/common/playerHead/playerHead_icon_0.png"):displayFrame())
					var_102_0.castleTable["peopleName" .. iter_102_0]:setString("")
					var_102_0.castleTable["peopleLv" .. iter_102_0]:setString("")
				end
			end
		end
	end
end

function worldUI.addBuilding(arg_103_0)
	local var_103_0 = smgr.getLayer("worldCamera")
	local var_103_1 = tool.split(arg_103_0, "#")

	for iter_103_0, iter_103_1 in pairs(var_103_1) do
		if #iter_103_1 > 0 then
			local var_103_2 = tool.split(iter_103_1, "|")

			var_103_0.addCity(var_103_2)
		end
	end
end

function worldUI.addTower(arg_104_0)
	local var_104_0 = arg_104_0

	arg_104_0 = var_0_2.arrowTowerStaticInfo[var_104_0.cityId]
	arg_104_0.durability = var_104_0.durability

	smgr.getLayer("worldCamera").addTower(arg_104_0)
end

function worldUI.addWishTree(arg_105_0)
	if user.activity.haveWishActivity and #arg_105_0 > 0 then
		smgr.getLayer("worldCamera").addWishTree(arg_105_0)
	end
end

function worldUI.addSpecialNpc(arg_106_0)
	smgr.getLayer("worldCamera").addSpecialNpc(arg_106_0)
end

function worldUI.addSpecialRoad()
	local var_107_0 = {
		ccp(3440, 2185),
		ccp(3240, 2170),
		ccp(3710, 1580),
		ccp(3570, 1560),
		ccp(2400, 1465),
		ccp(2335, 1520)
	}
	local var_107_1 = smgr.getLayer("worldCamera")

	for iter_107_0 = 1, 6 do
		local var_107_2 = CCSprite:create(string.format("res/ui/world/specialRoad%d.png", iter_107_0))

		var_107_2:setPosition(var_107_0[iter_107_0])
		var_107_1.worldLayer:addChild(var_107_2, 104)
	end
end

function worldUI.addBoxes(arg_108_0)
	local var_108_0 = smgr.getLayer("worldCamera")

	if arg_108_0 then
		var_108_0.addBox(arg_108_0)
	end
end

function worldUI.addCityEvent(arg_109_0)
	log.info("addCityEvent", tool.tableToJson(arg_109_0))

	local var_109_0 = smgr.getLayer("cityEventLayer")
	local var_109_1 = smgr.getLayer("worldCamera")

	if arg_109_0.cityEvent then
		local var_109_2 = var_109_1.cityTable["world_building_" .. arg_109_0.cityId]

		if var_109_2 == nil then
			return
		end

		if var_109_2.eventSprite then
			pcall(var_109_2.eventSprite.removeFromParentAndCleanup, var_109_2.eventSprite, true)

			var_109_2.eventSprite = nil
			var_109_2.eventInfo = nil
			worldControl.thumbnailIconTable["city_" .. arg_109_0.cityId] = nil
		end

		if arg_109_0.cityEvent.eventType == 1 and arg_109_0.cityEvent.eventCount == 0 then
			return
		end

		local var_109_3 = var_109_2.sprite
		local var_109_4 = CCSprite:create("res/ui/world/worldEventBtn1.png")

		var_109_2.eventSprite = var_109_4
		var_109_2.eventInfo = arg_109_0.cityEvent

		local var_109_5, var_109_6 = var_109_3:getPosition()

		var_109_4:setPosition(ccp(var_109_5, var_109_6 + 90))

		local var_109_7 = CCSprite:create()

		if tonumber(var_109_2.eventInfo.dropType) == 1 then
			var_109_7 = CCSprite:create("res/ui/task/get_icon_silver.png")
		elseif tonumber(var_109_2.eventInfo.dropType) == 2 then
			var_109_7 = CCSprite:create("res/ui/task/get_icon_wood.png")
		elseif tonumber(var_109_2.eventInfo.dropType) == 3 then
			var_109_7 = CCSprite:create("res/ui/task/get_icon_food.png")
		elseif tonumber(var_109_2.eventInfo.dropType) == 4 then
			var_109_7 = CCSprite:create("res/ui/task/get_icon_iron.png")
		elseif tonumber(var_109_2.eventInfo.dropType) == 5 then
			var_109_7 = CCSprite:create("res/ui/task/get_icon_exp.png")
		end

		var_109_7:setPosition(ccp(var_109_4:getContentSize().width / 2, var_109_4:getContentSize().height / 2))
		var_109_4:addChild(var_109_7, 100)

		if var_109_2.eventInfo.eventType == 1 then
			local var_109_8 = CCStrokeLabelTTF:create(tostring(var_109_2.eventInfo.eventCount), "Thonburi-Bold", 20)

			var_109_8:setPosition(ccp(var_109_4:getContentSize().width - var_109_8:getContentSize().width / 2, var_109_8:getContentSize().height / 2))
			var_109_4:addChild(var_109_8, 101)
		elseif var_109_2.eventInfo.eventType == 2 then
			local var_109_9 = createTimerLabel(var_109_2.eventInfo.countDown, "@H:@M:@S", "Thonburi-Bold", 20, nil, nil, nil, ccc3(217, 87, 74))

			var_109_9:setPosition(ccp(var_109_4:getContentSize().width / 2, 80))
			var_109_4:addChild(var_109_9, 100)
		end

		var_109_0:addChild(var_109_4, 100)

		worldControl.thumbnailIconTable["city_" .. arg_109_0.cityId] = var_109_2.eventInfo.dropType

		worldThumbnailUI.updateEventNum()
	elseif arg_109_0.yzjRefresh then
		local var_109_10 = var_109_1.cityTable["world_building_" .. arg_109_0.yzjRefresh.cityId]

		if var_109_10.eventSprite then
			if not var_109_10.eventInfo.isYzj then
				return
			end

			pcall(var_109_10.eventSprite.removeFromParentAndCleanup, var_109_10.eventSprite, true)

			var_109_10.eventSprite = nil
			var_109_10.eventInfo = nil
			worldControl.thumbnailIconTable["city_" .. arg_109_0.yzjRefresh.cityId] = nil
		end

		local var_109_11 = var_109_10.sprite
		local var_109_12 = CCSprite:create("res/ui/world/worldEventBtn1.png")
		local var_109_13 = CCSprite:create("res/ui/common/generalPic/generalPic_yuanzhengjun.jpg")

		var_109_13:setPosition(var_109_12:getContentSize().width / 2, var_109_12:getContentSize().height / 2)
		var_109_13:setScale(0.8)
		var_109_12:addChild(var_109_13)

		local var_109_14 = arg_109_0.yzjRefresh.detail[1].dropArray[1].dropType
		local var_109_15

		if var_109_14 == 5 then
			var_109_15 = CCSprite:create("res/ui/task/get_icon_exp.png")
		elseif var_109_14 == 4 then
			var_109_15 = CCSprite:create("res/ui/task/get_icon_iron.png")
		end

		if var_109_15 ~= nil then
			var_109_15:setPosition(var_109_13:getContentSize().width - var_109_15:getContentSize().width / 2 + 10, var_109_15:getContentSize().height / 2 - 10)
			var_109_13:addChild(var_109_15)

			var_109_10.eventSprite = var_109_12
			var_109_10.eventInfo = arg_109_0.yzjRefresh
			var_109_10.eventInfo.isYzj = true

			local var_109_16, var_109_17 = var_109_11:getPosition()

			var_109_12:setPosition(ccp(var_109_16, var_109_17 + 90))
			var_109_0:addChild(var_109_12, 100)
		end
	elseif arg_109_0.yzjRemove then
		local var_109_18 = var_109_1.cityTable["world_building_" .. arg_109_0.yzjRemove.cityId]

		if var_109_18.eventSprite then
			if not var_109_18.eventInfo.isYzj then
				return
			end

			pcall(var_109_18.eventSprite.removeFromParentAndCleanup, var_109_18.eventSprite, true)

			var_109_18.eventSprite = nil
			var_109_18.eventInfo = nil
			worldControl.thumbnailIconTable["city_" .. arg_109_0.yzjRemove.cityId] = nil
		end
	elseif arg_109_0.yzjMove then
		local var_109_19 = arg_109_0.yzjMove.fromCityId
		local var_109_20 = arg_109_0.yzjMove.toCityId
		local var_109_21 = smgr.getLayer("generalMoveLayer")
		local var_109_22 = CCSprite:createWithSpriteFrameName("move_por_move_view.png")
		local var_109_23 = var_109_1.cityTable["world_building_" .. var_109_19].sprite

		var_109_22:setPosition(ccp(var_109_23:getPosition()))
		var_109_21:addChild(var_109_22, 100)

		local var_109_24 = CCSprite:create("res/ui/common/fightPic/fightPic_yuanzhengjun.png")

		var_109_24:setPosition(ccp(var_109_22:getContentSize().width / 2, var_109_22:getContentSize().height / 2))
		tool.scaleTo(var_109_24, 59, 59)
		var_109_22:addChild(var_109_24)

		local function var_109_25()
			var_109_22:removeFromParentAndCleanup(true)
		end

		traceData.moveBetweenTwoCity(var_109_22, var_109_19, var_109_20, 4000, var_109_25, true)
	end
end

function worldUI.addPlayerEvent(arg_111_0)
	local var_111_0 = smgr.getLayer("cityEventLayer")
	local var_111_1 = smgr.getLayer("worldCamera").cityTable["world_building_" .. arg_111_0.cityId]

	if var_111_1.eventSprite then
		pcall(var_111_1.eventSprite.removeFromParentAndCleanup, var_111_1.eventSprite, true)

		var_111_1.eventSprite = nil
		var_111_1.eventInfo = nil
		worldControl.thumbnailIconTable["city_" .. arg_111_0.cityId] = nil
	end

	local var_111_2 = var_111_1.sprite
	local var_111_3 = CCSprite:create("res/ui/world/worldEventBtn1.png")

	var_111_1.eventSprite = var_111_3
	var_111_1.eventInfo = arg_111_0.playerEvent

	local var_111_4, var_111_5 = var_111_2:getPosition()

	var_111_3:setPosition(ccp(var_111_4, var_111_5 + 90))

	local var_111_6
	local var_111_7 = CCSprite:create()

	if tonumber(var_111_1.eventInfo.pic) == 1 then
		var_111_7 = CCSprite:create("res/ui/world/gem_busine.jpg")

		tool.scaleTo(var_111_7, 60, 60)

		var_111_6 = 6
	elseif tonumber(var_111_1.eventInfo.pic) == 2 then
		var_111_7 = CCSprite:create("res/ui/world/warlock_busine.jpg")

		tool.scaleTo(var_111_7, 60, 60)

		var_111_6 = 7
	elseif tonumber(var_111_1.eventInfo.pic) == 3 then
		var_111_7 = CCSprite:create("res/ui/world/get_icon_xtys.png")
		var_111_6 = 8
	elseif tonumber(var_111_1.eventInfo.pic) == 5 then
		log.info("event.cityId:%s", arg_111_0.cityId)

		local var_111_8 = CCSprite:create("res/ui/world/jubenEnter/jb_chsm.png")

		var_111_3:setDisplayFrame(var_111_8:displayFrame())

		var_111_7 = CCSprite:create("res/ui/world/jubenEnter/10004.png")

		local var_111_9 = CCRotateBy:create(1, 360)
		local var_111_10 = CCRepeatForever:create(tolua.cast(var_111_9, "CCActionInterval"))

		var_111_7:runAction(var_111_10)

		var_111_6 = 9
	elseif tonumber(var_111_1.eventInfo.pic) == 7 then
		var_111_7 = CCSprite:create("res/ui/world/sdhd_sdlr.png")

		tool.scaleTo(var_111_7, 60, 60)

		var_111_6 = 13
	elseif var_111_1.eventInfo.eventType == 1004 then
		log.info("city.eventInfo:%s", tool.tableToJson(var_111_1.eventInfo))

		var_111_7 = CCSprite:create("res/ui/common/generalPic/generalPic_" .. var_111_1.eventInfo.pic .. ".jpg")

		tool.scaleTo(var_111_7, 60, 60)

		var_111_6 = 12
	elseif var_111_1.eventInfo.eventType == 1008 then
		var_111_7 = CCSprite:create("res/ui/common/generalPic/generalPic_tufei.jpg")

		tool.scaleTo(var_111_7, 60, 60)

		var_111_6 = 10
	elseif var_111_1.eventInfo.eventType == 1009 then
		var_111_7 = CCSprite:create("res/ui/activity/gemsActivity/new/xsczbs_icon_01.png")

		tool.scaleTo(var_111_7, 60, 60)

		var_111_6 = 6
	elseif var_111_1.eventInfo.eventType == 1010 then
		var_111_7 = CCSprite:create("res/ui/activity/tiandeng/tdxy_world_light.jpg")

		tool.scaleTo(var_111_7, 60, 60)

		var_111_6 = 14
	elseif var_111_1.eventInfo.eventType == 1011 then
		if var_111_1.eventInfo.gain[1].gainType == 55 then
			var_111_7 = CCSprite:create("res/ui/world/world_silk.jpg")

			tool.scaleTo(var_111_7, 60, 60)

			var_111_6 = 55
		end
	elseif var_111_1.eventInfo.eventType == 1012 then
		var_111_7 = CCSprite:create("res/ui/activity/GeneralReward/kssj_icon_nr.jpg")

		tool.scaleTo(var_111_7, 60, 60)

		var_111_6 = 56
	elseif var_111_1.eventInfo.eventType == 1013 then
		var_111_7 = CCSprite:create("res/ui/activity/GeneralReward/kssj_icon_mj.jpg")

		tool.scaleTo(var_111_7, 60, 60)

		var_111_6 = 58
	elseif var_111_1.eventInfo.eventType == 1014 then
		var_111_7 = CCSprite:create("res/ui/activity/dragonBoat/icon_shuishou.jpg")

		tool.scaleTo(var_111_7, 60, 60)

		var_111_6 = 61
	elseif var_111_1.eventInfo.eventType == 1016 then
		var_111_7 = CCSprite:create("res/ui/activity/dragonBoat/icon_deer.jpg")

		tool.scaleTo(var_111_7, 60, 60)

		var_111_6 = 13
	elseif var_111_1.eventInfo.eventType == 1017 then
		var_111_7 = CCSprite:create("res/ui/activity/meteorite/sczys_icon_01.png")

		tool.scaleTo(var_111_7, 60, 60)

		var_111_6 = 8
	elseif var_111_1.eventInfo.eventType == 1006 then
		if var_111_1.eventInfo.gain[1].gainType == 51 then
			var_111_7 = CCSprite:create("res/ui/common/ItemsPic/tuntianling1.jpg")
		elseif var_111_1.eventInfo.gain[1].gainType == 52 then
			var_111_7 = CCSprite:create("res/ui/common/ItemsPic/tuntianling2.jpg")
		elseif var_111_1.eventInfo.gain[1].gainType == 53 then
			var_111_7 = CCSprite:create("res/ui/common/ItemsPic/tuntianling3.jpg")
		elseif var_111_1.eventInfo.gain[1].gainType == 54 then
			var_111_7 = CCSprite:create("res/ui/common/ItemsPic/tuntianling4.jpg")
		else
			var_111_7 = CCSprite:create("res/ui/common/ItemsPic/tuntianling.jpg")
		end

		tool.scaleTo(var_111_7, 60, 60)

		var_111_6 = 11
	elseif var_111_1.eventInfo.eventType == 1014 then
		var_111_7 = CCSprite:create("res/ui/activity/dragonBoat/sailor.jpg")

		tool.scaleTo(var_111_7, 60, 60)

		var_111_6 = 61
	elseif var_111_1.eventInfo.eventType == 1016 then
		var_111_7 = CCSprite:create("res/ui/activity/dragonBoat/elk.jpg")

		tool.scaleTo(var_111_7, 60, 60)

		var_111_6 = 65
	end

	var_111_7:setPosition(ccp(var_111_3:getContentSize().width / 2, var_111_3:getContentSize().height / 2))

	if tonumber(var_111_1.eventInfo.pic) == 5 then
		var_111_7:setPosition(ccp(35, 32))
	end

	var_111_3:addChild(var_111_7, 100)
	var_111_0:addChild(var_111_3, 100)

	if var_111_6 ~= nil then
		worldControl.thumbnailIconTable["city_" .. arg_111_0.cityId] = var_111_6
	end

	worldThumbnailUI.updateEventNum()
end

function worldUI.addForceEvent(arg_112_0)
	worldUI.forceEventTable = worldUI.forceEventTable or {}

	local var_112_0 = smgr.getLayer("cityEventLayer")
	local var_112_1 = smgr.getLayer("worldCamera")
	local var_112_2 = var_112_1.cityTable["world_building_" .. arg_112_0.cityId]
	local var_112_3 = worldUI.forceEventTable[arg_112_0.cityId]

	if var_112_3 then
		worldUI.forceEventTable[arg_112_0.cityId] = nil
		var_112_2.btn_event = nil
		var_112_2.btn_leave = nil

		var_112_3:removeFromParentAndCleanup(true)
	end

	local var_112_4

	if arg_112_0.type and (arg_112_0.state == 0 or arg_112_0.state == 1 or arg_112_0.state == 2) then
		local var_112_5 = var_112_2.sprite
		local var_112_6 = require("lua/layer/world/buildEvent/BuildMenu").new(arg_112_0, var_112_2)
		local var_112_7, var_112_8 = var_112_5:getPosition()

		var_112_6:setPosition(ccp(var_112_7, var_112_8))
		var_112_1.worldLayer:addChild(var_112_6, 110)

		worldUI.forceEventTable[arg_112_0.cityId] = var_112_6
		var_112_4 = arg_112_0.type <= 1 and 100001 or 100002
	end

	worldControl.thumbnailIconTable["city_" .. arg_112_0.cityId] = var_112_4

	worldThumbnailUI.updateEventNum()
end

function worldUI.autoBattleEffect(arg_113_0)
	if worldUI.abEffectSprite ~= nil and not tolua.isnull(worldUI.abEffectSprite) then
		worldUI.abEffectSprite:removeFromParentAndCleanup(true)
	end

	if arg_113_0 ~= nil then
		local var_113_0 = smgr.getLayer("worldCamera")
		local var_113_1, var_113_2 = var_113_0.cityTable["world_building_" .. arg_113_0].sprite:getPosition()
		local var_113_3 = CCSprite:create("res/ui/world/autoBattle/zdgz_city_xz.png")

		var_113_3:setPosition(ccp(var_113_1, var_113_2))
		var_113_0.worldLayer:addChild(var_113_3, 105)

		worldUI.abEffectSprite = var_113_3
	end
end

function worldUI.addTrickState(arg_114_0)
	if arg_114_0.type == "kongcheng" or arg_114_0.type == "huangbao" then
		local var_114_0 = arg_114_0.cityId

		if var_114_0 ~= nil then
			local var_114_1 = smgr.getLayer("worldCamera")
			local var_114_2 = var_114_1.cityTable["world_building_" .. var_114_0]

			var_114_2.trickState = var_114_2.trickState or {}

			local var_114_3, var_114_4 = var_114_2.sprite:getPosition()
			local var_114_5 = var_114_4 - 50 - 24 * (#var_114_2.trickState + 1)
			local var_114_6 = CCSprite:createWithSpriteFrameName("cc_view_bg.png")

			var_114_6:setPosition(ccp(var_114_3, var_114_5))
			var_114_1.worldLayer:addChild(var_114_6, 105)

			local var_114_7 = string.format("res/ui/general/wenguan/%s.png", arg_114_0.type)
			local var_114_8 = CCSprite:create(var_114_7)

			var_114_8:setPosition(ccp(23, 12))
			var_114_6:addChild(var_114_8)

			local function var_114_9()
				pcall(var_114_6.removeFromParentAndCleanup, var_114_6, true)

				local var_115_0 = 0

				for iter_115_0, iter_115_1 in ipairs(var_114_2.trickState) do
					if arg_114_0.type == iter_115_1.type then
						var_115_0 = iter_115_1.posy

						table.remove(var_114_2.trickState, iter_115_0)

						break
					end
				end

				for iter_115_2, iter_115_3 in pairs(var_114_2.trickState) do
					local var_115_1 = iter_115_3.icon

					if var_115_0 > iter_115_3.posy then
						iter_115_3.posy = iter_115_3.posy + 24

						var_115_1:setPositionY(iter_115_3.posy)
					end
				end
			end

			local var_114_10 = createTimerLabel(arg_114_0.lastTime, "@M:@S", "Thonburi-Bold", 20, var_114_9, nil, nil, ccc3(217, 87, 74))

			var_114_10:setPosition(ccp(70, 12))
			var_114_6:addChild(var_114_10)
			table.insert(var_114_2.trickState, {
				type = arg_114_0.type,
				icon = var_114_6,
				posy = var_114_5
			})
		end
	end
end

function worldUI.initHourRank()
	hourRankUI.updateRankLayer(var_0_2)
end

function worldUI.initWorldMap()
	local var_117_0 = smgr.getLayer("worldCamera")
	local var_117_1 = CCSprite:createWithSpriteFrameName("thumbnailXiaoditu.jpg")

	tool.scaleTo(var_117_1, 6000, 3600)
	var_117_1:setAnchorPoint(ccp(0, 0))
	var_117_1:setPosition(ccp(0, 0))
	var_117_0.worldLayer:addChild(var_117_1, -1)
end

function worldUI.loadMapWithPosition(arg_118_0, arg_118_1)
	local var_118_0 = smgr.getLayer("worldCamera")

	var_118_0.worldLayer:stopAllActions()
	performWithDelay(var_118_0.worldLayer, function()
		worldUI.mapTable = worldUI.mapTable or {}
		arg_118_0 = -arg_118_0
		arg_118_1 = -arg_118_1

		local var_119_0 = CCRectMake(arg_118_0, arg_118_1, visibleSize.width, visibleSize.height)

		for iter_119_0 = 1, 6 do
			for iter_119_1 = 1, 6 do
				local var_119_1 = 7 - iter_119_1

				if worldUI.mapTable[string.format("block%s_%s", iter_119_0, var_119_1)] == nil then
					local var_119_2 = CCRectMake((iter_119_0 - 1) * 1000, (iter_119_1 - 1) * 600, 1000, 600)

					if var_119_0:intersectsRect(var_119_2) then
						local var_119_3 = CCSprite:create("res/tiledmap/" .. var_0_5[iter_119_0][var_119_1])

						var_119_3:setPosition(ccp((iter_119_0 - 1) * 1000 + 500, (iter_119_1 - 1) * 600 + 300))
						var_118_0.addNode({
							name = "block" .. iter_119_0 .. "_" .. var_119_1,
							pos = ccp((iter_119_0 - 1) * 1000 + 500, (iter_119_1 - 1) * 600 + 300),
							size = CCSizeMake(1000, 600),
							node = var_119_3
						})

						worldUI.mapTable[string.format("block%s_%s", iter_119_0, var_119_1)] = var_119_3

						local function var_119_4(arg_120_0)
							local var_120_0 = 0

							for iter_120_0, iter_120_1 in pairs(arg_120_0) do
								var_120_0 = var_120_0 + 1
							end

							return var_120_0
						end

						log.info("载入地图 %s %s #length#%s", iter_119_0, var_119_1, var_119_4(worldUI.mapTable))
					end
				end
			end
		end
	end, 0.02)
end

function worldUI.checkLeagueInfo()
	if user.havaBetrayReward and user.havaBetrayReward == 1 then
		-- block empty
	elseif worldControl.showLeagueAni and worldControl.league.type > 0 then
		if worldControl.league.type == 1 then
			if user.player.forceId == worldControl.league.first then
				roleDialogue.control.loadSpeak(1832)
			else
				roleDialogue.control.loadSpeak(1833)
			end
		elseif worldControl.league.type == 2 then
			if user.player.forceId == worldControl.league.third then
				roleDialogue.control.loadSpeak(1830)
			else
				roleDialogue.control.loadSpeak(1831)
			end
		end
	end
end

function worldUI.checkBetrayResult()
	if user.alreadyShowBetrayResult then
		return
	end

	if user.havaBetrayReward == 1 then
		if user.originalForceId == 0 or user.originalForceId == user.player.forceId then
			return
		end

		local var_122_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

		var_122_0:registerScriptTouchHandler(function(arg_123_0, arg_123_1, arg_123_2)
			if arg_123_0 == CCTOUCHBEGAN then
				return true
			elseif arg_123_0 == CCTOUCHMOVED then
				return true
			elseif arg_123_0 == CCTOUCHENDED then
				return true
			end
		end, false, true)
		var_122_0:setTouchEnabled(true)
		smgr.rootLayer:addChild(var_122_0, 60000)

		local var_122_1 = CCSprite:create("res/ui/world/zyzh_map.jpg")

		var_122_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
		var_122_0:addChild(var_122_1)
		var_122_1:setOpacity(0)

		local var_122_2 = CCSpriteBatchNode:create("res/ui/world/path_icon.png")

		var_122_1:addChild(var_122_2)

		local var_122_3 = {
			["2_3"] = {
				19,
				21,
				22
			},
			["3_2"] = {
				207,
				205,
				161
			},
			["1_2"] = {
				123,
				121,
				125
			},
			["2_1"] = {
				19,
				20,
				18
			},
			["1_3"] = {
				123,
				163,
				165
			},
			["3_1"] = {
				207,
				202,
				201
			}
		}
		local var_122_4 = string.format("%d_%d", user.originalForceId, user.player.forceId)
		local var_122_5 = string.format("%d_%d", user.player.forceId, user.originalForceId)

		eventManager.dispatchEvent("moveToCity", var_122_3[var_122_4][2], false)

		local var_122_6 = var_122_3[var_122_4][1]
		local var_122_7 = var_122_3[var_122_4][2]
		local var_122_8 = smgr.getLayer("generalMoveLayer")
		local var_122_9 = smgr.getLayer("worldCamera")
		local var_122_10 = CCSprite:create("res/ui/world/jb_round.png")
		local var_122_11 = var_122_9.cityTable["world_building_" .. var_122_6].sprite

		var_122_10:setPosition(ccp(var_122_11:getPosition()))

		local var_122_12 = CCSprite:create("res/ui/nationTask/building/jzqj_qi_name_bg.png")

		var_122_12:setPosition(ccp(54.5, 0))
		var_122_10:addChild(var_122_12, 1, 101)

		local var_122_13 = CCSprite:create("res/ui/world/zyzh_mc.png")

		var_122_13:setPosition(ccp(54.5, 54.5))
		var_122_10:addChild(var_122_13, 1)

		local var_122_14 = CCStrokeLabelTTF:create(user.player.name, "Thonburi", 24)

		var_122_14:setPosition(ccp(54.5, 21))
		var_122_12:addChild(var_122_14)
		var_122_8:addChild(var_122_10, 101)

		local function var_122_15()
			local var_124_0 = {
				ccp(460, 350),
				ccp(125, 155),
				ccp(550, 110)
			}
			local var_124_1 = var_124_0[user.originalForceId]
			local var_124_2 = var_124_0[user.player.forceId]
			local var_124_3 = math.sqrt((var_124_2.x - var_124_1.x) * (var_124_2.x - var_124_1.x) + (var_124_2.y - var_124_1.y) * (var_124_2.y - var_124_1.y))
			local var_124_4 = math.ceil(var_124_3 / 28)
			local var_124_5 = 2 / var_124_4

			for iter_124_0 = 1, var_124_4 do
				local var_124_6 = (var_124_2.x - var_124_1.x) * (iter_124_0 - 1) / (var_124_4 - 1) + var_124_1.x
				local var_124_7 = (var_124_2.y - var_124_1.y) * (iter_124_0 - 1) / (var_124_4 - 1) + var_124_1.y
				local var_124_8 = CCSprite:create("res/ui/world/path_icon.png")

				var_124_8:setPosition(ccp(var_124_6, var_124_7))
				var_122_2:addChild(var_124_8)
				var_124_8:setOpacity(0)

				local var_124_9 = CCArray:create()

				var_124_9:addObject(CCDelayTime:create(var_124_5 * (iter_124_0 - 1)))
				var_124_9:addObject(CCFadeIn:create(0.1))

				local var_124_10 = CCSequence:create(var_124_9)

				var_124_8:runAction(var_124_10)
			end
		end

		local var_122_16
		local var_122_17
		local var_122_18
		local var_122_19
		local var_122_20

		local function var_122_21()
			traceData.moveBetweenTwoCity(var_122_10, var_122_3[var_122_4][2], var_122_3[var_122_4][3], 2000, var_122_17, false)
		end

		function var_122_17()
			eventManager.dispatchEvent("moveToCity", var_122_3[var_122_5][2], false)

			local var_126_0 = CCArray:create()

			var_126_0:addObject(CCFadeIn:create(1))
			var_126_0:addObject(CCCallFuncN:create(var_122_15))
			var_126_0:addObject(CCDelayTime:create(3))
			var_126_0:addObject(CCCallFuncN:create(function()
				var_122_2:removeFromParentAndCleanup(true)
			end))
			var_126_0:addObject(CCFadeOut:create(1))
			var_126_0:addObject(CCCallFuncN:create(var_122_18))

			local var_126_1 = CCSequence:create(var_126_0)

			var_122_1:runAction(var_126_1)
		end

		function var_122_18()
			var_122_1:setVisible(false)

			local var_128_0 = var_122_9.cityTable["world_building_" .. var_122_3[var_122_5][3]].sprite

			var_122_10:setPosition(ccp(var_128_0:getPosition()))
			traceData.moveBetweenTwoCity(var_122_10, var_122_3[var_122_5][3], var_122_3[var_122_5][2], 2000, var_122_19, false)
		end

		function var_122_19()
			traceData.moveBetweenTwoCity(var_122_10, var_122_3[var_122_5][2], var_122_3[var_122_5][1], 2000, var_122_20, false)
		end

		function var_122_20()
			var_122_10:removeFromParentAndCleanup(true)
			var_122_0:removeFromParentAndCleanup(true)
			roleDialogue.control.loadSpeak(1513)

			user.alreadyShowBetrayResult = true
		end

		traceData.moveBetweenTwoCity(var_122_10, var_122_6, var_122_7, 2000, var_122_21, false)
	end
end

function worldUI.show(arg_131_0, arg_131_1, arg_131_2, arg_131_3, arg_131_4)
	if arg_131_0 ~= nil then
		arg_131_3 = true
	end

	worldUI.shouldShowThumbnail = arg_131_1

	if arg_131_1 then
		worldUI.shouldHdieMenu = true
	else
		worldUI.shouldHdieMenu = false
	end

	worldUI.warOptionTable = arg_131_2

	showTable(arg_131_2)

	var_0_2.targetCityId = arg_131_0
	var_0_2.needArrow = arg_131_3

	local var_131_0 = createBaseLayer()

	var_131_0.onEnter = var_0_2.onEnter
	var_131_0.onExit = var_0_2.onExit

	smgr.registerLayer(var_131_0, "worldLayer")
	require("lua/layer/world/WorldCamera")

	local var_131_1 = createWorldCamera()

	smgr.registerLayer(var_131_1, "worldCamera")
	var_131_0:addChild(var_131_1.baseLayer, 100)
	worldUI.initWorldMap()
	var_0_2.enterWorldScene()
	require("lua/layer/world/hourRankReward/ui")

	local var_131_2 = hourRankUI.showRankLayer(var_0_2)

	var_131_0:addChild(var_131_2, 103)
	require("lua/layer/world/cityCombo/ui")

	local var_131_3 = cityComboUI.showCityComboLayer()

	var_131_0:addChild(var_131_3, 103)
	require("lua/layer/world/nationChallenges/ui")

	local var_131_4 = nationChallenges.ui.show()

	var_131_0:addChild(var_131_4, 104)

	local var_131_5 = worldThumbnailUI.show(var_131_1)

	var_131_0:addChild(var_131_5, 105)

	local var_131_6 = createBaseLayer()

	smgr.registerLayer(var_131_6, "cityEventLayer")
	var_131_1.worldLayer:addChild(var_131_6, 106)
	worldThumbnailUI.updateEventNum()

	if arg_131_4 then
		var_0_2.getChainableCities(arg_131_0)
	end

	smgr.showNotice()

	return var_131_0
end

function worldUI.addHeadHunter(arg_132_0, arg_132_1, arg_132_2)
	if arg_132_0 then
		if arg_132_1 == 2 and arg_132_2 then
			for iter_132_0, iter_132_1 in ipairs(arg_132_0) do
				for iter_132_2, iter_132_3 in ipairs(arg_132_2) do
					if iter_132_1.cityId == iter_132_3.cityId and iter_132_3.type ~= 2 and (iter_132_3.overByTask == nil or false) then
						if user.player.headhunterVO.supportForceId == user.player.forceId then
							roleDialogue.control.loadSpeak(2514)
						elseif user.player.headhunterVO.againstForce == user.player.forceId then
							roleDialogue.control.loadSpeak(2515)
						end
					end
				end
			end
		else
			for iter_132_4, iter_132_5 in ipairs(arg_132_0) do
				if arg_132_1 == 0 then
					worldUI.addBarleagueState(iter_132_5)
				elseif arg_132_1 == 1 then
					if iter_132_5.isMainCity then
						worldUI.setMainCityIcon(iter_132_5)
					else
						worldUI.setHeadhunterInfo(iter_132_5)
					end
				end
			end
		end
	end
end

function worldUI.clearHeadHunterTable(arg_133_0)
	if worldUI.headHunterTable then
		for iter_133_0, iter_133_1 in pairs(worldUI.headHunterTable) do
			if iter_133_1.mzType == arg_133_0 then
				pcall(iter_133_1.removeFromParentAndCleanup, iter_133_1, true)

				iter_133_1 = nil
			end
		end
	end
end

function worldUI.setMainCityIcon(arg_134_0)
	print("==============显示主城结盟==================")
end

function worldUI.setHeadhunterInfo(arg_135_0)
	print("================国战城显示结盟=================")

	if arg_135_0 == nil or arg_135_0.cityId == nil then
		return
	end

	print("================国战城显示结盟22222=================", arg_135_0.cityId, arg_135_0.type)

	worldUI.headHunterTable = worldUI.headHunterTable or {}

	if arg_135_0.type == 1 then
		if arg_135_0.cityId > 0 then
			local var_135_0 = smgr.getLayer("worldCamera")
			local var_135_1, var_135_2 = var_135_0.cityTable["world_building_" .. arg_135_0.cityId].sprite:getPosition()
			local var_135_3 = CCSprite:create("res/ui/world/newleague/mzjm_text_di_long.png")

			var_135_3:setPosition(ccp(var_135_1, var_135_2))

			local var_135_4 = CCSprite:create("res/ui/world/newleague/mzjm_di_round_2.png")

			var_135_4:setPosition(ccp(5, 25))
			var_135_3:addChild(var_135_4)

			local var_135_5 = CCSprite:create("res/ui/world/newleague/map_sma_manzu.png")

			var_135_5:setScale(1)
			var_135_5:setPosition(ccp(5, 25))
			var_135_3:addChild(var_135_5)

			local var_135_6 = CCLabelTTF:create("x" .. arg_135_0.leftTimes, "Thonburi", 20)

			var_135_6:setColor(tool.hexToRgb("#FFFFFF"))
			var_135_6:setPosition(ccp(5, 10))
			var_135_3:addChild(var_135_6)

			local var_135_7 = CCSprite:create("res/ui/world/newleague/mzjm_text_di.png")

			var_135_7:setPosition(ccp(100, 78))
			var_135_3:addChild(var_135_7)

			local var_135_8 = CCLabelTTF:create(language.get(226209, user.forceIdToName[arg_135_0.supportForceId], user.forceIdToName[arg_135_0.againstForce]), "Thonburi-Bold", 24)

			var_135_8:setColor(colorQuality[7])
			var_135_8:setPosition(ccp(120, 78))
			var_135_3:addChild(var_135_8)

			local var_135_9 = CCSprite:create("res/ui/world/manzu/zymz_pb_bg.png")

			var_135_9:setPosition(ccp(120, 50))
			var_135_3:addChild(var_135_9)

			local var_135_10 = CCProgressTimer:create(CCSprite:create("res/ui/kfyz/zymz_pb_zheng.png"))
			local var_135_11 = (arg_135_0.cdTotalTime - arg_135_0.nextTime) / arg_135_0.cdTotalTime * 100

			var_135_10:setMidpoint(ccp(0, 0))
			var_135_10:setBarChangeRate(ccp(1, 0))
			var_135_10:setType(kCCProgressTimerTypeBar)
			var_135_10:setPercentage(var_135_11)
			var_135_10:setPosition(ccp(120, 50))
			var_135_3:addChild(var_135_10)

			if arg_135_0.suspended then
				local var_135_12 = CCLabelTTF:create(language.get(226216), "Thonburi", 20)

				var_135_12:setColor(tool.hexToRgb("#FFFFFF"))
				var_135_12:setPosition(ccp(120, 20))
				var_135_3:addChild(var_135_12)
			else
				local var_135_13

				local function var_135_14(arg_136_0)
					var_135_11 = (arg_135_0.cdTotalTime - arg_136_0) / arg_135_0.cdTotalTime * 100

					var_135_10:setPercentage(var_135_11)
				end

				local function var_135_15()
					local var_137_0 = var_135_13:getTime()

					var_135_13:setTriggerTime(var_137_0 - 1000)

					if var_137_0 <= 0 then
						local var_137_1 = CCSprite:create("res/ui/common/halfPic/halfPic_manzu.png")
						local var_137_2 = CCSprite:create("res/ui/world/newleague/mzjm_word_mzcj.png")

						var_137_2:setPosition(ccp(130, 0))
						var_137_1:addChild(var_137_2)
						var_137_1:setPosition(ccp(var_135_1, var_135_2 + 120))
						var_135_0.worldLayer:addChild(var_137_1, 9999)

						local var_137_3 = CCArray:create()

						var_137_3:addObject(CCDelayTime:create(0.2))
						var_137_3:addObject(CCMoveTo:create(0.5, ccp(var_135_1, var_135_2 + 250)))
						var_137_3:addObject(CCDelayTime:create(0.5))
						var_137_3:addObject(CCCallFuncN:create(function()
							var_137_1:removeFromParentAndCleanup(true)

							var_137_1 = nil
						end))

						local var_137_4 = CCSequence:create(var_137_3)

						var_137_1:runAction(var_137_4)
					end
				end
			end

			timerLayer = createTimerLabel(arg_135_0.nextTime - 1000, "@M:@S", "Thonburi-Bold", 22, callback, nil, nil, colorQuality[7], timeUpdate)

			timerLayer:setPosition(ccp(50, 20))
			var_135_3:addChild(timerLayer)

			local var_135_16 = CCLabelTTF:create(language.get(226200), "Thonburi", 20)

			var_135_16:setColor(tool.hexToRgb("#FFFFFF"))
			var_135_16:setPosition(ccp(155, 20))
			var_135_16:setScale(0.9)
			var_135_3:addChild(var_135_16)
			var_135_0.worldLayer:addChild(var_135_3, 1000 + arg_135_0.cityId)

			var_135_3.mzType = 1
			worldUI.headHunterTable[arg_135_0.cityId] = var_135_3
			user.player.hasMzLeague = {}
			user.player.hasMzLeague[arg_135_0.cityId] = true
		end
	elseif arg_135_0.type == 2 and arg_135_0.cityId > 0 then
		local var_135_17 = smgr.getLayer("worldCamera")
		local var_135_18 = var_135_17.cityTable["world_building_" .. arg_135_0.cityId]
		local var_135_19, var_135_20 = var_135_18.sprite:getPosition()
		local var_135_21 = CCSprite:create("res/ui/world/newleague/mzjm_text_di.png")

		var_135_17.worldLayer:addChild(var_135_21, 1000 + arg_135_0.cityId)

		local var_135_22 = CCSprite:create("res/ui/world/newleague/mzjm_icon_chain.png")

		var_135_22:setPosition(ccp(120, 59))
		var_135_21:addChild(var_135_22)

		local var_135_23 = CCLabelTTF:create(user.forceIdToName[arg_135_0.supportForceId], "Thonburi-Bold", 22)

		var_135_23:setColor(colorForce[arg_135_0.supportForceId])
		var_135_23:setPosition(ccp(68, 60))
		var_135_21:addChild(var_135_23)

		local var_135_24 = CCLabelTTF:create(language.get(200308), "Thonburi-Bold", 22)

		var_135_24:setColor(colorForce[101])
		var_135_24:setPosition(ccp(172, 60))
		var_135_21:addChild(var_135_24)

		local var_135_25

		local function var_135_26(arg_139_0)
			return
		end

		local function var_135_27()
			local var_140_0 = var_135_25:getTime()

			var_135_25:setTriggerTime(var_140_0 - 1000)

			if var_140_0 == 0 then
				-- block empty
			end
		end

		var_135_25 = createTimerLabel(arg_135_0.nextTime, "@M:@S", "Thonburi-Bold", 22, var_135_27, nil, nil, colorQuality[7], var_135_26)

		var_135_25:setPosition(ccp(50, 20))
		var_135_25:setTouchEnabled(false)
		var_135_21:addChild(var_135_25)

		local var_135_28 = CCLabelTTF:create(language.get(226201, arg_135_0.npcName), "Thonburi", 20)

		var_135_28:setColor(tool.hexToRgb("#FFFFFF"))
		var_135_28:setPosition(ccp(150, 20))
		var_135_21:addChild(var_135_28)

		var_135_21.mzType = 1

		if tonumber(var_135_18.prop[2]) ~= arg_135_0.supportForceId then
			print("==============攻方===============")
			var_135_21:setPosition(ccp(var_135_19 - 100, var_135_20 - 50))

			worldUI.headHunterTable["left" .. arg_135_0.cityId] = var_135_21
		else
			print("==============守方===============")
			var_135_21:setPosition(ccp(var_135_19 + 100, var_135_20 - 50))

			worldUI.headHunterTable["right" .. arg_135_0.cityId] = var_135_21
		end
	end
end

function worldUI.addBarleagueState(arg_141_0)
	if arg_141_0 == nil or arg_141_0.cityId == nil then
		return
	end

	worldUI.headHunterTable = worldUI.headHunterTable or {}

	if arg_141_0.cityId > 0 then
		local var_141_0 = smgr.getLayer("worldCamera")
		local var_141_1, var_141_2 = var_141_0.cityTable["world_building_" .. arg_141_0.cityId].sprite:getPosition()
		local var_141_3 = CCSprite:create("res/ui/world/newleague/mzjm_di_" .. arg_141_0.status .. ".png")

		var_141_3:setPosition(ccp(var_141_1, var_141_2))

		local var_141_4 = CCSprite:create("res/ui/world/newleague/mzjm_word_" .. arg_141_0.status .. ".png")

		var_141_4:setPosition(ccp(74, 22))
		var_141_3:addChild(var_141_4)

		local var_141_5 = CCSprite:create("res/ui/world/newleague/mzjm_di_round_" .. arg_141_0.status .. ".png")

		var_141_5:setPosition(ccp(5, 25))
		var_141_3:addChild(var_141_5)

		local var_141_6 = CCSprite:create("res/ui/world/newleague/map_sma_manzu.png")

		var_141_6:setScale(1)
		var_141_6:setPosition(ccp(5, 25))
		var_141_3:addChild(var_141_6)
		var_141_0.worldLayer:addChild(var_141_3, 1000 + arg_141_0.cityId)

		var_141_3.mzType = 0
		worldUI.headHunterTable[arg_141_0.cityId] = var_141_3
	end
end
