local var_0_0 = class("uncoverFogUiData")
local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.expoffsetx = 70
else
	var_0_1.expoffsetx = 0
end

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.ui = arg_1_1
	arg_1_0.data = {}
	arg_1_0.data.bg = {
		y = 290,
		z = -100,
		x = 480,
		type = "pic",
		pic = "res/ui/comment/bg1.jpg"
	}
	arg_1_0.data.title = {
		x = 480,
		y = 505,
		pic = "res/ui/jkmw/jkmw_title.png",
		type = "pic"
	}
	arg_1_0.data.calcTime = {
		fontSize = 20,
		text = "123",
		stroke = false,
		type = "label",
		y = 500,
		x = 707,
		color = ccc3(255, 0, 0)
	}
	arg_1_0.data.peoplePic = {
		x = 201,
		pic = "res/ui/comment/xiaoqian.png",
		y = 197,
		type = "pic",
		scale = 0.6
	}
	arg_1_0.data.currentBg = {
		y = 400,
		x = 480,
		type = "pic",
		pic = "res/ui/saotao/stfx_long_bg.png",
		children = {
			{
				xcenter = -60,
				name = "processBg",
				type = "pic",
				ycenter = -10,
				pic = "res/ui/activity/famous/gjms_deg_view.png",
				children = {
					{
						xcenter = 0,
						name = "winMistBar",
						percentage = 20,
						type = "process",
						ycenter = 1,
						pic = "res/ui/activity/famous/gjms_deg_con.png"
					}
				}
			},
			{
				name = "gotoWorldButtonBg",
				type = "button",
				ycenter = -10,
				x = 820,
				buttons = {
					{
						pic2 = "frame:btn_ok_lighted.png",
						name = "gotoWorldButton",
						pic1 = "frame:btn_ok_normal.png",
						children = {
							{
								fontSize = 24,
								stroke = false,
								type = "label",
								ycenter = 0,
								xcenter = 0,
								text = language.get("500202_jkmw"),
								color = colorText[10001]
							}
						}
					}
				}
			},
			{
				xcenter = 0,
				name = "allReward",
				visible = false,
				type = "pic",
				ycenter = 0,
				pic = "res/ui/common/text/sdtj/tjsd_tit_hdjs.png"
			},
			{
				fontSize = 24,
				name = "tishi",
				stroke = false,
				type = "label",
				xcenter = -100,
				ycenter = 30,
				text = language.get("500201_jkmw"),
				color = colorText[10001]
			}
		}
	}

	for iter_1_0 = 1, 4 do
		table.insert(arg_1_0.data.currentBg.children, {
			fontSize = 24,
			stroke = false,
			type = "label",
			ycenter = -40,
			name = "processLabel_" .. iter_1_0,
			text = "" .. iter_1_0 * 5,
			color = colorText[10001],
			xcenter = -213 + (iter_1_0 - 1) * 153
		})
	end

	for iter_1_1 = 1, 3 do
		table.insert(arg_1_0.data.currentBg.children, {
			type = "pic",
			ycenter = -10,
			pic = "res/ui/activity/famous/gjms_deg_div.png",
			name = "gapLevel_" .. iter_1_1,
			xcenter = -213 + (iter_1_1 - 1) * 153
		})
	end
end

function var_0_0.getData(arg_2_0, arg_2_1)
	local var_2_0 = 0

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.uncoverMistRewardInfo) do
		local var_2_1 = iter_2_0 % 2 == 0 and 255 or 0
		local var_2_2 = false
		local var_2_3 = false
		local var_2_4 = false

		if iter_2_1.canRecieve == 0 then
			var_2_2 = true
		elseif iter_2_1.canRecieve == 1 then
			if iter_2_1.recieved == 0 then
				var_2_3 = true
			elseif iter_2_1.recieved == 1 then
				var_2_4 = true
			end
		end

		arg_2_0.data["cell_" .. iter_2_0] = {
			x = 610,
			type = "pic",
			pic = "res/ui/jkmw/jkmw_samll_long.png",
			opacity = var_2_1,
			y = 265 - (iter_2_0 - 1) * 60,
			children = {
				{
					fontSize = 24,
					anchorPointX = 0,
					stroke = false,
					type = "label",
					ycenter = 0,
					anchorPointY = 0.5,
					x = 35,
					text = language.get("500203_jkmw", iter_2_1.condition),
					color = colorText[10002]
				},
				{
					fontSize = 24,
					stroke = false,
					type = "label",
					ycenter = 0,
					x = 225,
					text = language.get(138003),
					color = colorText[10002]
				},
				{
					ycenter = -3,
					pic = "frame:res_icon_6.png",
					type = "pic",
					x = 280 + var_0_1.expoffsetx
				},
				{
					fontSize = 24,
					anchorPointX = 0,
					stroke = false,
					type = "label",
					ycenter = 0,
					anchorPointY = 0.5,
					text = iter_2_1.reward[1].value,
					color = colorText[10002],
					x = 315 + var_0_1.expoffsetx
				},
				{
					fontSize = 24,
					anchorPointX = 0,
					stroke = false,
					type = "label",
					ycenter = 0,
					anchorPointY = 0.5,
					x = 450,
					text = language.get("500204_jkmw", iter_2_1.condition - arg_2_1.winMistNum),
					color = colorText[10002],
					visible = var_2_2
				},
				{
					type = "button",
					ycenter = 0,
					x = 500,
					visible = var_2_3,
					buttons = {
						{
							pic2 = "frame:btn2_gre_c.png",
							pic1 = "frame:btn2_gre_a.png",
							children = {
								{
									text = language.get(230005),
									colorText[10002],
									fontSize = 24,
									stroke = false,
									type = "label",
									ycenter = 0,
									xcenter = 0
								}
							},
							callBack = function()
								arg_2_0.ui:getReward(iter_2_0)
							end
						}
					}
				},
				{
					x = 500,
					type = "pic",
					ycenter = 0,
					pic = "frame:acti_icon_fini.png",
					visible = var_2_4
				}
			}
		}
	end

	return arg_2_0.data or {}
end

return var_0_0
