local M = {}

local function deepcopy(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == "table" then
    copy = {}
    for orig_key, orig_value in next, orig, nil do
      copy[deepcopy(orig_key)] = deepcopy(orig_value)
    end
    setmetatable(copy, deepcopy(getmetatable(orig)))
  else -- number, string, boolean, etc
    copy = orig
  end
  return copy
end

local function GetRootDir()
  local filetype = vim.bo.filetype
  local lsps = vim.lsp.get_active_clients()
  if lsps and next(lsps) ~= nil then
    for _, client in ipairs(lsps) do
      local filetypes = client.config.filetypes
      if filetypes and vim.tbl_contains(filetypes, filetype) then
        return client.config.root_dir
      end
    end
  end
  vim.notify("No `lsp` found or no `root_dir` set")
  return nil
end


M.deepcopy = deepcopy
M.GetRootDir = GetRootDir


return M
