local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.titleScale = 0.75
else
	var_0_0.titleScale = 1
end

local var_0_1 = {
	menu = {
		xcenter = 0,
		name = "bg",
		type = "pic_9",
		ycenter = -23,
		pic = "res/ui/general/jailView/comm_view_2.png",
		middleRect = CCRectMake(30, 30, 45, 45),
		preferedSize = CCSizeMake(930, 545),
		children = {
			{
				xcenter = -310,
				name = "girl",
				z = 150,
				type = "pic",
				ycenter = -40,
				pic = "res/ui/kfsy/kfsy_sv.png"
			},
			{
				xcenter = 110,
				name = "kuang",
				type = "pic_9",
				ycenter = 90,
				pic = "res/ui/general/jailView/comm_view_2.png",
				middleRect = CCRectMake(30, 30, 45, 45),
				preferedSize = CCSizeMake(400, 330)
			},
			{
				xcenter = -30,
				name = "renqi",
				type = "pic",
				ycenter = 200,
				pic = "res/ui/kfsy/kfsy_gmrqph.png",
				scale = var_0_0.titleScale
			},
			{
				xcenter = 120,
				name = "changjing",
				type = "pic",
				ycenter = 200,
				pic = "res/ui/kfsy/kfsy_gmcj.png",
				scale = var_0_0.titleScale
			},
			{
				xcenter = 270,
				name = "jiaoseming",
				type = "pic",
				ycenter = 200,
				pic = "res/ui/kfsy/kfsy_gmytzr.png",
				scale = var_0_0.titleScale
			},
			{
				xcenter = 120,
				name = "fengexian1_1",
				type = "pic",
				ycenter = 160,
				pic = "res/ui/kfsy/kfsy_gmhx.png"
			},
			{
				xcenter = 120,
				name = "fengexian1_2",
				type = "pic",
				ycenter = -40,
				pic = "res/ui/kfsy/kfsy_gmhx.png"
			},
			{
				xcenter = 120,
				name = "fengexian2_1",
				type = "pic",
				ycenter = 27,
				pic = "res/ui/kfsy/kfsy_gmhx1.png"
			},
			{
				xcenter = 120,
				name = "fengexian2_2",
				type = "pic",
				ycenter = 93,
				pic = "res/ui/kfsy/kfsy_gmhx1.png"
			},
			{
				xcenter = -30,
				fontSize = 23,
				type = "label",
				ycenter = 126,
				font = "Thonburi",
				strokeSize = 2,
				text = language.get(320407),
				color = ccc3(255, 248, 197),
				strokeColor = ccc3(22, 18, 13)
			},
			{
				xcenter = -30,
				fontSize = 23,
				type = "label",
				ycenter = 60,
				font = "Thonburi",
				strokeSize = 2,
				text = language.get(320408),
				color = ccc3(255, 248, 197),
				strokeColor = ccc3(22, 18, 13)
			},
			{
				xcenter = -30,
				fontSize = 23,
				type = "label",
				ycenter = -6,
				font = "Thonburi",
				strokeSize = 2,
				text = language.get(320409),
				color = ccc3(255, 248, 197),
				strokeColor = ccc3(22, 18, 13)
			},
			{
				xcenter = 120,
				name = "first",
				fontSize = 21,
				type = "label",
				ycenter = 126,
				text = "loading",
				font = "Thonburi",
				strokeSize = 2,
				color = ccc3(255, 248, 197),
				strokeColor = ccc3(22, 18, 13)
			},
			{
				xcenter = 120,
				name = "second",
				fontSize = 21,
				type = "label",
				ycenter = 60,
				text = "loading",
				font = "Thonburi",
				strokeSize = 2,
				color = ccc3(255, 248, 197),
				strokeColor = ccc3(22, 18, 13)
			},
			{
				xcenter = 120,
				name = "third",
				fontSize = 21,
				type = "label",
				ycenter = -6,
				text = "loading",
				font = "Thonburi",
				strokeSize = 2,
				color = ccc3(255, 248, 197),
				strokeColor = ccc3(22, 18, 13)
			},
			{
				xcenter = 270,
				name = "firstID",
				fontSize = 21,
				type = "label",
				ycenter = 126,
				text = "loading",
				font = "Thonburi",
				strokeSize = 2,
				color = ccc3(255, 248, 197),
				strokeColor = ccc3(22, 18, 13)
			},
			{
				xcenter = 270,
				name = "secondID",
				fontSize = 21,
				type = "label",
				ycenter = 60,
				text = "loading",
				font = "Thonburi",
				strokeSize = 2,
				color = ccc3(255, 248, 197),
				strokeColor = ccc3(22, 18, 13)
			},
			{
				xcenter = 270,
				name = "thridID",
				fontSize = 21,
				type = "label",
				ycenter = -6,
				text = "loading",
				font = "Thonburi",
				strokeSize = 2,
				color = ccc3(255, 248, 197),
				strokeColor = ccc3(22, 18, 13)
			},
			{
				xcenter = -70,
				name = "qingtie1",
				type = "pic",
				ycenter = -120,
				pic = "res/ui/kfsy/kfsy_gmqj.png"
			},
			{
				xcenter = 80,
				name = "qingtie2",
				type = "pic",
				ycenter = -120,
				pic = "res/ui/kfsy/kfsy_gmqj.png"
			},
			{
				xcenter = 230,
				name = "jiuhu",
				scale = 0.8,
				type = "pic",
				ycenter = -120,
				pic = "res/ui/kfsy/kfsy_jh.png"
			},
			{
				xcenter = -30,
				name = "dacha1",
				type = "pic",
				ycenter = -130,
				pic = "res/ui/kfsy/kfsy_gm.png"
			},
			{
				xcenter = 120,
				name = "dacha2",
				type = "pic",
				ycenter = -130,
				pic = "res/ui/kfsy/kfsy_gm.png"
			},
			{
				xcenter = 275,
				name = "dacha3",
				type = "pic",
				ycenter = -130,
				pic = "res/ui/kfsy/kfsy_gm.png"
			},
			{
				scale = 0.8,
				y = 80,
				type = "button",
				x = 430,
				buttons = {
					{
						pic2 = "frame:btn_ok_lighted.png",
						name = "buyButton1",
						pic1 = "frame:btn_ok_normal.png",
						callBack = function()
							local var_1_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

							var_1_0:registerScriptTouchHandler(function(arg_2_0, arg_2_1, arg_2_2)
								if arg_2_0 == CCTOUCHBEGAN then
									return true
								elseif arg_2_0 == CCTOUCHMOVED then
									return true
								elseif arg_2_0 == CCTOUCHENDED then
									var_1_0:removeAllChildrenWithCleanup(true)
									var_1_0:removeFromParentAndCleanup(true)

									return true
								end
							end, false, true)
							var_1_0:setTouchEnabled(true)
							require("lua/layer/kfsy/feastInfo")

							if kfsyInfo.feastInfo.response then
								local var_1_1 = kfsyInfo.feastInfo.response.action.data
								local var_1_2 = messageBox.createMessageBox(language.get(10003), language.get(320422, var_1_1.goldCard1), {
									{
										text = language.get(320410),
										callBack = function()
											var_1_0:removeAllChildrenWithCleanup(true)
											var_1_0:removeFromParentAndCleanup(true)
											kfsyBuyControl.request_kfsyBuyCard(1)
										end
									},
									{
										text = language.get(10002),
										callBack = function()
											var_1_0:removeAllChildrenWithCleanup(true)
											var_1_0:removeFromParentAndCleanup(true)
										end
									}
								})

								var_1_0:addChild(var_1_2)
								smgr.rootLayer:addChild(var_1_0, 60000)
							end
						end
					}
				}
			},
			{
				fontSize = 20,
				scale = 0.8,
				strokeSize = 2,
				type = "label",
				font = "Thonburi",
				y = 80,
				x = 430,
				text = language.get(320410),
				color = colorText[10004],
				strokeColor = colorText[10005]
			},
			{
				scale = 0.8,
				y = 80,
				type = "button",
				x = 590,
				buttons = {
					{
						pic2 = "frame:btn_ok_lighted.png",
						name = "buyButton2",
						pic1 = "frame:btn_ok_normal.png",
						callBack = function()
							local var_5_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

							var_5_0:registerScriptTouchHandler(function(arg_6_0, arg_6_1, arg_6_2)
								if arg_6_0 == CCTOUCHBEGAN then
									return true
								elseif arg_6_0 == CCTOUCHMOVED then
									return true
								elseif arg_6_0 == CCTOUCHENDED then
									var_5_0:removeAllChildrenWithCleanup(true)
									var_5_0:removeFromParentAndCleanup(true)

									return true
								end
							end, false, true)
							var_5_0:setTouchEnabled(true)
							require("lua/layer/kfsy/feastInfo")

							if kfsyInfo.feastInfo.response then
								local var_5_1 = kfsyInfo.feastInfo.response.action.data
								local var_5_2 = messageBox.createMessageBox(language.get(10003), language.get(320422, var_5_1.goldCard10), {
									{
										text = language.get(320410),
										callBack = function()
											var_5_0:removeAllChildrenWithCleanup(true)
											var_5_0:removeFromParentAndCleanup(true)
											kfsyBuyControl.request_kfsyBuyCard(2)
										end
									},
									{
										text = language.get(10002),
										callBack = function()
											var_5_0:removeAllChildrenWithCleanup(true)
											var_5_0:removeFromParentAndCleanup(true)
										end
									}
								})

								var_5_0:addChild(var_5_2)
								smgr.rootLayer:addChild(var_5_0, 60000)
							end
						end
					}
				}
			},
			{
				fontSize = 20,
				x = 590,
				type = "label",
				font = "Thonburi",
				y = 80,
				strokeSize = 2,
				text = language.get(320410),
				color = colorText[10004],
				strokeColor = colorText[10005]
			},
			{
				scale = 0.8,
				y = 80,
				type = "button",
				x = 750,
				buttons = {
					{
						pic2 = "frame:btn_ok_lighted.png",
						name = "buyButton3",
						pic1 = "frame:btn_ok_normal.png",
						callBack = function()
							local var_9_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

							var_9_0:registerScriptTouchHandler(function(arg_10_0, arg_10_1, arg_10_2)
								if arg_10_0 == CCTOUCHBEGAN then
									return true
								elseif arg_10_0 == CCTOUCHMOVED then
									return true
								elseif arg_10_0 == CCTOUCHENDED then
									var_9_0:removeAllChildrenWithCleanup(true)
									var_9_0:removeFromParentAndCleanup(true)

									return true
								end
							end, false, true)
							var_9_0:setTouchEnabled(true)
							require("lua/layer/kfsy/feastInfo")

							if kfsyInfo.feastInfo.response then
								local var_9_1 = kfsyInfo.feastInfo.response.action.data
								local var_9_2 = messageBox.createMessageBox(language.get(10003), language.get(320422, var_9_1.goldDrink), {
									{
										text = language.get(320410),
										callBack = function()
											var_9_0:removeAllChildrenWithCleanup(true)
											var_9_0:removeFromParentAndCleanup(true)
											kfsyBuyControl.request_kfsyBuyDrink()
										end
									},
									{
										text = language.get(10002),
										callBack = function()
											var_9_0:removeAllChildrenWithCleanup(true)
											var_9_0:removeFromParentAndCleanup(true)
										end
									}
								})

								var_9_0:addChild(var_9_2)
								smgr.rootLayer:addChild(var_9_0, 60000)
							end
						end
					}
				}
			},
			{
				fontSize = 20,
				name = "goumai3",
				strokeSize = 2,
				type = "label",
				font = "Thonburi",
				y = 80,
				x = 750,
				text = language.get(320410),
				color = colorText[10004],
				strokeColor = colorText[10005]
			},
			{
				x = 410,
				name = "yuanbao1",
				y = 40,
				type = "pic",
				pic = "res/ui/kfsy/kfsy_jb.png"
			},
			{
				x = 570,
				name = "yuanbao2",
				y = 40,
				type = "pic",
				pic = "res/ui/kfsy/kfsy_jb.png"
			},
			{
				x = 730,
				name = "yuanbao3",
				y = 40,
				type = "pic",
				pic = "res/ui/kfsy/kfsy_jb.png"
			},
			{
				fontSize = 18,
				name = "yuanbaoNum1",
				strokeSize = 2,
				type = "label",
				text = "0",
				font = "Thonburi",
				y = 38,
				x = 450,
				color = ccc3(255, 248, 197),
				strokeColor = ccc3(22, 18, 13)
			},
			{
				fontSize = 18,
				name = "yuanbaoNum2",
				strokeSize = 2,
				type = "label",
				text = "0",
				font = "Thonburi",
				y = 38,
				x = 610,
				color = ccc3(255, 248, 197),
				strokeColor = ccc3(22, 18, 13)
			},
			{
				fontSize = 18,
				name = "yuanbaoNum3",
				strokeSize = 2,
				type = "label",
				text = "0",
				font = "Thonburi",
				y = 38,
				x = 770,
				color = ccc3(255, 248, 197),
				strokeColor = ccc3(22, 18, 13)
			}
		}
	}
}

function getKfsyBuyData()
	return var_0_1
end
