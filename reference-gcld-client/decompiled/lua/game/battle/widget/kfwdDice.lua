local var_0_0 = {}
local var_0_1 = {
	name = "diceNode",
	type = "node",
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5,
	children = {
		{
			y = 0,
			name = "wdhtz_bg",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/kfwd/dice/wdhtz_bg.png"
			}
		},
		{
			y = 200,
			name = "dicTitle",
			type = "sprite",
			x = -150,
			pic = {
				path = "res/ui/kfwd/dice/title1.png"
			}
		},
		{
			y = 200,
			name = "wdhtz_word_sy",
			type = "sprite",
			x = 150,
			pic = {
				path = "res/ui/kfwd/dice/wdhtz_word_sy.png"
			}
		},
		{
			y = 200,
			name = "wdhtz_word_miao",
			type = "sprite",
			x = 300.0005,
			pic = {
				path = "res/ui/kfwd/dice/wdhtz_word_miao.png"
			}
		},
		{
			name = "timeNumSp",
			type = "atlaslabel",
			pic = "res/ui/common/number/wdhtz_word_number.png",
			startCharMap = 48,
			text = "0",
			y = 200,
			itemWidth = 26,
			x = 234,
			itemHeight = 36
		},
		{
			type = "node",
			name = "myDice",
			y = 0,
			visible = false,
			x = 0,
			children = {
				{
					y = 0,
					name = "myDiceBg",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/kfwd/dice/diceBg1.png"
					}
				},
				{
					w = 58,
					name = "diceBtn",
					h = 60,
					type = "button",
					y = 0,
					x = 0,
					normal = {
						path = "res/ui/kfwd/dice/wdhtz_tzjg_0001.png"
					},
					touched = {
						path = "res/ui/kfwd/dice/wdhtz_tzjg_0001.png"
					}
				},
				{
					y = 0,
					name = "diceAnimation",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/kfwd/dice/wdhtz_tzjg_0001.png"
					}
				},
				{
					type = "sprite",
					name = "myDiceNumSp",
					y = 0,
					visible = false,
					x = 0,
					pic = {
						path = "Default/Sprite.png"
					},
					children = {
						{
							y = -150,
							name = "wdhtz_word_nzcl",
							type = "sprite",
							x = -50,
							pic = {
								path = "res/ui/kfwd/dice/wdhtz_word_nzcl.png"
							}
						},
						{
							y = -150,
							name = "wdhtz_word_dian",
							type = "sprite",
							x = 100,
							pic = {
								path = "res/ui/kfwd/dice/wdhtz_word_dian.png"
							}
						},
						{
							name = "myDiceNumC",
							type = "atlaslabel",
							pic = "res/ui/common/number/wdhtz_word_number.png",
							startCharMap = 48,
							text = "0",
							y = -150,
							itemWidth = 26,
							x = 55,
							itemHeight = 36
						}
					}
				}
			}
		},
		{
			type = "node",
			name = "diceResult",
			y = 0,
			visible = false,
			x = 0,
			children = {
				{
					y = 0,
					name = "diceBg1",
					type = "sprite",
					x = -200,
					pic = {
						path = "res/ui/kfwd/dice/diceBg1.png"
					}
				},
				{
					y = 0,
					name = "diceBg2",
					type = "sprite",
					x = 200,
					pic = {
						path = "res/ui/kfwd/dice/diceBg2.png"
					}
				},
				{
					y = 0,
					name = "leftDiceNum",
					type = "sprite",
					x = -200,
					pic = {
						path = "res/ui/kfwd/dice/wdhtz_tzjg_0001.png"
					}
				},
				{
					y = 0,
					name = "rightDiceNum",
					type = "sprite",
					x = 200,
					pic = {
						path = "res/ui/kfwd/dice/wdhtz_tzjg_0001.png"
					}
				},
				{
					y = -82,
					name = "who1",
					type = "sprite",
					x = -200,
					pic = {
						path = "res/ui/kfwd/dice/who1.png"
					}
				},
				{
					y = -82,
					name = "who2",
					type = "sprite",
					x = 200,
					pic = {
						path = "res/ui/kfwd/dice/who2.png"
					}
				},
				{
					y = -200,
					name = "diceResultMc",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/kfwd/dice/result1.png"
					}
				}
			}
		}
	}
}
local var_0_2 = {}

