local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = ccc3(0, 180, 0)
local var_0_2 = colorQuality[5]
local var_0_3 = colorQuality[4]
local var_0_4 = colorQuality[2]

local function var_0_5(arg_1_0)
	if arg_1_0 <= 0 then
		return 0
	end

	return math.floor(arg_1_0 / 1000)
end

local var_0_6 = class("VotePanel", function()
	return createBaseLayer()
end)

var_0_6.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			y = 410,
			name = "bg_time",
			type = "sprite9",
			x = 600,
			preferedSize = CCSizeMake(300, 60),
			middleRect = CCRectMake(80, 20, 15, 9),
			pic = {
				path = "res/ui/juben/jb_wj_lv_d.png"
			},
			children = {
				{
					y = 30,
					anchorPointX = 0.5,
					type = "richLine",
					gap = 0,
					x = 150,
					content = {
						{
							name = "icon_clock",
							type = "sprite",
							pic = {
								path = "res/ui/general/jailView/icon_clock.png"
							}
						},
						{
							name = "time",
							fontSize = 22,
							type = "label",
							text = language.get(92112, "00"),
							color = var_0_2
						}
					}
				}
			}
		}
	}
}
var_0_6.layout_btn1 = {
	zoomOnTouchDown = true,
	name = "btn",
	h = 180,
	type = "button",
	w = 550,
	y = 0,
	x = 0,
	normal = {
		path = "res/ui/nationTask/strategy/gzxce_vote_di_c.png"
	},
	touched = {
		path = "res/ui/nationTask/strategy/gzxce_vote_di.png"
	},
	children = {
		{
			y = 145,
			name = "bg",
			type = "sprite",
			x = 120,
			pic = {
				path = "res/ui/nationTask/strategy/gzxce_word_di_g.png"
			}
		},
		{
			fontSize = 25,
			name = "title",
			y = 145,
			type = "label",
			x = 25,
			textId = 92127,
			color = var_0_0,
			anchorPoint = ccp(0, 0.5)
		},
		{
			y = 90,
			x = 480,
			type = "sprite",
			pic = {
				path = "res/ui/nationTask/strategy/gzxce_vote_ink.png"
			}
		},
		{
			anchorPointX = 0.5,
			name = "rich_num",
			y = 90,
			type = "richLine",
			gap = 0,
			x = 480,
			content = {
				{
					text = "0",
					name = "num_p1",
					startCharMap = 48,
					type = "atlaslabel",
					itemWidth = 22,
					pic = "res/ui/common/number/gjms_tit_yong_digit.png",
					itemHeight = 27,
					anchorPoint = ccp(1, 0.5)
				},
				{
					name = "num_p2",
					type = "sprite",
					pic = {
						path = "res/ui/nationTask/thunder/mbxz_word_piao.png"
					}
				}
			}
		},
		{
			y = 100,
			name = "txt1",
			x = 250,
			type = "sprite"
		},
		{
			fontSize = 25,
			name = "txt2",
			y = 70,
			type = "label",
			x = 250,
			color = var_0_0,
			anchorPoint = ccp(0.5, 1)
		},
		{
			type = "sprite",
			name = "mark",
			y = 140,
			visible = false,
			x = 520,
			pic = {
				path = "res/ui/nationTask/thunder/mbxz_dh.png"
			}
		}
	}
}
var_0_6.layout_btn2 = {
	zoomOnTouchDown = true,
	name = "btn",
	h = 140,
	type = "button",
	w = 550,
	y = 0,
	x = 0,
	normal = {
		path = "res/ui/nationTask/strategy/gzxce_vote_di_c.png"
	},
	touched = {
		path = "res/ui/nationTask/strategy/gzxce_vote_di.png"
	},
	children = {
		{
			y = 105,
			name = "bg",
			type = "sprite",
			x = 120,
			pic = {
				path = "res/ui/nationTask/strategy/gzxce_word_di_g.png"
			}
		},
		{
			fontSize = 25,
			name = "title",
			y = 105,
			type = "label",
			x = 25,
			textId = 92127,
			color = var_0_0,
			anchorPoint = ccp(0, 0.5)
		},
		{
			y = 70,
			x = 480,
			type = "sprite",
			pic = {
				path = "res/ui/nationTask/strategy/gzxce_vote_ink.png"
			}
		},
		{
			anchorPointX = 0.5,
			name = "rich_num",
			y = 70,
			type = "richLine",
			gap = 0,
			x = 480,
			content = {
				{
					text = "0",
					name = "num_p1",
					startCharMap = 48,
					type = "atlaslabel",
					itemWidth = 22,
					pic = "res/ui/common/number/gjms_tit_yong_digit.png",
					itemHeight = 27,
					anchorPoint = ccp(1, 0.5)
				},
				{
					name = "num_p2",
					type = "sprite",
					pic = {
						path = "res/ui/nationTask/thunder/mbxz_word_piao.png"
					}
				}
			}
		},
		{
			fontSize = 25,
			name = "txt",
			y = 80,
			type = "label",
			width = 400,
			height = 0,
			x = 25,
			color = var_0_0,
			anchorPoint = ccp(0, 1),
			halign = kCCTextAlignmentLeft
		},
		{
			type = "sprite",
			name = "mark",
			y = 120,
			visible = false,
			x = 520,
			pic = {
				path = "res/ui/nationTask/thunder/mbxz_dh.png"
			}
		}
	}
}

