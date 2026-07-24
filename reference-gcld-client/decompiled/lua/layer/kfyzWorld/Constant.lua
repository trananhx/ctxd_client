worldDongyingConstant = {}
worldMianzhanConstant = {}

if conf.language == "tha" then
	worldDongyingConstant.BUILDING_INFO = {
		world_building_4002 = {
			model = "dongYingCityCapital.png",
			name = "ไป๋จี่",
			x = 508,
			y = 238
		},
		world_building_4003 = {
			model = "dongYingCityShuiyu.png",
			name = "ท่าเรือเหนือม้าคู่",
			x = 810,
			y = 197
		},
		world_building_4004 = {
			model = "dongYingCity.png",
			name = "อม้าคู่",
			x = 1117,
			y = 316
		},
		world_building_4005 = {
			model = "dongYingCityShuiyu.png",
			name = "ท่าเรือยีจี",
			x = 1240,
			y = 557
		},
		world_building_4006 = {
			model = "dongYingCityShandi.png",
			name = "ยีจี",
			x = 1378,
			y = 722
		},
		world_building_4007 = {
			model = "dongYingCityShuiyu.png",
			name = "แม่น้ำยัวเชียน",
			x = 1566,
			y = 819
		},
		world_building_4008 = {
			model = "dongYingCity.png",
			name = "ยัวเชียน",
			x = 1519,
			y = 1010
		},
		world_building_4009 = {
			model = "dongYingCity.png",
			name = "จี้นเจียง",
			x = 1389,
			y = 1214
		},
		world_building_4010 = {
			model = "dongYingCity.png",
			name = "ยีชื่อ",
			x = 1591,
			y = 1465
		},
		world_building_4011 = {
			model = "dongYingCity.png",
			name = "ยีตัว",
			x = 1971,
			y = 1541
		},
		world_building_4012 = {
			model = "dongYingCityCapital.png",
			name = "เจียงหู่",
			x = 2354,
			y = 1537
		},
		world_building_4013 = {
			model = "dongYingCity.png",
			name = "ชานขอ",
			x = 863,
			y = 760
		},
		world_building_4014 = {
			model = "dongYingCityShuiyu.png",
			name = "ท่าเรือชานขอ",
			x = 479,
			y = 761
		},
		world_building_4015 = {
			model = "dongYingCityShandi.png",
			name = "กวยชาน(W)",
			x = 686,
			y = 958
		},
		world_building_4016 = {
			model = "dongYingCity.png",
			name = "กางฉือ",
			x = 378,
			y = 1026
		},
		world_building_4018 = {
			model = "dongYingCityPlain.png",
			name = "ปื่นชาน(N)",
			x = 402,
			y = 1434
		},
		world_building_4019 = {
			model = "dongYingCityShandi.png",
			name = "โกจี๋",
			x = 332,
			y = 1625
		},
		world_building_4020 = {
			model = "dongYingCity.png",
			name = "ก้งจื๋อ",
			x = 613,
			y = 1531
		},
		world_building_4021 = {
			model = "dongYingCityShuiyu.png",
			name = "แม่น้ำปื่นชาน",
			x = 790,
			y = 1666
		},
		world_building_4022 = {
			model = "dongYingCityPlain.png",
			name = "ยันชาง",
			x = 878,
			y = 1505
		},
		world_building_4023 = {
			model = "dongYingCityPlain.png",
			name = "จี้ยี(E)",
			x = 962,
			y = 1318
		},
		world_building_4024 = {
			model = "dongYingCityShandi.png",
			name = "กวยชาน",
			x = 928,
			y = 1082
		},
		world_building_4025 = {
			model = "dongYingCityPlain.png",
			name = "ปินเทียน",
			x = 1180,
			y = 964
		},
		world_building_4026 = {
			model = "dongYingCity.png",
			name = "จี้ยี",
			x = 1237,
			y = 1378
		},
		world_building_4027 = {
			model = "dongYingCityShuiyu.png",
			name = "แม่น้ำจี้นเจียง",
			x = 1736,
			y = 1265
		},
		world_building_4028 = {
			model = "dongYingCityShuiyu.png",
			name = "แม่น้ำชื่อ",
			x = 1657,
			y = 1656
		},
		world_building_4029 = {
			model = "dongYingCity.png",
			name = "โหลงชัน",
			x = 2141,
			y = 1336
		},
		world_building_4030 = {
			model = "dongYingCity.png",
			name = "ยัวห้อ",
			x = 1877,
			y = 1016
		},
		world_building_4031 = {
			model = "dongYingCityPlain.png",
			name = "ยัวห้อ(N)",
			x = 2034,
			y = 792
		},
		world_building_4032 = {
			model = "dongYingCity.png",
			name = "ชูนชั่ง",
			x = 2325,
			y = 879
		},
		world_building_4033 = {
			model = "dongYingCityPlain.png",
			name = "อูชัน",
			x = 2170,
			y = 1064
		},
		world_building_4034 = {
			model = "dongYingCityPlain.png",
			name = "ชูเห้อชวน",
			x = 2614,
			y = 936
		},
		world_building_4035 = {
			model = "dongYingCityPlain.png",
			name = "จังลุ(E)",
			x = 2674,
			y = 1172
		},
		world_building_4036 = {
			model = "dongYingCity.png",
			name = "จังลุ",
			x = 2423,
			y = 1258
		},
		world_building_4037 = {
			model = "dongYingCityShuiyu.png",
			name = "แม่น้ำเจียงหู้",
			x = 2654,
			y = 1458
		},
		world_building_4038 = {
			model = "dongYingCityShuiyu.png",
			name = "ยีนจี(W)",
			x = 1426,
			y = 155
		},
		world_building_4039 = {
			model = "dongYingCityShandi.png",
			name = "ยีนจี",
			x = 1726,
			y = 314
		},
		world_building_4040 = {
			model = "dongYingCityShuiyu.png",
			name = "แม่น้ำยัวห้อ",
			x = 1940,
			y = 527
		},
		world_building_4041 = {
			model = "dongYingCity.png",
			name = "จัวยัว",
			x = 2317,
			y = 570
		},
		world_building_4042 = {
			model = "dongYingCityShandi.png",
			name = "ชูยูน(S)",
			x = 2668,
			y = 565
		},
		world_building_4043 = {
			model = "dongYingCityPlain.png",
			name = "เซียนไท",
			x = 2812,
			y = 750
		},
		world_building_4044 = {
			model = "dongYingCity.png",
			name = "ชูยูน",
			x = 2549,
			y = 384
		},
		world_building_4045 = {
			model = "dongYingCityPlain.png",
			name = "ชูยู",
			x = 2501,
			y = 204
		},
		world_building_5001 = {
			model = "model604.png",
			name = "ค่ายใหญ่ของเรา",
			x = 1020,
			y = 1597
		},
		world_building_5001 = {
			model = "model604.png",
			name = "ค่ายใหญ่ของเรา",
			x = 1020,
			y = 1597
		},
		world_building_5002 = {
			model = "model101.png",
			name = "ถนนค่ายใหญ่(N)",
			x = 755,
			y = 1538
		},
		world_building_5003 = {
			model = "model301.png",
			name = "ถนนป่าไม้",
			x = 1177,
			y = 1455
		},
		world_building_5004 = {
			model = "model101.png",
			name = "ถนนค่ายใหญ่(E)",
			x = 1431,
			y = 1633
		},
		world_building_5005 = {
			model = "model301.png",
			name = "อันโตง(W)山",
			x = 1894,
			y = 1607
		},
		world_building_5006 = {
			model = "model301.png",
			name = "ฉวนโจ(W)山",
			x = 1063,
			y = 1282
		},
		world_building_5007 = {
			model = "model101.png",
			name = "ฉวนโจ(S)",
			x = 1461,
			y = 1354
		},
		world_building_5008 = {
			model = "model101.png",
			name = "อันโตง(W)",
			x = 1830,
			y = 1427
		},
		world_building_5009 = {
			model = "model604.png",
			name = "อันโตง",
			x = 2203,
			y = 1358
		},
		world_building_5010 = {
			model = "model101.png",
			name = "อันโตง(S)",
			x = 2334,
			y = 1537
		},
		world_building_5011 = {
			model = "model101.png",
			name = "ฉวนโจ(W)",
			x = 930,
			y = 1081
		},
		world_building_5012 = {
			model = "model604.png",
			name = "ฉวนโจ",
			x = 1499,
			y = 1106
		},
		world_building_5013 = {
			model = "model301.png",
			name = "ฉวนโจ(E)",
			x = 1767,
			y = 1170
		},
		world_building_5014 = {
			model = "model101.png",
			name = "อันโตง(N)",
			x = 2041,
			y = 1183
		},
		world_building_5015 = {
			model = "model301.png",
			name = "ซันเจ้อ(S)",
			x = 2234,
			y = 1073
		},
		world_building_5016 = {
			model = "model101.png",
			name = "อันโตง(E)",
			x = 2545,
			y = 1256
		},
		world_building_5017 = {
			model = "model401.png",
			name = "อีโจว(S)",
			x = 813,
			y = 925
		},
		world_building_5018 = {
			model = "model301.png",
			name = "ฉวนโจ(N)",
			x = 1181,
			y = 1042
		},
		world_building_5019 = {
			model = "model301.png",
			name = "อีโจว(E)",
			x = 1397,
			y = 887
		},
		world_building_5020 = {
			model = "model401.png",
			name = "คัยเฉือง(S)",
			x = 1792,
			y = 901
		},
		world_building_5021 = {
			model = "model101.png",
			name = "ซันเจ้อ(W)",
			x = 2120,
			y = 799
		},
		world_building_5022 = {
			model = "model604.png",
			name = "ซันเจ้อ",
			x = 2359,
			y = 863
		},
		world_building_5023 = {
			model = "model401.png",
			name = "ซันเจ้อ(E)",
			x = 2560,
			y = 990
		},
		world_building_5024 = {
			model = "model604.png",
			name = "อีโจว",
			x = 993,
			y = 795
		},
		world_building_5025 = {
			model = "model301.png",
			name = "อีโจว(W)",
			x = 614,
			y = 685
		},
		world_building_5026 = {
			model = "model101.png",
			name = "อีโจว(N)",
			x = 1244,
			y = 707
		},
		world_building_5027 = {
			model = "model301.png",
			name = "คัยเฉือง(W)",
			x = 1509,
			y = 670
		},
		world_building_5028 = {
			model = "model604.png",
			name = "คัยเฉือง",
			x = 1834,
			y = 713
		},
		world_building_5029 = {
			model = "model301.png",
			name = "คัยเฉือง(E)",
			x = 2014,
			y = 581
		},
		world_building_5030 = {
			model = "model401.png",
			name = "ซันเจ้อ(N)",
			x = 2548,
			y = 699
		},
		world_building_5031 = {
			model = "model305.png",
			name = "หุบเขาเจียงเจี้ย",
			x = 896,
			y = 585
		},
		world_building_5032 = {
			model = "model305.png",
			name = "หุบเขาฉังจิง",
			x = 1416,
			y = 472
		},
		world_building_5033 = {
			model = "model101.png",
			name = "คัยเฉือง(N)",
			x = 1725,
			y = 537
		},
		world_building_5034 = {
			model = "model301.png",
			name = "ภูเขานอกหมู่บ้าน",
			x = 2493,
			y = 535
		},
		world_building_5035 = {
			model = "model604.png",
			name = "เจียงเจี้ย",
			x = 777,
			y = 388
		},
		world_building_5036 = {
			model = "model604.png",
			name = "ฉังจิง",
			x = 1134,
			y = 401
		},
		world_building_5037 = {
			model = "model101.png",
			name = "หมู่บ้านชานเมือง(W)",
			x = 2257,
			y = 519
		},
		world_building_5038 = {
			model = "model401.png",
			name = "หมู่บ้านทะเลตะวันออก",
			x = 2346,
			y = 334
		},
		world_building_5039 = {
			model = "model604.png",
			name = "จิโจ",
			x = 1236,
			y = 213
		},
		world_building_5040 = {
			model = "model305.png",
			name = "หุบเขาจิโจ",
			x = 1450,
			y = 258
		},
		world_building_5041 = {
			model = "model301.png",
			name = "หยงชิง(W)山",
			x = 1663,
			y = 366
		},
		world_building_5042 = {
			model = "model101.png",
			name = "หยงชิงชานเมือง(E)",
			x = 1971,
			y = 419
		},
		world_building_5043 = {
			model = "model101.png",
			name = "หยงชิง(E)",
			x = 2257,
			y = 196
		},
		world_building_5044 = {
			model = "model604.png",
			name = "หยงชิง",
			x = 1931,
			y = 191
		},
		world_building_5045 = {
			model = "model301.png",
			name = "หยงชิง(W)",
			x = 1684,
			y = 186
		},
		world_building_5046 = {
			model = "model602.png",
			name = "ผิงรัง",
			x = 922,
			y = 216
		},
		world_building_6001 = {
			model = "model602.png",
			name = "ฮาหนอย",
			x = 2126,
			y = 1686
		},
		world_building_6002 = {
			model = "model101.png",
			name = "จังเชียง",
			x = 1881,
			y = 1646
		},
		world_building_6003 = {
			model = "model301.png",
			name = "ถังจิ่ง",
			x = 1979,
			y = 1471
		},
		world_building_6004 = {
			model = "model101.png",
			name = "ฮาหนอย(N)",
			x = 2275,
			y = 1611
		},
		world_building_6005 = {
			model = "worldBuildingSishi2.png",
			name = "เป๋ใต้",
			x = 1575,
			y = 1556
		},
		world_building_6006 = {
			model = "worldBuildingSishi2.png",
			name = "จูตุ",
			x = 1897,
			y = 1266
		},
		world_building_6007 = {
			model = "worldBuildingSishi2.png",
			name = "จิชู",
			x = 2241,
			y = 1402
		},
		world_building_6008 = {
			model = "model101.png",
			name = "วั่งเซียง",
			x = 880,
			y = 1665
		},
		world_building_6009 = {
			model = "model101.png",
			name = "เหรินชิง",
			x = 1197,
			y = 1686
		},
		world_building_6010 = {
			model = "model401.png",
			name = "เป๋ใต้แม่น้ำ",
			x = 1268,
			y = 1496
		},
		world_building_6011 = {
			model = "model301.png",
			name = "วั่งเตง(E)",
			x = 990,
			y = 1493
		},
		world_building_6012 = {
			model = "worldBuildingSishi2.png",
			name = "วั่งเตง",
			x = 713,
			y = 1408
		},
		world_building_6013 = {
			model = "model301.png",
			name = "เม๋ยซาน",
			x = 1008,
			y = 1284
		},
		world_building_6014 = {
			model = "model301.png",
			name = "ยั่นเฟย(S)",
			x = 1360,
			y = 1340
		},
		world_building_6015 = {
			model = "model101.png",
			name = "บูนจูน",
			x = 800,
			y = 1208
		},
		world_building_6016 = {
			model = "worldBuildingSishi2.png",
			name = "ยั่นเฟย",
			x = 1192,
			y = 1118
		},
		world_building_6017 = {
			model = "model301.png",
			name = "กาวพิง(W)",
			x = 1421,
			y = 1141
		},
		world_building_6018 = {
			model = "model401.png",
			name = "จูตุแม่น้ำ",
			x = 1690,
			y = 1169
		},
		world_building_6019 = {
			model = "model301.png",
			name = "ยุโพ(S)",
			x = 2081,
			y = 1161
		},
		world_building_6020 = {
			model = "model101.png",
			name = "จิชู(N)",
			x = 2431,
			y = 1304
		},
		world_building_6021 = {
			model = "model401.png",
			name = "คุนหาว(S)",
			x = 848,
			y = 986
		},
		world_building_6022 = {
			model = "model101.png",
			name = "หัวคุน",
			x = 1225,
			y = 964
		},
		world_building_6023 = {
			model = "model401.png",
			name = "หัวคุนแม่น้ำ",
			x = 1426,
			y = 831
		},
		world_building_6024 = {
			model = "model301.png",
			name = "กาวพิง",
			x = 1576,
			y = 1009
		},
		world_building_6025 = {
			model = "model101.png",
			name = "กาวพิง(N)",
			x = 1714,
			y = 849
		},
		world_building_6026 = {
			model = "model101.png",
			name = "ยุโพ",
			x = 1850,
			y = 1076
		},
		world_building_6027 = {
			model = "model401.png",
			name = "ยุโพแม่น้ำ",
			x = 2280,
			y = 1079
		},
		world_building_6028 = {
			model = "model101.png",
			name = "จ้างจือ",
			x = 1966,
			y = 915
		},
		world_building_6029 = {
			model = "model101.png",
			name = "อูพู(W)",
			x = 2243,
			y = 918
		},
		world_building_6030 = {
			model = "worldBuildingSishi2.png",
			name = "อูพู",
			x = 2642,
			y = 882
		},
		world_building_6031 = {
			model = "worldBuildingSishi2.png",
			name = "คุนหาว",
			x = 1060,
			y = 843
		},
		world_building_6032 = {
			model = "worldBuildingSishi2.png",
			name = "เซียนอัน",
			x = 1545,
			y = 640
		},
		world_building_6033 = {
			model = "worldBuildingSishi2.png",
			name = "อิลุ",
			x = 1880,
			y = 603
		},
		world_building_6034 = {
			model = "model101.png",
			name = "จูยิ(E)",
			x = 785,
			y = 841
		},
		world_building_6035 = {
			model = "model401.png",
			name = "ยินเหอ",
			x = 916,
			y = 689
		},
		world_building_6036 = {
			model = "worldBuildingSishi2.png",
			name = "จูยิ",
			x = 593,
			y = 698
		},
		world_building_6037 = {
			model = "model101.png",
			name = "จีเย่",
			x = 728,
			y = 611
		},
		world_building_6038 = {
			model = "worldBuildingSishi2.png",
			name = "ซิงอัน",
			x = 910,
			y = 503
		},
		world_building_6039 = {
			model = "model101.png",
			name = "ซิงอัน(E)",
			x = 1108,
			y = 379
		},
		world_building_6040 = {
			model = "model101.png",
			name = "ฟุชัว(S)",
			x = 1423,
			y = 490
		},
		world_building_6041 = {
			model = "model101.png",
			name = "อิลุ(N)",
			x = 1838,
			y = 471
		},
		world_building_6042 = {
			model = "model401.png",
			name = "โลงเปียนแม่น้ำ",
			x = 2104,
			y = 347
		},
		world_building_6043 = {
			model = "model604.png",
			name = "ฟุชัว",
			x = 1315,
			y = 247
		},
		world_building_6046 = {
			model = "model602.png",
			name = "ตูเว่ย",
			x = 1572,
			y = 191
		},
		world_building_6044 = {
			model = "model604.png",
			name = "สิกัน",
			x = 1593,
			y = 345
		},
		world_building_6045 = {
			model = "model604.png",
			name = "โลงเปียน",
			x = 1847,
			y = 202
		},
		world_building_7001 = {
			model = "model602.png",
			name = "เมืองหลวงรีวกีว",
			x = 290,
			y = 192
		},
		world_building_7002 = {
			model = "model604.png",
			name = "นาม",
			x = 271,
			y = 386
		},
		world_building_7003 = {
			model = "model101.png",
			name = "นามชาย",
			x = 373,
			y = 623
		},
		world_building_7004 = {
			model = "model604.png",
			name = "คิมวู",
			x = 529,
			y = 335
		},
		world_building_7005 = {
			model = "model101.png",
			name = "คิมวูตง",
			x = 849,
			y = 390
		},
		world_building_7006 = {
			model = "model301.png",
			name = "ภูเขาหยุนเทียน",
			x = 674,
			y = 529
		},
		world_building_7007 = {
			model = "model401.png",
			name = "น่านน้ำเยว่ไหล",
			x = 1005,
			y = 677
		},
		world_building_7008 = {
			model = "model101.png",
			name = "เยว่ไหล",
			x = 1057,
			y = 459
		},
		world_building_7009 = {
			model = "model604.png",
			name = "จิ่วจื้อ",
			x = 546,
			y = 150
		},
		world_building_7010 = {
			model = "model301.png",
			name = "กู้ฉ่างเย่ว์",
			x = 856,
			y = 141
		},
		world_building_7011 = {
			model = "model401.png",
			name = "เทียนจิน",
			x = 1233,
			y = 270
		},
		world_building_7012 = {
			model = "model401.png",
			name = "จี้เจี้ย",
			x = 1554,
			y = 234
		},
		world_building_7013 = {
			model = "model301.png",
			name = "อีซัน",
			x = 1821,
			y = 140
		},
		world_building_7014 = {
			model = "model101.png",
			name = "อีจี๋",
			x = 2158,
			y = 170
		},
		world_building_7015 = {
			model = "model301.png",
			name = "ภูเขาตะวันตก",
			x = 2505,
			y = 176
		},
		world_building_7016 = {
			model = "model401.png",
			name = "ตู้นาจี้",
			x = 2475,
			y = 402
		},
		world_building_7017 = {
			model = "model301.png",
			name = "ภูเขาตะวันออก",
			x = 2751,
			y = 359
		},
		world_building_7018 = {
			model = "model101.png",
			name = "อีเหลียงเป่า",
			x = 2593,
			y = 679
		},
		world_building_7019 = {
			model = "model101.png",
			name = "โหยวลื้อเป่ย",
			x = 1966,
			y = 320
		},
		world_building_7020 = {
			model = "model604.png",
			name = "โหยวลื้อ",
			x = 2191,
			y = 434
		},
		world_building_7021 = {
			model = "model101.png",
			name = "เสี่ยวบี้เย้",
			x = 1804,
			y = 457
		},
		world_building_7022 = {
			model = "model401.png",
			name = "ป้าถูม้า",
			x = 2117,
			y = 646
		},
		world_building_7023 = {
			model = "model401.png",
			name = "น่านน้ำห้าเมือง",
			x = 1277,
			y = 600
		},
		world_building_7024 = {
			model = "model101.png",
			name = "ห้าเมืองเหนือ",
			x = 1442,
			y = 719
		},
		world_building_7025 = {
			model = "model401.png",
			name = "สะพานชางเฟง",
			x = 1765,
			y = 678
		},
		world_building_7026 = {
			model = "model401.png",
			name = "น่านน้ำเชียนเฉิง",
			x = 1973,
			y = 956
		},
		world_building_7027 = {
			model = "model604.png",
			name = "ห้าเมืองเหนือ",
			x = 1498,
			y = 884
		},
		world_building_7028 = {
			model = "model101.png",
			name = "เชียนเฉิงเหนือ",
			x = 1739,
			y = 921
		},
		world_building_7029 = {
			model = "model604.png",
			name = "เชียนเฉิง",
			x = 1588,
			y = 1165
		},
		world_building_7030 = {
			model = "model401.png",
			name = "ปั๋วจีน",
			x = 1300,
			y = 1176
		},
		world_building_7031 = {
			model = "model301.png",
			name = "เจินบี่",
			x = 1269,
			y = 989
		},
		world_building_7032 = {
			model = "model301.png",
			name = "เบียนเย่ว์",
			x = 1081,
			y = 897
		},
		world_building_7033 = {
			model = "model101.png",
			name = "ผูเทียน",
			x = 381,
			y = 942
		},
		world_building_7034 = {
			model = "model101.png",
			name = "ซื่อน่าเป่ย",
			x = 478,
			y = 1086
		},
		world_building_7035 = {
			model = "model401.png",
			name = "ยี่เหยี่ยวาน",
			x = 798,
			y = 1030
		},
		world_building_7036 = {
			model = "model604.png",
			name = "ซื่อน่า",
			x = 538,
			y = 1228
		},
		world_building_7037 = {
			model = "model101.png",
			name = "ตงหยวน",
			x = 885,
			y = 1294
		},
		world_building_7038 = {
			model = "model604.png",
			name = "เฟิ่งเจียนเฉิง",
			x = 1147,
			y = 1429
		},
		world_building_7039 = {
			model = "model401.png",
			name = "บัวซ่าง",
			x = 1499,
			y = 1451
		},
		world_building_7040 = {
			model = "model301.png",
			name = "ซื่อน่าเย่ว์",
			x = 240,
			y = 1249
		},
		world_building_7041 = {
			model = "model101.png",
			name = "ซี่หยวน",
			x = 257,
			y = 1492
		},
		world_building_7042 = {
			model = "model301.png",
			name = "ตู้กู๋ซัน",
			x = 498,
			y = 1582
		},
		world_building_7043 = {
			model = "model301.png",
			name = "เที่ยนจิ่วซัน",
			x = 570,
			y = 1403
		},
		world_building_7044 = {
			model = "model604.png",
			name = "เม้ยลี๋",
			x = 836,
			y = 1501
		},
		world_building_7045 = {
			model = "model401.png",
			name = "น่านน้ำเมียนน่า",
			x = 2665,
			y = 879
		},
		world_building_7046 = {
			model = "model101.png",
			name = "เมียนน่าเหนือ",
			x = 2460,
			y = 987
		},
		world_building_7047 = {
			model = "model604.png",
			name = "เมียนน่า",
			x = 2471,
			y = 1200
		},
		world_building_7048 = {
			model = "model101.png",
			name = "เมียนน่าตะวันตก",
			x = 2788,
			y = 1206
		},
		world_building_7049 = {
			model = "model401.png",
			name = "จีนจี้นู้",
			x = 2181,
			y = 964
		},
		world_building_7050 = {
			model = "model401.png",
			name = "อีจี๋ม้า",
			x = 1987,
			y = 1279
		},
		world_building_7051 = {
			model = "model301.png",
			name = "ม้ากูซัน",
			x = 2209,
			y = 1239
		},
		world_building_7052 = {
			model = "model604.png",
			name = "บาที่",
			x = 2213,
			y = 1426
		},
		world_building_7053 = {
			model = "model401.png",
			name = "เหนียวบาหมา",
			x = 1717,
			y = 1456
		},
		world_building_7054 = {
			model = "model301.png",
			name = "กู้มี้ซัน",
			x = 2019,
			y = 1605
		},
		world_building_7055 = {
			model = "model301.png",
			name = "บาจู๋งซัน",
			x = 2525,
			y = 1418
		},
		world_building_7056 = {
			model = "model602.png",
			name = "ค่ายพักทีมเดินทาง",
			x = 2758,
			y = 1472
		},
		world_building_8001 = {
			model = "worldBuildingChengchi1.png",
			name = "เหมิงชานเชียว",
			x = 2768,
			y = 179
		},
		world_building_8002 = {
			model = "model101.png",
			name = "ฉู่ฉง",
			x = 2480,
			y = 160
		},
		world_building_8003 = {
			model = "model305.png",
			name = "เมาเหอ",
			x = 2102,
			y = 135
		},
		world_building_8004 = {
			model = "model101.png",
			name = "ตู้เชือก",
			x = 1740,
			y = 133
		},
		world_building_8005 = {
			model = "model101.png",
			name = "ฮาเหยิน",
			x = 1352,
			y = 117
		},
		world_building_8006 = {
			model = "model101.png",
			name = "ต้าลี้",
			x = 2520,
			y = 389
		},
		world_building_8007 = {
			model = "model401.png",
			name = "ลิ้นซอง",
			x = 2272,
			y = 449
		},
		world_building_8008 = {
			model = "model101.png",
			name = "กิมสี",
			x = 1982,
			y = 347
		},
		world_building_8009 = {
			model = "model305.png",
			name = "มาตา",
			x = 1584,
			y = 369
		},
		world_building_8010 = {
			model = "model101.png",
			name = "ต้าลี",
			x = 2835,
			y = 440
		},
		world_building_8011 = {
			model = "model401.png",
			name = "ยางติ",
			x = 2005,
			y = 594
		},
		world_building_8012 = {
			model = "model101.png",
			name = "เยียวอาน",
			x = 2815,
			y = 717
		},
		world_building_8013 = {
			model = "model401.png",
			name = "ยินสี",
			x = 2350,
			y = 673
		},
		world_building_8014 = {
			model = "model301.png",
			name = "เซี่ยนสี",
			x = 2620,
			y = 870
		},
		world_building_8015 = {
			model = "model101.png",
			name = "ฟากสือ",
			x = 2880,
			y = 997
		},
		world_building_8016 = {
			model = "model101.png",
			name = "โมงไท้ดาม",
			x = 973,
			y = 180
		},
		world_building_8017 = {
			model = "worldBuildingChengchi1.png",
			name = "เย่วตีกเจ้า",
			x = 1232,
			y = 332
		},
		world_building_8018 = {
			model = "model101.png",
			name = "ไท้เฮ่า",
			x = 1340,
			y = 573
		},
		world_building_8019 = {
			model = "worldBuildingChengchi1.png",
			name = "หลางคุงเจ้า",
			x = 1717,
			y = 590
		},
		world_building_8020 = {
			model = "model101.png",
			name = "หวินเซือง",
			x = 2067,
			y = 897
		},
		world_building_8021 = {
			model = "worldBuildingChengchi1.png",
			name = "ดั่งด่ามเจ้า",
			x = 2401,
			y = 962
		},
		world_building_8022 = {
			model = "model101.png",
			name = "หลานวูมาน",
			x = 2757,
			y = 1277
		},
		world_building_8023 = {
			model = "model602.png",
			name = "ธีหลางเจ้า",
			x = 830,
			y = 420
		},
		world_building_8024 = {
			model = "model602.png",
			name = "โมงซ้าเจ้า",
			x = 1623,
			y = 832
		},
		world_building_8025 = {
			model = "model602.png",
			name = "สินหายเฉิน",
			x = 2356,
			y = 1186
		},
		world_building_8026 = {
			model = "model305.png",
			name = "หายสีเมียน",
			x = 442,
			y = 182
		},
		world_building_8027 = {
			model = "model305.png",
			name = "ฮงวู",
			x = 237,
			y = 427
		},
		world_building_8028 = {
			model = "model101.png",
			name = "วงสี",
			x = 536,
			y = 536
		},
		world_building_8029 = {
			model = "model305.png",
			name = "คาวหิน",
			x = 787,
			y = 740
		},
		world_building_8030 = {
			model = "model101.png",
			name = "วูหลาง",
			x = 1187,
			y = 822
		},
		world_building_8031 = {
			model = "model101.png",
			name = "หลงตง",
			x = 1460,
			y = 1085
		},
		world_building_8032 = {
			model = "model301.png",
			name = "ดีจิง",
			x = 1990,
			y = 1150
		},
		world_building_8033 = {
			model = "model101.png",
			name = "สีมาว",
			x = 2240,
			y = 1397
		},
		world_building_8034 = {
			model = "model305.png",
			name = "ไป๋ไว",
			x = 2592,
			y = 1490
		},
		world_building_8035 = {
			model = "model101.png",
			name = "หายเซียน",
			x = 166,
			y = 744
		},
		world_building_8036 = {
			model = "worldBuildingChengchi1.png",
			name = "ดั่งเซียน",
			x = 462,
			y = 762
		},
		world_building_8037 = {
			model = "worldBuildingChengchi1.png",
			name = "โลนเขา",
			x = 1022,
			y = 1032
		},
		world_building_8038 = {
			model = "model305.png",
			name = "เซียนโกน",
			x = 1735,
			y = 1300
		},
		world_building_8039 = {
			model = "worldBuildingChengchi1.png",
			name = "โมงซ้า",
			x = 1955,
			y = 1492
		},
		world_building_8040 = {
			model = "model101.png",
			name = "เต๋อเสวียน",
			x = 2260,
			y = 1632
		},
		world_building_8041 = {
			model = "model101.png",
			name = "เมี้ยววาย",
			x = 365,
			y = 1047
		},
		world_building_8042 = {
			model = "model401.png",
			name = "วงงาว",
			x = 655,
			y = 1095
		},
		world_building_8043 = {
			model = "model401.png",
			name = "ธงสี",
			x = 1355,
			y = 1322
		},
		world_building_8044 = {
			model = "model401.png",
			name = "ตักสี",
			x = 1690,
			y = 1614
		},
		world_building_8045 = {
			model = "model301.png",
			name = "วงวางยู",
			x = 985,
			y = 1355
		},
		world_building_8046 = {
			model = "model401.png",
			name = "ช่างโกน",
			x = 1285,
			y = 1560
		},
		world_building_8047 = {
			model = "model101.png",
			name = "หวินจู",
			x = 220,
			y = 1377
		},
		world_building_8048 = {
			model = "model101.png",
			name = "เป๋าจู",
			x = 640,
			y = 1405
		},
		world_building_8049 = {
			model = "model101.png",
			name = "ฟุงงี",
			x = 922,
			y = 1632
		},
		world_building_8050 = {
			model = "worldBuildingChengchi1.png",
			name = "น่านเจ้าตู",
			x = 492,
			y = 1605
		}
	}
	worldMianzhanConstant.BUILDING_INFO = {
		world_building_133 = {
			model = "worldBuildingGuanqia1.png",
			name = "ด่านเฮาโลก๋วน",
			x = 3217,
			y = 1269
		},
		world_building_102 = {
			model = "worldBuildingGuanqia3.png",
			name = "ด่านหมอผี",
			x = 2234,
			y = 2053
		},
		world_building_144 = {
			model = "worldBuildingGuanqia2.png",
			name = "ผาแดง",
			x = 3634,
			y = 2006
		},
		world_building_78 = {
			model = "worldBuildingGuanqia2.png",
			name = "ด่านฮันกู่",
			x = 2032,
			y = 527
		},
		world_building_70 = {
			model = "worldBuildingGuanqia2.png",
			name = "อิเหลง",
			x = 1937,
			y = 2806
		},
		world_building_189 = {
			model = "worldBuildingGuanqia2.png",
			name = "หรูฉวีอู่",
			x = 4785,
			y = 1736
		}
	}
