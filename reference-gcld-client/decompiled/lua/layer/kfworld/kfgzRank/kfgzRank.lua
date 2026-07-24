local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.btnFontSize = -10
	var_0_0.itemTitleScale = 1.2
	var_0_0.titleGroupNumX = 0
	var_0_0.titleGroupLabelX = 0
	var_0_0.titltBtnH = 10
	var_0_0.titleBtnY = -5
elseif conf.language == "tha" then
	var_0_0.btnFontSize = 0
	var_0_0.itemTitleScale = 0.75
	var_0_0.titleGroupNumX = 90
	var_0_0.titleGroupLabelX = -70
	var_0_0.titltBtnH = 0
	var_0_0.titleBtnY = 0
else
	var_0_0.btnFontSize = 0
	var_0_0.itemTitleScale = 1
	var_0_0.titleGroupNumX = 0
	var_0_0.titleGroupLabelX = 0
	var_0_0.titltBtnH = 0
	var_0_0.titleBtnY = 0
end

local var_0_1 = {}
local var_0_2 = false

local function var_0_3()
	if var_0_2 == true then
		return
	end

	if conf.language == "vie" then
		var_0_1.layout.widgets[1].children[7].visible = false
		var_0_1.layout.widgets[1].children[9].visible = false
		title = {
			x = 400,
			name = "kfgz_rank_title",
			y = 454.5,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/native/ui/kfworld/kfWorldRanking/kfgz_zbjd_tit_ybj.png"
			}
		}

		table.insert(var_0_1.layout.widgets[1].children, title)

		var_0_1.layout.widgets[1].children[8].x = var_0_1.layout.widgets[1].children[8].x + 100
	end

	var_0_2 = true
end

