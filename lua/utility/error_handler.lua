-- utility/error_handler.lua
-- This looks for a
local M = {}

-- Function to handle Salesforce CLI command errors
function M.handle_cli_error(response)
	if response and response.exitCode == 1 then
		local message = response.message or "Unknown error occurred"
		print("Salesforce CLI Error: " .. message)
	else
		print("Command executed successfully or no error response received.")
	end
end

return M
