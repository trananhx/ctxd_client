require("lua/layer/playerInfo/ui")
require("lua/layer/task/ui")
require("lua/layer/menu/ui")
require("lua/layer/weaponTab/ui")

mainCity = {}

tool.requireRes("mainCity")

mainCity.ui = {}
mainCity.ui.table = {}

local var_0_0 = {
	ccp(60 + visibleSize.width / 2, 2 + visibleSize.height / 2),
	ccp(-217 + visibleSize.width / 2, 118 + visibleSize.height / 2),
	ccp(-294 + visibleSize.width / 2, -82 + visibleSize.height / 2),
	ccp(268 + visibleSize.width / 2, -120 + visibleSize.height / 2),
	ccp(-122 + visibleSize.width / 2, -193 + visibleSize.height / 2),
	ccp(235 + visibleSize.width / 2, 140 + visibleSize.height / 2)
}
local var_0_1 = {
	language.get(250001),
	language.get(250002),
	language.get(250003),
	language.get(250004),
	(language.get(250005))
}
local var_0_2 = {
	[3] = 3,
	[247] = 10032,
	[116] = 55,
	[51] = 10035,
	[216] = 216
}

function mainCity.ui.setAdditionModeTextrue(arg_1_0, arg_1_1)
	local var_1_0

	if arg_1_1 == 1 then
		var_1_0 = "res/ui/mainCity/prof_150.png"
	elseif arg_1_1 == 2 then
		var_1_0 = "res/ui/mainCity/prof_200.png"
	elseif arg_1_1 == 3 then
		var_1_0 = "res/ui/mainCity/prof_300.png"
	end

	if var_1_0 ~= nil then
		local var_1_1 = CCSprite:create(var_1_0)

		mainCity.ui.table["city_icon_up_" .. tostring(arg_1_0)]:setDisplayFrame(var_1_1:displayFrame())
	end
end

function mainCity.ui.appendGuide(arg_2_0)
	local var_2_0, var_2_1 = mainCity.ui.table["city_" .. tostring(arg_2_0)]:getPosition()

	mainCity.ui.table["city_" .. tostring(arg_2_0)]:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
	mainCity.ui.table["city_" .. tostring(arg_2_0)]:setVisible(true)

	local var_2_2 = CCDelayTime:create(0.5)
	local var_2_3 = CCMoveTo:create(0.5, ccp(var_2_0, var_2_1))
	local var_2_4 = CCCallFuncN:create(mainCity.control.showGuideArrow)
	local var_2_5 = CCArray:create()

	var_2_5:addObject(var_2_2)
	var_2_5:addObject(var_2_3)
	var_2_5:addObject(var_2_4)

	local var_2_6 = CCSequence:create(var_2_5)

	mainCity.ui.table["city_" .. tostring(arg_2_0)]:runAction(var_2_6)
	mainCity.ui.table["city_effect_" .. tostring(arg_2_0)]:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
	mainCity.ui.table["city_effect_" .. tostring(arg_2_0)]:setVisible(true)

	local var_2_7 = CCDelayTime:create(0.5)
	local var_2_8 = CCMoveTo:create(0.5, ccp(var_2_0, var_2_1))
	local var_2_9 = CCDelayTime:create(0.5)
	local var_2_10 = CCHide:create()
	local var_2_11 = CCArray:create()

	var_2_11:addObject(var_2_7)
	var_2_11:addObject(var_2_8)
	var_2_11:addObject(var_2_9)
	var_2_11:addObject(var_2_10)

	local var_2_12 = CCSequence:create(var_2_11)

	mainCity.ui.table["city_effect_" .. tostring(arg_2_0)]:runAction(var_2_12)

	mainCity.control.selectedGuideIndex = arg_2_0
end

