local var_0_0 = {}
local var_0_1 = {}

if conf.language == "kr" then
	var_0_1.offset1 = 100
	var_0_1.offset2 = 200
else
	var_0_1.offset1 = 0
	var_0_1.offset2 = 0
end

var_0_0.technologyListBackground = {
	y = 50,
	name = "technologyListBackground",
	x = 17,
	type = "pic",
	anchorPointX = 0,
	anchorPointY = 0,
	pic = "res/ui/technology/technology-di.jpg"
}

function getTechResTipFrameWithPreferedSize(arg_1_0)
	return {
		delay = true,
		name = "techTipFrame",
		type = "pic_9",
		pic = "frame:technology-tips-zhuzi.png",
		middleRect = CCRectMake(6, 6, 482, 42),
		preferedSize = arg_1_0,
		children = {
			{
				fontSize = 20,
				font = "Thonburi",
				type = "label",
				y = 26,
				x = 76,
				text = language.get(50002),
				color = ccc3(233, 208, 170)
			},
			{
				fontSize = 20,
				name = "resourcesLabel",
				type = "label",
				anchorPointX = 0,
				text = "",
				font = "Thonburi",
				y = 26,
				x = 150,
				align = kCCTextAlignmentLeft
			}
		}
	}
end

var_0_0.techReadyForResearchPic = {
	name = "techReadyForResearchPic",
	type = "pic",
	delay = true,
	pic = "frame:technology-shangpiaodi.png",
	children = {
		{
			x = 432,
			name = "techReadyForResearchText",
			y = 26,
			type = "pic",
			pic = "frame:technology-meishuzi-yanjiu.png"
		}
	}
}

local function var_0_2(arg_2_0, arg_2_1)
	if arg_2_0.status == technologyListConstant.TECH_STATUS_UNOPENED then
		return {
			x = 445,
			y = 50,
			type = "pic",
			reuseID = "techDisabledPic",
			pic = "res/ui/technology/technology-neiban1.jpg",
			name = "techDisabledPic" .. arg_2_1
		}
	else
		return
	end
end

local function var_0_3(arg_3_0, arg_3_1)
	log.debug("getTechCellButton --- tech status : ", arg_3_0.status)

	if arg_3_0.status == technologyListConstant.TECH_STATUS_OPENED or arg_3_0.status == technologyListConstant.TECH_STATUS_INVESTED then
		log.debug("getTechCellButton --- tech status : open or invested ")

		return {
			y = 47,
			type = "button",
			x = 745,
			name = "investButton" .. arg_3_1,
			buttons = {
				{
					pic1 = {
						pics = {
							{
								pic = "frame:technology-anniu-y.png",
								children = {
									{
										fontSize = 20,
										x = 63,
										type = "label",
										font = "Thonburi",
										y = 27,
										strokeSize = 2,
										text = language.get(50003),
										color = colorText[10004],
										strokeColor = colorText[10005]
									}
								}
							}
						}
					},
					pic2 = {
						pics = {
							{
								pic = "frame:technology-anniu-y1.png",
								children = {
									{
										fontSize = 20,
										x = 63,
										type = "label",
										font = "Thonburi",
										y = 27,
										strokeSize = 2,
										text = language.get(50003),
										color = colorText[10004],
										strokeColor = colorText[10005]
									}
								}
							}
						}
					},
					callBack = function()
						technologyListControl.technologyInvest(arg_3_0.techId, arg_3_1)
					end
				}
			}
		}
	elseif arg_3_0.status == technologyListConstant.TECH_STATUS_READY then
		log.debug("getTechCellButton --- tech status : ready ")

		return {
			y = 47,
			type = "button",
			x = 745,
			name = "researchButton" .. arg_3_1,
			buttons = {
				{
					pic1 = {
						pics = {
							{
								pic = "frame:technology-anniu-g.png",
								children = {
									{
										fontSize = 20,
										x = 63,
										type = "label",
										font = "Thonburi",
										y = 27,
										strokeSize = 2,
										text = language.get(50004),
										color = colorText[10004],
										strokeColor = colorText[10005]
									}
								}
							}
						}
					},
					pic2 = {
						pics = {
							{
								pic = "frame:technology-anniu-g1.png",
								children = {
									{
										fontSize = 20,
										x = 63,
										type = "label",
										font = "Thonburi",
										y = 27,
										strokeSize = 2,
										text = language.get(50004),
										color = colorText[10004],
										strokeColor = colorText[10005]
									}
								}
							}
						}
					},
					callBack = function()
						technologyListControl.technologyResearch(arg_3_0.techId, arg_3_1)
					end
				}
			}
		}
	elseif arg_3_0.status == technologyListConstant.TECH_STATUS_RESEARCHING then
		log.debug("getTechCellButton --- tech status : researshing ")

		return {
			y = 47,
			type = "button",
			x = 745,
			name = "cdRecoverButton" .. arg_3_1,
			buttons = {
				{
					pic1 = {
						pics = {
							{
								pic = "frame:technology-anniu-g.png",
								children = {
									{
										fontSize = 20,
										x = 63,
										type = "label",
										font = "Thonburi",
										y = 27,
										strokeSize = 2,
										text = language.get(50005),
										color = colorText[10004],
										strokeColor = colorText[10005]
									}
								}
							}
						}
					},
					pic2 = {
						pics = {
							{
								pic = "frame:technology-anniu-g1.png",
								children = {
									{
										fontSize = 20,
										x = 63,
										type = "label",
										font = "Thonburi",
										y = 27,
										strokeSize = 2,
										text = language.get(50005),
										color = colorText[10004],
										strokeColor = colorText[10005]
									}
								}
							}
						}
					},
					callBack = function()
						technologyListControl.technologyCdRecover(arg_3_0.techId, arg_3_1)
					end
				}
			}
		}
	elseif arg_3_0.status == technologyListConstant.TECH_STATUS_EFFECTED then
		log.debug("getTechCellButton --- tech status : effected ")
		log.debug("effect tech in uidata")

		return {
			y = 47,
			pic = "frame:technology-yishengxiao.png",
			type = "pic",
			x = 745,
			name = "effectedPic" .. arg_3_1
		}
	end
