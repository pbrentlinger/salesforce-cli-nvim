local M = {}

function M.setup()
	opts = opts or {}

	vim.keymap.set("n", "<leader>h", function()
		if opts.name then
			print("Hello, " .. opts.name)
		else
			print("Hello, Beep!")
		end
	end)
end

return M
