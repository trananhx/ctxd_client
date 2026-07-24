tool.requireRes("general/jail")
require("lua/component/timerLabel")
require("lua/common/tool")

jailUI = {}

local var_0_0 = jailUI
local var_0_1 = jailControl
local var_0_2 = jailConstant
local var_0_3 = -1
local var_0_4 = false
local var_0_5 = -1
local var_0_6 = -1
local var_0_7 = -1

local function var_0_8(arg_1_0)
	if arg_1_0.generals and #arg_1_0.generals > 0 then
		local var_1_0 = {
			x = 0,
			name = "generalsPicLayer",
			height = 414,
			type = "layer_color",
			z = 200,
			y = 54,
			anchorPointY = 0,
			width = 681,
			color = ccc4(0, 255, 0, 0),
			children = {
				{
					x = 340,
					name = "generalPic1",
					y = 200,
					type = "pic",
					z = 107,
					scale = 1.1,
					pic = rmgr.getGeneralBust(arg_1_0.generals[1].generalPic)
				}
			}
		}

		if #arg_1_0.generals > 1 then
			local var_1_1 = {
				x = 140,
				name = "generalPic2",
				y = 140,
				type = "pic",
				z = 104,
				scale = 1,
				pic = rmgr.getGeneralBust(arg_1_0.generals[2].generalPic)
			}

			table.insert(var_1_0.children, var_1_1)

			if #arg_1_0.generals > 2 then
				local var_1_2 = {
					x = 540,
					name = "generalPic3",
					y = 140,
					type = "pic",
					z = 103,
					scale = 1,
					pic = rmgr.getGeneralBust(arg_1_0.generals[3].generalPic)
				}

				table.insert(var_1_0.children, var_1_2)

				if #arg_1_0.generals > 3 then
					local var_1_3 = {
						x = 220,
						name = "generalPic4",
						y = 260,
						type = "pic",
						z = 102,
						scale = 1,
						pic = rmgr.getGeneralBust(arg_1_0.generals[4].generalPic)
					}

					table.insert(var_1_0.children, var_1_3)

					if #arg_1_0.generals > 4 then
						local var_1_4 = {
							x = 460,
							name = "generalPic5",
							y = 260,
							type = "pic",
							z = 101,
							scale = 1,
							pic = rmgr.getGeneralBust(arg_1_0.generals[5].generalPic)
						}

						table.insert(var_1_0.children, var_1_4)
					end
				end
			end
		end

		return var_1_0
	end
end

local function var_0_9(arg_2_0)
	local var_2_0 = 100 * arg_2_0.num / 50
	local var_2_1 = {
		x = 0,
		name = "roomBg",
		y = 0,
		type = "pic",
		anchorPointX = 0,
		anchorPointY = 0,
		pic = "res/ui/general/jailView/new/lf_bg.jpg",
		children = {
			{
				x = 336,
				name = "jailDoor",
				y = 54,
				type = "pic",
				z = 300,
				anchorPointY = 0,
				pic = "res/ui/general/jailView/laofang_laofang_list.png"
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/common/button/gxb_btn_c.png",
						name = "btn_showWork",
						pic1 = "res/ui/common/button/gxb_btn.png",
						y = 28,
						pic3 = "res/ui/common/button/gxb_btn.png",
						x = 875
					},
					{
						pic2 = "res/ui/general/jailView/new/lf_jt.png",
						name = "btn_gotoWorld",
						pic1 = "res/ui/general/jailView/new/lf_jt.png",
						y = 100,
						pic3 = "res/ui/general/jailView/new/lf_jt.png",
						x = 850,
						callBack = function()
							smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)

							if smgr.currentSceneTag ~= SCENE_WORLD then
								loadingLayer.show(SCENE_WORLD)
							end
						end
					}
				}
			},
			{
				anchorPointX = 0,
				fontSize = 30,
				type = "label",
				y = 100,
				x = 705,
				text = language.get(220639),
				color = ccc3(0, 180, 0)
			},
			{
				x = 95,
				y = 28,
				pic = "res/ui/general/jailView/new/lf_word_bhqf.png",
				type = "pic"
			},
			{
				x = 485,
				y = 28,
				pic = "res/ui/general/jailView/new/lf_pb_bg.png",
				type = "pic"
			},
			{
				name = "salveNumBar",
				x = 485,
				type = "process",
				y = 28,
				pic = "res/ui/general/jailView/new/lf_pb.png",
				percentage = var_2_0
			},
			{
				width = 29,
				height = 37,
				name = "salveNum",
				type = "atlas",
				pic = "res/ui/common/number/lf_word_digit.png",
				y = 28,
				startChar = 48,
				x = 485,
				text = arg_2_0.num
			},
			var_0_8(arg_2_0)
		}
	}

	for iter_2_0 = 1, 4 do
		table.insert(var_2_1.children, {
			y = 27,
			scale = 1.05,
			type = "pic",
			pic = "res/ui/technology/jdt/lm_jdt_fg.png",
			x = 189 + 118.4 * iter_2_0
		})
	end

	return var_2_1
