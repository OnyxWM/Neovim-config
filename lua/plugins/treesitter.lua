return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "gbprod/php-enhanced-treesitter.nvim",
            "JoosepAlviste/nvim-ts-context-commentstring"
        },
    config = function()
        -- Explicit language parsers to install
        local parsers_to_install = {
            "php", "blade", "html", "lua", 
            "javascript", "typescript", "css"
        }

        -- Treesitter configuration
        require("nvim-treesitter.configs").setup({
            -- Ensure these parsers are installed
            ensure_installed = parsers_to_install,
            
            -- Enable syntax highlighting
            highlight = {
                enable = true,
                -- Use additional regex highlighting for these filetypes
                additional_vim_regex_highlighting = { 
                    "php", "blade", "html" 
                }
            },
            
            -- Enable indentation
            indent = { enable = true },
            
            -- Context-aware commenting
            context_commentstring = {
                enable = true,
                enable_autocmd = false
            }
        })

        -- Manual parser installation
        local parsers = require("nvim-treesitter.parsers")
        for _, parser in ipairs(parsers_to_install) do
            if not parsers.has_parser(parser) then
                vim.cmd("TSInstallSync " .. parser)
            end
        end

        -- Blade-specific configuration
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.blade = {
            install_info = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = "blade",
        }
    end,
    
    -- Additional Blade support
    {
        "jwalton512/vim-blade",
        ft = "blade"
    }
}}

