-- org/init.lua
local sf_cli = require("salesforce-cli-nvim")

local query_org = "sf org display --json"
local get_org_details = "sfdx force:org:list --json"
Project_Domain = nil

local function project_domain()
	-- Retreives the url from json and parses it to get the project domain name
	sf_cli.log_error("\n\n Entering project_domain")

	-- store local copy of json result from query_org
	-- test if staus is 0
	--  if 0 then run jq_filter
	--  else return message

	sf_cli.run_command(query_org, function(result, exitCode)
		if exitCode ~= 0 then
			local error_message = vim.fn.json_decode(result).message or "unknown error"
			sf_cli.log_error("Error: " .. error_message)
			return
		end

		local folder_org_json = vim.fn.json_decode(result)
		local status = folder_org_json.status or "unknown"

		if status == "0" then
			sf_cli.log_error("status is 0")
			local jq_filter =
				[[ | jq -r '.result.username | capture("(?<domain>.*?)@(?<rest>.*)").rest | sub("\\.com.*$"; "")' ]]
			local cmd = query_org .. jq_filter

			sf_cli.run_command(cmd, function(res, exit)
				if exit == 0 then
					Project_Domain = res:gsub("%s*$", "")
					sf_cli.log_error("Project_Domain: " .. Project_Domain)
				else
					sf_cli.log_error("Error: " .. res)
				end
			end)
		else
			local message = folder_org_json.message or "no message"
			sf_cli.log_error("status is not 0" .. message)
		end
	end)
end

-- Function to fetch and set the default org alias global var
local function fetch_default_org()
	local jq_filter = [[ | jq -r '.result.alias']]
	local cmd = query_org .. jq_filter
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

-- Function to pass out to the caller
local function get_current_org()
	local jq_filter =
		[[ | jq -r '.result | {alias, instanceUrl, username} | to_entries | map("\(.key): \(.value)") | .[]']]
	sf_cli.open_terminal(query_org .. jq_filter)
end

-- TODO: let's lazy load these as they are slow... or only call them when we need them
fetch_default_org()
project_domain()

return {
	query_org = query_org,
	get_org_details = get_org_details,
	Project_Domain = Project_Domain,
	get_current_org = get_current_org,
}
