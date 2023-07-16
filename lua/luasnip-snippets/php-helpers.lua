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

return Helper