var_0_1.tags = {
	subRank = 1
}
var_0_1.layout = {
	parent = "topLayer",
	widgets = {
		{
			name = "panel",
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_view_bg.png"
			},
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 + 30,
			children = {
				{
					y = 450,
					name = "closeWindowButton",
					scale = 1.5,
					type = "button",
					style = "button_close",
					x = 900
				},
				{
					name = "nationRankButton",
					type = "button",
					w = 179,
					x = 203.5,
					normal = {
						frame = true,
						path = "kfgz_btn_zbjd_a.png"
					},
					touched = {
						frame = true,
						path = "kfgz_btn_zbjd_c.png"
					},
					h = 44 + var_0_0.titltBtnH,
					y = 400 + var_0_0.titleBtnY,
					label = {
						type = "label",
						strokeSize = 2,
						textId = 410201,
						fontSize = 24 + var_0_0.btnFontSize,
						color = colorText[10004],
						strokeColor = colorText[10005]
					}
				},
				{
					name = "braveButton",
					type = "button",
					w = 179,
					x = 382.5,
					normal = {
						frame = true,
						path = "kfgz_btn_zbjd_a.png"
					},
					touched = {
						frame = true,
						path = "kfgz_btn_zbjd_c.png"
					},
					h = 44 + var_0_0.titltBtnH,
					y = 400 + var_0_0.titleBtnY,
					label = {
						type = "label",
						strokeSize = 2,
						textId = 410202,
						fontSize = 24 + var_0_0.btnFontSize,
						color = colorText[10004],
						strokeColor = colorText[10005]
					}
				},
				{
					name = "starNationButton",
					type = "button",
					w = 179,
					x = 561.5,
					normal = {
						frame = true,
						path = "kfgz_btn_zbjd_a.png"
					},
					touched = {
						frame = true,
						path = "kfgz_btn_zbjd_c.png"
					},
					h = 44 + var_0_0.titltBtnH,
					y = 400 + var_0_0.titleBtnY,
					label = {
						height = 0,
						width = 120,
						type = "label",
						strokeSize = 2,
						textId = 410203,
						fontSize = 24 + var_0_0.btnFontSize,
						color = colorText[10004],
						strokeColor = colorText[10005]
					}
				},
				{
					name = "starBraveButton",
					type = "button",
					w = 179,
					x = 740.5,
					normal = {
						frame = true,
						path = "kfgz_btn_zbjd_a.png"
					},
					touched = {
						frame = true,
						path = "kfgz_btn_zbjd_c.png"
					},
					h = 44 + var_0_0.titltBtnH,
					y = 400 + var_0_0.titleBtnY,
					label = {
						height = 0,
						width = 120,
						type = "label",
						strokeSize = 2,
						textId = 410204,
						fontSize = 24 + var_0_0.btnFontSize,
						color = colorText[10004],
						strokeColor = colorText[10005]
					}
				},
				{
					x = 472,
					name = "panel",
					y = 205,
					type = "sprite",
					pic = {
						frame = true,
						path = "kfgz_rank_bg.png"
					}
				},
				{
					x = 383,
					name = "groupName",
					y = 454.5,
					type = "sprite",
					pic = {
						frame = true,
						path = "kfgz_zbjd_tit_ybj.png"
					}
				},
				{
					name = "groupLabel",
					type = "atlaslabel",
					pic = "res/ui/common/number/kfgz_zbjd-nb.png",
					startCharMap = 48,
					text = "0",
					y = 454.5,
					itemWidth = 43,
					itemHeight = 49,
					x = 524 + var_0_0.titleGroupNumX
				},
				{
					y = 454.5,
					type = "sprite",
					pic = {
						frame = true,
						path = "kfgz_zbjd_tit_z.png"
					},
					x = 613 + var_0_0.titleGroupLabelX
				}
			}
		}
	}
}
var_0_1.nationRankLayout = {
	y = 0,
	name = "nationRankPanel",
	type = "node",
	x = 0,
	children = {
		{
			y = 345,
			x = 180,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_phb_tit_pm.png"
			},
			scale = var_0_0.itemTitleScale
		},
		{
			y = 345,
			x = 295,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_phb_tit_zcs.png"
			},
			scale = var_0_0.itemTitleScale
		},
		{
			y = 345,
			x = 415,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_phb_tit_scs.png"
			},
			scale = var_0_0.itemTitleScale
		},
		{
			y = 345,
			x = 560,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_phb_tit_yssds.png"
			},
			scale = var_0_0.itemTitleScale
		},
		{
			y = 345,
			x = 745,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_phb_tit_gj.png"
			},
			scale = var_0_0.itemTitleScale
		}
	}
}
var_0_1.nationRankItemLayout = {
	y = 0,
	name = "nationRankItem",
	type = "node",
	x = 0,
	children = {
		{
			x = 115,
			name = "iconGold",
			y = 0,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "kfgz_phb_icon_jin.png"
			}
		},
		{
			x = 115,
			name = "iconSilver",
			y = 0,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "kfgz_phb_icon_yin.png"
			}
		},
		{
			x = 115,
			name = "iconCopper",
			y = 0,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "kfgz_phb_icon_tong.png"
			}
		},
		{
			x = 180,
			name = "iconFlag",
			y = 0,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "xflts_pm_top.png"
			}
		},
		{
			name = "rankNum",
			type = "atlaslabel",
			pic = "res/ui/common/number/xflts_res_numb.png",
			startCharMap = 48,
			text = "0",
			y = 0,
			itemWidth = 22,
			x = 180,
			itemHeight = 33,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			text = "",
			name = "selfCityNum",
			y = 0,
			type = "label",
			style = "label_white_24",
			x = 295,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			text = "",
			name = "oppCityNum",
			y = 0,
			type = "label",
			style = "label_white_24",
			x = 415,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			text = "",
			name = "firstkillArmyNum",
			y = 0,
			type = "label",
			style = "label_white_24",
			x = 560,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			text = "",
			name = "nationName",
			anchorX = 0.5,
			type = "richLabel",
			y = 0,
			x = 745
		}
	}
}
var_0_1.braveRankLayout = {
	y = 0,
	name = "braveRankPanel",
	type = "node",
	x = 0,
	children = {
		{
			y = 345,
			x = 180,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_phb_tit_pm.png"
			},
			scale = var_0_0.itemTitleScale
		},
		{
			y = 345,
			x = 305,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_phb_tit_sds.png"
			},
			scale = var_0_0.itemTitleScale
		},
		{
			y = 345,
			x = 455,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_phb_tit_gj.png"
			},
			scale = var_0_0.itemTitleScale
		},
		{
			y = 345,
			x = 655,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_phb_tit_dyys.png"
			},
			scale = var_0_0.itemTitleScale
		}
	}
}
var_0_1.braveRankItemLayout = {
	y = 0,
	name = "braveRankItem",
	type = "node",
	x = 0,
	children = {
		{
			x = 115,
			name = "iconGold",
			y = 0,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "kfgz_phb_icon_jin.png"
			}
		},
		{
			x = 115,
			name = "iconSilver",
			y = 0,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "kfgz_phb_icon_yin.png"
			}
		},
		{
			x = 115,
			name = "iconCopper",
			y = 0,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "kfgz_phb_icon_tong.png"
			}
		},
		{
			x = 180,
			name = "iconFlag",
			y = 0,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "xflts_pm_top.png"
			}
		},
		{
			name = "rankNum",
			type = "atlaslabel",
			pic = "res/ui/common/number/xflts_res_numb.png",
			startCharMap = 48,
			text = "0",
			y = 0,
			itemWidth = 22,
			x = 180,
			itemHeight = 33,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			text = "",
			name = "killNumm",
			y = 0,
			type = "label",
			style = "label_white_24",
			x = 305,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			text = "",
			name = "nationName",
			anchorX = 0.5,
			type = "richLabel",
			y = 0,
			x = 455
		},
		{
			text = "",
			name = "braveName",
			y = 0,
			type = "label",
			style = "label_white_24",
			x = 655,
			anchorPoint = ccp(0.5, 0.5),
			color = ccc3(109, 225, 212)
		}
	}
}
var_0_1.starNationRankLayout = {
	y = 0,
	name = "starNationRankPanel",
	type = "node",
	x = 0,
	children = {
		{
			y = 345,
			x = 180,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_phb_tit_pm.png"
			},
			scale = var_0_0.itemTitleScale
		},
		{
			y = 345,
			x = 250,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_phb_tit_zb.png"
			},
			scale = var_0_0.itemTitleScale
		},
		{
			y = 345,
			x = 345,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_phb_tit_zcs.png"
			},
			scale = var_0_0.itemTitleScale
		},
		{
			y = 345,
			x = 465,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_phb_tit_scs.png"
			},
			scale = var_0_0.itemTitleScale
		},
		{
			y = 345,
			x = 615,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_phb_tit_yssds.png"
			},
			scale = var_0_0.itemTitleScale
		},
		{
			y = 345,
			x = 765,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_phb_tit_gj.png"
			},
			scale = var_0_0.itemTitleScale
		}
	}
}
var_0_1.starNationRankItemLayout = {
	y = 0,
	name = "starNationRankItem",
	type = "node",
	x = 0,
	children = {
		{
			x = 115,
			name = "iconGold",
			y = 0,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "kfgz_phb_icon_jin.png"
			}
		},
		{
			x = 115,
			name = "iconSilver",
			y = 0,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "kfgz_phb_icon_yin.png"
			}
		},
		{
			x = 115,
			name = "iconCopper",
			y = 0,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "kfgz_phb_icon_tong.png"
			}
		},
		{
			x = 180,
			name = "iconFlag",
			y = 0,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "xflts_pm_top.png"
			}
		},
		{
			name = "rankNum",
			type = "atlaslabel",
			pic = "res/ui/common/number/xflts_res_numb.png",
			startCharMap = 48,
			text = "0",
			y = 0,
			itemWidth = 22,
			x = 180,
			itemHeight = 33,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			text = "",
			name = "groupNum",
			y = 0,
			type = "label",
			style = "label_white_24",
			x = 250,
			anchorPoint = ccp(0.5, 0.5),
			color = ccc3(109, 225, 212)
		},
		{
			text = "",
			name = "selfCityNum",
			y = 0,
			type = "label",
			style = "label_white_24",
			x = 345,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			text = "",
			name = "oppCityNum",
			y = 0,
			type = "label",
			style = "label_white_24",
			x = 465,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			text = "",
			name = "firstkillArmyNum",
			y = 0,
			type = "label",
			style = "label_white_24",
			x = 615,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			text = "",
			name = "nationName",
			anchorX = 0.5,
			type = "richLabel",
			y = 0,
			x = 765
		}
	}
}
var_0_1.starBraveRankLayout = {
	y = 0,
	name = "starBraveRankPanel",
	type = "node",
	x = 0,
	children = {
		{
			y = 345,
			x = 180,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_phb_tit_pm.png"
			},
			scale = var_0_0.itemTitleScale
		},
		{
			y = 345,
			x = 265,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_phb_tit_zb.png"
			},
			scale = var_0_0.itemTitleScale
		},
		{
			y = 345,
			x = 370,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_phb_tit_sds.png"
			},
			scale = var_0_0.itemTitleScale
		},
		{
			y = 345,
			x = 500,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_phb_tit_gj.png"
			},
			scale = var_0_0.itemTitleScale
		},
		{
			y = 345,
			x = 695,
			type = "sprite",
			pic = {
				frame = true,
				path = "kfgz_phb_tit_dyys.png"
			},
			scale = var_0_0.itemTitleScale
		}
	}
}
var_0_1.starBraveRankItemLayout = {
	y = 0,
	name = "braveRankItem",
	type = "node",
	x = 0,
	children = {
		{
			x = 115,
			name = "iconGold",
			y = 0,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "kfgz_phb_icon_jin.png"
			}
		},
		{
			x = 115,
			name = "iconSilver",
			y = 0,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "kfgz_phb_icon_yin.png"
			}
		},
		{
			x = 115,
			name = "iconCopper",
			y = 0,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "kfgz_phb_icon_tong.png"
			}
		},
		{
			x = 180,
			name = "iconFlag",
			y = 0,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "xflts_pm_top.png"
			}
		},
		{
			name = "rankNum",
			type = "atlaslabel",
			pic = "res/ui/common/number/xflts_res_numb.png",
			startCharMap = 48,
			text = "0",
			y = 0,
			itemWidth = 22,
			x = 180,
			itemHeight = 33,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			text = "",
			name = "groupNum",
			y = 0,
			type = "label",
			style = "label_white_24",
			x = 265,
			anchorPoint = ccp(0.5, 0.5),
			color = ccc3(109, 225, 212)
		},
		{
			text = "",
			name = "killNumm",
			y = 0,
			type = "label",
			style = "label_white_24",
			x = 370,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			text = "",
			name = "nationName",
			anchorX = 0.5,
			type = "richLabel",
			y = 0,
			x = 500
		},
		{
			text = "",
			name = "braveName",
			y = 0,
			type = "label",
			style = "label_white_24",
			x = 695,
			anchorPoint = ccp(0.5, 0.5),
			color = ccc3(109, 225, 212)
		}
	}
}

