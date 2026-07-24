local var_0_0 = require("res/native/offset").get("layer.nation.buildNation.jiangguodaye.buildNationMain.prepare")
local var_0_1 = class("buildNationLayer", function()
	return createBaseLayer()
end)
local var_0_2 = 0
local var_0_3 = 0

function var_0_1.ctor(arg_2_0)
	rmgr.loadResource("res/ui/rankInfo/DailyFeatView/DailyFeatView.plist")
	arg_2_0:initUiData()

	arg_2_0.uiTable = autoUI.initUI(arg_2_0, arg_2_0.data)
	arg_2_0.indivRewardTable = autoUI.initUI(arg_2_0.uiTable.indivRewardBg, arg_2_0:getRewardData())

	arg_2_0:refineLayout()
	arg_2_0:getWeiChengState()
	arg_2_0.uiTable.btn_reward_indiv:registerScriptTapHandler(function()
		local function var_3_0(arg_4_0)
			local var_4_0 = arg_4_0.action.data

			if var_4_0.rewards then
				local var_4_1 = {}
				local var_4_2 = 1

				for iter_4_0, iter_4_1 in pairs(var_4_0.rewards) do
					var_4_1[var_4_2] = {}

					if iter_4_1.type == 21 then
						var_4_1[var_4_2].id = 7
					elseif iter_4_1.type == 4 then
						var_4_1[var_4_2].id = 4
					elseif iter_4_1.type == 5 then
						var_4_1[var_4_2].id = 6
					elseif iter_4_1.type == 116 then
						var_4_1[var_4_2].id = 55
					else
						var_4_1[var_4_2].id = iter_4_1.type
					end

					var_4_1[var_4_2].value = iter_4_1.num
					var_4_1[var_4_2].gemLevel = iter_4_1.lv or 1
					var_4_2 = var_4_2 + 1
				end

				globalAction_gotResource(var_4_1)
				arg_2_0:getWeiChengState()
			end
		end

		cmgr.sendRequest(var_3_0, actions.getBuildNationReward, var_0_2)
	end)
	arg_2_0.uiTable.btn_reward_yinbi:registerScriptTapHandler(function()
		local function var_5_0(arg_6_0)
			arg_2_0:getWeiChengState()
		end

		cmgr.sendRequest(var_5_0, actions.buildNationInvest, 0)
	end)
	arg_2_0.uiTable.btn_reward_mutou:registerScriptTapHandler(function()
		local function var_7_0(arg_8_0)
			arg_2_0:getWeiChengState()
		end

		cmgr.sendRequest(var_7_0, actions.buildNationInvest, 1)
	end)
	arg_2_0.uiTable.jump_world_btn:registerScriptTapHandler(function()
		smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
		loadingLayer.show(SCENE_WORLD, var_0_3)
	end)
end

function var_0_1.getWeiChengState(arg_10_0)
	local function var_10_0(arg_11_0)
		if arg_11_0.action.data then
			arg_10_0:setUiData(arg_11_0.action.data)
		end
	end

	cmgr.sendRequest(var_10_0, actions.getBuildNationTaskInfo)
end

