local var_0_0 = class("DongyingRank", function()
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
			y = 463,
			name = "amountBackground",
			z = 50,
			type = "pic",
			pic = "res/ui/rankInfo/twoRankInfo/amount_bg_dan.jpg",
			x = 480,
			children = {
				{
					x = 145,
					name = "rankTitlePic",
					y = 90,
					type = "pic",
					pic = "res/ui/nation/buildNation/dongying/yzdy_zjb_ch_di.png",
					children = {
						{
							xcenter = 0,
							ycenter = 4,
							pic = "res/ui/nation/buildNation/dongying/yzdy_zjb_word_yzzw.png",
							type = "pic"
						}
					}
				},
				{
					fontSize = 26,
					name = "myRankInfo",
					type = "label",
					anchorPointX = 1,
					y = 35,
					anchorPointY = 0.5,
					x = 850,
					text = language.get("222510_dongying", "0"),
					color = ccc3(235, 209, 167)
				},
				{
					y = 125,
					name = "zhanjiangPrefix",
					pic = "res/ui/nation/buildNation/dongying/yzdy_zjb_word_zjs.png",
					type = "pic",
					x = 571
				},
				{
					width = 43,
					height = 65,
					name = "zhanjiangshu",
					type = "atlas",
					z = 500,
					pic = "res/ui/nation/buildNation/dongying/yzdy_zjb_word_number.png",
					text = "123",
					y = 125,
					startChar = 48,
					x = 741
				},
				{
					y = 125,
					name = "zhanjiangSuffix",
					pic = "res/ui/nation/buildNation/dongying/yzdy_zjb_word_r.png",
					type = "pic",
					x = 862
				}
			}
		},
		{
			y = 192,
			name = "playerListBackground",
			pic = "res/ui/rankInfo/twoRankInfo/player_list_bg.jpg",
			type = "pic",
			x = 305,
			children = {
				{
					fontSize = 22,
					type = "label",
					top = 8,
					left = 25,
					text = language.get(113005),
					color = colorText[10002]
				},
				{
					fontSize = 22,
					type = "label",
					top = 8,
					left = 145,
					text = language.get(113006),
					color = colorText[10002]
				},
				{
					fontSize = 22,
					type = "label",
					top = 8,
					left = 295,
					text = language.get(113007),
					color = colorText[10002]
				},
				{
					fontSize = 22,
					name = "rankListAmountTitle",
					type = "label",
					top = 8,
					left = 430,
					text = language.get("222509_dongying"),
					color = colorText[10002]
				}
			}
		},
		{
			y = 192,
			z = 100,
			pic = "res/ui/rankInfo/twoRankInfo/reward_panel_bg.jpg",
			type = "pic",
			x = 770,
			children = {
				{
					xcenter = 0,
					name = "rewardSplitPic",
					y = 100,
					type = "pic",
					pic = "res/ui/rankInfo/twoRankInfo/reward_panel_split.png"
				},
				{
					xcenter = 0,
					name = "rewardSplitPic2",
					y = 196,
					type = "pic",
					pic = "res/ui/rankInfo/twoRankInfo/reward_panel_split.png"
				},
				{
					fontSize = 22,
					name = "zhancheng",
					type = "label",
					top = 8,
					xcenter = 0,
					text = language.get("222511_dongying"),
					align = kCCTextAlignmentCenter,
					color = colorText[10002]
				},
				{
					xcenter = 0,
					name = "allRewardReceivedLabel",
					visible = false,
					type = "label",
					fontSize = 30,
					y = 55,
					text = language.get(113009),
					align = kCCTextAlignmentCenter,
					color = ccc3(214, 85, 64)
				},
				{
					xcenter = -95,
					name = "generalHead1",
					y = 244,
					type = "pic",
					pic = "res/ui/common/quailtyFrames/quality_frame_1.png",
					children = {
						{
							xcenter = 0,
							name = "head1",
							type = "pic",
							ycenter = 0,
							pic = "res/ui/common/generalPic/generalPic_0.jpg"
						},
						{
							xcenter = -30,
							ycenter = 30,
							pic = "res/ui/world/cityCombo/cclp_no_1.png",
							type = "pic"
						},
						{
							fontSize = 22,
							name = "zhanCheng1",
							type = "label",
							ycenter = -20,
							xcenter = 55,
							anchorPointX = 0,
							text = language.get("222512_dongying", 0),
							color = colorText[10004]
						},
						{
							fontSize = 22,
							name = "generalName1",
							text = "???",
							type = "label",
							ycenter = 20,
							xcenter = 55,
							anchorPointX = 0,
							color = colorText[10004]
						}
					}
				},
				{
					xcenter = -95,
					name = "generalHead2",
					y = 148,
					type = "pic",
					pic = "res/ui/common/quailtyFrames/quality_frame_1.png",
					children = {
						{
							xcenter = 0,
							name = "head2",
							type = "pic",
							ycenter = 0,
							pic = "res/ui/common/generalPic/generalPic_0.jpg"
						},
						{
							xcenter = -30,
							ycenter = 30,
							pic = "res/ui/world/cityCombo/cclp_no_2.png",
							type = "pic"
						},
						{
							fontSize = 22,
							name = "zhanCheng2",
							type = "label",
							ycenter = -20,
							xcenter = 55,
							anchorPointX = 0,
							text = language.get("222512_dongying", 0),
							color = colorText[10004]
						},
						{
							fontSize = 22,
							name = "generalName2",
							text = "???",
							type = "label",
							ycenter = 20,
							xcenter = 55,
							anchorPointX = 0,
							color = colorText[10004]
						}
					}
				},
				{
					xcenter = -95,
					name = "generalHead3",
					y = 52,
					type = "pic",
					pic = "res/ui/common/quailtyFrames/quality_frame_1.png",
					children = {
						{
							xcenter = 0,
							name = "head3",
							type = "pic",
							ycenter = 0,
							pic = "res/ui/common/generalPic/generalPic_0.jpg"
						},
						{
							xcenter = -30,
							ycenter = 30,
							pic = "res/ui/world/cityCombo/cclp_no_3.png",
							type = "pic"
						},
						{
							fontSize = 22,
							name = "zhanCheng3",
							type = "label",
							ycenter = -20,
							xcenter = 55,
							anchorPointX = 0,
							text = language.get("222512_dongying", 0),
							color = colorText[10004]
						},
						{
							fontSize = 22,
							name = "generalName3",
							text = "???",
							type = "label",
							ycenter = 20,
							xcenter = 55,
							anchorPointX = 0,
							color = colorText[10004]
						}
					}
				}
			}
		},
		{
			type = "button",
			buttons = {
				{
					pic2 = "frame:btn_close_c.png",
					name = "closeItem",
					pic1 = "frame:btn_close_a.png",
					y = 605,
					scale = 2,
					x = 930
				}
			}
		}
	}
}

