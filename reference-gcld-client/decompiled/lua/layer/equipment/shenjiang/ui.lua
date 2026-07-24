tool.requireRes("equipment/shenjiang")
require("lua/common/tool")

shenjiangUI = {}
shenjiangUI.uiTable = {}
shenjiangUI.suitData = {}
shenjiangUI.times = 1
shenjiangUI.completeId = 0
shenjiangUI.animationState = 0
shenjiangUI.donate = 1

local var_0_0 = shenjiangControl
local var_0_1 = shenjiangUI
local var_0_2 = {
	[21] = {
		scale = 0.65,
		txt = 10106,
		pic = "res/ui/equip/shenjiang/jtz_icon_baoshi.png"
	},
	[116] = {
		scale = 0.8,
		txt = 310020,
		pic = "res/ui/resource/silkroad/sczl_sj_icon.png"
	},
	[119] = {
		pic = "res/ui/weapon/godWeapon/sbxt_icon_blg.png",
		txt = 111044
	},
	[125] = {
		scale = 0.65,
		txt = 491047,
		pic = "res/ui/world/feud/sbxt_btn_zs.png"
	},
	[126] = {
		scale = 0.8,
		txt = "224309_jiaotaozhuang",
		pic = "res/ui/resource/silkroad/sczldj_pbjn.png"
	},
	[129] = {
		scale = 0.6,
		txt = "224311_jiaotaozhuang",
		pic = "res/ui/equip/shenjiang/jtz_icon_jueshi_big.png"
	}
}

function shenjiangUI.show()
	local var_1_0 = createBaseLayer()

	if var_0_1.uiTable then
		var_0_1.uiTable = {}
	end

	uiutil.initUIComponent(var_1_0, var_0_1.uiTable, getshenjiangUIData())

	var_1_0.onEnter = var_0_1.onEnter
	var_1_0.onExit = var_0_1.onExit
	shenjiangUI.resourceArrs = nil

	local function var_1_1(arg_2_0)
		local var_2_0 = arg_2_0.action.data
		local var_2_1
		local var_2_2 = shenjiangUI.donate == 1 and "sichou_light" or shenjiangUI.donate == 2 and "baoshi_light" or "jiaoshi_light"

		shenjiangUI.flashAnimation(var_2_2, shenjiangUI.resourceArrs[shenjiangUI.donate].type)
		shenjiangUI.setData(var_2_0)
	end

	if conf.language == "vie" then
		var_0_1.uiTable.Button_10:setPositionX(var_0_1.uiTable.Button_10:getPositionX() - 50)
		var_0_1.uiTable.gou_10:setPositionX(var_0_1.uiTable.gou_10:getPositionX() - 50)
		var_0_1.uiTable.word_10:setPositionX(var_0_1.uiTable.word_10:getPositionX() - 20)
		var_0_1.uiTable.name_1:setFontSize(18)
		var_0_1.uiTable.name_1:setPositionX(var_0_1.uiTable.name_1:getPositionX() + 15)
		var_0_1.uiTable.name_2:setFontSize(18)
		var_0_1.uiTable.name_2:setPositionX(var_0_1.uiTable.name_2:getPositionX() + 15)
		var_0_1.uiTable.name_3:setFontSize(18)
		var_0_1.uiTable.name_3:setPositionX(var_0_1.uiTable.name_3:getPositionX() + 15)
	end

	var_0_1.uiTable.Button_1:addHandleOfControlEvent(function()
		shenjiangUI.donate = 1

		cmgr.sendRequest(var_1_1, actions.injectResource, JINGNANG, shenjiangUI.times)
	end, CCControlEventTouchUpInside)
	var_0_1.uiTable.Button_2:addHandleOfControlEvent(function()
		shenjiangUI.donate = 2

		cmgr.sendRequest(var_1_1, actions.injectResource, BAOSHI, shenjiangUI.times)
	end, CCControlEventTouchUpInside)
	var_0_1.uiTable.Button_3:addHandleOfControlEvent(function()
		shenjiangUI.donate = 3

		cmgr.sendRequest(var_1_1, actions.injectResource, JIAOSHI, shenjiangUI.times)
	end, CCControlEventTouchUpInside)

	for iter_1_0 = 1, 3 do
		var_0_1.uiTable["Button_" .. iter_1_0]:addHandleOfControlEvent(function()
			shenjiangUI.donate = iter_1_0

			if shenjiangUI.resourceArrs and shenjiangUI.resourceArrs[iter_1_0] then
				cmgr.sendRequest(var_1_1, actions.injectResource, shenjiangUI.resourceArrs[iter_1_0].type, shenjiangUI.times)
			end
		end, CCControlEventTouchUpInside)
	end

	var_0_1.uiTable.Button_10:addHandleOfControlEvent(function()
		if var_0_1.uiTable.gou_10:isVisible() then
			var_0_1.uiTable.gou_10:setVisible(false)

			shenjiangUI.times = 1
		else
			var_0_1.uiTable.gou_10:setVisible(true)

			shenjiangUI.times = 10
		end
	end, CCControlEventTouchUpInside)

	if shenjiangUI.times == 1 then
		var_0_1.uiTable.gou_10:setVisible(false)
	else
		var_0_1.uiTable.gou_10:setVisible(true)
	end

	shenjiangUI.update()

	return var_1_0
