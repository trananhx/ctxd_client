local var_0_0 = true
local var_0_1 = 1
local var_0_2 = {}
local var_0_3 = language.get(user.kfzbZone > 0 and 490087 or 490086)

var_0_2[1] = language.get(220608, kfzbControl.kfzbData.saiqu, var_0_3, var_0_3)
var_0_2[2] = language.get(220609, var_0_3)
var_0_2[3] = language.get(220610)

local function var_0_4(arg_1_0)
	local var_1_0 = {
		role = {
			z = 3,
			pic = "res/ui/guide/npc_xq.png",
			type = "pic"
		},
		dialogueBox = {
			z = 4,
			pic = "res/ui/guide/npc_chat_view.png",
			type = "pic",
			children = {}
		}
	}
	local var_1_1 = {
		fontSize = 22,
		name = "text",
		type = "label",
		ycenter = -13,
		xcenter = 13,
		z = 5,
		text = arg_1_0
	}

	var_1_0.dialogueBox.children[1] = var_1_1
	var_1_0.role.left = 30
	var_1_0.role.down = 0
	var_1_0.dialogueBox.left = 220
	var_1_0.dialogueBox.y = 130

	return var_1_0
end

local var_0_5 = {
	parent = "uiLayer",
	widgets = {
		{
			name = "comUiSupNode",
			type = "node",
			children = {
				{
					scale = 1.5,
					name = "seeTipLbBg",
					type = "sprite",
					y = 30,
					z = 100,
					visible = false,
					pic = {
						frame = false,
						path = "res/ui/mainCity/bui_prof_view.png"
					},
					x = visibleSize.width * 0.5
				},
				{
					name = "seeTipLb",
					z = 100,
					visible = false,
					type = "label",
					text = "",
					style = "label_yellowish_24",
					y = 30,
					x = visibleSize.width * 0.5,
					anchor = ccp(0.5, 0.5)
				},
				{
					scale = 0.8,
					name = "attSupMark",
					x = 80,
					type = "sprite",
					visible = false,
					pic = {
						frame = false,
						path = "res/ui/kfzb/kfzbs_zdzb_djzc01.png"
					},
					y = visibleSize.height - 160
				},
				{
					scale = 0.8,
					name = "defSupMark",
					type = "sprite",
					y = 140,
					visible = false,
					pic = {
						frame = false,
						path = "res/ui/kfzb/kfzbs_zdzb_djzc01.png"
					},
					x = visibleSize.width - 80
				}
			}
		}
	}
}
local var_0_6 = {}

local function var_0_7()
	require("lua/layer/resource/ui")
	resourceUI.show(4)
end

function var_0_6.startCreateGuide(arg_3_0)
	arg_3_0.uiTable = arg_3_0.uiTable or {}

	local var_3_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_3_0:registerScriptTouchHandler(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == CCTOUCHBEGAN then
			return true
		elseif arg_4_0 == CCTOUCHMOVED then
			return true
		elseif arg_4_0 == CCTOUCHENDED then
			if arg_3_0.uiTable.text then
				var_0_1 = var_0_1 + 1

				if var_0_1 <= #var_0_2 then
					arg_3_0.uiTable.text:setString(var_0_2[var_0_1])
				else
					var_0_0 = false

					pcall(var_3_0.removeFromParentAndCleanup, var_3_0, true)
				end
			else
				pcall(var_3_0.removeFromParentAndCleanup, var_3_0, true)
			end

			return true
		end
	end, false, true)
	var_3_0:setTouchEnabled(true)

	local var_3_1 = smgr.getLayer("topLayer")

	var_0_1 = 1

	local var_3_2 = var_0_2[var_0_1]

	arg_3_0.uiTable = autoUI.initUI(var_3_0, var_0_4(var_3_2))

	arg_3_0.uiTable.text:setDimensions(CCSizeMake(280, 155))
	arg_3_0.uiTable.text:setHorizontalAlignment(kCCTextAlignmentLeft)
	arg_3_0.uiTable.text:setVerticalAlignment(kCCVerticalTextAlignmentTop)
	var_3_1:addChild(var_3_0)
end

function var_0_6.create(arg_5_0, arg_5_1)
	local var_5_0 = {}

	uiutil.initLayout(var_5_0, var_0_5)

	arg_5_1.kfzbCommonUi = var_5_0

	if kfzbControl.kfzbData.phase == 1 and var_0_0 then
		var_0_6:startCreateGuide()
	end

	function var_5_0.updateVisible(arg_6_0)
		log.info("@@ 通用ui.战斗状态：", arg_5_1.kfzbInfo.kfzbState)

		if arg_5_1.kfzbInfo.kfzbState == kfzbState.fightWatch then
			if arg_5_1.kfzbInfo.supported == 0 then
				var_5_0.widgets.seeTipLbBg:setVisible(true)
				var_5_0.widgets.seeTipLb:setVisible(true)

				if arg_5_1.kfzbInfo.matchId >= 4 and arg_5_1.kfzbInfo.matchId <= 7 and arg_5_1.kfzbInfo.round > 1 then
					var_5_0.widgets.seeTipLb:setString(language.get(490081))
				elseif arg_5_1.kfzbInfo.matchId >= 8 and arg_5_1.kfzbInfo.matchId <= 15 and arg_5_1.kfzbInfo.round > 1 then
					var_5_0.widgets.seeTipLb:setString(language.get(490081))
				else
					var_5_0.widgets.seeTipLb:setString(language.get(490082))
				end
			elseif arg_5_1.kfzbInfo.supported == 1 then
				var_5_0.widgets.attSupMark:setVisible(true)
			elseif arg_5_1.kfzbInfo.supported == 2 then
				var_5_0.widgets.defSupMark:setVisible(true)
			end
		else
			var_5_0.widgets.comUiSupNode:setVisible(false)
		end
	end

	function var_5_0.clearup(arg_7_0)
		arg_5_1.layerTabel.uiLayer:removeChild(arg_7_0.widgets.comUiSupNode, true)
	end

	var_5_0:updateVisible()

	return var_5_0
end

return var_0_6
