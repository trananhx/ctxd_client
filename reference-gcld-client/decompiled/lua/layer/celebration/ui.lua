celebration = {}

tool.requireRes("celebration")
require("lua/common/tool")

celebration.ui = {}

local var_0_0 = celebration.ui
local var_0_1 = celebration.constant

celebration.celeId = 0
celebration.celeType = 0
celebration.playerName = ""
celebration.dialogueType = 0
celebration.dialogueName = nil

local function var_0_2(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0 / 1000

	if var_1_0 < 3600 then
		arg_1_1:setString("")

		local var_1_1 = createTimerLabel(var_1_0 * 1000, language.get(131003), "Thonburi", 22, nil, nil, nil, ccc3(255, 0, 0))

		arg_1_1:addChild(var_1_1)
	elseif var_1_0 < 86400 then
		local var_1_2 = var_1_0 / 3600

		arg_1_1:setString(language.get(131001, tool.toint(var_1_2)))
	else
		local var_1_3 = var_1_0 / 3600 / 24

		arg_1_1:setString(language.get(131002, tool.toint(var_1_3)))
	end
end

function var_0_0.show()
	amgr.playEffect(enumAudioFile.ui_dialog_open)

	local var_2_0 = createBaseLayer()

	var_0_0.table = autoUI.initUI(var_2_0, getCelebrationData())
	var_0_0.table.layer = var_2_0

	var_0_0.table.gongheDesc2:setPositionY(var_0_0.table.gongheDesc1:getPositionY() - var_0_0.table.gongheDesc1:getContentSize().height / 2 - 4)

	local var_2_1 = var_0_0.table.closeItem

	var_2_1:setScale(2)

	local var_2_2 = var_2_1:getContentSize()
	local var_2_3 = var_0_0.table.bg:getContentSize()
	local var_2_4 = visibleSize.width / 2 + var_2_3.width / 2 - var_2_2.width / 2 - 30
	local var_2_5 = visibleSize.height / 2 + var_2_3.height / 2 + var_2_2.height / 2 - 20

	var_2_1:setPosition(ccp(var_2_4, var_2_5))

	local function var_2_6()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.getLayer("topLayer"):removeChild(var_2_0, true)

		if guide.control.isHideByTemp == true then
			guide.control.isHideByTemp = false

			guide.ui.setVisible(true)
		end

		guide.control.setCurrentMarkTrace(nil)
		CCTextureCache:sharedTextureCache():removeUnusedTextures()

		if globalAction_updateSpecialEffect then
			globalAction_updateSpecialEffect()
		end
	end

	var_0_0.table.closeItem:registerScriptTapHandler(var_2_6)

	local function var_2_7()
		log.info("@@ 进入恭贺")

		local function var_4_0(arg_5_0)
			log.info("@@ receive_celebrate ")

			local var_5_0 = arg_5_0.action.data

			var_5_0.rewards = var_5_0.rewards or {}

			local var_5_1 = {}

			for iter_5_0, iter_5_1 in ipairs(var_5_0.rewards) do
				local var_5_2 = {}

				if iter_5_1.rewardType == "yh" then
					var_5_2.id = 10008
				elseif iter_5_1.rewardType == "xl" then
					var_5_2.id = 10003
				elseif iter_5_1.rewardType == "exp" then
					var_5_2.id = 6
				end

				var_5_2.value = iter_5_1.rewardNum

				table.insert(var_5_1, var_5_2)
			end

			globalAction_gotResource(var_5_1)

			if user.player.gonghe > 0 then
				user.player.gonghe = user.player.gonghe - 1
			end

			log.info("@@ 剩下的恭贺： " .. user.player.gonghe)
			notice.control.update()
			notice.ui.update()

			if user.player.gonghe > 0 then
				celebration.control.request_celebrationInfo()
			else
				var_2_6()
			end
		end

		cmgr.sendRequest(var_4_0, actions.celebrate, celebration.celeId)
	end

	var_0_0.table.jinruyanhui:registerScriptTapHandler(var_2_7)

	local function var_2_8(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == CCTOUCHBEGAN then
			return true
		elseif arg_6_0 == CCTOUCHMOVED then
			return true
		elseif arg_6_0 == CCTOUCHENDED then
			return true
		end
	end

	var_2_0:setTouchEnabled(true)
	var_2_0:registerScriptTouchHandler(var_2_8, false, true)

	local var_2_9 = smgr.getLayer("topLayer")

	var_2_9:removeAllChildrenWithCleanup(true)
	var_2_9:addChild(var_2_0)
	var_2_0:setVisible(true)
	celebration.control.request_celebrationInfo()
end

function var_0_0.setCelebrationInfo(arg_7_0)
	local var_7_0 = {}

	if conf.language == "vie" then
		var_7_0.fntSize = -10
	else
		var_7_0.fntSize = 0
	end

	celebration.celeId = arg_7_0.celeId
	celebration.celeType = arg_7_0.celeType
	celebration.playerName = arg_7_0.playerName
	celebration.theme = arg_7_0.theme

	if var_0_0.table.richNode and not tolua.isnull(var_0_0.table.richNode) then
		var_0_0.table.richNode:removeFromParentAndCleanup(true)

		var_0_0.table.richNode = nil
	end

	local var_7_1 = {
		CCStrokeLabelTTF:create(language.get(320500), "Thonburi-Bold", 28 + var_7_0.fntSize, 2, ccc3(13, 13, 13)),
		(CCStrokeLabelTTF:create(arg_7_0.playerName, "Thonburi-Bold", 28 + var_7_0.fntSize, 2, ccc3(13, 13, 13)))
	}

	var_7_1[2]:setColor(colorText[10002])

	local var_7_2

	if arg_7_0.celeType == 1 then
		var_7_2 = language.get(320502)
	elseif arg_7_0.celeType == 9 or arg_7_0.celeType == 10 or arg_7_0.celeType == 12 or arg_7_0.celeType == 13 or arg_7_0.celeType == 14 then
		var_7_2 = language.get(320519)
	elseif arg_7_0.celeType == 5 then
		var_7_2 = language.get(320520)
	else
		var_7_2 = language.get(320501)
	end

	var_7_1[3] = CCStrokeLabelTTF:create(var_7_2, "Thonburi-Bold", 28 + var_7_0.fntSize, 2, ccc3(13, 13, 13))

	local var_7_3 = arg_7_0.theme

	var_7_1[4] = CCStrokeLabelTTF:create(var_7_3, "Thonburi-Bold", 28 + var_7_0.fntSize, 2, ccc3(13, 13, 13))

	var_7_1[4]:setColor(ccc3(138, 43, 226))

	var_7_1[5] = CCStrokeLabelTTF:create(language.get(320503), "Thonburi-Bold", 28 + var_7_0.fntSize, 2, ccc3(13, 13, 13))

	local var_7_4 = createRichNode(var_7_1, 0)

	var_7_4:setPosition(105, 400)
	var_0_0.table.bg:addChild(var_7_4, 1000)

	var_0_0.table.richNode = var_7_4

	var_0_2(arg_7_0.countDown * 1000, var_0_0.table.leftTime)
end
