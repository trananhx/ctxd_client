local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = ccc3(0, 180, 0)
local var_0_2 = colorQuality[5]
local var_0_3 = colorQuality[4]
local var_0_4 = colorQuality[2]
local var_0_5 = class("EliteChampion", function()
	return createBaseLayer()
end)

var_0_5.layout = {
	y = 0,
	name = "Scene",
	type = "node",
	x = 0,
	children = {
		{
			name = "panel",
			type = "sprite9",
			preferedSize = CCSizeMake(960, 580),
			middleRect = CCRectMake(30, 30, 45, 45),
			x = visibleSize.width / 2,
			y = visibleSize.height / 2 - 30,
			pic = {
				frame = true,
				path = "bigPanel.png"
			},
			children = {
				{
					x = 924,
					name = "btn_close",
					h = 33,
					type = "button",
					w = 32,
					y = 604,
					scale = 2,
					normal = {
						frame = true,
						path = "btn_close_a.png"
					},
					touched = {
						frame = true,
						path = "btn_close_c.png"
					}
				},
				{
					y = 290,
					name = "bg",
					type = "sprite",
					x = 480,
					pic = {
						path = "res/ui/weapon/machine/tsc_bg.jpg"
					}
				},
				{
					y = 515,
					name = "title",
					type = "sprite",
					x = 480,
					pic = {
						path = "res/ui/world/jywd/cbzz_title.png"
					}
				},
				{
					y = 29,
					name = "pic",
					type = "sprite",
					x = 27,
					anchorPoint = ccp(0, 0)
				},
				{
					y = 356,
					type = "sprite",
					x = 939,
					anchorPoint = ccp(1, 0),
					pic = {
						path = "res/ui/world/jywd/cbzz_word_di.png"
					},
					children = {
						{
							y = 62,
							x = 330,
							type = "sprite",
							pic = {
								path = "res/ui/world/jywd/cbzz_word.png"
							}
						}
					}
				},
				{
					y = 45,
					type = "sprite",
					x = 180,
					pic = {
						path = "res/ui/kfyz/kfyz_word_bg.png"
					},
					children = {
						{
							y = 32,
							name = "name",
							type = "label",
							x = 138,
							fontsize = 22,
							color = var_0_3
						}
					}
				},
				{
					y = 85,
					type = "sprite",
					x = 180,
					pic = {
						path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
					},
					children = {
						{
							y = 36.0146,
							x = 182,
							type = "sprite",
							pic = {
								path = "res/ui/world/jywd/cbzz_word_bjgj.png"
							}
						}
					}
				},
				{
					y = 24,
					name = "bg_list",
					type = "sprite",
					x = 938,
					anchorPoint = ccp(1, 0),
					pic = {
						path = "res/ui/nation/buildNation/dongying/yzdy_zjb_bg_02.png"
					},
					children = {
						{
							fontsize = 22,
							y = 315,
							type = "label",
							x = 80,
							textId = 490118,
							color = ccc3(235, 209, 167)
						},
						{
							fontsize = 22,
							y = 315,
							type = "label",
							x = 270,
							textId = 490119,
							color = ccc3(235, 209, 167)
						},
						{
							fontsize = 22,
							y = 315,
							type = "label",
							x = 460,
							textId = 490120,
							color = ccc3(235, 209, 167)
						}
					}
				},
				{
					w = 58,
					name = "btn_kfzb",
					h = 134,
					type = "button",
					y = 258,
					x = 345,
					normal = {
						path = "res/ui/world/jywd/cbzz_btn_kfzb_g.png"
					},
					touched = {
						path = "res/ui/world/jywd/cbzz_btn_kfzb.png"
					}
				},
				{
					w = 58,
					name = "btn_kfwd",
					h = 134,
					type = "button",
					y = 130,
					x = 345,
					normal = {
						path = "res/ui/world/jywd/cbzz_btn_jywd_g.png"
					},
					touched = {
						path = "res/ui/world/jywd/cbzz_btn_jywd.png"
					}
				}
			}
		}
	}
}
var_0_5.rankCell = {
	y = 0,
	name = "node",
	type = "node",
	x = 0,
	children = {
		{
			y = 0,
			name = "bg",
			type = "sprite",
			x = 8,
			anchorPoint = ccp(0, 0)
		},
		{
			type = "sprite",
			name = "curr",
			y = 19,
			visible = false,
			x = 80,
			pic = {
				path = "res/ui/world/jywd/cbzz_word_bjgj.png"
			}
		},
		{
			type = "label",
			name = "match",
			y = 19,
			visible = false,
			x = 80,
			fontsize = 22,
			color = var_0_0
		},
		{
			y = 19,
			name = "server",
			type = "label",
			x = 270,
			fontsize = 22,
			color = var_0_0
		},
		{
			y = 19,
			name = "name",
			type = "label",
			x = 460,
			fontsize = 22,
			color = var_0_0
		}
	}
}

function var_0_5.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.kfzbGetKfeliteChampionInfo)
end

