local function find_folders()
  require('telescope.builtin').find_files({
    find_command = { 'fd', '--type', 'd', '--hidden', '--follow', '--exclude', '.git' },
    prompt_title = 'Find Folders',
  })
end

return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    init = function() 
        local builtin = require('telescope.builtin')
        -- actual searching --
        vim.keymap.set('n', '<leader>sf', builtin.fd, { desc = 'Find files' })
        vim.keymap.set('n', '<leader>sF', find_folders, { desc = 'Find folders' })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Grep' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Find buffer' })
        vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = 'Find in current buffer' })
        vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = 'Find old files' })
        -- QOL --
        vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Find in current buffer' })
    end
}
