local helper = require('helper')

local function make_resource(package, hosts, url, lazy)
  local resource = {}

  for _, host in ipairs(hosts) do
    for holder, item in string.gmatch(url, host.pattern) do
      if lazy == true then
        resource.path = package.root .. '\\' .. package.lazy .. '\\' .. holder .. '___' .. item
      else
        resource.path = package.root .. '\\' .. package.always .. '\\' .. holder .. '___' .. item
      end
      resource.install = host.install
      resource.update = host.update
      resource.url = url
      break
    end
  end

  return resource
end

local M = {}

M.package = {
  root = vim.g.vim_cache .. '\\pack\\pm',
  always = 'start',
  lazy = 'opt',
  updatable = vim.g.vim_cache .. '\\pack\\pm\\updatable'
}

M.host = {
  {install = 'git clone @url @deploy', update = 'git -C @deploy pull --rebase', pattern = 'https://github.com/([^/]+)/(.+)'}
}

M.install = function (plugins, force)
  if helper.isdirectory(M.package.root) == false then
    if helper.touch(M.package.updatable) == false then
      print('touch failure ' .. M.package.updatable)
      return false
    end
  end

  local updatable = helper.filereadable(M.package.updatable)
  if updatable == true then
    if helper.rm(M.package.updatable) == false then
      print('rm failure ' .. M.package.updatable)
    end
  end

  for _, plugin in ipairs(plugins) do
    local plugin_with_default = {url = '', lazy = false}
    for k, v in pairs(plugin) do
      plugin_with_default[k] = v
    end
    local resource = make_resource(M.package, M.host, plugin_with_default.url, plugin_with_default.lazy)
    if next(resource) then
      local doit = false
      local command = ''

      if helper.isdirectory(resource.path) == true then
        if updatable == true or force == true then
          doit = true
        end
        command = resource.update
      else
        doit = true
        command = resource.install
      end
      command = string.gsub(command, '@url', resource.url)
      command = string.gsub(command, '@deploy', resource.path)

      if doit == true then
        local code = os.execute(command)
        if code ~= 0 then
          print('command failure ' .. command)
        end
      end
    else
      print(plugin_with_default.url .. 'is not supprted')
    end
  end

  return true
end

return M

