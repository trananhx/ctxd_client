local var_0_0 = class("ZongziGiving", function()
	return createBaseLayer()
end)

var_0_0.layout = {
	y = 0,
	name = "MyNode",
	type = "node",
	x = 0,
	children = {
		{
			name = "dwsl_bg",
			type = "sprite",
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 - 30,
			pic = {
				path = "res/ui/activity/zongzi/dwsl_bg.png"
			},
			children = {
				{
					y = 475.1635,
					name = "dwsl_title",
					type = "sprite",
					x = 479.9999,
					pic = {
						path = "res/ui/activity/zongzi/qxsl_title.png"
					}
				},
				{
					fontSize = 24,
					name = "leftTime",
					y = 480,
					type = "label",
					x = 705,
					color = colorQuality[5]
				},
				{
					y = 509,
					name = "beginSp",
					type = "sprite",
					visible = true,
					x = -23,
					pic = {
						path = "Default/Sprite.png"
					},
					children = {
						{
							fontSize = 24,
							name = "generalNameLb",
							y = -96,
							type = "label",
							x = 85.0004
						},
						{
							fontSize = 24,
							name = "roundLb",
							y = -96,
							type = "label",
							x = 165
						},
						{
							y = -247,
							name = "halfPic",
							type = "sprite",
							x = 181.5,
							pic = {
								path = "res/ui/common/halfPic/halfPic_madai.png"
							}
						},
						{
							y = -161.4288,
							name = "moodBg",
							type = "sprite",
							x = 346.9761,
							pic = {
								path = "res/ui/activity/zongzi/dwsl_word_di01.png"
							}
						},
						{
							y = -161.7144,
							name = "moodTitle",
							type = "sprite",
							x = 330.5473,
							pic = {
								path = "res/ui/activity/zongzi/dwsl_word_1.png"
							}
						},
						{
							name = "reward1",
							h = 42,
							type = "button",
							w = 120,
							y = -166,
							x = 458.69,
							normal = {
								path = "res/ui/activity/zongzi/dwsl_numb_di.png"
							},
							touched = {
								path = "res/ui/activity/zongzi/dwsl_numb_di.png"
							},
							disable = {
								path = "res/ui/activity/zongzi/dwsl_numb_di.png"
							},
							children = {
								{
									y = 20.9254,
									name = "rewardIcon1",
									type = "sprite",
									x = 35,
									pic = {
										path = "res/ui/resource/silkroad/sczl_sj_icon.png"
									}
								},
								{
									fontSize = 20,
									name = "rewardLb1",
									y = 20,
									type = "label",
									x = 78.8356
								},
								{
									y = 19.9969,
									name = "ylq1",
									type = "sprite",
									x = 64,
									pic = {
										path = "res/ui/activity/zongzi/dwsl_seal_ylq.png"
									}
								}
							}
						},
						{
							name = "reward2",
							h = 42,
							type = "button",
							w = 120,
							y = -166,
							x = 658,
							normal = {
								path = "res/ui/activity/zongzi/dwsl_numb_di.png"
							},
							touched = {
								path = "res/ui/activity/zongzi/dwsl_numb_di.png"
							},
							disable = {
								path = "res/ui/activity/zongzi/dwsl_numb_di.png"
							},
							children = {
								{
									y = 20.9254,
									name = "rewardIcon2",
									type = "sprite",
									x = 35,
									pic = {
										path = "res/ui/resource/silkroad/sczldj_pbjn.png"
									}
								},
								{
									fontSize = 20,
									name = "rewardLb2",
									y = 20,
									type = "label",
									x = 78.8356
								},
								{
									y = 20,
									name = "ylq2",
									type = "sprite",
									x = 64,
									pic = {
										path = "res/ui/activity/zongzi/dwsl_seal_ylq.png"
									}
								}
							}
						},
						{
							name = "reward3",
							h = 42,
							type = "button",
							w = 120,
							y = -166,
							x = 855,
							normal = {
								path = "res/ui/activity/zongzi/dwsl_numb_di.png"
							},
							touched = {
								path = "res/ui/activity/zongzi/dwsl_numb_di.png"
							},
							disable = {
								path = "res/ui/activity/zongzi/dwsl_numb_di.png"
							},
							children = {
								{
									y = 20.9254,
									name = "rewardIcon3",
									type = "sprite",
									x = 35,
									pic = {
										path = "res/ui/resource/silkroad/sczl_sj_icon.png"
									}
								},
								{
									fontSize = 20,
									name = "rewardLb3",
									y = 20,
									type = "label",
									x = 78.8356
								},
								{
									y = 20,
									name = "ylq3",
									type = "sprite",
									x = 64,
									pic = {
										path = "res/ui/activity/zongzi/dwsl_seal_ylq.png"
									}
								}
							}
						},
						{
							y = -224,
							name = "progress1",
							type = "sprite",
							x = 643,
							pic = {
								path = "res/ui/activity/zongzi/dwsl_bar_1_bg.png"
							},
							children = {
								{
									y = 20.7881,
									name = "pro1",
									type = "progressbar",
									x = 281.8306,
									pic = {
										path = "res/ui/activity/zongzi/dwsl_bar_1.png"
									}
								},
								{
									y = 20,
									name = "round1",
									type = "sprite",
									x = 545,
									pic = {
										path = "res/ui/activity/zongzi/dwsl_numb_di_round.png"
									}
								},
								{
									fontSize = 20,
									name = "roundLb11",
									y = 20,
									type = "label",
									x = 545.2604
								}
							}
						},
						{
							y = -224,
							name = "progress2",
							type = "sprite",
							x = 643,
							pic = {
								path = "res/ui/activity/zongzi/dwsl_bar_2_bg.png"
							},
							children = {
								{
									y = 20.7881,
									name = "pro2",
									type = "progressbar",
									x = 281.83,
									pic = {
										path = "res/ui/activity/zongzi/dwsl_bar_2.png"
									}
								},
								{
									y = 20,
									name = "round2",
									type = "sprite",
									x = 545,
									pic = {
										path = "res/ui/activity/zongzi/dwsl_numb_di_round.png"
									}
								},
								{
									fontSize = 20,
									name = "roundLb22",
									y = 20,
									type = "label",
									x = 545.2604
								},
								{
									y = 20,
									name = "round2_Copy",
									type = "sprite",
									x = 282.0475,
									pic = {
										path = "res/ui/activity/zongzi/dwsl_numb_di_round.png"
									}
								},
								{
									fontSize = 20,
									name = "roundLb21",
									y = 20,
									type = "label",
									x = 281.9997
								}
							}
						},
						{
							y = -224,
							name = "progress3",
							type = "sprite",
							x = 643,
							pic = {
								path = "res/ui/activity/zongzi/dwsl_bar_3_bg.png"
							},
							children = {
								{
									y = 20.7881,
									name = "pro3",
									type = "progressbar",
									x = 281.83,
									pic = {
										path = "res/ui/activity/zongzi/dwsl_bar_3.png"
									}
								},
								{
									y = 20,
									name = "round3",
									type = "sprite",
									x = 545,
									pic = {
										path = "res/ui/activity/zongzi/dwsl_numb_di_round.png"
									}
								},
								{
									fontSize = 20,
									name = "roundLb33",
									y = 20,
									type = "label",
									x = 545.2604
								},
								{
									y = 20,
									name = "round3X",
									type = "sprite",
									x = 375.7615,
									pic = {
										path = "res/ui/activity/zongzi/dwsl_numb_di_round.png"
									}
								},
								{
									fontSize = 20,
									name = "roundLb32",
									y = 20,
									type = "label",
									x = 375.7136
								},
								{
									y = 20,
									name = "round3X_Copy",
									type = "sprite",
									x = 187.9047,
									pic = {
										path = "res/ui/activity/zongzi/dwsl_numb_di_round.png"
									}
								},
								{
									fontSize = 20,
									name = "roundLb31",
									y = 20,
									type = "label",
									x = 187.4758
								}
							}
						},
						{
							fontSize = 24,
							name = "proLb",
							y = -223,
							type = "label",
							x = 650,
							anchorPoint = ccp(0.5, 0.5)
						},
						{
							y = -259,
							name = "roundTips1",
							type = "sprite",
							x = 461.6873,
							pic = {
								path = "res/ui/activity/zongzi/dwsl_word_sqls.png"
							}
						},
						{
							y = -259.0007,
							name = "roundTips2",
							type = "sprite",
							x = 649.8293,
							pic = {
								path = "res/ui/activity/zongzi/dwsl_word_dzay.png"
							}
						},
						{
							y = -259.0026,
							name = "roundTips3",
							type = "sprite",
							x = 826.9727,
							pic = {
								path = "res/ui/activity/zongzi/dwsl_word_jxdz.png"
							}
						},
						{
							name = "nextBtn",
							h = 114,
							type = "button",
							w = 114,
							y = -430,
							x = 490,
							normal = {
								path = "res/ui/activity/zongzi/dwsl_btn.png"
							},
							touched = {
								path = "res/ui/activity/zongzi/dwsl_btn_c.png"
							},
							disable = {
								path = "res/ui/activity/zongzi/dwsl_btn_c.png"
							},
							children = {
								{
									y = 58.2143,
									name = "dwsl_btn_icon_arrow",
									type = "sprite",
									x = 59.5457,
									pic = {
										path = "res/ui/activity/zongzi/dwsl_btn_icon_arrow.png"
									}
								},
								{
									y = 22.2141,
									name = "dwsl_btn_word_xyw",
									type = "sprite",
									x = 55.1172,
									pic = {
										path = "res/ui/activity/zongzi/dwsl_btn_word_xyw.png"
									}
								}
							}
						},
						{
							name = "giveBtn",
							h = 114,
							type = "button",
							w = 114,
							y = -430,
							x = 742,
							normal = {
								path = "res/ui/activity/zongzi/dwsl_btn.png"
							},
							touched = {
								path = "res/ui/activity/zongzi/dwsl_btn_c.png"
							},
							disable = {
								path = "res/ui/activity/zongzi/dwsl_btn_c.png"
							},
							children = {
								{
									y = 62.2142,
									name = "dwsl_btn_icon_arrow_Copy",
									type = "sprite",
									x = 59.5457,
									pic = {
										path = "res/ui/activity/zongzi/qxsl_btn_icon_lihe.png"
									}
								},
								{
									y = 22.2141,
									name = "dwsl_btn_word_xyw_Copy",
									type = "sprite",
									x = 58.1171,
									pic = {
										path = "res/ui/activity/zongzi/dwsl_btn_word_sl.png"
									}
								},
								{
									fontSize = 36,
									name = "zongziNum",
									y = 31.4286,
									type = "label",
									x = 132.5468
								},
								{
									y = 29.3567,
									name = "goldSp",
									type = "sprite",
									x = 129.8236,
									pic = {
										path = "res/ui/activity/ironRotary/yuanbao.png"
									},
									children = {
										{
											fontSize = 24,
											name = "goldLb",
											y = 18,
											type = "label",
											x = 62.9999
										}
									}
								},
								{
									fontSize = 22,
									name = "intimacyLb",
									y = -5,
									type = "label",
									x = 60
								}
							}
						},
						{
							y = -430,
							name = "zongziOver",
							visible = false,
							type = "sprite",
							x = 740,
							pic = {
								path = "res/ui/activity/zongzi/qxsl_word_lhyyj.png"
							}
						},
						{
							fontSize = 30,
							name = "addNumLb",
							y = -300,
							type = "label",
							x = 655,
							anchorPoint = ccp(0.5, 0.5)
						}
					}
				},
				{
					y = 509,
					name = "endSp",
					visible = false,
					type = "sprite",
					x = -23,
					pic = {
						path = "Default/Sprite.png"
					},
					children = {
						{
							y = -198.1426,
							name = "dwsl_word_zzdfwl",
							type = "sprite",
							x = 608.9985,
							pic = {
								path = "res/ui/activity/zongzi/qxsl_word_lhdfwl.png"
							}
						},
						{
							y = -270,
							name = "dwsl_word_nghdsc",
							type = "sprite",
							x = 471.2599,
							pic = {
								path = "res/ui/activity/zongzi/dwsl_word_nghdsc.png"
							}
						},
						{
							y = -270,
							name = "dwsl_word_wjn",
							type = "sprite",
							x = 720.406,
							pic = {
								path = "res/ui/activity/zongzi/dwsl_word_wjn.png"
							}
						},
						{
							y = -270,
							name = "dwsl_word_ge",
							type = "sprite",
							x = 875,
							pic = {
								path = "res/ui/activity/zongzi/dwsl_word_ge.png"
							}
						},
						{
							fontSize = 30,
							name = "silkNum",
							y = -269,
							type = "label",
							x = 624.9753
						},
						{
							fontSize = 30,
							name = "silkNum2",
							y = -269,
							type = "label",
							x = 819.834
						},
						{
							name = "resertBtn",
							h = 56,
							type = "button",
							w = 212,
							y = -340.9998,
							x = 607.8799,
							normal = {
								path = "res/ui/common/button/sdyjs_btn_02.png"
							},
							touched = {
								path = "res/ui/common/button/sdyjs_btn_02_c.png"
							},
							disable = {
								path = "res/ui/common/button/sdyjs_btn_02_g.png"
							},
							children = {
								{
									y = 34.5,
									name = "yuanbao",
									type = "sprite",
									x = 40.5474,
									pic = {
										path = "res/ui/activity/ironRotary/yuanbao.png"
									}
								},
								{
									fontSize = 24,
									name = "costGoldNum",
									y = 21,
									type = "label",
									x = 41
								},
								{
									fontSize = 24,
									name = "desLb",
									y = 34,
									type = "label",
									x = 130,
									textId = 226064
								}
							}
						},
						{
							y = -221.9283,
							name = "xiaoqian",
							type = "sprite",
							x = 183.0242,
							pic = {
								path = "res/ui/comment/xiaoqian.png"
							}
						}
					}
				}
			}
		}
	}
}
var_0_0.moodColor = {
	tool.hexToRgb("#FF8C7F"),
	tool.hexToRgb("#FFF461"),
	(tool.hexToRgb("#E57FFF"))
}

