--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- Packer Sync
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Transparent background
vim.cmd([[augroup user_colors
  autocmd!
  autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
augroup END
]])

-- THEME
vim.cmd('colorscheme tokyonight-night')

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plugins')   -- Plugins

-- PLUGINS
require('impatient')
require('mason').setup()
require('mason-lspconfig').setup{
    ensure_installed = {
        'clangd',
        'cmake',
        'dockerls',
        'elixirls',
        'gopls',
        'jsonls',
        'tsserver',
        'kotlin_language_server',
        'pyright',
        'rust_analyzer',
        'tflint',
    }
}
require('mason-lspconfig').setup_handlers{
    function (server_name)
        require("lspconfig")[server_name].setup {}
    end
}
require('nvim-tree').setup{}
require('lualine').setup{}
require('nvim-autopairs').setup{}
require('nvim-treesitter.configs').setup{
    ensure_installed = { 
        "c", 
        "lua", 
        "rust", 
        "python", 
        "cpp", 
        "c_sharp", 
        "cmake",
        "go",
        "elixir",
        "json",
        "kotlin",
        "scala",
        "java",
        "llvm",
        "yaml",
    },
    auto_install = true,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    }
}
