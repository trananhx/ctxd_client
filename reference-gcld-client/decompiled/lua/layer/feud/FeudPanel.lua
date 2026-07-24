local var_0_0 = colorQuality[5]
local var_0_1 = colorQuality[0]
local var_0_2 = class("FeudPanel", function()
	return createBaseLayer()
end)

var_0_2.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			name = "panel",
			type = "sprite9",
			preferedSize = CCSizeMake(960, 580),
			middleRect = CCRectMake(40, 40, 25, 25),
			x = visibleSize.width / 2,
			y = visibleSize.height / 2 - 30,
			pic = {
				frame = true,
				path = "bigPanel.png"
			},
			children = {
				{
					y = 290,
					name = "bg",
					type = "sprite",
					x = 480,
					pic = {
						path = "res/ui/outputMode/profit_view_bg.jpg"
					},
					children = {
						{
							y = 180,
							x = 457.5,
							type = "sprite",
							pic = {
								path = "res/ui/saotao/tsfx_bg.jpg"
							}
						},
						{
							y = 376,
							x = 457.5,
							type = "sprite",
							pic = {
								path = "res/ui/saotao/stfx_long_bg.png"
							}
						},
						{
							y = 490,
							x = 458,
							type = "sprite",
							pic = {
								path = "res/ui/world/feud/fdnz_title.png"
							}
						},
						{
							name = "btn_pre",
							h = 91,
							type = "button",
							w = 94,
							y = 379.9998,
							x = 70,
							normal = {
								path = "res/ui/saotao/stfx_btn_arrows.png"
							},
							touched = {
								path = "res/ui/saotao/stfx_btn_arrows_c.png"
							},
							disable = {
								path = "res/ui/saotao/stfx_btn_arrows_g.png"
							}
						},
						{
							name = "btn_next",
							h = 91,
							type = "button",
							w = 94,
							y = 380,
							x = 845,
							normal = {
								path = "res/ui/saotao/stfx_btn_arrows.png"
							},
							touched = {
								path = "res/ui/saotao/stfx_btn_arrows_c.png"
							},
							disable = {
								path = "res/ui/saotao/stfx_btn_arrows_g.png"
							}
						},
						{
							y = 265,
							type = "sprite",
							x = 458,
							pic = {
								path = "res/ui/saotao/stfx_word_bg.png"
							},
							children = {
								{
									fontSize = 25,
									name = "name",
									y = 40,
									type = "label",
									x = 223
								}
							}
						},
						{
							y = 181,
							type = "sprite",
							x = 790,
							pic = {
								path = "res/ui/world/feud/zzyg_zb_d.png"
							},
							children = {
								{
									y = 35,
									type = "sprite",
									x = 120,
									pic = {
										path = "res/ui/activity/fishing/hjcd_time_pb_line.png"
									},
									children = {
										{
											y = 11.5,
											name = "bar",
											type = "progressbar",
											x = 111.5,
											pic = {
												path = "res/ui/activity/fishing/hjcd_time_pb.png"
											}
										},
										{
											fontSize = 20,
											name = "time",
											y = 11.5,
											type = "label",
											x = 111.5
										}
									}
								},
								{
									x = 120,
									name = "type",
									y = 230,
									type = "sprite",
									scale = 1.2
								},
								{
									y = 140,
									type = "sprite",
									x = 120,
									pic = {
										path = "res/ui/weapon/baowu_di.png"
									},
									children = {
										{
											y = 40,
											name = "icon_reward",
											x = 40,
											type = "sprite"
										},
										{
											fontSize = 20,
											name = "state",
											y = 0,
											type = "label",
											x = 40,
											anchorPoint = ccp(0.5, 1)
										}
									}
								}
							}
						},
						{
							fontSize = 20,
							name = "leftTimesLb",
							type = "label",
							y = 78,
							x = 15,
							halign = kCCTextAlignmentLeft,
							anchorPoint = ccp(0, 1)
						},
						{
							name = "btn_check",
							h = 60,
							type = "button",
							w = 190,
							y = 75,
							x = 458,
							normal = {
								path = "res/ui/common/button/public_btn_green.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_green_c.png"
							},
							children = {
								{
									fontSize = 25,
									y = 33,
									type = "label",
									x = 95,
									textId = 121085
								}
							}
						},
						{
							y = 170,
							name = "icon_city",
							type = "sprite",
							x = 458,
							pic = {
								frame = true,
								path = "worldBuildingXiepo2.png"
							}
						},
						{
							y = 330,
							x = 458,
							type = "sprite",
							scale = 0.5,
							pic = {
								path = "res/ui/saotao/stfx_word_bg.png"
							}
						},
						{
							fontSize = 20,
							name = "page",
							y = 332,
							type = "label",
							x = 458
						},
						{
							y = 380,
							type = "sprite",
							x = 180,
							pic = {
								path = "res/ui/saotao/stfx_por_view.png"
							},
							children = {
								{
									y = 50,
									name = "icon_head",
									type = "sprite",
									x = 50,
									pic = {
										path = "res/ui/common/playerHead/playerHead_icon_0.png"
									}
								}
							}
						},
						{
							fontSize = 20,
							name = "info",
							type = "label",
							y = 430,
							x = 240,
							halign = kCCTextAlignmentLeft,
							anchorPoint = ccp(0, 1)
						}
					}
				},
				{
					x = 922,
					name = "btn_close",
					h = 33,
					type = "button",
					w = 32,
					y = 602,
					scale = 2,
					normal = {
						frame = true,
						path = "btn_close_a.png"
					},
					touched = {
						frame = true,
						path = "btn_close_click.png"
					}
				}
			}
		}
	}
}

