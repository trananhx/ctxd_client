local var_0_0 = colorQuality[0]
local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = ccc3(0, 180, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = colorQuality[6]
local var_0_7 = class("JueStone", function()
	return createBaseLayer()
end)

var_0_7.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			name = "panel",
			type = "sprite",
			x = visibleSize.width / 2,
			y = visibleSize.height / 2 - 30,
			pic = {
				path = "res/ui/comment/bg1.jpg"
			},
			children = {
				{
					y = 480,
					name = "title",
					type = "sprite",
					x = 458,
					pic = {
						path = "res/ui/activity/jueStone/jsdfs_title.png"
					}
				},
				{
					fontSize = 25,
					name = "leftTime",
					style = "label_warlock",
					type = "label",
					y = 480,
					x = 730,
					color = var_0_3
				},
				{
					y = 401.1884,
					name = "bg1",
					type = "sprite9",
					x = 511.904,
					preferedSize = CCSizeMake(800, 60),
					middleRect = CCRectMake(46, 10, 1, 7),
					pic = {
						path = "res/ui/activity/gangMine/blgkd_number_bg2.png"
					},
					children = {
						{
							y = 30,
							name = "richLine_num",
							anchorPointX = 0,
							type = "richLine",
							gap = 10,
							x = 130,
							content = {
								{
									type = "sprite",
									pic = {
										path = "res/ui/activity/jueStone/jsdfs_word_bchdzyjhbq.png"
									}
								},
								{
									text = "0",
									name = "hubaoNum",
									startCharMap = 48,
									type = "atlaslabel",
									itemWidth = 22,
									pic = "res/ui/common/number/xflts_res_numb.png",
									itemHeight = 33
								},
								{
									type = "sprite",
									pic = {
										path = "res/ui/activity/jueStone/jsdfs_word_ci.png"
									}
								}
							}
						}
					}
				},
				{
					y = 220,
					name = "bg2",
					type = "sprite9",
					x = 458,
					preferedSize = CCSizeMake(909, 270),
					middleRect = CCRectMake(450, 8, 9, 182),
					pic = {
						path = "res/ui/activity/godPaper/czzyb_longbg2.png"
					},
					children = {
						{
							type = "richLine",
							name = "richLine_rule",
							y = 230,
							visible = false,
							anchorPointX = 0.5,
							gap = 0,
							x = 570,
							content = {
								{
									type = "sprite",
									pic = {
										path = "res/ui/activity/jueStone/jsdfs_word_yzzmjbhbq.png"
									}
								},
								{
									text = "0",
									name = "rule_hubaoNum",
									startCharMap = 48,
									type = "atlaslabel",
									itemWidth = 22,
									pic = "res/ui/common/number/xflts_res_numb.png",
									itemHeight = 33
								},
								{
									type = "sprite",
									pic = {
										path = "res/ui/activity/jueStone/jsdfs_word_cs.png"
									}
								},
								{
									text = "0",
									name = "rule_jueStoneNum",
									startCharMap = 48,
									type = "atlaslabel",
									itemWidth = 22,
									pic = "res/ui/common/number/xflts_res_numb.png",
									itemHeight = 33
								},
								{
									type = "sprite",
									pic = {
										path = "res/ui/activity/jueStone/jsdfs_word_kjs.png"
									}
								}
							}
						},
						{
							y = 170,
							name = "bg_bar",
							type = "sprite",
							x = 610,
							pic = {
								path = "res/ui/activity/consumeGift/xfshl_pb_bg.png"
							},
							children = {
								{
									y = 0,
									name = "bar",
									type = "progressbar",
									x = 0,
									anchorPoint = ccp(0, 0),
									pic = {
										path = "res/ui/activity/consumeGift/xfshl_pb.png"
									}
								},
								{
									x = -30,
									name = "icon",
									y = 24,
									type = "sprite",
									scale = 1.3,
									pic = {
										path = "res/ui/activity/jueStone/jsdfs_icon_jueshi.png"
									}
								},
								{
									y = 4,
									x = -30,
									type = "sprite",
									pic = {
										path = "res/ui/activity/jueStone/jsdfs_word_bencihuode.png"
									}
								},
								{
									fontSize = 25,
									name = "recvNum",
									style = "label_warlock",
									type = "label",
									y = 22,
									x = 290,
									color = var_0_1
								}
							}
						},
						{
							type = "sprite",
							name = "finished",
							y = 90,
							visible = false,
							x = 570,
							pic = {
								path = "res/ui/activity/jueStone/jsdfs_word_nyhdsydjs.png"
							}
						},
						{
							visible = false,
							name = "bg_reward",
							type = "sprite9",
							y = 90,
							x = 570,
							preferedSize = CCSizeMake(400, 100),
							middleRect = CCRectMake(190, 10, 13, 31),
							pic = {
								path = "res/ui/world/buildNation/jgdy_bd_d.png"
							},
							children = {
								{
									y = 50,
									name = "richLine_reward",
									anchorPointX = 0.5,
									type = "richLine",
									gap = 0,
									x = 200,
									content = {
										{
											type = "sprite",
											pic = {
												path = "res/ui/activity/jueStone/jsdfs_word_dqklq.png"
											}
										},
										{
											scale = 1.3,
											type = "sprite",
											pic = {
												path = "res/ui/activity/jueStone/jsdfs_icon_jueshi.png"
											}
										},
										{
											type = "sprite",
											pic = {
												path = "res/ui/activity/GeneralReward/scpm_word_digit_x.png"
											}
										},
										{
											text = "0",
											name = "canRecvNum",
											startCharMap = 48,
											type = "atlaslabel",
											itemWidth = 28,
											pic = "res/ui/common/number/gphb_word_digit.png",
											itemHeight = 33
										}
									}
								}
							}
						}
					}
				},
				{
					x = -20,
					name = "npc",
					y = 0,
					type = "sprite",
					scale = 0.9,
					anchorPoint = ccp(0, 0),
					pic = {
						path = "res/ui/comment/xiaoqian.png"
					}
				},
				{
					y = 50,
					name = "btn_reward",
					h = 64,
					type = "button",
					w = 200,
					visible = false,
					x = 560,
					normal = {
						path = "res/ui/common/button/public_btn_green.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_green_c.png"
					},
					children = {
						{
							fontSize = 25,
							style = "label_warlock",
							y = 35,
							type = "label",
							x = 100,
							textId = 20005,
							color = var_0_1
						}
					}
				}
			}
		}
	}
}

