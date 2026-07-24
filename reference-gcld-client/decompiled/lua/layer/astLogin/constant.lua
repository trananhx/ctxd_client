astLogin = astLogin or {}

local var_0_0 = {}

astLogin.constant = var_0_0
var_0_0.ZORDER = 1000
var_0_0.server = {}
var_0_0.server.gameId = 1001
var_0_0.server.loginUrl = "http://testzz2.mobile.aoshitang.com/commonLogin.action?gameId=1001&username=%s&password=%s"
var_0_0.server.registerUrl = "http://testzz2.mobile.aoshitang.com/commonRegist.action?gameId=1001&mac=%s&username=%s&password=%s"
var_0_0.server.errorMsg = {
	[401] = "设备ID为空",
	[301] = "用户不存在",
	[302] = "用户已经存在",
	[303] = "密码错误",
	[304] = "临时用户不存在",
	[305] = "临时用户登录时设备信息与注册时不一致",
	[306] = "临时帐号已绑定",
	[307] = "用户注册异常",
	[308] = "用户名格式错误",
	[309] = "密码格式错误",
	[310] = "绑定用户异常",
	[311] = "临时用户游戏信息不一致",
	[601] = "游戏服务器不存在或已关闭",
	[602] = "游戏服务器不存在或已关闭",
	[501] = "充值卡卡号格式错误",
	[502] = "充值卡卡密码格式错误"
}

return var_0_0
