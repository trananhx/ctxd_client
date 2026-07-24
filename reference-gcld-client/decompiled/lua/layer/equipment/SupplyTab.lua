local var_0_0 = {
	[162] = {},
	[199] = {},
	[31] = {
		type = 10063
	},
	{
		pic = "ying",
		name = language.get(10101)
	},
	{
		pic = "mucai",
		name = language.get(10102)
	},
	{
		pic = "liang",
		name = language.get(10103)
	},
	{
		pic = "kuang",
		name = language.get(10104)
	},
	[19] = {},
	[42] = {
		pic = "mubingling",
		type = 5,
		name = language.get(10105)
	},
	[21] = {
		pic = "baoshi1",
		type = 7,
		name = language.get(10106)
	},
	[50] = {
		pic = "zslsp",
		type = 10034,
		name = language.get(213404)
	},
	[217] = {
		pic = "chuiz01",
		type = 10064,
		name = language.get(213406)
	},
	[218] = {
		pic = "chuiz01",
		type = 10064,
		name = language.get(213406)
	},
	[1001] = {},
	[1002] = {
		pic = "chuizi02",
		type = 91002,
		name = language.get(213405)
	},
	[1003] = {},
	[41] = {
		type = 30012
	},
	[1901] = {
		pic = "yingxiongtie"
	},
	[1902] = {
		pic = "jinchengling"
	},
	[1903] = {
		pic = "tongxingtie"
	},
	[1904] = {
		pic = "waizushangquan"
	},
	[1905] = {
		pic = "baoshishangquan"
	}
}
local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = colorQuality[5]
local var_0_3 = colorQuality[0]
local var_0_4 = tool.hexToRgb("#FFCC00")
local var_0_5 = {
	"freeTime"
}
local var_0_6 = class("SupplyTab", function()
	return createBaseLayer()
end)

var_0_6.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			y = 290,
			name = "bg",
			type = "sprite",
			x = 480,
			pic = {
				path = "res/ui/weapon/diamondShop/warlock_view1.jpg"
			},
			children = {
				{
					y = 504,
					name = "title",
					type = "sprite",
					x = 458,
					pic = {
						path = "res/ui/equip/supply/jxc_word_jxc.png"
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_refresh",
					h = 50,
					type = "button",
					w = 160,
					y = 35,
					x = 830,
					normal = {
						frame = true,
						path = "btn3_gre_a.png"
					},
					touched = {
						frame = true,
						path = "btn3_gre_c.png"
					},
					children = {
						{
							fontSize = 22,
							y = 25,
							type = "label",
							x = 80,
							textId = 215403,
							color = var_0_1
						}
					}
				},
				{
					fontSize = 22,
					name = "remainTimes",
					y = 35,
					type = "label",
					x = 750,
					color = var_0_1,
					anchorPoint = ccp(1, 0.5)
				},
				{
					y = 460,
					name = "node_freeTime",
					type = "node",
					x = 30,
					children = {
						{
							y = 0,
							x = 0,
							type = "sprite",
							scale = 0.6,
							pic = {
								frame = true,
								path = "nhq.jpg"
							}
						},
						{
							fontSize = 22,
							name = "freeTime",
							y = 0,
							type = "label",
							x = 25,
							color = var_0_4,
							anchorPoint = ccp(0, 0.5)
						}
					}
				}
			}
		}
	}
}