elseif conf.language == "ina" then
	worldDongyingConstant.BUILDING_INFO = {
		world_building_4002 = {
			model = "dongYingCityCapital.png",
			name = "BaiJi",
			x = 508,
			y = 238
		},
		world_building_4003 = {
			model = "dongYingCityShuiyu.png",
			name = "Tsushima N.Port",
			x = 810,
			y = 197
		},
		world_building_4004 = {
			model = "dongYingCity.png",
			name = "Tsushima",
			x = 1117,
			y = 316
		},
		world_building_4005 = {
			model = "dongYingCityShuiyu.png",
			name = "Iki Port",
			x = 1240,
			y = 557
		},
		world_building_4006 = {
			model = "dongYingCityShandi.png",
			name = "Iki",
			x = 1378,
			y = 722
		},
		world_building_4007 = {
			model = "dongYingCityShuiyu.png",
			name = "Echizen Wtr",
			x = 1566,
			y = 819
		},
		world_building_4008 = {
			model = "dongYingCity.png",
			name = "Echizen",
			x = 1519,
			y = 1010
		},
		world_building_4009 = {
			model = "dongYingCity.png",
			name = "Omi",
			x = 1389,
			y = 1214
		},
		world_building_4010 = {
			model = "dongYingCity.png",
			name = "Ise",
			x = 1591,
			y = 1465
		},
		world_building_4011 = {
			model = "dongYingCity.png",
			name = "Izu",
			x = 1971,
			y = 1541
		},
		world_building_4012 = {
			model = "dongYingCityCapital.png",
			name = "Edogawa",
			x = 2354,
			y = 1537
		},
		world_building_4013 = {
			model = "dongYingCity.png",
			name = "Yamaguchi",
			x = 863,
			y = 760
		},
		world_building_4014 = {
			model = "dongYingCityShuiyu.png",
			name = "Yamaguchi Port",
			x = 479,
			y = 761
		},
		world_building_4015 = {
			model = "dongYingCityShandi.png",
			name = "W.Kameyama",
			x = 686,
			y = 958
		},
		world_building_4016 = {
			model = "dongYingCity.png",
			name = "Okayama",
			x = 378,
			y = 1026
		},
		world_building_4018 = {
			model = "dongYingCityPlain.png",
			name = "N.Motoyama",
			x = 402,
			y = 1434
		},
		world_building_4019 = {
			model = "dongYingCityShandi.png",
			name = "Takasaki",
			x = 332,
			y = 1625
		},
		world_building_4020 = {
			model = "dongYingCity.png",
			name = "Tsukushi",
			x = 613,
			y = 1531
		},
		world_building_4021 = {
			model = "dongYingCityShuiyu.png",
			name = "Motoyama Wtr",
			x = 790,
			y = 1666
		},
		world_building_4022 = {
			model = "dongYingCityPlain.png",
			name = "Iwakura",
			x = 878,
			y = 1505
		},
		world_building_4023 = {
			model = "dongYingCityPlain.png",
			name = "W.Kii",
			x = 962,
			y = 1318
		},
		world_building_4024 = {
			model = "dongYingCityShandi.png",
			name = "Kameyama",
			x = 928,
			y = 1082
		},
		world_building_4025 = {
			model = "dongYingCityPlain.png",
			name = "Hamada",
			x = 1180,
			y = 964
		},
		world_building_4026 = {
			model = "dongYingCity.png",
			name = "Kii",
			x = 1237,
			y = 1378
		},
		world_building_4027 = {
			model = "dongYingCityShuiyu.png",
			name = "Omi Wtr",
			x = 1736,
			y = 1265
		},
		world_building_4028 = {
			model = "dongYingCityShuiyu.png",
			name = "Ise Wtr",
			x = 1657,
			y = 1656
		},
		world_building_4029 = {
			model = "dongYingCity.png",
			name = "Takino",
			x = 2141,
			y = 1336
		},
		world_building_4030 = {
			model = "dongYingCity.png",
			name = "Echigo",
			x = 1877,
			y = 1016
		},
		world_building_4031 = {
			model = "dongYingCityPlain.png",
			name = "N.Echigo",
			x = 2034,
			y = 792
		},
		world_building_4032 = {
			model = "dongYingCity.png",
			name = "Murakami",
			x = 2325,
			y = 879
		},
		world_building_4033 = {
			model = "dongYingCityPlain.png",
			name = "Osan",
			x = 2170,
			y = 1064
		},
		world_building_4034 = {
			model = "dongYingCityPlain.png",
			name = "Hokkaido",
			x = 2614,
			y = 936
		},
		world_building_4035 = {
			model = "dongYingCityPlain.png",
			name = "E.Hitachi",
			x = 2674,
			y = 1172
		},
		world_building_4036 = {
			model = "dongYingCity.png",
			name = "Hitachi",
			x = 2423,
			y = 1258
		},
		world_building_4037 = {
			model = "dongYingCityShuiyu.png",
			name = "Edo Wtr",
			x = 2654,
			y = 1458
		},
		world_building_4038 = {
			model = "dongYingCityShuiyu.png",
			name = "W.Oki",
			x = 1426,
			y = 155
		},
		world_building_4039 = {
			model = "dongYingCityShandi.png",
			name = "Oki",
			x = 1726,
			y = 314
		},
		world_building_4040 = {
			model = "dongYingCityShuiyu.png",
			name = "Echigo Wtr",
			x = 1940,
			y = 527
		},
		world_building_4041 = {
			model = "dongYingCity.png",
			name = "Horikoshi",
			x = 2317,
			y = 570
		},
		world_building_4042 = {
			model = "dongYingCityShandi.png",
			name = "S.Izumo",
			x = 2668,
			y = 565
		},
		world_building_4043 = {
			model = "dongYingCityPlain.png",
			name = "Sendai",
			x = 2812,
			y = 750
		},
		world_building_4044 = {
			model = "dongYingCity.png",
			name = "Izumo",
			x = 2549,
			y = 384
		},
		world_building_4045 = {
			model = "dongYingCityPlain.png",
			name = "Dewa",
			x = 2501,
			y = 204
		}
	}
	worldMianzhanConstant.BUILDING_INFO = {
		world_building_133 = {
			model = "worldBuildingGuanqia1.png",
			name = "HuLao Pass",
			x = 3217,
			y = 1269
		},
		world_building_102 = {
			model = "worldBuildingGuanqia3.png",
			name = "WuXia Pass",
			x = 2234,
			y = 2053
		},
		world_building_144 = {
			model = "worldBuildingGuanqia2.png",
			name = "Redcliff",
			x = 3634,
			y = 2006
		},
		world_building_78 = {
			model = "worldBuildingGuanqia2.png",
			name = "HanGu Pass",
			x = 2032,
			y = 527
		},
		world_building_70 = {
			model = "worldBuildingGuanqia2.png",
			name = "YiLing",
			x = 1937,
			y = 2806
		},
		world_building_189 = {
			model = "worldBuildingGuanqia2.png",
			name = "RuXuWu",
			x = 4785,
			y = 1736
		}
	}
