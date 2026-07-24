local var_0_0 = {
	[42] = {
		pic = "icon_mbl_h.png",
		type = 5
	}
}
local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = ccc3(0, 180, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = class("CelePanel", function()
	return createBaseLayer()
end)

var_0_6.layout = {
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
					w = 35,
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
						path = "res/ui/kfzb/kfzbs_tz_bg.jpg"
					}
				},
				{
					y = 495,
					name = "title",
					type = "sprite",
					x = 480,
					pic = {
						path = "res/ui/kfzb/jywdh_wdqg_title.png"
					}
				},
				{
					x = 70,
					name = "pic",
					y = 120,
					type = "sprite",
					scale = 0.8,
					anchorPoint = ccp(0, 0)
				},
				{
					y = 340,
					x = 620,
					type = "sprite",
					pic = {
						path = "res/ui/kfzb/jywdh_word_wdhgj.png"
					}
				},
				{
					name = "btn_celebrate",
					h = 56,
					type = "button",
					w = 189,
					y = 75,
					x = 480,
					normal = {
						path = "res/ui/common/button/sdyjs_btn_03.png"
					},
					touched = {
						path = "res/ui/common/button/sdyjs_btn_03_c.png"
					},
					children = {
						{
							fontSize = 25,
							style = "label_warlock",
							y = 33,
							type = "label",
							x = 90,
							textId = 320450,
							color = var_0_1
						}
					}
				},
				{
					y = 280,
					name = "info1",
					anchorPointX = 0.5,
					type = "richLine",
					gap = 15,
					x = 620,
					content = {
						{
							fontSize = 28,
							name = "info1_p1",
							style = "label_warlock",
							type = "label",
							y = 0,
							x = 0,
							color = ccc3(255, 204, 0)
						},
						{
							fontSize = 28,
							name = "info1_p2",
							style = "label_warlock",
							type = "label",
							y = 0,
							x = 0
						},
						{
							fontSize = 28,
							style = "label_warlock",
							y = 0,
							type = "label",
							x = 0,
							textId = 135414,
							color = var_0_1
						}
					}
				},
				{
					fontSize = 24,
					name = "info2",
					x = 620,
					type = "label",
					height = 0,
					style = "label_warlock",
					y = 230,
					width = 540,
					color = var_0_1,
					halign = kCCTextAlignmentLeft
				}
			}
		}
	}
}

function var_0_6.onCelebrate(arg_2_0)
	local function var_2_0(arg_3_0)
		local var_3_0 = arg_3_0.action.data

		user.showKfzbCele = false

		notice.control.refreshLayer()

		local var_3_1 = {}
		local var_3_2 = {
			id = var_0_0[var_3_0.type].type,
			value = var_3_0.num
		}

		table.insert(var_3_1, var_3_2)
		globalAction_gotResource(var_3_1)
		arg_2_0:removeFromParentAndCleanup(true)
	end

	cmgr.sendRequest(var_2_0, actions.kfzbCelebrateChampion)
end

function var_0_6.showPanel(arg_4_0, arg_4_1)
	arg_4_0.info = arg_4_1

	arg_4_0.view.widgets.pic:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerPic/player%d.png", arg_4_1.pic)):displayFrame())
	arg_4_0.view.widgets.info1_p1:setString(language.get(390469, arg_4_1.serverName))
	arg_4_0.view.widgets.info1_p2:setString(language.get(490084, arg_4_1.forceName, arg_4_1.playerName))
	arg_4_0.view.widgets.info1_p2:setColor(colorForce[arg_4_1.forceId])
	arg_4_0.view.widgets.info1:reorder()
	arg_4_0.view.widgets.info2:setString(language.get(490085, arg_4_1.zoneId))
end

function var_0_6.ctor(arg_5_0, arg_5_1, arg_5_2)
	log.info("@@ 武斗庆功")

	arg_5_0.view = {}

	uiutil.initWidgets(arg_5_0.view, arg_5_0.layout)
	swallowTouch(arg_5_0)

	if arg_5_1 then
		arg_5_0:addChild(arg_5_0.view.widgets.Scene)
		arg_5_1:addChild(arg_5_0)
	end

	arg_5_0.view.widgets.btn_close:addHandleOfControlEvent(function()
		log.info("btn_close")
		arg_5_0:removeFromParentAndCleanup(true)
	end, CCControlEventTouchUpInside)
	arg_5_0.view.widgets.btn_celebrate:addHandleOfControlEvent(function()
		log.info("btn_celebrate")
		arg_5_0:onCelebrate()
	end, CCControlEventTouchUpInside)
	arg_5_0:showPanel(arg_5_2)
end

return var_0_6
