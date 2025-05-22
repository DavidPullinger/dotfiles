vim.defer_fn(function()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "c",
      "cpp",
      "lua",
      "python",
      "tsx",
      "javascript",
      "typescript",
      "bash",
      "php",
    },
    highlight = { enable = true },
    indent = { enable = true },
  })
end, 0)

return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
}
