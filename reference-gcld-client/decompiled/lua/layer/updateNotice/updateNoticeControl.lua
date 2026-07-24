local var_0_0 = require("lua/component/HtmlView")
local var_0_1 = {
	init = function(arg_1_0, arg_1_1)
		arg_1_0.layout = arg_1_1
		arg_1_0.widgets = {}
	end
}

function var_0_1.getNotice(arg_2_0)
	cmgr.sendRequest(var_0_1.handlerNotice, actions.getUpdateNotice)
end

function var_0_1.onOpenUrl(arg_3_0, arg_3_1)
	local var_3_0 = tolua.cast(arg_3_1, "CCControlButton")
	local var_3_1 = tolua.cast(var_3_0:getUserObject(), "CCString"):getCString()

	CCApplication:sharedApplication():openURL(var_3_1)
end

function var_0_1.handlerNotice(arg_4_0)
	local var_4_0 = arg_4_0.action.data

	if arg_4_0.action.data.msg then
		return
	end

	local var_4_1 = {}

	uiutil.initLayout(var_4_1, var_0_1.layout)

	var_0_1.widgets = var_4_1.widgets

	var_0_1.widgets.closeButton:addHandleOfControlEvent(var_0_1.close, CCControlEventTouchUpInside)
	var_0_1.widgets.contentView:registerScriptHandler(var_0_1.onScroll, CCScrollView.kScrollViewScroll)

	local var_4_2 = 0
	local var_4_3 = 0
	local var_4_4 = createBaseLayer()

	for iter_4_0, iter_4_1 in pairs(var_4_0) do
		if iter_4_1 and iter_4_1.content then
			local var_4_5 = var_0_0:create({
				htmlText = iter_4_1.content,
				rowWidth = updateNoticeView.width,
				onOpenUrl = var_0_1.onOpenUrl
			})

			var_4_5:setPosition(ccp(var_4_2, var_4_3))
			var_4_4:addChild(var_4_5)

			var_4_3 = var_4_3 - var_4_5:getContentSize().height - 17
		end
	end

	local var_4_6 = 0 - var_4_3

	var_4_4:setPosition(ccp(0, var_4_6))
	var_0_1.widgets.contentView:getContainer():addChild(var_4_4)
	var_0_1.widgets.contentView:setContentSize(CCSizeMake(updateNoticeView.width, var_4_6))
	var_0_1.widgets.contentView:setContentOffset(ccp(0, updateNoticeView.height - var_4_6))
end

function var_0_1.close()
	var_0_1.widgets.panel:getParent():removeChild(var_0_1.widgets.panel, true)
end

function var_0_1.onScroll()
	local var_6_0 = var_0_1.widgets.contentView
	local var_6_1 = var_6_0:getContentSize()
	local var_6_2 = var_6_0:getViewSize()
	local var_6_3 = var_6_0:getContentOffset()

	log.info("@@ 滚动公告 ", var_6_1.height, var_6_2.height, var_6_3.y)

	if var_6_1.height <= var_6_2.height then
		var_0_1.widgets.scrollbarBg:setVisible(false)
	else
		var_0_1.widgets.scrollbarBg:setVisible(true)

		local var_6_4 = var_6_2.height / var_6_1.height * 237

		if var_6_4 < 12 then
			var_6_4 = 12
		end

		var_0_1.widgets.scrollbarSprite:setPreferredSize(CCSizeMake(9, var_6_4))

		local var_6_5 = math.abs(var_6_1.height)
		local var_6_6 = math.abs(var_6_3.y)

		if var_6_6 > var_6_5 - var_6_2.height then
			return
		end

		local var_6_7 = (var_6_6 + var_6_2.height * 0.5) / var_6_5 * 237

		var_0_1.widgets.scrollbarSprite:setPosition(ccp(7.5, var_6_7))
	end
end

return var_0_1
