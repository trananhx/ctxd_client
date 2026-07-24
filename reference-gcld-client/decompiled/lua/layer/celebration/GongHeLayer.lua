require("lua/layer/kfsy/constant")

local var_0_0
local var_0_1 = class("GongHeLayer", function()
	return createBaseLayer()
end)

var_0_1.tipFrame = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(1, 0),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			name = "tipMsg",
			height = 0,
			type = "label",
			width = 200,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}

local function var_0_2(arg_2_0)
	log.info("@@ receive_celebrate ")

	local var_2_0 = arg_2_0.action.data
	local var_2_1 = {}

	for iter_2_0, iter_2_1 in ipairs(var_2_0.rewards) do
		local var_2_2 = {}

		if iter_2_1.rewardType == "yh" then
			var_2_2.id = 10008
		elseif iter_2_1.rewardType == "xl" then
			var_2_2.id = 10003
		elseif iter_2_1.rewardType == "exp" then
			var_2_2.id = 6
		end

		var_2_2.value = iter_2_1.rewardNum

		table.insert(var_2_1, var_2_2)
	end

	globalAction_gotResource(var_2_1)
	var_0_0.gonghe:setVisible(false)
	var_0_0.gongheEmpty:setVisible(true)

	if user.player.gonghe > 0 then
		user.player.gonghe = user.player.gonghe - 1
	end

	log.info("@@ 剩下的恭贺： " .. user.player.gonghe)
	notice.control.update()
	notice.ui.update()
end

local function var_0_3(arg_3_0)
	cmgr.sendRequest(var_0_2, actions.celebrate, arg_3_0)
end

function var_0_1.ctor(arg_4_0, arg_4_1)
	arg_4_0:init(arg_4_1)
end

