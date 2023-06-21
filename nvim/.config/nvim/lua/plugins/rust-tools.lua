return {
  "simrat39/rust-tools.nvim",
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',
    'mfussenegger/nvim-dap',
  },
  opts = function()
    return {
      tools = {
        -- rust-tools options

        -- how to execute terminal commands
        -- options right now: termopen / quickfix
        executor = require("rust-tools.executors").termopen,
        -- callback to execute once rust-analyzer is done initializing the workspace
        -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
        on_initialized = nil,
        -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
        reload_workspace_from_cargo_toml = true,
        -- These apply to the default RustSetInlayHints command
        inlay_hints = {
          -- automatically set inlay hints (type hints)
          -- default: true
          auto = true,
          -- Only show inlay hints for the current line
          only_current_line = false,
          -- whether to show parameter hints with the inlay hints or not
          -- default: true
          show_parameter_hints = true,
          -- prefix for parameter hints
          -- default: "<-"
          parameter_hints_prefix = "<- ",
          -- prefix for all the other hints (type, chaining)
          -- default: "=>"
          other_hints_prefix = "=> ",
          -- whether to align to the length of the longest line in the file
          max_len_align = false,
          -- padding from the left if max_len_align is true
          max_len_align_padding = 1,
          -- whether to align to the extreme right or not
          right_align = false,
          -- padding from the right if right_align is true
          right_align_padding = 7,
          -- The color of the hints
          highlight = "Comment",
        },
        -- options same as lsp hover / vim.lsp.util.open_floating_preview()
        hover_actions = {
          -- the border that is used for the hover window
          -- see vim.api.nvim_open_win()
          border = {
            { "╭", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╮", "FloatBorder" },
            { "│", "FloatBorder" },
            { "╯", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╰", "FloatBorder" },
            { "│", "FloatBorder" },
          },
          -- Maximal width of the hover window. Nil means no max.
          max_width = nil,
          -- Maximal height of the hover window. Nil means no max.
          max_height = nil,
          -- whether the hover action window gets automatically focused
          -- default: false
          auto_focus = false,
        },
        -- settings for showing the crate graph based on graphviz and the dot
        -- command
        crate_graph = {
          -- Backend used for displaying the graph
          -- see: https://graphviz.org/docs/outputs/
          -- default: x11
          backend = "x11",
          -- where to store the output, nil for no output stored (relative
          -- path from pwd)
          -- default: nil
          output = nil,
          -- true for all crates.io and external crates, false only the local
          -- crates
          -- default: true
          full = true,
          -- List of backends found on: https://graphviz.org/docs/outputs/
          -- Is used for input validation and autocompletion
          -- Last updated: 2021-08-26
          enabled_graphviz_backends = {
            "bmp",
            "cgimage",
            "canon",
            "dot",
            "gv",
            "xdot",
            "xdot1.2",
            "xdot1.4",
            "eps",
            "exr",
            "fig",
            "gd",
            "gd2",
            "gif",
            "gtk",
            "ico",
            "cmap",
            "ismap",
            "imap",
            "cmapx",
            "imap_np",
            "cmapx_np",
            "jpg",
            "jpeg",
            "jpe",
            "jp2",
            "json",
            "json0",
            "dot_json",
            "xdot_json",
            "pdf",
            "pic",
            "pct",
            "pict",
            "plain",
            "plain-ext",
            "png",
            "pov",
            "ps",
            "ps2",
            "psd",
            "sgi",
            "svg",
            "svgz",
            "tga",
            "tiff",
            "tif",
            "tk",
            "vml",
            "vmlz",
            "wbmp",
            "webp",
            "xlib",
            "x11",
          },
        },
      },
      -- all the opts to send to nvim-lspconfig
      -- these override the defaults set by rust-tools.nvim
      -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
      server = {
        -- standalone file support
        -- setting it to false may improve startup time
        standalone = true,
        on_attach = function(_, bufnr)
          local opts = { noremap = true, silent = true }
          -- Hover actions
          vim.keymap.set("n", "<C-space>", require('rust-tools').hover_actions.hover_actions, { buffer = bufnr })
          -- Code action groups
          vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
          -- Mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
            opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl',
            '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>bf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
        end,
      }, -- rust-analyzer options
      -- debugging stuff
      dap = {
        adapter = {
          type = "executable",
          command = "lldb-vscode",
          name = "rt_lldb",
        },
      },
    }
  end
}
