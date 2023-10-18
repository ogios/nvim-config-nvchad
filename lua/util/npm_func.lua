local M = {}

M.read_json_file = function(filename)
  local Path = require "plenary.path"

  local path = Path:new(filename)
  if not path:exists() then
    return nil
  end

  local json_contents = path:read()
  local json = vim.fn.json_decode(json_contents)

  return json
end

M.read_package_json = function()
  return M.read_json_file "package.json"
end

M.is_npm_package_installed = function(package)
  local package_json = M.read_package_json()
  if not package_json then
    return false
  end

  if package_json.dependencies and package_json.dependencies[package] then
    return true
  end

  if package_json.devDependencies and package_json.devDependencies[package] then
    return true
  end

  return false
end

return M