end

function shenjiangUI.flashAnimation(arg_8_0, arg_8_1)
	if var_0_1.uiTable[arg_8_0] then
		var_0_1.uiTable[arg_8_0]:setVisible(true)
		var_0_1.uiTable[arg_8_0]:stopAllActions()

		local var_8_0 = CCArray:create()

		var_8_0:addObject(CCFadeIn:create(0.2))
		var_8_0:addObject(CCFadeOut:create(0.2))
		var_8_0:addObject(CCFadeIn:create(0.2))
		var_8_0:addObject(CCFadeOut:create(0.2))
		var_8_0:addObject(CCFadeIn:create(0.2))
		var_8_0:addObject(CCFadeOut:create(0.2))
		var_8_0:addObject(CCCallFuncN:create(function()
			var_0_1.uiTable[arg_8_0]:setVisible(false)
		end))
		var_0_1.uiTable[arg_8_0]:runAction(CCSequence:create(var_8_0))

		if var_0_2[arg_8_1] then
			local var_8_1 = CCSprite:create(var_0_2[arg_8_1].pic)

			var_8_1:setPosition(ccp(var_0_1.uiTable[arg_8_0]:getContentSize().width / 2, -120))
			var_0_1.uiTable[arg_8_0]:addChild(var_8_1)

			local var_8_2 = CCArray:create()

			var_8_2:addObject(CCEaseSineOut:create(CCMoveBy:create(0.5, ccp(0, 140))))
			var_8_2:addObject(CCFadeOut:create(0.3))
			var_8_2:addObject(CCCallFuncN:create(function()
				var_8_1:removeFromParentAndCleanup(true)
			end))
			var_8_1:runAction(CCSequence:create(var_8_2))
		end
	end
end

