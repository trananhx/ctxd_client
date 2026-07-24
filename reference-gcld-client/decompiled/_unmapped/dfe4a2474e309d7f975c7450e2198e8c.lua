require("lua/component/timerLabel")
require("lua/component/CCNumberSprite")

blackMarketControl = {}

local var_0_0 = blackMarketControl

var_0_0.leftIndex = 1
var_0_0.isWaitFly = false

local function var_0_1(arg_1_0)
	local var_1_0 = {}

	if arg_1_0 == 1 then
		var_1_0[1] = 1
		var_1_0[2] = 2
		var_1_0[3] = 3
	elseif arg_1_0 == 2 then
		var_1_0[1] = 2
		var_1_0[2] = 3
		var_1_0[3] = 1
	elseif arg_1_0 == 3 then
		var_1_0[1] = 3
		var_1_0[2] = 1
		var_1_0[3] = 2
	end

	local var_1_1 = {
		language.get(10101),
		language.get(10102),
		language.get(10103)
	}
	local var_1_2 = {
		"ying.jpg",
		"mucai.jpg",
		"liang.jpg"
	}

	if var_0_0.data ~= nil then
		for iter_1_0 = 1, 3 do
			if iter_1_0 == 1 then
				blackMarketUI.uiTable["title_" .. iter_1_0 .. "1"]:setString(var_1_1[var_0_0.data.left[var_1_0[iter_1_0]].type])
				blackMarketUI.uiTable["value_" .. iter_1_0 .. "1"]:setString(var_0_0.data.left[var_1_0[iter_1_0]].value)
				blackMarketUI.uiTable["icon_" .. iter_1_0 .. "1"]:setDisplayFrame(tool.spriteFrameByName(var_1_2[var_0_0.data.left[var_1_0[iter_1_0]].type]))
				blackMarketUI.uiTable["title_" .. iter_1_0 .. "2"]:setString(var_1_1[var_0_0.data.left[var_1_0[iter_1_0]].type])
				blackMarketUI.uiTable["value_" .. iter_1_0 .. "2"]:setString(var_0_0.data.left[var_1_0[iter_1_0]].value)
				blackMarketUI.uiTable["icon_" .. iter_1_0 .. "2"]:setDisplayFrame(tool.spriteFrameByName(var_1_2[var_0_0.data.left[var_1_0[iter_1_0]].type]))
			else
				blackMarketUI.uiTable["title_" .. iter_1_0 .. "1"]:setString(var_1_1[var_0_0.data.right[var_1_0[iter_1_0]].type])
				blackMarketUI.uiTable["value_" .. iter_1_0 .. "1"]:setString(var_0_0.data.right[var_1_0[iter_1_0]].value)
				blackMarketUI.uiTable["icon_" .. iter_1_0 .. "1"]:setDisplayFrame(tool.spriteFrameByName(var_1_2[var_0_0.data.left[var_1_0[iter_1_0]].type]))
				blackMarketUI.uiTable["title_" .. iter_1_0 .. "2"]:setString(var_1_1[var_0_0.data.right[var_1_0[iter_1_0]].type])
				blackMarketUI.uiTable["value_" .. iter_1_0 .. "2"]:setString(var_0_0.data.right[var_1_0[iter_1_0]].value)
				blackMarketUI.uiTable["icon_" .. iter_1_0 .. "2"]:setDisplayFrame(tool.spriteFrameByName(var_1_2[var_0_0.data.left[var_1_0[iter_1_0]].type]))
			end
		end
	end
end

