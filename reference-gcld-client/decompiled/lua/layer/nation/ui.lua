require("lua/component/labelPage")
require("lua/layer/nation/taskTab/constant")
tool.requireRes("nation")

local var_0_0 = require("res/native/offset").get("layer.nation")

nationUI = {}

local var_0_1 = nationControl

function nationUI.show(arg_1_0)
	amgr.playEffect(enumAudioFile.ui_dialog_open)

	arg_1_0 = arg_1_0 or 1

	if arg_1_0 == nil then
		arg_1_0 = 1

		for iter_1_0 = 1, 7 do
			if guide.constant.popui[3][iter_1_0] == true then
				arg_1_0 = iter_1_0

				break
			end
		end
	end

	local var_1_0 = createBaseLayer()

	smgr.registerLayer(var_1_0, "nationLayer")

	nationUI.uiTable = autoUI.initUI(var_1_0, getNationData())

	nationUI.uiTable.closeItem:registerScriptTapHandler(function()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.getLayer("topLayer"):removeChild(var_1_0, true)
		guide.control.setCurrentMarkTrace(nil)
		CCTextureCache:sharedTextureCache():removeUnusedTextures()

		if guide.control.isHideByTemp == true then
			guide.control.isHideByTemp = false

			guide.ui.setVisible(true)
		end
	end)
	var_0_1.initControl(var_1_0)
	rmgr.loadResource("res/ui/world/cityWindow.plist")
	rmgr.loadResource("res/ui/world/worldBuilding.plist")
	rmgr.loadResource("res/ui/tavern/tavern.plist")
	rmgr.loadResource("res/ui/nation/donate.plist")
	rmgr.loadResource("res/ui/nationTask/nationTask.plist")

	local var_1_1 = {}
	local var_1_2 = 1
	local var_1_3 = true
	local var_1_4 = true

	if user.player.playerLv > 29 then
		local var_1_5 = arg_1_0 == 1 and true or false
		local var_1_6 = {
			name = language.get(90001),
			callback = function()
				var_0_1.onNationClick()

				if not var_1_4 then
					guide.control.setCurrentMarkTrace("panel:3:1")
				end
			end,
			default = var_1_5
		}

		var_1_6.pageIndex = 1

		table.insert(var_1_1, var_1_2, var_1_6)

		var_1_2 = var_1_2 + 1

		local var_1_7 = false
	end

	local var_1_8
	local var_1_9 = false
	local var_1_10 = false
	local var_1_11 = false

	if user.curNationTask and user.curNationTask.tasks then
		for iter_1_1, iter_1_2 in pairs(user.curNationTask.tasks) do
			if iter_1_2.taskType == 0 then
				var_1_9 = true
			elseif iter_1_2.taskType == 4 and iter_1_2.taskState == 0 then
				local var_1_12 = true
			elseif iter_1_2.taskType == 5 and iter_1_2.taskState == 0 then
				var_1_10 = true
			end
		end
	end

	local var_1_13 = arg_1_0 == 2 and true or false
	local var_1_14 = {
		name = language.get(90002),
		callback = var_0_1.onTaskTabClick(),
		default = var_1_13
	}

	var_1_14.pageIndex = 2

	table.insert(var_1_1, var_1_2, var_1_14)

	local var_1_15 = var_1_2 + 1
	local var_1_16 = false

	if var_1_10 then
		local var_1_17 = arg_1_0 == 6 and true or false
		local var_1_18 = {
			name = language.get(90004),
			callback = var_0_1.onBudokaiTabClick,
			default = var_1_17
		}

		var_1_18.pageIndex = 6

		table.insert(var_1_1, var_1_15, var_1_18)

		var_1_15 = var_1_15 + 1

		local var_1_19 = false
	end

	if user.curTryTask and (user.curTryTask.state == 0 or user.curTryTask.hasReward == true) then
		local var_1_20 = arg_1_0 == 3 and true or false
		local var_1_21 = {
			name = language.get(90005),
			callback = var_0_1.onTaskTabClick(taskTabConstant.TYPES.NATION_TRY_TASK),
			default = var_1_20
		}

		table.insert(var_1_1, var_1_15, var_1_21)

		var_1_21.pageIndex = 3
		var_1_15 = var_1_15 + 1

		local var_1_22 = false
	end

	if user.curProtectTask and user.curProtectTask.state == 0 then
		local var_1_23 = arg_1_0 == 5 and true or false
		local var_1_24 = {
			name = language.get(90006),
			callback = var_0_1.onTaskTabClick(taskTabConstant.TYPES.NATION_BAR_PROTECT_TASK),
			default = var_1_23
		}

		var_1_24.pageIndex = 5

		table.insert(var_1_1, var_1_15, var_1_24)

		var_1_15 = var_1_15 + 1

		local var_1_25 = false
	end

	if var_1_9 then
		local var_1_26 = arg_1_0 == 4 and true or false
		local var_1_27 = {
			name = language.get(90007),
			callback = var_0_1.onTaskTabClick(taskTabConstant.TYPES.NATION_UPGRADE_TASK),
			default = var_1_26
		}

		var_1_27.pageIndex = 4

		table.insert(var_1_1, var_1_15, var_1_27)

		var_1_15 = var_1_15 + 1

		local var_1_28 = false
	end

	if user.player.maxNationLv >= 5 then
		local var_1_29 = arg_1_0 == 8 and true or false
		local var_1_30 = {
			name = language.get(90008),
			callback = var_0_1.onTaskTabClick(taskTabConstant.TYPES.NATION_HUIZHAN_TASK),
			default = var_1_29
		}

		var_1_30.pageIndex = 8

		table.insert(var_1_1, var_1_15, var_1_30)

		var_1_15 = var_1_15 + 1

		local var_1_31 = false
	end

	if user.inbstask and user.inbstask == true and user.player.playerLv > user.bstaskMinLevel then
		local var_1_32 = arg_1_0 == 9 and true or false
		local var_1_33 = {
			name = language.get(90009),
			callback = var_0_1.onTaskTabClick(taskTabConstant.TYPES.NATION_WEICHENG_TASK),
			default = var_1_32
		}

		var_1_33.pageIndex = 9

		table.insert(var_1_1, var_1_15, var_1_33)

		var_1_15 = var_1_15 + 1

		local var_1_34 = false
	end

	if user.kfyzState == 2 or smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		local var_1_35 = arg_1_0 == 10 and true or false
		local var_1_36 = 390461

		if user.jpsIndex >= 1 and user.jpsIndex <= 4 then
			var_1_36 = "222415_dongying"
		elseif user.jpsIndex >= 5 and user.jpsIndex <= 7 then
			var_1_36 = 136570
		elseif user.jpsIndex >= 8 and user.jpsIndex <= 10 then
			var_1_36 = 136803
		elseif user.jpsIndex >= 11 and user.jpsIndex <= 13 then
			var_1_36 = 136846
		elseif user.jpsIndex >= 14 and user.jpsIndex <= 16 then
			var_1_36 = 218001
		end

		local var_1_37 = {
			name = language.get(var_1_36),
			callback = var_0_1.onKfyzTabClick,
			default = var_1_35
		}

		var_1_37.pageIndex = 10

		table.insert(var_1_1, var_1_15, var_1_37)

		var_1_15 = var_1_15 + 1

		local var_1_38 = false
	end

	if user.inkbtask == true then
		local var_1_39 = arg_1_0 == 11 and true or false
		local var_1_40 = {
			name = language.get(90011),
			callback = var_0_1.onTaskTabClick(taskTabConstant.TYPES.NATION_BUILDNATION_TASK),
			default = var_1_39
		}

		if user.kbLv and user.kbLv >= 1 then
			var_1_40.name = language.get(90012)
		end

		var_1_40.pageIndex = 11

		table.insert(var_1_1, var_1_15, var_1_40)

		var_1_15 = var_1_15 + 1

		local var_1_41 = false
	end

	if user.kbLv == 2 or user.kbLv == 3 or user.kbLv == 4 or user.kbLv == 5 or user.kbLv == 6 then
		local var_1_42 = arg_1_0 == 12 and true or false
		local var_1_43 = {
			name = language.get("221040_buildNation"),
			callback = var_0_1.onKindomBuildTabClick,
			default = var_1_42
		}

		var_1_43.pageIndex = 12

		table.insert(var_1_1, var_1_15, var_1_43)

		var_1_15 = var_1_15 + 1

		local var_1_44 = false
	end

	if user.hasKillAllTask == true then
		local var_1_45 = arg_1_0 == 13 and true or false
		local var_1_46 = {
			name = language.get(205516),
			callback = var_0_1.onKillAllTabClick,
			default = var_1_45
		}

		var_1_46.pageIndex = 13

		table.insert(var_1_1, var_1_15, var_1_46)

		local var_1_47 = var_1_15 + 1
		local var_1_48 = false
	end

	local var_1_49 = CCScale9Sprite:createWithSpriteFrameName("bigPanel.png")

	var_1_49:setPreferredSize(CCSizeMake(960, 581))
	var_1_49:setPosition(ccp(var_1_49:getContentSize().width * 0.5, var_1_49:getContentSize().height * 0.5))
	var_1_49:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 28))
	var_1_0:addChild(var_1_49, 0)

	local var_1_50 = createLabelPage()

	for iter_1_3, iter_1_4 in pairs(var_1_1) do
		local var_1_51 = CCSprite:createWithSpriteFrameName("labelButon_light.png")
		local var_1_52 = CCSprite:createWithSpriteFrameName("labelButton_noraml.png")
		local var_1_53 = CCStrokeLabelTTF:create(iter_1_4.name, "Thonburi-Bold", 26 + (var_0_0.menuTagFntSize or 0))

		var_1_53:setColor(ccc3(255, 255, 209))
		var_1_53:setPosition(ccp(var_1_51:getContentSize().width * 0.5, var_1_51:getContentSize().height * 0.4))
		var_1_53:setDimensions(CCSizeMake(120, 0))
		var_1_51:addChild(var_1_53)

		local var_1_54 = CCStrokeLabelTTF:create(iter_1_4.name, "Thonburi-Bold", 26 + (var_0_0.menuTagFntSize or 0))

		var_1_54:setColor(ccc3(204, 187, 135))
		var_1_54:setPosition(ccp(var_1_52:getContentSize().width * 0.5, var_1_52:getContentSize().height * 0.4))
		var_1_54:setDimensions(CCSizeMake(120, 0))
		var_1_52:addChild(var_1_54)

		local var_1_55 = visibleSize.width / 2 - var_1_49:getContentSize().width / 2 + var_1_51:getContentSize().width * iter_1_3 - var_1_51:getContentSize().width * 0.5 + 30
		local var_1_56 = visibleSize.height / 2 + var_1_49:getContentSize().height / 2 - 2
		local var_1_57 = var_1_50:addLabelButton(var_1_52, var_1_51, ccp(var_1_55, var_1_56), iter_1_4.callback, iter_1_4.default)

		guide.curMenuItems[iter_1_4.pageIndex] = var_1_57
	end

	closeItem = nationUI.uiTable.closeItem

	closeItem:setScale(2)

	local var_1_58 = visibleSize.width / 2 + var_1_49:getContentSize().width / 2 - nationUI.uiTable.closeItem:getContentSize().width
	local var_1_59 = visibleSize.height / 2 + var_1_49:getContentSize().height / 2

	nationUI.uiTable.closeItem:setPosition(ccp(var_1_58 - 5, var_1_59 - 5))
	var_1_0:addChild(var_1_50)

	local function var_1_60(arg_4_0, arg_4_1, arg_4_2)
		return true
	end

	var_1_0:setTouchEnabled(true)
	var_1_0:registerScriptTouchHandler(var_1_60, false, true)

	local var_1_61 = smgr.getLayer("topLayer")

	var_1_61:removeAllChildrenWithCleanup(true)
	var_1_61:addChild(var_1_0)

	if guide.ui.isVisible() == true then
		guide.control.isHideByTemp = true

		guide.ui.setVisible(false)
	end

	guide.control.setCurrentMarkTrace("panel:3:" .. arg_1_0)

	local var_1_62 = false
end
