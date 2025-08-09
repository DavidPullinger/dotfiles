local function augroup(name)
  return 
end

vim.api.nvim_create_autocmd("VimEnter", {
  -- vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
  callback = function()
    if require("lazy.status").has_updates then
      require("lazy").update({ show = false, })
    end
  end,
})

vim.api.nvim_create_autocmd({'BufRead','BufNewFile'}, {
  -- vim.api.nvim_create_augroup("snippets_" .. name, { clear = true })
  pattern = {"*.php"}, callback = function(ev)
    -- return early if NOT opening brand new file or creating new one
    filesize = vim.fn.getfsize(vim.fn.expand('%'))
    if not (filesize == -1 or filesize == 0) then return end

    -- get directory and basename
    dir = vim.fn.expand('%:r'):gsub('/','\\\\')
    basename = vim.fn.expand('%:t:r')

    -- read in stub template and replace placeholders
    vim.cmd(':0r ~/.config/nvim/data/templates/stub.php')
    vim.cmd(':%s/%dir%/' .. dir)
    vim.cmd(':%s/%basename%/' .. basename)
  end,
})
