return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      dependencies = {
        "nvim-tree/nvim-web-devicons"
      },
      options = {
        icons_enabled = true,
        section_separators = '',
        component_separators = '',
        theme = 'gruvbox'
      }
    }
  end
}