require("lua/layer/technology/technologyList/constant")
tool.requireRes("technology/dragonTech")
require("lua/component/timerLabel")

dragonTechUI = {}

local var_0_0 = dragonTechUI

dragonTechUI.uiTable = {}

local var_0_1 = dragonTechControl
local var_0_2 = dragonTechConstant
local var_0_3 = 0
local var_0_4 = {
	[77] = 203,
	[100] = 304,
	[113] = 401,
	[891] = 205,
	[72] = 202,
	[118] = 403,
	[125] = 407,
	[94] = 302
}

function dragonTechUI.show()
	local var_1_0 = createBaseLayer()

	rmgr.loadTable(var_0_2.RES)
	smgr.registerLayer(var_1_0, "dragonTechLayer")
	var_1_0:registerScriptTouchHandler(var_0_1.onTouch)
	var_1_0:setTouchEnabled(true)

	var_1_0.onEnter = var_0_1.onEnter
	var_1_0.onExit = var_0_1.onExit

	if var_0_0.uiTable then
		var_0_0.uiTable = nil
	end

	if var_0_0.dragonTechViewBackground then
		pcall(var_0_0.dragonTechViewBackground.removeFromParentAndCleanup, var_0_0.dragonTechViewBackground, true)

		var_0_0.dragonTechViewBackground = nil
	end

	var_0_0.uiTable = autoUI.initUI(var_1_0, getDragonTechUiData())
	var_0_0.dragonTechViewBackground = var_0_0.uiTable.dragonTechViewBackground

	var_0_0.uiTable.btn_right:setScaleX(-1)
	var_0_0.uiTable.techInfo:setDimensions(CCSizeMake(610, 100))
	var_0_0.uiTable.techInfo:setHorizontalAlignment(kCCTextAlignmentLeft)
	var_0_0.uiTable.techInfo:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	var_0_1.getDragonTechInfo(1)

	return var_1_0
end

local function var_0_5(arg_2_0)
	local var_2_0 = arg_2_0.status
	local var_2_1
	local var_2_2 = false

	if arg_2_0.type == 1 then
		if var_2_0 ~= technologyListConstant.TECH_STATUS_UNOPENED and var_2_0 ~= technologyListConstant.TECH_STATUS_EFFECTED then
			var_2_1 = string.format("tech_icon_%s.jpg", arg_2_0.pic)
			var_2_2 = true
		elseif var_2_0 == technologyListConstant.TECH_STATUS_EFFECTED then
			var_2_1 = string.format("tech_icon_%s.jpg", arg_2_0.pic)
		else
			var_2_1 = var_2_0 == technologyListConstant.TECH_STATUS_UNOPENED and "tech_icon_next.jpg" or "tech_icon_wenhao.jpg"
		end

		if not CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_2_1) then
			var_2_1 = "tech_icon_wenhao.jpg"
			var_2_2 = true
		end
	elseif arg_2_0.type == 2 then
		var_2_1 = var_2_0 == 2 and "tech_icon_next.jpg" or string.format("tech_icon_%s.jpg", arg_2_0.pic)
	end

	return var_2_1, var_2_2
end

local function var_0_6(arg_3_0)
	if arg_3_0.type == 1 then
		local var_3_0 = dragonTechConstant.openConditionPic[arg_3_0.openConditionPic] or "lm_tit_" .. arg_3_0.openConditionPic .. ".png"

		return "res/ui/common/text/technology/armyName/" .. var_3_0
	end
end

