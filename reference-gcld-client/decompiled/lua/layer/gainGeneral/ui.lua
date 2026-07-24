gainGeneral = {}

tool.requireRes("gainGeneral")
require("lua/component/timerLabel")

gainGeneral.ui = {}
gainGeneral.ui.index = 1

function gainGeneral.ui.onTouch()
	return true
end

function gainGeneral.ui.exit()
	smgr.getLayer("topLayer"):removeChild(gainGeneral.ui.table.layer, true)
	fly_gainGenaral(gainGeneral.ui.index)
end

function gainGeneral.ui.init()
	gainGeneral.ui.table.shangzhen:registerScriptTapHandler(gainGeneral.ui.exit)
	gainGeneral.ui.table.layer:setVisible(true)
	gainGeneral.ui.table.name:setDimensions(CCSizeMake(200, 80))
	gainGeneral.ui.table.des:setDimensions(CCSizeMake(200, 80))
	gainGeneral.ui.table.name:setHorizontalAlignment(kCCTextAlignmentLeft)
	gainGeneral.ui.table.des:setHorizontalAlignment(kCCTextAlignmentLeft)
	gainGeneral.ui.table.name:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	gainGeneral.ui.table.des:setVerticalAlignment(kCCVerticalTextAlignmentCenter)

	if gainGeneral.ui.index == 1 then
		gainGeneral.ui.table.name:setString(language.get(370001))
		gainGeneral.ui.table.des:setString(language.get(370002))

		local var_3_0 = CCSprite:create("res/ui/common/generalPic/generalPic_zhangliang.jpg")

		gainGeneral.ui.table.head:setDisplayFrame(var_3_0:displayFrame())
	elseif gainGeneral.ui.index == 2 then
		gainGeneral.ui.table.name:setString(language.get(370003))
		gainGeneral.ui.table.des:setString(language.get(370004))

		local var_3_1 = CCSprite:create("res/ui/common/generalPic/generalPic_huaxiong.jpg")

		gainGeneral.ui.table.head:setDisplayFrame(var_3_1:displayFrame())
	end
end

function gainGeneral.ui.show(arg_4_0)
	local var_4_0 = createBaseLayer()

	gainGeneral.ui.table = autoUI.initUI(var_4_0, getGainGeneralData())
	gainGeneral.ui.table.layer = var_4_0

	var_4_0:registerScriptTouchHandler(gainGeneral.ui.onTouch, false, true)
	var_4_0:setTouchEnabled(true)

	gainGeneral.ui.index = arg_4_0

	smgr.getLayer("topLayer"):addChild(var_4_0, 10001)
	gainGeneral.ui.init()
end
