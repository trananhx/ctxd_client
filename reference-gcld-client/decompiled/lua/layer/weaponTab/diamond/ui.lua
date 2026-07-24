local var_0_0 = {
	name = "bg",
	h = 520,
	type = "button",
	w = 900,
	y = 259.5,
	x = 450.5,
	normal = {
		path = "res/default.png"
	},
	touched = {
		path = "res/default.png"
	},
	children = {
		{
			y = 260,
			type = "sprite9",
			x = 450,
			preferedSize = CCSizeMake(900, 300),
			middleRect = CCRectMake(454, 98, 1, 2),
			pic = {
				path = "res/ui/activity/godPaper/czzyb_longbg2.png"
			},
			children = {
				{
					y = 164,
					name = "flag1",
					type = "sprite",
					x = 200,
					pic = {
						path = "res/ui/weapon/diamond/jnssj_flag_01.png"
					},
					children = {
						{
							y = 120,
							name = "icon1",
							type = "sprite",
							x = 85,
							pic = {
								path = "res/ui/weapon/diamond/jnssj_shandi.png"
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn1",
							h = 62,
							type = "button",
							w = 195,
							y = 20,
							x = 85,
							normal = {
								path = "res/ui/common/button/public_btn_green.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_green_c.png"
							},
							children = {
								{
									fontSize = 25,
									name = "txt1",
									y = 34,
									type = "label",
									x = 97
								}
							}
						}
					}
				},
				{
					y = 164,
					name = "flag2",
					type = "sprite",
					x = 450,
					pic = {
						path = "res/ui/weapon/diamond/jnssj_flag_02.png"
					},
					children = {
						{
							y = 120,
							name = "icon2",
							type = "sprite",
							x = 85,
							pic = {
								path = "res/ui/weapon/diamond/jnssj_shuiyu.png"
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn2",
							h = 62,
							type = "button",
							w = 195,
							y = 20,
							x = 85,
							normal = {
								path = "res/ui/common/button/public_btn_green.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_green_c.png"
							},
							children = {
								{
									fontSize = 25,
									name = "txt2",
									y = 34,
									type = "label",
									x = 97
								}
							}
						}
					}
				},
				{
					y = 164,
					name = "flag3",
					type = "sprite",
					x = 700,
					pic = {
						path = "res/ui/weapon/diamond/jnssj_flag_03.png"
					},
					children = {
						{
							y = 120,
							name = "icon3",
							type = "sprite",
							x = 85,
							pic = {
								path = "res/ui/weapon/diamond/jnssj_pingyuan.png"
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn3",
							h = 62,
							type = "button",
							w = 195,
							y = 20,
							x = 85,
							normal = {
								path = "res/ui/common/button/public_btn_green.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_green_c.png"
							},
							children = {
								{
									fontSize = 25,
									name = "txt3",
									y = 34,
									type = "label",
									x = 97
								}
							}
						}
					}
				},
				{
					y = 254,
					type = "sprite",
					x = 450,
					pic = {
						path = "res/ui/weapon/diamond/jnssj_word_qxzygfxqh_bg.png"
					},
					children = {
						{
							y = 38,
							x = 319,
							type = "sprite",
							pic = {
								path = "res/ui/weapon/diamond/jnssj_word_qxzygfxqh.png"
							}
						}
					}
				}
			}
		}
	}
}

diamond = {}

tool.requireRes("weaponTab/diamond")

diamond.ui = {}
diamond.ui.table = {}
diamond.ui.selectIndex = 0
diamond.ui.beginX = 0
diamond.ui.beginY = 0
diamond.ui.isInEffect = false
diamond.ui.action = 0
diamond.ui.scrollViewOffset = nil
diamond.ui.isJinshiMax = false

function diamond.ui.onTouch(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0 == CCTOUCHBEGAN then
		diamond.ui.beginX = arg_1_1
		diamond.ui.beginY = arg_1_2
	elseif arg_1_0 == CCTOUCHENDED then
		if diamond.ui.table.scrollView == nil then
			return true
		end

		local var_1_0, var_1_1 = diamond.ui.table.scrollView:getPosition()
		local var_1_2, var_1_3 = diamond.ui.table.bg:getPosition()
		local var_1_4 = arg_1_1 - var_1_2 + 450.5
		local var_1_5 = arg_1_2 - var_1_3 + 259.5

		if var_1_4 > 0 and var_1_4 < 194 and var_1_5 > 60 and var_1_5 < 465 then
			if math.abs(arg_1_1 - diamond.ui.beginX) < 40 and math.abs(arg_1_2 - diamond.ui.beginY) < 40 then
				local var_1_6 = diamond.ui.table.scrollView:getContentOffset()
				local var_1_7 = math.floor((diamond.totalCount + 1) / 2) - math.floor((var_1_5 - 60 - var_1_6.y) / 90) - 1
				local var_1_8 = math.floor((var_1_4 - var_1_6.x) / 97) + var_1_7 * 2 + 1

				if var_1_8 >= 0 and var_1_8 <= diamond.totalCount then
					if diamond.isjinjie == false then
						diamond.ui.selectIndex = var_1_8

						local var_1_9, var_1_10 = diamond.ui.table["spriteBg_" .. diamond.ui.selectIndex]:getPosition()

						diamond.ui.table.select_icon:setPosition(ccp(var_1_9, var_1_10))
						diamond.ui.table.select_icon:setVisible(true)
						diamond.ui.update_selectedDiamond()
					else
						if diamond.backupData.gem[diamond.backupIndex].gemLv == 0 then
							diamond.ui.table.btn_jinjie2:setVisible(false)

							return
						end

						if diamond.ui.isJinshiMax == true then
							smgr.showTipText(language.get(122063))

							return
						end

						if diamond.ui.table.select_layer == nil then
							local var_1_11 = createBaseLayer()

							diamond.ui.table.bg:addChild(var_1_11, 10000)

							diamond.ui.table.select_layer = var_1_11
						end

						local var_1_12 = diamond.data.gem[var_1_8]

						table.insert(diamond.jinjieSelectIds, var_1_12.vId)

						local var_1_13 = #diamond.jinjieSelectIds
						local var_1_14 = math.mod(var_1_13, 5)

						if var_1_14 == 0 then
							var_1_14 = 5
						end

						local var_1_15 = false

						if var_1_13 ~= 1 and var_1_14 == 1 then
							var_1_15 = true

							diamond.ui.run_action_eat(var_1_13 - 6)
						end

						local var_1_16 = diamond.ui.create_single_dimond(var_1_12, true)
						local var_1_17, var_1_18 = diamond.ui.table["spriteBg_" .. var_1_8]:getPosition()

						var_1_16:setPosition(ccp(var_1_17 + var_1_6.x, var_1_18 + var_1_6.y + 60))
						diamond.ui.table.select_layer:addChild(var_1_16, 1, var_1_13)
						diamond.ui.run_action_move(var_1_16, var_1_14, var_1_15)

						diamond.data.gem[var_1_8].num = diamond.data.gem[var_1_8].num - 1

						if diamond.data.gem[var_1_8].num == 0 then
							table.remove(diamond.data.gem, var_1_8)

							diamond.totalCount = #diamond.data.gem
						end

						diamond.ui.createDiamondList()

						if diamond.ui.table.scrollView ~= nil then
							diamond.ui.table.scrollView:setContentOffset(ccp(var_1_6.x, var_1_6.y))
						end

						diamond.jinjieTotalExp = diamond.jinjieTotalExp + math.pow(2, var_1_12.gemLv - 1)

						local var_1_19 = diamond.backupData.gem[diamond.backupIndex].gemLv
						local var_1_20 = diamond.backupData.gem[diamond.backupIndex].curPs
						local var_1_21 = diamond.backupData.gem[diamond.backupIndex].goodsType
						local var_1_22, var_1_23 = diamond.ui.calculate_jinjie_exp(var_1_19, var_1_20, diamond.jinjieTotalExp, var_1_21)

						if var_1_21 == diamond.constant.JINGSHI then
							if var_1_22 >= diamond.data.jsMaxLv then
								diamond.ui.isJinshiMax = true
							end
						elseif var_1_21 == diamond.constant.JINENGSHI then
							if var_1_22 >= diamond.data.brilliantMaxLv then
								diamond.ui.isJinshiMax = true
							end
						elseif var_1_21 == diamond.constant.SHENSHI and var_1_22 >= diamond.data.godMaxLv then
							diamond.ui.isJinshiMax = true
						end

						local var_1_24 = math.floor(var_1_23 * 100 / diamond.data.jsLvNums[var_1_22].num)

						if var_1_21 == diamond.constant.JINENGSHI then
							var_1_24 = math.floor(var_1_23 * 100 / diamond.data.brilliantNums[var_1_22].num)
						end

						if var_1_21 == diamond.constant.SHENSHI then
							var_1_24 = math.floor(var_1_23 * 100 / diamond.data.godNums[var_1_22].num)
						end

						if diamond.ui.isJinshiMax then
							var_1_24 = 0
						end

						diamond.ui.table.jinjie_2:setPercentage(var_1_24)
						diamond.ui.table.lv:setString(language.get(122060, var_1_22))
						diamond.ui.table.percent:setString(tostring(var_1_24) .. "%")
						diamond.ui.table.anim_jindu:setPosition(ccp(436.5 + 227 * var_1_24 / 100 - 85.5 + 36, 100))
						diamond.ui.table.anim_jindu:setVisible(true)
					end
				end
			end
		elseif var_1_4 > 520 and var_1_4 < 600 and var_1_5 > 302 and var_1_5 < 382 then
			local var_1_25 = diamond.data.gem[diamond.ui.selectIndex]

			if diamond.isjinjie == true then
				var_1_25 = diamond.backupData.gem[diamond.backupIndex]
			end

			if diamond.ui.table.icon_shenshi_bg_1:isVisible() then
				diamond.ui.showTips_tucheng("tucheng")
			else
				diamond.ui.showTips_gem(var_1_25)
			end
		elseif var_1_4 > 500 and var_1_4 < 620 and var_1_5 > 222 and var_1_5 < 302 then
			local var_1_26 = diamond.data.gem[diamond.ui.selectIndex]

			if diamond.isjinjie == true then
				var_1_26 = diamond.backupData.gem[diamond.backupIndex]
			end

			if var_1_26.goodsType == diamond.constant.JINENGSHI then
				diamond.ui.showTips_tucheng("sougua")
			end
		elseif diamond.ui.table.icon_shenshi_bg_1:isVisible() then
			for iter_1_0 = 1, 6 do
				if tool.checkIfTouch(diamond.ui.table["icon_shenshi_bg_" .. iter_1_0], arg_1_1, arg_1_2) then
					diamond.ui.showTips_gem(diamond.data.godBrilliants[iter_1_0])
				end
			end
		else
			local var_1_27 = diamond.data.gem[diamond.ui.selectIndex]

			if var_1_27.skills ~= nil then
				local var_1_28 = {
					410,
					710,
					410,
					710
				}
				local var_1_29 = {
					424,
					424,
					260,
					260
				}

				for iter_1_1 = 1, 4 do
					if var_1_4 > var_1_28[iter_1_1] - 30 and var_1_4 < var_1_28[iter_1_1] + 30 and var_1_5 > var_1_29[iter_1_1] - 30 and var_1_5 < var_1_29[iter_1_1] + 30 then
						if var_1_27.goodsType == diamond.constant.JINGSHI and var_1_27.skills[iter_1_1] ~= nil then
							diamond.ui.showTips_skill(var_1_27.skills, iter_1_1)
						end

						if var_1_27.goodsType == diamond.constant.JINENGSHI and (iter_1_1 == 3 or iter_1_1 == 4) then
							diamond.ui.showTips_skill(var_1_27.skills, iter_1_1 - 2, var_1_27.goodsType)
						end
					end
				end
			end
		end
	end

	return true
end

function diamond.ui.run_action_eat(arg_2_0)
	local function var_2_0(arg_3_0)
		diamond.ui.table.select_layer:removeChild(arg_3_0, true)
	end

	for iter_2_0 = 1, 5 do
		local var_2_1 = diamond.ui.table.select_layer:getChildByTag(arg_2_0 + iter_2_0)
		local var_2_2 = CCArray:create()
		local var_2_3 = CCDelayTime:create(0.1 * iter_2_0)
		local var_2_4 = CCMoveTo:create(0.5, ccp(560, 342))
		local var_2_5 = CCScaleTo:create(0.5, 0.1)
		local var_2_6 = CCSpawn:createWithTwoActions(var_2_4, var_2_5)
		local var_2_7 = CCCallFuncN:create(var_2_0)

		var_2_2:addObject(var_2_3)
		var_2_2:addObject(var_2_6)
		var_2_2:addObject(var_2_7)

		local var_2_8 = CCSequence:create(var_2_2)

		var_2_1:runAction(var_2_8)
	end
end

function diamond.ui.run_action_move(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = {
		0,
		-1,
		1,
		-2,
		2
	}
	local var_4_1 = 560
	local var_4_2 = 212
	local var_4_3 = var_4_1 + var_4_0[arg_4_1] * 80
	local var_4_4 = CCMoveTo:create(0.8, ccp(var_4_3, var_4_2))

	if arg_4_2 == false then
		arg_4_0:runAction(var_4_4)
	else
		local var_4_5 = CCArray:create()
		local var_4_6 = CCDelayTime:create(1)

		var_4_5:addObject(var_4_6)
		var_4_5:addObject(var_4_4)

		local var_4_7 = CCSequence:create(var_4_5)

		arg_4_0:runAction(var_4_7)
	end
end

function diamond.ui.run_action_play_anim_jinshi()
	if diamond.ui.table.anim_jinshi == nil then
		diamond.ui.table.anim_jinshi = CCSprite:create("res/default.png")

		diamond.ui.table.anim_jinshi:setPosition(ccp(560, 342))
		diamond.ui.table.bg:addChild(diamond.ui.table.anim_jinshi, 10000)
	end

	local var_5_0 = CCArray:create()

	for iter_5_0 = 1, 12 do
		local var_5_1 = CCSprite:create("res/ui/weapon/diamond/anim/" .. string.format("bsjl_%d.png", iter_5_0))

		var_5_0:addObject(var_5_1:displayFrame())
	end

	local var_5_2 = CCAnimation:createWithSpriteFrames(var_5_0, 0.05)
	local var_5_3 = CCAnimate:create(var_5_2)
	local var_5_4 = CCShow:create()
	local var_5_5 = CCHide:create()
	local var_5_6 = CCArray:create()

	var_5_6:addObject(var_5_4)
	var_5_6:addObject(var_5_3)
	var_5_6:addObject(var_5_5)

	local var_5_7 = CCSequence:create(var_5_6)

	diamond.ui.table.anim_jinshi:runAction(var_5_7)

	local var_5_8 = diamond.backupData.gem[diamond.backupIndex]
	local var_5_9 = "bsjl_tit_jsjj.png"

	if var_5_8.goodsType == diamond.constant.SHENSHI then
		var_5_9 = "jnssj_word_ssjj.png"
	end

	local var_5_10, var_5_11 = tool.getPositionInScreen(diamond.ui.table.center)
	local var_5_12 = CCSprite:create("res/ui/weapon/diamond/" .. var_5_9)

	var_5_12:setPosition(var_5_10, var_5_11)
	smgr.showTipSpriteText(var_5_12)
end

function diamond.ui.run_action_play_anim_jindu()
	if diamond.ui.table.anim_jindu == nil then
		diamond.ui.table.anim_jindu = CCSprite:create("res/default.png")

		diamond.ui.table.bg:addChild(diamond.ui.table.anim_jindu, 10000)
	end

	local var_6_0 = CCArray:create()

	for iter_6_0 = 1, 6 do
		local var_6_1 = CCSprite:create("res/ui/weapon/diamond/anim/" .. string.format("jdt_%d.png", iter_6_0))

		var_6_0:addObject(var_6_1:displayFrame())
	end

	local var_6_2 = CCAnimation:createWithSpriteFrames(var_6_0, 0.1)
	local var_6_3 = CCAnimate:create(var_6_2)
	local var_6_4 = CCArray:create()

	var_6_4:addObject(var_6_3)

	local var_6_5 = CCSequence:create(var_6_4)
	local var_6_6 = CCRepeatForever:create(tolua.cast(var_6_5, "CCActionInterval"))

	diamond.ui.table.anim_jindu:runAction(var_6_6)
	diamond.ui.table.anim_jindu:setVisible(false)
end

function diamond.ui.calculate_jinjie_exp(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = diamond.data.jsLvNums

	if arg_7_3 == diamond.constant.JINENGSHI then
		var_7_0 = diamond.data.brilliantNums
	elseif arg_7_3 == diamond.constant.SHENSHI then
		var_7_0 = diamond.data.godNums
	end

	local var_7_1 = #var_7_0
	local var_7_2 = arg_7_0
	local var_7_3 = arg_7_1

	while arg_7_2 > 0 do
		local var_7_4 = var_7_0[var_7_2].num - var_7_3

		if var_7_4 <= arg_7_2 then
			var_7_2 = var_7_2 + 1
			var_7_3 = 0

			if var_7_1 <= var_7_2 then
				break
			end

			arg_7_2 = arg_7_2 - var_7_4
		else
			var_7_3 = var_7_3 + arg_7_2
			arg_7_2 = 0
		end
	end

	return var_7_2, var_7_3
end

function diamond.ui.get_tips_title_color(arg_8_0, arg_8_1)
	local var_8_0 = ccc3(209, 111, 242)

	if arg_8_1 == 1 or arg_8_1 == 3 then
		if arg_8_0 <= 4 then
			var_8_0 = ccc3(200, 200, 200)
		elseif arg_8_0 <= 8 then
			var_8_0 = ccc3(0, 0, 255)
		elseif arg_8_0 <= 12 then
			var_8_0 = ccc3(0, 255, 255)
		elseif arg_8_0 <= 16 then
			var_8_0 = ccc3(0, 255, 0)
		elseif arg_8_0 <= 20 then
			var_8_0 = ccc3(255, 255, 0)
		elseif arg_8_0 <= 24 then
			var_8_0 = ccc3(255, 125, 0)
		elseif arg_8_0 <= 28 then
			var_8_0 = ccc3(255, 0, 0)
		else
			var_8_0 = ccc3(255, 0, 255)
		end
	elseif arg_8_1 == 2 then
		if arg_8_0 <= 4 then
			var_8_0 = ccc3(100, 141, 224)
		elseif arg_8_0 <= 8 then
			var_8_0 = ccc3(150, 222, 60)
		elseif arg_8_0 <= 12 then
			var_8_0 = ccc3(245, 175, 41)
		end
	end

	return var_8_0
end

function diamond.ui.showTips_skill(arg_9_0, arg_9_1, arg_9_2)
	if arg_9_0[arg_9_1].name == nil then
		return
	end

	local var_9_0 = {}

	if conf.language == "vie" then
		var_9_0.bgH = 100
	elseif conf.language == "tha" then
		var_9_0.bgH = 80
	else
		var_9_0.bgH = 0
	end

	local var_9_1 = 300
	local var_9_2 = 90 + var_9_0.bgH
	local var_9_3 = 30
	local var_9_4 = CCScale9Sprite:create("res/ui/weapon/tips_di.png", CCRectMake(0, 0, 80, 80), CCRectMake(20, 20, 40, 40))

	var_9_4:setContentSize(CCSizeMake(var_9_1, var_9_2))
	var_9_4:setAnchorPoint(ccp(0.5, 0.5))

	if arg_9_2 == diamond.constant.JINENGSHI and arg_9_1 == 2 then
		var_9_4:setContentSize(CCSizeMake(var_9_1, var_9_2 + 30 + 40))

		var_9_3 = var_9_3 - 30 - 35
	end

	local var_9_5 = arg_9_0[arg_9_1].name .. " Lv." .. arg_9_0[arg_9_1].lv

	if tonumber(arg_9_0[arg_9_1].lv) == 5 then
		var_9_5 = var_9_5 .. " " .. language.get(122064)
	end

	local var_9_6 = CCLabelTTF:create(var_9_5, "", 22)

	var_9_6:setPosition(ccp(var_9_1 / 2, var_9_2 - var_9_3))
	var_9_6:setHorizontalAlignment(kCCTextAlignmentLeft)
	var_9_6:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	var_9_6:setDimensions(CCSizeMake(var_9_1 - 50, 0))
	var_9_6:setColor(ccc3(255, 255, 194))
	var_9_4:addChild(var_9_6, 1)

	local var_9_7 = var_9_3 + 30 + var_9_6:getContentSize().height
	local var_9_8 = CCLabelTTF:create(arg_9_0[arg_9_1].intro, "", 20)

	var_9_8:setPosition(ccp(var_9_1 / 2, var_9_2 - var_9_7))
	var_9_8:setHorizontalAlignment(kCCTextAlignmentLeft)
	var_9_8:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	var_9_8:setDimensions(CCSizeMake(var_9_1 - 50, 0))
	var_9_8:setColor(ccc3(183, 168, 137))
	var_9_4:addChild(var_9_8, 1)

	local var_9_9 = var_9_7 + 30 + var_9_8:getContentSize().height

	if arg_9_2 == diamond.constant.JINENGSHI and arg_9_1 == 2 then
		local var_9_10 = CCLabelTTF:create(language.get(122076), "", 20)

		var_9_10:setPosition(ccp(var_9_1 / 2, var_9_2 - var_9_9 - 20))
		var_9_10:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_9_10:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_9_10:setDimensions(CCSizeMake(var_9_1 - 50, 0))
		var_9_10:setColor(ccc3(183, 168, 137))
		var_9_4:addChild(var_9_10, 1)

		local var_9_11 = var_9_9 + 30 + 30
	end

	local var_9_12 = createBaseLayer()
	local var_9_13 = {
		410,
		710,
		410,
		710
	}
	local var_9_14 = {
		424,
		424,
		260,
		260
	}
	local var_9_15 = visibleSize.width / 2 - 450.5 + var_9_13[arg_9_1]
	local var_9_16 = visibleSize.height / 2 - 259.5 + var_9_14[arg_9_1]

	if arg_9_2 and arg_9_2 == diamond.constant.JINENGSHI then
		var_9_16 = visibleSize.height / 2 - 259.5 + var_9_14[arg_9_1 + 2]
	end

	local function var_9_17(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == CCTOUCHBEGAN then
			-- block empty
		elseif arg_10_0 == CCTOUCHENDED then
			local var_10_0 = arg_10_1 - var_9_15
			local var_10_1 = arg_10_2 - var_9_16

			if var_10_0 > -var_9_1 / 2 and var_10_0 < var_9_1 / 2 and var_10_1 > -var_9_2 / 2 and var_10_1 < var_9_2 / 2 then
				-- block empty
			else
				smgr.getLayer("topLayer"):removeChild(var_9_12, true)
			end
		end

		return true
	end

	var_9_4:setPosition(ccp(var_9_15, var_9_16))
	var_9_12:addChild(var_9_4, 100)
	var_9_12:registerScriptTouchHandler(var_9_17, false, true)
	var_9_12:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_9_12, 10002)
	var_9_12:setVisible(true)
end

function diamond.ui.showTips_gem(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = {
		tipsBg = {
			xcenter = 0,
			name = "tipsBg",
			type = "pic_9_tips",
			anchorPointX = 0.5,
			ycenter = 0,
			frameGap = 20,
			pic = "res/ui/weapon/tips_di.png",
			lineGap = 5,
			anchorPointY = 0.5,
			middleRect = CCRectMake(20, 20, 40, 40),
			preferedSize = CCSizeMake(290, 300),
			content = {}
		}
	}
	local var_11_1 = var_11_0.tipsBg.content
	local var_11_2 = ""

	if arg_11_0.goodsType then
		var_11_2 = arg_11_0.gemName
	end

	if tonumber(arg_11_0.goodsType) == diamond.constant.JINGSHI or tonumber(arg_11_0.goodsType) == diamond.constant.JINGSHI2 then
		var_11_2 = language.get(122062, arg_11_0.gemLv)
	elseif tonumber(arg_11_0.goodsType) == diamond.constant.BAOSHI then
		var_11_2 = language.get(122061, arg_11_0.gemLv)
	end

	table.insert(var_11_1, {
		fontSize = 26,
		stroke = false,
		type = "label",
		text = var_11_2,
		color = diamond.ui.get_tips_title_color(arg_11_0.gemLv, tonumber(arg_11_0.goodsType))
	})

	if arg_11_0.goodsType == diamond.constant.JINGSHI2 then
		table.insert(var_11_1, {
			fontSize = 20,
			stroke = false,
			type = "label",
			text = language.get(122089),
			color = ccc3(255, 255, 194)
		})
	else
		table.insert(var_11_1, {
			fontSize = 20,
			stroke = false,
			type = "label",
			text = language.get(122021),
			color = ccc3(255, 255, 194)
		})

		local var_11_3 = {
			arg_11_0.att,
			arg_11_0.def,
			arg_11_0.blood
		}
		local var_11_4 = {
			122001,
			122002,
			122003
		}
		local var_11_5 = {
			122022,
			122023,
			122024,
			122025,
			122026,
			122027
		}
		local var_11_6 = {
			122083,
			122084,
			122085
		}
		local var_11_7 = user.weaponRank == 2
		local var_11_8 = var_11_7 and 3 or 6
		local var_11_9 = require("res/native/offset").get("layer.weaponTab.diamond")
		local var_11_10

		if var_11_7 then
			var_11_10 = var_11_9.godWeaponTipOffsetX or {}
		else
			var_11_10 = var_11_9.weaponTipOffsetX or {}
		end

		for iter_11_0 = 1, var_11_8 do
			local var_11_11 = 1 + (iter_11_0 - 1) % 3

			table.insert(var_11_1, {
				fontSize = 20,
				stroke = false,
				type = "label",
				text = language.get(var_11_7 and var_11_6[iter_11_0] or var_11_5[iter_11_0]),
				color = ccc3(255, 255, 194),
				children = {
					{
						fontSize = 20,
						type = "label",
						stroke = false,
						anchorPointX = 0,
						y = 0,
						anchorPointY = 0,
						x = 100 + (var_11_10[iter_11_0] or 0),
						text = language.get(var_11_4[var_11_11], var_11_3[var_11_11]),
						color = ccc3(150, 222, 60)
					}
				}
			})
		end

		if arg_11_0.skills ~= nil then
			table.insert(var_11_1, {
				pic = "res/ui/weapon/line.png",
				type = "pic"
			})

			for iter_11_1, iter_11_2 in ipairs(arg_11_0.skills) do
				if tonumber(iter_11_2.lv) > 0 then
					local var_11_12 = iter_11_2.name .. " Lv." .. iter_11_2.lv

					if tonumber(iter_11_2.lv) == 5 then
						var_11_12 = var_11_12 .. " " .. language.get(122064)
					end

					table.insert(var_11_1, {
						fontSize = 22,
						stroke = false,
						type = "label",
						text = var_11_12,
						color = ccc3(255, 255, 194)
					})
					table.insert(var_11_1, {
						fontSize = 20,
						stroke = false,
						type = "label",
						text = iter_11_2.intro,
						color = ccc3(183, 168, 137)
					})
				end
			end
		end
	end

	local var_11_13 = createBaseLayer()
	local var_11_14 = autoUI.initUI(var_11_13, var_11_0)

	local function var_11_15(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == CCTOUCHBEGAN then
			-- block empty
		elseif arg_12_0 ~= CCTOUCHENDED or tool.checkIfTouch(var_11_14.tipsBg, arg_12_1, arg_12_2) then
			-- block empty
		else
			smgr.getLayer("topLayer"):removeChild(var_11_13, true)
		end

		return true
	end

	local var_11_16 = arg_11_1 or visibleSize.width / 2 + 300
	local var_11_17 = arg_11_2 or visibleSize.height / 2 - 10

	var_11_14.tipsBg:setPosition(ccp(var_11_16, var_11_17))
	var_11_13:registerScriptTouchHandler(var_11_15, false, true)
	var_11_13:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_11_13, 10002)
	var_11_13:setVisible(true)

	return var_11_13
end

function diamond.ui.showTips_tucheng(arg_13_0)
	local var_13_0 = 300
	local var_13_1 = 250
	local var_13_2 = CCScale9Sprite:create("res/ui/weapon/tips_di.png", CCRectMake(0, 0, 80, 80), CCRectMake(20, 20, 40, 40))

	var_13_2:setContentSize(CCSizeMake(var_13_0, var_13_1))
	var_13_2:setAnchorPoint(ccp(0.5, 0.5))

	local var_13_3

	if arg_13_0 == "sougua" then
		var_13_3 = CCLabelTTF:create(language.get(122081), "", 20)
	else
		local var_13_4 = language.get(81112)

		if user.spSlaughters ~= nil and #user.spSlaughters > 0 then
			var_13_4 = var_13_4 .. language.get(320451) .. language.get(diamond.constant.terrain[user.spSlaughters[1]].txtId)
		end

		var_13_3 = CCLabelTTF:create(language.get(122075, var_13_4), "", 20)
	end

	var_13_3:setPosition(ccp(var_13_0 / 2, var_13_1 / 2))
	var_13_3:setHorizontalAlignment(kCCTextAlignmentLeft)
	var_13_3:setVerticalAlignment(kCCVerticalTextAlignmentTop)
	var_13_3:setDimensions(CCSizeMake(var_13_0 - 50, var_13_1 - 50))
	var_13_2:addChild(var_13_3, 1)

	local var_13_5 = createBaseLayer()
	local var_13_6 = visibleSize.width / 2 - 450.5 + 750
	local var_13_7 = visibleSize.height / 2 - 259.5 + 270

	local function var_13_8(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == CCTOUCHBEGAN then
			-- block empty
		elseif arg_14_0 == CCTOUCHENDED then
			local var_14_0 = arg_14_1 - var_13_6
			local var_14_1 = arg_14_2 - var_13_7

			if var_14_0 > -var_13_0 / 2 and var_14_0 < var_13_0 / 2 and var_14_1 > -var_13_1 / 2 and var_14_1 < var_13_1 / 2 then
				-- block empty
			else
				smgr.getLayer("topLayer"):removeChild(var_13_5, true)
			end
		end

		return true
	end

	var_13_2:setPosition(ccp(var_13_6, var_13_7))
	var_13_5:addChild(var_13_2, 100)
	var_13_5:registerScriptTouchHandler(var_13_8, false, true)
	var_13_5:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_13_5, 10002)
	var_13_5:setVisible(true)
end

function diamond.ui.set_ccnode_visible()
	diamond.ui.table.btn_hecheng:setVisible(false)
	diamond.ui.table.btn_chaijie:setVisible(false)
	diamond.ui.table.btn_damo:setVisible(false)
	diamond.ui.table.btn_jinjie2:setVisible(false)
	diamond.ui.table.btn_jinhua:setVisible(false)
	diamond.ui.table.btn_ok:setVisible(false)
	diamond.ui.table.btn_cancel:setVisible(false)
	diamond.ui.table.title_hecheng:setVisible(false)
	diamond.ui.table.title_chaijie:setVisible(false)
	diamond.ui.table.title_damo:setVisible(false)
	diamond.ui.table.title_jinjie2:setVisible(false)
	diamond.ui.table.title_jinhua:setVisible(false)
	diamond.ui.table.title_ok:setVisible(false)
	diamond.ui.table.title_cancel:setVisible(false)
	diamond.ui.table.jinjieBg:setVisible(false)
	diamond.ui.table.jinjie:setVisible(false)
	diamond.ui.table.jinjie_2:setVisible(false)
	diamond.ui.table.jinjie_select:setVisible(false)
	diamond.ui.table.lv:setVisible(false)
	diamond.ui.table.percent:setVisible(false)
	diamond.ui.table.tit_di_jinengshi:setVisible(false)
	diamond.ui.table.icon_jinengshi:setVisible(false)
	diamond.ui.table.lv_jinengshi:setVisible(false)
	diamond.ui.table.jinegnshi_title:setVisible(false)
	diamond.ui.table.jinegnshi_title_word:setVisible(false)
	diamond.ui.table.sougua_tucheng:setVisible(false)
	diamond.ui.table.sougua_tucheng_word:setVisible(false)
	diamond.ui.table.remainSlaughterTimes:setVisible(false)
	diamond.ui.table.center_potentiometer:setVisible(false)
	diamond.ui.table.kejinhua_word:setVisible(false)

	for iter_15_0 = 1, 4 do
		diamond.ui.table["tit_di_" .. iter_15_0]:setVisible(false)
		diamond.ui.table["tit_" .. iter_15_0]:setVisible(false)
		diamond.ui.table["icon_bg_" .. iter_15_0]:setVisible(false)
		diamond.ui.table["icon_" .. iter_15_0]:setVisible(false)
		diamond.ui.table["btn_jinglian_" .. iter_15_0]:setVisible(false)
		diamond.ui.table["jinglian_di_" .. iter_15_0]:setVisible(false)
		diamond.ui.table["title_jinglian_" .. iter_15_0]:setVisible(false)
		diamond.ui.table["lv_" .. iter_15_0]:setVisible(false)
	end

	for iter_15_1 = 1, 6 do
		diamond.ui.table["icon_shenshi_bg_" .. iter_15_1]:setVisible(false)
		diamond.ui.table["icon_shenshi_" .. iter_15_1]:setVisible(false)
	end
end

function diamond.ui.update_ccnode(arg_16_0)
	diamond.ui.set_ccnode_visible()
	diamond.ui.table.btn_jinjie2:setPositionX(475)
	diamond.ui.table.title_jinjie2:setPositionX(475)
	diamond.ui.table.sougua_tucheng:setPositionX(595)
	diamond.ui.table.des:setVisible(true)

	if tonumber(arg_16_0.goodsType) == diamond.constant.JINGSHI then
		diamond.ui.table.btn_jinjie2:setVisible(true)
		diamond.ui.table.btn_jinhua:setVisible(true)
		diamond.ui.table.title_jinjie2:setVisible(true)
		diamond.ui.table.title_jinhua:setVisible(true)

		for iter_16_0 = 1, 4 do
			diamond.ui.table["tit_di_" .. iter_16_0]:setVisible(true)
			diamond.ui.table["tit_" .. iter_16_0]:setVisible(true)
			diamond.ui.table["icon_bg_" .. iter_16_0]:setVisible(true)
			diamond.ui.table["icon_" .. iter_16_0]:setVisible(true)
			diamond.ui.table["btn_jinglian_" .. iter_16_0]:setVisible(true)
			diamond.ui.table["jinglian_di_" .. iter_16_0]:setVisible(true)
			diamond.ui.table["title_jinglian_" .. iter_16_0]:setVisible(true)
		end

		diamond.ui.table.center_potentiometer:setVisible(true)

		if tonumber(arg_16_0.gemLv) > 20 then
			local var_16_0 = true

			for iter_16_1 = 1, #arg_16_0.skills do
				if tonumber(arg_16_0.skills[iter_16_1].lv) < 5 then
					var_16_0 = false
				end

				if arg_16_0.skills[iter_16_1].pic ~= arg_16_0.skills[1].pic then
					var_16_0 = false
				end
			end

			diamond.ui.table.btn_jinhua:setEnabled(var_16_0)
		else
			diamond.ui.table.kejinhua_word:setVisible(true)
			diamond.ui.table.btn_jinhua:setEnabled(false)
		end

		diamond.lastSkill = arg_16_0.skills[1].pic

		diamond.ui.table.jinjieBg:setVisible(true)
		diamond.ui.table.lv:setVisible(true)
		diamond.ui.table.percent:setVisible(true)
	elseif tonumber(arg_16_0.goodsType) == diamond.constant.JINGSHI2 then
		diamond.ui.table.des:setVisible(false)
	elseif tonumber(arg_16_0.goodsType) == diamond.constant.BAOSHI then
		diamond.ui.table.btn_hecheng:setVisible(true)
		diamond.ui.table.btn_chaijie:setVisible(true)
		diamond.ui.table.btn_damo:setVisible(true)
		diamond.ui.table.title_hecheng:setVisible(true)
		diamond.ui.table.title_chaijie:setVisible(true)
		diamond.ui.table.title_damo:setVisible(true)

		if tonumber(arg_16_0.gemLv) == 15 then
			diamond.ui.table.btn_damo:setEnabled(true)
			diamond.ui.table.btn_hecheng:setEnabled(false)
		else
			diamond.ui.table.btn_damo:setEnabled(false)
			diamond.ui.table.btn_hecheng:setEnabled(true)
		end
	elseif tonumber(arg_16_0.goodsType) == diamond.constant.JINENGSHI then
		diamond.ui.table.btn_jinjie2:setVisible(true)
		diamond.ui.table.btn_jinhua:setVisible(true)
		diamond.ui.table.title_jinjie2:setVisible(true)
		diamond.ui.table.title_jinhua:setVisible(true)

		if tonumber(arg_16_0.gemLv) >= 20 and tonumber(arg_16_0.skills[1].lv) >= 60 then
			diamond.ui.table.btn_jinhua:setEnabled(true)
		else
			diamond.ui.table.btn_jinhua:setEnabled(false)
		end

		diamond.lastSkill = arg_16_0.skills[1].pic

		diamond.ui.table.tit_di_4:setVisible(true)
		diamond.ui.table.tit_4:setVisible(true)
		diamond.ui.table.icon_bg_4:setVisible(true)
		diamond.ui.table.icon_4:setVisible(true)
		diamond.ui.table.btn_jinglian_4:setVisible(true)
		diamond.ui.table.jinglian_di_4:setVisible(true)
		diamond.ui.table.title_jinglian_4:setVisible(true)
		diamond.ui.table.jinjieBg:setVisible(true)
		diamond.ui.table.lv:setVisible(true)
		diamond.ui.table.percent:setVisible(true)
		diamond.ui.table.jinegnshi_title:setVisible(true)
		diamond.ui.table.jinegnshi_title_word:setVisible(true)
		diamond.ui.table.sougua_tucheng:setVisible(true)
		diamond.ui.table.sougua_tucheng_word:setVisible(true)
	elseif tonumber(arg_16_0.goodsType) == diamond.constant.SHENSHI then
		diamond.ui.table.btn_jinjie2:setVisible(true)
		diamond.ui.table.title_jinjie2:setVisible(true)
		diamond.ui.table.jinjieBg:setVisible(true)
		diamond.ui.table.lv:setVisible(true)
		diamond.ui.table.percent:setVisible(true)
	end
end

function diamond.ui.create_single_dimond(arg_17_0, arg_17_1)
	local var_17_0
	local var_17_1, var_17_2 = rmgr.getBaoshiFilePath(arg_17_0.gemPic, arg_17_0.gemLv)
	local var_17_3 = CCSprite:create(var_17_1)

	if arg_17_1 == nil then
		arg_17_1 = false
	end

	for iter_17_0 = 1, #diamond.constant.jinengshi do
		local var_17_4, var_17_5 = string.find(arg_17_0.gemPic, diamond.constant.jinengshi[iter_17_0])

		if var_17_4 and var_17_5 then
			local var_17_6 = CCSprite:create("res/ui/weapon/jsjh_word_icon_" .. string.sub(arg_17_0.gemPic, var_17_4, var_17_5) .. ".png")

			var_17_6:setAnchorPoint(ccp(0, 0))
			var_17_6:setPosition(ccp(0, 0))
			var_17_3:addChild(var_17_6)
		end
	end

	local var_17_7 = math.mod(arg_17_0.gemLv, 4)

	if var_17_7 == 0 then
		var_17_7 = 4
	end

	for iter_17_1 = 1, var_17_7 do
		local var_17_8 = CCSprite:create("res/ui/weapon/xing.png")

		var_17_8:setPosition(15 * iter_17_1, 62)
		var_17_8:setScale(0.5)
		var_17_3:addChild(var_17_8)
	end

	if arg_17_1 == false and arg_17_0.num > 1 then
		local var_17_9 = CCLabelTTF:create(arg_17_0.num, "", "20")

		var_17_9:setHorizontalAlignment(kCCVerticalTextAlignmentCenter)
		var_17_9:setDimensions(CCSizeMake(100, 30))
		var_17_9:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_17_9:setPosition(ccp(36, 12))
		var_17_3:addChild(var_17_9)
	end

	return var_17_3
end

function diamond.ui.showGodBrilliants()
	diamond.ui.table.autoBuyBtn:setVisible(false)
	diamond.ui.table.autoBuyBtn:registerScriptTapHandler(diamond.control.onAutoBuyBtnTouched)

	if not user.chargeItems.gemJinglian.noDisturb then
		diamond.ui.table.checkedBtn:setVisible(false)
	end

	local var_18_0 = diamond.data.gem[diamond.ui.selectIndex]

	diamond.ui.set_ccnode_visible()
	diamond.ui.table.jinegnshi_title:setVisible(true)
	diamond.ui.table.jinegnshi_title_word:setVisible(true)
	diamond.ui.table.sougua_tucheng:setVisible(true)
	diamond.ui.table.sougua_tucheng_word:setVisible(true)

	for iter_18_0 = 1, 6 do
		diamond.ui.table["icon_shenshi_bg_" .. iter_18_0]:setVisible(true)
		diamond.ui.table["icon_shenshi_" .. iter_18_0]:setVisible(true)
	end

	diamond.ui.table.gem_pos:setVisible(false)

	local var_18_1 = language.get(122073)

	if diamond.data.freeGemTimes > 0 then
		var_18_1 = var_18_1 .. language.get(122065, diamond.data.freeGemTimes)
	end

	diamond.ui.table.des:setString(var_18_1)

	local var_18_2 = CCSprite:create("res/ui/weapon/diamond/jnssj_word_sssj.png")

	diamond.ui.table.jinegnshi_title_word:setDisplayFrame(var_18_2:displayFrame())
	diamond.ui.table.sougua_tucheng:setDisplayFrame(CCSprite:create("res/ui/weapon/diamond/jsjh_word_tc.png"):displayFrame())

	local var_18_3 = true
	local var_18_4 = true

	for iter_18_1, iter_18_2 in ipairs(diamond.data.godBrilliants) do
		if iter_18_2.num == 0 then
			var_18_3 = false
		end

		if iter_18_2.gemLv < 10 then
			var_18_4 = false
		end
	end

	if var_18_3 then
		diamond.ui.table.remainSlaughterTimes:setVisible(true)
		diamond.ui.table.remainSlaughterTimes:setString(language.get("122101_tucheng", diamond.data.remainSlaughterTimes))

		if diamond.data.godEnchancerOpen then
			if var_18_4 then
				diamond.ui.table.sougua_tucheng_word:setVisible(false)
				diamond.ui.table.sougua_tucheng:setVisible(false)
			else
				diamond.ui.table.sougua_tucheng_word:setVisible(false)
				diamond.ui.table.sougua_tucheng:setDisplayFrame(CCSprite:create("res/ui/weapon/diamond/jnssj_word_ssqsjsj.png"):displayFrame())
				diamond.ui.table.sougua_tucheng:setPositionX(560)
			end
		else
			diamond.ui.table.sougua_tucheng_word:setString(language.get(122079))
		end
	else
		diamond.ui.table.sougua_tucheng_word:setString(language.get(122077))
	end

	for iter_18_3 = 1, #diamond.data.godBrilliants do
		diamond.ui.table["icon_shenshi_" .. iter_18_3]:removeAllChildrenWithCleanup(true)

		if tonumber(diamond.data.godBrilliants[iter_18_3].num) == 0 then
			tool.spriteToGray(diamond.ui.table["icon_shenshi_" .. iter_18_3])
		end

		for iter_18_4 = 1, #diamond.constant.jinengshi do
			local var_18_5 = diamond.data.godBrilliants[iter_18_3]
			local var_18_6, var_18_7 = string.find(var_18_5.gemPic, diamond.constant.jinengshi[iter_18_4])

			if var_18_6 and var_18_7 and diamond.ui.table["icon_shenshi_" .. iter_18_3]:getChildByTag(1001) == nil then
				local var_18_8 = CCSprite:create("res/ui/weapon/jsjh_word_icon_" .. string.sub(diamond.data.godBrilliants[iter_18_3].gemPic, var_18_6, var_18_7) .. ".png")

				var_18_8:setPosition(ccp(15, 15))
				diamond.ui.table["icon_shenshi_" .. iter_18_3]:addChild(var_18_8, 100, 1001)

				local var_18_9, var_18_10 = rmgr.getBaoshiFilePath(var_18_5.gemPic, var_18_5.gemLv)

				diamond.ui.table["icon_shenshi_" .. iter_18_3]:setDisplayFrame(CCSprite:create(var_18_9):displayFrame())

				local var_18_11 = math.mod(var_18_5.gemLv, 4)

				if var_18_11 == 0 then
					var_18_11 = 4
				end

				for iter_18_5 = 1, var_18_11 do
					local var_18_12 = CCSprite:create("res/ui/weapon/xing.png")

					var_18_12:setPosition(15 * iter_18_5, 62)
					var_18_12:setScale(0.5)
					diamond.ui.table["icon_shenshi_" .. iter_18_3]:addChild(var_18_12)
				end
			end
		end
	end

	diamond.ui.table.center:removeAllChildrenWithCleanup(true)
	diamond.ui.table.center:setDisplayFrame(CCSprite:create("res/ui/weapon/diamond/tucheng.png"):displayFrame())

	if var_18_3 ~= true then
		tool.spriteToGray(diamond.ui.table.center)
	end
end

function diamond.ui.update_selectedDiamond()
	diamond.ui.table.autoBuyBtn:setVisible(false)
	diamond.ui.table.autoBuyBtn:registerScriptTapHandler(diamond.control.onAutoBuyBtnTouched)

	if not user.chargeItems.gemJinglian.noDisturb then
		diamond.ui.table.checkedBtn:setVisible(false)
	end

	local var_19_0 = diamond.data.gem[diamond.ui.selectIndex]

	diamond.ui.update_ccnode(var_19_0)
	diamond.ui.table.gem_pos:setVisible(false)

	if tonumber(var_19_0.goodsType) == diamond.constant.JINGSHI then
		diamond.ui.table.btn_jinjie2:setEnabled(var_19_0.gemLv < diamond.data.jsMaxLv)

		local var_19_1 = language.get(122054)

		diamond.ui.table.autoBuyBtn:setVisible(true)
		diamond.ui.table.autoBuyBtn:setPosition(ccp(485, 160))

		if diamond.data.freeGemTimes > 0 then
			var_19_1 = var_19_1 .. language.get(122065, diamond.data.freeGemTimes)
		end

		diamond.ui.table.des:setString(var_19_1)

		local var_19_2 = 0

		if var_19_0.skills then
			for iter_19_0 = 1, #var_19_0.skills do
				var_19_2 = var_19_2 + tonumber(var_19_0.skills[iter_19_0].lv)
			end
		end

		diamond.ui.table.center_potentiometer:setValue(var_19_2 / 20)

		if var_19_0.weaponId then
			if var_19_0.weaponId > 0 then
				diamond.ui.table.gem_pos:setVisible(true)
			end

			if var_19_0.weaponId == 1 then
				diamond.ui.table.gem_pos_word:setString(language.get(121007))
			elseif var_19_0.weaponId == 2 then
				diamond.ui.table.gem_pos_word:setString(language.get(121008))
			elseif var_19_0.weaponId == 3 then
				diamond.ui.table.gem_pos_word:setString(language.get(121009))
			elseif var_19_0.weaponId == 4 then
				diamond.ui.table.gem_pos_word:setString(language.get(121010))
			elseif var_19_0.weaponId == 5 then
				diamond.ui.table.gem_pos_word:setString(language.get(121011))
			elseif var_19_0.weaponId == 6 then
				diamond.ui.table.gem_pos_word:setString(language.get(121012))
			end
		end
	elseif tonumber(var_19_0.goodsType) == diamond.constant.BAOSHI then
		if tonumber(var_19_0.gemLv) == 15 then
			diamond.ui.table.des:setString(language.get(122053))
		else
			diamond.ui.table.des:setString(language.get(122052))
		end
	elseif tonumber(var_19_0.goodsType) == diamond.constant.JINENGSHI then
		diamond.ui.table.autoBuyBtn:setVisible(true)
		diamond.ui.table.autoBuyBtn:setPosition(ccp(485, 205))
		diamond.ui.table.btn_jinjie2:setEnabled(var_19_0.gemLv < diamond.data.brilliantMaxLv)

		local var_19_3 = language.get(122071)

		if diamond.data.freeGemTimes > 0 then
			var_19_3 = var_19_3 .. language.get(122065, diamond.data.freeGemTimes)
		end

		diamond.ui.table.des:setString(var_19_3)

		for iter_19_1 = 1, #diamond.constant.jinengshi do
			local var_19_4, var_19_5 = string.find(var_19_0.gemPic, diamond.constant.jinengshi[iter_19_1])

			if var_19_4 and var_19_5 then
				local var_19_6 = CCSprite:create("res/ui/weapon/diamond/jsjh_word_" .. string.sub(var_19_0.gemPic, var_19_4, var_19_5) .. ".png")

				diamond.ui.table.jinegnshi_title_word:setDisplayFrame(var_19_6:displayFrame())
			end
		end

		diamond.ui.table.sougua_tucheng:setDisplayFrame(CCSprite:create("res/ui/weapon/diamond/jsjh_word_sg.png"):displayFrame())

		if diamond.data.havePlunder then
			diamond.ui.table.sougua_tucheng_word:setString(language.get(122079))
		else
			diamond.ui.table.sougua_tucheng_word:setString(language.get(122077))
		end
	elseif tonumber(var_19_0.goodsType) == diamond.constant.SHENSHI then
		if diamond.data.haveSpSlaughter then
			diamond.ui.showGodBrilliants()
		else
			diamond.ui.table.btn_jinjie2:setEnabled(var_19_0.gemLv < diamond.data.godMaxLv)
			diamond.ui.table.btn_jinjie2:setPositionX(550)
			diamond.ui.table.title_jinjie2:setPositionX(550)

			local var_19_7 = language.get(122086)

			diamond.ui.table.des:setString(var_19_7)
		end
	end

	if var_19_0.goodsType ~= diamond.constant.SHENSHI or not diamond.data.haveSpSlaughter then
		if diamond.ui.table.center ~= nil then
			diamond.ui.table.bg:removeChild(diamond.ui.table.center, true)

			diamond.ui.table.center = nil
		end

		diamond.ui.table.center = diamond.ui.create_single_dimond(var_19_0)

		diamond.ui.table.center:setPosition(ccp(560, 339))
		diamond.ui.table.bg:addChild(diamond.ui.table.center, 100)
	end

	if var_19_0.goodsType == diamond.constant.JINGSHI or var_19_0.goodsType == diamond.constant.JINENGSHI or var_19_0.goodsType == diamond.constant.SHENSHI and diamond.data.haveSpSlaughter ~= true then
		diamond.ui.update_selectedDiamond_skill(var_19_0)

		local var_19_8 = 0

		if var_19_0.maxPs > 0 then
			var_19_8 = var_19_0.curPs * 100 / var_19_0.maxPs
		end

		diamond.ui.table.jinjie:setPercentage(var_19_8)
		diamond.ui.table.jinjie:setVisible(true)
		diamond.ui.table.lv:setString(language.get(122060, var_19_0.gemLv))
		diamond.ui.table.percent:setString(tostring(math.floor(var_19_8)) .. "%")
	end
end

function diamond.ui.update_selectedDiamond_skill(arg_20_0)
	if arg_20_0.goodsType == diamond.constant.JINENGSHI then
		local var_20_0 = arg_20_0.skills[1]

		if var_20_0 ~= nil then
			if var_20_0.pic then
				local var_20_1 = "res/ui/weapon/diamond/warlock_tit_" .. var_20_0.pic .. "_red.png"
				local var_20_2 = CCSprite:create(var_20_1)

				diamond.ui.table.icon_jinengshi:setDisplayFrame(var_20_2:displayFrame())
				diamond.ui.table.icon_jinengshi:setVisible(true)
			end

			diamond.ui.table.lv_jinengshi:setString("Lv." .. var_20_0.lv)
			diamond.ui.table.lv_jinengshi:setVisible(true)
			diamond.ui.table.tit_di_jinengshi:setVisible(true)
		end

		local var_20_3 = arg_20_0.skills[2]

		if var_20_3 ~= nil then
			diamond.ui.table.tit_di_4:setVisible(false)
			diamond.ui.table.tit_4:setVisible(false)

			if var_20_3.lv > 0 then
				if var_20_3.pic then
					local var_20_4 = "res/ui/weapon/diamond/warlock_tit_" .. var_20_3.pic .. "_red.png"
					local var_20_5 = CCSprite:create(var_20_4)

					diamond.ui.table.icon_4:setDisplayFrame(var_20_5:displayFrame())
				end

				diamond.ui.table.lv_4:setString("Lv." .. var_20_3.lv)
				diamond.ui.table.lv_4:setVisible(true)
				diamond.ui.table.btn_jinglian_4:setEnabled(true)
			elseif arg_20_0.skills[1].lv < 60 then
				diamond.ui.table.icon_4:setDisplayFrame(CCSprite:create("res/ui/weapon/diamond/warlock_btn_sz_s.png"):displayFrame())
				diamond.ui.table.tit_4:setString(language.get(122056, arg_20_0.gemLv + 5 - math.mod(arg_20_0.gemLv, 5)))
				diamond.ui.table.tit_di_4:setVisible(true)
				diamond.ui.table.tit_4:setVisible(true)
				diamond.ui.table.lv_4:setVisible(false)
				diamond.ui.table.btn_jinglian_4:setEnabled(false)
			else
				local var_20_6 = "res/ui/weapon/diamond/jinengshenshi.png"
				local var_20_7 = CCSprite:create(var_20_6)

				diamond.ui.table.icon_4:setDisplayFrame(var_20_7:displayFrame())
				diamond.ui.table.lv_4:setString("Lv.Max")
				diamond.ui.table.lv_4:setVisible(true)
				diamond.ui.table.btn_jinglian_4:setEnabled(false)
				diamond.ui.table.btn_jinglian_4:setVisible(true)
			end
		end
	elseif arg_20_0.goodsType == diamond.constant.JINGSHI then
		for iter_20_0 = 1, 4 do
			local var_20_8 = arg_20_0.skills[iter_20_0]

			if var_20_8 ~= nil then
				diamond.ui.table["tit_di_" .. iter_20_0]:setVisible(false)
				diamond.ui.table["tit_" .. iter_20_0]:setVisible(false)

				if var_20_8.pic then
					local var_20_9 = "res/ui/weapon/diamond/warlock_tit_" .. var_20_8.pic .. "_red.png"
					local var_20_10 = CCSprite:create(var_20_9)

					diamond.ui.table["icon_" .. iter_20_0]:setDisplayFrame(var_20_10:displayFrame())
				end

				diamond.ui.table["lv_" .. iter_20_0]:setString("Lv." .. var_20_8.lv)
				diamond.ui.table["lv_" .. iter_20_0]:setVisible(true)
				diamond.ui.table["btn_jinglian_" .. iter_20_0]:setEnabled(true)
			else
				diamond.ui.table["icon_" .. iter_20_0]:setVisible(false)
				diamond.ui.table["lv_" .. iter_20_0]:setVisible(false)
				diamond.ui.table["btn_jinglian_" .. iter_20_0]:setEnabled(false)
			end
		end
	end
end

function diamond.ui.createDiamondList()
	if diamond.ui.table.scrollView ~= nil then
		diamond.ui.table.bg:removeChild(diamond.ui.table.scrollView, true)

		diamond.ui.table.scrollView = nil
	end

	if diamond.totalCount == 0 then
		return
	end

	local var_21_0 = false

	if diamond.isFirst and diamond.data.haveGodBrilliant then
		var_21_0 = true
	end

	local var_21_1 = createBaseLayer()
	local var_21_2 = math.floor((diamond.totalCount + 1) / 2)

	for iter_21_0 = 1, diamond.totalCount do
		local var_21_3 = diamond.data.gem[iter_21_0]
		local var_21_4 = CCSprite:create("res/ui/weapon/diamond/warlock_btn_sz.png")

		var_21_4:setPosition(52 + 90 * math.mod(iter_21_0 + 1, 2), 90 * (var_21_2 - math.floor((iter_21_0 + 1) / 2)) + 40)

		diamond.ui.table["spriteBg_" .. iter_21_0] = var_21_4

		var_21_1:addChild(var_21_4, 1)

		local var_21_5 = diamond.ui.create_single_dimond(var_21_3)

		var_21_5:setPosition(ccp(39, 39))
		var_21_4:addChild(var_21_5)
	end

	local var_21_6 = CCSprite:create("res/ui/weapon/gem_now_view_lig.png")

	diamond.ui.table.select_icon = var_21_6

	diamond.ui.table.select_icon:setVisible(false)
	var_21_1:addChild(var_21_6, 10)

	local var_21_7 = CCScrollView:create(CCSizeMake(194, 405))

	var_21_7:setContainer(var_21_1)
	var_21_7:setPosition(0, 60)
	var_21_7:setContentSize(CCSizeMake(194, 90 * var_21_2))
	var_21_7:setDirection(kCCScrollViewDirectionVertical)

	diamond.ui.table.scrollView = var_21_7

	diamond.ui.table.bg:addChild(var_21_7, 1000)
	diamond.ui.table.layer:setVisible(true)

	if diamond.isjinjie == true then
		var_21_7:setContentOffset(ccp(0, -90 * var_21_2 + 405))

		return
	end

	if var_21_0 then
		var_21_7:setContentOffset(var_21_7:minContainerOffset())
		diamond.ui.showGodBrilliants()
	else
		local var_21_8, var_21_9 = diamond.ui.table["spriteBg_" .. diamond.ui.selectIndex]:getPosition()

		var_21_6:setPosition(ccp(var_21_8, var_21_9))
		var_21_6:setVisible(true)

		local var_21_10 = diamond.data.gem[diamond.ui.selectIndex]

		if tonumber(var_21_10.goodsType) == 1 then
			var_21_7:setContentOffset(ccp(0, -90 * var_21_2 + 405))
		elseif var_21_2 <= 4 then
			var_21_7:setContentOffset(ccp(0, -90 * var_21_2 + 405))
		else
			local var_21_11 = math.floor((diamond.ui.selectIndex + 1) / 2)

			var_21_7:setContentOffset(ccp(0, (-90 * var_21_2 + 405) * (var_21_2 - var_21_11) / var_21_2))
		end

		if diamond.ui.action == 0 then
			diamond.ui.update_selectedDiamond()
		elseif diamond.ui.action == 1 or diamond.ui.action == 2 then
			diamond.ui.action_effect()
		elseif diamond.ui.action == 3 or diamond.ui.action == 5 then
			diamond.ui.update_selectedDiamond()
		elseif diamond.ui.action == 4 then
			diamond.ui.update_selectedDiamond()
			diamond.ui.action_effect()
		end
	end
end

function diamond.ui.effect_end()
	diamond.ui.table.effect:setVisible(false)

	diamond.ui.isInEffect = false

	if diamond.ui.action ~= 4 and diamond.isjinjie ~= true then
		diamond.ui.update_selectedDiamond()
	end
end

function diamond.ui.action_effect()
	local var_23_0 = rmgr.getAnimation("fireEffect")
	local var_23_1 = CCAnimation:createWithSpriteFrames(var_23_0, 0.1)
	local var_23_2 = CCAnimate:create(var_23_1)
	local var_23_3 = CCCallFuncN:create(diamond.ui.effect_end)
	local var_23_4 = CCArray:create()

	var_23_4:addObject(var_23_2)
	var_23_4:addObject(var_23_3)

	local var_23_5 = CCSequence:create(var_23_4)
	local var_23_6 = CCRepeat:create(tolua.cast(var_23_5, "CCActionInterval"), 2)

	diamond.ui.table.effect:stopAllActions()
	diamond.ui.table.effect:runAction(var_23_6)
	diamond.ui.table.effect:setVisible(true)

	diamond.ui.isInEffect = true
end

function diamond.ui.init()
	diamond.ui.table.effect:setVisible(false)
	diamond.ui.table.btn_hecheng:registerScriptTapHandler(diamond.control.clicked_hecheng)
	diamond.ui.table.btn_chaijie:registerScriptTapHandler(diamond.control.clicked_chaijie)
	diamond.ui.table.btn_damo:registerScriptTapHandler(diamond.control.clicked_damo)
	diamond.ui.table.btn_jinjie2:registerScriptTapHandler(diamond.control.clicked_jinjie)
	diamond.ui.table.btn_jinhua:registerScriptTapHandler(diamond.control.clicked_evolution)
	diamond.ui.table.btn_ok:registerScriptTapHandler(diamond.control.clicked_jinjie_ok)
	diamond.ui.table.btn_cancel:registerScriptTapHandler(diamond.control.clicked_jinjie_cancel)

	for iter_24_0 = 1, 4 do
		diamond.ui.table["btn_jinglian_" .. iter_24_0]:registerScriptTapHandler(diamond.control.clicked_jinglian)
	end

	diamond.ui.action = 0
	diamond.ui.selectIndex = 0
	diamond.isjinjie = false
	diamond.isFirst = true

	diamond.ui.set_ccnode_visible()
	diamond.ui.run_action_play_anim_jindu()
end

function diamond.ui.show()
	local var_25_0 = createBaseLayer()

	diamond.ui.table = autoUI.initUI(var_25_0, getDiamondData())
	diamond.ui.table.layer = var_25_0

	diamond.ui.refineLayout(diamond.ui.table)

	diamond.ui.jingLianLayerinfo = diamond.ui.createLianActivityLayerinfo()

	diamond.ui.jingLianLayerinfo.root:setPosition(ccp(890, 510))
	diamond.ui.table.bg:addChild(diamond.ui.jingLianLayerinfo.root)
	diamond.ui.jingLianLayerinfo.root:setVisible(false)

	local var_25_1 = CCControlPotentiometer:create("res/ui/weapon/diamond/jsjh_jspb_gray.png", "res/ui/weapon/diamond/jsjh_jspb.png", "res/default.png")

	diamond.ui.table.bg:addChild(var_25_1)

	diamond.ui.table.center_potentiometer = var_25_1

	var_25_1:setValue(0.7)
	var_25_1:setPosition(ccp(560, 342))
	var_25_1:setEnabled(false)
	var_25_0:registerScriptTouchHandler(diamond.ui.onTouch)
	var_25_0:setTouchEnabled(true)
	diamond.ui.init()
	diamond.control.request_gemInfo()

	if not user.weaponRank then
		diamond.control.request_weaponRank()
	end

	return var_25_0
end

function diamond.ui.createSelectPanel()
	if diamond.ui.table.bg_spSlaughters == nil then
		local var_26_0 = {}

		uiutil.initWidgets(var_26_0, var_0_0)
		diamond.ui.table.bg:addChild(var_26_0.widgets.bg, 9000)

		diamond.ui.table.bg_spSlaughters = var_26_0.widgets.bg

		for iter_26_0, iter_26_1 in ipairs(diamond.data.spSlaughters) do
			local var_26_1 = diamond.constant.terrain[iter_26_1]

			var_26_0.widgets["txt" .. iter_26_0]:setString(language.get(122092, language.get(var_26_1.txtId)))
			var_26_0.widgets["flag" .. iter_26_0]:setDisplayFrame(CCSprite:create("res/ui/weapon/diamond/" .. var_26_1.flag):displayFrame())
			var_26_0.widgets["icon" .. iter_26_0]:setDisplayFrame(CCSprite:create("res/ui/weapon/diamond/" .. var_26_1.pic):displayFrame())
			var_26_0.widgets["btn" .. iter_26_0]:addHandleOfControlEvent(function()
				log.info("btn" .. iter_26_0)
				diamond.control.selectSpSlaughter(iter_26_0)
			end, CCControlEventTouchUpInside)
		end
	end
end

function diamond.ui.createLianActivityLayerinfo(...)
	local var_28_0 = {
		y = 0,
		name = "root",
		type = "node",
		x = 0,
		children = {
			{
				name = "btnGetFree",
				h = 48,
				type = "button",
				w = 49,
				y = -23.1985,
				x = -25.1493,
				normal = {
					path = "res/ui/equip/quenching/acti_icon_xidfs.png"
				},
				touched = {
					path = "res/ui/equip/quenching/acti_icon_xidfs.png"
				},
				children = {
					{
						fontSize = 20,
						name = "leftNum",
						y = 40.6248,
						type = "label",
						text = "0",
						style = "label_yellowish_20",
						x = 43.1237,
						halign = kCCTextAlignmentLeft,
						valign = kCCVerticalTextAlignmentBottom
					}
				}
			},
			{
				fontSize = 20,
				name = "textNode",
				y = -24.6905,
				type = "label",
				width = 220,
				height = 0,
				text = "0",
				style = "label_yellowish_20",
				x = -58,
				halign = kCCTextAlignmentLeft,
				valign = kCCVerticalTextAlignmentBottom,
				anchorPoint = ccp(1, 0.5)
			}
		}
	}
	local var_28_1 = {}

	uiutil.initWidgets(var_28_1, var_28_0)

	local function var_28_2(...)
		cmgr.sendRequest(diamond.control.request_gemInfo, actions.getJinLianFreeTimes)
	end

	var_28_1.widgets.btnGetFree:addHandleOfControlEvent(var_28_2, CCControlEventTouchUpInside)

	return var_28_1.widgets
end

function diamond.ui.showJinglianActivity(arg_30_0)
	if arg_30_0.point then
		diamond.ui.jingLianLayerinfo.root:setVisible(true)
		diamond.ui.jingLianLayerinfo.textNode:setString(language.get(135862, arg_30_0.point - arg_30_0.currentNum))
		diamond.ui.jingLianLayerinfo.leftNum:setString(arg_30_0.leftNum)
	else
		diamond.ui.jingLianLayerinfo.root:setVisible(false)
	end
end

function diamond.ui.refineLayout(arg_31_0)
	arg_31_0.sougua_tucheng:setAnchorPoint(ccp(0, 0.5))
	arg_31_0.sougua_tucheng:setPositionX(arg_31_0.sougua_tucheng_word:getPositionX() + arg_31_0.sougua_tucheng_word:getContentSize().width / 2)
end
