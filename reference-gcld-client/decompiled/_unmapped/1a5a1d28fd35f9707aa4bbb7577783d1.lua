require("lua/component/labelPage")
tool.requireRes("rankInfo/dailyFeat")

dailyFeatUI = {}
dailyFeatUI.uiTable = {}

local var_0_0 = dailyFeatUI
local var_0_1 = dailyFeatControl
local var_0_2 = {
	"gxb_jx5.png",
	"gxb_jx5.png",
	"gxb_jx4.png",
	"gxb_jx3.png",
	"gxb_jx2.png",
	"gxb_jx1.png"
}
local var_0_3 = false

function dailyFeatUI.show()
	local var_1_0 = createBaseLayer()

	rmgr.loadTable(dailyFeatConstant.RES)
	smgr.registerLayer(var_1_0, "featLayer")

	if var_0_0.uiTable then
		var_0_0.uiTable = nil
	end

	var_0_0.uiTable = autoUI.initUI(var_1_0, getDailyFeatData())

	var_0_0.addRankList()
	var_1_0:registerScriptTouchHandler(var_0_1.onTouch)
	var_1_0:setTouchEnabled(true)

	var_1_0.onEnter = var_0_1.onEnter
	var_1_0.onExit = var_0_1.onExit

	var_0_1.featGetRankInfo()

	return var_1_0
end

local function var_0_4()
	return {
		y = 0,
		x = 0,
		anchorPointX = 0,
		type = "pic",
		anchorPointY = 0,
		pic = "res/ui/rankInfo/DailyFeatView/gxb_ph_bg.jpg",
		children = {
			{
				y = 408,
				x = 872,
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/common/button/gxb_btn_c.png",
						name = "btn_showRank",
						pic1 = "res/ui/common/button/gxb_btn.png",
						pic3 = "res/ui/common/button/gxb_btn.png"
					}
				}
			},
			{
				left = 10,
				name = "todayRankDesc",
				y = 408,
				type = "pic",
				pic = "res/ui/rankInfo/DailyFeatView/gxb_tit_jrpm.png"
			},
			{
				width = 24,
				height = 36,
				name = "todayRankAtlas",
				type = "atlas",
				anchorPointX = 0,
				pic = "res/ui/rankInfo/DailyFeatView/gxb_tit_jrpm_digit.png",
				text = "0",
				y = 408,
				startChar = 48,
				anchorPointY = 0.5,
				x = 220
			},
			{
				visible = false,
				name = "noRankTitlePic",
				x = 250,
				type = "pic",
				y = 408,
				anchorPointY = 0.5,
				pic = "res/ui/rankInfo/DailyFeatView/gxb_tit_wsb.png",
				anchorPointX = 0
			},
			{
				y = 408,
				fontSize = 22,
				type = "label",
				right = 120,
				text = language.get(111017),
				color = ccc3(255, 255, 205)
			}
		}
	}
end

local function var_0_5(arg_3_0)
	local var_3_0 = #var_0_1.rankInfo.ranks
	local var_3_1 = var_0_1.rankInfo.ranks[arg_3_0]

	if var_3_0 < 6 then
		var_3_0 = 6
	end

	local var_3_2 = 15 + (arg_3_0 % 2 == 0 and 447 or 0)
	local var_3_3 = 8 + 123 * (math.ceil(var_3_0 / 2) - math.ceil(arg_3_0 / 2))

	return {
		type = "pic",
		anchorPointX = 0,
		anchorPointY = 0,
		pic = "res/ui/rankInfo/DailyFeatView/gxb_ph_bg.png",
		name = "card" .. arg_3_0,
		x = var_3_2,
		y = var_3_3,
		children = {
			{
				x = 59,
				y = 57,
				type = "pic",
				pic = "res/ui/common/playerHead/playerHead_icon_" .. var_3_1.pic .. ".png"
			},
			{
				y = 80,
				x = 145,
				scale = 0.4,
				type = "pic",
				pic = "res/ui/rankInfo/DailyFeatView/" .. var_0_2[var_3_1.featLv]
			},
			{
				height = 32,
				width = 26,
				type = "atlas",
				startChar = 48,
				y = 80,
				pic = "res/ui/rankInfo/DailyFeatView/gxb_ranking.png",
				right = 15,
				text = var_3_1.rank
			}
		}
	}
