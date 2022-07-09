local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
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
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)
-- ** Focus shortcuting split navigation, saving a keypress: ** --
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


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
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
--keymap("n", "<S-l>", ":bnext<CR>", opts)
--keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)
keymap('n', '<A-Tab>', ':BufferLineCyclePrev<CR>', opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Sed Command
keymap('n', 'S', ':%s/\\V/g<Left><Left>', { noremap = true })
keymap("n", "_", ":%s/\\s/_/g<CR>", opts)

keymap('c', ':q', ':q!<CR>', opts)              -- Exit
keymap('c', ':Q', ':q!<CR>', opts)              -- Exit
keymap('c', ':Wq', ':wq!<CR>', opts)              -- Exit
-- Save file as sudo on files that require root permission
vim.cmd [[ cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit! ]]

-- center screen after search
keymap('n', 'n', 'nzzzv', { noremap = true})
keymap('n', 'N', 'Nzzzv', { noremap = true})

keymap('n', '<C-a>', 'ggVG', {noremap = true}) -- set Ctrl+a as select all

keymap('n', '<C-g>', ':Goyo <bar> <CR>', opts) -- Goyo
keymap('n', '<A-.>', ':Goyo <bar> <CR>', opts) -- Goyo

-- Start scripts (Luke Smith)
keymap('n', ',c', ':w! | !compiler "<c-r>%"<CR>', opts)
keymap('n', ',w', ':w! | !opout <c-r>%<CR><CR>', opts)

-- Fix Y behaviour
keymap('n', 'Y', 'y$', opts)


-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("v", "J", ":move '>+1<CR>gv-gv", opts)
keymap("v", "K", ":move '<-2<CR>gv-gv", opts)

-- Tab shortcuts
keymap('n', '<A-p>', ':tabp<CR>', { noremap = true})
keymap('n', '<A-n>', ':tabn<CR>', { noremap = true})

-- Tab
keymap('n', '<A-t>', ':tabnew<CR>', { noremap = true})
keymap('n', '<A-2>', ':tabmove +<CR>', { noremap = true})
keymap('n', '<A-1>', '::tabmove -<CR>', { noremap = true})


-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


-- Basic file system commands
--keymap('n', '<A-o>', ':!touch<Space>', { noremap = true})
--keymap('n', '<A-e>', ':!crf<Space>', { noremap = true})
--keymap('n', '<A-d>', ':!mkdir<Space>', { noremap = true})
--keymap('n', '<A-e>', ':!mv<Space>%<Space>', { noremap = true})

