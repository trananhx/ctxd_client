local var_0_0
local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = colorQuality[3]
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = class("SendRed", function()
	return createBaseLayer()
end)

var_0_5.layout = {
	name = "panel",
	type = "sprite9",
	pic = {
		frame = false,
		path = "res/ui/activity/goldActivity/dljl_bg.png"
	},
	anchorPoint = ccp(0.5, 0.5),
	middleRect = CCRectMake(20, 20, 20, 20),
	preferedSize = CCSizeMake(850, 400),
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5,
	children = {
		{
			x = 437,
			name = "sendTitle",
			y = 390,
			type = "sprite",
			scale = 0.8,
			zorder = 200,
			anchorPoint = ccp(0.5, 0.5),
			pic = {
				frame = false,
				path = "res/ui/activity/goldActivity/myRedBag/wdhb_title_lqhb.png"
			}
		},
		{
			y = 180,
			name = "btn_sendRed",
			h = 200,
			type = "button",
			w = 120,
			x = 390,
			zorder = 200,
			children = {
				{
					y = 100,
					type = "sprite",
					x = 60,
					anchorPoint = ccp(0.5, 0.5),
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/myRedBag/gjms_ms_lig_bg.png"
					}
				},
				{
					y = 100,
					type = "sprite",
					x = 60,
					anchorPoint = ccp(0.5, 0.5),
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/myRedBag/bans.png"
					}
				},
				{
					y = 100,
					name = "open",
					type = "sprite",
					visible = false,
					x = 60,
					anchorPoint = ccp(0.5, 0.5),
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/myRedBag/kai.png"
					}
				}
			}
		},
		{
			x = 190,
			name = "arrows",
			y = 190,
			type = "sprite",
			zorder = 200,
			anchorPoint = ccp(0.5, 0.5),
			pic = {
				frame = false,
				path = "res/ui/activity/goldActivity/myRedBag/wdhb_arrows.png"
			},
			children = {
				{
					y = 45,
					scale = 0.5,
					type = "sprite",
					x = 60,
					anchorPoint = ccp(0, 0),
					pic = {
						frame = false,
						path = "res/ui/activity/goldActivity/myRedBag/wdhb_word_03.png"
					}
				}
			}
		},
		{
			w = 45,
			name = "closeBtn",
			h = 45,
			type = "button",
			zorder = 200,
			y = 360,
			x = 750,
			anchorPoint = ccp(0, 0),
			normal = {
				frame = false,
				path = "res/ui/activity/goldActivity/myRedBag/btn_close_a.png"
			},
			touched = {
				frame = false,
				path = "res/ui/activity/goldActivity/myRedBag/btn_close_click.png"
			}
		},
		{
			fontSize = 20,
			name = "redNum",
			scale = 1.2,
			type = "label",
			zorder = 200,
			text = "",
			style = "label_warlock",
			y = 330,
			x = 650,
			color = var_0_1
		},
		{
			fontSize = 20,
			name = "redOwner",
			scale = 1.2,
			type = "label",
			zorder = 200,
			text = "",
			style = "label_warlock",
			y = 310,
			x = 400,
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_4
		}
	}
}

function var_0_5.ctor(arg_2_0, arg_2_1)
	arg_2_0.view = {}

	uiutil.initWidgets(arg_2_0.view, arg_2_0.layout)

	if arg_2_1 then
		arg_2_0:addChild(arg_2_0.view.widgets.panel)
		arg_2_1:addChild(arg_2_0)
	end

	local var_2_0 = CCArray:create()

	var_2_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_2_0:addObject(CCMoveBy:create(0.1, ccp(-10, 0)))
	var_2_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_2_0:addObject(CCMoveBy:create(0.1, ccp(-10, 0)))
	var_2_0:addObject(CCDelayTime:create(0.8))

	local var_2_1 = CCSequence:create(var_2_0)

	arg_2_0.view.widgets.arrows:runAction(CCRepeatForever:create(var_2_1))
	arg_2_0.view.widgets.btn_sendRed:setOpacity(0)
	arg_2_0.view.widgets.closeBtn:addHandleOfControlEvent(function()
		arg_2_0:closeSendRed()
	end, CCControlEventTouchUpInside)
	arg_2_0:getInfo()

	local var_2_2 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_2_2:registerScriptTouchHandler(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == CCTOUCHBEGAN then
			return true
		elseif arg_4_0 == CCTOUCHMOVED then
			return true
		elseif arg_4_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)
	var_2_2:setTouchEnabled(true)
	arg_2_0.view.widgets.panel:addChild(var_2_2, -1)
