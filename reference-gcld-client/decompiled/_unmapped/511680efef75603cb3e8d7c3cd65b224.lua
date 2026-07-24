comment = {}

tool.requireRes("comment")
require("lua/component/timerLabel")

comment.ui = {}

function comment.ui.onTouch()
	return true
end

function comment.ui.click_close()
	smgr.getLayer("topLayer"):removeChild(comment.ui.table.layer, true)
end

function comment.ui.click_commit()
	local var_3_0 = "https://itunes.apple.com/cn/app/gong-cheng-e-de/id726652663?mt=8"

	if conf.language == "kr" then
		var_3_0 = loginData.userSource == "GooglePlay" and "https://play.google.com/store/apps/details?id=com.ilovemobilegame.ggplay.gcldkr" or loginData.userSource == "Tstore" and "http://www.tstore.co.kr/userpoc/game/view?pid=0000661179" or loginData.userSource == "Naver" and "http://nstore.naver.com/appstore/web/detail.nhn?productNo=1541818#" or "https://itunes.apple.com/kr/app/namgugnanse/id828829224?ls=1&mt=8"
	end

	CCApplication:sharedApplication():openURL(var_3_0)
end

function comment.ui.init()
	comment.ui.table.btn_commit:registerScriptTapHandler(comment.ui.click_commit)
	comment.ui.table.btn_close:registerScriptTapHandler(comment.ui.click_close)
end

function comment.ui.show()
	local var_5_0 = createBaseLayer()

	comment.ui.table = autoUI.initUI(var_5_0, getCommentData())
	comment.ui.table.layer = var_5_0

	var_5_0:registerScriptTouchHandler(comment.ui.onTouch, false, true)
	var_5_0:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_5_0, 10000)
	comment.ui.init()
	var_5_0:setVisible(true)
end
