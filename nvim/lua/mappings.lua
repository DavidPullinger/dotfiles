vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- for navigating quick fix list
vim.keymap.set("n", "<C-j>", ":cnext<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":cprev<CR>", { silent = true })
