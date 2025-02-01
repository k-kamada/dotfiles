return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        style = {
          "#B600FF",
          "#FF0000",
        },
        duration = 100,
        delay = 50,
      },
      indent = {
        enable = true,
        style = {
          "#FFAFAF",
          "#FFF4AF",
          "#C6FFAF",
          "#AFFFDD",
          "#AFDDFF",
          "#C6AFFF",
          "#FFAFF4",
        }
      }
    })
  end
}