local function var_0_7(arg_4_0)
	local var_4_0 = {}

	if conf.language == "vie" then
		var_4_0.resConsumeX = 40
	else
		var_4_0.resConsumeX = 0
	end

	local var_4_1 = 400
	local var_4_2 = 29
	local var_4_3 = 6
	local var_4_4 = 325
	local var_4_5 = {
		anchorPointX = 0,
		name = "jdt",
		type = "pic_9",
		pic = "res/ui/technology/jdt/lm_jdt_bg.png",
		x = 260,
		middleRect = CCRectMake(10, 0, 1, var_4_2),
		preferedSize = CCSizeMake(var_4_1, var_4_2),
		y = var_4_4,
		children = {
			{
				fontSize = 20,
				name = "techInfo1",
				type = "label",
				anchorPointX = 0,
				text = "",
				font = "Thonburi",
				y = -25,
				x = 0,
				color = ccc3(233, 208, 170)
			},
			{
				fontSize = 20,
				name = "resourcesLabel",
				type = "label",
				anchorPointX = 0,
				text = "",
				font = "Thonburi",
				y = -25,
				x = 110 + var_4_0.resConsumeX,
				align = kCCTextAlignmentLeft
			}
		}
	}

	if arg_4_0.status == technologyListConstant.TECH_STATUS_RESEARCHING then
		var_0_3 = var_4_1 - 2 * var_4_3

		table.insert(var_4_5.children, {
			anchorPointX = 0,
			name = "jdt_bar1",
			type = "pic",
			pic = "res/ui/technology/jdt/lm_jdt1.png",
			x = var_4_3,
			y = var_4_2 / 2
		})
	else
		var_0_3 = (var_4_1 - 2 * var_4_3) / arg_4_0.total

		for iter_4_0 = 1, arg_4_0.total do
			table.insert(var_4_5.children, {
				anchorPointX = 0,
				type = "pic",
				name = "jdt_bar" .. iter_4_0,
				pic = "res/ui/technology/jdt/lm_jdt" .. tostring(iter_4_0) .. ".png",
				x = var_4_3 + var_0_3 * (iter_4_0 - 1),
				y = var_4_2 / 2
			})
		end

		for iter_4_1 = 1, arg_4_0.total - 1 do
			table.insert(var_4_5.children, {
				pic = "res/ui/technology/jdt/lm_jdt_fg.png",
				type = "pic",
				x = var_4_3 + var_0_3 * iter_4_1,
				y = var_4_2 / 2
			})
		end
	end

	return var_4_5
end

local function var_0_8(arg_5_0)
	local var_5_0 = arg_5_0 / 1000
	local var_5_1 = math.floor(var_5_0 / 3600)
	local var_5_2 = var_5_0 % 3600
	local var_5_3 = math.floor(var_5_2 / 60)
	local var_5_4 = var_5_2 % 60

	return string.format("%02d:%02d:%02d", var_5_1, var_5_3, var_5_4)
end

function var_0_0.updateProgressBar(arg_6_0)
	local var_6_0 = var_0_1.touchedTechIdx
	local var_6_1 = var_0_1.techData[var_6_0]
	local var_6_2 = var_0_0.uiTable.progress
	local var_6_3 = var_0_0.uiTable.timer
	local var_6_4 = var_6_3:getTriggerTime() - arg_6_0

	log.info("triggerTime: " .. var_6_4 .. " triggerDuration:" .. arg_6_0, "timer time :", var_6_3:getTime(), "total cd :", var_6_1.cdTotal)
	var_6_3:setTriggerTime(var_6_4)

	local var_6_5 = var_6_1.cdTotal - var_6_3:getTime() > 0 and (var_6_1.cdTotal - var_6_3:getTime()) / var_6_1.cdTotal * var_0_3 or 0

	var_6_2:setScaleX(var_6_5)

	if var_6_3:getTriggerTime() <= 0 or var_6_3:getTime() <= 0 then
		var_6_1.status = technologyListConstant.TECH_STATUS_EFFECTED

		var_0_0.showDragonTechByIdx(var_6_0)
		var_0_0.updateDragonTechCell(var_0_1.techData[var_6_0], var_6_0)
		var_0_0.showOpenTechEffect()
	end
end

