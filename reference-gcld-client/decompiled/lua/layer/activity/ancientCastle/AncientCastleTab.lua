local var_0_0 = require("lua/common/CCBNode")

require("lua/layer/activity/ancientCastle/config/MidMap")

local var_0_1 = require("res/native/offset").get("layer.activity.ancientCastle.ancientCastleTab")
local var_0_2 = class("AncientCastleTab", function()
	return createBaseLayer()
end)
local var_0_3 = {
	{
		pic = "res/ui/activity/ancientCastle/loulan.png",
		midPic = "res/ui/activity/ancientCastle/loulanjiemianditu.jpg"
	},
	{
		pic = "res/ui/activity/ancientCastle/dunhuang.png",
		midPic = "res/ui/activity/ancientCastle/dunhuangjiemianditu.jpg"
	},
	{
		pic = "res/ui/activity/ancientCastle/qiangwu.png",
		midPic = "res/ui/activity/ancientCastle/qiangwujiemditu.jpg"
	},
	{
		pic = "res/ui/activity/ancientCastle/qiangwu.png",
		midPic = "res/ui/activity/ancientCastle/qiangwujiemditu.jpg"
	}
}
local var_0_4 = {
	"res/ui/activity/ancientCastle/mz1.PNG",
	"res/ui/activity/ancientCastle/mz3.PNG",
	"res/ui/activity/ancientCastle/mz5.PNG"
}
local var_0_5 = {
	"res/ui/activity/ancientCastle/s_box_1.png",
	"res/ui/activity/ancientCastle/s_box_2.png",
	"res/ui/activity/ancientCastle/s_box_3.png"
}

tool = tool or {}

math.randomseed(os.time())

function tool.random(arg_2_0, arg_2_1)
	return math.random(arg_2_0, arg_2_1)
end

