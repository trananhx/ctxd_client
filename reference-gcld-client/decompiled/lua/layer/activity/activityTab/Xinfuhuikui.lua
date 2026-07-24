local var_0_0 = class("Xfhk", function()
	return createBaseLayer()
end)
local var_0_1 = {
	nil,
	nil,
	3,
	4,
	6,
	[81] = 24,
	freeHuanyin = 41,
	[42] = 5,
	[102] = 41,
	[116] = 55,
	[101] = 15,
	[21] = 7,
	[100] = 100,
	[119] = 10033,
	xinlian = 15,
	[47] = 10055,
	[126] = 10030
}
local var_0_2 = {
	bg = {
		name = "backgroundPic",
		type = "pic_9",
		pic = "frame:bigPanel.png",
		preferedSize = CCSizeMake(960, 580),
		middleRect = CCRectMake(30, 30, 45, 45),
		x = visibleSize.width / 2,
		y = visibleSize.height / 2 - 30,
		anchorPoint = ccp(0.5, 0.5),
		children = {
			{
				type = "pic",
				pic = "res/ui/activity/wish/zqxy_bg1.jpg",
				width = visibleSize.width,
				height = visibleSize.height,
				x = visibleSize.width / 2,
				y = visibleSize.height / 2 - 30,
				anchorPoint = ccp(0, 0),
				children = {
					{
						fontSize = 25,
						name = "leftTime",
						ycenter = 200,
						type = "label",
						xcenter = 355,
						font = "Thonburi-Bold",
						text = language.get(131002, "1"),
						anchorPoint = ccp(0, 0),
						color = ccc3(253, 98, 98)
					},
					{
						xcenter = 0,
						z = 400,
						type = "pic",
						ycenter = 210,
						pic = "res/ui/activity/xinfuhuikui/xfhk_biaoti_meishuzi_xfhk.png"
					},
					{
						xcenter = -340,
						name = "bigbg1",
						z = 200,
						type = "pic",
						ycenter = -50,
						pic = "res/ui/activity/xinfuhuikui/xfhk_kapai.png",
						children = {
							{
								xcenter = -50,
								scale = 1,
								type = "pic",
								ycenter = 180,
								pic = "res/ui/activity/xinfuhuikui/xfhk_meishuzi_bt.png"
							},
							{
								xcenter = 0,
								ycenter = 87,
								pic = "res/ui/common/ItemsPic/kuang.jpg",
								type = "pic"
							},
							{
								xcenter = -85,
								type = "pic",
								ycenter = 6,
								pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png",
								children = {
									{
										xcenter = 0,
										name = "dian11",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png"
									}
								}
							},
							{
								xcenter = -43,
								name = "dian12",
								type = "pic",
								ycenter = 6,
								pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png",
								children = {
									{
										xcenter = 0,
										name = "dian12",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png"
									}
								}
							},
							{
								xcenter = 0,
								name = "dian13",
								type = "pic",
								ycenter = 6,
								pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png",
								children = {
									{
										xcenter = 0,
										name = "dian13",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png"
									}
								}
							},
							{
								xcenter = 43,
								name = "dian14",
								type = "pic",
								ycenter = 6,
								pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png",
								children = {
									{
										xcenter = 0,
										name = "dian14",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png"
									}
								}
							},
							{
								xcenter = 82,
								name = "dian15",
								type = "pic",
								ycenter = 6,
								pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png",
								children = {
									{
										xcenter = 0,
										name = "dian15",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png"
									}
								}
							},
							{
								xcenter = 0,
								name = "target1",
								type = "pic",
								ycenter = -70,
								pic = "",
								children = {
									{
										xcenter = -72,
										ycenter = 20,
										pic = "res/ui/activity/xinfuhuikui/xfhk_meishuzi_sj.png",
										type = "pic"
									},
									{
										xcenter = 30,
										type = "pic",
										ycenter = 20,
										pic = "res/ui/activity/xinfuhuikui/xfhk_shuzi_di.png",
										children = {
											{
												xcenter = 0,
												name = "used1",
												text = "100",
												type = "label",
												ycenter = 0,
												fontSize = 16,
												font = "Thonburi-Bold",
												color = ccc3(255, 255, 255)
											}
										}
									},
									{
										xcenter = -72,
										ycenter = -25,
										pic = "res/ui/activity/xinfuhuikui/xfhk_meishuzi_zs.png",
										type = "pic"
									},
									{
										xcenter = 30,
										type = "pic",
										ycenter = -25,
										pic = "res/ui/activity/xinfuhuikui/xfhk_shuzi_di.png",
										children = {
											{
												xcenter = 0,
												name = "feed1",
												text = "100",
												type = "label",
												ycenter = 0,
												fontSize = 16,
												font = "Thonburi-Bold",
												color = ccc3(255, 255, 255)
											}
										}
									}
								}
							},
							{
								xcenter = 0,
								name = "quanbu1",
								visible = false,
								type = "pic",
								ycenter = -70,
								pic = "res/ui/activity/xinfuhuikui/xfhk_meishuzi_qbdc.png"
							},
							{
								xcenter = 0,
								name = "swks1",
								visible = false,
								type = "pic",
								ycenter = -160,
								pic = "res/ui/activity/xinfuhuikui/xfhk_btn_meishuzi_swks.png"
							},
							{
								xcenter = 0,
								ycenter = -160,
								type = "button",
								buttons = {
									{
										pic2 = "res/ui/activity/xinfuhuikui/xfhk_btn_2.png",
										name = "lingqu1",
										pic1 = "res/ui/activity/xinfuhuikui/xfhk_btn_1.png",
										children = {
											{
												xcenter = 0,
												name = "reward1",
												type = "pic",
												ycenter = 0,
												pic = "res/ui/activity/xinfuhuikui/xfhk_btn_meishuzi_lqjl.png"
											}
										}
									}
								}
							}
						}
					},
					{
						xcenter = -115,
						name = "bigbg2",
						z = 200,
						type = "pic",
						ycenter = -50,
						pic = "res/ui/activity/xinfuhuikui/xfhk_kapai.png",
						children = {
							{
								xcenter = -50,
								scale = 1,
								type = "pic",
								ycenter = 180,
								pic = "res/ui/activity/xinfuhuikui/xfhk_meishuzi_bs.png"
							},
							{
								xcenter = 0,
								ycenter = 87,
								pic = "frame:baoshi1.jpg",
								type = "pic"
							},
							{
								xcenter = -85,
								type = "pic",
								ycenter = 6,
								pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png",
								children = {
									{
										xcenter = 0,
										name = "dian21",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png"
									}
								}
							},
							{
								xcenter = -43,
								type = "pic",
								ycenter = 6,
								pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png",
								children = {
									{
										xcenter = 0,
										name = "dian22",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png"
									}
								}
							},
							{
								xcenter = 0,
								type = "pic",
								ycenter = 6,
								pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png",
								children = {
									{
										xcenter = 0,
										name = "dian23",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png"
									}
								}
							},
							{
								xcenter = 43,
								type = "pic",
								ycenter = 6,
								pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png",
								children = {
									{
										xcenter = 0,
										name = "dian24",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png"
									}
								}
							},
							{
								xcenter = 82,
								type = "pic",
								ycenter = 6,
								pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png",
								children = {
									{
										xcenter = 0,
										name = "dian25",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png"
									}
								}
							},
							{
								xcenter = 0,
								name = "target2",
								type = "pic",
								ycenter = -70,
								pic = "",
								children = {
									{
										xcenter = -72,
										ycenter = 20,
										pic = "res/ui/activity/xinfuhuikui/xfhk_meishuzi_sj.png",
										type = "pic"
									},
									{
										xcenter = 30,
										type = "pic",
										ycenter = 20,
										pic = "res/ui/activity/xinfuhuikui/xfhk_shuzi_di.png",
										children = {
											{
												xcenter = 0,
												name = "used2",
												text = "100",
												type = "label",
												ycenter = 0,
												fontSize = 16,
												font = "Thonburi-Bold",
												color = ccc3(255, 255, 255)
											}
										}
									},
									{
										xcenter = -72,
										ycenter = -25,
										pic = "res/ui/activity/xinfuhuikui/xfhk_meishuzi_zs.png",
										type = "pic"
									},
									{
										xcenter = 30,
										type = "pic",
										ycenter = -25,
										pic = "res/ui/activity/xinfuhuikui/xfhk_shuzi_di.png",
										children = {
											{
												xcenter = 0,
												name = "feed2",
												text = "100",
												type = "label",
												ycenter = 0,
												fontSize = 16,
												font = "Thonburi-Bold",
												color = ccc3(255, 255, 255)
											}
										}
									}
								}
							},
							{
								xcenter = 0,
								name = "quanbu2",
								visible = false,
								type = "pic",
								ycenter = -70,
								pic = "res/ui/activity/xinfuhuikui/xfhk_meishuzi_qbdc.png"
							},
							{
								xcenter = 0,
								name = "swks2",
								visible = false,
								type = "pic",
								ycenter = -160,
								pic = "res/ui/activity/xinfuhuikui/xfhk_btn_meishuzi_swks.png"
							},
							{
								xcenter = 0,
								ycenter = -160,
								type = "button",
								buttons = {
									{
										pic2 = "res/ui/activity/xinfuhuikui/xfhk_btn_2.png",
										name = "lingqu2",
										pic1 = "res/ui/activity/xinfuhuikui/xfhk_btn_1.png",
										children = {
											{
												xcenter = 0,
												name = "reward2",
												type = "pic",
												ycenter = 0,
												pic = "res/ui/activity/xinfuhuikui/xfhk_btn_meishuzi_lqjl.png"
											}
										}
									}
								}
							}
						}
					},
					{
						xcenter = 110,
						name = "bigbg3",
						z = 200,
						type = "pic",
						ycenter = -50,
						pic = "res/ui/activity/xinfuhuikui/xfhk_kapai.png",
						children = {
							{
								xcenter = -50,
								scale = 1,
								type = "pic",
								ycenter = 180,
								pic = "res/ui/activity/xinfuhuikui/xfhk_meishuzi_dq.png"
							},
							{
								xcenter = 0,
								ycenter = 87,
								pic = "res/ui/activity/xinfuhuikui/dianquanda.png",
								type = "pic"
							},
							{
								xcenter = -85,
								type = "pic",
								ycenter = 6,
								pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png",
								children = {
									{
										xcenter = 0,
										name = "dian31",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png"
									}
								}
							},
							{
								xcenter = -43,
								type = "pic",
								ycenter = 6,
								pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png",
								children = {
									{
										xcenter = 0,
										name = "dian32",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png"
									}
								}
							},
							{
								xcenter = 0,
								type = "pic",
								ycenter = 6,
								pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png",
								children = {
									{
										xcenter = 0,
										name = "dian33",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png"
									}
								}
							},
							{
								xcenter = 43,
								type = "pic",
								ycenter = 6,
								pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png",
								children = {
									{
										xcenter = 0,
										name = "dian34",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png"
									}
								}
							},
							{
								xcenter = 82,
								type = "pic",
								ycenter = 6,
								pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png",
								children = {
									{
										xcenter = 0,
										name = "dian35",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png"
									}
								}
							},
							{
								xcenter = 0,
								name = "target3",
								type = "pic",
								ycenter = -70,
								pic = "",
								children = {
									{
										xcenter = -72,
										ycenter = 20,
										pic = "res/ui/activity/xinfuhuikui/xfhk_meishuzi_sj.png",
										type = "pic"
									},
									{
										xcenter = 30,
										type = "pic",
										ycenter = 20,
										pic = "res/ui/activity/xinfuhuikui/xfhk_shuzi_di.png",
										children = {
											{
												xcenter = 0,
												name = "used3",
												text = "100",
												type = "label",
												ycenter = 0,
												fontSize = 16,
												font = "Thonburi-Bold",
												color = ccc3(255, 255, 255)
											}
										}
									},
									{
										xcenter = -72,
										ycenter = -25,
										pic = "res/ui/activity/xinfuhuikui/xfhk_meishuzi_zs.png",
										type = "pic"
									},
									{
										xcenter = 30,
										type = "pic",
										ycenter = -25,
										pic = "res/ui/activity/xinfuhuikui/xfhk_shuzi_di.png",
										children = {
											{
												xcenter = 0,
												name = "feed3",
												text = "100",
												type = "label",
												ycenter = 0,
												fontSize = 16,
												font = "Thonburi-Bold",
												color = ccc3(255, 255, 255)
											}
										}
									}
								}
							},
							{
								xcenter = 0,
								name = "quanbu3",
								visible = false,
								type = "pic",
								ycenter = -70,
								pic = "res/ui/activity/xinfuhuikui/xfhk_meishuzi_qbdc.png"
							},
							{
								xcenter = 0,
								name = "swks3",
								visible = false,
								type = "pic",
								ycenter = -160,
								pic = "res/ui/activity/xinfuhuikui/xfhk_btn_meishuzi_swks.png"
							},
							{
								xcenter = 0,
								ycenter = -160,
								type = "button",
								buttons = {
									{
										pic2 = "res/ui/activity/xinfuhuikui/xfhk_btn_2.png",
										name = "lingqu3",
										pic1 = "res/ui/activity/xinfuhuikui/xfhk_btn_1.png",
										children = {
											{
												xcenter = 0,
												name = "reward3",
												type = "pic",
												ycenter = 0,
												pic = "res/ui/activity/xinfuhuikui/xfhk_btn_meishuzi_lqjl.png"
											}
										}
									}
								}
							}
						}
					},
					{
						xcenter = 335,
						name = "bigbg4",
						z = 200,
						type = "pic",
						ycenter = -50,
						pic = "res/ui/activity/xinfuhuikui/xfhk_kapai.png",
						children = {
							{
								xcenter = -50,
								scale = 1,
								type = "pic",
								ycenter = 180,
								pic = "res/ui/activity/xinfuhuikui/xfhk_meishuzi_zzxl.png"
							},
							{
								xcenter = 0,
								ycenter = 87,
								pic = "res/ui/activity/xinfuhuikui/xilianda.jpg",
								type = "pic"
							},
							{
								xcenter = -85,
								type = "pic",
								ycenter = 6,
								pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png",
								children = {
									{
										xcenter = 0,
										name = "dian41",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png"
									}
								}
							},
							{
								xcenter = -43,
								type = "pic",
								ycenter = 6,
								pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png",
								children = {
									{
										xcenter = 0,
										name = "dian42",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png"
									}
								}
							},
							{
								xcenter = 0,
								type = "pic",
								ycenter = 6,
								pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png",
								children = {
									{
										xcenter = 0,
										name = "dian43",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png"
									}
								}
							},
							{
								xcenter = 43,
								type = "pic",
								ycenter = 6,
								pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png",
								children = {
									{
										xcenter = 0,
										name = "dian44",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png"
									}
								}
							},
							{
								xcenter = 82,
								type = "pic",
								ycenter = 6,
								pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png",
								children = {
									{
										xcenter = 0,
										name = "dian45",
										type = "pic",
										ycenter = 0,
										pic = "res/ui/activity/xinfuhuikui/xfhk_gou_di.png"
									}
								}
							},
							{
								xcenter = 0,
								name = "target4",
								type = "pic",
								ycenter = -70,
								pic = "",
								children = {
									{
										xcenter = -72,
										ycenter = 20,
										pic = "res/ui/activity/xinfuhuikui/xfhk_meishuzi_sy.png",
										type = "pic"
									},
									{
										xcenter = 30,
										type = "pic",
										ycenter = 20,
										pic = "res/ui/activity/xinfuhuikui/xfhk_shuzi_di.png",
										children = {
											{
												xcenter = 0,
												name = "used4",
												text = "100",
												type = "label",
												ycenter = 0,
												fontSize = 16,
												font = "Thonburi-Bold",
												color = ccc3(255, 255, 255)
											}
										}
									},
									{
										xcenter = -72,
										ycenter = -25,
										pic = "res/ui/activity/xinfuhuikui/xfhk_meishuzi_zs.png",
										type = "pic"
									},
									{
										xcenter = 30,
										type = "pic",
										ycenter = -25,
										pic = "res/ui/activity/xinfuhuikui/xfhk_shuzi_di.png",
										children = {
											{
												xcenter = 0,
												name = "feed4",
												text = "100",
												type = "label",
												ycenter = 0,
												fontSize = 16,
												font = "Thonburi-Bold",
												color = ccc3(255, 255, 255)
											}
										}
									}
								}
							},
							{
								xcenter = 0,
								name = "quanbu4",
								visible = false,
								type = "pic",
								ycenter = -70,
								pic = "res/ui/activity/xinfuhuikui/xfhk_meishuzi_qbdc.png"
							},
							{
								xcenter = 0,
								name = "swks4",
								visible = false,
								type = "pic",
								ycenter = -160,
								pic = "res/ui/activity/xinfuhuikui/xfhk_btn_meishuzi_swks.png"
							},
							{
								xcenter = 0,
								ycenter = -160,
								type = "button",
								buttons = {
									{
										pic2 = "res/ui/activity/xinfuhuikui/xfhk_btn_2.png",
										name = "lingqu4",
										pic1 = "res/ui/activity/xinfuhuikui/xfhk_btn_1.png",
										children = {
											{
												xcenter = 0,
												name = "reward4",
												type = "pic",
												ycenter = 0,
												pic = "res/ui/activity/xinfuhuikui/xfhk_btn_meishuzi_lqjl.png"
											}
										}
									}
								}
							}
						}
					},
					{
						xcenter = 440,
						ycenter = 300,
						type = "button",
						buttons = {
							{
								pic2 = "frame:btn_close_c.png",
								name = "closeButton",
								pic1 = "frame:btn_close_a.png",
								scale = 2
							}
						}
					}
				}
			}
		}
	}
}

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.uidata = var_0_2
	arg_2_0.rewardsList = {}

	arg_2_0:registerScriptHandler(function(arg_3_0)
		if arg_3_0 == "enter" then
			arg_2_0:onEnter()
		elseif arg_3_0 == "exit" then
			arg_2_0:onExit()
		end
	end)
	arg_2_0:setTouchEnabled(true)
	arg_2_0:registerScriptTouchHandler(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == CCTOUCHBEGAN then
			arg_2_0:onTouchBegan(arg_4_1, arg_4_2)

			return true
		elseif arg_4_0 == CCTOUCHMOVED then
			arg_2_0:onTouchMoved(arg_4_1, arg_4_2)

			return true
		elseif arg_4_0 == CCTOUCHENDED then
			arg_2_0:onTouchEnded(arg_4_1, arg_4_2)

			return true
		end
	end, false, true)
	arg_2_0:init(arg_2_1)