function mainCity.ui.initMainCityUI(arg_3_0)
	local var_3_0 = {
		language.get(10101),
		language.get(10102),
		language.get(10103),
		language.get(10104),
		{
			language.get(170001),
			language.get(170002),
			language.get(170003),
			language.get(170004)
		}
	}
	local var_3_1 = {
		"sys_juming",
		"sys_muchang",
		"sys_nongchang",
		"sys_kuangchang",
		"sys_bingying",
		"sys_huangchen"
	}

	mainCity.ui.removeAllNeedRefreshObject()

	if mainCity.control.reformStatus == 3 then
		mainCity.ui.table.bg2:setVisible(true)
		mainCity.ui.table.bg:setVisible(false)
		mainCity.ui.table.funcBtns:setVisible(true)
		mainCity.ui.table.btnbssh:setEnabled(user.getFunc(68))
		mainCity.ui.table.btntjp:setEnabled(user.getFunc(66))
		mainCity.ui.table.btnlf:setEnabled(user.getFunc(52))
		mainCity.ui.table.btnssgf:setEnabled(user.getFunc(64))
	else
		mainCity.ui.table.bg2:setVisible(false)
		mainCity.ui.table.bg:setVisible(true)
		mainCity.ui.table.funcBtns:setVisible(false)
	end

	for iter_3_0 = 1, 6 do
		if iter_3_0 ~= 6 and arg_3_0[iter_3_0].status == 1 or iter_3_0 == 6 and mainCity.control.reformStatus == 3 then
			mainCity.ui.table["city_" .. tostring(iter_3_0)]:setDisplayFrame(CCSprite:create("res/ui/mainCity/" .. var_3_1[iter_3_0] .. "2.png"):displayFrame())
			mainCity.ui.table["city_" .. tostring(iter_3_0)]:setPosition(var_0_0[iter_3_0])
			mainCity.ui.table["city_effect_" .. tostring(iter_3_0)]:setDisplayFrame(CCSprite:create("res/ui/mainCity/" .. var_3_1[iter_3_0] .. "_effect2.png"):displayFrame())
			mainCity.ui.table["city_effect_" .. tostring(iter_3_0)]:setPosition(var_0_0[iter_3_0])
			mainCity.ui.table["city_icon_" .. tostring(iter_3_0)]:setVisible(false)
			mainCity.ui.table["city_icon2_" .. tostring(iter_3_0)]:setVisible(true)
		else
			mainCity.ui.table["city_icon_" .. tostring(iter_3_0)]:setVisible(true)
			mainCity.ui.table["city_icon2_" .. tostring(iter_3_0)]:setVisible(false)
		end

		if arg_3_0[iter_3_0].isOpen == true then
			if guide.constant.city[iter_3_0] == true then
				mainCity.ui.appendGuide(iter_3_0)
				mainCity.ui.table["city_" .. tostring(iter_3_0)]:setVisible(true)
				mainCity.ui.table["city_effect_" .. tostring(iter_3_0)]:setVisible(true)
				mainCity.ui.table["city_icon_" .. tostring(iter_3_0)]:setVisible(false)

				if iter_3_0 == 6 then
					for iter_3_1 = 1, 4 do
						mainCity.ui.table["city_title_bg_6" .. tostring(iter_3_1)]:setVisible(false)
						mainCity.ui.table["city_title_6" .. tostring(iter_3_1)]:setVisible(false)
					end
				else
					mainCity.ui.table["city_title_bg_" .. tostring(iter_3_0)]:setVisible(false)
					mainCity.ui.table["city_title_" .. tostring(iter_3_0)]:setVisible(false)
					mainCity.ui.table["city_icon_up_" .. tostring(iter_3_0)]:setVisible(false)
				end
			else
				local var_3_2
				local var_3_3

				if iter_3_0 == 5 then
					var_3_2 = language.get(170005, arg_3_0[iter_3_0].outputValue, var_3_0[arg_3_0[iter_3_0].outputType][arg_3_0[iter_3_0].troopLv])
				elseif iter_3_0 == 6 then
					for iter_3_2 = 1, 4 do
						local var_3_4

						if conf.language == "vie" then
							var_3_4 = language.get("vn_170006", var_3_0[iter_3_2], arg_3_0[6].outputValue[iter_3_2])
						else
							var_3_4 = language.get(170006, arg_3_0[6].outputValue[iter_3_2], var_3_0[iter_3_2])
						end

						mainCity.ui.table["city_title_6" .. tostring(iter_3_2)]:setString(var_3_4)
						mainCity.ui.table["city_title_6" .. tostring(iter_3_2)]:setVisible(true)
						mainCity.ui.table["city_title_bg_6" .. tostring(iter_3_2)]:setScaleX(0.8)
						mainCity.ui.table["city_title_bg_6" .. tostring(iter_3_2)]:setVisible(true)
					end
				elseif iter_3_0 == 4 then
					if mainCity.control.displayIron == 0 then
						var_3_2 = language.get(490931, arg_3_0[iter_3_0].totalGemOutPut, language.get(10106))
					else
						var_3_2 = language.get(170007, arg_3_0[iter_3_0].outputValue, var_3_0[arg_3_0[iter_3_0].outputType])
					end
				else
					var_3_2 = language.get(170007, arg_3_0[iter_3_0].outputValue, var_3_0[arg_3_0[iter_3_0].outputType])
				end

				if iter_3_0 == 6 then
					if mainCity.control.reformStatus == 1 then
						mainCity.ui.table.city_title_bg_61:setVisible(false)
						mainCity.ui.table.city_title_61:setVisible(false)
						mainCity.ui.table.city_title_bg_62:setVisible(false)
						mainCity.ui.table.city_title_62:setVisible(false)
						mainCity.ui.table.city_title_bg_63:setVisible(false)
						mainCity.ui.table.city_title_63:setVisible(false)
						mainCity.ui.table.city_title_bg_64:setVisible(false)
						mainCity.ui.table.city_title_64:setVisible(false)
						mainCity.ui.table.investment:setVisible(true)
						mainCity.ui.table.investLayer:setVisible(true)
						mainCity.ui.table.totleProgress:setString(language.get(490933, mainCity.control.currentStage, mainCity.control.totalStage))

						for iter_3_3, iter_3_4 in pairs(mainCity.control.invest) do
							mainCity.ui.table["rmProgress" .. iter_3_3]:setPercentage(100 * iter_3_4.currentNum / iter_3_4.totalNum)

							local var_3_5 = iter_3_4.type

							if iter_3_4.type == 21 then
								var_3_5 = 7
							end

							mainCity.ui.table["investResource" .. iter_3_3]:setDisplayFrame(CCSprite:createWithSpriteFrameName("res_icon_" .. var_3_5 .. ".png"):displayFrame())
							mainCity.ui.table["investNum" .. iter_3_3]:setString(language.get(490932, tool.getFormatNum(iter_3_4.currentNum), tool.getFormatNum(iter_3_4.totalNum)))
						end
					elseif mainCity.control.reformStatus == 2 then
						mainCity.ui.table.city_title_bg_61:setVisible(false)
						mainCity.ui.table.city_title_61:setVisible(false)
						mainCity.ui.table.city_title_bg_62:setVisible(false)
						mainCity.ui.table.city_title_62:setVisible(false)
						mainCity.ui.table.city_title_bg_63:setVisible(false)
						mainCity.ui.table.city_title_63:setVisible(false)
						mainCity.ui.table.city_title_bg_64:setVisible(false)
						mainCity.ui.table.city_title_64:setVisible(false)
						mainCity.ui.table.investment:setVisible(true)
						mainCity.ui.table.investLayer:setVisible(false)

						local var_3_6 = CCScale9Sprite:create("res/ui/resourceArea2/zcgz_btn_round.png")
						local var_3_7 = CCControlButton:create(var_3_6)

						var_3_7:setAdjustBackgroundImage(false)
						var_3_7:setZoomOnTouchDown(false)
						var_3_7:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/resourceArea2/zcgz_btn_round_c.png"), CCControlStateHighlighted)
						var_3_7:setPosition(ccp(mainCity.ui.table.investment:getContentSize().width / 2, -55))
						var_3_7:addHandleOfControlEvent(mainCity.ui.onKnockClicked, CCControlEventTouchUpInside)

						local var_3_8 = CCSprite:create("res/ui/mainCity/chui1.png")

						var_3_8:setPosition(ccp(var_3_7:getContentSize().width / 2 - 5, var_3_7:getContentSize().height / 2 + 5))

						local var_3_9 = CCSprite:create("res/ui/mainCity/zcgz_area_gzhc_gz_word.png")

						var_3_9:setPosition(ccp(var_3_7:getContentSize().width / 2, 5))
						mainCity.ui.table.totleProgress:setString(language.get(490935, mainCity.control.slaveNum, mainCity.control.huangchengSlaveNum))
						var_3_7:addChild(var_3_9)
						var_3_7:addChild(var_3_8)
						mainCity.ui.table.investment:addChild(var_3_7)
					elseif mainCity.control.reformStatus == 4 then
						mainCity.ui.table.city_title_bg_61:setVisible(false)
						mainCity.ui.table.city_title_61:setVisible(false)
						mainCity.ui.table.city_title_bg_62:setVisible(false)
						mainCity.ui.table.city_title_62:setVisible(false)
						mainCity.ui.table.city_title_bg_63:setVisible(false)
						mainCity.ui.table.city_title_63:setVisible(false)
						mainCity.ui.table.city_title_bg_64:setVisible(false)
						mainCity.ui.table.city_title_64:setVisible(false)
						mainCity.ui.table.investment:setVisible(true)
						mainCity.ui.table.investLayer:setVisible(false)
						mainCity.ui.table.totleProgress:setString(language.get(490936))

						local var_3_10 = CCScale9Sprite:create("res/ui/resourceArea2/zcgz_btn_round.png")
						local var_3_11 = CCControlButton:create(var_3_10)

						var_3_11:setAdjustBackgroundImage(false)
						var_3_11:setZoomOnTouchDown(false)
						var_3_11:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/resourceArea2/zcgz_btn_round_c.png"), CCControlStateHighlighted)
						var_3_11:setPosition(ccp(mainCity.ui.table.investment:getContentSize().width / 2, -55))
						var_3_11:addHandleOfControlEvent(mainCity.ui.onHallsReformClicked, CCControlEventTouchUpInside)

						local var_3_12 = CCSprite:create("res/ui/mainCity/chui1.png")

						var_3_12:setPosition(ccp(var_3_11:getContentSize().width / 2 - 5, var_3_11:getContentSize().height / 2 + 5))

						local var_3_13 = CCSprite:create("res/ui/mainCity/zcgz_area_gzhc_jg_word.png")

						var_3_13:setPosition(ccp(var_3_11:getContentSize().width / 2, 5))
						var_3_11:addChild(var_3_13)
						var_3_11:addChild(var_3_12)
						mainCity.ui.table.investment:addChild(var_3_11)
					else
						mainCity.ui.table.city_title_bg_61:setVisible(true)
						mainCity.ui.table.city_title_61:setVisible(true)
						mainCity.ui.table.city_title_bg_62:setVisible(true)
						mainCity.ui.table.city_title_62:setVisible(true)
						mainCity.ui.table.city_title_bg_63:setVisible(true)
						mainCity.ui.table.city_title_63:setVisible(true)
						mainCity.ui.table.city_title_bg_64:setVisible(true)
						mainCity.ui.table.city_title_64:setVisible(true)
						mainCity.ui.table.investment:setVisible(false)
					end
				end

				mainCity.ui.table["city_" .. tostring(iter_3_0)]:setVisible(true)
				mainCity.ui.table["city_effect_" .. tostring(iter_3_0)]:setVisible(false)
				mainCity.ui.table["city_icon_" .. tostring(iter_3_0)]:setVisible(true)

				if iter_3_0 ~= 6 then
					mainCity.ui.table["city_title_bg_" .. tostring(iter_3_0)]:setVisible(true)
					mainCity.ui.table["city_title_" .. tostring(iter_3_0)]:setVisible(true)
					mainCity.ui.table["city_title_" .. tostring(iter_3_0)]:setString(var_3_2)

					if arg_3_0[iter_3_0].upMode == 0 then
						mainCity.ui.table["city_icon_up_" .. tostring(iter_3_0)]:setVisible(false)
					else
						mainCity.ui.setAdditionModeTextrue(iter_3_0, arg_3_0[iter_3_0].upMode)
						mainCity.ui.table["city_icon_up_" .. tostring(iter_3_0)]:setVisible(true)
					end

					if mainCity.control[iter_3_0].isUpdating then
						mainCity.control.action_hammer(iter_3_0)
					end

					if arg_3_0[iter_3_0].isBuilding then
						mainCity.control.addRemouldTag(iter_3_0)
					end

					if arg_3_0[iter_3_0].canReform == 1 then
						mainCity.control.addRemouldButton(iter_3_0)
					end
				end

				if iter_3_0 == 2 and arg_3_0[iter_3_0].totalSilkOutPut and arg_3_0[iter_3_0].totalSilkOutPut > 0 then
					var_3_3 = language.get(170007, arg_3_0[iter_3_0].totalSilkOutPut, language.get(310020))
				end

				if iter_3_0 == 2 then
					if var_3_3 then
						mainCity.ui.table.city_title_silk:setVisible(true)
						mainCity.ui.table.city_title_bg_silk:setVisible(true)
						mainCity.ui.table.city_title_silk:setString(var_3_3)
					else
						mainCity.ui.table.city_title_bg_silk:setVisible(false)
						mainCity.ui.table.city_title_silk:setVisible(false)
					end
				end

				if iter_3_0 == 2 then
					if arg_3_0.lumberYardReform then
						mainCity.control.addLuomuTag(iter_3_0, arg_3_0.lumberYardReform.drawingNum)

						if arg_3_0.lumberYardReform.first == true then
							roleDialogue.control.loadSpeak(2180)
						end
					end

					if arg_3_0.lumberYardReformPlus then
						mainCity.control.addZhougongTag(iter_3_0, arg_3_0.lumberYardReformPlus.drawingNumPlus)

						if arg_3_0.lumberYardReformPlus.first == true then
							roleDialogue.control.loadSpeak(2250)
						end
					end
				elseif iter_3_0 == 3 then
					if arg_3_0.farmReform then
						mainCity.control.addMaJunTag(iter_3_0, arg_3_0.farmReform.drawingNum)

						if arg_3_0.farmReform.first == true then
							roleDialogue.control.loadSpeak(2390)
						end
					end
				elseif iter_3_0 == 4 and mainCity.control.displayIron ~= 0 and arg_3_0[iter_3_0].totalGemOutPut and arg_3_0[iter_3_0].totalGemOutPut > 0 then
					local var_3_14 = language.get(490931, arg_3_0[iter_3_0].totalGemOutPut, language.get(10106))

					mainCity.ui.table.city_title_bg_gem:setVisible(true)
					mainCity.ui.table.city_title_gem:setVisible(true)
					mainCity.ui.table.city_title_gem:setString(var_3_14)
				end
			end

			log.info("@@ 是否拥有政务事件 ", arg_3_0[iter_3_0].hasEvent)
		else
			mainCity.ui.table["city_" .. tostring(iter_3_0)]:setVisible(false)
			mainCity.ui.table["city_effect_" .. tostring(iter_3_0)]:setVisible(false)
			mainCity.ui.table["city_icon_" .. tostring(iter_3_0)]:setVisible(false)

			if iter_3_0 == 6 then
				for iter_3_5 = 1, 4 do
					mainCity.ui.table["city_title_bg_6" .. tostring(iter_3_5)]:setVisible(false)
					mainCity.ui.table["city_title_6" .. tostring(iter_3_5)]:setVisible(false)
				end
			else
				mainCity.ui.table["city_icon_up_" .. tostring(iter_3_0)]:setVisible(false)
				mainCity.ui.table["city_title_bg_" .. tostring(iter_3_0)]:setVisible(false)
				mainCity.ui.table["city_title_" .. tostring(iter_3_0)]:setVisible(false)
			end
		end
	end

	if arg_3_0.mohistReform then
		if arg_3_0.mohistReform.drawingNum then
			user.mojia.mohistDrawingNum = arg_3_0.mohistReform.drawingNum
		end

		local var_3_15 = false

		if arg_3_0.mohistReform.needCompleteAreaId and arg_3_0.mohistReform.needCompleteAreaId > 0 then
			user.mojia.regionalId = arg_3_0.mohistReform.needCompleteAreaId

			mainCity.control.addMoJiaRemouldButton(arg_3_0.mohistReform.needCompleteAreaId)

			var_3_15 = true
		end

		if arg_3_0.mohistReform.currReformAreaId and arg_3_0.mohistReform.currReformAreaId > 0 and not var_3_15 then
			mainCity.control.addMoJiaTag(arg_3_0.mohistReform.currReformAreaId)
		end

		if arg_3_0.mohistReform.mohistRewardArray then
			for iter_3_6, iter_3_7 in ipairs(arg_3_0.mohistReform.mohistRewardArray) do
				print(iter_3_6, iter_3_7)

				if iter_3_7 then
					mainCity.control.addMoJiaReward(iter_3_6, iter_3_7)
				end
			end
		end
	end

	smgr.getLayer("mainCityLayer"):setVisible(true)
