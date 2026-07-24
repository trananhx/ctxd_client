jubenEnter = {}

tool.requireRes("world/jubenEnter")
require("lua/component/timerLabel")

jubenEnter.ui = {}

function jubenEnter.ui.exit()
	smgr.getLayer("topLayer"):removeChild(jubenEnter.ui.table.layer, true)
end

function jubenEnter.ui.onTouch(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0 == CCTOUCHBEGAN then
		-- block empty
	elseif arg_2_0 == CCTOUCHENDED then
		local var_2_0 = arg_2_1 - visibleSize.width / 2
		local var_2_1 = arg_2_2 - visibleSize.height / 2

		if var_2_0 > -190 and var_2_0 < 190 and var_2_1 > -100 and var_2_1 < 100 then
			-- block empty
		else
			jubenEnter.ui.exit()
		end
	end

	return true
end

function jubenEnter.ui.update()
	jubenEnter.ui.table.times:setString(language.get(330031, jubenEnter.data.playerEvent.leftTimes))

	local var_3_0 = string.format("res/ui/juben/jubenLevelSelect/text/jb_mode_%s.png", jubenEnter.data.playerEvent.grade)
	local var_3_1 = CCSprite:create(var_3_0)

	if var_3_1 ~= nil then
		jubenEnter.ui.table.diff:setDisplayFrame(var_3_1:displayFrame())
	end

	local var_3_2 = string.format("res/ui/juben/jubenSelect/map/jb_jb_%s.png", jubenEnter.data.playerEvent.pic)
	local var_3_3 = CCSprite:create(var_3_2)

	if var_3_3 ~= nil then
		jubenEnter.ui.table.bg:setDisplayFrame(var_3_3:displayFrame())
	end

	jubenEnter.ui.table.title:setString(jubenEnter.data.playerEvent.name)
	jubenEnter.ui.table.des:setString(jubenEnter.data.playerEvent.plot)
	jubenEnter.ui.table.layer:setVisible(true)
end

function jubenEnter.ui.init()
	jubenEnter.ui.table.title:setDimensions(CCSizeMake(320, 50))
	jubenEnter.ui.table.title:setHorizontalAlignment(kCCTextAlignmentLeft)
	jubenEnter.ui.table.title:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	jubenEnter.ui.table.btn_start:registerScriptTapHandler(jubenEnter.control.click_start)
end

function jubenEnter.ui.show(arg_5_0)
	jubenEnter.ui.cityId = arg_5_0

	local var_5_0 = createBaseLayer()

	jubenEnter.ui.table = autoUI.initUI(var_5_0, getJubenEnterData())

	jubenEnter.ui.init()

	jubenEnter.ui.table.layer = var_5_0

	jubenEnter.control.request_jubenInfo(arg_5_0)
	var_5_0:setVisible(false)
	var_5_0:registerScriptTouchHandler(jubenEnter.ui.onTouch, false, true)
	var_5_0:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_5_0, 10001)
end