end

local function var_0_3(arg_5_0)
	local function var_5_0(arg_6_0)
		if arg_6_0 > math.floor(arg_6_0) then
			if arg_6_0 < 10 then
				arg_6_0 = string.format("%.1f", arg_6_0)
			else
				arg_6_0 = math.floor(arg_6_0)
			end
		end

		return arg_6_0
	end

	local var_5_1

	if arg_5_0 < 10000 then
		var_5_1 = tostring(arg_5_0)
	else
		local var_5_2 = arg_5_0 / 10000

		var_5_1 = language.get(750211, var_5_0(var_5_2))
	end

	return var_5_1
end

function var_0_0.init(arg_7_0, arg_7_1)
	arg_7_0.uiTable = autoUI.initUI(arg_7_0, arg_7_0.uidata)

	arg_7_0.uiTable.closeButton:registerScriptTapHandler(function()
		arg_7_0:close()
	end)

	arg_7_0.currIndexs = {
		1,
		1,
		1,
		1
	}
	arg_7_0.tapIndexs = {
		1,
		1,
		1,
		1
	}

	local function var_7_0(arg_9_0)
		local var_9_0 = arg_9_0.action.data

		log.info("@@ 奖励")

		if var_9_0.rewards then
			local var_9_1 = {}

			for iter_9_0 = 1, #var_9_0.rewards do
				local var_9_2 = {
					id = var_0_1[var_9_0.rewards[iter_9_0].type or var_9_0.rewards[iter_9_0].pic]
				}

				var_9_2.id = var_9_2.id or 3
				var_9_2.value = var_9_0.rewards[iter_9_0].num

				table.insert(var_9_1, var_9_2)
			end

			globalAction_gotResource(var_9_1)
		end

		arg_7_0:refresh()
	end

	arg_7_0.uiTable.lingqu1:registerScriptTapHandler(function()
		cmgr.sendRequest(var_7_0, actions.getXFHKReward, 1, arg_7_0.currIndexs[1])
	end)
	arg_7_0.uiTable.lingqu2:registerScriptTapHandler(function()
		cmgr.sendRequest(var_7_0, actions.getXFHKReward, 2, arg_7_0.currIndexs[2])
	end)
	arg_7_0.uiTable.lingqu3:registerScriptTapHandler(function()
		cmgr.sendRequest(var_7_0, actions.getXFHKReward, 3, arg_7_0.currIndexs[3])
	end)
	arg_7_0.uiTable.lingqu4:registerScriptTapHandler(function()
		cmgr.sendRequest(var_7_0, actions.getXFHKReward, 4, arg_7_0.currIndexs[4])
	end)
	arg_7_0:showPanel(arg_7_1)