end

function mainCity.ui.showMail()
	local var_4_0 = #mainCity.control.mailInfo

	if var_4_0 > 0 then
		local var_4_1 = smgr.getLayer("mainCityLayer")

		if menuUI.ui.table.mailSprite == nil then
			local var_4_2 = CCArray:create()
			local var_4_3 = CCSprite:create("res/ui/mainCity/icon_mail.png")
			local var_4_4 = CCSprite:create("res/ui/mainCity/icon_mail_l.png")

			var_4_2:addObject(var_4_3:displayFrame())
			var_4_2:addObject(var_4_4:displayFrame())

			local var_4_5 = CCAnimation:createWithSpriteFrames(var_4_2, 0.5)
			local var_4_6 = CCAnimate:create(var_4_5)
			local var_4_7 = CCArray:create()

			var_4_7:addObject(var_4_6)

			local var_4_8 = CCSequence:create(var_4_7)
			local var_4_9 = CCRepeatForever:create(tolua.cast(var_4_8, "CCActionInterval"))
			local var_4_10 = CCSprite:create()

			var_4_10:setPosition(ccp(visibleSize.width / 2, 150))
			var_4_10:runAction(var_4_9)
			var_4_10:setVisible(true)

			menuUI.ui.table.mailSprite = var_4_10

			local var_4_11 = CCStrokeLabelTTF:create(tostring(var_4_0), "", 20)

			var_4_11:setPosition(ccp(88, 35))
			var_4_10:addChild(var_4_11, 1)

			menuUI.ui.table.mailCount = var_4_11

			var_4_1:addChild(var_4_10, 10000)
		end

		local var_4_12 = CCSprite:create("res/ui/mainCity/icon_mail.png")
		local var_4_13 = CCSprite:create("res/ui/mainCity/icon_mail.png")
		local var_4_14 = CCMenuItemSprite:create(var_4_12, var_4_13)

		var_4_14:registerScriptTapHandler(mainCity.ui.clickMail)
		var_4_14:setPosition(ccp(visibleSize.width / 2, 150))

		local var_4_15 = CCMenu:createWithItem(var_4_14)

		var_4_15:setPosition(ccp(0, 0))
		var_4_1:addChild(var_4_15, 9999)

		mainCity.ui.table.mailMenu = var_4_15
	else
		mainCity.ui.table.mailMenu:setVisible(false)
	end