function var_0_1.init(arg_5_0, arg_5_1)
	arg_5_0.runActionSprite = CCSprite:create()
	arg_5_0.peopleSprite = CCSprite:create("res/ui/kfsy/150150.png")

	arg_5_0.peopleSprite:setPosition(ccp(-490, -305))
	arg_5_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
	arg_5_0:addChild(arg_5_0.runActionSprite, 102)
	arg_5_0.runActionSprite:setPosition(ccp(-540, -355))
	arg_5_0:addChild(arg_5_0.peopleSprite, 101)

	local var_5_0 = arg_5_1.data or arg_5_1.action.data
	local var_5_1

	if celebration.celeType == 1 then
		var_5_1 = "res/ui/common/generalPic/generalPic_" .. var_5_0.pic .. ".jpg"
	elseif celebration.celeType == 5 then
		var_5_1 = "res/ui/common/generalPic/generalPic_" .. var_5_0.pic .. ".jpg"
	elseif celebration.celeType == 6 then
		var_5_1 = "res/ui/weapon/jinengshi5.png"
	elseif celebration.celeType == 7 then
		var_5_1 = "res/ui/weapon/diamond/tucheng.png"
	elseif celebration.celeType == 8 then
		if var_5_0.pic == "szjzf" then
			var_5_1 = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
		elseif var_5_0.pic == "sbdzj" then
			var_5_1 = "res/ui/weapon/silkTreasure/treasure_icon/jiatu.png"
		elseif var_5_0.pic == "llgd" then
			var_5_1 = "res/ui/weapon/silkTreasure/treasure_icon/duntu.png"
		elseif var_5_0.pic == "dmsgd" then
			var_5_1 = "res/ui/weapon/silkTreasure/treasure_icon/daotu.png"
		elseif var_5_0.pic == "ksdhg" then
			var_5_1 = "res/ui/weapon/silkTreasure/treasure_icon/guantu.png"
		elseif var_5_0.pic == "fnlypf" then
			var_5_1 = "res/ui/weapon/silkTreasure/treasure_icon/pifengtu.png"
		elseif var_5_0.pic == "hzcq" then
			var_5_1 = "res/ui/weapon/silkTreasure/treasure_icon/qiangtu.png"
		elseif var_5_0.pic == "gszk" then
			var_5_1 = "res/ui/weapon/silkTreasure/treasure_icon/kuitu.png"
		else
			var_5_1 = "res/ui/weapon/silkTreasure/treasure_icon/shutu.png"
		end
	elseif celebration.celeType == 9 then
		var_5_1 = "res/ui/weapon/godWeapon/seal_small.jpg"
	elseif celebration.celeType == 10 then
		var_5_1 = "res/ui/weapon/godWeapon/seal_small1.jpg"
	elseif var_5_0.pic then
		var_5_1 = "frame:" .. var_5_0.pic .. ".jpg"
	elseif var_5_0.pics then
		var_5_1 = "frame:" .. var_5_0.pics[1].pic .. ".jpg"
	end

	local var_5_2 = {
		bg = {
			name = "yanhuiBack",
			pic = "res/ui/kfsy/kfsy_ky.jpg",
			type = "pic",
			children = {
				{
					name = "leave",
					type = "button",
					xcenter = visibleSize.width * 0.43,
					ycenter = visibleSize.height * 0.43,
					buttons = {
						{
							pic2 = "frame:btn_back_c.png",
							name = "leaveButton",
							pic1 = "frame:btn_back_a.png",
							callBack = function()
								smgr.changeScene(SCENE_MAIN_CITY)
							end
						}
					}
				},
				{
					xcenter = 20,
					name = "gonghe",
					type = "button",
					ycenter = -50,
					buttons = {
						{
							pic2 = "res/ui/gonghe/ghjl_btn_ghc.png",
							name = "leaveButton",
							pic1 = "res/ui/gonghe/ghjl_btn_gh.png",
							callBack = function()
								var_0_3(celebration.celeId)
							end
						}
					}
				},
				{
					xcenter = 20,
					name = "gongheEmpty",
					visible = false,
					type = "pic",
					ycenter = -50,
					pic = "res/ui/gonghe/ghjl_btn_gh_black.png"
				},
				{
					xcenter = -190,
					name = "icon_kuang",
					type = "pic",
					ycenter = 30,
					pic = "res/ui/common/quailtyFrames/quality_frame_6.png"
				},
				{
					xcenter = -190,
					name = "labelBg",
					type = "pic",
					ycenter = 90,
					pic = "res/ui/gonghe/ghjl_small_bg.png"
				},
				{
					xcenter = -190,
					name = "icon",
					type = "pic",
					ycenter = 30,
					pic = var_5_1
				}
			}
		}
	}

	var_0_0 = autoUI.initUI(arg_5_0, var_5_2)

	if var_5_0.pics then
		for iter_5_0 = 2, 5 do
			if var_5_0.pics[iter_5_0].pic then
				local var_5_3 = CCSprite:create("res/ui/common/quailtyFrames/quality_frame_6.png")

				var_5_3:setPosition(ccp(visibleSize.width / 2 + 100 * iter_5_0 - 300, visibleSize.height / 2 + 150))

				local var_5_4 = CCSprite:createWithSpriteFrameName(var_5_0.pics[iter_5_0].pic .. ".jpg")

				var_5_4:setPosition(ccp(visibleSize.width / 2 + 100 * iter_5_0 - 300, visibleSize.height / 2 + 150))
				var_0_0.yanhuiBack:addChild(var_5_3)
				var_0_0.yanhuiBack:addChild(var_5_4)
			end
		end

		var_0_0.icon:setPosition(ccp(visibleSize.width / 2 - 200, visibleSize.height / 2 + 150))
		var_0_0.icon_kuang:setPosition(ccp(visibleSize.width / 2 - 200, visibleSize.height / 2 + 150))
	end

	local var_5_5 = var_0_0.labelBg

	if celebration.celeType == 1 then
		local var_5_6 = var_5_5:getContentSize()
		local var_5_7 = CCStrokeLabelTTF:create(language.get(320511), "Thonburi-Bold", 22, 1, ccc3(0, 0, 0))

		var_5_7:setColor(ccc3(204, 185, 134))
		var_5_7:setAnchorPoint(ccp(0, 0.5))
		var_5_5:addChild(var_5_7)

		local var_5_8 = CCStrokeLabelTTF:create(var_5_0.celeFrom, "Thonburi-Bold", 22, 1, ccc3(0, 0, 0))

		var_5_8:setColor(ccc3(138, 43, 226))
		var_5_8:setAnchorPoint(ccp(0, 0.5))
		var_5_5:addChild(var_5_8)

		local var_5_9 = CCStrokeLabelTTF:create(language.get(320512), "Thonburi-Bold", 22, 1, ccc3(0, 0, 0))

		var_5_9:setColor(ccc3(204, 185, 134))
		var_5_9:setAnchorPoint(ccp(0, 0.5))
		var_5_5:addChild(var_5_9)

		local var_5_10 = var_5_7.getContentSize().width
		local var_5_11 = var_5_8.getContentSize().width
		local var_5_12 = var_5_9.getContentSize().width
		local var_5_13 = var_5_10 + var_5_11 + var_5_12
		local var_5_14 = var_5_6.width / 2 - var_5_13 / 2
		local var_5_15 = var_5_6.height / 2

		var_5_7:setPosition(ccp(var_5_14, var_5_15))

		local var_5_16 = var_5_14 + var_5_10

		var_5_8:setPosition(ccp(var_5_16, var_5_15))

		local var_5_17 = var_5_16 + var_5_11

		var_5_9:setPosition(ccp(var_5_17, var_5_15))
	elseif celebration.celeType == 2 or celebration.celeType == 3 then
		local var_5_18 = var_5_5:getContentSize()
		local var_5_19 = CCStrokeLabelTTF:create(var_5_0.celeFrom, "Thonburi-Bold", 22, 1, ccc3(0, 0, 0))

		var_5_19:setColor(ccc3(138, 43, 226))
		var_5_19:setAnchorPoint(ccp(0, 0.5))
		var_5_5:addChild(var_5_19)

		local var_5_20 = CCStrokeLabelTTF:create(language.get(320513), "Thonburi-Bold", 22, 1, ccc3(0, 0, 0))

		var_5_20:setColor(ccc3(204, 185, 134))
		var_5_20:setAnchorPoint(ccp(0, 0.5))
		var_5_5:addChild(var_5_20)

		local var_5_21 = var_5_19.getContentSize().width
		local var_5_22 = var_5_21 + var_5_20.getContentSize().width
		local var_5_23 = var_5_18.width / 2 - var_5_22 / 2
		local var_5_24 = var_5_18.height / 2

		var_5_19:setPosition(ccp(var_5_23, var_5_24))

		local var_5_25 = var_5_23 + var_5_21

		var_5_20:setPosition(ccp(var_5_25, var_5_24))
	else
		var_5_5:setVisible(false)
	end

	if celebration.celeType == 1 then
		local var_5_26 = var_0_0.icon
		local var_5_27 = arg_5_0:convertToNodeSpace(var_5_26:convertToWorldSpace(ccp(-124, 0)))
		local var_5_28 = var_5_0.showTips[1]
		local var_5_29 = CCSprite:create("res/ui/gonghe/tavern_tip.png")

		var_5_29:setPosition(var_5_27)
		arg_5_0:addChild(var_5_29, 90000)

		arg_5_0.tips = var_5_29

		local var_5_30 = CCStrokeLabelTTF:create(var_5_28.generalName, "Thonburi-Bold", 22)

		var_5_30:setColor(ccc3(209, 111, 242))
		var_5_30:setPosition(ccp(10 + var_5_30:getContentSize().width * 0.5, 420))
		var_5_29:addChild(var_5_30)

		local var_5_31 = CCStrokeLabelTTF:create(language.get(83004, var_5_28.leader), "Thonburi-Bold", 22)

		var_5_31:setColor(ccc3(102, 157, 187))
		var_5_31:setPosition(ccp(10 + var_5_31:getContentSize().width * 0.5, 380))

		local var_5_32 = CCStrokeLabelTTF:create(language.get(83005), "Thonburi-Bold", 20)

		var_5_32:setColor(ccc3(188, 167, 146))
		var_5_32:setPosition(ccp(var_5_31:getContentSize().width * 0.5 + var_5_32:getContentSize().width * 0.5, 0))
		var_5_31:addChild(var_5_32)
		var_5_29:addChild(var_5_31)

		local var_5_33 = CCStrokeLabelTTF:create(language.get(83006, var_5_28.strength), "Thonburi-Bold", 22)

		var_5_33:setColor(ccc3(183, 91, 68))
		var_5_33:setPosition(ccp(10 + var_5_33:getContentSize().width * 0.5, 350))

		local var_5_34 = CCStrokeLabelTTF:create(language.get(83007), "Thonburi-Bold", 20)

		var_5_34:setColor(ccc3(188, 167, 146))
		var_5_34:setPosition(ccp(var_5_33:getContentSize().width * 0.5 + var_5_34:getContentSize().width * 0.5, 0))
		var_5_33:addChild(var_5_34)
		var_5_29:addChild(var_5_33)

		local var_5_35 = CCStrokeLabelTTF:create(language.get(83008), "Thonburi-Bold", 22)

		var_5_35:setColor(ccc3(203, 173, 141))
		var_5_35:setPosition(ccp(10 + var_5_35:getContentSize().width * 0.5, 310))
		var_5_29:addChild(var_5_35)

		local var_5_36 = CCStrokeLabelTTF:create(var_5_28.troopName, "Thonburi-Bold", 22)

		var_5_36:setColor(colorQuality[var_5_28.troopQuality])
		var_5_36:setPosition(ccp(var_5_35:getContentSize().width * 0.5 + var_5_36:getContentSize().width * 0.5, 0))
		var_5_35:addChild(var_5_36)

		local var_5_37 = CCStrokeLabelTTF:create(language.get(83009), "Thonburi-Bold", 22)

		var_5_37:setColor(ccc3(203, 173, 141))
		var_5_37:setPosition(ccp(10 + var_5_37:getContentSize().width * 0.5, 270))
		var_5_29:addChild(var_5_37)

		if var_5_28.tacName and string.len(var_5_28.tacName) > 0 then
			local var_5_38 = CCStrokeLabelTTF:create(var_5_28.tacName, "Thonburi-Bold", 22)

			var_5_38:setColor(colorQuality[var_5_28.quality])
			var_5_38:setPosition(ccp(var_5_37:getContentSize().width * 0.5 + var_5_38:getContentSize().width * 0.5, 0))
			var_5_37:addChild(var_5_38)

			local var_5_39 = CCStrokeLabelTTF:create(language.get(83010, var_5_28.tacRange), "Thonburi-Bold", 20)

			var_5_39:setColor(ccc3(193, 184, 178))
			var_5_39:setPosition(ccp(var_5_39:getContentSize().width * 0.5 - var_5_38:getContentSize().width * 0.5, -(var_5_38:getContentSize().height * 0.5 + var_5_39:getContentSize().height * 0.5)))
			var_5_38:addChild(var_5_39)
		end

		local var_5_40 = CCStrokeLabelTTF:create(language.get(83011), "Thonburi-Bold", 22)

		var_5_40:setPosition(ccp(10 + var_5_40:getContentSize().width * 0.5, 210))
		var_5_40:setColor(ccc3(203, 173, 139))
		var_5_29:addChild(var_5_40)

		if var_5_28.terrain then
			for iter_5_1, iter_5_2 in pairs(var_5_28.terrain) do
				local var_5_41 = language.get(83012)

				if iter_5_2.tType == 1 then
					local var_5_42 = language.get(83012)
				elseif iter_5_2.tType == 2 then
					var_5_41 = language.get(83013)
				elseif iter_5_2.tType == 3 then
					var_5_41 = language.get(83014)
				elseif iter_5_2.tType == 4 then
					var_5_41 = language.get(81112)
				end

				local var_5_43 = language.get(83015, iter_5_2.tValue)
				local var_5_44 = CCStrokeLabelTTF:create(var_5_41, "Thonburi-Bold", 20)

				var_5_44:setPosition(ccp(var_5_40:getContentSize().width * 0.5 + var_5_44:getContentSize().width * 0.5, -(iter_5_1 - 1) * (var_5_44:getContentSize().height + 15)))
				var_5_44:setColor(ccc3(193, 182, 178))
				var_5_40:addChild(var_5_44)

				local var_5_45 = CCStrokeLabelTTF:create(var_5_43, "Thonburi-Bold", 18)

				var_5_45:setPosition(ccp(var_5_44:getContentSize().width * 0.5 + var_5_45:getContentSize().width * 0.5, 0))
				var_5_45:setColor(ccc3(189, 167, 146))
				var_5_44:addChild(var_5_45)
			end
		end

		local var_5_46 = CCStrokeLabelTTF:create(language.get(83016), "Thonburi-Bold", 22)

		var_5_46:setPosition(ccp(10 + var_5_46:getContentSize().width * 0.5, 95))
		var_5_46:setColor(ccc3(203, 173, 139))
		var_5_29:addChild(var_5_46)

		if var_5_28.tts then
			local var_5_47 = 0
			local var_5_48 = 0

			for iter_5_3, iter_5_4 in pairs(var_5_28.tts) do
				local var_5_49 = iter_5_4.sName
				local var_5_50 = CCStrokeLabelTTF:create(var_5_49, "Thonburi-Bold", 20)

				var_5_50:setPosition(ccp(var_5_48 + var_5_46:getContentSize().width * 0.5 + var_5_50:getContentSize().width * 0.5, var_5_47))
				var_5_50:setColor(ccc3(193, 182, 178))
				var_5_46:addChild(var_5_50)

				if iter_5_3 % 2 == 1 then
					var_5_48 = var_5_48 + 10 + var_5_50:getContentSize().width
				else
					var_5_48 = 0
					var_5_47 = var_5_47 - 10 - var_5_50:getContentSize().height
				end
			end
		end
	elseif celebration.celeType == 2 or celebration.celeType == 3 then
		local var_5_51 = var_0_0.icon
		local var_5_52 = arg_5_0:convertToNodeSpace(var_5_51:convertToWorldSpace(ccp(-124, 0)))
		local var_5_53 = var_5_0.showTips[1]
		local var_5_54 = CCScale9Sprite:create("res/ui/weapon/tips_di.png", CCRectMake(0, 0, 80, 80), CCRectMake(20, 20, 40, 40))

		var_5_54:setContentSize(CCSizeMake(239, 410))
		var_5_54:setPosition(var_5_52)
		arg_5_0:addChild(var_5_54, 90000)

		arg_5_0.tips = var_5_54

		local var_5_55 = 10
		local var_5_56 = 400
		local var_5_57 = CCStrokeLabelTTF:create(celebration.theme, "Thonburi-Bold", 24, 1, ccc3(0, 0, 0))

		var_5_57:setColor(ccc3(138, 43, 226))
		var_5_57:setPosition(ccp(var_5_55, var_5_56))
		var_5_57:setAnchorPoint(ccp(0, 1))
		var_5_54:addChild(var_5_57)

		local var_5_58 = var_5_56 - 30
		local var_5_59 = CCStrokeLabelTTF:create(language.get(30103, var_5_53.att, var_5_53.def, var_5_53.blood), "Thonburi-Bold", 15, 1, ccc3(0, 0, 0))

		var_5_59:setColor(ccc3(92, 200, 125))
		var_5_59:setAnchorPoint(ccp(0, 1))
		var_5_59:setPosition(ccp(var_5_55, var_5_58))
		var_5_54:addChild(var_5_59)

		local var_5_60 = var_5_58 - 20
		local var_5_61 = CCSprite:create("res/ui/gonghe/general_right_view_bg2_div.jpg")

		var_5_61:setAnchorPoint(ccp(0, 1))
		var_5_61:setPosition(ccp(5, var_5_60))
		var_5_61:setScaleX(0.7)
		var_5_54:addChild(var_5_61)

		local var_5_62 = var_5_60 - 20
		local var_5_63 = CCStrokeLabelTTF:create(language.get(320514), "Thonburi-Bold", 20, 1, ccc3(0, 0, 0))

		var_5_63:setColor(ccc3(255, 165, 0))
		var_5_63:setAnchorPoint(ccp(0, 1))
		var_5_63:setPosition(ccp(var_5_55, var_5_62))
		var_5_54:addChild(var_5_63)

		local var_5_64 = var_5_62 - 10

		for iter_5_5 = 1, #var_5_53.subEquips do
			local var_5_65 = var_5_53.subEquips[iter_5_5]

			var_5_64 = var_5_64 - 26

			local var_5_66 = CCStrokeLabelTTF:create(var_5_65.skillName, "Thonburi-Bold", 22, 1, ccc3(0, 0, 0))

			var_5_66:setColor(ccc3(255, 255, 255))
			var_5_66:setAnchorPoint(ccp(0, 1))
			var_5_66:setPosition(ccp(var_5_55, var_5_64))
			var_5_54:addChild(var_5_66)

			local var_5_67 = var_5_55 + var_5_66:getContentSize().width

			for iter_5_6 = 1, 4 do
				local var_5_68 = CCSprite:create("res/ui/gonghe/star_light.png")

				var_5_68:setPosition(ccp(var_5_67, var_5_64 + 4))
				var_5_68:setAnchorPoint(ccp(0, 1))

				var_5_67 = var_5_67 + var_5_68:getContentSize().width

				var_5_54:addChild(var_5_68)
			end
		end

		local var_5_69 = var_5_64 - 30
		local var_5_70 = CCSprite:create("res/ui/gonghe/general_right_view_bg2_div.jpg")

		var_5_70:setAnchorPoint(ccp(0, 1))
		var_5_70:setPosition(ccp(5, var_5_69))
		var_5_70:setScaleX(0.7)
		var_5_54:addChild(var_5_70)

		local var_5_71 = var_5_69 - 20
		local var_5_72 = CCStrokeLabelTTF:create(language.get(320515), "Thonburi-Bold", 20, 1, ccc3(0, 0, 0))

		var_5_72:setColor(ccc3(255, 165, 0))
		var_5_72:setAnchorPoint(ccp(0, 1))
		var_5_72:setPosition(ccp(var_5_55, var_5_71))
		var_5_54:addChild(var_5_72)

		local var_5_73 = var_5_71 - 25
		local var_5_74 = CCLabelTTF:create(var_5_53.suitIntro, "Thonburi-Bold", 20)

		var_5_74:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_5_74:setAnchorPoint(ccp(0, 1))
		var_5_74:setPosition(ccp(var_5_55, var_5_73))
		var_5_74:setDimensions(CCSizeMake(220, 640))
		var_5_54:addChild(var_5_74)
	else
		arg_5_0.tips = CCSprite:create()

		arg_5_0:addChild(arg_5_0.tips, 90000)
	end

	log.info("celebration.celeType@@@@@@@@@@@@@@@@@@@@@@@@@")
	log.info(celebration.celeType)
	arg_5_0.tips:setVisible(false)
	arg_5_0:addPeople(arg_5_1)
	arg_5_0:addWord(arg_5_1)
	arg_5_0:setTouchEnabled(true)
	arg_5_0:registerScriptTouchHandler(handler(arg_5_0, arg_5_0.onTouch), false, true)
