local sf_cli = require("salesforce-cli-nvim")
local org = require("org")

-- Function to fetch and set the default org alias global var
local function fetch_default_org()
	local jq_filter = [[ | jq -r '.result.alias']]
	local cmd = org.query_org .. jq_filter
	sf_cli.run_command(cmd, function(result)
		-- Trim any leading/trailing whitespace or newline characters
		local trimmed_result = result:gsub("^%s+", ""):gsub("%s+$", "")
		-- Check if the result is "null" and treat it as Lua nil
		if trimmed_result == "null" then
			Default_org = nil
		else
			-- Set the global variable
			Default_org = trimmed_result
		end
	end)
end

-- Function to determine lualine color
local function org_color()
	if not Default_org then
		return { bg = nil }
	end
	local org = Default_org:lower()
	if org:find("prod") then
		return { bg = "#FF4B4B" } -- red
	elseif org:find("staging") then
		return { bg = "#FFD20F" } -- orange
	elseif org:find("qa") then
		return { bg = "#F9FF9A" } -- yellow
	else
		return { bg = nil } -- default
	end
end

-- lualine setup
local function setup_lualine()
	if Default_org then
		require("lualine").setup({
			sections = {
				lualine_c = {
					{
						function()
							local filename = vim.fn.expand("%:t")
							local org_info = Default_org or "Not Set"
							return filename .. " | SF-Org:" .. org_info
						end,
						color = org_color,
					},
				},
			},
		})
	else
		require("lualine").setup({
			sections = {
				lualine_c = {
					{
						function()
							local filename = vim.fn.expand("%:t")
							return filename
						end,
					},
				},
			},
		})
	end
end

fetch_default_org()
setup_lualine()