end

function mainCity.ui.clickMail()
	if mainCity.ui.table.mailLayer == nil then
		local var_5_0 = createBaseLayer()
		local var_5_1 = CCScale9Sprite:createWithSpriteFrameName("commanWindow.png", CCRectMake(20, 85, 1, 1))

		var_5_1:setPreferredSize(CCSizeMake(570, 600))
		var_5_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
		var_5_0:addChild(var_5_1, 1)

		local var_5_2 = CCSprite:create("res/ui/mainCity/mail_bg2.jpg")

		var_5_2:setPosition(ccp(285, 285))
		var_5_1:addChild(var_5_2, 2)

		local var_5_3 = CCStrokeLabelTTF:create("", "", 26)

		var_5_3:setPosition(ccp(285, 566))
		var_5_3:setColor(ccc3(255, 255, 196))
		var_5_1:addChild(var_5_3, 3)

		mainCity.ui.table.mail_title = var_5_3

		local var_5_4 = CCStrokeLabelTTF:create(language.get(170012), "", 20)

		var_5_4:setAnchorPoint(ccp(0, 0.5))
		var_5_4:setPosition(ccp(20, 510))
		var_5_3:setColor(ccc3(250, 248, 190))
		var_5_1:addChild(var_5_4)

		local var_5_5 = CCStrokeLabelTTF:create("", "", 20)

		var_5_5:setPosition(ccp(170, 510))
		var_5_5:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_5_5:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_5_5:setDimensions(CCSizeMake(200, 30))
		var_5_5:setColor(ccc3(250, 248, 190))
		var_5_5:setAnchorPoint(ccp(0, 0.5))
		var_5_5:setPosition(ccp(var_5_4:getPositionX() + var_5_4:getContentSize().width, 510))
		var_5_1:addChild(var_5_5)

		mainCity.ui.table.mail_zhuti = var_5_5

		local var_5_6 = CCStrokeLabelTTF:create("", "", 20)

		var_5_6:setPosition(ccp(275, 200))
		var_5_6:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_5_6:setVerticalAlignment(kCCVerticalTextAlignmentTop)
		var_5_6:setDimensions(CCSizeMake(510, 370))
		var_5_6:setColor(ccc3(250, 248, 190))
		var_5_2:addChild(var_5_6, 2)

		mainCity.ui.table.mail_context = var_5_6

		local var_5_7 = CCSprite:createWithSpriteFrameName("btn2_gre_a.png")
		local var_5_8 = CCSprite:createWithSpriteFrameName("btn2_gre_c.png")
		local var_5_9 = CCMenuItemSprite:create(var_5_7, var_5_8)

		var_5_9:registerScriptTapHandler(mainCity.ui.clickMailNext)
		var_5_9:setPosition(ccp(285, 50))

		local var_5_10 = CCSprite:createWithSpriteFrameName("btn_close_a.png")
		local var_5_11 = CCSprite:createWithSpriteFrameName("btn_close_c.png")
		local var_5_12 = CCMenuItemSprite:create(var_5_10, var_5_11)

		var_5_12:registerScriptTapHandler(mainCity.ui.clickCloseMail)
		var_5_12:setPosition(ccp(527, 562))
		var_5_12:setScale(1.5)

		local var_5_13 = CCMenu:create()

		var_5_13:addChild(var_5_9)
		var_5_13:addChild(var_5_12)
		var_5_13:setPosition(ccp(0, 0))
		var_5_1:addChild(var_5_13, 9999)

		local var_5_14 = CCStrokeLabelTTF:create("", "", 20)

		var_5_14:setPosition(ccp(285, 50))
		var_5_1:addChild(var_5_14, 10000)

		mainCity.ui.table.mail_btnText = var_5_14

		smgr.getLayer("topLayer"):addChild(var_5_0, 10000)

		mainCity.ui.table.mailLayer = var_5_0

		var_5_0:registerScriptTouchHandler(mainCity.ui.onTouch, false, true)
		var_5_0:setTouchEnabled(true)
	end

	mainCity.ui.showSingleMail(mainCity.control.mailInfo[1])
end

function mainCity.ui.onTouch()
	return true
end

function mainCity.ui.clickCloseMail()
	smgr.getLayer("topLayer"):removeChild(mainCity.ui.table.mailLayer, true)

	mainCity.ui.table.mailLayer = nil
end

function mainCity.ui.clickMailNext()
	local var_8_0 = mainCity.control.mailInfo[1].id

	cmgr.sendRequest(nil, actions.deleteMail, var_8_0)
	table.remove(mainCity.control.mailInfo, 1)

	if #mainCity.control.mailInfo == 0 then
		smgr.getLayer("topLayer"):removeChild(mainCity.ui.table.mailLayer, true)

		mainCity.ui.table.mailLayer = nil

		mainCity.ui.table.mailMenu:setVisible(false)
		menuUI.ui.table.mailSprite:setVisible(false)

		user.hasNewMail = false
	else
		local var_8_1 = mainCity.control.mailInfo[1]

		mainCity.ui.showSingleMail(var_8_1)
	end
end

function mainCity.ui.showSingleMail(arg_9_0)
	mainCity.ui.table.mail_title:setString(arg_9_0.title)
	mainCity.ui.table.mail_zhuti:setString(os.date("%m-%d %H:%M", math.floor(arg_9_0.sendtime / 1000)))

	local var_9_0 = ""
	local var_9_1 = require("lua/common/html").parsestr(arg_9_0.content)

	if var_9_1 then
		local var_9_2 = {}

		require("lua/component/HtmlView"):parseHtmlToList(var_9_1, var_9_2)

		local var_9_3 = {}

		for iter_9_0, iter_9_1 in pairs(var_9_2) do
			local var_9_4

			if iter_9_1.type == "label" then
				var_9_0 = var_9_0 .. iter_9_1.text
			end
		end
	else
		var_9_0 = arg_9_0.content
	end

	mainCity.ui.table.mail_context:setString(var_9_0)

	local var_9_5 = #mainCity.control.mailInfo

	if var_9_5 == 1 then
		mainCity.ui.table.mail_btnText:setString(language.get(170014))
	else
		mainCity.ui.table.mail_btnText:setString(language.get(170013))
	end

	menuUI.ui.table.mailCount:setString(var_9_5)
end

function mainCity.ui.addGuide()
	return
end

function mainCity.ui.delGuide()
	guide.ui.setVisible(false)
end

function mainCity.ui.onEnter()
	log.info("enter maincity layer  ... ")
	menuUI.ui.show()
	playerInfoUI.show()
	eventManager.registerEvent("refreshMainCityLayer", mainCity.control.getMainCityInfo)
	cmgr.registerResponseHandler(actions.pushMohist, mainCity.control.handlerPushMohistAction)
	mainCity.ui.addGuide()
	showFpsStats(true)
end

function mainCity.ui.onExit()
	log.info("exit maincity layer  ... ")
	eventManager.unregisterEvent("refreshMainCityLayer", mainCity.control.getMainCityInfo)
	cmgr.unregisterResponseHandler(actions.pushMohist, mainCity.control.handlerPushMohistAction)
	mainCity.ui.delGuide()
end

function mainCity.ui.calculateScale()
	local var_14_0 = 1136
	local var_14_1 = 768
	local var_14_2 = visibleSize.width
	local var_14_3 = visibleSize.height
	local var_14_4 = var_14_2 / var_14_0
	local var_14_5 = var_14_2 / var_14_0
	local var_14_6 = var_14_4

	if var_14_4 < var_14_5 then
		var_14_6 = var_14_5
	end

	return var_14_6