function var_0_2.showPanel(arg_2_0, arg_2_1)
	arg_2_0.info = arg_2_1

	arg_2_0.view.widgets.btn_pre:setEnabled(arg_2_0.idx ~= 1)
	arg_2_0.view.widgets.btn_next:setEnabled(arg_2_0.idx ~= #arg_2_0.citys)
	arg_2_0.view.widgets.icon_head:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerHead/playerHead_icon_%s.png", user.player.pic)):displayFrame())
	arg_2_0.view.widgets.page:setString(language.get(390478, arg_2_0.idx, #arg_2_0.citys))

	local var_2_0 = worldConstant.BUILDING_INFO["world_building_" .. arg_2_1.cityId].name

	arg_2_0.view.widgets.info:setString(language.get(121068, var_2_0))
	arg_2_0.view.widgets.name:setString(language.get(121067, var_2_0))

	local var_2_1 = {
		{
			pic = "res/ui/task/get_icon_food.png",
			txt = "res/ui/world/feud/sbxt_btn_word_nl.png"
		},
		{
			pic = "res/ui/world/feud/sbxt_btn_hy.png",
			txt = "res/ui/world/feud/sbxt_btn_word_zb.png"
		},
		{
			pic = "res/ui/world/feud/sbxt_btn_zs.png",
			txt = "res/ui/world/feud/sbxt_btn_word_zs.png"
		},
		{
			pic = "res/ui/world/feud/sbxt_btn_nj.png",
			txt = "res/ui/world/feud/sbxt_btn_word_nj.png"
		},
		[1001] = {
			frame = true,
			txt = "res/ui/world/feud/sbxt_btn_word_zz.png",
			pic = "jinsha.jpg"
		},
		[1002] = {
			frame = true,
			txt = "res/ui/world/feud/sbxt_btn_word_zz.png",
			pic = "dalishi.jpg"
		},
		[1003] = {
			frame = true,
			txt = "res/ui/world/feud/sbxt_btn_word_zz.png",
			pic = "suitongkuai.jpg"
		},
		[1004] = {
			frame = true,
			txt = "res/ui/world/feud/sbxt_btn_word_zz.png",
			pic = "suigangkuai.jpg"
		},
		[1005] = {
			frame = true,
			txt = "res/ui/world/feud/sbxt_btn_word_zz.png",
			pic = "liuli.jpg"
		},
		[1006] = {
			frame = true,
			txt = "res/ui/world/feud/sbxt_btn_word_zz.png",
			pic = "chitongkuai.jpg"
		},
		[1007] = {
			frame = true,
			txt = "res/ui/world/feud/sbxt_btn_word_zz.png",
			pic = "shiying.jpg"
		},
		[1008] = {
			frame = true,
			txt = "res/ui/world/feud/sbxt_btn_word_zz.png",
			pic = "guijia.jpg"
		},
		[1009] = {
			frame = true,
			txt = "res/ui/world/feud/sbxt_btn_word_zz.png",
			pic = "jingangshifen.jpg"
		},
		[1010] = {
			frame = true,
			txt = "res/ui/world/feud/sbxt_btn_word_zz.png",
			pic = "wujinsha.jpg"
		},
		[1011] = {
			frame = true,
			txt = "res/ui/world/feud/sbxt_btn_word_zz.png",
			pic = "suiyinkuai.jpg"
		},
		[1012] = {
			frame = true,
			txt = "res/ui/world/feud/sbxt_btn_word_zz.png",
			pic = "shuijingyuanshi.jpg"
		},
		[1013] = {
			frame = true,
			txt = "res/ui/world/feud/sbxt_btn_word_zz.png",
			pic = "gangyu.jpg"
		},
		[1014] = {
			frame = true,
			txt = "res/ui/world/feud/sbxt_btn_word_zz.png",
			pic = "chuanshanjialin.jpg"
		},
		[1015] = {
			frame = true,
			txt = "res/ui/world/feud/sbxt_btn_word_zz.png",
			pic = "zhenzhufen.jpg"
		},
		[2001] = {
			pic = "res/ui/world/speicalCity/tscc_hy_tj.png",
			txt = "res/ui/world/feud/sbxt_btn_word_zb.png"
		},
		[2002] = {
			pic = "res/ui/world/speicalCity/tscc_hy_xz.png",
			txt = "res/ui/world/feud/sbxt_btn_word_zb.png"
		},
		[2003] = {
			pic = "res/ui/world/speicalCity/tscc_hy_hb.png",
			txt = "res/ui/world/feud/sbxt_btn_word_zb.png"
		},
		[2004] = {
			pic = "res/ui/world/speicalCity/tscc_hy_jl.png",
			txt = "res/ui/world/feud/sbxt_btn_word_zb.png"
		}
	}
	local var_2_2 = var_2_1[arg_2_1.type] or var_2_1[1]

	arg_2_0.view.widgets.type:setDisplayFrame(CCSprite:create(var_2_2.txt):displayFrame())

	if var_2_2.frame then
		arg_2_0.view.widgets.icon_reward:setDisplayFrame(CCSprite:createWithSpriteFrameName(var_2_2.pic):displayFrame())
	else
		arg_2_0.view.widgets.icon_reward:setDisplayFrame(CCSprite:create(var_2_2.pic):displayFrame())
	end

	local var_2_3

	if arg_2_1.canGetRewardNum > 0 then
		var_2_3 = language.get(135039, arg_2_1.canGetRewardNum * arg_2_1.rewardsT[1].num)
	else
		var_2_3 = language.get(121065)
	end

	arg_2_0.view.widgets.state:setString(var_2_3)
	arg_2_0.view.widgets.time:stopAllActions()

	if arg_2_1.state == 2 then
		local var_2_4 = CCArray:create()

		var_2_4:addObject(CCCallFunc:create(function()
			arg_2_0.view.widgets.time:setString(tool.getFormatTime(arg_2_1.leftTime))

			local var_3_0 = 100 * (arg_2_1.maxTimes * 60 - arg_2_1.leftTime / 1000) / (arg_2_1.maxTimes * 60)

			arg_2_0.view.widgets.bar:setPercentage(var_3_0)
		end))
		var_2_4:addObject(CCDelayTime:create(1))

		local var_2_5 = CCSequence:create(var_2_4)

		arg_2_0.view.widgets.time:runAction(CCRepeatForever:create(var_2_5))
	end

	if arg_2_1.state == 3 then
		arg_2_0.view.widgets.time:setString(language.get(121069))
		arg_2_0.view.widgets.bar:setPercentage(100)
	end
end

function var_0_2.ctor(arg_4_0, arg_4_1, arg_4_2)
	log.info("@@ 封地内政")

	arg_4_0.view = {}

	uiutil.initWidgets(arg_4_0.view, arg_4_0.layout)
	arg_4_0:addChild(arg_4_0.view.widgets.root)
	swallowTouch(arg_4_0)
	arg_4_0.view.widgets.btn_pre:setScaleX(-1)

	local var_4_0 = ""

	if user.leftFeudTimes then
		local var_4_1 = language.get(213407, user.leftFeudTimes)

		arg_4_0.view.widgets.leftTimesLb:setString(var_4_1)
	end

	arg_4_0.view.widgets.btn_pre:addHandleOfControlEvent(function()
		log.info("btn_pre")

		arg_4_0.idx = arg_4_0.idx - 1

		arg_4_0:showPanel(user.feudCities[arg_4_0.citys[arg_4_0.idx]])
	end, CCControlEventTouchUpInside)
	arg_4_0.view.widgets.btn_next:addHandleOfControlEvent(function()
		log.info("btn_next")

		arg_4_0.idx = arg_4_0.idx + 1

		arg_4_0:showPanel(user.feudCities[arg_4_0.citys[arg_4_0.idx]])
	end, CCControlEventTouchUpInside)
	arg_4_0.view.widgets.btn_check:addHandleOfControlEvent(function()
		log.info("btn_check")
		arg_4_0:removeFromParentAndCleanup(true)
		loadingLayer.show(SCENE_WORLD, arg_4_0.info.cityId)
	end, CCControlEventTouchUpInside)
	arg_4_0.view.widgets.btn_close:addHandleOfControlEvent(function()
		log.info("btn_close")
		arg_4_0:removeFromParentAndCleanup(true)
	end, CCControlEventTouchUpInside)

	arg_4_0.citys = {}

	for iter_4_0, iter_4_1 in pairs(user.feudCities) do
		table.insert(arg_4_0.citys, iter_4_0)
	end

	arg_4_0.idx = 1

	arg_4_0:showPanel(user.feudCities[arg_4_0.citys[arg_4_0.idx]])
end

local function var_0_3()
	local var_9_0 = ""

	if user.leftFeudTimes and self.view.widgets and self.view.widgets.leftTimesLb then
		local var_9_1 = language.get(213407, user.leftFeudTimes)

		self.view.widgets.leftTimesLb:setString(var_9_1)
	end
end

function var_0_2.onEnter()
	eventManager.registerEvent("leftFeudTimes", var_0_3)
end

function var_0_2.onExit()
	eventManager.unregisterEvent("leftFeudTimes", var_0_3)
end

return var_0_2
