require("lua/common/tool")
require("lua/layer/astLogin/constant")
require("lua/layer/astLogin/control")
require("lua/layer/astLogin/loginView")
require("lua/layer/astLogin/registerView")

astLogin = astLogin or {}
astLogin.ui = astLogin.ui or {}

function astLogin.ui.create()
	local var_1_0 = createBaseLayer()

	var_1_0:setContentSize(CCDirector:sharedDirector():getWinSize())
	var_1_0:registerScriptTouchHandler(function()
		log.info("吞掉点击事件")

		return true
	end, false, true)
	var_1_0:setTouchEnabled(true)
	var_1_0:setZOrder(astLogin.constant.ZORDER)

	local var_1_1 = astLogin.control.create(var_1_0)

	var_1_1:init()

	function var_1_0.showLoginView()
		if not var_1_0.loginView then
			log.info("create ast login view")

			local var_3_0 = astLogin.ui.createLoginView(var_1_1)

			var_1_0:addChild(var_3_0)

			var_1_0.loginView = var_3_0
		else
			var_1_0.loginView:setVisible(true)
			var_1_0.registerView:setVisible(false)
		end
	end

	function var_1_0.showRegisterView()
		if not var_1_0.registerView then
			log.info("create ast register view")

			local var_4_0 = astLogin.ui.createRegisterView(var_1_1)

			var_1_0:addChild(var_4_0)

			var_1_0.registerView = var_4_0

			var_1_0.loginView:setVisible(false)
		else
			var_1_0.loginView:setVisible(false)
			var_1_0.registerView:setVisible(true)
		end
	end

	function var_1_0.onEnter(arg_5_0)
		log.info("ast login ui on enter")
		rmgr.loadResource("res/ui/login/login2.plist")
		var_1_0.showLoginView()
	end

	function var_1_0.onExit(arg_6_0)
		return
	end

	return var_1_0
end
