local var_0_0 = class("LookMenuLayer", function()
	return createBaseLayer()
end)

var_0_0.uidata = {}
var_0_0.uidata.dicepanel = {
	y = 0,
	anchorPointX = 1,
	type = "pic",
	anchorPointY = 0,
	pic = "res/ui/mainUI/footer_r_view.png",
	x = visibleSize.width,
	children = {
		{
			anchorPointX = 1,
			y = -5,
			pic = "frame:cdsh_touzi_bg.png",
			type = "pic",
			anchorPointY = 0,
			x = 230
		},
		{
			y = 49,
			x = 94.5,
			type = "button",
			buttons = {
				{
					pic2 = "res/ui/kfworld/kfgz_view_zc_btn_c.png",
					name = "mainCityBtn",
					pic1 = "res/ui/kfworld/kfgz_view_zc_btn_a.png",
					callBack = function()
						smgr.changeScene(SCENE_MAIN_CITY)
					end
				}
			}
		},
		{
			pic = "frame:cdsh_touzi_di.png",
			y = 49,
			type = "pic",
			x = -30,
			children = {
				{
					xcenter = 0,
					ycenter = 0,
					type = "button",
					buttons = {
						{
							pic2 = "frame:cdsh_icon_touzi_1.png",
							name = "dice1",
							pic1 = "frame:cdsh_icon_touzi_1.png"
						}
					}
				},
				{
					xcenter = 0,
					name = "gold1",
					y = 20,
					type = "pic",
					pic = "frame:cdsh_jinbi_bg.png",
					children = {
						{
							anchorPointX = 0,
							name = "goldnumIcon1",
							x = 15,
							type = "pic",
							ycenter = 0,
							pic = "frame:cdsh_jinbi.png"
						},
						{
							fontSize = 14,
							name = "goldnum1",
							type = "label",
							anchorPointX = 0,
							ycenter = 2,
							text = "",
							font = "Thonburi",
							x = 22,
							color = colorText.GC_INTER_HUANG
						}
					}
				},
				{
					width = 24,
					height = 31,
					name = "leftTimes1",
					type = "atlas",
					pic = "res/ui/activity/lookActivity/cdsh_shuzi.png",
					text = "",
					y = 90,
					startChar = 48,
					x = 90
				},
				{
					width = 29,
					height = 39,
					name = "leftSteps1",
					type = "atlas",
					ycenter = 0,
					anchorPointX = 0,
					pic = "res/ui/activity/lookActivity/cdsh_shuzi_bushu.png",
					text = "",
					visible = false,
					startChar = 48,
					x = 10
				},
				{
					x = 10,
					name = "leftStepsIcon1",
					anchorPointX = 0,
					type = "pic",
					ycenter = 0,
					visible = false,
					pic = "res/ui/common/text/activity/lookActivity/cdsh_meishuzi_bu.png"
				}
			}
		},
		{
			pic = "frame:cdsh_touzi_di.png",
			y = 49,
			type = "pic",
			x = -140,
			children = {
				{
					xcenter = 0,
					ycenter = 0,
					type = "button",
					buttons = {
						{
							pic2 = "frame:cdsh_icon_touzi_2.png",
							name = "dice2",
							pic1 = "frame:cdsh_icon_touzi_2.png"
						}
					}
				},
				{
					xcenter = 0,
					name = "gold2",
					y = 20,
					type = "pic",
					pic = "frame:cdsh_jinbi_bg.png",
					children = {
						{
							anchorPointX = 0,
							name = "goldnumIcon2",
							x = 15,
							type = "pic",
							ycenter = 0,
							pic = "frame:cdsh_jinbi.png"
						},
						{
							fontSize = 14,
							name = "goldnum2",
							type = "label",
							anchorPointX = 0,
							ycenter = 2,
							text = "",
							font = "Thonburi",
							x = 22,
							color = colorText.GC_INTER_HUANG
						}
					}
				},
				{
					name = "leftTimes2",
					height = 31,
					x = 90,
					type = "atlas",
					y = 90,
					pic = "res/ui/activity/lookActivity/cdsh_shuzi.png",
					text = "",
					visible = false,
					startChar = 48,
					width = 24
				},
				{
					width = 29,
					height = 39,
					name = "leftSteps2",
					type = "atlas",
					ycenter = 0,
					anchorPointX = 0,
					pic = "res/ui/activity/lookActivity/cdsh_shuzi_bushu.png",
					text = "",
					visible = false,
					startChar = 48,
					x = 10
				},
				{
					x = 10,
					name = "leftStepsIcon2",
					anchorPointX = 0,
					type = "pic",
					ycenter = 0,
					visible = false,
					pic = "res/ui/common/text/activity/lookActivity/cdsh_meishuzi_bu.png"
				}
			}
		},
		{
			pic = "frame:cdsh_touzi_di.png",
			y = 49,
			type = "pic",
			x = -250,
			children = {
				{
					xcenter = 0,
					ycenter = 0,
					type = "button",
					buttons = {
						{
							pic2 = "frame:cdsh_icon_touzi_3.png",
							name = "dice3",
							pic1 = "frame:cdsh_icon_touzi_3.png"
						}
					}
				},
				{
					xcenter = 0,
					name = "gold3",
					y = 20,
					type = "pic",
					pic = "frame:cdsh_jinbi_bg.png",
					children = {
						{
							anchorPointX = 0,
							name = "goldnumIcon3",
							x = 15,
							type = "pic",
							ycenter = 0,
							pic = "frame:cdsh_jinbi.png"
						},
						{
							fontSize = 14,
							name = "goldnum3",
							type = "label",
							anchorPointX = 0,
							ycenter = 2,
							text = "",
							font = "Thonburi",
							x = 22,
							color = colorText.GC_INTER_HUANG
						}
					}
				},
				{
					name = "leftTimes3",
					height = 31,
					x = 90,
					type = "atlas",
					y = 90,
					pic = "res/ui/activity/lookActivity/cdsh_shuzi.png",
					text = "",
					visible = false,
					startChar = 48,
					width = 24
				},
				{
					width = 29,
					height = 39,
					name = "leftSteps3",
					type = "atlas",
					ycenter = 0,
					anchorPointX = 0,
					pic = "res/ui/activity/lookActivity/cdsh_shuzi_bushu.png",
					text = "",
					visible = false,
					startChar = 48,
					x = 10
				},
				{
					x = 10,
					name = "leftStepsIcon3",
					anchorPointX = 0,
					type = "pic",
					ycenter = 0,
					visible = false,
					pic = "res/ui/common/text/activity/lookActivity/cdsh_meishuzi_bu.png"
				}
			}
		}
	}
}

