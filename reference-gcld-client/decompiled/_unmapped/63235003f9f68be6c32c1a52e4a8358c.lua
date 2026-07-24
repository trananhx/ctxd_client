local var_0_0 = {}

local function var_0_1()
	if user.player.forceId == 1 then
		return "frame:nat_wei.png"
	elseif user.player.forceId == 2 then
		return "frame:nat_shu.png"
	elseif user.player.forceId == 3 then
		return "frame:nat_wu.png"
	end
end

local var_0_2 = {
	chongSprite1 = {
		type = "pic",
		pics = {
			{
				pic = "frame:icon_gold.png"
			}
		}
	},
	chongSprite2 = {
		type = "pic",
		pics = {
			{
				pic = "frame:icon_gold.png"
			}
		}
	}
}

var_0_0.setting = {
	z = 100,
	name = "chongMenu",
	type = "button",
	buttons = {
		{
			pic2 = "res/ui/playerInfo/setting/btn_set_lig.png",
			name = "setting",
			pic1 = "res/ui/playerInfo/setting/btn_set_a.png",
			type = "button",
			top = -55,
			right = -60
		}
	}
}
var_0_0.titleBarSprite = {
	left = 0,
	z = 2,
	type = "pic",
	top = 0,
	pic = "res/ui/mainCity/head_view_bg.png",
	children = {
		{
			left = 87,
			name = "goldSprite",
			visible = false,
			type = "pic",
			top = 5,
			pic = "frame:icon_gold.png"
		},
		{
			left = 7,
			name = "forceSprite",
			type = "pic",
			top = 13,
			pic = var_0_1()
		},
		{
			left = 74,
			name = "expSprite",
			visible = false,
			type = "pic",
			top = 45,
			pic = "frame:icon_exp.png"
		},
		{
			left = 82,
			name = "levelSprite",
			type = "pic",
			top = 45,
			pic = "frame:lv_tit.png"
		},
		{
			anchorPointX = 0,
			height = 21,
			name = "goldLabel",
			type = "atlas",
			x = 128,
			top = 8,
			pic = "res/ui/common/number/up_numb.png",
			text = "0",
			startChar = 48,
			anchorPointY = 0.5,
			width = 16
		},
		{
			width = 100,
			height = 45,
			name = "goldLabelLayer",
			type = "layer_color",
			anchorPointX = 0,
			top = 0,
			anchorPointY = 0.5,
			x = 128,
			color = ccc4(0, 0, 255, 0)
		},
		{
			width = 100,
			height = 45,
			name = "silverLabelLayer",
			type = "layer_color",
			anchorPointX = 0,
			top = 0,
			anchorPointY = 0.5,
			x = 259,
			color = ccc4(0, 0, 255, 0)
		},
		{
			width = 100,
			height = 45,
			name = "woodLabelLayer",
			type = "layer_color",
			anchorPointX = 0,
			top = 0,
			anchorPointY = 0.5,
			x = 402,
			color = ccc4(0, 0, 255, 0)
		},
		{
			width = 100,
			height = 45,
			name = "foodLabelLayer",
			type = "layer_color",
			anchorPointX = 0,
			top = 0,
			anchorPointY = 0.5,
			x = 541,
			color = ccc4(0, 0, 255, 0)
		},
		{
			width = 100,
			height = 45,
			name = "ironLabelLayer",
			type = "layer_color",
			anchorPointX = 0,
			top = 0,
			anchorPointY = 0.5,
			x = 683,
			color = ccc4(0, 0, 255, 0)
		},
		{
			anchorPointX = 0,
			height = 23,
			name = "lvLabel",
			type = "atlas",
			x = 120,
			top = 45,
			pic = "res/ui/common/number/lv_numb.png",
			text = "0",
			startChar = 48,
			anchorPointY = 0.5,
			width = 18
		},
		{
			y = 72,
			name = "goldEffect",
			z = 100,
			type = "pic",
			pic = "res/ui/playerInfo/gold/gold0001.png",
			x = 95
		},
		{
			z = 99,
			name = "chongMenu",
			type = "button",
			buttons = {
				{
					name = "chongItem",
					type = "button",
					y = 72,
					x = 95,
					pic1 = var_0_2.chongSprite1,
					pic2 = var_0_2.chongSprite2
				}
			}
		},
		{
			x = 117,
			name = "chargeSprite",
			y = 67,
			type = "pic",
			visible = true,
			pic = "res/ui/mainUI/btn_charge.png"
		},
		{
			visible = false,
			name = "goldWan",
			pic = "frame:up_numb_wan.png",
			type = "pic"
		},
		{
			visible = false,
			name = "goldYi",
			pic = "frame:up_numb_yi.png",
			type = "pic"
		},
		{
			visible = false,
			name = "silverWan",
			pic = "frame:up_numb_wan.png",
			type = "pic"
		},
		{
			visible = false,
			name = "silverYi",
			pic = "frame:up_numb_yi.png",
			type = "pic"
		},
		{
			visible = false,
			name = "woodWan",
			pic = "frame:up_numb_wan.png",
			type = "pic"
		},
		{
			visible = false,
			name = "woodYi",
			pic = "frame:up_numb_yi.png",
			type = "pic"
		},
		{
			visible = false,
			name = "foodWan",
			pic = "frame:up_numb_wan.png",
			type = "pic"
		},
		{
			visible = false,
			name = "foodYi",
			pic = "frame:up_numb_yi.png",
			type = "pic"
		},
		{
			visible = false,
			name = "ironWan",
			pic = "frame:up_numb_wan.png",
			type = "pic"
		},
		{
			visible = false,
			name = "ironYi",
			pic = "frame:up_numb_yi.png",
			type = "pic"
		},
		{
			x = 145,
			name = "icon_wmbt",
			y = -15,
			type = "pic",
			visible = false,
			pic = "res/ui/playerInfo/bn_wmbt_buff.png"
		},
		{
			x = 145,
			name = "icon_sdtj",
			y = -15,
			type = "pic",
			visible = false,
			pic = "res/ui/playerInfo/sdtj_expbuff_20.png"
		},
		{
			x = 145,
			name = "icon_offlineBuff",
			y = -15,
			type = "pic",
			scale = 0.75,
			visible = false,
			pic = "res/ui/offlineBuff/lx_buff_01.jpg"
		},
		{
			x = 145,
			name = "icon_seal",
			y = -15,
			type = "pic",
			scale = 0.75,
			visible = false,
			pic = "res/ui/weapon/godWeapon/seal_small.jpg"
		},
		{
			x = 145,
			name = "icon_topLv",
			y = -15,
			type = "pic",
			visible = false,
			pic = "res/ui/welfareNotice/forbid_exp.png"
		}
	}
}

