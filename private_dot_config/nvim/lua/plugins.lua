-- [[ plugins.lua ]]

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- packer.nvim (plugin manager)
    use 'wbthomason/packer.nvim'

    -- impatient
    use 'lewis6991/impatient.nvim'

    -- nvim-tree (file explorer)
    use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }

    -- beacon (cursor jump indicator)
    use { 'DanilaMihailov/beacon.nvim' }

    -- lualine (statusline)
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

    -- telescope (fuzzy-find files)
    use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }

    -- GV (commit history browser)
    use { 'junegunn/gv.vim', requires = { 'tpope/vim-fugitive' } }

    -- autopairs (auto-close brackets, parentheses, etc)
    use { 'windwp/nvim-autopairs' }

    -- mkdir
    use 'jghauser/mkdir.nvim'

    -- treesitter
    use { 
            'nvim-treesitter/nvim-treesitter', 
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,
        }

    -- lsp & lsp tool management
    use { 'neovim/nvim-lspconfig', 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' }

    -- theme
    -- use 'navarasu/onedark.nvim'
    -- use 'RRethy/nvim-base16'
    use 'folke/tokyonight.nvim'

end
)
