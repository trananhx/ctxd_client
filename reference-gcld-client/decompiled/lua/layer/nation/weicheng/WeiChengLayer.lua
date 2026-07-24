local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.lan_490556_x = -50
	var_0_0.nickNameY = -16
else
	var_0_0.lan_490556_x = 0
	var_0_0.nickNameY = 0
end

local var_0_1 = class("WeiChengLayer", function()
	return createBaseLayer()
end)

function var_0_1.ctor(arg_2_0)
	arg_2_0.uiTable = autoUI.initUI(arg_2_0, arg_2_0:getUiData())

	arg_2_0.uiTable.background:setVisible(false)
	arg_2_0.uiTable.background2:setVisible(false)
	arg_2_0:getWeiChengState()
end

function var_0_1.getWeiChengState(arg_3_0)
	local function var_3_0(arg_4_0)
		if arg_4_0.action.data then
			arg_3_0:setUiData(arg_4_0.action.data)
		end
	end

	cmgr.sendRequest(var_3_0, actions.getSpecialDInfo)
end

function var_0_1.getUiData(arg_5_0)
	local var_5_0 = {}

	local function var_5_1(arg_6_0, arg_6_1)
		arg_6_0[#arg_6_0 + 1] = arg_6_1

		return arg_6_1
	end

	var_5_0.background = {
		xcenter = 0,
		type = "pic",
		ycenter = -30,
		pic = "res/ui/nation/nationOtherBg.jpg",
		children = {}
	}

	var_5_1(var_5_0.background.children, {
		fontSize = 24,
		name = "text1",
		type = "label",
		anchorPointX = 0,
		y = 396,
		anchorPointY = 0.5,
		x = 310,
		text = language.get(95034),
		color = ccc3(204, 185, 134)
	})
	var_5_1(var_5_0.background.children, {
		fontSize = 20,
		name = "taskKill",
		type = "label",
		y = 396,
		text = language.get(490556, 0),
		color = ccc3(204, 185, 134),
		x = 795 + var_0_0.lan_490556_x
	})
	var_5_1(var_5_0.background.children, {
		x = 805,
		name = "isFinished",
		y = 380,
		type = "pic",
		visible = false,
		pic = "frame:tuzhang_yiwancheng.png"
	})
	var_5_1(var_5_0.background.children, {
		fontSize = 24,
		name = "text2",
		type = "label",
		anchorPointX = 0,
		y = 296,
		anchorPointY = 0.5,
		x = 310,
		text = language.get(95035),
		color = ccc3(204, 185, 134)
	})
	var_5_1(var_5_0.background.children, {
		x = 484,
		name = "title",
		type = "pic",
		pic = "frame:nationWeishangbang.png",
		y = 279 + var_0_0.nickNameY
	})
	var_5_1(var_5_0.background.children, {
		fontSize = 24,
		name = "rankText",
		type = "label",
		anchorPointX = 1,
		y = 296,
		anchorPointY = 0.5,
		x = 850,
		text = language.get(95036),
		color = ccc3(204, 185, 134)
	})
	var_5_1(var_5_0.background.children, {
		fontSize = 24,
		anchorPointX = 0,
		type = "label",
		anchorPointY = 0.5,
		x = 310,
		y = 218,
		text = language.get(95037),
		color = ccc3(204, 185, 134)
	})
	var_5_1(var_5_0.background.children, {
		x = 450,
		name = "taskKuangExp",
		y = 165,
		type = "pic",
		visible = false,
		pic = "frame:jianglikuang.png",
		children = {
			{
				x = 39.5,
				y = 39.5,
				pic = "res/ui/task/get_icon_exp.png",
				type = "pic"
			},
			{
				fontSize = 18,
				name = "taskExp",
				text = "0",
				type = "label",
				y = 19.5,
				x = 39.5,
				color = ccc3(255, 255, 255)
			}
		}
	})
	var_5_1(var_5_0.background.children, {
		x = 550,
		name = "taskKuangIron",
		y = 165,
		type = "pic",
		visible = false,
		pic = "frame:jianglikuang.png",
		children = {
			{
				x = 39.5,
				name = "taskKuangIronPic",
				y = 39.5,
				type = "pic",
				pic = "res/ui/task/get_icon_iron.png"
			},
			{
				fontSize = 18,
				name = "taskIron",
				text = "0",
				type = "label",
				y = 19.5,
				x = 39.5,
				color = ccc3(255, 255, 255)
			}
		}
	})
	var_5_1(var_5_0.background.children, {
		x = 650,
		name = "taskKuangWinExp",
		y = 165,
		type = "pic",
		visible = false,
		pic = "frame:jianglikuang.png",
		children = {
			{
				x = 39.5,
				y = 39.5,
				pic = "res/ui/task/get_icon_exp.png",
				type = "pic"
			},
			{
				fontSize = 18,
				name = "taskWinExp",
				text = "0",
				type = "label",
				y = 19.5,
				x = 39.5,
				color = ccc3(255, 255, 255)
			},
			{
				x = 20,
				y = 57,
				pic = "frame:nation_task_extra_icon1.png",
				type = "pic"
			}
		}
	})
	var_5_1(var_5_0.background.children, {
		x = 750,
		name = "taskKuangWinIron",
		y = 165,
		type = "pic",
		visible = false,
		pic = "frame:jianglikuang.png",
		children = {
			{
				x = 39.5,
				name = "taskKuangWinIronPic",
				y = 39.5,
				type = "pic",
				pic = "res/ui/task/get_icon_iron.png"
			},
			{
				fontSize = 18,
				name = "taskWinIron",
				text = "0",
				type = "label",
				y = 19.5,
				x = 39.5,
				color = ccc3(255, 255, 255)
			},
			{
				x = 20,
				y = 57,
				pic = "frame:nation_task_extra_icon1.png",
				type = "pic"
			}
		}
	})
	var_5_1(var_5_0.background.children, {
		x = 805,
		name = "isRewarded",
		y = 215,
		type = "pic",
		visible = false,
		pic = "frame:nation_task_draw.png"
	})
	var_5_1(var_5_0.background.children, {
		fontSize = 30,
		name = "taskNoReward",
		type = "label",
		y = 166,
		visible = true,
		x = 548,
		text = language.get(95038)
	})
	var_5_1(var_5_0.background.children, {
		top = 23,
		xcenter = 0,
		pic = "res/ui/nationTask/weicheng/wc_tit_wcrw.png",
		type = "pic"
	})
	var_5_1(var_5_0.background.children, {
		x = 150,
		name = "daojishi",
		y = 392,
		type = "pic",
		pic = "frame:nation_sma_view_bg.png",
		children = {
			{
				xcenter = 0,
				height = 0,
				type = "label",
				ycenter = 0,
				fontSize = 22,
				width = 200,
				text = language.get(490550)
			}
		}
	})
	var_5_1(var_5_0.background.children, {
		x = 152,
		name = "taskMap",
		y = 247,
		type = "pic",
		pic = "frame:nationMap.png"
	})
	var_5_1(var_5_0.background.children, {
		type = "button",
		buttons = {
			{
				pic2 = "frame:btn2_gre_c.png",
				name = "drawReward",
				pic1 = "frame:btn2_gre_a.png",
				y = 44,
				visible = false,
				x = 778,
				children = {
					{
						fontSize = 20,
						y = 27,
						type = "label",
						x = 62.5,
						text = language.get(95047)
					}
				}
			}
		}
	})

	var_5_0.background2 = {
		xcenter = 0,
		type = "pic",
		ycenter = -30,
		pic = "res/ui/nation/nationOtherBg.jpg",
		children = {}
	}

	var_5_1(var_5_0.background2.children, {
		top = 23,
		xcenter = 0,
		pic = "res/ui/nationTask/weicheng/wc_tit_zbmm.png",
		type = "pic"
	})
	var_5_1(var_5_0.background2.children, {
		xcenter = 0,
		name = "donateEventPic",
		y = 291,
		type = "pic",
		pic = "res/ui/nationTask/weicheng/p1.jpg"
	})
	var_5_1(var_5_0.background2.children, {
		fontSize = 28,
		y = 220,
		type = "label",
		left = 50,
		text = language.get(490551),
		color = ccc3(255, 255, 255)
	})
	var_5_1(var_5_0.background2.children, {
		fontSize = 22,
		y = 170,
		type = "label",
		left = 50,
		text = language.get(490552),
		color = ccc3(204, 185, 134)
	})
	var_5_1(var_5_0.background2.children, {
		xcenter = 0,
		name = "donateProgressBg",
		y = 115,
		type = "pic",
		pic = "frame:invest_degr_view_new.png",
		children = {
			{
				xcenter = 0,
				name = "donateProgess",
				percentage = 50,
				type = "process",
				ycenter = 0,
				pic = "frame:invest_degr_shu_new.jpg"
			},
			{
				xcenter = 0,
				ycenter = 0,
				pic = "frame:invest_degr_up_new.png",
				type = "pic"
			},
			{
				fontSize = 24,
				name = "donateInfo",
				text = "0/100",
				type = "label",
				xcenter = 0,
				ycenter = 0,
				color = ccc3(255, 255, 255)
			}
		}
	})
	var_5_1(var_5_0.background2.children, {
		x = 670,
		name = "donateSilverIcon",
		y = 50,
		type = "pic",
		pic = "frame:silver.png"
	})
	var_5_1(var_5_0.background2.children, {
		fontSize = 18,
		name = "donateCost",
		type = "label",
		anchorPointX = 0,
		width = 177,
		text = "0",
		y = 50,
		x = 695,
		color = ccc3(255, 255, 255)
	})
	var_5_1(var_5_0.background2.children, {
		type = "button",
		buttons = {
			{
				pic2 = "frame:btn_default_lighted.png",
				name = "donateButton",
				pic1 = "frame:btn_default_normal.png",
				y = 50,
				x = 815
			}
		}
	})
	var_5_1(var_5_0.background2.children, {
		fontSize = 20,
		name = "donateButtonText",
		type = "label",
		y = 50,
		x = 815,
		text = language.get(94006)
	})

	return var_5_0
end

function var_0_1.setUiData(arg_7_0, arg_7_1)
	if arg_7_1.serial < 3 then
		arg_7_0.uiTable.background:setVisible(true)
		arg_7_0.uiTable.background2:setVisible(false)

		if arg_7_1.curCityNum then
			require("lua/layer/task/control")
			arg_7_0.uiTable.taskKill:setString(language.get(490556, taskControl.bstask.defCityNum))
		end

		if arg_7_1.endTime and arg_7_1.endTime > 0 then
			local var_7_0 = createTimerLabel(arg_7_1.endTime, "@H:@M:@S", "Thonburi-bold", 24, nil, nil, nil, ccc3(255, 248, 197))

			arg_7_0.uiTable.daojishi:removeChildByTag(2345, true)
			arg_7_0.uiTable.daojishi:addChild(var_7_0, 100, 2345)

			local var_7_1 = arg_7_0.uiTable.daojishi:getContentSize().width

			var_7_0:setPosition(ccp(var_7_1 / 2, -15))
			arg_7_0:setNationMap(arg_7_1)
		end

		arg_7_0:setchenghao(arg_7_1)
		arg_7_0:setweichengJiangli(arg_7_1)
		arg_7_0:setTaskDetail(arg_7_1)
	else
		arg_7_0.uiTable.background:setVisible(false)
		arg_7_0.uiTable.background2:setVisible(true)
		arg_7_0:setZhaoBingMaiMa(arg_7_1)
	end
end

function var_0_1.setchenghao(arg_8_0, arg_8_1)
	log.info("围城称号")

	arg_8_1.titlePic = arg_8_1.titlePic or "chenghao1"

	arg_8_0.uiTable.title:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(arg_8_1.titlePic .. ".png"))

	if arg_8_1.rank and arg_8_0.uiTable.rankText then
		arg_8_0.uiTable.rankText:setString(language.get(95026) .. arg_8_1.rank)
	end