local var_0_6 = 915
local var_0_7 = 532
local var_0_8 = {
	bg = {
		xcenter = 0,
		name = "bgyanhua",
		type = "pic",
		ycenter = -23,
		pic = "res/ui/activity/ancientCastle/tbxz_bg.jpg",
		children = {
			{
				z = 200,
				type = "pic",
				pic = "res/ui/activity/ancientCastle/tbxz_title.png",
				x = var_0_6 * 0.5,
				y = var_0_7 * 0.9
			},
			{
				fontSize = 28,
				name = "leftTime",
				ycenter = 205,
				type = "label",
				xcenter = 220,
				text = "000",
				font = "Thonburi-Bold",
				anchorPoint = ccp(0, 0),
				color = ccc3(253, 98, 98)
			},
			{
				name = "jindutiaoBg",
				type = "pic",
				z = 200,
				pic = "res/default.png",
				x = var_0_6 * 0.5,
				y = var_0_7 * 0.75,
				children = {
					{
						x = -337,
						z = 200,
						type = "pic",
						ycenter = 0,
						pic = "res/ui/activity/ancientCastle/tbxz_tbsj_bg.png",
						children = {
							{
								xcenter = 0,
								ycenter = 0,
								pic = "res/ui/activity/ancientCastle/tbxz_tnsj_word.png",
								type = "pic"
							}
						}
					},
					{
						xcenter = 66,
						name = "processBarBackground",
						type = "pic",
						ycenter = 0,
						pic = "res/ui/activity/moveMountain/ygys_pb_b.png",
						children = {
							{
								x = 0,
								name = "progress",
								anchorPointX = 0,
								type = "process",
								ycenter = 0,
								anchorPointY = 0.5,
								pic = "res/ui/activity/moveMountain/ygys_pb.png",
								percentage = 80
							},
							{
								name = "remainBox",
								fontSize = 22,
								type = "label",
								ycenter = 0,
								xcenter = 0,
								font = "Thonburi-Bold",
								text = language.get("490010_yyl", 100),
								color = ccc3(188, 167, 145)
							}
						}
					},
					{
						width = 17,
						height = 23,
						name = "timeSecond",
						type = "atlas",
						ycenter = 0,
						pic = "res/ui/activity/ancientCastle/tbxz_word_sjl_digit.png",
						text = "0",
						visible = false,
						startChar = 48,
						x = 323,
						anchorPoint = ccp(0.5, 0.5)
					},
					{
						x = 371,
						z = 200,
						visible = false,
						type = "pic",
						ycenter = 0,
						pic = "res/ui/activity/ancientCastle/tbxz_word_m.png"
					},
					{
						visible = false,
						type = "button",
						ycenter = 2,
						x = 420,
						buttons = {
							{
								pic2 = "res/ui/activity/ancientCastle/tbxz_clock_add_c.png",
								name = "addTimeButton",
								pic1 = "res/ui/activity/ancientCastle/tbxz_clock_add.png"
							}
						}
					}
				}
			},
			{
				z = 200,
				type = "pic",
				pic = "res/default.png",
				x = var_0_6 * 0.5,
				y = var_0_7 * 0.64,
				children = {
					{
						x = -402,
						name = "infoSpriteHead",
						anchorPointX = 0,
						type = "pic",
						ycenter = 0,
						anchorPointY = 0.5,
						pic = "res/ui/activity/ancientCastle/tbxz_word_sjl.png"
					},
					{
						width = 17,
						height = 23,
						name = "shoujilv",
						type = "atlas",
						ycenter = 0,
						pic = "res/ui/activity/ancientCastle/tbxz_word_sjl_digit.png",
						anchorPointX = 0,
						text = "100",
						startChar = 48,
						anchorPointY = 0.5,
						x = -340,
						anchorPoint = ccp(0.5, 0.5)
					},
					{
						x = -299,
						name = "infoSpritePercent",
						anchorPointX = 0,
						type = "pic",
						ycenter = 0,
						anchorPointY = 0.5,
						pic = "res/ui/activity/ancientCastle/tbxz_word_sjl_symbol.png"
					},
					{
						xcenter = 3,
						name = "centerInfo",
						anchorPointX = 0,
						type = "pic",
						ycenter = 0,
						anchorPointY = 0.5,
						pic = "res/ui/activity/ancientCastle/tbxz_word_bxsjyq.png"
					}
				}
			},
			{
				name = "selectPanelParent",
				type = "pic",
				z = 200,
				pic = "res/default.png",
				x = var_0_6 * 0.5,
				y = var_0_7 * 0.54,
				children = {
					{
						x = -360,
						name = "taobaoPanel1",
						type = "pic",
						ycenter = 0,
						pic = "res/ui/activity/ancientCastle/tbxz_btn.png",
						children = {
							{
								name = "xinshou",
								ycenter = 0,
								type = "label",
								xcenter = -20,
								font = "Thonburi-Bold",
								text = language.get("490007_yyl"),
								anchorPoint = ccp(0, 0),
								fontSize = 24 + (var_0_1.tagFntSize or 0),
								color = ccc3(244, 232, 178)
							}
						}
					},
					{
						x = -200,
						name = "taobaoPanel2",
						type = "pic",
						ycenter = 0,
						pic = "res/ui/activity/ancientCastle/tbxz_btn.png",
						children = {
							{
								name = "laoshou",
								ycenter = 0,
								type = "label",
								xcenter = -20,
								font = "Thonburi-Bold",
								text = language.get("490008_yyl"),
								anchorPoint = ccp(0, 0),
								fontSize = 24 + (var_0_1.tagFntSize or 0),
								color = ccc3(244, 232, 178)
							}
						}
					},
					{
						x = -40,
						name = "taobaoPanel3",
						type = "pic",
						ycenter = 0,
						pic = "res/ui/activity/ancientCastle/tbxz_btn.png",
						children = {
							{
								name = "xianshi",
								ycenter = 0,
								type = "label",
								xcenter = -20,
								font = "Thonburi-Bold",
								text = language.get("490009_yyl"),
								anchorPoint = ccp(0, 0),
								fontSize = 24 + (var_0_1.tagFntSize or 0),
								color = ccc3(244, 232, 178)
							},
							{
								xcenter = 60,
								visible = false,
								type = "pic",
								ycenter = -3,
								pic = "res/ui/activity/ancientCastle/tbxz_clock_btn.png"
							}
						}
					},
					{
						x = 325,
						name = "touziPic",
						type = "pic",
						ycenter = 0,
						pic = "res/ui/activity/ancientCastle/tbxz_view_tz.png"
					},
					{
						width = 17,
						height = 23,
						name = "touziNum",
						type = "atlas",
						ycenter = 0,
						pic = "res/ui/activity/ancientCastle/tbxz_word_sjl_digit.png",
						text = "20",
						startChar = 48,
						x = 365,
						anchorPoint = ccp(0.5, 0.5)
					},
					{
						x = 400,
						name = "touzi_ci",
						anchorPointX = 0,
						type = "pic",
						ycenter = 0,
						anchorPointY = 0.5,
						pic = "res/ui/activity/ancientCastle/tbxz_word_c.png"
					}
				}
			},
			{
				name = "map1back",
				type = "pic",
				pic = "res/ui/activity/ancientCastle/smallMap/tbxz_view_map01.jpg",
				x = var_0_6 * 0.17,
				y = var_0_7 * 0.25,
				children = {
					{
						xcenter = 0,
						ycenter = 0,
						pic = "res/ui/activity/ancientCastle/tbxz_view_mask1.png",
						type = "pic"
					},
					{
						xcenter = 0,
						name = "map1",
						type = "pic",
						ycenter = -70,
						pic = "res/ui/activity/ancientCastle/tbxz_view_word_bg.png",
						children = {
							{
								xcenter = 0,
								name = "map1word",
								type = "label",
								ycenter = 4,
								fontSize = 24,
								font = "Thonburi",
								text = language.get("490011_yyl"),
								color = ccc3(244, 232, 178)
							}
						}
					},
					{
						xcenter = 0,
						ycenter = -67,
						type = "button",
						buttons = {
							{
								pic2 = "frame:btn_default_lighted.png",
								name = "map1Button",
								pic1 = "frame:btn_default_normal.png",
								children = {
									{
										xcenter = 0,
										font = "Thonburi",
										fontSize = 24,
										type = "label",
										ycenter = 0,
										text = language.get("490014_yyl"),
										color = ccc3(244, 232, 178)
									}
								}
							}
						}
					},
					{
						xcenter = 90,
						name = "map1icon",
						type = "pic",
						ycenter = -70,
						pic = "frame:res_icon_4.png"
					},
					{
						xcenter = 0,
						name = "leftStep1",
						fontSize = 24,
						type = "label",
						ycenter = 10,
						color = colorQuality[5]
					}
				}
			},
			{
				name = "map2back",
				type = "pic",
				pic = "res/ui/activity/ancientCastle/smallMap/tbxz_view_map02.jpg",
				x = var_0_6 * 0.5,
				y = var_0_7 * 0.25,
				children = {
					{
						xcenter = 0,
						ycenter = 0,
						pic = "res/ui/activity/ancientCastle/tbxz_view_mask1.png",
						type = "pic"
					},
					{
						xcenter = 0,
						name = "map2",
						type = "pic",
						ycenter = -70,
						pic = "res/ui/activity/ancientCastle/tbxz_view_word_bg.png",
						children = {
							{
								xcenter = 0,
								name = "map2word",
								type = "label",
								ycenter = 4,
								fontSize = 24,
								font = "Thonburi",
								text = language.get("490012_yyl"),
								color = ccc3(244, 232, 178)
							}
						}
					},
					{
						xcenter = 0,
						ycenter = -67,
						type = "button",
						buttons = {
							{
								pic2 = "frame:btn_default_lighted.png",
								name = "map2Button",
								pic1 = "frame:btn_default_normal.png",
								children = {
									{
										xcenter = 0,
										font = "Thonburi",
										fontSize = 24,
										type = "label",
										ycenter = 0,
										text = language.get("490014_yyl"),
										color = ccc3(244, 232, 178)
									}
								}
							}
						}
					},
					{
						xcenter = 90,
						name = "map2icon",
						type = "pic",
						ycenter = -70,
						pic = "frame:res_icon_7.png"
					},
					{
						xcenter = 0,
						name = "leftStep2",
						fontSize = 24,
						type = "label",
						ycenter = 10,
						color = colorQuality[5]
					}
				}
			},
			{
				name = "map3back",
				type = "pic",
				pic = "res/ui/activity/ancientCastle/smallMap/tbxz_view_map03.jpg",
				x = var_0_6 * 0.83,
				y = var_0_7 * 0.25,
				children = {
					{
						xcenter = 0,
						ycenter = 0,
						pic = "res/ui/activity/ancientCastle/tbxz_view_mask1.png",
						type = "pic"
					},
					{
						xcenter = 0,
						name = "map3",
						type = "pic",
						ycenter = -70,
						pic = "res/ui/activity/ancientCastle/tbxz_view_word_bg.png",
						children = {
							{
								xcenter = 0,
								name = "map3word",
								type = "label",
								ycenter = 4,
								fontSize = 24,
								font = "Thonburi",
								text = language.get("490013_yyl"),
								color = ccc3(244, 232, 178)
							}
						}
					},
					{
						xcenter = 0,
						ycenter = -67,
						type = "button",
						buttons = {
							{
								pic2 = "frame:btn_default_lighted.png",
								name = "map3Button",
								pic1 = "frame:btn_default_normal.png",
								children = {
									{
										xcenter = 0,
										font = "Thonburi",
										fontSize = 24,
										type = "label",
										ycenter = 0,
										text = language.get("490014_yyl"),
										color = ccc3(244, 232, 178)
									}
								}
							}
						}
					},
					{
						xcenter = 90,
						name = "map3icon",
						type = "pic",
						ycenter = -70,
						pic = "res/ui/activity/ancientCastle/tbxz_icon_bsjl.png"
					},
					{
						xcenter = 0,
						name = "leftStep3",
						fontSize = 24,
						type = "label",
						ycenter = 10,
						color = colorQuality[5]
					}
				}
			},
			{
				name = "map4back",
				type = "pic",
				pic = "res/ui/activity/ancientCastle/smallMap/tbxz_view_map04.jpg",
				x = var_0_6 * 0.5,
				y = var_0_7 * 0.25,
				children = {
					{
						xcenter = 0,
						ycenter = 0,
						pic = "res/ui/activity/ancientCastle/tbxz_view_mask2.png",
						type = "pic"
					},
					{
						xcenter = 0,
						name = "map4",
						type = "pic",
						ycenter = -70,
						pic = "res/ui/activity/ancientCastle/tbxz_view_word_bg.png",
						children = {
							{
								xcenter = 0,
								name = "map4word",
								type = "label",
								ycenter = 4,
								fontSize = 24,
								font = "Thonburi",
								text = language.get(72003),
								color = ccc3(244, 232, 178)
							}
						}
					},
					{
						xcenter = 0,
						ycenter = -67,
						type = "button",
						buttons = {
							{
								pic2 = "frame:btn_default_lighted.png",
								name = "map4Button",
								pic1 = "frame:btn_default_normal.png",
								children = {
									{
										xcenter = 0,
										font = "Thonburi",
										fontSize = 24,
										type = "label",
										ycenter = 0,
										text = language.get("490014_yyl"),
										color = ccc3(244, 232, 178)
									}
								}
							}
						}
					},
					{
						xcenter = 0,
						ycenter = -67,
						type = "button",
						buttons = {
							{
								pic2 = "frame:btn_default_lighted.png",
								name = "map4Button2",
								pic1 = "frame:btn_default_normal.png",
								children = {
									{
										xcenter = 0,
										font = "Thonburi",
										fontSize = 24,
										type = "label",
										ycenter = 0,
										text = language.get("490016_yyl"),
										color = ccc3(244, 232, 178)
									}
								}
							}
						}
					},
					{
						xcenter = 0,
						name = "map4icon",
						type = "pic",
						ycenter = 10,
						pic = "res/ui/activity/ancientCastle/tbxz_wcjqjs_word.png"
					},
					{
						xcenter = -100,
						name = "map4gold",
						scale = 1.2,
						type = "pic",
						ycenter = -65,
						pic = "frame:res_icon_19.png",
						children = {
							{
								xcenter = 0,
								name = "map4goldNum",
								text = "0",
								type = "label",
								ycenter = -15,
								fontSize = 20,
								font = "Thonburi",
								color = ccc3(244, 232, 178)
							}
						}
					},
					{
						xcenter = 0,
						name = "leftStep4",
						fontSize = 24,
						type = "label",
						ycenter = 10,
						color = colorQuality[5]
					}
				}
			}
		}
	}
}

