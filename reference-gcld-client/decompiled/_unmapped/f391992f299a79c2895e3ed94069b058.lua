diamond.control = {}
diamond.data = {}
diamond.totalCount = 0
diamond.isjinjie = false
diamond.backupData = {}
diamond.backupIndex = 0
diamond.jinjieSelectIds = {}
diamond.jinjieTotalExp = 0
diamond.lastJinjieVid = 0

function diamond.control.gemSort(arg_1_0, arg_1_1)
	if arg_1_0.goodsType == 1 and arg_1_1.goodsType == 2 then
		return true
	elseif arg_1_0.goodsType == 2 and arg_1_1.goodsType == 1 then
		return false
	end

	if arg_1_0.goodsType > arg_1_1.goodsType then
		return true
	elseif arg_1_0.goodsType < arg_1_1.goodsType then
		return false
	end

	if arg_1_0.goodsType == arg_1_1.goodsType then
		if tonumber(arg_1_0.goodsType) == 1 then
			if arg_1_0.gemLv == arg_1_1.gemLv then
				return arg_1_0.curPs > arg_1_1.curPs
			else
				return arg_1_0.gemLv > arg_1_1.gemLv
			end
		else
			return arg_1_0.gemLv > arg_1_1.gemLv
		end
	else
		return arg_1_0.goodsType < arg_1_1.goodsType
	end

	return false
end

function diamond.control.find_last_jingshi_index()
	for iter_2_0, iter_2_1 in ipairs(diamond.data.gem) do
		if iter_2_1.goodsType == 1 then
			diamond.ui.selectIndex = iter_2_0
		end
	end
end

function diamond.control.find_last_fenjie_index()
	for iter_3_0, iter_3_1 in ipairs(diamond.data.gem) do
		if iter_3_1.goodsType == 2 and iter_3_1.gemLv > 1 then
			diamond.ui.selectIndex = iter_3_0
		end
	end
end

function diamond.control.find_last_hecheng_index()
	for iter_4_0, iter_4_1 in ipairs(diamond.data.gem) do
		if iter_4_1.goodsType == 2 and iter_4_1.num > 1 then
			diamond.ui.selectIndex = iter_4_0
		end
	end
end

function diamond.control.find_last_jinjie_index()
	for iter_5_0, iter_5_1 in ipairs(diamond.data.gem) do
		if diamond.lastJinjieVid == iter_5_1.vId then
			diamond.ui.selectIndex = iter_5_0
		end
	end
end

function diamond.control.find_last_jinhua_index()
	log.info("QQQ:find jinhua")

	for iter_6_0, iter_6_1 in ipairs(diamond.data.gem) do
		if diamond.lastSkill and diamond.constant.skillmap[diamond.lastSkill] then
			local var_6_0, var_6_1 = string.find(iter_6_1.gemPic, diamond.constant.skillmap[diamond.lastSkill])

			if var_6_0 and var_6_1 then
				diamond.ui.selectIndex = iter_6_0
			end
		end
	end
end

function diamond.control.receive_gemInfo(arg_7_0)
	if diamond.isjinjie == true then
		return
	end

	local var_7_0 = arg_7_0.action.data

	diamond.data = var_7_0
	var_7_0.godMaxLv = 10
	var_7_0.haveSpSlaughter = true
	var_7_0.haveGodBrilliant = false

	for iter_7_0, iter_7_1 in ipairs(var_7_0.godBrilliants) do
		if iter_7_1.gemLv < 10 then
			var_7_0.haveSpSlaughter = false
		end

		if iter_7_1.num > 0 then
			var_7_0.haveGodBrilliant = true
		end
	end

	table.sort(var_7_0.jsLvNums, function(arg_8_0, arg_8_1)
		return arg_8_0.lv < arg_8_1.lv
	end)
	table.sort(var_7_0.brilliantNums, function(arg_9_0, arg_9_1)
		return arg_9_0.lv < arg_9_1.lv
	end)
	table.sort(var_7_0.godNums, function(arg_10_0, arg_10_1)
		return arg_10_0.lv < arg_10_1.lv
	end)

	diamond.totalCount = 0

	if var_7_0 ~= nil then
		diamond.totalCount = #var_7_0.gem
	end

	if diamond.totalCount > 0 then
		table.sort(var_7_0.gem, diamond.control.gemSort)

		if diamond.ui.action == 0 or diamond.ui.action == 1 then
			diamond.ui.selectIndex = 0

			if diamond.ui.selectIndex == 0 then
				diamond.control.find_last_hecheng_index()
			end

			if diamond.ui.selectIndex == 0 then
				diamond.control.find_last_fenjie_index()
			end

			if diamond.ui.selectIndex == 0 then
				diamond.ui.selectIndex = 1
			end
		elseif diamond.ui.action == 3 then
			diamond.control.find_last_jingshi_index()
		elseif diamond.ui.action == 5 then
			diamond.control.find_last_jinjie_index()
		end
	end

	if diamond.isJinhua then
		diamond.isJinhua = false

		diamond.control.find_last_jinhua_index()
	end

	diamond.ui.showJinglianActivity(diamond.data)
	diamond.ui.createDiamondList()

	if var_7_0.spSlaughters then
		diamond.ui.createSelectPanel()
	end

	diamond.isFirst = false
