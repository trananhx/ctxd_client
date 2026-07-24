local var_0_0 = require("res/native/offset").get("layer.kfyz.indivTask")
local var_0_1 = {
	silk = 55,
	iron = 4,
	gongxun = 10001,
	sichou = 55,
	exp = 6,
	feat = 10001,
	gem = 7
}
local var_0_2 = {
	nil,
	"yzzl_word_zc.png",
	"yzzl_word_dt.png",
	"yzzl_word_jb.png"
}
local var_0_3 = tool.hexToRgb("#ECDEA7")
local var_0_4 = ccc3(0, 180, 0)
local var_0_5 = tool.hexToRgb("#781F00")
local var_0_6 = colorQuality[4]
local var_0_7 = colorQuality[2]
local var_0_8 = class("kfyzIndivTaskLayer", function()
	return createBaseLayer()
end)

var_0_8.layout = {
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
			w = 32,
			name = "btn_close",
			h = 33,
			type = "button",
			y = 604,
			x = 924,
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
			type = "sprite",
			x = 480,
			pic = {
				path = "res/ui/activity/betray/zyzh_bg.jpg"
			},
			children = {
				{
					w = 146,
					name = "btn_node1",
					h = 142,
					type = "button",
					y = 330,
					x = 76,
					normal = {
						path = "res/ui/kfyz/zhaoling/yzzl_btn_bg.png"
					},
					touched = {
						path = "res/ui/kfyz/zhaoling/yzzl_btn_bg_c.png"
					}
				},
				{
					w = 146,
					name = "btn_node2",
					h = 142,
					type = "button",
					y = 200,
					x = 76,
					normal = {
						path = "res/ui/kfyz/zhaoling/yzzl_btn_bg.png"
					},
					touched = {
						path = "res/ui/kfyz/zhaoling/yzzl_btn_bg_c.png"
					}
				},
				{
					y = 320,
					x = 76,
					type = "sprite",
					pic = {
						path = "res/ui/kfyz/zhaoling/yzzl_btn_sd.png"
					}
				},
				{
					y = 190,
					x = 76,
					type = "sprite",
					pic = {
						path = "res/ui/kfyz/zhaoling/yzzl_btn_zz.png"
					}
				},
				{
					type = "sprite",
					name = "btn_finish1",
					x = 76,
					visible = false,
					y = 330,
					scale = 0.7,
					pic = {
						path = "res/ui/task/finish.png"
					}
				},
				{
					type = "sprite",
					name = "btn_finish2",
					x = 76,
					visible = false,
					y = 200,
					scale = 0.7,
					pic = {
						path = "res/ui/task/finish.png"
					}
				},
				{
					y = 477,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/kfyz/zhaoling/yzzl_title.png"
					}
				},
				{
					y = 262.4279,
					x = 512.2846,
					type = "sprite",
					pic = {
						path = "res/ui/kfyz/zhaoling/yzzl_scroll_bg.png"
					}
				},
				{
					y = 0,
					name = "node1",
					visible = false,
					type = "node",
					x = 0,
					children = {
						{
							y = 330,
							name = "bg_info1",
							type = "sprite",
							x = 230,
							pic = {
								path = "res/ui/kfyz/zhaoling/yzzl_ink_bg1.png"
							}
						},
						{
							y = 260,
							name = "bg_info2",
							type = "sprite",
							x = 230,
							pic = {
								path = "res/ui/kfyz/zhaoling/yzzl_ink_bg1.png"
							}
						},
						{
							name = "btn_reward1",
							h = 56,
							type = "button",
							w = 189,
							y = 180,
							x = 770,
							normal = {
								path = "res/ui/common/button/sdyjs_btn_03.png"
							},
							touched = {
								path = "res/ui/common/button/sdyjs_btn_03_c.png"
							},
							disable = {
								path = "res/ui/common/button/sdyjs_btn_03_g.png"
							},
							children = {
								{
									fontSize = 25,
									style = "label_warlock",
									y = 33,
									type = "label",
									x = 92,
									textId = 92013,
									color = var_0_3
								}
							}
						},
						{
							w = 195,
							name = "btn_speed",
							h = 62,
							type = "button",
							y = 320,
							x = 780,
							normal = {
								path = "res/ui/common/button/public_btn_green.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_green_c.png"
							}
						},
						{
							y = 330,
							type = "label",
							x = 220,
							textId = 390455,
							fontSize = 30 + (var_0_0.goalRewardLabelSize or 0),
							color = var_0_3
						},
						{
							y = 260,
							type = "label",
							x = 220,
							textId = 390456,
							fontSize = 30 + (var_0_0.goalRewardLabelSize or 0),
							color = var_0_3
						},
						{
							fontSize = 20,
							style = "label_warlock",
							y = 322,
							type = "label",
							x = 780,
							textId = 390454,
							color = var_0_3
						},
						{
							y = 180,
							name = "icon1",
							type = "sprite",
							x = 210,
							pic = {
								path = "res/ui/kfyz/zhaoling/yzzl_icon_zl2.png"
							}
						},
						{
							y = 180,
							name = "icon2",
							type = "sprite",
							x = 300,
							pic = {
								path = "res/ui/kfyz/zhaoling/yzzl_icon_zl2.png"
							}
						},
						{
							y = 180,
							name = "icon3",
							type = "sprite",
							x = 390,
							pic = {
								path = "res/ui/kfyz/zhaoling/yzzl_icon_zl2.png"
							}
						},
						{
							y = 180,
							name = "icon4",
							type = "sprite",
							x = 480,
							pic = {
								path = "res/ui/kfyz/zhaoling/yzzl_icon_zl2.png"
							}
						},
						{
							y = 180,
							name = "icon5",
							type = "sprite",
							x = 570,
							pic = {
								path = "res/ui/kfyz/zhaoling/yzzl_icon_zl2.png"
							}
						},
						{
							y = 180,
							name = "mask1",
							visible = false,
							type = "sprite",
							x = 210,
							pic = {
								path = "res/ui/kfyz/zhaoling/yzzl_samll_seal.png"
							}
						},
						{
							y = 180,
							name = "mask2",
							visible = false,
							type = "sprite",
							x = 300,
							pic = {
								path = "res/ui/kfyz/zhaoling/yzzl_samll_seal.png"
							}
						},
						{
							y = 180,
							name = "mask3",
							visible = false,
							type = "sprite",
							x = 390,
							pic = {
								path = "res/ui/kfyz/zhaoling/yzzl_samll_seal.png"
							}
						},
						{
							y = 180,
							name = "mask4",
							visible = false,
							type = "sprite",
							x = 480,
							pic = {
								path = "res/ui/kfyz/zhaoling/yzzl_samll_seal.png"
							}
						},
						{
							y = 180,
							name = "mask5",
							visible = false,
							type = "sprite",
							x = 570,
							pic = {
								path = "res/ui/kfyz/zhaoling/yzzl_samll_seal.png"
							}
						},
						{
							y = 260,
							name = "icon_reward1",
							type = "sprite",
							x = 330,
							pic = {
								path = "res/ui/task/get_icon_gem.png"
							}
						},
						{
							y = 260,
							name = "icon_reward1_extra",
							type = "sprite",
							x = 425,
							pic = {
								path = "res/ui/task/get_icon_gem.png"
							}
						},
						{
							name = "lbl_cond1",
							x = 310,
							type = "label",
							height = 0,
							y = 330,
							width = 380,
							fontSize = 30 + (var_0_0.condLabelSize or 0),
							anchorPoint = ccp(0, 0.5),
							color = var_0_5,
							halign = kCCTextAlignmentLeft
						},
						{
							fontSize = 30,
							name = "lbl_reward1",
							y = 260,
							type = "label",
							x = 355,
							anchorPoint = ccp(0, 0.5),
							color = var_0_5
						},
						{
							fontSize = 30,
							name = "lbl_reward1_extra",
							y = 260,
							type = "label",
							x = 450,
							anchorPoint = ccp(0, 0.5),
							color = var_0_5
						},
						{
							type = "sprite",
							name = "finish1",
							y = 280,
							visible = false,
							x = 600,
							pic = {
								path = "res/ui/task/finish.png"
							}
						}
					}
				},
				{
					y = 0,
					name = "node2",
					visible = false,
					type = "node",
					x = 0,
					children = {
						{
							y = 230,
							x = 390,
							type = "sprite",
							pic = {
								path = "res/ui/kfyz/zhaoling/yzzl_red_line2.png"
							}
						},
						{
							y = 230,
							x = 630,
							type = "sprite",
							pic = {
								path = "res/ui/kfyz/zhaoling/yzzl_red_line2.png"
							}
						},
						{
							y = 180,
							x = 270,
							type = "node",
							children = {
								{
									name = "btn_reward2",
									h = 56,
									type = "button",
									w = 189,
									y = 0,
									x = 0,
									normal = {
										path = "res/ui/common/button/sdyjs_btn_03.png"
									},
									touched = {
										path = "res/ui/common/button/sdyjs_btn_03_c.png"
									},
									disable = {
										path = "res/ui/common/button/sdyjs_btn_03_g.png"
									},
									children = {
										{
											fontSize = 25,
											style = "label_warlock",
											y = 33,
											type = "label",
											x = 92,
											textId = 92013,
											color = var_0_3
										}
									}
								},
								{
									y = 140,
									x = 10,
									type = "sprite",
									pic = {
										path = "res/ui/kfyz/zhaoling/yzzl_ink_bg1.png"
									}
								},
								{
									y = 70,
									x = 10,
									type = "sprite",
									pic = {
										path = "res/ui/kfyz/zhaoling/yzzl_ink_bg1.png"
									}
								},
								{
									y = 140,
									name = "icon1_1",
									scale = 0.8,
									type = "sprite",
									x = -70,
									pic = {
										path = "res/ui/task/nation_task.png"
									}
								},
								{
									y = 70,
									name = "icon1_2",
									type = "sprite",
									x = -70,
									pic = {
										path = "res/ui/kfyz/zhaoling/yzzl_word_j.png"
									},
									scale = var_0_0.zhengZhanRewardNodeScale or 1
								},
								{
									y = 70,
									name = "icon_reward2",
									type = "sprite",
									x = -20,
									pic = {
										path = "res/ui/task/get_icon_exp.png"
									},
									scale = var_0_0.zhengZhanRewardNodeScale or 1
								},
								{
									y = 140,
									name = "indivType2",
									type = "sprite",
									x = -20,
									pic = {
										path = "res/ui/kfyz/zhaoling/yzzl_word_zc.png"
									}
								},
								{
									name = "lbl_cond2",
									y = 140,
									type = "label",
									x = 15,
									fontSize = 30 + (var_0_0.condLabelSize or 0),
									anchorPoint = ccp(0, 0.5),
									color = var_0_6,
									scale = var_0_0.zhengZhanRewardNodeScale or 1
								},
								{
									fontSize = 30,
									name = "lbl_reward2",
									y = 70,
									type = "label",
									x = 15,
									anchorPoint = ccp(0, 0.5),
									color = var_0_6,
									scale = var_0_0.zhengZhanRewardNodeScale or 1
								},
								{
									type = "sprite",
									name = "finish2",
									y = 110,
									visible = false,
									x = 0,
									pic = {
										path = "res/ui/task/finish.png"
									}
								}
							}
						},
						{
							y = 180,
							x = 510,
							type = "node",
							children = {
								{
									name = "btn_reward3",
									h = 56,
									type = "button",
									w = 189,
									y = 0,
									x = 0,
									normal = {
										path = "res/ui/common/button/sdyjs_btn_03.png"
									},
									touched = {
										path = "res/ui/common/button/sdyjs_btn_03_c.png"
									},
									disable = {
										path = "res/ui/common/button/sdyjs_btn_03_g.png"
									},
									children = {
										{
											fontSize = 25,
											style = "label_warlock",
											y = 33,
											type = "label",
											x = 92,
											textId = 92013,
											color = var_0_3
										}
									}
								},
								{
									y = 140,
									x = 10,
									type = "sprite",
									pic = {
										path = "res/ui/kfyz/zhaoling/yzzl_ink_bg1.png"
									}
								},
								{
									y = 70,
									x = 10,
									type = "sprite",
									pic = {
										path = "res/ui/kfyz/zhaoling/yzzl_ink_bg1.png"
									}
								},
								{
									y = 140,
									name = "icon2_1",
									scale = 0.8,
									type = "sprite",
									x = -70,
									pic = {
										path = "res/ui/task/nation_task.png"
									}
								},
								{
									y = 70,
									name = "icon2_2",
									type = "sprite",
									x = -70,
									pic = {
										path = "res/ui/kfyz/zhaoling/yzzl_word_j.png"
									},
									scale = var_0_0.zhengZhanRewardNodeScale or 1
								},
								{
									y = 70,
									name = "icon_reward3",
									type = "sprite",
									x = -20,
									pic = {
										path = "res/ui/task/get_icon_exp.png"
									},
									scale = var_0_0.zhengZhanRewardNodeScale or 1
								},
								{
									y = 140,
									name = "indivType3",
									type = "sprite",
									x = -20,
									pic = {
										path = "res/ui/kfyz/zhaoling/yzzl_word_jb.png"
									}
								},
								{
									name = "lbl_cond3",
									y = 140,
									type = "label",
									x = 15,
									fontSize = 30 + (var_0_0.condLabelSize or 0),
									anchorPoint = ccp(0, 0.5),
									color = var_0_6,
									scale = var_0_0.zhengZhanRewardNodeScale or 1
								},
								{
									fontSize = 30,
									name = "lbl_reward3",
									y = 70,
									type = "label",
									x = 15,
									anchorPoint = ccp(0, 0.5),
									color = var_0_6,
									scale = var_0_0.zhengZhanRewardNodeScale or 1
								},
								{
									type = "sprite",
									name = "finish3",
									y = 110,
									visible = false,
									x = 0,
									pic = {
										path = "res/ui/task/finish.png"
									}
								}
							}
						},
						{
							y = 180,
							x = 750,
							type = "node",
							children = {
								{
									name = "btn_reward4",
									h = 56,
									type = "button",
									w = 189,
									y = 0,
									x = 0,
									normal = {
										path = "res/ui/common/button/sdyjs_btn_03.png"
									},
									touched = {
										path = "res/ui/common/button/sdyjs_btn_03_c.png"
									},
									disable = {
										path = "res/ui/common/button/sdyjs_btn_03_g.png"
									},
									children = {
										{
											fontSize = 25,
											style = "label_warlock",
											y = 33,
											type = "label",
											x = 92,
											textId = 92013,
											color = var_0_3
										}
									}
								},
								{
									y = 140,
									x = 10,
									type = "sprite",
									pic = {
										path = "res/ui/kfyz/zhaoling/yzzl_ink_bg1.png"
									}
								},
								{
									y = 70,
									x = 10,
									type = "sprite",
									pic = {
										path = "res/ui/kfyz/zhaoling/yzzl_ink_bg1.png"
									}
								},
								{
									y = 140,
									name = "icon3_1",
									scale = 0.8,
									type = "sprite",
									x = -70,
									pic = {
										path = "res/ui/task/nation_task.png"
									}
								},
								{
									y = 70,
									name = "icon3_2",
									type = "sprite",
									x = -70,
									pic = {
										path = "res/ui/kfyz/zhaoling/yzzl_word_j.png"
									},
									scale = var_0_0.zhengZhanRewardNodeScale or 1
								},
								{
									y = 70,
									name = "icon_reward4",
									type = "sprite",
									x = -20,
									pic = {
										path = "res/ui/task/get_icon_exp.png"
									},
									scale = var_0_0.zhengZhanRewardNodeScale or 1
								},
								{
									y = 140,
									name = "indivType4",
									type = "sprite",
									x = -20,
									pic = {
										path = "res/ui/kfyz/zhaoling/yzzl_word_dt.png"
									}
								},
								{
									name = "lbl_cond4",
									y = 140,
									type = "label",
									x = 15,
									fontSize = 30 + (var_0_0.condLabelSize or 0),
									anchorPoint = ccp(0, 0.5),
									color = var_0_6,
									scale = var_0_0.zhengZhanRewardNodeScale or 1
								},
								{
									fontSize = 30,
									name = "lbl_reward4",
									y = 70,
									type = "label",
									x = 15,
									anchorPoint = ccp(0, 0.5),
									color = var_0_6,
									scale = var_0_0.zhengZhanRewardNodeScale or 1
								},
								{
									type = "sprite",
									name = "finish4",
									y = 110,
									visible = false,
									x = 0,
									pic = {
										path = "res/ui/task/finish.png"
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

function var_0_8.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.data)
	end

	kfcmgr.sendRequest(var_2_0, actions.kfyzGetIndivTaskInfo)
end

function var_0_8.handlerPushKfyzIndivChangeAction(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1.data.indivchange

	if var_4_0 then
		for iter_4_0 = 1, 4 do
			local var_4_1 = arg_4_0.info.indiv[iter_4_0]

			if var_4_1.indivType == var_4_0.indivType then
				if var_4_1.isFinish and not var_4_1.isReward then
					-- block empty
				else
					arg_4_0.info.indiv[iter_4_0] = var_4_0

					arg_4_0:showPanel(arg_4_0.info)
				end

				return
			end
		end
	end
end

function var_0_8.onBtnPageTap(arg_5_0, arg_5_1)
	arg_5_0.page = arg_5_1

	local var_5_0 = arg_5_1 == 1

	arg_5_0.view.widgets.node1:setVisible(var_5_0)
	arg_5_0.view.widgets.node2:setVisible(not var_5_0)
	arg_5_0.view.widgets.btn_node1:setHighlighted(var_5_0)
	arg_5_0.view.widgets.btn_node2:setHighlighted(not var_5_0)
end

function var_0_8.onBtnRewardTap(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0.info.indiv[arg_6_1]
	local var_6_1 = var_6_0.id

	local function var_6_2(arg_7_0)
		local var_7_0 = {}

		for iter_7_0, iter_7_1 in pairs(var_6_0.rewards) do
			local var_7_1 = {
				id = var_0_1[iter_7_1.type],
				value = iter_7_1.value
			}

			table.insert(var_7_0, var_7_1)
		end

		globalAction_gotResource(var_7_0)
		arg_6_0:refresh()
		arg_6_0.world:getSIndivTask()
	end

	kfcmgr.sendRequest(var_6_2, actions.kfyzGetIndivTaskReward, var_6_1)
end

function var_0_8.showPanel(arg_8_0, arg_8_1)
	arg_8_0.info = arg_8_1

	arg_8_0:onBtnPageTap(arg_8_0.page)

	local var_8_0 = false
	local var_8_1 = true

	for iter_8_0 = 1, 4 do
		local var_8_2 = arg_8_1.indiv[iter_8_0]
		local var_8_3
		local var_8_4

		if var_8_2.rewards and #var_8_2.rewards > 0 then
			var_8_3 = var_8_2.rewards[1]
			var_8_4 = var_8_2.rewards[2]
		end

		if var_8_3 then
			if var_8_3.type == "sichou" then
				var_8_3.type = "silk"
			elseif var_8_3.type == "feat" then
				var_8_3.type = "gongxun"
			end

			local var_8_5 = string.format("res/ui/task/get_icon_%s.png", var_8_3.type)

			arg_8_0.view.widgets["icon_reward" .. iter_8_0]:setDisplayFrame(CCSprite:create(var_8_5):displayFrame())
			arg_8_0.view.widgets["lbl_reward" .. iter_8_0]:setString(tool.getFormatNum(var_8_3.value))

			if arg_8_0.view.widgets["icon_reward" .. iter_8_0 .. "_extra"] then
				arg_8_0.view.widgets["icon_reward" .. iter_8_0 .. "_extra"]:setVisible(false)
			end

			if arg_8_0.view.widgets["lbl_reward" .. iter_8_0 .. "_extra"] then
				arg_8_0.view.widgets["lbl_reward" .. iter_8_0 .. "_extra"]:setVisible(false)
			end

			if var_8_4 and arg_8_0.view.widgets["icon_reward" .. iter_8_0 .. "_extra"] and arg_8_0.view.widgets["lbl_reward" .. iter_8_0 .. "_extra"] then
				if var_8_4.type == "sichou" then
					var_8_4.type = "silk"
				elseif var_8_4.type == "feat" then
					var_8_4.type = "gongxun"
				end

				local var_8_6 = string.format("res/ui/task/get_icon_%s.png", var_8_4.type)

				arg_8_0.view.widgets["icon_reward" .. iter_8_0 .. "_extra"]:setDisplayFrame(CCSprite:create(var_8_6):displayFrame())
				arg_8_0.view.widgets["icon_reward" .. iter_8_0 .. "_extra"]:setVisible(true)
				arg_8_0.view.widgets["lbl_reward" .. iter_8_0 .. "_extra"]:setString(tool.getFormatNum(var_8_4.value))
				arg_8_0.view.widgets["lbl_reward" .. iter_8_0 .. "_extra"]:setVisible(true)
			end

			local var_8_7

			if iter_8_0 == 1 then
				var_8_7 = language.get(390457, tool.getFormatNum(var_8_2.goal), math.floor(100 * var_8_2.value / var_8_2.goal))
			else
				var_8_7 = language.get(390478, var_8_2.value, var_8_2.goal)
			end

			arg_8_0.view.widgets["lbl_cond" .. iter_8_0]:setString(var_8_7)

			if iter_8_0 >= 2 then
				local var_8_8 = "res/ui/kfyz/zhaoling/" .. var_0_2[var_8_2.indivType]

				arg_8_0.view.widgets["indivType" .. iter_8_0]:setDisplayFrame(CCSprite:create(var_8_8):displayFrame())
			end
		end

		arg_8_0.view.widgets["btn_reward" .. iter_8_0]:setEnabled(var_8_2.isFinish)
		arg_8_0.view.widgets["btn_reward" .. iter_8_0]:setVisible(not var_8_2.isReward)
		arg_8_0.view.widgets["finish" .. iter_8_0]:setVisible(var_8_2.isFinish)

		if iter_8_0 == 1 then
			for iter_8_1 = 1, 5 do
				local var_8_9 = arg_8_0.view.widgets["icon" .. iter_8_1]
				local var_8_10 = arg_8_0.view.widgets["mask" .. iter_8_1]

				var_8_9:removeAllChildrenWithCleanup(true)

				if iter_8_1 < var_8_2.index then
					var_8_10:setVisible(true)
				elseif iter_8_1 == var_8_2.index then
					var_8_10:setVisible(var_8_2.isReward)
				else
					var_8_10:setVisible(false)
					tool.spriteToGray(var_8_9)
				end
			end

			if var_8_2.index == 5 and var_8_2.isFinish then
				var_8_0 = true
			end
		elseif not var_8_2.isFinish then
			var_8_1 = false
		end
	end

	arg_8_0.view.widgets.btn_finish1:setVisible(var_8_0)
	arg_8_0.view.widgets.btn_finish2:setVisible(var_8_1)
end

function var_0_8.ctor(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	arg_9_0.world = arg_9_2
	arg_9_0.view = {}

	uiutil.initWidgets(arg_9_0.view, arg_9_0.layout)
	swallowTouch(arg_9_0)
	arg_9_0:addChild(arg_9_0.view.widgets.panel)

	if arg_9_1 then
		arg_9_1:addChild(arg_9_0)
	end

	arg_9_0.view.widgets.btn_close:setScale(2)
	arg_9_0.view.widgets.btn_close:addHandleOfControlEvent(function()
		arg_9_0:removeFromParentAndCleanup(true)
	end, CCControlEventTouchUpInside)
	arg_9_0.view.widgets.btn_node1:addHandleOfControlEvent(function()
		arg_9_0:onBtnPageTap(1)
	end, CCControlEventTouchUpInside)
	arg_9_0.view.widgets.btn_node2:addHandleOfControlEvent(function()
		arg_9_0:onBtnPageTap(2)
	end, CCControlEventTouchUpInside)
	arg_9_0.view.widgets.btn_speed:setScale(0.8)
	arg_9_0.view.widgets.btn_speed:addHandleOfControlEvent(function()
		log.info("btn_speed")
		arg_9_0:removeFromParentAndCleanup(true)

		local var_13_0 = smgr.getLayer("topLayer")

		require("lua/layer/kfyz/JunkuLayer").new(var_13_0)
	end, CCControlEventTouchUpInside)

	for iter_9_0 = 1, 2 do
		local var_9_0 = arg_9_0.view.widgets["bg_info" .. iter_9_0]

		var_9_0:setScaleX(0.8)
		var_9_0:setScaleY(1.1)
	end

	for iter_9_1 = 1, 4 do
		arg_9_0.view.widgets["btn_reward" .. iter_9_1]:addHandleOfControlEvent(function()
			log.info("btn_reward" .. iter_9_1)
			arg_9_0:onBtnRewardTap(iter_9_1)
		end, CCControlEventTouchUpInside)
	end

	arg_9_0.page = arg_9_3 or 1

	arg_9_0:refresh()
	arg_9_0:refineLayout()
end

function var_0_8.onEnter(arg_15_0)
	function arg_15_0.handlerPushKfyzIndivChangeActionRef(arg_16_0)
		arg_15_0:handlerPushKfyzIndivChangeAction(arg_16_0)
	end

	eventManager.registerEvent("kfyzIndivChange", arg_15_0.handlerPushKfyzIndivChangeActionRef)
end

function var_0_8.onExit(arg_17_0)
	eventManager.unregisterEvent("kfyzIndivChange", arg_17_0.handlerPushKfyzIndivChangeActionRef)
end

function var_0_8.refineLayout(arg_18_0)
	for iter_18_0 = 2, 4 do
		arg_18_0.view.widgets["lbl_cond" .. iter_18_0]:setPositionX(arg_18_0.view.widgets["indivType" .. iter_18_0]:getPositionX() + arg_18_0.view.widgets["indivType" .. iter_18_0]:getContentSize().width / 2 + 4)

		local var_18_0 = arg_18_0.view.widgets["icon" .. iter_18_0 - 1 .. "_" .. 2]:getPositionX() + arg_18_0.view.widgets["icon" .. iter_18_0 - 1 .. "_" .. 2]:getContentSize().width * arg_18_0.view.widgets["icon" .. iter_18_0 - 1 .. "_" .. 2]:getScale() / 2

		arg_18_0.view.widgets["icon_reward" .. iter_18_0]:setAnchorPoint(ccp(0, 0.5))
		arg_18_0.view.widgets["icon_reward" .. iter_18_0]:setPositionX(var_18_0)

		local var_18_1 = var_18_0 + arg_18_0.view.widgets["icon_reward" .. iter_18_0]:getContentSize().width * arg_18_0.view.widgets["icon_reward" .. iter_18_0]:getScale()

		arg_18_0.view.widgets["lbl_reward" .. iter_18_0]:setAnchorPoint(ccp(0, 0.5))
		arg_18_0.view.widgets["lbl_reward" .. iter_18_0]:setPositionX(var_18_1)
	end
end

return var_0_8
