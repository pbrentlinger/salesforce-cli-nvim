-- Load core salesforce-cli-nvim module
require("salesforce-cli-nvim")

-- Load command modules
require("org")
-- require("code")
-- require("test")
-- require("debug")
-- require("utility")
-- require("project")
-- require("localdev")
require("statusline.lualine") -- Load lualine setup if you use lualine

-- Setup key mappings or commands
-- ORG COMMANDS
vim.api.nvim_set_keymap(
	"n",
	"<leader>sog",
	':lua require("org").get_current_org()<CR>',
	{ desc = "Get Current Org", noremap = true, silent = true }
)

-- CODE COMMANDS
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<leader>scd",
-- 	':lua require("code").deploy_current_file()<CR>',
-- 	{ desc = "Deploy Current File", noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<leader>scrt",
-- 	':lua require("code").retrieve_current_file()<CR>',
-- 	{ desc = "Retrieve Current File", noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<leader>scra",
-- 	':lua require("code").retrieve_all_files()<CR>',
-- 	{ desc = "Retrieve All Files", noremap = true, silent = true }
-- )
