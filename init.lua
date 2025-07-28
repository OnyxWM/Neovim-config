vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.signcolumn = "yes"
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.g.mapleader = " "
vim.o.winborder = "rounded"

vim.keymap.set('n', "<leader>o", ':update<CR> :source<CR>')
vim.keymap.set('n', "<leader>w", ':write<CR>')
vim.keymap.set('n', "<leader>q", ':quit<CR>')

vim.pack.add({
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", build = 'make' },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },
    { src = "https://github.com/MunifTanjim/nui.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/saghen/blink.cmp", version = 'v1.3.1' },

})
require('blink.cmp').setup({
    keymap = { preset = 'default' },
    appearance = {
        nerd_font_variant = 'normal'
    },
    completion = { documentation = { auto_show = false } },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = {
        implementation = "lua",
    },
})

local capabilities = require('blink.cmp').get_lsp_capabilities()

vim.lsp.enable({ "lua_ls", "html", "phpactor" })
vim.lsp.config('lua_ls', {
    capabilities = capabilities,
})
vim.lsp.config('html', {
    capabilities = capabilities,
})
vim.lsp.config('phpactor', {
    capabilities = capabilities,
})

vim.keymap.set('n', "<leader>lf", vim.lsp.buf.format)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

vim.cmd("colorscheme tokyonight")
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'tokyonight'
    }
}

require('nvim-treesitter.configs').setup {
    ensured_installed = { "lua", "vim" },
    auto_install = false,
    highlight = {
        enable = true
    }
}

require("neo-tree").setup({})

vim.keymap.set('n', "<leader>fd", require('telescope.builtin').find_files)
vim.keymap.set('n', "<leader>fh", require('telescope.builtin').help_tags)
vim.keymap.set('n', "<leader>ff", ':Neotree<CR>')
