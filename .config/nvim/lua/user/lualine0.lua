-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}
local colors = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },

    x = { fg = colors.black, bg = colors.violet },
    y = { fg = colors.white, bg = colors.grey },
    z = { fg = colors.grey, bg = colors.cyan },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },

    x = { fg = colors.black, bg = colors.violet },
    y = { fg = colors.white, bg = colors.grey },
    z = { fg = colors.grey, bg = colors.cyan },

  },
}

local function spelllang()
  return [[%{&spelllang}]]
end

local function enc()
  return [[%{''.(&fenc!=''?&fenc:&enc).''}]]
end

local function rownum()
  return [[row:%l/%L (%03p%%)]]
end


require('lualine').setup {
  options = {
    theme = colors,
    component_separators = '|',
    section_separators = { left = '', right = ''} 
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch',
          { 'filename', path = 3 },

      },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = {  enc, 'filetype' },
    lualine_z = { rownum, "os.date('%H:%M%P')", 'date' },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
