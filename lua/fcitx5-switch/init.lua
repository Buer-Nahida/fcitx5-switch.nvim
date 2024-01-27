local M = {}
local fcitx5_state

---@class fcitx5-switch.opts
---@field recover boolean
---@param opts fcitx5-switch.opts
function M.setup(opts)
  if opts.recover == false then
    vim.api.nvim_create_autocmd("InsertLeave", {
      pattern = "*",
      callback = function()
        if vim.fn.system("fcitx5-remote") == "2\n" then
          os.execute("fcitx5-remote -c")
        end
      end,
    })
  else
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
end

return M
