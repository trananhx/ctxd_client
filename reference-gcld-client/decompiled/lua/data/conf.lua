conf = {}
conf.debug = false
conf.language = "vie"
conf.useTestServerTxtUrl = false

if conf.language == "cn" then
	conf.serverAddress = "10.5.201.79"
	conf.serverPort = 9010
	conf.httpAddress = "http://s100001.gcmob.aoshitang.com/root/"
	conf.host = "s100001.gcmob.aoshitang.com"
elseif conf.language == "vie" then
	conf.serverAddress = "10.9.200.122"
	conf.serverPort = 8250
	conf.httpAddress = "http://10.5.201.80:8251/root/"
elseif conf.language == "tw" then
	conf.serverAddress = "10.9.200.122"
	conf.serverPort = 8280
	conf.httpAddress = "http://10.5.201.80:8281/root/"
elseif conf.language == "kr" then
	conf.serverAddress = "10.9.200.122"
	conf.serverPort = 8270
	conf.httpAddress = "http://10.5.201.80:8271/root/"
elseif conf.language == "tha" then
	conf.serverAddress = "10.9.200.122"
	conf.serverPort = 8240
	conf.httpAddress = "http://10.5.201.80:8241/root/"
elseif conf.language == "xm" then
	conf.serverAddress = "10.9.200.122"
	conf.serverPort = 8219
	conf.httpAddress = "http://10.5.201.80:8261/root/"
else
	assert(false)
end

conf.supportScoring = false
conf.openPay = true
conf.pay = 4
conf.alipayURL = "http://gc.aoshitang.com/GCLDOS/getorder.xhtml"

print("DeviceProxy:isJailbreak():", DeviceProxy:isJailbreak(), conf.pay)

conf.alipayPriceTable = {}

table.insert(conf.alipayPriceTable, {
	gold = 50,
	pic = 1,
	money = "5.00"
})
table.insert(conf.alipayPriceTable, {
	gold = 300,
	pic = 2,
	money = "30.00"
})
table.insert(conf.alipayPriceTable, {
	gold = 1000,
	pic = 3,
	money = "100.00"
})
table.insert(conf.alipayPriceTable, {
	gold = 2000,
	pic = 4,
	money = "200.00"
})
table.insert(conf.alipayPriceTable, {
	gold = 5000,
	pic = 5,
	money = "500.00"
})
table.insert(conf.alipayPriceTable, {
	gold = 10000,
	pic = 6,
	money = "1000.00"
})
table.insert(conf.alipayPriceTable, {
	gold = 20000,
	pic = 6,
	money = "2000.00"
})

conf.iapPriceTable = {}

table.insert(conf.iapPriceTable, {
	gold = 60,
	pic = 1,
	money = "600"
})
table.insert(conf.iapPriceTable, {
	gold = 240,
	pic = 2,
	money = "3000"
})
table.insert(conf.iapPriceTable, {
	gold = 490,
	pic = 3,
	money = "9800"
})
table.insert(conf.iapPriceTable, {
	gold = 1720,
	pic = 4,
	money = "19800"
})
table.insert(conf.iapPriceTable, {
	gold = 2980,
	pic = 5,
	money = "29800"
})
table.insert(conf.iapPriceTable, {
	gold = 6300,
	pic = 6,
	money = "51800"
})

conf.googlePayTwPriceTable = {}

table.insert(conf.googlePayTwPriceTable, {
	gold = 60,
	pic = 1,
	money = "800"
})
table.insert(conf.googlePayTwPriceTable, {
	gold = 490,
	pic = 2,
	money = "5800"
})
table.insert(conf.googlePayTwPriceTable, {
	gold = 1720,
	pic = 3,
	money = "21800"
})
table.insert(conf.googlePayTwPriceTable, {
	gold = 2980,
	pic = 4,
	money = "37800"
})
table.insert(conf.googlePayTwPriceTable, {
	gold = 6300,
	pic = 5,
	money = "78800"
})
table.insert(conf.googlePayTwPriceTable, {
	gold = 12000,
	pic = 6,
	money = "148800"
})

conf.googlePayKrPriceTable = {}

table.insert(conf.googlePayKrPriceTable, {
	gold = 30,
	pic = 1,
	money = "800"
})
table.insert(conf.googlePayKrPriceTable, {
	gold = 150,
	pic = 2,
	money = "3800"
})
table.insert(conf.googlePayKrPriceTable, {
	gold = 450,
	pic = 3,
	money = "11800"
})
table.insert(conf.googlePayKrPriceTable, {
	gold = 900,
	pic = 4,
	money = "23800"
})
table.insert(conf.googlePayKrPriceTable, {
	gold = 3000,
	pic = 5,
	money = "78800"
})

conf.iapPriceTableTw = {}

table.insert(conf.iapPriceTableTw, {
	gold = 60,
	pic = 1,
	money = "3000"
})
table.insert(conf.iapPriceTableTw, {
	gold = 240,
	pic = 2,
	money = "12000"
})
table.insert(conf.iapPriceTableTw, {
	gold = 490,
	pic = 3,
	money = "24000"
})
table.insert(conf.iapPriceTableTw, {
	gold = 1720,
	pic = 4,
	money = "84000"
})
table.insert(conf.iapPriceTableTw, {
	gold = 2980,
	pic = 5,
	money = "144000"
})
table.insert(conf.iapPriceTableTw, {
	gold = 6300,
	pic = 6,
	money = "299000"
})

conf.iapPriceTableKr = {}

