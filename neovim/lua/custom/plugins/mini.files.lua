return {
  'echasnovski/mini.files',
  lazy = false,
  config = function()
    require('mini.files').setup()
  end,
  version = false,

  event = { 'BufReadPost', 'BufNewFile' },

  keys = {
    { '<leader>\\', ':lua MiniFiles.open()<CR>', desc = 'MiniFiles open', silent = true },
  },
}
