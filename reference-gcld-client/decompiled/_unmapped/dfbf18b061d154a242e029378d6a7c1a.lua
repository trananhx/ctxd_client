function getKaiguangFinalUIData()
	return {
		kaiguangFinalBackground = {
			y = 30,
			name = "kaiguangFinalBackground",
			x = 20,
			type = "pic",
			anchorPointX = 0,
			anchorPointY = 0,
			pic = "res/ui/equip/kaiguang/last/jjtz_view_bg.jpg",
			children = {
				{
					y = 479,
					pic = "res/ui/equip/kaiguang/last/jjtz_title.png",
					x = 457,
					type = "pic"
				},
				{
					y = 117,
					name = "jifenghuang",
					z = 1,
					type = "pic",
					pic = "res/ui/equip/kaiguang/last/jjtz_samll_bg_c.png",
					x = 151,
					children = {
						{
							y = 86,
							pic = "frame:jfh.jpg",
							x = 86,
							type = "pic"
						}
					}
				},
				{
					y = 117,
					name = "jiquhu",
					z = 1,
					type = "pic",
					visible = false,
					pic = "res/ui/equip/kaiguang/last/jjtz_samll_bg_c.png",
					x = 304,
					children = {
						{
							y = 86,
							pic = "frame:jqh.jpg",
							x = 86,
							type = "pic"
						}
					}
				},
				{
					y = 117,
					name = "jibaxia",
					z = 1,
					type = "pic",
					visible = false,
					pic = "res/ui/equip/kaiguang/last/jjtz_samll_bg_c.png",
					x = 457,
					children = {
						{
							y = 86,
							pic = "frame:jbx.jpg",
							x = 86,
							type = "pic"
						}
					}
				},
				{
					y = 117,
					name = "jilinggui",
					z = 1,
					type = "pic",
					visible = false,
					pic = "res/ui/equip/kaiguang/last/jjtz_samll_bg_c.png",
					x = 610,
					children = {
						{
							y = 86,
							pic = "frame:jlg.jpg",
							x = 86,
							type = "pic"
						}
					}
				},
				{
					y = 117,
					name = "jizhulong",
					z = 1,
					type = "pic",
					visible = false,
					pic = "res/ui/equip/kaiguang/last/jjtz_samll_bg_c.png",
					x = 763,
					children = {
						{
							y = 86,
							pic = "frame:jzl.jpg",
							x = 86,
							type = "pic"
						}
					}
				},
				{
					y = 117,
					name = "jifenghuang2",
					z = 0,
					type = "pic",
					pic = "res/ui/equip/kaiguang/last/jjtz_samll_bg.png",
					x = 151,
					children = {
						{
							y = 86,
							pic = "frame:jfh.jpg",
							x = 86,
							type = "pic"
						}
					}
				},
				{
					y = 117,
					name = "jiquhu2",
					z = 0,
					type = "pic",
					pic = "res/ui/equip/kaiguang/last/jjtz_samll_bg.png",
					x = 304,
					children = {
						{
							y = 86,
							pic = "frame:jqh.jpg",
							x = 86,
							type = "pic"
						}
					}
				},
				{
					y = 117,
					name = "jibaxia2",
					z = 0,
					type = "pic",
					pic = "res/ui/equip/kaiguang/last/jjtz_samll_bg.png",
					x = 457,
					children = {
						{
							y = 86,
							pic = "frame:jbx.jpg",
							x = 86,
							type = "pic"
						}
					}
				},
				{
					y = 117,
					name = "jilinggui2",
					z = 0,
					type = "pic",
					pic = "res/ui/equip/kaiguang/last/jjtz_samll_bg.png",
					x = 610,
					children = {
						{
							y = 86,
							pic = "frame:jlg.jpg",
							x = 86,
							type = "pic"
						}
					}
				},
				{
					y = 117,
					name = "jizhulong2",
					z = 0,
					type = "pic",
					pic = "res/ui/equip/kaiguang/last/jjtz_samll_bg.png",
					x = 763,
					children = {
						{
							y = 86,
							pic = "frame:jzl.jpg",
							x = 86,
							type = "pic"
						}
					}
				},
				{
					pic = "res/ui/equip/kaiguang/last/jjtz_long_bg.png",
					y = 314,
					type = "pic",
					x = 457,
					children = {
						{
							y = 56,
							name = "jiEquipDiscribe",
							anchorPointX = 0,
							type = "pic",
							pic = "res/ui/equip/kaiguang/last/jjtz_word_01.png",
							anchorPointY = 0.5,
							x = 334,
							scale = (function()
								if conf.language == "vie" then
									return 0.5
								else
									return 1
								end
							end)()
						},
						{
							y = 127,
							name = "jiEquipName",
							anchorPointX = 0,
							type = "pic",
							pic = "res/ui/equip/kaiguang/last/jjtz_word_jfh.png",
							anchorPointY = 0.5,
							x = 334
						}
					}
				},
				{
					pic = "res/ui/equip/kaiguang/last/jjtz_bg.png",
					y = 324,
					type = "pic",
					x = 230,
					children = {
						{
							y = 98,
							name = "centerImage",
							pic = "frame:jfh.jpg",
							type = "pic",
							x = 98
						}
					}
				}
			}
		}
	}