end

function mainCity.ui.show()
	CCTextureCache:sharedTextureCache():removeUnusedTextures()

	if not rmgr.isNotComplete() then
		rmgr.loadResource("res/ui/mainCity/mainCityRemould.plist")
	end

	rmgr.loadResource("res/anim/resourceAnim/jinguangAnim.plist")

	local var_15_0 = createBaseLayer()

	smgr.registerLayer(var_15_0, "mainCityLayer")

	mainCity.ui.needRefreshObject = {}
	mainCity.ui.table = autoUI.initUI(var_15_0, getMainCityUiData())

	var_15_0:setTouchEnabled(true)
	var_15_0:setVisible(false)
	mainCity.control.getMainCityInfo()
	var_15_0:registerScriptTouchHandler(mainCity.control.onTouch)

	var_15_0.onEnter = mainCity.ui.onEnter
	var_15_0.onExit = mainCity.ui.onExit

	require("lua/guide/control")

	guide.uiElementsTable.city = {}
	guide.uiElementsTable.city[1] = mainCity.ui.table.city_1
	guide.uiElementsTable.city[2] = mainCity.ui.table.city_2
	guide.uiElementsTable.city[3] = mainCity.ui.table.city_3
	guide.uiElementsTable.city[4] = mainCity.ui.table.city_5
	guide.uiElementsTable.city[5] = mainCity.ui.table.city_6
	guide.uiElementsTable.city[6] = mainCity.ui.table.city_4

	return var_15_0
end

function mainCity.control.action_hammer(arg_16_0)
	if arg_16_0 >= 1 and arg_16_0 <= 5 then
		local var_16_0 = CCSprite:create("res/ui/resourceArea2/btn_buil_rise_big_bg.png")

		var_16_0:setPosition(ccp(106, -25))
		mainCity.ui.table["city_title_bg_" .. arg_16_0]:addChild(var_16_0)

		local var_16_1 = CCSprite:create("res/ui/resourceArea2/btn_buil_rise_big.png")

		var_16_1:setPosition(ccp(54, 16))
		var_16_0:addChild(var_16_1)
		var_16_1:setAnchorPoint(ccp(1, 0))

		local var_16_2 = CCArray:create()

		var_16_2:addObject(CCRotateBy:create(0.1, 15))
		var_16_2:addObject(CCRotateBy:create(0.1, -25))
		var_16_2:addObject(CCRotateBy:create(0.1, 10))
		var_16_1:runAction(CCRepeatForever:create(CCSequence:create(var_16_2)))
		table.insert(mainCity.ui.needRefreshObject, var_16_0)
	end
end

function mainCity.control.addLuomuTag(arg_17_0, arg_17_1)
	if arg_17_0 >= 1 and arg_17_0 <= 5 then
		local var_17_0 = CCSprite:create("res/ui/resourceArea2/wood_gaizao/mcgz_btn_npc.png")

		var_17_0:setPosition(ccp(var_0_0[arg_17_0].x + 3, var_0_0[arg_17_0].y + 85))

		local var_17_1 = CCSprite:create("res/ui/resourceArea2/wood_gaizao/tuzhi.png")

		var_17_1:setScale(0.6)
		var_17_1:setPosition(ccp(30, 22))
		var_17_0:addChild(var_17_1)

		local var_17_2 = CCStrokeLabelTTF:create(arg_17_1 or 0, "Thonburi-Bold", 22)

		var_17_2:setColor(ccc3(237, 209, 169))
		var_17_2:setPosition(ccp(45, 22))
		var_17_2:setAnchorPoint(ccp(0, 0.5))
		var_17_0:addChild(var_17_2)
		smgr.getLayer("mainCityLayer"):addChild(var_17_0, 20)
		table.insert(mainCity.ui.needRefreshObject, var_17_0)
	end
end

function mainCity.control.addZhougongTag(arg_18_0, arg_18_1)
	if arg_18_0 >= 1 and arg_18_0 <= 5 then
		local var_18_0 = CCSprite:create("res/ui/resourceArea2/wood_gaizao2/mczgz_btn_npc.png")

		var_18_0:setPosition(ccp(var_0_0[arg_18_0].x + 3, var_0_0[arg_18_0].y + 85))

		local var_18_1 = CCSprite:create("res/ui/resourceArea2/wood_gaizao/tuzhi.png")

		var_18_1:setScale(0.6)
		var_18_1:setPosition(ccp(30, 22))
		var_18_0:addChild(var_18_1)

		local var_18_2 = CCStrokeLabelTTF:create(arg_18_1 or 0, "Thonburi-Bold", 22)

		var_18_2:setColor(ccc3(237, 209, 169))
		var_18_2:setPosition(ccp(45, 22))
		var_18_2:setAnchorPoint(ccp(0, 0.5))
		var_18_0:addChild(var_18_2)
		smgr.getLayer("mainCityLayer"):addChild(var_18_0, 20)
		table.insert(mainCity.ui.needRefreshObject, var_18_0)
	end
end

function mainCity.control.addMaJunTag(arg_19_0, arg_19_1)
	if arg_19_0 >= 1 and arg_19_0 <= 5 then
		local var_19_0 = CCSprite:create("res/ui/resourceArea2/food_gaizao/ntgz_btn_npc.png")

		var_19_0:setPosition(ccp(var_0_0[arg_19_0].x - 10, var_0_0[arg_19_0].y + 85))

		local var_19_1 = CCSprite:create("res/ui/resourceArea2/wood_gaizao/tuzhi.png")

		var_19_1:setScale(0.6)
		var_19_1:setPosition(ccp(30, 22))
		var_19_0:addChild(var_19_1)

		local var_19_2 = CCStrokeLabelTTF:create(arg_19_1 or 0, "Thonburi-Bold", 22)

		var_19_2:setColor(ccc3(237, 209, 169))
		var_19_2:setPosition(ccp(45, 22))
		var_19_2:setAnchorPoint(ccp(0, 0.5))
		var_19_0:addChild(var_19_2)
		smgr.getLayer("mainCityLayer"):addChild(var_19_0, 20)
		table.insert(mainCity.ui.needRefreshObject, var_19_0)
	end
end

function mainCity.control.addMoJiaTag(arg_20_0)
	if arg_20_0 >= 1 and arg_20_0 <= 5 then
		local var_20_0 = CCSprite:create("res/ui/resourceArea2/mojia_gaizao/zcgz2_icon_gznpc.png")

		var_20_0:setPosition(var_0_0[arg_20_0])
		smgr.getLayer("mainCityLayer"):addChild(var_20_0, 20)
		table.insert(mainCity.ui.needRefreshObject, var_20_0)
	end
end