function shenjiangUI.setCompleteAnimation()
	var_0_1.uiTable.Sprite_6_2:setVisible(false)
	var_0_1.uiTable.Sprite_6:setVisible(true)
	var_0_1.uiTable.Sprite_5:setVisible(false)

	shenjiangUI.animationState = 1

	var_0_1.uiTable.completeNode:setVisible(true)
	var_0_1.uiTable.equip_complete_1:setVisible(true)
	var_0_1.uiTable.equip_complete_1:stopAllActions()
	var_0_1.uiTable.equip_complete_2:setVisible(false)
	var_0_1.uiTable.equip_complete_2:stopAllActions()
	var_0_1.uiTable.word_complete:setVisible(false)
	var_0_1.uiTable.word_complete:stopAllActions()
	var_0_1.uiTable.word_complete_1:setVisible(false)
	var_0_1.uiTable.word_complete_2:setVisible(false)
	var_0_1.uiTable.fireNode:setVisible(true)
	var_0_1.uiTable.fireNode:stopAllActions()

	local var_11_0 = rmgr.getAnimation("jtzFire")

	if var_11_0 then
		local var_11_1 = CCAnimation:createWithSpriteFrames(var_11_0, 0.08)
		local var_11_2 = CCAnimate:create(var_11_1)
		local var_11_3 = CCRepeatForever:create(var_11_2)

		var_0_1.uiTable.fireNode:runAction(var_11_3)
	end

	if shenjiangUI.suitData then
		for iter_11_0, iter_11_1 in pairs(shenjiangUI.suitData) do
			if iter_11_1.id == shenjiangUI.completeId then
				var_0_1.uiTable.equip_complete_1:setDisplayFrame(tool.spriteFrameByName(iter_11_1.pic .. ".jpg"))
				var_0_1.uiTable.equip_complete_2:setDisplayFrame(tool.spriteFrameByName(iter_11_1.pic .. "tz.jpg"))

				local var_11_4 = iter_11_1.bestSuitInfo

				var_0_1.uiTable.word_complete_1:setString(language.get(30103, var_11_4.attAdd, var_11_4.defAdd, var_11_4.bloAdd))
				var_0_1.uiTable.word_complete_2:setString(var_11_4.skillName1 .. " lv." .. var_11_4.skillAdd1 .. " " .. var_11_4.skillName2 .. " lv." .. var_11_4.skillAdd2)
			end
		end
	end

	local var_11_5 = CCArray:create()

	var_11_5:addObject(CCDelayTime:create(1))
	var_11_5:addObject(CCCallFuncN:create(function()
		var_0_1.uiTable.equip_complete_2:setVisible(true)
	end))
	var_11_5:addObject(CCFadeIn:create(3))
	var_0_1.uiTable.equip_complete_2:runAction(CCSequence:create(var_11_5))

	local var_11_6 = CCArray:create()

	var_11_6:addObject(CCDelayTime:create(1))
	var_11_6:addObject(CCFadeOut:create(3))
	var_11_6:addObject(CCCallFuncN:create(function()
		var_0_1.uiTable.equip_complete_1:setVisible(false)
	end))
	var_0_1.uiTable.equip_complete_1:runAction(CCSequence:create(var_11_6))

	local var_11_7 = CCArray:create()

	var_11_7:addObject(CCDelayTime:create(4))
	var_11_7:addObject(CCCallFuncN:create(function()
		var_0_1.uiTable.word_complete:setVisible(true)
		var_0_1.uiTable.word_complete_1:setVisible(true)
		var_0_1.uiTable.word_complete_2:setVisible(true)
		var_0_1.uiTable.fireNode:setVisible(false)

		shenjiangUI.animationState = 2
	end))
	var_0_1.uiTable.word_complete:runAction(CCSequence:create(var_11_7))
	shenjiangUI.setRotateAnimation()
end

function shenjiangUI.setRotateAnimation()
	var_0_1.uiTable.animationNode:removeAllChildrenWithCleanup(true)
	var_0_1.uiTable.animationNode:stopAllActions()

	local var_15_0 = {
		CCSprite:create("res/ui/equip/shenjiang/jtz_icon_baoshi.png"),
		CCSprite:create("res/ui/equip/shenjiang/jtz_icon_jinnang.png"),
		(CCSprite:create("res/ui/equip/shenjiang/jtz_icon_jueshi.png"))
	}

	for iter_15_0 = 1, 3 do
		var_0_1.uiTable.animationNode:addChild(var_15_0[iter_15_0])

		local var_15_1 = iter_15_0 * 120
		local var_15_2 = math.cos(math.rad(var_15_1)) * 120
		local var_15_3 = math.sin(math.rad(var_15_1)) * 120

		var_15_0[iter_15_0]:setPosition(ccp(var_15_2, var_15_3))

		local var_15_4 = CCEaseSineOut:create(CCRotateBy:create(2, -540))
		local var_15_5 = CCArray:create()

		var_15_5:addObject(CCScaleTo:create(2, 0.3))

		local var_15_6 = CCRepeat:create(CCSequence:create(var_15_5), 1)
		local var_15_7 = CCArray:create()

		var_15_7:addObject(CCDelayTime:create(0.5))
		var_15_7:addObject(CCSpawn:createWithTwoActions(var_15_4, var_15_6))

		local var_15_8 = CCSequence:create(var_15_7)

		var_15_0[iter_15_0]:runAction(var_15_8)
	end

	local var_15_9 = CCEaseSineOut:create(CCRotateBy:create(2, 540))
	local var_15_10 = CCArray:create()

	var_15_10:addObject(CCScaleTo:create(2, 0.3))

	local var_15_11 = CCRepeat:create(CCSequence:create(var_15_10), 1)
	local var_15_12 = CCArray:create()

	var_15_12:addObject(CCDelayTime:create(0.5))
	var_15_12:addObject(CCSpawn:createWithTwoActions(var_15_9, var_15_11))
	var_15_12:addObject(CCCallFuncN:create(function()
		var_0_1.uiTable.animationNode:removeAllChildrenWithCleanup(true)
		var_0_1.uiTable.animationNode:stopAllActions()
	end))

	local var_15_13 = CCSequence:create(var_15_12)

	var_0_1.uiTable.animationNode:runAction(var_15_13)
end