function var_0_0.showDragonTechByIdx(arg_7_0, arg_7_1)
	local var_7_0 = var_0_1.techData[arg_7_0]

	var_0_0.uiTable.techInfo:setString(var_7_0.effect)
	log.info("zhu@@@", var_0_1.touchedTechIdx)
	var_0_0.uiTable["light" .. var_0_1.touchedTechIdx]:setVisible(false)
	var_0_0.uiTable["light" .. arg_7_0]:setVisible(true)

	var_0_1.touchedTechIdx = arg_7_0

	if var_0_0.uiTable.techState then
		pcall(var_0_0.uiTable.techState.removeFromParentAndCleanup, var_0_0.uiTable.techState, true)

		var_0_0.uiTable.techState = nil
	end

	if var_0_0.uiTable.jdt then
		pcall(var_0_0.uiTable.jdt.removeFromParentAndCleanup, var_0_0.uiTable.jdt, true)

		var_0_0.uiTable.jdt = nil
	end

	local function var_7_1(arg_8_0)
		if var_0_0.uiTable.techState then
			local var_8_0 = {}

			if arg_8_0 == 2 then
				if conf.language == "vie" then
					var_8_0.posX = 80
				else
					var_8_0.posX = 0
				end
			else
				var_8_0.posX = 0
			end

			var_0_0.uiTable.techState:setAnchorPoint(ccp(0, 0.5))
			var_0_0.uiTable.techState:setPosition(ccp(260 + var_8_0.posX, 400))
			var_0_0.uiTable.oneTechPanel:addChild(var_0_0.uiTable.techState, 200)
		end
	end

	var_0_0.uiTable.btn_open:setVisible(false)

	local var_7_2, var_7_3 = var_0_5(var_7_0)

	var_0_0.uiTable.techPic:removeAllChildrenWithCleanup(true)
	var_0_0.uiTable.techPic:setDisplayFrame(tool.spriteFrameByName(var_7_2))

	if var_7_3 then
		tool.spriteToGray(var_0_0.uiTable.techPic)
	end

	local var_7_4 = var_0_0.uiTable.techPic:getContentSize()

	var_0_0.uiTable.techPic:setScale(72 / var_7_4.width)

	if var_7_0.type == 1 then
		if var_7_0.status == technologyListConstant.TECH_STATUS_EFFECTED or var_7_0.status == technologyListConstant.TECH_STATUS_UNOPENED then
			var_0_0.uiTable.techInfo:setPosition(ccp(260, 325))
		else
			var_0_0.uiTable.techInfo:setPosition(ccp(260, 360))
		end

		if var_7_0.status == technologyListConstant.TECH_STATUS_UNOPENED then
			var_0_0.uiTable.techState = CCSprite:create("res/ui/common/text/technology/lm_tit_jb.png")

			local var_7_5 = var_0_0.uiTable.techState:getContentSize()
			local var_7_6 = CCSprite:create(var_0_6(var_7_0))

			var_0_0.uiTable.techState:addChild(var_7_6)
			var_7_6:setAnchorPoint(ccp(0, 0.5))
			var_7_6:setPosition(ccp(var_7_5.width, var_7_5.height / 2))

			local var_7_7 = var_7_6:getContentSize()
			local var_7_8 = CCSprite:create("res/ui/common/text/technology/lm_tit_hkq.png")

			var_7_6:addChild(var_7_8)
			var_7_8:setAnchorPoint(ccp(0, 0.5))
			var_7_8:setPosition(ccp(var_7_7.width, var_7_7.height / 2))
		elseif var_7_0.status == technologyListConstant.TECH_STATUS_READY then
			var_0_0.uiTable.techState = CCSprite:createWithSpriteFrameName("lm_tit_dqkkq.png")

			var_0_0.uiTable.btn_text:setString(language.get(50004))
			var_0_0.uiTable.btn_open:setVisible(true)
			var_0_0.uiTable.btn_open:registerScriptTapHandler(function()
				var_0_0.onResearchTechByIdx()
			end)

			local var_7_9 = {}

			autoUI.createUI(var_0_0.uiTable.oneTechPanel, var_0_7(var_7_0), var_7_9)

			var_0_0.uiTable.jdt = var_7_9.jdt

			for iter_7_0 = 1, var_7_0.num do
				var_7_9["jdt_bar" .. iter_7_0]:setScaleX(var_0_3)
			end

			var_7_9.techInfo1:setString(language.get(50009))
			var_7_9.resourcesLabel:setString(var_0_8(var_7_0.cdTotal))
		elseif var_7_0.status == technologyListConstant.TECH_STATUS_OPENED or var_7_0.status == technologyListConstant.TECH_STATUS_INVESTED then
			var_0_0.uiTable.techState = CCSprite:createWithSpriteFrameName("lm_tit_dqkkq.png")

			var_0_0.uiTable.btn_text:setString(language.get(50003))
			var_0_0.uiTable.btn_open:setVisible(true)
			var_0_0.uiTable.btn_open:registerScriptTapHandler(function()
				var_0_0.onInvestTechByIdx()
			end)

			local var_7_10 = {}

			autoUI.createUI(var_0_0.uiTable.oneTechPanel, var_0_7(var_7_0), var_7_10)

			var_0_0.uiTable.jdt = var_7_10.jdt

			for iter_7_1 = 1, var_7_0.total do
				if iter_7_1 <= var_7_0.num then
					var_7_10["jdt_bar" .. iter_7_1]:setScaleX(var_0_3)
				else
					var_7_10["jdt_bar" .. iter_7_1]:setScaleX(0)
				end

				var_0_0.uiTable["jdt_bar" .. iter_7_1] = var_7_10["jdt_bar" .. iter_7_1]
			end

			var_7_10.techInfo1:setString(language.get(50008))

			local var_7_11 = ""
			local var_7_12 = var_7_0.resources

			if var_7_12 then
				for iter_7_2 = 1, #var_7_12 do
					if var_7_12[iter_7_2].type == 1 then
						var_7_11 = var_7_11 .. " " .. language.get(10101) .. var_7_12[iter_7_2].value
					elseif var_7_12[iter_7_2].type == 2 then
						var_7_11 = var_7_11 .. "   " .. language.get(10102) .. var_7_12[iter_7_2].value
					elseif var_7_12[iter_7_2].type == 3 then
						var_7_11 = var_7_11 .. "   " .. language.get(10103) .. var_7_12[iter_7_2].value
					elseif var_7_12[iter_7_2].type == 4 then
						var_7_11 = var_7_11 .. "   " .. language.get(10104) .. var_7_12[iter_7_2].value
					end
				end
			end

			var_7_10.resourcesLabel:setString(var_7_11)
		elseif var_7_0.status == technologyListConstant.TECH_STATUS_RESEARCHING then
			local var_7_13 = {}

			if conf.language == "vie" then
				var_7_13.leftTimeX = 50
			else
				var_7_13.leftTimeX = 0
			end

			var_0_0.uiTable.techState = CCSprite:createWithSpriteFrameName("lm_tit_dqkkq.png")

			var_0_0.uiTable.btn_text:setString(language.get(50005))
			var_0_0.uiTable.btn_open:setVisible(true)
			var_0_0.uiTable.btn_open:registerScriptTapHandler(function()
				var_0_0.onCdRecoverTechByIdx()
			end)

			local var_7_14 = {}

			autoUI.createUI(var_0_0.uiTable.oneTechPanel, var_0_7(var_7_0), var_7_14)

			var_0_0.uiTable.jdt = var_7_14.jdt
			var_0_0.uiTable.progress = var_7_14.jdt_bar1

			local var_7_15 = var_7_0.cdTotal - var_7_0.cd > 0 and (var_7_0.cdTotal - var_7_0.cd) / var_7_0.cdTotal * var_0_3 or 0

			var_7_14.jdt_bar1:setScaleX(var_7_15)
			var_7_14.techInfo1:setString(language.get(50010))
			var_7_14.resourcesLabel:setString("")

			local var_7_16 = var_7_0.cdTotal / 100
			local var_7_17
			local var_7_18

			if var_7_16 < 1000 then
				local var_7_19 = 1000
			end

			local var_7_20 = 1000
			local var_7_21 = math.floor(var_7_0.cd / var_7_20) * var_7_20

			log.info("call back time : " .. var_7_21 .. " current cd: " .. var_7_0.cd)

			local var_7_22 = createTimerLabel(var_7_0.cd, "@H:@M:@S", "Thonburi-Bold", 20, var_0_0.updateProgressBar, var_7_20, var_7_21, colorQuality[5])

			var_7_14.resourcesLabel:addChild(var_7_22)
			var_7_22:setPosition(ccp(60 + var_7_13.leftTimeX, 0))

			var_0_0.uiTable.timer = var_7_22
		elseif var_7_0.status == technologyListConstant.TECH_STATUS_EFFECTED then
			var_0_0.uiTable.btn_open:setVisible(false)

			var_0_0.uiTable.techState = CCSprite:createWithSpriteFrameName("lm_tit_dqykq.png")
		end
	elseif var_7_0.type == 2 then
		var_0_0.uiTable.techInfo:setPosition(ccp(260, 325))

		if var_7_0.status == 0 then
			var_0_0.uiTable.btn_text:setString(language.get(50004))
			var_0_0.uiTable.btn_open:setVisible(true)
			var_0_0.uiTable.btn_open:registerScriptTapHandler(function()
				var_0_0.onOpenDragonTechByIdx()
			end)

			var_0_0.uiTable.techState = CCSprite:createWithSpriteFrameName("lm_tit_dqkkq.png")
		elseif var_7_0.status == 1 then
			var_0_0.uiTable.btn_open:setVisible(false)

			var_0_0.uiTable.techState = CCSprite:createWithSpriteFrameName("lm_tit_dqykq.png")
		elseif var_7_0.status == 2 then
			var_0_0.uiTable.btn_open:setVisible(false)

			var_0_0.uiTable.techState = CCLabelAtlas:create(var_7_0.openConditionPic, "res/ui/common/number/lm_tit_num.png", 22, 32, 48)

			local var_7_23 = var_0_0.uiTable.techState:getContentSize()
			local var_7_24 = CCSprite:createWithSpriteFrameName("lm_tit_jkq.png")

			var_0_0.uiTable.techState:addChild(var_7_24)

			if conf.language == "vie" then
				var_7_24:setAnchorPoint(ccp(0.5, 0.5))
				var_7_24:setPosition(ccp(var_7_23.width / 2, var_7_23.height / 2))
			else
				var_7_24:setAnchorPoint(ccp(0, 0.5))
				var_7_24:setPosition(ccp(var_7_23.width, var_7_23.height / 2))
			end
		end
	end

	var_0_0.uiTable.btn_text:setVisible(var_0_0.uiTable.btn_open:isVisible())
	var_7_1(var_7_0.status)

	if arg_7_1 then
		local var_7_25, var_7_26 = tool.getPositionInScreen(var_0_0.uiTable.btn_open)

		guide.control.loadGuide2(7, var_7_25, var_7_26 + 100, true, user.curMainTask.introLong)
	end
