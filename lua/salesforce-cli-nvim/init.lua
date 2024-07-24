-- salesforce-cli-nvim/init.lua
local M = {}

SF_CLI_Buf = nil

function M.log_error(msg)
	local log_file = "/tmp/salesforce-cli-nvim-error.log"
	local f = io.open(log_file, "a")
	f:write(msg .. "\n")
	f:close()
end

function M.run_command(cmd, callback)
	local handle = io.popen(cmd)
	local result = handle:read("*a")
	handle:close()
	callback(result)
end

-- Function to run shell commands in the SF_CLI buffer with an optional callback
function M.open_terminal(cmd, on_exit)
	if SF_CLI_Buf == nil or not vim.api.nvim_buf_is_valid(SF_CLI_Buf) then
		-- Create a new buffer and store the ID in SF_CLI_Buf
		SF_CLI_Buf = vim.api.nvim_create_buf(true, true)
		vim.api.nvim_set_current_buf(SF_CLI_Buf)
	else
		vim.api.nvim_set_current_buf(SF_CLI_Buf)
		-- Reset the modified flag before running termopen again
		vim.api.nvim_set_option_value("modified", false, { buf = SF_CLI_Buf })
	end
	-- Run the command in SF_CLI_Buf since it is the current buffer
	vim.fn.termopen(cmd, {
		on_exit = function(_, exit_code, _)
			if exit_code == 0 and on_exit then
				on_exit()
			end
		end,
	})
end

return M
