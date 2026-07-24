local var_0_0 = {
	y = 0,
	name = "Layer",
	type = "layer",
	x = 0,
	children = {
		{
			name = "bg",
			type = "sprite",
			x = visibleSize.width / 2,
			y = visibleSize.height / 2,
			pic = {
				path = "res/ui/kfsy/kfsy_ky.jpg"
			},
			children = {
				{
					y = 558.603,
					name = "dinnerChiefRole",
					type = "sprite",
					x = 196.3116,
					pic = {
						path = "res/ui/kfsy/dinnerChiefRole.png"
					}
				},
				{
					y = 295.9969,
					name = "btnDinner",
					h = 130,
					type = "button",
					w = 122,
					visible = false,
					x = 649.9941,
					normal = {
						path = "res/ui/dinner/zcgz_btn_ty.png"
					},
					touched = {
						path = "res/ui/dinner/zcgz_btn_ty_c.png"
					}
				}
			}
		},
		{
			name = "resultLayer",
			type = "sprite",
			x = visibleSize.width / 2,
			y = visibleSize.height / 2,
			pic = {
				path = "res/ui/world/cityCombo/lxzc_bg.png"
			},
			children = {
				{
					name = "btnAfterDinner",
					h = 62,
					type = "button",
					w = 195,
					y = 38.0003,
					x = 482,
					normal = {
						path = "res/ui/common/button/public_btn_green.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_green_c.png"
					},
					children = {
						{
							fontSize = 20,
							name = "Text_38",
							y = 33,
							type = "label",
							textId = 84012,
							style = "label_yellowish_24",
							x = 97.5,
							halign = kCCTextAlignmentLeft,
							valign = kCCVerticalTextAlignmentBottom
						}
					}
				},
				{
					y = 359.7552,
					name = "zcgz_yh_word03",
					type = "sprite",
					x = 482,
					pic = {
						path = "res/ui/dinner/zcgz_yh_word03.png"
					}
				}
			}
		},
		{
			y = 0,
			name = "notOpenLayer",
			x = 0,
			type = "layerColor",
			visible = false,
			color = ccc4(20, 20, 20, 184),
			width = visibleSize.width,
			height = visibleSize.height,
			children = {
				{
					name = "zcgz_yh_word02",
					type = "sprite",
					x = visibleSize.width / 2,
					y = visibleSize.height / 2,
					pic = {
						path = "res/ui/dinner/zcgz_yh_word02.png"
					}
				}
			}
		},
		{
			w = 104,
			name = "leave",
			h = 50,
			type = "button",
			normal = {
				frame = true,
				path = "btn_back_a.png"
			},
			touched = {
				frame = true,
				path = "btn_back_c.png"
			},
			x = visibleSize.width - 70,
			y = visibleSize.height - 40
		}
	}
}
local var_0_1 = {
	y = 0,
	name = "Node",
	type = "node",
	x = 0,
	children = {
		{
			y = 0,
			name = "player",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/kfsy/dinnerGeneralRole1.png"
			},
			children = {
				{
					fontSize = 20,
					name = "name",
					y = 86,
					type = "label",
					text = "Text Label",
					style = "label_white_24",
					x = 22,
					halign = kCCTextAlignmentLeft,
					valign = kCCVerticalTextAlignmentBottom
				},
				{
					y = 62,
					name = "bg",
					type = "sprite",
					x = 22,
					pic = {
						frame = true,
						path = "dinnerJinDuTiaoDi.png"
					},
					children = {
						{
							y = 10.5,
							name = "hp",
							type = "progressbar",
							x = 54,
							pic = {
								frame = true,
								path = "dinnerJinDuTiao.png"
							}
						},
						{
							y = 10.9713,
							name = "dinnerGeneralMark",
							type = "sprite",
							x = -19.3475,
							pic = {
								frame = true,
								path = "dinnerGeneralMark.png"
							}
						}
					}
				}
			}
		}
	}
}
local var_0_2 = {
	y = 0,
	name = "Node",
	type = "node",
	x = 0,
	children = {
		{
			height = 200,
			name = "frame",
			x = 0,
			type = "layerColor",
			y = 0,
			width = 190,
			color = ccc4(150, 200, 255, 0),
			children = {
				{
					y = 100,
					name = "bg",
					type = "sprite",
					x = 95,
					pic = {
						frame = true,
						path = "lm_icon_view_low_a.png"
					},
					children = {
						{
							y = 130.933,
							name = "item_background",
							type = "sprite",
							x = 75.1002,
							pic = {
								frame = true,
								path = "item_background.jpg"
							},
							children = {
								{
									y = 40,
									name = "headImage",
									type = "sprite",
									x = 40,
									pic = {
										path = "res/ui/common/generalPic/generalPic_0.jpg"
									}
								}
							}
						},
						{
							fontSize = 24,
							name = "lv",
							y = 40,
							type = "label",
							text = "Text Label",
							style = "label_white_24",
							x = 73.5,
							halign = kCCTextAlignmentLeft,
							valign = kCCVerticalTextAlignmentBottom
						},
						{
							y = -10,
							name = "exp",
							x = 73.5,
							type = "node"
						}
					}
				}
			}
		}
	}
}
local var_0_3 = {
	ccp(231, 274),
	ccp(725, 535),
	ccp(354, 211),
	ccp(850, 473),
	ccp(482, 140),
	ccp(611, 589),
	ccp(624, 81),
	ccp(977, 408),
	ccp(104, 342),
	ccp(1113, 340)
}
local var_0_4 = class("HuangChengDinner", function()
	return createBaseLayer()
end)