function var_0_1.handlerRankInfo(arg_2_0)
	var_0_1.groupNationRes = arg_2_0.action.data.groupNationRes
	var_0_1.groupKillArmy = arg_2_0.action.data.groupKillArmy
	var_0_1.layerNationRes = arg_2_0.action.data.layerNationRes
	var_0_1.layerKillArmy = arg_2_0.action.data.layerKillArmy

	if arg_2_0.action.data.layer == 1 then
		var_0_1.kfgzRankView.widgets.groupName:setDisplayFrame(CCSprite:createWithSpriteFrameName("kfgz_zbjd_tit_ybj.png"):displayFrame())
	elseif arg_2_0.action.data.layer == 2 then
		var_0_1.kfgzRankView.widgets.groupName:setDisplayFrame(CCSprite:createWithSpriteFrameName("kf_tit_xf.png"):displayFrame())
	elseif arg_2_0.action.data.layer == 3 then
		var_0_1.kfgzRankView.widgets.groupName:setDisplayFrame(CCSprite:createWithSpriteFrameName("kfjrj_jrj.png"):displayFrame())
	elseif arg_2_0.action.data.layer == 4 then
		var_0_1.kfgzRankView.widgets.groupName:setDisplayFrame(CCSprite:createWithSpriteFrameName("kf_tit_zz.png"):displayFrame())
	end

	eventManager.dispatchEvent("changeWorldMap", arg_2_0.action.data.layer)
	var_0_1.kfgzRankView.widgets.groupLabel:setString(tostring(arg_2_0.action.data.group))
	var_0_1.onNationButtonSelected()

	if conf.language == "vie" then
		if arg_2_0.action.data.layer == 3 then
			var_0_1.kfgzRankView.widgets.kfgz_rank_title:setDisplayFrame(CCSprite:create("res/native/ui/kfworld/kfWorldRanking/kfgz_zbjd_tit_jrj.png"):displayFrame())
		elseif arg_2_0.action.data.layer == 4 then
			var_0_1.kfgzRankView.widgets.kfgz_rank_title:setDisplayFrame(CCSprite:create("res/native/ui/kfworld/kfWorldRanking/kfgz_zbjd_tit_zzj.png"):displayFrame())
		end
	end