end

function var_0_0.resetFlag()
	log.info("牢房，resetFlag")

	var_0_3 = -1
	var_0_4 = false
	var_0_5 = -1
	var_0_6 = -1
	var_0_7 = -1
end

function var_0_0.show()
	local var_5_0 = createBaseLayer()

	rmgr.loadTable(var_0_2.RES)
	smgr.registerLayer(var_5_0, "jailLayer")
	var_5_0:setTouchEnabled(true)
	var_5_0:registerScriptTouchHandler(var_0_1.onTouch, false, true)

	for iter_5_0 = 1, 3 do
		jailConstant.forceIdToName[iter_5_0] = language.get(460037, user.forceIdToName[iter_5_0])
	end

	var_0_1.slaveGetSlaveInfo()

	var_5_0.onEnter = var_0_1.onEnter
	var_5_0.onExit = var_0_1.onExit

	return var_5_0
end

local function var_0_10(arg_6_0)
	local var_6_0 = arg_6_0 / 1000
	local var_6_1 = math.floor(var_6_0 / 3600)
	local var_6_2 = var_6_0 % 3600
	local var_6_3 = math.floor(var_6_2 / 60)
	local var_6_4 = var_6_2 % 60
	local var_6_5 = ""

	if var_6_1 == 0 then
		var_6_5 = string.format("%02d:%02d", var_6_3, var_6_4)
	else
		var_6_5 = string.format("%02d:%02d:%02d", var_6_1, var_6_3, var_6_4)
	end

	return var_6_5
end

