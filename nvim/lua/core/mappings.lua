vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<esc>:w<cr>")
vim.keymap.set({'n', 'v'}, ";", ":")
vim.keymap.set({'n', 'v'}, ":", ";")

-- NeoTree
-- vim.keymap.set('n', '<leader>e', ':Neotree float focus<CR>')
-- vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')
