statistics = {}
statistics.userId = 0

function statistics.registerUser(arg_1_0, arg_1_1)
	if conf.language == "tw" then
		-- block empty
	end
end

function statistics.userLogin(arg_2_0, arg_2_1)
	if conf.language == "tw" then
		if channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
			log.info("@@ 不统计")
		elseif arg_2_1 then
			log.info("accountID: ", arg_2_1)

			statistics.userId = arg_2_1

			GStatistics:userLogin(arg_2_0, arg_2_1)
		end
	end
end

function statistics.createRole(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	log.info("create role : ", arg_3_0, arg_3_1, arg_3_2, arg_3_3)

	if conf.language == "tw" then
		if channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
			log.info("@@ 不统计")
		else
			arg_3_0 = arg_3_0 or statistics.userId
			arg_3_3 = arg_3_3 or ""
			arg_3_2 = arg_3_2 or ""

			if statistics.userId ~= 0 then
				arg_3_0 = statistics.userId

				GStatistics:createRole(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
			end
		end
	end
end

function statistics.roleLogin(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if conf.language == "tw" then
		if channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
			log.info("@@ 不统计")
		elseif statistics.userId ~= 0 then
			arg_4_0 = statistics.userId

			GStatistics:roleLogin(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
		end
	end
end

function statistics.roleLogout(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	if conf.language == "tw" then
		if channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
			log.info("@@ 不统计")
		elseif statistics.userId ~= 0 then
			arg_5_0 = statistics.userId

			GStatistics:roleLogout(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
		end
	end
end

function statistics.addCash(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	if conf.language == "tw" then
		-- block empty
	end
end

function statistics.shopTrade(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4, arg_7_5, arg_7_6)
	if conf.language == "tw" then
		-- block empty
	end
end

function statistics.customEvent(arg_8_0)
	if conf.language == "tw" then
		if channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
			log.info("@@ 不统计")
		else
			GStatistics:customEvent(arg_8_0)
		end
	end
end