function var_0_0.ctor(arg_2_0)
	arg_2_0.view = {}

	local var_2_0 = smgr.getLayer("topLayer")

	var_2_0:removeAllChildrenWithCleanup(true)
	var_2_0:addChild(arg_2_0)

	arg_2_0.view = autoUI.initUI(arg_2_0, arg_2_0.layout)

	swallowTouch(arg_2_0)

	local function var_2_1()
		smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
	end

	arg_2_0.view.closeItem:registerScriptTapHandler(var_2_1)
	arg_2_0:refresh()
end

function var_0_0.getRankListInfoCellData(arg_4_0, arg_4_1)
	local var_4_0 = colorText[10003]

	if arg_4_1.cId == arg_4_0.data.selfCId then
		var_4_0 = ccc3(255, 190, 33)
	end

	return {
		height = 39,
		type = "layer_color",
		width = 558,
		color = ccc4(0, 0, 128, 0),
		children = {
			{
				fontSize = 22,
				type = "label",
				top = 5,
				x = 40,
				text = arg_4_1.index,
				color = var_4_0
			},
			{
				fontSize = 22,
				type = "label",
				top = 5,
				x = 160,
				text = arg_4_1.name,
				color = var_4_0
			},
			{
				fontSize = 22,
				type = "label",
				top = 5,
				x = 310,
				text = arg_4_1.lv,
				color = var_4_0
			},
			{
				fontSize = 22,
				type = "label",
				top = 5,
				x = 455,
				text = arg_4_1.score,
				color = var_4_0
			}
		}
	}
end

function var_0_0.createRankListTableView(arg_5_0, arg_5_1)
	local var_5_0 = CCTableView:create(CCSizeMake(557, 283))

	var_5_0:setDirection(kCCScrollViewDirectionVertical)
	var_5_0:setVerticalFillOrder(kCCTableViewFillTopDown)

	local function var_5_1(arg_6_0, arg_6_1)
		return
	end

	local function var_5_2(arg_7_0, arg_7_1)
		return
	end

	local function var_5_3(arg_8_0, arg_8_1)
		return
	end

	local function var_5_4(arg_9_0, arg_9_1)
		return 39, 557
	end

	local function var_5_5(arg_10_0, arg_10_1)
		local var_10_0 = arg_5_1[arg_10_1 + 1]
		local var_10_1 = arg_10_0:dequeueCell()

		if var_10_1 then
			var_10_1:removeAllChildrenWithCleanup(true)
		else
			var_10_1 = CCTableViewCell:new()
		end

		local var_10_2 = CCSprite:create(string.format("res/ui/rankInfo/twoRankInfo/rank_list_bg_%s.jpg", arg_10_1 % 2))

		var_10_2:setAnchorPoint(CCPointMake(0, 0))
		var_10_2:setPosition(CCPointMake(0, 0))

		local var_10_3 = autoUI.createUI(var_10_2, arg_5_0:getRankListInfoCellData(var_10_0), nil)

		var_10_1:addChild(var_10_2)

		return var_10_1
	end

	local function var_5_6()
		if arg_5_1 then
			return #arg_5_1
		else
			return 1
		end
	end

	var_5_0:registerScriptHandler(var_5_1, CCTableView.kTableCellHighLight)
	var_5_0:registerScriptHandler(var_5_2, CCTableView.kTableCellUnhighLight)
	var_5_0:registerScriptHandler(var_5_3, CCTableView.kTableCellTouched)
	var_5_0:registerScriptHandler(var_5_4, CCTableView.kTableCellSizeForIndex)
	var_5_0:registerScriptHandler(var_5_5, CCTableView.kTableCellSizeAtIndex)
	var_5_0:registerScriptHandler(var_5_6, CCTableView.kNumberOfCellsInTableView)
	var_5_0:reloadData()

	return var_5_0
