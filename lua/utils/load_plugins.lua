local M = {}

function M.load_plugins(plugins_table, dir)
    local handle = vim.loop.fs_scandir(dir)
    if handle then
        while true do
            local name, _ = vim.loop.fs_scandir_next(handle)
            if not name then break end
            if name:match("%.lua$") then
                local plugin_name = name:gsub("%.lua$", "")
                table.insert(plugins_table, require(dir .. '.' .. plugin_name))
            end
        end
    end
end

return M
