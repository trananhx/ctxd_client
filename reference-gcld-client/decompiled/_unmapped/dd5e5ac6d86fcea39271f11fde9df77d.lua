require("lua/common/tool")

itemGroup = {}

function itemGroup.show()
	local var_1_0 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("force_startItem_ring.png")

	return (CCSprite:createWithSpriteFrame(var_1_0))
end

function itemGroup.addButton(arg_2_0)
	return
end

return itemGroup