elseif conf.language == "vie" then
	worldDongyingConstant.BUILDING_INFO = {
		world_building_4002 = {
			model = "dongYingCityCapital.png",
			name = "Bách Tế",
			x = 508,
			y = 238
		},
		world_building_4003 = {
			model = "dongYingCityShuiyu.png",
			name = " Cảng Bắc Đối Mã",
			x = 810,
			y = 197
		},
		world_building_4004 = {
			model = "dongYingCity.png",
			name = "Đối Mã",
			x = 1117,
			y = 316
		},
		world_building_4005 = {
			model = "dongYingCityShuiyu.png",
			name = "Cảng Nhất Kỳ",
			x = 1240,
			y = 557
		},
		world_building_4006 = {
			model = "dongYingCityShandi.png",
			name = "Nhất Kỳ",
			x = 1378,
			y = 722
		},
		world_building_4007 = {
			model = "dongYingCityShuiyu.png",
			name = "Thủy vực Việt Tiền",
			x = 1566,
			y = 819
		},
		world_building_4008 = {
			model = "dongYingCity.png",
			name = "Việt Tiền",
			x = 1519,
			y = 1010
		},
		world_building_4009 = {
			model = "dongYingCity.png",
			name = "Cận Giang",
			x = 1389,
			y = 1214
		},
		world_building_4010 = {
			model = "dongYingCity.png",
			name = "Y Thế",
			x = 1591,
			y = 1465
		},
		world_building_4011 = {
			model = "dongYingCity.png",
			name = "Y Đậu",
			x = 1971,
			y = 1541
		},
		world_building_4012 = {
			model = "dongYingCityCapital.png",
			name = "Giang Hộ",
			x = 2354,
			y = 1537
		},
		world_building_4013 = {
			model = "dongYingCity.png",
			name = "Sơn Khẩu",
			x = 863,
			y = 760
		},
		world_building_4014 = {
			model = "dongYingCityShuiyu.png",
			name = "Cảng Sơn Khẩu",
			x = 479,
			y = 761
		},
		world_building_4015 = {
			model = "dongYingCityShandi.png",
			name = "Quy Sơn Tây",
			x = 686,
			y = 958
		},
		world_building_4016 = {
			model = "dongYingCity.png",
			name = "Cương Thành",
			x = 378,
			y = 1026
		},
		world_building_4018 = {
			model = "dongYingCityPlain.png",
			name = "Bản Sơn Bắc",
			x = 402,
			y = 1434
		},
		world_building_4019 = {
			model = "dongYingCityShandi.png",
			name = "Cao Kỳ",
			x = 332,
			y = 1625
		},
		world_building_4020 = {
			model = "dongYingCity.png",
			name = "Trúc Tử",
			x = 613,
			y = 1531
		},
		world_building_4021 = {
			model = "dongYingCityShuiyu.png",
			name = "Thủy vực Bản Sơn",
			x = 790,
			y = 1666
		},
		world_building_4022 = {
			model = "dongYingCityPlain.png",
			name = "Nham Thương",
			x = 878,
			y = 1505
		},
		world_building_4023 = {
			model = "dongYingCityPlain.png",
			name = "Kỷ Y Tây",
			x = 962,
			y = 1318
		},
		world_building_4024 = {
			model = "dongYingCityShandi.png",
			name = "Quy Sơn",
			x = 928,
			y = 1082
		},
		world_building_4025 = {
			model = "dongYingCityPlain.png",
			name = "Tân Điền",
			x = 1180,
			y = 964
		},
		world_building_4026 = {
			model = "dongYingCity.png",
			name = "Kỷ Y",
			x = 1237,
			y = 1378
		},
		world_building_4027 = {
			model = "dongYingCityShuiyu.png",
			name = "Thủy vực Cận Giang",
			x = 1736,
			y = 1265
		},
		world_building_4028 = {
			model = "dongYingCityShuiyu.png",
			name = "Thủy vực Y Thế",
			x = 1657,
			y = 1656
		},
		world_building_4029 = {
			model = "dongYingCity.png",
			name = "Lũng Sơn",
			x = 2141,
			y = 1336
		},
		world_building_4030 = {
			model = "dongYingCity.png",
			name = "Việt Hậu",
			x = 1877,
			y = 1016
		},
		world_building_4031 = {
			model = "dongYingCityPlain.png",
			name = "Việt Hậu Bắc",
			x = 2034,
			y = 792
		},
		world_building_4032 = {
			model = "dongYingCity.png",
			name = "Thôn Sơn",
			x = 2325,
			y = 879
		},
		world_building_4033 = {
			model = "dongYingCityPlain.png",
			name = "Ô Sơn",
			x = 2170,
			y = 1064
		},
		world_building_4034 = {
			model = "dongYingCityPlain.png",
			name = "Tu Hạ Xuyên",
			x = 2614,
			y = 936
		},
		world_building_4035 = {
			model = "dongYingCityPlain.png",
			name = "Thường Lục Đông",
			x = 2674,
			y = 1172
		},
		world_building_4036 = {
			model = "dongYingCity.png",
			name = "Thường Lục",
			x = 2423,
			y = 1258
		},
		world_building_4037 = {
			model = "dongYingCityShuiyu.png",
			name = "Thủy vực Giang Hộ",
			x = 2654,
			y = 1458
		},
		world_building_4038 = {
			model = "dongYingCityShuiyu.png",
			name = "Ẩn Kỳ Tây",
			x = 1426,
			y = 155
		},
		world_building_4039 = {
			model = "dongYingCityShandi.png",
			name = "Ẩn Kỳ",
			x = 1726,
			y = 314
		},
		world_building_4040 = {
			model = "dongYingCityShuiyu.png",
			name = "Thủy vực Việt Hậu",
			x = 1940,
			y = 527
		},
		world_building_4041 = {
			model = "dongYingCity.png",
			name = "Quật Việt",
			x = 2317,
			y = 570
		},
		world_building_4042 = {
			model = "dongYingCityShandi.png",
			name = "Xuất Vân Nam",
			x = 2668,
			y = 565
		},
		world_building_4043 = {
			model = "dongYingCityPlain.png",
			name = "Tiên Đài",
			x = 2812,
			y = 750
		},
		world_building_4044 = {
			model = "dongYingCity.png",
			name = "Xuất Vân",
			x = 2549,
			y = 384
		},
		world_building_4045 = {
			model = "dongYingCityPlain.png",
			name = "Xuất Vũ",
			x = 2501,
			y = 204
		},
		world_building_5001 = {
			model = "model604.png",
			name = "Đại doanh ta",
			x = 1020,
			y = 1597
		},
		world_building_5002 = {
			model = "model101.png",
			name = "Phía bắc Đại Doanh",
			x = 755,
			y = 1538
		},
		world_building_5003 = {
			model = "model301.png",
			name = "Lối đi trong rừng",
			x = 1177,
			y = 1455
		},
		world_building_5004 = {
			model = "model101.png",
			name = "Phía đông Đại Doanh",
			x = 1431,
			y = 1633
		},
		world_building_5005 = {
			model = "model301.png",
			name = "An Đông Tây Sơn",
			x = 1894,
			y = 1607
		},
		world_building_5006 = {
			model = "model301.png",
			name = "Toàn Châu Tây Sơn",
			x = 1063,
			y = 1282
		},
		world_building_5007 = {
			model = "model101.png",
			name = "Toàn Châu Nam",
			x = 1461,
			y = 1354
		},
		world_building_5008 = {
			model = "model101.png",
			name = "An Đông Tây",
			x = 1830,
			y = 1427
		},
		world_building_5009 = {
			model = "model604.png",
			name = "An Đông",
			x = 2203,
			y = 1358
		},
		world_building_5010 = {
			model = "model101.png",
			name = "An Đông Nam",
			x = 2334,
			y = 1537
		},
		world_building_5011 = {
			model = "model101.png",
			name = "Toàn Châu Tây",
			x = 930,
			y = 1081
		},
		world_building_5012 = {
			model = "model604.png",
			name = "Toàn Châu ",
			x = 1499,
			y = 1106
		},
		world_building_5013 = {
			model = "model301.png",
			name = "Toàn Châu Đông",
			x = 1767,
			y = 1170
		},
		world_building_5014 = {
			model = "model101.png",
			name = "An Đông Bắc",
			x = 2041,
			y = 1183
		},
		world_building_5015 = {
			model = "model301.png",
			name = "Sơn Trắc Nam",
			x = 2234,
			y = 1073
		},
		world_building_5016 = {
			model = "model101.png",
			name = "An Đông Đông",
			x = 2545,
			y = 1256
		},
		world_building_5017 = {
			model = "model401.png",
			name = "Nghĩa Chu Nam",
			x = 813,
			y = 925
		},
		world_building_5018 = {
			model = "model301.png",
			name = "Toàn Châu Bắc",
			x = 1181,
			y = 1042
		},
		world_building_5019 = {
			model = "model301.png",
			name = "Nghĩa Chu Đông",
			x = 1397,
			y = 887
		},
		world_building_5020 = {
			model = "model401.png",
			name = "Khai Thành Nam",
			x = 1792,
			y = 901
		},
		world_building_5021 = {
			model = "model101.png",
			name = "Sơn Trắc Tây",
			x = 2120,
			y = 799
		},
		world_building_5022 = {
			model = "model604.png",
			name = "Sơn Trắc",
			x = 2359,
			y = 863
		},
		world_building_5023 = {
			model = "model401.png",
			name = "Sơn Trắc Đông",
			x = 2560,
			y = 990
		},
		world_building_5024 = {
			model = "model604.png",
			name = "Nghĩa Chu",
			x = 993,
			y = 795
		},
		world_building_5025 = {
			model = "model301.png",
			name = "Nghĩa Chu Tây",
			x = 614,
			y = 685
		},
		world_building_5026 = {
			model = "model101.png",
			name = "Nghĩa Chu Bắc",
			x = 1244,
			y = 707
		},
		world_building_5027 = {
			model = "model301.png",
			name = "Khai Thành Tây",
			x = 1509,
			y = 670
		},
		world_building_5028 = {
			model = "model604.png",
			name = "Khai Thành",
			x = 1834,
			y = 713
		},
		world_building_5029 = {
			model = "model301.png",
			name = "Khai Thành Đông",
			x = 2014,
			y = 581
		},
		world_building_5030 = {
			model = "model401.png",
			name = "Sơn Trắc Bắc",
			x = 2548,
			y = 699
		},
		world_building_5031 = {
			model = "model305.png",
			name = "Giang Giới Vực",
			x = 896,
			y = 585
		},
		world_building_5032 = {
			model = "model305.png",
			name = "Trường Tân Vực",
			x = 1416,
			y = 472
		},
		world_building_5033 = {
			model = "model101.png",
			name = "Khai Thành Bắc",
			x = 1725,
			y = 537
		},
		world_building_5034 = {
			model = "model301.png",
			name = "Ngư Thôn ngoại sơn",
			x = 2493,
			y = 535
		},
		world_building_5035 = {
			model = "model604.png",
			name = "Giang Giới",
			x = 777,
			y = 388
		},
		world_building_5036 = {
			model = "model604.png",
			name = "Trường Tân",
			x = 1134,
			y = 401
		},
		world_building_5037 = {
			model = "model101.png",
			name = "Ngư Thôn tây giao",
			x = 2257,
			y = 519
		},
		world_building_5038 = {
			model = "model401.png",
			name = "Đông Hải Ngư Thôn",
			x = 2346,
			y = 334
		},
		world_building_5039 = {
			model = "model604.png",
			name = "Cát Châu",
			x = 1236,
			y = 213
		},
		world_building_5040 = {
			model = "model305.png",
			name = "Cát Châu Vực",
			x = 1450,
			y = 258
		},
		world_building_5041 = {
			model = "model301.png",
			name = "Vĩnh Hưng Tây Sơn",
			x = 1663,
			y = 366
		},
		world_building_5042 = {
			model = "model101.png",
			name = "Vĩnh Hưng đông giao",
			x = 1971,
			y = 419
		},
		world_building_5043 = {
			model = "model101.png",
			name = "Vĩnh Hưng Đông",
			x = 2257,
			y = 196
		},
		world_building_5044 = {
			model = "model604.png",
			name = "Vĩnh Hưng",
			x = 1931,
			y = 191
		},
		world_building_5045 = {
			model = "model301.png",
			name = "Vĩnh Hưng Tây",
			x = 1684,
			y = 186
		},
		world_building_5046 = {
			model = "model602.png",
			name = "Bình Nhưỡng",
			x = 922,
			y = 216
		},
		world_building_6001 = {
			model = "model602.png",
			name = "Hà Nội",
			x = 2126,
			y = 1686
		},
		world_building_6002 = {
			model = "model101.png",
			name = "Chương Khương",
			x = 1881,
			y = 1646
		},
		world_building_6003 = {
			model = "model301.png",
			name = "Đường Cảnh",
			x = 1979,
			y = 1471
		},
		world_building_6004 = {
			model = "model101.png",
			name = "Hà Nội Bắc",
			x = 2275,
			y = 1611
		},
		world_building_6005 = {
			model = "worldBuildingSishi2.png",
			name = "Bắc Đới",
			x = 1575,
			y = 1556
		},
		world_building_6006 = {
			model = "worldBuildingSishi2.png",
			name = "Châu Đốc",
			x = 1897,
			y = 1266
		},
		world_building_6007 = {
			model = "worldBuildingSishi2.png",
			name = "Kê Từ",
			x = 2241,
			y = 1402
		},
		world_building_6008 = {
			model = "model101.png",
			name = "Vọng Hương",
			x = 880,
			y = 1665
		},
		world_building_6009 = {
			model = "model101.png",
			name = "Nhẫm Thanh",
			x = 1197,
			y = 1686
		},
		world_building_6010 = {
			model = "model401.png",
			name = "Thủy vực Bắc Đới",
			x = 1268,
			y = 1496
		},
		world_building_6011 = {
			model = "model301.png",
			name = "Vọng Đăng Đông",
			x = 990,
			y = 1493
		},
		world_building_6012 = {
			model = "worldBuildingSishi2.png",
			name = "Vọng Đăng",
			x = 713,
			y = 1408
		},
		world_building_6013 = {
			model = "model301.png",
			name = "Mỹ Sơn",
			x = 1008,
			y = 1284
		},
		world_building_6014 = {
			model = "model301.png",
			name = "Nhạn Phi Nam",
			x = 1360,
			y = 1340
		},
		world_building_6015 = {
			model = "model101.png",
			name = "Vấn Quận",
			x = 800,
			y = 1208
		},
		world_building_6016 = {
			model = "worldBuildingSishi2.png",
			name = "Nhạn Phi",
			x = 1192,
			y = 1118
		},
		world_building_6017 = {
			model = "model301.png",
			name = "Cao Bình Nam",
			x = 1421,
			y = 1141
		},
		world_building_6018 = {
			model = "model401.png",
			name = "Thủy vực Châu Đốc",
			x = 1690,
			y = 1169
		},
		world_building_6019 = {
			model = "model301.png",
			name = "Vũ Pha Nam",
			x = 2081,
			y = 1161
		},
		world_building_6020 = {
			model = "model101.png",
			name = "Kê Từ Bắc",
			x = 2431,
			y = 1304
		},
		world_building_6021 = {
			model = "model401.png",
			name = "Côn Khao Nam",
			x = 848,
			y = 986
		},
		world_building_6022 = {
			model = "model101.png",
			name = "Hậu Côn",
			x = 1225,
			y = 964
		},
		world_building_6023 = {
			model = "model401.png",
			name = "Thủy vực Hậu Côn",
			x = 1426,
			y = 831
		},
		world_building_6024 = {
			model = "model301.png",
			name = "Cao Bình",
			x = 1576,
			y = 1009
		},
		world_building_6025 = {
			model = "model101.png",
			name = "Cao Bình Bắc",
			x = 1714,
			y = 849
		},
		world_building_6026 = {
			model = "model101.png",
			name = "Vũ Pha",
			x = 1850,
			y = 1076
		},
		world_building_6027 = {
			model = "model401.png",
			name = "Thủy vực Vũ Pha",
			x = 2280,
			y = 1079
		},
		world_building_6028 = {
			model = "model101.png",
			name = "Chiếu Trực",
			x = 1966,
			y = 915
		},
		world_building_6029 = {
			model = "model101.png",
			name = "Tư Phố Tây",
			x = 2243,
			y = 918
		},
		world_building_6030 = {
			model = "worldBuildingSishi2.png",
			name = "Tư Phố",
			x = 2642,
			y = 882
		},
		world_building_6031 = {
			model = "worldBuildingSishi2.png",
			name = "Côn Khao",
			x = 1060,
			y = 843
		},
		world_building_6032 = {
			model = "worldBuildingSishi2.png",
			name = "Tiên An",
			x = 1545,
			y = 640
		},
		world_building_6033 = {
			model = "worldBuildingSishi2.png",
			name = "Nghĩa Lộ",
			x = 1880,
			y = 603
		},
		world_building_6034 = {
			model = "model101.png",
			name = "Khúc Di Đông",
			x = 785,
			y = 841
		},
		world_building_6035 = {
			model = "model401.png",
			name = "Ẩn Hà",
			x = 916,
			y = 689
		},
		world_building_6036 = {
			model = "worldBuildingSishi2.png",
			name = "Khúc Dị",
			x = 593,
			y = 698
		},
		world_building_6037 = {
			model = "model101.png",
			name = "Tề Hoa",
			x = 728,
			y = 611
		},
		world_building_6038 = {
			model = "worldBuildingSishi2.png",
			name = "Hưng An",
			x = 910,
			y = 503
		},
		world_building_6039 = {
			model = "model101.png",
			name = "Hưng An Đông",
			x = 1108,
			y = 379
		},
		world_building_6040 = {
			model = "model101.png",
			name = "Phú Thọ Nam",
			x = 1423,
			y = 490
		},
		world_building_6041 = {
			model = "model101.png",
			name = "Nghĩa Lộ Bắc",
			x = 1838,
			y = 471
		},
		world_building_6042 = {
			model = "model401.png",
			name = "Thủy vực Long Biên",
			x = 2104,
			y = 347
		},
		world_building_6043 = {
			model = "model604.png",
			name = "Phú Thọ",
			x = 1315,
			y = 247
		},
		world_building_6046 = {
			model = "model602.png",
			name = "Đô Úy",
			x = 1572,
			y = 191
		},
		world_building_6044 = {
			model = "model604.png",
			name = "Tây Can",
			x = 1593,
			y = 345
		},
		world_building_6045 = {
			model = "model604.png",
			name = "Long Biên",
			x = 1847,
			y = 202
		},
		world_building_7001 = {
			model = "model602.png",
			name = "Thủ phủ Lưu Cầu",
			x = 290,
			y = 192
		},
		world_building_7002 = {
			model = "model604.png",
			name = "Danh Hộ",
			x = 271,
			y = 386
		},
		world_building_7003 = {
			model = "model101.png",
			name = "Danh Hộ nam",
			x = 373,
			y = 623
		},
		world_building_7004 = {
			model = "model604.png",
			name = "Kim Vũ",
			x = 529,
			y = 335
		},
		world_building_7005 = {
			model = "model101.png",
			name = "Kim Vũ đông",
			x = 849,
			y = 390
		},
		world_building_7006 = {
			model = "model301.png",
			name = "Vận Thiên Sơn",
			x = 674,
			y = 529
		},
		world_building_7007 = {
			model = "model401.png",
			name = "Việt Lai thủy vực",
			x = 1005,
			y = 677
		},
		world_building_7008 = {
			model = "model101.png",
			name = "Việt Lai",
			x = 1057,
			y = 459
		},
		world_building_7009 = {
			model = "model604.png",
			name = "Cửu Chí",
			x = 546,
			y = 150
		},
		world_building_7010 = {
			model = "model301.png",
			name = "Cô Trường Nhạc",
			x = 856,
			y = 141
		},
		world_building_7011 = {
			model = "model401.png",
			name = "Quốc Đầu Tân",
			x = 1233,
			y = 270
		},
		world_building_7012 = {
			model = "model401.png",
			name = "Kỳ Giới",
			x = 1554,
			y = 234
		},
		world_building_7013 = {
			model = "model301.png",
			name = "Âm Sơn",
			x = 1821,
			y = 140
		},
		world_building_7014 = {
			model = "model101.png",
			name = "Y Kế",
			x = 2158,
			y = 170
		},
		world_building_7015 = {
			model = "model301.png",
			name = "Tây Ma Xỉ Sơn",
			x = 2505,
			y = 176
		},
		world_building_7016 = {
			model = "model401.png",
			name = "Độ Na Kỳ",
			x = 2475,
			y = 402
		},
		world_building_7017 = {
			model = "model301.png",
			name = "Đông Ma Xỉ Sơn",
			x = 2751,
			y = 359
		},
		world_building_7018 = {
			model = "model101.png",
			name = "Y Lương Bảo",
			x = 2593,
			y = 679
		},
		world_building_7019 = {
			model = "model101.png",
			name = "Do Lữ Bắc",
			x = 1966,
			y = 320
		},
		world_building_7020 = {
			model = "model604.png",
			name = "Do Lữ",
			x = 2191,
			y = 434
		},
		world_building_7021 = {
			model = "model101.png",
			name = "Tiểu Bích Diệp",
			x = 1804,
			y = 457
		},
		world_building_7022 = {
			model = "model401.png",
			name = "Ba Độ Ma",
			x = 2117,
			y = 646
		},
		world_building_7023 = {
			model = "model401.png",
			name = "Thủy vực Ngũ Thành",
			x = 1277,
			y = 600
		},
		world_building_7024 = {
			model = "model101.png",
			name = "Ngũ Thành Bắc",
			x = 1442,
			y = 719
		},
		world_building_7025 = {
			model = "model401.png",
			name = "Trường Hồng Kiều",
			x = 1765,
			y = 678
		},
		world_building_7026 = {
			model = "model401.png",
			name = "Thủy vực Kiêm Thành",
			x = 1973,
			y = 956
		},
		world_building_7027 = {
			model = "model604.png",
			name = "Ngũ Thành",
			x = 1498,
			y = 884
		},
		world_building_7028 = {
			model = "model101.png",
			name = "Kiêm Thành Bắc",
			x = 1739,
			y = 921
		},
		world_building_7029 = {
			model = "model604.png",
			name = "Kiêm Thành",
			x = 1588,
			y = 1165
		},
		world_building_7030 = {
			model = "model401.png",
			name = "Bạc Tân",
			x = 1300,
			y = 1176
		},
		world_building_7031 = {
			model = "model301.png",
			name = "Chân Bích",
			x = 1269,
			y = 989
		},
		world_building_7032 = {
			model = "model301.png",
			name = "Biện Nhạc",
			x = 1081,
			y = 897
		},
		world_building_7033 = {
			model = "model101.png",
			name = "Phổ Thiêm",
			x = 381,
			y = 942
		},
		world_building_7034 = {
			model = "model101.png",
			name = "Tư Nạp Bắc",
			x = 478,
			y = 1086
		},
		world_building_7035 = {
			model = "model401.png",
			name = "Nghi Dã Loan",
			x = 798,
			y = 1030
		},
		world_building_7036 = {
			model = "model604.png",
			name = "Tư Nạp",
			x = 538,
			y = 1228
		},
		world_building_7037 = {
			model = "model101.png",
			name = "Đông Nguyên",
			x = 885,
			y = 1294
		},
		world_building_7038 = {
			model = "model604.png",
			name = "Phong Kiến Thành",
			x = 1147,
			y = 1429
		},
		world_building_7039 = {
			model = "model401.png",
			name = "Thượng Ba",
			x = 1499,
			y = 1451
		},
		world_building_7040 = {
			model = "model301.png",
			name = "Tư Nạp Khưu",
			x = 240,
			y = 1249
		},
		world_building_7041 = {
			model = "model101.png",
			name = "Tây Nguyên",
			x = 257,
			y = 1492
		},
		world_building_7042 = {
			model = "model301.png",
			name = "Độc Cốc Sơn",
			x = 498,
			y = 1582
		},
		world_building_7043 = {
			model = "model301.png",
			name = "Thiên Cửu Sơn",
			x = 570,
			y = 1403
		},
		world_building_7044 = {
			model = "model604.png",
			name = "Mỹ Lí",
			x = 836,
			y = 1501
		},
		world_building_7045 = {
			model = "model401.png",
			name = "Tây Na thủy vực",
			x = 2665,
			y = 879
		},
		world_building_7046 = {
			model = "model101.png",
			name = "Tây Na Bắc",
			x = 2460,
			y = 987
		},
		world_building_7047 = {
			model = "model604.png",
			name = "Tây Na",
			x = 2471,
			y = 1200
		},
		world_building_7048 = {
			model = "model101.png",
			name = "Tây Na Đông",
			x = 2788,
			y = 1206
		},
		world_building_7049 = {
			model = "model401.png",
			name = "Tân Kỳ Nô",
			x = 2181,
			y = 964
		},
		world_building_7050 = {
			model = "model401.png",
			name = "Y Kỳ Ma",
			x = 1987,
			y = 1279
		},
		world_building_7051 = {
			model = "model301.png",
			name = "Ma Cô Sơn",
			x = 2209,
			y = 1239
		},
		world_building_7052 = {
			model = "model604.png",
			name = "Ba Thê",
			x = 2213,
			y = 1426
		},
		world_building_7053 = {
			model = "model401.png",
			name = "Điểu Ba Ma",
			x = 1717,
			y = 1456
		},
		world_building_7054 = {
			model = "model301.png",
			name = "Cô Ni Sơn",
			x = 2019,
			y = 1605
		},
		world_building_7055 = {
			model = "model301.png",
			name = "Bát Trùng Sơn",
			x = 2525,
			y = 1418
		},
		world_building_7056 = {
			model = "model602.png",
			name = "Bản doanh viễn chinh",
			x = 2758,
			y = 1472
		},
		world_building_8001 = {
			model = "worldBuildingChengchi1.png",
			name = "Mông Tuyển Chiếu",
			x = 2768,
			y = 179
		},
		world_building_8002 = {
			model = "model101.png",
			name = "Sở Hùng",
			x = 2480,
			y = 160
		},
		world_building_8003 = {
			model = "model305.png",
			name = "Mậu Hòa",
			x = 2102,
			y = 135
		},
		world_building_8004 = {
			model = "model101.png",
			name = "Tú Cước",
			x = 1740,
			y = 133
		},
		world_building_8005 = {
			model = "model101.png",
			name = "Hà Nhân",
			x = 1352,
			y = 117
		},
		world_building_8006 = {
			model = "model101.png",
			name = "Đại Lý",
			x = 2520,
			y = 389
		},
		world_building_8007 = {
			model = "model401.png",
			name = "Lâm Thương",
			x = 2272,
			y = 449
		},
		world_building_8008 = {
			model = "model101.png",
			name = "Kim Xỉ",
			x = 1982,
			y = 347
		},
		world_building_8009 = {
			model = "model305.png",
			name = "Ma Ta",
			x = 1584,
			y = 369
		},
		world_building_8010 = {
			model = "model101.png",
			name = "Đại Li",
			x = 2835,
			y = 440
		},
		world_building_8011 = {
			model = "model401.png",
			name = "Dạng Tị",
			x = 2005,
			y = 594
		},
		world_building_8012 = {
			model = "model101.png",
			name = "Diêu An",
			x = 2815,
			y = 717
		},
		world_building_8013 = {
			model = "model401.png",
			name = "Ngân Xỉ",
			x = 2350,
			y = 673
		},
		world_building_8014 = {
			model = "model301.png",
			name = "Xuyên Xỉ",
			x = 2620,
			y = 870
		},
		world_building_8015 = {
			model = "model101.png",
			name = "Phác Tử",
			x = 2880,
			y = 997
		},
		world_building_8016 = {
			model = "model101.png",
			name = "Mông Thái Đạm",
			x = 973,
			y = 180
		},
		world_building_8017 = {
			model = "worldBuildingChengchi1.png",
			name = "Việt Tích Chiêu",
			x = 1232,
			y = 332
		},
		world_building_8018 = {
			model = "model101.png",
			name = "Thái Hòa",
			x = 1340,
			y = 573
		},
		world_building_8019 = {
			model = "worldBuildingChengchi1.png",
			name = "Lãng Khung Chiêu",
			x = 1717,
			y = 590
		},
		world_building_8020 = {
			model = "model101.png",
			name = "Vĩnh Xương",
			x = 2067,
			y = 897
		},
		world_building_8021 = {
			model = "worldBuildingChengchi1.png",
			name = "Đằng Đạm Chiêu",
			x = 2401,
			y = 962
		},
		world_building_8022 = {
			model = "model101.png",
			name = "Lãng Như Manh",
			x = 2757,
			y = 1277
		},
		world_building_8023 = {
			model = "model602.png",
			name = "Thi Lãng Chiêu",
			x = 830,
			y = 420
		},
		world_building_8024 = {
			model = "model602.png",
			name = "Mông Xá Chiêu",
			x = 1623,
			y = 832
		},
		world_building_8025 = {
			model = "model602.png",
			name = "Nhĩ Hải Thành",
			x = 2356,
			y = 1186
		},
		world_building_8026 = {
			model = "model305.png",
			name = "Dương Tư Miết",
			x = 442,
			y = 182
		},
		world_building_8027 = {
			model = "model305.png",
			name = "Hồng Vệ",
			x = 237,
			y = 427
		},
		world_building_8028 = {
			model = "model101.png",
			name = "Vọng Tư",
			x = 536,
			y = 536
		},
		world_building_8029 = {
			model = "model305.png",
			name = "Khỏa Hình",
			x = 787,
			y = 740
		},
		world_building_8030 = {
			model = "model101.png",
			name = "Vu Lãng",
			x = 1187,
			y = 822
		},
		world_building_8031 = {
			model = "model101.png",
			name = "Lộng Đống",
			x = 1460,
			y = 1085
		},
		world_building_8032 = {
			model = "model301.png",
			name = "Địch Khánh",
			x = 1990,
			y = 1150
		},
		world_building_8033 = {
			model = "model101.png",
			name = "Tư Mao",
			x = 2240,
			y = 1397
		},
		world_building_8034 = {
			model = "model305.png",
			name = "Bạch Nhai",
			x = 2592,
			y = 1490
		},
		world_building_8035 = {
			model = "model101.png",
			name = "Hội Xuyên",
			x = 166,
			y = 744
		},
		world_building_8036 = {
			model = "worldBuildingChengchi1.png",
			name = "Đằng Xuyên Thành",
			x = 462,
			y = 762
		},
		world_building_8037 = {
			model = "worldBuildingChengchi1.png",
			name = "Long Khẩu Thành",
			x = 1022,
			y = 1032
		},
		world_building_8038 = {
			model = "model305.png",
			name = "Truyền Cổn",
			x = 1735,
			y = 1300
		},
		world_building_8039 = {
			model = "worldBuildingChengchi1.png",
			name = "Mông Xá Thành",
			x = 1955,
			y = 1492
		},
		world_building_8040 = {
			model = "model101.png",
			name = "Đức Huyền",
			x = 2260,
			y = 1632
		},
		world_building_8041 = {
			model = "model101.png",
			name = "Miếu Nhai",
			x = 365,
			y = 1047
		},
		world_building_8042 = {
			model = "model401.png",
			name = "Vọng Ngao",
			x = 655,
			y = 1095
		},
		world_building_8043 = {
			model = "model401.png",
			name = "Thông Hải",
			x = 1355,
			y = 1322
		},
		world_building_8044 = {
			model = "model401.png",
			name = "Tất Xỉ",
			x = 1690,
			y = 1614
		},
		world_building_8045 = {
			model = "model301.png",
			name = "Vọng Ngoại Dụ",
			x = 985,
			y = 1355
		},
		world_building_8046 = {
			model = "model401.png",
			name = "Trường Côn",
			x = 1285,
			y = 1560
		},
		world_building_8047 = {
			model = "model101.png",
			name = "Nguy Sơn",
			x = 220,
			y = 1377
		},
		world_building_8048 = {
			model = "model101.png",
			name = "Bảo Sơn",
			x = 640,
			y = 1405
		},
		world_building_8049 = {
			model = "model101.png",
			name = "Phụng Nghi",
			x = 922,
			y = 1632
		},
		world_building_8050 = {
			model = "worldBuildingChengchi1.png",
			name = "Nam Chiêu Đô",
			x = 492,
			y = 1605
		}
	}
	worldMianzhanConstant.BUILDING_INFO = {
		world_building_133 = {
			model = "worldBuildingGuanqia1.png",
			name = "Hố Lao Quan",
			x = 3217,
			y = 1269
		},
		world_building_102 = {
			model = "worldBuildingGuanqia3.png",
			name = "Vu Hiệp Quan",
			x = 2234,
			y = 2053
		},
		world_building_144 = {
			model = "worldBuildingGuanqia2.png",
			name = "Xích Bích",
			x = 3634,
			y = 2006
		},
		world_building_78 = {
			model = "worldBuildingGuanqia2.png",
			name = "Hàm Cốc Quan",
			x = 2032,
			y = 527
		},
		world_building_70 = {
			model = "worldBuildingGuanqia2.png",
			name = "Di Lăng",
			x = 1937,
			y = 2806
		},
		world_building_189 = {
			model = "worldBuildingGuanqia2.png",
			name = "Nhu Tu Ổ",
			x = 4785,
			y = 1736
		}
	}