end

local function var_0_4(arg_7_0, arg_7_1)
	if arg_7_0.status == technologyListConstant.TECH_STATUS_RESEARCHING then
		return {
			x = 476,
			y = 73,
			type = "pic",
			pic = "frame:technology-jindutiaodi.png",
			name = "progressBarBackground" .. arg_7_1,
			children = {
				{
					x = 123,
					y = 11,
					type = "process",
					pic = "frame:technology-jindutiao.png",
					name = "timerProgressBar" .. arg_7_1
				}
			}
		}
	end
end

local function var_0_5(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0.status
	local var_8_1
	local var_8_2 = false

	if var_8_0 ~= technologyListConstant.TECH_STATUS_UNOPENED and var_8_0 ~= technologyListConstant.TECH_STATUS_EFFECTED then
		var_8_1 = arg_8_0.pic .. ".jpg"
		var_8_2 = true
	elseif var_8_0 == technologyListConstant.TECH_STATUS_EFFECTED then
		var_8_1 = arg_8_0.pic .. ".jpg"
		var_8_2 = false
	else
		var_8_1 = "wenhao.jpg"
	end

	if not CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_8_1) then
		var_8_1 = "wenhao.jpg"
		var_8_2 = true
	end

	return {
		x = 50,
		type = "pic",
		y = 50,
		name = "technologyPic" .. arg_8_1,
		pic = string.format("frame:%s", var_8_1),
		isGray = var_8_2
	}
end

var_0_0.technologyList = {
	name = "technologyList",
	ycelling = 105,
	type = "list",
	top = 0,
	left = 463,
	itemRender = function(arg_9_0, arg_9_1)
		return {
			uis = {
				{
					type = "pic",
					pic = arg_9_0.status == technologyListConstant.TECH_STATUS_UNOPENED and "res/ui/technology/technology-neiban1.jpg" or "res/ui/technology/technology-neiban.jpg",
					name = "technologyCell" .. arg_9_1,
					children = {
						{
							visible = false,
							x = 445,
							type = "pic",
							y = 50,
							reuseID = "techHighlightPic",
							pic = "res/ui/technology/technology-neiban-xuanzhong.jpg",
							name = "techHighlightPic" .. arg_9_1
						},
						var_0_5(arg_9_0, arg_9_1),
						{
							fontSize = 20,
							name = "technologyName",
							x = 215,
							type = "label",
							font = "Thonburi",
							y = 70,
							width = 220,
							text = arg_9_0.name or "",
							align = kCCTextAlignmentLeft
						},
						{
							fontSize = 20,
							name = "technologyEffect",
							type = "label",
							font = "Thonburi",
							y = 30,
							text = arg_9_0.effect and tolua.type(arg_9_0.effect) ~= "[undefined]" and arg_9_0.effect or "",
							x = 345 + var_0_1.offset1,
							width = 480 + var_0_1.offset2,
							align = kCCTextAlignmentLeft
						},
						var_0_3(arg_9_0, arg_9_1),
						var_0_4(arg_9_0, arg_9_1)
					}
				}
			}
		}
	end
}

function getTechnologyListData()
	return var_0_0
end
