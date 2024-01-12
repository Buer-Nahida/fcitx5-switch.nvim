local M = {}
local fcitx5_state

function M.setup()
	vim.api.nvim_create_autocmd("InsertLeave", {
		pattern = "*",
		callback = function()
			fcitx5_state = vim.fn.system("fcitx5-remote")
			if fcitx5_state == "2\n" then
				os.execute("fcitx5-remote -c")
			end
		end,
	})

	vim.api.nvim_create_autocmd("InsertEnter", {
		pattern = "*",
		callback = function()
			if fcitx5_state == "2\n" then
				os.execute("fcitx5-remote -o")
			end
		end,
	})
end

return M