function var_0_6.onVote(arg_3_0, arg_3_1)
	local function var_3_0(arg_4_0)
		local var_4_0 = arg_4_0.action.data

		arg_3_0:showPanel(var_4_0)
	end

	cmgr.sendRequest(var_3_0, actions.nationTaskVote, arg_3_1)
end

function var_0_6.showResultEffect(arg_5_0)
	local var_5_0 = user.taskDecide

	user.taskDecide = nil

	for iter_5_0 = 1, 3 do
		local var_5_1 = arg_5_0.view.widgets["btn" .. iter_5_0]

		if var_5_1 then
			var_5_1:setEnabled(false)
			var_5_1:setHighlighted(iter_5_0 == var_5_0.predicateDecision)
		end
	end

	local var_5_2 = CCScale9Sprite:create("res/ui/kfyz/yuyue/yyyz_zfrd_bg.png")

	var_5_2:setCapInsets(CCRectMake(180, 20, 5, 20))
	var_5_2:setPreferredSize(CCSizeMake(400, 90))
	var_5_2:setPosition(235, 200)
	arg_5_0.view.widgets.root:addChild(var_5_2, 100)

	local var_5_3 = var_5_0.predicateKing and "mbxz_word_gwjd.png" or "mbxz_word_tpjs.png"
	local var_5_4 = CCSprite:create("res/ui/nationTask/thunder/" .. var_5_3)

	var_5_4:setPosition(ccp(200, 50))
	var_5_2:addChild(var_5_4)

	local var_5_5, var_5_6 = arg_5_0.view.widgets["btn" .. var_5_0.predicateDecision]:getPosition()
	local var_5_7 = CCArray:create()

	var_5_7:addObject(CCDelayTime:create(0.5))
	var_5_7:addObject(CCEaseSineOut:create(CCMoveTo:create(1, ccp(var_5_5, var_5_6))))
	var_5_7:addObject(CCDelayTime:create(0.2))
	var_5_7:addObject(CCMoveBy:create(0.4, ccp(0, 50)))
	var_5_7:addObject(CCDelayTime:create(0.2))
	var_5_7:addObject(CCCallFuncN:create(function()
		var_5_2:removeFromParentAndCleanup(true)
		arg_5_0.ctrl:getTaskInfo(nil)
	end))

	local var_5_8 = CCSequence:create(var_5_7)

	var_5_2:runAction(var_5_8)
end

