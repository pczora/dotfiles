return {
  "folke/which-key.nvim",
  "christoomey/vim-tmux-navigator",
  "tpope/vim-surround",
  "tpope/vim-unimpaired",
  "ggandor/leap.nvim",
  "tpope/vim-repeat",
  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes",
  "godlygeek/tabular",
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  "akinsho/bufferline.nvim",
  "editorconfig/editorconfig-vim",
  "plasticboy/vim-markdown",
  "windwp/nvim-autopairs",
  "nvim-lua/plenary.nvim",
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 'nvim-telescope/telescope-fzf-native.nvim',
                                                  build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
  { "nvim-treesitter/nvim-treesitter",          build = ":TSUpdate" },
  "mhinz/vim-startify",
  "dstein64/vim-startuptime",
  "aklt/plantuml-syntax",
  "junegunn/limelight.vim",
  "junegunn/goyo.vim",
  "terrastruct/d2-vim",
  { "iamcco/markdown-preview.nvim", build = "cd app && yarn install" },
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",
  "preservim/nerdcommenter",
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/nvim-cmp",
  "AndrewRadev/splitjoin.vim",
  "Yggdroot/indentLine",
  "mileszs/ack.vim",
  "dag/vim-fish",
  {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp"
  },
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  "simrat39/symbols-outline.nvim",
  "ThePrimeagen/refactoring.nvim",
  "folke/trouble.nvim",
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  "sindrets/diffview.nvim",
  "antoinemadec/FixCursorHold.nvim",
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio"
    }
  },
  "sebdah/vim-delve",
  "pangloss/vim-javascript",
  "peitalin/vim-jsx-typescript",
  "jparise/vim-graphql",
  "leafgarland/typescript-vim",
  "MaxMEllon/vim-jsx-pretty",
  "dracula/vim",
  "AlessandroYorba/Alduin",
  "chriskempson/base16-vim",
  "arcticicestudio/nord-vim",
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme kanagawa]])
    end,
  },
  "pearofducks/ansible-vim",
  "hashivim/vim-terraform",
  "vim-scripts/avrasm.vim",
  "mfussenegger/nvim-jdtls",
  {
      "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        keys = {
          { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
          { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
        },
        config = true,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },
    keys = {
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
      { "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>dj", function() require("dap").down() end, desc = "Down" },
      { "<leader>dk", function() require("dap").up() end, desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
      { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>ds", function() require("dap").session() end, desc = "Session" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
}
