local var_0_0 = {}

var_0_0.idle = 0
var_0_0.conscription = 1
var_0_0.instanceWar = 2
var_0_0.countryWar = 3
var_0_0.officialWar = 4
var_0_0.find = 5
var_0_0.move = 6
var_0_0.mineWar = 7
var_0_0.rankingWar = 8
var_0_0.cityWar = 10
var_0_0.pvpOne = 13
var_0_0.savageWar = 14
var_0_0.pvpSavage = 15
var_0_0.armyGroup = 16
var_0_0.biwu = 17
var_0_0.eventWar = 18
var_0_0.storyWar = 19
var_0_0.pvpOneInStory = 20
var_0_0.eventInStory = 21
var_0_0.prison = 22
var_0_0.escape = 23
var_0_0.sleep = 24
var_0_0.farm = 25
var_0_0.training1 = 26
var_0_0.training2 = 27
var_0_0.training3 = 28
var_0_0.training4 = 29
var_0_0.training5 = 30
var_0_0.monster = 32
var_0_0.weicheng = 50
var_0_0.kfgzWar = 1003
var_0_0.kfgzSolo = 1013
var_0_0.kfyzDongying = 1014
var_0_0.kfgzArmyGroup = 1015
recordGeneralState = nil
TAG_GENERAL_ICON = 101
TAG_BUFF_ANIM = 102
TAG_GENERAL_SCROLLVIEW = 103
TAG_GONGJIANG_ICON = 104
TAG_JUNTUAN_ICON = 105
TAG_GENERAL_FUJIANG = -1
TAG_GENERAL_ZHUJIANG = -1
MAX_GENERALNUM = 4
AUTO_BATTLE_CD = 10021

local var_0_1 = {}
local var_0_2 = {}
local var_0_3 = {}
local var_0_4 = {}

if conf.language == "vie" then
	var_0_4.farmingFontSize = -6
else
	var_0_4.farmingFontSize = 0
end

local function var_0_5()
	require("lua/layer/general/ui")
	showGeneralPanel(3)
end

local function var_0_6(arg_2_0, arg_2_1)
	local var_2_0 = CCScale9Sprite:createWithSpriteFrameName("general_background.png")
	local var_2_1 = CCScale9Sprite:createWithSpriteFrameName("general_background_light.png")
	local var_2_2 = CCLabelTTF:create("", "Thonburi-Bold", 22)
	local var_2_3 = CCControlButton:create(var_2_2, var_2_0)

	var_2_3:setBackgroundSpriteForState(var_2_1, CCControlStateHighlighted)
	var_2_3:setPreferredSize(CCSizeMake(82, 82))
	var_2_3:setPosition(arg_2_1)
	var_2_3:addHandleOfControlEvent(var_0_5, CCControlEventTouchUpInside)
	arg_2_0:addChild(var_2_3, 0, TAG_GENERAL_ICON)
end

local function var_0_7(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	if arg_3_1.state == nil or arg_3_1.pic == nil then
		return
	end

	local var_3_0 = {}

	var_3_0.checked = false
	var_3_0.clickFunc = nil
	var_3_0.state = arg_3_1.state
	var_3_0.generalSprite = CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", arg_3_1.pic))

	if arg_3_1.isChief and arg_3_1.isChief == true then
		local var_3_1 = CCSprite:create("res/ui/general/deputy/fj_icon_zj.png")

		var_3_1:setPosition(ccp(20, var_3_0.generalSprite:getContentSize().height - 20))
		var_3_0.generalSprite:addChild(var_3_1)
	end

	var_3_0.stateSprite = nil
	var_3_0.actionSprite = nil
	var_3_0.tipText = nil
	var_3_0.addHpTip = nil

	if arg_3_1.forces == nil then
		if arg_3_1.ChiefForces then
			arg_3_1.forces = arg_3_1.ChiefForces
		else
			arg_3_1.forces = 0
		end
	end

	if arg_3_1.forcesMax == nil then
		if arg_3_1.ChiefForcesMax then
			arg_3_1.forcesMax = arg_3_1.ChiefForcesMax
		else
			arg_3_1.forcesMax = 1
		end
	end

	if arg_3_1.needTime == nil then
		if arg_3_1.ChiefNeedTime then
			arg_3_1.needTime = arg_3_1.ChiefNeedTime
		else
			arg_3_1.needTime = 0
		end
	end

	if arg_3_1.forces ~= arg_3_1.forcesMax then
		var_3_0.hpSprite = CCSprite:createWithSpriteFrameName("gene_shortc_degr_fight.png")
	else
		var_3_0.hpSprite = CCSprite:createWithSpriteFrameName("gene_shortc_degr_normal.png")
	end

	local function var_3_2()
		eventManager.dispatchEvent("farmOver")
	end

	if arg_3_1.state == var_0_0.idle then
		var_3_0.tipText = CCStrokeLabelTTF:create(string.format("Lv.%s", arg_3_1.lv), "Arial-BoldMT", 20)

		if arg_3_3 then
			var_3_0.stateSprite = CCSprite:createWithSpriteFrameName("general_action_call.png")
		end
	elseif arg_3_1.state == var_0_0.conscription then
		var_3_0.hpSprite = CCSprite:createWithSpriteFrameName("gene_shortc_degr_conscr.png")

		local var_3_3 = CCSprite:createWithSpriteFrameName("gene_shortc_icon_conscr.png")
		local var_3_4 = CCSprite:createWithSpriteFrameName("gene_shortc_icon_conscr_sign.png")
		local var_3_5 = math.ceil(arg_3_1.needTime / 300000)
		local var_3_6 = CCLabelAtlas:create(tostring(var_3_5), "res/ui/common/number/gene_shortc_icon_conscr_numb.png", 15, 19, 48)

		var_3_6:setAnchorPoint(ccp(0.5, 0.5))

		var_3_0.addHpTip = createRichNode({
			var_3_3,
			var_3_4,
			var_3_6
		}, 0, "bottom")
	elseif arg_3_1.state == var_0_0.move then
		var_3_0.actionSprite = CCSprite:createWithSpriteFrameName("gene_shortc_icon_suspend.png")
		var_3_0.stateSprite = CCSprite:createWithSpriteFrameName("gene_shortc_icon_move.png")
	elseif arg_3_1.state == var_0_0.prison then
		var_3_0.generalSprite = GraySprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", arg_3_1.pic))
		var_3_0.stateSprite = CCSprite:createWithSpriteFrameName("general_state_lao.png")
		var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190064), "Thonburi", 22)
	elseif arg_3_1.state == var_0_0.escape then
		var_3_0.stateSprite = CCSprite:createWithSpriteFrameName("general_state_lao.png")
		var_3_0.generalSprite = GraySprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", arg_3_1.pic))

		if arg_3_1.escapeTime then
			local function var_3_7()
				eventManager.dispatchEvent("escapeOver")

				var_0_1[arg_3_1.id] = nil
			end

			if var_0_1[arg_3_1.id] then
				var_3_0.tipText = createTimerLabel(var_0_1[arg_3_1.id], "@M:@S", "Thonburi", 22, var_3_7, nil, nil, ccc3(218, 35, 11))
			end
		end
	elseif arg_3_1.state == var_0_0.armyGroup or arg_3_1.state == var_0_0.kfgzArmyGroup then
		if conf.language == "vie" then
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190065), "Thonburi", 18)

			var_3_0.tipText:setDimensions(CCSizeMake(72, 60))
			var_3_0.tipText:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		else
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190065), "Thonburi", 22)
		end

		var_3_0.stateSprite = CCSprite:create("res/ui/world/gene_shortc_icon_close.png")
	elseif arg_3_1.state == var_0_0.sleep then
		if user.player.food < user.player.foodMax then
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190111), "Thonburi", 22)
		else
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get("190112_1"), "Thonburi", 20)

			var_3_0.tipText:setColor(ccc3(200, 0, 0))
		end
	elseif arg_3_1.state == var_0_0.farm then
		if arg_3_1.farmIsEnd == 0 then
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190112), "Thonburi", 22)

			var_3_0.tipText:setColor(ccc3(200, 0, 0))

			var_3_0.farmTimer = TimerLabelClass.new({
				fontSize = 22,
				font = "Thonburi",
				labelType = "LabelStroke",
				triggerTime = 1e+20,
				isAdd = true,
				format = "@M:@S",
				time = arg_3_1.farmCd
			})

			var_3_0.farmTimer:setColor(colorQuality[5])

			if conf.language == "vie" then
				var_3_0.tipText:setDimensions(CCSizeMake(100, 0))
			end
		else
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190115), "Thonburi", 22 + var_0_4.farmingFontSize)

			var_3_0.tipText:setColor(colorQuality[3])

			if conf.language == "vie" then
				var_3_0.tipText:setDimensions(CCSizeMake(100, 0))
			end
		end
	elseif arg_3_1.state == var_0_0.training1 or arg_3_1.state == var_0_0.training2 or arg_3_1.state == var_0_0.training3 or arg_3_1.state == var_0_0.training4 or arg_3_1.state == var_0_0.training5 then
		if arg_3_1.farmIsEnd == 0 then
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190110), "Thonburi", 22)

			var_3_0.tipText:setColor(ccc3(200, 0, 0))

			var_3_0.farmTimer = createTimerLabel(arg_3_1.farmCd, "@M:@S", "Thonburi", 22, var_3_2, nil, nil, colorQuality[5])
			var_0_3[tostring(arg_3_1.id)] = var_3_0.farmTimer
		else
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190114), "Thonburi", 22)

			var_3_0.tipText:setColor(colorQuality[3])
		end

		if conf.language == "vie" then
			var_3_0.tipText:setDimensions(CCSizeMake(100, 0))
		end
	elseif arg_3_1.state == var_0_0.weicheng then
		log.info("禁闭状态")
		showTable(arg_3_1)

		var_3_0.stateSprite = CCSprite:create("res/ui/nationTask/weicheng/jing.png")
		var_3_0.generalSprite = GraySprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", arg_3_1.pic))

		if arg_3_1.bsPunishTime then
			local function var_3_8()
				eventManager.dispatchEvent("escapeOver")

				var_0_2[arg_3_1.id] = nil
			end

			if var_0_2[arg_3_1.id] then
				var_3_0.tipText = createTimerLabel(var_0_2[arg_3_1.id], "@M:@S", "Thonburi", 22, var_3_8, nil, nil, ccc3(0, 255, 0))
			end
		end
	else
		var_3_0.stateSprite = CCSprite:createWithSpriteFrameName("gene_shortc_icon_fight.png")

		if arg_3_1.state == var_0_0.instanceWar then
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190066), "Thonburi", 22)
		elseif arg_3_1.state == var_0_0.countryWar or arg_3_1.state == var_0_0.kfgzWar then
			if arg_3_1.state == var_0_0.countryWar and arg_3_1.slopeCd > 0 then
				var_3_0.tipText = CCStrokeLabelTTF:create(language.get(113033), "Thonburi", 22)
			else
				var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190067), "Thonburi", 22)

				log.info("in world : ", arg_3_4, arg_3_3, arg_3_1.battleId)

				if arg_3_3 == arg_3_1.battleId and not arg_3_4 and arg_3_1.state ~= var_0_0.kfgzWar then
					log.info("add retreat icon")

					var_3_0.stateSprite = CCSprite:create("res/ui/battle/retreatForward/chetui_icon.png")
				end
			end
		elseif arg_3_1.state == var_0_0.officialWar then
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190068), "Thonburi", 22)
		elseif arg_3_1.state == var_0_0.mineWar then
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190069), "Thonburi", 22)
		elseif arg_3_1.state == var_0_0.cityWar then
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190070), "Thonburi", 22)
		elseif arg_3_1.state == var_0_0.pvpOne or arg_3_1.state == var_0_0.kfgzSolo then
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190071), "Thonburi", 22)
		elseif arg_3_1.state == var_0_0.savageWar then
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190072), "Thonburi", 22)
		elseif arg_3_1.state == var_0_0.pvpSavage then
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190073), "Thonburi", 22)
		elseif arg_3_1.state == var_0_0.biwu then
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190074), "Thonburi", 22)
		elseif arg_3_1.state == var_0_0.eventWar then
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190075), "Thonburi", 22)
		elseif arg_3_1.state == var_0_0.storyWar then
			local var_3_9 = ""

			if user.isYw then
				var_3_9 = language.get(10324)
			else
				var_3_9 = language.get(190076)
			end

			var_3_0.tipText = CCStrokeLabelTTF:create(var_3_9, "Thonburi", 22)

			if arg_3_3 == arg_3_1.battleId then
				var_3_0.stateSprite = CCSprite:create("res/ui/battle/retreatForward/chetui_icon.png")
			end
		elseif arg_3_1.state == var_0_0.pvpOneInStory then
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190077), "Thonburi", 22)
		elseif arg_3_1.state == var_0_0.eventInStory then
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190078), "Thonburi", 22)
		elseif arg_3_1.state == var_0_0.kfyzDongying then
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190074), "Thonburi", 22)
		elseif arg_3_1.state == var_0_0.monster then
			var_3_0.tipText = CCStrokeLabelTTF:create(language.get(190116), "Thonburi", 22)
		else
			log.info("@@ 未知的武将状态 ", arg_3_1.state)
		end
	end

	local var_3_10 = CCNode:create()

	var_3_10:setPosition(arg_3_2)
	arg_3_0:addChild(var_3_10, 0, TAG_GENERAL_ICON)

	local var_3_11 = CCSprite:createWithSpriteFrameName("general_background.png")

	var_3_10:addChild(var_3_11)

	local var_3_12 = CCSprite:createWithSpriteFrameName("general_background_light.png")

	var_3_12:setVisible(false)
	var_3_12:setPosition(ccp(var_3_11:getContentSize().width * 0.5, var_3_11:getContentSize().height * 0.5))
	var_3_11:addChild(var_3_12)
	var_3_0.generalSprite:setPosition(ccp(var_3_11:getContentSize().width * 0.5, var_3_11:getContentSize().height * 0.5))
	var_3_11:addChild(var_3_0.generalSprite)

	local var_3_13 = CCSprite:createWithSpriteFrameName("gene_shortc_degr_view.png")

	var_3_13:setAnchorPoint(ccp(0, 0))
	var_3_0.generalSprite:addChild(var_3_13)

	local var_3_14 = arg_3_1.forces / arg_3_1.forcesMax

	log.info("forces:%s, forcesMax:%s", arg_3_1.forces, arg_3_1.forcesMax)

	if var_3_14 > 1 then
		var_3_14 = 1
	end

	if var_3_14 < 0 then
		var_3_14 = 0
	end

	var_3_0.hpSprite:setScaleX(var_3_14)
	var_3_0.hpSprite:setAnchorPoint(ccp(0, 0.5))
	var_3_0.hpSprite:setPosition(ccp(0, var_3_13:getContentSize().height * 0.5))
	var_3_13:addChild(var_3_0.hpSprite)

	if var_3_0.stateSprite then
		var_3_0.stateSprite:setPosition(ccp(var_3_0.generalSprite:getContentSize().width - var_3_0.stateSprite:getContentSize().width * 0.5, var_3_0.generalSprite:getContentSize().height - var_3_0.stateSprite:getContentSize().height * 0.5))
		var_3_0.generalSprite:addChild(var_3_0.stateSprite)
	end

	if var_3_0.actionSprite then
		var_3_0.actionSprite:setPosition(ccp(var_3_0.generalSprite:getContentSize().width - var_3_0.actionSprite:getContentSize().width * 0.5, var_3_0.actionSprite:getContentSize().height * 0.5))
		var_3_0.generalSprite:addChild(var_3_0.actionSprite)
	end

	if var_3_0.tipText then
		var_3_0.tipText:setPosition(ccp(var_3_0.generalSprite:getContentSize().width * 0.5, 10))
		var_3_0.generalSprite:addChild(var_3_0.tipText, 1000)

		if var_3_0.farmTimer then
			var_3_0.farmTimer:setPosition(ccp(var_3_0.generalSprite:getContentSize().width * 0.5, 30))
			var_3_0.generalSprite:addChild(var_3_0.farmTimer)
		end
	end

	if var_3_0.addHpTip then
		var_3_0.addHpTip:setPosition(ccp(0, 0))
		var_3_0.generalSprite:addChild(var_3_0.addHpTip)
	end

	if arg_3_1.bufferCd and arg_3_1.bufferCd > 1 and not arg_3_1.hasShowBuffAnim then
		log.info("@@ 士气高涨效果判断 ", arg_3_1.bufferCd)

		local var_3_15 = rmgr.getAnimation("boostingNorale")
		local var_3_16 = CCAnimation:createWithSpriteFrames(var_3_15, 0.02)
		local var_3_17 = CCAnimate:create(var_3_16)
		local var_3_18 = CCRepeatForever:create(var_3_17)
		local var_3_19 = CCSprite:create()

		var_3_19:setPosition(arg_3_2)
		var_3_19:runAction(var_3_18)
		arg_3_0:addChild(var_3_19, 1, TAG_BUFF_ANIM)

		arg_3_1.hasShowBuffAnim = true

		local function var_3_20()
			var_3_0.generalSprite:removeChild(var_3_19, true)

			arg_3_1.bufferCd = 0
		end

		performWithDelay(var_3_0.generalSprite, var_3_20, arg_3_1.bufferCd / 1000)
	end

	local function var_3_21()
		if var_3_12 and not tolua.isnull(var_3_12) then
			var_3_12:setVisible(var_3_0.checked)
		end
	end

	function var_3_0.ifClick(arg_9_0, arg_9_1, arg_9_2)
		if tool.checkIfTouch(var_3_11, arg_9_1, arg_9_2) then
			arg_9_0:check()

			return true
		end

		return false
	end

	function var_3_0.simpleClick(arg_10_0, arg_10_1, arg_10_2)
		return tool.checkIfTouch(var_3_11, arg_10_1, arg_10_2)
	end

	function var_3_0.check(arg_11_0)
		if arg_11_0.checked then
			arg_11_0.checked = false
		else
			arg_11_0.checked = true

			log.info(" general.state : %s , general.id : %s", arg_3_1.state, arg_3_1.id)

			if arg_3_4 and worldThumbnailControl and not worldThumbnailControl.visible and arg_3_1.state ~= var_0_0.conscription and arg_3_1.state ~= var_0_0.farm and arg_3_1.state ~= var_0_0.training1 and arg_3_1.state ~= var_0_0.training2 and arg_3_1.state ~= var_0_0.training3 and arg_3_1.state ~= var_0_0.training4 and arg_3_1.state ~= var_0_0.training5 and generalMoveLayer.generalTable["id_" .. arg_3_1.id] then
				eventManager.dispatchEvent("moveToCity", generalMoveLayer.generalTable["id_" .. arg_3_1.id].locationId)
			end

			if (smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION) and generalMoveLayer.generalTable["id_" .. arg_3_1.id] then
				eventManager.dispatchEvent("moveToCity", generalMoveLayer.generalTable["id_" .. arg_3_1.id].locationId, nil, nil, nil, true)
			end

			if smgr.currentSceneTag == SCENE_JUBEN and user.isYw and generalMoveLayer.generalTable["id_" .. arg_3_1.id] then
				eventManager.dispatchEvent("moveToCity", generalMoveLayer.generalTable["id_" .. arg_3_1.id].locationId)
			end
		end

		var_3_21()
	end

	function var_3_0.getChecked(arg_12_0)
		return arg_12_0.checked
	end

	function var_3_0.getGenrealId(arg_13_0)
		return arg_3_1.id
	end

	function var_3_0.getState(arg_14_0)
		return arg_3_1.state
	end

	function var_3_0.getPosition(arg_15_0)
		return arg_3_2
	end

	function var_3_0.handleAssemble(arg_16_0)
		return
	end

	return var_3_0