end

function var_0_1.onTouch(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	if arg_8_1 == CCTOUCHBEGAN then
		if tool.checkIfTouch(var_0_0.icon, arg_8_2, arg_8_3) == true then
			arg_8_0.tips:setVisible(true)
		end

		return true
	elseif (arg_8_1 == CCTOUCHENDED or arg_8_1 == CCTOUCHCANCELLED) and arg_8_0.tips then
		arg_8_0.tips:setVisible(false)
	end
end

function var_0_1.onEnter(arg_9_0)
	return
end

function var_0_1.onExit(arg_10_0)
	return
end

function var_0_1.addTalk(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	if arg_11_2 == nil then
		return
	end

	local var_11_0
	local var_11_1
	local var_11_2

	arg_11_3 = arg_11_3 or 20

	if arg_11_1 == 0 then
		var_11_0, var_11_1 = arg_11_0.king:getPosition()
		var_11_2 = ccp(0, 1)
	elseif arg_11_1 >= 1 and arg_11_1 <= 9 then
		local var_11_3 = kfsyConstant.people[arg_11_1].pos

		var_11_0, var_11_1 = var_11_3.x, var_11_3.y
		var_11_2 = arg_11_1 % 2 == 1 and ccp(0, 0) or ccp(1, 0)
	end

	local var_11_4 = {}

	uiutil.initWidgets(var_11_4, arg_11_0.tipFrame)
	var_11_4.widgets.tipMsg:setFontSize(arg_11_3)
	var_11_4.widgets.tipMsg:setString(arg_11_2)

	local var_11_5 = var_11_4.widgets.tipMsg:getContentSize()

	var_11_4.widgets.tipFrame:setPreferredSize(CCSizeMake(var_11_5.width + 20, var_11_5.height + 20))
	var_11_4.widgets.tipMsg:setPosition(ccp(10, 10))
	var_11_4.widgets.tipFrame:setVisible(true)
	var_11_4.widgets.tipFrame:setPosition(ccp(var_11_0, var_11_1))
	var_11_4.widgets.tipFrame:setAnchorPoint(var_11_2)
	var_11_4.widgets.tipFrame:setVisible(false)
	arg_11_0.runActionSprite:addChild(var_11_4.widgets.tipFrame, 200)

	local var_11_6 = CCArray:create()

	var_11_6:addObject(CCCallFuncN:create(function()
		var_11_4.widgets.tipFrame:setVisible(false)
	end))
	var_11_6:addObject(CCDelayTime:create(1 + math.random(1, 100) * 0.03))
	var_11_6:addObject(CCCallFuncN:create(function()
		var_11_4.widgets.tipFrame:setVisible(true)
	end))
	var_11_6:addObject(CCDelayTime:create(1 + math.random(1, 100) * 0.03))

	local var_11_7 = CCSequence:create(var_11_6)
	local var_11_8 = CCRepeatForever:create(var_11_7)

	var_11_4.widgets.tipFrame:runAction(var_11_8)
end

function var_0_1.addPeople(arg_14_0, arg_14_1)
	arg_14_0.peopleSprite:removeAllChildrenWithCleanup(true)

	local var_14_0 = arg_14_1.data or arg_14_1.action.data

	require("lua/layer/kfsy/constant")

	local var_14_1 = CCSprite:create("res/ui/kfsy/dinnerChiefRole.png")

	var_14_1:setPosition(kfsyConstant.king)
	arg_14_0.peopleSprite:addChild(var_14_1)

	arg_14_0.king = var_14_1

	local var_14_2 = CCStrokeLabelTTF:create(celebration.playerName, "Thonburi-Bold", 30, 1, ccc3(0, 0, 0))

	var_14_2:setColor(ccc3(255, 248, 197))
	var_14_2:setPosition(15, 80)
	var_14_1:addChild(var_14_2)

	for iter_14_0 = 1, 10 do
		local var_14_3

		if kfsyConstant.people[iter_14_0].side == 1 then
			var_14_3 = CCSprite:create("res/ui/kfsy/dinnerGeneralRole1.png")
		else
			var_14_3 = CCSprite:create("res/ui/kfsy/dinnerGeneralRole2.png")
		end

		var_14_3:setPosition(kfsyConstant.people[iter_14_0].pos)

		local var_14_4

		if var_14_0.participants[iter_14_0] then
			var_14_4 = CCStrokeLabelTTF:create(var_14_0.participants[iter_14_0].generalName, "Thonburi-Bold", 22, 1, ccc3(0, 0, 0))
		else
			var_14_4 = CCStrokeLabelTTF:create(user.player.name, "Thonburi-Bold", 22, 1, ccc3(0, 0, 0))
		end

		var_14_4:setColor(ccc3(255, 255, 255))
		var_14_4:setPosition(0, 60)
		var_14_3:addChild(var_14_4)
		arg_14_0.peopleSprite:addChild(var_14_3)
	end
end

local function var_0_4(arg_15_0, arg_15_1)
	local var_15_0 = 1
	local var_15_1 = 1
	local var_15_2 = {}

	while true do
		local var_15_3 = string.find(arg_15_0, arg_15_1, var_15_0)

		if not var_15_3 then
			var_15_2[var_15_1] = string.sub(arg_15_0, var_15_0, string.len(arg_15_0))

			break
		end

		var_15_2[var_15_1] = string.sub(arg_15_0, var_15_0, var_15_3 - 1)
		var_15_0 = var_15_3 + string.len(arg_15_1)
		var_15_1 = var_15_1 + 1
	end

	return var_15_2
end

function var_0_1.addWord(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_1.data or arg_16_1.action.data

	if var_16_0.dialogues then
		local var_16_1 = var_0_4(var_16_0.dialogues, "#")

		for iter_16_0 = 1, #var_16_1 do
			if var_16_1[iter_16_0] then
				local var_16_2

				if iter_16_0 == 1 then
					local var_16_3 = arg_16_0:addTalk(0, var_16_1[iter_16_0], 22)
				else
					local var_16_4 = arg_16_0:addTalk(iter_16_0, var_16_1[iter_16_0], 22)
				end
			end
		end
	end
end

return var_0_1
