local var_0_0 = require("res/native/offset").get("layer.kfyz.junku")
local var_0_1 = tool.hexToRgb("#ECDEA7")
local var_0_2 = ccc3(0, 180, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = class("kfyzJunkuLayer", function()
	return createBaseLayer()
end)

var_0_6.layout = {
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
			w = 32,
			name = "btn_close",
			h = 33,
			type = "button",
			y = 604,
			x = 924,
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
				path = "res/ui/weapon/diamondShop/warlock_view1.jpg"
			},
			children = {
				{
					y = 503,
					name = "title",
					type = "sprite",
					x = 458,
					pic = {
						path = "res/ui/kfyz/junku/yzjk_title.png"
					}
				},
				{
					y = 345,
					name = "light1",
					type = "sprite",
					x = 45,
					pic = {
						path = "res/ui/kfyz/junku/yzjk_lantern.png"
					}
				},
				{
					y = 350,
					name = "light2",
					type = "sprite",
					x = 870,
					pic = {
						path = "res/ui/kfyz/junku/yzjk_lantern.png"
					}
				},
				{
					y = 220,
					name = "card1",
					type = "sprite",
					x = 188,
					pic = {
						path = "res/ui/kfyz/junku/yzjk_samll_bg.png"
					},
					children = {
						{
							fontSize = 20,
							name = "gold1",
							y = 197,
							type = "label",
							x = 145,
							anchorPoint = ccp(0, 0.5),
							color = var_0_1
						},
						{
							y = 194,
							x = 130,
							type = "sprite",
							scale = 0.8,
							pic = {
								frame = true,
								path = "res_icon_19_small.png"
							}
						},
						{
							y = 332,
							x = 150,
							type = "sprite",
							pic = {
								path = "res/ui/kfyz/junku/yzjk_word_gcc.png"
							}
						},
						{
							name = "btn1",
							h = 75,
							type = "button",
							w = 258,
							y = 61,
							x = 150,
							normal = {
								frame = true,
								path = "btn4_gre_a.png"
							},
							touched = {
								frame = true,
								path = "btn4_gre_c.png"
							},
							disable = {
								frame = true,
								path = "btn4_gre_g.png"
							}
						},
						{
							y = 248,
							x = 149,
							type = "sprite",
							pic = {
								path = "res/ui/kfyz/junku/gcc.jpg"
							}
						},
						{
							y = 318,
							x = 78,
							type = "sprite",
							pic = {
								path = "res/ui/kfyz/junku/yzjk_jb_gwzy.png"
							}
						},
						{
							name = "txt1",
							y = 134,
							type = "label",
							width = 200,
							x = 150,
							height = 0,
							fontSize = 20 + (var_0_0.cardLabelSize or 0),
							halign = kCCTextAlignmentLeft,
							halign = kCCVerticalTextAlignmentTop
						},
						{
							fontSize = 25,
							name = "lbl_btn1",
							x = 150,
							type = "label",
							height = 0,
							style = "label_warlock",
							y = 61,
							width = 150,
							color = var_0_1
						},
						{
							fontSize = 25,
							name = "num1",
							y = 83,
							type = "label",
							style = "label_warlock",
							x = 255,
							anchorPoint = ccp(1, 1),
							color = var_0_4
						}
					}
				},
				{
					y = 220,
					name = "card2",
					type = "sprite",
					x = 458,
					pic = {
						path = "res/ui/kfyz/junku/yzjk_samll_bg.png"
					},
					children = {
						{
							fontSize = 20,
							name = "gold2",
							y = 197,
							type = "label",
							x = 145,
							anchorPoint = ccp(0, 0.5),
							color = var_0_1
						},
						{
							y = 194,
							x = 130,
							type = "sprite",
							scale = 0.8,
							pic = {
								frame = true,
								path = "res_icon_19_small.png"
							}
						},
						{
							y = 332,
							x = 150,
							type = "sprite",
							pic = {
								path = "res/ui/kfyz/junku/yzjk_word_jml.png"
							}
						},
						{
							name = "btn2",
							h = 75,
							type = "button",
							w = 258,
							y = 61,
							x = 150,
							normal = {
								frame = true,
								path = "btn4_gre_a.png"
							},
							touched = {
								frame = true,
								path = "btn4_gre_c.png"
							},
							disable = {
								frame = true,
								path = "btn4_gre_g.png"
							}
						},
						{
							y = 248,
							x = 149,
							type = "sprite",
							pic = {
								path = "res/ui/kfyz/junku/jml.jpg"
							}
						},
						{
							y = 318,
							x = 78,
							type = "sprite",
							pic = {
								path = "res/ui/kfyz/junku/yzjk_jb_ypzy.png"
							}
						},
						{
							name = "txt2",
							y = 134,
							type = "label",
							width = 200,
							x = 150,
							height = 0,
							fontSize = 20 + (var_0_0.cardLabelSize or 0),
							halign = kCCTextAlignmentLeft,
							halign = kCCVerticalTextAlignmentTop
						},
						{
							fontSize = 25,
							name = "lbl_btn2",
							x = 150,
							type = "label",
							height = 0,
							style = "label_warlock",
							y = 61,
							width = 150,
							color = var_0_1
						},
						{
							fontSize = 25,
							name = "num2",
							y = 83,
							type = "label",
							style = "label_warlock",
							x = 255,
							anchorPoint = ccp(1, 1),
							color = var_0_4
						}
					}
				},
				{
					y = 220,
					name = "card3",
					type = "sprite",
					x = 728,
					pic = {
						path = "res/ui/kfyz/junku/yzjk_samll_bg.png"
					},
					children = {
						{
							fontSize = 20,
							name = "gold3",
							y = 197,
							type = "label",
							x = 145,
							anchorPoint = ccp(0, 0.5),
							color = var_0_1
						},
						{
							y = 194,
							x = 130,
							type = "sprite",
							scale = 0.8,
							pic = {
								frame = true,
								path = "res_icon_19_small.png"
							}
						},
						{
							y = 332,
							x = 150,
							type = "sprite",
							pic = {
								path = "res/ui/kfyz/junku/yzjk_word_pdl.png"
							}
						},
						{
							name = "btn3",
							h = 75,
							type = "button",
							w = 258,
							y = 61,
							x = 150,
							normal = {
								frame = true,
								path = "btn4_gre_a.png"
							},
							touched = {
								frame = true,
								path = "btn4_gre_c.png"
							},
							disable = {
								frame = true,
								path = "btn4_gre_g.png"
							}
						},
						{
							y = 248,
							x = 149,
							type = "sprite",
							pic = {
								path = "res/ui/kfyz/junku/pdl.jpg"
							}
						},
						{
							name = "txt3",
							y = 134,
							type = "label",
							width = 200,
							x = 150,
							height = 0,
							fontSize = 20 + (var_0_0.cardLabelSize or 0),
							halign = kCCTextAlignmentLeft,
							halign = kCCVerticalTextAlignmentTop
						},
						{
							fontSize = 25,
							name = "lbl_btn3",
							x = 150,
							type = "label",
							height = 0,
							style = "label_warlock",
							y = 61,
							width = 150,
							color = var_0_1
						},
						{
							fontSize = 25,
							name = "num3",
							y = 83,
							type = "label",
							style = "label_warlock",
							x = 255,
							anchorPoint = ccp(1, 1),
							color = var_0_4
						}
					}
				}
			}
		}
	}
}