elseif conf.language == "tw" then
	worldDongyingConstant.BUILDING_INFO = {
		world_building_4002 = {
			model = "dongYingCityCapital.png",
			name = "百濟",
			x = 508,
			y = 238
		},
		world_building_4003 = {
			model = "dongYingCityShuiyu.png",
			name = "對馬北港",
			x = 810,
			y = 197
		},
		world_building_4004 = {
			model = "dongYingCity.png",
			name = "對馬",
			x = 1117,
			y = 316
		},
		world_building_4005 = {
			model = "dongYingCityShuiyu.png",
			name = "壹岐港",
			x = 1240,
			y = 557
		},
		world_building_4006 = {
			model = "dongYingCityShandi.png",
			name = "壹岐",
			x = 1378,
			y = 722
		},
		world_building_4007 = {
			model = "dongYingCityShuiyu.png",
			name = "越前水域",
			x = 1566,
			y = 819
		},
		world_building_4008 = {
			model = "dongYingCity.png",
			name = "越前",
			x = 1519,
			y = 1010
		},
		world_building_4009 = {
			model = "dongYingCity.png",
			name = "近江",
			x = 1389,
			y = 1214
		},
		world_building_4010 = {
			model = "dongYingCity.png",
			name = "伊勢",
			x = 1591,
			y = 1465
		},
		world_building_4011 = {
			model = "dongYingCity.png",
			name = "伊豆",
			x = 1971,
			y = 1541
		},
		world_building_4012 = {
			model = "dongYingCityCapital.png",
			name = "江戶",
			x = 2354,
			y = 1537
		},
		world_building_4013 = {
			model = "dongYingCity.png",
			name = "山口",
			x = 863,
			y = 760
		},
		world_building_4014 = {
			model = "dongYingCityShuiyu.png",
			name = "山口港",
			x = 479,
			y = 761
		},
		world_building_4015 = {
			model = "dongYingCityShandi.png",
			name = "龜山西",
			x = 686,
			y = 958
		},
		world_building_4016 = {
			model = "dongYingCity.png",
			name = "岡城",
			x = 378,
			y = 1026
		},
		world_building_4018 = {
			model = "dongYingCityPlain.png",
			name = "本山北",
			x = 402,
			y = 1434
		},
		world_building_4019 = {
			model = "dongYingCityShandi.png",
			name = "高崎",
			x = 332,
			y = 1625
		},
		world_building_4020 = {
			model = "dongYingCity.png",
			name = "築紫",
			x = 613,
			y = 1531
		},
		world_building_4021 = {
			model = "dongYingCityShuiyu.png",
			name = "本山水域",
			x = 790,
			y = 1666
		},
		world_building_4022 = {
			model = "dongYingCityPlain.png",
			name = "岩倉",
			x = 878,
			y = 1505
		},
		world_building_4023 = {
			model = "dongYingCityPlain.png",
			name = "紀伊西",
			x = 962,
			y = 1318
		},
		world_building_4024 = {
			model = "dongYingCityShandi.png",
			name = "龜山",
			x = 928,
			y = 1082
		},
		world_building_4025 = {
			model = "dongYingCityPlain.png",
			name = "濱田",
			x = 1180,
			y = 964
		},
		world_building_4026 = {
			model = "dongYingCity.png",
			name = "紀伊",
			x = 1237,
			y = 1378
		},
		world_building_4027 = {
			model = "dongYingCityShuiyu.png",
			name = "近江水域",
			x = 1736,
			y = 1265
		},
		world_building_4028 = {
			model = "dongYingCityShuiyu.png",
			name = "伊勢水域",
			x = 1657,
			y = 1656
		},
		world_building_4029 = {
			model = "dongYingCity.png",
			name = "瀧山",
			x = 2141,
			y = 1336
		},
		world_building_4030 = {
			model = "dongYingCity.png",
			name = "越後",
			x = 1877,
			y = 1016
		},
		world_building_4031 = {
			model = "dongYingCityPlain.png",
			name = "越後北",
			x = 2034,
			y = 792
		},
		world_building_4032 = {
			model = "dongYingCity.png",
			name = "村上",
			x = 2325,
			y = 879
		},
		world_building_4033 = {
			model = "dongYingCityPlain.png",
			name = "烏山",
			x = 2170,
			y = 1064
		},
		world_building_4034 = {
			model = "dongYingCityPlain.png",
			name = "須賀川",
			x = 2614,
			y = 936
		},
		world_building_4035 = {
			model = "dongYingCityPlain.png",
			name = "常陸東",
			x = 2674,
			y = 1172
		},
		world_building_4036 = {
			model = "dongYingCity.png",
			name = "常陸",
			x = 2423,
			y = 1258
		},
		world_building_4037 = {
			model = "dongYingCityShuiyu.png",
			name = "江戶水域",
			x = 2654,
			y = 1458
		},
		world_building_4038 = {
			model = "dongYingCityShuiyu.png",
			name = "隱岐西",
			x = 1426,
			y = 155
		},
		world_building_4039 = {
			model = "dongYingCityShandi.png",
			name = "隱岐",
			x = 1726,
			y = 314
		},
		world_building_4040 = {
			model = "dongYingCityShuiyu.png",
			name = "越後水域",
			x = 1940,
			y = 527
		},
		world_building_4041 = {
			model = "dongYingCity.png",
			name = "堀越",
			x = 2317,
			y = 570
		},
		world_building_4042 = {
			model = "dongYingCityShandi.png",
			name = "出雲南",
			x = 2668,
			y = 565
		},
		world_building_4043 = {
			model = "dongYingCityPlain.png",
			name = "仙台",
			x = 2812,
			y = 750
		},
		world_building_4044 = {
			model = "dongYingCity.png",
			name = "出雲",
			x = 2549,
			y = 384
		},
		world_building_4045 = {
			model = "dongYingCityPlain.png",
			name = "出羽",
			x = 2501,
			y = 204
		},
		world_building_5001 = {
			model = "model604.png",
			name = "我軍大營",
			x = 1020,
			y = 1597
		},
		world_building_5002 = {
			model = "model101.png",
			name = "大營北路",
			x = 755,
			y = 1538
		},
		world_building_5003 = {
			model = "model301.png",
			name = "林間小道",
			x = 1177,
			y = 1455
		},
		world_building_5004 = {
			model = "model101.png",
			name = "大營東路",
			x = 1431,
			y = 1633
		},
		world_building_5005 = {
			model = "model301.png",
			name = "安東西山",
			x = 1894,
			y = 1607
		},
		world_building_5006 = {
			model = "model301.png",
			name = "全州西山",
			x = 1063,
			y = 1282
		},
		world_building_5007 = {
			model = "model101.png",
			name = "全州南",
			x = 1461,
			y = 1354
		},
		world_building_5008 = {
			model = "model101.png",
			name = "安東西",
			x = 1830,
			y = 1427
		},
		world_building_5009 = {
			model = "model604.png",
			name = "安東",
			x = 2203,
			y = 1358
		},
		world_building_5010 = {
			model = "model101.png",
			name = "安東南",
			x = 2334,
			y = 1537
		},
		world_building_5011 = {
			model = "model101.png",
			name = "全州西",
			x = 930,
			y = 1081
		},
		world_building_5012 = {
			model = "model604.png",
			name = "全州",
			x = 1499,
			y = 1106
		},
		world_building_5013 = {
			model = "model301.png",
			name = "全州東",
			x = 1767,
			y = 1170
		},
		world_building_5014 = {
			model = "model101.png",
			name = "安東北",
			x = 2041,
			y = 1183
		},
		world_building_5015 = {
			model = "model301.png",
			name = "山陟南",
			x = 2234,
			y = 1073
		},
		world_building_5016 = {
			model = "model101.png",
			name = "安東東",
			x = 2545,
			y = 1256
		},
		world_building_5017 = {
			model = "model401.png",
			name = "義周南",
			x = 813,
			y = 925
		},
		world_building_5018 = {
			model = "model301.png",
			name = "全州北",
			x = 1181,
			y = 1042
		},
		world_building_5019 = {
			model = "model301.png",
			name = "義周東",
			x = 1397,
			y = 887
		},
		world_building_5020 = {
			model = "model401.png",
			name = "開城南",
			x = 1792,
			y = 901
		},
		world_building_5021 = {
			model = "model101.png",
			name = "山陟西",
			x = 2120,
			y = 799
		},
		world_building_5022 = {
			model = "model604.png",
			name = "山陟",
			x = 2359,
			y = 863
		},
		world_building_5023 = {
			model = "model401.png",
			name = "山陟東",
			x = 2560,
			y = 990
		},
		world_building_5024 = {
			model = "model604.png",
			name = "義周",
			x = 993,
			y = 795
		},
		world_building_5025 = {
			model = "model301.png",
			name = "義周西",
			x = 614,
			y = 685
		},
		world_building_5026 = {
			model = "model101.png",
			name = "義周北",
			x = 1244,
			y = 707
		},
		world_building_5027 = {
			model = "model301.png",
			name = "開城西",
			x = 1509,
			y = 670
		},
		world_building_5028 = {
			model = "model604.png",
			name = "開城",
			x = 1834,
			y = 713
		},
		world_building_5029 = {
			model = "model301.png",
			name = "開城東",
			x = 2014,
			y = 581
		},
		world_building_5030 = {
			model = "model401.png",
			name = "山陟北",
			x = 2548,
			y = 699
		},
		world_building_5031 = {
			model = "model305.png",
			name = "江界峽谷",
			x = 896,
			y = 585
		},
		world_building_5032 = {
			model = "model305.png",
			name = "長津峽谷",
			x = 1416,
			y = 472
		},
		world_building_5033 = {
			model = "model101.png",
			name = "開城北",
			x = 1725,
			y = 537
		},
		world_building_5034 = {
			model = "model301.png",
			name = "漁村外山",
			x = 2493,
			y = 535
		},
		world_building_5035 = {
			model = "model604.png",
			name = "江界",
			x = 777,
			y = 388
		},
		world_building_5036 = {
			model = "model604.png",
			name = "長津",
			x = 1134,
			y = 401
		},
		world_building_5037 = {
			model = "model101.png",
			name = "漁村西郊",
			x = 2257,
			y = 519
		},
		world_building_5038 = {
			model = "model401.png",
			name = "東海漁村",
			x = 2346,
			y = 334
		},
		world_building_5039 = {
			model = "model604.png",
			name = "吉州",
			x = 1236,
			y = 213
		},
		world_building_5040 = {
			model = "model305.png",
			name = "吉州峽谷",
			x = 1450,
			y = 258
		},
		world_building_5041 = {
			model = "model301.png",
			name = "永興西山",
			x = 1663,
			y = 366
		},
		world_building_5042 = {
			model = "model101.png",
			name = "永興東郊",
			x = 1971,
			y = 419
		},
		world_building_5043 = {
			model = "model101.png",
			name = "永興東",
			x = 2257,
			y = 196
		},
		world_building_5044 = {
			model = "model604.png",
			name = "永興",
			x = 1931,
			y = 191
		},
		world_building_5045 = {
			model = "model301.png",
			name = "永興西",
			x = 1684,
			y = 186
		},
		world_building_5046 = {
			model = "model602.png",
			name = "平壤",
			x = 922,
			y = 216
		},
		world_building_6001 = {
			model = "model602.png",
			name = "河內",
			x = 2126,
			y = 1686
		},
		world_building_6002 = {
			model = "model101.png",
			name = "章羌",
			x = 1881,
			y = 1646
		},
		world_building_6003 = {
			model = "model301.png",
			name = "塘境",
			x = 1979,
			y = 1471
		},
		world_building_6004 = {
			model = "model101.png",
			name = "河內北",
			x = 2275,
			y = 1611
		},
		world_building_6005 = {
			model = "worldBuildingSishi2.png",
			name = "北帶",
			x = 1575,
			y = 1556
		},
		world_building_6006 = {
			model = "worldBuildingSishi2.png",
			name = "朱篤",
			x = 1897,
			y = 1266
		},
		world_building_6007 = {
			model = "worldBuildingSishi2.png",
			name = "稽徐",
			x = 2241,
			y = 1402
		},
		world_building_6008 = {
			model = "model101.png",
			name = "望鄉",
			x = 880,
			y = 1665
		},
		world_building_6009 = {
			model = "model101.png",
			name = "荏青",
			x = 1197,
			y = 1686
		},
		world_building_6010 = {
			model = "model401.png",
			name = "北帶水域",
			x = 1268,
			y = 1496
		},
		world_building_6011 = {
			model = "model301.png",
			name = "望登東",
			x = 990,
			y = 1493
		},
		world_building_6012 = {
			model = "worldBuildingSishi2.png",
			name = "望登",
			x = 713,
			y = 1408
		},
		world_building_6013 = {
			model = "model301.png",
			name = "美山",
			x = 1008,
			y = 1284
		},
		world_building_6014 = {
			model = "model301.png",
			name = "雁飛南",
			x = 1360,
			y = 1340
		},
		world_building_6015 = {
			model = "model101.png",
			name = "汶郡",
			x = 800,
			y = 1208
		},
		world_building_6016 = {
			model = "worldBuildingSishi2.png",
			name = "雁飛",
			x = 1192,
			y = 1118
		},
		world_building_6017 = {
			model = "model301.png",
			name = "高平西",
			x = 1421,
			y = 1141
		},
		world_building_6018 = {
			model = "model401.png",
			name = "朱篤水域",
			x = 1690,
			y = 1169
		},
		world_building_6019 = {
			model = "model301.png",
			name = "禹玻南",
			x = 2081,
			y = 1161
		},
		world_building_6020 = {
			model = "model101.png",
			name = "稽徐北",
			x = 2431,
			y = 1304
		},
		world_building_6021 = {
			model = "model401.png",
			name = "昆蒿南",
			x = 848,
			y = 986
		},
		world_building_6022 = {
			model = "model101.png",
			name = "後昆",
			x = 1225,
			y = 964
		},
		world_building_6023 = {
			model = "model401.png",
			name = "後昆水域",
			x = 1426,
			y = 831
		},
		world_building_6024 = {
			model = "model301.png",
			name = "高平",
			x = 1576,
			y = 1009
		},
		world_building_6025 = {
			model = "model101.png",
			name = "高平北",
			x = 1714,
			y = 849
		},
		world_building_6026 = {
			model = "model101.png",
			name = "禹玻",
			x = 1850,
			y = 1076
		},
		world_building_6027 = {
			model = "model401.png",
			name = "禹玻水域",
			x = 2280,
			y = 1079
		},
		world_building_6028 = {
			model = "model101.png",
			name = "照值",
			x = 1966,
			y = 915
		},
		world_building_6029 = {
			model = "model101.png",
			name = "胥浦西",
			x = 2243,
			y = 918
		},
		world_building_6030 = {
			model = "worldBuildingSishi2.png",
			name = "胥浦",
			x = 2642,
			y = 882
		},
		world_building_6031 = {
			model = "worldBuildingSishi2.png",
			name = "昆蒿",
			x = 1060,
			y = 843
		},
		world_building_6032 = {
			model = "worldBuildingSishi2.png",
			name = "先安",
			x = 1545,
			y = 640
		},
		world_building_6033 = {
			model = "worldBuildingSishi2.png",
			name = "義路",
			x = 1880,
			y = 603
		},
		world_building_6034 = {
			model = "model101.png",
			name = "曲易東",
			x = 785,
			y = 841
		},
		world_building_6035 = {
			model = "model401.png",
			name = "隱河",
			x = 916,
			y = 689
		},
		world_building_6036 = {
			model = "worldBuildingSishi2.png",
			name = "曲易",
			x = 593,
			y = 698
		},
		world_building_6037 = {
			model = "model101.png",
			name = "齊驊",
			x = 728,
			y = 611
		},
		world_building_6038 = {
			model = "worldBuildingSishi2.png",
			name = "興安",
			x = 910,
			y = 503
		},
		world_building_6039 = {
			model = "model101.png",
			name = "興安東",
			x = 1108,
			y = 379
		},
		world_building_6040 = {
			model = "model101.png",
			name = "富壽南",
			x = 1423,
			y = 490
		},
		world_building_6041 = {
			model = "model101.png",
			name = "義路北",
			x = 1838,
			y = 471
		},
		world_building_6042 = {
			model = "model401.png",
			name = "龍編水域",
			x = 2104,
			y = 347
		},
		world_building_6043 = {
			model = "model604.png",
			name = "富壽",
			x = 1315,
			y = 247
		},
		world_building_6046 = {
			model = "model602.png",
			name = "都尉",
			x = 1572,
			y = 191
		},
		world_building_6044 = {
			model = "model604.png",
			name = "西幹",
			x = 1593,
			y = 345
		},
		world_building_6045 = {
			model = "model604.png",
			name = "龍編",
			x = 1847,
			y = 202
		},
		world_building_7001 = {
			model = "model602.png",
			name = "琉球都城",
			x = 290,
			y = 192
		},
		world_building_7002 = {
			model = "model604.png",
			name = "名護",
			x = 271,
			y = 386
		},
		world_building_7003 = {
			model = "model101.png",
			name = "名護南",
			x = 373,
			y = 623
		},
		world_building_7004 = {
			model = "model604.png",
			name = "金武",
			x = 529,
			y = 335
		},
		world_building_7005 = {
			model = "model101.png",
			name = "金武東",
			x = 849,
			y = 390
		},
		world_building_7006 = {
			model = "model301.png",
			name = "運天山",
			x = 674,
			y = 529
		},
		world_building_7007 = {
			model = "model401.png",
			name = "越來水域",
			x = 1005,
			y = 677
		},
		world_building_7008 = {
			model = "model101.png",
			name = "越來",
			x = 1057,
			y = 459
		},
		world_building_7009 = {
			model = "model604.png",
			name = "久志",
			x = 546,
			y = 150
		},
		world_building_7010 = {
			model = "model301.png",
			name = "姑場岳",
			x = 856,
			y = 141
		},
		world_building_7011 = {
			model = "model401.png",
			name = "國頭津",
			x = 1233,
			y = 270
		},
		world_building_7012 = {
			model = "model401.png",
			name = "奇界",
			x = 1554,
			y = 234
		},
		world_building_7013 = {
			model = "model301.png",
			name = "堷山",
			x = 1821,
			y = 140
		},
		world_building_7014 = {
			model = "model101.png",
			name = "伊計",
			x = 2158,
			y = 170
		},
		world_building_7015 = {
			model = "model301.png",
			name = "西麻齒山",
			x = 2505,
			y = 176
		},
		world_building_7016 = {
			model = "model401.png",
			name = "度那奇",
			x = 2475,
			y = 402
		},
		world_building_7017 = {
			model = "model301.png",
			name = "東麻齒山",
			x = 2751,
			y = 359
		},
		world_building_7018 = {
			model = "model101.png",
			name = "伊良保",
			x = 2593,
			y = 679
		},
		world_building_7019 = {
			model = "model101.png",
			name = "由呂北",
			x = 1966,
			y = 320
		},
		world_building_7020 = {
			model = "model604.png",
			name = "由呂",
			x = 2191,
			y = 434
		},
		world_building_7021 = {
			model = "model101.png",
			name = "小壁葉",
			x = 1804,
			y = 457
		},
		world_building_7022 = {
			model = "model401.png",
			name = "巴度麻",
			x = 2117,
			y = 646
		},
		world_building_7023 = {
			model = "model401.png",
			name = "五城水域",
			x = 1277,
			y = 600
		},
		world_building_7024 = {
			model = "model101.png",
			name = "五城北",
			x = 1442,
			y = 719
		},
		world_building_7025 = {
			model = "model401.png",
			name = "長虹橋",
			x = 1765,
			y = 678
		},
		world_building_7026 = {
			model = "model401.png",
			name = "兼城水域",
			x = 1973,
			y = 956
		},
		world_building_7027 = {
			model = "model604.png",
			name = "五城",
			x = 1498,
			y = 884
		},
		world_building_7028 = {
			model = "model101.png",
			name = "兼城北",
			x = 1739,
			y = 921
		},
		world_building_7029 = {
			model = "model604.png",
			name = "兼城",
			x = 1588,
			y = 1165
		},
		world_building_7030 = {
			model = "model401.png",
			name = "泊津",
			x = 1300,
			y = 1176
		},
		world_building_7031 = {
			model = "model301.png",
			name = "真壁",
			x = 1269,
			y = 989
		},
		world_building_7032 = {
			model = "model301.png",
			name = "辨嶽",
			x = 1081,
			y = 897
		},
		world_building_7033 = {
			model = "model101.png",
			name = "浦添",
			x = 381,
			y = 942
		},
		world_building_7034 = {
			model = "model101.png",
			name = "思納北",
			x = 478,
			y = 1086
		},
		world_building_7035 = {
			model = "model401.png",
			name = "宜野灣",
			x = 798,
			y = 1030
		},
		world_building_7036 = {
			model = "model604.png",
			name = "思納",
			x = 538,
			y = 1228
		},
		world_building_7037 = {
			model = "model101.png",
			name = "東原",
			x = 885,
			y = 1294
		},
		world_building_7038 = {
			model = "model604.png",
			name = "豐見城",
			x = 1147,
			y = 1429
		},
		world_building_7039 = {
			model = "model401.png",
			name = "波上",
			x = 1499,
			y = 1451
		},
		world_building_7040 = {
			model = "model301.png",
			name = "思納嶽",
			x = 240,
			y = 1249
		},
		world_building_7041 = {
			model = "model101.png",
			name = "西原",
			x = 257,
			y = 1492
		},
		world_building_7042 = {
			model = "model301.png",
			name = "讀穀山",
			x = 498,
			y = 1582
		},
		world_building_7043 = {
			model = "model301.png",
			name = "天久山",
			x = 570,
			y = 1403
		},
		world_building_7044 = {
			model = "model604.png",
			name = "美裡",
			x = 836,
			y = 1501
		},
		world_building_7045 = {
			model = "model401.png",
			name = "面那水域",
			x = 2665,
			y = 879
		},
		world_building_7046 = {
			model = "model101.png",
			name = "面那北",
			x = 2460,
			y = 987
		},
		world_building_7047 = {
			model = "model604.png",
			name = "面那",
			x = 2471,
			y = 1200
		},
		world_building_7048 = {
			model = "model101.png",
			name = "面那東",
			x = 2788,
			y = 1206
		},
		world_building_7049 = {
			model = "model401.png",
			name = "津奇奴",
			x = 2181,
			y = 964
		},
		world_building_7050 = {
			model = "model401.png",
			name = "伊奇麻",
			x = 1987,
			y = 1279
		},
		world_building_7051 = {
			model = "model301.png",
			name = "麻姑山",
			x = 2209,
			y = 1239
		},
		world_building_7052 = {
			model = "model604.png",
			name = "巴梯",
			x = 2213,
			y = 1426
		},
		world_building_7053 = {
			model = "model401.png",
			name = "鳥巴麻",
			x = 1717,
			y = 1456
		},
		world_building_7054 = {
			model = "model301.png",
			name = "姑彌山",
			x = 2019,
			y = 1605
		},
		world_building_7055 = {
			model = "model301.png",
			name = "八重山",
			x = 2525,
			y = 1418
		},
		world_building_7056 = {
			model = "model602.png",
			name = "遠征本營",
			x = 2758,
			y = 1472
		},
		world_building_8001 = {
			model = "worldBuildingChengchi1.png",
			name = "蒙巂詔",
			x = 2768,
			y = 179
		},
		world_building_8002 = {
			model = "model101.png",
			name = "楚雄",
			x = 2480,
			y = 160
		},
		world_building_8003 = {
			model = "model305.png",
			name = "牟和",
			x = 2102,
			y = 135
		},
		world_building_8004 = {
			model = "model101.png",
			name = "繡腳",
			x = 1740,
			y = 133
		},
		world_building_8005 = {
			model = "model101.png",
			name = "河人",
			x = 1352,
			y = 117
		},
		world_building_8006 = {
			model = "model101.png",
			name = "大釐",
			x = 2520,
			y = 389
		},
		world_building_8007 = {
			model = "model401.png",
			name = "臨滄",
			x = 2272,
			y = 449
		},
		world_building_8008 = {
			model = "model101.png",
			name = "金齒",
			x = 1982,
			y = 347
		},
		world_building_8009 = {
			model = "model305.png",
			name = "磨些",
			x = 1584,
			y = 369
		},
		world_building_8010 = {
			model = "model101.png",
			name = "大厘",
			x = 2835,
			y = 440
		},
		world_building_8011 = {
			model = "model401.png",
			name = "漾濞",
			x = 2005,
			y = 594
		},
		world_building_8012 = {
			model = "model101.png",
			name = "姚安",
			x = 2815,
			y = 717
		},
		world_building_8013 = {
			model = "model401.png",
			name = "銀齒",
			x = 2350,
			y = 673
		},
		world_building_8014 = {
			model = "model301.png",
			name = "穿鼻",
			x = 2620,
			y = 870
		},
		world_building_8015 = {
			model = "model101.png",
			name = "樸子",
			x = 2880,
			y = 997
		},
		world_building_8016 = {
			model = "model101.png",
			name = "蒙秦賧",
			x = 973,
			y = 180
		},
		world_building_8017 = {
			model = "worldBuildingChengchi1.png",
			name = "越析詔",
			x = 1232,
			y = 332
		},
		world_building_8018 = {
			model = "model101.png",
			name = "太和",
			x = 1340,
			y = 573
		},
		world_building_8019 = {
			model = "worldBuildingChengchi1.png",
			name = "浪穹詔",
			x = 1717,
			y = 590
		},
		world_building_8020 = {
			model = "model101.png",
			name = "永昌",
			x = 2067,
			y = 897
		},
		world_building_8021 = {
			model = "worldBuildingChengchi1.png",
			name = "邆賧詔",
			x = 2401,
			y = 962
		},
		world_building_8022 = {
			model = "model101.png",
			name = "浪加萌",
			x = 2757,
			y = 1277
		},
		world_building_8023 = {
			model = "model602.png",
			name = "施浪詔",
			x = 830,
			y = 420
		},
		world_building_8024 = {
			model = "model602.png",
			name = "蒙舍詔",
			x = 1623,
			y = 832
		},
		world_building_8025 = {
			model = "model602.png",
			name = "洱海城",
			x = 2356,
			y = 1186
		},
		world_building_8026 = {
			model = "model305.png",
			name = "羊苴咩",
			x = 442,
			y = 182
		},
		world_building_8027 = {
			model = "model305.png",
			name = "洪衛",
			x = 237,
			y = 427
		},
		world_building_8028 = {
			model = "model101.png",
			name = "望苴",
			x = 536,
			y = 536
		},
		world_building_8029 = {
			model = "model305.png",
			name = "裸形",
			x = 787,
			y = 740
		},
		world_building_8030 = {
			model = "model101.png",
			name = "於浪",
			x = 1187,
			y = 822
		},
		world_building_8031 = {
			model = "model101.png",
			name = "弄棟",
			x = 1460,
			y = 1085
		},
		world_building_8032 = {
			model = "model301.png",
			name = "迪慶",
			x = 1990,
			y = 1150
		},
		world_building_8033 = {
			model = "model101.png",
			name = "思茅",
			x = 2240,
			y = 1397
		},
		world_building_8034 = {
			model = "model305.png",
			name = "白崖",
			x = 2592,
			y = 1490
		},
		world_building_8035 = {
			model = "model101.png",
			name = "會川",
			x = 166,
			y = 744
		},
		world_building_8036 = {
			model = "worldBuildingChengchi1.png",
			name = "邆川城",
			x = 462,
			y = 762
		},
		world_building_8037 = {
			model = "worldBuildingChengchi1.png",
			name = "龍口城",
			x = 1022,
			y = 1032
		},
		world_building_8038 = {
			model = "model305.png",
			name = "傳袞",
			x = 1735,
			y = 1300
		},
		world_building_8039 = {
			model = "worldBuildingChengchi1.png",
			name = "蒙舍城",
			x = 1955,
			y = 1492
		},
		world_building_8040 = {
			model = "model101.png",
			name = "德宏",
			x = 2260,
			y = 1632
		},
		world_building_8041 = {
			model = "model101.png",
			name = "廟街",
			x = 365,
			y = 1047
		},
		world_building_8042 = {
			model = "model401.png",
			name = "望熬",
			x = 655,
			y = 1095
		},
		world_building_8043 = {
			model = "model401.png",
			name = "通海",
			x = 1355,
			y = 1322
		},
		world_building_8044 = {
			model = "model401.png",
			name = "漆齒",
			x = 1690,
			y = 1614
		},
		world_building_8045 = {
			model = "model301.png",
			name = "望外喻",
			x = 985,
			y = 1355
		},
		world_building_8046 = {
			model = "model401.png",
			name = "長褌",
			x = 1285,
			y = 1560
		},
		world_building_8047 = {
			model = "model101.png",
			name = "巍山",
			x = 220,
			y = 1377
		},
		world_building_8048 = {
			model = "model101.png",
			name = "保山",
			x = 640,
			y = 1405
		},
		world_building_8049 = {
			model = "model101.png",
			name = "鳳儀",
			x = 922,
			y = 1632
		},
		world_building_8050 = {
			model = "worldBuildingChengchi1.png",
			name = "南詔都",
			x = 492,
			y = 1605
		}
	}
	worldMianzhanConstant.BUILDING_INFO = {
		world_building_133 = {
			model = "worldBuildingGuanqia1.png",
			name = "虎牢關",
			x = 3217,
			y = 1269
		},
		world_building_102 = {
			model = "worldBuildingGuanqia3.png",
			name = "巫峽關",
			x = 2234,
			y = 2053
		},
		world_building_144 = {
			model = "worldBuildingGuanqia2.png",
			name = "赤壁",
			x = 3634,
			y = 2006
		},
		world_building_78 = {
			model = "worldBuildingGuanqia2.png",
			name = "函谷關",
			x = 2032,
			y = 527
		},
		world_building_70 = {
			model = "worldBuildingGuanqia2.png",
			name = "夷陵",
			x = 1937,
			y = 2806
		},
		world_building_189 = {
			model = "worldBuildingGuanqia2.png",
			name = "濡須塢",
			x = 4785,
			y = 1736
		}
	}
