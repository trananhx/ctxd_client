local var_0_0 = {
	bg = {
		xcenter = 0,
		name = "bg",
		type = "pic",
		ycenter = -30,
		pic = "res/ui/weapon/diamondShop/warlock_view1.jpg",
		children = {
			{
				type = "button",
				buttons = {
					{
						pic2 = "frame:btnTip_c.png",
						name = "btn_tips",
						pic1 = "frame:btnTip_a.png",
						y = 504,
						x = 620
					}
				}
			},
			{
				name = "ticketNumber0",
				stroke = false,
				type = "label",
				fontSize = 22,
				y = 460,
				x = 15,
				anchorPointX = 0,
				text = language.get(137147)
			},
			{
				fontSize = 22,
				name = "ticketNumber",
				stroke = false,
				type = "label",
				anchorPointX = 0,
				x = 15,
				y = 460,
				color = ccc3(255, 255, 0)
			}
		}
	}
}

function getDiamondShopData()
	return var_0_0
end