function var_0_0.updateJailUi(arg_7_0)
	if var_0_0.uiTable then
		var_0_0.uiTable = nil
	end

	if var_0_0.jailViewBackground then
		pcall(var_0_0.jailViewBackground.removeFromParentAndCleanup, var_0_0.jailViewBackground, true)

		var_0_0.jailViewBackground = nil
	end

	local var_7_0 = smgr.getLayer("jailLayer")

	var_7_0:setTouchEnabled(false)

	local var_7_1 = getJailUiData(arg_7_0)

	var_0_0.uiTable = autoUI.initUI(var_7_0, var_7_1)
	var_0_0.jailViewBackground = var_0_0.uiTable.jailViewBackground

	if arg_7_0.type == 2 then
		if arg_7_0.buildLv and user.player.playerLv < arg_7_0.buildLv then
			var_0_0.uiTable.btn_building:setEnabled(true)
		elseif arg_7_0.havePic ~= 1 then
			if var_0_3 == -1 then
				var_0_3 = arg_7_0.finished
			elseif arg_7_0.finished == 1 and var_0_3 ~= 1 then
				var_0_4 = true
				var_0_3 = arg_7_0.finished
			end

			if arg_7_0.finished == 1 then
				if not var_0_4 then
					var_0_0.showBuildingLight()
				end

				var_0_0.uiTable.btn_building:setEnabled(true)
			else
				var_0_0.uiTable.btn_building:setEnabled(false)
			end
		else
			var_0_0.uiTable.btn_building:setEnabled(false)
		end
	else
		if var_0_0.uiTable.lash_bg and var_0_0.uiTable.lash_bg:isVisible() then
			var_0_0.uiTable.btn_lash:setScaleX(175)
			var_0_0.uiTable.btn_lash:setScaleY(87.5)

			local var_7_2 = CCMoveBy:create(0.6, ccp(30, 0))
			local var_7_3 = CCEaseOut:create(var_7_2, 1)
			local var_7_4 = CCMoveBy:create(0.6, ccp(-30, 0))
			local var_7_5 = CCEaseIn:create(var_7_4, 1)
			local var_7_6 = CCArray:create()

			var_7_6:addObject(var_7_3)
			var_7_6:addObject(var_7_5)

			local var_7_7 = CCSequence:create(var_7_6)
			local var_7_8 = CCRepeatForever:create(var_7_7)

			var_0_0.uiTable.node_arrow:runAction(var_7_8)
		end

		for iter_7_0 = 1, 5 do
			local var_7_9 = var_0_0.uiTable["btnL" .. iter_7_0]
			local var_7_10 = var_0_0.uiTable["btnR" .. iter_7_0]

			if var_7_9 then
				var_7_9:setScale(0.8)
				var_7_10:setScale(0.8)
			end
		end

		local var_7_11 = CCLayerColor:create(ccc4(0, 255, 0, 0), 915, 454)
		local var_7_12 = CCScrollView:create(CCSizeMake(915, 454), var_7_11)

		var_7_12:setPosition(ccp(6, 5))
		var_7_12:setTouchEnabled(false)
		var_0_0.uiTable.jailViewBackground:addChild(var_7_12, 200)

		var_0_0.scrollLayer = var_7_11

		autoUI.createUI(var_7_11, var_0_9(arg_7_0), var_0_0.uiTable)
		var_0_0.uiTable.jailDoor:setScaleY(0.9)
		var_0_0.uiTable.btn_showWork:registerScriptTapHandler(function()
			var_0_0.uiTable.btn_showWork:setEnabled(false)

			local var_8_0 = var_0_0.uiTable.btn_showWork:getScale()

			if var_8_0 > 0 then
				for iter_8_0 = 1, 10 do
					local var_8_1 = var_0_0.uiTable["work" .. iter_8_0]

					if var_8_1 then
						var_8_1:setVisible(var_8_0 > 0)
					end
				end
			end

			local var_8_2 = CCArray:create()

			var_8_2:addObject(CCMoveTo:create(0.5, ccp(0, var_8_0 > 0 and 400 or 0)))
			var_8_2:addObject(CCCallFuncN:create(function()
				var_0_0.uiTable.btn_showWork:setScale(-1 * var_8_0)
				var_0_0.uiTable.btn_showWork:setEnabled(true)
				var_0_0.uiTable.btn_gotoWorld:setEnabled(var_8_0 < 0)
				var_7_0:setTouchEnabled(var_8_0 > 0)

				if var_8_0 < 0 then
					for iter_9_0 = 1, 10 do
						local var_9_0 = var_0_0.uiTable["work" .. iter_9_0]

						if var_9_0 then
							var_9_0:setVisible(var_8_0 > 0)
						end
					end
				end
			end))

			local var_8_3 = CCSequence:create(var_8_2)

			var_0_0.scrollLayer:runAction(var_8_3)
		end)
		var_0_0.uiTable.btn_showWork:setScale(-1)
		var_0_0.scrollLayer:setPositionY(400)
		var_0_0.uiTable.btn_gotoWorld:setEnabled(false)

		if var_0_1.jailData.generals and #var_0_1.jailData.generals > 0 then
			local var_7_13 = arg_7_0.generals[1]

			if var_7_13 then
				local var_7_14 = CCStrokeLabelTTF:create(jailConstant.forceIdToName[var_7_13.forceId] or " ", "Thonburi", 22, 2)

				var_7_14:setColor(colorForce[var_7_13.forceId])

				local var_7_15 = CCStrokeLabelTTF:create(string.format(" %s ", var_7_13.nameShort or ""), "Thonburi", 22, 2)
				local var_7_16 = CCStrokeLabelTTF:create(string.format(" %s ", var_7_13.playerName or ""), "Thonburi", 24, 2)

				var_7_16:setColor(colorText[10003])

				local var_7_17 = string.format(" %s", var_7_13.generalName .. (var_7_13.type == 0 and language.get(85020) or ""))
				local var_7_18 = CCStrokeLabelTTF:create(var_7_17, "Thonburi", 22, 2)

				var_7_18:setColor(colorQuality[var_7_13.quality])

				local var_7_19 = CCStrokeLabelTTF:create(string.format(" Lv.%s", var_7_13.generalLv), "Thonburi", 22, 2)
				local var_7_20 = createRichNode({
					var_7_14,
					var_7_15,
					var_7_16,
					var_7_18,
					var_7_19
				}, 0.5)

				var_0_0.uiTable.roomBg:addChild(var_7_20, 500)
				log.info("desRichNode width: ", var_7_20:getContentSize().width)
				var_7_20:setPosition(336, 430)
			end
		end

		if var_0_1.jailData.grabRecords and #var_0_1.jailData.grabRecords > 0 then
			local var_7_21 = #var_0_1.jailData.grabRecords

			var_7_21 = var_7_21 > 3 and 3 or var_7_21

			local var_7_22 = ""

			for iter_7_1 = 1, var_7_21 do
				local var_7_23 = var_0_1.jailData.grabRecords[iter_7_1]
				local var_7_24 = os.date("*t", var_7_23.grabTime / 1000)

				log.info("zhu@@@time")
				showTable(var_7_24)

				local var_7_25 = string.format("%02d:%02d", var_7_24.hour, var_7_24.min)

				var_7_22 = var_7_22 .. language.get(220640, var_7_25, jailConstant.forceIdToName[var_7_23.forceId], var_7_23.officer, var_7_23.playerName, var_7_23.generalName) .. "\n\n"
			end

			local var_7_26 = CCStrokeLabelTTF:create(var_7_22, "Thonburi", 22, 1, ccc3(22, 18, 13))

			var_7_26:setColor(ccc3(166, 146, 101))
			var_7_26:setHorizontalAlignment(kCCTextAlignmentLeft)
			var_7_26:setAnchorPoint(ccp(0.5, 1))
			var_7_26:setDimensions(CCSizeMake(230, 0))
			var_0_0.uiTable.roomBg:addChild(var_7_26)
			var_7_26:setPosition(ccp(800, 440))
		end

		if arg_7_0.trailCD and arg_7_0.trailCD > 0 and arg_7_0.tryLashLv > 0 then
			var_0_1.tryLash = {}

			for iter_7_2 = arg_7_0.lashLv + 1, arg_7_0.tryLashLv do
				if var_0_0.uiTable["timer" .. iter_7_2] then
					var_0_1.tryLash[iter_7_2] = true

					var_0_0.uiTable["timer" .. iter_7_2]:setString(var_0_10(arg_7_0.trailCD))
				end
			end

			local var_7_27 = CCArray:create()

			var_7_27:addObject(CCDelayTime:create(1))
			var_7_27:addObject(CCCallFuncN:create(function()
				arg_7_0.trailCD = arg_7_0.trailCD - 1000

				if arg_7_0.trailCD > 0 then
					local var_10_0 = var_0_10(arg_7_0.trailCD)

					for iter_10_0, iter_10_1 in pairs(var_0_1.tryLash) do
						for iter_10_2 = arg_7_0.lashLv, arg_7_0.tryLashLv do
							if var_0_0.uiTable["timer" .. iter_10_0] then
								var_0_0.uiTable["timer" .. iter_10_0]:setString(var_10_0)
							end
						end
					end
				else
					var_0_1.slaveGetSlaveInfo()
				end
			end))

			local var_7_28 = CCSequence:create(var_7_27)

			var_0_0.uiTable.haveBuiltPanel:runAction(CCRepeatForever:create(var_7_28))
		end
	end

	var_7_0:setTouchEnabled(true)