function var_0_0.create(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = createBaseLayer()

	var_0_0.info = arg_1_2
	var_0_0.diceAction = ""

	uiutil.initWidgets(var_0_2, var_0_1)

	local var_1_1 = CCLayerColor:create(ccc4(0, 0, 0, 180), visibleSize.width, visibleSize.height)

	var_1_0:addChild(var_1_1)
	var_1_1:addChild(var_0_2.widgets.diceNode)
	var_0_0:init(arg_1_2)
	var_0_0:update(arg_1_2)

	function var_1_0.onEnter(arg_2_0)
		return
	end

	function var_1_0.onExit(arg_3_0)
		var_0_0:clear()
	end

	arg_1_1.layerTabel.uiLayer:addChild(var_1_0, 999)
end

function var_0_0.update(arg_4_0, arg_4_1)
	var_0_2.widgets.diceAnimation:setPosition(ccp(0, 0))

	if arg_4_1.dice.foeDice == 0 or var_0_0.diceAction == "throw" then
		if arg_4_1.dice.ownDice == 0 then
			var_0_2.widgets.dicTitle:setDisplayFrame(CCSprite:create("res/ui/kfwd/dice/title1.png"):displayFrame())
		else
			var_0_2.widgets.dicTitle:setDisplayFrame(CCSprite:create("res/ui/kfwd/dice/title2.png"):displayFrame())
		end

		var_0_2.widgets.myDice:setVisible(true)
		var_0_2.widgets.diceResult:setVisible(false)

		if arg_4_1.dice.ownDice > 0 and var_0_0.diceAction == "" then
			var_0_2.widgets.diceAnimation:setDisplayFrame(tool.spriteFrameByName("wdDiceNum" .. arg_4_1.dice.ownDice .. ".png"))
			var_0_2.widgets.myDiceNumSp:setVisible(true)
			var_0_2.widgets.myDiceNumC:setString(tostring(arg_4_1.dice.ownDice))
			var_0_2.widgets.diceBtn:setVisible(false)
		end
	else
		var_0_2.widgets.dicTitle:setDisplayFrame(CCSprite:create("res/ui/kfwd/dice/title3.png"):displayFrame())
		var_0_2.widgets.myDice:setVisible(false)
		var_0_2.widgets.diceResult:setVisible(true)
		var_0_2.widgets.leftDiceNum:setDisplayFrame(tool.spriteFrameByName("wdDiceNum" .. arg_4_1.dice.ownDice .. ".png"))
		var_0_2.widgets.rightDiceNum:setDisplayFrame(tool.spriteFrameByName("wdDiceNum" .. arg_4_1.dice.foeDice .. ".png"))

		if arg_4_1.dice.ownDice > arg_4_1.dice.foeDice then
			var_0_2.widgets.diceResultMc:setDisplayFrame(CCSprite:create("res/ui/kfwd/dice/result1.png"):displayFrame())
		else
			var_0_2.widgets.diceResultMc:setDisplayFrame(CCSprite:create("res/ui/kfwd/dice/result2.png"):displayFrame())
		end
	end
end

function var_0_0.init(arg_5_0, arg_5_1)
	local function var_5_0()
		if var_0_0.timer then
			var_0_2.widgets.timeNumSp:setString(tostring(math.floor(var_0_0.timer.time)))
		end
	end

	var_0_2.widgets.myDiceNumSp:setVisible(false)
	var_0_2.widgets.dicTitle:setDisplayFrame(CCSprite:create("res/ui/kfwd/dice/title1.png"):displayFrame())

	if var_0_0.timer then
		var_0_0.timer.time = math.floor(arg_5_1.dice.cd / 1000)
	else
		var_0_0.timer = FrameTimer(math.floor(arg_5_1.dice.cd / 1000), var_5_0)
	end

	rmgr.loadResource("res/anim/dice/diceEffect/diceEffect.plist")
	rmgr.loadResource("res/anim/dice/diceNum/diceNum.plist")

	local function var_5_1()
		var_0_0.diceAction = "throw"

		if var_0_0.diceAction == "throw" then
			var_0_2.widgets.diceBtn:setVisible(false)
			var_0_0:runDiceAnimation()
		end
	end

	var_0_2.widgets.diceBtn:setVisible(true)
	var_0_2.widgets.diceBtn:addHandleOfControlEvent(var_5_1, CCControlEventTouchUpInside)
end

function var_0_0.runDiceAnimation(arg_8_0)
	local var_8_0 = CCArray:create()

	for iter_8_0 = 1, 15 do
		local var_8_1 = tool.spriteFrameByName("wdDiceEffect" .. iter_8_0 .. ".png")

		var_8_0:addObject(var_8_1)
	end

	local var_8_2 = CCAnimation:createWithSpriteFrames(var_8_0, 0.05)
	local var_8_3 = CCAnimate:create(var_8_2)
	local var_8_4 = CCArray:create()

	var_8_4:addObject(CCDelayTime:create(0.1))
	var_8_4:addObject(var_8_3)
	var_8_4:addObject(CCCallFuncN:create(function()
		var_0_0.diceAction = ""

		kfcmgr.sendRequest(function()
			bmgr.enterKfzb()
		end, actions.kfwdDice)
	end))

	local var_8_5 = CCSequence:create(var_8_4)

	var_0_2.widgets.diceAnimation:setPosition(ccp(0, 60))
	var_0_2.widgets.diceAnimation:runAction(var_8_5)
end

function var_0_0.clear(arg_11_0)
	var_0_0.diceAction = ""

	if var_0_0.timer then
		var_0_0.timer:clear()

		var_0_0.timer = nil
	end
end

return var_0_0
