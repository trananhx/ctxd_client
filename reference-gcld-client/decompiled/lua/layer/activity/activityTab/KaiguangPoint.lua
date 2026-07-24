local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.leftTimeYcenter = -30
	var_0_0.fntSize = -6
	var_0_0.btnFntSize = -4
elseif conf.language == "tha" then
	var_0_0.leftTimeYcenter = -30
	var_0_0.fntSize = -2
	var_0_0.btnFntSize = 0
else
	var_0_0.leftTimeYcenter = 0
	var_0_0.fntSize = 0
	var_0_0.btnFntSize = 0
end

local var_0_1 = class("KaiguangPoint", function()
	return createBaseLayer()
end)
local var_0_2 = {
	bg = {
		xcenter = 0,
		name = "bgyanhua",
		type = "pic",
		ycenter = -23,
		pic = "res/ui/playerInfo/invite/bg.jpg",
		children = {
			{
				xcenter = 270,
				name = "leftTime",
				type = "label",
				fontSize = 28,
				font = "Thonburi-Bold",
				ycenter = 205 + var_0_0.leftTimeYcenter,
				anchorPoint = ccp(0, 0),
				color = ccc3(253, 98, 98)
			},
			{
				xcenter = 0,
				name = "ygys",
				z = 200,
				type = "pic",
				ycenter = 215,
				pic = "res/ui/activity/kaiguang/kglb_title.png"
			},
			{
				xcenter = 0,
				name = "middlePanel",
				z = 200,
				type = "pic",
				ycenter = 140,
				pic = "res/default.png",
				children = {
					{
						z = 300,
						xcenter = -360,
						type = "label",
						ycenter = 0,
						height = 0,
						font = "Thonburi-Bold",
						width = 100,
						fontSize = 26 + var_0_0.fntSize,
						text = language.get(103047),
						color = ccc3(204, 185, 134)
					},
					{
						xcenter = 0,
						name = "processBarBackground",
						scale = 0.9,
						type = "pic",
						ycenter = 0,
						pic = "res/ui/activity/kaiguang/kglb_pb_bg.png",
						children = {
							{
								x = 0,
								name = "processBar",
								anchorPointX = 0,
								type = "process",
								ycenter = 0,
								anchorPointY = 0.5,
								pic = "res/ui/activity/kaiguang/kglb_pb.png",
								percentage = 80
							}
						}
					},
					{
						xcenter = 370,
						ycenter = 0,
						type = "button",
						buttons = {
							{
								pic2 = "frame:btn_default_lighted.png",
								name = "kaiguangButton",
								pic1 = "frame:btn_default_normal.png",
								children = {
									{
										xcenter = 0,
										font = "Thonburi-Bold",
										type = "label",
										ycenter = 0,
										fontSize = 20 + var_0_0.btnFntSize,
										text = language.get(103040),
										color = ccc3(255, 255, 255)
									}
								}
							}
						}
					},
					{
						xcenter = 0,
						name = "currentPoint_needPoint",
						fontSize = 24,
						type = "label",
						ycenter = -25,
						z = 300,
						text = "0/0",
						font = "Thonburi-Bold",
						color = ccc3(204, 185, 134)
					}
				}
			},
			{
				xcenter = 0,
				name = "downHalf",
				type = "pic_9",
				ycenter = -80,
				pic = "res/ui/activity/xilian/xs_view_1.png",
				middleRect = CCRectMake(10, 10, 60, 60),
				preferedSize = CCSizeMake(850, 330),
				children = {}
			}
		}
	}
}