end

function var_0_0.handleLashUpgradeButtonTap(arg_11_0, arg_11_1)
	messageBox.confirm(language.get(220634, arg_11_1), function()
		var_0_1.slaveUpdateLashLv(arg_11_0)
	end)
end

function var_0_0.handlerTrailButtonTap(arg_13_0, arg_13_1, arg_13_2)
	if arg_13_1 then
		var_0_1.slaveFreeInTaril()
	elseif arg_13_2 > 0 then
		messageBox.confirm(language.get(220633, arg_13_2), function()
			var_0_1.slaveUseInTrail(arg_13_0)
		end)
	else
		var_0_1.slaveUseInTrail(arg_13_0)
	end
end

function var_0_0.handleBuildJailButtonTap()
	var_0_1.slaveMakeCell()
end

function var_0_0.handleBuildBtnTap_LJ()
	log.info("btn立即建成")
	messageBox.confirm(language.get(85062), function()
		require("lua/layer/resource/ui")
		resourceUI.show(4)
	end)
end

function var_0_0.handleBuildBtnTap_PT()
	log.info("btn普通建造")
	var_0_1.slaveInvestCopper(1)
end

function var_0_0.handleBuildBtnTap_KS()
	log.info("btn快速建造")
	var_0_1.slaveInvestCopper(2)
