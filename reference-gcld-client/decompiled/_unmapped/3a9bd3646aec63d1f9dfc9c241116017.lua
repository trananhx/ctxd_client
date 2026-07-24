local var_0_0 = class("taskCompleteLayer", function()
	return createBaseLayer()
end)

var_0_0.layout = {
	name = "panel",
	type = "sprite",
	x = visibleSize.width / 2,
	y = visibleSize.height / 2,
	pic = {
		path = "res/ui/juben/event/jb_hide_set.png"
	},
	children = {
		{
			y = 160,
			name = "title",
			type = "sprite",
			x = 20,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "res/ui/world/nationChallenges/task_challenge_title_duoquan.png"
			}
		},
		{
			y = 155,
			name = "rank",
			type = "sprite",
			x = 379,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "res/ui/world/nationChallenges/task_challenge_tit_3.png"
			}
		},
		{
			y = 95,
			x = 300,
			type = "sprite",
			scale = 1.1,
			pic = {
				path = "res/ui/world/nationChallenges/task_challenge_load.jpg"
			}
		},
		{
			y = 95,
			name = "bg_icon1",
			type = "sprite",
			x = 610,
			pic = {
				path = "res/ui/world/nationChallenges/task_challenge_icon_view.png"
			}
		},
		{
			y = 95,
			name = "icon1",
			type = "sprite",
			x = 610,
			pic = {
				path = "res/ui/world/nationChallenges/task_challenge_icon_1905.png"
			}
		},
		{
			y = 95,
			name = "bg_icon2",
			type = "sprite",
			x = 660,
			pic = {
				path = "res/ui/world/nationChallenges/task_challenge_icon_view.png"
			}
		},
		{
			y = 95,
			name = "icon2",
			type = "sprite",
			x = 660,
			pic = {
				path = "res/ui/world/nationChallenges/task_challenge_icon_1905.png"
			}
		},
		{
			y = 30,
			name = "reward1_p1",
			type = "sprite",
			x = 40,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "res/ui/world/nationChallenges/task_challenge_award_jl.png"
			}
		},
		{
			y = 30,
			name = "reward1_p2",
			type = "sprite",
			x = 115,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "res/ui/world/nationChallenges/task_challenge_award_1905.png"
			}
		},
		{
			name = "reward1_p3",
			type = "atlaslabel",
			pic = "res/ui/common/number/resou_up_numb.png",
			startCharMap = 48,
			text = "0",
			y = 30,
			itemWidth = 20,
			x = 260,
			itemHeight = 22,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 25,
			name = "info",
			y = 95,
			type = "label",
			x = 300
		},
		{
			y = 30,
			name = "reward2_p1",
			type = "sprite",
			x = 370,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "res/ui/world/nationChallenges/task_challenge_award_jl.png"
			}
		},
		{
			y = 30,
			name = "reward2_p2",
			type = "sprite",
			x = 445,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "res/ui/world/nationChallenges/task_challenge_award_1905.png"
			}
		},
		{
			name = "reward2_p3",
			type = "atlaslabel",
			pic = "res/ui/common/number/resou_up_numb.png",
			startCharMap = 48,
			text = "0",
			y = 30,
			itemWidth = 20,
			x = 590,
			itemHeight = 22,
			anchorPoint = ccp(0, 0.5)
		}
	}
}

function var_0_0.showPanel(arg_2_0, arg_2_1)
	arg_2_0.info = arg_2_1

	local var_2_0 = "res/ui/world/nationChallenges/"

	require("lua/layer/world/nationChallenges/ui")

	local var_2_1 = arg_2_1.pic

	if nationChallenges.constant.picToTit[arg_2_1.pic] then
		var_2_1 = nationChallenges.constant.picToTit[arg_2_1.pic]
	end

	arg_2_0.view.widgets.title:setDisplayFrame(CCSprite:create(var_2_0 .. "task_challenge_title_" .. var_2_1 .. ".png"):displayFrame())
	arg_2_0.view.widgets.rank:setDisplayFrame(CCSprite:create(var_2_0 .. "task_challenge_tit_" .. arg_2_1.star .. ".png"):displayFrame())
	arg_2_0.view.widgets.info:setString(language.get(390478, arg_2_1.goal, arg_2_1.goal))
	arg_2_0.view.widgets.icon1:setDisplayFrame(CCSprite:create(var_2_0 .. "task_challenge_icon_" .. arg_2_1.rewardType .. ".png"):displayFrame())
	arg_2_0.view.widgets.reward1_p2:setDisplayFrame(CCSprite:create(var_2_0 .. "task_challenge_award_" .. arg_2_1.rewardType .. ".png"):displayFrame())
	arg_2_0.view.widgets.reward1_p3:setString(arg_2_1.rewardNum)

	local var_2_2, var_2_3 = arg_2_0.view.widgets.title:getPosition()
	local var_2_4 = arg_2_0.view.widgets.title:getContentSize().width

	arg_2_0.view.widgets.rank:setPositionX(var_2_2 + var_2_4 - 20)

	local var_2_5, var_2_6 = arg_2_0.view.widgets.reward1_p1:getPosition()
	local var_2_7 = arg_2_0.view.widgets.reward1_p1:getContentSize().width
	local var_2_8 = arg_2_0.view.widgets.reward1_p2:getContentSize().width

	arg_2_0.view.widgets.reward1_p2:setPositionX(var_2_5 + var_2_7)
	arg_2_0.view.widgets.reward1_p3:setPositionX(var_2_5 + var_2_7 + var_2_8)

	local var_2_9 = arg_2_1.itemNum and arg_2_1.itemNum > 0

	arg_2_0.view.widgets.icon2:setVisible(var_2_9)
	arg_2_0.view.widgets.bg_icon2:setVisible(var_2_9)
	arg_2_0.view.widgets.reward2_p1:setVisible(var_2_9)
	arg_2_0.view.widgets.reward2_p2:setVisible(var_2_9)
	arg_2_0.view.widgets.reward2_p3:setVisible(var_2_9)

	if var_2_9 then
		arg_2_0.view.widgets.reward2_p3:setString(arg_2_1.itemNum)

		local var_2_10, var_2_11 = arg_2_0.view.widgets.reward2_p1:getPosition()
		local var_2_12 = arg_2_0.view.widgets.reward2_p1:getContentSize().width
		local var_2_13 = arg_2_0.view.widgets.reward2_p2:getContentSize().width

		arg_2_0.view.widgets.reward2_p2:setPositionX(var_2_10 + var_2_12)
		arg_2_0.view.widgets.reward2_p3:setPositionX(var_2_10 + var_2_12 + var_2_13)
	end

	arg_2_0.view.widgets.panel:setScale(0.1)

	local var_2_14 = CCArray:create()

	var_2_14:addObject(CCScaleTo:create(0.3, 1))
	var_2_14:addObject(CCDelayTime:create(3))
	var_2_14:addObject(CCCallFuncN:create(function()
		arg_2_0:removeFromParentAndCleanup(true)
	end))
	arg_2_0.view.widgets.panel:runAction(CCSequence:create(var_2_14))
end

function var_0_0.ctor(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.view = {}

	uiutil.initWidgets(arg_4_0.view, arg_4_0.layout)

	if arg_4_1 then
		arg_4_0:addChild(arg_4_0.view.widgets.panel)
		arg_4_1:addChild(arg_4_0)
	end

	arg_4_0:showPanel(arg_4_2)
end

return var_0_0