function var_0_0.ctor(arg_2_0, arg_2_1, arg_2_2)
	log.info("@@ 端午香粽")

	arg_2_0.view = {}

	uiutil.initWidgets(arg_2_0.view, arg_2_0.layout)

	arg_2_0.leftTime = arg_2_0.view.widgets.leftTime

	arg_2_0.view.widgets.addNumLb:setVisible(false)

	if arg_2_1 then
		arg_2_0:addChild(arg_2_0.view.widgets.MyNode)
		arg_2_1:addChild(arg_2_0)
	end

	arg_2_0:update(arg_2_2)
end

function var_0_0.update(arg_3_0, arg_3_1)
	arg_3_0.info = arg_3_1
	arg_3_0.notAllReceived = false

	arg_3_0.view.widgets.beginSp:setVisible(false)
	arg_3_0.view.widgets.endSp:setVisible(false)

	for iter_3_0 = 1, 3 do
		if arg_3_0.view.widgets["rewardIcon" .. iter_3_0] then
			arg_3_0.view.widgets["rewardIcon" .. iter_3_0]:setPositionX(35)
		end
	end

	local var_3_0 = 0

	if arg_3_1.coverCdGold and arg_3_1.coverCdGold > 0 then
		if arg_3_1.rewards then
			for iter_3_1, iter_3_2 in ipairs(arg_3_1.rewards) do
				if iter_3_2.type == "116" then
					arg_3_0.view.widgets.silkNum:setString(math.floor(iter_3_2.value / 10000))
				elseif iter_3_2.type == "126" then
					arg_3_0.view.widgets.silkNum2:setString(iter_3_2.value)
				end
			end
		end

		arg_3_0.view.widgets.costGoldNum:setString(arg_3_1.coverCdGold)
		arg_3_0.view.widgets.endSp:setVisible(true)
	else
		arg_3_0.view.widgets.roundLb:setString(arg_3_1.curIndex .. "/" .. arg_3_1.maxIndex)
		arg_3_0.view.widgets.halfPic:setDisplayFrame(CCSprite:create("res/ui/common/halfPic/halfPic_" .. arg_3_1.generalPic .. ".png"):displayFrame())
		arg_3_0.view.widgets.generalNameLb:setString(arg_3_1.generalName)
		arg_3_0.view.widgets.generalNameLb:setColor(colorQuality[arg_3_1.generalQuality])

		if arg_3_0.oldInfo and (arg_3_0.oldInfo.coverCdGold == nil or arg_3_0.oldInfo.coverCdGold <= 0) and arg_3_0.oldInfo.generalPic ~= arg_3_1.generalPic then
			arg_3_0.view.widgets.halfPic:setPosition(ccp(130, -247))

			local var_3_1 = CCArray:create()

			var_3_1:addObject(CCFadeIn:create(0.06))
			var_3_1:addObject(CCMoveTo:create(0.2, ccp(181.5, -247)))
			var_3_1:addObject(CCCallFuncN:create(function(...)
				return
			end))

			local var_3_2 = CCSequence:create(var_3_1)

			arg_3_0.view.widgets.halfPic:runAction(CCSequence:create(var_3_1))
		end

		if arg_3_0.oldInfo and arg_3_0.oldInfo.curFavor and arg_3_1.curFavor > arg_3_0.oldInfo.curFavor then
			arg_3_0:flyNum(arg_3_1.curFavor - arg_3_0.oldInfo.curFavor)
		else
			arg_3_0.view.widgets.proLb:setString(arg_3_1.curFavor)
		end

		arg_3_0.view.widgets.progress1:setVisible(false)
		arg_3_0.view.widgets.progress2:setVisible(false)
		arg_3_0.view.widgets.progress3:setVisible(false)
		arg_3_0.view.widgets.reward1:setVisible(false)
		arg_3_0.view.widgets.reward2:setVisible(false)
		arg_3_0.view.widgets.reward3:setVisible(false)
		arg_3_0.view.widgets.roundTips1:setVisible(false)
		arg_3_0.view.widgets.roundTips2:setVisible(false)
		arg_3_0.view.widgets.roundTips3:setVisible(false)

		if arg_3_1.progressBar then
			local var_3_3 = 544
			local var_3_4 = #arg_3_1.progressBar
			local var_3_5 = 544 / var_3_4
			local var_3_6 = 0

			if var_3_4 == 1 then
				local var_3_7 = arg_3_1.progressBar[1]

				var_3_6 = arg_3_1.curFavor / var_3_7.favor * var_3_5

				arg_3_0.view.widgets.roundLb11:setString(var_3_7.favor)

				var_3_0 = var_3_6 / var_3_3 * 100

				if var_3_7.status ~= 1 and arg_3_1.curFavor >= var_3_7.favor then
					arg_3_0.notAllReceived = true

					tool.showEffectShake(arg_3_0.view.widgets.rewardIcon3)
					arg_3_0.view.widgets.roundTips3:setVisible(true)

					if arg_3_0.oldInfo and var_3_7.favor > arg_3_0.oldInfo.curFavor then
						arg_3_0.view.widgets.roundTips3:setScale(0.5)

						local var_3_8 = CCArray:create()

						var_3_8:addObject(CCFadeIn:create(0.06))
						var_3_8:addObject(CCScaleTo:create(0.3, 1))
						var_3_8:addObject(CCCallFuncN:create(function(...)
							arg_3_0:rewardTouch()
						end))

						local var_3_9 = CCSequence:create(var_3_8)

						arg_3_0.view.widgets.roundTips3:runAction(CCSequence:create(var_3_8))
					end
				else
					if var_3_7.status == 1 then
						arg_3_0.view.widgets.roundTips3:setScale(1)
						arg_3_0.view.widgets.roundTips3:setVisible(true)
					end

					arg_3_0.view.widgets.rewardIcon3:stopAllActions()
				end

				arg_3_0.view.widgets.progress1:setVisible(true)
				arg_3_0.view.widgets.pro1:setPercentage(math.ceil(var_3_0))
				arg_3_0.view.widgets.reward3:setVisible(true)

				if var_3_7.reward then
					local var_3_10 = stringSplit(var_3_7.reward, ";")[1]
					local var_3_11 = stringSplit(var_3_10, ",")

					if #var_3_11 > 1 then
						if var_3_11[1] == "silk" then
							arg_3_0.view.widgets.rewardIcon3:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/sczl_sj_icon.png"):displayFrame())
							arg_3_0.view.widgets.ylq3:setVisible(var_3_7.status == 1)

							if #var_3_11 > 2 then
								arg_3_0.view.widgets.rewardLb3:setString(var_3_11[3])
							else
								arg_3_0.view.widgets.rewardLb3:setString(var_3_11[2])
							end
						elseif var_3_11[1] == "silktips" then
							arg_3_0.view.widgets.rewardIcon3:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/sczldj_pbjn.png"):displayFrame())
							arg_3_0.view.widgets.ylq3:setVisible(var_3_7.status == 1)
							arg_3_0.view.widgets.rewardLb3:setString(var_3_11[2])
						end
					end
				end
			elseif var_3_4 == 2 then
				local var_3_12 = 0
				local var_3_13 = 0
				local var_3_14 = 0

				for iter_3_3, iter_3_4 in ipairs(arg_3_1.progressBar) do
					if iter_3_4.status ~= 1 and arg_3_1.curFavor >= iter_3_4.favor then
						arg_3_0.notAllReceived = true

						tool.showEffectShake(arg_3_0.view.widgets["rewardIcon" .. iter_3_3 + 1])
						arg_3_0.view.widgets["roundTips" .. iter_3_3 + 1]:setVisible(true)

						if arg_3_0.oldInfo and iter_3_4.favor > arg_3_0.oldInfo.curFavor then
							arg_3_0.view.widgets["roundTips" .. iter_3_3 + 1]:setScale(0.5)

							local var_3_15 = CCArray:create()

							var_3_15:addObject(CCFadeIn:create(0.06))
							var_3_15:addObject(CCScaleTo:create(0.3, 1))
							var_3_15:addObject(CCCallFuncN:create(function(...)
								arg_3_0:rewardTouch()
							end))

							local var_3_16 = CCSequence:create(var_3_15)

							arg_3_0.view.widgets["roundTips" .. iter_3_3 + 1]:runAction(CCSequence:create(var_3_15))
						end
					else
						if iter_3_4.status == 1 then
							arg_3_0.view.widgets["roundTips" .. iter_3_3 + 1]:setScale(1)
							arg_3_0.view.widgets["roundTips" .. iter_3_3 + 1]:setVisible(true)
						end

						arg_3_0.view.widgets["rewardIcon" .. iter_3_3 + 1]:stopAllActions()
					end

					if arg_3_1.curFavor >= iter_3_4.favor then
						var_3_6 = var_3_6 + var_3_5
					elseif var_3_12 == 0 then
						var_3_12 = iter_3_3
						var_3_13 = var_3_5 * (arg_3_1.curFavor - var_3_14) / (iter_3_4.favor - var_3_14)
					end

					arg_3_0.view.widgets["roundLb2" .. iter_3_3]:setString(iter_3_4.favor)

					var_3_14 = iter_3_4.favor

					if iter_3_4.reward then
						local var_3_17 = stringSplit(iter_3_4.reward, ";")[1]
						local var_3_18 = stringSplit(var_3_17, ",")

						if #var_3_18 > 1 then
							if var_3_18[1] == "silk" then
								arg_3_0.view.widgets["rewardIcon" .. iter_3_3 + 1]:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/sczl_sj_icon.png"):displayFrame())
								arg_3_0.view.widgets["ylq" .. iter_3_3 + 1]:setVisible(iter_3_4.status == 1)

								if #var_3_18 > 2 then
									arg_3_0.view.widgets["rewardLb" .. iter_3_3 + 1]:setString(var_3_18[3])
								else
									arg_3_0.view.widgets["rewardLb" .. iter_3_3 + 1]:setString(var_3_18[2])
								end
							elseif var_3_18[1] == "silktips" then
								arg_3_0.view.widgets["rewardIcon" .. iter_3_3 + 1]:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/sczldj_pbjn.png"):displayFrame())
								arg_3_0.view.widgets["ylq" .. iter_3_3 + 1]:setVisible(iter_3_4.status == 1)
								arg_3_0.view.widgets["rewardLb" .. iter_3_3 + 1]:setString(var_3_18[2])
							end
						end
					end
				end

				var_3_0 = (var_3_6 + var_3_13) / var_3_3 * 100

				arg_3_0.view.widgets.proLb:setPosition(ccp(560, -223))
				arg_3_0.view.widgets.progress2:setVisible(true)
				arg_3_0.view.widgets.pro2:setPercentage(math.ceil(var_3_0))
				arg_3_0.view.widgets.reward2:setVisible(true)
				arg_3_0.view.widgets.reward3:setVisible(true)
			elseif var_3_4 == 3 then
				local var_3_19 = 0
				local var_3_20 = 0
				local var_3_21 = 0

				for iter_3_5, iter_3_6 in ipairs(arg_3_1.progressBar) do
					if iter_3_6.status ~= 1 and arg_3_1.curFavor >= iter_3_6.favor then
						arg_3_0.notAllReceived = true

						tool.showEffectShake(arg_3_0.view.widgets["rewardIcon" .. iter_3_5])
						arg_3_0.view.widgets["roundTips" .. iter_3_5]:setVisible(true)

						if arg_3_0.oldInfo and iter_3_6.favor > arg_3_0.oldInfo.curFavor then
							arg_3_0.view.widgets["roundTips" .. iter_3_5]:setScale(0.5)

							local var_3_22 = CCArray:create()

							var_3_22:addObject(CCFadeIn:create(0.06))
							var_3_22:addObject(CCScaleTo:create(0.3, 1))
							var_3_22:addObject(CCCallFuncN:create(function(...)
								arg_3_0:rewardTouch()
							end))

							local var_3_23 = CCSequence:create(var_3_22)

							arg_3_0.view.widgets["roundTips" .. iter_3_5]:runAction(CCSequence:create(var_3_22))
						end
					else
						if iter_3_6.status == 1 then
							arg_3_0.view.widgets["roundTips" .. iter_3_5]:setScale(1)
							arg_3_0.view.widgets["roundTips" .. iter_3_5]:setVisible(true)
						end

						arg_3_0.view.widgets["rewardIcon" .. iter_3_5]:stopAllActions()
					end

					if arg_3_1.curFavor >= iter_3_6.favor then
						var_3_6 = var_3_6 + var_3_5
					elseif var_3_19 == 0 then
						var_3_19 = iter_3_5
						var_3_20 = var_3_5 * (arg_3_1.curFavor - var_3_21) / (iter_3_6.favor - var_3_21)
					end

					arg_3_0.view.widgets["roundLb3" .. iter_3_5]:setString(iter_3_6.favor)

					var_3_21 = iter_3_6.favor

					if iter_3_6.reward then
						local var_3_24 = stringSplit(iter_3_6.reward, ";")[1]
						local var_3_25 = stringSplit(var_3_24, ",")

						if #var_3_25 > 1 then
							if var_3_25[1] == "silk" then
								arg_3_0.view.widgets["rewardIcon" .. iter_3_5]:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/sczl_sj_icon.png"):displayFrame())
								arg_3_0.view.widgets["ylq" .. iter_3_5]:setVisible(iter_3_6.status == 1)

								if #var_3_25 > 2 then
									arg_3_0.view.widgets["rewardLb" .. iter_3_5]:setString(var_3_25[3])
								else
									arg_3_0.view.widgets["rewardLb" .. iter_3_5]:setString(var_3_25[2])
								end
							elseif var_3_25[1] == "silktips" then
								arg_3_0.view.widgets["rewardIcon" .. iter_3_5]:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/sczldj_pbjn.png"):displayFrame())
								arg_3_0.view.widgets["ylq" .. iter_3_5]:setVisible(iter_3_6.status == 1)
								arg_3_0.view.widgets["rewardLb" .. iter_3_5]:setString(var_3_25[2])
							end
						end
					end
				end

				var_3_0 = (var_3_6 + var_3_20) / var_3_3 * 100

				arg_3_0.view.widgets.progress3:setVisible(true)
				arg_3_0.view.widgets.proLb:setPosition(ccp(650, -223))
				arg_3_0.view.widgets.pro3:setPercentage(math.ceil(var_3_0))
				arg_3_0.view.widgets.reward1:setVisible(true)
				arg_3_0.view.widgets.reward2:setVisible(true)
				arg_3_0.view.widgets.reward3:setVisible(true)
			end
		end

		arg_3_0.view.widgets.goldSp:setVisible(false)
		arg_3_0.view.widgets.zongziNum:setVisible(false)

		if arg_3_1.usedZongzi >= arg_3_1.freeZongzi then
			arg_3_0.view.widgets.goldLb:setString(arg_3_1.giveAwayGold)
			arg_3_0.view.widgets.goldSp:setVisible(true)
		else
			arg_3_0.view.widgets.zongziNum:setString("x" .. arg_3_1.freeZongzi - arg_3_1.usedZongzi)
			arg_3_0.view.widgets.zongziNum:setVisible(true)
		end

		arg_3_0.view.widgets.intimacyLb:setString(language.get(226060, arg_3_1.minFavor, arg_3_1.maxFavor))
		arg_3_0.view.widgets.intimacyLb:setColor(var_0_0.moodColor[arg_3_1.mood])
		arg_3_0.view.widgets.moodBg:setDisplayFrame(CCSprite:create("res/ui/activity/zongzi/dwsl_word_di0" .. arg_3_1.mood .. ".png"):displayFrame())
		arg_3_0.view.widgets.moodTitle:setDisplayFrame(CCSprite:create("res/ui/activity/zongzi/dwsl_word_" .. arg_3_1.mood .. ".png"):displayFrame())

		if arg_3_1.usedZongzi < arg_3_1.freeZongzi and var_3_0 < 100 then
			arg_3_0.view.widgets.nextBtn:setTouchEnabled(false)
		else
			arg_3_0.view.widgets.nextBtn:setTouchEnabled(true)
		end

		if arg_3_0.oldInfo and (arg_3_0.oldInfo.coverCdGold == nil or arg_3_0.oldInfo.coverCdGold <= 0) and arg_3_0.oldInfo.usedZongzi < arg_3_0.oldInfo.freeZongzi and arg_3_1.usedZongzi >= arg_3_0.oldInfo.freeZongzi then
			arg_3_0.view.widgets.giveBtn:setTouchEnabled(false)
			arg_3_0.view.widgets.zongziOver:setPosition(ccp(740, -430))
			arg_3_0.view.widgets.zongziOver:setVisible(true)

			local var_3_26 = CCArray:create()

			var_3_26:addObject(CCFadeIn:create(0.06))
			var_3_26:addObject(CCMoveTo:create(0.5, ccp(740, -380)))
			var_3_26:addObject(CCCallFuncN:create(function(...)
				arg_3_0.view.widgets.zongziOver:setVisible(false)
				arg_3_0.view.widgets.giveBtn:setTouchEnabled(true)
			end))

			local var_3_27 = CCSequence:create(var_3_26)

			arg_3_0.view.widgets.zongziOver:runAction(CCSequence:create(var_3_26))
		end

		if var_3_0 >= 100 then
			arg_3_0.view.widgets.giveBtn:setTouchEnabled(false)
		else
			arg_3_0.view.widgets.giveBtn:setTouchEnabled(true)
		end

		if arg_3_0.notAllReceived == false and var_3_0 >= 100 then
			arg_3_0:nextBtnTouch()
		end

		arg_3_0.view.widgets.beginSp:setVisible(true)
	end

	arg_3_0.oldInfo = arg_3_1
