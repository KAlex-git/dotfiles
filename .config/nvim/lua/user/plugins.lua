local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

local function is_enabled(plugin)
  return plugin.enabled
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

  use 'wbthomason/packer.nvim'
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "akinsho/bufferline.nvim" })
	use({ "moll/vim-bbye" })
	use({ "nvim-lualine/lualine.nvim", config = "require'user/lualine'" })
  use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
    require("toggleterm").setup()
  end}
  -- terminal
  --use({ "NvChad/nvterm", config = "require'user/nvterm'" })
  --

	use({ "ahmedkhalf/project.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "goolord/alpha-nvim" })
	use("folke/which-key.nvim")

	-- Colorschemes
	use({ "folke/tokyonight.nvim" })
	use("lunarvim/darkplus.nvim")

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })


	-- snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets", config = "require'user/friendly-snippets'" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer" }) -- simple to use language server installer
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters

	-- Telescope
--	use({ "nvim-telescope/telescope.nvim" })

  -- Tree-Sitter
  use({
    'nvim-treesitter/nvim-treesitter',
    --event = 'BufWinEnter',
    -- run = ':TSUpdate',
    --disable = not is_enabled('treesitter'),
    --config = "require'treesitter'"
  })

  use {
    'RRethy/nvim-treesitter-textsubjects',
    --disable = not is_enabled('treesitter'),
    after = 'nvim-treesitter'
  }

	-- Git
	use({ "lewis6991/gitsigns.nvim" })
  use({ "norcalli/nvim-colorizer.lua", config = "require'user/colorizer'" })


  -- Даже если включена русская раскладка vim команды будут работать
  use 'powerman/vim-plugin-ruscmd'

  -- use 'lervag/vimtex'
  use 'wincent/corpus'            -- Заметки...аналог vimwiki
  use 'junegunn/goyo.vim'
  use 'reedes/vim-pencil'         -- Writer

  use({ "chentoast/marks.nvim", config = "require'user/mark'" }) -- Previewer mark on left colomn

 use {
  "rinx/nvim-ripgrep",
  config = function()
    require("nvim-ripgrep").setup {
        -- your configurations here
    }
  end
  }

  use {
    "lazytanuki/nvim-mapper",
    config = function() require("nvim-mapper").setup{} end
   }

  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      config = function() require("telescope").load_extension("mapper") end
  }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

