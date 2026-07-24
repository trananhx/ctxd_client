roleDialogue.constant = {}
roleDialogue.constant.event1 = "role_dialogue_speak"

require("lua/roleDialogue/constant2")

function roleDialogue.constant.dialogueFrame(arg_1_0)
	local var_1_0 = "dialogueFrame_" .. tostring(arg_1_0)

	if roleDialogue.constant[var_1_0] ~= nil then
		return roleDialogue.constant[var_1_0]()
	else
		log.info("没找到小倩对话, 索引号: ", arg_1_0)
	end

	return nil
end
