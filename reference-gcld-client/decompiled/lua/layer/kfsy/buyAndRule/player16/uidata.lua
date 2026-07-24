require("lua/layer/kfsy/buyAndRule/player16/constant")

local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.CTLS = -5
else
	var_0_0.CTLS = 0
end

local var_0_1 = {}
local var_0_2 = kfsyPlayerConstant.offset
local var_0_3 = kfsyPlayerConstant.currentX
local var_0_4 = kfsyPlayerConstant.currentY

function getPlayerCellLayerData(arg_1_0)
	local var_1_0 = {
		height = 440,
		name = "playerCellLayer",
		x = 18,
		type = "layer_color",
		y = 6,
		color = ccc4(0, 0, 255, 0),
		width = var_0_2 + var_0_3 * math.ceil(arg_1_0),
		children = {
			{
				name = "hightlight",
				type = "pic",
				pic = "res/ui/kfsy/kfsy_pmndih.png",
				x = var_0_2,
				y = var_0_4
			}
		}
	}

	for iter_1_0 = 1, arg_1_0 do
		local var_1_1 = var_0_2 + var_0_3 * (iter_1_0 - 1)
		local var_1_2 = var_0_4
		local var_1_3 = {
			type = "pic",
			pic = "res/ui/kfsy/kfsy_pmndi.png",
			name = "player" .. iter_1_0,
			x = var_1_1,
			y = var_1_2,
			children = {
				{
					xcenter = 0,
					y = 150,
					type = "pic",
					visible = true,
					pic = "res/ui/kfsy/kfsy_mzdi.png",
					name = "jiaosekuang" .. iter_1_0,
					children = {
						{
							xcenter = 0,
							fontSize = 23,
							type = "label",
							ycenter = 126,
							text = "QQQ",
							font = "Thonburi",
							strokeSize = 2,
							color = ccc3(255, 248, 197),
							strokeColor = ccc3(22, 18, 13)
						}
					}
				}
			}
		}

		table.insert(var_1_0.children, var_1_3)
	end

	return var_1_0
end

var_0_1.bg = {
	xcenter = 0,
	name = "bg",
	type = "pic_9",
	ycenter = -23,
	pic = "res/ui/general/jailView/comm_view_2.png",
	middleRect = CCRectMake(30, 30, 45, 45),
	preferedSize = CCSizeMake(930, 545),
	children = {
		{
			xcenter = -310,
			name = "girl",
			z = 150,
			type = "pic",
			ycenter = -40,
			pic = "res/ui/kfsy/kfsy_sv.png"
		},
		{
			xcenter = 130,
			name = "playerBackground",
			type = "pic_9",
			ycenter = 60,
			pic = "res/ui/general/jailView/comm_view_2.png",
			middleRect = CCRectMake(30, 30, 45, 45),
			preferedSize = CCSizeMake(620, 380),
			children = {
				{
					xcenter = 0,
					z = 10,
					fontSize = 21,
					type = "label",
					ycenter = 148,
					width = 550,
					height = 0,
					font = "Thonburi",
					strokeSize = 2,
					text = language.get(320413),
					color = ccc3(255, 248, 197),
					strokeColor = ccc3(22, 18, 13)
				}
			}
		},
		{
			xcenter = 130,
			z = 100,
			type = "pic",
			ycenter = -170,
			pic = "res/ui/kfsy/kfsy_goumai_di_small.png",
			children = {
				{
					xcenter = -170,
					name = "putongqingtie1",
					scale = 0.8,
					type = "pic",
					ycenter = 10,
					pic = "res/ui/kfsy/lvbu/lvdqj_qj.png"
				},
				{
					xcenter = -80,
					fontSize = 23,
					type = "label",
					ycenter = 0,
					font = "Thonburi",
					strokeSize = 2,
					text = language.get(320414),
					color = ccc3(0, 255, 0),
					strokeColor = ccc3(22, 18, 13)
				},
				{
					xcenter = 120,
					name = "shiyongcard",
					type = "label",
					ycenter = 0,
					width = 260,
					height = 0,
					font = "Thonburi",
					strokeSize = 2,
					fontSize = 21 + var_0_0.CTLS,
					color = ccc3(255, 248, 197),
					strokeColor = ccc3(22, 18, 13)
				}
			}
		},
		{
			xcenter = 130,
			name = "jinruyanhui1",
			z = 0,
			type = "button",
			ycenter = -170,
			buttons = {
				{
					pic2 = "res/ui/kfsy/kfsy_goumai_di_small.png",
					name = "enterButton1",
					pic1 = "res/ui/kfsy/kfsy_goumai_di.png",
					callBack = function()
						log.info("enterButton1")
						require("lua/layer/kfsy/buyAndRule/player16/control")
						kfsyPlayerControl.request_kfsyGetRoomInfo(1)
					end
				}
			}
		},
		{
			xcenter = 130,
			z = 100,
			type = "pic",
			ycenter = -230,
			pic = "res/ui/kfsy/kfsy_goumai_di_small.png",
			children = {
				{
					xcenter = -170,
					name = "putongqingtie1",
					scale = 0.8,
					type = "pic",
					ycenter = 10,
					pic = "res/ui/kfsy/zhaoyun/jxsy_icon_vipqj.png"
				},
				{
					xcenter = -80,
					fontSize = 23,
					type = "label",
					ycenter = 0,
					font = "Thonburi",
					strokeSize = 2,
					text = language.get(320414),
					color = ccc3(0, 255, 0),
					strokeColor = ccc3(22, 18, 13)
				},
				{
					xcenter = 120,
					name = "shiyongVipcard",
					type = "label",
					ycenter = 0,
					width = 260,
					height = 0,
					font = "Thonburi",
					strokeSize = 2,
					fontSize = 21 + var_0_0.CTLS,
					color = ccc3(255, 248, 197),
					strokeColor = ccc3(22, 18, 13)
				}
			}
		},
		{
			xcenter = 130,
			name = "jinruyanhui2",
			z = 0,
			type = "button",
			ycenter = -230,
			buttons = {
				{
					pic2 = "res/ui/kfsy/kfsy_goumai_di_small.png",
					name = "enterButton1",
					pic1 = "res/ui/kfsy/kfsy_goumai_di.png",
					callBack = function()
						log.info("enterButton2")
						require("lua/layer/kfsy/buyAndRule/player16/control")
						kfsyPlayerControl.request_kfsyGetRoomInfo(2)
					end
				}
			}
		}
	}
}

function getkfsyPlayerData()
	return var_0_1
end