function var_0_0.ctor(arg_3_0, arg_3_1)
	arg_3_0.world = arg_3_1
	arg_3_0.control = arg_3_1.control
	arg_3_0.uiTable = autoUI.initUI(arg_3_0, arg_3_0.uidata)

	for iter_3_0 = 1, 3 do
		arg_3_0.uiTable["dice" .. iter_3_0]:registerScriptTapHandler(function()
			arg_3_0.control:throwDiceLook(iter_3_0, arg_3_0.uiTable["goldnum" .. iter_3_0]:getString())
		end)
	end

	arg_3_0:updateDiceState()
end

function var_0_0.updateDiceState(arg_5_0)
	for iter_5_0, iter_5_1 in pairs(arg_5_0.control.data.golds) do
		if arg_5_0.uiTable["goldnum" .. iter_5_1.num] ~= nil then
			arg_5_0.uiTable["goldnum" .. iter_5_1.num]:setString(iter_5_1.gold)
		end
	end

	for iter_5_2 = 1, 3 do
		arg_5_0.uiTable["leftTimes" .. iter_5_2]:setString(math.floor(arg_5_0.control.data.leftDice / iter_5_2))
		arg_5_0.uiTable["goldnumIcon" .. iter_5_2]:setPositionX((71 - (arg_5_0.uiTable["goldnumIcon" .. iter_5_2]:getContentSize().width + arg_5_0.uiTable["goldnum" .. iter_5_2]:getContentSize().width)) * 0.5)
		arg_5_0.uiTable["goldnum" .. iter_5_2]:setPositionX(arg_5_0.uiTable["goldnumIcon" .. iter_5_2]:getPositionX() + arg_5_0.uiTable["goldnumIcon" .. iter_5_2]:getContentSize().width)

		if iter_5_2 == 1 then
			if arg_5_0.control.data.leftDice > 0 then
				arg_5_0.uiTable["leftTimes" .. iter_5_2]:setVisible(true)
				arg_5_0.uiTable["gold" .. iter_5_2]:setVisible(false)
			else
				arg_5_0.uiTable["leftTimes" .. iter_5_2]:setVisible(false)
				arg_5_0.uiTable["gold" .. iter_5_2]:setVisible(true)
			end
		end

		if iter_5_2 == arg_5_0.control.data.lastHit and arg_5_0.control.data.leftTimes > 0 then
			arg_5_0.uiTable["leftSteps" .. iter_5_2]:setVisible(true)
			arg_5_0.uiTable["leftStepsIcon" .. iter_5_2]:setVisible(true)
			arg_5_0.uiTable["dice" .. iter_5_2]:setVisible(false)
			arg_5_0.uiTable["leftSteps" .. iter_5_2]:setString(arg_5_0.control.data.leftTimes)
			arg_5_0.uiTable["leftSteps" .. iter_5_2]:setPositionX((119 - arg_5_0.uiTable["leftSteps" .. iter_5_2]:getContentSize().width - arg_5_0.uiTable["leftStepsIcon" .. iter_5_2]:getContentSize().width) * 0.5)
			arg_5_0.uiTable["leftStepsIcon" .. iter_5_2]:setPositionX(arg_5_0.uiTable["leftSteps" .. iter_5_2]:getPositionX() + arg_5_0.uiTable["leftSteps" .. iter_5_2]:getContentSize().width)
		else
			arg_5_0.uiTable["leftSteps" .. iter_5_2]:setVisible(false)
			arg_5_0.uiTable["leftStepsIcon" .. iter_5_2]:setVisible(false)
			arg_5_0.uiTable["dice" .. iter_5_2]:setVisible(true)
		end
	end
end

return var_0_0