end

local function var_0_8(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = {}

	var_17_0.checked = false
	var_17_0.clickFunc = nil
	var_17_0.state = arg_17_2.state
	var_17_0.vId = arg_17_2.vId
	var_17_0.isGongjiang = true
	var_17_0.generalSprite = CCSprite:create(string.format("res/ui/common/generalPic/generalPic_jianzaodui.jpg"))

	if arg_17_2.star and arg_17_2.star >= 0 then
		for iter_17_0 = 1, 5 do
			local var_17_1 = iter_17_0 <= arg_17_2.star and "jb_mode_star.png" or "jb_mode_star_gray.png"
			local var_17_2 = CCSprite:create("res/ui/juben/jubenLevelSelect/" .. var_17_1)

			var_17_2:setScale(0.6)
			var_17_2:setAnchorPoint(ccp(0.5, 1))
			var_17_2:setPosition(12 * iter_17_0, 72)
			var_17_0.generalSprite:addChild(var_17_2)
		end

		local var_17_3 = arg_17_2.star < 5 and language.get(390478, arg_17_2.starExp, arg_17_2.maxStarExp) or language.get(121074)
		local var_17_4 = CCStrokeLabelTTF:create(var_17_3, "Thonburi", 18)

		var_17_4:setAnchorPoint(ccp(1, 1))
		var_17_4:setPosition(72, 56)
		var_17_0.generalSprite:addChild(var_17_4)
	end

	var_17_0.stateSprite = nil
	var_17_0.actionSprite = nil
	var_17_0.tipText = nil
	var_17_0.hpSprite = CCSprite:createWithSpriteFrameName("gene_shortc_degr_normal.png")

	if arg_17_2.state == 0 then
		var_17_0.tipText = CCStrokeLabelTTF:create(language.get("220995_buildNation"), "Thonburi", 22)
	elseif arg_17_2.state == 1 then
		var_17_0.tipText = CCStrokeLabelTTF:create(language.get("220996_buildNation"), "Thonburi", 22)
		var_17_0.actionSprite = CCSprite:createWithSpriteFrameName("gene_shortc_icon_suspend.png")
		var_17_0.stateSprite = CCSprite:createWithSpriteFrameName("gene_shortc_icon_move.png")
	else
		var_17_0.tipText = CCStrokeLabelTTF:create(language.get("220997_buildNation"), "Thonburi", 22)
	end

	local var_17_5 = CCNode:create()

	var_17_5:setPosition(arg_17_1)
	arg_17_0:addChild(var_17_5, 0, TAG_GONGJIANG_ICON)

	local var_17_6 = CCSprite:createWithSpriteFrameName("general_background.png")

	var_17_5:addChild(var_17_6)

	local var_17_7 = CCSprite:createWithSpriteFrameName("general_background_light.png")

	var_17_7:setVisible(false)
	var_17_7:setPosition(ccp(var_17_6:getContentSize().width * 0.5, var_17_6:getContentSize().height * 0.5))
	var_17_6:addChild(var_17_7)
	var_17_0.generalSprite:setPosition(ccp(var_17_6:getContentSize().width * 0.5, var_17_6:getContentSize().height * 0.5))
	var_17_6:addChild(var_17_0.generalSprite)

	if var_17_0.stateSprite then
		var_17_0.stateSprite:setPosition(ccp(var_17_0.generalSprite:getContentSize().width - var_17_0.stateSprite:getContentSize().width * 0.5, var_17_0.generalSprite:getContentSize().height - var_17_0.stateSprite:getContentSize().height * 0.5))
		var_17_0.generalSprite:addChild(var_17_0.stateSprite)
	end

	if var_17_0.actionSprite then
		var_17_0.actionSprite:setPosition(ccp(var_17_0.generalSprite:getContentSize().width - var_17_0.actionSprite:getContentSize().width * 0.5, var_17_0.actionSprite:getContentSize().height * 0.5))
		var_17_0.generalSprite:addChild(var_17_0.actionSprite)
	end

	if var_17_0.tipText then
		var_17_0.tipText:setPosition(ccp(var_17_0.generalSprite:getContentSize().width * 0.5, 10))
		var_17_0.generalSprite:addChild(var_17_0.tipText, 1000)
	end

	local function var_17_8()
		if var_17_7 then
			var_17_7:setVisible(var_17_0.checked)
		end
	end

	function var_17_0.ifClick(arg_19_0, arg_19_1, arg_19_2)
		if tool.checkIfTouch(var_17_6, arg_19_1, arg_19_2) then
			arg_19_0:check()

			return true
		end

		return false
	end

	function var_17_0.simpleClick(arg_20_0, arg_20_1, arg_20_2)
		return tool.checkIfTouch(var_17_6, arg_20_1, arg_20_2)
	end

	function var_17_0.check(arg_21_0)
		if arg_21_0.checked then
			arg_21_0.checked = false
		else
			arg_21_0.checked = true

			if worldThumbnailControl and not worldThumbnailControl.visible and generalMoveLayer.gongjiangTable["id_" .. arg_17_2.vId] then
				eventManager.dispatchEvent("moveToCity", generalMoveLayer.gongjiangTable["id_" .. arg_17_2.vId].locationId)
			end
		end

		var_17_8()
	end

	function var_17_0.getChecked(arg_22_0)
		return arg_22_0.checked
	end

	function var_17_0.getGenrealId(arg_23_0)
		return arg_17_2.vId
	end

	function var_17_0.getState(arg_24_0)
		return arg_17_2.state
	end

	function var_17_0.getPosition(arg_25_0)
		return arg_17_1
	end

	return var_17_0
end

local function var_0_9(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = {}

	var_26_0.checked = false
	var_26_0.clickFunc = nil

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		var_26_0.state = user.kfCorpsState or 0
	else
		var_26_0.state = user.corpsState or 0
	end

	var_26_0.vId = arg_26_2.corpsId
	var_26_0.battleId = arg_26_2.battleId
	var_26_0.isJuntuan = true
	var_26_0.generalSprite = CCSprite:create(string.format("res/ui/world/juntuan/jtsj_icon.jpg"))
	var_26_0.stateSprite = nil
	var_26_0.actionSprite = nil
	var_26_0.tipText = nil
	var_26_0.tipText2 = nil
	var_26_0.hpSprite = CCSprite:createWithSpriteFrameName("gene_shortc_degr_normal.png")

	if var_26_0.state == 0 then
		var_26_0.tipText = CCStrokeLabelTTF:create(language.get("220995_buildNation"), "Thonburi", 22)
	elseif var_26_0.state == 1 then
		var_26_0.tipText = CCStrokeLabelTTF:create(language.get("220996_buildNation"), "Thonburi", 22)
		var_26_0.actionSprite = CCSprite:createWithSpriteFrameName("gene_shortc_icon_suspend.png")
		var_26_0.stateSprite = CCSprite:createWithSpriteFrameName("gene_shortc_icon_move.png")
	else
		var_26_0.tipText = CCStrokeLabelTTF:create(language.get("223603_juntuan"), "Thonburi", 22)
		var_26_0.stateSprite = CCSprite:createWithSpriteFrameName("gene_shortc_icon_fight.png")
	end

	local var_26_1 = CCNode:create()

	var_26_1:setPosition(arg_26_1)
	arg_26_0:addChild(var_26_1, 0, TAG_JUNTUAN_ICON)

	local var_26_2 = CCSprite:createWithSpriteFrameName("general_background.png")

	var_26_1:addChild(var_26_2)

	local var_26_3 = CCSprite:createWithSpriteFrameName("general_background_light.png")

	var_26_3:setVisible(false)
	var_26_3:setPosition(ccp(var_26_2:getContentSize().width * 0.5, var_26_2:getContentSize().height * 0.5))
	var_26_2:addChild(var_26_3)
	var_26_0.generalSprite:setPosition(ccp(var_26_2:getContentSize().width * 0.5, var_26_2:getContentSize().height * 0.5))
	var_26_2:addChild(var_26_0.generalSprite)

	local var_26_4 = CCSprite:createWithSpriteFrameName("gene_shortc_degr_view.png")

	var_26_4:setAnchorPoint(ccp(0, 0))
	var_26_0.generalSprite:addChild(var_26_4)
	var_26_0.hpSprite:setScaleX(arg_26_2.remainNum / arg_26_2.maxNum)
	var_26_0.hpSprite:setAnchorPoint(ccp(0, 0.5))
	var_26_0.hpSprite:setPosition(ccp(0, var_26_4:getContentSize().height * 0.5))
	var_26_4:addChild(var_26_0.hpSprite)

	if var_26_0.stateSprite then
		var_26_0.stateSprite:setPosition(ccp(var_26_0.generalSprite:getContentSize().width - var_26_0.stateSprite:getContentSize().width * 0.5, var_26_0.generalSprite:getContentSize().height - var_26_0.stateSprite:getContentSize().height * 0.5))
		var_26_0.generalSprite:addChild(var_26_0.stateSprite)
	end

	if var_26_0.actionSprite then
		var_26_0.actionSprite:setPosition(ccp(var_26_0.generalSprite:getContentSize().width - var_26_0.actionSprite:getContentSize().width * 0.5, var_26_0.actionSprite:getContentSize().height * 0.5))
		var_26_0.generalSprite:addChild(var_26_0.actionSprite)
	end

	if var_26_0.tipText then
		var_26_0.tipText:setPosition(ccp(var_26_0.generalSprite:getContentSize().width * 0.5, 10))
		var_26_0.generalSprite:addChild(var_26_0.tipText, 1000)
	end

	if arg_26_2.endTimeCd then
		local function var_26_5()
			var_0_1[arg_26_2.corpsId] = nil
		end

		local var_26_6 = arg_26_2.endTimeCd

		if var_0_1[arg_26_2.corpsId] then
			var_26_6 = var_0_1[arg_26_2.corpsId]
		end

		var_26_0.tipText2 = createTimerLabel(var_26_6, "@H:@M:@S", "Thonburi", 18, var_26_5, nil, nil, ccc3(218, 35, 11))

		var_26_0.tipText2:setPosition(ccp(var_26_0.generalSprite:getContentSize().width * 0.5, 28))
		var_26_0.generalSprite:addChild(var_26_0.tipText2, 1000)
	end

	local function var_26_7()
		if var_26_3 then
			var_26_3:setVisible(var_26_0.checked)
		end
	end

	function var_26_0.ifClick(arg_29_0, arg_29_1, arg_29_2)
		if tool.checkIfTouch(var_26_2, arg_29_1, arg_29_2) then
			arg_29_0:check()

			return true
		end

		return false
	end

	function var_26_0.simpleClick(arg_30_0, arg_30_1, arg_30_2)
		return tool.checkIfTouch(var_26_2, arg_30_1, arg_30_2)
	end

	function var_26_0.check(arg_31_0)
		if arg_31_0.checked then
			arg_31_0.checked = false
		else
			arg_31_0.checked = true

			local var_31_0 = generalMoveLayer.juntuanTable["id_" .. arg_26_2.corpsId]

			if var_31_0 and var_31_0.locationId then
				if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
					eventManager.dispatchEvent("moveToCity", var_31_0.locationId, nil, nil, nil, true)
				elseif worldThumbnailControl and not worldThumbnailControl.visible then
					eventManager.dispatchEvent("moveToCity", var_31_0.locationId)
				end
			end
		end

		var_26_7()
	end

	function var_26_0.getChecked(arg_32_0)
		return arg_32_0.checked
	end

	function var_26_0.getGenrealId(arg_33_0)
		return arg_26_2.corpsId
	end

	function var_26_0.getState(arg_34_0)
		return arg_26_2.state
	end

	function var_26_0.getPosition(arg_35_0)
		return arg_26_1
	end

	return var_26_0
end

local function var_0_10(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = {}

	var_36_0.checked = false
	var_36_0.clickFunc = nil

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		var_36_0.state = user.kfCorpsState or 0
	else
		var_36_0.state = user.corpsState or 0
	end

	var_36_0.vId = arg_36_2.corpsId
	var_36_0.battleId = arg_36_2.battleId
	var_36_0.isJuntuanDismiss = true
	var_36_0.generalSprite = CCSprite:create(string.format("res/ui/world/juntuan/jtsj_icon_js.jpg"))
	var_36_0.stateSprite = nil
	var_36_0.actionSprite = nil
	var_36_0.tipText = CCStrokeLabelTTF:create(language.get("223601_juntuan"), "Thonburi", 22)
	var_36_0.hpSprite = CCSprite:createWithSpriteFrameName("gene_shortc_degr_normal.png")

	local var_36_1 = CCNode:create()

	var_36_1:setPosition(arg_36_1)
	arg_36_0:addChild(var_36_1, 0, TAG_JUNTUAN_ICON)

	local var_36_2 = CCSprite:createWithSpriteFrameName("general_background.png")

	var_36_1:addChild(var_36_2)

	local var_36_3 = CCSprite:createWithSpriteFrameName("general_background_light.png")

	var_36_3:setVisible(false)
	var_36_3:setPosition(ccp(var_36_2:getContentSize().width * 0.5, var_36_2:getContentSize().height * 0.5))
	var_36_2:addChild(var_36_3)
	var_36_0.generalSprite:setPosition(ccp(var_36_2:getContentSize().width * 0.5, var_36_2:getContentSize().height * 0.5))
	var_36_2:addChild(var_36_0.generalSprite)

	local var_36_4 = CCSprite:createWithSpriteFrameName("gene_shortc_degr_view.png")

	var_36_4:setAnchorPoint(ccp(0, 0))
	var_36_0.generalSprite:addChild(var_36_4)
	var_36_0.hpSprite:setScaleX(0)
	var_36_0.hpSprite:setAnchorPoint(ccp(0, 0.5))
	var_36_0.hpSprite:setPosition(ccp(0, var_36_4:getContentSize().height * 0.5))
	var_36_4:addChild(var_36_0.hpSprite)

	if var_36_0.tipText then
		var_36_0.tipText:setPosition(ccp(var_36_0.generalSprite:getContentSize().width * 0.5, 10))
		var_36_0.generalSprite:addChild(var_36_0.tipText, 1000)
	end

	local function var_36_5()
		return
	end

	function var_36_0.ifClick(arg_38_0, arg_38_1, arg_38_2)
		if tool.checkIfTouch(var_36_2, arg_38_1, arg_38_2) then
			arg_38_0:check()

			return true
		end

		return false
	end

	function var_36_0.simpleClick(arg_39_0, arg_39_1, arg_39_2)
		return tool.checkIfTouch(var_36_2, arg_39_1, arg_39_2)
	end

	function var_36_0.check(arg_40_0)
		if arg_40_0.checked then
			arg_40_0.checked = false
		else
			arg_40_0.checked = true

			local var_40_0 = generalMoveLayer.juntuanTable["id_" .. arg_36_2.corpsId]

			if var_40_0 and var_40_0.locationId then
				if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
					eventManager.dispatchEvent("moveToCity", var_40_0.locationId, nil, nil, nil, true)
				elseif worldThumbnailControl and not worldThumbnailControl.visible then
					eventManager.dispatchEvent("moveToCity", var_40_0.locationId)
				end
			end
		end

		var_36_5()
	end

	function var_36_0.getChecked(arg_41_0)
		return arg_41_0.checked
	end

	function var_36_0.getGenrealId(arg_42_0)
		return arg_36_2.corpsId
	end

	function var_36_0.getState(arg_43_0)
		return arg_36_2.state
	end

	function var_36_0.getPosition(arg_44_0)
		return arg_36_1
	end

	return var_36_0
end

function showSimpleGeneralPanel(arg_45_0, arg_45_1, arg_45_2, arg_45_3, arg_45_4, arg_45_5)
	rmgr.loadResource("res/ui/sidebar/sidebar.plist")
	log.info("@@ 武将快捷栏创建")

	local var_45_0 = createBaseLayer()
	local var_45_1 = createBaseLayer()
	local var_45_2 = CCScrollView:create(CCSizeMake(95, 360))

	var_45_2:setContainer(var_45_1)

	local var_45_3
	local var_45_4 = (arg_45_2 == true and 6 or -96) + platform.getSafeDistance()

	var_45_2:setPosition(var_45_4, visibleSize.height / 2 - 240)
	var_45_2:setContentSize(CCSizeMake(95, 800))
	var_45_2:setContentOffset(ccp(0, -440))
	var_45_2:setDirection(kCCScrollViewDirectionVertical)
	var_45_2:setTouchEnabled(false)
	var_45_0:addChild(var_45_2, 1, TAG_GENERAL_SCROLLVIEW)

	local var_45_5 = CCSprite:create("res/ui/sidebar/jgdy_hp_d.png")
	local var_45_6 = (arg_45_2 == true and 53 or -49) + platform.getSafeDistance()

	var_45_5:setPosition(var_45_6, visibleSize.height / 2 - 75)
	var_45_0:addChild(var_45_5, 0)

	local var_45_7 = false
	local var_45_8 = 1

	arg_45_2 = arg_45_2 or false

	local var_45_9 = {
		generals = {},
		generalControls = {}
	}

	var_45_9.lastGeneralControl = nil
	var_45_9.lastSelectGeneralPos = nil
	var_45_9.isInWorld = arg_45_2
	var_45_9.opened = false
	var_45_9.touchBeginPosiiton = nil
	var_45_9.canHandlePush = false
	var_45_9.actionGeneral = nil
	var_45_9.touchBeginGeneral = nil
	var_45_9.maxGeneralNum = 0
	var_45_9.generalNum = 0
	var_45_9.isVisible = true
	var_45_9.isInkf = arg_45_3 or false
	var_45_9.kfCityId = arg_45_4 or 0

	function var_45_9.open()
		if not arg_45_2 and not var_45_9.opened then
			var_45_9.openItem:setVisible(false)
			var_45_9.closeItem:setVisible(true)
			var_45_0:runAction(CCMoveBy:create(0.5, ccp(105, 0)))
			var_45_9.background:runAction(CCFadeOut:create(0.1))

			var_45_9.opened = true

			if var_45_9.bg_slope then
				var_45_9.bg_slope:setVisible(true)
			end
		end
	end

	function var_45_9.close()
		if not arg_45_2 and var_45_9.opened then
			var_45_9.openItem:setVisible(true)
			var_45_9.closeItem:setVisible(false)
			var_45_0:runAction(CCMoveBy:create(0.5, ccp(-105, 0)))
			var_45_9.background:runAction(CCFadeIn:create(0.1))

			var_45_9.opened = false

			if var_45_9.bg_slope then
				local var_47_0 = CCArray:create()

				var_47_0:addObject(CCDelayTime:create(0.5))
				var_47_0:addObject(CCHide:create())

				local var_47_1 = CCSequence:create(var_47_0)

				var_45_9.bg_slope:runAction(var_47_1)
			end
		end
	end

	function var_45_9.initMenu()
		var_45_9.background = CCSprite:createWithSpriteFrameName("fight_open_background.png")

		var_45_9.background:setFlipX(true)
		var_45_9.background:setPosition(ccp(25 + platform.getSafeDistance(), visibleSize.height * 0.5 + 5))
		var_45_0:addChild(var_45_9.background)

		var_45_9.menu = CCMenu:create()

		var_45_9.menu:setPosition(0, 0)
		var_45_0:addChild(var_45_9.menu)

		local var_48_0 = CCSprite:createWithSpriteFrameName("btn_general_normal.png")
		local var_48_1 = CCSprite:createWithSpriteFrameName("btn_general_light.png")

		var_45_9.openItem = CCMenuItemSprite:create(var_48_0, var_48_1)

		var_45_9.openItem:registerScriptTapHandler(var_45_9.open)

		var_45_6 = var_48_0:getContentSize().width * 0.5 + 10 + platform.getSafeDistance()

		var_45_9.openItem:setPosition(ccp(var_45_6, visibleSize.height * 0.5))
		var_45_9.menu:addChild(var_45_9.openItem)

		local var_48_2 = CCSprite:createWithSpriteFrameName("btn_fight_close_normal.png")

		var_48_2:setFlipX(true)

		local var_48_3 = CCSprite:createWithSpriteFrameName("btn_fight_close_light.png")

		var_48_3:setFlipX(true)

		var_45_9.closeItem = CCMenuItemSprite:create(var_48_2, var_48_3)

		var_45_9.closeItem:registerScriptTapHandler(var_45_9.close)
		var_45_9.closeItem:setPosition(ccp(var_45_6, visibleSize.height * 0.5))
		var_45_9.closeItem:setVisible(false)
		var_45_9.menu:addChild(var_45_9.closeItem)
	end

	function var_45_9.showTipsInScreenCenter(arg_49_0, arg_49_1)
		local var_49_0 = CCStrokeLabelTTF:create(arg_49_0, "Thonburi", 20)

		var_49_0:setColor(colorTips.green)

		if arg_49_1 then
			var_49_0:setPosition(arg_49_1)
		else
			var_49_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
		end

		var_45_0:addChild(var_49_0)

		local function var_49_1()
			var_45_0:removeChild(var_49_0, true)
		end

		local var_49_2 = CCArray:create()

		var_49_2:addObject(CCMoveBy:create(0.5, ccp(0, 30)))
		var_49_2:addObject(CCCallFuncN:create(var_49_1))

		local var_49_3 = CCSequence:create(var_49_2)

		var_49_0:runAction(var_49_3)
	end

	function var_45_9.getSlopeGeneralById(arg_51_0)
		var_45_9.slopeGenerals = var_45_9.slopeGenerals or {}

		for iter_51_0, iter_51_1 in ipairs(var_45_9.slopeGenerals) do
			if iter_51_1.id == arg_51_0 then
				return iter_51_1, iter_51_0
			end
		end
	end

	function var_45_9.updateMsg()
		local var_52_0 = 65
		local var_52_1 = 27
		local var_52_2 = 50
		local var_52_3 = 0.7

		local function var_52_4()
			if not var_45_9.bg_slope then
				local var_53_0 = CCSprite:create("res/ui/battle/cf_cd.png")

				var_53_0:setPosition(ccp(-110 + platform.getSafeDistance(), visibleSize.height - 80 - 60 - 40 + 10 + 5))
				var_53_0:setAnchorPoint(ccp(0, 0.5))
				var_45_0:addChild(var_53_0)

				var_45_9.bg_slope = var_53_0

				local var_53_1 = CCSprite:create("res/ui/battle/cf_icon.png")

				var_53_1:setPosition(ccp(40, 35))
				var_53_0:addChild(var_53_1)
				var_53_0:setVisible(false)

				local var_53_2 = CCLayerColor:create(ccc4(0, 0, 0, 0), 400, 45)
				local var_53_3 = CCScrollView:create(CCSizeMake(400, 45), var_53_2)

				var_53_3:setPosition(ccp(0, 0))
				var_53_3:setTouchEnabled(false)
				var_53_0:addChild(var_53_3)

				var_45_9.msgLayer = var_53_2
			end

			local var_53_4 = var_45_9.slopeGenerals[var_45_9.msgIdx]
			local var_53_5 = CCLabelTTF:create(var_53_4.name, "Thonburi", 22)

			var_53_5:setColor(colorQuality[6])
			var_53_5:setAnchorPoint(ccp(0, 0.5))

			local var_53_6 = CCLabelTTF:create(language.get(113033), "Thonburi", 22)

			var_53_6:setColor(ccc3(217, 237, 197))
			var_53_6:setAnchorPoint(ccp(0, 0.5))

			local var_53_7 = CCLabelTTF:create("00:00", "Thonburi", 22)
			local var_53_8 = createTimerLabel(var_53_4.slopeCd, "@M:@S", "Thonburi", 22, nil, nil, nil, ccc3(214, 88, 54))
			local var_53_9 = var_53_5:getContentSize().width
			local var_53_10 = var_53_6:getContentSize().width
			local var_53_11 = var_53_7:getContentSize().width
			local var_53_12 = CCNode:create()

			var_53_12:setPosition(ccp(var_52_0, var_52_1 - var_52_2))
			var_53_5:setPosition(ccp(0, 0))
			var_53_6:setPosition(ccp(var_53_9, 0))
			var_53_8:setPosition(ccp(var_53_9 + var_53_10 + var_53_11 / 2 + 10, 0))
			var_53_12:addChild(var_53_5)
			var_53_12:addChild(var_53_6)
			var_53_12:addChild(var_53_8)
			var_45_9.msgLayer:addChild(var_53_12)

			local var_53_13 = CCArray:create()

			var_53_13:addObject(CCEaseSineOut:create(CCMoveBy:create(var_52_3, ccp(0, var_52_2))))
			var_53_13:addObject(CCDelayTime:create(3 - var_52_3))
			var_53_13:addObject(CCCallFuncN:create(function()
				var_45_9:updateMsg()
			end))

			local var_53_14 = CCSequence:create(var_53_13)

			var_53_12:runAction(var_53_14)

			var_45_9.msg = var_53_12
		end

		var_45_9.msgIdx = var_45_9.msgIdx or 1

		local var_52_5 = #var_45_9.slopeGenerals

		if var_52_5 > 0 then
			if var_45_9.msg then
				if var_52_5 > 1 then
					local var_52_6 = var_45_9.msg

					var_45_9.msgIdx = var_45_9.msgIdx + 1

					if var_52_5 < var_45_9.msgIdx then
						var_45_9.msgIdx = 1
					end

					local var_52_7 = CCArray:create()

					var_52_7:addObject(CCEaseSineOut:create(CCMoveBy:create(var_52_3, ccp(0, var_52_2))))
					var_52_7:addObject(CCCallFuncN:create(function()
						var_52_6:removeFromParentAndCleanup(true)
					end))

					local var_52_8 = CCSequence:create(var_52_7)

					var_52_6:runAction(var_52_8)
					var_52_4()
				end
			else
				var_52_4()
			end
		end
	end

	function var_45_9.refresh(arg_56_0)
		for iter_56_0, iter_56_1 in pairs(var_45_9.generals) do
			if var_0_3[tostring(iter_56_1.id)] and not tolua.isnull(var_0_3[tostring(iter_56_1.id)]) then
				iter_56_1.farmCd = var_0_3[tostring(iter_56_1.id)]:getTime()
			end
		end

		tool.safeRemoveChildByTag(var_45_1, TAG_GENERAL_ICON)

		if arg_56_0 then
			tool.safeRemoveChildByTag(var_45_0, TAG_BUFF_ANIM)
			tool.safeRemoveChildByTag(var_45_1, TAG_BUFF_ANIM)
		end

		tool.safeRemoveChildByTag(var_45_1, TAG_GONGJIANG_ICON)

		var_45_9.generalControls = nil
		var_45_9.lastGeneralControl = nil
		var_45_9.generalControls = {}
		var_45_9.gongjiangControls = nil
		var_45_9.gongjiangControls = {}

		local var_56_0 = 0
		local var_56_1 = 0
		local var_56_2 = 0
		local var_56_3 = 47
		local var_56_4 = 758
		local var_56_5 = 0
		local var_56_6
		local var_56_7

		if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
			var_56_6 = user.kfCorpsInfo[user.player.kfgzForceId]
			var_56_7 = user.player.kfgzCompetitorId
		elseif smgr.currentSceneTag == SCENE_WORLD then
			var_56_6 = user.corpsInfo[user.player.forceId]
			var_56_7 = user.player.playerId
		end

		if var_56_6 and var_56_6.playerId == var_56_7 and var_56_6.state == 2 then
			var_56_5 = var_56_5 + 1

			local var_56_8 = var_0_9(var_45_1, ccp(var_56_3, var_56_4 - 92 * (var_56_5 - 1)), var_56_6)

			table.insert(var_45_9.generalControls, var_56_8)

			var_56_5 = var_56_5 + 1

			local var_56_9 = var_0_10(var_45_1, ccp(var_56_3, var_56_4 - 92 * (var_56_5 - 1)), var_56_6)

			table.insert(var_45_9.generalControls, var_56_9)
		else
			for iter_56_2, iter_56_3 in pairs(var_45_9.generals) do
				var_56_5 = var_56_5 + 1

				if iter_56_3 then
					local var_56_10 = var_0_7(var_45_1, iter_56_3, ccp(var_56_3, var_56_4 - 92 * (var_56_5 - 1)), arg_45_1, arg_45_2)

					table.insert(var_45_9.generalControls, var_56_10)

					if smgr.currentSceneTag == SCENE_WORLD then
						if iter_56_3.state == var_0_0.sleep then
							var_56_2 = var_56_2 + 1
						elseif iter_56_3.state == var_0_0.farm then
							if iter_56_3.farmIsEnd == 0 then
								var_56_1 = var_56_1 + 1
							else
								var_56_2 = var_56_2 + 1
							end
						elseif iter_56_3.state == var_0_0.training1 or iter_56_3.state == var_0_0.training2 or iter_56_3.state == var_0_0.training3 or iter_56_3.state == var_0_0.training4 or iter_56_3.state == var_0_0.training5 then
							if iter_56_3.farmIsEnd == 0 then
								var_56_0 = var_56_0 + 1
							else
								var_56_2 = var_56_2 + 1
							end
						end
					end
				end
			end

			if smgr.currentSceneTag == SCENE_WORLD then
				if var_56_0 > 0 then
					eventManager.dispatchEvent("setFarm", 3)
				elseif var_56_1 > 0 then
					eventManager.dispatchEvent("setFarm", 2)
				elseif var_56_2 > 0 then
					eventManager.dispatchEvent("setFarm", 1)
				else
					eventManager.dispatchEvent("setFarm", 0)
				end
			end

			if smgr.currentSceneTag == SCENE_BATTLE and smgr.lastSafeScene == SCENE_WORLD then
				local var_56_11 = eventManager.dispatchEvent("getBattleInfo")
				local var_56_12 = var_56_11.type
				local var_56_13 = var_56_11.cityId

				if var_56_12 == battleType.BATTLE_CITY and (var_56_13 == 134 or var_56_13 == 137 or var_56_13 == 101 or var_56_13 == 104 or var_56_13 == 56 or var_56_13 == 142) then
					var_45_9.slopeGenerals = var_45_9.slopeGenerals or {}

					for iter_56_4, iter_56_5 in pairs(var_45_9.generals) do
						log.info("zhu@@@general", iter_56_5.name, iter_56_5.generalLocationId)

						if iter_56_5.generalLocationId == var_56_13 then
							local var_56_14, var_56_15 = var_45_9.getSlopeGeneralById(iter_56_5.id)

							if iter_56_5.slopeCd > 0 then
								if not var_56_14 then
									table.insert(var_45_9.slopeGenerals, iter_56_5)
								end
							elseif var_56_14 then
								table.remove(var_45_9.slopeGenerals, var_56_15)
							end
						end
					end

					if #var_45_9.slopeGenerals > 0 and not var_45_9.checkSlopeCd then
						var_45_9.checkSlopeCd = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(function(arg_57_0)
							local var_57_0 = {}

							for iter_57_0, iter_57_1 in ipairs(var_45_9.slopeGenerals) do
								if iter_57_1.slopeCd > 0 then
									iter_57_1.slopeCd = iter_57_1.slopeCd - arg_57_0 * 1000
								end

								if iter_57_1.slopeCd > 0 then
									table.insert(var_57_0, iter_57_1)
								end
							end

							var_45_9.slopeGenerals = var_57_0

							if #var_45_9.slopeGenerals == 0 and var_45_9.bg_slope then
								var_45_9.bg_slope:removeFromParentAndCleanup(true)

								var_45_9.bg_slope = nil
							end
						end, 0.1, false)

						var_45_9.updateMsg()
					end
				end
			end
		end

		var_45_9.gongjiangs = var_45_9.gongjiangs or worldControl.gongjiangPaths

		if smgr.currentSceneTag == SCENE_WORLD and var_45_9.gongjiangs then
			local var_56_16 = var_56_5

			for iter_56_6 = 1, #var_45_9.gongjiangs do
				var_56_5 = var_56_5 + 1

				local var_56_17 = var_0_8(var_45_1, ccp(var_56_3, var_56_4 - 92 * (var_56_5 - 1)), var_45_9.gongjiangs[iter_56_6])

				table.insert(var_45_9.generalControls, var_56_17)
			end
		end

		if var_45_9.generals then
			local var_56_18 = 0

			if var_45_9.gongjiangs then
				for iter_56_7, iter_56_8 in pairs(var_45_9.gongjiangs) do
					var_56_18 = var_56_18 + 1
				end
			end

			for iter_56_9, iter_56_10 in pairs(var_45_9.generals) do
				var_56_18 = var_56_18 + 1
			end

			if var_56_18 <= MAX_GENERALNUM then
				var_45_9.needPage = false
			else
				var_45_9.needPage = true
			end
		end
	end

	function var_45_9.mergeAttribute(arg_58_0)
		if arg_58_0.isDeputy then
			local var_58_0 = var_45_9.generals[arg_58_0.chiefId]

			if var_58_0 then
				var_58_0.DeputyForcesMax = arg_58_0.forcesMax or var_58_0.DeputyForcesMax
				var_58_0.DeputyForces = arg_58_0.forces or var_58_0.DeputyForces
				var_58_0.DeputyNeedTime = arg_58_0.needTime or var_58_0.DeputyNeedTime

				if var_58_0.ChiefForcesMax and var_58_0.DeputyForcesMax then
					var_58_0.forcesMax = var_58_0.ChiefForcesMax + var_58_0.DeputyForcesMax
				end

				if var_58_0.ChiefForces and var_58_0.DeputyForces then
					var_58_0.forces = var_58_0.ChiefForces + var_58_0.DeputyForces
				end

				if var_58_0.ChiefNeedTime and var_58_0.DeputyNeedTime then
					if var_58_0.ChiefNeedTime > var_58_0.DeputyNeedTime then
						var_58_0.needTime = var_58_0.ChiefNeedTime
					else
						var_58_0.needTime = var_58_0.DeputyNeedTime
					end
				end
			end

			return
		end

		recordGeneralState = var_45_9.generals

		if var_45_9.generals[arg_58_0.generalId] == nil then
			var_45_9.generals[arg_58_0.generalId] = {}
		end

		var_45_9.generals[arg_58_0.generalId].isChief = arg_58_0.isChief or false
		var_45_9.generals[arg_58_0.generalId].deputyGeneralId = arg_58_0.deputyGeneralId or -1
		var_45_9.generals[arg_58_0.generalId].id = arg_58_0.generalId or var_45_9.generals[arg_58_0.generalId].id
		var_45_9.generals[arg_58_0.generalId].name = arg_58_0.generalName or var_45_9.generals[arg_58_0.generalId].name

		if arg_58_0.isChief then
			local var_58_1 = var_45_9.generals[arg_58_0.generalId]

			var_58_1.ChiefForcesMax = arg_58_0.forcesMax or var_58_1.ChiefForcesMax
			var_58_1.ChiefForces = arg_58_0.forces or var_58_1.ChiefForces
			var_58_1.DeputyForcesMax = arg_58_0.deputyForcesMax or var_58_1.DeputyForcesMax
			var_58_1.DeputyForces = arg_58_0.deputyForces or var_58_1.DeputyForces
			var_58_1.ChiefNeedTime = arg_58_0.needTime or var_58_1.ChiefNeedTime

			if var_58_1.ChiefForcesMax and var_58_1.DeputyForcesMax then
				var_58_1.forcesMax = var_58_1.ChiefForcesMax + var_58_1.DeputyForcesMax
			end

			if var_58_1.ChiefForces and var_58_1.DeputyForces then
				var_58_1.forces = var_58_1.ChiefForces + var_58_1.DeputyForces
			end

			if var_58_1.ChiefNeedTime and var_58_1.DeputyNeedTime then
				if var_58_1.ChiefNeedTime > var_58_1.DeputyNeedTime then
					var_58_1.needTime = var_58_1.ChiefNeedTime
				else
					var_58_1.needTime = var_58_1.DeputyNeedTime
				end
			end
		else
			var_45_9.generals[arg_58_0.generalId].forcesMax = arg_58_0.forcesMax or var_45_9.generals[arg_58_0.generalId].forcesMax
			var_45_9.generals[arg_58_0.generalId].forces = arg_58_0.forces or var_45_9.generals[arg_58_0.generalId].forces
			var_45_9.generals[arg_58_0.generalId].needTime = arg_58_0.needTime or var_45_9.generals[arg_58_0.generalId].needTime
		end

		log.info("forces:%s, forcesMax:%s", var_45_9.generals[arg_58_0.generalId].forces, var_45_9.generals[arg_58_0.generalId].forcesMax)

		var_45_9.generals[arg_58_0.generalId].quality = arg_58_0.quality or var_45_9.generals[arg_58_0.generalId].quality
		var_45_9.generals[arg_58_0.generalId].lv = arg_58_0.generalLv or var_45_9.generals[arg_58_0.generalId].lv
		var_45_9.generals[arg_58_0.generalId].pic = arg_58_0.pic or var_45_9.generals[arg_58_0.generalId].pic
		var_45_9.generals[arg_58_0.generalId].generalState = arg_58_0.generalState or var_45_9.generals[arg_58_0.generalId].generalState

		if arg_58_0.cTime then
			var_0_1[arg_58_0.generalId] = arg_58_0.cTime

			log.info("currentMyTime[" .. arg_58_0.generalId .. "] = " .. var_0_1[arg_58_0.generalId])
		end

		var_45_9.generals[arg_58_0.generalId].escapeTime = arg_58_0.cTime or var_0_1[arg_58_0.generalId]
		var_45_9.generals[arg_58_0.generalId].intervalForces = arg_58_0.intervalForces or var_45_9.generals[arg_58_0.generalId].intervalForces
		var_45_9.generals[arg_58_0.generalId].juBenLoId = arg_58_0.juBenLoId or var_45_9.generals[arg_58_0.generalId].juBenLoId
		var_45_9.generals[arg_58_0.generalId].battleId = arg_58_0.battleId or var_45_9.generals[arg_58_0.generalId].battleId

		if arg_58_0.bsPunishTime then
			var_0_2[arg_58_0.generalId] = arg_58_0.bsPunishTime
		end

		var_45_9.generals[arg_58_0.generalId].bsPunishTime = arg_58_0.bsPunishTime or var_0_2[arg_58_0.generalId]

		if arg_58_0.farmCd then
			var_45_9.generals[arg_58_0.generalId].farmCd = arg_58_0.farmCd
		end

		if arg_58_0.cdRecoverGold then
			var_45_9.generals[arg_58_0.generalId].cdRecoverGold = arg_58_0.cdRecoverGold
		end

		var_45_9.generals[arg_58_0.generalId].farmType = arg_58_0.farmType
		var_45_9.generals[arg_58_0.generalId].farmIsEnd = arg_58_0.farmIsEnd
		var_45_9.generals[arg_58_0.generalId].extraBuffId = arg_58_0.extraBuffId

		if arg_58_0.buffCd then
			var_45_9.generals[arg_58_0.generalId].bufferCd = arg_58_0.buffCd
		end

		var_45_9.generals[arg_58_0.generalId].state = var_45_9.generals[arg_58_0.generalId].generalState

		if arg_58_0.cState then
			var_45_9.generals[arg_58_0.generalId].state = arg_58_0.cState
		end

		if arg_58_0.bsPunishTime and arg_58_0.bsPunishTime > 0 then
			log.info("general.bsPunishTime > 0")

			var_45_9.generals[arg_58_0.generalId].state = var_0_0.weicheng
		end

		var_45_9.generals[arg_58_0.generalId].slopeCd = arg_58_0.slopeCd or 0
		var_45_9.generals[arg_58_0.generalId].generalLocationId = arg_58_0.generalLocationId
	end

	function var_45_9.kfMergeAttribute(arg_59_0)
		if not arg_59_0 or not arg_59_0.gid then
			return
		end

		recordGeneralState = var_45_9.generals

		if var_45_9.generals[arg_59_0.gid] == nil then
			var_45_9.generals[arg_59_0.gid] = {}
		end

		local var_59_0 = arg_59_0.gid

		var_45_9.generals[var_59_0].id = arg_59_0.gid or var_45_9.generals[arg_59_0.gid].id
		var_45_9.generals[var_59_0].pic = arg_59_0.pic or var_45_9.generals[arg_59_0.gid].pic
		var_45_9.generals[var_59_0].kfCityId = arg_59_0.cityId or var_45_9.generals[arg_59_0.gid].kfCityId
		var_45_9.generals[var_59_0].kfTeamId = arg_59_0.teamId or var_45_9.generals[arg_59_0.gid].kfTeamId
		var_45_9.generals[var_59_0].name = arg_59_0.name or var_45_9.generals[var_59_0].name
		var_45_9.generals[var_59_0].forcesMax = arg_59_0.maxHp or var_45_9.generals[var_59_0].forcesMax
		var_45_9.generals[var_59_0].forces = arg_59_0.hp or var_45_9.generals[var_59_0].forces
		var_45_9.generals[var_59_0].quality = arg_59_0.quality or var_45_9.generals[var_59_0].quality
		var_45_9.generals[var_59_0].lv = arg_59_0.gLv or var_45_9.generals[var_59_0].lv
		var_45_9.generals[var_59_0].pic = arg_59_0.pic or var_45_9.generals[var_59_0].pic
		var_45_9.generals[var_59_0].isGold = arg_59_0.isGold or var_45_9.generals[var_59_0].isGold
		var_45_9.generals[var_59_0].isChief = arg_59_0.isChief or false
		var_45_9.generals[var_59_0].generalState = arg_59_0.generalState or var_45_9.generals[var_59_0].generalState

		if arg_59_0.needMubingSecond then
			var_45_9.generals[var_59_0].needTime = arg_59_0.needMubingSecond * 1000 or var_45_9.generals[arg_59_0.generalId].needTime
			var_45_9.generals[var_59_0].intervalForces = (var_45_9.generals[var_59_0].forcesMax - var_45_9.generals[var_59_0].forces) / arg_59_0.needMubingSecond
		end

		var_45_9.generals[var_59_0].state = var_45_9.generals[var_59_0].generalState
		user.player.kfGenerals = deepcopy(var_45_9.generals)
	end

	function var_45_9.handlerGetWorldMapAction(arg_60_0)
		local var_60_0 = arg_60_0.data.general

		for iter_60_0, iter_60_1 in pairs(var_60_0) do
			var_45_9.kfMergeAttribute(iter_60_1)
		end

		var_45_9.refresh()

		var_45_9.canHandlePush = true
	end

	function var_45_9.updateGeneralState(arg_61_0, arg_61_1)
		if arg_61_0 and arg_61_1 then
			var_45_9.kfMergeAttribute({
				gid = arg_61_0,
				generalState = arg_61_1
			})
			var_45_9.refresh()
		end
	end

	function var_45_9.showKfGeneralInfo()
		if user.player.kfGenerals then
			var_45_9.generals = deepcopy(user.player.kfGenerals)

			var_45_9.refresh()

			var_45_9.canHandlePush = true
		end
	end

	function var_45_9.handlPushGeneral(arg_63_0)
		if var_45_9.canHandlePush then
			local var_63_0 = arg_63_0.data or arg_63_0.action.data

			if var_63_0.general then
				local var_63_1 = var_63_0.general.military

				if var_63_0.general.update == "reduce" then
					log.info("世界：掉血了")
					showTable(var_63_1)

					for iter_63_0, iter_63_1 in pairs(var_63_1) do
						if var_45_9.generals[iter_63_1.generalId] and var_45_9.generals[iter_63_1.generalId].isChief then
							if var_45_9.generals[iter_63_1.generalId].ChiefForces then
								var_45_9.generals[iter_63_1.generalId].ChiefForces = var_45_9.generals[iter_63_1.generalId].ChiefForces - iter_63_1.forces
							end

							var_45_9.generals[iter_63_1.generalId].forces = var_45_9.generals[iter_63_1.generalId].forces - iter_63_1.forces
						elseif not var_45_9.generals[iter_63_1.generalId] and var_45_9.deputys and var_45_9.deputys[iter_63_1.generalId] then
							local var_63_2 = var_45_9.deputys[iter_63_1.generalId].chiefId

							if var_63_2 then
								var_45_9.generals[var_63_2].DeputyForces = var_45_9.generals[var_63_2].DeputyForces - iter_63_1.forces
								var_45_9.generals[var_63_2].forces = var_45_9.generals[var_63_2].forces - iter_63_1.forces
							end
						elseif var_45_9.generals[iter_63_1.generalId] then
							var_45_9.generals[iter_63_1.generalId].forces = var_45_9.generals[iter_63_1.generalId].forces - iter_63_1.forces
						end
					end
				else
					if var_63_1 then
						for iter_63_2, iter_63_3 in pairs(var_63_1) do
							if var_45_9.isInkf then
								var_45_9.kfMergeAttribute(iter_63_3)
							elseif var_45_9.generals[iter_63_3.generalId] then
								if var_45_9.generals[iter_63_3.generalId].isChief then
									log.info("主将的血")

									iter_63_3.isChief = true
								end

								var_45_9.mergeAttribute(iter_63_3)
							elseif var_45_9.deputys[iter_63_3.generalId] then
								log.info("副将的血")

								for iter_63_4, iter_63_5 in pairs(var_45_9.generals) do
									if iter_63_5.deputyGeneralId and iter_63_5.deputyGeneralId == iter_63_3.generalId then
										iter_63_3.isDeputy = true
										iter_63_3.chiefId = iter_63_5.id

										var_45_9.mergeAttribute(iter_63_3)
									end
								end
							end
						end
					end

					for iter_63_6, iter_63_7 in pairs(var_63_0.general.deputyInfos or {}) do
						if var_45_9.isInkf then
							var_45_9.kfMergeAttribute(iter_63_7)
						else
							var_45_9.mergeAttribute(iter_63_7)
						end

						var_45_9.deputys[iter_63_7.generalId] = iter_63_7
					end
				end
			end

			if var_63_0.hp then
				log.info("@@ 武将属性")
				var_45_9.kfMergeAttribute(var_63_0.hp)
			end

			var_45_9.refresh()
		end
	end

	function var_45_9.handlPushGeneralBattle(arg_64_0)
		return
	end

	function var_45_9.handleGeneralSimpleInfo(arg_65_0)
		local var_65_0 = arg_65_0.action.data.military

		var_45_9.maxGeneralNum = arg_65_0.action.data.mSizeMax
		var_45_9.generalNum = arg_65_0.action.data.mSize
		var_45_9.generals = {}
		var_45_9.deputys = {}
		TAG_GENERAL_FUJIANG = -1
		TAG_GENERAL_ZHUJIANG = -1

		for iter_65_0, iter_65_1 in pairs(var_65_0) do
			var_45_9.mergeAttribute(iter_65_1)
		end

		if arg_65_0.action.data.deputyInfos then
			for iter_65_2, iter_65_3 in pairs(arg_65_0.action.data.deputyInfos) do
				var_45_9.deputys[iter_65_3.generalId] = iter_65_3

				var_45_9.mergeAttribute(iter_65_3)
			end
		end

		var_45_9.refresh(true)

		var_45_9.canHandlePush = true
	end

	function var_45_9.handleAssemble(arg_66_0)
		log.info("@@ 召集武将")
	end

	function var_45_9.handleRecover(arg_67_0)
		var_45_9.showTipsInScreenCenter(language.get(190079), ccp(var_45_9.lastSelectGeneralPos.x + 100, var_45_9.lastSelectGeneralPos.y))
		var_45_9.getGeneralInfo()
	end

	function var_45_9.generalRecoverInfo(arg_68_0)
		local function var_68_0(arg_69_0)
			if arg_69_0.action.state == 1 then
				local var_69_0 = arg_69_0.data or arg_69_0.action.data

				if user.inJuBen then
					cmgr.sendRequest(var_45_9.handleRecover, actions.generalRecover, arg_68_0)
				elseif var_69_0.token and var_69_0.token > 0 then
					cmgr.sendRequest(var_45_9.handleRecover, actions.generalRecover, arg_68_0)
				else
					messageBox.showChargeWin(language.get(190080), language.get(190081, arg_69_0.action.data.gold), "goldRecruit", function()
						cmgr.sendRequest(var_45_9.handleRecover, actions.generalRecover, arg_68_0)
					end)
				end
			end
		end

		local function var_68_1()
			kfcmgr.sendRequest(nil, actions.kfgzFastAddHp, arg_68_0)
		end

		if arg_45_3 then
			log.info("@@ 是否使用金币募兵", var_45_9.generals[arg_68_0].isGold)

			if var_45_9.generals[arg_68_0].isGold then
				local var_68_2 = var_45_9.generals[arg_68_0].needTime or 0
				local var_68_3 = math.ceil(var_68_2 / 300000)

				messageBox.showChargeWin(language.get(190080), language.get(190081, var_68_3), "goldRecruit", var_68_1)
			else
				var_68_1()
			end
		else
			cmgr.sendRequest(var_68_0, actions.generalRecoverInfo, arg_68_0)
		end
	end

	function var_45_9.handleStopMove(arg_72_0)
		return
	end

	function var_45_9.sideGeneralSetVisible(arg_73_0)
		var_45_0:setVisible(arg_73_0)

		var_45_9.isVisible = arg_73_0
	end

	function var_45_9.handlerEscape(arg_74_0)
		local var_74_0 = arg_74_0.action.data.cd

		if var_45_9.escapeGeneralId and var_45_9.generals[var_45_9.escapeGeneralId] then
			var_45_9.generals[var_45_9.escapeGeneralId].escapeCd = var_74_0
		end

		var_45_9.getGeneralInfo()
	end

	function var_45_9.generalFreedom(arg_75_0)
		messageBox.showChargeWin(language.get(190080), language.get(190082), "slaveFreedom", function()
			cmgr.sendRequest(var_45_9.handlerGeneralFreedom, actions.slaveFreedom, arg_75_0)
		end)
	end

	function var_45_9.handlerGeneralFreedom(arg_77_0)
		if arg_77_0.action.state == 1 then
			var_45_9.getGeneralInfo()
		end
	end

	function var_45_9.handlerLeaveTeam(arg_78_0)
		if not arg_45_3 and arg_78_0.action.state == 1 then
			var_45_9.getGeneralInfo()
		end
	end

	function var_45_9.getGeneralInfo()
		log.info("侧边栏获取武将信息")
		cmgr.sendRequest(var_45_9.handleGeneralSimpleInfo, actions.generalSimpleInfo)
	end

	var_45_9.autoBattlePanelIsOpen = true
	var_45_9.openBtn = nil

	local function var_45_10()
		if var_45_9.openBtn and not tolua.isnull(var_45_9.openBtn) then
			if var_45_9.autoBattlePanelIsOpen == true then
				var_45_9.openBtn:setRotation(180)
			else
				var_45_9.openBtn:setRotation(0)
			end
		end
	end

	function var_45_9.autoBattle(arg_81_0)
		if arg_81_0 == nil then
			if var_45_9.autoBattlePanel ~= nil then
				var_45_9.autoBattlePanel:removeFromParentAndCleanup(true)

				var_45_9.autoBattlePanel = nil
			end

			return
		end

		if arg_81_0.refresh and (smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION) then
			kfcmgr.sendRequest(function(arg_82_0)
				user.autoBattleGids = arg_82_0.data.gIds
				user.autoMode = arg_82_0.data.autoMode

				log.info(user.autoBattleGids)
				var_45_9.autoBattle({
					time = arg_82_0.data.cd
				})
			end, actions.getAutoBattleDetail)

			return
		end

		if arg_81_0.autoJS and smgr.currentSceneTag == SCENE_WORLD then
			cmgr.sendRequest(function(arg_83_0)
				user.autoBattleGids = arg_83_0.action.data.gIds
				user.autoMode = arg_83_0.action.data.autoMode

				var_45_9.autoBattleCDchange(arg_83_0.action.data.cd)
			end, actions.getAutoBattleDetail)
		end

		if smgr.currentSceneTag ~= SCENE_WORLD and smgr.currentSceneTag ~= SCENE_KFYZ_WORLD then
			return
		end

		if arg_81_0.isOpen == nil then
			arg_81_0.isOpen = true
		end

		var_45_9.autoBattlePanelIsOpen = arg_81_0.isOpen

		if arg_81_0.min == true then
			var_45_0:stopAllActions()
			var_45_0:runAction(CCMoveTo:create(0.3, ccp(-100, 0)))

			var_45_9.autoBattlePanelIsOpen = false
		end

		if arg_81_0.stop == true then
			var_45_0:stopAllActions()
			var_45_0:runAction(CCMoveTo:create(0.3, ccp(0, 0)))

			if var_45_9.autoBattlePanel ~= nil then
				var_45_9.autoBattlePanel:removeFromParentAndCleanup(true)

				var_45_9.autoBattlePanel = nil
			end

			var_45_9.autoBattlePanelIsOpen = true
		elseif var_45_9.autoBattlePanel == nil then
			local var_81_0 = CCSprite:create("res/ui/world/autoBattle/zdgz_list.png")

			var_81_0:setPosition(ccp(150 + platform.getSafeDistance(), visibleSize.height / 2 - 30))
			var_45_0:addChild(var_81_0)

			local var_81_1 = CCSprite:create("res/ui/world/autoBattle/btn_zdgz_zk_a.png")
			local var_81_2 = CCSprite:create("res/ui/world/autoBattle/btn_zdgz_zk_c.png")
			local var_81_3 = CCMenuItemSprite:create(var_81_1, var_81_2)

			var_45_9.openBtn = var_81_3

			var_81_3:registerScriptTapHandler(function()
				if var_45_9.autoBattlePanelIsOpen == true then
					var_45_0:stopAllActions()
					var_45_0:runAction(CCMoveTo:create(0.3, ccp(-100, 0)))

					var_45_9.autoBattlePanelIsOpen = false

					var_45_10()
				else
					var_45_0:stopAllActions()
					var_45_0:runAction(CCMoveTo:create(0.3, ccp(0, 0)))

					var_45_9.autoBattlePanelIsOpen = true

					var_45_10()
				end
			end)

			local var_81_4 = CCSprite:create("res/ui/world/autoBattle/btn_zdgz_fd_a.png")
			local var_81_5 = CCSprite:create("res/ui/world/autoBattle/btn_zdgz_fd_c.png")
			local var_81_6 = CCMenuItemSprite:create(var_81_4, var_81_5)

			var_81_6:registerScriptTapHandler(function()
				var_45_0:stopAllActions()
				var_45_0:runAction(CCMoveTo:create(0.3, ccp(0, 0)))

				var_45_9.autoBattlePanelIsOpen = true

				local var_85_0 = require("lua/layer/world/autoBattle/AutoBattleNew")

				var_85_0.new({
					anim = true,
					state = var_85_0.STATE.IN_BATTLE
				})
				var_45_10()
			end)

			local var_81_7 = CCArray:create()

			var_81_7:addObject(var_81_3)
			var_81_7:addObject(var_81_6)

			local var_81_8 = CCMenu:createWithArray(var_81_7)

			var_81_8:alignItemsVerticallyWithPadding(140)
			var_81_8:setPosition(ccp(29, 178))
			var_81_0:addChild(var_81_8)

			arg_81_0.time = arg_81_0.time or 0

			local var_81_9 = createTimerLabel(arg_81_0.time, language.get(420006), "Thonburi", 22, nil, nil, nil, ccc3(255, 0, 0))

			var_81_9:setPosition(ccp(29, 178))
			var_81_0:addChild(var_81_9, 100, AUTO_BATTLE_CD)

			var_45_9.autoBattlePanel = var_81_0
		end

		var_45_10()
	end

	if var_45_9.autoBattlePanel ~= nil then
		var_45_9.autoBattlePanel:removeFromParentAndCleanup(true)

		var_45_9.autoBattlePanel = nil
	end

	if user.autoBattleCityId ~= nil and smgr.nextSceneTag ~= SCENE_KFYZ_WORLD and smgr.currentSceneTag ~= SCENE_KFEXPEDITION then
		cmgr.sendRequest(function(arg_86_0)
			user.autoBattleGids = arg_86_0.action.data.gIds
			user.autoMode = arg_86_0.action.data.autoMode

			log.info(user.autoBattleGids)
			var_45_9.autoBattle({
				time = arg_86_0.action.data.cd
			})
		end, actions.getAutoBattleDetail)
	end

	local function var_45_11()
		var_45_9.getGeneralInfo()
	end

	local function var_45_12(arg_88_0, arg_88_1, arg_88_2)
		if var_45_9.gongjiangs then
			for iter_88_0 = 1, #var_45_9.gongjiangs do
				if var_45_9.gongjiangs[iter_88_0].vId == arg_88_0 then
					var_45_9.gongjiangs[iter_88_0].toCityId = arg_88_2
					var_45_9.gongjiangs[iter_88_0].state = arg_88_1
				end
			end

			var_45_9.refresh()
		end
	end

	function var_45_9.updateGeneralScheduler(arg_89_0)
		if var_45_9.generals then
			local var_89_0 = false

			for iter_89_0, iter_89_1 in pairs(var_45_9.generals) do
				if iter_89_1.needTime and iter_89_1.needTime > 0 then
					iter_89_1.needTime = iter_89_1.needTime - arg_89_0 * 1000
				else
					iter_89_1.needTime = 0
				end

				if iter_89_1.forces and iter_89_1.forcesMax and iter_89_1.forces < iter_89_1.forcesMax then
					if iter_89_1.intervalForces then
						iter_89_1.forces = iter_89_1.forces + iter_89_1.intervalForces * arg_89_0 * 0.1
					end
				else
					iter_89_1.forces = iter_89_1.forcesMax
				end

				if iter_89_1.state == var_0_0.conscription then
					var_89_0 = true
				end
			end

			if var_89_0 then
				var_45_9.refresh()
			end
		end
	end

	function var_45_9.getGeneralName(arg_90_0)
		if var_45_9.generals and var_45_9.generals[arg_90_0] then
			return var_45_9.generals[arg_90_0].name
		end
	end

	function var_45_9.getControlGeneralInfo()
		if var_45_9.generals then
			return var_45_9.generals
		end
	end

	function var_45_9.updateRealTime(arg_92_0)
		for iter_92_0, iter_92_1 in pairs(var_0_1) do
			if var_0_1[iter_92_0] > 0 then
				var_0_1[iter_92_0] = var_0_1[iter_92_0] - arg_92_0 * 1000

				if var_0_1[iter_92_0] < 0 then
					var_0_1[iter_92_0] = 0
				end
			end
		end

		for iter_92_2, iter_92_3 in pairs(var_0_2) do
			if var_0_2[iter_92_2] > 0 then
				var_0_2[iter_92_2] = var_0_2[iter_92_2] - arg_92_0 * 1000

				if var_0_2[iter_92_2] < 0 then
					var_0_2[iter_92_2] = 0
				end
			end
		end
	end

	function var_45_9.autoBattleCDchange(arg_93_0)
		if var_45_9.autoBattlePanel then
			local var_93_0 = var_45_9.autoBattlePanel:getChildByTag(AUTO_BATTLE_CD)

			if var_93_0 then
				var_93_0:setTime(arg_93_0)
			end
		end
	end

	function var_45_0.onEnter(arg_94_0)
		if not arg_45_2 then
			var_45_9.initMenu()
		end

		var_45_9.gongjiangs = nil

		if var_45_9.isInkf then
			kfcmgr.registerResponseHandler(actions.kfpushGeneral, var_45_9.handlPushGeneral)
			cmgr.registerResponseHandler(actions.generalBattlePush, var_45_9.handlPushGeneral)

			if arg_45_1 then
				var_45_9.showKfGeneralInfo()
			end

			if arg_45_5 then
				eventManager.registerEvent("sideGeneralSetVisible", var_45_9.sideGeneralSetVisible)
				eventManager.registerEvent("autoBattle", var_45_9.autoBattle)
				eventManager.registerEvent("autoBattleCDchange", var_45_9.autoBattleCDchange)
			end
		else
			var_45_9.getGeneralInfo()
			cmgr.registerResponseHandler(actions.pusGeneral, var_45_9.handlPushGeneral)
			cmgr.registerResponseHandler(actions.generalBattlePush, var_45_9.handlPushGeneral)
			eventManager.registerEvent("gongjiangInfoChange", var_45_12)
			eventManager.registerEvent("generalStateChanged", var_45_11)
			eventManager.registerEvent("sideGeneralSetVisible", var_45_9.sideGeneralSetVisible)
			eventManager.registerEvent("fireGeneral", var_45_9.getGeneralInfo)
			eventManager.registerEvent("recruitGeneral", var_45_9.getGeneralInfo)
			eventManager.registerEvent("escapeOver", var_45_9.getGeneralInfo)
			eventManager.registerEvent("farmOver", var_45_9.getGeneralInfo)
			eventManager.registerEvent("autoBattle", var_45_9.autoBattle)
			eventManager.registerEvent("getGeneralName", var_45_9.getGeneralName)
			eventManager.registerEvent("autoBattleCDchange", var_45_9.autoBattleCDchange)
		end

		eventManager.registerEvent("juntuanRefresh", var_45_9.refresh)
		eventManager.registerEvent("getControlGeneralInfo", var_45_9.getControlGeneralInfo)

		var_45_9.updateGeneralSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_45_9.updateGeneralScheduler, 5, false)
		var_45_9.updateRealTimeEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_45_9.updateRealTime, 0.1, false)
	end

	function var_45_0.onExit(arg_95_0)
		if var_45_9.isInkf then
			kfcmgr.unregisterResponseHandler(actions.kfpushGeneral, var_45_9.handlPushGeneral)
			cmgr.unregisterResponseHandler(actions.generalBattlePush, var_45_9.handlPushGeneral)

			if arg_45_5 then
				eventManager.unregisterEvent("sideGeneralSetVisible", var_45_9.sideGeneralSetVisible)
				eventManager.unregisterEvent("autoBattle", var_45_9.autoBattle)
				eventManager.unregisterEvent("autoBattleCDchange", var_45_9.autoBattleCDchange)
			end
		else
			cmgr.unregisterResponseHandler(actions.pusGeneral, var_45_9.handlPushGeneral)
			cmgr.unregisterResponseHandler(actions.generalBattlePush, var_45_9.handlPushGeneral)
			eventManager.unregisterEvent("gongjiangInfoChange", var_45_12)
			eventManager.unregisterEvent("generalStateChanged", var_45_11)
			eventManager.unregisterEvent("fireGeneral", var_45_9.getGeneralInfo)
			eventManager.unregisterEvent("recruitGeneral", var_45_9.getGeneralInfo)
			eventManager.unregisterEvent("escapeOver", var_45_9.getGeneralInfo)
			eventManager.unregisterEvent("farmOver", var_45_9.getGeneralInfo)
			eventManager.unregisterEvent("autoBattle", var_45_9.autoBattle)
			eventManager.unregisterEvent("sideGeneralSetVisible", var_45_9.sideGeneralSetVisible)
			eventManager.unregisterEvent("getGeneralName", var_45_9.getGeneralName)
			eventManager.unregisterEvent("autoBattleCDchange", var_45_9.autoBattleCDchange)
		end

		eventManager.unregisterEvent("juntuanRefresh", var_45_9.refresh)
		eventManager.unregisterEvent("getControlGeneralInfo", var_45_9.getControlGeneralInfo)

		if var_45_9.updateGeneralSchedulerEntry then
			CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_45_9.updateGeneralSchedulerEntry)
		end

		if var_45_9.updateRealTimeEntry then
			CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_45_9.updateRealTimeEntry)
		end

		if var_45_9.checkSlopeCd then
			CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_45_9.checkSlopeCd)
		end
	end

	local function var_45_13(arg_96_0)
		showTable(arg_96_0)

		local var_96_0 = {}

		if arg_96_0.action.data.foodReward and arg_96_0.action.data.foodReward > 0 then
			var_96_0[#var_96_0 + 1] = {
				id = 3,
				value = arg_96_0.action.data.foodReward
			}
		end

		if arg_96_0.action.data.chiefExpReward and arg_96_0.action.data.chiefExpReward > 0 then
			var_96_0[#var_96_0 + 1] = {
				id = 6,
				value = arg_96_0.action.data.chiefExpReward
			}
		end

		globalAction_gotResource(var_96_0)

		if var_45_9.lastGeneralFarmInfo and var_45_9.lastGeneralFarmInfo.generalId == arg_96_0.action.data.generalId and (var_45_9.lastGeneralFarmInfo.state == var_0_0.farm or var_45_9.lastGeneralFarmInfo.state == var_0_0.sleep or var_45_9.lastGeneralFarmInfo.state == var_0_0.training1 or var_45_9.lastGeneralFarmInfo.state == var_0_0.training2 or var_45_9.lastGeneralFarmInfo.state == var_0_0.training3 or var_45_9.lastGeneralFarmInfo.state == var_0_0.training4 or var_45_9.lastGeneralFarmInfo.state == var_0_0.training5) then
			local var_96_1 = {
				123,
				19,
				207
			}

			cmgr.sendRequest(function(...)
				return
			end, actions.autoMove, var_96_1[user.player.forceId], arg_96_0.action.data.generalId)
		end

		var_45_9.lastGeneralFarmInfo = nil

		local var_96_2 = arg_96_0.action.data.buffCd

		if var_96_2 and var_96_2 > 0 then
			local var_96_3 = arg_96_0.action.data.generalId

			for iter_96_0, iter_96_1 in pairs(var_45_9.generalControls) do
				if iter_96_1:getGenrealId() == var_96_3 then
					local var_96_4 = iter_96_1:getPosition()

					if var_96_4 then
						local var_96_5 = smgr.getLayer("tipLayer")
						local var_96_6 = CCSprite:createWithSpriteFrameName("lb_buff_sqgz_big.png")
						local var_96_7 = CCSprite:create("res/ui/common/text/resource/lb_tit_sqgzssfz.png")
						local var_96_8 = CCLabelAtlas:create(tostring(var_96_2 / 60000), "res/ui/common/text/resource/res_title_num.png", 30, 45, 48)

						var_96_8:setAnchorPoint(ccp(0.5, 0.5))

						local var_96_9 = CCSprite:create("res/ui/common/text/resource/lb_tit_sqgzssfz1.png")
						local var_96_10 = createRichNode({
							var_96_6,
							var_96_7,
							var_96_8,
							var_96_9
						}, 0.5)

						var_96_10:setVisible(false)
						var_96_10:setPosition(ccp(visibleSize.width / 2, visibleSize.height * 0.4))
						var_96_5:addChild(var_96_10)

						local function var_96_11()
							var_96_10:setVisible(true)
						end

						local function var_96_12()
							var_96_5:removeChild(var_96_10, true)
						end

						local var_96_13 = CCArray:create()

						var_96_13:addObject(CCDelayTime:create(0.6))
						var_96_13:addObject(CCCallFuncN:create(var_96_11))
						var_96_13:addObject(CCMoveTo:create(0.3, ccp(visibleSize.width / 2, visibleSize.height * 0.6)))
						var_96_13:addObject(CCDelayTime:create(0.1))
						var_96_13:addObject(CCSpawn:createWithTwoActions(CCMoveTo:create(0.8, var_96_4), CCScaleTo:create(0.8, 0.1)))
						var_96_13:addObject(CCCallFuncN:create(var_96_12))

						local var_96_14 = CCSequence:create(var_96_13)

						var_96_10:runAction(var_96_14)
					end

					if var_96_4 and arg_96_0.action.data.farmType then
						local var_96_15 = smgr.getLayer("tipLayer")
						local var_96_16 = arg_96_0.action.data.farmType
						local var_96_17 = CCSprite:createWithSpriteFrameName("lb_buff_sqgz_big.png")

						if var_96_16 == 62 then
							var_96_17 = CCSprite:create("res/ui/farm/ttq_word_get_02.png")
						elseif var_96_16 == 63 then
							var_96_17 = CCSprite:create("res/ui/farm/ttq_word_get_01.png")
						elseif var_96_16 == 64 then
							var_96_17 = CCSprite:create("res/ui/farm/ttq_word_get_03.png")
						elseif var_96_16 == 65 then
							var_96_17 = CCSprite:create("res/ui/farm/mzdhy1.png")
						elseif var_96_16 == 66 then
							var_96_17 = CCSprite:create("res/ui/farm/mzdhy.png")
						end

						var_96_17:setVisible(false)
						var_96_17:setPosition(ccp(visibleSize.width / 2, visibleSize.height * 0.4))
						var_96_15:addChild(var_96_17)

						local function var_96_18()
							var_96_17:setVisible(true)
						end

						local function var_96_19()
							var_96_15:removeChild(var_96_17, true)
						end

						local var_96_20 = CCArray:create()

						var_96_20:addObject(CCDelayTime:create(1.2))
						var_96_20:addObject(CCCallFuncN:create(var_96_18))
						var_96_20:addObject(CCMoveTo:create(0.3, ccp(visibleSize.width / 2, visibleSize.height * 0.6)))
						var_96_20:addObject(CCDelayTime:create(0.1))
						var_96_20:addObject(CCSpawn:createWithTwoActions(CCMoveTo:create(0.8, var_96_4), CCScaleTo:create(0.8, 0.1)))
						var_96_20:addObject(CCCallFuncN:create(var_96_19))

						local var_96_21 = CCSequence:create(var_96_20)

						var_96_17:runAction(var_96_21)
					end

					break
				end
			end
		end
	end

	function var_45_9.doGeneralAction(arg_102_0, arg_102_1)
		log.info("generalstate: ", arg_102_1)

		if arg_102_1 == var_0_0.idle and arg_45_1 then
			if arg_45_3 then
				kfcmgr.sendRequest(var_45_9.handleAssemble, actions.callGeneral, arg_102_0, var_45_9.kfCityId)
			else
				cmgr.sendRequest(var_45_9.handleAssemble, actions.assembleBattle, arg_102_0, arg_45_1)
			end

			amgr.playEffect(enumAudioFile.wujiang_zunming)
		elseif arg_102_1 == var_0_0.idle then
			amgr.playEffect(enumAudioFile.wujiang_shi)
		elseif arg_102_1 == var_0_0.farm then
			var_45_9.lastGeneralFarmInfo = {
				generalId = arg_102_0,
				state = arg_102_1
			}

			cmgr.sendRequest(var_45_13, actions.farmGetReward, arg_102_0, 0)
		elseif arg_102_1 == var_0_0.sleep then
			local function var_102_0(arg_103_0)
				return
			end

			local var_102_1 = {
				123,
				19,
				207
			}

			log.info("user.player.forceId general.id ", user.player.forceId, arg_102_0)
			cmgr.sendRequest(var_102_0, actions.autoMove, var_102_1[user.player.forceId], arg_102_0)
		elseif arg_102_1 == var_0_0.training1 or arg_102_1 == var_0_0.training2 or arg_102_1 == var_0_0.training3 or arg_102_1 == var_0_0.training4 or arg_102_1 == var_0_0.training5 then
			if var_45_9.generals[arg_102_0].farmIsEnd == 0 then
				local function var_102_2(arg_104_0)
					var_45_13(arg_104_0)

					local var_104_0 = {
						123,
						19,
						207
					}

					cmgr.sendRequest(function(...)
						return
					end, actions.autoMove, var_104_0[user.player.forceId], arg_104_0.action.data.generalId)
				end

				local var_102_3 = var_45_9.lastGeneralControl.farmTimer:getTime()
				local var_102_4 = math.ceil(var_45_9.generals[arg_102_0].cdRecoverGold * math.ceil(var_102_3 / 60000))
				local var_102_5 = language.get("191003_lxr", var_102_4)

				messageBox.showChargeWin("", var_102_5, "farmQuickFinish", function()
					cmgr.sendRequest(var_102_2, actions.farmFastFarm, arg_102_0)
				end)
			else
				var_45_9.lastGeneralFarmInfo = {
					generalId = arg_102_0,
					state = arg_102_1
				}

				cmgr.sendRequest(var_45_13, actions.farmGetReward, arg_102_0, 0)
			end
		elseif arg_102_1 == var_0_0.weicheng then
			log.info("禁闭中什么也不做")
		elseif arg_102_1 == var_0_0.conscription then
			var_45_9.generalRecoverInfo(arg_102_0)
		elseif arg_102_1 == var_0_0.move then
			if var_45_9.isInkf then
				kfcmgr.sendRequest(var_45_9.handleStopMove, actions.kfworldMove, arg_102_0, 0)
			else
				cmgr.sendRequest(var_45_9.handleStopMove, actions.stopMoveInWorld, arg_102_0)
			end

			traceData.stopTrace(arg_102_0)
			amgr.playEffect(enumAudioFile.wujiang_zunming)
		elseif arg_102_1 == var_0_0.prison then
			log.info(" generalState.prison")

			var_45_9.escapeGeneralId = arg_102_0

			cmgr.sendRequest(var_45_9.handlerEscape, actions.slaveEscape, arg_102_0)
			amgr.playEffect(enumAudioFile.wujiang_shi)
		elseif arg_102_1 == var_0_0.escape then
			var_45_9.generalFreedom(arg_102_0)
		elseif arg_102_1 == var_0_0.armyGroup then
			cmgr.sendRequest(var_45_9.handlerLeaveTeam, actions.exitTeam, "", arg_102_0)
			amgr.playEffect(enumAudioFile.wujiang_zunming)
		elseif arg_102_1 == var_0_0.kfgzArmyGroup then
			kfcmgr.sendRequest(var_45_9.handlerLeaveTeam, actions.kfgzGroupTeamQuit, arg_102_0)
		elseif (arg_102_1 == var_0_0.countryWar or arg_102_1 == var_0_0.storyWar) and smgr.currentSceneTag == SCENE_BATTLE and arg_45_1 == var_45_9.generals[arg_102_0].battleId then
			local function var_102_6(arg_107_0)
				local var_107_0 = false

				if arg_107_0.action.data.gIds and #arg_107_0.action.data.gIds > 0 then
					for iter_107_0, iter_107_1 in pairs(arg_107_0.action.data.gIds) do
						if iter_107_1.gId == arg_102_0 then
							var_107_0 = true

							break
						end
					end
				end

				local var_107_1 = string.split(arg_45_1, "_")[3]

				if var_107_0 then
					local var_107_2 = {}

					var_107_2.option = "retreat"
					var_107_2.cityId = var_107_1
					var_107_2.data = arg_107_0.action.data
					var_107_2.battleId = arg_45_1

					log.info("handlerRetreatInfo response：")

					if user.inJuBen then
						smgr.changeScene(SCENE_JUBEN, user.soId, 0, 0, var_107_2)
					else
						smgr.changeScene(SCENE_WORLD, var_107_1, nil, var_107_2)
					end
				else
					log.info("can't retreat")
					smgr.showTipText(language.get("190102_lxr"))
					amgr.playEffect(enumAudioFile.ui_click_error, false, true)
				end
			end

			cmgr.sendRequest(var_102_6, actions.getChetuiInfoWithGid, arg_45_1, arg_102_0)
		else
			local var_102_7

			if arg_102_1 == 2 then
				var_102_7 = 1
			elseif arg_102_1 == 3 then
				var_102_7 = 3
			elseif arg_102_1 == 4 then
				var_102_7 = 4
			elseif arg_102_1 == 7 then
				var_102_7 = 6
			elseif arg_102_1 == 8 then
				var_102_7 = 8
			elseif arg_102_1 == 10 then
				var_102_7 = 10
			elseif arg_102_1 == 13 then
				var_102_7 = 13
			elseif arg_102_1 == 14 then
				var_102_7 = 14
			elseif arg_102_1 == 15 then
				var_102_7 = 15
			elseif arg_102_1 == 17 then
				var_102_7 = 16
			elseif arg_102_1 == 18 then
				var_102_7 = 17
			elseif arg_102_1 == 19 then
				var_102_7 = 18
			elseif arg_102_1 == 20 then
				var_102_7 = 19
			elseif arg_102_1 == 21 then
				var_102_7 = 20
			elseif arg_102_1 == 1003 then
				var_102_7 = 1025
			elseif arg_102_1 == 1013 then
				var_102_7 = 1026
			elseif arg_102_1 == 1014 then
				var_102_7 = 1028
			elseif arg_102_1 == 32 then
				var_102_7 = 29
			end

			if var_102_7 == battleType.BATTLE_KFGZ or var_102_7 == battleType.BATTLE_KFGZ_SOLO or var_102_7 == battleType.BATTLE_KFYZ_DONGYING_SOLO and var_45_9.generals[arg_102_0] then
				bmgr.enterKfgz(var_45_9.generals[arg_102_0].kfTeamId)
			else
				bmgr.tryEnterBattle(var_102_7, {
					reserve = 0,
					generalId = arg_102_0,
					hasInBattleId = arg_45_1
				})
			end
		end
	end

	function var_45_9.doJuntuanAction(arg_108_0)
		local var_108_0
		local var_108_1
		local var_108_2

		if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
			var_108_0 = user.kfCorpsState or 0
			var_108_1 = user.kfCorpsInfo[user.player.kfgzForceId]
			var_108_2 = user.kfCorpsAction[user.player.kfgzForceId]
		else
			var_108_0 = user.corpsState or 0
			var_108_1 = user.corpsInfo[user.player.forceId]
			var_108_2 = user.corpsAction[user.player.forceId]
		end

		log.info("军团信息：" .. arg_108_0 .. " " .. var_108_0)

		if var_108_0 == 0 then
			if var_108_1 then
				local var_108_3 = generalMoveLayer.juntuanTable["id_" .. var_108_1.corpsId]

				if var_108_3 and var_108_3.locationId then
					if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
						eventManager.dispatchEvent("moveToCity", var_108_3.locationId, nil, nil, nil, true)
					elseif worldThumbnailControl and not worldThumbnailControl.visible then
						eventManager.dispatchEvent("moveToCity", var_108_3.locationId)
					end
				end
			end
		elseif var_108_0 == 1 then
			local function var_108_4(arg_109_0)
				return
			end

			if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
				-- block empty
			else
				cmgr.sendRequest(var_108_4, actions.corpsStop, arg_108_0)
			end

			traceData.stopTrace(arg_108_0)
		elseif var_108_0 == 2 and var_108_1 then
			if var_108_2 then
				local var_108_5 = string.split(var_108_1.battleId, "_")
				local var_108_6 = ""

				for iter_108_0 = 1, #var_108_5 do
					if iter_108_0 == #var_108_5 then
						var_108_6 = var_108_6 .. var_108_2.curCityId
					else
						var_108_6 = var_108_6 .. var_108_5[iter_108_0] .. "_"
					end
				end

				log.info("军团battleId：" .. var_108_6)

				var_108_1.battleId = var_108_6
				var_108_1.locationId = var_108_2.curCityId
			end

			if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
				smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_KFGZ, {
					teamId = var_108_1.locationId
				})
			else
				smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_CITY_NPC, {
					battleId = var_108_1.battleId,
					cityId = var_108_1.locationId
				})
			end
		end
	end

	function var_45_9.doJuntuanDismissAction(arg_110_0)
		local function var_110_0(arg_111_0)
			return
		end

		messageBox.confirm(language.get("223602_juntuan"), function()
			if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
				kfcmgr.sendRequest(var_110_0, actions.dismissCorps, arg_110_0)
			else
				cmgr.sendRequest(var_110_0, actions.dismissCorps, arg_110_0)
			end
		end)
	end

	function var_45_9.doGongjiangAction(arg_113_0, arg_113_1)
		return
	end

	local function var_45_14()
		if var_45_7 == false then
			local function var_114_0()
				var_45_7 = false
				var_45_8 = 3 - var_45_8
			end

			local var_114_1 = 0
			local var_114_2 = var_45_8 == 1 and -80 or -440

			var_45_7 = true

			local var_114_3 = CCArray:create()

			var_114_3:addObject(CCMoveTo:create(0.3, ccp(0, var_114_2)))
			var_114_3:addObject(CCCallFuncN:create(var_114_0))

			local var_114_4 = CCSequence:create(var_114_3)

			var_45_1:runAction(var_114_4)
		end
	end

	local function var_45_15(arg_116_0, arg_116_1, arg_116_2)
		if not var_45_9.isVisible then
			return false
		end

		if arg_116_0 == CCTOUCHBEGAN then
			var_45_9.touchBeginGeneral = nil
			var_45_9.touchBeginPosiiton = {
				x = arg_116_1,
				y = arg_116_2
			}

			for iter_116_0, iter_116_1 in pairs(var_45_9.generalControls) do
				if iter_116_1:simpleClick(arg_116_1, arg_116_2) then
					var_45_9.touchBeginGeneral = iter_116_1

					return true
				end
			end

			if tool.checkIfTouch(var_45_5, arg_116_1, arg_116_2) then
				return true
			end
		elseif arg_116_0 == CCTOUCHMOVED then
			if var_45_8 == 1 and var_45_9.touchBeginPosiiton.y and arg_116_2 - var_45_9.touchBeginPosiiton.y > 50 and var_45_9.needPage == true then
				var_45_14()

				var_45_9.touchBeginGeneral = nil
			elseif var_45_8 == 2 and var_45_9.touchBeginPosiiton.y and arg_116_2 - var_45_9.touchBeginPosiiton.y < -50 then
				var_45_14()

				var_45_9.touchBeginGeneral = nil
			end
		elseif arg_116_0 == CCTOUCHENDED then
			if var_45_9.touchBeginGeneral and var_45_9.touchBeginGeneral.isJuntuanDismiss then
				log.info("军团解散")
				var_45_9.doJuntuanDismissAction(var_45_9.touchBeginGeneral:getGenrealId())

				return true
			end

			if var_45_9.touchBeginGeneral and var_45_9.touchBeginGeneral ~= var_45_9.lastGeneralControl then
				if var_45_9.lastGeneralControl then
					var_45_9.lastGeneralControl:check()
				end

				var_45_9.lastGeneralControl = var_45_9.touchBeginGeneral
				var_45_9.lastSelectGeneralPos = var_45_9.lastGeneralControl:getPosition()

				if var_45_9.lastGeneralControl then
					var_45_9.lastGeneralControl:check()
				end

				local var_116_0 = var_45_9.lastGeneralControl:getState()
				local var_116_1 = var_45_9.lastGeneralControl:getGenrealId()

				if var_45_9.lastGeneralControl.isGongjiang then
					log.info("是工匠")

					return true
				elseif var_45_9.lastGeneralControl.isJuntuan then
					log.info("军团")
					var_45_9.doJuntuanAction(var_116_1)

					return true
				end

				var_45_9.doGeneralAction(var_116_1, var_116_0)

				return true
			end
		end

		return false
	end

	var_45_0:setTouchEnabled(true)
	var_45_0:registerScriptTouchHandler(var_45_15, false, true)
	arg_45_0:addChild(var_45_0)

	return var_45_9
end
