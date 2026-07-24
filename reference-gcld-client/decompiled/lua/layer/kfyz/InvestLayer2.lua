local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = ccc3(0, 180, 0)
local var_0_2 = colorQuality[5]
local var_0_3 = colorQuality[4]
local var_0_4 = colorQuality[2]
local var_0_5 = class("kfyzInvestLayer", function()
	return createBaseLayer()
end)

var_0_5.layout = {
	y = 0,
	name = "root",
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
						path = "btn_close_c.png"
					}
				},
				{
					y = 290,
					name = "bg",
					type = "sprite9",
					x = 480,
					preferedSize = CCSizeMake(915, 532),
					middleRect = CCRectMake(10, 10, 70, 70),
					pic = {
						path = "res/ui/common/panel/comm_view.png"
					},
					children = {
						{
							y = 455,
							x = 458,
							type = "sprite",
							pic = {
								path = "res/ui/general/jailView/comm_list_laofang_3.png"
							}
						},
						{
							y = 480,
							x = 458,
							type = "sprite",
							pic = {
								path = "res/ui/nation/buildNation/dongying/jmdy_title.png"
							}
						},
						{
							y = 270,
							name = "map",
							type = "sprite",
							x = 180,
							pic = {
								path = "res/ui/nation/buildNation/dongying/yzdy_dymap_s.png"
							}
						},
						{
							y = 90,
							type = "sprite",
							x = 180,
							pic = {
								path = "res/ui/nationTask/newPic/rwyh_djs_bg.png"
							},
							children = {
								{
									fontSize = 22,
									name = "leftTime",
									y = 27,
									type = "label",
									x = 180,
									color = var_0_2
								}
							}
						},
						{
							fontSize = 20,
							y = 60,
							type = "label",
							x = 180,
							text = language.get(136315)
						},
						{
							y = 380,
							name = "icon1",
							type = "sprite",
							x = 390,
							pic = {
								path = "res/ui/nationTask/newPic/rwyh_icon01.png"
							},
							children = {
								{
									y = 70,
									name = "bg1",
									type = "sprite",
									x = 45,
									anchorPoint = ccp(0, 1),
									pic = {
										path = "res/ui/nationTask/newPic/rwyh_small_bg.png"
									}
								},
								{
									fontSize = 22,
									y = 38,
									type = "label",
									x = 75,
									textId = "222506_dongying",
									color = var_0_0,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							y = 280,
							name = "icon2",
							type = "sprite",
							x = 390,
							pic = {
								path = "res/ui/kfyz/invest/kfyz_icon01.png"
							},
							children = {
								{
									y = 70,
									name = "bg2",
									type = "sprite",
									x = 45,
									anchorPoint = ccp(0, 1),
									pic = {
										path = "res/ui/nationTask/newPic/rwyh_small_bg.png"
									}
								},
								{
									fontSize = 22,
									y = 38,
									type = "label",
									x = 75,
									textId = "222514_dongying",
									color = var_0_0,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							y = 180,
							name = "icon3",
							type = "sprite",
							x = 392.1428,
							pic = {
								path = "res/ui/nationTask/newPic/rwyh_icon03.png"
							},
							children = {
								{
									y = 70,
									name = "bg3",
									type = "sprite9",
									x = -15,
									preferedSize = CCSizeMake(590, 180),
									middleRect = CCRectMake(290, 50, 9, 112),
									anchorPoint = ccp(0, 1),
									pic = {
										path = "res/ui/nationTask/newPic/rwyh_jl_bg.png"
									}
								},
								{
									fontSize = 22,
									y = 38,
									type = "label",
									x = 75,
									textId = 330027,
									color = var_0_0,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							type = "node",
							name = "node_reward"
						}
					}
				}
			}
		}
	}
}
var_0_5.rewardItem = {
	name = "bg",
	type = "sprite",
	anchorPoint = ccp(0.5, 1),
	pic = {
		path = "res/ui/task/get_rewa_icon.jpg"
	},
	children = {
		{
			y = 42,
			name = "icon",
			type = "sprite",
			x = 35,
			pic = {
				path = "res/ui/task/bintie.png"
			}
		},
		{
			y = 22,
			name = "txt",
			type = "sprite",
			x = 35,
			pic = {
				path = "res/ui/task/get_rewa_iron.png"
			}
		},
		{
			fontSize = 23,
			name = "num",
			y = 0,
			type = "label",
			x = 35,
			anchorPoint = ccp(0.5, 1),
			color = var_0_0
		}
	}
}

function var_0_5.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.kfyzGetInvestInfo, user.kfRoadId)
end

function var_0_5.showPanel(arg_4_0, arg_4_1)
	arg_4_0.info = arg_4_1

	arg_4_0.view.widgets.leftTime:stopAllActions()

	if arg_4_1.leftTime > 0 then
		local var_4_0 = CCArray:create()

		var_4_0:addObject(CCCallFunc:create(function()
			if arg_4_1.leftTime <= 0 then
				arg_4_0:removeFromParentAndCleanup(true)
			else
				arg_4_0.view.widgets.leftTime:setString(language.get("222413_dongying") .. tool.getFormatTime(arg_4_1.leftTime))
			end
		end))
		var_4_0:addObject(CCDelayTime:create(1))

		local var_4_1 = CCSequence:create(var_4_0)

		arg_4_0.view.widgets.leftTime:runAction(CCRepeatForever:create(var_4_1))
	end

	arg_4_0.view.widgets.node_reward:removeAllChildrenWithCleanup(true)

	local var_4_2 = {
		[218] = "zctz",
		[10] = "exp",
		[4] = "iron",
		[17] = "gem",
		[13] = "gongxun"
	}

	local function var_4_3(arg_6_0, arg_6_1)
		return arg_6_0.targetForceId < arg_6_1.targetForceId
	end

	table.sort(arg_4_1.rewards, var_4_3)

	local var_4_4 = 1

	for iter_4_0, iter_4_1 in ipairs(arg_4_1.rewards) do
		if iter_4_1.targetForceId == 1001 then
			local var_4_5 = 160 - 95 * (var_4_4 - 1)

			for iter_4_2, iter_4_3 in ipairs(iter_4_1.subRewards) do
				if iter_4_3.type == 119 then
					local var_4_6 = 590 + 100 * (iter_4_2 - 1)
					local var_4_7 = {}

					uiutil.initWidgets(var_4_7, arg_4_0.rewardItem)
					var_4_7.widgets.bg:setPosition(ccp(var_4_6, var_4_5))
					arg_4_0.view.widgets.node_reward:addChild(var_4_7.widgets.bg)
					log.info("@@", iter_4_3.type)

					local var_4_8 = string.format("res/ui/task/get_icon_%s.png", var_4_2[iter_4_3.type])
					local var_4_9 = string.format("res/ui/task/get_rewa_%s.png", var_4_2[iter_4_3.type])

					if iter_4_3.type == 119 then
						var_4_8 = "res/ui/resource/blacksmith/new/res_icon_bailg.png"
					end

					var_4_7.widgets.icon:setDisplayFrame(CCSprite:create(var_4_8):displayFrame())
					var_4_7.widgets.txt:setDisplayFrame(CCSprite:create(var_4_9):displayFrame())
					var_4_7.widgets.num:setString(tool.getFormatNum(iter_4_3.value))
				end
			end
		end
	end
end

function var_0_5.ctor(arg_7_0, arg_7_1, arg_7_2)
	log.info("@@ 剿灭东瀛")

	arg_7_0.view = {}

	uiutil.initWidgets(arg_7_0.view, arg_7_0.layout)
	swallowTouch(arg_7_0)

	if arg_7_1 then
		arg_7_0:addChild(arg_7_0.view.widgets.root)
		arg_7_1:addChild(arg_7_0)
	end

	arg_7_0.view.widgets.btn_close:addHandleOfControlEvent(function()
		arg_7_0:removeFromParentAndCleanup(true)
	end, CCControlEventTouchUpInside)

	if arg_7_2 then
		arg_7_0:showPanel(arg_7_2)
	else
		arg_7_0:refresh()
	end
end

function var_0_5.onEnter(arg_9_0)
	arg_9_0.updateRef = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_9_0, arg_9_0.update), 0.5, false)
end

function var_0_5.onExit(arg_10_0)
	if arg_10_0.updateRef then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_10_0.updateRef)
	end
end

function var_0_5.update(arg_11_0, arg_11_1)
	if arg_11_0.info then
		if arg_11_0.info.leftTime and arg_11_0.info.leftTime > 0 then
			arg_11_0.info.leftTime = arg_11_0.info.leftTime - 1000 * arg_11_1
		else
			arg_11_0.info.leftTime = 0
		end
	end
end

return var_0_5
