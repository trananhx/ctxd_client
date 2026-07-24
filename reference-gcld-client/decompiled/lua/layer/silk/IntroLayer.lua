local var_0_0 = require("res/native/offset").get("layer.silk.introLayer")
local var_0_1 = false
local var_0_2 = class("IntroLayer", function()
	return createBaseLayer()
end)

var_0_2.layout = {
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
				path = "res/ui/silk/intro/sckq_bg.jpg"
			},
			children = {
				{
					y = 136,
					name = "bg1",
					type = "sprite",
					x = 158,
					pic = {
						path = "res/ui/silk/intro/sckq_samll_view.png"
					},
					children = {
						{
							y = 223,
							x = 153,
							type = "sprite",
							pic = {
								path = "res/ui/silk/intro/sckq_word_03.png"
							}
						},
						{
							y = 95.5,
							x = 153,
							type = "sprite",
							pic = {
								path = "res/ui/silk/intro/sckq_ct01.jpg"
							}
						}
					}
				},
				{
					y = 136,
					name = "bg2",
					type = "sprite",
					x = 458,
					pic = {
						path = "res/ui/silk/intro/sckq_samll_view.png"
					},
					children = {
						{
							y = 223,
							x = 153,
							type = "sprite",
							pic = {
								path = "res/ui/silk/intro/sckq_word_04.png"
							}
						},
						{
							y = 95.5,
							x = 153,
							type = "sprite",
							pic = {
								path = "res/ui/silk/intro/sckq_ct02.jpg"
							}
						}
					}
				},
				{
					y = 136,
					name = "bg3",
					type = "sprite",
					x = 758,
					pic = {
						path = "res/ui/silk/intro/sckq_samll_view.png"
					},
					children = {
						{
							y = 223,
							x = 153,
							type = "sprite",
							pic = {
								path = "res/ui/silk/intro/sckq_word_05.png"
							}
						},
						{
							y = 95.5,
							x = 153,
							type = "sprite",
							pic = {
								path = "res/ui/silk/intro/sckq_ct03.jpg"
							}
						}
					}
				},
				{
					y = 482,
					name = "txt1",
					type = "sprite",
					x = 458,
					pic = {
						path = "res/ui/silk/intro/sckq_word_01.png"
					}
				},
				{
					y = 395,
					name = "txt2",
					type = "sprite",
					x = 458,
					pic = {
						path = "res/ui/silk/intro/sckq_word_02.png"
					}
				},
				{
					name = "btn1",
					h = 88,
					type = "button",
					w = 88,
					y = 350,
					x = 118,
					normal = {
						path = "res/ui/silk/intro/sckq_icon_bg.png"
					},
					touched = {
						path = "res/ui/silk/intro/sckq_icon_bg.png"
					},
					children = {
						{
							y = 44,
							name = "icon",
							type = "sprite",
							x = 44,
							pic = {
								path = "res/ui/weapon/silkTreasure/treasure_icon/guantu.png"
							}
						}
					}
				},
				{
					name = "btn2",
					h = 88,
					type = "button",
					w = 88,
					y = 330,
					x = 288,
					normal = {
						path = "res/ui/silk/intro/sckq_icon_bg.png"
					},
					touched = {
						path = "res/ui/silk/intro/sckq_icon_bg.png"
					},
					children = {
						{
							y = 44,
							name = "icon",
							type = "sprite",
							x = 44,
							pic = {
								path = "res/ui/weapon/silkTreasure/treasure_icon/daotu.png"
							}
						}
					}
				},
				{
					name = "btn3",
					h = 88,
					type = "button",
					w = 88,
					y = 310,
					x = 458,
					normal = {
						path = "res/ui/silk/intro/sckq_icon_bg.png"
					},
					touched = {
						path = "res/ui/silk/intro/sckq_icon_bg.png"
					},
					children = {
						{
							y = 44,
							name = "icon",
							type = "sprite",
							x = 44,
							pic = {
								path = "res/ui/weapon/silkTreasure/treasure_icon/jiatu.png"
							}
						}
					}
				},
				{
					name = "btn4",
					h = 88,
					type = "button",
					w = 88,
					y = 330,
					x = 628,
					normal = {
						path = "res/ui/silk/intro/sckq_icon_bg.png"
					},
					touched = {
						path = "res/ui/silk/intro/sckq_icon_bg.png"
					},
					children = {
						{
							y = 44,
							name = "icon",
							type = "sprite",
							x = 44,
							pic = {
								path = "res/ui/weapon/silkTreasure/treasure_icon/duntu.png"
							}
						}
					}
				},
				{
					name = "btn5",
					h = 88,
					type = "button",
					w = 88,
					y = 350,
					x = 798,
					normal = {
						path = "res/ui/silk/intro/sckq_icon_bg.png"
					},
					touched = {
						path = "res/ui/silk/intro/sckq_icon_bg.png"
					},
					children = {
						{
							y = 44,
							name = "icon",
							type = "sprite",
							x = 44,
							pic = {
								path = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
							}
						}
					}
				},
				{
					w = 39,
					name = "btn_check",
					h = 39,
					type = "button",
					normal = {
						frame = true,
						path = "btn_check_1_a.png"
					},
					touched = {
						frame = true,
						path = "btn_check_1_on.png"
					},
					x = 750 + (var_0_0.btnCheckX or 0),
					y = 482 + (var_0_0.btnCheckY or 0)
				},
				{
					fontSize = 25,
					type = "label",
					textId = 122140,
					anchorPoint = ccp(0, 0.5),
					color = tool.hexToRgb("#ECDEA7"),
					x = 770 + (var_0_0.btnCheckX or 0),
					y = 482 + (var_0_0.btnCheckY or 0)
				}
			}
		}
	}
}
var_0_2.tipFrame = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(0.5, 1),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			height = 0,
			name = "tipMsg",
			type = "label",
			style = "label_warlock",
			width = 220,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = color_whi
		}
	}
}

