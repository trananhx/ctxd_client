local var_0_0 = {}
local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.fontSize = 17
else
	var_0_1.fontSize = 20
end

local function var_0_2(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0.status
	local var_1_1
	local var_1_2 = false

	if arg_1_0.type == 1 then
		if var_1_0 ~= technologyListConstant.TECH_STATUS_UNOPENED and var_1_0 ~= technologyListConstant.TECH_STATUS_EFFECTED then
			var_1_1 = string.format("tech_icon_%s.jpg", arg_1_0.pic)
			var_1_2 = true
		elseif var_1_0 == technologyListConstant.TECH_STATUS_EFFECTED then
			var_1_1 = string.format("tech_icon_%s.jpg", arg_1_0.pic)
			var_1_2 = false
		else
			var_1_1 = var_1_0 == technologyListConstant.TECH_STATUS_UNOPENED and "tech_icon_next.jpg" or "tech_icon_wenhao.jpg"
		end

		if not CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_1_1) then
			var_1_1 = "tech_icon_wenhao.jpg"
			var_1_2 = true
		end
	elseif arg_1_0.type == 2 then
		if user.player.playerLv < arg_1_0.openConditionPic then
			arg_1_0.status = 2
		end

		var_1_1 = arg_1_0.status == 2 and "tech_icon_next.jpg" or string.format("tech_icon_%s.jpg", arg_1_0.pic)
	end

	local var_1_3 = CCSprite:createWithSpriteFrameName(var_1_1):getContentSize()

	return {
		xcenter = 0,
		type = "pic",
		y = 130,
		name = "techPic" .. arg_1_1,
		pic = string.format("frame:%s", var_1_1),
		isGray = var_1_2,
		scale = 72 / var_1_3.width
	}
end

local function var_0_3(arg_2_0)
	if arg_2_0.type == 1 then
		local var_2_0 = dragonTechConstant.techNamePic[arg_2_0.namePic] or "lm_tit_" .. arg_2_0.namePic .. ".png"

		return "res/ui/common/text/technology/techName/" .. var_2_0
	elseif arg_2_0.type == 2 then
		local var_2_1 = dragonTechConstant.techPic[arg_2_0.pic]

		if not var_2_1 then
			local var_2_2 = "lm_tit_" .. arg_2_0.namePic .. ".png"

			var_2_1 = "res/ui/common/text/technology/techName/" .. var_2_2
		end

		return var_2_1
	end
end

function getDragonTechUiData()
	var_0_0.dragonTechBackground = {
		anchorPointX = 0,
		name = "dragonTechViewBackground",
		x = 22.5,
		type = "pic",
		y = 30,
		anchorPointY = 0,
		pic = "res/ui/technology/dragonTech/lm_view_bg.jpg",
		children = {
			{
				y = 0,
				name = "oneTechPanel",
				x = 0,
				type = "layer_color",
				height = 521,
				visible = false,
				width = 915,
				color = ccc4(0, 0, 255, 0),
				children = {
					{
						xcenter = 0,
						y = 320,
						pic = "res/ui/technology/dragonTech/lm_bg.png",
						type = "pic"
					},
					{
						x = 150,
						y = 330,
						pic = "frame:lm_icon_view.png",
						type = "pic"
					},
					{
						x = 152,
						name = "techPic",
						y = 336,
						type = "pic",
						pic = "frame:tech_icon_next.jpg"
					},
					{
						text = "",
						name = "techInfo",
						type = "label",
						y = 325,
						x = 260,
						anchorPointX = 0,
						fontSize = var_0_1.fontSize,
						color = tool.hexToRgb("#FEFFCC")
					},
					{
						type = "button",
						buttons = {
							{
								pic2 = "frame:btn3_yel_c.png",
								name = "btn_open",
								pic1 = "frame:btn3_yel_a.png",
								y = 325,
								visible = false,
								x = 750
							}
						}
					},
					{
						fontSize = 25,
						name = "btn_text",
						x = 750,
						type = "label",
						text = "",
						y = 325,
						strokeSize = 2,
						color = ccc3(217, 234, 196),
						strokeColor = ccc3(17, 22, 14)
					}
				}
			},
			{
				y = 0,
				name = "twoTechPanel",
				x = 0,
				type = "layer_color",
				height = 521,
				visible = false,
				width = 915,
				color = ccc4(0, 0, 255, 0),
				children = {
					{
						xcenter = 0,
						y = 320,
						pic = "res/ui/technology/dragonTech/lm_bg.png",
						type = "pic"
					},
					{
						x = 150,
						y = 330,
						pic = "frame:lm_icon_view.png",
						type = "pic"
					},
					{
						x = 152,
						name = "techPicL",
						y = 336,
						type = "pic",
						pic = "frame:tech_icon_next.jpg"
					},
					{
						x = 763,
						y = 330,
						pic = "frame:lm_icon_view.png",
						type = "pic"
					},
					{
						x = 765,
						name = "techPicR",
						y = 336,
						type = "pic",
						pic = "frame:tech_icon_next.jpg"
					},
					{
						type = "button",
						buttons = {
							{
								pic2 = "res/ui/technology/dragonTech/lm_jt_h.png",
								name = "btn_left",
								pic1 = "res/ui/technology/dragonTech/lm_jt.png",
								y = 355,
								x = 260
							},
							{
								pic2 = "res/ui/technology/dragonTech/lm_jt_h.png",
								name = "btn_right",
								pic1 = "res/ui/technology/dragonTech/lm_jt.png",
								y = 295,
								x = 650
							}
						}
					}
				}
			}
		}
	}
	var_0_0.dragonTechList = {
		down = 0,
		name = "dragonTechList",
		xcelling = 160,
		type = "list",
		listHeight = 200,
		left = 0,
		listType = "hlist",
		itemRender = function(arg_4_0, arg_4_1)
			return {
				uis = {
					{
						pic = "frame:lm_icon_view_low_a.png",
						type = "pic",
						name = "dragonTechCell" .. arg_4_1,
						children = {
							{
								xcenter = 0,
								visible = false,
								type = "pic",
								ycenter = 5,
								pic = "frame:lm_icon_view_low_c.png",
								name = "shine_light" .. arg_4_1
							},
							{
								xcenter = 0,
								visible = false,
								type = "pic",
								ycenter = 5,
								pic = "frame:lm_icon_view_low_c.png",
								name = "light" .. arg_4_1
							},
							var_0_2(arg_4_0, arg_4_1),
							{
								xcenter = 0,
								y = 40,
								type = "pic",
								pic = var_0_3(arg_4_0)
							}
						}
					}
				}
			}
		end
	}

	return var_0_0
end
