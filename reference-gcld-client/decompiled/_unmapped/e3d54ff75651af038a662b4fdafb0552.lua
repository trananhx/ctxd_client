incenseLink.control = {}
incenseLink.data = {}

function incenseLink.control.click_incenseLink()
	smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
	require("lua/layer/resource/ui")
	resourceUI.show(1)
end
