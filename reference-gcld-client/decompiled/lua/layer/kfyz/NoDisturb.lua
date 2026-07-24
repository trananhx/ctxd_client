local var_0_0 = {
	[3] = {
		txt = "res/ui/task/get_rewa_food.png",
		pic = "res/ui/task/liangshi.png",
		type = 3
	},
	[42] = {
		txt = "res/ui/task/get_rewa_mubingling.png",
		pic = "res/ui/task/get_icon_mubingling.png",
		type = 5
	}
}
local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = ccc3(0, 180, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = class("NoDisturb", function()
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
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 - 30,
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
						path = "res/ui/kfyz/noDisturb/yzmz_title.png"
					}
				},
				{
					x = 50,
					name = "pic",
					y = 120,
					type = "sprite",
					scale = 0.8,
					anchorPoint = ccp(0, 0),
					pic = {
						path = "res/ui/common/playerPic/player1.png"
					}
				},
				{
					y = 430,
					name = "bg_info1",
					type = "sprite9",
					x = 600,
					preferedSize = CCSizeMake(800, 70),
					middleRect = CCRectMake(200, 60, 189, 102),
					pic = {
						path = "res/ui/nationTask/newPic/rwyh_jl_bg.png"
					},
					children = {
						{
							fontSize = 22,
							height = 0,
							name = "info1",
							type = "label",
							x = 400,
							y = 37,
							style = "label_warlock",
							width = 600,
							halign = kCCTextAlignmentLeft,
							color = var_0_1
						}
					}
				},
				{
					y = 320,
					name = "pic_txt1",
					type = "sprite",
					x = 650,
					pic = {
						path = "res/ui/kfyz/noDisturb/yzmz_word_01.png"
					}
				},
				{
					y = 385,
					name = "pic_txt2",
					type = "sprite",
					x = 800,
					pic = {
						path = "res/ui/kfyz/noDisturb/yzmz_word_03.png"
					}
				},
				{
					name = "btn_reward",
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
							textId = 92013,
							color = var_0_1
						}
					}
				},
				{
					y = 145,
					name = "bg_info2",
					type = "sprite",
					x = 210,
					pic = {
						path = "res/ui/activity/fishing/hjcd_time_line.png"
					},
					children = {
						{
							fontSize = 25,
							name = "info2",
							style = "label_warlock",
							type = "label",
							y = 29,
							x = 165
						}
					}
				}
			}
		}
	}
}
var_0_6.layout_reward = {
	y = 190,
	name = "bg",
	type = "sprite",
	x = 650,
	pic = {
		path = "res/ui/task/get_rewa_icon.jpg"
	},
	children = {
		{
			y = 40,
			name = "icon",
			type = "sprite",
			x = 35,
			pic = {
				path = "res/ui/task/liangshi.png"
			}
		},
		{
			y = 15,
			name = "txt",
			type = "sprite",
			x = 35,
			pic = {
				path = "res/ui/task/get_rewa_food.png"
			}
		},
		{
			fontSize = 20,
			name = "num",
			style = "label_warlock",
			type = "label",
			y = 0,
			x = 35,
			anchorPoint = ccp(0.5, 1)
		},
		{
			type = "sprite",
			name = "rewarded",
			x = 35,
			visible = false,
			y = 35,
			scale = 0.8,
			pic = {
				path = "res/ui/kfyz/wait/kfyz_seal_get.png"
			}
		}
	}
}

function var_0_6.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.kfyzGetDisturbInfo)
end

function var_0_6.onGetReward(arg_4_0)
	local function var_4_0(arg_5_0)
		local var_5_0 = {}

		for iter_5_0, iter_5_1 in ipairs(arg_5_0.action.data.rewards) do
			local var_5_1 = {
				id = var_0_0[iter_5_1.type].type,
				value = iter_5_1.num
			}

			table.insert(var_5_0, var_5_1)
		end

		globalAction_gotResource(var_5_0)

		arg_4_0.info.rewarded = 1

		arg_4_0:showPanel(arg_4_0.info)
	end

	cmgr.sendRequest(var_4_0, actions.kfyzGetDisturbRewards)
end

function var_0_6.showPanel(arg_6_0, arg_6_1)
	arg_6_0.info = arg_6_1

	local var_6_0 = arg_6_1.rewarded == 1

	for iter_6_0, iter_6_1 in ipairs(arg_6_1.rewards) do
		arg_6_0.view.widgets["rewarded" .. iter_6_0]:setVisible(var_6_0)
	end

	arg_6_0.view.widgets.btn_reward:setVisible(not var_6_0)
end

function var_0_6.ctor(arg_7_0, arg_7_1, arg_7_2)
	log.info("@@ 远征免战")

	arg_7_0.view = {}

	uiutil.initWidgets(arg_7_0.view, arg_7_0.layout)
	swallowTouch(arg_7_0)

	if arg_7_1 then
		arg_7_0:addChild(arg_7_0.view.widgets.Scene)
		arg_7_1:addChild(arg_7_0)
	end

	arg_7_0.view.widgets.pic:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerPic/player%d.png", arg_7_2.kingPic)):displayFrame())

	local var_7_0 = user.forceIdToName[arg_7_2.nation]

	arg_7_0.view.widgets.info1:setString(language.get(390568, var_7_0, 1 + arg_7_2.startMonth, arg_7_2.startDay, 1 + arg_7_2.endMonth, arg_7_2.endDay))
	arg_7_0.view.widgets.info2:setString(string.format("%s.%s", var_7_0, arg_7_2.kingName))
	arg_7_0.view.widgets.info2:setColor(colorForce[arg_7_2.nation])

	local var_7_1 = arg_7_2.nation == user.player.forceId and "yzmz_word_01.png" or "yzmz_word_02.png"
	local var_7_2 = arg_7_2.kbLv == 0 and "yzmz_word_03.png" or "yzmz_word_04.png"

	arg_7_0.view.widgets.pic_txt1:setDisplayFrame(CCSprite:create("res/ui/kfyz/noDisturb/" .. var_7_1):displayFrame())
	arg_7_0.view.widgets.pic_txt2:setDisplayFrame(CCSprite:create("res/ui/kfyz/noDisturb/" .. var_7_2):displayFrame())

	for iter_7_0, iter_7_1 in ipairs(arg_7_2.rewards) do
		local var_7_3 = var_0_0[iter_7_1.type]
		local var_7_4 = {}

		uiutil.initWidgets(var_7_4, arg_7_0.layout_reward)
		var_7_4.widgets.bg:setPosition(450 + iter_7_0 * 100, 190)
		arg_7_0.view.widgets.panel:addChild(var_7_4.widgets.bg)
		var_7_4.widgets.icon:setDisplayFrame(CCSprite:create(var_7_3.pic):displayFrame())
		var_7_4.widgets.txt:setDisplayFrame(CCSprite:create(var_7_3.txt):displayFrame())
		var_7_4.widgets.num:setString(tool.getFormatNum(iter_7_1.num))

		arg_7_0.view.widgets["rewarded" .. iter_7_0] = var_7_4.widgets.rewarded
	end

	arg_7_0.view.widgets.btn_close:addHandleOfControlEvent(function()
		log.info("btn_close")
		arg_7_0:removeFromParentAndCleanup(true)
	end, CCControlEventTouchUpInside)
	arg_7_0.view.widgets.btn_reward:addHandleOfControlEvent(function()
		log.info("btn_reward")
		arg_7_0:onGetReward()
	end, CCControlEventTouchUpInside)
	arg_7_0:showPanel(arg_7_2)
end

return var_0_6
