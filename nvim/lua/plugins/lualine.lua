return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            icons_enabled = true,
            component_separators = "|",
            section_separators = "",
            theme = "auto",
        },
        sections = {
            lualine_b = { "branch" },
            lualine_c = { "%F %m" },
            lualine_x = { "filetype" },
            lualine_y = { "diagnostics" },
            lualine_z = {},
        },
    }
}
