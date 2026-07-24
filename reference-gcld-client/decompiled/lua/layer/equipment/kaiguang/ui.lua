tool.requireRes("equipment/kaiguang")
require("lua/common/tool")

equipmentKaiguangUI = {}
equipmentKaiguangUI.uiTable = {}

local var_0_0 = equipmentKaiguangControl
local var_0_1 = equipmentKaiguangUI
local var_0_2 = equipmentKaiguangConstant
local var_0_3 = 1
local var_0_4 = 1
local var_0_5
local var_0_6 = 0

function equipmentKaiguangUI.showFinal()
	var_0_6 = 4

	local var_1_0 = createBaseLayer()

	if var_0_1.uiTable then
		var_0_1.uiTable = nil
	end

	var_0_3 = 1
	var_0_1.uiTable = autoUI.initUI(var_1_0, getKaiguangFinalUIData())
	var_1_0.onEnter = var_0_1.onEnter
	var_1_0.onExit = var_0_1.onExit

	return var_1_0
end

function equipmentKaiguangUI.show()
	local var_2_0 = createBaseLayer()

	if var_0_1.uiTable then
		var_0_1.uiTable = nil
	end

	var_0_3 = 0
	var_0_1.uiTable = autoUI.initUI(var_2_0, getKaiguangUIData())
	var_2_0.onEnter = var_0_1.onEnter
	var_2_0.onExit = var_0_1.onExit

	var_0_0.openKaiguang()

	return var_2_0
end

function equipmentKaiguangUI.setPageData(arg_3_0)
	var_0_5 = arg_3_0
end

function equipmentKaiguangUI.setKaiguangInfo(arg_4_0)
	var_0_5 = arg_4_0

	equipmentKaiguangUI.setRightPanelFalse()

	if arg_4_0 == nil then
		return
	end

	if arg_4_0.realSuits then
		for iter_4_0, iter_4_1 in pairs(arg_4_0.realSuits) do
			if iter_4_1.suitId then
				var_0_1.uiTable["taozhuang" .. iter_4_1.suitId]:setVisible(true)
				var_0_1.uiTable["taozhuang" .. iter_4_1.suitId]:setDisplayFrame(tool.spriteFrameByName(equipmentKaiguangConstant.realSuit[iter_4_1.suitId]))

				if iter_4_1.suitId == var_0_4 then
					equipmentKaiguangUI.setRealSuitRight(iter_4_1)
				end
			end
		end
	end

	if arg_4_0.finalSuits then
		for iter_4_2, iter_4_3 in pairs(arg_4_0.finalSuits) do
			if iter_4_3.suitId then
				var_0_1.uiTable["taozhuang" .. iter_4_3.suitId]:setVisible(true)
				var_0_1.uiTable["taozhuang" .. iter_4_3.suitId]:setDisplayFrame(tool.spriteFrameByName(equipmentKaiguangConstant.jiSuit[iter_4_3.suitId]))

				if iter_4_3.suitId == var_0_4 then
					equipmentKaiguangUI.setFinalSuitRight(iter_4_3)
				end
			end
		end
	end

	var_0_1.uiTable.guangquan:setPosition(ccp(equipmentKaiguangConstant.suitPos[var_0_4].x, equipmentKaiguangConstant.suitPos[var_0_4].y))

	if #arg_4_0.realSuits <= 0 then
		var_0_1.uiTable.jiujitaozhuangDi:setDisplayFrame(CCSprite:create("res/ui/equip/kaiguang/kg_zzsh2.png"):displayFrame())

		local var_4_0 = CCSprite:create("res/ui/equip/kaiguang/kg_zzsh3.png")

		var_4_0:setPosition(ccp(var_0_1.uiTable.jiujitaozhuangDi:getContentSize().width / 2, var_0_1.uiTable.jiujitaozhuangDi:getContentSize().height / 2))
		var_0_1.uiTable.jiujitaozhuangDi:addChild(var_4_0)
		var_0_1.uiTable.zuizhongshenghua:setEnabled(true)
	end

	if arg_4_0.currentPoint and arg_4_0.needPoint then
		var_0_1.uiTable.xilianPoint:setString(language.get(103042, arg_4_0.currentPoint, arg_4_0.needPoint))

		if arg_4_0.currentPoint < arg_4_0.needPoint then
			var_0_1.uiTable.addXilianPoint:setEnabled(true)
		else
			var_0_1.uiTable.addXilianPoint:setEnabled(false)
		end
	end