end

function var_0_0.refresh(arg_14_0)
	local function var_14_0(arg_15_0)
		arg_14_0:showPanel(arg_15_0.action.data)
	end

	cmgr.sendRequest(var_14_0, actions.getXFHK)
end

function var_0_0.showPanel(arg_16_0, arg_16_1)
	arg_16_0.data = arg_16_1

	if arg_16_0.data then
		-- block empty
	else
		return
	end

	;(function(arg_17_0, arg_17_1)
		local var_17_0, var_17_1 = arg_17_1:getPosition()

		arg_17_1:setPosition(ccp(var_17_0, var_17_1))

		local var_17_2 = arg_17_0 / 1000

		if var_17_2 < 3600 then
			arg_17_1:setString("")

			local var_17_3 = createTimerLabel(var_17_2 * 1000, language.get(131003), "Thonburi", 22, nil, nil, nil, ccc3(255, 0, 0))

			arg_17_1:addChild(var_17_3)
		elseif var_17_2 < 86400 then
			local var_17_4 = var_17_2 / 3600

			arg_17_1:setString(language.get(131001, tool.toint(var_17_4)))
		else
			local var_17_5 = var_17_2 / 3600 / 24

			arg_17_1:setString(language.get(131002, tool.toint(var_17_5)))
		end
	end)(arg_16_0.data.eventCd, arg_16_0.uiTable.leftTime)

	local var_16_0 = arg_16_0.data.itemArrs

	for iter_16_0, iter_16_1 in ipairs(var_16_0) do
		local var_16_1 = iter_16_1.id
		local var_16_2 = iter_16_1.progressArrs
		local var_16_3 = iter_16_1.currIndex

		log.info("@@ 数值")

		local var_16_4 = var_0_3(var_16_2[var_16_3].currNum)
		local var_16_5 = var_0_3(var_16_2[var_16_3].targetNum)
		local var_16_6 = var_0_3(var_16_2[var_16_3].feedbackNum)
		local var_16_7 = var_16_4 .. "/" .. var_16_5

		arg_16_0.uiTable["used" .. var_16_1]:setString(var_16_7)
		arg_16_0.uiTable["feed" .. var_16_1]:setString(var_16_6)

		arg_16_0.currIndexs[var_16_1] = var_16_3

		local var_16_8 = {}

		for iter_16_2, iter_16_3 in ipairs(var_16_2) do
			if iter_16_3.index == var_16_3 then
				arg_16_0.uiTable["dian" .. var_16_1 .. iter_16_2]:setDisplayFrame(CCSprite:create("res/ui/activity/xinfuhuikui/xfhk_dianji.png"):displayFrame())
				arg_16_0.uiTable["swks" .. iter_16_0]:setVisible(false)
				arg_16_0.uiTable["lingqu" .. iter_16_0]:setVisible(true)
			else
				arg_16_0.uiTable["dian" .. var_16_1 .. iter_16_2]:setDisplayFrame(CCSprite:create("res/ui/activity/xinfuhuikui/xfhk_gou_di.png"):displayFrame())
			end

			if iter_16_3.state == 1 then
				arg_16_0.uiTable["dian" .. var_16_1 .. iter_16_2]:setDisplayFrame(CCSprite:create("res/ui/activity/xinfuhuikui/xfhk_gou.png"):displayFrame())
			end

			if var_16_2[var_16_3].currNum == var_16_2[var_16_3].targetNum then
				arg_16_0.uiTable["lingqu" .. var_16_1]:setEnabled(true)
			else
				arg_16_0.uiTable["lingqu" .. var_16_1]:setEnabled(false)
			end

			if iter_16_3.index == 5 and iter_16_3.state == 1 then
				arg_16_0.uiTable["quanbu" .. var_16_1]:setVisible(true)
				arg_16_0.uiTable["target" .. var_16_1]:setVisible(false)
				arg_16_0.uiTable["lingqu" .. var_16_1]:setEnabled(false)
			end

			var_16_8[iter_16_3.index] = iter_16_3
		end

		arg_16_0.rewardsList[var_16_1] = var_16_8
		arg_16_0.tapIndexs[var_16_1] = var_16_3
	end