end

function var_0_1.getRankInfo()
	cmgr.sendRequest(var_0_1.handlerRankInfo, actions.kfgzRankInfo)
end

function var_0_1.onChangeSelect(arg_4_0)
	if var_0_1.lastSelectedButton then
		var_0_1.lastSelectedButton:setHighlighted(false)
	end

	if arg_4_0 then
		arg_4_0:setHighlighted(true)

		var_0_1.lastSelectedButton = arg_4_0
	end

	tool.safeRemoveChildByTag(var_0_1.kfgzRankView.widgets.panel, var_0_1.tags.subRank)
end

function var_0_1.onNationButtonSelected()
	var_0_1.onChangeSelect(var_0_1.kfgzRankView.widgets.nationRankButton)

	local var_5_0 = {}

	uiutil.initWidgets(var_5_0, var_0_1.nationRankLayout)
	var_0_1.kfgzRankView.widgets.panel:addChild(var_5_0.widgets.nationRankPanel, 10, var_0_1.tags.subRank)

	if var_0_1.groupNationRes then
		local var_5_1 = 0
		local var_5_2 = 310

		for iter_5_0 = 1, 8 do
			local var_5_3 = {}

			uiutil.initWidgets(var_5_3, var_0_1.nationRankItemLayout)
			var_5_3.widgets.nationRankItem:setPosition(ccp(var_5_1, var_5_2))
			var_5_0.widgets.nationRankPanel:addChild(var_5_3.widgets.nationRankItem)

			var_5_2 = var_5_2 - 36

			var_5_3.widgets.rankNum:setString(tonumber(iter_5_0))

			if iter_5_0 < 4 then
				var_5_3.widgets.iconFlag:setVisible(true)

				if iter_5_0 == 1 then
					var_5_3.widgets.iconGold:setVisible(true)
				elseif iter_5_0 == 2 then
					var_5_3.widgets.iconSilver:setVisible(true)
				elseif iter_5_0 == 3 then
					var_5_3.widgets.iconCopper:setVisible(true)
				end
			end

			local var_5_4 = var_0_1.groupNationRes[iter_5_0]

			if var_5_4 then
				var_5_3.widgets.selfCityNum:setString(tostring(var_5_4.selfCity))
				var_5_3.widgets.oppCityNum:setString(tostring(var_5_4.oppCity))
				var_5_3.widgets.firstkillArmyNum:setString(tostring(var_5_4.firstkillArmy))

				if conf.language == "vie" then
					local var_5_5 = string.match(var_5_4.serverName, "%d+") or var_5_4.serverName

					var_5_3.widgets.nationName:setString(language.get(410110 + var_5_4.nation, var_5_5))
				else
					var_5_3.widgets.nationName:setString(language.get(410110 + var_5_4.nation, var_5_4.serverName))
				end
			end
		end
	end