function var_0_6.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.data)
	end

	kfcmgr.sendRequest(var_2_0, actions.kfyzGetArmyBaseInfo)
end

function var_0_6.onBtnUseTap(arg_4_0, arg_4_1)
	local var_4_0 = 0

	local function var_4_1(arg_5_0)
		if arg_4_1 == 2 then
			arg_4_0:removeFromParentAndCleanup(true)

			local var_5_0 = user.player.kfgzForceId

			eventManager.dispatchEvent("showEffectJuMa", var_5_0, arg_5_0.data.lastTime)
		elseif arg_4_1 == 3 then
			eventManager.dispatchEvent("showEffectPoDi", arg_5_0.data.lastTime)
			smgr.showTipTextGreen(language.get(390565))
			arg_4_0:refresh()
		end
	end

	if arg_4_1 == 1 then
		arg_4_0:removeFromParentAndCleanup(true)
		eventManager.dispatchEvent("armyBaseSetVisible", true)
	elseif arg_4_1 == 2 or arg_4_1 == 3 then
		messageBox.showChargeWin("", language.get(390539), "armybase", function()
			kfcmgr.sendRequest(var_4_1, actions.kfyzUseArmyBaseInfo, arg_4_1, var_4_0)
		end)
	end
end

function var_0_6.showPanel(arg_7_0, arg_7_1)
	arg_7_0.info = arg_7_1

	for iter_7_0 = 1, 3 do
		local var_7_0 = arg_7_1.items[iter_7_0]

		arg_7_0.view.widgets["txt" .. iter_7_0]:setString(arg_7_1.items[iter_7_0].intro)
		arg_7_0.view.widgets["gold" .. iter_7_0]:setString(var_7_0.gold)
		arg_7_0.view.widgets["num" .. iter_7_0]:setString(language.get(135039, var_7_0.num - var_7_0.useNum))

		local var_7_1 = arg_7_1.playerOffcie <= var_7_0.threshOffice
		local var_7_2 = var_7_1 and 102032 or 390544

		if var_7_1 and iter_7_0 == 1 and user.invastType == 2 then
			var_7_1 = false
			var_7_2 = 390542
		end

		arg_7_0.view.widgets["lbl_btn" .. iter_7_0]:setString(language.get(var_7_2))
		arg_7_0.view.widgets["btn" .. iter_7_0]:setEnabled(var_7_1)
	end
end

function var_0_6.ctor(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.view = {}

	uiutil.initWidgets(arg_8_0.view, arg_8_0.layout)
	swallowTouch(arg_8_0)
	arg_8_0:addChild(arg_8_0.view.widgets.panel)

	if arg_8_1 then
		arg_8_1:addChild(arg_8_0)
	end

	arg_8_0.view.widgets.btn_close:setScale(2)
	arg_8_0.view.widgets.btn_close:addHandleOfControlEvent(function()
		arg_8_0:removeFromParentAndCleanup(true)
	end, CCControlEventTouchUpInside)

	for iter_8_0 = 1, 3 do
		local var_8_0 = arg_8_0.view.widgets["btn" .. iter_8_0]

		var_8_0:setScaleX(0.9)
		var_8_0:setScaleY(0.75)
		var_8_0:addHandleOfControlEvent(function()
			arg_8_0:onBtnUseTap(iter_8_0)
		end, CCControlEventTouchUpInside)
	end

	if arg_8_2 then
		arg_8_0:showPanel(arg_8_2)
	else
		arg_8_0:refresh()
	end
end

return var_0_6
