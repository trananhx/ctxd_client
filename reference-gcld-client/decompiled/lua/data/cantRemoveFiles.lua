fileWhiteList = {
	"cookies.txt",
	"UserDefault.xml"
}

function checkFileInWhiteList(arg_1_0)
	for iter_1_0, iter_1_1 in pairs(fileWhiteList) do
		if iter_1_1 == arg_1_0 then
			return true
		end
	end

	return false
end
