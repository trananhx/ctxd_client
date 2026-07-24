local var_0_0 = {}
local var_0_1 = {}

if conf.language == "kr" then
	var_0_1.tipsFrameWidth = 0
	var_0_1.tipsFrameHeight = 50
	var_0_1.tipsFrameX = 0
	var_0_1.tips1Y = 40
	var_0_1.tips2Y = 40
	var_0_1.tips3Y = 40
	var_0_1.tips4Y = 30
	var_0_1.tips5Y = 10
	var_0_1.tipFontSize = 0
elseif conf.language == "vie" then
	var_0_1.tipsFrameWidth = 200
	var_0_1.tipsFrameHeight = 0
	var_0_1.tipsFrameX = 150
	var_0_1.tips1Y = 0
	var_0_1.tips2Y = 0
	var_0_1.tips3Y = 0
	var_0_1.tips4Y = 0
	var_0_1.tips5Y = 0
	var_0_1.tipFontSize = -6
elseif conf.language == "tha" then
	var_0_1.tipsFrameWidth = 200
	var_0_1.tipsFrameHeight = 0
	var_0_1.tipsFrameX = 150
	var_0_1.tips1Y = 0
	var_0_1.tips2Y = 0
	var_0_1.tips3Y = 0
	var_0_1.tips4Y = 0
	var_0_1.tips5Y = 0
	var_0_1.tipFontSize = -6
else
	var_0_1.tipsFrameWidth = 0
	var_0_1.tipsFrameHeight = 0
	var_0_1.tipsFrameX = 0
	var_0_1.tips1Y = 0
	var_0_1.tips2Y = 0
	var_0_1.tips3Y = 0
	var_0_1.tips4Y = 0
	var_0_1.tips5Y = 0
	var_0_1.tipFontSize = 0
end

var_0_0.layout = {
	widgets = {
		{
			name = "panel",
			type = "sprite9",
			zorder = 10000,
			y = 340,
			middleRect = CCRectMake(0, 0, 0, 0),
			preferedSize = CCSizeMake(750 + var_0_1.tipsFrameWidth, 222 + var_0_1.tipsFrameHeight),
			pic = {
				frame = true,
				path = "common_tip_frame_small.png"
			},
			x = 800 + var_0_1.tipsFrameX,
			anchorPoint = ccp(1, 1),
			children = {
				{
					name = "byeLabel1",
					stroke = true,
					type = "label",
					strokeSize = 1,
					textId = 410401,
					x = 17,
					y = 193 + var_0_1.tips1Y,
					color = ccc3(109, 225, 212),
					fontSize = 24 + var_0_1.tipFontSize,
					strokeColor = ccc3(33, 29, 23),
					anchorPoint = ccp(0, 0.5)
				},
				{
					name = "byeLabel1",
					stroke = true,
					type = "label",
					strokeSize = 1,
					textId = 410402,
					x = 17,
					y = 152 + var_0_1.tips2Y,
					color = ccc3(109, 225, 212),
					fontSize = 24 + var_0_1.tipFontSize,
					strokeColor = ccc3(33, 29, 23),
					anchorPoint = ccp(0, 0.5)
				},
				{
					name = "byeLabel1",
					stroke = true,
					type = "label",
					strokeSize = 1,
					textId = 410403,
					x = 17,
					y = 111 + var_0_1.tips3Y,
					color = ccc3(109, 225, 212),
					fontSize = 24 + var_0_1.tipFontSize,
					strokeColor = ccc3(33, 29, 23),
					anchorPoint = ccp(0, 0.5)
				},
				{
					name = "byeLabel1",
					stroke = true,
					type = "label",
					strokeSize = 1,
					textId = 410404,
					x = 17,
					y = 70 + var_0_1.tips4Y,
					color = ccc3(109, 225, 212),
					fontSize = 24 + var_0_1.tipFontSize,
					strokeColor = ccc3(33, 29, 23),
					anchorPoint = ccp(0, 0.5)
				},
				{
					name = "byeLabel1",
					stroke = true,
					type = "label",
					strokeSize = 1,
					textId = 410405,
					x = 17,
					y = 29 + var_0_1.tips5Y,
					color = ccc3(109, 225, 212),
					fontSize = 24 + var_0_1.tipFontSize,
					strokeColor = ccc3(33, 29, 23),
					anchorPoint = ccp(0, 0.5)
				}
			}
		}
	}
}

function var_0_0.create(arg_1_0, arg_1_1)
	arg_1_0:destory()

	arg_1_0.view = {}

	uiutil.initLayout(arg_1_0.view, var_0_0.layout)

	local function var_1_0(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_0 == CCTOUCHBEGAN and not checkIfTouch(arg_1_0.view.widgets.panel, arg_2_1, arg_2_2) then
			arg_1_0:destory()
		end
	end

	arg_1_0.view.widgets.panel:registerScriptTouchHandler(var_1_0)
	arg_1_0.view.widgets.panel:setTouchEnabled(true)

	if not tolua.isnull(arg_1_1) then
		arg_1_1:addChild(arg_1_0.view.widgets.panel)
	end
end

function var_0_0.destory(arg_3_0)
	if arg_3_0.view and arg_3_0.view.widgets and not tolua.isnull(arg_3_0.view.widgets.panel) then
		local var_3_0 = arg_3_0.view.widgets.panel:getParent()

		if not tolua.isnull(var_3_0) then
			var_3_0:removeChild(arg_3_0.view.widgets.panel, true)
		end
	end
end

return var_0_0