table.insert(conf.iapPriceTableKr, {
	gold = 30,
	pic = 1,
	money = "99"
})
table.insert(conf.iapPriceTableKr, {
	gold = 150,
	pic = 2,
	money = "499"
})
table.insert(conf.iapPriceTableKr, {
	gold = 450,
	pic = 3,
	money = "1499"
})
table.insert(conf.iapPriceTableKr, {
	gold = 900,
	pic = 4,
	money = "2999"
})
table.insert(conf.iapPriceTableKr, {
	gold = 3000,
	pic = 5,
	money = "9999"
})

conf.iapPriceTableXm = {}

table.insert(conf.iapPriceTableXm, {
	gold = 60,
	pic = 1,
	money = "99"
})
table.insert(conf.iapPriceTableXm, {
	gold = 300,
	pic = 2,
	money = "499"
})
table.insert(conf.iapPriceTableXm, {
	gold = 600,
	pic = 3,
	money = "999"
})
table.insert(conf.iapPriceTableXm, {
	gold = 1200,
	pic = 4,
	money = "1999"
})
table.insert(conf.iapPriceTableXm, {
	gold = 3000,
	pic = 5,
	money = "4999"
})
table.insert(conf.iapPriceTableXm, {
	gold = 6000,
	pic = 6,
	money = "9999"
})

conf.iapPriceTableUjoytw = {}

table.insert(conf.iapPriceTableUjoytw, {
	gold = 60,
	pic = 1,
	money = "99"
})
table.insert(conf.iapPriceTableUjoytw, {
	gold = 300,
	pic = 2,
	money = "499"
})
table.insert(conf.iapPriceTableUjoytw, {
	gold = 600,
	pic = 3,
	money = "999"
})
table.insert(conf.iapPriceTableUjoytw, {
	gold = 1200,
	pic = 4,
	money = "1999"
})
table.insert(conf.iapPriceTableUjoytw, {
	gold = 3000,
	pic = 5,
	money = "4999"
})
table.insert(conf.iapPriceTableUjoytw, {
	gold = 6000,
	pic = 6,
	money = "9999"
})

conf.iapPriceTableTh = {}

table.insert(conf.iapPriceTableTh, {
	gold = 60,
	pic = 1,
	money = "99"
})
table.insert(conf.iapPriceTableTh, {
	gold = 300,
	pic = 2,
	money = "499"
})
table.insert(conf.iapPriceTableTh, {
	gold = 600,
	pic = 3,
	money = "999"
})
table.insert(conf.iapPriceTableTh, {
	gold = 900,
	pic = 4,
	money = "1499"
})
table.insert(conf.iapPriceTableTh, {
	gold = 1500,
	pic = 5,
	money = "2499"
})
table.insert(conf.iapPriceTableTh, {
	gold = 3000,
	pic = 6,
	money = "4999"
})

conf.iapItemIdTable = {
	"com.aoshitang.gcld.60gold",
	"com.aoshitang.gcld.300gold",
	"com.aoshitang.gcld.980gold",
	"com.aoshitang.gcld.1980gold",
	"com.aoshitang.gcld.2980gold",
	"com.aoshitang.gcld.3880gold",
	"com.aoshitang.gcld.6480gold"
}
conf.iapItemIdTableTw = {
	"com.cocodigitaltechnology.gongchenglueditw.iap.tier1",
	"com.cocodigitaltechnology.gongchenglueditw.iap.tier4",
	"com.cocodigitaltechnology.gongchenglueditw.iap.tier8",
	"com.cocodigitaltechnology.gongchenglueditw.iap.tier28",
	"com.cocodigitaltechnology.gongchenglueditw.iap.tier48",
	"com.cocodigitaltechnology.gongchenglueditw.iap.tier60"
}
conf.iapItemIdTableKr = {
	"702_0_1_30",
	"702_0_2_150",
	"702_0_3_450",
	"702_0_4_900",
	"702_0_5_3000"
}
conf.iapItemIdTableXm = {
	"gcld.a.creditUSD60",
	"gcld.a.creditUSD300",
	"gcld.a.creditUSD600",
	"gcld.a.creditUSD1200",
	"gcld.a.creditUSD3000",
	"gcld.a.creditUSD6000"
}
conf.iapItemIdTableUjoytw = {
	"gcldtw.ios.gold60",
	"gcldtw.ios.gold300",
	"gcldtw.ios.gold600",
	"gcldtw.ios.gold1200",
	"gcldtw.ios.gold3000",
	"gcldtw.ios.gold6000"
}
conf.iapItemIdTableTh = {
	"product_thgcld5_ios1",
	"product_thgcld5_ios2",
	"product_thgcld5_ios3",
	"product_thgcld5_ios4",
	"product_thgcld5_ios5",
	"product_thgcld5_ios6"
}

if conf.language == "cn" then
	conf.address = "http://42.62.46.151/"
elseif conf.language == "vie" then
	conf.address = "http://203.113.172.120/"
elseif conf.language == "kr" then
	conf.address = "http://121.78.58.9/"
elseif conf.language == "tw" then
	conf.address = "http://112.121.92.61/"

	print("台湾服务器旧地址", conf.address)
elseif conf.language == "tha" then
	conf.address = "http://202.129.206.148/"
elseif conf.language == "xm" then
	conf.address = "http://gcmobpatch.ujoy.com/"
end

if conf.language == "tw" then
	conf.serverVersion = "1.4.1.0"
else
	conf.serverVersion = "1.4.0.0"
end

conf.proxyAddress = "http://proxytest.gcmob.aoshitang.com/"
conf.wapAddress = "http://testos.mobile.aoshitang.com/"
conf.connectTime = 30
conf.modal = {}
conf.modal.requestTime = 3
conf.modal.loadingTIme = 3
