local sf_cli = require("salesforce-cli-nvim")

local function retrieve_current_file()
	local file = vim.fn.expand("%:p")
	sf_cli.open_terminal("sfdx force:source:retrieve -p " .. file)
end

local function retrieve_all_files()
	local dir = vim.fn.expand("%:p:h")
	sf_cli.open_terminal("sfdx force:source:retrieve -p " .. dir)
end

return {
	retrieve_current_file = retrieve_current_file,
	retrieve_all_files = retrieve_all_files,
}
