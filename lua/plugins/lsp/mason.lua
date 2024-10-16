return {
    "williamboman/mason.nvim",
    dependencies = { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
    config = function()
        -- setup mason with default properties
        require("mason").setup({
            ui = {
                border = "rounded"
            }
        })
        require("mason-tool-installer").setup({
            ensure_installed = {
                'pylint', 'flake8', 'autopep8', 'mypy', -- PYTHON
                'google-java-format', -- JAVA
            },
            auto_update = false,  
        })
    end,
}
