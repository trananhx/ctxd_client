officer = {}

tool.requireRes("rankInfo/officer")

officer.ui = {}

local var_0_0 = {}

if conf.language == "tha" then
	var_0_0.playerNameX = 10
else
	var_0_0.playerNameX = 0
end

function officer.ui.createList(arg_1_0)
	if officer.ui.table.scrollView ~= nil then
		officer.ui.table.bg:removeChild(officer.ui.table.scrollView, true)
	end

	local var_1_0 = createBaseLayer()
	local var_1_1 = false

	for iter_1_0 = 1, #arg_1_0 do
		local var_1_2 = arg_1_0[iter_1_0]
		local var_1_3

		if var_1_1 == true then
			var_1_3 = CCSprite:create("res/ui/rankInfo/offic_list_view1.jpg")
		else
			var_1_3 = CCSprite:create("res/ui/rankInfo/offic_list_view2.jpg")
		end

		var_1_1 = not var_1_1

		var_1_3:setPosition(ccp(270, 45 * (#arg_1_0 - iter_1_0) + 40))
		var_1_0:addChild(var_1_3)

		local var_1_4 = CCLabelTTF:create(tostring(var_1_2.rank), "", "20")

		var_1_4:setPosition(ccp(50, 22))
		var_1_3:addChild(var_1_4)

		local var_1_5 = CCLabelTTF:create(tostring(var_1_2.officer), "", "20")

		var_1_5:setDimensions(CCSizeMake(150, 30))
		var_1_5:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_1_5:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_1_5:setPosition(ccp(160, 22))
		var_1_3:addChild(var_1_5)

		local var_1_6 = CCLabelTTF:create(tostring(var_1_2.playerName), "", "20")

		var_1_6:setDimensions(CCSizeMake(150, 30))
		var_1_6:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_1_6:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_1_6:setPosition(ccp(300 + var_0_0.playerNameX, 22))
		var_1_3:addChild(var_1_6)

		local var_1_7 = CCLabelTTF:create(tostring(var_1_2.playerLv), "", "20")

		var_1_7:setPosition(ccp(410, 22))
		var_1_3:addChild(var_1_7)

		local var_1_8 = CCLabelTTF:create(tostring(var_1_2.freeNum) .. "/" .. tostring(var_1_2.hour), "", "20")

		var_1_8:setPosition(ccp(490, 22))
		var_1_3:addChild(var_1_8)
	end

	if officer.control.myRank >= 1 and officer.control.myRank <= #arg_1_0 then
		local var_1_9 = CCSprite:create("res/ui/rankInfo/offic_list_view_mine.png")

		var_1_9:setPosition(ccp(270, 45 * (#arg_1_0 - officer.control.myRank) + 40))

		officer.ui.table.select_icon = var_1_9

		var_1_0:addChild(var_1_9)
	end

	local var_1_10 = CCScrollView:create(CCSizeMake(541, 450))

	var_1_10:setContainer(var_1_0)
	var_1_10:setPosition(0, 10)
	var_1_10:setContentSize(CCSizeMake(541, 45 * #arg_1_0 + 18))
	var_1_10:setDirection(kCCScrollViewDirectionVertical)
	var_1_10:setContentOffset(ccp(0, -45 * #arg_1_0 + 450 - 18))

	officer.ui.table.scrollView = var_1_10

	officer.ui.table.bg:addChild(var_1_10, 1000)
	officer.ui.table.layer:setVisible(true)
end

function officer.ui.fill(arg_2_0)
	if officer.control.isFisrtTime == false then
		return
	end

	officer.control.isFisrtTime = false

	if tonumber(arg_2_0.buildingId) == 0 then
		officer.ui.table.btn_drop:setEnabled(false)
	else
		officer.ui.table.btn_drop:setEnabled(true)
	end

	officer.ui.table.btn_salary:setEnabled(arg_2_0.hasSalary)
	officer.ui.table.icon:setString(user.forceIdToName[arg_2_0.forceId])
	officer.ui.table.icon:setColor(colorForce[arg_2_0.forceId])

	local var_2_0 = CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. tostring(arg_2_0.pic) .. ".png")

	officer.ui.table.player:setDisplayFrame(var_2_0:displayFrame())
	officer.ui.table.nameLv:setString("" .. tostring(arg_2_0.playerName) .. "  Lv." .. tostring(arg_2_0.playerLv))

	user.player.nowOfficer = arg_2_0.nowOfficer

	officer.ui.table.value_currentOfficer:setString("" .. tostring(arg_2_0.nowOfficer))
	officer.ui.table.value_resourceAdd:setString("" .. tostring(arg_2_0.resourceAddition))

	if tonumber(arg_2_0.rank) == -1 then
		officer.ui.table.value_currentRank:setString("200+")
	else
		officer.ui.table.value_currentRank:setString("" .. tostring(arg_2_0.rank))
	end

	officer.control.myRank = tonumber(arg_2_0.rank)

	officer.ui.table.value_nextOfficer:setString("" .. tostring(arg_2_0.nextOfficer))
	officer.ui.table.value_resourceAdd2:setString("" .. tostring(arg_2_0.nextRecourceAddition))
	officer.ui.table.value_levelUpCondition:setString("" .. tostring(arg_2_0.nextRequest))

	officer.control.myBuildingId = arg_2_0.buildingId
end

function officer.ui.init()
	local var_3_0 = {}

	if conf.language == "vie" then
		var_3_0.currentOfficerDimensionsWidth = 20
		var_3_0.dimensionsHeight = -30
	else
		var_3_0.currentOfficerDimensionsWidth = 0
		var_3_0.dimensionsHeight = -30
	end

	officer.ui.table.value_currentOfficer:setDimensions(CCSizeMake(150 + var_3_0.currentOfficerDimensionsWidth, 30 + var_3_0.dimensionsHeight))
	officer.ui.table.value_currentOfficer:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	officer.ui.table.value_currentOfficer:setHorizontalAlignment(kCCTextAlignmentLeft)
	officer.ui.table.value_resourceAdd:setDimensions(CCSizeMake(150, 30 + var_3_0.dimensionsHeight))
	officer.ui.table.value_resourceAdd:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	officer.ui.table.value_resourceAdd:setHorizontalAlignment(kCCTextAlignmentLeft)
	officer.ui.table.value_currentRank:setDimensions(CCSizeMake(150, 30 + var_3_0.dimensionsHeight))
	officer.ui.table.value_currentRank:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	officer.ui.table.value_currentRank:setHorizontalAlignment(kCCTextAlignmentLeft)
	officer.ui.table.value_nextOfficer:setDimensions(CCSizeMake(150, 30 + var_3_0.dimensionsHeight))
	officer.ui.table.value_nextOfficer:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	officer.ui.table.value_nextOfficer:setHorizontalAlignment(kCCTextAlignmentLeft)
	officer.ui.table.value_resourceAdd2:setDimensions(CCSizeMake(150, 30 + var_3_0.dimensionsHeight))
	officer.ui.table.value_resourceAdd2:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	officer.ui.table.value_resourceAdd2:setHorizontalAlignment(kCCTextAlignmentLeft)
	officer.ui.table.value_levelUpCondition:setDimensions(CCSizeMake(150, 30 + var_3_0.dimensionsHeight))
	officer.ui.table.value_levelUpCondition:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	officer.ui.table.value_levelUpCondition:setHorizontalAlignment(kCCTextAlignmentLeft)
	officer.ui.table.btn_salary:registerScriptTapHandler(officer.control.clicked_salary)
	officer.ui.table.btn_drop:registerScriptTapHandler(officer.control.clicked_drop)

	officer.control.isFisrtTime = true

	officer.ui.table.btn_salary:setEnabled(false)
	officer.ui.table.btn_drop:setEnabled(false)
	require("lua/guide/control")

	guide.uiElementsTable[1015] = officer.ui.table.btn_salary
end

function officer.ui.show()
	local var_4_0 = createBaseLayer()

	officer.ui.table = autoUI.initUI(var_4_0, getOfficerData())
	officer.ui.table.layer = var_4_0

	var_4_0:setTouchEnabled(true)
	officer.ui.init()

	officer.control.pageIndex = 1
	officer.control.rankData = {}

	officer.control.request_rankInfo()

	return var_4_0
end