end

function var_0_0.showReward(arg_18_0, arg_18_1)
	return
end

function var_0_0.onEnter(arg_19_0)
	log.info("@@ 新服2")
end

function var_0_0.onExit(arg_20_0)
	return
end

function var_0_0.onTouchBegan(arg_21_0, arg_21_1, arg_21_2)
	local function var_21_0(arg_22_0, arg_22_1)
		log.info(arg_22_0 .. "     @@@@@      " .. arg_22_1)

		local var_22_0 = arg_21_0.rewardsList[arg_22_0]

		if var_22_0[arg_22_1].state == 1 then
			return
		else
			local var_22_1 = var_0_3(var_22_0[arg_22_1].currNum)
			local var_22_2 = var_0_3(var_22_0[arg_22_1].targetNum)
			local var_22_3 = var_0_3(var_22_0[arg_22_1].feedbackNum)
			local var_22_4 = var_22_1 .. "/" .. var_22_2

			arg_21_0.uiTable["used" .. arg_22_0]:setString(var_22_4)
			arg_21_0.uiTable["feed" .. arg_22_0]:setString(var_22_3)

			if arg_21_0.currIndexs[arg_22_0] == arg_22_1 then
				arg_21_0.uiTable["swks" .. arg_22_0]:setVisible(false)
				arg_21_0.uiTable["lingqu" .. arg_22_0]:setVisible(true)

				if var_22_0[arg_22_1].currNum == var_22_0[arg_22_1].targetNum then
					arg_21_0.uiTable["lingqu" .. arg_22_0]:setEnabled(true)
				else
					arg_21_0.uiTable["lingqu" .. arg_22_0]:setEnabled(false)
				end
			else
				arg_21_0.uiTable["swks" .. arg_22_0]:setVisible(true)
				arg_21_0.uiTable["lingqu" .. arg_22_0]:setVisible(false)
			end

			for iter_22_0 = 1, 5 do
				if var_22_0[iter_22_0].state ~= 1 then
					arg_21_0.uiTable["dian" .. arg_22_0 .. iter_22_0]:setDisplayFrame(CCSprite:create("res/ui/activity/xinfuhuikui/xfhk_gou_di.png"):displayFrame())
				end
			end

			arg_21_0.uiTable["dian" .. arg_22_0 .. arg_22_1]:setDisplayFrame(CCSprite:create("res/ui/activity/xinfuhuikui/xfhk_dianji.png"):displayFrame())
		end
	end

	for iter_21_0 = 1, 4 do
		for iter_21_1 = 1, 5 do
			if tool.checkIfTouch(arg_21_0.uiTable["dian" .. iter_21_0 .. iter_21_1], arg_21_1, arg_21_2) then
				var_21_0(iter_21_0, iter_21_1)
			end
		end
	end
end

function var_0_0.onTouchMoved(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0.isTouchOn = false
end

function var_0_0.onTouchEnded(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0.isTouchOn = false
end

function var_0_0.onTouchCancelled(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0.isTouchOn = false
end

function var_0_0.close(arg_26_0)
	arg_26_0:removeFromParentAndCleanup(true)
end

return var_0_0