end

function var_0_1.setweichengJiangli(arg_9_0, arg_9_1)
	log.info("围城奖励显示")
	showTable(arg_9_1)

	if arg_9_1.hasTitleRewards and arg_9_1.hasTitleRewards == true then
		arg_9_0.uiTable.taskNoReward:setVisible(false)

		if arg_9_1.rewards then
			if arg_9_1.rewards[1] then
				arg_9_0.uiTable.taskExp:setString(arg_9_1.rewards[1].value)
				arg_9_0.uiTable.taskKuangExp:setVisible(true)
			end

			if arg_9_1.rewards[2] then
				arg_9_0.uiTable.taskIron:setString(arg_9_1.rewards[2].value)
				arg_9_0.uiTable.taskKuangIron:setVisible(true)

				if arg_9_1.rewards[2].type == 17 then
					arg_9_0.uiTable.taskKuangIronPic:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/task/get_icon_gem.png"))
				else
					arg_9_0.uiTable.taskKuangIronPic:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/task/get_icon_iron.png"))
				end
			end
		end

		if arg_9_1.extraRewards then
			if arg_9_1.extraRewards[1] then
				arg_9_0.uiTable.taskWinExp:setString(arg_9_1.extraRewards[1].value)
				arg_9_0.uiTable.taskKuangWinExp:setVisible(true)

				if arg_9_1.haveExtraRewards and arg_9_1.haveExtraRewards == true then
					-- block empty
				else
					tool.spriteToGray(arg_9_0.uiTable.taskKuangWinExp, true)
				end
			end

			if arg_9_1.extraRewards[2] then
				arg_9_0.uiTable.taskWinIron:setString(arg_9_1.extraRewards[2].value)
				arg_9_0.uiTable.taskKuangWinIron:setVisible(true)

				if arg_9_1.extraRewards[2].type == 17 then
					arg_9_0.uiTable.taskKuangWinIronPic:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/task/get_icon_gem.png"))
				else
					arg_9_0.uiTable.taskKuangWinIronPic:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/task/get_icon_iron.png"))
				end

				if arg_9_1.haveExtraRewards and arg_9_1.haveExtraRewards == true then
					-- block empty
				else
					tool.spriteToGray(arg_9_0.uiTable.taskKuangWinIron, true)
				end
			end
		end
	else
		arg_9_0.uiTable.taskNoReward:setVisible(true)
		arg_9_0.uiTable.taskKuangExp:setVisible(false)
		arg_9_0.uiTable.taskKuangIron:setVisible(false)
		arg_9_0.uiTable.taskKuangWinExp:setVisible(false)
		arg_9_0.uiTable.taskKuangWinIron:setVisible(false)
	end

	if arg_9_1.hasRewarded and arg_9_1.hasRewarded == true and arg_9_0.uiTable.isRewarded then
		arg_9_0.uiTable.isRewarded:setVisible(true)
	else
		arg_9_0.uiTable.isRewarded:setVisible(false)
	end

	if arg_9_1.canGotRewards and arg_9_1.canGotRewards == true then
		if arg_9_1.isWin and arg_9_1.isWin == true and arg_9_0.uiTable.isFinished then
			arg_9_0.uiTable.isFinished:setVisible(true)
			arg_9_0.uiTable.isFinished:setDisplayFrame(tool.spriteFrameByName("tuzhang_yiwancheng.png"))
		else
			arg_9_0.uiTable.isFinished:setVisible(true)
			arg_9_0.uiTable.isFinished:setDisplayFrame(tool.spriteFrameByName("nation_task_defe.png"))
		end
	else
		arg_9_0.uiTable.isFinished:setVisible(false)
	end

	if arg_9_1.canGotRewards and arg_9_1.canGotRewards == true and arg_9_1.hasRewarded ~= true then
		arg_9_0.uiTable.drawReward:setVisible(true)
		arg_9_0.uiTable.drawReward:registerScriptTapHandler(function()
			log.info("QQQ:getreward！")

			local function var_10_0(arg_11_0)
				showTable(arg_11_0)
				log.info("bstask reward success")

				if arg_11_0.action.data.rewards then
					local var_11_0 = {}

					for iter_11_0, iter_11_1 in pairs(arg_11_0.action.data.rewards) do
						var_11_0[iter_11_0] = {}

						if iter_11_1.type == 4 then
							var_11_0[iter_11_0].id = 4
						elseif iter_11_1.type == 17 then
							var_11_0[iter_11_0].id = 7
						else
							var_11_0[iter_11_0].id = 6
						end

						var_11_0[iter_11_0].value = iter_11_1.value
					end

					globalAction_gotResource(var_11_0)
				end

				arg_9_0:getWeiChengState()
				eventManager.dispatchEvent("weichengGetReward")
			end

			cmgr.sendRequest(var_10_0, actions.getBsTaskReward, arg_9_1.serial)
		end)
	else
		arg_9_0.uiTable.drawReward:setVisible(false)
	end
