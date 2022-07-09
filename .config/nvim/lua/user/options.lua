local home = vim.env.HOME
local config = home .. '/.config/nvim'
local exec = vim.api.nvim_exec  -- execute Vimscript

local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  --pumheight = 10,                          -- pop up menu height
  pumblend  = 10,   -- pseudo-transparency for popup-men
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  whichwrap   = 'b,h,l,s,<,>,[,],~',                   -- allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
  scrolloff = 3,                           -- start scrolling 3 lines before edge of viewport 
  sidescrolloff = 8,
  guifont = "FiraCode Nerd Font:Bold Italic:h17:antialias=true:autohint=true",               -- the font used in graphical neovim applications
  spelllang     = { 'en_us', 'ru' },       -- Словари рус eng
  -- Set folding
  viewdir     = config .. '/view',         -- where to store files for :mkview
  viewoptions = 'cursor,folds',            -- save/restore just these (with `:{mk,load}view`)
  textwidth     = 80,                      -- automatically hard wrap at 80 columns
}

vim.opt.shell         = 'sh'                    -- shell to use for `!`, `:!`, `system()` etc.
vim.opt.shiftround    = false                   -- don't always indent by multiple of shiftwidth
vim.opt.shiftwidth    = 2                       -- spaces per tab (when shifting)
vim.opt.shortmess     = vim.opt.shortmess + 'A' -- ignore annoying swapfile messages
vim.opt.shortmess     = vim.opt.shortmess + 'I' -- no splash screen
vim.opt.shortmess     = vim.opt.shortmess + 'O' -- file-read message overwrites previous
vim.opt.shortmess     = vim.opt.shortmess + 'T' -- truncate non-file messages in middle
vim.opt.shortmess     = vim.opt.shortmess + 'W' -- don't echo "[w]"/"[written]" when writing
vim.opt.shortmess     = vim.opt.shortmess + 'a' -- use abbreviations in messages eg. `[RO]` instead of `[readonly]`
vim.opt.shortmess     = vim.opt.shortmess + 'c' -- completion messages
vim.opt.shortmess     = vim.opt.shortmess + 'o' -- overwrite file-written messages
vim.opt.shortmess     = vim.opt.shortmess + 't' -- truncate file messages at start
vim.opt.showbreak     = '↳ '                    -- DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
vim.opt.showcmd       = false                   -- don't show extra info at end of command line

for k, v in pairs(options) do
  vim.opt[k] = v
end

--vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-----
vim.opt.list           = true                              -- show whitespace
vim.opt.listchars      = {
  nbsp                 = '⦸',                              -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
  extends              = '»',                              -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
  precedes             = '«',                              -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
  tab                  = '▷⋯',                             -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + MIDLINE HORIZONTAL ELLIPSIS (U+22EF, UTF-8: E2 8B AF)
  trail                = '•',                              -- BULLET (U+2022, UTF-8: E2 80 A2)
}

---------------------------------------------------------
-- TODO split new window and open files-shortcuts {{{
---------------------------------------------------------
-- Load command shortcuts generated from bm-dirs and bm-files via shortcuts script.
-- Here leader is ";".
-- So ":vs ;cfz" will expand into ":vs /home/<user>/.config/zsh/.zshrc"
-- if typed fast without the timeout.
exec([[
augroup !shortcuts
  au!
  au BufWritePost, bm-files,bm-dirs, !shortcuts
  source ~/.config/nvim/shortcuts.vim
augroup END
]],
true)

vim.cmd([[
	autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
	autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
]])
-- }}}


-----------------------------------------------------------
-- TODO Corpus notes, wiki {{{
--------------------------------------------------
-- Change keys in file: ~/.local/share/nvim/site/pack/packer/start/corpus/lua/corpus/init.lua
-- key map <C-j> next files
-- key map <C-l> prev files
vim.api.nvim_set_keymap('n', ',k', ':Corpus<space><Tab>', {noremap = true, silent =false})

     -- init.lua (as Lua global):
     CorpusDirectories = {
       ['~/Documents/Corpus'] = {
            autocommit = true,
            autoreference = 1,
            autotitle = 0,
            base = './',
            transform = 'local',
         },
         ['~/.local/share/wiki'] = {
            autocommit = false,
            autoreference = 1,
            autotitle = 1,
            base = '/wiki/',
            tags = {'wiki'},
            transform = 'web',
         },
     }

-- Specifies the highlight group applied to the currently selected item in the
    -- chooser listing (the left-hand pane). To override from the default value of
    -- "PMenuSel", set a different value in your |init.vim|:
--vim.g:CorpusChooserSelectionHighlight = 'PMenuSel'
--vim.g:CorpusLoaded = 1
--vim.g.CorpusBangCreation = 1


-- vim: foldmethod=marker


