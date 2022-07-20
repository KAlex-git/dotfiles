--local opt = { noremap = true, silent = true }
--local term_{ noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap -- Shorten function name
Mapper = require("nvim-mapper")        -- The same using nvim-mapper



--Remap space as leader key
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Shortcutting split navigation
keymap("n", "<A-h>", "<C-w>h", { noremap = true, silent = true })
keymap("n", "<A-j>", "<C-w>j", { noremap = true, silent = true })
keymap("n", "<A-k>", "<C-w>k", { noremap = true, silent = true })
keymap("n", "<A-l>", "<C-w>l", { noremap = true, silent = true })
-- ** Focus shortcuting split navigation, saving a keypress: ** --
keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })


-- ** Fix Navigation ** --
keymap('n', 'J', '5j', {noremap = true})
keymap('v', 'J', '5j', {noremap = true})
keymap('n', 'K', '5k', {noremap = true})
keymap('v', 'K', '5k', {noremap = true})

keymap('n', 'L', '$', {noremap = true})
keymap('v', 'L', '$', {noremap = true})
keymap('n', 'H', '^', {noremap = true})
keymap('v', 'H', '^', {noremap = true})

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Down>", ":resize +2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })

-- Navigate buffers
--keymap("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true })
--keymap("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true })
keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
keymap('n', '<A-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })

-- Sed Command
keymap('n', 'S', ':%s/\\V/g<Left><Left>', { noremap = true })
keymap("n", "_", ":%s/\\s/_/g<CR>", { noremap = true, silent = true })

keymap('c', ':q', ':q!<CR>', { noremap = true, silent = true })              -- Exit
keymap('c', ':Q', ':q!<CR>', { noremap = true, silent = true })              -- Exit
keymap('c', ':Wq', ':wq!<CR>', { noremap = true, silent = true })              -- Exit

-- Save file as sudo on files that require root permission
vim.cmd([[ cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit! ]])
keymap('c', ':w!!', 'w!! execute \'silent! write !sudo tee % >/dev/null\' <bar> edit!', { noremap = true, silent = false })              -- Exit

-- center screen after search
keymap('n', 'n', 'nzzzv', { noremap = true})
keymap('n', 'N', 'Nzzzv', { noremap = true})

keymap('n', '<C-a>', 'ggVG', {noremap = true}) -- set Ctrl+a as select all
Mapper.map('n', '<C-a>', "ggVG", { noremap = true}, "select text all", "select text", "analog Ctrl+a as select all text")

keymap('n', '<C-g>', ':Goyo <bar> <CR>', { noremap = true, silent = true }) -- Goyo
keymap('n', '<A-.>', ':Goyo <bar> <CR>', { noremap = true, silent = true }) -- Goyo
Mapper.map('n', '<C-g> <A-.>', ":Goyo <bar> <CR>", { noremap = true, silent = true }, "Goyo", "text center", "Center previewer and edit")

-- Start scripts (Luke Smith)
keymap('n', ',c', ':w! | !compiler "<c-r>%"<CR>', { noremap = true, silent = true })
keymap('n', ',w', ':w! | !opout <c-r>%<CR><CR>', { noremap = true, silent = true })

-- Fix Y behaviour
keymap('n', 'Y', 'y$', { noremap = true, silent = true })


-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jj", "<ESC>", { noremap = true, silent = true })

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", { noremap = true, silent = true })
keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
keymap("v", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
keymap("v", "p", '"_dP', { noremap = true, silent = true })

-- Visual Block --
-- Move text up and down
keymap("v", "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
keymap("v", "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })

-- Tab shortcuts
keymap('n', '<A-p>', ':tabp<CR>', { noremap = true})
keymap('n', '<A-n>', ':tabn<CR>', { noremap = true})

-- Tab
keymap('n', '<A-t>', ':tabnew<CR>', { noremap = true})
keymap('n', '<A-2>', ':tabmove +<CR>', { noremap = true})
keymap('n', '<A-1>', ':tabmove -<CR>', { noremap = true})

-- Abbreviature
vim.cmd ([[
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
]])


keymap('n', ',M', ':Telescope mapper<CR>', { noremap = true})

-- Basic file system commands
--keymap('n', '<A-o>', ':!touch<Space>', { noremap = true})
--keymap('n', '<A-e>', ':!crf<Space>', { noremap = true})
--keymap('n', '<A-d>', ':!mkdir<Space>', { noremap = true})


