return {
  "fatih/vim-go",
  {
    "nvim-neotest/neotest-go", -- depends on nvim-neotest,
    dependencies = {
      "nvim-neotest/neotest",
    }
  },
  {
    "leoluz/nvim-dap-go",
    dependencies = {
      "nvim-dap"
    },
    config = true
  }
}