end

function var_0_0.handleBuildBtnTap_TZ()
	log.info("btn图纸建造")
	var_0_0.uiTable.btn_build_TZ:setVisible(false)
	var_0_0.showUpgradeEffect("res/ui/general/jailView/jail_built.png", var_0_0.showBuildingLight)
end

function var_0_0.showBuildingLight()
	var_0_0.uiTable.btn_building:setEnabled(true)
	var_0_0.uiTable.pic_djjr:setVisible(true)
	var_0_0.uiTable.light:setVisible(true)
	var_0_0.uiTable.amountProgressBar:setPercentage(100)
	var_0_0.uiTable.amountValueLabel:setString("100%")

	local var_21_0 = CCArray:create()

	var_21_0:addObject(CCFadeOut:create(0.6))
	var_21_0:addObject(CCFadeIn:create(0.4))

	local var_21_1 = CCSequence:create(var_21_0)

	var_0_0.uiTable.light:runAction(CCRepeatForever:create(var_21_1))
end

function var_0_0.handlePurchasePicButtonTap()
	require("lua/layer/resource/ui")
	resourceUI.show(4)
end

function var_0_0.handleJailUpgradeButtonTap()
	var_0_1.slaveUpdateLimbo()
end

function var_0_0.handleLashButtonTap()
	log.info("btn鞭笞")
	var_0_0.uiTable.btn_lash:setVisible(false)

	local var_24_0 = var_0_1.jailData.slaves[1].slaveId

	var_0_1.slaveLashPlayer(var_24_0)
end

function var_0_0.showInvestCopperEffect(arg_25_0)
	local var_25_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_25_0:registerScriptTouchHandler(function(arg_26_0, arg_26_1, arg_26_2)
		if arg_26_0 == CCTOUCHBEGAN then
			return true
		elseif arg_26_0 == CCTOUCHMOVED then
			return true
		elseif arg_26_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)
	var_25_0:setTouchEnabled(arg_25_0 > 1)
	smgr.rootLayer:addChild(var_25_0, 60000)

	for iter_25_0 = 1, arg_25_0 do
		local var_25_1 = CCSprite:create("res/ui/general/jailView/laofang_tit_jzjd.png")

		var_25_0:addChild(var_25_1)
		var_25_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 60))
		var_25_1:setOpacity(0)

		local var_25_2 = CCArray:create()

		var_25_2:addObject(CCDelayTime:create((iter_25_0 - 1) * 0.3))
		var_25_2:addObject(CCFadeIn:create(0.1))
		var_25_2:addObject(CCMoveBy:create(0.6, ccp(0, 120)))
		var_25_2:addObject(CCFadeOut:create(0.5))
		var_25_2:addObject(CCCallFunc:create(function()
			if iter_25_0 == arg_25_0 then
				var_25_0:removeFromParentAndCleanup(true)

				if var_0_4 then
					var_0_0.showUpgradeEffect("res/ui/general/jailView/jail_built.png", var_0_0.showBuildingLight)

					var_0_4 = false
				end
			end
		end))
		var_25_1:runAction(CCSequence:create(var_25_2))
	end
end

function var_0_0.showProgressBarEffect(arg_28_0)
	var_0_0.uiTable.jailProgressBarBackground:setVisible(true)

	local var_28_0 = CCArray:create()

	var_28_0:addObject(CCProgressTo:create(2, 100))
	var_28_0:addObject(CCCallFuncN:create(function()
		var_0_0.uiTable.jailProgressBarBackground:setVisible(false)
	end))
	var_28_0:addObject(CCCallFuncN:create(arg_28_0))
	var_0_0.uiTable.jailBuildProgressBar:runAction(CCSequence:create(var_28_0))
end

