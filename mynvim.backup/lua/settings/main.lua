-- [[ Setting options ]]
-- See `:help vim.o`
local o = vim.o

o.path = '.,**'
o.wildmenu = true
o.wildignore = o.wildignore .. '**/node_modules/**'

o.wrap = false
o.scrolloff = 7

--[[ Search Options ]]
o.ignorecase = true
o.smartcase = true
-- o.showcase = true


-- Set highlight on search
o.hlsearch = false

-- Make line numbers default
o.number = true

-- Enable mouse mode
o.mouse = 'a'

-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Decrease update time
o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- set completeopt to have a better completion experience
o.completeopt = 'menuone,noselect'

require('settings/netrw')