end

function equipmentKaiguangUI.setRightPanelFalse()
	var_0_1.uiTable.taozhuangNameLeft:setVisible(false)
	var_0_1.uiTable.taozhuangNameRight:setVisible(false)
	var_0_1.uiTable.taozhuangLeft:setVisible(false)
	var_0_1.uiTable.taozhuangRight:setVisible(false)
	var_0_1.uiTable.bigArrow:setVisible(false)
	var_0_1.uiTable.skillName1:setVisible(false)
	var_0_1.uiTable.skillName2:setVisible(false)
	var_0_1.uiTable.skillName3:setVisible(false)
	var_0_1.uiTable.skillName4:setVisible(false)
	var_0_1.uiTable.smallArrow:setVisible(false)
	var_0_1.uiTable.taozhuangNameCenter:setVisible(false)
	var_0_1.uiTable.kaiguangdi:setVisible(false)
	var_0_1.uiTable.skillName5:setVisible(false)
	var_0_1.uiTable.skillName6:setVisible(false)
end

function equipmentKaiguangUI.setRealSuitRight(arg_6_0)
	var_0_1.uiTable.taozhuangNameLeft:setVisible(true)
	var_0_1.uiTable.taozhuangNameRight:setVisible(true)
	var_0_1.uiTable.taozhuangLeft:setVisible(true)
	var_0_1.uiTable.taozhuangRight:setVisible(true)
	var_0_1.uiTable.bigArrow:setVisible(true)
	var_0_1.uiTable.skillName1:setVisible(true)
	var_0_1.uiTable.skillName2:setVisible(true)
	var_0_1.uiTable.skillName3:setVisible(true)
	var_0_1.uiTable.skillName4:setVisible(true)
	var_0_1.uiTable.smallArrow:setVisible(true)
	var_0_1.uiTable.taozhuangNameCenter:setVisible(false)
	var_0_1.uiTable.kaiguangdi:setVisible(false)
	var_0_1.uiTable.skillName5:setVisible(false)
	var_0_1.uiTable.skillName6:setVisible(false)
	var_0_1.uiTable.taozhuangNameLeft:setDisplayFrame(CCSprite:create("res/ui/equip/kaiguang/kg_word_" .. equipmentKaiguangConstant.realSuitName[var_0_4] .. ".png"):displayFrame())
	var_0_1.uiTable.taozhuangNameRight:setDisplayFrame(CCSprite:create("res/ui/equip/kaiguang/kg_word_" .. equipmentKaiguangConstant.jiSuitName[var_0_4] .. ".png"):displayFrame())
	var_0_1.uiTable.taozhuangPicLeft:setDisplayFrame(CCSprite:createWithSpriteFrameName(equipmentKaiguangConstant.realSuitName[var_0_4] .. "tz.jpg"):displayFrame())
	var_0_1.uiTable.taozhuangPicRight:setDisplayFrame(CCSprite:createWithSpriteFrameName(equipmentKaiguangConstant.jiSuitName[var_0_4] .. ".jpg"):displayFrame())
	var_0_1.uiTable.skillPic1:setDisplayFrame(CCSprite:createWithSpriteFrameName(arg_6_0.skillPic1 .. ".jpg"):displayFrame())
	var_0_1.uiTable.skillPic2:setDisplayFrame(CCSprite:createWithSpriteFrameName(arg_6_0.skillPic2 .. ".jpg"):displayFrame())
	var_0_1.uiTable.skillPic3:setDisplayFrame(CCSprite:createWithSpriteFrameName(arg_6_0.skillPic1 .. ".jpg"):displayFrame())
	var_0_1.uiTable.skillPic4:setDisplayFrame(CCSprite:createWithSpriteFrameName(arg_6_0.skillPic2 .. ".jpg"):displayFrame())
	var_0_1.uiTable.skillNamelabel1:setString("Lv." .. arg_6_0.skillNum1)
	var_0_1.uiTable.skillNamelabel2:setString("Lv." .. arg_6_0.skillNum2)
	var_0_1.uiTable.skillNamelabel3:setString("Lv." .. arg_6_0.skillOpenedNum1)
	var_0_1.uiTable.skillNamelabel4:setString("Lv." .. arg_6_0.skillOpenedNum2)
	var_0_1.uiTable.kaiguang:setEnabled(true)
