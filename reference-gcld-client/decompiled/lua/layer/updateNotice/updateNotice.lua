require("lua/layer/updateNotice/udateNoticeConstants")

return {
	layout = {
		parent = "topLayer",
		widgets = {
			{
				name = "panel",
				type = "sprite",
				swallowTouch = true,
				pic = {
					frame = false,
					path = "res/ui/updateNotice/post_view_bg.png"
				},
				x = visibleSize.width * 0.5,
				y = visibleSize.height * 0.5,
				children = {
					{
						name = "closeButton",
						style = "button_gre2",
						zoomOnTouchDown = true,
						type = "button",
						y = 56,
						x = 328,
						label = {
							fontSize = 24,
							type = "label",
							strokeSize = 1,
							textId = 440000,
							strokeColor = colorText[10005]
						}
					},
					{
						y = 147,
						name = "contentView",
						type = "scrollview",
						x = 80,
						viewSize = CCSizeMake(updateNoticeView.width, updateNoticeView.height),
						dirction = kCCScrollViewDirectionVertical
					},
					{
						x = 590,
						name = "scrollbarBg",
						y = 240,
						type = "sprite",
						pic = {
							frame = false,
							path = "res/ui/updateNotice/gg_load_di.png"
						},
						children = {
							{
								x = 7.5,
								name = "scrollbarSprite",
								type = "sprite9",
								y = 233,
								pic = {
									frame = false,
									path = "res/ui/updateNotice/gg_load_con.png"
								},
								middleRect = CCRectMake(0, 0, 0, 0),
								preferedSize = CCSizeMake(9, 12)
							}
						}
					}
				}
			}
		}
	},
	create = function(arg_1_0)
		if conf.debug == true or user.player.playerLv < 30 then
			return
		end

		local var_1_0 = require("lua/layer/updateNotice/updateNoticeControl")

		var_1_0:init(arg_1_0.layout)
		var_1_0:getNotice()
	end
}
