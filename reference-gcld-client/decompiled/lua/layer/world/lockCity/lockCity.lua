return {
	lockIconLayout = {
		y = 0,
		name = "lockIconNode",
		type = "node",
		x = 0,
		children = {
			{
				y = 0,
				type = "sprite",
				x = 80,
				pic = {
					path = "res/ui/world/cityLock/ccls_time_di.png"
				},
				children = {
					{
						fontSize = 20,
						name = "lockInfoLb",
						y = 22,
						type = "label",
						x = 73,
						text = language.get(214409)
					}
				}
			},
			{
				w = 50,
				name = "lockIconBtn",
				h = 50,
				type = "button",
				normal = {
					path = "res/ui/world/cityLock/ccls_icon_lock.png"
				},
				touched = {
					path = "res/ui/world/cityLock/ccls_icon_lock.png"
				}
			}
		}
	},
	layout_tipFrame = {
		name = "tipFrame",
		type = "sprite9",
		visible = false,
		pic = {
			frame = true,
			path = "common_tip_frame_small.png"
		},
		anchorPoint = ccp(1, 1),
		middleRect = CCRectMake(24, 24, 1, 1),
		preferedSize = CCSizeMake(160, 140),
		children = {
			{
				fontSize = 20,
				name = "tipMsg",
				height = 0,
				type = "label",
				width = 300,
				anchorPoint = ccp(0, 0),
				halign = kCCTextAlignmentLeft
			}
		}
	},
	lockUILayout = {
		y = 100,
		name = "lockUINode",
		type = "node",
		x = visibleSize.width * 0.5,
		children = {
			{
				y = 0,
				x = 0,
				type = "sprite",
				pic = {
					path = "res/ui/world/cityLock/ccls_word_di.png"
				}
			},
			{
				y = -20,
				x = -280,
				type = "sprite",
				pic = {
					path = "res/ui/world/cityLock/ccls_word_hkxz.png"
				}
			},
			{
				name = "cityNum",
				type = "atlaslabel",
				pic = "res/ui/common/number/ccls_word_number.png",
				startCharMap = 48,
				text = "2",
				y = -20,
				itemWidth = 32,
				x = -153,
				itemHeight = 40
			},
			{
				y = -20,
				x = 130,
				type = "sprite",
				pic = {
					path = "res/ui/world/cityLock/ccls_word_gwfxlccjxls.png"
				}
			},
			{
				w = 154,
				name = "fadongBtn",
				h = 112,
				type = "button",
				y = 50,
				x = 0,
				normal = {
					path = "res/ui/world/cityLock/ccls_btn_fdls.png"
				},
				touched = {
					path = "res/ui/world/cityLock/ccls_btn_fdls_c.png"
				}
			},
			{
				w = 104,
				name = "back",
				h = 50,
				type = "button",
				y = 25,
				x = 280,
				normal = {
					frame = true,
					path = "btn_back_a.png"
				},
				touched = {
					frame = true,
					path = "btn_back_c.png"
				}
			}
		}
	}
}