end

function var_0_1.setTaskDetail(arg_12_0, arg_12_1)
	log.info("显示围城具体任务")

	local function var_12_0(arg_13_0)
		if arg_13_0 == 1 then
			return language.get(95016)
		elseif arg_13_0 == 2 then
			return language.get(95017)
		elseif arg_13_0 == 3 then
			return language.get(95018)
		end

		return "#"
	end

	local function var_12_1(arg_14_0, arg_14_1)
		local var_14_0 = CCSprite:create("res/ui/kfsy/150150.png")
		local var_14_1 = CCSprite:create("res/ui/kfsy/150150.png")

		var_14_0:setScale(0.3)
		var_14_1:setScale(0.3)

		local var_14_2 = CCMenuItemSprite:create(var_14_0, var_14_1)

		var_14_2:registerScriptTapHandler(function()
			smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
			loadingLayer.show(SCENE_WORLD, arg_14_1)
		end)
		var_14_2:setEnabled(true)

		local var_14_3 = CCMenu:create()

		var_14_3:addChild(var_14_2, 15)
		var_14_3:alignItemsVertically()
		var_14_3:setPosition(ccp(arg_14_0:getContentSize().width / 2, arg_14_0:getContentSize().height / 2))
		arg_14_0:addChild(var_14_3)
	end

	local var_12_2 = {}
	local var_12_3 = ccc3(13, 13, 13)
	local var_12_4 = ccc3(204, 185, 134)
	local var_12_5 = ccc3(0, 255, 0)

	if user.player.forceId == arg_12_1.attForceId then
		if arg_12_1.serial == 1 then
			log.info("AAAAAAAAAAAAA")

			local var_12_6 = CCStrokeLabelTTF:create(language.get(490544, var_12_0(arg_12_1.defForceId)), "Thonburi", 20, 1, var_12_3)
			local var_12_7 = CCStrokeLabelTTF:create(arg_12_1.target, "Thonburi", 20, 1, var_12_3)
			local var_12_8 = CCStrokeLabelTTF:create(language.get(490545), "Thonburi", 20, 1, var_12_3)
			local var_12_9 = CCStrokeLabelTTF:create(arg_12_1.supportTarget1Name, "Thonburi", 24, 1, var_12_3)

			var_12_6:setColor(var_12_4)
			var_12_7:setColor(var_12_5)
			var_12_8:setColor(var_12_4)
			var_12_9:setColor(var_12_5)
			table.insert(var_12_2, var_12_6)
			table.insert(var_12_2, var_12_7)
			table.insert(var_12_2, var_12_8)
			table.insert(var_12_2, var_12_9)
			var_12_1(var_12_9, arg_12_1.supportTarget1)
		elseif arg_12_1.serial == 2 then
			local var_12_10 = CCStrokeLabelTTF:create(language.get(490548, var_12_0(arg_12_1.defForceId)), "Thonburi", 20, 1, var_12_3)
			local var_12_11 = CCStrokeLabelTTF:create(arg_12_1.target, "Thonburi", 20, 1, var_12_3)
			local var_12_12 = CCStrokeLabelTTF:create(language.get(490545), "Thonburi", 20, 1, var_12_3)
			local var_12_13 = CCStrokeLabelTTF:create(arg_12_1.supportTarget1Name, "Thonburi", 24, 1, var_12_3)
			local var_12_14 = CCStrokeLabelTTF:create(language.get(490546), "Thonburi", 20, 1, var_12_3)
			local var_12_15 = CCStrokeLabelTTF:create(arg_12_1.supportTarget2Name, "Thonburi", 24, 1, var_12_3)

			var_12_10:setColor(var_12_4)
			var_12_11:setColor(var_12_5)
			var_12_12:setColor(var_12_4)
			var_12_13:setColor(var_12_5)
			var_12_14:setColor(var_12_4)
			var_12_15:setColor(var_12_5)
			table.insert(var_12_2, var_12_10)
			table.insert(var_12_2, var_12_11)
			table.insert(var_12_2, var_12_12)
			table.insert(var_12_2, var_12_13)
			table.insert(var_12_2, var_12_14)
			table.insert(var_12_2, var_12_15)
			var_12_1(var_12_13, arg_12_1.supportTarget1)
			var_12_1(var_12_15, arg_12_1.supportTarget2)
		end
	elseif user.player.forceId == arg_12_1.defForceId then
		if arg_12_1.serial == 1 then
			log.info("BBBBBBBBBBBBBBBB")

			local var_12_16 = CCStrokeLabelTTF:create(language.get(490542, var_12_0(arg_12_1.attForceId)), "Thonburi", 20, 1, var_12_3)
			local var_12_17 = CCStrokeLabelTTF:create(arg_12_1.target, "Thonburi", 20, 1, var_12_3)
			local var_12_18 = CCStrokeLabelTTF:create(language.get(490543), "Thonburi", 20, 1, var_12_3)

			var_12_16:setColor(var_12_4)
			var_12_17:setColor(var_12_5)
			var_12_18:setColor(var_12_4)
			table.insert(var_12_2, var_12_16)
			table.insert(var_12_2, var_12_17)
			table.insert(var_12_2, var_12_18)
		elseif arg_12_1.serial == 2 then
			local var_12_19 = CCStrokeLabelTTF:create(language.get(490549, var_12_0(arg_12_1.attForceId)), "Thonburi", 20, 1, var_12_3)
			local var_12_20 = CCStrokeLabelTTF:create(arg_12_1.target, "Thonburi", 20, 1, var_12_3)
			local var_12_21 = CCStrokeLabelTTF:create(language.get(490543), "Thonburi", 20, 1, var_12_3)

			var_12_19:setColor(var_12_4)
			var_12_20:setColor(var_12_5)
			var_12_21:setColor(var_12_4)
			table.insert(var_12_2, var_12_19)
			table.insert(var_12_2, var_12_20)
			table.insert(var_12_2, var_12_21)
		end
	elseif user.player.forceId == arg_12_1.supportForceId then
		if arg_12_1.serial == 1 then
			log.info("CCCCCCCCCCCCCC")

			local var_12_22 = CCStrokeLabelTTF:create(language.get(490540), "Thonburi", 20, 1, var_12_3)
			local var_12_23 = CCStrokeLabelTTF:create(arg_12_1.supportTarget1Name, "Thonburi", 24, 1, var_12_3)
			local var_12_24 = CCStrokeLabelTTF:create(language.get(490541, var_12_0(arg_12_1.attForceId), var_12_0(arg_12_1.defForceId)), "Thonburi", 20, 1, var_12_3)

			var_12_22:setColor(var_12_4)
			var_12_23:setColor(var_12_5)
			var_12_24:setColor(var_12_4)
			table.insert(var_12_2, var_12_22)
			table.insert(var_12_2, var_12_23)
			table.insert(var_12_2, var_12_24)
			var_12_1(var_12_23, arg_12_1.supportTarget1)
		elseif arg_12_1.serial == 2 then
			local var_12_25 = CCStrokeLabelTTF:create(language.get(490540), "Thonburi", 20, 1, var_12_3)
			local var_12_26 = CCStrokeLabelTTF:create(arg_12_1.supportTarget1Name, "Thonburi", 24, 1, var_12_3)
			local var_12_27 = CCStrokeLabelTTF:create(language.get(490547), "Thonburi", 20, 1, var_12_3)
			local var_12_28 = CCStrokeLabelTTF:create(arg_12_1.supportTarget2Name, "Thonburi", 24, 1, var_12_3)
			local var_12_29 = CCStrokeLabelTTF:create(language.get(490541, var_12_0(arg_12_1.attForceId), var_12_0(arg_12_1.defForceId)), "Thonburi", 20, 1, var_12_3)

			var_12_25:setColor(var_12_4)
			var_12_26:setColor(var_12_5)
			var_12_27:setColor(var_12_4)
			var_12_28:setColor(var_12_5)
			var_12_29:setColor(var_12_4)
			table.insert(var_12_2, var_12_25)
			table.insert(var_12_2, var_12_26)
			table.insert(var_12_2, var_12_27)
			table.insert(var_12_2, var_12_28)
			table.insert(var_12_2, var_12_29)
			var_12_1(var_12_26, arg_12_1.supportTarget1)
			var_12_1(var_12_28, arg_12_1.supportTarget2)
		end
	end

	local var_12_30 = createRichNode2(var_12_2, 0.5, nil, 400)

	arg_12_0.uiTable.background:removeChildByTag(1234, true)
	arg_12_0.uiTable.background:addChild(var_12_30, 100, 1234)
	var_12_30:setPosition(ccp(580, 362))