end

function var_0_0.onOpenDragonTechByIdx()
	local var_13_0 = var_0_1.techData[var_0_1.touchedTechIdx]

	log.info("openDragonTech", var_0_1.touchedTechIdx, var_13_0.techId)
	var_0_1.openDragonTech(var_13_0.techId)
end

function var_0_0.onInvestTechByIdx()
	log.info("注资")

	local var_14_0 = var_0_1.techData[var_0_1.touchedTechIdx]

	log.info("openDragonTech", var_0_1.touchedTechIdx, var_14_0.techId)
	var_0_1.onInvest(var_14_0.techId)
end

function var_0_0.onResearchTechByIdx()
	log.info("研究")

	local var_15_0 = var_0_1.techData[var_0_1.touchedTechIdx]

	log.info("openDragonTech", var_0_1.touchedTechIdx, var_15_0.techId)
	var_0_1.onResearch(var_15_0.techId)
end

function var_0_0.onCdRecoverTechByIdx()
	log.info("加速")

	local var_16_0 = var_0_1.techData[var_0_1.touchedTechIdx]

	log.info("openDragonTech", var_0_1.touchedTechIdx, var_16_0.techId)
	var_0_1.onCdRecover(var_16_0.techId)
end

function var_0_0.createDragonTechList(arg_17_0)
	local var_17_0 = autoUI.renderList(var_0_0.uiTable, getDragonTechUiData().dragonTechList, arg_17_0)

	var_17_0:setAnchorPoint(ccp(0, 0))
	var_17_0:setPosition(ccp(0, 0))

	local var_17_1 = CCScrollView:create(CCSizeMake(var_0_0.dragonTechViewBackground:getContentSize().width - 60, 210))

	var_17_1:setContainer(var_17_0)
	var_17_1:setPosition(ccp(30, 20))
	var_17_1:setContentSize(var_17_0:getContentSize())
	var_17_1:setDirection(kCCScrollViewDirectionHorizontal)
	var_0_0.dragonTechViewBackground:addChild(var_17_1)

	var_0_0.scrollView = var_17_1

	for iter_17_0 = 1, #var_0_1.techData do
		local var_17_2 = var_0_1.techData[iter_17_0]

		var_0_0.showLightIfTechCanOpen(var_17_2, iter_17_0)
	end
