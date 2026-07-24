local var_0_0 = class("ActivityNotice", function()
	return createBaseLayer()
end)
local var_0_1 = require("lua/component/HtmlView")

var_0_0.layout = {
	y = 0,
	name = "Node",
	type = "node",
	x = 0,
	children = {
		{
			name = "panel",
			type = "sprite9",
			preferedSize = CCSizeMake(960, 580),
			middleRect = CCRectMake(30, 30, 45, 45),
			x = visibleSize.width / 2,
			y = visibleSize.height / 2 - 30,
			pic = {
				frame = true,
				path = "bigPanel.png"
			},
			children = {
				{
					name = "closeBtn",
					h = 33,
					type = "button",
					w = 32,
					scaleY = 2,
					y = 602.8595,
					scaleX = 2,
					x = 922.8773,
					normal = {
						frame = true,
						path = "btn_close_a.png"
					},
					touched = {
						frame = true,
						path = "btn_close_c.png"
					}
				},
				{
					y = 290,
					name = "sckq_bg",
					type = "sprite",
					x = 480,
					pic = {
						path = "res/ui/welfareNotice/sw_view.jpg"
					},
					children = {
						{
							y = 490,
							x = 457.5,
							type = "sprite",
							pic = {
								path = "res/ui/activity/znqhd_title.png"
							}
						},
						{
							y = 30,
							name = "infoScrollView",
							type = "scrollview",
							x = 8,
							viewSize = CCSizeMake(900, 400)
						}
					}
				}
			}
		}
	}
}

function var_0_0.ctor(arg_2_0, arg_2_1)
	log.info("@@ 活动公告")

	arg_2_0.view = {}

	uiutil.initWidgets(arg_2_0.view, arg_2_0.layout)

	if arg_2_1 then
		arg_2_0:addChild(arg_2_0.view.widgets.Node)
		arg_2_1:addChild(arg_2_0)
	end

	swallowTouch(arg_2_0)
	arg_2_0.view.widgets.closeBtn:addHandleOfControlEvent(handler(arg_2_0, arg_2_0.close), CCControlEventTouchUpInside)
	arg_2_0.view.widgets.infoScrollView:setDirection(kCCScrollViewDirectionVertical)
end

function var_0_0.onOpenUrl(arg_3_0, arg_3_1)
	local var_3_0 = tolua.cast(arg_3_1, "CCControlButton")
	local var_3_1 = tolua.cast(var_3_0:getUserObject(), "CCString"):getCString()

	CCApplication:sharedApplication():openURL(var_3_1)
end

function var_0_0.showView(arg_4_0, arg_4_1)
	if arg_4_1.activityBulletinInfo and #arg_4_1.activityBulletinInfo > 0 then
		local var_4_0 = 10
		local var_4_1 = 0
		local var_4_2 = createBaseLayer()

		for iter_4_0, iter_4_1 in ipairs(arg_4_1.activityBulletinInfo) do
			if iter_4_1 and iter_4_1.content then
				local var_4_3 = var_0_1:create({
					rowWidth = 900,
					htmlText = iter_4_1.content,
					onOpenUrl = var_0_0.onOpenUrl
				})

				var_4_3:setPosition(ccp(var_4_0, var_4_1))
				var_4_2:addChild(var_4_3)

				var_4_1 = var_4_1 - var_4_3:getContentSize().height - 20
			end
		end

		local var_4_4 = 0 - var_4_1

		var_4_2:setPosition(ccp(0, var_4_4))
		arg_4_0.view.widgets.infoScrollView:getContainer():addChild(var_4_2)
		arg_4_0.view.widgets.infoScrollView:setContentSize(CCSizeMake(900, var_4_4))
		arg_4_0.view.widgets.infoScrollView:setContentOffset(ccp(0, 400 - var_4_4))
	end
end

function var_0_0.request(arg_5_0)
	cmgr.sendRequest(function(arg_6_0)
		local var_6_0 = arg_6_0.action.data

		arg_5_0:showView(var_6_0)
	end, actions.getActivityBulletinInfo)
end

function var_0_0.onEnter(arg_7_0)
	arg_7_0:request()
end

function var_0_0.onExit(arg_8_0)
	return
end

function var_0_0.close(arg_9_0, arg_9_1, arg_9_2)
	amgr.playEffect(enumAudioFile.ui_dialog_close)
	smgr.getLayer("topLayer"):removeChild(arg_9_0, true)
end

return var_0_0
