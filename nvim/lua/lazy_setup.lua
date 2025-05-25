local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  change_detection = { enabled = false },
  spec = {
    { import = "plugins" },
  },
  install = {
    colorscheme = { 'default' },
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
