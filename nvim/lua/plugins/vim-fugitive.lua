return {
    'tpope/vim-fugitive',
    init = function()
        vim.keymap.set('n', '<leader>gs', function() vim.cmd('Git') end, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>gc', function() vim.cmd('Git commit') end, { desc = 'Telescope live grep' })
    end
}