end

function var_0_1.onBraveButtonSelected()
	var_0_1.onChangeSelect(var_0_1.kfgzRankView.widgets.braveButton)

	local var_6_0 = {}

	uiutil.initWidgets(var_6_0, var_0_1.braveRankLayout)
	var_0_1.kfgzRankView.widgets.panel:addChild(var_6_0.widgets.braveRankPanel, 10, var_0_1.tags.subRank)

	if var_0_1.groupKillArmy then
		local var_6_1 = 0
		local var_6_2 = 310

		for iter_6_0 = 1, 8 do
			local var_6_3 = {}

			uiutil.initWidgets(var_6_3, var_0_1.braveRankItemLayout)
			var_6_3.widgets.braveRankItem:setPosition(ccp(var_6_1, var_6_2))
			var_6_0.widgets.braveRankPanel:addChild(var_6_3.widgets.braveRankItem)

			var_6_2 = var_6_2 - 36

			var_6_3.widgets.rankNum:setString(tonumber(iter_6_0))

			if iter_6_0 < 4 then
				var_6_3.widgets.iconFlag:setVisible(true)

				if iter_6_0 == 1 then
					var_6_3.widgets.iconGold:setVisible(true)
				elseif iter_6_0 == 2 then
					var_6_3.widgets.iconSilver:setVisible(true)
				elseif iter_6_0 == 3 then
					var_6_3.widgets.iconCopper:setVisible(true)
				end
			end

			local var_6_4 = var_0_1.groupKillArmy[iter_6_0]

			if var_6_4 then
				var_6_3.widgets.killNumm:setString(tostring(var_6_4.killArmy))
				var_6_3.widgets.braveName:setString(tostring(language.get(410005, var_6_4.playerName, var_6_4.playerLv)))

				if conf.language == "kr" then
					var_6_3.widgets.nationName:setString(language.get("kr_41012" .. var_6_4.nation, "S", var_6_4.serverId))
				elseif conf.language == "vie" then
					var_6_3.widgets.nationName:setString(language.get(410120 + var_6_4.nation, var_6_4.serverId))
				else
					var_6_3.widgets.nationName:setString(language.get(410120 + var_6_4.nation, var_6_4.serverName, var_6_4.serverId))
				end
			end
		end
	end