local function var_0_2(arg_2_0)
	if arg_2_0 == nil then
		blackMarketUI.uiTable.chengchi:setVisible(false)
		blackMarketUI.uiTable.zhanling:setVisible(false)
		blackMarketUI.uiTable.cityName:setVisible(false)
		blackMarketUI.uiTable.goumailiangfanbei:setVisible(false)
		blackMarketUI.uiTable.go_btn:setVisible(false)
		blackMarketUI.uiTable.go_label:setVisible(false)
	else
		blackMarketUI.uiTable.cityName:setString(arg_2_0[1].cityName)

		var_0_0.cityId = arg_2_0[1].cityId

		if arg_2_0[1].hasSpecialCity == 0 then
			blackMarketUI.uiTable.chengchi:setDisplayFrame(tool.spriteFrameByName("chengchi.png"))
			blackMarketUI.uiTable.zhanling:setString(language.get(73001))
			blackMarketUI.uiTable.zhanling:setHorizontalAlignment(1)
			blackMarketUI.uiTable.chengchi:setVisible(true)
			blackMarketUI.uiTable.zhanling:setVisible(true)
			blackMarketUI.uiTable.cityName:setVisible(true)
			blackMarketUI.uiTable.goumailiangfanbei:setVisible(true)
			blackMarketUI.uiTable.btn_go:setVisible(true)
			blackMarketUI.uiTable.go_label:setVisible(true)
		else
			blackMarketUI.uiTable.chengchi:setDisplayFrame(tool.spriteFrameByName("chengchi1.png"))
			blackMarketUI.uiTable.zhanling:setString(language.get(73002))

			if conf.language == "kr" then
				blackMarketUI.uiTable.zhanling:setDimensions(CCSizeMake(80, 30))
			elseif conf.language == "vie" then
				blackMarketUI.uiTable.zhanling:setDimensions(CCSizeMake(120, 30))
			elseif conf.language == "tha" then
				blackMarketUI.uiTable.zhanling:setDimensions(CCSizeMake(100, 30))
			end

			blackMarketUI.uiTable.zhanling:setHorizontalAlignment(2)
			blackMarketUI.uiTable.chengchi:setVisible(true)
			blackMarketUI.uiTable.zhanling:setVisible(true)
			blackMarketUI.uiTable.cityName:setVisible(false)
			blackMarketUI.uiTable.goumailiangfanbei:setVisible(false)
			blackMarketUI.uiTable.btn_go:setVisible(false)
			blackMarketUI.uiTable.go_label:setVisible(false)
		end
	end

	if user.kbLv >= 1 then
		blackMarketUI.uiTable.chengchi:setVisible(false)
		blackMarketUI.uiTable.zhanling:setVisible(false)
		blackMarketUI.uiTable.cityName:setVisible(false)
		blackMarketUI.uiTable.goumailiangfanbei:setVisible(false)
		blackMarketUI.uiTable.btn_go:setVisible(false)
		blackMarketUI.uiTable.go_label:setVisible(false)
		blackMarketUI.uiTable.chengchi:setVisible(true)
		blackMarketUI.uiTable.chengchi:setDisplayFrame(tool.spriteFrameByName("chengchi1.png"))
		blackMarketUI.uiTable.zhanling:setVisible(true)
		blackMarketUI.uiTable.zhanling:setString(language.get("speicalBuffInfo1"))
		blackMarketUI.uiTable.zhanling:setPositionX(200)
		blackMarketUI.uiTable.go_label:setVisible(true)
		blackMarketUI.uiTable.go_label:setString(language.get("speicalBuffInfo2"))
		blackMarketUI.uiTable.go_label:setPositionX(270)
	end
end

local function var_0_3(arg_3_0)
	if arg_3_0.action.state == 1 then
		var_0_0.data = arg_3_0.action.data

		var_0_1(var_0_0.leftIndex)

		if var_0_0.data ~= nil then
			var_0_2(var_0_0.data.specialCities)
		end

		if arg_3_0.action.data.cd == nil then
			arg_3_0.action.data.cd = 0

			blackMarketUI.uiTable.text_clear:setVisible(false)
			blackMarketUI.uiTable.btn_clear:setVisible(false)
		else
			blackMarketUI.uiTable.text_clear:setVisible(true)
			blackMarketUI.uiTable.btn_clear:setVisible(true)
		end

		if var_0_0.data.specialCities == nil and var_0_0.data.specialCities == 0 then
			blackMarketUI.uiTable.chengchi_got:setVisible(false)
			blackMarketUI.uiTable.chengchi_ungot:setVisible(true)
		else
			blackMarketUI.uiTable.chengchi_got:setVisible(true)
			blackMarketUI.uiTable.chengchi_ungot:setVisible(false)
		end

		local var_3_0 = blackMarketUI.uiTable.cooldown_parent:getChildByTag(blackMarketConstant.TIME_TAG)
		local var_3_1 = colorQuality[1]

		if var_0_0.data.cd and var_0_0.data.cdMax and var_0_0.data.cd >= var_0_0.data.cdMax then
			var_3_1 = colorQuality[5]
		end

		var_3_0:setColor(var_3_1)
		var_3_0:setTime(tonumber(var_0_0.data.cd))
		var_3_0:setTriggerTime(tonumber(var_0_0.data.cd - 1000))
		smgr.getLayer("blackMarketLayer"):setVisible(true)
	end
end

local function var_0_4(arg_4_0)
	if arg_4_0.action.state == 1 then
		local var_4_0 = blackMarketUI.uiTable.cooldown_parent:getChildByTag(blackMarketConstant.TIME_TAG)

		var_4_0:setTime(1)
		var_4_0:setColor(colorQuality[1])
		blackMarketUI.uiTable.text_clear:setVisible(false)
		blackMarketUI.uiTable.btn_clear:setVisible(false)
	end
end

local function var_0_5(arg_5_0)
	if arg_5_0.action.state == 1 then
		require("lua/component/messageBox")
		messageBox.showChargeWin(language.get(10003), language.get(73003, tostring(arg_5_0.action.data.gold)), "blackMarketGold", function()
			cmgr.sendRequest(var_0_4, actions.cdRecoverConfirm)
		end)
	end
end

