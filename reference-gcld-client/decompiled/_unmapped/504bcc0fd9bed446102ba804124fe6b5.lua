local var_0_0 = {
	bg_1 = {
		name = "bg_1",
		type = "pic",
		z = 1,
		pic = "res/ui/world/nationChallenges/task_challenge_btn_view.png",
		x = visibleSize.width - 50 - platform.getSafeDistance(),
		y = visibleSize.height - 180,
		children = {
			{
				x = 38,
				name = "ring_process_1",
				y = 38,
				type = "process",
				barType = "clock",
				pic = "res/ui/world/nationChallenges/task_challenge_btn_con.png"
			},
			{
				x = 38,
				name = "ring_complete_1",
				y = 38,
				type = "pic",
				pic = "res/ui/world/nationChallenges/task_challenge_btn_con_2.png"
			},
			{
				x = 38,
				name = "ring_click_1",
				y = 38,
				type = "pic",
				pic = "res/ui/world/nationChallenges/task_challenge_btn_lig.png"
			},
			{
				x = 38,
				name = "name_1",
				y = 38,
				type = "pic",
				pic = ""
			},
			{
				x = 36,
				name = "name_indiv",
				y = 32,
				type = "pic",
				z = 200,
				visible = false,
				pic = "res/ui/nationTask/newPic/gzzl_task_zl.png"
			}
		}
	},
	bg_2 = {
		name = "bg_2",
		type = "pic",
		z = 1,
		pic = "res/ui/world/nationChallenges/task_challenge_btn_view.png",
		x = visibleSize.width - 50 - platform.getSafeDistance(),
		y = visibleSize.height - 265,
		children = {
			{
				x = 38,
				name = "ring_process_2",
				y = 38,
				type = "process",
				barType = "clock",
				pic = "res/ui/world/nationChallenges/task_challenge_btn_con.png"
			},
			{
				x = 38,
				name = "ring_complete_2",
				y = 38,
				type = "pic",
				pic = "res/ui/world/nationChallenges/task_challenge_btn_con_2.png"
			},
			{
				x = 38,
				name = "ring_click_2",
				y = 38,
				type = "pic",
				pic = "res/ui/world/nationChallenges/task_challenge_btn_lig.png"
			},
			{
				x = 38,
				name = "name_2",
				y = 38,
				type = "pic",
				pic = ""
			}
		}
	},
	bg_3 = {
		name = "bg_3",
		type = "pic",
		z = 1,
		pic = "res/ui/world/nationChallenges/task_challenge_btn_view.png",
		x = visibleSize.width - 50 - platform.getSafeDistance(),
		y = visibleSize.height - 350,
		children = {
			{
				x = 38,
				name = "ring_process_3",
				y = 38,
				type = "process",
				barType = "clock",
				pic = "res/ui/world/nationChallenges/task_challenge_btn_con.png"
			},
			{
				x = 38,
				name = "ring_complete_3",
				y = 38,
				type = "pic",
				pic = "res/ui/world/nationChallenges/task_challenge_btn_con_2.png"
			},
			{
				x = 38,
				name = "ring_click_3",
				y = 38,
				type = "pic",
				pic = "res/ui/world/nationChallenges/task_challenge_btn_lig.png"
			},
			{
				x = 38,
				name = "name_3",
				y = 38,
				type = "pic",
				pic = ""
			}
		}
	}
}

function getNationChallengesData()
	return var_0_0
end