end

function var_0_0.giveBtnTouch(arg_9_0)
	if arg_9_0.info.giveAwayGold == 0 or arg_9_0.info.giveAwayGold == nil then
		cmgr.sendRequest(function(...)
			arg_9_0:refresh()
		end, actions.giveDwxz)
	else
		messageBox.showChargeWin("", language.get(226070, arg_9_0.info.giveAwayGold), "dwxzGiveAwayGold", function()
			cmgr.sendRequest(function(...)
				arg_9_0:refresh()
			end, actions.giveDwxz)
		end)
	end
end

function var_0_0.flyNum(arg_13_0, arg_13_1)
	arg_13_0.view.widgets.addNumLb:setString("+" .. arg_13_1)
	arg_13_0.view.widgets.addNumLb:setPosition(ccp(655, -300))
	arg_13_0.view.widgets.addNumLb:setVisible(true)

	local var_13_0 = CCArray:create()

	var_13_0:addObject(CCFadeIn:create(0.06))
	var_13_0:addObject(CCMoveTo:create(0.5, ccp(655, -240)))
	var_13_0:addObject(CCCallFuncN:create(function(...)
		arg_13_0.view.widgets.addNumLb:setVisible(false)

		if arg_13_0.info.curFavor then
			arg_13_0.view.widgets.proLb:setString(arg_13_0.info.curFavor)
		end
	end))

	local var_13_1 = CCSequence:create(var_13_0)

	arg_13_0.view.widgets.addNumLb:runAction(CCSequence:create(var_13_0))
