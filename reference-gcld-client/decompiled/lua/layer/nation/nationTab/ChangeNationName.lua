local var_0_0 = require("res/native/offset").get("layer.nation.nationTab.changeNationName")
local var_0_1 = class("ChangeNationName", function()
	return createBaseLayer()
end)

function var_0_1.ctor(arg_2_0, arg_2_1)
	arg_2_0.goldNum = arg_2_1

	arg_2_0:setTouchEnabled(true)
	arg_2_0:registerScriptTouchHandler(function(arg_3_0, arg_3_1, arg_3_2)
		return arg_2_0:onTouch(arg_3_0, arg_3_1, arg_3_2)
	end, false, true)

	local var_2_0 = CCSprite:create("res/ui/nation/buildNation/mainTask/jgdy_jgly_bg.png")

	var_2_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
	arg_2_0:addChild(var_2_0)

	arg_2_0.bg = var_2_0

	local var_2_1 = CCSprite:create("res/ui/nation/buildNation/mainTask/jgdy_jgly_title.png")

	var_2_1:setPosition(ccp(var_2_0:getContentSize().width / 2, var_2_0:getContentSize().height + 5))
	var_2_0:addChild(var_2_1)

	local var_2_2 = CCSprite:create("res/ui/common/button/public_btn_red.png")

	var_2_2:setPosition(ccp(575, 36))
	var_2_2:setScale(0.8)
	var_2_0:addChild(var_2_2)

	arg_2_0.chuangjianButton = var_2_2

	local var_2_3 = CCLabelTTF:create(language.get("220950_buildNation"), "Thonburi", 22)

	var_2_3:setPosition(var_2_2:getContentSize().width / 2, var_2_2:getContentSize().height / 2 + 2)
	var_2_2:addChild(var_2_3)

	local var_2_4 = CCStrokeLabelTTF:create(language.get("220998_buildNation"), "Thonburi-Bold", 26 + (var_0_0.inputPromptLabelSize or 0))

	var_2_4:setPosition(ccp(160, 36))
	var_2_0:addChild(var_2_4)

	local var_2_5

	if user.player.forceId == 1 then
		var_2_5 = CCSprite:create("res/ui/playerInfo/nation_flag_blue.png")
	elseif user.player.forceId == 2 then
		var_2_5 = CCSprite:create("res/ui/playerInfo/nation_flag_red.png")
	else
		var_2_5 = CCSprite:create("res/ui/playerInfo/nation_flag_green.png")
	end

	var_2_5:setPosition(ccp(362, 200))
	var_2_0:addChild(var_2_5)

	local var_2_6 = CCStrokeLabelTTF:create("", "Thonburi-Bold", 55)

	var_2_6:setPosition(ccp(90, 119))
	var_2_5:addChild(var_2_6)
	rmgr.loadResource("res/ui/character/character.plist")

	local var_2_7 = CCScale9Sprite:createWithSpriteFrameName("role_input_name.png")
	local var_2_8 = CCEditBox:create(CCSizeMake(200 + (var_0_0.editBoxWidth or 0), 40), var_2_7)

	var_2_8:setPosition(ccp(362, 36))
	var_2_8:setMaxLength(15)
	var_2_8:setReturnType(1)
	var_2_0:addChild(var_2_8, 1)
	var_2_8:setText(language.get("220999_buildNation"))
	var_2_4:setAnchorPoint(ccp(1, 0.5))
	var_2_4:setPositionX(var_2_8:getPositionX() - var_2_8:getContentSize().width / 2 - 4)

	user.changedName = ""

	local function var_2_9(arg_4_0, arg_4_1)
		local var_4_0 = tolua.cast(arg_4_1, "CCEditBox")

		log.info("editBox", arg_4_0)

		if arg_4_0 == "began" then
			user.changedName = var_4_0:getText()
		elseif arg_4_0 == "changed" then
			user.changedName = var_4_0:getText()

			var_2_6:setString(var_4_0:getText())
		elseif arg_4_0 == "ended" then
			user.changedName = var_4_0:getText()

			var_2_6:setString(var_4_0:getText())
		end
	end

	var_2_8:registerScriptEditBoxHandler(var_2_9)
end

function var_0_1.onTouch(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if arg_5_1 == CCTOUCHBEGAN then
		if tool.checkIfTouch(arg_5_0.chuangjianButton, arg_5_2, arg_5_3) then
			local function var_5_0(arg_6_0)
				smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)

				if arg_6_0.action.data and arg_6_0.action.data.isFirst then
					roleDialogue.control.loadSpeak(1982)
				else
					roleDialogue.control.loadSpeak(1989)
				end
			end

			if arg_5_0.goldNum then
				messageBox.confirm(language.get("221021_buildNation", arg_5_0.goldNum), function()
					cmgr.sendRequest(var_5_0, actions.setForceName, user.changedName)
				end)
			else
				cmgr.sendRequest(var_5_0, actions.setForceName, user.changedName)
			end
		elseif tool.checkIfTouch(arg_5_0.bg, arg_5_2, arg_5_3) == false then
			smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
		end

		return true
	elseif arg_5_1 == CCTOUCHENDED then
		return true
	end

	return true
end

return var_0_1