function tool.reOrderNode(arg_3_0)
	local var_3_0 = arg_3_0:getChildren()

	if var_3_0 and var_3_0:count() > 0 then
		for iter_3_0 = 0, var_3_0:count() - 1 do
			local var_3_1 = tolua.cast(var_3_0:objectAtIndex(iter_3_0), "CCNode")

			arg_3_0:reorderChild(var_3_1, iter_3_0 + 1)
		end
	end
end

function var_0_2.ctor(arg_4_0, arg_4_1, arg_4_2)
	if user.inAdventure == true then
		smgr.changeScene(SCENE_ADVENTURE, user.mapId)

		return
	end

	arg_4_0.data = arg_4_2
	arg_4_0.tableview = {}
	arg_4_0.tableview = autoUI.initUI(arg_4_0, var_0_8)

	arg_4_1:addChild(arg_4_0)
	arg_4_0:registerScriptTouchHandler(handler(arg_4_0, arg_4_0.onTouch))
	arg_4_0:setTouchEnabled(true)

	arg_4_0.selectMapId = 0
	arg_4_0.selectPanel = 1

	if arg_4_0.data.maps[1].mapLv == 1 then
		arg_4_0.selectPanel = 1
	elseif arg_4_0.data.maps[1].mapLv == 2 and arg_4_0.data.maps[4].open == false then
		arg_4_0.selectPanel = 2
	else
		arg_4_0.selectPanel = 3
	end

	local function var_4_0()
		local function var_5_0(arg_6_0)
			if arg_6_0.action.data then
				arg_4_0.data.totalTime = arg_4_0.data.totalTime + arg_6_0.action.data.addTime

				arg_4_0:setTaobaoPanel()
			end
		end

		cmgr.sendRequest(var_5_0, actions.buyAncientTime)
	end

	arg_4_0.tableview.addTimeButton:registerScriptTapHandler(function()
		messageBox.showChargeWin(language.get(10003), language.get("490017_yyl", arg_4_0.data.timeGold, arg_4_0.data.goldTime), "ancientBuyTime", var_4_0)
	end)

	for iter_4_0 = 1, 4 do
		local function var_4_1(arg_8_0)
			user.inAdventure = arg_8_0.action.data.inAdventure

			smgr.changeScene(SCENE_ADVENTURE, arg_4_0.selectMapId)
		end

		arg_4_0.tableview["map" .. iter_4_0 .. "Button"]:registerScriptTapHandler(function()
			arg_4_0.selectMapId = arg_4_0.data.maps[iter_4_0].mapId

			if arg_4_0.selectMapId ~= 4 and user.inAdventureMiddleGiveup and user.inAdventureMiddleGiveup == true then
				user.inAdventureMiddleGiveup = false

				smgr.changeScene(SCENE_ADVENTURE, arg_4_0.selectMapId)
			else
				cmgr.sendRequest(var_4_1, actions.chooseAdventure, arg_4_0.selectMapId)
			end
		end)
		arg_4_0.tableview["leftStep" .. iter_4_0]:setHorizontalAlignment(kCCTextAlignmentCenter)
	end

	local function var_4_2(arg_10_0)
		eventManager.dispatchEvent("getActivityInfo")
	end

	arg_4_0.tableview.map4Button2:registerScriptTapHandler(function()
		messageBox.confirm(language.get("490005_yyl", arg_4_0.data.restartGold), function()
			cmgr.sendRequest(var_4_2, actions.restartMap)
		end)
	end)
	arg_4_0:setTaobaoPanel()