local var_0_3 = {
	anchorPointX = 0,
	name = "expProcessTimer",
	left = 90,
	type = "process",
	top = 48,
	z = 100,
	pic = "frame:exp_deg_c.png"
}
local var_0_4 = {
	anchorPointX = 0,
	name = "expProcessCoverSprite",
	left = 90,
	type = "pic",
	top = 48,
	z = 101,
	pic = "frame:exp_deg_fra.png",
	children = {
		{
			text = "0%",
			name = "expValueLabel",
			fontSize = 26,
			type = "label",
			y = 8,
			x = 80
		}
	}
}
local var_0_5 = {
	anchorPointX = 0,
	height = 21,
	name = "silverLabel",
	type = "atlas",
	x = 274,
	top = 8,
	pic = "res/ui/common/number/up_numb.png",
	text = "0",
	startChar = 48,
	anchorPointY = 0.5,
	width = 16
}
local var_0_6 = {
	anchorPointX = 0,
	height = 21,
	name = "woodLabel",
	type = "atlas",
	x = 417,
	top = 8,
	pic = "res/ui/common/number/up_numb.png",
	text = "0",
	startChar = 48,
	anchorPointY = 0.5,
	width = 16
}
local var_0_7 = {
	anchorPointX = 0,
	height = 21,
	name = "foodLabel",
	type = "atlas",
	x = 556,
	top = 8,
	pic = "res/ui/common/number/up_numb.png",
	text = "0",
	startChar = 48,
	anchorPointY = 0.5,
	width = 16
}
local var_0_8 = {
	anchorPointX = 0,
	height = 21,
	name = "ironLabel",
	type = "atlas",
	x = 698,
	top = 8,
	pic = "res/ui/common/number/up_numb.png",
	text = "0",
	startChar = 48,
	anchorPointY = 0.5,
	width = 16
}
local var_0_9 = {
	left = 233,
	name = "silverSprite",
	type = "pic",
	top = 5,
	pic = "frame:icon_silver.png"
}
local var_0_10 = {
	left = 370,
	name = "woodSprite",
	type = "pic",
	top = 5,
	pic = "frame:icon_wood.png"
}
local var_0_11 = {
	left = 510,
	name = "foodSprite",
	type = "pic",
	top = 5,
	pic = "frame:icon_food.png"
}
local var_0_12 = {
	left = 650,
	name = "ironSprite",
	type = "pic",
	top = 5,
	pic = "frame:icon_iron.png"
}

