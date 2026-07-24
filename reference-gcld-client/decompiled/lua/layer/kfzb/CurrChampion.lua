local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = ccc3(0, 180, 0)
local var_0_2 = colorQuality[5]
local var_0_3 = colorQuality[4]
local var_0_4 = colorQuality[2]
local var_0_5 = class("CurrChampion", function()
	return CCNode:create()
end)

var_0_5.layout = {
	y = 0,
	name = "node",
	type = "node",
	x = 0,
	children = {
		{
			w = 86,
			name = "btn",
			h = 145,
			type = "button",
			y = 0,
			x = 0,
			normal = {
				path = "res/ui/world/jywd/cbzz_world_jx.png"
			},
			touched = {
				path = "res/ui/world/jywd/cbzz_world_jx_c.png"
			}
		},
		{
			type = "sprite",
			name = "bg1",
			y = -50,
			visible = false,
			x = 0,
			pic = {
				path = "res/ui/world/jywd/cbzz_world_word_di01.png"
			},
			children = {
				{
					fontSize = 18,
					name = "txt1",
					style = "label_warlock",
					type = "label",
					y = 17,
					x = 35,
					color = var_0_3,
					anchorPoint = ccp(0, 0.5)
				},
				{
					x = 10,
					name = "bg_icon",
					y = 17,
					type = "sprite",
					scale = 0.7,
					pic = {
						frame = true,
						path = "move_por_move_view.png"
					},
					children = {
						{
							x = 35,
							name = "icon",
							y = 34,
							type = "sprite",
							scale = 0.94,
							pic = {
								path = "res/ui/common/playerHead/playerHead_icon_11.png"
							}
						}
					}
				}
			}
		},
		{
			type = "sprite",
			name = "bg2",
			y = -78,
			visible = false,
			x = 0,
			pic = {
				path = "res/ui/world/jywd/cbzz_world_word_di02.png"
			},
			children = {
				{
					fontSize = 18,
					name = "txt2",
					style = "label_warlock",
					type = "label",
					y = 13,
					x = 35,
					color = var_0_0,
					anchorPoint = ccp(0, 0.5)
				}
			}
		}
	}
}
var_0_5.tipFrame = {
	name = "tipFrame",
	type = "sprite9Tips",
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(0, 0),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	content = {
		{
			fontSize = 20,
			height = 0,
			type = "label",
			width = 250,
			textId = 490110,
			color = var_0_3,
			halign = kCCTextAlignmentLeft
		},
		{
			fontSize = 20,
			height = 0,
			type = "label",
			width = 250,
			textId = 490111,
			color = var_0_0,
			halign = kCCTextAlignmentLeft
		}
	}
}

function var_0_5.showPanel(arg_2_0, arg_2_1)
	arg_2_0.info = arg_2_1

	local var_2_0 = {}

	if arg_2_1.kfzbeliteChampion then
		table.insert(var_2_0, {
			pic = arg_2_1.kfzbeliteChampion.pic,
			txt = language.get(490117, arg_2_1.kfzbeliteChampion.playerName)
		})
	end

	if arg_2_1.kfwdeliteChampion then
		table.insert(var_2_0, {
			pic = arg_2_1.kfwdeliteChampion.pic,
			txt = language.get(490113, arg_2_1.kfwdeliteChampion.playerName)
		})
	end

	for iter_2_0 = 1, 2 do
		local var_2_1 = var_2_0[iter_2_0]

		if var_2_1 then
			arg_2_0.view.widgets["txt" .. iter_2_0]:setString(var_2_1.txt)

			if iter_2_0 == 1 then
				arg_2_0.view.widgets.icon:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerHead/playerHead_icon_1%d.png", var_2_1.pic)):displayFrame())
			end

			arg_2_0.view.widgets["bg" .. iter_2_0]:setVisible(true)
		end
	end
end

function var_0_5.ctor(arg_3_0, arg_3_1)
	log.info("@@ 本届冠军，世界上的黄金像")

	arg_3_0.view = {}

	uiutil.initWidgets(arg_3_0.view, arg_3_0.layout)
	arg_3_0:addChild(arg_3_0.view.widgets.node)

	if arg_3_1.kfzbeliteChampion or arg_3_1.kfwdeliteChampion then
		arg_3_0.tipFrame.content[3] = {
			fontSize = 20,
			height = 0,
			type = "label",
			width = 250,
			textId = 490112,
			color = var_0_0
		}
	end

	local var_3_0 = arg_3_0.view.widgets.btn

	var_3_0:addHandleOfControlEvent(function()
		log.info("btn TouchDown")
		arg_3_0:showTip(true)
	end, CCControlEventTouchDown)
	var_3_0:addHandleOfControlEvent(function()
		log.info("btnTouchUpInside")
		arg_3_0:showTip(false)

		if arg_3_0.info.kfzbeliteChampion or arg_3_0.info.kfwdeliteChampion then
			local var_5_0 = smgr.getLayer("topLayer")

			var_5_0:removeAllChildrenWithCleanup(true)
			require("lua/layer/kfzb/EliteChampion").new(var_5_0)
		end
	end, CCControlEventTouchUpInside)
	var_3_0:addHandleOfControlEvent(function()
		log.info("btn TouchUpOutside")
		arg_3_0:showTip(false)
	end, CCControlEventTouchUpOutside)
	arg_3_0:showPanel(arg_3_1)
end

function var_0_5.showTip(arg_7_0, arg_7_1)
	if arg_7_0.view.widgets.tipFrame then
		arg_7_0.view.widgets.tipFrame:removeFromParentAndCleanup(true)

		arg_7_0.view.widgets.tipFrame = nil
	end

	if arg_7_1 then
		uiutil.initWidgets(arg_7_0.view, arg_7_0.tipFrame)
		arg_7_0.view.widgets.tipFrame:setPosition(ccp(0, 70))
		arg_7_0.view.widgets.btn:addChild(arg_7_0.view.widgets.tipFrame)
	end
end

return var_0_5
