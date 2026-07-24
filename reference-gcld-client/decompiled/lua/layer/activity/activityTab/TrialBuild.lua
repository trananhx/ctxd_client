local var_0_0 = colorQuality[0]
local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = ccc3(0, 180, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = class("TrialBuild", function()
	return createBaseLayer()
end)

var_0_6.layout = {
	y = 0,
	name = "Scene",
	type = "node",
	x = 0,
	children = {
		{
			name = "bg",
			type = "sprite",
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 - 30,
			pic = {
				path = "res/ui/activity/betray/zyzh_bg.jpg"
			},
			children = {
				{
					fontSize = 25,
					name = "leftTime",
					style = "label_warlock",
					type = "label",
					y = 470,
					x = 690,
					color = var_0_3
				},
				{
					y = 480,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/buildEvent/notice/sjjz_title.png"
					}
				},
				{
					y = 260.0004,
					x = 458,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_jz_01.png"
					}
				},
				{
					y = 261,
					x = 885,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_jz_02.png"
					}
				},
				{
					y = 360,
					x = 458,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_bg2.png"
					}
				},
				{
					y = 260,
					name = "npc",
					type = "sprite",
					x = 140,
					pic = {
						path = "res/ui/common/halfPic/halfPic_caocao2.png"
					}
				},
				{
					y = 270,
					x = 550,
					type = "sprite",
					pic = {
						path = "res/ui/buildEvent/notice/sjjz_word_01.png"
					}
				},
				{
					y = 200,
					x = 549.9998,
					type = "sprite",
					pic = {
						path = "res/ui/buildEvent/notice/sjjz_word_02.png"
					}
				},
				{
					style = "button_tip",
					name = "btn_tip",
					y = 470,
					type = "button",
					x = 850
				},
				{
					fontSize = 25,
					style = "label_warlock",
					y = 368.333,
					type = "label",
					x = 550,
					textId = 92153,
					color = var_0_1
				}
			}
		}
	}
}

local var_0_7 = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(1, 1),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			name = "tipMsg",
			height = 0,
			type = "label",
			width = 400,
			textId = 92152,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}

function var_0_6.showPanel(arg_2_0, arg_2_1)
	arg_2_0.info = arg_2_1
end

function var_0_6.ctor(arg_3_0, arg_3_1, arg_3_2)
	log.info("@@ 世界建造")
	rmgr.loadResource("res/ui/activity/betray/betrayPic.plist")

	arg_3_0.view = {}

	uiutil.initWidgets(arg_3_0.view, arg_3_0.layout)

	arg_3_0.leftTime = arg_3_0.view.widgets.leftTime

	if arg_3_1 then
		arg_3_0:addChild(arg_3_0.view.widgets.Scene)
		arg_3_1:addChild(arg_3_0)
	end

	arg_3_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_3_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_3_0:showPanel(arg_3_2)
end

function var_0_6.showTip(arg_5_0)
	log.info("should show tips ")

	local var_5_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_5_0:registerScriptTouchHandler(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == CCTOUCHBEGAN then
			return true
		elseif arg_6_0 == CCTOUCHMOVED then
			return true
		elseif arg_6_0 == CCTOUCHENDED then
			pcall(var_5_0.removeFromParentAndCleanup, var_5_0, true)

			return true
		end
	end, false, true)
	var_5_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_5_0, 60000)

	local var_5_1 = 0
	local var_5_2 = 0
	local var_5_3 = {}

	uiutil.initWidgets(var_5_3, var_0_7)
	var_5_0:addChild(var_5_3.widgets.tipFrame)

	local var_5_4, var_5_5 = tool.getPositionInScreen(arg_5_0.view.widgets.btn_tip)
	local var_5_6 = var_5_4 + 20
	local var_5_7 = var_5_5 - 20
	local var_5_8 = var_5_3.widgets.tipMsg:getContentSize().width
	local var_5_9 = var_5_3.widgets.tipMsg:getContentSize().height

	var_5_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_5_8 + 30, var_5_9 + 30))
	var_5_3.widgets.tipFrame:setPosition(ccp(var_5_6, var_5_7))
	var_5_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_5_3.widgets.tipFrame:setVisible(true)
end

return var_0_6
