-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'junegunn/fzf'

  -- use 'IrwantoCia/bacod.nvim'
  use({
    'nvim-telescope/telescope.nvim', branch = 'master', --tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } },
  })

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    config = function()
      require('telescope').setup {
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          }
        }
      }
      require('telescope').load_extension('fzf')
    end
  }

  use({ "smartpde/telescope-recent-files", config = function()
    require("telescope").setup {
      defaults = {
        -- Your regular Telescope's options.
      },
      extensions = {
        recent_files = {
          -- This extension's options, see below.
          only_cwd = true
        }
      }
    }
    require("telescope").load_extension("recent_files")
  end
  })

  -- theme start
  use { 'kartikp10/noctis.nvim', requires = { 'rktjmp/lush.nvim' } }
  -- theme end

  -- database
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui'
  use 'kristijanhusak/vim-dadbod-completion'

  -- aider
  -- use 'joshuavial/aider.nvim'

  -- debugging
  use 'leoluz/nvim-dap-go'
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'folke/neodev.nvim'
  use { "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } }
  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  }

  use('github/copilot.vim')

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use('mbbill/undotree')

  -- git
  use('tpope/vim-fugitive')
  use('ray-x/lsp_signature.nvim')
  use('f-person/git-blame.nvim')

  use { 'ThePrimeagen/harpoon',
    config = function()
      require("harpoon").setup { menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      }
      }
    end
  }

  -- chatgpt
  -- use({
  --   "dpayne/CodeGPT.nvim",
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --   },
  --   config = function()
  --     require("codegpt.config")
  --   end
  -- })
  -- lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  -- local plugins
  -- use("/home/buggy/Documents/personal/bacod.nvim")

end)
