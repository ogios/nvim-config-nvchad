local pattern = "custom_runner_"

function closeRunner(bufname)
  bufname = bufname or pattern .. vim.fn.expand("%:t:r")
  local current_buf = vim.fn.bufname("%")
  if string.find(current_buf, pattern) then
    vim.cmd("bwipeout!")
  else
    local bufid = vim.fn.bufnr(bufname)
    if bufid ~= -1 then
      vim.cmd("bwipeout!" .. bufid)
    end
  end
end

local M = {
  is_disabled = function(client)
    return require("neoconf").get(client .. ".disable")
  end,

  run_command = function(command, name)
    local set_bufname = "file " .. name
    local prefix = "bot 12 new"
    closeRunner(name)
    vim.cmd(prefix)
    vim.fn.termopen(command)
    vim.cmd("norm G")
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.cmd(set_bufname)
    vim.bo.buflisted = false
  end,
}

return M