end

function diamond.control.request_gemInfo()
	cmgr.sendRequest(diamond.control.receive_gemInfo, actions.getGemInfo)
end

function diamond.control.request_weaponRank()
	local function var_12_0(arg_13_0)
		user.weaponRank = arg_13_0.action.data.weaponRank
	end

	cmgr.sendRequest(var_12_0, actions.getWeaponInfo)
end

function diamond.control.receive_gemMake(arg_14_0)
	if arg_14_0.action.state == 1 then
		diamond.ui.action = 1

		diamond.control.request_gemInfo()
	end
end

function diamond.control.clicked_hecheng()
	local var_15_0 = diamond.data.gem[diamond.ui.selectIndex]

	cmgr.sendRequest(diamond.control.receive_gemMake, actions.makeGem, var_15_0.gemId, 1)
end

function diamond.control.receive_unMakeGem(arg_16_0)
	if arg_16_0.action.state == 1 then
		diamond.ui.action = 2

		diamond.control.request_gemInfo()
	end
end

function diamond.control.clicked_chaijie()
	local var_17_0 = diamond.data.gem[diamond.ui.selectIndex]

	cmgr.sendRequest(diamond.control.receive_unMakeGem, actions.unMakeGem, var_17_0.gemId)
end

function diamond.control.receive_damo(arg_18_0)
	if arg_18_0.action.state == 1 then
		diamond.ui.action = 3

		diamond.control.request_gemInfo()

		local var_18_0 = CCSprite:create("res/ui/weapon/diamond/bsjl_tit_dmcg.png")
		local var_18_1 = visibleSize.width / 2 - 450.5 + 560
		local var_18_2 = visibleSize.height / 2 - 259.5 + 342

		var_18_0:setPosition(ccp(var_18_1, var_18_2))
		smgr.showTipSpriteText(var_18_0)
	end
end

function diamond.control.clicked_damo()
	local var_19_0 = diamond.data.gem[diamond.ui.selectIndex]

	if diamond.data.godEnchancerOpen == true then
		messageBox.confirmWithCheckbox("", language.get(122088), "gemPolish", function()
			cmgr.sendRequest(diamond.control.receive_damo, actions.damo, var_19_0.gemId)
		end)
	else
		messageBox.showChargeWin("", language.get(122058, diamond.data.goldDamo), "gemDamo", function()
			cmgr.sendRequest(diamond.control.receive_damo, actions.damo, var_19_0.gemId)
		end)
	end
end

function diamond.control.clicked_jinjie()
	diamond.isjinjie = true
	diamond.ui.isJinshiMax = false
	diamond.jinjieSelectIds = {}
	diamond.jinjieTotalExp = 0
	diamond.backupData = deepcopy(diamond.data)

	local var_22_0 = diamond.data.gem[diamond.ui.selectIndex]
	local var_22_1 = diamond.constant.BAOSHI

	if var_22_0.goodsType == diamond.constant.SHENSHI then
		var_22_1 = diamond.constant.JINGSHI2
	end

	for iter_22_0 = #diamond.data.gem, 1, -1 do
		if diamond.data.gem[iter_22_0].goodsType ~= var_22_1 then
			table.remove(diamond.data.gem, iter_22_0)
		end
	end

	diamond.totalCount = #diamond.data.gem
	diamond.backupIndex = diamond.ui.selectIndex
	diamond.ui.selectIndex = 0

	if diamond.totalCount > 0 then
		diamond.ui.selectIndex = 1
	end

	diamond.ui.createDiamondList()
	diamond.ui.table.jinjie_select:setVisible(true)
	diamond.ui.table.btn_ok:setVisible(true)
	diamond.ui.table.btn_cancel:setVisible(true)
	diamond.ui.table.title_ok:setVisible(true)
	diamond.ui.table.title_cancel:setVisible(true)
	diamond.ui.table.btn_jinjie2:setVisible(false)
	diamond.ui.table.btn_jinhua:setVisible(false)
	diamond.ui.table.title_jinjie2:setVisible(false)
	diamond.ui.table.title_jinhua:setVisible(false)
	diamond.ui.table.jinjie:setVisible(false)

	local var_22_2 = diamond.backupData.gem[diamond.backupIndex]

	diamond.ui.table.jinjie_2:setPercentage(var_22_2.curPs * 100 / var_22_2.maxPs)
	diamond.ui.table.jinjie_2:setVisible(true)
