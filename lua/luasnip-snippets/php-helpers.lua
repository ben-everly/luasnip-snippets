local Helper = {}

function Helper.getComposerFile()
    local dir = vim.fn.split(vim.fn.expand('%:p'), '/')
    while #dir > 0 do
        table.remove(dir)
        local path = '/' .. table.concat(dir, '/') .. '/composer.json'
        if vim.fn.filereadable(path) == 1 then
            return path
        end
    end
    return nil
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

return Helper
