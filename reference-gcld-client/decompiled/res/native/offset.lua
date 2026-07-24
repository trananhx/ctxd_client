local var_0_0 = {}

function var_0_0.get(arg_1_0)
	local var_1_0 = true
	local var_1_1 = var_0_0

	for iter_1_0 in string.gmatch(arg_1_0, "%w+") do
		if var_1_1[iter_1_0] == nil then
			var_1_0 = false

			break
		else
			var_1_1 = var_1_1[iter_1_0]
		end
	end

	if var_1_0 then
		return var_1_1
	else
		return {}
	end
end

var_0_0.layer = {}
var_0_0.layer.activity = {
	ancientCastle = {
		ancientCastleTab = {
			tagFntSize = -8
		}
	},
	sevenCatch = {
		sevenCatchTab = {
			lefttimeFntSize = -6,
			tipsBtnFntSize = -6,
			timeLeftY = -20,
			tipsFntSize = -4,
			tipOffsetY = -370,
			tipOffsetX = 95
		}
	},
	newGems = {
		newGemsTab = {
			gainGemLvlX = 450,
			timeLeftY = -25,
			remainSmashCntX = 110,
			collectBtnFntSize = -8,
			smashAbandonFntSize = -8
		}
	},
	newGemRotary = {
		newGemRotaryTab = {
			timeLeftY = -25,
			freeDescFntSize = -6
		}
	},
	superGemRotary = {
		superGemRotaryTab = {
			timeLeftY = -25,
			freeDescFntSize = -6
		}
	},
	furnace = {
		furnaceTab = {
			timeLeftY = -25
		}
	},
	goldActivity = {
		goldActivityTab = {
			timeLeftX = 100,
			descLabel1X = 40,
			nextGoldX = -30,
			titleScale = 0.75,
			descLabelScale = 0.7,
			rechargeFntSize = -6
		}
	},
	jingLian = {
		jingLianTab = {
			timeLeftX = 100,
			skillNodeY = 35
		}
	},
	tianDeng = {
		tianDengTab = {
			timeLeftX = 120,
			tdxy_wordX = -60,
			timeLeftSz = -10
		}
	},
	newMidAutumn = {
		newMidAutumnTab = {
			timeLeftX = 80,
			descLabelFntSize = -5
		}
	},
	GemBonus = {
		GemBonusTab = {
			timeLeftY = -30,
			infoFntSize = -4
		}
	},
	consumeGift = {
		titleFntSize = -10,
		titleOffsetX = 30,
		consumeFntSize = -5
	},
	newSword = {
		tipLabelOffsetY = 10,
		timeLabelOffsetY = -25,
		bossKilledOffsetX = -52,
		npcTipFntSize = -7,
		tipLabelOffsetX = -170,
		tipFrameOffsetX = 100
	},
	horseRacing = {
		horseOffsetX_3 = 44,
		horseOffsetX_5 = 98,
		horseOffsetX_2 = 27,
		horseOffsetX_6 = 110,
		horseOffsetX_1 = 12,
		remainTimesFntSize = -5,
		horseOffsetX_4 = 70
	},
	ironMountain = {
		leftTimesFntSize = -5,
		rewardOffsetX = 10,
		info_rewardFont = -5
	},
	silkshop = {
		nextGoldOffsetY = 8,
		Text_2OffsetX = 85,
		Text_1FntSize = -6
	},
	IronSell = {
		chongzhiGoldNumOffsetX = -92
	},
	qaActivity = {
		beginPanelFontSize = -4
	},
	generalReward = {
		meijiuLabelFntSize = -2,
		meijiuSpriteOffsetY = -5,
		lefttimeOffsetX = 50
	},
	HeroDrink = {
		HeroDrinkTab = {
			cdTiemOffsetx = -44,
			gouOffsetX = -70,
			lefttimeOffsetX = 90
		}
	},
	MulNation = {
		leftTimeOffsetX = 40,
		inviteFntSize = -5,
		rewardTipsOffsetX = -30
	},
	BuildNationRush = {
		spriteScale = -0.2
	},
	dragonBoat = {
		tipFrameWidth = 45
	},
	generalReward = {
		lefttimeOffsetX = 50
	},
	SeaSilk = {
		lefttimeOffsetX = 70
	},
	silkCard = {
		cardNumFntSize = -5
	},
	gangMine = {
		forgeFntSize = -5
	}
}
var_0_0.layer.nation = {
	menuTagFntSize = -6,
	nationTab = {
		jiWangChaoLabelScale = 0.6,
		tryBtnFntSize = -7,
		upgradeBtnFntSize = -7,
		titleLevelDigitX = 100,
		titleLevelFntX = -100,
		fqBtnSize = -9,
		changeNationName = {
			editBoxWidth = 40,
			inputPromptLabelSize = -2
		}
	},
	buildNation = {
		jiangguodaye = {
			buildNationMain = {
				prepare = {
					choubeiDetailFntSize = -4
				}
			}
		},
		Feast = {
			btn_congratulate_h = 12,
			btn_congratulate_w = 89
		}
	}
}
var_0_0.layer.kfsy = {
	lvBuLayer = {
		buyBtnSize = -5,
		consumeLabelSize = -10
	},
	backgroundLayer = {
		djjrBtnWidth = 252,
		djjrBtnHeight = 87
	}
}
var_0_0.layer.kfyz = {
	yuyue = {
		featOffsetX = 60,
		rankListCellNameSize = -5,
		serverLabelSize = -10
	},
	invest = {
		investBtnFntSize = -9,
		info2FntSize = -7,
		rewardDescSize = -7,
		rewardTipFntSize = -9,
		descSize = -5
	},
	task = {
		mineX = -20,
		rewardsX = 140,
		frdX = 0,
		mineY = -10,
		frdY = 12
	},
	indivTask = {
		goalRewardLabelSize = -6,
		zhengZhanRewardNodeScale = 0.7,
		condLabelSize = -6
	},
	junku = {
		cardLabelSize = -4
	}
}
var_0_0.layer.resource = {
	tagFntSz = -2,
	blacksmith = {
		nameScale = 0.6,
		infoFntSize = -4,
		starFntSize = -4
	},
	silkRoad = {
		chioceBtnFntSize = -4,
		dialogFntSize = -2
	},
	silkSell = {
		infoFntSize = -5,
		sellSilkFntSize = -8,
		cellLabelSz = -5
	}
}
var_0_0.layer.resource2 = {
	slaveNumFntSize = -3
}
var_0_0.layer.silk = {
	introLayer = {
		btnCheckX = -50,
		btnCheckY = -50
	}
}
var_0_0.layer.kfyzWorld = {
	menuLayer = {
		btnWidth = 102,
		btnHeight = 92
	}
}
var_0_0.layer.general = {
	tavernPanel = {
		checkBoxOffsetX = 25
	}
}
var_0_0.layer.world = {
	ui = {
		peopleTotalNumOffsetX = 13,
		peopeNameOffsetX = -5,
		slaughterCDTimeOffsetX = -30,
		silkPowerBtnFntSz = -3
	},
	eventPannel = {
		cityEventPanel = {
			fntSize = -6
		},
		playerEventPanel = {}
	},
	cityWindow2 = {
		explainFntSz = -4
	},
	autoBattleNew = {
		titleBattleFntSize = -6,
		titleFntSize = -10,
		titleX = -40
	}
}
var_0_0.layer.weaponTab = {
	diamond = {
		weaponTipOffsetX = {
			20,
			25,
			28,
			35,
			28,
			50
		},
		godWeaponTipOffsetX = {
			37,
			58,
			45
		}
	}
}
var_0_0.layer.saotao = {
	celebrateSlaughter = {
		titleFntSize = 16
	}
}
var_0_0.layer.threeColorBag = {
	tipPreferedSize = 140,
	tipOffsetX = -240
}
var_0_0.layer.rankInfo = {
	dailyFeat = {
		restoreLabelOffsetX = 52
	},
	workerList = {
		rankNumFntSize = -3
	}
}
var_0_0.layer.technology = {
	buildTech = {
		changeLabelFntSize = -3,
		expLabelOffsetX = 20
	}
}

return var_0_0