end

function var_0_0.refresh(arg_15_0)
	cmgr.sendRequest(function(arg_16_0)
		arg_15_0:update(arg_16_0.action.data)
	end, actions.getDWXZ)
end

function var_0_0.nextBtnTouch(arg_17_0)
	cmgr.sendRequest(function(...)
		arg_17_0:refresh()
	end, actions.nextDwxz)
end

function var_0_0.resertBtnTouch(arg_19_0)
	cmgr.sendRequest(function(...)
		arg_19_0:refresh()
	end, actions.resertDwxz)
end

function var_0_0.rewardTouch(arg_21_0)
	if arg_21_0.info.progressBar then
		for iter_21_0, iter_21_1 in ipairs(arg_21_0.info.progressBar) do
			if iter_21_1.status == 0 and arg_21_0.info.curFavor >= iter_21_1.favor then
				cmgr.sendRequest(function(arg_22_0)
					local var_22_0 = arg_22_0.action.data.rewards[1]
					local var_22_1 = {}
					local var_22_2 = {}

					if var_22_0.type == 126 then
						var_22_2.id = 10030
					elseif var_22_0.type == 116 then
						var_22_2.id = 55
					end

					var_22_2.value = var_22_0.value

					table.insert(var_22_1, var_22_2)
					globalAction_gotResource(var_22_1)
					arg_21_0.view.widgets.giveBtn:setTouchEnabled(true)
					arg_21_0:refresh()
				end, actions.getDWxzReward, iter_21_1.id)
			end
		end
	end
end

function var_0_0.onEnter(arg_23_0)
	arg_23_0.view.widgets.giveBtn:addHandleOfControlEvent(handler(arg_23_0, arg_23_0.giveBtnTouch), CCControlEventTouchUpInside)
	arg_23_0.view.widgets.nextBtn:addHandleOfControlEvent(handler(arg_23_0, arg_23_0.nextBtnTouch), CCControlEventTouchUpInside)
	arg_23_0.view.widgets.reward1:addHandleOfControlEvent(handler(arg_23_0, arg_23_0.rewardTouch), CCControlEventTouchUpInside)
	arg_23_0.view.widgets.reward2:addHandleOfControlEvent(handler(arg_23_0, arg_23_0.rewardTouch), CCControlEventTouchUpInside)
	arg_23_0.view.widgets.reward3:addHandleOfControlEvent(handler(arg_23_0, arg_23_0.rewardTouch), CCControlEventTouchUpInside)
	arg_23_0.view.widgets.resertBtn:addHandleOfControlEvent(handler(arg_23_0, arg_23_0.resertBtnTouch), CCControlEventTouchUpInside)
end

function var_0_0.onExit(arg_24_0)
	return
end

return var_0_0