local function var_0_3(arg_2_0, arg_2_1)
	arg_2_0[#arg_2_0 + 1] = arg_2_1

	return arg_2_1
end

function var_0_1.ctor(arg_3_0, arg_3_1, arg_3_2)
	for iter_3_0 = 1, 3 do
		local var_3_0 = 1

		if iter_3_0 == 1 then
			var_3_0 = 0.8
		end

		local var_3_1 = {
			type = "pic",
			ycenter = 0,
			pic = "res/ui/activity/kaiguang/kglb_samll_bg.png",
			name = "blockbg_" .. iter_3_0,
			xcenter = -538 + iter_3_0 * 269,
			children = {
				{
					xcenter = 10,
					type = "pic",
					ycenter = 80,
					pic = "res/ui/activity/kaiguang/kglb_bx.png",
					name = "box_" .. iter_3_0,
					scale = var_3_0
				},
				{
					xcenter = 0,
					y = 120,
					type = "pic",
					pic = "res/ui/activity/kaiguang/kglb_word_bg.png",
					children = {
						{
							type = "label",
							ycenter = 0,
							xcenter = 0,
							name = "giftName_" .. iter_3_0,
							text = language.get(103069 + iter_3_0, 0),
							fontSize = 22 + var_0_0.fntSize,
							color = colorText[10003]
						}
					}
				},
				{
					xcenter = -65,
					y = 72,
					pic = "frame:res_icon_19_small.png",
					type = "pic"
				},
				{
					xcenter = 25,
					type = "label",
					fontSize = 20,
					y = 74,
					strokeSize = 2,
					text = language.get(103073, 100, 5),
					name = "nextLabel_" .. iter_3_0,
					color = ccc3(188, 183, 183),
					strokeColor = ccc3(22, 18, 13)
				},
				{
					xcenter = 0,
					y = 35,
					type = "button",
					buttons = {
						{
							pic2 = "frame:btn5_gre_c.png",
							pic1 = "frame:btn5_gre_a.png",
							enable = false,
							name = "xilian_" .. iter_3_0,
							children = {
								{
									xcenter = 0,
									fontSize = 20,
									type = "label",
									ycenter = 0,
									strokeSize = 2,
									text = language.get(101018),
									color = ccc3(188, 183, 183),
									strokeColor = ccc3(22, 18, 13)
								}
							}
						}
					}
				}
			}
		}

		var_0_3(var_0_2.bg.children[4].children, var_3_1)

		if iter_3_0 == 3 then
			var_0_3(var_3_1.children, {
				xcenter = -35,
				name = "box_4",
				scale = 0.6,
				type = "pic",
				ycenter = 40,
				pic = "res/ui/activity/kaiguang/kglb_bx.png"
			})
			var_0_3(var_3_1.children, {
				xcenter = 50,
				name = "box_5",
				scale = 0.6,
				type = "pic",
				ycenter = 40,
				pic = "res/ui/activity/kaiguang/kglb_bx.png"
			})
		end
	end

	if arg_3_2 then
		arg_3_0.data = arg_3_2
	end

	arg_3_0.view = {}
	arg_3_0.view = autoUI.initUI(arg_3_0, var_0_2)

	arg_3_1:addChild(arg_3_0)

	arg_3_0.leftTime = arg_3_0.view.leftTime

	for iter_3_1 = 1, 3 do
		local function var_3_2(arg_4_0)
			if arg_4_0 and arg_4_0.action and arg_4_0.action.data then
				arg_3_0.data = arg_4_0.action.data
			end

			arg_3_0:setData()
		end

		local function var_3_3()
			local function var_5_0()
				local function var_6_0(arg_7_0)
					arg_3_0:playOpenBoxAnimation(iter_3_1)

					if arg_7_0.action.data then
						local var_7_0 = {
							{}
						}

						var_7_0[1].id = 10003
						var_7_0[1].value = arg_7_0.action.data.point

						globalAction_gotResource(var_7_0)
					end

					cmgr.sendRequest(var_3_2, actions.getKaiguangActivity)
				end

				cmgr.sendRequest(var_6_0, actions.getKaiguangReward, iter_3_1)
			end

			messageBox.confirm(language.get(103060, arg_3_0.data.gifts[iter_3_1].gold, arg_3_0.data.gifts[iter_3_1].point), var_5_0, language.get(10001))
		end

		arg_3_0.view["xilian_" .. iter_3_1]:registerScriptTapHandler(var_3_3)
	end

	local function var_3_4()
		require("lua/layer/equipment/ui")
		equipmentUI.show(4)
	end

	arg_3_0.view.kaiguangButton:registerScriptTapHandler(var_3_4)
	arg_3_0:setData()
end

function var_0_1.setData(arg_9_0)
	showTable(arg_9_0.data)

	local var_9_0 = 100

	if arg_9_0.data.needPoint > arg_9_0.data.currentPoint then
		var_9_0 = arg_9_0.data.currentPoint * 100 / arg_9_0.data.needPoint
	end

	arg_9_0.view.processBar:setPercentage(var_9_0)
	arg_9_0.view.currentPoint_needPoint:setString(arg_9_0.data.currentPoint .. "/" .. arg_9_0.data.needPoint)

	for iter_9_0 = 1, 3 do
		arg_9_0.view["giftName_" .. iter_9_0]:setString(language.get(103069 + iter_9_0, arg_9_0.data.gifts[iter_9_0].point))
		arg_9_0.view["nextLabel_" .. iter_9_0]:setString(language.get(103073, arg_9_0.data.gifts[iter_9_0].gold, arg_9_0.data.gifts[iter_9_0].num))

		if arg_9_0.data.gifts[iter_9_0].canBuy == 1 then
			arg_9_0.view["xilian_" .. iter_9_0]:setEnabled(true)
		else
			arg_9_0.view["xilian_" .. iter_9_0]:setEnabled(false)
		end
	end
end

function var_0_1.onEnter(arg_10_0)
	log.info("KaigongPoint:onEnter()")

	arg_10_0.touchBeganRef = handler(arg_10_0, arg_10_0.onTouchBegan)
	arg_10_0.touchMovedRef = handler(arg_10_0, arg_10_0.onTouchMoved)
	arg_10_0.touchEndedRef = handler(arg_10_0, arg_10_0.onTouchEnded)
	arg_10_0.touchCancelledRef = handler(arg_10_0, arg_10_0.onTouchCancelled)

	eventManager.registerEvent("globalOnTouchBegan", arg_10_0.touchBeganRef)
	eventManager.registerEvent("globalOnTouchMoved", arg_10_0.touchMovedRef)
	eventManager.registerEvent("globalOnTouchEnded", arg_10_0.touchEndedRef)
	eventManager.registerEvent("globalOnTouchCancelled", arg_10_0.touchCancelledRef)
end

function var_0_1.onExit(arg_11_0)
	log.info("KaigongPoint:onExit()")
	eventManager.unregisterEvent("globalOnTouchBegan", arg_11_0.touchBeganRef)
	eventManager.unregisterEvent("globalOnTouchMoved", arg_11_0.touchMovedRef)
	eventManager.unregisterEvent("globalOnTouchEnded", arg_11_0.touchEndedRef)
	eventManager.unregisterEvent("globalOnTouchCancelled", arg_11_0.touchCancelledRef)
end

function var_0_1.onTouchBegan(arg_12_0, arg_12_1, arg_12_2)
	return
end

function var_0_1.onTouchMoved(arg_13_0, arg_13_1, arg_13_2)
	return
end

function var_0_1.onTouchEnded(arg_14_0, arg_14_1, arg_14_2)
	return
end

function var_0_1.onTouchCancelled(arg_15_0, arg_15_1, arg_15_2)
	return
end

function var_0_1.playOpenBoxAnimation(arg_16_0, arg_16_1)
	local var_16_0 = {}
	local var_16_1 = {}
	local var_16_2 = {}

	if arg_16_1 == 1 then
		var_16_0[1] = 1
		var_16_1[1] = 0.8
		var_16_2[1] = 1
	elseif arg_16_1 == 2 then
		var_16_0[1] = 2
		var_16_1[1] = 1
		var_16_2[1] = 2
	elseif arg_16_1 == 3 then
		var_16_0[1] = 3
		var_16_1[1] = 1
		var_16_2[1] = 3
		var_16_0[2] = 4
		var_16_1[2] = 0.6
		var_16_2[2] = 3
		var_16_0[3] = 5
		var_16_1[3] = 0.6
		var_16_2[3] = 3
	end

	for iter_16_0 = 1, #var_16_0 do
		local var_16_3 = CCSprite:create("res/ui/activity/kaiguang/kglb_bxop.png")
		local var_16_4 = CCSprite:create("res/ui/activity/kaiguang/kglb_bx_light.png")

		var_16_4:setPosition(ccp(68, 168))
		var_16_3:addChild(var_16_4)

		local var_16_5, var_16_6 = arg_16_0.view["box_" .. var_16_0[iter_16_0]]:getPosition()

		log.info(var_16_5, var_16_6)
		var_16_3:setPosition(ccp(var_16_5, var_16_6))
		var_16_3:setScale(var_16_1[iter_16_0])
		arg_16_0.view["blockbg_" .. var_16_2[iter_16_0]]:addChild(var_16_3, 400)

		local var_16_7 = CCArray:create()

		var_16_7:addObject(CCDelayTime:create(0.5))
		var_16_7:addObject(CCCallFunc:create(function()
			var_16_3:removeFromParentAndCleanup(true)
		end))
		var_16_3:runAction(CCSequence:create(var_16_7))
	end
end

return var_0_1