end

function var_0_1.onStarNationSelected()
	var_0_1.onChangeSelect(var_0_1.kfgzRankView.widgets.starNationButton)

	local var_7_0 = {}

	uiutil.initWidgets(var_7_0, var_0_1.starNationRankLayout)
	var_0_1.kfgzRankView.widgets.panel:addChild(var_7_0.widgets.starNationRankPanel, 10, var_0_1.tags.subRank)

	if var_0_1.layerNationRes then
		local var_7_1 = 0
		local var_7_2 = 310

		for iter_7_0 = 1, 8 do
			local var_7_3 = {}

			uiutil.initWidgets(var_7_3, var_0_1.starNationRankItemLayout)
			var_7_3.widgets.starNationRankItem:setPosition(ccp(var_7_1, var_7_2))
			var_7_0.widgets.starNationRankPanel:addChild(var_7_3.widgets.starNationRankItem)

			var_7_2 = var_7_2 - 36

			var_7_3.widgets.rankNum:setString(tonumber(iter_7_0))

			if iter_7_0 < 4 then
				var_7_3.widgets.iconFlag:setVisible(true)

				if iter_7_0 == 1 then
					var_7_3.widgets.iconGold:setVisible(true)
				elseif iter_7_0 == 2 then
					var_7_3.widgets.iconSilver:setVisible(true)
				elseif iter_7_0 == 3 then
					var_7_3.widgets.iconCopper:setVisible(true)
				end
			end

			local var_7_4 = var_0_1.layerNationRes[iter_7_0]

			if var_7_4 then
				var_7_3.widgets.groupNum:setString(tostring(var_7_4.gId))
				var_7_3.widgets.selfCityNum:setString(tostring(var_7_4.selfCity))
				var_7_3.widgets.oppCityNum:setString(tostring(var_7_4.oppCity))
				var_7_3.widgets.firstkillArmyNum:setString(tostring(var_7_4.firstkillArmy))

				if conf.language == "vie" then
					local var_7_5 = string.match(var_7_4.serverName, "%d+") or var_7_4.serverName

					var_7_3.widgets.nationName:setString(language.get(410110 + var_7_4.nation, var_7_5))
				else
					var_7_3.widgets.nationName:setString(language.get(410110 + var_7_4.nation, var_7_4.serverName))
				end
			end
		end
	end
end

