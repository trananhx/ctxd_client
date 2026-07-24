return {
	widgets = {
		{
			name = "window",
			type = "layerColor",
			color = ccc4(0, 0, 0, 180),
			children = {
				{
					name = "background",
					type = "sprite9",
					pic = {
						frame = true,
						path = "bigPanel.png"
					},
					preferedSize = CCSizeMake(960, 581),
					x = visibleSize.width * 0.5,
					y = visibleSize.height * 0.5 - 28,
					children = {
						{
							y = 605,
							name = "openChatWindowButton",
							scale = 1.5,
							type = "button",
							style = "button_close",
							x = 930
						},
						{
							x = 480,
							y = 290,
							type = "sprite",
							pic = {
								frame = true,
								path = "chat_view_bg.jpg"
							}
						},
						{
							y = 73,
							name = "keyboardButton",
							h = 91,
							type = "button",
							w = 84,
							visible = false,
							x = 75,
							normal = {
								frame = true,
								path = "btn_keyb_a.png"
							},
							touched = {
								frame = true,
								path = "btn_keyb_c.png"
							},
							children = {
								{
									x = 42,
									y = 44,
									type = "sprite",
									pic = {
										frame = true,
										path = "btn_keyb_icon_keyb.png"
									}
								}
							}
						},
						{
							name = "videoButton",
							h = 91,
							type = "button",
							w = 84,
							y = 73,
							x = 75,
							normal = {
								frame = true,
								path = "btn_keyb_a.png"
							},
							touched = {
								frame = true,
								path = "btn_keyb_c.png"
							},
							children = {
								{
									x = 42,
									y = 44,
									type = "sprite",
									pic = {
										frame = true,
										path = "btn_keyb_icon_voice.png"
									}
								}
							}
						},
						{
							name = "channelSelectButton",
							h = 93,
							type = "button",
							w = 104,
							y = 72,
							x = 170,
							normal = {
								frame = true,
								path = "btn_nation_a.png"
							},
							touched = {
								frame = true,
								path = "btn_nation_click.png"
							},
							label = {
								fontSize = 20,
								type = "label",
								strokeSize = 2,
								textId = 40006,
								color = colorText[10004],
								strokeColor = colorText[10005]
							},
							children = {
								{
									fontSize = 20,
									name = "nationButtonName",
									tag = 1,
									type = "label",
									strokeSize = 2,
									textId = 40001,
									y = 50,
									x = 52,
									color = colorText[10004],
									strokeColor = colorText[10005]
								}
							}
						},
						{
							y = 336.5,
							name = "recordButton",
							h = 432,
							type = "button",
							w = 908,
							zorder = 50,
							visible = false,
							x = 480,
							normal = {
								frame = true,
								path = "lt_xyq.png"
							},
							touched = {
								frame = true,
								path = "lt_xyq.png"
							}
						},
						{
							visible = false,
							name = "grayHuaTong",
							x = 480,
							type = "sprite",
							y = 320.5,
							zorder = 80,
							pic = {
								frame = true,
								path = "btn_talk_a.png"
							},
							children = {
								{
									fontSize = 20,
									name = "kaishiluying",
									strokeSize = 2,
									type = "label",
									textId = 40007,
									y = -10,
									x = 83,
									color = colorText[10004],
									strokeColor = colorText[10005]
								},
								{
									x = -31,
									name = "xiaohuatong",
									y = -10,
									type = "sprite",
									pic = {
										frame = true,
										path = "lt_httb.png"
									}
								}
							}
						},
						{
							visible = false,
							name = "greenHuaTong",
							x = 480,
							type = "sprite",
							y = 320.5,
							zorder = 80,
							pic = {
								frame = true,
								path = "btn_talk_click2.png"
							},
							children = {
								{
									fontSize = 20,
									name = "kaishiluying",
									strokeSize = 2,
									type = "label",
									textId = 40008,
									y = -52,
									x = 83,
									color = ccc3(118, 225, 76),
									strokeColor = colorText[10005]
								},
								{
									x = -23,
									name = "xiaohuatong",
									y = -52,
									type = "sprite",
									pic = {
										frame = true,
										path = "lt_httb.png"
									}
								},
								{
									x = 73,
									name = "diceng",
									y = -40,
									type = "sprite",
									zorder = -1,
									pic = {
										frame = true,
										path = "lt_wzd.png"
									}
								},
								{
									fontSize = 20,
									name = "restTime",
									strokeSize = 2,
									type = "label",
									textId = 40006,
									y = -27,
									x = 73,
									color = colorText[10004],
									strokeColor = colorText[10005]
								}
							}
						},
						{
							type = "editBox",
							name = "inputBox",
							h = 44,
							placeHolderId = 40004,
							w = 480,
							maxLenght = 300,
							y = 75,
							x = 470,
							background = {
								frame = true,
								path = "chat_input_frame.png"
							}
						},
						{
							name = "fastChatButton",
							h = 91,
							type = "button",
							w = 84,
							y = 73,
							x = 760,
							normal = {
								frame = true,
								path = "btn_keyb_a.png"
							},
							touched = {
								frame = true,
								path = "btn_keyb_c.png"
							},
							label = {
								fontSize = 20,
								type = "label",
								strokeSize = 2,
								textId = 40006,
								color = colorText[10004],
								strokeColor = colorText[10005]
							},
							children = {
								{
									fontSize = 20,
									name = "buttonName",
									strokeSize = 2,
									type = "label",
									textId = 40005,
									y = 48,
									x = 42,
									color = colorText[10004],
									strokeColor = colorText[10005]
								}
							}
						},
						{
							name = "sendButton",
							h = 93,
							type = "button",
							w = 140,
							y = 72,
							x = 865,
							normal = {
								frame = true,
								path = "btn_spoke_a.png"
							},
							touched = {
								frame = true,
								path = "btn_spoke_c.png"
							},
							label = {
								fontSize = 20,
								type = "label",
								strokeSize = 2,
								textId = 40006,
								color = colorText[10004],
								strokeColor = colorText[10005]
							},
							children = {
								{
									fontSize = 20,
									name = "buttonName",
									strokeSize = 2,
									type = "label",
									textId = 40003,
									y = 49,
									x = 68,
									color = colorText[10004],
									strokeColor = colorText[10005]
								}
							}
						},
						{
							y = 205,
							name = "selectChanelPanel",
							type = "sprite9",
							zorder = 100,
							visible = false,
							x = 250,
							middleRect = CCRectMake(0, 0, 0, 0),
							preferedSize = CCSizeMake(160, 182),
							pic = {
								frame = true,
								path = "chat_tips_view.png"
							},
							children = {
								{
									visible = false,
									name = "threeYzButton",
									h = 55,
									type = "button",
									w = 90,
									y = 200,
									x = 55,
									normal = {
										frame = true,
										path = "chat_list_bg1.jpg"
									},
									touched = {
										frame = true,
										path = "chat_list_bg1.jpg",
										child = {
											y = 27,
											type = "sprite9",
											x = 45,
											middleRect = CCRectMake(0, 0, 0, 0),
											preferedSize = CCSizeMake(90, 55),
											pic = {
												frame = true,
												path = "chat_tips_list_on.png"
											}
										}
									},
									children = {
										{
											y = 27,
											name = "chatKfLb",
											type = "label",
											x = 45,
											textId = 215209
										}
									}
								},
								{
									name = "countryButton",
									h = 55,
									type = "button",
									w = 140,
									y = 145,
									x = 80,
									normal = {
										frame = true,
										path = "chat_list_bg1.jpg"
									},
									touched = {
										frame = true,
										path = "chat_list_bg1.jpg",
										child = {
											y = 27,
											type = "sprite9",
											x = 45,
											middleRect = CCRectMake(0, 0, 0, 0),
											preferedSize = CCSizeMake(90, 55),
											pic = {
												frame = true,
												path = "chat_tips_list_on.png"
											}
										}
									},
									label = {
										textId = 40201,
										type = "label"
									}
								},
								{
									name = "privateButton",
									h = 55,
									type = "button",
									w = 140,
									y = 90,
									x = 80,
									normal = {
										frame = true,
										path = "chat_list_bg2.jpg"
									},
									touched = {
										frame = true,
										path = "chat_list_bg2.jpg",
										child = {
											y = 27,
											type = "sprite9",
											x = 45,
											middleRect = CCRectMake(0, 0, 0, 0),
											preferedSize = CCSizeMake(90, 55),
											pic = {
												frame = true,
												path = "chat_tips_list_on.png"
											}
										}
									},
									label = {
										textId = 40202,
										type = "label"
									}
								},
								{
									name = "blacklistButton",
									h = 55,
									type = "button",
									w = 140,
									y = 35,
									x = 80,
									normal = {
										frame = true,
										path = "chat_list_bg1.jpg"
									},
									touched = {
										frame = true,
										path = "chat_list_bg1.jpg",
										child = {
											y = 27,
											type = "sprite9",
											x = 45,
											middleRect = CCRectMake(0, 0, 0, 0),
											preferedSize = CCSizeMake(90, 55),
											pic = {
												frame = true,
												path = "chat_tips_list_on.png"
											}
										}
									},
									label = {
										textId = 40203,
										type = "label"
									}
								}
							}
						},
						{
							y = 264,
							name = "privateChatWindow",
							type = "sprite9",
							zorder = 100,
							visible = false,
							x = 457,
							middleRect = CCRectMake(52, 85, 1, 1),
							preferedSize = CCSizeMake(430, 220),
							pic = {
								frame = true,
								path = "commanWindow.png"
							},
							children = {
								{
									y = 180,
									style = "label_yellowish_24",
									type = "label",
									x = 210,
									textId = 40301
								},
								{
									y = 130,
									style = "label_yellowish_20",
									type = "label",
									x = 17,
									textId = 40302,
									anchorPoint = ccp(0, 0.5)
								},
								{
									h = 35,
									name = "privateChatInputBox",
									type = "editBox",
									w = 380,
									y = 95,
									x = 210,
									background = {
										frame = true,
										path = "chat_input_frame.png"
									}
								},
								{
									y = 35,
									name = "privateOkButton",
									style = "button_gre1",
									type = "button",
									x = 145,
									label = {
										textId = 10001,
										type = "label"
									}
								},
								{
									y = 35,
									name = "privateCancelButton",
									style = "button_yel1",
									type = "button",
									x = 275,
									label = {
										textId = 10002,
										type = "label"
									}
								}
							}
						},
						{
							y = 275,
							name = "fastChatWindow",
							type = "sprite9",
							zorder = 100,
							visible = false,
							middleRect = CCRectMake(0, 0, 0, 0),
							preferedSize = CCSizeMake(725, 320),
							x = visibleSize.width * 0.59,
							pic = {
								frame = true,
								path = "chat_tips_view.png"
							}
						},
						{
							y = 0,
							name = "privateAndBlacklistPanel",
							type = "sprite9",
							zorder = 100,
							visible = false,
							x = 0,
							middleRect = CCRectMake(0, 0, 0, 0),
							preferedSize = CCSizeMake(110, 128),
							pic = {
								frame = true,
								path = "chat_tips_view.png"
							},
							children = {
								{
									name = "privateToPlayerButton",
									h = 55,
									type = "button",
									w = 90,
									y = 90,
									x = 55,
									normal = {
										frame = true,
										path = "chat_list_bg1.jpg"
									},
									touched = {
										frame = true,
										path = "chat_list_bg1.jpg",
										child = {
											y = 27,
											type = "sprite9",
											x = 45,
											middleRect = CCRectMake(0, 0, 0, 0),
											preferedSize = CCSizeMake(90, 55),
											pic = {
												frame = true,
												path = "chat_tips_list_on.png"
											}
										}
									},
									label = {
										textId = 40401,
										type = "label"
									}
								},
								{
									name = "addToBlacklistButton",
									h = 55,
									type = "button",
									w = 90,
									y = 35,
									x = 55,
									normal = {
										frame = true,
										path = "chat_list_bg2.jpg"
									},
									touched = {
										frame = true,
										path = "chat_list_bg2.jpg",
										child = {
											y = 27,
											type = "sprite9",
											x = 45,
											middleRect = CCRectMake(0, 0, 0, 0),
											preferedSize = CCSizeMake(90, 55),
											pic = {
												frame = true,
												path = "chat_tips_list_on.png"
											}
										}
									},
									label = {
										textId = 40402,
										type = "label"
									}
								}
							}
						},
						{
							y = 264,
							name = "blacklistWindow",
							type = "sprite9",
							zorder = 100,
							visible = false,
							x = 457,
							middleRect = CCRectMake(52, 85, 1, 1),
							preferedSize = CCSizeMake(385, 395),
							pic = {
								frame = true,
								path = "commanWindow.png"
							},
							children = {
								{
									y = 360,
									style = "label_yellowish_24",
									type = "label",
									x = 192,
									textId = 40501
								},
								{
									y = 360,
									name = "closeBlackListWindow",
									scale = 1.5,
									type = "button",
									style = "button_close",
									x = 352
								},
								{
									y = 167,
									type = "sprite9",
									x = 192,
									middleRect = CCRectMake(0, 0, 0, 0),
									preferedSize = CCSizeMake(360, 310),
									pic = {
										frame = true,
										path = "chat_tips_view.png"
									}
								},
								{
									name = "blacklistView",
									type = "TableView",
									y = 21,
									x = 21,
									visible = false,
									viewSize = CCSizeMake(345, 292),
									dirction = kCCScrollViewDirectionVertical,
									verticalFill = kCCTableViewFillTopDown
								}
							}
						}
					}
				}
			}
		}
	}
}