end

function var_0_1.setNationMap(arg_16_0, arg_16_1)
	log.info("围城：缩略图")
	require("lua/layer/world/control")

	if worldControl.cities and arg_16_0.uiTable.taskMap then
		local var_16_0 = tool.split(worldControl.cities, "#")
		local var_16_1 = 48
		local var_16_2 = 79
		local var_16_3 = 191
		local var_16_4 = 123

		for iter_16_0, iter_16_1 in pairs(var_16_0) do
			local var_16_5 = tool.split(iter_16_1, "|")

			if tonumber(var_16_5[1]) > 0 then
				local var_16_6 = worldConstant.BUILDING_INFO["world_building_" .. tonumber(var_16_5[1])]
				local var_16_7 = var_16_6.x + 90.5
				local var_16_8 = 3600 - var_16_6.y - 64
				local var_16_9 = var_16_7 / 6000 * var_16_3
				local var_16_10 = var_16_8 / 3600 * var_16_4
				local var_16_11

				if tonumber(var_16_5[2]) == 1 then
					var_16_11 = "nation_map_wei.png"
				elseif tonumber(var_16_5[2]) == 2 then
					var_16_11 = "nation_map_shu.png"
				elseif tonumber(var_16_5[2]) == 3 then
					var_16_11 = "nation_map_wu.png"
				end

				if var_16_11 ~= nil then
					local var_16_12 = CCSprite:createWithSpriteFrameName(var_16_11)

					var_16_12:setPosition(ccp(var_16_1 + var_16_9, var_16_2 + var_16_10))
					arg_16_0.uiTable.taskMap:addChild(var_16_12)
				end
			end
		end
	end
end

function var_0_1.setZhaoBingMaiMa(arg_17_0, arg_17_1)
	arg_17_0.uiTable.donateButton:registerScriptTapHandler(function()
		log.info("QQQ:getinvest！")

		local function var_18_0(arg_19_0)
			showTable(arg_19_0)
			log.info("bstask invest success")

			if arg_19_0.action.data.exp then
				local var_19_0 = {
					{}
				}

				var_19_0[1].id = 6
				var_19_0[1].value = arg_19_0.action.data.exp

				globalAction_gotResource(var_19_0)
			end

			arg_17_0:getWeiChengState()
		end

		cmgr.sendRequest(var_18_0, actions.investBsMoney)
	end)
	arg_17_0.uiTable.donateCost:setString(arg_17_1.copper)
	arg_17_0.uiTable.donateInfo:setString(arg_17_1.investTotal .. "/" .. arg_17_1.investMax)
	arg_17_0.uiTable.donateProgess:setPercentage(arg_17_1.investTotal * 100 / arg_17_1.investMax)
end

function var_0_1.onEnter(arg_20_0)
	return
end

function var_0_1.onExit(arg_21_0)
	return
end

return var_0_1