end

function var_0_5.closeSendRed(arg_5_0)
	log.info("@@ 关闭")
	arg_5_0:removeFromParentAndCleanup(true)
end

function var_0_5.getInfo(arg_6_0)
	log.info("@@拿数据，领红包@@")

	local function var_6_0(arg_7_0)
		arg_6_0.info = arg_7_0.action.data

		if #arg_6_0.info.redBags == 0 then
			arg_6_0:closeSendRed()

			return
		end

		arg_6_0.view.widgets.redNum:setString(language.get(135787, #arg_6_0.info.redBags))
		arg_6_0.view.widgets.redOwner:setString(language.get(135788, arg_6_0.info.redBags[1].owner))
	end

	cmgr.sendRequest(var_6_0, actions.getRedBag)
	arg_6_0.view.widgets.btn_sendRed:addHandleOfControlEvent(function()
		arg_6_0:openBagNum(idx)
	end, CCControlEventTouchUpInside)
end

function var_0_5.openBagNum(arg_9_0, arg_9_1)
	if #arg_9_0.info.redBags == 0 then
		return
	end

	arg_9_0:showOpenRedBagEffect()
	arg_9_0.view.widgets.open:setVisible(false)

	local function var_9_0(arg_10_0)
		local var_10_0 = arg_10_0.action.data
		local var_10_1 = {
			{}
		}

		var_10_1[1].id = 19
		var_10_1[1].value = var_10_0.redBagGold

		globalAction_gotResource(var_10_1)
		arg_9_0:getInfo()
	end

	cmgr.sendRequest(var_9_0, actions.recvRedBag, arg_9_0.info.redBags[1].vid)
end

function var_0_5.showOpenRedBagEffect(arg_11_0)
	if arg_11_0.progNode then
		arg_11_0.progNode:removeAllChildrenWithCleanup(true)
	else
		arg_11_0.progNode = CCNode:create()

		arg_11_0.view.widgets.panel:addChild(arg_11_0.progNode, 300)
	end

	local var_11_0 = CCSprite:create("res/ui/threeColorBag/jingdudi.png")

	var_11_0:setPosition(ccp(390, 180))
	var_11_0:setScale(0.8)
	arg_11_0.progNode:addChild(var_11_0)

	local var_11_1 = CCProgressTimer:create(CCSprite:create("res/ui/threeColorBag/jingdu.png"))

	var_11_1:setScale(0.8)
	var_11_1:setType(kCCProgressTimerTypeRadial)
	var_11_1:setMidpoint(ccp(0.5, 0.5))
	var_11_1:setBarChangeRate(ccp(1, 0))
	var_11_1:setPercentage(0)
	var_11_1:setPosition(ccp(390, 180))
	arg_11_0.progNode:addChild(var_11_1)

	local var_11_2 = CCSprite:create("res/ui/activity/goldActivity/myRedBag/wdhb_word_ckz.png")

	var_11_2:setPosition(ccp(390, 180))
	var_11_2:setScale(0.8)
	arg_11_0.progNode:addChild(var_11_2)

	local var_11_3 = CCArray:create()

	var_11_3:addObject(CCProgressTo:create(0.8, 100))
	var_11_3:addObject(CCCallFuncN:create(function()
		arg_11_0.progNode:removeAllChildrenWithCleanup(true)
		arg_11_0.view.widgets.open:setVisible(true)
	end))

	local var_11_4 = CCSequence:create(var_11_3)

	var_11_1:runAction(var_11_4)
end

return var_0_5