end

function equipmentKaiguangUI.setFinalSuitRight(arg_7_0)
	var_0_1.uiTable.taozhuangNameLeft:setVisible(false)
	var_0_1.uiTable.taozhuangNameRight:setVisible(false)
	var_0_1.uiTable.taozhuangLeft:setVisible(false)
	var_0_1.uiTable.taozhuangRight:setVisible(false)
	var_0_1.uiTable.bigArrow:setVisible(false)
	var_0_1.uiTable.skillName1:setVisible(false)
	var_0_1.uiTable.skillName2:setVisible(false)
	var_0_1.uiTable.skillName3:setVisible(false)
	var_0_1.uiTable.skillName4:setVisible(false)
	var_0_1.uiTable.smallArrow:setVisible(false)
	var_0_1.uiTable.taozhuangNameCenter:setVisible(true)
	var_0_1.uiTable.kaiguangdi:setVisible(true)
	var_0_1.uiTable.skillName5:setVisible(true)
	var_0_1.uiTable.skillName6:setVisible(true)
	var_0_1.uiTable.taozhuangNameCenter:setDisplayFrame(CCSprite:create("res/ui/equip/kaiguang/kg_word_" .. equipmentKaiguangConstant.jiSuitName[var_0_4] .. ".png"):displayFrame())
	var_0_1.uiTable.kaiguangAfter:setDisplayFrame(CCSprite:createWithSpriteFrameName(equipmentKaiguangConstant.jiSuitName[var_0_4] .. ".jpg"):displayFrame())

	if needShowKaiguangAnimationTaozhuang then
		needShowKaiguangAnimationTaozhuang = false

		equipmentKaiguangUI.showTaozhuangUpdate(var_0_4)
	end

	var_0_1.uiTable.skillPic5:setDisplayFrame(CCSprite:createWithSpriteFrameName(arg_7_0.skillPic1 .. ".jpg"):displayFrame())
	var_0_1.uiTable.skillPic6:setDisplayFrame(CCSprite:createWithSpriteFrameName(arg_7_0.skillPic2 .. ".jpg"):displayFrame())
	var_0_1.uiTable.skillNamelabel5:setString("Lv." .. arg_7_0.skillOpenedNum1)
	var_0_1.uiTable.skillNamelabel6:setString("Lv." .. arg_7_0.skillOpenedNum2)
	var_0_1.uiTable.kaiguang:setEnabled(false)
end

