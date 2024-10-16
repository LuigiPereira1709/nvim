local M = {}

M.lang_map = {
    java = "%.java$",        -- Usa % para escapar o ponto e $ para indicar o final da string
    python = "%.py$",
    c = "%.c$",
    javascript = "%.js$"
}

function M.compile_current_file()
    local filepath = vim.fn.expand("%:p")
    local filename = vim.fn.expand("%:t")
    local name_without_ext = vim.fn.expand("%:t:r")

    local lang = nil
    -- Detect language
    for l, ext in pairs(M.lang_map) do
        if filename:match(ext) then
            lang = l
            break
        end
    end

    if lang == "java" then
        -- Get the first 20 lines as a single string
        local first_20_lines = table.concat(vim.fn.getline(1, 20), "\n")
        local has_main = string.find(first_20_lines, "static%s+void%s+main")
        if has_main then
            vim.cmd("!javac " .. filepath)
        else
            print("This class doesn't have a main method.")
        end
    -- elseif lang == "python" then
    --     command = "python3 " .. filepath
    elseif lang == "c" then
        vim.cmd("!gcc " .. filepath .. " -o " .. name_without_ext)
    -- elseif lang == "javascript" then
    --     vim.cmd("!node " .. filepath .. " &")
    else
        print("Unsupported language: " .. (lang or "unknown"))
    end
end

return M