end

function getKaiguangUIData()
	return {
		kaiguangBackground = {
			y = 30,
			name = "kaiguangBackground",
			x = 20,
			type = "pic",
			anchorPointX = 0,
			anchorPointY = 0,
			pic = "res/ui/equip/kaiguang/kg_view_bg.jpg",
			children = {
				{
					y = 478,
					x = 425,
					type = "button",
					buttons = {
						{
							pic2 = "frame:btnTip_c.png",
							pic1 = "frame:btnTip_a.png",
							scale = 0.7,
							enable = true,
							callBack = function()
								equipmentKaiguangUI.showTips()
							end
						}
					}
				},
				{
					name = "jiujitaozhuangDi",
					pic = "res/ui/equip/kaiguang/kg_zzsh1.png",
					type = "pic",
					x = equipmentKaiguangConstant.suitPos[0].x,
					y = equipmentKaiguangConstant.suitPos[0].y
				},
				{
					pic = "res/ui/equip/kaiguang/kg_icon_bg.png",
					type = "pic",
					x = equipmentKaiguangConstant.suitPos[1].x,
					y = equipmentKaiguangConstant.suitPos[1].y,
					children = {
						{
							y = 57,
							name = "taozhuang1",
							pic = "frame:jbx.jpg",
							type = "pic",
							visible = false,
							x = 57
						}
					}
				},
				{
					pic = "res/ui/equip/kaiguang/kg_icon_bg.png",
					type = "pic",
					x = equipmentKaiguangConstant.suitPos[2].x,
					y = equipmentKaiguangConstant.suitPos[2].y,
					children = {
						{
							y = 57,
							name = "taozhuang2",
							pic = "frame:jqh.jpg",
							type = "pic",
							visible = false,
							x = 57
						}
					}
				},
				{
					pic = "res/ui/equip/kaiguang/kg_icon_bg.png",
					type = "pic",
					x = equipmentKaiguangConstant.suitPos[3].x,
					y = equipmentKaiguangConstant.suitPos[3].y,
					children = {
						{
							y = 57,
							name = "taozhuang3",
							pic = "frame:jzl.jpg",
							type = "pic",
							visible = false,
							x = 57
						}
					}
				},
				{
					pic = "res/ui/equip/kaiguang/kg_icon_bg.png",
					type = "pic",
					x = equipmentKaiguangConstant.suitPos[4].x,
					y = equipmentKaiguangConstant.suitPos[4].y,
					children = {
						{
							y = 57,
							name = "taozhuang4",
							pic = "frame:jfh.jpg",
							type = "pic",
							visible = false,
							x = 57
						}
					}
				},
				{
					pic = "res/ui/equip/kaiguang/kg_icon_bg.png",
					type = "pic",
					x = equipmentKaiguangConstant.suitPos[5].x,
					y = equipmentKaiguangConstant.suitPos[5].y,
					children = {
						{
							y = 57,
							name = "taozhuang5",
							pic = "frame:jlg.jpg",
							type = "pic",
							visible = false,
							x = 57
						}
					}
				},
				{
					y = 70,
					x = 227,
					type = "button",
					buttons = {
						{
							pic2 = "res/ui/equip/kaiguang/kg_btn_zzsh_c.png",
							name = "zuizhongshenghua",
							pic1 = "res/ui/equip/kaiguang/kg_btn_zzsh.png",
							enable = false,
							callBack = function()
								log.info(" zuizhongshenghua pressed ")

								local function var_5_0()
									equipmentKaiguangControl.taozhuangSublimate()
								end

								messageBox.confirm(language.get(103045), var_5_0, language.get(10001))
							end
						}
					}
				},
				{
					fontSize = 18,
					height = 0,
					x = 227,
					type = "label",
					font = "Thonburi",
					y = 30,
					width = 400,
					text = language.get(103041),
					color = ccc3(204, 185, 134)
				},
				{
					y = 70,
					x = 677,
					type = "button",
					buttons = {
						{
							pic2 = "res/ui/equip/kaiguang/kg_btn_kg_c.png",
							name = "kaiguang",
							pic1 = "res/ui/equip/kaiguang/kg_btn_kg.png",
							enable = false,
							callBack = function()
								log.info(" kaiguang pressed ")

								local function var_7_0()
									equipmentKaiguangControl.openLightTaozhuang()
								end

								messageBox.confirm(language.get(103044), var_7_0, language.get(10001))
							end
						}
					}
				},
				{
					y = 35,
					x = 790,
					type = "button",
					buttons = {
						{
							pic2 = "res/ui/equip/kaiguang/kg_btn_add_c.png",
							name = "addXilianPoint",
							pic1 = "res/ui/equip/kaiguang/kg_btn_add.png",
							scale = 0.7,
							enable = false,
							callBack = function()
								log.info(" addXilianPoint pressed ")

								local function var_9_0()
									equipmentKaiguangControl.bugXilianPoint()
								end

								messageBox.confirm(language.get(103046, equipmentKaiguangUI.countGold()), var_9_0, language.get(10001))
							end
						}
					}
				},
				{
					fontSize = 18,
					name = "xilianPoint",
					type = "label",
					y = 30,
					x = 677,
					font = "Thonburi",
					text = language.get(103042, 0, 0),
					color = ccc3(204, 185, 134)
				},
				{
					z = 1000,
					name = "xilianbutton",
					type = "pic",
					top = -90,
					pic = "res/ui/kfsy/150150.png",
					right = 0,
					children = {
						{
							xcenter = 0,
							font = "Thonburi-bold",
							type = "label",
							ycenter = 0,
							fontSize = 26,
							text = language.get(103043),
							color = ccc3(0, 255, 0)
						}
					}
				},
				{
					y = 478,
					name = "taozhuangNameLeft",
					visible = false,
					type = "pic",
					pic = "res/ui/equip/kaiguang/kg_word_zbx.png",
					x = 569
				},
				{
					y = 478,
					name = "taozhuangNameRight",
					visible = false,
					type = "pic",
					pic = "res/ui/equip/kaiguang/kg_word_jbx.png",
					x = 801
				},
				{
					y = 368,
					name = "taozhuangLeft",
					visible = false,
					type = "pic",
					pic = "res/ui/equip/kaiguang/kg_icon_bg.png",
					x = 569,
					children = {
						{
							y = 57,
							name = "taozhuangPicLeft",
							pic = "frame:zbxtz.jpg",
							type = "pic",
							x = 57
						}
					}
				},
				{
					y = 368,
					name = "bigArrow",
					scale = 1.2,
					type = "pic",
					visible = false,
					pic = "res/ui/equip/kaiguang/kg_ah_big.png",
					x = 670
				},
				{
					y = 368,
					name = "taozhuangRight",
					scale = 1.2,
					type = "pic",
					visible = false,
					pic = "res/ui/equip/kaiguang/kg_j_icon_bg.png",
					x = 801,
					children = {
						{
							y = 57,
							name = "taozhuangPicRight",
							pic = "frame:jbx.jpg",
							type = "pic",
							x = 57
						}
					}
				},
				{
					y = 200,
					name = "skillName1",
					visible = false,
					type = "pic",
					pic = "frame:equipmentQuenchingView_background_skill.png",
					x = 534,
					children = {
						{
							text = "lv.0",
							name = "skillNamelabel1",
							y = -15,
							type = "label",
							fontSize = 16,
							x = 32
						},
						{
							y = 32,
							name = "skillPic1",
							pic = "frame:qiangfang.jpg",
							type = "pic",
							x = 32
						}
					}
				},
				{
					y = 200,
					name = "skillName2",
					visible = false,
					type = "pic",
					pic = "frame:equipmentQuenchingView_background_skill.png",
					x = 604,
					children = {
						{
							text = "lv.0",
							name = "skillNamelabel2",
							y = -15,
							type = "label",
							fontSize = 16,
							x = 32
						},
						{
							y = 32,
							name = "skillPic2",
							pic = "frame:zhangkong.jpg",
							type = "pic",
							x = 32
						}
					}
				},
				{
					y = 200,
					name = "smallArrow",
					scale = 1.2,
					type = "pic",
					visible = false,
					pic = "res/ui/equip/kaiguang/kg_ah.png",
					x = 680
				},
				{
					y = 200,
					name = "skillName3",
					visible = false,
					type = "pic",
					pic = "frame:equipmentQuenchingView_background_skill.png",
					x = 766,
					children = {
						{
							text = "lv.0",
							name = "skillNamelabel3",
							y = -15,
							type = "label",
							fontSize = 18,
							x = 32
						},
						{
							y = 32,
							name = "skillPic3",
							pic = "frame:qiangfang.jpg",
							type = "pic",
							x = 32
						}
					}
				},
				{
					y = 200,
					name = "skillName4",
					visible = false,
					type = "pic",
					pic = "frame:equipmentQuenchingView_background_skill.png",
					x = 836,
					children = {
						{
							text = "lv.0",
							name = "skillNamelabel4",
							y = -15,
							type = "label",
							fontSize = 18,
							x = 32
						},
						{
							y = 32,
							name = "skillPic4",
							pic = "frame:zhangkong.jpg",
							type = "pic",
							x = 32
						}
					}
				},
				{
					name = "guangquan",
					pic = "res/ui/equip/kaiguang/kg_icon_bg_c.png",
					type = "pic",
					z = 100,
					x = equipmentKaiguangConstant.suitPos[0].x,
					y = equipmentKaiguangConstant.suitPos[0].y
				},
				{
					y = 478,
					name = "taozhuangNameCenter",
					visible = false,
					type = "pic",
					pic = "res/ui/equip/kaiguang/kg_word_jbx.png",
					x = 685
				},
				{
					y = 358,
					name = "kaiguangdi",
					scale = 1.2,
					type = "pic",
					visible = false,
					pic = "res/ui/equip/kaiguang/kg_z_icon_bg.png",
					x = 685,
					children = {
						{
							y = 96,
							name = "kaiguangAfter",
							pic = "frame:jbx.jpg",
							type = "pic",
							x = 96
						}
					}
				},
				{
					y = 200,
					name = "skillName5",
					visible = false,
					type = "pic",
					pic = "frame:equipmentQuenchingView_background_skill.png",
					x = 650,
					children = {
						{
							text = "lv.0",
							name = "skillNamelabel5",
							y = -15,
							type = "label",
							fontSize = 16,
							x = 32
						},
						{
							y = 32,
							name = "skillPic5",
							pic = "frame:qiangfang.jpg",
							type = "pic",
							x = 32
						}
					}
				},
				{
					y = 200,
					name = "skillName6",
					visible = false,
					type = "pic",
					pic = "frame:equipmentQuenchingView_background_skill.png",
					x = 720,
					children = {
						{
							text = "lv.0",
							name = "skillNamelabel6",
							y = -15,
							type = "label",
							fontSize = 16,
							x = 32
						},
						{
							y = 32,
							name = "skillPic6",
							pic = "frame:zhangkong.jpg",
							type = "pic",
							x = 32
						}
					}
				}
			}
		}
	}
end
