guide = {}

require("lua/guide/control")
require("lua/guide/constant")

guide.ui = {}
guide.ui.table = {}

function guide.ui.initUI()
	local var_1_0 = CCLayerColor:create(ccc4(64, 64, 64, 0))
	local var_1_1 = ccBlendFunc:new()

	guide.ui.table.layer:addChild(var_1_0)

	guide.ui.table.mask = var_1_0

	local var_1_2 = {}

	var_1_2.left = "jiantou-zuo.png"
	var_1_2.right = "jiantou-you.png"
	var_1_2.up = "jiantou-shang.png"
	var_1_2.down = "jiantou-xia.png"
	var_1_2.text_up = "guide_view_up.png"
	var_1_2.text_right = "guide_view_right.png"
	var_1_2.text_down = "guide_view_down.png"
	var_1_2.text_left = "guide_view_left.png"

	for iter_1_0, iter_1_1 in pairs(var_1_2) do
		local var_1_3 = "res/ui/guide/" .. tostring(iter_1_1)
		local var_1_4 = CCSprite:create(var_1_3)

		var_1_4:setVisible(false)
		var_1_0:addChild(var_1_4)

		guide.ui.table[iter_1_0] = var_1_4
	end

	guide.ui.setVisible(false)
	eventManager.registerEvent("GameOver", guide.control.game_exit)
end

function guide.ui.setVisible(arg_2_0)
	guide.ui.table.layer:setVisible(arg_2_0)
end

function guide.ui.disable_arrow_in_juben()
	guide.ui.table.left:setPosition(ccp(-10000, -10000))
	guide.ui.table.right:setPosition(ccp(-10000, -10000))
	guide.ui.table.up:setPosition(ccp(-10000, -10000))
	guide.ui.table.down:setPosition(ccp(-10000, -10000))
	guide.ui.table.text_up:setPosition(ccp(-10000, -10000))
	guide.ui.table.text_right:setPosition(ccp(-10000, -10000))
	guide.ui.table.text_down:setPosition(ccp(-10000, -10000))
	guide.ui.table.text_left:setPosition(ccp(-10000, -10000))
end

function guide.ui.isVisible()
	if guide.control.type == 1 then
		return guide.ui.table.layer:isVisible()
	end

	return false
end

function guide.ui.onEnter()
	log.info("enter guide layer ... ")
end

function guide.ui.onExit()
	log.info("exit guide layer ... ")
end

function guide.ui.createLayer()
	local var_7_0 = createBaseLayer()

	guide.ui.table.layer = var_7_0
	var_7_0.onEnter = guide.ui.onEnter
	var_7_0.onExit = guide.ui.onExit

	guide.ui.initUI()

	return var_7_0
end