function mainCity.control.addMoJiaReward(arg_21_0, arg_21_1)
	if arg_21_1 and arg_21_1.rewardType then
		mainCity.ui.table["city_title_bg_" .. tostring(arg_21_0)]:setVisible(false)
		mainCity.ui.table["city_title_" .. tostring(arg_21_0)]:setVisible(false)
		mainCity.ui.table["city_icon_up_" .. tostring(arg_21_0)]:setVisible(false)

		if arg_21_0 == 2 then
			mainCity.ui.table.city_title_bg_silk:setVisible(false)
			mainCity.ui.table.city_title_silk:setVisible(false)
		end

		local var_21_0 = CCScale9Sprite:create("res/ui/resourceArea2/mojia_gaizao/zcgz2_btn_" .. arg_21_1.rewardType .. ".png")
		local var_21_1 = CCControlButton:create(var_21_0)

		var_21_1:setAdjustBackgroundImage(false)
		var_21_1:setZoomOnTouchDown(false)
		var_21_1:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/resourceArea2/mojia_gaizao/zcgz2_btn_" .. arg_21_1.rewardType .. "_c.png"), CCControlStateHighlighted)
		var_21_1:setPosition(var_0_0[arg_21_0])

		local var_21_2 = CCStrokeLabelTTF:create(arg_21_1.rewardNum or 0, "Thonburi-Bold", 22)

		var_21_2:setColor(ccc3(237, 209, 169))
		var_21_2:setPosition(ccp(45, 22))
		var_21_2:setAnchorPoint(ccp(0, 0.5))
		var_21_1:addChild(var_21_2)

		local var_21_3 = CCSprite:create("res/ui/resourceArea2/mojia_gaizao/zcgz2_word_di.png")

		var_21_3:setPosition(ccp(52, -5))
		var_21_1:addChild(var_21_3)

		if arg_21_1.cd and arg_21_1.cd > 0 then
			local var_21_4 = createTimerLabel(arg_21_1.cd, "@M:@S" .. language.get(217418), "Thonburi", 18, function()
				return
			end, nil, nil, ccc3(237, 209, 169))

			var_21_4:setAnchorPoint(ccp(0.5, 0.5))
			var_21_4:setPosition(ccp(52, -5))
			var_21_1:addChild(var_21_4)
		else
			local var_21_5 = CCStrokeLabelTTF:create(language.get(217417), "Thonburi-Bold", 22)

			var_21_5:setColor(ccc3(0, 255, 0))
			var_21_5:setPosition(ccp(52, -5))
			var_21_5:setAnchorPoint(ccp(0.5, 0.5))
			var_21_1:addChild(var_21_5)
		end

		var_21_1:addHandleOfControlEvent(function(...)
			cmgr.sendRequest(function(arg_24_0)
				local var_24_0 = arg_24_0.action.data

				if var_24_0.firstReward then
					roleDialogue.control.loadSpeak("moJiaBuild5")
				end

				if var_24_0.rewards then
					local var_24_1 = var_24_0.rewards
					local var_24_2 = {}

					for iter_24_0 = 1, #var_24_1 do
						local var_24_3 = var_24_1[iter_24_0]
						local var_24_4 = {
							id = var_0_2[var_24_3.type],
							value = var_24_3.num
						}

						table.insert(var_24_2, var_24_4)
					end

					globalAction_gotResource(var_24_2)
					mainCity.control.getMainCityInfo()
				end
			end, actions.mohistRecvDailyReward, arg_21_0)
		end, CCControlEventTouchUpInside)
		smgr.getLayer("mainCityLayer"):addChild(var_21_1, 20)
		table.insert(mainCity.ui.needRefreshObject, var_21_1)
	end
end

function mainCity.control.addRemouldTag(arg_25_0)
	if arg_25_0 >= 1 and arg_25_0 <= 5 then
		local var_25_0 = CCSprite:create("res/ui/mainCity/zcgz_btn_lbhr.png")

		var_25_0:setScale(0.7)
		var_25_0:setPosition(ccp(var_0_0[arg_25_0].x, var_0_0[arg_25_0].y + 60))
		smgr.getLayer("mainCityLayer"):addChild(var_25_0, 20)
		table.insert(mainCity.ui.needRefreshObject, var_25_0)
	end
end

function mainCity.control.addMoJiaRemouldButton(arg_26_0)
	if arg_26_0 >= 1 and arg_26_0 <= 5 then
		local var_26_0 = CCScale9Sprite:create("res/ui/resourceArea2/zcgz_btn_round.png")
		local var_26_1 = CCControlButton:create(var_26_0)

		var_26_1:setAdjustBackgroundImage(false)
		var_26_1:setZoomOnTouchDown(false)
		var_26_1:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/resourceArea2/zcgz_btn_round_c.png"), CCControlStateHighlighted)
		var_26_1:setPosition(var_0_0[arg_26_0])
		var_26_1:addHandleOfControlEvent(function()
			cmgr.sendRequest(function(arg_28_0)
				local var_28_0 = arg_28_0.action.data

				user.mojia.allMohistReformDone = var_28_0.allMohistReformDone

				var_26_1:removeFromParentAndCleanup(true)

				local var_28_1 = CCSprite:create("res/ui/mainCity/chui.png")

				var_28_1:setAnchorPoint(ccp(0.5, 0))

				local var_28_2 = CCArray:create()

				for iter_28_0 = 1, 3 do
					var_28_2:addObject(CCRotateTo:create(0.18, -90))
					var_28_2:addObject(CCDelayTime:create(0.03))
					var_28_2:addObject(CCRotateTo:create(0.1, 0))
				end

				var_28_2:addObject(CCCallFunc:create(function(...)
					var_28_1:removeFromParentAndCleanup(true)

					if user.mojia.allMohistReformDone then
						roleDialogue.control.loadSpeak("moJiaBuild9")
					end

					mainCity.ui.showMoJiaReformAnimation()
					mainCity.control.getMainCityInfo()
				end))
				var_28_1:runAction(CCSequence:create(var_28_2))
				var_28_1:setPosition(var_0_0[arg_26_0])
				smgr.getLayer("mainCityLayer"):addChild(var_28_1, 20)
			end, actions.mohistComplete)
		end, CCControlEventTouchUpInside)

		local var_26_2 = CCSprite:create("res/ui/mainCity/chui1.png")

		var_26_2:setPosition(ccp(var_26_1:getContentSize().width / 2 - 5, var_26_1:getContentSize().height / 2 + 5))

		local var_26_3 = CCSprite:create("res/ui/mainCity/zcgz_area_gzhc_gz_word.png")

		var_26_3:setPosition(ccp(var_26_1:getContentSize().width / 2, 5))
		var_26_1:addChild(var_26_3)
		var_26_1:addChild(var_26_2)

		local var_26_4 = CCSprite:create("res/ui/guide/jiantou-shang.png")

		var_26_4:setPosition(ccp(var_26_1:getContentSize().width / 2, -20))
		var_26_1:addChild(var_26_4)

		local var_26_5 = CCJumpBy:create(1, ccp(0, 0), -40, 1)

		var_26_4:runAction(CCRepeatForever:create(var_26_5))
		smgr.getLayer("mainCityLayer"):addChild(var_26_1, 20)
		table.insert(mainCity.ui.needRefreshObject, var_26_1)
	end
end

