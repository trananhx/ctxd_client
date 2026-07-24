return {
	widgets = {
		{
			y = 0,
			name = "root",
			type = "layer",
			x = 0,
			children = {
				{
					x = 480,
					name = "background",
					y = 290,
					type = "sprite",
					pic = {
						frame = true,
						path = "warlock_view_bg.png"
					}
				},
				{
					x = 205,
					name = "warlockBuild",
					y = 260,
					type = "sprite",
					pic = {
						frame = true,
						path = "warlock_emp_build.png"
					}
				},
				{
					y = 0,
					name = "unBuild",
					visible = false,
					type = "node",
					x = 0,
					children = {
						{
							x = 675,
							name = "buildBackground",
							y = 290,
							type = "sprite",
							pic = {
								frame = true,
								path = "warlock_build_view_bg.png"
							}
						},
						{
							x = 675,
							name = "textBuildWarlockFactory",
							y = 520,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/common/text/warlock/warlock_build_tit.png"
							}
						},
						{
							x = 675,
							name = "drawingBackground",
							y = 320,
							type = "sprite",
							pic = {
								frame = true,
								path = "warlock_build_graph_view.png"
							}
						},
						{
							x = 675,
							name = "drawing",
							y = 320,
							type = "sprite",
							visible = false,
							pic = {
								frame = true,
								path = "warlock_draw_white.png"
							}
						},
						{
							y = 220,
							name = "buyButton",
							h = 58,
							type = "button",
							w = 140,
							x = 675,
							visible = false,
							label = {
								fontSize = 20,
								type = "label",
								strokeSize = 2,
								textId = 20001,
								color = colorText[10004],
								strokeColor = colorText[10005]
							}
						},
						{
							y = 220,
							name = "buildButton",
							h = 58,
							type = "button",
							w = 140,
							x = 675,
							visible = false,
							label = {
								textId = 20002,
								type = "label"
							}
						},
						{
							y = 300,
							name = "buildProgressBarNode",
							visible = false,
							type = "node",
							x = 675,
							children = {
								{
									y = 0,
									name = "buildProgressBarBackground",
									type = "sprite",
									x = 0,
									pic = {
										frame = true,
										path = "warlock_build_degr_view.png"
									}
								},
								{
									y = 0,
									name = "buildProgressBar",
									type = "progressbar",
									x = 0,
									progressType = kCCProgressTimerTypeBar,
									pic = {
										frame = true,
										path = "warlock_build_degr_con.png"
									}
								}
							}
						}
					}
				},
				{
					y = 0,
					name = "hasBuild",
					visible = false,
					type = "node",
					x = 0,
					children = {
						{
							x = 205,
							name = "warlockLevelTitleBackground",
							y = 505,
							type = "sprite",
							pic = {
								frame = true,
								path = "warlock_left_view.png"
							}
						},
						{
							style = "button_tip",
							name = "tipButton",
							y = 505,
							type = "button",
							x = 335
						},
						{
							x = 205,
							name = "warlockUpgradeBackground",
							y = 75,
							type = "sprite",
							pic = {
								frame = true,
								path = "warlock_left_view.png"
							},
							children = {
								{
									style = "button_yel3",
									name = "upgradeFactoryButton",
									y = 45,
									type = "button",
									visible = false,
									x = 170,
									label = {
										textId = 20007,
										type = "label"
									}
								},
								{
									style = "button_yel3",
									name = "buyMapButton",
									y = 45,
									type = "button",
									visible = false,
									x = 170,
									label = {
										fontSize = 20,
										type = "label",
										strokeSize = 2,
										textId = 20006,
										color = colorText[10004],
										strokeColor = colorText[10005]
									}
								},
								{
									x = 75,
									name = "factoryMapSprite",
									y = 45,
									type = "sprite",
									visible = false,
									pic = {
										frame = true,
										path = "warlock_graph_icon.png"
									}
								}
							}
						},
						{
							x = 695,
							name = "warlockDetailView",
							y = 275,
							type = "tabView",
							pic = {
								frame = true,
								path = "warlock_list_view.png"
							},
							children = {
								{
									y = 440,
									name = "warlockNameLabel",
									anchorX = 0,
									type = "richLabel",
									x = 17
								},
								{
									y = 405,
									name = "freeNumOneDayLabel",
									anchorX = 0,
									type = "richLabel",
									x = 17
								},
								{
									y = 405,
									name = "upgradeCanGetNumLabel",
									anchorX = 0,
									type = "richLabel",
									visible = false,
									x = 17,
									children = {
										{
											style = "label_yellowish_20",
											name = "upgradeGainLabel",
											y = -25,
											type = "label",
											x = 95,
											textId = 20024
										}
									}
								},
								{
									y = 400,
									name = "goldIcon",
									visible = false,
									type = "sprite",
									x = 275,
									pic = {
										frame = true,
										path = "res_icon_19_small.png"
									},
									children = {
										{
											name = "goldNumLabel",
											type = "atlaslabel",
											pic = "res/ui/common/number/up_numb.png",
											startCharMap = 48,
											y = 15,
											itemWidth = 16,
											x = 40,
											itemHeight = 21,
											anchor = ccp(0, 0.5)
										}
									}
								},
								{
									y = 295,
									name = "leftResearchCountLabel",
									anchorX = 0,
									type = "richLabel",
									anchorY = 0.5,
									x = 17
								},
								{
									y = 250,
									name = "reseachConsumeLabel",
									anchorX = 0,
									type = "richLabel",
									anchorY = 0.5,
									visible = false,
									x = 17,
									children = {
										{
											style = "button_gre1",
											name = "researchButton",
											y = 0,
											type = "button",
											x = 382,
											label = {
												fontSize = 20,
												type = "label",
												strokeSize = 2,
												textId = 20004,
												color = colorText[10004],
												strokeColor = colorText[10005]
											}
										}
									}
								},
								{
									y = 250,
									name = "reseachOverLabel",
									anchorX = 0,
									type = "richLabel",
									anchorY = 0.5,
									visible = false,
									x = 17,
									children = {
										{
											style = "button_gre1",
											name = "getResearchButton",
											y = 0,
											type = "button",
											visible = true,
											x = 382,
											label = {
												textId = 20005,
												type = "label"
											}
										}
									}
								},
								{
									y = 250,
									name = "researchProgressBarNode",
									visible = false,
									type = "node",
									x = 230,
									children = {
										{
											y = 0,
											name = "researchProgressBarBackground",
											type = "sprite",
											x = 0,
											pic = {
												frame = true,
												path = "warlock_research_degr_view.png"
											}
										},
										{
											y = 0,
											name = "researchProgressBar",
											type = "progressbar",
											x = 0,
											progressType = kCCProgressTimerTypeBar,
											pic = {
												frame = true,
												path = "warlock_research_degr_con.png"
											},
											children = {
												{
													y = 10,
													name = "progressTimerLabel",
													style = "label_white_20",
													type = "labelTimer",
													format = "%M:%S",
													x = 203
												}
											}
										}
									}
								},
								{
									style = "label_yellowish_22",
									name = "reseachRecordTitleLabel",
									y = 185,
									type = "label",
									x = 225,
									textId = 20029
								},
								{
									y = 127,
									name = "researchRecordLabel1",
									anchorX = 0,
									type = "richLabel",
									anchorY = 0.5,
									visible = false,
									x = 17
								},
								{
									y = 82,
									name = "researchRecordLabel2",
									anchorX = 0,
									type = "richLabel",
									anchorY = 0.5,
									visible = false,
									x = 17
								},
								{
									y = 37,
									name = "researchRecordLabel3",
									anchorX = 0,
									type = "richLabel",
									anchorY = 0.5,
									visible = false,
									x = 17
								},
								{
									style = "button_yel1",
									name = "getButton",
									y = 400,
									type = "button",
									visible = false,
									x = 400,
									label = {
										fontSize = 20,
										type = "label",
										strokeSize = 2,
										textId = 20005,
										color = colorText[10004],
										strokeColor = colorText[10005]
									}
								},
								{
									style = "button_yel1",
									name = "upgradeButton",
									y = 400,
									type = "button",
									visible = false,
									x = 400,
									label = {
										fontSize = 20,
										text = "升级",
										type = "label",
										strokeSize = 2,
										color = colorText[10004],
										strokeColor = colorText[10005]
									}
								},
								{
									y = 495,
									name = "totalProgressBarNode",
									visible = false,
									type = "node",
									x = 165,
									children = {
										{
											y = 0,
											name = "totalProgressBarBackground",
											type = "sprite",
											x = 0,
											pic = {
												frame = true,
												path = "warlock_build_degr_view.png"
											}
										},
										{
											y = 0,
											name = "totalProgressBar",
											type = "progressbar",
											x = 0,
											progressType = kCCProgressTimerTypeBar,
											pic = {
												frame = true,
												path = "warlock_build_degr_con.png"
											},
											children = {
												{
													y = 0,
													name = "totalLabel",
													anchorX = 0,
													type = "richLabel",
													anchorY = 1,
													x = 325
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
	}
}
