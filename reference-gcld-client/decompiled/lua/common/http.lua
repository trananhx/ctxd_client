function getHttp(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = 1

	local function var_1_1()
		var_1_0 = var_1_0 - 1

		getHttp(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	end

	local function var_1_2(arg_3_0)
		smgr.hideModal()

		local var_3_0 = arg_3_0.name == "completed"
		local var_3_1 = arg_3_0.request

		if not var_3_1 then
			log.error("@@ no request : %s", arg_1_0)

			if var_1_0 <= 0 then
				messageBox.error(string.format("请求没有响应！！！"))

				if arg_1_3 then
					arg_1_3()
				end
			else
				var_1_1()
			end

			return
		end

		if not var_3_0 then
			log.error("@@ not completed : %s", arg_1_0)

			if var_1_0 <= 0 then
				messageBox.error(string.format("请求失败,错误信息 [%s] %s", var_3_1:getErrorCode(), var_3_1:getErrorMessage()))

				if arg_1_3 then
					arg_1_3()
				end
			else
				var_1_1()
			end

			return
		end

		local var_3_2 = var_3_1:getResponseStatusCode()

		if var_3_2 ~= 200 then
			log.error("@@ status error : %s => %s", var_3_2, arg_1_0)

			if var_1_0 <= 0 then
				messageBox.error(string.format("请求错误， 错误码[%s]", var_3_2))

				if arg_1_3 then
					arg_1_3()
				end
			else
				var_1_1()
			end

			return
		end

		arg_1_1(arg_1_0, var_3_1)
	end

	if arg_1_2 and arg_1_2 == "post" then
		arg_1_2 = kCCHTTPRequestMethodPOST
	else
		arg_1_2 = kCCHTTPRequestMethodGET
	end

	log.info("[http][send] %s", arg_1_0)

	local var_1_3 = CCHttpClient:createHttpRequestWithoutStart(var_1_2, arg_1_0, arg_1_2)

	var_1_3:setAcceptEncoding(kCCHTTPRequestAcceptEncodingGzip)
	var_1_3:start()
	smgr.showModal(5)
end