function mainCity.ui.showMoJiaReformAnimation()
	user.mojia.regionalId = user.mojia.regionalId or 2
	user.mojia.regionalName = var_0_1[user.mojia.regionalId]

	mainCity.ui.table.investment:setVisible(false)

	local var_30_0 = CCSprite:create()

	var_30_0:setScale(1.5)
	var_30_0:setPosition(ccp(visibleSize.width / 2 + 230, 195 + visibleSize.height / 2))

	local var_30_1 = CCArray:create()

	var_30_1:addObject(repeatF)
	var_30_1:addObject(CCCallFunc:create(function(...)
		var_30_0:removeFromParentAndCleanup(true)

		local var_31_0 = CCArray:create()

		var_31_0:addObject(CCDelayTime:create(0.5))
		var_31_0:addObject(CCShow:create())
		var_31_0:addObject(CCHide:create())
		var_31_0:addObject(CCCallFunc:create(function(...)
			local var_32_0 = CCSprite:create("res/ui/resourceArea2/mojia_gaizao/zcgz2_word_" .. user.mojia.regionalId .. ".png")
			local var_32_1 = CCSprite:create("res/ui/resourceArea2/mojia_gaizao/zcgz2_word_jg.png")

			var_32_0:setPosition(ccp(visibleSize.width / 2 + 200, visibleSize.height / 2 + 100))
			var_32_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 50))
			var_32_1:setVisible(false)
			var_32_1:setScale(5)

			local var_32_2 = CCArray:create()

			var_32_2:addObject(CCMoveTo:create(0.2, ccp(visibleSize.width / 2, visibleSize.height / 2 + 100)))
			var_32_2:addObject(CCDelayTime:create(0.3))
			var_32_2:addObject(CCTargetedAction:create(var_32_1, CCShow:create()))
			var_32_2:addObject(CCTargetedAction:create(var_32_1, CCScaleTo:create(0.2, 1)))
			var_32_2:addObject(CCDelayTime:create(1))
			var_32_2:addObject(CCCallFunc:create(function(...)
				var_32_0:removeFromParentAndCleanup(true)
				var_32_1:removeFromParentAndCleanup(true)
			end))
			var_32_0:runAction(CCSequence:create(var_32_2))
			mainCity.control.getMainCityInfo()
			smgr.getLayer("mainCityLayer"):addChild(var_32_0, 1001)
			smgr.getLayer("mainCityLayer"):addChild(var_32_1, 1001)
		end))
		mainCity.ui.table.wall:runAction(CCSequence:create(var_31_0))
		mainCity.ui.table.bg2:setVisible(true)
	end))
	var_30_0:runAction(CCSequence:create(var_30_1))
	smgr.getLayer("mainCityLayer"):addChild(var_30_0, 20)
end

function mainCity.ui.showMoJiaReformMainCityAnimation()
	mainCity.ui.table.investment:setVisible(false)

	local var_34_0 = CCSprite:create()

	var_34_0:setScale(1.5)
	var_34_0:setPosition(ccp(visibleSize.width / 2 + 230, 195 + visibleSize.height / 2))

	local var_34_1 = CCArray:create()

	for iter_34_0 = 1, 12 do
		local var_34_2 = tool.spriteFrameByName(string.format("mainCityRemould%s.png", iter_34_0))

		var_34_1:addObject(var_34_2)
	end

	local var_34_3 = CCAnimation:createWithSpriteFrames(var_34_1, 0.06)
	local var_34_4 = CCAnimate:create(var_34_3)
	local var_34_5 = CCRepeat:create(var_34_4, 1)
	local var_34_6 = CCArray:create()

	var_34_6:addObject(var_34_5)
	var_34_6:addObject(CCCallFunc:create(function(...)
		var_34_0:removeFromParentAndCleanup(true)

		local var_35_0 = CCSprite:create()

		var_35_0:setScale(3)

		local var_35_1 = CCArray:create()

		for iter_35_0 = 1, 35 do
			local var_35_2 = string.format("建造完成发光-12%04.f.png", iter_35_0)
			local var_35_3 = tool.spriteFrameByName(string.format("建造完成发光-12%04.f.png", iter_35_0))

			var_35_1:addObject(var_35_3)
		end

		local var_35_4 = CCAnimation:createWithSpriteFrames(var_35_1, 0.05)
		local var_35_5 = CCAnimate:create(var_35_4)

		var_35_0:setPosition(ccp(visibleSize.width / 2 + 230, 345 + visibleSize.height / 2))
		smgr.getLayer("mainCityLayer"):addChild(var_35_0, 101)
		var_35_0:runAction(var_35_5)

		local var_35_6 = CCArray:create()

		var_35_6:addObject(CCDelayTime:create(0.5))
		var_35_6:addObject(CCShow:create())

		for iter_35_1 = 1, 3 do
			var_35_6:addObject(CCFadeIn:create(0.2))
			var_35_6:addObject(CCFadeOut:create(0.2))
		end

		var_35_6:addObject(CCHide:create())
		var_35_6:addObject(CCCallFunc:create(function(...)
			local var_36_0 = CCSprite:create("res/ui/resourceArea2/mojia_gaizao/zcgz2_word_zcgz.png")
			local var_36_1 = CCSprite:create("res/ui/resourceArea2/mojia_gaizao/zcgz2_word_jg.png")

			var_36_0:setPosition(ccp(visibleSize.width / 2 + 200, visibleSize.height / 2 + 100))
			var_36_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 50))
			var_36_1:setVisible(false)
			var_36_1:setScale(5)

			local var_36_2 = CCArray:create()

			var_36_2:addObject(CCMoveTo:create(0.2, ccp(visibleSize.width / 2, visibleSize.height / 2 + 100)))
			var_36_2:addObject(CCDelayTime:create(0.3))
			var_36_2:addObject(CCTargetedAction:create(var_36_1, CCShow:create()))
			var_36_2:addObject(CCTargetedAction:create(var_36_1, CCScaleTo:create(0.2, 1)))
			var_36_2:addObject(CCDelayTime:create(1))
			var_36_2:addObject(CCCallFunc:create(function(...)
				var_36_0:removeFromParentAndCleanup(true)
				var_36_1:removeFromParentAndCleanup(true)
				roleDialogue.control.loadSpeak(1930)
			end))
			var_36_0:runAction(CCSequence:create(var_36_2))
			mainCity.control.getMainCityInfo()
			smgr.getLayer("mainCityLayer"):addChild(var_36_0, 1001)
			smgr.getLayer("mainCityLayer"):addChild(var_36_1, 1001)
		end))
		mainCity.ui.table.wall:runAction(CCSequence:create(var_35_6))
		mainCity.ui.table.bg2:setVisible(true)
		mainCity.ui.table.bg2:setOpacity(0)
		mainCity.ui.table.bg2:runAction(CCFadeIn:create(0.5))
	end))
	var_34_0:runAction(CCSequence:create(var_34_6))
	smgr.getLayer("mainCityLayer"):addChild(var_34_0, 20)
end

function mainCity.control.addRemouldButton(arg_38_0)
	if arg_38_0 >= 1 and arg_38_0 <= 5 then
		local var_38_0 = CCScale9Sprite:create("res/ui/resourceArea2/zcgz_btn_round.png")
		local var_38_1 = CCControlButton:create(var_38_0)

		var_38_1:setAdjustBackgroundImage(false)
		var_38_1:setZoomOnTouchDown(false)
		var_38_1:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/resourceArea2/zcgz_btn_round_c.png"), CCControlStateHighlighted)
		var_38_1:setPosition(var_0_0[arg_38_0])
		var_38_1:addHandleOfControlEvent(function()
			cmgr.sendRequest(function(...)
				var_38_1:removeFromParentAndCleanup(true)

				local var_40_0 = CCSprite:create("res/ui/mainCity/chui.png")

				var_40_0:setAnchorPoint(ccp(0.5, 0))

				local var_40_1 = CCArray:create()

				for iter_40_0 = 1, 3 do
					var_40_1:addObject(CCRotateTo:create(0.18, -90))
					var_40_1:addObject(CCDelayTime:create(0.03))
					var_40_1:addObject(CCRotateTo:create(0.1, 0))
				end

				var_40_1:addObject(CCCallFunc:create(function(...)
					var_40_0:removeFromParentAndCleanup(true)
					globalAction_flyNode(CCSprite:create("res/ui/mainCity/zcgz_word_qygzwc.png"))

					if arg_38_0 == 1 then
						roleDialogue.control.loadSpeak(1924)
					elseif arg_38_0 == 2 then
						roleDialogue.control.loadSpeak(1925)
					elseif arg_38_0 == 3 then
						roleDialogue.control.loadSpeak(1926)
					elseif arg_38_0 == 4 then
						roleDialogue.control.loadSpeak(1927)
					elseif arg_38_0 == 5 then
						roleDialogue.control.loadSpeak(1928)
					elseif arg_38_0 == 6 then
						-- block empty
					end

					mainCity.control.getMainCityInfo()
				end))
				var_40_0:runAction(CCSequence:create(var_40_1))
				var_40_0:setPosition(var_0_0[arg_38_0])
				smgr.getLayer("mainCityLayer"):addChild(var_40_0, 20)
			end, actions.reformArea, arg_38_0)
		end, CCControlEventTouchUpInside)

		local var_38_2 = CCSprite:create("res/ui/mainCity/chui1.png")

		var_38_2:setPosition(ccp(var_38_1:getContentSize().width / 2 - 5, var_38_1:getContentSize().height / 2 + 5))

		local var_38_3 = CCSprite:create("res/ui/mainCity/zcgz_area_gzhc_gz_word.png")

		var_38_3:setPosition(ccp(var_38_1:getContentSize().width / 2, 5))
		var_38_1:addChild(var_38_3)
		var_38_1:addChild(var_38_2)
		smgr.getLayer("mainCityLayer"):addChild(var_38_1, 20)
		table.insert(mainCity.ui.needRefreshObject, var_38_1)
	end
