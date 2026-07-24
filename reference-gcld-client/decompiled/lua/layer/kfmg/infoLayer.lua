local var_0_0 = class("yzInfoLayer", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.world = arg_2_1
end

function var_0_0.handlerWinOrFailure(arg_3_0, arg_3_1)
	if not arg_3_1 then
		return
	end

	arg_3_0.data = arg_3_1 or {}
	arg_3_0.uiTable = autoUI.initUI(arg_3_0, arg_3_0:getData())

	arg_3_0.uiTable.goBackMainCity:registerScriptTapHandler(function()
		kfcmgr.sendRequest(nil, actions.kfLeave)
		pcall(kfcmgr.disconnectFromServer)
		smgr.changeScene(SCENE_MAIN_CITY)
	end)
	arg_3_0.uiTable.continueWatch:registerScriptTapHandler(function()
		arg_3_0.uiTable.shibai_bg:removeFromParentAndCleanup(true)
	end)

	if arg_3_0.data.mgOver == -1 and arg_3_0.world.KfmgServerInfos then
		for iter_3_0, iter_3_1 in ipairs(arg_3_0.world.KfmgServerInfos) do
			if iter_3_1.nation == arg_3_0.data.attackForce and not tolua.isnull(arg_3_0.uiTable.serverNameLabel) then
				arg_3_0.uiTable.serverNameLabel:setString("【" .. iter_3_1.serverName .. "】")
			end
		end
	end

	local var_3_0 = 0

	if arg_3_0.data.deltaMine and arg_3_0.data.deltaMine ~= 0 then
		local var_3_1 = language.get("hw_kfmg_000023", "+" .. arg_3_0.data.deltaMine)
		local var_3_2 = colorText.TJ_Green

		if arg_3_0.data.deltaMine < 0 then
			var_3_1 = language.get("hw_kfmg_000023", arg_3_0.data.deltaMine)
			var_3_2 = colorText.TJ_Red
		end

		arg_3_0.uiTable.mineLabel:setString(var_3_1)
		arg_3_0.uiTable.mineLabel:setColor(var_3_2)
		arg_3_0.uiTable.mineLabel:setVisible(true)

		var_3_0 = var_3_0 + 1
	end

	if arg_3_0.data.deltaNationExp and arg_3_0.data.deltaNationExp ~= 0 then
		arg_3_0.uiTable.nationExpLabel:setString(language.get("hw_kfmg_000028", "+" .. arg_3_0.data.deltaNationExp))
		arg_3_0.uiTable.nationExpLabel:setVisible(true)

		var_3_0 = var_3_0 + 1
	end

	if var_3_0 == 1 then
		arg_3_0.uiTable.mineLabel:setPosition(ccp(480, 104))
		arg_3_0.uiTable.nationExpLabel:setPosition(ccp(480, 104))
	end

	tool.fixNodePosByMid({
		arg_3_0.uiTable.serverNameLabel,
		arg_3_0.uiTable.nationNameLabel,
		arg_3_0.uiTable.attackPlayerNameLabel
	}, 55)
end

function var_0_0.getData(arg_6_0)
	local function var_6_0(arg_7_0, arg_7_1)
		arg_7_0[#arg_7_0 + 1] = arg_7_1

		return arg_7_1
	end

	local var_6_1 = ""

	if arg_6_0.data.mgOver == -1 then
		var_6_1 = "res/ui/kfmg/text/kfmgz_sj_meishuzi_ccxl.png"
	elseif arg_6_0.data.mgOver == 1 then
		var_6_1 = "res/ui/kfmg/text/kfmgz_sj_meishuzi_dhqs.png"
	elseif arg_6_0.data.mgOver == 2 then
		if arg_6_0.data.star and arg_6_0.data.star == 0 then
			var_6_1 = "res/ui/kfmg/text/kfmgz_sj_meishuzi_cbswcg.png"
		elseif arg_6_0.data.star and arg_6_0.data.star >= 1 then
			var_6_1 = "res/ui/kfmg/text/kfmgz_sj_meishuzi_zdsl.png"
		end
	end

	local var_6_2 = false

	if arg_6_0.data.mgOver == -1 and not arg_6_0.data.mgTotalOver then
		var_6_2 = true
	end

	local var_6_3 = {
		bg = {
			name = "shibai_bg",
			type = "pic",
			pic = "res/ui/kfmg/kfmgz_sj_tanchuang_2.png",
			x = visibleSize.width / 2,
			y = visibleSize.height / 2,
			children = {
				{
					xcenter = 0,
					top = 25,
					type = "pic",
					pic = var_6_1
				},
				{
					fontSize = 21,
					name = "nationExpLabel",
					type = "label",
					anchorPointX = 0,
					visible = false,
					y = 118,
					anchorPointY = 0.5,
					x = 480,
					text = language.get("hw_kfmg_000028", "+" .. 0),
					color = colorText.TJ_Green
				},
				{
					fontSize = 21,
					name = "mineLabel",
					type = "label",
					anchorPointX = 0,
					visible = false,
					y = 90,
					anchorPointY = 0.5,
					x = 480,
					text = language.get("hw_kfmg_000023", "+" .. 0),
					color = colorText.TJ_Yellow
				},
				{
					y = -30,
					type = "button",
					xcenter = var_6_2 and 130 or 0,
					buttons = {
						{
							pic2 = "frame:btn3_yel_c.png",
							name = "goBackMainCity",
							pic1 = "frame:btn3_yel_a.png",
							children = {
								{
									fontSize = 24,
									xcenter = 0,
									type = "label",
									ycenter = 0,
									text = language.get("hw_kfmg_000029"),
									color = colorText.TJ_Yellow
								}
							}
						}
					}
				},
				{
					y = -30,
					type = "button",
					xcenter = var_6_2 and -130 or 0,
					visible = var_6_2,
					buttons = {
						{
							pic2 = "frame:btn3_yel_c.png",
							name = "continueWatch",
							pic1 = "frame:btn3_yel_a.png",
							children = {
								{
									fontSize = 24,
									xcenter = 0,
									type = "label",
									ycenter = 0,
									text = language.get("hw_kfmg_000030"),
									color = colorText.TJ_Yellow
								}
							}
						}
					}
				}
			}
		}
	}

	if var_6_2 then
		var_6_0(var_6_3.bg.children, {
			xcenter = -190,
			z = 2,
			type = "pic",
			ycenter = -65,
			pic = "res/ui/kfmg/kfmgJunKu/kfmgz_jk_wupin_di_1.png",
			children = {
				{
					xcenter = 0,
					scale = 0.85,
					type = "pic",
					top = -30,
					pic = "res/ui/kfmg/text/kfmgz_sj_meishuzi_zhyjlz.png"
				},
				{
					xcenter = -1,
					type = "pic",
					ycenter = 1,
					pic = "",
					children = {
						{
							xcenter = 0,
							ycenter = 0,
							type = "pic",
							pic = "res/ui/common/playerHead/playerHead_icon_" .. arg_6_0.data.playerPic .. ".png"
						},
						{
							fontSize = 23,
							xcenter = 0,
							type = "label",
							y = -30,
							text = "Lv." .. arg_6_0.data.playerLv,
							color = colorText.TJ_Yellow
						}
					}
				},
				{
					fontSize = 19,
					name = "attackPlayerNameLabel",
					type = "label",
					y = -20,
					x = 0,
					anchorPointX = 0,
					text = " " .. arg_6_0.data.attackPlayerName,
					color = colorText.TJ_Yellow
				},
				{
					fontSize = 21,
					name = "nationNameLabel",
					type = "label",
					anchorPointX = 0,
					x = 0,
					y = -20,
					text = arg_6_0.world:getNationName(arg_6_0.data.attackForce),
					color = colorForce[arg_6_0.data.attackForce]
				},
				{
					fontSize = 21,
					name = "serverNameLabel",
					text = " ",
					type = "label",
					anchorPointX = 0,
					x = 0,
					y = -20,
					color = colorForce[arg_6_0.data.attackForce]
				}
			}
		})
	end

	local var_6_4 = var_6_0(var_6_3.bg.children, {
		xcenter = 0,
		type = "pic",
		ycenter = -20,
		pic = "res/ui/kfmg/text/kfmgz_sj_meishuzi_xj.png",
		children = {}
	})

	for iter_6_0 = 1, 3 do
		local var_6_5 = "res/ui/kfmg/kfmgz_sj_icon_xingxing_1.png"

		if arg_6_0.data.star and iter_6_0 <= arg_6_0.data.star then
			var_6_0(var_6_4.children, {
				ycenter = -55,
				pic = "res/ui/kfmg/kfmgz_sj_icon_xingxing_1.png",
				type = "pic",
				xcenter = 0 + (iter_6_0 - 2) * 60
			})

			var_6_5 = "res/ui/kfmg/kfmgz_sj_icon_xingxing_2.png"
		end

		var_6_0(var_6_4.children, {
			ycenter = -55,
			type = "pic",
			pic = var_6_5,
			xcenter = 0 + (iter_6_0 - 2) * 60
		})
	end

	return var_6_3
end

function var_0_0.onEnter(arg_8_0)
	return
end

function var_0_0.onExit(arg_9_0)
	local var_9_0 = tolua.getpeer(arg_9_0)

	for iter_9_0, iter_9_1 in pairs(var_9_0) do
		arg_9_0[iter_9_0] = nil
	end
end

return var_0_0