end

function diamond.control.receive_jinjie(arg_23_0)
	if arg_23_0.action.state == 1 then
		diamond.ui.action = 5
		diamond.isjinjie = false

		diamond.ui.run_action_play_anim_jinshi()
		diamond.control.request_gemInfo()
	end
end

function diamond.control.clicked_jinjie_ok()
	local var_24_0 = #diamond.jinjieSelectIds

	if var_24_0 == 0 then
		diamond.control.clicked_jinjie_cancel()

		return
	end

	local var_24_1 = ""

	for iter_24_0 = 1, var_24_0 do
		if iter_24_0 == var_24_0 then
			var_24_1 = var_24_1 .. diamond.jinjieSelectIds[iter_24_0]
		else
			var_24_1 = var_24_1 .. diamond.jinjieSelectIds[iter_24_0] .. ","
		end
	end

	diamond.ui.selectIndex = diamond.backupIndex

	local var_24_2 = diamond.backupData.gem[diamond.backupIndex]

	diamond.lastJinjieVid = var_24_2.vId

	if var_24_2.goodsType == diamond.constant.JINENGSHI then
		cmgr.sendRequest(diamond.control.receive_jinjie, actions.brilliantUpgrade, var_24_2.vId, var_24_1)
	elseif var_24_2.goodsType == diamond.constant.JINGSHI then
		cmgr.sendRequest(diamond.control.receive_jinjie, actions.jinjie, var_24_2.vId, var_24_1)
	elseif var_24_2.goodsType == diamond.constant.SHENSHI then
		cmgr.sendRequest(diamond.control.receive_jinjie, actions.gemGodUpgrade, var_24_2.vId, var_24_1)
	end

	if diamond.ui.table.select_layer ~= nil then
		diamond.ui.table.bg:removeChild(diamond.ui.table.select_layer, true)

		diamond.ui.table.select_layer = nil
	end

	diamond.ui.table.jinjie_select:setVisible(false)
	diamond.ui.table.anim_jindu:setVisible(false)
end

function diamond.control.clicked_jinjie_cancel()
	diamond.isjinjie = false
	diamond.data = nil
	diamond.data = deepcopy(diamond.backupData)
	diamond.totalCount = #diamond.data.gem
	diamond.ui.selectIndex = diamond.backupIndex

	diamond.ui.createDiamondList()

	if diamond.ui.table.select_layer ~= nil then
		diamond.ui.table.bg:removeChild(diamond.ui.table.select_layer, true)

		diamond.ui.table.select_layer = nil
	end

	diamond.ui.table.jinjie_select:setVisible(false)
	diamond.ui.table.anim_jindu:setVisible(false)
end

function diamond.control.recevie_jinglian(arg_26_0)
	if arg_26_0.action.state == 1 then
		if arg_26_0.action.data.jinLianActivityExtEffect then
			local var_26_0 = 1
			local var_26_1 = arg_26_0.action.data.jinLianActivityExtEffect

			if var_26_1 == 1 then
				var_26_0 = 1
			elseif var_26_1 == 2 or var_26_1 == 3 then
				var_26_0 = 2
			elseif var_26_1 == 4 then
				var_26_0 = 3
			end

			globalAction_flyNode(CCSprite:create("res/ui/weapon/jldfs_word_0" .. var_26_0 .. ".png"))
		end

		if diamond.isjinjie == true then
			diamond.backupData.gem[diamond.backupIndex].skills = arg_26_0.action.data.skills

			local var_26_2 = diamond.backupData.gem[diamond.backupIndex]

			diamond.ui.update_selectedDiamond_skill(var_26_2)
		else
			diamond.ui.action = 4

			local var_26_3 = diamond.data.gem[diamond.ui.selectIndex]

			if var_26_3.skills[1].lv < arg_26_0.action.data.skills[1].lv then
				local var_26_4 = CCSprite:create("res/ui/weapon/diamond/jsjh_word_jnqh.png")

				var_26_4:setPosition(ccp(560, 260))
				diamond.ui.table.bg:addChild(var_26_4, 100)

				local function var_26_5()
					var_26_4:removeFromParentAndCleanup(true)
					diamond.control.request_gemInfo()
				end

				local var_26_6 = CCArray:create()

				var_26_6:addObject(CCDelayTime:create(1.3))
				var_26_6:addObject(CCCallFuncN:create(var_26_5))

				local var_26_7 = CCSequence:create(var_26_6)

				var_26_4:runAction(CCSequence:create(var_26_6))

				local var_26_8 = CCSprite:create("res/ui/weapon/diamond/warlock_tit_" .. var_26_3.skills[1].pic .. "_red.png")

				var_26_8:setPosition(ccp(710, 260))
				diamond.ui.table.bg:addChild(var_26_8, 99)

				local function var_26_9()
					var_26_8:removeFromParentAndCleanup(true)
				end

				local var_26_10 = CCArray:create()

				var_26_10:addObject(CCMoveTo:create(1, ccp(410, 260)))
				var_26_10:addObject(CCCallFuncN:create(var_26_9))

				local var_26_11 = CCSequence:create(var_26_10)

				var_26_8:runAction(CCSequence:create(var_26_10))
			else
				diamond.control.request_gemInfo()
			end
		end
	end