function var_0_1.initUiData(arg_12_0)
	local function var_12_0(arg_13_0, arg_13_1)
		arg_13_0[#arg_13_0 + 1] = arg_13_1

		return arg_13_1
	end

	arg_12_0.data = {}
	arg_12_0.data.background = {
		xcenter = 0,
		type = "pic",
		ycenter = -20,
		pic = "res/ui/nation/renwudi.jpg",
		children = {}
	}

	var_12_0(arg_12_0.data.background.children, {
		xcenter = 0,
		name = "gongshou_title",
		type = "pic",
		top = 23,
		pic = "res/ui/nation/buildNation/mainTask/jgdy_gcqz_title.png"
	})
	var_12_0(arg_12_0.data.background.children, {
		x = 165,
		name = "daojishi",
		y = 392,
		type = "pic",
		pic = "frame:nation_sma_view_bg.png",
		children = {
			{
				fontSize = 22,
				name = "daojishi_name",
				type = "label",
				ycenter = 0,
				xcenter = 0,
				text = language.get(490550)
			}
		}
	})
	var_12_0(arg_12_0.data.background.children, {
		x = 167,
		name = "taskMap",
		y = 247,
		type = "pic",
		pic = "frame:nationMap.png"
	})
	var_12_0(arg_12_0.data.background.children, {
		x = 358,
		name = "choubeijunzi_bg",
		y = 415,
		type = "pic",
		visible = false,
		pic = "res/ui/nationTask/newPic/rwyh_icon01.png",
		children = {
			{
				anchorPointX = 0,
				x = 35,
				type = "pic_9",
				anchorPointY = 1,
				pic = "res/ui/nationTask/newPic/rwyh_small_bg.png",
				y = 70,
				middleRect = CCRectMake(0, 20, 565, 28),
				preferedSize = CCSizeMake(565, 250)
			},
			{
				x = 0,
				anchorPointX = 0,
				y = 5,
				type = "pic",
				scale = 0.85,
				pic = "res/ui/nation/buildNation/mainTask/jgdy_view_d01.png"
			},
			{
				fontSize = 22,
				name = "choubeijunzi",
				stroke = false,
				anchorPointX = 0,
				type = "label",
				y = 40,
				x = 75,
				text = language.get("220955_buildNation"),
				color = ccc3(204, 185, 134)
			},
			{
				name = "choubeijunzi_detail",
				stroke = false,
				anchorPointX = 0,
				type = "label",
				height = 0,
				x = 75,
				y = 5,
				anchorPointY = 1,
				width = 400,
				text = language.get("220970_buildNation"),
				fontSize = 22 + (var_0_0.choubeiDetailFntSize or 0),
				color = ccc3(204, 185, 134)
			},
			{
				x = 30,
				z = 300,
				y = -85,
				type = "pic",
				anchorPointX = 0,
				pic = "frame:res_icon_1.png"
			},
			{
				x = 50,
				anchorPointX = 0,
				y = -85,
				type = "pic",
				scale = 0.75,
				pic = "frame:guojiajingdudi1.png"
			},
			{
				anchorPointX = 0,
				name = "process_yinbi",
				x = 50,
				type = "process",
				y = -85,
				scale = 0.75,
				pic = "frame:guojiajingdutiao1_4.png"
			},
			{
				fontSize = 22,
				name = "num_choubei",
				text = "0/0",
				type = "label",
				y = -85,
				x = 230
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/common/button/public_btn_green_c.png",
						name = "btn_reward_yinbi",
						pic1 = "res/ui/common/button/public_btn_green.png",
						y = -85,
						scale = 0.8,
						x = 480
					}
				}
			},
			{
				fontSize = 20,
				name = "btn_reward_yinbi_word",
				type = "label",
				y = -85,
				scale = 1.2,
				x = 480,
				text = language.get(90003)
			},
			{
				x = 30,
				z = 300,
				y = -135,
				type = "pic",
				anchorPointX = 0,
				pic = "frame:res_icon_2.png"
			},
			{
				x = 50,
				anchorPointX = 0,
				y = -135,
				type = "pic",
				scale = 0.75,
				pic = "frame:guojiajingdudi1.png"
			},
			{
				anchorPointX = 0,
				name = "process_mutou",
				x = 50,
				type = "process",
				y = -135,
				scale = 0.75,
				pic = "frame:guojiajingdutiao1_4.png"
			},
			{
				fontSize = 22,
				name = "num_choubei2",
				text = "0/0",
				type = "label",
				y = -135,
				x = 230
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/common/button/public_btn_green_c.png",
						name = "btn_reward_mutou",
						pic1 = "res/ui/common/button/public_btn_green.png",
						y = -135,
						scale = 0.8,
						x = 480
					}
				}
			},
			{
				fontSize = 20,
				name = "btn_reward_mutou_word",
				type = "label",
				y = -135,
				scale = 1.2,
				x = 480,
				text = language.get(90003)
			}
		}
	})
	var_12_0(arg_12_0.data.background.children, {
		x = 358,
		name = "gongchengqianzuo_bg",
		y = 415,
		type = "pic",
		visible = false,
		pic = "res/ui/nationTask/newPic/rwyh_icon01.png",
		children = {
			{
				anchorPointX = 0,
				x = 35,
				type = "pic_9",
				anchorPointY = 1,
				pic = "res/ui/nationTask/newPic/rwyh_small_bg.png",
				y = 70,
				middleRect = CCRectMake(0, 20, 565, 28),
				preferedSize = CCSizeMake(565, 250)
			},
			{
				x = 0,
				anchorPointX = 0,
				y = 5,
				type = "pic",
				scale = 1,
				pic = "res/ui/nation/buildNation/mainTask/jgdy_view_d01.png"
			},
			{
				fontSize = 22,
				name = "gongchengqianzuo",
				stroke = false,
				anchorPointX = 0,
				type = "label",
				y = 40,
				x = 75,
				text = language.get("220956_buildNation"),
				color = ccc3(204, 185, 134)
			},
			{
				fontSize = 22,
				name = "gongchengqianzuo_detail",
				stroke = false,
				anchorPointX = 0,
				type = "label",
				height = 0,
				x = 75,
				y = 5,
				width = 400,
				text = language.get("220971_buildNation", 100),
				color = ccc3(204, 185, 134)
			},
			{
				anchorPointX = 0,
				name = "process_bg",
				x = 75,
				type = "pic",
				y = -30,
				scale = 0.75,
				pic = "frame:guojiajingdudi1.png"
			},
			{
				anchorPointX = 0,
				name = "process_chengchi",
				x = 75,
				type = "process",
				y = -30,
				scale = 0.75,
				pic = "frame:guojiajingdutiao1_4.png"
			},
			{
				fontSize = 22,
				name = "num_chengchi",
				text = "0/0",
				type = "label",
				y = -30,
				x = 255
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/kfsy/150150.png",
						name = "jump_world_btn",
						pic1 = "res/ui/kfsy/150150.png",
						y = -30,
						x = 120
					}
				}
			},
			{
				name = "jump_world_btn_word",
				fontSize = 22,
				type = "label",
				y = -30,
				x = 120,
				text = language.get("221000_buildNation"),
				color = ccc3(0, 255, 0)
			},
			{
				x = 0,
				anchorPointX = 0,
				y = -70,
				type = "pic",
				pic = "res/ui/nation/buildNation/mainTask/rwyh_icon04.png"
			},
			{
				anchorPointX = 0,
				name = "taskNoStart",
				x = 105,
				type = "pic",
				y = -105,
				pic = "res/ui/nation/buildNation/mainTask/jgdy_word_rwswkq.png"
			},
			{
				name = "gongxian",
				anchorPointX = 0,
				type = "label",
				fontSize = 22,
				x = 75,
				y = -85,
				text = language.get("220958_buildNation"),
				color = ccc3(204, 185, 134)
			},
			{
				anchorPointX = 0,
				name = "gongcheng",
				x = 70,
				type = "pic",
				y = -130,
				pic = "frame:DailyFeatView_city_icon_normal.png",
				children = {
					{
						x = 0,
						anchorPointX = 0,
						type = "pic",
						ycenter = -5,
						pic = "res/ui/nation/buildNation/mainTask/jgdy_gccb_bg.png"
					},
					{
						name = "gongcheng_num",
						anchorPointX = 0,
						type = "label",
						fontSize = 20,
						x = 60,
						ycenter = -1,
						text = language.get("220972_buildNation", 0),
						color = ccc3(204, 185, 134)
					}
				}
			},
			{
				anchorPointX = 0,
				name = "shadi",
				x = 220,
				type = "pic",
				y = -130,
				pic = "frame:DailyFeatView_kill_icon_normal.png",
				children = {
					{
						x = 0,
						anchorPointX = 0,
						type = "pic",
						ycenter = -5,
						pic = "res/ui/nation/buildNation/mainTask/jgdy_gccb_bg.png"
					},
					{
						name = "shadi_num",
						anchorPointX = 0,
						type = "label",
						fontSize = 20,
						x = 60,
						ycenter = -1,
						text = language.get("220973_buildNation", 0),
						color = ccc3(204, 185, 134)
					}
				}
			},
			{
				anchorPointX = 0,
				name = "paihang",
				x = 390,
				type = "pic",
				y = -130,
				pic = "frame:DailyFeatView_flag_icon_normal.png",
				children = {
					{
						x = 0,
						anchorPointX = 0,
						type = "pic",
						ycenter = -5,
						pic = "res/ui/nation/buildNation/mainTask/jgdy_gccb_bg.png"
					},
					{
						name = "paihang_num",
						anchorPointX = 0,
						type = "label",
						fontSize = 20,
						x = 60,
						ycenter = -1,
						text = language.get("220974_buildNation", 0),
						color = ccc3(204, 185, 134)
					}
				}
			}
		}
	})
	var_12_0(arg_12_0.data.background.children, {
		x = 358,
		name = "indiv_reward_bg",
		y = 175,
		type = "pic",
		pic = "res/ui/nationTask/newPic/rwyh_icon03.png",
		children = {
			{
				anchorPointX = 0,
				name = "indivRewardBg",
				type = "pic_9",
				pic = "res/ui/nationTask/newPic/rwyh_jl_bg.png",
				y = 70,
				anchorPointY = 1,
				x = -15,
				middleRect = CCRectMake(0, 20, 589, 112),
				preferedSize = CCSizeMake(600, 150),
				children = {
					{
						xcenter = 0,
						name = "myChenghao",
						z = 1000,
						type = "pic",
						ycenter = 0,
						pic = "frame:chenghao1.png"
					}
				}
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "res/ui/common/button/public_btn_green_c.png",
						name = "btn_reward_indiv",
						pic1 = "res/ui/common/button/public_btn_green.png",
						y = -105,
						visible = false,
						x = 480,
						children = {
							{
								fontSize = 20,
								y = 31,
								type = "label",
								x = 97.5,
								text = language.get(95047)
							}
						}
					}
				}
			}
		}
	})