end

function var_0_0.showTechInfoPanel()
	local var_18_0 = {}

	if conf.language == "vie" then
		var_18_0.normalTechConditionScale = 0.75
	else
		var_18_0.normalTechConditionScale = 1
	end

	if var_0_1.nextTechInfo and var_0_1.nextLevelTechInfo then
		local var_18_1 = var_0_1.nextTechInfo

		var_18_1.type = 1
		var_18_1.status = technologyListConstant.TECH_STATUS_EFFECTED

		local var_18_2, var_18_3 = var_0_5(var_18_1)

		var_0_0.uiTable.techPicL:setDisplayFrame(tool.spriteFrameByName(var_18_2))

		local var_18_4 = CCSprite:create("res/ui/common/text/technology/.png")

		var_18_4:setScale(var_18_0.normalTechConditionScale)

		local var_18_5 = var_18_4:getContentSize()
		local var_18_6 = CCSprite:create(var_0_6(var_18_1))

		var_18_4:addChild(var_18_6)
		var_18_6:setAnchorPoint(ccp(0, 0.5))
		var_18_6:setPosition(ccp(var_18_5.width, var_18_5.height / 2))
		var_0_0.uiTable.btn_left:addChild(var_18_4)
		var_18_4:setAnchorPoint(ccp(0, 0.5))
		var_18_4:setPosition(ccp(60, 20))

		local var_18_7 = var_0_1.nextLevelTechInfo

		var_18_7.type = 2
		var_18_7.status = 1

		local var_18_8, var_18_9 = var_0_5(var_18_7)

		var_0_0.uiTable.techPicR:setDisplayFrame(tool.spriteFrameByName(var_18_8))

		local var_18_10 = CCLabelAtlas:create(var_18_7.openConditionPic, "res/ui/common/number/lm_tit_num.png", 22, 32, 48)
		local var_18_11 = var_18_10:getContentSize()
		local var_18_12 = CCSprite:createWithSpriteFrameName("lm_tit_jkq.png")

		var_18_10:addChild(var_18_12)

		if conf.language == "vie" then
			var_18_12:setAnchorPoint(ccp(0.5, 0.5))
			var_18_12:setPosition(ccp(var_18_11.width / 2, var_18_11.height / 2))
		else
			var_18_12:setAnchorPoint(ccp(0, 0.5))
			var_18_12:setPosition(ccp(var_18_11.width, var_18_11.height / 2))
		end

		local var_18_13 = var_18_12:getContentSize()

		var_0_0.uiTable.twoTechPanel:addChild(var_18_10)

		local var_18_14, var_18_15 = var_0_0.uiTable.btn_right:getPosition()

		var_18_10:setAnchorPoint(ccp(0, 0.5))
		var_18_10:setPosition(ccp(var_18_14 - 5 - var_18_11.width - var_18_13.width, var_18_15 + 2))
		var_0_0.uiTable.btn_left:registerScriptTapHandler(function()
			var_0_0.moveToCell(var_0_1.nextTechInfo.idx)
		end)
		var_0_0.uiTable.btn_right:registerScriptTapHandler(function()
			var_0_0.moveToCell(var_0_1.nextLevelTechInfo.idx)
		end)
		var_0_0.uiTable.twoTechPanel:setVisible(true)
	else
		local var_18_16 = false

		if var_0_4[user.curMainTask.taskId] and user.curMainTask.state == 1 then
			var_18_16 = true

			for iter_18_0 = 1, #var_0_1.techData do
				if var_0_1.techData[iter_18_0].techId == var_0_4[user.curMainTask.taskId] then
					var_0_1.touchedTechIdx = iter_18_0
				end
			end
		end

		var_0_0.moveToCell(var_0_1.touchedTechIdx, var_18_16)
		var_0_0.uiTable.oneTechPanel:setVisible(true)
	end