end

local function var_0_6()
	local var_4_0 = 0.7860915492957746
	local var_4_1 = {
		anchorPointX = 0,
		name = "drinkBg",
		type = "pic_9",
		pic = "res/ui/general/jailView/comm_view_laofang_1.png",
		y = 30,
		anchorPointY = 0,
		x = 25,
		middleRect = CCRectMake(51, 51, 1, 1),
		preferedSize = CCSizeMake(909, 523),
		children = {
			{
				type = "pic",
				name = "drinkRoomBg",
				x = 8,
				anchorPointX = 0,
				visible = false,
				pic = "res/ui/kfsy/kfsy_ky.jpg",
				y = 8,
				anchorPointY = 0,
				scale = var_4_0
			},
			{
				y = 395,
				x = 163,
				type = "pic",
				pic = "res/ui/rankInfo/DailyFeatView/yq_zr.png",
				scale = var_4_0
			},
			boxBg = {
				x = 620,
				name = "boxBg",
				y = 140,
				type = "pic",
				pic = "res/ui/rankInfo/DailyFeatView/yq_tz.png",
				children = {
					{
						y = 95,
						x = 115,
						type = "button",
						buttons = {
							{
								pic2 = "res/ui/rankInfo/DailyFeatView/yq_bx.png",
								pic3 = "res/ui/rankInfo/DailyFeatView/yq_bx.png",
								pic1 = "res/ui/rankInfo/DailyFeatView/yq_bx.png",
								name = "btn_drinkBox",
								enable = false,
								callBack = var_0_1.featGetDrinkReward
							}
						}
					}
				}
			},
			{
				anchorPointX = 0,
				name = "talk1",
				z = 200,
				type = "pic_9_tips",
				visible = false,
				pic = "frame:common_tip_frame_small.png",
				y = 445,
				anchorPointY = 0,
				x = 163,
				middleRect = CCRectMake(0, 0, 0, 0),
				preferedSize = CCSizeMake(290, 300),
				content = {
					{
						fontSize = 22,
						height = 0,
						width = 270,
						type = "label",
						top = 10,
						x = 76,
						text = var_0_1.rankInfo.iconType == 1 and language.get(111029) or language.get(111030)
					}
				}
			},
			{
				anchorPointX = 0,
				name = "talk2",
				z = 200,
				type = "pic_9_tips",
				visible = false,
				pic = "frame:common_tip_frame_small.png",
				y = 290,
				anchorPointY = 0,
				x = 420,
				middleRect = CCRectMake(0, 0, 0, 0),
				preferedSize = CCSizeMake(290, 300),
				content = {
					{
						fontSize = 22,
						height = 0,
						width = 270,
						type = "label",
						top = 10,
						x = 76,
						text = var_0_1.rankInfo.iconType == 1 and language.get(111028) or ""
					}
				}
			},
			{
				x = 290,
				name = "arrow",
				y = 260,
				type = "pic",
				z = 200,
				visible = false,
				pic = "res/ui/guide/jiantou-you.png"
			}
		}
	}
	local var_4_2 = {
		ccp(97, 220),
		ccp(475, 415),
		ccp(195, 170),
		ccp(575, 370)
	}
	local var_4_3 = var_0_1.rankInfo.generals
	local var_4_4 = #var_4_3 > 4 and 4 or #var_4_3

	for iter_4_0 = 1, var_4_4 do
		local var_4_5 = var_4_3[iter_4_0]

		table.insert(var_4_1.children, {
			type = "pic",
			pic = "res/ui/rankInfo/DailyFeatView/yq_wj" .. iter_4_0 .. ".png",
			x = var_4_2[iter_4_0].x,
			y = var_4_2[iter_4_0].y,
			scale = var_4_0
		})
		table.insert(var_4_1.children, {
			fontSize = 24,
			type = "label",
			anchorPointY = 0,
			x = var_4_2[iter_4_0].x,
			y = var_4_2[iter_4_0].y + 35,
			text = var_4_5.name
		})
	end

	local var_4_6 = {
		ccp(0, 80),
		ccp(55, 115),
		ccp(150, 0),
		ccp(205, 35)
	}

	for iter_4_1 = 1, 4 do
		table.insert(var_4_1.children.boxBg.children, {
			type = "pic",
			pic = "res/ui/rankInfo/DailyFeatView/yq_walk01.png",
			name = "walk_npc" .. iter_4_1,
			x = var_4_6[iter_4_1].x + 5,
			y = var_4_6[iter_4_1].y - 30 + 5,
			scale = 1 / var_4_0,
			z = iter_4_1 == 2 and -1 or 1
		})
	end

	return var_4_1
