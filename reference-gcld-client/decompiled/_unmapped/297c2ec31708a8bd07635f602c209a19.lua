local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.maxTextScale = 0.7
else
	var_0_0.maxTextScale = 1
end

local var_0_1 = {}

function handleGemKitTipsButtonTap()
	local var_1_0 = {}

	log.info("threeColorBag: show tips @")

	local var_1_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_1_1:registerScriptTouchHandler(function(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_0 == CCTOUCHBEGAN then
			return true
		elseif arg_2_0 == CCTOUCHMOVED then
			return true
		elseif arg_2_0 == CCTOUCHENDED then
			log.info("touch end!")

			if var_1_0.GemKitTipFrame then
				var_1_0.GemKitTipFrame:setVisible(false)
			end

			pcall(var_1_1.removeFromParentAndCleanup, var_1_1, true)

			return true
		end
	end, false, true)
	var_1_1:setTouchEnabled(true)
	autoUI.createUI(var_1_1, getGemKitTipData(), var_1_0)
	smgr.rootLayer:addChild(var_1_1, 60000)
end

function getGemKitTipData()
	local var_3_0 = {}

	if conf.language == "kr" then
		var_3_0.frameWidth = 180
		var_3_0.frameHeight = 0
		var_3_0.frameX = -100
	elseif conf.language == "vie" then
		var_3_0.frameWidth = 180

		if platform.getFlag() == "MOBILE_IPHONE" then
			var_3_0.frameHeight = 0
		else
			var_3_0.frameHeight = 15
		end

		var_3_0.frameX = -100
	elseif conf.language == "tha" then
		var_3_0.frameWidth = 180

		if platform.getFlag() == "MOBILE_IPHONE" then
			var_3_0.frameHeight = 0
		else
			var_3_0.frameHeight = 15
		end

		var_3_0.frameX = -100
	else
		var_3_0.frameWidth = 0
		var_3_0.frameHeight = 0
		var_3_0.frameX = 0
	end

	local var_3_1 = require("res/native/offset").get("layer.threeColorBag")

	return {
		name = "GemKitTipFrame",
		type = "pic_9",
		anchorPointX = 0,
		ycenter = -65,
		pic = "frame:common_tip_frame_small.png",
		anchorPointY = 0,
		middleRect = CCRectMake(24, 24, 1, 1),
		preferedSize = CCSizeMake(470 + var_3_0.frameWidth + (var_3_1.tipPreferedSize or 0), 240 + var_3_0.frameHeight),
		xcenter = -50 + var_3_0.frameX + (var_3_1.tipOffsetX or 0),
		children = {
			{
				xcenter = 0,
				z = 10,
				fontSize = 20,
				anchorPointX = 0.5,
				ycenter = 20,
				type = "label",
				anchorPointY = 0.5,
				text = language.get(320300),
				color = ccc3(188, 167, 145),
				align = kCCTextAlignmentLeft
			}
		}
	}
end

var_0_1.bg = {
	xcenter = 0,
	name = "bg",
	type = "pic_9",
	ycenter = -28,
	pic = "frame:bigPanel.png",
	middleRect = CCRectMake(30, 30, 45, 45),
	preferedSize = CCSizeMake(960, 560),
	children = {
		{
			xcenter = 0,
			name = "bgyanhua",
			scale = 1.45,
			type = "pic",
			ycenter = 0,
			pic = "res/ui/threeColorBag/di.png",
			children = {
				{
					xcenter = -250,
					name = "gongximanji",
					type = "pic",
					ycenter = 30,
					pic = "res/ui/threeColorBag/02.png",
					scale = var_0_0.maxTextScale
				},
				{
					xcenter = -120,
					name = "xiaoqian",
					scale = 0.6,
					type = "pic",
					ycenter = 0,
					pic = "res/ui/comment/xiaoqian.png"
				},
				{
					xcenter = 138,
					name = "baoshikuang",
					scale = 0.95,
					type = "pic",
					ycenter = 22,
					pic = "res/ui/threeColorBag/01.png"
				}
			}
		},
		{
			down = 490,
			name = "tipButton",
			type = "button",
			left = 440,
			buttons = {
				{
					pic2 = "frame:btnTip_c.png",
					pic1 = "frame:btnTip_a.png",
					callBack = handleGemKitTipsButtonTap
				}
			}
		}
	}
}
var_0_1.closeMenu = {
	type = "button",
	buttons = {
		{
			pic2 = "frame:btn_close_c.png",
			name = "closeItem",
			pic1 = "frame:btn_close_a.png",
			top = 5,
			right = 5
		}
	}
}

function getThreeColorData()
	return var_0_1
end
