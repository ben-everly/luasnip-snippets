local Helper = {}

Helper.projectDir = nil

function Helper.getProjectDir()
    if Helper.projectDir == nil then
        local dir = vim.fn.split(vim.fn.expand('%:p'), '/')
        while #dir > 0 do
            table.remove(dir)
            local path = '/' .. table.concat(dir, '/')
            if vim.fn.filereadable(path .. '/composer.json') == 1 then
                Helper.projectDir = path
            end
        end
    end
    return Helper.projectDir
end

function Helper.getComposerFile()
    local path = Helper.getProjectDir()
    if path == nil then
        return nil
    end
    return path .. '/composer.json'
end

function Helper.getComposerConfig()
    local composerFile = Helper.getComposerFile()
    if composerFile == nil then
        return nil
    end
    return vim.fn.json_decode(table.concat(vim.fn.readfile(composerFile)))
end

function Helper.getAutoloadConfig()
    local config = Helper.getComposerConfig() or {}
    local autoload = {}
    if config['autoload'] and config['autoload']['psr-4'] then
        autoload = config.autoload['psr-4']
    end
    if config['autoload-dev'] and config['autoload-dev']['psr-4'] then
        autoload = vim.tbl_extend('force', autoload, config['autoload-dev']['psr-4'])
    end
    return autoload
end

function Helper.getNamespaceForFile()
    local search = string.gsub(Helper.getProjectDir(), "[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%1") or '' -- escape pattern
    if (search == nil) then
        return nil
    end
    local file = vim.fn.expand('%:p')
    file = string.gsub(file, search, '')
    local matches = {}
    for namespace, path in pairs(Helper.getAutoloadConfig()) do
        if vim.fn.match(file, path) ~= -1 then
            path = string.gsub(path, "[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%1")
            matches[namespace] = string.gsub(file, path, '')
        end
    end

    local shortest = nil
    local shortestNamespace = nil
    for namespace, path in pairs(matches) do
        if shortest == nil or #path < #shortest then
            shortestNamespace = namespace
            shortest = path
        end
    end

    local parts = vim.fn.split(shortest, '/')
    table.remove(parts)
    return shortestNamespace .. table.concat(parts, '\\')
end

return Helper