end

function var_0_1.setUiData(arg_14_0, arg_14_1)
	var_0_2 = arg_14_1.taskId or arg_14_1.type

	if arg_14_1.type == 1 then
		arg_14_0.uiTable.choubeijunzi_bg:setVisible(true)
		arg_14_0.uiTable.gongchengqianzuo_bg:setVisible(false)
		arg_14_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/mainTask/jgdy_cbjz_title.png"):displayFrame())

		if arg_14_1.Copper then
			arg_14_0.uiTable.num_choubei:setString(language.get(75021, math.floor(arg_14_1.Copper.nowNum / 10000)) .. "/" .. language.get(75021, math.floor(arg_14_1.Copper.requestNum / 10000)))
			arg_14_0.uiTable.process_yinbi:setPercentage(arg_14_1.Copper.nowNum * 100 / arg_14_1.Copper.requestNum)

			if arg_14_1.Copper.nowNum < arg_14_1.Copper.requestNum then
				arg_14_0.uiTable.btn_reward_yinbi:setVisible(true)
				arg_14_0.uiTable.btn_reward_yinbi_word:setVisible(true)
			else
				arg_14_0.uiTable.btn_reward_yinbi:setVisible(false)
				arg_14_0.uiTable.btn_reward_yinbi_word:setVisible(false)
			end
		end

		if arg_14_1.lumber then
			arg_14_0.uiTable.num_choubei2:setString(language.get(75021, math.floor(arg_14_1.lumber.nowNum / 10000)) .. "/" .. language.get(75021, math.floor(arg_14_1.lumber.requestNum / 10000)))
			arg_14_0.uiTable.process_mutou:setPercentage(arg_14_1.lumber.nowNum * 100 / arg_14_1.lumber.requestNum)

			if arg_14_1.lumber.nowNum < arg_14_1.lumber.requestNum then
				arg_14_0.uiTable.btn_reward_mutou:setVisible(true)
				arg_14_0.uiTable.btn_reward_mutou_word:setVisible(true)
			else
				arg_14_0.uiTable.btn_reward_mutou:setVisible(false)
				arg_14_0.uiTable.btn_reward_mutou_word:setVisible(false)
			end
		end
	elseif arg_14_1.type == 2 then
		arg_14_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/mainTask/jgdy_gcqz_title.png"):displayFrame())
		arg_14_0.uiTable.choubeijunzi_bg:setVisible(false)
		arg_14_0.uiTable.gongchengqianzuo_bg:setVisible(true)
		arg_14_0.uiTable.gongchengqianzuo:setString(language.get("220956_buildNation"))
		arg_14_0.uiTable.process_bg:setVisible(true)
		arg_14_0.uiTable.process_chengchi:setVisible(true)
		arg_14_0.uiTable.num_chengchi:setVisible(true)
		arg_14_0.uiTable.jump_world_btn:setVisible(false)
		arg_14_0.uiTable.jump_world_btn_word:setVisible(false)

		if arg_14_1.zhancheng then
			if arg_14_1.state == -1 then
				arg_14_0.uiTable.gongchengqianzuo_detail:setString(language.get("220971_buildNation", arg_14_1.zhancheng.requestNum))
			else
				arg_14_0.uiTable.gongchengqianzuo_detail:setString(language.get("221001_buildNation", arg_14_1.zhancheng.requestNum))
			end

			arg_14_0.uiTable.process_chengchi:setPercentage(arg_14_1.zhancheng.nowNum * 100 / arg_14_1.zhancheng.requestNum)
			arg_14_0.uiTable.num_chengchi:setString(arg_14_1.zhancheng.nowNum .. "/" .. arg_14_1.zhancheng.requestNum)
		end
	elseif arg_14_1.type == 3 then
		if user.kbLv and user.kbLv >= 1 then
			arg_14_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/mainTask/ejwc_title_jzjsl.png"):displayFrame())
			arg_14_0.uiTable.gongchengqianzuo:setString(language.get("221048_buildNation"))
		else
			arg_14_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/mainTask/jgdy_jzys_title.png"):displayFrame())
			arg_14_0.uiTable.gongchengqianzuo:setString(language.get("220957_buildNation"))
		end

		arg_14_0.uiTable.choubeijunzi_bg:setVisible(false)
		arg_14_0.uiTable.gongchengqianzuo_bg:setVisible(true)

		if arg_14_1.xiujian then
			if user.kbLv and user.kbLv >= 1 then
				arg_14_0.uiTable.gongchengqianzuo_detail:setString(language.get("221070_buildNation", arg_14_1.xiujian.cityName, arg_14_1.xiujian.cityName))
			else
				arg_14_0.uiTable.gongchengqianzuo_detail:setString(language.get("220976_buildNation", arg_14_1.xiujian.cityName, arg_14_1.xiujian.cityName))
			end

			var_0_3 = arg_14_1.xiujian.cityId
		end

		arg_14_0.uiTable.process_bg:setVisible(false)
		arg_14_0.uiTable.process_chengchi:setVisible(false)
		arg_14_0.uiTable.num_chengchi:setVisible(false)
		arg_14_0.uiTable.jump_world_btn:setVisible(true)
		arg_14_0.uiTable.jump_world_btn_word:setVisible(true)
	elseif arg_14_1.type == 4 then
		if arg_14_1.isEnemyTask ~= true then
			arg_14_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/mainTask/ejwc_title_jsjsl.png"):displayFrame())
			arg_14_0.uiTable.gongchengqianzuo:setString(language.get("221046_buildNation"))
		else
			arg_14_0.uiTable.gongshou_title:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/mainTask/ejwc_title_qltj.png"):displayFrame())
			arg_14_0.uiTable.gongchengqianzuo:setString(language.get("221047_buildNation"))
		end

		if arg_14_1.jianshou then
			if arg_14_1.isEnemyTask ~= true then
				arg_14_0.uiTable.gongchengqianzuo_detail:setString(language.get("221073_buildNation", arg_14_1.jianshou.cityName, arg_14_1.jianshou.cityName))
			else
				arg_14_0.uiTable.gongchengqianzuo_detail:setString(language.get("221074_buildNation", arg_14_1.jianshou.cityName, arg_14_1.jianshou.cityName))
			end

			var_0_3 = arg_14_1.jianshou.cityId
		end

		arg_14_0.uiTable.choubeijunzi_bg:setVisible(false)
		arg_14_0.uiTable.gongchengqianzuo_bg:setVisible(true)
		arg_14_0.uiTable.process_bg:setVisible(false)
		arg_14_0.uiTable.process_chengchi:setVisible(false)
		arg_14_0.uiTable.num_chengchi:setVisible(false)
		arg_14_0.uiTable.jump_world_btn:setVisible(true)
		arg_14_0.uiTable.jump_world_btn_word:setVisible(true)
	else
		arg_14_0.uiTable.choubeijunzi_bg:setVisible(false)
		arg_14_0.uiTable.gongchengqianzuo_bg:setVisible(false)
	end

	if arg_14_1.type == 2 or arg_14_1.type == 3 or arg_14_1.type == 4 then
		if arg_14_1.state == -1 then
			arg_14_0.uiTable.taskNoStart:setVisible(true)
			arg_14_0.uiTable.gongxian:setVisible(false)
			arg_14_0.uiTable.gongcheng:setVisible(false)
			arg_14_0.uiTable.shadi:setVisible(false)
			arg_14_0.uiTable.paihang:setVisible(false)
		else
			arg_14_0.uiTable.taskNoStart:setVisible(false)
			arg_14_0.uiTable.gongxian:setVisible(true)
			arg_14_0.uiTable.gongcheng:setVisible(true)
			arg_14_0.uiTable.shadi:setVisible(true)
			arg_14_0.uiTable.paihang:setVisible(true)

			if arg_14_1.kill then
				arg_14_0.uiTable.shadi_num:setString(language.get("220973_buildNation", language.get(75021, math.floor(arg_14_1.kill / 10000))))
			end

			if arg_14_1.occupy then
				arg_14_0.uiTable.gongcheng_num:setString(language.get("220972_buildNation", arg_14_1.occupy))
			end

			if arg_14_1.rank then
				arg_14_0.uiTable.paihang_num:setString(language.get("220974_buildNation", arg_14_1.rank))
			end
		end
	end

	if arg_14_1.state == -1 then
		if arg_14_1.startTime and arg_14_1.startTime > 0 then
			local var_14_0 = createTimerLabel(arg_14_1.startTime, "@H:@M:@S", "Thonburi-bold", 24, nil, nil, nil, ccc3(255, 248, 197))

			arg_14_0.uiTable.daojishi:removeChildByTag(2345, true)
			arg_14_0.uiTable.daojishi:addChild(var_14_0, 100, 2345)

			local var_14_1 = arg_14_0.uiTable.daojishi:getContentSize().width

			var_14_0:setPosition(ccp(var_14_1 / 2, -15))
		end

		arg_14_0.uiTable.daojishi_name:setString(language.get("220975_buildNation"))
		arg_14_0:setNationMap(arg_14_1)
	else
		if arg_14_1.endTime and arg_14_1.endTime > 0 then
			local var_14_2 = createTimerLabel(arg_14_1.endTime, "@H:@M:@S", "Thonburi-bold", 24, nil, nil, nil, ccc3(255, 248, 197))

			arg_14_0.uiTable.daojishi:removeChildByTag(2345, true)
			arg_14_0.uiTable.daojishi:addChild(var_14_2, 100, 2345)

			local var_14_3 = arg_14_0.uiTable.daojishi:getContentSize().width

			var_14_2:setPosition(ccp(var_14_3 / 2, -15))
		end

		arg_14_0.uiTable.daojishi_name:setString(language.get(490550))
		arg_14_0:setNationMap(arg_14_1)
	end

	arg_14_0:setBuildNationJiangli(arg_14_1)