function shenjiangUI.setData(arg_17_0)
	if arg_17_0.suitArrs then
		shenjiangUI.suitData = arg_17_0.suitArrs
	end

	if arg_17_0.progressInfo then
		if arg_17_0.progressInfo.curValue >= arg_17_0.progressInfo.maxValue then
			var_0_1.uiTable.Sprite_6_2:setVisible(true)
			var_0_1.uiTable.Sprite_6:setVisible(false)
			var_0_1.uiTable.Sprite_5:setVisible(true)
		else
			var_0_1.uiTable.Sprite_6_2:setVisible(false)
			var_0_1.uiTable.Sprite_6:setVisible(true)
			var_0_1.uiTable.Sprite_5:setVisible(false)
		end
	end

	if arg_17_0.state then
		if arg_17_0.state == -1 then
			var_0_1.uiTable.Sprite_6_2:setVisible(false)
			var_0_1.uiTable.Sprite_6:setVisible(false)
			var_0_1.uiTable.Sprite_5:setVisible(false)
		elseif arg_17_0.state == 0 then
			var_0_1.uiTable.Sprite_6_2:setVisible(true)
			var_0_1.uiTable.Sprite_6:setVisible(false)
			var_0_1.uiTable.Sprite_5:setVisible(true)
			var_0_1.uiTable.word2:setString(language.get("224319_jiaotaozhuang"))
			var_0_1.uiTable.Text_1_Copy:setString(language.get("224318_jiaotaozhuang"))
		elseif arg_17_0.state == 1 then
			-- block empty
		else
			var_0_1.uiTable.Sprite_6_2:setVisible(true)
			var_0_1.uiTable.Sprite_6:setVisible(false)
			var_0_1.uiTable.Sprite_5:setVisible(true)
			var_0_1.uiTable.word2:setString(language.get("224317_jiaotaozhuang"))
			var_0_1.uiTable.Text_1_Copy:setString(language.get("224308_jiaotaozhuang"))
		end
	end

	if arg_17_0.progressInfo then
		var_0_1.uiTable.word_process:setString(arg_17_0.progressInfo.curValue .. "/" .. arg_17_0.progressInfo.maxValue)
		var_0_1.uiTable.LoadingBar_1:setPercentage(arg_17_0.progressInfo.curValue * 100 / arg_17_0.progressInfo.maxValue)
	end

	if arg_17_0.resourceArrs then
		local var_17_0 = {}

		for iter_17_0, iter_17_1 in pairs(arg_17_0.resourceArrs) do
			if iter_17_1.type == 116 or iter_17_1.type == 125 or iter_17_1.type == 126 then
				var_17_0[1] = iter_17_1
			elseif iter_17_1.type == 21 then
				var_17_0[2] = iter_17_1
			elseif iter_17_1.type == 119 or iter_17_1.type == 129 then
				var_17_0[3] = iter_17_1
			end
		end

		if shenjiangUI.resourceArrs ~= nil then
			for iter_17_2 = 1, 3 do
				if shenjiangUI.resourceArrs[iter_17_2].type ~= var_17_0[iter_17_2].type then
					messageBox.alert("", language.get(491048))

					break
				end
			end
		end

		shenjiangUI.resourceArrs = var_17_0

		for iter_17_3, iter_17_4 in ipairs(var_17_0) do
			local var_17_1 = var_0_2[iter_17_4.type]

			if var_17_1 then
				var_0_1.uiTable["icon_" .. iter_17_3]:setDisplayFrame(CCSprite:create(var_17_1.pic):displayFrame())
				var_0_1.uiTable["icon_" .. iter_17_3]:setScale(var_17_1.scale or 1)
				var_0_1.uiTable["name_" .. iter_17_3]:setString(language.get(var_17_1.txt))
			end

			var_0_1.uiTable["down_" .. iter_17_3]:setString(language.get("224312_jiaotaozhuang", tool.getFormatNum(iter_17_4.haveNum)))
			var_0_1.uiTable["num_" .. iter_17_3]:setString(tool.getFormatNum(iter_17_4.needNum))
		end
	end

	if arg_17_0.suitArrs then
		for iter_17_5, iter_17_6 in pairs(arg_17_0.suitArrs) do
			if var_0_1.uiTable["equip_" .. iter_17_6.id] then
				log.info("123 " .. iter_17_6.pic)
				var_0_1.uiTable["equip_" .. iter_17_6.id]:setDisplayFrame(tool.spriteFrameByName(iter_17_6.pic .. ".jpg"))
			end
		end
	end
