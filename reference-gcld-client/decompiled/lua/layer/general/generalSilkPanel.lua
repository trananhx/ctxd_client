function showGeneralSilkPanel()
	rmgr.loadResource("res/ui/activity/ironMine/ironMinePic.plist")
	rmgr.loadResource("res/ui/battle/battle.plist")

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
					pic = "frame:autoSizePanel.png",
					middleRect = CCRectMake(30, 30, 20, 20),
					preferedSize = CCSizeMake(920, 540),
					children = {
						{
							xcenter = 0,
							ycenter = 0,
							pic = "res/ui/comment/bg1.jpg",
							type = "pic"
						},
						{
							xcenter = 0,
							ycenter = -60,
							pic = "res/ui/general/generalSilk/wjhk_bg.jpg",
							type = "pic"
						},
						{
							xcenter = 0,
							top = 40,
							pic = "res/ui/general/generalSilk/wjhk_title.png",
							type = "pic"
						},
						{
							xcenter = 0,
							top = 120,
							pic = "frame:btkd_line.png",
							type = "pic"
						},
						{
							type = "button",
							buttons = {
								{
									pic2 = "res/ui/common/button/public_btn_red_c.png",
									name = "closeItem",
									pic1 = "res/ui/common/button/public_btn_red.png",
									y = 33,
									visible = false,
									x = 457
								},
								{
									pic2 = "frame:btn_close_c.png",
									name = "closeItem2",
									pic1 = "frame:btn_close_a.png",
									y = 583,
									scale = 2,
									x = 903
								}
							}
						},
						{
							fontSize = 26,
							font = "Thonburi-Bold",
							name = "buttonName",
							type = "label",
							y = 35,
							x = 457,
							visible = false,
							text = language.get("220820_silkBack")
						},
						{
							x = 400,
							name = "silk1",
							y = 100,
							type = "pic",
							visible = false,
							pic = "res/ui/general/generalSilk/wjhk_sc.png"
						},
						{
							x = 457,
							name = "silk2",
							y = 100,
							type = "pic",
							visible = false,
							pic = "res/ui/general/generalSilk/wjhk_sc.png"
						},
						{
							x = 514,
							name = "silk3",
							y = 100,
							type = "pic",
							visible = false,
							pic = "res/ui/general/generalSilk/wjhk_sc.png"
						},
						{
							x = 429,
							name = "silk4",
							y = 122,
							type = "pic",
							visible = false,
							pic = "res/ui/general/generalSilk/wjhk_sc.png"
						},
						{
							x = 486,
							name = "silk5",
							y = 122,
							type = "pic",
							visible = false,
							pic = "res/ui/general/generalSilk/wjhk_sc.png"
						},
						{
							x = 457,
							name = "silk6",
							y = 144,
							type = "pic",
							visible = false,
							pic = "res/ui/general/generalSilk/wjhk_sc.png"
						},
						{
							x = 837,
							name = "box1",
							y = 152,
							type = "pic",
							visible = false,
							pic = "res/ui/activity/ancientCastle/gctb_jmbx01.png"
						},
						{
							x = 457,
							name = "openBox",
							y = 133,
							type = "pic",
							visible = false,
							pic = "res/ui/activity/ancientCastle/gctb_jmbx01.png"
						},
						{
							x = 453,
							name = "specialTreasureKuang",
							y = 233,
							type = "pic",
							visible = false,
							pic = "res/ui/general/generalSilk/reward_icon_view_bg_light.png",
							children = {
								{
									xcenter = 0,
									name = "specialTreasure",
									type = "pic",
									ycenter = 0,
									pic = "frame:jiaoweiqin.jpg"
								},
								{
									xcenter = 35,
									name = "specialWord",
									type = "pic",
									ycenter = 75,
									pic = "res/ui/general/generalSilk/wjhk_word_bw_jwq.png"
								},
								{
									xcenter = -85,
									scale = 0.6,
									type = "pic",
									ycenter = 75,
									pic = "frame:stategyBackground.png",
									children = {
										{
											xcenter = 0,
											name = "specialGeneral",
											type = "pic",
											ycenter = 0,
											pic = "res/ui/common/fightPic/fightPic_diaochan.png"
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
	local var_1_1 = 1
	local var_1_2 = createBaseLayer()
	local var_1_3 = autoUI.initUI(var_1_2, var_1_0)

	var_1_3.layer = var_1_2

	local function var_1_4(arg_2_0)
		if user.evokeReward.type == 116 then
			if var_1_1 == 1 then
				roleDialogue.control.loadSpeak(1961)

				for iter_2_0 = 1, 6 do
					var_1_3["silk" .. iter_2_0]:setVisible(true)
				end

				if user.evokeReward.belongGeneralId then
					var_1_3.box1:setVisible(true)
				end
			else
				for iter_2_1 = 1, 6 do
					var_1_3["silk" .. iter_2_1]:setVisible(false)
				end

				var_1_3.closeItem:setVisible(true)
				var_1_3.buttonName:setVisible(true)
			end
		elseif user.evokeReward.type == 117 then
			if var_1_1 == 1 then
				if user.evokeReward.evokeGeneralId == user.evokeReward.belongGeneralId then
					roleDialogue.control.loadSpeak(1963)
				else
					roleDialogue.control.loadSpeak(1962)
				end

				var_1_3.openBox:setVisible(true)
			elseif var_1_1 == 2 then
				local var_2_0 = {
					longdanshi = "wjhk_word_bw_lds.png",
					longfengmeiren = "wjhk_word_bw_lfmr.png",
					xintinghoudao = "wjhk_word_bw_xthd.png",
					jiaoweiqin = "wjhk_word_bw_jwq.png",
					ziyijiandai = "zyzf_word_zyjd.png",
					kongmingdeng = "zgljx_word_kmd.png",
					simabingfa = "wjhk_word_bw_smbf.png",
					wenjiujinzun = "wjhk_word_bw_wjjz.png",
					sunshixiangnang = "zyzf_word_ssxn.png",
					wushenpao = "wjhk_word_bw_wsp.png",
					zijinling = "word_zijinling.png",
					mengdexinshu = "word_mengdexinshu.png",
					wujinqilin = "ztjx_word_wjql.png",
					luorigong = "word_lrg.png",
					jizhiming = "wjhk_word_bw_jzm.png",
					xuelianchijia = "ztjx_word_xlcj.png"
				}

				var_1_3.openBox:setDisplayFrame(CCSprite:create("res/ui/activity/ancientCastle/xbaox1.png"):displayFrame())
				var_1_3.specialTreasureKuang:setVisible(true)
				var_1_3.specialGeneral:setDisplayFrame(CCSprite:create("res/ui/common/fightPic/fightPic_" .. user.evokeReward.belongGeneralPic .. ".png"):displayFrame())

				local var_2_1 = var_2_0[arg_2_0.pic] or "wjhk_word_zsbw.png"

				var_1_3.specialWord:setDisplayFrame(CCSprite:create("res/ui/general/generalSilk/" .. var_2_1):displayFrame())
				var_1_3.specialTreasure:setDisplayFrame(tool.spriteFrameByName(string.format("%s.jpg", arg_2_0.pic)))
				var_1_3.closeItem:setVisible(true)
				var_1_3.buttonName:setVisible(true)
			end
		end
	end

	local function var_1_5()
		smgr.getLayer("topLayer"):removeChild(var_1_2, true)
	end

	var_1_3.closeItem:registerScriptTapHandler(var_1_5)
	var_1_3.closeItem2:registerScriptTapHandler(var_1_5)
	var_1_4()

	local function var_1_6(arg_4_0)
		if arg_4_0.action.data then
			local var_4_0 = arg_4_0.action.data

			if var_4_0.type == 116 then
				local var_4_1 = {
					{}
				}

				var_4_1[1].id = 55
				var_4_1[1].value = var_4_0.num

				globalAction_gotResource(var_4_1)

				var_1_1 = 2

				var_1_4()
			elseif var_4_0.type == 117 then
				local var_4_2 = {
					{}
				}

				var_4_2[1].id = 20001
				var_4_2[1].value = 1

				globalAction_gotResource(var_4_2)

				var_1_1 = 2

				var_1_4(var_4_0)
			else
				var_1_1 = 3

				var_1_4()
			end
		end
	end

	local function var_1_7(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == CCTOUCHBEGAN then
			for iter_5_0 = 1, 6 do
				if tool.checkIfTouch(var_1_3["silk" .. iter_5_0], arg_5_1, arg_5_2) and var_1_3["silk" .. iter_5_0]:isVisible() then
					cmgr.sendRequest(var_1_6, actions.getEvokeSilkGift, user.evokeReward.evokeGeneralId)

					break
				end
			end

			if tool.checkIfTouch(var_1_3.box1, arg_5_1, arg_5_2) and var_1_3.box1:isVisible() then
				if user.evokeReward.evokeGeneralId == user.evokeReward.belongGeneralId then
					roleDialogue.control.loadSpeak(1965)
				else
					roleDialogue.control.loadSpeak(1964)
				end
			end

			if tool.checkIfTouch(var_1_3.openBox, arg_5_1, arg_5_2) and var_1_3.openBox:isVisible() and var_1_1 == 1 then
				cmgr.sendRequest(var_1_6, actions.getEvokeSilkGift, user.evokeReward.evokeGeneralId)
			end
		end

		return true
	end

	var_1_2:setTouchEnabled(true)
	var_1_2:registerScriptTouchHandler(var_1_7, false, true)

	local var_1_8 = smgr.getLayer("topLayer")

	var_1_8:removeChildByTag(10234, true)
	var_1_8:addChild(var_1_2, 1000, 10234)
end