function var_0_0.showUpgradeEffect(arg_30_0, arg_30_1)
	if var_0_0.upgradeAnimNode then
		pcall(var_0_0.upgradeAnimNode.removeFromParentAndCleanup, var_0_0.upgradeAnimNode, true)

		var_0_0.upgradeAnimNode = nil
	end

	local var_30_0 = rmgr.getAnimation("warlockUpgrade")
	local var_30_1 = CCAnimation:createWithSpriteFrames(var_30_0, 0.08)
	local var_30_2 = CCAnimate:create(var_30_1)
	local var_30_3 = CCRepeat:create(var_30_2, 1)
	local var_30_4 = CCSprite:create()

	var_0_0.upgradeAnimNode = var_30_4

	local var_30_5 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_30_5:registerScriptTouchHandler(function(arg_31_0, arg_31_1, arg_31_2)
		if arg_31_0 == CCTOUCHBEGAN then
			return true
		elseif arg_31_0 == CCTOUCHMOVED then
			return true
		elseif arg_31_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)
	log.debug("add mask")
	var_30_5:setTouchEnabled(true)
	var_30_5:addChild(var_30_4, 500)
	log.info("upgradeAnimNode added to background")
	var_30_4:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))

	local var_30_6 = CCArray:create()

	var_30_6:addObject(var_30_3)

	local function var_30_7()
		if arg_30_1 then
			arg_30_1()
		end

		pcall(var_30_4.removeFromParentAndCleanup, var_30_4, true)

		var_30_4 = nil

		var_30_5:removeFromParentAndCleanup(true)
	end

	smgr.rootLayer:addChild(var_30_5, 60000)
	var_30_6:addObject(CCCallFuncN:create(var_30_7))
	var_30_4:runAction(CCSequence:create(var_30_6))

	arg_30_0 = arg_30_0 or "res/ui/general/jailView/jail_upgr.png"

	local var_30_8 = CCSprite:create(arg_30_0)

	var_30_8:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 60))
	smgr.showTipSpriteText(var_30_8)
end

function var_0_0.showBuildEffect(arg_33_0)
	if var_0_0.buildAnimNode then
		pcall(var_0_0.buildAnimNode.removeFromParentAndCleanup, var_0_0.buildAnimNode, true)

		var_0_0.buildAnimNode = nil
	end

	local var_33_0 = rmgr.getAnimation("hammer")
	local var_33_1 = CCAnimation:createWithSpriteFrames(var_33_0, 0.1)
	local var_33_2 = CCAnimate:create(var_33_1)
	local var_33_3 = CCRepeat:create(var_33_2, 10)
	local var_33_4 = CCSprite:create()

	var_0_0.buildAnimNode = var_33_4

	var_0_0.uiTable.jailViewBackground:addChild(var_33_4, 500)
	log.info("buildAnimNode added to background")
	var_33_4:setPosition(ccp(637, 296))

	local var_33_5 = CCArray:create()

	var_33_5:addObject(var_33_3)

	local function var_33_6()
		var_0_0.showUpgradeEffect("res/ui/general/jailView/jail_built.png", arg_33_0)
		arg_33_0()
		pcall(var_33_4.removeFromParentAndCleanup, var_33_4, true)

		var_33_4 = nil
	end

	var_33_4:runAction(CCSequence:create(var_33_5))
	var_0_0.showProgressBarEffect(var_33_6)
end

function var_0_0.getLashEffectSpriteFrames()
	if var_0_0.lashAnim then
		return var_0_0.lashAnim
	else
		local var_35_0 = 15
		local var_35_1 = CCArray:create()

		for iter_35_0 = 1, var_35_0 do
			local var_35_2 = "flogEffect_" .. iter_35_0 .. ".png"
			local var_35_3 = tool.spriteByName(var_35_2)

			var_35_3:setScale(0.7)

			local var_35_4 = var_35_3:displayFrame()

			var_35_1:addObject(var_35_4)
		end

		var_35_1:retain()

		var_0_0.lashAnim = var_35_1

		return var_35_1
	end
end