end

function shenjiangUI.update()
	local function var_18_0(arg_19_0)
		local var_19_0 = arg_19_0.action.data

		shenjiangUI.setData(var_19_0)
	end

	cmgr.sendRequest(var_18_0, actions.getTabInfo)
end

function shenjiangUI.selectSuit(arg_20_0, arg_20_1)
	log.info(arg_20_0 .. " " .. arg_20_1)

	if shenjiangUI.animationState == 2 then
		shenjiangUI.animationState = 0

		var_0_1.uiTable.completeNode:setVisible(false)
		shenjiangUI.update()
	end

	for iter_20_0 = 1, 5 do
		if var_0_1.uiTable.Sprite_6_2:isVisible() and tool.checkIfTouch(var_0_1.uiTable["equip_" .. iter_20_0], arg_20_0, arg_20_1) then
			log.info(iter_20_0)

			if shenjiangUI.suitData then
				for iter_20_1, iter_20_2 in pairs(shenjiangUI.suitData) do
					if iter_20_2.ifUpgrade == false and iter_20_2.id == iter_20_0 then
						var_0_1.uiTable.bg_light:setVisible(true)
						var_0_1.uiTable.bg_light:setPosition(ccp(190 + 110 * iter_20_0, 66))

						local function var_20_0()
							log.info("qianghua")

							local function var_21_0(arg_22_0)
								local var_22_0 = arg_22_0.action.data

								shenjiangUI.setCompleteAnimation()
							end

							shenjiangUI.completeId = iter_20_0

							cmgr.sendRequest(var_21_0, actions.bestSuitUpgrade, iter_20_0)
						end

						messageBox.confirm("\n" .. language.get("224307_jiaotaozhuang", iter_20_2.name) .. "\n\n" .. language.get("224314_jiaotaozhuang", iter_20_2.bestSuitInfo.attAdd, iter_20_2.bestSuitInfo.defAdd, iter_20_2.bestSuitInfo.bloAdd) .. "\n" .. language.get("224315_jiaotaozhuang", iter_20_2.bestSuitInfo.skillName1, iter_20_2.bestSuitInfo.skillAdd1, iter_20_2.bestSuitInfo.skillName2, iter_20_2.bestSuitInfo.skillAdd2), var_20_0)
					end
				end
			end
		end
	end
end

function shenjiangUI.onEnter()
	eventManager.registerEvent("globalOnTouchBegan", shenjiangUI.selectSuit)
end

function shenjiangUI.onExit()
	eventManager.unregisterEvent("globalOnTouchBegan", shenjiangUI.selectSuit)
end

function shenjiangUI.showTips()
	local var_25_0 = createBaseLayer()

	local function var_25_1(arg_26_0, arg_26_1, arg_26_2)
		if arg_26_0 == CCTOUCHBEGAN then
			-- block empty
		elseif arg_26_0 == CCTOUCHENDED then
			smgr.getLayer("topLayer"):removeChild(var_25_0, true)
		end

		return true
	end

	local var_25_2 = {
		tipsBg = {
			xcenter = 0,
			anchorPointX = 0.5,
			type = "pic_9_tips",
			ycenter = 0,
			pic = "frame:common_tip_frame_small.png",
			anchorPointY = 0.5,
			middleRect = CCRectMake(0, 0, 0, 0),
			preferedSize = CCSizeMake(290, 300),
			content = {
				{
					fontSize = 22,
					type = "label",
					text = language.get(103050)
				},
				{
					fontSize = 22,
					type = "label",
					text = language.get(103051)
				},
				{
					fontSize = 22,
					type = "label",
					text = language.get(103052)
				},
				{
					fontSize = 22,
					type = "label",
					text = language.get(103053)
				},
				{
					fontSize = 22,
					type = "label",
					text = language.get(103054)
				},
				{
					fontSize = 22,
					type = "label",
					text = language.get(103055)
				},
				{
					fontSize = 22,
					type = "label",
					text = language.get(103056)
				},
				{
					fontSize = 22,
					type = "label",
					text = language.get(103057)
				},
				{
					fontSize = 22,
					type = "label",
					text = language.get(103058)
				},
				{
					fontSize = 22,
					type = "label",
					text = language.get(103059)
				}
			}
		}
	}

	autoUI.initUI(var_25_0, var_25_2)
	var_25_0:registerScriptTouchHandler(var_25_1, false, true)
	var_25_0:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_25_0, 10002)
	var_25_0:setVisible(true)
end
