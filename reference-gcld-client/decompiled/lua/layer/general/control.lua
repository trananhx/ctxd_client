require("lua/layer/general/tavernPanel")
require("lua/layer/general/warlock/warlockPanel")

function newControl(arg_1_0, arg_1_1)
	local var_1_0 = {
		iskfgz = arg_1_1 or false
	}

	var_1_0.currentLabel = nil
	var_1_0.currentPanel = nil
	var_1_0.maxGeneralNum = 0
	var_1_0.generals = {}
	var_1_0.maxGeneralNum = 0
	var_1_0.tokenNum = 0
	var_1_0.wantToChangeEquip = nil
	var_1_0.wantToChangeEquipGeneralId = 0
	var_1_0.wantTochangeEquipOldGeneralData = nil
	var_1_0.gtLvs = nil

	function var_1_0.clearPanel()
		var_1_0.currentPanel = nil

		arg_1_0:removeChildByTag(generalConstant.tag.functionPanel, true)
	end

	function var_1_0.changeLabelPage(arg_3_0, arg_3_1)
		var_1_0.clearPanel()

		var_1_0.currentLabel = arg_3_1
		var_1_0.currentPanel = arg_3_0

		if arg_3_0 then
			arg_1_0:addChild(arg_3_0, 1, generalConstant.tag.functionPanel)
		end
	end

	function var_1_0.changeToTavern()
		local var_4_0 = createTavernPanel(var_1_0)

		var_1_0.changeLabelPage(var_4_0, GENERAL_PANEL_LABEL_TAVERN)
	end

	function var_1_0.changeToBanquest()
		require("lua/layer/general/dinner/ui")

		local var_5_0 = dinnerUI.show()

		var_1_0.changeLabelPage(var_5_0, GENERAL_PANEL_LABEL_BANQUEST)
	end

	function var_1_0.changeToJail()
		require("lua/layer/general/jail/ui")

		local var_6_0 = jailUI.show()

		var_1_0.changeLabelPage(var_6_0, GENERAL_PANEL_LABEL_PRISON)
	end

	function var_1_0.changeToWarlock()
		local var_7_0 = showWarlockPanel(var_1_0)

		var_1_0.changeLabelPage(var_7_0, GENERAL_PANEL_LABEL_WARLOCK)
	end

	function var_1_0.onGeneralLabelClick()
		local var_8_0 = require("lua/layer/general/generalPanel"):create(var_1_0)

		var_1_0.changeLabelPage(var_8_0, GENERAL_PANEL_LABEL_GENERAL)

		if guide.constant.popui[2][1] == true then
			guide.constant.popui[2][1] = false

			guide.ui.setVisible(false)
		end
	end

	function var_1_0.onEquipLabelClick()
		var_1_0.changeToEquipPanel()

		if guide.constant.popui[2][2] == true then
			guide.constant.popui[2][2] = false

			guide.ui.setVisible(false)
		end
	end

	function var_1_0.onTavernLabelClick()
		var_1_0.changeToTavern()

		if guide.constant.popui[2][3] == true then
			guide.constant.popui[2][3] = false

			guide.ui.setVisible(false)
		end
	end

	function var_1_0.onBanquestLabelClick()
		var_1_0.changeToBanquest()

		if guide.constant.popui[2][4] == true then
			guide.constant.popui[2][4] = false

			guide.ui.setVisible(false)
		end
	end

	function var_1_0.onTrainLabelClick()
		var_1_0.clearPanel()
	end

	function var_1_0.onPrisonLabelClick()
		var_1_0.clearPanel()
		var_1_0.changeToJail()

		if guide.constant.popui[2][5] == true then
			guide.constant.popui[2][5] = false

			guide.ui.setVisible(false)
		end
	end

	function var_1_0.onWarlockLabelClick()
		var_1_0.changeToWarlock()

		if guide.constant.popui[2][6] == true then
			guide.constant.popui[2][6] = false

			guide.ui.setVisible(false)
		end
	end

	local function var_1_1()
		arg_1_0:removeChildByTag(generalConstant.tag.messageBox, true)
	end

	function var_1_0.handlerFireGeneral()
		eventManager.dispatchEvent("fireGeneral")
	end

	function var_1_0.closeItem()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.getLayer("topLayer"):removeChild(arg_1_0, true)
		guide.ui.setVisible(false)
		guide.control.setCurrentMarkTrace(nil)
		CCTextureCache:sharedTextureCache():removeUnusedTextures()

		if user.curMainTask.taskId == 27 or user.curMainTask.taskId == 50 or user.curMainTask.taskId == 61 or user.curMainTask.taskId == 70 or user.curMainTask.taskId == 87 then
			taskUI.showTaskGuide()
		end
	end

	local function var_1_2(arg_18_0)
		if arg_18_0 == 24 or arg_18_0 == 48 or arg_18_0 == 60 or arg_18_0 == 690 or arg_18_0 == 860 then
			guide.constant.other[6] = true

			if user.player.playerLv < 30 then
				var_1_0.closeItem()
			else
				guide.control.loadGuide(5, 6)
			end
		elseif arg_18_0 == 30 or arg_18_0 == 69 or arg_18_0 == 86 then
			var_1_0.closeItem()
		end
	end

	function arg_1_0.onEnter(arg_19_0)
		eventManager.registerEvent("task_finished", var_1_2)
	end

	function arg_1_0.onExit(arg_20_0)
		eventManager.unregisterEvent("task_finished", var_1_2)
	end

	return var_1_0
end