local function var_0_6(arg_7_0)
	if arg_7_0.action.state == 1 then
		local var_7_0 = arg_7_0.action.data

		user.welfare.setWelfare("displayBlack", 0)

		local var_7_1 = var_7_0.addNum + var_7_0.baseNum
		local var_7_2 = {
			"get_reso_silver.png",
			"get_reso_wood.png",
			"get_reso_food.png"
		}
		local var_7_3 = "get_numb_plus.png"

		local function var_7_4(arg_8_0)
			local var_8_0 = smgr.getLayer("blackMarketLayer")

			arg_8_0:setVisible(false)
			var_8_0:removeChild(arg_8_0, true)

			var_0_0.isWaitFly = false
		end

		local var_7_5 = CCNode:create()
		local var_7_6 = tool.spriteByName(var_7_2[var_7_0.type])
		local var_7_7 = tool.spriteByName(var_7_3)
		local var_7_8, var_7_9 = CCNumberSprite:create("get_numb_%d.png", tostring(var_7_1))
		local var_7_10 = 0
		local var_7_11 = var_7_6:getContentSize().width
		local var_7_12 = var_7_7:getContentSize().width
		local var_7_13 = var_7_9.content_width
		local var_7_14 = (var_7_10 + var_7_11 + var_7_12 + var_7_13) / 2

		var_7_6:setPositionX(var_7_10 + var_7_11 / 2 - var_7_14)
		var_7_7:setPositionX(var_7_10 + var_7_11 + var_7_12 / 2 - var_7_14)
		var_7_8:setPositionX(var_7_10 + var_7_11 + var_7_12 + var_7_13 / 2 - var_7_14)
		log.debug(var_7_11, var_7_12, var_7_13, var_7_14)
		var_7_5:addChild(var_7_6)
		var_7_5:addChild(var_7_7)
		var_7_5:addChild(var_7_8)
		var_7_5:setPosition(ccp(visibleSize.width / 2, visibleSize.height * 0.45))
		smgr.getLayer("blackMarketLayer"):addChild(var_7_5, 101, 10001)

		local var_7_15 = CCMoveTo:create(0.2, ccp(visibleSize.width / 2, visibleSize.height * 0.6))
		local var_7_16 = CCDelayTime:create(0.2)
		local var_7_17 = CCShow:create()
		local var_7_18 = CCCallFuncN:create(var_7_4)
		local var_7_19 = CCArray:create()

		var_7_19:addObject(var_7_15)
		var_7_19:addObject(var_7_16)
		var_7_19:addObject(var_7_17)
		var_7_19:addObject(var_7_18)

		local var_7_20 = CCSequence:create(var_7_19)

		var_7_5:runAction(var_7_20)

		var_0_0.isWaitFly = true

		var_0_0.getBlackMarketInfo()
	end
end

function var_0_0.checkNeedRecoverCd()
	if var_0_0.data.cd and var_0_0.data.cdMax and blackMarketUI.uiTable.cooldown_parent:getChildByTag(blackMarketConstant.TIME_TAG):getTime() > var_0_0.data.cdMax then
		var_0_0.clickSkipCD()

		return true
	end

	return false
end

function var_0_0.buttonExchange1()
	if var_0_0.leftIndex == 3 then
		var_0_0.leftIndex = 1
	else
		var_0_0.leftIndex = var_0_0.leftIndex + 1
	end

	var_0_1(var_0_0.leftIndex)
end

function var_0_0.buttonExchange2()
	if var_0_0.isWaitFly == false then
		if var_0_0.checkNeedRecoverCd() then
			return
		end

		local var_11_0 = var_0_0.leftIndex + 1

		if var_11_0 == 4 then
			var_11_0 = 1
		end

		cmgr.sendRequest(var_0_6, actions.blackMarketTrade, var_0_0.leftIndex, var_11_0)
	end
end

function var_0_0.buttonExchange3()
	if var_0_0.isWaitFly == false then
		if var_0_0.checkNeedRecoverCd() then
			return
		end

		local var_12_0 = var_0_0.leftIndex - 1

		if var_12_0 == 0 then
			var_12_0 = 3
		end

		cmgr.sendRequest(var_0_6, actions.blackMarketTrade, var_0_0.leftIndex, var_12_0)
	end
end

function var_0_0.clickGoGo()
	smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
	loadingLayer.show(SCENE_WORLD, var_0_0.cityId)
end

function var_0_0.clickSkipCD()
	if user.chargeItems.blackMarketGold.noDisturb then
		cmgr.sendRequest(var_0_4, actions.cdRecoverConfirm)
	else
		var_0_0.getBlackMarketCDRecover()
	end
end

function var_0_0.getBlackMarketInfo()
	cmgr.sendRequest(var_0_3, actions.getBlackMarketInfo)
end

function var_0_0.getBlackMarketCDRecover()
	cmgr.sendRequest(var_0_5, actions.cdRecover)
end

function var_0_0.onEnter()
	return
end

function var_0_0.onExit()
	resourceUI.uiTable = {}
end