function var_0_4.ctor(arg_2_0)
	rmgr.loadResource("res/ui/dinner/dinner.plist")
	rmgr.loadResource("res/ui/technology/dragonTech/dragonTechPic.plist")
	rmgr.loadResource("res/ui/technology/dragonTech/dragonTechPic1.plist")
	arg_2_0:init()
end

function var_0_4.init(arg_3_0)
	arg_3_0._layoutNode = LayoutNode.new()

	arg_3_0:addChild(arg_3_0._layoutNode)
	arg_3_0._layoutNode:setLoadFunc(handler(arg_3_0, arg_3_0.initLayout))
	arg_3_0._layoutNode:reload(var_0_0)
	cmgr.sendRequest(function(arg_4_0)
		if arg_4_0.action.state == 1 then
			arg_3_0:refreshPanel(arg_4_0.action.data)
		end
	end, actions.getDinnerInfo)
end

function var_0_4.initLayout(arg_5_0)
	arg_5_0._layoutNode:getWidget("leave"):addHandleOfControlEvent(handler(arg_5_0, arg_5_0.onLeaveBtnClicked), CCControlEventTouchUpInside)
	arg_5_0._layoutNode:getWidget("btnAfterDinner"):addHandleOfControlEvent(handler(arg_5_0, arg_5_0.onLeaveBtnClicked), CCControlEventTouchUpInside)
	arg_5_0._layoutNode:getWidget("btnDinner"):addHandleOfControlEvent(handler(arg_5_0, arg_5_0.onBtnDinnerClicked), CCControlEventTouchUpInside)
	arg_5_0._layoutNode:getWidget("resultLayer"):setVisible(false)

	local function var_5_0(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == CCTOUCHBEGAN then
			if arg_5_0._layoutNode:getWidget("notOpenLayer"):isVisible() then
				return true
			else
				return false
			end
		elseif arg_6_0 == CCTOUCHMOVED then
			return true
		elseif arg_6_0 == CCTOUCHENDED then
			return true
		end
	end

	arg_5_0._layoutNode:getWidget("notOpenLayer"):setTouchEnabled(true)
	arg_5_0._layoutNode:getWidget("notOpenLayer"):registerScriptTouchHandler(var_5_0, false, true)
end

function var_0_4.refreshPanel(arg_7_0, arg_7_1)
	if arg_7_1 then
		arg_7_0._data = arg_7_1
		arg_7_0._selfDinnerGenerals = {}

		local var_7_0 = arg_7_1.isFull == 1
		local var_7_1 = not var_7_0 and arg_7_1.dinnerNum > 0

		arg_7_0._layoutNode:getWidget("notOpenLayer"):setVisible(var_7_0)
		arg_7_0._layoutNode:getWidget("btnDinner"):setVisible(var_7_1)

		if var_7_1 then
			local var_7_2 = 1

			for iter_7_0, iter_7_1 in pairs(arg_7_1.generals) do
				if var_7_2 > #var_0_3 then
					break
				end

				local var_7_3 = LayoutNode.new()

				var_7_3:setPosition(var_0_3[var_7_2])

				var_7_2 = var_7_2 + 1

				arg_7_0._layoutNode:getWidget("bg"):addChild(var_7_3)
				var_7_3:reload(var_0_1)

				if var_7_2 % 2 > 0 then
					var_7_3:getWidget("player"):setDisplayFrame(CCSprite:create("res/ui/kfsy/dinnerGeneralRole2.png"):displayFrame())
				end

				if iter_7_1.type == 0 then
					var_7_3:getWidget("name"):setString(language.get(84010, iter_7_1.name, iter_7_1.reason))
					var_7_3:getWidget("bg"):setVisible(false)
				else
					var_7_3:getWidget("name"):setString(iter_7_1.name)
					var_7_3:getWidget("hp"):setPercentage(100 * iter_7_1.forces / iter_7_1.totalForces)
					table.insert(arg_7_0._selfDinnerGenerals, var_7_3)
				end
			end

			for iter_7_2, iter_7_3 in pairs(arg_7_1.players) do
				if var_7_2 > #var_0_3 then
					break
				end

				local var_7_4 = LayoutNode.new()

				var_7_4:setPosition(var_0_3[var_7_2])

				var_7_2 = var_7_2 + 1

				arg_7_0._layoutNode:getWidget("bg"):addChild(var_7_4)
				var_7_4:reload(var_0_1)

				if var_7_2 % 2 > 0 then
					var_7_4:getWidget("player"):setDisplayFrame(CCSprite:create("res/ui/kfsy/dinnerGeneralRole2.png"):displayFrame())
				end

				var_7_4:getWidget("bg"):setVisible(false)
				var_7_4:getWidget("name"):setPosition(ccp(22, 62))
				var_7_4:getWidget("name"):setString(iter_7_3.playerName)
			end
		end
	end
end

function var_0_4.onLeaveBtnClicked(arg_8_0, ...)
	smgr.returnLastScene()
end

function var_0_4.onBtnDinnerClicked(arg_9_0, arg_9_1, arg_9_2)
	cmgr.sendRequest(function(arg_10_0)
		if arg_10_0.action.state == 1 then
			arg_9_0._layoutNode:getWidget("btnDinner"):setVisible(false)
			arg_9_0:showDinnerAnimation(arg_10_0.action.data)
		end
	end, actions.haveDinner, 0)
end

function var_0_4.showDinnerAnimation(arg_11_0, arg_11_1)
	local var_11_0 = 10010

	arg_11_0._selfDinnerGenerals = arg_11_0._selfDinnerGenerals or {}

	local var_11_1 = 1
	local var_11_2 = false

	for iter_11_0, iter_11_1 in pairs(arg_11_0._selfDinnerGenerals) do
		local var_11_3 = iter_11_0
		local var_11_4 = rmgr.getAnimation("farmAddExpEffect")
		local var_11_5 = CCAnimation:createWithSpriteFrames(var_11_4, 0.1)
		local var_11_6 = CCAnimate:create(var_11_5)
		local var_11_7 = CCRepeat:create(var_11_6, 2)
		local var_11_8 = CCArray:create()

		var_11_8:addObject(var_11_7)
		var_11_8:addObject(CCCallFunc:create(function()
			if iter_11_0 == #arg_11_0._selfDinnerGenerals then
				for iter_12_0, iter_12_1 in pairs(arg_11_0._selfDinnerGenerals) do
					iter_12_1:getWidget("player"):removeChildByTag(var_11_0, true)
				end

				arg_11_0:showResultLayer(arg_11_1)
			end
		end))

		local var_11_9 = CCSprite:create()

		var_11_9:setPosition(ccp(iter_11_1:getWidget("player"):getContentSize().width / 2, iter_11_1:getWidget("player"):getContentSize().height / 2))
		var_11_9:runAction(CCSequence:create(var_11_8))
		iter_11_1:getWidget("player"):removeChildByTag(var_11_0, true)
		iter_11_1:getWidget("player"):addChild(var_11_9, 0, var_11_0)

		if iter_11_1:getWidget("hp"):getPercentage() < 100 then
			iter_11_1:getWidget("hp"):runAction(CCProgressTo:create(var_11_1, 100))
		end
	end
end

function var_0_4.showResultLayer(arg_13_0, arg_13_1)
	log.info("showResultLayer")

	local var_13_0 = {}

	for iter_13_0, iter_13_1 in pairs(arg_13_1.generals) do
		for iter_13_2, iter_13_3 in pairs(arg_13_0._data.generals) do
			if iter_13_1.generalId == iter_13_3.generalId then
				iter_13_1.pic = iter_13_3.pic
			end
		end
	end

	for iter_13_4, iter_13_5 in pairs(arg_13_1.generals) do
		local var_13_1 = LayoutNode.new()

		var_13_1:setPosition(var_0_3[iter_13_4])
		var_13_1:reload(var_0_2)
		var_13_1:setAnchorPoint(ccp(0.5, 0.5))
		var_13_1:ignoreAnchorPointForPosition(false)
		var_13_1:setContentSize(var_13_1:getWidget("frame"):getContentSize())
		table.insert(var_13_0, var_13_1)

		if iter_13_5.pic then
			var_13_1:getWidget("headImage"):setDisplayFrame(CCSprite:create("res/ui/common/generalPic/generalPic_" .. iter_13_5.pic .. ".jpg"):displayFrame())
		end

		var_13_1:getWidget("lv"):setString("lv." .. iter_13_5.generalLv)

		local var_13_2 = CCLabelAtlas:create(math.ceil(arg_13_1.addGeneralExp / 10000), "res/ui/juben/jubenLevelSelect/jb_rewa_numb.png", 17, 29, 48)

		var_13_2:setAnchorPoint(ccp(0.5, 0.5))

		local var_13_3 = createRichNode({
			CCSprite:create("res/ui/common/text/battle/text_result_jinyan.png"),
			CCSprite:create("res/ui/noticeIcon/sign_add.png"),
			var_13_2,
			CCSprite:create("res/ui/juben/jubenLevelSelect/text/jb_rewa_wan.png")
		}, 0.5)

		var_13_1:getWidget("exp"):addChild(var_13_3)

		local var_13_4 = CCSprite:create()
		local var_13_5 = rmgr.getAnimation("sdtj_itemLight")
		local var_13_6 = CCAnimation:createWithSpriteFrames(var_13_5, 0.03)
		local var_13_7 = CCAnimate:create(var_13_6)

		var_13_4:runAction(CCRepeatForever:create(var_13_7))
		var_13_4:setPosition(ccp(var_13_1:getWidget("headImage"):getContentSize().width / 2, var_13_1:getWidget("headImage"):getContentSize().height / 2))
		var_13_1:getWidget("headImage"):addChild(var_13_4)
	end

	local var_13_8 = createRichNode(var_13_0, 0.5)

	var_13_8:setPosition(ccp(arg_13_0._layoutNode:getWidget("resultLayer"):getContentSize().width / 2, 200))
	arg_13_0._layoutNode:getWidget("resultLayer"):addChild(var_13_8)
	arg_13_0._layoutNode:getWidget("resultLayer"):setVisible(true)
end

return var_0_4
