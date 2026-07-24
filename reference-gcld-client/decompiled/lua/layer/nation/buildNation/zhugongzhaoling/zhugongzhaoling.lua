function showZhugongZhaolingPanel()
	local var_1_0 = {
		bg = {
			xcenter = 0,
			name = "bg",
			type = "pic_9",
			ycenter = -28,
			pic = "frame:bigPanel.png",
			middleRect = CCRectMake(30, 30, 45, 45),
			preferedSize = CCSizeMake(960, 580),
			children = {
				{
					xcenter = 0,
					name = "bg2",
					type = "pic_9",
					ycenter = 0,
					pic = "res/ui/rankInfo/player_view_bg.png",
					middleRect = CCRectMake(30, 30, 20, 20),
					preferedSize = CCSizeMake(925, 520),
					children = {
						{
							xcenter = 0,
							name = "bg3",
							type = "pic",
							ycenter = 0,
							pic = "res/ui/kfzb/kfzbs_tz_bg.jpg",
							children = {
								{
									xcenter = 0,
									y = 447,
									pic = "res/ui/nation/buildNation/zhaoLing/zgzl_title.png",
									type = "pic"
								},
								{
									xcenter = 0,
									name = "zhaolingContent",
									y = 347,
									type = "pic",
									visible = false,
									pic = "res/ui/nation/buildNation/zhaoLing/zgzl_word.png"
								},
								{
									xcenter = 0,
									name = "center",
									y = 237,
									type = "pic",
									pic = "res/ui/rankInfo/player_view_bg.png",
									children = {
										{
											xcenter = 0,
											name = "centerHead_2",
											type = "pic",
											ycenter = 0,
											pic = "res/ui/common/playerHead/playerHead_icon_0.png"
										},
										{
											xcenter = 0,
											name = "down_2",
											type = "pic",
											ycenter = -85,
											pic = "res/ui/nation/buildNation/zhaoLing/zgzl_name_d.png",
											children = {
												{
													fontSize = 22,
													font = "Thonburi-Bold",
													name = "playerName_2",
													type = "label",
													ycenter = 0,
													xcenter = 0,
													text = ""
												}
											}
										}
									}
								},
								{
									xcenter = -200,
									name = "left",
									y = 237,
									type = "pic",
									pic = "res/ui/rankInfo/player_view_bg.png",
									children = {
										{
											xcenter = 0,
											name = "centerHead_1",
											type = "pic",
											ycenter = 0,
											pic = "res/ui/common/playerHead/playerHead_icon_0.png"
										},
										{
											xcenter = 0,
											name = "down_1",
											type = "pic",
											ycenter = -85,
											pic = "res/ui/nation/buildNation/zhaoLing/zgzl_name_d.png",
											children = {
												{
													fontSize = 22,
													font = "Thonburi-Bold",
													name = "playerName_1",
													type = "label",
													ycenter = 0,
													xcenter = 0,
													text = ""
												}
											}
										}
									}
								},
								{
									xcenter = 200,
									name = "right",
									y = 237,
									type = "pic",
									pic = "res/ui/rankInfo/player_view_bg.png",
									children = {
										{
											xcenter = 0,
											name = "centerHead_3",
											type = "pic",
											ycenter = 0,
											pic = "res/ui/common/playerHead/playerHead_icon_0.png"
										},
										{
											xcenter = 0,
											name = "down_3",
											type = "pic",
											ycenter = -85,
											pic = "res/ui/nation/buildNation/zhaoLing/zgzl_name_d.png",
											children = {
												{
													fontSize = 22,
													font = "Thonburi-Bold",
													name = "playerName_3",
													type = "label",
													ycenter = 0,
													xcenter = 0,
													text = ""
												}
											}
										}
									}
								}
							}
						},
						{
							type = "button",
							buttons = {
								{
									pic2 = "res/ui/common/button/public_btn_green_c.png",
									name = "button_zj",
									pic1 = "res/ui/common/button/public_btn_green.png",
									y = 50,
									z = 10,
									visible = false,
									x = 760
								}
							}
						},
						{
							fontSize = 24,
							font = "Thonburi-Bold",
							name = "buttonName_zj",
							type = "label",
							y = 52,
							x = 760,
							z = 100,
							text = language.get("220901_buildNation")
						},
						{
							type = "button",
							buttons = {
								{
									pic2 = "frame:btn_close_c.png",
									name = "closeItem",
									pic1 = "frame:btn_close_a.png",
									y = 573,
									scale = 2,
									x = 910
								}
							}
						},
						{
							x = 674,
							name = "GoldIcon",
							y = 52,
							type = "pic",
							z = 100,
							pic = "res/ui/common/button/public_btn_gold.png",
							children = {
								{
									xcenter = 0,
									ycenter = 4,
									pic = "frame:res_icon_19_small.png",
									type = "pic"
								},
								{
									fontSize = 20,
									font = "Thonburi",
									name = "GoldNum",
									type = "label",
									ycenter = -6,
									xcenter = 0,
									text = "0"
								}
							}
						}
					}
				}
			}
		}
	}
	local var_1_1 = createBaseLayer()
	local var_1_2 = {}
	local var_1_3 = autoUI.initUI(var_1_1, var_1_0)

	var_1_3.layer = var_1_1

	local var_1_4

	local function var_1_5()
		smgr.getLayer("topLayer"):removeChild(var_1_1, true)
	end

	var_1_3.closeItem:registerScriptTapHandler(var_1_5)

	local function var_1_6()
		if var_1_4.functionOpen == true and var_1_4.hasSign == false and (var_1_4.players == nil or #var_1_4.players < 3) then
			var_1_3.buttonName_zj:setVisible(true)
			var_1_3.buttonName_zj:setString(language.get("220901_buildNation"))
			var_1_3.button_zj:setVisible(true)
			var_1_3.GoldIcon:setVisible(false)
		elseif var_1_4.kbCostGold and var_1_4.canCostGold then
			var_1_3.buttonName_zj:setVisible(true)
			var_1_3.buttonName_zj:setString(language.get("220900_buildNation"))
			var_1_3.GoldNum:setString(var_1_4.kbCostGold)
			var_1_3.button_zj:setVisible(true)
			var_1_3.GoldIcon:setVisible(true)
		else
			var_1_3.buttonName_zj:setVisible(false)
			var_1_3.button_zj:setVisible(false)
			var_1_3.GoldIcon:setVisible(false)
		end

		if var_1_4.players then
			for iter_3_0 = 1, #var_1_4.players do
				var_1_3["centerHead_" .. iter_3_0]:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerHead/playerHead_icon_%s.png", var_1_4.players[iter_3_0].pic)):displayFrame())
				var_1_3["playerName_" .. iter_3_0]:setString(var_1_4.players[iter_3_0].playerName)
			end
		end

		if var_1_4.kbLv and var_1_4.kbLv == 1 then
			var_1_3.zhaolingContent:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/zhaoLing/ejwc_word.png"):displayFrame())
		end

		var_1_3.zhaolingContent:setVisible(true)
	end

	local function var_1_7()
		local function var_4_0(arg_5_0)
			if arg_5_0.action.data then
				local function var_5_0(arg_6_0)
					if arg_6_0.action.data then
						var_1_4 = arg_6_0.action.data

						var_1_6()
					end
				end

				cmgr.sendRequest(var_5_0, actions.getSignInfo)
			end
		end

		cmgr.sendRequest(var_4_0, actions.zijian)
	end

	var_1_3.button_zj:registerScriptTapHandler(var_1_7)

	local function var_1_8(arg_7_0)
		if arg_7_0.action.data then
			var_1_4 = arg_7_0.action.data

			var_1_6()
		end
	end

	cmgr.sendRequest(var_1_8, actions.getSignInfo)

	local function var_1_9(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == CCTOUCHBEGAN then
			return true
		end
	end

	var_1_1:setTouchEnabled(true)
	var_1_1:registerScriptTouchHandler(var_1_9, false, true)

	local var_1_10 = smgr.getLayer("topLayer")

	var_1_10:removeAllChildrenWithCleanup(true)
	var_1_10:addChild(var_1_1)
end