end

function var_0_0.addRankList()
	local var_5_0 = CCLayerColor:create(ccc4(0, 255, 0, 0), 909, 438)
	local var_5_1 = CCScrollView:create(CCSizeMake(915, 438), var_5_0)

	var_5_1:setPosition(ccp(-1, 5))
	var_5_1:setTouchEnabled(false)
	var_0_0.uiTable.featBackground:addChild(var_5_1, 200)

	var_0_0.scrollLayer = var_5_0

	autoUI.createUI(var_5_0, var_0_4(), var_0_0.uiTable)
	var_0_0.uiTable.todayRankAtlas:setPositionX(var_0_0.uiTable.todayRankDesc:getPositionX() + var_0_0.uiTable.todayRankDesc:getContentSize().width / 2)
	var_0_0.uiTable.noRankTitlePic:setPositionX(var_0_0.uiTable.todayRankDesc:getPositionX() + var_0_0.uiTable.todayRankDesc:getContentSize().width / 2)
	var_0_0.scrollLayer:setPosition(ccp(1, -382))
	var_0_0.uiTable.btn_showRank:registerScriptTapHandler(function()
		var_0_0.uiTable.btn_showRank:setEnabled(false)
		var_0_0.uiTable.openBoxButton:setEnabled(false)

		if var_0_3 then
			var_0_0.updateRankList()

			var_0_3 = false
		end

		local var_6_0 = var_0_0.uiTable.btn_showRank:getScale()

		if var_6_0 > 0 then
			var_0_0.scrollView:setContentOffset(ccp(0, var_0_0.scrollView:minContainerOffset().y))
			var_0_0.rankLayer:setVisible(true)
		end

		local var_6_1 = CCArray:create()

		var_6_1:addObject(CCMoveTo:create(0.5, ccp(1, var_6_0 > 0 and 0 or -382)))
		var_6_1:addObject(CCCallFuncN:create(function()
			var_0_0.uiTable.btn_showRank:setScale(-1 * var_6_0)
			var_0_0.uiTable.btn_showRank:setEnabled(true)

			if var_6_0 < 0 and var_0_1.rankInfo.featBoxNum > 0 then
				var_0_0.uiTable.openBoxButton:setEnabled(var_6_0 < 0)
			end

			var_0_0.rankLayer:setVisible(var_6_0 > 0)
		end))

		local var_6_2 = CCSequence:create(var_6_1)

		var_0_0.scrollLayer:runAction(var_6_2)
	end)

	local var_5_2 = CCLayerColor:create(ccc4(0, 255, 0, 0), 909, 369)
	local var_5_3 = CCScrollView:create(CCSizeMake(915, 369), var_5_2)

	var_5_3:setPosition(ccp(0, 5))
	var_5_3:setDirection(kCCScrollViewDirectionVertical)
	var_0_0.scrollLayer:addChild(var_5_3, 200)

	var_0_0.rankLayer = var_5_2
	var_0_0.scrollView = var_5_3
end