end

function var_0_0.updateDragonTechCell(arg_21_0, arg_21_1)
	autoUI.updateListData(var_0_0.uiTable, "dragonTechList", getDragonTechUiData(), arg_21_1, arg_21_0)
	var_0_0.showLightIfTechCanOpen(arg_21_0, arg_21_1)
end

function var_0_0.moveToCell(arg_22_0, arg_22_1)
	log.info("zhu@@@showCell", arg_22_0)

	local var_22_0 = 0

	if #var_0_1.techData > 5 then
		if arg_22_0 <= 3 then
			var_22_0 = 0
		elseif arg_22_0 >= #var_0_1.techData - 2 then
			var_22_0 = -var_0_0.scrollView:getContentSize().width + 855
		else
			var_22_0 = -160 * (arg_22_0 - 3)
		end
	end

	var_0_0.scrollView:setContentOffset(ccp(var_22_0, 0))
	var_0_0.showDragonTechByIdx(arg_22_0, arg_22_1)
	dragonTechUI.uiTable.oneTechPanel:setVisible(true)
	dragonTechUI.uiTable.twoTechPanel:setVisible(false)
end

function var_0_0.showLightIfTechCanOpen(arg_23_0, arg_23_1)
	local var_23_0 = var_0_0.uiTable["shine_light" .. arg_23_1]
	local var_23_1 = false

	if arg_23_0.type == 1 then
		if arg_23_0.status == technologyListConstant.TECH_STATUS_READY or arg_23_0.status == technologyListConstant.TECH_STATUS_OPENED or arg_23_0.status == technologyListConstant.TECH_STATUS_INVESTED or arg_23_0.status == technologyListConstant.TECH_STATUS_RESEARCHING then
			var_23_1 = true
		end
	elseif arg_23_0.type == 2 and arg_23_0.status == 0 then
		var_23_1 = true
	end

	if var_23_1 then
		if var_0_1.touchedTechIdx == 1 then
			var_0_1.touchedTechIdx = arg_23_1
		end

		var_23_0:setVisible(true)

		local var_23_2 = CCArray:create()

		var_23_2:addObject(CCFadeIn:create(0.3))
		var_23_2:addObject(CCFadeOut:create(0.3))

		local var_23_3 = CCSequence:create(var_23_2)
		local var_23_4 = CCRepeatForever:create(tolua.cast(var_23_3, "CCActionInterval"))

		var_23_0:runAction(var_23_4)
	else
		var_23_0:setVisible(false)
	end