function var_0_7.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getTaxiActivity)
end

function var_0_7.onGetReward(arg_4_0)
	local function var_4_0(arg_5_0)
		local var_5_0 = arg_5_0.action.data
		local var_5_1 = {}

		for iter_5_0, iter_5_1 in ipairs(var_5_0.rewards) do
			local var_5_2 = {}

			var_5_2.id = 10054
			var_5_2.value = iter_5_1.num

			table.insert(var_5_1, var_5_2)
		end

		globalAction_gotResource(var_5_1)
		arg_4_0:showPanel(var_5_0)
	end

	cmgr.sendRequest(var_4_0, actions.jueStoneGetReward)
end

function var_0_7.showPanel(arg_6_0, arg_6_1)
	arg_6_0.info = arg_6_1

	local var_6_0 = arg_6_1.ruleInfo
	local var_6_1 = arg_6_1.jueStoneInfo
	local var_6_2 = var_6_1.recvNum >= var_6_1.maxNum

	arg_6_0.view.widgets.finished:setVisible(var_6_2)
	arg_6_0.view.widgets.bg_reward:setVisible(not var_6_2)
	arg_6_0.view.widgets.richLine_reward:setVisible(not var_6_2)
	arg_6_0.view.widgets.richLine_rule:setVisible(not var_6_2)
	arg_6_0.view.widgets.hubaoNum:setString(tostring(arg_6_1.hubaoNum))
	arg_6_0.view.widgets.richLine_num:reorder()
	arg_6_0.view.widgets.recvNum:setString(language.get(390478, var_6_1.recvNum, var_6_1.maxNum))
	arg_6_0.view.widgets.bar:setPercentage(100 * var_6_1.recvNum / var_6_1.maxNum)

	if not var_6_2 then
		arg_6_0.view.widgets.rule_hubaoNum:setString(tostring(var_6_0.hubaoNum))
		arg_6_0.view.widgets.rule_jueStoneNum:setString(tostring(var_6_0.jueStoneNum))
		arg_6_0.view.widgets.richLine_rule:reorder()
		arg_6_0.view.widgets.canRecvNum:setString(tostring(var_6_1.canRecvNum))
		arg_6_0.view.widgets.richLine_reward:reorder()
	end

	arg_6_0.view.widgets.btn_reward:setVisible(var_6_1.canRecvNum > 0)
end

function var_0_7.ctor(arg_7_0, arg_7_1, arg_7_2)
	log.info("@@ 角石放送")

	arg_7_0.view = {}

	uiutil.initWidgets(arg_7_0.view, arg_7_0.layout)

	arg_7_0.leftTime = arg_7_0.view.widgets.leftTime

	if arg_7_1 then
		arg_7_0:addChild(arg_7_0.view.widgets.root)
		arg_7_1:addChild(arg_7_0)
	end

	arg_7_0.view.widgets.btn_reward:addHandleOfControlEvent(function()
		log.info("btn_reward")
		arg_7_0:onGetReward()
	end, CCControlEventTouchUpInside)
	arg_7_0:showPanel(arg_7_2)
end

return var_0_7
