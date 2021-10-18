local helper = require('helper')

local M = {}

M.plugins = {}

M.package = {
  root = vim.g.vim_cache .. '\\pack\\pm',
  always = 'start',
  lazy = 'opt',
}

M.hosts = {
  {install = 'git clone @url @deploy', update = 'git -C @deploy pull --rebase', pattern = 'https://github.com/([^/]+)/(.+)'}
}

M.setup = function (configs)
  if helper.isdirectory(M.package.root) == false then
    if helper.mkdir(M.package.root) == false then
      return configs
    end
  end

  local errors = {}
  for _, config in ipairs(configs) do
    local config_with_default = {url = '', lazy = false}
    for k, v in pairs(config) do
      config_with_default[k] = v
    end

    local plugin = {}
    for _, host in ipairs(M.hosts) do
      local found = false
      for holder, item in string.gmatch(config_with_default.url, host.pattern) do
        if config_with_default.lazy == true then
          plugin.path = M.package.root .. '\\' .. M.package.lazy .. '\\' .. holder .. '___' .. item
        else
          plugin.path = M.package.root .. '\\' .. M.package.always .. '\\' .. holder .. '___' .. item
        end
        plugin.url = config_with_default.url

        plugin.install = host.install
        plugin.install = string.gsub(plugin.install, '@url', plugin.url)
        plugin.install = string.gsub(plugin.install, '@deploy', plugin.path)

        plugin.update = host.update
        plugin.update = string.gsub(plugin.update, '@url', plugin.url)
        plugin.update = string.gsub(plugin.update, '@deploy', plugin.path)

        found = true
        break
      end

      if found == true then
        break
      end
    end

    if next(plugin) then
      table.insert(M.plugins, plugin)
    else
      table.insert(errors, config)
      print(config_with_default.url .. 'is not supprted')
    end
  end

  return errors
end

M.install = function ()
  local errors = true
  for _, plugin in ipairs(M.plugins) do
    if helper.isdirectory(plugin.path) == true then
      -- already installed
    else
      local code = os.execute(plugin.install)
      if code ~= 0 then
        table.insert(errors, plugin.install)
        print('command failure ' .. plugin.install)
      end
    end
  end

  return errors
end

M.update = function ()
  local errors = {}
  for _, plugin in ipairs(M.plugins) do
    if helper.isdirectory(plugin.path) == true then
      local code = os.execute(plugin.update)
      if code ~= 0 then
        table.insert(errors, plugin.update)
        print('command failure ' .. plugin.update)
      end
    else
      -- not installed
    end
  end

  return errors
end

return M