function var_0_6.getLayoutItem(arg_2_0, arg_2_1)
	return {
		zoomOnTouchDown = true,
		h = 118,
		type = "button",
		w = 296,
		y = 0,
		x = 0,
		name = "btn_supply" .. arg_2_1,
		normal = {
			path = "res/ui/equip/supply/jxc_item_di_01.png"
		},
		touched = {
			path = "res/ui/equip/supply/jxc_item_di_01.png"
		},
		children = {
			{
				zoomOnTouchDown = true,
				h = 78,
				type = "button",
				w = 78,
				y = 59,
				x = 61,
				name = "btn_icon" .. arg_2_1,
				normal = {
					path = "res/ui/silk/market/scpm_samll_view_icon.png"
				},
				touched = {
					path = "res/ui/silk/market/scpm_samll_view_icon.png"
				},
				children = {
					{
						y = 39,
						type = "sprite",
						x = 39,
						name = "icon" .. arg_2_1,
						pic = {
							path = "res/default"
						}
					},
					{
						y = 73,
						type = "sprite",
						x = 39,
						name = "bar" .. arg_2_1,
						pic = {
							path = "res/ui/silk/market/bar.png"
						}
					}
				}
			},
			{
				y = 84,
				x = 145,
				type = "node",
				name = "node_star" .. arg_2_1
			},
			{
				type = "sprite",
				y = 89,
				visible = false,
				x = 270,
				name = "blackMarket" .. arg_2_1,
				pic = {
					path = "res/ui/weapon/casting/zz_flag.png"
				},
				children = {
					{
						y = 43,
						x = 21,
						type = "sprite",
						pic = {
							path = "res/ui/weapon/casting/zz_flag_npc.png"
						}
					}
				}
			},
			{
				fontSize = 22,
				type = "label",
				visible = false,
				y = 84,
				x = 125,
				color = var_0_1,
				name = "name" .. arg_2_1,
				anchorPoint = ccp(0, 0.5)
			},
			{
				x = 145,
				y = 32,
				type = "sprite",
				scale = 0.8,
				name = "icon_request" .. arg_2_1,
				pic = {
					frame = true,
					path = "res_icon_1.png"
				}
			},
			{
				fontSize = 22,
				y = 32,
				type = "label",
				x = 175,
				color = var_0_1,
				name = "num_request" .. arg_2_1,
				anchorPoint = ccp(0, 0.5)
			},
			{
				type = "sprite",
				y = 55,
				visible = false,
				x = 85,
				name = "bought" .. arg_2_1,
				pic = {
					path = "res/ui/equip/supply/jxc_seal_ys.png"
				}
			}
		}
	}
end

function var_0_6.onGetInfo(arg_3_0)
	local function var_3_0(arg_4_0)
		arg_3_0:showPanel(arg_4_0.action.data)
	end

	cmgr.sendRequest(var_3_0, actions.supplyGetInfo)
end

function var_0_6.onBuy(arg_5_0, arg_5_1)
	local function var_5_0(arg_6_0)
		local var_6_0 = arg_6_0.action.data
		local var_6_1 = var_6_0.supplyList[arg_5_1]
		local var_6_2 = {}
		local var_6_3 = {}

		if var_0_0[var_6_1.type] then
			var_6_3.id = var_0_0[var_6_1.type].type or var_6_1.type
		else
			var_6_3.id = 1
		end

		var_6_3.value = math.floor(var_6_1.num)

		table.insert(var_6_2, var_6_3)
		globalAction_gotResource(var_6_2)
		arg_5_0:showPanel(var_6_0)
	end

	local var_5_1 = arg_5_0.info.supplyList[arg_5_1]

	if var_5_1 and var_5_1.request.type == 19 then
		messageBox.showChargeWin("", language.get(215406), "supplyGoldBuy", function()
			cmgr.sendRequest(var_5_0, actions.supplyBuy, var_5_1.vId)
		end)
	else
		cmgr.sendRequest(var_5_0, actions.supplyBuy, var_5_1.vId)
	end
end

function var_0_6.onRefresh(arg_8_0)
	local function var_8_0(arg_9_0)
		arg_8_0:showPanel(arg_9_0.action.data)
	end

	cmgr.sendRequest(var_8_0, actions.supplyRefresh)
end

