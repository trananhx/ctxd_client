local var_0_0 = {}

function showFightRightButton(arg_1_0)
	rmgr.loadResource("res/ui/battle/rightBar/rightBar.plist")
	rmgr.loadResource("res/ui/battle/specialPhantom/specialPhantom.plist")

	local var_1_0 = {}

	var_0_0.open = true
	var_0_0.touchIdx = -1

	local var_1_1 = {
		disable = "btn_miehuo_g.png",
		name = "miehuo",
		enable = true,
		light = "btn_miehuo_c.png",
		normal = "btn_miehuo.png",
		callback = arg_1_0.miehuo
	}
	local var_1_2 = {
		disable = "btn_youdi_disable.png",
		name = "youdi",
		enable = true,
		light = "btn_youdi_lighted.png",
		normal = "btn_youdi_normal.png",
		callback = arg_1_0.youdi
	}
	local var_1_3 = {
		disable = "jt_btn_jtdt_g.png",
		name = "juntuanDantiao",
		enable = true,
		light = "jt_btn_jtdt_c.png",
		normal = "jt_btn_jtdt.png",
		callback = arg_1_0.juntuanDantiao
	}
	local var_1_4 = {
		disable = "jt_btn_jttj_g.png",
		name = "juntuanTujin",
		enable = true,
		light = "jt_btn_jttj_c.png",
		normal = "jt_btn_jttj.png",
		callback = arg_1_0.juntuanTujin
	}
	local var_1_5 = {
		disable = "jzxt_btn_jz_g.png",
		name = "jiaozhen",
		enable = true,
		light = "jzxt_btn_jz_c.png",
		normal = "jzxt_btn_jz.png",
		callback = arg_1_0.jiaozhen
	}
	local var_1_6 = {
		disable = "jzxt_btn_ws_g.png",
		name = "weishe",
		enable = true,
		light = "jzxt_btn_ws_c.png",
		normal = "jzxt_btn_ws.png",
		callback = arg_1_0.weishe
	}
	local var_1_7 = {
		disable = "jzcf_btn_cf_g.png",
		name = "chaofeng",
		enable = true,
		light = "jzcf_btn_cf_c.png",
		normal = "jzcf_btn_cf.png",
		callback = arg_1_0.chaofeng
	}
	local var_1_8 = {
		disable = "jzxt_btn_yz_g.png",
		name = "yinzhan",
		enable = true,
		light = "jzxt_btn_yz_c.png",
		normal = "jzxt_btn_yz.png",
		callback = arg_1_0.yinzhan
	}

	function var_0_0.update(arg_2_0)
		for iter_2_0 = 0, #var_1_0.actions - 1 do
			var_1_0.widgets.actionView:updateCellAtIndex(iter_2_0)
		end
	end

	function var_0_0.changeAndUpdate(arg_3_0, arg_3_1, arg_3_2)
		log.info("------enter!changeAndUpdate-------")

		if arg_3_2 then
			var_0_0:delActions(arg_3_1)
		else
			var_0_0:addActions(arg_3_1)
		end

		var_1_0.widgets.actionView:reloadData()

		for iter_3_0 = 0, #var_1_0.actions - 1 do
			var_1_0.widgets.actionView:updateCellAtIndex(iter_3_0)
		end
	end

	function var_0_0.delActions(arg_4_0, arg_4_1)
		log.info("--------before-----------" .. #var_1_0.actions)

		for iter_4_0 = #var_1_0.actions, 1, -1 do
			if var_1_0.actions[iter_4_0].name == arg_4_1 then
				table.remove(var_1_0.actions, iter_4_0)
			end
		end

		log.info("--------after-----------" .. #var_1_0.actions)
	end

	function var_0_0.addActions(arg_5_0, arg_5_1)
		if arg_5_1 == "jiaozhen" then
			table.insert(var_1_0.actions, var_1_5)
		elseif arg_5_1 == "weishe" then
			table.insert(var_1_0.actions, var_1_6)
		elseif arg_5_1 == "yinzhan" then
			table.insert(var_1_0.actions, var_1_8)
		elseif arg_5_1 == "chaofeng" then
			table.insert(var_1_0.actions, var_1_7)
		end
	end

	function var_1_0.initAction()
		var_1_0.actions = {}

		if user.pin == 0 or user.pin == 1 then
			table.insert(var_1_0.actions, {
				disable = "btn_liansuo_g.png",
				name = "lockCity",
				enable = true,
				light = "btn_liansuo_c.png",
				normal = "btn_liansuo.png",
				callback = arg_1_0.useLockCity
			})
		end

		if arg_1_0.battleType == battleType.BATTLE_CITY or arg_1_0.battleType == battleType.BATTLE_BARBARAIN or arg_1_0.battleType == battleType.BATTLE_SCENARIO or arg_1_0.battleType == battleType.BATTLE_SCENARIO_ONE2ONE or arg_1_0.battleType == battleType.BATTLE_KFGZ or arg_1_0.battleType == battleType.BATTLE_JBYW or arg_1_0.battleType == battleType.BATTLE_JBYWDT then
			if arg_1_0.slaughterCd and arg_1_0.slaughterCd >= 0 then
				table.insert(var_1_0.actions, {
					disable = "tcxg_btn_tc_g.png",
					name = "tucheng",
					enable = true,
					light = "tcxg_btn_tc_c.png",
					normal = "tcxg_btn_tc.png",
					callback = arg_1_0.tucheng
				})
			end

			if arg_1_0.wana and arg_1_0.wana.canUse and arg_1_0.wana.num > 0 then
				table.insert(var_1_0.actions, {
					disable = "btn_xianjing_g.png",
					name = "trap",
					enable = true,
					light = "btn_xianjing_c.png",
					normal = "btn_xianjing.png",
					callback = arg_1_0.trap
				})
			end

			if user.bombNum and user.bombNum > 0 then
				table.insert(var_1_0.actions, {
					disable = "btn_zhadan_g.png",
					name = "yuanzhengBomb",
					enable = true,
					light = "btn_zhadan_c.png",
					normal = "btn_zhadan.png",
					callback = arg_1_0.yuanzhengBomb
				})
			end

			if arg_1_0.leftLitTimes and arg_1_0.leftLitTimes > 0 then
				table.insert(var_1_0.actions, {
					disable = "btn_huoji_g.png",
					name = "huoji",
					enable = true,
					light = "btn_huoji_c.png",
					normal = "btn_huoji.png",
					callback = arg_1_0.huoji
				})
			end

			if arg_1_0.figthSide == "att" and arg_1_0.fire ~= nil and arg_1_0.fire.cityId == arg_1_0.cityId and arg_1_0.fire.hp > 0 then
				table.insert(var_1_0.actions, var_1_1)
			elseif arg_1_0.corpsInfo then
				table.insert(var_1_0.actions, var_1_3)
			else
				table.insert(var_1_0.actions, var_1_2)
			end

			if arg_1_0.corpsInfo then
				table.insert(var_1_0.actions, var_1_4)
			else
				table.insert(var_1_0.actions, {
					disable = "btn_tujing_disable.png",
					name = "tujin",
					enable = true,
					light = "btn_tujin_light.png",
					normal = "btn_tujin_normal.png",
					callback = arg_1_0.getTujinInfo
				})
			end

			if arg_1_0.terrainPic ~= 1001 and (arg_1_0.isInNationTryOrUpgrade or arg_1_0.cityId ~= 250 and arg_1_0.cityId ~= 251 and arg_1_0.cityId ~= 252) then
				table.insert(var_1_0.actions, {
					disable = "btn_jiebing_disable.png",
					name = "jiebing",
					enable = true,
					light = "btn_jiebing_light.png",
					normal = "btn_jiebing_normal.png",
					callback = arg_1_0.jiebing
				})
			end

			table.insert(var_1_0.actions, {
				disable = "btn_chetui_disable.png",
				name = "chetui",
				enable = true,
				light = "btn_chetui_light.png",
				normal = "btn_chetui_normal.png",
				callback = arg_1_0.getChetuiInfo
			})

			if arg_1_0.canDetonate ~= nil then
				table.insert(var_1_0.actions, {
					disable = "btn_yinbao_g.png",
					name = "bomb",
					enable = true,
					light = "btn_yinbao_c.png",
					normal = "btn_yinbao.png",
					callback = arg_1_0.bomb
				})
			end

			if arg_1_0.paoJiNum ~= nil then
				table.insert(var_1_0.actions, {
					disable = "res/ui/battle/battleTower/cfjt_btn_kp.png",
					name = "paoji",
					enable = true,
					light = "res/ui/battle/battleTower/cfjt_btn_kph.png",
					normal = "res/ui/battle/battleTower/cfjt_btn_kp.png",
					callback = arg_1_0.paoji
				})
			end

			if arg_1_0.battleType ~= battleType.BATTLE_SCENARIO and arg_1_0.battleType ~= battleType.BATTLE_SCENARIO_ONE2ONE and arg_1_0.battleType ~= battleType.BATTLE_SCENARIO_EVENT and arg_1_0.battleType ~= battleType.BATTLE_KFGZ_SOLO and arg_1_0.terrainPic ~= 1001 and (arg_1_0.isInNationTryOrUpgrade or arg_1_0.cityId ~= 250 and arg_1_0.cityId ~= 251 and arg_1_0.cityId ~= 252) then
				table.insert(var_1_0.actions, {
					disable = "btn_jiebing_10_disable.png",
					name = "jiebingX10",
					enable = true,
					light = "btn_jiebing_10_light.png",
					normal = "btn_jiebing_10_normal.png",
					callback = arg_1_0.jiebingX10
				})
			end

			if arg_1_0.battleFlag then
				table.insert(var_1_0.actions, {
					disable = "btn_shuaiqi_g.png",
					name = "shuaiqi",
					enable = true,
					light = "btn_shuaiqi_c.png",
					normal = "btn_shuaiqi.png",
					callback = arg_1_0.shuaiqi
				})
			end

			if arg_1_0.battleType ~= battleType.BATTLE_SCENARIO and arg_1_0.battleType ~= battleType.BATTLE_SCENARIO_ONE2ONE and arg_1_0.battleType ~= battleType.BATTLE_SCENARIO_EVENT and arg_1_0.terrainPic ~= 1002 then
				table.insert(var_1_0.actions, {
					enable = true,
					name = "zzl",
					light = "btn_zzl_light.png",
					normal = "btn_zzl_normal.png",
					callback = arg_1_0.useGoldOrder
				})
			end

			if arg_1_0.hasOfficerToken and arg_1_0.battleType ~= battleType.BATTLE_SCENARIO and arg_1_0.battleType ~= battleType.BATTLE_SCENARIO_ONE2ONE and arg_1_0.battleType ~= battleType.BATTLE_SCENARIO_EVENT and arg_1_0.terrainPic ~= 1002 then
				table.insert(var_1_0.actions, {
					disable = "btn_gyl_disable.png",
					name = "gyl",
					enable = true,
					light = "btn_gyl_light.png",
					normal = "btn_gyl_normal.png",
					callback = arg_1_0.useOfficeToken
				})
			end

			if arg_1_0.battleType ~= battleType.BATTLE_SCENARIO and arg_1_0.battleType ~= battleType.BATTLE_SCENARIO_ONE2ONE and arg_1_0.battleType ~= battleType.BATTLE_SCENARIO_EVENT and arg_1_0.battleType ~= battleType.BATTLE_JBYW and arg_1_0.battleType ~= battleType.BATTLE_JBYWDT and arg_1_0.terrainPic ~= 1002 and smgr.lastSafeScene ~= SCENE_KFEXPEDITION then
				-- block empty
			end

			if arg_1_0.arenaInfo.arenaType == 0 then
				-- block empty
			elseif arg_1_0.arenaInfo.arenaType == 1 then
				table.insert(var_1_0.actions, var_1_5)
			elseif arg_1_0.arenaInfo.arenaType == 2 then
				-- block empty
			elseif arg_1_0.arenaInfo.arenaType == 3 then
				table.insert(var_1_0.actions, var_1_8)
			end
		end
	end

	function var_1_0.cellSizeForTable(arg_7_0, arg_7_1)
		return 82, 96
	end

	function var_1_0.tableCellAtIndex(arg_8_0, arg_8_1)
		local var_8_0 = {}

		if conf.language == "vie" then
			var_8_0.shadowFontSize = -2
		else
			var_8_0.shadowFontSize = 0
		end

		local var_8_1 = var_1_0.actions[arg_8_1 + 1]

		var_8_1.enable = true

		if var_8_1.name == "youdi" and arg_1_0.figthSide == "att" and arg_1_0.fire ~= nil and arg_1_0.fire.cityId == arg_1_0.cityId and arg_1_0.fire.hp > 0 then
			var_1_0.actions[arg_8_1 + 1] = var_1_1
			var_8_1 = var_1_1
		end

		if var_8_1.name == "miehuo" and arg_1_0.figthSide == "att" and arg_1_0.fire ~= nil and arg_1_0.fire.cityId == arg_1_0.cityId and arg_1_0.fire.hp <= 0 then
			if arg_1_0.corpsInfo then
				var_1_0.actions[arg_8_1 + 1] = var_1_3
				var_8_1 = var_1_3
			else
				var_1_0.actions[arg_8_1 + 1] = var_1_2
				var_8_1 = var_1_2
			end
		end

		local var_8_2 = arg_8_0:dequeueCell()

		if var_8_2 then
			var_8_2:removeAllChildrenWithCleanup(true)
		else
			var_8_2 = CCTableViewCell:new()
		end

		local var_8_3 = CCSprite:createWithSpriteFrameName(var_8_1.normal)

		var_8_3:setAnchorPoint(CCPointMake(0, 0))
		var_8_3:setPosition(CCPointMake(7, 0))

		local var_8_4 = CCSprite:createWithSpriteFrameName(var_8_1.light)

		var_8_4:setAnchorPoint(CCPointMake(0, 0))
		var_8_4:setPosition(CCPointMake(7, 0))
		var_8_4:setVisible(false)

		if var_8_1.name == "juntuanDantiao" then
			var_8_3:setPosition(ccp(-5, 0))
			var_8_4:setPosition(ccp(-5, 0))
		elseif var_8_1.name == "juntuanTujin" then
			var_8_3:setPosition(ccp(-5, 0))
			var_8_4:setPosition(ccp(-5, 0))
		end

		if var_8_1.name == "paoji" then
			var_8_3 = CCSprite:create(var_8_1.normal)

			var_8_3:setAnchorPoint(CCPointMake(0, 0))
			var_8_3:setPosition(CCPointMake(7, 0))

			var_8_4 = CCSprite:create(var_8_1.light)

			var_8_4:setAnchorPoint(CCPointMake(0, 0))
			var_8_4:setPosition(CCPointMake(7, 0))
			var_8_4:setVisible(false)

			local var_8_5

			if arg_1_0.paoJiNum and arg_1_0.paoJiNum >= 0 then
				local var_8_6 = CCStrokeLabelTTF:create(language.get(190206, arg_1_0.paoJiNum), "Thonburi", 18)

				var_8_6:setPosition(ccp(44, 72))
				var_8_2:addChild(var_8_6, 2)

				if conf.language == "tha" then
					var_8_6:setDimensions(CCSizeMake(80, 0))
				end
			end
		elseif var_8_1.name == "bomb" and arg_1_0.canDetonate == nil then
			var_8_3 = CCSprite:createWithSpriteFrameName(var_8_1.disable)

			var_8_3:setAnchorPoint(CCPointMake(0, 0))
			var_8_3:setPosition(CCPointMake(7, 0))

			var_8_4 = CCSprite:createWithSpriteFrameName(var_8_1.disable)

			var_8_4:setAnchorPoint(CCPointMake(0, 0))
			var_8_4:setPosition(CCPointMake(7, 0))
			var_8_4:setVisible(false)

			var_8_1.enable = false
		end

		var_8_2:addChild(var_8_4, 1, 101)

		if var_8_1.name == "jiebing" or var_8_1.name == "jiebingX10" then
			arg_1_0.availablePhantoms = arg_1_0.availablePhantoms or {
				0
			}

			if arg_1_0.battleType == battleType.BATTLE_SCENARIO then
				arg_1_0.availablePhantoms = {
					0
				}
			end

			local var_8_7 = CCSprite:createWithSpriteFrameName("tshy_btn_d.png")

			var_8_7:setPosition(ccp(45, 41))
			var_8_2:addChild(var_8_7, -100)

			local var_8_8 = createBaseLayer()
			local var_8_9 = CCScrollView:create(CCSizeMake(96, 82))

			var_8_9:setContainer(var_8_8)
			var_8_9:setPosition(ccp(0, 0))
			var_8_9:setContentSize(CCSizeMake(96 * #arg_1_0.availablePhantoms, 82))
			var_8_9:setDirection(kCCScrollViewDirectionHorizontal)
			var_8_9:setTouchEnabled(false)
			var_8_2:addChild(var_8_9)

			local var_8_10 = var_8_1.name == "jiebingX10"

			for iter_8_0, iter_8_1 in ipairs(arg_1_0.availablePhantoms) do
				if arg_1_0.currentPhantomType == iter_8_1 then
					var_8_8:setPosition(-89 + 96 * (2 - iter_8_0), 0)
				end

				local var_8_11 = var_8_10 and PHANTOM10_PIC[iter_8_1][1] or PHANTOM_PIC[iter_8_1][1]
				local var_8_12 = CCSprite:createWithSpriteFrameName(var_8_11)

				var_8_12:setAnchorPoint(CCPointMake(0, 0))
				var_8_12:setPosition(ccp(96 * (iter_8_0 - 1), 0))
				var_8_8:addChild(var_8_12)
			end

			local function var_8_13()
				local var_9_0 = arg_1_0.currentPhantomType

				log.info("setArrowAndUp: battleControl.currentPhantomType ", var_9_0)
				var_8_7:removeAllChildrenWithCleanup(true)

				local var_9_1

				for iter_9_0, iter_9_1 in ipairs(arg_1_0.availablePhantoms) do
					if iter_9_1 == var_9_0 then
						var_9_1 = iter_9_0

						break
					end
				end

				if var_9_1 + 1 <= #arg_1_0.availablePhantoms then
					local var_9_2 = CCSprite:createWithSpriteFrameName("btn_a_r.png")

					var_9_2:setPosition(ccp(var_8_7:getContentSize().width - 2, var_8_7:getContentSize().height / 2))
					var_8_7:addChild(var_9_2)
				end

				if var_9_1 > 1 then
					local var_9_3 = CCSprite:createWithSpriteFrameName("btn_a_l.png")

					var_9_3:setPosition(ccp(5, var_8_7:getContentSize().height / 2))
					var_8_7:addChild(var_9_3)
				end

				var_8_2:removeChildByTag(103, true)
				var_8_2:removeChildByTag(104, true)
				var_8_2:removeChildByTag(105, true)

				local var_9_4 = var_8_1.name == "jiebingX10"
				local var_9_5 = 0
				local var_9_6 = 0
				local var_9_7 = 1

				if var_9_0 == 0 then
					var_9_6 = arg_1_0.freePhantomCount
				elseif var_9_0 == 1 then
					var_9_6 = arg_1_0.leftTujinNum
				elseif var_9_0 == 2 then
					var_9_6 = arg_1_0.leftSoloNum
				elseif var_9_0 == 20 then
					var_9_6 = arg_1_0.leftHbqNum
				elseif var_9_0 == 4 then
					var_9_6 = math.floor(arg_1_0.freePhantomCount / 3)
				elseif var_9_0 == 5 then
					var_9_6 = arg_1_0.freePhantomCount
				end

				if arg_1_0.battleType == battleType.BATTLE_KFGZ then
					if var_9_4 then
						if var_9_6 > 0 then
							var_9_7 = var_9_6 >= 10 and 10 or var_9_6
						else
							var_9_7 = 10
						end
					end

					var_9_5 = arg_1_0.freePhantomCount > 0 and 0 or 20 * var_9_7

					if var_9_0 == 20 and arg_1_0.leftHbqNum == 0 then
						var_9_5 = arg_1_0.openHbq and 50 * var_9_7 or 0
					elseif var_9_0 == 4 then
						var_9_5 = 3 * var_9_7 > arg_1_0.freePhantomCount and (3 * var_9_7 - arg_1_0.freePhantomCount) * 20 or 0
					elseif var_9_0 > 0 and var_9_0 ~= 5 then
						var_9_5 = 0
					end

					if var_9_0 == 4 and var_9_7 > arg_1_0.leftFusion then
						var_9_5 = var_9_5 + 50 * (var_9_7 - arg_1_0.leftFusion)
					elseif var_9_0 == 5 and var_9_7 > arg_1_0.leftFision then
						var_9_5 = var_9_5 + 50 * (var_9_7 - arg_1_0.leftFision)
					end
				else
					if var_9_4 then
						if var_9_6 > 0 then
							var_9_7 = var_9_6 >= 10 and 10 or var_9_6
						else
							var_9_7 = 10
						end
					end

					var_9_5 = arg_1_0.freePhantomCount > 0 and 0 or 20 * var_9_7

					if var_9_0 == 4 then
						var_9_5 = 3 * var_9_7 > arg_1_0.freePhantomCount and (3 * var_9_7 - arg_1_0.freePhantomCount) * 20 or 0
					elseif var_9_0 > 0 and var_9_0 ~= 5 then
						var_9_5 = 0
					end
				end

				if var_9_5 > 0 then
					local var_9_8 = CCSprite:createWithSpriteFrameName("res_icon_19_small.png")
					local var_9_9 = CCLabelAtlas:create(tostring(var_9_5), "res/ui/common/number/up_numb.png", 16, 21, 48)

					var_9_9:setAnchorPoint(ccp(0.5, 0.5))

					local var_9_10 = createRichNode({
						var_9_8,
						var_9_9
					}, 0.5)

					var_9_10:setPosition(ccp(44, 74))
					var_8_2:addChild(var_9_10, 2, 104)
				else
					local var_9_11 = 190006
					local var_9_12 = ccc3(255, 255, 255)
					local var_9_13

					if var_9_0 == 0 or var_9_0 == 4 or var_9_0 == 5 then
						var_9_13 = arg_1_0.freePhantomCount

						if arg_1_0.phantomMax == 1 then
							var_9_11 = "190006_1"
							var_9_12 = ccc3(255, 0, 0)
						end
					else
						var_9_13 = var_9_6
					end

					local var_9_14 = CCStrokeLabelTTF:create(language.get(var_9_11, var_9_13 or 0), "Thonburi", 18)

					var_9_14:setPosition(ccp(44, 74))
					var_9_14:setColor(var_9_12)
					var_8_2:addChild(var_9_14, 2, 103)
				end

				if var_9_0 == 0 then
					if arg_1_0.juBenLeftJieBing then
						local var_9_15 = CCStrokeLabelTTF:create(tostring(arg_1_0.juBenLeftJieBing), "Thonburi", 18)

						var_9_15:setPosition(ccp(77, 18))
						var_8_2:addChild(var_9_15, 2)
					end

					log.info("@@ 国战借兵 ： ", arg_1_0.remainBuyPhantom)

					if not arg_1_0.isYz and arg_1_0.remainBuyPhantom and arg_1_0.remainBuyPhantom ~= 0 then
						local var_9_16 = CCStrokeLabelTTF:create(tostring(arg_1_0.remainBuyPhantom), "Thonburi", 18)

						var_9_16:setPosition(ccp(77, 18))
						var_8_2:addChild(var_9_16, 2)
					end
				end

				if var_9_0 == 4 or var_9_0 == 5 then
					local var_9_17

					if var_9_0 == 4 then
						var_9_17 = arg_1_0.leftFusion
					elseif var_9_0 == 5 then
						var_9_17 = arg_1_0.leftFision
					end

					local var_9_18 = CCStrokeLabelTTF:create(language.get("190006_1", var_9_17), "Thonburi", 15)

					var_9_18:setPosition(ccp(44, 56))
					var_9_18:setColor(ccc3(255, 0, 0))
					var_8_2:addChild(var_9_18, 2, 105)
				end

				if var_9_4 then
					arg_1_0.copyNum10 = var_9_7
					arg_1_0.copyGold10 = var_9_5
				else
					arg_1_0.copyGold = var_9_5
				end
			end

			var_8_13()

			local function var_8_14()
				log.info("switch fightRighthButton ", var_8_8.inMoveAnimation)

				if var_8_8.inMoveAnimation ~= true then
					local var_10_0, var_10_1 = var_8_8:getPosition()
					local var_10_2 = 1
					local var_10_3 = 100000

					for iter_10_0 = 1, #arg_1_0.availablePhantoms do
						local var_10_4 = math.abs(var_10_0 - (-89 + 96 * (2 - iter_10_0)))

						if var_10_4 < var_10_3 then
							var_10_3 = var_10_4
							var_10_2 = iter_10_0
						end
					end

					local function var_10_5()
						var_8_8.inMoveAnimation = false
						arg_1_0.currentPhantomType = arg_1_0.availablePhantoms[var_10_2]

						var_8_13()
					end

					var_8_8.inMoveAnimation = true

					local var_10_6 = CCArray:create()

					var_10_6:addObject(CCMoveTo:create(0.15, ccp(-89 + 96 * (2 - var_10_2), 0)))
					var_10_6:addObject(CCCallFuncN:create(var_10_5))

					local var_10_7 = CCSequence:create(var_10_6)

					var_8_8:runAction(var_10_7)
				end
			end

			local function var_8_15(arg_12_0)
				if var_8_8.inMoveAnimation ~= true then
					local var_12_0, var_12_1 = var_8_8:getPosition()

					var_8_8:setPosition(ccp(var_12_0 - arg_12_0 / 3, var_12_1))
				end
			end

			local function var_8_16(arg_13_0)
				if var_8_8.inMoveAnimation ~= true then
					local var_13_0, var_13_1 = var_8_8:getPosition()

					var_8_8:setPosition(ccp(var_13_0 + arg_13_0 / 3, var_13_1))
				end
			end

			function var_8_8.onEnter()
				eventManager.registerEvent("in_move_left", var_8_15)
				eventManager.registerEvent("in_move_right", var_8_16)
				eventManager.registerEvent("has_moved", var_8_14)
			end

			function var_8_8.onExit()
				eventManager.unregisterEvent("in_move_left", var_8_15)
				eventManager.unregisterEvent("in_move_right", var_8_16)
				eventManager.unregisterEvent("has_moved", var_8_14)
			end
		else
			var_8_2:addChild(var_8_3)
		end

		if var_8_1.name == "gyl" then
			if arg_1_0.officerTokenNum and arg_1_0.officerTokenNum > 0 then
				local var_8_17 = CCStrokeLabelTTF:create(string.format("×%s", arg_1_0.officerTokenNum), "Thonburi", 18)

				var_8_17:setPosition(ccp(62, 75))
				var_8_2:addChild(var_8_17, 2)
			else
				var_8_1.enable = false

				local var_8_18 = CCSprite:createWithSpriteFrameName(var_8_1.disable)

				var_8_18:setAnchorPoint(CCPointMake(0, 0))
				var_8_18:setPosition(CCPointMake(7, 0))
				var_8_2:addChild(var_8_18)
				var_8_3:setVisible(false)
			end
		elseif var_8_1.name == "lockCity" then
			if user.leftChainTimes and user.leftChainTimes > 0 then
				local var_8_19 = CCStrokeLabelTTF:create(string.format("×%s", user.leftChainTimes), "Thonburi", 18)

				var_8_19:setPosition(ccp(62, 75))
				var_8_2:addChild(var_8_19, 2)
			else
				var_8_1.enable = false

				local var_8_20 = CCSprite:createWithSpriteFrameName(var_8_1.disable)

				var_8_20:setAnchorPoint(CCPointMake(0, 0))
				var_8_20:setPosition(CCPointMake(7, 0))
				var_8_2:addChild(var_8_20)
				var_8_3:setVisible(false)
			end
		elseif var_8_1.name == "jtj" then
			if arg_1_0.teamTimes and arg_1_0.teamTimes > 0 then
				local var_8_21 = CCStrokeLabelTTF:create(language.get(190006, arg_1_0.teamTimes), "Thonburi", 18 + var_8_0.shadowFontSize)

				var_8_21:setPosition(ccp(44, 72))
				var_8_2:addChild(var_8_21, 2)
			end
		elseif var_8_1.name == "tucheng" then
			local function var_8_22()
				arg_1_0.slaughterCd = 0

				arg_1_0.rightButtonControl:update()
			end

			if arg_1_0.slaughterCd and arg_1_0.slaughterCd > 0 then
				local var_8_23 = createTimerLabel(arg_1_0.slaughterCd, language.get(122103), "Thonburi", 18, var_8_22, nil, nil, ccc3(255, 255, 0))

				var_8_23:setPosition(ccp(44, 72))
				var_8_2:addChild(var_8_23, 2)
			else
				local var_8_24 = CCStrokeLabelTTF:create(language.get(122104, arg_1_0.leftSTimes), "Thonburi", 18)

				var_8_24:setColor(ccc3(255, 255, 0))
				var_8_24:setPosition(ccp(44, 72))
				var_8_2:addChild(var_8_24, 2)
			end
		elseif var_8_1.name == "juntuanDantiao" then
			local function var_8_25()
				if arg_1_0.corpsInfo then
					arg_1_0.corpsInfo.soloCd = -1

					arg_1_0.rightButtonControl:update()
				end
			end

			if arg_1_0.corpsInfo and arg_1_0.corpsInfo.soloCd and arg_1_0.corpsInfo.soloCd > 0 then
				local var_8_26 = createTimerLabel(arg_1_0.corpsInfo.soloCd, language.get(122103), "Thonburi", 18, var_8_25, nil, nil, ccc3(255, 255, 0))

				var_8_26:setPosition(ccp(48, 72))
				var_8_2:addChild(var_8_26, 2)
			end
		elseif var_8_1.name == "shuaiqi" then
			local function var_8_27()
				arg_1_0.battleFlag.cd = -1

				arg_1_0.rightButtonControl:update()
			end

			if arg_1_0.battleFlag.cd and arg_1_0.battleFlag.cd > 0 then
				local var_8_28 = createTimerLabel(arg_1_0.battleFlag.cd, language.get(122103), "Thonburi", 18, var_8_27, nil, nil, ccc3(255, 255, 0))

				var_8_28:setPosition(ccp(44, 72))
				var_8_2:addChild(var_8_28, 2)
			elseif arg_1_0.battleFlag.num > 0 then
				local var_8_29 = CCStrokeLabelTTF:create(language.get(122104, arg_1_0.battleFlag.num), "Thonburi", 18)

				var_8_29:setColor(ccc3(255, 255, 0))
				var_8_29:setPosition(ccp(44, 72))
				var_8_2:addChild(var_8_29, 2)
			else
				local var_8_30 = CCSprite:createWithSpriteFrameName("res_icon_19_small.png")
				local var_8_31 = CCLabelAtlas:create(tostring(arg_1_0.battleFlag.battleFlagGold), "res/ui/common/number/up_numb.png", 16, 21, 48)

				var_8_31:setAnchorPoint(ccp(0.5, 0.5))

				local var_8_32 = createRichNode({
					var_8_30,
					var_8_31
				}, 0.5)

				var_8_32:setPosition(ccp(44, 74))
				var_8_2:addChild(var_8_32, 2, 104)
			end
		elseif var_8_1.name == "huoji" then
			local var_8_33 = CCStrokeLabelTTF:create(language.get(122104, arg_1_0.leftLitTimes), "Thonburi", 18)

			var_8_33:setColor(ccc3(255, 255, 0))
			var_8_33:setPosition(ccp(44, 72))
			var_8_2:addChild(var_8_33, 2)
		elseif var_8_1.name == "miehuo" then
			local var_8_34 = arg_1_0.fire.maxHp - arg_1_0.fire.hp
			local var_8_35 = CCStrokeLabelTTF:create(language.get(390478, var_8_34, arg_1_0.fire.maxHp), "Thonburi", 18)

			var_8_35:setColor(ccc3(122, 166, 231))
			var_8_35:setPosition(ccp(44, 72))
			var_8_2:addChild(var_8_35, 2)
		elseif var_8_1.name == "trap" then
			local var_8_36 = CCStrokeLabelTTF:create(language.get(122104, arg_1_0.wana.num), "Thonburi", 18)

			var_8_36:setColor(ccc3(255, 255, 0))
			var_8_36:setPosition(ccp(44, 72))
			var_8_2:addChild(var_8_36, 2)
		elseif var_8_1.name == "yuanzhengBomb" then
			local var_8_37 = CCStrokeLabelTTF:create(language.get(122104, user.bombNum), "Thonburi", 18)

			var_8_37:setColor(ccc3(255, 255, 0))
			var_8_37:setPosition(ccp(44, 72))
			var_8_2:addChild(var_8_37, 2)
		elseif var_8_1.name == "weishe" then
			if arg_1_0.arenaInfo.champion and arg_1_0.arenaInfo.champion.leftTimes and arg_1_0.arenaInfo.champion.leftTimes > 0 then
				local var_8_38 = CCStrokeLabelTTF:create(string.format("×%s", arg_1_0.arenaInfo.champion.leftTimes), "Thonburi", 18)

				var_8_38:setPosition(ccp(62, 75))
				var_8_2:addChild(var_8_38, 2)
			else
				var_8_1.enable = false

				local var_8_39 = CCSprite:createWithSpriteFrameName(var_8_1.disable)

				var_8_39:setAnchorPoint(CCPointMake(0, 0))
				var_8_39:setPosition(CCPointMake(7, 0))
				var_8_2:addChild(var_8_39)
				var_8_3:setVisible(false)
			end
		elseif var_8_1.name == "chaofeng" and arg_1_0.arenaInfo.champion and arg_1_0.arenaInfo.champion.tauntLimitTime > 0 then
			local var_8_40 = createTimerLabel(arg_1_0.arenaInfo.champion.tauntLimitTime, language.get(122103), "Thonburi", 18, timeCallBack, nil, nil, ccc3(255, 255, 0))

			var_8_40:setPosition(ccp(44, 72))
			var_8_2:addChild(var_8_40, 2)
		end

		return var_8_2
	end

	function var_1_0.numberOfCellsInTableView(arg_19_0)
		local var_19_0 = #var_1_0.actions

		if var_19_0 then
			return var_19_0
		else
			return 0
		end
	end

	function var_1_0.tableCellTouched(arg_20_0, arg_20_1)
		var_0_0.touchIdx = arg_20_1:getIdx()

		local var_20_0 = var_1_0.actions[arg_20_1:getIdx() + 1]

		if not var_20_0.enable then
			return
		end

		if var_20_0 and var_20_0.callback then
			amgr.playEffect(enumAudioFile.ui_click_common)
			var_20_0.callback()
		end
	end

	function var_1_0.tableCellHightLight(arg_21_0, arg_21_1)
		local var_21_0 = var_1_0.actions[arg_21_1:getIdx() + 1]

		if not var_21_0.enable then
			return
		end

		local var_21_1 = tolua.cast(arg_21_1:getChildByTag(101), "CCSprite")

		if var_21_1 then
			log.info("!!!!!!!!!!!!!!")
			log.info(type(var_21_1))

			local var_21_2

			if var_21_0.name == "jiebing" then
				log.info("jiebing", arg_1_0.currentPhantomType)

				var_21_2 = PHANTOM_PIC[arg_1_0.currentPhantomType][2]
			elseif var_21_0.name == "jiebingX10" then
				log.info("jiebingX10", arg_1_0.currentPhantomType)

				var_21_2 = PHANTOM10_PIC[arg_1_0.currentPhantomType][2]
			end

			if var_21_2 then
				var_21_1:setDisplayFrame(tool.spriteFrameByName(var_21_2))
			end

			var_21_1:setVisible(true)
		end
	end

	function var_1_0.tableCellUnHightLight(arg_22_0, arg_22_1)
		if not var_1_0.actions[arg_22_1:getIdx() + 1].enable then
			return
		end

		local var_22_0 = tolua.cast(arg_22_1:getChildByTag(101), "CCSprite")

		if var_22_0 then
			var_22_0:setVisible(false)
		end
	end

	function var_1_0.open()
		if not var_0_0.open then
			var_0_0.open = true

			var_1_0.widgets.openButton:setVisible(false)
			var_1_0.widgets.closeButton:setVisible(true)
			var_1_0.widgets.butonBackground:runAction(CCFadeOut:create(0.5))
			var_1_0.widgets.rightSidebar:runAction(CCMoveBy:create(0.5, ccp(-120, 0)))
		end
	end

	function var_1_0.close()
		if var_0_0.open then
			var_0_0.open = false

			var_1_0.widgets.openButton:setVisible(true)
			var_1_0.widgets.closeButton:setVisible(false)
			var_1_0.widgets.butonBackground:runAction(CCFadeIn:create(0.5))
			var_1_0.widgets.rightSidebar:runAction(CCMoveBy:create(0.5, ccp(120, 0)))
		end
	end

	function var_1_0.init()
		local var_25_0 = require("res/layout/battle/rightSidebar")

		uiutil.initWidgets(var_1_0, var_25_0)

		if arg_1_0.battleType == battleType.BATTLE_OCCUPY then
			var_1_0.widgets.rightSidebar:setVisible(false)
		else
			var_1_0.widgets.rightSidebar:setVisible(true)
		end

		var_1_0.widgets.actionView:registerScriptHandler(var_1_0.tableCellHightLight, CCTableView.kTableCellHighLight)
		var_1_0.widgets.actionView:registerScriptHandler(var_1_0.tableCellUnHightLight, CCTableView.kTableCellUnhighLight)
		var_1_0.widgets.actionView:registerScriptHandler(var_1_0.tableCellTouched, CCTableView.kTableCellTouched)
		var_1_0.widgets.actionView:registerScriptHandler(var_1_0.cellSizeForTable, CCTableView.kTableCellSizeForIndex)
		var_1_0.widgets.actionView:registerScriptHandler(var_1_0.tableCellAtIndex, CCTableView.kTableCellSizeAtIndex)
		var_1_0.widgets.actionView:registerScriptHandler(var_1_0.numberOfCellsInTableView, CCTableView.kNumberOfCellsInTableView)
		var_1_0.widgets.actionView:reloadData()
		var_1_0.widgets.openButton:addHandleOfControlEvent(var_1_0.open, CCControlEventTouchUpInside)
		var_1_0.widgets.closeButton:addHandleOfControlEvent(var_1_0.close, CCControlEventTouchUpInside)
	end

	var_1_0.initAction()
	var_1_0.init()

	function var_1_0.widgets.rightSidebar.onEnter(...)
		local function var_26_0()
			if arg_1_0 and arg_1_0.battleFlag and arg_1_0.battleFlag.cd and arg_1_0.battleFlag.cd > 0 then
				arg_1_0.battleFlag.cd = arg_1_0.battleFlag.cd - 1000
			end

			if arg_1_0 and arg_1_0.corpsInfo and arg_1_0.corpsInfo.soloCd and arg_1_0.corpsInfo.soloCd > 0 then
				arg_1_0.corpsInfo.soloCd = arg_1_0.corpsInfo.soloCd - 1000
			end
		end

		arg_1_0.shuaiqiScheduler = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_26_0, 1, false)
	end

	function var_1_0.widgets.rightSidebar.onExit(...)
		if arg_1_0.shuaiqiScheduler then
			CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_1_0.shuaiqiScheduler)
		end
	end

	initScriptEventNode(var_1_0.widgets.rightSidebar)
	arg_1_0.layerTabel.uiLayer:addChild(var_1_0.widgets.rightSidebar, 0, uiTag.fightButton)

	return var_0_0
end

function var_0_0.updateArena(arg_29_0, arg_29_1, arg_29_2)
	log.info("-------------updateArena!!!----------------arenaType:" .. arg_29_1 .. "  battleType:" .. arg_29_0)

	if arg_29_0 ~= battleType.BATTLE_CITY and arg_29_0 ~= battleType.BATTLE_KFGZ then
		return
	end

	var_0_0:changeAndUpdate("jiaozhen", true)
	var_0_0:changeAndUpdate("weishe", true)
	var_0_0:changeAndUpdate("yinzhan", true)
	var_0_0:changeAndUpdate("chaofeng", true)

	local var_29_0

	if arg_29_2 then
		var_29_0 = arg_29_2.forceId
	else
		var_29_0 = 1
	end

	if arg_29_1 == 0 then
		-- block empty
	elseif arg_29_1 == 1 then
		var_0_0:changeAndUpdate("jiaozhen")
	elseif arg_29_1 == 2 and (var_29_0 == user.player.forceId or var_29_0 == user.player.kfgzForceId) then
		var_0_0:changeAndUpdate("weishe")

		if arg_29_2 and arg_29_2.inTaunt == 0 and arg_29_2.tauntLimitTime > 0 then
			var_0_0:changeAndUpdate("chaofeng")
		end
	elseif arg_29_1 == 3 then
		var_0_0:changeAndUpdate("yinzhan")
	end
end