end

function var_0_2.setTaobaoPanel(arg_13_0)
	arg_13_0.tableview.remainBox:setString(language.get("490010_yyl", arg_13_0.data.nowBoxNum))
	arg_13_0.tableview.progress:setPercentage(arg_13_0.data.nowBoxNum / (arg_13_0.data.nowBoxNum + arg_13_0.data.leftBox) * 100)
	arg_13_0.tableview.timeSecond:setString(math.floor(arg_13_0.data.totalTime))

	if arg_13_0.selectPanel == 1 then
		arg_13_0.tableview.shoujilv:setString(arg_13_0.data.percent1)
	elseif arg_13_0.selectPanel == 2 then
		arg_13_0.tableview.shoujilv:setString(arg_13_0.data.percent2)
	else
		arg_13_0.tableview.shoujilv:setString(arg_13_0.data.maps[4].percentage)
	end

	arg_13_0.tableview.touziNum:setString(arg_13_0.data.maps[arg_13_0.selectPanel].todayTimes)

	for iter_13_0 = 1, 3 do
		if iter_13_0 == arg_13_0.selectPanel then
			arg_13_0.tableview["taobaoPanel" .. iter_13_0]:setDisplayFrame(CCSprite:create("res/ui/activity/ancientCastle/tbxz_btn_c.png"):displayFrame())
			arg_13_0.tableview.selectPanelParent:reorderChild(arg_13_0.tableview["taobaoPanel" .. iter_13_0], 100)
		else
			arg_13_0.tableview["taobaoPanel" .. iter_13_0]:setDisplayFrame(CCSprite:create("res/ui/activity/ancientCastle/tbxz_btn.png"):displayFrame())
			arg_13_0.tableview.selectPanelParent:reorderChild(arg_13_0.tableview["taobaoPanel" .. iter_13_0], 90 + iter_13_0)
		end
	end

	if arg_13_0.selectPanel == 1 then
		arg_13_0.tableview.map1back:setVisible(true)
		arg_13_0.tableview.map2back:setVisible(true)
		arg_13_0.tableview.map3back:setVisible(true)
		arg_13_0.tableview.map4back:setVisible(false)
	elseif arg_13_0.selectPanel == 2 then
		arg_13_0.tableview.map1back:setVisible(true)
		arg_13_0.tableview.map2back:setVisible(true)
		arg_13_0.tableview.map3back:setVisible(true)
		arg_13_0.tableview.map4back:setVisible(false)
	elseif arg_13_0.selectPanel == 3 then
		arg_13_0.tableview.map1back:setVisible(false)
		arg_13_0.tableview.map2back:setVisible(false)
		arg_13_0.tableview.map3back:setVisible(false)
		arg_13_0.tableview.map4back:setVisible(true)
	end

	if arg_13_0.selectPanel == 1 or arg_13_0.selectPanel == 2 then
		local var_13_0 = false

		if arg_13_0.data.maps[4].open == true or arg_13_0.selectPanel < arg_13_0.data.maps[1].mapLv then
			var_13_0 = true
		end

		for iter_13_1 = 3, 1, -1 do
			if arg_13_0.selectPanel == 1 then
				arg_13_0.tableview["map" .. iter_13_1 .. "icon"]:setVisible(false)
			else
				arg_13_0.tableview["map" .. iter_13_1 .. "icon"]:setVisible(true)

				local var_13_1 = arg_13_0.data.maps[iter_13_1].lv2Reward[1].type

				if var_13_1 == 4 then
					arg_13_0.tableview["map" .. iter_13_1 .. "icon"]:setDisplayFrame(tool.spriteFrameByName("res_icon_4.png"))
				elseif var_13_1 == 10 then
					arg_13_0.tableview["map" .. iter_13_1 .. "icon"]:setDisplayFrame(tool.spriteFrameByName("res_icon_6.png"))
				elseif var_13_1 == 17 then
					arg_13_0.tableview["map" .. iter_13_1 .. "icon"]:setDisplayFrame(tool.spriteFrameByName("res_icon_7.png"))
				elseif var_13_1 == 16 then
					arg_13_0.tableview["map" .. iter_13_1 .. "icon"]:setDisplayFrame(CCSprite:create("res/ui/activity/ancientCastle/tbxz_icon_bsjl.png"):displayFrame())
				elseif var_13_1 == 15 then
					arg_13_0.tableview["map" .. iter_13_1 .. "icon"]:setDisplayFrame(tool.spriteFrameByName("res_icon_15.png"))
				elseif var_13_1 == 14 then
					arg_13_0.tableview["map" .. iter_13_1 .. "icon"]:setDisplayFrame(tool.spriteFrameByName("res_icon_100.png"))
				else
					arg_13_0.tableview["map" .. iter_13_1 .. "icon"]:setVisible(false)
				end
			end

			if arg_13_0.data.maps[iter_13_1].open == true and var_13_0 == false and arg_13_0.data.maps[iter_13_1].mapLv == arg_13_0.selectPanel and arg_13_0.data.maps[4].open == false then
				var_13_0 = true

				arg_13_0.tableview["map" .. iter_13_1 .. "back"]:setDisplayFrame(CCSprite:create("res/ui/activity/ancientCastle/smallMap/tbxz_view_map0" .. iter_13_1 .. ".jpg"):displayFrame())
				arg_13_0.tableview["map" .. iter_13_1 .. "Button"]:setVisible(true)
				arg_13_0.tableview["map" .. iter_13_1]:setVisible(false)
			else
				arg_13_0.tableview["map" .. iter_13_1 .. "back"]:setDisplayFrame(CCSprite:create("res/ui/activity/ancientCastle/smallMap/tbxz_view_map0" .. iter_13_1 .. "_g.jpg"):displayFrame())
				arg_13_0.tableview["map" .. iter_13_1 .. "Button"]:setVisible(false)
				arg_13_0.tableview["map" .. iter_13_1]:setVisible(true)

				if var_13_0 == true then
					arg_13_0.tableview["map" .. iter_13_1 .. "word"]:setString(language.get("490015_yyl"))
				elseif iter_13_1 == 1 then
					arg_13_0.tableview["map" .. iter_13_1 .. "word"]:setString(language.get("490011_yyl"))
				elseif iter_13_1 == 2 then
					arg_13_0.tableview["map" .. iter_13_1 .. "word"]:setString(language.get("490012_yyl"))
				elseif iter_13_1 == 3 then
					arg_13_0.tableview["map" .. iter_13_1 .. "word"]:setString(language.get("490013_yyl"))
				end
			end
		end
	elseif arg_13_0.data.maps[4].open ~= true or arg_13_0.data.allMapOver == true then
		arg_13_0.tableview.map4back:setDisplayFrame(CCSprite:create("res/ui/activity/ancientCastle/smallMap/tbxz_view_map04_g.jpg"):displayFrame())
		arg_13_0.tableview.map4icon:setVisible(true)

		if arg_13_0.data.allMapOver == true then
			arg_13_0.tableview.map4icon:setDisplayFrame(CCSprite:create("res/ui/activity/ancientCastle/tbxz_word_nywcqbtb.png"):displayFrame())
		end

		arg_13_0.tableview.map4Button:setVisible(false)
		arg_13_0.tableview.map4Button2:setVisible(false)
		arg_13_0.tableview.map4word:setVisible(true)
		arg_13_0.tableview.map4:setVisible(true)
		arg_13_0.tableview.map4gold:setVisible(false)
	elseif arg_13_0.data.canRestart == true then
		arg_13_0.tableview.map4back:setDisplayFrame(CCSprite:create("res/ui/activity/ancientCastle/smallMap/tbxz_view_map04_g.jpg"):displayFrame())
		arg_13_0.tableview.map4icon:setVisible(false)
		arg_13_0.tableview.map4Button:setVisible(false)
		arg_13_0.tableview.map4Button2:setVisible(true)
		arg_13_0.tableview.map4word:setVisible(false)
		arg_13_0.tableview.map4:setVisible(false)
		arg_13_0.tableview.map4gold:setVisible(true)
		arg_13_0.tableview.map4goldNum:setString(arg_13_0.data.restartGold)
	else
		arg_13_0.tableview.map4back:setDisplayFrame(CCSprite:create("res/ui/activity/ancientCastle/smallMap/tbxz_view_map04.jpg"):displayFrame())
		arg_13_0.tableview.map4icon:setVisible(false)
		arg_13_0.tableview.map4Button:setVisible(true)
		arg_13_0.tableview.map4Button2:setVisible(false)
		arg_13_0.tableview.map4word:setVisible(false)
		arg_13_0.tableview.map4:setVisible(false)
		arg_13_0.tableview.map4gold:setVisible(false)
	end

	for iter_13_2 = 1, 4 do
		arg_13_0.tableview["leftStep" .. iter_13_2]:setVisible(false)

		if arg_13_0.tableview["map" .. iter_13_2 .. "back"]:isVisible() and arg_13_0.tableview["map" .. iter_13_2 .. "Button"]:isVisible() then
			local var_13_2 = arg_13_0.data.maps[iter_13_2].leftSteps

			if var_13_2 and var_13_2 > 0 then
				arg_13_0.tableview["leftStep" .. iter_13_2]:setString(language.get("490020_zww", var_13_2))
				arg_13_0.tableview["leftStep" .. iter_13_2]:setVisible(true)
			end
		end
	end

	arg_13_0:refineLayout()