function var_0_6.showTip(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0.info.supplyList[arg_10_1]

	log.info("should show tips ")

	local var_10_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_10_1:registerScriptTouchHandler(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == CCTOUCHBEGAN then
			return true
		elseif arg_11_0 == CCTOUCHMOVED then
			return true
		elseif arg_11_0 == CCTOUCHENDED then
			pcall(var_10_1.removeFromParentAndCleanup, var_10_1, true)

			return true
		end
	end, false, true)
	var_10_1:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_10_1, 60000)

	local var_10_2 = {
		name = "tipFrame",
		type = "sprite9Tips",
		pic = {
			frame = true,
			path = "common_tip_frame_small.png"
		},
		anchorPoint = ccp(0, 1),
		middleRect = CCRectMake(24, 24, 1, 1),
		preferedSize = CCSizeMake(160, 140),
		content = {}
	}

	table.insert(var_10_2.content, {
		fontSize = 24,
		name = "name",
		type = "label",
		anchorPoint = ccp(0, 0),
		halign = kCCTextAlignmentLeft,
		color = colorQuality[var_10_0.quality],
		text = var_10_0.name
	})

	if var_10_0.att or var_10_0.def or var_10_0.blood then
		local var_10_3

		if var_10_0.att then
			var_10_3 = language.get(82002, var_10_0.att)
		elseif var_10_0.def then
			var_10_3 = language.get(82003, var_10_0.def)
		elseif var_10_0.blood then
			var_10_3 = language.get(82004, var_10_0.blood)
		end

		table.insert(var_10_2.content, {
			fontSize = 22,
			type = "label",
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_1,
			text = var_10_3
		})
	end

	local var_10_4 = 0

	if var_10_0.refreshAttribute and #var_10_0.refreshAttribute > 0 then
		var_10_4 = #var_10_0.refreshAttribute

		table.insert(var_10_2.content, {
			type = "sprite",
			pic = {
				path = "res/ui/weapon/line.png"
			}
		})
		table.insert(var_10_2.content, {
			fontSize = 22,
			type = "label",
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_1,
			text = language.get(101010, var_10_0.maxLv)
		})

		for iter_10_0, iter_10_1 in ipairs(var_10_0.refreshAttribute) do
			table.insert(var_10_2.content, {
				type = "sprite",
				pic = {
					frame = true,
					path = "star_light.png"
				},
				children = {
					{
						fontSize = 20,
						y = 14,
						type = "label",
						x = 30,
						anchorPoint = ccp(0, 0.5),
						color = var_0_1,
						text = iter_10_1.attrName .. " Lv." .. iter_10_1.attValue
					}
				}
			})
		end
	end

	table.insert(var_10_2.content, {
		type = "sprite",
		pic = {
			path = "res/ui/weapon/line.png"
		}
	})
	table.insert(var_10_2.content, {
		fontSize = 22,
		type = "label",
		anchorPoint = ccp(0, 0),
		halign = kCCTextAlignmentLeft,
		color = var_0_1,
		text = language.get(101011, var_10_0.copper)
	})

	local var_10_5 = 0
	local var_10_6 = 0
	local var_10_7 = {}

	uiutil.initWidgets(var_10_7, var_10_2)
	var_10_1:addChild(var_10_7.widgets.tipFrame)

	if var_10_0.maxSkillNum and var_10_0.maxSkillNum > 0 then
		local var_10_8 = var_10_7.widgets.name:getContentSize()

		for iter_10_2 = 1, var_10_0.maxSkillNum do
			local var_10_9 = iter_10_2 <= var_10_4 and "star_light.png" or "star_dark.png"
			local var_10_10 = CCSprite:createWithSpriteFrameName(var_10_9)

			var_10_10:setPosition(var_10_8.width + 20 + (iter_10_2 - 1) * 30, var_10_8.height / 2)
			var_10_7.widgets.name:addChild(var_10_10)
		end
	end

	local var_10_11 = arg_10_1 % 3 == 0 and 1 or 0
	local var_10_12 = arg_10_1 >= 7 and arg_10_1 <= 9 and 0 or 0.5

	var_10_7.widgets.tipFrame:setAnchorPoint(ccp(var_10_11, var_10_12))

	local var_10_13, var_10_14 = tool.getPositionInScreen(arg_10_0.view.widgets["btn_icon" .. arg_10_1])
	local var_10_15 = var_10_13
	local var_10_16 = arg_10_1 >= 7 and arg_10_1 <= 9 and var_10_14 or visibleSize.height / 2

	var_10_7.widgets.tipFrame:setPosition(ccp(var_10_15, var_10_16))