function var_0_0.showLashEffect(arg_36_0)
	if var_0_0.lashAnimNode then
		pcall(var_0_0.lashAnimNode.removeFromParentAndCleanup, var_0_0.lashAnimNode, true)

		var_0_0.lashAnimNode = nil
	end

	local var_36_0 = var_0_0.getLashEffectSpriteFrames()
	local var_36_1 = CCAnimation:createWithSpriteFrames(var_36_0, 0.1)
	local var_36_2 = CCAnimate:create(var_36_1)
	local var_36_3 = CCRepeat:create(var_36_2, 1)
	local var_36_4 = CCSprite:create()

	var_0_0.lashAnimNode = var_36_4

	smgr.getLayer("jailLayer"):addChild(var_36_4, 250)
	log.info("lashAnimNode added to background")
	var_36_4:setPosition(ccp(479.5, 222))
	var_36_4:setScaleY(0.75)

	local var_36_5 = CCArray:create()

	var_36_5:addObject(var_36_3)

	local function var_36_6()
		if arg_36_0 then
			arg_36_0()
		end

		pcall(var_36_4.removeFromParentAndCleanup, var_36_4, true)

		var_36_4 = nil
	end

	var_36_5:addObject(CCCallFuncN:create(var_36_6))
	var_36_4:runAction(CCSequence:create(var_36_5))
end

function var_0_0.showWorkEffect(arg_38_0, arg_38_1)
	smgr.getLayer("jailLayer"):setTouchEnabled(false)

	local var_38_0 = arg_38_0 and 5 or 3
	local var_38_1 = CCSprite:create("res/ui/general/jailView/new/lf_tz_bg.png")

	var_38_1:setPosition(ccp(463.5, 200))
	var_0_0.uiTable.jailViewBackground:addChild(var_38_1, 200)

	local var_38_2 = CCSpriteBatchNode:create("res/ui/general/jailView/new/lf_tz.png", 100)

	var_38_1:addChild(var_38_2)

	local var_38_3 = CCSpriteBatchNode:create("res/ui/activity/moveMountain/work/right.png", 100)

	var_38_1:addChild(var_38_3)

	local var_38_4 = CCSpriteBatchNode:create("res/ui/activity/wish/wishLight.png", 100)

	var_38_1:addChild(var_38_4)

	for iter_38_0 = 1, var_38_0 do
		local var_38_5 = 485 - (var_38_0 - 1) * 185 / 2 + (iter_38_0 - 1) * 185
		local var_38_6 = CCSprite:create("res/ui/general/jailView/new/lf_tz.png")

		var_38_6:setPosition(ccp(var_38_5, 140))
		var_38_2:addChild(var_38_6)

		local var_38_7 = tool.spriteByName("qqq_r_1.png")

		var_38_7:setPosition(ccp(var_38_5 + 15, 125))
		var_38_3:addChild(var_38_7)

		local var_38_8 = tool.spriteByName("guang00013.png")

		var_38_8:setPosition(ccp(var_38_5 - 15, 140))
		var_38_4:addChild(var_38_8)

		local var_38_9 = CCArray:create()

		for iter_38_1 = 1, 10 do
			local var_38_10 = CCSprite:createWithSpriteFrameName(string.format("qqq_r_%d.png", iter_38_1))

			var_38_9:addObject(var_38_10:displayFrame())
		end

		local var_38_11 = CCAnimation:createWithSpriteFrames(var_38_9, 0.045)
		local var_38_12 = CCAnimate:create(var_38_11)

		var_38_7:runAction(CCRepeat:create(var_38_12, 3))

		local var_38_13 = CCArray:create()

		for iter_38_2 = 1, 13 do
			local var_38_14 = CCSprite:createWithSpriteFrameName(string.format("guang%05d.png", iter_38_2))

			var_38_13:addObject(var_38_14:displayFrame())
		end

		local var_38_15 = CCAnimation:createWithSpriteFrames(var_38_13, 0.05)
		local var_38_16 = CCAnimate:create(var_38_15)
		local var_38_17 = CCArray:create()

		var_38_17:addObject(CCDelayTime:create(0.6))

		if iter_38_0 == var_38_0 then
			var_38_17:addObject(CCCallFuncN:create(function()
				local var_39_0 = {
					{}
				}

				var_39_0[1].id = 6
				var_39_0[1].value = arg_38_1

				globalAction_gotResource(var_39_0)
			end))
		end

		var_38_17:addObject(var_38_16)

		if iter_38_0 == var_38_0 then
			var_38_17:addObject(CCCallFuncN:create(function()
				var_38_1:removeFromParentAndCleanup(true)
				var_0_1.slaveGetSlaveInfo()
			end))
		end

		local var_38_18 = CCSequence:create(var_38_17)

		var_38_8:runAction(var_38_18)
	end
end