function var_0_6.showPanel(arg_7_0, arg_7_1)
	arg_7_0.info = arg_7_1

	arg_7_0.view.widgets.time:stopAllActions()
	arg_7_0.view.widgets.time:setString(language.get(92112, var_0_5(arg_7_1.predicateLeftTime)))

	local var_7_0 = CCArray:create()

	var_7_0:addObject(CCDelayTime:create(1))
	var_7_0:addObject(CCCallFuncN:create(function()
		arg_7_1.predicateLeftTime = arg_7_1.predicateLeftTime - 1000

		if arg_7_1.predicateLeftTime <= 0 then
			arg_7_0.view.widgets.time:stopAllActions()
		end

		arg_7_0.view.widgets.time:setString(language.get(92112, var_0_5(arg_7_1.predicateLeftTime)))
	end))

	local var_7_1 = CCSequence:create(var_7_0)

	arg_7_0.view.widgets.time:runAction(CCRepeatForever:create(var_7_1))

	for iter_7_0, iter_7_1 in pairs(arg_7_1.votes) do
		if iter_7_1.type == 1 or iter_7_1.type == 2 or iter_7_1.type == 3 then
			arg_7_0.view.widgets[string.format("num%s_p1", iter_7_1.type)]:setString(tostring(iter_7_1.num))
			arg_7_0.view.widgets["rich_num" .. iter_7_1.type]:reorder()
		end
	end

	local var_7_2 = arg_7_0.view.widgets.btn3 ~= nil and 3 or 2
	local var_7_3 = arg_7_1.selfPredicate > 0

	for iter_7_2 = 1, var_7_2 do
		arg_7_0.view.widgets["mark" .. iter_7_2]:setVisible(var_7_3 and iter_7_2 == arg_7_1.selfPredicate)
		arg_7_0.view.widgets["btn" .. iter_7_2]:setEnabled(not var_7_3)
	end

	if user.taskDecide then
		arg_7_0:showResultEffect()
	end
end