function var_0_2.onBtnCloseTap(arg_2_0)
	if var_0_1 then
		local function var_2_0(arg_3_0)
			user.silkIcon = 0

			notice.control.refreshLayer()
			arg_2_0:removeFromParentAndCleanup(true)
		end

		cmgr.sendRequest(var_2_0, actions.silkPressIcon)
	else
		arg_2_0:removeFromParentAndCleanup(true)
	end
end

function var_0_2.showTip(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if arg_4_0.view.widgets.tipFrame then
		arg_4_0.view.widgets.tipFrame:removeFromParentAndCleanup(true)

		arg_4_0.view.widgets.tipFrame = nil
	end

	if arg_4_1 then
		local var_4_0, var_4_1 = tool.getPositionInScreen(arg_4_2)

		uiutil.initWidgets(arg_4_0.view, arg_4_0.tipFrame)
		arg_4_0:addChild(arg_4_0.view.widgets.tipFrame)
		arg_4_0.view.widgets.tipMsg:setDimensions(CCSizeMake(220, 0))

		local var_4_2

		if arg_4_3 then
			local var_4_3 = {
				"122105_zww",
				"122104_zww",
				"122102_zww",
				"122103_zww",
				"122101_zww"
			}

			var_4_2 = language.get(var_4_3[arg_4_3])
		else
			var_4_2 = ""
		end

		arg_4_0.view.widgets.tipMsg:setString(var_4_2)

		local var_4_4 = arg_4_0.view.widgets.tipMsg:getContentSize().width
		local var_4_5 = arg_4_0.view.widgets.tipMsg:getContentSize().height

		arg_4_0.view.widgets.tipFrame:setPreferredSize(CCSizeMake(var_4_4 + 30, var_4_5 + 30))
		arg_4_0.view.widgets.tipFrame:setPosition(ccp(var_4_0, var_4_1 - 40))
		arg_4_0.view.widgets.tipMsg:setPosition(ccp(15, 15))
		arg_4_0.view.widgets.tipFrame:setVisible(true)
	end
end

function var_0_2.ctor(arg_5_0, arg_5_1)
	arg_5_0.view = {}

	uiutil.initWidgets(arg_5_0.view, arg_5_0.layout)
	arg_5_0:addChild(arg_5_0.view.widgets.panel)

	if arg_5_1 then
		arg_5_1:addChild(arg_5_0)
	end

	swallowTouch(arg_5_0)
	arg_5_0.view.widgets.btn_close:addHandleOfControlEvent(function()
		arg_5_0:onBtnCloseTap()
	end, CCControlEventTouchUpInside)
	arg_5_0.view.widgets.btn_check:setHighlighted(var_0_1)
	arg_5_0.view.widgets.btn_check:addHandleOfControlEvent(function()
		var_0_1 = not var_0_1

		arg_5_0.view.widgets.btn_check:setHighlighted(var_0_1)
	end, CCControlEventTouchUpInside)

	for iter_5_0 = 1, 5 do
		local var_5_0 = arg_5_0.view.widgets["btn" .. iter_5_0]

		var_5_0:addHandleOfControlEvent(function()
			log.info("btn%s: TouchDown", iter_5_0)
			arg_5_0:showTip(true, var_5_0, iter_5_0)
		end, CCControlEventTouchDown)
		var_5_0:addHandleOfControlEvent(function()
			log.info("btn%s: TouchUpInside", iter_5_0)
			arg_5_0:showTip(false)
		end, CCControlEventTouchUpInside)
		var_5_0:addHandleOfControlEvent(function()
			log.info("btn%s: TouchUpOutside", iter_5_0)
			arg_5_0:showTip(false)
		end, CCControlEventTouchUpOutside)
	end
end

return var_0_2
