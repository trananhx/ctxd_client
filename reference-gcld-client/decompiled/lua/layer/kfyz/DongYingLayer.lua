local var_0_0 = class("DongyingLayer", function()
	return createBaseLayer()
end)

var_0_0.layout = {}
var_0_0.layout.bg = {
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
			type = "pic",
			ycenter = 0,
			pic = "res/ui/nation/renwudi.jpg",
			children = {
				{
					xcenter = 0,
					name = "dongying_title",
					type = "pic",
					top = 21,
					pic = "res/ui/nation/buildNation/dongying/title_czdy.png"
				},
				{
					x = 165,
					name = "daojishi",
					y = 152,
					type = "pic",
					pic = "res/ui/kfyz/kfyz_word_bg.png",
					children = {
						{
							xcenter = 0,
							name = "daojishi_word",
							type = "pic",
							ycenter = 5,
							pic = "res/ui/nation/buildNation/dongying/yzdy_word_slhsjwsjwc.png"
						},
						{
							fontSize = 20,
							name = "daojishi_name",
							type = "label",
							anchorPointX = 0,
							ycenter = 3,
							visible = false,
							x = 25,
							text = language.get("222401_dongying"),
							color = ccc3(204, 185, 134)
						}
					}
				},
				{
					x = 167,
					name = "taskMap",
					y = 297,
					type = "pic",
					pic = "res/ui/nation/buildNation/dongying/yzdy_dymap_s.png"
				},
				{
					x = 358,
					name = "gongchengqianzuo_bg",
					y = 400,
					type = "pic",
					pic = "res/ui/nationTask/newPic/rwyh_icon01.png",
					children = {
						{
							anchorPointX = 0,
							x = 45,
							y = 70,
							type = "pic",
							anchorPointY = 1,
							pic = "res/ui/nationTask/newPic/rwyh_small_bg.png"
						},
						{
							fontSize = 22,
							name = "info_prefix",
							stroke = false,
							anchorPointX = 0,
							type = "label",
							y = 40,
							x = 75,
							text = language.get("222506_dongying"),
							color = ccc3(204, 185, 134)
						},
						{
							x = 45,
							anchorPointX = 0,
							y = -45,
							type = "pic",
							scale = 1,
							pic = "res/ui/nationTask/newPic/rwyh_small_bg.png"
						},
						{
							x = 0,
							anchorPointX = 0,
							y = -45,
							type = "pic",
							pic = "res/ui/nation/buildNation/mainTask/rwyh_icon04.png"
						},
						{
							anchorPointX = 0,
							fontSize = 22,
							type = "label",
							y = -43,
							x = 75,
							text = language.get("222507_dongying"),
							color = ccc3(204, 185, 134)
						},
						{
							width = 21,
							height = 32,
							name = "zhanjiangshu",
							type = "atlas",
							z = 500,
							pic = "res/ui/common/number/scpm_word_digit.png",
							text = "0",
							y = -43,
							startChar = 48,
							x = 190
						},
						{
							anchorPointX = 0,
							fontSize = 22,
							type = "label",
							y = -43,
							x = 275,
							text = language.get("222508_dongying"),
							color = ccc3(204, 185, 134)
						},
						{
							x = 435,
							name = "chenghao",
							y = -43,
							type = "pic",
							pic = "frame:wuming.png"
						}
					}
				},
				{
					x = 358,
					name = "indiv_reward_bg",
					y = 235,
					type = "pic",
					pic = "res/ui/nationTask/newPic/rwyh_icon03.png",
					children = {
						{
							anchorPointX = 0,
							name = "indivRewardBg",
							type = "pic_9",
							pic = "res/ui/nationTask/newPic/rwyh_jl_bg.png",
							y = 60,
							anchorPointY = 1,
							x = -15,
							middleRect = CCRectMake(0, 20, 589, 112),
							preferedSize = CCSizeMake(600, 150),
							children = {
								{
									anchorPointX = 0,
									fontSize = 22,
									type = "label",
									y = 115,
									x = 90,
									text = language.get(330027),
									color = ccc3(204, 185, 134)
								},
								{
									xcenter = 0,
									type = "pic",
									ycenter = -2,
									pic = "res/ui/task/get_rewa_icon.jpg",
									children = {
										{
											xcenter = 0,
											name = "bailg_icon",
											z = 100,
											type = "pic",
											ycenter = 3,
											pic = "res/ui/resource/blacksmith/new/res_icon_bailg.png"
										},
										{
											xcenter = 0,
											name = "bailg_num",
											fontSize = 22,
											type = "label",
											ycenter = -20,
											text = "0"
										},
										{
											xcenter = 0,
											name = "huode_icon",
											z = 100,
											type = "pic",
											ycenter = 3,
											visible = false,
											pic = "res/ui/kfyz/wait/kfyz_seal_get.png"
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
									name = "btn_reward_indiv",
									pic1 = "res/ui/common/button/public_btn_green.png",
									y = -120,
									visible = false,
									x = 450,
									children = {
										{
											fontSize = 20,
											y = 33,
											type = "label",
											x = 97.5,
											text = language.get(95047),
											color = ccc3(204, 185, 134)
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
}

function var_0_0.ctor(arg_2_0, arg_2_1)
	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("res/ui/nation/nation.plist")

	arg_2_0.view = {}
	arg_2_0.view = autoUI.initUI(arg_2_0, arg_2_0.layout)

	if arg_2_1 then
		arg_2_1:addChild(arg_2_0)
	end

	local var_2_0

	if user.jpsIndex == 1 then
		var_2_0 = "title_czdy.png"
	elseif user.jpsIndex == 2 then
		var_2_0 = "title_zzdy.png"
	elseif user.jpsIndex == 3 then
		var_2_0 = "title_jzdy.png"
	elseif user.jpsIndex == 4 then
		var_2_0 = "jmdy_title.png"
	elseif user.jpsIndex == 5 then
		var_2_0 = "djgl_title_czgl.png"
	elseif user.jpsIndex == 6 then
		var_2_0 = "djgl_title_zzgl.png"
	elseif user.jpsIndex == 7 then
		var_2_0 = "djgl_title_jzgl.png"
	elseif user.jpsIndex == 8 then
		var_2_0 = "swjz_word_title_swjz.png"
	elseif user.jpsIndex == 9 then
		var_2_0 = "swjz_word_title_ssjz.png"
	elseif user.jpsIndex == 10 then
		var_2_0 = "swjz_word_title_sisjz.png"
	elseif user.jpsIndex == 11 then
		var_2_0 = "yzlq_title_czlq.png"
	elseif user.jpsIndex == 12 then
		var_2_0 = "yzlq_title_zzlq.png"
	elseif user.jpsIndex == 13 then
		var_2_0 = "yzlq_title_jzlq.png"
	elseif user.jpsIndex == 14 then
		var_2_0 = "yznz_title_cznz.png"
	elseif user.jpsIndex == 15 then
		var_2_0 = "yznz_title_zznz.png"
	elseif user.jpsIndex == 16 then
		var_2_0 = "yznz_title_jznz.png"
	end

	if var_2_0 then
		arg_2_0.view.dongying_title:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/dongying/" .. var_2_0):displayFrame())
	end

	local var_2_1
	local var_2_2
	local var_2_3

	if user.jpsIndex >= 1 and user.jpsIndex <= 4 then
		var_2_1 = "222506_dongying"
		var_2_2 = "yzdy_dymap_s.png"
		var_2_3 = "yzdy_word_slhsjwsjwc.png"
	elseif user.jpsIndex >= 5 and user.jpsIndex <= 7 then
		var_2_1 = 136564
		var_2_2 = "yzgl_map_s.png"
		var_2_3 = "djgl_word_slhsjwsjwc.png"
	elseif user.jpsIndex >= 8 and user.jpsIndex <= 10 then
		var_2_1 = 136806
		var_2_2 = "wjwc_map_jiaozhi.png"
		var_2_3 = "swjz_word_slhsjwwjwc.png"
	elseif user.jpsIndex >= 11 and user.jpsIndex <= 13 then
		var_2_1 = 136850
		var_2_2 = "yzlq_map_s.png"
		var_2_3 = "yzlq_word_slhsjwljwc.png"
	elseif user.jpsIndex >= 14 and user.jpsIndex <= 16 then
		var_2_1 = 218002
		var_2_2 = "qjwc_map_s.png"
		var_2_3 = "yznz_word_slhsjwqjwc.png"

		arg_2_0.view.btn_reward_indiv:setVisible(false)
	end

	if var_2_1 then
		arg_2_0.view.info_prefix:setString(language.get(var_2_1))
		arg_2_0.view.taskMap:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/dongying/" .. var_2_2):displayFrame())
		arg_2_0.view.daojishi_word:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/dongying/" .. var_2_3):displayFrame())
	end

	local function var_2_4()
		local function var_3_0(arg_4_0)
			local var_4_0 = arg_4_0.action.data

			if var_4_0.rewards and var_4_0.rewards[1] then
				local var_4_1 = {
					{}
				}

				var_4_1[1].id = 10033

				if var_4_0.rewards[1].type == 216 then
					var_4_1[1].id = 216
				end

				var_4_1[1].value = var_4_0.rewards[1].value

				globalAction_gotResource(var_4_1)
				arg_2_0:refresh()
			end
		end

		cmgr.sendRequest(var_3_0, actions.kfyzGetTaskReward)
	end

	arg_2_0.view.btn_reward_indiv:registerScriptTapHandler(var_2_4)
	arg_2_0:refresh()
end

function var_0_0.refresh(arg_5_0)
	local function var_5_0(arg_6_0)
		if user.kfyzState == 2 then
			arg_5_0.data = arg_6_0.action.data
		else
			arg_5_0.data = arg_6_0.data
		end

		arg_5_0.view.zhanjiangshu:setString(arg_5_0.data.value)

		if arg_5_0.data.titlePic then
			log.info("|" .. arg_5_0.data.titlePic .. "|")

			if arg_5_0.data.titlePic ~= nil and arg_5_0.data.titlePic ~= "" then
				arg_5_0.view.chenghao:setDisplayFrame(tool.spriteFrameByName(arg_5_0.data.titlePic .. ".png"))
			end
		end

		if arg_5_0.data.taskEndTime and arg_5_0.data.taskEndTime > 0 then
			local var_6_0

			if user.jpsIndex >= 1 and user.jpsIndex <= 4 then
				var_6_0 = "222413_dongying"
			elseif user.jpsIndex >= 5 and user.jpsIndex <= 7 then
				var_6_0 = 136563
			elseif user.jpsIndex >= 8 and user.jpsIndex <= 10 then
				var_6_0 = 136806
			elseif user.jpsIndex >= 11 and user.jpsIndex <= 13 then
				var_6_0 = 136846
			elseif user.jpsIndex >= 14 and user.jpsIndex <= 16 then
				var_6_0 = 218001
			end

			arg_5_0.view.daojishi_name:setString(language.get(var_6_0))
			arg_5_0.view.daojishi_name:removeChildByTag(1001, true)

			local var_6_1 = createTimerLabel(arg_5_0.data.taskEndTime, "@H:@M:@S", "Thonburi", 22, nil, nil, nil, ccc3(255, 0, 0))

			arg_5_0.view.daojishi_name:addChild(var_6_1, 0, 1001)
			var_6_1:setPosition(ccp(200, 1))

			if user.isKflq or user.isKfnz then
				var_6_1:setPosition(ccp(140, 1))
			end

			arg_5_0.view.daojishi_name:setVisible(true)
			arg_5_0.view.daojishi_word:setVisible(false)
		end

		arg_5_0.view.btn_reward_indiv:setVisible(false)
		arg_5_0.view.bailg_icon:removeAllChildrenWithCleanup(true)

		if arg_5_0.data.rewards then
			if arg_5_0.data.rewards[1] and arg_5_0.data.rewards[1].subRewards and arg_5_0.data.rewards[1].subRewards[1] and arg_5_0.data.rewards[1].subRewards[1].type == 216 then
				arg_5_0.view.bailg_icon:setDisplayFrame(CCSprite:create("res/ui/activity/meteorIncense/yuntie2.jpg"):displayFrame())
			end

			if not arg_5_0.data.canGotRewards or arg_5_0.data.rewards[1] and arg_5_0.data.rewards[1].finished == false then
				tool.spriteToGray(arg_5_0.view.bailg_icon)
			end

			if arg_5_0.data.rewards[1] and arg_5_0.data.rewards[1].subRewards and arg_5_0.data.rewards[1].subRewards[1] then
				arg_5_0.view.bailg_num:setString(arg_5_0.data.rewards[1].subRewards[1].value or 0)

				if arg_5_0.data.canGotRewards and arg_5_0.data.rewards[1].finished and arg_5_0.data.rewards[1].rewarded == false then
					arg_5_0.view.btn_reward_indiv:setVisible(true)
				end

				if arg_5_0.data.canGotRewards and arg_5_0.data.rewards[1].finished and arg_5_0.data.rewards[1].rewarded then
					arg_5_0.view.huode_icon:setVisible(true)
				end
			end
		end
	end

	if user.kfyzState == 2 then
		cmgr.sendRequest(var_5_0, actions.kfyzGetTaskRewardInfo)
	else
		kfcmgr.sendRequest(var_5_0, actions.kfyzGetTaskInfo)
	end
end

function var_0_0.onEnter(arg_7_0)
	return
end

function var_0_0.onExit(arg_8_0)
	return
end

return var_0_0
