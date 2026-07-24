local var_0_0 = {}

require("lua/layer/playerInfo2/ui")

function onGoToRechargeButtonTouched()
	playerInfo2.ui.show(2)
end

var_0_0.bg = {
	xcenter = 0,
	name = "bg",
	type = "pic_9",
	ycenter = -28,
	pic = "frame:bigPanel.png",
	middleRect = CCRectMake(30, 30, 45, 45),
	preferedSize = CCSizeMake(960, 560),
	children = {
		{
			xcenter = 0,
			name = "background",
			type = "pic",
			ycenter = 0,
			pic = "res/ui/limitedEditionGift/sc_bg.jpg",
			children = {
				{
					x = 613,
					name = "title",
					y = 472,
					type = "pic",
					pic = "res/ui/limitedEditionGift/xllb_title.png"
				},
				{
					scale = 0.95,
					name = "xiaoqian",
					left = 0,
					type = "pic",
					down = -10,
					pic = "res/ui/comment/xiaoqian.png"
				},
				{
					x = 613,
					name = "label",
					y = 336,
					type = "pic",
					pic = "res/ui/limitedEditionGift/xllb_tit.png"
				},
				{
					y = 59,
					name = "goToRechargeButton",
					type = "button",
					x = 613,
					buttons = {
						{
							pic2 = "res/ui/limitedEditionGift/xllb_btn_c.png",
							pic1 = "res/ui/limitedEditionGift/xllb_btn.png",
							callBack = onGoToRechargeButtonTouched
						}
					}
				}
			}
		}
	}
}
var_0_0.closeMenu = {
	type = "button",
	buttons = {
		{
			pic2 = "frame:btn_close_c.png",
			name = "closeItem",
			pic1 = "frame:btn_close_a.png",
			top = 5,
			right = 5
		}
	}
}

function getLimitedEditionGiftData()
	return var_0_0
end