end

function diamond.control.clicked_jinglian(arg_29_0)
	local var_29_0 = diamond.data.gem[diamond.ui.selectIndex]

	if diamond.isjinjie == true then
		var_29_0 = diamond.backupData.gem[diamond.backupIndex]
	end

	if user.chargeItems.gemJinglian.noDisturb or diamond.data.freeGemTimes > 0 then
		if var_29_0.goodsType == diamond.constant.JINENGSHI then
			cmgr.sendRequest(diamond.control.recevie_jinglian, actions.brilliantRefine, var_29_0.vId)
		else
			cmgr.sendRequest(diamond.control.recevie_jinglian, actions.jinglian, var_29_0.vId, arg_29_0)
		end
	else
		require("lua/component/messageBox")
		messageBox.showChargeWin(language.get(10003), language.get(122059, diamond.data.goldJinglian), "gemJinglian", function()
			if var_29_0.goodsType == diamond.constant.JINENGSHI then
				cmgr.sendRequest(diamond.control.recevie_jinglian, actions.brilliantRefine, var_29_0.vId)
			else
				cmgr.sendRequest(diamond.control.recevie_jinglian, actions.jinglian, var_29_0.vId, arg_29_0)
			end
		end)
	end
end

function diamond.control.receive_evolution(arg_31_0)
	diamond.isJinhua = true

	diamond.control.request_gemInfo()
end

function diamond.control.clicked_evolution()
	local var_32_0 = diamond.data.gem[diamond.ui.selectIndex]

	local function var_32_1()
		if var_32_0.goodsType == diamond.constant.JINGSHI then
			cmgr.sendRequest(diamond.control.receive_evolution, actions.evolution, var_32_0.vId)
		elseif var_32_0.goodsType == diamond.constant.JINENGSHI then
			cmgr.sendRequest(diamond.control.receive_evolution, actions.godEvolution, var_32_0.vId)
		end
	end

	if var_32_0.goodsType == diamond.constant.JINGSHI then
		require("lua/component/messageBox")
		messageBox.confirm(language.get(122074), var_32_1, language.get(10001), nil)
	elseif var_32_0.goodsType == diamond.constant.JINENGSHI then
		require("lua/component/messageBox")
		messageBox.confirm(language.get(122080), var_32_1, language.get(10001), nil)
	end
end

function diamond.control.onAutoBuyBtnTouched()
	local var_34_0 = diamond.ui.table.checkedBtn:isVisible()
	local var_34_1 = 1

	if var_34_0 then
		var_34_1 = 0
	end

	cmgr.sendRequest(function(...)
		if var_34_0 then
			user.chargeItems.gemJinglian.noDisturb = nil
		else
			user.chargeItems.gemJinglian.noDisturb = true
		end

		diamond.ui.table.checkedBtn:setVisible(not var_34_0)
	end, actions.noDisturb, var_34_1, "gemJinglian")
end

function diamond.control.selectSpSlaughter(arg_36_0)
	local function var_36_0(arg_37_0)
		local var_37_0 = arg_37_0.action.data

		diamond.ui.table.bg_spSlaughters:removeFromParentAndCleanup(true)

		diamond.ui.table.bg_spSlaughters = nil

		local var_37_1, var_37_2 = tool.getPositionInScreen(diamond.ui.table.center)
		local var_37_3 = CCSprite:create("res/ui/weapon/diamond/jnssj_word_tcsj.png")

		var_37_3:setPosition(var_37_1, var_37_2)
		smgr.showTipSpriteText(var_37_3, function()
			diamond.isFirst = true

			diamond.control.request_gemInfo()
		end)
	end

	local var_36_1 = diamond.data.spSlaughters[arg_36_0]

	messageBox.confirm(language.get(122087, language.get(diamond.constant.terrain[var_36_1].txtId)), function()
		cmgr.sendRequest(var_36_0, actions.gemSpSlaughter, var_36_1)
	end)
end