end

function var_0_1.setchenghao(arg_15_0, arg_15_1)
	log.info("围城称号")

	arg_15_1.titlePic = arg_15_1.titlePic or "chenghao1"

	arg_15_0.uiTable.title:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(arg_15_1.titlePic .. ".png"))

	if arg_15_1.rank and arg_15_0.uiTable.rankText then
		arg_15_0.uiTable.rankText:setString(language.get(95026) .. arg_15_1.rank)
	end
end

function var_0_1.setBuildNationJiangli(arg_16_0, arg_16_1)
	log.info("建国任务的奖励显示")
	arg_16_0.indivRewardTable.reward_main:setVisible(true)

	if arg_16_1.rankRewards and arg_16_1.extraRewards then
		local var_16_0 = 160

		if #arg_16_1.rankRewards + #arg_16_1.extraRewards == 5 then
			var_16_0 = 95
		elseif #arg_16_1.rankRewards + #arg_16_1.extraRewards == 4 then
			var_16_0 = 130
		end

		local var_16_1 = 0

		for iter_16_0, iter_16_1 in pairs(arg_16_1.rankRewards) do
			var_16_1 = iter_16_0

			arg_16_0.indivRewardTable["taskRewardBlock_" .. var_16_1]:setVisible(true)
			arg_16_0.indivRewardTable["taskRewardBlock_" .. var_16_1]:setPosition(ccp(var_16_0 + (iter_16_0 - 1) * 90 + 40, 80))
			arg_16_0.indivRewardTable["taskRewardValue_" .. var_16_1]:setString(iter_16_1.num)

			if iter_16_1.type == 21 then
				arg_16_0.indivRewardTable["gerenjiangli_" .. var_16_1]:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/task/get_icon_gem.png"))
			elseif iter_16_1.type == 4 then
				arg_16_0.indivRewardTable["gerenjiangli_" .. var_16_1]:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/task/get_icon_iron.png"))
			elseif iter_16_1.type == 116 then
				arg_16_0.indivRewardTable["gerenjiangli_" .. var_16_1]:setDisplayFrame(CCSprite:create("res/ui/task/get_icon_silk.png"):displayFrame())
			else
				arg_16_0.indivRewardTable["gerenjiangli_" .. var_16_1]:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/task/get_icon_exp.png"))
			end
		end

		for iter_16_2, iter_16_3 in pairs(arg_16_1.extraRewards) do
			var_16_1 = iter_16_2 + #arg_16_1.rankRewards

			arg_16_0.indivRewardTable["taskRewardBlock_" .. var_16_1]:setVisible(true)
			arg_16_0.indivRewardTable["taskRewardBlock_" .. var_16_1]:setPosition(ccp(var_16_0 + (iter_16_2 - 1 + #arg_16_1.rankRewards) * 90 + 40, 80))

			if iter_16_3.type == 21 then
				arg_16_0.indivRewardTable["gerenjiangli_" .. var_16_1]:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/task/get_icon_gem.png"))
			elseif iter_16_3.type == 4 then
				arg_16_0.indivRewardTable["gerenjiangli_" .. var_16_1]:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/task/get_icon_iron.png"))
			elseif iter_16_3.type == 116 then
				arg_16_0.indivRewardTable["gerenjiangli_" .. var_16_1]:setDisplayFrame(CCSprite:create("res/ui/task/get_icon_silk.png"):displayFrame())
			else
				arg_16_0.indivRewardTable["gerenjiangli_" .. var_16_1]:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/task/get_icon_exp.png"))
			end

			if arg_16_1.state == 2 then
				tool.spriteToGray(arg_16_0.indivRewardTable["taskRewardBlock_" .. var_16_1], true)

				if arg_16_0.indivRewardTable["taskCorner_" .. var_16_1] then
					arg_16_0.indivRewardTable["taskCorner_" .. var_16_1]:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("nation_task_win_icon_gray.png"))
				end
			end

			arg_16_0.indivRewardTable["taskRewardValue_" .. var_16_1]:setString(iter_16_3.num)
		end

		for iter_16_4 = var_16_1 + 1, 6 do
			arg_16_0.indivRewardTable["taskRewardBlock_" .. iter_16_4]:setVisible(false)
		end

		arg_16_0.uiTable.myChenghao:setVisible(false)
		arg_16_0.indivRewardTable.taskIsRewarded:setVisible(false)
		arg_16_0.uiTable.btn_reward_indiv:setVisible(false)

		if arg_16_1.state == 1 or arg_16_1.state == 2 then
			if arg_16_1.canGetRewards then
				arg_16_0.uiTable.btn_reward_indiv:setVisible(true)
			else
				arg_16_0.indivRewardTable.taskIsRewarded:setVisible(true)
			end
		end
	else
		for iter_16_5 = 1, 6 do
			arg_16_0.indivRewardTable["taskRewardBlock_" .. iter_16_5]:setVisible(false)
		end

		arg_16_0.uiTable.myChenghao:setVisible(true)
		arg_16_0.uiTable.myChenghao:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("chenghao1.png"))
		arg_16_0.indivRewardTable.taskIsRewarded:setVisible(false)
		arg_16_0.uiTable.btn_reward_indiv:setVisible(false)
	end
end

function var_0_1.setTaskDetail(arg_17_0, arg_17_1)
	log.info("显示围城具体任务")

	local function var_17_0(arg_18_0)
		if arg_18_0 == 1 then
			return language.get(95016)
		elseif arg_18_0 == 2 then
			return language.get(95017)
		elseif arg_18_0 == 3 then
			return language.get(95018)
		end

		return "#"
	end

	local function var_17_1(arg_19_0, arg_19_1)
		local var_19_0 = CCSprite:create("res/ui/kfsy/150150.png")
		local var_19_1 = CCSprite:create("res/ui/kfsy/150150.png")

		var_19_0:setScale(0.3)
		var_19_1:setScale(0.3)

		local var_19_2 = CCMenuItemSprite:create(var_19_0, var_19_1)

		var_19_2:registerScriptTapHandler(function()
			smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
			loadingLayer.show(SCENE_WORLD, arg_19_1)
		end)
		var_19_2:setEnabled(true)

		local var_19_3 = CCMenu:create()

		var_19_3:addChild(var_19_2, 15)
		var_19_3:alignItemsVertically()
		var_19_3:setPosition(ccp(arg_19_0:getContentSize().width / 2, arg_19_0:getContentSize().height / 2))
		arg_19_0:addChild(var_19_3)
	end

	local var_17_2 = {}
	local var_17_3 = ccc3(13, 13, 13)
	local var_17_4 = ccc3(204, 185, 134)
	local var_17_5 = ccc3(0, 255, 0)

	if user.player.forceId == arg_17_1.attForceId then
		if arg_17_1.serial == 1 then
			log.info("AAAAAAAAAAAAA")

			local var_17_6 = CCStrokeLabelTTF:create(language.get(490544, var_17_0(arg_17_1.defForceId)), "Thonburi", 20, 1, var_17_3)
			local var_17_7 = CCStrokeLabelTTF:create(arg_17_1.target, "Thonburi", 20, 1, var_17_3)
			local var_17_8 = CCStrokeLabelTTF:create(language.get(490545), "Thonburi", 20, 1, var_17_3)
			local var_17_9 = CCStrokeLabelTTF:create(arg_17_1.supportTarget1Name, "Thonburi", 24, 1, var_17_3)

			var_17_6:setColor(var_17_4)
			var_17_7:setColor(var_17_5)
			var_17_8:setColor(var_17_4)
			var_17_9:setColor(var_17_5)
			table.insert(var_17_2, var_17_6)
			table.insert(var_17_2, var_17_7)
			table.insert(var_17_2, var_17_8)
			table.insert(var_17_2, var_17_9)
			var_17_1(var_17_9, arg_17_1.supportTarget1)
		elseif arg_17_1.serial == 2 then
			local var_17_10 = CCStrokeLabelTTF:create(language.get(490548, var_17_0(arg_17_1.defForceId)), "Thonburi", 20, 1, var_17_3)
			local var_17_11 = CCStrokeLabelTTF:create(arg_17_1.target, "Thonburi", 20, 1, var_17_3)
			local var_17_12 = CCStrokeLabelTTF:create(language.get(490545), "Thonburi", 20, 1, var_17_3)
			local var_17_13 = CCStrokeLabelTTF:create(arg_17_1.supportTarget1Name, "Thonburi", 24, 1, var_17_3)
			local var_17_14 = CCStrokeLabelTTF:create(language.get(490546), "Thonburi", 20, 1, var_17_3)
			local var_17_15 = CCStrokeLabelTTF:create(arg_17_1.supportTarget2Name, "Thonburi", 24, 1, var_17_3)

			var_17_10:setColor(var_17_4)
			var_17_11:setColor(var_17_5)
			var_17_12:setColor(var_17_4)
			var_17_13:setColor(var_17_5)
			var_17_14:setColor(var_17_4)
			var_17_15:setColor(var_17_5)
			table.insert(var_17_2, var_17_10)
			table.insert(var_17_2, var_17_11)
			table.insert(var_17_2, var_17_12)
			table.insert(var_17_2, var_17_13)
			table.insert(var_17_2, var_17_14)
			table.insert(var_17_2, var_17_15)
			var_17_1(var_17_13, arg_17_1.supportTarget1)
			var_17_1(var_17_15, arg_17_1.supportTarget2)
		end
	elseif user.player.forceId == arg_17_1.defForceId then
		if arg_17_1.serial == 1 then
			log.info("BBBBBBBBBBBBBBBB")

			local var_17_16 = CCStrokeLabelTTF:create(language.get(490542, var_17_0(arg_17_1.attForceId)), "Thonburi", 20, 1, var_17_3)
			local var_17_17 = CCStrokeLabelTTF:create(arg_17_1.target, "Thonburi", 20, 1, var_17_3)
			local var_17_18 = CCStrokeLabelTTF:create(language.get(490543), "Thonburi", 20, 1, var_17_3)

			var_17_16:setColor(var_17_4)
			var_17_17:setColor(var_17_5)
			var_17_18:setColor(var_17_4)
			table.insert(var_17_2, var_17_16)
			table.insert(var_17_2, var_17_17)
			table.insert(var_17_2, var_17_18)
		elseif arg_17_1.serial == 2 then
			local var_17_19 = CCStrokeLabelTTF:create(language.get(490549, var_17_0(arg_17_1.attForceId)), "Thonburi", 20, 1, var_17_3)
			local var_17_20 = CCStrokeLabelTTF:create(arg_17_1.target, "Thonburi", 20, 1, var_17_3)
			local var_17_21 = CCStrokeLabelTTF:create(language.get(490543), "Thonburi", 20, 1, var_17_3)

			var_17_19:setColor(var_17_4)
			var_17_20:setColor(var_17_5)
			var_17_21:setColor(var_17_4)
			table.insert(var_17_2, var_17_19)
			table.insert(var_17_2, var_17_20)
			table.insert(var_17_2, var_17_21)
		end
	elseif user.player.forceId == arg_17_1.supportForceId then
		if arg_17_1.serial == 1 then
			log.info("CCCCCCCCCCCCCC")

			local var_17_22 = CCStrokeLabelTTF:create(language.get(490540), "Thonburi", 20, 1, var_17_3)
			local var_17_23 = CCStrokeLabelTTF:create(arg_17_1.supportTarget1Name, "Thonburi", 24, 1, var_17_3)
			local var_17_24 = CCStrokeLabelTTF:create(language.get(490541, var_17_0(arg_17_1.attForceId), var_17_0(arg_17_1.defForceId)), "Thonburi", 20, 1, var_17_3)

			var_17_22:setColor(var_17_4)
			var_17_23:setColor(var_17_5)
			var_17_24:setColor(var_17_4)
			table.insert(var_17_2, var_17_22)
			table.insert(var_17_2, var_17_23)
			table.insert(var_17_2, var_17_24)
			var_17_1(var_17_23, arg_17_1.supportTarget1)
		elseif arg_17_1.serial == 2 then
			local var_17_25 = CCStrokeLabelTTF:create(language.get(490540), "Thonburi", 20, 1, var_17_3)
			local var_17_26 = CCStrokeLabelTTF:create(arg_17_1.supportTarget1Name, "Thonburi", 24, 1, var_17_3)
			local var_17_27 = CCStrokeLabelTTF:create(language.get(490547), "Thonburi", 20, 1, var_17_3)
			local var_17_28 = CCStrokeLabelTTF:create(arg_17_1.supportTarget2Name, "Thonburi", 24, 1, var_17_3)
			local var_17_29 = CCStrokeLabelTTF:create(language.get(490541, var_17_0(arg_17_1.attForceId), var_17_0(arg_17_1.defForceId)), "Thonburi", 20, 1, var_17_3)

			var_17_25:setColor(var_17_4)
			var_17_26:setColor(var_17_5)
			var_17_27:setColor(var_17_4)
			var_17_28:setColor(var_17_5)
			var_17_29:setColor(var_17_4)
			table.insert(var_17_2, var_17_25)
			table.insert(var_17_2, var_17_26)
			table.insert(var_17_2, var_17_27)
			table.insert(var_17_2, var_17_28)
			table.insert(var_17_2, var_17_29)
			var_17_1(var_17_26, arg_17_1.supportTarget1)
			var_17_1(var_17_28, arg_17_1.supportTarget2)
		end
	end

	local var_17_30 = createRichNode(var_17_2, 0.5)

	arg_17_0.uiTable.background:removeChildByTag(1234, true)
	arg_17_0.uiTable.background:addChild(var_17_30, 100, 1234)
	var_17_30:setPosition(ccp(580, 362))
end

function var_0_1.setNationMap(arg_21_0, arg_21_1)
	log.info("围城：缩略图")
	require("lua/layer/world/control")

	if worldControl.cities and arg_21_0.uiTable.taskMap then
		local var_21_0 = tool.split(worldControl.cities, "#")
		local var_21_1 = 48
		local var_21_2 = 79
		local var_21_3 = 191
		local var_21_4 = 123

		for iter_21_0, iter_21_1 in pairs(var_21_0) do
			local var_21_5 = tool.split(iter_21_1, "|")

			if tonumber(var_21_5[1]) > 0 then
				local var_21_6 = worldConstant.BUILDING_INFO["world_building_" .. tonumber(var_21_5[1])]
				local var_21_7 = var_21_6.x + 90.5
				local var_21_8 = 3600 - var_21_6.y - 64
				local var_21_9 = var_21_7 / 6000 * var_21_3
				local var_21_10 = var_21_8 / 3600 * var_21_4
				local var_21_11

				if tonumber(var_21_5[2]) == 1 then
					var_21_11 = "nation_map_wei.png"
				elseif tonumber(var_21_5[2]) == 2 then
					var_21_11 = "nation_map_shu.png"
				elseif tonumber(var_21_5[2]) == 3 then
					var_21_11 = "nation_map_wu.png"
				end

				if var_21_11 ~= nil then
					local var_21_12 = CCSprite:createWithSpriteFrameName(var_21_11)

					var_21_12:setPosition(ccp(var_21_1 + var_21_9, var_21_2 + var_21_10))
					arg_21_0.uiTable.taskMap:addChild(var_21_12)
				end
			end
		end
	end
end

function var_0_1.onEnter(arg_22_0)
	return
end

function var_0_1.onExit(arg_23_0)
	return
end

function var_0_1.getRewardData(arg_24_0)
	local function var_24_0(arg_25_0, arg_25_1)
		arg_25_0[#arg_25_0 + 1] = arg_25_1

		return arg_25_1
	end

	local var_24_1 = {
		background = {
			x = 0,
			name = "reward_main",
			y = 0,
			type = "pic",
			visible = false,
			pic = "res/default.png",
			children = {}
		}
	}

	for iter_24_0 = 1, 6 do
		local var_24_2 = var_24_0(var_24_1.background.children, {
			visible = true,
			type = "pic",
			ycenter = 80,
			pic = "frame:jianglikuang1.png",
			name = "taskRewardBlock_" .. iter_24_0,
			xcenter = 80 + (iter_24_0 - 1) * 90,
			children = {}
		})

		var_24_0(var_24_2.children, {
			x = 39.5,
			y = 39.5,
			type = "pic",
			pic = "res/ui/task/get_icon_exp.png",
			name = "gerenjiangli_" .. iter_24_0
		})
		var_24_0(var_24_2.children, {
			fontSize = 18,
			text = "0",
			type = "label",
			y = 19.5,
			x = 39.5,
			name = "taskRewardValue_" .. iter_24_0,
			color = ccc3(255, 255, 255)
		})

		if iter_24_0 > 2 then
			var_24_0(var_24_2.children, {
				x = 23,
				y = 56,
				type = "pic",
				pic = "frame:nation_task_win_icon.png",
				name = "taskCorner_" .. iter_24_0
			})
		end
	end

	var_24_0(var_24_1.background.children, {
		xcenter = 330,
		name = "taskIsRewarded",
		visible = true,
		type = "pic",
		ycenter = 70,
		pic = "frame:nation_task_draw.png"
	})

	return var_24_1
end

function var_0_1.refineLayout(arg_26_0)
	arg_26_0.uiTable.choubeijunzi_detail:setPositionY(arg_26_0.uiTable.choubeijunzi:getPositionY() - arg_26_0.uiTable.choubeijunzi:getContentSize().height / 2 - 2)
end

return var_0_1