function var_0_0.updateRankList()
	var_0_0.rankLayer:removeAllChildrenWithCleanup(true)

	local var_8_0 = var_0_1.rankInfo.ranks
	local var_8_1 = 123 * (#var_8_0 >= 5 and math.ceil(#var_8_0 / 2) or 3)

	var_0_0.rankLayer:setContentSize(CCSizeMake(909, var_8_1))
	var_0_0.scrollView:setContentSize(CCSizeMake(909, var_8_1))
	var_0_0.scrollView:setContentOffset(ccp(0, var_0_0.scrollView:minContainerOffset().y))

	for iter_8_0 = 1, #var_8_0 do
		autoUI.createUI(var_0_0.rankLayer, var_0_5(iter_8_0), var_0_0.uiTable)

		local var_8_2 = var_0_1.rankInfo.ranks[iter_8_0]
		local var_8_3 = var_0_0.uiTable["card" .. iter_8_0]
		local var_8_4 = CCLabelTTF:create(language.get(111021, var_8_2.feat), "", 24)

		var_8_4:setColor(tool.hexToRgb("#A69265"))
		var_8_4:setAnchorPoint(ccp(0, 0.5))
		var_8_4:setPosition(ccp(170, 80))
		var_8_3:addChild(var_8_4)

		local var_8_5 = CCLabelTTF:create(var_8_2.playerName, "", 24)

		var_8_5:setColor(tool.hexToRgb("#EBD1A7"))
		var_8_5:setAnchorPoint(ccp(0, 0.5))
		var_8_5:setPosition(ccp(130, 30))
		var_8_3:addChild(var_8_5)

		local var_8_6 = CCLabelTTF:create(language.get(111022, var_8_2.playerLv), "", 24)

		var_8_6:setColor(tool.hexToRgb("#A69265"))
		var_8_6:setAnchorPoint(ccp(1, 0.5))
		var_8_6:setPosition(ccp(417, 30))
		var_8_3:addChild(var_8_6)
	end
end

function var_0_0.getNumberTextByNumber(arg_9_0)
	if arg_9_0 > 100000 then
		return language.get(111001, math.floor(arg_9_0 / 10000))
	else
		return tostring(arg_9_0)
	end
end

function var_0_0.getRewardNumberTextByNumber(arg_10_0)
	if arg_10_0 == 0 then
		return language.get(111002)
	else
		return arg_10_0
	end
end

function var_0_0.showUpperRightTip(arg_11_0)
	local var_11_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_11_0:registerScriptTouchHandler(function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == CCTOUCHBEGAN then
			return true
		elseif arg_12_0 == CCTOUCHMOVED then
			return true
		elseif arg_12_0 == CCTOUCHENDED then
			var_0_0.uiTable["upperRightButton" .. arg_11_0]:unselected()
			var_11_0:removeFromParentAndCleanup(true)

			return true
		end
	end, false, true)
	var_11_0:setTouchEnabled(true)

	local var_11_1 = {}

	if conf.language == "kr" then
		var_11_1.tip1Width = 200
		var_11_1.tip2Width = -20
		var_11_1.tip3Width = 170
		var_11_1.tip4Width = 60
	else
		var_11_1.tip1Width = 0
		var_11_1.tip2Width = 0
		var_11_1.tip3Width = 0
		var_11_1.tip4Width = 0
	end

	local var_11_2
	local var_11_3 = 380
	local var_11_4 = 80

	if arg_11_0 == 1 then
		var_11_2 = language.get(111003, var_0_0.getNumberTextByNumber(var_0_1.rankInfo.needKillNum), var_0_1.rankInfo.needFeat + var_0_1.rankInfo.feat)
		var_11_3 = var_11_3 + #var_0_0.getNumberTextByNumber(var_0_1.rankInfo.needKillNum) * 2 + var_11_1.tip1Width
		var_11_4 = 60
	elseif arg_11_0 == 2 then
		var_11_2 = language.get(111004, var_0_1.rankInfo.occupyFeat)
		var_11_3 = 350 + var_11_1.tip2Width
	elseif arg_11_0 == 3 then
		var_11_2 = language.get(111005, var_0_1.rankInfo.assistFeat)
		var_11_3 = 352 + var_11_1.tip3Width
	elseif arg_11_0 == 4 then
		var_11_2 = language.get(111006, var_0_1.rankInfo.cheerFeat)
		var_11_3 = var_11_3 + var_11_1.tip4Width
	end

	autoUI.createUI(var_11_0, getFeatRankInfoTipFrameData(CCSizeMake(var_11_3, var_11_4)), var_0_0.uiTable)
	var_0_0.uiTable.featRankInfoTipLabel:setString(var_11_2)
	var_0_0.uiTable["upperRightButton" .. arg_11_0]:selected()

	local var_11_5, var_11_6 = tool.getPositionInScreen(var_0_0.uiTable["upperRightButton" .. arg_11_0])

	var_0_0.uiTable.featRankInfoTipFrame:setPosition(ccp(var_11_5 - arg_11_0 * 40, var_11_6 - 80))
	smgr.rootLayer:addChild(var_11_0, 60000)
end

function var_0_0.setUpFeatProgressBar(arg_13_0)
	for iter_13_0 = 1, #arg_13_0.lvs do
		local var_13_0 = false

		var_0_0.uiTable["progressLabel" .. iter_13_0]:setString(arg_13_0.lvs[iter_13_0].feat)
		var_0_0.uiTable["boxAtlasGray" .. iter_13_0]:setString(arg_13_0.lvs[iter_13_0].rewardNum)
		var_0_0.uiTable["boxAtlasGray" .. iter_13_0]:setVisible(true)
		var_0_0.uiTable["boxAtlas" .. iter_13_0]:setString(arg_13_0.lvs[iter_13_0].rewardNum)
		var_0_0.uiTable["boxAtlas" .. iter_13_0]:setVisible(false)

		local var_13_1 = var_0_0.uiTable["boxAtlas" .. iter_13_0]:getContentSize()

		var_0_0.uiTable["boxAtlas" .. iter_13_0]:setPositionX(80 + var_13_1.width / 2)
		var_0_0.uiTable["boxAtlasGray" .. iter_13_0]:setPositionX(80 + var_13_1.width / 2)

		if iter_13_0 < arg_13_0.lv then
			var_0_0.uiTable["featProgressBar" .. iter_13_0]:setPercentage(100)

			var_13_0 = true
		elseif iter_13_0 == arg_13_0.lv then
			local var_13_2

			if iter_13_0 == 1 then
				var_13_2 = (arg_13_0.lvs[iter_13_0].feat - arg_13_0.needFeat) / arg_13_0.lvs[iter_13_0].feat * 100
			else
				var_13_2 = (arg_13_0.lvs[iter_13_0].feat - arg_13_0.lvs[iter_13_0 - 1].feat - arg_13_0.needFeat) / (arg_13_0.lvs[iter_13_0].feat - arg_13_0.lvs[iter_13_0 - 1].feat) * 100

				log.info("feat progress at index:", iter_13_0, "progress: ", var_13_2)
			end

			if var_13_2 == 100 then
				var_13_0 = true
			end

			var_0_0.uiTable["featProgressBar" .. iter_13_0]:setPercentage(var_13_2)
		elseif iter_13_0 > arg_13_0.lv then
			var_0_0.uiTable["featProgressBar" .. iter_13_0]:setPercentage(0)
		end

		if var_13_0 then
			var_0_0.uiTable["progressBoxPic" .. iter_13_0]:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/gxb_pb_bx.png"):displayFrame())
			var_0_0.uiTable["icon_multi" .. iter_13_0]:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/icon_numb_multi.png"):displayFrame())
			var_0_0.uiTable["boxAtlasGray" .. iter_13_0]:setVisible(false)
			var_0_0.uiTable["boxAtlas" .. iter_13_0]:setVisible(true)
		end

		local var_13_3 = arg_13_0.lvs[iter_13_0].type

		if var_13_3 == 0 then
			var_0_0.uiTable["wine" .. iter_13_0]:setVisible(false)
		else
			if var_13_0 then
				if var_13_3 == 1 then
					var_0_0.uiTable["wine" .. iter_13_0]:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/gxb_yjh_h.png"):displayFrame())
				elseif var_13_3 == 2 then
					var_0_0.uiTable["wine" .. iter_13_0]:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/gxb_jjh_h.png"):displayFrame())
				end
			else
				var_0_0.uiTable["wine" .. iter_13_0]:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/gxb_jh_gray.png"):displayFrame())
			end

			var_0_0.uiTable["wine" .. iter_13_0]:setVisible(true)
		end
	end
end

function var_0_0.updateBoxNum(arg_14_0)
	var_0_0.uiTable.mark:setVisible(true)
	var_0_0.uiTable.boxNumLabel:setString(arg_14_0.featBoxNum)

	local var_14_0 = var_0_0.uiTable.boxNumLabel:getContentSize()

	var_0_0.uiTable.boxNumLabel:setPositionX(560 + var_14_0.width / 2)

	if arg_14_0.featBoxNum >= arg_14_0.maxFeatBoxNum then
		var_0_0.uiTable.boxMax:setPositionX(560 + var_14_0.width + 33)
		var_0_0.uiTable.boxMax:setVisible(true)
	else
		var_0_0.uiTable.boxMax:setVisible(false)
	end

	if arg_14_0.featBoxNum > 0 then
		var_0_0.uiTable.openBoxButton:setEnabled(true)
	else
		var_0_0.uiTable.openBoxButton:setEnabled(false)
		var_0_0.uiTable.light:setVisible(false)
		var_0_0.uiTable.light:stopAllActions()
	end
end

function var_0_0.updateFeatPanel(arg_15_0)
	var_0_0.setUpFeatProgressBar(arg_15_0)
	var_0_0.uiTable.killNumLabel:setString("x" .. var_0_0.getNumberTextByNumber(arg_15_0.killNum))
	var_0_0.uiTable.stormNumLabel:setString("x" .. arg_15_0.occupy)
	var_0_0.uiTable.assitNumLabel:setString("x" .. arg_15_0.assist)
	var_0_0.uiTable.flagNumLabel:setString("x" .. arg_15_0.cheer)

	if arg_15_0.openCityFeat and arg_15_0.openCityFeat == 1 then
		-- block empty
	else
		for iter_15_0 = 2, 4 do
			var_0_0.uiTable["upperRightButton" .. iter_15_0]:setEnabled(false)
		end
	end

	var_0_0.updateBoxNum(arg_15_0)

	local var_15_0 = tostring(arg_15_0.rank)
	local var_15_1 = tostring(arg_15_0.feat)

	if arg_15_0.rank == 0 then
		var_0_0.uiTable.noRankTitlePic:setVisible(true)
		var_0_0.uiTable.todayRankAtlas:setVisible(false)
	else
		var_0_0.uiTable.noRankTitlePic:setVisible(false)
		var_0_0.uiTable.todayRankAtlas:setVisible(true)
		var_0_0.uiTable.todayRankAtlas:setString(arg_15_0.rank)
	end

	var_0_0.uiTable.featValueAtlas:setString(arg_15_0.feat)

	local var_15_2 = var_0_0.uiTable.featValueAtlas:getContentSize()
	local var_15_3 = var_0_0.uiTable.todayFeatTitlePic:getPositionX() + var_0_0.uiTable.todayFeatTitlePic:getContentSize().width / 2 + 10

	var_0_0.uiTable.featValueAtlas:setPositionX(var_15_3)
	var_0_0.uiTable.featIcon:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/" .. var_0_2[arg_15_0.lv]):displayFrame())
	var_0_0.uiTable.featIcon:setVisible(true)

	if arg_15_0.iconType == 0 and arg_15_0.received == 1 then
		var_0_0.uiTable.npcBg:setVisible(false)
		var_0_0.uiTable.btn_showRank:setEnabled(true)

		var_0_3 = true
	else
		local var_15_4 = ""
		local var_15_5 = true
		local var_15_6 = "res/ui/common/halfPic/halfPic_xushu.png"

		if arg_15_0.iconType == 0 then
			var_15_5 = false

			local var_15_7 = (("" .. arg_15_0.lastCopper .. language.get(10101) .. " ") .. arg_15_0.lastExp .. language.get(10107) .. " ") .. arg_15_0.lastIron .. language.get(10104)

			var_15_4 = language.get(111018, arg_15_0.lastRank, var_15_7)
			var_15_6 = "res/ui/comment/xiaoqian.png"
		elseif arg_15_0.iconType == 1 then
			local var_15_8 = {
				111023,
				111024,
				111025,
				111026
			}

			var_15_4 = language.get(var_15_8[math.random(1, 4)])
		elseif arg_15_0.iconType == 2 then
			var_15_4 = language.get(111027)
		end

		var_0_0.uiTable.drinkButton:setVisible(var_15_5)
		var_0_0.uiTable.getRewardButton:setVisible(not var_15_5)
		var_0_0.uiTable.btnLb:setString(language.get(var_15_5 and 111031 or 111020))
		var_0_0.uiTable.npcMsg:setString(var_15_4)
		var_0_0.uiTable.npcPic:setDisplayFrame(CCSprite:create(var_15_6):displayFrame())
		var_0_0.uiTable.npcBg:setVisible(true)
		var_0_0.uiTable.btn_showRank:setEnabled(false)
		var_0_0.uiTable.openBoxButton:setEnabled(false)
	end
end

function var_0_0.showOpenBoxEffect()
	var_0_0.uiTable.light:setVisible(true)
	var_0_0.uiTable.light:stopAllActions()

	local var_16_0 = CCArray:create()

	var_16_0:addObject(CCCallFuncN:create(function()
		var_0_0.uiTable.openBoxButton:selected()
		var_0_0.uiTable.light:setOpacity(120)
	end))
	var_16_0:addObject(CCFadeIn:create(0.6))
	var_16_0:addObject(CCFadeOut:create(1.4))
	var_16_0:addObject(CCCallFuncN:create(function()
		var_0_0.uiTable.openBoxButton:unselected()
	end))

	local var_16_1 = CCSequence:create(var_16_0)

	var_0_0.uiTable.light:runAction(var_16_1)
end

function var_0_0.onOpenBoxButtonTap()
	log.info("ui.onOpenBoxButtonTap")
	var_0_0.showOpenBoxEffect()
	var_0_1.featGetBoxReward()
end

function var_0_0.onDrinkButtonTap()
	log.info("ui.onDrinkButtonTap")
	var_0_0.uiTable.featBackground:setVisible(false)

	local var_20_0 = smgr.getLayer("featLayer")

	autoUI.createUI(var_20_0, var_0_6(), var_0_0.uiTable)
	var_0_0.uiTable.drinkRoomBg:setTextureRect(CCRectMake(0, 40, 1136, 645))
	var_0_0.uiTable.drinkRoomBg:setVisible(true)

	for iter_20_0 = 1, 4 do
		local var_20_1 = CCArray:create()

		for iter_20_1 = 1, 12 do
			local var_20_2 = CCSprite:create(string.format("res/ui/rankInfo/DailyFeatView/yq_walk%02d.png", iter_20_1))

			var_20_1:addObject(var_20_2:displayFrame())
		end

		local var_20_3 = CCAnimation:createWithSpriteFrames(var_20_1, 0.05)
		local var_20_4 = CCAnimate:create(var_20_3)

		var_0_0.uiTable["walk_npc" .. iter_20_0]:runAction(CCRepeat:create(var_20_4, 2))
	end

	local var_20_5 = CCMoveBy:create(0.4, ccp(50, 0))
	local var_20_6 = CCEaseOut:create(var_20_5, 1)
	local var_20_7 = CCMoveBy:create(0.4, ccp(-50, 0))
	local var_20_8 = CCEaseIn:create(var_20_7, 1)
	local var_20_9 = CCArray:create()

	var_20_9:addObject(var_20_6)
	var_20_9:addObject(var_20_8)

	local var_20_10 = CCSequence:create(var_20_9)
	local var_20_11 = CCRepeatForever:create(tolua.cast(var_20_10, "CCActionInterval"))

	var_0_0.uiTable.arrow:runAction(var_20_11)
	var_0_0.uiTable.boxBg:runAction(CCMoveBy:create(1.2, ccp(-200, 100)))

	local var_20_12 = CCArray:create()

	var_20_12:addObject(CCCallFuncN:create(function()
		if var_0_1.rankInfo.iconType == 1 then
			var_0_0.uiTable.talk2:setVisible(true)
		end
	end))
	var_20_12:addObject(CCDelayTime:create(1))
	var_20_12:addObject(CCCallFuncN:create(function()
		var_0_0.uiTable.talk1:setVisible(false)
		var_0_0.uiTable.talk2:setVisible(false)
	end))
	var_20_12:addObject(CCCallFuncN:create(function()
		var_0_0.uiTable.talk1:setVisible(true)
	end))
	var_20_12:addObject(CCDelayTime:create(0.8))
	var_20_12:addObject(CCCallFuncN:create(function()
		var_0_0.uiTable.talk1:setVisible(false)
		var_0_0.uiTable.talk2:setVisible(false)
	end))
	var_20_12:addObject(CCCallFuncN:create(function()
		var_0_0.uiTable.arrow:setVisible(true)
		var_0_0.uiTable.btn_drinkBox:setEnabled(true)
	end))

	local var_20_13 = CCSequence:create(var_20_12)

	var_0_0.uiTable.boxBg:runAction(var_20_13)
end

function var_0_0.onGetRewardButtonTap()
	var_0_1.featGetRankReward()
end

local var_0_7 = {
	tieqifang = 1119,
	machang = 1107,
	gaolu = 1120,
	qianzhuang = 1106,
	junyingsi = 1024,
	junyinger = 1022,
	shimofang = 1115,
	ronglianlu = 1116,
	kuangdonger = 1032,
	shuilizhan = 1114,
	yulinchu = 1108,
	tiechengfu = 1121,
	linzhongyin = 1109
}
local var_0_8 = {
	exp = 6,
	iron = 4,
	farmReformDrawing = 30012,
	copper = 1
}
local var_0_9 = {
	1,
	2,
	3,
	4
}

var_0_9[9] = 5
var_0_9[6] = 6
var_0_9[17] = 7
var_0_9[24] = 23
var_0_9[26] = 25
var_0_9[27] = 26
var_0_9[28] = 27
var_0_9[29] = 28
var_0_9[91] = 1701
var_0_9[100] = 100
var_0_9[40] = 40
var_0_9[81] = 24
var_0_9[102] = 41
var_0_9[57] = 57

function var_0_0.showFlyText(arg_27_0)
	local var_27_0 = {}

	if arg_27_0.copper or arg_27_0.farmReformDrawing then
		local var_27_1 = 1

		for iter_27_0, iter_27_1 in pairs(arg_27_0) do
			if iter_27_1 ~= 0 then
				var_27_0[var_27_1] = {}

				if var_0_8[iter_27_0] then
					var_27_0[var_27_1].id = var_0_8[iter_27_0]
				else
					log.error("rank reward didn't recognized")

					var_27_0[var_27_1].id = var_0_8.coppper
				end

				var_27_0[var_27_1].value = iter_27_1
				var_27_1 = var_27_1 + 1
			end
		end
	elseif arg_27_0.type then
		if arg_27_0.type == 7 then
			if arg_27_0.pic then
				if var_0_7[arg_27_0.pic] then
					rewardId = var_0_7[arg_27_0.pic]
				else
					log.error("box reward didn't recognized", arg_27_0.type, arg_27_0.pic)

					rewardId = 5
				end
			end
		elseif var_0_9[arg_27_0.type] then
			rewardId = var_0_9[arg_27_0.type]
		else
			log.error("box reward didn't recognized", arg_27_0.type)
			log.info("box reward didn't recognized", arg_27_0.type)

			rewardId = 5
		end

		if arg_27_0.type > 1000 and arg_27_0.type < 1130 then
			eventManager.dispatchEvent("resourceAreaDidGetPic")
		end

		var_27_0[1] = {}
		var_27_0[1].id = rewardId
		var_27_0[1].value = arg_27_0.num

		if arg_27_0.beaf then
			var_27_0[2] = {}
			var_27_0[2].id = 57
			var_27_0[2].value = arg_27_0.beaf
		end

		if arg_27_0.baoji then
			log.info("显示暴击")

			local var_27_2 = arg_27_0.baoji

			if var_0_0.bjSprite and not tolua.isnull(var_0_0.bjSprite) then
				var_0_0.bjSprite:removeFromParentAndCleanup(true)

				var_0_0.bjSprite = nil
			end

			local var_27_3 = smgr.getLayer("pushLayer")
			local var_27_4 = CCSprite:create("res/ui/activity/ironReward/js_bj_" .. var_27_2 .. ".png")
			local var_27_5 = ccp(visibleSize.width / 2, visibleSize.height * 0.35)

			var_27_4:setPosition(var_27_5)
			var_27_3:addChild(var_27_4)

			local var_27_6 = CCArray:create()

			var_27_6:addObject(CCDelayTime:create(0.3))
			var_27_6:addObject(CCFadeOut:create(1))
			var_27_6:addObject(CCCallFunc:create(function()
				var_27_4:removeFromParentAndCleanup(true)

				var_27_4 = nil
			end))
			var_27_4:runAction(CCSequence:create(var_27_6))

			var_0_0.bjSprite = var_27_4
		end
	end

	globalAction_gotResource(var_27_0, ccp(visibleSize.width / 2, visibleSize.height * 0.5))
end
