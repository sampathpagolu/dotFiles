-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
---vim.cmd [[packadd packer.nvim]]


local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()



return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- use({
    --     'folke/tokyonight.nvim',
    --     as = 'tokyonight',
    --     config = function()
    --         vim.cmd('colorscheme tokyonight')
    --     end
    -- })
     use({
         'morhetz/gruvbox',
         as = 'gruvbox',
         config = function()
             vim.cmd('colorschem gruvbox')
         end
     })
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use {
            'ThePrimeagen/harpoon',
            branch = "harpoon2",
            requires = {
                'nvim-lua/plenary.nvim',
                'nvim-lua/popup.nvim'
            }
        }
    use('nvim-treesitter/playground')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    -- use('github/copilot.vim')
    use { "sitiom/nvim-numbertoggle" }
    use("neovim/nvim-lspconfig")
    use('towolf/vim-helm')
   -- use {
   --     'CopilotC-Nvim/CopilotChat.nvim',
   --     branch = "canary",
   --     requires = {
   --         'nvim-lua/plenary.nvim',
   --         'github/copilot.vim'
   --     }
   -- }

   use {
       'nvim-tree/nvim-tree.lua',
   }
   use {
       'VonHeikemen/lsp-zero.nvim',
       branch = 'v3.x',
       requires = {
           --- Uncomment these if you want to manage LSP servers from neovim
           -- {'williamboman/mason.nvim'},
           -- {'williamboman/mason-lspconfig.nvim'},

           -- LSP Support
           { 'neovim/nvim-lspconfig' },
           -- Autocompletion
           { 'hrsh7th/nvim-cmp' },
           { 'hrsh7th/cmp-nvim-lsp' },
           { 'L3MON4D3/LuaSnip' },
       }
   }
   use('mfussenegger/nvim-dap')
   use('leoluz/nvim-dap-go')
   use('m4xshen/autoclose.nvim')
   --use({'ckipp01/nvim-jenkinsfile-linter', requires = { "nvim-lua/plenary.nvim" } })

   if packer_bootstrap then
       require('packer').sync()
   end
end)