function var_0_6.ctor(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	log.info("@@ 国战投票")

	arg_9_0.ctrl = arg_9_3
	arg_9_0.view = {}

	uiutil.initWidgets(arg_9_0.view, arg_9_0.layout)

	if arg_9_1 then
		arg_9_0:addChild(arg_9_0.view.widgets.root)
		arg_9_1:addChild(arg_9_0, 100)
	end

	arg_9_0.view.widgets.icon_clock:setPositionY(-4)

	local var_9_0 = #arg_9_2.votes == 3
	local var_9_1 = {
		[1905] = "res/ui/weapon/diamondShop/bssh_icon_bssq.png",
		[10] = "res/ui/task/get_icon_exp.png",
		[4] = "res/ui/task/get_icon_iron.png",
		[17] = "res/ui/task/get_icon_gem.png",
		[216] = "res/ui/weapon/machine/zc_yt_icon.png",
		[21] = "res/ui/task/get_icon_silk.png"
	}
	local var_9_2 = {
		base1 = "gzxce_word_di_g.png",
		surround = "gzxce_word_di_b.png",
		drawBack = "gzxce_word_di_b.png",
		killAll = "zqcl_word_di_hj.png",
		hjRebel = "zqcl_word_di_hj.png",
		ysProvoke = "zqcl_word_di_ys.png",
		base2 = "gzxce_word_di_r.png",
		barInvade = "zqcl_word_di_ys.png"
	}
	local var_9_3 = {
		92127,
		92128
	}
	local var_9_4 = var_9_0 and arg_9_0.layout_btn2 or arg_9_0.layout_btn1

	if var_9_0 then
		var_9_3 = {
			base1 = 92127,
			surround = "205529_zww",
			drawBack = "205528_zww",
			killAll = 205516,
			hjRebel = 205532,
			ysProvoke = 205531,
			base2 = 92128,
			barInvade = 205533
		}
	end

	local var_9_5 = var_9_0 and 3 or 2

	for iter_9_0 = 1, var_9_5 do
		local var_9_6 = {}

		uiutil.initWidgets(var_9_6, var_9_4)

		local var_9_7 = var_9_0 and 370 - (iter_9_0 - 1) * 140 or 275 - (iter_9_0 - 1) * 180

		var_9_6.widgets.btn:setPosition(610, var_9_7)
		arg_9_0.view.widgets.root:addChild(var_9_6.widgets.btn)

		if var_9_0 then
			local var_9_8 = arg_9_2.votes[iter_9_0]

			var_9_6.widgets.title:setString(language.get(var_9_3[var_9_8.strategyType]))
			var_9_6.widgets.bg:setDisplayFrame(CCSprite:create("res/ui/nationTask/strategy/" .. var_9_2[var_9_8.strategyType]):displayFrame())

			local var_9_9

			if var_9_8.strategyType == "base1" then
				var_9_9 = language.get(205500)
			elseif var_9_8.strategyType == "base2" then
				var_9_9 = language.get(205501)
			elseif var_9_8.strategyType == "surround" then
				var_9_9 = language.get(205504, arg_9_2.targetCity, var_9_8.interval, var_9_8.npcNum)
			elseif var_9_8.strategyType == "drawBack" then
				var_9_9 = language.get(205503, arg_9_2.targetCity, var_9_8.drawBackNum)
			elseif var_9_8.strategyType == "killAll" then
				local var_9_10 = language.get(460037, user.forceIdToName[arg_9_2.concernNation])

				var_9_9 = language.get(205502, var_9_10, var_9_8.target)
			elseif var_9_8.strategyType == "ysProvoke" then
				var_9_9 = language.get(219101)
			elseif var_9_8.strategyType == "hjRebel" then
				var_9_9 = language.get(219100)
			elseif var_9_8.strategyType == "barInvade" then
				var_9_9 = language.get(219102)
			end

			var_9_6.widgets.txt:setString(var_9_9)

			local var_9_11 = var_9_8.rewards

			if var_9_11 then
				for iter_9_1, iter_9_2 in pairs(var_9_11) do
					local var_9_12 = tool.spriteByName("jianglikuang1.png")

					var_9_12:setPosition(ccp(380, -12))

					local var_9_13 = var_9_1[iter_9_2.type] or ""
					local var_9_14 = CCSprite:create(var_9_13)

					var_9_14:setPosition(ccp(40, 40))
					var_9_12:addChild(var_9_14, 10)

					local var_9_15 = CCLabelTTF:create(iter_9_2.value, "Thonburi", 22)

					var_9_15:setPosition(ccp(40, 20))
					var_9_12:addChild(var_9_15, 20)
					var_9_6.widgets.bg:addChild(var_9_12)
				end
			end
		else
			local var_9_16
			local var_9_17
			local var_9_18

			if iter_9_0 == 1 then
				var_9_16 = "mbxz_word_yzhs.png"
				var_9_18 = 92129
			else
				var_9_16 = "mbxz_word_lzqs.png"
				var_9_18 = 92130
			end

			var_9_6.widgets.txt1:setDisplayFrame(CCSprite:create("res/ui/nationTask/thunder/" .. var_9_16):displayFrame())
			var_9_6.widgets.txt2:setString(language.get(var_9_18))
		end

		var_9_6.widgets.btn:addHandleOfControlEvent(function()
			log.info("btn" .. iter_9_0)
			arg_9_0:onVote(iter_9_0)
		end, CCControlEventTouchUpInside)

		arg_9_0.view.widgets["btn" .. iter_9_0] = var_9_6.widgets.btn
		arg_9_0.view.widgets["rich_num" .. iter_9_0] = var_9_6.widgets.rich_num
		arg_9_0.view.widgets[string.format("num%s_p1", iter_9_0)] = var_9_6.widgets.num_p1
		arg_9_0.view.widgets[string.format("num%s_p2", iter_9_0)] = var_9_6.widgets.num_p2
		arg_9_0.view.widgets["mark" .. iter_9_0] = var_9_6.widgets.mark
	end

	local var_9_19 = var_9_0 and ccp(160, 60) or ccp(600, 410)

	arg_9_0.view.widgets.bg_time:setPosition(var_9_19)
	arg_9_0:showPanel(arg_9_2)
end

return var_0_6