end

function var_0_0.showInvestEffect(arg_24_0)
	local var_24_0 = tolua.cast(var_0_0.uiTable["jdt_bar" .. arg_24_0], "CCSprite")

	if var_24_0 then
		var_24_0:runAction(CCScaleTo:create(0.3, var_0_3, 1))
	end
end

function var_0_0.showOpenTechEffect(arg_25_0, arg_25_1)
	if var_0_0.upgradeAnimNode then
		pcall(var_0_0.upgradeAnimNode.removeFromParentAndCleanup, var_0_0.upgradeAnimNode, true)

		var_0_0.upgradeAnimNode = nil
	end

	local var_25_0 = rmgr.getAnimation("warlockUpgrade")
	local var_25_1 = CCAnimation:createWithSpriteFrames(var_25_0, 0.08)
	local var_25_2 = CCAnimate:create(var_25_1)
	local var_25_3 = CCRepeat:create(var_25_2, 1)
	local var_25_4 = CCSprite:create()

	var_0_0.upgradeAnimNode = var_25_4

	local var_25_5 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_25_5:registerScriptTouchHandler(function(arg_26_0, arg_26_1, arg_26_2)
		if arg_26_0 == CCTOUCHBEGAN then
			return true
		elseif arg_26_0 == CCTOUCHMOVED then
			return true
		elseif arg_26_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)
	log.debug("add mask")
	var_25_5:setTouchEnabled(true)
	var_25_5:addChild(var_25_4, 500)
	var_25_4:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))

	local var_25_6 = CCArray:create()

	var_25_6:addObject(var_25_3)

	local function var_25_7()
		if arg_25_0 then
			pcall(arg_25_0)
		end

		pcall(var_25_4.removeFromParentAndCleanup, var_25_4, true)

		var_25_4 = nil

		var_25_5:removeFromParentAndCleanup(true)
	end

	smgr.rootLayer:addChild(var_25_5, 60000)
	var_25_6:addObject(CCCallFuncN:create(var_25_7))
	var_25_4:runAction(CCSequence:create(var_25_6))

	local var_25_8

	if arg_25_1 then
		var_25_8 = CCSprite:create(arg_25_1)
	else
		var_25_8 = CCSprite:createWithSpriteFrameName("lm_tit_yjwc.png")
	end

	var_25_8:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 60))
	smgr.showTipSpriteText(var_25_8)
end
