local sf_cli = require("salesforce-cli-nvim")

local function deploy_current_file()
	local file = vim.fn.expand("%:p")
	sf_cli.open_terminal("sfdx force:source:deploy -p " .. file)
end

return {
	deploy_current_file = deploy_current_file,
}