else
	worldDongyingConstant.BUILDING_INFO = {
		world_building_4002 = {
			model = "dongYingCityCapital.png",
			name = "百济",
			x = 508,
			y = 238
		},
		world_building_4003 = {
			model = "dongYingCityShuiyu.png",
			name = "对马北港",
			x = 810,
			y = 197
		},
		world_building_4004 = {
			model = "dongYingCity.png",
			name = "对马",
			x = 1117,
			y = 316
		},
		world_building_4005 = {
			model = "dongYingCityShuiyu.png",
			name = "壹岐港",
			x = 1240,
			y = 557
		},
		world_building_4006 = {
			model = "dongYingCityShandi.png",
			name = "壹岐",
			x = 1378,
			y = 722
		},
		world_building_4007 = {
			model = "dongYingCityShuiyu.png",
			name = "越前水域",
			x = 1566,
			y = 819
		},
		world_building_4008 = {
			model = "dongYingCity.png",
			name = "越前",
			x = 1519,
			y = 1010
		},
		world_building_4009 = {
			model = "dongYingCity.png",
			name = "近江",
			x = 1389,
			y = 1214
		},
		world_building_4010 = {
			model = "dongYingCity.png",
			name = "伊势",
			x = 1591,
			y = 1465
		},
		world_building_4011 = {
			model = "dongYingCity.png",
			name = "伊豆",
			x = 1971,
			y = 1541
		},
		world_building_4012 = {
			model = "dongYingCityCapital.png",
			name = "江户",
			x = 2354,
			y = 1537
		},
		world_building_4013 = {
			model = "dongYingCity.png",
			name = "山口",
			x = 863,
			y = 760
		},
		world_building_4014 = {
			model = "dongYingCityShuiyu.png",
			name = "山口港",
			x = 479,
			y = 761
		},
		world_building_4015 = {
			model = "dongYingCityShandi.png",
			name = "龟山西",
			x = 686,
			y = 958
		},
		world_building_4016 = {
			model = "dongYingCity.png",
			name = "冈城",
			x = 378,
			y = 1026
		},
		world_building_4018 = {
			model = "dongYingCityPlain.png",
			name = "本山北",
			x = 402,
			y = 1434
		},
		world_building_4019 = {
			model = "dongYingCityShandi.png",
			name = "高崎",
			x = 332,
			y = 1625
		},
		world_building_4020 = {
			model = "dongYingCity.png",
			name = "筑紫",
			x = 613,
			y = 1531
		},
		world_building_4021 = {
			model = "dongYingCityShuiyu.png",
			name = "本山水域",
			x = 790,
			y = 1666
		},
		world_building_4022 = {
			model = "dongYingCityPlain.png",
			name = "岩仓",
			x = 878,
			y = 1505
		},
		world_building_4023 = {
			model = "dongYingCityPlain.png",
			name = "纪伊西",
			x = 962,
			y = 1318
		},
		world_building_4024 = {
			model = "dongYingCityShandi.png",
			name = "龟山",
			x = 928,
			y = 1082
		},
		world_building_4025 = {
			model = "dongYingCityPlain.png",
			name = "滨田",
			x = 1180,
			y = 964
		},
		world_building_4026 = {
			model = "dongYingCity.png",
			name = "纪伊",
			x = 1237,
			y = 1378
		},
		world_building_4027 = {
			model = "dongYingCityShuiyu.png",
			name = "近江水域",
			x = 1736,
			y = 1265
		},
		world_building_4028 = {
			model = "dongYingCityShuiyu.png",
			name = "伊势水域",
			x = 1657,
			y = 1656
		},
		world_building_4029 = {
			model = "dongYingCity.png",
			name = "泷山",
			x = 2141,
			y = 1336
		},
		world_building_4030 = {
			model = "dongYingCity.png",
			name = "越后",
			x = 1877,
			y = 1016
		},
		world_building_4031 = {
			model = "dongYingCityPlain.png",
			name = "越后北",
			x = 2034,
			y = 792
		},
		world_building_4032 = {
			model = "dongYingCity.png",
			name = "村上",
			x = 2325,
			y = 879
		},
		world_building_4033 = {
			model = "dongYingCityPlain.png",
			name = "乌山",
			x = 2170,
			y = 1064
		},
		world_building_4034 = {
			model = "dongYingCityPlain.png",
			name = "须贺川",
			x = 2614,
			y = 936
		},
		world_building_4035 = {
			model = "dongYingCityPlain.png",
			name = "常陆东",
			x = 2674,
			y = 1172
		},
		world_building_4036 = {
			model = "dongYingCity.png",
			name = "常陆",
			x = 2423,
			y = 1258
		},
		world_building_4037 = {
			model = "dongYingCityShuiyu.png",
			name = "江户水域",
			x = 2654,
			y = 1458
		},
		world_building_4038 = {
			model = "dongYingCityShuiyu.png",
			name = "隐岐西",
			x = 1426,
			y = 155
		},
		world_building_4039 = {
			model = "dongYingCityShandi.png",
			name = "隐岐",
			x = 1726,
			y = 314
		},
		world_building_4040 = {
			model = "dongYingCityShuiyu.png",
			name = "越后水域",
			x = 1940,
			y = 527
		},
		world_building_4041 = {
			model = "dongYingCity.png",
			name = "堀越",
			x = 2317,
			y = 570
		},
		world_building_4042 = {
			model = "dongYingCityShandi.png",
			name = "出云南",
			x = 2668,
			y = 565
		},
		world_building_4043 = {
			model = "dongYingCityPlain.png",
			name = "仙台",
			x = 2812,
			y = 750
		},
		world_building_4044 = {
			model = "dongYingCity.png",
			name = "出云",
			x = 2549,
			y = 384
		},
		world_building_4045 = {
			model = "dongYingCityPlain.png",
			name = "出羽",
			x = 2501,
			y = 204
		},
		world_building_5001 = {
			model = "model604.png",
			name = "我军大营",
			x = 1020,
			y = 1597
		},
		world_building_5002 = {
			model = "model101.png",
			name = "大营北路",
			x = 755,
			y = 1538
		},
		world_building_5003 = {
			model = "model301.png",
			name = "林间小道",
			x = 1177,
			y = 1455
		},
		world_building_5004 = {
			model = "model101.png",
			name = "大营东路",
			x = 1431,
			y = 1633
		},
		world_building_5005 = {
			model = "model301.png",
			name = "安东西山",
			x = 1894,
			y = 1607
		},
		world_building_5006 = {
			model = "model301.png",
			name = "全州西山",
			x = 1063,
			y = 1282
		},
		world_building_5007 = {
			model = "model101.png",
			name = "全州南",
			x = 1461,
			y = 1354
		},
		world_building_5008 = {
			model = "model101.png",
			name = "安东西",
			x = 1830,
			y = 1427
		},
		world_building_5009 = {
			model = "model604.png",
			name = "安东",
			x = 2203,
			y = 1358
		},
		world_building_5010 = {
			model = "model101.png",
			name = "安东南",
			x = 2334,
			y = 1537
		},
		world_building_5011 = {
			model = "model101.png",
			name = "全州西",
			x = 930,
			y = 1081
		},
		world_building_5012 = {
			model = "model604.png",
			name = "全州",
			x = 1499,
			y = 1106
		},
		world_building_5013 = {
			model = "model301.png",
			name = "全州东",
			x = 1767,
			y = 1170
		},
		world_building_5014 = {
			model = "model101.png",
			name = "安东北",
			x = 2041,
			y = 1183
		},
		world_building_5015 = {
			model = "model301.png",
			name = "山陟南",
			x = 2234,
			y = 1073
		},
		world_building_5016 = {
			model = "model101.png",
			name = "安东东",
			x = 2545,
			y = 1256
		},
		world_building_5017 = {
			model = "model401.png",
			name = "义周南",
			x = 813,
			y = 925
		},
		world_building_5018 = {
			model = "model301.png",
			name = "全州北",
			x = 1181,
			y = 1042
		},
		world_building_5019 = {
			model = "model301.png",
			name = "义周东",
			x = 1397,
			y = 887
		},
		world_building_5020 = {
			model = "model401.png",
			name = "开城南",
			x = 1792,
			y = 901
		},
		world_building_5021 = {
			model = "model101.png",
			name = "山陟西",
			x = 2120,
			y = 799
		},
		world_building_5022 = {
			model = "model604.png",
			name = "山陟",
			x = 2359,
			y = 863
		},
		world_building_5023 = {
			model = "model401.png",
			name = "山陟东",
			x = 2560,
			y = 990
		},
		world_building_5024 = {
			model = "model604.png",
			name = "义周",
			x = 993,
			y = 795
		},
		world_building_5025 = {
			model = "model301.png",
			name = "义周西",
			x = 614,
			y = 685
		},
		world_building_5026 = {
			model = "model101.png",
			name = "义周北",
			x = 1244,
			y = 707
		},
		world_building_5027 = {
			model = "model301.png",
			name = "开城西",
			x = 1509,
			y = 670
		},
		world_building_5028 = {
			model = "model604.png",
			name = "开城",
			x = 1834,
			y = 713
		},
		world_building_5029 = {
			model = "model301.png",
			name = "开城东",
			x = 2014,
			y = 581
		},
		world_building_5030 = {
			model = "model401.png",
			name = "山陟北",
			x = 2548,
			y = 699
		},
		world_building_5031 = {
			model = "model305.png",
			name = "江界峡谷",
			x = 896,
			y = 585
		},
		world_building_5032 = {
			model = "model305.png",
			name = "长津峡谷",
			x = 1416,
			y = 472
		},
		world_building_5033 = {
			model = "model101.png",
			name = "开城北",
			x = 1725,
			y = 537
		},
		world_building_5034 = {
			model = "model301.png",
			name = "渔村外山",
			x = 2493,
			y = 535
		},
		world_building_5035 = {
			model = "model604.png",
			name = "江界",
			x = 777,
			y = 388
		},
		world_building_5036 = {
			model = "model604.png",
			name = "长津",
			x = 1134,
			y = 401
		},
		world_building_5037 = {
			model = "model101.png",
			name = "渔村西郊",
			x = 2257,
			y = 519
		},
		world_building_5038 = {
			model = "model401.png",
			name = "东海渔村",
			x = 2346,
			y = 334
		},
		world_building_5039 = {
			model = "model604.png",
			name = "吉州",
			x = 1236,
			y = 213
		},
		world_building_5040 = {
			model = "model305.png",
			name = "吉州峡谷",
			x = 1450,
			y = 258
		},
		world_building_5041 = {
			model = "model301.png",
			name = "永兴西山",
			x = 1663,
			y = 366
		},
		world_building_5042 = {
			model = "model101.png",
			name = "永兴东郊",
			x = 1971,
			y = 419
		},
		world_building_5043 = {
			model = "model101.png",
			name = "永兴东",
			x = 2257,
			y = 196
		},
		world_building_5044 = {
			model = "model604.png",
			name = "永兴",
			x = 1931,
			y = 191
		},
		world_building_5045 = {
			model = "model301.png",
			name = "永兴西",
			x = 1684,
			y = 186
		},
		world_building_5046 = {
			model = "model602.png",
			name = "平壤",
			x = 922,
			y = 216
		},
		world_building_6001 = {
			model = "model602.png",
			name = "河内",
			x = 2126,
			y = 1686
		},
		world_building_6002 = {
			model = "model101.png",
			name = "章羌",
			x = 1881,
			y = 1646
		},
		world_building_6003 = {
			model = "model301.png",
			name = "塘境",
			x = 1979,
			y = 1471
		},
		world_building_6004 = {
			model = "model101.png",
			name = "河内北",
			x = 2275,
			y = 1611
		},
		world_building_6005 = {
			model = "worldBuildingSishi2.png",
			name = "北带",
			x = 1575,
			y = 1556
		},
		world_building_6006 = {
			model = "worldBuildingSishi2.png",
			name = "朱笃",
			x = 1897,
			y = 1266
		},
		world_building_6007 = {
			model = "worldBuildingSishi2.png",
			name = "稽徐",
			x = 2241,
			y = 1402
		},
		world_building_6008 = {
			model = "model101.png",
			name = "望乡",
			x = 880,
			y = 1665
		},
		world_building_6009 = {
			model = "model101.png",
			name = "荏青",
			x = 1197,
			y = 1686
		},
		world_building_6010 = {
			model = "model401.png",
			name = "北带水域",
			x = 1268,
			y = 1496
		},
		world_building_6011 = {
			model = "model301.png",
			name = "望登东",
			x = 990,
			y = 1493
		},
		world_building_6012 = {
			model = "worldBuildingSishi2.png",
			name = "望登",
			x = 713,
			y = 1408
		},
		world_building_6013 = {
			model = "model301.png",
			name = "美山",
			x = 1008,
			y = 1284
		},
		world_building_6014 = {
			model = "model301.png",
			name = "雁飞南",
			x = 1360,
			y = 1340
		},
		world_building_6015 = {
			model = "model101.png",
			name = "汶郡",
			x = 800,
			y = 1208
		},
		world_building_6016 = {
			model = "worldBuildingSishi2.png",
			name = "雁飞",
			x = 1192,
			y = 1118
		},
		world_building_6017 = {
			model = "model301.png",
			name = "高平西",
			x = 1421,
			y = 1141
		},
		world_building_6018 = {
			model = "model401.png",
			name = "朱笃水域",
			x = 1690,
			y = 1169
		},
		world_building_6019 = {
			model = "model301.png",
			name = "禹玻南",
			x = 2081,
			y = 1161
		},
		world_building_6020 = {
			model = "model101.png",
			name = "稽徐北",
			x = 2431,
			y = 1304
		},
		world_building_6021 = {
			model = "model401.png",
			name = "昆蒿南",
			x = 848,
			y = 986
		},
		world_building_6022 = {
			model = "model101.png",
			name = "后昆",
			x = 1225,
			y = 964
		},
		world_building_6023 = {
			model = "model401.png",
			name = "后昆水域",
			x = 1426,
			y = 831
		},
		world_building_6024 = {
			model = "model301.png",
			name = "高平",
			x = 1576,
			y = 1009
		},
		world_building_6025 = {
			model = "model101.png",
			name = "高平北",
			x = 1714,
			y = 849
		},
		world_building_6026 = {
			model = "model101.png",
			name = "禹玻",
			x = 1850,
			y = 1076
		},
		world_building_6027 = {
			model = "model401.png",
			name = "禹玻水域",
			x = 2280,
			y = 1079
		},
		world_building_6028 = {
			model = "model101.png",
			name = "照值",
			x = 1966,
			y = 915
		},
		world_building_6029 = {
			model = "model101.png",
			name = "胥浦西",
			x = 2243,
			y = 918
		},
		world_building_6030 = {
			model = "worldBuildingSishi2.png",
			name = "胥浦",
			x = 2642,
			y = 882
		},
		world_building_6031 = {
			model = "worldBuildingSishi2.png",
			name = "昆蒿",
			x = 1060,
			y = 843
		},
		world_building_6032 = {
			model = "worldBuildingSishi2.png",
			name = "先安",
			x = 1545,
			y = 640
		},
		world_building_6033 = {
			model = "worldBuildingSishi2.png",
			name = "义路",
			x = 1880,
			y = 603
		},
		world_building_6034 = {
			model = "model101.png",
			name = "曲易东",
			x = 785,
			y = 841
		},
		world_building_6035 = {
			model = "model401.png",
			name = "隐河",
			x = 916,
			y = 689
		},
		world_building_6036 = {
			model = "worldBuildingSishi2.png",
			name = "曲易",
			x = 593,
			y = 698
		},
		world_building_6037 = {
			model = "model101.png",
			name = "齐骅",
			x = 728,
			y = 611
		},
		world_building_6038 = {
			model = "worldBuildingSishi2.png",
			name = "兴安",
			x = 910,
			y = 503
		},
		world_building_6039 = {
			model = "model101.png",
			name = "兴安东",
			x = 1108,
			y = 379
		},
		world_building_6040 = {
			model = "model101.png",
			name = "富寿南",
			x = 1423,
			y = 490
		},
		world_building_6041 = {
			model = "model101.png",
			name = "义路北",
			x = 1838,
			y = 471
		},
		world_building_6042 = {
			model = "model401.png",
			name = "龙编水域",
			x = 2104,
			y = 347
		},
		world_building_6043 = {
			model = "model604.png",
			name = "富寿",
			x = 1315,
			y = 247
		},
		world_building_6046 = {
			model = "model602.png",
			name = "都尉",
			x = 1572,
			y = 191
		},
		world_building_6044 = {
			model = "model604.png",
			name = "西干",
			x = 1593,
			y = 345
		},
		world_building_6045 = {
			model = "model604.png",
			name = "龙编",
			x = 1847,
			y = 202
		},
		world_building_7001 = {
			model = "model602.png",
			name = "琉球都城",
			x = 290,
			y = 192
		},
		world_building_7002 = {
			model = "model604.png",
			name = "名护",
			x = 271,
			y = 386
		},
		world_building_7003 = {
			model = "model101.png",
			name = "名护南",
			x = 373,
			y = 623
		},
		world_building_7004 = {
			model = "model604.png",
			name = "金武",
			x = 529,
			y = 335
		},
		world_building_7005 = {
			model = "model101.png",
			name = "金武东",
			x = 849,
			y = 390
		},
		world_building_7006 = {
			model = "model301.png",
			name = "运天山",
			x = 674,
			y = 529
		},
		world_building_7007 = {
			model = "model401.png",
			name = "越来水域",
			x = 1005,
			y = 677
		},
		world_building_7008 = {
			model = "model101.png",
			name = "越来",
			x = 1057,
			y = 459
		},
		world_building_7009 = {
			model = "model604.png",
			name = "久志",
			x = 546,
			y = 150
		},
		world_building_7010 = {
			model = "model301.png",
			name = "姑场岳",
			x = 856,
			y = 141
		},
		world_building_7011 = {
			model = "model401.png",
			name = "国头津",
			x = 1233,
			y = 270
		},
		world_building_7012 = {
			model = "model401.png",
			name = "奇界",
			x = 1554,
			y = 234
		},
		world_building_7013 = {
			model = "model301.png",
			name = "堷山",
			x = 1821,
			y = 140
		},
		world_building_7014 = {
			model = "model101.png",
			name = "伊计",
			x = 2158,
			y = 170
		},
		world_building_7015 = {
			model = "model301.png",
			name = "西麻齿山",
			x = 2505,
			y = 176
		},
		world_building_7016 = {
			model = "model401.png",
			name = "度那奇",
			x = 2475,
			y = 402
		},
		world_building_7017 = {
			model = "model301.png",
			name = "东麻齿山",
			x = 2751,
			y = 359
		},
		world_building_7018 = {
			model = "model101.png",
			name = "伊良保",
			x = 2593,
			y = 679
		},
		world_building_7019 = {
			model = "model101.png",
			name = "由吕北",
			x = 1966,
			y = 320
		},
		world_building_7020 = {
			model = "model604.png",
			name = "由吕",
			x = 2191,
			y = 434
		},
		world_building_7021 = {
			model = "model101.png",
			name = "小壁叶",
			x = 1804,
			y = 457
		},
		world_building_7022 = {
			model = "model401.png",
			name = "巴度麻",
			x = 2117,
			y = 646
		},
		world_building_7023 = {
			model = "model401.png",
			name = "五城水域",
			x = 1277,
			y = 600
		},
		world_building_7024 = {
			model = "model101.png",
			name = "五城北",
			x = 1442,
			y = 719
		},
		world_building_7025 = {
			model = "model401.png",
			name = "长虹桥",
			x = 1765,
			y = 678
		},
		world_building_7026 = {
			model = "model401.png",
			name = "兼城水域",
			x = 1973,
			y = 956
		},
		world_building_7027 = {
			model = "model604.png",
			name = "五城",
			x = 1498,
			y = 884
		},
		world_building_7028 = {
			model = "model101.png",
			name = "兼城北",
			x = 1739,
			y = 921
		},
		world_building_7029 = {
			model = "model604.png",
			name = "兼城",
			x = 1588,
			y = 1165
		},
		world_building_7030 = {
			model = "model401.png",
			name = "泊津",
			x = 1300,
			y = 1176
		},
		world_building_7031 = {
			model = "model301.png",
			name = "真壁",
			x = 1269,
			y = 989
		},
		world_building_7032 = {
			model = "model301.png",
			name = "辨岳",
			x = 1081,
			y = 897
		},
		world_building_7033 = {
			model = "model101.png",
			name = "浦添",
			x = 381,
			y = 942
		},
		world_building_7034 = {
			model = "model101.png",
			name = "思纳北",
			x = 478,
			y = 1086
		},
		world_building_7035 = {
			model = "model401.png",
			name = "宜野湾",
			x = 798,
			y = 1030
		},
		world_building_7036 = {
			model = "model604.png",
			name = "思纳",
			x = 538,
			y = 1228
		},
		world_building_7037 = {
			model = "model101.png",
			name = "东原",
			x = 885,
			y = 1294
		},
		world_building_7038 = {
			model = "model604.png",
			name = "丰见城",
			x = 1147,
			y = 1429
		},
		world_building_7039 = {
			model = "model401.png",
			name = "波上",
			x = 1499,
			y = 1451
		},
		world_building_7040 = {
			model = "model301.png",
			name = "思纳岳",
			x = 240,
			y = 1249
		},
		world_building_7041 = {
			model = "model101.png",
			name = "西原",
			x = 257,
			y = 1492
		},
		world_building_7042 = {
			model = "model301.png",
			name = "读谷山",
			x = 498,
			y = 1582
		},
		world_building_7043 = {
			model = "model301.png",
			name = "天久山",
			x = 570,
			y = 1403
		},
		world_building_7044 = {
			model = "model604.png",
			name = "美里",
			x = 836,
			y = 1501
		},
		world_building_7045 = {
			model = "model401.png",
			name = "面那水域",
			x = 2665,
			y = 879
		},
		world_building_7046 = {
			model = "model101.png",
			name = "面那北",
			x = 2460,
			y = 987
		},
		world_building_7047 = {
			model = "model604.png",
			name = "面那",
			x = 2471,
			y = 1200
		},
		world_building_7048 = {
			model = "model101.png",
			name = "面那东",
			x = 2788,
			y = 1206
		},
		world_building_7049 = {
			model = "model401.png",
			name = "津奇奴",
			x = 2181,
			y = 964
		},
		world_building_7050 = {
			model = "model401.png",
			name = "伊奇麻",
			x = 1987,
			y = 1279
		},
		world_building_7051 = {
			model = "model301.png",
			name = "麻姑山",
			x = 2209,
			y = 1239
		},
		world_building_7052 = {
			model = "model604.png",
			name = "巴梯",
			x = 2213,
			y = 1426
		},
		world_building_7053 = {
			model = "model401.png",
			name = "鸟巴麻",
			x = 1717,
			y = 1456
		},
		world_building_7054 = {
			model = "model301.png",
			name = "姑弥山",
			x = 2019,
			y = 1605
		},
		world_building_7055 = {
			model = "model301.png",
			name = "八重山",
			x = 2525,
			y = 1418
		},
		world_building_7056 = {
			model = "model602.png",
			name = "远征本营",
			x = 2758,
			y = 1472
		},
		world_building_8001 = {
			model = "worldBuildingChengchi1.png",
			name = "蒙巂诏",
			x = 2768,
			y = 179
		},
		world_building_8002 = {
			model = "model101.png",
			name = "楚雄",
			x = 2480,
			y = 160
		},
		world_building_8003 = {
			model = "model305.png",
			name = "牟和",
			x = 2102,
			y = 135
		},
		world_building_8004 = {
			model = "model101.png",
			name = "绣脚",
			x = 1740,
			y = 133
		},
		world_building_8005 = {
			model = "model101.png",
			name = "河人",
			x = 1352,
			y = 117
		},
		world_building_8006 = {
			model = "model101.png",
			name = "大釐",
			x = 2520,
			y = 389
		},
		world_building_8007 = {
			model = "model401.png",
			name = "临沧",
			x = 2272,
			y = 449
		},
		world_building_8008 = {
			model = "model101.png",
			name = "金齿",
			x = 1982,
			y = 347
		},
		world_building_8009 = {
			model = "model305.png",
			name = "磨些",
			x = 1584,
			y = 369
		},
		world_building_8010 = {
			model = "model101.png",
			name = "大厘",
			x = 2835,
			y = 440
		},
		world_building_8011 = {
			model = "model401.png",
			name = "漾濞",
			x = 2005,
			y = 594
		},
		world_building_8012 = {
			model = "model101.png",
			name = "姚安",
			x = 2815,
			y = 717
		},
		world_building_8013 = {
			model = "model401.png",
			name = "银齿",
			x = 2350,
			y = 673
		},
		world_building_8014 = {
			model = "model301.png",
			name = "穿鼻",
			x = 2620,
			y = 870
		},
		world_building_8015 = {
			model = "model101.png",
			name = "朴子",
			x = 2880,
			y = 997
		},
		world_building_8016 = {
			model = "model101.png",
			name = "蒙秦赕",
			x = 973,
			y = 180
		},
		world_building_8017 = {
			model = "worldBuildingChengchi1.png",
			name = "越析诏",
			x = 1232,
			y = 332
		},
		world_building_8018 = {
			model = "model101.png",
			name = "太和",
			x = 1340,
			y = 573
		},
		world_building_8019 = {
			model = "worldBuildingChengchi1.png",
			name = "浪穹诏",
			x = 1717,
			y = 590
		},
		world_building_8020 = {
			model = "model101.png",
			name = "永昌",
			x = 2067,
			y = 897
		},
		world_building_8021 = {
			model = "worldBuildingChengchi1.png",
			name = "邆赕诏",
			x = 2401,
			y = 962
		},
		world_building_8022 = {
			model = "model101.png",
			name = "浪加萌",
			x = 2757,
			y = 1277
		},
		world_building_8023 = {
			model = "model602.png",
			name = "施浪诏",
			x = 830,
			y = 420
		},
		world_building_8024 = {
			model = "model602.png",
			name = "蒙舍诏",
			x = 1623,
			y = 832
		},
		world_building_8025 = {
			model = "model602.png",
			name = "洱海城",
			x = 2356,
			y = 1186
		},
		world_building_8026 = {
			model = "model305.png",
			name = "羊苴咩",
			x = 442,
			y = 182
		},
		world_building_8027 = {
			model = "model305.png",
			name = "洪卫",
			x = 237,
			y = 427
		},
		world_building_8028 = {
			model = "model101.png",
			name = "望苴",
			x = 536,
			y = 536
		},
		world_building_8029 = {
			model = "model305.png",
			name = "裸形",
			x = 787,
			y = 740
		},
		world_building_8030 = {
			model = "model101.png",
			name = "于浪",
			x = 1187,
			y = 822
		},
		world_building_8031 = {
			model = "model101.png",
			name = "弄栋",
			x = 1460,
			y = 1085
		},
		world_building_8032 = {
			model = "model301.png",
			name = "迪庆",
			x = 1990,
			y = 1150
		},
		world_building_8033 = {
			model = "model101.png",
			name = "思茅",
			x = 2240,
			y = 1397
		},
		world_building_8034 = {
			model = "model305.png",
			name = "白崖",
			x = 2592,
			y = 1490
		},
		world_building_8035 = {
			model = "model101.png",
			name = "会川",
			x = 166,
			y = 744
		},
		world_building_8036 = {
			model = "worldBuildingChengchi1.png",
			name = "邆川城",
			x = 462,
			y = 762
		},
		world_building_8037 = {
			model = "worldBuildingChengchi1.png",
			name = "龙口城",
			x = 1022,
			y = 1032
		},
		world_building_8038 = {
			model = "model305.png",
			name = "传衮",
			x = 1735,
			y = 1300
		},
		world_building_8039 = {
			model = "worldBuildingChengchi1.png",
			name = "蒙舍城",
			x = 1955,
			y = 1492
		},
		world_building_8040 = {
			model = "model101.png",
			name = "德宏",
			x = 2260,
			y = 1632
		},
		world_building_8041 = {
			model = "model101.png",
			name = "庙街",
			x = 365,
			y = 1047
		},
		world_building_8042 = {
			model = "model401.png",
			name = "望熬",
			x = 655,
			y = 1095
		},
		world_building_8043 = {
			model = "model401.png",
			name = "通海",
			x = 1355,
			y = 1322
		},
		world_building_8044 = {
			model = "model401.png",
			name = "漆齿",
			x = 1690,
			y = 1614
		},
		world_building_8045 = {
			model = "model301.png",
			name = "望外喻",
			x = 985,
			y = 1355
		},
		world_building_8046 = {
			model = "model401.png",
			name = "长裈",
			x = 1285,
			y = 1560
		},
		world_building_8047 = {
			model = "model101.png",
			name = "巍山",
			x = 220,
			y = 1377
		},
		world_building_8048 = {
			model = "model101.png",
			name = "保山",
			x = 640,
			y = 1405
		},
		world_building_8049 = {
			model = "model101.png",
			name = "凤仪",
			x = 922,
			y = 1632
		},
		world_building_8050 = {
			model = "worldBuildingChengchi1.png",
			name = "南诏都",
			x = 492,
			y = 1605
		}
	}
	worldMianzhanConstant.BUILDING_INFO = {
		world_building_133 = {
			model = "worldBuildingGuanqia1.png",
			name = "虎牢关",
			x = 3217,
			y = 1269
		},
		world_building_102 = {
			model = "worldBuildingGuanqia3.png",
			name = "巫峡关",
			x = 2234,
			y = 2053
		},
		world_building_144 = {
			model = "worldBuildingGuanqia2.png",
			name = "赤壁",
			x = 3634,
			y = 2006
		},
		world_building_78 = {
			model = "worldBuildingGuanqia2.png",
			name = "函谷关",
			x = 2032,
			y = 527
		},
		world_building_70 = {
			model = "worldBuildingGuanqia2.png",
			name = "夷陵",
			x = 1937,
			y = 2806
		},
		world_building_189 = {
			model = "worldBuildingGuanqia2.png",
			name = "濡须坞",
			x = 4785,
			y = 1736
		}
	}
end
