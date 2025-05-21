return {
    'stevearc/oil.nvim',
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    init = function()
        vim.api.nvim_create_user_command("O", "Oil", {})
    end,
    config = function()
        require("oil").setup()
    end,
    lazy = false,
}