end

function var_0_0.refresh(arg_12_0)
	local function var_12_0(arg_13_0)
		arg_12_0.data = arg_13_0.data

		if arg_12_0.view.rankListTableView then
			pcall(arg_12_0.view.rankListTableView.removeFromParentAndCleanup, arg_12_0.view.rankListTableView, true)
		end

		if arg_12_0.data.allRankings and #arg_12_0.data.allRankings > 0 then
			arg_12_0.view.rankListTableView = arg_12_0:createRankListTableView(arg_12_0.data.allRankings)

			arg_12_0.view.rankListTableView:setPosition(3, 4)
			arg_12_0.view.playerListBackground:addChild(arg_12_0.view.rankListTableView)
		end

		if arg_12_0.data.generals then
			arg_12_0:setGeneralTownInfo(arg_12_0.data.generals)
		end

		if user.jpsIndex > 0 then
			arg_12_0.view.zhanjiangshu:setString(arg_12_0.data.selfScore or 0)
		else
			arg_12_0.view.zhanjiangshu:setString(tool.toint((arg_12_0.data.selfScore or 0) / 10000))
			arg_12_0.view.zhanjiangPrefix:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/dongying/word_sds.png"):displayFrame())
			arg_12_0.view.zhanjiangSuffix:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/dongying/word_wanren.png"):displayFrame())
			arg_12_0.view.zhanjiangPrefix:setPosition(ccp(421, 125))
			arg_12_0.view.zhanjiangshu:setPosition(ccp(641, 125))
			arg_12_0.view.zhanjiangSuffix:setPosition(ccp(832, 125))
		end

		arg_12_0.view.myRankInfo:setString(language.get("222510_dongying", arg_12_0.data.selfIndex or 0))
	end

	kfcmgr.sendRequest(var_12_0, actions.kfgzGetKillGeneralInfos)
end

function var_0_0.setGeneralTownInfo(arg_14_0, arg_14_1)
	local function var_14_0(arg_15_0)
		if arg_15_0 == 1 then
			return ccc3(255, 255, 255)
		elseif arg_15_0 == 2 then
			return ccc3(0, 0, 255)
		elseif arg_15_0 == 3 then
			return ccc3(0, 255, 0)
		elseif arg_15_0 == 4 then
			return ccc3(255, 255, 0)
		elseif arg_15_0 == 5 then
			return ccc3(255, 0, 0)
		else
			return ccc3(255, 0, 255)
		end
	end

	for iter_14_0 = 1, 3 do
		if arg_14_1 and arg_14_1[iter_14_0] then
			local var_14_1 = CCSprite:create("res/ui/common/generalPic/generalPic_" .. (arg_14_1[iter_14_0].pic or "") .. ".jpg")

			arg_14_0.view["head" .. iter_14_0]:setDisplayFrame(var_14_1:displayFrame())

			local var_14_2 = CCSprite:create("res/ui/common/quailtyFrames/quality_frame_" .. (arg_14_1[iter_14_0].quality or 6) .. ".png")

			arg_14_0.view["generalHead" .. iter_14_0]:setDisplayFrame(var_14_2:displayFrame())
			arg_14_0.view["zhanCheng" .. iter_14_0]:setString(language.get("222512_dongying", arg_14_1[iter_14_0].generalScore or "0"))
			arg_14_0.view["generalName" .. iter_14_0]:setString(arg_14_1[iter_14_0].generalName or "")
			arg_14_0.view["generalName" .. iter_14_0]:setColor(var_14_0(arg_14_1[iter_14_0].quality or 6))
		end
	end

	return arg_14_1
end

function var_0_0.onEnter(arg_16_0)
	return
end

function var_0_0.onExit(arg_17_0)
	return
end

return var_0_0
