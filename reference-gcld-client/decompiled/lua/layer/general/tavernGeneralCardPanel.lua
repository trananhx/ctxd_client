require("lua/component/commonbutton")

TAG_GENERAL_CARD = 101
TAG_GENERAL_TIPS = 102
TAG_GENERAL_MY_ICON = 104

local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.myGeneralX = 0
	var_0_0.genCardNameFontSize = -4
	var_0_0.genTagFontSize = -6
else
	var_0_0.myGeneralX = 0
	var_0_0.genCardNameFontSize = 0
	var_0_0.genTagFontSize = 0
end

local var_0_1
local var_0_2
local var_0_3
local var_0_4

function createTavernGeneralCard(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = CCSprite:create("res/ui/tavern/poth_list_view_bg.jpg")
	local var_1_1 = {}
	local var_1_2 = CCSprite:create("res/ui/tavern/poth_gen_list_bg.jpg")

	var_1_2:setPosition(ccp(78, 152))
	var_1_0:addChild(var_1_2)

	local var_1_3 = CCSprite:createWithSpriteFrameName("general_item_selected.png")

	var_1_3:setPosition(ccp(var_1_2:getContentSize().width * 0.5, var_1_2:getContentSize().height * 0.5))
	var_1_3:setVisible(false)
	var_1_2:addChild(var_1_3)

	local var_1_4 = CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", arg_1_0.pic))

	var_1_4:setPosition(ccp(var_1_2:getContentSize().width * 0.5, var_1_2:getContentSize().height * 0.5))
	var_1_2:addChild(var_1_4)

	local var_1_5 = CCStrokeLabelTTF:create(arg_1_0.name, "Thonburi-Bold", 26 + var_0_0.genCardNameFontSize)

	var_1_5:setColor(colorQuality[arg_1_0.quality])
	var_1_5:setPosition(ccp(78, 227))
	var_1_0:addChild(var_1_5)

	if arg_1_3 then
		local var_1_6 = CCStrokeLabelTTF:create(language.get(83027, arg_1_0.generalLv), "Thonburi-Bold", 20)

		var_1_6:setAnchorPoint(ccp(0.5, 0))
		var_1_6:setPosition(ccp(78, 112))
		var_1_0:addChild(var_1_6)
	end

	local var_1_7 = CCSprite:create()

	var_1_7:setContentSize(CCSizeMake(150, 50))
	var_1_7:setPosition(ccp(78, 227))
	var_1_0:addChild(var_1_7)

	local var_1_8 = CCSprite:create()

	var_1_8:setPosition(ccp(135, 227))
	var_1_0:addChild(var_1_8)

	if arg_1_0.locked == 0 then
		var_1_8:setDisplayFrame(CCSprite:create("res/ui/tavern/wjzm_lock.png"):displayFrame())
	elseif arg_1_0.locked == 1 then
		var_1_8:setDisplayFrame(CCSprite:create("res/ui/tavern/wjzm_lock_light.png"):displayFrame())
	end

	if arg_1_0.type ~= nil and (arg_1_0.type == "huangbao" or arg_1_0.type == "kongcheng") then
		local var_1_9 = CCSprite:create("res/ui/general/wenguan/" .. arg_1_0.type .. ".png")

		var_1_9:setPosition(ccp(120, 227))
		var_1_0:addChild(var_1_9)
	end

	local var_1_10 = CCSprite:createWithSpriteFrameName("res_icon_1_ss.png")

	var_1_10:setPosition(ccp(60, 70))
	var_1_0:addChild(var_1_10)

	local var_1_11 = CCStrokeLabelTTF:create(string.format("%d", arg_1_0.price), "Thonburi-Bold", 18)

	var_1_11:setPosition(ccp(var_1_10:getContentSize().width + var_1_11:getContentSize().width * 0.5, var_1_10:getContentSize().height * 0.5))
	var_1_10:addChild(var_1_11)

	if arg_1_0.bought then
		local var_1_12 = CCSprite:create("res/ui/common/text/genealPanel/text_tavern_ok.png")

		var_1_12:setPosition(ccp(var_1_0:getContentSize().width * 0.5, 10 + var_1_12:getContentSize().height * 0.5))
		var_1_0:addChild(var_1_12)
	else
		local function var_1_13(arg_2_0)
			require("lua/layer/general/tavernPanel")

			recordGeneralID = arg_2_0.generalId

			if arg_1_3 ~= true or var_0_1 < var_0_2 then
				cmgr.sendRequest(arg_1_2, actions.recruitGeneral, 0, arg_2_0.generalId)
			else
				cmgr.sendRequest(arg_1_2, actions.recruitGeneral, var_0_3, arg_2_0.generalId)
			end
		end

		local var_1_14 = CCSprite:createWithSpriteFrameName("btn2_gre_a.png")
		local var_1_15 = CCSprite:createWithSpriteFrameName("btn2_gre_c.png")
		local var_1_16, var_1_17 = creatBaseButton(var_1_14, var_1_15, var_1_13, arg_1_0)

		var_1_16:setPosition(ccp(var_1_0:getContentSize().width * 0.5, 10 + var_1_17:getContentSize().height * 0.5))
		var_1_0:addChild(var_1_16)

		local var_1_18 = CCStrokeLabelTTF:create(language.get(83026), "Thonburi-Bold", 20, 2, colorText[10005])

		var_1_18:setColor(colorText[10004])
		var_1_16:addChild(var_1_18, 1)

		var_1_1.recruitControl = var_1_17
	end

	local function var_1_19()
		local function var_3_0(arg_4_0)
			arg_1_0.locked = arg_1_0.locked == 0 and 1 or 0

			if arg_1_0.locked == 0 then
				var_1_8:setDisplayFrame(CCSprite:create("res/ui/tavern/wjzm_lock.png"):displayFrame())
				smgr.showTipTextGreen(language.get(83043))
			elseif arg_1_0.locked == 1 then
				var_1_8:setDisplayFrame(CCSprite:create("res/ui/tavern/wjzm_lock_light.png"):displayFrame())
				smgr.showTipTextGreen(language.get(83044))
			end
		end

		if arg_1_0.locked == 0 then
			cmgr.sendRequest(var_3_0, actions.lockGeneral, arg_1_0.generalId)
		elseif arg_1_0.locked == 1 then
			cmgr.sendRequest(var_3_0, actions.unlockGeneral, arg_1_0.generalId)
		end
	end

	function var_1_1.onTouchBegan(arg_5_0, arg_5_1, arg_5_2)
		if var_1_1.recruitControl then
			var_1_1.recruitControl:onTouchBegan(arg_5_1, arg_5_2)
		end

		return true
	end

	function var_1_1.onTouchMoved(arg_6_0, arg_6_1, arg_6_2)
		if var_1_1.recruitControl then
			var_1_1.recruitControl:onTouchMove(arg_6_1, arg_6_2)
		end
	end

	function var_1_1.onTouchEnded(arg_7_0, arg_7_1, arg_7_2)
		local var_7_0 = false

		if tool.checkIfTouch(var_1_7, arg_7_1, arg_7_2) then
			var_1_19()
		elseif tool.checkIfTouch(var_1_0, arg_7_1, arg_7_2) then
			if tool.checkIfTouch(var_1_4, arg_7_1, arg_7_2) then
				arg_1_1(arg_1_0, var_1_0, arg_7_1, arg_7_2)

				var_7_0 = true

				var_1_3:setVisible(true)
			elseif var_1_1.recruitControl then
				var_1_1.recruitControl:onTouchEnd(arg_7_1, arg_7_2)
			end
		end

		if not var_7_0 then
			var_1_3:setVisible(false)
		end
	end

	return var_1_0, var_1_1
end

function createTavernGeneralCardPanel(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0 = createBaseLayer()
	local var_8_1 = {}

	local function var_8_2(arg_9_0)
		for iter_9_0, iter_9_1 in pairs(arg_9_0) do
			if iter_9_0 > 5 then
				break
			end

			local var_9_0, var_9_1 = createTavernGeneralCard(iter_9_1, arg_8_1, arg_8_2, arg_8_3)

			var_9_0:setPosition(ccp(110 + (var_9_0:getContentSize().width + 18) * (iter_9_0 - 1), 215))
			var_8_0:addChild(var_9_0, 1, TAG_GENERAL_CARD)
			table.insert(var_8_1, var_9_1)

			if iter_9_0 == 1 then
				log.info("generalInfo", var_9_0)
				require("lua/guide/control")

				guide.uiElementsTable[1013] = var_9_0
			end
		end
	end

	local function var_8_3(arg_10_0, arg_10_1, arg_10_2)
		for iter_10_0, iter_10_1 in pairs(var_8_1) do
			if arg_10_0 == CCTOUCHBEGAN then
				iter_10_1:onTouchBegan(arg_10_1, arg_10_2)
			elseif arg_10_0 == CCTOUCHMOVED then
				iter_10_1:onTouchMoved(arg_10_1, arg_10_2)
			elseif arg_10_0 == CCTOUCHENDED then
				iter_10_1:onTouchEnded(arg_10_1, arg_10_2)
			end
		end

		if arg_10_0 == CCTOUCHBEGAN then
			return true
		end
	end

	var_8_0:setTouchEnabled(true)
	var_8_0:registerScriptTouchHandler(var_8_3)
	var_8_2(arg_8_0)

	return var_8_0
end

local function var_0_5()
	return {
		anchorPointX = 0,
		name = "introFrame",
		type = "pic_9",
		anchorPointY = 1,
		pic = "frame:common_tip_frame_small.png",
		middleRect = CCRectMake(24, 24, 1, 1),
		preferedSize = CCSizeMake(200, 200),
		children = {
			{
				fontSize = 20,
				name = "intro",
				type = "label",
				anchorPointX = 0,
				y = 0,
				anchorPointY = 1,
				x = 0,
				text = language.get(83042),
				align = kCCTextAlignmentLeft
			}
		}
	}
end

local function var_0_6()
	log.info("副将tips")

	local var_12_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_12_0:registerScriptTouchHandler(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == CCTOUCHBEGAN then
			return true
		elseif arg_13_0 == CCTOUCHMOVED then
			return true
		elseif arg_13_0 == CCTOUCHENDED then
			pcall(var_12_0.removeFromParentAndCleanup, var_12_0, true)

			return true
		end
	end, false, true)
	var_12_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_12_0, 60000)

	local var_12_1 = {}

	autoUI.createUI(var_12_0, var_0_5(), var_12_1)

	local var_12_2 = 900
	local var_12_3 = 500
	local var_12_4 = var_12_1.intro:getContentSize().width
	local var_12_5 = var_12_1.intro:getContentSize().height

	var_12_1.introFrame:setPreferredSize(CCSizeMake(var_12_4 + 30, var_12_5 + 30))
	var_12_1.intro:setPosition(ccp(15, var_12_5 + 15))
	var_12_1.introFrame:setPosition(ccp(var_12_2 - var_12_4, var_12_3 - 30))
end

function createTavernMyGeneralIconPanel(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4, arg_14_5, arg_14_6, arg_14_7)
	local var_14_0 = createBaseLayer()
	local var_14_1 = arg_14_7 and 5 or arg_14_0.maxGeneralNum
	local var_14_2 = arg_14_0.deputyNum > 0 and arg_14_0.deputyNum or 1
	local var_14_3 = {}

	local function var_14_4(arg_15_0)
		local var_15_0 = arg_15_0.action.data.military

		for iter_15_0, iter_15_1 in pairs(var_15_0) do
			if iter_15_1.deputyGeneralId then
				-- block empty
			else
				var_0_3 = iter_15_1.generalId
			end
		end
	end

	cmgr.sendRequest(var_14_4, actions.generalInfos2)

	local function var_14_5(arg_16_0)
		local var_16_0 = var_14_3[arg_16_0].generalInfo

		for iter_16_0 = 1, var_14_1 + var_14_2 do
			local var_16_1 = var_14_0:getChildByTag(10000 + iter_16_0)

			if var_16_1 ~= nil then
				if iter_16_0 == arg_16_0 then
					local var_16_2 = CCSprite:create("res/ui/tavern/poth_gen_list_on.jpg")

					var_16_1:setDisplayFrame(var_16_2:displayFrame())
				else
					local var_16_3 = CCSprite:create("res/ui/tavern/poth_gen_list_bg.jpg")

					var_16_1:setDisplayFrame(var_16_3:displayFrame())
				end
			end
		end

		if var_16_0 ~= nil then
			require("lua/component/messageBox")
			messageBox.confirm(language.get(83028, var_16_0.generalName), function()
				cmgr.sendRequest(arg_14_3, actions.fireGeneral, arg_14_4, var_16_0.generalId)
			end)
		end
	end

	local var_14_6 = 220

	if arg_14_7 then
		var_14_6 = 50
	end

	if arg_14_7 == true then
		rmgr.loadResource("res/ui/general/general.plist")

		local var_14_7 = tool.spriteByName("p-hong.png")

		var_14_0:addChild(var_14_7, 1)
		var_14_7:setPosition(ccp(-20 + var_14_6, 410))

		local var_14_8 = CCStrokeLabelTTF:create(language.get(83034), "Thonburi", 24 + var_0_0.genTagFontSize, 2)

		var_14_8:setDimensions(CCSizeMake(38, 95))
		var_14_8:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_14_8:setPosition(ccp(var_14_7:getContentSize().width * 0.5, var_14_7:getContentSize().height * 0.5))
		var_14_7:addChild(var_14_8)

		var_0_3 = nil
		var_0_2 = arg_14_2
		var_0_1 = 0
	end

	for iter_14_0 = 1, var_14_1 do
		local var_14_9 = CCSprite:create("res/ui/tavern/poth_gen_list_bg.jpg")
		local var_14_10 = CCSprite:create("res/ui/tavern/gen_por_view_bg.jpg")

		var_14_10:setPosition(ccp(46, 46))
		var_14_9:addChild(var_14_10)
		table.insert(var_14_3, {
			isFujiang = false,
			generalInfo = arg_14_1[iter_14_0],
			isWujiang = arg_14_7,
			node = var_14_9
		})

		if iter_14_0 <= arg_14_2 then
			local var_14_11 = arg_14_1[iter_14_0]

			if var_14_11 == nil then
				local var_14_12 = CCSprite:create("res/ui/tavern/gen_por_emp.jpg")

				var_14_12:setPosition(ccp(39, 39))
				var_14_10:addChild(var_14_12)
			else
				if arg_14_7 == true then
					var_0_1 = var_0_1 + 1
				end

				local var_14_13 = CCSprite:create("res/ui/common/generalPic/generalPic_" .. var_14_11.generalPic .. ".jpg")

				var_14_13:setPosition(ccp(39, 39))
				var_14_10:addChild(var_14_13)

				local var_14_14 = false

				for iter_14_1, iter_14_2 in pairs(arg_14_5 or {}) do
					if iter_14_2.cheifId == var_14_11.generalId then
						local var_14_15 = true

						break
					end
				end

				local var_14_16 = ""

				if arg_14_7 then
					var_14_16 = language.get(83027, var_14_11.generalLv)
				elseif var_14_11.cilvilId and #var_14_11.stratagemList > 0 then
					var_14_16 = var_14_11.stratagemList[1].trickName
				end

				local var_14_17

				if conf.language == "vie" then
					var_14_17 = CCLabelTTF:create("", "", 16)

					var_14_17:setDimensions(CCSizeMake(60, 0))
				else
					var_14_17 = CCLabelTTF:create("", "", 20)
				end

				var_14_17:setPosition(ccp(39, 10))
				var_14_17:setString(var_14_16)
				var_14_10:addChild(var_14_17)

				if var_14_11.type ~= nil and (var_14_11.type == "huangbao" or var_14_11.type == "kongcheng") then
					var_14_17:setString(var_14_11.trickName)
				end

				local var_14_18 = CCSprite:create("res/ui/tavern/btn_sack_a.png")
				local var_14_19 = CCSprite:create("res/ui/tavern/btn_sack_c.png")
				local var_14_20 = CCMenuItemSprite:create(var_14_18, var_14_19)

				var_14_20:registerScriptTapHandler(var_14_5)
				var_14_20:setPosition(ccp(65, 65))

				local var_14_21 = CCMenu:create()

				var_14_21:setPosition(ccp(0, 0))
				var_14_21:addChild(var_14_20, 1, iter_14_0)
				var_14_10:addChild(var_14_21)
			end
		else
			local var_14_22 = CCLabelTTF:create(language.get(400002), "", 20)

			var_14_22:setColor(ccc3(108, 105, 102))
			var_14_22:setPosition(ccp(39, 39))
			var_14_10:addChild(var_14_22)
		end

		var_14_0:addChild(var_14_9, 1, 10000 + iter_14_0)
		var_14_9:setPosition(ccp(iter_14_0 * 100 + var_14_6 - 45, 410))

		if arg_14_1[iter_14_0] and arg_14_1[iter_14_0].generalId and arg_14_1[iter_14_0].generalId == 259 then
			require("lua/guide/control")

			guide.uiElementsTable[1012] = var_14_9
		end
	end

	if arg_14_7 == true then
		local var_14_23

		if conf.language == "vie" or conf.language == "tha" then
			var_14_23 = CCScale9Sprite:createWithSpriteFrameName("p-huang.png", CCRectMake(10, 10, 44, 84))

			var_14_23:setPreferredSize(CCSizeMake(76, 94))
		else
			var_14_23 = tool.spriteByName("p-huang.png")
		end

		var_14_0:addChild(var_14_23, 1)
		var_14_23:setPosition(ccp(35 + var_14_1 * 100 + var_14_6, 410))

		local var_14_24 = CCStrokeLabelTTF:create(language.get(83035), "Thonburi", 24 + var_0_0.genTagFontSize, 2)

		var_14_24:setDimensions(CCSizeMake(38, 0))
		var_14_24:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_14_24:setPosition(ccp(var_14_23:getContentSize().width * 0.5, var_14_23:getContentSize().height * 0.5))
		var_14_23:addChild(var_14_24)

		for iter_14_3 = var_14_1 + 1, var_14_1 + var_14_2 do
			local var_14_25 = CCSprite:create("res/ui/tavern/poth_gen_list_bg.jpg")
			local var_14_26 = CCSprite:create("res/ui/tavern/gen_por_view_bg.jpg")

			var_14_26:setPosition(ccp(46, 46))
			var_14_25:addChild(var_14_26)
			table.insert(var_14_3, {
				isFujiang = true,
				generalInfo = arg_14_5[iter_14_3 - var_14_1],
				isWujiang = arg_14_7,
				node = var_14_25
			})

			if arg_14_5[iter_14_3 - var_14_1] then
				local var_14_27 = CCSprite:create("res/ui/common/generalPic/generalPic_" .. arg_14_5[iter_14_3 - var_14_1].generalPic .. ".jpg")

				var_14_27:setPosition(ccp(39, 39))
				var_14_26:addChild(var_14_27)

				local var_14_28 = CCLabelTTF:create("", "", 20)

				var_14_28:setPosition(ccp(39, 10))
				var_14_28:setString(language.get(83027, arg_14_5[iter_14_3 - var_14_1].generalLv))
				var_14_26:addChild(var_14_28)

				local var_14_29 = CCSprite:create("res/ui/tavern/btn_sack_a.png")
				local var_14_30 = CCSprite:create("res/ui/tavern/btn_sack_c.png")
				local var_14_31 = CCMenuItemSprite:create(var_14_29, var_14_30)

				var_14_31:registerScriptTapHandler(var_14_5)
				var_14_31:setPosition(ccp(65, 65))

				local var_14_32 = CCMenu:create()

				var_14_32:setPosition(ccp(0, 0))
				var_14_32:addChild(var_14_31, 1, iter_14_3)
				var_14_26:addChild(var_14_32)
			elseif arg_14_0.deputyNum >= iter_14_3 - var_14_1 then
				local var_14_33 = CCSprite:create("res/ui/tavern/gen_por_emp.jpg")

				var_14_33:setPosition(ccp(39, 39))
				var_14_26:addChild(var_14_33)
			else
				local var_14_34 = CCLabelTTF:create(language.get(400002), "", 20)

				var_14_34:setColor(ccc3(108, 105, 102))
				var_14_34:setPosition(ccp(39, 39))
				var_14_26:addChild(var_14_34)
			end

			var_14_0:addChild(var_14_25, 1, 10000 + iter_14_3)
			var_14_25:setPosition(ccp(iter_14_3 * 100 + var_14_6 + 10, 410))
		end
	end

	local var_14_35
	local var_14_36
	local var_14_37

	local function var_14_38(arg_18_0, arg_18_1, arg_18_2)
		if arg_18_0 == CCTOUCHBEGAN then
			var_14_35 = nil
			var_14_36, var_14_37 = arg_18_1, arg_18_2

			for iter_18_0, iter_18_1 in pairs(var_14_3) do
				if tool.checkIfTouch2(iter_18_1.node, arg_18_1, arg_18_2) then
					var_14_35 = iter_18_0

					return true
				end
			end

			return false
		elseif arg_18_0 == CCTOUCHMOVED then
			if math.abs(var_14_36 - arg_18_1) > 15 or math.abs(var_14_37 - arg_18_2) > 15 then
				var_14_35 = nil

				return false
			end

			return true
		elseif arg_18_0 == CCTOUCHENDED then
			if var_14_35 and tool.checkIfTouch2(var_14_3[var_14_35].node, arg_18_1, arg_18_2) then
				var_14_5(var_14_35)
			end

			return true
		end
	end

	var_14_0:setTouchEnabled(true)
	var_14_0:registerScriptTouchHandler(var_14_38)

	return var_14_0
end