end

function mainCity.ui.removeAllNeedRefreshObject()
	for iter_42_0, iter_42_1 in pairs(mainCity.ui.needRefreshObject) do
		if not tolua.isnull(iter_42_1) and iter_42_1:getParent() then
			iter_42_1:removeFromParentAndCleanup(true)
		end
	end

	mainCity.ui.needRefreshObject = {}
end

function mainCity.ui.onKnockClicked(arg_43_0, arg_43_1)
	cmgr.sendRequest(function()
		mainCity.ui.showKnockAnimation()
		arg_43_1:removeFromParentAndCleanup(true)
	end, actions.buildingKnock)
end

function mainCity.ui.showKnockAnimation()
	mainCity.ui.table.investment:setVisible(false)

	local var_45_0 = CCSprite:create()

	var_45_0:setScale(1.5)
	var_45_0:setPosition(ccp(visibleSize.width / 2 + 230, 195 + visibleSize.height / 2))

	local var_45_1 = CCArray:create()

	for iter_45_0 = 1, 12 do
		local var_45_2 = tool.spriteFrameByName(string.format("mainCityRemould%s.png", iter_45_0))

		var_45_1:addObject(var_45_2)
	end

	local var_45_3 = CCAnimation:createWithSpriteFrames(var_45_1, 0.06)
	local var_45_4 = CCAnimate:create(var_45_3)
	local var_45_5 = CCRepeat:create(var_45_4, 1)
	local var_45_6 = CCArray:create()

	var_45_6:addObject(var_45_5)
	var_45_6:addObject(CCCallFunc:create(function(...)
		var_45_0:removeFromParentAndCleanup(true)

		local var_46_0 = CCSprite:create("res/ui/mainCity/zcgz_word_jdts.png")

		var_46_0:runAction(CCSequence:createWithTwoActions(CCMoveBy:create(0.5, ccp(0, 100)), CCCallFuncN:create(function(arg_47_0)
			arg_47_0:removeFromParentAndCleanup(true)
			mainCity.control.getMainCityInfo()
		end)))
		var_46_0:setPosition(var_0_0[6])
		smgr.getLayer("mainCityLayer"):addChild(var_46_0, 30)
	end))
	var_45_0:runAction(CCSequence:create(var_45_6))
	smgr.getLayer("mainCityLayer"):addChild(var_45_0, 20)
end

function mainCity.ui.onHallsReformClicked(arg_48_0, arg_48_1)
	cmgr.sendRequest(function()
		arg_48_1:removeFromParentAndCleanup(true)
		mainCity.ui.showHallsReformAnimation()
	end, actions.hallsReform)
end

function mainCity.ui.showHallsReformAnimation()
	mainCity.ui.table.investment:setVisible(false)

	local var_50_0 = CCSprite:create()

	var_50_0:setScale(1.5)
	var_50_0:setPosition(ccp(visibleSize.width / 2 + 230, 195 + visibleSize.height / 2))

	local var_50_1 = CCArray:create()

	for iter_50_0 = 1, 12 do
		local var_50_2 = tool.spriteFrameByName(string.format("mainCityRemould%s.png", iter_50_0))

		var_50_1:addObject(var_50_2)
	end

	local var_50_3 = CCAnimation:createWithSpriteFrames(var_50_1, 0.06)
	local var_50_4 = CCAnimate:create(var_50_3)
	local var_50_5 = CCRepeat:create(var_50_4, 1)
	local var_50_6 = CCArray:create()

	var_50_6:addObject(var_50_5)
	var_50_6:addObject(CCCallFunc:create(function(...)
		var_50_0:removeFromParentAndCleanup(true)

		local var_51_0 = CCSprite:create()

		var_51_0:setScale(3)

		local var_51_1 = CCArray:create()

		for iter_51_0 = 1, 35 do
			local var_51_2 = string.format("建造完成发光-12%04.f.png", iter_51_0)
			local var_51_3 = tool.spriteFrameByName(string.format("建造完成发光-12%04.f.png", iter_51_0))

			var_51_1:addObject(var_51_3)
		end

		local var_51_4 = CCAnimation:createWithSpriteFrames(var_51_1, 0.05)
		local var_51_5 = CCAnimate:create(var_51_4)

		var_51_0:setPosition(ccp(visibleSize.width / 2 + 230, 345 + visibleSize.height / 2))
		smgr.getLayer("mainCityLayer"):addChild(var_51_0, 101)
		var_51_0:runAction(var_51_5)

		local var_51_6 = CCArray:create()

		var_51_6:addObject(CCDelayTime:create(0.5))
		var_51_6:addObject(CCShow:create())

		for iter_51_1 = 1, 3 do
			var_51_6:addObject(CCFadeIn:create(0.2))
			var_51_6:addObject(CCFadeOut:create(0.2))
		end

		var_51_6:addObject(CCHide:create())
		var_51_6:addObject(CCCallFunc:create(function(...)
			local var_52_0 = CCSprite:create("res/ui/mainCity/zcgz_word_lbxc.png")
			local var_52_1 = CCSprite:create("res/ui/mainCity/zcgz_word_jg.png")

			var_52_0:setPosition(ccp(visibleSize.width / 2 + 200, visibleSize.height / 2 + 100))
			var_52_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 50))
			var_52_1:setVisible(false)
			var_52_1:setScale(5)

			local var_52_2 = CCArray:create()

			var_52_2:addObject(CCMoveTo:create(0.2, ccp(visibleSize.width / 2, visibleSize.height / 2 + 100)))
			var_52_2:addObject(CCDelayTime:create(0.3))
			var_52_2:addObject(CCTargetedAction:create(var_52_1, CCShow:create()))
			var_52_2:addObject(CCTargetedAction:create(var_52_1, CCScaleTo:create(0.2, 1)))
			var_52_2:addObject(CCDelayTime:create(1))
			var_52_2:addObject(CCCallFunc:create(function(...)
				var_52_0:removeFromParentAndCleanup(true)
				var_52_1:removeFromParentAndCleanup(true)
				roleDialogue.control.loadSpeak(1930)
			end))
			var_52_0:runAction(CCSequence:create(var_52_2))
			mainCity.control.getMainCityInfo()
			smgr.getLayer("mainCityLayer"):addChild(var_52_0, 1001)
			smgr.getLayer("mainCityLayer"):addChild(var_52_1, 1001)
		end))
		mainCity.ui.table.wall:runAction(CCSequence:create(var_51_6))
		mainCity.ui.table.bg2:setVisible(true)
		mainCity.ui.table.bg2:setOpacity(0)
		mainCity.ui.table.bg2:runAction(CCFadeIn:create(0.5))
	end))
	var_50_0:runAction(CCSequence:create(var_50_6))
	smgr.getLayer("mainCityLayer"):addChild(var_50_0, 20)
end

return mainCityUI