function equipmentKaiguangUI.changeShow(arg_8_0, arg_8_1)
	if var_0_3 == 1 then
		if tool.checkIfTouch(var_0_1.uiTable.jifenghuang2, arg_8_0, arg_8_1) then
			log.info("jifenghuang")
			equipmentKaiguangUI.setJitaozhuangVisibleFalse()
			var_0_1.uiTable.jifenghuang:setVisible(true)
			var_0_1.uiTable.centerImage:setDisplayFrame(CCSprite:createWithSpriteFrameName("jfh.jpg"):displayFrame())
			var_0_1.uiTable.jiEquipName:setDisplayFrame(CCSprite:create("res/ui/equip/kaiguang/last/jjtz_word_jfh.png"):displayFrame())
			var_0_1.uiTable.jiEquipDiscribe:setDisplayFrame(CCSprite:create("res/ui/equip/kaiguang/last/jjtz_word_01.png"):displayFrame())

			var_0_6 = 4
		elseif tool.checkIfTouch(var_0_1.uiTable.jiquhu2, arg_8_0, arg_8_1) then
			log.info("jiquhu")
			equipmentKaiguangUI.setJitaozhuangVisibleFalse()
			var_0_1.uiTable.jiquhu:setVisible(true)
			var_0_1.uiTable.centerImage:setDisplayFrame(CCSprite:createWithSpriteFrameName("jqh.jpg"):displayFrame())
			var_0_1.uiTable.jiEquipName:setDisplayFrame(CCSprite:create("res/ui/equip/kaiguang/last/jjtz_word_jqh.png"):displayFrame())
			var_0_1.uiTable.jiEquipDiscribe:setDisplayFrame(CCSprite:create("res/ui/equip/kaiguang/last/jjtz_word_04.png"):displayFrame())

			var_0_6 = 2
		elseif tool.checkIfTouch(var_0_1.uiTable.jibaxia2, arg_8_0, arg_8_1) then
			log.info("jibaxia")
			equipmentKaiguangUI.setJitaozhuangVisibleFalse()
			var_0_1.uiTable.jibaxia:setVisible(true)
			var_0_1.uiTable.centerImage:setDisplayFrame(CCSprite:createWithSpriteFrameName("jbx.jpg"):displayFrame())
			var_0_1.uiTable.jiEquipName:setDisplayFrame(CCSprite:create("res/ui/equip/kaiguang/last/jjtz_word_jbx.png"):displayFrame())
			var_0_1.uiTable.jiEquipDiscribe:setDisplayFrame(CCSprite:create("res/ui/equip/kaiguang/last/jjtz_word_03.png"):displayFrame())

			var_0_6 = 1
		elseif tool.checkIfTouch(var_0_1.uiTable.jilinggui2, arg_8_0, arg_8_1) then
			log.info("jilinggui")
			equipmentKaiguangUI.setJitaozhuangVisibleFalse()
			var_0_1.uiTable.jilinggui:setVisible(true)
			var_0_1.uiTable.centerImage:setDisplayFrame(CCSprite:createWithSpriteFrameName("jlg.jpg"):displayFrame())
			var_0_1.uiTable.jiEquipName:setDisplayFrame(CCSprite:create("res/ui/equip/kaiguang/last/jjtz_word_jlg.png"):displayFrame())
			var_0_1.uiTable.jiEquipDiscribe:setDisplayFrame(CCSprite:create("res/ui/equip/kaiguang/last/jjtz_word_02.png"):displayFrame())

			var_0_6 = 5
		elseif tool.checkIfTouch(var_0_1.uiTable.jizhulong2, arg_8_0, arg_8_1) then
			log.info("jizhulong")
			equipmentKaiguangUI.setJitaozhuangVisibleFalse()
			var_0_1.uiTable.jizhulong:setVisible(true)
			var_0_1.uiTable.centerImage:setDisplayFrame(CCSprite:createWithSpriteFrameName("jzl.jpg"):displayFrame())
			var_0_1.uiTable.jiEquipName:setDisplayFrame(CCSprite:create("res/ui/equip/kaiguang/last/jjtz_word_jzl.png"):displayFrame())
			var_0_1.uiTable.jiEquipDiscribe:setDisplayFrame(CCSprite:create("res/ui/equip/kaiguang/last/jjtz_word_05.png"):displayFrame())

			var_0_6 = 3
		elseif tool.checkIfTouch(var_0_1.uiTable.centerImage, arg_8_0, arg_8_1) then
			log.info("centerImage")
			var_0_0.showJiEquipTips(var_0_6, var_0_5)
		end
	elseif tool.checkIfTouch(var_0_1.uiTable.xilianbutton, arg_8_0, arg_8_1) then
		log.info("xilian")
		equipmentControl.onQuenchingLabelClick()
	elseif tool.checkIfTouch(var_0_1.uiTable.taozhuang1, arg_8_0, arg_8_1) then
		var_0_4 = 1

		equipmentKaiguangUI.setKaiguangInfo(var_0_5)
	elseif tool.checkIfTouch(var_0_1.uiTable.taozhuang2, arg_8_0, arg_8_1) then
		var_0_4 = 2

		equipmentKaiguangUI.setKaiguangInfo(var_0_5)
	elseif tool.checkIfTouch(var_0_1.uiTable.taozhuang3, arg_8_0, arg_8_1) then
		var_0_4 = 3

		equipmentKaiguangUI.setKaiguangInfo(var_0_5)
	elseif tool.checkIfTouch(var_0_1.uiTable.taozhuang4, arg_8_0, arg_8_1) then
		var_0_4 = 4

		equipmentKaiguangUI.setKaiguangInfo(var_0_5)
	elseif tool.checkIfTouch(var_0_1.uiTable.taozhuang5, arg_8_0, arg_8_1) then
		var_0_4 = 5

		equipmentKaiguangUI.setKaiguangInfo(var_0_5)
	end