function var_0_1.onStarBraveSelected()
	var_0_1.onChangeSelect(var_0_1.kfgzRankView.widgets.starBraveButton)

	local var_8_0 = {}

	uiutil.initWidgets(var_8_0, var_0_1.starBraveRankLayout)
	var_0_1.kfgzRankView.widgets.panel:addChild(var_8_0.widgets.starBraveRankPanel, 10, var_0_1.tags.subRank)

	if var_0_1.layerKillArmy then
		local var_8_1 = 0
		local var_8_2 = 310

		for iter_8_0 = 1, 8 do
			local var_8_3 = {}

			uiutil.initWidgets(var_8_3, var_0_1.starBraveRankItemLayout)
			var_8_3.widgets.braveRankItem:setPosition(ccp(var_8_1, var_8_2))
			var_8_0.widgets.starBraveRankPanel:addChild(var_8_3.widgets.braveRankItem)

			var_8_2 = var_8_2 - 36

			var_8_3.widgets.rankNum:setString(tonumber(iter_8_0))

			if iter_8_0 < 4 then
				var_8_3.widgets.iconFlag:setVisible(true)

				if iter_8_0 == 1 then
					var_8_3.widgets.iconGold:setVisible(true)
				elseif iter_8_0 == 2 then
					var_8_3.widgets.iconSilver:setVisible(true)
				elseif iter_8_0 == 3 then
					var_8_3.widgets.iconCopper:setVisible(true)
				end
			end

			local var_8_4 = var_0_1.layerKillArmy[iter_8_0]

			if var_8_4 then
				var_8_3.widgets.groupNum:setString(tostring(var_8_4.gId))
				var_8_3.widgets.killNumm:setString(tostring(var_8_4.killArmy))
				var_8_3.widgets.braveName:setString(tostring(language.get(410005, var_8_4.playerName, var_8_4.playerLv)))

				if conf.language == "kr" then
					var_8_3.widgets.nationName:setString(language.get("kr_41012" .. var_8_4.nation, "S", var_8_4.serverId))
				elseif conf.language == "vie" then
					var_8_3.widgets.nationName:setString(language.get(410120 + var_8_4.nation, var_8_4.serverId))
				else
					var_8_3.widgets.nationName:setString(language.get(410120 + var_8_4.nation, var_8_4.serverName, var_8_4.serverId))
				end
			end
		end
	end
end

function var_0_1.close()
	var_0_1:destory()
end

function var_0_1.create(arg_10_0)
	var_0_3()
	arg_10_0:destory()
	log.info("@@ 跨服国战排行")
	rmgr.loadResource("res/ui/kfworld/kfWorldRanking.plist")
	rmgr.loadResource("res/ui/battle/kfwd/kfwd.plist")

	arg_10_0.lastSelectedButton = nil
	arg_10_0.groupNationRes = nil
	arg_10_0.groupKillArmy = nil
	arg_10_0.layerNationRes = nil
	arg_10_0.layerKillArmy = nil
	arg_10_0.kfgzRankView = {}

	uiutil.initLayout(arg_10_0.kfgzRankView, var_0_1.layout)
	arg_10_0.kfgzRankView.widgets.nationRankButton:addHandleOfControlEvent(var_0_1.onNationButtonSelected, CCControlEventTouchUpInside)
	arg_10_0.kfgzRankView.widgets.braveButton:addHandleOfControlEvent(var_0_1.onBraveButtonSelected, CCControlEventTouchUpInside)
	arg_10_0.kfgzRankView.widgets.starNationButton:addHandleOfControlEvent(var_0_1.onStarNationSelected, CCControlEventTouchUpInside)
	arg_10_0.kfgzRankView.widgets.starBraveButton:addHandleOfControlEvent(var_0_1.onStarBraveSelected, CCControlEventTouchUpInside)
	arg_10_0.kfgzRankView.widgets.closeWindowButton:addHandleOfControlEvent(arg_10_0.close, CCControlEventTouchUpInside)
	arg_10_0.kfgzRankView.widgets.nationRankButton:setTitleColorForState(colorText[10003], CCControlStateHighlighted)
	arg_10_0.kfgzRankView.widgets.braveButton:setTitleColorForState(colorText[10003], CCControlStateHighlighted)
	arg_10_0.kfgzRankView.widgets.starNationButton:setTitleColorForState(colorText[10003], CCControlStateHighlighted)
	arg_10_0.kfgzRankView.widgets.starBraveButton:setTitleColorForState(colorText[10003], CCControlStateHighlighted)
	arg_10_0.getRankInfo()
end

function var_0_1.destory(arg_11_0)
	if arg_11_0.kfgzRankView and arg_11_0.kfgzRankView.widgets then
		smgr.getLayer("topLayer"):removeChild(arg_11_0.kfgzRankView.widgets.panel, true)

		arg_11_0.kfgzRankView = {}
	end
end

return var_0_1