end

function var_0_2.handlerGetAllFinalBox(arg_14_0, arg_14_1)
	local var_14_0 = {
		[100003] = 26,
		[2001] = 2001,
		[2002] = 2002,
		[100004] = 27
	}
	local var_14_1 = {}

	for iter_14_0, iter_14_1 in pairs(arg_14_1.action.data.rewards) do
		var_14_1[iter_14_0] = {}
		var_14_1[iter_14_0].id = var_14_0[iter_14_1.type]
		var_14_1[iter_14_0].value = 1
	end

	globalAction_gotResource(var_14_1)
	performWithDelay(arg_14_0, function()
		eventManager.dispatchEvent("getActivityInfo")
	end, 2)
end

function var_0_2.onTouch(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	if arg_16_1 == CCTOUCHBEGAN then
		for iter_16_0 = 3, 1, -1 do
			if tool.checkIfTouch(arg_16_0.tableview["taobaoPanel" .. iter_16_0], arg_16_2, arg_16_3) then
				arg_16_0.selectPanel = iter_16_0

				log.info("self.selectPanel = ", iter_16_0)
				arg_16_0:setTaobaoPanel()

				break
			end
		end
	end

	return true
end

function var_0_2.handlerChooseAdventure(arg_17_0, arg_17_1)
	user.inAdventure = arg_17_1.action.data.inAdventure

	smgr.changeScene(SCENE_ADVENTURE, arg_17_0.selectMapId)
end

function var_0_2.handlerRestartMap(arg_18_0, arg_18_1)
	eventManager.dispatchEvent("getActivityInfo")
end

function var_0_2.startAdventure(arg_19_0)
	if arg_19_0.data.canRestart == true then
		if arg_19_0.data.noTotalReward == false then
			cmgr.sendRequest(handler(arg_19_0, arg_19_0.handlerGetAllFinalBox), actions.getAllFinalBox)
		else
			messageBox.confirm(language.get("490005_yyl", arg_19_0.data.restartGold), function()
				cmgr.sendRequest(handler(arg_19_0, arg_19_0.handlerRestartMap), actions.restartMap)
			end)
		end
	elseif arg_19_0.selectMapId then
		if user.inAdventure == true then
			smgr.changeScene(SCENE_ADVENTURE, arg_19_0.selectMapId)
		else
			cmgr.sendRequest(handler(arg_19_0, arg_19_0.handlerChooseAdventure), actions.chooseAdventure, arg_19_0.selectMapId)
		end
	end
end

function var_0_2.maskBigBox(arg_21_0)
	local var_21_0 = true

	arg_21_0.inMask = true

	arg_21_0.finalBox:setVisible(false)

	local var_21_1 = CCLayerColor:create(ccc4(0, 0, 0, 160))

	var_21_1:setContentSize(arg_21_0.background:getContentSize())
	var_21_1:setPosition(0, 0)
	arg_21_0.background:addChild(var_21_1, 100)

	local var_21_2 = CCSprite:create("res/ui/activity/ancientCastle/big_1.png")

	var_21_2:setPosition(arg_21_0.finalBox:getPosition())
	var_21_1:addChild(var_21_2)

	local var_21_3 = CCSprite:create("res/ui/activity/ironRotary/btdzp_lig.png")

	var_21_3:setPosition(var_21_2:getContentSize().width / 2, var_21_2:getContentSize().height / 2)
	var_21_3:runAction(CCRepeatForever:create(CCRotateBy:create(2, 360)))
	var_21_2:addChild(var_21_3, -1)
	var_21_1:registerScriptTouchHandler(function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == CCTOUCHENDED then
			if var_21_0 == false then
				var_21_0 = true
			else
				return
			end

			var_21_2:setDisplayFrame(CCSprite:create("res/ui/activity/ancientCastle/big_2.png"):displayFrame())
			cmgr.sendRequest(handler(arg_21_0, arg_21_0.handlerGetAllFinalBox), actions.getAllFinalBox)
		end

		return true
	end, false, true)
	var_21_1:setTouchEnabled(true)

	local var_21_4 = CCSequence:createWithTwoActions(CCEaseExponentialOut:create(CCMoveTo:create(2, ccp(arg_21_0.background:getContentSize().width / 2, arg_21_0.background:getContentSize().height / 2))), CCCallFunc:create(function()
		var_21_0 = false
	end))

	var_21_2:runAction(var_21_4)
end

function var_0_2.refineLayout(arg_24_0)
	arg_24_0.tableview.infoSpriteHead:setPositionX(-440)
	arg_24_0.tableview.shoujilv:setPositionX(arg_24_0.tableview.infoSpriteHead:getPositionX() + arg_24_0.tableview.infoSpriteHead:getContentSize().width + 4)
	arg_24_0.tableview.infoSpritePercent:setPositionX(arg_24_0.tableview.shoujilv:getPositionX() + arg_24_0.tableview.shoujilv:getContentSize().width + 4)
	arg_24_0.tableview.centerInfo:setPositionX(arg_24_0.tableview.infoSpritePercent:getPositionX() + arg_24_0.tableview.infoSpritePercent:getContentSize().width)
	arg_24_0.tableview.touzi_ci:setPositionX(arg_24_0.tableview.touziNum:getPositionX() + arg_24_0.tableview.touziNum:getContentSize().width / 2 + 4)
end

return var_0_2
