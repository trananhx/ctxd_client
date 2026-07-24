tool.requireRes("technology/buildTech")
require("lua/component/timerLabel")

buildTechUI = {}

local var_0_0 = buildTechUI

buildTechUI.uiTable = {}

local var_0_1 = buildTechControl
local var_0_2 = buildTechConstant

function buildTechUI.show()
	local var_1_0 = createBaseLayer()

	smgr.registerLayer(var_1_0, "buildTechLayer")
	var_1_0:registerScriptTouchHandler(var_0_1.onTouch)
	var_1_0:setTouchEnabled(true)

	var_1_0.onEnter = var_0_1.onEnter
	var_1_0.onExit = var_0_1.onExit
	var_0_0.uiTable = autoUI.initUI(var_1_0, getBuildTechUiData())

	local function var_1_1(arg_2_0)
		if arg_2_0.action.data then
			var_0_0.data = arg_2_0.action.data

			if var_0_0.data.occupation == 0 then
				var_1_0:removeAllChildrenWithCleanup(true)

				var_0_0.uiTable = {}
				var_0_0.uiTable = autoUI.initUI(var_1_0, getSelectBuildTechUiData())

				var_0_0.uiTable.btn_change1:registerScriptTapHandler(function()
					messageBox.confirm(language.get("222037_buildingTech"), function()
						cmgr.sendRequest(function()
							cmgr.sendRequest(var_1_1, actions.getWorkerTechInfo)
						end, actions.decideOccupation, 2, var_0_0.data.vId)
					end, language.get(10001))
				end)
				var_0_0.uiTable.btn_change2:registerScriptTapHandler(function()
					messageBox.confirm(language.get("222038_buildingTech"), function()
						cmgr.sendRequest(function()
							cmgr.sendRequest(var_1_1, actions.getWorkerTechInfo)
						end, actions.decideOccupation, 1, var_0_0.data.vId)
					end, language.get(10001))
				end)
				var_0_0.uiTable.mjNum:setString(language.get("222036_buildingTech", var_0_0.data.millmanNum))
				var_0_0.uiTable.tjNum:setString(language.get("222036_buildingTech", var_0_0.data.blackSmithNum))
			else
				if var_0_0.uiTable.btn_change1 then
					var_1_0:removeAllChildrenWithCleanup(true)

					var_0_0.uiTable = autoUI.initUI(var_1_0, getBuildTechUiData())

					var_0_0.uiTable.btn_change:registerScriptTapHandler(function()
						messageBox.confirm(language.get("222012_buildingTech", var_0_0.data.changeGold), function()
							cmgr.sendRequest(receiveOccupation, actions.decideOccupation, 3 - var_0_0.data.occupation, var_0_0.data.vId)
						end, language.get(10001))
					end)
					var_0_0.uiTable.btn_addTech:registerScriptTapHandler(function()
						messageBox.showChargeWinWithData(language.get(10003), language.get("222013_buildingTech", var_0_0.data.buyGold), "buyTech", function()
							cmgr.sendRequest(var_1_1, actions.buyTechPoint, var_0_0.data.vId)
						end)
					end)
					var_0_0.uiTable.btn_open:registerScriptTapHandler(function()
						rankInfoUI.show(5)
					end)
				end

				var_0_0.uiTable.BuildTechViewBackground:setVisible(true)
				buildTechUI.setBuildingTechData()
			end
		end
	end

	local function var_1_2(arg_14_0)
		if arg_14_0.action.data then
			cmgr.sendRequest(var_1_1, actions.getWorkerTechInfo)
		end
	end

	cmgr.sendRequest(var_1_1, actions.getWorkerTechInfo)
	var_0_0.uiTable.BuildTechViewBackground:setVisible(false)
	var_0_0.uiTable.btn_addTech:registerScriptTapHandler(function()
		messageBox.showChargeWinWithData(language.get(10003), language.get("222013_buildingTech", var_0_0.data.buyGold), "buyTech", function()
			cmgr.sendRequest(var_1_1, actions.buyTechPoint, var_0_0.data.vId)
		end)
	end)
	var_0_0.uiTable.btn_change:registerScriptTapHandler(function()
		messageBox.confirm(language.get("222012_buildingTech", var_0_0.data.changeGold), function()
			cmgr.sendRequest(var_1_2, actions.decideOccupation, 3 - var_0_0.data.occupation, var_0_0.data.vId)
		end, language.get(10001))
	end)
	var_0_0.uiTable.btn_open:registerScriptTapHandler(function()
		rankInfoUI.show(5)
	end)

	if conf.language == "vie" then
		var_0_0.uiTable.text_change:setDimensions(CCSizeMake(100, 50))
		var_0_0.uiTable.text_change:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_0_0.uiTable.text_change:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	end

	return var_1_0