end

function var_0_6.showPanel(arg_12_0, arg_12_1)
	arg_12_0.info = arg_12_1

	local var_12_0 = tonumber(arg_12_1.freeTime) > 0

	arg_12_0.view.widgets.node_freeTime:setVisible(var_12_0)
	arg_12_0.view.widgets.freeTime:stopAllActions()

	if var_12_0 then
		local var_12_1 = CCArray:create()

		var_12_1:addObject(CCCallFuncN:create(function()
			if arg_12_1.freeTime <= 0 then
				arg_12_0.view.widgets.freeTime:stopAllActions()
				arg_12_0:refresh()
			else
				arg_12_0.view.widgets.freeTime:setString(language.get(131062, tool.getFormatTime(arg_12_1.freeTime)))
			end
		end))
		var_12_1:addObject(CCDelayTime:create(0.5))

		local var_12_2 = CCSequence:create(var_12_1)

		arg_12_0.view.widgets.freeTime:runAction(CCRepeatForever:create(var_12_2))
	end

	arg_12_0.view.widgets.remainTimes:setString(language.get(215404, arg_12_1.refreshInfo.remainTimes, arg_12_1.refreshInfo.maxTimes))

	for iter_12_0 = 1, 9 do
		arg_12_0.view.widgets["node_star" .. iter_12_0]:removeAllChildrenWithCleanup(true)
		arg_12_0.view.widgets["name" .. iter_12_0]:setVisible(false)
		arg_12_0.view.widgets["blackMarket" .. iter_12_0]:setVisible(false)
		arg_12_0.view.widgets["bought" .. iter_12_0]:setVisible(false)

		local var_12_3 = arg_12_1.supplyList[iter_12_0]

		if var_12_3 then
			local var_12_4

			if var_12_3.pic then
				var_12_4 = var_12_3.pic
			elseif var_0_0[var_12_3.type] then
				var_12_4 = var_0_0[var_12_3.type].pic
			end

			var_12_4 = var_12_4 or "ying"

			arg_12_0.view.widgets["icon" .. iter_12_0]:setDisplayFrame(tool.spriteFrameByName(string.format("%s.jpg", var_12_4)))

			if var_12_3.type == 31 then
				local var_12_5 = var_12_3.maxSkillNum or 0
				local var_12_6 = 0

				if var_12_3.refreshAttribute then
					var_12_6 = #var_12_3.refreshAttribute
				end

				for iter_12_1 = 1, var_12_5 do
					local var_12_7 = CCSprite:create("res/ui/equip/supply/jxc_star_di.png")

					var_12_7:setPositionX(45 * (iter_12_1 - 1))
					arg_12_0.view.widgets["node_star" .. iter_12_0]:addChild(var_12_7)

					if iter_12_1 <= var_12_6 then
						local var_12_8 = CCSprite:create("res/ui/equip/supply/jxc_star.png")

						var_12_8:setPosition(20, 20)
						var_12_7:addChild(var_12_8)
					end
				end
			else
				local var_12_9

				if var_12_3.name then
					var_12_9 = var_12_3.name
				elseif var_0_0[var_12_3.type] then
					var_12_9 = var_0_0[var_12_3.type].name
				end

				var_12_9 = var_12_9 or "????"

				local var_12_10 = string.format("%s%s", tool.getFormatNum(var_12_3.num), var_12_9)

				if var_12_3.num <= 0 then
					var_12_10 = "????"
				end

				arg_12_0.view.widgets["name" .. iter_12_0]:setString(var_12_10)
				arg_12_0.view.widgets["name" .. iter_12_0]:setVisible(true)
			end

			if var_12_3.request.type then
				arg_12_0.view.widgets["icon_request" .. iter_12_0]:setDisplayFrame(tool.spriteFrameByName(string.format("res_icon_%s.png", var_12_3.request.type)))
			end

			local var_12_11
			local var_12_12

			if var_12_3.request.num > 0 then
				var_12_11 = tool.getFormatNum(var_12_3.request.num)
				var_12_12 = var_0_1
			else
				var_12_11 = language.get(85060)
				var_12_12 = var_0_4
			end

			arg_12_0.view.widgets["num_request" .. iter_12_0]:setString(var_12_11)
			arg_12_0.view.widgets["num_request" .. iter_12_0]:setColor(var_12_12)
			arg_12_0.view.widgets["bar" .. iter_12_0]:setColor(colorQuality[var_12_3.quality])
			arg_12_0.view.widgets["blackMarket" .. iter_12_0]:setVisible(var_12_3.blackMarket)
			arg_12_0.view.widgets["bought" .. iter_12_0]:setVisible(var_12_3.bought)
		end
	end