function var_0_5.createRankList(arg_4_0, arg_4_1)
	local function var_4_0(arg_5_0, arg_5_1)
		log.info("cell touched at : ", arg_5_1:getIdx())
	end

	local function var_4_1(arg_6_0, arg_6_1)
		return 40, 559
	end

	local function var_4_2(arg_7_0, arg_7_1)
		local var_7_0 = arg_7_0:dequeueCell()

		if var_7_0 then
			var_7_0:removeAllChildrenWithCleanup(true)
		else
			var_7_0 = CCTableViewCell:new()
		end

		local var_7_1 = arg_4_1[arg_7_1 + 1]

		if var_7_1 then
			local var_7_2 = {}

			uiutil.initWidgets(var_7_2, arg_4_0.rankCell)
			var_7_2.widgets.node:setPosition(ccp(0, 0))
			var_7_0:addChild(var_7_2.widgets.node)

			local var_7_3 = arg_7_1 % 2 == 0 and "yzdy_zjb_list02.png" or "yzdy_zjb_list01.png"

			var_7_2.widgets.bg:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/dongying/" .. var_7_3):displayFrame())

			local var_7_4 = arg_7_1 == 0

			var_7_2.widgets.curr:setVisible(var_7_4)
			var_7_2.widgets.match:setVisible(not var_7_4)

			if not var_7_4 then
				var_7_2.widgets.match:setString(language.get(490114, #arg_4_1 - arg_7_1))
			end

			var_7_2.widgets.server:setString(language.get(390469, var_7_1.serverName))
			var_7_2.widgets.name:setString(var_7_1.playerName)
		end

		return var_7_0
	end

	local function var_4_3()
		if arg_4_1 and #arg_4_1 > 0 then
			return #arg_4_1
		else
			return 0
		end
	end

	local var_4_4 = CCTableView:create(CCSizeMake(575, 283))

	var_4_4:setPosition(0, 10)
	var_4_4:setDirection(kCCScrollViewDirectionVertical)
	var_4_4:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_4_0.view.widgets.bg_list:addChild(var_4_4)

	if arg_4_0.rankList then
		arg_4_0.rankList:removeFromParentAndCleanup(true)
	end

	arg_4_0.rankList = var_4_4

	var_4_4:registerScriptHandler(var_4_0, CCTableView.kTableCellTouched)
	var_4_4:registerScriptHandler(var_4_1, CCTableView.kTableCellSizeForIndex)
	var_4_4:registerScriptHandler(var_4_2, CCTableView.kTableCellSizeAtIndex)
	var_4_4:registerScriptHandler(var_4_3, CCTableView.kNumberOfCellsInTableView)
	var_4_4:reloadData()
end

function var_0_5.updateChampion(arg_9_0, arg_9_1)
	arg_9_0.view.widgets.btn_kfzb:setHighlighted(arg_9_1)
	arg_9_0.view.widgets.btn_kfwd:setHighlighted(not arg_9_1)

	if arg_9_1 == arg_9_0.isKfzb then
		return
	end

	local var_9_0 = arg_9_1 and arg_9_0.info.kfzbChampions or arg_9_0.info.kfwdChampions
	local var_9_1 = var_9_0[1]

	arg_9_0.view.widgets.pic:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerPic/player%d.png", var_9_1.pic)):displayFrame())
	arg_9_0.view.widgets.name:setString(language.get(490116, var_9_1.serverName, var_9_1.playerName))
	arg_9_0:createRankList(var_9_0)

	arg_9_0.isKfzb = arg_9_1
end

function var_0_5.showPanel(arg_10_0, arg_10_1)
	arg_10_0.info = arg_10_1

	local function var_10_0(arg_11_0, arg_11_1)
		return arg_11_0.seasonId > arg_11_1.seasonId
	end

	arg_10_1.kfzbChampions = arg_10_1.kfzbChampions or {}
	arg_10_1.kfwdChampions = arg_10_1.kfwdChampions or {}

	table.sort(arg_10_1.kfzbChampions, var_10_0)
	table.sort(arg_10_1.kfwdChampions, var_10_0)
	arg_10_0.view.widgets.btn_kfzb:setEnabled(arg_10_1.kfzbChampions[1] ~= nil)
	arg_10_0.view.widgets.btn_kfwd:setEnabled(arg_10_1.kfwdChampions[1] ~= nil)

	if arg_10_1.kfzbChampions[1] ~= nil then
		arg_10_0:updateChampion(true)
	else
		arg_10_0:updateChampion(false)
	end
end

function var_0_5.ctor(arg_12_0, arg_12_1)
	log.info("@@ 历届冠军")

	arg_12_0.view = {}

	uiutil.initWidgets(arg_12_0.view, arg_12_0.layout)
	swallowTouch(arg_12_0)

	if arg_12_1 then
		arg_12_0:addChild(arg_12_0.view.widgets.Scene)
		arg_12_1:addChild(arg_12_0)
	end

	arg_12_0.view.widgets.btn_close:addHandleOfControlEvent(function()
		log.info("btn_close")
		arg_12_0:removeFromParentAndCleanup(true)
	end, CCControlEventTouchUpInside)
	arg_12_0.view.widgets.btn_kfzb:addHandleOfControlEvent(function()
		log.info("btn_kfzb")
		arg_12_0:updateChampion(true)
	end, CCControlEventTouchUpInside)
	arg_12_0.view.widgets.btn_kfwd:addHandleOfControlEvent(function()
		log.info("btn_kfwd")
		arg_12_0:updateChampion(false)
	end, CCControlEventTouchUpInside)
	arg_12_0:refresh()
end

return var_0_5