end

function equipmentKaiguangUI.setJitaozhuangVisibleFalse()
	if var_0_1.uiTable.jifenghuang and var_0_1.uiTable.jifenghuang:isVisible() then
		var_0_1.uiTable.jifenghuang:setVisible(false)
	end

	if var_0_1.uiTable.jiquhu and var_0_1.uiTable.jiquhu:isVisible() then
		var_0_1.uiTable.jiquhu:setVisible(false)
	end

	if var_0_1.uiTable.jibaxia and var_0_1.uiTable.jibaxia:isVisible() then
		var_0_1.uiTable.jibaxia:setVisible(false)
	end

	if var_0_1.uiTable.jilinggui and var_0_1.uiTable.jilinggui:isVisible() then
		var_0_1.uiTable.jilinggui:setVisible(false)
	end

	if var_0_1.uiTable.jizhulong and var_0_1.uiTable.jizhulong:isVisible() then
		var_0_1.uiTable.jizhulong:setVisible(false)
	end
end

function equipmentKaiguangUI.onEnter()
	var_0_6 = 3

	eventManager.registerEvent("globalOnTouchBegan", equipmentKaiguangUI.changeShow)
end

function equipmentKaiguangUI.onExit()
	eventManager.unregisterEvent("globalOnTouchBegan", equipmentKaiguangUI.changeShow)
end