end

function var_0_6.ctor(arg_14_0)
	log.info("@@ 军需处")

	arg_14_0.view = {}

	uiutil.initWidgets(arg_14_0.view, arg_14_0.layout)
	arg_14_0:addChild(arg_14_0.view.widgets.root)
	arg_14_0.view.widgets.btn_refresh:addHandleOfControlEvent(function()
		log.info("btn_refresh")
		arg_14_0:onRefresh()
	end, CCControlEventTouchUpInside)

	for iter_14_0 = 1, 9 do
		uiutil.initWidgets(arg_14_0.view, arg_14_0:getLayoutItem(iter_14_0))

		local var_14_0 = arg_14_0.view.widgets["btn_supply" .. iter_14_0]

		arg_14_0.view.widgets.bg:addChild(var_14_0)

		local var_14_1 = 158 + (1 + (iter_14_0 - 1) % 3 - 1) * 300
		local var_14_2 = 360 - math.floor((iter_14_0 - 1) / 3) * 120

		var_14_0:setPosition(var_14_1, var_14_2)
		var_14_0:addHandleOfControlEvent(function()
			log.info("btn_supply" .. iter_14_0)
			arg_14_0:onBuy(iter_14_0)
		end, CCControlEventTouchUpInside)
		arg_14_0.view.widgets["btn_icon" .. iter_14_0]:addHandleOfControlEvent(function()
			log.info("btn_icon" .. iter_14_0)

			if arg_14_0.info.supplyList[iter_14_0].type == 31 then
				arg_14_0:showTip(iter_14_0)
			end
		end, CCControlEventTouchUpInside)
	end

	arg_14_0:onGetInfo()
end

function var_0_6.onEnter(arg_18_0)
	arg_18_0.updateRef = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_18_0, arg_18_0.update), 0, false)
end

function var_0_6.onExit(arg_19_0)
	if arg_19_0.updateRef then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_19_0.updateRef)
	end
end

function var_0_6.update(arg_20_0, arg_20_1)
	if arg_20_0.info then
		for iter_20_0, iter_20_1 in ipairs(var_0_5) do
			if arg_20_0.info[iter_20_1] then
				if arg_20_0.info[iter_20_1] > 0 then
					arg_20_0.info[iter_20_1] = arg_20_0.info[iter_20_1] - 1000 * arg_20_1
				elseif arg_20_0.info[iter_20_1] <= 0 then
					arg_20_0.info[iter_20_1] = 0
				end
			end
		end
	end
end

return var_0_6
