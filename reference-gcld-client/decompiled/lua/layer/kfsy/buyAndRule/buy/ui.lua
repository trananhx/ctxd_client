require("lua/layer/kfsy/buyAndRule/buy/control")
require("lua/layer/kfsy/buyAndRule/buy/uidata")

kfsyBuyUI = {}
kfsyBuyUI.uiTable = {}

local var_0_0 = kfsyBuyControl
local var_0_1 = kfsyBuyConstant

function kfsyBuyUI.calcu(arg_1_0)
	local var_1_0

	if arg_1_0 then
		var_1_0 = arg_1_0.action.data
	elseif kfsyInfo.feastInfo.response then
		var_1_0 = kfsyInfo.feastInfo.response.action.data
	else
		return
	end

	local var_1_1 = {}

	var_1_1[1] = -1
	var_1_1[2] = -1
	var_1_1[3] = -1

	local var_1_2 = {}

	var_1_2[1] = 0
	var_1_2[2] = 0
	var_1_2[3] = 0

	for iter_1_0 = 1, 16 do
		if var_1_0.rooms[iter_1_0] then
			local var_1_3 = var_1_0.rooms[iter_1_0].weiNum + var_1_0.rooms[iter_1_0].shuNum + var_1_0.rooms[iter_1_0].wuNum

			if var_1_3 > var_1_1[1] then
				var_1_1[3] = var_1_1[2]
				var_1_1[2] = var_1_1[1]
				var_1_1[1] = var_1_3
				var_1_2[3] = var_1_2[2]
				var_1_2[2] = var_1_2[1]
				var_1_2[1] = iter_1_0
			elseif var_1_3 > var_1_1[2] then
				var_1_1[3] = var_1_1[2]
				var_1_1[2] = var_1_3
				var_1_2[3] = var_1_2[2]
				var_1_2[2] = iter_1_0
			elseif var_1_3 > var_1_1[3] then
				var_1_1[3] = var_1_3
				var_1_2[3] = iter_1_0
			end
		end
	end

	kfsyBuyUI.uiTable.first:setString(var_1_2[1])
	kfsyBuyUI.uiTable.second:setString(var_1_2[2])
	kfsyBuyUI.uiTable.third:setString(var_1_2[3])
	kfsyBuyUI.uiTable.firstID:setString(var_1_0.rooms[var_1_2[1]].playerName)
	kfsyBuyUI.uiTable.secondID:setString(var_1_0.rooms[var_1_2[2]].playerName)
	kfsyBuyUI.uiTable.thridID:setString(var_1_0.rooms[var_1_2[3]].playerName)
end

function kfsyBuyUI.show()
	log.info("kfsyBuyUI.show")

	local var_2_0 = createBaseLayer()

	kfsyBuyUI.uiTable = autoUI.initUI(var_2_0, getKfsyBuyData())

	kfsyBuyUI.uiTable.kuang:setScaleX(2)
	kfsyBuyUI.uiTable.kuang:setScaleX(1.5)

	local var_2_1 = CCLabelAtlas:create(tostring(1), "res/ui/kfsy/kfsy_gms.png", 26, 25, 48)

	var_2_1:setPosition(ccp(450, 130))
	kfsyBuyUI.uiTable.bg:addChild(var_2_1)

	local var_2_2 = CCLabelAtlas:create(tostring(10), "res/ui/kfsy/kfsy_gms.png", 26, 25, 48)

	var_2_2:setPosition(ccp(600, 130))
	kfsyBuyUI.uiTable.bg:addChild(var_2_2)

	local var_2_3 = CCLabelAtlas:create(tostring(10000), "res/ui/kfsy/kfsy_gms.png", 26, 25, 48)

	var_2_3:setPosition(ccp(755, 130))
	kfsyBuyUI.uiTable.bg:addChild(var_2_3)
	require("lua/layer/kfsy/feastInfo")

	if kfsyInfo.feastInfo.response then
		showTable(kfsyInfo.feastInfo.response)

		local var_2_4 = kfsyInfo.feastInfo.response.action.data

		kfsyBuyUI.uiTable.yuanbaoNum1:setString(var_2_4.goldCard1)
		kfsyBuyUI.uiTable.yuanbaoNum2:setString(var_2_4.goldCard10)
		kfsyBuyUI.uiTable.yuanbaoNum3:setString(var_2_4.goldDrink)
		kfsyBuyUI.calcu()

		if var_2_4.isTop16 ~= true then
			local var_2_5 = GraySprite:create("res/ui/kfsy/kfsy_jh.png")

			var_2_5:setPosition(ccp(750, 135))
			kfsyBuyUI.uiTable.bg:addChild(var_2_5)

			local var_2_6 = CCLabelTTF:create(language.get(320403), "Thonburi", 23)

			var_2_6:setPosition(ccp(750, 65))
			kfsyBuyUI.uiTable.bg:addChild(var_2_6)
			kfsyBuyUI.uiTable.buyButton3:setVisible(false)
			kfsyBuyUI.uiTable.goumai3:setVisible(false)
			kfsyBuyUI.uiTable.yuanbao3:setVisible(false)
			kfsyBuyUI.uiTable.yuanbaoNum3:setVisible(false)
			kfsyBuyUI.uiTable.dacha3:setVisible(false)
			kfsyBuyUI.uiTable.jiuhu:setVisible(false)
			var_2_3:setVisible(false)
		end
	end

	function kfsyBuyUI.update(arg_3_0)
		if arg_3_0.action.data then
			local var_3_0 = arg_3_0.action.data

			kfsyBuyUI.uiTable.yuanbaoNum1:setString(var_3_0.goldCard1)
			kfsyBuyUI.uiTable.yuanbaoNum2:setString(var_3_0.goldCard10)
			kfsyBuyUI.uiTable.yuanbaoNum3:setString(var_3_0.goldDrink)
		end
	end

	return var_2_0
end