table.insert(var_0_0.titleBarSprite.children, var_0_3)
table.insert(var_0_0.titleBarSprite.children, var_0_4)
table.insert(var_0_0.titleBarSprite.children, var_0_5)
table.insert(var_0_0.titleBarSprite.children, var_0_6)
table.insert(var_0_0.titleBarSprite.children, var_0_7)
table.insert(var_0_0.titleBarSprite.children, var_0_8)
table.insert(var_0_0.titleBarSprite.children, var_0_9)
table.insert(var_0_0.titleBarSprite.children, var_0_10)
table.insert(var_0_0.titleBarSprite.children, var_0_11)
table.insert(var_0_0.titleBarSprite.children, var_0_12)

local var_0_13 = {
	left = 0,
	name = "newYearSprite",
	type = "pic",
	top = 0,
	pic = "res/ui/common/playerHead/newyearFrame.png"
}

table.insert(var_0_0.titleBarSprite.children, var_0_13)

function getResTipsData(arg_2_0, arg_2_1)
	local var_2_0 = {}

	if conf.language == "kr" then
		var_2_0.goldFrameWidth = 100
		var_2_0.otherFrameWidth = 136
	elseif conf.language == "vie" then
		var_2_0.goldFrameWidth = 100
		var_2_0.otherFrameWidth = 136
	else
		var_2_0.goldFrameWidth = 0
		var_2_0.otherFrameWidth = 0
	end

	local var_2_1 = {
		language.get(310001),
		language.get(310002),
		language.get(310003),
		language.get(310004),
		language.get(310005)
	}
	local var_2_2 = {
		language.get(310006),
		language.get(310007),
		language.get(310008),
		language.get(310009),
		language.get(310010)
	}
	local var_2_3 = CCSizeMake(280 + var_2_0.otherFrameWidth, 120)
	local var_2_4 = {}

	if arg_2_0 ~= 1 then
		if arg_2_1.res > 100000 then
			arg_2_1.res = language.get(310011, math.floor(arg_2_1.res / 10000))
		end

		var_2_4.resMax = {
			top = 45,
			fontSize = 22,
			type = "label",
			left = 15,
			text = language.get(310012, arg_2_1.res, arg_2_1.max),
			color = colorText[10002],
			align = kCCTextAlignmentLeft
		}
		var_2_4.resOutput = {
			top = 75,
			fontSize = 22,
			type = "label",
			left = 15,
			text = language.get(310013, arg_2_1.output, var_2_1[arg_2_0]),
			color = colorText[10002],
			align = kCCTextAlignmentLeft
		}
	else
		var_2_3 = CCSizeMake(300 + var_2_0.goldFrameWidth, 55)
	end

	return {
		name = "resTipsFrame",
		z = 101,
		anchorPointX = 1,
		type = "pic_9",
		pic = "frame:common_tip_frame_small.png",
		anchorPointY = 0.5,
		middleRect = CCRectMake(8, 8, 33, 33),
		preferedSize = var_2_3,
		children = {
			{
				top = 15,
				fontSize = 22,
				type = "label",
				left = 15,
				text = var_2_2[arg_2_0],
				color = colorText[10002],
				align = kCCTextAlignmentLeft
			},
			var_2_4.resMax,
			var_2_4.resOutput
		}
	}
end

function getPlayerInfoData()
	return var_0_0
end
