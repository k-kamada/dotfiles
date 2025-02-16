return {
  'RRethy/vim-illuminate',
  config = function()
    require('illuminate').configure({
      filetypes_denylist = {
        'dirbuf',
        'dirvish',
        'fugitive',
        'json',
        'toml',
      },
    })
  end
}
