local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = tool.hexToRgb("#FFCC00")
local var_0_2 = class("ChangeNameNotice", function()
	return createBaseLayer()
end)

var_0_2.layout = {
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
						path = "btn_close_click.png"
					}
				},
				{
					y = 290,
					name = "bg",
					type = "sprite9",
					x = 480,
					preferedSize = CCSizeMake(916, 532),
					middleRect = CCRectMake(10, 10, 70, 70),
					pic = {
						path = "res/ui/common/panel/comm_view.png"
					},
					children = {
						{
							y = 470,
							x = 458,
							type = "sprite",
							pic = {
								path = "res/ui/general/jailView/comm_list_laofang_3.png"
							}
						},
						{
							y = 490,
							x = 458,
							type = "sprite",
							pic = {
								path = "res/ui/character/mhbg_title.png"
							}
						},
						{
							y = 451,
							type = "sprite",
							x = 458,
							anchorPoint = ccp(0.5, 1),
							pic = {
								path = "res/ui/character/mhbg_word_d.png"
							}
						},
						{
							y = 144,
							type = "sprite9",
							x = 458,
							preferedSize = CCSizeMake(960, 250),
							middleRect = CCRectMake(10, 50, 569, 112),
							pic = {
								path = "res/ui/nationTask/newPic/rwyh_jl_bg.png"
							}
						},
						{
							y = 425,
							x = 360,
							type = "sprite",
							pic = {
								path = "res/ui/general/jailView/comm_list_laofang_2.png"
							}
						},
						{
							y = 425,
							type = "sprite",
							x = 400,
							anchorPoint = ccp(1, 0.5),
							pic = {
								path = "res/ui/character/mhbg_gegz.png"
							}
						},
						{
							x = 180,
							name = "pic",
							y = 260,
							type = "sprite",
							scale = 0.8,
							pic = {
								path = "res/default.png"
							}
						},
						{
							name = "btn_good",
							h = 64,
							type = "button",
							w = 200,
							y = 65,
							x = 620,
							normal = {
								path = "res/ui/common/button/public_btn_green.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_green_c.png"
							},
							children = {
								{
									fontSize = 25,
									y = 35,
									type = "label",
									x = 100,
									textId = 136065,
									color = var_0_0
								}
							}
						},
						{
							fontSize = 25,
							name = "name",
							y = 238,
							type = "label",
							x = 350,
							color = var_0_1,
							anchorPoint = ccp(0, 0.5)
						},
						{
							fontSize = 25,
							name = "info2",
							height = 0,
							type = "label",
							y = 200,
							width = 540,
							x = 350,
							halign = kCCTextAlignmentLeft,
							color = var_0_0,
							anchorPoint = ccp(0, 1)
						}
					}
				}
			}
		}
	}
}

function var_0_2.onBtnCloseTap(arg_2_0)
	arg_2_0:removeFromParentAndCleanup(true)
end

function var_0_2.onBtnGoodTap(arg_3_0)
	table.remove(user.changeName, 1)

	if #user.changeName > 0 then
		arg_3_0:showPanel()
	else
		arg_3_0:removeFromParentAndCleanup(true)
		notice.control.refreshLayer()
	end
end

function var_0_2.showPanel(arg_4_0)
	local var_4_0 = user.changeName[1]

	if var_4_0 then
		if arg_4_0.view.widgets.info1 then
			arg_4_0.view.widgets.info1:removeFromParentAndCleanup(true)
		end

		local var_4_1 = {
			"#90C8F8",
			"#EB9642",
			"#88D442"
		}
		local var_4_2 = language.get(136066, var_4_1[var_4_0.forceId], user.forceIdToName[var_4_0.forceId], var_4_0.from, var_4_0.to)
		local var_4_3 = require("lua/component/HtmlView"):create({
			rowWidth = 540,
			htmlText = var_4_2
		})

		var_4_3:setPosition(ccp(350, 400))
		arg_4_0.view.widgets.bg:addChild(var_4_3)

		arg_4_0.view.widgets.info1 = var_4_3

		arg_4_0.view.widgets.name:setString(var_4_0.to)
		arg_4_0.view.widgets.info2:setString(language.get(var_4_0.forceId == user.player.forceId and 136067 or 136068))
		arg_4_0.view.widgets.pic:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerPic/player%d.png", var_4_0.pic)):displayFrame())
	end
end

function var_0_2.ctor(arg_5_0, arg_5_1)
	arg_5_0.view = {}

	uiutil.initWidgets(arg_5_0.view, arg_5_0.layout)
	arg_5_0:addChild(arg_5_0.view.widgets.Scene)

	if arg_5_1 then
		arg_5_1:addChild(arg_5_0)
	end

	swallowTouch(arg_5_0)
	arg_5_0.view.widgets.btn_close:addHandleOfControlEvent(function()
		arg_5_0:onBtnCloseTap()
	end, CCControlEventTouchUpInside)
	arg_5_0.view.widgets.btn_good:addHandleOfControlEvent(function()
		arg_5_0:onBtnGoodTap()
	end, CCControlEventTouchUpInside)
	arg_5_0:showPanel()
end

return var_0_2