end

function buildTechUI.setBuildingTechData()
	if var_0_0.uiTable == nil or var_0_0.data == nil then
		return
	end

	var_0_0.uiTable.processBar:setPercentage(var_0_0.data.exp * 100 / var_0_0.data.maxExp)
	var_0_0.uiTable.processWord:setString(var_0_0.data.exp .. "/" .. var_0_0.data.maxExp)
	buildTechUI.setBuildingSkill()

	if var_0_0.data.occupation == 1 then
		var_0_0.uiTable.workpeople:setDisplayFrame(CCSprite:create("res/ui/technology/buildTech/tjx.png"):displayFrame())
		var_0_0.uiTable.worktype:setDisplayFrame(CCSprite:create("res/ui/technology/buildTech/jzke_type_tj.png"):displayFrame())
		var_0_0.uiTable.text_change:setString(language.get("222002_buildingTech"))
	else
		var_0_0.uiTable.workpeople:setDisplayFrame(CCSprite:create("res/ui/technology/buildTech/mjx.png"):displayFrame())
		var_0_0.uiTable.worktype:setDisplayFrame(CCSprite:create("res/ui/technology/buildTech/jzke_type_mj.png"):displayFrame())
		var_0_0.uiTable.text_change:setString(language.get("222003_buildingTech"))
	end

	var_0_0.uiTable.text_gold:setString(var_0_0.data.changeGold)
	var_0_0.uiTable.techPointNum:setString(var_0_0.data.techPoint)

	if var_0_0.data.showEffect or var_0_0.data.techs[1].learned ~= true then
		roleDialogue.control.loadSpeak(2011)
	end
end

function buildTechUI.setBuildingSkill()
	for iter_21_0 = 1, 9 do
		if var_0_0.uiTable["buildTech_" .. iter_21_0] then
			var_0_0.uiTable["buildTech_" .. iter_21_0]:removeAllChildrenWithCleanup(true)

			local var_21_0

			if var_0_0.data.occupation == 1 then
				var_21_0 = CCSprite:create(var_0_2.tiejiang[iter_21_0])

				if var_0_0.data.techs[iter_21_0 - 1] and var_0_0.data.techs[iter_21_0 - 1].learned ~= true then
					var_21_0 = GraySprite:create(var_0_2.tiejiang[iter_21_0])
				end
			else
				var_21_0 = CCSprite:create(var_0_2.mujiang[iter_21_0])

				if var_0_0.data.techs[iter_21_0 - 1] and var_0_0.data.techs[iter_21_0 - 1].learned ~= true then
					var_21_0 = GraySprite:create(var_0_2.mujiang[iter_21_0])
				end
			end

			if var_0_0.data.techs[iter_21_0 - 1] and var_0_0.data.techs[iter_21_0 - 1].isLocked then
				var_21_0 = CCSprite:create(var_0_2.mujiang[8])

				local var_21_1 = CCSprite:create("res/ui/technology/buildTech/jzke_word_jqqd.png")

				var_21_1:setPosition(ccp(52, 20))
				var_21_0:addChild(var_21_1)
			end

			if var_0_0.data.techs[iter_21_0 - 1] and var_0_0.data.techs[iter_21_0 - 1].learned ~= true and var_0_0.data.techs[iter_21_0 - 1].canLearn then
				local var_21_2 = CCSprite:create("res/ui/technology/buildTech/jzke_jn_icon_light.png")
				local var_21_3 = CCArray:create()

				var_21_3:addObject(CCFadeIn:create(0.5))
				var_21_3:addObject(CCFadeOut:create(0.5))

				local var_21_4 = CCSequence:create(var_21_3)
				local var_21_5 = CCRepeatForever:create(tolua.cast(var_21_4, "CCActionInterval"))

				var_21_2:runAction(var_21_5)
				var_21_2:setPosition(ccp(36, 36))
				var_21_0:addChild(var_21_2)
			end

			if var_0_0.data.techs[iter_21_0 - 1] and var_0_0.data.techs[iter_21_0 - 1].type == 3 and var_0_0.data.techs[iter_21_0 - 1].isLocked ~= true then
				local var_21_6 = CCSprite:createWithSpriteFrameName("res_icon_19_small.png")
				local var_21_7 = CCLabelTTF:create(var_0_0.data.techs[iter_21_0 - 1].gold, "Thonburi", 18)

				var_21_6:setPosition(ccp(22, 0))
				var_21_7:setPosition(ccp(55, 0))
				var_21_0:addChild(var_21_6)
				var_21_0:addChild(var_21_7)
			end

			if var_0_0.data.techs[iter_21_0 - 1] and var_0_0.data.techs[iter_21_0 - 1].type == 4 and var_0_0.data.techs[iter_21_0 - 1].isLocked ~= true then
				local var_21_8 = CCSprite:create("res/ui/jungong/jzkj_icon_sp.png")
				local var_21_9 = CCLabelTTF:create(var_0_0.data.techs[iter_21_0 - 1].currNum .. "/" .. var_0_0.data.techs[iter_21_0 - 1].num, "Thonburi", 18)

				var_21_8:setPosition(ccp(11, 0))
				var_21_9:setPosition(ccp(50, 0))
				var_21_0:addChild(var_21_8)
				var_21_0:addChild(var_21_9)
			end

			var_21_0:setPosition(ccp(var_0_0.uiTable["buildTech_" .. iter_21_0]:getContentSize().width / 2, var_0_0.uiTable["buildTech_" .. iter_21_0]:getContentSize().height / 2))
			var_0_0.uiTable["buildTech_" .. iter_21_0]:addChild(var_21_0)
		end
	end

	for iter_21_1 = 1, #var_0_0.data.techs do
		-- block empty
	end