function equipmentKaiguangUI.showTips()
	local var_12_0 = createBaseLayer()

	local function var_12_1(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == CCTOUCHBEGAN then
			-- block empty
		elseif arg_13_0 == CCTOUCHENDED then
			smgr.getLayer("topLayer"):removeChild(var_12_0, true)
		end

		return true
	end

	local var_12_2 = {
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

	autoUI.initUI(var_12_0, var_12_2)
	var_12_0:registerScriptTouchHandler(var_12_1, false, true)
	var_12_0:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_12_0, 10002)
	var_12_0:setVisible(true)
end

function equipmentKaiguangUI.countGold()
	if var_0_5 then
		if var_0_5.needPoint >= var_0_5.currentPoint then
			return 3 * (var_0_5.needPoint - var_0_5.currentPoint)
		else
			return 0
		end
	else
		return 0
	end
end

function equipmentKaiguangUI.getCurrentItem()
	return var_0_4
end

function equipmentKaiguangUI.showKaiguangAnimation(arg_16_0)
	local var_16_0 = smgr.getLayer("topLayer")
	local var_16_1 = CCLayerColor:create(ccc4(0, 0, 0, 125))

	var_16_1:registerScriptTouchHandler(function(arg_17_0, arg_17_1, arg_17_2)
		if arg_17_0 == CCTOUCHBEGAN then
			return true
		elseif arg_17_0 == CCTOUCHMOVED then
			return true
		elseif arg_17_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)
	var_16_1:setTouchEnabled(true)
	var_16_0:addChild(var_16_1)

	if arg_16_0 == 0 then
		for iter_16_0 = 1, #equipmentKaiguangConstant.realSuit do
			local var_16_2 = CCSprite:create("res/ui/equip/kaiguang/kg_icon_bg.png")

			var_16_2:setPosition(ccp(visibleSize.width / 2 + 100 * iter_16_0 - 300, visibleSize.height / 2 + 100))

			local var_16_3 = CCSprite:createWithSpriteFrameName(equipmentKaiguangConstant.realSuit[iter_16_0])

			var_16_3:setPosition(ccp(var_16_2:getContentSize().width / 2, var_16_2:getContentSize().height / 2))
			var_16_2:addChild(var_16_3)
			var_16_1:addChild(var_16_2)
			var_16_2:setVisible(false)

			local var_16_4 = CCArray:create()

			var_16_4:addObject(CCDelayTime:create(0.7 * iter_16_0))
			var_16_4:addObject(CCCallFuncN:create(function()
				var_16_2:setVisible(true)
			end))
			var_16_4:addObject(CCFadeIn:create(1))

			local var_16_5 = CCSequence:create(var_16_4)

			var_16_3:runAction(var_16_5)
		end

		local var_16_6 = CCSprite:create("res/ui/nationTask/thief/tmzj_city_bg.png")
		local var_16_7 = CCSprite:create("res/ui/equip/kaiguang/kg_word_ztzkg.png")

		var_16_7:setPosition(ccp(var_16_6:getContentSize().width / 2, var_16_6:getContentSize().height / 2))
		var_16_6:addChild(var_16_7)
		var_16_6:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
		var_16_1:addChild(var_16_6)
		var_16_6:setVisible(false)

		local var_16_8 = CCArray:create()

		var_16_8:addObject(CCDelayTime:create(4))
		var_16_8:addObject(CCCallFuncN:create(function()
			var_16_6:setVisible(true)
		end))
		var_16_8:addObject(CCDelayTime:create(2))
		var_16_8:addObject(CCCallFuncN:create(function()
			var_16_1:removeFromParentAndCleanup(true)
			require("lua/layer/equipment/ui")
			equipmentUI.show(4)
		end))

		local var_16_9 = CCSequence:create(var_16_8)

		var_16_6:runAction(var_16_9)
	elseif arg_16_0 == 1 then
		for iter_16_1 = 1, #equipmentKaiguangConstant.jiSuit do
			local var_16_10 = CCSprite:create("res/ui/equip/kaiguang/kg_j_icon_bg.png")

			var_16_10:setPosition(ccp(visibleSize.width / 2 + 100 * iter_16_1 - 300, visibleSize.height / 2 + 100))

			local var_16_11 = CCSprite:createWithSpriteFrameName(equipmentKaiguangConstant.jiSuit[iter_16_1])

			var_16_11:setPosition(ccp(var_16_10:getContentSize().width / 2, var_16_10:getContentSize().height / 2))
			var_16_10:addChild(var_16_11)
			var_16_1:addChild(var_16_10)
			var_16_10:setVisible(false)

			local var_16_12 = CCArray:create()

			var_16_12:addObject(CCDelayTime:create(0.7 * iter_16_1))
			var_16_12:addObject(CCCallFuncN:create(function()
				var_16_10:setVisible(true)
			end))
			var_16_12:addObject(CCFadeIn:create(1))

			local var_16_13 = CCSequence:create(var_16_12)

			var_16_11:runAction(var_16_13)
		end

		local var_16_14 = CCSprite:create("res/ui/nationTask/thief/tmzj_city_bg.png")
		local var_16_15 = CCSprite:create("res/ui/equip/kaiguang/kg_word_zzshwc.png")

		var_16_15:setPosition(ccp(var_16_14:getContentSize().width / 2, var_16_14:getContentSize().height / 2 + 15))
		var_16_14:addChild(var_16_15)
		var_16_14:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
		var_16_1:addChild(var_16_14)
		var_16_14:setVisible(false)
		rmgr.loadResource("res/ui/general/general.plist")

		local var_16_16 = CCLabelTTF:create("+100 ", "Thonburi", 20)
		local var_16_17 = CCSprite:createWithSpriteFrameName("general_attribute_att.png")
		local var_16_18 = CCLabelTTF:create("+60 ", "Thonburi", 20)
		local var_16_19 = CCSprite:createWithSpriteFrameName("general_attriubte_def.png")
		local var_16_20 = CCLabelTTF:create("+160 ", "Thonburi", 20)
		local var_16_21 = CCSprite:createWithSpriteFrameName("general_attribute_hp.png")
		local var_16_22 = {
			[2] = var_16_16,
			var_16_17,
			[4] = var_16_18,
			[3] = var_16_19,
			[6] = var_16_20,
			[5] = var_16_21
		}
		local var_16_23 = createRichNode(var_16_22)

		var_16_23:setAnchorPoint(ccp(0.5, 0.5))
		var_16_23:setPosition(ccp(var_16_14:getContentSize().width / 2 - 120, var_16_14:getContentSize().height / 2 - 25))
		var_16_14:addChild(var_16_23)

		local var_16_24 = CCArray:create()

		var_16_24:addObject(CCDelayTime:create(4))
		var_16_24:addObject(CCCallFuncN:create(function()
			var_16_14:setVisible(true)
		end))
		var_16_24:addObject(CCDelayTime:create(2))
		var_16_24:addObject(CCCallFuncN:create(function()
			var_16_1:removeFromParentAndCleanup(true)
		end))

		local var_16_25 = CCSequence:create(var_16_24)

		var_16_14:runAction(var_16_25)
	end
end

function equipmentKaiguangUI.showTaozhuangUpdate(arg_24_0)
	local var_24_0 = CCSprite:createWithSpriteFrameName(equipmentKaiguangConstant.realSuit[arg_24_0])

	var_24_0:setPosition(var_0_1.uiTable.kaiguangAfter:getContentSize().width / 2, var_0_1.uiTable.kaiguangAfter:getContentSize().height / 2)
	var_0_1.uiTable.kaiguangAfter:addChild(var_24_0)

	local var_24_1 = CCArray:create()

	var_24_1:addObject(CCFadeOut:create(5))
	var_24_1:addObject(CCCallFuncN:create(function()
		var_24_0:removeFromParentAndCleanup(true)
	end))

	local var_24_2 = CCSequence:create(var_24_1)

	var_24_0:runAction(var_24_2)

	local var_24_3 = rmgr.getAnimation("fireEffect")
	local var_24_4 = CCAnimation:createWithSpriteFrames(var_24_3, 0.1)
	local var_24_5 = CCAnimate:create(var_24_4)
	local var_24_6 = CCRepeat:create(var_24_5, 5)
	local var_24_7 = CCSprite:create()

	var_24_7:setPosition(var_0_1.uiTable.kaiguangAfter:getContentSize().width / 2, var_0_1.uiTable.kaiguangAfter:getContentSize().height / 2)

	local var_24_8 = CCArray:create()

	var_24_8:addObject(var_24_6)
	var_24_8:addObject(CCCallFuncN:create(function()
		local var_26_0 = CCSprite:create("res/ui/equip/kaiguang/kg_word_kgcg.png")
		local var_26_1 = visibleSize.width / 2 - 450.5 + 680
		local var_26_2 = visibleSize.height / 2 - 259.5 + 342

		var_26_0:setPosition(ccp(var_26_1, var_26_2))
		smgr.showTipSpriteText(var_26_0)
		var_24_7:removeFromParentAndCleanup(true)
	end))
	var_24_7:runAction(CCSequence:create(var_24_8))
	var_0_1.uiTable.kaiguangAfter:addChild(var_24_7)
end
