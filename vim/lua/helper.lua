local M = {}

M.extract = function (text, pattern)
  if pattern == nil then
    pattern = "[^\n]+"
  end
  local splitted = {}
  for chunk in string.gmatch(text, pattern) do
    table.insert(splitted, chunk)
  end
  return splitted
end

M.execute = function (command)
  local handle = io.popen(command)
  local stdout = handle:read("*a")
  handle:close()
  local result = M.extract(stdout, "[^\n]+")
  return result
end

M.mkdir = function (path)
  local code = os.execute('powershell.exe -Command "New-Item -ItemType Directory -Force ' .. path .. '"')
  if code == 0 then
    return true
  else
    return false
  end
end

M.touch = function (path)
  local code = os.execute('powershell.exe -Command "New-Item -ItemType File -Force ' .. path .. '"')
  if code == 0 then
    return true
  else
    return false
  end
end

M.rm = function (path)
  local code = os.execute('powershell.exe -Command "Remove-Item ' .. path .. '"')
  if code == 0 then
    return true
  else
    return false
  end
end

M.isdirectory = function (path)
  local directory = vim.fn.isdirectory(path)
  if directory == 1 then
    return true
  else
    return false
  end
end

M.filereadable = function (path)
  local readable = vim.fn.filereadable(path)
  if readable == 1 then
    return true
  else
    return false
  end
end

M.executable = function (name)
  local executable = vim.fn.executable(name)
  if executable == 1 then
    return true
  else
    return false
  end
end

return M