end

function buildTechUI.handleTipsButtonTap(arg_22_0)
	local var_22_0 = {}
	local var_22_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_22_1:registerScriptTouchHandler(function(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 == CCTOUCHBEGAN then
			return true
		elseif arg_23_0 == CCTOUCHMOVED then
			return true
		elseif arg_23_0 == CCTOUCHENDED then
			pcall(var_22_1.removeFromParentAndCleanup, var_22_1, true)

			return true
		end
	end, false, true)
	var_22_1:setTouchEnabled(true)
	autoUI.initUI(var_22_1, getTipData(arg_22_0))
	smgr.rootLayer:addChild(var_22_1, 60000)
end

function getTipData(arg_24_0)
	local var_24_0
	local var_24_1
	local var_24_2
	local var_24_3 = buildTechUI.data.techs[arg_24_0 - 1]

	if var_24_3 then
		var_24_0 = var_24_3.name

		if var_24_3.type == 4 then
			var_24_1 = language.get("222045_buildingTech", var_24_3.num)
		else
			var_24_1 = language.get("222006_buildingTech", var_24_3.num)
		end

		var_24_3.intro = string.gsub(var_24_3.intro, "<!%[CDATA%[", "")
		var_24_3.intro = string.gsub(var_24_3.intro, "]]>", "")
		var_24_3.intro = string.gsub(var_24_3.intro, "<font color=\"#%w+\">", "")
		var_24_3.intro = string.gsub(var_24_3.intro, "</font>", "")
		var_24_3.intro = string.gsub(var_24_3.intro, "<br>", "\n")
		var_24_2 = language.get("222007_buildingTech", var_24_3.intro)
	else
		if var_0_0.data.occupation == 1 then
			var_24_0 = language.get("222010_buildingTech")
			var_24_1 = language.get("222011_buildingTech")
		else
			var_24_0 = language.get("222008_buildingTech")
			var_24_1 = language.get("222009_buildingTech")
		end

		var_24_2 = ""
	end

	local var_24_4, var_24_5 = var_0_0.uiTable["buildTech_" .. arg_24_0]:getPosition()

	log.info(var_24_5)
	log.info(visibleSize.width)

	if var_24_4 + 200 > visibleSize.width then
		var_24_4 = var_24_4 - 100
	end

	return {
		tipsBg = {
			anchorPointX = 0.5,
			type = "pic_9_tips",
			pic = "frame:common_tip_frame_small.png",
			anchorPointY = 0.5,
			middleRect = CCRectMake(0, 0, 0, 0),
			preferedSize = CCSizeMake(290, 300),
			x = var_24_4,
			y = var_24_5 + 100,
			content = {
				{
					fontSize = 20,
					height = 0,
					type = "label",
					width = 300,
					text = var_24_0
				},
				{
					fontSize = 18,
					height = 0,
					type = "label",
					width = 300,
					text = var_24_1,
					color = ccc3(204, 185, 134)
				},
				{
					fontSize = 18,
					height = 0,
					type = "label",
					width = 300,
					text = var_24_2,
					color = ccc3(204, 185, 134)
				}
			}
		}
	}
end
