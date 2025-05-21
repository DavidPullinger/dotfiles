return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    init = function() 
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Find files' })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Grep' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Find buffer' })
    end
}
