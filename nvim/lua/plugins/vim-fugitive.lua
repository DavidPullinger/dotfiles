return {
    'tpope/vim-fugitive',
    init = function()
        vim.keymap.set('n', '<leader>gs', function() vim.cmd('Git') end, { desc = 'Git status' })
        vim.keymap.set('n', '<leader>gc', function() vim.cmd('Git commit') end, { desc = 'Git commit' })
        vim.keymap.set('n', '<leader>gp', function() vim.cmd('Git push') end, { desc = 'Git push' })
        vim.keymap.set('n', '<leader>gb', function() vim.cmd('Git blame') end, { desc = 'Git blame' })
    end
}
