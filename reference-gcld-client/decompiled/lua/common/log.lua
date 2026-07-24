log = {}
log.ALL = -1
log.DEBUG = 0
log.INFO = 1
log.WARN = 2
log.ERROR = 3
log.FATAL = 4
log.OFF = 5
LOG_LEVEL = 1

local function var_0_0()
	return os.date("%Y-%m-%d %H:%M:%S")
end

function log.debug(...)
	if LOG_LEVEL > log.DEBUG then
		return
	end

	local var_2_0 = select(1, ...)

	if type(var_2_0) == "string" and string.find(var_2_0, "%%") then
		print(var_0_0() .. "[DEBUG]" .. string.format(...))
	else
		local var_2_1 = tostring(var_2_0)

		for iter_2_0 = 2, select("#", ...) do
			var_2_1 = var_2_1 .. "\t" .. tostring(select(iter_2_0, ...))
		end

		print(var_0_0() .. "[DEBUG]" .. var_2_1)
	end
end

function log.info(...)
	if LOG_LEVEL > log.INFO then
		return
	end

	local var_3_0 = select(1, ...)
	local var_3_1 = select("#", ...)

	if type(var_3_0) == "string" and string.find(var_3_0, "%%") and var_3_1 > 1 then
		print(var_0_0() .. "[INFO]" .. string.format(...))
	else
		local var_3_2 = tostring(var_3_0)

		for iter_3_0 = 2, select("#", ...) do
			var_3_2 = var_3_2 .. "\t" .. tostring(select(iter_3_0, ...))
		end

		print(var_0_0() .. "[INFO]" .. var_3_2)
	end
end

function log.print(...)
	if LOG_LEVEL > log.INFO then
		return
	end

	local var_4_0 = select(1, ...)
	local var_4_1 = tostring(var_4_0)

	for iter_4_0 = 2, select("#", ...) do
		var_4_1 = var_4_1 .. "\t" .. tostring(select(iter_4_0, ...))
	end

	print(var_0_0() .. "[INFO]" .. var_4_1)
end

function log.warn(...)
	if LOG_LEVEL > log.WARN then
		return
	end

	local var_5_0 = select(1, ...)

	if type(var_5_0) == "string" and string.find(var_5_0, "%%") then
		print(var_0_0() .. "[WARN]" .. string.format(...))
	else
		local var_5_1 = tostring(var_5_0)

		for iter_5_0 = 2, select("#", ...) do
			var_5_1 = var_5_1 .. "\t" .. tostring(select(iter_5_0, ...))
		end

		print(var_0_0() .. "[WARN]" .. var_5_1)
	end
end

function log.error(...)
	if LOG_LEVEL > log.ERROR then
		return
	end

	local var_6_0 = CCFileUtils:sharedFileUtils():getWritablePath() .. "game.log"
	local var_6_1 = select(1, ...)
	local var_6_2 = io.open(var_6_0, "a")

	if type(var_6_1) == "string" and string.find(var_6_1, "%%") then
		print(var_0_0() .. "[ERROR]" .. string.format(...))
		var_6_2:write(var_0_0() .. "[ERROR]" .. string.format(...) .. "\n")
	else
		local var_6_3 = tostring(var_6_1)

		for iter_6_0 = 2, select("#", ...) do
			var_6_3 = var_6_3 .. "\t" .. tostring(select(iter_6_0, ...))
		end

		print(var_0_0() .. "[ERROR]" .. var_6_3)
		var_6_2:write(var_0_0() .. "[ERROR]" .. var_6_3 .. "\n")
	end

	var_6_2:close()
end

function log.fatal(...)
	if LOG_LEVEL > log.FATAL then
		return
	end

	local var_7_0 = select(1, ...)

	if type(var_7_0) == "string" and string.find(var_7_0, "%%") then
		print(var_0_0() .. "[FATAL]" .. string.format(...))
	else
		local var_7_1 = tostring(var_7_0)

		for iter_7_0 = 2, select("#", ...) do
			var_7_1 = var_7_1 .. "\t" .. tostring(select(iter_7_0, ...))
		end

		print(var_0_0() .. "[FATAL]" .. var_7_1)
	end
end

log.curIndex = 1
log.fileList = {}

function log.writeToFile(arg_8_0)
	if log.curIndex > 5 then
		log.curIndex = 1
	end

	if log.fileList[log.curIndex] == nil then
		log.fileList[log.curIndex] = io.open(CCFileUtils:sharedFileUtils():getWritablePath() .. "interface" .. log.curIndex .. ".log", "w")
	end

	log.fileList[log.curIndex]:seek("set")
	log.fileList[log.curIndex]:write(var_0_0() .. "[Interface](" .. os.clock() .. ")" .. arg_8_0)
	log.fileList[log.curIndex]:flush()

	log.curIndex = log.curIndex + 1
end
